% The citing seat declares an act's effect irreversible (LV.2, as proposed).
% f's seat ch has spent its ceiling, so a reversible act it cites against
% would pass with its consequences withheld. q1: ch declares the effect
% irreversible and no dispute has decided otherwise: held. q2: the same, but a
% dispute decided under BIND.3 that the effect is reversible: the act passes,
% its consequences withheld from h1. q3: a declaration by a seat that did not
% cite the law changes nothing.

now(40).
param(law_review_ceiling, 100). param(veto_window, 50). param(veto_ceiling, 1). param(veto_per_act, 5).
root_grant(m0). mandate(m0, f, s). issued(m0, 0). founder(f). kind_of(f, human). carries_seat(m0, ch). admitted(m0).
root_grant(m1). mandate(m1, a, s). issued(m1, 0). kind_of(a, nonhuman). carries_seat(m1, ca). admitted(m1).
root_grant(m2). mandate(m2, h1, s). issued(m2, 0). kind_of(h1, human).
custodian_seat(ch). custodian_seat(ca).
passed_channel(q0). matter_of(q0, x0). veto(ch, q0, 5). veto_signed(ch, q0).
passed_channel(q1). matter_of(q1, x1). veto(ch, q1, 10). veto_signed(ch, q1). veto_cites_law(ch, q1, l1).
cites_right_of(q1, l1, h1). declared_irreversible(ch, q1).
passed_channel(q2). matter_of(q2, x2). veto(ch, q2, 11). veto_signed(ch, q2). veto_cites_law(ch, q2, l2).
cites_right_of(q2, l2, h1). declared_irreversible(ch, q2). irreversibility_rejected(q2).
passed_channel(q3). matter_of(q3, x3). veto(ch, q3, 12). veto_signed(ch, q3). veto_cites_law(ch, q3, l3).
cites_right_of(q3, l3, h1). declared_irreversible(ca, q3).
decided_seq(q0, 5). decided_seq(q1, 10). decided_seq(q2, 11). decided_seq(q3, 12).

% EXPECT[LV.2]: pr_irreversible(q1)
% EXPECT[LV.2]: pr_law_hold(q1)
% EXPECT-NOT[LV.3]: pr_custodian_passes(q1)
% EXPECT-NOT[LV.2]: pr_irreversible(q2)
% EXPECT-NOT[LV.2]: pr_law_hold(q2)
% EXPECT[LV.3]: pr_custodian_passes(q2)
% EXPECT[LV.3]: pr_consequence_withheld(q2,h1)
% EXPECT-NOT[LV.2]: pr_irreversible(q3)
% EXPECT[LV.3]: pr_custodian_passes(q3)
