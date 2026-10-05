# The external witness and forks

**Backs:** theorem "A timestamp authority cannot prove a fork". Clause C16 and hazard H3 (the genesis regime).

**What it computes.**

- **`genesis_regime.lp`:** checked by `../checker/check.py`. It covers the exit from the genesis regime as an event, and a fork derived from two witnessed heads with no prefix proof between them. It carries ten assertions.
- **`witness_fork.py`:** one fork scenario for each witness design. The first is a timestamp authority, which signs unlinked tokens. The second is an append-only log, whose entries are linked and public. For each design it reports whether a fork is provable by one reader, by the witness's own record, or by two readers comparing.

**Command:** `./run.sh` here, or `../run.sh --check witness-fork`.

**Expected result:**
- `genesis_regime.lp` is stratified, has one model, and passes 10/10 assertions.
- The timestamp authority proves no fork from any of the three positions.
- The log proves the fork from all three.
