% Sameness: an instance rule "targets are typed; only materiality is judged"
% and the parent's C11/H1 sameness floor.
% Typed targets make matter identity and repeats id-based (paraphrase has
% nothing to act on); the materiality judgement is an ATTESTED input fact;
% pending is three-valued; the judge is drawn by lot after filing from a seed
% that is itself an attested fact (chain head witnessed after filing).
% Attacks exercised: paraphrase evasion, unattributed attested fact (C11
% trigger), preclusion of someone never heard, judge from the filer's branch.

time(0..20). now(12).
founding(root).
mandate(m0, root, founder). mandate(m1, founder, filer1). mandate(m2, founder, bob).
mandate(m3, founder, judgeA). mandate(m4, judgeA, judgeB). mandate(m5, founder, judgeC).
mandate(m6, filer1, judgeX).            % judgeX sits in filer1's branch
mandate(m7, founder, judgeY).           % judgeY took part in the prior matter
mandate(m8, founder, carol).            % carol was never heard
party(P) :- mandate(_, _, P), P != founder.

% request(Id, Filer, FiledAt)   cites(Id, Kind, Target)   text(Id, Hash)
request(rq1, filer1, 1). cites(rq1, rule, r1). cites(rq1, subject, bob). cites(rq1, finding, f1).
text(rq1, h_aaa). lever(rq1, contest).
request(rq2, filer1, 2). cites(rq2, rule, r1). cites(rq2, subject, bob). cites(rq2, finding, f1).
text(rq2, h_bbb). lever(rq2, contest).            % paraphrase of rq1
request(rq3, filer1, 3). cites(rq3, rule, r1). text(rq3, h_ccc). lever(rq3, contest).  % untyped
request(rq4, filer1, 4). cites(rq4, rule, r1). cites(rq4, subject, bob). cites(rq4, finding, f1).
text(rq4, h_ddd). lever(rq4, contest).            % repeat with new evidence
request(rq5, filer1, 5). cites(rq5, rule, r1). cites(rq5, subject, bob). cites(rq5, finding, f1).
text(rq5, h_eee). lever(rq5, contest).            % repeat, judge silent past window
heard(bob, rq1). heard(filer1, rq1). heard(judgeY, rq1).
against_voice(rq2). against_voice(rq5). against_power(rq4).
judge_window(4).
% judgement(Id, Request, Answer, Judge, T) — attested acts; act_of attributes them
judgement(j1, rq2, immaterial, judgeA, 5). act_of(j1, judgeA).
judgement(j2, rq2, immaterial, judgeB, 5). act_of(j2, judgeB).
judgement(j3, rq4, material, judgeC, 6).                  % no act_of: unattributed
% seed(Request, Int) — chain head witnessed after filing, as attested integer
seed(rq2, 7). seed(rq5, 11).

% --- admissibility: typed targets ---------------------------------------
has_target(Rq) :- cites(Rq, finding, _).
has_target(Rq) :- cites(Rq, proposal, _).
admissible(Rq) :- request(Rq, _, _), cites(Rq, rule, _), cites(Rq, subject, _), has_target(Rq).
inadmissible(Rq) :- request(Rq, _, _), not admissible(Rq).
matter(Rq, R, S) :- admissible(Rq), cites(Rq, rule, R), cites(Rq, subject, S).
repeat(Rq2, Rq1) :- matter(Rq1, R, S), matter(Rq2, R, S), request(Rq1, _, T1), request(Rq2, _, T2),
                    T1 < T2, lever(Rq1, L), lever(Rq2, L).
first_prior(Rq2, Rq1) :- repeat(Rq2, Rq1), not earlier_prior(Rq2, Rq1).
earlier_prior(Rq2, Rq1) :- repeat(Rq2, Rq1), repeat(Rq2, Rq0), request(Rq0, _, T0), request(Rq1, _, T1), T0 < T1.

% --- materiality: judged, three-valued ------------------------------------
immaterial(Rq) :- against_voice(Rq), N = #count{ Jd : judgement(_, Rq, immaterial, Jd, _) }, N >= 2.
immaterial(Rq) :- against_power(Rq), judgement(_, Rq, immaterial, _, _).
material(Rq) :- judgement(_, Rq, material, _, _).
judged(Rq) :- immaterial(Rq).
judged(Rq) :- material(Rq).
window_passed(Rq) :- request(Rq, _, T), judge_window(L), now(N), T + L < N.
admitted(Rq) :- material(Rq).
admitted(Rq) :- repeat(Rq, _), not judged(Rq), window_passed(Rq).        % judge silence admits
admitted(Rq) :- repeat(Rq, _), not has_eligible_judge(Rq).                % no eligible judge admits
pending(Rq) :- repeat(Rq, _), not judged(Rq), not window_passed(Rq), has_eligible_judge(Rq).
blocked(Rq) :- repeat(Rq, _), not admitted(Rq), not pending(Rq).
attached(Rq, Prior) :- immaterial(Rq), first_prior(Rq, Prior).
bound(P, Rq) :- attached(Rq, Prior), heard(P, Prior).
unattributed(J) :- judgement(J, _, _, _, _), not act_of(J, _).            % C11 reopen trigger

% --- judge eligibility and lottery -----------------------------------------
branch(P, P) :- mandate(_, founder, P).
branch(E, R) :- mandate(_, D, E), branch(D, R).
side(Rq, F) :- request(Rq, F, _).
side(Rq, S) :- cites(Rq, subject, S).
shares_branch(J, X) :- branch(J, R), branch(X, R).
conflicted(Rq, J) :- side(Rq, X), party(J), shares_branch(J, X).
conflicted(Rq, J) :- repeat(Rq, Prior), heard(J, Prior).
eligible_judge(Rq, J) :- repeat(Rq, _), party(J), not conflicted(Rq, J).
has_eligible_judge(Rq) :- eligible_judge(Rq, _).
n_eligible(Rq, N) :- repeat(Rq, _), N = #count{ J : eligible_judge(Rq, J) }.
rank(Rq, J, K) :- eligible_judge(Rq, J), K = #count{ J2 : eligible_judge(Rq, J2), J2 < J }.
drawn(Rq, J) :- seed(Rq, Sd), n_eligible(Rq, N), N > 0, K = Sd \ N, rank(Rq, J, K).

% --- subject's answer is never delayed by a sameness finding --------------
reply(rp1, bob, f1). finding_about(f1, bob).
reply_admissible(Rp) :- reply(Rp, S, F), finding_about(F, S).

% EXPECT: inadmissible(rq3)
% EXPECT: repeat(rq2,rq1)
% EXPECT: immaterial(rq2)
% EXPECT: blocked(rq2)
% EXPECT: material(rq4)
% EXPECT: admitted(rq4)
% EXPECT-NOT: blocked(rq4)
% EXPECT: admitted(rq5)
% EXPECT-NOT: pending(rq5)
% EXPECT: bound(bob,rq2)
% EXPECT-NOT: bound(carol,rq2)
% EXPECT: unattributed(j3)
% EXPECT-NOT: eligible_judge(rq2,judgeX)
% EXPECT-NOT: eligible_judge(rq2,judgeY)
% EXPECT-NOT: eligible_judge(rq2,bob)
% EXPECT: eligible_judge(rq2,judgeA)
% EXPECT: n_eligible(rq2,4)
% EXPECT: reply_admissible(rp1)
