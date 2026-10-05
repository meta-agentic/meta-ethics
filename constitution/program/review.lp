% Review of consequence-bearing verdicts, for every subject (A2, P2).
% `implicated` is a derivation; whether a consequence takes effect, and
% which kind of reviewer it needs, are consequence rules (C13).

% clause: A2.5 P2.1
implicated(S, V) :- verdict(V, S, _).
implicated(X, V) :- verdict(V, S, _), in_chain(X, S).
implicated(F, V) :- filed_by(V, F).
implicated(X, V) :- filed_by(V, F), in_chain(X, F).
window_passed(V) :- verdict(V, _, T), now(N), param(contest_window, W), N - T >= W.

% clause: P2.2 P2.5
needs_human_reviewer(V) :- consequence_on(V, P), kind_of(P, human).
reviewer_kind_ok(V, R) :- reviewed(V, R), not needs_human_reviewer(V).
reviewer_kind_ok(V, R) :- reviewed(V, R), needs_human_reviewer(V), kind_of(R, human).

% clause: A2.5 P2.1
review_done(V) :- reviewed(V, R), drawn_reviewer(V, R), not implicated(R, V),
                  reviewer_kind_ok(V, R).
takes_effect(V) :- verdict(V, _, _), bears_consequence(V), review_done(V), window_passed(V).
provisional(V) :- verdict(V, _, _), bears_consequence(V), not takes_effect(V).
