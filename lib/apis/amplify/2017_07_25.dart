import 'package:meta/meta.dart';

///  Amplify is a fully managed continuous deployment and hosting service for
/// modern web apps.
class AmplifyApi {
  ///  Creates a new Amplify App.
  ///
  /// [name]:  Name for the Amplify App
  ///
  /// [description]:  Description for an Amplify App
  ///
  /// [repository]:  Repository for an Amplify App
  ///
  /// [platform]:  Platform / framework for an Amplify App
  ///
  /// [iamServiceRoleArn]:  AWS IAM service role for an Amplify App
  ///
  /// [oauthToken]:  OAuth token for 3rd party source control system for an
  /// Amplify App, used to create webhook and read-only deploy key. OAuth token
  /// is not stored.
  ///
  /// [accessToken]:  Personal Access token for 3rd party source control system
  /// for an Amplify App, used to create webhook and read-only deploy key. Token
  /// is not stored.
  ///
  /// [environmentVariables]:  Environment variables map for an Amplify App.
  ///
  /// [enableBranchAutoBuild]:  Enable the auto building of branches for an
  /// Amplify App.
  ///
  /// [enableBasicAuth]:  Enable Basic Authorization for an Amplify App, this
  /// will apply to all branches part of this App.
  ///
  /// [basicAuthCredentials]:  Credentials for Basic Authorization for an
  /// Amplify App.
  ///
  /// [customRules]:  Custom rewrite / redirect rules for an Amplify App.
  ///
  /// [tags]:  Tag for an Amplify App
  ///
  /// [buildSpec]:  BuildSpec for an Amplify App
  ///
  /// [enableAutoBranchCreation]:  Enables automated branch creation for the
  /// Amplify App.
  ///
  /// [autoBranchCreationPatterns]:  Automated branch creation glob patterns for
  /// the Amplify App.
  ///
  /// [autoBranchCreationConfig]:  Automated branch creation config for the
  /// Amplify App.
  Future<CreateAppResult> createApp(String name,
      {String description,
      String repository,
      String platform,
      String iamServiceRoleArn,
      String oauthToken,
      String accessToken,
      Map<String, String> environmentVariables,
      bool enableBranchAutoBuild,
      bool enableBasicAuth,
      String basicAuthCredentials,
      List<CustomRule> customRules,
      Map<String, String> tags,
      String buildSpec,
      bool enableAutoBranchCreation,
      List<String> autoBranchCreationPatterns,
      AutoBranchCreationConfig autoBranchCreationConfig}) async {
    return CreateAppResult.fromJson({});
  }

  ///  Creates a new Branch for an Amplify App.
  ///
  /// [appId]:  Unique Id for an Amplify App.
  ///
  /// [branchName]:  Name for the branch.
  ///
  /// [description]:  Description for the branch.
  ///
  /// [stage]:  Stage for the branch.
  ///
  /// [framework]:  Framework for the branch.
  ///
  /// [enableNotification]:  Enables notifications for the branch.
  ///
  /// [enableAutoBuild]:  Enables auto building for the branch.
  ///
  /// [environmentVariables]:  Environment Variables for the branch.
  ///
  /// [basicAuthCredentials]:  Basic Authorization credentials for the branch.
  ///
  /// [enableBasicAuth]:  Enables Basic Auth for the branch.
  ///
  /// [tags]:  Tag for the branch.
  ///
  /// [buildSpec]:  BuildSpec for the branch.
  ///
  /// [ttl]:  The content TTL for the website in seconds.
  ///
  /// [displayName]:  Display name for a branch, will use as the default domain
  /// prefix.
  Future<CreateBranchResult> createBranch(
      {@required String appId,
      @required String branchName,
      String description,
      String stage,
      String framework,
      bool enableNotification,
      bool enableAutoBuild,
      Map<String, String> environmentVariables,
      String basicAuthCredentials,
      bool enableBasicAuth,
      Map<String, String> tags,
      String buildSpec,
      String ttl,
      String displayName}) async {
    return CreateBranchResult.fromJson({});
  }

  ///  Create a deployment for manual deploy apps. (Apps are not connected to
  /// repository)
  ///
  /// [appId]:  Unique Id for an Amplify App.
  ///
  /// [branchName]:  Name for the branch, for the Job.
  ///
  /// [fileMap]:  Optional file map that contains file name as the key and file
  /// content md5 hash as the value. If this argument is provided, the service
  /// will generate different upload url per file. Otherwise, the service will
  /// only generate a single upload url for the zipped files.
  Future<CreateDeploymentResult> createDeployment(
      {@required String appId,
      @required String branchName,
      Map<String, String> fileMap}) async {
    return CreateDeploymentResult.fromJson({});
  }

  ///  Create a new DomainAssociation on an App
  ///
  /// [appId]:  Unique Id for an Amplify App.
  ///
  /// [domainName]:  Domain name for the Domain Association.
  ///
  /// [enableAutoSubDomain]:  Enables automated creation of Subdomains for
  /// branches.
  ///
  /// [subDomainSettings]:  Setting structure for the Subdomain.
  Future<CreateDomainAssociationResult> createDomainAssociation(
      {@required String appId,
      @required String domainName,
      bool enableAutoSubDomain,
      @required List<SubDomainSetting> subDomainSettings}) async {
    return CreateDomainAssociationResult.fromJson({});
  }

