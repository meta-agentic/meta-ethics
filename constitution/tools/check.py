#!/usr/bin/env python3
"""Mechanical checks of the consolidated L0 (constitution/DESIGN.md).

  check.py                 run every check; exit 1 on any failure
  check.py --write-manifest  recompute MANIFEST.json, then run every check

Checks:
  prose      every numbered paragraph of L0.md has one inventory row and back;
             no amendment narrative in the prose
  sources    every source names a unit or section of the records, and every
             unit of the records is a source or listed in unmapped.tsv
  vocabulary every predicate the program and fixtures use is declared, at its
             arity, in its class
  fragment   the whole program is stratified (negation and #count), range-
             restricted, arithmetic only in non-recursive strata, #count the
             only aggregate (C6), using evidence/checker/check.py's analysis;
             only normal rules with an atom as head
  symmetry   no party constant in a rule; party terms compared only by !=
             (C1); no rule mints an object (C6)
  kinds      no derivation rule reads the kind of a party, a kind constant or a
             consequence (C13)
  binding    every rule carries a clause tag naming a `program` paragraph; each
             `program` paragraph has a rule and a positive and a negative
             fixture assertion
  fixtures   every fixture is facts only, input predicates only; the program
             with it has exactly one model, and every assertion holds
  parameters every parameter the prose declares or the program reads has a
             row, its clause exists and its floor parses
  selftest   each check refuses a program built to violate it
  manifest   MANIFEST.json matches the tree
"""
import glob
import importlib.util
import json
import os
import re
import sys
import tempfile

import clingo
from clingo import ast

from textchecks import (ROOT, REPO, RECORDS, INPUT_CLASSES, RULE_CLASSES, SKIP, fail, read_tsv,
                  check_prose, check_sources, check_parameters, check_manifest, build_manifest)
import textchecks as text

# ------------------------------------------------------------ vocabulary

def load_vocabulary(inv_ids):
    vocab = {}
    for r in read_tsv("vocabulary.tsv"):
        sorts = [s for s in r["sorts"].split(",") if s]
        key = (r["predicate"], len(sorts))
        if key in vocab:
            fail("vocabulary", "%s/%d declared twice" % key)
        if r["class"] not in INPUT_CLASSES | RULE_CLASSES:
            fail("vocabulary", "%s: unknown class %r" % (r["predicate"], r["class"]))
        if r["clause"] not in inv_ids:
            fail("vocabulary", "%s: clause %s is not a paragraph of L0.md" % (r["predicate"], r["clause"]))
        if not r["gloss"].strip():
            fail("vocabulary", "%s: no gloss" % r["predicate"])
        vocab[key] = dict(sorts=sorts, cls=r["class"], clause=r["clause"])
    return vocab


# ------------------------------------------------------------- AST walks

def walk(node):
    if isinstance(node, ast.AST):
        yield node
        for key in node.child_keys:
            val = getattr(node, key)
            if isinstance(val, ast.AST):
                yield from walk(val)
            elif isinstance(val, (list, tuple, ast.ASTSequence)):
                for v in val:
                    yield from walk(v)


def symbolic_atoms(node):
    for n in walk(node):
        if n.ast_type == ast.ASTType.SymbolicAtom:
            yield n


def atom_sig(atom):
    sym = atom.symbol
    if sym.ast_type == ast.ASTType.Function:
        return sym.name, list(sym.arguments)
    return str(sym), []


def is_constant(t):
    return (t.ast_type == ast.ASTType.SymbolicTerm or
            (t.ast_type == ast.ASTType.Function and not t.arguments))


def parse_file(path):
    src = open(path, encoding="utf-8").read()
    stmts = []
    ast.parse_string(src, stmts.append)
    return src, stmts


def clause_tags(src):
    """line number -> list of clause ids in force from that line on."""
    tags = {}
    for n, line in enumerate(src.splitlines(), 1):
        m = re.match(r"\s*%\s*clause:\s*(.+?)\s*$", line)
        if m:
            tags[n] = m.group(1).split()
    return tags


def tag_at(tags, line):
    best = None
    for n in sorted(tags):
        if n <= line:
            best = tags[n]
    return best


