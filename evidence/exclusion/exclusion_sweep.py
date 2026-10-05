#!/usr/bin/env python3
"""Exclusion sweep: how many exclusions does a sub-capture coalition need to PASS a
matter under (a) a shrinking base and (b) a frozen base, and how many to BLOCK
it or route it to the last word (too few eligible)?  Pure arithmetic, no
strategy search needed: exclusions only ever remove honest voters."""
from math import ceil

def passes(approvals, base, num, den, minimum):
    return approvals * den >= base * num and approvals >= minimum

rows = []
for n in (5, 8, 12, 20):
    for num, den in ((1, 2), (2, 3)):
        minimum = 3
        cost = ceil(n * num / den)          # capture cost on this class
        for c in range(1, cost):            # coalitions strictly below cost
            # (a) shrinking base: exclude k honest voters
            need_a = None
            for k in range(0, n - c + 1):
                base = n - k
                if base < minimum:
                    break                   # too few: escalates instead
                if passes(c, base, num, den, minimum):
                    need_a = k
                    break
            # (b) frozen base: base never shrinks
            need_b = None
            for k in range(0, n - c + 1):
                if n - k < minimum:
                    break
                if passes(c, n, num, den, minimum):
                    need_b = k
                    break
            # exclusions to force escalation (too few eligible): n - k < minimum
            to_escalate = n - minimum + 1
            rows.append((n, f"{num}/{den}", cost, c, need_a, need_b, to_escalate))

print("Exclusions a sub-capture coalition needs (None = impossible before escalation)")
print(f"{'N':>3} {'share':>5} {'cost':>4} {'c':>2} | {'pass, shrinking base':>21} | {'pass, frozen base':>17} | {'to escalate':>11}")
for n, s, cost, c, a, b, e in rows:
    if c < cost - 2 and c != 1:
        continue                             # print the interesting rows only
    print(f"{n:>3} {s:>5} {cost:>4} {c:>2} | {str(a):>21} | {str(b):>17} | {e:>11}")
print()
print("Reading: under a shrinking base a coalition one below the capture cost passes")
print("with a handful of exclusions; under a frozen base no number of exclusions")
print("passes anything (exclusion can only block or escalate).")
