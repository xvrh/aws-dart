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
  ///
  /// [backupPlan]: Specifies the body of a backup plan. Includes a
  /// `BackupPlanName` and one or more sets of `Rules`.
  ///
  /// [backupPlanTags]: To help organize your resources, you can assign your own
  /// metadata to the resources that you create. Each tag is a key-value pair.
  /// The specified tags are assigned to all backups created with this plan.
  ///
  /// [creatorRequestId]: Identifies the request and allows failed requests to
  /// be retried without the risk of executing the operation twice. If the
  /// request includes a `CreatorRequestId` that matches an existing backup
  /// plan, that plan is returned. This parameter is optional.
  Future<CreateBackupPlanOutput> createBackupPlan(BackupPlanInput backupPlan,
      {Map<String, String> backupPlanTags, String creatorRequestId}) async {
    return CreateBackupPlanOutput.fromJson({});
  }

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
  ///
  /// [backupPlanId]: Uniquely identifies the backup plan to be associated with
  /// the selection of resources.
  ///
  /// [backupSelection]: Specifies the body of a request to assign a set of
  /// resources to a backup plan.
  ///
  /// It includes an array of resources, an optional array of patterns to
  /// exclude resources, an optional role to provide access to the AWS service
  /// the resource belongs to, and an optional array of tags used to identify a
  /// set of resources.
  ///
  /// [creatorRequestId]: A unique string that identifies the request and allows
  /// failed requests to be retried without the risk of executing the operation
  /// twice.
  Future<CreateBackupSelectionOutput> createBackupSelection(
      {@required String backupPlanId,
      @required BackupSelection backupSelection,
      String creatorRequestId}) async {
    return CreateBackupSelectionOutput.fromJson({});
  }

  /// Creates a logical container where backups are stored. A
  /// `CreateBackupVault` request includes a name, optionally one or more
  /// resource tags, an encryption key, and a request ID.
  ///
  ///
  ///
  /// Sensitive data, such as passport numbers, should not be included the name
  /// of a backup vault.
  ///
  /// [backupVaultName]: The name of a logical container where backups are
  /// stored. Backup vaults are identified by names that are unique to the
  /// account used to create them and the AWS Region where they are created.
  /// They consist of lowercase letters, numbers, and hyphens.
  ///
  /// [backupVaultTags]: Metadata that you can assign to help organize the
  /// resources that you create. Each tag is a key-value pair.
  ///
  /// [encryptionKeyArn]: The server-side encryption key that is used to protect
  /// your backups; for example,
  /// `arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab`.
  ///
  /// [creatorRequestId]: A unique string that identifies the request and allows
  /// failed requests to be retried without the risk of executing the operation
  /// twice.
  Future<CreateBackupVaultOutput> createBackupVault(String backupVaultName,
      {Map<String, String> backupVaultTags,
      String encryptionKeyArn,
      String creatorRequestId}) async {
    return CreateBackupVaultOutput.fromJson({});
  }

  /// Deletes a backup plan. A backup plan can only be deleted after all
  /// associated selections of resources have been deleted. Deleting a backup
  /// plan deletes the current version of a backup plan. Previous versions, if
  /// any, will still exist.
  ///
  /// [backupPlanId]: Uniquely identifies a backup plan.
  Future<DeleteBackupPlanOutput> deleteBackupPlan(String backupPlanId) async {
    return DeleteBackupPlanOutput.fromJson({});
  }

  /// Deletes the resource selection associated with a backup plan that is
  /// specified by the `SelectionId`.
  ///
  /// [backupPlanId]: Uniquely identifies a backup plan.
  ///
  /// [selectionId]: Uniquely identifies the body of a request to assign a set
  /// of resources to a backup plan.
  Future<void> deleteBackupSelection(
      {@required String backupPlanId, @required String selectionId}) async {}

  /// Deletes the backup vault identified by its name. A vault can be deleted
  /// only if it is empty.
  ///
  /// [backupVaultName]: The name of a logical container where backups are
  /// stored. Backup vaults are identified by names that are unique to the
  /// account used to create them and theAWS Region where they are created. They
  /// consist of lowercase letters, numbers, and hyphens.
  Future<void> deleteBackupVault(String backupVaultName) async {}

  /// Deletes the policy document that manages permissions on a backup vault.
  ///
  /// [backupVaultName]: The name of a logical container where backups are
  /// stored. Backup vaults are identified by names that are unique to the
  /// account used to create them and the AWS Region where they are created.
  /// They consist of lowercase letters, numbers, and hyphens.
  Future<void> deleteBackupVaultAccessPolicy(String backupVaultName) async {}

  /// Deletes event notifications for the specified backup vault.
  ///
  /// [backupVaultName]: The name of a logical container where backups are
  /// stored. Backup vaults are identified by names that are unique to the
  /// account used to create them and the Region where they are created. They
  /// consist of lowercase letters, numbers, and hyphens.
  Future<void> deleteBackupVaultNotifications(String backupVaultName) async {}

  /// Deletes the recovery point specified by a recovery point ID.
  ///
  /// [backupVaultName]: The name of a logical container where backups are
  /// stored. Backup vaults are identified by names that are unique to the
  /// account used to create them and the AWS Region where they are created.
  /// They consist of lowercase letters, numbers, and hyphens.
  ///
  /// [recoveryPointArn]: An Amazon Resource Name (ARN) that uniquely identifies
  /// a recovery point; for example,
  /// `arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45`.
  Future<void> deleteRecoveryPoint(
      {@required String backupVaultName,
      @required String recoveryPointArn}) async {}

  /// Returns metadata associated with creating a backup of a resource.
  ///
  /// [backupJobId]: Uniquely identifies a request to AWS Backup to back up a
  /// resource.
  Future<DescribeBackupJobOutput> describeBackupJob(String backupJobId) async {
    return DescribeBackupJobOutput.fromJson({});
  }

  /// Returns metadata about a backup vault specified by its name.
  ///
  /// [backupVaultName]: The name of a logical container where backups are
  /// stored. Backup vaults are identified by names that are unique to the
  /// account used to create them and the AWS Region where they are created.
  /// They consist of lowercase letters, numbers, and hyphens.
  Future<DescribeBackupVaultOutput> describeBackupVault(
      String backupVaultName) async {
    return DescribeBackupVaultOutput.fromJson({});
  }

  /// Returns information about a saved resource, including the last time it was
  /// backed-up, its Amazon Resource Name (ARN), and the AWS service type of the
  /// saved resource.
  ///
  /// [resourceArn]: An Amazon Resource Name (ARN) that uniquely identifies a
  /// resource. The format of the ARN depends on the resource type.
  Future<DescribeProtectedResourceOutput> describeProtectedResource(
      String resourceArn) async {
    return DescribeProtectedResourceOutput.fromJson({});
  }

  /// Returns metadata associated with a recovery point, including ID, status,
  /// encryption, and lifecycle.
  ///
  /// [backupVaultName]: The name of a logical container where backups are
  /// stored. Backup vaults are identified by names that are unique to the
  /// account used to create them and the AWS Region where they are created.
  /// They consist of lowercase letters, numbers, and hyphens.
  ///
  /// [recoveryPointArn]: An Amazon Resource Name (ARN) that uniquely identifies
  /// a recovery point; for example,
  /// `arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45`.
  Future<DescribeRecoveryPointOutput> describeRecoveryPoint(
      {@required String backupVaultName,
      @required String recoveryPointArn}) async {
    return DescribeRecoveryPointOutput.fromJson({});
  }

  /// Returns metadata associated with a restore job that is specified by a job
  /// ID.
  ///
  /// [restoreJobId]: Uniquely identifies the job that restores a recovery
  /// point.
  Future<DescribeRestoreJobOutput> describeRestoreJob(
      String restoreJobId) async {
    return DescribeRestoreJobOutput.fromJson({});
  }

  /// Returns the backup plan that is specified by the plan ID as a backup
  /// template.
  ///
  /// [backupPlanId]: Uniquely identifies a backup plan.
  Future<ExportBackupPlanTemplateOutput> exportBackupPlanTemplate(
      String backupPlanId) async {
    return ExportBackupPlanTemplateOutput.fromJson({});
  }

  /// Returns the body of a backup plan in JSON format, in addition to plan
  /// metadata.
  ///
  /// [backupPlanId]: Uniquely identifies a backup plan.
  ///
  /// [versionId]: Unique, randomly generated, Unicode, UTF-8 encoded strings
  /// that are at most 1,024 bytes long. Version IDs cannot be edited.
  Future<GetBackupPlanOutput> getBackupPlan(String backupPlanId,
      {String versionId}) async {
    return GetBackupPlanOutput.fromJson({});
  }

  /// Returns a valid JSON document specifying a backup plan or an error.
  ///
  /// [backupPlanTemplateJson]: A customer-supplied backup plan document in JSON
  /// format.
  Future<GetBackupPlanFromJsonOutput> getBackupPlanFromJson(
      String backupPlanTemplateJson) async {
    return GetBackupPlanFromJsonOutput.fromJson({});
  }

  /// Returns the template specified by its `templateId` as a backup plan.
  ///
  /// [backupPlanTemplateId]: Uniquely identifies a stored backup plan template.
  Future<GetBackupPlanFromTemplateOutput> getBackupPlanFromTemplate(
      String backupPlanTemplateId) async {
    return GetBackupPlanFromTemplateOutput.fromJson({});
  }

  /// Returns selection metadata and a document in JSON format that specifies a
  /// list of resources that are associated with a backup plan.
  ///
  /// [backupPlanId]: Uniquely identifies a backup plan.
  ///
  /// [selectionId]: Uniquely identifies the body of a request to assign a set
  /// of resources to a backup plan.
  Future<GetBackupSelectionOutput> getBackupSelection(
      {@required String backupPlanId, @required String selectionId}) async {
    return GetBackupSelectionOutput.fromJson({});
  }

  /// Returns the access policy document that is associated with the named
  /// backup vault.
  ///
  /// [backupVaultName]: The name of a logical container where backups are
  /// stored. Backup vaults are identified by names that are unique to the
  /// account used to create them and the AWS Region where they are created.
  /// They consist of lowercase letters, numbers, and hyphens.
  Future<GetBackupVaultAccessPolicyOutput> getBackupVaultAccessPolicy(
      String backupVaultName) async {
    return GetBackupVaultAccessPolicyOutput.fromJson({});
  }

  /// Returns event notifications for the specified backup vault.
  ///
  /// [backupVaultName]: The name of a logical container where backups are
  /// stored. Backup vaults are identified by names that are unique to the
  /// account used to create them and the AWS Region where they are created.
  /// They consist of lowercase letters, numbers, and hyphens.
  Future<GetBackupVaultNotificationsOutput> getBackupVaultNotifications(
      String backupVaultName) async {
    return GetBackupVaultNotificationsOutput.fromJson({});
  }

  /// Returns two sets of metadata key-value pairs. The first set lists the
  /// metadata that the recovery point was created with. The second set lists
  /// the metadata key-value pairs that are required to restore the recovery
  /// point.
  ///
  /// These sets can be the same, or the restore metadata set can contain
  /// different values if the target service to be restored has changed since
  /// the recovery point was created and now requires additional or different
  /// information in order to be restored.
  ///
  /// [backupVaultName]: The name of a logical container where backups are
  /// stored. Backup vaults are identified by names that are unique to the
  /// account used to create them and the AWS Region where they are created.
  /// They consist of lowercase letters, numbers, and hyphens.
  ///
  /// [recoveryPointArn]: An Amazon Resource Name (ARN) that uniquely identifies
  /// a recovery point; for example,
  /// `arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45`.
  Future<GetRecoveryPointRestoreMetadataOutput> getRecoveryPointRestoreMetadata(
      {@required String backupVaultName,
      @required String recoveryPointArn}) async {
    return GetRecoveryPointRestoreMetadataOutput.fromJson({});
  }

  /// Returns the AWS resource types supported by AWS Backup.
  Future<GetSupportedResourceTypesOutput> getSupportedResourceTypes() async {
    return GetSupportedResourceTypesOutput.fromJson({});
  }

  /// Returns metadata about your backup jobs.
  ///
  /// [nextToken]: The next item following a partial list of returned items. For
  /// example, if a request is made to return `maxResults` number of items,
  /// `NextToken` allows you to return more items in your list starting at the
  /// location pointed to by the next token.
  ///
  /// [maxResults]: The maximum number of items to be returned.
  ///
  /// [byResourceArn]: Returns only backup jobs that match the specified
  /// resource Amazon Resource Name (ARN).
  ///
  /// [byState]: Returns only backup jobs that are in the specified state.
  ///
  /// [byBackupVaultName]: Returns only backup jobs that will be stored in the
  /// specified backup vault. Backup vaults are identified by names that are
  /// unique to the account used to create them and the AWS Region where they
  /// are created. They consist of lowercase letters, numbers, and hyphens.
  ///
  /// [byCreatedBefore]: Returns only backup jobs that were created before the
  /// specified date.
  ///
  /// [byCreatedAfter]: Returns only backup jobs that were created after the
  /// specified date.
  ///
  /// [byResourceType]: Returns only backup jobs for the specified resources:
  ///
  /// *    `EBS` for Amazon Elastic Block Store
  ///
  /// *    `SGW` for AWS Storage Gateway
  ///
  /// *    `RDS` for Amazon Relational Database Service
  ///
  /// *    `DDB` for Amazon DynamoDB
  ///
  /// *    `EFS` for Amazon Elastic File System
  Future<ListBackupJobsOutput> listBackupJobs(
      {String nextToken,
      int maxResults,
      String byResourceArn,
      String byState,
      String byBackupVaultName,
      DateTime byCreatedBefore,
      DateTime byCreatedAfter,
      String byResourceType}) async {
    return ListBackupJobsOutput.fromJson({});
  }

  /// Returns metadata of your saved backup plan templates, including the
  /// template ID, name, and the creation and deletion dates.
  ///
  /// [nextToken]: The next item following a partial list of returned items. For
  /// example, if a request is made to return `maxResults` number of items,
  /// `NextToken` allows you to return more items in your list starting at the
  /// location pointed to by the next token.
  ///
  /// [maxResults]: The maximum number of items to be returned.
  Future<ListBackupPlanTemplatesOutput> listBackupPlanTemplates(
      {String nextToken, int maxResults}) async {
    return ListBackupPlanTemplatesOutput.fromJson({});
  }

  /// Returns version metadata of your backup plans, including Amazon Resource
  /// Names (ARNs), backup plan IDs, creation and deletion dates, plan names,
  /// and version IDs.
  ///
  /// [backupPlanId]: Uniquely identifies a backup plan.
  ///
  /// [nextToken]: The next item following a partial list of returned items. For
  /// example, if a request is made to return `maxResults` number of items,
  /// `NextToken` allows you to return more items in your list starting at the
  /// location pointed to by the next token.
  ///
  /// [maxResults]: The maximum number of items to be returned.
  Future<ListBackupPlanVersionsOutput> listBackupPlanVersions(
      String backupPlanId,
      {String nextToken,
      int maxResults}) async {
    return ListBackupPlanVersionsOutput.fromJson({});
  }

  /// Returns metadata of your saved backup plans, including Amazon Resource
  /// Names (ARNs), plan IDs, creation and deletion dates, version IDs, plan
  /// names, and creator request IDs.
  ///
  /// [nextToken]: The next item following a partial list of returned items. For
  /// example, if a request is made to return `maxResults` number of items,
  /// `NextToken` allows you to return more items in your list starting at the
  /// location pointed to by the next token.
  ///
  /// [maxResults]: The maximum number of items to be returned.
  ///
  /// [includeDeleted]: A Boolean value with a default value of `FALSE` that
  /// returns deleted backup plans when set to `TRUE`.
  Future<ListBackupPlansOutput> listBackupPlans(
      {String nextToken, int maxResults, bool includeDeleted}) async {
    return ListBackupPlansOutput.fromJson({});
  }

  /// Returns an array containing metadata of the resources associated with the
  /// target backup plan.
  ///
  /// [backupPlanId]: Uniquely identifies a backup plan.
  ///
  /// [nextToken]: The next item following a partial list of returned items. For
  /// example, if a request is made to return `maxResults` number of items,
  /// `NextToken` allows you to return more items in your list starting at the
  /// location pointed to by the next token.
  ///
  /// [maxResults]: The maximum number of items to be returned.
  Future<ListBackupSelectionsOutput> listBackupSelections(String backupPlanId,
      {String nextToken, int maxResults}) async {
    return ListBackupSelectionsOutput.fromJson({});
  }

  /// Returns a list of recovery point storage containers along with information
  /// about them.
  ///
  /// [nextToken]: The next item following a partial list of returned items. For
  /// example, if a request is made to return `maxResults` number of items,
  /// `NextToken` allows you to return more items in your list starting at the
  /// location pointed to by the next token.
  ///
  /// [maxResults]: The maximum number of items to be returned.
  Future<ListBackupVaultsOutput> listBackupVaults(
      {String nextToken, int maxResults}) async {
    return ListBackupVaultsOutput.fromJson({});
  }

  /// Returns an array of resources successfully backed up by AWS Backup,
  /// including the time the resource was saved, an Amazon Resource Name (ARN)
  /// of the resource, and a resource type.
  ///
  /// [nextToken]: The next item following a partial list of returned items. For
  /// example, if a request is made to return `maxResults` number of items,
  /// `NextToken` allows you to return more items in your list starting at the
  /// location pointed to by the next token.
  ///
  /// [maxResults]: The maximum number of items to be returned.
  Future<ListProtectedResourcesOutput> listProtectedResources(
      {String nextToken, int maxResults}) async {
    return ListProtectedResourcesOutput.fromJson({});
  }

  /// Returns detailed information about the recovery points stored in a backup
  /// vault.
  ///
  /// [backupVaultName]: The name of a logical container where backups are
  /// stored. Backup vaults are identified by names that are unique to the
  /// account used to create them and the AWS Region where they are created.
  /// They consist of lowercase letters, numbers, and hyphens.
  ///
  /// [nextToken]: The next item following a partial list of returned items. For
  /// example, if a request is made to return `maxResults` number of items,
  /// `NextToken` allows you to return more items in your list starting at the
  /// location pointed to by the next token.
  ///
  /// [maxResults]: The maximum number of items to be returned.
  ///
  /// [byResourceArn]: Returns only recovery points that match the specified
  /// resource Amazon Resource Name (ARN).
  ///
  /// [byResourceType]: Returns only recovery points that match the specified
  /// resource type.
  ///
  /// [byBackupPlanId]: Returns only recovery points that match the specified
  /// backup plan ID.
  ///
  /// [byCreatedBefore]: Returns only recovery points that were created before
  /// the specified timestamp.
  ///
  /// [byCreatedAfter]: Returns only recovery points that were created after the
  /// specified timestamp.
  Future<ListRecoveryPointsByBackupVaultOutput> listRecoveryPointsByBackupVault(
      String backupVaultName,
      {String nextToken,
      int maxResults,
      String byResourceArn,
      String byResourceType,
      String byBackupPlanId,
      DateTime byCreatedBefore,
      DateTime byCreatedAfter}) async {
    return ListRecoveryPointsByBackupVaultOutput.fromJson({});
  }

  /// Returns detailed information about recovery points of the type specified
  /// by a resource Amazon Resource Name (ARN).
  ///
  /// [resourceArn]: An ARN that uniquely identifies a resource. The format of
  /// the ARN depends on the resource type.
  ///
  /// [nextToken]: The next item following a partial list of returned items. For
  /// example, if a request is made to return `maxResults` number of items,
  /// `NextToken` allows you to return more items in your list starting at the
  /// location pointed to by the next token.
  ///
  /// [maxResults]: The maximum number of items to be returned.
  Future<ListRecoveryPointsByResourceOutput> listRecoveryPointsByResource(
      String resourceArn,
      {String nextToken,
      int maxResults}) async {
    return ListRecoveryPointsByResourceOutput.fromJson({});
  }

  /// Returns a list of jobs that AWS Backup initiated to restore a saved
  /// resource, including metadata about the recovery process.
  ///
  /// [nextToken]: The next item following a partial list of returned items. For
  /// example, if a request is made to return `maxResults` number of items,
  /// `NextToken` allows you to return more items in your list starting at the
  /// location pointed to by the next token.
  ///
  /// [maxResults]: The maximum number of items to be returned.
  Future<ListRestoreJobsOutput> listRestoreJobs(
      {String nextToken, int maxResults}) async {
    return ListRestoreJobsOutput.fromJson({});
  }

  /// Returns a list of key-value pairs assigned to a target recovery point,
  /// backup plan, or backup vault.
  ///
  /// [resourceArn]: An Amazon Resource Name (ARN) that uniquely identifies a
  /// resource. The format of the ARN depends on the type of resource. Valid
  /// targets for `ListTags` are recovery points, backup plans, and backup
  /// vaults.
  ///
  /// [nextToken]: The next item following a partial list of returned items. For
  /// example, if a request is made to return `maxResults` number of items,
  /// `NextToken` allows you to return more items in your list starting at the
  /// location pointed to by the next token.
  ///
  /// [maxResults]: The maximum number of items to be returned.
  Future<ListTagsOutput> listTags(String resourceArn,
      {String nextToken, int maxResults}) async {
    return ListTagsOutput.fromJson({});
  }

  /// Sets a resource-based policy that is used to manage access permissions on
  /// the target backup vault. Requires a backup vault name and an access policy
  /// document in JSON format.
  ///
  /// [backupVaultName]: The name of a logical container where backups are
  /// stored. Backup vaults are identified by names that are unique to the
  /// account used to create them and the AWS Region where they are created.
  /// They consist of lowercase letters, numbers, and hyphens.
  ///
  /// [policy]: The backup vault access policy document in JSON format.
  Future<void> putBackupVaultAccessPolicy(String backupVaultName,
      {String policy}) async {}

  /// Turns on notifications on a backup vault for the specified topic and
  /// events.
  ///
  /// [backupVaultName]: The name of a logical container where backups are
  /// stored. Backup vaults are identified by names that are unique to the
  /// account used to create them and the AWS Region where they are created.
  /// They consist of lowercase letters, numbers, and hyphens.
  ///
  /// [snsTopicArn]: The Amazon Resource Name (ARN) that specifies the topic for
  /// a backup vault’s events; for example,
  /// `arn:aws:sns:us-west-2:111122223333:MyVaultTopic`.
  ///
  /// [backupVaultEvents]: An array of events that indicate the status of jobs
  /// to back up resources to the backup vault.
  Future<void> putBackupVaultNotifications(
      {@required String backupVaultName,
      @required String snsTopicArn,
      @required List<String> backupVaultEvents}) async {}

  /// Starts a job to create a one-time backup of the specified resource.
  ///
  /// [backupVaultName]: The name of a logical container where backups are
  /// stored. Backup vaults are identified by names that are unique to the
  /// account used to create them and the AWS Region where they are created.
  /// They consist of lowercase letters, numbers, and hyphens.
  ///
  /// [resourceArn]: An Amazon Resource Name (ARN) that uniquely identifies a
  /// resource. The format of the ARN depends on the resource type.
  ///
  /// [iamRoleArn]: Specifies the IAM role ARN used to create the target
  /// recovery point; for example, `arn:aws:iam::123456789012:role/S3Access`.
  ///
  /// [idempotencyToken]: A customer chosen string that can be used to
  /// distinguish between calls to `StartBackupJob`. Idempotency tokens time out
  /// after one hour. Therefore, if you call `StartBackupJob` multiple times
  /// with the same idempotency token within one hour, AWS Backup recognizes
  /// that you are requesting only one backup job and initiates only one. If you
  /// change the idempotency token for each call, AWS Backup recognizes that you
  /// are requesting to start multiple backups.
  ///
  /// [startWindowMinutes]: The amount of time in minutes before beginning a
  /// backup.
  ///
  /// [completeWindowMinutes]: The amount of time AWS Backup attempts a backup
  /// before canceling the job and returning an error.
  ///
  /// [lifecycle]: The lifecycle defines when a protected resource is
  /// transitioned to cold storage and when it expires. AWS Backup will
  /// transition and expire backups automatically according to the lifecycle
  /// that you define.
  ///
  /// Backups transitioned to cold storage must be stored in cold storage for a
  /// minimum of 90 days. Therefore, the “expire after days” setting must be 90
  /// days greater than the “transition to cold after days” setting. The
  /// “transition to cold after days” setting cannot be changed after a backup
  /// has been transitioned to cold.
  ///
  /// [recoveryPointTags]: To help organize your resources, you can assign your
  /// own metadata to the resources that you create. Each tag is a key-value
  /// pair.
  Future<StartBackupJobOutput> startBackupJob(
      {@required String backupVaultName,
      @required String resourceArn,
      @required String iamRoleArn,
      String idempotencyToken,
      BigInt startWindowMinutes,
      BigInt completeWindowMinutes,
      Lifecycle lifecycle,
      Map<String, String> recoveryPointTags}) async {
    return StartBackupJobOutput.fromJson({});
  }

  /// Recovers the saved resource identified by an Amazon Resource Name (ARN).
  ///
  /// If the resource ARN is included in the request, then the last complete
  /// backup of that resource is recovered. If the ARN of a recovery point is
  /// supplied, then that recovery point is restored.
  ///
  /// [recoveryPointArn]: An ARN that uniquely identifies a recovery point; for
  /// example,
  /// `arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45`.
  ///
  /// [metadata]: A set of metadata key-value pairs. Lists the metadata that the
  /// recovery point was created with.
  ///
  /// [iamRoleArn]: The Amazon Resource Name (ARN) of the IAM role that AWS
  /// Backup uses to create the target recovery point; for example,
  /// `arn:aws:iam::123456789012:role/S3Access`.
  ///
  /// [idempotencyToken]: A customer chosen string that can be used to
  /// distinguish between calls to `StartRestoreJob`. Idempotency tokens time
  /// out after one hour. Therefore, if you call `StartRestoreJob` multiple
  /// times with the same idempotency token within one hour, AWS Backup
  /// recognizes that you are requesting only one restore job and initiates only
  /// one. If you change the idempotency token for each call, AWS Backup
  /// recognizes that you are requesting to start multiple restores.
  ///
  /// [resourceType]: Starts a job to restore a recovery point for one of the
  /// following resources:
  ///
  /// *    `EBS` for Amazon Elastic Block Store
  ///
  /// *    `SGW` for AWS Storage Gateway
  ///
  /// *    `RDS` for Amazon Relational Database Service
  ///
  /// *    `DDB` for Amazon DynamoDB
  ///
  /// *    `EFS` for Amazon Elastic File System
  Future<StartRestoreJobOutput> startRestoreJob(
      {@required String recoveryPointArn,
      @required Map<String, String> metadata,
      @required String iamRoleArn,
      String idempotencyToken,
      String resourceType}) async {
    return StartRestoreJobOutput.fromJson({});
  }

  /// Attempts to cancel a job to create a one-time backup of a resource.
  ///
  /// [backupJobId]: Uniquely identifies a request to AWS Backup to back up a
  /// resource.
  Future<void> stopBackupJob(String backupJobId) async {}

  /// Assigns a set of key-value pairs to a recovery point, backup plan, or
  /// backup vault identified by an Amazon Resource Name (ARN).
  ///
  /// [resourceArn]: An ARN that uniquely identifies a resource. The format of
  /// the ARN depends on the type of the tagged resource.
  ///
  /// [tags]: Key-value pairs that are used to help organize your resources. You
  /// can assign your own metadata to the resources you create.
  Future<void> tagResource(
      {@required String resourceArn,
      @required Map<String, String> tags}) async {}

  /// Removes a set of key-value pairs from a recovery point, backup plan, or
  /// backup vault identified by an Amazon Resource Name (ARN)
  ///
  /// [resourceArn]: An ARN that uniquely identifies a resource. The format of
  /// the ARN depends on the type of the tagged resource.
  ///
  /// [tagKeyList]: A list of keys to identify which key-value tags to remove
  /// from a resource.
  Future<void> untagResource(
      {@required String resourceArn,
      @required List<String> tagKeyList}) async {}

  /// Replaces the body of a saved backup plan identified by its `backupPlanId`
  /// with the input document in JSON format. The new version is uniquely
  /// identified by a `VersionId`.
  ///
  /// [backupPlanId]: Uniquely identifies a backup plan.
  ///
  /// [backupPlan]: Specifies the body of a backup plan. Includes a
  /// `BackupPlanName` and one or more sets of `Rules`.
  Future<UpdateBackupPlanOutput> updateBackupPlan(
      {@required String backupPlanId,
      @required BackupPlanInput backupPlan}) async {
    return UpdateBackupPlanOutput.fromJson({});
  }

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
  ///
  /// [backupVaultName]: The name of a logical container where backups are
  /// stored. Backup vaults are identified by names that are unique to the
  /// account used to create them and the AWS Region where they are created.
  /// They consist of lowercase letters, numbers, and hyphens.
  ///
  /// [recoveryPointArn]: An Amazon Resource Name (ARN) that uniquely identifies
  /// a recovery point; for example,
  /// `arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45`.
  ///
  /// [lifecycle]: The lifecycle defines when a protected resource is
  /// transitioned to cold storage and when it expires. AWS Backup transitions
  /// and expires backups automatically according to the lifecycle that you
  /// define.
  ///
  /// Backups transitioned to cold storage must be stored in cold storage for a
  /// minimum of 90 days. Therefore, the “expire after days” setting must be 90
  /// days greater than the “transition to cold after days” setting. The
  /// “transition to cold after days” setting cannot be changed after a backup
  /// has been transitioned to cold.
  Future<UpdateRecoveryPointLifecycleOutput> updateRecoveryPointLifecycle(
      {@required String backupVaultName,
      @required String recoveryPointArn,
      Lifecycle lifecycle}) async {
    return UpdateRecoveryPointLifecycleOutput.fromJson({});
  }
}