# --------------------------------------------------------------- program

def check_program(vocab, status):
    files = sorted(glob.glob(os.path.join(ROOT, "program", "*.lp")))
    programmed = {}           # clause id -> number of rules
    combined = []
    n_rules = 0
    for path in files:
        name = os.path.relpath(path, ROOT)
        src, stmts = parse_file(path)
        combined.append(src)
        tags = clause_tags(src)
        for st in stmts:
            t = st.ast_type
            if t in SKIP:
                continue
            if t != ast.ASTType.Rule:
                fail("fragment", "%s:%d: statement %s is outside the fragment" % (name, st.location.begin.line, t.name))
                continue
            line = st.location.begin.line
            where = "%s:%d" % (name, line)
            n_rules += 1
            head = st.head
            if not (head.ast_type == ast.ASTType.Literal and head.atom.ast_type == ast.ASTType.SymbolicAtom
                    and head.sign == ast.Sign.NoSign):
                fail("fragment", "%s: head is not an atom (choice, disjunction or constraint): %s" % (where, st))
                continue
            if not st.body:
                fail("binding", "%s: a fact in the program; facts belong to the record: %s" % (where, st))
            tag = tag_at(tags, line)
            if not tag:
                fail("binding", "%s: rule carries no clause tag" % where)
            else:
                for cid in tag:
                    if status.get(cid) != "program":
                        fail("binding", "%s: tag %s is not a `program` paragraph (%s)" % (where, cid, status.get(cid)))
                    programmed[cid] = programmed.get(cid, 0) + 1
            check_rule(st, vocab, where)
    # the whole program, through the evidence checker's analysis
    spec = importlib.util.spec_from_file_location("evidence_check", os.path.join(REPO, "evidence/checker/check.py"))
    ev = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(ev)
    with tempfile.NamedTemporaryFile("w", suffix=".lp", delete=False) as tmp:
        tmp.write("\n".join(combined))
    try:
        _, a = ev.analyse(tmp.name)
    finally:
        os.unlink(tmp.name)
    for k, label in (("stratified", "stratified negation and #count"), ("range_restricted", "range restriction"),
                     ("arith_ok", "arithmetic only in non-recursive strata"), ("count_only", "#count the only aggregate")):
        if not a[k]:
            fail("fragment", "the program fails %s" % label)
    for f in a["findings"]:
        fail("fragment", f)
    return files, programmed, n_rules, a


def check_rule(st, vocab, where):
    head_name, head_args = atom_sig(st.head.atom)
    hdecl = vocab.get((head_name, len(head_args)))
    head_cls = hdecl["cls"] if hdecl else None
    if hdecl and head_cls not in RULE_CLASSES:
        fail("symmetry", "%s: rule head %s/%d is %s; no rule creates an input (C6)" % (where, head_name, len(head_args), head_cls))
    for a in head_args:
        if a.ast_type == ast.ASTType.Function and a.arguments:
            fail("symmetry", "%s: function term in the head mints an object (C6): %s" % (where, a))
    var_sort = {}
    for atom in symbolic_atoms(st):
        name, args = atom_sig(atom)
        decl = vocab.get((name, len(args)))
        if not decl:
            fail("vocabulary", "%s: %s/%d is not declared" % (where, name, len(args)))
            continue
        if head_cls == "derived" and atom is not st.head.atom:
            if "kind" in decl["sorts"]:
                fail("kinds", "%s: derivation rule reads %s/%d, which carries the kind of a party (C13)" % (where, name, len(args)))
            if decl["cls"] == "consequence":
                fail("kinds", "%s: derivation rule reads the consequence %s/%d (C13)" % (where, name, len(args)))
        for arg, sort in zip(args, decl["sorts"]):
            if arg.ast_type == ast.ASTType.Variable:
                if arg.name == "_":
                    continue
                prev = var_sort.setdefault(arg.name, sort)
                if prev != sort:
                    fail("vocabulary", "%s: variable %s is %s and %s" % (where, arg.name, prev, sort))
            elif is_constant(arg):
                if sort == "party":
                    fail("symmetry", "%s: party constant %s in a rule (C1)" % (where, arg))
                if sort == "kind" and head_cls == "derived":
                    fail("kinds", "%s: kind constant %s in a derivation rule (C13)" % (where, arg))
            elif sort == "party":
                fail("symmetry", "%s: computed term %s in a party position (C1)" % (where, arg))
    for n in walk(st):
        if n.ast_type == ast.ASTType.Comparison:
            terms = [n.term] + [g.term for g in n.guards]
            party_side = [t.ast_type == ast.ASTType.Variable and var_sort.get(t.name) == "party" for t in terms]
            if any(party_side):
                ops = [g.comparison for g in n.guards]
                if not all(party_side) or ops != [ast.ComparisonOperator.NotEqual]:
                    fail("symmetry", "%s: party terms compared other than by != (C1): %s" % (where, n))


