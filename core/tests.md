# Tests of the core

**Status: Proposed with ADR-ETH-03, 2026-10-05.** This file records what the core in `core/L0.md` rests on: how it was found from a candidate, the three tests it was put through, the machine checks that would test an instance against it, and the questions it leaves open. It is not part of the core and is not covered by a signature over it.

> Claim tags as in ADR-ETH-01. Every result here is **[proposed]** and established by inspection, not machine-proved, unless it says otherwise.

## 1. From the candidate to the core

The candidate given to ADR-ETH-03 was five principles: Memory, Delegation, Impartiality, Voice, Correctability. The tests of §3 found the failures below; each is closed in `core/L0.md` as stated.

1. **Impartiality held two independent principles.** "A function of acts and rules" and "never of who acted" have separate counter-models. *Changed:* LEX is a principle of its own.
2. **Discretion entered through attestations, and derived consequences need not be applied.** An office could attest "wrongful, grade 3" and let a rule derive the sanction, and an enforcer could apply derived sanctions to rivals only. *Changed:* LEX.1 is a biconditional (congruence); attestations are typed and never establish a breach, finding or consequence directly (§1, LEX.2); like acts are judged alike (LEX.7).
3. **The rules, the fold and admissibility could change outside the record.** *Changed:* the fold and the admissibility relation are components of $\Gamma$, and LEX.8 makes every component change only by $\Delta$.
4. **The model made two floors true by definition.** Runs only appended, and the verdict was a function. *Changed:* a system is an abstraction with an observation map, so MEM.1 and LEX.2 are properties that can fail.
5. **What $\Delta$ may reach was unstated.** *Changed:* $\Delta$ admits no change that loses a rule-set floor the current rule set meets; leaving the core is a re-founding, not a step (§1, DEL.7).
6. **Non-retroactivity was set at derivation, froze procedure at the filer's choice, and kept the harsher law.** *Changed:* LEX.3 judges an act by the rules at its intake position, or by milder ones adopted before the verdict; an act's time is its intake position, never a time its author supplies.
7. **No principle excluded bondage, and duty bound only parties.** *Changed:* DEL.3 binds no actor, party or not, to an unaccepted duty, and settles how a duty added by change is accepted (notice, a declared interval and a free exit); *binds* is defined over every actor. Acceptance of each added duty, one by one, was rejected: every change would wait on every party (F5). Acceptance by staying is admitted only because DEL.4 makes leaving free and portable, which answers the objection ADR-ETH-02 A2 raised against consent bundled with a mandate.
8. **Exit was formal.** *Changed:* DEL.4 makes exit cost nothing the instance controls and gives the leaver its record and state; DEL.7 governs an instance's own departure from the core.
9. **One chain could mint delegates or fill seats.** *Changed:* DEL.2 creates positions only by change and counts positions held in one chain once.
10. **Liability ran up the chain without knowledge.** *Changed:* DEL.5 separates recording from liability; a grantor bears a consequence only for its own act, custody, or recorded knowledge with a failure to act.
11. **Answerability ended at a document, and the harmed outsider had no standing.** *Changed:* DEL.6 and VOX.6.
12. **Caste passed as a "declared protection", and a class could be kept out of party status and burdened.** *Changed:* an attribute is anything not derived from the actor's own acts; IMP.3 lets a consequence read an attribute only as a safeguard, which never changes burden or power; admission reads no attribute but kind, and a kind left out is left out of every power.
13. **Implication was unsatisfiable or gameable.** A general rule benefits everyone, every proposer acted in its proposal, and a filer could disqualify by naming. *Changed:* the four grounds of `core/L0.md` §1, with the general-application carve-out, the procedure exclusion, the dependency ground, and the deciding set fixed before a filer's names are read.
14. **Voice did not bound interim measures, and was too broad on refusal and reporting.** *Changed:* VOX.7; VOX.5 covers refusing what was not accepted, and judges a false attestation as an act.
15. **Memory made reading unloggable and erasure unreal, and recorded everything.** *Changed:* MEM.5 bounds learning about an identified subject, as the instance's identifier-free views do; MEM.1 is append-only over skeletons, so erasure of content is real; MEM.2 requires the true author and records no more than needed.
16. **Correctability was cooperative.** A unanimity rule and two seats that guard each other passed. *Changed:* COR.1 holds against every group below capture, in the form ADR-ETH-02 A3 uses; COR.2 forbids cycles in the replacement-dependency graph.
17. **No matter had to end, and a favourable verdict could be reopened without end.** *Changed:* COR.3 bounds every matter and provisional status; COR.4 forbids double jeopardy.
18. **The genesis lemma did not hold in the model, and the founding regime could be extended or ended by declaration.** *Changed:* GEN is a declared transient, not a principle; its lemma is restated in the model's terms; GEN.2 is held to the other floors.
19. **The admissibility relation could carry burdens past every floor.** A condition such as "acts by kind b are not admitted" changed capacity without being a consequence. *Changed:* *binds* covers any component of $\Gamma$; $A$ is invariant under renaming (IMP.1) and under permutation of attribute values (IMP.3); a condition of $A$ that reads an actor's own status is a consequence.
20. **The change operator checked only state floors, so a change could install unanimity.** *Changed:* floors are tagged **[Γ]**, **[state]** or **[run]**, and $\Delta$ admits a rule set only if it meets every [Γ] floor the current one meets, decided at admission by the bounded checks of §4: no change regresses, a non-conforming rule set can be repaired one change at a time, and conformance is claimed only once every floor is met. A first form compared whole floors, so a rule set failing a floor anywhere could add violations of it everywhere; the comparison is now per violation — a floor with the rule, matter or position that fails it — and GEN.3 bounds how long a deployment may name the core while it does not conform.
21. **The procedure exclusion of implication let a decider review its own decision.** *Changed:* ground (iii) excepts reviewing or re-examining one's own decision.
22. **Universality forbade duties of office.** *Changed:* IMP.4 forbids reading a position only to exempt its holder.
23. **Admission by attribute excluded qualification and legal capacity, and a first loosening let proxies back in.** *Changed:* admission may read a declared minimum age or legal capacity that every actor of an admitted kind meets or comes to meet, never a maximum age; a criterion no actor of a kind can meet reads kind and is declared; capacity withheld by law on another attribute is a derogation, not a criterion; a qualification counts only if every actor of an admitted kind can obtain it and a party attests it under IMP.5.
24. **Discretion at grants and revocations was governed by no floor.** A blind rule with a gatekeeper who grants to one class, or a purge of one kind's mandates — at once, or one revocation at a time — passed. *Changed:* DEL.8; a revocation reads no attribute, kind included, and is a consequence only when it is for the holder's acts.
25. **Lapse in the subject's favour gave impunity to a party whose grants filled every seat.** *Changed:* COR.3 provides a decider from outside every implicated chain, and lapse is unavailable to a subject whose grants emptied the bench; GEN.2 lapses an unre-decided genesis act's consequences on everyone but the founder and those who accepted it.
26. **Three protections of subjects reached parties only.** *Changed:* MEM.3, MEM.5 and LEX.5 reach subjects and actors.
27. **An answerable actor could be named without its consent, and leaving the core had no gate.** *Changed:* DEL.6 requires the named actor's accepted entry; DEL.7 requires the most demanding gate, under IMP.5, and a chance for every subject to answer.
28. **The outside decider could be rebuilt from the founder's own grants.** A pool the founding document grants holds its positions through the founder's grants, so it is implicated in every matter about the founder. *Changed:* COR.3's outside decider holds a root grant no implicated party made or can revoke alone — for matters about the founder, a grant made after genesis through $\Delta$, or an outside decider the founding document names without granting it a mandate, whose decision enters as an attestation from which the consequence is derived, so that it falls under IMP.5 and VOX.3.
29. **A protection could hold a change back for ever.** A rule letting a protection be narrowed only with every protected party's consent satisfied the core while it applied to no gate. *Changed:* COR.1 admits a lock only if it is defined — what it protects and for whom — and the rule set names the clauses under which the collective overrides it; no party, seat or class blocks a change for ever (ADR-ETH-03 K9). The ratchet that would have let a declared protection stand beyond override was rejected.

