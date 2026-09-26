---
kind: adr
space: eth
adrId: ADR-ETH-02
provisionalNumber: false
title: First amendment to the L0 constitution — party and subject, record integrity, the working state of the correctness claim, and corrections to ADR-ETH-01
status: Proposed
date: '2026-09-26'
project: meta-ethics
supersedes: ['ADR-ETH-01 D4', 'ADR-ETH-01 D8', 'ADR-ETH-01 D9', 'ADR-ETH-01 D12', 'ADR-ETH-01 D14', 'ADR-ETH-01 OD16 (closed half)', 'ADR-ETH-01 OD19']
supersededBy: []
labels: [constitution, L0, amendment, party, record, erasure, correctability, lawful obstruction]
---

# ADR-ETH-02 — First amendment to the L0 constitution

**Status: Proposed 2026-09-26.** Awaiting ratification by the founder, who at genesis holds every seat. Ratification is recorded as C5 below states; this record does not repeat ADR-ETH-01's claim that a merge commit is the signature.

ADR-ETH-01 is ratified and its body is frozen. This record amends it decision by decision. Where it replaces a decision, ADR-ETH-01's front matter names this record in `supersededBy`; where it corrects a statement, the correction is here and the original text stays as it was. Read the two together: a decision of ADR-ETH-01 not named below stands unchanged.

> Claim tags as in ADR-ETH-01: **[evidence]** · **[hypothesis]** · **[open]** · **[proposed]** · **[pending]**.

## Context

The forces F1–F9 of ADR-ETH-01 apply unchanged, except F3, which C6 sharpens. Three questions ADR-ETH-01 left open or answered inconsistently are settled here: who is a party (D8 against D12), what the record must conserve when a human party asserts erasure (D14 against OD19), and against what state the correctness claim is checked (the formal-frame accepted cost). The rest are corrections of statements that were wrong or unobservable as written.

## I. The recurring template

**T — Floor and parameter.** Where instances may legitimately differ on an axis, L0 fixes an invariant floor that no instance may lower, and each instance's founding document — its genesis manifest — sets an explicit parameter above it. The floor changes only by L0 amendment; the parameter is L1 and moves through the governed evolution channel. A1 and A2 use this shape and do not re-argue it; later decisions should do the same. *Rejected:* one rule fixed for every instance — loses to F7, because the parent then decides for sovereign instances what their parties can decide for themselves. *Rejected:* leaving the axis wholly to instances — loses to F1, because an instance can then set the axis to nothing, the hollowing D7 forbids. *Reopens if:* a finding the floor exists to prevent is derived in an instance whose parameters are in range.

## II. Amendments

**A1 — Party and subject. Replaces D8's party definition and D12's entry rule.** A **party** holds a mandate whose chain of delegation reaches the founding document. Giving someone real access without declaring a mandate creates one anyway, and whoever gave the access answers for its undefined scope. A **subject** is anyone whose act has an effect inside the system; every party is a subject. All subjects are bound and judged by the same rules. Only parties hold seats, standing to propose and vote, and the inform channel. Every subject sees, and may answer, every finding made about them; no instance may narrow this. How far anyone may browse findings about others is set by each instance's founding document. Leaving ends party status, never being judged.
*Procedural note:* the floor is self-sight and the right to answer; the parameter is the reach of browsing beyond oneself (T). D8's closure now reads: no actor is outside judgement. D11 stands: a cause that is not an act attributable to an entity is a boundary flux, recorded and attributed, not judged.
*Rejected:* party means mandate-holder only, everyone else an unjudged outside cause — loses to F1 and F5, because avoiding or dropping a mandate then escapes every duty. *Rejected:* anyone with an effect is a party — loses to F1 and F4, because touching the system becomes self-registration, and duties reach everyone.
*Reopens if:* an act inside the system is attributed to no one, a headcount gates power, or a subject is denied sight of a finding about them.

