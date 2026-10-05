% Capacity tokens with TRANSFER SEMANTICS enforced by rule (a pass is
% valid only if the passer holds the token at that moment; holding ends when
% a valid pass leaves).  This is the conservation law the instance rule needs.  As a rule set
% over the log it is neither stratified (holds_at -> valid_pass -> gave_away
% -> not holds_at) nor arithmetic-free in recursion (T+1).  Evidence that
% conservation is enforced by the capacity ledger at intake; rules only
% audit it (obstruction.lp, section 3b).
time(0..6).
token(t1). token(t2).
founding(founder).
mandate(m1, founder, orch). mandate(m2, orch, sub1). mandate(m3, orch, sub2).
pass(t1, m1, 1). pass(t1, m2, 2). pass(t1, m3, 2).      % orch double-spends t1 at t=2
holds_at(P, T, 0) :- founding(P), token(T).
valid_pass(Tk, M, T) :- pass(Tk, M, T), mandate(M, D, _), holds_at(D, Tk, T).
holds_at(E, Tk, T1) :- valid_pass(Tk, M, T), mandate(M, _, E), T1 = T + 1.
holds_at(P, Tk, T1) :- holds_at(P, Tk, T), time(T1), T1 = T + 1, not gave_away(P, Tk, T).
gave_away(D, Tk, T) :- valid_pass(Tk, M, T), mandate(M, D, _).
% EXPECT: holds_at(sub1,t1,3)
