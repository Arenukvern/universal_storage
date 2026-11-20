# Changelog

## [1.0.0-dev.1](https://github.com/Arenukvern/universal_storage/compare/universal_storage_conformance-v0.1.0-dev.1...universal_storage_conformance-v1.0.0-dev.1) (2026-11-20)


### ⚠ BREAKING CHANGES

* **deps:** SDK floor raised from Dart 3.13 to Dart 3.14.

### Bug Fixes

* **deps:** require Dart ^3.14.0 and widen sibling deps ([4703d0c](https://github.com/Arenukvern/universal_storage/commit/4703d0ca57a5432d8ba598fce9f64cae2d1cd91c))

## 0.1.0-dev.1

- Initial version: shared behavioral conformance suite for Universal Storage
  backends (`storageProviderConformanceTests`).
- Adopted by filesystem, local_db, git_offline, github_api (in-process fake
  API), and cloudkit (fake bridge) test suites.
