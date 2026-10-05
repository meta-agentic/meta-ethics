% Signature compromise (S1.10), contact with the drawn judge (C17.7, C21.5),
% owed acts (C14.4), display (A2.13), windows (H1.5), the genesis regime
% (H3.3). f is the founder; the regime ends at 15.

now(20).
param(display_threshold, 3). param(answer_window, 5). param(extension_amount, 4).
root_grant(m0). mandate(m0, f, s). issued(m0, 0). founder(f).
root_grant(m1). mandate(m1, a, s). issued(m1, 0).
root_grant(m2). mandate(m2, b, s). issued(m2, 0).
root_grant(m3). mandate(m3, c, s). issued(m3, 0).
root_grant(m4). mandate(m4, j, s). issued(m4, 0).

witnessed_head(h1, 10). witnessed_head(h2, 14).
signature(s1, a, r1, 8). reports_compromise(k1, a, 12).
signature(s2, b, r1, 11). reports_compromise(k2, b, 13).
signature(s3, c, r1, 16). reports_compromise(k3, c, 15).

drawn_judge(q1, j).
contact(t1, a, j, q1).
contact(t2, b, j, q1). contact_entered(t2).
contact(t3, c, a, q1).

finding(g1, b, 5). cites(g1, q2). matter(q2). base(q2, b). base(q2, c).
duty_on(u1, q2, b). duty_on(u2, q2, c).
could_be_subject(g1, a). could_be_subject(g1, b). could_be_subject(g1, c).
finding(g2, c, 6). could_be_subject(g2, c). could_be_subject(g2, a).
closure(k9, g2). act(k9, a, close, 7).

window_opens(a, q3, 10). extension_requested(a, q3, 12). extension_requested(a, q3, 13).
window_opens(b, q3, 10).

param(interim_ceiling, 6).
delivered_to_subject(g2).
interim(i1, g1, 16). interim(i2, g2, 10).
regime_exit(15).
param(ratification_window, 3).
power_at(w3, 12). ratified_act(w3).
power_at(w4, 13). refused_act(w4).
window_opens(c, q4, 10). human_language_filing(c, q4).
window_opens(c, q5, 10). human_language_filing(c, q5). rendered(c, q5).
window_opens(d, q6, 10). requires_signature(q6, d). reports_compromise(k4, d, 9).
window_opens(d, q7, 10).
root_grant(m5). mandate(m5, d, s). issued(m5, 0).
window_opens(a, q8, 10). requires_signature(q8, a). new_means_admitted(k1).
kind_of(a, human). kind_of(b, human). kind_of(c, nonhuman). kind_of(d, human).
anonymized(e1, a). law_requires(e1). told_before(e1).
anonymized(e2, a). power_entry(e2). law_requires(e2). told_before(e2).
anonymized(e3, a).
anonymized(e4, b). law_requires(e4).
anonymized(e5, c). law_requires(e5). told_before(e5).
read_of(rd1, c, g1).
finding(g5, a, 6). closure(k5, g5). witnessed_by(k5, c). discharges(k5, g5).
power_entry(e9).
extension_requested(c, q4, 11). read_shown(rd1, c, g1). read_shown(rd2, a, g1).
power_at(w1, 9). power_at(w2, 16).
finding(g3, f, 4). closure(k3x, g3). witnessed_by(k3x, c). discharges(k3x, g3).

% EXPECT[A1.5]: delivery_owed(g1,b)
% EXPECT[A1.5]: may_answer(c,g2)
% EXPECT-NOT[A1.5]: delivery_owed(g2,c)
% EXPECT[A2.7]: interim_active(i1)
% EXPECT-NOT[A2.7]: interim_active(i2)
% EXPECT[H2.3]: due(c,q5,15)
% EXPECT[H2.3]: awaiting_render(c,q4)
% EXPECT-NOT[H2.3]: due(c,q4,15)
% EXPECT[S1.12]: due(d,q7,15)
% EXPECT[S1.12]: due(a,q8,15)
% EXPECT-NOT[S1.12]: due(d,q6,15)
% EXPECT[H3.8]: unratified(w1)
% EXPECT[H3.8]: refusal_finding(w4)
% EXPECT-NOT[H3.8]: unratified(w3)
% EXPECT-NOT[H3.8]: unratified(w4)
% EXPECT[A2.2]: anonymization_breach(e2)
% EXPECT[A2.2]: anonymization_breach(e3)
% EXPECT-NOT[A2.2]: anonymization_breach(e1)
% EXPECT[A2.10]: anonymization_premature(e4)
% EXPECT[A2.10]: anonymization_untold(e4)
% EXPECT-NOT[A2.10]: anonymization_premature(e1)
% EXPECT-NOT[A2.10]: anonymization_untold(e1)
% EXPECT[A2.17]: anonymization_breach_kind(e5)
% EXPECT-NOT[A2.17]: anonymization_breach_kind(e1)
% EXPECT[A2.14]: unlogged_read(rd2,a)
% EXPECT[A2.14]: visible_read(b,rd1,c)
% EXPECT-NOT[A2.14]: unlogged_read(rd1,c)
% EXPECT-NOT[C21.5]: unentered_contact(t3,a)
% EXPECT-NOT[A2.2]: anonymization_breach(e9)
% EXPECT-NOT[H1.5]: due(a,q3,15)
% EXPECT-NOT[H1.5]: due(b,q3,19)
% EXPECT-NOT[H2.3]: due(c,q4,19)
% EXPECT[S1.10]: void_signature(s2)
% EXPECT[S1.10]: void_signature(s3)
% EXPECT-NOT[S1.10]: void_signature(s1)
% EXPECT[C17.7]: lobbying(t1,a)
% EXPECT-NOT[C17.7]: lobbying(t3,c)
% EXPECT[C21.5]: unentered_contact(t1,j)
% EXPECT-NOT[C21.5]: unentered_contact(t2,j)
% EXPECT[C14.4]: owes(c,u2)
% EXPECT-NOT[C14.4]: owes(b,u1)
% EXPECT[A2.13]: shown_to_others(g1)
% EXPECT[A2.13]: sees_in_full(a,g2)
% EXPECT[A2.13]: sees_in_full(b,g1)
% EXPECT-NOT[A2.13]: shown_to_others(g2)
% EXPECT-NOT[A2.13]: sees_in_full(b,g2)
% EXPECT[H1.5]: due(a,q3,19)
% EXPECT[H1.5]: due(b,q3,15)
% EXPECT-NOT[H1.5]: due(a,q3,23)
% EXPECT[H3.3]: marked_regime(w1)
% EXPECT[H3.3]: valid_closure(g3)
% EXPECT-NOT[H3.3]: marked_regime(w2)
