# Brainstorm record — 2026-09-21 — A mathematics of ethics and revolution

> **How to use this file.** It extends `KICKOFF-meta-ethics-constitution.md` (the 2026-09-18 brainstorm) with a second session held on 2026-09-21 between the owner and one agent session, after the project was bootstrapped as `meta-agentic/meta-ethics`. Everything under **Decided** was stated by the owner or derived in session and accepted by the owner; it is settled unless the owner reopens it, and it is to be ratified formally in ADR-ETH-01. Everything under **Open** is labelled `ADR-ETH-01-OD{n}` and is the work. The kickoff's own open questions (§6 and §6b there) take `OD1`–`OD11` here so that one ledger numbers them all.

---

## 1. Where the session started, and where it ended

It began from a question the kickoff had not asked: whether arbiter — the engine that judges — is itself a party under the constitution it enforces. The owner's answer was categorical, and it reorganised the rest: no actor is outside the system, and the engine may hold no advantage over any other party. From that closure principle the session derived, in order, that arbiter is a seat rather than a sovereign; that the system has a declared perimeter with the structure of a thermodynamic system; that the record is the conserved quantity across that boundary; that ethical systems must be measured rather than scored; that the constitution's core interest is to detect its own pathologies early enough to correct them by admissible steps rather than by rupture; and finally that the whole of this has the structure of a labelled transition system, on which correctability is reachability, revolution is an inadmissible transition, and the invariants are an inductive invariant in the formal-verification sense. The session ended with the name the owner gave it — a mathematics of ethics and revolution — and with one question deliberately left open, because its two answers yield two families of constitution.

## 2. Decided

### D8 — Closure. No actor is outside the system.

Any entity whose act has a side-effect on any part of the system, or on its context, is a party — whether or not the act was observed, and even if the entity acted only once, first or last. Arbiter is a party. The Custodian is a party. Collectors are parties. Delegating parties are parties. The founding human is a party from the first act of genesis. *Owner-stated.*

### D9 — Arbiter is a seat, not a sovereign.

Because verdicts are pure functions of the provenance triple and replayable by any party, arbiter's power was never exclusive; it only appeared so because one process happened to be running the function. Under closure this is exactly right: arbiter holds no advantage because any party can compute the same verdict. The constitution therefore has two constitutional seats, not one — the **Custodian**, which breaks ties and vetoes, and the **Arbiter**, which computes and delivers — both held under mandate, both judged, both replaceable, and both ineligible on any proposal concerning themselves. On a matter in which arbiter is implicated, the verdict is computed by replay by eligible parties, ad hoc. There is no standing second judge, and no regress, because the judge was never an entity but a function with a current holder. *Derived; owner accepted.*

### D10 — The perimeter is a declared, first-class object.

The system is the analogue of a thermodynamic system: it has a declared boundary that states what is inside and what is outside, and entities outside may still interact with it — first, last, or as a flux across the boundary. The decision system's jurisdiction is restricted to the declared perimeter. Any expansion of the perimeter to include what was environment changes the system; it is not forbidden if the rules allow it, but it is a governed act, and every party must be able to know that the perimeter changed in order to regulate its own decisions. *Owner-stated.*

### D11 — Three nested perimeters, and the boundary between act and cause.

Acts are ontological: they happen regardless of observation. Jurisdiction covers only the declared system. Evidence covers only what collectors observe. Hence three nested perimeters — **ontological ⊇ jurisdictional ⊇ epistemic** — of which the constitution judges within the second and can enforce only within the third. The gap between the second and the third is a named, measurable region rather than a hidden weakness: it is exactly where evidence-capture attacks live, and declaring the epistemic perimeter is how decision 4's "unprovable but auditable" is made precise. A cause that sits in an incident's causal chain but holds no mandate, seat or inform channel — a cloud region failing, a dependency going down — is a **boundary flux**: registered, attributed to its external source in the postmortem, and not adjudicated, because a clause that imposes duties on an entity that cannot receive them has infinite enforcement cost and trains bypass (kickoff decision 5). *Derived; owner accepted.*

### D12 — The mandate is the instrument of boundary crossing.

A party enters the perimeter when a party already inside delegates a mandate to it, and leaves when that mandate is withdrawn or retired. No entity can propose its own entry, because it is outside. Entry and exit are recorded events, so the perimeter carries a time dimension and the system always knows when an entity was a party. The genesis manifest is the first perimeter declaration: it names the parties, seats, collectors and evidence sources, and every subsequent change to that set is a proposal under the governed evolution channel. *Derived; owner accepted.*

