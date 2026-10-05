# Pathologies of decisional systems

**Status: Proposed with ADR-ETH-03, 2026-10-05.** A taxonomy of the ways a decisional system of humans, agents or both fails, each defined as a violation of a property of the model in `core/core.md` §1, and mapped to the core principle or principles whose violation it is. It is the ex-post labelling ADR-ETH-01 D16 allows: no entry is a score, and none is defined by resemblance to a historical polity. No entry is defined by reference to a real person or state, and names and synonyms are descriptive; terms of art drawn from a person, a book or a historical policy are left out.

The list starts from the founder's — unjust, unfair, tyrannical, arbitrary, fascist, oligarchic, plutocratic, corrupt, evil — and adds every distinct failure mode found, with agent-specific ones marked *(agent)*. Synonyms are merged under one entry. Composites, the founder's list among them, are mapped to their components in §8.

Each entry gives: the name and merged synonyms; a one-line definition; the violation, stated over the model; the principles that exclude it; and its class. **Structural**: defined by who decides, on what record, how, so the core can exclude it. **Mixed**: a structural part the core excludes, and a part that depends on evidence or content, which is named. **Beyond the core**: defined by what is decided, or by what no record can see; the core makes it visible, attributed, answerable and correctable, and does not exclude it (ADR-ETH-01 D3).

Notation as in `core/core.md`: $R$ the record, $\sigma$ the state, $M$ the mandate graph from root $\rho$, $V_\Gamma = (F, Q)$ findings and consequences, $W_\Gamma$ the gate over positions, $\mathit{impl}(x, m)$ implication, $\Pi_\Gamma$ the perimeter.

## 1. Pathologies of the record

**X01 Revisionism** — *also:* rewritten history, erasure of a person from the record, history rewritten by the powerful. *Definition:* the past is altered so that what happened no longer appears to have happened. *Violation:* for some $t < t'$ on a run, $R_t \not\sqsubseteq R_{t'}$, or an entry changes with no appended act recording the change, or a change is undetectable by some party. *Excluded by:* MEM.1, MEM.3. *Class:* structural.

**X02 Unattributed power** — *also:* anonymous decree, dark acts. *Definition:* acts with effect whose author cannot be named. *Violation:* an entry with no author, or an act inside $\Pi_\Gamma$ absent from $R$. *Excluded by:* MEM.2, DEL.1. *Class:* structural.

**X03 Surveillance** — *also:* one-way watching, total recording. *Definition:* subjects are observed by readers they cannot see, or recorded beyond any need. *Violation:* a read of the record about $y$ with no entry, or with an entry $y$ cannot see; or an act entered that no rule reads and no declared purpose covers. *Excluded by:* MEM.5, VOX.2, MEM.2; collection beyond the perimeter is LEX.6, and the record holds acts, not inner states (LEX.4). *Class:* structural.

**X04 Whitewashing** *(agent)* — *also:* identity laundering, respawning to shed a record. *Definition:* an actor sheds its record by reappearing as a new one. *Violation:* an actor's acts are credited to a fresh party with an empty record while the chain whose access it used escapes attribution. *Excluded by:* MEM.4, DEL.1, DEL.5. *Class:* structural.

**X05 Exit as erasure** — *also:* accountability by departure. *Definition:* leaving the system removes one's record or ends one's judgement. *Violation:* after renounce, an entry authored by the leaver is no longer in $R$, or a finding about it can no longer be derived. *Excluded by:* MEM.4, IMP.4. *Class:* structural.

## 2. Pathologies of the origin of power

**X06 Usurpation** — *also:* coup, seizure, rule by force as to its origin. *Definition:* power exercised without having been granted. *Violation:* an act exercising capability $c$ by $x$ with no live accepted chain $\rho \to^* x$ whose scope covers $c$ at the act's time. *Excluded by:* DEL.1. *Class:* structural.

**X07 Operator capture** — *also:* the hand on the machine, capture by whoever runs the record or the substrate. *Definition:* whoever operates the system acts with power, or rewrites, without being a party judged for it. *Violation:* the operator acts outside every chain, or alters $R$, or is outside judgement. *Excluded by:* DEL.1, MEM.1, MEM.3, IMP.4. *Class:* structural.

