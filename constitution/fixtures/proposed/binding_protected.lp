% A human the cited right protects may dispute an outcome of the act (P1.7,
% BIND.3), here h2, of the class the citation names, though the verdict v2
% is about h3; h4, neither subject nor protected, may not.

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
decided_seq(q0, 5). decided_seq(q1, 10). decided_seq(q2, 11). decided_seq(q3, 12).

param(binding_dispute_ceiling, 10).
root_grant(m6). mandate(m6, h4, s). issued(m6, 0). kind_of(h4, human).
disputed(d1, v2, h2). dispute_at(d1, 15).
disputed(d2, v2, h4). dispute_at(d2, 15).

% EXPECT[BIND.3]: has_standing(h2,v2)
% EXPECT[BIND.3]: admitted_dispute(d1)
% EXPECT[BIND.3]: refused_dispute(d2)
% EXPECT-NOT[BIND.3]: has_standing(h4,v2)
% EXPECT-NOT[BIND.3]: bind_takes_effect(v2)
