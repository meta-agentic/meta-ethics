# The core — L0

**Status: Proposed with ADR-ETH-03, 2026-10-05.** This file states the core, the level zero shared by every instance, as a property of a minimal transition-system model, and records the three tests the core was put through: coverage of the pathologies in `core/pathologies.md`, minimality, and sufficiency against the meta-agentic instance. ADR-ETH-03 records the decision; this file records what the decision rests on. The drafting rule is the record's: the core fixes outcomes and floors, never mechanisms. Where a clause below names how something is done, that is an error in the clause.

> Claim tags as in ADR-ETH-01: **[evidence]** · **[hypothesis]** · **[open]** · **[proposed]** · **[pending]**. Every result in this file is **[proposed]** and established by inspection, not machine-proved, unless it says otherwise.

## 1. The model

The model is the smallest structure over which every principle below can be stated. Each instance refines it; none may remove a component.

**Actors and attributes.** A set $\mathcal{A}$ of actors: anything that can act. Each actor may carry attributes it did not choose. The core fixes one, **kind**, with two values, human and non-human; an instance may declare others, none of which is kind or subdivides it. An attribute is **chosen** only if the actor can shed it by its own act at no cost; every other attribute is unchosen. An attribute is not an identity, and an actor's acts are not attributes.

**Acts.** An act is $a = \langle \mathit{type}, \mathit{author}, \mathit{args}, t \rangle$. Every instance has at least these types: grant, accept, renounce and revoke of a mandate; propose and assent to a change; file a finding; answer; attest a fact; read the record about a subject. An instance adds others.

**The record.** A finite sequence $R = e_1 \cdots e_n$ of entries. Each entry has a skeleton — the digest of its content, its author, its type, its time and a link to the entry before it — and a content, the act itself. Runs extend it: $R \sqsubseteq R'$ is the prefix order over skeletons. The genesis entry $e_0$ is the signing of the founding document, written $\rho$.

**State is a fold.** $\sigma(R) = \mathit{fold}_\varphi(R)$ under a versioned fold $\varphi$. Every component below is a component of $\sigma(R)$; nothing that decides what may happen next lives outside it.

**The mandate graph.** $M = (N, E)$ with $N = \{\rho\} \cup \mathcal{A}$ and edges $g \xrightarrow{s} h$ carrying a scope $s$, a set of capabilities, and a status: granted, accepted, renounced, revoked. An actor is a **party** iff a path of granted and accepted, live edges leads from $\rho$ to it. The root $\rho$ is a document, not a party. An actor whose act has an effect inside the perimeter is a **subject**, unless it is an instrument; every party is a subject.

**Instruments** **[proposed — OD24]**. An instrument is a non-human actor that holds no mandate in its own name, every act of which is attributed to the party that uses it (DEL.5), and on which no consequence falls; a consequence meant for it falls on that party. No human is an instrument. If OD24 rejects the category, this paragraph is struck and every actor whose act has an effect inside is a subject.

**Rules.** $\Gamma = (D_\Gamma, C_\Gamma, W_\Gamma, \Pi_\Gamma)$, itself a component of the state, each rule carrying the index from which it is in force. $D_\Gamma$ are derivation rules: they decide what holds (findings, breaches, eligibility). $C_\Gamma$ are consequence rules: they decide what follows (sanctions, protections, duties, access). $W_\Gamma$ is the gate: for each rule or position $r$, a family $W_\Gamma(r)$ of winning sets of **positions** whose holders' assent admits a change to $r$. $\Pi_\Gamma$ is the declared perimeter, the jurisdiction.

**Verdicts.** $V_\Gamma(\sigma) = (F, Q)$ with $F = D_\Gamma(\sigma)$ the findings and $Q = C_\Gamma(\sigma, F)$ the consequences. A consequence $q$ **binds** a subject $x$ when it changes $x$'s access, capacity, eligibility, standing or duties. Some inputs are attested facts: acts of judgement or observation entered by their author.

**Change.** $\Delta$ admits a change $\Gamma \to \Gamma'$ to $r$ at index $i$ iff the holders of some $w \in W_\Gamma(r)$ assented in $R$ before $i$. A change is an act like any other.

