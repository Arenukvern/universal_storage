## Unreleased

### Breaking changes

- **Sync semantics changed**: `sync()` now throws
  `UnsupportedOperationException` instead of silently no-oping; local_db is
  a local-only backend.

## [1.0.0](https://github.com/Arenukvern/universal_storage/compare/universal_storage_local_db-v0.1.0...universal_storage_local_db-v1.0.0) (2026-11-21)


### ⚠ BREAKING CHANGES

* **deps:** SDK floor raised from Dart 3.13 to Dart 3.14.

### Bug Fixes

* **deps:** require Dart ^3.14.0 and widen sibling deps ([4703d0c](https://github.com/Arenukvern/universal_storage/commit/4703d0ca57a5432d8ba598fce9f64cae2d1cd91c))

## 0.1.0-dev.1

- Add `LocalDbStorageProvider` implementing `StorageProvider` + `LocalEngine`.
- Add `LocalDbStorageConfig` with keyspace prefixing support.
- Add provider unit tests for CRUD, listing, and keyspace isolation.
