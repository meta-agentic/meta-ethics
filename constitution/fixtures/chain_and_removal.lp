% A chain-attributed finding (P2.3) and the removal of the last party of a
% kind (P3.2). f is the founder; r1's root grant is one the founder can
% revoke alone. The regime has not ended.

now(10).
param(citation_period, 50).
root_grant(m0). mandate(m0, f, s). issued(m0, 0). founder(f). kind_of(f, human).
root_grant(m1). mandate(m1, r1, s). issued(m1, 0). founder_revocable(m1). kind_of(r1, human).
root_grant(m2). mandate(m2, r2, s). issued(m2, 0). kind_of(r2, human).
root_grant(m3). mandate(m3, h, s). issued(m3, 0). kind_of(h, human).
root_grant(m4). mandate(m4, n, s). issued(m4, 0). kind_of(n, nonhuman).
mandate(m5, n2, s). delegated_from(m5, m4). issued(m5, 0). kind_of(n2, nonhuman).
finding(g1, n2, 5).
attributed_via_chain(g1, h). attributed_via_chain(g1, n). attributed_via_chain(g1, r2).
attribution_reviewed(g1, r2, r1).
removes_last_of_kind(z1). reviewed_removal(z1, r1).
removes_last_of_kind(z2). reviewed_removal(z2, r2).
removes_last_of_kind(z3).

finding(g2, n2, 5). closed_in_favour(g2). attributed_via_chain(g2, n).
attribution_reviewed(g1, h, n).
attributed_via_chain(g2, r2). attribution_reviewed(g2, r2, r1).

% EXPECT-NOT[P2.3]: citable_through_chain(g2,n)
% EXPECT-NOT[P2.3]: citable_through_chain(g2,r2)
% EXPECT-NOT[P2.3]: citable_through_chain(g1,n2)
% EXPECT-NOT[P3.2]: removal_provisional(z2)
% EXPECT[P2.3]: citable_through_chain(g1,n)
% EXPECT[P2.3]: citable_through_chain(g1,r2)
% EXPECT-NOT[P2.3]: citable_through_chain(g1,h)
% EXPECT[P3.2]: removal_effective(z2)
% EXPECT[P3.2]: removal_provisional(z1)
% EXPECT[P3.2]: removal_provisional(z3)
% EXPECT-NOT[P3.2]: removal_effective(z1)
