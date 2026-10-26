% A reversible marking is delivered, and the act waits for the answer window
% (LV.2, LV.3, as proposed; H1.5). The founder f's seat ch spent its ceiling
% on q0, so each later citation of ch's is beyond the ceilings, and the
% reviews of q1 to q8 are past their ceiling. Beyond the ceilings a reversible
% act passes with its consequences withheld only once its marking was
% delivered to every human the citation protects and each one's answer
% window, running from that delivery, has passed without a contest.
% q1: not delivered: held. q2: delivered, the window still open: held.
% q3: delivered, the window passed: passes, withheld from h3. q4: a class
% citation, delivered to h4 and not to h5: held. q5: delivered, the window
% extended once at h6's request and still open: held. q6: delivered, the
% window passed, but h7 contested the marking in time: held as irreversible.
% q7: no marking at all: held as irreversible, no delivery owed. q8: the
% citation found unfounded: nothing owed, passes. q10 and q11: recent
% citations, their reviews not yet past the ceiling, beyond the seat's
% ceilings: q10 waits for its window, q11's window has passed. q12: ca's
% citation within its ceilings, delivered, the window passed: held by the
% pending review alone, as LV.2 holds every act within the ceilings.
% q13: h14's window on the matter opened before the veto, the marking never
% delivered: held. q14: a re-proposal of q3 on the same matter, q3's
% delivery reused and q14's marking never delivered: held. q15: never
% delivered, the delivery bound long passed since the veto: held as if its
% filer had declared nothing. q16: ca's citation naming h6, delivered before
% the veto: h6's window runs from the veto, and h6's extension on q5's
% matter does not lengthen it. q17: delivered late, past the bound: not
% lapsed, and h17's window runs in full. q18: delivered, the window passed,
% but h18's signing means is compromised and the window suspended (S1.12):
% not answered. q19: delivered, the window passed, but h19's filing on the
% matter awaits rendering (H2.3): not answered. q20: as q16, with ch's
% unsigned veto at 10, and q16 carries ch's unsigned veto at 30: neither
% starts h6's or h20's window, which runs from ca's citing veto. q21: two
% citations, ch's at 5 protecting h21 and ca's at 36 protecting h22, both
% delivered early: h22's window runs from the citation that protects h22.
% q22: two citations protecting the same h23, at 5 and at 36, delivered at
% 5: the act is held while the later window is open. ca's
% unsigned, uncounted earlier vetoes on q1 and q2 do not
% start the bound or the window: both run from the citing veto.