### D13 — Duty to inform about the boundary itself.

Knowledge of the current perimeter sits in every party's `inform` channel, constitutionally, and no proposal can narrow it. It has the same status as the channel. *Derived from D10; owner accepted.*

### D14 — Conservation of the record.

The system is **open to mandates and closed to the record**. Parties enter and leave freely; their acts and their standing never leave, because the record belongs to the system and not to the party. This makes "standing is a record, never a score" a conservation law rather than a convention, and it is what makes exit different from erasure. *Derived; owner accepted.*

### D15 — Path functions must be witnessed.

A verdict is a state function of the provenance triple: path-independent, recomputable by anyone. Delivery is a path function: it depends on the history of what was handed to whom and when, and the path is gone once taken. State functions can be replayed; path functions must be witnessed. Consequently `knew(A, R, T)` as specified in the kickoff — derived from arbiter's own delivery log alone — violates the constitution's own evidence rule once arbiter is a party, because the delivery log is agent-writable by arbiter. Delivery must be observed by a collector that is not arbiter. This is also the structural fix for the "over-strong knowledge" gap: flooding becomes a witnessed act by a party, visible in the record and judgeable, rather than a threshold to be tuned. Collectors, being parties, acquire liability — a collector that observed and did not emit is negligent — which is what the evidence-capture gap needed and could not find. *Derived; owner accepted.*

### D16 — Measure, do not score.

A scorecard carries a judgement of good and bad that nature does not imply. The system may not be scored against human forms of government, nor against any fitness function. Instead, the **atoms** of the system — mandate, seat, perimeter, act, delivery, verdict, proposal, delta, eligibility, implication, record — which carry no valence, compose into **intrinsic properties** that are measured the way state variables are measured from microstates. Labelling regions of the resulting state space ("this is what we would call oligarchy") is an ex-post human exercise; it establishes a common language between humans and agents without requiring agreement on values. *Owner-stated.*

### D17 — The core interest of an ethical system is to discover its own pathologies early.

Early enough to exit into a better version of itself by admissible steps — an **infinitesimal revolution** — rather than by rupture. *Owner-stated.*

### D18 — L0 is the revolutionary surface. Minimise it.

A change is infinitesimal when it is an admissible step under the governed evolution channel; it is a revolution when the needed correction is `forbidden` under the current rules, so that rules must be broken. The design already draws this line: L1 changes are infinitesimal and L0 changes require a human signature. Every invariant clause is therefore one that can only change by rupture, and the invariant set must be the smallest set that still lets the system correct itself. Everything that can be a parameter or an extension must be. This reframes the tailoring partition from housekeeping into the central design question. *Derived; owner accepted.*

### D19 — A seventh deliverable: the system's vital signs.

Intrinsic metrics that arbiter computes continuously; thresholds set per instance as parameterised clauses; and an extension of the reporting contract with structural-health predicates — of the shape `correctability_falling`, `capture_cost_falling`, `coverage_falling` — that route to `deliberate` review. This is not in kickoff §7 and is added here. *Derived; owner accepted.*

### D20 — The lab is a second track and a party.

Exploring the space of ethical systems by simulation is a sibling track, not a replacement for the constitution. ETH ships version 1 as a declared point in the space, chosen by these axioms and these measures — a stronger epistemic position than "our best idea". The lab's job is not selection under a fitness function but the discovery of which regions of the state space are stable and what the early signals of leaving them look like. Its findings enter the constitution as governed-evolution proposals, `ratify` class at minimum. The lab is itself a party under the constitution it explores, and it is governed by the rule the estate already states for its evolutionary systems: it may propose and evaluate candidates but may never self-promote. *Derived; owner accepted.*

### D21 — Identity is relative to timescale.

Over astronomical time any constitution dissolves and something new begins; this is asymptotic and does not matter in a world where agents modify constitutions in milliseconds. What matters is the ratio between the characteristic time of constitutional modification and the characteristic time of the decisions the constitution governs. A constitution has identity *for a decision* if the clauses that decision depends on do not change during it — the adiabatic condition. A change that is infinitesimal on one timescale is a rupture on another; revolution is itself timescale-relative. *Owner-stated; formalisation derived.*

## 3. The formal frame

A decision system at time $t$ is a **configuration**: the set of parties, mandates, seats, rules (L0 and L1) and the record (L2). An act is a transition between configurations. The admissible transitions — proposals that pass the governed evolution channel — are a distinguished subset. The object is therefore a **labelled transition system**, and the following are not analogies but instances of known mathematics.