Oligarchy and plutocracy are not excluded as such. "A few decide" and "weight follows stake" are violations only through cycles of mutual replacement, a blocking group below capture, barring by attribute, or binding those who cannot leave. Over parties who accepted, can leave at no cost and can replace the few, they are declared values (`core/pathologies.md` X45, X46).

Fuller's eight ways to fail to make law are restated as follows: generality as IMP.1 and IMP.4; promulgation as VOX.1; non-retroactivity as LEX.3; clarity as VOX.1's readable form and LEX.2's replay; non-contradiction and possibility of compliance as LEX.5; congruence as LEX.1 with LEX.7. *Constancy*, the warning against rules that change too often, is not a floor: how often a constitution changes is its value, and the harm constancy guards against — an act judged under rules its author could not know — is excluded by LEX.3 and VOX.1. A machine-speed instance should still declare a bound (`core/instances.md` §3).

## 2. Clauses and definitions

The core has **39 floors**: MEM 5, DEL 8, LEX 8, IMP 5, VOX 7, COR 4 in six principles, and GEN.2 and GEN.3 in the two declared transients. §1 of `core/L0.md` holds the **definitions of the model**: systems as abstractions, attribute and kind, act time, skeleton, the rule set's six components, state, live edge, party, subject, instrument, binding, implication, positions and capture, change, attestation, provisional status, runs, and the two relations between levels. A definition binds no one; it fixes what a floor means.