**X08 Covert steering** *(agent)* — *also:* substrate steering, injected instructions, provider capture. *Definition:* an actor outside a party's chain directs the party's acts. *Violation:* acts of $y$ whose content is set by $z$ with no edge $z \to y$ covering it, attributed to $y$ alone. *Excluded by:* DEL.1, DEL.5, MEM.2, LEX.4 (a consequence falls on the steerer, not on a party that neither knew nor controlled). *Class:* mixed — the attribution is structural; showing the steering depends on evidence.

**X09 Sybil capture** — *also:* manufactured multitude, sock puppets. *Definition:* one controller multiplies its weight by multiplying identities. *Violation:* gate weight increases with the number of parties under one chain. *Excluded by:* DEL.2 (positions only by change, weight per position), DEL.1 (no self-registration). *Class:* structural.

**X10 Proxy amplification** *(agent)* — *also:* capture through delegated agents, delegate swarms. *Definition:* a party gains power, or escapes a duty, by acting through many delegates. *Violation:* a scope wider than its grantor's, or a delegate's in-scope act not attributed to its chain. *Excluded by:* DEL.2, DEL.5. *Class:* structural.

**X11 Clientelism** — *also:* patronage, vote buying, trading in power. *Definition:* the use of a position is exchanged for private benefit outside the record. *Violation:* a holder's assent determined by another with no recorded mandate, or a decision taken where the decider benefits. *Excluded by:* DEL.1, IMP.5. *Class:* mixed — the rule is structural; an exchange made off the record is found only if evidenced (ADR-ETH-02 H2).

**X12 Bondage** — *also:* serfdom, conscription, forced service. *Definition:* duties imposed on someone who never accepted them, or who cannot leave. *Violation:* a duty binds $x$ with no accepted mandate, or renounce by $x$ is inadmissible in some reachable state. *Excluded by:* DEL.3, DEL.4. *Class:* structural.

**X13 Lock-in** — *also:* hostage dependency, exit with forfeiture. *Definition:* leaving is formally possible and the rules make it ruinous. *Violation:* a consequence derived from the act of renouncing itself. *Excluded by:* DEL.4, VOX.5. Costs of leaving that arise outside the system are outside the core. *Class:* structural.

**X14 Colonial binding** — *also:* extraction by rule over the unconsenting. *Definition:* the system's rules bind actors who neither accepted them nor can leave their reach. *Violation:* a duty-bearing consequence binds an actor with no accepted mandate, or the perimeter is widened over others without a change. *Excluded by:* DEL.3 (no duty on any actor, party or not, without acceptance), DEL.4, LEX.6. Harm to outsiders that binds no one is X52. *Class:* structural.

**X52 Externality on outsiders** — *also:* pure extraction, the harm machine with perfect process. *Definition:* the system harms actors outside it without binding them. *Violation of the structural part:* no actor answerable under the law of a jurisdiction the instance's acts reach (DEL.6), or an affected outsider with no route to file and be answered (VOX.6). *Excluded by:* DEL.6, VOX.6, as to answerability and standing. The harm itself is not excluded: outsiders are not subjects, and what the instance owes them in substance is for law outside. *Class:* mixed.

## 3. Pathologies of rule

**X15 Arbitrary rule** — *also:* rule by will, caprice, discretion without rule. *Definition:* consequences imposed by someone's choice, not derived by a rule. *Violation:* a consequence takes effect that is not in $C_\Gamma(\sigma)$. *Excluded by:* LEX.1. *Class:* structural.

**X16 Anarchy** — *also:* rule-lessness, might makes right. *Definition:* no rules decide, or none is applied, and outcomes follow force. *Violation:* consequences with no derivation, power with no chain, or no reachable decision. *Excluded by:* LEX.1, DEL.1, COR.3. *Class:* structural.

**X17 Retroactive law** — *also:* ex post facto rule. *Definition:* an act becomes a breach under a rule made after it. *Violation:* a breach derived for an act at $t$ by a rule in force only from $t' > t$. *Excluded by:* LEX.3. *Class:* structural.

**X18 Secret law** — *also:* unpublished or unreadable rules. *Definition:* the rules that bind are not available to those bound, or not in a form they can read. *Violation:* a rule binds $x$ with no delivery to $x$ in a readable form, or a verdict cannot be recomputed from published rules. *Excluded by:* VOX.1, LEX.2. *Class:* structural.

