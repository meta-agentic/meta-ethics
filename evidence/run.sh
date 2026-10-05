#!/bin/sh
# Runs every experiment and records its output as <experiment>/output.txt.
#
#   ./run.sh            re-run everything and overwrite the recorded outputs
#   ./run.sh --check    re-run everything and compare with the recorded outputs;
#                       exit 1 on any difference
#   ./run.sh --check draw exclusion    the same, for the named experiments only
#
# Needs python3 (the recorded runs used 3.14). A local virtual environment with
# the pinned solver (requirements.txt) is created in .venv on first use; set
# PYTHON to an interpreter that already has clingo to skip that.
set -e
cd "$(dirname "$0")"
MODE=record
if [ "$1" = "--check" ]; then MODE=check; shift; fi
if [ -z "$PYTHON" ]; then
  if [ ! -x .venv/bin/python ]; then
    python3 -m venv .venv
    .venv/bin/pip install -q -r requirements.txt
  fi
  PYTHON="$(pwd)/.venv/bin/python"
fi
export PYTHON
EXPERIMENTS="$*"
[ -n "$EXPERIMENTS" ] || EXPERIMENTS="appendix-fixtures reference-shapes keyed-views bundle-replay reply-credential exclusion argumentation owed-acts correctability-games coordination draw witness-fork configuration-check superset"
status=0
for e in $EXPERIMENTS; do
  if [ "$MODE" = record ]; then
    ./"$e"/run.sh > "$e"/output.txt 2>&1 || { echo "FAIL     $e (exit $?)"; status=1; continue; }
    echo "recorded $e/output.txt"
  else
    tmp="$(mktemp)"
    ./"$e"/run.sh > "$tmp" 2>&1 || { echo "FAIL     $e (exit $?)"; status=1; }
    if diff -u "$e"/output.txt "$tmp" > /dev/null; then
      echo "same     $e"
    else
      echo "DIFFERS  $e"; diff -u "$e"/output.txt "$tmp" | head -40; status=1
    fi
    rm -f "$tmp"
  fi
done
exit $status