**A2 — Integrity, not permanence. Replaces D14; closes OD19.** No entry in the record is altered or removed except by a new entry that is appended, attributed and witnessed; an erasure is such an entry. Permanence scales with power held, never with the kind of party. An act done in a seat, as a delegator, or as a change of rules is kept and attributed for good. A finding about a party subject to that power is kept in existence, but its attribution to a human may be severed, and it may be cited against its subject's eligibility or standing only for a declared period. The subject may append a reply at any time, and every read shows it. An in-scope act done under a mandate is attributed to its delegation chain, not to the executor alone. A consequence-bearing verdict about a human is provisional until a contest window with human review has passed. The record names parties by keyed identifiers; severing destroys the key, so it changes no hash and no replay. Every read of a finding about a human is logged and visible to its subject. Widening what may be severed is an ordinary change; narrowing it needs an L0 signature and the consent of the parties it affects.
*Procedural note:* the floor is integrity, permanence of acts of power, the reply, delegation-chain attribution and the contest window. The parameters (T) are the line between personal data and the record, the length of the contest window, and the period of use, which may not exceed what the most protective law applicable to the party's actual relationship to the instance allows. Severing and the contest window apply to humans only; this is the one asymmetry F9 forces, and it touches attribution and consequence, never derivation, so D1 stands.
*Rejected:* nothing is ever erased, D14 as ratified — loses to F9, and buys nothing integrity does not already give. *Rejected:* erasure that leaves no trace, or a flat split between a personal and a public layer — loses to F1, because exit becomes rewriting and the powerful choose what the record forgets. *Rejected:* permanence by kind of party — loses to F2. *Rejected:* a party waives erasure by consent at entry — loses to F1, because consent bundled with a mandate is extracted by the stronger party.
*Reopens if:* an entry changes with no appended act recording the change, a finding past its period is cited against its subject, or a consequence about a human takes effect before its contest window closes.

**A3 — The working state the correctness claim is checked against. Replaces the accepted cost "the formal frame is exact for finite systems" and the property AG EF correct.** The correctness claim is checked against a small working state derived from the permanent record, never against the record itself. That state holds open findings, each closed only by a witnessed act that names it, plus counts and timers capped at fixed ceilings. No rule that decides what may happen next reads the permanent record except through this state. The requirement: for any group too small to capture the decision gate, and for every open finding, the other parties have a way to close that finding whatever the group does. It is proved by a measure that strictly decreases toward closure. Checking it by machine requires the number of parties, the size of rules, and every ceiling to be fixed at L0.
*Procedural note:* the claim is stated over open and closed findings, so it needs no `correct` predicate; ADR-ETH-01 never defined one.
*Rejected:* AG EF correct over the configuration space — loses to F1, because a correcting path that needs the capturing group's cooperation satisfies it. *Rejected:* keep the latest verdict per rule as the working state — loses to F1, because a compliant act after an uncorrected violation hides the violation from the check.
*Accepted cost:* that requirement enlarges L0, against D18's aim of keeping it small.
*Reopens if:* an unresolved violation is shown to fall outside the working state.

## Known hazards

**H1 — Lawful obstruction is a known hazard, left to instances.** A party can slow or stall decisions without breaking any rule: by flooding proposals or findings, using every lever to its limit, withholding answers, timing filings, or making others ineligible. A3 is not violated by delay alone, so the parent does not detect it. Each instance's founding document declares its own defence. No defence may narrow a floor this constitution fixes, including a subject's sight of and answer to every finding about them. Judging two things the same is an act: attributed, reasoned, visible to everyone it affects, and contestable once. It never binds anyone who was not heard in the matched matter, and never suppresses or delays a subject's answer to a finding about them. A defence that reads the meaning of a filing is itself a lever: it can be flooded, stalled, and optimised against by anyone who can query its judge.
*Rejected:* one anti-obstruction rule for every instance — loses to F7, because each defence trades speed against the protection of dissent, and that balance is the instance's to strike. *Rejected:* silence on the hazard — loses to F1, because an instance that never names it leaves the clock to whoever holds power.
*Reopens if:* the same obstruction pattern defeats the declared defences of more than one instance.

