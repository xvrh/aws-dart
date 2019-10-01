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
/// For more information about AWS CloudFormation, see the [AWS CloudFormation
/// Product Page](http://aws.amazon.com/cloudformation/).
///
/// Amazon CloudFormation makes use of other AWS products. If you need
/// additional technical information about a specific AWS product, you can find
/// the product's technical documentation at
/// [docs.aws.amazon.com](https://docs.aws.amazon.com/).
class CloudFormationApi {
  /// Cancels an update on the specified stack. If the call completes
  /// successfully, the stack rolls back the update and reverts to the previous
  /// stack configuration.
  ///
  ///
  ///
  /// You can cancel only stacks that are in the UPDATE\_IN\_PROGRESS state.
  Future<void> cancelUpdateStack(String stackName,
      {String clientRequestToken}) async {}

  /// For a specified stack that is in the `UPDATE\_ROLLBACK\_FAILED` state,
  /// continues rolling it back to the `UPDATE\_ROLLBACK\_COMPLETE` state.
  /// Depending on the cause of the failure, you can manually  [fix the
  /// error](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/troubleshooting.html#troubleshooting-errors-update-rollback-failed)
  /// and continue the rollback. By continuing the rollback, you can return your
  /// stack to a working state (the `UPDATE\_ROLLBACK\_COMPLETE` state), and
  /// then try to update the stack again.
  ///
  /// A stack goes into the `UPDATE\_ROLLBACK\_FAILED` state when AWS
  /// CloudFormation cannot roll back all changes after a failed stack update.
  /// For example, you might have a stack that is rolling back to an old
  /// database instance that was deleted outside of AWS CloudFormation. Because
  /// AWS CloudFormation doesn't know the database was deleted, it assumes that
  /// the database instance still exists and attempts to roll back to it,
  /// causing the update rollback to fail.
  Future<void> continueUpdateRollback(String stackName,
      {String roleArn,
      List<String> resourcesToSkip,
      String clientRequestToken}) async {}

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
  Future<void> createChangeSet(
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
      String changeSetType}) async {}

  /// Creates a stack as specified in the template. After the call completes
  /// successfully, the stack creation starts. You can check the status of the
  /// stack via the DescribeStacks API.
  Future<void> createStack(String stackName,
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
      bool enableTerminationProtection}) async {}

  /// Creates stack instances for the specified accounts, within the specified
  /// regions. A stack instance refers to a stack in a specific account and
  /// region. `Accounts` and `Regions` are required parameters—you must specify
  /// at least one account and one region.
  Future<void> createStackInstances(
      {@required String stackSetName,
      @required List<String> accounts,
      @required List<String> regions,
      List<Parameter> parameterOverrides,
      StackSetOperationPreferences operationPreferences,
      String operationId}) async {}

  /// Creates a stack set.
  Future<void> createStackSet(String stackSetName,
      {String description,
      String templateBody,
      String templateUrl,
      List<Parameter> parameters,
      List<String> capabilities,
      List<Tag> tags,
      String administrationRoleArn,
      String executionRoleName,
      String clientRequestToken}) async {}

  /// Deletes the specified change set. Deleting change sets ensures that no one
  /// executes the wrong change set.
  ///
  /// If the call successfully completes, AWS CloudFormation successfully
  /// deleted the change set.
  Future<void> deleteChangeSet(String changeSetName,
      {String stackName}) async {}

  /// Deletes a specified stack. Once the call completes successfully, stack
  /// deletion starts. Deleted stacks do not show up in the DescribeStacks API
  /// if the deletion has been completed successfully.
  Future<void> deleteStack(String stackName,
      {List<String> retainResources,
      String roleArn,
      String clientRequestToken}) async {}

  /// Deletes stack instances for the specified accounts, in the specified
  /// regions.
  Future<void> deleteStackInstances(
      {@required String stackSetName,
      @required List<String> accounts,
      @required List<String> regions,
      StackSetOperationPreferences operationPreferences,
      @required bool retainStacks,
      String operationId}) async {}

  /// Deletes a stack set. Before you can delete a stack set, all of its member
  /// stack instances must be deleted. For more information about how to do
  /// this, see DeleteStackInstances.
  Future<void> deleteStackSet(String stackSetName) async {}

  /// Retrieves your account's AWS CloudFormation limits, such as the maximum
  /// number of stacks that you can create in your account. For more information
  /// about account limits, see [AWS CloudFormation
  /// Limits](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/cloudformation-limits.html)
  /// in the _AWS CloudFormation User Guide_.
  Future<void> describeAccountLimits({String nextToken}) async {}

  /// Returns the inputs for the change set and a list of changes that AWS
  /// CloudFormation will make if you execute the change set. For more
  /// information, see [Updating Stacks Using Change
  /// Sets](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-updating-stacks-changesets.html)
  /// in the AWS CloudFormation User Guide.
  Future<void> describeChangeSet(String changeSetName,
      {String stackName, String nextToken}) async {}

  /// Returns information about a stack drift detection operation. A stack drift
  /// detection operation detects whether a stack's actual configuration
  /// differs, or has _drifted_, from it's expected configuration, as defined in
  /// the stack template and any values specified as template parameters. A
  /// stack is considered to have drifted if one or more of its resources have
  /// drifted. For more information on stack and resource drift, see [Detecting
  /// Unregulated Configuration Changes to Stacks and
  /// Resources](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html).
  ///
  /// Use DetectStackDrift to initiate a stack drift detection operation.
  /// `DetectStackDrift` returns a `StackDriftDetectionId` you can use to
  /// monitor the progress of the operation using
  /// `DescribeStackDriftDetectionStatus`. Once the drift detection operation
  /// has completed, use DescribeStackResourceDrifts to return drift information
  /// about the stack and its resources.
  Future<void> describeStackDriftDetectionStatus(
      String stackDriftDetectionId) async {}

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
  Future<void> describeStackEvents(
      {String stackName, String nextToken}) async {}

  /// Returns the stack instance that's associated with the specified stack set,
  /// AWS account, and region.
  ///
  /// For a list of stack instances that are associated with a specific stack
  /// set, use ListStackInstances.
  Future<void> describeStackInstance(
      {@required String stackSetName,
      @required String stackInstanceAccount,
      @required String stackInstanceRegion}) async {}

  /// Returns a description of the specified resource in the specified stack.
  ///
  /// For deleted stacks, DescribeStackResource returns resource information for
  /// up to 90 days after the stack has been deleted.
  Future<void> describeStackResource(
      {@required String stackName, @required String logicalResourceId}) async {}

  /// Returns drift information for the resources that have been checked for
  /// drift in the specified stack. This includes actual and expected
  /// configuration values for resources where AWS CloudFormation detects
  /// configuration drift.
  ///
  /// For a given stack, there will be one `StackResourceDrift` for each stack
  /// resource that has been checked for drift. Resources that have not yet been
  /// checked for drift are not included. Resources that do not currently
  /// support drift detection are not checked, and so not included. For a list
  /// of resources that support drift detection, see [Resources that Support
  /// Drift
  /// Detection](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift-resource-list.html).
  ///
  /// Use DetectStackResourceDrift to detect drift on individual resources, or
  /// DetectStackDrift to detect drift on all supported resources for a given
  /// stack.
  Future<void> describeStackResourceDrifts(String stackName,
      {List<String> stackResourceDriftStatusFilters,
      String nextToken,
      int maxResults}) async {}

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
  /// `PhysicalResourceId`, go to the [AWS CloudFormation User
  /// Guide](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/).
  ///
  ///
  ///
  /// A `ValidationError` is returned if you specify both `StackName` and
  /// `PhysicalResourceId` in the same request.
  Future<void> describeStackResources(
      {String stackName,
      String logicalResourceId,
      String physicalResourceId}) async {}

  /// Returns the description of the specified stack set.
  Future<void> describeStackSet(String stackSetName) async {}

  /// Returns the description of the specified stack set operation.
  Future<void> describeStackSetOperation(
      {@required String stackSetName, @required String operationId}) async {}

  /// Returns the description for the specified stack; if no stack name was
  /// specified, then it returns the description for all the stacks created.
  ///
  ///
  ///
  /// If the stack does not exist, an `AmazonCloudFormationException` is
  /// returned.
  Future<void> describeStacks({String stackName, String nextToken}) async {}

  /// Detects whether a stack's actual configuration differs, or has _drifted_,
  /// from it's expected configuration, as defined in the stack template and any
  /// values specified as template parameters. For each resource in the stack
  /// that supports drift detection, AWS CloudFormation compares the actual
  /// configuration of the resource with its expected template configuration.
  /// Only resource properties explicitly defined in the stack template are
  /// checked for drift. A stack is considered to have drifted if one or more of
  /// its resources differ from their expected template configurations. For more
  /// information, see [Detecting Unregulated Configuration Changes to Stacks
  /// and
  /// Resources](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html).
  ///
  /// Use `DetectStackDrift` to detect drift on all supported resources for a
  /// given stack, or DetectStackResourceDrift to detect drift on individual
  /// resources.
  ///
  /// For a list of stack resources that currently support drift detection, see
  /// [Resources that Support Drift
  /// Detection](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift-resource-list.html).
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
  Future<void> detectStackDrift(String stackName,
      {List<String> logicalResourceIds}) async {}

  /// Returns information about whether a resource's actual configuration
  /// differs, or has _drifted_, from it's expected configuration, as defined in
  /// the stack template and any values specified as template parameters. This
  /// information includes actual and expected property values for resources in
  /// which AWS CloudFormation detects drift. Only resource properties
  /// explicitly defined in the stack template are checked for drift. For more
  /// information about stack and resource drift, see [Detecting Unregulated
  /// Configuration Changes to Stacks and
  /// Resources](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html).
  ///
  /// Use `DetectStackResourceDrift` to detect drift on individual resources, or
  /// DetectStackDrift to detect drift on all resources in a given stack that
  /// support drift detection.
  ///
  /// Resources that do not currently support drift detection cannot be checked.
  /// For a list of resources that support drift detection, see [Resources that
  /// Support Drift
  /// Detection](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift-resource-list.html).
  Future<void> detectStackResourceDrift(
      {@required String stackName, @required String logicalResourceId}) async {}

  /// Returns the estimated monthly cost of a template. The return value is an
  /// AWS Simple Monthly Calculator URL with a query string that describes the
  /// resources required to run the template.
  Future<void> estimateTemplateCost(
      {String templateBody,
      String templateUrl,
      List<Parameter> parameters}) async {}

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
  Future<void> executeChangeSet(String changeSetName,
      {String stackName, String clientRequestToken}) async {}

  /// Returns the stack policy for a specified stack. If a stack doesn't have a
  /// policy, a null value is returned.
  Future<void> getStackPolicy(String stackName) async {}

  /// Returns the template body for a specified stack. You can get the template
  /// for running or deleted stacks.
  ///
  /// For deleted stacks, GetTemplate returns the template for up to 90 days
  /// after the stack has been deleted.
  ///
  ///   If the template does not exist, a `ValidationError` is returned.
  Future<void> getTemplate(
      {String stackName, String changeSetName, String templateStage}) async {}

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
  Future<void> getTemplateSummary(
      {String templateBody,
      String templateUrl,
      String stackName,
      String stackSetName}) async {}

  /// Returns the ID and status of each active change set for a stack. For
  /// example, AWS CloudFormation lists change sets that are in the
  /// `CREATE\_IN\_PROGRESS` or `CREATE_PENDING` state.
  Future<void> listChangeSets(String stackName, {String nextToken}) async {}

  /// Lists all exported output values in the account and region in which you
  /// call this action. Use this action to see the exported output values that
  /// you can import into other stacks. To import values, use the
  /// [`Fn::ImportValue`](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-importvalue.html)
  ///  function.
  ///
  /// For more information, see  [AWS CloudFormation Export Stack Output
  /// Values](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-exports.html).
  Future<void> listExports({String nextToken}) async {}

  /// Lists all stacks that are importing an exported output value. To modify or
  /// remove an exported output value, first use this action to see which stacks
  /// are using it. To see the exported output values in your account, see
  /// ListExports.
  ///
  /// For more information about importing an exported output value, see the
  /// [`Fn::ImportValue`](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference-importvalue.html)
  ///  function.
  Future<void> listImports(String exportName, {String nextToken}) async {}

  /// Returns summary information about stack instances that are associated with
  /// the specified stack set. You can filter for stack instances that are
  /// associated with a specific AWS account name or region.
  Future<void> listStackInstances(String stackSetName,
      {String nextToken,
      int maxResults,
      String stackInstanceAccount,
      String stackInstanceRegion}) async {}

  /// Returns descriptions of all resources of the specified stack.
  ///
  /// For deleted stacks, ListStackResources returns resource information for up
  /// to 90 days after the stack has been deleted.
  Future<void> listStackResources(String stackName, {String nextToken}) async {}

  /// Returns summary information about the results of a stack set operation.
  Future<void> listStackSetOperationResults(
      {@required String stackSetName,
      @required String operationId,
      String nextToken,
      int maxResults}) async {}

  /// Returns summary information about operations performed on a stack set.
  Future<void> listStackSetOperations(String stackSetName,
      {String nextToken, int maxResults}) async {}

  /// Returns summary information about stack sets that are associated with the
  /// user.
  Future<void> listStackSets(
      {String nextToken, int maxResults, String status}) async {}

  /// Returns the summary information for stacks whose status matches the
  /// specified StackStatusFilter. Summary information for stacks that have been
  /// deleted is kept for 90 days after the stack is deleted. If no
  /// StackStatusFilter is specified, summary information for all stacks is
  /// returned (including existing stacks and stacks that have been deleted).
  Future<void> listStacks(
      {String nextToken, List<String> stackStatusFilter}) async {}

  /// Sets a stack policy for a specified stack.
  Future<void> setStackPolicy(String stackName,
      {String stackPolicyBody, String stackPolicyUrl}) async {}

  /// Sends a signal to the specified resource with a success or failure status.
  /// You can use the SignalResource API in conjunction with a creation policy
  /// or update policy. AWS CloudFormation doesn't proceed with a stack creation
  /// or update until resources receive the required number of signals or the
  /// timeout period is exceeded. The SignalResource API is useful in cases
  /// where you want to send signals from anywhere other than an Amazon EC2
  /// instance.
  Future<void> signalResource(
      {@required String stackName,
      @required String logicalResourceId,
      @required String uniqueId,
      @required String status}) async {}

  /// Stops an in-progress operation on a stack set and its associated stack
  /// instances.
  Future<void> stopStackSetOperation(
      {@required String stackSetName, @required String operationId}) async {}

  /// Updates a stack as specified in the template. After the call completes
  /// successfully, the stack update starts. You can check the status of the
  /// stack via the DescribeStacks action.
  ///
  /// To get a copy of the template for an existing stack, you can use the
  /// GetTemplate action.
  ///
  /// For more information about creating an update template, updating a stack,
  /// and monitoring the progress of the update, see [Updating a
  /// Stack](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-updating-stacks.html).
  Future<void> updateStack(String stackName,
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
      String clientRequestToken}) async {}

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
  Future<void> updateStackInstances(
      {@required String stackSetName,
      @required List<String> accounts,
      @required List<String> regions,
      List<Parameter> parameterOverrides,
      StackSetOperationPreferences operationPreferences,
      String operationId}) async {}

  /// Updates the stack set, and associated stack instances in the specified
  /// accounts and regions.
  ///
  /// Even if the stack set operation created by updating the stack set fails
  /// (completely or partially, below or above a specified failure tolerance),
  /// the stack set is updated with your changes. Subsequent
  /// CreateStackInstances calls on the specified stack set use the updated
  /// stack set.
  Future<void> updateStackSet(String stackSetName,
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
      List<String> regions}) async {}

  /// Updates termination protection for the specified stack. If a user attempts
  /// to delete a stack with termination protection enabled, the operation fails
  /// and the stack remains unchanged. For more information, see [Protecting a
  /// Stack From Being
  /// Deleted](AWSCloudFormation/latest/UserGuide/using-cfn-protect-stacks.html)
  /// in the _AWS CloudFormation User Guide_.
  ///
  ///  For [nested
  /// stacks](AWSCloudFormation/latest/UserGuide/using-cfn-nested-stacks.html),
  /// termination protection is set on the root stack and cannot be changed
  /// directly on the nested stack.
  Future<void> updateTerminationProtection(
      {@required bool enableTerminationProtection,
      @required String stackName}) async {}

  /// Validates a specified template. AWS CloudFormation first checks if the
  /// template is valid JSON. If it isn't, AWS CloudFormation checks if the
  /// template is valid YAML. If both these checks fail, AWS CloudFormation
  /// returns a template validation error.
  Future<void> validateTemplate(
      {String templateBody, String templateUrl}) async {}
}

