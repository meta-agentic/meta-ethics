#!/usr/bin/env python3
"""Equivocation against the external witness (C16).

An operator keeps a hash chain and can fork it: show head A to one reader and
head B to another. Two witness designs:
  TSA   : signs (head, time) for whatever head is submitted; entries are not linked.
  LOG   : append-only; entry i = (head, hash of entry i-1, i); anyone can ask for
          the full sequence and check that consecutive witnessed heads are
          prefix-related on the operator's chain.
Question: given what a reader can obtain, is a fork provable?
"""
import hashlib
import random

random.seed(7)


def h(*p):
    return hashlib.sha256("|".join(map(str, p)).encode()).hexdigest()[:12]


class Chain:
    def __init__(self):
        self.entries = ["genesis"]
        self.heads = [h("genesis")]

    def append(self, e):
        self.entries.append(e)
        self.heads.append(h(self.heads[-1], e))
        return self.heads[-1]

    def fork_from(self, i):
        c = Chain()
        c.entries = self.entries[: i + 1]
        c.heads = self.heads[: i + 1]
        return c


def is_prefix(short, long):
    return short.heads[-1] in long.heads


class TSA:
    def __init__(self):
        self.tokens = []

    def witness(self, head, t):
        tok = (head, t, h("tsa-key", head, t))
        self.tokens.append(tok)
        return tok


class Log:
    def __init__(self):
        self.entries = []

    def witness(self, head, t):
        prev = self.entries[-1][3] if self.entries else "none"
        ent = (len(self.entries), head, t, h(prev, head, t))
        self.entries.append(ent)
        return ent


def trial(design):
    main = Chain()
    for i in range(5):
        main.append("act%d" % i)
    w = design()
    w.witness(main.heads[-1], 1)
    # operator forks at entry 3 and shows a different history to reader B
    alt = main.fork_from(3)
    alt.append("act3'")
    alt.append("act4'")
    main.append("act5")
    tokA = w.witness(main.heads[-1], 2)      # shown to reader A
    tokB = w.witness(alt.heads[-1], 3)       # shown to reader B
    if design is TSA:
        # each token is valid on its own; a reader holding both learns only that two heads exist
        # and has no way to know which chain either belongs to, or which came first in the log
        # unless the operator supplies both chains, which it will not.
        provable_by_one_reader = False
        provable_by_witness_alone = False       # the TSA keeps no order and links nothing
        provable_by_two_readers_comparing = False  # two valid tokens, no total order, no linkage
    else:
        # any reader can fetch the whole sequence; consecutive witnessed heads must be prefix-related
        seq = w.entries
        heads_seen = [e[1] for e in seq]
        # the reader asks the operator for proof that heads_seen[1] extends heads_seen[0], and
        # that heads_seen[2] extends heads_seen[1]; the second cannot be supplied
        chains = {main.heads[-1]: main, alt.heads[-1]: alt}
        ok01 = is_prefix(main.fork_from(4), chains[heads_seen[1]])
        ok12 = is_prefix(chains[heads_seen[1]], chains[heads_seen[2]])
        provable_by_one_reader = not (ok01 and ok12)
        provable_by_witness_alone = provable_by_one_reader  # the log itself holds the sequence
        provable_by_two_readers_comparing = provable_by_one_reader
    return provable_by_one_reader, provable_by_witness_alone, provable_by_two_readers_comparing


for design in (TSA, Log):
    r = trial(design)
    print("%-4s fork provable by: one reader with the public sequence=%s   the witness's own record=%s   two readers comparing=%s"
          % (design.__name__, *r))
print()
print("-> a timestamp authority proves existence at a time, never uniqueness: two forks both carry valid tokens.")
print("   an append-only witness whose entries are linked and public makes a fork provable from the witness")
print("   alone, which is the only observer that exists in the genesis regime (one party, nobody to gossip with).")
