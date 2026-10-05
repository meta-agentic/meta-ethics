# Steering the draw

**Backs:** theorem "Steering the draw", and the tested half of the thesis "Symmetry of the rules" (the draw's uniformity over the fixed set). Clause C17.

**What it computes.** A pool of ten eligible judges, one of them the attacker's friend; the draw is rank-and-modulo over a 256-bit seed. Seven sections:

- (a) eligibility read live versus fixed at filing, with the attacker removing up to three judges after the seed is known (Monte Carlo, 20 000 trials per cell);
- (b) the mean number of removals needed to reach a friend, comparing advance in seed order with a fresh redraw (Monte Carlo, 4 000 trials);
- (c) a filer who files k copies and withdraws the unfriendly ones (exact);
- (d) b bits of bias over the beacon (exact);
- (e) a seed taken from a value the appender can steer, such as a log head, with a given number of candidate values (exact);
- (f) modulo bias of short seeds (exact enumeration);
- (g) the draw under a renaming of judges: it is not equivariant, but it is uniform over seeds (Monte Carlo, 20 000 trials).

The random generator is seeded, so a re-run reproduces `output.txt` byte for byte.

**Command:** `./run.sh` here, or `../run.sh --check draw`.

**Expected figures** (two-decimal values as quoted, with the printed value in brackets):

| Quoted | Section | Printed |
|---|---|---|
| 60 candidate heads → 0.998 | (e) | 0.998 |
| live eligibility: 0.20 after one removal, 0.38 after three | (a) | 0.200, 0.383 |
| fixed at filing: 0.10 throughout | (a) | 0.098 to 0.101 |
| k = 5 → 0.41, k = 20 → 0.88 | (c) | 0.410, 0.878 |
| one bit → 0.19 | (d) | 0.190 |
| four bits | (d) | 0.815 (exact value 1 − 0.9¹⁶ = 0.8147, so 0.81 to two decimals) |
| next-in-order and fresh redraw cost the same | (b) | 4.39 and 4.61 removals, both about N/2 |
| per-judge frequency 0.096 to 0.103 against 0.100 | (g) | 0.096 / 0.103 |
