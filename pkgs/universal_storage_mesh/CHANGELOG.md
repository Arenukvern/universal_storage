## 0.1.0-dev.2 (unreleased)

- **Fix (ADR 0031 §3): presence is no longer dead on the host.** Pairing
  is asymmetric in v1 (host advertises, peer accepts), so the host never
  learned the peer's identity key and dropped the peer's signed frames.
  `MeshFrameSigner` now publishes its public identity key as a
  payload-only ride-along (`kIdentityKeyPayloadKey`), and
  `MeshFrameAuthenticator` gains the v1 relay-owned TOFU trust model
  with key pinning: an unknown peer's first verifiable signed frame
  binds `peerId → key`, registers the peer record (persisting with the
  replica when a `MeshPeerRegistry` is attached — file under `dart:io`,
  `localStorage` on web), and folds; any later frame from that peerId
  with a different key is rejected as named data. Pre-shared (paired)
  keys always take precedence; TOFU never overwrites a pin. Set
  `trustOnFirstUse: false` to restore the strict pre-shared-only
  posture.

## [1.0.0-dev.1](https://github.com/Arenukvern/universal_storage/compare/universal_storage_mesh-v0.1.0-dev.1...universal_storage_mesh-v1.0.0-dev.1) (2026-11-20)


### ⚠ BREAKING CHANGES

* **deps:** SDK floor raised from Dart 3.13 to Dart 3.14.

### Bug Fixes

* **deps:** require Dart ^3.14.0 and widen sibling deps ([4703d0c](https://github.com/Arenukvern/universal_storage/commit/4703d0ca57a5432d8ba598fce9f64cae2d1cd91c))

## 0.1.0-dev.1

- Initial development release.
