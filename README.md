<div align="center">

<img src="docs/assets/universal-storage-logo.svg" width="96" alt="Universal Storage logo" />

# Universal Storage

_Your data outlives your storage._ — provider-agnostic Dart storage: one kernel,
many backends (filesystem, git, GitHub API, CloudKit, mesh, live apply).

[![CI](https://github.com/Arenukvern/universal_storage/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/Arenukvern/universal_storage/actions/workflows/ci.yml)
[![Steward validate](https://github.com/Arenukvern/universal_storage/actions/workflows/steward.yml/badge.svg?branch=main)](https://github.com/Arenukvern/universal_storage/actions/workflows/steward.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Dart](https://img.shields.io/badge/Dart-%3E%3D3.13-blue.svg)](https://dart.dev)
[![Principles](https://img.shields.io/badge/ethics-principles%20%26%20care-6b4fa0)](docs/PRINCIPLES.mdx)
[![maintained with Skill Steward](https://raw.githubusercontent.com/Arenukvern/skill_steward/main/docs/brand/assets/svg/badge-light.svg)](https://github.com/Arenukvern/skill_steward)
[![All Contributors](https://img.shields.io/github/all-contributors/Arenukvern/universal_storage?color=ee8449&style=flat-square)](#contributors)

</div>

- 📖 **Docs:** [docs.page/arenukvern/universal_storage](https://docs.page/arenukvern/universal_storage) (enable after public cut — see [docs.json](docs.json))
- 🤝 **Contribute:** [CONTRIBUTING.md](CONTRIBUTING.md) · [code of conduct](CODE_OF_CONDUCT.md) · [security](SECURITY.md)
- 🧭 **Charter:** [docs/NORTH_STAR.mdx](docs/NORTH_STAR.mdx) · [principles](docs/PRINCIPLES.mdx) · **Agents:** [AGENTS.md](AGENTS.md)

**Different product** from computer-use automation
([ai_computer_use_universal_automation](https://github.com/Arenukvern/ai_computer_use_universal_automation)).

Extracted from `dart_flutter_packages` on **2026-10-14**. Packages are **MIT**
and prepared for [pub.dev](https://pub.dev) during the `0.1.0-dev` alpha.

## Get started in 3 steps

```bash
git clone https://github.com/Arenukvern/universal_storage.git
cd universal_storage
dart pub get
```

```yaml
# pubspec.yaml (consumer)
dependencies:
  universal_storage_sync: ^0.1.0-dev.12
  universal_storage_filesystem: ^0.1.0-dev.12
```

```dart
import 'package:universal_storage_filesystem/universal_storage_filesystem.dart';
import 'package:universal_storage_sync/universal_storage_sync.dart';

Future<void> main() async {
  StorageProviderRegistry.register<FileSystemConfig>(
    () => FileSystemStorageProvider(),
  );
  final storage = await StorageFactory.create(
    FileSystemConfig(
      filePathConfig: FilePathConfig({'path': '/tmp/us-demo'}),
    ),
  );
  await storage.saveFile('hello.txt', 'Hello');
  print(await storage.readFile('hello.txt'));
}
```

Full walkthrough: [pkgs/universal_storage_sync/README.md](pkgs/universal_storage_sync/README.md).

## Validate locally

```bash
dart analyze
bash tool/ci/test_packages.sh
```

Skill Steward desk (optional): `steward doctor --json` · `steward map`

## Published packages (workspace)

| Package | Role |
| --- | --- |
| [`universal_storage_interface`](pkgs/universal_storage_interface/) | Core contracts, models, capabilities |
| [`universal_storage_sync`](pkgs/universal_storage_sync/) | Registry, kernel, profiles, migrations, outbox |
| [`universal_storage_conformance`](pkgs/universal_storage_conformance/) | Shared behavioral suite for backends |
| [`universal_storage_filesystem`](pkgs/universal_storage_filesystem/) | Local filesystem provider |
| [`universal_storage_local_db`](pkgs/universal_storage_local_db/) | Key-value local DB provider |
| [`universal_storage_db`](pkgs/universal_storage_db/) | DB adapter helpers |
| [`universal_storage_git_offline`](pkgs/universal_storage_git_offline/) | Offline git-backed provider |
| [`universal_storage_github_api`](pkgs/universal_storage_github_api/) | GitHub Contents API provider |
| [`universal_storage_oauth`](pkgs/universal_storage_oauth/) | OAuth contracts + credential storage |
| [`universal_storage_github_oauth`](pkgs/universal_storage_github_oauth/) | GitHub device-flow OAuth implementation |
| [`universal_storage_cloudkit`](pkgs/universal_storage_cloudkit/) | CloudKit facade |
| [`universal_storage_cloudkit_apple`](pkgs/universal_storage_cloudkit_apple/) | Apple platform CloudKit plugin |
| [`universal_storage_cloudkit_web`](pkgs/universal_storage_cloudkit_web/) | Web CloudKit bridge |
| [`universal_storage_cloudkit_platform_interface`](pkgs/universal_storage_cloudkit_platform_interface/) | CloudKit platform interface |
| [`universal_storage_convergence`](pkgs/universal_storage_convergence/) | Merge / HLC convergence |
| [`universal_storage_convergence_session`](pkgs/universal_storage_convergence_session/) | Session deltas for convergence |
| [`universal_storage_chunks`](pkgs/universal_storage_chunks/) | Chunk store for mesh transfers |
| [`universal_storage_mesh`](pkgs/universal_storage_mesh/) | Serverless P2P mesh provider |
| [`universal_storage_mesh_transport`](pkgs/universal_storage_mesh_transport/) | Mesh transport seam |
| [`universal_storage_world`](pkgs/universal_storage_world/) | World / zone catalog models |
| [`universal_storage_realtime`](pkgs/universal_storage_realtime/) | Realtime event helpers |
| [`universal_storage_session_aead`](pkgs/universal_storage_session_aead/) | Session AEAD handshake utilities |
| [`universal_storage_live_apply`](pkgs/universal_storage_live_apply/) | Live-apply mutation windows |
| [`universal_storage_sync_utils`](pkgs/universal_storage_sync_utils/) | Pure-Dart profile/migration utilities |
| [`universal_storage_sync_utils_flutter`](pkgs/universal_storage_sync_utils_flutter/) | Flutter folder picker + bookmarks |

Examples: [todo_file_app](pkgs/universal_storage_sync/example/todo_file_app/),
[mesh_pairing_app](pkgs/universal_storage_mesh/example/mesh_pairing_app/).

## Documentation layout

| Doc | Purpose |
| --- | --- |
| [docs/NORTH_STAR.mdx](docs/NORTH_STAR.mdx) | Charter and boundaries |
| [docs/DESIGN_FAQ.mdx](docs/DESIGN_FAQ.mdx) | Why the split looks this way |
| [docs/DX_FAQ.mdx](docs/DX_FAQ.mdx) | Commands, publish, security |
| [docs/start_here/docs_map.mdx](docs/start_here/docs_map.mdx) | Canonical doc owners |
| [pkgs/universal_storage_docs/BLOCKERS_NEXT.md](pkgs/universal_storage_docs/BLOCKERS_NEXT.md) | Release blockers ledger |

## How this fits sibling repos

| Project | Role |
| --- | --- |
| **Universal Storage** (this repo) | Storage kernel + swappable backends |
| **[mcp_flutter](https://github.com/Arenukvern/mcp_flutter)** | Flutter MCP / automation harness |
| **[skill_steward](https://github.com/Arenukvern/skill_steward)** | Engineering stewardship for agent-operated repos |

Stewardship patterns (AGENTS.md, `steward.yaml`, validation gates) follow the
same OSS shape as `mcp_flutter`.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md). Pull requests and issues:
[GitHub](https://github.com/Arenukvern/universal_storage).

## Contributors

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tbody>
    <tr>
      <td align="center" valign="top" width="14.28%"><a href="https://xsoulspace.dev"><img src="https://avatars.githubusercontent.com/u/15068151?v=4?s=100" width="100px;" alt="Anton Malofeev"/><br /><sub><b>Anton Malofeev</b></sub></a><br /><a href="https://github.com/Arenukvern/universal_storage/commits?author=Arenukvern" title="Code">💻</a> <a href="https://github.com/Arenukvern/universal_storage/commits?author=Arenukvern" title="Documentation">📖</a> <a href="https://github.com/Arenukvern/universal_storage/commits?author=Arenukvern" title="Maintenance">🚧</a> <a href="#ideas-Arenukvern" title="Ideas, Planning, & Feedback">🤔</a></td>
    </tr>
  </tbody>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

Credit via [all-contributors](https://allcontributors.org/) — update
[`.all-contributorsrc`](.all-contributorsrc) and regenerate this table.

## License

[MIT](LICENSE)
