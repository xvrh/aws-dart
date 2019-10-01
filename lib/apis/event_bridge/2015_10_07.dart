import 'package:meta/meta.dart';

/// Amazon EventBridge helps you to respond to state changes in your AWS
/// resources. When your resources change state, they automatically send events
/// into an event stream. You can create rules that match selected events in the
/// stream and route them to targets to take action. You can also use rules to
/// take action on a predetermined schedule. For example, you can configure
/// rules to:
///
/// *   Automatically invoke an AWS Lambda function to update DNS entries when
/// an event notifies you that Amazon EC2 instance enters the running state
///
/// *   Direct specific API records from AWS CloudTrail to an Amazon Kinesis
/// data stream for detailed analysis of potential security or availability
/// risks
///
/// *   Periodically invoke a built-in target to create a snapshot of an Amazon
/// EBS volume
///
///
/// For more information about the features of Amazon EventBridge, see the
/// [Amazon EventBridge User
/// Guide](https://docs.aws.amazon.com/eventbridge/latest/userguide/).
class EventBridgeApi {
  /// Activates a partner event source that has been deactivated. Once
  /// activated, your matching event bus will start receiving events from the
  /// event source.
  ///
  ///
  ///
  /// This operation is performed by AWS customers, not by SaaS partners.
  Future<void> activateEventSource(String name) async {}

  /// Creates a new event bus within your account. This can be a custom event
  /// bus which you can use to receive events from your own custom applications
  /// and services, or it can be a partner event bus which can be matched to a
  /// partner event source.
  ///
  ///
  ///
  /// This operation is used by AWS customers, not by SaaS partners.
  Future<void> createEventBus(String name, {String eventSourceName}) async {}

  /// Called by an SaaS partner to create a partner event source.
  ///
  ///  This operation is not used by AWS customers.
  ///
  /// Each partner event source can be used by one AWS account to create a
  /// matching partner event bus in that AWS account. A SaaS partner must create
  /// one partner event source for each AWS account that wants to receive those
  /// event types.
  ///
  /// A partner event source creates events based on resources in the SaaS
  /// partner's service or application.
  ///
  /// An AWS account that creates a partner event bus that matches the partner
  /// event source can use that event bus to receive events from the partner,
  /// and then process them using AWS Events rules and targets.
  ///
  /// Partner event source names follow this format:
  ///
  ///  `aws.partner/_partner_name_/_event_namespace_/_event_name_`
  ///
  /// *    _partner_name_ is determined during partner registration and
  /// identifies the partner to AWS customers.
  ///
  /// *   For _event_namespace_, we recommend that partners use a string that
  /// identifies the AWS customer within the partner's system. This should not
  /// be the customer's AWS account ID.
  ///
  /// *    _event_name_ is determined by the partner, and should uniquely
  /// identify an event-generating resource within the partner system. This
  /// should help AWS customers decide whether to create an event bus to receive
  /// these events.
  Future<void> createPartnerEventSource(
      {@required String name, @required String account}) async {}

  /// An AWS customer uses this operation to temporarily stop receiving events
  /// from the specified partner event source. The matching event bus isn't
  /// deleted.
  ///
  /// When you deactivate a partner event source, the source goes into `PENDING`
  /// state. If it remains in `PENDING` state for more than two weeks, it's
  /// deleted.
  ///
  /// To activate a deactivated partner event source, use ActivateEventSource.
  Future<void> deactivateEventSource(String name) async {}

  /// Deletes the specified custom event bus or partner event bus. All rules
  /// associated with this event bus are also deleted. You can't delete your
  /// account's default event bus.
  ///
  ///
  ///
  /// This operation is performed by AWS customers, not by SaaS partners.
  Future<void> deleteEventBus(String name) async {}

  /// This operation is used by SaaS partners to delete a partner event source.
  /// AWS customers don't use this operation.
  ///
  /// When you delete an event source, the status of the corresponding partner
  /// event bus in the AWS customer account becomes `DELETED`.
  Future<void> deletePartnerEventSource(
      {@required String name, @required String account}) async {}

  /// Deletes the specified rule.
  ///
  /// Before you can delete the rule, you must remove all targets, using
  /// RemoveTargets.
  ///
  /// When you delete a rule, incoming events might continue to match to the
  /// deleted rule. Allow a short period of time for changes to take effect.
  ///
  /// Managed rules are rules created and managed by another AWS service on your
  /// behalf. These rules are created by those other AWS services to support
  /// functionality in those services. You can delete these rules using the
  /// `Force` option, but you should do so only if you're sure that the other
  /// service isn't still using that rule.
  Future<void> deleteRule(String name,
      {String eventBusName, bool force}) async {}

