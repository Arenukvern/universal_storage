import 'cloudkit_apple_api.g.dart';

/// Typed client abstraction for Apple CloudKit bridge RPC.
abstract interface class CloudKitAppleApiClient {
  Future<void> initialize(CloudKitAppleConfigData config);

  Future<CloudKitAppleRecordData?> fetchRecordByPath(String path);

  Future<void> saveRecord(CloudKitAppleRecordData record);

  Future<void> deleteRecord(String recordName);

  Future<List<CloudKitAppleRecordData>> queryByPathPrefix(
    String pathPrefix,
  );

  Future<CloudKitAppleDeltaData> fetchChanges(String? serverChangeToken);

  Future<void> dispose();
}

/// Pigeon-backed implementation of [CloudKitAppleApiClient].
class PigeonCloudKitAppleApiClient implements CloudKitAppleApiClient {
  PigeonCloudKitAppleApiClient({CloudKitAppleHostApi? api})
    : _api = api ?? CloudKitAppleHostApi();

  final CloudKitAppleHostApi _api;

  @override
  Future<void> initialize(CloudKitAppleConfigData config) =>
      _api.initialize(config);

  @override
  Future<CloudKitAppleRecordData?> fetchRecordByPath(String path) =>
      _api.fetchRecordByPath(path);

  @override
  Future<void> saveRecord(CloudKitAppleRecordData record) =>
      _api.saveRecord(record);

  @override
  Future<void> deleteRecord(String recordName) =>
      _api.deleteRecord(recordName);

  @override
  Future<List<CloudKitAppleRecordData>> queryByPathPrefix(
    String pathPrefix,
  ) => _api.queryByPathPrefix(pathPrefix);

  @override
  Future<CloudKitAppleDeltaData> fetchChanges(
    String? serverChangeToken,
  ) => _api.fetchChanges(serverChangeToken);

  @override
  Future<void> dispose() => _api.dispose();
}
