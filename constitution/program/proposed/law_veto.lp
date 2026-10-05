% The law-citing veto as reviewed, proposed and pending the founder's
% decision (LV). These rules run only with fixtures/proposed/, beside the
% program in force, which holds a law-citing veto as P1.7 and P1.8 read
% today. They derive their own predicates (pr_*): what passes, what is held
% and what is withheld under the proposal.

% clause: LV.5 LV.1
% every veto counts toward both ceilings unless its law was found breached,
% for the act or a re-proposal of it; such a breach holds the act
law_founded(S, Q) :- veto(S, Q, _), veto_cites_law(S, Q, L), family(Q, R), family(Q2, R),
                     law_breach_found(Q2, L).
law_breach_found_in_family(Q, L) :- veto_cites_law(_, Q, L), family(Q, R), family(Q2, R), law_breach_found(Q2, L).

% clause: LV.5
pr_counted_veto(S, Q, T) :- veto(S, Q, T), not law_founded(S, Q).
pr_vetoes_before(S, Q, N) :- veto(S, Q, _), decided_seq(Q, K), param(veto_window, W),
                             N = #count{ X : pr_counted_veto(S, Q2, _), decided_seq(Q2, K2), matter_of(Q2, X),
                                         K2 < K, K - K2 < W }.
pr_within_ceiling(S, Q) :- pr_vetoes_before(S, Q, N), param(veto_ceiling, C), N < C.
pr_vetoes_on_act(Q, N) :- veto(_, Q, T), family(Q, R),
                          N = #count{ S2, Q2 : pr_counted_veto(S2, Q2, T2), family(Q2, R), T2 < T }.
pr_within_act_bound(Q) :- pr_vetoes_on_act(Q, N), param(veto_per_act, B), N < B.
pr_standing_veto(S, Q) :- veto(S, Q, _), veto_signed(S, Q), seat_filled(S), not seat_ineligible(S, Q),
                          pr_within_ceiling(S, Q), pr_within_act_bound(Q), not owed_act(Q).
pr_vetoed(Q) :- pr_standing_veto(_, Q).

% clause: LV.1
% a citation names the humans, or the class, the right protects
pr_protected_by(Q, L, H) :- cites_right_of(Q, L, H).
pr_protected_by(Q, L, H) :- cites_class(Q, L, C), in_class(H, C).
pr_names_protected(Q, L) :- cites_right_of(Q, L, _).
pr_names_protected(Q, L) :- cites_class(Q, L, _).
pr_valid_law_veto(S, Q, L) :- veto_cites_law(S, Q, L), pr_names_protected(Q, L), not nonhuman_named(Q, L),
                              veto(S, Q, _), veto_signed(S, Q), seat_filled(S), not seat_ineligible(S, Q),
                              not owed_act(Q).
pr_law_hold(Q) :- pr_valid_law_veto(_, Q, L), law_breach_found_in_family(Q, L).
pr_cited_pending(S, Q, L) :- pr_valid_law_veto(S, Q, L), not law_unfounded_in_family(Q, L),
                             not law_breach_found_in_family(Q, L).

% clause: LV.2
% within the seat's ceilings and until the review's ceiling; an irreversible
% effect, declared by the filer at intake, or contested by the citing seat
% within its ceilings and not yet rejected, is held until the review decides
pr_in_ceilings(S, Q) :- pr_valid_law_veto(S, Q, _), pr_within_ceiling(S, Q), pr_within_act_bound(Q).
pr_beyond_ceilings(S, Q) :- pr_valid_law_veto(S, Q, _), not pr_in_ceilings(S, Q).
pr_irreversible(Q) :- irreversible_effect(Q).
pr_contests_before(S, Q, N) :- irreversibility_contest(S, Q), decided_seq(Q, K), param(veto_window, W),
                               N = #count{ Q2 : irreversibility_contest(S, Q2), decided_seq(Q2, K2), K2 < K, K - K2 < W }.
