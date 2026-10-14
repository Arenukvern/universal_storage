import 'package:universal_storage_cloudkit_platform_interface/universal_storage_cloudkit_platform_interface.dart';

/// Normalized client contract used by CloudKit web bridge.
abstract interface class CloudKitWebClient {
  Future<void> initialize(CloudKitBridgeConfig config);
  Future<CloudKitRecord?> fetchRecordByPath(String path);
  Future<void> saveRecord(CloudKitRecord record);
  Future<void> deleteRecord(String recordName);
  Future<List<CloudKitRecord>> queryByPathPrefix(String pathPrefix);
  Future<CloudKitDelta> fetchChanges({String? serverChangeToken});
  Future<void> dispose();
}