## III. Corrections to ADR-ETH-01

**C1 — D4: symmetry is tested, not proved. Replaces D4's claim.** Determinism is provable: a stratified program has one model per fact set (C6). Identity-blindness of a rule is a syntactic check. Permutation symmetry of verdicts is established by the fairness fixtures, which test it; they do not prove it, because a rule may compare party identifiers by order (`lt`) or name a party by constant. D4 is restated: provable — determinism, identity-blindness; tested — permutation symmetry; auditable — evidence, ontology, authors. It becomes provable if L0 forbids party constants in rules and admits only `neq` between party variables, since a program with neither commutes with every renaming of parties; that restriction is not adopted here (OD20).
*Rejected:* keeping "provable" — loses to F6's honesty requirement, because the claim would be false. *Rejected:* claiming none — loses to F2, because these properties are the guarantee that humans and agents are judged alike, and under-claiming discards it.
*Reopens if:* a fairness fixture fails on a conforming kernel, or OD20 is decided.

**C2 — D18: an L0 change is not a revolution.** D18 defines a revolution as a change the current rules forbid, then calls every L0 change one, but a human-signed L0 amendment is a step the rules admit. Corrected: L0 changes are admissible and human-gated; a revolution is a change no admissible step, signed or not, can make, and A3's measure is infinite exactly there. D18's aim stands with both costs named: every L0 clause costs a human gate (F5), and every clause beyond any admissible step costs a rupture. Minimise both.
*Reopens if:* D18's trigger as ratified.

**C3 — D6: the trigger fired on D7 working as designed.** Under D7 an instance's findings are a superset of the parent's, so divergence alone is expected. *Reopens if:* a conforming instance, on the same facts, fails to derive a finding the parent derives.

**C4 — ADR-ETH-01's "written at the time of decision, not reconstructed."** This held for D8–D21. D1–D7 were decided on 2026-09-18 as conclusions only; their alternatives, losing forces and triggers were written on 2026-09-21, three days later, as ADR-ETH-01 itself says in its preamble to the decisions. They are reconstructed, and are to be read as such.

**C5 — The signature mechanism.** Pull requests here merge by rebase, which leaves no merge commit, so "the merge commit is the signature" is false. Corrected: ratification is the merge event of the pull request carrying the record, together with the commit that event lands on the main line. Under A2 that commit's hash is appended to the record, whose chain head is witnessed outside the repository, so the signature does not depend on how the history was merged.

**C6 — F3: aggregation is stratified too.** F3 is restated: every clause is stratified Datalog in which negation and `count` are both stratified, every rule is range-restricted, and arithmetic appears only in non-recursive strata or as input facts. Any other clause is procedural, with its human enforcement named. *Reason:* under these conditions each fact set has exactly one model, so every replay of a verdict derives the same verdict, which D4's determinism and D9's replay depend on. Rules are written in stratified Datalog, a decidable fragment of first-order logic, because full first-order validity is undecidable (Church 1936; Turing 1936) and only semi-decidable (Gödel 1930). Each verdict is decidable. Questions about the rules themselves are not, so admissibility is checked syntactically, and meaning enters only as attested facts (C11).

**C7 — D12: issuance is governed and scopes nest.** Restored from the brainstorm record, dropped when D12 was ratified: every change to the set of parties is a proposal under the governed evolution channel. Added: a delegated scope lies within its delegator's own. The founder is the root of every chain by signing the genesis manifest, so D12's trigger does not fire at genesis.
*Rejected:* issuance with no review — loses to F1, because Sybil risk is then relocated from entry to whoever issues mandates. *Rejected:* every mandate ratified by a human — loses to F5.
*Reopens if:* the record shows a party whose chain does not reach the founding document, or a delegated scope wider than its delegator's.

