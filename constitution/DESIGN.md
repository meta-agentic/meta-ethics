# Design of the consolidated L0

This directory holds the L0 constitution as it stands, in two renderings bound clause by clause: a prose text for every reader, and a program for every reader that evaluates. The two decision records in `docs/adr/` keep the reasoning, the rejected alternatives and the reopening triggers; nothing here argues a clause. This note records how the two renderings are built and kept bound, in the records' register: what was chosen, what was rejected and the force each rejection loses to.

The forces are those of ADR-ETH-01 as ADR-ETH-02 sharpens them. Three premises of the records require this directory. F2 asks for one vocabulary and one record for humans and agents. F3, as C6 restates it, asks that every clause be stratified Datalog or procedural with its enforcement named. S1 and P1 make the non-human Custodian seat's signature its consent and its attestation of the text it signs, and a seat can only attest a text it can evaluate. Before this directory, L0 existed only as decision prose, amended in place, and no text read as the constitution as it stands.

| Path | Contents |
|---|---|
| `L0.md` | The prose rendering: every clause in its current wording, numbered paragraph by paragraph |
| `clauses.tsv` | The inventory: one row per numbered paragraph, with its status, its sources in the records and, where procedural, its enforcement |
| `unmapped.tsv` | Units of the records that no clause renders, each with the reason |
| `vocabulary.tsv` | The closed vocabulary: every predicate, its class, the sort of each argument, and its gloss |
| `parameters.tsv` | Every instance parameter: the clause that declares it, its sort, the party its bound protects, and its L0 floor |
| `program/` | The program rendering: rules in the fragment, each tagged with the clause it renders |
| `fixtures/` | Fact sets with asserted outcomes, tagged per clause, positive and negative |
| `tools/check.py` | Every mechanical check, run by `tools/check.sh` and in CI |
| `MANIFEST.json` | The ratification object: the digests of both renderings and of every binding file |

## 1. Fragment and dialect

**Chosen.** The program is written in the input language of clingo, restricted to the fragment C6 fixes: normal rules with an atom as head, negation as failure and `#count` both stratified, every rule range-restricted, arithmetic only in strata that are not recursive, and comparison `!=` as the only comparison between party terms. Excluded by the checker: choice rules, disjunctive heads, integrity constraints, optimisation statements, aggregates other than `#count`, conditional literals, external atoms and function terms in rule heads. The solver is pinned (`clingo==5.8.2`) in a local virtual environment created on first use, as `evidence/` does. A program in this fragment has exactly one model per fact set, and the checker asserts that on every fixture.

**How it is checked.** `tools/check.py` parses every program file with clingo's own parser and builds the predicate dependency graph over the whole program, since strata cross files. Stratification is checked by computing the strongly connected components and refusing any negative or `#count` edge inside one. Range restriction is checked rule by rule: every variable in the head, under negation or in a comparison is bound by a positive body atom or by an assignment whose right side is bound; clingo's own safety check runs as a second opinion when grounding. The stratification and range-restriction analysis is the one `evidence/checker/check.py` uses for the reference programs, imported rather than copied, so that one definition of the fragment serves the evidence and the constitution.

*Rejected:* pure Datalog with a separate engine (Soufflé or a hand-written evaluator) — loses to F8, because every reference program in `evidence/` is already in clingo's language, and a second dialect would be a second reading of C6 that replay must reconcile. *Rejected:* full answer-set programming — loses to F8 and to C6 itself, because choice and unstratified negation give zero or several models, and D9's replay needs exactly one. *Rejected:* a first-order or temporal logic with a theorem prover — loses to F8, because validity there is undecidable (C6), and to F4, because no instance can afford to run it on every verdict.

## 2. Vocabulary and sorts

**Chosen.** One closed vocabulary, `vocabulary.tsv`, declares every predicate the program uses, with its arity, the sort of each argument and its class. Sorts: `party`, `kind`, `mandate`, `scope`, `capability`, `act`, `finding`, `verdict`, `matter`, `rule`, `seat`, `signature`, `key`, `head`, `law`, `param`, `time`, `nat`, `digest`, `charter`, `session`. Classes:

