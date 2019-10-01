import 'package:meta/meta.dart';

/// AWS CloudFormation
///
/// AWS CloudFormation allows you to create and manage AWS infrastructure
/// deployments predictably and repeatedly. You can use AWS CloudFormation to
/// leverage AWS products, such as Amazon Elastic Compute Cloud, Amazon Elastic
/// Block Store, Amazon Simple Notification Service, Elastic Load Balancing, and
/// Auto Scaling to build highly-reliable, highly scalable, cost-effective
/// applications without creating or configuring the underlying AWS
/// infrastructure.
///
/// With AWS CloudFormation, you declare all of your resources and dependencies
/// in a template file. The template defines a collection of resources as a
/// single unit called a stack. AWS CloudFormation creates and deletes all
/// member resources of the stack together and manages all dependencies between
/// the resources for you.
///
/// For more information about AWS CloudFormation, see the
/// [AWS CloudFormation Product Page](http://aws.amazon.com/cloudformation/).
///
/// Amazon CloudFormation makes use of other AWS products. If you need
/// additional technical information about a specific AWS product, you can find
/// the product's technical documentation at
/// [docs.aws.amazon.com](https://docs.aws.amazon.com/).
class CloudFormationApi {
  final _client;
  CloudFormationApi(client)
      : _client = client.configured('CloudFormation', serializer: 'query');

  /// Cancels an update on the specified stack. If the call completes
  /// successfully, the stack rolls back the update and reverts to the previous
  /// stack configuration.
  ///
  ///
  ///
  /// You can cancel only stacks that are in the UPDATE_IN_PROGRESS state.
  ///
  /// [stackName]: The name or the unique stack ID that is associated with the
  /// stack.
  ///
  /// [clientRequestToken]: A unique identifier for this `CancelUpdateStack`
  /// request. Specify this token if you plan to retry requests so that AWS
  /// CloudFormation knows that you're not attempting to cancel an update on a
  /// stack with the same name. You might retry `CancelUpdateStack` requests to
  /// ensure that AWS CloudFormation successfully received them.
  Future<void> cancelUpdateStack(String stackName,
      {String clientRequestToken}) async {
    await _client.send('CancelUpdateStack', {
      'StackName': stackName,
      if (clientRequestToken != null) 'ClientRequestToken': clientRequestToken,
    });
  }

  /// For a specified stack that is in the `UPDATE_ROLLBACK_FAILED` state,
  /// continues rolling it back to the `UPDATE_ROLLBACK_COMPLETE` state.
  /// Depending on the cause of the failure, you can manually
  /// [fix the error](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/troubleshooting.html#troubleshooting-errors-update-rollback-failed)
  /// and continue the rollback. By continuing the rollback, you can return your
  /// stack to a working state (the `UPDATE_ROLLBACK_COMPLETE` state), and then
  /// try to update the stack again.
  ///
  /// A stack goes into the `UPDATE_ROLLBACK_FAILED` state when AWS
  /// CloudFormation cannot roll back all changes after a failed stack update.
  /// For example, you might have a stack that is rolling back to an old
  /// database instance that was deleted outside of AWS CloudFormation. Because
  /// AWS CloudFormation doesn't know the database was deleted, it assumes that
  /// the database instance still exists and attempts to roll back to it,
  /// causing the update rollback to fail.
  ///
  /// [stackName]: The name or the unique ID of the stack that you want to
  /// continue rolling back.
  ///
  ///
  ///
  /// Don't specify the name of a nested stack (a stack that was created by
  /// using the `AWS::CloudFormation::Stack` resource). Instead, use this
  /// operation on the parent stack (the stack that contains the
  /// `AWS::CloudFormation::Stack` resource).
  ///
  /// [roleArn]: The Amazon Resource Name (ARN) of an AWS Identity and Access
  /// Management (IAM) role that AWS CloudFormation assumes to roll back the
  /// stack. AWS CloudFormation uses the role's credentials to make calls on
  /// your behalf. AWS CloudFormation always uses this role for all future
  /// operations on the stack. As long as users have permission to operate on
  /// the stack, AWS CloudFormation uses this role even if the users don't have
  /// permission to pass it. Ensure that the role grants least privilege.
  ///
  /// If you don't specify a value, AWS CloudFormation uses the role that was
  /// previously associated with the stack. If no role is available, AWS
  /// CloudFormation uses a temporary session that is generated from your user
  /// credentials.
  ///
  /// [resourcesToSkip]: A list of the logical IDs of the resources that AWS
  /// CloudFormation skips during the continue update rollback operation. You
  /// can specify only resources that are in the `UPDATE_FAILED` state because a
  /// rollback failed. You can't specify resources that are in the
  /// `UPDATE_FAILED` state for other reasons, for example, because an update
  /// was cancelled. To check why a resource update failed, use the
  /// DescribeStackResources action, and view the resource status reason.
  ///
  ///  Specify this property to skip rolling back resources that AWS
  /// CloudFormation can't successfully roll back. We recommend that you
  /// [troubleshoot](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/troubleshooting.html#troubleshooting-errors-update-rollback-failed)
  /// resources before skipping them. AWS CloudFormation sets the status of the
  /// specified resources to `UPDATE_COMPLETE` and continues to roll back the
  /// stack. After the rollback is complete, the state of the skipped resources
  /// will be inconsistent with the state of the resources in the stack
  /// template. Before performing another stack update, you must update the
  /// stack or resources to be consistent with each other. If you don't,
  /// subsequent stack updates might fail, and the stack will become
  /// unrecoverable.
  ///
  /// Specify the minimum number of resources required to successfully roll back
  /// your stack. For example, a failed resource update might cause dependent
  /// resources to fail. In this case, it might not be necessary to skip the
  /// dependent resources.
  ///
  /// To skip resources that are part of nested stacks, use the following
  /// format: `NestedStackName.ResourceLogicalID`. If you want to specify the
  /// logical ID of a stack resource (`Type: AWS::CloudFormation::Stack`) in the
  /// `ResourcesToSkip` list, then its corresponding embedded stack must be in
  /// one of the following states: `DELETE_IN_PROGRESS`, `DELETE_COMPLETE`, or
  /// `DELETE_FAILED`.
  ///
  ///
  ///
  /// Don't confuse a child stack's name with its corresponding logical ID
  /// defined in the parent stack. For an example of a continue update rollback
  /// operation with nested stacks, see
  /// [Using ResourcesToSkip to recover a nested stacks hierarchy](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-updating-stacks-continueupdaterollback.html#nested-stacks).
  ///
  /// [clientRequestToken]: A unique identifier for this
  /// `ContinueUpdateRollback` request. Specify this token if you plan to retry
  /// requests so that AWS CloudFormation knows that you're not attempting to
  /// continue the rollback to a stack with the same name. You might retry
  /// `ContinueUpdateRollback` requests to ensure that AWS CloudFormation
  /// successfully received them.
  Future<ContinueUpdateRollbackOutput> continueUpdateRollback(String stackName,
      {String roleArn,
      List<String> resourcesToSkip,
      String clientRequestToken}) async {
    var response_ = await _client.send('ContinueUpdateRollback', {
      'StackName': stackName,
      if (roleArn != null) 'RoleARN': roleArn,
      if (resourcesToSkip != null) 'ResourcesToSkip': resourcesToSkip,
      if (clientRequestToken != null) 'ClientRequestToken': clientRequestToken,
    });
    return ContinueUpdateRollbackOutput.fromJson(response_);
  }

  /// Creates a list of changes that will be applied to a stack so that you can
  /// review the changes before executing them. You can create a change set for
  /// a stack that doesn't exist or an existing stack. If you create a change
  /// set for a stack that doesn't exist, the change set shows all of the
  /// resources that AWS CloudFormation will create. If you create a change set
  /// for an existing stack, AWS CloudFormation compares the stack's information
  /// with the information that you submit in the change set and lists the
  /// differences. Use change sets to understand which resources AWS
  /// CloudFormation will create or change, and how it will change resources in
  /// an existing stack, before you create or update a stack.
  ///
  /// To create a change set for a stack that doesn't exist, for the
  /// `ChangeSetType` parameter, specify `CREATE`. To create a change set for an
  /// existing stack, specify `UPDATE` for the `ChangeSetType` parameter. After
  /// the `CreateChangeSet` call successfully completes, AWS CloudFormation
  /// starts creating the change set. To check the status of the change set or
  /// to review it, use the DescribeChangeSet action.
  ///
  /// When you are satisfied with the changes the change set will make, execute
  /// the change set by using the ExecuteChangeSet action. AWS CloudFormation
  /// doesn't make changes until you execute the change set.
  ///
  /// [stackName]: The name or the unique ID of the stack for which you are
  /// creating a change set. AWS CloudFormation generates the change set by
  /// comparing this stack's information with the information that you submit,
  /// such as a modified template or different parameter input values.
  ///
  /// [templateBody]: A structure that contains the body of the revised
  /// template, with a minimum length of 1 byte and a maximum length of 51,200
  /// bytes. AWS CloudFormation generates the change set by comparing this
  /// template with the template of the stack that you specified.
  ///
  /// Conditional: You must specify only `TemplateBody` or `TemplateURL`.
  ///
  /// [templateUrl]: The location of the file that contains the revised
  /// template. The URL must point to a template (max size: 460,800 bytes) that
  /// is located in an S3 bucket. AWS CloudFormation generates the change set by
  /// comparing this template with the stack that you specified.
  ///
  /// Conditional: You must specify only `TemplateBody` or `TemplateURL`.
  ///
  /// [usePreviousTemplate]: Whether to reuse the template that is associated
  /// with the stack to create the change set.
  ///
  /// [parameters]: A list of `Parameter` structures that specify input
  /// parameters for the change set. For more information, see the Parameter
  /// data type.
  ///
  /// [capabilities]: In some cases, you must explicity acknowledge that your
  /// stack template contains certain capabilities in order for AWS
  /// CloudFormation to create the stack.
  ///
  /// *    `CAPABILITY_IAM` and `CAPABILITY_NAMED_IAM`
  ///
  ///     Some stack templates might include resources that can affect
  /// permissions in your AWS account; for example, by creating new AWS Identity
  /// and Access Management (IAM) users. For those stacks, you must explicitly
  /// acknowledge this by specifying one of these capabilities.
  ///
  ///     The following IAM resources require you to specify either the
  /// `CAPABILITY_IAM` or `CAPABILITY_NAMED_IAM` capability.
  ///
  ///     *   If you have IAM resources, you can specify either capability.
  ///
  ///     *   If you have IAM resources with custom names, you _must_ specify
  /// `CAPABILITY_NAMED_IAM`.
  ///
  ///     *   If you don't specify either of these capabilities, AWS
  /// CloudFormation returns an `InsufficientCapabilities` error.
  ///
  ///
  ///     If your stack template contains these resources, we recommend that you
  /// review all permissions associated with them and edit their permissions if
  /// necessary.
  ///
  ///     *
  /// [AWS::IAM::AccessKey](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-accesskey.html)
  ///
  ///     *
  /// [AWS::IAM::Group](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-group.html)
  ///
  ///     *
  /// [AWS::IAM::InstanceProfile](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-instanceprofile.html)
  ///
  ///     *
  /// [AWS::IAM::Policy](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-policy.html)
  ///
  ///     *
  /// [AWS::IAM::Role](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-role.html)
  ///
  ///     *
  /// [AWS::IAM::User](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-user.html)
  ///
  ///     *
  /// [AWS::IAM::UserToGroupAddition](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-addusertogroup.html)
  ///
  ///
  ///     For more information, see
  /// [Acknowledging IAM Resources in AWS CloudFormation Templates](http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-iam-template.html#capabilities).
  ///
  /// *    `CAPABILITY_AUTO_EXPAND`
  ///
  ///     Some template contain macros. Macros perform custom processing on
  /// templates; this can include simple actions like find-and-replace
  /// operations, all the way to extensive transformations of entire templates.
  /// Because of this, users typically create a change set from the processed
  /// template, so that they can review the changes resulting from the macros
  /// before actually creating the stack. If your stack template contains one or
  /// more macros, and you choose to create a stack directly from the processed
  /// template, without first reviewing the resulting changes in a change set,
  /// you must acknowledge this capability. This includes the
  /// [AWS::Include](http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/create-reusable-transform-function-snippets-and-add-to-your-template-with-aws-include-transform.html)
  /// and
  /// [AWS::Serverless](http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/transform-aws-serverless.html)
  /// transforms, which are macros hosted by AWS CloudFormation.
  ///
  ///      This capacity does not apply to creating change sets, and specifying
  /// it when creating change sets has no effect.
  ///
  ///     Also, change sets do not currently support nested stacks. If you want
  /// to create a stack from a stack template that contains macros _and_ nested
  /// stacks, you must create or update the stack directly from the template
  /// using the CreateStack or UpdateStack action, and specifying this
  /// capability.
  ///
  ///     For more information on macros, see
  /// [Using AWS CloudFormation Macros to Perform Custom Processing on Templates](http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-macros.html).
  ///
  /// [resourceTypes]: The template resource types that you have permissions to
  /// work with if you execute this change set, such as `AWS::EC2::Instance`,
  /// `AWS::EC2::*`, or `Custom::MyCustomInstance`.
  ///
  /// If the list of resource types doesn't include a resource type that you're
  /// updating, the stack update fails. By default, AWS CloudFormation grants
  /// permissions to all resource types. AWS Identity and Access Management
  /// (IAM) uses this parameter for condition keys in IAM policies for AWS
  /// CloudFormation. For more information, see
  /// [Controlling Access with AWS Identity and Access Management](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-iam-template.html)
  /// in the AWS CloudFormation User Guide.
  ///
  /// [roleArn]: The Amazon Resource Name (ARN) of an AWS Identity and Access
  /// Management (IAM) role that AWS CloudFormation assumes when executing the
  /// change set. AWS CloudFormation uses the role's credentials to make calls
  /// on your behalf. AWS CloudFormation uses this role for all future
  /// operations on the stack. As long as users have permission to operate on
  /// the stack, AWS CloudFormation uses this role even if the users don't have
  /// permission to pass it. Ensure that the role grants least privilege.
  ///
  /// If you don't specify a value, AWS CloudFormation uses the role that was
  /// previously associated with the stack. If no role is available, AWS
  /// CloudFormation uses a temporary session that is generated from your user
  /// credentials.
  ///
  /// [rollbackConfiguration]: The rollback triggers for AWS CloudFormation to
  /// monitor during stack creation and updating operations, and for the
  /// specified monitoring period afterwards.
  ///
  /// [notificationARNs]: The Amazon Resource Names (ARNs) of Amazon Simple
  /// Notification Service (Amazon SNS) topics that AWS CloudFormation
  /// associates with the stack. To remove all associated notification topics,
  /// specify an empty list.
  ///
  /// [tags]: Key-value pairs to associate with this stack. AWS CloudFormation
  /// also propagates these tags to resources in the stack. You can specify a
  /// maximum of 50 tags.
  ///
  /// [changeSetName]: The name of the change set. The name must be unique among
  /// all change sets that are associated with the specified stack.
  ///
  /// A change set name can contain only alphanumeric, case sensitive characters
  /// and hyphens. It must start with an alphabetic character and cannot exceed
  /// 128 characters.
  ///
  /// [clientToken]: A unique identifier for this `CreateChangeSet` request.
  /// Specify this token if you plan to retry requests so that AWS
  /// CloudFormation knows that you're not attempting to create another change
  /// set with the same name. You might retry `CreateChangeSet` requests to
  /// ensure that AWS CloudFormation successfully received them.
  ///
  /// [description]: A description to help you identify this change set.
  ///
  /// [changeSetType]: The type of change set operation. To create a change set
  /// for a new stack, specify `CREATE`. To create a change set for an existing
  /// stack, specify `UPDATE`.
  ///
  /// If you create a change set for a new stack, AWS Cloudformation creates a
  /// stack with a unique stack ID, but no template or resources. The stack will
  /// be in the
  /// [`REVIEW_IN_PROGRESS`](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-describing-stacks.html#d0e11995)
  ///  state until you execute the change set.
  ///
  /// By default, AWS CloudFormation specifies `UPDATE`. You can't use the
  /// `UPDATE` type to create a change set for a new stack or the `CREATE` type
  /// to create a change set for an existing stack.
  Future<CreateChangeSetOutput> createChangeSet(
      {@required String stackName,
      String templateBody,
      String templateUrl,
      bool usePreviousTemplate,
      List<Parameter> parameters,
      List<String> capabilities,
      List<String> resourceTypes,
      String roleArn,
      RollbackConfiguration rollbackConfiguration,
      List<String> notificationARNs,
      List<Tag> tags,
      @required String changeSetName,
      String clientToken,
      String description,
      String changeSetType}) async {
    var response_ = await _client.send('CreateChangeSet', {
      'StackName': stackName,
      if (templateBody != null) 'TemplateBody': templateBody,
      if (templateUrl != null) 'TemplateURL': templateUrl,
      if (usePreviousTemplate != null)
        'UsePreviousTemplate': usePreviousTemplate,
      if (parameters != null) 'Parameters': parameters,
      if (capabilities != null) 'Capabilities': capabilities,
      if (resourceTypes != null) 'ResourceTypes': resourceTypes,
      if (roleArn != null) 'RoleARN': roleArn,
      if (rollbackConfiguration != null)
        'RollbackConfiguration': rollbackConfiguration,
      if (notificationARNs != null) 'NotificationARNs': notificationARNs,
      if (tags != null) 'Tags': tags,
      'ChangeSetName': changeSetName,
      if (clientToken != null) 'ClientToken': clientToken,
      if (description != null) 'Description': description,
      if (changeSetType != null) 'ChangeSetType': changeSetType,
    });
    return CreateChangeSetOutput.fromJson(response_);
  }

  /// Creates a stack as specified in the template. After the call completes
  /// successfully, the stack creation starts. You can check the status of the
  /// stack via the DescribeStacks API.
  ///
  /// [stackName]: The name that is associated with the stack. The name must be
  /// unique in the region in which you are creating the stack.
  ///
  ///
  ///
  /// A stack name can contain only alphanumeric characters (case sensitive) and
  /// hyphens. It must start with an alphabetic character and cannot be longer
  /// than 128 characters.
  ///
  /// [templateBody]: Structure containing the template body with a minimum
  /// length of 1 byte and a maximum length of 51,200 bytes. For more
  /// information, go to
  /// [Template Anatomy](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html)
  /// in the AWS CloudFormation User Guide.
  ///
  /// Conditional: You must specify either the `TemplateBody` or the
  /// `TemplateURL` parameter, but not both.
  ///
  /// [templateUrl]: Location of file containing the template body. The URL must
  /// point to a template (max size: 460,800 bytes) that is located in an Amazon
  /// S3 bucket. For more information, go to the
  /// [Template Anatomy](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html)
  /// in the AWS CloudFormation User Guide.
  ///
  /// Conditional: You must specify either the `TemplateBody` or the
  /// `TemplateURL` parameter, but not both.
  ///
  /// [parameters]: A list of `Parameter` structures that specify input
  /// parameters for the stack. For more information, see the
  /// [Parameter](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_Parameter.html)
  /// data type.
  ///
  /// [disableRollback]: Set to `true` to disable rollback of the stack if stack
  /// creation failed. You can specify either `DisableRollback` or `OnFailure`,
  /// but not both.
  ///
  /// Default: `false`
  ///
  /// [rollbackConfiguration]: The rollback triggers for AWS CloudFormation to
  /// monitor during stack creation and updating operations, and for the
  /// specified monitoring period afterwards.
  ///
  /// [timeoutInMinutes]: The amount of time that can pass before the stack
  /// status becomes CREATE_FAILED; if `DisableRollback` is not set or is set to
  /// `false`, the stack will be rolled back.
  ///
  /// [notificationARNs]: The Simple Notification Service (SNS) topic ARNs to
  /// publish stack related events. You can find your SNS topic ARNs using the
  /// SNS console or your Command Line Interface (CLI).
  ///
  /// [capabilities]: In some cases, you must explicity acknowledge that your
  /// stack template contains certain capabilities in order for AWS
  /// CloudFormation to create the stack.
  ///
  /// *    `CAPABILITY_IAM` and `CAPABILITY_NAMED_IAM`
  ///
  ///     Some stack templates might include resources that can affect
  /// permissions in your AWS account; for example, by creating new AWS Identity
  /// and Access Management (IAM) users. For those stacks, you must explicitly
  /// acknowledge this by specifying one of these capabilities.
  ///
  ///     The following IAM resources require you to specify either the
  /// `CAPABILITY_IAM` or `CAPABILITY_NAMED_IAM` capability.
  ///
  ///     *   If you have IAM resources, you can specify either capability.
  ///
  ///     *   If you have IAM resources with custom names, you _must_ specify
  /// `CAPABILITY_NAMED_IAM`.
  ///
  ///     *   If you don't specify either of these capabilities, AWS
  /// CloudFormation returns an `InsufficientCapabilities` error.
  ///
  ///
  ///     If your stack template contains these resources, we recommend that you
  /// review all permissions associated with them and edit their permissions if
  /// necessary.
  ///
  ///     *
  /// [AWS::IAM::AccessKey](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-accesskey.html)
  ///
  ///     *
  /// [AWS::IAM::Group](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-group.html)
  ///
  ///     *
  /// [AWS::IAM::InstanceProfile](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-instanceprofile.html)
  ///
  ///     *
  /// [AWS::IAM::Policy](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-policy.html)
  ///
  ///     *
  /// [AWS::IAM::Role](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-role.html)
  ///
  ///     *
  /// [AWS::IAM::User](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-user.html)
  ///
  ///     *
  /// [AWS::IAM::UserToGroupAddition](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-addusertogroup.html)
  ///
  ///
  ///     For more information, see
  /// [Acknowledging IAM Resources in AWS CloudFormation Templates](http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-iam-template.html#capabilities).
  ///
  /// *    `CAPABILITY_AUTO_EXPAND`
  ///
  ///     Some template contain macros. Macros perform custom processing on
  /// templates; this can include simple actions like find-and-replace
  /// operations, all the way to extensive transformations of entire templates.
  /// Because of this, users typically create a change set from the processed
  /// template, so that they can review the changes resulting from the macros
  /// before actually creating the stack. If your stack template contains one or
  /// more macros, and you choose to create a stack directly from the processed
  /// template, without first reviewing the resulting changes in a change set,
  /// you must acknowledge this capability. This includes the
  /// [AWS::Include](http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/create-reusable-transform-function-snippets-and-add-to-your-template-with-aws-include-transform.html)
  /// and
  /// [AWS::Serverless](http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/transform-aws-serverless.html)
  /// transforms, which are macros hosted by AWS CloudFormation.
  ///
  ///     Change sets do not currently support nested stacks. If you want to
  /// create a stack from a stack template that contains macros _and_ nested
  /// stacks, you must create the stack directly from the template using this
  /// capability.
  ///
  ///      You should only create stacks directly from a stack template that
  /// contains macros if you know what processing the macro performs.
  ///
  ///     Each macro relies on an underlying Lambda service function for
  /// processing stack templates. Be aware that the Lambda function owner can
  /// update the function operation without AWS CloudFormation being notified.
  ///
  ///     For more information, see
  /// [Using AWS CloudFormation Macros to Perform Custom Processing on Templates](http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-macros.html).
  ///
  /// [resourceTypes]: The template resource types that you have permissions to
  /// work with for this create stack action, such as `AWS::EC2::Instance`,
  /// `AWS::EC2::*`, or `Custom::MyCustomInstance`. Use the following syntax to
  /// describe template resource types: `AWS::*` (for all AWS resource),
  /// `Custom::*` (for all custom resources), `Custom::_logical_ID_`  (for a
  /// specific custom resource), `AWS::_service_name_::*` (for all resources of
  /// a particular AWS service), and
  /// `AWS::_service_name_::_resource_logical_ID_`  (for a specific AWS
  /// resource).
  ///
  /// If the list of resource types doesn't include a resource that you're
  /// creating, the stack creation fails. By default, AWS CloudFormation grants
  /// permissions to all resource types. AWS Identity and Access Management
  /// (IAM) uses this parameter for AWS CloudFormation-specific condition keys
  /// in IAM policies. For more information, see
  /// [Controlling Access with AWS Identity and Access Management](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-iam-template.html).
  ///
  /// [roleArn]: The Amazon Resource Name (ARN) of an AWS Identity and Access
  /// Management (IAM) role that AWS CloudFormation assumes to create the stack.
  /// AWS CloudFormation uses the role's credentials to make calls on your
  /// behalf. AWS CloudFormation always uses this role for all future operations
  /// on the stack. As long as users have permission to operate on the stack,
  /// AWS CloudFormation uses this role even if the users don't have permission
  /// to pass it. Ensure that the role grants least privilege.
  ///
  /// If you don't specify a value, AWS CloudFormation uses the role that was
  /// previously associated with the stack. If no role is available, AWS
  /// CloudFormation uses a temporary session that is generated from your user
  /// credentials.
  ///
  /// [onFailure]: Determines what action will be taken if stack creation fails.
  /// This must be one of: DO_NOTHING, ROLLBACK, or DELETE. You can specify
  /// either `OnFailure` or `DisableRollback`, but not both.
  ///
  /// Default: `ROLLBACK`
  ///
  /// [stackPolicyBody]: Structure containing the stack policy body. For more
  /// information, go to
  /// [Prevent Updates to Stack Resources](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/protect-stack-resources.html)
  /// in the _AWS CloudFormation User Guide_. You can specify either the
  /// `StackPolicyBody` or the `StackPolicyURL` parameter, but not both.
  ///
  /// [stackPolicyUrl]: Location of a file containing the stack policy. The URL
  /// must point to a policy (maximum size: 16 KB) located in an S3 bucket in
  /// the same region as the stack. You can specify either the `StackPolicyBody`
  /// or the `StackPolicyURL` parameter, but not both.
  ///
  /// [tags]: Key-value pairs to associate with this stack. AWS CloudFormation
  /// also propagates these tags to the resources created in the stack. A
  /// maximum number of 50 tags can be specified.
  ///
  /// [clientRequestToken]: A unique identifier for this `CreateStack` request.
  /// Specify this token if you plan to retry requests so that AWS
  /// CloudFormation knows that you're not attempting to create a stack with the
  /// same name. You might retry `CreateStack` requests to ensure that AWS
  /// CloudFormation successfully received them.
  ///
  /// All events triggered by a given stack operation are assigned the same
  /// client request token, which you can use to track operations. For example,
  /// if you execute a `CreateStack` operation with the token `token1`, then all
  /// the `StackEvents` generated by that operation will have
  /// `ClientRequestToken` set as `token1`.
  ///
  /// In the console, stack operations display the client request token on the
  /// Events tab. Stack operations that are initiated from the console use the
  /// token format _Console-StackOperation-ID_, which helps you easily identify
  /// the stack operation . For example, if you create a stack using the
  /// console, each stack event would be assigned the same token in the
  /// following format:
  /// `Console-CreateStack-7f59c3cf-00d2-40c7-b2ff-e75db0987002`.
  ///
  /// [enableTerminationProtection]: Whether to enable termination protection on
  /// the specified stack. If a user attempts to delete a stack with termination
  /// protection enabled, the operation fails and the stack remains unchanged.
  /// For more information, see
  /// [Protecting a Stack From Being Deleted](http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-protect-stacks.html)
  /// in the _AWS CloudFormation User Guide_. Termination protection is disabled
  /// on stacks by default.
  ///
  ///  For
  /// [nested stacks](http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-nested-stacks.html),
  /// termination protection is set on the root stack and cannot be changed
  /// directly on the nested stack.
  Future<CreateStackOutput> createStack(String stackName,
      {String templateBody,
      String templateUrl,
      List<Parameter> parameters,
      bool disableRollback,
      RollbackConfiguration rollbackConfiguration,
      int timeoutInMinutes,
      List<String> notificationARNs,
      List<String> capabilities,
      List<String> resourceTypes,
      String roleArn,
      String onFailure,
      String stackPolicyBody,
      String stackPolicyUrl,
      List<Tag> tags,
      String clientRequestToken,
      bool enableTerminationProtection}) async {
    var response_ = await _client.send('CreateStack', {
      'StackName': stackName,
      if (templateBody != null) 'TemplateBody': templateBody,
      if (templateUrl != null) 'TemplateURL': templateUrl,
      if (parameters != null) 'Parameters': parameters,
      if (disableRollback != null) 'DisableRollback': disableRollback,
      if (rollbackConfiguration != null)
        'RollbackConfiguration': rollbackConfiguration,
      if (timeoutInMinutes != null) 'TimeoutInMinutes': timeoutInMinutes,
      if (notificationARNs != null) 'NotificationARNs': notificationARNs,
      if (capabilities != null) 'Capabilities': capabilities,
      if (resourceTypes != null) 'ResourceTypes': resourceTypes,
      if (roleArn != null) 'RoleARN': roleArn,
      if (onFailure != null) 'OnFailure': onFailure,
      if (stackPolicyBody != null) 'StackPolicyBody': stackPolicyBody,
      if (stackPolicyUrl != null) 'StackPolicyURL': stackPolicyUrl,
      if (tags != null) 'Tags': tags,
      if (clientRequestToken != null) 'ClientRequestToken': clientRequestToken,
      if (enableTerminationProtection != null)
        'EnableTerminationProtection': enableTerminationProtection,
    });
    return CreateStackOutput.fromJson(response_);
  }

