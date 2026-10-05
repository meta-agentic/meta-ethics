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
due(P, Q, E) :- window_opens(P, Q, T), param(answer_window, W), not extended(P, Q), E = T + W.
due(P, Q, E) :- window_opens(P, Q, T), param(answer_window, W), extended(P, Q),
                param(extension_amount, X), E = T + W + X.

% clause: H3.3
regime_exited :- regime_exit(T), now(N), T <= N.
exit_before(A) :- power_at(A, T), regime_exit(E), E <= T.
marked_regime(A) :- power_at(A, _), not exit_before(A).
founder_finding_held(F) :- finding(F, P, _), founder(P), not regime_exited.

% clause: A1.5
delivery_owed(F, P) :- finding(F, P, _), not delivered_to_subject(F).
may_answer(P, F) :- finding(F, P, _).

% clause: A2.7
interim_active(I) :- interim(I, F, T), finding(F, _, _), now(N), param(interim_ceiling, C), N - T < C.
