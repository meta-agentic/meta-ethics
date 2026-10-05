% After the genesis regime has ended, a reviewer in the founder's chain may
% review (P2.7, H3.4, P3.2); a later exit is not yet an exit (H3.3).

now(30).
param(contest_window, 5).
regime_exit(20).
root_grant(m0). mandate(m0, f, s). issued(m0, 0). founder(f). kind_of(f, human).
root_grant(m1). mandate(m1, r1, s). issued(m1, 0). founder_revocable(m1). kind_of(r1, human).
root_grant(m3). mandate(m3, h, s). issued(m3, 0). kind_of(h, human).
verdict(v1, h, 10). bears_consequence(v1). consequence_on(v1, h). filed_by(v1, h).
verdict_delivered(v1, 10). drawn_reviewer(v1, r1). reviewed(v1, r1).
removes_last_of_kind(z1). reviewed_removal(z1, r1).

% EXPECT[P2.7]: takes_effect(v1)
% EXPECT-NOT[P2.7]: genesis_bar(r1)
% EXPECT[P3.2]: removal_effective(z1)
% EXPECT-NOT[P3.2]: removal_bar(r1)
