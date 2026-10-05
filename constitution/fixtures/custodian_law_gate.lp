% Who can hold an act by citing a law (P1.7, P1.3, P1.20), and for how long.
% h holds ch and a holds ca; the seat ce is empty; xs is no seat at all. The
% review ceiling is 10; it is now 30.

now(30).
param(law_review_ceiling, 10). param(veto_window, 50). param(veto_ceiling, 10). param(veto_per_act, 5).
root_grant(m0). mandate(m0, h, s). issued(m0, 0). carries_seat(m0, ch). admitted(m0).
root_grant(m1). mandate(m1, a, s). issued(m1, 0). carries_seat(m1, ca). admitted(m1).
custodian_seat(ch). custodian_seat(ca). custodian_seat(ce).
% unsigned
passed_channel(q1). matter_of(q1, x1). veto(ca, q1, 25). veto_cites_law(ca, q1, l1). law_breach_found(q1, l1).
% by an empty seat, and by no seat
passed_channel(q2). matter_of(q2, x2). veto(ce, q2, 25). veto_signed(ce, q2). veto_cites_law(ce, q2, l2).
passed_channel(q3). matter_of(q3, x3). veto(xs, q3, 25). veto_signed(xs, q3). veto_cites_law(xs, q3, l3).
% against its own replacement
passed_channel(q4). matter_of(q4, x4). replaces_seat(q4, ca, n9).
veto(ca, q4, 25). veto_signed(ca, q4). veto_cites_law(ca, q4, l4).
% against an owed act
passed_channel(q5). matter_of(q5, x5). owed_act(q5). veto(ca, q5, 25). veto_signed(ca, q5). veto_cites_law(ca, q5, l5).
% valid and pending within the ceiling: held
passed_channel(q6). matter_of(q6, x6). veto(ca, q6, 25). veto_signed(ca, q6). veto_cites_law(ca, q6, l6).
% valid, pending past the ceiling: no longer held
passed_channel(q7). matter_of(q7, x7). veto(ch, q7, 12). veto_signed(ch, q7). veto_cites_law(ch, q7, l7).
% valid, the review found the breach: held past the ceiling
passed_channel(q8). matter_of(q8, x8). veto(ch, q8, 12). veto_signed(ch, q8). veto_cites_law(ch, q8, l8).
law_breach_found(q8, l8).
decided_seq(q1, 25). decided_seq(q2, 25). decided_seq(q3, 25). decided_seq(q4, 25). decided_seq(q5, 25).
decided_seq(q6, 25). decided_seq(q7, 12). decided_seq(q8, 13).

% EXPECT-NOT[P1.7]: law_hold(q1)
% EXPECT-NOT[P1.7]: law_hold(q2)
% EXPECT-NOT[P1.7]: law_hold(q3)
% EXPECT-NOT[P1.7]: law_hold(q4)
% EXPECT-NOT[P1.7]: law_hold(q5)
% EXPECT[P1.7]: law_hold(q6)
% EXPECT[P1.7]: law_review_lapsed(q7,l7)
% EXPECT-NOT[P1.7]: law_hold(q7)
% EXPECT[P1.7]: law_hold(q8)
% EXPECT[P1.7]: custodian_passes(q1)
% EXPECT[P1.20]: custodian_passes(q4)
% EXPECT[P1.8]: standing_veto(ch,q7)
% EXPECT-NOT[P1.7]: custodian_passes(q6)
% EXPECT-NOT[P1.7]: custodian_passes(q8)
