#!/usr/bin/env python3
"""Superset conformance (C15): does 'instance findings are a superset of the
parent's on the parent's fixtures' survive protective-direction parameters?

Three runs over one fixture, derivation stratum only (no kind/2 anywhere):
  run 1  parent rules at parent params  vs  parent rules at instance params
      (instance lengthens the answer window: protective for the silent party)
  run 2  parent rules vs instance rules, both at the instance's params
      (instance adds one obligation rule)
  run 3  parent rules vs instance rules that add a rule whose head feeds a
      negation (an 'obligation' that exempts) at the same params
Also shows the two-direction parameter: the contest window W protects the
found party (more time) and hurts the party awaiting remedy (later remedy).
"""
import clingo

FIXTURE = """
time(0..12). now(10).
party(alice). party(bob). party(carol).
% carol asked bob for an owed act at t=3
request(rq1, carol, bob, 3). owed(rq1).
% finding f1 against bob, derived at t=2, closed against bob at t=2 (consequence pending window)
finding(f1, bob, r1). derived_at(f1, 2). closed_against(f1). awaits_remedy(alice, f1).
reply(bob, f1).
"""

PARENT_RULES = """
% derivation stratum: breach by silence past the answer window W
answer_window(W) :- param(answer_window, W).
window_passed(Rq) :- request(Rq, _, _, T), answer_window(W), now(N), T + W < N.
answered(Rq) :- answer(Rq, _).
breach(P, Rq) :- request(Rq, _, P, _), owed(Rq), window_passed(Rq), not answered(Rq).
finding_out(breach, P) :- breach(P, _).
% contest window C on a finding closed against a party: remedy applies once C has passed
contest_window(C) :- param(contest_window, C).
remedy_due(F) :- closed_against(F), derived_at(F, T), contest_window(C), now(N), T + C < N.
finding_out(remedy_due, F) :- remedy_due(F).
finding_out(remedy_pending, F) :- closed_against(F), not remedy_due(F).
"""

INSTANCE_EXTRA_OBLIGATION = """
% instance adds an obligation: a party owing an act must also acknowledge receipt
ack_due(P, Rq) :- request(Rq, _, P, _), owed(Rq), not acked(Rq).
finding_out(ack_due, P) :- ack_due(P, _).
"""

INSTANCE_EXEMPT_RULE = """
% instance adds an 'obligation' whose head enters a negation upstream:
% a party who replied to a finding about them is excused from breach
excused(P) :- reply(P, _).
breach(P, Rq) :- request(Rq, _, P, _), owed(Rq), window_passed(Rq), not answered(Rq), not excused(P).
"""

PARENT_RULES_EXEMPTABLE = PARENT_RULES.replace(
    "breach(P, Rq) :- request(Rq, _, P, _), owed(Rq), window_passed(Rq), not answered(Rq).",
    "breach(P, Rq) :- request(Rq, _, P, _), owed(Rq), window_passed(Rq), not answered(Rq), not excused(P).\nexcused(P) :- excuse_fact(P).")


def findings(rules, params):
    prog = FIXTURE + rules + "".join("param(%s, %d).\n" % kv for kv in params.items())
    ctl = clingo.Control(["0", "--warn=none"])
    ctl.add("base", [], prog)
    ctl.ground([("base", [])])
    out = []
    ctl.solve(on_model=lambda m: out.append({str(s) for s in m.symbols(atoms=True) if s.name == "finding_out"}))
    assert len(out) == 1, "not deterministic"
    return out[0]


def report(label, parent, inst):
    sup = parent <= inst
    print("%-58s superset holds: %-5s  parent-only: %s" % (label, sup, sorted(parent - inst) or "-"))


P = dict(answer_window=5, contest_window=5)
I = dict(answer_window=8, contest_window=8)   # both lengthened: protective for bob

print("fixture: carol asked bob at t=3, now=10; finding f1 closed against bob at t=2, alice awaits remedy\n")
fp = findings(PARENT_RULES, P)
fi = findings(PARENT_RULES, I)
print("parent rules @ parent params  :", sorted(fp))
print("parent rules @ instance params:", sorted(fi))
report("run 1 same rules, instance params (longer windows)", fp, fi)
print("   -> the more protective instance derives FEWER findings (breach gone, remedy pending):")
print("      answer_window protects bob (silent) ; contest_window protects bob and delays alice's remedy")
print()
fi2 = findings(PARENT_RULES + INSTANCE_EXTRA_OBLIGATION, I)
report("run 2 instance adds an obligation, both at instance params", findings(PARENT_RULES, I), fi2)
print()
fp3 = findings(PARENT_RULES_EXEMPTABLE, P)
fi3 = findings(PARENT_RULES_EXEMPTABLE + "excused(P) :- reply(P, _).\n", P)
report("run 3 instance adds a rule feeding a negation, same params", fp3, fi3)
print("   -> 'adding a rule' can remove findings under negation; superset is a fixture test, not a syntactic one")
