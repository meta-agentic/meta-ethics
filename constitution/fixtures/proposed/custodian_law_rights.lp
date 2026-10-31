% A citation's missing or malformed time anchors at the seat's latest veto,
% and a late member of a cited class is owed notice (LV.2, as proposed; the
% rights review's probes r1, r2 and r5). The founder f's seat ch spent its
% ceiling on q0, so each later citation of ch's is beyond the ceilings.
% r1: ch vetoes at 30 and at 50, the citation records no time, the marking
% delivered to h1 at 31: the record is refused as malformed, the citation
% cites at 50, and h1's window closes at 55, so at 51 the act is held. r2: as
% r1, the time recorded as 51, after every veto: refused, the citation cites
% at 50, held until 55. r5: ch cites class c5 at 12, delivered to h5 at 12;
% hm joined c5 at 20: hm is owed the marking as notice only, which adds no
% hold, so the act passes once h5's window closed at 17, its consequences
% withheld from hm. r6: ch's only veto at 40, the citation untimed: it cites
% at 40 and nothing is refused. r7: as r5 with no marking, and r8: as r5
% with the citation found unfounded: no notice is owed.

now(51).
param(law_review_ceiling, 10). param(veto_window, 20). param(veto_ceiling, 1). param(veto_per_act, 5).
param(answer_window, 5). param(extension_amount, 10). param(delivery_bound, 35).
root_grant(m0). mandate(m0, f, s). issued(m0, 0). founder(f). kind_of(f, human). carries_seat(m0, ch). admitted(m0).
custodian_seat(ch).
regime_exit(1).
passed_channel(q0). matter_of(q0, x0). veto(ch, q0, 5). veto_signed(ch, q0). reversible_marking(q0). decided_seq(q0, 5).
passed_channel(r1). matter_of(r1, x1). veto(ch, r1, 30). veto(ch, r1, 50). veto_signed(ch, r1).
veto_cites_law(ch, r1, l1). cites_right_of(r1, l1, h1). reversible_marking(r1). marking_delivered(r1, h1, 31). decided_seq(r1, 6).
passed_channel(r2). matter_of(r2, x2). veto(ch, r2, 30). veto(ch, r2, 50). veto_signed(ch, r2).
veto_cites_law(ch, r2, l2). cites_law_at(ch, r2, l2, 51). cites_right_of(r2, l2, h2).
reversible_marking(r2). marking_delivered(r2, h2, 31). decided_seq(r2, 7).
passed_channel(r5). matter_of(r5, x5). veto(ch, r5, 12). veto_signed(ch, r5). veto_cites_law(ch, r5, l5).
cites_class(r5, l5, c5). in_class(h5, c5). in_class(hm, c5). joined_class(hm, c5, 20).
reversible_marking(r5). marking_delivered(r5, h5, 12). decided_seq(r5, 8).
passed_channel(r6). matter_of(r6, x6). veto(ch, r6, 40). veto_signed(ch, r6). veto_cites_law(ch, r6, l6).
cites_right_of(r6, l6, h6). reversible_marking(r6). marking_delivered(r6, h6, 40). decided_seq(r6, 9).
passed_channel(r7). matter_of(r7, x7). veto(ch, r7, 12). veto_signed(ch, r7). veto_cites_law(ch, r7, l7).
cites_class(r7, l7, c7). in_class(h7, c7). in_class(hm, c7). joined_class(hm, c7, 20). decided_seq(r7, 10).
passed_channel(r8). matter_of(r8, x8). veto(ch, r8, 12). veto_signed(ch, r8). veto_cites_law(ch, r8, l8).
cites_class(r8, l8, c8). in_class(h8, c8). in_class(hm, c8). joined_class(hm, c8, 20).
reversible_marking(r8). law_unfounded(r8, l8). decided_seq(r8, 11).

% EXPECT[LV.2]: pr_beyond_ceilings(ch,r1)
% EXPECT[LV.2]: pr_cite_time_refused(ch,r1,l1)
% EXPECT[LV.2]: pr_first_citing(ch,r1,l1,50)
% EXPECT-NOT[LV.2]: pr_first_citing(ch,r1,l1,30)
% EXPECT[LV.2]: pr_marking_due(r1,h1,55)
% EXPECT-NOT[LV.2]: pr_marking_due(r1,h1,36)
% EXPECT[LV.2]: pr_marking_pending(r1)
% EXPECT[LV.2]: pr_law_hold(r1)
% EXPECT-NOT[LV.3]: pr_custodian_passes(r1)
% EXPECT[LV.2]: pr_cite_time_refused(ch,r2,l2)
% EXPECT[LV.2]: pr_first_citing(ch,r2,l2,50)
% EXPECT[LV.2]: pr_marking_due(r2,h2,55)
% EXPECT[LV.2]: pr_law_hold(r2)
% EXPECT-NOT[LV.3]: pr_custodian_passes(r2)
% EXPECT[LV.2]: pr_marking_notice(r5,hm)
% EXPECT-NOT[LV.2]: pr_marking_owed(r5,hm)
% EXPECT-NOT[LV.2]: pr_marking_notice(r5,h5)
% EXPECT-NOT[LV.2]: pr_marking_pending(r5)
% EXPECT[LV.3]: pr_custodian_passes(r5)
% EXPECT[LV.3]: pr_consequence_withheld(r5,hm)
% EXPECT-NOT[LV.2]: pr_cite_time_refused(ch,r6,l6)
% EXPECT[LV.2]: pr_first_citing(ch,r6,l6,40)
% EXPECT[LV.2]: pr_marking_due(r6,h6,45)
% EXPECT-NOT[LV.2]: pr_marking_notice(r7,hm)
% EXPECT-NOT[LV.2]: pr_marking_notice(r8,hm)
