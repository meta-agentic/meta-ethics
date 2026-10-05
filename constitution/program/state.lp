% The working state (A3) and recusal against a fixed base (A2).
% Findings are minted at intake; rules decide which are open.

% clause: A3.2
valid_closure(F) :- closure(C, F), witnessed_by(C, W), discharges(C, F),
                    finding(F, P, _), W != P, not in_chain(W, P).

% clause: A3.1
open(F) :- finding(F, _, _), not valid_closure(F).
open_count(P, N) :- party(P), N = #count{ F : open(F), finding(F, P, _) }.
open_count_capped(P, N) :- open_count(P, N), param(count_ceiling, C), N <= C.
open_count_capped(P, C) :- open_count(P, N), param(count_ceiling, C), N > C.
age(F, A) :- open(F), finding(F, _, T), now(N), param(timer_ceiling, C), A = N - T, A <= C.
age(F, C) :- open(F), finding(F, _, T), now(N), param(timer_ceiling, C), N - T > C.

% clause: A2.6
recused(P, Q) :- finding(F, P, _), cites(F, Q), open(F).
eligible(Q, P) :- base(Q, P), not recused(P, Q).
base_size(Q, N) :- matter(Q), N = #count{ P : base(Q, P) }.
eligible_size(Q, N) :- matter(Q), N = #count{ P : eligible(Q, P) }.

% clause: A2.3 A2.8
citable(F, P) :- finding(F, P, T), now(N), param(citation_period, D), N - T <= D,
                 not closed_in_favour(F).
