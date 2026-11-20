# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0-dev.13](https://github.com/Arenukvern/universal_storage/compare/universal_storage_sync_utils-v0.1.0-dev.13...universal_storage_sync_utils-v1.0.0-dev.13) (2026-11-20)


### ⚠ BREAKING CHANGES

* **deps:** SDK floor raised from Dart 3.13 to Dart 3.14.

### Bug Fixes

* **deps:** require Dart ^3.14.0 and widen sibling deps ([4703d0c](https://github.com/Arenukvern/universal_storage/commit/4703d0ca57a5432d8ba598fce9f64cae2d1cd91c))

## [0.1.0-dev.13] - 2026-03-03

- split Flutter-specific folder picker/bookmark APIs into
  `universal_storage_sync_utils_flutter`
- package is now pure Dart only
- removed Flutter/plugin dependencies from this package

## [0.1.0-dev.12] - 2026-02-08

- chore: flutter removed

## [0.1.0-dev.11] - 2026-02-08

- chore:
  from_json_to_json: ^0.4.0
  universal_storage_interface: ^0.1.0-dev.10

## [0.1.0-dev.10] - 2025-10-27

- chore: update permission_handler dependency to 12.0.1

## [0.1.0-dev.9] - 2025-10-27

- removed dependency on `universal_storage_sync` package
- chore: update interface dependency to 0.1.0-dev.9

## [0.1.0-dev.8] - 2025-10-25

- added resolvePlatformDirectoryOfConfig function
- chore: interface package dependency to 0.1.0-dev.8

## [0.1.0-dev.7] - 2025-10-25

- replaced dart:io with universal_io
- added PickSuccess.filePathConfig getter
- chore: update interface dependency to 0.1.0-dev.7

## [0.1.0-dev.6] - 2025-10-18

- chore: from_json_to_json ^0.3.0

## [0.1.0-dev.5] - 2025-08-09

### Changed

- chore: update interface dependency to 0.1.0-dev.5

## [0.1.0-dev.4] - 2025-08-09

### Changed

- Stabilized APIs and prepared for initial public release
- Updated documentation and links for publication

## [0.1.0-dev.2] - 2025-06-27

- feat: moved `MacOSBookmark` to `sync` package.
- fixed: `pickWritableDirectory` now returns `Directory` instead of `FileSystemEntity`.

## [0.1.0-dev.1]

- Initial release.
