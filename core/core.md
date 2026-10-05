# The core — L0

**Status: Proposed with ADR-ETH-03, 2026-10-05.** This file states the core, the level zero shared by every instance, as a property of a minimal transition-system model, and records the three tests the core was put through: coverage of the pathologies in `core/pathologies.md`, minimality, and sufficiency against the meta-agentic instance. ADR-ETH-03 records the decision; this file records what the decision rests on. The drafting rule is the record's: the core fixes outcomes and floors, never mechanisms. Where a clause below names how something is done, that is an error in the clause.

> Claim tags as in ADR-ETH-01: **[evidence]** · **[hypothesis]** · **[open]** · **[proposed]** · **[pending]**. Every result in this file is **[proposed]** and established by inspection, not machine-proved, unless it says otherwise.

## 1. The model

The model is the smallest structure over which every principle below can be stated. Each instance refines it; none may remove a component.

**Actors and attributes.** A set $\mathcal{A}$ of actors: anything that can act. Each actor may carry attributes it did not choose, such as its kind (human, non-human), declared by the instance. An attribute is not an identity, and an actor's acts are not attributes.

**Acts.** An act is $a = \langle \mathit{type}, \mathit{author}, \mathit{args}, t \rangle$. Every instance has at least these types: grant, accept, renounce and revoke of a mandate; propose and assent to a change; file a finding; answer; attest a fact; read the record about a subject. An instance adds others.

**The record.** A finite sequence $R = e_1 \cdots e_n$ of entries, each an act with its author, linked to the entry before it. Runs extend it: $R \sqsubseteq R'$ is the prefix order. The genesis entry $e_0$ is the signing of the founding document, written $\rho$.

**State is a fold.** $\sigma(R) = \mathit{fold}_\varphi(R)$ under a versioned fold $\varphi$. Every component below is a component of $\sigma(R)$; nothing that decides what may happen next lives outside it.

**The mandate graph.** $M = (N, E)$ with $N = \{\rho\} \cup \mathcal{A}$ and edges $g \xrightarrow{s} h$ carrying a scope $s$, a set of capabilities, and a status: granted, accepted, renounced, revoked. An actor is a **party** iff a path of granted and accepted, live edges leads from $\rho$ to it. The root $\rho$ is a document, not a party. An actor whose act has an effect inside the perimeter is a **subject**; every party is a subject.

**Rules.** $\Gamma = (D_\Gamma, C_\Gamma, W_\Gamma, \Pi_\Gamma)$, itself a component of the state, each rule carrying the index from which it is in force. $D_\Gamma$ are derivation rules: they decide what holds (findings, breaches, eligibility). $C_\Gamma$ are consequence rules: they decide what follows (sanctions, protections, duties, access). $W_\Gamma$ is the gate: for each rule or position $r$, a family $W_\Gamma(r)$ of winning sets of **positions** whose holders' assent admits a change to $r$. $\Pi_\Gamma$ is the declared perimeter, the jurisdiction.

**Verdicts.** $V_\Gamma(\sigma) = (F, Q)$ with $F = D_\Gamma(\sigma)$ the findings and $Q = C_\Gamma(\sigma, F)$ the consequences. A consequence $q$ **binds** a subject $x$ when it changes $x$'s access, capacity, eligibility, standing or duties. Some inputs are attested facts: acts of judgement or observation entered by their author.

**Change.** $\Delta$ admits a change $\Gamma \to \Gamma'$ to $r$ at index $i$ iff the holders of some $w \in W_\Gamma(r)$ assented in $R$ before $i$. A change is an act like any other.

**Positions.** $\mathit{Pos}(\sigma)$, the seats or offices the rules define, each with a holder. Power in the gate is counted per position.

**Implication and capture.** $\mathit{impl}(x, m)$ holds when party $x$ is named in matter $m$, benefits from its outcome, or has acted in it; an instance may add grounds, never remove these. A group $G$ **captures** the gate when the positions it holds contain a winning set for some change; $G$ is **below capture** otherwise.

