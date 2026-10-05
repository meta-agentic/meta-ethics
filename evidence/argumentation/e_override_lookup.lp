% The non-recursive alternative: a consequence is overridden by any
% DERIVED conflicting consequence that prevails, whether or not that one is
% itself overridden.  Stratified, one model, but no reinstatement: c1 falls
% with c2 even though c2 is itself beaten.  Differs from d_grounded_unrolled.lp on the same facts.
arg(c1). arg(c2). arg(c3). arg(c4). arg(c5).
attacks(c3, c2). attacks(c2, c1).
attacks(c4, c5). attacks(c5, c4).
overridden(X) :- attacks(Y, X).
accepted(X) :- arg(X), not overridden(X).
% EXPECT: accepted(c3)
% EXPECT: overridden(c2)
% EXPECT: overridden(c1)
% EXPECT: overridden(c4)
% EXPECT: overridden(c5)
