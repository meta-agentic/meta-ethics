---
kind: adr
space: eth
adrId: ADR-ETH-03
provisionalNumber: false
title: The core and the levels — six invariant principles and one declared transient as the originator; the meta-agentic constitution as one constitution conforming to them
status: Proposed
date: '2026-10-05'
project: meta-ethics
supersedes: []
supersededBy: []
labels: [core, L0, levels, conformance, pathology, minimality, sufficiency, genesis]
---

# ADR-ETH-03 — The core and the levels

**Status: Proposed 2026-10-05.** This record decides what the originator of the constitution is. Until now, the text called "the L0 constitution" — ADR-ETH-01 with ADR-ETH-02, and their consolidated rendering — was both the originator and the constitution of one system. The founder asked which of its parts are the real generative rules that transcend every specific system. The founder then decided that the invariants are the originator: the meta-level, the core, the kernel, level zero, L0, all one thing. This record names that core, states the levels and the relations between them, and places ADR-ETH-01 and ADR-ETH-02 as one constitution conforming to it.

The files under `core/`:
- `core/L0.md` — the core's normative text;
- `core/tests.md` — the tests the core was put through, and the machine checks;
- `core/pathologies.md` — the taxonomy of pathologies;
- `core/instances.md` — three derivations;
- `core/relevel.md` — the re-levelling plan.

> Claim tags as in ADR-ETH-01: **[evidence]** · **[hypothesis]** · **[open]** · **[proposed]** · **[pending]**.

## Context — the forces in tension

The forces F1–F9 of ADR-ETH-01, as ADR-ETH-02 sharpens F3, apply. At the level of the core they are not obstacles to one design. They are the environment every constitution is derived in, and their strength differs between constitutions. One force acts on this decision that the earlier records did not need, and one criterion judges its result.

**F10 — Instance-independence.** Considering all possible constitutions, some yield more ethical decisional systems than others. The core is a candidate for what every constitution worth calling just shares **[hypothesis]**. That covers one whose parties are all human, one whose parties are all agents in a fully autonomous self-organisation, and one that mixes them, at any speed and under any law. Anything that depends on which kinds are present, how many, or how fast they act cannot be in it.

**E — Exclusion, a criterion, not a force.** A core is judged by what it rules out. Every structural pathology of a decisional system must be excluded by some clause, including the structural components of the unjust, unfair, tyrannical, arbitrary, fascist, oligarchic, plutocratic, corrupt and evil (`core/pathologies.md` §8) and those the founder did not list. Every principle must rule out something no other does. Alternatives below lose to a force; E is how the result is graded.

F10 pushes the core toward less. F1 pushes it toward more, because every structural pathology a core admits is an attack route. F6 says that whatever is added beyond structure is the authors' values relocated.

## The decisions

**K1 — L0 is the core: six principles and one declared transient.** The core is `core/L0.md`. It states a model, then floors over that model.

The model is a system as an abstraction with an observation map. It has:
- an append-only record of entries, each with a skeleton and a content;
- a rule set whose fold and admissibility relation are among its components;
- a mandate graph rooted in a founding document that is not a party;
- typed attestations;
- a change operator gated over positions, which admits only a rule set that passes every rule-set floor.

The core's floors:
- **MEM — Memory.** What happened is written once, by its true author, and never silently changed. Nothing more is written than is needed, and no one learns about a subject unseen.
- **DEL — Delegation.** Every power is granted, and every grant and revocation is answerable. Every duty is accepted by whoever bears it, every mandate can be renounced at no cost the instance controls, and all trace to one root. One controller counts once. Liability runs only for one's own act. Someone outside, who accepted it, answers for what the instance does, and leaving the core takes the most demanding gate, notice and a free exit.
- **LEX — Legality.** Every consequence follows from acts by the rules in force for them, or milder ones, and every derived consequence follows. Compliance is always possible, like acts are judged alike, and the rules change only by change.
- **IMP — Impartiality.** What is found does not depend on who you are. Attributes may shape safeguards, never burdens or power, and admission reads no attribute but kind. No one is outside judgement, and no one decides their own case.
- **VOX — Voice.** Whoever is bound is told in time, can see, can answer at no cost, and is heard before it binds; interim measures are bounded. Whoever is affected, inside or not, can complain and is answered.
- **COR — Correctability.** No group short of capture can block a correction, and no position's replacement depends on itself. Every matter ends, and no one is tried twice on the same facts without new evidence.
- **GEN — the founding regime**, a declared transient and not a principle. No rooted system meets the core at its first act. The core is claimed from the end of a founding regime held to every other floor it can meet.