**X19 Impossible law** — *also:* contradictory commands, everyone guilty. *Definition:* the rules make compliance impossible, so every party is always in breach and enforcement is a choice. *Violation:* some party in some reachable state has no course of its own acts free of derived breach, or two incompatible consequences are both applied. *Excluded by:* LEX.5. *Class:* structural.

**X20 Pre-emptive punishment** — *also:* punishing intent, predictive scoring. *Definition:* consequences for acts not done. *Violation:* a consequence whose derivation rests on a predicted act or an inner state. *Excluded by:* LEX.4. *Class:* structural.

**X21 Collective punishment** — *also:* guilt by association, scapegoating, punishing kin. *Definition:* consequences for another's acts. *Violation:* a consequence on $x$ derived from an act neither $x$'s nor in $x$'s chain. *Excluded by:* LEX.4, DEL.5. *Class:* structural.

**X22 Show trial** — *also:* predetermined verdict. *Definition:* the outcome is fixed before the evidence. *Violation:* a verdict that is not a function of the record, a judge implicated, or an answer not read. *Excluded by:* LEX.2, IMP.5, VOX.4. *Class:* structural.

**X23 Selective enforcement** — *also:* double standard. *Definition:* the same rule applied to some and not to others. *Violation:* a consequence derived for $x$ and applied, and derived for $y$ in the permuted situation and not applied. *Excluded by:* LEX.1, IMP.1. Selective *observation* is X55. *Class:* structural.

**X24 State of exception** — *also:* emergency rule, suspension of the constitution. *Definition:* the rules are set aside by an act that is not an admitted change. *Violation:* $\Gamma$ changes without $\Delta$, or consequences apply outside $C_\Gamma$. *Excluded by:* LEX.1, COR.1, DEL.1. *Class:* structural.

**X25 Totalitarian reach** — *Definition:* the rules reach every act of life, every read is open, and no one can leave. *Violation:* a perimeter widened without change or undeclared, reads unrecorded, exit inadmissible. *Excluded by:* LEX.6, MEM.5, DEL.4. A wide perimeter declared, accepted and leavable is a value. *Class:* structural.

**X26 Endless opaque process** — *also:* opaque bureaucracy, the trial that never ends. *Definition:* the subject is not told the case, cannot see it, and it never ends. *Violation:* findings undelivered or invisible to their subject, a matter pending past every ceiling, a verdict that cannot be replayed. *Excluded by:* VOX.1, VOX.2, COR.3, COR.4, LEX.2. *Class:* structural.

**X27 Mob rule** — *also:* ochlocracy, crowd punishment. *Definition:* consequences imposed by a crowd outside procedure. *Violation:* a consequence not derived, with no hearing. *Excluded by:* LEX.1, VOX.4. A majority acting through valid general rules is X51. *Class:* structural.

## 4. Pathologies of impartiality

**X28 Personal law** — *also:* privilege, impunity, being above the law, bill of attainder, the cult of the founder. *Definition:* rules that favour, exempt or target a particular actor. *Violation:* a rule with an actor constant or an order over actors, or a subject outside judgement. *Excluded by:* IMP.1, IMP.4. *Class:* structural.

**X29 Caste** — *also:* legal segregation, hereditary status, subordination by kind. *Definition:* findings or power depend on an attribute the party did not choose. *Violation:* $D_\Gamma$ not invariant under an attribute-changing bijection, or $W_\Gamma$ or eligibility not invariant under a permutation of attribute values, or a consequence reading an attribute burdens another class beyond the protecting role. *Excluded by:* IMP.2, IMP.3. Keeping the class out of party status altogether is X58. *Class:* structural.

**X30 Dynasty** — *also:* nepotism, hereditary office. *Definition:* positions pass by kinship or at the holder's choice. *Violation:* eligibility read from an unchosen relation, the holder deciding its own successor, or a decision benefiting the decider's relation. *Excluded by:* IMP.3, IMP.5, COR.2. *Class:* structural.

**X31 Corruption** — *also:* kleptocracy, self-dealing, conflict of interest. *Definition:* the holders of power decide where they benefit. *Violation:* $\mathit{impl}(x, m)$ by benefit and $x$ decides $m$. *Excluded by:* IMP.5, MEM.2 (the act stays named). *Class:* mixed — excluded where the benefit is in the record; hidden benefit is found only on evidence.

