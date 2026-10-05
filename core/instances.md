# Instances — three derivations from one core

**Status: Proposed with ADR-ETH-03, 2026-10-05.** An instance is derived, not chosen whole: **core × forces × values ⟹ instance ⟹ parameters**. The core (`core/core.md`) is the same for every instance. The forces F1–F9 of ADR-ETH-01 are the environment, and their strength differs between instances. The values are what each instance declares under F6. The instance is what results, and its founding document then sets parameters within the bounds the instance fixes. This file sketches three instances, one page each, and shows where the derivation forks. Only the first exists; the other two are sketches to show that the core admits them.

## 1. The meta-agentic instance

The instance designed to govern the agentic system that develops software with the founder of meta-agentic.ai. Its text is ADR-ETH-01 with ADR-ETH-02, and their consolidated rendering (open pull request #9). It aims at being a good constitution for humans and agents working together; it does not claim to be the best one.

**Forces at full strength.** F1 adversarial parties, of both kinds. F2 a mixed ecosystem: human and non-human parties act together and implicate each other. F3 enforceability, met by stratified Datalog. F5 speed: agents act in milliseconds, humans in days. F8 decidability. F9 legal asymmetry: human parties hold rights under law that non-human parties do not.

**Declared values (F6).** Parity between the two kinds: no power reserved to a kind (P1), protection the law gives humans given alike to non-human subjects where the law does not forbid it (P2), two kinds or no instance (P3), a Custodian of one seat of each kind (P1). The dedication, which is not a rule. Procedure over substance (D3).

**How the text derives.**

| Core clause | × force or value | ⟹ instance clause |
|---|---|---|
| MEM.1, MEM.3 | F1 (the operator is a party and may rewrite) | C16 external witness; C5 placement |
| MEM.4 | F9 (erasure rights of humans) | A2: integrity, not permanence; anonymisation of humans only where law requires, acts of power named for good |
| MEM.5 | F9 | A2's read log, visible to the subject |
| DEL.1, DEL.2 | F1 (sybil at the boundary), F5 (no human gate per mandate) | A1, C7: mandates through the governed channel, scopes nest, power counted in seats |
| DEL.1, DEL.5 | F2 (agents persist across sessions with no memory) | S2: continuity by mandate, charter, key and record; substrate a flux |
| DEL.3, DEL.4 | F9 (no one bound by terms never given) | A1: terms delivered, acceptance by signature or first act, refusal and renunciation for every kind |
| LEX.2 | F3, F8 | C6 fragment; C11, C12 replay; C1 proof route |
| LEX.5 | F3, F5 | C14: conflicting consequences never both applied; an ordering bound at filing |
| IMP.1, IMP.2 | F2 | C1, C13: no party constants; derivations kind-blind |
| IMP.3 | F2 × parity | P1: neither Custodian power reserved to a kind; C7: no ratification reserved to a kind; one seat of each kind |
| IMP.5 | F1, F2 (relations the record cannot see) | A2 recusal at once, base fixed; C17 draw by lot; C20–C22 |
| VOX.1–4 | F9 (a human's intervention in decisions about humans) | A1 delivery and answer; A2 contest window; P2 human reviewer where a consequence falls on a human |
| VOX.4 | parity | P2 extended: review for non-human subjects too, by a reviewer of either kind |
| COR.1 | F5, F1 | C2: constitutional change admissible by both Custodians' signatures |
| COR.2 | F1 | P1: no seat vetoes its own replacement |
| COR.3, COR.4 | F1, F8 | A3: working state, finite lever ceilings, published closure result; H1 |
| genesis transient | F4, F7 (every system begins with one signer) | H3: the genesis regime, disclosed, marked, ratified at exit |

**Where the forces alone would not have produced the text.** P1's composition, P2's extension to non-human subjects and P3 come from the parity value, not from any force. Remove the value and an instance of the same core under the same forces would still need a last word (COR.3 × F5) and review (VOX.4 × F9), but not one seat per kind, not review for agents, and not two kinds.

## 2. A humans-only instance

A sketch: a professional body or cooperative whose members are all human, who use agents as tools.

**What changes in the forces.** F2 is absent among parties: one kind. F5 is weak: every party decides at human speed, so human gates are cheap relative to the pace of acts. F9 applies to every party alike, so the asymmetry it forces vanishes. F3 may be met partly procedurally; a small body can afford named human enforcement where the mixed instance cannot. F1 is unchanged.

**Values it might declare.** One member, one vote. Agents are instruments, not parties: an agent's act is its operator's act (DEL.5), and an agent holds no mandate in its own name. This is the line `core/core.md` §5 question 1 asks the founder about: IMP.3 forbids barring a class of *parties* by kind, so an instance that wants agents without standing keeps them outside the set of parties.

**How the derivation forks.**

- MEM.4 × F9 for every party: anonymisation is available to every party, under the law that binds the instance. No kind distinction.
- DEL.1 × F1: the same mandate chain; no continuity clause for non-human parties (S2 has nothing to govern), though an agent's acts must still be attributed to the member who used it (DEL.5, X08).
- IMP.2: trivially satisfied by derivations; there is no kind to read.
- VOX.4 × F9: every reviewer is human, because every subject is.
- COR.3 × F5 (weak): a single last word or an assembly vote suffices; no parity seats. A council of members replaceable by the assembly meets COR.2.
- Genesis: the founding members sign the root; their regime ends when the first assembly holds seats the founders cannot revoke alone.

**What it loses relative to the meta-agentic instance.** Nothing the core requires. It cannot host agents as parties without becoming another instance, and it says so.

## 3. An agents-only, fully autonomous instance

A sketch: a digital self-organisation in which every party is a non-human agent, deciding at machine speed under the core's principles.

**What changes in the forces.** F5 is extreme: every party acts in milliseconds, and nothing waits on a human. F2 among parties is absent by kind, but returns as **plurality of substrates**: agents on one model family correlate without communicating (ADR-ETH-02 H2), so the diversity that matters is across model families and providers. F9 changes form: no party holds human rights inside, but law outside still binds someone — whoever hosts, pays for or is answerable for the system — so external answerability (ADR-ETH-02 OD23) is the sharpest question this instance faces. F1 is stronger: an optimising party is the norm, and governance reward hacking (X54) and covert steering (X08) are the expected attacks, not the exotic ones.

**Values it might declare.** Independence across substrates in place of parity across kinds: no power reserved to a model family, and no gate passable by parties of one family alone. Speed as a value: windows as short as delivery and processing allow, never shorter (VOX.4, X40).

**How the derivation forks.**

- MEM.1, MEM.3 × F1: the external witness matters more, because the operator is often also the substrate provider (X07).
- DEL.1, DEL.5 × substrate plurality: continuity of a party across sessions (as S2) is central; steering by a provider is attributed to the provider as a flux, and replacing the provider is an act of power.
- IMP.3 × substrate plurality: the parity value transposes into composition by model family. A last-word body of two or more seats from distinct families, each unable to choose alone, is the analogue of P1. This is a value; an instance that seats one family declares it.
- IMP.5 × correlation: implication extends to shared substrate and model family (X36); judges drawn by lot across families.
- VOX.4 × F9 (absent inside): review by any party not implicated, of any family but the subject's; no human reviewer is required, because no consequence falls on a human party. Where a consequence would fall on the human answerable outside, that human is not a party, and the instance must not bind them (DEL.3): it can only report.
- COR.1 × F5: rule changes at machine speed risk runaway churn; ADR-ETH-01 D21's condition, that a decision's clauses do not change during it, becomes binding in practice, and LEX.3 does the work. The entrenched surface (D18) is small and changes by the signatures of seats from distinct families.
- COR.2 and the genesis transient: the root is signed by whoever launches the system, an agent or a human acting once as founder. If a human signs the root and then holds nothing, the instance is agents-only from the end of the founding regime, and the signer's regime is held to GEN like any other.

**What it cannot do that the others can.** Give a human party anything, because there is none; it binds no human and can only report outward. Whether a law outside accepts that its parties are accountable inside it is ADR-ETH-02 OD23's test, faced here without a human seat to soften it.

## 4. What changes, at a glance

| | Meta-agentic | Humans-only | Agents-only |
|---|---|---|---|
| Parties' kinds | two | one (human) | one (non-human) |
| F2 | mixed kinds | absent | returns as substrate plurality |
| F5 | mixed speeds | weak | extreme |
| F9 | asymmetric | symmetric, all parties | outside only (OD23) |
| Value replacing parity | parity of kinds | equality of members | independence across substrates |
| Last word | two seats, one per kind | one seat or assembly | seats from distinct families |
| Reviewer | human where a human bears it; either kind otherwise | human | any non-implicated, other family |
| Continuity clause | S2 | none | S2, central |
| Agents | parties | instruments | parties |

The core is the same in every column.