  ///  Create a new webhook on an App.
  ///
  /// [appId]:  Unique Id for an Amplify App.
  ///
  /// [branchName]:  Name for a branch, part of an Amplify App.
  ///
  /// [description]:  Description for a webhook.
  Future<CreateWebhookResult> createWebhook(
      {@required String appId,
      @required String branchName,
      String description}) async {
    return CreateWebhookResult.fromJson({});
  }

  ///  Delete an existing Amplify App by appId.
  ///
  /// [appId]:  Unique Id for an Amplify App.
  Future<DeleteAppResult> deleteApp(String appId) async {
    return DeleteAppResult.fromJson({});
  }

  ///  Deletes a branch for an Amplify App.
  ///
  /// [appId]:  Unique Id for an Amplify App.
  ///
  /// [branchName]:  Name for the branch.
  Future<DeleteBranchResult> deleteBranch(
      {@required String appId, @required String branchName}) async {
    return DeleteBranchResult.fromJson({});
  }

  ///  Deletes a DomainAssociation.
  ///
  /// [appId]:  Unique Id for an Amplify App.
  ///
  /// [domainName]:  Name of the domain.
  Future<DeleteDomainAssociationResult> deleteDomainAssociation(
      {@required String appId, @required String domainName}) async {
    return DeleteDomainAssociationResult.fromJson({});
  }

  ///  Delete a job, for an Amplify branch, part of Amplify App.
  ///
  /// [appId]:  Unique Id for an Amplify App.
  ///
  /// [branchName]:  Name for the branch, for the Job.
  ///
  /// [jobId]:  Unique Id for the Job.
  Future<DeleteJobResult> deleteJob(
      {@required String appId,
      @required String branchName,
      @required String jobId}) async {
    return DeleteJobResult.fromJson({});
  }

  ///  Deletes a webhook.
  ///
  /// [webhookId]:  Unique Id for a webhook.
  Future<DeleteWebhookResult> deleteWebhook(String webhookId) async {
    return DeleteWebhookResult.fromJson({});
  }

  ///  Retrieves an existing Amplify App by appId.
  ///
  /// [appId]:  Unique Id for an Amplify App.
  Future<GetAppResult> getApp(String appId) async {
    return GetAppResult.fromJson({});
  }

  ///  Retrieves a branch for an Amplify App.
  ///
  /// [appId]:  Unique Id for an Amplify App.
  ///
  /// [branchName]:  Name for the branch.
  Future<GetBranchResult> getBranch(
      {@required String appId, @required String branchName}) async {
    return GetBranchResult.fromJson({});
  }

  ///  Retrieves domain info that corresponds to an appId and domainName.
  ///
  /// [appId]:  Unique Id for an Amplify App.
  ///
  /// [domainName]:  Name of the domain.
  Future<GetDomainAssociationResult> getDomainAssociation(
      {@required String appId, @required String domainName}) async {
    return GetDomainAssociationResult.fromJson({});
  }

  ///  Get a job for a branch, part of an Amplify App.
  ///
  /// [appId]:  Unique Id for an Amplify App.
  ///
  /// [branchName]:  Name for the branch, for the Job.
  ///
  /// [jobId]:  Unique Id for the Job.
  Future<GetJobResult> getJob(
      {@required String appId,
      @required String branchName,
      @required String jobId}) async {
    return GetJobResult.fromJson({});
  }

  ///  Retrieves webhook info that corresponds to a webhookId.
  ///
  /// [webhookId]:  Unique Id for a webhook.
  Future<GetWebhookResult> getWebhook(String webhookId) async {
    return GetWebhookResult.fromJson({});
  }

  ///  Lists existing Amplify Apps.
  ///
  /// [nextToken]:  Pagination token. If non-null pagination token is returned
  /// in a result, then pass its value in another request to fetch more entries.
  ///
  /// [maxResults]:  Maximum number of records to list in a single response.
  Future<ListAppsResult> listApps({String nextToken, int maxResults}) async {
    return ListAppsResult.fromJson({});
  }

  ///  Lists branches for an Amplify App.
  ///
  /// [appId]:  Unique Id for an Amplify App.
  ///
  /// [nextToken]:  Pagination token. Set to null to start listing branches from
  /// start. If a non-null pagination token is returned in a result, then pass
  /// its value in here to list more branches.
  ///
  /// [maxResults]:  Maximum number of records to list in a single response.
  Future<ListBranchesResult> listBranches(String appId,
      {String nextToken, int maxResults}) async {
    return ListBranchesResult.fromJson({});
  }

  ///  List domains with an app
  ///
  /// [appId]:  Unique Id for an Amplify App.
  ///
  /// [nextToken]:  Pagination token. Set to null to start listing Apps from
  /// start. If non-null pagination token is returned in a result, then pass its
  /// value in here to list more projects.
  ///
  /// [maxResults]:  Maximum number of records to list in a single response.
  Future<ListDomainAssociationsResult> listDomainAssociations(String appId,
      {String nextToken, int maxResults}) async {
    return ListDomainAssociationsResult.fromJson({});
  }

