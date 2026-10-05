% Five windows under the genesis regime (P1.7, P1.8, P1.5): the formal
% review's case. The founder f's seat ch may veto one matter per window of
% five decided proposals, and vetoes five acts, one per window, each citing a
% law as to a human's right. No review decides; it is now long past the
% review's ceiling. The law hold does not outlast that ceiling for a
% reversible act: p1, p3 and p5 are no longer law-held, their consequences
% are withheld from the humans their citations name, and their reviews are
% drawn again; each still meets ch's veto, which stands within the seat's
% ceiling and does not expire (P1.2, P1.5). The irreversible p2 and p4 stay
% held until their reviews decide, which under the genesis regime is H3's
% declared genesis cost, marked.

now(1000).
param(law_review_ceiling, 10). param(veto_window, 5). param(veto_ceiling, 1). param(veto_per_act, 5).
root_grant(m0). mandate(m0, f, s). issued(m0, 0). founder(f). carries_seat(m0, ch). admitted(m0).
root_grant(m1). mandate(m1, a, s). issued(m1, 0). carries_seat(m1, ca). admitted(m1).
custodian_seat(ch). custodian_seat(ca).
passed_channel(p1). matter_of(p1, y1). veto(ch, p1, 1). veto_signed(ch, p1). veto_cites_law(ch, p1, l1). cites_right_of(p1, l1, h1).
passed_channel(p2). matter_of(p2, y2). veto(ch, p2, 6). veto_signed(ch, p2). veto_cites_law(ch, p2, l2). cites_right_of(p2, l2, h2).
irreversible_effect(p2).
passed_channel(p3). matter_of(p3, y3). veto(ch, p3, 11). veto_signed(ch, p3). veto_cites_law(ch, p3, l3). cites_right_of(p3, l3, h3).
passed_channel(p4). matter_of(p4, y4). veto(ch, p4, 16). veto_signed(ch, p4). veto_cites_law(ch, p4, l4). cites_right_of(p4, l4, h4).
irreversible_effect(p4).
passed_channel(p5). matter_of(p5, y5). veto(ch, p5, 21). veto_signed(ch, p5). veto_cites_law(ch, p5, l5). cites_right_of(p5, l5, h5).
% p6: irreversible, its review not yet past its ceiling: held, not yet marked
passed_channel(p6). matter_of(p6, y6). veto(ch, p6, 995). veto_signed(ch, p6). veto_cites_law(ch, p6, l6).
cites_right_of(p6, l6, h6). irreversible_effect(p6). decided_seq(p6, 995).
decided_seq(p1, 1). decided_seq(p2, 6). decided_seq(p3, 11). decided_seq(p4, 16). decided_seq(p5, 21).

% EXPECT[P1.8]: within_ceiling(ch,p5)
% EXPECT-NOT[P1.7]: law_hold(p1)
% EXPECT-NOT[P1.7]: law_hold(p3)
% EXPECT-NOT[P1.7]: law_hold(p5)
% EXPECT[P1.7]: protection_mode(p1,l1)
% EXPECT[P1.7]: consequence_withheld(p3,h3)
% EXPECT[P1.7]: consequence_withheld(p5,h5)
% EXPECT[P1.7]: law_review_redrawn(p1,l1)
% EXPECT[P1.5]: standing_veto(ch,p1)
% EXPECT[P1.7]: law_hold(p2)
% EXPECT[P1.7]: law_hold(p4)
% EXPECT[P1.7]: genesis_cost_hold(p2)
% EXPECT[P1.7]: genesis_cost_hold(p4)
% EXPECT-NOT[P1.7]: genesis_cost_hold(p1)
% EXPECT-NOT[P1.7]: consequence_withheld(p2,h2)
% EXPECT[P1.7]: counts_toward_d2(p4)
% EXPECT[P1.7]: law_hold(p6)
% EXPECT-NOT[P1.7]: genesis_cost_hold(p6)
