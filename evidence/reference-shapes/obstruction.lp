% Obstruction: an instance rule "process binds power, not voice", in the
% shape the parent leaves to instances (H1).  Sub-programs: frozen roster + approval floor
% + lapse/escalate; capacity tokens; severity by class; new evidence; inform
% flooding; one pending request per pair (intake variant).
% Attacks exercised: reverse filibuster (flood short-deadline matters and let
% silence pass them), responder-quorum capture by one attentive party,
% eligibility-stripping to leave a rump, token minting, filer-set severity,
% weaponised inform.

time(0..30). now(20).
member_from(p1,0). member_from(p2,0). member_from(p3,0). member_from(p4,0).
member_from(p5,0). member_from(p6,5).
party(P) :- member_from(P, _).
party_at(P, T) :- member_from(P, T0), time(T), T0 <= T.

% ---- 3a  roster frozen at filing, approval floor, lapse, escalation --------
class(ordinary). class(l0).
share(ordinary, 1, 2). minimum(ordinary, 3). window(ordinary, 5).
share(l0, 2, 3).       minimum(l0, 3).       window(l0, 10).
% proposal(Id, Filer, FiledAt, Class)
proposal(q1, p1, 0, ordinary). approves(p2, q1). approves(p3, q1). approves(p4, q1).
proposal(q2, p1, 1, ordinary).                      % reverse-filibuster flood: silence
proposal(q3, p1, 1, ordinary).
proposal(q4, p1, 1, ordinary).
proposal(q5, p1, 2, ordinary). approves(p2, q5).    % one attentive responder
proposal(q6, p6, 3, ordinary). approves(p1, q6).    % attacker stripped p2..p5 of eligibility
implicated(p2, q6). implicated(p3, q6). implicated(p4, q6). implicated(p5, q6).
proposal(q7, p1, 16, ordinary). approves(p2, q7).   % still inside its window

roster(Q, P) :- proposal(Q, _, T, _), party_at(P, T), not implicated(P, Q).
roster_size(Q, N) :- proposal(Q, _, _, _), N = #count{ P : roster(Q, P) }.
approvals(Q, N) :- proposal(Q, _, _, _), N = #count{ P : approves(P, Q), roster(Q, P) }.
too_few(Q) :- roster_size(Q, N), proposal(Q, _, _, C), minimum(C, Min), N < Min.
passes(Q) :- proposal(Q, _, _, C), approvals(Q, A), roster_size(Q, R), share(C, Num, Den),
             minimum(C, Min), A * Den >= R * Num, A >= Min, not too_few(Q).
window_closed(Q) :- proposal(Q, _, T, C), window(C, L), now(N), T + L < N.
lapses(Q) :- proposal(Q, _, _, _), window_closed(Q), not passes(Q), not too_few(Q).
escalates(Q) :- too_few(Q).
undecided(Q) :- proposal(Q, _, _, _), not passes(Q), not lapses(Q), not escalates(Q).
% rejected: responder quorum
responded(P, Q) :- approves(P, Q).
responded(P, Q) :- rejects(P, Q).
responders(Q, N) :- proposal(Q, _, _, _), N = #count{ P : responded(P, Q) }.
passes_responder(Q) :- proposal(Q, _, _, C), approvals(Q, A), responders(Q, R), share(C, Num, Den),
                       R > 0, A * Den >= R * Num.

% ---- 3b  capacity tokens: issued at the founding document, passed with mandates
token(t1). token(t2). token(t3). token(t4). token(t5). token(t6).
founding(founder).
mandate(m1, founder, orch). mandate(m2, orch, sub1). mandate(m3, orch, sub2). mandate(m4, orch, sub3).
holder_party(founder). holder_party(orch). holder_party(sub1). holder_party(sub2). holder_party(sub3).
pass(t1, m1). pass(t2, m1). pass(t3, m1).   % founder -> orch: 3 tokens
pass(t1, m2).                               % orch -> sub1
pass(t2, m3).                               % orch -> sub2
pass(t4, m4).                               % orch -> sub3: orch never held t4 (minting attempt)
pass(t2, m4).                               % orch -> sub3: t2 passed twice (double-spend attempt)
holds_token(P, T) :- founding(P), token(T).
holds_token(E, T) :- pass(T, M), mandate(M, D, E), holds_token(D, T).
bad_pass(T, M) :- pass(T, M), mandate(M, D, _), not holds_token(D, T).
double_pass(T, D) :- pass(T, M1), pass(T, M2), M1 != M2, mandate(M1, D, _), mandate(M2, D, _).
passed_on(D, T) :- pass(T, M), mandate(M, D, _), holds_token(D, T).
holder(P, T) :- holds_token(P, T), not passed_on(P, T).
capacity(P, N) :- holder_party(P), N = #count{ T : holder(P, T) }.
total_held(N) :- N = #count{ P, T : holder(P, T) }.
total_issued(N) :- N = #count{ T : token(T) }.
conservation_broken :- total_held(H), total_issued(I), H != I.