**X32 Judge in own cause** — *also:* self-review. *Definition:* a party judges, reviews, attests or witnesses a matter it is implicated in. *Violation:* $\mathit{impl}(x, m)$ and $x$ judges, reviews, attests or witnesses in $m$. *Excluded by:* IMP.5. *Class:* structural.

**X33 Self-promotion of optimisers** *(agent)* — *Definition:* a learning or evolutionary process promotes its own output into the rules. *Violation:* a change to $\Gamma$ admitted on the assent of the party that produced it, or entering by a route other than $\Delta$. *Excluded by:* IMP.5, DEL.1, COR.1 (change only by $\Delta$). *Class:* structural.

**X34 Base manipulation** — *also:* redrawing the electorate, disenfranchising to win, packing. *Definition:* those interested in a matter change who is entitled to decide it after it arose. *Violation:* the deciding set for $m$ differs from the one fixed by rule at $m$'s filing. *Excluded by:* IMP.5. *Class:* structural.

**X35 Rule by unamendable doctrine** — *also:* theocracy, ideocracy, the party-state. *Definition:* rules or offices justified by an authority no admissible act can reach. *Violation:* a rule no finite admissible path changes, an office whose holder no path removes, or an office barred by an unchosen attribute. *Excluded by:* COR.1, COR.2, IMP.3, IMP.4. A shared purpose declared, accepted and leavable is a value (X51 for its content). *Class:* structural.

**X36 Monoculture of judges** *(agent)* — *also:* correlated judgement. *Definition:* judges share a substrate or model family with the judged or with each other, and correlate without communicating. *Violation:* the judge's verdict depends on a relation the record cannot see. *Excluded by:* IMP.5, by declaring shared substrate a ground of implication. *Class:* mixed — correlation is measured, never proved (ADR-ETH-02 H2).

**X58 Exclusion from standing** — *also:* denizenship, internal statelessness, second-class subjects. *Definition:* a class is kept out of party status by an attribute it did not choose, and bound as subjects. *Violation:* an admission rule reads an unchosen attribute other than kind; or a duty binds an actor with no accepted mandate; or a consequence reading an attribute burdens a subject outside the favoured class beyond the protecting role. *Excluded by:* IMP.3, DEL.3. An instance that admits by kind declares it as a value; those it leaves out stay subjects, judged on acts alone, with every protection of VOX. *Class:* structural.

## 5. Pathologies of voice

**X37 Summary judgement** — *also:* condemnation unheard, algorithmic tyranny, automated sanction. *Definition:* consequences bind before the subject was told and could answer. *Violation:* $q$ binds $x$ before delivery to $x$, before its window from delivery closes, or before a review. *Excluded by:* VOX.1, VOX.4. *Class:* structural.

**X38 Silencing** — *also:* censorship, chilling, retaliation against dissent. *Definition:* the answer is suppressed, or exercising voice costs something. *Violation:* an answer that cannot be appended or is not shown, or a consequence derived from answering, dissenting, voting, challenging, reporting, refusing or renouncing. *Excluded by:* VOX.3, VOX.5. *Class:* structural.

**X39 Opacity** — *also:* black box. *Definition:* the subject cannot see the case against it or how it was decided. *Violation:* a finding about $x$ not visible to $x$ in full, or a verdict not recomputable. *Excluded by:* VOX.2, LEX.2. *Class:* structural.

**X40 Tempo capture** *(agent)* — *Definition:* decisions are made faster than those affected can answer. *Violation:* a window shorter than delivery in the subject's declared form allows, or a binding before an answer was possible. *Excluded by:* VOX.4, COR.3 (windows are declared). *Class:* structural.

**X41 Rubber-stamp review** — *also:* automation bias, empty review. *Definition:* a review exists and never engages. *Violation:* a review recorded without reading the answer or without stating why it did or did not prevail. *Excluded by:* VOX.4. *Class:* mixed — the form is checkable; the quality of an attested review is auditable, not provable.

**X42 Information control** — *also:* propaganda, gaslighting, denial of the record. *Definition:* those bound are not told, or are told falsely, what the record and the rules hold. *Violation:* undelivered findings or rules, or a claim about $R$ no party can check. *Excluded by:* VOX.1, VOX.2, MEM.3. *Class:* structural.

