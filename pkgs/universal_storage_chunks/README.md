# universal_storage_chunks

Content-addressed chunk store for large binary members (ADR 0042 of the
universal_storage design docs).

Binaries become first-class world members without breaking the kernel:

- bytes are cut by content-defined boundaries ([`ContentDefinedChunker`]),
- addressed by sha256 ([`ChunkStore`] — immutable, additive,
  union-commutative),
- referenced from an ordinary kernel-doc value ([`ChunkManifest`]) that
  rides the existing anti-entropy unchanged.

[`ChunkedBlobStore`] is the facade. [`MeshChunkExchange`] moves chunks
over a mesh session with on-receipt hash verification — the wire form of
proof of possession: a chunk is only ever adopted when its bytes hash to
the requested address.

Progressive materialization ([`ChunkedBlobStore.planProgressive`]) is the
mip-streaming contract: leading chunks first, so a shell can render a
preview while the tail streams in — binary members get the same
"no loader" journey as text.

A behavioral conformance suite for any [`ChunkStore`] implementation
ships in `lib/conformance.dart` (`chunkStoreConformanceTests`) — the
shipped memory/file pair, a game's asset cache, a future packfile store:
any store opts in with one call.

## Usage

```dart
import 'package:universal_storage_chunks/universal_storage_chunks.dart';

final store = ChunkedBlobStore(/* backends */);
final plan = await store.cut(bytes); // content-defined chunking
final manifest = plan.manifest;      // rides the kernel anti-entropy
```

## License

MIT — see [LICENSE](LICENSE).
