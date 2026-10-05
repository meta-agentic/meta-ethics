% Signature compromise (S1.10), contact with a drawn judge (C17.7, C21.5),
% owed acts on one's own matter (C14.4), display of findings (A2.13),
% windows and their one extension (H1.5), and the genesis regime's marking
% (H3.3).

% clause: S1.10
witnessed_between(Sig, R) :- signature(Sig, P, _, Ts), reports_compromise(R, P, Tr),
                             witnessed_head(_, Th), Ts <= Th, Th < Tr.
void_signature(Sig) :- signature(Sig, P, _, _), reports_compromise(R, P, _),
                       not witnessed_between(Sig, R).

% clause: C17.7
lobbying(C, P) :- contact(C, P, J, Q), drawn_judge(Q, J).

% clause: C21.5
unentered_contact(C, J) :- contact(C, _, J, Q), drawn_judge(Q, J), not contact_entered(C).

% clause: C14.4
owes(P, A) :- duty_on(A, Q, P), not recused(P, Q).

% clause: A2.13
possible_subjects(F, N) :- finding(F, _, _), N = #count{ P : could_be_subject(F, P) }.
shown_to_others(F) :- possible_subjects(F, N), param(display_threshold, K), N >= K.
sees_in_full(P, F) :- finding(F, P, _).
sees_in_full(C, F) :- closure(K, F), act(K, C, _, _).

% clause: H1.5
extended(P, Q) :- extension_requested(P, Q, _).

% clause: H2.3
awaiting_render(P, Q) :- human_language_filing(P, Q), not rendered(P, Q).

% clause: S1.12
means_pending(P) :- reports_compromise(R, P, _), not new_means_admitted(R).
window_suspended(P, Q) :- requires_signature(Q, P), means_pending(P).

% clause: H1.5 H2.3 S1.12
window_runs(P, Q) :- window_opens(P, Q, _), not awaiting_render(P, Q), not window_suspended(P, Q).
due(P, Q, E) :- window_opens(P, Q, T), window_runs(P, Q), param(answer_window, W), not extended(P, Q), E = T + W.
due(P, Q, E) :- window_opens(P, Q, T), window_runs(P, Q), param(answer_window, W), extended(P, Q),
                param(extension_amount, X), E = T + W + X.

% clause: H3.3
regime_exited :- regime_exit(T), now(N), T <= N.
exit_before(A) :- power_at(A, T), regime_exit(E), E <= T.
marked_regime(A) :- power_at(A, _), not exit_before(A).
founder_finding_held(F) :- finding(F, P, _), founder(P), not regime_exited.

% clause: A1.5
delivery_owed(F, P) :- finding(F, P, _), not delivered_to_subject(F).
may_answer(P, F) :- finding(F, P, _).

% clause: A2.7 P3.7
interim_active(I) :- interim(I, F, T), finding(F, _, _), now(N), param(interim_ceiling, C), N - T < C,
                     not instance_ended.

% clause: H3.8
unratified(A) :- marked_regime(A), regime_exit(E), now(N), param(ratification_window, W), N - E >= W,
                 not ratified_act(A), not refused_act(A).
refusal_finding(A) :- marked_regime(A), refused_act(A).

% clause: A2.2
anonymization_breach(E) :- anonymized(E, _), power_entry(E).
anonymization_breach(E) :- anonymized(E, _), not law_requires(E).

% clause: A2.10
anonymization_premature(E) :- anonymized(E, P), finding(F, P, _), open(F), not instance_ended.
anonymization_untold(E) :- anonymized(E, _), not told_before(E).

% clause: A2.14
unlogged_read(D, P) :- read_shown(D, P, F), not read_of(D, P, F).
visible_read(S, D, P) :- read_of(D, P, F), finding(F, S, _).
