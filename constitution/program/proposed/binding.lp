% The binding remedy, proposed and pending the founder's decision (BIND.2,
% BIND.3). These rules run only with fixtures/proposed/; the program in force
% does not load them. Whether a disputed outcome takes effect, and which
% reviewer may decide the dispute, are consequence rules (C13).

% clause: BIND.3
earlier_dispute(D) :- disputed(D, V, P), dispute_at(D, T), disputed(D2, V, P), dispute_at(D2, T2), T2 < T.
first_dispute(D) :- disputed(D, _, _), dispute_at(D, _), not earlier_dispute(D).
dispute_needs_human(D) :- first_dispute(D), disputed(D, V, _), consequence_on(V, P), kind_of(P, human).
decider_barred(R) :- dispute_decision(_, _, R, _), founder_chain(R), not regime_exited.
decider_ok(D, R) :- dispute_decision(D, _, R, _), not dispute_needs_human(D), not decider_barred(R).
decider_ok(D, R) :- dispute_decision(D, _, R, _), dispute_needs_human(D), kind_of(R, human), not decider_barred(R).
upheld_program(D, T) :- first_dispute(D), dispute_decision(D, program, R, T), decider_ok(D, R).
upheld(D) :- upheld_program(D, _).
dispute_lapsed(D) :- first_dispute(D), dispute_at(D, T), now(N), param(binding_dispute_ceiling, X), N - T >= X,
                     not decided(D).
decided(D) :- first_dispute(D), dispute_decision(D, _, R, _), decider_ok(D, R).

% clause: BIND.2 BIND.3
binding_held(V) :- first_dispute(D), disputed(D, V, _), not upheld(D).
protection_held(X) :- first_dispute(D), prose_protection(D, X), not upheld(D).
bind_takes_effect(V) :- takes_effect(V), not binding_held(V).
effective_from(V, T) :- bind_takes_effect(V), verdict_delivered(V, T), not disputed_outcome(V).
effective_from(V, T) :- bind_takes_effect(V), first_dispute(D), disputed(D, V, _), upheld_program(D, T).
disputed_outcome(V) :- first_dispute(D), disputed(D, V, _).