**Admissibility and runs.** $R \to R \cdot e$ when $e$ is admissible in $\sigma(R)$ under $\Gamma$. A run is a sequence of such steps from $\langle e_0 \rangle$. A state is reachable if some run reaches it.

The model says nothing about the logic rules are written in, the carrier of a signature, the witness service, the draw, the number of seats or the length of a window. Those are mechanisms or values, and live in instances.

## 2. The six principles

Each principle has a one-line statement, its clauses as properties of the model, and what it leaves to instances.

**Identifiers.** The principle identifiers `MEM`, `DEL`, `LEX`, `IMP`, `VOX`, `COR` and `GEN`, and the clause identifiers formed from them (`MEM.1`, `DEL.4`, …), are stable: a clause keeps its identifier for good, a retired identifier is never reused, and a new clause takes the next free number under its principle. Each clause is one list item whose first bold token is its identifier, so that an instance's inventory can name the core clause each of its paragraphs sits under, and a checker can resolve the name (`core/relevel.md` §5).

### MEM — Memory

*What happened is written once, attributed, and never silently changed.*

- **MEM.1 Append-only.** Along every run, $R_t \sqsubseteq R_{t+1}$. A correction, an erasure or an anonymisation is a new entry, attributed like any other.
- **MEM.2 Attribution.** Every entry names its author, and every act inside the perimeter is entered. Completeness is relative to what is observed; the gap between what is judged and what is observed is declared and measured, never assumed zero.
- **MEM.3 Independent verification.** Every party can check MEM.1 and MEM.2 without the cooperation of any single party, so no single party, operator and founder included, can rewrite the record undetected.
- **MEM.4 Conservation.** Leaving removes no entry, and no entry's existence depends on who made it.
- **MEM.5 Reading is an act.** A read of the record about a subject is itself an entry. Memory is therefore reciprocal: whoever reads about a subject is in that subject's record.

*Left to instances:* what may be anonymised and when, how long a finding may be used, which witness, which carrier.

### DEL — Delegation

*Every power is granted, every duty accepted, every mandate renounceable, and all of them trace to one root.*

- **DEL.1 Rooted power.** Every act that exercises a capability is by a party holding that capability, at the act's time, through a chain of accepted mandates from $\rho$. An act outside every chain is valid for nothing and is attributed to whoever's access it used.
- **DEL.2 No amplification.** A mandate's scope lies within its grantor's, and positions are created only by $\Delta$, never by a grant. Delegation divides power and never multiplies it: splitting into many delegates adds no weight in any gate.
- **DEL.3 Accepted duty.** No duty binds a party before it was delivered a mandate's terms and accepted them. Anyone who acts inside is judged on those acts (IMP.4); that is judgement, not a duty.
- **DEL.4 Exit.** A party can renounce any mandate it holds, by its own act, at any time. Renouncing ends duties from then on and never the judgement of acts already done.
- **DEL.5 Attribution up the chain.** An act within a mandate's scope is attributed to the chain that granted it, not to the executor alone.

*Left to instances:* who may grant what, how issuance is reviewed, how identity is established, how a non-human party persists.

### LEX — Legality

*Every consequence is derived from acts by rules in force before them, the same way every time.*

- **LEX.1 No consequence without a rule.** Every consequence that takes effect is in $C_\Gamma(\sigma)$. No office imposes one by discretion.
- **LEX.2 Determinism and replay.** $V_\Gamma$ is a function of $(\Gamma, \sigma)$: any party recomputes every verdict from the record and obtains the same result. Attested facts enter as inputs: re-examinable, not re-derivable.
- **LEX.3 Non-retroactivity.** An act is judged by the rules in force when it was done, a matter by those in force at its filing. No change makes a past act a breach.
- **LEX.4 Acts, not persons, predictions or associations.** A consequence attaches to a subject's own acts or to acts in its chain (DEL.5), never to a predicted act, an inner state, or another's act outside its chain.
- **LEX.5 Possible compliance.** For every party and reachable state there is a course of its own acts, abstention included, under which no breach is derived against it. Two consequences that cannot both be applied are never both applied.
- **LEX.6 Declared jurisdiction.** Rules reach only the declared perimeter $\Pi_\Gamma$; widening it is a change under $\Delta$.

