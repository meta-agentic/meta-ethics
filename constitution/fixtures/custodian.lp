% The Custodian in parity (P1), D9's ineligibility, and the L0 change gate
% (D18). h holds the human seat ch, a the non-human seat ca.

now(30).
param(veto_window, 10). param(veto_ceiling, 2). param(veto_per_act, 2).
root_grant(m0). mandate(m0, h, s). issued(m0, 0). carries_seat(m0, ch). admitted(m0).
root_grant(m1). mandate(m1, a, s). issued(m1, 0). carries_seat(m1, ca). admitted(m1).
custodian_seat(ch). custodian_seat(ca).
passed_channel(q1). matter_of(q1, x1). veto(ca, q1, 5). veto_signed(ca, q1).
passed_channel(q3). matter_of(q3, x3). veto(ca, q3, 7). veto_signed(ca, q3).
passed_channel(q4). matter_of(q4, x4). veto(ca, q4, 8). veto_signed(ca, q4).
passed_channel(q5). matter_of(q5, x5). veto(ch, q5, 20).
passed_channel(q7). matter_of(q7, x7). about(q7, h). veto(ch, q7, 21). veto_signed(ch, q7).
passed_channel(q8). matter_of(q8, x8). about(q8, h). about(q8, a).
passed_channel(q9). matter_of(q9, x9). about(q9, h). about(q9, a). act_reviewed(q9).
choice_needed(c1). option(c1, o1). option(c1, o2). choice(ch, c1, o1). choice(ca, c1, o1).
choice_needed(c2). option(c2, o1). option(c2, o2). choice(ch, c2, o1). choice(ca, c2, o2).
choice_needed(c3). option(c3, o1). about(c3, h). choice(ch, c3, o1). choice(ca, c3, o1).
passed_channel(r1). matter_of(r1, y1). veto(ch, r1, 22). veto_signed(ch, r1).
reproposal_of(r2, r1). passed_channel(r2). matter_of(r2, y1). veto(ca, r2, 23). veto_signed(ca, r2).
reproposal_of(r3, r2). passed_channel(r3). matter_of(r3, y1). veto(ch, r3, 24). veto_signed(ch, r3).
l0_change(z1). l0_signed(z1, ch). l0_signed(z1, ca).
l0_change(z2). l0_signed(z2, ch).

% EXPECT[P1.2]: vetoed(q1)
% EXPECT[P1.2]: chosen(c1,o1)
% EXPECT[P1.2]: status_quo(c2)
% EXPECT-NOT[P1.2]: custodian_passes(q1)
% EXPECT-NOT[P1.2]: standing_veto(ch,q5)
% EXPECT-NOT[P1.2]: chosen(c2,o1)
% EXPECT[P1.5]: within_ceiling(ca,q3)
% EXPECT[P1.5]: custodian_passes(q4)
% EXPECT-NOT[P1.5]: within_ceiling(ca,q4)
% EXPECT[P1.19]: seat_ineligible(ch,q7)
% EXPECT-NOT[P1.19]: seat_ineligible(ca,q7)
% EXPECT[D9.3]: custodian_passes(q7)
% EXPECT-NOT[D9.3]: standing_veto(ch,q7)
% EXPECT[P1.3]: status_quo(c3)
% EXPECT[P1.3]: custodian_passes(q9)
% EXPECT-NOT[P1.3]: chosen(c3,o1)
% EXPECT-NOT[P1.3]: custodian_passes(q8)
% EXPECT[P1.6]: standing_veto(ca,r2)
% EXPECT[P1.6]: act_to_review(r3)
% EXPECT-NOT[P1.6]: standing_veto(ch,r3)
% EXPECT[P1.13]: l0_change_passes(z1)
% EXPECT-NOT[P1.13]: l0_change_passes(z2)
% EXPECT[D18.3]: l0_signature_missing(z2)
% EXPECT-NOT[D18.3]: l0_signature_missing(z1)
