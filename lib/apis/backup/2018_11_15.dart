import 'package:meta/meta.dart';

/// AWS Backup
///
/// AWS Backup is a unified backup service designed to protect AWS services and
/// their associated data. AWS Backup simplifies the creation, migration,
/// restoration, and deletion of backups, while also providing reporting and
/// auditing.
class BackupApi {
  /// Backup plans are documents that contain information that AWS Backup uses
  /// to schedule tasks that create recovery points of resources.
  ///
  /// If you call `CreateBackupPlan` with a plan that already exists, the
  /// existing `backupPlanId` is returned.
  Future<void> createBackupPlan(BackupPlanInput backupPlan,
      {Map<String, String> backupPlanTags, String creatorRequestId}) async {}

  /// Creates a JSON document that specifies a set of resources to assign to a
  /// backup plan. Resources can be included by specifying patterns for a
  /// `ListOfTags` and selected `Resources`.
  ///
  /// For example, consider the following patterns:
  ///
  /// *    `Resources: "arn:aws:ec2:region:account-id:volume/volume-id"`
  ///
  /// *    `ConditionKey:"department"`
  ///
  ///      `ConditionValue:"finance"`
  ///
  ///      `ConditionType:"StringEquals"`
  ///
  /// *    `ConditionKey:"importance"`
  ///
  ///      `ConditionValue:"critical"`
  ///
  ///      `ConditionType:"StringEquals"`
  ///
  ///
  /// Using these patterns would back up all Amazon Elastic Block Store (Amazon
  /// EBS) volumes that are tagged as `"department=finance"`,
  /// `"importance=critical"`, in addition to an EBS volume with the specified
  /// volume Id.
  ///
  /// Resources and conditions are additive in that all resources that match the
  /// pattern are selected. This shouldn't be confused with a logical AND, where
  /// all conditions must match. The matching patterns are logically 'put
  /// together using the OR operator. In other words, all patterns that match
  /// are selected for backup.
  Future<void> createBackupSelection(
      {@required String backupPlanId,
      @required BackupSelection backupSelection,
      String creatorRequestId}) async {}

  /// Creates a logical container where backups are stored. A
  /// `CreateBackupVault` request includes a name, optionally one or more
  /// resource tags, an encryption key, and a request ID.
  ///
  ///
  ///
  /// Sensitive data, such as passport numbers, should not be included the name
  /// of a backup vault.
  Future<void> createBackupVault(String backupVaultName,
      {Map<String, String> backupVaultTags,
      String encryptionKeyArn,
      String creatorRequestId}) async {}

  /// Deletes a backup plan. A backup plan can only be deleted after all
  /// associated selections of resources have been deleted. Deleting a backup
  /// plan deletes the current version of a backup plan. Previous versions, if
  /// any, will still exist.
  Future<void> deleteBackupPlan(String backupPlanId) async {}

  /// Deletes the resource selection associated with a backup plan that is
  /// specified by the `SelectionId`.
  Future<void> deleteBackupSelection(
      {@required String backupPlanId, @required String selectionId}) async {}

  /// Deletes the backup vault identified by its name. A vault can be deleted
  /// only if it is empty.
  Future<void> deleteBackupVault(String backupVaultName) async {}

  /// Deletes the policy document that manages permissions on a backup vault.
  Future<void> deleteBackupVaultAccessPolicy(String backupVaultName) async {}

  /// Deletes event notifications for the specified backup vault.
  Future<void> deleteBackupVaultNotifications(String backupVaultName) async {}

  /// Deletes the recovery point specified by a recovery point ID.
  Future<void> deleteRecoveryPoint(
      {@required String backupVaultName,
      @required String recoveryPointArn}) async {}

  /// Returns metadata associated with creating a backup of a resource.
  Future<void> describeBackupJob(String backupJobId) async {}

  /// Returns metadata about a backup vault specified by its name.
  Future<void> describeBackupVault(String backupVaultName) async {}

  /// Returns information about a saved resource, including the last time it was
  /// backed-up, its Amazon Resource Name (ARN), and the AWS service type of the
  /// saved resource.
  Future<void> describeProtectedResource(String resourceArn) async {}

  /// Returns metadata associated with a recovery point, including ID, status,
  /// encryption, and lifecycle.
  Future<void> describeRecoveryPoint(
      {@required String backupVaultName,
      @required String recoveryPointArn}) async {}

  /// Returns metadata associated with a restore job that is specified by a job
  /// ID.
  Future<void> describeRestoreJob(String restoreJobId) async {}

  /// Returns the backup plan that is specified by the plan ID as a backup
  /// template.
  Future<void> exportBackupPlanTemplate(String backupPlanId) async {}