*Left to instances:* the logic and its fragment, the provenance format, the ordering among rules.

### IMP — Impartiality

*What is found does not depend on who you are, and no one decides their own case.*

- **IMP.1 Renaming invariance.** For every permutation $\pi$ of actors, $V_\Gamma(\pi\sigma) = \pi V_\Gamma(\sigma)$: rules name no actor and order none.
- **IMP.2 Attribute-blind findings.** $D_\Gamma$ is invariant under every bijection of actors, including one that changes their unchosen attributes. Attributes are read, if at all, by consequence rules only.
- **IMP.3 Attribute-symmetric power.** $W_\Gamma$ and eligibility for positions are invariant, up to a matching permutation of positions, under every permutation of attribute values: no class of parties is barred, by an attribute it did not choose, from a power that parties of another class can reach. A consequence that reads an attribute is admissible only as a declared protection of the class it favours.
- **IMP.4 Universality.** Every subject is judged by the same rules: none is outside judgement, the founder, the judge and the operator included.
- **IMP.5 No one in their own cause.** No party decides, votes, judges, reviews, attests or witnesses on a matter $m$ with $\mathit{impl}(x, m)$. The set entitled to decide a matter is fixed by rule at its filing, not by those interested in it.

*Left to instances:* how judges are chosen, the challenge procedure, which attributes exist and which protections they carry.

### VOX — Voice

*Whoever is bound is told, can see, can answer at no cost, and is heard before it binds.*

- **VOX.1 Notice.** Every finding about a subject, every consequence on it, and every change of rules that adds a duty to it is delivered to it, in a form it can read, before it binds it. With DEL.4 this gives every party the chance to leave before a new duty runs.
- **VOX.2 Sight.** A subject sees in full what the record holds about it, including who has read it (MEM.5).
- **VOX.3 Answer.** A subject can append an answer to anything about it, at any time; nothing suppresses it.
- **VOX.4 Hearing before binding.** A consequence binds only after a window, running from delivery, in which the subject could answer, and after a review that read the answer and records why it did or did not prevail. Who may review is IMP.5's.
- **VOX.5 Non-retaliation.** No consequence is derived from the exercise of voice: answering, dissenting, voting, challenging, reporting, refusing or renouncing.

*Left to instances:* window lengths, the reviewer's kind, interim measures and their ceilings, the reach of browsing beyond oneself.

### COR — Correctability

*Every rule, verdict and position can be corrected by admissible steps, and no one, the founder included, owns a fixed point.*

- **COR.1 Reachable change.** From every reachable state, every rule of the instance, its entrenched clauses included, can be changed along a finite admissible path. A correction that needs a forbidden step is a revolution; the core requires that none be needed.
- **COR.2 No owned fixed point.** For every party $x$ and every position $x$ holds, from every reachable state there is a finite admissible path, in which $x$ performs no act, that ends with $x$ not holding it. No party's assent is needed to replace, judge or overrule that party.
- **COR.3 Finite levers.** Every lever that delays a decision has a finite, declared ceiling, and every owed act occurs within one.
- **COR.4 Closable findings.** For every open finding and every group below capture, the other parties can close it whatever the group does; and every verdict is re-examinable by an admissible act.

*Left to instances:* the gate's shape and thresholds, who holds the last word, who signs a constitutional change.

### GEN — The genesis transient

*No rooted system meets the core at its first act; the core is claimed from the end of a founding regime held to its other clauses.*

- **GEN.1 Lemma.** In every rooted system, at $e_0$ the signer of $\rho$ holds every position: before any grant, no one else holds a capability (DEL.1). So COR.2 and IMP.5 fail for the signer at genesis, in every instance.
- **GEN.2 The founding regime.** The core is claimed from the end of a founding regime, and the regime is held to the core's other clauses: it is declared and every act under it is marked (MEM.2); it is a lever with a finite declared ceiling (COR.3); and every act of power made under it is decided again, at its end, by parties it did not implicate (IMP.5). An instance whose founding regime never ends never conforms.

