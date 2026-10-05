#!/usr/bin/env python3
"""Owed acts (theorem "Owed acts must not spend capacity"): do owed acts spending capacity let a party be forced into breach by
silence, and does an exhaustion excuse open an escape for the powerful?

Model (one period).  Every party gets T tokens.  Sending a request is an
initiating act: costs the sender 1 token and creates an owed answer for the
recipient with a window.  Policies for the owed answer:
  BUDGETED  answering costs the recipient 1 token; at 0 it cannot answer.
  EXCUSED   as BUDGETED, but no breach if the balance was 0 at the deadline.
  FREE      owed acts are outside the budget: intake admits them at any balance.
Pairwise rule (instance): at most one pending request per sender/recipient
pair.  Windows are one tick; the honest recipient answers as soon as it can.
"""
T = 5
POLICIES = ("BUDGETED", "EXCUSED", "FREE")

def flood(policy, c, pairwise):
    """c attackers flood one honest target H.  Returns (H breached?, attacker
    tokens spent, answers H gave)."""
    tokens = {f"a{i}": T for i in range(c)}
    h_tokens = T
    pending = {}            # sender -> request id
    breached = False
    answers = 0
    spent = 0
    rid = 0
    for tick in range(4 * T):
        # attackers send
        for a in tokens:
            if tokens[a] == 0:
                continue
            if pairwise and a in pending:
                continue
            tokens[a] -= 1; spent += 1; rid += 1
            pending[a] = rid
        # H answers every pending request it can this tick
        for a in list(pending):
            if policy == "FREE":
                answers += 1; del pending[a]
            elif h_tokens > 0:
                h_tokens -= 1; answers += 1; del pending[a]
            else:
                # window passes unanswered
                if policy == "BUDGETED":
                    breached = True
                elif policy == "EXCUSED":
                    pass            # balance 0 at deadline: excused
                del pending[a]      # the request lapses either way
        if not any(tokens.values()) and not pending:
            break
    return breached, spent, answers

def empty_pockets(policy):
    """A powerful party W owes one ratification per tick (an act of power),
    and spends all its tokens on its own initiating acts first."""
    w_tokens = T
    owed = 0; breaches = 0; excused = 0
    for tick in range(2 * T):
        # W initiates while it can
        if w_tokens > 0:
            w_tokens -= 1
        # one ratification falls due
        owed += 1
        if policy == "FREE":
            pass                    # performed: outside the budget
        elif w_tokens > 0:
            w_tokens -= 1           # performed
        else:
            if policy == "BUDGETED":
                breaches += 1
            else:
                excused += 1
    return owed, breaches, excused

print(f"Owed acts  T={T} tokens per party per period\n")
print("Flood one honest target H:")
print(f"{'policy':>9} {'attackers':>9} {'pairwise':>8} | {'H breached':>10} {'att. spent':>10} {'answers':>7}")
for policy in POLICIES:
    for c in (1, 2, 3):
        for pw in (True, False):
            b, s, a = flood(policy, c, pw)
            print(f"{policy:>9} {c:>9} {str(pw):>8} | {str(b):>10} {s:>10} {a:>7}")
print()
print("Empty pockets: W spends its own tokens first, then owes one act per tick:")
print(f"{'policy':>9} | {'owed':>4} {'breaches':>8} {'excused':>7}")
for policy in POLICIES:
    o, b, e = empty_pockets(policy)
    print(f"{policy:>9} | {o:>4} {b:>8} {e:>7}")
print()
# sizing owed capacity to the worst case, the other option considered
for n in (5, 10, 50):
    print(f"N={n:>2}: total issuance N*T={n*T:>4}; worst-case owed answers for one party "
          f"= N*T (every token aimed at it); reserved owed capacity per party would be "
          f"{n*T} vs its initiating budget {T}, i.e. {n}x the pool for every party.")
