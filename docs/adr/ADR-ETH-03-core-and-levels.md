---
kind: adr
space: eth
adrId: ADR-ETH-03
provisionalNumber: false
title: The core and the levels — six invariant principles as the originator, shared by every instance; the meta-agentic constitution as one instance of them
status: Proposed
date: '2026-10-05'
project: meta-ethics
supersedes: []
supersededBy: []
labels: [core, L0, levels, instance, pathology, minimality, sufficiency, genesis]
---

# ADR-ETH-03 — The core and the levels

**Status: Proposed 2026-10-05.** This record decides what the originator of the constitution is. Until now the text called "the L0 constitution" — ADR-ETH-01 with ADR-ETH-02, and their consolidated rendering — has been both the originator and the constitution of one system. The founder asked which of its parts are the real generative rules that transcend every specific instance, and decided that the invariants are the originator: the meta-level, the core, the kernel, level zero, L0, all one thing. This record names that core, states the levels, and places ADR-ETH-01 and ADR-ETH-02 as the constitution of one instance. The analysis it rests on is in `core/`: the core as a property of a transition-system model (`core/core.md`), the taxonomy of pathologies it was tested against (`core/pathologies.md`), three instance derivations (`core/instances.md`) and the re-levelling plan (`core/relevel.md`).

> Claim tags as in ADR-ETH-01: **[evidence]** · **[hypothesis]** · **[open]** · **[proposed]** · **[pending]**.

## Context — the forces in tension

The forces F1–F9 of ADR-ETH-01, as ADR-ETH-02 sharpens F3, apply. At the level of the core they are not obstacles to one design but the environment every instance is derived in, and their strength differs between instances. Two forces act on this decision that the earlier records did not need.

**F10 — Instance-independence.** Considering all possible constitutions, some yield more ethical decisional systems than others. The core must be shared by every instance worth calling just: one whose parties are all human, one whose parties are all agents in a fully autonomous self-organisation, and one that mixes them, at any speed and under any law. Anything that depends on which kinds are present, how many, or how fast they act, cannot be in it.

**F11 — Exclusion.** A core is justified by what it rules out. Every structural pathology of a decisional system — the unjust, unfair, tyrannical, arbitrary, fascist, oligarchic, plutocratic, corrupt and evil, and those the founder did not list — must be the violation of some principle; and every principle must rule out something no other does, or it is not part of the core.

The two pull against each other and against F6. F10 pushes the core toward less; F11 toward more; F6 says that whatever is added beyond structure is the authors' values relocated.

## The decisions

### K1 — L0 is the core: six principles

The core is six principles, each a property of the model in `core/core.md` §1 (an append-only record; state as a fold over it; a mandate graph rooted in a founding document that is not a party; a verdict function from facts and rules to findings and consequences; a change operator on rules gated over positions).

- **MEM — Memory.** What happened is written once, attributed, and never silently changed; reading about a subject is itself written.
- **DEL — Delegation.** Every power is granted, every duty accepted, every mandate renounceable, and all trace to one root; delegation divides power and never multiplies it.
- **LEX — Legality.** Every consequence is derived from acts by rules in force before them, the same way every time, and compliance is always possible.
- **IMP — Impartiality.** What is found does not depend on who you are or on what you did not choose, power is symmetric across classes, no one is outside judgement, and no one decides their own case.
- **VOX — Voice.** Whoever is bound is told, can see, can answer at no cost, and is heard before it binds.
- **COR — Correctability.** Every rule, verdict and position can be corrected by admissible steps in finite time, and no one, the founder included, owns a fixed point.

The core fixes outcomes and floors, never mechanisms. It is procedural (ADR-ETH-01 D3): it excludes pathologies of structure, not of purpose.