*Left to instances:* how the regime ends; ADR-ETH-02 H3 is the meta-agentic instance's mechanism.

### 2.7 What the core is not

**Not substantive.** The core encodes who decides, on what record, with whom excluded, and how it is corrected; it says nothing about what is good (ADR-ETH-01 D3). It excludes pathologies of structure and does not exclude pathologies of purpose. `core/pathologies.md` marks which are which.

**Not a rule of any instance.** COR reaches every rule of an instance, and does not reach the core, because the core is the type of an instance, not a clause in one. An instance cannot amend it; it can leave the family. The core is not a fixed point owned by a party, since it binds only those who adopt it, and changes only by re-founding: a new version of the core, which each instance adopts or not by its own constitutional change (ADR-ETH-01 D6, as ADR-ETH-03 re-levels it).

**Not a score.** Instances are ordered by which principles they satisfy and which pathologies they exclude. The order is partial: two instances that satisfy the same principles are not ranked by the core, because what remains between them is their values (ADR-ETH-01 D16). The taxonomy of pathologies is the ex-post labelling D16 allows, each label defined as a violation of a property, never as a resemblance to a historical polity.

## 3. Tests

### 3.1 Coverage

`core/pathologies.md` lists 57 pathologies after merging synonyms, each with a definition and a violation statement over this model. Each is classed **structural** (its definition is a property of who decides, on what record, how), **mixed** (a structural part and a part that depends on evidence or content), or **beyond the core** (its definition is about what is decided, or about what no record can see). Result:

| Class | Count | Excluded by the core |
|---|---|---|
| Structural | 41 | every one, by at least one principle |
| Mixed | 9 | the structural part; the rest is bounded, measured or declared, and named |
| Beyond the core: substantive or epistemic | 7 | none; each is made visible, attributed, answerable and correctable, and named as outside |

Per principle, the pathologies whose violation it is (several per pathology where a composite):

| Principle | Pathologies (numbers in `core/pathologies.md`) |
|---|---|
| MEM | X01 revisionism, X02 unattributed power, X03 surveillance, X04 whitewashing, X05 exit as erasure, X07, X42 |
| DEL | X06 usurpation, X07 operator capture, X08 covert steering, X09 sybil capture, X10 proxy amplification, X11 clientelism, X12 bondage, X13 lock-in, X14 colonial binding, X16, X25, X45, X46 |
| LEX | X15 arbitrary rule, X16 anarchy, X17 retroactive law, X18 secret law, X19 impossible law, X20 pre-emptive punishment, X21 collective punishment, X22 show trial, X23 selective enforcement, X24 state of exception, X25 totalitarian reach, X26 Kafkaesque process, X27 mob rule |
| IMP | X28 personal law, X29 caste, X30 dynasty, X31 corruption, X32 judge in own cause, X33 self-promotion of optimisers, X34 base manipulation, X35 theocracy, X36 monoculture of judges, X22, X23 |
| VOX | X37 summary judgement, X38 silencing, X39 opacity, X40 tempo capture, X41 rubber-stamp review, X42 information control, X43 paternalism, X18, X26 |
| COR | X44 entrenchment, X45 oligarchy, X46 plutocracy, X47 gerontocracy, X48 junta, X49 paralysis, X50 revolution-only correction, X24, X26, X35 |

Composites from the founder's list (tyranny, fascism, injustice, unfairness, corruption, evil) are mapped to their components in `core/pathologies.md` §8.

### 3.2 Minimality

For each principle, a system that satisfies the other five and violates it. Each is described as a variation of the meta-agentic instance, so that the other five visibly hold.

