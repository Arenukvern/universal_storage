import 'package:flutter/material.dart';

import 'pages/files_page.dart';
import 'pages/pairing_page.dart';
import 'state/mesh_app_state.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  const selfId = String.fromEnvironment('MESH_PEER_ID', defaultValue: 'alice');
  const bindPort = int.fromEnvironment(
    'MESH_PORT',
    defaultValue: selfId == 'alice' ? 45910 : 45911,
  );
  const relayPort = int.fromEnvironment('MESH_RELAY_PORT', defaultValue: 45910);
  const isHost = bool.fromEnvironment(
    'MESH_HOST',
    defaultValue: selfId == 'alice',
  );
  runApp(
    MeshPairingApp(
      state: MeshAppState(
        selfId: selfId,
        bindPort: bindPort,
        isHost: isHost,
        relayPort: relayPort,
      ),
    ),
  );
}

class MeshPairingApp extends StatelessWidget {
  const MeshPairingApp({required this.state, super.key});

  final MeshAppState state;

  @override
  Widget build(BuildContext context) {
    state.initialize();
    return MaterialApp(
      title: 'Mesh Pairing Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: PairingPage(state: state),
      routes: {'/files': (context) => FilesPage(state: state)},
    );
  }
}