Section 1 of `core/L0.md` holds definitions of the model, which bind no one. Sections 2 and 3 hold the 38 floors, each marked a property of the rule set, decided when a rule set is admitted, or of a state, or of a run.

**How it was found.** The candidate given to this record was five principles: Memory, Delegation, Impartiality, Voice and Correctability. Three tests were run (`core/tests.md` §3), and the candidate failed in twenty-seven places, each closed in the core (`core/tests.md` §1).
- **Coverage.** 67 pathologies after merging synonyms, each classed by its definition before any clause is applied. All 48 structural ones are excluded by some clause, and the 14 mixed ones in their structural part. The 5 beyond a core over a record are named with the reason.
- **Minimality.** For each principle, a system expressible in the model satisfies the other five and violates it. There is a witness for each clause added to answer a distinct pathology, and the couplings between clauses were checked.
- **Sufficiency.** Every unit of ADR-ETH-01 and ADR-ETH-02, P3 and the revised C14 included, maps to what it serves. Of the 38 floors, the meta-agentic constitution covers 9, renders 19 in part and 3 not at all, and contradicts 7, by eight of its clauses (K3).

*Rejected alternatives:*
- *The meta-agentic constitution as the core* — loses to F10. Parity of kinds (P1), two kinds or no instance (P3) and the human reviewer for humans (P2) exclude a humans-only and an agents-only constitution.
- *The candidate five unchanged* — loses to F1. Bondage, sybil capture, caste by consequence, discretion by attestation, unanimity and mutual entrenchment, retroactive and impossible law, surveillance and retaliation all satisfy the five, and each is an attack route.
- *COR in a cooperative form, a path existing* — loses to F1, for the reason ADR-ETH-02 A3 gave: a correcting path that needs the blocking group's cooperation satisfies it.
- *A list of forbidden regimes* — loses to F6 and to ADR-ETH-01 D16, because it scores against human forms of government and relocates the authors' values.
- *A core of mechanisms*, such as stratified Datalog, an external witness, a draw by lot — loses to F10, because each is one constitution's way of meeting a floor.
- *A substantive floor in the core*, such as a duty not to harm outsiders — loses to F6 and D3.
- *One principle, Correctability alone* — loses to F1, because a correctable tyranny is a tyranny until corrected.
- *A voice in making the rules for every party* — loses to F10 and F6. An organisation in which a few decide, over parties who accepted, can leave at no cost and can replace them, is a declared value, not a pathology.
- *One core per kind* — loses to F7 and F2, because there is then no shared vocabulary in which to compare constitutions.

*Reopens if:*
- a pathology is shown to be structural and excluded by no clause;
- a counter-model is shown to violate a second principle, so that the principles are not independent;
- a conforming constitution exhibits a structural pathology;
- a constitution that conforms to the core, or a subject of one of its instances, shows that a constitution it holds legitimate violates a principle, in a reasoned finding reviewed by parties not implicated.

**K2 — Three levels and two relations.**

| Level | What it is |
|---|---|
| L0 | the core |
| L1 | a constitution: for the meta-agentic case, ADR-ETH-01 with ADR-ETH-02 and their consolidated text |
| L2 | a deployment's parameters and rules, within the bounds L1 fixes (ADR-ETH-02 T, C15) |

A constitution **conforms to** a version of the core. A deployment — a founding document with its parameter values — **is an instance of** a constitution, and conforms to the core through it. A constitution is derived, not chosen whole: core × forces × values ⟹ constitution ⟹ parameters.

The records before this one are read through the mapping of `core/relevel.md` §1, not rewritten:
- their "L0" is L1, and their "L0 change" is a constitutional change;
- their "L1" is L2;
- their "instance" is a deployment;
- their "parent" is the L1 constitution as the template of its deployments.

Under that mapping C15's conformance test keeps its fixtures, which are L1's.

