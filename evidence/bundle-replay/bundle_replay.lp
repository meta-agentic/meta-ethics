% Replay over a per-verdict bundle under negation (C12; theorem "Bundle replay
% is unsound; proof-carrying replay is sound").
% A bundle is "the closure of facts the derivation used".  Under negation as
% failure a verdict also depends on facts that are ABSENT.  A bundle that
% omits a closure act replays consistently to "open", so bundle replay proves
% "these facts entail the verdict", never "these are all the facts".
%
% Two replays of the same gating rule: one over the full working state slice,
% one over a bundle that drops the closure.  Suffix _full / _bun.

% full slice
f_finding(f1, bob).
f_closure(c1, f1).
% bundle presented to a replayer (closure omitted, everything else identical)
b_finding(f1, bob).

f_open(F) :- f_finding(F, _), not f_closed(F).
f_closed(F) :- f_closure(_, F).
excluded_full(P) :- f_open(F), f_finding(F, P).

b_open(F) :- b_finding(F, _), not b_closed(F).
b_closed(F) :- b_closure(_, F).
b_closure(x, x) :- b_finding(x, x).          % keeps b_closure/2 defined; never fires
excluded_bundle(P) :- b_open(F), b_finding(F, P).

% Fix: a bundle carries, for every predicate its rules read under negation, a
% non-membership proof against the committed working-state hash at the
% recorded position.  Replay rejects a bundle without one.
negated_pred(closure).
proof_nonmember(closure, f1) :- no_proof_supplied.   % not supplied here
bundle_complete :- negated_pred(Q), proof_nonmember(Q, f1).
replay_accepts :- bundle_complete.

% EXPECT-NOT: excluded_full(bob)
% EXPECT: excluded_bundle(bob)
% EXPECT-NOT: replay_accepts
