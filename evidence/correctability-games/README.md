# Correctability games

**Backs:** the theorems "The summed measure is not monotone", "Unbounded levers defeat closure", "Memory is needed under imperfect information" and "Whole-state checking does not scale; per-finding checking does". Axiom of correctability (clause A3).

**What it computes.**

- **G1:** a turn-based game over one open finding. The coalition holds contest and extension levers; the outsiders let time pass and close the finding at window zero. The program computes the outsiders' attractor. On every edge the outsiders can play while winning, it tests whether the scalar rank "open + remaining window" or the lexicographic pair (levers left, window) increases. It runs once with finite lever ceilings and once with unbounded levers.
- **G2:** the global open count against a coalition that opens findings on its own sub-agents.
- **G3:** whether outsiders who do not know the coalition still have one strategy that wins against every coalition.
- **G4:** imperfect information with a failure counter saturated at one. It enumerates all 9 memoryless strategies and all 6 orderings that remember whom they tried, and counts the strategies that win against every hidden two-member coalition.
- **G5:** state-space sizes, computed from the declared shape of the per-party state at five roster sizes, against a per-finding abstraction.

Everything is exact enumeration; nothing is random.

**Command:** `./run.sh` here, or `../run.sh --check correctability-games`.

**Expected figures:**
- G1, finite levers: the outsiders win from the start; the scalar rank increases on **36** edges; the lexicographic pair increases on **0**.
- G1, unbounded levers: the outsiders do not win from the start.
- G4: memoryless strategies win **0 of 9**; strategies with memory win **6 of 6**. That the two classes coincide under perfect information is stated in the output as the known property of ATL; the program does not compute it.
- G5: explicit states 1e32.4 at ten parties and 1e376.3 at fifty; the per-finding abstraction ranges from about 252 to about 2304. These counts cover per-party local state only, so the whole-state figures are lower bounds.
