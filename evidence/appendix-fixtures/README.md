# The appendix listings

**Backs:** the three listings in the paper's appendix "Reference fixtures":

- the working state and laundering;
- exclusion with a shrinking and a fixed base;
- bundle replay under negation.

**What it computes.** Each listing has been copied verbatim from the paper. Its closing `% expected:` comment is restated as `% EXPECT:` / `% EXPECT-NOT:` lines, which `../checker/check.py` asserts against the single model. The longer programs these listings were cut from are in `../reference-shapes` (`working_state.lp`), `../exclusion` and `../bundle-replay`.

**Command:** `./run.sh` here, or `../run.sh --check appendix-fixtures`.

**Expected result:** all three listings are stratified, have one model, and pass every assertion (6/6, 2/2, 3/3).
