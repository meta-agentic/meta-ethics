% Parties, mandates, seats and attribution (A1, C7, A2.4).
% Rules only: every fact that names a party comes from the record.

% clause: A1.1 C7.3
reaches(M) :- root_grant(M).
reaches(M) :- delegated_from(M, M0), reaches(M0).

% clause: A1.1
revoked_by_now(M) :- revoked(M, T0), now(T), T0 <= T.
active(M) :- mandate(M, _, _), issued(M, T0), now(T), T0 <= T, not revoked_by_now(M).
party(P) :- mandate(M, P, _), reaches(M), active(M).
party(H) :- grant(_, G, H, _), party(G).

% clause: C7.1
scope_violation(M, C) :- delegated_from(M, M0), mandate(M, _, S), scope_has(S, C),
                         mandate(M0, _, S0), not scope_has(S0, C).

% clause: C7.4 A1.2
covered_grant(G) :- grant(G, Gr, H, C), mandate(M, H, S), scope_has(S, C),
                    delegated_from(M, M0), mandate(M0, Gr, _).
undeclared_grant(G, Gr) :- grant(G, Gr, _, _), not covered_grant(G).

% clause: A1.2
seat_holder(P, S) :- carries_seat(M, S), mandate(M, P, _), reaches(M), active(M), admitted(M).
seat_outside_channel(S) :- carries_seat(M, S), not admitted(M).
approvals(Q, N) :- proposal(Q), N = #count{ S : approves(P, Q), seat_holder(P, S) }.

% clause: A1.3
accepted(M) :- accepts_signed(M, _).
accepted(M) :- act_under(A, M), act(A, P, _, _), mandate(M, P, _).
renounced_by_now(M) :- renounces(M, T0), now(T), T0 <= T.
duty_runs(M) :- mandate(M, _, _), terms_delivered(M), accepted(M), not renounced_by_now(M).

% clause: A1.4
subject(X) :- act(A, X, _, _), effect(A).
subject(P) :- party(P).
holds_inform(P) :- party(P).

% clause: A1.8
subject(F) :- founder(F).

% clause: A1.9
self_exemption(A) :- exempts(A, F), founder(F), act(A, F, _, _).

% clause: A2.4
in_scope(A, M) :- act_under(A, M), act(A, _, C, _), mandate(M, _, S), scope_has(S, C).
chain_of(A, M) :- in_scope(A, M).
chain_of(A, M0) :- chain_of(A, M), delegated_from(M, M0).
attributed(A, P) :- act(A, P, _, _).
attributed(A, P) :- chain_of(A, M), mandate(M, P, _).
attributed(A, Gr) :- act(A, H, C, _), grant(G, Gr, H, C), not covered_grant(G).

% clause: C7.3
grantor_of(F, P) :- mandate(M, P, _), root_grant(M), founder_revocable(M), founder(F), F != P.

% clause: C21.2
% A party's delegation chain: its grantors up to, not including, the common
% root, and the parties holding mandates delegated from it.
grantor_of(G, P) :- mandate(M, P, _), delegated_from(M, M0), mandate(M0, G, _).
above(G, P) :- grantor_of(G, P).
above(G, P) :- grantor_of(G, X), above(X, P).
in_chain(X, P) :- above(X, P).
in_chain(X, P) :- above(P, X).