% ---- 3c  severity from rule class, never from the filer; waiting raises priority
rule_class(r_safety, 3). rule_class(r_style, 1).
cites_rule(q1, r_style). filer_severity(q1, 3).
cites_rule(q2, r_safety).
severity(Q, S) :- cites_rule(Q, R), rule_class(R, S).
wait_cap(10).
waited(Q, W) :- proposal(Q, _, T, _), now(N), wait_cap(C), W = N - T, W <= C.
waited(Q, C) :- proposal(Q, _, T, _), now(N), wait_cap(C), N - T > C.
priority(Q, Pr) :- severity(Q, S), waited(Q, W), Pr = S + W.
severity_by_implicated(Q) :- severity_set(Q, By), implicated(By, Q).   % reopen trigger

% ---- 3d  new evidence: absent from the prior verdict's provenance AND
%          witnessed after that verdict closed
verdict(v1, mt1, 10). provenance(v1, e1). provenance(v1, e2).
evidence(e1, mt1, 3). evidence(e2, mt1, 4). evidence(e3, mt1, 12). evidence(e4, mt1, 8).
new_evidence(E, Mt) :- evidence(E, Mt, Tw), verdict(V, Mt, Tc), not provenance(V, E), Tc < Tw.
absent_only(E, Mt) :- evidence(E, Mt, _), verdict(V, Mt, _), not provenance(V, E).
lever_ceiling(2).
repeat_of(rp1, mt1, p1). repeat_of(rp2, mt1, p1). repeat_of(rp3, mt1, p1).
repeats_by(F, Mt, N) :- repeat_of(_, Mt, F), N = #count{ R : repeat_of(R, Mt, F) }.
over_ceiling(F, Mt) :- repeats_by(F, Mt, N), lever_ceiling(C), N > C.

% ---- 3e  weaponised inform: beyond a recipient's capacity, one sender's
%          deliveries establish no knowledge (D15: witnessed by a non-party collector)
period(per1). in_period(T, per1) :- time(T), T <= 10.
sender(mallory). sender(alice). recipient(bob).
recipient_capacity(bob, per1, 3).
delivered(d1, mallory, bob, risk_x, 1). delivered(d2, mallory, bob, risk_x, 2).
delivered(d3, mallory, bob, risk_x, 3). delivered(d4, mallory, bob, risk_x, 4).
delivered(d5, mallory, bob, risk_x, 5).
delivered(d6, alice, bob, risk_y, 4).
witness(d1, w1). witness(d2, w1). witness(d3, w1). witness(d4, w1). witness(d5, w1). witness(d6, w1).
deliveries_from(S, R, Per, N) :- sender(S), recipient(R), period(Per),
                                 N = #count{ D : delivered(D, S, R, _, T), in_period(T, Per) }.
flooded(S, R, Per) :- deliveries_from(S, R, Per, N), recipient_capacity(R, Per, Cap), N > Cap.
knew(R, Risk, T) :- delivered(D, S, R, Risk, T), witness(D, W), W != S, W != R,
                    in_period(T, Per), not flooded(S, R, Per).

% ---- 3f  one pending request per sender/recipient pair — INTAKE variant:
%          every admitted request occupies the slot until answered or expired
req_window(5).
request(rq1, s, r, 1). request(rq2, s, r, 2). request(rq3, s, r, 9).
answered(rq1, 5).
answered_by(Rq, T) :- answered(Rq, Ta), time(T), Ta <= T.
expired_by(Rq, T) :- request(Rq, _, _, T0), req_window(L), time(T), T0 + L < T.
pending_at(Rq, T) :- request(Rq, _, _, T0), time(T), T0 <= T, not answered_by(Rq, T), not expired_by(Rq, T).
blocked(Rq2) :- request(Rq2, S, R, T2), request(Rq1, S, R, T1), Rq1 != Rq2, T1 < T2, pending_at(Rq1, T2).

% EXPECT: passes(q1)
% EXPECT: lapses(q2)
% EXPECT: lapses(q3)
% EXPECT: lapses(q4)
% EXPECT: lapses(q5)
% EXPECT: passes_responder(q5)
% EXPECT-NOT: passes(q5)
% EXPECT: too_few(q6)
% EXPECT: escalates(q6)
% EXPECT-NOT: passes(q6)
% EXPECT: undecided(q7)
% EXPECT: capacity(sub3,1)
% EXPECT: total_held(7)
% EXPECT: capacity(sub1,1)
% EXPECT: bad_pass(t4,m4)
% EXPECT: double_pass(t2,orch)
% EXPECT: conservation_broken
% EXPECT: severity(q1,1)
% EXPECT-NOT: severity(q1,3)
% EXPECT: priority(q2,13)
% EXPECT: new_evidence(e3,mt1)
% EXPECT-NOT: new_evidence(e4,mt1)
% EXPECT: absent_only(e4,mt1)
% EXPECT: over_ceiling(p1,mt1)
% EXPECT: knew(bob,risk_y,4)
% EXPECT-NOT: knew(bob,risk_x,1)
% EXPECT: flooded(mallory,bob,per1)
% EXPECT: blocked(rq2)
% EXPECT-NOT: blocked(rq3)
