#!/usr/bin/env python3
"""Fixtures for A3's measure and the coalition (ATL) claim of correctability.

G1  one open finding; the coalition holds levers that reset or extend the
    finding's window (a contest, an extension).  Turn-based game, perfect
    information.  Checks: (a) do outsiders win (attractor)?  (b) does the
    proposed scalar rank  open + remaining window  strictly decrease on every
    edge of the outsiders' winning play, whatever the coalition does?
    (c) does a lexicographic rank (levers left, window) decrease?  (d) with
    levers unbounded (the parent has no lever floor), do outsiders still win?
G2  the global rank "number of open findings + remaining windows" against a
    coalition that opens findings on its own sub-agents.
G3  forall G exists sigma  vs  exists sigma forall G: the outsiders do not
    know who the coalition is.
G4  imperfect information: saturated failure counter; memoryless vs
    bounded-memory strategies.
G5  state-space size of the per-instance check at realistic caps.
"""
import itertools
from math import comb

print("=" * 78)
print("G1  one finding, levers reset/extend its window (perfect information)")
print("=" * 78)

W0, WC, CAP, EXT = 3, 4, 6, 2   # initial window, window after contest, cap, extension


def g1_states(contests, exts):
    for w in range(CAP + 1):
        for c in range(contests + 1):
            for e in range(exts + 1):
                for turn in ("coal", "out"):
                    yield (w, c, e, turn, False)
    yield ("closed",)


def g1_moves(s, unbounded):
    if s == ("closed",):
        return []
    w, c, e, turn, _ = s
    if turn == "coal":
        mv = [("pass", (w, c, e, "out", False))]
        if c > 0:
            mv.append(("contest", (WC, c if unbounded else c - 1, e, "out", False)))
        if e > 0:
            mv.append(("extend", (min(CAP, w + EXT), c, e if unbounded else e - 1, "out", False)))
        return mv
    # outsiders: time passes (window ticks); at window 0 they may close
    mv = [("tick", (max(0, w - 1), c, e, "coal", False))]
    if w == 0:
        mv.append(("close", ("closed",)))
    return mv


def attractor(states, moves, target, player_of):
    win = set(target)
    changed = True
    while changed:
        changed = False
        for s in states:
            if s in win:
                continue
            mv = moves(s)
            if not mv:
                continue
            if player_of(s) == "out":
                ok = any(t in win for _, t in mv)
            else:
                ok = all(t in win for _, t in mv)
            if ok:
                win.add(s)
                changed = True
    return win


def run_g1(contests, exts, unbounded):
    states = list(g1_states(contests, exts))
    mv = lambda s: g1_moves(s, unbounded)
    pl = lambda s: s[3] if s != ("closed",) else None
    win = attractor(states, mv, {("closed",)}, pl)
    start = (W0, contests, exts, "coal", False)
    scalar = lambda s: 0 if s == ("closed",) else 1 + s[0]
    lexi = lambda s: (0, 0, 0) if s == ("closed",) else (1, s[1] + s[2], s[0])
    bad_scalar, bad_lex = [], []
    for s in states:
        if s not in win or s == ("closed",):
            continue
        for name, t in mv(s):
            if pl(s) == "out" and t not in win:
                continue   # outsiders only take winning moves
            # a rank must not increase on any coalition move and must strictly
            # decrease on each outsiders' round; we test "never increases".
            if scalar(t) > scalar(s):
                bad_scalar.append((s, name, t))
            if lexi(t) > lexi(s):
                bad_lex.append((s, name, t))
    print(f"levers: contests={contests} extensions={exts} unbounded={unbounded}")
    print(f"  outsiders win from start: {start in win}")
    print(f"  scalar rank (open + window) increases on {len(bad_scalar)} edges"
          + (f", e.g. {bad_scalar[0]}" if bad_scalar else ""))
    print(f"  lexicographic (levers left, window) increases on {len(bad_lex)} edges")
    return start in win