# --------------------------------------------------------------- fixtures

def check_fixtures(vocab, status, prog_files, programmed):
    prog = "\n".join(open(p, encoding="utf-8").read() for p in prog_files)
    pos, neg = {}, {}
    files = sorted(glob.glob(os.path.join(ROOT, "fixtures", "*.lp")))
    n_assert = 0
    for path in files:
        name = os.path.relpath(path, ROOT)
        src, stmts = parse_file(path)
        for st in stmts:
            if st.ast_type in SKIP:
                continue
            if st.ast_type != ast.ASTType.Rule or st.body or st.head.ast_type != ast.ASTType.Literal \
                    or st.head.atom.ast_type != ast.ASTType.SymbolicAtom:
                fail("fixtures", "%s:%d: a fixture holds facts only: %s" % (name, st.location.begin.line, st))
                continue
            pname, args = atom_sig(st.head.atom)
            decl = vocab.get((pname, len(args)))
            if not decl:
                fail("fixtures", "%s:%d: %s/%d is not declared" % (name, st.location.begin.line, pname, len(args)))
            elif decl["cls"] not in INPUT_CLASSES:
                fail("fixtures", "%s:%d: %s/%d is %s; a fixture states only input facts"
                     % (name, st.location.begin.line, pname, len(args), decl["cls"]))
        ctl = clingo.Control(["0", "--warn=none"])
        ctl.add("base", [], prog + "\n" + src)
        ctl.ground([("base", [])])
        models = []
        ctl.solve(on_model=lambda m: models.append({str(s) for s in m.symbols(atoms=True)}))
        if len(models) != 1:
            fail("fixtures", "%s: %d models; the fragment guarantees exactly one" % (name, len(models)))
            continue
        model = models[0]
        found = False
        for m in re.finditer(r"^\s*%\s*(EXPECT|EXPECT-NOT)\[([A-Z]+[0-9]*\.[0-9]+)\]:\s*(.+?)\s*$", src, re.M):
            found = True
            kind, cid, atom = m.groups()
            n_assert += 1
            if status.get(cid) != "program":
                fail("binding", "%s: assertion tagged %s, which is not a `program` paragraph" % (name, cid))
            holds = atom in model
            if kind == "EXPECT":
                pos[cid] = pos.get(cid, 0) + 1
                if not holds:
                    fail("fixtures", "%s: [%s] expected %s, not derived" % (name, cid, atom))
            else:
                neg[cid] = neg.get(cid, 0) + 1
                if holds:
                    fail("fixtures", "%s: [%s] %s derived, must not be" % (name, cid, atom))
        if not found:
            fail("fixtures", "%s: no assertion" % name)
    for cid, st in status.items():
        if st != "program":
            continue
        if not programmed.get(cid):
            fail("binding", "%s is `program` but no rule carries its tag" % cid)
        if not pos.get(cid):
            fail("binding", "%s is `program` but no fixture asserts its outcome (EXPECT)" % cid)
        if not neg.get(cid):
            fail("binding", "%s is `program` but no fixture asserts its absence (EXPECT-NOT)" % cid)
    return len(files), n_assert


# --------------------------------------------------------------- selftest

