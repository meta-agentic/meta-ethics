% Law-citing vetoes (P1.7, P1.8). The ceiling is two vetoes per window. ca's
% founded law-citing veto on q1 and its pending one on q4 count toward no
% ceiling; its unfounded one on q2 counts. q4 does not pass while its review
% is pending, even beyond the ordinary ceiling.

now(30).
param(veto_window, 20). param(veto_ceiling, 2). param(veto_per_act, 5).
root_grant(m0). mandate(m0, h, s). issued(m0, 0). carries_seat(m0, ch). admitted(m0).
root_grant(m1). mandate(m1, a, s). issued(m1, 0). carries_seat(m1, ca). admitted(m1).
custodian_seat(ch). custodian_seat(ca).
passed_channel(q1). matter_of(q1, x1). veto(ca, q1, 10). veto_signed(ca, q1). veto_cites_law(ca, q1, l1).
passed_channel(q2). matter_of(q2, x2). veto(ca, q2, 11). veto_signed(ca, q2). veto_cites_law(ca, q2, l2). law_unfounded(q2, l2).
passed_channel(q3). matter_of(q3, x3). veto(ca, q3, 12). veto_signed(ca, q3).
passed_channel(q4). matter_of(q4, x4). veto(ca, q4, 13). veto_signed(ca, q4). veto_cites_law(ca, q4, l3).
passed_channel(q5). matter_of(q5, x5). veto(ca, q5, 14). veto_signed(ca, q5).

% EXPECT[P1.8]: within_ceiling(ca,q3)
% EXPECT[P1.8]: counted_veto(ca,q2,11)
% EXPECT-NOT[P1.8]: counted_veto(ca,q1,10)
% EXPECT-NOT[P1.8]: within_ceiling(ca,q5)
% EXPECT[P1.7]: law_hold(q4)
% EXPECT[P1.7]: law_hold(q1)
% EXPECT-NOT[P1.7]: custodian_passes(q4)
% EXPECT-NOT[P1.7]: custodian_passes(q1)
% EXPECT-NOT[P1.7]: law_hold(q2)
