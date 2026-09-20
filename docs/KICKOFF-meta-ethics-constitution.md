# Kickoff prompt — Meta-ethics: a constitution for mixed human/agent ecosystems

> **How to use this file.** Paste it as the first message of a new conversation in a new project. It carries the full state of a brainstorm held on 2026-09-18 inside the software project that first needed it, so that the new session starts from decisions, not from scratch. Treat everything under "Decided" as settled unless the owner reopens it; treat everything under "Open" as the work.

---

## 1. Mission

Design the constitution (L0) that regulates an ecosystem of agents — human and non-human alike — who act under mandates delegated by parties for the common good, and who are judged by a neutral inference engine. The constitution must be pragmatic against both good will and bad will of any party, must treat human and non-human agents symmetrically in duties and record, and must provide a last word for veto and tie. The output is a text that can be loaded as rules and pinned by tests, not a manifesto.

**Placement is decided:** meta-agentic (meta-os) is the parent of this project and owns the constitution; instances adopt it as siblings, and none is privileged by having come first. The first engine to enforce it is an instance's arbiter, but the constitution, the upper ontology, the conformance suite and the reference kernel are meta-os assets. The first design question this raises — how an instance tailors the system it spawns from without breaking its guarantees — is §6b.

## 2. Origin

The design began inside a software platform in a regulated domain. Its owner decided to align the platform proactively with a pending regulation without overengineering, and captured that posture with an explicit cost rule: for each obligation, build now only if $C_n < p\,C_r'$; otherwise seam ($C_s + p\,C_r'$) or defer ($p\,C_r$), where $p$ is the probability the obligation survives into the final text.

The owner then required that governance of the platform's development be a software component, not a document: an inference engine mapping constraints into a judging filter that scrutinises both product and process. That became an engineering epic, with an addendum adding a semantic core and a governed evolution channel. The addendum's later sections — assembly and committee for incident-cited changes, duties to inform and act, suspension and retirement — are where the ethics emerged, and where the critique in §5 was written. This project takes that thread out of the epic and gives it a constitution of its own, independent of the platform where it began.

## 3. State of the design (decided in the brainstorm)

### 3.1 The judge

Arbiter is a stratified Datalog engine with negation, two comparison built-ins (`neq`, `lt`) and one aggregate (`count`), evaluating rules over facts and emitting verdicts. A verdict is a pure function of a provenance triple — SHA-256 of the rule text, SHA-256 of the canonical fact set, and the hash of the regulatory text version — and is therefore replayable. Every derived fact keeps its derivation, so every finding is explainable as a proof. Reporting predicates are a fixed contract (`block`, `gate_blocked`, `warn`, `violation`, `process_gap`, `stale`); rules decide what is a finding, code decides only how findings surface. The engine never mutates the sources it judges.

### 3.2 Semantic core

The vocabulary is an ontology expressed as triples `t(S, P, O)` with a small fixed T-box (`subClassOf`, `subPropertyOf`, `domain`, `range`, `partOf`, `appliesTo`, `requiresEvidence`, `citedBy`, `definedIn`, `supersedes`) and an entailment module of roughly a dozen Datalog rules (the RDFS fragment and the Datalog-expressible part of OWL 2 RL). Obligations attach to concepts and cite provisions keyed to a text version, so renumbering a legal text changes one module and no rule. `applies(Obligation, Individual)` is derived by subsumption, never enumerated.

### 3.3 Governance strata

| Layer | Content | Changed by |
|---|---|---|
| L0 — Constitution | Reporting contract; entailment module; meta-rules; admission classes; assembly and committee composition; duties; consequences; the last word | Humans, by signed ratification; this project writes it |
| L1 — Policy | Regulatory obligations, engineering guardrails, ontology modules, agent briefs and perimeters, response playbooks | Agents via the governed evolution channel; humans directly |
| L2 — Evidence | Everything collectors emit, including incidents, ballots and arbiter's own delivery log | Collectors only, read-only observation |

### 3.4 Governed evolution channel (GEC)