  /// Displays details about an event bus in your account. This can include the
  /// external AWS accounts that are permitted to write events to your default
  /// event bus, and the associated policy. For custom event buses and partner
  /// event buses, it displays the name, ARN, policy, state, and creation time.
  ///
  ///  To enable your account to receive events from other accounts on its
  /// default event bus, use PutPermission.
  ///
  /// For more information about partner event buses, see CreateEventBus.
  Future<void> describeEventBus({String name}) async {}

  /// This operation lists details about a partner event source that is shared
  /// with your account.
  ///
  ///
  ///
  /// This operation is run by AWS customers, not by SaaS partners.
  Future<void> describeEventSource(String name) async {}

  /// An SaaS partner can use this operation to list details about a partner
  /// event source that they have created.
  ///
  ///
  ///
  /// AWS customers do not use this operation. Instead, AWS customers can use
  /// DescribeEventSource to see details about a partner event source that is
  /// shared with them.
  Future<void> describePartnerEventSource(String name) async {}

  /// Describes the specified rule.
  ///
  ///  `DescribeRule` doesn't list the targets of a rule. To see the targets
  /// associated with a rule, use ListTargetsByRule.
  Future<void> describeRule(String name, {String eventBusName}) async {}

  /// Disables the specified rule. A disabled rule won't match any events and
  /// won't self-trigger if it has a schedule expression.
  ///
  /// When you disable a rule, incoming events might continue to match to the
  /// disabled rule. Allow a short period of time for changes to take effect.
  Future<void> disableRule(String name, {String eventBusName}) async {}

  /// Enables the specified rule. If the rule doesn't exist, the operation
  /// fails.
  ///
  /// When you enable a rule, incoming events might not immediately start
  /// matching to a newly enabled rule. Allow a short period of time for changes
  /// to take effect.
  Future<void> enableRule(String name, {String eventBusName}) async {}

  /// Lists all the event buses in your account, including the default event
  /// bus, custom event buses, and partner event buses.
  ///
  ///
  ///
  /// This operation is run by AWS customers, not by SaaS partners.
  Future<void> listEventBuses(
      {String namePrefix, String nextToken, int limit}) async {}

  /// You can use this to see all the partner event sources that have been
  /// shared with your AWS account. For more information about partner event
  /// sources, see CreateEventBus.
  ///
  ///
  ///
  /// This operation is run by AWS customers, not by SaaS partners.
  Future<void> listEventSources(
      {String namePrefix, String nextToken, int limit}) async {}

  /// An SaaS partner can use this operation to display the AWS account ID that
  /// a particular partner event source name is associated with.
  ///
  ///
  ///
  /// This operation is used by SaaS partners, not by AWS customers.
  Future<void> listPartnerEventSourceAccounts(String eventSourceName,
      {String nextToken, int limit}) async {}

  /// An SaaS partner can use this operation to list all the partner event
  /// source names that they have created.
  ///
  ///
  ///
  /// This operation is not used by AWS customers.
  Future<void> listPartnerEventSources(String namePrefix,
      {String nextToken, int limit}) async {}

  /// Lists the rules for the specified target. You can see which rules can
  /// invoke a specific target in your account.
  Future<void> listRuleNamesByTarget(String targetArn,
      {String eventBusName, String nextToken, int limit}) async {}

  /// Lists your EventBridge rules. You can either list all the rules or provide
  /// a prefix to match to the rule names.
  ///
  ///  `ListRules` doesn't list the targets of a rule. To see the targets
  /// associated with a rule, use ListTargetsByRule.
  Future<void> listRules(
      {String namePrefix,
      String eventBusName,
      String nextToken,
      int limit}) async {}

  /// Displays the tags associated with an EventBridge resource. In EventBridge,
  /// rules can be tagged.
  Future<void> listTagsForResource(String resourceArn) async {}

  /// Lists the targets assigned to the specified rule.
  Future<void> listTargetsByRule(String rule,
      {String eventBusName, String nextToken, int limit}) async {}

  /// Sends custom events to EventBridge so that they can be matched to rules.
  /// These events can be from your custom applications and services.
  Future<void> putEvents(List<PutEventsRequestEntry> entries) async {}

  /// This is used by SaaS partners to write events to a customer's partner
  /// event bus.
  ///
  ///
  ///
  /// AWS customers do not use this operation. Instead, AWS customers can use
  /// PutEvents to write custom events from their own applications to an event
  /// bus.
  Future<void> putPartnerEvents(
      List<PutPartnerEventsRequestEntry> entries) async {}

