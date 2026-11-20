# Changelog

## [1.0.0-dev.1](https://github.com/Arenukvern/universal_storage/compare/universal_storage_github_oauth-v0.1.0-dev.1...universal_storage_github_oauth-v1.0.0-dev.1) (2026-11-20)


### ⚠ BREAKING CHANGES

* **deps:** SDK floor raised from Dart 3.13 to Dart 3.14.

### Bug Fixes

* **deps:** require Dart ^3.14.0 and widen sibling deps ([4703d0c](https://github.com/Arenukvern/universal_storage/commit/4703d0ca57a5432d8ba598fce9f64cae2d1cd91c))

## 0.1.0-dev.1

- Initial version: GitHub OAuth for Universal Storage, device-flow-first.
- `GithubDeviceFlowAuthProvider`: OAuth Device Flow (no deep links,
  loopback servers, or client secret); configurable
  device-code/token/API endpoints for web proxies and GHES.
- `DefaultDeviceFlowDelegate`: ready-made UI delegate (`url_launcher` +
  copyable one-time code dialog).
- `GitHubRepositoryService`: repository management via the `github`
  package, authenticated with the stored token.
