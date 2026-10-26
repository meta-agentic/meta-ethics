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

now(40).
param(law_review_ceiling, 10). param(veto_window, 50). param(veto_ceiling, 1). param(veto_per_act, 5).
param(answer_window, 5). param(extension_amount, 10).
root_grant(m0). mandate(m0, f, s). issued(m0, 0). founder(f). kind_of(f, human). carries_seat(m0, ch). admitted(m0).
root_grant(m1). mandate(m1, a, s). issued(m1, 0). kind_of(a, nonhuman). carries_seat(m1, ca). admitted(m1).
custodian_seat(ch). custodian_seat(ca).
regime_exit(1).
passed_channel(q0). matter_of(q0, x0). veto(ch, q0, 5). veto_signed(ch, q0). reversible_marking(q0).
passed_channel(q1). matter_of(q1, x1). veto(ch, q1, 10). veto_signed(ch, q1). veto_cites_law(ch, q1, l1).
cites_right_of(q1, l1, h1). reversible_marking(q1).
passed_channel(q2). matter_of(q2, x2). veto(ch, q2, 11). veto_signed(ch, q2). veto_cites_law(ch, q2, l2).
cites_right_of(q2, l2, h2). reversible_marking(q2). window_opens(h2, x2, 38).
passed_channel(q3). matter_of(q3, x3). veto(ch, q3, 12). veto_signed(ch, q3). veto_cites_law(ch, q3, l3).
cites_right_of(q3, l3, h3). reversible_marking(q3). window_opens(h3, x3, 20).
passed_channel(q4). matter_of(q4, x4). veto(ch, q4, 13). veto_signed(ch, q4). veto_cites_law(ch, q4, l4).
cites_class(q4, l4, tenants). in_class(h4, tenants). in_class(h5, tenants). reversible_marking(q4). window_opens(h4, x4, 20).
passed_channel(q5). matter_of(q5, x5). veto(ch, q5, 14). veto_signed(ch, q5). veto_cites_law(ch, q5, l5).
cites_right_of(q5, l5, h6). reversible_marking(q5). window_opens(h6, x5, 30). extension_requested(h6, x5, 33).
passed_channel(q6). matter_of(q6, x6). veto(ch, q6, 15). veto_signed(ch, q6). veto_cites_law(ch, q6, l6).
cites_right_of(q6, l6, h7). reversible_marking(q6). window_opens(h7, x6, 20). marking_contest(h7, q6).
passed_channel(q7). matter_of(q7, x7). veto(ch, q7, 16). veto_signed(ch, q7). veto_cites_law(ch, q7, l7).
cites_right_of(q7, l7, h8).
passed_channel(q8). matter_of(q8, x8). veto(ch, q8, 17). veto_signed(ch, q8). veto_cites_law(ch, q8, l8).
cites_right_of(q8, l8, h9). reversible_marking(q8). law_unfounded(q8, l8).
passed_channel(q10). matter_of(q10, x10). veto(ch, q10, 35). veto_signed(ch, q10). veto_cites_law(ch, q10, l10).
cites_right_of(q10, l10, h11). reversible_marking(q10). window_opens(h11, x10, 36).
passed_channel(q11). matter_of(q11, x11). veto(ch, q11, 34). veto_signed(ch, q11). veto_cites_law(ch, q11, l11).
cites_right_of(q11, l11, h12). reversible_marking(q11). window_opens(h12, x11, 34).
passed_channel(q12). matter_of(q12, x12). veto(ca, q12, 35). veto_signed(ca, q12). veto_cites_law(ca, q12, l12).
cites_right_of(q12, l12, h13). reversible_marking(q12). window_opens(h13, x12, 35). decided_seq(q12, 35).
decided_seq(q0, 5). decided_seq(q1, 10). decided_seq(q2, 11). decided_seq(q3, 12). decided_seq(q4, 13).
decided_seq(q5, 14). decided_seq(q6, 15). decided_seq(q7, 16). decided_seq(q8, 17). decided_seq(q10, 35). decided_seq(q11, 34).

% EXPECT[LV.2]: pr_marking_owed(q1,h1)
% EXPECT[LV.2]: pr_marking_pending(q1)
% EXPECT[LV.2]: pr_law_hold(q1)
% EXPECT-NOT[LV.3]: pr_protection_mode(q1,l1)
% EXPECT-NOT[LV.3]: pr_custodian_passes(q1)
% EXPECT-NOT[LV.3]: pr_consequence_withheld(q1,h1)
% EXPECT-NOT[LV.2]: pr_marking_answered(h2,x2)
% EXPECT[LV.2]: pr_marking_pending(q2)
% EXPECT[LV.2]: pr_law_hold(q2)
% EXPECT[LV.2]: pr_marking_answered(h3,x3)
% EXPECT-NOT[LV.2]: pr_marking_pending(q3)
% EXPECT-NOT[LV.2]: pr_law_hold(q3)
% EXPECT[LV.3]: pr_protection_mode(q3,l3)
% EXPECT[LV.3]: pr_custodian_passes(q3)
% EXPECT[LV.3]: pr_consequence_withheld(q3,h3)
% EXPECT[LV.2]: pr_marking_owed(q4,h5)
% EXPECT[LV.2]: pr_marking_answered(h4,x4)
% EXPECT-NOT[LV.2]: pr_marking_answered(h5,x4)
% EXPECT[LV.2]: pr_marking_pending(q4)
% EXPECT[LV.2]: pr_law_hold(q4)
% EXPECT-NOT[LV.2]: pr_marking_answered(h6,x5)
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
% EXPECT[LV.2]: pr_marking_answered(h13,x12)
% EXPECT-NOT[LV.2]: pr_marking_pending(q12)
% EXPECT[LV.2]: pr_in_ceilings(ca,q12)
% EXPECT[LV.2]: pr_law_hold(q12)
% EXPECT-NOT[LV.3]: pr_protection_mode(q12,l12)
% EXPECT-NOT[LV.3]: pr_custodian_passes(q12)
