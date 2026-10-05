% Grounded extension by level unrolling under a ceiling (A3 style).
% Each level is its own predicate, so negation never crosses a recursive
% component: this IS C6-stratified.  Ceiling 3 levels here (a verdict's
% consequence count is capped by A3, so the ceiling exists).  Same chain as
% a_grounded_acyclic.lp plus an unordered pair (c4,c5) that must come out undecided.
arg(c1). arg(c2). arg(c3). arg(c4). arg(c5).
attacks(c3, c2). attacks(c2, c1).
attacks(c4, c5). attacks(c5, c4).
% level 0: in if unattacked
in0(X) :- arg(X), not attacked(X).
attacked(X) :- attacks(_, X).
out0(X) :- attacks(Y, X), in0(Y).
% level 1
in1(X) :- arg(X), not has_live_attacker1(X).
has_live_attacker1(X) :- attacks(Y, X), not out0(Y).
out1(X) :- attacks(Y, X), in1(Y).
% level 2
in2(X) :- arg(X), not has_live_attacker2(X).
has_live_attacker2(X) :- attacks(Y, X), not out1(Y).
out2(X) :- attacks(Y, X), in2(Y).
% verdict at the ceiling
accepted(X) :- in2(X).
rejected(X) :- out2(X).
undecided(X) :- arg(X), not in2(X), not out2(X).
% honesty check: did the ceiling suffice?  (fixpoint reached iff level 2 == level 1)
unstable :- in2(X), not in1(X).
unstable :- out2(X), not out1(X).
ceiling_sufficient :- not unstable.
% EXPECT: accepted(c3)
% EXPECT: rejected(c2)
% EXPECT: accepted(c1)
% EXPECT: undecided(c4)
% EXPECT: undecided(c5)
% EXPECT: ceiling_sufficient
