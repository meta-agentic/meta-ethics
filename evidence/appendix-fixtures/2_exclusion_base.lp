% Appendix listing: exclusion with a shrinking and a fixed base.
% Verbatim from the paper; the EXPECT lines below restate its "expected:" comment.

time(0..20). now(10).
member_from(p1,0). member_from(p2,0). member_from(p3,0). member_from(p4,0).
member_from(p5,0). member_from(p6,0). member_from(p7,0). member_from(p8,0).
party_at(P,T) :- member_from(P,T0), time(T), T0 <= T.
class(ordinary). share(ordinary,1,2). minimum(ordinary,3).
coalition(p1). coalition(p2). coalition(p3).          % 3 of 8, below 4
proposal(q9,p1,3,ordinary).
approves(p1,q9). approves(p2,q9). approves(p3,q9).
implicated(p4,q9). implicated(p5,q9). implicated(p6,q9).
implicated(p7,q9). implicated(p8,q9).

% (a) shrinking base: the implicated leave the roster
roster(Q,P) :- proposal(Q,_,T,_), party_at(P,T), not implicated(P,Q).
roster_size(Q,N) :- proposal(Q,_,_,_), N = #count{ P : roster(Q,P) }.
approvals(Q,N)   :- proposal(Q,_,_,_), N = #count{ P : approves(P,Q), roster(Q,P) }.
too_few(Q) :- roster_size(Q,N), proposal(Q,_,_,C), minimum(C,Min), N < Min.
passes(Q)  :- proposal(Q,_,_,C), approvals(Q,A), roster_size(Q,R),
              share(C,Num,Den), minimum(C,Min), A*Den >= R*Num, A >= Min,
              not too_few(Q).

% (b) fixed base: everyone on the roster at filing, the implicated as non-approvers
base(Q,P) :- proposal(Q,_,T,_), party_at(P,T).
base_size(Q,N) :- proposal(Q,_,_,_), N = #count{ P : base(Q,P) }.
eligible(Q,P) :- base(Q,P), not implicated(P,Q).
approvals_b(Q,N) :- proposal(Q,_,_,_), N = #count{ P : approves(P,Q), eligible(Q,P) }.
passes_b(Q) :- proposal(Q,_,_,C), approvals_b(Q,A), base_size(Q,R),
               share(C,Num,Den), minimum(C,Min), A*Den >= R*Num, A >= Min.

n_coalition(N) :- N = #count{ P : coalition(P) }.
capture_cost(Q,K) :- base_size(Q,R), share(ordinary,Num,Den), K = (R*Num+Den-1)/Den.
below_cost(Q) :- n_coalition(N), capture_cost(Q,K), N < K.
captured_a(Q) :- passes(Q),   below_cost(Q).
captured_b(Q) :- passes_b(Q), below_cost(Q).
% expected: captured_a(q9).  not captured_b(q9).

% EXPECT: captured_a(q9)
% EXPECT-NOT: captured_b(q9)
