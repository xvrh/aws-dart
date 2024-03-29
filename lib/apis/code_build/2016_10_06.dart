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
  final _client;
  CodeBuildApi(client)
      : _client = client.configured('CodeBuild', serializer: 'json');

  /// Deletes one or more builds.
  ///
  /// [ids]: The IDs of the builds to delete.
  Future<BatchDeleteBuildsOutput> batchDeleteBuilds(List<String> ids) async {
    var response_ = await _client.send('BatchDeleteBuilds', {
      'ids': ids,
    });
    return BatchDeleteBuildsOutput.fromJson(response_);
  }

  /// Gets information about builds.
  ///
  /// [ids]: The IDs of the builds.
  Future<BatchGetBuildsOutput> batchGetBuilds(List<String> ids) async {
    var response_ = await _client.send('BatchGetBuilds', {
      'ids': ids,
    });
    return BatchGetBuildsOutput.fromJson(response_);
  }

  /// Gets information about build projects.
  ///
  /// [names]: The names of the build projects.
  Future<BatchGetProjectsOutput> batchGetProjects(List<String> names) async {
    var response_ = await _client.send('BatchGetProjects', {
      'names': names,
    });
    return BatchGetProjectsOutput.fromJson(response_);
  }

  /// Creates a build project.
  ///
  /// [name]: The name of the build project.
  ///
  /// [description]: A description that makes the build project easy to
  /// identify.
  ///
  /// [source]: Information about the build input source code for the build
  /// project.
  ///
  /// [secondarySources]:  An array of `ProjectSource` objects.
  ///
  /// [sourceVersion]:  A version of the build input to be built for this
  /// project. If not specified, the latest version is used. If specified, it
  /// must be one of:
  ///
  /// *   For AWS CodeCommit: the commit ID to use.
  ///
  /// *   For GitHub: the commit ID, pull request ID, branch name, or tag name
  /// that corresponds to the version of the source code you want to build. If a
  /// pull request ID is specified, it must use the format `pr/pull-request-ID`
  /// (for example `pr/25`). If a branch name is specified, the branch's HEAD
  /// commit ID is used. If not specified, the default branch's HEAD commit ID
  /// is used.
  ///
  /// *   For Bitbucket: the commit ID, branch name, or tag name that
  /// corresponds to the version of the source code you want to build. If a
  /// branch name is specified, the branch's HEAD commit ID is used. If not
  /// specified, the default branch's HEAD commit ID is used.
  ///
  /// *   For Amazon Simple Storage Service (Amazon S3): the version ID of the
  /// object that represents the build input ZIP file to use.
  ///
  ///
  ///  If `sourceVersion` is specified at the build level, then that version
  /// takes precedence over this `sourceVersion` (at the project level).
  ///
  ///  For more information, see
  /// [Source Version Sample with CodeBuild](https://docs.aws.amazon.com/codebuild/latest/userguide/sample-source-version.html)
  /// in the _AWS CodeBuild User Guide_.
  ///
  /// [secondarySourceVersions]:  An array of `ProjectSourceVersion` objects. If
  /// `secondarySourceVersions` is specified at the build level, then they take
  /// precedence over these `secondarySourceVersions` (at the project level).
  ///
  /// [artifacts]: Information about the build output artifacts for the build
  /// project.
  ///
  /// [secondaryArtifacts]:  An array of `ProjectArtifacts` objects.
  ///
  /// [cache]: Stores recently used information so that it can be quickly
  /// accessed at a later time.
  ///
  /// [environment]: Information about the build environment for the build
  /// project.
  ///
  /// [serviceRole]: The ARN of the AWS Identity and Access Management (IAM)
  /// role that enables AWS CodeBuild to interact with dependent AWS services on
  /// behalf of the AWS account.
  ///
  /// [timeoutInMinutes]: How long, in minutes, from 5 to 480 (8 hours), for AWS
  /// CodeBuild to wait before it times out any build that has not been marked
  /// as completed. The default is 60 minutes.
  ///
  /// [queuedTimeoutInMinutes]:  The number of minutes a build is allowed to be
  /// queued before it times out.
  ///
  /// [encryptionKey]: The AWS Key Management Service (AWS KMS) customer master
  /// key (CMK) to be used for encrypting the build output artifacts.
  ///
  ///   You can use a cross-account KMS key to encrypt the build output
  /// artifacts if your service role has permission to that key.
  ///
  /// You can specify either the Amazon Resource Name (ARN) of the CMK or, if
  /// available, the CMK's alias (using the format `alias/_alias-name_` ).
  ///
  /// [tags]: A set of tags for this build project.
  ///
  /// These tags are available for use by AWS services that support AWS
  /// CodeBuild build project tags.
  ///
  /// [vpcConfig]: VpcConfig enables AWS CodeBuild to access resources in an
  /// Amazon VPC.
  ///
  /// [badgeEnabled]: Set this to true to generate a publicly accessible URL for
  /// your project's build badge.
  ///
  /// [logsConfig]:  Information about logs for the build project. These can be
  /// logs in Amazon CloudWatch Logs, logs uploaded to a specified S3 bucket, or
  /// both.
  Future<CreateProjectOutput> createProject(
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
      LogsConfig logsConfig}) async {
    var response_ = await _client.send('CreateProject', {
      'name': name,
      if (description != null) 'description': description,
      'source': source,
      if (secondarySources != null) 'secondarySources': secondarySources,
      if (sourceVersion != null) 'sourceVersion': sourceVersion,
      if (secondarySourceVersions != null)
        'secondarySourceVersions': secondarySourceVersions,
      'artifacts': artifacts,
      if (secondaryArtifacts != null) 'secondaryArtifacts': secondaryArtifacts,
      if (cache != null) 'cache': cache,
      'environment': environment,
      'serviceRole': serviceRole,
      if (timeoutInMinutes != null) 'timeoutInMinutes': timeoutInMinutes,
      if (queuedTimeoutInMinutes != null)
        'queuedTimeoutInMinutes': queuedTimeoutInMinutes,
      if (encryptionKey != null) 'encryptionKey': encryptionKey,
      if (tags != null) 'tags': tags,
      if (vpcConfig != null) 'vpcConfig': vpcConfig,
      if (badgeEnabled != null) 'badgeEnabled': badgeEnabled,
      if (logsConfig != null) 'logsConfig': logsConfig,
    });
    return CreateProjectOutput.fromJson(response_);
  }

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
  /// [Change a Build Project's Settings](https://docs.aws.amazon.com/codebuild/latest/userguide/change-project.html#change-project-console).
  ///
  /// [projectName]: The name of the AWS CodeBuild project.
  ///
  /// [branchFilter]: A regular expression used to determine which repository
  /// branches are built when a webhook is triggered. If the name of a branch
  /// matches the regular expression, then it is built. If `branchFilter` is
  /// empty, then all branches are built.
  ///
  ///   It is recommended that you use `filterGroups` instead of `branchFilter`.
  ///
  /// [filterGroups]:  An array of arrays of `WebhookFilter` objects used to
  /// determine which webhooks are triggered. At least one `WebhookFilter` in
  /// the array must specify `EVENT` as its `type`.
  ///
  ///  For a build to be triggered, at least one filter group in the
  /// `filterGroups` array must pass. For a filter group to pass, each of its
  /// filters must pass.
  Future<CreateWebhookOutput> createWebhook(String projectName,
      {String branchFilter, List<List<WebhookFilter>> filterGroups}) async {
    var response_ = await _client.send('CreateWebhook', {
      'projectName': projectName,
      if (branchFilter != null) 'branchFilter': branchFilter,
      if (filterGroups != null) 'filterGroups': filterGroups,
    });
    return CreateWebhookOutput.fromJson(response_);
  }

  /// Deletes a build project.
  ///
  /// [name]: The name of the build project.
  Future<DeleteProjectOutput> deleteProject(String name) async {
    var response_ = await _client.send('DeleteProject', {
      'name': name,
    });
    return DeleteProjectOutput.fromJson(response_);
  }

  ///  Deletes a set of GitHub, GitHub Enterprise, or Bitbucket source
  /// credentials.
  ///
  /// [arn]:  The Amazon Resource Name (ARN) of the token.
  Future<DeleteSourceCredentialsOutput> deleteSourceCredentials(
      String arn) async {
    var response_ = await _client.send('DeleteSourceCredentials', {
      'arn': arn,
    });
    return DeleteSourceCredentialsOutput.fromJson(response_);
  }

  /// For an existing AWS CodeBuild build project that has its source code
  /// stored in a GitHub or Bitbucket repository, stops AWS CodeBuild from
  /// rebuilding the source code every time a code change is pushed to the
  /// repository.
  ///
  /// [projectName]: The name of the AWS CodeBuild project.
  Future<DeleteWebhookOutput> deleteWebhook(String projectName) async {
    var response_ = await _client.send('DeleteWebhook', {
      'projectName': projectName,
    });
    return DeleteWebhookOutput.fromJson(response_);
  }

  ///  Imports the source repository credentials for an AWS CodeBuild project
  /// that has its source code stored in a GitHub, GitHub Enterprise, or
  /// Bitbucket repository.
  ///
  /// [username]:  The Bitbucket username when the `authType` is BASIC_AUTH.
  /// This parameter is not valid for other types of source providers or
  /// connections.
  ///
  /// [token]:  For GitHub or GitHub Enterprise, this is the personal access
  /// token. For Bitbucket, this is the app password.
  ///
  /// [serverType]:  The source provider used for this project.
  ///
  /// [authType]:  The type of authentication used to connect to a GitHub,
  /// GitHub Enterprise, or Bitbucket repository. An OAUTH connection is not
  /// supported by the API and must be created using the AWS CodeBuild console.
  ///
  /// [shouldOverwrite]:  Set to `false` to prevent overwriting the repository
  /// source credentials. Set to `true` to overwrite the repository source
  /// credentials. The default value is `true`.
  Future<ImportSourceCredentialsOutput> importSourceCredentials(
      {String username,
      @required String token,
      @required String serverType,
      @required String authType,
      bool shouldOverwrite}) async {
    var response_ = await _client.send('ImportSourceCredentials', {
      if (username != null) 'username': username,
      'token': token,
      'serverType': serverType,
      'authType': authType,
      if (shouldOverwrite != null) 'shouldOverwrite': shouldOverwrite,
    });
    return ImportSourceCredentialsOutput.fromJson(response_);
  }

  /// Resets the cache for a project.
  ///
  /// [projectName]: The name of the AWS CodeBuild build project that the cache
  /// is reset for.
  Future<InvalidateProjectCacheOutput> invalidateProjectCache(
      String projectName) async {
    var response_ = await _client.send('InvalidateProjectCache', {
      'projectName': projectName,
    });
    return InvalidateProjectCacheOutput.fromJson(response_);
  }

  /// Gets a list of build IDs, with each build ID representing a single build.
  ///
  /// [sortOrder]: The order to list build IDs. Valid values include:
  ///
  /// *    `ASCENDING`: List the build IDs in ascending order by build ID.
  ///
  /// *    `DESCENDING`: List the build IDs in descending order by build ID.
  ///
  /// [nextToken]: During a previous call, if there are more than 100 items in
  /// the list, only the first 100 items are returned, along with a unique
  /// string called a _next token_. To get the next batch of items in the list,
  /// call this operation again, adding the next token to the call. To get all
  /// of the items in the list, keep calling this operation with each subsequent
  /// next token that is returned, until no more next tokens are returned.
  Future<ListBuildsOutput> listBuilds(
      {String sortOrder, String nextToken}) async {
    var response_ = await _client.send('ListBuilds', {
      if (sortOrder != null) 'sortOrder': sortOrder,
      if (nextToken != null) 'nextToken': nextToken,
    });
    return ListBuildsOutput.fromJson(response_);
  }

  /// Gets a list of build IDs for the specified build project, with each build
  /// ID representing a single build.
  ///
  /// [projectName]: The name of the AWS CodeBuild project.
  ///
  /// [sortOrder]: The order to list build IDs. Valid values include:
  ///
  /// *    `ASCENDING`: List the build IDs in ascending order by build ID.
  ///
  /// *    `DESCENDING`: List the build IDs in descending order by build ID.
  ///
  /// [nextToken]: During a previous call, if there are more than 100 items in
  /// the list, only the first 100 items are returned, along with a unique
  /// string called a _next token_. To get the next batch of items in the list,
  /// call this operation again, adding the next token to the call. To get all
  /// of the items in the list, keep calling this operation with each subsequent
  /// next token that is returned, until no more next tokens are returned.
  Future<ListBuildsForProjectOutput> listBuildsForProject(String projectName,
      {String sortOrder, String nextToken}) async {
    var response_ = await _client.send('ListBuildsForProject', {
      'projectName': projectName,
      if (sortOrder != null) 'sortOrder': sortOrder,
      if (nextToken != null) 'nextToken': nextToken,
    });
    return ListBuildsForProjectOutput.fromJson(response_);
  }

  /// Gets information about Docker images that are managed by AWS CodeBuild.
  Future<ListCuratedEnvironmentImagesOutput>
      listCuratedEnvironmentImages() async {
    var response_ = await _client.send('ListCuratedEnvironmentImages', {});
    return ListCuratedEnvironmentImagesOutput.fromJson(response_);
  }

  /// Gets a list of build project names, with each build project name
  /// representing a single build project.
  ///
  /// [sortBy]: The criterion to be used to list build project names. Valid
  /// values include:
  ///
  /// *    `CREATED_TIME`: List based on when each build project was created.
  ///
  /// *    `LAST_MODIFIED_TIME`: List based on when information about each build
  /// project was last changed.
  ///
  /// *    `NAME`: List based on each build project's name.
  ///
  ///
  /// Use `sortOrder` to specify in what order to list the build project names
  /// based on the preceding criteria.
  ///
  /// [sortOrder]: The order in which to list build projects. Valid values
  /// include:
  ///
  /// *    `ASCENDING`: List in ascending order.
  ///
  /// *    `DESCENDING`: List in descending order.
  ///
  ///
  /// Use `sortBy` to specify the criterion to be used to list build project
  /// names.
  ///
  /// [nextToken]: During a previous call, if there are more than 100 items in
  /// the list, only the first 100 items are returned, along with a unique
  /// string called a _next token_. To get the next batch of items in the list,
  /// call this operation again, adding the next token to the call. To get all
  /// of the items in the list, keep calling this operation with each subsequent
  /// next token that is returned, until no more next tokens are returned.
  Future<ListProjectsOutput> listProjects(
      {String sortBy, String sortOrder, String nextToken}) async {
    var response_ = await _client.send('ListProjects', {
      if (sortBy != null) 'sortBy': sortBy,
      if (sortOrder != null) 'sortOrder': sortOrder,
      if (nextToken != null) 'nextToken': nextToken,
    });
    return ListProjectsOutput.fromJson(response_);
  }

  ///  Returns a list of `SourceCredentialsInfo` objects.
  Future<ListSourceCredentialsOutput> listSourceCredentials() async {
    var response_ = await _client.send('ListSourceCredentials', {});
    return ListSourceCredentialsOutput.fromJson(response_);
  }

  /// Starts running a build.
  ///
  /// [projectName]: The name of the AWS CodeBuild build project to start
  /// running a build.
  ///
  /// [secondarySourcesOverride]:  An array of `ProjectSource` objects.
  ///
  /// [secondarySourcesVersionOverride]:  An array of `ProjectSourceVersion`
  /// objects that specify one or more versions of the project's secondary
  /// sources to be used for this build only.
  ///
  /// [sourceVersion]: A version of the build input to be built, for this build
  /// only. If not specified, the latest version is used. If specified, must be
  /// one of:
  ///
  /// *   For AWS CodeCommit: the commit ID to use.
  ///
  /// *   For GitHub: the commit ID, pull request ID, branch name, or tag name
  /// that corresponds to the version of the source code you want to build. If a
  /// pull request ID is specified, it must use the format `pr/pull-request-ID`
  /// (for example `pr/25`). If a branch name is specified, the branch's HEAD
  /// commit ID is used. If not specified, the default branch's HEAD commit ID
  /// is used.
  ///
  /// *   For Bitbucket: the commit ID, branch name, or tag name that
  /// corresponds to the version of the source code you want to build. If a
  /// branch name is specified, the branch's HEAD commit ID is used. If not
  /// specified, the default branch's HEAD commit ID is used.
  ///
  /// *   For Amazon Simple Storage Service (Amazon S3): the version ID of the
  /// object that represents the build input ZIP file to use.
  ///
  ///
  ///  If `sourceVersion` is specified at the project level, then this
  /// `sourceVersion` (at the build level) takes precedence.
  ///
  ///  For more information, see
  /// [Source Version Sample with CodeBuild](https://docs.aws.amazon.com/codebuild/latest/userguide/sample-source-version.html)
  /// in the _AWS CodeBuild User Guide_.
  ///
  /// [artifactsOverride]: Build output artifact settings that override, for
  /// this build only, the latest ones already defined in the build project.
  ///
  /// [secondaryArtifactsOverride]:  An array of `ProjectArtifacts` objects.
  ///
  /// [environmentVariablesOverride]: A set of environment variables that
  /// overrides, for this build only, the latest ones already defined in the
  /// build project.
  ///
  /// [sourceTypeOverride]: A source input type, for this build, that overrides
  /// the source input defined in the build project.
  ///
  /// [sourceLocationOverride]: A location that overrides, for this build, the
  /// source location for the one defined in the build project.
  ///
  /// [sourceAuthOverride]: An authorization type for this build that overrides
  /// the one defined in the build project. This override applies only if the
  /// build project's source is BitBucket or GitHub.
  ///
  /// [gitCloneDepthOverride]: The user-defined depth of history, with a minimum
  /// value of 0, that overrides, for this build only, any previous depth of
  /// history defined in the build project.
  ///
  /// [gitSubmodulesConfigOverride]:  Information about the Git submodules
  /// configuration for this build of an AWS CodeBuild build project.
  ///
  /// [buildspecOverride]: A build spec declaration that overrides, for this
  /// build only, the latest one already defined in the build project.
  ///
  /// [insecureSslOverride]: Enable this flag to override the insecure SSL
  /// setting that is specified in the build project. The insecure SSL setting
  /// determines whether to ignore SSL warnings while connecting to the project
  /// source code. This override applies only if the build's source is GitHub
  /// Enterprise.
  ///
  /// [reportBuildStatusOverride]:  Set to true to report to your source
  /// provider the status of a build's start and completion. If you use this
  /// option with a source provider other than GitHub, GitHub Enterprise, or
  /// Bitbucket, an invalidInputException is thrown.
  ///
  /// [environmentTypeOverride]: A container type for this build that overrides
  /// the one specified in the build project.
  ///
  /// [imageOverride]: The name of an image for this build that overrides the
  /// one specified in the build project.
  ///
  /// [computeTypeOverride]: The name of a compute type for this build that
  /// overrides the one specified in the build project.
  ///
  /// [certificateOverride]: The name of a certificate for this build that
  /// overrides the one specified in the build project.
  ///
  /// [cacheOverride]: A ProjectCache object specified for this build that
  /// overrides the one defined in the build project.
  ///
  /// [serviceRoleOverride]: The name of a service role for this build that
  /// overrides the one specified in the build project.
  ///
  /// [privilegedModeOverride]: Enable this flag to override privileged mode in
  /// the build project.
  ///
  /// [timeoutInMinutesOverride]: The number of build timeout minutes, from 5 to
  /// 480 (8 hours), that overrides, for this build only, the latest setting
  /// already defined in the build project.
  ///
  /// [queuedTimeoutInMinutesOverride]:  The number of minutes a build is
  /// allowed to be queued before it times out.
  ///
  /// [idempotencyToken]: A unique, case sensitive identifier you provide to
  /// ensure the idempotency of the StartBuild request. The token is included in
  /// the StartBuild request and is valid for 12 hours. If you repeat the
  /// StartBuild request with the same token, but change a parameter, AWS
  /// CodeBuild returns a parameter mismatch error.
  ///
  /// [logsConfigOverride]:  Log settings for this build that override the log
  /// settings defined in the build project.
  ///
  /// [registryCredentialOverride]:  The credentials for access to a private
  /// registry.
  ///
  /// [imagePullCredentialsTypeOverride]:  The type of credentials AWS CodeBuild
  /// uses to pull images in your build. There are two valid values:
  ///
  /// *    `CODEBUILD` specifies that AWS CodeBuild uses its own credentials.
  /// This requires that you modify your ECR repository policy to trust AWS
  /// CodeBuild's service principal.
  ///
  /// *    `SERVICE_ROLE` specifies that AWS CodeBuild uses your build project's
  /// service role.
  ///
  ///
  ///  When using a cross-account or private registry image, you must use
  /// SERVICE_ROLE credentials. When using an AWS CodeBuild curated image, you
  /// must use CODEBUILD credentials.
  Future<StartBuildOutput> startBuild(String projectName,
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
      String imagePullCredentialsTypeOverride}) async {
    var response_ = await _client.send('StartBuild', {
      'projectName': projectName,
      if (secondarySourcesOverride != null)
        'secondarySourcesOverride': secondarySourcesOverride,
      if (secondarySourcesVersionOverride != null)
        'secondarySourcesVersionOverride': secondarySourcesVersionOverride,
      if (sourceVersion != null) 'sourceVersion': sourceVersion,
      if (artifactsOverride != null) 'artifactsOverride': artifactsOverride,
      if (secondaryArtifactsOverride != null)
        'secondaryArtifactsOverride': secondaryArtifactsOverride,
      if (environmentVariablesOverride != null)
        'environmentVariablesOverride': environmentVariablesOverride,
      if (sourceTypeOverride != null) 'sourceTypeOverride': sourceTypeOverride,
      if (sourceLocationOverride != null)
        'sourceLocationOverride': sourceLocationOverride,
      if (sourceAuthOverride != null) 'sourceAuthOverride': sourceAuthOverride,
      if (gitCloneDepthOverride != null)
        'gitCloneDepthOverride': gitCloneDepthOverride,
      if (gitSubmodulesConfigOverride != null)
        'gitSubmodulesConfigOverride': gitSubmodulesConfigOverride,
      if (buildspecOverride != null) 'buildspecOverride': buildspecOverride,
      if (insecureSslOverride != null)
        'insecureSslOverride': insecureSslOverride,
      if (reportBuildStatusOverride != null)
        'reportBuildStatusOverride': reportBuildStatusOverride,
      if (environmentTypeOverride != null)
        'environmentTypeOverride': environmentTypeOverride,
      if (imageOverride != null) 'imageOverride': imageOverride,
      if (computeTypeOverride != null)
        'computeTypeOverride': computeTypeOverride,
      if (certificateOverride != null)
        'certificateOverride': certificateOverride,
      if (cacheOverride != null) 'cacheOverride': cacheOverride,
      if (serviceRoleOverride != null)
        'serviceRoleOverride': serviceRoleOverride,
      if (privilegedModeOverride != null)
        'privilegedModeOverride': privilegedModeOverride,
      if (timeoutInMinutesOverride != null)
        'timeoutInMinutesOverride': timeoutInMinutesOverride,
      if (queuedTimeoutInMinutesOverride != null)
        'queuedTimeoutInMinutesOverride': queuedTimeoutInMinutesOverride,
      if (idempotencyToken != null) 'idempotencyToken': idempotencyToken,
      if (logsConfigOverride != null) 'logsConfigOverride': logsConfigOverride,
      if (registryCredentialOverride != null)
        'registryCredentialOverride': registryCredentialOverride,
      if (imagePullCredentialsTypeOverride != null)
        'imagePullCredentialsTypeOverride': imagePullCredentialsTypeOverride,
    });
    return StartBuildOutput.fromJson(response_);
  }

  /// Attempts to stop running a build.
  ///
  /// [id]: The ID of the build.
  Future<StopBuildOutput> stopBuild(String id) async {
    var response_ = await _client.send('StopBuild', {
      'id': id,
    });
    return StopBuildOutput.fromJson(response_);
  }

  /// Changes the settings of a build project.
  ///
  /// [name]: The name of the build project.
  ///
  ///
  ///
  /// You cannot change a build project's name.
  ///
  /// [description]: A new or replacement description of the build project.
  ///
  /// [source]: Information to be changed about the build input source code for
  /// the build project.
  ///
  /// [secondarySources]:  An array of `ProjectSource` objects.
  ///
  /// [sourceVersion]:  A version of the build input to be built for this
  /// project. If not specified, the latest version is used. If specified, it
  /// must be one of:
  ///
  /// *   For AWS CodeCommit: the commit ID to use.
  ///
  /// *   For GitHub: the commit ID, pull request ID, branch name, or tag name
  /// that corresponds to the version of the source code you want to build. If a
  /// pull request ID is specified, it must use the format `pr/pull-request-ID`
  /// (for example `pr/25`). If a branch name is specified, the branch's HEAD
  /// commit ID is used. If not specified, the default branch's HEAD commit ID
  /// is used.
  ///
  /// *   For Bitbucket: the commit ID, branch name, or tag name that
  /// corresponds to the version of the source code you want to build. If a
  /// branch name is specified, the branch's HEAD commit ID is used. If not
  /// specified, the default branch's HEAD commit ID is used.
  ///
  /// *   For Amazon Simple Storage Service (Amazon S3): the version ID of the
  /// object that represents the build input ZIP file to use.
  ///
  ///
  ///  If `sourceVersion` is specified at the build level, then that version
  /// takes precedence over this `sourceVersion` (at the project level).
  ///
  ///  For more information, see
  /// [Source Version Sample with CodeBuild](https://docs.aws.amazon.com/codebuild/latest/userguide/sample-source-version.html)
  /// in the _AWS CodeBuild User Guide_.
  ///
  /// [secondarySourceVersions]:  An array of `ProjectSourceVersion` objects. If
  /// `secondarySourceVersions` is specified at the build level, then they take
  /// over these `secondarySourceVersions` (at the project level).
  ///
  /// [artifacts]: Information to be changed about the build output artifacts
  /// for the build project.
  ///
  /// [secondaryArtifacts]:  An array of `ProjectSource` objects.
  ///
  /// [cache]: Stores recently used information so that it can be quickly
  /// accessed at a later time.
  ///
  /// [environment]: Information to be changed about the build environment for
  /// the build project.
  ///
  /// [serviceRole]: The replacement ARN of the AWS Identity and Access
  /// Management (IAM) role that enables AWS CodeBuild to interact with
  /// dependent AWS services on behalf of the AWS account.
  ///
  /// [timeoutInMinutes]: The replacement value in minutes, from 5 to 480 (8
  /// hours), for AWS CodeBuild to wait before timing out any related build that
  /// did not get marked as completed.
  ///
  /// [queuedTimeoutInMinutes]:  The number of minutes a build is allowed to be
  /// queued before it times out.
  ///
  /// [encryptionKey]: The AWS Key Management Service (AWS KMS) customer master
  /// key (CMK) to be used for encrypting the build output artifacts.
  ///
  ///   You can use a cross-account KMS key to encrypt the build output
  /// artifacts if your service role has permission to that key.
  ///
  /// You can specify either the Amazon Resource Name (ARN) of the CMK or, if
  /// available, the CMK's alias (using the format `alias/_alias-name_` ).
  ///
  /// [tags]: The replacement set of tags for this build project.
  ///
  /// These tags are available for use by AWS services that support AWS
  /// CodeBuild build project tags.
  ///
  /// [vpcConfig]: VpcConfig enables AWS CodeBuild to access resources in an
  /// Amazon VPC.
  ///
  /// [badgeEnabled]: Set this to true to generate a publicly accessible URL for
  /// your project's build badge.
  ///
  /// [logsConfig]:  Information about logs for the build project. A project can
  /// create logs in Amazon CloudWatch Logs, logs in an S3 bucket, or both.
  Future<UpdateProjectOutput> updateProject(String name,
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
      LogsConfig logsConfig}) async {
    var response_ = await _client.send('UpdateProject', {
      'name': name,
      if (description != null) 'description': description,
      if (source != null) 'source': source,
      if (secondarySources != null) 'secondarySources': secondarySources,
      if (sourceVersion != null) 'sourceVersion': sourceVersion,
      if (secondarySourceVersions != null)
        'secondarySourceVersions': secondarySourceVersions,
      if (artifacts != null) 'artifacts': artifacts,
      if (secondaryArtifacts != null) 'secondaryArtifacts': secondaryArtifacts,
      if (cache != null) 'cache': cache,
      if (environment != null) 'environment': environment,
      if (serviceRole != null) 'serviceRole': serviceRole,
      if (timeoutInMinutes != null) 'timeoutInMinutes': timeoutInMinutes,
      if (queuedTimeoutInMinutes != null)
        'queuedTimeoutInMinutes': queuedTimeoutInMinutes,
      if (encryptionKey != null) 'encryptionKey': encryptionKey,
      if (tags != null) 'tags': tags,
      if (vpcConfig != null) 'vpcConfig': vpcConfig,
      if (badgeEnabled != null) 'badgeEnabled': badgeEnabled,
      if (logsConfig != null) 'logsConfig': logsConfig,
    });
    return UpdateProjectOutput.fromJson(response_);
  }

  ///  Updates the webhook associated with an AWS CodeBuild build project.
  ///
  ///   If you use Bitbucket for your repository, `rotateSecret` is ignored.
  ///
  /// [projectName]: The name of the AWS CodeBuild project.
  ///
  /// [branchFilter]: A regular expression used to determine which repository
  /// branches are built when a webhook is triggered. If the name of a branch
  /// matches the regular expression, then it is built. If `branchFilter` is
  /// empty, then all branches are built.
  ///
  ///   It is recommended that you use `filterGroups` instead of `branchFilter`.
  ///
  /// [rotateSecret]:  A boolean value that specifies whether the associated
  /// GitHub repository's secret token should be updated. If you use Bitbucket
  /// for your repository, `rotateSecret` is ignored.
  ///
  /// [filterGroups]:  An array of arrays of `WebhookFilter` objects used to
  /// determine if a webhook event can trigger a build. A filter group must
  /// pcontain at least one `EVENT` `WebhookFilter`.
  Future<UpdateWebhookOutput> updateWebhook(String projectName,
      {String branchFilter,
      bool rotateSecret,
      List<List<WebhookFilter>> filterGroups}) async {
    var response_ = await _client.send('UpdateWebhook', {
      'projectName': projectName,
      if (branchFilter != null) 'branchFilter': branchFilter,
      if (rotateSecret != null) 'rotateSecret': rotateSecret,
      if (filterGroups != null) 'filterGroups': filterGroups,
    });
    return UpdateWebhookOutput.fromJson(response_);
  }
}

