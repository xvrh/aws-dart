import 'package:meta/meta.dart';

/// AWS Systems Manager
///
/// AWS Systems Manager is a collection of capabilities that helps you automate
/// management tasks such as collecting system inventory, applying operating
/// system (OS) patches, automating the creation of Amazon Machine Images
/// (AMIs), and configuring operating systems (OSs) and applications at scale.
/// Systems Manager lets you remotely and securely manage the configuration of
/// your managed instances. A _managed instance_ is any Amazon EC2 instance or
/// on-premises machine in your hybrid environment that has been configured for
/// Systems Manager.
///
/// This reference is intended to be used with the [AWS Systems Manager User
/// Guide](http://docs.aws.amazon.com/systems-manager/latest/userguide/).
///
/// To get started, verify prerequisites and configure managed instances. For
/// more information, see [Setting Up AWS Systems
/// Manager](http://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-setting-up.html)
/// in the _AWS Systems Manager User Guide_.
///
/// For information about other API actions you can perform on Amazon EC2
/// instances, see the [Amazon EC2 API
/// Reference](http://docs.aws.amazon.com/AWSEC2/latest/APIReference/). For
/// information about how to use a Query API, see [Making API
/// Requests](http://docs.aws.amazon.com/AWSEC2/latest/APIReference/making-api-requests.html).
class SsmApi {
  /// Adds or overwrites one or more tags for the specified resource. Tags are
  /// metadata that you can assign to your documents, managed instances,
  /// maintenance windows, Parameter Store parameters, and patch baselines. Tags
  /// enable you to categorize your resources in different ways, for example, by
  /// purpose, owner, or environment. Each tag consists of a key and an optional
  /// value, both of which you define. For example, you could define a set of
  /// tags for your account's managed instances that helps you track each
  /// instance's owner and stack level. For example: Key=Owner and
  /// Value=DbAdmin, SysAdmin, or Dev. Or Key=Stack and Value=Production,
  /// Pre-Production, or Test.
  ///
  /// Each resource can have a maximum of 50 tags.
  ///
  /// We recommend that you devise a set of tag keys that meets your needs for
  /// each resource type. Using a consistent set of tag keys makes it easier for
  /// you to manage your resources. You can search and filter the resources
  /// based on the tags you add. Tags don't have any semantic meaning to Amazon
  /// EC2 and are interpreted strictly as a string of characters.
  ///
  /// For more information about tags, see [Tagging Your Amazon EC2
  /// Resources](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html)
  /// in the _Amazon EC2 User Guide_.
  Future<void> addTagsToResource(
      {@required String resourceType,
      @required String resourceId,
      @required List<Tag> tags}) async {}

  /// Attempts to cancel the command specified by the Command ID. There is no
  /// guarantee that the command will be terminated and the underlying process
  /// stopped.
  Future<void> cancelCommand(String commandId,
      {List<String> instanceIds}) async {}

  /// Stops a maintenance window execution that is already in progress and
  /// cancels any tasks in the window that have not already starting running.
  /// (Tasks already in progress will continue to completion.)
  Future<void> cancelMaintenanceWindowExecution(
      String windowExecutionId) async {}

  /// Registers your on-premises server or virtual machine with Amazon EC2 so
  /// that you can manage these resources using Run Command. An on-premises
  /// server or virtual machine that has been registered with EC2 is called a
  /// managed instance. For more information about activations, see [Setting Up
  /// AWS Systems Manager for Hybrid
  /// Environments](http://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-managedinstances.html).
  Future<void> createActivation(String iamRole,
      {String description,
      String defaultInstanceName,
      int registrationLimit,
      DateTime expirationDate,
      List<Tag> tags}) async {}

  /// Associates the specified Systems Manager document with the specified
  /// instances or targets.
  ///
  /// When you associate a document with one or more instances using instance
  /// IDs or tags, SSM Agent running on the instance processes the document and
  /// configures the instance as specified.
  ///
  /// If you associate a document with an instance that already has an
  /// associated document, the system returns the AssociationAlreadyExists
  /// exception.
  Future<void> createAssociation(String name,
      {String documentVersion,
      String instanceId,
      Map<String, List<String>> parameters,
      List<Target> targets,
      String scheduleExpression,
      InstanceAssociationOutputLocation outputLocation,
      String associationName,
      String automationTargetParameterName,
      String maxErrors,
      String maxConcurrency,
      String complianceSeverity}) async {}

  /// Associates the specified Systems Manager document with the specified
  /// instances or targets.
  ///
  /// When you associate a document with one or more instances using instance
  /// IDs or tags, SSM Agent running on the instance processes the document and
  /// configures the instance as specified.
  ///
  /// If you associate a document with an instance that already has an
  /// associated document, the system returns the AssociationAlreadyExists
  /// exception.
  Future<void> createAssociationBatch(
      List<CreateAssociationBatchRequestEntry> entries) async {}

  /// Creates a Systems Manager document.
  ///
  /// After you create a document, you can use CreateAssociation to associate it
  /// with one or more running instances.
  Future<void> createDocument(
      {@required String content,
      List<AttachmentsSource> attachments,
      @required String name,
      String versionName,
      String documentType,
      String documentFormat,
      String targetType,
      List<Tag> tags}) async {}

  /// Creates a new maintenance window.
  Future<void> createMaintenanceWindow(
      {@required String name,
      String description,
      String startDate,
      String endDate,
      @required String schedule,
      String scheduleTimezone,
      @required int duration,
      @required int cutoff,
      @required bool allowUnassociatedTargets,
      String clientToken,
      List<Tag> tags}) async {}

  /// Creates a new OpsItem. You must have permission in AWS Identity and Access
  /// Management (IAM) to create a new OpsItem. For more information, see
  /// [Getting Started with
  /// OpsCenter](http://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-getting-started.html)
  /// in the _AWS Systems Manager User Guide_.
  ///
  /// Operations engineers and IT professionals use OpsCenter to view,
  /// investigate, and remediate operational issues impacting the performance
  /// and health of their AWS resources. For more information, see [AWS Systems
  /// Manager
  /// OpsCenter](http://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html)
  /// in the _AWS Systems Manager User Guide_.
  Future<void> createOpsItem(
      {@required String description,
      Map<String, OpsItemDataValue> operationalData,
      List<OpsItemNotification> notifications,
      int priority,
      List<RelatedOpsItem> relatedOpsItems,
      @required String source,
      @required String title,
      List<Tag> tags}) async {}

  /// Creates a patch baseline.
  ///
  ///
  ///
  /// For information about valid key and value pairs in `PatchFilters` for each
  /// supported operating system type, see
  /// [PatchFilter](http://docs.aws.amazon.com/systems-manager/latest/APIReference/API_PatchFilter.html).
  Future<void> createPatchBaseline(String name,
      {String operatingSystem,
      PatchFilterGroup globalFilters,
      PatchRuleGroup approvalRules,
      List<String> approvedPatches,
      String approvedPatchesComplianceLevel,
      bool approvedPatchesEnableNonSecurity,
      List<String> rejectedPatches,
      String rejectedPatchesAction,
      String description,
      List<PatchSource> sources,
      String clientToken,
      List<Tag> tags}) async {}