- **Without MEM — the mutable ledger.** The record is a store the arbiter seat may overwrite in place, and every rule reads the store. At every moment the other five hold of the current history: verdicts are derived from it, replay agrees with it, rules are blind, findings in it were delivered, chains in it reach the root, every rule is changeable. Last month's finding can be rewritten and no property of the rewritten history detects it. *Why independent:* the other five are properties of a history; MEM is the only principle that relates two histories to each other. A second witness, for MEM.5 alone: reads are not entered; VOX.2 then holds vacuously, because the subject sees everything the record holds, which contains no reads.
- **Without DEL — open registration.** Anyone may register as a party, each party has one vote, and everything else is as in the instance. Every act is recorded, rules are blind, verdicts heard, rules changeable; one controller registers a thousand parties. The other principles quantify over parties and cannot see that the parties are not distinct. A second witness, for DEL.3 and DEL.4 alone: **conscription** — mandates imposed without acceptance and irrevocable by their holder, everything else unchanged.
- **Without LEX — the discretionary office.** An office, held under mandate, judged, replaceable and ineligible on its own matters, may impose consequences by discretion; each is delivered, answerable and reviewed by a party not implicated. Every other principle holds; LEX.1 fails. IMP constrains $V_\Gamma$, and discretionary consequences lie outside it, which is why IMP means nothing without LEX. A second witness, for LEX.3 alone: a change that applies to acts done before it.
- **Without IMP — the named privilege.** A rule gives one named party's proposals a lower threshold; the rule is changeable by the ordinary gate and the party is replaceable in every position it holds. IMP.1 fails and nothing else does. Second witnesses: **caste**, a rule barring one kind from every seat, with exit free and the rule changeable by the gate (IMP.3 alone); **self-review**, voters voting on their own matters (IMP.5 alone).
- **Without VOX — summary execution.** Consequences bind the moment they are derived: no delivery, no window, no answer. Every derivation is lawful, blind, recorded and correctable. VOX fails and nothing else does.
- **Without COR — the life seat.** One seat's holder can be removed only with its own assent and names its own successor. The holder is judged like anyone (findings are derived, delivered and answered), but no consequence removes it. COR.2 fails and nothing else does. A second witness, for COR.1 alone: a frozen clause no admissible step can change.

**Result.** The six are independent. The two composite principles are also independent at clause level where it matters: DEL's power-by-grant and duty-by-acceptance have separate witnesses, as do IMP's renaming invariance, attribute symmetry and no-own-cause.

### 3.3 Sufficiency against the meta-agentic instance

Every unit of ADR-ETH-01 (D1–D21), of ADR-ETH-02 on the main line (T, A1–A3, H1–H3, C1–C23, the dedication, S1, S2, P1, P2), and the two units of the open amendment that adds P3 and revises C14, mapped to principle and force, or to *value* (an instance's declared choice under F6), *mechanism* (how the instance delivers a floor), *meta* (about levels and tailoring) or *editorial* (a correction of the records' own statements). A unit can serve several.

