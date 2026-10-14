# Contributing

Private until an explicit public cut. MIT; pub.dev-ready packages.

```sh
dart pub get
steward doctor --json
steward map
dart analyze pkgs/universal_storage_interface
```

Stewardship mirrors [mcp_flutter](https://github.com/Arenukvern/mcp_flutter):
doctor → map → validate → ADRs for durable contract changes.

Computer-use automation is a **sibling** product:
[`ai_computer_use_universal_automation`](https://github.com/Arenukvern/ai_computer_use_universal_automation).