  /// Creates a resource data sync configuration to a single bucket in Amazon
  /// S3. This is an asynchronous operation that returns immediately. After a
  /// successful initial sync is completed, the system continuously syncs data
  /// to the Amazon S3 bucket. To check the status of the sync, use the
  /// ListResourceDataSync.
  ///
  /// By default, data is not encrypted in Amazon S3. We strongly recommend that
  /// you enable encryption in Amazon S3 to ensure secure data storage. We also
  /// recommend that you secure access to the Amazon S3 bucket by creating a
  /// restrictive bucket policy. For more information, see [Configuring Resource
  /// Data Sync for
  /// Inventory](http://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-inventory-datasync.html)
  /// in the _AWS Systems Manager User Guide_.
  Future<void> createResourceDataSync(
      {@required String syncName,
      @required ResourceDataSyncS3Destination s3Destination}) async {}

  /// Deletes an activation. You are not required to delete an activation. If
  /// you delete an activation, you can no longer use it to register additional
  /// managed instances. Deleting an activation does not de-register managed
  /// instances. You must manually de-register managed instances.
  Future<void> deleteActivation(String activationId) async {}

  /// Disassociates the specified Systems Manager document from the specified
  /// instance.
  ///
  /// When you disassociate a document from an instance, it does not change the
  /// configuration of the instance. To change the configuration state of an
  /// instance after you disassociate a document, you must create a new document
  /// with the desired configuration and associate it with the instance.
  Future<void> deleteAssociation(
      {String name, String instanceId, String associationId}) async {}

  /// Deletes the Systems Manager document and all instance associations to the
  /// document.
  ///
  /// Before you delete the document, we recommend that you use
  /// DeleteAssociation to disassociate all instances that are associated with
  /// the document.
  Future<void> deleteDocument(String name,
      {String documentVersion, String versionName}) async {}

  /// Delete a custom inventory type, or the data associated with a custom
  /// Inventory type. Deleting a custom inventory type is also referred to as
  /// deleting a custom inventory schema.
  Future<void> deleteInventory(String typeName,
      {String schemaDeleteOption, bool dryRun, String clientToken}) async {}

  /// Deletes a maintenance window.
  Future<void> deleteMaintenanceWindow(String windowId) async {}

  /// Delete a parameter from the system.
  Future<void> deleteParameter(String name) async {}

  /// Delete a list of parameters.
  Future<void> deleteParameters(List<String> names) async {}

  /// Deletes a patch baseline.
  Future<void> deletePatchBaseline(String baselineId) async {}

  /// Deletes a Resource Data Sync configuration. After the configuration is
  /// deleted, changes to inventory data on managed instances are no longer
  /// synced with the target Amazon S3 bucket. Deleting a sync configuration
  /// does not delete data in the target Amazon S3 bucket.
  Future<void> deleteResourceDataSync(String syncName) async {}

  /// Removes the server or virtual machine from the list of registered servers.
  /// You can reregister the instance again at any time. If you don't plan to
  /// use Run Command on the server, we suggest uninstalling SSM Agent first.
  Future<void> deregisterManagedInstance(String instanceId) async {}

  /// Removes a patch group from a patch baseline.
  Future<void> deregisterPatchBaselineForPatchGroup(
      {@required String baselineId, @required String patchGroup}) async {}

  /// Removes a target from a maintenance window.
  Future<void> deregisterTargetFromMaintenanceWindow(
      {@required String windowId,
      @required String windowTargetId,
      bool safe}) async {}

  /// Removes a task from a maintenance window.
  Future<void> deregisterTaskFromMaintenanceWindow(
      {@required String windowId, @required String windowTaskId}) async {}

  /// Describes details about the activation, such as the date and time the
  /// activation was created, its expiration date, the IAM role assigned to the
  /// instances in the activation, and the number of instances registered by
  /// using this activation.
  Future<void> describeActivations(
      {List<DescribeActivationsFilter> filters,
      int maxResults,
      String nextToken}) async {}

  /// Describes the association for the specified target or instance. If you
  /// created the association by using the `Targets` parameter, then you must
  /// retrieve the association by using the association ID. If you created the
  /// association by specifying an instance ID and a Systems Manager document,
  /// then you retrieve the association by specifying the document name and the
  /// instance ID.
  Future<void> describeAssociation(
      {String name,
      String instanceId,
      String associationId,
      String associationVersion}) async {}

  /// Use this API action to view information about a specific execution of a
  /// specific association.
  Future<void> describeAssociationExecutionTargets(
      {@required String associationId,
      @required String executionId,
      List<AssociationExecutionTargetsFilter> filters,
      int maxResults,
      String nextToken}) async {}

  /// Use this API action to view all executions for a specific association ID.
  Future<void> describeAssociationExecutions(String associationId,
      {List<AssociationExecutionFilter> filters,
      int maxResults,
      String nextToken}) async {}

  /// Provides details about all active and terminated Automation executions.
  Future<void> describeAutomationExecutions(
      {List<AutomationExecutionFilter> filters,
      int maxResults,
      String nextToken}) async {}

  /// Information about all active and terminated step executions in an
  /// Automation workflow.
  Future<void> describeAutomationStepExecutions(String automationExecutionId,
      {List<StepExecutionFilter> filters,
      String nextToken,
      int maxResults,
      bool reverseOrder}) async {}

  /// Lists all patches eligible to be included in a patch baseline.
  Future<void> describeAvailablePatches(
      {List<PatchOrchestratorFilter> filters,
      int maxResults,
      String nextToken}) async {}

  /// Describes the specified Systems Manager document.
  Future<void> describeDocument(String name,
      {String documentVersion, String versionName}) async {}

  /// Describes the permissions for a Systems Manager document. If you created
  /// the document, you are the owner. If a document is shared, it can either be
  /// shared privately (by specifying a user's AWS account ID) or publicly
  /// (_All_).
  Future<void> describeDocumentPermission(
      {@required String name, @required String permissionType}) async {}

  /// All associations for the instance(s).
  Future<void> describeEffectiveInstanceAssociations(String instanceId,
      {int maxResults, String nextToken}) async {}

  /// Retrieves the current effective patches (the patch and the approval state)
  /// for the specified patch baseline. Note that this API applies only to
  /// Windows patch baselines.
  Future<void> describeEffectivePatchesForPatchBaseline(String baselineId,
      {int maxResults, String nextToken}) async {}

  /// The status of the associations for the instance(s).
  Future<void> describeInstanceAssociationsStatus(String instanceId,
      {int maxResults, String nextToken}) async {}