## 3. Tests

### 3.1 Coverage

`core/pathologies.md` classes each pathology by its definition, before asking whether a clause excludes it:
- **Structural** pathologies are definable over the observed record, mandate graph, rule set and positions, without the content of what is prescribed, the quality of an attested judgement, or relations the record does not hold.
- **Mixed** ones have a structural part and a part that does depend on one of those.
- **Beyond** ones are definable only through the content of what is prescribed, or through relations no record holds.

| Class | Count | Result |
|---|---|---|
| Structural | 48 | every one excluded by at least one clause |
| Mixed | 14 | the structural part excluded; the remainder named |
| Beyond | 5 | not excluded; made visible, attributed, answerable and correctable where the core can, and named |
| Total | 67 | |

Per principle, the pathologies whose *Excluded by* list names one of its clauses. The table is generated from those lists, not written by hand:

| Principle | Pathologies |
|---|---|
| MEM | X01 Revisionism, X02 Unattributed power, X03 Surveillance, X04 Whitewashing, X05 Exit as erasure, X07 Operator capture, X08 Covert steering, X25 Totalitarian reach, X31 Corruption, X42 Information control, X55 Selective observation, X61 Forgery, X65 Party fork |
| DEL | X02 Unattributed power, X04 Whitewashing, X06 Usurpation, X07 Operator capture, X08 Covert steering, X09 Sybil capture, X10 Proxy amplification, X11 Clientelism, X12 Bondage, X13 Lock-in, X14 Colonial binding, X16 Anarchy, X21 Collective punishment, X24 State of exception, X25 Totalitarian reach, X43 Paternalism, X45 Oligarchy, X46 Plutocracy, X48 Junta, X52 Externality on outsiders, X58 Exclusion from standing, X63 Liability by hierarchy, X64 Capture through filled positions, X66 Exclusion by discretion |
| LEX | X03 Surveillance, X08 Covert steering, X14 Colonial binding, X15 Arbitrary rule, X16 Anarchy, X17 Retroactive law, X18 Secret law, X19 Impossible law, X20 Pre-emptive punishment, X21 Collective punishment, X22 Show trial, X23 Selective enforcement, X24 State of exception, X25 Totalitarian reach, X26 Endless opaque process, X27 Mob rule, X33 Self-promotion of optimisers, X39 Opacity, X48 Junta, X55 Selective observation, X63 Liability by hierarchy |
| IMP | X05 Exit as erasure, X07 Operator capture, X11 Clientelism, X22 Show trial, X23 Selective enforcement, X28 Personal law, X29 Caste, X30 Dynasty, X31 Corruption, X32 Judge in own cause, X33 Self-promotion of optimisers, X34 Base manipulation, X35 Rule by unamendable doctrine, X36 Monoculture of judges, X45 Oligarchy, X55 Selective observation, X58 Exclusion from standing, X62 Disqualification by accusation |
| VOX | X03 Surveillance, X13 Lock-in, X18 Secret law, X22 Show trial, X26 Endless opaque process, X27 Mob rule, X37 Summary judgement, X38 Silencing, X39 Opacity, X40 Tempo capture, X41 Rubber-stamp review, X42 Information control, X43 Paternalism, X52 Externality on outsiders, X59 Indefinite provisional status |
| COR | X16 Anarchy, X26 Endless opaque process, X30 Dynasty, X35 Rule by unamendable doctrine, X40 Tempo capture, X44 Entrenchment, X45 Oligarchy, X46 Plutocracy, X47 Gerontocracy, X48 Junta, X49 Paralysis, X50 Revolution-only correction, X59 Indefinite provisional status, X60 Double jeopardy, X67 Impunity by exhaustion |

### 3.2 Minimality

For each principle, a system expressible in the model that satisfies the other five principles and violates exactly one. Each is a variation of a *conforming* system — one that meets every floor — and each states what it holds fixed so that no other principle is touched.

