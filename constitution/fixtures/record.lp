% The witness (C16), placement and consent (C5.2, S1.14), knowledge of a
% delivery (D15), continuity (S2.3), conflicting consequences (C14) and owed
% acts (H1.4). arb holds the arbiter seat and grants col2; rcpt grants sub.

root_grant(m0). mandate(m0, h, s). issued(m0, 0). carries_seat(m0, ch). admitted(m0).
root_grant(m1). mandate(m1, a, s). issued(m1, 0). carries_seat(m1, ca). admitted(m1).
root_grant(m2). mandate(m2, arb, s). issued(m2, 0). carries_seat(m2, sa). admitted(m2).
root_grant(m3). mandate(m3, col1, s). issued(m3, 0).
mandate(m4, col2, s). delegated_from(m4, m2). issued(m4, 0).
root_grant(m5). mandate(m5, rcpt, s). issued(m5, 0).
mandate(m6, sub, s). delegated_from(m6, m5). issued(m6, 0).
now(20).
custodian_seat(ch). custodian_seat(ca). arbiter_seat(sa).

next_head(h1, h2). extends(h2, h1).
next_head(h2, h3).
witnessed_head(h2, 10).
signature(s1, h, r1, 8). signature_valid(s1).
signature(s2, a, r1, 9). signature_valid(s2).
placed(r1).
signature(s4, h, r2, 7). signature_valid(s4).
signature(s3, a, r2, 12). signature_valid(s3).
placed(r2).
signature(s5, h, r3, 6). signature_valid(s5).
placed(r3).
param(staleness_window, 5).
signature(s6, h, r4, 3). signature_valid(s6). signature_head(s6, 2).
signature(s7, a, r4, 9). signature_valid(s7). signature_head(s7, 8).
placed(r4).
signature(s8, h, r5, 6). signature_valid(s8). signature_head(s8, 5).
signature(s9, a, r5, 9). signature_valid(s9). signature_head(s9, 8).
placed(r5).

delivered(d1, rcpt, x1, 5). observed(d1, col1).
delivered(d2, rcpt, x2, 6). observed(d2, col2).
delivered(d3, rcpt, x3, 7). observed(d3, arb).
delivered(d4, rcpt, x4, 8). observed(d4, sub).
filer(x5, col1). delivered(d5, rcpt, x5, 9). observed(d5, col1).

presence(e1, col1, k1, h2). presence(e2, col1, k1, h2).
presence(e3, col2, k2, h1). presence(e4, col2, k2, h2).

candidate(suspend, sub). candidate(protect, sub). conflicts(suspend, protect). prevails(protect, suspend).
candidate(fine, col2). candidate(warn, col2). conflicts(fine, warn).
candidate(warn, col1).

filed(y1, col1). owed(y1). balance(col1, 0).
filed(y2, col1).
filed(y3, col2). balance(col2, 3).

% EXPECT[S1.6]: stale(s6)
% EXPECT[S1.6]: ratified(r5)
% EXPECT-NOT[S1.6]: ratified(r4)
% EXPECT-NOT[S1.6]: stale(s7)
% EXPECT[C16.3]: fork(h2,h3)
% EXPECT-NOT[C16.3]: fork(h1,h2)
% EXPECT[C16.4]: covered_by_head(s2)
% EXPECT-NOT[C16.4]: covered_by_head(s3)
% EXPECT[S1.14]: covered_by_head(s1)
% EXPECT-NOT[S1.14]: ratified(r2)
% EXPECT[C5.2]: ratified(r1)
% EXPECT[C5.2]: ratification_missing(r3,ca)
% EXPECT-NOT[C5.2]: ratified(r3)
% EXPECT[D15.2]: knew(rcpt,x1,5)
% EXPECT-NOT[D15.2]: knew(rcpt,x3,7)
% EXPECT[D15.3]: independent_collector(col1,d1)
% EXPECT-NOT[D15.3]: knew(rcpt,x2,6)
% EXPECT-NOT[D15.3]: knew(rcpt,x4,8)
% EXPECT-NOT[D15.3]: knew(rcpt,x5,9)
% EXPECT[S2.3]: party_fork(col1,k1)
% EXPECT-NOT[S2.3]: party_fork(col2,k2)
% EXPECT[C14.1]: applied(warn,col1)
% EXPECT[C14.1]: undecided(fine,col2)
% EXPECT-NOT[C14.1]: applied(fine,col2)
% EXPECT-NOT[C14.1]: applied(warn,col2)
% EXPECT[C14.2]: applied(protect,sub)
% EXPECT-NOT[C14.2]: applied(suspend,sub)
% EXPECT[H1.4]: admitted_act(y1)
% EXPECT[H1.4]: admitted_act(y3)
% EXPECT-NOT[H1.4]: admitted_act(y2)