  ///  List Jobs for a branch, part of an Amplify App.
  ///
  /// [appId]:  Unique Id for an Amplify App.
  ///
  /// [branchName]:  Name for a branch.
  ///
  /// [nextToken]:  Pagination token. Set to null to start listing steps from
  /// start. If a non-null pagination token is returned in a result, then pass
  /// its value in here to list more steps.
  ///
  /// [maxResults]:  Maximum number of records to list in a single response.
  Future<ListJobsResult> listJobs(
      {@required String appId,
      @required String branchName,
      String nextToken,
      int maxResults}) async {
    return ListJobsResult.fromJson({});
  }

  ///  List tags for resource.
  ///
  /// [resourceArn]:  Resource arn used to list tags.
  Future<ListTagsForResourceResponse> listTagsForResource(
      String resourceArn) async {
    return ListTagsForResourceResponse.fromJson({});
  }

  ///  List webhooks with an app.
  ///
  /// [appId]:  Unique Id for an Amplify App.
  ///
  /// [nextToken]:  Pagination token. Set to null to start listing webhooks from
  /// start. If non-null pagination token is returned in a result, then pass its
  /// value in here to list more webhooks.
  ///
  /// [maxResults]:  Maximum number of records to list in a single response.
  Future<ListWebhooksResult> listWebhooks(String appId,
      {String nextToken, int maxResults}) async {
    return ListWebhooksResult.fromJson({});
  }

  ///  Start a deployment for manual deploy apps. (Apps are not connected to
  /// repository)
  ///
  /// [appId]:  Unique Id for an Amplify App.
  ///
  /// [branchName]:  Name for the branch, for the Job.
  ///
  /// [jobId]:  The job id for this deployment, generated by create deployment
  /// request.
  ///
  /// [sourceUrl]:  The sourceUrl for this deployment, used when calling start
  /// deployment without create deployment. SourceUrl can be any HTTP GET url
  /// that is public accessible and downloads a single zip.
  Future<StartDeploymentResult> startDeployment(
      {@required String appId,
      @required String branchName,
      String jobId,
      String sourceUrl}) async {
    return StartDeploymentResult.fromJson({});
  }

  ///  Starts a new job for a branch, part of an Amplify App.
  ///
  /// [appId]:  Unique Id for an Amplify App.
  ///
  /// [branchName]:  Name for the branch, for the Job.
  ///
  /// [jobId]:  Unique Id for an existing job. Required for "RETRY" JobType.
  ///
  /// [jobType]:  Type for the Job. Available JobTypes are: n "RELEASE": Start a
  /// new job with the latest change from the specified branch. Only available
  /// for apps that have connected to a repository. "RETRY": Retry an existing
  /// job. JobId is required for this type of job.
  ///
  /// [jobReason]:  Descriptive reason for starting this job.
  ///
  /// [commitId]:  Commit Id from 3rd party repository provider for the Job.
  ///
  /// [commitMessage]:  Commit message from 3rd party repository provider for
  /// the Job.
  ///
  /// [commitTime]:  Commit date / time for the Job.
  Future<StartJobResult> startJob(
      {@required String appId,
      @required String branchName,
      String jobId,
      @required String jobType,
      String jobReason,
      String commitId,
      String commitMessage,
      DateTime commitTime}) async {
    return StartJobResult.fromJson({});
  }

  ///  Stop a job that is in progress, for an Amplify branch, part of Amplify
  /// App.
  ///
  /// [appId]:  Unique Id for an Amplify App.
  ///
  /// [branchName]:  Name for the branch, for the Job.
  ///
  /// [jobId]:  Unique Id for the Job.
  Future<StopJobResult> stopJob(
      {@required String appId,
      @required String branchName,
      @required String jobId}) async {
    return StopJobResult.fromJson({});
  }

  ///  Tag resource with tag key and value.
  ///
  /// [resourceArn]:  Resource arn used to tag resource.
  ///
  /// [tags]:  Tags used to tag resource.
  Future<TagResourceResponse> tagResource(
      {@required String resourceArn,
      @required Map<String, String> tags}) async {
    return TagResourceResponse.fromJson({});
  }

  ///  Untag resource with resourceArn.
  ///
  /// [resourceArn]:  Resource arn used to untag resource.
  ///
  /// [tagKeys]:  Tag keys used to untag resource.
  Future<UntagResourceResponse> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {
    return UntagResourceResponse.fromJson({});
  }

