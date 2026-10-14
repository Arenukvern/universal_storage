import 'package:meta/meta.dart';

import 'hlc.dart';

/// Per-actor high-water mark of observed HLCs (ADR 0011 §2).
///
/// Because an actor's HLCs are strictly monotonic, "have I seen this op?"
/// reduces to `op.hlc <= vv[actor]` — no per-op id sets needed for dedupe.
@immutable
final class VersionVector {

  VersionVector([Map<String, Hlc>? entries])
    : _entries = Map<String, Hlc>.unmodifiable(entries ?? const {});
  factory VersionVector.fromJson(Map<String, dynamic> json) =>
      VersionVector(
        json.map((actor, raw) => MapEntry(actor, hlcFromJson(raw))),
      );

  static final VersionVector zero = VersionVector();

  final Map<String, Hlc> _entries;

  Hlc? operator [](String actorId) => _entries[actorId];

  /// All actors with at least one observed event.
  Iterable<String> get actors => _entries.keys;

  /// Returns a new vector that also has observed [hlc].
  VersionVector observed(Hlc hlc) {
    final current = _entries[hlc.actorId];
    if (current != null && current >= hlc) return this;
    return VersionVector({..._entries, hlc.actorId: hlc});
  }

  /// True when an event with [hlc] has already been observed.
  bool contains(Hlc hlc) {
    final current = _entries[hlc.actorId];
    return current != null && current >= hlc;
  }

  Map<String, dynamic> toJson() =>
      _entries.map((actor, hlc) => MapEntry(actor, hlc.toJson()));

  @override
  String toString() => 'VersionVector${_entries.keys.toList()}';
}
