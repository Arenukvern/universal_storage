import 'models/version_control_models.dart';

abstract interface class VersionControlService {
  VersionControlCapabilities get declaredVersionControlCapabilities;

  Future<VersionControlCapabilities> resolveVersionControlCapabilities();

  Future<List<VcRepository>> listRepositories();
  Future<VcRepository> createRepository(
    VcCreateRepositoryRequest details,
  );
  Future<VcRepository> getRepositoryInfo();
  Future<List<VcBranch>> listBranches();
  Future<void> setRepository(VcRepositoryName repositoryId);
  Future<void> cloneRepository(
    VcRepository repository,
    String localPath,
  );
}
