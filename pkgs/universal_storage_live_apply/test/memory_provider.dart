import 'package:universal_storage_interface/universal_storage_interface.dart';

/// Minimal in-memory [StorageProvider] for unit tests: no persistence, exact
/// string semantics, honest exceptions.
class MemoryStorageProvider extends StorageProvider {
  final Map<String, String> files = <String, String>{};

  @override
  Future<void> initWithConfig(StorageConfig config) async {}

  @override
  Future<bool> isAuthenticated() async => true;

  @override
  Future<FileOperationResult> createFile(
    String path,
    String content, {
    String? commitMessage,
  }) async {
    if (files.containsKey(path)) {
      throw const FileAlreadyExistsException('already exists');
    }
    files[path] = content;
    return FileOperationResult(path: path, isNew: true);
  }

  @override
  Future<String?> getFile(String path) async => files[path];

  @override
  Future<FileOperationResult> updateFile(
    String path,
    String content, {
    String? commitMessage,
  }) async {
    if (!files.containsKey(path)) {
      throw const FileNotFoundException('missing');
    }
    files[path] = content;
    return FileOperationResult(path: path);
  }

  @override
  Future<FileOperationResult> deleteFile(
    String path, {
    String? commitMessage,
  }) async {
    if (!files.containsKey(path)) {
      throw const FileNotFoundException('missing');
    }
    files.remove(path);
    return FileOperationResult(path: path);
  }

  @override
  Future<List<FileEntry>> listDirectory(String directoryPath) async =>
      files.keys
          .map((f) => FileEntry(name: f, isDirectory: false))
          .toList();

  @override
  Future<void> restore(String path, {String? versionId}) =>
      Future<void>.error(
        const UnsupportedOperationException('no restore in the fake'),
      );

  @override
  Future<void> dispose() async {}
}
