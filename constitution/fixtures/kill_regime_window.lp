% Ratification at exit (H3.8): the window has not passed, and a refusal of an
% act after the regime is no refusal finding.

now(20).
param(ratification_window, 5).
regime_exit(18).
power_at(w1, 10).
power_at(w2, 19). refused_act(w2).

% EXPECT[H3.3]: marked_regime(w1)
% EXPECT-NOT[H3.8]: unratified(w1)
% EXPECT-NOT[H3.8]: refusal_finding(w2)
% EXPECT-NOT[H3.8]: refusal_finding(w1)