**C8 — Losing forces the rejections lacked.**
- D3, *no purpose at all* — loses to F3: without a declared purpose, `benefits(A, P)` and eligibility cannot be derived, so the clause cannot be checked.
- D4, *claim none* — loses to F2; see C1.
- D11, *two perimeters* — loses to F1: the gap between jurisdiction and observation is where evidence-capture attacks live, and merging the two hides it.
- D19, *monitoring only in the lab* — loses to F5: a pathology found in retrospect is found after its correction may have become forbidden.
- D21, *identity in the rules alone* — loses to F8: a verdict must be replayable against the version that governed it, and identity in rules alone names no such version.

**C9 — Triggers that can be observed.**
- D1 — *Reopens if:* a consequence a rule derives is not applied, or is applied differently to a party of another kind on the same derivation, with no appended act recording why.
- D2 — *Reopens if:* over the last fifty decided proposals, the last word is exercised in more than a fraction the founding document declares. The fraction may not exceed one in ten.
- D3 — *Reopens if:* a procedurally valid mandate is revoked, or a rule changed to block it, by an act that cites its purpose rather than any finding.
- D5 — *Reopens if:* for any clause, the recorded findings that an act reached the clause's outcome without passing its check exceed the recorded passes, over a window the founding document declares.

**C10 — OD16 is split.** Closed: the canonical metric on configuration space is the admissible distance to closure — the measure A3 uses, infinite exactly on the revolutionary surface. Open: which intrinsic properties serve as early-warning coordinates, and with what weight; this stays with the lab (D20) and remains OD15's declared choice of authors' values.

**C11 — D9: replay re-derives, it does not re-judge.** Some input facts are attested acts: a witness's observation, a human's review, a judgement of meaning. Replay derives every verdict from the recorded facts, these included, and never re-runs the acts that produced them. Such a fact is re-examinable, not re-derivable. The record keeps what its author saw and why, and a contest replaces it only by an appended act. Determinism holds over the record, and the correctness of attested facts is auditable, not provable (D4).
*Rejected:* calling attested facts replayable — loses to F6, because the claim would be false. *Rejected:* admitting no attested facts — loses to F3, because delivery and review cannot be derived from agent-writable facts alone (D15).
*Reopens if:* a verdict depends on a fact whose producing act the record does not attribute.

## Consequences

Judgement is universal and enfranchisement is earned: anyone who acts is judged, and only a mandate confers a voice. Exit and proxy use stop being escapes, and touching the system confers no entitlement. The record keeps its integrity without keeping everything forever: acts of power stay attributed, while findings about those subject to power fade in use, can lose their name, and always carry the subject's answer. The correctness claim now holds against an adversary, not only in the absence of one, and a violation cannot be hidden by a later compliant act. ADR-ETH-01's claims are narrowed to what it can deliver: symmetry is tested, L0 is a gate and not a revolution, and ratification has a signature that exists. Lawful obstruction is named as a hazard the parent does not detect, and each instance declares its own defence (H1).

What becomes easy: a human party's legal erasure without breaking replay; replaying any verdict with severed names; checking correctability without reading an unbounded log. What becomes hard: acting on the system through someone else's unmandated hands; rewriting any entry without leaving the rewrite in the record; closing a finding by any route but a witnessed act that names it.

## Accepted costs

**Severing lowers accountability for the subject of a finding, by design.** A severed finding about a human still exists and still counts in its period, but it no longer names them. The accountability that must never fade is carried by acts of power, which are never severed.

**A contest window delays consequences for humans.** Under F5 this is a human gate on every consequence-bearing verdict about a human. It is accepted because F9 requires human review of such verdicts; the vital signs will show when the window is the bottleneck.

**L0 grows.** A3 fixes party count, rule size and every ceiling at L0, and C7 adds scope nesting. Both enlarge the surface that changes only by signature, against D18.

**One asymmetry by kind of party is now designed, not deferred.** A2 severs attribution and holds consequences for humans only. It is confined to attribution and consequence; derivations stay symmetric.

## Safety envelope

Unchanged from ADR-ETH-01. This record changes what may be written in the constitution and no running system. No clause it adds lets an instance lower a floor, and every clause it adds satisfies F3 as restated by C6 or is marked procedural.

