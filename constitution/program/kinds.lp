% Composition of the Custodian by kind (P1.1, P1.20, P1.21) and the end of
% an instance whose parties are all of one kind (P3.7, P3.8, P3.9, P3.12).
% Composition reads the kind of a party, so it is written as consequence
% rules (C13); who caused the end is a derivation.

% clause: P1.1 P1.21
composition_breach(S) :- custodian_seat(S), seat_holder(P, S), seat_kind(S, K), kind_of(P, K2), K != K2.

% clause: P1.20
replacement_inadmissible(Q) :- replaces_seat(Q, S, P), seat_kind(S, K), kind_of(P, K2), K != K2.

% clause: P3.8 P3.15
own_exit(A) :- renunciation_act(A).

% clause: P3.8 P3.12
founder_presumed(A) :- under_founder_custody(A), not rebutted(A).
causer(P) :- made_one_kind(A), act(A, P, _, _), not own_exit(A), not founder_presumed(A),
             not controlled_act(A).
causer(F) :- made_one_kind(A), founder_presumed(A), founder(F).
causer(P) :- made_one_kind(A), controlled_by(A, P).
controlled_act(A) :- controlled_by(A, _).

% clause: P3.9 P3.11
exit_by(T) :- regime_exit(E), finding(_, _, T), E <= T.
kept_open(F) :- instance_ended, open(F), finding(F, P, _), causer(P).
kept_open(F) :- instance_ended, open(F), finding(F, P, T), founder(P), not exit_by(T).

% clause: P3.7
ended_without_verdict(F) :- instance_ended, open(F), not kept_open(F).

% clause: A2.17
anonymization_breach_kind(E) :- anonymized(E, P), kind_of(P, K), K != human.

% clause: P2.3
citable_through_chain(F, H) :- attributed_via_chain(F, H), kind_of(H, human), citable(F, _),
                               attribution_reviewed(F, H, R), kind_of(R, human).
citable_through_chain(F, H) :- attributed_via_chain(F, H), kind_of(H, K), K != human, citable(F, _).

% clause: P3.2
removal_bar(R) :- reviewed_removal(_, R), founder_chain(R), not regime_exited.
removal_effective(A) :- removes_last_of_kind(A), reviewed_removal(A, R), not removal_bar(R).
removal_provisional(A) :- removes_last_of_kind(A), not removal_effective(A).