  ///  Updates an existing Amplify App.
  ///
  /// [appId]:  Unique Id for an Amplify App.
  ///
  /// [name]:  Name for an Amplify App.
  ///
  /// [description]:  Description for an Amplify App.
  ///
  /// [platform]:  Platform for an Amplify App.
  ///
  /// [iamServiceRoleArn]:  IAM service role for an Amplify App.
  ///
  /// [environmentVariables]:  Environment Variables for an Amplify App.
  ///
  /// [enableBranchAutoBuild]:  Enables branch auto-building for an Amplify App.
  ///
  /// [enableBasicAuth]:  Enables Basic Authorization for an Amplify App.
  ///
  /// [basicAuthCredentials]:  Basic Authorization credentials for an Amplify
  /// App.
  ///
  /// [customRules]:  Custom redirect / rewrite rules for an Amplify App.
  ///
  /// [buildSpec]:  BuildSpec for an Amplify App.
  ///
  /// [enableAutoBranchCreation]:  Enables automated branch creation for the
  /// Amplify App.
  ///
  /// [autoBranchCreationPatterns]:  Automated branch creation glob patterns for
  /// the Amplify App.
  ///
  /// [autoBranchCreationConfig]:  Automated branch creation config for the
  /// Amplify App.
  Future<UpdateAppResult> updateApp(String appId,
      {String name,
      String description,
      String platform,
      String iamServiceRoleArn,
      Map<String, String> environmentVariables,
      bool enableBranchAutoBuild,
      bool enableBasicAuth,
      String basicAuthCredentials,
      List<CustomRule> customRules,
      String buildSpec,
      bool enableAutoBranchCreation,
      List<String> autoBranchCreationPatterns,
      AutoBranchCreationConfig autoBranchCreationConfig}) async {
    return UpdateAppResult.fromJson({});
  }

  ///  Updates a branch for an Amplify App.
  ///
  /// [appId]:  Unique Id for an Amplify App.
  ///
  /// [branchName]:  Name for the branch.
  ///
  /// [description]:  Description for the branch.
  ///
  /// [framework]:  Framework for the branch.
  ///
  /// [stage]:  Stage for the branch.
  ///
  /// [enableNotification]:  Enables notifications for the branch.
  ///
  /// [enableAutoBuild]:  Enables auto building for the branch.
  ///
  /// [environmentVariables]:  Environment Variables for the branch.
  ///
  /// [basicAuthCredentials]:  Basic Authorization credentials for the branch.
  ///
  /// [enableBasicAuth]:  Enables Basic Auth for the branch.
  ///
  /// [buildSpec]:  BuildSpec for the branch.
  ///
  /// [ttl]:  The content TTL for the website in seconds.
  ///
  /// [displayName]:  Display name for a branch, will use as the default domain
  /// prefix.
  Future<UpdateBranchResult> updateBranch(
      {@required String appId,
      @required String branchName,
      String description,
      String framework,
      String stage,
      bool enableNotification,
      bool enableAutoBuild,
      Map<String, String> environmentVariables,
      String basicAuthCredentials,
      bool enableBasicAuth,
      String buildSpec,
      String ttl,
      String displayName}) async {
    return UpdateBranchResult.fromJson({});
  }

  ///  Create a new DomainAssociation on an App
  ///
  /// [appId]:  Unique Id for an Amplify App.
  ///
  /// [domainName]:  Name of the domain.
  ///
  /// [enableAutoSubDomain]:  Enables automated creation of Subdomains for
  /// branches.
  ///
  /// [subDomainSettings]:  Setting structure for the Subdomain.
  Future<UpdateDomainAssociationResult> updateDomainAssociation(
      {@required String appId,
      @required String domainName,
      bool enableAutoSubDomain,
      @required List<SubDomainSetting> subDomainSettings}) async {
    return UpdateDomainAssociationResult.fromJson({});
  }

  ///  Update a webhook.
  ///
  /// [webhookId]:  Unique Id for a webhook.
  ///
  /// [branchName]:  Name for a branch, part of an Amplify App.
  ///
  /// [description]:  Description for a webhook.
  Future<UpdateWebhookResult> updateWebhook(String webhookId,
      {String branchName, String description}) async {
    return UpdateWebhookResult.fromJson({});
  }
}

///  Amplify App represents different branches of a repository for building,
/// deploying, and hosting.
class App {
  ///  Unique Id for the Amplify App.
  final String appId;

  ///  ARN for the Amplify App.
  final String appArn;

  ///  Name for the Amplify App.
  final String name;

  ///  Tag for Amplify App.
  final Map<String, String> tags;

  ///  Description for the Amplify App.
  final String description;

  ///  Repository for the Amplify App.
  final String repository;

  ///  Platform for the Amplify App.
  final String platform;

  ///  Create date / time for the Amplify App.
  final DateTime createTime;

  ///  Update date / time for the Amplify App.
  final DateTime updateTime;

  ///  IAM service role ARN for the Amplify App.
  final String iamServiceRoleArn;

  ///  Environment Variables for the Amplify App.
  final Map<String, String> environmentVariables;

  ///  Default domain for the Amplify App.
  final String defaultDomain;

  ///  Enables auto-building of branches for the Amplify App.
  final bool enableBranchAutoBuild;

  ///  Enables Basic Authorization for branches for the Amplify App.
  final bool enableBasicAuth;

  ///  Basic Authorization credentials for branches for the Amplify App.
  final String basicAuthCredentials;

  ///  Custom redirect / rewrite rules for the Amplify App.
  final List<CustomRule> customRules;

  ///  Structure with Production Branch information.
  final ProductionBranch productionBranch;

  ///  BuildSpec content for Amplify App.
  final String buildSpec;

