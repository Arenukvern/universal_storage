#!/usr/bin/env bash
# Prove sibling-repo consumption: eight direct git deps + closure overrides resolve.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
SCRATCH="$(mktemp -d)"
trap 'rm -rf "$SCRATCH"' EXIT

REF="${GIT_CONSUMER_REF:-HEAD}"
if [[ -n "${GITHUB_SHA:-}" ]]; then
  REF="${GITHUB_SHA}"
fi

if [[ -n "${GIT_CONSUMER_REPO:-}" ]]; then
  REPO="${GIT_CONSUMER_REPO}"
else
  REPO="file://${ROOT}"
fi

GIT_URL="${REPO}"
if [[ "${GIT_URL}" != file://* ]]; then
  GIT_URL="${GIT_URL%.git}"
fi

SIBLING_PKGS=(
  universal_storage_chunks
  universal_storage_convergence
  universal_storage_interface
  universal_storage_local_db
  universal_storage_mesh
  universal_storage_mesh_transport
  universal_storage_sync
  universal_storage_world
)
CLOSURE_PKGS=(
  universal_storage_convergence_session
)

git_block() {
  local pkg="$1"
  cat <<EOF
    git:
      url: ${GIT_URL}
      path: pkgs/${pkg}
      ref: ${REF}
EOF
}

{
  echo "name: us_git_consumer_ci_scratch"
  echo "publish_to: none"
  echo "environment:"
  echo "  sdk: ^3.13.0"
  echo "dependencies:"
  for pkg in "${SIBLING_PKGS[@]}"; do
    echo "  ${pkg}:"
    git_block "${pkg}"
  done
  echo "dependency_overrides:"
  for pkg in "${SIBLING_PKGS[@]}" "${CLOSURE_PKGS[@]}"; do
    echo "  ${pkg}:"
    git_block "${pkg}"
  done
} > "${SCRATCH}/pubspec.yaml"

cd "${SCRATCH}"
if command -v flutter >/dev/null 2>&1; then
  flutter pub get
else
  dart pub get
fi

echo "git_consumer_resolution: ok (ref=${REF})"
