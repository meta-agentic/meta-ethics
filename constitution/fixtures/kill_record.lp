% Discriminating cases for delivery and knowledge (D15), ratification (C5.2),
% conflicting consequences (C14), owed acts (H1.4) and the read of kinds
% (P3.3). arb holds the arbiter seat; h and a the Custodian seats; r2
% grants sub2c; u grants col3.

now(20).
root_grant(m0). mandate(m0, h, s). issued(m0, 0). carries_seat(m0, ch). admitted(m0).
root_grant(m1). mandate(m1, a, s). issued(m1, 0). carries_seat(m1, ca). admitted(m1).
root_grant(m2). mandate(m2, arb, s). issued(m2, 0). carries_seat(m2, sa). admitted(m2).
root_grant(m3). mandate(m3, rcpt, s). issued(m3, 0).
root_grant(m7). mandate(m7, r2, s). issued(m7, 0).
mandate(m8, sub2c, s). delegated_from(m8, m7). issued(m8, 0).
root_grant(m9). mandate(m9, u, s). issued(m9, 0).
mandate(m10, col3, s). delegated_from(m10, m9). issued(m10, 0).
custodian_seat(ch). custodian_seat(ca). arbiter_seat(sa).
witnessed_head(hh, 15).
% knowledge
delivered(d7, rcpt, x7, 5). observed(d7, rcpt).
delivered(d8, rcpt, x8, 6). filer(x8, r2). observed(d8, sub2c).
delivered(d9, rcpt, x9, 7). observed(d9, col3).
delivered(d10, rcpt, x10, 8). observed(d10, h).
% ratification with one invalid signature
signature(s61, h, r6, 9). signature_valid(s61).
signature(s62, a, r6, 9).
placed(r6).
% a resolution decides; an ordering beats a contrary resolution; a protection
% the ordering defeats does not lapse into force
candidate(fine4, z). candidate(shield4, z). conflicts(fine4, shield4). resolution(fine4, shield4, z).
candidate(fine5, z). candidate(shield5, z). conflicts(fine5, shield5). prevails(shield5, fine5).
resolution(fine5, shield5, z).
param(conflict_ceiling, 5).
candidate(prot6, z6). candidate(duty6, z6). conflicts(duty6, prot6). prevails(duty6, prot6). protection(prot6).
conflict_filed(prot6, z6, 1).
% an owed act that was never filed
owed(y4).

% EXPECT[D15.3]: knew(rcpt,x9,7)
% EXPECT[D15.3]: knew(rcpt,x10,8)
% EXPECT-NOT[D15.3]: knew(rcpt,x7,5)
% EXPECT-NOT[D15.3]: knew(rcpt,x8,6)
% EXPECT-NOT[C5.2]: ratified(r6)
% EXPECT[C14.2]: applied(fine4,z)
% EXPECT[C14.2]: applied(shield5,z)
% EXPECT-NOT[C14.2]: applied(shield4,z)
% EXPECT-NOT[C14.2]: applied(fine5,z)
% EXPECT[C14.3]: applied(duty6,z6)
% EXPECT-NOT[C14.3]: applied(prot6,z6)
% EXPECT-NOT[H1.4]: admitted_act(y4)
