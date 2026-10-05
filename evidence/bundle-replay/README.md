# Bundle replay under negation

**Backs:** theorem "Bundle replay is unsound; proof-carrying replay is sound" (the counterexample is the checked part). Clause C12. The appendix listing "Bundle replay under negation" is a shortened form of this program.

**What it computes.** It runs the same gating rule twice. The first run uses the full working-state slice. The second uses a bundle that omits the closure act. A proof-carrying replay, which requires a non-membership proof for every lookup under negation, rejects the bundle. The program is checked by `../checker/check.py`.

**Command:** `./run.sh` here, or `../run.sh --check bundle-replay`.

**Expected result:** the program is stratified, has one model, and passes 3/3 assertions. The bundle excludes bob and the full slice does not; the replay does not accept the bundle.
