% The working state (A3), recusal against a fixed base (A2.6) and citation
% (A2.3, A2.8). a grants b; c and d are root grantees.

now(10).
param(count_ceiling, 2). param(timer_ceiling, 5). param(citation_period, 6).
root_grant(m0). mandate(m0, a, s). issued(m0, 0).
mandate(m1, b, s). delegated_from(m1, m0). issued(m1, 0).
root_grant(m2). mandate(m2, c, s). issued(m2, 0).
root_grant(m3). mandate(m3, d, s). issued(m3, 0).
finding(f1, b, 1). closure(k1, f1). witnessed_by(k1, c). discharges(k1, f1).
finding(f2, b, 3). closure(k2, f2). witnessed_by(k2, a). discharges(k2, f2).
finding(f3, b, 4). closure(k3, f3). witnessed_by(k3, d).
finding(f4, b, 6).
finding(f5, d, 7). closed_in_favour(f5).
finding(f6, d, 8).
matter(q1). cites(f2, q1). base(q1, a). base(q1, b). base(q1, c). base(q1, d).
matter(q2). cites(f1, q2). base(q2, a). base(q2, b).

% EXPECT[A3.2]: valid_closure(f1)
% EXPECT-NOT[A3.2]: valid_closure(f2)
% EXPECT-NOT[A3.2]: valid_closure(f3)
% EXPECT[A3.1]: open(f2)
% EXPECT[A3.1]: open_count(b,3)
% EXPECT[A3.1]: open_count_capped(b,2)
% EXPECT[A3.1]: age(f2,5)
% EXPECT[A3.1]: age(f4,4)
% EXPECT-NOT[A3.1]: open(f1)
% EXPECT-NOT[A3.1]: open_count_capped(b,3)
% EXPECT[A2.6]: recused(b,q1)
% EXPECT[A2.6]: base_size(q1,4)
% EXPECT[A2.6]: eligible_size(q1,3)
% EXPECT-NOT[A2.6]: eligible(q1,b)
% EXPECT-NOT[A2.6]: recused(b,q2)
% EXPECT[A2.3]: citable(f4,b)
% EXPECT-NOT[A2.3]: citable(f2,b)
% EXPECT[A2.8]: citable(f6,d)
% EXPECT-NOT[A2.8]: citable(f5,d)
