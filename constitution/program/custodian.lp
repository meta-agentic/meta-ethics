% The Custodian in parity (P1), the signer of an L0 change (D18), and the
% ineligibility of a seat on proposals about its holder (D9).

% clause: P1.19 D9.3 P1.3
seat_ineligible(S, Q) :- custodian_seat(S), seat_holder(P, S), about(Q, P).
seat_ineligible(S, Q) :- custodian_seat(S), seat_holder(P, S), matter_of(Q, X), recused(P, X).

% clause: P1.20
seat_ineligible(S, Q) :- custodian_seat(S), replaces_seat(Q, S, _).

% clause: P1.4
seat_filled(S) :- custodian_seat(S), seat_holder(_, S).
empty_seat(S) :- custodian_seat(S), not seat_filled(S).
filling_owed(S) :- empty_seat(S).

% clause: P1.8
% a law-citing veto the review finds founded never counts toward a ceiling;
% one it finds unfounded counts toward both; a veto citing a law already
% reviewed for the act or a re-proposal of it is an ordinary veto and counts,
% unless that review found the law breached
law_citing(S, Q) :- veto_cites_law(S, Q, L), cites_right_of(Q, L, _).
law_unfounded_in_family(Q, L) :- veto_cites_law(_, Q, L), family(Q, R), family(Q2, R), law_unfounded(Q2, L).
counted_veto(S, Q, T) :- veto(S, Q, T), not law_citing(S, Q).
counted_veto(S, Q, T) :- veto(S, Q, T), veto_cites_law(S, Q, L), law_unfounded_in_family(Q, L).

% clause: P1.7 P1.3 P1.20
% a veto that cites a law as to a human party's right: only a filled,
% eligible seat's signed veto, citing the right of a human it names, and
% never against an owed act; the act does not pass while the review is
% pending or finds the breach. Ceilings on that hold, protection of a class
% and irreversible effects are proposed (LV) and run in program/proposed/.
nonhuman_named(Q, L) :- cites_right_of(Q, L, H), kind_of(H, K), K != human.
valid_law_veto(S, Q, L) :- veto_cites_law(S, Q, L), cites_right_of(Q, L, _), not nonhuman_named(Q, L),
                           veto(S, Q, _), veto_signed(S, Q), seat_filled(S), not seat_ineligible(S, Q),
                           not owed_act(Q).
law_hold(Q) :- valid_law_veto(_, Q, L), not law_unfounded_in_family(Q, L).

% clause: P1.7 P1.2
% a consequence arises from an act only while the act passes: a verdict,
% finding or duty arising from an act the channel passed but that does not
% take effect is withheld, from every human it would touch
act_not_effective(Q) :- passed_channel(Q), not custodian_passes(Q).
withheld_verdict(V) :- verdict_from_act(V, Q), act_not_effective(Q).
withheld_finding(F) :- finding_from_act(F, Q), act_not_effective(Q).
withheld_duty(P, A) :- duty_from_act(A, Q), duty_on(A, _, P), act_not_effective(Q).
withheld_candidate(C, P) :- candidate_from_act(C, P, Q), act_not_effective(Q).

% clause: P1.5 P1.8
% the window is counted in decided proposals, as D2's is (decided_seq/2)
vetoes_before(S, Q, N) :- veto(S, Q, _), decided_seq(Q, K), param(veto_window, W),
                          N = #count{ X : counted_veto(S, Q2, _), decided_seq(Q2, K2), matter_of(Q2, X),
                                      K2 < K, K - K2 < W }.
within_ceiling(S, Q) :- vetoes_before(S, Q, N), param(veto_ceiling, C), N < C.

% clause: P1.6
is_reproposal(Q) :- reproposal_of(Q, _).
family(Q, Q) :- passed_channel(Q), not is_reproposal(Q).
family(Q2, R) :- reproposal_of(Q2, Q), family(Q, R).
vetoes_on_act(Q, N) :- veto(_, Q, T), family(Q, R),
                       N = #count{ S2, Q2 : counted_veto(S2, Q2, T2), family(Q2, R), T2 < T }.
within_act_bound(Q) :- vetoes_on_act(Q, N), param(veto_per_act, B), N < B.
act_to_review(Q) :- veto(_, Q, _), not within_act_bound(Q).

% clause: P1.2 P1.3 P1.4 P1.5 P1.6 P1.12
standing_veto(S, Q) :- veto(S, Q, _), veto_signed(S, Q), seat_filled(S),
                       not seat_ineligible(S, Q), within_ceiling(S, Q), within_act_bound(Q),
                       not owed_act(Q).
vetoed(Q) :- standing_veto(_, Q).

% clause: P1.3
eligible_seat(S, Q) :- custodian_seat(S), seat_filled(S), passed_channel(Q), not seat_ineligible(S, Q).
some_eligible_seat(Q) :- eligible_seat(_, Q).

% clause: P1.2 P1.3 P1.7
custodian_passes(Q) :- passed_channel(Q), not vetoed(Q), not law_hold(Q), some_eligible_seat(Q).
custodian_passes(Q) :- passed_channel(Q), not vetoed(Q), not law_hold(Q), not some_eligible_seat(Q),
                       act_reviewed(Q), not stopped_by_review(Q).

% clause: P1.12
custodian_passes(Q) :- passed_channel(Q), owed_act(Q).

% clause: P1.2 P1.3 P1.4 P1.10
seat_choice(S, Q, O) :- choice(S, Q, O), seat_filled(S), not seat_ineligible(S, Q).
dissent(Q, O) :- choice_needed(Q), option(Q, O), custodian_seat(S), not seat_choice(S, Q, O).
chosen(Q, O) :- choice_needed(Q), option(Q, O), not dissent(Q, O).
some_chosen(Q) :- chosen(Q, _).
status_quo(Q) :- choice_needed(Q), not some_chosen(Q), not no_status_quo(Q).

% clause: P1.10
drawn_decides(Q) :- choice_needed(Q), no_status_quo(Q), not some_chosen(Q), choice_since(Q, T),
                    now(N), param(owed_content_ceiling, X), N - T >= X.

% clause: P1.13 D18.3
l0_signature_missing(Q) :- l0_change(Q), custodian_seat(S), not l0_signed(Q, S).
l0_change_passes(Q) :- l0_change(Q), not l0_signature_missing(Q).
