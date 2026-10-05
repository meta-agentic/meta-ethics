% Superiority set by an act of power while a matter is pending.
% If superiority is a rule-set fact and a matter binds the rule set in force
% at filing (D21 adiabatic condition, C12 provenance), the change cannot
% reach the pending matter.  If superiority were a free-standing fact read
% "as of now", it would.
ruleset(v1). ruleset(v2).
sup_in(v1, r1, r2).                 % under v1, r1 beats r2
sup_in(v2, r2, r1).                 % v2 flips it (an act of power at t=5)
admitted(v1, 0). admitted(v2, 5).
matter(m1, 3).                      % filed at t=3, pending at t=6
now(6).
% binding by filing: the latest rule set admitted at or before filing
bound(M, V) :- matter(M, TF), admitted(V, TA), TA <= TF, not later(M, V).
later(M, V) :- matter(M, TF), admitted(V, TA), admitted(W, TB), TA < TB, TB <= TF.
prevails_bound(M, X, Y) :- bound(M, V), sup_in(V, X, Y).
% reading "as of now" instead
current(V) :- admitted(V, TA), now(N), TA <= N, not later_now(V).
later_now(V) :- admitted(V, TA), admitted(W, TB), now(N), TA < TB, TB <= N.
prevails_now(M, X, Y) :- matter(M, _), current(V), sup_in(V, X, Y).
% EXPECT: bound(m1,v1)
% EXPECT: prevails_bound(m1,r1,r2)
% EXPECT-NOT: prevails_bound(m1,r2,r1)
% EXPECT: prevails_now(m1,r2,r1)
