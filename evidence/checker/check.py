#!/usr/bin/env python3
"""Fragment checker for the constitution's reference programs (clause C6).

For every .lp file it is given (a directory means every *.lp in it):
  1. parse with clingo's AST;
  2. build the predicate dependency graph and check that no negative edge and
     no aggregate edge lies inside a strongly connected component (stratified
     negation AND stratified count, as C6 requires);
  3. check every rule is range-restricted (own check + clingo's safety check);
  4. check arithmetic (and non-count aggregates) occur only in non-recursive
     strata (C6);
  5. ground + solve with clingo and count answer sets (a stratified program
     has exactly one model per fact set, which is what replay needs);
  6. compare the model against `% EXPECT:` / `% EXPECT-NOT:` lines in the file.

Output is one block per program plus a summary table.  The exit status is 1
if any expectation fails or any program fails to ground, 0 otherwise; a
program reported non-stratified is not a failure (some fixtures exist to show
exactly that).

Usage:  check.py DIR_OR_FILE [DIR_OR_FILE ...]
"""
import glob
import os
import re
import sys

import clingo
from clingo import ast

HERE = os.path.dirname(os.path.abspath(__file__))

# ---------------------------------------------------------------- AST helpers

def walk(node):
    """Yield every AST node below (and including) node."""
    if isinstance(node, ast.AST):
        yield node
        for key in node.child_keys:
            val = getattr(node, key)
            if isinstance(val, ast.AST):
                yield from walk(val)
            elif isinstance(val, (list, tuple, ast.ASTSequence)):
                for v in val:
                    yield from walk(v)


def variables(node):
    return {n.name for n in walk(node) if n.ast_type == ast.ASTType.Variable}


def has_arith(node):
    return any(n.ast_type in (ast.ASTType.BinaryOperation, ast.ASTType.UnaryOperation)
               for n in walk(node))


def pred_of_symbolic(atom):
    sym = atom.symbol
    if sym.ast_type == ast.ASTType.Function:
        return (sym.name, len(sym.arguments))
    return (str(sym), 0)


AGG_NAMES = {0: "count", 1: "sum", 2: "sum+", 3: "min", 4: "max"}


class Rule:
    def __init__(self, st):
        self.st = st
        self.head = None          # (name, arity)
        self.pos = []             # positive body preds
        self.neg = []             # negated body preds
        self.agg = []             # preds inside aggregates
        self.agg_funcs = []       # aggregate function names used
        self.arith = False
        self.head_vars = set()
        self.pos_vars = set()     # vars bound by positive symbolic literals
        self.other_vars = set()   # vars in negs / comparisons (must be bound)
        self.assign = []          # (var, set(vars on the rhs)) for V = expr / V = #agg{}
        self.is_fact = len(st.body) == 0
        self.text = str(st)
        self._analyse()

    def _analyse(self):
        h = self.st.head
        if h.ast_type == ast.ASTType.Literal and h.atom.ast_type == ast.ASTType.SymbolicAtom:
            self.head = pred_of_symbolic(h.atom)
            self.head_vars = variables(h)
            if has_arith(h):
                self.arith = True
        else:
            self.head = ("<non-atomic-head:%s>" % h.ast_type.name, 0)
        for lit in self.st.body:
            self._body_literal(lit)

    def _body_literal(self, lit):
        if lit.ast_type == ast.ASTType.ConditionalLiteral:
            # not used in these programs; treat like an aggregate (non-monotone)
            self.agg.append(("<condlit>", 0))
            return
        atom = lit.atom
        if atom.ast_type == ast.ASTType.SymbolicAtom:
            p = pred_of_symbolic(atom)
            if has_arith(atom):
                self.arith = True
            if lit.sign == ast.Sign.NoSign:
                self.pos.append(p)
                self.pos_vars |= variables(atom)
            else:
                self.neg.append(p)
                self.other_vars |= variables(atom)
        elif atom.ast_type == ast.ASTType.Comparison:
            if has_arith(atom):
                self.arith = True
            # assignment form  V = expr
            guards = atom.guards
            if (len(guards) == 1 and atom.term.ast_type == ast.ASTType.Variable
                    and guards[0].comparison == ast.ComparisonOperator.Equal):
                self.assign.append((atom.term.name, variables(guards[0].term)))
                self.other_vars |= variables(guards[0].term)
            else:
                self.other_vars |= variables(atom)
        elif atom.ast_type == ast.ASTType.BodyAggregate:
            self.agg_funcs.append(AGG_NAMES.get(atom.function, str(atom.function)))
            local = set()
            for el in atom.elements:
                for cond in el.condition:
                    if cond.atom.ast_type == ast.ASTType.SymbolicAtom:
                        self.agg.append(pred_of_symbolic(cond.atom))
                        # aggregate-local variables: bound inside the element
                        local |= variables(cond.atom)
                    elif has_arith(cond):
                        self.arith = True
                for t in el.terms:
                    local |= variables(t)
            # guards:  V = #count{...}  binds V
            for g in (atom.left_guard, atom.right_guard):
                if g is None:
                    continue
                if g.term.ast_type == ast.ASTType.Variable and g.comparison == ast.ComparisonOperator.Equal:
                    self.assign.append((g.term.name, set()))
                else:
                    self.other_vars |= variables(g.term)
                    if has_arith(g.term):
                        self.arith = True
        else:
            self.agg.append(("<%s>" % atom.ast_type.name, 0))

    def range_restricted(self):
        """Every head/negative/comparison variable is bound by a positive
        literal or an assignment whose right-hand side is bound."""
        safe = set(self.pos_vars)
        changed = True
        while changed:
            changed = False
            for v, rhs in self.assign:
                if v not in safe and rhs <= safe:
                    safe.add(v)
                    changed = True
        need = self.head_vars | self.other_vars
        return need <= safe, need - safe


