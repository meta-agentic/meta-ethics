---
kind: adr
space: eth
adrId: ADR-ETH-01
provisionalNumber: false
title: The shape of the L0 constitution — a procedural, closed, measured, minimally invariant frame for mixed human/agent ecosystems
status: Proposed
date: '2026-09-21'
project: meta-ethics
supersedes: []
supersededBy: []
labels: [constitution, L0, closure, perimeter, neutrality, tailoring, governance]
---

# ADR-ETH-01 — The shape of the L0 constitution

**Status: Proposed 2026-09-21.** Awaiting ratification by the owner, who at genesis holds every seat and is therefore the Custodian for this act. Ratification is the merge of the pull request that carries this file; the merge commit is the signature. **Written at the time of decision**, not reconstructed: the decisions below were taken in two sessions, 2026-09-18 (kickoff, decisions D1–D7) and 2026-09-21 (brainstorm record, decisions D8–D21), and this record was drafted the same day as the second.

> Claim tags: **[evidence]** · **[hypothesis]** · **[open]** · **[proposed]** · **[pending]**.

## Context — the forces in tension

A constitution for an ecosystem of agents is hard to write because nine forces pull against one another, and every decision below is a resolution of some subset of them. A reader who finds a decision puzzling should look for which force it serves and which it sacrifices.

**F1 — Adversarial parties.** The constitution must hold against bad will, and equally against indifference: an agent that is neither malicious nor benevolent but merely optimises, which is where most realistic attacks originate. Any clause that assumes good will is not a clause.

**F2 — A mixed ecosystem.** Human and non-human agents act together. Asymmetric treatment is both tempting, because humans hold rights that agents do not, and corrosive, because an exempt party is the one every attack routes through.

**F3 — Enforceability.** Every clause must be mechanically checkable — expressible in stratified Datalog with negation, `neq`, `lt` and `count` — or explicitly procedural with its human enforcement named. A clause that cannot be tested is not adopted.

**F4 — Bypass economics.** Any clause whose enforcement costs more than working around it trains bypass. Such clauses are redesigned or dropped, however desirable their intent.

**F5 — Speed.** Agents modify rules in milliseconds; human deliberation takes days. Every human-gated path is a bottleneck, and every ungated path is a capture vector. The constitution must place its few human gates where they cost least and protect most.

**F6 — Authorial values.** No constitution escapes the values of its authors. The only honest options are to declare them or to hide them, and a design that claims to have none has chosen the second.

**F7 — Plurality of instances.** Instances adopt as siblings; none is privileged by adopting first. Each is sovereign. The parent must be reusable without becoming an authority over any of them.

**F8 — Decidability.** The judge must terminate, and its verdicts must be replayable by any party. This constrains the logic the constitution may be written in.

**F9 — Legal asymmetry.** Human parties carry rights under law — erasure of personal data, due process — that agents do not. Some asymmetry between party kinds is therefore imposed from outside the system, and the constitution must accommodate it without letting it become the general exemption F2 warns against.

## What this record does not claim

Per D4 below, the constitution claims three provable properties and no more: determinism of verdicts, identity-blindness of every L1 rule, and symmetry of verdicts under permutation of agent identities. It does **not** claim neutrality of the evidence it judges on, neutrality of the ontology its concepts are drawn from, or neutrality of its own authors. Those three are made auditable — the epistemic perimeter is declared, the ontology is versioned, the authors sign — and are otherwise left as what they are. Nor does it claim to be a conscience: it encodes who decides, with which conflicts excluded, on what evidence, and says nothing about what is good. It is complete only relative to the values of the people who wrote it, and this sentence is in the text so that nobody has to discover it.

## The decisions

Each decision states what was chosen, the alternatives that were genuinely viable and why each lost against a named force, and the observation that would reopen it. Decisions D1–D7 were taken on 2026-09-18 and are restated here with their arguments, which the kickoff recorded only as conclusions; D8–D21 were taken on 2026-09-21.

### I. Scope and neutrality

