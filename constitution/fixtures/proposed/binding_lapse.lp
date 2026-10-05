% Disputed outcomes under the genesis regime (BIND.2, BIND.3). Each verdict
% would take effect under the program in force. f is the founder and the
% regime has not ended; r1's root grant is one the founder can revoke alone.
% A lapsed dispute neither imposes the consequence on the disputant nor
% withdraws the protection it states, and confers nothing beyond that; a
% decision by a reviewer in the founder's chain decides nothing; a party
% without standing cannot dispute; disputes of one outcome are joined.

now(40).
param(contest_window, 5). param(binding_dispute_ceiling, 10).
root_grant(m0). mandate(m0, f, s). issued(m0, 0). founder(f). kind_of(f, human).
root_grant(m1). mandate(m1, r1, s). issued(m1, 0). founder_revocable(m1). kind_of(r1, human).
root_grant(m2). mandate(m2, h, s). issued(m2, 0). kind_of(h, human). carries_seat(m2, ch). admitted(m2).
root_grant(m3). mandate(m3, r2, s). issued(m3, 0). kind_of(r2, human).
root_grant(m4). mandate(m4, n, s). issued(m4, 0). kind_of(n, nonhuman).
root_grant(m5). mandate(m5, o, s). issued(m5, 0). kind_of(o, human).
custodian_seat(ch).
verdict(v1, h, 10). bears_consequence(v1). consequence_on(v1, h). filed_by(v1, n).
verdict_delivered(v1, 10). drawn_reviewer(v1, r2). reviewed(v1, r2).
verdict(v2, h, 10). bears_consequence(v2). consequence_on(v2, h). filed_by(v2, n).
verdict_delivered(v2, 10). drawn_reviewer(v2, r2). reviewed(v2, r2).
verdict(v3, n, 10). bears_consequence(v3). consequence_on(v3, n). filed_by(v3, h).
verdict_delivered(v3, 10). drawn_reviewer(v3, r2). reviewed(v3, r2).
verdict(v8, n, 10). bears_consequence(v8). consequence_on(v8, n). filed_by(v8, h).
verdict_delivered(v8, 10). drawn_reviewer(v8, r2). reviewed(v8, r2).
verdict(v9, n, 10). bears_consequence(v9). consequence_on(v9, n). filed_by(v9, h).
verdict_delivered(v9, 10). drawn_reviewer(v9, r2). reviewed(v9, r2).
verdict(v4, h, 10). bears_consequence(v4). consequence_on(v4, h). filed_by(v4, n).
verdict_delivered(v4, 10). drawn_reviewer(v4, r2). reviewed(v4, r2).
% v1: disputed by its subject at 12; ceiling 10; undecided at 40. Its stated
% reading would also pass an act and keep a seat: nothing follows from that.
disputed(d1, v1, h). dispute_at(d1, 12). withheld_protection(v1, h, keep_access).
claimed_act(v1, q1). matter_of(q1, x1).
% a second dispute by the same party adds nothing; a later dispute by another
% party with standing is joined, and the ceiling still runs from the first
disputed(d4, v1, h). dispute_at(d4, 30).
withheld_protection(v1, o, keep_vote). disputed(d5, v1, o). dispute_at(d5, 35).
% a party with no standing on v3 disputes it: refused
disputed(d7, v3, o). dispute_at(d7, 12).
% v2: decided for the program by a reviewer in the founder's chain: decides nothing
disputed(d2, v2, h). dispute_at(d2, 12). dispute_decision(v2, program, r1, 15).
withheld_protection(v2, h, keep_post).
% v8: non-human consequence, decided by a reviewer in the founder's chain; v9 by
% a reviewer outside it
disputed(d8, v8, n). dispute_at(d8, 12). dispute_decision(v8, program, r1, 15).
disputed(d9, v9, n). dispute_at(d9, 12). dispute_decision(v9, program, r2, 15).
% vl: a refused dispute at 15 neither starts nor joins the ceiling; the first
% admitted dispute at 20 starts it, and it lapses by 40
verdict(vl, h, 10). bears_consequence(vl). consequence_on(vl, h). filed_by(vl, n).
verdict_delivered(vl, 10). drawn_reviewer(vl, r2). reviewed(vl, r2).
disputed(dr, vl, n). dispute_at(dr, 15).
disputed(da, vl, h). dispute_at(da, 20).
% r2's protection is withheld by v4, but r2 does not dispute
withheld_protection(v4, r2, keep_x).
% v4: within the ceiling
disputed(d6, v4, h). dispute_at(d6, 35).

% EXPECT[BIND.3]: takes_effect(v1)
% EXPECT[BIND.3]: dispute_lapsed(v1)
% EXPECT[BIND.3]: dispute_open(v1)
% EXPECT[BIND.3]: binding_held(v1)
% EXPECT[BIND.3]: protection_held(keep_access,h)
% EXPECT[BIND.3]: protection_held(keep_vote,o)
% EXPECT-NOT[BIND.3]: bind_takes_effect(v1)
% EXPECT-NOT[BIND.3]: custodian_passes(q1)
% EXPECT-NOT[BIND.3]: admitted_dispute(d4)
% EXPECT[BIND.3]: admitted_dispute(d5)
% EXPECT[BIND.3]: joined_since(v1,12)
% EXPECT-NOT[BIND.3]: joined_since(v1,35)
% EXPECT[BIND.3]: refused_dispute(d7)
% EXPECT-NOT[BIND.3]: refused_dispute(d1)
% EXPECT[BIND.3]: refused_dispute(dr)
% EXPECT[BIND.3]: joined_since(vl,20)
% EXPECT-NOT[BIND.3]: joined_since(vl,15)
% EXPECT[BIND.3]: dispute_lapsed(vl)
% EXPECT-NOT[BIND.3]: protection_held(keep_x,r2)
% EXPECT-NOT[BIND.3]: dispute_of(v3)
% EXPECT[BIND.3]: decider_barred(r1)
% EXPECT[BIND.3]: protection_held(keep_post,h)
% EXPECT[BIND.3]: dispute_lapsed(v2)
% EXPECT-NOT[BIND.3]: bind_takes_effect(v2)
% EXPECT-NOT[BIND.3]: upheld(v8)
% EXPECT[BIND.3]: upheld(v9)
% EXPECT[BIND.3]: dispute_open(v4)
% EXPECT-NOT[BIND.3]: dispute_lapsed(v4)
% EXPECT[BIND.2]: bind_takes_effect(v3)
% EXPECT[BIND.2]: effective_from(v3,10)
% EXPECT-NOT[BIND.2]: binding_held(v3)