class AccountGateResult {}

class AccountLimit {}

class Change {}

class ChangeSetSummary {}

class ContinueUpdateRollbackOutput {}

class CreateChangeSetOutput {}

class CreateStackInstancesOutput {}

class CreateStackOutput {}

class CreateStackSetOutput {}

class DeleteChangeSetOutput {}

class DeleteStackInstancesOutput {}

class DeleteStackSetOutput {}

class DescribeAccountLimitsOutput {}

class DescribeChangeSetOutput {}

class DescribeStackDriftDetectionStatusOutput {}

class DescribeStackEventsOutput {}

class DescribeStackInstanceOutput {}

class DescribeStackResourceDriftsOutput {}

class DescribeStackResourceOutput {}

class DescribeStackResourcesOutput {}

class DescribeStackSetOperationOutput {}

class DescribeStackSetOutput {}

class DescribeStacksOutput {}

class DetectStackDriftOutput {}

class DetectStackResourceDriftOutput {}

class EstimateTemplateCostOutput {}

class ExecuteChangeSetOutput {}

class Export {}

class GetStackPolicyOutput {}

class GetTemplateOutput {}

class GetTemplateSummaryOutput {}

class ListChangeSetsOutput {}

class ListExportsOutput {}

class ListImportsOutput {}

class ListStackInstancesOutput {}

