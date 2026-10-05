% After an instance has ended (LV, as proposed, with P3.7): no finding is
% cited and no interim measure survives, as in the program in force.

now(100).
param(citation_period, 50). param(interim_ceiling, 50).
root_grant(m3). mandate(m3, h3, s). issued(m3, 0).
instance_ended.
finding(g2, h3, 80). interim(i2, g2, 80).

% EXPECT-NOT[LV.3]: pr_citable(g2,h3)
% EXPECT-NOT[LV.3]: pr_interim_active(i2)