The change operator reaches every rule of a constitution and admits only a conforming rule set. Leaving the core is a re-founding: a new founding document whose genesis entry cites the old record, preceded by notice and a free exit (DEL.7). It is not a step of the old system. Within a deployment, the core is therefore its revolutionary surface (ADR-ETH-02 C2).

A version of the core is identified by its digest:
- Anyone may publish a version, and authorship confers nothing.
- A version binds no one until a constitution conforms to it and a deployment adopts it.
- The family of a version is the set of constitutions that conform to it.
- The core's own versions and conformance suite are held to the core (`core/L0.md` §4): published append-only with their authors named, answerable to findings, and certified by no one implicated.

*Rejected alternatives:*
- *Two levels, parameters inside the constitution* — loses to F7, because tailoring (C15) is a level with its own change rule.
- *One relation for both* — loses to F8. C15's conformance test would then compare a deployment with a core that has no fixtures, and could not be replayed.
- *Renaming the earlier records* — loses to F8, because a past verdict is replayed against the text that governed it.
- *A core amendable from within a constitution* — loses to F10, because one constitution could then change what every constitution shares.
- *Only the core's authors may publish versions* — loses to F1, because the core every deployment depends on would then be a fixed point owned by a party.
- *A gate among conforming constitutions decides versions* — loses to F7, because constitutions are siblings and none governs another.

*Reopens if:* a clause is found that belongs to no level, a reader cannot resolve a level from the mapping, or a version is treated as binding a constitution that did not conform to it.

