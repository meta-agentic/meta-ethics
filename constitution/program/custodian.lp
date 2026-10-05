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

% clause: P1.7 P1.8
% every veto counts toward both ceilings unless the law it cites was found
% breached, for the act or a re-proposal of it; a review never run, lapsed
% or found unfounded leaves the veto counted
law_founded(S, Q) :- veto(S, Q, _), veto_cites_law(S, Q, L), family(Q, R), family(Q2, R),
                     law_breach_found(Q2, L).
counted_veto(S, Q, T) :- veto(S, Q, T), not law_founded(S, Q).
law_unfounded_in_family(Q, L) :- veto_cites_law(_, Q, L), family(Q, R), family(Q2, R), law_unfounded(Q2, L).

% clause: P1.7 P1.3 P1.20
% only a filled, eligible seat's signed veto citing a law, as to the right of
% a human it names or a class of humans it names, holds the act or protects
% anyone, and never against an owed act
names_protected(Q, L) :- cites_right_of(Q, L, _).
names_protected(Q, L) :- cites_class(Q, L, _).
valid_law_veto(S, Q, L) :- veto_cites_law(S, Q, L), names_protected(Q, L), veto(S, Q, _), veto_signed(S, Q),
                           seat_filled(S), not seat_ineligible(S, Q), not owed_act(Q).
% a breach found for the act or a re-proposal of it holds the act whatever
% the seat's budget and however long; a law already found unfounded gives no
% fresh hold
law_breach_found_in_family(Q, L) :- veto_cites_law(_, Q, L), family(Q, R), family(Q2, R), law_breach_found(Q2, L).
law_hold(Q) :- valid_law_veto(_, Q, L), law_breach_found_in_family(Q, L).
cited_pending(S, Q, L) :- valid_law_veto(S, Q, L), not law_unfounded_in_family(Q, L),
                          not law_breach_found_in_family(Q, L).
in_ceilings(S, Q) :- valid_law_veto(S, Q, _), within_ceiling(S, Q), within_act_bound(Q).
beyond_ceilings(S, Q) :- valid_law_veto(S, Q, _), not in_ceilings(S, Q).
% past the review's ceiling the delay is marked, counts toward D2's measure,
% and the review is drawn again until it decides; no lapse passes the act
law_review_overdue(Q, L) :- cited_pending(S, Q, L), veto(S, Q, T), now(N), param(law_review_ceiling, X), N - T >= X.
law_review_redrawn(Q, L) :- law_review_overdue(Q, L).
counts_toward_d2(Q) :- law_review_overdue(Q, _).
% a pending review holds a reversible act within the seat's ceilings until the
% review's ceiling; an act whose effect could not be withheld or reversed
% forward (a disclosure of personal data, a narrowed protection, the
% processing of a human's record, any effect that is not a P2 consequence)
% stays held in every case until the review decides
pending_hold(Q, L) :- cited_pending(S, Q, L), in_ceilings(S, Q), not law_review_overdue(Q, L),
                      not irreversible_effect(Q).
pending_hold(Q, L) :- cited_pending(_, Q, L), irreversible_effect(Q).
law_hold(Q) :- pending_hold(Q, _).
% under the genesis regime, where no reviewer outside the founder's chain
% decides, that hold lasts the regime: H3's declared genesis cost, marked
genesis_cost_hold(Q) :- pending_hold(Q, L), irreversible_effect(Q), law_review_overdue(Q, L), not regime_exited.

% otherwise, beyond the seat's ceilings, or past the review's ceiling, the act
% may pass, and no consequence of it falls on any human the cited right
% protects, named or of the class the citation names, until the review
% decides; it is a finding reviewed under P2
protected_by(Q, L, H) :- cites_right_of(Q, L, H).
protected_by(Q, L, H) :- cites_class(Q, L, C), in_class(H, C).
protection_mode(Q, L) :- cited_pending(S, Q, L), beyond_ceilings(S, Q), not irreversible_effect(Q).
protection_mode(Q, L) :- cited_pending(_, Q, L), law_review_overdue(Q, L), not irreversible_effect(Q).
law_protection_finding(Q, L, H) :- protection_mode(Q, L), protected_by(Q, L, H).
consequence_withheld(Q, H) :- law_protection_finding(Q, _, H).
withheld_verdict(V) :- verdict_from_act(V, Q), consequence_on(V, H), consequence_withheld(Q, H).
withheld_finding(F) :- finding_from_act(F, Q), finding(F, H, _), consequence_withheld(Q, H).
withheld_duty(P, A) :- duty_from_act(A, Q), consequence_withheld(Q, P).

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
