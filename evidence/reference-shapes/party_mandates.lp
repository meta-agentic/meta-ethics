% Party, subject, implicit mandates, scope nesting, seats (A1, C7).
% Attacks exercised: mandate minting (Sybil seats), escalating mandates,
% proxy laundering through an unmandated stand-in, exit-as-escape, a chain
% that never reaches the founding document.

founding(root).
capability(read). capability(write). capability(deploy). capability(vote).
time(0..10).

% mandate(Id, Delegator, Delegate, Scope)   issued(Id, T)   revoked(Id, T)
mandate(m0, root, founder, s_all).      issued(m0, 0).
scope_has(s_all, read). scope_has(s_all, write). scope_has(s_all, deploy). scope_has(s_all, vote).
mandate(m1, founder, orch, s_orch).     issued(m1, 1).
scope_has(s_orch, read). scope_has(s_orch, write).
mandate(m2, orch, sub1, s_sub).         issued(m2, 2).      % nested: ok
scope_has(s_sub, read).
mandate(m3, orch, sub2, s_esc).         issued(m3, 2).      % escalating: deploy not held by orch
scope_has(s_esc, read). scope_has(s_esc, deploy).
mandate(m4, sub2, sub3, s_esc2).        issued(m4, 3).      % sub2 passes deploy on
scope_has(s_esc2, deploy).
mandate(m5, founder, leaver, s_orch).   issued(m5, 1).  revoked(m5, 5).
mandate(m9, ghost, gh2, s_sub).         issued(m9, 1).      % chain never reaches root
% mandate minting: orch mints five sub-agents
mandate(m10, orch, bot1, s_sub). issued(m10, 3).
mandate(m11, orch, bot2, s_sub). issued(m11, 3).
mandate(m12, orch, bot3, s_sub). issued(m12, 3).
mandate(m13, orch, bot4, s_sub). issued(m13, 3).
mandate(m14, orch, bot5, s_sub). issued(m14, 3).

% seat(SeatId, MandateId)   ratified(MandateId) — human ratification, attested
seat(seat1, m0).  ratified(m0).
seat(seat2, m1).  ratified(m1).
seat(seat3, m2).                        % orch attaches a seat without ratification
seat(seat4, m10). seat(seat5, m11).     % minted seats, unratified

% grant(Id, Grantor, Grantee, Capability) — from the access system, attested
grant(g1, founder, orch, write).        % covered by m1
grant(g2, orch, contractor, write).     % undeclared: implicit mandate

% act(Id, Actor, Capability, T)  effect(Id) — in-perimeter effect
act(x1, contractor, write, 4). effect(x1).     % proxy laundering
act(x2, leaver, write, 6).     effect(x2).     % after revocation: exit-as-escape
act(x3, sub1, read, 4).        effect(x3).
act(x4, outsider, read, 4).    effect(x4).     % no mandate, no grant

% --- chains and parties ----------------------------------------------------
reaches(M) :- mandate(M, D, _, _), founding(D).
reaches(M) :- mandate(M, D, _, _), mandate(M2, _, D, _), reaches(M2).
revoked_by(M, T) :- revoked(M, T0), time(T), T0 <= T.
active_at(M, T) :- mandate(M, _, _, _), issued(M, T0), time(T), T0 <= T, not revoked_by(M, T).
party_at(P, T) :- mandate(M, _, P, _), reaches(M), active_at(M, T).
orphan(P) :- mandate(M, _, P, _), not reaches(M).          % C7 reopen trigger

% --- subjects: everyone whose act has an effect ----------------------------
subject(X) :- act(A, X, _, _), effect(A).

% --- scope nesting: positive closure from the founding document -----------
holds(P, C) :- founding(P), capability(C).
holds(E, C) :- mandate(M, D, E, S), scope_has(S, C), holds(D, C).
scope_violation(M, C) :- mandate(M, D, _, S), scope_has(S, C), not holds(D, C).

% --- implicit mandates -----------------------------------------------------
covered(G) :- grant(G, Gr, Ge, C), mandate(_, Gr, Ge, S), scope_has(S, C).
implicit_mandate(G, Gr, Ge) :- grant(G, Gr, Ge, _), not covered(G).
answers_for(Gr, A) :- implicit_mandate(G, Gr, Ge), grant(G, Gr, Ge, C), act(A, Ge, C, _).

% --- delegation-chain attribution (A2) ------------------------------------
attributed(A, X) :- act(A, X, _, _).
attributed(A, D) :- attributed(A, E), act(A, _, C, T), mandate(M, D, E, S), scope_has(S, C),
                    active_at(M, T), not founding(D).
attributed(A, Gr) :- answers_for(Gr, A).
unattributed(A) :- act(A, _, _, _), effect(A), not attributed(A, _).   % A1 reopen trigger

% --- seats: one ratified seat-bearing mandate, one seat ---------------------
seat_holder(P, S) :- seat(S, M), mandate(M, _, P, _), reaches(M), ratified(M).
unratified_seat(S) :- seat(S, M), not ratified(M).
seats_held(N) :- N = #count{ S : seat_holder(_, S) }.
seats_claimed(N) :- N = #count{ S : seat(S, _) }.

% EXPECT: reaches(m2)
% EXPECT-NOT: reaches(m9)
% EXPECT: orphan(gh2)
% EXPECT: scope_violation(m3,deploy)
% EXPECT: scope_violation(m4,deploy)
% EXPECT-NOT: holds(sub2,deploy)
% EXPECT: holds(sub1,read)
% EXPECT: implicit_mandate(g2,orch,contractor)
% EXPECT: answers_for(orch,x1)
% EXPECT: attributed(x1,orch)
% EXPECT: subject(contractor)
% EXPECT: subject(leaver)
% EXPECT: subject(outsider)
% EXPECT: party_at(leaver,4)
% EXPECT-NOT: party_at(leaver,6)
% EXPECT-NOT: party_at(outsider,4)
% EXPECT: attributed(x3,orch)
% EXPECT: attributed(x3,founder)
% EXPECT-NOT: attributed(x3,root)
% EXPECT: seats_held(2)
% EXPECT: seats_claimed(5)
% EXPECT: unratified_seat(seat4)
% EXPECT-NOT: unattributed(x4)
