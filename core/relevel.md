# Re-levelling plan

**Status: Proposed with ADR-ETH-03, 2026-10-05.** This file says what changes in this repository and in the companion paper if ADR-ETH-03 is accepted. It proposes; it moves no existing file. The split of the core's normative text into `core/L0.md`, with its tests in `core/tests.md`, is already made in this change, because a signature must cover the normative text alone. Every other move is a separate change, made after the decision and after the consolidated text (open pull request #9) lands or is withdrawn.

## 1. The levels, the two relations, and the vocabulary

| Level | Name | What it is | How it changes |
|---|---|---|---|
| L0 | the core | `core/L0.md`, one version identified by its digest | not by any step of an instance; a new version is published, and a constitution conforms to it by its own change |
| L1 | a constitution | for the meta-agentic instance: ADR-ETH-01 with ADR-ETH-02 and their consolidated text | by the constitution's own constitutional change; for the meta-agentic constitution, both Custodians' signatures (ADR-ETH-02 C2, P1) |
| L2 | a deployment's parameters and rules | a founding document's values within the bounds L1 fixes, and rules admitted through the governed channel | by the governed channel (ADR-ETH-02 T, C15) |

There are two relations, never one. A constitution (L1) **conforms to** a version of the core (L0). A deployment — a founding document with its parameter values — **is an instance of** a constitution, and conforms to the core through it. In ADR-ETH-01 and ADR-ETH-02, *instance* always means a deployment, and *parent* means the constitution its deployments adopt. The meta-agentic constitution has one deployment today, the one its founder runs, and may have more.

The records written before ADR-ETH-03 are read through this mapping:

| In ADR-ETH-01 and ADR-ETH-02 | Under ADR-ETH-03 |
|---|---|
| "the L0 constitution", "L0" | the meta-agentic constitution, level L1 |
| "an L0 change", "L0 amendment" | a constitutional change of the meta-agentic constitution |
| "L1", "the parameter is L1" | level L2 |
| "the parent" (D6), "a new parent version" | the L1 constitution, as the template of its deployments, and a new version of it |
| "instance" | a deployment, an instance of the L1 constitution |
| "the parent's fixtures" (C15, C3, D7) | the L1 constitution's fixtures; the core has none |
| "floor" fixed by L0 (T) | a floor fixed by the constitution, at or above the core's |

Under this mapping C15's conformance test keeps its meaning: a deployment conforms when, on the constitution's fixtures at its own values, its derivation rules derive every finding the constitution's derive. A constitution conforms to the core when it meets the floors of `core/L0.md`, tested by the checks of `core/tests.md` §4.

The records are not rewritten: the evolution stays readable, and a past verdict is replayed against the text that governed it (F8). The mapping is stated here and in ADR-ETH-03, and the consolidated text adopts the new terms when it is next changed.

## 2. Proposed file moves