# ------------------------------------------------------------ graph analysis

def tarjan(nodes, edges):
    """edges: dict node -> set(node). Returns dict node -> scc id."""
    index = {}
    low = {}
    onstack = set()
    stack = []
    result = {}
    counter = [0]
    scc_id = [0]

    sys.setrecursionlimit(10000)

    def strong(v):
        index[v] = low[v] = counter[0]
        counter[0] += 1
        stack.append(v)
        onstack.add(v)
        for w in edges.get(v, ()):
            if w not in index:
                strong(w)
                low[v] = min(low[v], low[w])
            elif w in onstack:
                low[v] = min(low[v], index[w])
        if low[v] == index[v]:
            while True:
                w = stack.pop()
                onstack.discard(w)
                result[w] = scc_id[0]
                if w == v:
                    break
            scc_id[0] += 1

    for v in nodes:
        if v not in index:
            strong(v)
    return result


def analyse(path):
    src = open(path).read()
    stmts = []
    ast.parse_string(src, stmts.append)
    rules = [Rule(s) for s in stmts if s.ast_type == ast.ASTType.Rule]
    nodes = set()
    edges = {}
    labelled = []  # (src, dst, kind)
    for r in rules:
        nodes.add(r.head)
        for p in r.pos:
            nodes.add(p); edges.setdefault(p, set()).add(r.head); labelled.append((p, r.head, "pos"))
        for p in r.neg:
            nodes.add(p); edges.setdefault(p, set()).add(r.head); labelled.append((p, r.head, "neg"))
        for p in r.agg:
            nodes.add(p); edges.setdefault(p, set()).add(r.head); labelled.append((p, r.head, "agg"))
    scc = tarjan(nodes, edges)

    findings = []
    ok_strat = True
    for s, d, kind in labelled:
        if kind in ("neg", "agg") and scc[s] == scc[d]:
            ok_strat = False
            findings.append("NOT STRATIFIED: %s edge %s/%d -> %s/%d inside a recursive component"
                            % (kind, s[0], s[1], d[0], d[1]))
    ok_rr = True
    ok_arith = True
    ok_aggfun = True
    for r in rules:
        if r.is_fact:
            continue
        rr, missing = r.range_restricted()
        if not rr:
            ok_rr = False
            findings.append("NOT RANGE-RESTRICTED (%s): %s" % (",".join(sorted(missing)), r.text))
        recursive = any(scc[p] == scc[r.head] for p in r.pos + r.neg + r.agg)
        if r.arith and recursive:
            ok_arith = False
            findings.append("ARITHMETIC IN RECURSIVE STRATUM: %s" % r.text)
        for f in r.agg_funcs:
            if f != "count":
                ok_aggfun = False
                findings.append("NON-COUNT AGGREGATE #%s (C6 admits count only): %s" % (f, r.text))
    strata = {}
    # stratum numbers: longest path over SCC condensation (informational)
    n_rules = sum(1 for r in rules if not r.is_fact)
    n_facts = sum(1 for r in rules if r.is_fact)
    return src, dict(stratified=ok_strat, range_restricted=ok_rr, arith_ok=ok_arith,
                     count_only=ok_aggfun, findings=findings, n_rules=n_rules,
                     n_facts=n_facts, n_sccs=len(set(scc.values())))