/// Contains detailed information about a backup job.
class BackupJob {
  /// Uniquely identifies a request to AWS Backup to back up a resource.
  final String backupJobId;

  /// The name of a logical container where backups are stored. Backup vaults
  /// are identified by names that are unique to the account used to create them
  /// and the AWS Region where they are created. They consist of lowercase
  /// letters, numbers, and hyphens.
  final String backupVaultName;

  /// An Amazon Resource Name (ARN) that uniquely identifies a backup vault; for
  /// example, `arn:aws:backup:us-east-1:123456789012:vault:aBackupVault`.
  final String backupVaultArn;

  /// An ARN that uniquely identifies a recovery point; for example,
  /// `arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45`.
  final String recoveryPointArn;

  /// An ARN that uniquely identifies a resource. The format of the ARN depends
  /// on the resource type.
  final String resourceArn;

  /// The date and time a backup job is created, in Unix format and Coordinated
  /// Universal Time (UTC). The value of `CreationDate` is accurate to
  /// milliseconds. For example, the value 1516925490.087 represents Friday,
  /// January 26, 2018 12:11:30.087 AM.
  final DateTime creationDate;

  /// The date and time a job to create a backup job is completed, in Unix
  /// format and Coordinated Universal Time (UTC). The value of `CompletionDate`
  /// is accurate to milliseconds. For example, the value 1516925490.087
  /// represents Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime completionDate;