**Positions.** $\mathit{Pos}(\sigma)$, the seats or offices the rules define, each with a holder. Power in the gate is counted per position.

**Implication and capture.** $\mathit{impl}(x, m)$ holds when party $x$ is named in matter $m$, benefits from its outcome, or has acted in it, and also when $x$ holds the position it would act from through a grant that a party implicated in $m$ made or can revoke alone; an instance may add grounds, never remove these. A group $G$ **captures** the gate when the positions it holds contain a winning set for some change; $G$ is **below capture** otherwise.

**Admissibility and runs.** $R \to R \cdot e$ when $e$ is admissible in $\sigma(R)$ under $\Gamma$. A run is a sequence of such steps from $\langle e_0 \rangle$. A state is reachable if some run reaches it.

The model says nothing about the logic rules are written in, the carrier of a signature, the witness service, the draw, the number of seats or the length of a window. Those are mechanisms or values, and live in instances.

## 2. The six principles

Each principle has a one-line statement, its clauses as properties of the model, and what it leaves to instances.

**Identifiers.** The principle identifiers `MEM`, `DEL`, `LEX`, `IMP`, `VOX`, `COR` and `GEN`, and the clause identifiers formed from them (`MEM.1`, `DEL.4`, …), are stable: a clause keeps its identifier for good, a retired identifier is never reused, and a new clause takes the next free number under its principle. Each clause is one list item whose first bold token is its identifier, so that an instance's inventory can name the core clause each of its paragraphs sits under, and a checker can resolve the name (`core/relevel.md` §5).

### MEM — Memory

*What happened is written once, attributed, and never silently changed.*

- **MEM.1 Append-only.** Along every run, $R_t \sqsubseteq R_{t+1}$: no entry's digest, author, type or time is ever changed or removed. A correction is a new entry. Where a law or a declared rule requires content to be erased or anonymised, a later entry, attributed like any other, removes or replaces the earlier entry's content and keeps its skeleton: the erasure is real, and the record still shows that an entry was there, by whom, of what type and when.
- **MEM.2 Attribution, and nothing more than needed.** Every entry names its author. Every act that exercises a capability, binds a subject, or is read by a rule in force is entered; the instance declares what else it enters and why, and enters nothing else. Completeness is relative to what is observed; the gap between what is judged and what is observed is declared and measured, never assumed zero.
- **MEM.3 Independent verification.** Every party can check MEM.1 and MEM.2 without the cooperation of any single party, so no single party, operator and founder included, can rewrite the record undetected.
- **MEM.4 Conservation.** Leaving removes no entry, and no entry's existence depends on who made it.
- **MEM.5 Reading is an act.** A read of the record about a subject is itself an entry. Memory is therefore reciprocal: whoever reads about a subject is in that subject's record.

*Left to instances:* what may be anonymised and when, how long a finding may be used, which witness, which carrier.

### DEL — Delegation

*Every power is granted, every duty accepted, every mandate renounceable at no cost, all of them trace to one root, and someone outside answers for what the instance does.*

- **DEL.1 Rooted power.** Every act that exercises a capability is by a party holding that capability, at the act's time, through a chain of accepted mandates from $\rho$. An act outside every chain is valid for nothing and is attributed to whoever's access it used.
- **DEL.2 No amplification.** A mandate's scope lies within its grantor's, and positions are created only by $\Delta$, never by a grant. Delegation divides power and never multiplies it: splitting into many delegates adds no weight in any gate.
- **DEL.3 Accepted duty.** No duty binds any actor, party or not, before it was delivered a mandate's terms and accepted them. Anyone who acts inside is judged on those acts (IMP.4); that is judgement, not a duty.
- **DEL.4 Exit.** A party can renounce any mandate it holds, by its own act, at any time, at no cost the instance sets or controls. A leaver takes a copy of its own record and of every state the instance holds that the leaver brought in or that constitutes it; nothing the instance controls is held as a condition of leaving. Renouncing ends duties from then on and never the judgement of acts already done.
- **DEL.5 Attribution up the chain.** An act within a mandate's scope is attributed to the chain that granted it, not to the executor alone.
- **DEL.6 Answerability outside.** The founding document names, for each jurisdiction in which the instance's acts have effect, at least one actor answerable under that jurisdiction's law for those acts, and the record names one at every reachable state. Naming confers no power inside (DEL.2). A vacancy is a finding, and while it lasts no act with effect outside the perimeter is admissible.
- **DEL.7 Departure from the core.** An instance leaves the core only by a change delivered to every subject a declared interval before it takes effect (VOX.1), during which every party may renounce under DEL.4. Acts done and findings filed before it stay judged under the core (LEX.3), and the record before it stays verifiable (MEM.3).