  /// Returns the body of a backup plan in JSON format, in addition to plan
  /// metadata.
  Future<void> getBackupPlan(String backupPlanId, {String versionId}) async {}

  /// Returns a valid JSON document specifying a backup plan or an error.
  Future<void> getBackupPlanFromJson(String backupPlanTemplateJson) async {}

  /// Returns the template specified by its `templateId` as a backup plan.
  Future<void> getBackupPlanFromTemplate(String backupPlanTemplateId) async {}

  /// Returns selection metadata and a document in JSON format that specifies a
  /// list of resources that are associated with a backup plan.
  Future<void> getBackupSelection(
      {@required String backupPlanId, @required String selectionId}) async {}

  /// Returns the access policy document that is associated with the named
  /// backup vault.
  Future<void> getBackupVaultAccessPolicy(String backupVaultName) async {}

  /// Returns event notifications for the specified backup vault.
  Future<void> getBackupVaultNotifications(String backupVaultName) async {}

  /// Returns two sets of metadata key-value pairs. The first set lists the
  /// metadata that the recovery point was created with. The second set lists
  /// the metadata key-value pairs that are required to restore the recovery
  /// point.
  ///
  /// These sets can be the same, or the restore metadata set can contain
  /// different values if the target service to be restored has changed since
  /// the recovery point was created and now requires additional or different
  /// information in order to be restored.
  Future<void> getRecoveryPointRestoreMetadata(
      {@required String backupVaultName,
      @required String recoveryPointArn}) async {}

  /// Returns the AWS resource types supported by AWS Backup.
  Future<void> getSupportedResourceTypes() async {}

  /// Returns metadata about your backup jobs.
  Future<void> listBackupJobs(
      {String nextToken,
      int maxResults,
      String byResourceArn,
      String byState,
      String byBackupVaultName,
      DateTime byCreatedBefore,
      DateTime byCreatedAfter,
      String byResourceType}) async {}

  /// Returns metadata of your saved backup plan templates, including the
  /// template ID, name, and the creation and deletion dates.
  Future<void> listBackupPlanTemplates(
      {String nextToken, int maxResults}) async {}

  /// Returns version metadata of your backup plans, including Amazon Resource
  /// Names (ARNs), backup plan IDs, creation and deletion dates, plan names,
  /// and version IDs.
  Future<void> listBackupPlanVersions(String backupPlanId,
      {String nextToken, int maxResults}) async {}

  /// Returns metadata of your saved backup plans, including Amazon Resource
  /// Names (ARNs), plan IDs, creation and deletion dates, version IDs, plan
  /// names, and creator request IDs.
  Future<void> listBackupPlans(
      {String nextToken, int maxResults, bool includeDeleted}) async {}

  /// Returns an array containing metadata of the resources associated with the
  /// target backup plan.
  Future<void> listBackupSelections(String backupPlanId,
      {String nextToken, int maxResults}) async {}

  /// Returns a list of recovery point storage containers along with information
  /// about them.
  Future<void> listBackupVaults({String nextToken, int maxResults}) async {}

  /// Returns an array of resources successfully backed up by AWS Backup,
  /// including the time the resource was saved, an Amazon Resource Name (ARN)
  /// of the resource, and a resource type.
  Future<void> listProtectedResources(
      {String nextToken, int maxResults}) async {}

  /// Returns detailed information about the recovery points stored in a backup
  /// vault.
  Future<void> listRecoveryPointsByBackupVault(String backupVaultName,
      {String nextToken,
      int maxResults,
      String byResourceArn,
      String byResourceType,
      String byBackupPlanId,
      DateTime byCreatedBefore,
      DateTime byCreatedAfter}) async {}

  /// Returns detailed information about recovery points of the type specified
  /// by a resource Amazon Resource Name (ARN).
  Future<void> listRecoveryPointsByResource(String resourceArn,
      {String nextToken, int maxResults}) async {}

  /// Returns a list of jobs that AWS Backup initiated to restore a saved
  /// resource, including metadata about the recovery process.
  Future<void> listRestoreJobs({String nextToken, int maxResults}) async {}

  /// Returns a list of key-value pairs assigned to a target recovery point,
  /// backup plan, or backup vault.
  Future<void> listTags(String resourceArn,
      {String nextToken, int maxResults}) async {}

  /// Sets a resource-based policy that is used to manage access permissions on
  /// the target backup vault. Requires a backup vault name and an access policy
  /// document in JSON format.
  Future<void> putBackupVaultAccessPolicy(String backupVaultName,
      {String policy}) async {}

