import 'package:meta/meta.dart';
import 'dart:typed_data';

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
/// This reference is intended to be used with the
/// [AWS Systems Manager User Guide](http://docs.aws.amazon.com/systems-manager/latest/userguide/).
///
/// To get started, verify prerequisites and configure managed instances. For
/// more information, see
/// [Setting Up AWS Systems Manager](http://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-setting-up.html)
/// in the _AWS Systems Manager User Guide_.
///
/// For information about other API actions you can perform on Amazon EC2
/// instances, see the
/// [Amazon EC2 API Reference](http://docs.aws.amazon.com/AWSEC2/latest/APIReference/).
/// For information about how to use a Query API, see
/// [Making API Requests](http://docs.aws.amazon.com/AWSEC2/latest/APIReference/making-api-requests.html).
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
  /// For more information about tags, see
  /// [Tagging Your Amazon EC2 Resources](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html)
  /// in the _Amazon EC2 User Guide_.
  ///
  /// [resourceType]: Specifies the type of resource you are tagging.
  ///
  ///
  ///
  /// The ManagedInstance type for this API action is for on-premises managed
  /// instances. You must specify the name of the managed instance in the
  /// following format: mi-ID_number. For example, mi-1a2b3c4d5e6f.
  ///
  /// [resourceId]: The resource ID you want to tag.
  ///
  /// Use the ID of the resource. Here are some examples:
  ///
  /// ManagedInstance: mi-012345abcde
  ///
  /// MaintenanceWindow: mw-012345abcde
  ///
  /// PatchBaseline: pb-012345abcde
  ///
  /// For the Document and Parameter values, use the name of the resource.
  ///
  ///
  ///
  /// The ManagedInstance type for this API action is only for on-premises
  /// managed instances. You must specify the name of the managed instance in
  /// the following format: mi-ID_number. For example, mi-1a2b3c4d5e6f.
  ///
  /// [tags]:  One or more tags. The value parameter is required, but if you
  /// don't want the tag to have a value, specify the parameter with no value,
  /// and we set the value to an empty string.
  ///
  ///
  ///
  /// Do not enter personally identifiable information in this field.
  Future<AddTagsToResourceResult> addTagsToResource(
      {@required String resourceType,
      @required String resourceId,
      @required List<Tag> tags}) async {
    return AddTagsToResourceResult.fromJson({});
  }

  /// Attempts to cancel the command specified by the Command ID. There is no
  /// guarantee that the command will be terminated and the underlying process
  /// stopped.
  ///
  /// [commandId]: The ID of the command you want to cancel.
  ///
  /// [instanceIds]: (Optional) A list of instance IDs on which you want to
  /// cancel the command. If not provided, the command is canceled on every
  /// instance on which it was requested.
  Future<CancelCommandResult> cancelCommand(String commandId,
      {List<String> instanceIds}) async {
    return CancelCommandResult.fromJson({});
  }

  /// Stops a maintenance window execution that is already in progress and
  /// cancels any tasks in the window that have not already starting running.
  /// (Tasks already in progress will continue to completion.)
  ///
  /// [windowExecutionId]: The ID of the maintenance window execution to stop.
  Future<CancelMaintenanceWindowExecutionResult>
      cancelMaintenanceWindowExecution(String windowExecutionId) async {
    return CancelMaintenanceWindowExecutionResult.fromJson({});
  }

  /// Registers your on-premises server or virtual machine with Amazon EC2 so
  /// that you can manage these resources using Run Command. An on-premises
  /// server or virtual machine that has been registered with EC2 is called a
  /// managed instance. For more information about activations, see
  /// [Setting Up AWS Systems Manager for Hybrid Environments](http://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-managedinstances.html).
  ///
  /// [description]: A user-defined description of the resource that you want to
  /// register with Amazon EC2.
  ///
  ///
  ///
  /// Do not enter personally identifiable information in this field.
  ///
  /// [defaultInstanceName]: The name of the registered, managed instance as it
  /// will appear in the Amazon EC2 console or when you use the AWS command line
  /// tools to list EC2 resources.
  ///
  ///
  ///
  /// Do not enter personally identifiable information in this field.
  ///
  /// [iamRole]: The Amazon Identity and Access Management (IAM) role that you
  /// want to assign to the managed instance.
  ///
  /// [registrationLimit]: Specify the maximum number of managed instances you
  /// want to register. The default value is 1 instance.
  ///
  /// [expirationDate]: The date by which this activation request should expire.
  /// The default value is 24 hours.
  ///
  /// [tags]: Optional metadata that you assign to a resource. Tags enable you
  /// to categorize a resource in different ways, such as by purpose, owner, or
  /// environment. For example, you might want to tag an activation to identify
  /// which servers or virtual machines (VMs) in your on-premises environment
  /// you intend to activate. In this case, you could specify the following key
  /// name/value pairs:
  ///
  /// *    `Key=OS,Value=Windows`
  ///
  /// *    `Key=Environment,Value=Production`
  ///
  ///
  ///  When you install SSM Agent on your on-premises servers and VMs, you
  /// specify an activation ID and code. When you specify the activation ID and
  /// code, tags assigned to the activation are automatically applied to the
  /// on-premises servers or VMs.
  ///
  /// You can't add tags to or delete tags from an existing activation. You can
  /// tag your on-premises servers and VMs after they connect to Systems Manager
  /// for the first time and are assigned a managed instance ID. This means they
  /// are listed in the AWS Systems Manager console with an ID that is prefixed
  /// with "mi-". For information about how to add tags to your managed
  /// instances, see AddTagsToResource. For information about how to remove tags
  /// from your managed instances, see RemoveTagsFromResource.
  Future<CreateActivationResult> createActivation(String iamRole,
      {String description,
      String defaultInstanceName,
      int registrationLimit,
      DateTime expirationDate,
      List<Tag> tags}) async {
    return CreateActivationResult.fromJson({});
  }

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
  ///
  /// [name]: The name of the SSM document that contains the configuration
  /// information for the instance. You can specify Command or Automation
  /// documents.
  ///
  /// You can specify AWS-predefined documents, documents you created, or a
  /// document that is shared with you from another account.
  ///
  /// For SSM documents that are shared with you from other AWS accounts, you
  /// must specify the complete SSM document ARN, in the following format:
  ///
  ///  `arn:_partition_:ssm:_region_:_account-id_:document/_document-name_`
  ///
  /// For example:
  ///
  ///  `arn:aws:ssm:us-east-2:12345678912:document/My-Shared-Document`
  ///
  /// For AWS-predefined documents and SSM documents you created in your
  /// account, you only need to specify the document name. For example,
  /// `AWS-ApplyPatchBaseline` or `My-Document`.
  ///
  /// [documentVersion]: The document version you want to associate with the
  /// target(s). Can be a specific version or the default version.
  ///
  /// [instanceId]: The instance ID.
  ///
  ///   `InstanceId` has been deprecated. To specify an instance ID for an
  /// association, use the `Targets` parameter. If you use the parameter
  /// `InstanceId`, you cannot use the parameters `AssociationName`,
  /// `DocumentVersion`, `MaxErrors`, `MaxConcurrency`, `OutputLocation`, or
  /// `ScheduleExpression`. To use these parameters, you must use the `Targets`
  /// parameter.
  ///
  /// [parameters]: The parameters for the runtime configuration of the
  /// document.
  ///
  /// [targets]: The targets (either instances or tags) for the association. You
  /// must specify a value for `Targets` if you don't specify a value for
  /// `InstanceId`.
  ///
  /// [scheduleExpression]: A cron expression when the association will be
  /// applied to the target(s).
  ///
  /// [outputLocation]: An Amazon S3 bucket where you want to store the output
  /// details of the request.
  ///
  /// [associationName]: Specify a descriptive name for the association.
  ///
  /// [automationTargetParameterName]: Specify the target for the association.
  /// This target is required for associations that use an Automation document
  /// and target resources by using rate controls.
  ///
  /// [maxErrors]: The number of errors that are allowed before the system stops
  /// sending requests to run the association on additional targets. You can
  /// specify either an absolute number of errors, for example 10, or a
  /// percentage of the target set, for example 10%. If you specify 3, for
  /// example, the system stops sending requests when the fourth error is
  /// received. If you specify 0, then the system stops sending requests after
  /// the first error is returned. If you run an association on 50 instances and
  /// set MaxError to 10%, then the system stops sending the request when the
  /// sixth error is received.
  ///
  /// Executions that are already running an association when MaxErrors is
  /// reached are allowed to complete, but some of these executions may fail as
  /// well. If you need to ensure that there won't be more than max-errors
  /// failed executions, set MaxConcurrency to 1 so that executions proceed one
  /// at a time.
  ///
  /// [maxConcurrency]: The maximum number of targets allowed to run the
  /// association at the same time. You can specify a number, for example 10, or
  /// a percentage of the target set, for example 10%. The default value is
  /// 100%, which means all targets run the association at the same time.
  ///
  /// If a new instance starts and attempts to run an association while Systems
  /// Manager is running MaxConcurrency associations, the association is allowed
  /// to run. During the next association interval, the new instance will
  /// process its association within the limit specified for MaxConcurrency.
  ///
  /// [complianceSeverity]: The severity level to assign to the association.
  Future<CreateAssociationResult> createAssociation(String name,
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
      String complianceSeverity}) async {
    return CreateAssociationResult.fromJson({});
  }

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
  ///
  /// [entries]: One or more associations.
  Future<CreateAssociationBatchResult> createAssociationBatch(
      List<CreateAssociationBatchRequestEntry> entries) async {
    return CreateAssociationBatchResult.fromJson({});
  }

  /// Creates a Systems Manager document.
  ///
  /// After you create a document, you can use CreateAssociation to associate it
  /// with one or more running instances.
  ///
  /// [content]: A valid JSON or YAML string.
  ///
  /// [attachments]: A list of key and value pairs that describe attachments to
  /// a version of a document.
  ///
  /// [name]: A name for the Systems Manager document.
  ///
  ///
  ///
  /// Do not use the following to begin the names of documents you create. They
  /// are reserved by AWS for use as document prefixes:
  ///
  /// *    `aws`
  ///
  /// *    `amazon`
  ///
  /// *    `amzn`
  ///
  /// [versionName]: An optional field specifying the version of the artifact
  /// you are creating with the document. For example, "Release 12, Update 6".
  /// This value is unique across all versions of a document, and cannot be
  /// changed.
  ///
  /// [documentType]: The type of document to create. Valid document types
  /// include: `Command`, `Policy`, `Automation`, `Session`, and `Package`.
  ///
  /// [documentFormat]: Specify the document format for the request. The
  /// document format can be either JSON or YAML. JSON is the default format.
  ///
  /// [targetType]: Specify a target type to define the kinds of resources the
  /// document can run on. For example, to run a document on EC2 instances,
  /// specify the following value: /AWS::EC2::Instance. If you specify a value
  /// of '/' the document can run on all types of resources. If you don't
  /// specify a value, the document can't run on any resources. For a list of
  /// valid resource types, see
  /// [AWS Resource Types Reference](http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html)
  /// in the _AWS CloudFormation User Guide_.
  ///
  /// [tags]: Optional metadata that you assign to a resource. Tags enable you
  /// to categorize a resource in different ways, such as by purpose, owner, or
  /// environment. For example, you might want to tag an SSM document to
  /// identify the types of targets or the environment where it will run. In
  /// this case, you could specify the following key name/value pairs:
  ///
  /// *    `Key=OS,Value=Windows`
  ///
  /// *    `Key=Environment,Value=Production`
  ///
  ///
  ///
  ///
  /// To add tags to an existing SSM document, use the AddTagsToResource action.
  Future<CreateDocumentResult> createDocument(
      {@required String content,
      List<AttachmentsSource> attachments,
      @required String name,
      String versionName,
      String documentType,
      String documentFormat,
      String targetType,
      List<Tag> tags}) async {
    return CreateDocumentResult.fromJson({});
  }

  /// Creates a new maintenance window.
  ///
  /// [name]: The name of the maintenance window.
  ///
  /// [description]: An optional description for the maintenance window. We
  /// recommend specifying a description to help you organize your maintenance
  /// windows.
  ///
  /// [startDate]: The date and time, in ISO-8601 Extended format, for when you
  /// want the maintenance window to become active. StartDate allows you to
  /// delay activation of the maintenance window until the specified future
  /// date.
  ///
  /// [endDate]: The date and time, in ISO-8601 Extended format, for when you
  /// want the maintenance window to become inactive. EndDate allows you to set
  /// a date and time in the future when the maintenance window will no longer
  /// run.
  ///
  /// [schedule]: The schedule of the maintenance window in the form of a cron
  /// or rate expression.
  ///
  /// [scheduleTimezone]: The time zone that the scheduled maintenance window
  /// executions are based on, in Internet Assigned Numbers Authority (IANA)
  /// format. For example: "America/Los_Angeles", "etc/UTC", or "Asia/Seoul".
  /// For more information, see the
  /// [Time Zone Database](https://www.iana.org/time-zones) on the IANA website.
  ///
  /// [duration]: The duration of the maintenance window in hours.
  ///
  /// [cutoff]: The number of hours before the end of the maintenance window
  /// that Systems Manager stops scheduling new tasks for execution.
  ///
  /// [allowUnassociatedTargets]: Enables a maintenance window task to run on
  /// managed instances, even if you have not registered those instances as
  /// targets. If enabled, then you must specify the unregistered instances (by
  /// instance ID) when you register a task with the maintenance window.
  ///
  /// If you don't enable this option, then you must specify
  /// previously-registered targets when you register a task with the
  /// maintenance window.
  ///
  /// [clientToken]: User-provided idempotency token.
  ///
  /// [tags]: Optional metadata that you assign to a resource. Tags enable you
  /// to categorize a resource in different ways, such as by purpose, owner, or
  /// environment. For example, you might want to tag a maintenance window to
  /// identify the type of tasks it will run, the types of targets, and the
  /// environment it will run in. In this case, you could specify the following
  /// key name/value pairs:
  ///
  /// *    `Key=TaskType,Value=AgentUpdate`
  ///
  /// *    `Key=OS,Value=Windows`
  ///
  /// *    `Key=Environment,Value=Production`
  ///
  ///
  ///
  ///
  /// To add tags to an existing maintenance window, use the AddTagsToResource
  /// action.
  Future<CreateMaintenanceWindowResult> createMaintenanceWindow(
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
      List<Tag> tags}) async {
    return CreateMaintenanceWindowResult.fromJson({});
  }

  /// Creates a new OpsItem. You must have permission in AWS Identity and Access
  /// Management (IAM) to create a new OpsItem. For more information, see
  /// [Getting Started with OpsCenter](http://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-getting-started.html)
  /// in the _AWS Systems Manager User Guide_.
  ///
  /// Operations engineers and IT professionals use OpsCenter to view,
  /// investigate, and remediate operational issues impacting the performance
  /// and health of their AWS resources. For more information, see
  /// [AWS Systems Manager OpsCenter](http://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html)
  /// in the _AWS Systems Manager User Guide_.
  ///
  /// [description]: Information about the OpsItem.
  ///
  /// [operationalData]: Operational data is custom data that provides useful
  /// reference details about the OpsItem. For example, you can specify log
  /// files, error strings, license keys, troubleshooting tips, or other
  /// relevant data. You enter operational data as key-value pairs. The key has
  /// a maximum length of 128 characters. The value has a maximum size of 20 KB.
  ///
  ///  Operational data keys _can't_ begin with the following: amazon, aws,
  /// amzn, ssm, /amazon, /aws, /amzn, /ssm.
  ///
  /// You can choose to make the data searchable by other users in the account
  /// or you can restrict search access. Searchable data means that all users
  /// with access to the OpsItem Overview page (as provided by the
  /// DescribeOpsItems API action) can view and search on the specified data.
  /// Operational data that is not searchable is only viewable by users who have
  /// access to the OpsItem (as provided by the GetOpsItem API action).
  ///
  /// Use the `/aws/resources` key in OperationalData to specify a related
  /// resource in the request. Use the `/aws/automations` key in OperationalData
  /// to associate an Automation runbook with the OpsItem. To view AWS CLI
  /// example commands that use these keys, see
  /// [Creating OpsItems Manually](http://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-creating-OpsItems.html#OpsCenter-manually-create-OpsItems)
  /// in the _AWS Systems Manager User Guide_.
  ///
  /// [notifications]: The Amazon Resource Name (ARN) of an SNS topic where
  /// notifications are sent when this OpsItem is edited or changed.
  ///
  /// [priority]: The importance of this OpsItem in relation to other OpsItems
  /// in the system.
  ///
  /// [relatedOpsItems]: One or more OpsItems that share something in common
  /// with the current OpsItems. For example, related OpsItems can include
  /// OpsItems with similar error messages, impacted resources, or statuses for
  /// the impacted resource.
  ///
  /// [source]: The origin of the OpsItem, such as Amazon EC2 or AWS Systems
  /// Manager.
  ///
  /// [title]: A short heading that describes the nature of the OpsItem and the
  /// impacted resource.
  ///
  /// [tags]: Optional metadata that you assign to a resource. You can restrict
  /// access to OpsItems by using an inline IAM policy that specifies tags. For
  /// more information, see
  /// [Getting Started with OpsCenter](http://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-getting-started.html#OpsCenter-getting-started-user-permissions)
  /// in the _AWS Systems Manager User Guide_.
  ///
  /// Tags use a key-value pair. For example:
  ///
  ///  `Key=Department,Value=Finance`
  ///
  ///
  ///
  /// To add tags to an existing OpsItem, use the AddTagsToResource action.
  Future<CreateOpsItemResponse> createOpsItem(
      {@required String description,
      Map<String, OpsItemDataValue> operationalData,
      List<OpsItemNotification> notifications,
      int priority,
      List<RelatedOpsItem> relatedOpsItems,
      @required String source,
      @required String title,
      List<Tag> tags}) async {
    return CreateOpsItemResponse.fromJson({});
  }

  /// Creates a patch baseline.
  ///
  ///
  ///
  /// For information about valid key and value pairs in `PatchFilters` for each
  /// supported operating system type, see
  /// [PatchFilter](http://docs.aws.amazon.com/systems-manager/latest/APIReference/API_PatchFilter.html).
  ///
  /// [operatingSystem]: Defines the operating system the patch baseline applies
  /// to. The Default value is WINDOWS.
  ///
  /// [name]: The name of the patch baseline.
  ///
  /// [globalFilters]: A set of global filters used to include patches in the
  /// baseline.
  ///
  /// [approvalRules]: A set of rules used to include patches in the baseline.
  ///
  /// [approvedPatches]: A list of explicitly approved patches for the baseline.
  ///
  /// For information about accepted formats for lists of approved patches and
  /// rejected patches, see
  /// [Package Name Formats for Approved and Rejected Patch Lists](https://docs.aws.amazon.com/systems-manager/latest/userguide/patch-manager-approved-rejected-package-name-formats.html)
  /// in the _AWS Systems Manager User Guide_.
  ///
  /// [approvedPatchesComplianceLevel]: Defines the compliance level for
  /// approved patches. This means that if an approved patch is reported as
  /// missing, this is the severity of the compliance violation. The default
  /// value is UNSPECIFIED.
  ///
  /// [approvedPatchesEnableNonSecurity]: Indicates whether the list of approved
  /// patches includes non-security updates that should be applied to the
  /// instances. The default value is 'false'. Applies to Linux instances only.
  ///
  /// [rejectedPatches]: A list of explicitly rejected patches for the baseline.
  ///
  /// For information about accepted formats for lists of approved patches and
  /// rejected patches, see
  /// [Package Name Formats for Approved and Rejected Patch Lists](https://docs.aws.amazon.com/systems-manager/latest/userguide/patch-manager-approved-rejected-package-name-formats.html)
  /// in the _AWS Systems Manager User Guide_.
  ///
  /// [rejectedPatchesAction]: The action for Patch Manager to take on patches
  /// included in the RejectedPackages list.
  ///
  /// *    **ALLOW_AS_DEPENDENCY**: A package in the Rejected patches list is
  /// installed only if it is a dependency of another package. It is considered
  /// compliant with the patch baseline, and its status is reported as
  /// _InstalledOther_. This is the default action if no option is specified.
  ///
  /// *    **BLOCK**: Packages in the RejectedPatches list, and packages that
  /// include them as dependencies, are not installed under any circumstances.
  /// If a package was installed before it was added to the Rejected patches
  /// list, it is considered non-compliant with the patch baseline, and its
  /// status is reported as _InstalledRejected_.
  ///
  /// [description]: A description of the patch baseline.
  ///
  /// [sources]: Information about the patches to use to update the instances,
  /// including target operating systems and source repositories. Applies to
  /// Linux instances only.
  ///
  /// [clientToken]: User-provided idempotency token.
  ///
  /// [tags]: Optional metadata that you assign to a resource. Tags enable you
  /// to categorize a resource in different ways, such as by purpose, owner, or
  /// environment. For example, you might want to tag a patch baseline to
  /// identify the severity level of patches it specifies and the operating
  /// system family it applies to. In this case, you could specify the following
  /// key name/value pairs:
  ///
  /// *    `Key=PatchSeverity,Value=Critical`
  ///
  /// *    `Key=OS,Value=Windows`
  ///
  ///
  ///
  ///
  /// To add tags to an existing patch baseline, use the AddTagsToResource
  /// action.
  Future<CreatePatchBaselineResult> createPatchBaseline(String name,
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
      List<Tag> tags}) async {
    return CreatePatchBaselineResult.fromJson({});
  }

  /// Creates a resource data sync configuration to a single bucket in Amazon
  /// S3. This is an asynchronous operation that returns immediately. After a
  /// successful initial sync is completed, the system continuously syncs data
  /// to the Amazon S3 bucket. To check the status of the sync, use the
  /// ListResourceDataSync.
  ///
  /// By default, data is not encrypted in Amazon S3. We strongly recommend that
  /// you enable encryption in Amazon S3 to ensure secure data storage. We also
  /// recommend that you secure access to the Amazon S3 bucket by creating a
  /// restrictive bucket policy. For more information, see
  /// [Configuring Resource Data Sync for Inventory](http://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-inventory-datasync.html)
  /// in the _AWS Systems Manager User Guide_.
  ///
  /// [syncName]: A name for the configuration.
  ///
  /// [s3Destination]: Amazon S3 configuration details for the sync.
  Future<CreateResourceDataSyncResult> createResourceDataSync(
      {@required String syncName,
      @required ResourceDataSyncS3Destination s3Destination}) async {
    return CreateResourceDataSyncResult.fromJson({});
  }

  /// Deletes an activation. You are not required to delete an activation. If
  /// you delete an activation, you can no longer use it to register additional
  /// managed instances. Deleting an activation does not de-register managed
  /// instances. You must manually de-register managed instances.
  ///
  /// [activationId]: The ID of the activation that you want to delete.
  Future<DeleteActivationResult> deleteActivation(String activationId) async {
    return DeleteActivationResult.fromJson({});
  }

  /// Disassociates the specified Systems Manager document from the specified
  /// instance.
  ///
  /// When you disassociate a document from an instance, it does not change the
  /// configuration of the instance. To change the configuration state of an
  /// instance after you disassociate a document, you must create a new document
  /// with the desired configuration and associate it with the instance.
  ///
  /// [name]: The name of the Systems Manager document.
  ///
  /// [instanceId]: The ID of the instance.
  ///
  /// [associationId]: The association ID that you want to delete.
  Future<DeleteAssociationResult> deleteAssociation(
      {String name, String instanceId, String associationId}) async {
    return DeleteAssociationResult.fromJson({});
  }

  /// Deletes the Systems Manager document and all instance associations to the
  /// document.
  ///
  /// Before you delete the document, we recommend that you use
  /// DeleteAssociation to disassociate all instances that are associated with
  /// the document.
  ///
  /// [name]: The name of the document.
  ///
  /// [documentVersion]: The version of the document that you want to delete. If
  /// not provided, all versions of the document are deleted.
  ///
  /// [versionName]: The version name of the document that you want to delete.
  /// If not provided, all versions of the document are deleted.
  Future<DeleteDocumentResult> deleteDocument(String name,
      {String documentVersion, String versionName}) async {
    return DeleteDocumentResult.fromJson({});
  }

  /// Delete a custom inventory type, or the data associated with a custom
  /// Inventory type. Deleting a custom inventory type is also referred to as
  /// deleting a custom inventory schema.
  ///
  /// [typeName]: The name of the custom inventory type for which you want to
  /// delete either all previously collected data, or the inventory type itself.
  ///
  /// [schemaDeleteOption]: Use the `SchemaDeleteOption` to delete a custom
  /// inventory type (schema). If you don't choose this option, the system only
  /// deletes existing inventory data associated with the custom inventory type.
  /// Choose one of the following options:
  ///
  /// DisableSchema: If you choose this option, the system ignores all inventory
  /// data for the specified version, and any earlier versions. To enable this
  /// schema again, you must call the `PutInventory` action for a version
  /// greater than the disabled version.
  ///
  /// DeleteSchema: This option deletes the specified custom type from the
  /// Inventory service. You can recreate the schema later, if you want.
  ///
  /// [dryRun]: Use this option to view a summary of the deletion request
  /// without deleting any data or the data type. This option is useful when you
  /// only want to understand what will be deleted. Once you validate that the
  /// data to be deleted is what you intend to delete, you can run the same
  /// command without specifying the `DryRun` option.
  ///
  /// [clientToken]: User-provided idempotency token.
  Future<DeleteInventoryResult> deleteInventory(String typeName,
      {String schemaDeleteOption, bool dryRun, String clientToken}) async {
    return DeleteInventoryResult.fromJson({});
  }

  /// Deletes a maintenance window.
  ///
  /// [windowId]: The ID of the maintenance window to delete.
  Future<DeleteMaintenanceWindowResult> deleteMaintenanceWindow(
      String windowId) async {
    return DeleteMaintenanceWindowResult.fromJson({});
  }

  /// Delete a parameter from the system.
  ///
  /// [name]: The name of the parameter to delete.
  Future<DeleteParameterResult> deleteParameter(String name) async {
    return DeleteParameterResult.fromJson({});
  }

  /// Delete a list of parameters.
  ///
  /// [names]: The names of the parameters to delete.
  Future<DeleteParametersResult> deleteParameters(List<String> names) async {
    return DeleteParametersResult.fromJson({});
  }

  /// Deletes a patch baseline.
  ///
  /// [baselineId]: The ID of the patch baseline to delete.
  Future<DeletePatchBaselineResult> deletePatchBaseline(
      String baselineId) async {
    return DeletePatchBaselineResult.fromJson({});
  }

  /// Deletes a Resource Data Sync configuration. After the configuration is
  /// deleted, changes to inventory data on managed instances are no longer
  /// synced with the target Amazon S3 bucket. Deleting a sync configuration
  /// does not delete data in the target Amazon S3 bucket.
  ///
  /// [syncName]: The name of the configuration to delete.
  Future<DeleteResourceDataSyncResult> deleteResourceDataSync(
      String syncName) async {
    return DeleteResourceDataSyncResult.fromJson({});
  }

  /// Removes the server or virtual machine from the list of registered servers.
  /// You can reregister the instance again at any time. If you don't plan to
  /// use Run Command on the server, we suggest uninstalling SSM Agent first.
  ///
  /// [instanceId]: The ID assigned to the managed instance when you registered
  /// it using the activation process.
  Future<DeregisterManagedInstanceResult> deregisterManagedInstance(
      String instanceId) async {
    return DeregisterManagedInstanceResult.fromJson({});
  }

  /// Removes a patch group from a patch baseline.
  ///
  /// [baselineId]: The ID of the patch baseline to deregister the patch group
  /// from.
  ///
  /// [patchGroup]: The name of the patch group that should be deregistered from
  /// the patch baseline.
  Future<DeregisterPatchBaselineForPatchGroupResult>
      deregisterPatchBaselineForPatchGroup(
          {@required String baselineId, @required String patchGroup}) async {
    return DeregisterPatchBaselineForPatchGroupResult.fromJson({});
  }

  /// Removes a target from a maintenance window.
  ///
  /// [windowId]: The ID of the maintenance window the target should be removed
  /// from.
  ///
  /// [windowTargetId]: The ID of the target definition to remove.
  ///
  /// [safe]: The system checks if the target is being referenced by a task. If
  /// the target is being referenced, the system returns an error and does not
  /// deregister the target from the maintenance window.
  Future<DeregisterTargetFromMaintenanceWindowResult>
      deregisterTargetFromMaintenanceWindow(
          {@required String windowId,
          @required String windowTargetId,
          bool safe}) async {
    return DeregisterTargetFromMaintenanceWindowResult.fromJson({});
  }

  /// Removes a task from a maintenance window.
  ///
  /// [windowId]: The ID of the maintenance window the task should be removed
  /// from.
  ///
  /// [windowTaskId]: The ID of the task to remove from the maintenance window.
  Future<DeregisterTaskFromMaintenanceWindowResult>
      deregisterTaskFromMaintenanceWindow(
          {@required String windowId, @required String windowTaskId}) async {
    return DeregisterTaskFromMaintenanceWindowResult.fromJson({});
  }

  /// Describes details about the activation, such as the date and time the
  /// activation was created, its expiration date, the IAM role assigned to the
  /// instances in the activation, and the number of instances registered by
  /// using this activation.
  ///
  /// [filters]: A filter to view information about your activations.
  ///
  /// [maxResults]: The maximum number of items to return for this call. The
  /// call also returns a token that you can specify in a subsequent call to get
  /// the next set of results.
  ///
  /// [nextToken]: A token to start the list. Use this token to get the next set
  /// of results.
  Future<DescribeActivationsResult> describeActivations(
      {List<DescribeActivationsFilter> filters,
      int maxResults,
      String nextToken}) async {
    return DescribeActivationsResult.fromJson({});
  }

  /// Describes the association for the specified target or instance. If you
  /// created the association by using the `Targets` parameter, then you must
  /// retrieve the association by using the association ID. If you created the
  /// association by specifying an instance ID and a Systems Manager document,
  /// then you retrieve the association by specifying the document name and the
  /// instance ID.
  ///
  /// [name]: The name of the Systems Manager document.
  ///
  /// [instanceId]: The instance ID.
  ///
  /// [associationId]: The association ID for which you want information.
  ///
  /// [associationVersion]: Specify the association version to retrieve. To view
  /// the latest version, either specify `$LATEST` for this parameter, or omit
  /// this parameter. To view a list of all associations for an instance, use
  /// ListAssociations. To get a list of versions for a specific association,
  /// use ListAssociationVersions.
  Future<DescribeAssociationResult> describeAssociation(
      {String name,
      String instanceId,
      String associationId,
      String associationVersion}) async {
    return DescribeAssociationResult.fromJson({});
  }

  /// Use this API action to view information about a specific execution of a
  /// specific association.
  ///
  /// [associationId]: The association ID that includes the execution for which
  /// you want to view details.
  ///
  /// [executionId]: The execution ID for which you want to view details.
  ///
  /// [filters]: Filters for the request. You can specify the following filters
  /// and values.
  ///
  /// Status (EQUAL)
  ///
  /// ResourceId (EQUAL)
  ///
  /// ResourceType (EQUAL)
  ///
  /// [maxResults]: The maximum number of items to return for this call. The
  /// call also returns a token that you can specify in a subsequent call to get
  /// the next set of results.
  ///
  /// [nextToken]: A token to start the list. Use this token to get the next set
  /// of results.
  Future<DescribeAssociationExecutionTargetsResult>
      describeAssociationExecutionTargets(
          {@required String associationId,
          @required String executionId,
          List<AssociationExecutionTargetsFilter> filters,
          int maxResults,
          String nextToken}) async {
    return DescribeAssociationExecutionTargetsResult.fromJson({});
  }

  /// Use this API action to view all executions for a specific association ID.
  ///
  /// [associationId]: The association ID for which you want to view execution
  /// history details.
  ///
  /// [filters]: Filters for the request. You can specify the following filters
  /// and values.
  ///
  /// ExecutionId (EQUAL)
  ///
  /// Status (EQUAL)
  ///
  /// CreatedTime (EQUAL, GREATER_THAN, LESS_THAN)
  ///
  /// [maxResults]: The maximum number of items to return for this call. The
  /// call also returns a token that you can specify in a subsequent call to get
  /// the next set of results.
  ///
  /// [nextToken]: A token to start the list. Use this token to get the next set
  /// of results.
  Future<DescribeAssociationExecutionsResult> describeAssociationExecutions(
      String associationId,
      {List<AssociationExecutionFilter> filters,
      int maxResults,
      String nextToken}) async {
    return DescribeAssociationExecutionsResult.fromJson({});
  }

  /// Provides details about all active and terminated Automation executions.
  ///
  /// [filters]: Filters used to limit the scope of executions that are
  /// requested.
  ///
  /// [maxResults]: The maximum number of items to return for this call. The
  /// call also returns a token that you can specify in a subsequent call to get
  /// the next set of results.
  ///
  /// [nextToken]: The token for the next set of items to return. (You received
  /// this token from a previous call.)
  Future<DescribeAutomationExecutionsResult> describeAutomationExecutions(
      {List<AutomationExecutionFilter> filters,
      int maxResults,
      String nextToken}) async {
    return DescribeAutomationExecutionsResult.fromJson({});
  }

  /// Information about all active and terminated step executions in an
  /// Automation workflow.
  ///
  /// [automationExecutionId]: The Automation execution ID for which you want
  /// step execution descriptions.
  ///
  /// [filters]: One or more filters to limit the number of step executions
  /// returned by the request.
  ///
  /// [nextToken]: The token for the next set of items to return. (You received
  /// this token from a previous call.)
  ///
  /// [maxResults]: The maximum number of items to return for this call. The
  /// call also returns a token that you can specify in a subsequent call to get
  /// the next set of results.
  ///
  /// [reverseOrder]: A boolean that indicates whether to list step executions
  /// in reverse order by start time. The default value is false.
  Future<DescribeAutomationStepExecutionsResult>
      describeAutomationStepExecutions(String automationExecutionId,
          {List<StepExecutionFilter> filters,
          String nextToken,
          int maxResults,
          bool reverseOrder}) async {
    return DescribeAutomationStepExecutionsResult.fromJson({});
  }

  /// Lists all patches eligible to be included in a patch baseline.
  ///
  /// [filters]: Filters used to scope down the returned patches.
  ///
  /// [maxResults]: The maximum number of patches to return (per page).
  ///
  /// [nextToken]: The token for the next set of items to return. (You received
  /// this token from a previous call.)
  Future<DescribeAvailablePatchesResult> describeAvailablePatches(
      {List<PatchOrchestratorFilter> filters,
      int maxResults,
      String nextToken}) async {
    return DescribeAvailablePatchesResult.fromJson({});
  }

  /// Describes the specified Systems Manager document.
  ///
  /// [name]: The name of the Systems Manager document.
  ///
  /// [documentVersion]: The document version for which you want information.
  /// Can be a specific version or the default version.
  ///
  /// [versionName]: An optional field specifying the version of the artifact
  /// associated with the document. For example, "Release 12, Update 6". This
  /// value is unique across all versions of a document, and cannot be changed.
  Future<DescribeDocumentResult> describeDocument(String name,
      {String documentVersion, String versionName}) async {
    return DescribeDocumentResult.fromJson({});
  }

  /// Describes the permissions for a Systems Manager document. If you created
  /// the document, you are the owner. If a document is shared, it can either be
  /// shared privately (by specifying a user's AWS account ID) or publicly
  /// (_All_).
  ///
  /// [name]: The name of the document for which you are the owner.
  ///
  /// [permissionType]: The permission type for the document. The permission
  /// type can be _Share_.
  Future<DescribeDocumentPermissionResponse> describeDocumentPermission(
      {@required String name, @required String permissionType}) async {
    return DescribeDocumentPermissionResponse.fromJson({});
  }

  /// All associations for the instance(s).
  ///
  /// [instanceId]: The instance ID for which you want to view all associations.
  ///
  /// [maxResults]: The maximum number of items to return for this call. The
  /// call also returns a token that you can specify in a subsequent call to get
  /// the next set of results.
  ///
  /// [nextToken]: The token for the next set of items to return. (You received
  /// this token from a previous call.)
  Future<DescribeEffectiveInstanceAssociationsResult>
      describeEffectiveInstanceAssociations(String instanceId,
          {int maxResults, String nextToken}) async {
    return DescribeEffectiveInstanceAssociationsResult.fromJson({});
  }

  /// Retrieves the current effective patches (the patch and the approval state)
  /// for the specified patch baseline. Note that this API applies only to
  /// Windows patch baselines.
  ///
  /// [baselineId]: The ID of the patch baseline to retrieve the effective
  /// patches for.
  ///
  /// [maxResults]: The maximum number of patches to return (per page).
  ///
  /// [nextToken]: The token for the next set of items to return. (You received
  /// this token from a previous call.)
  Future<DescribeEffectivePatchesForPatchBaselineResult>
      describeEffectivePatchesForPatchBaseline(String baselineId,
          {int maxResults, String nextToken}) async {
    return DescribeEffectivePatchesForPatchBaselineResult.fromJson({});
  }

  /// The status of the associations for the instance(s).
  ///
  /// [instanceId]: The instance IDs for which you want association status
  /// information.
  ///
  /// [maxResults]: The maximum number of items to return for this call. The
  /// call also returns a token that you can specify in a subsequent call to get
  /// the next set of results.
  ///
  /// [nextToken]: The token for the next set of items to return. (You received
  /// this token from a previous call.)
  Future<DescribeInstanceAssociationsStatusResult>
      describeInstanceAssociationsStatus(String instanceId,
          {int maxResults, String nextToken}) async {
    return DescribeInstanceAssociationsStatusResult.fromJson({});
  }

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
  ///
  /// [instanceInformationFilterList]: This is a legacy method. We recommend
  /// that you don't use this method. Instead, use the InstanceInformationFilter
  /// action. The `InstanceInformationFilter` action enables you to return
  /// instance information by using tags that are specified as a key-value
  /// mapping.
  ///
  /// If you do use this method, then you can't use the
  /// `InstanceInformationFilter` action. Using this method and the
  /// `InstanceInformationFilter` action causes an exception error.
  ///
  /// [filters]: One or more filters. Use a filter to return a more specific
  /// list of instances. You can filter on Amazon EC2 tag. Specify tags by using
  /// a key-value mapping.
  ///
  /// [maxResults]: The maximum number of items to return for this call. The
  /// call also returns a token that you can specify in a subsequent call to get
  /// the next set of results.
  ///
  /// [nextToken]: The token for the next set of items to return. (You received
  /// this token from a previous call.)
  Future<DescribeInstanceInformationResult> describeInstanceInformation(
      {List<InstanceInformationFilter> instanceInformationFilterList,
      List<InstanceInformationStringFilter> filters,
      int maxResults,
      String nextToken}) async {
    return DescribeInstanceInformationResult.fromJson({});
  }

  /// Retrieves the high-level patch state of one or more instances.
  ///
  /// [instanceIds]: The ID of the instance whose patch state information should
  /// be retrieved.
  ///
  /// [nextToken]: The token for the next set of items to return. (You received
  /// this token from a previous call.)
  ///
  /// [maxResults]: The maximum number of instances to return (per page).
  Future<DescribeInstancePatchStatesResult> describeInstancePatchStates(
      List<String> instanceIds,
      {String nextToken,
      int maxResults}) async {
    return DescribeInstancePatchStatesResult.fromJson({});
  }

  /// Retrieves the high-level patch state for the instances in the specified
  /// patch group.
  ///
  /// [patchGroup]: The name of the patch group for which the patch state
  /// information should be retrieved.
  ///
  /// [filters]: Each entry in the array is a structure containing:
  ///
  /// Key (string between 1 and 200 characters)
  ///
  ///  Values (array containing a single string)
  ///
  ///  Type (string "Equal", "NotEqual", "LessThan", "GreaterThan")
  ///
  /// [nextToken]: The token for the next set of items to return. (You received
  /// this token from a previous call.)
  ///
  /// [maxResults]: The maximum number of patches to return (per page).
  Future<DescribeInstancePatchStatesForPatchGroupResult>
      describeInstancePatchStatesForPatchGroup(String patchGroup,
          {List<InstancePatchStateFilter> filters,
          String nextToken,
          int maxResults}) async {
    return DescribeInstancePatchStatesForPatchGroupResult.fromJson({});
  }

  /// Retrieves information about the patches on the specified instance and
  /// their state relative to the patch baseline being used for the instance.
  ///
  /// [instanceId]: The ID of the instance whose patch state information should
  /// be retrieved.
  ///
  /// [filters]: An array of structures. Each entry in the array is a structure
  /// containing a Key, Value combination. Valid values for Key are
  /// `Classification` | `KBId` | `Severity` | `State`.
  ///
  /// [nextToken]: The token for the next set of items to return. (You received
  /// this token from a previous call.)
  ///
  /// [maxResults]: The maximum number of patches to return (per page).
  Future<DescribeInstancePatchesResult> describeInstancePatches(
      String instanceId,
      {List<PatchOrchestratorFilter> filters,
      String nextToken,
      int maxResults}) async {
    return DescribeInstancePatchesResult.fromJson({});
  }

  /// Describes a specific delete inventory operation.
  ///
  /// [deletionId]: Specify the delete inventory ID for which you want
  /// information. This ID was returned by the `DeleteInventory` action.
  ///
  /// [nextToken]: A token to start the list. Use this token to get the next set
  /// of results.
  ///
  /// [maxResults]: The maximum number of items to return for this call. The
  /// call also returns a token that you can specify in a subsequent call to get
  /// the next set of results.
  Future<DescribeInventoryDeletionsResult> describeInventoryDeletions(
      {String deletionId, String nextToken, int maxResults}) async {
    return DescribeInventoryDeletionsResult.fromJson({});
  }

  /// Retrieves the individual task executions (one per target) for a particular
  /// task run as part of a maintenance window execution.
  ///
  /// [windowExecutionId]: The ID of the maintenance window execution the task
  /// is part of.
  ///
  /// [taskId]: The ID of the specific task in the maintenance window task that
  /// should be retrieved.
  ///
  /// [filters]: Optional filters used to scope down the returned task
  /// invocations. The supported filter key is STATUS with the corresponding
  /// values PENDING, IN_PROGRESS, SUCCESS, FAILED, TIMED_OUT, CANCELLING, and
  /// CANCELLED.
  ///
  /// [maxResults]: The maximum number of items to return for this call. The
  /// call also returns a token that you can specify in a subsequent call to get
  /// the next set of results.
  ///
  /// [nextToken]: The token for the next set of items to return. (You received
  /// this token from a previous call.)
  Future<DescribeMaintenanceWindowExecutionTaskInvocationsResult>
      describeMaintenanceWindowExecutionTaskInvocations(
          {@required String windowExecutionId,
          @required String taskId,
          List<MaintenanceWindowFilter> filters,
          int maxResults,
          String nextToken}) async {
    return DescribeMaintenanceWindowExecutionTaskInvocationsResult.fromJson({});
  }

  /// For a given maintenance window execution, lists the tasks that were run.
  ///
  /// [windowExecutionId]: The ID of the maintenance window execution whose task
  /// executions should be retrieved.
  ///
  /// [filters]: Optional filters used to scope down the returned tasks. The
  /// supported filter key is STATUS with the corresponding values PENDING,
  /// IN_PROGRESS, SUCCESS, FAILED, TIMED_OUT, CANCELLING, and CANCELLED.
  ///
  /// [maxResults]: The maximum number of items to return for this call. The
  /// call also returns a token that you can specify in a subsequent call to get
  /// the next set of results.
  ///
  /// [nextToken]: The token for the next set of items to return. (You received
  /// this token from a previous call.)
  Future<DescribeMaintenanceWindowExecutionTasksResult>
      describeMaintenanceWindowExecutionTasks(String windowExecutionId,
          {List<MaintenanceWindowFilter> filters,
          int maxResults,
          String nextToken}) async {
    return DescribeMaintenanceWindowExecutionTasksResult.fromJson({});
  }

  /// Lists the executions of a maintenance window. This includes information
  /// about when the maintenance window was scheduled to be active, and
  /// information about tasks registered and run with the maintenance window.
  ///
  /// [windowId]: The ID of the maintenance window whose executions should be
  /// retrieved.
  ///
  /// [filters]: Each entry in the array is a structure containing:
  ///
  /// Key (string, between 1 and 128 characters)
  ///
  /// Values (array of strings, each string is between 1 and 256 characters)
  ///
  /// The supported Keys are ExecutedBefore and ExecutedAfter with the value
  /// being a date/time string such as 2016-11-04T05:00:00Z.
  ///
  /// [maxResults]: The maximum number of items to return for this call. The
  /// call also returns a token that you can specify in a subsequent call to get
  /// the next set of results.
  ///
  /// [nextToken]: The token for the next set of items to return. (You received
  /// this token from a previous call.)
  Future<DescribeMaintenanceWindowExecutionsResult>
      describeMaintenanceWindowExecutions(String windowId,
          {List<MaintenanceWindowFilter> filters,
          int maxResults,
          String nextToken}) async {
    return DescribeMaintenanceWindowExecutionsResult.fromJson({});
  }

  /// Retrieves information about upcoming executions of a maintenance window.
  ///
  /// [windowId]: The ID of the maintenance window to retrieve information
  /// about.
  ///
  /// [targets]: The instance ID or key/value pair to retrieve information
  /// about.
  ///
  /// [resourceType]: The type of resource you want to retrieve information
  /// about. For example, "INSTANCE".
  ///
  /// [filters]: Filters used to limit the range of results. For example, you
  /// can limit maintenance window executions to only those scheduled before or
  /// after a certain date and time.
  ///
  /// [maxResults]: The maximum number of items to return for this call. The
  /// call also returns a token that you can specify in a subsequent call to get
  /// the next set of results.
  ///
  /// [nextToken]: The token for the next set of items to return. (You received
  /// this token from a previous call.)
  Future<DescribeMaintenanceWindowScheduleResult>
      describeMaintenanceWindowSchedule(
          {String windowId,
          List<Target> targets,
          String resourceType,
          List<PatchOrchestratorFilter> filters,
          int maxResults,
          String nextToken}) async {
    return DescribeMaintenanceWindowScheduleResult.fromJson({});
  }

  /// Lists the targets registered with the maintenance window.
  ///
  /// [windowId]: The ID of the maintenance window whose targets should be
  /// retrieved.
  ///
  /// [filters]: Optional filters that can be used to narrow down the scope of
  /// the returned window targets. The supported filter keys are Type,
  /// WindowTargetId and OwnerInformation.
  ///
  /// [maxResults]: The maximum number of items to return for this call. The
  /// call also returns a token that you can specify in a subsequent call to get
  /// the next set of results.
  ///
  /// [nextToken]: The token for the next set of items to return. (You received
  /// this token from a previous call.)
  Future<DescribeMaintenanceWindowTargetsResult>
      describeMaintenanceWindowTargets(String windowId,
          {List<MaintenanceWindowFilter> filters,
          int maxResults,
          String nextToken}) async {
    return DescribeMaintenanceWindowTargetsResult.fromJson({});
  }

  /// Lists the tasks in a maintenance window.
  ///
  /// [windowId]: The ID of the maintenance window whose tasks should be
  /// retrieved.
  ///
  /// [filters]: Optional filters used to narrow down the scope of the returned
  /// tasks. The supported filter keys are WindowTaskId, TaskArn, Priority, and
  /// TaskType.
  ///
  /// [maxResults]: The maximum number of items to return for this call. The
  /// call also returns a token that you can specify in a subsequent call to get
  /// the next set of results.
  ///
  /// [nextToken]: The token for the next set of items to return. (You received
  /// this token from a previous call.)
  Future<DescribeMaintenanceWindowTasksResult> describeMaintenanceWindowTasks(
      String windowId,
      {List<MaintenanceWindowFilter> filters,
      int maxResults,
      String nextToken}) async {
    return DescribeMaintenanceWindowTasksResult.fromJson({});
  }

  /// Retrieves the maintenance windows in an AWS account.
  ///
  /// [filters]: Optional filters used to narrow down the scope of the returned
  /// maintenance windows. Supported filter keys are **Name** and **Enabled**.
  ///
  /// [maxResults]: The maximum number of items to return for this call. The
  /// call also returns a token that you can specify in a subsequent call to get
  /// the next set of results.
  ///
  /// [nextToken]: The token for the next set of items to return. (You received
  /// this token from a previous call.)
  Future<DescribeMaintenanceWindowsResult> describeMaintenanceWindows(
      {List<MaintenanceWindowFilter> filters,
      int maxResults,
      String nextToken}) async {
    return DescribeMaintenanceWindowsResult.fromJson({});
  }

  /// Retrieves information about the maintenance window targets or tasks that
  /// an instance is associated with.
  ///
  /// [targets]: The instance ID or key/value pair to retrieve information
  /// about.
  ///
  /// [resourceType]: The type of resource you want to retrieve information
  /// about. For example, "INSTANCE".
  ///
  /// [maxResults]: The maximum number of items to return for this call. The
  /// call also returns a token that you can specify in a subsequent call to get
  /// the next set of results.
  ///
  /// [nextToken]: The token for the next set of items to return. (You received
  /// this token from a previous call.)
  Future<DescribeMaintenanceWindowsForTargetResult>
      describeMaintenanceWindowsForTarget(
          {@required List<Target> targets,
          @required String resourceType,
          int maxResults,
          String nextToken}) async {
    return DescribeMaintenanceWindowsForTargetResult.fromJson({});
  }

  /// Query a set of OpsItems. You must have permission in AWS Identity and
  /// Access Management (IAM) to query a list of OpsItems. For more information,
  /// see
  /// [Getting Started with OpsCenter](http://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-getting-started.html)
  /// in the _AWS Systems Manager User Guide_.
  ///
  /// Operations engineers and IT professionals use OpsCenter to view,
  /// investigate, and remediate operational issues impacting the performance
  /// and health of their AWS resources. For more information, see
  /// [AWS Systems Manager OpsCenter](http://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html)
  /// in the _AWS Systems Manager User Guide_.
  ///
  /// [opsItemFilters]: One or more filters to limit the reponse.
  ///
  /// *   Key: CreatedTime
  ///
  ///     Operations: GreaterThan, LessThan
  ///
  /// *   Key: LastModifiedBy
  ///
  ///     Operations: Contains, Equals
  ///
  /// *   Key: LastModifiedTime
  ///
  ///     Operations: GreaterThan, LessThan
  ///
  /// *   Key: Priority
  ///
  ///     Operations: Equals
  ///
  /// *   Key: Source
  ///
  ///     Operations: Contains, Equals
  ///
  /// *   Key: Status
  ///
  ///     Operations: Equals
  ///
  /// *   Key: Title
  ///
  ///     Operations: Contains
  ///
  /// *   Key: OperationalData*
  ///
  ///     Operations: Equals
  ///
  /// *   Key: OperationalDataKey
  ///
  ///     Operations: Equals
  ///
  /// *   Key: OperationalDataValue
  ///
  ///     Operations: Equals, Contains
  ///
  /// *   Key: OpsItemId
  ///
  ///     Operations: Equals
  ///
  /// *   Key: ResourceId
  ///
  ///     Operations: Contains
  ///
  /// *   Key: AutomationId
  ///
  ///     Operations: Equals
  ///
  ///
  /// *If you filter the response by using the OperationalData operator, specify
  /// a key-value pair by using the following JSON format:
  /// {"key":"key_name","value":"a_value"}
  ///
  /// [maxResults]: The maximum number of items to return for this call. The
  /// call also returns a token that you can specify in a subsequent call to get
  /// the next set of results.
  ///
  /// [nextToken]: A token to start the list. Use this token to get the next set
  /// of results.
  Future<DescribeOpsItemsResponse> describeOpsItems(
      {List<OpsItemFilter> opsItemFilters,
      int maxResults,
      String nextToken}) async {
    return DescribeOpsItemsResponse.fromJson({});
  }

  /// Get information about a parameter.
  ///
  /// Request results are returned on a best-effort basis. If you specify
  /// `MaxResults` in the request, the response includes information up to the
  /// limit specified. The number of items returned, however, can be between
  /// zero and the value of `MaxResults`. If the service reaches an internal
  /// limit while processing the results, it stops the operation and returns the
  /// matching values up to that point and a `NextToken`. You can specify the
  /// `NextToken` in a subsequent call to get the next set of results.
  ///
  /// [filters]: One or more filters. Use a filter to return a more specific
  /// list of results.
  ///
  /// [parameterFilters]: Filters to limit the request results.
  ///
  /// [maxResults]: The maximum number of items to return for this call. The
  /// call also returns a token that you can specify in a subsequent call to get
  /// the next set of results.
  ///
  /// [nextToken]: The token for the next set of items to return. (You received
  /// this token from a previous call.)
  Future<DescribeParametersResult> describeParameters(
      {List<ParametersFilter> filters,
      List<ParameterStringFilter> parameterFilters,
      int maxResults,
      String nextToken}) async {
    return DescribeParametersResult.fromJson({});
  }

  /// Lists the patch baselines in your AWS account.
  ///
  /// [filters]: Each element in the array is a structure containing:
  ///
  /// Key: (string, "NAME_PREFIX" or "OWNER")
  ///
  /// Value: (array of strings, exactly 1 entry, between 1 and 255 characters)
  ///
  /// [maxResults]: The maximum number of patch baselines to return (per page).
  ///
  /// [nextToken]: The token for the next set of items to return. (You received
  /// this token from a previous call.)
  Future<DescribePatchBaselinesResult> describePatchBaselines(
      {List<PatchOrchestratorFilter> filters,
      int maxResults,
      String nextToken}) async {
    return DescribePatchBaselinesResult.fromJson({});
  }

  /// Returns high-level aggregated patch compliance state for a patch group.
  ///
  /// [patchGroup]: The name of the patch group whose patch snapshot should be
  /// retrieved.
  Future<DescribePatchGroupStateResult> describePatchGroupState(
      String patchGroup) async {
    return DescribePatchGroupStateResult.fromJson({});
  }

  /// Lists all patch groups that have been registered with patch baselines.
  ///
  /// [maxResults]: The maximum number of patch groups to return (per page).
  ///
  /// [filters]: One or more filters. Use a filter to return a more specific
  /// list of results.
  ///
  /// [nextToken]: The token for the next set of items to return. (You received
  /// this token from a previous call.)
  Future<DescribePatchGroupsResult> describePatchGroups(
      {int maxResults,
      List<PatchOrchestratorFilter> filters,
      String nextToken}) async {
    return DescribePatchGroupsResult.fromJson({});
  }

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
  /// Valid properties: PRODUCT, PRODUCT_FAMILY, CLASSIFICATION, MSRC_SEVERITY
  ///
  /// AMAZON_LINUX
  ///
  /// Valid properties: PRODUCT, CLASSIFICATION, SEVERITY
  ///
  /// AMAZON_LINUX_2
  ///
  /// Valid properties: PRODUCT, CLASSIFICATION, SEVERITY
  ///
  /// UBUNTU
  ///
  /// Valid properties: PRODUCT, PRIORITY
  ///
  /// REDHAT_ENTERPRISE_LINUX
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
  ///
  /// [operatingSystem]: The operating system type for which to list patches.
  ///
  /// [property]: The patch property for which you want to view patch details.
  ///
  /// [patchSet]: Indicates whether to list patches for the Windows operating
  /// system or for Microsoft applications. Not applicable for Linux operating
  /// systems.
  ///
  /// [maxResults]: The maximum number of items to return for this call. The
  /// call also returns a token that you can specify in a subsequent call to get
  /// the next set of results.
  ///
  /// [nextToken]: The token for the next set of items to return. (You received
  /// this token from a previous call.)
  Future<DescribePatchPropertiesResult> describePatchProperties(
      {@required String operatingSystem,
      @required String property,
      String patchSet,
      int maxResults,
      String nextToken}) async {
    return DescribePatchPropertiesResult.fromJson({});
  }

  /// Retrieves a list of all active sessions (both connected and disconnected)
  /// or terminated sessions from the past 30 days.
  ///
  /// [state]: The session status to retrieve a list of sessions for. For
  /// example, "Active".
  ///
  /// [maxResults]: The maximum number of items to return for this call. The
  /// call also returns a token that you can specify in a subsequent call to get
  /// the next set of results.
  ///
  /// [nextToken]: The token for the next set of items to return. (You received
  /// this token from a previous call.)
  ///
  /// [filters]: One or more filters to limit the type of sessions returned by
  /// the request.
  Future<DescribeSessionsResponse> describeSessions(String state,
      {int maxResults, String nextToken, List<SessionFilter> filters}) async {
    return DescribeSessionsResponse.fromJson({});
  }

  /// Get detailed information about a particular Automation execution.
  ///
  /// [automationExecutionId]: The unique identifier for an existing automation
  /// execution to examine. The execution ID is returned by
  /// StartAutomationExecution when the execution of an Automation document is
  /// initiated.
  Future<GetAutomationExecutionResult> getAutomationExecution(
      String automationExecutionId) async {
    return GetAutomationExecutionResult.fromJson({});
  }

  /// Returns detailed information about command execution for an invocation or
  /// plugin.
  ///
  /// [commandId]: (Required) The parent command ID of the invocation plugin.
  ///
  /// [instanceId]: (Required) The ID of the managed instance targeted by the
  /// command. A managed instance can be an Amazon EC2 instance or an instance
  /// in your hybrid environment that is configured for Systems Manager.
  ///
  /// [pluginName]: (Optional) The name of the plugin for which you want
  /// detailed results. If the document contains only one plugin, the name can
  /// be omitted and the details will be returned.
  Future<GetCommandInvocationResult> getCommandInvocation(
      {@required String commandId,
      @required String instanceId,
      String pluginName}) async {
    return GetCommandInvocationResult.fromJson({});
  }

  /// Retrieves the Session Manager connection status for an instance to
  /// determine whether it is connected and ready to receive Session Manager
  /// connections.
  ///
  /// [target]: The ID of the instance.
  Future<GetConnectionStatusResponse> getConnectionStatus(String target) async {
    return GetConnectionStatusResponse.fromJson({});
  }

  /// Retrieves the default patch baseline. Note that Systems Manager supports
  /// creating multiple default patch baselines. For example, you can create a
  /// default patch baseline for each operating system.
  ///
  /// If you do not specify an operating system value, the default patch
  /// baseline for Windows is returned.
  ///
  /// [operatingSystem]: Returns the default patch baseline for the specified
  /// operating system.
  Future<GetDefaultPatchBaselineResult> getDefaultPatchBaseline(
      {String operatingSystem}) async {
    return GetDefaultPatchBaselineResult.fromJson({});
  }

  /// Retrieves the current snapshot for the patch baseline the instance uses.
  /// This API is primarily used by the AWS-RunPatchBaseline Systems Manager
  /// document.
  ///
  /// [instanceId]: The ID of the instance for which the appropriate patch
  /// snapshot should be retrieved.
  ///
  /// [snapshotId]: The user-defined snapshot ID.
  Future<GetDeployablePatchSnapshotForInstanceResult>
      getDeployablePatchSnapshotForInstance(
          {@required String instanceId, @required String snapshotId}) async {
    return GetDeployablePatchSnapshotForInstanceResult.fromJson({});
  }

  /// Gets the contents of the specified Systems Manager document.
  ///
  /// [name]: The name of the Systems Manager document.
  ///
  /// [versionName]: An optional field specifying the version of the artifact
  /// associated with the document. For example, "Release 12, Update 6". This
  /// value is unique across all versions of a document, and cannot be changed.
  ///
  /// [documentVersion]: The document version for which you want information.
  ///
  /// [documentFormat]: Returns the document in the specified format. The
  /// document format can be either JSON or YAML. JSON is the default format.
  Future<GetDocumentResult> getDocument(String name,
      {String versionName,
      String documentVersion,
      String documentFormat}) async {
    return GetDocumentResult.fromJson({});
  }

  /// Query inventory information.
  ///
  /// [filters]: One or more filters. Use a filter to return a more specific
  /// list of results.
  ///
  /// [aggregators]: Returns counts of inventory types based on one or more
  /// expressions. For example, if you aggregate by using an expression that
  /// uses the `AWS:InstanceInformation.PlatformType` type, you can see a count
  /// of how many Windows and Linux instances exist in your inventoried fleet.
  ///
  /// [resultAttributes]: The list of inventory item types to return.
  ///
  /// [nextToken]: The token for the next set of items to return. (You received
  /// this token from a previous call.)
  ///
  /// [maxResults]: The maximum number of items to return for this call. The
  /// call also returns a token that you can specify in a subsequent call to get
  /// the next set of results.
  Future<GetInventoryResult> getInventory(
      {List<InventoryFilter> filters,
      List<InventoryAggregator> aggregators,
      List<ResultAttribute> resultAttributes,
      String nextToken,
      int maxResults}) async {
    return GetInventoryResult.fromJson({});
  }

  /// Return a list of inventory type names for the account, or return a list of
  /// attribute names for a specific Inventory item type.
  ///
  /// [typeName]: The type of inventory item to return.
  ///
  /// [nextToken]: The token for the next set of items to return. (You received
  /// this token from a previous call.)
  ///
  /// [maxResults]: The maximum number of items to return for this call. The
  /// call also returns a token that you can specify in a subsequent call to get
  /// the next set of results.
  ///
  /// [aggregator]: Returns inventory schemas that support aggregation. For
  /// example, this call returns the `AWS:InstanceInformation` type, because it
  /// supports aggregation based on the `PlatformName`, `PlatformType`, and
  /// `PlatformVersion` attributes.
  ///
  /// [subType]: Returns the sub-type schema for a specified inventory type.
  Future<GetInventorySchemaResult> getInventorySchema(
      {String typeName,
      String nextToken,
      int maxResults,
      bool aggregator,
      bool subType}) async {
    return GetInventorySchemaResult.fromJson({});
  }

  /// Retrieves a maintenance window.
  ///
  /// [windowId]: The ID of the maintenance window for which you want to
  /// retrieve information.
  Future<GetMaintenanceWindowResult> getMaintenanceWindow(
      String windowId) async {
    return GetMaintenanceWindowResult.fromJson({});
  }

  /// Retrieves details about a specific a maintenance window execution.
  ///
  /// [windowExecutionId]: The ID of the maintenance window execution that
  /// includes the task.
  Future<GetMaintenanceWindowExecutionResult> getMaintenanceWindowExecution(
      String windowExecutionId) async {
    return GetMaintenanceWindowExecutionResult.fromJson({});
  }

  /// Retrieves the details about a specific task run as part of a maintenance
  /// window execution.
  ///
  /// [windowExecutionId]: The ID of the maintenance window execution that
  /// includes the task.
  ///
  /// [taskId]: The ID of the specific task execution in the maintenance window
  /// task that should be retrieved.
  Future<GetMaintenanceWindowExecutionTaskResult>
      getMaintenanceWindowExecutionTask(
          {@required String windowExecutionId, @required String taskId}) async {
    return GetMaintenanceWindowExecutionTaskResult.fromJson({});
  }

  /// Retrieves information about a specific task running on a specific target.
  ///
  /// [windowExecutionId]: The ID of the maintenance window execution for which
  /// the task is a part.
  ///
  /// [taskId]: The ID of the specific task in the maintenance window task that
  /// should be retrieved.
  ///
  /// [invocationId]: The invocation ID to retrieve.
  Future<GetMaintenanceWindowExecutionTaskInvocationResult>
      getMaintenanceWindowExecutionTaskInvocation(
          {@required String windowExecutionId,
          @required String taskId,
          @required String invocationId}) async {
    return GetMaintenanceWindowExecutionTaskInvocationResult.fromJson({});
  }

  /// Lists the tasks in a maintenance window.
  ///
  /// [windowId]: The maintenance window ID that includes the task to retrieve.
  ///
  /// [windowTaskId]: The maintenance window task ID to retrieve.
  Future<GetMaintenanceWindowTaskResult> getMaintenanceWindowTask(
      {@required String windowId, @required String windowTaskId}) async {
    return GetMaintenanceWindowTaskResult.fromJson({});
  }

  /// Get information about an OpsItem by using the ID. You must have permission
  /// in AWS Identity and Access Management (IAM) to view information about an
  /// OpsItem. For more information, see
  /// [Getting Started with OpsCenter](http://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-getting-started.html)
  /// in the _AWS Systems Manager User Guide_.
  ///
  /// Operations engineers and IT professionals use OpsCenter to view,
  /// investigate, and remediate operational issues impacting the performance
  /// and health of their AWS resources. For more information, see
  /// [AWS Systems Manager OpsCenter](http://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html)
  /// in the _AWS Systems Manager User Guide_.
  ///
  /// [opsItemId]: The ID of the OpsItem that you want to get.
  Future<GetOpsItemResponse> getOpsItem(String opsItemId) async {
    return GetOpsItemResponse.fromJson({});
  }

  /// View a summary of OpsItems based on specified filters and aggregators.
  ///
  /// [filters]: Optional filters used to scope down the returned OpsItems.
  ///
  /// [aggregators]: Optional aggregators that return counts of OpsItems based
  /// on one or more expressions.
  ///
  /// [nextToken]: A token to start the list. Use this token to get the next set
  /// of results.
  ///
  /// [maxResults]: The maximum number of items to return for this call. The
  /// call also returns a token that you can specify in a subsequent call to get
  /// the next set of results.
  Future<GetOpsSummaryResult> getOpsSummary(List<OpsAggregator> aggregators,
      {List<OpsFilter> filters, String nextToken, int maxResults}) async {
    return GetOpsSummaryResult.fromJson({});
  }

  /// Get information about a parameter by using the parameter name. Don't
  /// confuse this API action with the GetParameters API action.
  ///
  /// [name]: The name of the parameter you want to query.
  ///
  /// [withDecryption]: Return decrypted values for secure string parameters.
  /// This flag is ignored for String and StringList parameter types.
  Future<GetParameterResult> getParameter(String name,
      {bool withDecryption}) async {
    return GetParameterResult.fromJson({});
  }

  /// Query a list of all parameters used by the AWS account.
  ///
  /// [name]: The name of a parameter you want to query.
  ///
  /// [withDecryption]: Return decrypted values for secure string parameters.
  /// This flag is ignored for String and StringList parameter types.
  ///
  /// [maxResults]: The maximum number of items to return for this call. The
  /// call also returns a token that you can specify in a subsequent call to get
  /// the next set of results.
  ///
  /// [nextToken]: The token for the next set of items to return. (You received
  /// this token from a previous call.)
  Future<GetParameterHistoryResult> getParameterHistory(String name,
      {bool withDecryption, int maxResults, String nextToken}) async {
    return GetParameterHistoryResult.fromJson({});
  }

  /// Get details of a parameter. Don't confuse this API action with the
  /// GetParameter API action.
  ///
  /// [names]: Names of the parameters for which you want to query information.
  ///
  /// [withDecryption]: Return decrypted secure string value. Return decrypted
  /// values for secure string parameters. This flag is ignored for String and
  /// StringList parameter types.
  Future<GetParametersResult> getParameters(List<String> names,
      {bool withDecryption}) async {
    return GetParametersResult.fromJson({});
  }

  /// Retrieve parameters in a specific hierarchy. For more information, see
  /// [Working with Systems Manager Parameters](http://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-paramstore-working.html)
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
  ///
  /// [path]: The hierarchy for the parameter. Hierarchies start with a forward
  /// slash (/) and end with the parameter name. A parameter name hierarchy can
  /// have a maximum of 15 levels. Here is an example of a hierarchy:
  /// `/Finance/Prod/IAD/WinServ2016/license33`
  ///
  /// [recursive]: Retrieve all parameters within a hierarchy.
  ///
  ///
  ///
  /// If a user has access to a path, then the user can access all levels of
  /// that path. For example, if a user has permission to access path `/a`, then
  /// the user can also access `/a/b`. Even if a user has explicitly been denied
  /// access in IAM for parameter `/a/b`, they can still call the
  /// GetParametersByPath API action recursively for `/a` and view `/a/b`.
  ///
  /// [parameterFilters]: Filters to limit the request results.
  ///
  ///
  ///
  /// You can't filter using the parameter name.
  ///
  /// [withDecryption]: Retrieve all parameters in a hierarchy with their value
  /// decrypted.
  ///
  /// [maxResults]: The maximum number of items to return for this call. The
  /// call also returns a token that you can specify in a subsequent call to get
  /// the next set of results.
  ///
  /// [nextToken]: A token to start the list. Use this token to get the next set
  /// of results.
  Future<GetParametersByPathResult> getParametersByPath(String path,
      {bool recursive,
      List<ParameterStringFilter> parameterFilters,
      bool withDecryption,
      int maxResults,
      String nextToken}) async {
    return GetParametersByPathResult.fromJson({});
  }

  /// Retrieves information about a patch baseline.
  ///
  /// [baselineId]: The ID of the patch baseline to retrieve.
  Future<GetPatchBaselineResult> getPatchBaseline(String baselineId) async {
    return GetPatchBaselineResult.fromJson({});
  }

  /// Retrieves the patch baseline that should be used for the specified patch
  /// group.
  ///
  /// [patchGroup]: The name of the patch group whose patch baseline should be
  /// retrieved.
  ///
  /// [operatingSystem]: Returns he operating system rule specified for patch
  /// groups using the patch baseline.
  Future<GetPatchBaselineForPatchGroupResult> getPatchBaselineForPatchGroup(
      String patchGroup,
      {String operatingSystem}) async {
    return GetPatchBaselineForPatchGroupResult.fromJson({});
  }

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
  ///
  /// [settingId]: The ID of the service setting to get.
  Future<GetServiceSettingResult> getServiceSetting(String settingId) async {
    return GetServiceSettingResult.fromJson({});
  }

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
  ///
  /// [name]: The parameter name on which you want to attach one or more labels.
  ///
  /// [parameterVersion]: The specific version of the parameter on which you
  /// want to attach one or more labels. If no version is specified, the system
  /// attaches the label to the latest version.)
  ///
  /// [labels]: One or more labels to attach to the specified parameter version.
  Future<LabelParameterVersionResult> labelParameterVersion(
      {@required String name,
      BigInt parameterVersion,
      @required List<String> labels}) async {
    return LabelParameterVersionResult.fromJson({});
  }

  /// Retrieves all versions of an association for a specific association ID.
  ///
  /// [associationId]: The association ID for which you want to view all
  /// versions.
  ///
  /// [maxResults]: The maximum number of items to return for this call. The
  /// call also returns a token that you can specify in a subsequent call to get
  /// the next set of results.
  ///
  /// [nextToken]: A token to start the list. Use this token to get the next set
  /// of results.
  Future<ListAssociationVersionsResult> listAssociationVersions(
      String associationId,
      {int maxResults,
      String nextToken}) async {
    return ListAssociationVersionsResult.fromJson({});
  }

  /// Lists the associations for the specified Systems Manager document or
  /// instance.
  ///
  /// [associationFilterList]: One or more filters. Use a filter to return a
  /// more specific list of results.
  ///
  /// [maxResults]: The maximum number of items to return for this call. The
  /// call also returns a token that you can specify in a subsequent call to get
  /// the next set of results.
  ///
  /// [nextToken]: The token for the next set of items to return. (You received
  /// this token from a previous call.)
  Future<ListAssociationsResult> listAssociations(
      {List<AssociationFilter> associationFilterList,
      int maxResults,
      String nextToken}) async {
    return ListAssociationsResult.fromJson({});
  }

  /// An invocation is copy of a command sent to a specific instance. A command
  /// can apply to one or more instances. A command invocation applies to one
  /// instance. For example, if a user runs SendCommand against three instances,
  /// then a command invocation is created for each requested instance ID.
  /// ListCommandInvocations provide status about command execution.
  ///
  /// [commandId]: (Optional) The invocations for a specific command ID.
  ///
  /// [instanceId]: (Optional) The command execution details for a specific
  /// instance ID.
  ///
  /// [maxResults]: (Optional) The maximum number of items to return for this
  /// call. The call also returns a token that you can specify in a subsequent
  /// call to get the next set of results.
  ///
  /// [nextToken]: (Optional) The token for the next set of items to return.
  /// (You received this token from a previous call.)
  ///
  /// [filters]: (Optional) One or more filters. Use a filter to return a more
  /// specific list of results.
  ///
  /// [details]: (Optional) If set this returns the response of the command
  /// executions and any command output. By default this is set to False.
  Future<ListCommandInvocationsResult> listCommandInvocations(
      {String commandId,
      String instanceId,
      int maxResults,
      String nextToken,
      List<CommandFilter> filters,
      bool details}) async {
    return ListCommandInvocationsResult.fromJson({});
  }

  /// Lists the commands requested by users of the AWS account.
  ///
  /// [commandId]: (Optional) If provided, lists only the specified command.
  ///
  /// [instanceId]: (Optional) Lists commands issued against this instance ID.
  ///
  /// [maxResults]: (Optional) The maximum number of items to return for this
  /// call. The call also returns a token that you can specify in a subsequent
  /// call to get the next set of results.
  ///
  /// [nextToken]: (Optional) The token for the next set of items to return.
  /// (You received this token from a previous call.)
  ///
  /// [filters]: (Optional) One or more filters. Use a filter to return a more
  /// specific list of results.
  Future<ListCommandsResult> listCommands(
      {String commandId,
      String instanceId,
      int maxResults,
      String nextToken,
      List<CommandFilter> filters}) async {
    return ListCommandsResult.fromJson({});
  }

  /// For a specified resource ID, this API action returns a list of compliance
  /// statuses for different resource types. Currently, you can only specify one
  /// resource ID per call. List results depend on the criteria specified in the
  /// filter.
  ///
  /// [filters]: One or more compliance filters. Use a filter to return a more
  /// specific list of results.
  ///
  /// [resourceIds]: The ID for the resources from which to get compliance
  /// information. Currently, you can only specify one resource ID.
  ///
  /// [resourceTypes]: The type of resource from which to get compliance
  /// information. Currently, the only supported resource type is
  /// `ManagedInstance`.
  ///
  /// [nextToken]: A token to start the list. Use this token to get the next set
  /// of results.
  ///
  /// [maxResults]: The maximum number of items to return for this call. The
  /// call also returns a token that you can specify in a subsequent call to get
  /// the next set of results.
  Future<ListComplianceItemsResult> listComplianceItems(
      {List<ComplianceStringFilter> filters,
      List<String> resourceIds,
      List<String> resourceTypes,
      String nextToken,
      int maxResults}) async {
    return ListComplianceItemsResult.fromJson({});
  }

  /// Returns a summary count of compliant and non-compliant resources for a
  /// compliance type. For example, this call can return State Manager
  /// associations, patches, or custom compliance types according to the filter
  /// criteria that you specify.
  ///
  /// [filters]: One or more compliance or inventory filters. Use a filter to
  /// return a more specific list of results.
  ///
  /// [nextToken]: A token to start the list. Use this token to get the next set
  /// of results.
  ///
  /// [maxResults]: The maximum number of items to return for this call.
  /// Currently, you can specify null or 50. The call also returns a token that
  /// you can specify in a subsequent call to get the next set of results.
  Future<ListComplianceSummariesResult> listComplianceSummaries(
      {List<ComplianceStringFilter> filters,
      String nextToken,
      int maxResults}) async {
    return ListComplianceSummariesResult.fromJson({});
  }

  /// List all versions for a document.
  ///
  /// [name]: The name of the document about which you want version information.
  ///
  /// [maxResults]: The maximum number of items to return for this call. The
  /// call also returns a token that you can specify in a subsequent call to get
  /// the next set of results.
  ///
  /// [nextToken]: The token for the next set of items to return. (You received
  /// this token from a previous call.)
  Future<ListDocumentVersionsResult> listDocumentVersions(String name,
      {int maxResults, String nextToken}) async {
    return ListDocumentVersionsResult.fromJson({});
  }

  /// Describes one or more of your Systems Manager documents.
  ///
  /// [documentFilterList]: One or more filters. Use a filter to return a more
  /// specific list of results.
  ///
  /// [filters]: One or more filters. Use a filter to return a more specific
  /// list of results.
  ///
  /// [maxResults]: The maximum number of items to return for this call. The
  /// call also returns a token that you can specify in a subsequent call to get
  /// the next set of results.
  ///
  /// [nextToken]: The token for the next set of items to return. (You received
  /// this token from a previous call.)
  Future<ListDocumentsResult> listDocuments(
      {List<DocumentFilter> documentFilterList,
      List<DocumentKeyValuesFilter> filters,
      int maxResults,
      String nextToken}) async {
    return ListDocumentsResult.fromJson({});
  }

  /// A list of inventory items returned by the request.
  ///
  /// [instanceId]: The instance ID for which you want inventory information.
  ///
  /// [typeName]: The type of inventory item for which you want information.
  ///
  /// [filters]: One or more filters. Use a filter to return a more specific
  /// list of results.
  ///
  /// [nextToken]: The token for the next set of items to return. (You received
  /// this token from a previous call.)
  ///
  /// [maxResults]: The maximum number of items to return for this call. The
  /// call also returns a token that you can specify in a subsequent call to get
  /// the next set of results.
  Future<ListInventoryEntriesResult> listInventoryEntries(
      {@required String instanceId,
      @required String typeName,
      List<InventoryFilter> filters,
      String nextToken,
      int maxResults}) async {
    return ListInventoryEntriesResult.fromJson({});
  }

  /// Returns a resource-level summary count. The summary includes information
  /// about compliant and non-compliant statuses and detailed compliance-item
  /// severity counts, according to the filter criteria you specify.
  ///
  /// [filters]: One or more filters. Use a filter to return a more specific
  /// list of results.
  ///
  /// [nextToken]: A token to start the list. Use this token to get the next set
  /// of results.
  ///
  /// [maxResults]: The maximum number of items to return for this call. The
  /// call also returns a token that you can specify in a subsequent call to get
  /// the next set of results.
  Future<ListResourceComplianceSummariesResult> listResourceComplianceSummaries(
      {List<ComplianceStringFilter> filters,
      String nextToken,
      int maxResults}) async {
    return ListResourceComplianceSummariesResult.fromJson({});
  }

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
  ///
  /// [nextToken]: A token to start the list. Use this token to get the next set
  /// of results.
  ///
  /// [maxResults]: The maximum number of items to return for this call. The
  /// call also returns a token that you can specify in a subsequent call to get
  /// the next set of results.
  Future<ListResourceDataSyncResult> listResourceDataSync(
      {String nextToken, int maxResults}) async {
    return ListResourceDataSyncResult.fromJson({});
  }

  /// Returns a list of the tags assigned to the specified resource.
  ///
  /// [resourceType]: Returns a list of tags for a specific resource type.
  ///
  /// [resourceId]: The resource ID for which you want to see a list of tags.
  Future<ListTagsForResourceResult> listTagsForResource(
      {@required String resourceType, @required String resourceId}) async {
    return ListTagsForResourceResult.fromJson({});
  }

  /// Shares a Systems Manager document publicly or privately. If you share a
  /// document privately, you must specify the AWS user account IDs for those
  /// people who can use the document. If you share a document publicly, you
  /// must specify _All_ as the account ID.
  ///
  /// [name]: The name of the document that you want to share.
  ///
  /// [permissionType]: The permission type for the document. The permission
  /// type can be _Share_.
  ///
  /// [accountIdsToAdd]: The AWS user accounts that should have access to the
  /// document. The account IDs can either be a group of account IDs or _All_.
  ///
  /// [accountIdsToRemove]: The AWS user accounts that should no longer have
  /// access to the document. The AWS user account can either be a group of
  /// account IDs or _All_. This action has a higher priority than
  /// _AccountIdsToAdd_. If you specify an account ID to add and the same ID to
  /// remove, the system removes access to the document.
  Future<ModifyDocumentPermissionResponse> modifyDocumentPermission(
      {@required String name,
      @required String permissionType,
      List<String> accountIdsToAdd,
      List<String> accountIdsToRemove}) async {
    return ModifyDocumentPermissionResponse.fromJson({});
  }

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
  ///
  /// [resourceId]: Specify an ID for this resource. For a managed instance,
  /// this is the instance ID.
  ///
  /// [resourceType]: Specify the type of resource. `ManagedInstance` is
  /// currently the only supported resource type.
  ///
  /// [complianceType]: Specify the compliance type. For example, specify
  /// Association (for a State Manager association), Patch, or Custom:`string`.
  ///
  /// [executionSummary]: A summary of the call execution that includes an
  /// execution ID, the type of execution (for example, `Command`), and the
  /// date/time of the execution using a datetime object that is saved in the
  /// following format: yyyy-MM-dd'T'HH:mm:ss'Z'.
  ///
  /// [items]: Information about the compliance as defined by the resource type.
  /// For example, for a patch compliance type, `Items` includes information
  /// about the PatchSeverity, Classification, etc.
  ///
  /// [itemContentHash]: MD5 or SHA-256 content hash. The content hash is used
  /// to determine if existing information should be overwritten or ignored. If
  /// the content hashes match, the request to put compliance information is
  /// ignored.
  Future<PutComplianceItemsResult> putComplianceItems(
      {@required String resourceId,
      @required String resourceType,
      @required String complianceType,
      @required ComplianceExecutionSummary executionSummary,
      @required List<ComplianceItemEntry> items,
      String itemContentHash}) async {
    return PutComplianceItemsResult.fromJson({});
  }

  /// Bulk update custom inventory items on one more instance. The request adds
  /// an inventory item, if it doesn't already exist, or updates an inventory
  /// item, if it does exist.
  ///
  /// [instanceId]: One or more instance IDs where you want to add or update
  /// inventory items.
  ///
  /// [items]: The inventory items that you want to add or update on instances.
  Future<PutInventoryResult> putInventory(
      {@required String instanceId,
      @required List<InventoryItem> items}) async {
    return PutInventoryResult.fromJson({});
  }

  /// Add a parameter to the system.
  ///
  /// [name]: The fully qualified name of the parameter that you want to add to
  /// the system. The fully qualified name includes the complete hierarchy of
  /// the parameter path and name. For example:
  /// `/Dev/DBServer/MySQL/db-string13`
  ///
  /// Naming Constraints:
  ///
  /// *   Parameter names are case sensitive.
  ///
  /// *   A parameter name must be unique within an AWS Region
  ///
  /// *   A parameter name can't be prefixed with "aws" or "ssm"
  /// (case-insensitive).
  ///
  /// *   Parameter names can include only the following symbols and letters:
  /// `a-zA-Z0-9_.-/`
  ///
  /// *   A parameter name can't include spaces.
  ///
  /// *   Parameter hierarchies are limited to a maximum depth of fifteen
  /// levels.
  ///
  ///
  /// For additional information about valid values for parameter names, see
  /// [Requirements and Constraints for Parameter Names](http://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-parameter-name-constraints.html)
  /// in the _AWS Systems Manager User Guide_.
  ///
  ///
  ///
  /// The maximum length constraint listed below includes capacity for
  /// additional system attributes that are not part of the name. The maximum
  /// length for the fully qualified parameter name is 1011 characters.
  ///
  /// [description]: Information about the parameter that you want to add to the
  /// system. Optional but recommended.
  ///
  ///
  ///
  /// Do not enter personally identifiable information in this field.
  ///
  /// [value]: The parameter value that you want to add to the system. Standard
  /// parameters have a value limit of 4 KB. Advanced parameters have a value
  /// limit of 8 KB.
  ///
  /// [type]: The type of parameter that you want to add to the system.
  ///
  /// Items in a `StringList` must be separated by a comma (,). You can't use
  /// other punctuation or special character to escape items in the list. If you
  /// have a parameter value that requires a comma, then use the `String` data
  /// type.
  ///
  ///   `SecureString` is not currently supported for AWS CloudFormation
  /// templates or in the China Regions.
  ///
  /// [keyId]: The KMS Key ID that you want to use to encrypt a parameter.
  /// Either the default AWS Key Management Service (AWS KMS) key automatically
  /// assigned to your AWS account or a custom key. Required for parameters that
  /// use the `SecureString` data type.
  ///
  /// If you don't specify a key ID, the system uses the default key associated
  /// with your AWS account.
  ///
  /// *   To use your default AWS KMS key, choose the `SecureString` data type,
  /// and do _not_ specify the `Key ID` when you create the parameter. The
  /// system automatically populates `Key ID` with your default KMS key.
  ///
  /// *   To use a custom KMS key, choose the `SecureString` data type with the
  /// `Key ID` parameter.
  ///
  /// [overwrite]: Overwrite an existing parameter. If not specified, will
  /// default to "false".
  ///
  /// [allowedPattern]: A regular expression used to validate the parameter
  /// value. For example, for String types with values restricted to numbers,
  /// you can specify the following: AllowedPattern=^d+$
  ///
  /// [tags]: Optional metadata that you assign to a resource. Tags enable you
  /// to categorize a resource in different ways, such as by purpose, owner, or
  /// environment. For example, you might want to tag a Systems Manager
  /// parameter to identify the type of resource to which it applies, the
  /// environment, or the type of configuration data referenced by the
  /// parameter. In this case, you could specify the following key name/value
  /// pairs:
  ///
  /// *    `Key=Resource,Value=S3bucket`
  ///
  /// *    `Key=OS,Value=Windows`
  ///
  /// *    `Key=ParameterType,Value=LicenseKey`
  ///
  ///
  ///
  ///
  /// To add tags to an existing Systems Manager parameter, use the
  /// AddTagsToResource action.
  ///
  /// [tier]: The parameter tier to assign to a parameter.
  ///
  /// Parameter Store offers a standard tier and an advanced tier for
  /// parameters. Standard parameters have a content size limit of 4 KB and
  /// can't be configured to use parameter policies. You can create a maximum of
  /// 10,000 standard parameters for each Region in an AWS account. Standard
  /// parameters are offered at no additional cost.
  ///
  /// Advanced parameters have a content size limit of 8 KB and can be
  /// configured to use parameter policies. You can create a maximum of 100,000
  /// advanced parameters for each Region in an AWS account. Advanced parameters
  /// incur a charge. For more information, see
  /// [About Advanced Parameters](http://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-advanced-parameters.html)
  /// in the _AWS Systems Manager User Guide_.
  ///
  /// You can change a standard parameter to an advanced parameter any time. But
  /// you can't revert an advanced parameter to a standard parameter. Reverting
  /// an advanced parameter to a standard parameter would result in data loss
  /// because the system would truncate the size of the parameter from 8 KB to 4
  /// KB. Reverting would also remove any policies attached to the parameter.
  /// Lastly, advanced parameters use a different form of encryption than
  /// standard parameters.
  ///
  /// If you no longer need an advanced parameter, or if you no longer want to
  /// incur charges for an advanced parameter, you must delete it and recreate
  /// it as a new standard parameter.
  ///
  ///  **Using the Default Tier Configuration**
  ///
  /// In `PutParameter` requests, you can specify the tier to create the
  /// parameter in. Whenever you specify a tier in the request, Parameter Store
  /// creates or updates the parameter according to that request. However, if
  /// you do not specify a tier in a request, Parameter Store assigns the tier
  /// based on the current Parameter Store default tier configuration.
  ///
  /// The default tier when you begin using Parameter Store is the
  /// standard-parameter tier. If you use the advanced-parameter tier, you can
  /// specify one of the following as the default:
  ///
  /// *    **Advanced**: With this option, Parameter Store evaluates all
  /// requests as advanced parameters.
  ///
  /// *    **Intelligent-Tiering**: With this option, Parameter Store evaluates
  /// each request to determine if the parameter is standard or advanced.
  ///
  ///     If the request doesn't include any options that require an advanced
  /// parameter, the parameter is created in the standard-parameter tier. If one
  /// or more options requiring an advanced parameter are included in the
  /// request, Parameter Store create a parameter in the advanced-parameter
  /// tier.
  ///
  ///     This approach helps control your parameter-related costs by always
  /// creating standard parameters unless an advanced parameter is necessary.
  ///
  ///
  /// Options that require an advanced parameter include the following:
  ///
  /// *   The content size of the parameter is more than 4 KB.
  ///
  /// *   The parameter uses a parameter policy.
  ///
  /// *   More than 10,000 parameters already exist in your AWS account in the
  /// current Region.
  ///
  ///
  /// For more information about configuring the default tier option, see
  /// [Specifying a Default Parameter Tier](http://docs.aws.amazon.com/systems-manager/latest/userguide/ps-default-tier.html)
  /// in the AWS Systems Manager User Guide.
  ///
  /// [policies]: One or more policies to apply to a parameter. This action
  /// takes a JSON array. Parameter Store supports the following policy types:
  ///
  /// Expiration: This policy deletes the parameter after it expires. When you
  /// create the policy, you specify the expiration date. You can update the
  /// expiration date and time by updating the policy. Updating the _parameter_
  /// does not affect the expiration date and time. When the expiration time is
  /// reached, Parameter Store deletes the parameter.
  ///
  /// ExpirationNotification: This policy triggers an event in Amazon CloudWatch
  /// Events that notifies you about the expiration. By using this policy, you
  /// can receive notification before or after the expiration time is reached,
  /// in units of days or hours.
  ///
  /// NoChangeNotification: This policy triggers a CloudWatch event if a
  /// parameter has not been modified for a specified period of time. This
  /// policy type is useful when, for example, a secret needs to be changed
  /// within a period of time, but it has not been changed.
  ///
  /// All existing policies are preserved until you send new policies or an
  /// empty policy. For more information about parameter policies, see
  /// [Working with Parameter Policies](http://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-paramstore-su-policies.html).
  Future<PutParameterResult> putParameter(
      {@required String name,
      String description,
      @required String value,
      @required String type,
      String keyId,
      bool overwrite,
      String allowedPattern,
      List<Tag> tags,
      String tier,
      String policies}) async {
    return PutParameterResult.fromJson({});
  }

  /// Defines the default patch baseline for the relevant operating system.
  ///
  /// To reset the AWS predefined patch baseline as the default, specify the
  /// full patch baseline ARN as the baseline ID value. For example, for CentOS,
  /// specify
  /// `arn:aws:ssm:us-east-2:733109147000:patchbaseline/pb-0574b43a65ea646ed`
  /// instead of `pb-0574b43a65ea646ed`.
  ///
  /// [baselineId]: The ID of the patch baseline that should be the default
  /// patch baseline.
  Future<RegisterDefaultPatchBaselineResult> registerDefaultPatchBaseline(
      String baselineId) async {
    return RegisterDefaultPatchBaselineResult.fromJson({});
  }

  /// Registers a patch baseline for a patch group.
  ///
  /// [baselineId]: The ID of the patch baseline to register the patch group
  /// with.
  ///
  /// [patchGroup]: The name of the patch group that should be registered with
  /// the patch baseline.
  Future<RegisterPatchBaselineForPatchGroupResult>
      registerPatchBaselineForPatchGroup(
          {@required String baselineId, @required String patchGroup}) async {
    return RegisterPatchBaselineForPatchGroupResult.fromJson({});
  }

  /// Registers a target with a maintenance window.
  ///
  /// [windowId]: The ID of the maintenance window the target should be
  /// registered with.
  ///
  /// [resourceType]: The type of target being registered with the maintenance
  /// window.
  ///
  /// [targets]: The targets to register with the maintenance window. In other
  /// words, the instances to run commands on when the maintenance window runs.
  ///
  /// You can specify targets using instance IDs, resource group names, or tags
  /// that have been applied to instances.
  ///
  ///  **Example 1**: Specify instance IDs
  ///
  ///  `Key=InstanceIds,Values=_instance-id-1_,_instance-id-2_,_instance-id-3_`
  ///
  ///  **Example 2**: Use tag key-pairs applied to instances
  ///
  ///  `Key=tag:_my-tag-key_,Values=_my-tag-value-1_,_my-tag-value-2_`
  ///
  ///  **Example 3**: Use tag-keys applied to instances
  ///
  ///  `Key=tag-key,Values=_my-tag-key-1_,_my-tag-key-2_`
  ///
  ///  **Example 4**: Use resource group names
  ///
  ///  `Key=resource-groups:Name,Values=_resource-group-name_`
  ///
  ///  **Example 5**: Use filters for resource group types
  ///
  ///
  /// `Key=resource-groups:ResourceTypeFilters,Values=_resource-type-1_,_resource-type-2_`
  ///
  ///
  ///  For `Key=resource-groups:ResourceTypeFilters`, specify resource types in
  /// the following format
  ///
  ///
  /// `Key=resource-groups:ResourceTypeFilters,Values=_AWS::EC2::INSTANCE_,_AWS::EC2::VPC_`
  ///
  ///
  /// For more information about these examples formats, including the best use
  /// case for each one, see
  /// [Examples: Register Targets with a Maintenance Window](https://docs.aws.amazon.com/systems-manager/latest/userguide/mw-cli-tutorial-targets-examples.html)
  /// in the _AWS Systems Manager User Guide_.
  ///
  /// [ownerInformation]: User-provided value that will be included in any
  /// CloudWatch events raised while running tasks for these targets in this
  /// maintenance window.
  ///
  /// [name]: An optional name for the target.
  ///
  /// [description]: An optional description for the target.
  ///
  /// [clientToken]: User-provided idempotency token.
  Future<RegisterTargetWithMaintenanceWindowResult>
      registerTargetWithMaintenanceWindow(
          {@required String windowId,
          @required String resourceType,
          @required List<Target> targets,
          String ownerInformation,
          String name,
          String description,
          String clientToken}) async {
    return RegisterTargetWithMaintenanceWindowResult.fromJson({});
  }

  /// Adds a new task to a maintenance window.
  ///
  /// [windowId]: The ID of the maintenance window the task should be added to.
  ///
  /// [targets]: The targets (either instances or maintenance window targets).
  ///
  /// Specify instances using the following format:
  ///
  ///  `Key=InstanceIds,Values=<instance-id-1>,<instance-id-2>`
  ///
  /// Specify maintenance window targets using the following format:
  ///
  ///  `Key=WindowTargetIds;,Values=<window-target-id-1>,<window-target-id-2>`
  ///
  /// [taskArn]: The ARN of the task to run.
  ///
  /// [serviceRoleArn]: The ARN of the IAM service role for Systems Manager to
  /// assume when running a maintenance window task. If you do not specify a
  /// service role ARN, Systems Manager uses your account's service-linked role.
  /// If no service-linked role for Systems Manager exists in your account, it
  /// is created when you run `RegisterTaskWithMaintenanceWindow`.
  ///
  /// For more information, see the following topics in the in the _AWS Systems
  /// Manager User Guide_:
  ///
  /// *
  /// [Service-Linked Role Permissions for Systems Manager](http://docs.aws.amazon.com/systems-manager/latest/userguide/using-service-linked-roles.html#slr-permissions)
  ///
  /// *
  /// [Should I Use a Service-Linked Role or a Custom Service Role to Run Maintenance Window Tasks?](http://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-maintenance-permissions.html#maintenance-window-tasks-service-role)
  ///
  /// [taskType]: The type of task being registered.
  ///
  /// [taskParameters]: The parameters that should be passed to the task when it
  /// is run.
  ///
  ///   `TaskParameters` has been deprecated. To specify parameters to pass to a
  /// task when it runs, instead use the `Parameters` option in the
  /// `TaskInvocationParameters` structure. For information about how Systems
  /// Manager handles these options for the supported maintenance window task
  /// types, see MaintenanceWindowTaskInvocationParameters.
  ///
  /// [taskInvocationParameters]: The parameters that the task should use during
  /// execution. Populate only the fields that match the task type. All other
  /// fields should be empty.
  ///
  /// [priority]: The priority of the task in the maintenance window, the lower
  /// the number the higher the priority. Tasks in a maintenance window are
  /// scheduled in priority order with tasks that have the same priority
  /// scheduled in parallel.
  ///
  /// [maxConcurrency]: The maximum number of targets this task can be run for
  /// in parallel.
  ///
  /// [maxErrors]: The maximum number of errors allowed before this task stops
  /// being scheduled.
  ///
  /// [loggingInfo]: A structure containing information about an Amazon S3
  /// bucket to write instance-level logs to.
  ///
  ///   `LoggingInfo` has been deprecated. To specify an S3 bucket to contain
  /// logs, instead use the `OutputS3BucketName` and `OutputS3KeyPrefix` options
  /// in the `TaskInvocationParameters` structure. For information about how
  /// Systems Manager handles these options for the supported maintenance window
  /// task types, see MaintenanceWindowTaskInvocationParameters.
  ///
  /// [name]: An optional name for the task.
  ///
  /// [description]: An optional description for the task.
  ///
  /// [clientToken]: User-provided idempotency token.
  Future<RegisterTaskWithMaintenanceWindowResult>
      registerTaskWithMaintenanceWindow(
          {@required String windowId,
          @required List<Target> targets,
          @required String taskArn,
          String serviceRoleArn,
          @required String taskType,
          Map<String, MaintenanceWindowTaskParameterValueExpression>
              taskParameters,
          MaintenanceWindowTaskInvocationParameters taskInvocationParameters,
          int priority,
          @required String maxConcurrency,
          @required String maxErrors,
          LoggingInfo loggingInfo,
          String name,
          String description,
          String clientToken}) async {
    return RegisterTaskWithMaintenanceWindowResult.fromJson({});
  }

  /// Removes tag keys from the specified resource.
  ///
  /// [resourceType]: The type of resource from which you want to remove a tag.
  ///
  ///
  ///
  /// The ManagedInstance type for this API action is only for on-premises
  /// managed instances. Specify the name of the managed instance in the
  /// following format: mi-ID_number. For example, mi-1a2b3c4d5e6f.
  ///
  /// [resourceId]: The ID of the resource from which you want to remove tags.
  /// For example:
  ///
  /// ManagedInstance: mi-012345abcde
  ///
  /// MaintenanceWindow: mw-012345abcde
  ///
  /// PatchBaseline: pb-012345abcde
  ///
  /// For the Document and Parameter values, use the name of the resource.
  ///
  ///
  ///
  /// The ManagedInstance type for this API action is only for on-premises
  /// managed instances. Specify the name of the managed instance in the
  /// following format: mi-ID_number. For example, mi-1a2b3c4d5e6f.
  ///
  /// [tagKeys]: Tag keys that you want to remove from the specified resource.
  Future<RemoveTagsFromResourceResult> removeTagsFromResource(
      {@required String resourceType,
      @required String resourceId,
      @required List<String> tagKeys}) async {
    return RemoveTagsFromResourceResult.fromJson({});
  }

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
  ///
  /// [settingId]: The ID of the service setting to reset.
  Future<ResetServiceSettingResult> resetServiceSetting(
      String settingId) async {
    return ResetServiceSettingResult.fromJson({});
  }

  /// Reconnects a session to an instance after it has been disconnected.
  /// Connections can be resumed for disconnected sessions, but not terminated
  /// sessions.
  ///
  ///
  ///
  /// This command is primarily for use by client machines to automatically
  /// reconnect during intermittent network issues. It is not intended for any
  /// other use.
  ///
  /// [sessionId]: The ID of the disconnected session to resume.
  Future<ResumeSessionResponse> resumeSession(String sessionId) async {
    return ResumeSessionResponse.fromJson({});
  }

  /// Sends a signal to an Automation execution to change the current behavior
  /// or status of the execution.
  ///
  /// [automationExecutionId]: The unique identifier for an existing Automation
  /// execution that you want to send the signal to.
  ///
  /// [signalType]: The type of signal to send to an Automation execution.
  ///
  /// [payload]: The data sent with the signal. The data schema depends on the
  /// type of signal used in the request.
  ///
  /// For `Approve` and `Reject` signal types, the payload is an optional
  /// comment that you can send with the signal type. For example:
  ///
  ///  `Comment="Looks good"`
  ///
  /// For `StartStep` and `Resume` signal types, you must send the name of the
  /// Automation step to start or resume as the payload. For example:
  ///
  ///  `StepName="step1"`
  ///
  /// For the `StopStep` signal type, you must send the step execution ID as the
  /// payload. For example:
  ///
  ///  `StepExecutionId="97fff367-fc5a-4299-aed8-0123456789ab"`
  Future<SendAutomationSignalResult> sendAutomationSignal(
      {@required String automationExecutionId,
      @required String signalType,
      Map<String, List<String>> payload}) async {
    return SendAutomationSignalResult.fromJson({});
  }

  /// Runs commands on one or more managed instances.
  ///
  /// [instanceIds]: The instance IDs where the command should run. You can
  /// specify a maximum of 50 IDs. If you prefer not to list individual instance
  /// IDs, you can instead send commands to a fleet of instances using the
  /// Targets parameter, which accepts EC2 tags. For more information about how
  /// to use targets, see
  /// [Sending Commands to a Fleet](http://docs.aws.amazon.com/systems-manager/latest/userguide/send-commands-multiple.html)
  /// in the _AWS Systems Manager User Guide_.
  ///
  /// [targets]: (Optional) An array of search criteria that targets instances
  /// using a Key,Value combination that you specify. Targets is required if you
  /// don't provide one or more instance IDs in the call. For more information
  /// about how to use targets, see
  /// [Sending Commands to a Fleet](http://docs.aws.amazon.com/systems-manager/latest/userguide/send-commands-multiple.html)
  /// in the _AWS Systems Manager User Guide_.
  ///
  /// [documentName]: Required. The name of the Systems Manager document to run.
  /// This can be a public document or a custom document.
  ///
  /// [documentVersion]: The SSM document version to use in the request. You can
  /// specify $DEFAULT, $LATEST, or a specific version number. If you run
  /// commands by using the AWS CLI, then you must escape the first two options
  /// by using a backslash. If you specify a version number, then you don't need
  /// to use the backslash. For example:
  ///
  /// --document-version "$DEFAULT"
  ///
  /// --document-version "$LATEST"
  ///
  /// --document-version "3"
  ///
  /// [documentHash]: The Sha256 or Sha1 hash created by the system when the
  /// document was created.
  ///
  ///
  ///
  /// Sha1 hashes have been deprecated.
  ///
  /// [documentHashType]: Sha256 or Sha1.
  ///
  ///
  ///
  /// Sha1 hashes have been deprecated.
  ///
  /// [timeoutSeconds]: If this time is reached and the command has not already
  /// started running, it will not run.
  ///
  /// [comment]: User-specified information about the command, such as a brief
  /// description of what the command should do.
  ///
  /// [parameters]: The required and optional parameters specified in the
  /// document being run.
  ///
  /// [outputS3Region]: (Deprecated) You can no longer specify this parameter.
  /// The system ignores it. Instead, Systems Manager automatically determines
  /// the Amazon S3 bucket region.
  ///
  /// [outputS3BucketName]: The name of the S3 bucket where command execution
  /// responses should be stored.
  ///
  /// [outputS3KeyPrefix]: The directory structure within the S3 bucket where
  /// the responses should be stored.
  ///
  /// [maxConcurrency]: (Optional) The maximum number of instances that are
  /// allowed to run the command at the same time. You can specify a number such
  /// as 10 or a percentage such as 10%. The default value is 50. For more
  /// information about how to use MaxConcurrency, see
  /// [Using Concurrency Controls](http://docs.aws.amazon.com/systems-manager/latest/userguide/send-commands-multiple.html#send-commands-velocity)
  /// in the _AWS Systems Manager User Guide_.
  ///
  /// [maxErrors]: The maximum number of errors allowed without the command
  /// failing. When the command fails one more time beyond the value of
  /// MaxErrors, the systems stops sending the command to additional targets.
  /// You can specify a number like 10 or a percentage like 10%. The default
  /// value is 0. For more information about how to use MaxErrors, see
  /// [Using Error Controls](http://docs.aws.amazon.com/systems-manager/latest/userguide/send-commands-multiple.html#send-commands-maxerrors)
  /// in the _AWS Systems Manager User Guide_.
  ///
  /// [serviceRoleArn]: The ARN of the IAM service role to use to publish Amazon
  /// Simple Notification Service (Amazon SNS) notifications for Run Command
  /// commands.
  ///
  /// [notificationConfig]: Configurations for sending notifications.
  ///
  /// [cloudWatchOutputConfig]: Enables Systems Manager to send Run Command
  /// output to Amazon CloudWatch Logs.
  Future<SendCommandResult> sendCommand(String documentName,
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
      CloudWatchOutputConfig cloudWatchOutputConfig}) async {
    return SendCommandResult.fromJson({});
  }

  /// Use this API action to run an association immediately and only one time.
  /// This action can be helpful when troubleshooting associations.
  ///
  /// [associationIds]: The association IDs that you want to run immediately and
  /// only one time.
  Future<StartAssociationsOnceResult> startAssociationsOnce(
      List<String> associationIds) async {
    return StartAssociationsOnceResult.fromJson({});
  }

  /// Initiates execution of an Automation document.
  ///
  /// [documentName]: The name of the Automation document to use for this
  /// execution.
  ///
  /// [documentVersion]: The version of the Automation document to use for this
  /// execution.
  ///
  /// [parameters]: A key-value map of execution parameters, which match the
  /// declared parameters in the Automation document.
  ///
  /// [clientToken]: User-provided idempotency token. The token must be unique,
  /// is case insensitive, enforces the UUID format, and can't be reused.
  ///
  /// [mode]: The execution mode of the automation. Valid modes include the
  /// following: Auto and Interactive. The default mode is Auto.
  ///
  /// [targetParameterName]: The name of the parameter used as the target
  /// resource for the rate-controlled execution. Required if you specify
  /// targets.
  ///
  /// [targets]: A key-value mapping to target resources. Required if you
  /// specify TargetParameterName.
  ///
  /// [targetMaps]: A key-value mapping of document parameters to target
  /// resources. Both Targets and TargetMaps cannot be specified together.
  ///
  /// [maxConcurrency]: The maximum number of targets allowed to run this task
  /// in parallel. You can specify a number, such as 10, or a percentage, such
  /// as 10%. The default value is 10.
  ///
  /// [maxErrors]: The number of errors that are allowed before the system stops
  /// running the automation on additional targets. You can specify either an
  /// absolute number of errors, for example 10, or a percentage of the target
  /// set, for example 10%. If you specify 3, for example, the system stops
  /// running the automation when the fourth error is received. If you specify
  /// 0, then the system stops running the automation on additional targets
  /// after the first error result is returned. If you run an automation on 50
  /// resources and set max-errors to 10%, then the system stops running the
  /// automation on additional targets when the sixth error is received.
  ///
  /// Executions that are already running an automation when max-errors is
  /// reached are allowed to complete, but some of these executions may fail as
  /// well. If you need to ensure that there won't be more than max-errors
  /// failed executions, set max-concurrency to 1 so the executions proceed one
  /// at a time.
  ///
  /// [targetLocations]: A location is a combination of AWS Regions and/or AWS
  /// accounts where you want to run the Automation. Use this action to start an
  /// Automation in multiple Regions and multiple accounts. For more
  /// information, see
  /// [Executing Automations in Multiple AWS Regions and Accounts](http://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-automation-multiple-accounts-and-regions.html)
  /// in the _AWS Systems Manager User Guide_.
  Future<StartAutomationExecutionResult> startAutomationExecution(
      String documentName,
      {String documentVersion,
      Map<String, List<String>> parameters,
      String clientToken,
      String mode,
      String targetParameterName,
      List<Target> targets,
      List<Map<String, List<String>>> targetMaps,
      String maxConcurrency,
      String maxErrors,
      List<TargetLocation> targetLocations}) async {
    return StartAutomationExecutionResult.fromJson({});
  }

  /// Initiates a connection to a target (for example, an instance) for a
  /// Session Manager session. Returns a URL and token that can be used to open
  /// a WebSocket connection for sending input and receiving outputs.
  ///
  ///
  ///
  /// AWS CLI usage: `start-session` is an interactive command that requires the
  /// Session Manager plugin to be installed on the client machine making the
  /// call. For information, see
  /// [Install the Session Manager Plugin for the AWS CLI](http://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html)
  /// in the _AWS Systems Manager User Guide_.
  ///
  /// [target]: The instance to connect to for the session.
  ///
  /// [documentName]: The name of the SSM document to define the parameters and
  /// plugin settings for the session. For example,
  /// `SSM-SessionManagerRunShell`. If no document name is provided, a shell to
  /// the instance is launched by default.
  ///
  /// [parameters]: Reserved for future use.
  Future<StartSessionResponse> startSession(String target,
      {String documentName, Map<String, List<String>> parameters}) async {
    return StartSessionResponse.fromJson({});
  }

  /// Stop an Automation that is currently running.
  ///
  /// [automationExecutionId]: The execution ID of the Automation to stop.
  ///
  /// [type]: The stop request type. Valid types include the following: Cancel
  /// and Complete. The default type is Cancel.
  Future<StopAutomationExecutionResult> stopAutomationExecution(
      String automationExecutionId,
      {String type}) async {
    return StopAutomationExecutionResult.fromJson({});
  }

  /// Permanently ends a session and closes the data connection between the
  /// Session Manager client and SSM Agent on the instance. A terminated session
  /// cannot be resumed.
  ///
  /// [sessionId]: The ID of the session to terminate.
  Future<TerminateSessionResponse> terminateSession(String sessionId) async {
    return TerminateSessionResponse.fromJson({});
  }

  /// Updates an association. You can update the association name and version,
  /// the document version, schedule, parameters, and Amazon S3 output.
  ///
  ///
  ///
  /// When you update an association, the association immediately runs against
  /// the specified targets.
  ///
  /// [associationId]: The ID of the association you want to update.
  ///
  /// [parameters]: The parameters you want to update for the association. If
  /// you create a parameter using Parameter Store, you can reference the
  /// parameter using {{ssm:parameter-name}}
  ///
  /// [documentVersion]: The document version you want update for the
  /// association.
  ///
  /// [scheduleExpression]: The cron expression used to schedule the association
  /// that you want to update.
  ///
  /// [outputLocation]: An Amazon S3 bucket where you want to store the results
  /// of this request.
  ///
  /// [name]: The name of the SSM document that contains the configuration
  /// information for the instance. You can specify Command or Automation
  /// documents.
  ///
  /// You can specify AWS-predefined documents, documents you created, or a
  /// document that is shared with you from another account.
  ///
  /// For SSM documents that are shared with you from other AWS accounts, you
  /// must specify the complete SSM document ARN, in the following format:
  ///
  ///  `arn:aws:ssm:_region_:_account-id_:document/_document-name_`
  ///
  /// For example:
  ///
  ///  `arn:aws:ssm:us-east-2:12345678912:document/My-Shared-Document`
  ///
  /// For AWS-predefined documents and SSM documents you created in your
  /// account, you only need to specify the document name. For example,
  /// `AWS-ApplyPatchBaseline` or `My-Document`.
  ///
  /// [targets]: The targets of the association.
  ///
  /// [associationName]: The name of the association that you want to update.
  ///
  /// [associationVersion]: This parameter is provided for concurrency control
  /// purposes. You must specify the latest association version in the service.
  /// If you want to ensure that this request succeeds, either specify
  /// `$LATEST`, or omit this parameter.
  ///
  /// [automationTargetParameterName]: Specify the target for the association.
  /// This target is required for associations that use an Automation document
  /// and target resources by using rate controls.
  ///
  /// [maxErrors]: The number of errors that are allowed before the system stops
  /// sending requests to run the association on additional targets. You can
  /// specify either an absolute number of errors, for example 10, or a
  /// percentage of the target set, for example 10%. If you specify 3, for
  /// example, the system stops sending requests when the fourth error is
  /// received. If you specify 0, then the system stops sending requests after
  /// the first error is returned. If you run an association on 50 instances and
  /// set MaxError to 10%, then the system stops sending the request when the
  /// sixth error is received.
  ///
  /// Executions that are already running an association when MaxErrors is
  /// reached are allowed to complete, but some of these executions may fail as
  /// well. If you need to ensure that there won't be more than max-errors
  /// failed executions, set MaxConcurrency to 1 so that executions proceed one
  /// at a time.
  ///
  /// [maxConcurrency]: The maximum number of targets allowed to run the
  /// association at the same time. You can specify a number, for example 10, or
  /// a percentage of the target set, for example 10%. The default value is
  /// 100%, which means all targets run the association at the same time.
  ///
  /// If a new instance starts and attempts to run an association while Systems
  /// Manager is running MaxConcurrency associations, the association is allowed
  /// to run. During the next association interval, the new instance will
  /// process its association within the limit specified for MaxConcurrency.
  ///
  /// [complianceSeverity]: The severity level to assign to the association.
  Future<UpdateAssociationResult> updateAssociation(String associationId,
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
      String complianceSeverity}) async {
    return UpdateAssociationResult.fromJson({});
  }

  /// Updates the status of the Systems Manager document associated with the
  /// specified instance.
  ///
  /// [name]: The name of the Systems Manager document.
  ///
  /// [instanceId]: The ID of the instance.
  ///
  /// [associationStatus]: The association status.
  Future<UpdateAssociationStatusResult> updateAssociationStatus(
      {@required String name,
      @required String instanceId,
      @required AssociationStatus associationStatus}) async {
    return UpdateAssociationStatusResult.fromJson({});
  }

  /// Updates one or more values for an SSM document.
  ///
  /// [content]: A valid JSON or YAML string.
  ///
  /// [attachments]: A list of key and value pairs that describe attachments to
  /// a version of a document.
  ///
  /// [name]: The name of the document that you want to update.
  ///
  /// [versionName]: An optional field specifying the version of the artifact
  /// you are updating with the document. For example, "Release 12, Update 6".
  /// This value is unique across all versions of a document, and cannot be
  /// changed.
  ///
  /// [documentVersion]: (Required) The version of the document that you want to
  /// update.
  ///
  /// [documentFormat]: Specify the document format for the new document
  /// version. Systems Manager supports JSON and YAML documents. JSON is the
  /// default format.
  ///
  /// [targetType]: Specify a new target type for the document.
  Future<UpdateDocumentResult> updateDocument(
      {@required String content,
      List<AttachmentsSource> attachments,
      @required String name,
      String versionName,
      String documentVersion,
      String documentFormat,
      String targetType}) async {
    return UpdateDocumentResult.fromJson({});
  }

  /// Set the default version of a document.
  ///
  /// [name]: The name of a custom document that you want to set as the default
  /// version.
  ///
  /// [documentVersion]: The version of a custom document that you want to set
  /// as the default version.
  Future<UpdateDocumentDefaultVersionResult> updateDocumentDefaultVersion(
      {@required String name, @required String documentVersion}) async {
    return UpdateDocumentDefaultVersionResult.fromJson({});
  }

  /// Updates an existing maintenance window. Only specified parameters are
  /// modified.
  ///
  /// [windowId]: The ID of the maintenance window to update.
  ///
  /// [name]: The name of the maintenance window.
  ///
  /// [description]: An optional description for the update request.
  ///
  /// [startDate]: The time zone that the scheduled maintenance window
  /// executions are based on, in Internet Assigned Numbers Authority (IANA)
  /// format. For example: "America/Los_Angeles", "etc/UTC", or "Asia/Seoul".
  /// For more information, see the
  /// [Time Zone Database](https://www.iana.org/time-zones) on the IANA website.
  ///
  /// [endDate]: The date and time, in ISO-8601 Extended format, for when you
  /// want the maintenance window to become inactive. EndDate allows you to set
  /// a date and time in the future when the maintenance window will no longer
  /// run.
  ///
  /// [schedule]: The schedule of the maintenance window in the form of a cron
  /// or rate expression.
  ///
  /// [scheduleTimezone]: The time zone that the scheduled maintenance window
  /// executions are based on, in Internet Assigned Numbers Authority (IANA)
  /// format. For example: "America/Los_Angeles", "etc/UTC", or "Asia/Seoul".
  /// For more information, see the
  /// [Time Zone Database](https://www.iana.org/time-zones) on the IANA website.
  ///
  /// [duration]: The duration of the maintenance window in hours.
  ///
  /// [cutoff]: The number of hours before the end of the maintenance window
  /// that Systems Manager stops scheduling new tasks for execution.
  ///
  /// [allowUnassociatedTargets]: Whether targets must be registered with the
  /// maintenance window before tasks can be defined for those targets.
  ///
  /// [enabled]: Whether the maintenance window is enabled.
  ///
  /// [replace]: If True, then all fields that are required by the
  /// CreateMaintenanceWindow action are also required for this API request.
  /// Optional fields that are not specified are set to null.
  Future<UpdateMaintenanceWindowResult> updateMaintenanceWindow(String windowId,
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
      bool replace}) async {
    return UpdateMaintenanceWindowResult.fromJson({});
  }

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
  ///
  /// [windowId]: The maintenance window ID with which to modify the target.
  ///
  /// [windowTargetId]: The target ID to modify.
  ///
  /// [targets]: The targets to add or replace.
  ///
  /// [ownerInformation]: User-provided value that will be included in any
  /// CloudWatch events raised while running tasks for these targets in this
  /// maintenance window.
  ///
  /// [name]: A name for the update.
  ///
  /// [description]: An optional description for the update.
  ///
  /// [replace]: If True, then all fields that are required by the
  /// RegisterTargetWithMaintenanceWindow action are also required for this API
  /// request. Optional fields that are not specified are set to null.
  Future<UpdateMaintenanceWindowTargetResult> updateMaintenanceWindowTarget(
      {@required String windowId,
      @required String windowTargetId,
      List<Target> targets,
      String ownerInformation,
      String name,
      String description,
      bool replace}) async {
    return UpdateMaintenanceWindowTargetResult.fromJson({});
  }

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
  ///
  /// [windowId]: The maintenance window ID that contains the task to modify.
  ///
  /// [windowTaskId]: The task ID to modify.
  ///
  /// [targets]: The targets (either instances or tags) to modify. Instances are
  /// specified using Key=instanceids,Values=instanceID_1,instanceID_2. Tags are
  /// specified using Key=tag_name,Values=tag_value.
  ///
  /// [taskArn]: The task ARN to modify.
  ///
  /// [serviceRoleArn]: The ARN of the IAM service role for Systems Manager to
  /// assume when running a maintenance window task. If you do not specify a
  /// service role ARN, Systems Manager uses your account's service-linked role.
  /// If no service-linked role for Systems Manager exists in your account, it
  /// is created when you run `RegisterTaskWithMaintenanceWindow`.
  ///
  /// For more information, see the following topics in the in the _AWS Systems
  /// Manager User Guide_:
  ///
  /// *
  /// [Service-Linked Role Permissions for Systems Manager](http://docs.aws.amazon.com/systems-manager/latest/userguide/using-service-linked-roles.html#slr-permissions)
  ///
  /// *
  /// [Should I Use a Service-Linked Role or a Custom Service Role to Run Maintenance Window Tasks?](http://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-maintenance-permissions.html#maintenance-window-tasks-service-role)
  ///
  /// [taskParameters]: The parameters to modify.
  ///
  ///   `TaskParameters` has been deprecated. To specify parameters to pass to a
  /// task when it runs, instead use the `Parameters` option in the
  /// `TaskInvocationParameters` structure. For information about how Systems
  /// Manager handles these options for the supported maintenance window task
  /// types, see MaintenanceWindowTaskInvocationParameters.
  ///
  /// The map has the following format:
  ///
  /// Key: string, between 1 and 255 characters
  ///
  /// Value: an array of strings, each string is between 1 and 255 characters
  ///
  /// [taskInvocationParameters]: The parameters that the task should use during
  /// execution. Populate only the fields that match the task type. All other
  /// fields should be empty.
  ///
  /// [priority]: The new task priority to specify. The lower the number, the
  /// higher the priority. Tasks that have the same priority are scheduled in
  /// parallel.
  ///
  /// [maxConcurrency]: The new `MaxConcurrency` value you want to specify.
  /// `MaxConcurrency` is the number of targets that are allowed to run this
  /// task in parallel.
  ///
  /// [maxErrors]: The new `MaxErrors` value to specify. `MaxErrors` is the
  /// maximum number of errors that are allowed before the task stops being
  /// scheduled.
  ///
  /// [loggingInfo]: The new logging location in Amazon S3 to specify.
  ///
  ///   `LoggingInfo` has been deprecated. To specify an S3 bucket to contain
  /// logs, instead use the `OutputS3BucketName` and `OutputS3KeyPrefix` options
  /// in the `TaskInvocationParameters` structure. For information about how
  /// Systems Manager handles these options for the supported maintenance window
  /// task types, see MaintenanceWindowTaskInvocationParameters.
  ///
  /// [name]: The new task name to specify.
  ///
  /// [description]: The new task description to specify.
  ///
  /// [replace]: If True, then all fields that are required by the
  /// RegisterTaskWithMaintenanceWndow action are also required for this API
  /// request. Optional fields that are not specified are set to null.
  Future<UpdateMaintenanceWindowTaskResult> updateMaintenanceWindowTask(
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
      bool replace}) async {
    return UpdateMaintenanceWindowTaskResult.fromJson({});
  }

  /// Assigns or changes an Amazon Identity and Access Management (IAM) role for
  /// the managed instance.
  ///
  /// [instanceId]: The ID of the managed instance where you want to update the
  /// role.
  ///
  /// [iamRole]: The IAM role you want to assign or change.
  Future<UpdateManagedInstanceRoleResult> updateManagedInstanceRole(
      {@required String instanceId, @required String iamRole}) async {
    return UpdateManagedInstanceRoleResult.fromJson({});
  }

  /// Edit or change an OpsItem. You must have permission in AWS Identity and
  /// Access Management (IAM) to update an OpsItem. For more information, see
  /// [Getting Started with OpsCenter](http://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-getting-started.html)
  /// in the _AWS Systems Manager User Guide_.
  ///
  /// Operations engineers and IT professionals use OpsCenter to view,
  /// investigate, and remediate operational issues impacting the performance
  /// and health of their AWS resources. For more information, see
  /// [AWS Systems Manager OpsCenter](http://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html)
  /// in the _AWS Systems Manager User Guide_.
  ///
  /// [description]: Update the information about the OpsItem. Provide enough
  /// information so that users reading this OpsItem for the first time
  /// understand the issue.
  ///
  /// [operationalData]: Add new keys or edit existing key-value pairs of the
  /// OperationalData map in the OpsItem object.
  ///
  /// Operational data is custom data that provides useful reference details
  /// about the OpsItem. For example, you can specify log files, error strings,
  /// license keys, troubleshooting tips, or other relevant data. You enter
  /// operational data as key-value pairs. The key has a maximum length of 128
  /// characters. The value has a maximum size of 20 KB.
  ///
  ///  Operational data keys _can't_ begin with the following: amazon, aws,
  /// amzn, ssm, /amazon, /aws, /amzn, /ssm.
  ///
  /// You can choose to make the data searchable by other users in the account
  /// or you can restrict search access. Searchable data means that all users
  /// with access to the OpsItem Overview page (as provided by the
  /// DescribeOpsItems API action) can view and search on the specified data.
  /// Operational data that is not searchable is only viewable by users who have
  /// access to the OpsItem (as provided by the GetOpsItem API action).
  ///
  /// Use the `/aws/resources` key in OperationalData to specify a related
  /// resource in the request. Use the `/aws/automations` key in OperationalData
  /// to associate an Automation runbook with the OpsItem. To view AWS CLI
  /// example commands that use these keys, see
  /// [Creating OpsItems Manually](http://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-creating-OpsItems.html#OpsCenter-manually-create-OpsItems)
  /// in the _AWS Systems Manager User Guide_.
  ///
  /// [operationalDataToDelete]: Keys that you want to remove from the
  /// OperationalData map.
  ///
  /// [notifications]: The Amazon Resource Name (ARN) of an SNS topic where
  /// notifications are sent when this OpsItem is edited or changed.
  ///
  /// [priority]: The importance of this OpsItem in relation to other OpsItems
  /// in the system.
  ///
  /// [relatedOpsItems]: One or more OpsItems that share something in common
  /// with the current OpsItems. For example, related OpsItems can include
  /// OpsItems with similar error messages, impacted resources, or statuses for
  /// the impacted resource.
  ///
  /// [status]: The OpsItem status. Status can be `Open`, `In Progress`, or
  /// `Resolved`. For more information, see
  /// [Editing OpsItem Details](http://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-working-with-OpsItems-editing-details.html)
  /// in the _AWS Systems Manager User Guide_.
  ///
  /// [opsItemId]: The ID of the OpsItem.
  ///
  /// [title]: A short heading that describes the nature of the OpsItem and the
  /// impacted resource.
  Future<UpdateOpsItemResponse> updateOpsItem(String opsItemId,
      {String description,
      Map<String, OpsItemDataValue> operationalData,
      List<String> operationalDataToDelete,
      List<OpsItemNotification> notifications,
      int priority,
      List<RelatedOpsItem> relatedOpsItems,
      String status,
      String title}) async {
    return UpdateOpsItemResponse.fromJson({});
  }

  /// Modifies an existing patch baseline. Fields not specified in the request
  /// are left unchanged.
  ///
  ///
  ///
  /// For information about valid key and value pairs in `PatchFilters` for each
  /// supported operating system type, see
  /// [PatchFilter](http://docs.aws.amazon.com/systems-manager/latest/APIReference/API_PatchFilter.html).
  ///
  /// [baselineId]: The ID of the patch baseline to update.
  ///
  /// [name]: The name of the patch baseline.
  ///
  /// [globalFilters]: A set of global filters used to include patches in the
  /// baseline.
  ///
  /// [approvalRules]: A set of rules used to include patches in the baseline.
  ///
  /// [approvedPatches]: A list of explicitly approved patches for the baseline.
  ///
  /// For information about accepted formats for lists of approved patches and
  /// rejected patches, see
  /// [Package Name Formats for Approved and Rejected Patch Lists](https://docs.aws.amazon.com/systems-manager/latest/userguide/patch-manager-approved-rejected-package-name-formats.html)
  /// in the _AWS Systems Manager User Guide_.
  ///
  /// [approvedPatchesComplianceLevel]: Assigns a new compliance severity level
  /// to an existing patch baseline.
  ///
  /// [approvedPatchesEnableNonSecurity]: Indicates whether the list of approved
  /// patches includes non-security updates that should be applied to the
  /// instances. The default value is 'false'. Applies to Linux instances only.
  ///
  /// [rejectedPatches]: A list of explicitly rejected patches for the baseline.
  ///
  /// For information about accepted formats for lists of approved patches and
  /// rejected patches, see
  /// [Package Name Formats for Approved and Rejected Patch Lists](https://docs.aws.amazon.com/systems-manager/latest/userguide/patch-manager-approved-rejected-package-name-formats.html)
  /// in the _AWS Systems Manager User Guide_.
  ///
  /// [rejectedPatchesAction]: The action for Patch Manager to take on patches
  /// included in the RejectedPackages list.
  ///
  /// *    **ALLOW_AS_DEPENDENCY**: A package in the Rejected patches list is
  /// installed only if it is a dependency of another package. It is considered
  /// compliant with the patch baseline, and its status is reported as
  /// _InstalledOther_. This is the default action if no option is specified.
  ///
  /// *    **BLOCK**: Packages in the RejectedPatches list, and packages that
  /// include them as dependencies, are not installed under any circumstances.
  /// If a package was installed before it was added to the Rejected patches
  /// list, it is considered non-compliant with the patch baseline, and its
  /// status is reported as _InstalledRejected_.
  ///
  /// [description]: A description of the patch baseline.
  ///
  /// [sources]: Information about the patches to use to update the instances,
  /// including target operating systems and source repositories. Applies to
  /// Linux instances only.
  ///
  /// [replace]: If True, then all fields that are required by the
  /// CreatePatchBaseline action are also required for this API request.
  /// Optional fields that are not specified are set to null.
  Future<UpdatePatchBaselineResult> updatePatchBaseline(String baselineId,
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
      bool replace}) async {
    return UpdatePatchBaselineResult.fromJson({});
  }

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
  ///
  /// [settingId]: The ID of the service setting to update.
  ///
  /// [settingValue]: The new value to specify for the service setting.
  Future<UpdateServiceSettingResult> updateServiceSetting(
      {@required String settingId, @required String settingValue}) async {
    return UpdateServiceSettingResult.fromJson({});
  }
}

/// An activation registers one or more on-premises servers or virtual machines
/// (VMs) with AWS so that you can configure those servers or VMs using Run
/// Command. A server or VM that has been registered with AWS is called a
/// managed instance.
class Activation {
  /// The ID created by Systems Manager when you submitted the activation.
  final String activationId;

  /// A user defined description of the activation.
  final String description;

  /// A name for the managed instance when it is created.
  final String defaultInstanceName;

  /// The Amazon Identity and Access Management (IAM) role to assign to the
  /// managed instance.
  final String iamRole;

  /// The maximum number of managed instances that can be registered using this
  /// activation.
  final int registrationLimit;

  /// The number of managed instances already registered with this activation.
  final int registrationsCount;

  /// The date when this activation can no longer be used to register managed
  /// instances.
  final DateTime expirationDate;

  /// Whether or not the activation is expired.
  final bool expired;

  /// The date the activation was created.
  final DateTime createdDate;

  /// Tags assigned to the activation.
  final List<Tag> tags;

  Activation({
    this.activationId,
    this.description,
    this.defaultInstanceName,
    this.iamRole,
    this.registrationLimit,
    this.registrationsCount,
    this.expirationDate,
    this.expired,
    this.createdDate,
    this.tags,
  });
  static Activation fromJson(Map<String, dynamic> json) => Activation();
}

class AddTagsToResourceResult {
  AddTagsToResourceResult();
  static AddTagsToResourceResult fromJson(Map<String, dynamic> json) =>
      AddTagsToResourceResult();
}

/// Describes an association of a Systems Manager document and an instance.
class Association {
  /// The name of the Systems Manager document.
  final String name;

  /// The ID of the instance.
  final String instanceId;

  /// The ID created by the system when you create an association. An
  /// association is a binding between a document and a set of targets with a
  /// schedule.
  final String associationId;

  /// The association version.
  final String associationVersion;

  /// The version of the document used in the association.
  final String documentVersion;

  /// The instances targeted by the request to create an association.
  final List<Target> targets;

  /// The date on which the association was last run.
  final DateTime lastExecutionDate;

  /// Information about the association.
  final AssociationOverview overview;

  /// A cron expression that specifies a schedule when the association runs.
  final String scheduleExpression;

  /// The association name.
  final String associationName;

  Association({
    this.name,
    this.instanceId,
    this.associationId,
    this.associationVersion,
    this.documentVersion,
    this.targets,
    this.lastExecutionDate,
    this.overview,
    this.scheduleExpression,
    this.associationName,
  });
  static Association fromJson(Map<String, dynamic> json) => Association();
}

/// Describes the parameters for a document.
class AssociationDescription {
  /// The name of the Systems Manager document.
  final String name;

  /// The ID of the instance.
  final String instanceId;

  /// The association version.
  final String associationVersion;

  /// The date when the association was made.
  final DateTime date;

  /// The date when the association was last updated.
  final DateTime lastUpdateAssociationDate;

  /// The association status.
  final AssociationStatus status;

  /// Information about the association.
  final AssociationOverview overview;

  /// The document version.
  final String documentVersion;

  /// Specify the target for the association. This target is required for
  /// associations that use an Automation document and target resources by using
  /// rate controls.
  final String automationTargetParameterName;

  /// A description of the parameters for a document.
  final Map<String, List<String>> parameters;

  /// The association ID.
  final String associationId;

  /// The instances targeted by the request.
  final List<Target> targets;

  /// A cron expression that specifies a schedule when the association runs.
  final String scheduleExpression;

  /// An Amazon S3 bucket where you want to store the output details of the
  /// request.
  final InstanceAssociationOutputLocation outputLocation;

  /// The date on which the association was last run.
  final DateTime lastExecutionDate;

  /// The last date on which the association was successfully run.
  final DateTime lastSuccessfulExecutionDate;

  /// The association name.
  final String associationName;

  /// The number of errors that are allowed before the system stops sending
  /// requests to run the association on additional targets. You can specify
  /// either an absolute number of errors, for example 10, or a percentage of
  /// the target set, for example 10%. If you specify 3, for example, the system
  /// stops sending requests when the fourth error is received. If you specify
  /// 0, then the system stops sending requests after the first error is
  /// returned. If you run an association on 50 instances and set MaxError to
  /// 10%, then the system stops sending the request when the sixth error is
  /// received.
  ///
  /// Executions that are already running an association when MaxErrors is
  /// reached are allowed to complete, but some of these executions may fail as
  /// well. If you need to ensure that there won't be more than max-errors
  /// failed executions, set MaxConcurrency to 1 so that executions proceed one
  /// at a time.
  final String maxErrors;

  /// The maximum number of targets allowed to run the association at the same
  /// time. You can specify a number, for example 10, or a percentage of the
  /// target set, for example 10%. The default value is 100%, which means all
  /// targets run the association at the same time.
  ///
  /// If a new instance starts and attempts to run an association while Systems
  /// Manager is running MaxConcurrency associations, the association is allowed
  /// to run. During the next association interval, the new instance will
  /// process its association within the limit specified for MaxConcurrency.
  final String maxConcurrency;

  /// The severity level that is assigned to the association.
  final String complianceSeverity;

  AssociationDescription({
    this.name,
    this.instanceId,
    this.associationVersion,
    this.date,
    this.lastUpdateAssociationDate,
    this.status,
    this.overview,
    this.documentVersion,
    this.automationTargetParameterName,
    this.parameters,
    this.associationId,
    this.targets,
    this.scheduleExpression,
    this.outputLocation,
    this.lastExecutionDate,
    this.lastSuccessfulExecutionDate,
    this.associationName,
    this.maxErrors,
    this.maxConcurrency,
    this.complianceSeverity,
  });
  static AssociationDescription fromJson(Map<String, dynamic> json) =>
      AssociationDescription();
}

/// Includes information about the specified association.
class AssociationExecution {
  /// The association ID.
  final String associationId;

  /// The association version.
  final String associationVersion;

  /// The execution ID for the association.
  final String executionId;

  /// The status of the association execution.
  final String status;

  /// Detailed status information about the execution.
  final String detailedStatus;

  /// The time the execution started.
  final DateTime createdTime;

  /// The date of the last execution.
  final DateTime lastExecutionDate;

  /// An aggregate status of the resources in the execution based on the status
  /// type.
  final String resourceCountByStatus;

  AssociationExecution({
    this.associationId,
    this.associationVersion,
    this.executionId,
    this.status,
    this.detailedStatus,
    this.createdTime,
    this.lastExecutionDate,
    this.resourceCountByStatus,
  });
  static AssociationExecution fromJson(Map<String, dynamic> json) =>
      AssociationExecution();
}

/// Filters used in the request.
class AssociationExecutionFilter {
  /// The key value used in the request.
  final String key;

  /// The value specified for the key.
  final String value;

  /// The filter type specified in the request.
  final String type;

  AssociationExecutionFilter({
    @required this.key,
    @required this.value,
    @required this.type,
  });
}

/// Includes information about the specified association execution.
class AssociationExecutionTarget {
  /// The association ID.
  final String associationId;

  /// The association version.
  final String associationVersion;

  /// The execution ID.
  final String executionId;

  /// The resource ID, for example, the instance ID where the association ran.
  final String resourceId;

  /// The resource type, for example, instance.
  final String resourceType;

  /// The association execution status.
  final String status;

  /// Detailed information about the execution status.
  final String detailedStatus;

  /// The date of the last execution.
  final DateTime lastExecutionDate;

  /// The location where the association details are saved.
  final OutputSource outputSource;

  AssociationExecutionTarget({
    this.associationId,
    this.associationVersion,
    this.executionId,
    this.resourceId,
    this.resourceType,
    this.status,
    this.detailedStatus,
    this.lastExecutionDate,
    this.outputSource,
  });
  static AssociationExecutionTarget fromJson(Map<String, dynamic> json) =>
      AssociationExecutionTarget();
}

/// Filters for the association execution.
class AssociationExecutionTargetsFilter {
  /// The key value used in the request.
  final String key;

  /// The value specified for the key.
  final String value;

  AssociationExecutionTargetsFilter({
    @required this.key,
    @required this.value,
  });
}

/// Describes a filter.
class AssociationFilter {
  /// The name of the filter.
  final String key;

  /// The filter value.
  final String value;

  AssociationFilter({
    @required this.key,
    @required this.value,
  });
}

/// Information about the association.
class AssociationOverview {
  /// The status of the association. Status can be: Pending, Success, or Failed.
  final String status;

  /// A detailed status of the association.
  final String detailedStatus;

  /// Returns the number of targets for the association status. For example, if
  /// you created an association with two instances, and one of them was
  /// successful, this would return the count of instances by status.
  final Map<String, int> associationStatusAggregatedCount;

  AssociationOverview({
    this.status,
    this.detailedStatus,
    this.associationStatusAggregatedCount,
  });
  static AssociationOverview fromJson(Map<String, dynamic> json) =>
      AssociationOverview();
}

/// Describes an association status.
class AssociationStatus {
  /// The date when the status changed.
  final DateTime date;

  /// The status.
  final String name;

  /// The reason for the status.
  final String message;

  /// A user-defined string.
  final String additionalInfo;

  AssociationStatus({
    @required this.date,
    @required this.name,
    @required this.message,
    this.additionalInfo,
  });
  static AssociationStatus fromJson(Map<String, dynamic> json) =>
      AssociationStatus();
}

/// Information about the association version.
class AssociationVersionInfo {
  /// The ID created by the system when the association was created.
  final String associationId;

  /// The association version.
  final String associationVersion;

  /// The date the association version was created.
  final DateTime createdDate;

  /// The name specified when the association was created.
  final String name;

  /// The version of a Systems Manager document used when the association
  /// version was created.
  final String documentVersion;

  /// Parameters specified when the association version was created.
  final Map<String, List<String>> parameters;

  /// The targets specified for the association when the association version was
  /// created.
  final List<Target> targets;

  /// The cron or rate schedule specified for the association when the
  /// association version was created.
  final String scheduleExpression;

  /// The location in Amazon S3 specified for the association when the
  /// association version was created.
  final InstanceAssociationOutputLocation outputLocation;

  /// The name specified for the association version when the association
  /// version was created.
  final String associationName;

  /// The number of errors that are allowed before the system stops sending
  /// requests to run the association on additional targets. You can specify
  /// either an absolute number of errors, for example 10, or a percentage of
  /// the target set, for example 10%. If you specify 3, for example, the system
  /// stops sending requests when the fourth error is received. If you specify
  /// 0, then the system stops sending requests after the first error is
  /// returned. If you run an association on 50 instances and set MaxError to
  /// 10%, then the system stops sending the request when the sixth error is
  /// received.
  ///
  /// Executions that are already running an association when MaxErrors is
  /// reached are allowed to complete, but some of these executions may fail as
  /// well. If you need to ensure that there won't be more than max-errors
  /// failed executions, set MaxConcurrency to 1 so that executions proceed one
  /// at a time.
  final String maxErrors;

  /// The maximum number of targets allowed to run the association at the same
  /// time. You can specify a number, for example 10, or a percentage of the
  /// target set, for example 10%. The default value is 100%, which means all
  /// targets run the association at the same time.
  ///
  /// If a new instance starts and attempts to run an association while Systems
  /// Manager is running MaxConcurrency associations, the association is allowed
  /// to run. During the next association interval, the new instance will
  /// process its association within the limit specified for MaxConcurrency.
  final String maxConcurrency;

  /// The severity level that is assigned to the association.
  final String complianceSeverity;

  AssociationVersionInfo({
    this.associationId,
    this.associationVersion,
    this.createdDate,
    this.name,
    this.documentVersion,
    this.parameters,
    this.targets,
    this.scheduleExpression,
    this.outputLocation,
    this.associationName,
    this.maxErrors,
    this.maxConcurrency,
    this.complianceSeverity,
  });
  static AssociationVersionInfo fromJson(Map<String, dynamic> json) =>
      AssociationVersionInfo();
}

/// A structure that includes attributes that describe a document attachment.
class AttachmentContent {
  /// The name of an attachment.
  final String name;

  /// The size of an attachment in bytes.
  final BigInt size;

  /// The cryptographic hash value of the document content.
  final String hash;

  /// The hash algorithm used to calculate the hash value.
  final String hashType;

  /// The URL location of the attachment content.
  final String url;

  AttachmentContent({
    this.name,
    this.size,
    this.hash,
    this.hashType,
    this.url,
  });
  static AttachmentContent fromJson(Map<String, dynamic> json) =>
      AttachmentContent();
}

/// An attribute of an attachment, such as the attachment name.
class AttachmentInformation {
  /// The name of the attachment.
  final String name;

  AttachmentInformation({
    this.name,
  });
  static AttachmentInformation fromJson(Map<String, dynamic> json) =>
      AttachmentInformation();
}

/// A key and value pair that identifies the location of an attachment to a
/// document.
class AttachmentsSource {
  /// The key of a key and value pair that identifies the location of an
  /// attachment to a document.
  final String key;

  /// The URL of the location of a document attachment, such as the URL of an
  /// Amazon S3 bucket.
  final List<String> values;

  AttachmentsSource({
    this.key,
    this.values,
  });
}

/// Detailed information about the current state of an individual Automation
/// execution.
class AutomationExecution {
  /// The execution ID.
  final String automationExecutionId;

  /// The name of the Automation document used during the execution.
  final String documentName;

  /// The version of the document to use during execution.
  final String documentVersion;

  /// The time the execution started.
  final DateTime executionStartTime;

  /// The time the execution finished.
  final DateTime executionEndTime;

  /// The execution status of the Automation.
  final String automationExecutionStatus;

  /// A list of details about the current state of all steps that comprise an
  /// execution. An Automation document contains a list of steps that are run in
  /// order.
  final List<StepExecution> stepExecutions;

  /// A boolean value that indicates if the response contains the full list of
  /// the Automation step executions. If true, use the
  /// DescribeAutomationStepExecutions API action to get the full list of step
  /// executions.
  final bool stepExecutionsTruncated;

  /// The key-value map of execution parameters, which were supplied when
  /// calling StartAutomationExecution.
  final Map<String, List<String>> parameters;

  /// The list of execution outputs as defined in the automation document.
  final Map<String, List<String>> outputs;

  /// A message describing why an execution has failed, if the status is set to
  /// Failed.
  final String failureMessage;

  /// The automation execution mode.
  final String mode;

  /// The AutomationExecutionId of the parent automation.
  final String parentAutomationExecutionId;

  /// The Amazon Resource Name (ARN) of the user who ran the automation.
  final String executedBy;

  /// The name of the step that is currently running.
  final String currentStepName;

  /// The action of the step that is currently running.
  final String currentAction;

  /// The parameter name.
  final String targetParameterName;

  /// The specified targets.
  final List<Target> targets;

  /// The specified key-value mapping of document parameters to target
  /// resources.
  final List<Map<String, List<String>>> targetMaps;

  /// A list of resolved targets in the rate control execution.
  final ResolvedTargets resolvedTargets;

  /// The MaxConcurrency value specified by the user when the execution started.
  final String maxConcurrency;

  /// The MaxErrors value specified by the user when the execution started.
  final String maxErrors;

  /// The target of the execution.
  final String target;

  /// The combination of AWS Regions and/or AWS accounts where you want to run
  /// the Automation.
  final List<TargetLocation> targetLocations;

  /// An aggregate of step execution statuses displayed in the AWS Console for a
  /// multi-Region and multi-account Automation execution.
  final ProgressCounters progressCounters;

  AutomationExecution({
    this.automationExecutionId,
    this.documentName,
    this.documentVersion,
    this.executionStartTime,
    this.executionEndTime,
    this.automationExecutionStatus,
    this.stepExecutions,
    this.stepExecutionsTruncated,
    this.parameters,
    this.outputs,
    this.failureMessage,
    this.mode,
    this.parentAutomationExecutionId,
    this.executedBy,
    this.currentStepName,
    this.currentAction,
    this.targetParameterName,
    this.targets,
    this.targetMaps,
    this.resolvedTargets,
    this.maxConcurrency,
    this.maxErrors,
    this.target,
    this.targetLocations,
    this.progressCounters,
  });
  static AutomationExecution fromJson(Map<String, dynamic> json) =>
      AutomationExecution();
}

/// A filter used to match specific automation executions. This is used to limit
/// the scope of Automation execution information returned.
class AutomationExecutionFilter {
  /// One or more keys to limit the results. Valid filter keys include the
  /// following: DocumentNamePrefix, ExecutionStatus, ExecutionId,
  /// ParentExecutionId, CurrentAction, StartTimeBefore, StartTimeAfter.
  final String key;

  /// The values used to limit the execution information associated with the
  /// filter's key.
  final List<String> values;

  AutomationExecutionFilter({
    @required this.key,
    @required this.values,
  });
}

/// Details about a specific Automation execution.
class AutomationExecutionMetadata {
  /// The execution ID.
  final String automationExecutionId;

  /// The name of the Automation document used during execution.
  final String documentName;

  /// The document version used during the execution.
  final String documentVersion;

  /// The status of the execution. Valid values include: Running, Succeeded,
  /// Failed, Timed out, or Cancelled.
  final String automationExecutionStatus;

  /// The time the execution started.>
  final DateTime executionStartTime;

  /// The time the execution finished. This is not populated if the execution is
  /// still in progress.
  final DateTime executionEndTime;

  /// The IAM role ARN of the user who ran the Automation.
  final String executedBy;

  /// An Amazon S3 bucket where execution information is stored.
  final String logFile;

  /// The list of execution outputs as defined in the Automation document.
  final Map<String, List<String>> outputs;

  /// The Automation execution mode.
  final String mode;

  /// The ExecutionId of the parent Automation.
  final String parentAutomationExecutionId;

  /// The name of the step that is currently running.
  final String currentStepName;

  /// The action of the step that is currently running.
  final String currentAction;

  /// The list of execution outputs as defined in the Automation document.
  final String failureMessage;

  /// The list of execution outputs as defined in the Automation document.
  final String targetParameterName;

  /// The targets defined by the user when starting the Automation.
  final List<Target> targets;

  /// The specified key-value mapping of document parameters to target
  /// resources.
  final List<Map<String, List<String>>> targetMaps;

  /// A list of targets that resolved during the execution.
  final ResolvedTargets resolvedTargets;

  /// The MaxConcurrency value specified by the user when starting the
  /// Automation.
  final String maxConcurrency;

  /// The MaxErrors value specified by the user when starting the Automation.
  final String maxErrors;

  /// The list of execution outputs as defined in the Automation document.
  final String target;

  /// Use this filter with DescribeAutomationExecutions. Specify either Local or
  /// CrossAccount. CrossAccount is an Automation that runs in multiple AWS
  /// Regions and accounts. For more information, see
  /// [Executing Automations in Multiple AWS Regions and Accounts](http://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-automation-multiple-accounts-and-regions.html)
  /// in the _AWS Systems Manager User Guide_.
  final String automationType;

  AutomationExecutionMetadata({
    this.automationExecutionId,
    this.documentName,
    this.documentVersion,
    this.automationExecutionStatus,
    this.executionStartTime,
    this.executionEndTime,
    this.executedBy,
    this.logFile,
    this.outputs,
    this.mode,
    this.parentAutomationExecutionId,
    this.currentStepName,
    this.currentAction,
    this.failureMessage,
    this.targetParameterName,
    this.targets,
    this.targetMaps,
    this.resolvedTargets,
    this.maxConcurrency,
    this.maxErrors,
    this.target,
    this.automationType,
  });
  static AutomationExecutionMetadata fromJson(Map<String, dynamic> json) =>
      AutomationExecutionMetadata();
}

/// Whether or not the command was successfully canceled. There is no guarantee
/// that a request can be canceled.
class CancelCommandResult {
  CancelCommandResult();
  static CancelCommandResult fromJson(Map<String, dynamic> json) =>
      CancelCommandResult();
}

class CancelMaintenanceWindowExecutionResult {
  /// The ID of the maintenance window execution that has been stopped.
  final String windowExecutionId;

  CancelMaintenanceWindowExecutionResult({
    this.windowExecutionId,
  });
  static CancelMaintenanceWindowExecutionResult fromJson(
          Map<String, dynamic> json) =>
      CancelMaintenanceWindowExecutionResult();
}

/// Configuration options for sending command output to CloudWatch Logs.
class CloudWatchOutputConfig {
  /// The name of the CloudWatch log group where you want to send command
  /// output. If you don't specify a group name, Systems Manager automatically
  /// creates a log group for you. The log group uses the following naming
  /// format: aws/ssm/_SystemsManagerDocumentName_.
  final String cloudWatchLogGroupName;

  /// Enables Systems Manager to send command output to CloudWatch Logs.
  final bool cloudWatchOutputEnabled;

  CloudWatchOutputConfig({
    this.cloudWatchLogGroupName,
    this.cloudWatchOutputEnabled,
  });
  static CloudWatchOutputConfig fromJson(Map<String, dynamic> json) =>
      CloudWatchOutputConfig();
}

/// Describes a command request.
class Command {
  /// A unique identifier for this command.
  final String commandId;

  /// The name of the document requested for execution.
  final String documentName;

  /// The SSM document version.
  final String documentVersion;

  /// User-specified information about the command, such as a brief description
  /// of what the command should do.
  final String comment;

  /// If this time is reached and the command has not already started running,
  /// it will not run. Calculated based on the ExpiresAfter user input provided
  /// as part of the SendCommand API.
  final DateTime expiresAfter;

  /// The parameter values to be inserted in the document when running the
  /// command.
  final Map<String, List<String>> parameters;

  /// The instance IDs against which this command was requested.
  final List<String> instanceIds;

  /// An array of search criteria that targets instances using a Key,Value
  /// combination that you specify. Targets is required if you don't provide one
  /// or more instance IDs in the call.
  final List<Target> targets;

  /// The date and time the command was requested.
  final DateTime requestedDateTime;

  /// The status of the command.
  final String status;

  /// A detailed status of the command execution. StatusDetails includes more
  /// information than Status because it includes states resulting from error
  /// and concurrency control parameters. StatusDetails can show different
  /// results than Status. For more information about these statuses, see
  /// [Understanding Command Statuses](http://docs.aws.amazon.com/systems-manager/latest/userguide/monitor-commands.html)
  /// in the _AWS Systems Manager User Guide_. StatusDetails can be one of the
  /// following values:
  ///
  /// *   Pending: The command has not been sent to any instances.
  ///
  /// *   In Progress: The command has been sent to at least one instance but
  /// has not reached a final state on all instances.
  ///
  /// *   Success: The command successfully ran on all invocations. This is a
  /// terminal state.
  ///
  /// *   Delivery Timed Out: The value of MaxErrors or more command invocations
  /// shows a status of Delivery Timed Out. This is a terminal state.
  ///
  /// *   Execution Timed Out: The value of MaxErrors or more command
  /// invocations shows a status of Execution Timed Out. This is a terminal
  /// state.
  ///
  /// *   Failed: The value of MaxErrors or more command invocations shows a
  /// status of Failed. This is a terminal state.
  ///
  /// *   Incomplete: The command was attempted on all instances and one or more
  /// invocations does not have a value of Success but not enough invocations
  /// failed for the status to be Failed. This is a terminal state.
  ///
  /// *   Canceled: The command was terminated before it was completed. This is
  /// a terminal state.
  ///
  /// *   Rate Exceeded: The number of instances targeted by the command
  /// exceeded the account limit for pending invocations. The system has
  /// canceled the command before running it on any instance. This is a terminal
  /// state.
  final String statusDetails;

  /// (Deprecated) You can no longer specify this parameter. The system ignores
  /// it. Instead, Systems Manager automatically determines the Amazon S3 bucket
  /// region.
  final String outputS3Region;

  /// The S3 bucket where the responses to the command executions should be
  /// stored. This was requested when issuing the command.
  final String outputS3BucketName;

  /// The S3 directory path inside the bucket where the responses to the command
  /// executions should be stored. This was requested when issuing the command.
  final String outputS3KeyPrefix;

  /// The maximum number of instances that are allowed to run the command at the
  /// same time. You can specify a number of instances, such as 10, or a
  /// percentage of instances, such as 10%. The default value is 50. For more
  /// information about how to use MaxConcurrency, see
  /// [Running Commands Using Systems Manager Run Command](http://docs.aws.amazon.com/systems-manager/latest/userguide/run-command.html)
  /// in the _AWS Systems Manager User Guide_.
  final String maxConcurrency;

  /// The maximum number of errors allowed before the system stops sending the
  /// command to additional targets. You can specify a number of errors, such as
  /// 10, or a percentage or errors, such as 10%. The default value is 0. For
  /// more information about how to use MaxErrors, see
  /// [Running Commands Using Systems Manager Run Command](http://docs.aws.amazon.com/systems-manager/latest/userguide/run-command.html)
  /// in the _AWS Systems Manager User Guide_.
  final String maxErrors;

  /// The number of targets for the command.
  final int targetCount;

  /// The number of targets for which the command invocation reached a terminal
  /// state. Terminal states include the following: Success, Failed, Execution
  /// Timed Out, Delivery Timed Out, Canceled, Terminated, or Undeliverable.
  final int completedCount;

  /// The number of targets for which the status is Failed or Execution Timed
  /// Out.
  final int errorCount;

  /// The number of targets for which the status is Delivery Timed Out.
  final int deliveryTimedOutCount;

  /// The IAM service role that Run Command uses to act on your behalf when
  /// sending notifications about command status changes.
  final String serviceRole;

  /// Configurations for sending notifications about command status changes.
  final NotificationConfig notificationConfig;

  /// CloudWatch Logs information where you want Systems Manager to send the
  /// command output.
  final CloudWatchOutputConfig cloudWatchOutputConfig;

  Command({
    this.commandId,
    this.documentName,
    this.documentVersion,
    this.comment,
    this.expiresAfter,
    this.parameters,
    this.instanceIds,
    this.targets,
    this.requestedDateTime,
    this.status,
    this.statusDetails,
    this.outputS3Region,
    this.outputS3BucketName,
    this.outputS3KeyPrefix,
    this.maxConcurrency,
    this.maxErrors,
    this.targetCount,
    this.completedCount,
    this.errorCount,
    this.deliveryTimedOutCount,
    this.serviceRole,
    this.notificationConfig,
    this.cloudWatchOutputConfig,
  });
  static Command fromJson(Map<String, dynamic> json) => Command();
}

/// Describes a command filter.
class CommandFilter {
  /// The name of the filter.
  final String key;

  /// The filter value. Valid values for each filter key are as follows:
  ///
  /// *    **InvokedAfter**: Specify a timestamp to limit your results. For
  /// example, specify `2018-07-07T00:00:00Z` to see a list of command
  /// executions occurring July 7, 2018, and later.
  ///
  /// *    **InvokedBefore**: Specify a timestamp to limit your results. For
  /// example, specify `2018-07-07T00:00:00Z` to see a list of command
  /// executions from before July 7, 2018.
  ///
  /// *    **Status**: Specify a valid command status to see a list of all
  /// command executions with that status. Status values you can specify
  /// include:
  ///
  ///     *    `Pending`
  ///
  ///     *    `InProgress`
  ///
  ///     *    `Success`
  ///
  ///     *    `Cancelled`
  ///
  ///     *    `Failed`
  ///
  ///     *    `TimedOut`
  ///
  ///     *    `Cancelling`
  ///
  ///
  /// *    **DocumentName**: Specify name of the SSM document for which you want
  /// to see command execution results. For example, specify
  /// `AWS-RunPatchBaseline` to see command executions that used this SSM
  /// document to perform security patching operations on instances.
  ///
  /// *    **ExecutionStage**: Specify one of the following values:
  ///
  ///     *    `Executing`: Returns a list of command executions that are
  /// currently still running.
  ///
  ///     *    `Complete`: Returns a list of command executions that have
  /// already completed.
  final String value;

  CommandFilter({
    @required this.key,
    @required this.value,
  });
}

/// An invocation is copy of a command sent to a specific instance. A command
/// can apply to one or more instances. A command invocation applies to one
/// instance. For example, if a user runs SendCommand against three instances,
/// then a command invocation is created for each requested instance ID. A
/// command invocation returns status and detail information about a command you
/// ran.
class CommandInvocation {
  /// The command against which this invocation was requested.
  final String commandId;

  /// The instance ID in which this invocation was requested.
  final String instanceId;

  /// The name of the invocation target. For Amazon EC2 instances this is the
  /// value for the aws:Name tag. For on-premises instances, this is the name of
  /// the instance.
  final String instanceName;

  /// User-specified information about the command, such as a brief description
  /// of what the command should do.
  final String comment;

  /// The document name that was requested for execution.
  final String documentName;

  /// The SSM document version.
  final String documentVersion;

  /// The time and date the request was sent to this instance.
  final DateTime requestedDateTime;

  /// Whether or not the invocation succeeded, failed, or is pending.
  final String status;

  /// A detailed status of the command execution for each invocation (each
  /// instance targeted by the command). StatusDetails includes more information
  /// than Status because it includes states resulting from error and
  /// concurrency control parameters. StatusDetails can show different results
  /// than Status. For more information about these statuses, see
  /// [Understanding Command Statuses](http://docs.aws.amazon.com/systems-manager/latest/userguide/monitor-commands.html)
  /// in the _AWS Systems Manager User Guide_. StatusDetails can be one of the
  /// following values:
  ///
  /// *   Pending: The command has not been sent to the instance.
  ///
  /// *   In Progress: The command has been sent to the instance but has not
  /// reached a terminal state.
  ///
  /// *   Success: The execution of the command or plugin was successfully
  /// completed. This is a terminal state.
  ///
  /// *   Delivery Timed Out: The command was not delivered to the instance
  /// before the delivery timeout expired. Delivery timeouts do not count
  /// against the parent command's MaxErrors limit, but they do contribute to
  /// whether the parent command status is Success or Incomplete. This is a
  /// terminal state.
  ///
  /// *   Execution Timed Out: Command execution started on the instance, but
  /// the execution was not complete before the execution timeout expired.
  /// Execution timeouts count against the MaxErrors limit of the parent
  /// command. This is a terminal state.
  ///
  /// *   Failed: The command was not successful on the instance. For a plugin,
  /// this indicates that the result code was not zero. For a command
  /// invocation, this indicates that the result code for one or more plugins
  /// was not zero. Invocation failures count against the MaxErrors limit of the
  /// parent command. This is a terminal state.
  ///
  /// *   Canceled: The command was terminated before it was completed. This is
  /// a terminal state.
  ///
  /// *   Undeliverable: The command can't be delivered to the instance. The
  /// instance might not exist or might not be responding. Undeliverable
  /// invocations don't count against the parent command's MaxErrors limit and
  /// don't contribute to whether the parent command status is Success or
  /// Incomplete. This is a terminal state.
  ///
  /// *   Terminated: The parent command exceeded its MaxErrors limit and
  /// subsequent command invocations were canceled by the system. This is a
  /// terminal state.
  final String statusDetails;

  ///  Gets the trace output sent by the agent.
  final String traceOutput;

  /// The URL to the plugin's StdOut file in Amazon S3, if the Amazon S3 bucket
  /// was defined for the parent command. For an invocation, StandardOutputUrl
  /// is populated if there is just one plugin defined for the command, and the
  /// Amazon S3 bucket was defined for the command.
  final String standardOutputUrl;

  /// The URL to the plugin's StdErr file in Amazon S3, if the Amazon S3 bucket
  /// was defined for the parent command. For an invocation, StandardErrorUrl is
  /// populated if there is just one plugin defined for the command, and the
  /// Amazon S3 bucket was defined for the command.
  final String standardErrorUrl;

  final List<CommandPlugin> commandPlugins;

  /// The IAM service role that Run Command uses to act on your behalf when
  /// sending notifications about command status changes on a per instance
  /// basis.
  final String serviceRole;

  /// Configurations for sending notifications about command status changes on a
  /// per instance basis.
  final NotificationConfig notificationConfig;

  /// CloudWatch Logs information where you want Systems Manager to send the
  /// command output.
  final CloudWatchOutputConfig cloudWatchOutputConfig;

  CommandInvocation({
    this.commandId,
    this.instanceId,
    this.instanceName,
    this.comment,
    this.documentName,
    this.documentVersion,
    this.requestedDateTime,
    this.status,
    this.statusDetails,
    this.traceOutput,
    this.standardOutputUrl,
    this.standardErrorUrl,
    this.commandPlugins,
    this.serviceRole,
    this.notificationConfig,
    this.cloudWatchOutputConfig,
  });
  static CommandInvocation fromJson(Map<String, dynamic> json) =>
      CommandInvocation();
}

/// Describes plugin details.
class CommandPlugin {
  /// The name of the plugin. Must be one of the following: aws:updateAgent,
  /// aws:domainjoin, aws:applications, aws:runPowerShellScript, aws:psmodule,
  /// aws:cloudWatch, aws:runShellScript, or aws:updateSSMAgent.
  final String name;

  /// The status of this plugin. You can run a document with multiple plugins.
  final String status;

  /// A detailed status of the plugin execution. StatusDetails includes more
  /// information than Status because it includes states resulting from error
  /// and concurrency control parameters. StatusDetails can show different
  /// results than Status. For more information about these statuses, see
  /// [Understanding Command Statuses](http://docs.aws.amazon.com/systems-manager/latest/userguide/monitor-commands.html)
  /// in the _AWS Systems Manager User Guide_. StatusDetails can be one of the
  /// following values:
  ///
  /// *   Pending: The command has not been sent to the instance.
  ///
  /// *   In Progress: The command has been sent to the instance but has not
  /// reached a terminal state.
  ///
  /// *   Success: The execution of the command or plugin was successfully
  /// completed. This is a terminal state.
  ///
  /// *   Delivery Timed Out: The command was not delivered to the instance
  /// before the delivery timeout expired. Delivery timeouts do not count
  /// against the parent command's MaxErrors limit, but they do contribute to
  /// whether the parent command status is Success or Incomplete. This is a
  /// terminal state.
  ///
  /// *   Execution Timed Out: Command execution started on the instance, but
  /// the execution was not complete before the execution timeout expired.
  /// Execution timeouts count against the MaxErrors limit of the parent
  /// command. This is a terminal state.
  ///
  /// *   Failed: The command was not successful on the instance. For a plugin,
  /// this indicates that the result code was not zero. For a command
  /// invocation, this indicates that the result code for one or more plugins
  /// was not zero. Invocation failures count against the MaxErrors limit of the
  /// parent command. This is a terminal state.
  ///
  /// *   Canceled: The command was terminated before it was completed. This is
  /// a terminal state.
  ///
  /// *   Undeliverable: The command can't be delivered to the instance. The
  /// instance might not exist, or it might not be responding. Undeliverable
  /// invocations don't count against the parent command's MaxErrors limit, and
  /// they don't contribute to whether the parent command status is Success or
  /// Incomplete. This is a terminal state.
  ///
  /// *   Terminated: The parent command exceeded its MaxErrors limit and
  /// subsequent command invocations were canceled by the system. This is a
  /// terminal state.
  final String statusDetails;

  /// A numeric response code generated after running the plugin.
  final int responseCode;

  /// The time the plugin started running.
  final DateTime responseStartDateTime;

  /// The time the plugin stopped running. Could stop prematurely if, for
  /// example, a cancel command was sent.
  final DateTime responseFinishDateTime;

  /// Output of the plugin execution.
  final String output;

  /// The URL for the complete text written by the plugin to stdout in Amazon
  /// S3. If the Amazon S3 bucket for the command was not specified, then this
  /// string is empty.
  final String standardOutputUrl;

  /// The URL for the complete text written by the plugin to stderr. If
  /// execution is not yet complete, then this string is empty.
  final String standardErrorUrl;

  /// (Deprecated) You can no longer specify this parameter. The system ignores
  /// it. Instead, Systems Manager automatically determines the Amazon S3 bucket
  /// region.
  final String outputS3Region;

  /// The S3 bucket where the responses to the command executions should be
  /// stored. This was requested when issuing the command. For example, in the
  /// following response:
  ///
  ///
  /// test_folder/ab19cb99-a030-46dd-9dfc-8eSAMPLEPre-Fix/i-1234567876543/awsrunShellScript
  ///
  /// test_folder is the name of the Amazon S3 bucket;
  ///
  ///  ab19cb99-a030-46dd-9dfc-8eSAMPLEPre-Fix is the name of the S3 prefix;
  ///
  /// i-1234567876543 is the instance ID;
  ///
  /// awsrunShellScript is the name of the plugin.
  final String outputS3BucketName;

  /// The S3 directory path inside the bucket where the responses to the command
  /// executions should be stored. This was requested when issuing the command.
  /// For example, in the following response:
  ///
  ///
  /// test_folder/ab19cb99-a030-46dd-9dfc-8eSAMPLEPre-Fix/i-1234567876543/awsrunShellScript
  ///
  /// test_folder is the name of the Amazon S3 bucket;
  ///
  ///  ab19cb99-a030-46dd-9dfc-8eSAMPLEPre-Fix is the name of the S3 prefix;
  ///
  /// i-1234567876543 is the instance ID;
  ///
  /// awsrunShellScript is the name of the plugin.
  final String outputS3KeyPrefix;

  CommandPlugin({
    this.name,
    this.status,
    this.statusDetails,
    this.responseCode,
    this.responseStartDateTime,
    this.responseFinishDateTime,
    this.output,
    this.standardOutputUrl,
    this.standardErrorUrl,
    this.outputS3Region,
    this.outputS3BucketName,
    this.outputS3KeyPrefix,
  });
  static CommandPlugin fromJson(Map<String, dynamic> json) => CommandPlugin();
}

/// A summary of the call execution that includes an execution ID, the type of
/// execution (for example, `Command`), and the date/time of the execution using
/// a datetime object that is saved in the following format:
/// yyyy-MM-dd'T'HH:mm:ss'Z'.
class ComplianceExecutionSummary {
  /// The time the execution ran as a datetime object that is saved in the
  /// following format: yyyy-MM-dd'T'HH:mm:ss'Z'.
  final DateTime executionTime;

  /// An ID created by the system when `PutComplianceItems` was called. For
  /// example, `CommandID` is a valid execution ID. You can use this ID in
  /// subsequent calls.
  final String executionId;

  /// The type of execution. For example, `Command` is a valid execution type.
  final String executionType;

  ComplianceExecutionSummary({
    @required this.executionTime,
    this.executionId,
    this.executionType,
  });
  static ComplianceExecutionSummary fromJson(Map<String, dynamic> json) =>
      ComplianceExecutionSummary();
}

/// Information about the compliance as defined by the resource type. For
/// example, for a patch resource type, `Items` includes information about the
/// PatchSeverity, Classification, etc.
class ComplianceItem {
  /// The compliance type. For example, Association (for a State Manager
  /// association), Patch, or Custom:`string` are all valid compliance types.
  final String complianceType;

  /// The type of resource. `ManagedInstance` is currently the only supported
  /// resource type.
  final String resourceType;

  /// An ID for the resource. For a managed instance, this is the instance ID.
  final String resourceId;

  /// An ID for the compliance item. For example, if the compliance item is a
  /// Windows patch, the ID could be the number of the KB article; for example:
  /// KB4010320.
  final String id;

  /// A title for the compliance item. For example, if the compliance item is a
  /// Windows patch, the title could be the title of the KB article for the
  /// patch; for example: Security Update for Active Directory Federation
  /// Services.
  final String title;

  /// The status of the compliance item. An item is either COMPLIANT or
  /// NON_COMPLIANT.
  final String status;

  /// The severity of the compliance status. Severity can be one of the
  /// following: Critical, High, Medium, Low, Informational, Unspecified.
  final String severity;

  /// A summary for the compliance item. The summary includes an execution ID,
  /// the execution type (for example, command), and the execution time.
  final ComplianceExecutionSummary executionSummary;

  /// A "Key": "Value" tag combination for the compliance item.
  final Map<String, String> details;

  ComplianceItem({
    this.complianceType,
    this.resourceType,
    this.resourceId,
    this.id,
    this.title,
    this.status,
    this.severity,
    this.executionSummary,
    this.details,
  });
  static ComplianceItem fromJson(Map<String, dynamic> json) => ComplianceItem();
}

/// Information about a compliance item.
class ComplianceItemEntry {
  /// The compliance item ID. For example, if the compliance item is a Windows
  /// patch, the ID could be the number of the KB article.
  final String id;

  /// The title of the compliance item. For example, if the compliance item is a
  /// Windows patch, the title could be the title of the KB article for the
  /// patch; for example: Security Update for Active Directory Federation
  /// Services.
  final String title;

  /// The severity of the compliance status. Severity can be one of the
  /// following: Critical, High, Medium, Low, Informational, Unspecified.
  final String severity;

  /// The status of the compliance item. An item is either COMPLIANT or
  /// NON_COMPLIANT.
  final String status;

  /// A "Key": "Value" tag combination for the compliance item.
  final Map<String, String> details;

  ComplianceItemEntry({
    this.id,
    this.title,
    @required this.severity,
    @required this.status,
    this.details,
  });
}

/// One or more filters. Use a filter to return a more specific list of results.
class ComplianceStringFilter {
  /// The name of the filter.
  final String key;

  /// The value for which to search.
  final List<String> values;

  /// The type of comparison that should be performed for the value: Equal,
  /// NotEqual, BeginWith, LessThan, or GreaterThan.
  final String type;

  ComplianceStringFilter({
    this.key,
    this.values,
    this.type,
  });
}

/// A summary of compliance information by compliance type.
class ComplianceSummaryItem {
  /// The type of compliance item. For example, the compliance type can be
  /// Association, Patch, or Custom:string.
  final String complianceType;

  /// A list of COMPLIANT items for the specified compliance type.
  final CompliantSummary compliantSummary;

  /// A list of NON_COMPLIANT items for the specified compliance type.
  final NonCompliantSummary nonCompliantSummary;

  ComplianceSummaryItem({
    this.complianceType,
    this.compliantSummary,
    this.nonCompliantSummary,
  });
  static ComplianceSummaryItem fromJson(Map<String, dynamic> json) =>
      ComplianceSummaryItem();
}

/// A summary of resources that are compliant. The summary is organized
/// according to the resource count for each compliance type.
class CompliantSummary {
  /// The total number of resources that are compliant.
  final int compliantCount;

  /// A summary of the compliance severity by compliance type.
  final SeveritySummary severitySummary;

  CompliantSummary({
    this.compliantCount,
    this.severitySummary,
  });
  static CompliantSummary fromJson(Map<String, dynamic> json) =>
      CompliantSummary();
}

class CreateActivationResult {
  /// The ID number generated by the system when it processed the activation.
  /// The activation ID functions like a user name.
  final String activationId;

  /// The code the system generates when it processes the activation. The
  /// activation code functions like a password to validate the activation ID.
  final String activationCode;

  CreateActivationResult({
    this.activationId,
    this.activationCode,
  });
  static CreateActivationResult fromJson(Map<String, dynamic> json) =>
      CreateActivationResult();
}

/// Describes the association of a Systems Manager SSM document and an instance.
class CreateAssociationBatchRequestEntry {
  /// The name of the SSM document that contains the configuration information
  /// for the instance. You can specify Command or Automation documents.
  ///
  /// You can specify AWS-predefined documents, documents you created, or a
  /// document that is shared with you from another account.
  ///
  /// For SSM documents that are shared with you from other AWS accounts, you
  /// must specify the complete SSM document ARN, in the following format:
  ///
  ///  `arn:aws:ssm:_region_:_account-id_:document/_document-name_`
  ///
  /// For example:
  ///
  ///  `arn:aws:ssm:us-east-2:12345678912:document/My-Shared-Document`
  ///
  /// For AWS-predefined documents and SSM documents you created in your
  /// account, you only need to specify the document name. For example,
  /// `AWS-ApplyPatchBaseline` or `My-Document`.
  final String name;

  /// The ID of the instance.
  final String instanceId;

  /// A description of the parameters for a document.
  final Map<String, List<String>> parameters;

  /// Specify the target for the association. This target is required for
  /// associations that use an Automation document and target resources by using
  /// rate controls.
  final String automationTargetParameterName;

  /// The document version.
  final String documentVersion;

  /// The instances targeted by the request.
  final List<Target> targets;

  /// A cron expression that specifies a schedule when the association runs.
  final String scheduleExpression;

  /// An Amazon S3 bucket where you want to store the results of this request.
  final InstanceAssociationOutputLocation outputLocation;

  /// Specify a descriptive name for the association.
  final String associationName;

  /// The number of errors that are allowed before the system stops sending
  /// requests to run the association on additional targets. You can specify
  /// either an absolute number of errors, for example 10, or a percentage of
  /// the target set, for example 10%. If you specify 3, for example, the system
  /// stops sending requests when the fourth error is received. If you specify
  /// 0, then the system stops sending requests after the first error is
  /// returned. If you run an association on 50 instances and set MaxError to
  /// 10%, then the system stops sending the request when the sixth error is
  /// received.
  ///
  /// Executions that are already running an association when MaxErrors is
  /// reached are allowed to complete, but some of these executions may fail as
  /// well. If you need to ensure that there won't be more than max-errors
  /// failed executions, set MaxConcurrency to 1 so that executions proceed one
  /// at a time.
  final String maxErrors;

  /// The maximum number of targets allowed to run the association at the same
  /// time. You can specify a number, for example 10, or a percentage of the
  /// target set, for example 10%. The default value is 100%, which means all
  /// targets run the association at the same time.
  ///
  /// If a new instance starts and attempts to run an association while Systems
  /// Manager is running MaxConcurrency associations, the association is allowed
  /// to run. During the next association interval, the new instance will
  /// process its association within the limit specified for MaxConcurrency.
  final String maxConcurrency;

  /// The severity level to assign to the association.
  final String complianceSeverity;

  CreateAssociationBatchRequestEntry({
    @required this.name,
    this.instanceId,
    this.parameters,
    this.automationTargetParameterName,
    this.documentVersion,
    this.targets,
    this.scheduleExpression,
    this.outputLocation,
    this.associationName,
    this.maxErrors,
    this.maxConcurrency,
    this.complianceSeverity,
  });
  static CreateAssociationBatchRequestEntry fromJson(
          Map<String, dynamic> json) =>
      CreateAssociationBatchRequestEntry();
}

class CreateAssociationBatchResult {
  /// Information about the associations that succeeded.
  final List<AssociationDescription> successful;

  /// Information about the associations that failed.
  final List<FailedCreateAssociation> failed;

  CreateAssociationBatchResult({
    this.successful,
    this.failed,
  });
  static CreateAssociationBatchResult fromJson(Map<String, dynamic> json) =>
      CreateAssociationBatchResult();
}

class CreateAssociationResult {
  /// Information about the association.
  final AssociationDescription associationDescription;

  CreateAssociationResult({
    this.associationDescription,
  });
  static CreateAssociationResult fromJson(Map<String, dynamic> json) =>
      CreateAssociationResult();
}

class CreateDocumentResult {
  /// Information about the Systems Manager document.
  final DocumentDescription documentDescription;

  CreateDocumentResult({
    this.documentDescription,
  });
  static CreateDocumentResult fromJson(Map<String, dynamic> json) =>
      CreateDocumentResult();
}

class CreateMaintenanceWindowResult {
  /// The ID of the created maintenance window.
  final String windowId;

  CreateMaintenanceWindowResult({
    this.windowId,
  });
  static CreateMaintenanceWindowResult fromJson(Map<String, dynamic> json) =>
      CreateMaintenanceWindowResult();
}

class CreateOpsItemResponse {
  /// The ID of the OpsItem.
  final String opsItemId;

  CreateOpsItemResponse({
    this.opsItemId,
  });
  static CreateOpsItemResponse fromJson(Map<String, dynamic> json) =>
      CreateOpsItemResponse();
}

class CreatePatchBaselineResult {
  /// The ID of the created patch baseline.
  final String baselineId;

  CreatePatchBaselineResult({
    this.baselineId,
  });
  static CreatePatchBaselineResult fromJson(Map<String, dynamic> json) =>
      CreatePatchBaselineResult();
}

class CreateResourceDataSyncResult {
  CreateResourceDataSyncResult();
  static CreateResourceDataSyncResult fromJson(Map<String, dynamic> json) =>
      CreateResourceDataSyncResult();
}

class DeleteActivationResult {
  DeleteActivationResult();
  static DeleteActivationResult fromJson(Map<String, dynamic> json) =>
      DeleteActivationResult();
}

class DeleteAssociationResult {
  DeleteAssociationResult();
  static DeleteAssociationResult fromJson(Map<String, dynamic> json) =>
      DeleteAssociationResult();
}

class DeleteDocumentResult {
  DeleteDocumentResult();
  static DeleteDocumentResult fromJson(Map<String, dynamic> json) =>
      DeleteDocumentResult();
}

class DeleteInventoryResult {
  /// Every `DeleteInventory` action is assigned a unique ID. This option
  /// returns a unique ID. You can use this ID to query the status of a delete
  /// operation. This option is useful for ensuring that a delete operation has
  /// completed before you begin other actions.
  final String deletionId;

  /// The name of the inventory data type specified in the request.
  final String typeName;

  /// A summary of the delete operation. For more information about this
  /// summary, see
  /// [Understanding the Delete Inventory Summary](http://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-inventory-delete.html#sysman-inventory-delete-summary)
  /// in the _AWS Systems Manager User Guide_.
  final InventoryDeletionSummary deletionSummary;

  DeleteInventoryResult({
    this.deletionId,
    this.typeName,
    this.deletionSummary,
  });
  static DeleteInventoryResult fromJson(Map<String, dynamic> json) =>
      DeleteInventoryResult();
}

class DeleteMaintenanceWindowResult {
  /// The ID of the deleted maintenance window.
  final String windowId;

  DeleteMaintenanceWindowResult({
    this.windowId,
  });
  static DeleteMaintenanceWindowResult fromJson(Map<String, dynamic> json) =>
      DeleteMaintenanceWindowResult();
}

class DeleteParameterResult {
  DeleteParameterResult();
  static DeleteParameterResult fromJson(Map<String, dynamic> json) =>
      DeleteParameterResult();
}

class DeleteParametersResult {
  /// The names of the deleted parameters.
  final List<String> deletedParameters;

  /// The names of parameters that weren't deleted because the parameters are
  /// not valid.
  final List<String> invalidParameters;

  DeleteParametersResult({
    this.deletedParameters,
    this.invalidParameters,
  });
  static DeleteParametersResult fromJson(Map<String, dynamic> json) =>
      DeleteParametersResult();
}

class DeletePatchBaselineResult {
  /// The ID of the deleted patch baseline.
  final String baselineId;

  DeletePatchBaselineResult({
    this.baselineId,
  });
  static DeletePatchBaselineResult fromJson(Map<String, dynamic> json) =>
      DeletePatchBaselineResult();
}

class DeleteResourceDataSyncResult {
  DeleteResourceDataSyncResult();
  static DeleteResourceDataSyncResult fromJson(Map<String, dynamic> json) =>
      DeleteResourceDataSyncResult();
}

class DeregisterManagedInstanceResult {
  DeregisterManagedInstanceResult();
  static DeregisterManagedInstanceResult fromJson(Map<String, dynamic> json) =>
      DeregisterManagedInstanceResult();
}

class DeregisterPatchBaselineForPatchGroupResult {
  /// The ID of the patch baseline the patch group was deregistered from.
  final String baselineId;

  /// The name of the patch group deregistered from the patch baseline.
  final String patchGroup;

  DeregisterPatchBaselineForPatchGroupResult({
    this.baselineId,
    this.patchGroup,
  });
  static DeregisterPatchBaselineForPatchGroupResult fromJson(
          Map<String, dynamic> json) =>
      DeregisterPatchBaselineForPatchGroupResult();
}

class DeregisterTargetFromMaintenanceWindowResult {
  /// The ID of the maintenance window the target was removed from.
  final String windowId;

  /// The ID of the removed target definition.
  final String windowTargetId;

  DeregisterTargetFromMaintenanceWindowResult({
    this.windowId,
    this.windowTargetId,
  });
  static DeregisterTargetFromMaintenanceWindowResult fromJson(
          Map<String, dynamic> json) =>
      DeregisterTargetFromMaintenanceWindowResult();
}

class DeregisterTaskFromMaintenanceWindowResult {
  /// The ID of the maintenance window the task was removed from.
  final String windowId;

  /// The ID of the task removed from the maintenance window.
  final String windowTaskId;

  DeregisterTaskFromMaintenanceWindowResult({
    this.windowId,
    this.windowTaskId,
  });
  static DeregisterTaskFromMaintenanceWindowResult fromJson(
          Map<String, dynamic> json) =>
      DeregisterTaskFromMaintenanceWindowResult();
}

/// Filter for the DescribeActivation API.
class DescribeActivationsFilter {
  /// The name of the filter.
  final String filterKey;

  /// The filter values.
  final List<String> filterValues;

  DescribeActivationsFilter({
    this.filterKey,
    this.filterValues,
  });
}

class DescribeActivationsResult {
  /// A list of activations for your AWS account.
  final List<Activation> activationList;

  /// The token for the next set of items to return. Use this token to get the
  /// next set of results.
  final String nextToken;

  DescribeActivationsResult({
    this.activationList,
    this.nextToken,
  });
  static DescribeActivationsResult fromJson(Map<String, dynamic> json) =>
      DescribeActivationsResult();
}

class DescribeAssociationExecutionTargetsResult {
  /// Information about the execution.
  final List<AssociationExecutionTarget> associationExecutionTargets;

  /// The token for the next set of items to return. Use this token to get the
  /// next set of results.
  final String nextToken;

  DescribeAssociationExecutionTargetsResult({
    this.associationExecutionTargets,
    this.nextToken,
  });
  static DescribeAssociationExecutionTargetsResult fromJson(
          Map<String, dynamic> json) =>
      DescribeAssociationExecutionTargetsResult();
}

class DescribeAssociationExecutionsResult {
  /// A list of the executions for the specified association ID.
  final List<AssociationExecution> associationExecutions;

  /// The token for the next set of items to return. Use this token to get the
  /// next set of results.
  final String nextToken;

  DescribeAssociationExecutionsResult({
    this.associationExecutions,
    this.nextToken,
  });
  static DescribeAssociationExecutionsResult fromJson(
          Map<String, dynamic> json) =>
      DescribeAssociationExecutionsResult();
}

class DescribeAssociationResult {
  /// Information about the association.
  final AssociationDescription associationDescription;

  DescribeAssociationResult({
    this.associationDescription,
  });
  static DescribeAssociationResult fromJson(Map<String, dynamic> json) =>
      DescribeAssociationResult();
}

class DescribeAutomationExecutionsResult {
  /// The list of details about each automation execution which has occurred
  /// which matches the filter specification, if any.
  final List<AutomationExecutionMetadata> automationExecutionMetadataList;

  /// The token to use when requesting the next set of items. If there are no
  /// additional items to return, the string is empty.
  final String nextToken;

  DescribeAutomationExecutionsResult({
    this.automationExecutionMetadataList,
    this.nextToken,
  });
  static DescribeAutomationExecutionsResult fromJson(
          Map<String, dynamic> json) =>
      DescribeAutomationExecutionsResult();
}

class DescribeAutomationStepExecutionsResult {
  /// A list of details about the current state of all steps that make up an
  /// execution.
  final List<StepExecution> stepExecutions;

  /// The token to use when requesting the next set of items. If there are no
  /// additional items to return, the string is empty.
  final String nextToken;

  DescribeAutomationStepExecutionsResult({
    this.stepExecutions,
    this.nextToken,
  });
  static DescribeAutomationStepExecutionsResult fromJson(
          Map<String, dynamic> json) =>
      DescribeAutomationStepExecutionsResult();
}

class DescribeAvailablePatchesResult {
  /// An array of patches. Each entry in the array is a patch structure.
  final List<Patch> patches;

  /// The token to use when requesting the next set of items. If there are no
  /// additional items to return, the string is empty.
  final String nextToken;

  DescribeAvailablePatchesResult({
    this.patches,
    this.nextToken,
  });
  static DescribeAvailablePatchesResult fromJson(Map<String, dynamic> json) =>
      DescribeAvailablePatchesResult();
}

class DescribeDocumentPermissionResponse {
  /// The account IDs that have permission to use this document. The ID can be
  /// either an AWS account or _All_.
  final List<String> accountIds;

  DescribeDocumentPermissionResponse({
    this.accountIds,
  });
  static DescribeDocumentPermissionResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeDocumentPermissionResponse();
}

class DescribeDocumentResult {
  /// Information about the Systems Manager document.
  final DocumentDescription document;

  DescribeDocumentResult({
    this.document,
  });
  static DescribeDocumentResult fromJson(Map<String, dynamic> json) =>
      DescribeDocumentResult();
}

class DescribeEffectiveInstanceAssociationsResult {
  /// The associations for the requested instance.
  final List<InstanceAssociation> associations;

  /// The token to use when requesting the next set of items. If there are no
  /// additional items to return, the string is empty.
  final String nextToken;

  DescribeEffectiveInstanceAssociationsResult({
    this.associations,
    this.nextToken,
  });
  static DescribeEffectiveInstanceAssociationsResult fromJson(
          Map<String, dynamic> json) =>
      DescribeEffectiveInstanceAssociationsResult();
}

class DescribeEffectivePatchesForPatchBaselineResult {
  /// An array of patches and patch status.
  final List<EffectivePatch> effectivePatches;

  /// The token to use when requesting the next set of items. If there are no
  /// additional items to return, the string is empty.
  final String nextToken;

  DescribeEffectivePatchesForPatchBaselineResult({
    this.effectivePatches,
    this.nextToken,
  });
  static DescribeEffectivePatchesForPatchBaselineResult fromJson(
          Map<String, dynamic> json) =>
      DescribeEffectivePatchesForPatchBaselineResult();
}

class DescribeInstanceAssociationsStatusResult {
  /// Status information about the association.
  final List<InstanceAssociationStatusInfo> instanceAssociationStatusInfos;

  /// The token to use when requesting the next set of items. If there are no
  /// additional items to return, the string is empty.
  final String nextToken;

  DescribeInstanceAssociationsStatusResult({
    this.instanceAssociationStatusInfos,
    this.nextToken,
  });
  static DescribeInstanceAssociationsStatusResult fromJson(
          Map<String, dynamic> json) =>
      DescribeInstanceAssociationsStatusResult();
}

class DescribeInstanceInformationResult {
  /// The instance information list.
  final List<InstanceInformation> instanceInformationList;

  /// The token to use when requesting the next set of items. If there are no
  /// additional items to return, the string is empty.
  final String nextToken;

  DescribeInstanceInformationResult({
    this.instanceInformationList,
    this.nextToken,
  });
  static DescribeInstanceInformationResult fromJson(
          Map<String, dynamic> json) =>
      DescribeInstanceInformationResult();
}

class DescribeInstancePatchStatesForPatchGroupResult {
  /// The high-level patch state for the requested instances.
  final List<InstancePatchState> instancePatchStates;

  /// The token to use when requesting the next set of items. If there are no
  /// additional items to return, the string is empty.
  final String nextToken;

  DescribeInstancePatchStatesForPatchGroupResult({
    this.instancePatchStates,
    this.nextToken,
  });
  static DescribeInstancePatchStatesForPatchGroupResult fromJson(
          Map<String, dynamic> json) =>
      DescribeInstancePatchStatesForPatchGroupResult();
}

class DescribeInstancePatchStatesResult {
  /// The high-level patch state for the requested instances.
  final List<InstancePatchState> instancePatchStates;

  /// The token to use when requesting the next set of items. If there are no
  /// additional items to return, the string is empty.
  final String nextToken;

  DescribeInstancePatchStatesResult({
    this.instancePatchStates,
    this.nextToken,
  });
  static DescribeInstancePatchStatesResult fromJson(
          Map<String, dynamic> json) =>
      DescribeInstancePatchStatesResult();
}

class DescribeInstancePatchesResult {
  /// Each entry in the array is a structure containing:
  ///
  /// Title (string)
  ///
  /// KBId (string)
  ///
  /// Classification (string)
  ///
  /// Severity (string)
  ///
  /// State (string, such as "INSTALLED" or "FAILED")
  ///
  /// InstalledTime (DateTime)
  ///
  /// InstalledBy (string)
  final List<PatchComplianceData> patches;

  /// The token to use when requesting the next set of items. If there are no
  /// additional items to return, the string is empty.
  final String nextToken;

  DescribeInstancePatchesResult({
    this.patches,
    this.nextToken,
  });
  static DescribeInstancePatchesResult fromJson(Map<String, dynamic> json) =>
      DescribeInstancePatchesResult();
}

class DescribeInventoryDeletionsResult {
  /// A list of status items for deleted inventory.
  final List<InventoryDeletionStatusItem> inventoryDeletions;

  /// The token for the next set of items to return. Use this token to get the
  /// next set of results.
  final String nextToken;

  DescribeInventoryDeletionsResult({
    this.inventoryDeletions,
    this.nextToken,
  });
  static DescribeInventoryDeletionsResult fromJson(Map<String, dynamic> json) =>
      DescribeInventoryDeletionsResult();
}

class DescribeMaintenanceWindowExecutionTaskInvocationsResult {
  /// Information about the task invocation results per invocation.
  final List<MaintenanceWindowExecutionTaskInvocationIdentity>
      windowExecutionTaskInvocationIdentities;

  /// The token to use when requesting the next set of items. If there are no
  /// additional items to return, the string is empty.
  final String nextToken;

  DescribeMaintenanceWindowExecutionTaskInvocationsResult({
    this.windowExecutionTaskInvocationIdentities,
    this.nextToken,
  });
  static DescribeMaintenanceWindowExecutionTaskInvocationsResult fromJson(
          Map<String, dynamic> json) =>
      DescribeMaintenanceWindowExecutionTaskInvocationsResult();
}

class DescribeMaintenanceWindowExecutionTasksResult {
  /// Information about the task executions.
  final List<MaintenanceWindowExecutionTaskIdentity>
      windowExecutionTaskIdentities;

  /// The token to use when requesting the next set of items. If there are no
  /// additional items to return, the string is empty.
  final String nextToken;

  DescribeMaintenanceWindowExecutionTasksResult({
    this.windowExecutionTaskIdentities,
    this.nextToken,
  });
  static DescribeMaintenanceWindowExecutionTasksResult fromJson(
          Map<String, dynamic> json) =>
      DescribeMaintenanceWindowExecutionTasksResult();
}

class DescribeMaintenanceWindowExecutionsResult {
  /// Information about the maintenance window executions.
  final List<MaintenanceWindowExecution> windowExecutions;

  /// The token to use when requesting the next set of items. If there are no
  /// additional items to return, the string is empty.
  final String nextToken;

  DescribeMaintenanceWindowExecutionsResult({
    this.windowExecutions,
    this.nextToken,
  });
  static DescribeMaintenanceWindowExecutionsResult fromJson(
          Map<String, dynamic> json) =>
      DescribeMaintenanceWindowExecutionsResult();
}

class DescribeMaintenanceWindowScheduleResult {
  /// Information about maintenance window executions scheduled for the
  /// specified time range.
  final List<ScheduledWindowExecution> scheduledWindowExecutions;

  /// The token for the next set of items to return. (You use this token in the
  /// next call.)
  final String nextToken;

  DescribeMaintenanceWindowScheduleResult({
    this.scheduledWindowExecutions,
    this.nextToken,
  });
  static DescribeMaintenanceWindowScheduleResult fromJson(
          Map<String, dynamic> json) =>
      DescribeMaintenanceWindowScheduleResult();
}

class DescribeMaintenanceWindowTargetsResult {
  /// Information about the targets in the maintenance window.
  final List<MaintenanceWindowTarget> targets;

  /// The token to use when requesting the next set of items. If there are no
  /// additional items to return, the string is empty.
  final String nextToken;

  DescribeMaintenanceWindowTargetsResult({
    this.targets,
    this.nextToken,
  });
  static DescribeMaintenanceWindowTargetsResult fromJson(
          Map<String, dynamic> json) =>
      DescribeMaintenanceWindowTargetsResult();
}

class DescribeMaintenanceWindowTasksResult {
  /// Information about the tasks in the maintenance window.
  final List<MaintenanceWindowTask> tasks;

  /// The token to use when requesting the next set of items. If there are no
  /// additional items to return, the string is empty.
  final String nextToken;

  DescribeMaintenanceWindowTasksResult({
    this.tasks,
    this.nextToken,
  });
  static DescribeMaintenanceWindowTasksResult fromJson(
          Map<String, dynamic> json) =>
      DescribeMaintenanceWindowTasksResult();
}

class DescribeMaintenanceWindowsForTargetResult {
  /// Information about the maintenance window targets and tasks an instance is
  /// associated with.
  final List<MaintenanceWindowIdentityForTarget> windowIdentities;

  /// The token for the next set of items to return. (You use this token in the
  /// next call.)
  final String nextToken;

  DescribeMaintenanceWindowsForTargetResult({
    this.windowIdentities,
    this.nextToken,
  });
  static DescribeMaintenanceWindowsForTargetResult fromJson(
          Map<String, dynamic> json) =>
      DescribeMaintenanceWindowsForTargetResult();
}

class DescribeMaintenanceWindowsResult {
  /// Information about the maintenance windows.
  final List<MaintenanceWindowIdentity> windowIdentities;

  /// The token to use when requesting the next set of items. If there are no
  /// additional items to return, the string is empty.
  final String nextToken;

  DescribeMaintenanceWindowsResult({
    this.windowIdentities,
    this.nextToken,
  });
  static DescribeMaintenanceWindowsResult fromJson(Map<String, dynamic> json) =>
      DescribeMaintenanceWindowsResult();
}

class DescribeOpsItemsResponse {
  /// The token for the next set of items to return. Use this token to get the
  /// next set of results.
  final String nextToken;

  /// A list of OpsItems.
  final List<OpsItemSummary> opsItemSummaries;

  DescribeOpsItemsResponse({
    this.nextToken,
    this.opsItemSummaries,
  });
  static DescribeOpsItemsResponse fromJson(Map<String, dynamic> json) =>
      DescribeOpsItemsResponse();
}

class DescribeParametersResult {
  /// Parameters returned by the request.
  final List<ParameterMetadata> parameters;

  /// The token to use when requesting the next set of items. If there are no
  /// additional items to return, the string is empty.
  final String nextToken;

  DescribeParametersResult({
    this.parameters,
    this.nextToken,
  });
  static DescribeParametersResult fromJson(Map<String, dynamic> json) =>
      DescribeParametersResult();
}

class DescribePatchBaselinesResult {
  /// An array of PatchBaselineIdentity elements.
  final List<PatchBaselineIdentity> baselineIdentities;

  /// The token to use when requesting the next set of items. If there are no
  /// additional items to return, the string is empty.
  final String nextToken;

  DescribePatchBaselinesResult({
    this.baselineIdentities,
    this.nextToken,
  });
  static DescribePatchBaselinesResult fromJson(Map<String, dynamic> json) =>
      DescribePatchBaselinesResult();
}

class DescribePatchGroupStateResult {
  /// The number of instances in the patch group.
  final int instances;

  /// The number of instances with installed patches.
  final int instancesWithInstalledPatches;

  /// The number of instances with patches installed that aren't defined in the
  /// patch baseline.
  final int instancesWithInstalledOtherPatches;

  /// The number of instances with patches installed that are specified in a
  /// RejectedPatches list. Patches with a status of _INSTALLED_REJECTED_ were
  /// typically installed before they were added to a RejectedPatches list.
  ///
  ///
  ///
  /// If ALLOW_AS_DEPENDENCY is the specified option for RejectedPatchesAction,
  /// the value of InstancesWithInstalledRejectedPatches will always be 0
  /// (zero).
  final int instancesWithInstalledRejectedPatches;

  /// The number of instances with missing patches from the patch baseline.
  final int instancesWithMissingPatches;

  /// The number of instances with patches from the patch baseline that failed
  /// to install.
  final int instancesWithFailedPatches;

  /// The number of instances with patches that aren't applicable.
  final int instancesWithNotApplicablePatches;

  /// The number of instances with `NotApplicable` patches beyond the supported
  /// limit, which are not reported by name to Systems Manager Inventory.
  final int instancesWithUnreportedNotApplicablePatches;

  DescribePatchGroupStateResult({
    this.instances,
    this.instancesWithInstalledPatches,
    this.instancesWithInstalledOtherPatches,
    this.instancesWithInstalledRejectedPatches,
    this.instancesWithMissingPatches,
    this.instancesWithFailedPatches,
    this.instancesWithNotApplicablePatches,
    this.instancesWithUnreportedNotApplicablePatches,
  });
  static DescribePatchGroupStateResult fromJson(Map<String, dynamic> json) =>
      DescribePatchGroupStateResult();
}

class DescribePatchGroupsResult {
  /// Each entry in the array contains:
  ///
  /// PatchGroup: string (between 1 and 256 characters, Regex:
  /// ^([p{L}p{Z}p{N}_.:/=+-@]*)$)
  ///
  /// PatchBaselineIdentity: A PatchBaselineIdentity element.
  final List<PatchGroupPatchBaselineMapping> mappings;

  /// The token to use when requesting the next set of items. If there are no
  /// additional items to return, the string is empty.
  final String nextToken;

  DescribePatchGroupsResult({
    this.mappings,
    this.nextToken,
  });
  static DescribePatchGroupsResult fromJson(Map<String, dynamic> json) =>
      DescribePatchGroupsResult();
}

class DescribePatchPropertiesResult {
  /// A list of the properties for patches matching the filter request
  /// parameters.
  final List<Map<String, String>> properties;

  /// The token for the next set of items to return. (You use this token in the
  /// next call.)
  final String nextToken;

  DescribePatchPropertiesResult({
    this.properties,
    this.nextToken,
  });
  static DescribePatchPropertiesResult fromJson(Map<String, dynamic> json) =>
      DescribePatchPropertiesResult();
}

class DescribeSessionsResponse {
  /// A list of sessions meeting the request parameters.
  final List<Session> sessions;

  /// The token for the next set of items to return. (You received this token
  /// from a previous call.)
  final String nextToken;

  DescribeSessionsResponse({
    this.sessions,
    this.nextToken,
  });
  static DescribeSessionsResponse fromJson(Map<String, dynamic> json) =>
      DescribeSessionsResponse();
}

/// A default version of a document.
class DocumentDefaultVersionDescription {
  /// The name of the document.
  final String name;

  /// The default version of the document.
  final String defaultVersion;

  /// The default version of the artifact associated with the document.
  final String defaultVersionName;

  DocumentDefaultVersionDescription({
    this.name,
    this.defaultVersion,
    this.defaultVersionName,
  });
  static DocumentDefaultVersionDescription fromJson(
          Map<String, dynamic> json) =>
      DocumentDefaultVersionDescription();
}

/// Describes a Systems Manager document.
class DocumentDescription {
  /// The SHA1 hash of the document, which you can use for verification.
  final String sha1;

  /// The Sha256 or Sha1 hash created by the system when the document was
  /// created.
  ///
  ///
  ///
  /// Sha1 hashes have been deprecated.
  final String hash;

  /// The hash type of the document. Valid values include `Sha256` or `Sha1`.
  ///
  ///
  ///
  /// Sha1 hashes have been deprecated.
  final String hashType;

  /// The name of the Systems Manager document.
  final String name;

  /// The version of the artifact associated with the document.
  final String versionName;

  /// The AWS user account that created the document.
  final String owner;

  /// The date when the document was created.
  final DateTime createdDate;

  /// The status of the Systems Manager document.
  final String status;

  /// A message returned by AWS Systems Manager that explains the `Status`
  /// value. For example, a `Failed` status might be explained by the
  /// `StatusInformation` message, "The specified S3 bucket does not exist.
  /// Verify that the URL of the S3 bucket is correct."
  final String statusInformation;

  /// The document version.
  final String documentVersion;

  /// A description of the document.
  final String description;

  /// A description of the parameters for a document.
  final List<DocumentParameter> parameters;

  /// The list of OS platforms compatible with this Systems Manager document.
  final List<String> platformTypes;

  /// The type of document.
  final String documentType;

  /// The schema version.
  final String schemaVersion;

  /// The latest version of the document.
  final String latestVersion;

  /// The default version.
  final String defaultVersion;

  /// The document format, either JSON or YAML.
  final String documentFormat;

  /// The target type which defines the kinds of resources the document can run
  /// on. For example, /AWS::EC2::Instance. For a list of valid resource types,
  /// see
  /// [AWS Resource Types Reference](http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html)
  /// in the _AWS CloudFormation User Guide_.
  final String targetType;

  /// The tags, or metadata, that have been applied to the document.
  final List<Tag> tags;

  /// Details about the document attachments, including names, locations, sizes,
  /// etc.
  final List<AttachmentInformation> attachmentsInformation;

  DocumentDescription({
    this.sha1,
    this.hash,
    this.hashType,
    this.name,
    this.versionName,
    this.owner,
    this.createdDate,
    this.status,
    this.statusInformation,
    this.documentVersion,
    this.description,
    this.parameters,
    this.platformTypes,
    this.documentType,
    this.schemaVersion,
    this.latestVersion,
    this.defaultVersion,
    this.documentFormat,
    this.targetType,
    this.tags,
    this.attachmentsInformation,
  });
  static DocumentDescription fromJson(Map<String, dynamic> json) =>
      DocumentDescription();
}

/// Describes a filter.
class DocumentFilter {
  /// The name of the filter.
  final String key;

  /// The value of the filter.
  final String value;

  DocumentFilter({
    @required this.key,
    @required this.value,
  });
}

/// Describes the name of a Systems Manager document.
class DocumentIdentifier {
  /// The name of the Systems Manager document.
  final String name;

  /// The AWS user account that created the document.
  final String owner;

  /// An optional field specifying the version of the artifact associated with
  /// the document. For example, "Release 12, Update 6". This value is unique
  /// across all versions of a document, and cannot be changed.
  final String versionName;

  /// The operating system platform.
  final List<String> platformTypes;

  /// The document version.
  final String documentVersion;

  /// The document type.
  final String documentType;

  /// The schema version.
  final String schemaVersion;

  /// The document format, either JSON or YAML.
  final String documentFormat;

  /// The target type which defines the kinds of resources the document can run
  /// on. For example, /AWS::EC2::Instance. For a list of valid resource types,
  /// see
  /// [AWS Resource Types Reference](http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html)
  /// in the _AWS CloudFormation User Guide_.
  final String targetType;

  /// The tags, or metadata, that have been applied to the document.
  final List<Tag> tags;

  DocumentIdentifier({
    this.name,
    this.owner,
    this.versionName,
    this.platformTypes,
    this.documentVersion,
    this.documentType,
    this.schemaVersion,
    this.documentFormat,
    this.targetType,
    this.tags,
  });
  static DocumentIdentifier fromJson(Map<String, dynamic> json) =>
      DocumentIdentifier();
}

/// One or more filters. Use a filter to return a more specific list of
/// documents.
///
/// For keys, you can specify one or more tags that have been applied to a
/// document.
///
/// Other valid values include Owner, Name, PlatformTypes, and DocumentType.
///
/// Note that only one Owner can be specified in a request. For example:
/// `Key=Owner,Values=Self`.
///
/// If you use Name as a key, you can use a name prefix to return a list of
/// documents. For example, in the AWS CLI, to return a list of all documents
/// that begin with `Te`, run the following command:
///
///  `aws ssm list-documents --filters Key=Name,Values=Te`
///
/// If you specify more than two keys, only documents that are identified by all
/// the tags are returned in the results. If you specify more than two values
/// for a key, documents that are identified by any of the values are returned
/// in the results.
///
/// To specify a custom key and value pair, use the format
/// `Key=tag:[tagName],Values=[valueName]`.
///
/// For example, if you created a Key called region and are using the AWS CLI to
/// call the `list-documents` command:
///
///  `aws ssm list-documents --filters Key=tag:region,Values=east,west
/// Key=Owner,Values=Self`
class DocumentKeyValuesFilter {
  /// The name of the filter key.
  final String key;

  /// The value for the filter key.
  final List<String> values;

  DocumentKeyValuesFilter({
    this.key,
    this.values,
  });
}

/// Parameters specified in a System Manager document that run on the server
/// when the command is run.
class DocumentParameter {
  /// The name of the parameter.
  final String name;

  /// The type of parameter. The type can be either String or StringList.
  final String type;

  /// A description of what the parameter does, how to use it, the default
  /// value, and whether or not the parameter is optional.
  final String description;

  /// If specified, the default values for the parameters. Parameters without a
  /// default value are required. Parameters with a default value are optional.
  final String defaultValue;

  DocumentParameter({
    this.name,
    this.type,
    this.description,
    this.defaultValue,
  });
  static DocumentParameter fromJson(Map<String, dynamic> json) =>
      DocumentParameter();
}

/// Version information about the document.
class DocumentVersionInfo {
  /// The document name.
  final String name;

  /// The document version.
  final String documentVersion;

  /// The version of the artifact associated with the document. For example,
  /// "Release 12, Update 6". This value is unique across all versions of a
  /// document, and cannot be changed.
  final String versionName;

  /// The date the document was created.
  final DateTime createdDate;

  /// An identifier for the default version of the document.
  final bool isDefaultVersion;

  /// The document format, either JSON or YAML.
  final String documentFormat;

  /// The status of the Systems Manager document, such as `Creating`, `Active`,
  /// `Failed`, and `Deleting`.
  final String status;

  /// A message returned by AWS Systems Manager that explains the `Status`
  /// value. For example, a `Failed` status might be explained by the
  /// `StatusInformation` message, "The specified S3 bucket does not exist.
  /// Verify that the URL of the S3 bucket is correct."
  final String statusInformation;

  DocumentVersionInfo({
    this.name,
    this.documentVersion,
    this.versionName,
    this.createdDate,
    this.isDefaultVersion,
    this.documentFormat,
    this.status,
    this.statusInformation,
  });
  static DocumentVersionInfo fromJson(Map<String, dynamic> json) =>
      DocumentVersionInfo();
}

/// The EffectivePatch structure defines metadata about a patch along with the
/// approval state of the patch in a particular patch baseline. The approval
/// state includes information about whether the patch is currently approved,
/// due to be approved by a rule, explicitly approved, or explicitly rejected
/// and the date the patch was or will be approved.
class EffectivePatch {
  /// Provides metadata for a patch, including information such as the KB ID,
  /// severity, classification and a URL for where more information can be
  /// obtained about the patch.
  final Patch patch;

  /// The status of the patch in a patch baseline. This includes information
  /// about whether the patch is currently approved, due to be approved by a
  /// rule, explicitly approved, or explicitly rejected and the date the patch
  /// was or will be approved.
  final PatchStatus patchStatus;

  EffectivePatch({
    this.patch,
    this.patchStatus,
  });
  static EffectivePatch fromJson(Map<String, dynamic> json) => EffectivePatch();
}

/// Describes a failed association.
class FailedCreateAssociation {
  /// The association.
  final CreateAssociationBatchRequestEntry entry;

  /// A description of the failure.
  final String message;

  /// The source of the failure.
  final String fault;

  FailedCreateAssociation({
    this.entry,
    this.message,
    this.fault,
  });
  static FailedCreateAssociation fromJson(Map<String, dynamic> json) =>
      FailedCreateAssociation();
}

/// Information about an Automation failure.
class FailureDetails {
  /// The stage of the Automation execution when the failure occurred. The
  /// stages include the following: InputValidation, PreVerification,
  /// Invocation, PostVerification.
  final String failureStage;

  /// The type of Automation failure. Failure types include the following:
  /// Action, Permission, Throttling, Verification, Internal.
  final String failureType;

  /// Detailed information about the Automation step failure.
  final Map<String, List<String>> details;

  FailureDetails({
    this.failureStage,
    this.failureType,
    this.details,
  });
  static FailureDetails fromJson(Map<String, dynamic> json) => FailureDetails();
}

class GetAutomationExecutionResult {
  /// Detailed information about the current state of an automation execution.
  final AutomationExecution automationExecution;

  GetAutomationExecutionResult({
    this.automationExecution,
  });
  static GetAutomationExecutionResult fromJson(Map<String, dynamic> json) =>
      GetAutomationExecutionResult();
}

class GetCommandInvocationResult {
  /// The parent command ID of the invocation plugin.
  final String commandId;

  /// The ID of the managed instance targeted by the command. A managed instance
  /// can be an Amazon EC2 instance or an instance in your hybrid environment
  /// that is configured for Systems Manager.
  final String instanceId;

  /// The comment text for the command.
  final String comment;

  /// The name of the document that was run. For example, AWS-RunShellScript.
  final String documentName;

  /// The SSM document version used in the request.
  final String documentVersion;

  /// The name of the plugin for which you want detailed results. For example,
  /// aws:RunShellScript is a plugin.
  final String pluginName;

  /// The error level response code for the plugin script. If the response code
  /// is -1, then the command has not started running on the instance, or it was
  /// not received by the instance.
  final int responseCode;

  /// The date and time the plugin started running. Date and time are written in
  /// ISO 8601 format. For example, June 7, 2017 is represented as 2017-06-7.
  /// The following sample AWS CLI command uses the `InvokedBefore` filter.
  ///
  ///  `aws ssm list-commands --filters
  /// key=InvokedBefore,value=2017-06-07T00:00:00Z`
  ///
  /// If the plugin has not started to run, the string is empty.
  final String executionStartDateTime;

  /// Duration since ExecutionStartDateTime.
  final String executionElapsedTime;

  /// The date and time the plugin was finished running. Date and time are
  /// written in ISO 8601 format. For example, June 7, 2017 is represented as
  /// 2017-06-7. The following sample AWS CLI command uses the `InvokedAfter`
  /// filter.
  ///
  ///  `aws ssm list-commands --filters
  /// key=InvokedAfter,value=2017-06-07T00:00:00Z`
  ///
  /// If the plugin has not started to run, the string is empty.
  final String executionEndDateTime;

  /// The status of this invocation plugin. This status can be different than
  /// StatusDetails.
  final String status;

  /// A detailed status of the command execution for an invocation.
  /// StatusDetails includes more information than Status because it includes
  /// states resulting from error and concurrency control parameters.
  /// StatusDetails can show different results than Status. For more information
  /// about these statuses, see
  /// [Understanding Command Statuses](http://docs.aws.amazon.com/systems-manager/latest/userguide/monitor-commands.html)
  /// in the _AWS Systems Manager User Guide_. StatusDetails can be one of the
  /// following values:
  ///
  /// *   Pending: The command has not been sent to the instance.
  ///
  /// *   In Progress: The command has been sent to the instance but has not
  /// reached a terminal state.
  ///
  /// *   Delayed: The system attempted to send the command to the target, but
  /// the target was not available. The instance might not be available because
  /// of network issues, the instance was stopped, etc. The system will try to
  /// deliver the command again.
  ///
  /// *   Success: The command or plugin was run successfully. This is a
  /// terminal state.
  ///
  /// *   Delivery Timed Out: The command was not delivered to the instance
  /// before the delivery timeout expired. Delivery timeouts do not count
  /// against the parent command's MaxErrors limit, but they do contribute to
  /// whether the parent command status is Success or Incomplete. This is a
  /// terminal state.
  ///
  /// *   Execution Timed Out: The command started to run on the instance, but
  /// the execution was not complete before the timeout expired. Execution
  /// timeouts count against the MaxErrors limit of the parent command. This is
  /// a terminal state.
  ///
  /// *   Failed: The command wasn't run successfully on the instance. For a
  /// plugin, this indicates that the result code was not zero. For a command
  /// invocation, this indicates that the result code for one or more plugins
  /// was not zero. Invocation failures count against the MaxErrors limit of the
  /// parent command. This is a terminal state.
  ///
  /// *   Canceled: The command was terminated before it was completed. This is
  /// a terminal state.
  ///
  /// *   Undeliverable: The command can't be delivered to the instance. The
  /// instance might not exist or might not be responding. Undeliverable
  /// invocations don't count against the parent command's MaxErrors limit and
  /// don't contribute to whether the parent command status is Success or
  /// Incomplete. This is a terminal state.
  ///
  /// *   Terminated: The parent command exceeded its MaxErrors limit and
  /// subsequent command invocations were canceled by the system. This is a
  /// terminal state.
  final String statusDetails;

  /// The first 24,000 characters written by the plugin to stdout. If the
  /// command has not finished running, if ExecutionStatus is neither Succeeded
  /// nor Failed, then this string is empty.
  final String standardOutputContent;

  /// The URL for the complete text written by the plugin to stdout in Amazon
  /// S3. If an Amazon S3 bucket was not specified, then this string is empty.
  final String standardOutputUrl;

  /// The first 8,000 characters written by the plugin to stderr. If the command
  /// has not finished running, then this string is empty.
  final String standardErrorContent;

  /// The URL for the complete text written by the plugin to stderr. If the
  /// command has not finished running, then this string is empty.
  final String standardErrorUrl;

  /// CloudWatch Logs information where Systems Manager sent the command output.
  final CloudWatchOutputConfig cloudWatchOutputConfig;

  GetCommandInvocationResult({
    this.commandId,
    this.instanceId,
    this.comment,
    this.documentName,
    this.documentVersion,
    this.pluginName,
    this.responseCode,
    this.executionStartDateTime,
    this.executionElapsedTime,
    this.executionEndDateTime,
    this.status,
    this.statusDetails,
    this.standardOutputContent,
    this.standardOutputUrl,
    this.standardErrorContent,
    this.standardErrorUrl,
    this.cloudWatchOutputConfig,
  });
  static GetCommandInvocationResult fromJson(Map<String, dynamic> json) =>
      GetCommandInvocationResult();
}

class GetConnectionStatusResponse {
  /// The ID of the instance to check connection status.
  final String target;

  /// The status of the connection to the instance. For example, 'Connected' or
  /// 'Not Connected'.
  final String status;

  GetConnectionStatusResponse({
    this.target,
    this.status,
  });
  static GetConnectionStatusResponse fromJson(Map<String, dynamic> json) =>
      GetConnectionStatusResponse();
}

class GetDefaultPatchBaselineResult {
  /// The ID of the default patch baseline.
  final String baselineId;

  /// The operating system for the returned patch baseline.
  final String operatingSystem;

  GetDefaultPatchBaselineResult({
    this.baselineId,
    this.operatingSystem,
  });
  static GetDefaultPatchBaselineResult fromJson(Map<String, dynamic> json) =>
      GetDefaultPatchBaselineResult();
}

class GetDeployablePatchSnapshotForInstanceResult {
  /// The ID of the instance.
  final String instanceId;

  /// The user-defined snapshot ID.
  final String snapshotId;

  /// A pre-signed Amazon S3 URL that can be used to download the patch
  /// snapshot.
  final String snapshotDownloadUrl;

  /// Returns the specific operating system (for example Windows Server 2012 or
  /// Amazon Linux 2015.09) on the instance for the specified patch snapshot.
  final String product;

  GetDeployablePatchSnapshotForInstanceResult({
    this.instanceId,
    this.snapshotId,
    this.snapshotDownloadUrl,
    this.product,
  });
  static GetDeployablePatchSnapshotForInstanceResult fromJson(
          Map<String, dynamic> json) =>
      GetDeployablePatchSnapshotForInstanceResult();
}

class GetDocumentResult {
  /// The name of the Systems Manager document.
  final String name;

  /// The version of the artifact associated with the document. For example,
  /// "Release 12, Update 6". This value is unique across all versions of a
  /// document, and cannot be changed.
  final String versionName;

  /// The document version.
  final String documentVersion;

  /// The status of the Systems Manager document, such as `Creating`, `Active`,
  /// `Updating`, `Failed`, and `Deleting`.
  final String status;

  /// A message returned by AWS Systems Manager that explains the `Status`
  /// value. For example, a `Failed` status might be explained by the
  /// `StatusInformation` message, "The specified S3 bucket does not exist.
  /// Verify that the URL of the S3 bucket is correct."
  final String statusInformation;

  /// The contents of the Systems Manager document.
  final String content;

  /// The document type.
  final String documentType;

  /// The document format, either JSON or YAML.
  final String documentFormat;

  /// A description of the document attachments, including names, locations,
  /// sizes, etc.
  final List<AttachmentContent> attachmentsContent;

  GetDocumentResult({
    this.name,
    this.versionName,
    this.documentVersion,
    this.status,
    this.statusInformation,
    this.content,
    this.documentType,
    this.documentFormat,
    this.attachmentsContent,
  });
  static GetDocumentResult fromJson(Map<String, dynamic> json) =>
      GetDocumentResult();
}

class GetInventoryResult {
  /// Collection of inventory entities such as a collection of instance
  /// inventory.
  final List<InventoryResultEntity> entities;

  /// The token to use when requesting the next set of items. If there are no
  /// additional items to return, the string is empty.
  final String nextToken;

  GetInventoryResult({
    this.entities,
    this.nextToken,
  });
  static GetInventoryResult fromJson(Map<String, dynamic> json) =>
      GetInventoryResult();
}

class GetInventorySchemaResult {
  /// Inventory schemas returned by the request.
  final List<InventoryItemSchema> schemas;

  /// The token to use when requesting the next set of items. If there are no
  /// additional items to return, the string is empty.
  final String nextToken;

  GetInventorySchemaResult({
    this.schemas,
    this.nextToken,
  });
  static GetInventorySchemaResult fromJson(Map<String, dynamic> json) =>
      GetInventorySchemaResult();
}

class GetMaintenanceWindowExecutionResult {
  /// The ID of the maintenance window execution.
  final String windowExecutionId;

  /// The ID of the task executions from the maintenance window execution.
  final List<String> taskIds;

  /// The status of the maintenance window execution.
  final String status;

  /// The details explaining the Status. Only available for certain status
  /// values.
  final String statusDetails;

  /// The time the maintenance window started running.
  final DateTime startTime;

  /// The time the maintenance window finished running.
  final DateTime endTime;

  GetMaintenanceWindowExecutionResult({
    this.windowExecutionId,
    this.taskIds,
    this.status,
    this.statusDetails,
    this.startTime,
    this.endTime,
  });
  static GetMaintenanceWindowExecutionResult fromJson(
          Map<String, dynamic> json) =>
      GetMaintenanceWindowExecutionResult();
}

class GetMaintenanceWindowExecutionTaskInvocationResult {
  /// The maintenance window execution ID.
  final String windowExecutionId;

  /// The task execution ID.
  final String taskExecutionId;

  /// The invocation ID.
  final String invocationId;

  /// The execution ID.
  final String executionId;

  /// Retrieves the task type for a maintenance window. Task types include the
  /// following: LAMBDA, STEP_FUNCTIONS, AUTOMATION, RUN_COMMAND.
  final String taskType;

  /// The parameters used at the time that the task ran.
  final String parameters;

  /// The task status for an invocation.
  final String status;

  /// The details explaining the status. Details are only available for certain
  /// status values.
  final String statusDetails;

  /// The time that the task started running on the target.
  final DateTime startTime;

  /// The time that the task finished running on the target.
  final DateTime endTime;

  /// User-provided value to be included in any CloudWatch events raised while
  /// running tasks for these targets in this maintenance window.
  final String ownerInformation;

  /// The maintenance window target ID.
  final String windowTargetId;

  GetMaintenanceWindowExecutionTaskInvocationResult({
    this.windowExecutionId,
    this.taskExecutionId,
    this.invocationId,
    this.executionId,
    this.taskType,
    this.parameters,
    this.status,
    this.statusDetails,
    this.startTime,
    this.endTime,
    this.ownerInformation,
    this.windowTargetId,
  });
  static GetMaintenanceWindowExecutionTaskInvocationResult fromJson(
          Map<String, dynamic> json) =>
      GetMaintenanceWindowExecutionTaskInvocationResult();
}

class GetMaintenanceWindowExecutionTaskResult {
  /// The ID of the maintenance window execution that includes the task.
  final String windowExecutionId;

  /// The ID of the specific task execution in the maintenance window task that
  /// was retrieved.
  final String taskExecutionId;

  /// The ARN of the task that ran.
  final String taskArn;

  /// The role that was assumed when running the task.
  final String serviceRole;

  /// The type of task that was run.
  final String type;

  /// The parameters passed to the task when it was run.
  ///
  ///   `TaskParameters` has been deprecated. To specify parameters to pass to a
  /// task when it runs, instead use the `Parameters` option in the
  /// `TaskInvocationParameters` structure. For information about how Systems
  /// Manager handles these options for the supported maintenance window task
  /// types, see MaintenanceWindowTaskInvocationParameters.
  ///
  /// The map has the following format:
  ///
  /// Key: string, between 1 and 255 characters
  ///
  /// Value: an array of strings, each string is between 1 and 255 characters
  final List<Map<String, MaintenanceWindowTaskParameterValueExpression>>
      taskParameters;

  /// The priority of the task.
  final int priority;

  /// The defined maximum number of task executions that could be run in
  /// parallel.
  final String maxConcurrency;

  /// The defined maximum number of task execution errors allowed before
  /// scheduling of the task execution would have been stopped.
  final String maxErrors;

  /// The status of the task.
  final String status;

  /// The details explaining the Status. Only available for certain status
  /// values.
  final String statusDetails;

  /// The time the task execution started.
  final DateTime startTime;

  /// The time the task execution completed.
  final DateTime endTime;

  GetMaintenanceWindowExecutionTaskResult({
    this.windowExecutionId,
    this.taskExecutionId,
    this.taskArn,
    this.serviceRole,
    this.type,
    this.taskParameters,
    this.priority,
    this.maxConcurrency,
    this.maxErrors,
    this.status,
    this.statusDetails,
    this.startTime,
    this.endTime,
  });
  static GetMaintenanceWindowExecutionTaskResult fromJson(
          Map<String, dynamic> json) =>
      GetMaintenanceWindowExecutionTaskResult();
}

class GetMaintenanceWindowResult {
  /// The ID of the created maintenance window.
  final String windowId;

  /// The name of the maintenance window.
  final String name;

  /// The description of the maintenance window.
  final String description;

  /// The date and time, in ISO-8601 Extended format, for when the maintenance
  /// window is scheduled to become active. The maintenance window will not run
  /// before this specified time.
  final String startDate;

  /// The date and time, in ISO-8601 Extended format, for when the maintenance
  /// window is scheduled to become inactive. The maintenance window will not
  /// run after this specified time.
  final String endDate;

  /// The schedule of the maintenance window in the form of a cron or rate
  /// expression.
  final String schedule;

  /// The time zone that the scheduled maintenance window executions are based
  /// on, in Internet Assigned Numbers Authority (IANA) format. For example:
  /// "America/Los_Angeles", "etc/UTC", or "Asia/Seoul". For more information,
  /// see the [Time Zone Database](https://www.iana.org/time-zones) on the IANA
  /// website.
  final String scheduleTimezone;

  /// The next time the maintenance window will actually run, taking into
  /// account any specified times for the maintenance window to become active or
  /// inactive.
  final String nextExecutionTime;

  /// The duration of the maintenance window in hours.
  final int duration;

  /// The number of hours before the end of the maintenance window that Systems
  /// Manager stops scheduling new tasks for execution.
  final int cutoff;

  /// Whether targets must be registered with the maintenance window before
  /// tasks can be defined for those targets.
  final bool allowUnassociatedTargets;

  /// Indicates whether the maintenance window is enabled.
  final bool enabled;

  /// The date the maintenance window was created.
  final DateTime createdDate;

  /// The date the maintenance window was last modified.
  final DateTime modifiedDate;

  GetMaintenanceWindowResult({
    this.windowId,
    this.name,
    this.description,
    this.startDate,
    this.endDate,
    this.schedule,
    this.scheduleTimezone,
    this.nextExecutionTime,
    this.duration,
    this.cutoff,
    this.allowUnassociatedTargets,
    this.enabled,
    this.createdDate,
    this.modifiedDate,
  });
  static GetMaintenanceWindowResult fromJson(Map<String, dynamic> json) =>
      GetMaintenanceWindowResult();
}

class GetMaintenanceWindowTaskResult {
  /// The retrieved maintenance window ID.
  final String windowId;

  /// The retrieved maintenance window task ID.
  final String windowTaskId;

  /// The targets where the task should run.
  final List<Target> targets;

  /// The resource that the task used during execution. For RUN_COMMAND and
  /// AUTOMATION task types, the TaskArn is the Systems Manager Document
  /// name/ARN. For LAMBDA tasks, the value is the function name/ARN. For
  /// STEP_FUNCTIONS tasks, the value is the state machine ARN.
  final String taskArn;

  /// The ARN of the IAM service role to use to publish Amazon Simple
  /// Notification Service (Amazon SNS) notifications for maintenance window Run
  /// Command tasks.
  final String serviceRoleArn;

  /// The type of task to run.
  final String taskType;

  /// The parameters to pass to the task when it runs.
  ///
  ///   `TaskParameters` has been deprecated. To specify parameters to pass to a
  /// task when it runs, instead use the `Parameters` option in the
  /// `TaskInvocationParameters` structure. For information about how Systems
  /// Manager handles these options for the supported maintenance window task
  /// types, see MaintenanceWindowTaskInvocationParameters.
  final Map<String, MaintenanceWindowTaskParameterValueExpression>
      taskParameters;

  /// The parameters to pass to the task when it runs.
  final MaintenanceWindowTaskInvocationParameters taskInvocationParameters;

  /// The priority of the task when it runs. The lower the number, the higher
  /// the priority. Tasks that have the same priority are scheduled in parallel.
  final int priority;

  /// The maximum number of targets allowed to run this task in parallel.
  final String maxConcurrency;

  /// The maximum number of errors allowed before the task stops being
  /// scheduled.
  final String maxErrors;

  /// The location in Amazon S3 where the task results are logged.
  ///
  ///   `LoggingInfo` has been deprecated. To specify an S3 bucket to contain
  /// logs, instead use the `OutputS3BucketName` and `OutputS3KeyPrefix` options
  /// in the `TaskInvocationParameters` structure. For information about how
  /// Systems Manager handles these options for the supported maintenance window
  /// task types, see MaintenanceWindowTaskInvocationParameters.
  final LoggingInfo loggingInfo;

  /// The retrieved task name.
  final String name;

  /// The retrieved task description.
  final String description;

  GetMaintenanceWindowTaskResult({
    this.windowId,
    this.windowTaskId,
    this.targets,
    this.taskArn,
    this.serviceRoleArn,
    this.taskType,
    this.taskParameters,
    this.taskInvocationParameters,
    this.priority,
    this.maxConcurrency,
    this.maxErrors,
    this.loggingInfo,
    this.name,
    this.description,
  });
  static GetMaintenanceWindowTaskResult fromJson(Map<String, dynamic> json) =>
      GetMaintenanceWindowTaskResult();
}

class GetOpsItemResponse {
  /// The OpsItem.
  final OpsItem opsItem;

  GetOpsItemResponse({
    this.opsItem,
  });
  static GetOpsItemResponse fromJson(Map<String, dynamic> json) =>
      GetOpsItemResponse();
}

class GetOpsSummaryResult {
  /// The list of aggregated and filtered OpsItems.
  final List<OpsEntity> entities;

  /// The token for the next set of items to return. Use this token to get the
  /// next set of results.
  final String nextToken;

  GetOpsSummaryResult({
    this.entities,
    this.nextToken,
  });
  static GetOpsSummaryResult fromJson(Map<String, dynamic> json) =>
      GetOpsSummaryResult();
}

class GetParameterHistoryResult {
  /// A list of parameters returned by the request.
  final List<ParameterHistory> parameters;

  /// The token to use when requesting the next set of items. If there are no
  /// additional items to return, the string is empty.
  final String nextToken;

  GetParameterHistoryResult({
    this.parameters,
    this.nextToken,
  });
  static GetParameterHistoryResult fromJson(Map<String, dynamic> json) =>
      GetParameterHistoryResult();
}

class GetParameterResult {
  /// Information about a parameter.
  final Parameter parameter;

  GetParameterResult({
    this.parameter,
  });
  static GetParameterResult fromJson(Map<String, dynamic> json) =>
      GetParameterResult();
}

class GetParametersByPathResult {
  /// A list of parameters found in the specified hierarchy.
  final List<Parameter> parameters;

  /// The token for the next set of items to return. Use this token to get the
  /// next set of results.
  final String nextToken;

  GetParametersByPathResult({
    this.parameters,
    this.nextToken,
  });
  static GetParametersByPathResult fromJson(Map<String, dynamic> json) =>
      GetParametersByPathResult();
}

class GetParametersResult {
  /// A list of details for a parameter.
  final List<Parameter> parameters;

  /// A list of parameters that are not formatted correctly or do not run during
  /// an execution.
  final List<String> invalidParameters;

  GetParametersResult({
    this.parameters,
    this.invalidParameters,
  });
  static GetParametersResult fromJson(Map<String, dynamic> json) =>
      GetParametersResult();
}

class GetPatchBaselineForPatchGroupResult {
  /// The ID of the patch baseline that should be used for the patch group.
  final String baselineId;

  /// The name of the patch group.
  final String patchGroup;

  /// The operating system rule specified for patch groups using the patch
  /// baseline.
  final String operatingSystem;

  GetPatchBaselineForPatchGroupResult({
    this.baselineId,
    this.patchGroup,
    this.operatingSystem,
  });
  static GetPatchBaselineForPatchGroupResult fromJson(
          Map<String, dynamic> json) =>
      GetPatchBaselineForPatchGroupResult();
}

class GetPatchBaselineResult {
  /// The ID of the retrieved patch baseline.
  final String baselineId;

  /// The name of the patch baseline.
  final String name;

  /// Returns the operating system specified for the patch baseline.
  final String operatingSystem;

  /// A set of global filters used to exclude patches from the baseline.
  final PatchFilterGroup globalFilters;

  /// A set of rules used to include patches in the baseline.
  final PatchRuleGroup approvalRules;

  /// A list of explicitly approved patches for the baseline.
  final List<String> approvedPatches;

  /// Returns the specified compliance severity level for approved patches in
  /// the patch baseline.
  final String approvedPatchesComplianceLevel;

  /// Indicates whether the list of approved patches includes non-security
  /// updates that should be applied to the instances. The default value is
  /// 'false'. Applies to Linux instances only.
  final bool approvedPatchesEnableNonSecurity;

  /// A list of explicitly rejected patches for the baseline.
  final List<String> rejectedPatches;

  /// The action specified to take on patches included in the RejectedPatches
  /// list. A patch can be allowed only if it is a dependency of another
  /// package, or blocked entirely along with packages that include it as a
  /// dependency.
  final String rejectedPatchesAction;

  /// Patch groups included in the patch baseline.
  final List<String> patchGroups;

  /// The date the patch baseline was created.
  final DateTime createdDate;

  /// The date the patch baseline was last modified.
  final DateTime modifiedDate;

  /// A description of the patch baseline.
  final String description;

  /// Information about the patches to use to update the instances, including
  /// target operating systems and source repositories. Applies to Linux
  /// instances only.
  final List<PatchSource> sources;

  GetPatchBaselineResult({
    this.baselineId,
    this.name,
    this.operatingSystem,
    this.globalFilters,
    this.approvalRules,
    this.approvedPatches,
    this.approvedPatchesComplianceLevel,
    this.approvedPatchesEnableNonSecurity,
    this.rejectedPatches,
    this.rejectedPatchesAction,
    this.patchGroups,
    this.createdDate,
    this.modifiedDate,
    this.description,
    this.sources,
  });
  static GetPatchBaselineResult fromJson(Map<String, dynamic> json) =>
      GetPatchBaselineResult();
}

/// The query result body of the GetServiceSetting API action.
class GetServiceSettingResult {
  /// The query result of the current service setting.
  final ServiceSetting serviceSetting;

  GetServiceSettingResult({
    this.serviceSetting,
  });
  static GetServiceSettingResult fromJson(Map<String, dynamic> json) =>
      GetServiceSettingResult();
}

/// Status information about the aggregated associations.
class InstanceAggregatedAssociationOverview {
  /// Detailed status information about the aggregated associations.
  final String detailedStatus;

  /// The number of associations for the instance(s).
  final Map<String, int> instanceAssociationStatusAggregatedCount;

  InstanceAggregatedAssociationOverview({
    this.detailedStatus,
    this.instanceAssociationStatusAggregatedCount,
  });
  static InstanceAggregatedAssociationOverview fromJson(
          Map<String, dynamic> json) =>
      InstanceAggregatedAssociationOverview();
}

/// One or more association documents on the instance.
class InstanceAssociation {
  /// The association ID.
  final String associationId;

  /// The instance ID.
  final String instanceId;

  /// The content of the association document for the instance(s).
  final String content;

  /// Version information for the association on the instance.
  final String associationVersion;

  InstanceAssociation({
    this.associationId,
    this.instanceId,
    this.content,
    this.associationVersion,
  });
  static InstanceAssociation fromJson(Map<String, dynamic> json) =>
      InstanceAssociation();
}

/// An Amazon S3 bucket where you want to store the results of this request.
class InstanceAssociationOutputLocation {
  /// An Amazon S3 bucket where you want to store the results of this request.
  final S3OutputLocation s3Location;

  InstanceAssociationOutputLocation({
    this.s3Location,
  });
  static InstanceAssociationOutputLocation fromJson(
          Map<String, dynamic> json) =>
      InstanceAssociationOutputLocation();
}

/// The URL of Amazon S3 bucket where you want to store the results of this
/// request.
class InstanceAssociationOutputUrl {
  /// The URL of Amazon S3 bucket where you want to store the results of this
  /// request.
  final S3OutputUrl s3OutputUrl;

  InstanceAssociationOutputUrl({
    this.s3OutputUrl,
  });
  static InstanceAssociationOutputUrl fromJson(Map<String, dynamic> json) =>
      InstanceAssociationOutputUrl();
}

/// Status information about the instance association.
class InstanceAssociationStatusInfo {
  /// The association ID.
  final String associationId;

  /// The name of the association.
  final String name;

  /// The association document versions.
  final String documentVersion;

  /// The version of the association applied to the instance.
  final String associationVersion;

  /// The instance ID where the association was created.
  final String instanceId;

  /// The date the instance association ran.
  final DateTime executionDate;

  /// Status information about the instance association.
  final String status;

  /// Detailed status information about the instance association.
  final String detailedStatus;

  /// Summary information about association execution.
  final String executionSummary;

  /// An error code returned by the request to create the association.
  final String errorCode;

  /// A URL for an Amazon S3 bucket where you want to store the results of this
  /// request.
  final InstanceAssociationOutputUrl outputUrl;

  /// The name of the association applied to the instance.
  final String associationName;

  InstanceAssociationStatusInfo({
    this.associationId,
    this.name,
    this.documentVersion,
    this.associationVersion,
    this.instanceId,
    this.executionDate,
    this.status,
    this.detailedStatus,
    this.executionSummary,
    this.errorCode,
    this.outputUrl,
    this.associationName,
  });
  static InstanceAssociationStatusInfo fromJson(Map<String, dynamic> json) =>
      InstanceAssociationStatusInfo();
}

/// Describes a filter for a specific list of instances.
class InstanceInformation {
  /// The instance ID.
  final String instanceId;

  /// Connection status of SSM Agent.
  final String pingStatus;

  /// The date and time when agent last pinged Systems Manager service.
  final DateTime lastPingDateTime;

  /// The version of SSM Agent running on your Linux instance.
  final String agentVersion;

  /// Indicates whether latest version of SSM Agent is running on your instance.
  /// Some older versions of Windows Server use the EC2Config service to process
  /// SSM requests. For this reason, this field does not indicate whether or not
  /// the latest version is installed on Windows managed instances.
  final bool isLatestVersion;

  /// The operating system platform type.
  final String platformType;

  /// The name of the operating system platform running on your instance.
  final String platformName;

  /// The version of the OS platform running on your instance.
  final String platformVersion;

  /// The activation ID created by Systems Manager when the server or VM was
  /// registered.
  final String activationId;

  /// The Amazon Identity and Access Management (IAM) role assigned to the
  /// on-premises Systems Manager managed instances. This call does not return
  /// the IAM role for Amazon EC2 instances.
  final String iamRole;

  /// The date the server or VM was registered with AWS as a managed instance.
  final DateTime registrationDate;

  /// The type of instance. Instances are either EC2 instances or managed
  /// instances.
  final String resourceType;

  /// The name of the managed instance.
  final String name;

  /// The IP address of the managed instance.
  final String ipAddress;

  /// The fully qualified host name of the managed instance.
  final String computerName;

  /// The status of the association.
  final String associationStatus;

  /// The date the association was last run.
  final DateTime lastAssociationExecutionDate;

  /// The last date the association was successfully run.
  final DateTime lastSuccessfulAssociationExecutionDate;

  /// Information about the association.
  final InstanceAggregatedAssociationOverview associationOverview;

  InstanceInformation({
    this.instanceId,
    this.pingStatus,
    this.lastPingDateTime,
    this.agentVersion,
    this.isLatestVersion,
    this.platformType,
    this.platformName,
    this.platformVersion,
    this.activationId,
    this.iamRole,
    this.registrationDate,
    this.resourceType,
    this.name,
    this.ipAddress,
    this.computerName,
    this.associationStatus,
    this.lastAssociationExecutionDate,
    this.lastSuccessfulAssociationExecutionDate,
    this.associationOverview,
  });
  static InstanceInformation fromJson(Map<String, dynamic> json) =>
      InstanceInformation();
}

/// Describes a filter for a specific list of instances. You can filter
/// instances information by using tags. You specify tags by using a key-value
/// mapping.
///
/// Use this action instead of the
/// DescribeInstanceInformationRequest$InstanceInformationFilterList method. The
/// `InstanceInformationFilterList` method is a legacy method and does not
/// support tags.
class InstanceInformationFilter {
  /// The name of the filter.
  final String key;

  /// The filter values.
  final List<String> valueSet;

  InstanceInformationFilter({
    @required this.key,
    @required this.valueSet,
  });
}

/// The filters to describe or get information about your managed instances.
class InstanceInformationStringFilter {
  /// The filter key name to describe your instances. For example:
  ///
  /// "InstanceIds"|"AgentVersion"|"PingStatus"|"PlatformTypes"|"ActivationIds"|"IamRole"|"ResourceType"|"AssociationStatus"|"Tag
  /// Key"
  final String key;

  /// The filter values.
  final List<String> values;

  InstanceInformationStringFilter({
    @required this.key,
    @required this.values,
  });
}

/// Defines the high-level patch compliance state for a managed instance,
/// providing information about the number of installed, missing, not
/// applicable, and failed patches along with metadata about the operation when
/// this information was gathered for the instance.
class InstancePatchState {
  /// The ID of the managed instance the high-level patch compliance information
  /// was collected for.
  final String instanceId;

  /// The name of the patch group the managed instance belongs to.
  final String patchGroup;

  /// The ID of the patch baseline used to patch the instance.
  final String baselineId;

  /// The ID of the patch baseline snapshot used during the patching operation
  /// when this compliance data was collected.
  final String snapshotId;

  /// An https URL or an Amazon S3 path-style URL to a list of patches to be
  /// installed. This patch installation list, which you maintain in an Amazon
  /// S3 bucket in YAML format and specify in the SSM document
  /// `AWS-RunPatchBaseline`, overrides the patches specified by the default
  /// patch baseline.
  ///
  /// For more information about the `InstallOverrideList` parameter, see
  /// [About the SSM Document AWS-RunPatchBaseline](http://docs.aws.amazon.com/systems-manager/latest/userguide/patch-manager-about-aws-runpatchbaseline.html)
  /// in the _AWS Systems Manager User Guide_.
  final String installOverrideList;

  /// Placeholder information. This field will always be empty in the current
  /// release of the service.
  final String ownerInformation;

  /// The number of patches from the patch baseline that are installed on the
  /// instance.
  final int installedCount;

  /// The number of patches not specified in the patch baseline that are
  /// installed on the instance.
  final int installedOtherCount;

  /// The number of instances with patches installed that are specified in a
  /// RejectedPatches list. Patches with a status of _InstalledRejected_ were
  /// typically installed before they were added to a RejectedPatches list.
  ///
  ///
  ///
  /// If ALLOW_AS_DEPENDENCY is the specified option for RejectedPatchesAction,
  /// the value of InstalledRejectedCount will always be 0 (zero).
  final int installedRejectedCount;

  /// The number of patches from the patch baseline that are applicable for the
  /// instance but aren't currently installed.
  final int missingCount;

  /// The number of patches from the patch baseline that were attempted to be
  /// installed during the last patching operation, but failed to install.
  final int failedCount;

  /// The number of patches beyond the supported limit of `NotApplicableCount`
  /// that are not reported by name to Systems Manager Inventory.
  final int unreportedNotApplicableCount;

  /// The number of patches from the patch baseline that aren't applicable for
  /// the instance and therefore aren't installed on the instance. This number
  /// may be truncated if the list of patch names is very large. The number of
  /// patches beyond this limit are reported in `UnreportedNotApplicableCount`.
  final int notApplicableCount;

  /// The time the most recent patching operation was started on the instance.
  final DateTime operationStartTime;

  /// The time the most recent patching operation completed on the instance.
  final DateTime operationEndTime;

  /// The type of patching operation that was performed: SCAN (assess patch
  /// compliance state) or INSTALL (install missing patches).
  final String operation;

  InstancePatchState({
    @required this.instanceId,
    @required this.patchGroup,
    @required this.baselineId,
    this.snapshotId,
    this.installOverrideList,
    this.ownerInformation,
    this.installedCount,
    this.installedOtherCount,
    this.installedRejectedCount,
    this.missingCount,
    this.failedCount,
    this.unreportedNotApplicableCount,
    this.notApplicableCount,
    @required this.operationStartTime,
    @required this.operationEndTime,
    @required this.operation,
  });
  static InstancePatchState fromJson(Map<String, dynamic> json) =>
      InstancePatchState();
}

/// Defines a filter used in DescribeInstancePatchStatesForPatchGroup used to
/// scope down the information returned by the API.
class InstancePatchStateFilter {
  /// The key for the filter. Supported values are FailedCount, InstalledCount,
  /// InstalledOtherCount, MissingCount and NotApplicableCount.
  final String key;

  /// The value for the filter, must be an integer greater than or equal to 0.
  final List<String> values;

  /// The type of comparison that should be performed for the value: Equal,
  /// NotEqual, LessThan or GreaterThan.
  final String type;

  InstancePatchStateFilter({
    @required this.key,
    @required this.values,
    @required this.type,
  });
}

/// Specifies the inventory type and attribute for the aggregation execution.
class InventoryAggregator {
  /// The inventory type and attribute name for aggregation.
  final String expression;

  /// Nested aggregators to further refine aggregation for an inventory type.
  final List<InventoryAggregator> aggregators;

  /// A user-defined set of one or more filters on which to aggregate inventory
  /// data. Groups return a count of resources that match and don't match the
  /// specified criteria.
  final List<InventoryGroup> groups;

  InventoryAggregator({
    this.expression,
    this.aggregators,
    this.groups,
  });
}

/// Status information returned by the `DeleteInventory` action.
class InventoryDeletionStatusItem {
  /// The deletion ID returned by the `DeleteInventory` action.
  final String deletionId;

  /// The name of the inventory data type.
  final String typeName;

  /// The UTC timestamp when the delete operation started.
  final DateTime deletionStartTime;

  /// The status of the operation. Possible values are InProgress and Complete.
  final String lastStatus;

  /// Information about the status.
  final String lastStatusMessage;

  /// Information about the delete operation. For more information about this
  /// summary, see
  /// [Understanding the Delete Inventory Summary](http://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-inventory-custom.html#sysman-inventory-delete)
  /// in the _AWS Systems Manager User Guide_.
  final InventoryDeletionSummary deletionSummary;

  /// The UTC timestamp of when the last status report.
  final DateTime lastStatusUpdateTime;

  InventoryDeletionStatusItem({
    this.deletionId,
    this.typeName,
    this.deletionStartTime,
    this.lastStatus,
    this.lastStatusMessage,
    this.deletionSummary,
    this.lastStatusUpdateTime,
  });
  static InventoryDeletionStatusItem fromJson(Map<String, dynamic> json) =>
      InventoryDeletionStatusItem();
}

/// Information about the delete operation.
class InventoryDeletionSummary {
  /// The total number of items to delete. This count does not change during the
  /// delete operation.
  final int totalCount;

  /// Remaining number of items to delete.
  final int remainingCount;

  /// A list of counts and versions for deleted items.
  final List<InventoryDeletionSummaryItem> summaryItems;

  InventoryDeletionSummary({
    this.totalCount,
    this.remainingCount,
    this.summaryItems,
  });
  static InventoryDeletionSummary fromJson(Map<String, dynamic> json) =>
      InventoryDeletionSummary();
}

/// Either a count, remaining count, or a version number in a delete inventory
/// summary.
class InventoryDeletionSummaryItem {
  /// The inventory type version.
  final String version;

  /// A count of the number of deleted items.
  final int count;

  /// The remaining number of items to delete.
  final int remainingCount;

  InventoryDeletionSummaryItem({
    this.version,
    this.count,
    this.remainingCount,
  });
  static InventoryDeletionSummaryItem fromJson(Map<String, dynamic> json) =>
      InventoryDeletionSummaryItem();
}

/// One or more filters. Use a filter to return a more specific list of results.
class InventoryFilter {
  /// The name of the filter key.
  final String key;

  /// Inventory filter values. Example: inventory filter where instance IDs are
  /// specified as values Key=AWS:InstanceInformation.InstanceId,Values=
  /// i-a12b3c4d5e6g, i-1a2b3c4d5e6,Type=Equal
  final List<String> values;

  /// The type of filter. Valid values include the following:
  /// "Equal"|"NotEqual"|"BeginWith"|"LessThan"|"GreaterThan"
  final String type;

  InventoryFilter({
    @required this.key,
    @required this.values,
    this.type,
  });
}

/// A user-defined set of one or more filters on which to aggregate inventory
/// data. Groups return a count of resources that match and don't match the
/// specified criteria.
class InventoryGroup {
  /// The name of the group.
  final String name;

  /// Filters define the criteria for the group. The `matchingCount` field
  /// displays the number of resources that match the criteria. The
  /// `notMatchingCount` field displays the number of resources that don't match
  /// the criteria.
  final List<InventoryFilter> filters;

  InventoryGroup({
    @required this.name,
    @required this.filters,
  });
}

/// Information collected from managed instances based on your inventory policy
/// document
class InventoryItem {
  /// The name of the inventory type. Default inventory item type names start
  /// with AWS. Custom inventory type names will start with Custom. Default
  /// inventory item types include the following: AWS:AWSComponent,
  /// AWS:Application, AWS:InstanceInformation, AWS:Network, and
  /// AWS:WindowsUpdate.
  final String typeName;

  /// The schema version for the inventory item.
  final String schemaVersion;

  /// The time the inventory information was collected.
  final String captureTime;

  /// MD5 hash of the inventory item type contents. The content hash is used to
  /// determine whether to update inventory information. The PutInventory API
  /// does not update the inventory item type contents if the MD5 hash has not
  /// changed since last update.
  final String contentHash;

  /// The inventory data of the inventory type.
  final List<Map<String, String>> content;

  /// A map of associated properties for a specified inventory type. For
  /// example, with this attribute, you can specify the `ExecutionId`,
  /// `ExecutionType`, `ComplianceType` properties of the `AWS:ComplianceItem`
  /// type.
  final Map<String, String> context;

  InventoryItem({
    @required this.typeName,
    @required this.schemaVersion,
    @required this.captureTime,
    this.contentHash,
    this.content,
    this.context,
  });
}

/// Attributes are the entries within the inventory item content. It contains
/// name and value.
class InventoryItemAttribute {
  /// Name of the inventory item attribute.
  final String name;

  /// The data type of the inventory item attribute.
  final String dataType;

  InventoryItemAttribute({
    @required this.name,
    @required this.dataType,
  });
  static InventoryItemAttribute fromJson(Map<String, dynamic> json) =>
      InventoryItemAttribute();
}

/// The inventory item schema definition. Users can use this to compose
/// inventory query filters.
class InventoryItemSchema {
  /// The name of the inventory type. Default inventory item type names start
  /// with AWS. Custom inventory type names will start with Custom. Default
  /// inventory item types include the following: AWS:AWSComponent,
  /// AWS:Application, AWS:InstanceInformation, AWS:Network, and
  /// AWS:WindowsUpdate.
  final String typeName;

  /// The schema version for the inventory item.
  final String version;

  /// The schema attributes for inventory. This contains data type and attribute
  /// name.
  final List<InventoryItemAttribute> attributes;

  /// The alias name of the inventory type. The alias name is used for display
  /// purposes.
  final String displayName;

  InventoryItemSchema({
    @required this.typeName,
    this.version,
    @required this.attributes,
    this.displayName,
  });
  static InventoryItemSchema fromJson(Map<String, dynamic> json) =>
      InventoryItemSchema();
}

/// Inventory query results.
class InventoryResultEntity {
  /// ID of the inventory result entity. For example, for managed instance
  /// inventory the result will be the managed instance ID. For EC2 instance
  /// inventory, the result will be the instance ID.
  final String id;

  /// The data section in the inventory result entity JSON.
  final Map<String, InventoryResultItem> data;

  InventoryResultEntity({
    this.id,
    this.data,
  });
  static InventoryResultEntity fromJson(Map<String, dynamic> json) =>
      InventoryResultEntity();
}

/// The inventory result item.
class InventoryResultItem {
  /// The name of the inventory result item type.
  final String typeName;

  /// The schema version for the inventory result item/
  final String schemaVersion;

  /// The time inventory item data was captured.
  final String captureTime;

  /// MD5 hash of the inventory item type contents. The content hash is used to
  /// determine whether to update inventory information. The PutInventory API
  /// does not update the inventory item type contents if the MD5 hash has not
  /// changed since last update.
  final String contentHash;

  /// Contains all the inventory data of the item type. Results include
  /// attribute names and values.
  final List<Map<String, String>> content;

  InventoryResultItem({
    @required this.typeName,
    @required this.schemaVersion,
    this.captureTime,
    this.contentHash,
    @required this.content,
  });
  static InventoryResultItem fromJson(Map<String, dynamic> json) =>
      InventoryResultItem();
}

class LabelParameterVersionResult {
  /// The label does not meet the requirements. For information about parameter
  /// label requirements, see
  /// [Labeling Parameters](http://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-paramstore-labels.html)
  /// in the _AWS Systems Manager User Guide_.
  final List<String> invalidLabels;

  LabelParameterVersionResult({
    this.invalidLabels,
  });
  static LabelParameterVersionResult fromJson(Map<String, dynamic> json) =>
      LabelParameterVersionResult();
}

class ListAssociationVersionsResult {
  /// Information about all versions of the association for the specified
  /// association ID.
  final List<AssociationVersionInfo> associationVersions;

  /// The token for the next set of items to return. Use this token to get the
  /// next set of results.
  final String nextToken;

  ListAssociationVersionsResult({
    this.associationVersions,
    this.nextToken,
  });
  static ListAssociationVersionsResult fromJson(Map<String, dynamic> json) =>
      ListAssociationVersionsResult();
}

class ListAssociationsResult {
  /// The associations.
  final List<Association> associations;

  /// The token to use when requesting the next set of items. If there are no
  /// additional items to return, the string is empty.
  final String nextToken;

  ListAssociationsResult({
    this.associations,
    this.nextToken,
  });
  static ListAssociationsResult fromJson(Map<String, dynamic> json) =>
      ListAssociationsResult();
}

class ListCommandInvocationsResult {
  /// (Optional) A list of all invocations.
  final List<CommandInvocation> commandInvocations;

  /// (Optional) The token for the next set of items to return. (You received
  /// this token from a previous call.)
  final String nextToken;

  ListCommandInvocationsResult({
    this.commandInvocations,
    this.nextToken,
  });
  static ListCommandInvocationsResult fromJson(Map<String, dynamic> json) =>
      ListCommandInvocationsResult();
}

class ListCommandsResult {
  /// (Optional) The list of commands requested by the user.
  final List<Command> commands;

  /// (Optional) The token for the next set of items to return. (You received
  /// this token from a previous call.)
  final String nextToken;

  ListCommandsResult({
    this.commands,
    this.nextToken,
  });
  static ListCommandsResult fromJson(Map<String, dynamic> json) =>
      ListCommandsResult();
}

class ListComplianceItemsResult {
  /// A list of compliance information for the specified resource ID.
  final List<ComplianceItem> complianceItems;

  /// The token for the next set of items to return. Use this token to get the
  /// next set of results.
  final String nextToken;

  ListComplianceItemsResult({
    this.complianceItems,
    this.nextToken,
  });
  static ListComplianceItemsResult fromJson(Map<String, dynamic> json) =>
      ListComplianceItemsResult();
}

class ListComplianceSummariesResult {
  /// A list of compliant and non-compliant summary counts based on compliance
  /// types. For example, this call returns State Manager associations, patches,
  /// or custom compliance types according to the filter criteria that you
  /// specified.
  final List<ComplianceSummaryItem> complianceSummaryItems;

  /// The token for the next set of items to return. Use this token to get the
  /// next set of results.
  final String nextToken;

  ListComplianceSummariesResult({
    this.complianceSummaryItems,
    this.nextToken,
  });
  static ListComplianceSummariesResult fromJson(Map<String, dynamic> json) =>
      ListComplianceSummariesResult();
}

class ListDocumentVersionsResult {
  /// The document versions.
  final List<DocumentVersionInfo> documentVersions;

  /// The token to use when requesting the next set of items. If there are no
  /// additional items to return, the string is empty.
  final String nextToken;

  ListDocumentVersionsResult({
    this.documentVersions,
    this.nextToken,
  });
  static ListDocumentVersionsResult fromJson(Map<String, dynamic> json) =>
      ListDocumentVersionsResult();
}

class ListDocumentsResult {
  /// The names of the Systems Manager documents.
  final List<DocumentIdentifier> documentIdentifiers;

  /// The token to use when requesting the next set of items. If there are no
  /// additional items to return, the string is empty.
  final String nextToken;

  ListDocumentsResult({
    this.documentIdentifiers,
    this.nextToken,
  });
  static ListDocumentsResult fromJson(Map<String, dynamic> json) =>
      ListDocumentsResult();
}

class ListInventoryEntriesResult {
  /// The type of inventory item returned by the request.
  final String typeName;

  /// The instance ID targeted by the request to query inventory information.
  final String instanceId;

  /// The inventory schema version used by the instance(s).
  final String schemaVersion;

  /// The time that inventory information was collected for the instance(s).
  final String captureTime;

  /// A list of inventory items on the instance(s).
  final List<Map<String, String>> entries;

  /// The token to use when requesting the next set of items. If there are no
  /// additional items to return, the string is empty.
  final String nextToken;

  ListInventoryEntriesResult({
    this.typeName,
    this.instanceId,
    this.schemaVersion,
    this.captureTime,
    this.entries,
    this.nextToken,
  });
  static ListInventoryEntriesResult fromJson(Map<String, dynamic> json) =>
      ListInventoryEntriesResult();
}

class ListResourceComplianceSummariesResult {
  /// A summary count for specified or targeted managed instances. Summary count
  /// includes information about compliant and non-compliant State Manager
  /// associations, patch status, or custom items according to the filter
  /// criteria that you specify.
  final List<ResourceComplianceSummaryItem> resourceComplianceSummaryItems;

  /// The token for the next set of items to return. Use this token to get the
  /// next set of results.
  final String nextToken;

  ListResourceComplianceSummariesResult({
    this.resourceComplianceSummaryItems,
    this.nextToken,
  });
  static ListResourceComplianceSummariesResult fromJson(
          Map<String, dynamic> json) =>
      ListResourceComplianceSummariesResult();
}

class ListResourceDataSyncResult {
  /// A list of your current Resource Data Sync configurations and their
  /// statuses.
  final List<ResourceDataSyncItem> resourceDataSyncItems;

  /// The token for the next set of items to return. Use this token to get the
  /// next set of results.
  final String nextToken;

  ListResourceDataSyncResult({
    this.resourceDataSyncItems,
    this.nextToken,
  });
  static ListResourceDataSyncResult fromJson(Map<String, dynamic> json) =>
      ListResourceDataSyncResult();
}

class ListTagsForResourceResult {
  /// A list of tags.
  final List<Tag> tagList;

  ListTagsForResourceResult({
    this.tagList,
  });
  static ListTagsForResourceResult fromJson(Map<String, dynamic> json) =>
      ListTagsForResourceResult();
}

/// Information about an Amazon S3 bucket to write instance-level logs to.
///
///   `LoggingInfo` has been deprecated. To specify an S3 bucket to contain
/// logs, instead use the `OutputS3BucketName` and `OutputS3KeyPrefix` options
/// in the `TaskInvocationParameters` structure. For information about how
/// Systems Manager handles these options for the supported maintenance window
/// task types, see MaintenanceWindowTaskInvocationParameters.
class LoggingInfo {
  /// The name of an Amazon S3 bucket where execution logs are stored .
  final String s3BucketName;

  /// (Optional) The Amazon S3 bucket subfolder.
  final String s3KeyPrefix;

  /// The region where the Amazon S3 bucket is located.
  final String s3Region;

  LoggingInfo({
    @required this.s3BucketName,
    this.s3KeyPrefix,
    @required this.s3Region,
  });
  static LoggingInfo fromJson(Map<String, dynamic> json) => LoggingInfo();
}

/// The parameters for an AUTOMATION task type.
class MaintenanceWindowAutomationParameters {
  /// The version of an Automation document to use during task execution.
  final String documentVersion;

  /// The parameters for the AUTOMATION task.
  ///
  /// For information about specifying and updating task parameters, see
  /// RegisterTaskWithMaintenanceWindow and UpdateMaintenanceWindowTask.
  ///
  ///   `LoggingInfo` has been deprecated. To specify an S3 bucket to contain
  /// logs, instead use the `OutputS3BucketName` and `OutputS3KeyPrefix` options
  /// in the `TaskInvocationParameters` structure. For information about how
  /// Systems Manager handles these options for the supported maintenance window
  /// task types, see MaintenanceWindowTaskInvocationParameters.
  ///
  ///  `TaskParameters` has been deprecated. To specify parameters to pass to a
  /// task when it runs, instead use the `Parameters` option in the
  /// `TaskInvocationParameters` structure. For information about how Systems
  /// Manager handles these options for the supported maintenance window task
  /// types, see MaintenanceWindowTaskInvocationParameters.
  ///
  /// For AUTOMATION task types, Systems Manager ignores any values specified
  /// for these parameters.
  final Map<String, List<String>> parameters;

  MaintenanceWindowAutomationParameters({
    this.documentVersion,
    this.parameters,
  });
  static MaintenanceWindowAutomationParameters fromJson(
          Map<String, dynamic> json) =>
      MaintenanceWindowAutomationParameters();
}

/// Describes the information about an execution of a maintenance window.
class MaintenanceWindowExecution {
  /// The ID of the maintenance window.
  final String windowId;

  /// The ID of the maintenance window execution.
  final String windowExecutionId;

  /// The status of the execution.
  final String status;

  /// The details explaining the Status. Only available for certain status
  /// values.
  final String statusDetails;

  /// The time the execution started.
  final DateTime startTime;

  /// The time the execution finished.
  final DateTime endTime;

  MaintenanceWindowExecution({
    this.windowId,
    this.windowExecutionId,
    this.status,
    this.statusDetails,
    this.startTime,
    this.endTime,
  });
  static MaintenanceWindowExecution fromJson(Map<String, dynamic> json) =>
      MaintenanceWindowExecution();
}

/// Information about a task execution performed as part of a maintenance window
/// execution.
class MaintenanceWindowExecutionTaskIdentity {
  /// The ID of the maintenance window execution that ran the task.
  final String windowExecutionId;

  /// The ID of the specific task execution in the maintenance window execution.
  final String taskExecutionId;

  /// The status of the task execution.
  final String status;

  /// The details explaining the status of the task execution. Only available
  /// for certain status values.
  final String statusDetails;

  /// The time the task execution started.
  final DateTime startTime;

  /// The time the task execution finished.
  final DateTime endTime;

  /// The ARN of the task that ran.
  final String taskArn;

  /// The type of task that ran.
  final String taskType;

  MaintenanceWindowExecutionTaskIdentity({
    this.windowExecutionId,
    this.taskExecutionId,
    this.status,
    this.statusDetails,
    this.startTime,
    this.endTime,
    this.taskArn,
    this.taskType,
  });
  static MaintenanceWindowExecutionTaskIdentity fromJson(
          Map<String, dynamic> json) =>
      MaintenanceWindowExecutionTaskIdentity();
}

/// Describes the information about a task invocation for a particular target as
/// part of a task execution performed as part of a maintenance window
/// execution.
class MaintenanceWindowExecutionTaskInvocationIdentity {
  /// The ID of the maintenance window execution that ran the task.
  final String windowExecutionId;

  /// The ID of the specific task execution in the maintenance window execution.
  final String taskExecutionId;

  /// The ID of the task invocation.
  final String invocationId;

  /// The ID of the action performed in the service that actually handled the
  /// task invocation. If the task type is RUN_COMMAND, this value is the
  /// command ID.
  final String executionId;

  /// The task type.
  final String taskType;

  /// The parameters that were provided for the invocation when it was run.
  final String parameters;

  /// The status of the task invocation.
  final String status;

  /// The details explaining the status of the task invocation. Only available
  /// for certain Status values.
  final String statusDetails;

  /// The time the invocation started.
  final DateTime startTime;

  /// The time the invocation finished.
  final DateTime endTime;

  /// User-provided value that was specified when the target was registered with
  /// the maintenance window. This was also included in any CloudWatch events
  /// raised during the task invocation.
  final String ownerInformation;

  /// The ID of the target definition in this maintenance window the invocation
  /// was performed for.
  final String windowTargetId;

  MaintenanceWindowExecutionTaskInvocationIdentity({
    this.windowExecutionId,
    this.taskExecutionId,
    this.invocationId,
    this.executionId,
    this.taskType,
    this.parameters,
    this.status,
    this.statusDetails,
    this.startTime,
    this.endTime,
    this.ownerInformation,
    this.windowTargetId,
  });
  static MaintenanceWindowExecutionTaskInvocationIdentity fromJson(
          Map<String, dynamic> json) =>
      MaintenanceWindowExecutionTaskInvocationIdentity();
}

/// Filter used in the request. Supported filter keys are Name and Enabled.
class MaintenanceWindowFilter {
  /// The name of the filter.
  final String key;

  /// The filter values.
  final List<String> values;

  MaintenanceWindowFilter({
    this.key,
    this.values,
  });
}

/// Information about the maintenance window.
class MaintenanceWindowIdentity {
  /// The ID of the maintenance window.
  final String windowId;

  /// The name of the maintenance window.
  final String name;

  /// A description of the maintenance window.
  final String description;

  /// Indicates whether the maintenance window is enabled.
  final bool enabled;

  /// The duration of the maintenance window in hours.
  final int duration;

  /// The number of hours before the end of the maintenance window that Systems
  /// Manager stops scheduling new tasks for execution.
  final int cutoff;

  /// The schedule of the maintenance window in the form of a cron or rate
  /// expression.
  final String schedule;

  /// The time zone that the scheduled maintenance window executions are based
  /// on, in Internet Assigned Numbers Authority (IANA) format.
  final String scheduleTimezone;

  /// The date and time, in ISO-8601 Extended format, for when the maintenance
  /// window is scheduled to become inactive.
  final String endDate;

  /// The date and time, in ISO-8601 Extended format, for when the maintenance
  /// window is scheduled to become active.
  final String startDate;

  /// The next time the maintenance window will actually run, taking into
  /// account any specified times for the maintenance window to become active or
  /// inactive.
  final String nextExecutionTime;

  MaintenanceWindowIdentity({
    this.windowId,
    this.name,
    this.description,
    this.enabled,
    this.duration,
    this.cutoff,
    this.schedule,
    this.scheduleTimezone,
    this.endDate,
    this.startDate,
    this.nextExecutionTime,
  });
  static MaintenanceWindowIdentity fromJson(Map<String, dynamic> json) =>
      MaintenanceWindowIdentity();
}

/// The maintenance window to which the specified target belongs.
class MaintenanceWindowIdentityForTarget {
  /// The ID of the maintenance window.
  final String windowId;

  /// The name of the maintenance window.
  final String name;

  MaintenanceWindowIdentityForTarget({
    this.windowId,
    this.name,
  });
  static MaintenanceWindowIdentityForTarget fromJson(
          Map<String, dynamic> json) =>
      MaintenanceWindowIdentityForTarget();
}

/// The parameters for a LAMBDA task type.
///
/// For information about specifying and updating task parameters, see
/// RegisterTaskWithMaintenanceWindow and UpdateMaintenanceWindowTask.
///
///   `LoggingInfo` has been deprecated. To specify an S3 bucket to contain
/// logs, instead use the `OutputS3BucketName` and `OutputS3KeyPrefix` options
/// in the `TaskInvocationParameters` structure. For information about how
/// Systems Manager handles these options for the supported maintenance window
/// task types, see MaintenanceWindowTaskInvocationParameters.
///
///  `TaskParameters` has been deprecated. To specify parameters to pass to a
/// task when it runs, instead use the `Parameters` option in the
/// `TaskInvocationParameters` structure. For information about how Systems
/// Manager handles these options for the supported maintenance window task
/// types, see MaintenanceWindowTaskInvocationParameters.
///
/// For Lambda tasks, Systems Manager ignores any values specified for
/// TaskParameters and LoggingInfo.
class MaintenanceWindowLambdaParameters {
  /// Pass client-specific information to the Lambda function that you are
  /// invoking. You can then process the client information in your Lambda
  /// function as you choose through the context variable.
  final String clientContext;

  /// (Optional) Specify a Lambda function version or alias name. If you specify
  /// a function version, the action uses the qualified function ARN to invoke a
  /// specific Lambda function. If you specify an alias name, the action uses
  /// the alias ARN to invoke the Lambda function version to which the alias
  /// points.
  final String qualifier;

  /// JSON to provide to your Lambda function as input.
  final Uint8List payload;

  MaintenanceWindowLambdaParameters({
    this.clientContext,
    this.qualifier,
    this.payload,
  });
  static MaintenanceWindowLambdaParameters fromJson(
          Map<String, dynamic> json) =>
      MaintenanceWindowLambdaParameters();
}

/// The parameters for a RUN_COMMAND task type.
///
/// For information about specifying and updating task parameters, see
/// RegisterTaskWithMaintenanceWindow and UpdateMaintenanceWindowTask.
///
///   `LoggingInfo` has been deprecated. To specify an S3 bucket to contain
/// logs, instead use the `OutputS3BucketName` and `OutputS3KeyPrefix` options
/// in the `TaskInvocationParameters` structure. For information about how
/// Systems Manager handles these options for the supported maintenance window
/// task types, see MaintenanceWindowTaskInvocationParameters.
///
///  `TaskParameters` has been deprecated. To specify parameters to pass to a
/// task when it runs, instead use the `Parameters` option in the
/// `TaskInvocationParameters` structure. For information about how Systems
/// Manager handles these options for the supported maintenance window task
/// types, see MaintenanceWindowTaskInvocationParameters.
///
/// For Run Command tasks, Systems Manager uses specified values for
/// `TaskParameters` and `LoggingInfo` only if no values are specified for
/// `TaskInvocationParameters`.
class MaintenanceWindowRunCommandParameters {
  /// Information about the commands to run.
  final String comment;

  /// The SHA-256 or SHA-1 hash created by the system when the document was
  /// created. SHA-1 hashes have been deprecated.
  final String documentHash;

  /// SHA-256 or SHA-1. SHA-1 hashes have been deprecated.
  final String documentHashType;

  /// Configurations for sending notifications about command status changes on a
  /// per-instance basis.
  final NotificationConfig notificationConfig;

  /// The name of the Amazon S3 bucket.
  final String outputS3BucketName;

  /// The Amazon S3 bucket subfolder.
  final String outputS3KeyPrefix;

  /// The parameters for the RUN_COMMAND task execution.
  final Map<String, List<String>> parameters;

  /// The ARN of the IAM service role to use to publish Amazon Simple
  /// Notification Service (Amazon SNS) notifications for maintenance window Run
  /// Command tasks.
  final String serviceRoleArn;

  /// If this time is reached and the command has not already started running,
  /// it doesn't run.
  final int timeoutSeconds;

  MaintenanceWindowRunCommandParameters({
    this.comment,
    this.documentHash,
    this.documentHashType,
    this.notificationConfig,
    this.outputS3BucketName,
    this.outputS3KeyPrefix,
    this.parameters,
    this.serviceRoleArn,
    this.timeoutSeconds,
  });
  static MaintenanceWindowRunCommandParameters fromJson(
          Map<String, dynamic> json) =>
      MaintenanceWindowRunCommandParameters();
}

/// The parameters for a STEP_FUNCTIONS task.
///
/// For information about specifying and updating task parameters, see
/// RegisterTaskWithMaintenanceWindow and UpdateMaintenanceWindowTask.
///
///   `LoggingInfo` has been deprecated. To specify an S3 bucket to contain
/// logs, instead use the `OutputS3BucketName` and `OutputS3KeyPrefix` options
/// in the `TaskInvocationParameters` structure. For information about how
/// Systems Manager handles these options for the supported maintenance window
/// task types, see MaintenanceWindowTaskInvocationParameters.
///
///  `TaskParameters` has been deprecated. To specify parameters to pass to a
/// task when it runs, instead use the `Parameters` option in the
/// `TaskInvocationParameters` structure. For information about how Systems
/// Manager handles these options for the supported maintenance window task
/// types, see MaintenanceWindowTaskInvocationParameters.
///
/// For Step Functions tasks, Systems Manager ignores any values specified for
/// `TaskParameters` and `LoggingInfo`.
class MaintenanceWindowStepFunctionsParameters {
  /// The inputs for the STEP_FUNCTIONS task.
  final String input;

  /// The name of the STEP_FUNCTIONS task.
  final String name;

  MaintenanceWindowStepFunctionsParameters({
    this.input,
    this.name,
  });
  static MaintenanceWindowStepFunctionsParameters fromJson(
          Map<String, dynamic> json) =>
      MaintenanceWindowStepFunctionsParameters();
}

/// The target registered with the maintenance window.
class MaintenanceWindowTarget {
  /// The ID of the maintenance window to register the target with.
  final String windowId;

  /// The ID of the target.
  final String windowTargetId;

  /// The type of target that is being registered with the maintenance window.
  final String resourceType;

  /// The targets, either instances or tags.
  ///
  /// Specify instances using the following format:
  ///
  ///  `Key=instanceids,Values=<instanceid1>,<instanceid2>`
  ///
  /// Tags are specified using the following format:
  ///
  ///  `Key=<tag name>,Values=<tag value>`.
  final List<Target> targets;

  /// A user-provided value that will be included in any CloudWatch events that
  /// are raised while running tasks for these targets in this maintenance
  /// window.
  final String ownerInformation;

  /// The name for the maintenance window target.
  final String name;

  /// A description for the target.
  final String description;

  MaintenanceWindowTarget({
    this.windowId,
    this.windowTargetId,
    this.resourceType,
    this.targets,
    this.ownerInformation,
    this.name,
    this.description,
  });
  static MaintenanceWindowTarget fromJson(Map<String, dynamic> json) =>
      MaintenanceWindowTarget();
}

/// Information about a task defined for a maintenance window.
class MaintenanceWindowTask {
  /// The ID of the maintenance window where the task is registered.
  final String windowId;

  /// The task ID.
  final String windowTaskId;

  /// The resource that the task uses during execution. For RUN_COMMAND and
  /// AUTOMATION task types, `TaskArn` is the Systems Manager document name or
  /// ARN. For LAMBDA tasks, it's the function name or ARN. For STEP_FUNCTIONS
  /// tasks, it's the state machine ARN.
  final String taskArn;

  /// The type of task. The type can be one of the following: RUN_COMMAND,
  /// AUTOMATION, LAMBDA, or STEP_FUNCTIONS.
  final String type;

  /// The targets (either instances or tags). Instances are specified using
  /// Key=instanceids,Values=<instanceid1>,<instanceid2>. Tags are specified
  /// using Key=<tag name>,Values=<tag value>.
  final List<Target> targets;

  /// The parameters that should be passed to the task when it is run.
  ///
  ///   `TaskParameters` has been deprecated. To specify parameters to pass to a
  /// task when it runs, instead use the `Parameters` option in the
  /// `TaskInvocationParameters` structure. For information about how Systems
  /// Manager handles these options for the supported maintenance window task
  /// types, see MaintenanceWindowTaskInvocationParameters.
  final Map<String, MaintenanceWindowTaskParameterValueExpression>
      taskParameters;

  /// The priority of the task in the maintenance window. The lower the number,
  /// the higher the priority. Tasks that have the same priority are scheduled
  /// in parallel.
  final int priority;

  /// Information about an Amazon S3 bucket to write task-level logs to.
  ///
  ///   `LoggingInfo` has been deprecated. To specify an S3 bucket to contain
  /// logs, instead use the `OutputS3BucketName` and `OutputS3KeyPrefix` options
  /// in the `TaskInvocationParameters` structure. For information about how
  /// Systems Manager handles these options for the supported maintenance window
  /// task types, see MaintenanceWindowTaskInvocationParameters.
  final LoggingInfo loggingInfo;

  /// The ARN of the IAM service role to use to publish Amazon Simple
  /// Notification Service (Amazon SNS) notifications for maintenance window Run
  /// Command tasks.
  final String serviceRoleArn;

  /// The maximum number of targets this task can be run for, in parallel.
  final String maxConcurrency;

  /// The maximum number of errors allowed before this task stops being
  /// scheduled.
  final String maxErrors;

  /// The task name.
  final String name;

  /// A description of the task.
  final String description;

  MaintenanceWindowTask({
    this.windowId,
    this.windowTaskId,
    this.taskArn,
    this.type,
    this.targets,
    this.taskParameters,
    this.priority,
    this.loggingInfo,
    this.serviceRoleArn,
    this.maxConcurrency,
    this.maxErrors,
    this.name,
    this.description,
  });
  static MaintenanceWindowTask fromJson(Map<String, dynamic> json) =>
      MaintenanceWindowTask();
}

/// The parameters for task execution.
class MaintenanceWindowTaskInvocationParameters {
  /// The parameters for a RUN_COMMAND task type.
  final MaintenanceWindowRunCommandParameters runCommand;

  /// The parameters for an AUTOMATION task type.
  final MaintenanceWindowAutomationParameters automation;

  /// The parameters for a STEP_FUNCTIONS task type.
  final MaintenanceWindowStepFunctionsParameters stepFunctions;

  /// The parameters for a LAMBDA task type.
  final MaintenanceWindowLambdaParameters lambda;

  MaintenanceWindowTaskInvocationParameters({
    this.runCommand,
    this.automation,
    this.stepFunctions,
    this.lambda,
  });
  static MaintenanceWindowTaskInvocationParameters fromJson(
          Map<String, dynamic> json) =>
      MaintenanceWindowTaskInvocationParameters();
}

/// Defines the values for a task parameter.
class MaintenanceWindowTaskParameterValueExpression {
  /// This field contains an array of 0 or more strings, each 1 to 255
  /// characters in length.
  final List<String> values;

  MaintenanceWindowTaskParameterValueExpression({
    this.values,
  });
  static MaintenanceWindowTaskParameterValueExpression fromJson(
          Map<String, dynamic> json) =>
      MaintenanceWindowTaskParameterValueExpression();
}

class ModifyDocumentPermissionResponse {
  ModifyDocumentPermissionResponse();
  static ModifyDocumentPermissionResponse fromJson(Map<String, dynamic> json) =>
      ModifyDocumentPermissionResponse();
}

/// A summary of resources that are not compliant. The summary is organized
/// according to resource type.
class NonCompliantSummary {
  /// The total number of compliance items that are not compliant.
  final int nonCompliantCount;

  /// A summary of the non-compliance severity by compliance type
  final SeveritySummary severitySummary;

  NonCompliantSummary({
    this.nonCompliantCount,
    this.severitySummary,
  });
  static NonCompliantSummary fromJson(Map<String, dynamic> json) =>
      NonCompliantSummary();
}

/// Configurations for sending notifications.
class NotificationConfig {
  /// An Amazon Resource Name (ARN) for an Amazon Simple Notification Service
  /// (Amazon SNS) topic. Run Command pushes notifications about command status
  /// changes to this topic.
  final String notificationArn;

  /// The different events for which you can receive notifications. These events
  /// include the following: All (events), InProgress, Success, TimedOut,
  /// Cancelled, Failed. To learn more about these events, see
  /// [Configuring Amazon SNS Notifications for AWS Systems Manager](http://docs.aws.amazon.com/systems-manager/latest/userguide/monitoring-sns-notifications.html)
  /// in the _AWS Systems Manager User Guide_.
  final List<String> notificationEvents;

  /// Command: Receive notification when the status of a command changes.
  /// Invocation: For commands sent to multiple instances, receive notification
  /// on a per-instance basis when the status of a command changes.
  final String notificationType;

  NotificationConfig({
    this.notificationArn,
    this.notificationEvents,
    this.notificationType,
  });
  static NotificationConfig fromJson(Map<String, dynamic> json) =>
      NotificationConfig();
}

/// One or more aggregators for viewing counts of OpsItems using different
/// dimensions such as `Source`, `CreatedTime`, or `Source and CreatedTime`, to
/// name a few.
class OpsAggregator {
  /// Either a Range or Count aggregator for limiting an OpsItem summary.
  final String aggregatorType;

  /// The data type name to use for viewing counts of OpsItems.
  final String typeName;

  /// The name of an OpsItem attribute on which to limit the count of OpsItems.
  final String attributeName;

  /// The aggregator value.
  final Map<String, String> values;

  /// The aggregator filters.
  final List<OpsFilter> filters;

  /// A nested aggregator for viewing counts of OpsItems.
  final List<OpsAggregator> aggregators;

  OpsAggregator({
    this.aggregatorType,
    this.typeName,
    this.attributeName,
    this.values,
    this.filters,
    this.aggregators,
  });
}

/// The result of the query.
class OpsEntity {
  /// The query ID.
  final String id;

  /// The data returned by the query.
  final Map<String, OpsEntityItem> data;

  OpsEntity({
    this.id,
    this.data,
  });
  static OpsEntity fromJson(Map<String, dynamic> json) => OpsEntity();
}

/// The OpsItem summaries result item.
class OpsEntityItem {
  /// The detailed data content for an OpsItem summaries result item.
  final List<Map<String, String>> content;

  OpsEntityItem({
    this.content,
  });
  static OpsEntityItem fromJson(Map<String, dynamic> json) => OpsEntityItem();
}

/// A filter for viewing OpsItem summaries.
class OpsFilter {
  /// The name of the filter.
  final String key;

  /// The filter value.
  final List<String> values;

  /// The type of filter.
  final String type;

  OpsFilter({
    @required this.key,
    @required this.values,
    this.type,
  });
}

/// Operations engineers and IT professionals use OpsCenter to view,
/// investigate, and remediate operational issues impacting the performance and
/// health of their AWS resources. For more information, see
/// [AWS Systems Manager OpsCenter](http://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html)
/// in the _AWS Systems Manager User Guide_.
class OpsItem {
  /// The ARN of the AWS account that created the OpsItem.
  final String createdBy;

  /// The date and time the OpsItem was created.
  final DateTime createdTime;

  /// The OpsItem description.
  final String description;

  /// The ARN of the AWS account that last updated the OpsItem.
  final String lastModifiedBy;

  /// The date and time the OpsItem was last updated.
  final DateTime lastModifiedTime;

  /// The Amazon Resource Name (ARN) of an SNS topic where notifications are
  /// sent when this OpsItem is edited or changed.
  final List<OpsItemNotification> notifications;

  /// The importance of this OpsItem in relation to other OpsItems in the
  /// system.
  final int priority;

  /// One or more OpsItems that share something in common with the current
  /// OpsItem. For example, related OpsItems can include OpsItems with similar
  /// error messages, impacted resources, or statuses for the impacted resource.
  final List<RelatedOpsItem> relatedOpsItems;

  /// The OpsItem status. Status can be `Open`, `In Progress`, or `Resolved`.
  /// For more information, see
  /// [Editing OpsItem Details](http://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-working-with-OpsItems-editing-details.html)
  /// in the _AWS Systems Manager User Guide_.
  final String status;

  /// The ID of the OpsItem.
  final String opsItemId;

  /// The version of this OpsItem. Each time the OpsItem is edited the version
  /// number increments by one.
  final String version;

  /// A short heading that describes the nature of the OpsItem and the impacted
  /// resource.
  final String title;

  /// The origin of the OpsItem, such as Amazon EC2 or AWS Systems Manager. The
  /// impacted resource is a subset of source.
  final String source;

  /// Operational data is custom data that provides useful reference details
  /// about the OpsItem. For example, you can specify log files, error strings,
  /// license keys, troubleshooting tips, or other relevant data. You enter
  /// operational data as key-value pairs. The key has a maximum length of 128
  /// characters. The value has a maximum size of 20 KB.
  ///
  ///  Operational data keys _can't_ begin with the following: amazon, aws,
  /// amzn, ssm, /amazon, /aws, /amzn, /ssm.
  ///
  /// You can choose to make the data searchable by other users in the account
  /// or you can restrict search access. Searchable data means that all users
  /// with access to the OpsItem Overview page (as provided by the
  /// DescribeOpsItems API action) can view and search on the specified data.
  /// Operational data that is not searchable is only viewable by users who have
  /// access to the OpsItem (as provided by the GetOpsItem API action).
  ///
  /// Use the `/aws/resources` key in OperationalData to specify a related
  /// resource in the request. Use the `/aws/automations` key in OperationalData
  /// to associate an Automation runbook with the OpsItem. To view AWS CLI
  /// example commands that use these keys, see
  /// [Creating OpsItems Manually](http://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-creating-OpsItems.html#OpsCenter-manually-create-OpsItems)
  /// in the _AWS Systems Manager User Guide_.
  final Map<String, OpsItemDataValue> operationalData;

  OpsItem({
    this.createdBy,
    this.createdTime,
    this.description,
    this.lastModifiedBy,
    this.lastModifiedTime,
    this.notifications,
    this.priority,
    this.relatedOpsItems,
    this.status,
    this.opsItemId,
    this.version,
    this.title,
    this.source,
    this.operationalData,
  });
  static OpsItem fromJson(Map<String, dynamic> json) => OpsItem();
}

/// An object that defines the value of the key and its type in the
/// OperationalData map.
class OpsItemDataValue {
  /// The value of the OperationalData key.
  final String value;

  /// The type of key-value pair. Valid types include `SearchableString` and
  /// `String`.
  final String type;

  OpsItemDataValue({
    this.value,
    this.type,
  });
  static OpsItemDataValue fromJson(Map<String, dynamic> json) =>
      OpsItemDataValue();
}

/// Describes an OpsItem filter.
class OpsItemFilter {
  /// The name of the filter.
  final String key;

  /// The filter value.
  final List<String> values;

  /// The operator used by the filter call.
  final String operator;

  OpsItemFilter({
    @required this.key,
    @required this.values,
    @required this.operator,
  });
}

/// A notification about the OpsItem.
class OpsItemNotification {
  /// The Amazon Resource Name (ARN) of an SNS topic where notifications are
  /// sent when this OpsItem is edited or changed.
  final String arn;

  OpsItemNotification({
    this.arn,
  });
  static OpsItemNotification fromJson(Map<String, dynamic> json) =>
      OpsItemNotification();
}

/// A count of OpsItems.
class OpsItemSummary {
  /// The Amazon Resource Name (ARN) of the IAM entity that created the OpsItem.
  final String createdBy;

  /// The date and time the OpsItem was created.
  final DateTime createdTime;

  /// The Amazon Resource Name (ARN) of the IAM entity that created the OpsItem.
  final String lastModifiedBy;

  /// The date and time the OpsItem was last updated.
  final DateTime lastModifiedTime;

  /// The importance of this OpsItem in relation to other OpsItems in the
  /// system.
  final int priority;

  /// The impacted AWS resource.
  final String source;

  /// The OpsItem status. Status can be `Open`, `In Progress`, or `Resolved`.
  final String status;

  /// The ID of the OpsItem.
  final String opsItemId;

  /// A short heading that describes the nature of the OpsItem and the impacted
  /// resource.
  final String title;

  /// Operational data is custom data that provides useful reference details
  /// about the OpsItem.
  final Map<String, OpsItemDataValue> operationalData;

  OpsItemSummary({
    this.createdBy,
    this.createdTime,
    this.lastModifiedBy,
    this.lastModifiedTime,
    this.priority,
    this.source,
    this.status,
    this.opsItemId,
    this.title,
    this.operationalData,
  });
  static OpsItemSummary fromJson(Map<String, dynamic> json) => OpsItemSummary();
}

/// Information about the source where the association execution details are
/// stored.
class OutputSource {
  /// The ID of the output source, for example the URL of an Amazon S3 bucket.
  final String outputSourceId;

  /// The type of source where the association execution details are stored, for
  /// example, Amazon S3.
  final String outputSourceType;

  OutputSource({
    this.outputSourceId,
    this.outputSourceType,
  });
  static OutputSource fromJson(Map<String, dynamic> json) => OutputSource();
}

/// An Amazon EC2 Systems Manager parameter in Parameter Store.
class Parameter {
  /// The name of the parameter.
  final String name;

  /// The type of parameter. Valid values include the following: String, String
  /// list, Secure string.
  final String type;

  /// The parameter value.
  final String value;

  /// The parameter version.
  final BigInt version;

  /// Either the version number or the label used to retrieve the parameter
  /// value. Specify selectors by using one of the following formats:
  ///
  /// parameter_name:version
  ///
  /// parameter_name:label
  final String selector;

  /// Applies to parameters that reference information in other AWS services.
  /// SourceResult is the raw result or response from the source.
  final String sourceResult;

  /// Date the parameter was last changed or updated and the parameter version
  /// was created.
  final DateTime lastModifiedDate;

  /// The Amazon Resource Name (ARN) of the parameter.
  final String arn;

  Parameter({
    this.name,
    this.type,
    this.value,
    this.version,
    this.selector,
    this.sourceResult,
    this.lastModifiedDate,
    this.arn,
  });
  static Parameter fromJson(Map<String, dynamic> json) => Parameter();
}

/// Information about parameter usage.
class ParameterHistory {
  /// The name of the parameter.
  final String name;

  /// The type of parameter used.
  final String type;

  /// The ID of the query key used for this parameter.
  final String keyId;

  /// Date the parameter was last changed or updated.
  final DateTime lastModifiedDate;

  /// Amazon Resource Name (ARN) of the AWS user who last changed the parameter.
  final String lastModifiedUser;

  /// Information about the parameter.
  final String description;

  /// The parameter value.
  final String value;

  /// Parameter names can include the following letters and symbols.
  ///
  /// a-zA-Z0-9_.-
  final String allowedPattern;

  /// The parameter version.
  final BigInt version;

  /// Labels assigned to the parameter version.
  final List<String> labels;

  /// The parameter tier.
  final String tier;

  /// Information about the policies assigned to a parameter.
  ///
  ///
  /// [Working with Parameter Policies](https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-policies.html)
  /// in the _AWS Systems Manager User Guide_.
  final List<ParameterInlinePolicy> policies;

  ParameterHistory({
    this.name,
    this.type,
    this.keyId,
    this.lastModifiedDate,
    this.lastModifiedUser,
    this.description,
    this.value,
    this.allowedPattern,
    this.version,
    this.labels,
    this.tier,
    this.policies,
  });
  static ParameterHistory fromJson(Map<String, dynamic> json) =>
      ParameterHistory();
}

/// One or more policies assigned to a parameter.
class ParameterInlinePolicy {
  /// The JSON text of the policy.
  final String policyText;

  /// The type of policy. Parameter Store supports the following policy types:
  /// Expiration, ExpirationNotification, and NoChangeNotification.
  final String policyType;

  /// The status of the policy. Policies report the following statuses: Pending
  /// (the policy has not been enforced or applied yet), Finished (the policy
  /// was applied), Failed (the policy was not applied), or InProgress (the
  /// policy is being applied now).
  final String policyStatus;

  ParameterInlinePolicy({
    this.policyText,
    this.policyType,
    this.policyStatus,
  });
  static ParameterInlinePolicy fromJson(Map<String, dynamic> json) =>
      ParameterInlinePolicy();
}

/// Metadata includes information like the ARN of the last user and the
/// date/time the parameter was last used.
class ParameterMetadata {
  /// The parameter name.
  final String name;

  /// The type of parameter. Valid parameter types include the following:
  /// String, String list, Secure string.
  final String type;

  /// The ID of the query key used for this parameter.
  final String keyId;

  /// Date the parameter was last changed or updated.
  final DateTime lastModifiedDate;

  /// Amazon Resource Name (ARN) of the AWS user who last changed the parameter.
  final String lastModifiedUser;

  /// Description of the parameter actions.
  final String description;

  /// A parameter name can include only the following letters and symbols.
  ///
  /// a-zA-Z0-9_.-
  final String allowedPattern;

  /// The parameter version.
  final BigInt version;

  /// The parameter tier.
  final String tier;

  /// A list of policies associated with a parameter.
  final List<ParameterInlinePolicy> policies;

  ParameterMetadata({
    this.name,
    this.type,
    this.keyId,
    this.lastModifiedDate,
    this.lastModifiedUser,
    this.description,
    this.allowedPattern,
    this.version,
    this.tier,
    this.policies,
  });
  static ParameterMetadata fromJson(Map<String, dynamic> json) =>
      ParameterMetadata();
}

/// One or more filters. Use a filter to return a more specific list of results.
///
///
///
/// The `Name` and `Tier` filter keys can't be used with the GetParametersByPath
/// API action. Also, the `Label` filter key can't be used with the
/// DescribeParameters API action.
class ParameterStringFilter {
  /// The name of the filter.
  final String key;

  /// Valid options are Equals and BeginsWith. For Path filter, valid options
  /// are Recursive and OneLevel.
  final String option;

  /// The value you want to search for.
  final List<String> values;

  ParameterStringFilter({
    @required this.key,
    this.option,
    this.values,
  });
}

/// This data type is deprecated. Instead, use ParameterStringFilter.
class ParametersFilter {
  /// The name of the filter.
  final String key;

  /// The filter values.
  final List<String> values;

  ParametersFilter({
    @required this.key,
    @required this.values,
  });
}

/// Represents metadata about a patch.
class Patch {
  /// The ID of the patch (this is different than the Microsoft Knowledge Base
  /// ID).
  final String id;

  /// The date the patch was released.
  final DateTime releaseDate;

  /// The title of the patch.
  final String title;

  /// The description of the patch.
  final String description;

  /// The URL where more information can be obtained about the patch.
  final String contentUrl;

  /// The name of the vendor providing the patch.
  final String vendor;

  /// The product family the patch is applicable for (for example, Windows).
  final String productFamily;

  /// The specific product the patch is applicable for (for example,
  /// WindowsServer2016).
  final String product;

  /// The classification of the patch (for example, SecurityUpdates, Updates,
  /// CriticalUpdates).
  final String classification;

  /// The severity of the patch (for example Critical, Important, Moderate).
  final String msrcSeverity;

  /// The Microsoft Knowledge Base ID of the patch.
  final String kbNumber;

  /// The ID of the MSRC bulletin the patch is related to.
  final String msrcNumber;

  /// The language of the patch if it's language-specific.
  final String language;

  Patch({
    this.id,
    this.releaseDate,
    this.title,
    this.description,
    this.contentUrl,
    this.vendor,
    this.productFamily,
    this.product,
    this.classification,
    this.msrcSeverity,
    this.kbNumber,
    this.msrcNumber,
    this.language,
  });
  static Patch fromJson(Map<String, dynamic> json) => Patch();
}

/// Defines the basic information about a patch baseline.
class PatchBaselineIdentity {
  /// The ID of the patch baseline.
  final String baselineId;

  /// The name of the patch baseline.
  final String baselineName;

  /// Defines the operating system the patch baseline applies to. The Default
  /// value is WINDOWS.
  final String operatingSystem;

  /// The description of the patch baseline.
  final String baselineDescription;

  /// Whether this is the default baseline. Note that Systems Manager supports
  /// creating multiple default patch baselines. For example, you can create a
  /// default patch baseline for each operating system.
  final bool defaultBaseline;

  PatchBaselineIdentity({
    this.baselineId,
    this.baselineName,
    this.operatingSystem,
    this.baselineDescription,
    this.defaultBaseline,
  });
  static PatchBaselineIdentity fromJson(Map<String, dynamic> json) =>
      PatchBaselineIdentity();
}

/// Information about the state of a patch on a particular instance as it
/// relates to the patch baseline used to patch the instance.
class PatchComplianceData {
  /// The title of the patch.
  final String title;

  /// The operating system-specific ID of the patch.
  final String kbId;

  /// The classification of the patch (for example, SecurityUpdates, Updates,
  /// CriticalUpdates).
  final String classification;

  /// The severity of the patch (for example, Critical, Important, Moderate).
  final String severity;

  /// The state of the patch on the instance, such as INSTALLED or FAILED.
  ///
  /// For descriptions of each patch state, see
  /// [About Patch Compliance](http://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-compliance-about.html#sysman-compliance-monitor-patch)
  /// in the _AWS Systems Manager User Guide_.
  final String state;

  /// The date/time the patch was installed on the instance. Note that not all
  /// operating systems provide this level of information.
  final DateTime installedTime;

  PatchComplianceData({
    @required this.title,
    @required this.kbId,
    @required this.classification,
    @required this.severity,
    @required this.state,
    @required this.installedTime,
  });
  static PatchComplianceData fromJson(Map<String, dynamic> json) =>
      PatchComplianceData();
}

///  Defines which patches should be included in a patch baseline.
///
/// A patch filter consists of a key and a set of values. The filter key is a
/// patch property. For example, the available filter keys for WINDOWS are
/// PATCH_SET, PRODUCT, PRODUCT_FAMILY, CLASSIFICATION, and MSRC_SEVERITY. The
/// filter values define a matching criterion for the patch property indicated
/// by the key. For example, if the filter key is PRODUCT and the filter values
/// are ["Office 2013", "Office 2016"], then the filter accepts all patches
/// where product name is either "Office 2013" or "Office 2016". The filter
/// values can be exact values for the patch property given as a key, or a
/// wildcard (*), which matches all values.
///
/// You can view lists of valid values for the patch properties by running the
/// `DescribePatchProperties` command. For information about which patch
/// properties can be used with each major operating system, see
/// DescribePatchProperties.
class PatchFilter {
  /// The key for the filter.
  ///
  /// Run the DescribePatchProperties command to view lists of valid keys for
  /// each operating system type.
  final String key;

  /// The value for the filter key.
  ///
  /// Run the DescribePatchProperties command to view lists of valid values for
  /// each key based on operating system type.
  final List<String> values;

  PatchFilter({
    @required this.key,
    @required this.values,
  });
  static PatchFilter fromJson(Map<String, dynamic> json) => PatchFilter();
}

/// A set of patch filters, typically used for approval rules.
class PatchFilterGroup {
  /// The set of patch filters that make up the group.
  final List<PatchFilter> patchFilters;

  PatchFilterGroup({
    @required this.patchFilters,
  });
  static PatchFilterGroup fromJson(Map<String, dynamic> json) =>
      PatchFilterGroup();
}

/// The mapping between a patch group and the patch baseline the patch group is
/// registered with.
class PatchGroupPatchBaselineMapping {
  /// The name of the patch group registered with the patch baseline.
  final String patchGroup;

  /// The patch baseline the patch group is registered with.
  final PatchBaselineIdentity baselineIdentity;

  PatchGroupPatchBaselineMapping({
    this.patchGroup,
    this.baselineIdentity,
  });
  static PatchGroupPatchBaselineMapping fromJson(Map<String, dynamic> json) =>
      PatchGroupPatchBaselineMapping();
}

/// Defines a filter used in Patch Manager APIs.
class PatchOrchestratorFilter {
  /// The key for the filter.
  final String key;

  /// The value for the filter.
  final List<String> values;

  PatchOrchestratorFilter({
    this.key,
    this.values,
  });
}

/// Defines an approval rule for a patch baseline.
class PatchRule {
  /// The patch filter group that defines the criteria for the rule.
  final PatchFilterGroup patchFilterGroup;

  /// A compliance severity level for all approved patches in a patch baseline.
  /// Valid compliance severity levels include the following: Unspecified,
  /// Critical, High, Medium, Low, and Informational.
  final String complianceLevel;

  /// The number of days after the release date of each patch matched by the
  /// rule that the patch is marked as approved in the patch baseline. For
  /// example, a value of `7` means that patches are approved seven days after
  /// they are released.
  final int approveAfterDays;

  /// For instances identified by the approval rule filters, enables a patch
  /// baseline to apply non-security updates available in the specified
  /// repository. The default value is 'false'. Applies to Linux instances only.
  final bool enableNonSecurity;

  PatchRule({
    @required this.patchFilterGroup,
    this.complianceLevel,
    @required this.approveAfterDays,
    this.enableNonSecurity,
  });
  static PatchRule fromJson(Map<String, dynamic> json) => PatchRule();
}

/// A set of rules defining the approval rules for a patch baseline.
class PatchRuleGroup {
  /// The rules that make up the rule group.
  final List<PatchRule> patchRules;

  PatchRuleGroup({
    @required this.patchRules,
  });
  static PatchRuleGroup fromJson(Map<String, dynamic> json) => PatchRuleGroup();
}

/// Information about the patches to use to update the instances, including
/// target operating systems and source repository. Applies to Linux instances
/// only.
class PatchSource {
  /// The name specified to identify the patch source.
  final String name;

  /// The specific operating system versions a patch repository applies to, such
  /// as "Ubuntu16.04", "AmazonLinux2016.09", "RedhatEnterpriseLinux7.2" or
  /// "Suse12.7". For lists of supported product values, see PatchFilter.
  final List<String> products;

  /// The value of the yum repo configuration. For example:
  ///
  ///  `[main]`
  ///
  ///  `cachedir=/var/cache/yum/$basesearch$releasever`
  ///
  ///  `keepcache=0`
  ///
  ///  `debuglevel=2`
  final String configuration;

  PatchSource({
    @required this.name,
    @required this.products,
    @required this.configuration,
  });
  static PatchSource fromJson(Map<String, dynamic> json) => PatchSource();
}

/// Information about the approval status of a patch.
class PatchStatus {
  /// The approval status of a patch (APPROVED, PENDING_APPROVAL,
  /// EXPLICIT_APPROVED, EXPLICIT_REJECTED).
  final String deploymentStatus;

  /// The compliance severity level for a patch.
  final String complianceLevel;

  /// The date the patch was approved (or will be approved if the status is
  /// PENDING_APPROVAL).
  final DateTime approvalDate;

  PatchStatus({
    this.deploymentStatus,
    this.complianceLevel,
    this.approvalDate,
  });
  static PatchStatus fromJson(Map<String, dynamic> json) => PatchStatus();
}

/// An aggregate of step execution statuses displayed in the AWS Console for a
/// multi-Region and multi-account Automation execution.
class ProgressCounters {
  /// The total number of steps run in all specified AWS Regions and accounts
  /// for the current Automation execution.
  final int totalSteps;

  /// The total number of steps that successfully completed in all specified AWS
  /// Regions and accounts for the current Automation execution.
  final int successSteps;

  /// The total number of steps that failed to run in all specified AWS Regions
  /// and accounts for the current Automation execution.
  final int failedSteps;

  /// The total number of steps that the system cancelled in all specified AWS
  /// Regions and accounts for the current Automation execution.
  final int cancelledSteps;

  /// The total number of steps that timed out in all specified AWS Regions and
  /// accounts for the current Automation execution.
  final int timedOutSteps;

  ProgressCounters({
    this.totalSteps,
    this.successSteps,
    this.failedSteps,
    this.cancelledSteps,
    this.timedOutSteps,
  });
  static ProgressCounters fromJson(Map<String, dynamic> json) =>
      ProgressCounters();
}

class PutComplianceItemsResult {
  PutComplianceItemsResult();
  static PutComplianceItemsResult fromJson(Map<String, dynamic> json) =>
      PutComplianceItemsResult();
}

class PutInventoryResult {
  /// Information about the request.
  final String message;

  PutInventoryResult({
    this.message,
  });
  static PutInventoryResult fromJson(Map<String, dynamic> json) =>
      PutInventoryResult();
}

class PutParameterResult {
  /// The new version number of a parameter. If you edit a parameter value,
  /// Parameter Store automatically creates a new version and assigns this new
  /// version a unique ID. You can reference a parameter version ID in API
  /// actions or in Systems Manager documents (SSM documents). By default, if
  /// you don't specify a specific version, the system returns the latest
  /// parameter value when a parameter is called.
  final BigInt version;

  PutParameterResult({
    this.version,
  });
  static PutParameterResult fromJson(Map<String, dynamic> json) =>
      PutParameterResult();
}

class RegisterDefaultPatchBaselineResult {
  /// The ID of the default patch baseline.
  final String baselineId;

  RegisterDefaultPatchBaselineResult({
    this.baselineId,
  });
  static RegisterDefaultPatchBaselineResult fromJson(
          Map<String, dynamic> json) =>
      RegisterDefaultPatchBaselineResult();
}

class RegisterPatchBaselineForPatchGroupResult {
  /// The ID of the patch baseline the patch group was registered with.
  final String baselineId;

  /// The name of the patch group registered with the patch baseline.
  final String patchGroup;

  RegisterPatchBaselineForPatchGroupResult({
    this.baselineId,
    this.patchGroup,
  });
  static RegisterPatchBaselineForPatchGroupResult fromJson(
          Map<String, dynamic> json) =>
      RegisterPatchBaselineForPatchGroupResult();
}

class RegisterTargetWithMaintenanceWindowResult {
  /// The ID of the target definition in this maintenance window.
  final String windowTargetId;

  RegisterTargetWithMaintenanceWindowResult({
    this.windowTargetId,
  });
  static RegisterTargetWithMaintenanceWindowResult fromJson(
          Map<String, dynamic> json) =>
      RegisterTargetWithMaintenanceWindowResult();
}

class RegisterTaskWithMaintenanceWindowResult {
  /// The ID of the task in the maintenance window.
  final String windowTaskId;

  RegisterTaskWithMaintenanceWindowResult({
    this.windowTaskId,
  });
  static RegisterTaskWithMaintenanceWindowResult fromJson(
          Map<String, dynamic> json) =>
      RegisterTaskWithMaintenanceWindowResult();
}

/// An OpsItems that shares something in common with the current OpsItem. For
/// example, related OpsItems can include OpsItems with similar error messages,
/// impacted resources, or statuses for the impacted resource.
class RelatedOpsItem {
  /// The ID of an OpsItem related to the current OpsItem.
  final String opsItemId;

  RelatedOpsItem({
    @required this.opsItemId,
  });
  static RelatedOpsItem fromJson(Map<String, dynamic> json) => RelatedOpsItem();
}

class RemoveTagsFromResourceResult {
  RemoveTagsFromResourceResult();
  static RemoveTagsFromResourceResult fromJson(Map<String, dynamic> json) =>
      RemoveTagsFromResourceResult();
}

/// The result body of the ResetServiceSetting API action.
class ResetServiceSettingResult {
  /// The current, effective service setting after calling the
  /// ResetServiceSetting API action.
  final ServiceSetting serviceSetting;

  ResetServiceSettingResult({
    this.serviceSetting,
  });
  static ResetServiceSettingResult fromJson(Map<String, dynamic> json) =>
      ResetServiceSettingResult();
}

/// Information about targets that resolved during the Automation execution.
class ResolvedTargets {
  /// A list of parameter values sent to targets that resolved during the
  /// Automation execution.
  final List<String> parameterValues;

  /// A boolean value indicating whether the resolved target list is truncated.
  final bool truncated;

  ResolvedTargets({
    this.parameterValues,
    this.truncated,
  });
  static ResolvedTargets fromJson(Map<String, dynamic> json) =>
      ResolvedTargets();
}

/// Compliance summary information for a specific resource.
class ResourceComplianceSummaryItem {
  /// The compliance type.
  final String complianceType;

  /// The resource type.
  final String resourceType;

  /// The resource ID.
  final String resourceId;

  /// The compliance status for the resource.
  final String status;

  /// The highest severity item found for the resource. The resource is
  /// compliant for this item.
  final String overallSeverity;

  /// Information about the execution.
  final ComplianceExecutionSummary executionSummary;

  /// A list of items that are compliant for the resource.
  final CompliantSummary compliantSummary;

  /// A list of items that aren't compliant for the resource.
  final NonCompliantSummary nonCompliantSummary;

  ResourceComplianceSummaryItem({
    this.complianceType,
    this.resourceType,
    this.resourceId,
    this.status,
    this.overallSeverity,
    this.executionSummary,
    this.compliantSummary,
    this.nonCompliantSummary,
  });
  static ResourceComplianceSummaryItem fromJson(Map<String, dynamic> json) =>
      ResourceComplianceSummaryItem();
}

/// Information about a Resource Data Sync configuration, including its current
/// status and last successful sync.
class ResourceDataSyncItem {
  /// The name of the Resource Data Sync.
  final String syncName;

  /// Configuration information for the target Amazon S3 bucket.
  final ResourceDataSyncS3Destination s3Destination;

  /// The last time the configuration attempted to sync (UTC).
  final DateTime lastSyncTime;

  /// The last time the sync operations returned a status of `SUCCESSFUL` (UTC).
  final DateTime lastSuccessfulSyncTime;

  /// The status reported by the last sync.
  final String lastStatus;

  /// The date and time the configuration was created (UTC).
  final DateTime syncCreatedTime;

  /// The status message details reported by the last sync.
  final String lastSyncStatusMessage;

  ResourceDataSyncItem({
    this.syncName,
    this.s3Destination,
    this.lastSyncTime,
    this.lastSuccessfulSyncTime,
    this.lastStatus,
    this.syncCreatedTime,
    this.lastSyncStatusMessage,
  });
  static ResourceDataSyncItem fromJson(Map<String, dynamic> json) =>
      ResourceDataSyncItem();
}

/// Information about the target Amazon S3 bucket for the Resource Data Sync.
class ResourceDataSyncS3Destination {
  /// The name of the Amazon S3 bucket where the aggregated data is stored.
  final String bucketName;

  /// An Amazon S3 prefix for the bucket.
  final String prefix;

  /// A supported sync format. The following format is currently supported:
  /// JsonSerDe
  final String syncFormat;

  /// The AWS Region with the Amazon S3 bucket targeted by the Resource Data
  /// Sync.
  final String region;

  /// The ARN of an encryption key for a destination in Amazon S3. Must belong
  /// to the same Region as the destination Amazon S3 bucket.
  final String awskmsKeyArn;

  ResourceDataSyncS3Destination({
    @required this.bucketName,
    this.prefix,
    @required this.syncFormat,
    @required this.region,
    this.awskmsKeyArn,
  });
  static ResourceDataSyncS3Destination fromJson(Map<String, dynamic> json) =>
      ResourceDataSyncS3Destination();
}

/// The inventory item result attribute.
class ResultAttribute {
  /// Name of the inventory item type. Valid value: AWS:InstanceInformation.
  /// Default Value: AWS:InstanceInformation.
  final String typeName;

  ResultAttribute({
    @required this.typeName,
  });
}

class ResumeSessionResponse {
  /// The ID of the session.
  final String sessionId;

  /// An encrypted token value containing session and caller information. Used
  /// to authenticate the connection to the instance.
  final String tokenValue;

  /// A URL back to SSM Agent on the instance that the Session Manager client
  /// uses to send commands and receive output from the instance. Format:
  /// `wss://ssmmessages.**region**.amazonaws.com/v1/data-channel/**session-id**?stream=(input|output)`.
  ///
  ///  **region** represents the Region identifier for an AWS Region supported
  /// by AWS Systems Manager, such as `us-east-2` for the US East (Ohio) Region.
  /// For a list of supported **region** values, see the **Region** column in
  /// the
  /// [AWS Systems Manager table of regions and endpoints](http://docs.aws.amazon.com/general/latest/gr/rande.html#ssm_region)
  /// in the _AWS General Reference_.
  ///
  ///  **session-id** represents the ID of a Session Manager session, such as
  /// `1a2b3c4dEXAMPLE`.
  final String streamUrl;

  ResumeSessionResponse({
    this.sessionId,
    this.tokenValue,
    this.streamUrl,
  });
  static ResumeSessionResponse fromJson(Map<String, dynamic> json) =>
      ResumeSessionResponse();
}

/// An Amazon S3 bucket where you want to store the results of this request.
class S3OutputLocation {
  /// (Deprecated) You can no longer specify this parameter. The system ignores
  /// it. Instead, Systems Manager automatically determines the Amazon S3 bucket
  /// region.
  final String outputS3Region;

  /// The name of the Amazon S3 bucket.
  final String outputS3BucketName;

  /// The Amazon S3 bucket subfolder.
  final String outputS3KeyPrefix;

  S3OutputLocation({
    this.outputS3Region,
    this.outputS3BucketName,
    this.outputS3KeyPrefix,
  });
  static S3OutputLocation fromJson(Map<String, dynamic> json) =>
      S3OutputLocation();
}

/// A URL for the Amazon S3 bucket where you want to store the results of this
/// request.
class S3OutputUrl {
  /// A URL for an Amazon S3 bucket where you want to store the results of this
  /// request.
  final String outputUrl;

  S3OutputUrl({
    this.outputUrl,
  });
  static S3OutputUrl fromJson(Map<String, dynamic> json) => S3OutputUrl();
}

/// Information about a scheduled execution for a maintenance window.
class ScheduledWindowExecution {
  /// The ID of the maintenance window to be run.
  final String windowId;

  /// The name of the maintenance window to be run.
  final String name;

  /// The time, in ISO-8601 Extended format, that the maintenance window is
  /// scheduled to be run.
  final String executionTime;

  ScheduledWindowExecution({
    this.windowId,
    this.name,
    this.executionTime,
  });
  static ScheduledWindowExecution fromJson(Map<String, dynamic> json) =>
      ScheduledWindowExecution();
}

class SendAutomationSignalResult {
  SendAutomationSignalResult();
  static SendAutomationSignalResult fromJson(Map<String, dynamic> json) =>
      SendAutomationSignalResult();
}

class SendCommandResult {
  /// The request as it was received by Systems Manager. Also provides the
  /// command ID which can be used future references to this request.
  final Command command;

  SendCommandResult({
    this.command,
  });
  static SendCommandResult fromJson(Map<String, dynamic> json) =>
      SendCommandResult();
}

/// The service setting data structure.
///
///  `ServiceSetting` is an account-level setting for an AWS service. This
/// setting defines how a user interacts with or uses a service or a feature of
/// a service. For example, if an AWS service charges money to the account based
/// on feature or service usage, then the AWS service team might create a
/// default setting of "false". This means the user can't use this feature
/// unless they change the setting to "true" and intentionally opt in for a paid
/// feature.
///
/// Services map a `SettingId` object to a setting value. AWS services teams
/// define the default value for a `SettingId`. You can't create a new
/// `SettingId`, but you can overwrite the default value if you have the
/// `ssm:UpdateServiceSetting` permission for the setting. Use the
/// UpdateServiceSetting API action to change the default setting. Or, use the
/// ResetServiceSetting to change the value back to the original value defined
/// by the AWS service team.
class ServiceSetting {
  /// The ID of the service setting.
  final String settingId;

  /// The value of the service setting.
  final String settingValue;

  /// The last time the service setting was modified.
  final DateTime lastModifiedDate;

  /// The ARN of the last modified user. This field is populated only if the
  /// setting value was overwritten.
  final String lastModifiedUser;

  /// The ARN of the service setting.
  final String arn;

  /// The status of the service setting. The value can be Default, Customized or
  /// PendingUpdate.
  ///
  /// *   Default: The current setting uses a default value provisioned by the
  /// AWS service team.
  ///
  /// *   Customized: The current setting use a custom value specified by the
  /// customer.
  ///
  /// *   PendingUpdate: The current setting uses a default or custom value, but
  /// a setting change request is pending approval.
  final String status;

  ServiceSetting({
    this.settingId,
    this.settingValue,
    this.lastModifiedDate,
    this.lastModifiedUser,
    this.arn,
    this.status,
  });
  static ServiceSetting fromJson(Map<String, dynamic> json) => ServiceSetting();
}

/// Information about a Session Manager connection to an instance.
class Session {
  /// The ID of the session.
  final String sessionId;

  /// The instance that the Session Manager session connected to.
  final String target;

  /// The status of the session. For example, "Connected" or "Terminated".
  final String status;

  /// The date and time, in ISO-8601 Extended format, when the session began.
  final DateTime startDate;

  /// The date and time, in ISO-8601 Extended format, when the session was
  /// terminated.
  final DateTime endDate;

  /// The name of the Session Manager SSM document used to define the parameters
  /// and plugin settings for the session. For example,
  /// `SSM-SessionManagerRunShell`.
  final String documentName;

  /// The ID of the AWS user account that started the session.
  final String owner;

  /// Reserved for future use.
  final String details;

  /// Reserved for future use.
  final SessionManagerOutputUrl outputUrl;

  Session({
    this.sessionId,
    this.target,
    this.status,
    this.startDate,
    this.endDate,
    this.documentName,
    this.owner,
    this.details,
    this.outputUrl,
  });
  static Session fromJson(Map<String, dynamic> json) => Session();
}

/// Describes a filter for Session Manager information.
class SessionFilter {
  /// The name of the filter.
  final String key;

  /// The filter value. Valid values for each filter key are as follows:
  ///
  /// *   InvokedAfter: Specify a timestamp to limit your results. For example,
  /// specify 2018-08-29T00:00:00Z to see sessions that started August 29, 2018,
  /// and later.
  ///
  /// *   InvokedBefore: Specify a timestamp to limit your results. For example,
  /// specify 2018-08-29T00:00:00Z to see sessions that started before August
  /// 29, 2018.
  ///
  /// *   Target: Specify an instance to which session connections have been
  /// made.
  ///
  /// *   Owner: Specify an AWS user account to see a list of sessions started
  /// by that user.
  ///
  /// *   Status: Specify a valid session status to see a list of all sessions
  /// with that status. Status values you can specify include:
  ///
  ///     *   Connected
  ///
  ///     *   Connecting
  ///
  ///     *   Disconnected
  ///
  ///     *   Terminated
  ///
  ///     *   Terminating
  ///
  ///     *   Failed
  final String value;

  SessionFilter({
    @required this.key,
    @required this.value,
  });
}

/// Reserved for future use.
class SessionManagerOutputUrl {
  /// Reserved for future use.
  final String s3OutputUrl;

  /// Reserved for future use.
  final String cloudWatchOutputUrl;

  SessionManagerOutputUrl({
    this.s3OutputUrl,
    this.cloudWatchOutputUrl,
  });
  static SessionManagerOutputUrl fromJson(Map<String, dynamic> json) =>
      SessionManagerOutputUrl();
}

/// The number of managed instances found for each patch severity level defined
/// in the request filter.
class SeveritySummary {
  /// The total number of resources or compliance items that have a severity
  /// level of critical. Critical severity is determined by the organization
  /// that published the compliance items.
  final int criticalCount;

  /// The total number of resources or compliance items that have a severity
  /// level of high. High severity is determined by the organization that
  /// published the compliance items.
  final int highCount;

  /// The total number of resources or compliance items that have a severity
  /// level of medium. Medium severity is determined by the organization that
  /// published the compliance items.
  final int mediumCount;

  /// The total number of resources or compliance items that have a severity
  /// level of low. Low severity is determined by the organization that
  /// published the compliance items.
  final int lowCount;

  /// The total number of resources or compliance items that have a severity
  /// level of informational. Informational severity is determined by the
  /// organization that published the compliance items.
  final int informationalCount;

  /// The total number of resources or compliance items that have a severity
  /// level of unspecified. Unspecified severity is determined by the
  /// organization that published the compliance items.
  final int unspecifiedCount;

  SeveritySummary({
    this.criticalCount,
    this.highCount,
    this.mediumCount,
    this.lowCount,
    this.informationalCount,
    this.unspecifiedCount,
  });
  static SeveritySummary fromJson(Map<String, dynamic> json) =>
      SeveritySummary();
}

class StartAssociationsOnceResult {
  StartAssociationsOnceResult();
  static StartAssociationsOnceResult fromJson(Map<String, dynamic> json) =>
      StartAssociationsOnceResult();
}

class StartAutomationExecutionResult {
  /// The unique ID of a newly scheduled automation execution.
  final String automationExecutionId;

  StartAutomationExecutionResult({
    this.automationExecutionId,
  });
  static StartAutomationExecutionResult fromJson(Map<String, dynamic> json) =>
      StartAutomationExecutionResult();
}

class StartSessionResponse {
  /// The ID of the session.
  final String sessionId;

  /// An encrypted token value containing session and caller information. Used
  /// to authenticate the connection to the instance.
  final String tokenValue;

  /// A URL back to SSM Agent on the instance that the Session Manager client
  /// uses to send commands and receive output from the instance. Format:
  /// `wss://ssmmessages.**region**.amazonaws.com/v1/data-channel/**session-id**?stream=(input|output)`
  ///
  ///  **region** represents the Region identifier for an AWS Region supported
  /// by AWS Systems Manager, such as `us-east-2` for the US East (Ohio) Region.
  /// For a list of supported **region** values, see the **Region** column in
  /// the
  /// [AWS Systems Manager table of regions and endpoints](http://docs.aws.amazon.com/general/latest/gr/rande.html#ssm_region)
  /// in the _AWS General Reference_.
  ///
  ///  **session-id** represents the ID of a Session Manager session, such as
  /// `1a2b3c4dEXAMPLE`.
  final String streamUrl;

  StartSessionResponse({
    this.sessionId,
    this.tokenValue,
    this.streamUrl,
  });
  static StartSessionResponse fromJson(Map<String, dynamic> json) =>
      StartSessionResponse();
}

/// Detailed information about an the execution state of an Automation step.
class StepExecution {
  /// The name of this execution step.
  final String stepName;

  /// The action this step performs. The action determines the behavior of the
  /// step.
  final String action;

  /// The timeout seconds of the step.
  final BigInt timeoutSeconds;

  /// The action to take if the step fails. The default value is Abort.
  final String onFailure;

  /// The maximum number of tries to run the action of the step. The default
  /// value is 1.
  final int maxAttempts;

  /// If a step has begun execution, this contains the time the step started. If
  /// the step is in Pending status, this field is not populated.
  final DateTime executionStartTime;

  /// If a step has finished execution, this contains the time the execution
  /// ended. If the step has not yet concluded, this field is not populated.
  final DateTime executionEndTime;

  /// The execution status for this step. Valid values include: Pending,
  /// InProgress, Success, Cancelled, Failed, and TimedOut.
  final String stepStatus;

  /// The response code returned by the execution of the step.
  final String responseCode;

  /// Fully-resolved values passed into the step before execution.
  final Map<String, String> inputs;

  /// Returned values from the execution of the step.
  final Map<String, List<String>> outputs;

  /// A message associated with the response code for an execution.
  final String response;

  /// If a step failed, this message explains why the execution failed.
  final String failureMessage;

  /// Information about the Automation failure.
  final FailureDetails failureDetails;

  /// The unique ID of a step execution.
  final String stepExecutionId;

  /// A user-specified list of parameters to override when running a step.
  final Map<String, List<String>> overriddenParameters;

  /// The flag which can be used to end automation no matter whether the step
  /// succeeds or fails.
  final bool isEnd;

  /// The next step after the step succeeds.
  final String nextStep;

  /// The flag which can be used to help decide whether the failure of current
  /// step leads to the Automation failure.
  final bool isCritical;

  /// Strategies used when step fails, we support Continue and Abort. Abort will
  /// fail the automation when the step fails. Continue will ignore the failure
  /// of current step and allow automation to run the next step. With
  /// conditional branching, we add step:stepName to support the automation to
  /// go to another specific step.
  final List<String> validNextSteps;

  /// The targets for the step execution.
  final List<Target> targets;

  /// The combination of AWS Regions and accounts targeted by the current
  /// Automation execution.
  final TargetLocation targetLocation;

  StepExecution({
    this.stepName,
    this.action,
    this.timeoutSeconds,
    this.onFailure,
    this.maxAttempts,
    this.executionStartTime,
    this.executionEndTime,
    this.stepStatus,
    this.responseCode,
    this.inputs,
    this.outputs,
    this.response,
    this.failureMessage,
    this.failureDetails,
    this.stepExecutionId,
    this.overriddenParameters,
    this.isEnd,
    this.nextStep,
    this.isCritical,
    this.validNextSteps,
    this.targets,
    this.targetLocation,
  });
  static StepExecution fromJson(Map<String, dynamic> json) => StepExecution();
}

/// A filter to limit the amount of step execution information returned by the
/// call.
class StepExecutionFilter {
  /// One or more keys to limit the results. Valid filter keys include the
  /// following: StepName, Action, StepExecutionId, StepExecutionStatus,
  /// StartTimeBefore, StartTimeAfter.
  final String key;

  /// The values of the filter key.
  final List<String> values;

  StepExecutionFilter({
    @required this.key,
    @required this.values,
  });
}

class StopAutomationExecutionResult {
  StopAutomationExecutionResult();
  static StopAutomationExecutionResult fromJson(Map<String, dynamic> json) =>
      StopAutomationExecutionResult();
}

/// Metadata that you assign to your AWS resources. Tags enable you to
/// categorize your resources in different ways, for example, by purpose, owner,
/// or environment. In Systems Manager, you can apply tags to documents, managed
/// instances, maintenance windows, Parameter Store parameters, and patch
/// baselines.
class Tag {
  /// The name of the tag.
  final String key;

  /// The value of the tag.
  final String value;

  Tag({
    @required this.key,
    @required this.value,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag();
}

/// An array of search criteria that targets instances using a Key,Value
/// combination that you specify.
///
/// Supported formats include the following.
///
/// *
/// `Key=InstanceIds,Values=_instance-id-1_,_instance-id-2_,_instance-id-3_`
///
/// *    `Key=tag:_my-tag-key_,Values=_my-tag-value-1_,_my-tag-value-2_`
///
/// *    `Key=tag-key,Values=_my-tag-key-1_,_my-tag-key-2_`
///
/// *   (Maintenance window targets only)
/// `Key=resource-groups:Name,Values=_resource-group-name_`
///
/// *   (Maintenance window targets only)
/// `Key=resource-groups:ResourceTypeFilters,Values=_resource-type-1_,_resource-type-2_`
///
///
///
/// For example:
///
/// *
/// `Key=InstanceIds,Values=i-02573cafcfEXAMPLE,i-0471e04240EXAMPLE,i-07782c72faEXAMPLE`
///
/// *    `Key=tag:CostCenter,Values=CostCenter1,CostCenter2,CostCenter3`
///
/// *    `Key=tag-key,Values=Name,Instance-Type,CostCenter`
///
/// *   (Maintenance window targets only)
/// `Key=resource-groups:Name,Values=ProductionResourceGroup`
///
/// *   (Maintenance window targets only)
/// `Key=resource-groups:ResourceTypeFilters,Values=_AWS::EC2::INSTANCE_,_AWS::EC2::VPC_`
///
///
///
/// For information about how to send commands that target instances using
/// `Key,Value` parameters, see
/// [Using Targets and Rate Controls to Send Commands to a Fleet](https://docs.aws.amazon.com/systems-manager/latest/userguide/send-commands-multiple.html#send-commands-targeting)
/// in the _AWS Systems Manager User Guide_.
class Target {
  /// User-defined criteria for sending commands that target instances that meet
  /// the criteria.
  final String key;

  /// User-defined criteria that maps to `Key`. For example, if you specified
  /// `tag:ServerRole`, you could specify `value:WebServer` to run a command on
  /// instances that include Amazon EC2 tags of `ServerRole,WebServer`.
  final List<String> values;

  Target({
    this.key,
    this.values,
  });
  static Target fromJson(Map<String, dynamic> json) => Target();
}

/// The combination of AWS Regions and accounts targeted by the current
/// Automation execution.
class TargetLocation {
  /// The AWS accounts targeted by the current Automation execution.
  final List<String> accounts;

  /// The AWS Regions targeted by the current Automation execution.
  final List<String> regions;

  /// The maximum number of AWS accounts and AWS regions allowed to run the
  /// Automation concurrently
  final String targetLocationMaxConcurrency;

  /// The maximum number of errors allowed before the system stops queueing
  /// additional Automation executions for the currently running Automation.
  final String targetLocationMaxErrors;

  /// The Automation execution role used by the currently running Automation.
  final String executionRoleName;

  TargetLocation({
    this.accounts,
    this.regions,
    this.targetLocationMaxConcurrency,
    this.targetLocationMaxErrors,
    this.executionRoleName,
  });
  static TargetLocation fromJson(Map<String, dynamic> json) => TargetLocation();
}

class TerminateSessionResponse {
  /// The ID of the session that has been terminated.
  final String sessionId;

  TerminateSessionResponse({
    this.sessionId,
  });
  static TerminateSessionResponse fromJson(Map<String, dynamic> json) =>
      TerminateSessionResponse();
}

class UpdateAssociationResult {
  /// The description of the association that was updated.
  final AssociationDescription associationDescription;

  UpdateAssociationResult({
    this.associationDescription,
  });
  static UpdateAssociationResult fromJson(Map<String, dynamic> json) =>
      UpdateAssociationResult();
}

class UpdateAssociationStatusResult {
  /// Information about the association.
  final AssociationDescription associationDescription;

  UpdateAssociationStatusResult({
    this.associationDescription,
  });
  static UpdateAssociationStatusResult fromJson(Map<String, dynamic> json) =>
      UpdateAssociationStatusResult();
}

class UpdateDocumentDefaultVersionResult {
  /// The description of a custom document that you want to set as the default
  /// version.
  final DocumentDefaultVersionDescription description;

  UpdateDocumentDefaultVersionResult({
    this.description,
  });
  static UpdateDocumentDefaultVersionResult fromJson(
          Map<String, dynamic> json) =>
      UpdateDocumentDefaultVersionResult();
}

class UpdateDocumentResult {
  /// A description of the document that was updated.
  final DocumentDescription documentDescription;

  UpdateDocumentResult({
    this.documentDescription,
  });
  static UpdateDocumentResult fromJson(Map<String, dynamic> json) =>
      UpdateDocumentResult();
}

class UpdateMaintenanceWindowResult {
  /// The ID of the created maintenance window.
  final String windowId;

  /// The name of the maintenance window.
  final String name;

  /// An optional description of the update.
  final String description;

  /// The date and time, in ISO-8601 Extended format, for when the maintenance
  /// window is scheduled to become active. The maintenance window will not run
  /// before this specified time.
  final String startDate;

  /// The date and time, in ISO-8601 Extended format, for when the maintenance
  /// window is scheduled to become inactive. The maintenance window will not
  /// run after this specified time.
  final String endDate;

  /// The schedule of the maintenance window in the form of a cron or rate
  /// expression.
  final String schedule;

  /// The time zone that the scheduled maintenance window executions are based
  /// on, in Internet Assigned Numbers Authority (IANA) format. For example:
  /// "America/Los_Angeles", "etc/UTC", or "Asia/Seoul". For more information,
  /// see the [Time Zone Database](https://www.iana.org/time-zones) on the IANA
  /// website.
  final String scheduleTimezone;

  /// The duration of the maintenance window in hours.
  final int duration;

  /// The number of hours before the end of the maintenance window that Systems
  /// Manager stops scheduling new tasks for execution.
  final int cutoff;

  /// Whether targets must be registered with the maintenance window before
  /// tasks can be defined for those targets.
  final bool allowUnassociatedTargets;

  /// Whether the maintenance window is enabled.
  final bool enabled;

  UpdateMaintenanceWindowResult({
    this.windowId,
    this.name,
    this.description,
    this.startDate,
    this.endDate,
    this.schedule,
    this.scheduleTimezone,
    this.duration,
    this.cutoff,
    this.allowUnassociatedTargets,
    this.enabled,
  });
  static UpdateMaintenanceWindowResult fromJson(Map<String, dynamic> json) =>
      UpdateMaintenanceWindowResult();
}

class UpdateMaintenanceWindowTargetResult {
  /// The maintenance window ID specified in the update request.
  final String windowId;

  /// The target ID specified in the update request.
  final String windowTargetId;

  /// The updated targets.
  final List<Target> targets;

  /// The updated owner.
  final String ownerInformation;

  /// The updated name.
  final String name;

  /// The updated description.
  final String description;

  UpdateMaintenanceWindowTargetResult({
    this.windowId,
    this.windowTargetId,
    this.targets,
    this.ownerInformation,
    this.name,
    this.description,
  });
  static UpdateMaintenanceWindowTargetResult fromJson(
          Map<String, dynamic> json) =>
      UpdateMaintenanceWindowTargetResult();
}

class UpdateMaintenanceWindowTaskResult {
  /// The ID of the maintenance window that was updated.
  final String windowId;

  /// The task ID of the maintenance window that was updated.
  final String windowTaskId;

  /// The updated target values.
  final List<Target> targets;

  /// The updated task ARN value.
  final String taskArn;

  /// The ARN of the IAM service role to use to publish Amazon Simple
  /// Notification Service (Amazon SNS) notifications for maintenance window Run
  /// Command tasks.
  final String serviceRoleArn;

  /// The updated parameter values.
  ///
  ///   `TaskParameters` has been deprecated. To specify parameters to pass to a
  /// task when it runs, instead use the `Parameters` option in the
  /// `TaskInvocationParameters` structure. For information about how Systems
  /// Manager handles these options for the supported maintenance window task
  /// types, see MaintenanceWindowTaskInvocationParameters.
  final Map<String, MaintenanceWindowTaskParameterValueExpression>
      taskParameters;

  /// The updated parameter values.
  final MaintenanceWindowTaskInvocationParameters taskInvocationParameters;

  /// The updated priority value.
  final int priority;

  /// The updated MaxConcurrency value.
  final String maxConcurrency;

  /// The updated MaxErrors value.
  final String maxErrors;

  /// The updated logging information in Amazon S3.
  ///
  ///   `LoggingInfo` has been deprecated. To specify an S3 bucket to contain
  /// logs, instead use the `OutputS3BucketName` and `OutputS3KeyPrefix` options
  /// in the `TaskInvocationParameters` structure. For information about how
  /// Systems Manager handles these options for the supported maintenance window
  /// task types, see MaintenanceWindowTaskInvocationParameters.
  final LoggingInfo loggingInfo;

  /// The updated task name.
  final String name;

  /// The updated task description.
  final String description;

  UpdateMaintenanceWindowTaskResult({
    this.windowId,
    this.windowTaskId,
    this.targets,
    this.taskArn,
    this.serviceRoleArn,
    this.taskParameters,
    this.taskInvocationParameters,
    this.priority,
    this.maxConcurrency,
    this.maxErrors,
    this.loggingInfo,
    this.name,
    this.description,
  });
  static UpdateMaintenanceWindowTaskResult fromJson(
          Map<String, dynamic> json) =>
      UpdateMaintenanceWindowTaskResult();
}

class UpdateManagedInstanceRoleResult {
  UpdateManagedInstanceRoleResult();
  static UpdateManagedInstanceRoleResult fromJson(Map<String, dynamic> json) =>
      UpdateManagedInstanceRoleResult();
}

class UpdateOpsItemResponse {
  UpdateOpsItemResponse();
  static UpdateOpsItemResponse fromJson(Map<String, dynamic> json) =>
      UpdateOpsItemResponse();
}

class UpdatePatchBaselineResult {
  /// The ID of the deleted patch baseline.
  final String baselineId;

  /// The name of the patch baseline.
  final String name;

  /// The operating system rule used by the updated patch baseline.
  final String operatingSystem;

  /// A set of global filters used to exclude patches from the baseline.
  final PatchFilterGroup globalFilters;

  /// A set of rules used to include patches in the baseline.
  final PatchRuleGroup approvalRules;

  /// A list of explicitly approved patches for the baseline.
  final List<String> approvedPatches;

  /// The compliance severity level assigned to the patch baseline after the
  /// update completed.
  final String approvedPatchesComplianceLevel;

  /// Indicates whether the list of approved patches includes non-security
  /// updates that should be applied to the instances. The default value is
  /// 'false'. Applies to Linux instances only.
  final bool approvedPatchesEnableNonSecurity;

  /// A list of explicitly rejected patches for the baseline.
  final List<String> rejectedPatches;

  /// The action specified to take on patches included in the RejectedPatches
  /// list. A patch can be allowed only if it is a dependency of another
  /// package, or blocked entirely along with packages that include it as a
  /// dependency.
  final String rejectedPatchesAction;

  /// The date when the patch baseline was created.
  final DateTime createdDate;

  /// The date when the patch baseline was last modified.
  final DateTime modifiedDate;

  /// A description of the Patch Baseline.
  final String description;

  /// Information about the patches to use to update the instances, including
  /// target operating systems and source repositories. Applies to Linux
  /// instances only.
  final List<PatchSource> sources;

  UpdatePatchBaselineResult({
    this.baselineId,
    this.name,
    this.operatingSystem,
    this.globalFilters,
    this.approvalRules,
    this.approvedPatches,
    this.approvedPatchesComplianceLevel,
    this.approvedPatchesEnableNonSecurity,
    this.rejectedPatches,
    this.rejectedPatchesAction,
    this.createdDate,
    this.modifiedDate,
    this.description,
    this.sources,
  });
  static UpdatePatchBaselineResult fromJson(Map<String, dynamic> json) =>
      UpdatePatchBaselineResult();
}

/// The result body of the UpdateServiceSetting API action.
class UpdateServiceSettingResult {
  UpdateServiceSettingResult();
  static UpdateServiceSettingResult fromJson(Map<String, dynamic> json) =>
      UpdateServiceSettingResult();
}