- **Without MEM — the pruned ledger.** The operator removes, from the concrete store, entries no rule reads any longer, such as superseded draft proposals. The observed skeletons are then not prefix-monotone (MEM.1), and no party can detect it (MEM.3). No answer is removed (VOX.3), no entry in a matter the operator is implicated in is touched (IMP.5), no rule reads what was removed (LEX.2, LEX.3), and no verdict changes. Only MEM fails.
- **Without DEL — self-admission.** An actor's own act of registering creates a live edge from $\rho$ to itself, with no grantor. Every act is still recorded to its true author, rules are blind, verdicts are heard, and changes are reachable. DEL.1 fails, because the capability to admit is exercised by an actor that holds it through no chain. A second witness, for DEL.3 and DEL.4 alone: **conscription** — mandates imposed without acceptance and irrevocable by their holder, with notice, hearing and replay intact.
- **Without LEX — the discretionary office.** An office, held under mandate, judged, replaceable and not implicated, imposes *final* consequences that are not in $C(\sigma)$; each is delivered, answerable and reviewed after a window. LEX.1 fails. The office imposes no interim measure, which would also fail VOX.7. IMP constrains $V$, and these consequences lie outside it, so IMP is untouched — which is also why IMP means nothing without LEX.
- **Without IMP — the named eligibility.** A derivation rule makes one named actor eligible for a seat: `eligible(c, s)`. IMP.1 fails. The gate is symmetric under attribute permutation (IMP.3), the named actor is judged like every other (IMP.4), and it decides nothing it is implicated in (IMP.5). Second witnesses: **a two-tier code**, a non-safeguard consequence rule reading kind (IMP.3 alone); and **self-review**, voters on matters that benefit them specifically (IMP.5 alone).
- **Without VOX — summary binding.** Sanctions bind the moment they are derived: no delivery, no window, no review. No duty is added by any change, so DEL.3's acceptance by notice is not engaged. Every sanction is derived (LEX.1), blind, recorded and correctable. VOX fails and nothing else does.
- **Without COR — the unremovable seat.** No rule provides any path to replace seat $s$'s holder, and the rule establishing $s$ has an empty family of winning sets. The holder is judged like anyone and decides nothing it is implicated in. COR.1 and COR.2 fail, and no other principle does.

**Clauses with their own witnesses.** Each clause added to answer a distinct pathology has a witness that violates it and no clause outside its principle:

| Clause | Witness |
|---|---|
| DEL.2 (chain counting) | one chain fills a winning set (X64) |
| DEL.5 | a sanction on a grantor for a delegate's act it neither knew of nor could stop (X63) |
| DEL.6 | no one named answerable outside |
| DEL.7 | a one-step re-founding |
| LEX.7 | alike acts attested differently |
| LEX.8 | the fold replaced outside the record |
| IMP.3 (admission sentence) | party status reserved by an attribute other than kind (X58) |
| IMP.5 (grounds) | deciders struck by a filer's naming (X62) |
| VOX.6 | outsiders' filings refused |
| VOX.7 | interim measures with no ceiling |
| COR.3 | a probation that never ends (X59) |
| COR.4 | an acquittal reopened without new evidence (X60) |
| MEM.2 | an entry naming a false author (X61) |
| DEL.8 | a purge of one kind's mandates, each revoked at will (X66) |
| COR.3 (outside decider) | a founder whose grants filled every seat, every matter about it lapsing (X67) |
| IMP.5 (iii) exception | a judge reviewing its own verdict on appeal (X32) |
| IMP.3 ($A$ invariance) | acts by one kind not admitted, everything else blind |
| GEN.3 | a deployment that names the core for good while failing a floor, its subjects untold |
| COR.1 (locks) | a protection narrowable only with every protected party's consent, with no collective override |

**Couplings checked.** Several clauses refer to another principle; none makes a principle derivable from the others.
- DEL.8 applies VOX, IMP and LEX to grants and revocations, which are acts of a grantor and not consequences; its witness (a purge by individually valid revocations) violates no clause outside DEL. The VOX witness revokes nothing, so DEL.8's reliance on VOX is not engaged.
- COR.3's outside decider uses IMP.5's implication; its witness keeps every decider unimplicated except through the subject's grants.
- $\Delta$ refuses any change that adds a violation of a [Γ] floor. The COR witness's rule set is the founding one; its frozen seat rule is a violation it keeps, so no change is refused on its account, and because the seat rule's family of winning sets is empty, no change can remove it, and the witness keeps failing COR alone.
- The lock sentence of COR.1 is a case of COR.1's own quantifier, made explicit: its witness (a consent-only protection) violates COR.1 and no clause outside COR, and the COR counter-model, the unremovable seat, is unaffected, since it has no override clause and keeps failing COR alone.
- X67's witness is excluded by COR.3 alone: a matter decided by an outside decider is judged, so IMP.4 is not separately engaged.
- DEL.3's acceptance by staying refers to VOX.1's notice. The VOX witness therefore adds no duty by change.
- VOX.7 refers to COR.3 for its ceiling and adds scope and remedy; it is not a restatement.
- LEX.2 refers to IMP.5 and VOX.3 for attesters; it applies them to attesters and does not restate them.
- GEN.2 uses IMP.5's implication; GEN is not a principle.
- IMP.1 presupposes that a verdict is a function of $(\Gamma, \sigma)$, which the model defines; LEX.2's own content is replay by any party from the observed record, which can fail independently.

**Result.** The six principles are independent: each has a witness in the model that violates it alone. The composite principles are independent at clause level where it matters, as the clause witnesses show.

