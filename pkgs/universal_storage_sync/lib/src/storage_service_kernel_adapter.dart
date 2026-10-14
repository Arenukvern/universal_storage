import 'package:universal_storage_interface/universal_storage_interface.dart';

import 'storage_kernel.dart';

/// Compatibility adapter exposing `StorageService`-like API on top of
/// profile-aware [StorageKernel].
final class StorageServiceKernelAdapter {
  StorageServiceKernelAdapter({required this.kernel, required this.namespace});

  final StorageKernel kernel;
  final StorageNamespace namespace;

  Future<FileOperationResult> saveFile(
    String path,
    String content, {
    String? message,
  }) => kernel.write(
    namespace: namespace,
    path: path,
    content: content,
    message: message,
  );

  Future<String?> readFile(String path) =>
      kernel.read(namespace: namespace, path: path);

  Future<FileOperationResult> removeFile(
    String path, {
    String? message,
  }) => kernel.delete(namespace: namespace, path: path, message: message);

  Future<List<FileEntry>> listDirectory(String path) =>
      kernel.list(namespace: namespace, directoryPath: path);

  Stream<StorageObservationEvent> observeChanges({String? pathPrefix}) =>
      kernel.observe(namespace: namespace, pathPrefix: pathPrefix);

  Future<void> syncRemote() => kernel.sync(namespace: namespace);
}
