#!/usr/bin/env python3
"""The parameter part of C18's configuration check, over parameters.tsv.

Reads an instance's values (one `name value` line each; `#` starts a
comment) and decides every floor of parameters.tsv against them. Floor atoms:
  declared     a value is given
  nonempty     the value is not empty and not `none`
  positive     the value is a number above zero
  finite       the value is a number, not `inf`
  law          procedural: the most protective applicable law bounds it; a
               value is required, and the check records the atom as attested
  >= n         at least the constant n
  >= p, >= p + q   at least the value of p, or of p plus q
  = p          equal to the value of p (one window, in decided proposals)
  <= share(D2) pooled
               both seats together within D2's share: twice the value at
               most last_word_share times last_word_window (P1.5; pooled,
               pending the founder's decision on per seat or pooled)
  superset(a,b,...)
               the value, a comma-separated set, contains every listed
               element (the recusal standard's grounds, C21.2)

  c18.py                 decide every fixtures/values/*.values file against its
                         `# EXPECT:` line (`conforms`, or `fails <parameter>` for
                         each parameter that must fail); exit 1 on a mismatch
  c18.py FILE            decide one instance's values and print the result
"""
import glob
import os
import re
import sys
from fractions import Fraction

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)


def schema():
    lines = open(os.path.join(ROOT, "parameters.tsv"), encoding="utf-8").read().splitlines()
    head = lines[0].split("\t")
    return [dict(zip(head, line.split("\t"))) for line in lines[1:] if line.strip()]


def number(v):
    if v is None or v.strip().lower() in ("", "none", "inf"):
        return None
    try:
        return Fraction(v.strip())
    except ValueError:
        return None


def decide(values):
    """Returns {parameter: [failed atom, ...]} for every parameter that fails."""
    failed = {}
    for row in schema():
        name = row["parameter"]
        v = values.get(name)
        bad = []
        if v is None:
            bad.append("declared")
        for atom in row["floor"].split(" & "):
            if v is None:
                break
            n = number(v)
            if atom == "nonempty":
                ok = v.strip().lower() not in ("", "none")
            elif atom in ("positive", "finite"):
                ok = n is not None and (atom == "finite" or n > 0)
            elif atom in ("declared", "law"):
                ok = True
            elif atom == "<= share(D2) pooled":
                share, window = number(values.get("last_word_share")), number(values.get("last_word_window"))
                ok = None not in (n, share, window) and 2 * n <= share * window
            elif atom.startswith("superset("):
                have = {x.strip() for x in v.split(",")}
                ok = set(atom[len("superset("):-1].split(",")) <= have
            elif atom.startswith("= "):
                ok = n is not None and n == number(values.get(atom[2:]))
            else:
                m = re.match(r">= (\S+)(?: \+ (\S+))?$", atom)
                terms = [number(t) if re.match(r"[0-9]", t) else number(values.get(t))
                         for t in m.groups() if t]
                ok = n is not None and None not in terms and n >= sum(terms)
            if not ok:
                bad.append(atom)
        if bad:
            failed[name] = bad
    return failed


def read_values(path):
    values, expect = {}, []
    for line in open(path, encoding="utf-8"):
        m = re.match(r"#\s*EXPECT:\s*(.+?)\s*$", line)
        if m:
            expect.append(m.group(1))
        line = line.split("#", 1)[0].strip()
        if line:
            k, _, v = line.partition(" ")
            values[k] = v.strip()
    return values, expect


def main():
    if sys.argv[1:]:
        failed = decide(read_values(sys.argv[1])[0])
        for k, atoms in sorted(failed.items()):
            print("fails %-28s %s" % (k, " & ".join(atoms)))
        print("conforms" if not failed else "does not conform")
        return 1 if failed else 0
    errors = 0
    files = sorted(glob.glob(os.path.join(ROOT, "fixtures", "values", "*.values")))
    for path in files:
        values, expect = read_values(path)
        failed = decide(values)
        want = {e.split()[1] for e in expect if e.startswith("fails ")}
        name = os.path.relpath(path, ROOT)
        if ("conforms" in expect) != (not failed) or (want and set(failed) != want):
            errors += 1
            print("FAIL c18        %s: expected %s, got %s" % (name, expect, sorted(failed) or "conforms"))
    print("configuration check (parameters): %d value sets decided as expected" % (len(files) - errors)
          if not errors else "configuration check: %d failure(s)" % errors)
    return 1 if errors else 0


if __name__ == "__main__":
    sys.exit(main())
