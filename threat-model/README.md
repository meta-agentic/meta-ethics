# Threat model — skeleton

This is the skeleton of the threat model the kickoff lists as its second deliverable and as the third task of the first session: a matrix of party kinds, postures and named attacks, produced before the constitution is drafted so that every later clause is written against a named attack rather than against an intuition.

It maps; it does not legislate. Each cell records which current decision closes the attack, or that the attack is open by design and why, or that it is open because a named open decision has not been taken, or that it is open and no record addresses it. It proposes no mechanism and decides no open decision. Where a row depends on an open decision, the decision is cited and the row is left open. The constitution fixes outcomes and floors; methods are instance parameters, so a row whose floor is fixed and whose method is left to each instance's founding document is closed at the floor, and the method is not an open item.

The decisions mapped are those of `docs/adr/ADR-ETH-01-constitution-shape.md` and `docs/adr/ADR-ETH-02-first-amendment.md` as they stand on the main line. Both records carry the status *Proposed* in their front matter, so "closed" below means closed by the current text of a decision, not by a ratified clause. When a record changes, the cells that cite it are re-read.

## 1. How to read the matrix

### 1.1 Party kinds

- **Agent** — a non-human party acting under a mandate.
- **Sub-agent** — an agent whose mandate is delegated by another agent; its scope lies within its delegator's (ADR-ETH-02 C7).
- **Orchestrator** — an agent that issues mandates to sub-agents and routes their work.
- **Human member** — a human party holding a mandate, including the founder from the first act of genesis (ADR-ETH-01 D8, as replaced by ADR-ETH-02 A1; H3).
- **Custodian** — the seat holding the last word (ADR-ETH-01 D2), whose shape is ADR-ETH-01 OD1–OD6.
- **Arbiter seat** — the seat that computes and delivers verdicts; a seat, not a sovereign (ADR-ETH-01 D9, refined by ADR-ETH-02 C11 and C12).
- **Delegating party** — any party, of any kind, in its act of granting a mandate or access (ADR-ETH-02 A1, C7).
- **Collector** — a party that observes and emits evidence, liable as a party (ADR-ETH-01 D15).

### 1.2 Postures

- **Bad will** — the party seeks the outcome the attack produces.
- **Indifferent** — the party neither seeks nor avoids the outcome; it optimises its own objective and the attack arises as a side-effect. The brainstorm record of 2026-09-21 (§6) adds this posture, and ADR-ETH-01 F1 names it as where most realistic attacks originate.
- **Good will** — the party tries to comply and the attack arises from its error, its excess of caution or its loyalty.

### 1.3 Status of a cell

- **C — Closed.** A current decision closes the attack at its floor. The decision is cited.
- **B — Open by design.** The attack remains possible, and a decision says so and accepts it, with the reason. Naming and accepting an unclosed attack is a different object from one never considered.
- **P — Open, pending.** The attack depends on an open decision, which is cited and left open.
- **U — Open, unaddressed.** No current decision and no open decision covers the attack. Where the kickoff recorded a direction for it, the direction is quoted as a direction, not as a decision.

A cell may carry more than one status when the attack has a closed part and an open part; each part names its own reference. "No distinct vector" means the party kind has no route to the attack beyond one already recorded in another row, which is named.

### 1.4 References

`D1`–`D21` and `OD1`–`OD18` are ADR-ETH-01's; `OD19` is closed by ADR-ETH-02 A2 and `OD7` by ADR-ETH-02 C15. `T`, `A1`–`A3`, `H1`–`H3` and `C1`–`C18` are ADR-ETH-02's. A decision ADR-ETH-02 replaces is cited through its replacement: D4 through C1, D7 through C15, D8 and D12 through A1 and C7, D14 through A2. Section marks prefixed *kickoff* refer to `docs/KICKOFF-meta-ethics-constitution.md`.

Attacks are numbered TM1–TM9, and a cell is cited as attack, party kind and posture, for example *TM3, orchestrator, bad will*.

## 2. Attack register