  /// Describes one or more of your instances. You can use this to get
  /// information about instances like the operating system platform, the SSM
  /// Agent version (Linux), status etc. If you specify one or more instance
  /// IDs, it returns information for those instances. If you do not specify
  /// instance IDs, it returns information for all your instances. If you
  /// specify an instance ID that is not valid or an instance that you do not
  /// own, you receive an error.
  ///
  ///
  ///
  /// The IamRole field for this API action is the Amazon Identity and Access
  /// Management (IAM) role assigned to on-premises instances. This call does
  /// not return the IAM role for Amazon EC2 instances.
  Future<void> describeInstanceInformation(
      {List<InstanceInformationFilter> instanceInformationFilterList,
      List<InstanceInformationStringFilter> filters,
      int maxResults,
      String nextToken}) async {}

  /// Retrieves the high-level patch state of one or more instances.
  Future<void> describeInstancePatchStates(List<String> instanceIds,
      {String nextToken, int maxResults}) async {}

  /// Retrieves the high-level patch state for the instances in the specified
  /// patch group.
  Future<void> describeInstancePatchStatesForPatchGroup(String patchGroup,
      {List<InstancePatchStateFilter> filters,
      String nextToken,
      int maxResults}) async {}

  /// Retrieves information about the patches on the specified instance and
  /// their state relative to the patch baseline being used for the instance.
  Future<void> describeInstancePatches(String instanceId,
      {List<PatchOrchestratorFilter> filters,
      String nextToken,
      int maxResults}) async {}

  /// Describes a specific delete inventory operation.
  Future<void> describeInventoryDeletions(
      {String deletionId, String nextToken, int maxResults}) async {}

  /// Retrieves the individual task executions (one per target) for a particular
  /// task run as part of a maintenance window execution.
  Future<void> describeMaintenanceWindowExecutionTaskInvocations(
      {@required String windowExecutionId,
      @required String taskId,
      List<MaintenanceWindowFilter> filters,
      int maxResults,
      String nextToken}) async {}

  /// For a given maintenance window execution, lists the tasks that were run.
  Future<void> describeMaintenanceWindowExecutionTasks(String windowExecutionId,
      {List<MaintenanceWindowFilter> filters,
      int maxResults,
      String nextToken}) async {}

  /// Lists the executions of a maintenance window. This includes information
  /// about when the maintenance window was scheduled to be active, and
  /// information about tasks registered and run with the maintenance window.
  Future<void> describeMaintenanceWindowExecutions(String windowId,
      {List<MaintenanceWindowFilter> filters,
      int maxResults,
      String nextToken}) async {}

  /// Retrieves information about upcoming executions of a maintenance window.
  Future<void> describeMaintenanceWindowSchedule(
      {String windowId,
      List<Target> targets,
      String resourceType,
      List<PatchOrchestratorFilter> filters,
      int maxResults,
      String nextToken}) async {}

  /// Lists the targets registered with the maintenance window.
  Future<void> describeMaintenanceWindowTargets(String windowId,
      {List<MaintenanceWindowFilter> filters,
      int maxResults,
      String nextToken}) async {}

  /// Lists the tasks in a maintenance window.
  Future<void> describeMaintenanceWindowTasks(String windowId,
      {List<MaintenanceWindowFilter> filters,
      int maxResults,
      String nextToken}) async {}

  /// Retrieves the maintenance windows in an AWS account.
  Future<void> describeMaintenanceWindows(
      {List<MaintenanceWindowFilter> filters,
      int maxResults,
      String nextToken}) async {}

  /// Retrieves information about the maintenance window targets or tasks that
  /// an instance is associated with.
  Future<void> describeMaintenanceWindowsForTarget(
      {@required List<Target> targets,
      @required String resourceType,
      int maxResults,
      String nextToken}) async {}

  /// Query a set of OpsItems. You must have permission in AWS Identity and
  /// Access Management (IAM) to query a list of OpsItems. For more information,
  /// see [Getting Started with
  /// OpsCenter](http://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-getting-started.html)
  /// in the _AWS Systems Manager User Guide_.
  ///
  /// Operations engineers and IT professionals use OpsCenter to view,
  /// investigate, and remediate operational issues impacting the performance
  /// and health of their AWS resources. For more information, see [AWS Systems
  /// Manager
  /// OpsCenter](http://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html)
  /// in the _AWS Systems Manager User Guide_.
  Future<void> describeOpsItems(
      {List<OpsItemFilter> opsItemFilters,
      int maxResults,
      String nextToken}) async {}

  /// Get information about a parameter.
  ///
  /// Request results are returned on a best-effort basis. If you specify
  /// `MaxResults` in the request, the response includes information up to the
  /// limit specified. The number of items returned, however, can be between
  /// zero and the value of `MaxResults`. If the service reaches an internal
  /// limit while processing the results, it stops the operation and returns the
  /// matching values up to that point and a `NextToken`. You can specify the
  /// `NextToken` in a subsequent call to get the next set of results.
  Future<void> describeParameters(
      {List<ParametersFilter> filters,
      List<ParameterStringFilter> parameterFilters,
      int maxResults,
      String nextToken}) async {}

  /// Lists the patch baselines in your AWS account.
  Future<void> describePatchBaselines(
      {List<PatchOrchestratorFilter> filters,
      int maxResults,
      String nextToken}) async {}

  /// Returns high-level aggregated patch compliance state for a patch group.
  Future<void> describePatchGroupState(String patchGroup) async {}

  /// Lists all patch groups that have been registered with patch baselines.
  Future<void> describePatchGroups(
      {int maxResults,
      List<PatchOrchestratorFilter> filters,
      String nextToken}) async {}

  /// Lists the properties of available patches organized by product, product
  /// family, classification, severity, and other properties of available
  /// patches. You can use the reported properties in the filters you specify in
  /// requests for actions such as CreatePatchBaseline, UpdatePatchBaseline,
  /// DescribeAvailablePatches, and DescribePatchBaselines.
  ///
  /// The following section lists the properties that can be used in filters for
  /// each major operating system type:
  ///
  /// WINDOWS
  ///
  /// Valid properties: PRODUCT, PRODUCT\_FAMILY, CLASSIFICATION, MSRC\_SEVERITY
  ///
  /// AMAZON_LINUX
  ///
  /// Valid properties: PRODUCT, CLASSIFICATION, SEVERITY
  ///
  /// AMAZON\_LINUX\_2
  ///
  /// Valid properties: PRODUCT, CLASSIFICATION, SEVERITY
  ///
  /// UBUNTU
  ///
  /// Valid properties: PRODUCT, PRIORITY
  ///
  /// REDHAT\_ENTERPRISE\_LINUX
  ///
  /// Valid properties: PRODUCT, CLASSIFICATION, SEVERITY
  ///
  /// SUSE
  ///
  /// Valid properties: PRODUCT, CLASSIFICATION, SEVERITY
  ///
  /// CENTOS
  ///
  /// Valid properties: PRODUCT, CLASSIFICATION, SEVERITY
  Future<void> describePatchProperties(
      {@required String operatingSystem,
      @required String property,
      String patchSet,
      int maxResults,
      String nextToken}) async {}

  /// Retrieves a list of all active sessions (both connected and disconnected)
  /// or terminated sessions from the past 30 days.
  Future<void> describeSessions(String state,
      {int maxResults, String nextToken, List<SessionFilter> filters}) async {}

