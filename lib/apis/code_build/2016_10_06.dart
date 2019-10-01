import 'package:meta/meta.dart';

/// AWS CodeBuild
///
/// AWS CodeBuild is a fully managed build service in the cloud. AWS CodeBuild
/// compiles your source code, runs unit tests, and produces artifacts that are
/// ready to deploy. AWS CodeBuild eliminates the need to provision, manage, and
/// scale your own build servers. It provides prepackaged build environments for
/// the most popular programming languages and build tools, such as Apache
/// Maven, Gradle, and more. You can also fully customize build environments in
/// AWS CodeBuild to use your own build tools. AWS CodeBuild scales
/// automatically to meet peak build requests. You pay only for the build time
/// you consume. For more information about AWS CodeBuild, see the _AWS
/// CodeBuild User Guide_.
///
/// AWS CodeBuild supports these operations:
///
/// *    `BatchDeleteBuilds`: Deletes one or more builds.
///
/// *    `BatchGetProjects`: Gets information about one or more build projects.
/// A _build project_ defines how AWS CodeBuild runs a build. This includes
/// information such as where to get the source code to build, the build
/// environment to use, the build commands to run, and where to store the build
/// output. A _build environment_ is a representation of operating system,
/// programming language runtime, and tools that AWS CodeBuild uses to run a
/// build. You can add tags to build projects to help manage your resources and
/// costs.
///
/// *    `CreateProject`: Creates a build project.
///
/// *    `CreateWebhook`: For an existing AWS CodeBuild build project that has
/// its source code stored in a GitHub or Bitbucket repository, enables AWS
/// CodeBuild to start rebuilding the source code every time a code change is
/// pushed to the repository.
///
/// *    `UpdateWebhook`: Changes the settings of an existing webhook.
///
/// *    `DeleteProject`: Deletes a build project.
///
/// *    `DeleteWebhook`: For an existing AWS CodeBuild build project that has
/// its source code stored in a GitHub or Bitbucket repository, stops AWS
/// CodeBuild from rebuilding the source code every time a code change is pushed
/// to the repository.
///
/// *    `ListProjects`: Gets a list of build project names, with each build
/// project name representing a single build project.
///
/// *    `UpdateProject`: Changes the settings of an existing build project.
///
/// *    `BatchGetBuilds`: Gets information about one or more builds.
///
/// *    `ListBuilds`: Gets a list of build IDs, with each build ID representing
/// a single build.
///
/// *    `ListBuildsForProject`: Gets a list of build IDs for the specified
/// build project, with each build ID representing a single build.
///
/// *    `StartBuild`: Starts running a build.
///
/// *    `StopBuild`: Attempts to stop running a build.
///
/// *    `ListCuratedEnvironmentImages`: Gets information about Docker images
/// that are managed by AWS CodeBuild.
///
/// *    `DeleteSourceCredentials`: Deletes a set of GitHub, GitHub Enterprise,
/// or Bitbucket source credentials.
///
/// *    `ImportSourceCredentials`: Imports the source repository credentials
/// for an AWS CodeBuild project that has its source code stored in a GitHub,
/// GitHub Enterprise, or Bitbucket repository.
///
/// *    `ListSourceCredentials`: Returns a list of `SourceCredentialsInfo`
/// objects. Each `SourceCredentialsInfo` object includes the authentication
/// type, token ARN, and type of source provider for one set of credentials.
class CodeBuildApi {
  /// Deletes one or more builds.
  Future<void> batchDeleteBuilds(List<String> ids) async {}

  /// Gets information about builds.
  Future<void> batchGetBuilds(List<String> ids) async {}

  /// Gets information about build projects.
  Future<void> batchGetProjects(List<String> names) async {}

  /// Creates a build project.
  Future<void> createProject(
      {@required String name,
      String description,
      @required ProjectSource source,
      List<ProjectSource> secondarySources,
      String sourceVersion,
      List<ProjectSourceVersion> secondarySourceVersions,
      @required ProjectArtifacts artifacts,
      List<ProjectArtifacts> secondaryArtifacts,
      ProjectCache cache,
      @required ProjectEnvironment environment,
      @required String serviceRole,
      int timeoutInMinutes,
      int queuedTimeoutInMinutes,
      String encryptionKey,
      List<Tag> tags,
      VpcConfig vpcConfig,
      bool badgeEnabled,
      LogsConfig logsConfig}) async {}

  /// For an existing AWS CodeBuild build project that has its source code
  /// stored in a GitHub or Bitbucket repository, enables AWS CodeBuild to start
  /// rebuilding the source code every time a code change is pushed to the
  /// repository.
  ///
  ///
  ///
  /// If you enable webhooks for an AWS CodeBuild project, and the project is
  /// used as a build step in AWS CodePipeline, then two identical builds are
  /// created for each commit. One build is triggered through webhooks, and one
  /// through AWS CodePipeline. Because billing is on a per-build basis, you are
  /// billed for both builds. Therefore, if you are using AWS CodePipeline, we
  /// recommend that you disable webhooks in AWS CodeBuild. In the AWS CodeBuild
  /// console, clear the Webhook box. For more information, see step 5 in
  /// [Change a Build Project's
  /// Settings](https://docs.aws.amazon.com/codebuild/latest/userguide/change-project.html#change-project-console).
  Future<void> createWebhook(String projectName,
      {String branchFilter, List<List<WebhookFilter>> filterGroups}) async {}

  /// Deletes a build project.
  Future<void> deleteProject(String name) async {}