  /// The current state of a resource recovery point.
  final String state;

  /// A detailed message explaining the status of the job to back up a resource.
  final String statusMessage;

  /// Contains an estimated percentage complete of a job at the time the job
  /// status was queried.
  final String percentDone;

  /// The size, in bytes, of a backup.
  final BigInt backupSizeInBytes;

  /// Specifies the IAM role ARN used to create the target recovery point; for
  /// example, `arn:aws:iam::123456789012:role/S3Access`.
  final String iamRoleArn;

  /// Contains identifying information about the creation of a backup job,
  /// including the `BackupPlanArn`, `BackupPlanId`, `BackupPlanVersion`, and
  /// `BackupRuleId` of the backup plan used to create it.
  final RecoveryPointCreator createdBy;

  /// The date and time a job to back up resources is expected to be completed,
  /// in Unix format and Coordinated Universal Time (UTC). The value of
  /// `ExpectedCompletionDate` is accurate to milliseconds. For example, the
  /// value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime expectedCompletionDate;

  /// Specifies the time in Unix format and Coordinated Universal Time (UTC)
  /// when a backup job must be started before it is canceled. The value is
  /// calculated by adding the start window to the scheduled time. So if the
  /// scheduled time were 6:00 PM and the start window is 2 hours, the `StartBy`
  /// time would be 8:00 PM on the date specified. The value of `StartBy` is
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime startBy;

  /// The type of AWS resource to be backed-up; for example, an Amazon Elastic
  /// Block Store (Amazon EBS) volume or an Amazon Relational Database Service
  /// (Amazon RDS) database.
  final String resourceType;

  /// The size in bytes transferred to a backup vault at the time that the job
  /// status was queried.
  final BigInt bytesTransferred;

  BackupJob({
    this.backupJobId,
    this.backupVaultName,
    this.backupVaultArn,
    this.recoveryPointArn,
    this.resourceArn,
    this.creationDate,
    this.completionDate,
    this.state,
    this.statusMessage,
    this.percentDone,
    this.backupSizeInBytes,
    this.iamRoleArn,
    this.createdBy,
    this.expectedCompletionDate,
    this.startBy,
    this.resourceType,
    this.bytesTransferred,
  });
  static BackupJob fromJson(Map<String, dynamic> json) => BackupJob();
}

/// Contains an optional backup plan display name and an array of `BackupRule`
/// objects, each of which specifies a backup rule. Each rule in a backup plan
/// is a separate scheduled task and can back up a different selection of AWS
/// resources.
class BackupPlan {
  /// The display name of a backup plan.
  final String backupPlanName;

  /// An array of `BackupRule` objects, each of which specifies a scheduled task
  /// that is used to back up a selection of resources.
  final List<BackupRule> rules;

  BackupPlan({
    @required this.backupPlanName,
    @required this.rules,
  });
  static BackupPlan fromJson(Map<String, dynamic> json) => BackupPlan();
}