Agents never write to rules, ontology or code. They write proposals (`kind`, `target`, `baseHash`, `diffRef`, cited `rationale`) to an append-only ledger. Arbiter sandbox-evaluates each proposal against L1 (never L0) and returns an admission class with a verdict delta: $\Delta^{+}$ and $\Delta^{-}$ over reporting predicates and `applies/2`. From the delta it derives `widens_perimeter(P, A)` and `benefits(A, P)`; these are never asserted by the proposer. Admission classes: `auto` (opens a PR through the ordinary gate), `ratify` (waits for a human token), `deliberate` (assembly and committee, §3.5), `forbidden`. Any proposal that widens the proposer's own perimeter is never `auto`.

### 3.5 Incident-cited changes: assembly and committee

An agent must not be able to cause an incident, deliberately or not, to justify widening its own scope. Any proposal citing an incident is `deliberate` and admissible only when all hold: an assembly of *eligible* agents reaches quorum in favour, where eligibility excludes agents that benefit from the proposal or sit in the incident's causal chain and is derived, never declared; a committee including at least one human reaches quorum in favour; the incident's blameless postmortem is ratified (the cooling period); and the proposer is not implicated — an implicated proposer is `forbidden` before any vote. Incident *response* runs pre-authorised playbooks and never modifies a rule; a rule change citing the incident is a separate act. Both chambers are required because an assembly alone is gameable by coalition and a committee alone reintroduces the human bottleneck.

### 3.6 Duties and natural consequences

The duty to inform is universal and unconditional: every agent holds an `inform` channel that is constitutional, sits in every perimeter, and no proposal can narrow. The duty to act is bounded by perimeter. Knowledge is operational: `knew(A, R, T)` holds only when arbiter's delivery log shows it handed risk R to agent A at time T. `negligent(A, I)` is foresaw-and-did-not-inform; `aggravated(A, I)` is could-act-and-did-not. Either makes the agent implicated for any proposal citing the incident, and triggers `suspend(A)` automatically — perimeter to the constitutional minimum, tokens revoked, lanes handed to the orchestrator; protective and reversible. Retirement — ending the mandate — is a `deliberate` proposal raised by arbiter itself after the postmortem is ratified, so a false implication survives suspension only until the postmortem clears it. `standing(A, Record)` is kept for every agent as a record, never a score. Nothing rewards informing directly; the reward is survival of the mandate.

## 4. Decisions taken at the end of the brainstorm

1. **Symmetry.** Human and non-human agents are treated symmetrically in duties, eligibility and record. A human who knew and stayed silent is negligent and it is recorded. Consequence tables may differ by kind of party; the record and the derivations may not.
2. **The last word.** Symmetry produces vetoes and ties, so there must be a final decision-maker. The mechanism is to be designed here (§6). It exists; its shape is open.
3. **Procedural, not substantive.** The constitution encodes who decides, with which conflicts excluded, on what evidence — not what is good. It is a constitution, not a conscience, and it is complete only relative to the values of its authors. This is stated in the text, not hidden.
4. **Provable neutrality is partial and named as such.** Provable: determinism, identity-blindness (no L1 rule names an individual agent), and symmetry under permutation of agent identities. Not provable: neutrality of evidence, of ontology, of L0 authors. The constitution claims only the first set and makes the second auditable.
5. **Cost of compliance below cost of bypass.** Any clause whose enforcement is more expensive than working around it trains bypass; such clauses are redesigned or dropped.
6. **Parent and instance.** meta-os is the parent; Instances are siblings; none is privileged by adopting first. The parent is a template with a conformance suite, not a running authority over instances; each instance is sovereign, with its own Custodian, assembly and committee.
7. **Monotone tailoring (seeded, to be argued in §6b).** An instance may add obligations and raise thresholds; it may not remove clauses or lower thresholds. On the parent's fixtures, the instance's findings must be a superset of the parent's.

## 5. Known gaps the constitution must close

These came from a critique of the design as it stood; none is closed yet.

