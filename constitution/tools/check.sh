#!/bin/sh
# Runs every mechanical check of the consolidated L0 (tools/check.py).
#
#   tools/check.sh                    run the checks; exit 1 on any failure
#   tools/check.sh --write-manifest   recompute MANIFEST.json, then run them
#
# A local virtual environment with the pinned solver (requirements.txt) is
# created in .venv on first use, as evidence/run.sh does; set PYTHON to an
# interpreter that already has clingo to skip that.
set -e
cd "$(dirname "$0")/.."
if [ -z "$PYTHON" ]; then
  if [ ! -x .venv/bin/python ]; then
    python3 -m venv .venv
    .venv/bin/pip install -q -r tools/requirements.txt
  fi
  PYTHON="$(pwd)/.venv/bin/python"
fi
exec "$PYTHON" tools/check.py "$@"
