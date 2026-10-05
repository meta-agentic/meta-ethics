% Closure laundering by the coalition itself (A3 measure).
% working_state.lp's valid_closure accepts any closer other than the subject, witnessed by
% anyone other than the closer.  A3 asks that OUTSIDERS can close; it says
% nothing about insiders closing their own findings without remedy.  The
% rank then "decreases" by an act that repairs nothing.
%
% a and b form a coalition below capture cost; w1 is an honest collector.

party(a). party(b). party(c). party(d).
coalition_member(a). coalition_member(b).
branch(a, br1). branch(b, br1). branch(c, br2). branch(d, br3).  % first-level subtrees
collector(w1).

act(v1, a, r1, violation, 1).
% b "closes" a's finding at t=2, witnessed by w1; no remedy act exists.
act(c1, b, r1, closure, 2).  closes(c1, v1).  witnessed(c1, w1).

finding(F, R, P, T) :- act(F, P, R, violation, T).

% --- working_state.lp as drafted ---------------------------------------------------------
p1_valid_closure(C, F) :- closes(C, F), act(C, Actor, _, closure, _), witnessed(C, W),
                          W != Actor, finding(F, _, _, _).
p1_closed(F) :- p1_valid_closure(_, F).

% --- fix: a closure is valid only if (i) it cites a remedy act or a verdict
%     that discharges the finding, and (ii) the closer shares no first-level
%     subtree with the subject, and (iii) the witness is neither.
remedy(F, M) :- remedies(M, F), act(M, _, _, remedy, _).
discharged(F) :- remedy(F, _).
discharged(F) :- verdict_discharges(_, F).
same_branch(X, Y) :- branch(X, B), branch(Y, B).
valid_closure(C, F) :- closes(C, F), act(C, Actor, _, closure, _), witnessed(C, W),
                       finding(F, _, S, _), discharged(F),
                       W != Actor, W != S, not same_branch(Actor, S), not same_branch(W, S).
closed(F) :- valid_closure(_, F).
open(F) :- finding(F, _, _, _), not closed(F).

% a second finding closed properly by an outsider after a remedy
act(v2, a, r2, violation, 3).
act(m2, a, r2, remedy, 4).   remedies(m2, v2).
act(c2, c, r2, closure, 5).  closes(c2, v2).  witnessed(c2, w1).

% EXPECT: p1_closed(v1)
% EXPECT-NOT: closed(v1)
% EXPECT: open(v1)
% EXPECT: closed(v2)
