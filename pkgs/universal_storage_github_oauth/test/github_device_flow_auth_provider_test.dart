import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:universal_storage_github_oauth/universal_storage_github_oauth.dart';

class _FakeDelegate implements OAuthFlowDelegate {
  const _FakeDelegate();

  @override
  Future<String> getAuthorizationCode(
    Uri authorizationUrl,
    Uri redirectUrl, {
    String? state,
  }) => throw UnimplementedError();

  @override
  Future<void> handleDeviceFlow({
    required String deviceCode,
    required String userCode,
    required Uri verificationUrl,
    required int expiresIn,
    required int interval,
    Uri? verificationUrlComplete,
  }) async {}

  @override
  Future<void> onAuthorizationSuccess({
    required String maskedToken,
    required List<String> scopes,
  }) async {}

  @override
  Future<void> onAuthorizationError({
    required String error,
    String? description,
  }) async {}
}

class _InMemoryStorage implements CredentialStorage {
  final Map<GitPlatform, StoredCredentials> _store = {};

  @override
  Future<void> clearCredentials(GitPlatform platform) async =>
      _store.remove(platform);

  @override
  Future<void> clearAllCredentials() async => _store.clear();

  @override
  Future<bool> hasCredentials(GitPlatform platform) async =>
      _store.containsKey(platform);

  @override
  Future<StoredCredentials?> getCredentials(GitPlatform platform) async =>
      _store[platform];

  @override
  Future<void> storeCredentials(
    GitPlatform platform,
    StoredCredentials credentials,
  ) async => _store[platform] = credentials;
}

/// HTTP client stub: first token poll returns pending, second returns the
/// token. Device-code request always succeeds.
class _ScriptedHttpClient implements http.Client {
  int tokenPolls = 0;

  @override
  Future<http.Response> post(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    if ('$url'.contains('/device/code')) {
      return http.Response(
        jsonEncode({
          'device_code': 'dc_123',
          'user_code': 'ABCD-1234',
          'verification_uri': 'https://github.com/login/device',
          'expires_in': 900,
          'interval': 0,
        }),
        200,
      );
    }
    tokenPolls++;
    return http.Response(
      jsonEncode(
        tokenPolls == 1
            ? {'error': 'authorization_pending'}
            : {'access_token': 'gho_token123'},
      ),
      200,
    );
  }

  @override
  Future<http.Response> get(
    Uri url, {
    Map<String, String>? headers,
  }) async => http.Response(jsonEncode({'login': 'octocat', 'id': 1}), 200);

  @override
  dynamic noSuchMethod(Invocation invocation) =>
      super.noSuchMethod(invocation);
}

void main() {
  GithubDeviceFlowAuthProvider buildProvider(_ScriptedHttpClient client) =>
      GithubDeviceFlowAuthProvider(
        flowConfig: const GithubDeviceFlowConfig(clientId: 'iv1_test'),
        delegate: const _FakeDelegate(),
        storage: _InMemoryStorage(),
        httpClient: client,
      );

  test('device flow completes: pending → token → user', () async {
    final client = _ScriptedHttpClient();
    final provider = buildProvider(client);

    final result = await provider.authenticate();

    expect(result.credentials?.accessToken.value, 'gho_token123');
    expect(result.user?.login, isNotEmpty);
    expect(await provider.isAuthenticated(), isTrue);
    expect(client.tokenPolls, 2);
  });

  test('config exposes GitHub platform and OAuth config', () {
    final provider = buildProvider(_ScriptedHttpClient());
    expect(provider.platform, GitPlatform.github);
    expect(provider.config.clientId.value, 'iv1_test');
  });
}