| Gap | Attack or failure | Direction |
|---|---|---|
| Evidence capture | An agent shapes what collectors see through sources it can write | Evidence trust ranking; no consequence derived from agent-writable facts alone |
| A-box drift | Re-typing a platform individual changes `applies/2` via an ordinary code PR, bypassing GEC | Verdict delta on PR diffs; `applies/2` shrinkage is a `ratify` gate |
| Sybil assembly | Orchestrators spawn sub-agents that inflate quorum | Seats by mandate — one delegation, one seat, inherited by sub-agents |
| Postmortem capture | The cooling precondition is theatre if implicated agents write the postmortem | Authorship follows the same eligibility rule |
| Committee capture | The human committee is the trust anchor and the single point of capture; L0 is one key | Multi-signature L0; an external human member; L0 diffs always public |
| Over-strong knowledge | If arbiter floods warnings, everyone "knew" everything and silence is universal negligence; the rule gets quietly weakened | Duties scoped by severity threshold and mandate scope; delivery is not salience |
| Dilemmas | Stratified Datalog derives two conflicting obligations as two violations and cannot weigh them | A defeasible or argumentation layer, or at minimum `conflict/2` derived and routed to the committee |
| Human asymmetry | The prior design exempted humans from eligibility and suspension | Closed by decision 1; the constitution must write it in |

## 6. The last word — seeded design and questions

The seed, to be argued rather than accepted: a single reserved seat, the **Custodian**, held by a human, with exactly two powers — break a tie and veto — and nothing else. Both powers are exercised only through the ledger, must cite a reason, are visible to every party, and are reviewed at the next retrospective. The Custodian is subject to every duty and every record like any other party; what differs is the consequence, because the natural consequence for a sovereign is withdrawal of delegation: the parties can revoke the Custodian's mandate by a supermajority that the Custodian cannot veto. The one thing the last word cannot touch is its own replacement.

Questions the new session must answer: whether the Custodian is one seat or a rotating one; whether a veto expires unless renewed; whether a tie in the assembly and a tie in the committee are broken by the same seat or by each other; what supermajority replaces the Custodian and who counts it; whether the Custodian may exercise the last word on a matter in which they benefit, or must recuse and let a deputy act; and how the seat is filled at genesis, before any party has delegated anything.

## 6b. Tailoring by the spawning instance — seeded design and questions

The parent must let any instance make the constitution its own without letting any instance hollow it out. The seed distinguishes three kinds of L0 content and one rule that binds all tailoring.

**Invariant clauses** cannot be tailored. Identity-blindness; symmetry of duties and record; response never changes rules; knowledge only from the delivery log; the `inform` channel in every perimeter; L0 human-only and signed; suspension automatic and reversible, retirement deliberate; the Custodian cannot veto their own replacement. A genesis manifest that overrides any of these is `forbidden` by the parent's own rules.

**Parameterised clauses** keep the clause and take instance values within parent-fixed ranges: assembly and committee quorums (at least a majority; at least one human), the severity threshold above which the duty to inform applies, the minimum cooling period, the constitutional minimum perimeter of a suspended agent, the supermajority that replaces the Custodian. The manifest supplies the values; the parent validates the ranges.