*Left to instances:* who may grant what, how issuance is reviewed, how identity is established, how a non-human party persists.

### LEX — Legality

*Every consequence is derived from acts by rules in force before them, the same way every time.*

- **LEX.1 No consequence without a rule.** Every consequence that takes effect is in $C_\Gamma(\sigma)$. No office imposes one by discretion.
- **LEX.2 Determinism and replay.** $V_\Gamma$ is a function of $(\Gamma, \sigma)$: any party recomputes every verdict from the record and obtains the same result. Attested facts enter as inputs: re-examinable, not re-derivable.
- **LEX.3 Non-retroactivity, and the milder law.** An act is judged by the rules in force when it was done or, where they changed before the verdict, by those more favourable to the subject. A matter proceeds under the procedure in force at its filing, unless the procedure in force when the act was done gave the subject more protection. No change makes a past act a breach.
- **LEX.4 Acts, not persons, predictions or associations.** A consequence attaches to a subject's own acts or to acts in its chain (DEL.5), never to a predicted act, an inner state, or another's act outside its chain.
- **LEX.5 Possible compliance.** For every party and reachable state there is a course of its own acts, abstention included, under which no breach is derived against it. Two consequences that cannot both be applied are never both applied.
- **LEX.6 Declared jurisdiction.** Rules reach only the declared perimeter $\Pi_\Gamma$; widening it is a change under $\Delta$.

*Left to instances:* the logic and its fragment, the provenance format, the ordering among rules.

### IMP — Impartiality

*What is found does not depend on who you are, and no one decides their own case.*

- **IMP.1 Renaming invariance.** For every permutation $\pi$ of actors, $V_\Gamma(\pi\sigma) = \pi V_\Gamma(\sigma)$: rules name no actor and order none.
- **IMP.2 Attribute-blind findings.** $D_\Gamma$ is invariant under every bijection of actors, including one that changes their unchosen attributes. Attributes are read, if at all, by consequence rules only.
- **IMP.3 Attribute-symmetric power.** $W_\Gamma$ and eligibility for positions are invariant, up to a matching permutation of positions, under every permutation of attribute values: no class of parties is barred, by an attribute it did not choose, from a power that parties of another class can reach. The rules by which an actor becomes a party read no unchosen attribute other than kind, and an instance whose admission reads kind declares it among its values (F6). A consequence that reads an attribute is admissible only as a declared protection of the class it favours, and only if it burdens no subject of another class beyond making it ineligible for the role through which the protection is given.
- **IMP.4 Universality.** Every subject is judged by the same rules: none is outside judgement, the founder, the judge and the operator included.
- **IMP.5 No one in their own cause.** No party decides, votes, judges, reviews, attests or witnesses on a matter $m$ with $\mathit{impl}(x, m)$. The set entitled to decide a matter is fixed by rule at its filing, not by those interested in it.

*Left to instances:* how judges are chosen, the challenge procedure, which attributes exist and which protections they carry.

### VOX — Voice

*Whoever is bound is told, can see, can answer at no cost, and is heard before it binds; whoever is affected can complain and is answered.*

