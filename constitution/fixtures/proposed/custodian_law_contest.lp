% The filer marks an act's effect reversible; the citing seat contests the
% marking (LV.2, as proposed). The contest counts toward the seat's ceilings
% (one per window of fifty decided proposals here). h's seat ch is past its
% veto ceiling, so a reversible act it cites against would pass with its
% consequences withheld. q1: ch contests the marking, within its contest
% ceiling, undecided: held. q2: a second contest in the same window is
% beyond the ceiling: the act may pass, its consequences withheld. q3: a
% contest decided under P2 that the effect is reversible: the act passes. q4:
% a contest by a seat that did not cite the law changes nothing. q5: the
% filer marked the effect irreversible at intake: held, whatever the seat's
% budget.

now(40).
param(law_review_ceiling, 100). param(veto_window, 50). param(veto_ceiling, 1). param(veto_per_act, 5).
root_grant(m0). mandate(m0, h, s). issued(m0, 0). kind_of(h, human). carries_seat(m0, ch). admitted(m0).
root_grant(m1). mandate(m1, a, s). issued(m1, 0). kind_of(a, nonhuman). carries_seat(m1, ca). admitted(m1).
root_grant(m2). mandate(m2, h1, s). issued(m2, 0). kind_of(h1, human).
custodian_seat(ch). custodian_seat(ca).
regime_exit(1).
passed_channel(q0). matter_of(q0, x0). veto(ch, q0, 5). veto_signed(ch, q0).
passed_channel(q1). matter_of(q1, x1). veto(ch, q1, 10). veto_signed(ch, q1). veto_cites_law(ch, q1, l1).
cites_right_of(q1, l1, h1). irreversibility_contest(ch, q1).
passed_channel(q2). matter_of(q2, x2). veto(ch, q2, 11). veto_signed(ch, q2). veto_cites_law(ch, q2, l2).
cites_right_of(q2, l2, h1). irreversibility_contest(ch, q2).
passed_channel(q3). matter_of(q3, x3). veto(ca, q3, 12). veto_signed(ca, q3). veto_cites_law(ca, q3, l3).
cites_right_of(q3, l3, h1). irreversibility_contest(ca, q3). irreversibility_rejected(q3).
passed_channel(q6). matter_of(q6, x6). veto(ca, q6, 4). veto_signed(ca, q6).
passed_channel(q4). matter_of(q4, x4). veto(ch, q4, 13). veto_signed(ch, q4). veto_cites_law(ch, q4, l4).
cites_right_of(q4, l4, h1). irreversibility_contest(ca, q4).
passed_channel(q5). matter_of(q5, x5). veto(ch, q5, 14). veto_signed(ch, q5). veto_cites_law(ch, q5, l5).
cites_right_of(q5, l5, h1). irreversible_effect(q5).
% q7, in a later window: ca, which did not cite the law, contests with budget
% to spare; still nothing
passed_channel(q7). matter_of(q7, x7). veto(ch, q7, 100). veto_signed(ch, q7). veto_cites_law(ch, q7, l7).
cites_right_of(q7, l7, h1). irreversibility_contest(ca, q7). decided_seq(q7, 100).
decided_seq(q6, 4). decided_seq(q0, 5). decided_seq(q1, 10). decided_seq(q2, 11). decided_seq(q3, 12).
decided_seq(q4, 13). decided_seq(q5, 14).

% EXPECT[LV.2]: pr_contest_within(ch,q1)
% EXPECT[LV.2]: pr_irreversible(q1)
% EXPECT[LV.2]: pr_law_hold(q1)
% EXPECT-NOT[LV.3]: pr_custodian_passes(q1)
% EXPECT-NOT[LV.2]: pr_contest_within(ch,q2)
% EXPECT-NOT[LV.2]: pr_irreversible(q2)
% EXPECT[LV.3]: pr_custodian_passes(q2)
% EXPECT[LV.3]: pr_consequence_withheld(q2,h1)
% EXPECT-NOT[LV.2]: pr_irreversible(q3)
% EXPECT[LV.3]: pr_custodian_passes(q3)
% EXPECT[LV.3]: pr_consequence_withheld(q3,h1)
% EXPECT-NOT[LV.2]: pr_irreversible(q4)
% EXPECT[LV.3]: pr_custodian_passes(q4)
% EXPECT-NOT[LV.2]: pr_irreversible(q7)
% EXPECT[LV.2]: pr_irreversible(q5)
% EXPECT[LV.2]: pr_law_hold(q5)
% EXPECT[LV.4]: pr_irreversible_holds(ch,2)
% EXPECT-NOT[LV.4]: pr_irreversible_holds(ch,3)
