% A law-citing veto as P1.7 and P1.8 read today (the reviewed rule is
% proposed, LV). h holds ch, a holds ca; ce is an empty seat, xs no seat.
% A valid citation holds its act while the review is pending, however long,
% and when the review finds the breach; it names the human whose right it
% cites, and that party must be human. A consequence arises from an act only
% while the act passes: a verdict, finding, interim measure, duty or applied
% consequence arising from a held act is withheld, from every human.

now(1000).
param(veto_window, 50). param(veto_ceiling, 10). param(veto_per_act, 5).
param(contest_window, 5). param(citation_period, 5000). param(interim_ceiling, 5000).
root_grant(m0). mandate(m0, h, s). issued(m0, 0). kind_of(h, human). carries_seat(m0, ch). admitted(m0).
root_grant(m1). mandate(m1, a, s). issued(m1, 0). kind_of(a, nonhuman). carries_seat(m1, ca). admitted(m1).
root_grant(m2). mandate(m2, h1, s). issued(m2, 0). kind_of(h1, human).
root_grant(m3). mandate(m3, h3, s). issued(m3, 0). kind_of(h3, human).
root_grant(m4). mandate(m4, r2, s). issued(m4, 0). kind_of(r2, human).
root_grant(m5). mandate(m5, n9, s). issued(m5, 0). kind_of(n9, nonhuman).
custodian_seat(ch). custodian_seat(ca). custodian_seat(ce).
regime_exit(1).
% invalid citations: unsigned, by an empty seat, by no seat, against the
% seat's own replacement, against an owed act, naming no human, naming a
% class only, naming a party that is not human
passed_channel(q1). matter_of(q1, x1). veto(ca, q1, 900). veto_cites_law(ca, q1, l1). cites_right_of(q1, l1, h1).
passed_channel(q2). matter_of(q2, x2). veto(ce, q2, 900). veto_signed(ce, q2). veto_cites_law(ce, q2, l2). cites_right_of(q2, l2, h1).
passed_channel(q3). matter_of(q3, x3). veto(xs, q3, 900). veto_signed(xs, q3). veto_cites_law(xs, q3, l3). cites_right_of(q3, l3, h1).
passed_channel(q4). matter_of(q4, x4). replaces_seat(q4, ca, n8). veto(ca, q4, 900). veto_signed(ca, q4).
veto_cites_law(ca, q4, l4). cites_right_of(q4, l4, h1).
passed_channel(q5). matter_of(q5, x5). owed_act(q5). veto(ca, q5, 900). veto_signed(ca, q5). veto_cites_law(ca, q5, l5).
cites_right_of(q5, l5, h1).
passed_channel(q12). matter_of(q12, x12). veto(ca, q12, 900). veto_signed(ca, q12). veto_cites_law(ca, q12, l12).
passed_channel(q13). matter_of(q13, x13). veto(ca, q13, 900). veto_signed(ca, q13). veto_cites_law(ca, q13, l13).
cites_class(q13, l13, tenants).
passed_channel(q14). matter_of(q14, x14). veto(ca, q14, 900). veto_signed(ca, q14). veto_cites_law(ca, q14, l14).
cites_right_of(q14, l14, n9).
% a citation naming no one leaves a veto with no law citation: it stands and counts
% valid, pending since 10: held at 1000, with no ceiling on the hold
passed_channel(q6). matter_of(q6, x6). veto(ch, q6, 10). veto_signed(ch, q6). veto_cites_law(ch, q6, l6).
cites_right_of(q6, l6, h1).
% valid, breach found: held, and not counted
passed_channel(q7). matter_of(q7, x7). veto(ch, q7, 11). veto_signed(ch, q7). veto_cites_law(ch, q7, l7).
cites_right_of(q7, l7, h1). law_breach_found(q7, l7).
% valid, found unfounded: not held, and counted
passed_channel(q8). matter_of(q8, x8). veto(ca, q8, 12). veto_signed(ca, q8). veto_cites_law(ca, q8, l8).
cites_right_of(q8, l8, h1). law_unfounded(q8, l8).
% re-proposals: re-citing the unfounded law holds nothing and counts; re-citing
% the breached law holds and does not count; a pending citation counts (P1.5)
reproposal_of(q9, q8). passed_channel(q9). matter_of(q9, x8). veto(ch, q9, 13). veto_signed(ch, q9).
veto_cites_law(ch, q9, l8). cites_right_of(q9, l8, h1).
reproposal_of(q10, q7). passed_channel(q10). matter_of(q10, x7). veto(ca, q10, 14). veto_signed(ca, q10).
veto_cites_law(ca, q10, l7). cites_right_of(q10, l7, h1).
% on a re-proposal of q8, ca's veto citing a new law, still pending, counts;
% an unrelated act citing the unfounded law is held
reproposal_of(q11, q8). passed_channel(q11). matter_of(q11, x8).
veto(ca, q11, 15). veto_signed(ca, q11). veto_cites_law(ca, q11, l11). cites_right_of(q11, l11, h1).
veto(ch, q11, 16). veto_signed(ch, q11). veto_cites_law(ch, q11, l8).
passed_channel(q16). matter_of(q16, x16). veto(ch, q16, 17). veto_signed(ch, q16). veto_cites_law(ch, q16, l8).
cites_right_of(q16, l8, h1).
decided_seq(q11, 15). decided_seq(q16, 17).
% a protection that lapsed into force, but arises from a held act
param(conflict_ceiling, 5).
candidate(shield, h3). candidate(fine3, h3). conflicts(fine3, shield). protection(shield).
conflict_filed(shield, h3, 1). candidate_from_act(shield, h3, q6).
% a veto on q7 by another seat, with no law citation, counts though ch's law was found
% breached; a citation of l7 on an unrelated act counts too
veto(ca, q7, 18). veto_signed(ca, q7).
passed_channel(q17). matter_of(q17, x17). veto(ch, q17, 19). veto_signed(ch, q17). veto_cites_law(ch, q17, l7).
cites_right_of(q17, l7, h1). decided_seq(q17, 19).
% an act no one vetoed, which passes
passed_channel(q15). matter_of(q15, x15).
% consequences arising from the held q6 and q7, and from the passing q15
verdict(v1, h1, 20). verdict_from_act(v1, q6). bears_consequence(v1). consequence_on(v1, h1). filed_by(v1, a).
verdict_delivered(v1, 20). drawn_reviewer(v1, r2). reviewed(v1, r2).
verdict(v3, h3, 20). verdict_from_act(v3, q7). bears_consequence(v3). consequence_on(v3, h3). filed_by(v3, a).
verdict_delivered(v3, 20). drawn_reviewer(v3, r2). reviewed(v3, r2).
verdict(v4, h3, 20). verdict_from_act(v4, q15). bears_consequence(v4). consequence_on(v4, h3). filed_by(v4, a).
verdict_delivered(v4, 20). drawn_reviewer(v4, r2). reviewed(v4, r2).
finding(g1, h1, 20). finding_from_act(g1, q6). interim(i1, g1, 900).
finding(g2, h3, 20). finding_from_act(g2, q15).
duty_on(u1, x9, h1). duty_from_act(u1, q7).
duty_on(u2, x9, h3). duty_from_act(u2, q15).
candidate(fine, h1). candidate_from_act(fine, h1, q6).
candidate(warn, h3). candidate_from_act(warn, h3, q15).
decided_seq(q1, 900). decided_seq(q2, 900). decided_seq(q3, 900). decided_seq(q4, 900). decided_seq(q5, 900).
decided_seq(q12, 900). decided_seq(q13, 900). decided_seq(q14, 900).
decided_seq(q6, 10). decided_seq(q7, 11). decided_seq(q8, 12). decided_seq(q9, 13). decided_seq(q10, 14).