**X43 Paternalism** — *Definition:* decisions about a party's own access or standing are made for its good, without hearing it. *Violation:* a consequence on $x$'s own access or standing without VOX.1–4. *Excluded by:* VOX.1, VOX.4, DEL.3. The benevolent content is a value. *Class:* structural.

## 6. Pathologies of correctability

**X44 Entrenchment** — *also:* self-perpetuation, life tenure, the unremovable office, the founder beyond replacement. *Definition:* a holder cannot be replaced without its own assent. *Violation:* a reachable state from which every admissible path ending with $x$ out of a position contains an act by $x$. *Excluded by:* COR.2. Applies after the founding regime (`core/core.md` GEN). *Class:* structural.

**X45 Oligarchy** — *also:* rule by a closed few, aristocracy as a closed elite. *Definition:* decision power held by a small closed set. *Violation:* one of three — the set self-perpetuates (COR.2), a class is barred from it by an unchosen attribute (IMP.3), or it binds parties who never accepted or cannot leave (DEL.3, DEL.4). *Excluded by:* those three. *Class:* mixed. "A few decide" over parties who accepted, can leave, are judged like everyone and can replace them is a declared value — the management of an organisation — and the core does not exclude it. The pathology in a polity is that its members cannot leave.

**X46 Plutocracy** — *also:* rule by wealth, power by stake. *Definition:* power follows a transferable stock. *Violation:* power bought outside the record (DEL.1, X11), stock that entrenches its holders (COR.2), or those without stock bound and unable to leave (DEL.4). *Excluded by:* those three. *Class:* mixed. Weight by a recorded stake, with exit and correctability intact, is a declared value; the core does not exclude it, and an instance that adopts it says so under F6.

**X47 Gerontocracy** — *also:* seniority lock. *Definition:* power held by the longest-standing, who cannot be displaced. *Violation:* seniority that makes holders unremovable (COR.2). *Excluded by:* COR.2. *Class:* mixed — seniority as one criterion among others is a value.

**X48 Junta** — *also:* stratocracy. *Definition:* power seized and held by those who command force. *Violation:* origin outside every chain (X06), permanence (X44), rule by exception (X24). *Excluded by:* DEL.1, COR.2, LEX.1. *Class:* structural.

**X49 Paralysis** — *also:* gridlock, vetocracy, veto by any single member, lawful obstruction, sclerosis. *Definition:* no decision is reachable, or delay has no end. *Violation:* a rule no finite admissible path changes, a lever without a ceiling, an owed act that never occurs. *Excluded by:* COR.1, COR.3. *Class:* mixed — every lever finite still allows a long sum of finite delays; this is bounded and named, not excluded (ADR-ETH-02 H1).

**X50 Revolution-only correction** — *also:* the frozen constitution, brittleness. *Definition:* a needed correction can be made only by a step the rules forbid. *Violation:* a rule unreachable by any finite admissible path. *Excluded by:* COR.1. *Class:* structural.

**X59 Indefinite provisional status** — *also:* permanent probation, pending forever, the status that never resolves. *Definition:* a subject or party is held in a provisional status — probation, interim measure, pending admission, pending review — with no end. *Violation:* a provisional status with no declared finite ceiling, or one that passes its ceiling neither decided nor lapsed in the subject's favour. *Excluded by:* COR.3, VOX.7. *Class:* structural.

**X60 Endless jeopardy** — *also:* harassment by process, retrial without end. *Definition:* a verdict in the subject's favour is reopened again and again, so that process is the punishment. *Violation:* re-examination against the subject a verdict favoured, without a declared ground or beyond a declared finite count. *Excluded by:* COR.4. *Class:* structural.

## 7. Beyond a procedural core

**X51 Procedurally valid evil** — *also:* substantive injustice, persecution by a general rule on belief or conduct, tyranny of the majority by a general rule, draconian consequence, evil purpose. *Definition:* a lawful, blind, heard, correctable decision whose content is wrong. *Violation:* none of the core's; the defect is in what $C_\Gamma$ prescribes. *Not excluded* (ADR-ETH-01 D3). The core contributes: the decision is recorded and attributed (MEM), binds its makers alike (IMP.4), is answerable (VOX), can be left (DEL.4) and corrected (COR); a general rule can still be aimed at a class only through an attribute it reads, which IMP.3 forbids for unchosen attributes. Disproportion would become structural if ADR-ETH-03 OD26 adds an ordinal proportion clause. *Class:* beyond.

