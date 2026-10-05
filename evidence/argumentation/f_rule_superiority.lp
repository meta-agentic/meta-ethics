% Attacks derived from conflicts plus a superiority relation over RULES.
% Claim to test: if superiority is acyclic (checked once, at rule-set
% admission, by a stratified reachability rule) then the attack graph over
% consequences is acyclic, and the only residue is the UNORDERED conflicts,
% which appear as symmetric attacks.  So no per-verdict acyclicity check is
% needed, and "cyclic residue" = "conflicts the rule set does not order".
rule(r1). rule(r2). rule(r3). rule(r4). rule(r5).
sup(r3, r2). sup(r2, r1).                  % acyclic
% consequences derived this verdict: cons(Id, Rule, Subject)
cons(c1, r1, bob). cons(c2, r2, bob). cons(c3, r3, bob).
cons(c4, r4, cat). cons(c5, r5, cat).
conflict(c1, c2). conflict(c2, c3). conflict(c4, c5).
conflict(X, Y) :- conflict(Y, X).
% superiority acyclicity (admission-time check)
sup_reach(X, Y) :- sup(X, Y).
sup_reach(X, Z) :- sup_reach(X, Y), sup(Y, Z).
sup_cyclic :- sup_reach(X, X).
sup_acyclic :- not sup_cyclic.
% attacks: X attacks Y iff they conflict and X's rule is superior;
% an unordered conflict attacks both ways (symmetric = residue)
ordered(X, Y) :- conflict(X, Y), cons(X, RX, _), cons(Y, RY, _), sup_reach(RX, RY).
attacks(X, Y) :- ordered(X, Y).
attacks(X, Y) :- conflict(X, Y), not ordered(X, Y), not ordered(Y, X).
% attack-graph acyclicity restricted to ORDERED attacks: follows from sup_acyclic
att_reach(X, Y) :- ordered(X, Y).
att_reach(X, Z) :- att_reach(X, Y), ordered(Y, Z).
ordered_cyclic :- att_reach(X, X).
residue(X, Y) :- attacks(X, Y), attacks(Y, X), X < Y.
% EXPECT: sup_acyclic
% EXPECT-NOT: ordered_cyclic
% EXPECT: attacks(c3,c2)
% EXPECT: attacks(c2,c1)
% EXPECT-NOT: attacks(c1,c2)
% EXPECT: residue(c4,c5)