  ///  Enables automated branch creation for the Amplify App.
  final bool enableAutoBranchCreation;

  ///  Automated branch creation glob patterns for the Amplify App.
  final List<String> autoBranchCreationPatterns;

  ///  Automated branch creation config for the Amplify App.
  final AutoBranchCreationConfig autoBranchCreationConfig;

  App({
    @required this.appId,
    @required this.appArn,
    @required this.name,
    this.tags,
    @required this.description,
    @required this.repository,
    @required this.platform,
    @required this.createTime,
    @required this.updateTime,
    this.iamServiceRoleArn,
    @required this.environmentVariables,
    @required this.defaultDomain,
    @required this.enableBranchAutoBuild,
    @required this.enableBasicAuth,
    this.basicAuthCredentials,
    this.customRules,
    this.productionBranch,
    this.buildSpec,
    this.enableAutoBranchCreation,
    this.autoBranchCreationPatterns,
    this.autoBranchCreationConfig,
  });
  static App fromJson(Map<String, dynamic> json) => App();
}

///  Structure with auto branch creation config.
class AutoBranchCreationConfig {
  ///  Stage for the auto created branch.
  final String stage;

  ///  Framework for the auto created branch.
  final String framework;

  ///  Enables auto building for the auto created branch.
  final bool enableAutoBuild;

  ///  Environment Variables for the auto created branch.
  final Map<String, String> environmentVariables;

  ///  Basic Authorization credentials for the auto created branch.
  final String basicAuthCredentials;

  ///  Enables Basic Auth for the auto created branch.
  final bool enableBasicAuth;

  ///  BuildSpec for the auto created branch.
  final String buildSpec;

  AutoBranchCreationConfig({
    this.stage,
    this.framework,
    this.enableAutoBuild,
    this.environmentVariables,
    this.basicAuthCredentials,
    this.enableBasicAuth,
    this.buildSpec,
  });
  static AutoBranchCreationConfig fromJson(Map<String, dynamic> json) =>
      AutoBranchCreationConfig();
}

///  Branch for an Amplify App, which maps to a 3rd party repository branch.
class Branch {
  ///  ARN for a branch, part of an Amplify App.
  final String branchArn;

  ///  Name for a branch, part of an Amplify App.
  final String branchName;

  ///  Description for a branch, part of an Amplify App.
  final String description;

  ///  Tag for branch for Amplify App.
  final Map<String, String> tags;

  ///  Stage for a branch, part of an Amplify App.
  final String stage;

  ///  Display name for a branch, will use as the default domain prefix.
  final String displayName;

  ///  Enables notifications for a branch, part of an Amplify App.
  final bool enableNotification;

  ///  Creation date and time for a branch, part of an Amplify App.
  final DateTime createTime;

  ///  Last updated date and time for a branch, part of an Amplify App.
  final DateTime updateTime;

  ///  Environment Variables specific to a branch, part of an Amplify App.
  final Map<String, String> environmentVariables;

  ///  Enables auto-building on push for a branch, part of an Amplify App.
  final bool enableAutoBuild;

  ///  Custom domains for a branch, part of an Amplify App.
  final List<String> customDomains;

  ///  Framework for a branch, part of an Amplify App.
  final String framework;

  ///  Id of the active job for a branch, part of an Amplify App.
  final String activeJobId;

  ///  Total number of Jobs part of an Amplify App.
  final String totalNumberOfJobs;

  ///  Enables Basic Authorization for a branch, part of an Amplify App.
  final bool enableBasicAuth;

  ///  Thumbnail URL for the branch.
  final String thumbnailUrl;

  ///  Basic Authorization credentials for a branch, part of an Amplify App.
  final String basicAuthCredentials;

  ///  BuildSpec content for branch for Amplify App.
  final String buildSpec;

  ///  The content TTL for the website in seconds.
  final String ttl;

  ///  List of custom resources that are linked to this branch.
  final List<String> associatedResources;

  Branch({
    @required this.branchArn,
    @required this.branchName,
    @required this.description,
    this.tags,
    @required this.stage,
    @required this.displayName,
    @required this.enableNotification,
    @required this.createTime,
    @required this.updateTime,
    @required this.environmentVariables,
    @required this.enableAutoBuild,
    @required this.customDomains,
    @required this.framework,
    @required this.activeJobId,
    @required this.totalNumberOfJobs,
    @required this.enableBasicAuth,
    this.thumbnailUrl,
    this.basicAuthCredentials,
    this.buildSpec,
    @required this.ttl,
    this.associatedResources,
  });
  static Branch fromJson(Map<String, dynamic> json) => Branch();
}

class CreateAppResult {
  final App app;

  CreateAppResult({
    @required this.app,
  });
  static CreateAppResult fromJson(Map<String, dynamic> json) =>
      CreateAppResult();
}

///  Result structure for create branch request.
class CreateBranchResult {
  ///  Branch structure for an Amplify App.
  final Branch branch;

  CreateBranchResult({
    @required this.branch,
  });
  static CreateBranchResult fromJson(Map<String, dynamic> json) =>
      CreateBranchResult();
}

///  Result structure for create a new deployment.
class CreateDeploymentResult {
  ///  The jobId for this deployment, will supply to start deployment api.
  final String jobId;

