# A per-party reply credential re-links

**Backs:** theorem "A per-party reply credential re-links" (six assertions). Clause A2.

**What it computes.** It starts from the mitigated view of `../keyed-views`, in which findings appear under per-finding handles. It then adds signed replies and compares two designs on the same facts: one reply key per party, and one reply key per finding. A last section shows the residual timing channel: a reply that falls in the same time bucket as one party's attributed act. The program is checked by `../checker/check.py`.

**Command:** `./run.sh` here, or `../run.sh --check reply-credential`.

**Expected result:** the program is stratified, has one model, and passes 6/6 assertions. With per-party keys, two replies link their findings, and the resolution of one finding re-attributes the other. With per-finding keys the signatures link nothing, but the timing channel still names the replier when no other party acted in that time bucket. That residue is hazard H2.
