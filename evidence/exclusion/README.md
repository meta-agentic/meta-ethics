# Exclusion and the voting base

**Backs:** theorem "Exclusion is a capture lever unless the base is fixed". It is also the full version of the appendix listing "Exclusion with a shrinking and a fixed base". Clause A2 (recusal).

**What it computes.**

- **`exclusion.lp`:** an eight-party roster at share one half, with a coalition of three, below the capture cost of four. Three matters are tested: one implicates three honest voters, one implicates all five, and one leaves a two-party rump. The program compares two bases. In the first, the implicated leave the roster (a shrinking base). In the second, the base is frozen at filing and the implicated stay in it as non-approvers.
- **`exclusion_sweep.py`:** for rosters of 5, 8, 12 and 20 at shares 1/2 and 2/3, and for every coalition below the capture cost, it computes the fewest exclusions that let the coalition pass a matter under each base. It also computes how many exclusions force escalation. The arithmetic is exact. Only the informative rows are printed.

**Command:** `./run.sh` here, or `../run.sh --check exclusion`.

**Expected figures:**
- `exclusion.lp` passes 10/10 assertions: under the shrinking base the coalition captures q9 with no honest vote, and under the frozen base it captures nothing.
- Sweep: N = 8, share 1/2, coalition 3 needs **2** exclusions under the shrinking base. The frozen-base column is `None` in every row, meaning no number of exclusions passes anything.