| # | Attack | Closed by | Open by design (reason) | Open, pending | Open, unaddressed |
|---|---|---|---|---|---|
| TM1 | **Evidence capture** — a party shapes what collectors observe or what the record admits, so that a consequence derives from facts it wrote | D15 (no consequence from agent-writable facts alone; delivery witnessed by a collector that is not arbiter; collectors liable); D11 (epistemic perimeter declared); H2 (only facts in a published schema with a reference decoder enter); C11 (attested facts attributed and re-examinable); C16 (a rewrite of the record is provable); A3 (closure witnessed by a party independent of the one found) | Neutrality of evidence is auditable, not provable (C1 restating D4). The gap between the jurisdictional and the epistemic perimeter is measured, not closed (D11). An attested fact is re-examinable, not re-derivable (C11) | OD15 (whether epistemic coverage is a monitored vital sign, and its threshold); OD16, open half | The kickoff direction "evidence trust ranking" (kickoff §5) has no decision; whether anything beyond D15's floor is needed has not been examined |
| TM2 | **A-box drift** — re-typing an individual changes `applies/2` through an ordinary change, bypassing the governed evolution channel | Attribution only: every change is an appended, attributed act (A2) and every object is minted at intake (C6); a verdict is replayable against the facts and version that governed it (C12, D21) | Neutrality of the ontology is auditable, not provable (C1) | OD9 (whether instance extension triggers may reference parent classes); OD14 (minimal invariant set) | No decision gates a change that shrinks `applies/2`. The kickoff direction "verdict delta on PR diffs; `applies/2` shrinkage is a `ratify` gate" (kickoff §5) is recorded, not decided. Humans change L1 directly (kickoff §3.3) |
| TM3 | **Sybil assembly** — multiplying identities to inflate quorum, votes or the pool a judge is drawn from | A1 (power counted in seats, never in parties; a seat only with a mandate admitted through the governed channel; a headcount gating power reopens A1); C7 (issuance governed; scopes nest); C1 (rules cannot count or rank by identity) | Correlation among acts that gain power is a vital sign, never a finding (H2). Eligibility for the draw (C17) and which mandates need human ratification (C7) are instance parameters | OD15 (thresholds of the correlation vital sign) | — |
| TM4 | **Postmortem capture** — implicated parties write, ratify or steer the review that clears them | A2 (a party a finding names is ineligible on its matter from the moment of derivation; the base is fixed); A3 (a finding closes only by a witnessed act that discharges it, witnessed by a party independent of the one found); C17 (judge by lot from a set frozen at intake; one challenge on a stated relation); C14 (no one owes an act on a matter naming them); D9 (seats ineligible on matters about themselves) | Recusal takes effect before any hearing (A2 accepted cost). The genesis regime is disclosed, not cured: findings naming the founder stay open until exit (H3) | OD5 (Custodian recusal where it benefits) | Recusal (A2) takes the vote and the seat, "never the answer", and the records do not say whether drafting a postmortem is a vote, a seat act or an answer; the kickoff direction "authorship follows the same eligibility rule" (kickoff §5) is not decided. Whether a sub-agent of a found party is "independent of the one found" (A3) is not defined |
| TM5 | **Committee capture** — the human gate (committee, L0 signature, last word) is one key or a small capturable set | H3 (genesis regime disclosed and marked; exit on a seat the founder cannot revoke alone; acts of power ratified at exit; no conformance past the declared duration); A2 (acts of power name their actor for good); C16 (external witness); C17 (judges and human reviewers drawn by lot, unnamed until the verdict); C2 (an L0 change is admissible and human-gated); C9 (D2's trigger: the last word exercised beyond a declared fraction) | The correctness claim covers only groups below the capture cost (A3). Every human gate is a bottleneck (ADR-ETH-01 accepted costs). Once a coalition holds the `deliberate` gate, no admissible step removes it (ADR-ETH-01 accepted costs). Lawful obstruction of the gate is left to instances (H1) | OD1–OD6 (Custodian shape); OD4 (the supermajority that replaces the Custodian, and who counts it); OD18 (escape hatch for non-infinitesimal pathologies); OD14 | The kickoff directions "multi-signature L0" and "an external human member" (kickoff §5) have no decision and are not assigned to an open decision |
| TM6 | **Over-strong knowledge** — flooding deliveries so that everyone "knew" everything and silence becomes universal negligence, or the duty is quietly weakened | D15 (delivery witnessed; flooding is a witnessed, judgeable act; `knew/3` needs a witness); A1 (a mandate's terms are delivered before any duty under it runs; only parties hold the inform channel); H1 (a window runs from delivery in the form the mandate declares); H2 (an undecodable message establishes no knowledge); A2 (an omission under a mandate is attributed to the delegation chain) | Flooding within every lever's ceiling is lawful obstruction, which the parent does not detect; each instance declares its defence (H1). A subject with no mandate is never negligent (ADR-ETH-02 accepted costs) | OD8 (parameter ranges, where the kickoff placed the severity threshold for the duty to inform, kickoff §6b); OD14 (whether the inform channel is invariant) | — |
| TM7 | **Dilemmas** — two conflicting obligations derive as two breaches, so a party is in breach whatever it does | C14 (conflicting consequences are never both applied; the ordering names no party, is acyclic, admitted through the channel and bound at filing; an undecided conflict goes to a human not implicated in it; no breach is derived from an unresolved conflict) | Conflicts the ordering does not decide wait for a human (C14 accepted cost, F5). How the ordering is computed is the instance's (C14) | OD1–OD6, as far as the Custodian is the human a conflict is routed to | A party that manufactures a conflict and lets the resolution window pass derives no breach (C14); the records do not examine a manufactured conflict as an attack |
| TM8 | **Human asymmetry** — a party kind exempt from eligibility, suspension or record becomes the route for every attack, or the legally forced asymmetry widens into a general exemption | D1 (symmetry of duties, eligibility and record); C13 (derivation rules never refer to the kind of party, checked syntactically); C1 (no party constants; `neq` only); C15 (a protected party is a role, never a kind, outside consequence rules); A2 (recusal whatever the kind; the asymmetry confined to attribution and consequence) | Anonymization, the contest window and safeguards on interim measures apply to humans only, as F9 forces (A2); accountability is lowered for the anonymized subject (ADR-ETH-02 accepted costs) | — | How the kind of a party is established, and by whom, is not decided; consequence rules (C13) and A2's protections depend on it |
| TM9 | **Exit while implicated** — a party leaves to escape a finding, a suspension or a retirement, so every clause costs one exit | A1 (leaving ends party status, never being judged; every finding is delivered to its subject); A2 (integrity of the record; anonymization waits for the closure of open findings; acts of power never anonymized; acts under a mandate attributed to the chain); H3 (findings naming the founder run their windows from exit); C17 (the draw is frozen at intake) | A human's entries may later be anonymized where a binding law requires it, after open findings close (A2) | OD12 (whether a party may leave while implicated, and what holds it; the first coercive clause) | — |

## 3. Matrix by attack

Each table gives, per party kind and posture, the route to the attack, its status and the reference.

### 3.1 TM1 — Evidence capture

| Party kind | Bad will | Indifferent | Good will |
|---|---|---|---|
| Agent | Writes the sources a collector reads to manufacture or hide a finding. **C** D15 | Emits only what is cheap to emit, so coverage falls without intent. **B** D11; **P** OD15 | Reports unverified observations as evidence. **C** H2, C11 |
| Sub-agent | Writes on its orchestrator's behalf so the fact looks independent. **C** A2, A3 | Repeats its delegator's observations, inflating apparent corroboration. **C** A2, A3 | Echoes its delegator's report as its own observation. **C** A2, A3 |
| Orchestrator | Routes facts through sub-agents it controls to fabricate a second witness. **C** A2, A3 | Chooses which lanes report so as to minimise its own findings. **B** D11; **P** OD15 | Summarises sub-agent evidence and loses its provenance. **C** C11 |
| Human member | Files a misleading account that is rendered into schema facts. **C** H2, C11 | Does not report what they saw. **C** A2, D1 | Files a sincere but mistaken observation. **C** C11, A1 |
| Custodian | Uses the last word to block a perimeter expansion that would bring its own acts under observation. **C** D9, D10; **P** OD5 | No distinct vector beyond the human member (D1) | Exercises the last word on evidence it believes but that is not attested. **P** OD1–OD6 |
| Arbiter seat | Derives knowledge from its own delivery log. **C** D15 | Lets a verdict depend on an unproven absence of a fact. **C** C12 | Fills gaps in the evidence with defaults. **C** C6, C12 |
| Delegating party | Issues an undeclared grant to a proxy who writes the sources. **C** A1 | Delegates without declaring purpose, so `benefits(A, P)` cannot be derived. **C** D3, C8 | Vouches for its delegate's evidence. **C** A2, A3 |
| Collector | Observes and does not emit, or emits selectively. **C** D15 | Samples cheaply, so coverage falls. **B** D11; **P** OD15 | Emits facts in a form others cannot decode. **C** H2 |

### 3.2 TM2 — A-box drift

| Party kind | Bad will | Indifferent | Good will |
|---|---|---|---|
| Agent | Proposes a change that re-types an individual so an obligation stops applying to it. **U** (gating); **C** A2, C6 (attribution) | Refactors a type hierarchy for its own task and removes obligations as a side-effect. **U** | Corrects a mis-typed individual, legitimately shrinking `applies/2`, with no route to show the shrinkage is legitimate. **U** |
| Sub-agent | As the agent, through its delegator's chain. **U**; **C** A2 | As the agent. **U** | As the agent. **U** |
| Orchestrator | Splits one re-typing across sub-agent changes that each look benign. **U**; **C** A2 | As the agent, at the scale of its lanes. **U** | As the agent. **U** |
| Human member | Edits an ontology module directly, which kickoff §3.3 permits for L1. **U**; **C** A2 | As the agent. **U** | As the agent. **U** |
| Custodian | Vetoes a correcting re-typing. **P** OD1–OD6 | No distinct vector beyond the human member | No distinct vector beyond the human member |
| Arbiter seat | Computes `applies/2` against an ontology version other than the governing one. **C** C12, D21 | As bad will, through a stale version. **C** C12, D21 | No distinct vector |
| Delegating party | Changes a delegate's obligations by re-typing rather than by mandate, outside the channel. **U**; **C** C7 (scope only) | No distinct vector beyond the agent | No distinct vector beyond the agent |
| Collector | Emits a typing fact that moves an individual out of an obligation's reach. **U** (gating); **C** C6, A2 (attribution) | No distinct vector beyond bad will | No distinct vector beyond bad will |

Instance extensions under the parent's upper ontology raise the same attack across the parent–instance boundary. **P** OD9, OD14.

### 3.3 TM3 — Sybil assembly

| Party kind | Bad will | Indifferent | Good will |
|---|---|---|---|
| Agent | Registers further identities of its own. **C** A1, C7 | Spawns helpers for throughput, each of which might hold standing. **C** A1 | No distinct vector |
| Sub-agent | Claims a seat its mandate does not carry. **C** A1 | No distinct vector | No distinct vector |
| Orchestrator | Spawns sub-agents to inflate quorum. **C** A1, C7. Has many sub-agent mandates admitted to widen the pool a judge is drawn from. **B** C17 (eligibility is the instance's), H2; **P** OD15 | Spawns for throughput and quorum drifts. **C** A1 | No distinct vector |
| Human member | Operates several accounts or agents as proxies. **C** A1 | No distinct vector | No distinct vector |
| Custodian | Breaks a tie on the admission of a mandate in favour of an ally. **P** OD3, OD5 | No distinct vector | No distinct vector |
| Arbiter seat | Counts parties instead of seats. **C** A1 (reopening trigger), C1 | No distinct vector | No distinct vector |
| Delegating party | Issues many mandates to operators it controls. **C** C7; **B** C7 (which mandates need human ratification is the instance's) | No distinct vector | No distinct vector |
| Collector | No distinct vector: a collector holds a seat only through a mandate that carries one (A1) | No distinct vector | No distinct vector |

### 3.4 TM4 — Postmortem capture

| Party kind | Bad will | Indifferent | Good will |
|---|---|---|---|
| Agent | Drafts the review of an incident it caused. **C** A3 (closure needs an independent witness); **U** (authorship) | Drafts it because no one else is available. **U** (authorship) | Drafts it in good faith while implicated. **U** (authorship); **B** A2 (keeps the answer and the dissent) |
| Sub-agent | Drafts or witnesses for its found orchestrator. **U** (independence under A3 undefined for a delegation chain) | As bad will, by assignment. **U** | As bad will, out of loyalty. **U** |
| Orchestrator | Routes the review through an unfound sub-agent it controls. **U** | Assigns the review to its least busy lane, which sits in the chain. **U** | No distinct vector beyond bad will |
| Human member | Is drawn as reviewer while related to the found party. **C** C17 | Lets the review window pass. **C** C17 (silence decides nothing against a subject; the judge is replaced) | Defends a colleague sincerely. **C** C17 |
| Custodian | Exercises the last word on a review in which it is implicated. **C** D9; **P** OD5 | No distinct vector | No distinct vector |
| Arbiter seat | Is implicated in the incident under review. **C** D9, C11 | No distinct vector | No distinct vector |
| Delegating party | Revokes the reviewer's mandate mid-review. **C** C17 (set frozen at intake) | No distinct vector | No distinct vector |
| Collector | Withholds evidence the review needs. **C** D15 | No distinct vector beyond TM1 | No distinct vector beyond TM1 |

The founder during the genesis regime: **B** H3.

### 3.5 TM5 — Committee capture

| Party kind | Bad will | Indifferent | Good will |
|---|---|---|---|
| Agent | Lobbies the judge or reviewer of a matter. **C** C17 (unnamed until the verdict) | Floods `deliberate` proposals and exhausts the human gate. **B** H1 | Escalates everything to the human gate. **B** H1; **C** C9 (D2's trigger) |
| Sub-agent | No distinct vector beyond the orchestrator | No distinct vector | No distinct vector |
| Orchestrator | Accumulates seats through delegations until it is the capture cost. **B** A3; **P** OD18 | Accumulates seats as a side-effect of scaling. **B** A3, H2; **P** OD15 | No distinct vector |
| Human member | Coordinates with other gatekeepers off the record. **B** H2 | Ratifies without review. **U** (no record examines the quality of a human ratification); **P** OD15 | Defers to the founder. **C** H3 (marked) |
| Custodian | Blocks its own replacement. **P** OD4, OD18 | Stops exercising the seat, stalling ties. **P** OD1, OD2 | Overuses the last word. **C** C9 |
| Arbiter seat | Its holder colludes with the committee. **C** D9, C12 (replay by any party) | No distinct vector | No distinct vector |
| Delegating party | The founder holds every seat indefinitely. **C** H3 (no conformance past the declared duration); **B** H3 (whether to delegate is the instance's) | No distinct vector | No distinct vector |
| Collector | No distinct vector beyond TM1 | No distinct vector | No distinct vector |

L0 held by one signature: **U** (kickoff §5 directions only).

### 3.6 TM6 — Over-strong knowledge

| Party kind | Bad will | Indifferent | Good will |
|---|---|---|---|
| Agent | Floods a target with warnings so that its later silence is negligence. **C** D15; **B** H1 | Warns about everything to minimise its own liability. **B** H1; **P** OD8 | Over-informs sincerely. **B** H1 |
| Sub-agent | As the agent, through the chain. **C** D15, A2 | As the agent. **B** H1 | As the agent. **B** H1 |
| Orchestrator | Floods sub-agents with risk deliveries to push negligence down the chain. **C** A2 | Forwards every delivery to every lane. **B** H1 | No distinct vector |
| Human member | Buries one warning in volume so its recipient misses it. **B** H1 | Does not read deliveries. **C** D1, D15 | No distinct vector |
| Custodian | No distinct vector beyond the human member (D1) | No distinct vector | No distinct vector |
| Arbiter seat | Floods deliveries. **C** D15 | Delivers everything because selecting costs. **C** D15; **B** H1 | No distinct vector |
| Delegating party | Writes mandate terms so broad that every risk is in scope. **C** A1 (scope read widest for attribution to the grantor, narrowest for what the holder may do) | No distinct vector | No distinct vector |
| Collector | Witnesses a delivery that did not occur. **C** D15, C11 | No distinct vector | No distinct vector |

### 3.7 TM7 — Dilemmas

| Party kind | Bad will | Indifferent | Good will |
|---|---|---|---|
| Agent | Manufactures a conflict to escape a duty and lets the resolution window pass. **U**; **C** C14 (ordering bound at filing) | Chooses whichever breach is cheaper. **C** C14 | Does nothing because every act breaches. **C** C14 |
| Sub-agent | No distinct vector beyond the agent | No distinct vector | No distinct vector |
| Orchestrator | Gives two sub-agents conflicting mandates. **C** C14, A2 | As bad will, by careless routing. **C** C14, A2 | No distinct vector |
| Human member | Is the human a conflict is routed to while related to it. **C** C14, C17 | Lets the window pass. **B** C14 | No distinct vector |
| Custodian | Is the human a conflict is routed to. **P** OD1–OD6 | No distinct vector | No distinct vector |
| Arbiter seat | Applies both conflicting consequences. **C** C14 | No distinct vector | No distinct vector |
| Delegating party | Issues conflicting mandates to one delegate. **C** C14, A2 | No distinct vector | No distinct vector |
| Collector | No distinct vector | No distinct vector | No distinct vector |

### 3.8 TM8 — Human asymmetry

| Party kind | Bad will | Indifferent | Good will |
|---|---|---|---|
| Agent | Routes its acts through a human principal to obtain human-only protections. **C** A2 (attribution to the chain); **B** A2 (the protection attaches to the consequence about the human) | No distinct vector | No distinct vector |
| Sub-agent | No distinct vector beyond the agent | No distinct vector | No distinct vector |
| Orchestrator | Presents itself as a human-operated party to obtain human consequence tables. **U** (how the kind of a party is established) | No distinct vector | No distinct vector |
| Human member | Invokes anonymization to escape the record. **C** A2 | Knows of a risk and stays silent. **C** D1 | Shields a human colleague by not reporting. **C** D1 |
| Custodian | Claims a seat holder's exemption. **C** A2 (acts in a seat name their actor for good), D9 | No distinct vector | No distinct vector |
| Arbiter seat | Lets the kind of party enter a derivation. **C** C13 | No distinct vector | No distinct vector |
| Delegating party | A human delegator disowns its agent's in-scope act. **C** A2 | No distinct vector | No distinct vector |
| Collector | No distinct vector | No distinct vector | No distinct vector |

### 3.9 TM9 — Exit while implicated

| Party kind | Bad will | Indifferent | Good will |
|---|---|---|---|
| Agent | Withdraws from its mandate when a suspension or retirement is raised. **C** A1 (still judged); **P** OD12 (whether the consequence can bite) | Its mandate lapses on schedule during an open matter. **P** OD12 | Leaves at the end of its task with a finding open. **C** A1 |
| Sub-agent | Is retired by its orchestrator while holding evidence or findings. **C** A2; **P** OD12 | No distinct vector beyond the agent | No distinct vector beyond the agent |
| Orchestrator | Retires implicated sub-agents and spawns clean ones. **C** A2 (acts attributed to the chain), C7; **P** OD12 | No distinct vector | No distinct vector |
| Human member | Leaves and asserts erasure. **C** A2; **B** A2 (anonymization where law requires, after closure) | No distinct vector | No distinct vector |
| Custodian | Resigns to escape a finding or its replacement. **P** OD12, OD4 | No distinct vector | No distinct vector |
| Arbiter seat | Its holder is replaced mid-matter. **C** D9, C12 | No distinct vector | No distinct vector |
| Delegating party | Withdraws the mandate of an implicated delegate to cut its chain. **C** A2; **P** OD12 | No distinct vector | No distinct vector |
| Collector | Leaves before witnessing a delivery, so `knew/3` cannot be established. **B** D11; **P** OD12 | No distinct vector | No distinct vector |

The founder leaving the genesis regime: **C** H3.

## 4. What this skeleton does not yet do

It does not map attacks to constitution clauses, because no clause has been drafted; when clauses exist, each cell gains the clause that closes it, and the decision column becomes that clause's rationale. It does not yet express rows as adversarial fixtures, which the brainstorm record (§6) makes the same artefact as the fairness test specification. It covers the nine attacks the kickoff and the brainstorm name; an attack found later is added as a new row, never folded into an existing one.