### 3.3 Sufficiency against the meta-agentic instance

Every unit of ADR-ETH-01 (D1–D21), of ADR-ETH-02 on the main line (T, A1–A3, H1–H3, C1–C23, the dedication, S1, S2, P1, P2), and its P3 and revised C14, read when they were still an open amendment and since landed on the main line, is mapped in two directions: each unit to what it serves, then each core floor to the units that render it.

The classes a unit can fall in:
- *floor*: states a core floor as forces sharpen it;
- *mechanism*: how the instance delivers a floor;
- *value*: a choice the instance declares under F6;
- *meta*: about levels and tailoring;
- *design rule*: a constraint on how clauses are written;
- *method*: how the instance watches its own health;
- *editorial*: a correction of the records' own statements.

**Units to principles.**

| Unit | Serves | Forces | Class |
|---|---|---|---|
| D1 symmetry | IMP.2, IMP.3 | F1, F2 | floor; D1.2's consequence tables by kind contradict IMP.3 |
| D2 a last word | COR.3 | F5, F1 | floor; the seat is mechanism |
| D3 procedural | the core's scope (`core/L0.md` §4) | F6 | meta |
| D4, C1 claims | LEX.2, IMP.1 | F2, F6, F8 | floor |
| D5 bypass economics | all | F4 | design rule |
| D6, D7, C3, C15, T | levels and tailoring | F7, F1 | meta |
| D8 closure | IMP.4, MEM.2 | F1, F4 | floor |
| D9 arbiter a seat | IMP.4, IMP.5, LEX.2, COR.2 | F1, F5 | floor |
| D10, D11 perimeter | LEX.6, MEM.2 | F1, F4 | floor |
| D12, C7 issuance | DEL.1, DEL.2, IMP.3 | F1, F5 | floor; the governed channel is mechanism |
| D13 inform of perimeter | VOX.1 | F1 | floor |
| D14, A2 record | MEM.1, MEM.4, MEM.5, VOX.2–4, VOX.7, IMP.5, DEL.5 | F1, F9 | floor |
| D15, C19 witnessed delivery | MEM.2, IMP.5, DEL.5 | F1, F4 | floor |
| D16, D17, D19, C10 | COR | F5, F6, F7 | method |
| D18, C2 | COR.1 | F5, F1 | floor |
| D20 the lab | IMP.5, LEX.8 | F1, F6 | floor |
| D21 identity per decision | LEX.3 | F5, F8 | floor |
| A1 party and subject | DEL.1–4, IMP.4, VOX.1–3 | F1, F5, F9 | floor |
| A3 working state | COR.3, COR.4 | F1, F8 | floor; the state's form is mechanism |
| H1 lawful obstruction | COR.3, VOX.3, VOX.4 | F1, F7 | floor; defences are mechanism |
| H2 opaque coordination | LEX.4, MEM.2, IMP.5 | F1, F3, F6 | floor |
| H3 genesis regime | GEN.2 | F4, F7 | floor; exit by custody is mechanism |
| C4, C8 | — | — | editorial |
| C9 observable triggers | LEX.1 (D1's trigger), COR | F1 | floor in part |
| C5, C16 placement, witness | MEM.1, MEM.3 | F1, F9 | mechanism |
| C6 fragment | LEX.2 | F3, F8 | mechanism |
| C11, C12, C23 replay | LEX.2, LEX.3, MEM.1 | F6, F8, F9 | floor; provenance format is mechanism |
| C13 derivation and consequence | IMP.2, IMP.3 | F2, F9 | floor |
| C14 conflicting consequences | LEX.5, LEX.2, IMP.1, IMP.5, VOX.4 | F3, F5 | floor; the ordering is mechanism |
| C17, C20–C22 the draw | IMP.5 | F1, F2, F9 | mechanism |
| C18 configuration check | COR.1, COR.3 | F1 | mechanism |
| S1 signed acts | MEM.2, MEM.3, DEL.1 | F1, F9 | floor; method is mechanism |
| S2 continuity | MEM.2, MEM.4, DEL.1, DEL.5 | F1, F2 | mechanism |
| P1 Custodian in parity | COR.1, COR.2, COR.3, IMP.3, IMP.5, DEL.2 | F1, F5 | composition by kind is **value**; seats and ceilings are mechanism |
| P2 review for every subject | VOX.4, IMP.3, IMP.5 | F9 | floor; extension to non-human subjects is **value** |
| P3 two kinds or no instance | IMP.3 (admission reads kind), MEM.4 | F6 | **value** |
| Dedication | — | F6 | non-normative |

**Noise.** No normative unit serves no principle. Three units are not normative: the dedication, by its own text, and the editorial corrections C4 and C8.

**Floors to units.** Status is *covered*, *partial*, *none* or *contradicts*; every row not marked covered is also in `core/core-gaps.tsv`, the seed of the gaps file `core/relevel.md` §5 proposes. A *contradicts* row names the instance edit that would resolve it. Each such edit is a change to the founder's records, made by the founder's own amendment, not by this record.

| Floor | Status | Instance units | Instance edit that would close it |
|---|---|---|---|
| MEM.1 | partial | A2, C16, C23 | A2: the anonymising act replaces content and keeps each entry's digest, author, type and position |
| MEM.2 | partial | S1, H2, D11 | enter nothing that no rule reads and no declared purpose covers |
| MEM.3 | partial | C16, S1 | the witness is readable by any party; a subject that is not a party should verify the entries about it too |
| MEM.4 | covered | A1, A2 | — |
| MEM.5 | partial | A2 (identifier-free views, read log), S1 (key resolution logged) | reads by actors that are not parties — a substrate provider, an outside service — are entered as well |
| DEL.1 | partial | A1, C7 | standing under a mandate runs from acceptance (A1 makes a grantee a party before it accepts) |
| DEL.2 | partial | C7, A1, P1 | count positions held in one chain once in every winning set, not only at the Custodian |
| DEL.3 | partial | A1 | a duty added by change binds after delivery and a declared interval in which the holder may renounce |
| DEL.4 | partial | A1, P3 | no cost the instance controls; the leaver takes its record and constituting state |
| DEL.5 | **contradicts** | P2 (the sentence on findings attributed through a chain), D15, S2, P3 | P2 cites a finding attributed to a human only through a chain against that human after review of the attribution, with no act, custody or knowledge of the human's own; it says nothing for non-human grantors. Edit: cite a chain-attributed finding against any grantor, human or not, only where the record shows its undeclared or out-of-scope grant, its custody, or its knowledge with a failure to act, as S2 already provides for steering; and P3's genesis presumption counts an overridable seat's act as the founder's for DEL.5's custody ground only |
| DEL.6 | partial | C18 (OD23 declaration) | name an actor answerable for the instance's acts in each jurisdiction; no outward act while none is named |
| DEL.7 | none | — | provide for the instance's own departure from the core, by its most demanding gate, with notice and a free exit |
| DEL.8 | partial | C7, A1 | admission and appointment are matters with recorded reasons, judged alike; revocation only under a rule, never of a class |
| LEX.1 | partial | C9 (D1 trigger) | a derived consequence not applied, with no recorded reasoned act closing it, is a finding |
| LEX.2 | partial | C11, C12, C14 | C14's resolution of an undecided conflict is entered as a judgement, and the consequence is derived from it |
| LEX.3 | **contradicts** | C12, C14, H2, D21 | C12's provenance names "the rule set" with no per-act version, and no program file has a rule-version or `in_force` predicate, so replay uses the current rules. Edit: bind provenance to the rules in force at each judged act's intake, and apply a milder rule adopted before the verdict |
| LEX.4 | **contradicts** | H2, S2, P3 | P3's pause stops every party's acts of power because of one actor's departure, with no notice or hearing; `vocabulary.tsv` classes `paused` and `blocked_by_pause` as consequences. Edit: recast the pause as a condition of the admissibility relation that reads no actor and applies alike to every party |
| LEX.5 | partial | C14, C18, H1 | every actor a rule can bind can comply whatever the others do |
| LEX.6 | covered | D10, D11 | — |
| LEX.7 | none | — | alike acts attested differently are a finding |
| LEX.8 | partial | C12 (fold version in provenance) | the fold and the admissibility relation change only through the governed channel |
| IMP.1 | covered | C1 | — |
| IMP.2 | covered | C13 | — |
| IMP.3 | **contradicts** | D1, C13, P1, P2, A2, P3 | D1's second sentence lets consequence tables differ by kind of party, while IMP.3 lets an attribute shape safeguards only. Edit: "safeguards in consequences may differ by kind"; and restrict C13 to safeguards. P1 eligibility, P2's reviewer, A2's anonymisation and P3's admission already conform |
| IMP.4 | covered | D8, D9, A1 | — |
| IMP.5 | covered | A2, C17, C21, H3 | — |
| VOX.1 | partial | A1, D13 | deliver a change that adds a duty a declared interval before it binds |
| VOX.2 | covered | A1 | — |
| VOX.3 | covered | A2, H1 | — |
| VOX.4 | covered | A2, P2 | — |
| VOX.5 | partial | S1, H1, P3 | a general clause |
| VOX.6 | none | — | any affected actor files and is answered |
| VOX.7 | partial | A2 | undo or remedy an interim measure's effects when the finding fails |
| COR.1 | **contradicts** | A2, C15, A3, C18, P1 | A2's last sentence and C15 require the consent of every party a protection covers to narrow it, so a single affected party, below capture, blocks the change for good: an undefined lock with no collective override. Edit: replace "the consent of the parties it affects" (A2) and "the consent of the parties it protects" (C15) with a defined protection — what it protects and for whom — and declared clauses under which the collective overrides it, such as a collective vote (ADR-ETH-03 K9). Also open: A3's adversarial check for rules, and the Custodian's replacement (OD4) |
| COR.2 | partial | P1, D9 | decide what replaces a Custodian (OD4) and check the replacement graph is acyclic |
| COR.3 | **contradicts** | A2, P2, A3, H1, C14 | A2 and P2 keep a verdict provisional with no ceiling where no eligible reviewer exists, while its subject stays recused. Edit: a ceiling at which such a verdict lapses in the subject's favour, as the revised C14 already provides, except where the subject's own grants made every reviewer implicated, when a reviewer is provided from outside every implicated chain; and a bound on each matter's total delay |
| COR.3 | **contradicts** | P3 (the kept record's findings and their forum) | Findings kept open on an ended instance's record, those naming the founder from the genesis regime included, are decided by the forum only on request, with no ceiling when none is made. Edit: a ceiling from the end at which a kept finding not requested closes as ended without verdict; or a statement that the floors stop at an instance's end, naming those that survive (MEM.1, MEM.3, VOX.2, VOX.3) |
| COR.4 | partial | A2, C22, H1 | re-examination against a subject after a favourable verdict only on new recorded evidence, a finite number of times |
| GEN.2 | **contradicts** | H3, P1 | H3 lets an act not ratified within its window stand, consequences included, while GEN.2 lapses its consequences on every actor but the founder and those who accepted it. Edit: H3's unratified act stands as to the founder and its acceptors only; an act of general application, a rule or a grant, stands, and only its consequences on actors that did not accept it lapse, so H3's rejection of lapse unless ratified (F5) is not reopened. Also missing: delivery of the regime's declaration to every subject, and a bar on lengthening its duration except by parties not implicated |
| GEN.3 | none | — | none needed if the eight record edits land before ratification, so that the deployment conforms when it first names the core; otherwise declare every violation and a ceiling, delivered to every subject |

| Status | Count |
|---|---|
| covered | 9 |
| partial | 19 |
| none | 4 |
| contradicts | 7 |

Seven floors are contradicted, by eight clauses of the instance: COR.3 by two. Each contradiction is closed by the founder's edit to the records named in its row; this record makes none of them.

Three readings formerly taken as contradictions are resolved by the core's own statements, not by an instance edit:
- A2's anonymisation is compatible with MEM.1 once append-only is stated over skeletons and the anonymising act is itself appended.
- A2's immediate recusal is compatible with VOX.4 once recusal on the matter is defined not to be a consequence, which is A2's own wording.
- A2's interim measures are compatible with VOX.4 through VOX.7, short of the remedy.

## 4. Machine-checkable statements

How each floor could be tested against an instance in the style of the consolidated text's checker (`constitution/tools/check.py`: `fragment`, `symmetry`, `kinds`, `binding`, `fixtures`, `parameters`, and the configuration check `c18.py`). The kinds of check:
- *static*: over the rules;
- *fixture*: over asserted fact sets, with a mutant that must change the outcome;
- *bounded*: enumeration or a game up to the declared roster cap;
- *procedural*: a party's read of evidence outside the program.

A check marked **proxy** is weaker than its floor, and the row says where.

| Floor | Kind | Check | Proxy? |
|---|---|---|---|
| $\Delta$ | bounded | each **[Γ]** check below returns its set of witnesses (the floor and the failing rule, matter or position); a change is admitted only if the new set is contained in the current one | — |
| MEM.1, MEM.3 | procedural | every witnessed head extends its predecessor by a prefix proof over skeletons; a pair without one derives `fork` | — |
| MEM.2 | static + procedural | every intake predicate carries an author argument, bound to a signature (S1); every intake predicate is read by some rule or listed with a declared purpose; the observed/judged gap is published | — |
| MEM.4 | static | no derivation of a finding reads `renounce` under negation | — |
| MEM.5 | procedural | every resolution of an identifier to a subject in a shared view is an entry visible to the subject | — |
| DEL.1 | fixture | `reach(P)` over live edges from the root; `exercised_without_chain(A)` empty | — |
| DEL.2 | static + bounded | no grant rule's head is a position; winning sets are counted after merging positions held in one chain below the root | — |
| DEL.3 | fixture | `duty_before_accept(X, D)` empty for every actor; a duty added by change binds only after `delivered` and the declared interval | — |
| DEL.4 | static + fixture | no rule blocks `renounce` or reads it in a burden; a renunciation fixture derives `export` for the leaver's record and state | — |
| DEL.5 | static | every consequence rule on a grantor binds it through `undeclared_grant`, `out_of_scope_grant`, `custody`, or `knew` with `failed_to_act` | — |
| DEL.6 | fixture | `answerable(J, A)` holds for every declared jurisdiction at every fixture state; with none, every outward act derives `inadmissible` | — |
| DEL.8 | fixture | every admission or appointment by a grantor has a `reasons` entry and a delivered decision; a revocation without a rule, or reading any attribute, kind included, derives `unruled_revocation` | **proxy**: a purge done one revocation at a time shows only in the pattern, which a vital sign measures |
| DEL.7 | procedural | a re-founding decision carries delivery to every subject and the declared renunciation window | — |
| LEX.1 | fixture | `applied(Q)` without `consequence(Q)` derives `unruled`; `consequence(Q)` past its time without `applied(Q)` or a closing act derives `unapplied`; both empty | — |
| LEX.2 | static | the fragment gives one model per fact set; no attestation predicate is the head of a breach, finding or consequence rule | — |
| LEX.3 | fixture (metamorphic) | inserting a rule admitted after an act changes no finding about that act, unless the inserted rule is milder for the subject | — |
| LEX.4 | static | every consequence rule binds its subject variable through an act of that subject, or through DEL.5's predicates | — |
| LEX.5 | bounded | a game up to the cap: for each party, a strategy of its own acts that avoids a derived breach for later acts against every schedule of the others | — |
| LEX.6 | static | every observation predicate is produced by a rule or a declared collector; no rule reaches outside the perimeter predicate | — |
| LEX.7 | fixture | two attestations over renamed-equal act descriptions with different judgements derive `unlike` | **proxy**: only for act descriptions the vocabulary makes comparable |
| LEX.8 | procedural | the fold version and admissibility relation in each provenance are ones a recorded change admitted | — |
| IMP.1 | static + fixture | no party constant in any rule of $D$, $C$ or $A$; party terms compared only by `!=`; permutation fixtures give permuted models and permuted admissibility | — |
| IMP.2 | static | no derivation rule reads an attribute-bearing predicate | — |
| IMP.3 | static + fixture | every consequence head that reads an attribute belongs to the closed safeguard class; gate, eligibility and admissibility rules on each fixture and its attribute-swapped image give equal models up to the swap; admission rules read no attribute but kind | — |
| IMP.4 | static | position-holding appears in no derivation under negation | — |
| IMP.5 | fixture | `implicated(P, M)` with `decides(P, M)` derives `own_cause`; the deciding set is read at filing, before filer-asserted names | — |
| VOX.1–4 | fixture | `binds(Q, X)` without `delivered`, `window_passed` and `reviewed` with `answer_read` derives `bound_unheard`; mutants drop each fact | — |
| VOX.5 | static | voice-act predicates reach no burden-class head at any polarity | — |
| VOX.6 | fixture | a filing by a non-subject derives `owed_answer` with a ceiling; `unanswered_past_ceiling` empty | — |
| VOX.7 | fixture | an unconfirmed interim consequence past its ceiling derives `lapsed`; a failed finding derives `remedy_owed` for each interim effect | — |
| COR.1 | bounded | for each rule and each group below capture up to the cap, the published closure procedure changes the rule without the group's acts (A3's form); every rule tagged as a lock carries a definition and names an override clause, and the override clause meets COR.1 itself | **proxy** beyond the cap |
| COR.2 | bounded | the replacement-dependency graph is acyclic, and every position has a replacement path free of its holder's acts | **proxy** beyond the cap |
| COR.3 | static + fixture + bounded | every predicate of the `lever` vocabulary class is bounded by a parameter, and so is each matter's total delay; a provisional status past its ceiling derives `decided` or `lapsed`; for every matter whose deciders are all implicated, a decider outside every implicated chain exists up to the cap | — |
| COR.4 | procedural + fixture | the published closure result of A3; `reopen_against(V)` without new evidence or beyond the count derives `jeopardy` | — |
| GEN.3 | procedural | a deployment naming a core version while any check fails publishes its witness set and ceiling to every subject; any lengthening of the ceiling carries assents only from parties not implicated in the violations; past the ceiling the version is no longer named, after DEL.7's notice and exit window | — |
| GEN.2 | procedural | the regime's declaration, ceiling, ending event and re-decision window are in the founding document and the record | — |

## 5. Open questions

The open decisions are ADR-ETH-03's, OD24–OD31, and the undecided sub-point under OD32. Two concern this file rather than the decision.
1. **Coverage is by inspection.** A machine cross-check of each pathology's *Violation* against the clauses it lists would turn coverage into a test.
2. **The counter-models are prose.** Each could be written as a fixture set with the checks of §4 run on it, so that "satisfies the other five" is checked rather than argued.