  /// Get detailed information about a particular Automation execution.
  Future<void> getAutomationExecution(String automationExecutionId) async {}

  /// Returns detailed information about command execution for an invocation or
  /// plugin.
  Future<void> getCommandInvocation(
      {@required String commandId,
      @required String instanceId,
      String pluginName}) async {}

  /// Retrieves the Session Manager connection status for an instance to
  /// determine whether it is connected and ready to receive Session Manager
  /// connections.
  Future<void> getConnectionStatus(String target) async {}

  /// Retrieves the default patch baseline. Note that Systems Manager supports
  /// creating multiple default patch baselines. For example, you can create a
  /// default patch baseline for each operating system.
  ///
  /// If you do not specify an operating system value, the default patch
  /// baseline for Windows is returned.
  Future<void> getDefaultPatchBaseline({String operatingSystem}) async {}

  /// Retrieves the current snapshot for the patch baseline the instance uses.
  /// This API is primarily used by the AWS-RunPatchBaseline Systems Manager
  /// document.
  Future<void> getDeployablePatchSnapshotForInstance(
      {@required String instanceId, @required String snapshotId}) async {}

  /// Gets the contents of the specified Systems Manager document.
  Future<void> getDocument(String name,
      {String versionName,
      String documentVersion,
      String documentFormat}) async {}

  /// Query inventory information.
  Future<void> getInventory(
      {List<InventoryFilter> filters,
      List<InventoryAggregator> aggregators,
      List<ResultAttribute> resultAttributes,
      String nextToken,
      int maxResults}) async {}

  /// Return a list of inventory type names for the account, or return a list of
  /// attribute names for a specific Inventory item type.
  Future<void> getInventorySchema(
      {String typeName,
      String nextToken,
      int maxResults,
      bool aggregator,
      bool subType}) async {}

  /// Retrieves a maintenance window.
  Future<void> getMaintenanceWindow(String windowId) async {}

  /// Retrieves details about a specific a maintenance window execution.
  Future<void> getMaintenanceWindowExecution(String windowExecutionId) async {}

  /// Retrieves the details about a specific task run as part of a maintenance
  /// window execution.
  Future<void> getMaintenanceWindowExecutionTask(
      {@required String windowExecutionId, @required String taskId}) async {}

  /// Retrieves information about a specific task running on a specific target.
  Future<void> getMaintenanceWindowExecutionTaskInvocation(
      {@required String windowExecutionId,
      @required String taskId,
      @required String invocationId}) async {}

  /// Lists the tasks in a maintenance window.
  Future<void> getMaintenanceWindowTask(
      {@required String windowId, @required String windowTaskId}) async {}

  /// Get information about an OpsItem by using the ID. You must have permission
  /// in AWS Identity and Access Management (IAM) to view information about an
  /// OpsItem. For more information, see [Getting Started with
  /// OpsCenter](http://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-getting-started.html)
  /// in the _AWS Systems Manager User Guide_.
  ///
  /// Operations engineers and IT professionals use OpsCenter to view,
  /// investigate, and remediate operational issues impacting the performance
  /// and health of their AWS resources. For more information, see [AWS Systems
  /// Manager
  /// OpsCenter](http://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html)
  /// in the _AWS Systems Manager User Guide_.
  Future<void> getOpsItem(String opsItemId) async {}

  /// View a summary of OpsItems based on specified filters and aggregators.
  Future<void> getOpsSummary(List<OpsAggregator> aggregators,
      {List<OpsFilter> filters, String nextToken, int maxResults}) async {}

  /// Get information about a parameter by using the parameter name. Don't
  /// confuse this API action with the GetParameters API action.
  Future<void> getParameter(String name, {bool withDecryption}) async {}

  /// Query a list of all parameters used by the AWS account.
  Future<void> getParameterHistory(String name,
      {bool withDecryption, int maxResults, String nextToken}) async {}

  /// Get details of a parameter. Don't confuse this API action with the
  /// GetParameter API action.
  Future<void> getParameters(List<String> names, {bool withDecryption}) async {}

  /// Retrieve parameters in a specific hierarchy. For more information, see
  /// [Working with Systems Manager
  /// Parameters](http://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-paramstore-working.html)
  /// in the _AWS Systems Manager User Guide_.
  ///
  /// Request results are returned on a best-effort basis. If you specify
  /// `MaxResults` in the request, the response includes information up to the
  /// limit specified. The number of items returned, however, can be between
  /// zero and the value of `MaxResults`. If the service reaches an internal
  /// limit while processing the results, it stops the operation and returns the
  /// matching values up to that point and a `NextToken`. You can specify the
  /// `NextToken` in a subsequent call to get the next set of results.
  ///
  ///
  ///
  /// This API action doesn't support filtering by tags.
  Future<void> getParametersByPath(String path,
      {bool recursive,
      List<ParameterStringFilter> parameterFilters,
      bool withDecryption,
      int maxResults,
      String nextToken}) async {}

  /// Retrieves information about a patch baseline.
  Future<void> getPatchBaseline(String baselineId) async {}

  /// Retrieves the patch baseline that should be used for the specified patch
  /// group.
  Future<void> getPatchBaselineForPatchGroup(String patchGroup,
      {String operatingSystem}) async {}

  ///  `ServiceSetting` is an account-level setting for an AWS service. This
  /// setting defines how a user interacts with or uses a service or a feature
  /// of a service. For example, if an AWS service charges money to the account
  /// based on feature or service usage, then the AWS service team might create
  /// a default setting of "false". This means the user can't use this feature
  /// unless they change the setting to "true" and intentionally opt in for a
  /// paid feature.
  ///
  /// Services map a `SettingId` object to a setting value. AWS services teams
  /// define the default value for a `SettingId`. You can't create a new
  /// `SettingId`, but you can overwrite the default value if you have the
  /// `ssm:UpdateServiceSetting` permission for the setting. Use the
  /// UpdateServiceSetting API action to change the default setting. Or use the
  /// ResetServiceSetting to change the value back to the original value defined
  /// by the AWS service team.
  ///
  /// Query the current service setting for the account.
  Future<void> getServiceSetting(String settingId) async {}

  /// A parameter label is a user-defined alias to help you manage different
  /// versions of a parameter. When you modify a parameter, Systems Manager
  /// automatically saves a new version and increments the version number by
  /// one. A label can help you remember the purpose of a parameter when there
  /// are multiple versions.
  ///
  /// Parameter labels have the following requirements and restrictions.
  ///
  /// *   A version of a parameter can have a maximum of 10 labels.
  ///
  /// *   You can't attach the same label to different versions of the same
  /// parameter. For example, if version 1 has the label Production, then you
  /// can't attach Production to version 2.
  ///
  /// *   You can move a label from one version of a parameter to another.
  ///
  /// *   You can't create a label when you create a new parameter. You must
  /// attach a label to a specific version of a parameter.
  ///
  /// *   You can't delete a parameter label. If you no longer want to use a
  /// parameter label, then you must move it to a different version of a
  /// parameter.
  ///
  /// *   A label can have a maximum of 100 characters.
  ///
  /// *   Labels can contain letters (case sensitive), numbers, periods (.),
  /// hyphens (-), or underscores (_).
  ///
  /// *   Labels can't begin with a number, "aws," or "ssm" (not case
  /// sensitive). If a label fails to meet these requirements, then the label is
  /// not associated with a parameter and the system displays it in the list of
  /// InvalidLabels.
  Future<void> labelParameterVersion(
      {@required String name,
      BigInt parameterVersion,
      @required List<String> labels}) async {}

