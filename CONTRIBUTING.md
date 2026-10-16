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

## Package publishing

Packages are versioned independently under `pkgs/`. Before publishing:

```bash
cd pkgs/<package>
dart pub publish --dry-run
```

CI runs dry-run on core packages on every PR. Changelog entries belong in the
package `CHANGELOG.md` (and the repo [CHANGELOG.md](CHANGELOG.md) for monorepo
tooling changes).

## Related products

Computer-use automation lives in
[ai_computer_use_universal_automation](https://github.com/Arenukvern/ai_computer_use_universal_automation)
— not in this repo.
