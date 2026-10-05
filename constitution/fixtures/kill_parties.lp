% Discriminating cases for parties, mandates, grants and attribution (A1, C7,
% A2.4): each fact set separates a rule, or a literal of one, from a near
% variant that the prose does not admit.

now(10).
root_grant(m0). mandate(m0, fd, s_all). issued(m0, 0). founder(fd). founder_revocable(m0).
scope_has(s_all, read). scope_has(s_all, write). scope_has(s_all, deploy).
mandate(m1, orch, s_orch). delegated_from(m1, m0). issued(m1, 1). carries_seat(m1, seat2). admitted(m1).
scope_has(s_orch, read). scope_has(s_orch, write).
mandate(m2, sub1, s_sub). delegated_from(m2, m1). issued(m2, 2).
scope_has(s_sub, read).
mandate(m3, w1, s_w). delegated_from(m3, m1). issued(m3, 2).
scope_has(s_w, write).
mandate(m4, w2, s_x). delegated_from(m4, m1). issued(m4, 2).
scope_has(s_x, deploy).
root_grant(m6). mandate(m6, ax, s_orch). issued(m6, 0).
mandate(m12, y, s_sub). delegated_from(m12, m1). issued(m12, 2). founder_revocable(m12).
% acceptance: by a signed act alone; not by another's act; not by an act under another mandate
mandate(mk, pk, s_sub). delegated_from(mk, m1). issued(mk, 2). terms_delivered(mk). accepts_signed(mk, 3).
mandate(mn, pn, s_sub). delegated_from(mn, m1). issued(mn, 2). terms_delivered(mn).
mandate(mo, po, s_sub). delegated_from(mo, m1). issued(mo, 2). terms_delivered(mo).
act(x9, sub1, read, 3). act_under(x9, mo).
mandate(mq1, pq, s_sub). delegated_from(mq1, m1). issued(mq1, 2). terms_delivered(mq1).
mandate(mq2, pq, s_sub). delegated_from(mq2, m1). issued(mq2, 2).
act(x8, pq, read, 3). act_under(x8, mq2).
mandate(mr, pr, s_sub). delegated_from(mr, m1). issued(mr, 2). terms_delivered(mr). accepts_signed(mr, 3). renounces(mr, 20).
% time: a mandate issued in the future, one revoked in the future
mandate(mf, pf, s_sub). delegated_from(mf, m1). issued(mf, 15).
mandate(mv, pv, s_sub). delegated_from(mv, m1). issued(mv, 1). revoked(mv, 20).
% a revoked or orphan mandate carries no seat
mandate(m5, leaver, s_sub). delegated_from(m5, m1). issued(m5, 1). revoked(m5, 5). carries_seat(m5, seat5). admitted(m5).
mandate(m9, gh2, s_sub). delegated_from(m9, m99). issued(m9, 1). carries_seat(m9, seat9). admitted(m9).
% grants
grant(g1, orch, sub1, read).
grant(g3, orch, ax, read).
grant(g4, fd, sub1, read).
grant(g5, orch, sub1, write).
grant(g9, outsider, h9, read).
% acts
act(x3, sub1, read, 4). effect(x3). act_under(x3, m2).
act(x11, sub1, read, 5). effect(x11).
act(x12, sub1, deploy, 4). act_under(x12, m2). effect(x12).
act(x10, ghost, read, 3).
act(x13, orch, write, 4). exempts(x13, fd).
act(x14, fd, write, 4). exempts(x14, fd).
act(x16, fd, write, 4). exempts(x16, orch).
act(x15, orch, write, 5). exempts(x15, orch).

% EXPECT[A1.3]: duty_runs(mk)
% EXPECT[A1.3]: duty_runs(mr)
% EXPECT-NOT[A1.3]: duty_runs(mn)
% EXPECT-NOT[A1.3]: accepted(mo)
% EXPECT-NOT[A1.3]: accepted(mq1)
% EXPECT[A1.1]: party(pv)
% EXPECT-NOT[A1.1]: party(pf)
% EXPECT-NOT[A1.1]: party(h9)
% EXPECT[A1.4]: subject(pn)
% EXPECT-NOT[A1.4]: subject(ghost)
% EXPECT[A2.4]: attributed(x3,sub1)
% EXPECT[A2.4]: attributed(x11,sub1)
% EXPECT-NOT[A2.4]: attributed(x11,orch)
% EXPECT-NOT[A2.4]: attributed(x12,orch)
% EXPECT[C7.4]: undeclared_grant(g3,orch)
% EXPECT[C7.4]: undeclared_grant(g4,fd)
% EXPECT[C7.4]: undeclared_grant(g5,orch)
% EXPECT-NOT[C7.1]: scope_violation(m2,read)
% EXPECT-NOT[C7.1]: scope_violation(m2,deploy)
% EXPECT[C7.1]: scope_violation(m4,deploy)
% EXPECT[A1.2]: seat_holder(orch,seat2)
% EXPECT-NOT[A1.2]: seat_holder(leaver,seat5)
% EXPECT-NOT[A1.2]: seat_holder(gh2,seat9)
% EXPECT-NOT[A1.2]: seat_outside_channel(seat2)
% EXPECT[A1.9]: self_exemption(x14)
% EXPECT-NOT[A1.9]: self_exemption(x13)
% EXPECT-NOT[A1.9]: self_exemption(x16)
% EXPECT-NOT[A1.9]: self_exemption(x15)
% EXPECT[C7.3]: in_chain(orch,fd)
% EXPECT-NOT[C7.3]: in_chain(fd,fd)
% EXPECT-NOT[C7.3]: grantor_of(fd,y)