| Unit | Serves | Forces | Class |
|---|---|---|---|
| D1 symmetry | IMP.2 | F1, F2 | floor; consequence tables by kind are value |
| D2 a last word | COR.3 (decisions are reached) | F5, F1 | floor; the seat is mechanism |
| D3 procedural | the core's scope (§2.7) | F6 | meta |
| D4, C1 claims | LEX.2, IMP.1 | F2, F6, F8 | floor; the proof route is mechanism |
| D5 bypass economics | all, as enforcement | F4 | design rule |
| D6, D7, C3, C15, T | levels and tailoring | F7, F1 | meta |
| D8 closure | IMP.4, MEM.2 | F1, F4 | floor |
| D9 arbiter a seat | IMP.4, IMP.5, LEX.2, COR.2 | F1, F5 | floor |
| D10, D11 perimeter | LEX.6, MEM.2 | F1, F4 | floor; three nested perimeters are mechanism |
| D12, C7 issuance | DEL.1, DEL.2 | F1, F5 | floor; governed channel is mechanism |
| D13 inform of perimeter | VOX.1 | F1 | floor (perimeter only; see gaps) |
| D14, A2 record | MEM.1, MEM.4, MEM.5, VOX.2–4, IMP.5 | F1, F9 | floor; anonymisation of humans is F9 |
| D15, C19 witnessed delivery | MEM.2, IMP.5 | F1, F4 | floor; the second collector is mechanism |
| D16, D17, D19, C10 | COR (detection before rupture) | F5, F6, F7 | method; vital signs are mechanism |
| D18, C2 minimal entrenched surface | COR.1 | F5, F1 | floor |
| D20 the lab | IMP.5, DEL.1 | F1, F6 | floor |
| D21 identity per decision | LEX.3 (in part) | F5, F8 | floor |
| A1 party and subject | DEL.1–5, IMP.4, VOX.1–3 | F1, F5, F9 | floor; browsing reach is value |
| A3 working state | COR.3, COR.4 | F1, F8 | floor; the working-state form is mechanism |
| H1 lawful obstruction | COR.3, VOX.4 | F1, F7 | floor; defences are mechanism |
| H2 opaque coordination | LEX.4, MEM.2, IMP.5 | F1, F3, F6 | floor |
| H3 genesis regime | the genesis transient (GEN) | F4, F7 | floor; exit by custody is mechanism |
| C4, C8, C9 | the records' own accuracy | — | editorial |
| C5, C16 placement, witness | MEM.1, MEM.3 | F1, F9 | mechanism |
| C6 fragment | LEX.2 | F3, F8 | mechanism |
| C11, C12, C23 replay | LEX.2, MEM.1 | F6, F8, F9 | floor; provenance format is mechanism |
| C13 derivation and consequence | IMP.2, IMP.3 | F2, F9 | floor |
| C14 conflicting consequences | LEX.5, IMP.1, IMP.5, VOX.4 | F3, F5 | floor; the ordering is mechanism; the reviewer's kind is value and F9 |
| C17, C20–C22 the draw | IMP.5 | F1, F2, F9 | mechanism |
| C18 configuration check | COR.3, COR.1 | F1 | mechanism |
| S1 signed acts | MEM.2, MEM.3, DEL.1 | F1, F9 | floor; method is mechanism |
| S2 continuity of a non-human party | MEM.4, DEL.1, DEL.5 | F1, F2 | mechanism, required by F2 |
| P1 Custodian in parity | COR.2, COR.3, IMP.3, IMP.5 | F1, F5 | composition by kind is **value**; seats and ceilings are mechanism |
| P2 review for every subject | VOX.4, IMP.5 | F9 | floor; extension to non-human subjects is **value** |
| P3 two kinds or no instance | MEM.4 (kept record), IMP.5 | F6 | **value** |
| Dedication | none | F6 | non-normative by its own text |

**Noise — units that serve no principle.** One: the dedication, which says of itself that it is not a rule and that nothing is derived from it. Every normative unit serves at least one principle. P1's composition by kind and P3 serve the instance's declared value of parity, and are values, not noise.

**Gaps — clauses of the core with no clause, or only a partial one, in the instance.**

1. **LEX.3 non-retroactivity.** The instance fixes the ordering in force at filing (C14) and the schema in force at delivery (H2), and D21 asks that a decision's clauses not change during it. No clause says that an act is judged by the rules in force when it was done. *Gap.*
2. **VOX.1 notice of a change that adds a duty, with DEL.4's chance to leave first.** D13 delivers changes of the perimeter, and A1 delivers a mandate's terms before acceptance. No clause delivers a later change of rules to the parties it adds a duty to before the duty runs. *Gap.*
3. **VOX.5 non-retaliation.** Present case by case: a claim that a signature is not its signer's opens no finding against the claimant (S1); an extension request states no reason (H1); refusal and renunciation never count against a party (P3, at the end of an instance). No general clause. *Partial.*
4. **LEX.5 possible compliance.** Consistency is covered (C14), windows that fit are checked (C18), and capacity never gates an owed act (H1). No general clause that every party can comply. *Partial.*
5. **LEX.4 no consequence from prediction or association.** H2 makes correlation a vital sign and never a finding, and S2 limits consequences for steered acts to parties the record shows knew or controlled. No general clause. *Partial.*
6. **MEM.5 reading is an act.** A2 logs every read of a finding about a subject. Reads of the rest of the record about a subject are not logged. *Partial.*
7. **COR.2 for the Custodian seats.** P1 forbids a seat to veto its own replacement, but what replaces a Custodian and who counts it is open (ADR-ETH-01 OD4). *Partial, open.*