  /// Creates stack instances for the specified accounts, within the specified
  /// regions. A stack instance refers to a stack in a specific account and
  /// region. `Accounts` and `Regions` are required parameters—you must specify
  /// at least one account and one region.
  ///
  /// [stackSetName]: The name or unique ID of the stack set that you want to
  /// create stack instances from.
  ///
  /// [accounts]: The names of one or more AWS accounts that you want to create
  /// stack instances in the specified region(s) for.
  ///
  /// [regions]: The names of one or more regions where you want to create stack
  /// instances using the specified AWS account(s).
  ///
  /// [parameterOverrides]: A list of stack set parameters whose values you want
  /// to override in the selected stack instances.
  ///
  /// Any overridden parameter values will be applied to all stack instances in
  /// the specified accounts and regions. When specifying parameters and their
  /// values, be aware of how AWS CloudFormation sets parameter values during
  /// stack instance operations:
  ///
  /// *   To override the current value for a parameter, include the parameter
  /// and specify its value.
  ///
  /// *   To leave a parameter set to its present value, you can do one of the
  /// following:
  ///
  ///     *   Do not include the parameter in the list.
  ///
  ///     *   Include the parameter and specify `UsePreviousValue` as `true`.
  /// (You cannot specify both a value and set `UsePreviousValue` to `true`.)
  ///
  ///
  /// *   To set all overridden parameter back to the values specified in the
  /// stack set, specify a parameter list but do not include any parameters.
  ///
  /// *   To leave all parameters set to their present values, do not specify
  /// this property at all.
  ///
  ///
  /// During stack set updates, any parameter values overridden for a stack
  /// instance are not updated, but retain their overridden value.
  ///
  /// You can only override the parameter _values_ that are specified in the
  /// stack set; to add or delete a parameter itself, use
  /// [UpdateStackSet](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_UpdateStackSet.html)
  /// to update the stack set template.
  ///
  /// [operationPreferences]: Preferences for how AWS CloudFormation performs
  /// this stack set operation.
  ///
  /// [operationId]: The unique identifier for this stack set operation.
  ///
  /// The operation ID also functions as an idempotency token, to ensure that
  /// AWS CloudFormation performs the stack set operation only once, even if you
  /// retry the request multiple times. You might retry stack set operation
  /// requests to ensure that AWS CloudFormation successfully received them.
  ///
  /// If you don't specify an operation ID, the SDK generates one automatically.
  ///
  /// Repeating this stack set operation with a new operation ID retries all
  /// stack instances whose status is `OUTDATED`.
  Future<CreateStackInstancesOutput> createStackInstances(
      {@required String stackSetName,
      @required List<String> accounts,
      @required List<String> regions,
      List<Parameter> parameterOverrides,
      StackSetOperationPreferences operationPreferences,
      String operationId}) async {
    var response_ = await _client.send('CreateStackInstances', {
      'StackSetName': stackSetName,
      'Accounts': accounts,
      'Regions': regions,
      if (parameterOverrides != null) 'ParameterOverrides': parameterOverrides,
      if (operationPreferences != null)
        'OperationPreferences': operationPreferences,
      if (operationId != null) 'OperationId': operationId,
    });
    return CreateStackInstancesOutput.fromJson(response_);
  }

  /// Creates a stack set.
  ///
  /// [stackSetName]: The name to associate with the stack set. The name must be
  /// unique in the region where you create your stack set.
  ///
  ///
  ///
  /// A stack name can contain only alphanumeric characters (case-sensitive) and
  /// hyphens. It must start with an alphabetic character and can't be longer
  /// than 128 characters.
  ///
  /// [description]: A description of the stack set. You can use the description
  /// to identify the stack set's purpose or other important information.
  ///
  /// [templateBody]: The structure that contains the template body, with a
  /// minimum length of 1 byte and a maximum length of 51,200 bytes. For more
  /// information, see
  /// [Template Anatomy](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html)
  /// in the AWS CloudFormation User Guide.
  ///
  /// Conditional: You must specify either the TemplateBody or the TemplateURL
  /// parameter, but not both.
  ///
  /// [templateUrl]: The location of the file that contains the template body.
  /// The URL must point to a template (maximum size: 460,800 bytes) that's
  /// located in an Amazon S3 bucket. For more information, see
  /// [Template Anatomy](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html)
  /// in the AWS CloudFormation User Guide.
  ///
  /// Conditional: You must specify either the TemplateBody or the TemplateURL
  /// parameter, but not both.
  ///
  /// [parameters]: The input parameters for the stack set template.
  ///
  /// [capabilities]: In some cases, you must explicity acknowledge that your
  /// stack set template contains certain capabilities in order for AWS
  /// CloudFormation to create the stack set and related stack instances.
  ///
  /// *    `CAPABILITY_IAM` and `CAPABILITY_NAMED_IAM`
  ///
  ///     Some stack templates might include resources that can affect
  /// permissions in your AWS account; for example, by creating new AWS Identity
  /// and Access Management (IAM) users. For those stack sets, you must
  /// explicitly acknowledge this by specifying one of these capabilities.
  ///
  ///     The following IAM resources require you to specify either the
  /// `CAPABILITY_IAM` or `CAPABILITY_NAMED_IAM` capability.
  ///
  ///     *   If you have IAM resources, you can specify either capability.
  ///
  ///     *   If you have IAM resources with custom names, you _must_ specify
  /// `CAPABILITY_NAMED_IAM`.
  ///
  ///     *   If you don't specify either of these capabilities, AWS
  /// CloudFormation returns an `InsufficientCapabilities` error.
  ///
  ///
  ///     If your stack template contains these resources, we recommend that you
  /// review all permissions associated with them and edit their permissions if
  /// necessary.
  ///
  ///     *
  /// [AWS::IAM::AccessKey](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-accesskey.html)
  ///
  ///     *
  /// [AWS::IAM::Group](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-group.html)
  ///
  ///     *
  /// [AWS::IAM::InstanceProfile](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-instanceprofile.html)
  ///
  ///     *
  /// [AWS::IAM::Policy](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-policy.html)
  ///
  ///     *
  /// [AWS::IAM::Role](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-role.html)
  ///
  ///     *
  /// [AWS::IAM::User](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-user.html)
  ///
  ///     *
  /// [AWS::IAM::UserToGroupAddition](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-addusertogroup.html)
  ///
  ///
  ///     For more information, see
  /// [Acknowledging IAM Resources in AWS CloudFormation Templates](http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-iam-template.html#capabilities).
  ///
  /// *    `CAPABILITY_AUTO_EXPAND`
  ///
  ///     Some templates contain macros. If your stack template contains one or
  /// more macros, and you choose to create a stack directly from the processed
  /// template, without first reviewing the resulting changes in a change set,
  /// you must acknowledge this capability. For more information, see
  /// [Using AWS CloudFormation Macros to Perform Custom Processing on Templates](http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-macros.html).
  ///
  ///      Stack sets do not currently support macros in stack templates. (This
  /// includes the
  /// [AWS::Include](http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/create-reusable-transform-function-snippets-and-add-to-your-template-with-aws-include-transform.html)
  /// and
  /// [AWS::Serverless](http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/transform-aws-serverless.html)
  /// transforms, which are macros hosted by AWS CloudFormation.) Even if you
  /// specify this capability, if you include a macro in your template the stack
  /// set operation will fail.
  ///
  /// [tags]: The key-value pairs to associate with this stack set and the
  /// stacks created from it. AWS CloudFormation also propagates these tags to
  /// supported resources that are created in the stacks. A maximum number of 50
  /// tags can be specified.
  ///
  /// If you specify tags as part of a `CreateStackSet` action, AWS
  /// CloudFormation checks to see if you have the required IAM permission to
  /// tag resources. If you don't, the entire `CreateStackSet` action fails with
  /// an `access denied` error, and the stack set is not created.
  ///
  /// [administrationRoleArn]: The Amazon Resource Number (ARN) of the IAM role
  /// to use to create this stack set.
  ///
  /// Specify an IAM role only if you are using customized administrator roles
  /// to control which users or groups can manage specific stack sets within the
  /// same administrator account. For more information, see
  /// [Prerequisites: Granting Permissions for Stack Set Operations](http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-prereqs.html)
  /// in the _AWS CloudFormation User Guide_.
  ///
  /// [executionRoleName]: The name of the IAM execution role to use to create
  /// the stack set. If you do not specify an execution role, AWS CloudFormation
  /// uses the `AWSCloudFormationStackSetExecutionRole` role for the stack set
  /// operation.
  ///
  /// Specify an IAM role only if you are using customized execution roles to
  /// control which stack resources users and groups can include in their stack
  /// sets.
  ///
  /// [clientRequestToken]: A unique identifier for this `CreateStackSet`
  /// request. Specify this token if you plan to retry requests so that AWS
  /// CloudFormation knows that you're not attempting to create another stack
  /// set with the same name. You might retry `CreateStackSet` requests to
  /// ensure that AWS CloudFormation successfully received them.
  ///
  /// If you don't specify an operation ID, the SDK generates one automatically.
  Future<CreateStackSetOutput> createStackSet(String stackSetName,
      {String description,
      String templateBody,
      String templateUrl,
      List<Parameter> parameters,
      List<String> capabilities,
      List<Tag> tags,
      String administrationRoleArn,
      String executionRoleName,
      String clientRequestToken}) async {
    var response_ = await _client.send('CreateStackSet', {
      'StackSetName': stackSetName,
      if (description != null) 'Description': description,
      if (templateBody != null) 'TemplateBody': templateBody,
      if (templateUrl != null) 'TemplateURL': templateUrl,
      if (parameters != null) 'Parameters': parameters,
      if (capabilities != null) 'Capabilities': capabilities,
      if (tags != null) 'Tags': tags,
      if (administrationRoleArn != null)
        'AdministrationRoleARN': administrationRoleArn,
      if (executionRoleName != null) 'ExecutionRoleName': executionRoleName,
      if (clientRequestToken != null) 'ClientRequestToken': clientRequestToken,
    });
    return CreateStackSetOutput.fromJson(response_);
  }

  /// Deletes the specified change set. Deleting change sets ensures that no one
  /// executes the wrong change set.
  ///
  /// If the call successfully completes, AWS CloudFormation successfully
  /// deleted the change set.
  ///
  /// [changeSetName]: The name or Amazon Resource Name (ARN) of the change set
  /// that you want to delete.
  ///
  /// [stackName]: If you specified the name of a change set to delete, specify
  /// the stack name or ID (ARN) that is associated with it.
  Future<DeleteChangeSetOutput> deleteChangeSet(String changeSetName,
      {String stackName}) async {
    var response_ = await _client.send('DeleteChangeSet', {
      'ChangeSetName': changeSetName,
      if (stackName != null) 'StackName': stackName,
    });
    return DeleteChangeSetOutput.fromJson(response_);
  }

  /// Deletes a specified stack. Once the call completes successfully, stack
  /// deletion starts. Deleted stacks do not show up in the DescribeStacks API
  /// if the deletion has been completed successfully.
  ///
  /// [stackName]: The name or the unique stack ID that is associated with the
  /// stack.
  ///
  /// [retainResources]: For stacks in the `DELETE_FAILED` state, a list of
  /// resource logical IDs that are associated with the resources you want to
  /// retain. During deletion, AWS CloudFormation deletes the stack but does not
  /// delete the retained resources.
  ///
  /// Retaining resources is useful when you cannot delete a resource, such as a
  /// non-empty S3 bucket, but you want to delete the stack.
  ///
  /// [roleArn]: The Amazon Resource Name (ARN) of an AWS Identity and Access
  /// Management (IAM) role that AWS CloudFormation assumes to delete the stack.
  /// AWS CloudFormation uses the role's credentials to make calls on your
  /// behalf.
  ///
  /// If you don't specify a value, AWS CloudFormation uses the role that was
  /// previously associated with the stack. If no role is available, AWS
  /// CloudFormation uses a temporary session that is generated from your user
  /// credentials.
  ///
  /// [clientRequestToken]: A unique identifier for this `DeleteStack` request.
  /// Specify this token if you plan to retry requests so that AWS
  /// CloudFormation knows that you're not attempting to delete a stack with the
  /// same name. You might retry `DeleteStack` requests to ensure that AWS
  /// CloudFormation successfully received them.
  ///
  /// All events triggered by a given stack operation are assigned the same
  /// client request token, which you can use to track operations. For example,
  /// if you execute a `CreateStack` operation with the token `token1`, then all
  /// the `StackEvents` generated by that operation will have
  /// `ClientRequestToken` set as `token1`.
  ///
  /// In the console, stack operations display the client request token on the
  /// Events tab. Stack operations that are initiated from the console use the
  /// token format _Console-StackOperation-ID_, which helps you easily identify
  /// the stack operation . For example, if you create a stack using the
  /// console, each stack event would be assigned the same token in the
  /// following format:
  /// `Console-CreateStack-7f59c3cf-00d2-40c7-b2ff-e75db0987002`.
  Future<void> deleteStack(String stackName,
      {List<String> retainResources,
      String roleArn,
      String clientRequestToken}) async {
    await _client.send('DeleteStack', {
      'StackName': stackName,
      if (retainResources != null) 'RetainResources': retainResources,
      if (roleArn != null) 'RoleARN': roleArn,
      if (clientRequestToken != null) 'ClientRequestToken': clientRequestToken,
    });
  }

  /// Deletes stack instances for the specified accounts, in the specified
  /// regions.
  ///
  /// [stackSetName]: The name or unique ID of the stack set that you want to
  /// delete stack instances for.
  ///
  /// [accounts]: The names of the AWS accounts that you want to delete stack
  /// instances for.
  ///
  /// [regions]: The regions where you want to delete stack set instances.
  ///
  /// [operationPreferences]: Preferences for how AWS CloudFormation performs
  /// this stack set operation.
  ///
  /// [retainStacks]: Removes the stack instances from the specified stack set,
  /// but doesn't delete the stacks. You can't reassociate a retained stack or
  /// add an existing, saved stack to a new stack set.
  ///
  /// For more information, see
  /// [Stack set operation options](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-concepts.html#stackset-ops-options).
  ///
  /// [operationId]: The unique identifier for this stack set operation.
  ///
  /// If you don't specify an operation ID, the SDK generates one automatically.
  ///
  /// The operation ID also functions as an idempotency token, to ensure that
  /// AWS CloudFormation performs the stack set operation only once, even if you
  /// retry the request multiple times. You can retry stack set operation
  /// requests to ensure that AWS CloudFormation successfully received them.
  ///
  /// Repeating this stack set operation with a new operation ID retries all
  /// stack instances whose status is `OUTDATED`.
  Future<DeleteStackInstancesOutput> deleteStackInstances(
      {@required String stackSetName,
      @required List<String> accounts,
      @required List<String> regions,
      StackSetOperationPreferences operationPreferences,
      @required bool retainStacks,
      String operationId}) async {
    var response_ = await _client.send('DeleteStackInstances', {
      'StackSetName': stackSetName,
      'Accounts': accounts,
      'Regions': regions,
      if (operationPreferences != null)
        'OperationPreferences': operationPreferences,
      'RetainStacks': retainStacks,
      if (operationId != null) 'OperationId': operationId,
    });
    return DeleteStackInstancesOutput.fromJson(response_);
  }

  /// Deletes a stack set. Before you can delete a stack set, all of its member
  /// stack instances must be deleted. For more information about how to do
  /// this, see DeleteStackInstances.
  ///
  /// [stackSetName]: The name or unique ID of the stack set that you're
  /// deleting. You can obtain this value by running ListStackSets.
  Future<DeleteStackSetOutput> deleteStackSet(String stackSetName) async {
    var response_ = await _client.send('DeleteStackSet', {
      'StackSetName': stackSetName,
    });
    return DeleteStackSetOutput.fromJson(response_);
  }

  /// Retrieves your account's AWS CloudFormation limits, such as the maximum
  /// number of stacks that you can create in your account. For more information
  /// about account limits, see
  /// [AWS CloudFormation Limits](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/cloudformation-limits.html)
  /// in the _AWS CloudFormation User Guide_.
  ///
  /// [nextToken]: A string that identifies the next page of limits that you
  /// want to retrieve.
  Future<DescribeAccountLimitsOutput> describeAccountLimits(
      {String nextToken}) async {
    var response_ = await _client.send('DescribeAccountLimits', {
      if (nextToken != null) 'NextToken': nextToken,
    });
    return DescribeAccountLimitsOutput.fromJson(response_);
  }

