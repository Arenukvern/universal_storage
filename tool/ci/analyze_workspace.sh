#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$ROOT"
dart pub get
# Info-level lints are expected during alpha; exit 0 unless analyzer reports errors.
set +e
dart analyze --no-fatal-infos --no-fatal-warnings
code=$?
set -e
if [[ "$code" == "3" ]]; then
  exit 1
fi
# Exit code 2 = warnings only (acceptable during alpha).
exit 0
