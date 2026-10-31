% The answer window and the delivery bound run from the seat's first veto that
% cites the law, not from an earlier veto of the seat that cited none (LV.2,
% as proposed). The founder f's seat ch spent its ceiling on q0, so each
% later citation of ch's is beyond the ceilings.
% q1: ch vetoes at 30 citing no law and cites l1 for h1 at 50; the marking
% was delivered to h1 at 31: h1's window runs from 50 and closes at 55, so at
% 51 the act is held. q2: ch vetoes at 10 citing no law and cites l2 for h2
% at 50; the marking was never delivered: the delivery bound runs from 50,
% so nothing has lapsed and the act is not counted irreversible. q3: ch vetoes
% at 30 and again at 45 citing no law, then at 48 citing l3 for h3, delivered
% at 31: the window runs from 48, not from 30 or 45, and closes at 53. q4: ch
% cites l4 for h4 by name at 50; h4 joined an unrelated class c9 at 51: h4 is
% still owed the marking. q5: ca, within its ceilings, vetoes at 30 citing no
% law and cites l5 for h5 at 45: the review's ceiling of 10 counts from 45, so
% at 51 the review is not overdue and the act is held. q6: as q5, the citation
% at 41: at 51 the ceiling has run, exactly, and the review is redrawn.
% q7 and q8: a malformed citation time, later than every veto of the seat:
% intake refuses it and the citation cites at the veto. q7: ca, within its
% ceilings, vetoes at 30 with the time recorded as 60, delivered at 30: the
% review falls overdue at 40 as from the veto, not never. q8: ch, beyond its
% ceilings, vetoes at 48 with the time recorded as 60, delivered at 48: h8's
% window runs from 48 and is still open at 51, so the act does not pass.

now(51).
param(law_review_ceiling, 10). param(veto_window, 20). param(veto_ceiling, 1). param(veto_per_act, 5).
param(answer_window, 5). param(extension_amount, 10). param(delivery_bound, 35).
root_grant(m0). mandate(m0, f, s). issued(m0, 0). founder(f). kind_of(f, human). carries_seat(m0, ch). admitted(m0).
custodian_seat(ch).
root_grant(m1). mandate(m1, a, s). issued(m1, 0). kind_of(a, nonhuman). carries_seat(m1, ca). admitted(m1).
custodian_seat(ca).
regime_exit(1).
passed_channel(q0). matter_of(q0, x0). veto(ch, q0, 5). veto_signed(ch, q0). reversible_marking(q0). decided_seq(q0, 5).
passed_channel(q1). matter_of(q1, x1). veto(ch, q1, 30). veto(ch, q1, 50). veto_signed(ch, q1).
veto_cites_law(ch, q1, l1). citation_entered(ch, q1, l1, 50). cites_law_at(ch, q1, l1, 50). cites_right_of(q1, l1, h1).
reversible_marking(q1). marking_delivered(q1, h1, 31). decided_seq(q1, 6).
passed_channel(q2). matter_of(q2, x2). veto(ch, q2, 10). veto(ch, q2, 50). veto_signed(ch, q2).
veto_cites_law(ch, q2, l2). citation_entered(ch, q2, l2, 50). cites_law_at(ch, q2, l2, 50). cites_right_of(q2, l2, h2).
reversible_marking(q2). decided_seq(q2, 7).
passed_channel(q3). matter_of(q3, x3). veto(ch, q3, 30). veto(ch, q3, 45). veto(ch, q3, 48). veto_signed(ch, q3).
veto_cites_law(ch, q3, l3). citation_entered(ch, q3, l3, 48). cites_law_at(ch, q3, l3, 48). cites_right_of(q3, l3, h3).
reversible_marking(q3). marking_delivered(q3, h3, 31). decided_seq(q3, 8).
passed_channel(q4). matter_of(q4, x4). veto(ch, q4, 50). veto_signed(ch, q4). veto_cites_law(ch, q4, l4). citation_entered(ch, q4, l4, 50).
cites_right_of(q4, l4, h4). in_class(h4, c9). joined_class(h4, c9, 51). reversible_marking(q4). decided_seq(q4, 9).

