% Dung's grounded rule, odd cycle.  Well-founded: all undecided.  Stable-model
% engine: ZERO models, so the verdict does not exist at all.
arg(c1). arg(c2). arg(c3).
attacks(c1, c2). attacks(c2, c3). attacks(c3, c1).
defeated(X) :- attacks(Y, X), not defeated(Y).
accepted(X) :- arg(X), not defeated(X).
