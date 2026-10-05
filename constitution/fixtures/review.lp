% Review of consequence-bearing verdicts (A2.5, P2). n1 grants n2; h1, h2
% are human, n1, n2, n3 non-human.

now(20).
param(contest_window, 5).
root_grant(m0). mandate(m0, h1, s). issued(m0, 0). kind_of(h1, human).
root_grant(m1). mandate(m1, n1, s). issued(m1, 0). kind_of(n1, nonhuman).
mandate(m2, n2, s). delegated_from(m2, m1). issued(m2, 0). kind_of(n2, nonhuman).
root_grant(m3). mandate(m3, h2, s). issued(m3, 0). kind_of(h2, human).
root_grant(m4). mandate(m4, n3, s). issued(m4, 0). kind_of(n3, nonhuman).
verdict(v1, n2, 10). bears_consequence(v1). consequence_on(v1, n2). filed_by(v1, h2).
drawn_reviewer(v1, n3). reviewed(v1, n3).
verdict(v2, h1, 10). bears_consequence(v2). consequence_on(v2, h1). filed_by(v2, n2).
drawn_reviewer(v2, n3). reviewed(v2, n3).
verdict(v3, n2, 10). bears_consequence(v3). consequence_on(v3, n2). filed_by(v3, h2).
drawn_reviewer(v3, n1). reviewed(v3, n1).
verdict(v4, h2, 18). bears_consequence(v4). consequence_on(v4, h2). filed_by(v4, n3).
drawn_reviewer(v4, h1). reviewed(v4, h1).
verdict(v5, h1, 10). bears_consequence(v5). consequence_on(v5, h1). filed_by(v5, n3).
drawn_reviewer(v5, h2). reviewed(v5, h2).

verdict_delivered(v1, 10). verdict_delivered(v2, 10). verdict_delivered(v3, 10).
verdict_delivered(v4, 18). verdict_delivered(v5, 10).
% derived at 2, delivered at 18: the window runs from delivery, so it has not passed
verdict(v6, n3, 2). bears_consequence(v6). consequence_on(v6, n3). filed_by(v6, h2).
verdict_delivered(v6, 18). drawn_reviewer(v6, n1). reviewed(v6, n1).
% about subjects of both kinds, the consequence on the non-human one: a human reviews
verdict(v7, n3, 5). also_about(v7, h2). bears_consequence(v7). consequence_on(v7, n3). filed_by(v7, h1).
verdict_delivered(v7, 5). drawn_reviewer(v7, n1). reviewed(v7, n1).
verdict(v8, n3, 5). also_about(v8, h2). bears_consequence(v8). consequence_on(v8, n3). filed_by(v8, n1).
verdict_delivered(v8, 5). drawn_reviewer(v8, h1). reviewed(v8, h1).
% a reviewer who benefits from the outcome, or has acted in the matter, is implicated
verdict(v9, n2, 5). bears_consequence(v9). consequence_on(v9, n2). filed_by(v9, h1).
verdict_delivered(v9, 5). drawn_reviewer(v9, n3). reviewed(v9, n3). benefits_from(n3, v9).
verdict(v10, n2, 5). bears_consequence(v10). consequence_on(v10, n2). filed_by(v10, h1).
verdict_delivered(v10, 5). drawn_reviewer(v10, h2). reviewed(v10, h2). acted_in(h2, v10).

% EXPECT[A2.5]: takes_effect(v1)
% EXPECT[A2.5]: provisional(v4)
% EXPECT-NOT[A2.5]: takes_effect(v4)
% EXPECT[P2.1]: implicated(n1,v3)
% EXPECT[P2.1]: provisional(v3)
% EXPECT-NOT[P2.1]: takes_effect(v3)
% EXPECT[P2.2]: needs_human_reviewer(v2)
% EXPECT[P2.2]: takes_effect(v5)
% EXPECT-NOT[P2.2]: takes_effect(v2)
% EXPECT-NOT[P2.2]: reviewer_kind_ok(v2,n3)
% EXPECT[H1.5]: window_passed(v1)
% EXPECT-NOT[H1.5]: window_passed(v6)
% EXPECT-NOT[A2.5]: takes_effect(v6)
% EXPECT[P2.5]: needs_human_reviewer(v7)
% EXPECT[P2.5]: takes_effect(v8)
% EXPECT-NOT[P2.5]: takes_effect(v7)
% EXPECT[P2.4]: needs_human_reviewer(v2)
% EXPECT-NOT[P2.4]: reviewer_kind_ok(v2,n3)
% EXPECT[C21.2]: implicated(n3,v9)
% EXPECT[C21.2]: implicated(h2,v10)
% EXPECT-NOT[C21.2]: takes_effect(v9)
% EXPECT-NOT[C21.2]: takes_effect(v10)
% EXPECT[P2.5]: reviewer_kind_ok(v1,n3)
% EXPECT-NOT[P2.5]: needs_human_reviewer(v1)
