# Changelog

## Unreleased (0.1.0-dev.3)

### Breaking changes

- **Hard cut**: GitHub implementation moved out to the new
  `universal_storage_github_oauth` package. This package is now
  contracts-only: `OAuthProvider`, `OAuthFlowDelegate`, models,
  and credential storage.
  - Removed: `GitHubOAuthProvider`, `GitHubRepositoryService`,
    `StoredCredentials.fromOauth2Credentials`, the
    `example/basic_oauth_example.dart` example.
  - Removed dependencies: `github`, `oauth2`, `oauth2_client`, `http`.
  - Migration: depend on `universal_storage_github_oauth` instead; it
    re-exports all contracts and provides a device-flow-first provider.

## [1.0.0](https://github.com/Arenukvern/universal_storage/compare/universal_storage_oauth-v0.1.0...universal_storage_oauth-v1.0.0) (2026-11-21)


### ⚠ BREAKING CHANGES

* **deps:** SDK floor raised from Dart 3.13 to Dart 3.14.

### Bug Fixes

* **deps:** require Dart ^3.14.0 and widen sibling deps ([4703d0c](https://github.com/Arenukvern/universal_storage/commit/4703d0ca57a5432d8ba598fce9f64cae2d1cd91c))

## 0.1.0-dev.2

- Added package documentation for publication readiness.
