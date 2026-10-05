% Under the proposal (LV), what passes, what is held, and which consequences
% take effect. h holds ch and a holds ca. q1 is held: a pending citation
% within ch's ceilings. Consequences arising from q1 are withheld from every
% human; those arising from the passing q2 take effect, subject to their own
% conditions. q3: both seats ineligible, reviewed, passes; q4: the same,
% stopped by the review; q5: the same, unreviewed; q6: owed, passes; q7:
% owed but never passed by the channel. q8: a citation by ca on another act,
% counted within the per-act bound of its own family only. q9: a citation
% naming a party that is not human.

now(100).
param(veto_window, 50). param(veto_ceiling, 10). param(veto_per_act, 1). param(law_review_ceiling, 500).
param(contest_window, 5). param(citation_period, 50). param(interim_ceiling, 50).
root_grant(m0). mandate(m0, h, s). issued(m0, 0). kind_of(h, human). carries_seat(m0, ch). admitted(m0).
root_grant(m1). mandate(m1, a, s). issued(m1, 0). kind_of(a, nonhuman). carries_seat(m1, ca). admitted(m1).
root_grant(m2). mandate(m2, h1, s). issued(m2, 0). kind_of(h1, human).
root_grant(m3). mandate(m3, h3, s). issued(m3, 0). kind_of(h3, human).
root_grant(m4). mandate(m4, r2, s). issued(m4, 0). kind_of(r2, human).
root_grant(m5). mandate(m5, n9, s). issued(m5, 0). kind_of(n9, nonhuman).
custodian_seat(ch). custodian_seat(ca).
regime_exit(1).
passed_channel(q1). matter_of(q1, x1). veto(ch, q1, 10). veto_signed(ch, q1). veto_cites_law(ch, q1, l1).
cites_right_of(q1, l1, h1).
passed_channel(q2). matter_of(q2, x2).
passed_channel(q3). matter_of(q3, x3). about(q3, h). about(q3, a). act_reviewed(q3).
passed_channel(q4). matter_of(q4, x4). about(q4, h). about(q4, a). act_reviewed(q4). stopped_by_review(q4).
passed_channel(q5). matter_of(q5, x5). about(q5, h). about(q5, a).
passed_channel(q6). matter_of(q6, x6). owed_act(q6). about(q6, h). about(q6, a).
matter_of(q7, x7). owed_act(q7).
passed_channel(q8). matter_of(q8, x8). veto(ca, q8, 11). veto_signed(ca, q8). veto_cites_law(ca, q8, l8).
cites_right_of(q8, l8, h1).
passed_channel(q9). matter_of(q9, x9). veto(ca, q9, 12). veto_signed(ca, q9). veto_cites_law(ca, q9, l9).
cites_right_of(q9, l9, n9).
decided_seq(q1, 10). decided_seq(q8, 11). decided_seq(q9, 12).
% consequences from the held q1
verdict(v1, h1, 20). verdict_from_act(v1, q1). bears_consequence(v1). consequence_on(v1, h1). filed_by(v1, a).
verdict_delivered(v1, 20). drawn_reviewer(v1, r2). reviewed(v1, r2).
finding(g1, h3, 80). finding_from_act(g1, q1). interim(i1, g1, 80).
duty_on(u1, x9, h3). duty_from_act(u1, q1).
% consequences from the passing q2, and their own conditions
verdict(v2, h3, 20). verdict_from_act(v2, q2). bears_consequence(v2). consequence_on(v2, h3). filed_by(v2, a).
verdict_delivered(v2, 20). drawn_reviewer(v2, r2). reviewed(v2, r2).
verdict(v5, h3, 20). bears_consequence(v5). consequence_on(v5, h3). filed_by(v5, a). verdict_delivered(v5, 20).
verdict(v6, h3, 98). bears_consequence(v6). consequence_on(v6, h3). filed_by(v6, a).
verdict_delivered(v6, 98). drawn_reviewer(v6, r2). reviewed(v6, r2).
verdict(v7, h3, 20). consequence_on(v7, h3). filed_by(v7, a). verdict_delivered(v7, 20). drawn_reviewer(v7, r2). reviewed(v7, r2).
finding(g2, h3, 80). finding_from_act(g2, q2). interim(i2, g2, 80).
finding(g3, h3, 10). interim(i3, g3, 10).
finding(g4, h3, 80). closed_in_favour(g4).
duty_on(u2, x9, h3). duty_from_act(u2, q2).
finding(g5, h1, 80). cites(g5, x10). duty_on(u3, x10, h1).
% the filer marks each other act's effect reversible
reversible_marking(q1). reversible_marking(q2). reversible_marking(q3). reversible_marking(q4). reversible_marking(q5). reversible_marking(q6). reversible_marking(q8). reversible_marking(q9).

% EXPECT[LV.2]: pr_law_hold(q1)
% EXPECT[LV.5]: pr_act_not_effective(q1)
% EXPECT-NOT[LV.3]: pr_takes_effect(v1)
% EXPECT-NOT[LV.3]: pr_citable(g1,h3)
% EXPECT-NOT[LV.3]: pr_interim_active(i1)
% EXPECT-NOT[LV.3]: pr_owes(h3,u1)
% EXPECT[LV.3]: pr_custodian_passes(q2)
% EXPECT[LV.3]: pr_takes_effect(v2)
% EXPECT-NOT[LV.3]: pr_takes_effect(v5)
% EXPECT-NOT[LV.3]: pr_takes_effect(v6)
% EXPECT-NOT[LV.3]: pr_takes_effect(v7)
% EXPECT[LV.3]: pr_citable(g2,h3)
% EXPECT[LV.3]: pr_interim_active(i2)
% EXPECT-NOT[LV.3]: pr_interim_active(i3)
% EXPECT-NOT[LV.3]: pr_citable(g3,h3)
% EXPECT-NOT[LV.3]: pr_citable(g4,h3)
% EXPECT[LV.3]: pr_owes(h3,u2)
% EXPECT-NOT[LV.3]: pr_owes(h1,u3)
% EXPECT[LV.3]: pr_custodian_passes(q3)
% EXPECT-NOT[LV.3]: pr_custodian_passes(q4)
% EXPECT-NOT[LV.3]: pr_custodian_passes(q5)
% EXPECT[LV.3]: pr_custodian_passes(q6)
% EXPECT-NOT[LV.3]: pr_custodian_passes(q7)
% EXPECT[LV.5]: pr_within_act_bound(q8)
% EXPECT-NOT[LV.1]: pr_valid_law_veto(ca,q9,l9)