# Each case is a program the checks must refuse, and the check that must
# refuse it, so that a check that silently stopped working fails here.
SELFTEST = [
    ("symmetry", "holds_inform(P) :- party(P), P != founder."),
    ("symmetry", "in_chain(X, P) :- above(X, P), X < P."),
    ("symmetry", "admitted(M) :- reaches(M)."),
    ("symmetry", "party(f(P)) :- party(P)."),
    ("kinds", "subject(P) :- kind_of(P, human)."),
    ("kinds", "party(P) :- reviewer_kind_ok(V, P)."),
    ("vocabulary", "party(F) :- finding(F, _, _)."),
    ("vocabulary", "party(P) :- unknown_fact(P)."),
    ("fragment", "{ party(P) } :- subject(P)."),
    ("fragment", "open(F) :- finding(F, _, _), not valid_closure(F).\n"
                 "valid_closure(F) :- finding(F, _, _), not open(F)."),
    ("fragment", "open_count(P, N) :- party(P), N = #sum{ 1, F : finding(F, P, _) }."),
]


def selftest(vocab):
    spec = importlib.util.spec_from_file_location("evidence_check", os.path.join(REPO, "evidence/checker/check.py"))
    ev = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(ev)
    passed = 0
    for want, src in SELFTEST:
        saved = text.errors[:]
        del text.errors[:]
        _, stmts = None, []
        ast.parse_string(src, stmts.append)
        for st in stmts:
            if st.ast_type == ast.ASTType.Rule:
                head = st.head
                if not (head.ast_type == ast.ASTType.Literal and head.atom.ast_type == ast.ASTType.SymbolicAtom):
                    fail("fragment", "head is not an atom")
                    continue
                check_rule(st, vocab, "selftest")
        with tempfile.NamedTemporaryFile("w", suffix=".lp", delete=False) as tmp:
            tmp.write(src)
        try:
            _, a = ev.analyse(tmp.name)
        finally:
            os.unlink(tmp.name)
        if not (a["stratified"] and a["count_only"] and a["range_restricted"] and a["arith_ok"]):
            fail("fragment", "evidence analysis refuses it")
        caught = {c for c, _ in text.errors}
        text.errors[:] = saved
        if want in caught:
            passed += 1
        else:
            fail("selftest", "the %s check did not refuse: %s" % (want, src.replace("\n", " ")))
    return passed


# ------------------------------------------------------------------- main

def main():
    if "--write-manifest" in sys.argv[1:]:
        with open(os.path.join(ROOT, "MANIFEST.json"), "w", encoding="utf-8") as f:
            json.dump(build_manifest(), f, indent=2)
            f.write("\n")
    inv = check_prose()
    status = {r["id"]: r["status"] for r in inv}
    n_units, n_unmapped = check_sources(inv)
    vocab = load_vocabulary(set(status))
    prog_files, programmed, n_rules, a = check_program(vocab, status)
    n_fix, n_assert = check_fixtures(vocab, status, prog_files, programmed)
    n_params = check_parameters(set(status), prog_files)
    n_self = selftest(vocab)
    man = check_manifest()

    counts = {}
    for r in inv:
        counts[r["status"]] = counts.get(r["status"], 0) + 1
    clauses = {r["id"].split(".")[0] for r in inv}
    print("paragraphs %d in %d clauses: %s" % (len(inv), len(clauses),
          ", ".join("%s %d" % (k, counts.get(k, 0)) for k in
                    ("program", "procedural", "meta", "todo", "interpretive", "open"))))
    print("record units %d (unmapped %d) · predicates %d · rules %d in %d files (%d components) · "
          "fixtures %d with %d assertions · parameters %d · refusals %d/%d"
          % (n_units, n_unmapped, len(vocab), n_rules, len(prog_files), a["n_sccs"], n_fix, n_assert, n_params,
             n_self, len(SELFTEST)))
    print("manifest combined sha256 %s" % man["combined_sha256"])
    for check, msg in text.errors:
        print("FAIL %-10s %s" % (check, msg))
    print("OK" if not text.errors else "%d failure(s)" % len(text.errors))
    return 1 if text.errors else 0


if __name__ == "__main__":
    sys.exit(main())
