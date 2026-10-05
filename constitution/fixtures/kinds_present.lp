% Two kinds, or no instance (P3.3): a party of each kind, so no pause.

now(5).
kind(human). kind(nonhuman).
root_grant(m0). mandate(m0, h1, s). issued(m0, 0). kind_of(h1, human).
root_grant(m1). mandate(m1, n1, s). issued(m1, 0). kind_of(n1, nonhuman).
act_of_power(w1).

% EXPECT[P3.3]: kind_present(nonhuman)
% EXPECT-NOT[P3.3]: paused
% EXPECT-NOT[P3.3]: blocked_by_pause(w1)
