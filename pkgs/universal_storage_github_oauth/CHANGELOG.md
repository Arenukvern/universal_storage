# Changelog

## [1.0.0](https://github.com/Arenukvern/universal_storage/compare/universal_storage_github_oauth-v0.1.0...universal_storage_github_oauth-v1.0.0) (2026-11-21)


### ⚠ BREAKING CHANGES

* **deps:** SDK floor raised from Dart 3.13 to Dart 3.14; sibling
  constraints widened to the `^1.0.0` generation.

## 0.1.0-dev.1

- Initial version: GitHub OAuth for Universal Storage, device-flow-first.
- `GithubDeviceFlowAuthProvider`: OAuth Device Flow (no deep links,
  loopback servers, or client secret); configurable
  device-code/token/API endpoints for web proxies and GHES.
- `DefaultDeviceFlowDelegate`: ready-made UI delegate (`url_launcher` +
  copyable one-time code dialog).
- `GitHubRepositoryService`: repository management via the `github`
  package, authenticated with the stored token.