**Correctability is reachability.** "From every reachable configuration the system can reach a correct one" is the temporal-logic property $\mathbf{AG}\,\mathbf{EF}\,\mathit{correct}$ — for all reachable states, there exists a path. This is a model-checking problem, decidable and mechanically checkable for a finite configuration space.

**Revolution is an inadmissible transition.** The configuration graph carries two kinds of edge. The **revolutionary surface** is the set of configurations from which every edge to a better configuration is inadmissible. It is a frontier in the graph and is computable.

**Invariants are what admissible transitions preserve.** The minimal invariant set is the smallest set of properties whose preservation guarantees correctability — an **inductive invariant** in the verification sense, the object one constructs to prove a system safe. Finding the minimal one is a known hard problem and is precisely the clause-partition task.

**Fairness is group action.** Identity-blindness means the verdict function is invariant under the action of the symmetric group $S_n$ permuting agent identities. This is why the fairness fixtures can be genuine tests rather than assertions.

**Conservation of the record is a monotone measure.** The record is non-decreasing along every edge, admissible or not, so history is a well-founded order and no trajectory returns to an erased state. It is the Lyapunov-shaped quantity of the system, running upward.

**Capture cost is a min-cut.** The smallest coalition, counted in seats, that can pass any `deliberate` proposal.

**The Datalog constraint is what keeps all of this decidable.** Kickoff §8 requires every clause to be stratified Datalog with negation, `neq`, `lt` and `count`. This looked like pragmatism. It is the condition under which the configuration space is finite and $\mathbf{AG}\,\mathbf{EF}\,\mathit{correct}$ is answerable. Drop it and the mathematics above stops being mathematics.

**Where it is still metaphor.** Early-warning signals for critical transitions — critical slowing down, rising autocorrelation and variance, slower recovery from perturbation — are established results (Scheffer et al., *Nature* 461, 2009) and have direct analogues here: proposals taking longer to pass, verdict variance rising, parties' positions correlating as independence collapses into coalition. But they require a *metric* on configuration space to define distance and velocity, and choosing which intrinsic properties serve as coordinates, and with what weight, is a choice. It is a much weaker choice than a fitness function — measuring temperature is not valuing heat — but it is where the last trace of the authors' values lives, and by decision 4 it must be declared rather than hidden. The discrete mathematics of ethics and revolution is real today; the predictive mathematics of revolution is a projection onto a chosen coordinate system, and is honest only when the projection is declared. Those signals also need time series of some length and carry false positives; whether a young, fast ecosystem yields usable statistics is a research question for the lab, not a shelf tool.

## 4. The atoms, and the intrinsic properties they compose into

The atoms carry no valence: mandate, seat, perimeter, act, delivery, verdict, proposal, delta, eligibility, implication, record; and the built-ins `count`, `neq`, `lt`. From them, without judgement:

| Property | Definition | Mathematical shape |
|---|---|---|
| Concentration | Distribution of seats and veto power across parties | A dispersion statistic over a partition |
| Reversibility | Fraction of past decisions with an admissible reversal path | Reachability over the transition graph |
| Admissibility horizon | Of the next possible proposals, the proportion in each admission class | A histogram over `auto` / `ratify` / `deliberate` / `forbidden` |
| Self-modification reach | Whether the system's own change rules are reachable by admissible steps | Graph reachability |
| Cost to capture | Minimum coalition, in seats, passing any `deliberate` proposal | Min-cut |
| Cost to exit | What a party forfeits by leaving; its record does not leave | Difference of two configurations |
| Epistemic coverage | Jurisdictional perimeter actually observed, as a fraction | Ratio of two set sizes |
| Information asymmetry | Variance of `knew/3` across parties for the same risk | A dispersion statistic |
| Verdict sensitivity | Change in verdicts under small perturbation of the fact set | A stability exponent |
| Time-to-record | Lag between an act and its appearance in evidence | A delay distribution |

A system's history is a trajectory through the space these define. Pathology is approach to a region where correctability collapses — the admissibility horizon closing, self-modification reach falling toward zero, cost to capture falling below the size of an existing coalition, epistemic coverage falling toward zero. The vital signs of D19 are these properties, monitored.

## 5. Open — `ADR-ETH-01-OD{n}`

The kickoff's questions first, so that one ledger holds them all.

**OD1–OD6 — The Custodian (kickoff §6).** One seat or rotating; whether a veto expires; whether assembly and committee ties are broken by the same seat or by each other; what supermajority replaces the Custodian and who counts it; recusal where the Custodian benefits; how the seat is filled at genesis. Owned by the Custodian decision spike.

