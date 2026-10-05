% Disputes decided after the genesis regime (BIND.2, BIND.3): a decision for
% the program applies forward from its time only; a decision for the text
% holds the outcome; a non-human reviewer cannot decide a dispute over a
% consequence on a human, and a non-human may decide one whose consequences
% fall only on non-human parties; a dispute decided within the ceiling has
% not lapsed.

now(40).
param(contest_window, 5). param(binding_dispute_ceiling, 10).
regime_exit(5).
root_grant(m0). mandate(m0, f, s). issued(m0, 0). founder(f). kind_of(f, human).
root_grant(m2). mandate(m2, h, s). issued(m2, 0). kind_of(h, human).
root_grant(m3). mandate(m3, r2, s). issued(m3, 0). kind_of(r2, human).
root_grant(m4). mandate(m4, n, s). issued(m4, 0). kind_of(n, nonhuman).
root_grant(m5). mandate(m5, n2, s). issued(m5, 0). kind_of(n2, nonhuman).
verdict(v3, h, 10). bears_consequence(v3). consequence_on(v3, h). filed_by(v3, n).
verdict_delivered(v3, 10). drawn_reviewer(v3, r2). reviewed(v3, r2).
verdict(v5, h, 10). bears_consequence(v5). consequence_on(v5, h). filed_by(v5, n).
verdict_delivered(v5, 10). drawn_reviewer(v5, r2). reviewed(v5, r2).
verdict(v6, h, 10). bears_consequence(v6). consequence_on(v6, h). filed_by(v6, n).
verdict_delivered(v6, 10). drawn_reviewer(v6, r2). reviewed(v6, r2).
verdict(v7, n2, 10). bears_consequence(v7). consequence_on(v7, n2). filed_by(v7, h).
verdict_delivered(v7, 10). drawn_reviewer(v7, r2). reviewed(v7, r2).
disputed(d3, v3, h). dispute_at(d3, 12). dispute_decision(d3, program, r2, 20). prose_protection(d3, keep_post).
disputed(d3b, v3, h). dispute_at(d3b, 25). prose_protection(d3b, keep_post2).
root_grant(m1). mandate(m1, r1, s). issued(m1, 0). founder_revocable(m1). kind_of(r1, human).
verdict(v10, h, 10). bears_consequence(v10). consequence_on(v10, h). filed_by(v10, n).
verdict_delivered(v10, 10). drawn_reviewer(v10, r2). reviewed(v10, r2).
disputed(d10, v10, h). dispute_at(d10, 12). dispute_decision(d10, program, r1, 20).
verdict(v13, h, 10). bears_consequence(v13). consequence_on(v13, h). filed_by(v13, n).
verdict_delivered(v13, 10). drawn_reviewer(v13, r2). reviewed(v13, r2).
verdict(v11, h, 10). bears_consequence(v11). consequence_on(v11, h). filed_by(v11, n). verdict_delivered(v11, 10).
verdict(v12, h, 10). bears_consequence(v12). consequence_on(v12, h). filed_by(v12, n). verdict_delivered(v12, 10).
disputed(d12, v12, h). dispute_at(d12, 12). dispute_decision(d12, program, r2, 20).
disputed(d5, v5, h). dispute_at(d5, 12). dispute_decision(d5, prose, r2, 20). prose_protection(d5, keep_seat).
disputed(d6, v6, h). dispute_at(d6, 12). dispute_decision(d6, program, n, 20).
disputed(d7, v7, n2). dispute_at(d7, 12). dispute_decision(d7, program, n, 20).

% EXPECT[BIND.3]: bind_takes_effect(v3)
% EXPECT[BIND.3]: effective_from(v3,20)
% EXPECT-NOT[BIND.3]: effective_from(v3,10)
% EXPECT-NOT[BIND.3]: dispute_lapsed(d3)
% EXPECT[BIND.3]: protection_held(keep_seat)
% EXPECT-NOT[BIND.3]: bind_takes_effect(v5)
% EXPECT-NOT[BIND.3]: dispute_lapsed(d5)
% EXPECT[BIND.3]: dispute_needs_human(d6)
% EXPECT-NOT[BIND.3]: bind_takes_effect(v6)
% EXPECT[BIND.3]: bind_takes_effect(v7)
% EXPECT-NOT[BIND.3]: dispute_needs_human(d7)
% EXPECT-NOT[BIND.2]: binding_held(v3)
% EXPECT-NOT[BIND.3]: protection_held(keep_post)
% EXPECT-NOT[BIND.3]: protection_held(keep_post2)
% EXPECT[BIND.3]: upheld(d10)
% EXPECT-NOT[BIND.3]: effective_from(v11,10)
% EXPECT-NOT[BIND.3]: effective_from(v12,20)
% EXPECT-NOT[BIND.3]: effective_from(v13,20)
% EXPECT[BIND.3]: effective_from(v13,10)
% EXPECT[BIND.3]: effective_from(v7,20)
% EXPECT-NOT[BIND.3]: effective_from(v7,10)
% EXPECT[BIND.2]: binding_held(v5)