now(40).
param(law_review_ceiling, 10). param(veto_window, 20). param(veto_ceiling, 1). param(veto_per_act, 5).
param(answer_window, 5). param(extension_amount, 10). param(delivery_bound, 35).
root_grant(m0). mandate(m0, f, s). issued(m0, 0). founder(f). kind_of(f, human). carries_seat(m0, ch). admitted(m0).
root_grant(m1). mandate(m1, a, s). issued(m1, 0). kind_of(a, nonhuman). carries_seat(m1, ca). admitted(m1).
custodian_seat(ch). custodian_seat(ca).
regime_exit(1).
passed_channel(q0). matter_of(q0, x0). veto(ch, q0, 5). veto_signed(ch, q0). reversible_marking(q0).
passed_channel(q1). matter_of(q1, x1). veto(ch, q1, 10). veto_signed(ch, q1). veto_cites_law(ch, q1, l1).
cites_right_of(q1, l1, h1). reversible_marking(q1). veto(ca, q1, 1).
passed_channel(q2). matter_of(q2, x2). veto(ch, q2, 11). veto_signed(ch, q2). veto_cites_law(ch, q2, l2).
cites_right_of(q2, l2, h2). reversible_marking(q2). marking_delivered(q2, h2, 38). veto(ca, q2, 1).
passed_channel(q3). matter_of(q3, x3). veto(ch, q3, 12). veto_signed(ch, q3). veto_cites_law(ch, q3, l3).
cites_right_of(q3, l3, h3). reversible_marking(q3). marking_delivered(q3, h3, 20).
passed_channel(q4). matter_of(q4, x4). veto(ch, q4, 13). veto_signed(ch, q4). veto_cites_law(ch, q4, l4).
cites_class(q4, l4, tenants). in_class(h4, tenants). in_class(h5, tenants). reversible_marking(q4). marking_delivered(q4, h4, 20).
passed_channel(q5). matter_of(q5, x5). veto(ch, q5, 14). veto_signed(ch, q5). veto_cites_law(ch, q5, l5).
cites_right_of(q5, l5, h6). reversible_marking(q5). marking_delivered(q5, h6, 30). extension_requested(h6, x5, 33).
passed_channel(q6). matter_of(q6, x6). veto(ch, q6, 15). veto_signed(ch, q6). veto_cites_law(ch, q6, l6).
cites_right_of(q6, l6, h7). reversible_marking(q6). marking_delivered(q6, h7, 20). marking_contest(h7, q6).
passed_channel(q7). matter_of(q7, x7). veto(ch, q7, 16). veto_signed(ch, q7). veto_cites_law(ch, q7, l7).
cites_right_of(q7, l7, h8).
passed_channel(q8). matter_of(q8, x8). veto(ch, q8, 17). veto_signed(ch, q8). veto_cites_law(ch, q8, l8).
cites_right_of(q8, l8, h9). reversible_marking(q8). law_unfounded(q8, l8).
passed_channel(q10). matter_of(q10, x10). veto(ch, q10, 35). veto_signed(ch, q10). veto_cites_law(ch, q10, l10).
cites_right_of(q10, l10, h11). reversible_marking(q10). marking_delivered(q10, h11, 36).
passed_channel(q11). matter_of(q11, x11). veto(ch, q11, 34). veto_signed(ch, q11). veto_cites_law(ch, q11, l11).
cites_right_of(q11, l11, h12). reversible_marking(q11). marking_delivered(q11, h12, 34).
passed_channel(q12). matter_of(q12, x12). veto(ca, q12, 35). veto_signed(ca, q12). veto_cites_law(ca, q12, l12).
cites_right_of(q12, l12, h13). reversible_marking(q12). marking_delivered(q12, h13, 35). decided_seq(q12, 35).
passed_channel(q13). matter_of(q13, x13). veto(ch, q13, 18). veto_signed(ch, q13). veto_cites_law(ch, q13, l13).
cites_right_of(q13, l13, h14). reversible_marking(q13). window_opens(h14, x13, 2). decided_seq(q13, 18).
reproposal_of(q14, q3). passed_channel(q14). matter_of(q14, x3). veto(ch, q14, 19). veto_signed(ch, q14). veto_cites_law(ch, q14, l14).
cites_right_of(q14, l14, h3). reversible_marking(q14). decided_seq(q14, 19).
passed_channel(q15). matter_of(q15, x15). veto(ch, q15, 2). veto_signed(ch, q15). veto_cites_law(ch, q15, l15).
cites_right_of(q15, l15, h16). reversible_marking(q15). decided_seq(q15, 2).
passed_channel(q16). matter_of(q16, x16). veto(ca, q16, 36). veto_signed(ca, q16). veto_cites_law(ca, q16, l16).
cites_right_of(q16, l16, h6). reversible_marking(q16). marking_delivered(q16, h6, 20). decided_seq(q16, 36). veto(ch, q16, 30).
passed_channel(q20). matter_of(q20, x20). veto(ca, q20, 36). veto_signed(ca, q20). veto_cites_law(ca, q20, l20).
cites_right_of(q20, l20, h20). reversible_marking(q20). marking_delivered(q20, h20, 20). decided_seq(q20, 36). veto(ch, q20, 10).
passed_channel(q17). matter_of(q17, x17). veto(ch, q17, 3). veto_signed(ch, q17). veto_cites_law(ch, q17, l17).
cites_right_of(q17, l17, h17). reversible_marking(q17). marking_delivered(q17, h17, 37). decided_seq(q17, 3).
passed_channel(q18). matter_of(q18, x18). veto(ch, q18, 15). veto_signed(ch, q18). veto_cites_law(ch, q18, l18).
cites_right_of(q18, l18, h18). reversible_marking(q18). marking_delivered(q18, h18, 20). decided_seq(q18, 15).
requires_signature(x18, h18). reports_compromise(k18, h18, 30).
passed_channel(q19). matter_of(q19, x19). veto(ch, q19, 15). veto_signed(ch, q19). veto_cites_law(ch, q19, l19).
cites_right_of(q19, l19, h19). reversible_marking(q19). marking_delivered(q19, h19, 20). decided_seq(q19, 15).
human_language_filing(h19, x19).
passed_channel(q21). matter_of(q21, x21). veto(ch, q21, 5). veto_signed(ch, q21). veto_cites_law(ch, q21, l21).
cites_right_of(q21, l21, h21). veto(ca, q21, 36). veto_signed(ca, q21). veto_cites_law(ca, q21, l22).
cites_right_of(q21, l22, h22). reversible_marking(q21). marking_delivered(q21, h21, 5). marking_delivered(q21, h22, 10). decided_seq(q21, 5).
passed_channel(q22). matter_of(q22, x22). veto(ch, q22, 5). veto_signed(ch, q22). veto_cites_law(ch, q22, l23).
cites_right_of(q22, l23, h23). veto(ca, q22, 36). veto_signed(ca, q22). veto_cites_law(ca, q22, l24).
cites_right_of(q22, l24, h23). reversible_marking(q22). marking_delivered(q22, h23, 5). decided_seq(q22, 5).
decided_seq(q0, 5). decided_seq(q1, 10). decided_seq(q2, 11). decided_seq(q3, 12). decided_seq(q4, 13).
decided_seq(q5, 14). decided_seq(q6, 15). decided_seq(q7, 16). decided_seq(q8, 17). decided_seq(q10, 35). decided_seq(q11, 34).