class BatchDeleteBuildsOutput {
  /// The IDs of the builds that were successfully deleted.
  final List<String> buildsDeleted;

  /// Information about any builds that could not be successfully deleted.
  final List<BuildNotDeleted> buildsNotDeleted;

  BatchDeleteBuildsOutput({
    this.buildsDeleted,
    this.buildsNotDeleted,
  });
  static BatchDeleteBuildsOutput fromJson(Map<String, dynamic> json) =>
      BatchDeleteBuildsOutput(
        buildsDeleted: json.containsKey('buildsDeleted')
            ? (json['buildsDeleted'] as List).map((e) => e as String).toList()
            : null,
        buildsNotDeleted: json.containsKey('buildsNotDeleted')
            ? (json['buildsNotDeleted'] as List)
                .map((e) => BuildNotDeleted.fromJson(e))
                .toList()
            : null,
      );
}

class BatchGetBuildsOutput {
  /// Information about the requested builds.
  final List<Build> builds;

  /// The IDs of builds for which information could not be found.
  final List<String> buildsNotFound;

  BatchGetBuildsOutput({
    this.builds,
    this.buildsNotFound,
  });
  static BatchGetBuildsOutput fromJson(Map<String, dynamic> json) =>
      BatchGetBuildsOutput(
        builds: json.containsKey('builds')
            ? (json['builds'] as List).map((e) => Build.fromJson(e)).toList()
            : null,
        buildsNotFound: json.containsKey('buildsNotFound')
            ? (json['buildsNotFound'] as List).map((e) => e as String).toList()
            : null,
      );
}