  /// Turns on notifications on a backup vault for the specified topic and
  /// events.
  Future<void> putBackupVaultNotifications(
      {@required String backupVaultName,
      @required String snsTopicArn,
      @required List<String> backupVaultEvents}) async {}

  /// Starts a job to create a one-time backup of the specified resource.
  Future<void> startBackupJob(
      {@required String backupVaultName,
      @required String resourceArn,
      @required String iamRoleArn,
      String idempotencyToken,
      BigInt startWindowMinutes,
      BigInt completeWindowMinutes,
      Lifecycle lifecycle,
      Map<String, String> recoveryPointTags}) async {}

  /// Recovers the saved resource identified by an Amazon Resource Name (ARN).
  ///
  /// If the resource ARN is included in the request, then the last complete
  /// backup of that resource is recovered. If the ARN of a recovery point is
  /// supplied, then that recovery point is restored.
  Future<void> startRestoreJob(
      {@required String recoveryPointArn,
      @required Map<String, String> metadata,
      @required String iamRoleArn,
      String idempotencyToken,
      String resourceType}) async {}

  /// Attempts to cancel a job to create a one-time backup of a resource.
  Future<void> stopBackupJob(String backupJobId) async {}

  /// Assigns a set of key-value pairs to a recovery point, backup plan, or
  /// backup vault identified by an Amazon Resource Name (ARN).
  Future<void> tagResource(
      {@required String resourceArn,
      @required Map<String, String> tags}) async {}

  /// Removes a set of key-value pairs from a recovery point, backup plan, or
  /// backup vault identified by an Amazon Resource Name (ARN)
  Future<void> untagResource(
      {@required String resourceArn,
      @required List<String> tagKeyList}) async {}

  /// Replaces the body of a saved backup plan identified by its `backupPlanId`
  /// with the input document in JSON format. The new version is uniquely
  /// identified by a `VersionId`.
  Future<void> updateBackupPlan(
      {@required String backupPlanId,
      @required BackupPlanInput backupPlan}) async {}

  /// Sets the transition lifecycle of a recovery point.
  ///
  /// The lifecycle defines when a protected resource is transitioned to cold
  /// storage and when it expires. AWS Backup transitions and expires backups
  /// automatically according to the lifecycle that you define.
  ///
  /// Backups transitioned to cold storage must be stored in cold storage for a
  /// minimum of 90 days. Therefore, the “expire after days” setting must be 90
  /// days greater than the “transition to cold after days” setting. The
  /// “transition to cold after days” setting cannot be changed after a backup
  /// has been transitioned to cold.
  Future<void> updateRecoveryPointLifecycle(
      {@required String backupVaultName,
      @required String recoveryPointArn,
      Lifecycle lifecycle}) async {}
}

class BackupJob {}

class BackupPlan {}

class BackupPlanInput {}

class BackupPlanTemplatesListMember {}

class BackupPlansListMember {}

class BackupRule {}

class BackupRuleInput {}

class BackupSelection {}

class BackupSelectionsListMember {}

class BackupVaultListMember {}

class CalculatedLifecycle {}

class Condition {}

class CreateBackupPlanOutput {}

class CreateBackupSelectionOutput {}

class CreateBackupVaultOutput {}

class DeleteBackupPlanOutput {}

class DescribeBackupJobOutput {}

class DescribeBackupVaultOutput {}

class DescribeProtectedResourceOutput {}

class DescribeRecoveryPointOutput {}

class DescribeRestoreJobOutput {}

class ExportBackupPlanTemplateOutput {}

class GetBackupPlanFromJsonOutput {}

class GetBackupPlanFromTemplateOutput {}

class GetBackupPlanOutput {}

class GetBackupSelectionOutput {}

class GetBackupVaultAccessPolicyOutput {}

class GetBackupVaultNotificationsOutput {}

class GetRecoveryPointRestoreMetadataOutput {}

class GetSupportedResourceTypesOutput {}

class Lifecycle {}

class ListBackupJobsOutput {}

class ListBackupPlanTemplatesOutput {}

class ListBackupPlanVersionsOutput {}

class ListBackupPlansOutput {}

class ListBackupSelectionsOutput {}

class ListBackupVaultsOutput {}

class ListProtectedResourcesOutput {}

class ListRecoveryPointsByBackupVaultOutput {}

class ListRecoveryPointsByResourceOutput {}

class ListRestoreJobsOutput {}

class ListTagsOutput {}

class ProtectedResource {}

class RecoveryPointByBackupVault {}

class RecoveryPointByResource {}

class RecoveryPointCreator {}

class RestoreJobsListMember {}

class StartBackupJobOutput {}

class StartRestoreJobOutput {}

class UpdateBackupPlanOutput {}

class UpdateRecoveryPointLifecycleOutput {}