/// Contains an optional backup plan display name and an array of `BackupRule`
/// objects, each of which specifies a backup rule. Each rule in a backup plan
/// is a separate scheduled task and can back up a different selection of AWS
/// resources.
class BackupPlanInput {
  /// The display name of a backup plan.
  final String backupPlanName;

  /// An array of `BackupRule` objects, each of which specifies a scheduled task
  /// that is used to back up a selection of resources.
  final List<BackupRuleInput> rules;

  BackupPlanInput({
    @required this.backupPlanName,
    @required this.rules,
  });
}

/// An object specifying metadata associated with a backup plan template.
class BackupPlanTemplatesListMember {
  /// Uniquely identifies a stored backup plan template.
  final String backupPlanTemplateId;

  /// The optional display name of a backup plan template.
  final String backupPlanTemplateName;

  BackupPlanTemplatesListMember({
    this.backupPlanTemplateId,
    this.backupPlanTemplateName,
  });
  static BackupPlanTemplatesListMember fromJson(Map<String, dynamic> json) =>
      BackupPlanTemplatesListMember();
}

/// Contains metadata about a backup plan.
class BackupPlansListMember {
  /// An Amazon Resource Name (ARN) that uniquely identifies a backup plan; for
  /// example,
  /// `arn:aws:backup:us-east-1:123456789012:plan:8F81F553-3A74-4A3F-B93D-B3360DC80C50`.
  final String backupPlanArn;

  /// Uniquely identifies a backup plan.
  final String backupPlanId;

  /// The date and time a resource backup plan is created, in Unix format and
  /// Coordinated Universal Time (UTC). The value of `CreationDate` is accurate
  /// to milliseconds. For example, the value 1516925490.087 represents Friday,
  /// January 26, 2018 12:11:30.087 AM.
  final DateTime creationDate;

  /// The date and time a backup plan is deleted, in Unix format and Coordinated
  /// Universal Time (UTC). The value of `DeletionDate` is accurate to
  /// milliseconds. For example, the value 1516925490.087 represents Friday,
  /// January 26, 2018 12:11:30.087 AM.
  final DateTime deletionDate;

  /// Unique, randomly generated, Unicode, UTF-8 encoded strings that are at
  /// most 1,024 bytes long. Version IDs cannot be edited.
  final String versionId;

  /// The display name of a saved backup plan.
  final String backupPlanName;

  /// A unique string that identifies the request and allows failed requests to
  /// be retried without the risk of executing the operation twice.
  final String creatorRequestId;

  /// The last time a job to back up resources was executed with this rule. A
  /// date and time, in Unix format and Coordinated Universal Time (UTC). The
  /// value of `LastExecutionDate` is accurate to milliseconds. For example, the
  /// value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime lastExecutionDate;

  BackupPlansListMember({
    this.backupPlanArn,
    this.backupPlanId,
    this.creationDate,
    this.deletionDate,
    this.versionId,
    this.backupPlanName,
    this.creatorRequestId,
    this.lastExecutionDate,
  });
  static BackupPlansListMember fromJson(Map<String, dynamic> json) =>
      BackupPlansListMember();
}

/// Specifies a scheduled task used to back up a selection of resources.
class BackupRule {
  /// An optional display name for a backup rule.
  final String ruleName;

  /// The name of a logical container where backups are stored. Backup vaults
  /// are identified by names that are unique to the account used to create them
  /// and the AWS Region where they are created. They consist of lowercase
  /// letters, numbers, and hyphens.
  final String targetBackupVaultName;

  /// A CRON expression specifying when AWS Backup initiates a backup job.
  final String scheduleExpression;

  /// An optional value that specifies a period of time in minutes after a
  /// backup is scheduled before a job is canceled if it doesn't start
  /// successfully.
  final BigInt startWindowMinutes;

  /// A value in minutes after a backup job is successfully started before it
  /// must be completed or it is canceled by AWS Backup. This value is optional.
  final BigInt completionWindowMinutes;

  /// The lifecycle defines when a protected resource is transitioned to cold
  /// storage and when it expires. AWS Backup transitions and expires backups
  /// automatically according to the lifecycle that you define.
  ///
  /// Backups transitioned to cold storage must be stored in cold storage for a
  /// minimum of 90 days. Therefore, the “expire after days” setting must be 90
  /// days greater than the “transition to cold after days” setting. The
  /// “transition to cold after days” setting cannot be changed after a backup
  /// has been transitioned to cold.
  final Lifecycle lifecycle;

  /// An array of key-value pair strings that are assigned to resources that are
  /// associated with this rule when restored from backup.
  final Map<String, String> recoveryPointTags;

  /// Uniquely identifies a rule that is used to schedule the backup of a
  /// selection of resources.
  final String ruleId;

  BackupRule({
    @required this.ruleName,
    @required this.targetBackupVaultName,
    this.scheduleExpression,
    this.startWindowMinutes,
    this.completionWindowMinutes,
    this.lifecycle,
    this.recoveryPointTags,
    this.ruleId,
  });
  static BackupRule fromJson(Map<String, dynamic> json) => BackupRule();
}

/// Specifies a scheduled task used to back up a selection of resources.
class BackupRuleInput {
  /// >An optional display name for a backup rule.
  final String ruleName;

  /// The name of a logical container where backups are stored. Backup vaults
  /// are identified by names that are unique to the account used to create them
  /// and the AWS Region where they are created. They consist of lowercase
  /// letters, numbers, and hyphens.
  final String targetBackupVaultName;

  /// A CRON expression specifying when AWS Backup initiates a backup job.
  final String scheduleExpression;

  /// The amount of time in minutes before beginning a backup.
  final BigInt startWindowMinutes;

  /// The amount of time AWS Backup attempts a backup before canceling the job
  /// and returning an error.
  final BigInt completionWindowMinutes;

  /// The lifecycle defines when a protected resource is transitioned to cold
  /// storage and when it expires. AWS Backup will transition and expire backups
  /// automatically according to the lifecycle that you define.
  ///
  /// Backups transitioned to cold storage must be stored in cold storage for a
  /// minimum of 90 days. Therefore, the “expire after days” setting must be 90
  /// days greater than the “transition to cold after days”. The “transition to
  /// cold after days” setting cannot be changed after a backup has been
  /// transitioned to cold.
  final Lifecycle lifecycle;

  /// To help organize your resources, you can assign your own metadata to the
  /// resources that you create. Each tag is a key-value pair.
  final Map<String, String> recoveryPointTags;

  BackupRuleInput({
    @required this.ruleName,
    @required this.targetBackupVaultName,
    this.scheduleExpression,
    this.startWindowMinutes,
    this.completionWindowMinutes,
    this.lifecycle,
    this.recoveryPointTags,
  });
}

/// Used to specify a set of resources to a backup plan.
class BackupSelection {
  /// The display name of a resource selection document.
  final String selectionName;

  /// The ARN of the IAM role that AWS Backup uses to authenticate when
  /// restoring the target resource; for example,
  /// `arn:aws:iam::123456789012:role/S3Access`.
  final String iamRoleArn;

  /// An array of strings that either contain Amazon Resource Names (ARNs) or
  /// match patterns such as "`arn:aws:ec2:us-east-1:123456789012:volume/*`" of
  /// resources to assign to a backup plan.
  final List<String> resources;

  /// An array of conditions used to specify a set of resources to assign to a
  /// backup plan; for example, `"StringEquals": {"ec2:ResourceTag/Department":
  /// "accounting"`.
  final List<Condition> listOfTags;

  BackupSelection({
    @required this.selectionName,
    @required this.iamRoleArn,
    this.resources,
    this.listOfTags,
  });
  static BackupSelection fromJson(Map<String, dynamic> json) =>
      BackupSelection();
}

/// Contains metadata about a `BackupSelection` object.
class BackupSelectionsListMember {
  /// Uniquely identifies a request to assign a set of resources to a backup
  /// plan.
  final String selectionId;

  /// The display name of a resource selection document.
  final String selectionName;

  /// Uniquely identifies a backup plan.
  final String backupPlanId;

  /// The date and time a backup plan is created, in Unix format and Coordinated
  /// Universal Time (UTC). The value of `CreationDate` is accurate to
  /// milliseconds. For example, the value 1516925490.087 represents Friday,
  /// January 26, 2018 12:11:30.087 AM.
  final DateTime creationDate;

  /// A unique string that identifies the request and allows failed requests to
  /// be retried without the risk of executing the operation twice.
  final String creatorRequestId;

  /// Specifies the IAM role Amazon Resource Name (ARN) to create the target
  /// recovery point; for example, `arn:aws:iam::123456789012:role/S3Access`.
  final String iamRoleArn;

  BackupSelectionsListMember({
    this.selectionId,
    this.selectionName,
    this.backupPlanId,
    this.creationDate,
    this.creatorRequestId,
    this.iamRoleArn,
  });
  static BackupSelectionsListMember fromJson(Map<String, dynamic> json) =>
      BackupSelectionsListMember();
}

/// Contains metadata about a backup vault.
class BackupVaultListMember {
  /// The name of a logical container where backups are stored. Backup vaults
  /// are identified by names that are unique to the account used to create them
  /// and the AWS Region where they are created. They consist of lowercase
  /// letters, numbers, and hyphens.
  final String backupVaultName;

  /// An Amazon Resource Name (ARN) that uniquely identifies a backup vault; for
  /// example, `arn:aws:backup:us-east-1:123456789012:vault:aBackupVault`.
  final String backupVaultArn;

  /// The date and time a resource backup is created, in Unix format and
  /// Coordinated Universal Time (UTC). The value of `CreationDate` is accurate
  /// to milliseconds. For example, the value 1516925490.087 represents Friday,
  /// January 26, 2018 12:11:30.087 AM.
  final DateTime creationDate;

  /// The server-side encryption key that is used to protect your backups; for
  /// example,
  /// `arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab`.
  final String encryptionKeyArn;

  /// A unique string that identifies the request and allows failed requests to
  /// be retried without the risk of executing the operation twice.
  final String creatorRequestId;

  /// The number of recovery points that are stored in a backup vault.
  final BigInt numberOfRecoveryPoints;

  BackupVaultListMember({
    this.backupVaultName,
    this.backupVaultArn,
    this.creationDate,
    this.encryptionKeyArn,
    this.creatorRequestId,
    this.numberOfRecoveryPoints,
  });
  static BackupVaultListMember fromJson(Map<String, dynamic> json) =>
      BackupVaultListMember();
}

/// Contains `DeleteAt` and `MoveToColdStorageAt` timestamps, which are used to
/// specify a lifecycle for a recovery point.
///
/// The lifecycle defines when a protected resource is transitioned to cold
/// storage and when it expires. AWS Backup transitions and expires backups
/// automatically according to the lifecycle that you define.
///
/// Backups transitioned to cold storage must be stored in cold storage for a
/// minimum of 90 days. Therefore, the “expire after days” setting must be 90
/// days greater than the “transition to cold after days” setting. The
/// “transition to cold after days” setting cannot be changed after a backup has
/// been transitioned to cold.
class CalculatedLifecycle {
  /// A timestamp that specifies when to transition a recovery point to cold
  /// storage.
  final DateTime moveToColdStorageAt;

  /// A timestamp that specifies when to delete a recovery point.
  final DateTime deleteAt;

  CalculatedLifecycle({
    this.moveToColdStorageAt,
    this.deleteAt,
  });
  static CalculatedLifecycle fromJson(Map<String, dynamic> json) =>
      CalculatedLifecycle();
}