class ListStackResourcesOutput {}

class ListStackSetOperationResultsOutput {}

class ListStackSetOperationsOutput {}

class ListStackSetsOutput {}

class ListStacksOutput {}

class Output {}

class Parameter {}

class ParameterConstraints {}

class ParameterDeclaration {}

class PhysicalResourceIdContextKeyValuePair {}

class PropertyDifference {}

class ResourceChange {}

class ResourceChangeDetail {}

class ResourceTargetDefinition {}

class RollbackConfiguration {}

class RollbackTrigger {}

class Stack {}

class StackDriftInformation {}

class StackDriftInformationSummary {}

class StackEvent {}

class StackInstance {}

class StackInstanceSummary {}

class StackResource {}

class StackResourceDetail {}

class StackResourceDrift {}

class StackResourceDriftInformation {}

class StackResourceDriftInformationSummary {}

class StackResourceSummary {}

class StackSet {}

class StackSetOperation {}

class StackSetOperationPreferences {}

class StackSetOperationResultSummary {}

class StackSetOperationSummary {}

class StackSetSummary {}

class StackSummary {}

class StopStackSetOperationOutput {}

class Tag {}

class TemplateParameter {}

class UpdateStackInstancesOutput {}

class UpdateStackOutput {}

class UpdateStackSetOutput {}

class UpdateTerminationProtectionOutput {}

class ValidateTemplateOutput {}
