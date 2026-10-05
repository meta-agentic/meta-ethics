% Discriminating cases for the working state (A3): a count under its cap, a
% closed finding has no age, a self-witnessed closure, and no end without an
% end.

now(10).
param(count_ceiling, 2). param(timer_ceiling, 5).
root_grant(m0). mandate(m0, b, s). issued(m0, 0).
root_grant(m1). mandate(m1, c, s). issued(m1, 0).
finding(f1, b, 1). closure(k1, f1). witnessed_by(k1, c). discharges(k1, f1).
finding(f2, b, 2).
finding(f4, b, 8). closure(k4, f4). witnessed_by(k4, c). discharges(k4, f4).
finding(f5, c, 7).
finding(f3, c, 3). closure(k3, f3). witnessed_by(k3, c). discharges(k3, f3).

% EXPECT[A3.1]: open_count_capped(b,1)
% EXPECT[A3.1]: age(f2,5)
% EXPECT-NOT[A3.1]: open_count_capped(b,2)
% EXPECT-NOT[A3.1]: age(f2,8)
% EXPECT-NOT[A3.1]: age(f1,5)
% EXPECT-NOT[A3.1]: age(f4,2)
% EXPECT[A3.1]: age(f5,3)
% EXPECT-NOT[A3.1]: age(f5,5)
% EXPECT-NOT[A3.2]: valid_closure(f3)
% EXPECT[A3.2]: valid_closure(f1)
% EXPECT-NOT[P3.7]: ended_without_verdict(f2)