**OD7–OD11 — Tailoring (kickoff §6b).** Strictly monotone or documented relaxation, and who ratifies on a template parent; how far parameter ranges may narrow before small instances cannot conform; whether extension `deliberate` triggers may reference parent classes; conformance failure after a parent upgrade caused by the instance's own guardrails; federated assemblies or strict sovereignty. Owned by the tailoring decision spike.

**OD12 — Exit while implicated.** Leaving the perimeter is the ultimate bypass: if an implicated agent can withdraw its mandate the moment a suspension or retirement proposal is raised, every clause costs exactly one exit. In a physical system a subsystem cannot be removed mid-process without accounting for its state. Can a party leave while implicated in an open incident, and if not, what holds it and with what? Whatever the answer, it is the first coercive clause in a constitution that so far has none, and it must be written as such.

**OD13 — Identity: rules or record.** The infinitesimal-revolution ideal pushes the revolutionary surface toward zero, but a system with nothing it refuses to change infinitesimally has no identity across change — rules replaced one at a time until none of the original remain. Two answers, two families of constitution: (a) a constitution must have something it will change only by rupture, in order to be a constitution at all; (b) a constitution is not its rules but its memory, and its identity is the conserved record. **Proposed resolution, from D21:** the fork collapses under timescale separation. Identity is relative to the decisions governed: the record carries identity across the long run, and the adiabatic condition carries it across any single decision. Under this reading both families are the same constitution viewed at different timescales, and the minimal invariant set is exactly one clause — the record is conserved — plus the change mechanism itself. To be tested against the eight invariants of kickoff §6b in the clause-partition task.

**OD14 — The minimal invariant set.** Which of the eight §6b invariants are truly invariant, which are derivable from record-conservation and the change mechanism, and which are parameters wearing invariant clothing. Owned by the clause-partition task, reframed by D18.

**OD15 — Which intrinsic properties are monitored, and with what thresholds.** The residual value choice. To be declared in the ADR, per decision 4.

**OD16 — A metric on configuration space.** Whether one exists that justifies the early-warning layer of §3, or whether the lab must first discover which coordinates carry signal. Owned by the lab track.

**OD17 — The lab's authority.** Whether a vital-sign threshold crossing raises a `deliberate` review automatically, and whether the lab may raise governed-evolution proposals directly or only through a human sponsor. Bounded by D20: it may never self-promote.

**OD18 — Escape hatch for non-infinitesimal pathologies.** Some pathologies cannot be undone by small steps: once a coalition controls the `deliberate` gate, no admissible proposal removes it, because the correction runs through the captured mechanism. The revolutionary surface therefore cannot be zero; there must be an escape that does not pass through the thing that is captured. The Custodian's non-vetoable replacement is the seed. Whether it suffices is open, and it couples to OD4.

## 6. Consequences for the deliverables and the backlog

Kickoff §7 gains a seventh deliverable, the vital signs (D19), which needs an epic. The clause-partition task is reframed by D18 and OD13: the partition is the search for the minimal inductive invariant, not a filing exercise. The threat model stops being a document and becomes the adversarial test set run against every candidate system, which also makes it the fixtures of the fairness test specification — one artefact, two epics. The threat matrix needs a third posture beside good will and bad will: *indifferent*, the agent that is neither malicious nor benevolent and merely optimises, which is where most realistic attacks come from. `knew/3` must be respecified with a witness (D15) before the Custodian clause depends on it. A sibling track — the lab — needs its own space, and it is governed by D20. And the `inform` clause gains a second constitutional content: the perimeter (D13).

## 7. Pointers

Formal verification and temporal logic: Clarke, Grumberg and Peled, *Model Checking* (1999). Early-warning signals for critical transitions: Scheffer et al., *Nature* 461 (2009). Institutional grammar, whose ADICO shape (attribute, deontic, aim, condition, or-else) is very nearly the rule form kickoff §8 requires: Crawford and Ostrom, "A Grammar of Institutions", *American Political Science Review* 89 (1995), and Ostrom, *Understanding Institutional Diversity* (2005). The estate's own prior rule that evolutionary systems may propose and evaluate but never self-promote — the instance CLAUDE.md, concurrency and authority — is the proto-clause D20 generalises.

## 8. Provenance

Session of 2026-09-21. Owner: the founding human, holding every seat at genesis. The backlog is tracked outside this repository; repository at the commit that carries this file. Nothing here has been ratified; ADR-ETH-01 is where that happens.