## Open decisions

**OD16** — closed half settled by C10; the early-warning half remains open. **OD19** — closed by A2. One added by this record: **OD20**, whether L0 forbids party constants in rules and restricts comparison of party variables to `neq`, making permutation symmetry provable rather than tested (C1). The ledger of ADR-ETH-01 otherwise stands.

## Decision ledger

```
ID   STATUS    DECISION                                      ALTERNATIVES REJECTED (why)                                  ACCEPTED COST                           REOPENING TRIGGER
T    proposed  invariant floor at L0 + instance parameter    one rule for every instance (F7)                             floors change only by L0 amendment      in-range parameters yield a floored finding
                                                             axis left to instances (F1 — hollowing)
A1   proposed  party holds a mandate; every actor judged     mandate-holders only (F1,F5 — exit escapes)                  subjects judged without a voice         act attributed to no one; headcount gates
     (D8,D12)                                                anyone with an effect is a party (F1,F4 — self-registration) power; subject denied sight of finding
A2   proposed  integrity, not permanence; scaled by power    never erase (F9)                                             severed findings lose their name;       entry changed without appended act; spent
     (D14,OD19)                                              traceless erasure / flat split (F1 — rewriting)              contest window delays consequences      finding cited; consequence before window
                                                             permanence by kind (F2); consent waiver (F1)
A3   proposed  claim checked over bounded working state      AG EF correct (F1 — capturer's path)                         L0 grows by the bounds                  violation outside the working state
     (formal frame)                                          latest verdict per rule (F1 — masking)
C1   proposed  symmetry tested, not proved                   keep "provable" (F6 — false)                                 symmetry stays a test                   fixture fails; OD20 decided
     (D4)                                                    claim none (F2)
C2   proposed  L0 change is admissible, not revolution       —  (correction of definition)                                —                                       as D18
C3   proposed  D6 trigger respects D7                        —  (correction of trigger)                                   —                                       instance misses a parent finding
C4   proposed  D1–D7 arguments were reconstructed           —  (correction of fact)                                      —                                       —
C5   proposed  signature = merge event + landing commit     —  (correction of fact)                                      external witness required               —
C6   proposed  F3: stratified aggregation, safe rules        —  (sharpening of a force)                                   fewer expressible clauses               —
C7   proposed  mandate issuance governed; scopes nest        no review (F1 — Sybil relocated)                             issuance passes the channel             chain not reaching founding document;
     (D12)                                                   every mandate human-ratified (F5)                                                                    scope wider than delegator's
C8   proposed  losing forces named (D3,D4,D11,D19,D21)       —                                                            —                                       —
C9   proposed  observable triggers (D1,D2,D3,D5)             —                                                            —                                       as restated
C10  proposed  OD16 split: metric closed, coordinates open   —                                                            —                                       —
C11  proposed  replay re-derives, never re-judges            attested facts replayable (F6 — false)                       attested facts auditable, not provable  verdict on an unattributed attested fact
     (D9)                                                    no attested facts (F3 — D15)
H1   proposed  lawful obstruction named; defence per instance one anti-obstruction rule (F7 — instance's balance)          parent does not detect delay alone      same pattern defeats defences of more
                                                             silence on the hazard (F1 — clock to power)                                                          than one instance

INTEGRITY   amendments without a rejected alternative: 0   ·   without a reopening trigger: 0
            ADR-ETH-01 body lines edited: 0 · ADR-ETH-01 front-matter lines edited: supersededBy only
```

## Provenance

Amends ADR-ETH-01 (`docs/adr/ADR-ETH-01-constitution-shape.md`, ratified). C7's restored sentence is from the brainstorm record `docs/BRAINSTORM-2026-09-21-mathematics-of-ethics-and-revolution.md`, under D12. A1–A3 record the founder's rulings. References for C6: Church 1936; Turing 1936; Gödel 1930. The backlog is tracked outside this repository.