  /// Returns the inputs for the change set and a list of changes that AWS
  /// CloudFormation will make if you execute the change set. For more
  /// information, see
  /// [Updating Stacks Using Change Sets](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-updating-stacks-changesets.html)
  /// in the AWS CloudFormation User Guide.
  ///
  /// [changeSetName]: The name or Amazon Resource Name (ARN) of the change set
  /// that you want to describe.
  ///
  /// [stackName]: If you specified the name of a change set, specify the stack
  /// name or ID (ARN) of the change set you want to describe.
  ///
  /// [nextToken]: A string (provided by the DescribeChangeSet response output)
  /// that identifies the next page of information that you want to retrieve.
  Future<DescribeChangeSetOutput> describeChangeSet(String changeSetName,
      {String stackName, String nextToken}) async {
    var response_ = await _client.send('DescribeChangeSet', {
      'ChangeSetName': changeSetName,
      if (stackName != null) 'StackName': stackName,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return DescribeChangeSetOutput.fromJson(response_);
  }

  /// Returns information about a stack drift detection operation. A stack drift
  /// detection operation detects whether a stack's actual configuration
  /// differs, or has _drifted_, from it's expected configuration, as defined in
  /// the stack template and any values specified as template parameters. A
  /// stack is considered to have drifted if one or more of its resources have
  /// drifted. For more information on stack and resource drift, see
  /// [Detecting Unregulated Configuration Changes to Stacks and Resources](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html).
  ///
  /// Use DetectStackDrift to initiate a stack drift detection operation.
  /// `DetectStackDrift` returns a `StackDriftDetectionId` you can use to
  /// monitor the progress of the operation using
  /// `DescribeStackDriftDetectionStatus`. Once the drift detection operation
  /// has completed, use DescribeStackResourceDrifts to return drift information
  /// about the stack and its resources.
  ///
  /// [stackDriftDetectionId]: The ID of the drift detection results of this
  /// operation.
  ///
  /// AWS CloudFormation generates new results, with a new drift detection ID,
  /// each time this operation is run. However, the number of drift results AWS
  /// CloudFormation retains for any given stack, and for how long, may vary.
  Future<DescribeStackDriftDetectionStatusOutput>
      describeStackDriftDetectionStatus(String stackDriftDetectionId) async {
    var response_ = await _client.send('DescribeStackDriftDetectionStatus', {
      'StackDriftDetectionId': stackDriftDetectionId,
    });
    return DescribeStackDriftDetectionStatusOutput.fromJson(response_);
  }

  /// Returns all stack related events for a specified stack in reverse
  /// chronological order. For more information about a stack's event history,
  /// go to
  /// [Stacks](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/concept-stack.html)
  /// in the AWS CloudFormation User Guide.
  ///
  ///
  ///
  /// You can list events for stacks that have failed to create or have been
  /// deleted by specifying the unique stack identifier (stack ID).
  ///
  /// [stackName]: The name or the unique stack ID that is associated with the
  /// stack, which are not always interchangeable:
  ///
  /// *   Running stacks: You can specify either the stack's name or its unique
  /// stack ID.
  ///
  /// *   Deleted stacks: You must specify the unique stack ID.
  ///
  ///
  /// Default: There is no default value.
  ///
  /// [nextToken]: A string that identifies the next page of events that you
  /// want to retrieve.
  Future<DescribeStackEventsOutput> describeStackEvents(
      {String stackName, String nextToken}) async {
    var response_ = await _client.send('DescribeStackEvents', {
      if (stackName != null) 'StackName': stackName,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return DescribeStackEventsOutput.fromJson(response_);
  }

  /// Returns the stack instance that's associated with the specified stack set,
  /// AWS account, and region.
  ///
  /// For a list of stack instances that are associated with a specific stack
  /// set, use ListStackInstances.
  ///
  /// [stackSetName]: The name or the unique stack ID of the stack set that you
  /// want to get stack instance information for.
  ///
  /// [stackInstanceAccount]: The ID of an AWS account that's associated with
  /// this stack instance.
  ///
  /// [stackInstanceRegion]: The name of a region that's associated with this
  /// stack instance.
  Future<DescribeStackInstanceOutput> describeStackInstance(
      {@required String stackSetName,
      @required String stackInstanceAccount,
      @required String stackInstanceRegion}) async {
    var response_ = await _client.send('DescribeStackInstance', {
      'StackSetName': stackSetName,
      'StackInstanceAccount': stackInstanceAccount,
      'StackInstanceRegion': stackInstanceRegion,
    });
    return DescribeStackInstanceOutput.fromJson(response_);
  }

  /// Returns a description of the specified resource in the specified stack.
  ///
  /// For deleted stacks, DescribeStackResource returns resource information for
  /// up to 90 days after the stack has been deleted.
  ///
  /// [stackName]: The name or the unique stack ID that is associated with the
  /// stack, which are not always interchangeable:
  ///
  /// *   Running stacks: You can specify either the stack's name or its unique
  /// stack ID.
  ///
  /// *   Deleted stacks: You must specify the unique stack ID.
  ///
  ///
  /// Default: There is no default value.
  ///
  /// [logicalResourceId]: The logical name of the resource as specified in the
  /// template.
  ///
  /// Default: There is no default value.
  Future<DescribeStackResourceOutput> describeStackResource(
      {@required String stackName, @required String logicalResourceId}) async {
    var response_ = await _client.send('DescribeStackResource', {
      'StackName': stackName,
      'LogicalResourceId': logicalResourceId,
    });
    return DescribeStackResourceOutput.fromJson(response_);
  }

  /// Returns drift information for the resources that have been checked for
  /// drift in the specified stack. This includes actual and expected
  /// configuration values for resources where AWS CloudFormation detects
  /// configuration drift.
  ///
  /// For a given stack, there will be one `StackResourceDrift` for each stack
  /// resource that has been checked for drift. Resources that have not yet been
  /// checked for drift are not included. Resources that do not currently
  /// support drift detection are not checked, and so not included. For a list
  /// of resources that support drift detection, see
  /// [Resources that Support Drift Detection](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift-resource-list.html).
  ///
  /// Use DetectStackResourceDrift to detect drift on individual resources, or
  /// DetectStackDrift to detect drift on all supported resources for a given
  /// stack.
  ///
  /// [stackName]: The name of the stack for which you want drift information.
  ///
  /// [stackResourceDriftStatusFilters]: The resource drift status values to use
  /// as filters for the resource drift results returned.
  ///
  /// *    `DELETED`: The resource differs from its expected template
  /// configuration in that the resource has been deleted.
  ///
  /// *    `MODIFIED`: One or more resource properties differ from their
  /// expected template values.
  ///
  /// *    `IN_SYNC`: The resources's actual configuration matches its expected
  /// template configuration.
  ///
  /// *    `NOT_CHECKED`: AWS CloudFormation does not currently return this
  /// value.
  ///
  /// [nextToken]: A string that identifies the next page of stack resource
  /// drift results.
  ///
  /// [maxResults]: The maximum number of results to be returned with a single
  /// call. If the number of available results exceeds this maximum, the
  /// response includes a `NextToken` value that you can assign to the
  /// `NextToken` request parameter to get the next set of results.
  Future<DescribeStackResourceDriftsOutput> describeStackResourceDrifts(
      String stackName,
      {List<String> stackResourceDriftStatusFilters,
      String nextToken,
      int maxResults}) async {
    var response_ = await _client.send('DescribeStackResourceDrifts', {
      'StackName': stackName,
      if (stackResourceDriftStatusFilters != null)
        'StackResourceDriftStatusFilters': stackResourceDriftStatusFilters,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return DescribeStackResourceDriftsOutput.fromJson(response_);
  }

  /// Returns AWS resource descriptions for running and deleted stacks. If
  /// `StackName` is specified, all the associated resources that are part of
  /// the stack are returned. If `PhysicalResourceId` is specified, the
  /// associated resources of the stack that the resource belongs to are
  /// returned.
  ///
  ///  Only the first 100 resources will be returned. If your stack has more
  /// resources than this, you should use `ListStackResources` instead.
  ///
  /// For deleted stacks, `DescribeStackResources` returns resource information
  /// for up to 90 days after the stack has been deleted.
  ///
  /// You must specify either `StackName` or `PhysicalResourceId`, but not both.
  /// In addition, you can specify `LogicalResourceId` to filter the returned
  /// result. For more information about resources, the `LogicalResourceId` and
  /// `PhysicalResourceId`, go to the
  /// [AWS CloudFormation User Guide](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/).
  ///
  ///
  ///
  /// A `ValidationError` is returned if you specify both `StackName` and
  /// `PhysicalResourceId` in the same request.
  ///
  /// [stackName]: The name or the unique stack ID that is associated with the
  /// stack, which are not always interchangeable:
  ///
  /// *   Running stacks: You can specify either the stack's name or its unique
  /// stack ID.
  ///
  /// *   Deleted stacks: You must specify the unique stack ID.
  ///
  ///
  /// Default: There is no default value.
  ///
  /// Required: Conditional. If you do not specify `StackName`, you must specify
  /// `PhysicalResourceId`.
  ///
  /// [logicalResourceId]: The logical name of the resource as specified in the
  /// template.
  ///
  /// Default: There is no default value.
  ///
  /// [physicalResourceId]: The name or unique identifier that corresponds to a
  /// physical instance ID of a resource supported by AWS CloudFormation.
  ///
  /// For example, for an Amazon Elastic Compute Cloud (EC2) instance,
  /// `PhysicalResourceId` corresponds to the `InstanceId`. You can pass the EC2
  /// `InstanceId` to `DescribeStackResources` to find which stack the instance
  /// belongs to and what other resources are part of the stack.
  ///
  /// Required: Conditional. If you do not specify `PhysicalResourceId`, you
  /// must specify `StackName`.
  ///
  /// Default: There is no default value.
  Future<DescribeStackResourcesOutput> describeStackResources(
      {String stackName,
      String logicalResourceId,
      String physicalResourceId}) async {
    var response_ = await _client.send('DescribeStackResources', {
      if (stackName != null) 'StackName': stackName,
      if (logicalResourceId != null) 'LogicalResourceId': logicalResourceId,
      if (physicalResourceId != null) 'PhysicalResourceId': physicalResourceId,
    });
    return DescribeStackResourcesOutput.fromJson(response_);
  }

  /// Returns the description of the specified stack set.
  ///
  /// [stackSetName]: The name or unique ID of the stack set whose description
  /// you want.
  Future<DescribeStackSetOutput> describeStackSet(String stackSetName) async {
    var response_ = await _client.send('DescribeStackSet', {
      'StackSetName': stackSetName,
    });
    return DescribeStackSetOutput.fromJson(response_);
  }

  /// Returns the description of the specified stack set operation.
  ///
  /// [stackSetName]: The name or the unique stack ID of the stack set for the
  /// stack operation.
  ///
  /// [operationId]: The unique ID of the stack set operation.
  Future<DescribeStackSetOperationOutput> describeStackSetOperation(
      {@required String stackSetName, @required String operationId}) async {
    var response_ = await _client.send('DescribeStackSetOperation', {
      'StackSetName': stackSetName,
      'OperationId': operationId,
    });
    return DescribeStackSetOperationOutput.fromJson(response_);
  }

  /// Returns the description for the specified stack; if no stack name was
  /// specified, then it returns the description for all the stacks created.
  ///
  ///
  ///
  /// If the stack does not exist, an `AmazonCloudFormationException` is
  /// returned.
  ///
  /// [stackName]: The name or the unique stack ID that is associated with the
  /// stack, which are not always interchangeable:
  ///
  /// *   Running stacks: You can specify either the stack's name or its unique
  /// stack ID.
  ///
  /// *   Deleted stacks: You must specify the unique stack ID.
  ///
  ///
  /// Default: There is no default value.
  ///
  /// [nextToken]: A string that identifies the next page of stacks that you
  /// want to retrieve.
  Future<DescribeStacksOutput> describeStacks(
      {String stackName, String nextToken}) async {
    var response_ = await _client.send('DescribeStacks', {
      if (stackName != null) 'StackName': stackName,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return DescribeStacksOutput.fromJson(response_);
  }

  /// Detects whether a stack's actual configuration differs, or has _drifted_,
  /// from it's expected configuration, as defined in the stack template and any
  /// values specified as template parameters. For each resource in the stack
  /// that supports drift detection, AWS CloudFormation compares the actual
  /// configuration of the resource with its expected template configuration.
  /// Only resource properties explicitly defined in the stack template are
  /// checked for drift. A stack is considered to have drifted if one or more of
  /// its resources differ from their expected template configurations. For more
  /// information, see
  /// [Detecting Unregulated Configuration Changes to Stacks and Resources](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html).
  ///
  /// Use `DetectStackDrift` to detect drift on all supported resources for a
  /// given stack, or DetectStackResourceDrift to detect drift on individual
  /// resources.
  ///
  /// For a list of stack resources that currently support drift detection, see
  /// [Resources that Support Drift Detection](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift-resource-list.html).
  ///
  ///  `DetectStackDrift` can take up to several minutes, depending on the
  /// number of resources contained within the stack. Use
  /// DescribeStackDriftDetectionStatus to monitor the progress of a detect
  /// stack drift operation. Once the drift detection operation has completed,
  /// use DescribeStackResourceDrifts to return drift information about the
  /// stack and its resources.
  ///
  /// When detecting drift on a stack, AWS CloudFormation does not detect drift
  /// on any nested stacks belonging to that stack. Perform `DetectStackDrift`
  /// directly on the nested stack itself.
  ///
  /// [stackName]: The name of the stack for which you want to detect drift.
  ///
  /// [logicalResourceIds]: The logical names of any resources you want to use
  /// as filters.
  Future<DetectStackDriftOutput> detectStackDrift(String stackName,
      {List<String> logicalResourceIds}) async {
    var response_ = await _client.send('DetectStackDrift', {
      'StackName': stackName,
      if (logicalResourceIds != null) 'LogicalResourceIds': logicalResourceIds,
    });
    return DetectStackDriftOutput.fromJson(response_);
  }

  /// Returns information about whether a resource's actual configuration
  /// differs, or has _drifted_, from it's expected configuration, as defined in
  /// the stack template and any values specified as template parameters. This
  /// information includes actual and expected property values for resources in
  /// which AWS CloudFormation detects drift. Only resource properties
  /// explicitly defined in the stack template are checked for drift. For more
  /// information about stack and resource drift, see
  /// [Detecting Unregulated Configuration Changes to Stacks and Resources](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html).
  ///
  /// Use `DetectStackResourceDrift` to detect drift on individual resources, or
  /// DetectStackDrift to detect drift on all resources in a given stack that
  /// support drift detection.
  ///
  /// Resources that do not currently support drift detection cannot be checked.
  /// For a list of resources that support drift detection, see
  /// [Resources that Support Drift Detection](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift-resource-list.html).
  ///
  /// [stackName]: The name of the stack to which the resource belongs.
  ///
  /// [logicalResourceId]: The logical name of the resource for which to return
  /// drift information.
  Future<DetectStackResourceDriftOutput> detectStackResourceDrift(
      {@required String stackName, @required String logicalResourceId}) async {
    var response_ = await _client.send('DetectStackResourceDrift', {
      'StackName': stackName,
      'LogicalResourceId': logicalResourceId,
    });
    return DetectStackResourceDriftOutput.fromJson(response_);
  }

  /// Returns the estimated monthly cost of a template. The return value is an
  /// AWS Simple Monthly Calculator URL with a query string that describes the
  /// resources required to run the template.
  ///
  /// [templateBody]: Structure containing the template body with a minimum
  /// length of 1 byte and a maximum length of 51,200 bytes. (For more
  /// information, go to
  /// [Template Anatomy](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html)
  /// in the AWS CloudFormation User Guide.)
  ///
  /// Conditional: You must pass `TemplateBody` or `TemplateURL`. If both are
  /// passed, only `TemplateBody` is used.
  ///
  /// [templateUrl]: Location of file containing the template body. The URL must
  /// point to a template that is located in an Amazon S3 bucket. For more
  /// information, go to
  /// [Template Anatomy](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html)
  /// in the AWS CloudFormation User Guide.
  ///
  /// Conditional: You must pass `TemplateURL` or `TemplateBody`. If both are
  /// passed, only `TemplateBody` is used.
  ///
  /// [parameters]: A list of `Parameter` structures that specify input
  /// parameters.
  Future<EstimateTemplateCostOutput> estimateTemplateCost(
      {String templateBody,
      String templateUrl,
      List<Parameter> parameters}) async {
    var response_ = await _client.send('EstimateTemplateCost', {
      if (templateBody != null) 'TemplateBody': templateBody,
      if (templateUrl != null) 'TemplateURL': templateUrl,
      if (parameters != null) 'Parameters': parameters,
    });
    return EstimateTemplateCostOutput.fromJson(response_);
  }

  /// Updates a stack using the input information that was provided when the
  /// specified change set was created. After the call successfully completes,
  /// AWS CloudFormation starts updating the stack. Use the DescribeStacks
  /// action to view the status of the update.
  ///
  /// When you execute a change set, AWS CloudFormation deletes all other change
  /// sets associated with the stack because they aren't valid for the updated
  /// stack.
  ///
  /// If a stack policy is associated with the stack, AWS CloudFormation
  /// enforces the policy during the update. You can't specify a temporary stack
  /// policy that overrides the current policy.
  ///
  /// [changeSetName]: The name or ARN of the change set that you want use to
  /// update the specified stack.
  ///
  /// [stackName]: If you specified the name of a change set, specify the stack
  /// name or ID (ARN) that is associated with the change set you want to
  /// execute.
  ///
  /// [clientRequestToken]: A unique identifier for this `ExecuteChangeSet`
  /// request. Specify this token if you plan to retry requests so that AWS
  /// CloudFormation knows that you're not attempting to execute a change set to
  /// update a stack with the same name. You might retry `ExecuteChangeSet`
  /// requests to ensure that AWS CloudFormation successfully received them.
  Future<ExecuteChangeSetOutput> executeChangeSet(String changeSetName,
      {String stackName, String clientRequestToken}) async {
    var response_ = await _client.send('ExecuteChangeSet', {
      'ChangeSetName': changeSetName,
      if (stackName != null) 'StackName': stackName,
      if (clientRequestToken != null) 'ClientRequestToken': clientRequestToken,
    });
    return ExecuteChangeSetOutput.fromJson(response_);
  }

  /// Returns the stack policy for a specified stack. If a stack doesn't have a
  /// policy, a null value is returned.
  ///
  /// [stackName]: The name or unique stack ID that is associated with the stack
  /// whose policy you want to get.
  Future<GetStackPolicyOutput> getStackPolicy(String stackName) async {
    var response_ = await _client.send('GetStackPolicy', {
      'StackName': stackName,
    });
    return GetStackPolicyOutput.fromJson(response_);
  }

  /// Returns the template body for a specified stack. You can get the template
  /// for running or deleted stacks.
  ///
  /// For deleted stacks, GetTemplate returns the template for up to 90 days
  /// after the stack has been deleted.
  ///
  ///   If the template does not exist, a `ValidationError` is returned.
  ///
  /// [stackName]: The name or the unique stack ID that is associated with the
  /// stack, which are not always interchangeable:
  ///
  /// *   Running stacks: You can specify either the stack's name or its unique
  /// stack ID.
  ///
  /// *   Deleted stacks: You must specify the unique stack ID.
  ///
  ///
  /// Default: There is no default value.
  ///
  /// [changeSetName]: The name or Amazon Resource Name (ARN) of a change set
  /// for which AWS CloudFormation returns the associated template. If you
  /// specify a name, you must also specify the `StackName`.
  ///
  /// [templateStage]: For templates that include transforms, the stage of the
  /// template that AWS CloudFormation returns. To get the user-submitted
  /// template, specify `Original`. To get the template after AWS CloudFormation
  /// has processed all transforms, specify `Processed`.
  ///
  /// If the template doesn't include transforms, `Original` and `Processed`
  /// return the same template. By default, AWS CloudFormation specifies
  /// `Original`.
  Future<GetTemplateOutput> getTemplate(
      {String stackName, String changeSetName, String templateStage}) async {
    var response_ = await _client.send('GetTemplate', {
      if (stackName != null) 'StackName': stackName,
      if (changeSetName != null) 'ChangeSetName': changeSetName,
      if (templateStage != null) 'TemplateStage': templateStage,
    });
    return GetTemplateOutput.fromJson(response_);
  }

  /// Returns information about a new or existing template. The
  /// `GetTemplateSummary` action is useful for viewing parameter information,
  /// such as default parameter values and parameter types, before you create or
  /// update a stack or stack set.
  ///
  /// You can use the `GetTemplateSummary` action when you submit a template, or
  /// you can get template information for a stack set, or a running or deleted
  /// stack.
  ///
  /// For deleted stacks, `GetTemplateSummary` returns the template information
  /// for up to 90 days after the stack has been deleted. If the template does
  /// not exist, a `ValidationError` is returned.
  ///
  /// [templateBody]: Structure containing the template body with a minimum
  /// length of 1 byte and a maximum length of 51,200 bytes. For more
  /// information about templates, see
  /// [Template Anatomy](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html)
  /// in the AWS CloudFormation User Guide.
  ///
  /// Conditional: You must specify only one of the following parameters:
  /// `StackName`, `StackSetName`, `TemplateBody`, or `TemplateURL`.
  ///
  /// [templateUrl]: Location of file containing the template body. The URL must
  /// point to a template (max size: 460,800 bytes) that is located in an Amazon
  /// S3 bucket. For more information about templates, see
  /// [Template Anatomy](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html)
  /// in the AWS CloudFormation User Guide.
  ///
  /// Conditional: You must specify only one of the following parameters:
  /// `StackName`, `StackSetName`, `TemplateBody`, or `TemplateURL`.
  ///
  /// [stackName]: The name or the stack ID that is associated with the stack,
  /// which are not always interchangeable. For running stacks, you can specify
  /// either the stack's name or its unique stack ID. For deleted stack, you
  /// must specify the unique stack ID.
  ///
  /// Conditional: You must specify only one of the following parameters:
  /// `StackName`, `StackSetName`, `TemplateBody`, or `TemplateURL`.
  ///
  /// [stackSetName]: The name or unique ID of the stack set from which the
  /// stack was created.
  ///
  /// Conditional: You must specify only one of the following parameters:
  /// `StackName`, `StackSetName`, `TemplateBody`, or `TemplateURL`.
  Future<GetTemplateSummaryOutput> getTemplateSummary(
      {String templateBody,
      String templateUrl,
      String stackName,
      String stackSetName}) async {
    var response_ = await _client.send('GetTemplateSummary', {
      if (templateBody != null) 'TemplateBody': templateBody,
      if (templateUrl != null) 'TemplateURL': templateUrl,
      if (stackName != null) 'StackName': stackName,
      if (stackSetName != null) 'StackSetName': stackSetName,
    });
    return GetTemplateSummaryOutput.fromJson(response_);
  }

  /// Returns the ID and status of each active change set for a stack. For
  /// example, AWS CloudFormation lists change sets that are in the
  /// `CREATE_IN_PROGRESS` or `CREATE_PENDING` state.
  ///
  /// [stackName]: The name or the Amazon Resource Name (ARN) of the stack for
  /// which you want to list change sets.
  ///
  /// [nextToken]: A string (provided by the ListChangeSets response output)
  /// that identifies the next page of change sets that you want to retrieve.
  Future<ListChangeSetsOutput> listChangeSets(String stackName,
      {String nextToken}) async {
    var response_ = await _client.send('ListChangeSets', {
      'StackName': stackName,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListChangeSetsOutput.fromJson(response_);
  }

  /// Lists all exported output values in the account and region in which you
  /// call this action. Use this action to see the exported output values that
  /// you can import into other stacks. To import values, use the
  /// [`Fn::ImportValue`](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-importvalue.html)
  ///  function.
  ///
  /// For more information, see
  /// [AWS CloudFormation Export Stack Output Values](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-exports.html).
  ///
  /// [nextToken]: A string (provided by the ListExports response output) that
  /// identifies the next page of exported output values that you asked to
  /// retrieve.
  Future<ListExportsOutput> listExports({String nextToken}) async {
    var response_ = await _client.send('ListExports', {
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListExportsOutput.fromJson(response_);
  }

  /// Lists all stacks that are importing an exported output value. To modify or
  /// remove an exported output value, first use this action to see which stacks
  /// are using it. To see the exported output values in your account, see
  /// ListExports.
  ///
  /// For more information about importing an exported output value, see the
  /// [`Fn::ImportValue`](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-importvalue.html)
  ///  function.
  ///
  /// [exportName]: The name of the exported output value. AWS CloudFormation
  /// returns the stack names that are importing this value.
  ///
  /// [nextToken]: A string (provided by the ListImports response output) that
  /// identifies the next page of stacks that are importing the specified
  /// exported output value.
  Future<ListImportsOutput> listImports(String exportName,
      {String nextToken}) async {
    var response_ = await _client.send('ListImports', {
      'ExportName': exportName,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListImportsOutput.fromJson(response_);
  }

  /// Returns summary information about stack instances that are associated with
  /// the specified stack set. You can filter for stack instances that are
  /// associated with a specific AWS account name or region.
  ///
  /// [stackSetName]: The name or unique ID of the stack set that you want to
  /// list stack instances for.
  ///
  /// [nextToken]: If the previous request didn't return all of the remaining
  /// results, the response's `NextToken` parameter value is set to a token. To
  /// retrieve the next set of results, call `ListStackInstances` again and
  /// assign that token to the request object's `NextToken` parameter. If there
  /// are no remaining results, the previous response object's `NextToken`
  /// parameter is set to `null`.
  ///
  /// [maxResults]: The maximum number of results to be returned with a single
  /// call. If the number of available results exceeds this maximum, the
  /// response includes a `NextToken` value that you can assign to the
  /// `NextToken` request parameter to get the next set of results.
  ///
  /// [stackInstanceAccount]: The name of the AWS account that you want to list
  /// stack instances for.
  ///
  /// [stackInstanceRegion]: The name of the region where you want to list stack
  /// instances.
  Future<ListStackInstancesOutput> listStackInstances(String stackSetName,
      {String nextToken,
      int maxResults,
      String stackInstanceAccount,
      String stackInstanceRegion}) async {
    var response_ = await _client.send('ListStackInstances', {
      'StackSetName': stackSetName,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
      if (stackInstanceAccount != null)
        'StackInstanceAccount': stackInstanceAccount,
      if (stackInstanceRegion != null)
        'StackInstanceRegion': stackInstanceRegion,
    });
    return ListStackInstancesOutput.fromJson(response_);
  }

  /// Returns descriptions of all resources of the specified stack.
  ///
  /// For deleted stacks, ListStackResources returns resource information for up
  /// to 90 days after the stack has been deleted.
  ///
  /// [stackName]: The name or the unique stack ID that is associated with the
  /// stack, which are not always interchangeable:
  ///
  /// *   Running stacks: You can specify either the stack's name or its unique
  /// stack ID.
  ///
  /// *   Deleted stacks: You must specify the unique stack ID.
  ///
  ///
  /// Default: There is no default value.
  ///
  /// [nextToken]: A string that identifies the next page of stack resources
  /// that you want to retrieve.
  Future<ListStackResourcesOutput> listStackResources(String stackName,
      {String nextToken}) async {
    var response_ = await _client.send('ListStackResources', {
      'StackName': stackName,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListStackResourcesOutput.fromJson(response_);
  }

  /// Returns summary information about the results of a stack set operation.
  ///
  /// [stackSetName]: The name or unique ID of the stack set that you want to
  /// get operation results for.
  ///
  /// [operationId]: The ID of the stack set operation.
  ///
  /// [nextToken]: If the previous request didn't return all of the remaining
  /// results, the response object's `NextToken` parameter value is set to a
  /// token. To retrieve the next set of results, call
  /// `ListStackSetOperationResults` again and assign that token to the request
  /// object's `NextToken` parameter. If there are no remaining results, the
  /// previous response object's `NextToken` parameter is set to `null`.
  ///
  /// [maxResults]: The maximum number of results to be returned with a single
  /// call. If the number of available results exceeds this maximum, the
  /// response includes a `NextToken` value that you can assign to the
  /// `NextToken` request parameter to get the next set of results.
  Future<ListStackSetOperationResultsOutput> listStackSetOperationResults(
      {@required String stackSetName,
      @required String operationId,
      String nextToken,
      int maxResults}) async {
    var response_ = await _client.send('ListStackSetOperationResults', {
      'StackSetName': stackSetName,
      'OperationId': operationId,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return ListStackSetOperationResultsOutput.fromJson(response_);
  }

  /// Returns summary information about operations performed on a stack set.
  ///
  /// [stackSetName]: The name or unique ID of the stack set that you want to
  /// get operation summaries for.
  ///
  /// [nextToken]: If the previous paginated request didn't return all of the
  /// remaining results, the response object's `NextToken` parameter value is
  /// set to a token. To retrieve the next set of results, call
  /// `ListStackSetOperations` again and assign that token to the request
  /// object's `NextToken` parameter. If there are no remaining results, the
  /// previous response object's `NextToken` parameter is set to `null`.
  ///
  /// [maxResults]: The maximum number of results to be returned with a single
  /// call. If the number of available results exceeds this maximum, the
  /// response includes a `NextToken` value that you can assign to the
  /// `NextToken` request parameter to get the next set of results.
  Future<ListStackSetOperationsOutput> listStackSetOperations(
      String stackSetName,
      {String nextToken,
      int maxResults}) async {
    var response_ = await _client.send('ListStackSetOperations', {
      'StackSetName': stackSetName,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return ListStackSetOperationsOutput.fromJson(response_);
  }

  /// Returns summary information about stack sets that are associated with the
  /// user.
  ///
  /// [nextToken]: If the previous paginated request didn't return all of the
  /// remaining results, the response object's `NextToken` parameter value is
  /// set to a token. To retrieve the next set of results, call `ListStackSets`
  /// again and assign that token to the request object's `NextToken` parameter.
  /// If there are no remaining results, the previous response object's
  /// `NextToken` parameter is set to `null`.
  ///
  /// [maxResults]: The maximum number of results to be returned with a single
  /// call. If the number of available results exceeds this maximum, the
  /// response includes a `NextToken` value that you can assign to the
  /// `NextToken` request parameter to get the next set of results.
  ///
  /// [status]: The status of the stack sets that you want to get summary
  /// information about.
  Future<ListStackSetsOutput> listStackSets(
      {String nextToken, int maxResults, String status}) async {
    var response_ = await _client.send('ListStackSets', {
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
      if (status != null) 'Status': status,
    });
    return ListStackSetsOutput.fromJson(response_);
  }

  /// Returns the summary information for stacks whose status matches the
  /// specified StackStatusFilter. Summary information for stacks that have been
  /// deleted is kept for 90 days after the stack is deleted. If no
  /// StackStatusFilter is specified, summary information for all stacks is
  /// returned (including existing stacks and stacks that have been deleted).
  ///
  /// [nextToken]: A string that identifies the next page of stacks that you
  /// want to retrieve.
  ///
  /// [stackStatusFilter]: Stack status to use as a filter. Specify one or more
  /// stack status codes to list only stacks with the specified status codes.
  /// For a complete list of stack status codes, see the `StackStatus` parameter
  /// of the Stack data type.
  Future<ListStacksOutput> listStacks(
      {String nextToken, List<String> stackStatusFilter}) async {
    var response_ = await _client.send('ListStacks', {
      if (nextToken != null) 'NextToken': nextToken,
      if (stackStatusFilter != null) 'StackStatusFilter': stackStatusFilter,
    });
    return ListStacksOutput.fromJson(response_);
  }

  /// Sets a stack policy for a specified stack.
  ///
  /// [stackName]: The name or unique stack ID that you want to associate a
  /// policy with.
  ///
  /// [stackPolicyBody]: Structure containing the stack policy body. For more
  /// information, go to
  /// [Prevent Updates to Stack Resources](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/protect-stack-resources.html)
  /// in the AWS CloudFormation User Guide. You can specify either the
  /// `StackPolicyBody` or the `StackPolicyURL` parameter, but not both.
  ///
  /// [stackPolicyUrl]: Location of a file containing the stack policy. The URL
  /// must point to a policy (maximum size: 16 KB) located in an S3 bucket in
  /// the same region as the stack. You can specify either the `StackPolicyBody`
  /// or the `StackPolicyURL` parameter, but not both.
  Future<void> setStackPolicy(String stackName,
      {String stackPolicyBody, String stackPolicyUrl}) async {
    await _client.send('SetStackPolicy', {
      'StackName': stackName,
      if (stackPolicyBody != null) 'StackPolicyBody': stackPolicyBody,
      if (stackPolicyUrl != null) 'StackPolicyURL': stackPolicyUrl,
    });
  }

  /// Sends a signal to the specified resource with a success or failure status.
  /// You can use the SignalResource API in conjunction with a creation policy
  /// or update policy. AWS CloudFormation doesn't proceed with a stack creation
  /// or update until resources receive the required number of signals or the
  /// timeout period is exceeded. The SignalResource API is useful in cases
  /// where you want to send signals from anywhere other than an Amazon EC2
  /// instance.
  ///
  /// [stackName]: The stack name or unique stack ID that includes the resource
  /// that you want to signal.
  ///
  /// [logicalResourceId]: The logical ID of the resource that you want to
  /// signal. The logical ID is the name of the resource that given in the
  /// template.
  ///
  /// [uniqueId]: A unique ID of the signal. When you signal Amazon EC2
  /// instances or Auto Scaling groups, specify the instance ID that you are
  /// signaling as the unique ID. If you send multiple signals to a single
  /// resource (such as signaling a wait condition), each signal requires a
  /// different unique ID.
  ///
  /// [status]: The status of the signal, which is either success or failure. A
  /// failure signal causes AWS CloudFormation to immediately fail the stack
  /// creation or update.
  Future<void> signalResource(
      {@required String stackName,
      @required String logicalResourceId,
      @required String uniqueId,
      @required String status}) async {
    await _client.send('SignalResource', {
      'StackName': stackName,
      'LogicalResourceId': logicalResourceId,
      'UniqueId': uniqueId,
      'Status': status,
    });
  }

  /// Stops an in-progress operation on a stack set and its associated stack
  /// instances.
  ///
  /// [stackSetName]: The name or unique ID of the stack set that you want to
  /// stop the operation for.
  ///
  /// [operationId]: The ID of the stack operation.
  Future<StopStackSetOperationOutput> stopStackSetOperation(
      {@required String stackSetName, @required String operationId}) async {
    var response_ = await _client.send('StopStackSetOperation', {
      'StackSetName': stackSetName,
      'OperationId': operationId,
    });
    return StopStackSetOperationOutput.fromJson(response_);
  }

  /// Updates a stack as specified in the template. After the call completes
  /// successfully, the stack update starts. You can check the status of the
  /// stack via the DescribeStacks action.
  ///
  /// To get a copy of the template for an existing stack, you can use the
  /// GetTemplate action.
  ///
  /// For more information about creating an update template, updating a stack,
  /// and monitoring the progress of the update, see
  /// [Updating a Stack](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-updating-stacks.html).
  ///
  /// [stackName]: The name or unique stack ID of the stack to update.
  ///
  /// [templateBody]: Structure containing the template body with a minimum
  /// length of 1 byte and a maximum length of 51,200 bytes. (For more
  /// information, go to
  /// [Template Anatomy](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html)
  /// in the AWS CloudFormation User Guide.)
  ///
  /// Conditional: You must specify only one of the following parameters:
  /// `TemplateBody`, `TemplateURL`, or set the `UsePreviousTemplate` to `true`.
  ///
  /// [templateUrl]: Location of file containing the template body. The URL must
  /// point to a template that is located in an Amazon S3 bucket. For more
  /// information, go to
  /// [Template Anatomy](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html)
  /// in the AWS CloudFormation User Guide.
  ///
  /// Conditional: You must specify only one of the following parameters:
  /// `TemplateBody`, `TemplateURL`, or set the `UsePreviousTemplate` to `true`.
  ///
  /// [usePreviousTemplate]: Reuse the existing template that is associated with
  /// the stack that you are updating.
  ///
  /// Conditional: You must specify only one of the following parameters:
  /// `TemplateBody`, `TemplateURL`, or set the `UsePreviousTemplate` to `true`.
  ///
  /// [stackPolicyDuringUpdateBody]: Structure containing the temporary
  /// overriding stack policy body. You can specify either the
  /// `StackPolicyDuringUpdateBody` or the `StackPolicyDuringUpdateURL`
  /// parameter, but not both.
  ///
  /// If you want to update protected resources, specify a temporary overriding
  /// stack policy during this update. If you do not specify a stack policy, the
  /// current policy that is associated with the stack will be used.
  ///
  /// [stackPolicyDuringUpdateUrl]: Location of a file containing the temporary
  /// overriding stack policy. The URL must point to a policy (max size: 16KB)
  /// located in an S3 bucket in the same region as the stack. You can specify
  /// either the `StackPolicyDuringUpdateBody` or the
  /// `StackPolicyDuringUpdateURL` parameter, but not both.
  ///
  /// If you want to update protected resources, specify a temporary overriding
  /// stack policy during this update. If you do not specify a stack policy, the
  /// current policy that is associated with the stack will be used.
  ///
  /// [parameters]: A list of `Parameter` structures that specify input
  /// parameters for the stack. For more information, see the
  /// [Parameter](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_Parameter.html)
  /// data type.
  ///
  /// [capabilities]: In some cases, you must explicity acknowledge that your
  /// stack template contains certain capabilities in order for AWS
  /// CloudFormation to update the stack.
  ///
  /// *    `CAPABILITY_IAM` and `CAPABILITY_NAMED_IAM`
  ///
  ///     Some stack templates might include resources that can affect
  /// permissions in your AWS account; for example, by creating new AWS Identity
  /// and Access Management (IAM) users. For those stacks, you must explicitly
  /// acknowledge this by specifying one of these capabilities.
  ///
  ///     The following IAM resources require you to specify either the
  /// `CAPABILITY_IAM` or `CAPABILITY_NAMED_IAM` capability.
  ///
  ///     *   If you have IAM resources, you can specify either capability.
  ///
  ///     *   If you have IAM resources with custom names, you _must_ specify
  /// `CAPABILITY_NAMED_IAM`.
  ///
  ///     *   If you don't specify either of these capabilities, AWS
  /// CloudFormation returns an `InsufficientCapabilities` error.
  ///
  ///
  ///     If your stack template contains these resources, we recommend that you
  /// review all permissions associated with them and edit their permissions if
  /// necessary.
  ///
  ///     *
  /// [AWS::IAM::AccessKey](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-accesskey.html)
  ///
  ///     *
  /// [AWS::IAM::Group](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-group.html)
  ///
  ///     *
  /// [AWS::IAM::InstanceProfile](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-instanceprofile.html)
  ///
  ///     *
  /// [AWS::IAM::Policy](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-policy.html)
  ///
  ///     *
  /// [AWS::IAM::Role](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-role.html)
  ///
  ///     *
  /// [AWS::IAM::User](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-user.html)
  ///
  ///     *
  /// [AWS::IAM::UserToGroupAddition](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-addusertogroup.html)
  ///
  ///
  ///     For more information, see
  /// [Acknowledging IAM Resources in AWS CloudFormation Templates](http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-iam-template.html#capabilities).
  ///
  /// *    `CAPABILITY_AUTO_EXPAND`
  ///
  ///     Some template contain macros. Macros perform custom processing on
  /// templates; this can include simple actions like find-and-replace
  /// operations, all the way to extensive transformations of entire templates.
  /// Because of this, users typically create a change set from the processed
  /// template, so that they can review the changes resulting from the macros
  /// before actually updating the stack. If your stack template contains one or
  /// more macros, and you choose to update a stack directly from the processed
  /// template, without first reviewing the resulting changes in a change set,
  /// you must acknowledge this capability. This includes the
  /// [AWS::Include](http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/create-reusable-transform-function-snippets-and-add-to-your-template-with-aws-include-transform.html)
  /// and
  /// [AWS::Serverless](http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/transform-aws-serverless.html)
  /// transforms, which are macros hosted by AWS CloudFormation.
  ///
  ///     Change sets do not currently support nested stacks. If you want to
  /// update a stack from a stack template that contains macros _and_ nested
  /// stacks, you must update the stack directly from the template using this
  /// capability.
  ///
  ///      You should only update stacks directly from a stack template that
  /// contains macros if you know what processing the macro performs.
  ///
  ///     Each macro relies on an underlying Lambda service function for
  /// processing stack templates. Be aware that the Lambda function owner can
  /// update the function operation without AWS CloudFormation being notified.
  ///
  ///     For more information, see
  /// [Using AWS CloudFormation Macros to Perform Custom Processing on Templates](http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-macros.html).
  ///
  /// [resourceTypes]: The template resource types that you have permissions to
  /// work with for this update stack action, such as `AWS::EC2::Instance`,
  /// `AWS::EC2::*`, or `Custom::MyCustomInstance`.
  ///
  /// If the list of resource types doesn't include a resource that you're
  /// updating, the stack update fails. By default, AWS CloudFormation grants
  /// permissions to all resource types. AWS Identity and Access Management
  /// (IAM) uses this parameter for AWS CloudFormation-specific condition keys
  /// in IAM policies. For more information, see
  /// [Controlling Access with AWS Identity and Access Management](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-iam-template.html).
  ///
  /// [roleArn]: The Amazon Resource Name (ARN) of an AWS Identity and Access
  /// Management (IAM) role that AWS CloudFormation assumes to update the stack.
  /// AWS CloudFormation uses the role's credentials to make calls on your
  /// behalf. AWS CloudFormation always uses this role for all future operations
  /// on the stack. As long as users have permission to operate on the stack,
  /// AWS CloudFormation uses this role even if the users don't have permission
  /// to pass it. Ensure that the role grants least privilege.
  ///
  /// If you don't specify a value, AWS CloudFormation uses the role that was
  /// previously associated with the stack. If no role is available, AWS
  /// CloudFormation uses a temporary session that is generated from your user
  /// credentials.
  ///
  /// [rollbackConfiguration]: The rollback triggers for AWS CloudFormation to
  /// monitor during stack creation and updating operations, and for the
  /// specified monitoring period afterwards.
  ///
  /// [stackPolicyBody]: Structure containing a new stack policy body. You can
  /// specify either the `StackPolicyBody` or the `StackPolicyURL` parameter,
  /// but not both.
  ///
  /// You might update the stack policy, for example, in order to protect a new
  /// resource that you created during a stack update. If you do not specify a
  /// stack policy, the current policy that is associated with the stack is
  /// unchanged.
  ///
  /// [stackPolicyUrl]: Location of a file containing the updated stack policy.
  /// The URL must point to a policy (max size: 16KB) located in an S3 bucket in
  /// the same region as the stack. You can specify either the `StackPolicyBody`
  /// or the `StackPolicyURL` parameter, but not both.
  ///
  /// You might update the stack policy, for example, in order to protect a new
  /// resource that you created during a stack update. If you do not specify a
  /// stack policy, the current policy that is associated with the stack is
  /// unchanged.
  ///
  /// [notificationARNs]: Amazon Simple Notification Service topic Amazon
  /// Resource Names (ARNs) that AWS CloudFormation associates with the stack.
  /// Specify an empty list to remove all notification topics.
  ///
  /// [tags]: Key-value pairs to associate with this stack. AWS CloudFormation
  /// also propagates these tags to supported resources in the stack. You can
  /// specify a maximum number of 50 tags.
  ///
  /// If you don't specify this parameter, AWS CloudFormation doesn't modify the
  /// stack's tags. If you specify an empty value, AWS CloudFormation removes
  /// all associated tags.
  ///
  /// [clientRequestToken]: A unique identifier for this `UpdateStack` request.
  /// Specify this token if you plan to retry requests so that AWS
  /// CloudFormation knows that you're not attempting to update a stack with the
  /// same name. You might retry `UpdateStack` requests to ensure that AWS
  /// CloudFormation successfully received them.
  ///
  /// All events triggered by a given stack operation are assigned the same
  /// client request token, which you can use to track operations. For example,
  /// if you execute a `CreateStack` operation with the token `token1`, then all
  /// the `StackEvents` generated by that operation will have
  /// `ClientRequestToken` set as `token1`.
  ///
  /// In the console, stack operations display the client request token on the
  /// Events tab. Stack operations that are initiated from the console use the
  /// token format _Console-StackOperation-ID_, which helps you easily identify
  /// the stack operation . For example, if you create a stack using the
  /// console, each stack event would be assigned the same token in the
  /// following format:
  /// `Console-CreateStack-7f59c3cf-00d2-40c7-b2ff-e75db0987002`.
  Future<UpdateStackOutput> updateStack(String stackName,
      {String templateBody,
      String templateUrl,
      bool usePreviousTemplate,
      String stackPolicyDuringUpdateBody,
      String stackPolicyDuringUpdateUrl,
      List<Parameter> parameters,
      List<String> capabilities,
      List<String> resourceTypes,
      String roleArn,
      RollbackConfiguration rollbackConfiguration,
      String stackPolicyBody,
      String stackPolicyUrl,
      List<String> notificationARNs,
      List<Tag> tags,
      String clientRequestToken}) async {
    var response_ = await _client.send('UpdateStack', {
      'StackName': stackName,
      if (templateBody != null) 'TemplateBody': templateBody,
      if (templateUrl != null) 'TemplateURL': templateUrl,
      if (usePreviousTemplate != null)
        'UsePreviousTemplate': usePreviousTemplate,
      if (stackPolicyDuringUpdateBody != null)
        'StackPolicyDuringUpdateBody': stackPolicyDuringUpdateBody,
      if (stackPolicyDuringUpdateUrl != null)
        'StackPolicyDuringUpdateURL': stackPolicyDuringUpdateUrl,
      if (parameters != null) 'Parameters': parameters,
      if (capabilities != null) 'Capabilities': capabilities,
      if (resourceTypes != null) 'ResourceTypes': resourceTypes,
      if (roleArn != null) 'RoleARN': roleArn,
      if (rollbackConfiguration != null)
        'RollbackConfiguration': rollbackConfiguration,
      if (stackPolicyBody != null) 'StackPolicyBody': stackPolicyBody,
      if (stackPolicyUrl != null) 'StackPolicyURL': stackPolicyUrl,
      if (notificationARNs != null) 'NotificationARNs': notificationARNs,
      if (tags != null) 'Tags': tags,
      if (clientRequestToken != null) 'ClientRequestToken': clientRequestToken,
    });
    return UpdateStackOutput.fromJson(response_);
  }

  /// Updates the parameter values for stack instances for the specified
  /// accounts, within the specified regions. A stack instance refers to a stack
  /// in a specific account and region.
  ///
  /// You can only update stack instances in regions and accounts where they
  /// already exist; to create additional stack instances, use
  /// [CreateStackInstances](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_CreateStackInstances.html).
  ///
  /// During stack set updates, any parameters overridden for a stack instance
  /// are not updated, but retain their overridden value.
  ///
  /// You can only update the parameter _values_ that are specified in the stack
  /// set; to add or delete a parameter itself, use
  /// [UpdateStackSet](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_UpdateStackSet.html)
  /// to update the stack set template. If you add a parameter to a template,
  /// before you can override the parameter value specified in the stack set you
  /// must first use
  /// [UpdateStackSet](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_UpdateStackSet.html)
  /// to update all stack instances with the updated template and parameter
  /// value specified in the stack set. Once a stack instance has been updated
  /// with the new parameter, you can then override the parameter value using
  /// `UpdateStackInstances`.
  ///
  /// [stackSetName]: The name or unique ID of the stack set associated with the
  /// stack instances.
  ///
  /// [accounts]: The names of one or more AWS accounts for which you want to
  /// update parameter values for stack instances. The overridden parameter
  /// values will be applied to all stack instances in the specified accounts
  /// and regions.
  ///
  /// [regions]: The names of one or more regions in which you want to update
  /// parameter values for stack instances. The overridden parameter values will
  /// be applied to all stack instances in the specified accounts and regions.
  ///
  /// [parameterOverrides]:  A list of input parameters whose values you want to
  /// update for the specified stack instances.
  ///
  /// Any overridden parameter values will be applied to all stack instances in
  /// the specified accounts and regions. When specifying parameters and their
  /// values, be aware of how AWS CloudFormation sets parameter values during
  /// stack instance update operations:
  ///
  /// *   To override the current value for a parameter, include the parameter
  /// and specify its value.
  ///
  /// *   To leave a parameter set to its present value, you can do one of the
  /// following:
  ///
  ///     *   Do not include the parameter in the list.
  ///
  ///     *   Include the parameter and specify `UsePreviousValue` as `true`.
  /// (You cannot specify both a value and set `UsePreviousValue` to `true`.)
  ///
  ///
  /// *   To set all overridden parameter back to the values specified in the
  /// stack set, specify a parameter list but do not include any parameters.
  ///
  /// *   To leave all parameters set to their present values, do not specify
  /// this property at all.
  ///
  ///
  /// During stack set updates, any parameter values overridden for a stack
  /// instance are not updated, but retain their overridden value.
  ///
  /// You can only override the parameter _values_ that are specified in the
  /// stack set; to add or delete a parameter itself, use `UpdateStackSet` to
  /// update the stack set template. If you add a parameter to a template,
  /// before you can override the parameter value specified in the stack set you
  /// must first use
  /// [UpdateStackSet](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_UpdateStackSet.html)
  /// to update all stack instances with the updated template and parameter
  /// value specified in the stack set. Once a stack instance has been updated
  /// with the new parameter, you can then override the parameter value using
  /// `UpdateStackInstances`.
  ///
  /// [operationPreferences]: Preferences for how AWS CloudFormation performs
  /// this stack set operation.
  ///
  /// [operationId]: The unique identifier for this stack set operation.
  ///
  /// The operation ID also functions as an idempotency token, to ensure that
  /// AWS CloudFormation performs the stack set operation only once, even if you
  /// retry the request multiple times. You might retry stack set operation
  /// requests to ensure that AWS CloudFormation successfully received them.
  ///
  /// If you don't specify an operation ID, the SDK generates one automatically.
  Future<UpdateStackInstancesOutput> updateStackInstances(
      {@required String stackSetName,
      @required List<String> accounts,
      @required List<String> regions,
      List<Parameter> parameterOverrides,
      StackSetOperationPreferences operationPreferences,
      String operationId}) async {
    var response_ = await _client.send('UpdateStackInstances', {
      'StackSetName': stackSetName,
      'Accounts': accounts,
      'Regions': regions,
      if (parameterOverrides != null) 'ParameterOverrides': parameterOverrides,
      if (operationPreferences != null)
        'OperationPreferences': operationPreferences,
      if (operationId != null) 'OperationId': operationId,
    });
    return UpdateStackInstancesOutput.fromJson(response_);
  }

  /// Updates the stack set, and associated stack instances in the specified
  /// accounts and regions.
  ///
  /// Even if the stack set operation created by updating the stack set fails
  /// (completely or partially, below or above a specified failure tolerance),
  /// the stack set is updated with your changes. Subsequent
  /// CreateStackInstances calls on the specified stack set use the updated
  /// stack set.
  ///
  /// [stackSetName]: The name or unique ID of the stack set that you want to
  /// update.
  ///
  /// [description]: A brief description of updates that you are making.
  ///
  /// [templateBody]: The structure that contains the template body, with a
  /// minimum length of 1 byte and a maximum length of 51,200 bytes. For more
  /// information, see
  /// [Template Anatomy](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html)
  /// in the AWS CloudFormation User Guide.
  ///
  /// Conditional: You must specify only one of the following parameters:
  /// `TemplateBody` or `TemplateURL`—or set `UsePreviousTemplate` to true.
  ///
  /// [templateUrl]: The location of the file that contains the template body.
  /// The URL must point to a template (maximum size: 460,800 bytes) that is
  /// located in an Amazon S3 bucket. For more information, see
  /// [Template Anatomy](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html)
  /// in the AWS CloudFormation User Guide.
  ///
  /// Conditional: You must specify only one of the following parameters:
  /// `TemplateBody` or `TemplateURL`—or set `UsePreviousTemplate` to true.
  ///
  /// [usePreviousTemplate]: Use the existing template that's associated with
  /// the stack set that you're updating.
  ///
  /// Conditional: You must specify only one of the following parameters:
  /// `TemplateBody` or `TemplateURL`—or set `UsePreviousTemplate` to true.
  ///
  /// [parameters]: A list of input parameters for the stack set template.
  ///
  /// [capabilities]: In some cases, you must explicity acknowledge that your
  /// stack template contains certain capabilities in order for AWS
  /// CloudFormation to update the stack set and its associated stack instances.
  ///
  /// *    `CAPABILITY_IAM` and `CAPABILITY_NAMED_IAM`
  ///
  ///     Some stack templates might include resources that can affect
  /// permissions in your AWS account; for example, by creating new AWS Identity
  /// and Access Management (IAM) users. For those stacks sets, you must
  /// explicitly acknowledge this by specifying one of these capabilities.
  ///
  ///     The following IAM resources require you to specify either the
  /// `CAPABILITY_IAM` or `CAPABILITY_NAMED_IAM` capability.
  ///
  ///     *   If you have IAM resources, you can specify either capability.
  ///
  ///     *   If you have IAM resources with custom names, you _must_ specify
  /// `CAPABILITY_NAMED_IAM`.
  ///
  ///     *   If you don't specify either of these capabilities, AWS
  /// CloudFormation returns an `InsufficientCapabilities` error.
  ///
  ///
  ///     If your stack template contains these resources, we recommend that you
  /// review all permissions associated with them and edit their permissions if
  /// necessary.
  ///
  ///     *
  /// [AWS::IAM::AccessKey](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-accesskey.html)
  ///
  ///     *
  /// [AWS::IAM::Group](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-group.html)
  ///
  ///     *
  /// [AWS::IAM::InstanceProfile](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-instanceprofile.html)
  ///
  ///     *
  /// [AWS::IAM::Policy](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-policy.html)
  ///
  ///     *
  /// [AWS::IAM::Role](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-role.html)
  ///
  ///     *
  /// [AWS::IAM::User](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-user.html)
  ///
  ///     *
  /// [AWS::IAM::UserToGroupAddition](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-addusertogroup.html)
  ///
  ///
  ///     For more information, see
  /// [Acknowledging IAM Resources in AWS CloudFormation Templates](http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-iam-template.html#capabilities).
  ///
  /// *    `CAPABILITY_AUTO_EXPAND`
  ///
  ///     Some templates contain macros. If your stack template contains one or
  /// more macros, and you choose to update a stack directly from the processed
  /// template, without first reviewing the resulting changes in a change set,
  /// you must acknowledge this capability. For more information, see
  /// [Using AWS CloudFormation Macros to Perform Custom Processing on Templates](http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-macros.html).
  ///
  ///      Stack sets do not currently support macros in stack templates. (This
  /// includes the
  /// [AWS::Include](http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/create-reusable-transform-function-snippets-and-add-to-your-template-with-aws-include-transform.html)
  /// and
  /// [AWS::Serverless](http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/transform-aws-serverless.html)
  /// transforms, which are macros hosted by AWS CloudFormation.) Even if you
  /// specify this capability, if you include a macro in your template the stack
  /// set operation will fail.
  ///
  /// [tags]: The key-value pairs to associate with this stack set and the
  /// stacks created from it. AWS CloudFormation also propagates these tags to
  /// supported resources that are created in the stacks. You can specify a
  /// maximum number of 50 tags.
  ///
  /// If you specify tags for this parameter, those tags replace any list of
  /// tags that are currently associated with this stack set. This means:
  ///
  /// *   If you don't specify this parameter, AWS CloudFormation doesn't modify
  /// the stack's tags.
  ///
  /// *   If you specify _any_ tags using this parameter, you must specify _all_
  /// the tags that you want associated with this stack set, even tags you've
  /// specifed before (for example, when creating the stack set or during a
  /// previous update of the stack set.). Any tags that you don't include in the
  /// updated list of tags are removed from the stack set, and therefore from
  /// the stacks and resources as well.
  ///
  /// *   If you specify an empty value, AWS CloudFormation removes all
  /// currently associated tags.
  ///
  ///
  /// If you specify new tags as part of an `UpdateStackSet` action, AWS
  /// CloudFormation checks to see if you have the required IAM permission to
  /// tag resources. If you omit tags that are currently associated with the
  /// stack set from the list of tags you specify, AWS CloudFormation assumes
  /// that you want to remove those tags from the stack set, and checks to see
  /// if you have permission to untag resources. If you don't have the necessary
  /// permission(s), the entire `UpdateStackSet` action fails with an `access
  /// denied` error, and the stack set is not updated.
  ///
  /// [operationPreferences]: Preferences for how AWS CloudFormation performs
  /// this stack set operation.
  ///
  /// [administrationRoleArn]: The Amazon Resource Number (ARN) of the IAM role
  /// to use to update this stack set.
  ///
  /// Specify an IAM role only if you are using customized administrator roles
  /// to control which users or groups can manage specific stack sets within the
  /// same administrator account. For more information, see
  /// [Granting Permissions for Stack Set Operations](http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-prereqs.html)
  /// in the _AWS CloudFormation User Guide_.
  ///
  /// If you specified a customized administrator role when you created the
  /// stack set, you must specify a customized administrator role, even if it is
  /// the same customized administrator role used with this stack set
  /// previously.
  ///
  /// [executionRoleName]: The name of the IAM execution role to use to update
  /// the stack set. If you do not specify an execution role, AWS CloudFormation
  /// uses the `AWSCloudFormationStackSetExecutionRole` role for the stack set
  /// operation.
  ///
  /// Specify an IAM role only if you are using customized execution roles to
  /// control which stack resources users and groups can include in their stack
  /// sets.
  ///
  ///  If you specify a customized execution role, AWS CloudFormation uses that
  /// role to update the stack. If you do not specify a customized execution
  /// role, AWS CloudFormation performs the update using the role previously
  /// associated with the stack set, so long as you have permissions to perform
  /// operations on the stack set.
  ///
  /// [operationId]: The unique ID for this stack set operation.
  ///
  /// The operation ID also functions as an idempotency token, to ensure that
  /// AWS CloudFormation performs the stack set operation only once, even if you
  /// retry the request multiple times. You might retry stack set operation
  /// requests to ensure that AWS CloudFormation successfully received them.
  ///
  /// If you don't specify an operation ID, AWS CloudFormation generates one
  /// automatically.
  ///
  /// Repeating this stack set operation with a new operation ID retries all
  /// stack instances whose status is `OUTDATED`.
  ///
  /// [accounts]: The accounts in which to update associated stack instances. If
  /// you specify accounts, you must also specify the regions in which to update
  /// stack set instances.
  ///
  /// To update _all_ the stack instances associated with this stack set, do not
  /// specify the `Accounts` or `Regions` properties.
  ///
  /// If the stack set update includes changes to the template (that is, if the
  /// `TemplateBody` or `TemplateURL` properties are specified), or the
  /// `Parameters` property, AWS CloudFormation marks all stack instances with a
  /// status of `OUTDATED` prior to updating the stack instances in the
  /// specified accounts and regions. If the stack set update does not include
  /// changes to the template or parameters, AWS CloudFormation updates the
  /// stack instances in the specified accounts and regions, while leaving all
  /// other stack instances with their existing stack instance status.
  ///
  /// [regions]: The regions in which to update associated stack instances. If
  /// you specify regions, you must also specify accounts in which to update
  /// stack set instances.
  ///
  /// To update _all_ the stack instances associated with this stack set, do not
  /// specify the `Accounts` or `Regions` properties.
  ///
  /// If the stack set update includes changes to the template (that is, if the
  /// `TemplateBody` or `TemplateURL` properties are specified), or the
  /// `Parameters` property, AWS CloudFormation marks all stack instances with a
  /// status of `OUTDATED` prior to updating the stack instances in the
  /// specified accounts and regions. If the stack set update does not include
  /// changes to the template or parameters, AWS CloudFormation updates the
  /// stack instances in the specified accounts and regions, while leaving all
  /// other stack instances with their existing stack instance status.
  Future<UpdateStackSetOutput> updateStackSet(String stackSetName,
      {String description,
      String templateBody,
      String templateUrl,
      bool usePreviousTemplate,
      List<Parameter> parameters,
      List<String> capabilities,
      List<Tag> tags,
      StackSetOperationPreferences operationPreferences,
      String administrationRoleArn,
      String executionRoleName,
      String operationId,
      List<String> accounts,
      List<String> regions}) async {
    var response_ = await _client.send('UpdateStackSet', {
      'StackSetName': stackSetName,
      if (description != null) 'Description': description,
      if (templateBody != null) 'TemplateBody': templateBody,
      if (templateUrl != null) 'TemplateURL': templateUrl,
      if (usePreviousTemplate != null)
        'UsePreviousTemplate': usePreviousTemplate,
      if (parameters != null) 'Parameters': parameters,
      if (capabilities != null) 'Capabilities': capabilities,
      if (tags != null) 'Tags': tags,
      if (operationPreferences != null)
        'OperationPreferences': operationPreferences,
      if (administrationRoleArn != null)
        'AdministrationRoleARN': administrationRoleArn,
      if (executionRoleName != null) 'ExecutionRoleName': executionRoleName,
      if (operationId != null) 'OperationId': operationId,
      if (accounts != null) 'Accounts': accounts,
      if (regions != null) 'Regions': regions,
    });
    return UpdateStackSetOutput.fromJson(response_);
  }

  /// Updates termination protection for the specified stack. If a user attempts
  /// to delete a stack with termination protection enabled, the operation fails
  /// and the stack remains unchanged. For more information, see
  /// [Protecting a Stack From Being Deleted](AWSCloudFormation/latest/UserGuide/using-cfn-protect-stacks.html)
  /// in the _AWS CloudFormation User Guide_.
  ///
  ///  For
  /// [nested stacks](AWSCloudFormation/latest/UserGuide/using-cfn-nested-stacks.html),
  /// termination protection is set on the root stack and cannot be changed
  /// directly on the nested stack.
  ///
  /// [enableTerminationProtection]: Whether to enable termination protection on
  /// the specified stack.
  ///
  /// [stackName]: The name or unique ID of the stack for which you want to set
  /// termination protection.
  Future<UpdateTerminationProtectionOutput> updateTerminationProtection(
      {@required bool enableTerminationProtection,
      @required String stackName}) async {
    var response_ = await _client.send('UpdateTerminationProtection', {
      'EnableTerminationProtection': enableTerminationProtection,
      'StackName': stackName,
    });
    return UpdateTerminationProtectionOutput.fromJson(response_);
  }

  /// Validates a specified template. AWS CloudFormation first checks if the
  /// template is valid JSON. If it isn't, AWS CloudFormation checks if the
  /// template is valid YAML. If both these checks fail, AWS CloudFormation
  /// returns a template validation error.
  ///
  /// [templateBody]: Structure containing the template body with a minimum
  /// length of 1 byte and a maximum length of 51,200 bytes. For more
  /// information, go to
  /// [Template Anatomy](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html)
  /// in the AWS CloudFormation User Guide.
  ///
  /// Conditional: You must pass `TemplateURL` or `TemplateBody`. If both are
  /// passed, only `TemplateBody` is used.
  ///
  /// [templateUrl]: Location of file containing the template body. The URL must
  /// point to a template (max size: 460,800 bytes) that is located in an Amazon
  /// S3 bucket. For more information, go to
  /// [Template Anatomy](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html)
  /// in the AWS CloudFormation User Guide.
  ///
  /// Conditional: You must pass `TemplateURL` or `TemplateBody`. If both are
  /// passed, only `TemplateBody` is used.
  Future<ValidateTemplateOutput> validateTemplate(
      {String templateBody, String templateUrl}) async {
    var response_ = await _client.send('ValidateTemplate', {
      if (templateBody != null) 'TemplateBody': templateBody,
      if (templateUrl != null) 'TemplateURL': templateUrl,
    });
    return ValidateTemplateOutput.fromJson(response_);
  }
}

/// Structure that contains the results of the account gate function which AWS
/// CloudFormation invokes, if present, before proceeding with a stack set
/// operation in an account and region.
///
/// For each account and region, AWS CloudFormation lets you specify a Lamdba
/// function that encapsulates any requirements that must be met before
/// CloudFormation can proceed with a stack set operation in that account and
/// region. CloudFormation invokes the function each time a stack set operation
/// is requested for that account and region; if the function returns `FAILED`,
/// CloudFormation cancels the operation in that account and region, and sets
/// the stack set operation result status for that account and region to
/// `FAILED`.
///
/// For more information, see
/// [Configuring a target account gate](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-account-gating.html).
class AccountGateResult {
  /// The status of the account gate function.
  ///
  /// *    `SUCCEEDED`: The account gate function has determined that the
  /// account and region passes any requirements for a stack set operation to
  /// occur. AWS CloudFormation proceeds with the stack operation in that
  /// account and region.
  ///
  /// *    `FAILED`: The account gate function has determined that the account
  /// and region does not meet the requirements for a stack set operation to
  /// occur. AWS CloudFormation cancels the stack set operation in that account
  /// and region, and sets the stack set operation result status for that
  /// account and region to `FAILED`.
  ///
  /// *    `SKIPPED`: AWS CloudFormation has skipped calling the account gate
  /// function for this account and region, for one of the following reasons:
  ///
  ///     *   An account gate function has not been specified for the account
  /// and region. AWS CloudFormation proceeds with the stack set operation in
  /// this account and region.
  ///
  ///     *   The `AWSCloudFormationStackSetExecutionRole` of the stack set
  /// adminstration account lacks permissions to invoke the function. AWS
  /// CloudFormation proceeds with the stack set operation in this account and
  /// region.
  ///
  ///     *   Either no action is necessary, or no action is possible, on the
  /// stack. AWS CloudFormation skips the stack set operation in this account
  /// and region.
  final String status;

  /// The reason for the account gate status assigned to this account and region
  /// for the stack set operation.
  final String statusReason;

  AccountGateResult({
    this.status,
    this.statusReason,
  });
  static AccountGateResult fromJson(Map<String, dynamic> json) =>
      AccountGateResult(
        status: json.containsKey('Status') ? json['Status'] as String : null,
        statusReason: json.containsKey('StatusReason')
            ? json['StatusReason'] as String
            : null,
      );
}

/// The AccountLimit data type. For more information about account limits, see
/// [AWS CloudFormation Limits](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/cloudformation-limits.html)
/// in the _AWS CloudFormation User Guide_.
class AccountLimit {
  /// The name of the account limit.
  final String name;

  /// The value that is associated with the account limit name.
  final int value;

  AccountLimit({
    this.name,
    this.value,
  });
  static AccountLimit fromJson(Map<String, dynamic> json) => AccountLimit(
        name: json.containsKey('Name') ? json['Name'] as String : null,
        value: json.containsKey('Value') ? json['Value'] as int : null,
      );
}

/// The `Change` structure describes the changes AWS CloudFormation will perform
/// if you execute the change set.
class Change {
  /// The type of entity that AWS CloudFormation changes. Currently, the only
  /// entity type is `Resource`.
  final String type;

  /// A `ResourceChange` structure that describes the resource and action that
  /// AWS CloudFormation will perform.
  final ResourceChange resourceChange;

  Change({
    this.type,
    this.resourceChange,
  });
  static Change fromJson(Map<String, dynamic> json) => Change(
        type: json.containsKey('Type') ? json['Type'] as String : null,
        resourceChange: json.containsKey('ResourceChange')
            ? ResourceChange.fromJson(json['ResourceChange'])
            : null,
      );
}

/// The `ChangeSetSummary` structure describes a change set, its status, and the
/// stack with which it's associated.
class ChangeSetSummary {
  /// The ID of the stack with which the change set is associated.
  final String stackId;

  /// The name of the stack with which the change set is associated.
  final String stackName;

  /// The ID of the change set.
  final String changeSetId;

  /// The name of the change set.
  final String changeSetName;

  /// If the change set execution status is `AVAILABLE`, you can execute the
  /// change set. If you can’t execute the change set, the status indicates why.
  /// For example, a change set might be in an `UNAVAILABLE` state because AWS
  /// CloudFormation is still creating it or in an `OBSOLETE` state because the
  /// stack was already updated.
  final String executionStatus;

  /// The state of the change set, such as `CREATE_IN_PROGRESS`,
  /// `CREATE_COMPLETE`, or `FAILED`.
  final String status;

  /// A description of the change set's status. For example, if your change set
  /// is in the `FAILED` state, AWS CloudFormation shows the error message.
  final String statusReason;

  /// The start time when the change set was created, in UTC.
  final DateTime creationTime;

  /// Descriptive information about the change set.
  final String description;

  ChangeSetSummary({
    this.stackId,
    this.stackName,
    this.changeSetId,
    this.changeSetName,
    this.executionStatus,
    this.status,
    this.statusReason,
    this.creationTime,
    this.description,
  });
  static ChangeSetSummary fromJson(Map<String, dynamic> json) =>
      ChangeSetSummary(
        stackId: json.containsKey('StackId') ? json['StackId'] as String : null,
        stackName:
            json.containsKey('StackName') ? json['StackName'] as String : null,
        changeSetId: json.containsKey('ChangeSetId')
            ? json['ChangeSetId'] as String
            : null,
        changeSetName: json.containsKey('ChangeSetName')
            ? json['ChangeSetName'] as String
            : null,
        executionStatus: json.containsKey('ExecutionStatus')
            ? json['ExecutionStatus'] as String
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        statusReason: json.containsKey('StatusReason')
            ? json['StatusReason'] as String
            : null,
        creationTime: json.containsKey('CreationTime')
            ? DateTime.parse(json['CreationTime'])
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
      );
}

/// The output for a ContinueUpdateRollback action.
class ContinueUpdateRollbackOutput {
  ContinueUpdateRollbackOutput();
  static ContinueUpdateRollbackOutput fromJson(Map<String, dynamic> json) =>
      ContinueUpdateRollbackOutput();
}

/// The output for the CreateChangeSet action.
class CreateChangeSetOutput {
  /// The Amazon Resource Name (ARN) of the change set.
  final String id;

  /// The unique ID of the stack.
  final String stackId;

  CreateChangeSetOutput({
    this.id,
    this.stackId,
  });
  static CreateChangeSetOutput fromJson(Map<String, dynamic> json) =>
      CreateChangeSetOutput(
        id: json.containsKey('Id') ? json['Id'] as String : null,
        stackId: json.containsKey('StackId') ? json['StackId'] as String : null,
      );
}

class CreateStackInstancesOutput {
  /// The unique identifier for this stack set operation.
  final String operationId;

  CreateStackInstancesOutput({
    this.operationId,
  });
  static CreateStackInstancesOutput fromJson(Map<String, dynamic> json) =>
      CreateStackInstancesOutput(
        operationId: json.containsKey('OperationId')
            ? json['OperationId'] as String
            : null,
      );
}

/// The output for a CreateStack action.
class CreateStackOutput {
  /// Unique identifier of the stack.
  final String stackId;

  CreateStackOutput({
    this.stackId,
  });
  static CreateStackOutput fromJson(Map<String, dynamic> json) =>
      CreateStackOutput(
        stackId: json.containsKey('StackId') ? json['StackId'] as String : null,
      );
}

class CreateStackSetOutput {
  /// The ID of the stack set that you're creating.
  final String stackSetId;

  CreateStackSetOutput({
    this.stackSetId,
  });
  static CreateStackSetOutput fromJson(Map<String, dynamic> json) =>
      CreateStackSetOutput(
        stackSetId: json.containsKey('StackSetId')
            ? json['StackSetId'] as String
            : null,
      );
}

/// The output for the DeleteChangeSet action.
class DeleteChangeSetOutput {
  DeleteChangeSetOutput();
  static DeleteChangeSetOutput fromJson(Map<String, dynamic> json) =>
      DeleteChangeSetOutput();
}

class DeleteStackInstancesOutput {
  /// The unique identifier for this stack set operation.
  final String operationId;

  DeleteStackInstancesOutput({
    this.operationId,
  });
  static DeleteStackInstancesOutput fromJson(Map<String, dynamic> json) =>
      DeleteStackInstancesOutput(
        operationId: json.containsKey('OperationId')
            ? json['OperationId'] as String
            : null,
      );
}

class DeleteStackSetOutput {
  DeleteStackSetOutput();
  static DeleteStackSetOutput fromJson(Map<String, dynamic> json) =>
      DeleteStackSetOutput();
}

/// The output for the DescribeAccountLimits action.
class DescribeAccountLimitsOutput {
  /// An account limit structure that contain a list of AWS CloudFormation
  /// account limits and their values.
  final List<AccountLimit> accountLimits;

  /// If the output exceeds 1 MB in size, a string that identifies the next page
  /// of limits. If no additional page exists, this value is null.
  final String nextToken;

  DescribeAccountLimitsOutput({
    this.accountLimits,
    this.nextToken,
  });
  static DescribeAccountLimitsOutput fromJson(Map<String, dynamic> json) =>
      DescribeAccountLimitsOutput(
        accountLimits: json.containsKey('AccountLimits')
            ? (json['AccountLimits'] as List)
                .map((e) => AccountLimit.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// The output for the DescribeChangeSet action.
class DescribeChangeSetOutput {
  /// The name of the change set.
  final String changeSetName;

  /// The ARN of the change set.
  final String changeSetId;

  /// The ARN of the stack that is associated with the change set.
  final String stackId;

  /// The name of the stack that is associated with the change set.
  final String stackName;

  /// Information about the change set.
  final String description;

  /// A list of `Parameter` structures that describes the input parameters and
  /// their values used to create the change set. For more information, see the
  /// [Parameter](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_Parameter.html)
  /// data type.
  final List<Parameter> parameters;

  /// The start time when the change set was created, in UTC.
  final DateTime creationTime;

  /// If the change set execution status is `AVAILABLE`, you can execute the
  /// change set. If you can’t execute the change set, the status indicates why.
  /// For example, a change set might be in an `UNAVAILABLE` state because AWS
  /// CloudFormation is still creating it or in an `OBSOLETE` state because the
  /// stack was already updated.
  final String executionStatus;

  /// The current status of the change set, such as `CREATE_IN_PROGRESS`,
  /// `CREATE_COMPLETE`, or `FAILED`.
  final String status;

  /// A description of the change set's status. For example, if your attempt to
  /// create a change set failed, AWS CloudFormation shows the error message.
  final String statusReason;

  /// The ARNs of the Amazon Simple Notification Service (Amazon SNS) topics
  /// that will be associated with the stack if you execute the change set.
  final List<String> notificationARNs;

  /// The rollback triggers for AWS CloudFormation to monitor during stack
  /// creation and updating operations, and for the specified monitoring period
  /// afterwards.
  final RollbackConfiguration rollbackConfiguration;

  /// If you execute the change set, the list of capabilities that were
  /// explicitly acknowledged when the change set was created.
  final List<String> capabilities;

  /// If you execute the change set, the tags that will be associated with the
  /// stack.
  final List<Tag> tags;

  /// A list of `Change` structures that describes the resources AWS
  /// CloudFormation changes if you execute the change set.
  final List<Change> changes;

  /// If the output exceeds 1 MB, a string that identifies the next page of
  /// changes. If there is no additional page, this value is null.
  final String nextToken;

  DescribeChangeSetOutput({
    this.changeSetName,
    this.changeSetId,
    this.stackId,
    this.stackName,
    this.description,
    this.parameters,
    this.creationTime,
    this.executionStatus,
    this.status,
    this.statusReason,
    this.notificationARNs,
    this.rollbackConfiguration,
    this.capabilities,
    this.tags,
    this.changes,
    this.nextToken,
  });
  static DescribeChangeSetOutput fromJson(Map<String, dynamic> json) =>
      DescribeChangeSetOutput(
        changeSetName: json.containsKey('ChangeSetName')
            ? json['ChangeSetName'] as String
            : null,
        changeSetId: json.containsKey('ChangeSetId')
            ? json['ChangeSetId'] as String
            : null,
        stackId: json.containsKey('StackId') ? json['StackId'] as String : null,
        stackName:
            json.containsKey('StackName') ? json['StackName'] as String : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        parameters: json.containsKey('Parameters')
            ? (json['Parameters'] as List)
                .map((e) => Parameter.fromJson(e))
                .toList()
            : null,
        creationTime: json.containsKey('CreationTime')
            ? DateTime.parse(json['CreationTime'])
            : null,
        executionStatus: json.containsKey('ExecutionStatus')
            ? json['ExecutionStatus'] as String
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        statusReason: json.containsKey('StatusReason')
            ? json['StatusReason'] as String
            : null,
        notificationARNs: json.containsKey('NotificationARNs')
            ? (json['NotificationARNs'] as List)
                .map((e) => e as String)
                .toList()
            : null,
        rollbackConfiguration: json.containsKey('RollbackConfiguration')
            ? RollbackConfiguration.fromJson(json['RollbackConfiguration'])
            : null,
        capabilities: json.containsKey('Capabilities')
            ? (json['Capabilities'] as List).map((e) => e as String).toList()
            : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as List).map((e) => Tag.fromJson(e)).toList()
            : null,
        changes: json.containsKey('Changes')
            ? (json['Changes'] as List).map((e) => Change.fromJson(e)).toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class DescribeStackDriftDetectionStatusOutput {
  /// The ID of the stack.
  final String stackId;

  /// The ID of the drift detection results of this operation.
  ///
  /// AWS CloudFormation generates new results, with a new drift detection ID,
  /// each time this operation is run. However, the number of reports AWS
  /// CloudFormation retains for any given stack, and for how long, may vary.
  final String stackDriftDetectionId;

  /// Status of the stack's actual configuration compared to its expected
  /// configuration.
  ///
  /// *    `DRIFTED`: The stack differs from its expected template
  /// configuration. A stack is considered to have drifted if one or more of its
  /// resources have drifted.
  ///
  /// *    `NOT_CHECKED`: AWS CloudFormation has not checked if the stack
  /// differs from its expected template configuration.
  ///
  /// *    `IN_SYNC`: The stack's actual configuration matches its expected
  /// template configuration.
  ///
  /// *    `UNKNOWN`: This value is reserved for future use.
  final String stackDriftStatus;

  /// The status of the stack drift detection operation.
  ///
  /// *    `DETECTION_COMPLETE`: The stack drift detection operation has
  /// successfully completed for all resources in the stack that support drift
  /// detection. (Resources that do not currently support stack detection remain
  /// unchecked.)
  ///
  ///     If you specified logical resource IDs for AWS CloudFormation to use as
  /// a filter for the stack drift detection operation, only the resources with
  /// those logical IDs are checked for drift.
  ///
  /// *    `DETECTION_FAILED`: The stack drift detection operation has failed
  /// for at least one resource in the stack. Results will be available for
  /// resources on which AWS CloudFormation successfully completed drift
  /// detection.
  ///
  /// *    `DETECTION_IN_PROGRESS`: The stack drift detection operation is
  /// currently in progress.
  final String detectionStatus;

  /// The reason the stack drift detection operation has its current status.
  final String detectionStatusReason;

  /// Total number of stack resources that have drifted. This is NULL until the
  /// drift detection operation reaches a status of `DETECTION_COMPLETE`. This
  /// value will be 0 for stacks whose drift status is `IN_SYNC`.
  final int driftedStackResourceCount;

  /// Time at which the stack drift detection operation was initiated.
  final DateTime timestamp;

  DescribeStackDriftDetectionStatusOutput({
    @required this.stackId,
    @required this.stackDriftDetectionId,
    this.stackDriftStatus,
    @required this.detectionStatus,
    this.detectionStatusReason,
    this.driftedStackResourceCount,
    @required this.timestamp,
  });
  static DescribeStackDriftDetectionStatusOutput fromJson(
          Map<String, dynamic> json) =>
      DescribeStackDriftDetectionStatusOutput(
        stackId: json['StackId'] as String,
        stackDriftDetectionId: json['StackDriftDetectionId'] as String,
        stackDriftStatus: json.containsKey('StackDriftStatus')
            ? json['StackDriftStatus'] as String
            : null,
        detectionStatus: json['DetectionStatus'] as String,
        detectionStatusReason: json.containsKey('DetectionStatusReason')
            ? json['DetectionStatusReason'] as String
            : null,
        driftedStackResourceCount: json.containsKey('DriftedStackResourceCount')
            ? json['DriftedStackResourceCount'] as int
            : null,
        timestamp: DateTime.parse(json['Timestamp']),
      );
}

/// The output for a DescribeStackEvents action.
class DescribeStackEventsOutput {
  /// A list of `StackEvents` structures.
  final List<StackEvent> stackEvents;

  /// If the output exceeds 1 MB in size, a string that identifies the next page
  /// of events. If no additional page exists, this value is null.
  final String nextToken;

  DescribeStackEventsOutput({
    this.stackEvents,
    this.nextToken,
  });
  static DescribeStackEventsOutput fromJson(Map<String, dynamic> json) =>
      DescribeStackEventsOutput(
        stackEvents: json.containsKey('StackEvents')
            ? (json['StackEvents'] as List)
                .map((e) => StackEvent.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class DescribeStackInstanceOutput {
  /// The stack instance that matches the specified request parameters.
  final StackInstance stackInstance;

  DescribeStackInstanceOutput({
    this.stackInstance,
  });
  static DescribeStackInstanceOutput fromJson(Map<String, dynamic> json) =>
      DescribeStackInstanceOutput(
        stackInstance: json.containsKey('StackInstance')
            ? StackInstance.fromJson(json['StackInstance'])
            : null,
      );
}

class DescribeStackResourceDriftsOutput {
  /// Drift information for the resources that have been checked for drift in
  /// the specified stack. This includes actual and expected configuration
  /// values for resources where AWS CloudFormation detects drift.
  ///
  /// For a given stack, there will be one `StackResourceDrift` for each stack
  /// resource that has been checked for drift. Resources that have not yet been
  /// checked for drift are not included. Resources that do not currently
  /// support drift detection are not checked, and so not included. For a list
  /// of resources that support drift detection, see
  /// [Resources that Support Drift Detection](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift-resource-list.html).
  final List<StackResourceDrift> stackResourceDrifts;

  /// If the request doesn't return all of the remaining results, `NextToken` is
  /// set to a token. To retrieve the next set of results, call
  /// `DescribeStackResourceDrifts` again and assign that token to the request
  /// object's `NextToken` parameter. If the request returns all results,
  /// `NextToken` is set to `null`.
  final String nextToken;

  DescribeStackResourceDriftsOutput({
    @required this.stackResourceDrifts,
    this.nextToken,
  });
  static DescribeStackResourceDriftsOutput fromJson(
          Map<String, dynamic> json) =>
      DescribeStackResourceDriftsOutput(
        stackResourceDrifts: (json['StackResourceDrifts'] as List)
            .map((e) => StackResourceDrift.fromJson(e))
            .toList(),
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// The output for a DescribeStackResource action.
class DescribeStackResourceOutput {
  /// A `StackResourceDetail` structure containing the description of the
  /// specified resource in the specified stack.
  final StackResourceDetail stackResourceDetail;

  DescribeStackResourceOutput({
    this.stackResourceDetail,
  });
  static DescribeStackResourceOutput fromJson(Map<String, dynamic> json) =>
      DescribeStackResourceOutput(
        stackResourceDetail: json.containsKey('StackResourceDetail')
            ? StackResourceDetail.fromJson(json['StackResourceDetail'])
            : null,
      );
}

/// The output for a DescribeStackResources action.
class DescribeStackResourcesOutput {
  /// A list of `StackResource` structures.
  final List<StackResource> stackResources;

  DescribeStackResourcesOutput({
    this.stackResources,
  });
  static DescribeStackResourcesOutput fromJson(Map<String, dynamic> json) =>
      DescribeStackResourcesOutput(
        stackResources: json.containsKey('StackResources')
            ? (json['StackResources'] as List)
                .map((e) => StackResource.fromJson(e))
                .toList()
            : null,
      );
}

class DescribeStackSetOperationOutput {
  /// The specified stack set operation.
  final StackSetOperation stackSetOperation;

  DescribeStackSetOperationOutput({
    this.stackSetOperation,
  });
  static DescribeStackSetOperationOutput fromJson(Map<String, dynamic> json) =>
      DescribeStackSetOperationOutput(
        stackSetOperation: json.containsKey('StackSetOperation')
            ? StackSetOperation.fromJson(json['StackSetOperation'])
            : null,
      );
}

class DescribeStackSetOutput {
  /// The specified stack set.
  final StackSet stackSet;

  DescribeStackSetOutput({
    this.stackSet,
  });
  static DescribeStackSetOutput fromJson(Map<String, dynamic> json) =>
      DescribeStackSetOutput(
        stackSet: json.containsKey('StackSet')
            ? StackSet.fromJson(json['StackSet'])
            : null,
      );
}

/// The output for a DescribeStacks action.
class DescribeStacksOutput {
  /// A list of stack structures.
  final List<Stack> stacks;

  /// If the output exceeds 1 MB in size, a string that identifies the next page
  /// of stacks. If no additional page exists, this value is null.
  final String nextToken;

  DescribeStacksOutput({
    this.stacks,
    this.nextToken,
  });
  static DescribeStacksOutput fromJson(Map<String, dynamic> json) =>
      DescribeStacksOutput(
        stacks: json.containsKey('Stacks')
            ? (json['Stacks'] as List).map((e) => Stack.fromJson(e)).toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class DetectStackDriftOutput {
  /// The ID of the drift detection results of this operation.
  ///
  /// AWS CloudFormation generates new results, with a new drift detection ID,
  /// each time this operation is run. However, the number of drift results AWS
  /// CloudFormation retains for any given stack, and for how long, may vary.
  final String stackDriftDetectionId;

  DetectStackDriftOutput({
    @required this.stackDriftDetectionId,
  });
  static DetectStackDriftOutput fromJson(Map<String, dynamic> json) =>
      DetectStackDriftOutput(
        stackDriftDetectionId: json['StackDriftDetectionId'] as String,
      );
}

class DetectStackResourceDriftOutput {
  /// Information about whether the resource's actual configuration has drifted
  /// from its expected template configuration, including actual and expected
  /// property values and any differences detected.
  final StackResourceDrift stackResourceDrift;

  DetectStackResourceDriftOutput({
    @required this.stackResourceDrift,
  });
  static DetectStackResourceDriftOutput fromJson(Map<String, dynamic> json) =>
      DetectStackResourceDriftOutput(
        stackResourceDrift:
            StackResourceDrift.fromJson(json['StackResourceDrift']),
      );
}

/// The output for a EstimateTemplateCost action.
class EstimateTemplateCostOutput {
  /// An AWS Simple Monthly Calculator URL with a query string that describes
  /// the resources required to run the template.
  final String url;

  EstimateTemplateCostOutput({
    this.url,
  });
  static EstimateTemplateCostOutput fromJson(Map<String, dynamic> json) =>
      EstimateTemplateCostOutput(
        url: json.containsKey('Url') ? json['Url'] as String : null,
      );
}

/// The output for the ExecuteChangeSet action.
class ExecuteChangeSetOutput {
  ExecuteChangeSetOutput();
  static ExecuteChangeSetOutput fromJson(Map<String, dynamic> json) =>
      ExecuteChangeSetOutput();
}

/// The `Export` structure describes the exported output values for a stack.
class Export {
  /// The stack that contains the exported output name and value.
  final String exportingStackId;

  /// The name of exported output value. Use this name and the `Fn::ImportValue`
  /// function to import the associated value into other stacks. The name is
  /// defined in the `Export` field in the associated stack's `Outputs` section.
  final String name;

  /// The value of the exported output, such as a resource physical ID. This
  /// value is defined in the `Export` field in the associated stack's `Outputs`
  /// section.
  final String value;

  Export({
    this.exportingStackId,
    this.name,
    this.value,
  });
  static Export fromJson(Map<String, dynamic> json) => Export(
        exportingStackId: json.containsKey('ExportingStackId')
            ? json['ExportingStackId'] as String
            : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        value: json.containsKey('Value') ? json['Value'] as String : null,
      );
}

/// The output for the GetStackPolicy action.
class GetStackPolicyOutput {
  /// Structure containing the stack policy body. (For more information, go to
  /// [Prevent Updates to Stack Resources](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/protect-stack-resources.html)
  /// in the AWS CloudFormation User Guide.)
  final String stackPolicyBody;

  GetStackPolicyOutput({
    this.stackPolicyBody,
  });
  static GetStackPolicyOutput fromJson(Map<String, dynamic> json) =>
      GetStackPolicyOutput(
        stackPolicyBody: json.containsKey('StackPolicyBody')
            ? json['StackPolicyBody'] as String
            : null,
      );
}

/// The output for GetTemplate action.
class GetTemplateOutput {
  /// Structure containing the template body. (For more information, go to
  /// [Template Anatomy](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html)
  /// in the AWS CloudFormation User Guide.)
  ///
  /// AWS CloudFormation returns the same template that was used when the stack
  /// was created.
  final String templateBody;

  /// The stage of the template that you can retrieve. For stacks, the
  /// `Original` and `Processed` templates are always available. For change
  /// sets, the `Original` template is always available. After AWS
  /// CloudFormation finishes creating the change set, the `Processed` template
  /// becomes available.
  final List<String> stagesAvailable;

  GetTemplateOutput({
    this.templateBody,
    this.stagesAvailable,
  });
  static GetTemplateOutput fromJson(Map<String, dynamic> json) =>
      GetTemplateOutput(
        templateBody: json.containsKey('TemplateBody')
            ? json['TemplateBody'] as String
            : null,
        stagesAvailable: json.containsKey('StagesAvailable')
            ? (json['StagesAvailable'] as List).map((e) => e as String).toList()
            : null,
      );
}

/// The output for the GetTemplateSummary action.
class GetTemplateSummaryOutput {
  /// A list of parameter declarations that describe various properties for each
  /// parameter.
  final List<ParameterDeclaration> parameters;

  /// The value that is defined in the `Description` property of the template.
  final String description;

  /// The capabilities found within the template. If your template contains IAM
  /// resources, you must specify the CAPABILITY_IAM or CAPABILITY_NAMED_IAM
  /// value for this parameter when you use the CreateStack or UpdateStack
  /// actions with your template; otherwise, those actions return an
  /// InsufficientCapabilities error.
  ///
  /// For more information, see
  /// [Acknowledging IAM Resources in AWS CloudFormation Templates](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-iam-template.html#capabilities).
  final List<String> capabilities;

  /// The list of resources that generated the values in the `Capabilities`
  /// response element.
  final String capabilitiesReason;

  /// A list of all the template resource types that are defined in the
  /// template, such as `AWS::EC2::Instance`, `AWS::Dynamo::Table`, and
  /// `Custom::MyCustomInstance`.
  final List<String> resourceTypes;

  /// The AWS template format version, which identifies the capabilities of the
  /// template.
  final String version;

  /// The value that is defined for the `Metadata` property of the template.
  final String metadata;

  /// A list of the transforms that are declared in the template.
  final List<String> declaredTransforms;

  GetTemplateSummaryOutput({
    this.parameters,
    this.description,
    this.capabilities,
    this.capabilitiesReason,
    this.resourceTypes,
    this.version,
    this.metadata,
    this.declaredTransforms,
  });
  static GetTemplateSummaryOutput fromJson(Map<String, dynamic> json) =>
      GetTemplateSummaryOutput(
        parameters: json.containsKey('Parameters')
            ? (json['Parameters'] as List)
                .map((e) => ParameterDeclaration.fromJson(e))
                .toList()
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        capabilities: json.containsKey('Capabilities')
            ? (json['Capabilities'] as List).map((e) => e as String).toList()
            : null,
        capabilitiesReason: json.containsKey('CapabilitiesReason')
            ? json['CapabilitiesReason'] as String
            : null,
        resourceTypes: json.containsKey('ResourceTypes')
            ? (json['ResourceTypes'] as List).map((e) => e as String).toList()
            : null,
        version: json.containsKey('Version') ? json['Version'] as String : null,
        metadata:
            json.containsKey('Metadata') ? json['Metadata'] as String : null,
        declaredTransforms: json.containsKey('DeclaredTransforms')
            ? (json['DeclaredTransforms'] as List)
                .map((e) => e as String)
                .toList()
            : null,
      );
}

/// The output for the ListChangeSets action.
class ListChangeSetsOutput {
  /// A list of `ChangeSetSummary` structures that provides the ID and status of
  /// each change set for the specified stack.
  final List<ChangeSetSummary> summaries;

  /// If the output exceeds 1 MB, a string that identifies the next page of
  /// change sets. If there is no additional page, this value is null.
  final String nextToken;

  ListChangeSetsOutput({
    this.summaries,
    this.nextToken,
  });
  static ListChangeSetsOutput fromJson(Map<String, dynamic> json) =>
      ListChangeSetsOutput(
        summaries: json.containsKey('Summaries')
            ? (json['Summaries'] as List)
                .map((e) => ChangeSetSummary.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListExportsOutput {
  /// The output for the ListExports action.
  final List<Export> exports;

  /// If the output exceeds 100 exported output values, a string that identifies
  /// the next page of exports. If there is no additional page, this value is
  /// null.
  final String nextToken;

  ListExportsOutput({
    this.exports,
    this.nextToken,
  });
  static ListExportsOutput fromJson(Map<String, dynamic> json) =>
      ListExportsOutput(
        exports: json.containsKey('Exports')
            ? (json['Exports'] as List).map((e) => Export.fromJson(e)).toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListImportsOutput {
  /// A list of stack names that are importing the specified exported output
  /// value.
  final List<String> imports;

  /// A string that identifies the next page of exports. If there is no
  /// additional page, this value is null.
  final String nextToken;

  ListImportsOutput({
    this.imports,
    this.nextToken,
  });
  static ListImportsOutput fromJson(Map<String, dynamic> json) =>
      ListImportsOutput(
        imports: json.containsKey('Imports')
            ? (json['Imports'] as List).map((e) => e as String).toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListStackInstancesOutput {
  /// A list of `StackInstanceSummary` structures that contain information about
  /// the specified stack instances.
  final List<StackInstanceSummary> summaries;

  /// If the request doesn't return all of the remaining results, `NextToken` is
  /// set to a token. To retrieve the next set of results, call
  /// `ListStackInstances` again and assign that token to the request object's
  /// `NextToken` parameter. If the request returns all results, `NextToken` is
  /// set to `null`.
  final String nextToken;

  ListStackInstancesOutput({
    this.summaries,
    this.nextToken,
  });
  static ListStackInstancesOutput fromJson(Map<String, dynamic> json) =>
      ListStackInstancesOutput(
        summaries: json.containsKey('Summaries')
            ? (json['Summaries'] as List)
                .map((e) => StackInstanceSummary.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// The output for a ListStackResources action.
class ListStackResourcesOutput {
  /// A list of `StackResourceSummary` structures.
  final List<StackResourceSummary> stackResourceSummaries;

  /// If the output exceeds 1 MB, a string that identifies the next page of
  /// stack resources. If no additional page exists, this value is null.
  final String nextToken;

  ListStackResourcesOutput({
    this.stackResourceSummaries,
    this.nextToken,
  });
  static ListStackResourcesOutput fromJson(Map<String, dynamic> json) =>
      ListStackResourcesOutput(
        stackResourceSummaries: json.containsKey('StackResourceSummaries')
            ? (json['StackResourceSummaries'] as List)
                .map((e) => StackResourceSummary.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListStackSetOperationResultsOutput {
  /// A list of `StackSetOperationResultSummary` structures that contain
  /// information about the specified operation results, for accounts and
  /// regions that are included in the operation.
  final List<StackSetOperationResultSummary> summaries;

  /// If the request doesn't return all results, `NextToken` is set to a token.
  /// To retrieve the next set of results, call `ListOperationResults` again and
  /// assign that token to the request object's `NextToken` parameter. If there
  /// are no remaining results, `NextToken` is set to `null`.
  final String nextToken;

  ListStackSetOperationResultsOutput({
    this.summaries,
    this.nextToken,
  });
  static ListStackSetOperationResultsOutput fromJson(
          Map<String, dynamic> json) =>
      ListStackSetOperationResultsOutput(
        summaries: json.containsKey('Summaries')
            ? (json['Summaries'] as List)
                .map((e) => StackSetOperationResultSummary.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListStackSetOperationsOutput {
  /// A list of `StackSetOperationSummary` structures that contain summary
  /// information about operations for the specified stack set.
  final List<StackSetOperationSummary> summaries;

  /// If the request doesn't return all results, `NextToken` is set to a token.
  /// To retrieve the next set of results, call `ListOperationResults` again and
  /// assign that token to the request object's `NextToken` parameter. If there
  /// are no remaining results, `NextToken` is set to `null`.
  final String nextToken;

  ListStackSetOperationsOutput({
    this.summaries,
    this.nextToken,
  });
  static ListStackSetOperationsOutput fromJson(Map<String, dynamic> json) =>
      ListStackSetOperationsOutput(
        summaries: json.containsKey('Summaries')
            ? (json['Summaries'] as List)
                .map((e) => StackSetOperationSummary.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListStackSetsOutput {
  /// A list of `StackSetSummary` structures that contain information about the
  /// user's stack sets.
  final List<StackSetSummary> summaries;

  /// If the request doesn't return all of the remaining results, `NextToken` is
  /// set to a token. To retrieve the next set of results, call
  /// `ListStackInstances` again and assign that token to the request object's
  /// `NextToken` parameter. If the request returns all results, `NextToken` is
  /// set to `null`.
  final String nextToken;

  ListStackSetsOutput({
    this.summaries,
    this.nextToken,
  });
  static ListStackSetsOutput fromJson(Map<String, dynamic> json) =>
      ListStackSetsOutput(
        summaries: json.containsKey('Summaries')
            ? (json['Summaries'] as List)
                .map((e) => StackSetSummary.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// The output for ListStacks action.
class ListStacksOutput {
  /// A list of `StackSummary` structures containing information about the
  /// specified stacks.
  final List<StackSummary> stackSummaries;

  /// If the output exceeds 1 MB in size, a string that identifies the next page
  /// of stacks. If no additional page exists, this value is null.
  final String nextToken;

  ListStacksOutput({
    this.stackSummaries,
    this.nextToken,
  });
  static ListStacksOutput fromJson(Map<String, dynamic> json) =>
      ListStacksOutput(
        stackSummaries: json.containsKey('StackSummaries')
            ? (json['StackSummaries'] as List)
                .map((e) => StackSummary.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// The Output data type.
class Output {
  /// The key associated with the output.
  final String outputKey;

  /// The value associated with the output.
  final String outputValue;

  /// User defined description associated with the output.
  final String description;

  /// The name of the export associated with the output.
  final String exportName;

  Output({
    this.outputKey,
    this.outputValue,
    this.description,
    this.exportName,
  });
  static Output fromJson(Map<String, dynamic> json) => Output(
        outputKey:
            json.containsKey('OutputKey') ? json['OutputKey'] as String : null,
        outputValue: json.containsKey('OutputValue')
            ? json['OutputValue'] as String
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        exportName: json.containsKey('ExportName')
            ? json['ExportName'] as String
            : null,
      );
}

/// The Parameter data type.
class Parameter {
  /// The key associated with the parameter. If you don't specify a key and
  /// value for a particular parameter, AWS CloudFormation uses the default
  /// value that is specified in your template.
  final String parameterKey;

  /// The input value associated with the parameter.
  final String parameterValue;

  /// During a stack update, use the existing parameter value that the stack is
  /// using for a given parameter key. If you specify `true`, do not specify a
  /// parameter value.
  final bool usePreviousValue;

  /// Read-only. The value that corresponds to a Systems Manager parameter key.
  /// This field is returned only for
  /// [`SSM` parameter types](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/parameters-section-structure.html#aws-ssm-parameter-types)
  /// in the template.
  final String resolvedValue;

  Parameter({
    this.parameterKey,
    this.parameterValue,
    this.usePreviousValue,
    this.resolvedValue,
  });
  static Parameter fromJson(Map<String, dynamic> json) => Parameter(
        parameterKey: json.containsKey('ParameterKey')
            ? json['ParameterKey'] as String
            : null,
        parameterValue: json.containsKey('ParameterValue')
            ? json['ParameterValue'] as String
            : null,
        usePreviousValue: json.containsKey('UsePreviousValue')
            ? json['UsePreviousValue'] as bool
            : null,
        resolvedValue: json.containsKey('ResolvedValue')
            ? json['ResolvedValue'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A set of criteria that AWS CloudFormation uses to validate parameter values.
/// Although other constraints might be defined in the stack template, AWS
/// CloudFormation returns only the `AllowedValues` property.
class ParameterConstraints {
  /// A list of values that are permitted for a parameter.
  final List<String> allowedValues;

  ParameterConstraints({
    this.allowedValues,
  });
  static ParameterConstraints fromJson(Map<String, dynamic> json) =>
      ParameterConstraints(
        allowedValues: json.containsKey('AllowedValues')
            ? (json['AllowedValues'] as List).map((e) => e as String).toList()
            : null,
      );
}

/// The ParameterDeclaration data type.
class ParameterDeclaration {
  /// The name that is associated with the parameter.
  final String parameterKey;

  /// The default value of the parameter.
  final String defaultValue;

  /// The type of parameter.
  final String parameterType;

  /// Flag that indicates whether the parameter value is shown as plain text in
  /// logs and in the AWS Management Console.
  final bool noEcho;

  /// The description that is associate with the parameter.
  final String description;

  /// The criteria that AWS CloudFormation uses to validate parameter values.
  final ParameterConstraints parameterConstraints;

  ParameterDeclaration({
    this.parameterKey,
    this.defaultValue,
    this.parameterType,
    this.noEcho,
    this.description,
    this.parameterConstraints,
  });
  static ParameterDeclaration fromJson(Map<String, dynamic> json) =>
      ParameterDeclaration(
        parameterKey: json.containsKey('ParameterKey')
            ? json['ParameterKey'] as String
            : null,
        defaultValue: json.containsKey('DefaultValue')
            ? json['DefaultValue'] as String
            : null,
        parameterType: json.containsKey('ParameterType')
            ? json['ParameterType'] as String
            : null,
        noEcho: json.containsKey('NoEcho') ? json['NoEcho'] as bool : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        parameterConstraints: json.containsKey('ParameterConstraints')
            ? ParameterConstraints.fromJson(json['ParameterConstraints'])
            : null,
      );
}

/// Context information that enables AWS CloudFormation to uniquely identify a
/// resource. AWS CloudFormation uses context key-value pairs in cases where a
/// resource's logical and physical IDs are not enough to uniquely identify that
/// resource. Each context key-value pair specifies a resource that contains the
/// targeted resource.
class PhysicalResourceIdContextKeyValuePair {
  /// The resource context key.
  final String key;

  /// The resource context value.
  final String value;

  PhysicalResourceIdContextKeyValuePair({
    @required this.key,
    @required this.value,
  });
  static PhysicalResourceIdContextKeyValuePair fromJson(
          Map<String, dynamic> json) =>
      PhysicalResourceIdContextKeyValuePair(
        key: json['Key'] as String,
        value: json['Value'] as String,
      );
}

/// Information about a resource property whose actual value differs from its
/// expected value, as defined in the stack template and any values specified as
/// template parameters. These will be present only for resources whose
/// `StackResourceDriftStatus` is `MODIFIED`. For more information, see
/// [Detecting Unregulated Configuration Changes to Stacks and Resources](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html).
class PropertyDifference {
  /// The fully-qualified path to the resource property.
  final String propertyPath;

  /// The expected property value of the resource property, as defined in the
  /// stack template and any values specified as template parameters.
  final String expectedValue;

  /// The actual property value of the resource property.
  final String actualValue;

  /// The type of property difference.
  ///
  /// *    `ADD`: A value has been added to a resource property that is an array
  /// or list data type.
  ///
  /// *    `REMOVE`: The property has been removed from the current resource
  /// configuration.
  ///
  /// *    `NOT_EQUAL`: The current property value differs from its expected
  /// value (as defined in the stack template and any values specified as
  /// template parameters).
  final String differenceType;

  PropertyDifference({
    @required this.propertyPath,
    @required this.expectedValue,
    @required this.actualValue,
    @required this.differenceType,
  });
  static PropertyDifference fromJson(Map<String, dynamic> json) =>
      PropertyDifference(
        propertyPath: json['PropertyPath'] as String,
        expectedValue: json['ExpectedValue'] as String,
        actualValue: json['ActualValue'] as String,
        differenceType: json['DifferenceType'] as String,
      );
}

/// The `ResourceChange` structure describes the resource and the action that
/// AWS CloudFormation will perform on it if you execute this change set.
class ResourceChange {
  /// The action that AWS CloudFormation takes on the resource, such as `Add`
  /// (adds a new resource), `Modify` (changes a resource), or `Remove` (deletes
  /// a resource).
  final String action;

  /// The resource's logical ID, which is defined in the stack's template.
  final String logicalResourceId;

  /// The resource's physical ID (resource name). Resources that you are adding
  /// don't have physical IDs because they haven't been created.
  final String physicalResourceId;

  /// The type of AWS CloudFormation resource, such as `AWS::S3::Bucket`.
  final String resourceType;

  /// For the `Modify` action, indicates whether AWS CloudFormation will replace
  /// the resource by creating a new one and deleting the old one. This value
  /// depends on the value of the `RequiresRecreation` property in the
  /// `ResourceTargetDefinition` structure. For example, if the
  /// `RequiresRecreation` field is `Always` and the `Evaluation` field is
  /// `Static`, `Replacement` is `True`. If the `RequiresRecreation` field is
  /// `Always` and the `Evaluation` field is `Dynamic`, `Replacement` is
  /// `Conditionally`.
  ///
  /// If you have multiple changes with different `RequiresRecreation` values,
  /// the `Replacement` value depends on the change with the most impact. A
  /// `RequiresRecreation` value of `Always` has the most impact, followed by
  /// `Conditionally`, and then `Never`.
  final String replacement;

  /// For the `Modify` action, indicates which resource attribute is triggering
  /// this update, such as a change in the resource attribute's `Metadata`,
  /// `Properties`, or `Tags`.
  final List<String> scope;

  /// For the `Modify` action, a list of `ResourceChangeDetail` structures that
  /// describes the changes that AWS CloudFormation will make to the resource.
  final List<ResourceChangeDetail> details;

  ResourceChange({
    this.action,
    this.logicalResourceId,
    this.physicalResourceId,
    this.resourceType,
    this.replacement,
    this.scope,
    this.details,
  });
  static ResourceChange fromJson(Map<String, dynamic> json) => ResourceChange(
        action: json.containsKey('Action') ? json['Action'] as String : null,
        logicalResourceId: json.containsKey('LogicalResourceId')
            ? json['LogicalResourceId'] as String
            : null,
        physicalResourceId: json.containsKey('PhysicalResourceId')
            ? json['PhysicalResourceId'] as String
            : null,
        resourceType: json.containsKey('ResourceType')
            ? json['ResourceType'] as String
            : null,
        replacement: json.containsKey('Replacement')
            ? json['Replacement'] as String
            : null,
        scope: json.containsKey('Scope')
            ? (json['Scope'] as List).map((e) => e as String).toList()
            : null,
        details: json.containsKey('Details')
            ? (json['Details'] as List)
                .map((e) => ResourceChangeDetail.fromJson(e))
                .toList()
            : null,
      );
}

/// For a resource with `Modify` as the action, the `ResourceChange` structure
/// describes the changes AWS CloudFormation will make to that resource.
class ResourceChangeDetail {
  /// A `ResourceTargetDefinition` structure that describes the field that AWS
  /// CloudFormation will change and whether the resource will be recreated.
  final ResourceTargetDefinition target;

  /// Indicates whether AWS CloudFormation can determine the target value, and
  /// whether the target value will change before you execute a change set.
  ///
  /// For `Static` evaluations, AWS CloudFormation can determine that the target
  /// value will change, and its value. For example, if you directly modify the
  /// `InstanceType` property of an EC2 instance, AWS CloudFormation knows that
  /// this property value will change, and its value, so this is a `Static`
  /// evaluation.
  ///
  /// For `Dynamic` evaluations, cannot determine the target value because it
  /// depends on the result of an intrinsic function, such as a `Ref` or
  /// `Fn::GetAtt` intrinsic function, when the stack is updated. For example,
  /// if your template includes a reference to a resource that is conditionally
  /// recreated, the value of the reference (the physical ID of the resource)
  /// might change, depending on if the resource is recreated. If the resource
  /// is recreated, it will have a new physical ID, so all references to that
  /// resource will also be updated.
  final String evaluation;

  /// The group to which the `CausingEntity` value belongs. There are five
  /// entity groups:
  ///
  /// *    `ResourceReference` entities are `Ref` intrinsic functions that refer
  /// to resources in the template, such as `{ "Ref" : "MyEC2InstanceResource"
  /// }`.
  ///
  /// *    `ParameterReference` entities are `Ref` intrinsic functions that get
  /// template parameter values, such as `{ "Ref" : "MyPasswordParameter" }`.
  ///
  /// *    `ResourceAttribute` entities are `Fn::GetAtt` intrinsic functions
  /// that get resource attribute values, such as `{ "Fn::GetAtt" :
  /// [ "MyEC2InstanceResource", "PublicDnsName" ] }`.
  ///
  /// *    `DirectModification` entities are changes that are made directly to
  /// the template.
  ///
  /// *    `Automatic` entities are `AWS::CloudFormation::Stack` resource types,
  /// which are also known as nested stacks. If you made no changes to the
  /// `AWS::CloudFormation::Stack` resource, AWS CloudFormation sets the
  /// `ChangeSource` to `Automatic` because the nested stack's template might
  /// have changed. Changes to a nested stack's template aren't visible to AWS
  /// CloudFormation until you run an update on the parent stack.
  final String changeSource;

  /// The identity of the entity that triggered this change. This entity is a
  /// member of the group that is specified by the `ChangeSource` field. For
  /// example, if you modified the value of the `KeyPairName` parameter, the
  /// `CausingEntity` is the name of the parameter (`KeyPairName`).
  ///
  /// If the `ChangeSource` value is `DirectModification`, no value is given for
  /// `CausingEntity`.
  final String causingEntity;

  ResourceChangeDetail({
    this.target,
    this.evaluation,
    this.changeSource,
    this.causingEntity,
  });
  static ResourceChangeDetail fromJson(Map<String, dynamic> json) =>
      ResourceChangeDetail(
        target: json.containsKey('Target')
            ? ResourceTargetDefinition.fromJson(json['Target'])
            : null,
        evaluation: json.containsKey('Evaluation')
            ? json['Evaluation'] as String
            : null,
        changeSource: json.containsKey('ChangeSource')
            ? json['ChangeSource'] as String
            : null,
        causingEntity: json.containsKey('CausingEntity')
            ? json['CausingEntity'] as String
            : null,
      );
}

/// The field that AWS CloudFormation will change, such as the name of a
/// resource's property, and whether the resource will be recreated.
class ResourceTargetDefinition {
  /// Indicates which resource attribute is triggering this update, such as a
  /// change in the resource attribute's `Metadata`, `Properties`, or `Tags`.
  final String attribute;

  /// If the `Attribute` value is `Properties`, the name of the property. For
  /// all other attributes, the value is null.
  final String name;

  /// If the `Attribute` value is `Properties`, indicates whether a change to
  /// this property causes the resource to be recreated. The value can be
  /// `Never`, `Always`, or `Conditionally`. To determine the conditions for a
  /// `Conditionally` recreation, see the update behavior for that
  /// [property](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html)
  /// in the AWS CloudFormation User Guide.
  final String requiresRecreation;

  ResourceTargetDefinition({
    this.attribute,
    this.name,
    this.requiresRecreation,
  });
  static ResourceTargetDefinition fromJson(Map<String, dynamic> json) =>
      ResourceTargetDefinition(
        attribute:
            json.containsKey('Attribute') ? json['Attribute'] as String : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        requiresRecreation: json.containsKey('RequiresRecreation')
            ? json['RequiresRecreation'] as String
            : null,
      );
}

/// Structure containing the rollback triggers for AWS CloudFormation to monitor
/// during stack creation and updating operations, and for the specified
/// monitoring period afterwards.
///
/// Rollback triggers enable you to have AWS CloudFormation monitor the state of
/// your application during stack creation and updating, and to roll back that
/// operation if the application breaches the threshold of any of the alarms
/// you've specified. For more information, see
/// [Monitor and Roll Back Stack Operations](http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-rollback-triggers.html).
class RollbackConfiguration {
  /// The triggers to monitor during stack creation or update actions.
  ///
  /// By default, AWS CloudFormation saves the rollback triggers specified for a
  /// stack and applies them to any subsequent update operations for the stack,
  /// unless you specify otherwise. If you do specify rollback triggers for this
  /// parameter, those triggers replace any list of triggers previously
  /// specified for the stack. This means:
  ///
  /// *   To use the rollback triggers previously specified for this stack, if
  /// any, don't specify this parameter.
  ///
  /// *   To specify new or updated rollback triggers, you must specify _all_
  /// the triggers that you want used for this stack, even triggers you've
  /// specifed before (for example, when creating the stack or during a previous
  /// stack update). Any triggers that you don't include in the updated list of
  /// triggers are no longer applied to the stack.
  ///
  /// *   To remove all currently specified triggers, specify an empty list for
  /// this parameter.
  ///
  ///
  /// If a specified trigger is missing, the entire stack operation fails and is
  /// rolled back.
  final List<RollbackTrigger> rollbackTriggers;

  /// The amount of time, in minutes, during which CloudFormation should monitor
  /// all the rollback triggers after the stack creation or update operation
  /// deploys all necessary resources.
  ///
  /// The default is 0 minutes.
  ///
  /// If you specify a monitoring period but do not specify any rollback
  /// triggers, CloudFormation still waits the specified period of time before
  /// cleaning up old resources after update operations. You can use this
  /// monitoring period to perform any manual stack validation desired, and
  /// manually cancel the stack creation or update (using
  /// [CancelUpdateStack](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_CancelUpdateStack.html),
  /// for example) as necessary.
  ///
  /// If you specify 0 for this parameter, CloudFormation still monitors the
  /// specified rollback triggers during stack creation and update operations.
  /// Then, for update operations, it begins disposing of old resources
  /// immediately once the operation completes.
  final int monitoringTimeInMinutes;

  RollbackConfiguration({
    this.rollbackTriggers,
    this.monitoringTimeInMinutes,
  });
  static RollbackConfiguration fromJson(Map<String, dynamic> json) =>
      RollbackConfiguration(
        rollbackTriggers: json.containsKey('RollbackTriggers')
            ? (json['RollbackTriggers'] as List)
                .map((e) => RollbackTrigger.fromJson(e))
                .toList()
            : null,
        monitoringTimeInMinutes: json.containsKey('MonitoringTimeInMinutes')
            ? json['MonitoringTimeInMinutes'] as int
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A rollback trigger AWS CloudFormation monitors during creation and updating
/// of stacks. If any of the alarms you specify goes to ALARM state during the
/// stack operation or within the specified monitoring period afterwards,
/// CloudFormation rolls back the entire stack operation.
class RollbackTrigger {
  /// The Amazon Resource Name (ARN) of the rollback trigger.
  ///
  /// If a specified trigger is missing, the entire stack operation fails and is
  /// rolled back.
  final String arn;

  /// The resource type of the rollback trigger. Currently,
  /// [AWS::CloudWatch::Alarm](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-cw-alarm.html)
  /// is the only supported resource type.
  final String type;

  RollbackTrigger({
    @required this.arn,
    @required this.type,
  });
  static RollbackTrigger fromJson(Map<String, dynamic> json) => RollbackTrigger(
        arn: json['Arn'] as String,
        type: json['Type'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The Stack data type.
class Stack {
  /// Unique identifier of the stack.
  final String stackId;

  /// The name associated with the stack.
  final String stackName;

  /// The unique ID of the change set.
  final String changeSetId;

  /// A user-defined description associated with the stack.
  final String description;

  /// A list of `Parameter` structures.
  final List<Parameter> parameters;

  /// The time at which the stack was created.
  final DateTime creationTime;

  /// The time the stack was deleted.
  final DateTime deletionTime;

  /// The time the stack was last updated. This field will only be returned if
  /// the stack has been updated at least once.
  final DateTime lastUpdatedTime;

  /// The rollback triggers for AWS CloudFormation to monitor during stack
  /// creation and updating operations, and for the specified monitoring period
  /// afterwards.
  final RollbackConfiguration rollbackConfiguration;

  /// Current status of the stack.
  final String stackStatus;

  /// Success/failure message associated with the stack status.
  final String stackStatusReason;

  /// Boolean to enable or disable rollback on stack creation failures:
  ///
  /// *    `true`: disable rollback
  ///
  /// *    `false`: enable rollback
  final bool disableRollback;

  /// SNS topic ARNs to which stack related events are published.
  final List<String> notificationARNs;

  /// The amount of time within which stack creation should complete.
  final int timeoutInMinutes;

  /// The capabilities allowed in the stack.
  final List<String> capabilities;

  /// A list of output structures.
  final List<Output> outputs;

  /// The Amazon Resource Name (ARN) of an AWS Identity and Access Management
  /// (IAM) role that is associated with the stack. During a stack operation,
  /// AWS CloudFormation uses this role's credentials to make calls on your
  /// behalf.
  final String roleArn;

  /// A list of `Tag`s that specify information about the stack.
  final List<Tag> tags;

  /// Whether termination protection is enabled for the stack.
  ///
  ///  For
  /// [nested stacks](http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-nested-stacks.html),
  /// termination protection is set on the root stack and cannot be changed
  /// directly on the nested stack. For more information, see
  /// [Protecting a Stack From Being Deleted](http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-protect-stacks.html)
  /// in the _AWS CloudFormation User Guide_.
  final bool enableTerminationProtection;

  /// For nested stacks--stacks created as resources for another stack--the
  /// stack ID of the direct parent of this stack. For the first level of nested
  /// stacks, the root stack is also the parent stack.
  ///
  /// For more information, see
  /// [Working with Nested Stacks](http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-nested-stacks.html)
  /// in the _AWS CloudFormation User Guide_.
  final String parentId;

  /// For nested stacks--stacks created as resources for another stack--the
  /// stack ID of the the top-level stack to which the nested stack ultimately
  /// belongs.
  ///
  /// For more information, see
  /// [Working with Nested Stacks](http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-nested-stacks.html)
  /// in the _AWS CloudFormation User Guide_.
  final String rootId;

  /// Information on whether a stack's actual configuration differs, or has
  /// _drifted_, from it's expected configuration, as defined in the stack
  /// template and any values specified as template parameters. For more
  /// information, see
  /// [Detecting Unregulated Configuration Changes to Stacks and Resources](http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html).
  final StackDriftInformation driftInformation;

  Stack({
    this.stackId,
    @required this.stackName,
    this.changeSetId,
    this.description,
    this.parameters,
    @required this.creationTime,
    this.deletionTime,
    this.lastUpdatedTime,
    this.rollbackConfiguration,
    @required this.stackStatus,
    this.stackStatusReason,
    this.disableRollback,
    this.notificationARNs,
    this.timeoutInMinutes,
    this.capabilities,
    this.outputs,
    this.roleArn,
    this.tags,
    this.enableTerminationProtection,
    this.parentId,
    this.rootId,
    this.driftInformation,
  });
  static Stack fromJson(Map<String, dynamic> json) => Stack(
        stackId: json.containsKey('StackId') ? json['StackId'] as String : null,
        stackName: json['StackName'] as String,
        changeSetId: json.containsKey('ChangeSetId')
            ? json['ChangeSetId'] as String
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        parameters: json.containsKey('Parameters')
            ? (json['Parameters'] as List)
                .map((e) => Parameter.fromJson(e))
                .toList()
            : null,
        creationTime: DateTime.parse(json['CreationTime']),
        deletionTime: json.containsKey('DeletionTime')
            ? DateTime.parse(json['DeletionTime'])
            : null,
        lastUpdatedTime: json.containsKey('LastUpdatedTime')
            ? DateTime.parse(json['LastUpdatedTime'])
            : null,
        rollbackConfiguration: json.containsKey('RollbackConfiguration')
            ? RollbackConfiguration.fromJson(json['RollbackConfiguration'])
            : null,
        stackStatus: json['StackStatus'] as String,
        stackStatusReason: json.containsKey('StackStatusReason')
            ? json['StackStatusReason'] as String
            : null,
        disableRollback: json.containsKey('DisableRollback')
            ? json['DisableRollback'] as bool
            : null,
        notificationARNs: json.containsKey('NotificationARNs')
            ? (json['NotificationARNs'] as List)
                .map((e) => e as String)
                .toList()
            : null,
        timeoutInMinutes: json.containsKey('TimeoutInMinutes')
            ? json['TimeoutInMinutes'] as int
            : null,
        capabilities: json.containsKey('Capabilities')
            ? (json['Capabilities'] as List).map((e) => e as String).toList()
            : null,
        outputs: json.containsKey('Outputs')
            ? (json['Outputs'] as List).map((e) => Output.fromJson(e)).toList()
            : null,
        roleArn: json.containsKey('RoleARN') ? json['RoleARN'] as String : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as List).map((e) => Tag.fromJson(e)).toList()
            : null,
        enableTerminationProtection:
            json.containsKey('EnableTerminationProtection')
                ? json['EnableTerminationProtection'] as bool
                : null,
        parentId:
            json.containsKey('ParentId') ? json['ParentId'] as String : null,
        rootId: json.containsKey('RootId') ? json['RootId'] as String : null,
        driftInformation: json.containsKey('DriftInformation')
            ? StackDriftInformation.fromJson(json['DriftInformation'])
            : null,
      );
}

/// Contains information about whether the stack's actual configuration differs,
/// or has _drifted_, from its expected configuration, as defined in the stack
/// template and any values specified as template parameters. A stack is
/// considered to have drifted if one or more of its resources have drifted.
class StackDriftInformation {
  /// Status of the stack's actual configuration compared to its expected
  /// template configuration.
  ///
  /// *    `DRIFTED`: The stack differs from its expected template
  /// configuration. A stack is considered to have drifted if one or more of its
  /// resources have drifted.
  ///
  /// *    `NOT_CHECKED`: AWS CloudFormation has not checked if the stack
  /// differs from its expected template configuration.
  ///
  /// *    `IN_SYNC`: The stack's actual configuration matches its expected
  /// template configuration.
  ///
  /// *    `UNKNOWN`: This value is reserved for future use.
  final String stackDriftStatus;

  /// Most recent time when a drift detection operation was initiated on the
  /// stack, or any of its individual resources that support drift detection.
  final DateTime lastCheckTimestamp;

  StackDriftInformation({
    @required this.stackDriftStatus,
    this.lastCheckTimestamp,
  });
  static StackDriftInformation fromJson(Map<String, dynamic> json) =>
      StackDriftInformation(
        stackDriftStatus: json['StackDriftStatus'] as String,
        lastCheckTimestamp: json.containsKey('LastCheckTimestamp')
            ? DateTime.parse(json['LastCheckTimestamp'])
            : null,
      );
}

/// Contains information about whether the stack's actual configuration differs,
/// or has _drifted_, from its expected configuration, as defined in the stack
/// template and any values specified as template parameters. A stack is
/// considered to have drifted if one or more of its resources have drifted.
class StackDriftInformationSummary {
  /// Status of the stack's actual configuration compared to its expected
  /// template configuration.
  ///
  /// *    `DRIFTED`: The stack differs from its expected template
  /// configuration. A stack is considered to have drifted if one or more of its
  /// resources have drifted.
  ///
  /// *    `NOT_CHECKED`: AWS CloudFormation has not checked if the stack
  /// differs from its expected template configuration.
  ///
  /// *    `IN_SYNC`: The stack's actual configuration matches its expected
  /// template configuration.
  ///
  /// *    `UNKNOWN`: This value is reserved for future use.
  final String stackDriftStatus;

  /// Most recent time when a drift detection operation was initiated on the
  /// stack, or any of its individual resources that support drift detection.
  final DateTime lastCheckTimestamp;

  StackDriftInformationSummary({
    @required this.stackDriftStatus,
    this.lastCheckTimestamp,
  });
  static StackDriftInformationSummary fromJson(Map<String, dynamic> json) =>
      StackDriftInformationSummary(
        stackDriftStatus: json['StackDriftStatus'] as String,
        lastCheckTimestamp: json.containsKey('LastCheckTimestamp')
            ? DateTime.parse(json['LastCheckTimestamp'])
            : null,
      );
}

/// The StackEvent data type.
class StackEvent {
  /// The unique ID name of the instance of the stack.
  final String stackId;

  /// The unique ID of this event.
  final String eventId;

  /// The name associated with a stack.
  final String stackName;

  /// The logical name of the resource specified in the template.
  final String logicalResourceId;

  /// The name or unique identifier associated with the physical instance of the
  /// resource.
  final String physicalResourceId;

  /// Type of resource. (For more information, go to
  /// [AWS Resource Types Reference](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html)
  /// in the AWS CloudFormation User Guide.)
  final String resourceType;

  /// Time the status was updated.
  final DateTime timestamp;

  /// Current status of the resource.
  final String resourceStatus;

  /// Success/failure message associated with the resource.
  final String resourceStatusReason;

  /// BLOB of the properties used to create the resource.
  final String resourceProperties;

  /// The token passed to the operation that generated this event.
  ///
  /// All events triggered by a given stack operation are assigned the same
  /// client request token, which you can use to track operations. For example,
  /// if you execute a `CreateStack` operation with the token `token1`, then all
  /// the `StackEvents` generated by that operation will have
  /// `ClientRequestToken` set as `token1`.
  ///
  /// In the console, stack operations display the client request token on the
  /// Events tab. Stack operations that are initiated from the console use the
  /// token format _Console-StackOperation-ID_, which helps you easily identify
  /// the stack operation . For example, if you create a stack using the
  /// console, each stack event would be assigned the same token in the
  /// following format:
  /// `Console-CreateStack-7f59c3cf-00d2-40c7-b2ff-e75db0987002`.
  final String clientRequestToken;

  StackEvent({
    @required this.stackId,
    @required this.eventId,
    @required this.stackName,
    this.logicalResourceId,
    this.physicalResourceId,
    this.resourceType,
    @required this.timestamp,
    this.resourceStatus,
    this.resourceStatusReason,
    this.resourceProperties,
    this.clientRequestToken,
  });
  static StackEvent fromJson(Map<String, dynamic> json) => StackEvent(
        stackId: json['StackId'] as String,
        eventId: json['EventId'] as String,
        stackName: json['StackName'] as String,
        logicalResourceId: json.containsKey('LogicalResourceId')
            ? json['LogicalResourceId'] as String
            : null,
        physicalResourceId: json.containsKey('PhysicalResourceId')
            ? json['PhysicalResourceId'] as String
            : null,
        resourceType: json.containsKey('ResourceType')
            ? json['ResourceType'] as String
            : null,
        timestamp: DateTime.parse(json['Timestamp']),
        resourceStatus: json.containsKey('ResourceStatus')
            ? json['ResourceStatus'] as String
            : null,
        resourceStatusReason: json.containsKey('ResourceStatusReason')
            ? json['ResourceStatusReason'] as String
            : null,
        resourceProperties: json.containsKey('ResourceProperties')
            ? json['ResourceProperties'] as String
            : null,
        clientRequestToken: json.containsKey('ClientRequestToken')
            ? json['ClientRequestToken'] as String
            : null,
      );
}

/// An AWS CloudFormation stack, in a specific account and region, that's part
/// of a stack set operation. A stack instance is a reference to an attempted or
/// actual stack in a given account within a given region. A stack instance can
/// exist without a stack—for example, if the stack couldn't be created for some
/// reason. A stack instance is associated with only one stack set. Each stack
/// instance contains the ID of its associated stack set, as well as the ID of
/// the actual stack and the stack status.
class StackInstance {
  /// The name or unique ID of the stack set that the stack instance is
  /// associated with.
  final String stackSetId;

  /// The name of the AWS region that the stack instance is associated with.
  final String region;

  /// The name of the AWS account that the stack instance is associated with.
  final String account;

  /// The ID of the stack instance.
  final String stackId;

  /// A list of parameters from the stack set template whose values have been
  /// overridden in this stack instance.
  final List<Parameter> parameterOverrides;

  /// The status of the stack instance, in terms of its synchronization with its
  /// associated stack set.
  ///
  /// *    `INOPERABLE`: A `DeleteStackInstances` operation has failed and left
  /// the stack in an unstable state. Stacks in this state are excluded from
  /// further `UpdateStackSet` operations. You might need to perform a
  /// `DeleteStackInstances` operation, with `RetainStacks` set to `true`, to
  /// delete the stack instance, and then delete the stack manually.
  ///
  /// *    `OUTDATED`: The stack isn't currently up to date with the stack set
  /// because:
  ///
  ///     *   The associated stack failed during a `CreateStackSet` or
  /// `UpdateStackSet` operation.
  ///
  ///     *   The stack was part of a `CreateStackSet` or `UpdateStackSet`
  /// operation that failed or was stopped before the stack was created or
  /// updated.
  ///
  ///
  /// *    `CURRENT`: The stack is currently up to date with the stack set.
  final String status;

  /// The explanation for the specific status code that is assigned to this
  /// stack instance.
  final String statusReason;

  StackInstance({
    this.stackSetId,
    this.region,
    this.account,
    this.stackId,
    this.parameterOverrides,
    this.status,
    this.statusReason,
  });
  static StackInstance fromJson(Map<String, dynamic> json) => StackInstance(
        stackSetId: json.containsKey('StackSetId')
            ? json['StackSetId'] as String
            : null,
        region: json.containsKey('Region') ? json['Region'] as String : null,
        account: json.containsKey('Account') ? json['Account'] as String : null,
        stackId: json.containsKey('StackId') ? json['StackId'] as String : null,
        parameterOverrides: json.containsKey('ParameterOverrides')
            ? (json['ParameterOverrides'] as List)
                .map((e) => Parameter.fromJson(e))
                .toList()
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        statusReason: json.containsKey('StatusReason')
            ? json['StatusReason'] as String
            : null,
      );
}

/// The structure that contains summary information about a stack instance.
class StackInstanceSummary {
  /// The name or unique ID of the stack set that the stack instance is
  /// associated with.
  final String stackSetId;

  /// The name of the AWS region that the stack instance is associated with.
  final String region;

  /// The name of the AWS account that the stack instance is associated with.
  final String account;

  /// The ID of the stack instance.
  final String stackId;

  /// The status of the stack instance, in terms of its synchronization with its
  /// associated stack set.
  ///
  /// *    `INOPERABLE`: A `DeleteStackInstances` operation has failed and left
  /// the stack in an unstable state. Stacks in this state are excluded from
  /// further `UpdateStackSet` operations. You might need to perform a
  /// `DeleteStackInstances` operation, with `RetainStacks` set to `true`, to
  /// delete the stack instance, and then delete the stack manually.
  ///
  /// *    `OUTDATED`: The stack isn't currently up to date with the stack set
  /// because:
  ///
  ///     *   The associated stack failed during a `CreateStackSet` or
  /// `UpdateStackSet` operation.
  ///
  ///     *   The stack was part of a `CreateStackSet` or `UpdateStackSet`
  /// operation that failed or was stopped before the stack was created or
  /// updated.
  ///
  ///
  /// *    `CURRENT`: The stack is currently up to date with the stack set.
  final String status;

  /// The explanation for the specific status code assigned to this stack
  /// instance.
  final String statusReason;

  StackInstanceSummary({
    this.stackSetId,
    this.region,
    this.account,
    this.stackId,
    this.status,
    this.statusReason,
  });
  static StackInstanceSummary fromJson(Map<String, dynamic> json) =>
      StackInstanceSummary(
        stackSetId: json.containsKey('StackSetId')
            ? json['StackSetId'] as String
            : null,
        region: json.containsKey('Region') ? json['Region'] as String : null,
        account: json.containsKey('Account') ? json['Account'] as String : null,
        stackId: json.containsKey('StackId') ? json['StackId'] as String : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        statusReason: json.containsKey('StatusReason')
            ? json['StatusReason'] as String
            : null,
      );
}

/// The StackResource data type.
class StackResource {
  /// The name associated with the stack.
  final String stackName;

  /// Unique identifier of the stack.
  final String stackId;

  /// The logical name of the resource specified in the template.
  final String logicalResourceId;

  /// The name or unique identifier that corresponds to a physical instance ID
  /// of a resource supported by AWS CloudFormation.
  final String physicalResourceId;

  /// Type of resource. (For more information, go to
  /// [AWS Resource Types Reference](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html)
  /// in the AWS CloudFormation User Guide.)
  final String resourceType;

  /// Time the status was updated.
  final DateTime timestamp;

  /// Current status of the resource.
  final String resourceStatus;

  /// Success/failure message associated with the resource.
  final String resourceStatusReason;

  /// User defined description associated with the resource.
  final String description;

  /// Information about whether the resource's actual configuration differs, or
  /// has _drifted_, from its expected configuration, as defined in the stack
  /// template and any values specified as template parameters. For more
  /// information, see
  /// [Detecting Unregulated Configuration Changes to Stacks and Resources](http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html).
  final StackResourceDriftInformation driftInformation;

  StackResource({
    this.stackName,
    this.stackId,
    @required this.logicalResourceId,
    this.physicalResourceId,
    @required this.resourceType,
    @required this.timestamp,
    @required this.resourceStatus,
    this.resourceStatusReason,
    this.description,
    this.driftInformation,
  });
  static StackResource fromJson(Map<String, dynamic> json) => StackResource(
        stackName:
            json.containsKey('StackName') ? json['StackName'] as String : null,
        stackId: json.containsKey('StackId') ? json['StackId'] as String : null,
        logicalResourceId: json['LogicalResourceId'] as String,
        physicalResourceId: json.containsKey('PhysicalResourceId')
            ? json['PhysicalResourceId'] as String
            : null,
        resourceType: json['ResourceType'] as String,
        timestamp: DateTime.parse(json['Timestamp']),
        resourceStatus: json['ResourceStatus'] as String,
        resourceStatusReason: json.containsKey('ResourceStatusReason')
            ? json['ResourceStatusReason'] as String
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        driftInformation: json.containsKey('DriftInformation')
            ? StackResourceDriftInformation.fromJson(json['DriftInformation'])
            : null,
      );
}

/// Contains detailed information about the specified stack resource.
class StackResourceDetail {
  /// The name associated with the stack.
  final String stackName;

  /// Unique identifier of the stack.
  final String stackId;

  /// The logical name of the resource specified in the template.
  final String logicalResourceId;

  /// The name or unique identifier that corresponds to a physical instance ID
  /// of a resource supported by AWS CloudFormation.
  final String physicalResourceId;

  /// Type of resource. ((For more information, go to
  /// [AWS Resource Types Reference](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html)
  /// in the AWS CloudFormation User Guide.)
  final String resourceType;

  /// Time the status was updated.
  final DateTime lastUpdatedTimestamp;

  /// Current status of the resource.
  final String resourceStatus;

  /// Success/failure message associated with the resource.
  final String resourceStatusReason;

  /// User defined description associated with the resource.
  final String description;

  /// The content of the `Metadata` attribute declared for the resource. For
  /// more information, see
  /// [Metadata Attribute](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-attribute-metadata.html)
  /// in the AWS CloudFormation User Guide.
  final String metadata;

  /// Information about whether the resource's actual configuration differs, or
  /// has _drifted_, from its expected configuration, as defined in the stack
  /// template and any values specified as template parameters. For more
  /// information, see
  /// [Detecting Unregulated Configuration Changes to Stacks and Resources](http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html).
  final StackResourceDriftInformation driftInformation;

  StackResourceDetail({
    this.stackName,
    this.stackId,
    @required this.logicalResourceId,
    this.physicalResourceId,
    @required this.resourceType,
    @required this.lastUpdatedTimestamp,
    @required this.resourceStatus,
    this.resourceStatusReason,
    this.description,
    this.metadata,
    this.driftInformation,
  });
  static StackResourceDetail fromJson(Map<String, dynamic> json) =>
      StackResourceDetail(
        stackName:
            json.containsKey('StackName') ? json['StackName'] as String : null,
        stackId: json.containsKey('StackId') ? json['StackId'] as String : null,
        logicalResourceId: json['LogicalResourceId'] as String,
        physicalResourceId: json.containsKey('PhysicalResourceId')
            ? json['PhysicalResourceId'] as String
            : null,
        resourceType: json['ResourceType'] as String,
        lastUpdatedTimestamp: DateTime.parse(json['LastUpdatedTimestamp']),
        resourceStatus: json['ResourceStatus'] as String,
        resourceStatusReason: json.containsKey('ResourceStatusReason')
            ? json['ResourceStatusReason'] as String
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        metadata:
            json.containsKey('Metadata') ? json['Metadata'] as String : null,
        driftInformation: json.containsKey('DriftInformation')
            ? StackResourceDriftInformation.fromJson(json['DriftInformation'])
            : null,
      );
}

/// Contains the drift information for a resource that has been checked for
/// drift. This includes actual and expected property values for resources in
/// which AWS CloudFormation has detected drift. Only resource properties
/// explicitly defined in the stack template are checked for drift. For more
/// information, see
/// [Detecting Unregulated Configuration Changes to Stacks and Resources](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html).
///
/// Resources that do not currently support drift detection cannot be checked.
/// For a list of resources that support drift detection, see
/// [Resources that Support Drift Detection](http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift-resource-list.html).
///
/// Use DetectStackResourceDrift to detect drift on individual resources, or
/// DetectStackDrift to detect drift on all resources in a given stack that
/// support drift detection.
class StackResourceDrift {
  /// The ID of the stack.
  final String stackId;

  /// The logical name of the resource specified in the template.
  final String logicalResourceId;

  /// The name or unique identifier that corresponds to a physical instance ID
  /// of a resource supported by AWS CloudFormation.
  final String physicalResourceId;

  /// Context information that enables AWS CloudFormation to uniquely identify a
  /// resource. AWS CloudFormation uses context key-value pairs in cases where a
  /// resource's logical and physical IDs are not enough to uniquely identify
  /// that resource. Each context key-value pair specifies a unique resource
  /// that contains the targeted resource.
  final List<PhysicalResourceIdContextKeyValuePair> physicalResourceIdContext;

  /// The type of the resource.
  final String resourceType;

  /// A JSON structure containing the expected property values of the stack
  /// resource, as defined in the stack template and any values specified as
  /// template parameters.
  ///
  /// For resources whose `StackResourceDriftStatus` is `DELETED`, this
  /// structure will not be present.
  final String expectedProperties;

  /// A JSON structure containing the actual property values of the stack
  /// resource.
  ///
  /// For resources whose `StackResourceDriftStatus` is `DELETED`, this
  /// structure will not be present.
  final String actualProperties;

  /// A collection of the resource properties whose actual values differ from
  /// their expected values. These will be present only for resources whose
  /// `StackResourceDriftStatus` is `MODIFIED`.
  final List<PropertyDifference> propertyDifferences;

  /// Status of the resource's actual configuration compared to its expected
  /// configuration
  ///
  /// *    `DELETED`: The resource differs from its expected template
  /// configuration because the resource has been deleted.
  ///
  /// *    `MODIFIED`: One or more resource properties differ from their
  /// expected values (as defined in the stack template and any values specified
  /// as template parameters).
  ///
  /// *    `IN_SYNC`: The resources's actual configuration matches its expected
  /// template configuration.
  ///
  /// *    `NOT_CHECKED`: AWS CloudFormation does not currently return this
  /// value.
  final String stackResourceDriftStatus;

  /// Time at which AWS CloudFormation performed drift detection on the stack
  /// resource.
  final DateTime timestamp;

  StackResourceDrift({
    @required this.stackId,
    @required this.logicalResourceId,
    this.physicalResourceId,
    this.physicalResourceIdContext,
    @required this.resourceType,
    this.expectedProperties,
    this.actualProperties,
    this.propertyDifferences,
    @required this.stackResourceDriftStatus,
    @required this.timestamp,
  });
  static StackResourceDrift fromJson(Map<String, dynamic> json) =>
      StackResourceDrift(
        stackId: json['StackId'] as String,
        logicalResourceId: json['LogicalResourceId'] as String,
        physicalResourceId: json.containsKey('PhysicalResourceId')
            ? json['PhysicalResourceId'] as String
            : null,
        physicalResourceIdContext: json.containsKey('PhysicalResourceIdContext')
            ? (json['PhysicalResourceIdContext'] as List)
                .map((e) => PhysicalResourceIdContextKeyValuePair.fromJson(e))
                .toList()
            : null,
        resourceType: json['ResourceType'] as String,
        expectedProperties: json.containsKey('ExpectedProperties')
            ? json['ExpectedProperties'] as String
            : null,
        actualProperties: json.containsKey('ActualProperties')
            ? json['ActualProperties'] as String
            : null,
        propertyDifferences: json.containsKey('PropertyDifferences')
            ? (json['PropertyDifferences'] as List)
                .map((e) => PropertyDifference.fromJson(e))
                .toList()
            : null,
        stackResourceDriftStatus: json['StackResourceDriftStatus'] as String,
        timestamp: DateTime.parse(json['Timestamp']),
      );
}

/// Contains information about whether the resource's actual configuration
/// differs, or has _drifted_, from its expected configuration.
class StackResourceDriftInformation {
  /// Status of the resource's actual configuration compared to its expected
  /// configuration
  ///
  /// *    `DELETED`: The resource differs from its expected configuration in
  /// that it has been deleted.
  ///
  /// *    `MODIFIED`: The resource differs from its expected configuration.
  ///
  /// *    `NOT_CHECKED`: AWS CloudFormation has not checked if the resource
  /// differs from its expected configuration.
  ///
  ///     Any resources that do not currently support drift detection have a
  /// status of `NOT_CHECKED`. For more information, see
  /// [Resources that Support Drift Detection](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift-resource-list.html).
  ///
  /// *    `IN_SYNC`: The resources's actual configuration matches its expected
  /// configuration.
  final String stackResourceDriftStatus;

  /// When AWS CloudFormation last checked if the resource had drifted from its
  /// expected configuration.
  final DateTime lastCheckTimestamp;

  StackResourceDriftInformation({
    @required this.stackResourceDriftStatus,
    this.lastCheckTimestamp,
  });
  static StackResourceDriftInformation fromJson(Map<String, dynamic> json) =>
      StackResourceDriftInformation(
        stackResourceDriftStatus: json['StackResourceDriftStatus'] as String,
        lastCheckTimestamp: json.containsKey('LastCheckTimestamp')
            ? DateTime.parse(json['LastCheckTimestamp'])
            : null,
      );
}

/// Summarizes information about whether the resource's actual configuration
/// differs, or has _drifted_, from its expected configuration.
class StackResourceDriftInformationSummary {
  /// Status of the resource's actual configuration compared to its expected
  /// configuration
  ///
  /// *    `DELETED`: The resource differs from its expected configuration in
  /// that it has been deleted.
  ///
  /// *    `MODIFIED`: The resource differs from its expected configuration.
  ///
  /// *    `NOT_CHECKED`: AWS CloudFormation has not checked if the resource
  /// differs from its expected configuration.
  ///
  ///     Any resources that do not currently support drift detection have a
  /// status of `NOT_CHECKED`. For more information, see
  /// [Resources that Support Drift Detection](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift-resource-list.html).
  /// If you performed an ContinueUpdateRollback operation on a stack, any
  /// resources included in `ResourcesToSkip` will also have a status of
  /// `NOT_CHECKED`. For more information on skipping resources during rollback
  /// operations, see
  /// [Continue Rolling Back an Update](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-updating-stacks-continueupdaterollback.html)
  /// in the AWS CloudFormation User Guide.
  ///
  /// *    `IN_SYNC`: The resources's actual configuration matches its expected
  /// configuration.
  final String stackResourceDriftStatus;

  /// When AWS CloudFormation last checked if the resource had drifted from its
  /// expected configuration.
  final DateTime lastCheckTimestamp;

  StackResourceDriftInformationSummary({
    @required this.stackResourceDriftStatus,
    this.lastCheckTimestamp,
  });
  static StackResourceDriftInformationSummary fromJson(
          Map<String, dynamic> json) =>
      StackResourceDriftInformationSummary(
        stackResourceDriftStatus: json['StackResourceDriftStatus'] as String,
        lastCheckTimestamp: json.containsKey('LastCheckTimestamp')
            ? DateTime.parse(json['LastCheckTimestamp'])
            : null,
      );
}

/// Contains high-level information about the specified stack resource.
class StackResourceSummary {
  /// The logical name of the resource specified in the template.
  final String logicalResourceId;

  /// The name or unique identifier that corresponds to a physical instance ID
  /// of the resource.
  final String physicalResourceId;

  /// Type of resource. (For more information, go to
  /// [AWS Resource Types Reference](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html)
  /// in the AWS CloudFormation User Guide.)
  final String resourceType;

  /// Time the status was updated.
  final DateTime lastUpdatedTimestamp;

  /// Current status of the resource.
  final String resourceStatus;

  /// Success/failure message associated with the resource.
  final String resourceStatusReason;

  /// Information about whether the resource's actual configuration differs, or
  /// has _drifted_, from its expected configuration, as defined in the stack
  /// template and any values specified as template parameters. For more
  /// information, see
  /// [Detecting Unregulated Configuration Changes to Stacks and Resources](http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html).
  final StackResourceDriftInformationSummary driftInformation;

  StackResourceSummary({
    @required this.logicalResourceId,
    this.physicalResourceId,
    @required this.resourceType,
    @required this.lastUpdatedTimestamp,
    @required this.resourceStatus,
    this.resourceStatusReason,
    this.driftInformation,
  });
  static StackResourceSummary fromJson(Map<String, dynamic> json) =>
      StackResourceSummary(
        logicalResourceId: json['LogicalResourceId'] as String,
        physicalResourceId: json.containsKey('PhysicalResourceId')
            ? json['PhysicalResourceId'] as String
            : null,
        resourceType: json['ResourceType'] as String,
        lastUpdatedTimestamp: DateTime.parse(json['LastUpdatedTimestamp']),
        resourceStatus: json['ResourceStatus'] as String,
        resourceStatusReason: json.containsKey('ResourceStatusReason')
            ? json['ResourceStatusReason'] as String
            : null,
        driftInformation: json.containsKey('DriftInformation')
            ? StackResourceDriftInformationSummary.fromJson(
                json['DriftInformation'])
            : null,
      );
}

/// A structure that contains information about a stack set. A stack set enables
/// you to provision stacks into AWS accounts and across regions by using a
/// single CloudFormation template. In the stack set, you specify the template
/// to use, as well as any parameters and capabilities that the template
/// requires.
class StackSet {
  /// The name that's associated with the stack set.
  final String stackSetName;

  /// The ID of the stack set.
  final String stackSetId;

  /// A description of the stack set that you specify when the stack set is
  /// created or updated.
  final String description;

  /// The status of the stack set.
  final String status;

  /// The structure that contains the body of the template that was used to
  /// create or update the stack set.
  final String templateBody;

  /// A list of input parameters for a stack set.
  final List<Parameter> parameters;

  /// The capabilities that are allowed in the stack set. Some stack set
  /// templates might include resources that can affect permissions in your AWS
  /// account—for example, by creating new AWS Identity and Access Management
  /// (IAM) users. For more information, see
  /// [Acknowledging IAM Resources in AWS CloudFormation Templates.](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-iam-template.html#capabilities)
  final List<String> capabilities;

  /// A list of tags that specify information about the stack set. A maximum
  /// number of 50 tags can be specified.
  final List<Tag> tags;

  /// The Amazon Resource Number (ARN) of the stack set.
  final String stackSetArn;

  /// The Amazon Resource Number (ARN) of the IAM role used to create or update
  /// the stack set.
  ///
  /// Use customized administrator roles to control which users or groups can
  /// manage specific stack sets within the same administrator account. For more
  /// information, see
  /// [Prerequisites: Granting Permissions for Stack Set Operations](http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-prereqs.html)
  /// in the _AWS CloudFormation User Guide_.
  final String administrationRoleArn;

  /// The name of the IAM execution role used to create or update the stack set.
  ///
  /// Use customized execution roles to control which stack resources users and
  /// groups can include in their stack sets.
  final String executionRoleName;

  StackSet({
    this.stackSetName,
    this.stackSetId,
    this.description,
    this.status,
    this.templateBody,
    this.parameters,
    this.capabilities,
    this.tags,
    this.stackSetArn,
    this.administrationRoleArn,
    this.executionRoleName,
  });
  static StackSet fromJson(Map<String, dynamic> json) => StackSet(
        stackSetName: json.containsKey('StackSetName')
            ? json['StackSetName'] as String
            : null,
        stackSetId: json.containsKey('StackSetId')
            ? json['StackSetId'] as String
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        templateBody: json.containsKey('TemplateBody')
            ? json['TemplateBody'] as String
            : null,
        parameters: json.containsKey('Parameters')
            ? (json['Parameters'] as List)
                .map((e) => Parameter.fromJson(e))
                .toList()
            : null,
        capabilities: json.containsKey('Capabilities')
            ? (json['Capabilities'] as List).map((e) => e as String).toList()
            : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as List).map((e) => Tag.fromJson(e)).toList()
            : null,
        stackSetArn: json.containsKey('StackSetARN')
            ? json['StackSetARN'] as String
            : null,
        administrationRoleArn: json.containsKey('AdministrationRoleARN')
            ? json['AdministrationRoleARN'] as String
            : null,
        executionRoleName: json.containsKey('ExecutionRoleName')
            ? json['ExecutionRoleName'] as String
            : null,
      );
}

/// The structure that contains information about a stack set operation.
class StackSetOperation {
  /// The unique ID of a stack set operation.
  final String operationId;

  /// The ID of the stack set.
  final String stackSetId;

  /// The type of stack set operation: `CREATE`, `UPDATE`, or `DELETE`. Create
  /// and delete operations affect only the specified stack set instances that
  /// are associated with the specified stack set. Update operations affect both
  /// the stack set itself, as well as _all_ associated stack set instances.
  final String action;

  /// The status of the operation.
  ///
  /// *    `FAILED`: The operation exceeded the specified failure tolerance. The
  /// failure tolerance value that you've set for an operation is applied for
  /// each region during stack create and update operations. If the number of
  /// failed stacks within a region exceeds the failure tolerance, the status of
  /// the operation in the region is set to `FAILED`. This in turn sets the
  /// status of the operation as a whole to `FAILED`, and AWS CloudFormation
  /// cancels the operation in any remaining regions.
  ///
  /// *    `RUNNING`: The operation is currently being performed.
  ///
  /// *    `STOPPED`: The user has cancelled the operation.
  ///
  /// *    `STOPPING`: The operation is in the process of stopping, at user
  /// request.
  ///
  /// *    `SUCCEEDED`: The operation completed creating or updating all the
  /// specified stacks without exceeding the failure tolerance for the
  /// operation.
  final String status;

  /// The preferences for how AWS CloudFormation performs this stack set
  /// operation.
  final StackSetOperationPreferences operationPreferences;

  /// For stack set operations of action type `DELETE`, specifies whether to
  /// remove the stack instances from the specified stack set, but doesn't
  /// delete the stacks. You can't reassociate a retained stack, or add an
  /// existing, saved stack to a new stack set.
  final bool retainStacks;

  /// The Amazon Resource Number (ARN) of the IAM role used to perform this
  /// stack set operation.
  ///
  /// Use customized administrator roles to control which users or groups can
  /// manage specific stack sets within the same administrator account. For more
  /// information, see
  /// [Define Permissions for Multiple Administrators](http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-prereqs.html)
  /// in the _AWS CloudFormation User Guide_.
  final String administrationRoleArn;

  /// The name of the IAM execution role used to create or update the stack set.
  ///
  /// Use customized execution roles to control which stack resources users and
  /// groups can include in their stack sets.
  final String executionRoleName;

  /// The time at which the operation was initiated. Note that the creation
  /// times for the stack set operation might differ from the creation time of
  /// the individual stacks themselves. This is because AWS CloudFormation needs
  /// to perform preparatory work for the operation, such as dispatching the
  /// work to the requested regions, before actually creating the first stacks.
  final DateTime creationTimestamp;

  /// The time at which the stack set operation ended, across all accounts and
  /// regions specified. Note that this doesn't necessarily mean that the stack
  /// set operation was successful, or even attempted, in each account or
  /// region.
  final DateTime endTimestamp;

  StackSetOperation({
    this.operationId,
    this.stackSetId,
    this.action,
    this.status,
    this.operationPreferences,
    this.retainStacks,
    this.administrationRoleArn,
    this.executionRoleName,
    this.creationTimestamp,
    this.endTimestamp,
  });
  static StackSetOperation fromJson(Map<String, dynamic> json) =>
      StackSetOperation(
        operationId: json.containsKey('OperationId')
            ? json['OperationId'] as String
            : null,
        stackSetId: json.containsKey('StackSetId')
            ? json['StackSetId'] as String
            : null,
        action: json.containsKey('Action') ? json['Action'] as String : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        operationPreferences: json.containsKey('OperationPreferences')
            ? StackSetOperationPreferences.fromJson(
                json['OperationPreferences'])
            : null,
        retainStacks: json.containsKey('RetainStacks')
            ? json['RetainStacks'] as bool
            : null,
        administrationRoleArn: json.containsKey('AdministrationRoleARN')
            ? json['AdministrationRoleARN'] as String
            : null,
        executionRoleName: json.containsKey('ExecutionRoleName')
            ? json['ExecutionRoleName'] as String
            : null,
        creationTimestamp: json.containsKey('CreationTimestamp')
            ? DateTime.parse(json['CreationTimestamp'])
            : null,
        endTimestamp: json.containsKey('EndTimestamp')
            ? DateTime.parse(json['EndTimestamp'])
            : null,
      );
}

/// The user-specified preferences for how AWS CloudFormation performs a stack
/// set operation.
///
/// For more information on maximum concurrent accounts and failure tolerance,
/// see
/// [Stack set operation options](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-concepts.html#stackset-ops-options).
class StackSetOperationPreferences {
  /// The order of the regions in where you want to perform the stack operation.
  final List<String> regionOrder;

  /// The number of accounts, per region, for which this operation can fail
  /// before AWS CloudFormation stops the operation in that region. If the
  /// operation is stopped in a region, AWS CloudFormation doesn't attempt the
  /// operation in any subsequent regions.
  ///
  /// Conditional: You must specify either `FailureToleranceCount` or
  /// `FailureTolerancePercentage` (but not both).
  final int failureToleranceCount;

  /// The percentage of accounts, per region, for which this stack operation can
  /// fail before AWS CloudFormation stops the operation in that region. If the
  /// operation is stopped in a region, AWS CloudFormation doesn't attempt the
  /// operation in any subsequent regions.
  ///
  /// When calculating the number of accounts based on the specified percentage,
  /// AWS CloudFormation rounds _down_ to the next whole number.
  ///
  /// Conditional: You must specify either `FailureToleranceCount` or
  /// `FailureTolerancePercentage`, but not both.
  final int failureTolerancePercentage;

  /// The maximum number of accounts in which to perform this operation at one
  /// time. This is dependent on the value of
  /// `FailureToleranceCount`—`MaxConcurrentCount` is at most one more than the
  /// `FailureToleranceCount` .
  ///
  /// Note that this setting lets you specify the _maximum_ for operations. For
  /// large deployments, under certain circumstances the actual number of
  /// accounts acted upon concurrently may be lower due to service throttling.
  ///
  /// Conditional: You must specify either `MaxConcurrentCount` or
  /// `MaxConcurrentPercentage`, but not both.
  final int maxConcurrentCount;

  /// The maximum percentage of accounts in which to perform this operation at
  /// one time.
  ///
  /// When calculating the number of accounts based on the specified percentage,
  /// AWS CloudFormation rounds down to the next whole number. This is true
  /// except in cases where rounding down would result is zero. In this case,
  /// CloudFormation sets the number as one instead.
  ///
  /// Note that this setting lets you specify the _maximum_ for operations. For
  /// large deployments, under certain circumstances the actual number of
  /// accounts acted upon concurrently may be lower due to service throttling.
  ///
  /// Conditional: You must specify either `MaxConcurrentCount` or
  /// `MaxConcurrentPercentage`, but not both.
  final int maxConcurrentPercentage;

  StackSetOperationPreferences({
    this.regionOrder,
    this.failureToleranceCount,
    this.failureTolerancePercentage,
    this.maxConcurrentCount,
    this.maxConcurrentPercentage,
  });
  static StackSetOperationPreferences fromJson(Map<String, dynamic> json) =>
      StackSetOperationPreferences(
        regionOrder: json.containsKey('RegionOrder')
            ? (json['RegionOrder'] as List).map((e) => e as String).toList()
            : null,
        failureToleranceCount: json.containsKey('FailureToleranceCount')
            ? json['FailureToleranceCount'] as int
            : null,
        failureTolerancePercentage:
            json.containsKey('FailureTolerancePercentage')
                ? json['FailureTolerancePercentage'] as int
                : null,
        maxConcurrentCount: json.containsKey('MaxConcurrentCount')
            ? json['MaxConcurrentCount'] as int
            : null,
        maxConcurrentPercentage: json.containsKey('MaxConcurrentPercentage')
            ? json['MaxConcurrentPercentage'] as int
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The structure that contains information about a specified operation's
/// results for a given account in a given region.
class StackSetOperationResultSummary {
  /// The name of the AWS account for this operation result.
  final String account;

  /// The name of the AWS region for this operation result.
  final String region;

  /// The result status of the stack set operation for the given account in the
  /// given region.
  ///
  /// *    `CANCELLED`: The operation in the specified account and region has
  /// been cancelled. This is either because a user has stopped the stack set
  /// operation, or because the failure tolerance of the stack set operation has
  /// been exceeded.
  ///
  /// *    `FAILED`: The operation in the specified account and region failed.
  ///
  ///     If the stack set operation fails in enough accounts within a region,
  /// the failure tolerance for the stack set operation as a whole might be
  /// exceeded.
  ///
  /// *    `RUNNING`: The operation in the specified account and region is
  /// currently in progress.
  ///
  /// *    `PENDING`: The operation in the specified account and region has yet
  /// to start.
  ///
  /// *    `SUCCEEDED`: The operation in the specified account and region
  /// completed successfully.
  final String status;

  /// The reason for the assigned result status.
  final String statusReason;

  /// The results of the account gate function AWS CloudFormation invokes, if
  /// present, before proceeding with stack set operations in an account
  final AccountGateResult accountGateResult;

  StackSetOperationResultSummary({
    this.account,
    this.region,
    this.status,
    this.statusReason,
    this.accountGateResult,
  });
  static StackSetOperationResultSummary fromJson(Map<String, dynamic> json) =>
      StackSetOperationResultSummary(
        account: json.containsKey('Account') ? json['Account'] as String : null,
        region: json.containsKey('Region') ? json['Region'] as String : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        statusReason: json.containsKey('StatusReason')
            ? json['StatusReason'] as String
            : null,
        accountGateResult: json.containsKey('AccountGateResult')
            ? AccountGateResult.fromJson(json['AccountGateResult'])
            : null,
      );
}

/// The structures that contain summary information about the specified
/// operation.
class StackSetOperationSummary {
  /// The unique ID of the stack set operation.
  final String operationId;

  /// The type of operation: `CREATE`, `UPDATE`, or `DELETE`. Create and delete
  /// operations affect only the specified stack instances that are associated
  /// with the specified stack set. Update operations affect both the stack set
  /// itself as well as _all_ associated stack set instances.
  final String action;

  /// The overall status of the operation.
  ///
  /// *    `FAILED`: The operation exceeded the specified failure tolerance. The
  /// failure tolerance value that you've set for an operation is applied for
  /// each region during stack create and update operations. If the number of
  /// failed stacks within a region exceeds the failure tolerance, the status of
  /// the operation in the region is set to `FAILED`. This in turn sets the
  /// status of the operation as a whole to `FAILED`, and AWS CloudFormation
  /// cancels the operation in any remaining regions.
  ///
  /// *    `RUNNING`: The operation is currently being performed.
  ///
  /// *    `STOPPED`: The user has cancelled the operation.
  ///
  /// *    `STOPPING`: The operation is in the process of stopping, at user
  /// request.
  ///
  /// *    `SUCCEEDED`: The operation completed creating or updating all the
  /// specified stacks without exceeding the failure tolerance for the
  /// operation.
  final String status;

  /// The time at which the operation was initiated. Note that the creation
  /// times for the stack set operation might differ from the creation time of
  /// the individual stacks themselves. This is because AWS CloudFormation needs
  /// to perform preparatory work for the operation, such as dispatching the
  /// work to the requested regions, before actually creating the first stacks.
  final DateTime creationTimestamp;

  /// The time at which the stack set operation ended, across all accounts and
  /// regions specified. Note that this doesn't necessarily mean that the stack
  /// set operation was successful, or even attempted, in each account or
  /// region.
  final DateTime endTimestamp;

  StackSetOperationSummary({
    this.operationId,
    this.action,
    this.status,
    this.creationTimestamp,
    this.endTimestamp,
  });
  static StackSetOperationSummary fromJson(Map<String, dynamic> json) =>
      StackSetOperationSummary(
        operationId: json.containsKey('OperationId')
            ? json['OperationId'] as String
            : null,
        action: json.containsKey('Action') ? json['Action'] as String : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        creationTimestamp: json.containsKey('CreationTimestamp')
            ? DateTime.parse(json['CreationTimestamp'])
            : null,
        endTimestamp: json.containsKey('EndTimestamp')
            ? DateTime.parse(json['EndTimestamp'])
            : null,
      );
}

/// The structures that contain summary information about the specified stack
/// set.
class StackSetSummary {
  /// The name of the stack set.
  final String stackSetName;

  /// The ID of the stack set.
  final String stackSetId;

  /// A description of the stack set that you specify when the stack set is
  /// created or updated.
  final String description;

  /// The status of the stack set.
  final String status;

  StackSetSummary({
    this.stackSetName,
    this.stackSetId,
    this.description,
    this.status,
  });
  static StackSetSummary fromJson(Map<String, dynamic> json) => StackSetSummary(
        stackSetName: json.containsKey('StackSetName')
            ? json['StackSetName'] as String
            : null,
        stackSetId: json.containsKey('StackSetId')
            ? json['StackSetId'] as String
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
      );
}

/// The StackSummary Data Type
class StackSummary {
  /// Unique stack identifier.
  final String stackId;

  /// The name associated with the stack.
  final String stackName;

  /// The template description of the template used to create the stack.
  final String templateDescription;

  /// The time the stack was created.
  final DateTime creationTime;

  /// The time the stack was last updated. This field will only be returned if
  /// the stack has been updated at least once.
  final DateTime lastUpdatedTime;

  /// The time the stack was deleted.
  final DateTime deletionTime;

  /// The current status of the stack.
  final String stackStatus;

  /// Success/Failure message associated with the stack status.
  final String stackStatusReason;

  /// For nested stacks--stacks created as resources for another stack--the
  /// stack ID of the direct parent of this stack. For the first level of nested
  /// stacks, the root stack is also the parent stack.
  ///
  /// For more information, see
  /// [Working with Nested Stacks](http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-nested-stacks.html)
  /// in the _AWS CloudFormation User Guide_.
  final String parentId;

  /// For nested stacks--stacks created as resources for another stack--the
  /// stack ID of the the top-level stack to which the nested stack ultimately
  /// belongs.
  ///
  /// For more information, see
  /// [Working with Nested Stacks](http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-nested-stacks.html)
  /// in the _AWS CloudFormation User Guide_.
  final String rootId;

  /// Summarizes information on whether a stack's actual configuration differs,
  /// or has _drifted_, from it's expected configuration, as defined in the
  /// stack template and any values specified as template parameters. For more
  /// information, see
  /// [Detecting Unregulated Configuration Changes to Stacks and Resources](http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html).
  final StackDriftInformationSummary driftInformation;

  StackSummary({
    this.stackId,
    @required this.stackName,
    this.templateDescription,
    @required this.creationTime,
    this.lastUpdatedTime,
    this.deletionTime,
    @required this.stackStatus,
    this.stackStatusReason,
    this.parentId,
    this.rootId,
    this.driftInformation,
  });
  static StackSummary fromJson(Map<String, dynamic> json) => StackSummary(
        stackId: json.containsKey('StackId') ? json['StackId'] as String : null,
        stackName: json['StackName'] as String,
        templateDescription: json.containsKey('TemplateDescription')
            ? json['TemplateDescription'] as String
            : null,
        creationTime: DateTime.parse(json['CreationTime']),
        lastUpdatedTime: json.containsKey('LastUpdatedTime')
            ? DateTime.parse(json['LastUpdatedTime'])
            : null,
        deletionTime: json.containsKey('DeletionTime')
            ? DateTime.parse(json['DeletionTime'])
            : null,
        stackStatus: json['StackStatus'] as String,
        stackStatusReason: json.containsKey('StackStatusReason')
            ? json['StackStatusReason'] as String
            : null,
        parentId:
            json.containsKey('ParentId') ? json['ParentId'] as String : null,
        rootId: json.containsKey('RootId') ? json['RootId'] as String : null,
        driftInformation: json.containsKey('DriftInformation')
            ? StackDriftInformationSummary.fromJson(json['DriftInformation'])
            : null,
      );
}

class StopStackSetOperationOutput {
  StopStackSetOperationOutput();
  static StopStackSetOperationOutput fromJson(Map<String, dynamic> json) =>
      StopStackSetOperationOutput();
}

/// The Tag type enables you to specify a key-value pair that can be used to
/// store information about an AWS CloudFormation stack.
class Tag {
  ///  _Required_. A string used to identify this tag. You can specify a maximum
  /// of 128 characters for a tag key. Tags owned by Amazon Web Services (AWS)
  /// have the reserved prefix: `aws:`.
  final String key;

  ///  _Required_. A string containing the value for this tag. You can specify a
  /// maximum of 256 characters for a tag value.
  final String value;

  Tag({
    @required this.key,
    @required this.value,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag(
        key: json['Key'] as String,
        value: json['Value'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The TemplateParameter data type.
class TemplateParameter {
  /// The name associated with the parameter.
  final String parameterKey;

  /// The default value associated with the parameter.
  final String defaultValue;

  /// Flag indicating whether the parameter should be displayed as plain text in
  /// logs and UIs.
  final bool noEcho;

  /// User defined description associated with the parameter.
  final String description;

  TemplateParameter({
    this.parameterKey,
    this.defaultValue,
    this.noEcho,
    this.description,
  });
  static TemplateParameter fromJson(Map<String, dynamic> json) =>
      TemplateParameter(
        parameterKey: json.containsKey('ParameterKey')
            ? json['ParameterKey'] as String
            : null,
        defaultValue: json.containsKey('DefaultValue')
            ? json['DefaultValue'] as String
            : null,
        noEcho: json.containsKey('NoEcho') ? json['NoEcho'] as bool : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
      );
}

class UpdateStackInstancesOutput {
  /// The unique identifier for this stack set operation.
  final String operationId;

  UpdateStackInstancesOutput({
    this.operationId,
  });
  static UpdateStackInstancesOutput fromJson(Map<String, dynamic> json) =>
      UpdateStackInstancesOutput(
        operationId: json.containsKey('OperationId')
            ? json['OperationId'] as String
            : null,
      );
}

/// The output for an UpdateStack action.
class UpdateStackOutput {
  /// Unique identifier of the stack.
  final String stackId;

  UpdateStackOutput({
    this.stackId,
  });
  static UpdateStackOutput fromJson(Map<String, dynamic> json) =>
      UpdateStackOutput(
        stackId: json.containsKey('StackId') ? json['StackId'] as String : null,
      );
}

class UpdateStackSetOutput {
  /// The unique ID for this stack set operation.
  final String operationId;

  UpdateStackSetOutput({
    this.operationId,
  });
  static UpdateStackSetOutput fromJson(Map<String, dynamic> json) =>
      UpdateStackSetOutput(
        operationId: json.containsKey('OperationId')
            ? json['OperationId'] as String
            : null,
      );
}

class UpdateTerminationProtectionOutput {
  /// The unique ID of the stack.
  final String stackId;

  UpdateTerminationProtectionOutput({
    this.stackId,
  });
  static UpdateTerminationProtectionOutput fromJson(
          Map<String, dynamic> json) =>
      UpdateTerminationProtectionOutput(
        stackId: json.containsKey('StackId') ? json['StackId'] as String : null,
      );
}

/// The output for ValidateTemplate action.
class ValidateTemplateOutput {
  /// A list of `TemplateParameter` structures.
  final List<TemplateParameter> parameters;

  /// The description found within the template.
  final String description;

  /// The capabilities found within the template. If your template contains IAM
  /// resources, you must specify the CAPABILITY_IAM or CAPABILITY_NAMED_IAM
  /// value for this parameter when you use the CreateStack or UpdateStack
  /// actions with your template; otherwise, those actions return an
  /// InsufficientCapabilities error.
  ///
  /// For more information, see
  /// [Acknowledging IAM Resources in AWS CloudFormation Templates](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-iam-template.html#capabilities).
  final List<String> capabilities;

  /// The list of resources that generated the values in the `Capabilities`
  /// response element.
  final String capabilitiesReason;

  /// A list of the transforms that are declared in the template.
  final List<String> declaredTransforms;

  ValidateTemplateOutput({
    this.parameters,
    this.description,
    this.capabilities,
    this.capabilitiesReason,
    this.declaredTransforms,
  });
  static ValidateTemplateOutput fromJson(Map<String, dynamic> json) =>
      ValidateTemplateOutput(
        parameters: json.containsKey('Parameters')
            ? (json['Parameters'] as List)
                .map((e) => TemplateParameter.fromJson(e))
                .toList()
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        capabilities: json.containsKey('Capabilities')
            ? (json['Capabilities'] as List).map((e) => e as String).toList()
            : null,
        capabilitiesReason: json.containsKey('CapabilitiesReason')
            ? json['CapabilitiesReason'] as String
            : null,
        declaredTransforms: json.containsKey('DeclaredTransforms')
            ? (json['DeclaredTransforms'] as List)
                .map((e) => e as String)
                .toList()
            : null,
      );
}
