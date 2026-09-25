# meta-ethics

## In plain words

More and more work is done by software agents acting for someone: an AI that files a report, merges a change or answers a customer on a company's behalf. Soon, many of these agents will work alongside people in the same organisation, and they will disagree, make mistakes, and sometimes misbehave. Someone has to decide what is allowed, who gets the last word, and what happens when things go wrong.

This project writes the **rulebook for such mixed groups of people and agents**, a constitution. It is written so that a program can apply it, not just so that people can read it. Its main commitments:

- **The same rules for everyone.** A human and an AI agent carry the same duties and are judged on the same record. No rule may name or favour a particular individual.
- **Nobody stands outside.** Anyone whose action has an effect inside the system is inside it too, observed or not. There is no neutral outsider who escapes the rules, not even the referee.
- **A record, not a score.** The system keeps a factual, append-only history of what happened. It does not turn people into ratings, because a rating already contains a judgement.
- **Able to heal itself, in small steps.** A healthy system notices its own illnesses early and corrects them through its normal procedures. A revolution, a change the rules forbid, is the symptom of a system that let a problem grow too big. The aim is to make every needed correction a small, permitted one.
- **A last word that can be replaced.** Someone must break ties and veto, but that seat can never block its own replacement.
- **Honest about its limits.** Some things can be proved, such as that the rules treat everyone symmetrically and always give the same answer on the same facts. Others cannot, such as whether the facts themselves or the authors are neutral. The text says which is which.

It is developed **in the open, before it is finished,** so that anyone can see how the decisions were reached, including the ones that turn out to be wrong.

*A note on this repository's history:* the project began inside a private repository. Before publication, its history was replayed once to remove references to another, private project and to its internal tracker. Dates, authorship, order and every decision are unchanged; nothing else was edited.

**Where to start:** the two session records in `docs/` tell the story, and `docs/adr/` records each decision with the options it rejected.

---

## For practitioners

The **L0 constitution** for ecosystems of agents — human and non-human alike — who act under mandates delegated by parties for the common good, and who are judged by a neutral inference engine.

This repository produces **text, rules and test specifications**. It does not produce code. The reference kernel that evaluates these rules lives elsewhere; what is written here is what that kernel must enforce, and the fixtures that prove it does.

## What a constitution is here

It is loadable, not declamatory. Every clause is either expressible in stratified Datalog with negation, `neq`, `lt` and `count` — carried alongside the clause as its meta-rule — or explicitly marked procedural with its human enforcement named. A clause that cannot be tested is not adopted. A clause whose enforcement costs more than working around it trains bypass, and is redesigned or dropped.

It is **procedural, not substantive**: it encodes who decides, with which conflicts excluded, on what evidence. It is not a conscience, and it is complete only relative to the values of its authors. That limit is stated in the text rather than hidden.

## Parent and instance

meta-os is the parent and owns the constitution, the upper ontology, the conformance suite and the reference kernel. The parent is a **template with a conformance suite, not a running authority**: each instance is sovereign, with its own Custodian, assembly and committee. Instances are siblings: none holds standing over another, and adopting first confers nothing.

An instance adopts the constitution through a signed **genesis manifest** naming the parent version by hash, supplying parameter values within parent-fixed ranges, listing extension modules, and naming the first Custodian and initial mandates. Tailoring is **monotone**: an instance may add obligations and raise thresholds; it may not remove clauses or lower them. On the parent's fixtures the instance's findings must be a superset of the parent's.

A new parent version never propagates automatically. It arrives inside an instance as a `ratify`-class proposal, so an instance may lag and the lag is visible in its provenance. meta-os itself runs as an instance of its own constitution.

## Layout

| Path | Contents |
|---|---|
| `docs/adr/` | Architecture decision records. ADR-first: the constitution is preceded by an ADR recording why this shape and not another |
| `constitution/` | The L0 text, numbered clauses, each carrying its meta-rule or its procedural note |
| `threat-model/` | Good-will / bad-will matrix per party kind and per clause; which clause closes which attack, and which attacks remain open by design |
| `conformance/` | Fairness fixtures a kernel must pass: identity-permutation symmetry, identity-blindness of L1, determinism |
| `genesis/` | The genesis manifest schema and the genesis procedure |
| `docs/KICKOFF-meta-ethics-constitution.md` | The originating brainstorm (2026-09-18), held inside the project that first needed it. Decisions there are settled unless the owner reopens them |
| `docs/BRAINSTORM-2026-09-21-mathematics-of-ethics-and-revolution.md` | Second session: closure, the perimeter, conservation of the record, measure-not-score, and the formal frame — decisions D8–D21 and open decisions OD1–OD18, feeding ADR-ETH-01 |

## What is claimed, and what is not

**Provable:** determinism, identity-blindness (no L1 rule names an individual agent), and symmetry under permutation of agent identities.

**Not provable:** neutrality of the evidence, of the ontology, or of L0's authors.

The constitution claims only the first set, and makes the second auditable.

## Backlog

Tracked outside this repository, which carries no tracker state.
