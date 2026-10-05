% Discriminating cases for the Custodian (P1): recusal through a finding,
% owed acts with no eligible seat, review that stops an act, the per-act
% bound with a wide window ceiling, and law citations on other laws.

now(30).
param(law_review_ceiling, 100). param(veto_window, 50). param(veto_ceiling, 10). param(veto_per_act, 1).
root_grant(m0). mandate(m0, h, s). issued(m0, 0). carries_seat(m0, ch). admitted(m0).
root_grant(m1). mandate(m1, a, s). issued(m1, 0). carries_seat(m1, ca). admitted(m1).
root_grant(m2). mandate(m2, z, s). issued(m2, 0).
custodian_seat(ch). custodian_seat(ca).
% a holder named by an open finding citing the matter is recused on it
finding(f1, a, 1). cites(f1, x20).
passed_channel(q20). matter_of(q20, x20). veto(ca, q20, 2). veto_signed(ca, q20).
% a finding about a party who holds no seat recuses no seat
finding(f2, z, 1). cites(f2, x21).
passed_channel(q21). matter_of(q21, x21). veto(ca, q21, 3). veto_signed(ca, q21). about(q21, z).
% an owed act on which both seats are ineligible, unreviewed
passed_channel(q31). matter_of(q31, x31). owed_act(q31). about(q31, h). about(q31, a).
% an owed act the channel has not passed
matter_of(q33, x33). owed_act(q33).
% both seats ineligible: reviewed and stopped
passed_channel(q32). matter_of(q32, x32). about(q32, h). about(q32, a). act_reviewed(q32). stopped_by_review(q32).
% an eligible seat's signed law-citing veto, its review pending
passed_channel(q34). matter_of(q34, x34). about(q34, h).
veto(ca, q34, 4). veto_signed(ca, q34). veto_cites_law(ca, q34, l9).
% the per-act bound: the re-proposal's veto is beyond it
passed_channel(q40). matter_of(q40, x40). veto(ch, q40, 5). veto_signed(ch, q40).
reproposal_of(q41, q40). passed_channel(q41). matter_of(q41, x40). veto(ca, q41, 6). veto_signed(ca, q41).
% a law-citing veto still pending counts, while another law on the act was found unfounded
passed_channel(q42). matter_of(q42, x42). veto(ca, q42, 7). veto_signed(ca, q42).
veto_cites_law(ca, q42, l5). law_unfounded(q42, l6).

% each vetoed act's position among decided proposals
decided_seq(q20, 2). decided_seq(q21, 3). decided_seq(q34, 4). decided_seq(q40, 5). decided_seq(q41, 6). decided_seq(q42, 7).

% EXPECT-NOT[P1.3]: standing_veto(ca,q20)
% EXPECT[P1.3]: custodian_passes(q20)
% EXPECT[P1.3]: standing_veto(ca,q21)
% EXPECT-NOT[P1.3]: custodian_passes(q32)
% EXPECT[P1.12]: custodian_passes(q31)
% EXPECT-NOT[P1.12]: custodian_passes(q33)
% EXPECT[P1.7]: law_hold(q34)
% EXPECT-NOT[P1.7]: custodian_passes(q34)
% EXPECT[P1.6]: act_to_review(q41)
% EXPECT-NOT[P1.6]: standing_veto(ca,q41)
% EXPECT-NOT[P1.6]: act_to_review(q40)
% EXPECT[P1.8]: counted_veto(ca,q42,7)