- **VOX.1 Notice.** Every finding about a subject, every consequence on it, and every change of rules that adds a duty to it is delivered to it, in a form it can read, before it binds it; a change that adds a duty is delivered no later than a declared interval before it binds, long enough to renounce under DEL.4.
- **VOX.2 Sight.** A subject sees in full what the record holds about it, including who has read it (MEM.5).
- **VOX.3 Answer.** A subject can append an answer to anything about it, at any time; nothing suppresses it. No fee, stake or deposit is a condition of answering, and no answer is weighed by what its author holds.
- **VOX.4 Hearing before binding.** A consequence other than an interim measure (VOX.7) binds only after a window, running from delivery, in which the subject could answer, and after a review that read the answer and records why it did or did not prevail. Who may review is IMP.5's.
- **VOX.5 Non-retaliation.** No consequence is derived from the exercise of voice: answering, dissenting, voting, challenging, reporting, filing, refusing or renouncing.
- **VOX.6 Standing of the affected.** Any actor, inside the perimeter or not, may file a finding about an act inside it that affected it, in a form the filer can make and read, at least one of which a human can use. The filing is entered (MEM.2) and answered by a reasoned entry within a declared ceiling (COR.3), and the filer sees the filing, the answer and what followed. Filing binds the filer to nothing.
- **VOX.7 Interim measures.** A consequence that binds before the hearing VOX.4 requires is delivered at once, limited to preserving the matter or preventing a declared harm, and reversible; it lapses at its ceiling (COR.3) unless the hearing confirms it, and its effects are undone or remedied if the finding fails.

*Left to instances:* window lengths and ceilings, the reviewer's kind, which interim measures exist, the forms of filing, the reach of browsing beyond oneself.

### COR — Correctability

*Every rule, verdict and position can be corrected by admissible steps, and no one, the founder included, owns a fixed point.*

- **COR.1 Reachable change.** From every reachable state, every rule of the instance, its entrenched clauses included, can be changed along a finite admissible path. A correction that needs a forbidden step is a revolution; the core requires that none be needed.
- **COR.2 No owned fixed point.** For every party $x$ and every position $x$ holds, from every reachable state there is a finite admissible path, in which $x$ performs no act, that ends with $x$ not holding it. No party's assent is needed to replace, judge or overrule that party.
- **COR.3 Finite levers and finite provisional status.** Every lever that delays a decision has a finite, declared ceiling, and every owed act occurs within one. Every provisional status — probation, interim measure, pending admission, pending review, founding regime — has a finite declared ceiling, at whose end it is decided or lapses in the subject's favour.
- **COR.4 Closable findings, without endless jeopardy.** For every open finding and every group below capture, the other parties can close it whatever the group does. Every verdict is re-examinable by an admissible act in the subject's favour; re-examination against the subject a verdict favoured is admissible only on a ground the rules declare and a finite number of times.

*Left to instances:* the gate's shape and thresholds, who holds the last word, who signs a constitutional change.

### GEN — The genesis transient

*No rooted system meets the core at its first act; the core is claimed from the end of a founding regime held to its other clauses.*

- **GEN.1 Lemma.** In every rooted system, at $e_0$ the signer of $\rho$ holds every position: before any grant, no one else holds a capability (DEL.1). So COR.2 and IMP.5 fail for the signer at genesis, in every instance.
- **GEN.2 The founding regime.** The core is claimed from the end of a founding regime, and the regime is held to the core's other clauses. It is declared in the founding document with its ceiling and the floors it cannot meet, every act under it is marked (MEM.2), and the declaration is delivered to every subject before any consequence binds it (VOX.1). Its ceiling is declared at $e_0$ — necessarily the founder's choice (GEN.1), public before any party accepts a mandate (DEL.3) — and no act lengthens it except one assented to by parties not implicated in the regime, never by the founder alone. It ends at an event any party can verify from the record (MEM.3), never by the founder's declaration alone. Every act of power made under it is decided again at its end by parties not implicated in it, the dependency ground of implication included (§1). If the ceiling passes without that event, every consequence under the regime on a subject other than the founder lapses, and the instance claims no conformance until the event.

*Left to instances:* the mechanism by which the regime ends; ADR-ETH-02 H3 is the meta-agentic instance's.

### 2.7 What the core is not

**Not substantive.** The core encodes who decides, on what record, with whom excluded, and how it is corrected; it says nothing about what is good (ADR-ETH-01 D3). It excludes pathologies of structure and does not exclude pathologies of purpose. `core/pathologies.md` marks which are which. Whether to restate this as *thin, not neutral* — declaring that consent to duty, exit, no burden for another's act or an unchosen attribute, and a hearing are already commitments to non-domination — is ADR-ETH-03 OD29.

