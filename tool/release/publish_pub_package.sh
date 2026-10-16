#!/usr/bin/env bash
# Publish one workspace package to pub.dev (dry-run by default).
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$ROOT"

execute=false
skip_existing=false
pkg_dir=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --execute) execute=true ;;
    --skip-existing) skip_existing=true ;;
    --package-dir)
      pkg_dir="$2"
      shift
      ;;
    *) echo "Unknown arg: $1" >&2; exit 1 ;;
  esac
  shift
done

if [[ -z "$pkg_dir" ]]; then
  echo "--package-dir pkgs/<name> is required" >&2
  exit 1
fi

dart pub get
(
  cd "$pkg_dir"
  if $execute; then
    if $skip_existing; then
      if ! dart pub publish -f 2>&1 | tee /tmp/pub_publish.log; then
        if grep -qiE 'version already exists|already published' /tmp/pub_publish.log; then
          echo "Skip: version already on pub.dev"
          exit 0
        fi
        exit 1
      fi
    else
      dart pub publish -f
    fi
  else
    dart pub publish --dry-run || {
      code=$?
      # Pub uses exit 65 for validation warnings (e.g. changelog nits).
      if [[ "$code" == "65" ]]; then
        exit 0
      fi
      exit "$code"
    }
  fi
)
