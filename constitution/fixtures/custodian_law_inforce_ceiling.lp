% A law-citing veto beyond the seat's ordinary ceiling, as P1.7 reads today:
% the act is held while the review is pending, whatever the seat's budget
% (the bound on that is proposed, LV.2), and every consequence arising from
% it is withheld meanwhile.

now(100).
param(veto_window, 50). param(veto_ceiling, 1). param(veto_per_act, 5).
param(contest_window, 5).
root_grant(m0). mandate(m0, h, s). issued(m0, 0). kind_of(h, human). carries_seat(m0, ch). admitted(m0).
root_grant(m1). mandate(m1, a, s). issued(m1, 0). kind_of(a, nonhuman). carries_seat(m1, ca). admitted(m1).
root_grant(m2). mandate(m2, h1, s). issued(m2, 0). kind_of(h1, human).
root_grant(m4). mandate(m4, r2, s). issued(m4, 0). kind_of(r2, human).
custodian_seat(ch). custodian_seat(ca).
regime_exit(1).
passed_channel(q0). matter_of(q0, x0). veto(ca, q0, 5). veto_signed(ca, q0).
passed_channel(q1). matter_of(q1, x1). veto(ca, q1, 6). veto_signed(ca, q1). veto_cites_law(ca, q1, l1).
cites_right_of(q1, l1, h1).
decided_seq(q0, 5). decided_seq(q1, 6).
verdict(v1, h1, 20). verdict_from_act(v1, q1). bears_consequence(v1). consequence_on(v1, h1). filed_by(v1, h).
verdict_delivered(v1, 20). drawn_reviewer(v1, r2). reviewed(v1, r2).

% EXPECT-NOT[P1.5]: standing_veto(ca,q1)
% EXPECT[P1.7]: law_hold(q1)
% EXPECT-NOT[P1.7]: custodian_passes(q1)
% EXPECT[P1.7]: withheld_verdict(v1)
% EXPECT-NOT[P1.7]: takes_effect(v1)
