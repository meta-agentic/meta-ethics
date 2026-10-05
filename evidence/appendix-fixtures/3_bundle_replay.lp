% Appendix listing: bundle replay under negation.
% Verbatim from the paper; the EXPECT lines below restate its "expected:" comment.

% full slice                       % bundle presented to a replayer
f_finding(f1,bob).                 b_finding(f1,bob).
f_closure(c1,f1).                  % closure omitted
f_closed(F) :- f_closure(_,F).     b_closed(F) :- b_closure(_,F).
f_open(F) :- f_finding(F,_), not f_closed(F).
b_open(F) :- b_finding(F,_), not b_closed(F).
excluded_full(P)   :- f_open(F), f_finding(F,P).
excluded_bundle(P) :- b_open(F), b_finding(F,P).
% a proof-carrying replay: every negated lookup needs a non-membership proof
negated_pred(closure).
bundle_complete :- negated_pred(Q), proof_nonmember(Q,f1).
replay_accepts  :- bundle_complete.
% expected: not excluded_full(bob). excluded_bundle(bob). not replay_accepts.

% EXPECT-NOT: excluded_full(bob)
% EXPECT: excluded_bundle(bob)
% EXPECT-NOT: replay_accepts
