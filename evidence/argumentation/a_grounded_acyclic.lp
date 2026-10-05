% Dung's grounded rule, acyclic attack graph.
% Claim under test: "Yes when the attack graph is acyclic: defeated(X) :- attacks(Y,X),
% not defeated(Y) is then stratified."  C6 stratification is checked on the
% PREDICATE dependency graph, not on the ground graph, so this rule is never
% stratified whatever the facts.  Acyclic facts give one stable model anyway.
arg(c1). arg(c2). arg(c3).
attacks(c3, c2). attacks(c2, c1).        % chain: c3 beats c2, c2 beats c1
defeated(X) :- attacks(Y, X), not defeated(Y).
accepted(X) :- arg(X), not defeated(X).
% EXPECT: accepted(c3)
% EXPECT: defeated(c2)
% EXPECT: accepted(c1)
