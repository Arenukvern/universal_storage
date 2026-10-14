import 'package:universal_io/io.dart';
import 'package:universal_storage_interface/universal_storage_interface.dart';

/// Resolves and releases file path access for [FileSystemStorageProvider].
///
/// Use a custom implementation to plug in platform-specific behavior such as
/// Flutter/macOS security-scoped bookmarks.
abstract interface class FileSystemPathAccess {
  /// Resolves [config] to a directory that can be accessed by the provider.
  Future<Directory?> resolveDirectory(FilePathConfig config);

  /// Releases any resources acquired during [resolveDirectory].
  Future<void> releaseDirectory(FilePathConfig config);
}

/// Default pure Dart implementation of [FileSystemPathAccess].
///
/// It directly uses `config.path.path` and does not manage platform handles.
final class DefaultFileSystemPathAccess implements FileSystemPathAccess {
  const DefaultFileSystemPathAccess();

  @override
  Future<Directory?> resolveDirectory(FilePathConfig config) async {
    final resolvedPath = config.path.path.trim();
    if (resolvedPath.isEmpty) {
      return null;
    }
    return Directory(resolvedPath);
  }

  @override
  Future<void> releaseDirectory(FilePathConfig config) async {}
}

typedef ResolveDirectoryForConfig =
    Future<Directory?> Function(FilePathConfig config);
typedef ReleaseDirectoryForConfig =
    Future<void> Function(FilePathConfig config);

/// Callback-based [FileSystemPathAccess] helper for local overrides.
final class CallbackFileSystemPathAccess implements FileSystemPathAccess {
  CallbackFileSystemPathAccess({
    required this._resolveDirectory,
    ReleaseDirectoryForConfig? releaseDirectory,
  }) : _releaseDirectory = releaseDirectory ?? _noopReleaseDirectory;

  final ResolveDirectoryForConfig _resolveDirectory;
  final ReleaseDirectoryForConfig _releaseDirectory;

  static Future<void> _noopReleaseDirectory(FilePathConfig _) async {}

  @override
  Future<Directory?> resolveDirectory(FilePathConfig config) =>
      _resolveDirectory(config);

  @override
  Future<void> releaseDirectory(FilePathConfig config) =>
      _releaseDirectory(config);
}