pr_contest_within(S, Q) :- pr_contests_before(S, Q, N), param(veto_ceiling, C), N < C.
pr_irreversible(Q) :- irreversibility_contest(S, Q), pr_valid_law_veto(S, Q, _), pr_contest_within(S, Q),
                      not irreversibility_rejected(Q).
pr_pending_hold(Q, L) :- pr_cited_pending(S, Q, L), pr_in_ceilings(S, Q), not pr_overdue(Q, L),
                         not pr_irreversible(Q).
pr_pending_hold(Q, L) :- pr_cited_pending(_, Q, L), pr_irreversible(Q).
pr_law_hold(Q) :- pr_pending_hold(Q, _).

% clause: LV.4
pr_irreversible_holds(S, N) :- custodian_seat(S),
                               N = #count{ Q : pr_pending_hold(Q, _), pr_irreversible(Q), pr_cited_pending(S, Q, _) }.
pr_overdue(Q, L) :- pr_cited_pending(S, Q, L), veto(S, Q, T), now(N), param(law_review_ceiling, X), N - T >= X.
pr_redrawn(Q, L) :- pr_overdue(Q, L).
pr_counts_toward_d2(Q) :- pr_overdue(Q, _).

% clause: LV.4 H3.11
pr_genesis_cost_hold(Q) :- pr_pending_hold(Q, L), pr_irreversible(Q), pr_overdue(Q, L), not regime_exited.

% clause: LV.3
% otherwise the act may pass, and no consequence of it reaches any human the
% citation protects until the review decides
pr_protection_mode(Q, L) :- pr_cited_pending(S, Q, L), pr_beyond_ceilings(S, Q), not pr_irreversible(Q).
pr_protection_mode(Q, L) :- pr_cited_pending(_, Q, L), pr_overdue(Q, L), not pr_irreversible(Q).
pr_consequence_withheld(Q, H) :- pr_protection_mode(Q, L), pr_protected_by(Q, L, H).

% clause: LV.3 LV.5
pr_custodian_passes(Q) :- passed_channel(Q), not pr_vetoed(Q), not pr_law_hold(Q), some_eligible_seat(Q).
pr_custodian_passes(Q) :- passed_channel(Q), not pr_vetoed(Q), not pr_law_hold(Q), not some_eligible_seat(Q),
                          act_reviewed(Q), not stopped_by_review(Q).
pr_custodian_passes(Q) :- passed_channel(Q), owed_act(Q).
pr_act_not_effective(Q) :- passed_channel(Q), not pr_custodian_passes(Q).
pr_withheld_verdict(V) :- verdict_from_act(V, Q), consequence_on(V, H), pr_consequence_withheld(Q, H).
pr_withheld_verdict(V) :- verdict_from_act(V, Q), pr_act_not_effective(Q).
pr_withheld_finding(F) :- finding_from_act(F, Q), finding(F, H, _), pr_consequence_withheld(Q, H).
pr_withheld_finding(F) :- finding_from_act(F, Q), pr_act_not_effective(Q).
pr_withheld_duty(P, A) :- duty_from_act(A, Q), pr_consequence_withheld(Q, P).
pr_withheld_duty(P, A) :- duty_from_act(A, Q), duty_on(A, _, P), pr_act_not_effective(Q).
pr_takes_effect(V) :- verdict(V, _, _), bears_consequence(V), review_done(V), window_passed(V),
                      not pr_withheld_verdict(V).
pr_citable(F, P) :- finding(F, P, T), now(N), param(citation_period, D), N - T <= D,
                    not closed_in_favour(F), not instance_ended, not pr_withheld_finding(F).
pr_owes(P, A) :- duty_on(A, Q, P), not recused(P, Q), not pr_withheld_duty(P, A).
pr_interim_active(I) :- interim(I, F, T), finding(F, _, _), now(N), param(interim_ceiling, C), N - T < C,
                        not instance_ended, not pr_withheld_finding(F).
