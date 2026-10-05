#!/bin/sh
# Prints this experiment's run to stdout; ../run.sh records it as output.txt.
# PYTHON must have clingo importable when a step needs it (../run.sh sets it).
set -e
cd "$(dirname "$0")"
PYTHON="${PYTHON:-python3}"
"$PYTHON" ../checker/check.py .
echo
echo "symmetry_check.py (renaming two judges in sameness.lp)"
"$PYTHON" symmetry_check.py
