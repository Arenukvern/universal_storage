# universal_storage_realtime

The realtime event plane over mesh sessions (ADR 0050): the four
semantics every realtime app re-implements — liveness, droppable
newest-wins sends, reliable exactly-once sends, multi-sender
arbitration — as a library, so an app brings only its event schema and
(for richer fusion) an arbiter policy.

## The laws

- **Plane law**: realtime is ONE plane of a shared server. Claim it with
  [`looksLikeRealtimeFrame`] next to the sync and blob planes.
- **Scheduling law**: a link either owns its heartbeat/staleness timers
  (the default) or is built [`RealtimeLink.tickDriven`] /
  [`RealtimeHost.tickDriven`] and the consumer pulses
  [`RealtimeLink.tick`] from a loop it already runs. The HOST never
  spawns loops beyond the links'.
- **Auth law**: the transport may authenticate the session, but the host
  decides who drives — [`RealtimeHost.adoptSession`] is the gate;
  [`RealtimeHost.claimSender`] is the reconnect law's primitive.

## Usage

```dart
import 'package:universal_storage_realtime/universal_storage_realtime.dart';

final host = RealtimeHost(/* links, schema, arbiter */);
host.adoptSession(session); // who drives is the host's decision
host.sendDroppable(frame);  // newest-wins
host.sendReliable(frame);   // exactly-once
```

## License

MIT — see [LICENSE](LICENSE).
