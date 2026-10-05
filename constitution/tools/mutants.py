#!/usr/bin/env python3
"""Mutation check: do the fixtures discriminate the rules they bind?

Each mutant changes the program in one place: a rule deleted, or one body
literal dropped or its sign flipped. A mutant is killed when, with some
fixture, it no longer grounds, has other than one model, or breaks an
assertion. Every rule deletion must be killed. A surviving literal mutant
must be listed in mutants-allowed.tsv with the reason it is harmless (a type
guard implied by another literal, for example); a listed mutant that is
killed is reported too, so the list stays exact.

  mutants.py            run; exit 1 on an unkilled deletion or an unlisted survivor
"""
import glob
import os
import re
import sys

import clingo
from clingo import ast

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)


def load_fixtures(sub=""):
    out = []
    for p in sorted(glob.glob(os.path.join(ROOT, "fixtures", sub, "*.lp"))):
        src = open(p, encoding="utf-8").read()
        asserts = re.findall(r"^\s*%\s*(EXPECT|EXPECT-NOT)\[[A-Z]+[0-9]*\.[0-9]+\]:\s*(.+?)\s*$", src, re.M)
        out.append((os.path.basename(p), src, asserts))
    return out


def load_rules(sub=""):
    rules = []
    for p in sorted(glob.glob(os.path.join(ROOT, "program", sub, "*.lp"))):
        stmts = []
        ast.parse_string(open(p, encoding="utf-8").read(), stmts.append)
        rules += [(os.path.basename(p), st) for st in stmts if st.ast_type == ast.ASTType.Rule]
    return rules


def killed(rules, fixtures):
    prog = "\n".join(str(r) for r in rules)
    for _, src, asserts in fixtures:
        ctl = clingo.Control(["0", "--warn=none"], logger=lambda code, msg: None)
        try:
            ctl.add("base", [], prog + "\n" + src)
            ctl.ground([("base", [])])
        except RuntimeError:
            return True
        models = []
        ctl.solve(on_model=lambda m: models.append({str(s) for s in m.symbols(atoms=True)}))
        if len(models) != 1:
            return True
        for kind, atom in asserts:
            if (kind == "EXPECT") != (atom in models[0]):
                return True
    return False


def mutants(st):
    yield "delete", None
    for j, lit in enumerate(st.body):
        if lit.ast_type != ast.ASTType.Literal:
            continue
        rest = [b for k, b in enumerate(st.body) if k != j]
        yield "drop %s" % lit, ast.Rule(st.location, st.head, rest)
        if lit.atom.ast_type == ast.ASTType.SymbolicAtom:
            sign = ast.Sign.Negation if lit.sign == ast.Sign.NoSign else ast.Sign.NoSign
            body = [ast.Literal(b.location, sign, b.atom) if k == j else b for k, b in enumerate(st.body)]
            yield "flip %s" % lit, ast.Rule(st.location, st.head, body)


def key(st, label):
    return "%s | %s" % (str(st), label)


def main():
    # the program in force against its fixtures; then the proposed rules,
    # loaded beside it, against theirs (program/proposed/, fixtures/proposed/)
    in_force = load_rules()
    passes = [([], in_force, load_fixtures()), ([st for _, st in in_force], load_rules("proposed"),
                                                load_fixtures("proposed"))]
    for fixed, rules, fixtures in passes:
        if killed(fixed + [st for _, st in rules], fixtures):
            print("FAIL mutants    the unmutated program fails a fixture")
            return 1
    allowed = {}
    path = os.path.join(HERE, "mutants-allowed.tsv")
    for line in open(path, encoding="utf-8").read().splitlines()[1:]:
        if line.strip():
            k, why = line.rsplit("\t", 1)
            allowed[k] = why
    total = 0
    survivors = []
    errors = []
    for fixed, rules, fixtures in passes:
        base = [st for _, st in rules]
        for i, (f, st) in enumerate(rules):
            for label, m in mutants(st):
                total += 1
                prog = fixed + base[:i] + ([] if m is None else [m]) + base[i + 1:]
                if killed(prog, fixtures):
                    continue
                k = key(st, label)
                survivors.append(k)
                if label == "delete":
                    errors.append("%s: deleting this rule changes no assertion: %s" % (f, st))
                elif k not in allowed:
                    errors.append("%s: surviving mutant not in mutants-allowed.tsv: %s" % (f, k))
    for k in sorted(set(allowed) - set(survivors)):
        errors.append("mutants-allowed.tsv lists a mutant that is now killed: %s" % k)
    print("mutants %d, killed %d, surviving %d (all listed with a reason)" % (total, total - len(survivors), len(survivors))
          if not errors else "mutants %d, surviving %d" % (total, len(survivors)))
    for e in errors:
        print("FAIL mutants    " + e)
    if "--list" in sys.argv[1:]:
        for k in survivors:
            print("SURVIVOR\t" + k)
    return 1 if errors else 0


if __name__ == "__main__":
    sys.exit(main())
