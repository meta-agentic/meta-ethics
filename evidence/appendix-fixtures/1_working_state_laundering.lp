% Appendix listing: the working state, and laundering.
% Verbatim from the paper; the EXPECT lines below restate its "expected:" comment.

% parties, rules, clock, ceilings
party(a). party(b). party(c).   rule(r1). rule(r2).
time(0..10). now(10). cap_count(2). cap_timer(5). collector(w1).
% act(Id, Actor, Rule, Kind, T)
act(a1,a,r1,violation,1).  act(a2,a,r1,compliant,2).
act(a3,b,r2,violation,3).  act(a4,b,r2,violation,4).
act(a5,b,r2,violation,5).  act(a6,b,r2,violation,6).
act(a7,c,r2,closure,7).  closes(a7,a3).  witnessed(a7,w1).
act(a8,b,r2,closure,8).  closes(a8,a4).  witnessed(a8,b).

finding(A,R,P,T) :- act(A,P,R,violation,T).
valid_closure(C,F) :- closes(C,F), act(C,Actor,_,closure,_),
                      witnessed(C,W), W != Actor, finding(F,_,_,_).
closed(F) :- valid_closure(_,F).
open(F)   :- finding(F,_,_,_), not closed(F).
open_count(P,N) :- party(P), N = #count{ F : open(F), finding(F,_,P,_) }.
open_count_sat(P,N) :- open_count(P,N), cap_count(C), N <= C.
open_count_sat(P,C) :- open_count(P,N), cap_count(C), N > C.

% the rejected abstraction: latest verdict per (party, rule)
status_act(A) :- act(A,_,_,violation,_).   status_act(A) :- act(A,_,_,compliant,_).
superseded(A1) :- status_act(A1), status_act(A2),
                  act(A1,P,R,_,T1), act(A2,P,R,_,T2), T1 < T2.
latest_passing(P,R) :- status_act(A), not superseded(A), act(A,P,R,compliant,_).

% expected: open(a1). latest_passing(a,r1). closed(a3). open(a4).
%           open_count(b,3). open_count_sat(b,2).

% EXPECT: open(a1)
% EXPECT: latest_passing(a,r1)
% EXPECT: closed(a3)
% EXPECT: open(a4)
% EXPECT: open_count(b,3)
% EXPECT: open_count_sat(b,2)
