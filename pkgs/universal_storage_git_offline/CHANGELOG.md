# Changelog

## Unreleased

### Added

- feat: `GitCommitBatching` policy — batched commits make writes ~3x faster
  (write p50 ~150ms → ~46ms); flush points before sync, restore, and
  dispose; see README for tradeoffs.
- feat: reentrant git operation lock serializes all git commands.

### Fixed

- fix: merge pull uses `--allow-unrelated-histories`.
- fix: sync without a configured remote is a graceful no-op instead of
  throwing.
- fix: `listDirectory` returns names relative to the queried directory.
- fix: trailing-slash / leading-slash paths are normalized to the same
  object as their canonical form.

## [1.0.0](https://github.com/Arenukvern/universal_storage/compare/universal_storage_git_offline-v0.1.0...universal_storage_git_offline-v1.0.0) (2026-11-21)


### ⚠ BREAKING CHANGES

* **deps:** SDK floor raised from Dart 3.13 to Dart 3.14.

### Bug Fixes

* **deps:** require Dart ^3.14.0 and widen sibling deps ([4703d0c](https://github.com/Arenukvern/universal_storage/commit/4703d0ca57a5432d8ba598fce9f64cae2d1cd91c))

## 0.1.0-dev.3

- Added package documentation for publication readiness.
