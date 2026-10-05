% Acts with no status quo (P1.10) and acts by an instance that cannot prove
% continuity (S2.5). g grants n access; n's mandate is under g's.

now(30).
param(owed_content_ceiling, 5).
root_grant(m0). mandate(m0, h, s). issued(m0, 0). carries_seat(m0, ch). admitted(m0).
root_grant(m1). mandate(m1, a, s). issued(m1, 0). carries_seat(m1, ca). admitted(m1).
custodian_seat(ch). custodian_seat(ca).
root_grant(m2). mandate(m2, g, s). issued(m2, 0).
mandate(m3, n, s). delegated_from(m3, m2). issued(m3, 0).
scope_has(s, write).
choice_needed(c1). option(c1, o1). option(c1, o2). no_status_quo(c1). choice_since(c1, 10).
choice(ch, c1, o1). choice(ca, c1, o2).
choice_needed(c2). option(c2, o1). no_status_quo(c2). choice_since(c2, 28).
choice_needed(c3). option(c3, o1). option(c3, o2). choice(ch, c3, o1). choice(ca, c3, o2). choice_since(c3, 10).
act(x1, n, write, 5). act_under(x1, m3). continuity_failed(x1). access_granted_by(x1, g).
act(x2, n, write, 6). act_under(x2, m3). access_granted_by(x2, z).
root_grant(m4). mandate(m4, z, s). issued(m4, 0).
choice_needed(c4). option(c4, o1). no_status_quo(c4). choice_since(c4, 10). choice(ch, c4, o1). choice(ca, c4, o1).

% EXPECT[P1.10]: drawn_decides(c1)
% EXPECT-NOT[P1.10]: status_quo(c1)
% EXPECT-NOT[P1.10]: drawn_decides(c2)
% EXPECT-NOT[P1.10]: drawn_decides(c3)
% EXPECT[P1.2]: status_quo(c3)
% EXPECT[S2.5]: continuity_finding(x1)
% EXPECT[S2.5]: attributed(x1,g)
% EXPECT[S2.5]: attributed(x2,n)
% EXPECT-NOT[S2.5]: attributed(x1,n)
% EXPECT-NOT[S2.5]: continuity_finding(x2)
% EXPECT-NOT[S2.5]: attributed(x2,z)
% EXPECT-NOT[P1.10]: drawn_decides(c4)
% EXPECT[P1.10]: chosen(c4,o1)