  ///  Deletes a set of GitHub, GitHub Enterprise, or Bitbucket source
  /// credentials.
  Future<void> deleteSourceCredentials(String arn) async {}

  /// For an existing AWS CodeBuild build project that has its source code
  /// stored in a GitHub or Bitbucket repository, stops AWS CodeBuild from
  /// rebuilding the source code every time a code change is pushed to the
  /// repository.
  Future<void> deleteWebhook(String projectName) async {}

  ///  Imports the source repository credentials for an AWS CodeBuild project
  /// that has its source code stored in a GitHub, GitHub Enterprise, or
  /// Bitbucket repository.
  Future<void> importSourceCredentials(
      {String username,
      @required String token,
      @required String serverType,
      @required String authType,
      bool shouldOverwrite}) async {}

  /// Resets the cache for a project.
  Future<void> invalidateProjectCache(String projectName) async {}

  /// Gets a list of build IDs, with each build ID representing a single build.
  Future<void> listBuilds({String sortOrder, String nextToken}) async {}

  /// Gets a list of build IDs for the specified build project, with each build
  /// ID representing a single build.
  Future<void> listBuildsForProject(String projectName,
      {String sortOrder, String nextToken}) async {}

  /// Gets information about Docker images that are managed by AWS CodeBuild.
  Future<void> listCuratedEnvironmentImages() async {}

  /// Gets a list of build project names, with each build project name
  /// representing a single build project.
  Future<void> listProjects(
      {String sortBy, String sortOrder, String nextToken}) async {}

  ///  Returns a list of `SourceCredentialsInfo` objects.
  Future<void> listSourceCredentials() async {}

  /// Starts running a build.
  Future<void> startBuild(String projectName,
      {List<ProjectSource> secondarySourcesOverride,
      List<ProjectSourceVersion> secondarySourcesVersionOverride,
      String sourceVersion,
      ProjectArtifacts artifactsOverride,
      List<ProjectArtifacts> secondaryArtifactsOverride,
      List<EnvironmentVariable> environmentVariablesOverride,
      String sourceTypeOverride,
      String sourceLocationOverride,
      SourceAuth sourceAuthOverride,
      int gitCloneDepthOverride,
      GitSubmodulesConfig gitSubmodulesConfigOverride,
      String buildspecOverride,
      bool insecureSslOverride,
      bool reportBuildStatusOverride,
      String environmentTypeOverride,
      String imageOverride,
      String computeTypeOverride,
      String certificateOverride,
      ProjectCache cacheOverride,
      String serviceRoleOverride,
      bool privilegedModeOverride,
      int timeoutInMinutesOverride,
      int queuedTimeoutInMinutesOverride,
      String idempotencyToken,
      LogsConfig logsConfigOverride,
      RegistryCredential registryCredentialOverride,
      String imagePullCredentialsTypeOverride}) async {}

  /// Attempts to stop running a build.
  Future<void> stopBuild(String id) async {}

  /// Changes the settings of a build project.
  Future<void> updateProject(String name,
      {String description,
      ProjectSource source,
      List<ProjectSource> secondarySources,
      String sourceVersion,
      List<ProjectSourceVersion> secondarySourceVersions,
      ProjectArtifacts artifacts,
      List<ProjectArtifacts> secondaryArtifacts,
      ProjectCache cache,
      ProjectEnvironment environment,
      String serviceRole,
      int timeoutInMinutes,
      int queuedTimeoutInMinutes,
      String encryptionKey,
      List<Tag> tags,
      VpcConfig vpcConfig,
      bool badgeEnabled,
      LogsConfig logsConfig}) async {}

  ///  Updates the webhook associated with an AWS CodeBuild build project.
  ///
  ///   If you use Bitbucket for your repository, `rotateSecret` is ignored.
  Future<void> updateWebhook(String projectName,
      {String branchFilter,
      bool rotateSecret,
      List<List<WebhookFilter>> filterGroups}) async {}
}

class BatchDeleteBuildsOutput {}

class BatchGetBuildsOutput {}

class BatchGetProjectsOutput {}

class Build {}

class BuildArtifacts {}

class BuildNotDeleted {}

class BuildPhase {}

class CloudWatchLogsConfig {}

class CreateProjectOutput {}

class CreateWebhookOutput {}

class DeleteProjectOutput {}

class DeleteSourceCredentialsOutput {}

class DeleteWebhookOutput {}

class EnvironmentImage {}

class EnvironmentLanguage {}

class EnvironmentPlatform {}

class EnvironmentVariable {}

class GitSubmodulesConfig {}

class ImportSourceCredentialsOutput {}

class InvalidateProjectCacheOutput {}

class ListBuildsForProjectOutput {}

class ListBuildsOutput {}

class ListCuratedEnvironmentImagesOutput {}

class ListProjectsOutput {}

class ListSourceCredentialsOutput {}

class LogsConfig {}

class LogsLocation {}

class NetworkInterface {}

class PhaseContext {}

class Project {}

class ProjectArtifacts {}

class ProjectBadge {}

class ProjectCache {}

class ProjectEnvironment {}

class ProjectSource {}

class ProjectSourceVersion {}

class RegistryCredential {}

class S3LogsConfig {}

class SourceAuth {}

class SourceCredentialsInfo {}

class StartBuildOutput {}

class StopBuildOutput {}

class Tag {}

class UpdateProjectOutput {}

class UpdateWebhookOutput {}

class VpcConfig {}

class Webhook {}

class WebhookFilter {}
