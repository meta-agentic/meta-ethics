% A disputed outcome under the genesis regime (BIND.2, BIND.3). Each verdict
% would take effect under the program in force. f is the founder and the
% regime has not ended; r1's root grant is one the founder can revoke alone.
% A lapsed dispute neither imposes the consequence nor withdraws the
% protection it states; a decision by a reviewer in the founder's chain does
% not decide it; a second dispute by the same party adds nothing.

now(40).
param(contest_window, 5). param(binding_dispute_ceiling, 10).
root_grant(m0). mandate(m0, f, s). issued(m0, 0). founder(f). kind_of(f, human).
root_grant(m1). mandate(m1, r1, s). issued(m1, 0). founder_revocable(m1). kind_of(r1, human).
root_grant(m2). mandate(m2, h, s). issued(m2, 0). kind_of(h, human).
root_grant(m3). mandate(m3, r2, s). issued(m3, 0). kind_of(r2, human).
root_grant(m4). mandate(m4, n, s). issued(m4, 0). kind_of(n, nonhuman).
verdict(v1, h, 10). bears_consequence(v1). consequence_on(v1, h). filed_by(v1, n).
verdict_delivered(v1, 10). drawn_reviewer(v1, r2). reviewed(v1, r2).
verdict(v2, h, 10). bears_consequence(v2). consequence_on(v2, h). filed_by(v2, n).
verdict_delivered(v2, 10). drawn_reviewer(v2, r2). reviewed(v2, r2).
verdict(v3, n, 10). bears_consequence(v3). consequence_on(v3, n). filed_by(v3, h).
verdict_delivered(v3, 10). drawn_reviewer(v3, r2). reviewed(v3, r2).
% lapsed: disputed at 12, ceiling 10, undecided at 40
disputed(d1, v1, h). dispute_at(d1, 12). prose_protection(d1, keep_access).
% decided for the program by a reviewer in the founder's chain: no decision
disputed(d2, v2, h). dispute_at(d2, 12). dispute_decision(d2, program, r1, 15). prose_protection(d2, keep_vote).
% a non-human consequence decided by a reviewer in the founder's chain, and one
% decided by a reviewer outside it, both under the regime
verdict(v8, n, 10). bears_consequence(v8). consequence_on(v8, n). filed_by(v8, h).
verdict_delivered(v8, 10). drawn_reviewer(v8, r2). reviewed(v8, r2).
disputed(d8, v8, n). dispute_at(d8, 12). dispute_decision(d8, program, r1, 15).
verdict(v9, n, 10). bears_consequence(v9). consequence_on(v9, n). filed_by(v9, h).
verdict_delivered(v9, 10). drawn_reviewer(v9, r2). reviewed(v9, r2).
disputed(d9, v9, n). dispute_at(d9, 12). dispute_decision(d9, program, r2, 15).
% disputes by another party, and by the same party on another outcome, are first
% disputes; one within the ceiling has not lapsed
disputed(d5, v1, n). dispute_at(d5, 20).
verdict(v4, h, 10). bears_consequence(v4). consequence_on(v4, h). filed_by(v4, n).
verdict_delivered(v4, 10). drawn_reviewer(v4, r2). reviewed(v4, r2).
disputed(d6, v4, h). dispute_at(d6, 35).
% a second dispute by the same party on v1
disputed(d4, v1, h). dispute_at(d4, 30).

% EXPECT[BIND.3]: takes_effect(v1)
% EXPECT[BIND.3]: dispute_lapsed(d1)
% EXPECT[BIND.3]: binding_held(v1)
% EXPECT[BIND.3]: protection_held(keep_access)
% EXPECT-NOT[BIND.3]: bind_takes_effect(v1)
% EXPECT-NOT[BIND.3]: first_dispute(d4)
% EXPECT[BIND.3]: decider_barred(r1)
% EXPECT[BIND.3]: protection_held(keep_vote)
% EXPECT-NOT[BIND.3]: bind_takes_effect(v2)
% EXPECT-NOT[BIND.3]: upheld(d2)
% EXPECT-NOT[BIND.3]: upheld(d8)
% EXPECT[BIND.3]: upheld(d9)
% EXPECT[BIND.3]: first_dispute(d5)
% EXPECT[BIND.3]: first_dispute(d6)
% EXPECT-NOT[BIND.3]: dispute_lapsed(d6)
% EXPECT[BIND.3]: dispute_lapsed(d2)
% EXPECT[BIND.2]: bind_takes_effect(v3)
% EXPECT[BIND.2]: effective_from(v3,10)
% EXPECT-NOT[BIND.2]: binding_held(v3)
