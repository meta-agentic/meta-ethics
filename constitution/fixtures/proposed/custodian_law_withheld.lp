% Beyond the seat's ceilings, under the genesis regime (P1.7). The founder f's
% seat ch has spent its ceiling, so its pending citations hold no act whose
% effect can be withheld. The withholding gates every consequence: a verdict
% from the act with a consequence on a protected human does not take effect,
% a finding from it about one is not cited and carries no interim measure,
% and a duty from it does not run against one. The protected are the human
% the citation names (h1) and those of the class it names (h2). An act whose
% effect could not be withheld or reversed forward stays held. A citation
% found unfounded withholds nothing.

now(40).
param(law_review_ceiling, 10). param(veto_window, 50). param(veto_ceiling, 1). param(veto_per_act, 5).
param(contest_window, 5). param(citation_period, 50). param(interim_ceiling, 50).
root_grant(m0). mandate(m0, f, s). issued(m0, 0). founder(f). kind_of(f, human). carries_seat(m0, ch). admitted(m0).
root_grant(m1). mandate(m1, a, s). issued(m1, 0). kind_of(a, nonhuman). carries_seat(m1, ca). admitted(m1).
root_grant(m2). mandate(m2, h1, s). issued(m2, 0). kind_of(h1, human).
root_grant(m3). mandate(m3, h2, s). issued(m3, 0). kind_of(h2, human).
root_grant(m4). mandate(m4, h3, s). issued(m4, 0). kind_of(h3, human).
root_grant(m5). mandate(m5, r2, s). issued(m5, 0). kind_of(r2, human).
custodian_seat(ch). custodian_seat(ca).
passed_channel(q0). matter_of(q0, x0). veto(ch, q0, 5). veto_signed(ch, q0).
% q1: reversible, beyond the ceiling, review pending
passed_channel(q1). matter_of(q1, x1). veto(ch, q1, 10). veto_signed(ch, q1). veto_cites_law(ch, q1, l1).
cites_right_of(q1, l1, h1). cites_class(q1, l1, tenants). in_class(h2, tenants).
verdict(v1, h1, 12). verdict_from_act(v1, q1). bears_consequence(v1). consequence_on(v1, h1). filed_by(v1, a).
verdict_delivered(v1, 12). drawn_reviewer(v1, r2). reviewed(v1, r2).
verdict(v2, h3, 12). verdict_from_act(v2, q1). bears_consequence(v2). consequence_on(v2, h3). filed_by(v2, a).
verdict_delivered(v2, 12). drawn_reviewer(v2, r2). reviewed(v2, r2).
finding(g1, h2, 12). finding_from_act(g1, q1). interim(i1, g1, 30).
finding(g2, h3, 12). finding_from_act(g2, q1).
duty_on(u1, x9, h1). duty_from_act(u1, q1).
duty_on(u2, x9, h3). duty_from_act(u2, q1).
% q2: an irreversible effect (a disclosure of personal data), beyond the ceiling
passed_channel(q2). matter_of(q2, x2). veto(ch, q2, 11). veto_signed(ch, q2). veto_cites_law(ch, q2, l2).
cites_right_of(q2, l2, h1). irreversible_effect(q2).
% q3: reversible, beyond the ceiling, the citation found unfounded
passed_channel(q3). matter_of(q3, x3). veto(ch, q3, 12). veto_signed(ch, q3). veto_cites_law(ch, q3, l3).
cites_right_of(q3, l3, h1). law_unfounded(q3, l3).
verdict(v3, h1, 13). verdict_from_act(v3, q3). bears_consequence(v3). consequence_on(v3, h1). filed_by(v3, a).
verdict_delivered(v3, 13). drawn_reviewer(v3, r2). reviewed(v3, r2).
% q4: irreversible, beyond the ceiling, found unfounded: not held
passed_channel(q4). matter_of(q4, x4). veto(ch, q4, 13). veto_signed(ch, q4). veto_cites_law(ch, q4, l4).
cites_right_of(q4, l4, h1). irreversible_effect(q4). law_unfounded(q4, l4).
% a finding about h1 that does not arise from q1 is cited as usual
finding(g3, h1, 12).
decided_seq(q4, 13).
% q5: a citation naming only a class
passed_channel(q5). matter_of(q5, x5). veto(ch, q5, 14). veto_signed(ch, q5). veto_cites_law(ch, q5, l5).
cites_class(q5, l5, tenants). decided_seq(q5, 14).
decided_seq(q0, 5). decided_seq(q1, 10). decided_seq(q2, 11). decided_seq(q3, 12).

% EXPECT[LV.3]: pr_custodian_passes(q1)
% EXPECT[LV.3]: pr_consequence_withheld(q1,h1)
% EXPECT[LV.3]: pr_consequence_withheld(q1,h2)
% EXPECT-NOT[LV.3]: pr_consequence_withheld(q1,h3)
% EXPECT[LV.3]: pr_withheld_verdict(v1)
% EXPECT-NOT[LV.3]: pr_takes_effect(v1)
% EXPECT[LV.3]: pr_takes_effect(v2)
% EXPECT-NOT[LV.3]: pr_citable(g1,h2)
% EXPECT-NOT[LV.3]: pr_interim_active(i1)
% EXPECT[LV.3]: pr_citable(g2,h3)
% EXPECT-NOT[LV.3]: pr_owes(h1,u1)
% EXPECT[LV.3]: pr_owes(h3,u2)
% EXPECT[LV.2]: pr_law_hold(q2)
% EXPECT[LV.4]: pr_overdue(q2,l2)
% EXPECT-NOT[LV.3]: pr_custodian_passes(q2)
% EXPECT-NOT[LV.3]: pr_consequence_withheld(q2,h1)
% EXPECT-NOT[LV.2]: pr_law_hold(q4)
% EXPECT[LV.3]: pr_consequence_withheld(q5,h2)
% EXPECT[LV.3]: pr_citable(g3,h1)
% EXPECT[LV.3]: pr_custodian_passes(q3)
% EXPECT[LV.3]: pr_takes_effect(v3)
% EXPECT-NOT[LV.3]: pr_consequence_withheld(q3,h1)
