# Configuration check

**Backs:** theorem "The configuration check catches dead documents" (five configurations). Clause C18.

**What it computes.** For each of five declared configurations, it enumerates every roster size from 1 up to the cap. At each size it evaluates the checks the genesis validator runs:

- the first roster size at which a change can pass, with and without recusals;
- the windows against the timer ceiling;
- the minimum response window, and windows lengthened by load;
- small-count suppression against the parties subject to power;
- the eligibility of judges for a two-sided matter.

Every check is linear in the roster size, so enumeration decides it exactly. No solver is needed.

**Command:** `./run.sh` here, or `../run.sh --check configuration-check`.

**Expected result:**
- "live": every check passes. The first passable roster is 3, rising to 5 with two recusals at share one half.
- "dead by minimum": nothing ever passes.
- "dead by suppression": no roster size makes findings visible.
- "dead by windows": the contest window exceeds the ceiling, and so does the load-lengthened window.
- "degenerate lottery": no two-sided matter has an eligible judge.
