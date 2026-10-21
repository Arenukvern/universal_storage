#!/usr/bin/env bash
# Guard against stale monorepo path overrides and forbidden clone-only deps.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

fail=0

if rg -n 'path:\s*\.\./(\.\./)*(storage_problem|dart_flutter_packages)' pubspec.yaml pkgs --glob '**/pubspec.yaml' 2>/dev/null; then
  echo "clone_guard: forbidden path override detected" >&2
  fail=1
fi

if rg -n 'xsoulspace/universal_storage_sync' pkgs --glob '**/pubspec.yaml' 2>/dev/null; then
  echo "clone_guard: stale xsoulspace GitHub URL detected" >&2
  fail=1
fi

if rg -n 'path:\s*/Users/' pubspec.yaml pkgs --glob '**/pubspec.yaml' 2>/dev/null; then
  echo "clone_guard: absolute macOS path override detected" >&2
  fail=1
fi

if rg -n 'path:\s*/' pubspec.yaml pkgs --glob '**/pubspec.yaml' 2>/dev/null | rg -v 'path:\s*\.\.' 2>/dev/null; then
  echo "clone_guard: absolute path: dependency detected" >&2
  fail=1
fi

if [[ "$fail" -ne 0 ]]; then
  exit 1
fi

echo "clone_guard: ok"
