# Reference shapes of the fragment

**Backs:**
- the working-state construction and the laundering example (`working_state.lp`; the appendix listing is cut from it);
- the claim that the clauses fit the fragment of stratified negation and count (clause C6);
- the thesis "Symmetry of the rules": `symmetry_check.py` shows that the one construct C1 names, ranking judges by identifier, is the one that breaks permutation symmetry;
- the attack-catalogue row "Close a finding through a partner, no remedy" (`closure_by_partner.lp`).

**What it computes.** `../checker/check.py` runs over every program here:

- `working_state.lp` (A3): the record and a bounded working state.
- `party_mandates.lp` (A1, C7): parties, mandates and seats.
- `obstruction.lp` (H1): an instance's obstruction rules.
- `sameness.lp` (C11): typed targets and the drawn judge.
- `closure_by_partner.lp` (A3): closure by a partner, with no remedy.
- Two programs that are **meant to fail** stratification. `x_pending_naive_nonstratified.lp` reads one pending request per pair over the whole log. `x_capacity_transfer_nonstratified.lp` enforces token transfer by rule. Both show why those checks belong at intake.

`symmetry_check.py` then swaps two judges' names in `sameness.lp`, solves again, and compares each predicate's extension with the renamed original.

**Command:** `./run.sh` here, or `../run.sh --check reference-shapes`.

**Expected result:**
- The five main programs are stratified, have one model each, and pass every assertion (4, 29, 23, 18 and 13).
- The two `x_` programs are reported not stratified; the capacity one also has arithmetic in a recursive stratum.
- The symmetry check finds 44 predicates, of which exactly `drawn` and `rank` are asymmetric.
