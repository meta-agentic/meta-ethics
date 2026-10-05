% A seat past its ceilings cites new laws, under the genesis regime (P1.7,
% P1.8). The founder f holds the human seat; ceiling one veto per window.
% f's first veto (q0) is ordinary and spends the ceiling. Its law-citing
% vetoes on q1 and q2, reviews pending, are beyond it: they hold neither act,
% each act passes, and no consequence of either falls on the human each
% citation names until its review decides. On q3 the review found the
% breach: held, whatever the ceiling.

now(30).
param(law_review_ceiling, 10). param(veto_window, 50). param(veto_ceiling, 1). param(veto_per_act, 1).
root_grant(m0). mandate(m0, f, s). issued(m0, 0). founder(f). carries_seat(m0, ch). admitted(m0).
root_grant(m1). mandate(m1, a, s). issued(m1, 0). carries_seat(m1, ca). admitted(m1).
custodian_seat(ch). custodian_seat(ca).
passed_channel(q0). matter_of(q0, x0). veto(ch, q0, 5). veto_signed(ch, q0).
passed_channel(q1). matter_of(q1, x1). veto(ch, q1, 10). veto_signed(ch, q1). veto_cites_law(ch, q1, l1).
cites_right_of(q1, l1, h1).
passed_channel(q2). matter_of(q2, x2). veto(ch, q2, 11). veto_signed(ch, q2). veto_cites_law(ch, q2, l2).
cites_right_of(q2, l2, h2).
passed_channel(q3). matter_of(q3, x3). veto(ch, q3, 12). veto_signed(ch, q3). veto_cites_law(ch, q3, l3).
cites_right_of(q3, l3, h3). law_breach_found(q3, l3).
% a citation names one human, and protects no other the record names for that act
cites_right_of(q1, l9, h9).
% within ca's window ceiling but beyond the per-act bound: a re-proposal of q5,
% which f already vetoed, held by no pending citation of ca's
passed_channel(q5). matter_of(q5, x5). veto(ch, q5, 14). veto_signed(ch, q5).
reproposal_of(q6, q5). passed_channel(q6). matter_of(q6, x5). veto(ca, q6, 15). veto_signed(ca, q6).
veto_cites_law(ca, q6, l6). cites_right_of(q6, l6, h6).
% a citation the review found unfounded protects no one
passed_channel(q4). matter_of(q4, x4). veto(ch, q4, 13). veto_signed(ch, q4). veto_cites_law(ch, q4, l4).
cites_right_of(q4, l4, h4). law_unfounded(q4, l4).
decided_seq(q0, 5). decided_seq(q1, 10). decided_seq(q2, 11). decided_seq(q3, 12). decided_seq(q4, 13). decided_seq(q5, 14). decided_seq(q6, 15).
% the filer marks each other act's effect reversible
reversible_marking(q0). reversible_marking(q1). reversible_marking(q2). reversible_marking(q3). reversible_marking(q5). reversible_marking(q6). reversible_marking(q4).

% EXPECT[LV.5]: pr_within_ceiling(ch,q0)
% EXPECT-NOT[LV.2]: pr_law_hold(q1)
% EXPECT-NOT[LV.2]: pr_law_hold(q2)
% EXPECT[LV.3]: pr_custodian_passes(q1)
% EXPECT[LV.3]: pr_custodian_passes(q2)
% EXPECT[LV.3]: pr_consequence_withheld(q1,h1)
% EXPECT[LV.3]: pr_consequence_withheld(q2,h2)
% EXPECT-NOT[LV.3]: pr_consequence_withheld(q1,h2)
% EXPECT[LV.4]: pr_redrawn(q1,l1)
% EXPECT[LV.2]: pr_law_hold(q3)
% EXPECT-NOT[LV.3]: pr_custodian_passes(q3)
% EXPECT-NOT[LV.3]: pr_consequence_withheld(q3,h3)
% EXPECT-NOT[LV.3]: pr_consequence_withheld(q4,h4)
% EXPECT[LV.3]: pr_custodian_passes(q4)
% EXPECT-NOT[LV.3]: pr_consequence_withheld(q1,h9)
% EXPECT[LV.5]: pr_within_ceiling(ca,q6)
% EXPECT[LV.2]: pr_beyond_ceilings(ca,q6)
% EXPECT-NOT[LV.2]: pr_law_hold(q6)
% EXPECT[LV.4]: pr_redrawn(q6,l6)
% EXPECT[LV.3]: pr_consequence_withheld(q6,h6)
% EXPECT-NOT[LV.5]: pr_standing_veto(ca,q6)
