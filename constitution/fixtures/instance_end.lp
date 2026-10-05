% The end of an instance whose parties became all of one kind (P3.7, P3.8,
% P3.9, P3.12). f is the founder; the regime ended at 10. a's act made the
% parties one kind; b renounced its own mandate; c acted under custody the
% founder can override, which makes the founder a causer; g rebutted that
% presumption for its own act; d acted as e controlled.

now(30).
root_grant(m0). mandate(m0, f, s). issued(m0, 0). founder(f).
root_grant(m1). mandate(m1, a, s). issued(m1, 0).
root_grant(m2). mandate(m2, b, s). issued(m2, 0).
root_grant(m3). mandate(m3, c, s). issued(m3, 0).
root_grant(m4). mandate(m4, d, s). issued(m4, 0).
root_grant(m5). mandate(m5, e, s). issued(m5, 0).
root_grant(m6). mandate(m6, g, s). issued(m6, 0).
regime_exit(10).
act(z1, a, revoke, 20). made_one_kind(z1).
act(z2, b, renounce, 21). made_one_kind(z2). renunciation_act(z2).
act(z3, c, revoke, 5). made_one_kind(z3). under_founder_custody(z3).
act(z4, d, revoke, 22). made_one_kind(z4). controlled_by(z4, e).
act(z5, g, revoke, 6). made_one_kind(z5). under_founder_custody(z5). rebutted(z5).
instance_ended.
finding(n1, a, 15).
finding(n2, b, 15).
finding(n3, f, 4).
finding(n4, f, 12).
finding(n5, e, 16).
finding(n6, d, 16).

% EXPECT[P3.8]: causer(a)
% EXPECT[P3.8]: causer(e)
% EXPECT-NOT[P3.8]: causer(b)
% EXPECT-NOT[P3.8]: causer(c)
% EXPECT-NOT[P3.8]: causer(d)
% EXPECT[P3.12]: causer(g)
% EXPECT-NOT[P3.12]: founder_presumed(z5)
% EXPECT[P3.8]: causer(f)
% EXPECT[P3.9]: kept_open(n1)
% EXPECT[P3.9]: kept_open(n3)
% EXPECT[P3.9]: kept_open(n5)
% EXPECT[P3.9]: kept_open(n4)
% EXPECT-NOT[P3.9]: kept_open(n2)
% EXPECT[P3.7]: ended_without_verdict(n2)
% EXPECT[P3.7]: ended_without_verdict(n6)
% EXPECT-NOT[P3.7]: ended_without_verdict(n1)
