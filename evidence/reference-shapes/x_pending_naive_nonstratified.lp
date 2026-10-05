% The NAIVE reading of "one pending request per pair" in which a blocked
% request does not itself occupy the slot.  This is what the rule means if
% admissibility is computed as a rule over the whole log instead of at
% intake.  It is NOT stratified: blocked depends negatively on pending, and
% pending on not blocked, over the same predicate.  Kept as evidence that
% the rule must be read at intake (fix: obstruction.lp, section 3f).
time(0..12).
req_window(5).
request(rq1, s, r, 1). request(rq2, s, r, 2). request(rq3, s, r, 9).
answered(rq1, 5).
answered_by(Rq, T) :- answered(Rq, Ta), time(T), Ta <= T.
expired_by(Rq, T) :- request(Rq, _, _, T0), req_window(L), time(T), T0 + L < T.
pending_at(Rq, T) :- request(Rq, _, _, T0), time(T), T0 <= T, not answered_by(Rq, T),
                     not expired_by(Rq, T), not blocked(Rq).
blocked(Rq2) :- request(Rq2, S, R, T2), request(Rq1, S, R, T1), Rq1 != Rq2, T1 < T2, pending_at(Rq1, T2).
% EXPECT: blocked(rq2)
