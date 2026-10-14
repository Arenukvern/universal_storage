import 'models.dart';

/// Contract implemented by platform-specific CloudKit bridges.
abstract interface class CloudKitBridge {
  Future<void> initialize(CloudKitBridgeConfig config);

  Future<CloudKitRecord?> fetchRecordByPath(String path);

  Future<void> saveRecord(CloudKitRecord record);

  Future<void> deleteRecord(String recordName);

  Future<List<CloudKitRecord>> queryByPathPrefix(String pathPrefix);

  Future<CloudKitDelta> fetchChanges({String? serverChangeToken});

  Future<void> dispose();
}

/// Global bridge holder used by universal_storage_cloudkit provider.
abstract final class CloudKitBridgePlatform {
  CloudKitBridgePlatform._();

  static CloudKitBridge instance = const UnsupportedCloudKitBridge();
}

class UnsupportedCloudKitBridge implements CloudKitBridge {
  const UnsupportedCloudKitBridge();

  @override
  Future<void> initialize(CloudKitBridgeConfig config) async {
    throw const CloudKitBridgeException(
      code: CloudKitBridgeErrorCode.unsupported,
      message: 'CloudKit bridge is not registered for this platform.',
    );
  }

  @override
  Future<CloudKitRecord?> fetchRecordByPath(String path) async {
    throw const CloudKitBridgeException(
      code: CloudKitBridgeErrorCode.unsupported,
      message: 'CloudKit bridge is not registered for this platform.',
    );
  }

  @override
  Future<void> saveRecord(CloudKitRecord record) async {
    throw const CloudKitBridgeException(
      code: CloudKitBridgeErrorCode.unsupported,
      message: 'CloudKit bridge is not registered for this platform.',
    );
  }

  @override
  Future<void> deleteRecord(String recordName) async {
    throw const CloudKitBridgeException(
      code: CloudKitBridgeErrorCode.unsupported,
      message: 'CloudKit bridge is not registered for this platform.',
    );
  }

  @override
  Future<List<CloudKitRecord>> queryByPathPrefix(
    String pathPrefix,
  ) async {
    throw const CloudKitBridgeException(
      code: CloudKitBridgeErrorCode.unsupported,
      message: 'CloudKit bridge is not registered for this platform.',
    );
  }

  @override
  Future<CloudKitDelta> fetchChanges({String? serverChangeToken}) async {
    throw const CloudKitBridgeException(
      code: CloudKitBridgeErrorCode.unsupported,
      message: 'CloudKit bridge is not registered for this platform.',
    );
  }

  @override
  Future<void> dispose() async {}
}
