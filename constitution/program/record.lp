% The witness (C16), placement and consent (C5, S1), knowledge of a
% delivery (D15), continuity (S2), conflicting consequences (C14), owed acts
% (H1) and two kinds (P3).

% clause: C16.3
fork(H1, H2) :- next_head(H1, H2), not extends(H2, H1).

% clause: C16.4 S1.14
covered_by_head(Sig) :- signature(Sig, _, _, T), witnessed_head(_, Th), T <= Th.

% clause: S1.6
later_signature(Sig, R) :- signature(Sig, _, R, T), signature(_, _, R, T2), T < T2.
last_intake(R, T) :- signature(Sig, _, R, T), not later_signature(Sig, R).
stale(Sig) :- signature(Sig, _, R, _), signature_head(Sig, Th), last_intake(R, TL),
              param(staleness_window, W), TL - Th > W.

% clause: C5.2 S1.14 S1.6
ratification_signed(R, S) :- signature(Sig, P, R, _), seat_holder(P, S), custodian_seat(S),
                             signature_valid(Sig), covered_by_head(Sig), not stale(Sig).
ratification_missing(R, S) :- placed(R), custodian_seat(S), not ratification_signed(R, S).
ratification_incomplete(R) :- ratification_missing(R, _).
ratified(R) :- placed(R), not ratification_incomplete(R).

% clause: D15.2 D15.3 A1.10
arbiter_holder(P) :- seat_holder(P, S), arbiter_seat(S).
collector_implicated(C, D) :- delivered(D, C, _, _).
collector_implicated(C, D) :- delivered(D, R, _, _), in_chain(C, R).
collector_implicated(C, D) :- delivered(D, _, X, _), filer(X, F), in_chain(C, F).
collector_implicated(F, D) :- delivered(D, _, X, _), filer(X, F).
collector_implicated(C, D) :- observed(D, C), arbiter_holder(A), in_chain(C, A).
independent_collector(C, D) :- observed(D, C), not arbiter_holder(C), not collector_implicated(C, D).
knew(R, X, T) :- delivered(D, R, X, T), independent_collector(_, D), holds_inform(R).

% clause: S2.3
party_fork(P, K) :- presence(E1, P, K, H), presence(E2, P, K, H), E1 != E2.

% clause: C14.1 C14.2
conflict(C1, C2) :- conflicts(C1, C2).
conflict(C2, C1) :- conflicts(C1, C2).
beats(C1, C2, P) :- candidate(C1, P), candidate(C2, P), conflict(C1, C2), prevails(C1, C2).
beats(C1, C2, P) :- candidate(C1, P), candidate(C2, P), conflict(C1, C2), resolution(C1, C2, P),
                    not prevails(C2, C1).
defeated(C, P) :- beats(_, C, P).
undecided(C, P) :- candidate(C, P), candidate(C2, P), conflict(C, C2),
                   not beats(C, C2, P), not beats(C2, C, P).
applied(C, P) :- candidate(C, P), not defeated(C, P), not undecided(C, P).

% clause: C14.3
conflict_lapsed(C, P) :- undecided(C, P), conflict_filed(C, P, T), now(N), param(conflict_ceiling, X), N - T >= X.
applied(C, P) :- conflict_lapsed(C, P), protection(C).

% clause: H1.4
admitted_act(A) :- filed(A, _), owed(A).
admitted_act(A) :- filed(A, P), not owed(A), balance(P, N), N > 0.

% clause: P3.3 P3.4
kind_present(K) :- party(P), kind_of(P, K).
paused :- kind(K), not kind_present(K).
blocked_by_pause(A) :- paused, act_of_power(A), not pause_exempt(A), not owed(A),
                       not renunciation_act(A).