run_g1(1, 2, unbounded=False)
run_g1(1, 2, unbounded=True)

print()
print("=" * 78)
print("G2  global rank vs a coalition that opens findings on its own sub-agents")
print("=" * 78)
# outsiders close one finding per round; coalition opens k per round on its own
# minted sub-agents (findings are opened by witnessed acts: cost is collector work)
for k in (0, 1, 2):
    open_f, trace = 5, []
    for rnd in range(6):
        open_f = max(0, open_f - 1) + k
        trace.append(open_f)
    print(f"  coalition opens {k}/round: global open count by round {trace}")
print("  per-finding: each individual finding still closes; the global count need not fall.")

print()
print("=" * 78)
print("G3  do the outsiders know who the coalition is?")
print("=" * 78)
# Finding about a.  The reporter r (an outsider in every case) may file ONE
# closure request, naming one witness among {w1,w2,w3} (one pending per pair,
# one closure filing per matter, capacity 1).  A coalition of size 1 (below
# capture cost) is one of the witnesses and refuses.
W = ["w1", "w2", "w3"]
coalitions = [{w} for w in W]
forall_exists = all(any(w not in G for w in W) for G in coalitions)
exists_forall = any(all(w not in G for G in coalitions) for w in W)
print(f"  forall G exists strategy (ATL per coalition, G known): {forall_exists}")
print(f"  exists one strategy for all G (G unknown to outsiders): {exists_forall}")
# with a lottery instead of a chosen witness: probability of success
print(f"  with the witness drawn by lot: success probability {1 - 1/len(W):.2f} per attempt")

print()
print("=" * 78)
print("G4  imperfect information + saturated counter: memoryless vs memory")
print("=" * 78)
# Two of three witnesses are in the coalition (G hidden, |G|=2 below capture
# when capture needs 3 seats).  r may try witnesses one at a time (3 attempts).
# Observation: the working state shows only failures saturated at cap 1
# ("none" or ">=1").  A memoryless strategy maps observation -> witness.
obs_vals = ["none", "some"]
Gs = [set(c) for c in itertools.combinations(W, 2)]


def play_memoryless(strat, G, attempts=3):
    fails = 0
    for _ in range(attempts):
        o = "none" if fails == 0 else "some"
        w = strat[o]
        if w not in G:
            return True
        fails += 1
    return False


ml_ok = [s for s in itertools.product(W, repeat=2)
         if all(play_memoryless(dict(zip(obs_vals, s)), G) for G in Gs)]
print(f"  memoryless strategies winning against every hidden G: {len(ml_ok)} of {len(W)**2}")


def play_memory(order, G):
    return any(w not in G for w in order)   # remembers whom it tried


mem_ok = [o for o in itertools.permutations(W) if all(play_memory(o, G) for G in Gs)]
print(f"  strategies with 2 bits of memory winning against every hidden G: {len(mem_ok)} of 6")
print("  (with perfect information memoryless = perfect recall for ATL; the gap opens only here)")

print()
print("=" * 78)
print("G5  size of the per-instance model at realistic caps")
print("=" * 78)
print(f"{'parties':>8} {'open cap':>9} {'timer cap':>10} {'explicit states':>18} {'symmetry-reduced':>18}")
for n, c, t in [(3, 2, 5), (5, 2, 7), (10, 3, 10), (20, 3, 14), (50, 5, 30)]:
    local = (t + 2) ** c          # each of c finding slots: empty or age 0..t
    explicit = local ** n
    sym = comb(n + local - 1, n)  # counter abstraction, full symmetry
    from math import log10
    per_finding = (t + 2) * 4 * 3 * (c + 1)   # one finding: age x contest x ext x load
    print(f"{n:>8} {c:>9} {t:>10} {'1e%.1f' % log10(explicit):>18} {'1e%.1f' % log10(sym):>18}   per-finding abstraction ~{per_finding}")
print("  (per-party local state only; matters, rosters, capacity and pending slots multiply this)")
