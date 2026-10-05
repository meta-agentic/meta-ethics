% Who can hold an act by citing a law (LV, as proposed; P1.7, P1.3, P1.20); no lapse passes it.
% h holds ch and a holds ca; the seat ce is empty; xs is no seat at all. The
% review ceiling is 10; it is now 30.

now(30).
param(law_review_ceiling, 10). param(veto_window, 50). param(veto_ceiling, 10). param(veto_per_act, 5).
root_grant(m0). mandate(m0, h, s). issued(m0, 0). carries_seat(m0, ch). admitted(m0).
root_grant(m1). mandate(m1, a, s). issued(m1, 0). carries_seat(m1, ca). admitted(m1).
custodian_seat(ch). custodian_seat(ca). custodian_seat(ce).
% unsigned
passed_channel(q1). matter_of(q1, x1). veto(ca, q1, 25). veto_cites_law(ca, q1, l1). law_breach_found(q1, l1).
% by an empty seat, and by no seat
passed_channel(q2). matter_of(q2, x2). veto(ce, q2, 25). veto_signed(ce, q2). veto_cites_law(ce, q2, l2).
passed_channel(q3). matter_of(q3, x3). veto(xs, q3, 25). veto_signed(xs, q3). veto_cites_law(xs, q3, l3).
% against its own replacement
passed_channel(q4). matter_of(q4, x4). replaces_seat(q4, ca, n9).
veto(ca, q4, 25). veto_signed(ca, q4). veto_cites_law(ca, q4, l4).
% against an owed act
passed_channel(q5). matter_of(q5, x5). owed_act(q5). veto(ca, q5, 25). veto_signed(ca, q5). veto_cites_law(ca, q5, l5).
% valid and pending within the ceiling: held; an older veto on the act by
% another seat does not start its review clock
veto(ch, q6, 5).
passed_channel(q6). matter_of(q6, x6). veto(ca, q6, 25). veto_signed(ca, q6). veto_cites_law(ca, q6, l6).
cites_right_of(q6, l6, h6).
% valid, pending past the review's ceiling: a reversible act is no longer held;
% its consequences are withheld from the human the citation names, the review
% drawn again, the delay marked; an irreversible one (q11) stays held; a
% re-proposal without the cited part is not held by the veto
passed_channel(q7). matter_of(q7, x7). veto(ch, q7, 12). veto_signed(ch, q7). veto_cites_law(ch, q7, l7).
% valid, the review found the breach: held past the ceiling
passed_channel(q8). matter_of(q8, x8). veto(ch, q8, 12). veto_signed(ch, q8). veto_cites_law(ch, q8, l8).
law_breach_found(q8, l8).
passed_channel(q9). matter_of(q9, x9). reproposal_of(q9, q7).
passed_channel(q11). matter_of(q11, x11). veto(ch, q11, 13). veto_signed(ch, q11). veto_cites_law(ch, q11, l11).
cites_right_of(q11, l11, h11). irreversible_effect(q11). decided_seq(q11, 13). regime_exit(1).
% a citation that names no human, nor any class, is no law-citing veto
passed_channel(q12). matter_of(q12, x12). veto(ca, q12, 26). veto_signed(ca, q12). veto_cites_law(ca, q12, l12).
decided_seq(q12, 26).
% valid, past the ceiling, found unfounded: not overdue, not held
passed_channel(q10). matter_of(q10, x10). veto(ch, q10, 12). veto_signed(ch, q10). veto_cites_law(ch, q10, l10).
law_unfounded(q10, l10). decided_seq(q10, 14).
decided_seq(q1, 25). decided_seq(q2, 25). decided_seq(q3, 25). decided_seq(q4, 25). decided_seq(q5, 25).
decided_seq(q6, 25). decided_seq(q7, 12). decided_seq(q8, 13).
% the human whose right each citation names
cites_right_of(q1, l1, hr). cites_right_of(q2, l2, hr). cites_right_of(q3, l3, hr). cites_right_of(q4, l4, hr). cites_right_of(q5, l5, hr). cites_right_of(q7, l7, hr). cites_right_of(q8, l8, hr). cites_right_of(q10, l10, hr).

% EXPECT-NOT[LV.2]: pr_law_hold(q1)
% EXPECT-NOT[LV.2]: pr_law_hold(q2)
% EXPECT-NOT[LV.2]: pr_law_hold(q3)
% EXPECT-NOT[LV.2]: pr_law_hold(q4)
% EXPECT-NOT[LV.2]: pr_law_hold(q5)
% EXPECT-NOT[LV.5]: pr_standing_veto(ca,q5)
% EXPECT-NOT[LV.5]: pr_standing_veto(ce,q2)
% EXPECT[LV.2]: pr_law_hold(q6)
% EXPECT[LV.1]: pr_valid_law_veto(ca,q6,l6)
% EXPECT-NOT[LV.4]: pr_overdue(q6,l6)
% EXPECT-NOT[LV.2]: pr_beyond_ceilings(ca,q6)
% EXPECT-NOT[LV.3]: pr_consequence_withheld(q6,h6)
% EXPECT-NOT[LV.2]: pr_law_hold(q7)
% EXPECT[LV.3]: pr_protection_mode(q7,l7)
% EXPECT[LV.3]: pr_consequence_withheld(q7,hr)
% EXPECT[LV.4]: pr_overdue(q7,l7)
% EXPECT[LV.4]: pr_redrawn(q7,l7)
% EXPECT[LV.4]: pr_counts_toward_d2(q7)
% EXPECT-NOT[LV.3]: pr_custodian_passes(q7)
% EXPECT-NOT[LV.4]: pr_overdue(q8,l8)
% EXPECT-NOT[LV.4]: pr_overdue(q6,l6)
% EXPECT-NOT[LV.4]: pr_counts_toward_d2(q6)
% EXPECT[LV.3]: pr_custodian_passes(q9)
% EXPECT[LV.2]: pr_law_hold(q11)
% EXPECT[LV.4]: pr_redrawn(q11,l11)
% EXPECT-NOT[LV.3]: pr_protection_mode(q11,l11)
% EXPECT-NOT[LV.4]: pr_genesis_cost_hold(q11)
% EXPECT-NOT[LV.2]: pr_law_hold(q12)
% EXPECT-NOT[LV.1]: pr_names_protected(q12,l12)
% EXPECT-NOT[LV.4]: pr_overdue(q10,l10)
% EXPECT-NOT[LV.2]: pr_law_hold(q10)
% EXPECT[LV.2]: pr_law_hold(q8)
% EXPECT[LV.3]: pr_custodian_passes(q1)
% EXPECT[LV.3]: pr_custodian_passes(q4)
% EXPECT[LV.5]: pr_standing_veto(ch,q7)
% EXPECT-NOT[LV.3]: pr_custodian_passes(q6)
% EXPECT-NOT[LV.3]: pr_custodian_passes(q8)
