% Law-citing vetoes and the ceilings (LV, as proposed; P1.7, P1.8). The ceiling is two vetoes
% per window. Every veto counts toward both ceilings unless the law it cites
% was found breached, for the act or a re-proposal of it: ca's veto on q1,
% whose law was found breached, does not count; its veto on q2, found
% unfounded, and on q4, its review pending, do. q4's veto is beyond the
% seat's ceiling, so its pending citation does not hold the act: the act
% passes, and the citation is a finding that keeps any consequence off the
% human it names, hq, until the review decides. A
% re-proposal re-citing a law found unfounded is an ordinary, counted veto
% with no fresh hold; one re-citing a law found breached stays uncounted and
% held.

now(30).
param(law_review_ceiling, 100). param(veto_window, 20). param(veto_ceiling, 2). param(veto_per_act, 5).
root_grant(m0). mandate(m0, h, s). issued(m0, 0). carries_seat(m0, ch). admitted(m0).
root_grant(m1). mandate(m1, a, s). issued(m1, 0). carries_seat(m1, ca). admitted(m1).
custodian_seat(ch). custodian_seat(ca).
passed_channel(q1). matter_of(q1, x1). veto(ca, q1, 10). veto_signed(ca, q1). veto_cites_law(ca, q1, l1).
law_breach_found(q1, l1).
passed_channel(q2). matter_of(q2, x2). veto(ca, q2, 11). veto_signed(ca, q2). veto_cites_law(ca, q2, l2). law_unfounded(q2, l2).
passed_channel(q3). matter_of(q3, x3). veto(ca, q3, 12). veto_signed(ca, q3).
passed_channel(q4). matter_of(q4, x4). veto(ca, q4, 13). veto_signed(ca, q4). veto_cites_law(ca, q4, l3).
cites_right_of(q4, l3, hq).
passed_channel(q5). matter_of(q5, x5). veto(ca, q5, 14). veto_signed(ca, q5).
reproposal_of(q6, q2). passed_channel(q6). matter_of(q6, x2). veto(ch, q6, 15). veto_signed(ch, q6). veto_cites_law(ch, q6, l2).
reproposal_of(q7, q1). passed_channel(q7). matter_of(q7, x1). veto(ch, q7, 16). veto_signed(ch, q7). veto_cites_law(ch, q7, l1).
% a veto with no law citation on a re-proposal of q1 counts; on an unrelated act, laws
% found breached or unfounded elsewhere neither exempt the veto nor withdraw the hold
reproposal_of(q8, q1). passed_channel(q8). matter_of(q8, x1). veto(ch, q8, 17). veto_signed(ch, q8).
passed_channel(q9). matter_of(q9, x9). veto(ch, q9, 18). veto_signed(ch, q9). veto_cites_law(ch, q9, l1).
passed_channel(q10). matter_of(q10, x10). veto(ch, q10, 19). veto_signed(ch, q10). veto_cites_law(ch, q10, l2).

% each vetoed act's position among decided proposals
decided_seq(q1, 10). decided_seq(q2, 11). decided_seq(q3, 12). decided_seq(q4, 13). decided_seq(q5, 14).
decided_seq(q6, 15). decided_seq(q7, 16). decided_seq(q8, 17). decided_seq(q9, 18). decided_seq(q10, 19).
% the human whose right each citation names
cites_right_of(q1, l1, hr). cites_right_of(q2, l2, hr). cites_right_of(q6, l2, hr). cites_right_of(q7, l1, hr). cites_right_of(q9, l1, hr). cites_right_of(q10, l2, hr).
% the filer marks each other act's effect reversible
reversible_marking(q1). reversible_marking(q2). reversible_marking(q3). reversible_marking(q4). reversible_marking(q5). reversible_marking(q6). reversible_marking(q7). reversible_marking(q8). reversible_marking(q9). reversible_marking(q10).

% EXPECT[LV.5]: pr_within_ceiling(ca,q3)
% EXPECT[LV.5]: pr_counted_veto(ca,q2,11)
% EXPECT[LV.5]: pr_counted_veto(ca,q4,13)
% EXPECT-NOT[LV.5]: pr_counted_veto(ca,q1,10)
% EXPECT-NOT[LV.5]: pr_within_ceiling(ca,q4)
% EXPECT-NOT[LV.5]: pr_within_ceiling(ca,q5)
% EXPECT-NOT[LV.2]: pr_law_hold(q4)
% EXPECT[LV.2]: pr_beyond_ceilings(ca,q4)
% EXPECT[LV.3]: pr_consequence_withheld(q4,hq)
% EXPECT[LV.3]: pr_consequence_withheld(q4,hq)
% EXPECT[LV.2]: pr_law_hold(q1)
% EXPECT[LV.3]: pr_custodian_passes(q4)
% EXPECT-NOT[LV.3]: pr_custodian_passes(q1)
% EXPECT-NOT[LV.2]: pr_law_hold(q2)
% EXPECT[LV.5]: pr_counted_veto(ch,q6,15)
% EXPECT-NOT[LV.2]: pr_law_hold(q6)
% EXPECT[P1.7]: law_unfounded_in_family(q6,l2)
% EXPECT-NOT[LV.5]: pr_counted_veto(ch,q7,16)
% EXPECT[P1.8]: law_founded(ch,q7)
% EXPECT[LV.2]: pr_law_hold(q7)
% EXPECT[LV.5]: pr_counted_veto(ch,q8,17)
% EXPECT[LV.5]: pr_counted_veto(ch,q9,18)
% EXPECT-NOT[P1.7]: law_unfounded_in_family(q10,l2)
% EXPECT-NOT[P1.7]: pr_breach_found_in_family(q9,l1)
