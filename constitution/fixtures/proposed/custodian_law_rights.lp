% A citation with no valid time anchors at its own entry's position in the
% record, a citation with neither is refused, and a late member of a cited
% class is owed notice (LV.2, as proposed; the
% rights review's probes r1, r2 and r5). The founder f's seat ch spent its
% ceiling on q0, so each later citation of ch's is beyond the ceilings.
% r1: ch vetoes at 30 and at 50, the citation records no time, the marking
% delivered to h1 at 31, the citation entered at 50: it cites at 50, and h1's window closes at 55, so at 51 the act is held. r2: as
% r1, the time recorded as 51, after every veto: refused, the citation cites
% at 50, held until 55. r5: ch cites class c5 at 12, delivered to h5 at 12;
% hm joined c5 at 20: hm is owed the marking as notice only, which adds no
% hold, so the act passes once h5's window closed at 17, its consequences
% withheld from hm. r6: ch's only veto at 40, the citation untimed: it cites
% at 40 and nothing is refused. r7: as r5 with no marking, and r8: as r5
% with the citation found unfounded: no notice is owed. r9 and r10: a
% citation with neither a time nor an entry position: refused, anchoring
% nothing. r9: ch, beyond its ceilings: the act passes with every consequence
% withheld from h9, no law hold. r10: ca, within its ceilings: ca's veto
% stands and the act does not pass, with no law hold of the citation's own.
% r11: a valid recorded time and no entry position: not refused, it cites at
% its time. r12: as r9, the citation found unfounded: no protection mode.
% r13 and r14: a refused citation on an act with no marking, refused at 40
% and at 42: the review's ceiling of 10 counts from the refusal, so at 51
% r13's review is overdue, redrawn and marked, and r14's is not; both stay
% held as irreversible until the review decides (LV.2, LV.4), and every
% consequence is withheld. r15: as r10, ca within its ceilings, the citation
% refused at 44, so at 51 the review is not overdue: ca's veto stands and the
% act does not pass, but the refused citation adds no law hold of its own
% before the review's ceiling, and every consequence is withheld from h15.

now(51).
param(law_review_ceiling, 10). param(veto_window, 20). param(veto_ceiling, 1). param(veto_per_act, 5).
param(answer_window, 5). param(extension_amount, 10). param(delivery_bound, 35).
root_grant(m0). mandate(m0, f, s). issued(m0, 0). founder(f). kind_of(f, human). carries_seat(m0, ch). admitted(m0).
custodian_seat(ch).
root_grant(m1). mandate(m1, a, s). issued(m1, 0). kind_of(a, nonhuman). carries_seat(m1, ca). admitted(m1).
custodian_seat(ca).
regime_exit(1).
passed_channel(q0). matter_of(q0, x0). veto(ch, q0, 5). veto_signed(ch, q0). reversible_marking(q0). decided_seq(q0, 5).
passed_channel(r1). matter_of(r1, x1). veto(ch, r1, 30). veto(ch, r1, 50). veto_signed(ch, r1).
veto_cites_law(ch, r1, l1). citation_entered(ch, r1, l1, 50). cites_right_of(r1, l1, h1). reversible_marking(r1). marking_delivered(r1, h1, 31). decided_seq(r1, 6).
passed_channel(r2). matter_of(r2, x2). veto(ch, r2, 30). veto(ch, r2, 50). veto_signed(ch, r2).
veto_cites_law(ch, r2, l2). citation_entered(ch, r2, l2, 50). cites_law_at(ch, r2, l2, 51). cites_right_of(r2, l2, h2).
reversible_marking(r2). marking_delivered(r2, h2, 31). decided_seq(r2, 7).
passed_channel(r5). matter_of(r5, x5). veto(ch, r5, 12). veto_signed(ch, r5). veto_cites_law(ch, r5, l5). citation_entered(ch, r5, l5, 12).
cites_class(r5, l5, c5). in_class(h5, c5). in_class(hm, c5). joined_class(hm, c5, 20).
reversible_marking(r5). marking_delivered(r5, h5, 12). decided_seq(r5, 8).
passed_channel(r6). matter_of(r6, x6). veto(ch, r6, 40). veto_signed(ch, r6). veto_cites_law(ch, r6, l6). citation_entered(ch, r6, l6, 40).
cites_right_of(r6, l6, h6). reversible_marking(r6). marking_delivered(r6, h6, 40). decided_seq(r6, 9).
passed_channel(r7). matter_of(r7, x7). veto(ch, r7, 12). veto_signed(ch, r7). veto_cites_law(ch, r7, l7). citation_entered(ch, r7, l7, 12).
cites_class(r7, l7, c7). in_class(h7, c7). in_class(hm, c7). joined_class(hm, c7, 20). decided_seq(r7, 10).
passed_channel(r8). matter_of(r8, x8). veto(ch, r8, 12). veto_signed(ch, r8). veto_cites_law(ch, r8, l8). citation_entered(ch, r8, l8, 12).
cites_class(r8, l8, c8). in_class(h8, c8). in_class(hm, c8). joined_class(hm, c8, 20).
reversible_marking(r8). law_unfounded(r8, l8). decided_seq(r8, 11).
passed_channel(r9). matter_of(r9, x9). veto(ch, r9, 40). veto_signed(ch, r9). veto_cites_law(ch, r9, l9). citation_refused_at(ch, r9, l9, 40).
cites_right_of(r9, l9, h9). reversible_marking(r9). marking_delivered(r9, h9, 40). decided_seq(r9, 12).
passed_channel(r10). matter_of(r10, x10). veto(ca, r10, 40). veto_signed(ca, r10). veto_cites_law(ca, r10, l10). citation_refused_at(ca, r10, l10, 45).
cites_right_of(r10, l10, h10). reversible_marking(r10). marking_delivered(r10, h10, 40). decided_seq(r10, 13).
passed_channel(r11). matter_of(r11, x11). veto(ch, r11, 44). veto_signed(ch, r11). veto_cites_law(ch, r11, l11).
cites_law_at(ch, r11, l11, 44). cites_right_of(r11, l11, h11). reversible_marking(r11). decided_seq(r11, 14).
passed_channel(r12). matter_of(r12, x12). veto(ch, r12, 40). veto_signed(ch, r12). veto_cites_law(ch, r12, l12). citation_refused_at(ch, r12, l12, 40).
cites_right_of(r12, l12, h12). reversible_marking(r12). law_unfounded(r12, l12). decided_seq(r12, 15).
passed_channel(r13). matter_of(r13, x13). veto(ch, r13, 40). veto_signed(ch, r13). veto_cites_law(ch, r13, l13).
citation_refused_at(ch, r13, l13, 40). cites_right_of(r13, l13, h13). decided_seq(r13, 16).
passed_channel(r14). matter_of(r14, x14). veto(ch, r14, 42). veto_signed(ch, r14). veto_cites_law(ch, r14, l14).
citation_refused_at(ch, r14, l14, 42). cites_right_of(r14, l14, h14). decided_seq(r14, 17).
passed_channel(r15). matter_of(r15, x15). veto(ca, r15, 44). veto_signed(ca, r15). veto_cites_law(ca, r15, l15). citation_refused_at(ca, r15, l15, 44).
cites_right_of(r15, l15, h15). reversible_marking(r15). marking_delivered(r15, h15, 44). decided_seq(r15, 40).

% EXPECT[LV.2]: pr_beyond_ceilings(ch,r1)
% EXPECT-NOT[LV.2]: pr_citation_refused(ch,r1,l1)
% EXPECT-NOT[LV.2]: pr_cite_time_refused(ch,r1,l1)
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
% EXPECT[LV.2]: pr_citation_refused(ch,r9,l9)
% EXPECT-NOT[LV.2]: pr_citation_refused(ch,r6,l6)
% EXPECT-NOT[LV.2]: pr_first_citing(ch,r9,l9,40)
% EXPECT-NOT[LV.2]: pr_law_hold(r9)
% EXPECT[LV.3]: pr_protection_mode(r9,l9)
% EXPECT[LV.3]: pr_consequence_withheld(r9,h9)
% EXPECT[LV.2]: pr_citation_refused(ca,r10,l10)
% EXPECT[LV.2]: pr_in_ceilings(ca,r10)
% EXPECT-NOT[LV.2]: pr_law_hold(r10)
% EXPECT[LV.3]: pr_consequence_withheld(r10,h10)
% EXPECT-NOT[LV.3]: pr_custodian_passes(r10)
% EXPECT-NOT[LV.2]: pr_citation_refused(ch,r11,l11)
% EXPECT[LV.2]: pr_first_citing(ch,r11,l11,44)
% EXPECT[LV.2]: pr_citation_refused(ch,r12,l12)
% EXPECT-NOT[LV.3]: pr_protection_mode(r12,l12)
% EXPECT[LV.2]: pr_citation_refused(ch,r13,l13)
% EXPECT[LV.4]: pr_overdue(r13,l13)
% EXPECT[LV.4]: pr_redrawn(r13,l13)
% EXPECT[LV.4]: pr_counts_toward_d2(r13)
% EXPECT-NOT[LV.4]: pr_overdue(r14,l14)
% EXPECT-NOT[LV.4]: pr_redrawn(r14,l14)
% EXPECT[LV.2]: pr_law_hold(r13)
% EXPECT[LV.3]: pr_consequence_withheld(r13,h13)
% EXPECT-NOT[LV.4]: pr_overdue(r12,l12)
% EXPECT[LV.2]: pr_citation_refused(ca,r15,l15)
% EXPECT[LV.2]: pr_in_ceilings(ca,r15)
% EXPECT-NOT[LV.4]: pr_overdue(r15,l15)
% EXPECT-NOT[LV.2]: pr_pending_hold(r15,l15)
% EXPECT-NOT[LV.2]: pr_law_hold(r15)
% EXPECT[LV.3]: pr_consequence_withheld(r15,h15)
% EXPECT-NOT[LV.3]: pr_custodian_passes(r15)
% EXPECT-NOT[LV.4]: pr_overdue(r10,l10)
