% Genesis regime exit as an event, not a headcount; fork as a finding.
founding(root).
mandate(m0, root, founder). mandate(m1, founder, orch). mandate(m2, orch, sub1).
mandate(m3, root, alice).                  % a first-level mandate other than the founder's
seat(s1, m0). seat(s2, m1). seat(s3, m3).
ratified(m0). ratified(m1). ratified(m3).
issued(m0, 0). issued(m1, 1). issued(m2, 2). issued(m3, 7).
% witnessed(Seq, Head, T)  extends(H2, H1): attested prefix proof supplied by the operator
witnessed(1, h1, 3). witnessed(2, h2, 6). witnessed(3, h3, 9).
extends(h2, h1).                           % h3 does not extend h2: a fork
cadence(4). time(0..12).

first_level(M) :- mandate(M, D, _), founding(D).
seat_holder(P, M) :- seat(_, M), mandate(M, _, P), ratified(M).
% exit event: a seat held under a first-level mandate that is not the founder's own
regime_exit_at(T) :- seat_holder(P, M), first_level(M), mandate(M0, D, founder), founding(D), M != M0, issued(M, T).
genesis_regime(T) :- time(T), not exited_by(T).
exited_by(T) :- regime_exit_at(T0), time(T), T0 <= T.
% acts of power under the regime are marked
act_of_power(a1, founder, 4). act_of_power(a2, founder, 8).
under_regime(A) :- act_of_power(A, _, T), genesis_regime(T).
% fork: two witnessed heads in sequence with no prefix proof
fork(H1, H2) :- witnessed(I, H1, _), witnessed(J, H2, _), I < J, not extends(H2, H1).
% unwitnessed interval: a flux, recorded
unwitnessed(T) :- time(T), witnessed(I, _, T0), cadence(C), T0 + C < T, not later_witness(I, T).
later_witness(I, T) :- time(T), witnessed(I, _, _), witnessed(J, _, T1), J > I, T1 <= T.

% EXPECT: first_level(m3)
% EXPECT-NOT: first_level(m1)
% EXPECT: regime_exit_at(7)
% EXPECT: genesis_regime(6)
% EXPECT-NOT: genesis_regime(7)
% EXPECT: under_regime(a1)
% EXPECT-NOT: under_regime(a2)
% EXPECT: fork(h2,h3)
% EXPECT-NOT: fork(h1,h2)
% EXPECT-NOT: unwitnessed(6)
