% Review of consequence-bearing verdicts, for every subject (A2, P2).
% `implicated` is a derivation; whether a consequence takes effect, and
% which kind of reviewer it needs, are consequence rules (C13).

% clause: A2.5 P2.1
verdict_subject(V, S) :- verdict(V, S, _).
verdict_subject(V, S) :- also_about(V, S).
implicated(S, V) :- verdict_subject(V, S).
implicated(X, V) :- verdict_subject(V, S), in_chain(X, S).
implicated(F, V) :- filed_by(V, F).
implicated(X, V) :- filed_by(V, F), in_chain(X, F).

% clause: C21.2 P2.1
implicated(X, V) :- benefits_from(X, V).
implicated(X, V) :- acted_in(X, V).

% clause: A2.5 H1.5
window_passed(V) :- verdict_delivered(V, T), now(N), param(contest_window, W), N - T >= W.

% clause: P2.2 P2.4 P2.5
needs_human_reviewer(V) :- consequence_on(V, P), kind_of(P, human).
needs_human_reviewer(V) :- verdict_subject(V, P), kind_of(P, human),
                           verdict_subject(V, P2), kind_of(P2, K), K != human.
reviewer_kind_ok(V, R) :- reviewed(V, R), not needs_human_reviewer(V).
reviewer_kind_ok(V, R) :- reviewed(V, R), needs_human_reviewer(V), kind_of(R, human).

% clause: P2.7 H3.4
founder_chain(F) :- founder(F).
founder_chain(R) :- founder(F), in_chain(R, F).
genesis_bar(R) :- reviewed(_, R), founder_chain(R), not regime_exited.

% clause: A2.5 P2.1 P2.7 H3.4 P1.7
review_done(V) :- reviewed(V, R), drawn_reviewer(V, R), not implicated(R, V),
                  reviewer_kind_ok(V, R), not genesis_bar(R).
takes_effect(V) :- verdict(V, _, _), bears_consequence(V), review_done(V), window_passed(V),
                  not withheld_verdict(V).
provisional(V) :- verdict(V, _, _), bears_consequence(V), not takes_effect(V).