  /// Retrieves all versions of an association for a specific association ID.
  Future<void> listAssociationVersions(String associationId,
      {int maxResults, String nextToken}) async {}

  /// Lists the associations for the specified Systems Manager document or
  /// instance.
  Future<void> listAssociations(
      {List<AssociationFilter> associationFilterList,
      int maxResults,
      String nextToken}) async {}

  /// An invocation is copy of a command sent to a specific instance. A command
  /// can apply to one or more instances. A command invocation applies to one
  /// instance. For example, if a user runs SendCommand against three instances,
  /// then a command invocation is created for each requested instance ID.
  /// ListCommandInvocations provide status about command execution.
  Future<void> listCommandInvocations(
      {String commandId,
      String instanceId,
      int maxResults,
      String nextToken,
      List<CommandFilter> filters,
      bool details}) async {}

  /// Lists the commands requested by users of the AWS account.
  Future<void> listCommands(
      {String commandId,
      String instanceId,
      int maxResults,
      String nextToken,
      List<CommandFilter> filters}) async {}

  /// For a specified resource ID, this API action returns a list of compliance
  /// statuses for different resource types. Currently, you can only specify one
  /// resource ID per call. List results depend on the criteria specified in the
  /// filter.
  Future<void> listComplianceItems(
      {List<ComplianceStringFilter> filters,
      List<String> resourceIds,
      List<String> resourceTypes,
      String nextToken,
      int maxResults}) async {}

  /// Returns a summary count of compliant and non-compliant resources for a
  /// compliance type. For example, this call can return State Manager
  /// associations, patches, or custom compliance types according to the filter
  /// criteria that you specify.
  Future<void> listComplianceSummaries(
      {List<ComplianceStringFilter> filters,
      String nextToken,
      int maxResults}) async {}

  /// List all versions for a document.
  Future<void> listDocumentVersions(String name,
      {int maxResults, String nextToken}) async {}

  /// Describes one or more of your Systems Manager documents.
  Future<void> listDocuments(
      {List<DocumentFilter> documentFilterList,
      List<DocumentKeyValuesFilter> filters,
      int maxResults,
      String nextToken}) async {}

  /// A list of inventory items returned by the request.
  Future<void> listInventoryEntries(
      {@required String instanceId,
      @required String typeName,
      List<InventoryFilter> filters,
      String nextToken,
      int maxResults}) async {}

  /// Returns a resource-level summary count. The summary includes information
  /// about compliant and non-compliant statuses and detailed compliance-item
  /// severity counts, according to the filter criteria you specify.
  Future<void> listResourceComplianceSummaries(
      {List<ComplianceStringFilter> filters,
      String nextToken,
      int maxResults}) async {}

  /// Lists your resource data sync configurations. Includes information about
  /// the last time a sync attempted to start, the last sync status, and the
  /// last time a sync successfully completed.
  ///
  /// The number of sync configurations might be too large to return using a
  /// single call to `ListResourceDataSync`. You can limit the number of sync
  /// configurations returned by using the `MaxResults` parameter. To determine
  /// whether there are more sync configurations to list, check the value of
  /// `NextToken` in the output. If there are more sync configurations to list,
  /// you can request them by specifying the `NextToken` returned in the call to
  /// the parameter of a subsequent call.
  Future<void> listResourceDataSync({String nextToken, int maxResults}) async {}

  /// Returns a list of the tags assigned to the specified resource.
  Future<void> listTagsForResource(
      {@required String resourceType, @required String resourceId}) async {}

  /// Shares a Systems Manager document publicly or privately. If you share a
  /// document privately, you must specify the AWS user account IDs for those
  /// people who can use the document. If you share a document publicly, you
  /// must specify _All_ as the account ID.
  Future<void> modifyDocumentPermission(
      {@required String name,
      @required String permissionType,
      List<String> accountIdsToAdd,
      List<String> accountIdsToRemove}) async {}

  /// Registers a compliance type and other compliance details on a designated
  /// resource. This action lets you register custom compliance details with a
  /// resource. This call overwrites existing compliance information on the
  /// resource, so you must provide a full list of compliance items each time
  /// that you send the request.
  ///
  /// ComplianceType can be one of the following:
  ///
  /// *   ExecutionId: The execution ID when the patch, association, or custom
  /// compliance item was applied.
  ///
  /// *   ExecutionType: Specify patch, association, or Custom:`string`.
  ///
  /// *   ExecutionTime. The time the patch, association, or custom compliance
  /// item was applied to the instance.
  ///
  /// *   Id: The patch, association, or custom compliance ID.
  ///
  /// *   Title: A title.
  ///
  /// *   Status: The status of the compliance item. For example, `approved` for
  /// patches, or `Failed` for associations.
  ///
  /// *   Severity: A patch severity. For example, `critical`.
  ///
  /// *   DocumentName: A SSM document name. For example, AWS-RunPatchBaseline.
  ///
  /// *   DocumentVersion: An SSM document version number. For example, 4.
  ///
  /// *   Classification: A patch classification. For example, `security
  /// updates`.
  ///
  /// *   PatchBaselineId: A patch baseline ID.
  ///
  /// *   PatchSeverity: A patch severity. For example, `Critical`.
  ///
  /// *   PatchState: A patch state. For example, `InstancesWithFailedPatches`.
  ///
  /// *   PatchGroup: The name of a patch group.
  ///
  /// *   InstalledTime: The time the association, patch, or custom compliance
  /// item was applied to the resource. Specify the time by using the following
  /// format: yyyy-MM-dd'T'HH:mm:ss'Z'
  Future<void> putComplianceItems(
      {@required String resourceId,
      @required String resourceType,
      @required String complianceType,
      @required ComplianceExecutionSummary executionSummary,
      @required List<ComplianceItemEntry> items,
      String itemContentHash}) async {}

  /// Bulk update custom inventory items on one more instance. The request adds
  /// an inventory item, if it doesn't already exist, or updates an inventory
  /// item, if it does exist.
  Future<void> putInventory(
      {@required String instanceId,
      @required List<InventoryItem> items}) async {}

  /// Add a parameter to the system.
  Future<void> putParameter(
      {@required String name,
      String description,
      @required String value,
      @required String type,
      String keyId,
      bool overwrite,
      String allowedPattern,
      List<Tag> tags,
      String tier,
      String policies}) async {}

