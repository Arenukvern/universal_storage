# Changelog

All notable changes to this repository are documented here. Individual packages
also carry their own `CHANGELOG.md` under `pkgs/<name>/`.

## Unreleased

### Repository (OSS follow-up)

- release-please per-package config + manifest + GitHub Action.
- Workflows: steward validate, pub.dev publish (OIDC-ready `pub.dev` environment).
- all-contributors (`.all-contributorsrc`, README table), project logo SVG,
  [docs/PRINCIPLES.mdx](docs/PRINCIPLES.mdx), rewritten [docs/NORTH_STAR.mdx](docs/NORTH_STAR.mdx).
- `skills.json` pins Skill Steward governance / release skills.

### Repository

- Prepare public open-source release: workspace `pubspec.yaml` lists all
  packages explicitly; CI runs `dart analyze`, per-package tests, and pub dry-run
  on core packages.
- Normalize GitHub metadata to `Arenukvern/universal_storage` (replacing stale
  `xsoulspace/universal_storage_sync` and `xsoulspace/universal_storage_db`
  URLs that pointed at non-existent remotes).
- Add community files aligned with sibling repos (`CODE_OF_CONDUCT`,
  `CONTRIBUTING`, docs map, `docs.page` config).
- Document package split: GitHub OAuth implementation lives in
  `universal_storage_github_oauth`; Flutter picker utilities in
  `universal_storage_sync_utils_flutter`.

### Packages (high level)

See per-package changelogs for breaking changes during the `0.1.0-dev`
alpha. The sync kernel, conformance suite, mesh transport, and live_apply
packages are the primary integration surfaces.