/// Contains an array of triplets made up of a condition type (such as
/// `StringEquals`), a key, and a value. Conditions are used to filter resources
/// in a selection that is assigned to a backup plan.
class Condition {
  /// An operation, such as `StringEquals`, that is applied to a key-value pair
  /// used to filter resources in a selection.
  final String conditionType;

  /// The key in a key-value pair. For example, in
  /// `"ec2:ResourceTag/Department": "accounting"`,
  /// `"ec2:ResourceTag/Department"` is the key.
  final String conditionKey;

  /// The value in a key-value pair. For example, in
  /// `"ec2:ResourceTag/Department": "accounting"`, `"accounting"` is the value.
  final String conditionValue;

  Condition({
    @required this.conditionType,
    @required this.conditionKey,
    @required this.conditionValue,
  });
  static Condition fromJson(Map<String, dynamic> json) => Condition();
}

class CreateBackupPlanOutput {
  /// Uniquely identifies a backup plan.
  final String backupPlanId;

  /// An Amazon Resource Name (ARN) that uniquely identifies a backup plan; for
  /// example,
  /// `arn:aws:backup:us-east-1:123456789012:plan:8F81F553-3A74-4A3F-B93D-B3360DC80C50`.
  final String backupPlanArn;

  /// The date and time that a backup plan is created, in Unix format and
  /// Coordinated Universal Time (UTC). The value of `CreationDate` is accurate
  /// to milliseconds. For example, the value 1516925490.087 represents Friday,
  /// January 26, 2018 12:11:30.087 AM.
  final DateTime creationDate;

  /// Unique, randomly generated, Unicode, UTF-8 encoded strings that are at
  /// most 1024 bytes long. They cannot be edited.
  final String versionId;

  CreateBackupPlanOutput({
    this.backupPlanId,
    this.backupPlanArn,
    this.creationDate,
    this.versionId,
  });
  static CreateBackupPlanOutput fromJson(Map<String, dynamic> json) =>
      CreateBackupPlanOutput();
}

class CreateBackupSelectionOutput {
  /// Uniquely identifies the body of a request to assign a set of resources to
  /// a backup plan.
  final String selectionId;

  /// Uniquely identifies a backup plan.
  final String backupPlanId;

  /// The date and time a backup selection is created, in Unix format and
  /// Coordinated Universal Time (UTC). The value of `CreationDate` is accurate
  /// to milliseconds. For example, the value 1516925490.087 represents Friday,
  /// January 26, 2018 12:11:30.087 AM.
  final DateTime creationDate;

  CreateBackupSelectionOutput({
    this.selectionId,
    this.backupPlanId,
    this.creationDate,
  });
  static CreateBackupSelectionOutput fromJson(Map<String, dynamic> json) =>
      CreateBackupSelectionOutput();
}

class CreateBackupVaultOutput {
  /// The name of a logical container where backups are stored. Backup vaults
  /// are identified by names that are unique to the account used to create them
  /// and the Region where they are created. They consist of lowercase letters,
  /// numbers, and hyphens.
  final String backupVaultName;

  /// An Amazon Resource Name (ARN) that uniquely identifies a backup vault; for
  /// example, `arn:aws:backup:us-east-1:123456789012:vault:aBackupVault`.
  final String backupVaultArn;

  /// The date and time a backup vault is created, in Unix format and
  /// Coordinated Universal Time (UTC). The value of `CreationDate` is accurate
  /// to milliseconds. For example, the value 1516925490.087 represents Friday,
  /// January 26, 2018 12:11:30.087 AM.
  final DateTime creationDate;

  CreateBackupVaultOutput({
    this.backupVaultName,
    this.backupVaultArn,
    this.creationDate,
  });
  static CreateBackupVaultOutput fromJson(Map<String, dynamic> json) =>
      CreateBackupVaultOutput();
}

class DeleteBackupPlanOutput {
  /// Uniquely identifies a backup plan.
  final String backupPlanId;

  /// An Amazon Resource Name (ARN) that uniquely identifies a backup plan; for
  /// example,
  /// `arn:aws:backup:us-east-1:123456789012:plan:8F81F553-3A74-4A3F-B93D-B3360DC80C50`.
  final String backupPlanArn;

  /// The date and time a backup plan is deleted, in Unix format and Coordinated
  /// Universal Time (UTC). The value of `CreationDate` is accurate to
  /// milliseconds. For example, the value 1516925490.087 represents Friday,
  /// January 26, 2018 12:11:30.087 AM.
  final DateTime deletionDate;

  /// Unique, randomly generated, Unicode, UTF-8 encoded strings that are at
  /// most 1,024 bytes long. Version Ids cannot be edited.
  final String versionId;

  DeleteBackupPlanOutput({
    this.backupPlanId,
    this.backupPlanArn,
    this.deletionDate,
    this.versionId,
  });
  static DeleteBackupPlanOutput fromJson(Map<String, dynamic> json) =>
      DeleteBackupPlanOutput();
}

class DescribeBackupJobOutput {
  /// Uniquely identifies a request to AWS Backup to back up a resource.
  final String backupJobId;

  /// The name of a logical container where backups are stored. Backup vaults
  /// are identified by names that are unique to the account used to create them
  /// and the AWS Region where they are created. They consist of lowercase
  /// letters, numbers, and hyphens.
  final String backupVaultName;

  /// An Amazon Resource Name (ARN) that uniquely identifies a backup vault; for
  /// example, `arn:aws:backup:us-east-1:123456789012:vault:aBackupVault`.
  final String backupVaultArn;

  /// An ARN that uniquely identifies a recovery point; for example,
  /// `arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45`.
  final String recoveryPointArn;

  /// An ARN that uniquely identifies a saved resource. The format of the ARN
  /// depends on the resource type.
  final String resourceArn;

  /// The date and time that a backup job is created, in Unix format and
  /// Coordinated Universal Time (UTC). The value of `CreationDate` is accurate
  /// to milliseconds. For example, the value 1516925490.087 represents Friday,
  /// January 26, 2018 12:11:30.087 AM.
  final DateTime creationDate;

  /// The date and time that a job to create a backup job is completed, in Unix
  /// format and Coordinated Universal Time (UTC). The value of `CreationDate`
  /// is accurate to milliseconds. For example, the value 1516925490.087
  /// represents Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime completionDate;

  /// The current state of a resource recovery point.
  final String state;

  /// A detailed message explaining the status of the job to back up a resource.
  final String statusMessage;

  /// Contains an estimated percentage that is complete of a job at the time the
  /// job status was queried.
  final String percentDone;

  /// The size, in bytes, of a backup.
  final BigInt backupSizeInBytes;

  /// Specifies the IAM role ARN used to create the target recovery point; for
  /// example, `arn:aws:iam::123456789012:role/S3Access`.
  final String iamRoleArn;

  /// Contains identifying information about the creation of a backup job,
  /// including the `BackupPlanArn`, `BackupPlanId`, `BackupPlanVersion`, and
  /// `BackupRuleId` of the backup plan that is used to create it.
  final RecoveryPointCreator createdBy;

  /// The type of AWS resource to be backed-up; for example, an Amazon Elastic
  /// Block Store (Amazon EBS) volume or an Amazon Relational Database Service
  /// (Amazon RDS) database.
  final String resourceType;

  /// The size in bytes transferred to a backup vault at the time that the job
  /// status was queried.
  final BigInt bytesTransferred;

  /// The date and time that a job to back up resources is expected to be
  /// completed, in Unix format and Coordinated Universal Time (UTC). The value
  /// of `ExpectedCompletionDate` is accurate to milliseconds. For example, the
  /// value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime expectedCompletionDate;

  /// Specifies the time in Unix format and Coordinated Universal Time (UTC)
  /// when a backup job must be started before it is canceled. The value is
  /// calculated by adding the start window to the scheduled time. So if the
  /// scheduled time were 6:00 PM and the start window is 2 hours, the `StartBy`
  /// time would be 8:00 PM on the date specified. The value of `StartBy` is
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime startBy;

  DescribeBackupJobOutput({
    this.backupJobId,
    this.backupVaultName,
    this.backupVaultArn,
    this.recoveryPointArn,
    this.resourceArn,
    this.creationDate,
    this.completionDate,
    this.state,
    this.statusMessage,
    this.percentDone,
    this.backupSizeInBytes,
    this.iamRoleArn,
    this.createdBy,
    this.resourceType,
    this.bytesTransferred,
    this.expectedCompletionDate,
    this.startBy,
  });
  static DescribeBackupJobOutput fromJson(Map<String, dynamic> json) =>
      DescribeBackupJobOutput();
}

class DescribeBackupVaultOutput {
  /// The name of a logical container where backups are stored. Backup vaults
  /// are identified by names that are unique to the account used to create them
  /// and the Region where they are created. They consist of lowercase letters,
  /// numbers, and hyphens.
  final String backupVaultName;

  /// An Amazon Resource Name (ARN) that uniquely identifies a backup vault; for
  /// example, `arn:aws:backup:us-east-1:123456789012:vault:aBackupVault`.
  final String backupVaultArn;

  /// The server-side encryption key that is used to protect your backups; for
  /// example,
  /// `arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab`.
  final String encryptionKeyArn;

  /// The date and time that a backup vault is created, in Unix format and
  /// Coordinated Universal Time (UTC). The value of `CreationDate` is accurate
  /// to milliseconds. For example, the value 1516925490.087 represents Friday,
  /// January 26, 2018 12:11:30.087 AM.
  final DateTime creationDate;

  /// A unique string that identifies the request and allows failed requests to
  /// be retried without the risk of executing the operation twice.
  final String creatorRequestId;

  /// The number of recovery points that are stored in a backup vault.
  final BigInt numberOfRecoveryPoints;

  DescribeBackupVaultOutput({
    this.backupVaultName,
    this.backupVaultArn,
    this.encryptionKeyArn,
    this.creationDate,
    this.creatorRequestId,
    this.numberOfRecoveryPoints,
  });
  static DescribeBackupVaultOutput fromJson(Map<String, dynamic> json) =>
      DescribeBackupVaultOutput();
}

class DescribeProtectedResourceOutput {
  /// An ARN that uniquely identifies a resource. The format of the ARN depends
  /// on the resource type.
  final String resourceArn;

  /// The type of AWS resource saved as a recovery point; for example, an EBS
  /// volume or an Amazon RDS database.
  final String resourceType;

  /// The date and time that a resource was last backed up, in Unix format and
  /// Coordinated Universal Time (UTC). The value of `LastBackupTime` is
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime lastBackupTime;

  DescribeProtectedResourceOutput({
    this.resourceArn,
    this.resourceType,
    this.lastBackupTime,
  });
  static DescribeProtectedResourceOutput fromJson(Map<String, dynamic> json) =>
      DescribeProtectedResourceOutput();
}

class DescribeRecoveryPointOutput {
  /// An ARN that uniquely identifies a recovery point; for example,
  /// `arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45`.
  final String recoveryPointArn;

  /// The name of a logical container where backups are stored. Backup vaults
  /// are identified by names that are unique to the account used to create them
  /// and the Region where they are created. They consist of lowercase letters,
  /// numbers, and hyphens.
  final String backupVaultName;

  /// An ARN that uniquely identifies a backup vault; for example,
  /// `arn:aws:backup:us-east-1:123456789012:vault:aBackupVault`.
  final String backupVaultArn;

  /// An ARN that uniquely identifies a saved resource. The format of the ARN
  /// depends on the resource type.
  final String resourceArn;