passed_channel(q5). matter_of(q5, x5). veto(ca, q5, 30). veto(ca, q5, 45). veto_signed(ca, q5).
veto_cites_law(ca, q5, l5). citation_entered(ca, q5, l5, 45). cites_law_at(ca, q5, l5, 45). cites_right_of(q5, l5, h5).
reversible_marking(q5). marking_delivered(q5, h5, 45). decided_seq(q5, 10).
passed_channel(q6). matter_of(q6, x6). veto(ca, q6, 30). veto(ca, q6, 41). veto_signed(ca, q6).
veto_cites_law(ca, q6, l6). citation_entered(ca, q6, l6, 41). cites_law_at(ca, q6, l6, 41). cites_right_of(q6, l6, h6).
reversible_marking(q6). marking_delivered(q6, h6, 41). decided_seq(q6, 31).
passed_channel(q7). matter_of(q7, x7). veto(ca, q7, 30). veto_signed(ca, q7).
veto_cites_law(ca, q7, l7). citation_entered(ca, q7, l7, 30). cites_law_at(ca, q7, l7, 60). cites_right_of(q7, l7, h7).
reversible_marking(q7). marking_delivered(q7, h7, 30). decided_seq(q7, 60).
passed_channel(q8). matter_of(q8, x8). veto(ch, q8, 48). veto_signed(ch, q8).
veto_cites_law(ch, q8, l8). citation_entered(ch, q8, l8, 48). cites_law_at(ch, q8, l8, 60). cites_right_of(q8, l8, h8).
reversible_marking(q8). marking_delivered(q8, h8, 48). decided_seq(q8, 13).

% EXPECT[LV.2]: pr_beyond_ceilings(ch,q1)
% EXPECT[LV.2]: pr_first_citing(ch,q1,l1,50)
% EXPECT-NOT[LV.2]: pr_first_citing(ch,q1,l1,30)
% EXPECT[LV.2]: pr_marking_start(q1,h1,50)
% EXPECT[LV.2]: pr_marking_due(q1,h1,55)
% EXPECT-NOT[LV.2]: pr_marking_due(q1,h1,36)
% EXPECT-NOT[LV.2]: pr_marking_answered(q1,h1)
% EXPECT[LV.2]: pr_marking_pending(q1)
% EXPECT[LV.2]: pr_law_hold(q1)
% EXPECT-NOT[LV.3]: pr_custodian_passes(q1)
% EXPECT[LV.2]: pr_marking_cited(q2,h2,50)
% EXPECT-NOT[LV.2]: pr_marking_cited(q2,h2,10)
% EXPECT-NOT[LV.2]: pr_marking_lapsed(q2,h2)
% EXPECT-NOT[LV.2]: pr_irreversible(q2)
% EXPECT[LV.2]: pr_marking_pending(q2)
% EXPECT[LV.2]: pr_law_hold(q2)
% EXPECT[LV.2]: pr_first_citing(ch,q3,l3,48)
% EXPECT-NOT[LV.2]: pr_first_citing(ch,q3,l3,45)
% EXPECT[LV.2]: pr_marking_due(q3,h3,53)
% EXPECT-NOT[LV.2]: pr_marking_due(q3,h3,50)
% EXPECT[LV.2]: pr_marking_pending(q3)
% EXPECT-NOT[LV.2]: pr_joined_after(q4,l4,h4,50)
% EXPECT[LV.2]: pr_marking_owed(q4,h4)
% EXPECT[LV.2]: pr_in_ceilings(ca,q5)
% EXPECT-NOT[LV.4]: pr_overdue(q5,l5)
% EXPECT-NOT[LV.4]: pr_redrawn(q5,l5)
% EXPECT-NOT[LV.4]: pr_counts_toward_d2(q5)
% EXPECT-NOT[LV.3]: pr_protection_mode(q5,l5)
% EXPECT[LV.2]: pr_law_hold(q5)
% EXPECT[LV.4]: pr_overdue(q6,l6)
% EXPECT[LV.4]: pr_redrawn(q6,l6)
% EXPECT-NOT[LV.2]: pr_law_hold(q6)
% EXPECT[LV.2]: pr_cite_time_refused(ca,q7,l7)
% EXPECT-NOT[LV.2]: pr_cite_time_refused(ca,q5,l5)
% EXPECT[LV.2]: pr_first_citing(ca,q7,l7,30)
% EXPECT[LV.4]: pr_overdue(q7,l7)
% EXPECT-NOT[LV.2]: pr_law_hold(q7)
% EXPECT[LV.2]: pr_cite_time_refused(ch,q8,l8)
% EXPECT[LV.2]: pr_marking_due(q8,h8,53)
% EXPECT[LV.2]: pr_marking_pending(q8)
% EXPECT[LV.2]: pr_law_hold(q8)
% EXPECT-NOT[LV.3]: pr_custodian_passes(q8)
% EXPECT[LV.2]: pr_in_ceilings(ca,q6)
% EXPECT[LV.2]: pr_in_ceilings(ca,q7)
% EXPECT-NOT[LV.2]: pr_beyond_ceilings(ca,q7)