  /// Defines the default patch baseline for the relevant operating system.
  ///
  /// To reset the AWS predefined patch baseline as the default, specify the
  /// full patch baseline ARN as the baseline ID value. For example, for CentOS,
  /// specify
  /// `arn:aws:ssm:us-east-2:733109147000:patchbaseline/pb-0574b43a65ea646ed`
  /// instead of `pb-0574b43a65ea646ed`.
  Future<void> registerDefaultPatchBaseline(String baselineId) async {}

  /// Registers a patch baseline for a patch group.
  Future<void> registerPatchBaselineForPatchGroup(
      {@required String baselineId, @required String patchGroup}) async {}

  /// Registers a target with a maintenance window.
  Future<void> registerTargetWithMaintenanceWindow(
      {@required String windowId,
      @required String resourceType,
      @required List<Target> targets,
      String ownerInformation,
      String name,
      String description,
      String clientToken}) async {}

  /// Adds a new task to a maintenance window.
  Future<void> registerTaskWithMaintenanceWindow(
      {@required String windowId,
      @required List<Target> targets,
      @required String taskArn,
      String serviceRoleArn,
      @required String taskType,
      Map<String, MaintenanceWindowTaskParameterValueExpression> taskParameters,
      MaintenanceWindowTaskInvocationParameters taskInvocationParameters,
      int priority,
      @required String maxConcurrency,
      @required String maxErrors,
      LoggingInfo loggingInfo,
      String name,
      String description,
      String clientToken}) async {}

  /// Removes tag keys from the specified resource.
  Future<void> removeTagsFromResource(
      {@required String resourceType,
      @required String resourceId,
      @required List<String> tagKeys}) async {}

  ///  `ServiceSetting` is an account-level setting for an AWS service. This
  /// setting defines how a user interacts with or uses a service or a feature
  /// of a service. For example, if an AWS service charges money to the account
  /// based on feature or service usage, then the AWS service team might create
  /// a default setting of "false". This means the user can't use this feature
  /// unless they change the setting to "true" and intentionally opt in for a
  /// paid feature.
  ///
  /// Services map a `SettingId` object to a setting value. AWS services teams
  /// define the default value for a `SettingId`. You can't create a new
  /// `SettingId`, but you can overwrite the default value if you have the
  /// `ssm:UpdateServiceSetting` permission for the setting. Use the
  /// GetServiceSetting API action to view the current value. Use the
  /// UpdateServiceSetting API action to change the default setting.
  ///
  /// Reset the service setting for the account to the default value as
  /// provisioned by the AWS service team.
  Future<void> resetServiceSetting(String settingId) async {}

  /// Reconnects a session to an instance after it has been disconnected.
  /// Connections can be resumed for disconnected sessions, but not terminated
  /// sessions.
  ///
  ///
  ///
  /// This command is primarily for use by client machines to automatically
  /// reconnect during intermittent network issues. It is not intended for any
  /// other use.
  Future<void> resumeSession(String sessionId) async {}

  /// Sends a signal to an Automation execution to change the current behavior
  /// or status of the execution.
  Future<void> sendAutomationSignal(
      {@required String automationExecutionId,
      @required String signalType,
      Map<String, List<String>> payload}) async {}

  /// Runs commands on one or more managed instances.
  Future<void> sendCommand(String documentName,
      {List<String> instanceIds,
      List<Target> targets,
      String documentVersion,
      String documentHash,
      String documentHashType,
      int timeoutSeconds,
      String comment,
      Map<String, List<String>> parameters,
      String outputS3Region,
      String outputS3BucketName,
      String outputS3KeyPrefix,
      String maxConcurrency,
      String maxErrors,
      String serviceRoleArn,
      NotificationConfig notificationConfig,
      CloudWatchOutputConfig cloudWatchOutputConfig}) async {}

  /// Use this API action to run an association immediately and only one time.
  /// This action can be helpful when troubleshooting associations.
  Future<void> startAssociationsOnce(List<String> associationIds) async {}

  /// Initiates execution of an Automation document.
  Future<void> startAutomationExecution(String documentName,
      {String documentVersion,
      Map<String, List<String>> parameters,
      String clientToken,
      String mode,
      String targetParameterName,
      List<Target> targets,
      List<Map<String, List<String>>> targetMaps,
      String maxConcurrency,
      String maxErrors,
      List<TargetLocation> targetLocations}) async {}

  /// Initiates a connection to a target (for example, an instance) for a
  /// Session Manager session. Returns a URL and token that can be used to open
  /// a WebSocket connection for sending input and receiving outputs.
  ///
  ///
  ///
  /// AWS CLI usage: `start-session` is an interactive command that requires the
  /// Session Manager plugin to be installed on the client machine making the
  /// call. For information, see  [Install the Session Manager Plugin for the
  /// AWS
  /// CLI](http://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html)
  /// in the _AWS Systems Manager User Guide_.
  Future<void> startSession(String target,
      {String documentName, Map<String, List<String>> parameters}) async {}

  /// Stop an Automation that is currently running.
  Future<void> stopAutomationExecution(String automationExecutionId,
      {String type}) async {}

  /// Permanently ends a session and closes the data connection between the
  /// Session Manager client and SSM Agent on the instance. A terminated session
  /// cannot be resumed.
  Future<void> terminateSession(String sessionId) async {}

  /// Updates an association. You can update the association name and version,
  /// the document version, schedule, parameters, and Amazon S3 output.
  ///
  ///
  ///
  /// When you update an association, the association immediately runs against
  /// the specified targets.
  Future<void> updateAssociation(String associationId,
      {Map<String, List<String>> parameters,
      String documentVersion,
      String scheduleExpression,
      InstanceAssociationOutputLocation outputLocation,
      String name,
      List<Target> targets,
      String associationName,
      String associationVersion,
      String automationTargetParameterName,
      String maxErrors,
      String maxConcurrency,
      String complianceSeverity}) async {}

  /// Updates the status of the Systems Manager document associated with the
  /// specified instance.
  Future<void> updateAssociationStatus(
      {@required String name,
      @required String instanceId,
      @required AssociationStatus associationStatus}) async {}

  /// Updates one or more values for an SSM document.
  Future<void> updateDocument(
      {@required String content,
      List<AttachmentsSource> attachments,
      @required String name,
      String versionName,
      String documentVersion,
      String documentFormat,
      String targetType}) async {}

  /// Set the default version of a document.
  Future<void> updateDocumentDefaultVersion(
      {@required String name, @required String documentVersion}) async {}

  /// Updates an existing maintenance window. Only specified parameters are
  /// modified.
  Future<void> updateMaintenanceWindow(String windowId,
      {String name,
      String description,
      String startDate,
      String endDate,
      String schedule,
      String scheduleTimezone,
      int duration,
      int cutoff,
      bool allowUnassociatedTargets,
      bool enabled,
      bool replace}) async {}