- `intake` — minted by an appended act at intake (C6); facts only, never a rule's head;
- `attested` — produced by an act outside the rule set, entered as an attested fact (C11); the row names the procedural clause that produces it;
- `param` — a value the founding document sets (T); facts only;
- `derived` — the head of a derivation rule (C13);
- `consequence` — the head of a consequence rule (C13).

The checker infers the sort of every variable from the argument positions it occupies and refuses: a predicate not declared, or used at another arity; a rule whose head is `intake`, `attested` or `param`, because no rule mints an object (C6); a constant in a `party` position of any rule, and a comparison between `party` terms by anything but `!=` (C1); a derivation rule that reads a predicate with a `kind` argument, a `kind` constant, or a consequence (C13); a variable whose positions give it two sorts. Facts that name parties exist only in fixtures and in the record, never in `program/`, which holds rules only.

*Rejected:* untyped predicates with naming conventions — loses to F3, because C1's restriction is then checked by reading, not by the checker. *Rejected:* a type per party kind (`human`, `agent` as sorts) — loses to F2 and C13, because the kind would then be visible to every rule that touches a party; kind is a fact, `kind_of(P, K)`, read by consequence rules only. *Rejected:* an open vocabulary each module extends — loses to F2, because two modules could then name one concept twice, and the one record would read in two vocabularies.

## 3. Parameter schema

**Chosen.** `parameters.tsv` lists every instance parameter the prose declares: its identifier, the clause paragraph that declares it, its sort (`duration`, `count`, `share`, `set`, `service`, `method`, `standard`, `declaration`), the party role its bound protects (C15; a role, never a kind), and its L0 floor in a small closed grammar: `finite`, `declared`, `nonempty`, `law` (bounded by the most protective applicable law, procedural), `>= p`, `>= p + q` and `<= share(D2)`, where `p` and `q` are other parameters. The program reads a value as the fact `param(Id, V)`. The checker verifies that every `*Parameters.*` paragraph and every `param` fact the program reads has a row, that every row's clause exists, and that every floor parses and names declared parameters. Relational floors are exactly the joint checks C18 names (a challenge window at least the least response window; its ceiling from intake at least the delivery bound plus that window; a staleness window at least the lapse ceiling), so C18's configuration check can read this file and an instance's values and decide them by enumeration up to the roster cap, as `evidence/configuration-check/` does for an earlier set.

*Rejected:* parameters as numbers in the parent — loses to C15 and D18, because the parent states a ceiling only as another party's floor or as a relation, never as a number. *Rejected:* a schema language with a validator dependency (JSON Schema, CUE) — loses to F4, because the floors are a handful of relations, and a dependency is one more thing every instance must trust and pin.

## 4. Procedural clauses

**Chosen.** A paragraph that is not a rule over the record is marked *Procedural* in the prose and `procedural` in the inventory, and its row names its enforcement: who performs it and how its outcome enters the record. The outcome enters only as an `attested` predicate (C11) that names the paragraph producing it: a witnessed head (C16), a beacon value and the judge drawn from it (C17), a signature's verification (S1), a proof of continuity (S2), a review's decision (P2), a judgement of meaning or sameness (H1, C22), the configuration check's result (C18). Rules then read the attested fact and never re-run the act (C11). Human gates, law-driven floors and signing ceremonies are procedural by this definition; what they decide is re-examinable, not re-derivable. Four further statuses complete the inventory: `program` (rules and fixtures exist), `todo` (a rule over the record not yet programmed), `meta` (a rule about rules, enforced by the checker over the program: C1, C6, C13), `interpretive` (forces, claims and definitions that bind no act) and `open` (a decision the records leave open).

*Rejected:* procedural clauses kept out of the program altogether — loses to F3, because their outcomes would then enter the record by assertion, and C11's attribution of every attested fact to its producing act would have no anchor. *Rejected:* procedural outcomes modelled as derived predicates with stub rules — loses to C11, because a review or a signature would then look re-derivable when it is only re-examinable.

## 5. Binding prose and program