  /// The type of AWS resource to save as a recovery point; for example, an
  /// Amazon Elastic Block Store (Amazon EBS) volume or an Amazon Relational
  /// Database Service (Amazon RDS) database.
  final String resourceType;

  /// Contains identifying information about the creation of a recovery point,
  /// including the `BackupPlanArn`, `BackupPlanId`, `BackupPlanVersion`, and
  /// `BackupRuleId` of the backup plan used to create it.
  final RecoveryPointCreator createdBy;

  /// Specifies the IAM role ARN used to create the target recovery point; for
  /// example, `arn:aws:iam::123456789012:role/S3Access`.
  final String iamRoleArn;

  /// A status code specifying the state of the recovery point.
  ///
  ///
  ///
  /// A partial status indicates that the recovery point was not successfully
  /// re-created and must be retried.
  final String status;

  /// The date and time that a recovery point is created, in Unix format and
  /// Coordinated Universal Time (UTC). The value of `CreationDate` is accurate
  /// to milliseconds. For example, the value 1516925490.087 represents Friday,
  /// January 26, 2018 12:11:30.087 AM.
  final DateTime creationDate;

  /// The date and time that a job to create a recovery point is completed, in
  /// Unix format and Coordinated Universal Time (UTC). The value of
  /// `CompletionDate` is accurate to milliseconds. For example, the value
  /// 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime completionDate;

  /// The size, in bytes, of a backup.
  final BigInt backupSizeInBytes;

  /// A `CalculatedLifecycle` object containing `DeleteAt` and
  /// `MoveToColdStorageAt` timestamps.
  final CalculatedLifecycle calculatedLifecycle;

  /// The lifecycle defines when a protected resource is transitioned to cold
  /// storage and when it expires. AWS Backup transitions and expires backups
  /// automatically according to the lifecycle that you define.
  ///
  /// Backups that are transitioned to cold storage must be stored in cold
  /// storage for a minimum of 90 days. Therefore, the “expire after days”
  /// setting must be 90 days greater than the “transition to cold after days”
  /// setting. The “transition to cold after days” setting cannot be changed
  /// after a backup has been transitioned to cold.
  final Lifecycle lifecycle;

  /// The server-side encryption key used to protect your backups; for example,
  /// `arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab`.
  final String encryptionKeyArn;

  /// A Boolean value that is returned as `TRUE` if the specified recovery point
  /// is encrypted, or `FALSE` if the recovery point is not encrypted.
  final bool isEncrypted;

  /// Specifies the storage class of the recovery point. Valid values are `WARM`
  /// or `COLD`.
  final String storageClass;

  /// The date and time that a recovery point was last restored, in Unix format
  /// and Coordinated Universal Time (UTC). The value of `LastRestoreTime` is
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime lastRestoreTime;

  DescribeRecoveryPointOutput({
    this.recoveryPointArn,
    this.backupVaultName,
    this.backupVaultArn,
    this.resourceArn,
    this.resourceType,
    this.createdBy,
    this.iamRoleArn,
    this.status,
    this.creationDate,
    this.completionDate,
    this.backupSizeInBytes,
    this.calculatedLifecycle,
    this.lifecycle,
    this.encryptionKeyArn,
    this.isEncrypted,
    this.storageClass,
    this.lastRestoreTime,
  });
  static DescribeRecoveryPointOutput fromJson(Map<String, dynamic> json) =>
      DescribeRecoveryPointOutput();
}

class DescribeRestoreJobOutput {
  /// Uniquely identifies the job that restores a recovery point.
  final String restoreJobId;

  /// An ARN that uniquely identifies a recovery point; for example,
  /// `arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45`.
  final String recoveryPointArn;

  /// The date and time that a restore job is created, in Unix format and
  /// Coordinated Universal Time (UTC). The value of `CreationDate` is accurate
  /// to milliseconds. For example, the value 1516925490.087 represents Friday,
  /// January 26, 2018 12:11:30.087 AM.
  final DateTime creationDate;

  /// The date and time that a job to restore a recovery point is completed, in
  /// Unix format and Coordinated Universal Time (UTC). The value of
  /// `CompletionDate` is accurate to milliseconds. For example, the value
  /// 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime completionDate;

  /// Status code specifying the state of the job that is initiated by AWS
  /// Backup to restore a recovery point.
  final String status;

  /// A detailed message explaining the status of a job to restore a recovery
  /// point.
  final String statusMessage;

  /// Contains an estimated percentage that is complete of a job at the time the
  /// job status was queried.
  final String percentDone;

  /// The size, in bytes, of the restored resource.
  final BigInt backupSizeInBytes;

  /// Specifies the IAM role ARN used to create the target recovery point; for
  /// example, `arn:aws:iam::123456789012:role/S3Access`.
  final String iamRoleArn;

  /// The amount of time in minutes that a job restoring a recovery point is
  /// expected to take.
  final BigInt expectedCompletionTimeMinutes;

  /// An Amazon Resource Name (ARN) that uniquely identifies a resource whose
  /// recovery point is being restored. The format of the ARN depends on the
  /// resource type of the backed-up resource.
  final String createdResourceArn;

  DescribeRestoreJobOutput({
    this.restoreJobId,
    this.recoveryPointArn,
    this.creationDate,
    this.completionDate,
    this.status,
    this.statusMessage,
    this.percentDone,
    this.backupSizeInBytes,
    this.iamRoleArn,
    this.expectedCompletionTimeMinutes,
    this.createdResourceArn,
  });
  static DescribeRestoreJobOutput fromJson(Map<String, dynamic> json) =>
      DescribeRestoreJobOutput();
}

class ExportBackupPlanTemplateOutput {
  /// The body of a backup plan template in JSON format.
  ///
  ///
  ///
  /// This is a signed JSON document that cannot be modified before being passed
  /// to `GetBackupPlanFromJSON.`
  final String backupPlanTemplateJson;

  ExportBackupPlanTemplateOutput({
    this.backupPlanTemplateJson,
  });
  static ExportBackupPlanTemplateOutput fromJson(Map<String, dynamic> json) =>
      ExportBackupPlanTemplateOutput();
}

class GetBackupPlanFromJsonOutput {
  /// Specifies the body of a backup plan. Includes a `BackupPlanName` and one
  /// or more sets of `Rules`.
  final BackupPlan backupPlan;

  GetBackupPlanFromJsonOutput({
    this.backupPlan,
  });
  static GetBackupPlanFromJsonOutput fromJson(Map<String, dynamic> json) =>
      GetBackupPlanFromJsonOutput();
}

class GetBackupPlanFromTemplateOutput {
  /// Returns the body of a backup plan based on the target template, including
  /// the name, rules, and backup vault of the plan.
  final BackupPlan backupPlanDocument;

  GetBackupPlanFromTemplateOutput({
    this.backupPlanDocument,
  });
  static GetBackupPlanFromTemplateOutput fromJson(Map<String, dynamic> json) =>
      GetBackupPlanFromTemplateOutput();
}

class GetBackupPlanOutput {
  /// Specifies the body of a backup plan. Includes a `BackupPlanName` and one
  /// or more sets of `Rules`.
  final BackupPlan backupPlan;

  /// Uniquely identifies a backup plan.
  final String backupPlanId;

  /// An Amazon Resource Name (ARN) that uniquely identifies a backup plan; for
  /// example,
  /// `arn:aws:backup:us-east-1:123456789012:plan:8F81F553-3A74-4A3F-B93D-B3360DC80C50`.
  final String backupPlanArn;

  /// Unique, randomly generated, Unicode, UTF-8 encoded strings that are at
  /// most 1,024 bytes long. Version IDs cannot be edited.
  final String versionId;

  /// A unique string that identifies the request and allows failed requests to
  /// be retried without the risk of executing the operation twice.
  final String creatorRequestId;

  /// The date and time that a backup plan is created, in Unix format and
  /// Coordinated Universal Time (UTC). The value of `CreationDate` is accurate
  /// to milliseconds. For example, the value 1516925490.087 represents Friday,
  /// January 26, 2018 12:11:30.087 AM.
  final DateTime creationDate;

  /// The date and time that a backup plan is deleted, in Unix format and
  /// Coordinated Universal Time (UTC). The value of `CreationDate` is accurate
  /// to milliseconds. For example, the value 1516925490.087 represents Friday,
  /// January 26, 2018 12:11:30.087 AM.
  final DateTime deletionDate;

  /// The last time a job to back up resources was executed with this backup
  /// plan. A date and time, in Unix format and Coordinated Universal Time
  /// (UTC). The value of `LastExecutionDate` is accurate to milliseconds. For
  /// example, the value 1516925490.087 represents Friday, January 26, 2018
  /// 12:11:30.087 AM.
  final DateTime lastExecutionDate;

  GetBackupPlanOutput({
    this.backupPlan,
    this.backupPlanId,
    this.backupPlanArn,
    this.versionId,
    this.creatorRequestId,
    this.creationDate,
    this.deletionDate,
    this.lastExecutionDate,
  });
  static GetBackupPlanOutput fromJson(Map<String, dynamic> json) =>
      GetBackupPlanOutput();
}

class GetBackupSelectionOutput {
  /// Specifies the body of a request to assign a set of resources to a backup
  /// plan.
  ///
  /// It includes an array of resources, an optional array of patterns to
  /// exclude resources, an optional role to provide access to the AWS service
  /// that the resource belongs to, and an optional array of tags used to
  /// identify a set of resources.
  final BackupSelection backupSelection;

  /// Uniquely identifies the body of a request to assign a set of resources to
  /// a backup plan.
  final String selectionId;

  /// Uniquely identifies a backup plan.
  final String backupPlanId;

  /// The date and time a backup selection is created, in Unix format and
  /// Coordinated Universal Time (UTC). The value of `CreationDate` is accurate
  /// to milliseconds. For example, the value 1516925490.087 represents Friday,
  /// January 26, 2018 12:11:30.087 AM.
  final DateTime creationDate;

  /// A unique string that identifies the request and allows failed requests to
  /// be retried without the risk of executing the operation twice.
  final String creatorRequestId;

  GetBackupSelectionOutput({
    this.backupSelection,
    this.selectionId,
    this.backupPlanId,
    this.creationDate,
    this.creatorRequestId,
  });
  static GetBackupSelectionOutput fromJson(Map<String, dynamic> json) =>
      GetBackupSelectionOutput();
}

class GetBackupVaultAccessPolicyOutput {
  /// The name of a logical container where backups are stored. Backup vaults
  /// are identified by names that are unique to the account used to create them
  /// and the Region where they are created. They consist of lowercase letters,
  /// numbers, and hyphens.
  final String backupVaultName;

  /// An Amazon Resource Name (ARN) that uniquely identifies a backup vault; for
  /// example, `arn:aws:backup:us-east-1:123456789012:vault:aBackupVault`.
  final String backupVaultArn;

  /// The backup vault access policy document in JSON format.
  final String policy;

  GetBackupVaultAccessPolicyOutput({
    this.backupVaultName,
    this.backupVaultArn,
    this.policy,
  });
  static GetBackupVaultAccessPolicyOutput fromJson(Map<String, dynamic> json) =>
      GetBackupVaultAccessPolicyOutput();
}

class GetBackupVaultNotificationsOutput {
  /// The name of a logical container where backups are stored. Backup vaults
  /// are identified by names that are unique to the account used to create them
  /// and the Region where they are created. They consist of lowercase letters,
  /// numbers, and hyphens.
  final String backupVaultName;