  ///  When the fileMap argument is provided in the request, the fileUploadUrls
  /// will contain a map of file names to upload url.
  final Map<String, String> fileUploadUrls;

  ///  When the fileMap argument is NOT provided. This zipUploadUrl will be
  /// returned.
  final String zipUploadUrl;

  CreateDeploymentResult({
    this.jobId,
    @required this.fileUploadUrls,
    @required this.zipUploadUrl,
  });
  static CreateDeploymentResult fromJson(Map<String, dynamic> json) =>
      CreateDeploymentResult();
}

///  Result structure for the create Domain Association request.
class CreateDomainAssociationResult {
  ///  Domain Association structure.
  final DomainAssociation domainAssociation;

  CreateDomainAssociationResult({
    @required this.domainAssociation,
  });
  static CreateDomainAssociationResult fromJson(Map<String, dynamic> json) =>
      CreateDomainAssociationResult();
}

///  Result structure for the create webhook request.
class CreateWebhookResult {
  ///  Webhook structure.
  final Webhook webhook;

  CreateWebhookResult({
    @required this.webhook,
  });
  static CreateWebhookResult fromJson(Map<String, dynamic> json) =>
      CreateWebhookResult();
}

///  Custom rewrite / redirect rule.
class CustomRule {
  ///  The source pattern for a URL rewrite or redirect rule.
  final String source;

  ///  The target pattern for a URL rewrite or redirect rule.
  final String target;

  ///  The status code for a URL rewrite or redirect rule.
  final String status;

  ///  The condition for a URL rewrite or redirect rule, e.g. country code.
  final String condition;

  CustomRule({
    @required this.source,
    @required this.target,
    this.status,
    this.condition,
  });
  static CustomRule fromJson(Map<String, dynamic> json) => CustomRule();
}

///  Result structure for an Amplify App delete request.
class DeleteAppResult {
  final App app;

  DeleteAppResult({
    @required this.app,
  });
  static DeleteAppResult fromJson(Map<String, dynamic> json) =>
      DeleteAppResult();
}

///  Result structure for delete branch request.
class DeleteBranchResult {
  ///  Branch structure for an Amplify App.
  final Branch branch;

  DeleteBranchResult({
    @required this.branch,
  });
  static DeleteBranchResult fromJson(Map<String, dynamic> json) =>
      DeleteBranchResult();
}

class DeleteDomainAssociationResult {
  final DomainAssociation domainAssociation;

  DeleteDomainAssociationResult({
    @required this.domainAssociation,
  });
  static DeleteDomainAssociationResult fromJson(Map<String, dynamic> json) =>
      DeleteDomainAssociationResult();
}

///  Result structure for the delete job request.
class DeleteJobResult {
  final JobSummary jobSummary;

  DeleteJobResult({
    @required this.jobSummary,
  });
  static DeleteJobResult fromJson(Map<String, dynamic> json) =>
      DeleteJobResult();
}

///  Result structure for the delete webhook request.
class DeleteWebhookResult {
  ///  Webhook structure.
  final Webhook webhook;

  DeleteWebhookResult({
    @required this.webhook,
  });
  static DeleteWebhookResult fromJson(Map<String, dynamic> json) =>
      DeleteWebhookResult();
}

///  Structure for Domain Association, which associates a custom domain with an
/// Amplify App.
class DomainAssociation {
  ///  ARN for the Domain Association.
  final String domainAssociationArn;

  ///  Name of the domain.
  final String domainName;

  ///  Enables automated creation of Subdomains for branches.
  final bool enableAutoSubDomain;

  ///  Status fo the Domain Association.
  final String domainStatus;

  ///  Reason for the current status of the Domain Association.
  final String statusReason;

  ///  DNS Record for certificate verification.
  final String certificateVerificationDnsRecord;

  ///  Subdomains for the Domain Association.
  final List<SubDomain> subDomains;

  DomainAssociation({
    @required this.domainAssociationArn,
    @required this.domainName,
    @required this.enableAutoSubDomain,
    @required this.domainStatus,
    @required this.statusReason,
    this.certificateVerificationDnsRecord,
    @required this.subDomains,
  });
  static DomainAssociation fromJson(Map<String, dynamic> json) =>
      DomainAssociation();
}

class GetAppResult {
  final App app;

  GetAppResult({
    @required this.app,
  });
  static GetAppResult fromJson(Map<String, dynamic> json) => GetAppResult();
}

class GetBranchResult {
  final Branch branch;

  GetBranchResult({
    @required this.branch,
  });
  static GetBranchResult fromJson(Map<String, dynamic> json) =>
      GetBranchResult();
}

///  Result structure for the get Domain Association request.
class GetDomainAssociationResult {
  ///  Domain Association structure.
  final DomainAssociation domainAssociation;

  GetDomainAssociationResult({
    @required this.domainAssociation,
  });
  static GetDomainAssociationResult fromJson(Map<String, dynamic> json) =>
      GetDomainAssociationResult();
}

class GetJobResult {
  final Job job;

  GetJobResult({
    @required this.job,
  });
  static GetJobResult fromJson(Map<String, dynamic> json) => GetJobResult();
}

