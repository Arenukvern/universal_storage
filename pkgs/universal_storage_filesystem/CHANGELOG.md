# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Unreleased

## [1.0.0-dev.12](https://github.com/Arenukvern/universal_storage/compare/universal_storage_filesystem-v0.1.0-dev.12...universal_storage_filesystem-v1.0.0-dev.12) (2026-11-20)


### ⚠ BREAKING CHANGES

* **deps:** SDK floor raised from Dart 3.13 to Dart 3.14.

### Bug Fixes

* **deps:** require Dart ^3.14.0 and widen sibling deps ([4703d0c](https://github.com/Arenukvern/universal_storage/commit/4703d0ca57a5432d8ba598fce9f64cae2d1cd91c))

## [0.1.0-dev.12] - 2026-03-03

### Fixed

- fix: `listDirectory` returns names relative to the queried directory.
- fix: trailing-slash / leading-slash paths are normalized to the same
  object as their canonical form.

- decouple from `universal_storage_sync_utils` to remove Flutter-transitive deps
- add injectable `FileSystemPathAccess` API for custom path resolution/release
- add `DefaultFileSystemPathAccess` and `CallbackFileSystemPathAccess`

## [0.1.0-dev.11] - 2026-02-08

- sdk: ^3.13.0
- universal_io: ^2.3.1
- no flutter dep
- universal_storage_interface: ^0.1.0-dev.10
- universal_storage_sync_utils: ^0.1.0-dev.12

## [0.1.0-dev.10] - 2025-10-27

- chore: update sync utils dependency to 0.1.0-dev.10

## [0.1.0-dev.9] - 2025-10-27

- chore: update interface dependency to 0.1.0-dev.9

## [0.1.0-dev.8] - 2025-10-26

- chore: update interface dependency to 0.1.0-dev.8

## [0.1.0-dev.7] - 2025-10-25

- chore: update interface dependency to 0.1.0-dev.7

## [0.1.0-dev.5] - 2025-08-09

### Changed

- chore: update interface dependency to 0.1.0-dev.5

## [0.1.0-dev.4] - 2025-08-09

### Added

- Initial public release of filesystem storage provider
- Implements `StorageProvider` for local filesystem
- Automatic parent directory creation
- Cross-platform path handling

### Notes

- Not supported on web
