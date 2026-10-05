% The genesis regime has not ended (H3.3): a finding naming the founder stays
% open whatever closes it, and every act of power is marked.

now(20).
root_grant(m0). mandate(m0, f, s). issued(m0, 0). founder(f).
root_grant(m1). mandate(m1, c, s). issued(m1, 0).
power_at(w1, 18).
regime_exit(25).
act(z1, c, revoke, 5). made_one_kind(z1).
finding(g5, c, 6).
finding(g3, f, 4). closure(k3, g3). witnessed_by(k3, c). discharges(k3, g3).
finding(g4, c, 4). closure(k4, g4). witnessed_by(k4, f). discharges(k4, g4).

% EXPECT[H3.3]: founder_finding_held(g3)
% EXPECT[H3.3]: open(g3)
% EXPECT[H3.3]: marked_regime(w1)
% EXPECT-NOT[H3.3]: valid_closure(g3)
% EXPECT-NOT[H3.3]: regime_exited
% EXPECT-NOT[P3.9]: kept_open(g3)
% EXPECT-NOT[P3.9]: kept_open(g5)
% EXPECT-NOT[H3.3]: open(g4)
