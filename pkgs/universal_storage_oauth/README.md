# Git OAuth Provider

A comprehensive OAuth provider for Git platforms (GitHub, GitLab, Bitbucket) with secure credential management for Flutter applications.

## Features

- 🔐 **Secure OAuth Authentication** - Complete OAuth 2.0 flow using `oauth2_client`
- 🏪 **Multiple Platform Support** - GitHub, GitLab, Bitbucket
- 💾 **Secure Credential Storage** - Platform keychain/keystore integration
- 📁 **Repository Management** - Full CRUD operations for repositories
- 🔄 **Automatic Token Handling** - Token refresh and validation
- 🛡️ **Comprehensive Error Handling** - Detailed exception types
- 📱 **Cross-Platform** - iOS, Android, macOS, Windows, Linux, Web

## Supported Platforms

| Platform  | OAuth | Repository API | Status  |
| --------- | ----- | -------------- | ------- |
| GitHub    | ✅    | ✅             | Ready   |
| GitLab    | 🚧    | 🚧             | Planned |
| Bitbucket | 🚧    | 🚧             | Planned |

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  universal_storage_oauth:
    path: ../universal_storage_oauth
```

## Quick Start

### 1. GitHub OAuth Setup

```dart
import 'package:universal_storage_oauth/universal_storage_oauth.dart';

// Create OAuth configuration
final config = GitHubOAuthConfig(
  clientId: 'your_github_client_id',
  clientSecret: 'your_github_client_secret',
  redirectUri: 'your.app.scheme://callback',
  customUriScheme: 'your.app.scheme',
  scopes: ['repo', 'user:email'],
);

// Initialize OAuth provider
final oauthProvider = GitHubOAuthProvider(config);
```

### 2. Authentication

```dart
try {
  // Check if already authenticated
  if (!await oauthProvider.isAuthenticated()) {
    // Start OAuth flow
    final result = await oauthProvider.authenticate();
    print('Welcome ${result.user?.login}!');
  }

  // Get current user
  final user = await oauthProvider.getCurrentUser();
  print('Logged in as: ${user?.login}');

} catch (e) {
  print('Authentication failed: $e');
}
```

### 3. Repository Management

```dart
final repoService = GitHubRepositoryService(oauthProvider);

// Get user repositories
final repos = await repoService.getUserRepositories();
print('Found ${repos.length} repositories');

// Create new repository
final newRepo = await repoService.createRepository(
  CreateRepositoryRequest(
    name: 'my-new-repo',
    description: 'Created with universal_storage_oauth',
    isPrivate: false,
  ),
);

// Get repository details
final repo = await repoService.getRepository('owner', 'repo-name');
print('Repository: ${repo?.fullName}');
```

## Configuration

### Android Setup

Add to `android/app/src/main/AndroidManifest.xml`:

```xml
<activity android:name="com.linusu.flutter_web_auth_2.CallbackActivity" android:exported="true">
    <intent-filter android:label="flutter_web_auth_2">
        <action android:name="android.intent.action.VIEW" />
        <category android:name="android.intent.category.DEFAULT" />
        <category android:name="android.intent.category.BROWSABLE" />
        <data android:scheme="your.app.scheme" />
    </intent-filter>
</activity>
```

### iOS Setup

Add to `ios/Runner/Info.plist`:

```xml
<key>CFBundleURLTypes</key>
<array>
    <dict>
        <key>CFBundleURLName</key>
        <string>your.app.scheme</string>
        <key>CFBundleURLSchemes</key>
        <array>
            <string>your.app.scheme</string>
        </array>
    </dict>
</array>
```

## Advanced Usage

### Custom Credential Storage

```dart
// Implement custom storage
class MyCredentialStorage implements CredentialStorage {
  @override
  Future<void> storeCredentials(GitPlatform platform, StoredCredentials credentials) async {
    // Your custom storage logic
  }

  // ... implement other methods
}

// Use custom storage
final provider = GitHubOAuthProvider(config, MyCredentialStorage());
```

### Error Handling

```dart
try {
  await oauthProvider.authenticate();
} on AuthenticationException catch (e) {
  print('Authentication failed: ${e.message}');
} on ApiException catch (e) {
  print('API error: ${e.message}');
} on ConfigurationException catch (e) {
  print('Configuration error: ${e.message}');
}
```

### Repository Operations

```dart
final repoService = GitHubRepositoryService(oauthProvider);

// Search repositories
final searchResults = await repoService.searchRepositories('flutter', limit: 10);

// Get repository branches
final branches = await repoService.getRepositoryBranches('flutter', 'flutter');

// Get repository tags
final tags = await repoService.getRepositoryTags('flutter', 'flutter');

// Delete repository (careful!)
await repoService.deleteRepository('owner', 'repo-name');
```

## Security Considerations

1. **Never store client secrets in client-side code** for public applications
2. **Use environment variables** or secure configuration for secrets
3. **Validate redirect URIs** in your OAuth app settings
4. **Use HTTPS** for all redirect URIs in production
5. **Implement proper error handling** to avoid credential leakage

## Architecture

```
┌─────────────────┐    ┌──────────────────┐    ┌─────────────────┐
│   OAuth Config  │    │  OAuth Provider  │    │ Repository API  │
│                 │───▶│                  │───▶│                 │
│ • Client ID     │    │ • Authentication │    │ • CRUD Ops      │
│ • Scopes        │    │ • Token Mgmt     │    │ • Branches/Tags │
│ • Redirect URI  │    │ • User Info      │    │ • Search        │
└─────────────────┘    └──────────────────┘    └─────────────────┘
                                │
                                ▼
                       ┌──────────────────┐
                       │ Credential Store │
                       │                  │
                       │ • Secure Storage │
                       │ • Token Refresh  │
                       │ • Cross-Platform │
                       └──────────────────┘
```

## Examples

See the `example/` directory for complete examples:

- `basic_oauth_example.dart` - Basic OAuth flow
- More examples coming soon...

## Contributing

Contributions are welcome! Please read our contributing guidelines and submit pull requests.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

- 📚 [Documentation](https://github.com/Arenukvern/universal_storage/tree/main/pkgs/universal_storage_oauth)
- 🐛 [Issue Tracker](https://github.com/Arenukvern/universal_storage/tree/main/pkgs/universal_storage_oauth/issues)
- 💬 [Discussions](https://github.com/Arenukvern/universal_storage/tree/main/pkgs/universal_storage_oauth/discussions)
