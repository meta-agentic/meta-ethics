% The founder stays a subject after leaving, with no act (A1.8).

now(10).
founder(fd).
root_grant(m0). mandate(m0, fd, s). issued(m0, 0). revoked(m0, 5).
root_grant(m1). mandate(m1, q, s). issued(m1, 0). revoked(m1, 5).

% EXPECT[A1.8]: subject(fd)
% EXPECT-NOT[A1.8]: subject(q)
