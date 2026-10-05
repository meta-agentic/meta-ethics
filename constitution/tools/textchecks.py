"""Text-level checks of the consolidated L0: prose, sources, parameters and
the manifest. Imported by check.py, which documents every check."""
import glob
import hashlib
import json
import os
import re

from clingo import ast

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)                      # constitution/
REPO = os.path.dirname(ROOT)
RECORDS = {"01": os.path.join(REPO, "docs/adr/ADR-ETH-01-constitution-shape.md"),
           "02": os.path.join(REPO, "docs/adr/ADR-ETH-02-first-amendment.md")}
STATUSES = {"program", "todo", "procedural", "meta", "interpretive", "open", "cost"}
INPUT_CLASSES = {"intake", "attested", "param"}
RULE_CLASSES = {"derived", "consequence"}
NARRATIVE = re.compile(r"\b((?<!be )restored|corrected|correction|amended|amendment|amendments|"
                       r"supersedes?|superseded|as first written|now reads|first draft)\b", re.I)
# One floor atom; a floor is one or more atoms joined by " & ", all of which hold.
FLOOR = re.compile(r"^(finite|declared|nonempty|positive|law|>= [0-9]+|>= [a-z_]+( \+ [a-z_]+)?|"
                   r"<= share\(D2\)|clause\([A-Z]+[0-9]*\.[0-9]+\))$")
KEYWORDS = ("finite", "declared", "nonempty", "positive", "law", "share", "clause")

errors = []
SKIP = {ast.ASTType.Program} | ({ast.ASTType.Comment} if hasattr(ast.ASTType, "Comment") else set())


def fail(check, msg):
    errors.append((check, msg))


def read_tsv(name):
    path = os.path.join(ROOT, name)
    lines = open(path, encoding="utf-8").read().splitlines()
    head = lines[0].split("\t")
    rows = []
    for n, line in enumerate(lines[1:], 2):
        if not line.strip():
            continue
        cells = line.split("\t")
        cells += [""] * (len(head) - len(cells))
        rows.append(dict(zip(head, cells), _line=n))
    return rows


# ------------------------------------------------------------------ prose

def check_prose():
    text = open(os.path.join(ROOT, "L0.md"), encoding="utf-8").read()
    paras = re.findall(r"^\*\*([A-Z]+[0-9]*\.[0-9]+)\*\*", text, re.M)
    inv = read_tsv("clauses.tsv")
    ids = [r["id"] for r in inv]
    if len(set(paras)) != len(paras):
        fail("prose", "duplicate paragraph ids in L0.md")
    if paras != ids:
        for p in set(paras) - set(ids):
            fail("prose", "paragraph %s has no inventory row" % p)
        for i in set(ids) - set(paras):
            fail("prose", "inventory row %s has no paragraph" % i)
        if set(paras) == set(ids):
            fail("prose", "inventory rows are not in document order")
    for r in inv:
        if r["status"] not in STATUSES:
            fail("prose", "%s: unknown status %r" % (r["id"], r["status"]))
        if r["status"] in ("procedural", "meta") and not r["enforcement"].strip():
            fail("prose", "%s: %s paragraph names no enforcement" % (r["id"], r["status"]))
    # paragraphs marked procedural in the prose are procedural in the inventory
    status = {r["id"]: r["status"] for r in inv}
    marked = dict(re.findall(r"^\*\*([A-Z]+[0-9]*\.[0-9]+)\*\* \*(Procedural|Parameters|Accepted cost)\.\*", text, re.M))
    for pid, st in status.items():
        want = {"Procedural": "procedural", "Parameters": "procedural", "Accepted cost": "cost"}.get(marked.get(pid))
        if want and st != want:
            fail("prose", "%s is marked %s in the prose but %s in the inventory" % (pid, marked[pid], st))
        if st == "cost" and marked.get(pid) != "Accepted cost":
            fail("prose", "%s is an accepted cost in the inventory but not marked so in the prose" % pid)
        if st == "procedural" and marked.get(pid) not in ("Procedural", "Parameters"):
            fail("prose", "%s is procedural in the inventory but not marked so in the prose" % pid)
    stripped = re.sub(r"`[^`]*`", "", text)
    for n, line in enumerate(stripped.splitlines(), 1):
        for m in NARRATIVE.finditer(line):
            fail("prose", "L0.md:%d: amendment narrative %r" % (n, m.group(0)))
    return inv


# ---------------------------------------------------------------- sources

def slug(h):
    return re.sub(r"[^a-z0-9]+", "-", h.lower()).strip("-")


def record_units():
    """Units: a bold identifier followed by a dash, the dedication, and each
    bold-led paragraph of an "Accepted costs" section. Sections: every `##`
    heading, with the units it holds."""
    units, sections = set(), {}
    for k, path in RECORDS.items():
        sec = None
        for line in open(path, encoding="utf-8"):
            m = re.match(r"^## (.*)$", line.rstrip("\n"))
            if m:
                sec = "%s:§%s" % (k, slug(m.group(1)))
                sections[sec] = set()
                continue
            unit = None
            m = re.match(r"^\*\*([A-Z]+[0-9]*) — ", line)
            if m:
                unit = "%s:%s" % (k, m.group(1))
            if line.startswith("**Dedication.**"):
                unit = "%s:Dedication" % k
            m = re.match(r"^\*\*(.+?)\*\*", line)
            if m and sec and sec.endswith("§accepted-costs"):
                unit = "%s/%s" % (sec, slug(m.group(1)))
            if unit:
                units.add(unit)
                if sec:
                    sections[sec].add(unit)
    return units, sections