  /// An Amazon Resource Name (ARN) that uniquely identifies a backup vault; for
  /// example, `arn:aws:backup:us-east-1:123456789012:vault:aBackupVault`.
  final String backupVaultArn;

  /// An ARN that uniquely identifies an Amazon Simple Notification Service
  /// (Amazon SNS) topic; for example,
  /// `arn:aws:sns:us-west-2:111122223333:MyTopic`.
  final String snsTopicArn;

  /// An array of events that indicate the status of jobs to back up resources
  /// to the backup vault.
  final List<String> backupVaultEvents;

  GetBackupVaultNotificationsOutput({
    this.backupVaultName,
    this.backupVaultArn,
    this.snsTopicArn,
    this.backupVaultEvents,
  });
  static GetBackupVaultNotificationsOutput fromJson(
          Map<String, dynamic> json) =>
      GetBackupVaultNotificationsOutput();
}

class GetRecoveryPointRestoreMetadataOutput {
  /// An ARN that uniquely identifies a backup vault; for example,
  /// `arn:aws:backup:us-east-1:123456789012:vault:aBackupVault`.
  final String backupVaultArn;

  /// An ARN that uniquely identifies a recovery point; for example,
  /// `arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45`.
  final String recoveryPointArn;

  /// A set of metadata key-value pairs that lists the metadata key-value pairs
  /// that are required to restore the recovery point.
  final Map<String, String> restoreMetadata;

  GetRecoveryPointRestoreMetadataOutput({
    this.backupVaultArn,
    this.recoveryPointArn,
    this.restoreMetadata,
  });
  static GetRecoveryPointRestoreMetadataOutput fromJson(
          Map<String, dynamic> json) =>
      GetRecoveryPointRestoreMetadataOutput();
}

class GetSupportedResourceTypesOutput {
  /// Contains a string with the supported AWS resource types:
  ///
  /// *    `EBS` for Amazon Elastic Block Store
  ///
  /// *    `SGW` for AWS Storage Gateway
  ///
  /// *    `RDS` for Amazon Relational Database Service
  ///
  /// *    `DDB` for Amazon DynamoDB
  ///
  /// *    `EFS` for Amazon Elastic File System
  final List<String> resourceTypes;

  GetSupportedResourceTypesOutput({
    this.resourceTypes,
  });
  static GetSupportedResourceTypesOutput fromJson(Map<String, dynamic> json) =>
      GetSupportedResourceTypesOutput();
}

/// Contains an array of `Transition` objects specifying how long in days before
/// a recovery point transitions to cold storage or is deleted.
class Lifecycle {
  /// Specifies the number of days after creation that a recovery point is moved
  /// to cold storage.
  final BigInt moveToColdStorageAfterDays;

  /// Specifies the number of days after creation that a recovery point is
  /// deleted. Must be greater than `MoveToColdStorageAfterDays`.
  final BigInt deleteAfterDays;

  Lifecycle({
    this.moveToColdStorageAfterDays,
    this.deleteAfterDays,
  });
  static Lifecycle fromJson(Map<String, dynamic> json) => Lifecycle();
}

class ListBackupJobsOutput {
  /// An array of structures containing metadata about your backup jobs returned
  /// in JSON format.
  final List<BackupJob> backupJobs;

  /// The next item following a partial list of returned items. For example, if
  /// a request is made to return `maxResults` number of items, `NextToken`
  /// allows you to return more items in your list starting at the location
  /// pointed to by the next token.
  final String nextToken;

  ListBackupJobsOutput({
    this.backupJobs,
    this.nextToken,
  });
  static ListBackupJobsOutput fromJson(Map<String, dynamic> json) =>
      ListBackupJobsOutput();
}

class ListBackupPlanTemplatesOutput {
  /// The next item following a partial list of returned items. For example, if
  /// a request is made to return `maxResults` number of items, `NextToken`
  /// allows you to return more items in your list starting at the location
  /// pointed to by the next token.
  final String nextToken;

  /// An array of template list items containing metadata about your saved
  /// templates.
  final List<BackupPlanTemplatesListMember> backupPlanTemplatesList;

  ListBackupPlanTemplatesOutput({
    this.nextToken,
    this.backupPlanTemplatesList,
  });
  static ListBackupPlanTemplatesOutput fromJson(Map<String, dynamic> json) =>
      ListBackupPlanTemplatesOutput();
}

class ListBackupPlanVersionsOutput {
  /// The next item following a partial list of returned items. For example, if
  /// a request is made to return `maxResults` number of items, `NextToken`
  /// allows you to return more items in your list starting at the location
  /// pointed to by the next token.
  final String nextToken;

  /// An array of version list items containing metadata about your backup
  /// plans.
  final List<BackupPlansListMember> backupPlanVersionsList;

  ListBackupPlanVersionsOutput({
    this.nextToken,
    this.backupPlanVersionsList,
  });
  static ListBackupPlanVersionsOutput fromJson(Map<String, dynamic> json) =>
      ListBackupPlanVersionsOutput();
}

class ListBackupPlansOutput {
  /// The next item following a partial list of returned items. For example, if
  /// a request is made to return `maxResults` number of items, `NextToken`
  /// allows you to return more items in your list starting at the location
  /// pointed to by the next token.
  final String nextToken;

  /// An array of backup plan list items containing metadata about your saved
  /// backup plans.
  final List<BackupPlansListMember> backupPlansList;

  ListBackupPlansOutput({
    this.nextToken,
    this.backupPlansList,
  });
  static ListBackupPlansOutput fromJson(Map<String, dynamic> json) =>
      ListBackupPlansOutput();
}

class ListBackupSelectionsOutput {
  /// The next item following a partial list of returned items. For example, if
  /// a request is made to return `maxResults` number of items, `NextToken`
  /// allows you to return more items in your list starting at the location
  /// pointed to by the next token.
  final String nextToken;

  /// An array of backup selection list items containing metadata about each
  /// resource in the list.
  final List<BackupSelectionsListMember> backupSelectionsList;

  ListBackupSelectionsOutput({
    this.nextToken,
    this.backupSelectionsList,
  });
  static ListBackupSelectionsOutput fromJson(Map<String, dynamic> json) =>
      ListBackupSelectionsOutput();
}

class ListBackupVaultsOutput {
  /// An array of backup vault list members containing vault metadata, including
  /// Amazon Resource Name (ARN), display name, creation date, number of saved
  /// recovery points, and encryption information if the resources saved in the
  /// backup vault are encrypted.
  final List<BackupVaultListMember> backupVaultList;

  /// The next item following a partial list of returned items. For example, if
  /// a request is made to return `maxResults` number of items, `NextToken`
  /// allows you to return more items in your list starting at the location
  /// pointed to by the next token.
  final String nextToken;

  ListBackupVaultsOutput({
    this.backupVaultList,
    this.nextToken,
  });
  static ListBackupVaultsOutput fromJson(Map<String, dynamic> json) =>
      ListBackupVaultsOutput();
}

class ListProtectedResourcesOutput {
  /// An array of resources successfully backed up by AWS Backup including the
  /// time the resource was saved, an Amazon Resource Name (ARN) of the
  /// resource, and a resource type.
  final List<ProtectedResource> results;

  /// The next item following a partial list of returned items. For example, if
  /// a request is made to return `maxResults` number of items, `NextToken`
  /// allows you to return more items in your list starting at the location
  /// pointed to by the next token.
  final String nextToken;

  ListProtectedResourcesOutput({
    this.results,
    this.nextToken,
  });
  static ListProtectedResourcesOutput fromJson(Map<String, dynamic> json) =>
      ListProtectedResourcesOutput();
}

class ListRecoveryPointsByBackupVaultOutput {
  /// The next item following a partial list of returned items. For example, if
  /// a request is made to return `maxResults` number of items, `NextToken`
  /// allows you to return more items in your list starting at the location
  /// pointed to by the next token.
  final String nextToken;

  /// An array of objects that contain detailed information about recovery
  /// points saved in a backup vault.
  final List<RecoveryPointByBackupVault> recoveryPoints;

  ListRecoveryPointsByBackupVaultOutput({
    this.nextToken,
    this.recoveryPoints,
  });
  static ListRecoveryPointsByBackupVaultOutput fromJson(
          Map<String, dynamic> json) =>
      ListRecoveryPointsByBackupVaultOutput();
}

class ListRecoveryPointsByResourceOutput {
  /// The next item following a partial list of returned items. For example, if
  /// a request is made to return `maxResults` number of items, `NextToken`
  /// allows you to return more items in your list starting at the location
  /// pointed to by the next token.
  final String nextToken;

  /// An array of objects that contain detailed information about recovery
  /// points of the specified resource type.
  final List<RecoveryPointByResource> recoveryPoints;

  ListRecoveryPointsByResourceOutput({
    this.nextToken,
    this.recoveryPoints,
  });
  static ListRecoveryPointsByResourceOutput fromJson(
          Map<String, dynamic> json) =>
      ListRecoveryPointsByResourceOutput();
}

class ListRestoreJobsOutput {
  /// An array of objects that contain detailed information about jobs to
  /// restore saved resources.
  final List<RestoreJobsListMember> restoreJobs;

  /// The next item following a partial list of returned items. For example, if
  /// a request is made to return `maxResults` number of items, `NextToken`
  /// allows you to return more items in your list starting at the location
  /// pointed to by the next token.
  final String nextToken;

  ListRestoreJobsOutput({
    this.restoreJobs,
    this.nextToken,
  });
  static ListRestoreJobsOutput fromJson(Map<String, dynamic> json) =>
      ListRestoreJobsOutput();
}

class ListTagsOutput {
  /// The next item following a partial list of returned items. For example, if
  /// a request is made to return `maxResults` number of items, `NextToken`
  /// allows you to return more items in your list starting at the location
  /// pointed to by the next token.
  final String nextToken;

  /// To help organize your resources, you can assign your own metadata to the
  /// resources you create. Each tag is a key-value pair.
  final Map<String, String> tags;

  ListTagsOutput({
    this.nextToken,
    this.tags,
  });
  static ListTagsOutput fromJson(Map<String, dynamic> json) => ListTagsOutput();
}

/// A structure that contains information about a backed-up resource.
class ProtectedResource {
  /// An Amazon Resource Name (ARN) that uniquely identifies a resource. The
  /// format of the ARN depends on the resource type.
  final String resourceArn;

  /// The type of AWS resource; for example, an Amazon Elastic Block Store
  /// (Amazon EBS) volume or an Amazon Relational Database Service (Amazon RDS)
  /// database.
  final String resourceType;

  /// The date and time a resource was last backed up, in Unix format and
  /// Coordinated Universal Time (UTC). The value of `LastBackupTime` is
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime lastBackupTime;

  ProtectedResource({
    this.resourceArn,
    this.resourceType,
    this.lastBackupTime,
  });
  static ProtectedResource fromJson(Map<String, dynamic> json) =>
      ProtectedResource();
}

/// Contains detailed information about the recovery points stored in a backup
/// vault.
class RecoveryPointByBackupVault {
  /// An Amazon Resource Name (ARN) that uniquely identifies a recovery point;
  /// for example,
  /// `arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45`.
  final String recoveryPointArn;

  /// The name of a logical container where backups are stored. Backup vaults
  /// are identified by names that are unique to the account used to create them
  /// and the AWS Region where they are created. They consist of lowercase
  /// letters, numbers, and hyphens.
  final String backupVaultName;

  /// An ARN that uniquely identifies a backup vault; for example,
  /// `arn:aws:backup:us-east-1:123456789012:vault:aBackupVault`.
  final String backupVaultArn;

