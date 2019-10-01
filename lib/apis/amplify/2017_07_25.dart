import 'package:meta/meta.dart';

///  Amplify is a fully managed continuous deployment and hosting service for
/// modern web apps.
class AmplifyApi {
  ///  Creates a new Amplify App.
  Future<void> createApp(String name,
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
      AutoBranchCreationConfig autoBranchCreationConfig}) async {}

  ///  Creates a new Branch for an Amplify App.
  Future<void> createBranch(
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
      String displayName}) async {}

  ///  Create a deployment for manual deploy apps. (Apps are not connected to
  /// repository)
  Future<void> createDeployment(
      {@required String appId,
      @required String branchName,
      Map<String, String> fileMap}) async {}

  ///  Create a new DomainAssociation on an App
  Future<void> createDomainAssociation(
      {@required String appId,
      @required String domainName,
      bool enableAutoSubDomain,
      @required List<SubDomainSetting> subDomainSettings}) async {}

  ///  Create a new webhook on an App.
  Future<void> createWebhook(
      {@required String appId,
      @required String branchName,
      String description}) async {}

  ///  Delete an existing Amplify App by appId.
  Future<void> deleteApp(String appId) async {}

  ///  Deletes a branch for an Amplify App.
  Future<void> deleteBranch(
      {@required String appId, @required String branchName}) async {}

  ///  Deletes a DomainAssociation.
  Future<void> deleteDomainAssociation(
      {@required String appId, @required String domainName}) async {}

  ///  Delete a job, for an Amplify branch, part of Amplify App.
  Future<void> deleteJob(
      {@required String appId,
      @required String branchName,
      @required String jobId}) async {}

  ///  Deletes a webhook.
  Future<void> deleteWebhook(String webhookId) async {}

  ///  Retrieves an existing Amplify App by appId.
  Future<void> getApp(String appId) async {}

  ///  Retrieves a branch for an Amplify App.
  Future<void> getBranch(
      {@required String appId, @required String branchName}) async {}

  ///  Retrieves domain info that corresponds to an appId and domainName.
  Future<void> getDomainAssociation(
      {@required String appId, @required String domainName}) async {}

  ///  Get a job for a branch, part of an Amplify App.
  Future<void> getJob(
      {@required String appId,
      @required String branchName,
      @required String jobId}) async {}

  ///  Retrieves webhook info that corresponds to a webhookId.
  Future<void> getWebhook(String webhookId) async {}

  ///  Lists existing Amplify Apps.
  Future<void> listApps({String nextToken, int maxResults}) async {}

  ///  Lists branches for an Amplify App.
  Future<void> listBranches(String appId,
      {String nextToken, int maxResults}) async {}

  ///  List domains with an app
  Future<void> listDomainAssociations(String appId,
      {String nextToken, int maxResults}) async {}

  ///  List Jobs for a branch, part of an Amplify App.
  Future<void> listJobs(
      {@required String appId,
      @required String branchName,
      String nextToken,
      int maxResults}) async {}

  ///  List tags for resource.
  Future<void> listTagsForResource(String resourceArn) async {}

  ///  List webhooks with an app.
  Future<void> listWebhooks(String appId,
      {String nextToken, int maxResults}) async {}

  ///  Start a deployment for manual deploy apps. (Apps are not connected to
  /// repository)
  Future<void> startDeployment(
      {@required String appId,
      @required String branchName,
      String jobId,
      String sourceUrl}) async {}

  ///  Starts a new job for a branch, part of an Amplify App.
  Future<void> startJob(
      {@required String appId,
      @required String branchName,
      String jobId,
      @required String jobType,
      String jobReason,
      String commitId,
      String commitMessage,
      DateTime commitTime}) async {}

  ///  Stop a job that is in progress, for an Amplify branch, part of Amplify
  /// App.
  Future<void> stopJob(
      {@required String appId,
      @required String branchName,
      @required String jobId}) async {}

  ///  Tag resource with tag key and value.
  Future<void> tagResource(
      {@required String resourceArn,
      @required Map<String, String> tags}) async {}

  ///  Untag resource with resourceArn.
  Future<void> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {}

  ///  Updates an existing Amplify App.
  Future<void> updateApp(String appId,
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
      AutoBranchCreationConfig autoBranchCreationConfig}) async {}

  ///  Updates a branch for an Amplify App.
  Future<void> updateBranch(
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
      String displayName}) async {}

  ///  Create a new DomainAssociation on an App
  Future<void> updateDomainAssociation(
      {@required String appId,
      @required String domainName,
      bool enableAutoSubDomain,
      @required List<SubDomainSetting> subDomainSettings}) async {}

  ///  Update a webhook.
  Future<void> updateWebhook(String webhookId,
      {String branchName, String description}) async {}
}

class App {}

class AutoBranchCreationConfig {}

class Branch {}

class CreateAppResult {}

class CreateBranchResult {}

class CreateDeploymentResult {}

class CreateDomainAssociationResult {}

class CreateWebhookResult {}

class CustomRule {}

class DeleteAppResult {}

class DeleteBranchResult {}

class DeleteDomainAssociationResult {}

class DeleteJobResult {}

class DeleteWebhookResult {}

class DomainAssociation {}

class GetAppResult {}

class GetBranchResult {}

class GetDomainAssociationResult {}

class GetJobResult {}

class GetWebhookResult {}

class Job {}

class JobSummary {}

class ListAppsResult {}

class ListBranchesResult {}

class ListDomainAssociationsResult {}

class ListJobsResult {}

class ListTagsForResourceResponse {}

class ListWebhooksResult {}

class ProductionBranch {}

class StartDeploymentResult {}

class StartJobResult {}

class Step {}

class StopJobResult {}

class SubDomain {}

class SubDomainSetting {}

class TagResourceResponse {}

class UntagResourceResponse {}

class UpdateAppResult {}

class UpdateBranchResult {}

class UpdateDomainAssociationResult {}

class UpdateWebhookResult {}

class Webhook {}