**Extension points** are where an instance adds: its ontology modules (for example a regulatory module, a regulatory-text module and a platform module; every instance's differ) placed under the parent's upper ontology by `subClassOf` edges only, never redefining a parent class; its L1 policies and guardrails; its collectors; and additional `deliberate` triggers (an instance may declare that any change touching flight-safety code is deliberate). Extensions may add classes, obligations and triggers; they may not remove or weaken.

**Monotone tailoring** is the single rule that makes the three kinds safe: on the parent's conformance fixtures, the instance's derived findings over reporting predicates and `applies/2` must be a superset of the parent's. Tailoring is a delta like any other, and $\Delta^{-}$ must be empty. The machinery already exists — the verdict delta of the governed evolution channel — so conformance is a run, not a review.

**The genesis manifest** is the instrument. It names the parent constitution version by hash, supplies parameter values, lists extension modules, names the first Custodian and the initial mandates, and is signed by the founding human. Arbiter validates it against the parent: no invariant overridden, parameters in range, extensions monotone, ontology edges well-formed. A conforming instance is one whose manifest validates and whose engine passes the parent's fixtures with the tailoring applied. The parent's constitution hash then becomes the fourth element of the instance's provenance — every instance verdict is replayable against a named constitution version.

**Lineage and upgrade.** An instance cites the parent version it conforms to. A new parent version does not propagate automatically; it arrives in the instance as a `ratify`-class proposal raised by arbiter, so an instance can lag, and the lag is visible in its provenance. The parent never reaches into a running instance. meta-os itself runs as an instance of its own constitution, so the parent is governed by what it ships.

Questions the new session must answer: whether tailoring is strictly monotone or whether a documented relaxation is admissible with parent-side ratification (and if so, who on the parent side ratifies, given the parent is a template); how far parameter ranges may be narrowed by the parent without making the constitution unusable for small instances (a two-agent instance cannot seat a three-agent quorum); whether extension `deliberate` triggers may reference instance ontology only or also parent classes; how a conformance failure after a parent upgrade is handled when the instance's own guardrails caused it; and whether instances may federate assemblies for cross-instance incidents or remain strictly sovereign.

## 7. Deliverables of the new project

1. **The L0 constitution** as a text with numbered clauses, each clause carrying its Datalog-expressible meta-rule or an explicit note that it is not expressible and how it is enforced instead.
2. **A threat model**: a good-will / bad-will matrix per party kind (agent, sub-agent, orchestrator, human member, Custodian, delegating party, collector) and per clause, showing which clause closes which attack and which attacks remain open by design.
3. **The fairness test specification**: identity-permutation symmetry, identity-blindness of L1, determinism — as fixtures a kernel must pass.
4. **The dilemma protocol**: how conflicting obligations are detected, represented and routed.
5. **A genesis procedure**: how the ecosystem starts — first Custodian, first mandates, first assembly — without circularity.
6. **The tailoring contract**: the invariant / parameterised / extension partition of every clause, parameter ranges, the genesis manifest schema, and the conformance suite an instance must pass. Placement is decided (meta-os parent, instances as siblings); the ADR identity follows meta-os conventions, and each instance carries a thin adoption ADR that cites the parent version.

## 8. Constraints and principles

Every clause must be either expressible in stratified Datalog with negation, `neq`, `lt` and `count`, or explicitly marked as procedural with its human enforcement named. No clause may reference an individual agent. No clause may reward informing directly. Suspension is automatic and reversible; retirement is deliberate. Response never changes rules. Knowledge is derived from the delivery log only. L0 is human-only and signed. Proportionality applies to the constitution itself: a clause that cannot be tested is not adopted, and a clause whose enforcement cost exceeds its bypass cost is redesigned.

## 9. Working conventions

Formal English; production-grade artefacts with explicit traceability, open decisions labelled in the form `<ADR>-OD{n}`, structured for direct use as repository documents. ADR-first: the constitution is preceded by an ADR recording why this shape and not another. Markdown with unbroken paragraphs — no hard line wrapping. LaTeX only where notation needs it. When a question is broad, give a comprehensive answer and exactly one follow-up question; when it is definite, answer without asking. Do not implement; this project produces text, rules and tests specifications, not code.

## 10. Reference artefacts

The originating platform's engineering records — its regulatory posture, the engine epic and its addendum, and a frozen partial kernel — stay with that platform. Nothing in this project depends on them; what was needed from them is restated above.

## 11. Glossary

**Arbiter** — the inference engine and judge. **GEC** — governed evolution channel: proposals, admission, delta. **L0/L1/L2** — constitution, policy, evidence. **Deliberate** — admission class requiring assembly and committee. **Eligible** — an agent that neither benefits from a proposal nor is implicated in the incident it cites. **Implicated** — in the causal chain of an incident, or negligent or aggravated with respect to it. **Standing** — an agent's record, never a score. **Custodian** — the seeded name for the seat holding the last word. **Mandate** — the delegation from a party to an agent; the source of its perimeter and its seat. **Parent / instance** — meta-os ships the constitution, upper ontology, conformance suite and reference kernel; an instance adopts it through a genesis manifest. **Genesis manifest** — the signed document by which an instance spawns: parent version, parameters, extensions, first Custodian, initial mandates. **Monotone tailoring** — an instance may only tighten; its findings on the parent's fixtures are a superset of the parent's.

## 12. First tasks for the new session

1. Restate the mission in one paragraph and confirm the seven decisions in §4 are read as settled.
2. Draft the Custodian clause first, since it is the one decision the owner has made and left open in shape; argue the seed in §6, then propose the clause.
2b. Draft the tailoring contract second (§6b): partition the clauses drafted so far into invariant, parameterised and extensible, and settle the monotonicity question before any instance-specific content is written.
3. Produce the threat-model matrix skeleton so that every later clause is written against a named attack.
4. Only then draft the constitution clause by clause, each with its meta-rule or its procedural note.