**Not a rule of any instance.** COR reaches every rule of an instance, and does not reach the core, because the core is the type of an instance, not a clause in one. An instance cannot amend it; it can leave the family, and only as DEL.7 provides: the step that leaves is the last act under the core. The core is not a fixed point owned by a party, since it binds only those who adopt it, and changes only by re-founding: a new version of the core, which each instance adopts or not by its own constitutional change (ADR-ETH-01 D6, as ADR-ETH-03 re-levels it).

**Not a score.** Instances are ordered by which principles they satisfy and which pathologies they exclude. The order is partial: two instances that satisfy the same principles are not ranked by the core, because what remains between them is their values (ADR-ETH-01 D16). The taxonomy of pathologies is the ex-post labelling D16 allows, each label defined as a violation of a property, never as a resemblance to a historical polity.

**The core's own governance.** Versions of the core and its conformance suite are published in this repository's record, append-only and independently verifiable, their authors named (MEM). A version is proposed by a decision record and binds no instance until that instance adopts it (DEL.3). Any instance or subject may file a finding against a version or a check and receives a reasoned answer (VOX.6). No author of a check certifies an instance it is implicated in (IMP.5). Anyone may fork the core under another name.

## 3. Tests

### 3.1 Coverage

`core/pathologies.md` lists 60 pathologies after merging synonyms, each with a definition and a violation statement over this model. Each is classed **structural** (its definition is a property of who decides, on what record, how), **mixed** (a structural part and a part that depends on evidence or content), or **beyond the core** (its definition is about what is decided, or about what no record can see). Result:

| Class | Count | Excluded by the core |
|---|---|---|
| Structural | 44 | every one, by at least one principle |
| Mixed | 10 | the structural part; the rest is bounded, measured or declared, and named |
| Beyond the core: substantive or epistemic | 6 | none; each is made visible, attributed, answerable and correctable, and named as outside |

Per principle, the pathologies whose violation it is (several per pathology where a composite):

| Principle | Pathologies (numbers in `core/pathologies.md`) |
|---|---|
| MEM | X01 revisionism, X02 unattributed power, X03 surveillance and total recording, X04 whitewashing, X05 exit as erasure, X07, X42 |
| DEL | X06 usurpation, X07 operator capture, X08 covert steering, X09 sybil capture, X10 proxy amplification, X11 clientelism, X12 bondage, X13 lock-in, X14 colonial binding, X16, X25, X45, X46, X52, X58 |
| LEX | X15 arbitrary rule, X16 anarchy, X17 retroactive law, X18 secret law, X19 impossible law, X20 pre-emptive punishment, X21 collective punishment, X22 show trial, X23 selective enforcement, X24 state of exception, X25 totalitarian reach, X26 endless opaque process, X27 mob rule |
| IMP | X28 personal law, X29 caste, X30 dynasty, X31 corruption, X32 judge in own cause, X33 self-promotion of optimisers, X34 base manipulation, X35 rule by unamendable doctrine, X36 monoculture of judges, X58 exclusion from standing, X22, X23 |
| VOX | X37 summary judgement, X38 silencing, X39 opacity, X40 tempo capture, X41 rubber-stamp review, X42 information control, X43 paternalism, X18, X26, X52 |
| COR | X44 entrenchment, X45 oligarchy, X46 plutocracy, X47 gerontocracy, X48 junta, X49 paralysis, X50 revolution-only correction, X59 indefinite provisional status, X60 endless jeopardy, X24, X26, X35 |

Composites from the founder's list (tyranny, fascism, injustice, unfairness, corruption, evil) are mapped to their components in `core/pathologies.md` §8.

### 3.2 Minimality

For each principle, a system that satisfies the other five and violates it. Each is described as a variation of a conforming instance — one that meets every clause, such as the meta-agentic instance with its gaps (§3.3) closed — so that the other five visibly hold.