% EXPECT-NOT[P1.7]: law_hold(q1)
% EXPECT-NOT[P1.7]: law_hold(q2)
% EXPECT-NOT[P1.7]: law_hold(q3)
% EXPECT-NOT[P1.7]: law_hold(q4)
% EXPECT-NOT[P1.7]: law_hold(q5)
% EXPECT-NOT[P1.7]: law_hold(q12)
% EXPECT-NOT[P1.7]: law_hold(q13)
% EXPECT-NOT[P1.7]: valid_law_veto(ca,q14,l14)
% EXPECT[P1.7]: nonhuman_named(q14,l14)
% EXPECT[P1.7]: valid_law_veto(ch,q6,l6)
% EXPECT[P1.7]: law_hold(q6)
% EXPECT[P1.7]: law_hold(q7)
% EXPECT-NOT[P1.7]: law_hold(q8)
% EXPECT-NOT[P1.7]: law_hold(q9)
% EXPECT[P1.7]: law_hold(q10)
% EXPECT-NOT[P1.7]: custodian_passes(q6)
% EXPECT[P1.7]: custodian_passes(q15)
% EXPECT-NOT[P1.7]: custodian_passes(q12)
% EXPECT[P1.8]: counted_veto(ch,q6,10)
% EXPECT-NOT[P1.8]: counted_veto(ch,q7,11)
% EXPECT[P1.8]: counted_veto(ca,q8,12)
% EXPECT[P1.8]: counted_veto(ch,q9,13)
% EXPECT-NOT[P1.8]: counted_veto(ca,q10,14)
% EXPECT[P1.8]: counted_veto(ca,q12,900)
% EXPECT[P1.7]: act_not_effective(q6)
% EXPECT-NOT[P1.7]: act_not_effective(q15)
% EXPECT-NOT[P1.7]: takes_effect(v1)
% EXPECT-NOT[P1.7]: takes_effect(v3)
% EXPECT[P1.7]: takes_effect(v4)
% EXPECT-NOT[P1.7]: citable(g1,h1)
% EXPECT-NOT[P1.7]: interim_active(i1)
% EXPECT[P1.7]: citable(g2,h3)
% EXPECT-NOT[P1.7]: owes(h1,u1)
% EXPECT[P1.7]: owes(h3,u2)
% EXPECT-NOT[P1.7]: applied(fine,h1)
% EXPECT[P1.7]: applied(warn,h3)
% EXPECT[P1.8]: counted_veto(ca,q11,15)
% EXPECT-NOT[P1.7]: valid_law_veto(ch,q11,l11)
% EXPECT[P1.7]: law_hold(q16)
% EXPECT-NOT[P1.7]: applied(shield,h3)
% EXPECT[P1.8]: counted_veto(ca,q7,18)
% EXPECT[P1.8]: counted_veto(ch,q17,19)
