% Interim eligibility exclusion as a capture lever (theorem "Exclusion is a
% capture lever unless the base is fixed").  Reuses the roster/share/lapse
% shapes of reference-shapes/obstruction.lp verbatim.  Question: does an immediate
% exclusion "on the cited matter" let a group BELOW the capture cost decide the
% matter?  Two denominators are compared:
%   (a) obstruction.lp as drafted: implicated parties leave the roster (base shrinks);
%   (b) frozen base: implicated parties stay in the base, only lose the vote.
time(0..20). now(10).
member_from(p1,0). member_from(p2,0). member_from(p3,0). member_from(p4,0).
member_from(p5,0). member_from(p6,0). member_from(p7,0). member_from(p8,0).
party_at(P, T) :- member_from(P, T0), time(T), T0 <= T.
class(ordinary). share(ordinary, 1, 2). minimum(ordinary, 3). window(ordinary, 5).

% coalition {p1,p2,p3}: 3 of 8, below the capture cost (half of 8 = 4)
coalition(p1). coalition(p2). coalition(p3).

% q8: coalition approves; it implicates three honest voters on q8 itself
proposal(q8, p1, 3, ordinary).
approves(p1, q8). approves(p2, q8). approves(p3, q8).
implicated(p6, q8). implicated(p7, q8). implicated(p8, q8).
% q9: it implicates every honest voter; three remain = the minimum, so the
% rump passes with no honest vote at all (shrinking base only)
proposal(q9, p1, 3, ordinary).
approves(p1, q9). approves(p2, q9). approves(p3, q9).
implicated(p4, q9). implicated(p5, q9). implicated(p6, q9). implicated(p7, q9). implicated(p8, q9).
% q10: a two-party rump implicates six: below the minimum, escalates
proposal(q10, p1, 3, ordinary).
approves(p1, q10). approves(p2, q10).
implicated(p3, q10). implicated(p4, q10). implicated(p5, q10). implicated(p6, q10).
implicated(p7, q10). implicated(p8, q10).

% ---- (a) shrinking base, exactly obstruction.lp's rule ---------------------------------
roster(Q, P) :- proposal(Q, _, T, _), party_at(P, T), not implicated(P, Q).
roster_size(Q, N) :- proposal(Q, _, _, _), N = #count{ P : roster(Q, P) }.
approvals(Q, N) :- proposal(Q, _, _, _), N = #count{ P : approves(P, Q), roster(Q, P) }.
too_few(Q) :- roster_size(Q, N), proposal(Q, _, _, C), minimum(C, Min), N < Min.
passes(Q) :- proposal(Q, _, _, C), approvals(Q, A), roster_size(Q, R), share(C, Num, Den),
             minimum(C, Min), A * Den >= R * Num, A >= Min, not too_few(Q).
escalates(Q) :- too_few(Q).

% ---- (b) frozen base: the base is everyone on the roster at filing ---------
base(Q, P) :- proposal(Q, _, T, _), party_at(P, T).
base_size(Q, N) :- proposal(Q, _, _, _), N = #count{ P : base(Q, P) }.
eligible(Q, P) :- base(Q, P), not implicated(P, Q).
n_eligible(Q, N) :- proposal(Q, _, _, _), N = #count{ P : eligible(Q, P) }.
approvals_b(Q, N) :- proposal(Q, _, _, _), N = #count{ P : approves(P, Q), eligible(Q, P) }.
too_few_b(Q) :- n_eligible(Q, N), proposal(Q, _, _, C), minimum(C, Min), N < Min.
passes_b(Q) :- proposal(Q, _, _, C), approvals_b(Q, A), base_size(Q, R), share(C, Num, Den),
               minimum(C, Min), A * Den >= R * Num, A >= Min, not too_few_b(Q).

% capture-cost check: did a coalition below the cost pass the matter?
n_coalition(N) :- N = #count{ P : coalition(P) }.
capture_cost(Q, K) :- base_size(Q, R), share(ordinary, Num, Den), K = (R * Num + Den - 1) / Den.
below_cost(Q) :- n_coalition(N), capture_cost(Q, K), N < K.
captured_a(Q) :- passes(Q), below_cost(Q).
captured_b(Q) :- passes_b(Q), below_cost(Q).

% EXPECT: below_cost(q8)
% EXPECT: passes(q8)
% EXPECT: captured_a(q8)
% EXPECT-NOT: passes_b(q8)
% EXPECT-NOT: captured_b(q8)
% EXPECT: passes(q9)
% EXPECT: captured_a(q9)
% EXPECT-NOT: passes_b(q9)
% EXPECT: escalates(q10)
% EXPECT: too_few_b(q10)