///  Result structure for the get webhook request.
class GetWebhookResult {
  ///  Webhook structure.
  final Webhook webhook;

  GetWebhookResult({
    @required this.webhook,
  });
  static GetWebhookResult fromJson(Map<String, dynamic> json) =>
      GetWebhookResult();
}

///  Structure for an execution job for an Amplify App.
class Job {
  ///  Summary for an execution job for an Amplify App.
  final JobSummary summary;

  ///  Execution steps for an execution job, for an Amplify App.
  final List<Step> steps;

  Job({
    @required this.summary,
    @required this.steps,
  });
  static Job fromJson(Map<String, dynamic> json) => Job();
}

///  Structure for the summary of a Job.
class JobSummary {
  ///  Arn for the Job.
  final String jobArn;

  ///  Unique Id for the Job.
  final String jobId;

  ///  Commit Id from 3rd party repository provider for the Job.
  final String commitId;

  ///  Commit message from 3rd party repository provider for the Job.
  final String commitMessage;

  ///  Commit date / time for the Job.
  final DateTime commitTime;

  ///  Start date / time for the Job.
  final DateTime startTime;

  ///  Status for the Job.
  final String status;

  ///  End date / time for the Job.
  final DateTime endTime;

  ///  Type for the Job. n "RELEASE": Manually released from source by using
  /// StartJob API. "RETRY": Manually retried by using StartJob API. "WEB_HOOK":
  /// Automatically triggered by WebHooks.
  final String jobType;

  JobSummary({
    @required this.jobArn,
    @required this.jobId,
    @required this.commitId,
    @required this.commitMessage,
    @required this.commitTime,
    @required this.startTime,
    @required this.status,
    this.endTime,
    @required this.jobType,
  });
  static JobSummary fromJson(Map<String, dynamic> json) => JobSummary();
}

///  Result structure for an Amplify App list request.
class ListAppsResult {
  ///  List of Amplify Apps.
  final List<App> apps;

  ///  Pagination token. Set to null to start listing Apps from start. If
  /// non-null pagination token is returned in a result, then pass its value in
  /// here to list more projects.
  final String nextToken;

  ListAppsResult({
    @required this.apps,
    this.nextToken,
  });
  static ListAppsResult fromJson(Map<String, dynamic> json) => ListAppsResult();
}

///  Result structure for list branches request.
class ListBranchesResult {
  ///  List of branches for an Amplify App.
  final List<Branch> branches;

  ///  Pagination token. If non-null pagination token is returned in a result,
  /// then pass its value in another request to fetch more entries.
  final String nextToken;

  ListBranchesResult({
    @required this.branches,
    this.nextToken,
  });
  static ListBranchesResult fromJson(Map<String, dynamic> json) =>
      ListBranchesResult();
}

///  Result structure for the list Domain Association request.
class ListDomainAssociationsResult {
  ///  List of Domain Associations.
  final List<DomainAssociation> domainAssociations;

  ///  Pagination token. If non-null pagination token is returned in a result,
  /// then pass its value in another request to fetch more entries.
  final String nextToken;

  ListDomainAssociationsResult({
    @required this.domainAssociations,
    this.nextToken,
  });
  static ListDomainAssociationsResult fromJson(Map<String, dynamic> json) =>
      ListDomainAssociationsResult();
}

///  Maximum number of records to list in a single response.
class ListJobsResult {
  ///  Result structure for list job result request.
  final List<JobSummary> jobSummaries;

  ///  Pagination token. If non-null pagination token is returned in a result,
  /// then pass its value in another request to fetch more entries.
  final String nextToken;

  ListJobsResult({
    @required this.jobSummaries,
    this.nextToken,
  });
  static ListJobsResult fromJson(Map<String, dynamic> json) => ListJobsResult();
}

///  Response for list tags.
class ListTagsForResourceResponse {
  ///  Tags result for response.
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  static ListTagsForResourceResponse fromJson(Map<String, dynamic> json) =>
      ListTagsForResourceResponse();
}

///  Result structure for the list webhooks request.
class ListWebhooksResult {
  ///  List of webhooks.
  final List<Webhook> webhooks;

  ///  Pagination token. If non-null pagination token is returned in a result,
  /// then pass its value in another request to fetch more entries.
  final String nextToken;

  ListWebhooksResult({
    @required this.webhooks,
    this.nextToken,
  });
  static ListWebhooksResult fromJson(Map<String, dynamic> json) =>
      ListWebhooksResult();
}

///  Structure with Production Branch information.
class ProductionBranch {
  ///  Last Deploy Time of Production Branch.
  final DateTime lastDeployTime;

  ///  Status of Production Branch.
  final String status;

  ///  Thumbnail URL for Production Branch.
  final String thumbnailUrl;

  ///  Branch Name for Production Branch.
  final String branchName;

  ProductionBranch({
    this.lastDeployTime,
    this.status,
    this.thumbnailUrl,
    this.branchName,
  });
  static ProductionBranch fromJson(Map<String, dynamic> json) =>
      ProductionBranch();
}

