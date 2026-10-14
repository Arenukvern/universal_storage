import 'package:universal_storage_cloudkit_platform_interface/universal_storage_cloudkit_platform_interface.dart';

import 'cloudkit_web_client.dart';

CloudKitWebClient createDefaultCloudKitWebClient() =>
    const _UnsupportedCloudKitWebClient();

class _UnsupportedCloudKitWebClient implements CloudKitWebClient {
  const _UnsupportedCloudKitWebClient();

  static const _error = CloudKitBridgeException(
    code: CloudKitBridgeErrorCode.unsupported,
    message:
        'CloudKit web bridge is available only on web runtimes with CloudKit JS loaded.',
  );

  @override
  Future<void> initialize(CloudKitBridgeConfig config) async =>
      throw _error;

  @override
  Future<CloudKitRecord?> fetchRecordByPath(String path) async =>
      throw _error;

  @override
  Future<void> saveRecord(CloudKitRecord record) async => throw _error;

  @override
  Future<void> deleteRecord(String recordName) async => throw _error;

  @override
  Future<List<CloudKitRecord>> queryByPathPrefix(
    String pathPrefix,
  ) async => throw _error;

  @override
  Future<CloudKitDelta> fetchChanges({String? serverChangeToken}) async =>
      throw _error;

  @override
  Future<void> dispose() async {}
}