class BatchGetProjectsOutput {
  /// Information about the requested build projects.
  final List<Project> projects;

  /// The names of build projects for which information could not be found.
  final List<String> projectsNotFound;

  BatchGetProjectsOutput({
    this.projects,
    this.projectsNotFound,
  });
  static BatchGetProjectsOutput fromJson(Map<String, dynamic> json) =>
      BatchGetProjectsOutput(
        projects: json.containsKey('projects')
            ? (json['projects'] as List)
                .map((e) => Project.fromJson(e))
                .toList()
            : null,
        projectsNotFound: json.containsKey('projectsNotFound')
            ? (json['projectsNotFound'] as List)
                .map((e) => e as String)
                .toList()
            : null,
      );
}

/// Information about a build.
class Build {
  /// The unique ID for the build.
  final String id;

  /// The Amazon Resource Name (ARN) of the build.
  final String arn;

  /// When the build process started, expressed in Unix time format.
  final DateTime startTime;

  /// When the build process ended, expressed in Unix time format.
  final DateTime endTime;

  /// The current build phase.
  final String currentPhase;

  /// The current status of the build. Valid values include:
  ///
  /// *    `FAILED`: The build failed.
  ///
  /// *    `FAULT`: The build faulted.
  ///
  /// *    `IN_PROGRESS`: The build is still in progress.
  ///
  /// *    `STOPPED`: The build stopped.
  ///
  /// *    `SUCCEEDED`: The build succeeded.
  ///
  /// *    `TIMED_OUT`: The build timed out.
  final String buildStatus;

  /// Any version identifier for the version of the source code to be built. If
  /// `sourceVersion` is specified at the project level, then this
  /// `sourceVersion` (at the build level) takes precedence.
  ///
  ///  For more information, see
  /// [Source Version Sample with CodeBuild](https://docs.aws.amazon.com/codebuild/latest/userguide/sample-source-version.html)
  /// in the _AWS CodeBuild User Guide_.
  final String sourceVersion;

  ///  An identifier for the version of this build's source code.
  ///
  /// *    For AWS CodeCommit, GitHub, GitHub Enterprise, and BitBucket, the
  /// commit ID.
  ///
  /// *    For AWS CodePipeline, the source revision provided by AWS
  /// CodePipeline.
  ///
  /// *    For Amazon Simple Storage Service (Amazon S3), this does not apply.
  final String resolvedSourceVersion;

  /// The name of the AWS CodeBuild project.
  final String projectName;

  /// Information about all previous build phases that are complete and
  /// information about any current build phase that is not yet complete.
  final List<BuildPhase> phases;

  /// Information about the source code to be built.
  final ProjectSource source;

  ///  An array of `ProjectSource` objects.
  final List<ProjectSource> secondarySources;

  ///  An array of `ProjectSourceVersion` objects. Each `ProjectSourceVersion`
  /// must be one of:
  ///
  /// *   For AWS CodeCommit: the commit ID to use.
  ///
  /// *   For GitHub: the commit ID, pull request ID, branch name, or tag name
  /// that corresponds to the version of the source code you want to build. If a
  /// pull request ID is specified, it must use the format `pr/pull-request-ID`
  /// (for example, `pr/25`). If a branch name is specified, the branch's HEAD
  /// commit ID is used. If not specified, the default branch's HEAD commit ID
  /// is used.
  ///
  /// *   For Bitbucket: the commit ID, branch name, or tag name that
  /// corresponds to the version of the source code you want to build. If a
  /// branch name is specified, the branch's HEAD commit ID is used. If not
  /// specified, the default branch's HEAD commit ID is used.
  ///
  /// *   For Amazon Simple Storage Service (Amazon S3): the version ID of the
  /// object that represents the build input ZIP file to use.
  final List<ProjectSourceVersion> secondarySourceVersions;

  /// Information about the output artifacts for the build.
  final BuildArtifacts artifacts;

  ///  An array of `ProjectArtifacts` objects.
  final List<BuildArtifacts> secondaryArtifacts;

  /// Information about the cache for the build.
  final ProjectCache cache;

  /// Information about the build environment for this build.
  final ProjectEnvironment environment;

  /// The name of a service role used for this build.
  final String serviceRole;

  /// Information about the build's logs in Amazon CloudWatch Logs.
  final LogsLocation logs;

  /// How long, in minutes, for AWS CodeBuild to wait before timing out this
  /// build if it does not get marked as completed.
  final int timeoutInMinutes;

  ///  The number of minutes a build is allowed to be queued before it times
  /// out.
  final int queuedTimeoutInMinutes;

  /// Whether the build is complete. True if complete; otherwise, false.
  final bool buildComplete;

  /// The entity that started the build. Valid values include:
  ///
  /// *   If AWS CodePipeline started the build, the pipeline's name (for
  /// example, `codepipeline/my-demo-pipeline`).
  ///
  /// *   If an AWS Identity and Access Management (IAM) user started the build,
  /// the user's name (for example, `MyUserName`).
  ///
  /// *   If the Jenkins plugin for AWS CodeBuild started the build, the string
  /// `CodeBuild-Jenkins-Plugin`.
  final String initiator;

  /// If your AWS CodeBuild project accesses resources in an Amazon VPC, you
  /// provide this parameter that identifies the VPC ID and the list of security
  /// group IDs and subnet IDs. The security groups and subnets must belong to
  /// the same VPC. You must provide at least one security group and one subnet
  /// ID.
  final VpcConfig vpcConfig;

  /// Describes a network interface.
  final NetworkInterface networkInterface;

  /// The AWS Key Management Service (AWS KMS) customer master key (CMK) to be
  /// used for encrypting the build output artifacts.
  ///
  ///   You can use a cross-account KMS key to encrypt the build output
  /// artifacts if your service role has permission to that key.
  ///
  /// You can specify either the Amazon Resource Name (ARN) of the CMK or, if
  /// available, the CMK's alias (using the format `alias/_alias-name_` ).
  final String encryptionKey;