  /// Running `PutPermission` permits the specified AWS account or AWS
  /// organization to put events to the specified _event bus_. Rules in your
  /// account are triggered by these events arriving to an event bus in your
  /// account.
  ///
  /// For another account to send events to your account, that external account
  /// must have a rule with your account's event bus as a target.
  ///
  /// To enable multiple AWS accounts to put events to an event bus, run
  /// `PutPermission` once for each of these accounts. Or, if all the accounts
  /// are members of the same AWS organization, you can run `PutPermission` once
  /// specifying `Principal` as "*" and specifying the AWS organization ID in
  /// `Condition`, to grant permissions to all accounts in that organization.
  ///
  /// If you grant permissions using an organization, then accounts in that
  /// organization must specify a `RoleArn` with proper permissions when they
  /// use `PutTarget` to add your account's event bus as a target. For more
  /// information, see [Sending and Receiving Events Between AWS
  /// Accounts](https://docs.aws.amazon.com/eventbridge/latest/userguide/eventbridge-cross-account-event-delivery.html)
  /// in the _Amazon EventBridge User Guide_.
  ///
  /// The permission policy on an event bus can't exceed 10 KB in size.
  Future<void> putPermission(
      {String eventBusName,
      @required String action,
      @required String principal,
      @required String statementId,
      Condition condition}) async {}

  /// Creates or updates the specified rule. Rules are enabled by default or
  /// based on value of the state. You can disable a rule using DisableRule.
  ///
  /// A single rule watches for events from a single event bus. Events generated
  /// by AWS services go to your account's default event bus. Events generated
  /// by SaaS partner services or applications go to the matching partner event
  /// bus. If you have custom applications or services, you can specify whether
  /// their events go to your default event bus or a custom event bus that you
  /// have created. For more information, see CreateEventBus.
  ///
  /// If you're updating an existing rule, the rule is replaced with what you
  /// specify in this `PutRule` command. If you omit arguments in `PutRule`, the
  /// old values for those arguments aren't kept. Instead, they're replaced with
  /// null values.
  ///
  /// When you create or update a rule, incoming events might not immediately
  /// start matching to new or updated rules. Allow a short period of time for
  /// changes to take effect.
  ///
  /// A rule must contain at least an `EventPattern` or `ScheduleExpression`.
  /// Rules with `EventPatterns` are triggered when a matching event is
  /// observed. Rules with `ScheduleExpressions` self-trigger based on the given
  /// schedule. A rule can have both an `EventPattern` and a
  /// `ScheduleExpression`, in which case the rule triggers on matching events
  /// as well as on a schedule.
  ///
  /// When you initially create a rule, you can optionally assign one or more
  /// tags to the rule. Tags can help you organize and categorize your
  /// resources. You can also use them to scope user permissions, by granting a
  /// user permission to access or change only rules with certain tag values. To
  /// use the `PutRule` operation and assign tags, you must have both the
  /// `events:PutRule` and `events:TagResource` permissions.
  ///
  /// If you are updating an existing rule, any tags you specify in the
  /// `PutRule` operation are ignored. To update the tags of an existing rule,
  /// use TagResource and UntagResource.
  ///
  /// Most services in AWS treat `:` or `/` as the same character in Amazon
  /// Resource Names (ARNs). However, EventBridge uses an exact match in event
  /// patterns and rules. Be sure to use the correct ARN characters when
  /// creating event patterns so that they match the ARN syntax in the event
  /// that you want to match.
  ///
  /// In EventBridge, you could create rules that lead to infinite loops, where
  /// a rule is fired repeatedly. For example, a rule might detect that ACLs
  /// have changed on an S3 bucket, and trigger software to change them to the
  /// desired state. If you don't write the rule carefully, the subsequent
  /// change to the ACLs fires the rule again, creating an infinite loop.
  ///
  /// To prevent this, write the rules so that the triggered actions don't
  /// refire the same rule. For example, your rule could fire only if ACLs are
  /// found to be in a bad state, instead of after any change.
  ///
  /// An infinite loop can quickly cause higher than expected charges. We
  /// recommend that you use budgeting, which alerts you when charges exceed
  /// your specified limit. For more information, see [Managing Your Costs with
  /// Budgets](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/budgets-managing-costs.html).
  Future<void> putRule(String name,
      {String scheduleExpression,
      String eventPattern,
      String state,
      String description,
      String roleArn,
      List<Tag> tags,
      String eventBusName}) async {}

