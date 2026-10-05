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
% EXPECT[P2.5]: reviewer_kind_ok(v1,n3)
% EXPECT-NOT[P2.5]: needs_human_reviewer(v1)