  Build({
    this.id,
    this.arn,
    this.startTime,
    this.endTime,
    this.currentPhase,
    this.buildStatus,
    this.sourceVersion,
    this.resolvedSourceVersion,
    this.projectName,
    this.phases,
    this.source,
    this.secondarySources,
    this.secondarySourceVersions,
    this.artifacts,
    this.secondaryArtifacts,
    this.cache,
    this.environment,
    this.serviceRole,
    this.logs,
    this.timeoutInMinutes,
    this.queuedTimeoutInMinutes,
    this.buildComplete,
    this.initiator,
    this.vpcConfig,
    this.networkInterface,
    this.encryptionKey,
  });
  static Build fromJson(Map<String, dynamic> json) => Build(
        id: json.containsKey('id') ? json['id'] as String : null,
        arn: json.containsKey('arn') ? json['arn'] as String : null,
        startTime: json.containsKey('startTime')
            ? DateTime.parse(json['startTime'])
            : null,
        endTime: json.containsKey('endTime')
            ? DateTime.parse(json['endTime'])
            : null,
        currentPhase: json.containsKey('currentPhase')
            ? json['currentPhase'] as String
            : null,
        buildStatus: json.containsKey('buildStatus')
            ? json['buildStatus'] as String
            : null,
        sourceVersion: json.containsKey('sourceVersion')
            ? json['sourceVersion'] as String
            : null,
        resolvedSourceVersion: json.containsKey('resolvedSourceVersion')
            ? json['resolvedSourceVersion'] as String
            : null,
        projectName: json.containsKey('projectName')
            ? json['projectName'] as String
            : null,
        phases: json.containsKey('phases')
            ? (json['phases'] as List)
                .map((e) => BuildPhase.fromJson(e))
                .toList()
            : null,
        source: json.containsKey('source')
            ? ProjectSource.fromJson(json['source'])
            : null,
        secondarySources: json.containsKey('secondarySources')
            ? (json['secondarySources'] as List)
                .map((e) => ProjectSource.fromJson(e))
                .toList()
            : null,
        secondarySourceVersions: json.containsKey('secondarySourceVersions')
            ? (json['secondarySourceVersions'] as List)
                .map((e) => ProjectSourceVersion.fromJson(e))
                .toList()
            : null,
        artifacts: json.containsKey('artifacts')
            ? BuildArtifacts.fromJson(json['artifacts'])
            : null,
        secondaryArtifacts: json.containsKey('secondaryArtifacts')
            ? (json['secondaryArtifacts'] as List)
                .map((e) => BuildArtifacts.fromJson(e))
                .toList()
            : null,
        cache: json.containsKey('cache')
            ? ProjectCache.fromJson(json['cache'])
            : null,
        environment: json.containsKey('environment')
            ? ProjectEnvironment.fromJson(json['environment'])
            : null,
        serviceRole: json.containsKey('serviceRole')
            ? json['serviceRole'] as String
            : null,
        logs: json.containsKey('logs')
            ? LogsLocation.fromJson(json['logs'])
            : null,
        timeoutInMinutes: json.containsKey('timeoutInMinutes')
            ? json['timeoutInMinutes'] as int
            : null,
        queuedTimeoutInMinutes: json.containsKey('queuedTimeoutInMinutes')
            ? json['queuedTimeoutInMinutes'] as int
            : null,
        buildComplete: json.containsKey('buildComplete')
            ? json['buildComplete'] as bool
            : null,
        initiator:
            json.containsKey('initiator') ? json['initiator'] as String : null,
        vpcConfig: json.containsKey('vpcConfig')
            ? VpcConfig.fromJson(json['vpcConfig'])
            : null,
        networkInterface: json.containsKey('networkInterface')
            ? NetworkInterface.fromJson(json['networkInterface'])
            : null,
        encryptionKey: json.containsKey('encryptionKey')
            ? json['encryptionKey'] as String
            : null,
      );
}

/// Information about build output artifacts.
class BuildArtifacts {
  /// Information about the location of the build artifacts.
  final String location;

  /// The SHA-256 hash of the build artifact.
  ///
  /// You can use this hash along with a checksum tool to confirm file integrity
  /// and authenticity.
  ///
  ///
  ///
  /// This value is available only if the build project's `packaging` value is
  /// set to `ZIP`.
  final String sha256Sum;

  /// The MD5 hash of the build artifact.
  ///
  /// You can use this hash along with a checksum tool to confirm file integrity
  /// and authenticity.
  ///
  ///
  ///
  /// This value is available only if the build project's `packaging` value is
  /// set to `ZIP`.
  final String md5sum;

  ///  If this flag is set, a name specified in the build spec file overrides
  /// the artifact name. The name specified in a build spec file is calculated
  /// at build time and uses the Shell Command Language. For example, you can
  /// append a date and time to your artifact name so that it is always unique.
  final bool overrideArtifactName;

  ///  Information that tells you if encryption for build artifacts is disabled.
  final bool encryptionDisabled;

  ///  An identifier for this artifact definition.
  final String artifactIdentifier;

  BuildArtifacts({
    this.location,
    this.sha256Sum,
    this.md5sum,
    this.overrideArtifactName,
    this.encryptionDisabled,
    this.artifactIdentifier,
  });
  static BuildArtifacts fromJson(Map<String, dynamic> json) => BuildArtifacts(
        location:
            json.containsKey('location') ? json['location'] as String : null,
        sha256Sum:
            json.containsKey('sha256sum') ? json['sha256sum'] as String : null,
        md5sum: json.containsKey('md5sum') ? json['md5sum'] as String : null,
        overrideArtifactName: json.containsKey('overrideArtifactName')
            ? json['overrideArtifactName'] as bool
            : null,
        encryptionDisabled: json.containsKey('encryptionDisabled')
            ? json['encryptionDisabled'] as bool
            : null,
        artifactIdentifier: json.containsKey('artifactIdentifier')
            ? json['artifactIdentifier'] as String
            : null,
      );
}

/// Information about a build that could not be successfully deleted.
class BuildNotDeleted {
  /// The ID of the build that could not be successfully deleted.
  final String id;

  /// Additional information about the build that could not be successfully
  /// deleted.
  final String statusCode;

  BuildNotDeleted({
    this.id,
    this.statusCode,
  });
  static BuildNotDeleted fromJson(Map<String, dynamic> json) => BuildNotDeleted(
        id: json.containsKey('id') ? json['id'] as String : null,
        statusCode: json.containsKey('statusCode')
            ? json['statusCode'] as String
            : null,
      );
}

/// Information about a stage for a build.
class BuildPhase {
  /// The name of the build phase. Valid values include:
  ///
  /// *    `BUILD`: Core build activities typically occur in this build phase.
  ///
  /// *    `COMPLETED`: The build has been completed.
  ///
  /// *    `DOWNLOAD_SOURCE`: Source code is being downloaded in this build
  /// phase.
  ///
  /// *    `FINALIZING`: The build process is completing in this build phase.
  ///
  /// *    `INSTALL`: Installation activities typically occur in this build
  /// phase.
  ///
  /// *    `POST_BUILD`: Post-build activities typically occur in this build
  /// phase.
  ///
  /// *    `PRE_BUILD`: Pre-build activities typically occur in this build
  /// phase.
  ///
  /// *    `PROVISIONING`: The build environment is being set up.
  ///
  /// *    `QUEUED`: The build has been submitted and is queued behind other
  /// submitted builds.
  ///
  /// *    `SUBMITTED`: The build has been submitted.
  ///
  /// *    `UPLOAD_ARTIFACTS`: Build output artifacts are being uploaded to the
  /// output location.
  final String phaseType;

  /// The current status of the build phase. Valid values include:
  ///
  /// *    `FAILED`: The build phase failed.
  ///
  /// *    `FAULT`: The build phase faulted.
  ///
  /// *    `IN_PROGRESS`: The build phase is still in progress.
  ///
  /// *    `QUEUED`: The build has been submitted and is queued behind other
  /// submitted builds.
  ///
  /// *    `STOPPED`: The build phase stopped.
  ///
  /// *    `SUCCEEDED`: The build phase succeeded.
  ///
  /// *    `TIMED_OUT`: The build phase timed out.
  final String phaseStatus;

  /// When the build phase started, expressed in Unix time format.
  final DateTime startTime;

  /// When the build phase ended, expressed in Unix time format.
  final DateTime endTime;

  /// How long, in seconds, between the starting and ending times of the build's
  /// phase.
  final BigInt durationInSeconds;

  /// Additional information about a build phase, especially to help
  /// troubleshoot a failed build.
  final List<PhaseContext> contexts;

  BuildPhase({
    this.phaseType,
    this.phaseStatus,
    this.startTime,
    this.endTime,
    this.durationInSeconds,
    this.contexts,
  });
  static BuildPhase fromJson(Map<String, dynamic> json) => BuildPhase(
        phaseType:
            json.containsKey('phaseType') ? json['phaseType'] as String : null,
        phaseStatus: json.containsKey('phaseStatus')
            ? json['phaseStatus'] as String
            : null,
        startTime: json.containsKey('startTime')
            ? DateTime.parse(json['startTime'])
            : null,
        endTime: json.containsKey('endTime')
            ? DateTime.parse(json['endTime'])
            : null,
        durationInSeconds: json.containsKey('durationInSeconds')
            ? BigInt.from(json['durationInSeconds'])
            : null,
        contexts: json.containsKey('contexts')
            ? (json['contexts'] as List)
                .map((e) => PhaseContext.fromJson(e))
                .toList()
            : null,
      );
}

///  Information about Amazon CloudWatch Logs for a build project.
class CloudWatchLogsConfig {
  /// The current status of the logs in Amazon CloudWatch Logs for a build
  /// project. Valid values are:
  ///
  /// *    `ENABLED`: Amazon CloudWatch Logs are enabled for this build project.
  ///
  /// *    `DISABLED`: Amazon CloudWatch Logs are not enabled for this build
  /// project.
  final String status;

  ///  The group name of the logs in Amazon CloudWatch Logs. For more
  /// information, see
  /// [Working with Log Groups and Log Streams](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/Working-with-log-groups-and-streams.html).
  final String groupName;

  ///  The prefix of the stream name of the Amazon CloudWatch Logs. For more
  /// information, see
  /// [Working with Log Groups and Log Streams](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/Working-with-log-groups-and-streams.html).
  final String streamName;

