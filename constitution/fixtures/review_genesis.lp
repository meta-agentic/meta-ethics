% Review under the genesis regime (P2.7, H3.4, C7.3). f is the founder; the
% root-granted mandate of r1 is one the founder can revoke alone, so r1 is in
% the founder's chain; r2's is not. The regime has not ended.

now(30).
param(contest_window, 5).
root_grant(m0). mandate(m0, f, s). issued(m0, 0). founder(f). kind_of(f, human).
root_grant(m1). mandate(m1, r1, s). issued(m1, 0). founder_revocable(m1). kind_of(r1, human).
root_grant(m2). mandate(m2, r2, s). issued(m2, 0). kind_of(r2, human).
root_grant(m3). mandate(m3, h, s). issued(m3, 0). kind_of(h, human).
verdict(v1, h, 10). bears_consequence(v1). consequence_on(v1, h). filed_by(v1, r2).
verdict_delivered(v1, 10). drawn_reviewer(v1, r1). reviewed(v1, r1).
verdict(v2, h, 10). bears_consequence(v2). consequence_on(v2, h). filed_by(v2, r1).
verdict_delivered(v2, 10). drawn_reviewer(v2, r2). reviewed(v2, r2).
verdict(v3, r2, 10). bears_consequence(v3). consequence_on(v3, r2). filed_by(v3, h).
verdict_delivered(v3, 10). drawn_reviewer(v3, f). reviewed(v3, f).

mandate(m5, r3, s). delegated_from(m5, m2). issued(m5, 0). kind_of(r3, human).
root_grant(m6). mandate(m6, r4, s). issued(m6, 0). founder_revocable(m6). kind_of(r4, human).
verdict(v4, h, 10). bears_consequence(v4). consequence_on(v4, h). filed_by(v4, h).
verdict_delivered(v4, 10). drawn_reviewer(v4, r3). reviewed(v4, r3).

% EXPECT[P2.7]: takes_effect(v4)
% EXPECT-NOT[H3.4]: genesis_bar(r4)
% EXPECT[C7.3]: in_chain(r1,f)
% EXPECT-NOT[C7.3]: in_chain(r2,f)
% EXPECT[P2.7]: provisional(v1)
% EXPECT[P2.7]: takes_effect(v2)
% EXPECT-NOT[P2.7]: takes_effect(v1)
% EXPECT[H3.4]: genesis_bar(f)
% EXPECT[H3.4]: provisional(v3)
% EXPECT-NOT[H3.4]: genesis_bar(r2)