None of the gaps is a contradiction: the instance does nothing a core clause forbids, except during the genesis regime, which GEN accounts for.

### 3.4 Where the candidate five failed, and what changed

The candidate core was Memory, Delegation, Impartiality, Voice and Correctability. The tests above found these failures.

1. **Impartiality held two independent principles.** "A function of acts and rules" and "never of who acted" have separate counter-models: the discretionary office is blind and unlawful; the named privilege is lawful and not blind. *Changed:* LEX is split out, and gains non-retroactivity (X17), possible compliance (X19) and acts-not-predictions (X20, X21), which no candidate principle excluded.
2. **No principle excluded bondage or colonial binding.** A system can record everything, judge blindly, hear everyone and correct anything, and still impose duties on parties who never accepted them and cannot leave. *Changed:* DEL gains DEL.3 accepted duty and DEL.4 exit: power flows down a mandate, consent flows up the same edge.
3. **"Traces to a common root" did not exclude sybil capture.** A single chain from the root can mint a thousand delegates. *Changed:* DEL.2, no amplification: positions are created only by change, and weight is counted per position.
4. **Impartiality as renaming invariance did not exclude caste.** A rule over kinds is invariant under renaming. *Changed:* IMP.2 blinds findings to unchosen attributes, IMP.3 makes power symmetric under permutation of attribute values. P1 passes, since one seat of each kind is symmetric under swapping kinds; P2 and A2 pass as declared protections.
5. **Voice held the reviewer's independence, which is Impartiality's.** Moved to IMP.5, which also covers voters, attesters and witnesses and fixes the base at filing (X34). Voice gains non-retaliation (X38) and the review's duty to read the answer (X41).
6. **Memory did not exclude surveillance.** *Changed:* MEM.5, reading is an act.
7. **"Every rule is changeable by the rules" admitted gridlock and indefinite pendency.** A rule can be changeable in principle and never in practice. *Changed:* COR states reachability along a finite path (COR.1), no owned fixed point (COR.2), finite levers (COR.3) and closable findings (COR.4).
8. **Oligarchy and plutocracy are not excluded as such.** The tests show that "a few decide" and "weight follows stake" are violations only through one of three routes: binding those who cannot leave (DEL.3, DEL.4), entrenching (COR.2), or barring a class (IMP.3). Over parties who accepted, can leave, are judged like everyone and are replaceable, they are declared values. This is a finding, not a change; `core/pathologies.md` X45 and X46 argue it.
9. **The genesis transient was missing.** The candidate's "no position, the founder's included, is beyond replacement" fails at $e_0$ in every system (GEN.1). *Changed:* the transient is stated.

Six principles result: MEM, DEL, LEX, IMP, VOX, COR.

## 4. Machine-checkable statements — sketch

How each clause could be tested against an instance in the style of the consolidated text's checker (open pull request #9, `constitution/tools/check.py`), whose checks are `fragment`, `symmetry`, `kinds`, `binding`, `fixtures`, `parameters` and the configuration check `c18.py`. *Static* means a check over the rules; *fixture* means a derived atom that must be empty, or must appear, on asserted fact sets, with a mutant fixture that removes one fact and must change the outcome; *bounded* means enumeration up to the instance's declared roster cap, as C18 does; *procedural* means a party's read of external evidence.

