#!/usr/bin/env python3
"""Configuration check in the genesis validator (C18), by brute force
over every roster size 1..cap (the Presburger claim, decided by enumeration).

A configuration is the instance's declared parameters. Each check is a linear
(in)equality in the roster size n with rational constants, so the whole thing
is a Presburger sentence with n bounded; enumeration decides it exactly.
"""
from math import ceil
from fractions import Fraction as Fr


def checks(c):
    cap = c["cap"]
    out = {}
    # (i) approval share and minimum: smallest n at which a change can pass at all
    #     approvals needed = max(minimum, ceil(share*n)); a change can pass iff that <= n
    passable = [n for n in range(1, cap + 1) if max(c["minimum"], ceil(c["share"] * n)) <= n]
    out["i_first_passable_n"] = passable[0] if passable else None
    # (i') with recusal: after r parties are recused (base frozen, A2), approvals still needed
    #     from n - r eligible; n_r = smallest n where a change passes with r recused
    r = c["max_recusals_considered"]
    passable_r = [n for n in range(1, cap + 1) if max(c["minimum"], ceil(c["share"] * n)) <= n - r]
    out["i_first_passable_n_with_%d_recused" % r] = passable_r[0] if passable_r else None
    # (ii) windows against the A3 timer ceiling
    out["ii_contest_window_le_timer_ceiling"] = c["contest_window"] <= c["timer_ceiling"]
    out["ii_interim_ceiling_le_timer_ceiling"] = c["interim_ceiling"] <= c["timer_ceiling"]
    # (iii) minimum response window below every window; load-lengthened windows within the ceiling
    out["iii_min_response_le_all_windows"] = all(c["min_response_window"] <= w for w in
                                                   (c["contest_window"], c["answer_window"], c["judge_window"]))
    out["iii_max_lengthened_window_le_ceiling"] = (
        c["answer_window"] + c["per_open_extension"] * c["open_findings_cap"] + c["one_extension"] <= c["timer_ceiling"])
    # (iv) small-count suppression k against parties subject to power (roster minus seats)
    visible = [n for n in range(1, cap + 1) if n - c["seats"] >= c["k_anon"]]
    out["iv_first_n_findings_visible"] = visible[0] if visible else None
    # (v) lottery: a two-sided request needs an eligible judge outside both first-level subtrees;
    #     'immaterial against voice' needs two
    s = c["first_level_subtrees"]
    out["v_any_eligible_judge_for_two_sided_request"] = s >= 3
    out["v_two_concurring_judges_possible"] = s >= 3 and (cap - 2) >= 2
    return out


CONFIGS = {
    "live (a small but workable instance)": dict(
        cap=20, share=Fr(1, 2), minimum=3, max_recusals_considered=2,
        contest_window=10, interim_ceiling=5, timer_ceiling=30, min_response_window=2,
        answer_window=5, judge_window=4, per_open_extension=1, open_findings_cap=5, one_extension=3,
        seats=2, k_anon=3, first_level_subtrees=3),
    "dead by minimum (minimum above the cap)": dict(
        cap=8, share=Fr(1, 2), minimum=9, max_recusals_considered=1,
        contest_window=10, interim_ceiling=5, timer_ceiling=30, min_response_window=2,
        answer_window=5, judge_window=4, per_open_extension=1, open_findings_cap=5, one_extension=3,
        seats=2, k_anon=3, first_level_subtrees=3),
    "dead by suppression (k above parties subject to power)": dict(
        cap=6, share=Fr(1, 2), minimum=2, max_recusals_considered=1,
        contest_window=10, interim_ceiling=5, timer_ceiling=30, min_response_window=2,
        answer_window=5, judge_window=4, per_open_extension=1, open_findings_cap=5, one_extension=3,
        seats=2, k_anon=5, first_level_subtrees=3),
    "dead by windows (contest window above the timer ceiling; load extension overflows)": dict(
        cap=20, share=Fr(1, 2), minimum=3, max_recusals_considered=2,
        contest_window=40, interim_ceiling=5, timer_ceiling=30, min_response_window=2,
        answer_window=5, judge_window=4, per_open_extension=3, open_findings_cap=10, one_extension=3,
        seats=2, k_anon=3, first_level_subtrees=3),
    "degenerate lottery (two first-level subtrees only)": dict(
        cap=20, share=Fr(1, 2), minimum=3, max_recusals_considered=2,
        contest_window=10, interim_ceiling=5, timer_ceiling=30, min_response_window=2,
        answer_window=5, judge_window=4, per_open_extension=1, open_findings_cap=5, one_extension=3,
        seats=2, k_anon=3, first_level_subtrees=2),
}

for name, c in CONFIGS.items():
    print("== " + name)
    for k, v in checks(c).items():
        flag = ""
        if v is None or v is False:
            flag = "   <-- DEAD or DEGENERATE"
        print("   %-46s %s%s" % (k, v, flag))
    print()
print("every check is a comparison of linear terms in n with rational constants over n in 1..cap;")
print("enumeration over the finite range decides it exactly, no solver needed.")