  /// Modifies the target of an existing maintenance window. You can change the
  /// following:
  ///
  /// *   Name
  ///
  /// *   Description
  ///
  /// *   Owner
  ///
  /// *   IDs for an ID target
  ///
  /// *   Tags for a Tag target
  ///
  /// *   From any supported tag type to another. The three supported tag types
  /// are ID target, Tag target, and resource group. For more information, see
  /// Target.
  ///
  ///
  ///
  ///
  /// If a parameter is null, then the corresponding field is not modified.
  Future<void> updateMaintenanceWindowTarget(
      {@required String windowId,
      @required String windowTargetId,
      List<Target> targets,
      String ownerInformation,
      String name,
      String description,
      bool replace}) async {}

  /// Modifies a task assigned to a maintenance window. You can't change the
  /// task type, but you can change the following values:
  ///
  /// *   TaskARN. For example, you can change a RUN_COMMAND task from
  /// AWS-RunPowerShellScript to AWS-RunShellScript.
  ///
  /// *   ServiceRoleArn
  ///
  /// *   TaskInvocationParameters
  ///
  /// *   Priority
  ///
  /// *   MaxConcurrency
  ///
  /// *   MaxErrors
  ///
  ///
  /// If a parameter is null, then the corresponding field is not modified.
  /// Also, if you set Replace to true, then all fields required by the
  /// RegisterTaskWithMaintenanceWindow action are required for this request.
  /// Optional fields that aren't specified are set to null.
  Future<void> updateMaintenanceWindowTask(
      {@required String windowId,
      @required String windowTaskId,
      List<Target> targets,
      String taskArn,
      String serviceRoleArn,
      Map<String, MaintenanceWindowTaskParameterValueExpression> taskParameters,
      MaintenanceWindowTaskInvocationParameters taskInvocationParameters,
      int priority,
      String maxConcurrency,
      String maxErrors,
      LoggingInfo loggingInfo,
      String name,
      String description,
      bool replace}) async {}

  /// Assigns or changes an Amazon Identity and Access Management (IAM) role for
  /// the managed instance.
  Future<void> updateManagedInstanceRole(
      {@required String instanceId, @required String iamRole}) async {}

  /// Edit or change an OpsItem. You must have permission in AWS Identity and
  /// Access Management (IAM) to update an OpsItem. For more information, see
  /// [Getting Started with
  /// OpsCenter](http://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-getting-started.html)
  /// in the _AWS Systems Manager User Guide_.
  ///
  /// Operations engineers and IT professionals use OpsCenter to view,
  /// investigate, and remediate operational issues impacting the performance
  /// and health of their AWS resources. For more information, see [AWS Systems
  /// Manager
  /// OpsCenter](http://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html)
  /// in the _AWS Systems Manager User Guide_.
  Future<void> updateOpsItem(String opsItemId,
      {String description,
      Map<String, OpsItemDataValue> operationalData,
      List<String> operationalDataToDelete,
      List<OpsItemNotification> notifications,
      int priority,
      List<RelatedOpsItem> relatedOpsItems,
      String status,
      String title}) async {}

  /// Modifies an existing patch baseline. Fields not specified in the request
  /// are left unchanged.
  ///
  ///
  ///
  /// For information about valid key and value pairs in `PatchFilters` for each
  /// supported operating system type, see
  /// [PatchFilter](http://docs.aws.amazon.com/systems-manager/latest/APIReference/API_PatchFilter.html).
  Future<void> updatePatchBaseline(String baselineId,
      {String name,
      PatchFilterGroup globalFilters,
      PatchRuleGroup approvalRules,
      List<String> approvedPatches,
      String approvedPatchesComplianceLevel,
      bool approvedPatchesEnableNonSecurity,
      List<String> rejectedPatches,
      String rejectedPatchesAction,
      String description,
      List<PatchSource> sources,
      bool replace}) async {}

  ///  `ServiceSetting` is an account-level setting for an AWS service. This
  /// setting defines how a user interacts with or uses a service or a feature
  /// of a service. For example, if an AWS service charges money to the account
  /// based on feature or service usage, then the AWS service team might create
  /// a default setting of "false". This means the user can't use this feature
  /// unless they change the setting to "true" and intentionally opt in for a
  /// paid feature.
  ///
  /// Services map a `SettingId` object to a setting value. AWS services teams
  /// define the default value for a `SettingId`. You can't create a new
  /// `SettingId`, but you can overwrite the default value if you have the
  /// `ssm:UpdateServiceSetting` permission for the setting. Use the
  /// GetServiceSetting API action to view the current value. Or, use the
  /// ResetServiceSetting to change the value back to the original value defined
  /// by the AWS service team.
  ///
  /// Update the service setting for the account.
  Future<void> updateServiceSetting(
      {@required String settingId, @required String settingValue}) async {}
}

class Activation {}

class AddTagsToResourceResult {}

class Association {}

class AssociationDescription {}

class AssociationExecution {}

class AssociationExecutionFilter {}

class AssociationExecutionTarget {}

class AssociationExecutionTargetsFilter {}

class AssociationFilter {}

class AssociationOverview {}

class AssociationStatus {}

class AssociationVersionInfo {}

class AttachmentContent {}

class AttachmentInformation {}

class AttachmentsSource {}

class AutomationExecution {}

class AutomationExecutionFilter {}

class AutomationExecutionMetadata {}

class CancelCommandResult {}

class CancelMaintenanceWindowExecutionResult {}

class CloudWatchOutputConfig {}

class Command {}

class CommandFilter {}

class CommandInvocation {}

class CommandPlugin {}

class ComplianceExecutionSummary {}

class ComplianceItem {}

class ComplianceItemEntry {}

class ComplianceStringFilter {}

class ComplianceSummaryItem {}

class CompliantSummary {}

class CreateActivationResult {}

class CreateAssociationBatchRequestEntry {}

class CreateAssociationBatchResult {}

class CreateAssociationResult {}

class CreateDocumentResult {}

class CreateMaintenanceWindowResult {}

class CreateOpsItemResponse {}

class CreatePatchBaselineResult {}

class CreateResourceDataSyncResult {}

class DeleteActivationResult {}

class DeleteAssociationResult {}

class DeleteDocumentResult {}

class DeleteInventoryResult {}

class DeleteMaintenanceWindowResult {}

class DeleteParameterResult {}

class DeleteParametersResult {}

class DeletePatchBaselineResult {}

class DeleteResourceDataSyncResult {}

class DeregisterManagedInstanceResult {}

class DeregisterPatchBaselineForPatchGroupResult {}

class DeregisterTargetFromMaintenanceWindowResult {}

class DeregisterTaskFromMaintenanceWindowResult {}

class DescribeActivationsFilter {}

class DescribeActivationsResult {}

class DescribeAssociationExecutionTargetsResult {}

class DescribeAssociationExecutionsResult {}

class DescribeAssociationResult {}

class DescribeAutomationExecutionsResult {}

class DescribeAutomationStepExecutionsResult {}

class DescribeAvailablePatchesResult {}

class DescribeDocumentPermissionResponse {}

class DescribeDocumentResult {}

class DescribeEffectiveInstanceAssociationsResult {}

