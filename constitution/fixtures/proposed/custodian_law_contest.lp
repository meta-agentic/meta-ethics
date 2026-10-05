% Reversibility markings and their contests (LV.1, LV.2, LV.3, LV.4, as
% proposed). Ceiling two units per window; a seat's contest is a unit, as a
% veto is. h holds ch, a holds ca; h1 is the human each citation protects.
% q1: ch cites and contests the reversible marking within its ceilings: held.
% q2: ch's contest and veto on q1 spent its budget, so its contest on q2 does
%     not count: q2 passes, its consequences withheld from h1.
% q3: ca, past its ceilings, cites; h1 contests the marking: held.
% q4: h1's contest was decided, the effect reversible: q4 passes, withheld.
% q5: h9, whom the citation does not protect, contests: nothing.
% q6: h1's contest upheld: held, and the false marking is a finding against
%     its filer.
% q7: the filer declared nothing: held as irreversible.
% q10: the breach was found after the act took effect: held, and reversed
%     forward.

now(40).
param(law_review_ceiling, 100). param(veto_window, 50). param(veto_ceiling, 2). param(veto_per_act, 5).
root_grant(m0). mandate(m0, h, s). issued(m0, 0). kind_of(h, human). carries_seat(m0, ch). admitted(m0).
root_grant(m1). mandate(m1, a, s). issued(m1, 0). kind_of(a, nonhuman). carries_seat(m1, ca). admitted(m1).
root_grant(m2). mandate(m2, h1, s). issued(m2, 0). kind_of(h1, human).
root_grant(m3). mandate(m3, h9, s). issued(m3, 0). kind_of(h9, human).
root_grant(m4). mandate(m4, fz, s). issued(m4, 0). kind_of(fz, human).
custodian_seat(ch). custodian_seat(ca).
regime_exit(1).
passed_channel(q1). matter_of(q1, x1). veto(ch, q1, 10). veto_signed(ch, q1). veto_cites_law(ch, q1, l1).
cites_right_of(q1, l1, h1). reversible_marking(q1). irreversibility_contest(ch, q1).
passed_channel(q2). matter_of(q2, x2). veto(ch, q2, 11). veto_signed(ch, q2). veto_cites_law(ch, q2, l2).
cites_right_of(q2, l2, h1). reversible_marking(q2). irreversibility_contest(ch, q2).
passed_channel(q8). matter_of(q8, x8). veto(ca, q8, 2). veto_signed(ca, q8).
passed_channel(q9). matter_of(q9, x9). veto(ca, q9, 3). veto_signed(ca, q9).
passed_channel(q3). matter_of(q3, x3). veto(ca, q3, 12). veto_signed(ca, q3). veto_cites_law(ca, q3, l3).
cites_right_of(q3, l3, h1). reversible_marking(q3). marking_contest(h1, q3).
passed_channel(q4). matter_of(q4, x4). veto(ca, q4, 13). veto_signed(ca, q4). veto_cites_law(ca, q4, l4).
cites_right_of(q4, l4, h1). reversible_marking(q4). marking_contest(h1, q4). irreversibility_rejected(q4).
passed_channel(q5). matter_of(q5, x5). veto(ca, q5, 14). veto_signed(ca, q5). veto_cites_law(ca, q5, l5).
cites_right_of(q5, l5, h1). reversible_marking(q5). marking_contest(h9, q5).
passed_channel(q6). matter_of(q6, x6). veto(ca, q6, 15). veto_signed(ca, q6). veto_cites_law(ca, q6, l6).
cites_right_of(q6, l6, h1). reversible_marking(q6). marking_contest(h1, q6). irreversibility_upheld(q6).
proposed_by(q6, fz).
passed_channel(q7). matter_of(q7, x7). veto(ca, q7, 16). veto_signed(ca, q7). veto_cites_law(ca, q7, l7).
cites_right_of(q7, l7, h1).
passed_channel(q10). matter_of(q10, x10). veto(ca, q10, 17). veto_signed(ca, q10). veto_cites_law(ca, q10, l10).
cites_right_of(q10, l10, h1). reversible_marking(q10). law_breach_found(q10, l10). took_effect(q10).
proposed_by(q4, fz).
% q11: the citation was found unfounded; h1's contest has nothing to protect
passed_channel(q11). matter_of(q11, x11). veto(ca, q11, 18). veto_signed(ca, q11). veto_cites_law(ca, q11, l11).
cites_right_of(q11, l11, h1). reversible_marking(q11). marking_contest(h1, q11). law_unfounded(q11, l11).
% q12: a breach found, the act never having taken effect; q13: an unsigned
% citation, the breach found after the act took effect; q14: took effect,
% its review pending
passed_channel(q12). matter_of(q12, x12). veto(ca, q12, 19). veto_signed(ca, q12). veto_cites_law(ca, q12, l12).
cites_right_of(q12, l12, h1). reversible_marking(q12). law_breach_found(q12, l12).
passed_channel(q13). matter_of(q13, x13). veto(ca, q13, 20). veto_cites_law(ca, q13, l13).
cites_right_of(q13, l13, h1). reversible_marking(q13). law_breach_found(q13, l13). took_effect(q13).
passed_channel(q14). matter_of(q14, x14). veto(ca, q14, 21). veto_signed(ca, q14). veto_cites_law(ca, q14, l14).
cites_right_of(q14, l14, h1). reversible_marking(q14). took_effect(q14).
decided_seq(q11, 18). decided_seq(q12, 19). decided_seq(q13, 20). decided_seq(q14, 21).
% the C14 ordering under LV: an ordering decides, an undecided pair applies
% neither, a lapsed protection applies unless it arises from a held act
candidate(lo, h9). candidate(hi, h9). conflicts(lo, hi). prevails(hi, lo).
candidate(u1, fz). candidate(u2, fz). conflicts(u1, u2).
param(conflict_ceiling, 5).
candidate(shield, h). candidate(dutyx, h). conflicts(dutyx, shield). protection(shield). conflict_filed(shield, h, 1). conflict_filed(dutyx, h, 1).
candidate(shield2, a). candidate(dutyy, a). conflicts(dutyy, shield2). protection(shield2). conflict_filed(shield2, a, 1).
candidate_from_act(shield2, a, q1).
decided_seq(q8, 2). decided_seq(q9, 3). decided_seq(q1, 10). decided_seq(q2, 11). decided_seq(q3, 12).
decided_seq(q4, 13). decided_seq(q5, 14). decided_seq(q6, 15). decided_seq(q7, 16). decided_seq(q10, 17).
% consequences for the C14 ordering, arising from the passing q2 and the held q1
candidate(fine, h1). candidate_from_act(fine, h1, q2).
candidate(c3, h9). candidate_from_act(c3, h9, q1).
candidate(warn, h9). candidate_from_act(warn, h9, q2).

