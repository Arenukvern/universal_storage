# Contributing

We welcome pull requests and issues on
[GitHub](https://github.com/Arenukvern/universal_storage).

**Before you open a PR**

1. Read [AGENTS.md](AGENTS.md) and [docs/NORTH_STAR.mdx](docs/NORTH_STAR.mdx).
2. Use [docs/start_here/docs_map.mdx](docs/start_here/docs_map.mdx) to find the
   canonical doc owner — avoid duplicating package READMEs at repo root.
3. Run the native validation gate:

```bash
dart pub get
dart analyze
bash tool/ci/test_packages.sh
```

Optional: `steward doctor --json` · `steward map`

**Durable contract changes** (public API, sync semantics, mesh invariants)
need an ADR under `docs/decisions/` or the package-local `docs/decisions/`
folder before merge. Classify `north_star_impact` per AGENTS.md.

## Community

- [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md)
- [SECURITY.md](SECURITY.md) — report vulnerabilities privately to
  anton@xsoulspace.dev

## Releases (release-please)

Per-package versions are managed by [release-please](https://github.com/googleapis/release-please)
on `main`:

- Config: [release-please-config.json](release-please-config.json)
- Manifest: [.release-please-manifest.json](.release-please-manifest.json)
- Workflow: [.github/workflows/release-please.yml](.github/workflows/release-please.yml)

Merging a release-please PR bumps `pubspec.yaml` / `CHANGELOG.md` for that
package and creates a tag `<package_name>-v<version>`.

Optional: set `RELEASE_PLEASE_TOKEN` if the default `GITHUB_TOKEN` lacks permission
to open release PRs.

## Package publishing (pub.dev)

Trusted publishing uses GitHub Actions OIDC — configure the `pub.dev` environment
and publisher on pub.dev before tag pushes publish for real.

- Workflow: [.github/workflows/pub_publish.yml](.github/workflows/pub_publish.yml)
- Local dry-run:

```bash
bash tool/release/publish_pub_package.sh --package-dir pkgs/universal_storage_interface
```

Manual dispatch in GitHub Actions can dry-run any package path.

## Related products

Computer-use automation lives in
[ai_computer_use_universal_automation](https://github.com/Arenukvern/ai_computer_use_universal_automation)
— not in this repo.
