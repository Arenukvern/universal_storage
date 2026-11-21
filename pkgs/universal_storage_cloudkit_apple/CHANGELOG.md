# Changelog

All notable changes to this project will be documented in this file.

## [1.0.0](https://github.com/Arenukvern/universal_storage/compare/universal_storage_cloudkit_apple-v0.1.0...universal_storage_cloudkit_apple-v1.0.0) (2026-11-21)


### ⚠ BREAKING CHANGES

* **deps:** SDK floor raised from Dart 3.13 to Dart 3.14.

### Bug Fixes

* **deps:** require Dart ^3.14.0 and widen sibling deps ([4703d0c](https://github.com/Arenukvern/universal_storage/commit/4703d0ca57a5432d8ba598fce9f64cae2d1cd91c))

## 0.1.0-dev.1 - 2026-03-03

- Initial Apple CloudKit bridge package.
- Added typed Pigeon bridge implementation and registration helper.
- Implemented iOS/macOS CloudKit private-database operations:
  zone bootstrap, CRUD, prefix query, zone-change fetch, and token
  encode/decode.
- Added CKError to bridge-error code mapping for auth/network/conflict/not-found.
- Added persistent recordName-to-path cache for deletion path reconstruction in
  zone deltas.
- Refactored token codec + CKError mapping into shared Apple support utilities.
- Added Swift unit tests (SwiftPM) for token codec validation and CKError
  mapping behavior, including partial-failure nested error handling.