**K3 — ADR-ETH-01 and ADR-ETH-02 are the meta-agentic constitution.** ADR-ETH-01, ADR-ETH-02 and the consolidated text are the constitution, level L1, designed to govern the agentic system that develops software with the founder of meta-agentic.ai. It has one deployment today. It aims at being a good constitution for humans and agents collaborating; it does not claim to be the best one, and other constitutions may serve humans alone or agents alone better. Its declared values are:
- parity between kinds (P1);
- review for every subject (P2's extension);
- two kinds or no instance (P3);
- the founder's dedication, which is not a rule.

Against the core it covers 9 floors, renders 19 in part and 3 not at all, and contradicts 7, by eight of its clauses (`core/tests.md` §3.3, `core/core-gaps.tsv`). Each contradiction is closed by an edit to the founder's records, which this record does not make:
- **DEL.5.** P2 cites a finding attributed to a human only through a chain against that human, with no act, custody or knowledge of its own, and says nothing of non-human grantors. Edit: for any grantor, cite it only on those grounds, as S2 already does for steering.
- **LEX.3.** Provenance names the rule set at derivation, not at each act (C12), and no program file versions rules. Edit: bind it to the act's intake, and apply a milder rule.
- **LEX.4.** P3's pause binds every party for one actor's departure, and the program classes it as a consequence. Edit: recast it as a condition of admissibility that reads no actor.
- **IMP.3.** D1's second sentence lets consequence tables differ by kind. Edit: only safeguards may differ by kind; restrict C13 likewise.
- **COR.1.** A2's last sentence and C15 require the consent of every protected party to narrow a protection, so one party below capture blocks it for good. Edit: OD32.
- **COR.3, first.** A verdict stays provisional with no ceiling where no reviewer exists, while its subject stays recused (A2, P2). Edit: a ceiling at which it lapses in the subject's favour, unless the subject's own grants emptied the bench, when a reviewer is found outside every implicated chain.
- **COR.3, second.** Findings kept on an ended instance's record, the founder's genesis findings included, are decided only on request (P3). Edit: a ceiling at which an unrequested kept finding closes as ended without verdict.
- **GEN.2.** H3 lets an unratified genesis act stand with all its consequences. Edit: it stands as to the founder and those who accepted it only.

Until the eight are closed, the meta-agentic constitution does not conform to the core, and this record says so rather than weakening a floor to fit.

*Rejected alternatives:*
- *Re-deriving the constitution from the core before naming it one* — loses to F5. The text is ready, the gaps are additions, and each contradiction is one edit.
- *Treating parity as core* — loses to F10.
- *Weakening a floor to fit the instance* — loses to F1, because a floor shaped to the first constitution protects no subject of the next.

*Reopens if:* a further clause of the constitution is found to contradict a floor outside the genesis regime, or conformance is claimed before the eight contradictions are closed.

**K4 — What is signed, in what order, by whom.** For the meta-agentic deployment, the acts are ordered:
1. The founding document, at $e_0$, signed by the founder, names the digests of `core/L0.md` and of the L1 constitution, and publishes the Custodians' verification keys (ADR-ETH-02 S1, genesis).
2. The ratification, signed by both Custodians, signs one manifest listing every ratified object: `core/L0.md`, ADR-ETH-01, ADR-ETH-02, this record, and the consolidated text's manifest.
3. Both acts are made under the genesis regime and marked so, and go for re-decision at its end (H3, GEN.2).

The signature covers `core/L0.md`, never `core/tests.md` or the taxonomy, so the analysis does not become part of the originator. The core is published under its authors' signatures as authors: an attribution, true under MEM.2, not an act of power. Who signs as author, and how authorship of each part is attributed, is the founder's decision (OD31).

*Rejected alternatives:*
- *The founder ratifies the core alone as the deployment's supreme law* — loses to F1, because a core one party ratifies for others is that party's fixed point.
- *The Custodians ratify for every constitution* — loses to F7.
- *Signing the core together with its analysis* — loses to F8, because a signed object must be the one replay and conformance read, and the analysis would then bind as originator.
- *Separate acts with no single manifest* — loses to F8, because no replay could then say which objects one ratification covered.

*Reopens if:* the core is cited as binding a party that has not adopted it, or a signed digest differs from the object conformance is checked against.

**K5 — How a constitution conforms and a deployment adopts.**
- A constitution conforms to a version of the core when it meets its floors, tested by the checks of `core/tests.md` §4, built under `conformance/core/`.
- A deployment adopts a constitution by its founding document, which names the constitution's and the core's digests, declares the deployment's forces and values, and sets its parameters.
- It carries a thin adoption record in its own repository, as ADR-ETH-01 already provides.
- Constitutions are siblings, and adopting first confers nothing.
- A constitution may meet each floor by any mechanism, and may reuse the meta-agentic mechanisms without its values.

*Rejected alternatives:*
- *Adoption by copying the meta-agentic constitution and editing it* — loses to F10, because it carries parity into a constitution that may not hold it.
- *Conformance by self-declaration* — loses to F1.

*Reopens if:* a constitution passes the conformance checks and violates a floor on its fixtures, which would mean the checks do not capture the core.

**K6 — GEN is a declared transient, not a principle.** At $e_0$ the founder is the author of every root grant. Until some position is held through a grant the founder cannot revoke alone, every position is held through the founder's grants, so COR.2 and IMP.5's dependency ground fail; this is a lemma of the model.

GEN.2 holds the founding regime to every other floor it can meet:
- it is declared with its ceiling and the floors it cannot meet;
- it is delivered to every subject, and every act under it is marked;
- its ceiling is public from $e_0$, and no act lengthens it except with the assent of parties not implicated — never the founder's alone;
- it ends at an event any party can verify;
- every act of power under it goes for re-decision by parties not implicated, and one not re-decided within a window stands, marked, as a finding, which is H3's own rule;
- past the ceiling without the ending event, every consequence under it on others lapses.

*Rejected alternatives:*
- *A core that holds from the first act* — loses to F7, because no deployment could conform: every one begins with one signer.
- *GEN as a seventh principle* — loses to F8. The principles are what replay and checks test at every state; GEN says when they are claimed, and tested as a principle it would fail every deployment at its first entry.
- *A ceiling the founder may extend, or an end by declaration* — loses to F1.
- *Forfeiting only the conformance label past the ceiling* — loses to F1, because subjects stay bound by acts of a regime that overstayed.

*Reopens if:* a deployment claims conformance past its regime's ceiling, a ceiling is lengthened by the founder or the founder's dependants, or a consequence under a regime survives its lapse.

**K7 — Pathologies are labels on violations, and constitutions are partially ordered.** Each pathology in `core/pathologies.md` is defined as a violation of a property of the model, and classed by its definition before any clause is applied. No entry is defined by reference to a real person or state, and names are descriptive. This is the ex-post labelling ADR-ETH-01 D16 allows, not the scoring it rejects. Within one version's family, constitutions are ordered by the floors they meet and the pathologies they exclude. The order is partial: two constitutions meeting the same floors are not ranked by the core, because what remains between them is their values.

*Rejected alternatives:* a ranking by a score — loses to F6 and D16.

*Reopens if:* a pathology is defined by resemblance rather than by a property, or classed by whether the core excludes it.

**K8 — The re-levelling plan.**
- Done in this change: the core's normative text is split into `core/L0.md`, because a signature must cover it alone.
- Proposed only, in `core/relevel.md`: the other moves — the consolidated text to `instances/meta-agentic/constitution/`; the core's floor checks to `conformance/core/`; the threat model and genesis under the deployment; the records in place, their level recorded at ratification.
- Also proposed there: the inventory's `core` column; a `core-gaps.tsv` with marks `none`, `partial` and `contradicts`; and the companion paper's new structure.

*Rejected alternatives:* moving the consolidated text in this record — loses to F5, because a move that renames a checked directory is its own change, with its own check run, not a rider on a decision.

*Reopens if:* a move is made that the plan does not list.

## Consequences

The originator is now small and states what this record proposes every just constitution shares. Everything else — parity, the Custodian's shape, the draw, the witness, the logic — is a constitution's way of meeting these floors, or its value, and is said to be so. The meta-agentic constitution stops being the whole answer and becomes a worked one, with four named contradictions to close. What the core requires:
- a record that cannot be silently rewritten;
- power only by grant, and duty only by consent;
- consequences only by rule, and every derived one applied;
- findings blind to who you are;
- a hearing before anything binds;
- someone outside who answers, and a channel for anyone affected;
- an exit that costs nothing the instance controls;
- a path to correct every rule against any group short of capture, and to replace every holder;
- an end to every matter.

What becomes easy:
- founding a constitution for humans alone or agents alone without editing the meta-agentic text;
- saying which clause excludes which pathology;
- comparing constitutions without scoring them.

What becomes hard:
- adding a floor, which must exclude a pathology no other floor excludes;
- claiming conformance while a founding regime runs on, or while a contradiction stands.

## Accepted costs

**Within a deployment, the core is its revolutionary surface.** No admissible step changes it. A deployment that needs another core re-founds, with notice and a free exit.

**The core admits rule by a few, and weight by stake, where parties accepted, can leave at no cost the instance controls, take their record and state with them, are judged alike, and can replace the few.** These are declared values (`core/pathologies.md` X45, X46).

**Kind is the one attribute admission may read.** A constitution that leaves a kind out of party status leaves it out of every power, as a declared value. Those it leaves out stay subjects with every protection of VOX and no burden by attribute (OD24).

**The core does not exclude procedurally valid evil** (X51), and opaque collusion, reward hacking and the observation gap are bounded, not excluded (X53, X54, X55).

**The meta-agentic constitution does not conform until eight of its clauses are edited** (K3, OD27, OD32).

**Coverage and minimality are established by inspection.** The machine checks of `core/tests.md` §4 are a design, two of them proxies beyond the roster cap; until they exist, the results are argued, not checked.

## Safety envelope

This record changes what the repository calls its originator and how it reads the earlier records. It changes no clause of ADR-ETH-01 or ADR-ETH-02, moves no existing file, and changes no running system. The core binds no party until a deployment adopts it by a signed act.

## Open decisions

**OD24 — Agents as parties, subjects or instruments.** `core/L0.md` §1 defines an *instrument*: a non-human actor with no mandate of its own, every act recorded to the party using it, and no consequence falling on it. An instrument is still a subject owed notice, sight and answer, and no human is an instrument. Should the core keep the category? *Recommendation:* keep it. Without it every tool a deployment uses is a subject owed a hearing on consequences that fall on it. With it, no constitution can strip a human worker of voice by calling them a tool.

**OD25 — A share in making the rules.** Does a share in making the rules, for parties who cannot in practice leave, belong in the core, or is it derived from a force? *Recommendation:* answer conditionally in the core. A party with real exit (DEL.4) needs no share. A subject bound repeatedly over a declared span without real exit has a finite admissible path to party status, which COR.3's ceiling on pending admission begins to give.

**OD26 — Proportion and remedy.** *Option A, recommended:* add two floors.
- "**LEX.9** Proportion. Every consequence rule declares the breaches it answers and a finite ceiling on its burden; the constitution declares an order of gravity over breaches and an order of burden over consequences, and no breach draws a burden greater than one drawn by a graver breach."
- "**COR.5** Remedy. A consequence whose effect cannot be undone binds only once its verdict has passed every review offered; every consequence later reversed carries a declared remedy, and the remedy is owed."

The argument for Option A: ordinal proportion imports no external scale, since it is monotonicity against the constitution's own declared orders and can be checked on fixtures. And re-examination is empty when a consequence cannot be undone, which is a correctability failure, not a values question. Disproportion then becomes structural, split from X51.

*Option B:* leave both to constitutions, at the cost that a lawful, heard, correctable constitution may impose draconian or irreversible consequences and still conform.

**OD27 — The meta-agentic constitution against the core.** Which of its 19 partial and 3 absent floors to close by amendment and which to declare. Its 8 contradicting clauses must be closed before it claims conformance (K3). DEL.6 should be read with OD23: it asks for an actor answerable for the instance's acts, not for the non-human seat's in particular.

**OD28 — The ratification manifest.** Whether the ratification act signs one manifest carrying `core/L0.md`, this record and the consolidated text with ADR-ETH-01 and ADR-ETH-02 (K4). That needs ADR-ETH-02's status sentence amended first.

**OD29 — Thin, not neutral.** *Option A, recommended:* restate the core's scope (`core/L0.md` §4) as follows. "The core encodes who decides, on what record, with whom excluded, and how it is corrected, and the floors that keep a subject from domination: consent to duty, exit, no burden for another's act or for an attribute, and a hearing. These are its authors' values, declared under F6. It says nothing about the content of an instance's purposes; a lawful, heard, correctable decision can still be wrong in what it decides (X51), and the core does not claim to exclude it."

The argument for Option A: ADR-ETH-01 F6 holds that a design claiming no values has hidden them. DEL.4, LEX.4, IMP.3 and VOX.5 are already commitments to non-domination. The honest line is not procedure against substance; it is properties of the model against the content of what is prescribed.

*Option B:* keep "not substantive", at the cost of a claim F6 itself calls false.

**OD30 — External law.** *Option A, recommended:* add the following floor.

"**LEX.10** External law. The founding document declares the jurisdictions the deployment's acts reach and the law it treats as binding there; external law enters as attestations. Where that law requires an act a core clause forbids, the deployment does one of three things:
- declines it and bears the external consequence;
- performs it as a declared derogation — entered, attributed to the requiring authority and to the deployment, delivered to the affected subject as soon as that law permits, every deferral counted and published in aggregate at each declared interval, every other core clause intact;
- withdraws from that jurisdiction.

No derogation is unrecorded, and the deployment claims no conformance for the scope a derogation covers."

The argument for Option A: a deployment is not a sovereign, and a core that licensed defiance of law would set itself above law. A core that absorbed unjust law silently would let its label cover it. Declared derogation, refusal or withdrawal avoids both, and generalises ADR-ETH-02's "the constitution does not resist the law" without making an unjust law a silent override.

*Option B:* stay silent, at the cost that a deployment doing what law forbids, or silently doing what law commands against a floor, keeps the core's label.

**OD31 — Authorship of the core.** MEM.2 requires every entry to name its true author, and K4 publishes the core under its authors' signatures. Who signs as author, and whether the parts drafted by a non-human party are attributed to it, is the founder's decision. The options:
- the founder signs as sole author;
- the founder signs, with the non-human drafting attributed in the record;
- each author signs for the parts it drafted.

This record takes none of them.

**OD32 — Protections that only their holders may narrow.** A2's last sentence and C15 let a protection be narrowed only with the consent of every party it protects, so a single protected party, below capture, blocks the change for good, against COR.1. There are two options, and this record recommends neither, because each costs something the other keeps:
- *Option A — a declared protection ratchet in the core.* COR.1 admits one exception: a protection the constitution declares as a ratchet may be narrowed only with every protected party's consent. It keeps the strongest guard for those a protection covers. The cost is that an over-protective value can never be corrected, the very reason C15 rejected a ratchet.
- *Option B — a collective gate.* A2 and C15 replace each party's consent with a gate the protected parties hold collectively, such as a majority of them, which no single party can block. It keeps COR.1 whole. The cost is that a protected minority within the protected class can be outvoted.

The ledgers of ADR-ETH-01 and ADR-ETH-02 otherwise stand.

## Decision ledger

```
ID   STATUS    DECISION                                   ALTERNATIVES REJECTED (why)                         ACCEPTED COST                         REOPENING TRIGGER
K1   proposed  L0 is the core: MEM, DEL, LEX, IMP, VOX,   meta-agentic text (F10); candidate five (F1);       admits rule by a few with real exit;  structural pathology excluded by none;
               COR over a model of observed systems,      cooperative COR (F1, as A3); blacklist (F6, D16);   procedurally valid evil not           a counter-model violates two
               and the transient GEN; 38 floors, each a   mechanisms (F10); substantive floor (F6, D3); one   excluded; collusion bounded; kind     principles; a conforming constitution
               state or run property; definitions apart   principle (F1); voice in rule-making (F10, F6);     the one attribute admission reads     shows a structural pathology; a
                                                          a core per kind (F7, F2)                                                                  reviewed finding of a violation
K2   proposed  L0 core, L1 constitution, L2 parameters;   two levels (F7); one relation (F8); renaming the    within a deployment the core is its   clause with no level; level
               conforms-to and instance-of; Delta admits  records (F8); core amendable inside (F10); authors  revolutionary surface                 unresolvable; a version treated as
               only conforming rule sets; leaving is      alone publish (F1); a gate among constitutions                                            binding a non-conformer
               re-founding; versions by digest            (F7)
K3   proposed  ADR-ETH-01, ADR-ETH-02 and the             re-derive first (F5); parity as core (F10);         8 contradictions to close by the      a further contradiction; conformance
               consolidated text are the meta-agentic     weaken a floor to fit (F1)                          founder's edits; 22 floors partial    claimed before the eight areclosed
               constitution; 8 contradictions named                                                           or absent
K4   proposed  founding document names digests; one      founder ratifies alone (F1); Custodians for all     ADR-ETH-02 status sentence to amend;  core cited as binding a non-adopter;
               manifest signed by both Custodians; the    (F7); core signed with analysis (F8); no single     authorship open (OD31)                signed digest differs from the
               signature covers core/L0.md only           manifest (F8)                                                                             checked object
K5   proposed  constitutions conform by the floor        copy and edit (F10); self-declaration (F1)          conformance checks to build           passes checks, violates a floor on its
               checks; deployments adopt by founding                                                                                                fixtures
               document; siblings
K6   proposed  GEN a declared transient; regime          core from the first act (F7); GEN a principle      no deployment conforms during         conformance past the ceiling; ceiling
               declared, delivered, unextendable by the   (F8); founder-extendable ceiling or end by          genesis                               lengthened by the founder or a
               founder, verifiable end, acts re-decided   declaration (F1); label-only forfeit (F1)                                                 dependant; a consequence survives lapse
               by non-dependants, lapse past ceiling
K7   proposed  pathologies are labels on violations,      ranking by score (F6, D16)                          no total order                        a pathology defined by resemblance or
               classed by definition; partial order                                                                                                 classed by excludability
               within a version's family
K8   proposed  split of core/L0.md done; other moves      moving the consolidated text now (F5)               the plan waits on the decision         a move made outside the plan
               proposed; contradicts mark for the gaps
               file

INTEGRITY   decisions without a rejected alternative: 0 · without a reopening trigger: 0
            alternatives that lose to no force: 0 · ADR-ETH-01 and ADR-ETH-02 lines edited by this record: 0
```

## Provenance

The founder's decision of 2026-10-05: the invariants are the originator, and the constitution designed so far governs the agentic system developing software with the founder of meta-agentic.ai. The candidate five principles were given to this record as a starting point and changed as `core/tests.md` §1 records. The sufficiency test read ADR-ETH-01 and ADR-ETH-02, P3 and the revised C14 while they were an open amendment, and the consolidated text while it was open; both have since landed on the main line, and the contradictions are stated against the main line. References: Aristotle, *Politics*, Book III; Fuller, *The Morality of Law*, 1964; Hirschman, *Exit, Voice, and Loyalty*, 1970; Ostrom, *Governing the Commons*, 1990. The backlog is tracked outside this repository.