def check_sources(inv):
    units, sections = record_units()
    used = set()
    for r in inv:
        toks = r["sources"].split()
        if not toks:
            fail("sources", "%s names no source" % r["id"])
        for t in toks:
            if t not in units and t not in sections:
                fail("sources", "%s: source %s is not a unit or section of the records" % (r["id"], t))
            used.add(t)
    unmapped = {r["unit"]: r["reason"] for r in read_tsv("unmapped.tsv")}
    for u, why in unmapped.items():
        if u not in units and u not in sections:
            fail("sources", "unmapped.tsv: %s is not a unit or section of the records" % u)
        if u in used:
            fail("sources", "unmapped.tsv: %s is also a source of a paragraph" % u)
        if not why.strip():
            fail("sources", "unmapped.tsv: %s gives no reason" % u)
    for u in sorted(units - used - set(unmapped)):
        fail("sources", "record unit %s is rendered by no paragraph and not listed as unmapped" % u)
    # every section is a source, holds a unit that is, or is listed as unmapped
    for sec, held in sorted(sections.items()):
        if sec not in used and sec not in unmapped and not (held & used):
            fail("sources", "record section %s is rendered by no paragraph and not listed as unmapped" % sec)
    return len(units) + len(sections), len(unmapped)


# ------------------------------------------------------------- parameters

def check_parameters(inv_ids, prog_files):
    text = open(os.path.join(ROOT, "L0.md"), encoding="utf-8").read()
    rows = read_tsv("parameters.tsv")
    ids = {}
    for r in rows:
        if r["parameter"] in ids:
            fail("parameters", "%s declared twice" % r["parameter"])
        ids[r["parameter"]] = r
        if r["clause"] not in inv_ids:
            fail("parameters", "%s: clause %s is not a paragraph of L0.md" % (r["parameter"], r["clause"]))
        if not r["protects"].strip():
            fail("parameters", "%s: names no protected party (C15)" % r["parameter"])
    for r in rows:
        for atom in r["floor"].strip().split(" & "):
            if not FLOOR.match(atom):
                fail("parameters", "%s: floor %r is outside the floor grammar" % (r["parameter"], atom))
                continue
            m = re.match(r"clause\((.+)\)", atom)
            if m and m.group(1) not in inv_ids:
                fail("parameters", "%s: floor names clause %s, not a paragraph of L0.md" % (r["parameter"], m.group(1)))
            for ref in re.findall(r"[a-z_]+", re.sub(r"clause\(.*\)|share\(D2\)", "", atom)):
                if ref not in KEYWORDS and ref not in ids:
                    fail("parameters", "%s: floor names undeclared parameter %s" % (r["parameter"], ref))
    declared_in = {r["clause"] for r in rows}
    for pid in re.findall(r"^\*\*([A-Z]+[0-9]*\.[0-9]+)\*\* \*Parameters\.\*", text, re.M):
        if pid not in declared_in:
            fail("parameters", "%s declares parameters and none is in parameters.tsv" % pid)
    for p in prog_files:
        for name in re.findall(r"param\(([a-z_]+),", open(p, encoding="utf-8").read()):
            if name not in ids:
                fail("parameters", "%s reads parameter %s, not in parameters.tsv" % (os.path.basename(p), name))
    return len(rows)


# --------------------------------------------------------------- manifest

def manifest_files():
    files = ["L0.md", "clauses.tsv", "unmapped.tsv", "vocabulary.tsv", "parameters.tsv"]
    files += sorted(os.path.relpath(p, ROOT) for p in glob.glob(os.path.join(ROOT, "program", "*.lp")))
    files += sorted(os.path.relpath(p, ROOT) for p in glob.glob(os.path.join(ROOT, "fixtures", "*.lp")))
    entries = [(f, os.path.join(ROOT, f)) for f in files]
    entries += [(os.path.relpath(p, ROOT), p) for p in RECORDS.values()]
    return entries


def digest(path):
    return hashlib.sha256(open(path, "rb").read()).hexdigest()


def build_manifest():
    entries = [{"path": rel, "sha256": digest(p)} for rel, p in manifest_files()]
    canon = "".join("%s  %s\n" % (e["sha256"], e["path"]) for e in entries)
    return {
        "object": "the L0 constitution as it stands, prose and program bound by clause",
        "digest_rule": "sha256 over the lines '<sha256>  <path>\\n' of the entries, in the order listed",
        "combined_sha256": hashlib.sha256(canon.encode()).hexdigest(),
        "entries": entries,
    }


def check_manifest():
    path = os.path.join(ROOT, "MANIFEST.json")
    want = build_manifest()
    try:
        have = json.load(open(path, encoding="utf-8"))
    except (OSError, ValueError) as e:
        fail("manifest", "MANIFEST.json unreadable: %s" % e)
        return want
    if have != want:
        hp = {e["path"]: e["sha256"] for e in have.get("entries", [])}
        for e in want["entries"]:
            if hp.get(e["path"]) != e["sha256"]:
                fail("manifest", "%s: digest differs from MANIFEST.json" % e["path"])
        for p in set(hp) - {e["path"] for e in want["entries"]}:
            fail("manifest", "%s listed in MANIFEST.json but not part of the constitution" % p)
        if have.get("combined_sha256") != want["combined_sha256"]:
            fail("manifest", "combined digest differs; run tools/check.sh --write-manifest after review")
    return want