  /// Adds the specified targets to the specified rule, or updates the targets
  /// if they're already associated with the rule.
  ///
  /// Targets are the resources that are invoked when a rule is triggered.
  ///
  /// You can configure the following as targets in EventBridge:
  ///
  /// *   EC2 instances
  ///
  /// *   SSM Run Command
  ///
  /// *   SSM Automation
  ///
  /// *   AWS Lambda functions
  ///
  /// *   Data streams in Amazon Kinesis Data Streams
  ///
  /// *   Data delivery streams in Amazon Kinesis Data Firehose
  ///
  /// *   Amazon ECS tasks
  ///
  /// *   AWS Step Functions state machines
  ///
  /// *   AWS Batch jobs
  ///
  /// *   AWS CodeBuild projects
  ///
  /// *   Pipelines in AWS CodePipeline
  ///
  /// *   Amazon Inspector assessment templates
  ///
  /// *   Amazon SNS topics
  ///
  /// *   Amazon SQS queues, including FIFO queues
  ///
  /// *   The default event bus of another AWS account
  ///
  ///
  /// Creating rules with built-in targets is supported only on the AWS
  /// Management Console. The built-in targets are `EC2 CreateSnapshot API
  /// call`, `EC2 RebootInstances API call`, `EC2 StopInstances API call`, and
  /// `EC2 TerminateInstances API call`.
  ///
  /// For some target types, `PutTargets` provides target-specific parameters.
  /// If the target is a Kinesis data stream, you can optionally specify which
  /// shard the event goes to by using the `KinesisParameters` argument. To
  /// invoke a command on multiple EC2 instances with one rule, you can use the
  /// `RunCommandParameters` field.
  ///
  /// To be able to make API calls against the resources that you own, Amazon
  /// EventBridge needs the appropriate permissions. For AWS Lambda and Amazon
  /// SNS resources, EventBridge relies on resource-based policies. For EC2
  /// instances, Kinesis data streams, and AWS Step Functions state machines,
  /// EventBridge relies on IAM roles that you specify in the `RoleARN` argument
  /// in `PutTargets`. For more information, see [Authentication and Access
  /// Control](https://docs.aws.amazon.com/eventbridge/latest/userguide/auth-and-access-control-eventbridge.html)
  /// in the _Amazon EventBridge User Guide_.
  ///
  /// If another AWS account is in the same Region and has granted you
  /// permission (using `PutPermission`), you can send events to that account.
  /// Set that account's event bus as a target of the rules in your account. To
  /// send the matched events to the other account, specify that account's event
  /// bus as the `Arn` value when you run `PutTargets`. If your account sends
  /// events to another account, your account is charged for each sent event.
  /// Each event sent to another account is charged as a custom event. The
  /// account receiving the event isn't charged. For more information, see
  /// [Amazon EventBridge Pricing](https://aws.amazon.com/eventbridge/pricing/).
  ///
  /// If you're setting an event bus in another account as the target and that
  /// account granted permission to your account through an organization instead
  /// of directly by the account ID, you must specify a `RoleArn` with proper
  /// permissions in the `Target` structure. For more information, see [Sending
  /// and Receiving Events Between AWS
  /// Accounts](https://docs.aws.amazon.com/eventbridge/latest/userguide/eventbridge-cross-account-event-delivery.html)
  /// in the _Amazon EventBridge User Guide_.
  ///
  /// For more information about enabling cross-account events, see
  /// PutPermission.
  ///
  ///  `Input`, `InputPath`, and `InputTransformer` are mutually exclusive and
  /// optional parameters of a target. When a rule is triggered due to a matched
  /// event:
  ///
  /// *   If none of the following arguments are specified for a target, the
  /// entire event is passed to the target in JSON format (unless the target is
  /// Amazon EC2 Run Command or Amazon ECS task, in which case nothing from the
  /// event is passed to the target).
  ///
  /// *   If `Input` is specified in the form of valid JSON, then the matched
  /// event is overridden with this constant.
  ///
  /// *   If `InputPath` is specified in the form of JSONPath (for example,
  /// `$.detail`), only the part of the event specified in the path is passed to
  /// the target (for example, only the detail part of the event is passed).
  ///
  /// *   If `InputTransformer` is specified, one or more specified JSONPaths
  /// are extracted from the event and used as values in a template that you
  /// specify as the input to the target.
  ///
  ///
  /// When you specify `InputPath` or `InputTransformer`, you must use JSON dot
  /// notation, not bracket notation.
  ///
  /// When you add targets to a rule and the associated rule triggers soon
  /// after, new or updated targets might not be immediately invoked. Allow a
  /// short period of time for changes to take effect.
  ///
  /// This action can partially fail if too many requests are made at the same
  /// time. If that happens, `FailedEntryCount` is nonzero in the response, and
  /// each entry in `FailedEntries` provides the ID of the failed target and the
  /// error code.
  Future<void> putTargets(
      {@required String rule,
      String eventBusName,
      @required List<Target> targets}) async {}