| Now | Proposed | Reason |
|---|---|---|
| `core/L0.md`, `core/tests.md`, `core/pathologies.md`, `core/instances.md` | stay | the core and its analysis |
| `constitution/` (pull request #9) | `instances/meta-agentic/constitution/`, with `L0.md` renamed `constitution.md` | it is a constitution, level L1 |
| `constitution/tools/` checks that test core floors | `conformance/core/`, extended with the checks of `core/tests.md` §4 | the README already reserves `conformance/` for what every kernel must pass |
| `constitution/tools/` checks of the meta-agentic mechanism (fragment, binding, manifest) | stay with the constitution | the fragment is the meta-agentic constitution's mechanism for LEX.2, not the core's |
| `threat-model/` | `instances/meta-agentic/threat-model/` | it maps ADR-ETH-01 and ADR-ETH-02; `core/pathologies.md` is the core's counterpart |
| `genesis/` (reserved in the README) | `instances/meta-agentic/genesis/` | a genesis manifest belongs to a deployment |
| `docs/adr/ADR-ETH-01`, `ADR-ETH-02` | stay; at ratification their front matter gains `level: L1 (meta-agentic)` | records do not move; the act that ratifies them can say what they are |
| `evidence/` | stays; each run's README states which level its result supports | evidence is shared |
| `README.md` | the practitioner section's "The L0 constitution for ecosystems of agents" becomes a description of the three levels and two relations; "Parent and instance" keeps its meaning under §1's mapping | the README describes the repository as it is |

## 3. The adoption and ratification acts

ADR-ETH-03 K4 orders them for the meta-agentic deployment:
1. The founding document, at $e_0$, names the digest of `core/L0.md` and of the L1 constitution, and publishes the Custodians' verification keys (ADR-ETH-02 S1, genesis).
2. The ratification, signed by both Custodians, signs one manifest listing every ratified object: `core/L0.md`, ADR-ETH-01, ADR-ETH-02, ADR-ETH-03 and the consolidated text's `MANIFEST.json`.
3. Both acts are made under the genesis regime and marked so, and go for re-decision at its end (H3, GEN.2).

ADR-ETH-02's status sentence now names an act over two digests; carrying the manifest needs that sentence amended before the act, which ADR-ETH-02 allows until then and which is the founder's edit (OD28).

## 4. The companion paper

The paper's thesis moves from the constitution to the core. Proposed structure:

1. **The question.** A good constitution is one of many; which part of it is the originator, the part every just constitution shares?
2. **The model.** The transition system of `core/L0.md` §1, as an abstraction with an observation map.
3. **The core.** Six principles and one transient, each clause marked a state or run property.
4. **The pathology result.** Classes defined over the model; coverage of every structural pathology; the boundary of what a core over a record cannot exclude; independence by counter-models in the model.
5. **The multiverse of constitutions.** Constitutions as core × forces × values; conformance and instance as two relations; the partial order within one version's family; why the order is not a score.
6. **A worked derivation.** The meta-agentic constitution, clause by clause from core and forces, with the parity value marked where it forks, and its four contradictions and their edits. The paper's current account of the constitution moves here.
7. **Two sketches.** A humans-only and an agents-only autonomous constitution, from `core/instances.md`.
8. **Limits.** The genesis transient; procedurally valid evil; collusion and reward hacking, bounded and not excluded; the observation gap, measured and not closed.
9. **Related work.** Aristotle's division of constitutions into correct and deviant forms (*Politics*, Book III); Fuller's eight ways to fail to make law (*The Morality of Law*, 1964), seven of which the core states as floors and one of which, constancy, it leaves to constitutions (`core/tests.md` §1); Hirschman's exit and voice (*Exit, Voice, and Loyalty*, 1970), which DEL.4 and VOX restate; Ostrom's design principles for governing commons (*Governing the Commons*, 1990), which the core's perimeter, monitoring and graduated correction echo.

## 5. Moving the consolidated text, and the core as a checked source

What a move of the consolidated text touches, from its checker as it stands on its branch: nothing there hard-codes "L0" except the title and preamble of `L0.md` and the prose of `DESIGN.md`. A move changes three places: the `RECORDS` map in `constitution/tools/textchecks.py`, `manifest_files` beside it, and the directory name, which the CI workflow's path filter and the README's layout row also carry. The constitution's per-paragraph source tokens (`01:`, `02:`) carry over unchanged.

**The core as a source.** The core is a separate artifact the constitution's inventory can point into, so the sufficiency map of `core/tests.md` §3.3 becomes a machine check rather than a table.

- *Two new keys.* `03` names `docs/adr/ADR-ETH-03-core-and-levels.md`. Its force `F10`, criterion `E` and decisions `K1`–`K8` are bold-led units in the form the existing unit parser reads (`**K1 — …**`). `L0` names `core/L0.md`. Its units are its clause identifiers: a list item whose first bold token matches `(MEM|DEL|LEX|IMP|VOX|COR|GEN)\.[0-9]+`. Definitions and the GEN lemma carry no identifier and are not units.
- *A new inventory column.* Each paragraph in `clauses.tsv` gains a `core` column naming the `L0:` clauses it sits under, for example `L0:IMP.5 L0:VOX.4` for P2's review paragraph. A paragraph that sits under none says why: non-normative (the dedication), or editorial.
- *A gaps file with three marks.* `core-gaps.tsv` lists every `L0:` clause the constitution does not fully meet, with one of three marks:
  - `none` — no paragraph renders it;
  - `partial` — a paragraph renders it in part, and the row names what is missing;
  - `contradicts` — a paragraph conflicts with it, and the row names that paragraph and the edit that would resolve it.

  Its seed is `core/core-gaps.tsv`: the 26 floors §3.3 of `core/tests.md` does not mark covered, with their marks, the paragraphs concerned and what is missing or the edit that would resolve the contradiction. It moves beside the constitution's inventory when the consolidated text lands.
- *The two-way totality check, extended.* Every paragraph names at least one `L0:` clause or is listed with a reason. Every `L0:` clause is named by a paragraph or listed in `core-gaps.tsv`. The check refuses a `core` entry naming a clause that a `contradicts` row lists against the same paragraph, so a paragraph cannot claim the clause it breaks.
- *What it checks and what it does not.* It checks that the map is total in both directions, that every name resolves, and that no paragraph claims a clause it contradicts. It does not check that a paragraph meets the clause it names; that is what the floor checks of `core/tests.md` §4 do.