  /// An ARN that uniquely identifies a resource. The format of the ARN depends
  /// on the resource type.
  final String resourceArn;

  /// The type of AWS resource saved as a recovery point; for example, an Amazon
  /// Elastic Block Store (Amazon EBS) volume or an Amazon Relational Database
  /// Service (Amazon RDS) database.
  final String resourceType;

  /// Contains identifying information about the creation of a recovery point,
  /// including the `BackupPlanArn`, `BackupPlanId`, `BackupPlanVersion`, and
  /// `BackupRuleId` of the backup plan that is used to create it.
  final RecoveryPointCreator createdBy;

  /// Specifies the IAM role ARN used to create the target recovery point; for
  /// example, `arn:aws:iam::123456789012:role/S3Access`.
  final String iamRoleArn;

  /// A status code specifying the state of the recovery point.
  final String status;

  /// The date and time a recovery point is created, in Unix format and
  /// Coordinated Universal Time (UTC). The value of `CreationDate` is accurate
  /// to milliseconds. For example, the value 1516925490.087 represents Friday,
  /// January 26, 2018 12:11:30.087 AM.
  final DateTime creationDate;

  /// The date and time a job to restore a recovery point is completed, in Unix
  /// format and Coordinated Universal Time (UTC). The value of `CompletionDate`
  /// is accurate to milliseconds. For example, the value 1516925490.087
  /// represents Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime completionDate;

  /// The size, in bytes, of a backup.
  final BigInt backupSizeInBytes;

  /// A `CalculatedLifecycle` object containing `DeleteAt` and
  /// `MoveToColdStorageAt` timestamps.
  final CalculatedLifecycle calculatedLifecycle;

  /// The lifecycle defines when a protected resource is transitioned to cold
  /// storage and when it expires. AWS Backup transitions and expires backups
  /// automatically according to the lifecycle that you define.
  ///
  /// Backups transitioned to cold storage must be stored in cold storage for a
  /// minimum of 90 days. Therefore, the “expire after days” setting must be 90
  /// days greater than the “transition to cold after days” setting. The
  /// “transition to cold after days” setting cannot be changed after a backup
  /// has been transitioned to cold.
  final Lifecycle lifecycle;

  /// The server-side encryption key that is used to protect your backups; for
  /// example,
  /// `arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab`.
  final String encryptionKeyArn;

  /// A Boolean value that is returned as `TRUE` if the specified recovery point
  /// is encrypted, or `FALSE` if the recovery point is not encrypted.
  final bool isEncrypted;

  /// The date and time a recovery point was last restored, in Unix format and
  /// Coordinated Universal Time (UTC). The value of `LastRestoreTime` is
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime lastRestoreTime;

  RecoveryPointByBackupVault({
    this.recoveryPointArn,
    this.backupVaultName,
    this.backupVaultArn,
    this.resourceArn,
    this.resourceType,
    this.createdBy,
    this.iamRoleArn,
    this.status,
    this.creationDate,
    this.completionDate,
    this.backupSizeInBytes,
    this.calculatedLifecycle,
    this.lifecycle,
    this.encryptionKeyArn,
    this.isEncrypted,
    this.lastRestoreTime,
  });
  static RecoveryPointByBackupVault fromJson(Map<String, dynamic> json) =>
      RecoveryPointByBackupVault();
}

/// Contains detailed information about a saved recovery point.
class RecoveryPointByResource {
  /// An Amazon Resource Name (ARN) that uniquely identifies a recovery point;
  /// for example,
  /// `arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45`.
  final String recoveryPointArn;

  /// The date and time a recovery point is created, in Unix format and
  /// Coordinated Universal Time (UTC). The value of `CreationDate` is accurate
  /// to milliseconds. For example, the value 1516925490.087 represents Friday,
  /// January 26, 2018 12:11:30.087 AM.
  final DateTime creationDate;

  /// A status code specifying the state of the recovery point.
  final String status;

  /// The server-side encryption key that is used to protect your backups; for
  /// example,
  /// `arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab`.
  final String encryptionKeyArn;

  /// The size, in bytes, of a backup.
  final BigInt backupSizeBytes;

  /// The name of a logical container where backups are stored. Backup vaults
  /// are identified by names that are unique to the account used to create them
  /// and the AWS Region where they are created. They consist of lowercase
  /// letters, numbers, and hyphens.
  final String backupVaultName;

  RecoveryPointByResource({
    this.recoveryPointArn,
    this.creationDate,
    this.status,
    this.encryptionKeyArn,
    this.backupSizeBytes,
    this.backupVaultName,
  });
  static RecoveryPointByResource fromJson(Map<String, dynamic> json) =>
      RecoveryPointByResource();
}

/// Contains information about the backup plan and rule that AWS Backup used to
/// initiate the recovery point backup.
class RecoveryPointCreator {
  /// Uniquely identifies a backup plan.
  final String backupPlanId;

  /// An Amazon Resource Name (ARN) that uniquely identifies a backup plan; for
  /// example,
  /// `arn:aws:backup:us-east-1:123456789012:plan:8F81F553-3A74-4A3F-B93D-B3360DC80C50`.
  final String backupPlanArn;

  /// Version IDs are unique, randomly generated, Unicode, UTF-8 encoded strings
  /// that are at most 1,024 bytes long. They cannot be edited.
  final String backupPlanVersion;

  /// Uniquely identifies a rule used to schedule the backup of a selection of
  /// resources.
  final String backupRuleId;

  RecoveryPointCreator({
    this.backupPlanId,
    this.backupPlanArn,
    this.backupPlanVersion,
    this.backupRuleId,
  });
  static RecoveryPointCreator fromJson(Map<String, dynamic> json) =>
      RecoveryPointCreator();
}

/// Contains metadata about a restore job.
class RestoreJobsListMember {
  /// Uniquely identifies the job that restores a recovery point.
  final String restoreJobId;

  /// An ARN that uniquely identifies a recovery point; for example,
  /// `arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45`.
  final String recoveryPointArn;

  /// The date and time a restore job is created, in Unix format and Coordinated
  /// Universal Time (UTC). The value of `CreationDate` is accurate to
  /// milliseconds. For example, the value 1516925490.087 represents Friday,
  /// January 26, 2018 12:11:30.087 AM.
  final DateTime creationDate;

  /// The date and time a job to restore a recovery point is completed, in Unix
  /// format and Coordinated Universal Time (UTC). The value of `CompletionDate`
  /// is accurate to milliseconds. For example, the value 1516925490.087
  /// represents Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime completionDate;

  /// A status code specifying the state of the job initiated by AWS Backup to
  /// restore a recovery point.
  final String status;

  /// A detailed message explaining the status of the job to restore a recovery
  /// point.
  final String statusMessage;

  /// Contains an estimated percentage complete of a job at the time the job
  /// status was queried.
  final String percentDone;

  /// The size, in bytes, of the restored resource.
  final BigInt backupSizeInBytes;

  /// Specifies the IAM role ARN used to create the target recovery point; for
  /// example, `arn:aws:iam::123456789012:role/S3Access`.
  final String iamRoleArn;

  /// The amount of time in minutes that a job restoring a recovery point is
  /// expected to take.
  final BigInt expectedCompletionTimeMinutes;

  /// An Amazon Resource Name (ARN) that uniquely identifies a resource. The
  /// format of the ARN depends on the resource type.
  final String createdResourceArn;

  RestoreJobsListMember({
    this.restoreJobId,
    this.recoveryPointArn,
    this.creationDate,
    this.completionDate,
    this.status,
    this.statusMessage,
    this.percentDone,
    this.backupSizeInBytes,
    this.iamRoleArn,
    this.expectedCompletionTimeMinutes,
    this.createdResourceArn,
  });
  static RestoreJobsListMember fromJson(Map<String, dynamic> json) =>
      RestoreJobsListMember();
}

class StartBackupJobOutput {
  /// Uniquely identifies a request to AWS Backup to back up a resource.
  final String backupJobId;

  /// An ARN that uniquely identifies a recovery point; for example,
  /// `arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45`.
  final String recoveryPointArn;

  /// The date and time that a backup job is started, in Unix format and
  /// Coordinated Universal Time (UTC). The value of `CreationDate` is accurate
  /// to milliseconds. For example, the value 1516925490.087 represents Friday,
  /// January 26, 2018 12:11:30.087 AM.
  final DateTime creationDate;

  StartBackupJobOutput({
    this.backupJobId,
    this.recoveryPointArn,
    this.creationDate,
  });
  static StartBackupJobOutput fromJson(Map<String, dynamic> json) =>
      StartBackupJobOutput();
}

class StartRestoreJobOutput {
  /// Uniquely identifies the job that restores a recovery point.
  final String restoreJobId;

  StartRestoreJobOutput({
    this.restoreJobId,
  });
  static StartRestoreJobOutput fromJson(Map<String, dynamic> json) =>
      StartRestoreJobOutput();
}

class UpdateBackupPlanOutput {
  /// Uniquely identifies a backup plan.
  final String backupPlanId;

  /// An Amazon Resource Name (ARN) that uniquely identifies a backup plan; for
  /// example,
  /// `arn:aws:backup:us-east-1:123456789012:plan:8F81F553-3A74-4A3F-B93D-B3360DC80C50`.
  final String backupPlanArn;

  /// The date and time a backup plan is updated, in Unix format and Coordinated
  /// Universal Time (UTC). The value of `CreationDate` is accurate to
  /// milliseconds. For example, the value 1516925490.087 represents Friday,
  /// January 26, 2018 12:11:30.087 AM.
  final DateTime creationDate;

  /// Unique, randomly generated, Unicode, UTF-8 encoded strings that are at
  /// most 1,024 bytes long. Version Ids cannot be edited.
  final String versionId;

  UpdateBackupPlanOutput({
    this.backupPlanId,
    this.backupPlanArn,
    this.creationDate,
    this.versionId,
  });
  static UpdateBackupPlanOutput fromJson(Map<String, dynamic> json) =>
      UpdateBackupPlanOutput();
}

class UpdateRecoveryPointLifecycleOutput {
  /// An ARN that uniquely identifies a backup vault; for example,
  /// `arn:aws:backup:us-east-1:123456789012:vault:aBackupVault`.
  final String backupVaultArn;

  /// An Amazon Resource Name (ARN) that uniquely identifies a recovery point;
  /// for example,
  /// `arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45`.
  final String recoveryPointArn;

  /// The lifecycle defines when a protected resource is transitioned to cold
  /// storage and when it expires. AWS Backup transitions and expires backups
  /// automatically according to the lifecycle that you define.
  ///
  /// Backups transitioned to cold storage must be stored in cold storage for a
  /// minimum of 90 days. Therefore, the “expire after days” setting must be 90
  /// days greater than the “transition to cold after days” setting. The
  /// “transition to cold after days” setting cannot be changed after a backup
  /// has been transitioned to cold.
  final Lifecycle lifecycle;

  /// A `CalculatedLifecycle` object containing `DeleteAt` and
  /// `MoveToColdStorageAt` timestamps.
  final CalculatedLifecycle calculatedLifecycle;

  UpdateRecoveryPointLifecycleOutput({
    this.backupVaultArn,
    this.recoveryPointArn,
    this.lifecycle,
    this.calculatedLifecycle,
  });
  static UpdateRecoveryPointLifecycleOutput fromJson(
          Map<String, dynamic> json) =>
      UpdateRecoveryPointLifecycleOutput();
}
