% Working state (A3): the permanent record and a bounded working state.
% Sketch: split the permanent record from a bounded working state; a finding
% is closed only by a witnessed act that names it; counts saturate at a cap;
% timers cap at the longest declared period.  Contrast with the REJECTED
% abstraction "latest verdict per rule", which the laundering attack defeats.
%
% Fixture: a violates r1 at t=1 and immediately files a compliant act on r1
% (laundering). b violates r2 four times; c closes one with an independent
% witness; b tries to close another with itself as witness.

party(a). party(b). party(c).
rule(r1). rule(r2).
time(0..10). now(10).
cap_count(2). cap_timer(5).
collector(w1).

% act(Id, Actor, Rule, Kind, T)
act(a1, a, r1, violation, 1).
act(a2, a, r1, compliant, 2).
act(a3, b, r2, violation, 3).
act(a4, b, r2, violation, 4).
act(a5, b, r2, violation, 5).
act(a6, b, r2, violation, 6).
act(a7, c, r2, closure, 7).   closes(a7, a3).   witnessed(a7, w1).
act(a8, b, r2, closure, 8).   closes(a8, a4).   witnessed(a8, b).

% --- working state -------------------------------------------------------
finding(A, R, P, T) :- act(A, P, R, violation, T).
valid_closure(C, F) :- closes(C, F), act(C, Actor, _, closure, _), witnessed(C, W),
                       W != Actor, finding(F, _, _, _).
closed(F) :- valid_closure(_, F).
open(F) :- finding(F, _, _, _), not closed(F).
open_of(P, F) :- open(F), finding(F, _, P, _).
open_count(P, N) :- party(P), N = #count{ F : open_of(P, F) }.
open_count_sat(P, N) :- open_count(P, N), cap_count(C), N <= C.
open_count_sat(P, C) :- open_count(P, N), cap_count(C), N > C.
age(F, A) :- open(F), finding(F, _, _, T), now(Now), cap_timer(C), A = Now - T, A <= C.
age(F, C) :- open(F), finding(F, _, _, T), now(Now), cap_timer(C), Now - T > C.

% --- rejected abstraction: latest verdict per (party, rule) ----------------
status_act(A) :- act(A, _, _, violation, _).
status_act(A) :- act(A, _, _, compliant, _).
superseded(A1) :- status_act(A1), status_act(A2), act(A1, P, R, _, T1), act(A2, P, R, _, T2), T1 < T2.
latest(A) :- status_act(A), not superseded(A).
latest_passing(P, R) :- latest(A), act(A, P, R, compliant, _).

% --- one-step approximation of the ATL requirement -----------------------
% "for any group too small to capture the gate, the others can close F".
% Only the ONE-STEP version is expressible here: is there a closer outside
% the group?  The full  <<outsiders>> F closed  is a model-checking question
% over the transition system, not a Datalog query.
coalition(c1). member(c1, a). member(c1, b).
coalition(c2). member(c2, a). member(c2, b). member(c2, c).
can_close(P, F) :- party(P), open(F), finding(F, _, S, _), P != S.
closer_outside(F, G) :- coalition(G), can_close(P, F), not member(G, P).
stuck_against(F, G) :- coalition(G), open(F), not closer_outside(F, G).

% Stronger variant: a finding about a seat-holder must be closable by a
% party outside that seat's delegation chain.
seat_holder(a).
mandate(m0, founding, a). mandate(m1, a, b). mandate(m2, founding, c).
in_chain(S, S) :- seat_holder(S).
in_chain(E, S) :- mandate(_, D, E), in_chain(D, S).
outside_chain(P, S) :- party(P), seat_holder(S), not in_chain(P, S).
closable_outside_chain(F) :- open(F), finding(F, _, S, _), seat_holder(S), can_close(P, F), outside_chain(P, S).

% EXPECT: open(a1)
% EXPECT: latest_passing(a,r1)
% EXPECT: closed(a3)
% EXPECT: open(a4)
% EXPECT-NOT: closed(a4)
% EXPECT: open_count_sat(b,2)
% EXPECT: open_count(b,3)
% EXPECT: age(a4,5)
% EXPECT: age(a6,4)
% EXPECT: closer_outside(a1,c1)
% EXPECT: stuck_against(a1,c2)
% EXPECT: closable_outside_chain(a1)
% EXPECT-NOT: outside_chain(b,a)