# ------------------------------------------------------------------- solving

def solve(src):
    models = []
    ctl = clingo.Control(["0", "--warn=none"])
    try:
        ctl.add("base", [], src)
        ctl.ground([("base", [])])
    except RuntimeError as e:  # unsafe variables etc.
        return None, str(e)
    ctl.solve(on_model=lambda m: models.append({str(s) for s in m.symbols(atoms=True)}))
    return models, None


def expectations(src):
    exp, notexp = [], []
    for line in src.splitlines():
        m = re.match(r"\s*%\s*EXPECT:\s*(.+?)\s*$", line)
        if m:
            exp.append(m.group(1))
        m = re.match(r"\s*%\s*EXPECT-NOT:\s*(.+?)\s*$", line)
        if m:
            notexp.append(m.group(1))
    return exp, notexp


def main():
    files = []
    for arg in sys.argv[1:] or [HERE]:
        if os.path.isdir(arg):
            files += sorted(glob.glob(os.path.join(arg, "*.lp")))
        else:
            files.append(arg)
    summary = []
    for path in files:
        name = os.path.basename(path)
        print("=" * 78)
        print(name)
        print("=" * 78)
        src, a = analyse(path)
        print("rules: %d  facts: %d  components: %d" % (a["n_rules"], a["n_facts"], a["n_sccs"]))
        print("stratified (neg+count): %s" % a["stratified"])
        print("range-restricted (own check): %s" % a["range_restricted"])
        print("arithmetic only in non-recursive strata: %s" % a["arith_ok"])
        print("count is the only aggregate: %s" % a["count_only"])
        for f in a["findings"]:
            print("  ! " + f)
        models, err = solve(src)
        if err:
            print("clingo grounding error (unsafe = not range-restricted): %s" % err.strip())
            summary.append((name, a, None, 0, 0, err))
            continue
        print("answer sets: %d" % len(models))
        exp, notexp = expectations(src)
        model = models[0] if models else set()
        passed = failed = 0
        for e in exp:
            ok = e in model
            print("  EXPECT     %-45s %s" % (e, "ok" if ok else "MISSING"))
            passed += ok; failed += (not ok)
        for e in notexp:
            ok = e not in model
            print("  EXPECT-NOT %-45s %s" % (e, "ok" if ok else "PRESENT"))
            passed += ok; failed += (not ok)
        if len(models) > 1:
            print("  (multiple models: expectations checked against the first; determinism FAILS)")
        summary.append((name, a, len(models), passed, failed, None))
    print()
    print("=" * 78)
    print("SUMMARY")
    print("=" * 78)
    print("%-38s %-6s %-6s %-6s %-6s %-7s %s" % ("program", "strat", "rr", "arith", "count", "models", "expect"))
    for name, a, nm, p, f, err in summary:
        print("%-38s %-6s %-6s %-6s %-6s %-7s %s" % (
            name, a["stratified"], a["range_restricted"], a["arith_ok"], a["count_only"],
            "ERR" if nm is None else nm, ("%d/%d" % (p, p + f)) if err is None else "n/a"))
    return 1 if any(err is not None or f for _, _, _, _, f, err in summary) else 0


if __name__ == "__main__":
    sys.exit(main())