- **Without MEM — the mutable ledger.** The record is a store the arbiter seat may overwrite in place, and every rule reads the store. At every moment the other five hold of the current history: verdicts are derived from it, replay agrees with it, rules are blind, findings in it were delivered, chains in it reach the root, every rule is changeable. Last month's finding can be rewritten and no property of the rewritten history detects it. *Why independent:* the other five are properties of a history; MEM is the only principle that relates two histories to each other. A second witness, for MEM.5 alone: reads are not entered; VOX.2 then holds vacuously, because the subject sees everything the record holds, which contains no reads.
- **Without DEL — open registration.** Anyone may register as a party, each party has one vote, and everything else is as in the instance. Every act is recorded, rules are blind, verdicts heard, rules changeable; one controller registers a thousand parties. The other principles quantify over parties and cannot see that the parties are not distinct. A second witness, for DEL.3 and DEL.4 alone: **conscription** — mandates imposed without acceptance and irrevocable by their holder, everything else unchanged.
- **Without LEX — the discretionary office.** An office, held under mandate, judged, replaceable and ineligible on its own matters, may impose final consequences by discretion, never interim ones; each is delivered, answerable and reviewed by a party not implicated. Every other principle holds; LEX.1 fails. IMP constrains $V_\Gamma$, and discretionary consequences lie outside it, which is why IMP means nothing without LEX. A second witness, for LEX.3 alone: a change that applies to acts done before it.
- **Without IMP — the named privilege.** A rule gives one named party's proposals a lower threshold; the rule is changeable by the ordinary gate and the party is replaceable in every position it holds. IMP.1 fails and nothing else does. Second witnesses: **caste**, a rule barring one kind from every seat, with exit free and the rule changeable by the gate (IMP.3 alone); **self-review**, voters voting on their own matters (IMP.5 alone).
- **Without VOX — summary execution.** Consequences bind the moment they are derived: no delivery, no window, no answer. Every derivation is lawful, blind, recorded and correctable. VOX fails and nothing else does.
- **Without COR — the life seat.** One seat's holder can be removed only with its own assent and names its own successor. The holder is judged like anyone (findings are derived, delivered and answered), but no consequence removes it. COR.2 fails and nothing else does. A second witness, for COR.1 alone: a frozen clause no admissible step can change.

