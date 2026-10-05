# Owed acts and capacity

**Backs:** theorem "Owed acts must not spend capacity". Hazard H1.

**What it computes.** A one-period simulation in which every party holds T = 5 tokens. Sending a request costs the sender one token and creates an owed answer for the recipient. Three policies are compared:

- **BUDGETED:** answering costs a token.
- **EXCUSED:** as BUDGETED, but there is no breach at a zero balance.
- **FREE:** owed acts sit outside the budget.

It runs two scenarios. In the first, one to three attackers flood one honest target, with and without a rule allowing one pending request per pair. In the second, a powerful party empties its own balance before ten owed acts fall due. Finally it sizes the reserve that worst-case owed load would need. The simulation is deterministic.

**Command:** `./run.sh` here, or `../run.sh --check owed-acts`.

**Expected result:**
- BUDGETED: two attackers force the target into breach, with or without the pairwise rule.
- EXCUSED: the empty-pockets party is excused on **8 of 10** owed acts.
- FREE: the target answers everything, and the empty-pockets party is neither in breach nor excused.
- Reserve: each party would need N·T, the whole pool.