% EXPECT[LV.2]: pr_contested(q1)
% EXPECT[LV.2]: pr_irreversible(q1)
% EXPECT[LV.2]: pr_law_hold(q1)
% EXPECT-NOT[LV.3]: pr_custodian_passes(q1)
% EXPECT-NOT[LV.5]: pr_within_ceiling(ch,q2)
% EXPECT-NOT[LV.2]: pr_contested(q2)
% EXPECT[LV.3]: pr_custodian_passes(q2)
% EXPECT[LV.3]: pr_consequence_withheld(q2,h1)
% EXPECT[LV.2]: pr_contested(q3)
% EXPECT[LV.2]: pr_law_hold(q3)
% EXPECT-NOT[LV.2]: pr_irreversible(q4)
% EXPECT[LV.3]: pr_custodian_passes(q4)
% EXPECT[LV.3]: pr_consequence_withheld(q4,h1)
% EXPECT-NOT[LV.2]: pr_contested(q5)
% EXPECT[LV.3]: pr_custodian_passes(q5)
% EXPECT[LV.2]: pr_law_hold(q6)
% EXPECT[LV.2]: pr_false_marking(q6,fz)
% EXPECT-NOT[LV.2]: pr_false_marking(q4,fz)
% EXPECT[LV.2]: pr_irreversible(q7)
% EXPECT[LV.2]: pr_law_hold(q7)
% EXPECT[LV.1]: pr_reversed_forward(q10)
% EXPECT-NOT[LV.1]: pr_reversed_forward(q7)
% EXPECT-NOT[LV.3]: pr_custodian_passes(q10)
% EXPECT[LV.4]: pr_irreversible_holds(ch,1)
% EXPECT[LV.4]: pr_irreversible_holds(ca,3)
% EXPECT-NOT[LV.3]: pr_applied(fine,h1)
% EXPECT-NOT[LV.3]: pr_applied(c3,h9)
% EXPECT[LV.3]: pr_applied(warn,h9)
% EXPECT-NOT[LV.2]: pr_contested(q11)
% EXPECT-NOT[LV.1]: pr_reversed_forward(q12)
% EXPECT-NOT[LV.1]: pr_reversed_forward(q13)
% EXPECT-NOT[LV.1]: pr_reversed_forward(q14)
% EXPECT[LV.3]: pr_applied(hi,h9)
% EXPECT-NOT[LV.3]: pr_applied(lo,h9)
% EXPECT-NOT[LV.3]: pr_applied(u1,fz)
% EXPECT[LV.3]: pr_applied(shield,h)
% EXPECT-NOT[LV.3]: pr_applied(dutyx,h)
% EXPECT-NOT[LV.3]: pr_applied(shield2,a)