  /// Revokes the permission of another AWS account to be able to put events to
  /// the specified event bus. Specify the account to revoke by the
  /// `StatementId` value that you associated with the account when you granted
  /// it permission with `PutPermission`. You can find the `StatementId` by
  /// using DescribeEventBus.
  Future<void> removePermission(String statementId,
      {String eventBusName}) async {}

  /// Removes the specified targets from the specified rule. When the rule is
  /// triggered, those targets are no longer be invoked.
  ///
  /// When you remove a target, when the associated rule triggers, removed
  /// targets might continue to be invoked. Allow a short period of time for
  /// changes to take effect.
  ///
  /// This action can partially fail if too many requests are made at the same
  /// time. If that happens, `FailedEntryCount` is non-zero in the response and
  /// each entry in `FailedEntries` provides the ID of the failed target and the
  /// error code.
  Future<void> removeTargets(
      {@required String rule,
      String eventBusName,
      @required List<String> ids,
      bool force}) async {}

  /// Assigns one or more tags (key-value pairs) to the specified EventBridge
  /// resource. Tags can help you organize and categorize your resources. You
  /// can also use them to scope user permissions by granting a user permission
  /// to access or change only resources with certain tag values. In
  /// EventBridge, rules can be tagged.
  ///
  /// Tags don't have any semantic meaning to AWS and are interpreted strictly
  /// as strings of characters.
  ///
  /// You can use the `TagResource` action with a rule that already has tags. If
  /// you specify a new tag key for the rule, this tag is appended to the list
  /// of tags associated with the rule. If you specify a tag key that is already
  /// associated with the rule, the new tag value that you specify replaces the
  /// previous value for that tag.
  ///
  /// You can associate as many as 50 tags with a resource.
  Future<void> tagResource(
      {@required String resourceArn, @required List<Tag> tags}) async {}

  /// Tests whether the specified event pattern matches the provided event.
  ///
  /// Most services in AWS treat `:` or `/` as the same character in Amazon
  /// Resource Names (ARNs). However, EventBridge uses an exact match in event
  /// patterns and rules. Be sure to use the correct ARN characters when
  /// creating event patterns so that they match the ARN syntax in the event
  /// that you want to match.
  Future<void> testEventPattern(
      {@required String eventPattern, @required String event}) async {}

  /// Removes one or more tags from the specified EventBridge resource. In
  /// EventBridge, rules can be tagged.
  Future<void> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {}
}

class AwsVpcConfiguration {}

class BatchArrayProperties {}

class BatchParameters {}

class BatchRetryStrategy {}

class Condition {}

class CreateEventBusResponse {}

class CreatePartnerEventSourceResponse {}

class DescribeEventBusResponse {}

class DescribeEventSourceResponse {}

class DescribePartnerEventSourceResponse {}

class DescribeRuleResponse {}

class EcsParameters {}

class EventBus {}

class EventSource {}

class InputTransformer {}

class KinesisParameters {}

class ListEventBusesResponse {}

class ListEventSourcesResponse {}

class ListPartnerEventSourceAccountsResponse {}

class ListPartnerEventSourcesResponse {}

class ListRuleNamesByTargetResponse {}

class ListRulesResponse {}

class ListTagsForResourceResponse {}

class ListTargetsByRuleResponse {}

class NetworkConfiguration {}

class PartnerEventSource {}

class PartnerEventSourceAccount {}

class PutEventsRequestEntry {}

class PutEventsResponse {}

class PutEventsResultEntry {}

class PutPartnerEventsRequestEntry {}

class PutPartnerEventsResponse {}

class PutPartnerEventsResultEntry {}

class PutRuleResponse {}

class PutTargetsResponse {}

class PutTargetsResultEntry {}

class RemoveTargetsResponse {}

class RemoveTargetsResultEntry {}

class Rule {}

class RunCommandParameters {}

class RunCommandTarget {}

class SqsParameters {}

class Tag {}

class TagResourceResponse {}

class Target {}

class TestEventPatternResponse {}

class UntagResourceResponse {}