  CloudWatchLogsConfig({
    @required this.status,
    this.groupName,
    this.streamName,
  });
  static CloudWatchLogsConfig fromJson(Map<String, dynamic> json) =>
      CloudWatchLogsConfig(
        status: json['status'] as String,
        groupName:
            json.containsKey('groupName') ? json['groupName'] as String : null,
        streamName: json.containsKey('streamName')
            ? json['streamName'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class CreateProjectOutput {
  /// Information about the build project that was created.
  final Project project;

  CreateProjectOutput({
    this.project,
  });
  static CreateProjectOutput fromJson(Map<String, dynamic> json) =>
      CreateProjectOutput(
        project: json.containsKey('project')
            ? Project.fromJson(json['project'])
            : null,
      );
}

class CreateWebhookOutput {
  /// Information about a webhook that connects repository events to a build
  /// project in AWS CodeBuild.
  final Webhook webhook;

  CreateWebhookOutput({
    this.webhook,
  });
  static CreateWebhookOutput fromJson(Map<String, dynamic> json) =>
      CreateWebhookOutput(
        webhook: json.containsKey('webhook')
            ? Webhook.fromJson(json['webhook'])
            : null,
      );
}

class DeleteProjectOutput {
  DeleteProjectOutput();
  static DeleteProjectOutput fromJson(Map<String, dynamic> json) =>
      DeleteProjectOutput();
}

class DeleteSourceCredentialsOutput {
  ///  The Amazon Resource Name (ARN) of the token.
  final String arn;

  DeleteSourceCredentialsOutput({
    this.arn,
  });
  static DeleteSourceCredentialsOutput fromJson(Map<String, dynamic> json) =>
      DeleteSourceCredentialsOutput(
        arn: json.containsKey('arn') ? json['arn'] as String : null,
      );
}

class DeleteWebhookOutput {
  DeleteWebhookOutput();
  static DeleteWebhookOutput fromJson(Map<String, dynamic> json) =>
      DeleteWebhookOutput();
}

/// Information about a Docker image that is managed by AWS CodeBuild.
class EnvironmentImage {
  /// The name of the Docker image.
  final String name;

  /// The description of the Docker image.
  final String description;

  /// A list of environment image versions.
  final List<String> versions;

  EnvironmentImage({
    this.name,
    this.description,
    this.versions,
  });
  static EnvironmentImage fromJson(Map<String, dynamic> json) =>
      EnvironmentImage(
        name: json.containsKey('name') ? json['name'] as String : null,
        description: json.containsKey('description')
            ? json['description'] as String
            : null,
        versions: json.containsKey('versions')
            ? (json['versions'] as List).map((e) => e as String).toList()
            : null,
      );
}

/// A set of Docker images that are related by programming language and are
/// managed by AWS CodeBuild.
class EnvironmentLanguage {
  /// The programming language for the Docker images.
  final String language;

  /// The list of Docker images that are related by the specified programming
  /// language.
  final List<EnvironmentImage> images;

  EnvironmentLanguage({
    this.language,
    this.images,
  });
  static EnvironmentLanguage fromJson(Map<String, dynamic> json) =>
      EnvironmentLanguage(
        language:
            json.containsKey('language') ? json['language'] as String : null,
        images: json.containsKey('images')
            ? (json['images'] as List)
                .map((e) => EnvironmentImage.fromJson(e))
                .toList()
            : null,
      );
}

/// A set of Docker images that are related by platform and are managed by AWS
/// CodeBuild.
class EnvironmentPlatform {
  /// The platform's name.
  final String platform;

  /// The list of programming languages that are available for the specified
  /// platform.
  final List<EnvironmentLanguage> languages;

  EnvironmentPlatform({
    this.platform,
    this.languages,
  });
  static EnvironmentPlatform fromJson(Map<String, dynamic> json) =>
      EnvironmentPlatform(
        platform:
            json.containsKey('platform') ? json['platform'] as String : null,
        languages: json.containsKey('languages')
            ? (json['languages'] as List)
                .map((e) => EnvironmentLanguage.fromJson(e))
                .toList()
            : null,
      );
}

/// Information about an environment variable for a build project or a build.
class EnvironmentVariable {
  /// The name or key of the environment variable.
  final String name;

  /// The value of the environment variable.
  ///
  ///
  ///
  /// We strongly discourage the use of environment variables to store sensitive
  /// values, especially AWS secret key IDs and secret access keys. Environment
  /// variables can be displayed in plain text using the AWS CodeBuild console
  /// and the AWS Command Line Interface (AWS CLI).
  final String value;

  /// The type of environment variable. Valid values include:
  ///
  /// *    `PARAMETER_STORE`: An environment variable stored in Amazon EC2
  /// Systems Manager Parameter Store.
  ///
  /// *    `PLAINTEXT`: An environment variable in plaintext format.
  final String type;

  EnvironmentVariable({
    @required this.name,
    @required this.value,
    this.type,
  });
  static EnvironmentVariable fromJson(Map<String, dynamic> json) =>
      EnvironmentVariable(
        name: json['name'] as String,
        value: json['value'] as String,
        type: json.containsKey('type') ? json['type'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

///  Information about the Git submodules configuration for an AWS CodeBuild
/// build project.
class GitSubmodulesConfig {
  ///  Set to true to fetch Git submodules for your AWS CodeBuild build project.
  final bool fetchSubmodules;

  GitSubmodulesConfig({
    @required this.fetchSubmodules,
  });
  static GitSubmodulesConfig fromJson(Map<String, dynamic> json) =>
      GitSubmodulesConfig(
        fetchSubmodules: json['fetchSubmodules'] as bool,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class ImportSourceCredentialsOutput {
  ///  The Amazon Resource Name (ARN) of the token.
  final String arn;

  ImportSourceCredentialsOutput({
    this.arn,
  });
  static ImportSourceCredentialsOutput fromJson(Map<String, dynamic> json) =>
      ImportSourceCredentialsOutput(
        arn: json.containsKey('arn') ? json['arn'] as String : null,
      );
}

class InvalidateProjectCacheOutput {
  InvalidateProjectCacheOutput();
  static InvalidateProjectCacheOutput fromJson(Map<String, dynamic> json) =>
      InvalidateProjectCacheOutput();
}

class ListBuildsForProjectOutput {
  /// A list of build IDs for the specified build project, with each build ID
  /// representing a single build.
  final List<String> ids;

  /// If there are more than 100 items in the list, only the first 100 items are
  /// returned, along with a unique string called a _next token_. To get the
  /// next batch of items in the list, call this operation again, adding the
  /// next token to the call.
  final String nextToken;

  ListBuildsForProjectOutput({
    this.ids,
    this.nextToken,
  });
  static ListBuildsForProjectOutput fromJson(Map<String, dynamic> json) =>
      ListBuildsForProjectOutput(
        ids: json.containsKey('ids')
            ? (json['ids'] as List).map((e) => e as String).toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

class ListBuildsOutput {
  /// A list of build IDs, with each build ID representing a single build.
  final List<String> ids;

  /// If there are more than 100 items in the list, only the first 100 items are
  /// returned, along with a unique string called a _next token_. To get the
  /// next batch of items in the list, call this operation again, adding the
  /// next token to the call.
  final String nextToken;

  ListBuildsOutput({
    this.ids,
    this.nextToken,
  });
  static ListBuildsOutput fromJson(Map<String, dynamic> json) =>
      ListBuildsOutput(
        ids: json.containsKey('ids')
            ? (json['ids'] as List).map((e) => e as String).toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

class ListCuratedEnvironmentImagesOutput {
  /// Information about supported platforms for Docker images that are managed
  /// by AWS CodeBuild.
  final List<EnvironmentPlatform> platforms;

  ListCuratedEnvironmentImagesOutput({
    this.platforms,
  });
  static ListCuratedEnvironmentImagesOutput fromJson(
          Map<String, dynamic> json) =>
      ListCuratedEnvironmentImagesOutput(
        platforms: json.containsKey('platforms')
            ? (json['platforms'] as List)
                .map((e) => EnvironmentPlatform.fromJson(e))
                .toList()
            : null,
      );
}

class ListProjectsOutput {
  /// If there are more than 100 items in the list, only the first 100 items are
  /// returned, along with a unique string called a _next token_. To get the
  /// next batch of items in the list, call this operation again, adding the
  /// next token to the call.
  final String nextToken;

  /// The list of build project names, with each build project name representing
  /// a single build project.
  final List<String> projects;

  ListProjectsOutput({
    this.nextToken,
    this.projects,
  });
  static ListProjectsOutput fromJson(Map<String, dynamic> json) =>
      ListProjectsOutput(
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
        projects: json.containsKey('projects')
            ? (json['projects'] as List).map((e) => e as String).toList()
            : null,
      );
}

class ListSourceCredentialsOutput {
  ///  A list of `SourceCredentialsInfo` objects. Each `SourceCredentialsInfo`
  /// object includes the authentication type, token ARN, and type of source
  /// provider for one set of credentials.
  final List<SourceCredentialsInfo> sourceCredentialsInfos;

  ListSourceCredentialsOutput({
    this.sourceCredentialsInfos,
  });
  static ListSourceCredentialsOutput fromJson(Map<String, dynamic> json) =>
      ListSourceCredentialsOutput(
        sourceCredentialsInfos: json.containsKey('sourceCredentialsInfos')
            ? (json['sourceCredentialsInfos'] as List)
                .map((e) => SourceCredentialsInfo.fromJson(e))
                .toList()
            : null,
      );
}

///  Information about logs for a build project. These can be logs in Amazon
/// CloudWatch Logs, built in a specified S3 bucket, or both.
class LogsConfig {
  ///  Information about Amazon CloudWatch Logs for a build project. Amazon
  /// CloudWatch Logs are enabled by default.
  final CloudWatchLogsConfig cloudWatchLogs;

  ///  Information about logs built to an S3 bucket for a build project. S3 logs
  /// are not enabled by default.
  final S3LogsConfig s3Logs;

  LogsConfig({
    this.cloudWatchLogs,
    this.s3Logs,
  });
  static LogsConfig fromJson(Map<String, dynamic> json) => LogsConfig(
        cloudWatchLogs: json.containsKey('cloudWatchLogs')
            ? CloudWatchLogsConfig.fromJson(json['cloudWatchLogs'])
            : null,
        s3Logs: json.containsKey('s3Logs')
            ? S3LogsConfig.fromJson(json['s3Logs'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Information about build logs in Amazon CloudWatch Logs.
class LogsLocation {
  /// The name of the Amazon CloudWatch Logs group for the build logs.
  final String groupName;

  /// The name of the Amazon CloudWatch Logs stream for the build logs.
  final String streamName;

  /// The URL to an individual build log in Amazon CloudWatch Logs.
  final String deepLink;

  ///  The URL to a build log in an S3 bucket.
  final String s3DeepLink;

  ///  Information about Amazon CloudWatch Logs for a build project.
  final CloudWatchLogsConfig cloudWatchLogs;

  ///  Information about S3 logs for a build project.
  final S3LogsConfig s3Logs;

  LogsLocation({
    this.groupName,
    this.streamName,
    this.deepLink,
    this.s3DeepLink,
    this.cloudWatchLogs,
    this.s3Logs,
  });
  static LogsLocation fromJson(Map<String, dynamic> json) => LogsLocation(
        groupName:
            json.containsKey('groupName') ? json['groupName'] as String : null,
        streamName: json.containsKey('streamName')
            ? json['streamName'] as String
            : null,
        deepLink:
            json.containsKey('deepLink') ? json['deepLink'] as String : null,
        s3DeepLink: json.containsKey('s3DeepLink')
            ? json['s3DeepLink'] as String
            : null,
        cloudWatchLogs: json.containsKey('cloudWatchLogs')
            ? CloudWatchLogsConfig.fromJson(json['cloudWatchLogs'])
            : null,
        s3Logs: json.containsKey('s3Logs')
            ? S3LogsConfig.fromJson(json['s3Logs'])
            : null,
      );
}

/// Describes a network interface.
class NetworkInterface {
  /// The ID of the subnet.
  final String subnetId;

  /// The ID of the network interface.
  final String networkInterfaceId;

  NetworkInterface({
    this.subnetId,
    this.networkInterfaceId,
  });
  static NetworkInterface fromJson(Map<String, dynamic> json) =>
      NetworkInterface(
        subnetId:
            json.containsKey('subnetId') ? json['subnetId'] as String : null,
        networkInterfaceId: json.containsKey('networkInterfaceId')
            ? json['networkInterfaceId'] as String
            : null,
      );
}

/// Additional information about a build phase that has an error. You can use
/// this information for troubleshooting.
class PhaseContext {
  /// The status code for the context of the build phase.
  final String statusCode;

  /// An explanation of the build phase's context. This might include a command
  /// ID and an exit code.
  final String message;

  PhaseContext({
    this.statusCode,
    this.message,
  });
  static PhaseContext fromJson(Map<String, dynamic> json) => PhaseContext(
        statusCode: json.containsKey('statusCode')
            ? json['statusCode'] as String
            : null,
        message: json.containsKey('message') ? json['message'] as String : null,
      );
}

/// Information about a build project.
class Project {
  /// The name of the build project.
  final String name;

  /// The Amazon Resource Name (ARN) of the build project.
  final String arn;

  /// A description that makes the build project easy to identify.
  final String description;

  /// Information about the build input source code for this build project.
  final ProjectSource source;

  ///  An array of `ProjectSource` objects.
  final List<ProjectSource> secondarySources;

  /// A version of the build input to be built for this project. If not
  /// specified, the latest version is used. If specified, it must be one of:
  ///
  /// *   For AWS CodeCommit: the commit ID to use.
  ///
  /// *   For GitHub: the commit ID, pull request ID, branch name, or tag name
  /// that corresponds to the version of the source code you want to build. If a
  /// pull request ID is specified, it must use the format `pr/pull-request-ID`
  /// (for example `pr/25`). If a branch name is specified, the branch's HEAD
  /// commit ID is used. If not specified, the default branch's HEAD commit ID
  /// is used.
  ///
  /// *   For Bitbucket: the commit ID, branch name, or tag name that
  /// corresponds to the version of the source code you want to build. If a
  /// branch name is specified, the branch's HEAD commit ID is used. If not
  /// specified, the default branch's HEAD commit ID is used.
  ///
  /// *   For Amazon Simple Storage Service (Amazon S3): the version ID of the
  /// object that represents the build input ZIP file to use.
  ///
  ///
  ///  If `sourceVersion` is specified at the build level, then that version
  /// takes precedence over this `sourceVersion` (at the project level).
  ///
  ///  For more information, see
  /// [Source Version Sample with CodeBuild](https://docs.aws.amazon.com/codebuild/latest/userguide/sample-source-version.html)
  /// in the _AWS CodeBuild User Guide_.
  final String sourceVersion;

  ///  An array of `ProjectSourceVersion` objects. If `secondarySourceVersions`
  /// is specified at the build level, then they take over these
  /// `secondarySourceVersions` (at the project level).
  final List<ProjectSourceVersion> secondarySourceVersions;

  /// Information about the build output artifacts for the build project.
  final ProjectArtifacts artifacts;

  ///  An array of `ProjectArtifacts` objects.
  final List<ProjectArtifacts> secondaryArtifacts;

  /// Information about the cache for the build project.
  final ProjectCache cache;

  /// Information about the build environment for this build project.
  final ProjectEnvironment environment;

  /// The ARN of the AWS Identity and Access Management (IAM) role that enables
  /// AWS CodeBuild to interact with dependent AWS services on behalf of the AWS
  /// account.
  final String serviceRole;

  /// How long, in minutes, from 5 to 480 (8 hours), for AWS CodeBuild to wait
  /// before timing out any related build that did not get marked as completed.
  /// The default is 60 minutes.
  final int timeoutInMinutes;

  ///  The number of minutes a build is allowed to be queued before it times
  /// out.
  final int queuedTimeoutInMinutes;

  /// The AWS Key Management Service (AWS KMS) customer master key (CMK) to be
  /// used for encrypting the build output artifacts.
  ///
  ///   You can use a cross-account KMS key to encrypt the build output
  /// artifacts if your service role has permission to that key.
  ///
  /// You can specify either the Amazon Resource Name (ARN) of the CMK or, if
  /// available, the CMK's alias (using the format `alias/_alias-name_` ).
  final String encryptionKey;

  /// The tags for this build project.
  ///
  /// These tags are available for use by AWS services that support AWS
  /// CodeBuild build project tags.
  final List<Tag> tags;

  /// When the build project was created, expressed in Unix time format.
  final DateTime created;

  /// When the build project's settings were last modified, expressed in Unix
  /// time format.
  final DateTime lastModified;

  /// Information about a webhook that connects repository events to a build
  /// project in AWS CodeBuild.
  final Webhook webhook;

  /// Information about the VPC configuration that AWS CodeBuild accesses.
  final VpcConfig vpcConfig;

  /// Information about the build badge for the build project.
  final ProjectBadge badge;

  ///  Information about logs for the build project. A project can create logs
  /// in Amazon CloudWatch Logs, an S3 bucket, or both.
  final LogsConfig logsConfig;

  Project({
    this.name,
    this.arn,
    this.description,
    this.source,
    this.secondarySources,
    this.sourceVersion,
    this.secondarySourceVersions,
    this.artifacts,
    this.secondaryArtifacts,
    this.cache,
    this.environment,
    this.serviceRole,
    this.timeoutInMinutes,
    this.queuedTimeoutInMinutes,
    this.encryptionKey,
    this.tags,
    this.created,
    this.lastModified,
    this.webhook,
    this.vpcConfig,
    this.badge,
    this.logsConfig,
  });
  static Project fromJson(Map<String, dynamic> json) => Project(
        name: json.containsKey('name') ? json['name'] as String : null,
        arn: json.containsKey('arn') ? json['arn'] as String : null,
        description: json.containsKey('description')
            ? json['description'] as String
            : null,
        source: json.containsKey('source')
            ? ProjectSource.fromJson(json['source'])
            : null,
        secondarySources: json.containsKey('secondarySources')
            ? (json['secondarySources'] as List)
                .map((e) => ProjectSource.fromJson(e))
                .toList()
            : null,
        sourceVersion: json.containsKey('sourceVersion')
            ? json['sourceVersion'] as String
            : null,
        secondarySourceVersions: json.containsKey('secondarySourceVersions')
            ? (json['secondarySourceVersions'] as List)
                .map((e) => ProjectSourceVersion.fromJson(e))
                .toList()
            : null,
        artifacts: json.containsKey('artifacts')
            ? ProjectArtifacts.fromJson(json['artifacts'])
            : null,
        secondaryArtifacts: json.containsKey('secondaryArtifacts')
            ? (json['secondaryArtifacts'] as List)
                .map((e) => ProjectArtifacts.fromJson(e))
                .toList()
            : null,
        cache: json.containsKey('cache')
            ? ProjectCache.fromJson(json['cache'])
            : null,
        environment: json.containsKey('environment')
            ? ProjectEnvironment.fromJson(json['environment'])
            : null,
        serviceRole: json.containsKey('serviceRole')
            ? json['serviceRole'] as String
            : null,
        timeoutInMinutes: json.containsKey('timeoutInMinutes')
            ? json['timeoutInMinutes'] as int
            : null,
        queuedTimeoutInMinutes: json.containsKey('queuedTimeoutInMinutes')
            ? json['queuedTimeoutInMinutes'] as int
            : null,
        encryptionKey: json.containsKey('encryptionKey')
            ? json['encryptionKey'] as String
            : null,
        tags: json.containsKey('tags')
            ? (json['tags'] as List).map((e) => Tag.fromJson(e)).toList()
            : null,
        created: json.containsKey('created')
            ? DateTime.parse(json['created'])
            : null,
        lastModified: json.containsKey('lastModified')
            ? DateTime.parse(json['lastModified'])
            : null,
        webhook: json.containsKey('webhook')
            ? Webhook.fromJson(json['webhook'])
            : null,
        vpcConfig: json.containsKey('vpcConfig')
            ? VpcConfig.fromJson(json['vpcConfig'])
            : null,
        badge: json.containsKey('badge')
            ? ProjectBadge.fromJson(json['badge'])
            : null,
        logsConfig: json.containsKey('logsConfig')
            ? LogsConfig.fromJson(json['logsConfig'])
            : null,
      );
}

/// Information about the build output artifacts for the build project.
class ProjectArtifacts {
  /// The type of build output artifact. Valid values include:
  ///
  /// *    `CODEPIPELINE`: The build project has build output generated through
  /// AWS CodePipeline.
  ///
  /// *    `NO_ARTIFACTS`: The build project does not produce any build output.
  ///
  /// *    `S3`: The build project stores build output in Amazon Simple Storage
  /// Service (Amazon S3).
  final String type;

  /// Information about the build output artifact location:
  ///
  /// *   If `type` is set to `CODEPIPELINE`, AWS CodePipeline ignores this
  /// value if specified. This is because AWS CodePipeline manages its build
  /// output locations instead of AWS CodeBuild.
  ///
  /// *   If `type` is set to `NO_ARTIFACTS`, this value is ignored if
  /// specified, because no build output is produced.
  ///
  /// *   If `type` is set to `S3`, this is the name of the output bucket.
  final String location;

  /// Along with `namespaceType` and `name`, the pattern that AWS CodeBuild uses
  /// to name and store the output artifact:
  ///
  /// *   If `type` is set to `CODEPIPELINE`, AWS CodePipeline ignores this
  /// value if specified. This is because AWS CodePipeline manages its build
  /// output names instead of AWS CodeBuild.
  ///
  /// *   If `type` is set to `NO_ARTIFACTS`, this value is ignored if
  /// specified, because no build output is produced.
  ///
  /// *   If `type` is set to `S3`, this is the path to the output artifact. If
  /// `path` is not specified, `path` is not used.
  ///
  ///
  /// For example, if `path` is set to `MyArtifacts`, `namespaceType` is set to
  /// `NONE`, and `name` is set to `MyArtifact.zip`, the output artifact is
  /// stored in the output bucket at `MyArtifacts/MyArtifact.zip`.
  final String path;

  /// Along with `path` and `name`, the pattern that AWS CodeBuild uses to
  /// determine the name and location to store the output artifact:
  ///
  /// *   If `type` is set to `CODEPIPELINE`, AWS CodePipeline ignores this
  /// value if specified. This is because AWS CodePipeline manages its build
  /// output names instead of AWS CodeBuild.
  ///
  /// *   If `type` is set to `NO_ARTIFACTS`, this value is ignored if
  /// specified, because no build output is produced.
  ///
  /// *   If `type` is set to `S3`, valid values include:
  ///
  ///     *    `BUILD_ID`: Include the build ID in the location of the build
  /// output artifact.
  ///
  ///     *    `NONE`: Do not include the build ID. This is the default if
  /// `namespaceType` is not specified.
  ///
  ///
  ///
  /// For example, if `path` is set to `MyArtifacts`, `namespaceType` is set to
  /// `BUILD_ID`, and `name` is set to `MyArtifact.zip`, the output artifact is
  /// stored in `MyArtifacts/_build-ID_/MyArtifact.zip`.
  final String namespaceType;

  /// Along with `path` and `namespaceType`, the pattern that AWS CodeBuild uses
  /// to name and store the output artifact:
  ///
  /// *   If `type` is set to `CODEPIPELINE`, AWS CodePipeline ignores this
  /// value if specified. This is because AWS CodePipeline manages its build
  /// output names instead of AWS CodeBuild.
  ///
  /// *   If `type` is set to `NO_ARTIFACTS`, this value is ignored if
  /// specified, because no build output is produced.
  ///
  /// *   If `type` is set to `S3`, this is the name of the output artifact
  /// object. If you set the name to be a forward slash ("/"), the artifact is
  /// stored in the root of the output bucket.
  ///
  ///
  /// For example:
  ///
  /// *    If `path` is set to `MyArtifacts`, `namespaceType` is set to
  /// `BUILD_ID`, and `name` is set to `MyArtifact.zip`, then the output
  /// artifact is stored in `MyArtifacts/_build-ID_/MyArtifact.zip`.
  ///
  /// *    If `path` is empty, `namespaceType` is set to `NONE`, and `name` is
  /// set to "`/`", the output artifact is stored in the root of the output
  /// bucket.
  ///
  /// *    If `path` is set to `MyArtifacts`, `namespaceType` is set to
  /// `BUILD_ID`, and `name` is set to "`/`", the output artifact is stored in
  /// `MyArtifacts/_build-ID_` .
  final String name;

  /// The type of build output artifact to create:
  ///
  /// *   If `type` is set to `CODEPIPELINE`, AWS CodePipeline ignores this
  /// value if specified. This is because AWS CodePipeline manages its build
  /// output artifacts instead of AWS CodeBuild.
  ///
  /// *   If `type` is set to `NO_ARTIFACTS`, this value is ignored if
  /// specified, because no build output is produced.
  ///
  /// *   If `type` is set to `S3`, valid values include:
  ///
  ///     *    `NONE`: AWS CodeBuild creates in the output bucket a folder that
  /// contains the build output. This is the default if `packaging` is not
  /// specified.
  ///
  ///     *    `ZIP`: AWS CodeBuild creates in the output bucket a ZIP file that
  /// contains the build output.
  final String packaging;

  ///  If this flag is set, a name specified in the build spec file overrides
  /// the artifact name. The name specified in a build spec file is calculated
  /// at build time and uses the Shell Command Language. For example, you can
  /// append a date and time to your artifact name so that it is always unique.
  final bool overrideArtifactName;

  ///  Set to true if you do not want your output artifacts encrypted. This
  /// option is valid only if your artifacts type is Amazon Simple Storage
  /// Service (Amazon S3). If this is set with another artifacts type, an
  /// invalidInputException is thrown.
  final bool encryptionDisabled;

  ///  An identifier for this artifact definition.
  final String artifactIdentifier;

  ProjectArtifacts({
    @required this.type,
    this.location,
    this.path,
    this.namespaceType,
    this.name,
    this.packaging,
    this.overrideArtifactName,
    this.encryptionDisabled,
    this.artifactIdentifier,
  });
  static ProjectArtifacts fromJson(Map<String, dynamic> json) =>
      ProjectArtifacts(
        type: json['type'] as String,
        location:
            json.containsKey('location') ? json['location'] as String : null,
        path: json.containsKey('path') ? json['path'] as String : null,
        namespaceType: json.containsKey('namespaceType')
            ? json['namespaceType'] as String
            : null,
        name: json.containsKey('name') ? json['name'] as String : null,
        packaging:
            json.containsKey('packaging') ? json['packaging'] as String : null,
        overrideArtifactName: json.containsKey('overrideArtifactName')
            ? json['overrideArtifactName'] as bool
            : null,
        encryptionDisabled: json.containsKey('encryptionDisabled')
            ? json['encryptionDisabled'] as bool
            : null,
        artifactIdentifier: json.containsKey('artifactIdentifier')
            ? json['artifactIdentifier'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Information about the build badge for the build project.
class ProjectBadge {
  /// Set this to true to generate a publicly accessible URL for your project's
  /// build badge.
  final bool badgeEnabled;

  /// The publicly-accessible URL through which you can access the build badge
  /// for your project.
  ///
  /// The publicly accessible URL through which you can access the build badge
  /// for your project.
  final String badgeRequestUrl;

  ProjectBadge({
    this.badgeEnabled,
    this.badgeRequestUrl,
  });
  static ProjectBadge fromJson(Map<String, dynamic> json) => ProjectBadge(
        badgeEnabled: json.containsKey('badgeEnabled')
            ? json['badgeEnabled'] as bool
            : null,
        badgeRequestUrl: json.containsKey('badgeRequestUrl')
            ? json['badgeRequestUrl'] as String
            : null,
      );
}

/// Information about the cache for the build project.
class ProjectCache {
  /// The type of cache used by the build project. Valid values include:
  ///
  /// *    `NO_CACHE`: The build project does not use any cache.
  ///
  /// *    `S3`: The build project reads and writes from and to S3.
  ///
  /// *    `LOCAL`: The build project stores a cache locally on a build host
  /// that is only available to that build host.
  final String type;

  /// Information about the cache location:
  ///
  /// *    `NO_CACHE` or `LOCAL`: This value is ignored.
  ///
  /// *    `S3`: This is the S3 bucket name/prefix.
  final String location;

  ///  If you use a `LOCAL` cache, the local cache mode. You can use one or more
  /// local cache modes at the same time.
  ///
  /// *    `LOCAL_SOURCE_CACHE` mode caches Git metadata for primary and
  /// secondary sources. After the cache is created, subsequent builds pull only
  /// the change between commits. This mode is a good choice for projects with a
  /// clean working directory and a source that is a large Git repository. If
  /// you choose this option and your project does not use a Git repository
  /// (GitHub, GitHub Enterprise, or Bitbucket), the option is ignored.
  ///
  /// *    `LOCAL_DOCKER_LAYER_CACHE` mode caches existing Docker layers. This
  /// mode is a good choice for projects that build or pull large Docker images.
  /// It can prevent the performance issues caused by pulling large Docker
  /// images down from the network.
  ///
  ///       *    You can use a Docker layer cache in the Linux environment only.
  ///
  ///     *    The `privileged` flag must be set so that your project has the
  /// required Docker permissions.
  ///
  ///     *    You should consider the security implications before you use a
  /// Docker layer cache.
  ///
  /// *    `LOCAL_CUSTOM_CACHE` mode caches directories you specify in the
  /// buildspec file. This mode is a good choice if your build scenario is not
  /// suited to one of the other three local cache modes. If you use a custom
  /// cache:
  ///
  ///     *    Only directories can be specified for caching. You cannot specify
  /// individual files.
  ///
  ///     *    Symlinks are used to reference cached directories.
  ///
  ///     *    Cached directories are linked to your build before it downloads
  /// its project sources. Cached items are overriden if a source item has the
  /// same name. Directories are specified using cache paths in the buildspec
  /// file.
  final List<String> modes;

  ProjectCache({
    @required this.type,
    this.location,
    this.modes,
  });
  static ProjectCache fromJson(Map<String, dynamic> json) => ProjectCache(
        type: json['type'] as String,
        location:
            json.containsKey('location') ? json['location'] as String : null,
        modes: json.containsKey('modes')
            ? (json['modes'] as List).map((e) => e as String).toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Information about the build environment of the build project.
class ProjectEnvironment {
  /// The type of build environment to use for related builds.
  final String type;

  /// The image tag or image digest that identifies the Docker image to use for
  /// this build project. Use the following formats:
  ///
  /// *   For an image tag: `registry/repository:tag`. For example, to specify
  /// an image with the tag "latest," use `registry/repository:latest`.
  ///
  /// *   For an image digest: `registry/repository@digest`. For example, to
  /// specify an image with the digest
  /// "sha256:cbbf2f9a99b47fc460d422812b6a5adff7dfee951d8fa2e4a98caa0382cfbdbf,"
  /// use
  /// `registry/repository@sha256:cbbf2f9a99b47fc460d422812b6a5adff7dfee951d8fa2e4a98caa0382cfbdbf`.
  final String image;

  /// Information about the compute resources the build project uses. Available
  /// values include:
  ///
  /// *    `BUILD_GENERAL1_SMALL`: Use up to 3 GB memory and 2 vCPUs for builds.
  ///
  /// *    `BUILD_GENERAL1_MEDIUM`: Use up to 7 GB memory and 4 vCPUs for
  /// builds.
  ///
  /// *    `BUILD_GENERAL1_LARGE`: Use up to 15 GB memory and 8 vCPUs for
  /// builds.
  final String computeType;

  /// A set of environment variables to make available to builds for this build
  /// project.
  final List<EnvironmentVariable> environmentVariables;

  /// Enables running the Docker daemon inside a Docker container. Set to true
  /// only if the build project is used to build Docker images. Otherwise, a
  /// build that attempts to interact with the Docker daemon fails.
  ///
  /// You can initialize the Docker daemon during the install phase of your
  /// build by adding one of the following sets of commands to the install phase
  /// of your buildspec file:
  ///
  /// If the operating system's base image is Ubuntu Linux:
  ///
  ///  `- nohup /usr/local/bin/dockerd --host=unix:///var/run/docker.sock
  /// --host=tcp://0.0.0.0:2375 --storage-driver=overlay&`
  ///
  ///  `- timeout 15 sh -c "until docker info; do echo .; sleep 1; done"`
  ///
  /// If the operating system's base image is Alpine Linux and the previous
  /// command does not work, add the `-t` argument to `timeout`:
  ///
  ///  `- nohup /usr/local/bin/dockerd --host=unix:///var/run/docker.sock
  /// --host=tcp://0.0.0.0:2375 --storage-driver=overlay&`
  ///
  ///  `- timeout -t 15 sh -c "until docker info; do echo .; sleep 1; done"`
  final bool privilegedMode;

  /// The certificate to use with this build project.
  final String certificate;

  ///  The credentials for access to a private registry.
  final RegistryCredential registryCredential;

  ///  The type of credentials AWS CodeBuild uses to pull images in your build.
  /// There are two valid values:
  ///
  /// *    `CODEBUILD` specifies that AWS CodeBuild uses its own credentials.
  /// This requires that you modify your ECR repository policy to trust AWS
  /// CodeBuild's service principal.
  ///
  /// *    `SERVICE_ROLE` specifies that AWS CodeBuild uses your build project's
  /// service role.
  ///
  ///
  ///  When you use a cross-account or private registry image, you must use
  /// SERVICE_ROLE credentials. When you use an AWS CodeBuild curated image, you
  /// must use CODEBUILD credentials.
  final String imagePullCredentialsType;

  ProjectEnvironment({
    @required this.type,
    @required this.image,
    @required this.computeType,
    this.environmentVariables,
    this.privilegedMode,
    this.certificate,
    this.registryCredential,
    this.imagePullCredentialsType,
  });
  static ProjectEnvironment fromJson(Map<String, dynamic> json) =>
      ProjectEnvironment(
        type: json['type'] as String,
        image: json['image'] as String,
        computeType: json['computeType'] as String,
        environmentVariables: json.containsKey('environmentVariables')
            ? (json['environmentVariables'] as List)
                .map((e) => EnvironmentVariable.fromJson(e))
                .toList()
            : null,
        privilegedMode: json.containsKey('privilegedMode')
            ? json['privilegedMode'] as bool
            : null,
        certificate: json.containsKey('certificate')
            ? json['certificate'] as String
            : null,
        registryCredential: json.containsKey('registryCredential')
            ? RegistryCredential.fromJson(json['registryCredential'])
            : null,
        imagePullCredentialsType: json.containsKey('imagePullCredentialsType')
            ? json['imagePullCredentialsType'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Information about the build input source code for the build project.
class ProjectSource {
  /// The type of repository that contains the source code to be built. Valid
  /// values include:
  ///
  /// *    `BITBUCKET`: The source code is in a Bitbucket repository.
  ///
  /// *    `CODECOMMIT`: The source code is in an AWS CodeCommit repository.
  ///
  /// *    `CODEPIPELINE`: The source code settings are specified in the source
  /// action of a pipeline in AWS CodePipeline.
  ///
  /// *    `GITHUB`: The source code is in a GitHub repository.
  ///
  /// *    `NO_SOURCE`: The project does not have input source code.
  ///
  /// *    `S3`: The source code is in an Amazon Simple Storage Service (Amazon
  /// S3) input bucket.
  final String type;

  /// Information about the location of the source code to be built. Valid
  /// values include:
  ///
  /// *   For source code settings that are specified in the source action of a
  /// pipeline in AWS CodePipeline, `location` should not be specified. If it is
  /// specified, AWS CodePipeline ignores it. This is because AWS CodePipeline
  /// uses the settings in a pipeline's source action instead of this value.
  ///
  /// *   For source code in an AWS CodeCommit repository, the HTTPS clone URL
  /// to the repository that contains the source code and the build spec (for
  /// example,
  /// `https://git-codecommit._region-ID_.amazonaws.com/v1/repos/_repo-name_` ).
  ///
  /// *   For source code in an Amazon Simple Storage Service (Amazon S3) input
  /// bucket, one of the following.
  ///
  ///     *    The path to the ZIP file that contains the source code (for
  /// example,  `_bucket-name_/_path_/_to_/_object-name_.zip`).
  ///
  ///     *    The path to the folder that contains the source code (for
  /// example,  `_bucket-name_/_path_/_to_/_source-code_/_folder_/`).
  ///
  ///
  /// *   For source code in a GitHub repository, the HTTPS clone URL to the
  /// repository that contains the source and the build spec. You must connect
  /// your AWS account to your GitHub account. Use the AWS CodeBuild console to
  /// start creating a build project. When you use the console to connect (or
  /// reconnect) with GitHub, on the GitHub **Authorize application** page, for
  /// **Organization access**, choose **Request access** next to each repository
  /// you want to allow AWS CodeBuild to have access to, and then choose
  /// **Authorize application**. (After you have connected to your GitHub
  /// account, you do not need to finish creating the build project. You can
  /// leave the AWS CodeBuild console.) To instruct AWS CodeBuild to use this
  /// connection, in the `source` object, set the `auth` object's `type` value
  /// to `OAUTH`.
  ///
  /// *   For source code in a Bitbucket repository, the HTTPS clone URL to the
  /// repository that contains the source and the build spec. You must connect
  /// your AWS account to your Bitbucket account. Use the AWS CodeBuild console
  /// to start creating a build project. When you use the console to connect (or
  /// reconnect) with Bitbucket, on the Bitbucket **Confirm access to your
  /// account** page, choose **Grant access**. (After you have connected to your
  /// Bitbucket account, you do not need to finish creating the build project.
  /// You can leave the AWS CodeBuild console.) To instruct AWS CodeBuild to use
  /// this connection, in the `source` object, set the `auth` object's `type`
  /// value to `OAUTH`.
  final String location;

  /// Information about the Git clone depth for the build project.
  final int gitCloneDepth;

  ///  Information about the Git submodules configuration for the build project.
  final GitSubmodulesConfig gitSubmodulesConfig;

  /// The build spec declaration to use for the builds in this build project.
  ///
  /// If this value is not specified, a build spec must be included along with
  /// the source code to be built.
  final String buildspec;

  /// Information about the authorization settings for AWS CodeBuild to access
  /// the source code to be built.
  ///
  /// This information is for the AWS CodeBuild console's use only. Your code
  /// should not get or set this information directly.
  final SourceAuth auth;

  ///  Set to true to report the status of a build's start and finish to your
  /// source provider. This option is valid only when your source provider is
  /// GitHub, GitHub Enterprise, or Bitbucket. If this is set and you use a
  /// different source provider, an invalidInputException is thrown.
  final bool reportBuildStatus;

  /// Enable this flag to ignore SSL warnings while connecting to the project
  /// source code.
  final bool insecureSsl;

  ///  An identifier for this project source.
  final String sourceIdentifier;

  ProjectSource({
    @required this.type,
    this.location,
    this.gitCloneDepth,
    this.gitSubmodulesConfig,
    this.buildspec,
    this.auth,
    this.reportBuildStatus,
    this.insecureSsl,
    this.sourceIdentifier,
  });
  static ProjectSource fromJson(Map<String, dynamic> json) => ProjectSource(
        type: json['type'] as String,
        location:
            json.containsKey('location') ? json['location'] as String : null,
        gitCloneDepth: json.containsKey('gitCloneDepth')
            ? json['gitCloneDepth'] as int
            : null,
        gitSubmodulesConfig: json.containsKey('gitSubmodulesConfig')
            ? GitSubmodulesConfig.fromJson(json['gitSubmodulesConfig'])
            : null,
        buildspec:
            json.containsKey('buildspec') ? json['buildspec'] as String : null,
        auth:
            json.containsKey('auth') ? SourceAuth.fromJson(json['auth']) : null,
        reportBuildStatus: json.containsKey('reportBuildStatus')
            ? json['reportBuildStatus'] as bool
            : null,
        insecureSsl: json.containsKey('insecureSsl')
            ? json['insecureSsl'] as bool
            : null,
        sourceIdentifier: json.containsKey('sourceIdentifier')
            ? json['sourceIdentifier'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

///  A source identifier and its corresponding version.
class ProjectSourceVersion {
  /// An identifier for a source in the build project.
  final String sourceIdentifier;

  /// The source version for the corresponding source identifier. If specified,
  /// must be one of:
  ///
  /// *   For AWS CodeCommit: the commit ID to use.
  ///
  /// *   For GitHub: the commit ID, pull request ID, branch name, or tag name
  /// that corresponds to the version of the source code you want to build. If a
  /// pull request ID is specified, it must use the format `pr/pull-request-ID`
  /// (for example, `pr/25`). If a branch name is specified, the branch's HEAD
  /// commit ID is used. If not specified, the default branch's HEAD commit ID
  /// is used.
  ///
  /// *   For Bitbucket: the commit ID, branch name, or tag name that
  /// corresponds to the version of the source code you want to build. If a
  /// branch name is specified, the branch's HEAD commit ID is used. If not
  /// specified, the default branch's HEAD commit ID is used.
  ///
  /// *   For Amazon Simple Storage Service (Amazon S3): the version ID of the
  /// object that represents the build input ZIP file to use.
  ///
  ///
  ///  For more information, see
  /// [Source Version Sample with CodeBuild](https://docs.aws.amazon.com/codebuild/latest/userguide/sample-source-version.html)
  /// in the _AWS CodeBuild User Guide_.
  final String sourceVersion;

  ProjectSourceVersion({
    @required this.sourceIdentifier,
    @required this.sourceVersion,
  });
  static ProjectSourceVersion fromJson(Map<String, dynamic> json) =>
      ProjectSourceVersion(
        sourceIdentifier: json['sourceIdentifier'] as String,
        sourceVersion: json['sourceVersion'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

///  Information about credentials that provide access to a private Docker
/// registry. When this is set:
///
/// *    `imagePullCredentialsType` must be set to `SERVICE_ROLE`.
///
/// *    images cannot be curated or an Amazon ECR image.
///
///
///  For more information, see
/// [Private Registry with AWS Secrets Manager Sample for AWS CodeBuild](https://docs.aws.amazon.com/codebuild/latest/userguide/sample-private-registry.html).
class RegistryCredential {
  ///  The Amazon Resource Name (ARN) or name of credentials created using AWS
  /// Secrets Manager.
  ///
  ///   The `credential` can use the name of the credentials only if they exist
  /// in your current region.
  final String credential;

  ///  The service that created the credentials to access a private Docker
  /// registry. The valid value, SECRETS_MANAGER, is for AWS Secrets Manager.
  final String credentialProvider;

  RegistryCredential({
    @required this.credential,
    @required this.credentialProvider,
  });
  static RegistryCredential fromJson(Map<String, dynamic> json) =>
      RegistryCredential(
        credential: json['credential'] as String,
        credentialProvider: json['credentialProvider'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

///  Information about S3 logs for a build project.
class S3LogsConfig {
  /// The current status of the S3 build logs. Valid values are:
  ///
  /// *    `ENABLED`: S3 build logs are enabled for this build project.
  ///
  /// *    `DISABLED`: S3 build logs are not enabled for this build project.
  final String status;

  ///  The ARN of an S3 bucket and the path prefix for S3 logs. If your Amazon
  /// S3 bucket name is `my-bucket`, and your path prefix is `build-log`, then
  /// acceptable formats are `my-bucket/build-log` or
  /// `arn:aws:s3:::my-bucket/build-log`.
  final String location;

  ///  Set to true if you do not want your S3 build log output encrypted. By
  /// default S3 build logs are encrypted.
  final bool encryptionDisabled;

  S3LogsConfig({
    @required this.status,
    this.location,
    this.encryptionDisabled,
  });
  static S3LogsConfig fromJson(Map<String, dynamic> json) => S3LogsConfig(
        status: json['status'] as String,
        location:
            json.containsKey('location') ? json['location'] as String : null,
        encryptionDisabled: json.containsKey('encryptionDisabled')
            ? json['encryptionDisabled'] as bool
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Information about the authorization settings for AWS CodeBuild to access the
/// source code to be built.
///
/// This information is for the AWS CodeBuild console's use only. Your code
/// should not get or set this information directly.
class SourceAuth {
  ///  This data type is deprecated and is no longer accurate or used.
  ///
  /// The authorization type to use. The only valid value is `OAUTH`, which
  /// represents the OAuth authorization type.
  final String type;

  /// The resource value that applies to the specified authorization type.
  final String resource;

  SourceAuth({
    @required this.type,
    this.resource,
  });
  static SourceAuth fromJson(Map<String, dynamic> json) => SourceAuth(
        type: json['type'] as String,
        resource:
            json.containsKey('resource') ? json['resource'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

///  Information about the credentials for a GitHub, GitHub Enterprise, or
/// Bitbucket repository.
class SourceCredentialsInfo {
  ///  The Amazon Resource Name (ARN) of the token.
  final String arn;

  ///  The type of source provider. The valid options are GITHUB,
  /// GITHUB_ENTERPRISE, or BITBUCKET.
  final String serverType;

  ///  The type of authentication used by the credentials. Valid options are
  /// OAUTH, BASIC_AUTH, or PERSONAL_ACCESS_TOKEN.
  final String authType;

  SourceCredentialsInfo({
    this.arn,
    this.serverType,
    this.authType,
  });
  static SourceCredentialsInfo fromJson(Map<String, dynamic> json) =>
      SourceCredentialsInfo(
        arn: json.containsKey('arn') ? json['arn'] as String : null,
        serverType: json.containsKey('serverType')
            ? json['serverType'] as String
            : null,
        authType:
            json.containsKey('authType') ? json['authType'] as String : null,
      );
}

class StartBuildOutput {
  /// Information about the build to be run.
  final Build build;

  StartBuildOutput({
    this.build,
  });
  static StartBuildOutput fromJson(Map<String, dynamic> json) =>
      StartBuildOutput(
        build: json.containsKey('build') ? Build.fromJson(json['build']) : null,
      );
}

class StopBuildOutput {
  /// Information about the build.
  final Build build;

  StopBuildOutput({
    this.build,
  });
  static StopBuildOutput fromJson(Map<String, dynamic> json) => StopBuildOutput(
        build: json.containsKey('build') ? Build.fromJson(json['build']) : null,
      );
}

/// A tag, consisting of a key and a value.
///
/// This tag is available for use by AWS services that support tags in AWS
/// CodeBuild.
class Tag {
  /// The tag's key.
  final String key;

  /// The tag's value.
  final String value;

  Tag({
    this.key,
    this.value,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag(
        key: json.containsKey('key') ? json['key'] as String : null,
        value: json.containsKey('value') ? json['value'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class UpdateProjectOutput {
  /// Information about the build project that was changed.
  final Project project;

  UpdateProjectOutput({
    this.project,
  });
  static UpdateProjectOutput fromJson(Map<String, dynamic> json) =>
      UpdateProjectOutput(
        project: json.containsKey('project')
            ? Project.fromJson(json['project'])
            : null,
      );
}

class UpdateWebhookOutput {
  ///  Information about a repository's webhook that is associated with a
  /// project in AWS CodeBuild.
  final Webhook webhook;

  UpdateWebhookOutput({
    this.webhook,
  });
  static UpdateWebhookOutput fromJson(Map<String, dynamic> json) =>
      UpdateWebhookOutput(
        webhook: json.containsKey('webhook')
            ? Webhook.fromJson(json['webhook'])
            : null,
      );
}

/// Information about the VPC configuration that AWS CodeBuild accesses.
class VpcConfig {
  /// The ID of the Amazon VPC.
  final String vpcId;

  /// A list of one or more subnet IDs in your Amazon VPC.
  final List<String> subnets;

  /// A list of one or more security groups IDs in your Amazon VPC.
  final List<String> securityGroupIds;

  VpcConfig({
    this.vpcId,
    this.subnets,
    this.securityGroupIds,
  });
  static VpcConfig fromJson(Map<String, dynamic> json) => VpcConfig(
        vpcId: json.containsKey('vpcId') ? json['vpcId'] as String : null,
        subnets: json.containsKey('subnets')
            ? (json['subnets'] as List).map((e) => e as String).toList()
            : null,
        securityGroupIds: json.containsKey('securityGroupIds')
            ? (json['securityGroupIds'] as List)
                .map((e) => e as String)
                .toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Information about a webhook that connects repository events to a build
/// project in AWS CodeBuild.
class Webhook {
  /// The URL to the webhook.
  final String url;

  ///  The AWS CodeBuild endpoint where webhook events are sent.
  final String payloadUrl;

  ///  The secret token of the associated repository.
  ///
  ///   A Bitbucket webhook does not support `secret`.
  final String secret;

  /// A regular expression used to determine which repository branches are built
  /// when a webhook is triggered. If the name of a branch matches the regular
  /// expression, then it is built. If `branchFilter` is empty, then all
  /// branches are built.
  ///
  ///   It is recommended that you use `filterGroups` instead of `branchFilter`.
  final String branchFilter;

  ///  An array of arrays of `WebhookFilter` objects used to determine which
  /// webhooks are triggered. At least one `WebhookFilter` in the array must
  /// specify `EVENT` as its `type`.
  ///
  ///  For a build to be triggered, at least one filter group in the
  /// `filterGroups` array must pass. For a filter group to pass, each of its
  /// filters must pass.
  final List<List<WebhookFilter>> filterGroups;

  ///  A timestamp that indicates the last time a repository's secret token was
  /// modified.
  final DateTime lastModifiedSecret;

  Webhook({
    this.url,
    this.payloadUrl,
    this.secret,
    this.branchFilter,
    this.filterGroups,
    this.lastModifiedSecret,
  });
  static Webhook fromJson(Map<String, dynamic> json) => Webhook(
        url: json.containsKey('url') ? json['url'] as String : null,
        payloadUrl: json.containsKey('payloadUrl')
            ? json['payloadUrl'] as String
            : null,
        secret: json.containsKey('secret') ? json['secret'] as String : null,
        branchFilter: json.containsKey('branchFilter')
            ? json['branchFilter'] as String
            : null,
        filterGroups: json.containsKey('filterGroups')
            ? (json['filterGroups'] as List)
                .map((e) =>
                    (e as List).map((e) => WebhookFilter.fromJson(e)).toList())
                .toList()
            : null,
        lastModifiedSecret: json.containsKey('lastModifiedSecret')
            ? DateTime.parse(json['lastModifiedSecret'])
            : null,
      );
}

///  A filter used to determine which webhooks trigger a build.
class WebhookFilter {
  ///  The type of webhook filter. There are five webhook filter types: `EVENT`,
  /// `ACTOR_ACCOUNT_ID`, `HEAD_REF`, `BASE_REF`, and `FILE_PATH`.
  ///
  ///  EVENT
  ///
  ///  A webhook event triggers a build when the provided `pattern` matches one
  /// of four event types: `PUSH`, `PULL_REQUEST_CREATED`,
  /// `PULL_REQUEST_UPDATED`, and `PULL_REQUEST_REOPENED`. The `EVENT` patterns
  /// are specified as a comma-separated string. For example, `PUSH,
  /// PULL_REQUEST_CREATED, PULL_REQUEST_UPDATED` filters all push, pull request
  /// created, and pull request updated events.
  ///
  ///   The `PULL_REQUEST_REOPENED` works with GitHub and GitHub Enterprise
  /// only.
  ///
  ///  ACTOR_ACCOUNT_ID
  ///
  ///  A webhook event triggers a build when a GitHub, GitHub Enterprise, or
  /// Bitbucket account ID matches the regular expression `pattern`.
  ///
  ///  HEAD_REF
  ///
  ///  A webhook event triggers a build when the head reference matches the
  /// regular expression `pattern`. For example, `refs/heads/branch-name` and
  /// `refs/tags/tag-name`.
  ///
  ///  Works with GitHub and GitHub Enterprise push, GitHub and GitHub
  /// Enterprise pull request, Bitbucket push, and Bitbucket pull request
  /// events.
  ///
  ///  BASE_REF
  ///
  ///  A webhook event triggers a build when the base reference matches the
  /// regular expression `pattern`. For example, `refs/heads/branch-name`.
  ///
  ///   Works with pull request events only.
  ///
  ///  FILE_PATH
  ///
  ///  A webhook triggers a build when the path of a changed file matches the
  /// regular expression `pattern`.
  ///
  ///   Works with GitHub and GitHub Enterprise push events only.
  final String type;

  ///  For a `WebHookFilter` that uses `EVENT` type, a comma-separated string
  /// that specifies one or more events. For example, the webhook filter `PUSH,
  /// PULL_REQUEST_CREATED, PULL_REQUEST_UPDATED` allows all push, pull request
  /// created, and pull request updated events to trigger a build.
  ///
  ///  For a `WebHookFilter` that uses any of the other filter types, a regular
  /// expression pattern. For example, a `WebHookFilter` that uses `HEAD_REF`
  /// for its `type` and the pattern `^refs/heads/` triggers a build when the
  /// head reference is a branch with a reference name `refs/heads/branch-name`.
  final String pattern;

  ///  Used to indicate that the `pattern` determines which webhook events do
  /// not trigger a build. If true, then a webhook event that does not match the
  /// `pattern` triggers a build. If false, then a webhook event that matches
  /// the `pattern` triggers a build.
  final bool excludeMatchedPattern;

  WebhookFilter({
    @required this.type,
    @required this.pattern,
    this.excludeMatchedPattern,
  });
  static WebhookFilter fromJson(Map<String, dynamic> json) => WebhookFilter(
        type: json['type'] as String,
        pattern: json['pattern'] as String,
        excludeMatchedPattern: json.containsKey('excludeMatchedPattern')
            ? json['excludeMatchedPattern'] as bool
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}
