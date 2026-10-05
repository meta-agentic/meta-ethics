% The residual the program in force carries (P1.5, P1.7, P1.8). Under the
% genesis regime the founder f's seat, with a ceiling of one veto per window
% of five decided proposals, vetoes five acts, one per window, each citing a
% law; no review decides. Each veto counts toward the seat's ceilings, but the
% act stays held while its review is pending, with no ceiling on that hold:
% the founder's ruling that no seat holder may block for ever is met only by
% the proposed LV, which bounds the hold without passing an act against a
% human's right.

now(1000).
param(veto_window, 5). param(veto_ceiling, 1). param(veto_per_act, 5).
root_grant(m0). mandate(m0, f, s). issued(m0, 0). founder(f). kind_of(f, human). carries_seat(m0, ch). admitted(m0).
root_grant(m1). mandate(m1, a, s). issued(m1, 0). kind_of(a, nonhuman). carries_seat(m1, ca). admitted(m1).
root_grant(m2). mandate(m2, h1, s). issued(m2, 0). kind_of(h1, human).
custodian_seat(ch). custodian_seat(ca).
passed_channel(p1). matter_of(p1, y1). veto(ch, p1, 1). veto_signed(ch, p1). veto_cites_law(ch, p1, l1). cites_right_of(p1, l1, h1).
passed_channel(p2). matter_of(p2, y2). veto(ch, p2, 6). veto_signed(ch, p2). veto_cites_law(ch, p2, l2). cites_right_of(p2, l2, h1).
passed_channel(p3). matter_of(p3, y3). veto(ch, p3, 11). veto_signed(ch, p3). veto_cites_law(ch, p3, l3). cites_right_of(p3, l3, h1).
passed_channel(p4). matter_of(p4, y4). veto(ch, p4, 16). veto_signed(ch, p4). veto_cites_law(ch, p4, l4). cites_right_of(p4, l4, h1).
passed_channel(p5). matter_of(p5, y5). veto(ch, p5, 21). veto_signed(ch, p5). veto_cites_law(ch, p5, l5). cites_right_of(p5, l5, h1).
% a sixth veto, with no law citation, in p5's window is beyond the ceiling
passed_channel(p6). matter_of(p6, y6). veto(ch, p6, 22). veto_signed(ch, p6).
decided_seq(p1, 1). decided_seq(p2, 6). decided_seq(p3, 11). decided_seq(p4, 16). decided_seq(p5, 21). decided_seq(p6, 22).

% EXPECT[P1.8]: counted_veto(ch,p1,1)
% EXPECT[P1.8]: counted_veto(ch,p5,21)
% EXPECT-NOT[P1.5]: within_ceiling(ch,p6)
% EXPECT[P1.5]: custodian_passes(p6)
% EXPECT[P1.7]: law_hold(p1)
% EXPECT[P1.7]: law_hold(p3)
% EXPECT[P1.7]: law_hold(p5)
% EXPECT-NOT[P1.7]: custodian_passes(p1)
% EXPECT-NOT[P1.7]: custodian_passes(p5)
