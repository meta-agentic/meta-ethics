% Does a reply key re-link a severed subject?  (theorem "A per-party reply
% credential re-links")  Starts from the mitigated view of keyed_views.lp:
% findings shown under per-finding handles, no per-party key in any shared view.
% Added: replies are signed.  Two designs are compared on the same facts:
%   A. one reply key per PARTY (a "reply key the subject keeps");
%   B. one reply key per FINDING, issued at opening.
% The attacker is an ordinary party that sees the shared view, the acts of
% power, the interim effects, and every reply (A2: every read shows the reply).

person(ann). person(bob). person(cat). person(dan). person(eve). attacker(eve).

% shared view: handle, rule, time bucket.  No subject key in any shared view.
view(f1, r_scope,  3).   % bob, SEVERED at t=8
view(f2, r_inform, 5).   % bob
view(f3, r_inform, 5).   % cat
view(f4, r_inform, 5).   % ann
severed(f1, 8).

% an interim exclusion on m7 (cites f2 only) is a visible effect (keyed_views.lp, attack 2)
cites(m7, f2). vote_refused(m7, bob).
ncites(M, N) :- cites(M, _), N = #count{ F : cites(M, F) }.
resolved_by_effect(F, P) :- cites(M, F), ncites(M, 1), vote_refused(M, P).

% ---- design A: per-party reply key -----------------------------------------
% reply_a(ReplyId, Finding, SignerKey, Time)
reply_a(rp1, f1, rk_bob, 9).    % bob replies to his severed finding after severing
reply_a(rp2, f2, rk_bob, 6).
reply_a(rp3, f3, rk_cat, 6).
same_signer_a(F, G) :- reply_a(_, F, K, _), reply_a(_, G, K, _), F != G.
linked_a(F, P) :- resolved_by_effect(G, P), same_signer_a(F, G).
relinked_after_severing_a(F, P) :- linked_a(F, P), severed(F, _).

% ---- design B: per-finding reply key ---------------------------------------
reply_b(rp1, f1, rk_f1, 9).
reply_b(rp2, f2, rk_f2, 6).
reply_b(rp3, f3, rk_f3, 6).
same_signer_b(F, G) :- reply_b(_, F, K, _), reply_b(_, G, K, _), F != G.
linked_b(F, P) :- resolved_by_effect(G, P), same_signer_b(F, G).
relinked_after_severing_b(F, P) :- linked_b(F, P), severed(F, _).

% ---- residual channel under B: timing.  Acts of power are attributed for
% good; a reply appended in the same time bucket as one party's act of power,
% when no other party acted in that bucket, names the replier.  (H2: the
% record is a channel, narrowed, never closed.)
act_of_power(x1, bob, 9).       % bob votes on something at t=9
act_of_power(x2, cat, 6). act_of_power(x3, ann, 6).
acted_in(P, T) :- act_of_power(_, P, T).
n_acted(T, N) :- acted_in(_, T), N = #count{ P : acted_in(P, T) }.
timing_link_b(F, P) :- reply_b(_, F, _, T), acted_in(P, T), n_acted(T, 1).
timing_relink_b(F, P) :- timing_link_b(F, P), severed(F, _).

% EXPECT: resolved_by_effect(f2,bob)
% EXPECT: same_signer_a(f1,f2)
% EXPECT: relinked_after_severing_a(f1,bob)
% EXPECT-NOT: same_signer_b(f1,f2)
% EXPECT-NOT: relinked_after_severing_b(f1,bob)
% EXPECT: timing_relink_b(f1,bob)
