# Correlation and the covert channel

**Backs:** theorem "Correlation is not collusion" (tested) and theorem "The covert channel cannot be closed" (a limit; section S1 illustrates it). Hazard H2.

**What it computes.** Four simulations, run with a seeded generator, each over 400 acts:

- **S1:** a payload carried in the timing parity and the order of typed targets, by facts that all pass the reference decoder.
- **S2:** two agents running the same policy on the same inputs, with independent noise and no communication. It reports their correlation.
- **S3:** colluders who align only on a rare fraction of critical matters. It reports the detection power of a pairwise-correlation test at a 5% false-alarm rate (200 trials per rate).
- **S4:** three colluders whose acts are shares of their aim by exclusive-or. It reports their pairwise correlations and their joint hit rate.

**Command:** `./run.sh` here, or `../run.sh --check coordination`.

**Expected figures:**
- 0.86: the correlation of two agents that never communicate (S2);
- 0.07: detection power at a 1% critical rate (S3, so "seven percent of the time");
- pairwise correlations near zero, with the joint aim hit on 400/400 matters (S4);
- the decoded bits equal the sent bits (S1).
