% The end of an instance in which the founder did not cause the end (P3.7,
% P3.8, P3.9): only the causer's findings and the founder's from the genesis
% regime stay open; an act under the founder's custody that did not make the
% parties one kind, and a controlled act that did not, cause nothing.

now(30).
root_grant(m0). mandate(m0, f, s). issued(m0, 0). founder(f).
root_grant(m1). mandate(m1, a, s). issued(m1, 0).
root_grant(m2). mandate(m2, e3, s). issued(m2, 0).
regime_exit(10).
act(z1, a, revoke, 20). made_one_kind(z1).
act(z9, a, revoke, 5). under_founder_custody(z9).
act(z8, a, revoke, 21). controlled_by(z8, e3).
root_grant(m4). mandate(m4, e4, s). issued(m4, 0).
act(z7, e4, revoke, 22).
finding(n7, e3, 4).
finding(n8, a, 14). closure(kx, n8). witnessed_by(kx, e3). discharges(kx, n8).
finding(n9, f, 3). closure(ky, n9). witnessed_by(ky, e3). discharges(ky, n9).
instance_ended.
finding(n3, f, 4).
finding(n4, f, 12).
finding(n5, e3, 12).
anonymized(e1, a). law_requires(e1). told_before(e1).
finding(n6, a, 13).

% EXPECT[P3.9]: kept_open(n3)
% EXPECT[P3.9]: kept_open(n6)
% EXPECT-NOT[P3.9]: kept_open(n4)
% EXPECT[P3.7]: ended_without_verdict(n4)
% EXPECT-NOT[P3.8]: causer(f)
% EXPECT-NOT[P3.8]: causer(e3)
% EXPECT[P3.8]: causer(a)
% EXPECT-NOT[P3.8]: causer(e4)
% EXPECT-NOT[P3.9]: kept_open(n7)
% EXPECT-NOT[P3.9]: kept_open(n8)
% EXPECT-NOT[P3.9]: kept_open(n9)
% EXPECT-NOT[A2.10]: anonymization_premature(e1)
