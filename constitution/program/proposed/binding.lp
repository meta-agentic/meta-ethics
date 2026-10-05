% The binding remedy, proposed and pending the founder's decision (BIND.2,
% BIND.3). These rules run only with fixtures/proposed/; the program in force
% does not load them, and no rule here derives a predicate the program in
% force reads, so nothing a dispute yields can confer a power, a standing, a
% duty on another party, an act of power, an L0 change or a Custodian power.
% Whether a disputed outcome burdens a subject, and which reviewer may decide
% the dispute, are consequence rules (C13).

% clause: BIND.3
has_standing(P, V) :- verdict_subject(V, P).
has_standing(P, V) :- withheld_protection(V, P, _).
% every human a law-citing veto's cited right protects may dispute an
% outcome of the act (P1.7), named or of the class the citation names
has_standing(H, V) :- verdict_from_act(V, Q), protected_by(Q, _, H).
refused_dispute(D) :- disputed(D, V, P), not has_standing(P, V).
earlier_by_party(D) :- disputed(D, V, P), dispute_at(D, T), disputed(D2, V, P), dispute_at(D2, T2), T2 < T.
admitted_dispute(D) :- disputed(D, V, P), has_standing(P, V), not earlier_by_party(D).
dispute_of(V) :- admitted_dispute(D), disputed(D, V, _).
later_admitted(D) :- admitted_dispute(D), disputed(D, V, _), dispute_at(D, T), admitted_dispute(D2),
                     disputed(D2, V, _), dispute_at(D2, T2), T2 < T.
joined_since(V, T) :- admitted_dispute(D), disputed(D, V, _), dispute_at(D, T), not later_admitted(D).
dispute_needs_human(V) :- dispute_of(V), consequence_on(V, P), kind_of(P, human).
decider_barred(R) :- dispute_decision(_, _, R, _), founder_chain(R), not regime_exited.
decider_ok(V, R) :- dispute_decision(V, _, R, _), dispute_of(V), not dispute_needs_human(V), not decider_barred(R).
decider_ok(V, R) :- dispute_decision(V, _, R, _), dispute_of(V), dispute_needs_human(V), kind_of(R, human),
                    not decider_barred(R).
upheld_program(V, T) :- dispute_decision(V, program, R, T), decider_ok(V, R).
upheld(V) :- upheld_program(V, _).
decided(V) :- dispute_decision(V, _, R, _), decider_ok(V, R).
dispute_open(V) :- dispute_of(V), not decided(V).
dispute_lapsed(V) :- dispute_open(V), joined_since(V, T), now(N), param(binding_dispute_ceiling, X), N - T >= X.

% clause: BIND.2 BIND.3
binding_held(V) :- dispute_of(V), not upheld(V).
protection_held(X, P) :- admitted_dispute(D), disputed(D, V, P), withheld_protection(V, P, X), not upheld(V).
bind_takes_effect(V) :- takes_effect(V), not binding_held(V).
effective_from(V, T) :- bind_takes_effect(V), verdict_delivered(V, T), not dispute_of(V).
effective_from(V, T) :- bind_takes_effect(V), upheld_program(V, T).
provisional_for(V, P) :- binding_held(V), verdict_subject(V, P).
