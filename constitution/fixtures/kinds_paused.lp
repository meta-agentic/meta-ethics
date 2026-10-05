% Two kinds, or no instance (P3.3): every party is human, so a pause holds.

now(5).
kind(human). kind(nonhuman).
root_grant(m0). mandate(m0, h1, s). issued(m0, 0). kind_of(h1, human).
root_grant(m1). mandate(m1, h2, s). issued(m1, 0). kind_of(h2, human).
root_grant(m2). mandate(m2, n0, s). issued(m2, 0). revoked(m2, 2). kind_of(n0, nonhuman).
act_of_power(w1).
act_of_power(w2). pause_exempt(w2).
act_of_power(w3). owed(w3).
act_of_power(w4). renunciation_act(w4).

% EXPECT[P3.3]: paused
% EXPECT[P3.3]: blocked_by_pause(w1)
% EXPECT-NOT[P3.3]: blocked_by_pause(w2)
% EXPECT[P3.4]: blocked_by_pause(w1)
% EXPECT-NOT[P3.4]: blocked_by_pause(w3)
% EXPECT-NOT[P3.4]: blocked_by_pause(w4)
