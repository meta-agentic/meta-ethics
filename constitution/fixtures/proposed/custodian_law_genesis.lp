% Law-citing vetoes under the genesis regime (LV, as proposed; P1.7, P1.8): the founder f holds
% the human seat; the regime has not ended. A pending review past its ceiling
% no longer holds the reversible act: its consequences are withheld from the
% human the citation names, the review is drawn again, and the veto still
% counts toward the seat's ceiling; the next veto is then beyond it.

now(40).
param(law_review_ceiling, 10). param(veto_window, 50). param(veto_ceiling, 1). param(veto_per_act, 5).
root_grant(m0). mandate(m0, f, s). issued(m0, 0). founder(f). carries_seat(m0, ch). admitted(m0).
root_grant(m1). mandate(m1, a, s). issued(m1, 0). carries_seat(m1, ca). admitted(m1).
custodian_seat(ch). custodian_seat(ca).
passed_channel(q1). matter_of(q1, x1). veto(ch, q1, 10). veto_signed(ch, q1). veto_cites_law(ch, q1, l1).
passed_channel(q2). matter_of(q2, x2). veto(ch, q2, 20). veto_signed(ch, q2).
decided_seq(q1, 10). decided_seq(q2, 20).
% the human whose right each citation names
cites_right_of(q1, l1, hr).

% EXPECT-NOT[LV.2]: pr_law_hold(q1)
% EXPECT[LV.3]: pr_consequence_withheld(q1,hr)
% EXPECT[LV.4]: pr_overdue(q1,l1)
% EXPECT[LV.4]: pr_redrawn(q1,l1)
% EXPECT-NOT[LV.3]: pr_custodian_passes(q1)
% EXPECT[LV.5]: pr_counted_veto(ch,q1,10)
% EXPECT-NOT[LV.5]: pr_within_ceiling(ch,q2)
% EXPECT[LV.3]: pr_custodian_passes(q2)
