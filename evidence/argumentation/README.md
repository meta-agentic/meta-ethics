# Grounded argumentation and rule ordering

**Backs:** theorem "Grounded argumentation is not in the fragment" (seven programs) and theorem "An ordering must bind at filing" (`g_ordering_at_filing.lp`). Clause C14.

**What it computes.** The fragment checker (`../checker/check.py`) runs over seven programs:

- **a, b, c:** Dung's grounded rule `defeated(X) :- attacks(Y,X), not defeated(Y)` on an acyclic chain, an even cycle and an odd cycle.
- **d:** the grounded extension computed by unrolling levels under a ceiling.
- **e:** a non-recursive override, which gives no reinstatement.
- **f:** attacks derived from conflicts and an acyclic superiority relation over rules.
- **g:** an ordering changed by an act of power while a matter is pending, read once as bound at filing and once as of now.

**Command:** `./run.sh` here, or `../run.sh --check argumentation`.

**Expected result:**
- a, b and c are reported **not stratified**, whatever the facts. a has one model, b has **two models** and c has **zero**.
- d, e, f and g are stratified with one model each, and every assertion holds (6, 5, 6 and 4).
- In g, the ordering bound at filing keeps the original winner, and the ordering read as of now flips it.
