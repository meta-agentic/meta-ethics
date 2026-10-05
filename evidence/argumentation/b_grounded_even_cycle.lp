% Dung's grounded rule, even cycle (two unordered conflicting consequences).
% Grounded/well-founded semantics: both undecided.  Stable-model engine: TWO
% models, so replay is not deterministic (F8, D4 fail).
arg(c1). arg(c2).
attacks(c1, c2). attacks(c2, c1).
defeated(X) :- attacks(Y, X), not defeated(Y).
accepted(X) :- arg(X), not defeated(X).
