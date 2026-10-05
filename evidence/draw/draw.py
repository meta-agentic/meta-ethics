#!/usr/bin/env python3
"""The lottery seed and the draw (C17). Grinding attacks on
seed = H(filing || beacon value after filing), draw = rank-and-modulo.

All draws are over N eligible judges of which f are the attacker's friends.
Success = the attacker obtains a friendly judge. Each experiment is exact
(enumeration) or Monte Carlo over uniformly random seeds; the seed is a
256-bit integer unless stated.
"""
import hashlib
import itertools
import random
from fractions import Fraction

random.seed(2026)
N, F = 10, 1
JUDGES = ["j%02d" % i for i in range(N)]
FRIENDS = set(JUDGES[:F])


def H(*parts):
    return int.from_bytes(hashlib.sha256("|".join(map(str, parts)).encode()).digest(), "big")


def draw(seed, eligible):
    el = sorted(eligible)              # rank by identifier order (sameness.lp: J2 < J)
    return el[seed % len(el)]


def mc(trials, fn):
    return sum(fn() for _ in range(trials)) / trials


print("N=%d eligible judges, f=%d friend; baseline P(friend) = %.3f\n" % (N, F, F / N))

# ---- (a) eligibility manipulation after the seed is public --------------------------
# The attacker can make up to r judges ineligible after the draw (A2: a party a
# finding names is ineligible on the matter at once). Live eligibility: the draw
# is recomputed over the reduced set. Frozen: the eligible set is fixed at filing.
print("(a) eligibility manipulation AFTER the seed is known (attacker removes <= r judges)")
print("    r   live-eligibility P(friend)   frozen-at-filing P(friend)")
for r in range(0, 4):
    def live():
        seed = random.getrandbits(256)
        others = [j for j in JUDGES if j not in FRIENDS]
        for k in range(0, r + 1):
            for rem in itertools.combinations(others, k):
                if draw(seed, set(JUDGES) - set(rem)) in FRIENDS:
                    return 1
        return 0
    def frozen():
        seed = random.getrandbits(256)
        return 1 if draw(seed, set(JUDGES)) in FRIENDS else 0
    print("    %d   %.3f                        %.3f" % (r, mc(20000, live), mc(20000, frozen)))
print("    -> with live eligibility, one removal doubles the odds and three quadruple them; frozen, removals do nothing.")
print("       The eligible set and its order must be fixed at filing, before the beacon value exists.\n")

# ---- (b) removal after the draw with a frozen set: two redraw policies ----------------
print("(b) frozen set, but the drawn judge is removed after the draw (each removal is a recorded act)")
def next_in_order():
    seed = random.getrandbits(256)
    el = sorted(JUDGES); k = seed % len(el)
    order = el[k:] + el[:k]            # seed-ordered list, advance on removal
    return order.index(next(j for j in order if j in FRIENDS))
def redraw_fresh():
    el = set(JUDGES); n = 0
    while True:
        j = draw(random.getrandbits(256), el)
        if j in FRIENDS:
            return n
        el.discard(j); n += 1
print("    advance-in-seed-order: mean removals to reach a friend = %.2f" % mc(4000, next_in_order))
print("    redraw with a fresh beacon value: mean removals to reach a friend = %.2f" % mc(4000, redraw_fresh))
print("    -> either way the cost is ~ N/2 removals, each a recorded act (H1). Fresh redraw is not cheaper.\n")

# ---- (c) filer multiplicity: k filings, keep the best ----------------------------------
print("(c) filer files k copies and withdraws the unfriendly ones (each filing a recorded act)")
for k in (1, 2, 5, 10, 20):
    p = 1 - (1 - Fraction(F, N)) ** k
    print("    k=%2d  P(friend among k draws) = %.3f" % (k, float(p)))
print("    -> multiplicity is a real lever; cost is per filing (instance capacity) unless the draw binds the matter.\n")

# ---- (d) beacon bias: attacker can pick among 2^b candidate beacon values --------------
print("(d) beacon bias of b bits (e.g. block withholding, last-revealer)")
for b in (0, 1, 2, 3, 4):
    p = 1 - (1 - Fraction(F, N)) ** (2 ** b)
    print("    b=%d  P(friend) = %.3f" % (b, float(p)))
print("    -> 3 bits of bias ~ 57%%; an unbiasable beacon (threshold or VDF based) is a parent requirement.\n")

# ---- (e) predictable 'beacon': a timestamp, or a log head the operator can steer --------
print("(e) seed from a value the filer or operator can foresee or steer (timestamp, resubmittable head)")
for T in (1, 10, 60, 600):
    p = 1 - (1 - Fraction(F, N)) ** T
    print("    %4d candidate values  P(friend) = %.3f" % (T, float(p)))
print("    -> a timestamp is not a beacon; a transparency-log head is grindable by whoever can append to it.\n")

# ---- (f) modulo bias ------------------------------------------------------------------
print("(f) modulo bias of seed mod N")
for bits in (8, 16, 256):
    if bits <= 16:
        counts = [0] * N
        for s in range(2 ** bits):
            counts[s % N] += 1
        print("    %3d-bit seed: max/min residue frequency = %.4f" % (bits, max(counts) / min(counts)))
    else:
        print("    %3d-bit seed: bias <= N / 2^%d, negligible" % (bits, bits))
print("    -> the reference shape's small integer seeds are illustrative only; the parent should require the seed be a hash.\n")

# ---- (g) symmetry: the draw is not renaming-equivariant, but it is uniform -----------------
print("(g) C1 honesty: rank-and-modulo under a renaming of judges")
seed = 123456789
a = draw(seed, set(JUDGES))
ren = {j: j for j in JUDGES}; ren["j00"], ren["j09"] = "j09", "j00"   # swap two identifiers (symmetry_check.py style)
b = draw(seed, {ren[j] for j in JUDGES})
print("    fixed seed: drawn %s; after swapping names j00<->j09 the drawn name is %s, i.e. the judge formerly called %s (equivariant: %s)" % (a, b, [k for k,v in ren.items() if v==b][0], ren[a] == b))
hist = {j: 0 for j in JUDGES}
for _ in range(20000):
    hist[draw(random.getrandbits(256), set(JUDGES))] += 1
print("    over seeds: min/max frequency = %.3f / %.3f (uniform: each ~%.3f)" % (
    min(hist.values()) / 20000, max(hist.values()) / 20000, 1 / N))
print("    -> the draw's fairness claim is uniformity over the frozen set, not symmetry of the rule set;")
print("       as an attested fact it leaves C1's rule-set symmetry untouched, and it must be claimed as uniformity.")
