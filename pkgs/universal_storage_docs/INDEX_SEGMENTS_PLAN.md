# Plan: compressed incremental index segments (ADR 0070)

The design decision for large machine indexes (code graphs, symbol
extracts, search indexes — e.g. the codemap/gitnexus estate, 3.5–4.2 GB
per repo today vs a 617 MB content-addressed fact store) lives in the
family ADR home:

`~/xs/storage_problem/dart_flutter_packages/docs/decisions/0070_compressed_incremental_index_segments.md`

Summary of the build order for this workspace:

1. `universal_storage_zstd` — ffi codec seam, graceful degradation.
2. `universal_storage_chunks` — FastCDC dual-mask + bulk buffers +
   `CompressedChunkStore` (address = sha256 of UNCOMPRESSED bytes, never
   codec-dependent; conformance must prove cross-codec address
   stability). This is ADR 0042's deferred "later layer".
3. `universal_storage_index` — segments + manifests (kernel-doc values
   riding LWW), dirty-file incremental extraction on an isolate pool,
   ratio-triggered delta chains/compaction, reachability GC, and derived
   access planes (CSR graph arrays, FST+postings; SQLite/Cypher only as
   a disposable local accelerator).

Key law: stores answer nothing; planes are derived, local, and always
rebuildable. Two machines sync by exchanging chunks and manifests —
content addressing makes the merge a set union.