class DescribeEffectivePatchesForPatchBaselineResult {}

class DescribeInstanceAssociationsStatusResult {}

class DescribeInstanceInformationResult {}

class DescribeInstancePatchStatesForPatchGroupResult {}

class DescribeInstancePatchStatesResult {}

class DescribeInstancePatchesResult {}

class DescribeInventoryDeletionsResult {}

class DescribeMaintenanceWindowExecutionTaskInvocationsResult {}

class DescribeMaintenanceWindowExecutionTasksResult {}

class DescribeMaintenanceWindowExecutionsResult {}

class DescribeMaintenanceWindowScheduleResult {}

class DescribeMaintenanceWindowTargetsResult {}

class DescribeMaintenanceWindowTasksResult {}

class DescribeMaintenanceWindowsForTargetResult {}

class DescribeMaintenanceWindowsResult {}

class DescribeOpsItemsResponse {}

class DescribeParametersResult {}

class DescribePatchBaselinesResult {}

class DescribePatchGroupStateResult {}

class DescribePatchGroupsResult {}

class DescribePatchPropertiesResult {}

class DescribeSessionsResponse {}

class DocumentDefaultVersionDescription {}

class DocumentDescription {}

class DocumentFilter {}

class DocumentIdentifier {}

class DocumentKeyValuesFilter {}

class DocumentParameter {}

class DocumentVersionInfo {}

class EffectivePatch {}

class FailedCreateAssociation {}

class FailureDetails {}

class GetAutomationExecutionResult {}

class GetCommandInvocationResult {}

class GetConnectionStatusResponse {}

class GetDefaultPatchBaselineResult {}

class GetDeployablePatchSnapshotForInstanceResult {}

class GetDocumentResult {}

class GetInventoryResult {}

class GetInventorySchemaResult {}

class GetMaintenanceWindowExecutionResult {}

class GetMaintenanceWindowExecutionTaskInvocationResult {}

class GetMaintenanceWindowExecutionTaskResult {}

class GetMaintenanceWindowResult {}

class GetMaintenanceWindowTaskResult {}

class GetOpsItemResponse {}

class GetOpsSummaryResult {}

class GetParameterHistoryResult {}

class GetParameterResult {}

class GetParametersByPathResult {}

class GetParametersResult {}

class GetPatchBaselineForPatchGroupResult {}

class GetPatchBaselineResult {}

class GetServiceSettingResult {}

class InstanceAggregatedAssociationOverview {}

class InstanceAssociation {}

class InstanceAssociationOutputLocation {}

class InstanceAssociationOutputUrl {}

class InstanceAssociationStatusInfo {}

class InstanceInformation {}

class InstanceInformationFilter {}

class InstanceInformationStringFilter {}

class InstancePatchState {}

class InstancePatchStateFilter {}

class InventoryAggregator {}

class InventoryDeletionStatusItem {}

class InventoryDeletionSummary {}

class InventoryDeletionSummaryItem {}

class InventoryFilter {}

class InventoryGroup {}

class InventoryItem {}

class InventoryItemAttribute {}

class InventoryItemSchema {}

class InventoryResultEntity {}

class InventoryResultItem {}

class LabelParameterVersionResult {}

class ListAssociationVersionsResult {}

class ListAssociationsResult {}

class ListCommandInvocationsResult {}

class ListCommandsResult {}

class ListComplianceItemsResult {}

class ListComplianceSummariesResult {}

class ListDocumentVersionsResult {}

class ListDocumentsResult {}

class ListInventoryEntriesResult {}

class ListResourceComplianceSummariesResult {}

class ListResourceDataSyncResult {}

class ListTagsForResourceResult {}

class LoggingInfo {}

class MaintenanceWindowAutomationParameters {}

class MaintenanceWindowExecution {}

class MaintenanceWindowExecutionTaskIdentity {}

class MaintenanceWindowExecutionTaskInvocationIdentity {}

class MaintenanceWindowFilter {}

class MaintenanceWindowIdentity {}

class MaintenanceWindowIdentityForTarget {}

class MaintenanceWindowLambdaParameters {}

class MaintenanceWindowRunCommandParameters {}

class MaintenanceWindowStepFunctionsParameters {}

class MaintenanceWindowTarget {}

class MaintenanceWindowTask {}

class MaintenanceWindowTaskInvocationParameters {}

class MaintenanceWindowTaskParameterValueExpression {}

class ModifyDocumentPermissionResponse {}

class NonCompliantSummary {}

class NotificationConfig {}

class OpsAggregator {}

class OpsEntity {}

class OpsEntityItem {}

class OpsFilter {}

class OpsItem {}

class OpsItemDataValue {}

class OpsItemFilter {}

class OpsItemNotification {}

class OpsItemSummary {}

class OutputSource {}

class Parameter {}

class ParameterHistory {}

class ParameterInlinePolicy {}

class ParameterMetadata {}

class ParameterStringFilter {}

class ParametersFilter {}

class Patch {}

class PatchBaselineIdentity {}

class PatchComplianceData {}

class PatchFilter {}

class PatchFilterGroup {}

class PatchGroupPatchBaselineMapping {}

class PatchOrchestratorFilter {}

class PatchRule {}

class PatchRuleGroup {}

class PatchSource {}

class PatchStatus {}

class ProgressCounters {}

class PutComplianceItemsResult {}

class PutInventoryResult {}

class PutParameterResult {}

class RegisterDefaultPatchBaselineResult {}

class RegisterPatchBaselineForPatchGroupResult {}

class RegisterTargetWithMaintenanceWindowResult {}

class RegisterTaskWithMaintenanceWindowResult {}

class RelatedOpsItem {}

class RemoveTagsFromResourceResult {}

class ResetServiceSettingResult {}

class ResolvedTargets {}

class ResourceComplianceSummaryItem {}

class ResourceDataSyncItem {}

class ResourceDataSyncS3Destination {}

class ResultAttribute {}

class ResumeSessionResponse {}

class S3OutputLocation {}

class S3OutputUrl {}

class ScheduledWindowExecution {}

class SendAutomationSignalResult {}

class SendCommandResult {}

class ServiceSetting {}

class Session {}

class SessionFilter {}

class SessionManagerOutputUrl {}

class SeveritySummary {}

class StartAssociationsOnceResult {}

class StartAutomationExecutionResult {}

class StartSessionResponse {}

class StepExecution {}

class StepExecutionFilter {}

class StopAutomationExecutionResult {}

class Tag {}

class Target {}

class TargetLocation {}

class TerminateSessionResponse {}

class UpdateAssociationResult {}

class UpdateAssociationStatusResult {}

class UpdateDocumentDefaultVersionResult {}

class UpdateDocumentResult {}

class UpdateMaintenanceWindowResult {}

class UpdateMaintenanceWindowTargetResult {}

class UpdateMaintenanceWindowTaskResult {}

class UpdateManagedInstanceRoleResult {}

class UpdateOpsItemResponse {}

class UpdatePatchBaselineResult {}

class UpdateServiceSettingResult {}