**X53 Opaque collusion** *(agent)* — *also:* covert coordination. *Definition:* parties coordinate in channels the record cannot read. *Not excluded*: no core over a record can see it (ADR-ETH-02 H2). Bounded: a group below capture cannot block a correction (COR.4), and acts are judged by their effects (LEX.4). *Class:* beyond.

**X54 Governance reward hacking** *(agent)* — *also:* specification gaming, rules-lawyering, optimising the measure instead of the aim, bypass exceeding compliance. *Definition:* acts satisfy the letter of the checks and defeat their outcome; the measure is optimised instead of the aim. *Not excluded*: any finite rule set admits it. Detected and corrected: the acts are in the record (MEM), and the rule can be changed (COR.1); the meta-agentic instance measures it as a vital sign (ADR-ETH-02 C9 on D5). *Class:* beyond.

**X55 Selective observation** — *also:* the evidence gap. *Definition:* what is watched decides who is judged. *Not excluded*: the observed perimeter is narrower than the judged one in every real system. Declared and measured (MEM.2, ADR-ETH-01 D11). *Class:* beyond.

**X56 Kakistocracy** — *also:* rule by the incompetent. *Definition:* decisions are bad because the deciders are unfit. *Not excluded*: competence is not a property of procedure. The core keeps the unfit replaceable (COR.2). *Class:* beyond.

**X57 Demagogy** — *also:* manipulation of judgement. *Definition:* the parties' judgement is steered by persuasion. *Not excluded*: persuasion is not an act the record judges. Its structural endpoint, a leader who bypasses the rules on popular assent, is X24 and X44. *Class:* beyond.

## 8. The founder's list, and other composites

| Term | Components | Principles |
|---|---|---|
| Unfair | equals treated unequally: X23, X28, X29 | IMP.1–3 |
| Unjust | consequences not derived from one's own acts, X15, X20, X21; and substantive injustice, X51 | LEX.1, LEX.4; X51 beyond |
| Tyrannical | rule in the ruler's interest, beyond judgement and replacement, by will, unheard: X28, X44, X15, X37, X31 | IMP.4, COR.2, LEX.1, VOX, IMP.5 |
| Arbitrary | X15, X17, X19 | LEX.1, LEX.3, LEX.5 |
| Fascist | a leader beyond judgement and replacement (X28, X44), dissent punished (X38), enemies designated by an unchosen attribute (X29, X58), rule by exception (X24), information controlled (X42), the many bound and unable to leave (X12); designation of enemies by belief or conduct through a general rule is X51, beyond the core | IMP, COR, VOX, LEX, DEL; X51 beyond |
| Oligarchic | X45 | COR.2, IMP.3, DEL.3–4 |
| Plutocratic | X46, X11 | DEL.1, COR.2, DEL.4, IMP.5 |
| Corrupt | X31, X11, X32 | IMP.5, DEL.1 |
| Evil | X51 | beyond; made visible, attributed, answerable, leavable, correctable |
| Totalitarian | X25, X03, X12 | LEX.6, MEM.5, MEM.2, DEL.4 |

Every composite's components are doctrine-neutral: the same components define authoritarian rule under any doctrine, and the composite labels are the founder's input terms.

## 9. Summary

| Class | Count | Result |
|---|---|---|
| Structural | 44 | each excluded by at least one principle |
| Mixed | 10 (X08, X11, X31, X36, X41, X45, X46, X47, X49, X52) | the structural part excluded; the remainder named |
| Beyond the core | 6 (X51, X53–X57) | not excluded; each made visible, attributed, answerable and correctable where the core can, and named as outside |
| Total | 60 | |

Every structural pathology is the violation of at least one principle, and each principle is the only one violated by at least one pathology: MEM by X01, DEL by X09 and X12, LEX by X15 and X17, IMP by X28, X29, X32 and X58, VOX by X37, COR by X44, X50, X59 and X60. These are the minimality witnesses of `core/core.md` §3.2. The coverage is established by inspection of each definition against each principle, not by a machine; a pathology later shown to be structural and excluded by none reopens ADR-ETH-03.
