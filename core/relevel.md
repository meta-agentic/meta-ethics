# Re-levelling plan

**Status: Proposed with ADR-ETH-03, 2026-10-05.** What changes in this repository and in the companion paper if ADR-ETH-03 is accepted. This file proposes; it moves nothing. Every move of an existing file is a separate change, made after the decision and after the consolidated text (open pull request #9) lands or is withdrawn.

## 1. The levels and the vocabulary

| Level | Name | What it is | How it changes |
|---|---|---|---|
| L0 | the core | the six principles of `core/core.md`, shared by every instance | only by re-founding: a new version of the core, which each instance adopts or not by its own constitutional change |
| L1 | an instance's constitution | for the meta-agentic instance, ADR-ETH-01 with ADR-ETH-02 and their consolidated text | by the instance's constitutional change; for the meta-agentic instance, both Custodians' signatures (ADR-ETH-02 C2, P1) |
| L2 | an instance's rules and parameters | rules admitted through the governed channel, and the founding document's values within the bounds L1 fixes | by the governed channel (ADR-ETH-02 T, C15) |

The records written before ADR-ETH-03 use "L0" for the meta-agentic constitution and "L1" for its ordinary rules. Read under the levels:

| In ADR-ETH-01 and ADR-ETH-02 | Under ADR-ETH-03 |
|---|---|
| "the L0 constitution", "L0" | the meta-agentic instance's constitution, level L1 |
| "an L0 change", "L0 amendment" | a constitutional change of the instance |
| "L1", "the parameter is L1" | level L2 |
| "the parent" (D6) | the core with its conformance suite |
| "floor" fixed by L0 (T) | a floor fixed by the instance constitution, itself above the core's |

The records are not rewritten (MEM.1 applied to the records): the mapping is stated here and in ADR-ETH-03, and the consolidated text adopts the new terms when it is next changed.

## 2. Proposed file moves

| Now | Proposed | Reason |
|---|---|---|
| `core/core.md` | split into `core/L0.md` (§1 model and §2 principles, normative) and `core/analysis.md` (§3 tests, §4 checks) | the normative text should read alone, as `constitution/L0.md` does for the instance |
| `core/pathologies.md`, `core/instances.md` | stay | they are the core's analysis |
| `constitution/` (pull request #9) | `instances/meta-agentic/constitution/`, with `L0.md` renamed `constitution.md` | it is the instance's text, level L1 |
| `constitution/tools/` checks that test core properties | `conformance/core/`, extended with the checks of `core/core.md` §4 | the README already reserves `conformance/` for what every kernel must pass |
| `constitution/tools/` checks of the instance's mechanism (fragment, binding, manifest) | stay with the instance | the fragment is the meta-agentic instance's mechanism for LEX.2, not the core's |
| `threat-model/` | `instances/meta-agentic/threat-model/` | it maps ADR-ETH-01 and ADR-ETH-02; `core/pathologies.md` is the core's counterpart |
| `genesis/` (reserved in the README) | `instances/meta-agentic/genesis/` | a genesis manifest belongs to an instance |
| `docs/adr/ADR-ETH-01`, `ADR-ETH-02` | stay where they are; at ratification their front matter gains `level: instance (meta-agentic)` | records do not move; the act that ratifies them can say what they are |
| `evidence/` | stays; each run's README states which level its result supports | evidence is shared |
| `README.md` | the practitioner section's "The L0 constitution for ecosystems of agents" becomes a description of the three levels, and "Parent and instance" is restated with the core as parent | the README describes the repository as it is |

## 3. The ratification act

ADR-ETH-02 makes ADR-ETH-01 and ADR-ETH-02 one act over both digests, signed by both Custodians. ADR-ETH-03 K4 proposes that the same act also carries the digests of ADR-ETH-03 and of the core, so that the meta-agentic instance adopts the core in the act that ratifies its own constitution. That needs ADR-ETH-02's status sentence amended in place before the act, which ADR-ETH-02 allows until then. Whether to do so is the founder's decision.

## 4. The companion paper

The paper's thesis moves from the constitution to the core. Proposed structure:

1. **The question.** A good constitution is one of many; which part of it is the originator, the part every just instance shares?
2. **The model.** The transition system of `core/core.md` §1.
3. **The core.** Six principles, each with its clauses and what it leaves to instances.
4. **The pathology result.** Coverage: every structural pathology is the violation of a principle. Boundary: what a procedural core cannot exclude, and why. Independence: one witness per principle.
5. **The multiverse of constitutions.** Instances as core × forces × values; the partial order by principles satisfied and pathologies excluded; why the order is not a score.
6. **A worked derivation.** The meta-agentic instance, clause by clause from core and forces, with the parity value marked where it forks the derivation. The paper's current account of the constitution moves here.
7. **Two sketches.** A humans-only instance and an agents-only autonomous one, from `core/instances.md`.
8. **Limits.** The genesis transient; procedurally valid evil; collusion and reward hacking, bounded and not excluded; selective observation, measured and not closed.
9. **Related work.** Aristotle's division of constitutions into correct and deviant forms (*Politics*, Book III); Fuller's eight ways to fail to make law (*The Morality of Law*, 1964), which LEX and VOX restate as properties; Hirschman's exit and voice (*Exit, Voice, and Loyalty*, 1970), which DEL.4 and VOX restate; Ostrom's design principles for governing commons (*Governing the Commons*, 1990), which the core's perimeter, monitoring and graduated correction echo.

## 5. Moving the consolidated text, and the core as a checked source

What a move of the consolidated text touches, from its checker as it stands on its branch: nothing there hard-codes "L0" except the title and preamble of `L0.md` and the prose of `DESIGN.md`. A move changes three places: the `RECORDS` map in `constitution/tools/textchecks.py`, `manifest_files` beside it, and the directory name, which the CI workflow's path filter and the README's layout row also carry. The instance's per-paragraph source tokens (`01:`, `02:`) carry over unchanged.

**The core as a source.** The core is a separate artifact the instance's inventory can point into, so the sufficiency map of `core/core.md` §3.3 becomes a machine check rather than a table.

- *Two new keys.* `03` names `docs/adr/ADR-ETH-03-core-and-levels.md`, whose forces `F10`, `F11` and decisions `K1`–`K8` are bold-led units in the form the existing unit parser reads (`**K1 — …**`). `L0` names the core's normative text, `core/core.md` until it is split into `core/L0.md` (§2), whose units are its clause identifiers: a list item whose first bold token matches `(MEM|DEL|LEX|IMP|VOX|COR|GEN)\.[0-9]+`. Identifiers are stable and never reused (`core/core.md` §2, *Identifiers*).
- *A new inventory column.* Each instance paragraph in `clauses.tsv` gains a `core` column naming the `L0:` clauses it sits under, for example `L0:IMP.5 L0:VOX.4` for P2's review paragraph. A paragraph that sits under none says why: a value (the parity composition sits under `L0:IMP.3` and is also marked `value`), or non-normative (the dedication).
- *The two-way totality check, extended.* Every instance paragraph names at least one `L0:` clause or is listed with a reason; every `L0:` clause is named by at least one instance paragraph or listed in a `core-gaps.tsv` with a reason and a coverage mark, `none` or `partial`. The seven gaps of §3.3 are that file's first rows. Naming a clause does not prove the paragraph meets it, so a clause the instance covers only in part stays listed as `partial` even when a paragraph names it.
- *What it checks and what it does not.* It checks that the map is total in both directions and that every name resolves. It does not check that a paragraph meets the clause it names; that is the property checks of `core/core.md` §4.
