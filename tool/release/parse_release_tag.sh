#!/usr/bin/env bash
# Parse release-please component tags: <package_name>-v<semver>
# Example: universal_storage_sync-v0.1.0-dev.13
set -euo pipefail

tag="${1:?tag required}"
tag="${tag#refs/tags/}"

if [[ "$tag" =~ ^(.+)-v(.+)$ ]]; then
  component="${BASH_REMATCH[1]}"
  version="${BASH_REMATCH[2]}"
else
  echo "Unrecognized tag format: $tag" >&2
  exit 1
fi

pkg_dir="pkgs/${component}"
if [[ ! -f "${pkg_dir}/pubspec.yaml" ]]; then
  echo "No pubspec at ${pkg_dir}/pubspec.yaml for component ${component}" >&2
  exit 1
fi

echo "component=${component}"
echo "version=${version}"
echo "pkg_dir=${pkg_dir}"