| Clause | Kind | Sketch | Extends |
|---|---|---|---|
| MEM.1, MEM.3 | procedural | every witnessed head extends its predecessor by a prefix proof; a pair without one derives `fork` | witness check |
| MEM.2 | static | no rule's head is an intake-class predicate: no rule writes the record | `vocabulary` |
| MEM.4 | fixture | a party's renunciation leaves every entry it authored derivable: `entry_lost` empty | `fixtures` |
| MEM.5 | fixture | `read(X, Y)` without an entry visible to `Y` derives `unlogged_read`; must be empty | `fixtures` |
| DEL.1 | fixture | `reach(P)` over granted-and-accepted edges from the root; `exercised_without_chain(A)` empty | `fixtures` |
| DEL.2 | static | gate rules count positions only: an aggregate over a party-sorted variable in a gate-class head is refused; no grant rule's head is a position | `symmetry` |
| DEL.3 | fixture | `duty_before_accept(P, M)` empty | `fixtures` |
| DEL.4 | static + fixture | no rule derives a block on `renounce`; no consequence rule reads `renounce` positively | dependency graph |
| LEX.1 | fixture | `applied(Q)` with no derived `consequence(Q)` derives `unruled`; empty | `fixtures` |
| LEX.2 | static | the fragment is stratified and range-restricted, so one model per fact set; replay of every fixture gives the same model | `fragment` |
| LEX.3 | static | every rule reads `in_force(R, T0)` with `T0 <= T` of the act it judges | new |
| LEX.4 | static | consequence rules reach their subject only through its own acts or `in_chain`; no `predicted` or `correlated` predicate reaches a burden | dependency graph |
| LEX.5 | bounded | for each party in each fixture, some set of its own acts leaves `breach(P)` underivable; checked by a meta-program outside the rule set, as the draw is | `c18.py` style |
| IMP.1 | static + fixture | no party constant; party terms compared only by `!=`; permutation fixtures give permuted models | `symmetry` |
| IMP.2 | static | no derivation rule reads a kind-bearing predicate | `kinds` |
| IMP.3 | fixture | run gate and eligibility rules on each fixture and on its kind-swapped image; models equal up to the swap; rules reading kind carry a protection tag | new, beside `kinds` |
| IMP.4 | static | no rule exempts by role from derivation: `exempt` is not a predicate of any derivation | `vocabulary` |
| IMP.5 | fixture | `implicated(P, M)` with `decides(P, M)` derives `own_cause`; empty; the base is read at filing | `fixtures` |
| VOX.1–4 | fixture | `binds(Q, X)` without `delivered`, `window_passed` and `reviewed` with `answer_read` derives `bound_unheard`; empty; mutants drop each fact | `fixtures` |
| VOX.5 | static | voice-act predicates reach burden-class consequence heads only under negation | dependency graph polarity |
| COR.1 | bounded | for every rule tag, some winning set of positions is fillable at every roster size up to the cap | `c18.py` |
| COR.2 | bounded | for every position and every holder, a winning set for its replacement exists without that holder's positions | `c18.py` |
| COR.3 | static | every lever parameter in `parameters.tsv` declares a finite ceiling | `parameters` |
| COR.4 | procedural | the published closure result of ADR-ETH-02 A3, re-runnable by any party | A3 result |

Three clauses resist a static check and are tested only: LEX.5 (a quantifier alternation over acts), COR.1 and COR.2 (reachability), each by enumeration up to a declared cap, and so claims about each finite instance, as ADR-ETH-02 A3 already says of its own claim.

## 5. Open questions

1. **Agents as parties or as instruments.** IMP.3 forbids barring a class of *parties* by kind from power. An instance that wants agents without standing must keep them instruments, their acts attributed to their grantors (DEL.5), not parties. Is that the line the founder wants the core to draw? **[open]**
2. **Whether voice in rule-making belongs in the core.** The core requires exit and hearing, not a share in making the rules (§3.4, item 8). An instance whose parties cannot leave in practice, such as one bound by law to its participants, may need more; is a share in rule-making for parties without real exit a core clause or a force-derived one? **[open]**
3. **Proportionality.** A draconian consequence, lawful, heard and correctable, is classed substantive (X51). Whether a bound on consequences belongs in the core is open. **[open]**
4. **The founder's signature on the core.** ADR-ETH-03 K4 proposes that the core is published under its authors' signatures as authors, binding no one, and adopted by each instance by its own act. **[proposed]**