///  Result structure for start a deployment.
class StartDeploymentResult {
  ///  Summary for the Job.
  final JobSummary jobSummary;

  StartDeploymentResult({
    @required this.jobSummary,
  });
  static StartDeploymentResult fromJson(Map<String, dynamic> json) =>
      StartDeploymentResult();
}

///  Result structure for run job request.
class StartJobResult {
  ///  Summary for the Job.
  final JobSummary jobSummary;

  StartJobResult({
    @required this.jobSummary,
  });
  static StartJobResult fromJson(Map<String, dynamic> json) => StartJobResult();
}

///  Structure for an execution step for an execution job, for an Amplify App.
class Step {
  ///  Name of the execution step.
  final String stepName;

  ///  Start date/ time of the execution step.
  final DateTime startTime;

  ///  Status of the execution step.
  final String status;

  ///  End date/ time of the execution step.
  final DateTime endTime;

  ///  URL to the logs for the execution step.
  final String logUrl;

  ///  URL to the artifact for the execution step.
  final String artifactsUrl;

  ///  List of screenshot URLs for the execution step, if relevant.
  final Map<String, String> screenshots;

  ///  The reason for current step status.
  final String statusReason;

  ///  The context for current step, will include build image if step is build.
  final String context;

  Step({
    @required this.stepName,
    @required this.startTime,
    @required this.status,
    @required this.endTime,
    this.logUrl,
    this.artifactsUrl,
    this.screenshots,
    this.statusReason,
    this.context,
  });
  static Step fromJson(Map<String, dynamic> json) => Step();
}

///  Result structure for the stop job request.
class StopJobResult {
  ///  Summary for the Job.
  final JobSummary jobSummary;

  StopJobResult({
    @required this.jobSummary,
  });
  static StopJobResult fromJson(Map<String, dynamic> json) => StopJobResult();
}

///  Subdomain for the Domain Association.
class SubDomain {
  ///  Setting structure for the Subdomain.
  final SubDomainSetting subDomainSetting;

  ///  Verified status of the Subdomain
  final bool verified;

  ///  DNS record for the Subdomain.
  final String dnsRecord;

  SubDomain({
    @required this.subDomainSetting,
    @required this.verified,
    @required this.dnsRecord,
  });
  static SubDomain fromJson(Map<String, dynamic> json) => SubDomain();
}

///  Setting for the Subdomain.
class SubDomainSetting {
  ///  Prefix setting for the Subdomain.
  final String prefix;

  ///  Branch name setting for the Subdomain.
  final String branchName;

  SubDomainSetting({
    @required this.prefix,
    @required this.branchName,
  });
  static SubDomainSetting fromJson(Map<String, dynamic> json) =>
      SubDomainSetting();
}

///  Response for tag resource.
class TagResourceResponse {
  TagResourceResponse();
  static TagResourceResponse fromJson(Map<String, dynamic> json) =>
      TagResourceResponse();
}

///  Response for untag resource.
class UntagResourceResponse {
  UntagResourceResponse();
  static UntagResourceResponse fromJson(Map<String, dynamic> json) =>
      UntagResourceResponse();
}

///  Result structure for an Amplify App update request.
class UpdateAppResult {
  ///  App structure for the updated App.
  final App app;

  UpdateAppResult({
    @required this.app,
  });
  static UpdateAppResult fromJson(Map<String, dynamic> json) =>
      UpdateAppResult();
}

///  Result structure for update branch request.
class UpdateBranchResult {
  ///  Branch structure for an Amplify App.
  final Branch branch;

  UpdateBranchResult({
    @required this.branch,
  });
  static UpdateBranchResult fromJson(Map<String, dynamic> json) =>
      UpdateBranchResult();
}

///  Result structure for the update Domain Association request.
class UpdateDomainAssociationResult {
  ///  Domain Association structure.
  final DomainAssociation domainAssociation;

  UpdateDomainAssociationResult({
    @required this.domainAssociation,
  });
  static UpdateDomainAssociationResult fromJson(Map<String, dynamic> json) =>
      UpdateDomainAssociationResult();
}

///  Result structure for the update webhook request.
class UpdateWebhookResult {
  ///  Webhook structure.
  final Webhook webhook;

  UpdateWebhookResult({
    @required this.webhook,
  });
  static UpdateWebhookResult fromJson(Map<String, dynamic> json) =>
      UpdateWebhookResult();
}

///  Structure for webhook, which associates a webhook with an Amplify App.
class Webhook {
  ///  ARN for the webhook.
  final String webhookArn;

  ///  Id of the webhook.
  final String webhookId;

  ///  Url of the webhook.
  final String webhookUrl;

  ///  Name for a branch, part of an Amplify App.
  final String branchName;

  ///  Description for a webhook.
  final String description;

  ///  Create date / time for a webhook.
  final DateTime createTime;

  ///  Update date / time for a webhook.
  final DateTime updateTime;

  Webhook({
    @required this.webhookArn,
    @required this.webhookId,
    @required this.webhookUrl,
    @required this.branchName,
    @required this.description,
    @required this.createTime,
    @required this.updateTime,
  });
  static Webhook fromJson(Map<String, dynamic> json) => Webhook();
}