**How it was found.** The candidate given to this record was five principles: Memory, Delegation, Impartiality, Voice, Correctability. Three tests were run (`core/core.md` §3). *Coverage:* 57 pathologies after merging synonyms; the 41 structural ones are each excluded by at least one principle, the 9 mixed ones in their structural part, and the 7 beyond a procedural core are named with the reason. *Minimality:* for each principle, a system satisfying the other five and violating it. *Sufficiency:* every unit of ADR-ETH-01, ADR-ETH-02 and the open amendment adding P3 maps to principle and force, or to value, mechanism, meta or editorial; one unit serves no principle, by its own text; seven core clauses have no clause, or only a partial one, in the instance.

The candidate failed the tests in nine places, and the core above is the result (`core/core.md` §3.4): Legality split from Impartiality, because the two have separate counter-models; accepted duty and exit added to Delegation, because the five admitted bondage; no amplification added, because a rooted chain can mint a thousand delegates; attribute-symmetric power added, because renaming invariance admits caste; the reviewer's independence moved from Voice to Impartiality, and non-retaliation added to Voice; reading made an act, because the five admitted surveillance; Correctability made finite and per-party, because "changeable by the rules" admitted gridlock; the genesis transient stated, because no system satisfies "no position beyond replacement" at its first act.

*Rejected:* the meta-agentic constitution as the core — loses to F10, because parity of kinds (P1), two kinds or no instance (P3) and the human reviewer for humans (P2) exclude a humans-only and an agents-only instance, and to F11, because the text cannot say which of its clauses do the excluding. *Rejected:* the candidate five unchanged — loses to F11: bondage, sybil capture, caste, retroactive and impossible law, surveillance, retaliation and gridlock satisfy all five (`core/core.md` §3.4). *Rejected:* a list of forbidden regimes, a blacklist of pathologies — loses to F6 and to ADR-ETH-01 D16, because it scores against human forms of government and relocates the authors' values, and to F11, because a list is never complete. *Rejected:* a core of mechanisms, such as stratified Datalog, an external witness, a draw by lot — loses to F10, because each is one instance's way of meeting a floor, and another instance may meet it another way. *Rejected:* a substantive floor in the core, such as a duty not to harm outsiders — loses to F6 and D3, as D3 already argued for the instance. *Rejected:* one principle, Correctability alone, on the ground that every pathology is eventually correctable — loses to F11, because a correctable tyranny is a tyranny until corrected, and Correctability alone admits arbitrary verdicts later reversed. *Rejected:* a voice in making the rules for every party, in the core — loses to F10 and F6: an organisation in which a few decide, over parties who accepted, can leave, are judged alike and can replace them, is a declared value, not a pathology; the core requires exit and hearing (`core/pathologies.md` X45, X46). *Rejected:* one core per kind of instance — loses to F7 and F2, because there is then no shared vocabulary in which to compare instances or name their pathologies.

*Reopens if:* a pathology is shown to be structural and excluded by no principle; a principle's counter-model is shown to violate another principle too, so that the principles are not independent; an instance satisfying all six exhibits a pathology the taxonomy classes structural; or an instance the founder holds legitimate violates a principle.

### K2 — Three levels

**L0** is the core, shared by every instance. **L1** is an instance's constitution: for the meta-agentic instance, ADR-ETH-01 with ADR-ETH-02 and their consolidated text. **L2** is an instance's rules and parameters, admitted through its governed channel within the bounds L1 fixes (ADR-ETH-02 T, C15). An instance is derived, not chosen whole: core × forces × values ⟹ instance ⟹ parameters.

The records before this one use "L0" for the meta-agentic constitution and "L1" for its ordinary rules. They are not rewritten. Read under the levels: their "L0" is the instance's L1, their "L0 change" is a constitutional change of the instance, their "L1" is L2, and their "parent" (ADR-ETH-01 D6) is the core with its conformance suite. `core/relevel.md` §1 carries the full mapping.

The core is not a rule of any instance. COR reaches every rule of an instance, its entrenched clauses included, and not the core: an instance cannot amend the core, it can only leave the family. The core changes by re-founding: a new version, which each instance adopts or not by its own constitutional change, as D6 already provides for a parent version. The core binds no one who has not adopted it, so it is a fixed point owned by no party.

