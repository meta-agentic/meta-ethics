# Superset conformance

**Backs:** theorem "Superset conformance fails a more protective instance", and the tested half of the thesis "Conformance". Clause C15.

**What it computes.** One fixture: a request whose owed answer is pending, and a finding closed against a party who is awaiting a remedy window. The derivation stratum is solved with clingo in three runs:

1. the parent's rules at the parent's windows, against the same rules at an instance's longer windows;
2. the parent's rules against an instance that adds an obligation, both at the instance's values;
3. the parent's rules against an instance that adds a rule feeding a negation, at equal values.

**Command:** `./run.sh` here, or `../run.sh --check superset`.

**Expected result:**
- Run 1: the superset fails. Breach and remedy are derived only at the parent's values.
- Run 2: the superset holds.
- Run 3: the superset fails. The added rule removes the breach.
