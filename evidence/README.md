# Evidence: reference programs and recorded runs

The constitution claims some results as **checked** and some as **tested**:

- **Checked** results were verified exhaustively, within stated bounds, by a program whose expected outputs are asserted.
- **Tested** results come from simulations with stated trial counts, so their figures are estimates.
- A few figures are **computed**: worked out from a declared shape, with no search.

This directory holds those programs together with a recorded run of each, so every figure the paper formalising ADR-ETH-01 and ADR-ETH-02 quotes from them can be re-run and compared.

A checked or tested result is evidence about a model, not about the world. The constitution never cites one against a complaint.

## Reproduce

```sh
evidence/run.sh --check          # re-run everything, compare with the recorded outputs
evidence/run.sh --check draw     # one experiment
evidence/run.sh                  # re-run and overwrite the recorded outputs
```

`run.sh` creates `evidence/.venv` on first use and installs the pinned solver from `requirements.txt` into it. The venv is not committed. Every random generator is seeded, so `--check` expects byte-identical output.

| Tool | Version used for the recorded runs |
|---|---|
| Python | 3.14.6 |
| clingo (answer-set solver; PyPI package `clingo`, used through its Python API) | 5.8.2 |

`checker/check.py` is the fragment checker shared by every `.lp` program. For each program it:

- parses the program with clingo's AST;
- checks that negation and `#count` are stratified on the predicate dependency graph;
- checks that every rule is range-restricted;
- checks that arithmetic occurs only in non-recursive strata;
- checks that `#count` is the only aggregate;
- solves the program, counts its answer sets, and asserts the program's `% EXPECT:` / `% EXPECT-NOT:` lines against the model.

It exits non-zero if any assertion fails. A program reported non-stratified is not a failure, because some fixtures exist to show exactly that.

## Index

Results are named by their titles in the paper's section "Theses, theorems and the robustness perimeter".

| Result | Figure(s) | Experiment | Tier |
|---|---|---|---|
| Steering the draw | 0.998 at 60 candidate heads; 0.20 / 0.38 live against 0.10 frozen; 0.41 at k=5, 0.88 at k=20; 0.19 at one bit, 0.815 at four; removal cost ≈ N/2 either way; per-judge frequency 0.096–0.103 | [`draw/`](draw/) | tested (exact where stated) |
| Symmetry of the rules (the draw's uniformity) | 0.096–0.103 against 0.100; only `drawn` and `rank` asymmetric under renaming | [`draw/`](draw/), [`reference-shapes/`](reference-shapes/) | tested |
| Correlation is not collusion | 0.86; detection 0.07 at a 1% rate; exclusive-or 400/400 | [`coordination/`](coordination/) | tested |
| The covert channel cannot be closed | payload recovered from schema-valid facts | [`coordination/`](coordination/) | limit (illustrated) |
| The summed measure is not monotone | 36 edges against 0 | [`correctability-games/`](correctability-games/) | checked |
| Unbounded levers defeat closure | the outsiders win with finite ceilings and lose without them | [`correctability-games/`](correctability-games/) | checked |
| Memory is needed under imperfect information | 0 of 9 memoryless; 6 of 6 with memory | [`correctability-games/`](correctability-games/) | checked |
| Whole-state checking does not scale | 1e32.4 at ten parties, 1e376.3 at fifty; per-finding 252–2304 | [`correctability-games/`](correctability-games/) | computed |
| Exclusion is a capture lever unless the base is fixed | 3 of 8 at one half passes after 2 exclusions; frozen base never passes | [`exclusion/`](exclusion/) | checked |
| Superset conformance fails a more protective instance | three runs: fails, holds, fails | [`superset/`](superset/) | checked |
| Grounded argumentation is not in the fragment | seven programs; even cycle 2 models, odd cycle 0 | [`argumentation/`](argumentation/) | checked |
| An ordering must bind at filing | bound at filing keeps the winner; as of now flips it | [`argumentation/`](argumentation/) | checked |
| Owed acts must not spend capacity | breach with two attackers; excused on 8 of 10; reserve = pool | [`owed-acts/`](owed-acts/) | checked |
| A timestamp authority cannot prove a fork | fork unprovable under the timestamp authority, provable under the log; 10 assertions | [`witness-fork/`](witness-fork/) | checked |
| The configuration check catches dead documents | five configurations; first passable roster 3 → 5 | [`configuration-check/`](configuration-check/) | checked |
| Keyed views re-identify | three of four others; 10 assertions | [`keyed-views/`](keyed-views/) | checked |
| A per-party reply credential re-links | 6 assertions | [`reply-credential/`](reply-credential/) | checked |
| Bundle replay is unsound | 3 assertions | [`bundle-replay/`](bundle-replay/) | checked (counterexample) |
| Appendix "Reference fixtures" | three listings, verbatim: 6/6, 2/2, 3/3 | [`appendix-fixtures/`](appendix-fixtures/) | checked |
| The fragment's reference shapes | five stratified programs, two that are meant to fail stratification | [`reference-shapes/`](reference-shapes/) | checked |

Each experiment directory holds the program(s), a `run.sh` entry point, the recorded `output.txt`, and a README. The README states what the experiment computes and which figure to read from the output.

## Provenance

These programs were written while the first amendment was being decided, and were first run then. Before publication:

- files were renamed;
- comments that pointed to working notes outside this repository were rewritten to name the clauses of ADR-ETH-01 and ADR-ETH-02 instead;
- seven printed header or label lines were reworded the same way.

No rule, fact, parameter, seed or computation changed. Every experiment was re-run with the tools above, and its output was compared with the original run. Every figure, assertion and model count is identical; the only differences are the reworded label lines.

One quoted figure is a rounding matter, not a reproduction failure. Four bits of beacon bias give exactly 1 − 0.9¹⁶ = 0.8147, which the program prints as 0.815. To two decimals that is 0.81.