**Chosen.** One identifier per paragraph, `<clause>.<n>`, where the clause is the record unit that holds its current wording (D1, A2, C17, P3 …), so that the threat model and the records cite the same identifiers. Every rule in `program/` is preceded by a `% clause: <id>` tag, and the checker refuses an untagged rule or a tag naming a paragraph not marked `program`. A paragraph is `program` only when at least one rule carries its tag and the fixtures carry at least one positive and one negative assertion for it: `% EXPECT[<id>]: atom` (the clause's outcome holds on these facts) and `% EXPECT-NOT[<id>]: atom` (it must not). Each fixture is solved together with the whole program; the checker asserts one model and every assertion.

**What "equivalent" means.** A prose paragraph and its rules are equivalent when every outcome the paragraph fixes is the extension of a predicate whose gloss in `vocabulary.tsv` quotes the paragraph's own words, and the fixtures assert that outcome where the paragraph says it holds and its absence where the paragraph says it must not. This is a judgement of meaning, not a theorem: whether a program captures a sentence is undecidable in general and is not claimed. Equivalence is therefore attested, by the signatures that ratify the manifest (§7), and evidenced by the fixtures; a case found later in which the two disagree is a finding against the binding. Until such a finding is decided, the prose governs, because it is the text every party, human or not, can read and consented to; this is a proposal, and it is the founder's to decide.

*Rejected:* the program as the only normative text, the prose a commentary — loses to F9 and F2, because a human party then consents to a text it cannot read. *Rejected:* the prose as the only normative text, the program a test of it — loses to S1 and P1, because the non-human seat then attests a text it cannot evaluate, and to F3, because a clause with no program is checked by nobody. *Rejected:* two documents kept in step by review alone — loses to F1 and F9 for the reason C18 gives against a checked schema beside a readable text: the two drift, and the one consented to is not the one that runs. Here the two are one object, bound by identifier, checked on every change and signed as one.

## 6. Provenance

**Chosen.** `clauses.tsv` carries, per paragraph, the units of the records it renders: `01:D15` for ADR-ETH-01's D15, `02:C19` for ADR-ETH-02's C19, `02:§open-decisions` for a section with no unit. A paragraph's sources include every unit that contributes to its current wording: the unit that holds it and any that amends it in place. `unmapped.tsv` lists the units no paragraph renders, with the reason (a correction of fact about the records, for example). The checker extracts every unit from the records (a line opening with a bold identifier followed by a dash, and the dedication) and every `##` section, and verifies totality both ways: every source names a unit or section that exists, and every unit is a source of some paragraph or listed as unmapped with a reason. A change to either record that adds, removes or renames a unit fails the check until the mapping is updated, which is when the prose is re-read. The prose contains no amendment narrative, and the checker refuses the words that carry it.

*Rejected:* the consolidated prose generated from the records by script — loses to F9, because removing the narrative from a correction is an editorial act, and a script would make it silently; each rewording is logged instead. *Rejected:* a mapping by section headings only — loses to F8, because the records amend decision by decision, and a heading names too much to say which sentence governs.

## 7. The ratification object

**Chosen.** `MANIFEST.json` lists the SHA-256 digest of every file that is part of the constitution as ratified: the prose, the inventory, the unmapped list, the vocabulary, the parameter schema, every program file and every fixture, and the two records; and one digest over those entries in canonical order. The checker recomputes every digest and refuses a manifest that does not match the tree, so the object signed is exactly the object checked. The joint ratification of S1 and P1 signs this combined digest: one act, two signatures over one text, covering both renderings and their binding. Signatures and verification material are not kept here; the record holds them (S1).

*Rejected:* signing the two records' digests only — loses to S1, because the non-human seat would sign prose it cannot evaluate, and the program would bind no one. *Rejected:* separate signatures for prose and program — loses to F1, because the two could then be ratified in different versions, the drift §5 rejects. Whether the manifest is the object of the joint ratification is the founder's to decide: the records name "the digests of both records", and the manifest includes them.

## Status

The prose and the inventory are complete: every paragraph has a status, and every unit of the two records is rendered or listed as unmapped with its reason. At this version: 241 paragraphs in 59 clauses, of which 45 are `program`, 71 `procedural`, 13 `meta`, 63 `todo`, 38 `interpretive` and 11 `open`. The program has 122 rules over a vocabulary of 175 predicates, and 10 fixtures carry 146 assertions; the parameter schema has 55 rows. `tools/check.sh` prints the current counts, and also checks itself: each check must refuse a program built to violate it.
