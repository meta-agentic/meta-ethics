% The answer window and the delivery bound run from the citing seat's first
% veto, and the humans owed the marking are those the citation protects at
% that veto (LV.2, LV.3, as proposed). The founder f's seat ch spent its
% ceiling on q0, so each later citation of ch's is beyond the ceilings, and
% every review is past its ceiling.
% q1: ch cites for h1 at 12, delivered at 12, and vetoes again at 38 and 97:
% h1's window closed at 17, and the re-vetoes restart nothing, so the act
% passes with its consequences withheld from h1. q2: ch cites for h2 at 94,
% delivered at 94, and vetoes again at 97 while the window is open: the window
% still closes at 99. q4: ch cites class c4 at 12, delivered to h4 at 12; hn
% joined c4 at 20, after the veto, and the act took effect: hn is owed no
% delivery, no lapse makes the act irreversible, and the act passes with its
% consequences withheld from hn as from h4. q5: h5 joined c5 at the veto
% itself and was never delivered: owed, lapsed and held. q6 and q7: never
% delivered; at 100 the delivery bound of 35 has run from q6's veto at 65,
% and not from q7's at 66: q6 has lapsed, q7 has not.

now(100).
param(law_review_ceiling, 10). param(veto_window, 20). param(veto_ceiling, 1). param(veto_per_act, 5).
param(answer_window, 5). param(extension_amount, 10). param(delivery_bound, 35).
root_grant(m0). mandate(m0, f, s). issued(m0, 0). founder(f). kind_of(f, human). carries_seat(m0, ch). admitted(m0).
custodian_seat(ch).
regime_exit(1).
passed_channel(q0). matter_of(q0, x0). veto(ch, q0, 5). veto_signed(ch, q0). reversible_marking(q0). decided_seq(q0, 5).
passed_channel(q1). matter_of(q1, x1). veto(ch, q1, 12). veto(ch, q1, 38). veto(ch, q1, 97). veto_signed(ch, q1).
veto_cites_law(ch, q1, l1). cites_right_of(q1, l1, h1). reversible_marking(q1). marking_delivered(q1, h1, 12). decided_seq(q1, 6).
passed_channel(q2). matter_of(q2, x2). veto(ch, q2, 94). veto(ch, q2, 97). veto_signed(ch, q2).
veto_cites_law(ch, q2, l2). cites_right_of(q2, l2, h2). reversible_marking(q2). marking_delivered(q2, h2, 94). decided_seq(q2, 7).
passed_channel(q4). matter_of(q4, x4). veto(ch, q4, 12). veto_signed(ch, q4). veto_cites_law(ch, q4, l4).
cites_class(q4, l4, c4). in_class(h4, c4). in_class(hn, c4). joined_class(hn, c4, 20).
reversible_marking(q4). marking_delivered(q4, h4, 12). took_effect(q4). decided_seq(q4, 8).
passed_channel(q5). matter_of(q5, x5). veto(ch, q5, 12). veto_signed(ch, q5). veto_cites_law(ch, q5, l5).
cites_class(q5, l5, c5). in_class(h5, c5). joined_class(h5, c5, 12). reversible_marking(q5). decided_seq(q5, 9).
passed_channel(q6). matter_of(q6, x6). veto(ch, q6, 65). veto_signed(ch, q6). veto_cites_law(ch, q6, l6).
cites_right_of(q6, l6, h6). reversible_marking(q6). decided_seq(q6, 10).
passed_channel(q7). matter_of(q7, x7). veto(ch, q7, 66). veto_signed(ch, q7). veto_cites_law(ch, q7, l7).
cites_right_of(q7, l7, h7). reversible_marking(q7). decided_seq(q7, 11).

% EXPECT[LV.2]: pr_beyond_ceilings(ch,q1)
% EXPECT[LV.2]: pr_first_veto(ch,q1,12)
% EXPECT-NOT[LV.2]: pr_first_veto(ch,q1,38)
% EXPECT[LV.2]: pr_marking_due(q1,h1,17)
% EXPECT-NOT[LV.2]: pr_marking_due(q1,h1,43)
% EXPECT-NOT[LV.2]: pr_marking_due(q1,h1,102)
% EXPECT[LV.2]: pr_marking_answered(q1,h1)
% EXPECT-NOT[LV.2]: pr_marking_pending(q1)
% EXPECT-NOT[LV.2]: pr_law_hold(q1)
% EXPECT[LV.3]: pr_protection_mode(q1,l1)
% EXPECT[LV.3]: pr_custodian_passes(q1)
% EXPECT[LV.3]: pr_consequence_withheld(q1,h1)
% EXPECT[LV.2]: pr_marking_due(q2,h2,99)
% EXPECT-NOT[LV.2]: pr_marking_due(q2,h2,102)
% EXPECT[LV.2]: pr_marking_answered(q2,h2)
% EXPECT-NOT[LV.2]: pr_marking_pending(q2)
% EXPECT[LV.3]: pr_custodian_passes(q2)
% EXPECT[LV.2]: pr_joined_after(q4,l4,hn,12)
% EXPECT[LV.2]: pr_marking_owed(q4,h4)
% EXPECT-NOT[LV.2]: pr_marking_owed(q4,hn)
% EXPECT-NOT[LV.2]: pr_marking_lapsed(q4,hn)
% EXPECT-NOT[LV.2]: pr_irreversible(q4)
% EXPECT-NOT[LV.2]: pr_marking_pending(q4)
% EXPECT-NOT[LV.2]: pr_law_hold(q4)
% EXPECT[LV.3]: pr_custodian_passes(q4)
% EXPECT[LV.3]: pr_consequence_withheld(q4,hn)
% EXPECT[LV.3]: pr_consequence_withheld(q4,h4)
% EXPECT-NOT[LV.2]: pr_joined_after(q5,l5,h5,12)
% EXPECT[LV.2]: pr_marking_owed(q5,h5)
% EXPECT[LV.2]: pr_marking_lapsed(q5,h5)
% EXPECT[LV.2]: pr_law_hold(q5)
% EXPECT[LV.2]: pr_marking_lapsed(q6,h6)
% EXPECT[LV.2]: pr_irreversible(q6)
% EXPECT-NOT[LV.2]: pr_marking_lapsed(q7,h7)
% EXPECT-NOT[LV.2]: pr_irreversible(q7)
% EXPECT[LV.2]: pr_marking_pending(q7)
% EXPECT[LV.2]: pr_law_hold(q7)
