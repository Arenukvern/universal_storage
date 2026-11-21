# Changelog

## [1.0.0](https://github.com/Arenukvern/universal_storage/compare/universal_storage_conformance-v0.1.0...universal_storage_conformance-v1.0.0) (2026-11-21)


### ⚠ BREAKING CHANGES

* **deps:** SDK floor raised from Dart 3.13 to Dart 3.14; sibling
  constraints widened to the `^1.0.0` generation.

## 0.1.0-dev.1

- Initial version: shared behavioral conformance suite for Universal Storage
  backends (`storageProviderConformanceTests`).
- Adopted by filesystem, local_db, git_offline, github_api (in-process fake
  API), and cloudkit (fake bridge) test suites.
