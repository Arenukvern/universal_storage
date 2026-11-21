# Changelog

All notable changes to this project will be documented in this file.

## [1.0.0](https://github.com/Arenukvern/universal_storage/compare/universal_storage_cloudkit-v0.1.0...universal_storage_cloudkit-v1.0.0) (2026-11-21)


### ⚠ BREAKING CHANGES

* **deps:** SDK floor raised from Dart 3.13 to Dart 3.14.

### Bug Fixes

* **deps:** require Dart ^3.14.0 and widen sibling deps ([4703d0c](https://github.com/Arenukvern/universal_storage/commit/4703d0ca57a5432d8ba598fce9f64cae2d1cd91c))

## 0.1.0-dev.1 - 2026-03-03

- Initial CloudKit provider package.
- Added `CloudKitStorageProvider` with `remoteOnly` and `localMirror` modes.
- Added fallback provider delegation for unsupported/failed CloudKit init.
- Added `registerUniversalStorageCloudKit()` helper for provider registry wiring.
- Fixed local-mirror conflict behavior for `clientAlwaysRight` and
  `lastWriteWins` to force expected push reconciliation.
- Added safer mirror-state persistence fallback (no delete-before-rename).
- Auto-registers web bridge in `registerUniversalStorageCloudKit()` when
  running on web and no explicit bridge is provided.
- Replaced runtime dependency on `universal_storage_filesystem` with internal
  local mirror store implementation to keep CloudKit runtime dependency graph
  Dart-only.