**D1 — Symmetry.** Human and non-human agents are treated symmetrically in duties, eligibility and record. A human who knew and stayed silent is negligent, and it is recorded. Consequence tables may differ by kind of party; the record and the derivations may not. *Rejected:* exempting humans from eligibility and suspension, which was the prior design — it loses to F1 and F2 together, because the exempt party is exactly the one every attack routes through, and a human who knew and stayed silent is the capture the record most needs to show. *Rejected:* two constitutions, one per party kind — it loses to F2, because implication across kinds (a human implicated in an agent's incident, or the reverse) cannot be derived from two records that do not share a vocabulary. *Reopens if:* a symmetric consequence is derived that no human party will accept and the record shows the rule was bent rather than the consequence applied.

**D2 — A last word exists.** Symmetry produces vetoes and ties, so there is a final decision-maker; its shape is OD1–OD6. *Rejected:* no last word, with ties left standing — it loses to F5, because a stalled deliberation among agents acting in milliseconds is a denial of service on the whole ecosystem. *Rejected:* simple majority breaks ties — it loses to F1, because a majority can be manufactured, and the seed (a single human seat with exactly two powers) exists precisely because no derived quantity is safe as a tie-breaker. *Reopens if:* the last word is exercised often enough to be routine governance rather than exception — a count, per sprint, to be parameterised by the instance.

**D3 — Procedural, not substantive.** The constitution encodes who decides, with which conflicts excluded, on what evidence — not what is good. *Rejected:* a substantive floor, a minimal list of forbidden purposes — it loses to F6, because the list is the authors' values, and it is unbounded, since every instance would extend it. *Rejected:* encoding nothing about purpose whatsoever — rejected because a mandate must declare its purpose for `benefits(A, P)` and eligibility to be derivable at all; purpose is data the procedure consumes, not a value the constitution holds. *Reopens if:* a procedurally valid mandate is issued for a purpose the parties find intolerable and no procedural clause catches it — which would show the procedure is not sufficient and a substantive floor is being enforced informally.

**D4 — Provable neutrality is partial and named as such.** Provable: determinism, identity-blindness, permutation symmetry. Not provable: neutrality of evidence, ontology, authors. The constitution claims the first set and makes the second auditable. *Rejected:* claiming full neutrality — it loses to F6, and it would be false. *Rejected:* claiming none — rejected because the three provable properties are real guarantees, mechanically testable, and under-claiming them discards the one thing the design can actually promise. *Reopens if:* any fixture for one of the three provable properties fails on a conforming kernel.

**D5 — Cost of compliance below cost of bypass.** Any clause whose enforcement is more expensive than working around it is redesigned or dropped. *Rejected:* enforce regardless of cost — it loses to F4 by definition; the clause trains the bypass it forbids. *Rejected:* rely on norms rather than enforcement — it loses to F1. *Reopens if:* the measured bypass rate for any clause exceeds its compliance rate; this is a vital sign under D19.

**D6 — Parent and instance.** meta-os is the parent: a template with a conformance suite, not a running authority. Each instance is sovereign with its own Custodian, assembly and committee; instances are siblings. *Rejected:* the parent as a running authority over instances — it loses to F7 and F5 together, because a central authority is both the bottleneck and the single point of capture across every instance at once. *Rejected:* no parent, each instance writing its own — it loses to F7, because there is then no conformance, no shared vocabulary, and nothing reusable. *Reopens if:* an instance's genesis manifest validates and its engine passes the fixtures, yet its observed behaviour diverges from the parent's on the same facts — which would mean the fixtures do not capture what the constitution means.

**D7 — Monotone tailoring.** An instance may add obligations and raise thresholds; it may not remove clauses or lower thresholds. On the parent's fixtures the instance's findings are a superset of the parent's. *Rejected:* free tailoring — it loses to F7, because an instance can hollow the constitution out clause by clause and still call itself conforming. *Rejected:* no tailoring — it loses to F4, because an instance too small to seat the parent's quorums cannot conform and will operate outside the constitution instead. *Reopens if:* a documented case arises in which strict monotonicity prevents a legitimate instance from conforming — OD7.

### II. Closure and the perimeter

**D8 — Closure. No actor is outside the system.** Any entity whose act has a side-effect inside the perimeter or on its context is a party — arbiter, the Custodian, collectors, delegating parties, the founding human — whether or not the act was observed, even if it acted once. *Rejected:* arbiter as a neutral engine outside the frame, which was the kickoff's implicit position — it loses to F1, because delivery is an act with consequences (it creates liability for the recipient) and an ungoverned act by an un-judged actor is a power nobody governs. *Rejected:* closure over causes rather than acts — it loses to F4, because a cloud region that fails cannot receive a duty, and a clause that imposes one has infinite enforcement cost. *Reopens if:* the record shows an act with side-effects inside the perimeter by an entity it does not name as a party.

**D9 — Arbiter is a seat, not a sovereign.** Verdicts are pure functions of the provenance triple and replayable by any party, so judging was never exclusive. The constitution has two seats — Custodian and Arbiter — both held under mandate, judged, replaceable, and ineligible on proposals about themselves; on a matter where arbiter is implicated, eligible parties compute the verdict by replay. *Rejected:* a second standing arbiter to judge the first — rejected because it is a regress, and under F5 it doubles latency on every verdict for no gain. *Rejected:* arbiter judged by the committee alone — it loses to F1, because the committee is already the single point of capture the threat model names. *Reopens if:* a replay by eligible parties disagrees with arbiter's verdict on the same provenance triple, which would mean either the engine or the replay is not the pure function it claims to be.

**D10 — The perimeter is a declared, first-class object.** The system is the analogue of a thermodynamic system: a declared boundary stating what is inside, with entities outside able to interact first, last, or as a flux. Jurisdiction is restricted to the declared perimeter; expanding it is a governed act. *Rejected:* an implicit perimeter, whatever the collectors happen to observe — it loses to F1, because then whoever shapes the evidence defines the system. *Rejected:* universal jurisdiction — it loses to F4. *Reopens if:* an entity acts on the system and the perimeter declaration does not name it, in either direction.

**D11 — Three nested perimeters, and the boundary between act and cause.** Ontological (all acts) contains jurisdictional (what is judged) contains epistemic (what is observed). The constitution judges within the second and enforces within the third; the gap between them is declared and measured. An external cause in an incident's chain is a boundary flux: registered and attributed, not adjudicated. *Rejected:* two perimeters, inside and outside — rejected because it conflates jurisdiction with observation, and the evidence-capture gap becomes invisible instead of measurable. *Rejected:* adjudicating external causes — it loses to F4. *Reopens if:* an incident's causal chain is entirely external and the postmortem cannot attribute the flux — the boundary was drawn in the wrong place.

**D12 — The mandate is the instrument of boundary crossing.** A party enters when a party inside delegates a mandate to it and leaves when the mandate is withdrawn or retired; entry and exit are recorded events. The genesis manifest is the first perimeter declaration. *Rejected:* self-registration — it loses to F1, because it is Sybil at the boundary. *Rejected:* admission by the Custodian — it loses to F5 and to the committee-capture row of the threat model, because it places a human bottleneck at every entry and concentrates the one power that should be distributed. *Reopens if:* the record shows a party with no delegating mandate.

**D13 — Duty to inform about the boundary itself.** Knowledge of the current perimeter sits in every party's `inform` channel, constitutionally, and no proposal can narrow it. *Rejected:* perimeter published on request — it loses to F1, because a party that did not ask did not know, and a perimeter change can then hide. *Rejected:* unanimous acknowledgement before a perimeter change takes effect — it loses to F5. *Reopens if:* a party acts on a stale perimeter and the record shows the change was not delivered to it.

**D14 — Conservation of the record.** The system is open to mandates and closed to the record. Parties enter and leave; their acts and standing never do. *Rejected:* parties own their record and take it on exit — it loses to F1, because exit becomes erasure and every clause then costs one exit. *Rejected:* erasure after a retention period — it loses to F1 for agents, but it is **forced by F9 for human parties**, whose personal data carries a legal right to erasure; see OD19 and the accepted costs. *Reopens if:* a legal obligation to erase a human party's record is asserted against the system — which is not hypothetical, and is the reason OD19 exists.

**D15 — Path functions must be witnessed.** A verdict is a state function of the provenance triple and can be replayed; delivery is a path function and must be observed by a collector that is not arbiter. `knew(A, R, T)` as the kickoff specified it — derived from arbiter's own delivery log — violates the constitution's own evidence rule once arbiter is a party, and is respecified with a witness. Collectors, being parties, acquire liability. *Rejected:* trusting arbiter's log, the kickoff's position — it loses to D8 and to the evidence-capture row: no consequence may derive from agent-writable facts alone, and the log is arbiter-writable. *Rejected:* no `knew/3` at all, negligence by outcome only — it loses to F1, because strict liability without knowledge is arbitrary and trains silence rather than informing. *Reopens if:* a `knew/3` fact is derived with a single witness.

### III. Method

**D16 — Measure, do not score.** No fitness function, and no scoring against human forms of government. The atoms — mandate, seat, perimeter, act, delivery, verdict, proposal, delta, eligibility, implication, record — carry no valence and compose into intrinsic properties measured as state variables. Labelling regions of the state space is an ex-post human act that gives humans and agents a common language without requiring shared values. *Rejected:* a fitness function — it loses to F6, because the function is the authors' values relocated to where they are least visible. *Rejected:* scoring resemblance to democracy, monarchy, oligarchy and the rest — it loses to F6 and, independently, because those are categories of territorial polities with heredity and a monopoly on violence, and there is no reason to expect them to be the attractors of an agent ecosystem; scoring against them finds what one looks for. *Reopens if:* any intrinsic property acquires a target value in a clause — at that moment it has become a score.

**D17 — The core interest of an ethical system is to detect its own pathologies early.** Early enough to correct by admissible steps — an infinitesimal revolution — rather than by rupture. *Rejected:* reacting to incidents only — it loses to F5, because by the time an incident is visible the needed correction may already be `forbidden`. *Rejected:* continuous human review — it loses to F5. *Reopens if:* an incident occurs that a monitored property would have predicted and the monitor did not fire.

**D18 — L0 is the revolutionary surface; minimise it.** An admissible change is infinitesimal; a change the current rules forbid is a revolution. L1 changes are infinitesimal and L0 changes need a human signature, so every invariant clause is one that changes only by rupture. The invariant set is the smallest that still lets the system correct itself; everything that can be a parameter or an extension must be. *Rejected:* a comprehensive L0 — it loses to F5, because every clause in it becomes one that only a revolution can change. *Rejected:* no L0, everything in L1 — it loses to F1, because nothing then protects the change mechanism from being captured through itself. *Reopens if:* a needed correction is found `forbidden` and OD14 shows the blocking clause should have been a parameter.

**D19 — A seventh deliverable: the vital signs.** Intrinsic metrics arbiter computes continuously, thresholds parameterised per instance, and structural-health predicates — `correctability_falling`, `capture_cost_falling`, `coverage_falling` and their kin — added to the reporting contract and routed to `deliberate` review. *Rejected:* leaving monitoring to instances — it loses to F7, because there is then no shared vocabulary for pathology. *Rejected:* monitoring only in the lab — rejected because a running instance needs it live, not in retrospect. *Reopens if:* an instance ships with no vital signs and conforms.

**D20 — The lab is a second track and a party.** Exploring the space of ethical systems by simulation is a sibling track; the constitution ships version 1 as a declared point in that space. The lab discovers which regions are stable and what leaving them looks like; its findings enter as governed-evolution proposals, `ratify` class at minimum; it may never self-promote. *Rejected:* the lab selecting and promoting the best system — it loses to F1, because an evolutionary process promoting its own output is the capture the estate's own rule for its evolutionary systems already forbids. *Rejected:* no lab — it loses to F6, because version 1 then remains "our best idea" with no map of the space it was chosen from. *Reopens if:* a lab finding enters the constitution by any route other than a governed-evolution proposal.

**D21 — Identity is relative to timescale.** Over astronomical time any constitution dissolves; this is asymptotic and irrelevant where rules change in milliseconds. A constitution has identity for a decision if the clauses that decision depends on do not change during it — the adiabatic condition. Revolution is itself timescale-relative. *Rejected:* an immutable constitution — it loses to F5. *Rejected:* identity located in the rules alone — rejected because it is the Ship of Theseus, OD13: rules replaced one at a time until none of the original remain and nothing was ever the same system. *Reopens if:* a decision is governed by a clause that changed during that decision and the record cannot say which version applied.

## Consequences

The constitution is procedural and small: it names who decides, excludes whom, on what evidence, and says nothing about what is good, which means it can be adopted by instances whose values differ. It is closed: every actor is inside, including its own judge, so there is no ungoverned power and no regress, because judging is a replayable function and not an office. It has a declared perimeter with three layers, so the region where evidence can be captured is measured rather than hidden. Its conserved quantity is the record, so exit is not erasure. Its judge's path-dependent acts are witnessed, so knowledge is provable and flooding is visible. It measures itself and does not score itself, so its health is a trajectory and not a grade. Its invariant set is deliberately minimal, so the surface that only a revolution can change is as small as the design allows. And it is explicit about the three things it can prove and the three it cannot.

What becomes easy: adoption by an instance through a signed manifest; replay of any verdict by any party; mechanical testing of fairness; detection of drift before it becomes rupture. What becomes hard: exempting anyone, including the founder; changing an invariant, by design; acting on the system without becoming a party to it.

## Accepted costs

**Every human gate is a bottleneck, by choice.** L0 changes, `ratify`-class admissions, committee quorums and the last word all wait for humans. Under F5 this is the cost of every capture vector these gates close, and it is accepted knowingly; the vital signs will show when the gates are too slow.

**Closure makes the founder a judged party from the first act.** There is no privileged author. The person who writes this constitution is subject to it, including its record, from genesis onward.

**The record cannot be erased — and for human parties that collides with law.** F9 is real: a human party's standing is personal data, and the right to erasure may be asserted. D14 holds for agents without qualification. For humans, the constitution will need either a pseudonymisation layer that preserves the derivations while detaching the identity, or an explicit legal carve-out, and neither is designed yet. This is OD19, and it is the one place a legally forced asymmetry between party kinds is accepted.

**Witnessed delivery costs a second collector.** D15 means no instance can run with arbiter as its only observer; a minimal instance needs at least two independent parties on the evidence side.

**Some pathologies are not infinitesimally correctable.** Once a coalition holds the `deliberate` gate, no admissible proposal removes it. The revolutionary surface cannot be zero; there must be an escape that does not pass through the captured mechanism, and the Custodian's non-vetoable replacement is the only such escape currently designed. OD18.

**The formal frame is exact for finite systems and a claim about families otherwise.** Stratified Datalog gives decidable, terminating evaluation over a finite fact set. Finiteness of the *configuration space* for model checking additionally requires the number of parties, mandates and rules to be bounded. With that bound stated, $\mathbf{AG}\,\mathbf{EF}\,\mathit{correct}$ is checkable; without it, the claim is about each finite instance rather than one unbounded system. The brainstorm record overstated this in one sentence, and it is corrected here rather than there, so that the correction is in the record that governs.

**The choice of which properties to monitor is where the last of the authors' values lives.** A far weaker choice than a fitness function — measuring temperature is not valuing heat — but a choice, and it is declared as OD15 rather than hidden inside D19.

## Safety envelope

This record constrains what may be written in the constitution; it does not itself change any running system. Nothing here alters an instance, an engine or a policy. The lab (D20) may propose and evaluate and may not promote. The parent (D6) may ship a new version and may not reach into a running instance. The founder (D8) may sign L0 and may not exempt themself from it. Every clause the constitution will contain must satisfy F3 or be marked procedural; a clause that satisfies neither is not admissible under this record.

## Reopening triggers — consolidated

Each decision carries its own trigger above. Three cut across all of them. **The fairness fixtures fail on a conforming kernel** — D4's provable set was not provable, and the whole neutrality claim is reopened. **A bypass rate exceeds a compliance rate for any clause** — D5 applies to the clause, and if it recurs, to the design. **A vital sign crosses a threshold and no `deliberate` review results** — D17 and D19 have failed as mechanism, and the constitution is not detecting its own pathology.

## Open decisions — `ADR-ETH-01-OD{n}`

The ledger is held in the brainstorm record of 2026-09-21 and is restated here by title only; the record there carries the arguments. **OD1–OD6**, the Custodian's shape, owned by the Custodian decision spike. **OD7–OD11**, tailoring, owned by the tailoring decision spike. **OD12**, exit while implicated — the first coercive clause. **OD13**, identity in rules or in record, with D21's timescale resolution proposed. **OD14**, the minimal invariant set, owned by the clause-partition task. **OD15**, which properties are monitored. **OD16**, whether a metric on configuration space exists. **OD17**, the lab's authority. **OD18**, the escape hatch for non-infinitesimal pathologies. And one added by this record: **OD19**, the legal right to erasure for human parties against conservation of the record — the pseudonymisation-or-carve-out question, which no clause may be drafted around until it is answered.

## Adoption by instances

This is the parent's record. Each instance carries a **thin adoption ADR** in its own records that cites this record by its hash, names the parent constitution version its genesis manifest conforms to, and records that instance's parameter values and extension modules. That ADR argues nothing here; it records only the instance's choices within the ranges this record and the tailoring contract allow. Its identity follows the instance's own conventions, and it is minted there, not here.

## Decision ledger

```
ID   STATUS    DECISION                                   ALTERNATIVES REJECTED (why)                                  ACCEPTED COST                          REOPENING TRIGGER
D1   proposed  symmetry of duties, eligibility, record    exempt humans (F1,F2 — exempt party is the attack route)     founder is judged from genesis         symmetric consequence bent, not applied
                                                          two constitutions (F2 — no cross-kind implication)
D2   proposed  a last word exists                         no last word (F5 — stall is DoS)                             one human bottleneck                   last word becomes routine
                                                          majority breaks ties (F1 — manufacturable)
D3   proposed  procedural, not substantive                substantive floor (F6 — authors' values, unbounded)          intolerable-but-valid mandates pass    valid mandate parties find intolerable
                                                          no purpose at all (eligibility underivable)
D4   proposed  partial neutrality, three properties       claim full (F6 — false)                                      three things left unprovable           a fairness fixture fails
                                                          claim none (discards real guarantees)
D5   proposed  compliance cost below bypass cost          enforce regardless (F4 — trains bypass)                      desirable clauses dropped              bypass rate exceeds compliance rate
                                                          norms only (F1)
D6   proposed  parent template, sovereign instances       parent as authority (F7,F5 — bottleneck and capture)         no cross-instance enforcement          manifest validates, behaviour diverges
                                                          no parent (F7 — nothing reusable)
D7   proposed  monotone tailoring                         free tailoring (F7 — hollowing)                              small instances may not conform        legitimate instance cannot conform (OD7)
                                                          no tailoring (F4)
D8   proposed  closure — no actor outside                 arbiter outside frame (F1 — ungoverned power)                founder is a party                     unnamed actor with side-effects
                                                          closure over causes (F4 — infinite enforcement)
D9   proposed  arbiter is a seat                          second standing arbiter (regress, F5)                        replay must be cheap                   replay disagrees with verdict
                                                          committee judges arbiter (F1 — capture point)
D10  proposed  declared perimeter                         implicit perimeter (F1 — evidence defines system)            perimeter must be maintained           actor not in declaration
                                                          universal jurisdiction (F4)
D11  proposed  three nested perimeters; fluxes            two perimeters (gap invisible)                               external causes unjudged               flux cannot be attributed
                                                          adjudicate external causes (F4)
D12  proposed  mandate is the crossing instrument         self-registration (F1 — Sybil at boundary)                   no entry without a sponsor             party with no mandate in record
                                                          Custodian admits (F5, capture)
D13  proposed  duty to inform about the perimeter         on request (F1 — changes hide)                               inform channel grows                   act on stale perimeter, undelivered
                                                          unanimous ack (F5)
D14  proposed  conservation of the record                 parties take record on exit (F1 — exit is erasure)           collides with erasure right (F9)       legal erasure asserted (OD19)
                                                          retention-period erasure (F1; forced by F9 → OD19)
D15  proposed  path functions witnessed                   trust arbiter's log (D8 + evidence rule)                     second collector required              knew/3 with one witness
                                                          no knew/3 (F1 — strict liability trains silence)
D16  proposed  measure, do not score                      fitness function (F6 — values relocated)                     no ranking of systems                  a property acquires a target value
                                                          score vs human governments (F6; wrong taxonomy)
D17  proposed  early pathology detection                  incidents only (F5 — too late)                               monitoring is continuous cost          predictable incident, monitor silent
                                                          continuous human review (F5)
D18  proposed  L0 minimal, revolutionary surface          comprehensive L0 (F5 — all revolutionary)                    fewer guarantees are invariant         forbidden correction was a parameter
                                                          no L0 (F1 — mechanism capturable)
D19  proposed  vital signs as deliverable                 instances monitor (F7 — no shared language)                  seventh deliverable                    instance conforms with no vital signs
                                                          lab only (not live)
D20  proposed  lab is a party, never self-promotes        lab promotes (F1 — estate rule)                              slower adoption of findings            finding enters outside GEC
                                                          no lab (F6 — no map)
D21  proposed  identity relative to timescale             immutable (F5)                                               version must be recorded per decision  clause changed mid-decision, version unknown
                                                          rules-only identity (Ship of Theseus, OD13)

INTEGRITY   records without a rejected alternative: 0   ·   without a reopening trigger: 0
            accepted records edited after acceptance: 0 ·   superseded records still referenced: 0
```

## Provenance

Kickoff `docs/KICKOFF-meta-ethics-constitution.md` (2026-09-18, decisions D1–D7 as conclusions). Brainstorm record `docs/BRAINSTORM-2026-09-21-mathematics-of-ethics-and-revolution.md` at `c69e055` (decisions D8–D21 with arguments, open decisions OD1–OD18). The backlog is tracked outside this repository. This record adds OD19 and corrects one overstatement in the brainstorm's §3, noted under accepted costs.
