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

## Releases (dart_changesets)

Per-package versions are managed by [dart_changesets](https://github.com/Arenukvern/dart_changesets)
intent files on `main`:

- Intents: `.changesets/*.md` — one file per release intent
- Config: [changesets.yaml](changesets.yaml)
- Train workflow: [.github/workflows/dart_changesets.yml](.github/workflows/dart_changesets.yml)
- Publish workflow (per tag): [.github/workflows/pub_publish.yml](.github/workflows/pub_publish.yml)

Open a PR with an intent file:

```markdown
---
'universal_storage_sync': patch
---

What changed, as changelog prose.
```

Merging it to `main` makes the train open/update the `chore: version packages`
PR (version bumps + dependent-constraint cascades + changelogs). Merging THAT
PR (use **squash** — the release leg detects the merge by the commit subject)
pushes one `<package_name>-v<version>` tag per release; each tag runs the
publish workflow.

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
