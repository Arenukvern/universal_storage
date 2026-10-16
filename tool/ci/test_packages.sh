#!/usr/bin/env bash
# Run unit tests for every workspace package that has a test/ directory.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$ROOT"

export PATH="${PATH:-}"

needs_flutter_test() {
  local pkg_dir="$1"
  if grep -qE '^\s*flutter:\s*$|sdk:\s*flutter' "$pkg_dir/pubspec.yaml" 2>/dev/null; then
    return 0
  fi
  if grep -qE 'xsoulspace_foundation|flutter_' "$pkg_dir/pubspec.yaml" 2>/dev/null; then
    return 0
  fi
  return 1
}

for pkg_dir in pkgs/*/; do
  [[ -d "${pkg_dir}test" ]] || continue
  name="$(basename "$pkg_dir")"
  echo "=== $name ==="
  if needs_flutter_test "$pkg_dir"; then
    if [[ "$name" == "universal_storage_sync" ]]; then
      # Git-heavy benchmarks are informational; keep CI under default timeouts.
      (cd "$pkg_dir" && flutter test \
        $(find test -name '*_test.dart' ! -name 'migration_benchmarks_test.dart') \
        -r compact)
    else
      (cd "$pkg_dir" && flutter test -r compact)
    fi
    elif [[ "$name" == "universal_storage_git_offline" ]]; then
      (cd "$pkg_dir" && dart test --concurrency=1 -r compact)
    else
      (cd "$pkg_dir" && dart test -r compact)
    fi
done
