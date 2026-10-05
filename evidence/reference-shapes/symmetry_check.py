#!/usr/bin/env python3
"""C1 permutation-symmetry fixture for sameness.lp.

Rename the party constants of the program by a permutation pi, solve, and
compare each predicate's extension with pi applied to the original model.
A rule set is permutation-symmetric iff every predicate agrees.  The lottery
rule `drawn` ranks eligible judges with `lt` on identifiers, which C1 names as
exactly the construct that breaks symmetry; this script shows it does.
"""
import os
import re
import sys

import clingo

HERE = os.path.dirname(os.path.abspath(__file__))
src = open(os.path.join(HERE, "sameness.lp")).read()

PI = {"judgeA": "judgeC", "judgeC": "judgeA"}   # swap two eligible judges


def rename(text, pi):
    return re.sub(r"\b(judgeA|judgeC)\b", lambda m: pi[m.group(1)], text)


def model(text):
    ctl = clingo.Control(["0", "--warn=none"])
    ctl.add("base", [], text)
    ctl.ground([("base", [])])
    out = []
    ctl.solve(on_model=lambda m: out.append({str(s) for s in m.symbols(atoms=True)}))
    assert len(out) == 1
    return out[0]


orig = model(src)
perm = model(rename(src, PI))
orig_renamed = {rename(a, PI) for a in orig}

by_pred = {}
for a in orig_renamed | perm:
    p = a.split("(")[0]
    by_pred.setdefault(p, [set(), set()])
for a in orig_renamed:
    by_pred[a.split("(")[0]][0].add(a)
for a in perm:
    by_pred[a.split("(")[0]][1].add(a)

broken = []
for p, (x, y) in sorted(by_pred.items()):
    if x != y:
        broken.append(p)
        print("ASYMMETRIC  %-16s pi(original)=%s   permuted=%s" % (p, sorted(x), sorted(y)))
print()
print("predicates checked: %d   asymmetric: %s" % (len(by_pred), broken or "none"))
sys.exit(0)