**Clauses with their own witnesses.** Each clause that answers a distinct pathology has a witness violating it alone, within its principle and outside every other: DEL.6, an instance that names no one answerable outside (X52's structural part); DEL.7, an instance that leaves the core in one step; VOX.6, an instance that refuses filings from the affected who are not subjects; VOX.7, interim measures without a ceiling or remedy, everything else heard; COR.3's provisional ceiling, a probation that never ends (X59); COR.4's jeopardy bound, a favourable verdict reopened without limit (X60); IMP.3's admission sentence, party status reserved by an unchosen attribute other than kind (X58).

**Couplings checked.** Three clauses refer to another principle and were checked for hidden dependence. VOX.7 states its ceiling by reference to COR.3 and adds the remedy and the scope; it is not a restatement. GEN.2 uses IMP.5's implication with its dependency ground; GEN is not one of the six, so this is a use, not a dependence among principles. The discretionary office (¬LEX) is restricted to final consequences, because a discretionary interim measure would also fail VOX.7; with that restriction it still fails LEX alone.

**Result.** The six are independent, after every clause above. The two composite principles are also independent at clause level where it matters: DEL's power-by-grant, duty-by-acceptance and answerability outside have separate witnesses, as do IMP's renaming invariance, attribute symmetry, admission and no-own-cause.

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

1. **LEX.3 non-retroactivity and the milder law.** The instance fixes the ordering in force at filing (C14) and the schema in force at delivery (H2), and D21 asks that a decision's clauses not change during it. No clause says that an act is judged by the rules in force when it was done, nor by a milder rule adopted before the verdict. *Gap.*
2. **VOX.1 notice of a change that adds a duty, a declared interval before it binds.** D13 delivers changes of the perimeter, and A1 delivers a mandate's terms before acceptance. No clause delivers a later change of rules to the parties it adds a duty to, a declared interval before the duty runs. *Gap.*
3. **VOX.5 non-retaliation.** Present case by case: a claim that a signature is not its signer's opens no finding against the claimant (S1); an extension request states no reason (H1); refusal and renunciation never count against a party (P3, at the end of an instance). No general clause. *Partial.*
4. **LEX.5 possible compliance.** Consistency is covered (C14), windows that fit are checked (C18), and capacity never gates an owed act (H1). No general clause that every party can comply. *Partial.*
5. **LEX.4 no consequence from prediction or association.** H2 makes correlation a vital sign and never a finding, and S2 limits consequences for steered acts to parties the record shows knew or controlled. No general clause. *Partial.*
6. **MEM.5 reading is an act.** A2 logs every read of a finding about a subject. Reads of the rest of the record about a subject are not logged. *Partial.*
7. **COR.2 for the Custodian seats.** P1 forbids a seat to veto its own replacement, but what replaces a Custodian and who counts it is open (ADR-ETH-01 OD4). *Partial, open.*
8. **DEL.6 answerability outside.** C18 checks a declaration of whether a law requires a person answerable for a non-human party's acts, and names one where it does (OD23). No clause names, for each jurisdiction, an actor answerable for the instance's acts, nor stops outward acts while none is named. *Partial.* DEL.6 asks for an actor answerable for the instance's acts, not for the non-human seat's in particular, so it does not decide OD23; the founder should read the two together.
9. **VOX.6 standing of the affected.** Findings are delivered to subjects (A1) and a filing in human language is rendered into the schema (H2), but an affected actor who is not a subject has no route to file and be answered. *Gap.*
10. **VOX.7 interim measures.** A2 limits them to the access concerned, gives them a ceiling, makes them visible at once and never cited, and opens review at once. Nothing undoes or remedies their effects when the finding fails. *Partial.*
11. **DEL.4 exit at no cost the instance controls, with portability.** A1 gives refusal and renunciation to every kind, and P3 says renouncing never counts against a party at an instance's end. No clause gives a leaver a copy of its record and of the state that constitutes it. *Gap.*
12. **DEL.7 departure from the core.** Nothing provides for the instance leaving the core. *Gap.*
13. **COR.4 no endless jeopardy.** A finding closed in its subject's favour is never cited against it (A2), and a sameness ruling is contestable once (H1). No general bound on reopening a favourable verdict. *Partial.*
14. **MEM.2 nothing more than needed.** Only facts in a published schema enter (H2), and the line between personal data and the record is a parameter (A2). No clause bars entering what no rule reads and no declared purpose covers. *Partial.*
15. **GEN.2 the founding regime.** H3 declares the regime, its duration and the floors it cannot meet, ends it at a published, checkable custody event, and sends its acts to ratification by parties outside the founder's chain. Three parts are missing: the regime is told to every party's inform channel, not to every subject; nothing forbids lengthening the declared duration; and past it the instance only stops claiming conformance, while consequences under the regime stand. *Partial.*
16. **COR.3 finite provisional status — a contradiction.** A2 and P2 keep a consequence-bearing verdict provisional "where no eligible reviewer exists", with no ceiling; the finding stays open, and its subject stays recused on the matter it cites (A2) for as long. COR.3 requires every provisional status to end, decided or lapsed in the subject's favour. The revised C14 already does this for undecided conflicts ("if the ceiling passes unresolved, no burdening consequence applies"); A2 and P2 do not.

Fifteen are gaps or partial covers. One, the sixteenth, is a contradiction: the instance keeps a status open that the core requires to end. Outside it, the instance does nothing a core clause forbids, except during the genesis regime, which GEN accounts for.

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

10. **Exclusion from standing.** IMP.3 quantified over parties, so an instance could keep a class out of party status by an unchosen attribute and burden it as subjects, and every burden could be called a protection of the others. *Changed:* DEL.3 binds no actor, party or not, to an unaccepted duty; IMP.3 bars admission rules from reading any unchosen attribute but kind, and a protection may burden another class only by making it ineligible for the role that gives the protection (X58). "Chosen" is defined: sheddable by one's own act at no cost.
11. **Answerability ended at a document, and the harmed outsider had no standing.** After genesis, attribution up the chain stopped at a root that answers to no one, and an affected actor who was not a subject had no channel. *Changed:* DEL.6 answerability outside, VOX.6 standing of the affected; X52 becomes mixed.
12. **Interim measures were an unbounded exception to hearing.** *Changed:* VOX.7.
13. **Exit was formal.** Costs the instance controls, and holding a leaver's state, could make leaving ruinous, and notice could come one instant before a duty. *Changed:* DEL.4 at no cost the instance sets or controls, with portability; VOX.1 a declared interval; DEL.7 for the instance's own departure from the core.
14. **Provisional status and favourable verdicts had no end.** *Changed:* COR.3 ceilings every provisional status (X59); COR.4 bounds re-examination against the subject (X60).
15. **Non-retroactivity froze procedure at the filer's choice and kept the harsher law.** *Changed:* LEX.3 adds the milder law and protects the subject's procedure.
16. **Erasure as a new entry erased nothing, and completeness meant total recording.** *Changed:* MEM.1 is append-only over skeletons, so erasure of content is real; MEM.2 enters what a rule needs and what is declared, nothing else.
17. **The founding regime could be extended and ended by declaration, and its dependants could re-decide its acts.** *Changed:* GEN.2 fixes the ceiling against the founder's own extension, requires a verifiable end and delivery to every subject, and lapses consequences past the ceiling; implication gains the dependency ground.

Six principles result: MEM, DEL, LEX, IMP, VOX, COR, with GEN for the genesis transient.

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
| DEL.4 | static + fixture | no rule derives a block on `renounce`; no consequence rule reads `renounce` positively; a renunciation fixture yields `export(P, …)` for the leaver's record and constituting state | dependency graph |
| DEL.6 | fixture | for each declared jurisdiction, `answerable(J, A)` holds at every fixture state; with none, every outward act derives `inadmissible` | `fixtures`, `parameters` |
| DEL.7 | procedural | a departure change carries a delivery to every subject and a renunciation window of the declared interval | `c18.py` |
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
| VOX.6 | fixture | a filing by a non-subject derives `owed_answer(F)` with a ceiling; `unanswered_past_ceiling` empty | `fixtures` |
| VOX.7 | fixture | an interim consequence past its ceiling without confirmation derives `lapsed`; a failed finding derives `remedy_owed` for each interim effect | `fixtures` |
| COR.1 | bounded | for every rule tag, some winning set of positions is fillable at every roster size up to the cap | `c18.py` |
| COR.2 | bounded | for every position and every holder, a winning set for its replacement exists without that holder's positions | `c18.py` |
| COR.3 | static + fixture | every lever and every provisional status in `parameters.tsv` declares a finite ceiling; a provisional verdict past its ceiling derives `decided` or `lapsed`, never stays open | `parameters` |
| COR.4 | procedural + fixture | the published closure result of ADR-ETH-02 A3, re-runnable by any party; `reopen_against(V)` beyond the declared count or without a declared ground derives `jeopardy` | A3 result, `fixtures` |

Three clauses resist a static check and are tested only: LEX.5 (a quantifier alternation over acts), COR.1 and COR.2 (reachability), each by enumeration up to a declared cap, and so claims about each finite instance, as ADR-ETH-02 A3 already says of its own claim.

## 5. Open questions

1. **Agents as parties or as instruments.** IMP.3 forbids barring a class of *parties* by kind from power. An instance that wants agents without standing either keeps them instruments as §1 defines them (no consequence falls on them; no human is ever one), or keeps them out of party status by kind as a declared value, in which case they remain subjects with every VOX protection and no kind-reading burden. Is that the line the founder wants the core to draw? **[open]**
2. **Whether voice in rule-making belongs in the core.** The core requires exit and hearing, not a share in making the rules (§3.4, item 8). An instance whose parties cannot leave in practice, such as one bound by law to its participants, may need more; is a share in rule-making for parties without real exit a core clause or a force-derived one? **[open]**
3. **Proportionality and remedy.** A draconian consequence, lawful, heard and correctable, is classed beyond the core (X51). ADR-ETH-03 OD26 offers an ordinal proportion clause and a remedy clause as options. **[open]**
4. **The founder's signature on the core.** ADR-ETH-03 K4 proposes that the core is published under its authors' signatures as authors, binding no one, and adopted by each instance by its own act. **[proposed]**
5. **Thin, not neutral** (OD29) and **external law** (OD30): options in ADR-ETH-03. **[open]**
