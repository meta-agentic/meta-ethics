% Parties, mandates, seats and attribution (A1, C7, A2.4, C21.2).
% A root grant to founder and one to agentx; orch under founder; sub1 and sub2
% under orch, sub2's scope escalating; a revoked leaver; a chain that never
% reaches the root; an undeclared grant to contractor; an unadmitted seat.

now(10).
root_grant(m0). mandate(m0, founder, s_all). issued(m0, 0). carries_seat(m0, seat1). admitted(m0).
root_grant(m6). mandate(m6, agentx, s_orch). issued(m6, 0).
scope_has(s_all, read). scope_has(s_all, write). scope_has(s_all, deploy). scope_has(s_all, vote).
mandate(m1, orch, s_orch). delegated_from(m1, m0). issued(m1, 1). carries_seat(m1, seat2). admitted(m1).
scope_has(s_orch, read). scope_has(s_orch, write).
mandate(m2, sub1, s_sub). delegated_from(m2, m1). issued(m2, 2). carries_seat(m2, seat3).
scope_has(s_sub, read).
mandate(m3, sub2, s_esc). delegated_from(m3, m1). issued(m3, 2).
scope_has(s_esc, read). scope_has(s_esc, deploy).
mandate(m5, leaver, s_orch). delegated_from(m5, m0). issued(m5, 1). revoked(m5, 5).
mandate(m9, gh2, s_sub). delegated_from(m9, m99). issued(m9, 1).
mandate(m7, sub3, s_sub). delegated_from(m7, m1). issued(m7, 3). accepts_signed(m7, 4).
grant(g1, orch, sub1, read).
grant(g2, orch, contractor, write).
act(x1, contractor, write, 4). effect(x1).
act(x2, leaver, write, 6). effect(x2).
act(x3, sub1, read, 4). effect(x3). act_under(x3, m2).
act(x4, outsider, read, 4). effect(x4).
terms_delivered(m2).
terms_delivered(m3). accepts_signed(m3, 3). renounces(m3, 8).
founder(founder). act(x5, founder, write, 9). exempts(x5, founder).
mandate(m8, quitter, s_sub). delegated_from(m8, m1). issued(m8, 1). revoked(m8, 2).
proposal(q1). approves(founder, q1). approves(orch, q1). approves(sub1, q1). approves(outsider, q1).

% EXPECT[A1.1]: party(sub1)
% EXPECT[A1.1]: party(contractor)
% EXPECT-NOT[A1.1]: party(gh2)
% EXPECT-NOT[A1.1]: party(leaver)
% EXPECT-NOT[A1.1]: party(outsider)
% EXPECT[C7.3]: reaches(m2)
% EXPECT-NOT[C7.3]: above(founder,agentx)
% EXPECT[C7.1]: scope_violation(m3,deploy)
% EXPECT-NOT[C7.1]: scope_violation(m2,read)
% EXPECT[C7.4]: undeclared_grant(g2,orch)
% EXPECT-NOT[C7.4]: undeclared_grant(g1,orch)
% EXPECT[A1.2]: seat_holder(orch,seat2)
% EXPECT[A1.2]: seat_outside_channel(seat3)
% EXPECT[A1.2]: approvals(q1,2)
% EXPECT-NOT[A1.2]: seat_holder(sub1,seat3)
% EXPECT-NOT[A1.2]: approvals(q1,4)
% EXPECT[A1.3]: duty_runs(m2)
% EXPECT-NOT[A1.3]: duty_runs(m7)
% EXPECT-NOT[A1.3]: duty_runs(m3)
% EXPECT[A1.4]: subject(outsider)
% EXPECT[A1.4]: holds_inform(sub1)
% EXPECT-NOT[A1.4]: holds_inform(outsider)
% EXPECT[A1.8]: subject(founder)
% EXPECT-NOT[A1.8]: subject(quitter)
% EXPECT[A1.9]: self_exemption(x5)
% EXPECT-NOT[A1.9]: self_exemption(x3)
% EXPECT[A2.4]: attributed(x3,orch)
% EXPECT[A2.4]: attributed(x3,founder)
% EXPECT[A2.4]: attributed(x1,orch)
% EXPECT-NOT[A2.4]: attributed(x3,agentx)
% EXPECT[C21.2]: in_chain(orch,sub1)
% EXPECT[C21.2]: in_chain(sub1,founder)
% EXPECT-NOT[C21.2]: in_chain(founder,agentx)