% EXPECT[LV.2]: pr_marking_owed(q1,h1)
% EXPECT[LV.2]: pr_marking_pending(q1)
% EXPECT[LV.2]: pr_law_hold(q1)
% EXPECT-NOT[LV.3]: pr_protection_mode(q1,l1)
% EXPECT-NOT[LV.3]: pr_custodian_passes(q1)
% EXPECT-NOT[LV.3]: pr_consequence_withheld(q1,h1)
% EXPECT-NOT[LV.2]: pr_marking_answered(q2,h2)
% EXPECT[LV.2]: pr_marking_pending(q2)
% EXPECT[LV.2]: pr_law_hold(q2)
% EXPECT[LV.2]: pr_marking_answered(q3,h3)
% EXPECT-NOT[LV.2]: pr_marking_pending(q3)
% EXPECT-NOT[LV.2]: pr_law_hold(q3)
% EXPECT[LV.3]: pr_protection_mode(q3,l3)
% EXPECT[LV.3]: pr_custodian_passes(q3)
% EXPECT[LV.3]: pr_consequence_withheld(q3,h3)
% EXPECT[LV.2]: pr_marking_owed(q4,h5)
% EXPECT[LV.2]: pr_marking_answered(q4,h4)
% EXPECT-NOT[LV.2]: pr_marking_answered(q4,h5)
% EXPECT[LV.2]: pr_marking_pending(q4)
% EXPECT[LV.2]: pr_law_hold(q4)
% EXPECT-NOT[LV.2]: pr_marking_answered(q5,h6)
% EXPECT[LV.2]: pr_marking_pending(q5)
% EXPECT[LV.2]: pr_law_hold(q5)
% EXPECT-NOT[LV.2]: pr_marking_pending(q6)
% EXPECT[LV.2]: pr_irreversible(q6)
% EXPECT[LV.2]: pr_law_hold(q6)
% EXPECT-NOT[LV.2]: pr_marking_owed(q7,h8)
% EXPECT-NOT[LV.2]: pr_marking_pending(q7)
% EXPECT[LV.2]: pr_law_hold(q7)
% EXPECT-NOT[LV.2]: pr_marking_owed(q8,h9)
% EXPECT-NOT[LV.2]: pr_marking_pending(q8)
% EXPECT[LV.3]: pr_custodian_passes(q8)
% EXPECT[LV.2]: pr_marking_pending(q10)
% EXPECT-NOT[LV.4]: pr_overdue(q10,l10)
% EXPECT-NOT[LV.3]: pr_protection_mode(q10,l10)
% EXPECT[LV.2]: pr_law_hold(q10)
% EXPECT-NOT[LV.2]: pr_marking_pending(q11)
% EXPECT[LV.3]: pr_protection_mode(q11,l11)
% EXPECT[LV.3]: pr_consequence_withheld(q11,h12)
% EXPECT[LV.2]: pr_marking_answered(q12,h13)
% EXPECT-NOT[LV.2]: pr_marking_pending(q12)
% EXPECT[LV.2]: pr_in_ceilings(ca,q12)
% EXPECT[LV.2]: pr_law_hold(q12)
% EXPECT-NOT[LV.3]: pr_protection_mode(q12,l12)
% EXPECT-NOT[LV.3]: pr_custodian_passes(q12)
% EXPECT[LV.2]: pr_marking_pending(q13)
% EXPECT[LV.2]: pr_law_hold(q13)
% EXPECT-NOT[LV.2]: pr_marking_answered(q13,h14)
% EXPECT[LV.2]: pr_marking_pending(q14)
% EXPECT[LV.2]: pr_law_hold(q14)
% EXPECT-NOT[LV.3]: pr_custodian_passes(q14)
% EXPECT[LV.2]: pr_marking_lapsed(q15,h16)
% EXPECT[LV.2]: pr_irreversible(q15)
% EXPECT[LV.2]: pr_marking_pending(q15)
% EXPECT[LV.2]: pr_law_hold(q15)
% EXPECT-NOT[LV.3]: pr_protection_mode(q15,l15)
% EXPECT-NOT[LV.3]: pr_custodian_passes(q15)
% EXPECT-NOT[LV.3]: pr_consequence_withheld(q15,h16)
% EXPECT-NOT[LV.2]: pr_marking_lapsed(q1,h1)
% EXPECT-NOT[LV.2]: pr_irreversible(q1)
% EXPECT-NOT[LV.2]: pr_marking_lapsed(q2,h2)
% EXPECT[LV.2]: pr_marking_due(q5,h6,45)
% EXPECT[LV.2]: pr_marking_due(q3,h3,25)
% EXPECT-NOT[LV.2]: pr_marking_due(q3,h3,35)
% EXPECT[LV.2]: pr_marking_start(q16,h6,36)
% EXPECT-NOT[LV.2]: pr_marking_start(q16,h6,20)
% EXPECT[LV.2]: pr_marking_due(q16,h6,41)
% EXPECT-NOT[LV.2]: pr_marking_due(q16,h6,51)
% EXPECT-NOT[LV.2]: pr_marking_answered(q16,h6)
% EXPECT[LV.2]: pr_marking_pending(q16)
% EXPECT[LV.2]: pr_marking_start(q2,h2,38)
% EXPECT-NOT[LV.2]: pr_marking_start(q2,h2,11)
% EXPECT-NOT[LV.2]: pr_marking_lapsed(q17,h17)
% EXPECT-NOT[LV.2]: pr_irreversible(q17)
% EXPECT[LV.2]: pr_marking_due(q17,h17,42)
% EXPECT[LV.2]: pr_marking_pending(q17)
% EXPECT[LV.2]: pr_marking_due(q18,h18,25)
% EXPECT-NOT[LV.2]: pr_marking_answered(q18,h18)
% EXPECT[LV.2]: pr_marking_pending(q18)
% EXPECT[LV.2]: pr_law_hold(q18)
% EXPECT-NOT[LV.2]: pr_marking_answered(q19,h19)
% EXPECT[LV.2]: pr_marking_pending(q19)
% EXPECT[LV.2]: pr_marking_start(q20,h20,36)
% EXPECT-NOT[LV.2]: pr_marking_start(q20,h20,20)
% EXPECT-NOT[LV.2]: pr_marking_start(q16,h6,30)
% EXPECT[LV.2]: pr_marking_pending(q20)
% EXPECT[LV.2]: pr_marking_cited(q21,h22,36)
% EXPECT-NOT[LV.2]: pr_marking_cited(q21,h22,5)
% EXPECT[LV.2]: pr_marking_start(q21,h22,36)
% EXPECT-NOT[LV.2]: pr_marking_start(q21,h22,10)
% EXPECT[LV.2]: pr_marking_answered(q21,h21)
% EXPECT-NOT[LV.2]: pr_marking_answered(q21,h22)
% EXPECT[LV.2]: pr_marking_pending(q21)
% EXPECT[LV.2]: pr_law_hold(q21)
% EXPECT[LV.2]: pr_marking_open(q22,h23)
% EXPECT-NOT[LV.2]: pr_marking_open(q3,h3)
% EXPECT-NOT[LV.2]: pr_marking_answered(q22,h23)
% EXPECT[LV.2]: pr_marking_pending(q22)
% EXPECT-NOT[LV.2]: pr_marking_due(q5,h6,35)
% EXPECT-NOT[LV.2]: pr_marking_lapsed(q7,h8)
passed_channel(q23). matter_of(q23, x23). veto(ch, q23, 1). veto_signed(ch, q23). veto_cites_law(ch, q23, l25).
cites_right_of(q23, l25, h24). decided_seq(q23, 1).
% q23: no marking at all and an old veto: held as undeclared, and no lapse of a marking is derived
% EXPECT-NOT[LV.2]: pr_marking_lapsed(q23,h24)
% EXPECT[LV.2]: pr_irreversible(q23)