*Rejected:* two levels, core and instance, with parameters inside the instance — loses to F7, because tailoring (C15) is a level of its own, with its own change rule. *Rejected:* renaming throughout the existing records — loses to MEM, applied to the records themselves: the evolution must stay readable, as ADR-ETH-02 kept ADR-ETH-01's body. *Rejected:* a core amendable from within an instance by its strongest gate — loses to F10, because one instance could then change what every instance shares.

*Reopens if:* a clause is found that belongs to no level, or a reader of the earlier records cannot resolve a level from the mapping.

### K3 — ADR-ETH-01 and ADR-ETH-02 are the meta-agentic instance

ADR-ETH-01, ADR-ETH-02 and the consolidated text are the constitution of the meta-agentic instance: the instance designed to govern the agentic system that develops software with the founder of meta-agentic.ai. It aims at being a good constitution for humans and agents collaborating; it does not claim to be the best one, and other instances may serve humans alone or agents alone better. Its values, declared under F6, are parity between kinds (P1), review for every subject (P2's extension), two kinds or no instance (P3) and the founder's dedication, which is not a rule. Its forces are F1–F9 at full strength, F2 and F9 in particular. `core/instances.md` §1 derives its text from the core.

The instance satisfies the core except in the genesis regime, which K6 accounts for, and leaves seven core clauses without a clause or with a partial one (`core/core.md` §3.3): non-retroactivity of judgement; notice, with a chance to leave, before a change of rules adds a duty; non-retaliation; possible compliance; no consequence from prediction or association; reads of the record beyond findings; and the replacement of a Custodian (OD4). None is a contradiction. Each is for the instance to close by its own amendment, or to declare.

*Rejected:* re-deriving the instance from the core before naming it one — loses to F5: the instance's text is ready for ratification, and the gaps are additions, not contradictions. *Rejected:* treating parity as core — loses to F10, by the founder's decision.

*Reopens if:* a clause of the instance is found to contradict a core clause outside the genesis regime.

### K4 — What the founder's ceremony ratifies

The core is published under its authors' signatures, as authors: an attribution (MEM.2), not an act of power, because the core binds no one by itself. The meta-agentic instance adopts the core and ratifies its own constitution in one act, signed by both Custodians (ADR-ETH-02 S1, P1). ADR-ETH-02 already makes ADR-ETH-01 and ADR-ETH-02 one act over both digests; this record proposes that the same act carry the digests of this record and of the core. That needs ADR-ETH-02's status sentence amended in place before the act, which ADR-ETH-02 permits until then; this record does not make that edit. The act is made under the genesis regime and is marked so (ADR-ETH-02 H3).

*Rejected:* the core ratified by the founder alone as the instance's supreme law — loses to F10 and COR.2, because a core one party ratifies for an instance is that party's fixed point. *Rejected:* the core ratified by the meta-agentic Custodians on behalf of every instance — loses to F7: instances are siblings, and none adopts for another. *Rejected:* two separate acts, one for the core and one for the instance — loses to F5, because the instance would then exist for a time with a constitution and no core, or a core and no ratified constitution.

*Reopens if:* the core is cited as binding a party that has not adopted it.

### K5 — How a future instance adopts the core

An instance adopts the core by its founding document, which names the core's version by digest, declares the instance's forces and values, and states the instance's constitution (L1). It conforms when its rules pass the core's conformance checks (`core/core.md` §4, to be built under `conformance/core/`) and its own; and it carries a thin adoption record in its own repository, as ADR-ETH-01 already provides. It is a sibling of every other instance: adopting first confers nothing. It may meet each floor by any mechanism, and may adopt the meta-agentic instance's mechanisms as a library without adopting its values.

*Rejected:* adoption by copying the meta-agentic constitution and editing it — loses to F10, because it carries parity into an instance that may not hold it, and to F11, because the edit cannot tell which clauses carry the core. *Rejected:* conformance by self-declaration — loses to F1.

*Reopens if:* an instance passes the core's conformance checks and violates a principle on its fixtures, which would mean the checks do not capture the core.

### K6 — The genesis transient

In every rooted system the signer of the founding document holds every position at the first act, before any grant (DEL.1). No system satisfies COR.2 or IMP.5 at genesis. The core is therefore claimed from the end of a founding regime, and the regime is held to the core's other clauses: it is declared and every act under it marked, it has a finite declared ceiling, and every act of power under it is decided again at its end by parties it did not implicate. An instance whose founding regime never ends never conforms. ADR-ETH-02 H3 is the meta-agentic instance's mechanism for this; the outcome is the core's.

*Rejected:* a core that holds from the first act — loses to its own impossibility. *Rejected:* exempting genesis without bounds — loses to F1, because a founding regime with no end is entrenchment by another name (`core/pathologies.md` X44).

*Reopens if:* an instance claims conformance with its founding regime past its declared ceiling.

### K7 — Pathologies are labels on violations, and instances are partially ordered

Each pathology in `core/pathologies.md` is defined as a violation of a property of the model, never as a resemblance to a historical polity, and no real person or state is named. This is the ex-post labelling ADR-ETH-01 D16 allows, not the scoring it rejects. Instances are ordered by which principles they satisfy and which pathologies they exclude. The order is partial: two instances satisfying all six are not ranked by the core, because what remains between them is their values.

*Rejected:* a ranking of instances by a score — loses to F6 and D16.

*Reopens if:* a pathology is defined in the taxonomy by resemblance rather than by a property.

### K8 — The re-levelling plan

`core/relevel.md` proposes the moves: the consolidated text to `instances/meta-agentic/constitution/`; the core's property checks to `conformance/core/`; the threat model and the genesis directory under the instance; the decision records where they are, their level recorded at ratification; and the companion paper's new structure — thesis the core and the pathology result, the multiverse of constitutions as its frame, the meta-agentic instance as a worked derivation, a humans-only and an agents-only instance as sketches. No existing file is moved by this record.

*Rejected:* moving files in this record — loses to F5 and to the open consolidated text, which would be rebased under a move it did not make.

*Reopens if:* a move is made that the plan does not list.

## Consequences

The originator is now small and states only what every just instance must share: a record that cannot be silently rewritten, power that flows only by grant and duty only by consent, consequences only by rule, findings blind to who you are, a hearing before anything binds, and a path to correct every rule and replace every holder. Everything else — parity, the Custodian's shape, the draw, the witness, the logic — is an instance's way of meeting these floors or an instance's value, and is said to be so. The meta-agentic constitution stops being the whole answer and becomes a worked one.

What becomes easy: founding an instance for humans alone, or agents alone, without editing the meta-agentic text; saying which clause of an instance excludes which pathology; comparing two instances without scoring them. What becomes hard: adding a clause to the core, which must exclude a pathology nothing else excludes; claiming conformance while a founding regime runs on.

## Accepted costs

**The core admits rule by a few, and weight by stake, where parties accepted, can leave, are judged alike and can replace the few.** These are declared values, not pathologies, under this core (`core/pathologies.md` X45, X46). An instance whose parties cannot leave in practice needs more, and OD25 asks whether that is a core clause.

**The core does not exclude procedurally valid evil.** A lawful, blind, heard and correctable decision can be wrong in what it decides (X51). The core makes it recorded, binding on its makers alike, answerable, leavable and correctable, and no more. This is ADR-ETH-01 D3, stated at the level of the core.

**Opaque collusion, reward hacking and selective observation are bounded, not excluded** (X53–X55). No core over a record excludes them.

**The meta-agentic instance has seven gaps against the core.** None is a contradiction; each is a clause to add (OD27).

**IMP.3 forbids parties without power by kind.** An instance that wants agents without standing must keep them as instruments, not parties (OD24).

**Coverage and minimality are established by inspection.** The machine checks of `core/core.md` §4 are a sketch; until they exist, the results here are argued, not checked.

## Safety envelope

This record changes what the repository calls its originator and how it reads the earlier records. It changes no clause of ADR-ETH-01 or ADR-ETH-02, moves no file, and changes no running system. The core binds no party until an instance adopts it by a signed act.

## Open decisions

**OD24** — Agents as parties or as instruments: IMP.3 forbids barring a class of parties by kind from power, so an instance that wants agents without standing keeps them outside the set of parties. Is that the line the founder wants? **OD25** — Whether a share in making the rules, for parties who cannot in practice leave, belongs in the core or is derived from a force. **OD26** — Whether a bound on consequences, proportionality, belongs in the core. **OD27** — The meta-agentic instance's seven gaps against the core (`core/core.md` §3.3): which to close by amendment, and which to declare. **OD28** — Whether the ratification act carries this record and the core (K4), which needs ADR-ETH-02's status sentence amended first. The ledger of ADR-ETH-01 and ADR-ETH-02 otherwise stands.

## Decision ledger

```
ID   STATUS    DECISION                                   ALTERNATIVES REJECTED (why)                         ACCEPTED COST                         REOPENING TRIGGER
K1   proposed  L0 is the core: MEM, DEL, LEX, IMP, VOX,   meta-agentic text as core (F10, F11); candidate     admits rule by a few with exit;       structural pathology excluded by none;
               COR, properties of a minimal model;        five (F11); blacklist (F6, D16, F11); mechanisms    procedurally valid evil not           principles not independent; conforming
               procedural; outcomes not mechanisms        (F10); substantive floor (F6, D3); one principle    excluded; collusion bounded           instance shows a structural pathology;
                                                          (F11); voice in rule-making (F10, F6); a core per                                         legitimate instance violates a principle
                                                          kind (F7, F2)
K2   proposed  levels L0 core, L1 instance constitution,  two levels (F7); renaming the records (MEM);        two vocabularies until the            clause with no level; level unresolvable
               L2 rules and parameters; records read by   core amendable inside an instance (F10)             consolidated text changes             from the mapping
               a mapping; core changes by re-founding
K3   proposed  ADR-ETH-01, ADR-ETH-02 and the             re-derive before naming (F5); parity as core (F10)  seven gaps to close                   instance clause contradicts the core
               consolidated text are the meta-agentic                                                                                               outside genesis
               instance; parity its value
K4   proposed  core published under its authors'          founder ratifies alone (F10, COR.2); Custodians     ADR-ETH-02 status sentence to amend   core cited as binding a non-adopter
               signatures; instance adopts it and         ratify for all (F7); two acts (F5)
               ratifies its constitution in one act
               signed by both Custodians
K5   proposed  adoption by a founding document naming     copy and edit (F10, F11); self-declaration (F1)     conformance checks to build           instance passes checks, violates a
               the core by digest; core conformance                                                                                                 principle on its fixtures
               checks; siblings
K6   proposed  genesis transient: core claimed from the   core from the first act (impossible); unbounded     no instance conforms during genesis   conformance claimed past the regime's
               end of a declared, marked, finite founding exemption (F1)                                                                            ceiling
               regime, its acts decided again
K7   proposed  pathologies are labels on violations;      ranking by score (F6, D16)                          no total order of instances           a pathology defined by resemblance
               instances partially ordered
K8   proposed  re-levelling plan proposed, not executed   moving files now (F5)                               the plan waits on the open text       a move made outside the plan

INTEGRITY   decisions without a rejected alternative: 0 · without a reopening trigger: 0
            ADR-ETH-01 and ADR-ETH-02 lines edited by this record: 0
```

## Provenance

The founder's decision of 2026-10-05: the invariants are the originator, and the constitution designed so far is the instance that governs the agentic system developing software with the founder of meta-agentic.ai. The candidate five principles were given to this record as a starting point and changed as `core/core.md` §3.4 records. ADR-ETH-01 and ADR-ETH-02 at the main line; the open amendment that adds P3 and revises C14, and the open consolidated text, read for the sufficiency test. References: Aristotle, *Politics*, Book III; Fuller, *The Morality of Law*, 1964; Hirschman, *Exit, Voice, and Loyalty*, 1970; Ostrom, *Governing the Commons*, 1990. The backlog is tracked outside this repository.
