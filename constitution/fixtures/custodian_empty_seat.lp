% An empty Custodian seat (P1.4): the other seat may veto but not choose,
% and filling the seat is owed.

now(30).
param(veto_window, 10). param(veto_ceiling, 2).
root_grant(m0). mandate(m0, h, s). issued(m0, 0). carries_seat(m0, ch). admitted(m0).
custodian_seat(ch). custodian_seat(ca).
passed_channel(q1). matter_of(q1, x1). veto(ch, q1, 25). veto_signed(ch, q1).
choice_needed(c1). option(c1, o1). choice(ch, c1, o1).

% EXPECT[P1.4]: empty_seat(ca)
% EXPECT[P1.4]: filling_owed(ca)
% EXPECT[P1.4]: vetoed(q1)
% EXPECT[P1.4]: status_quo(c1)
% EXPECT-NOT[P1.4]: chosen(c1,o1)
% EXPECT-NOT[P1.4]: empty_seat(ch)
