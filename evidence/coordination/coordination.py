#!/usr/bin/env python3
"""Fixtures for H2 (opaque coordination); theorem "Correlation is not collusion".

S1  covert channel inside schema-conformant facts: every fact decodes with the
    reference decoder; the payload rides in choices the schema leaves free
    (timestamp within the witness cadence, order of typed targets).
S2  correlation vital sign, common cause: two agents that never communicate,
    same model and same inputs -> near-perfect correlation (false positive).
S3  deliberate decorrelation by dilution: colluders act at random except on
    rare critical matters, where they align.  Pairwise correlation vs the
    independent baseline.
S4  deliberate decorrelation by secret sharing: three colluders whose acts are
    pairwise independent but jointly determined (XOR).  Every pairwise
    statistic is at baseline; the triple is perfectly coordinated.
"""
import random
import statistics as st

rng = random.Random(7)

print("S1  covert channel inside schema-valid facts")
SCHEMA_TARGETS = ["rule:r1", "finding:f9", "subject:k4"]


def decode(fact):   # reference decoder: validates the published schema only
    t, targets, answer = fact
    assert isinstance(t, int) and sorted(targets) == sorted(SCHEMA_TARGETS)
    assert answer in ("material", "immaterial")
    return {"time": t, "targets": set(targets), "answer": answer}


secret = [1, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0]
facts, base = [], 1000
for i in range(0, len(secret), 3):
    b0, b1, b2 = secret[i:i + 3]
    t = base + i * 10 + b0                        # parity of a tick within the cadence
    order = SCHEMA_TARGETS if b1 == 0 else list(reversed(SCHEMA_TARGETS))
    answer = "material"                           # the substantive answer is honest
    facts.append((t, order, answer))
    base += b2                                    # a one-tick shift on the next fact
decoded_ok = all(decode(f) for f in facts)
recovered = []
base = 1000
for j, (t, order, _) in enumerate(facts):
    i = 3 * j
    b0 = (t - base - i * 10)
    b1 = 0 if order == SCHEMA_TARGETS else 1
    recovered += [b0, b1]
    if j + 1 < len(facts):
        nxt = facts[j + 1][0] - (base + (i + 3) * 10)
        b2 = 1 if nxt - (facts[j+1][0] % 2 if False else 0) not in (0, 1) else None
    base_prev = base
    # b2 is recovered from the next fact's offset; kept simple: record shift
    b2 = None
    recovered.append(b2)
    # recompute base exactly as the sender did
    base = base_prev + secret[i + 2]
print(f"  all facts decode under the reference decoder: {decoded_ok}")
print(f"  bits carried in timing parity and target order: {[r for r in recovered if r is not None]}")
print(f"  sent (same positions):                          {[secret[i] for i in range(len(secret)) if i % 3 != 2]}")
print("  the substantive answer carried no payload; the free choices did")

print()
print("S2  common cause: same model, same inputs, no communication")
N = 400
inputs = [rng.random() for _ in range(N)]
model = lambda x, noise: 1 if x + noise > 0.5 else 0   # same policy
a = [model(x, rng.gauss(0, 0.05)) for x in inputs]
b = [model(x, rng.gauss(0, 0.05)) for x in inputs]


def corr(x, y):
    mx, my = st.mean(x), st.mean(y)
    sx, sy = st.pstdev(x), st.pstdev(y)
    return sum((p - mx) * (q - my) for p, q in zip(x, y)) / (len(x) * sx * sy)


print(f"  correlation of two non-communicating agents: {corr(a, b):.2f}")

print()
print("S3  dilution: collude only on rare critical matters")
for crit_rate in (0.01, 0.05, 0.2):
    cs = []
    for trial in range(200):
        x, y = [], []
        for _ in range(N):
            if rng.random() < crit_rate:
                x.append(1); y.append(1)
            else:
                x.append(rng.randint(0, 1)); y.append(rng.randint(0, 1))
        cs.append(corr(x, y))
    base = [corr([rng.randint(0, 1) for _ in range(N)], [rng.randint(0, 1) for _ in range(N)])
            for _ in range(200)]
    thr = sorted(base)[int(0.95 * len(base))]
    power = sum(c > thr for c in cs) / len(cs)
    print(f"  critical rate {crit_rate:>4}: mean corr {st.mean(cs):.3f}, "
          f"detection power at 5% false-alarm, {N} acts: {power:.2f}")

print()
print("S4  secret sharing: pairwise independent, jointly determined")
x = [rng.randint(0, 1) for _ in range(N)]
y = [rng.randint(0, 1) for _ in range(N)]
target = [1] * N                      # the coalition's joint aim on every matter
z = [t ^ p ^ q for t, p, q in zip(target, x, y)]
print(f"  pairwise corr: xy {corr(x, y):+.3f}  xz {corr(x, z):+.3f}  yz {corr(y, z):+.3f}")
print(f"  joint: x^y^z == aim on {sum((p ^ q ^ r) == 1 for p, q, r in zip(x, y, z))}/{N} matters")
