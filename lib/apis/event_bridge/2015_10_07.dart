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
  ///
  /// [name]: The name of the partner event source to activate.
  Future<void> activateEventSource(String name) async {}

  /// Creates a new event bus within your account. This can be a custom event
  /// bus which you can use to receive events from your own custom applications
  /// and services, or it can be a partner event bus which can be matched to a
  /// partner event source.
  ///
  ///
  ///
  /// This operation is used by AWS customers, not by SaaS partners.
  ///
  /// [name]: The name of the new event bus.
  ///
  /// The names of custom event buses can't contain the `/` character. You can't
  /// use the name `default` for a custom event bus because this name is already
  /// used for your account's default event bus.
  ///
  /// If this is a partner event bus, the name must exactly match the name of
  /// the partner event source that this event bus is matched to. This name will
  /// include the `/` character.
  ///
  /// [eventSourceName]: If you're creating a partner event bus, this specifies
  /// the partner event source that the new event bus will be matched with.
  Future<CreateEventBusResponse> createEventBus(String name,
      {String eventSourceName}) async {
    return CreateEventBusResponse.fromJson({});
  }

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
  ///
  /// [name]: The name of the partner event source. This name must be unique and
  /// must be in the format  `_partner_name_/_event_namespace_/_event_name_` .
  /// The AWS account that wants to use this partner event source must create a
  /// partner event bus with a name that matches the name of the partner event
  /// source.
  ///
  /// [account]: The AWS account ID of the customer who is permitted to create a
  /// matching partner event bus for this partner event source.
  Future<CreatePartnerEventSourceResponse> createPartnerEventSource(
      {@required String name, @required String account}) async {
    return CreatePartnerEventSourceResponse.fromJson({});
  }

  /// An AWS customer uses this operation to temporarily stop receiving events
  /// from the specified partner event source. The matching event bus isn't
  /// deleted.
  ///
  /// When you deactivate a partner event source, the source goes into `PENDING`
  /// state. If it remains in `PENDING` state for more than two weeks, it's
  /// deleted.
  ///
  /// To activate a deactivated partner event source, use ActivateEventSource.
  ///
  /// [name]: The name of the partner event source to deactivate.
  Future<void> deactivateEventSource(String name) async {}

  /// Deletes the specified custom event bus or partner event bus. All rules
  /// associated with this event bus are also deleted. You can't delete your
  /// account's default event bus.
  ///
  ///
  ///
  /// This operation is performed by AWS customers, not by SaaS partners.
  ///
  /// [name]: The name of the event bus to delete.
  Future<void> deleteEventBus(String name) async {}

  /// This operation is used by SaaS partners to delete a partner event source.
  /// AWS customers don't use this operation.
  ///
  /// When you delete an event source, the status of the corresponding partner
  /// event bus in the AWS customer account becomes `DELETED`.
  ///
  /// [name]: The name of the event source to delete.
  ///
  /// [account]: The AWS account ID of the AWS customer that the event source
  /// was created for.
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
  ///
  /// [name]: The name of the rule.
  ///
  /// [eventBusName]: The event bus associated with the rule. If you omit this,
  /// the default event bus is used.
  ///
  /// [force]: If this is a managed rule, created by an AWS service on your
  /// behalf, you must specify `Force` as `True` to delete the rule. This
  /// parameter is ignored for rules that are not managed rules. You can check
  /// whether a rule is a managed rule by using `DescribeRule` or `ListRules`
  /// and checking the `ManagedBy` field of the response.
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
  ///
  /// [name]: The name of the event bus to show details for. If you omit this,
  /// the default event bus is displayed.
  Future<DescribeEventBusResponse> describeEventBus({String name}) async {
    return DescribeEventBusResponse.fromJson({});
  }

  /// This operation lists details about a partner event source that is shared
  /// with your account.
  ///
  ///
  ///
  /// This operation is run by AWS customers, not by SaaS partners.
  ///
  /// [name]: The name of the partner event source to display the details of.
  Future<DescribeEventSourceResponse> describeEventSource(String name) async {
    return DescribeEventSourceResponse.fromJson({});
  }

  /// An SaaS partner can use this operation to list details about a partner
  /// event source that they have created.
  ///
  ///
  ///
  /// AWS customers do not use this operation. Instead, AWS customers can use
  /// DescribeEventSource to see details about a partner event source that is
  /// shared with them.
  ///
  /// [name]: The name of the event source to display.
  Future<DescribePartnerEventSourceResponse> describePartnerEventSource(
      String name) async {
    return DescribePartnerEventSourceResponse.fromJson({});
  }

  /// Describes the specified rule.
  ///
  ///  `DescribeRule` doesn't list the targets of a rule. To see the targets
  /// associated with a rule, use ListTargetsByRule.
  ///
  /// [name]: The name of the rule.
  ///
  /// [eventBusName]: The event bus associated with the rule. If you omit this,
  /// the default event bus is used.
  Future<DescribeRuleResponse> describeRule(String name,
      {String eventBusName}) async {
    return DescribeRuleResponse.fromJson({});
  }

  /// Disables the specified rule. A disabled rule won't match any events and
  /// won't self-trigger if it has a schedule expression.
  ///
  /// When you disable a rule, incoming events might continue to match to the
  /// disabled rule. Allow a short period of time for changes to take effect.
  ///
  /// [name]: The name of the rule.
  ///
  /// [eventBusName]: The event bus associated with the rule. If you omit this,
  /// the default event bus is used.
  Future<void> disableRule(String name, {String eventBusName}) async {}

  /// Enables the specified rule. If the rule doesn't exist, the operation
  /// fails.
  ///
  /// When you enable a rule, incoming events might not immediately start
  /// matching to a newly enabled rule. Allow a short period of time for changes
  /// to take effect.
  ///
  /// [name]: The name of the rule.
  ///
  /// [eventBusName]: The event bus associated with the rule. If you omit this,
  /// the default event bus is used.
  Future<void> enableRule(String name, {String eventBusName}) async {}

  /// Lists all the event buses in your account, including the default event
  /// bus, custom event buses, and partner event buses.
  ///
  ///
  ///
  /// This operation is run by AWS customers, not by SaaS partners.
  ///
  /// [namePrefix]: Specifying this limits the results to only those event buses
  /// with names that start with the specified prefix.
  ///
  /// [nextToken]: The token returned by a previous call to retrieve the next
  /// set of results.
  ///
  /// [limit]: Specifying this limits the number of results returned by this
  /// operation. The operation also returns a `NextToken` that you can use in a
  /// subsequent operation to retrieve the next set of results.
  Future<ListEventBusesResponse> listEventBuses(
      {String namePrefix, String nextToken, int limit}) async {
    return ListEventBusesResponse.fromJson({});
  }

  /// You can use this to see all the partner event sources that have been
  /// shared with your AWS account. For more information about partner event
  /// sources, see CreateEventBus.
  ///
  ///
  ///
  /// This operation is run by AWS customers, not by SaaS partners.
  ///
  /// [namePrefix]: Specifying this limits the results to only those partner
  /// event sources with names that start with the specified prefix.
  ///
  /// [nextToken]: The token returned by a previous call to retrieve the next
  /// set of results.
  ///
  /// [limit]: Specifying this limits the number of results returned by this
  /// operation. The operation also returns a `NextToken` that you can use in a
  /// subsequent operation to retrieve the next set of results.
  Future<ListEventSourcesResponse> listEventSources(
      {String namePrefix, String nextToken, int limit}) async {
    return ListEventSourcesResponse.fromJson({});
  }

  /// An SaaS partner can use this operation to display the AWS account ID that
  /// a particular partner event source name is associated with.
  ///
  ///
  ///
  /// This operation is used by SaaS partners, not by AWS customers.
  ///
  /// [eventSourceName]: The name of the partner event source to display account
  /// information about.
  ///
  /// [nextToken]: The token returned by a previous call to this operation.
  /// Specifying this retrieves the next set of results.
  ///
  /// [limit]: Specifying this limits the number of results returned by this
  /// operation. The operation also returns a `NextToken` that you can use in a
  /// subsequent operation to retrieve the next set of results.
  Future<ListPartnerEventSourceAccountsResponse> listPartnerEventSourceAccounts(
      String eventSourceName,
      {String nextToken,
      int limit}) async {
    return ListPartnerEventSourceAccountsResponse.fromJson({});
  }

  /// An SaaS partner can use this operation to list all the partner event
  /// source names that they have created.
  ///
  ///
  ///
  /// This operation is not used by AWS customers.
  ///
  /// [namePrefix]: If you specify this, the results are limited to only those
  /// partner event sources that start with the string you specify.
  ///
  /// [nextToken]: The token returned by a previous call to this operation.
  /// Specifying this retrieves the next set of results.
  ///
  /// [limit]: pecifying this limits the number of results returned by this
  /// operation. The operation also returns a `NextToken` that you can use in a
  /// subsequent operation to retrieve the next set of results.
  Future<ListPartnerEventSourcesResponse> listPartnerEventSources(
      String namePrefix,
      {String nextToken,
      int limit}) async {
    return ListPartnerEventSourcesResponse.fromJson({});
  }

  /// Lists the rules for the specified target. You can see which rules can
  /// invoke a specific target in your account.
  ///
  /// [targetArn]: The Amazon Resource Name (ARN) of the target resource.
  ///
  /// [eventBusName]: Limits the results to show only the rules associated with
  /// the specified event bus.
  ///
  /// [nextToken]: The token returned by a previous call to retrieve the next
  /// set of results.
  ///
  /// [limit]: The maximum number of results to return.
  Future<ListRuleNamesByTargetResponse> listRuleNamesByTarget(String targetArn,
      {String eventBusName, String nextToken, int limit}) async {
    return ListRuleNamesByTargetResponse.fromJson({});
  }

  /// Lists your EventBridge rules. You can either list all the rules or provide
  /// a prefix to match to the rule names.
  ///
  ///  `ListRules` doesn't list the targets of a rule. To see the targets
  /// associated with a rule, use ListTargetsByRule.
  ///
  /// [namePrefix]: The prefix matching the rule name.
  ///
  /// [eventBusName]: Limits the results to show only the rules associated with
  /// the specified event bus.
  ///
  /// [nextToken]: The token returned by a previous call to retrieve the next
  /// set of results.
  ///
  /// [limit]: The maximum number of results to return.
  Future<ListRulesResponse> listRules(
      {String namePrefix,
      String eventBusName,
      String nextToken,
      int limit}) async {
    return ListRulesResponse.fromJson({});
  }

  /// Displays the tags associated with an EventBridge resource. In EventBridge,
  /// rules can be tagged.
  ///
  /// [resourceArn]: The ARN of the rule for which you want to view tags.
  Future<ListTagsForResourceResponse> listTagsForResource(
      String resourceArn) async {
    return ListTagsForResourceResponse.fromJson({});
  }

  /// Lists the targets assigned to the specified rule.
  ///
  /// [rule]: The name of the rule.
  ///
  /// [eventBusName]: The event bus associated with the rule. If you omit this,
  /// the default event bus is used.
  ///
  /// [nextToken]: The token returned by a previous call to retrieve the next
  /// set of results.
  ///
  /// [limit]: The maximum number of results to return.
  Future<ListTargetsByRuleResponse> listTargetsByRule(String rule,
      {String eventBusName, String nextToken, int limit}) async {
    return ListTargetsByRuleResponse.fromJson({});
  }

  /// Sends custom events to EventBridge so that they can be matched to rules.
  /// These events can be from your custom applications and services.
  ///
  /// [entries]: The entry that defines an event in your system. You can specify
  /// several parameters for the entry such as the source and type of the event,
  /// resources associated with the event, and so on.
  Future<PutEventsResponse> putEvents(
      List<PutEventsRequestEntry> entries) async {
    return PutEventsResponse.fromJson({});
  }

  /// This is used by SaaS partners to write events to a customer's partner
  /// event bus.
  ///
  ///
  ///
  /// AWS customers do not use this operation. Instead, AWS customers can use
  /// PutEvents to write custom events from their own applications to an event
  /// bus.
  ///
  /// [entries]: The list of events to write to the event bus.
  Future<PutPartnerEventsResponse> putPartnerEvents(
      List<PutPartnerEventsRequestEntry> entries) async {
    return PutPartnerEventsResponse.fromJson({});
  }

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
  ///
  /// [eventBusName]: The event bus associated with the rule. If you omit this,
  /// the default event bus is used.
  ///
  /// [action]: The action that you're enabling the other account to perform.
  /// Currently, this must be `events:PutEvents`.
  ///
  /// [principal]: The 12-digit AWS account ID that you are permitting to put
  /// events to your default event bus. Specify "*" to permit any account to put
  /// events to your default event bus.
  ///
  /// If you specify "*" without specifying `Condition`, avoid creating rules
  /// that might match undesirable events. To create more secure rules, make
  /// sure that the event pattern for each rule contains an `account` field with
  /// a specific account ID to receive events from. Rules with an account field
  /// don't match any events sent from other accounts.
  ///
  /// [statementId]: An identifier string for the external account that you're
  /// granting permissions to. If you later want to revoke the permission for
  /// this external account, specify this `StatementId` when you run
  /// RemovePermission.
  ///
  /// [condition]: This parameter enables you to limit the permission to
  /// accounts that fulfill a certain condition, such as being a member of a
  /// certain AWS organization. For more information about AWS Organizations,
  /// see [What Is AWS
  /// Organizations?](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_introduction.html)
  /// in the _AWS Organizations User Guide_.
  ///
  /// If you specify `Condition` with an AWS organization ID and specify "*" as
  /// the value for `Principal`, you grant permission to all the accounts in the
  /// named organization.
  ///
  /// The `Condition` is a JSON string that must contain `Type`, `Key`, and
  /// `Value` fields.
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
  ///
  /// [name]: The name of the rule that you're creating or updating.
  ///
  /// [scheduleExpression]: The scheduling expression: for example, `"cron(0 20
  /// * * ? *)"` or `"rate(5 minutes)"`.
  ///
  /// [eventPattern]: The event pattern. For more information, see [Event
  /// Patterns](https://docs.aws.amazon.com/eventbridge/latest/userguide/eventbridge-and-event-patterns.html)
  /// in the _Amazon EventBridge User Guide_.
  ///
  /// [state]: Indicates whether the rule is enabled or disabled.
  ///
  /// [description]: A description of the rule.
  ///
  /// [roleArn]: The Amazon Resource Name (ARN) of the IAM role associated with
  /// the rule.
  ///
  /// [tags]: The list of key-value pairs to associate with the rule.
  ///
  /// [eventBusName]: The event bus to associate with this rule. If you omit
  /// this, the default event bus is used.
  Future<PutRuleResponse> putRule(String name,
      {String scheduleExpression,
      String eventPattern,
      String state,
      String description,
      String roleArn,
      List<Tag> tags,
      String eventBusName}) async {
    return PutRuleResponse.fromJson({});
  }

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
  ///
  /// [rule]: The name of the rule.
  ///
  /// [eventBusName]: The name of the event bus associated with the rule. If you
  /// omit this, the default event bus is used.
  ///
  /// [targets]: The targets to update or add to the rule.
  Future<PutTargetsResponse> putTargets(
      {@required String rule,
      String eventBusName,
      @required List<Target> targets}) async {
    return PutTargetsResponse.fromJson({});
  }

  /// Revokes the permission of another AWS account to be able to put events to
  /// the specified event bus. Specify the account to revoke by the
  /// `StatementId` value that you associated with the account when you granted
  /// it permission with `PutPermission`. You can find the `StatementId` by
  /// using DescribeEventBus.
  ///
  /// [statementId]: The statement ID corresponding to the account that is no
  /// longer allowed to put events to the default event bus.
  ///
  /// [eventBusName]: The name of the event bus to revoke permissions for. If
  /// you omit this, the default event bus is used.
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
  ///
  /// [rule]: The name of the rule.
  ///
  /// [eventBusName]: The name of the event bus associated with the rule.
  ///
  /// [ids]: The IDs of the targets to remove from the rule.
  ///
  /// [force]: If this is a managed rule created by an AWS service on your
  /// behalf, you must specify `Force` as `True` to remove targets. This
  /// parameter is ignored for rules that aren't managed rules. You can check
  /// whether a rule is a managed rule by using `DescribeRule` or `ListRules`
  /// and checking the `ManagedBy` field of the response.
  Future<RemoveTargetsResponse> removeTargets(
      {@required String rule,
      String eventBusName,
      @required List<String> ids,
      bool force}) async {
    return RemoveTargetsResponse.fromJson({});
  }

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
  ///
  /// [resourceArn]: The ARN of the rule that you're adding tags to.
  ///
  /// [tags]: The list of key-value pairs to associate with the rule.
  Future<TagResourceResponse> tagResource(
      {@required String resourceArn, @required List<Tag> tags}) async {
    return TagResourceResponse.fromJson({});
  }

  /// Tests whether the specified event pattern matches the provided event.
  ///
  /// Most services in AWS treat `:` or `/` as the same character in Amazon
  /// Resource Names (ARNs). However, EventBridge uses an exact match in event
  /// patterns and rules. Be sure to use the correct ARN characters when
  /// creating event patterns so that they match the ARN syntax in the event
  /// that you want to match.
  ///
  /// [eventPattern]: The event pattern. For more information, see [Event
  /// Patterns](https://docs.aws.amazon.com/eventbridge/latest/userguide/eventbridge-and-event-patterns.html)
  /// in the _Amazon EventBridge User Guide_.
  ///
  /// [event]: The event, in JSON format, to test against the event pattern.
  Future<TestEventPatternResponse> testEventPattern(
      {@required String eventPattern, @required String event}) async {
    return TestEventPatternResponse.fromJson({});
  }

  /// Removes one or more tags from the specified EventBridge resource. In
  /// EventBridge, rules can be tagged.
  ///
  /// [resourceArn]: The ARN of the rule that you're removing tags from.
  ///
  /// [tagKeys]: The list of tag keys to remove from the resource.
  Future<UntagResourceResponse> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {
    return UntagResourceResponse.fromJson({});
  }
}

class AwsVpcConfiguration {
  /// Specifies the subnets associated with the task. These subnets must all be
  /// in the same VPC. You can specify as many as 16 subnets.
  final List<String> subnets;

  /// Specifies the security groups associated with the task. These security
  /// groups must all be in the same VPC. You can specify as many as five
  /// security groups. If you don't specify a security group, the default
  /// security group for the VPC is used.
  final List<String> securityGroups;

  /// Specifies whether the task's elastic network interface receives a public
  /// IP address. You can specify `ENABLED` only when `LaunchType` in
  /// `EcsParameters` is set to `FARGATE`.
  final String assignPublicIp;

  AwsVpcConfiguration({
    @required this.subnets,
    this.securityGroups,
    this.assignPublicIp,
  });
  static AwsVpcConfiguration fromJson(Map<String, dynamic> json) =>
      AwsVpcConfiguration();
}

class BatchArrayProperties {
  /// The size of the array, if this is an array batch job. Valid values are
  /// integers between 2 and 10,000.
  final int size;

  BatchArrayProperties({
    this.size,
  });
  static BatchArrayProperties fromJson(Map<String, dynamic> json) =>
      BatchArrayProperties();
}

class BatchParameters {
  /// The ARN or name of the job definition to use if the event target is an AWS
  /// Batch job. This job definition must already exist.
  final String jobDefinition;

  /// The name to use for this execution of the job, if the target is an AWS
  /// Batch job.
  final String jobName;

  /// The array properties for the submitted job, such as the size of the array.
  /// The array size can be between 2 and 10,000. If you specify array
  /// properties for a job, it becomes an array job. This parameter is used only
  /// if the target is an AWS Batch job.
  final BatchArrayProperties arrayProperties;

  /// The retry strategy to use for failed jobs if the target is an AWS Batch
  /// job. The retry strategy is the number of times to retry the failed job
  /// execution. Valid values are 1–10. When you specify a retry strategy here,
  /// it overrides the retry strategy defined in the job definition.
  final BatchRetryStrategy retryStrategy;

  BatchParameters({
    @required this.jobDefinition,
    @required this.jobName,
    this.arrayProperties,
    this.retryStrategy,
  });
  static BatchParameters fromJson(Map<String, dynamic> json) =>
      BatchParameters();
}

class BatchRetryStrategy {
  /// The number of times to attempt to retry, if the job fails. Valid values
  /// are 1–10.
  final int attempts;

  BatchRetryStrategy({
    this.attempts,
  });
  static BatchRetryStrategy fromJson(Map<String, dynamic> json) =>
      BatchRetryStrategy();
}

class Condition {
  /// The type of condition. Currently, the only supported value is
  /// `StringEquals`.
  final String type;

  /// The key for the condition. Currently, the only supported key is
  /// `aws:PrincipalOrgID`.
  final String key;

  /// The value for the key. Currently, this must be the ID of the organization.
  final String value;

  Condition({
    @required this.type,
    @required this.key,
    @required this.value,
  });
}

class CreateEventBusResponse {
  /// The ARN of the new event bus.
  final String eventBusArn;

  CreateEventBusResponse({
    this.eventBusArn,
  });
  static CreateEventBusResponse fromJson(Map<String, dynamic> json) =>
      CreateEventBusResponse();
}

class CreatePartnerEventSourceResponse {
  /// The ARN of the partner event source.
  final String eventSourceArn;

  CreatePartnerEventSourceResponse({
    this.eventSourceArn,
  });
  static CreatePartnerEventSourceResponse fromJson(Map<String, dynamic> json) =>
      CreatePartnerEventSourceResponse();
}

class DescribeEventBusResponse {
  /// The name of the event bus. Currently, this is always `default`.
  final String name;

  /// The Amazon Resource Name (ARN) of the account permitted to write events to
  /// the current account.
  final String arn;

  /// The policy that enables the external account to send events to your
  /// account.
  final String policy;

  DescribeEventBusResponse({
    this.name,
    this.arn,
    this.policy,
  });
  static DescribeEventBusResponse fromJson(Map<String, dynamic> json) =>
      DescribeEventBusResponse();
}

class DescribeEventSourceResponse {
  /// The ARN of the partner event source.
  final String arn;

  /// The name of the SaaS partner that created the event source.
  final String createdBy;

  /// The date and time that the event source was created.
  final DateTime creationTime;

  /// The date and time that the event source will expire if you don't create a
  /// matching event bus.
  final DateTime expirationTime;

  /// The name of the partner event source.
  final String name;

  /// The state of the event source. If it's `ACTIVE`, you have already created
  /// a matching event bus for this event source, and that event bus is active.
  /// If it's `PENDING`, either you haven't yet created a matching event bus, or
  /// that event bus is deactivated. If it's `DELETED`, you have created a
  /// matching event bus, but the event source has since been deleted.
  final String state;

  DescribeEventSourceResponse({
    this.arn,
    this.createdBy,
    this.creationTime,
    this.expirationTime,
    this.name,
    this.state,
  });
  static DescribeEventSourceResponse fromJson(Map<String, dynamic> json) =>
      DescribeEventSourceResponse();
}

class DescribePartnerEventSourceResponse {
  /// The ARN of the event source.
  final String arn;

  /// The name of the event source.
  final String name;

  DescribePartnerEventSourceResponse({
    this.arn,
    this.name,
  });
  static DescribePartnerEventSourceResponse fromJson(
          Map<String, dynamic> json) =>
      DescribePartnerEventSourceResponse();
}

class DescribeRuleResponse {
  /// The name of the rule.
  final String name;

  /// The Amazon Resource Name (ARN) of the rule.
  final String arn;

  /// The event pattern. For more information, see [Event
  /// Patterns](https://docs.aws.amazon.com/eventbridge/latest/userguide/eventbridge-and-event-patterns.html)
  /// in the _Amazon EventBridge User Guide_.
  final String eventPattern;

  /// The scheduling expression: for example, `"cron(0 20 * * ? *)"` or `"rate(5
  /// minutes)"`.
  final String scheduleExpression;

  /// Specifies whether the rule is enabled or disabled.
  final String state;

  /// The description of the rule.
  final String description;

  /// The Amazon Resource Name (ARN) of the IAM role associated with the rule.
  final String roleArn;

  /// If this is a managed rule, created by an AWS service on your behalf, this
  /// field displays the principal name of the AWS service that created the
  /// rule.
  final String managedBy;

  /// The event bus associated with the rule.
  final String eventBusName;

  DescribeRuleResponse({
    this.name,
    this.arn,
    this.eventPattern,
    this.scheduleExpression,
    this.state,
    this.description,
    this.roleArn,
    this.managedBy,
    this.eventBusName,
  });
  static DescribeRuleResponse fromJson(Map<String, dynamic> json) =>
      DescribeRuleResponse();
}

class EcsParameters {
  /// The ARN of the task definition to use if the event target is an Amazon ECS
  /// task.
  final String taskDefinitionArn;

  /// The number of tasks to create based on `TaskDefinition`. The default is 1.
  final int taskCount;

  /// Specifies the launch type on which your task is running. The launch type
  /// that you specify here must match one of the launch type (compatibilities)
  /// of the target task. The `FARGATE` value is supported only in the Regions
  /// where AWS Fargate with Amazon ECS is supported. For more information, see
  /// [AWS Fargate on Amazon
  /// ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/AWS-Fargate.html)
  /// in the _Amazon Elastic Container Service Developer Guide_.
  final String launchType;

  /// Use this structure if the ECS task uses the `awsvpc` network mode. This
  /// structure specifies the VPC subnets and security groups associated with
  /// the task and whether a public IP address is to be used. This structure is
  /// required if `LaunchType` is `FARGATE` because the `awsvpc` mode is
  /// required for Fargate tasks.
  ///
  /// If you specify `NetworkConfiguration` when the target ECS task doesn't use
  /// the `awsvpc` network mode, the task fails.
  final NetworkConfiguration networkConfiguration;

  /// Specifies the platform version for the task. Specify only the numeric
  /// portion of the platform version, such as `1.1.0`.
  ///
  /// This structure is used only if `LaunchType` is `FARGATE`. For more
  /// information about valid platform versions, see [AWS Fargate Platform
  /// Versions](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/platform_versions.html)
  /// in the _Amazon Elastic Container Service Developer Guide_.
  final String platformVersion;

  /// Specifies an ECS task group for the task. The maximum length is 255
  /// characters.
  final String group;

  EcsParameters({
    @required this.taskDefinitionArn,
    this.taskCount,
    this.launchType,
    this.networkConfiguration,
    this.platformVersion,
    this.group,
  });
  static EcsParameters fromJson(Map<String, dynamic> json) => EcsParameters();
}

class EventBus {
  /// The name of the event bus.
  final String name;

  /// The ARN of the event bus.
  final String arn;

  /// The permissions policy of the event bus, describing which other AWS
  /// accounts can write events to this event bus.
  final String policy;

  EventBus({
    this.name,
    this.arn,
    this.policy,
  });
  static EventBus fromJson(Map<String, dynamic> json) => EventBus();
}

class EventSource {
  /// The ARN of the event source.
  final String arn;

  /// The name of the partner that created the event source.
  final String createdBy;

  /// The date and time when the event source was created.
  final DateTime creationTime;

  /// The date and time when the event source will expire if the AWS account
  /// doesn't create a matching event bus for it.
  final DateTime expirationTime;

  /// The name of the event source.
  final String name;

  /// The state of the event source. If it's `ACTIVE`, you have already created
  /// a matching event bus for this event source, and that event bus is active.
  /// If it's `PENDING`, either you haven't yet created a matching event bus, or
  /// that event bus is deactivated. If it's `DELETED`, you have created a
  /// matching event bus, but the event source has since been deleted.
  final String state;

  EventSource({
    this.arn,
    this.createdBy,
    this.creationTime,
    this.expirationTime,
    this.name,
    this.state,
  });
  static EventSource fromJson(Map<String, dynamic> json) => EventSource();
}

class InputTransformer {
  /// Map of JSON paths to be extracted from the event. You can then insert
  /// these in the template in `InputTemplate` to produce the output to be sent
  /// to the target.
  ///
  ///  `InputPathsMap` is an array key-value pairs, where each value is a valid
  /// JSON path. You can have as many as 10 key-value pairs. You must use JSON
  /// dot notation, not bracket notation.
  ///
  /// The keys can't start with `"AWS"`.
  final Map<String, String> inputPathsMap;

  /// Input template where you specify placeholders that will be filled with the
  /// values of the keys from `InputPathsMap` to customize the data sent to the
  /// target. Enclose each `InputPathsMaps` value in brackets: <_value_>. The
  /// InputTemplate must be valid JSON.
  ///
  /// If `InputTemplate` is a JSON object (surrounded by curly braces), the
  /// following restrictions apply:
  ///
  /// *   The placeholder can't be used as an object key
  ///
  /// *   Object values can't include quote marks
  ///
  ///
  /// The following example shows the syntax for using `InputPathsMap` and
  /// `InputTemplate`.
  ///
  ///   `"InputTransformer":`
  ///
  ///  `{`
  ///
  ///  `"InputPathsMap": {"instance": "$.detail.instance","status":
  /// "$.detail.status"},`
  ///
  ///  `"InputTemplate": "<instance> is in state <status>"`
  ///
  ///  `}`
  ///
  /// To have the `InputTemplate` include quote marks within a JSON string,
  /// escape each quote marks with a slash, as in the following example:
  ///
  ///   `"InputTransformer":`
  ///
  ///  `{`
  ///
  ///  `"InputPathsMap": {"instance": "$.detail.instance","status":
  /// "$.detail.status"},`
  ///
  ///  `"InputTemplate": "<instance> is in state \\"<status>\\""`
  ///
  ///  `}`
  final String inputTemplate;

  InputTransformer({
    this.inputPathsMap,
    @required this.inputTemplate,
  });
  static InputTransformer fromJson(Map<String, dynamic> json) =>
      InputTransformer();
}

class KinesisParameters {
  /// The JSON path to be extracted from the event and used as the partition
  /// key. For more information, see [Amazon Kinesis Streams Key
  /// Concepts](https://docs.aws.amazon.com/streams/latest/dev/key-concepts.html#partition-key)
  /// in the _Amazon Kinesis Streams Developer Guide_.
  final String partitionKeyPath;

  KinesisParameters({
    @required this.partitionKeyPath,
  });
  static KinesisParameters fromJson(Map<String, dynamic> json) =>
      KinesisParameters();
}

class ListEventBusesResponse {
  /// This list of event buses.
  final List<EventBus> eventBuses;

  /// A token you can use in a subsequent operation to retrieve the next set of
  /// results.
  final String nextToken;

  ListEventBusesResponse({
    this.eventBuses,
    this.nextToken,
  });
  static ListEventBusesResponse fromJson(Map<String, dynamic> json) =>
      ListEventBusesResponse();
}

class ListEventSourcesResponse {
  /// The list of event sources.
  final List<EventSource> eventSources;

  /// A token you can use in a subsequent operation to retrieve the next set of
  /// results.
  final String nextToken;

  ListEventSourcesResponse({
    this.eventSources,
    this.nextToken,
  });
  static ListEventSourcesResponse fromJson(Map<String, dynamic> json) =>
      ListEventSourcesResponse();
}

class ListPartnerEventSourceAccountsResponse {
  /// The list of partner event sources returned by the operation.
  final List<PartnerEventSourceAccount> partnerEventSourceAccounts;

  /// A token you can use in a subsequent operation to retrieve the next set of
  /// results.
  final String nextToken;

  ListPartnerEventSourceAccountsResponse({
    this.partnerEventSourceAccounts,
    this.nextToken,
  });
  static ListPartnerEventSourceAccountsResponse fromJson(
          Map<String, dynamic> json) =>
      ListPartnerEventSourceAccountsResponse();
}

class ListPartnerEventSourcesResponse {
  /// The list of partner event sources returned by the operation.
  final List<PartnerEventSource> partnerEventSources;

  /// A token you can use in a subsequent operation to retrieve the next set of
  /// results.
  final String nextToken;

  ListPartnerEventSourcesResponse({
    this.partnerEventSources,
    this.nextToken,
  });
  static ListPartnerEventSourcesResponse fromJson(Map<String, dynamic> json) =>
      ListPartnerEventSourcesResponse();
}

class ListRuleNamesByTargetResponse {
  /// The names of the rules that can invoke the given target.
  final List<String> ruleNames;

  /// Indicates whether there are additional results to retrieve. If there are
  /// no more results, the value is null.
  final String nextToken;

  ListRuleNamesByTargetResponse({
    this.ruleNames,
    this.nextToken,
  });
  static ListRuleNamesByTargetResponse fromJson(Map<String, dynamic> json) =>
      ListRuleNamesByTargetResponse();
}

class ListRulesResponse {
  /// The rules that match the specified criteria.
  final List<Rule> rules;

  /// Indicates whether there are additional results to retrieve. If there are
  /// no more results, the value is null.
  final String nextToken;

  ListRulesResponse({
    this.rules,
    this.nextToken,
  });
  static ListRulesResponse fromJson(Map<String, dynamic> json) =>
      ListRulesResponse();
}

class ListTagsForResourceResponse {
  /// The list of tag keys and values associated with the rule that you
  /// specified.
  final List<Tag> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  static ListTagsForResourceResponse fromJson(Map<String, dynamic> json) =>
      ListTagsForResourceResponse();
}

class ListTargetsByRuleResponse {
  /// The targets assigned to the rule.
  final List<Target> targets;

  /// Indicates whether there are additional results to retrieve. If there are
  /// no more results, the value is null.
  final String nextToken;

  ListTargetsByRuleResponse({
    this.targets,
    this.nextToken,
  });
  static ListTargetsByRuleResponse fromJson(Map<String, dynamic> json) =>
      ListTargetsByRuleResponse();
}

class NetworkConfiguration {
  /// Use this structure to specify the VPC subnets and security groups for the
  /// task and whether a public IP address is to be used. This structure is
  /// relevant only for ECS tasks that use the `awsvpc` network mode.
  final AwsVpcConfiguration awsvpcConfiguration;

  NetworkConfiguration({
    this.awsvpcConfiguration,
  });
  static NetworkConfiguration fromJson(Map<String, dynamic> json) =>
      NetworkConfiguration();
}

class PartnerEventSource {
  /// The ARN of the partner event source.
  final String arn;

  /// The name of the partner event source.
  final String name;

  PartnerEventSource({
    this.arn,
    this.name,
  });
  static PartnerEventSource fromJson(Map<String, dynamic> json) =>
      PartnerEventSource();
}

class PartnerEventSourceAccount {
  /// The AWS account ID that the partner event source was offered to.
  final String account;

  /// The date and time when the event source was created.
  final DateTime creationTime;

  /// The date and time when the event source will expire if the AWS account
  /// doesn't create a matching event bus for it.
  final DateTime expirationTime;

  /// The state of the event source. If it's `ACTIVE`, you have already created
  /// a matching event bus for this event source, and that event bus is active.
  /// If it's `PENDING`, either you haven't yet created a matching event bus, or
  /// that event bus is deactivated. If it's `DELETED`, you have created a
  /// matching event bus, but the event source has since been deleted.
  final String state;

  PartnerEventSourceAccount({
    this.account,
    this.creationTime,
    this.expirationTime,
    this.state,
  });
  static PartnerEventSourceAccount fromJson(Map<String, dynamic> json) =>
      PartnerEventSourceAccount();
}

class PutEventsRequestEntry {
  /// The timestamp of the event, per
  /// [RFC3339](https://www.rfc-editor.org/rfc/rfc3339.txt). If no timestamp is
  /// provided, the timestamp of the PutEvents call is used.
  final DateTime time;

  /// The source of the event. This field is required.
  final String source;

  /// AWS resources, identified by Amazon Resource Name (ARN), that the event
  /// primarily concerns. Any number, including zero, can be present.
  final List<String> resources;

  /// Free-form string used to decide which fields to expect in the event
  /// detail.
  final String detailType;

  /// A valid JSON string. There is no other schema imposed. The JSON string can
  /// contain fields and nested subobjects.
  final String detail;

  /// The event bus that will receive the event. Only the rules that are
  /// associated with this event bus can match the event.
  final String eventBusName;

  PutEventsRequestEntry({
    this.time,
    this.source,
    this.resources,
    this.detailType,
    this.detail,
    this.eventBusName,
  });
}

class PutEventsResponse {
  /// The number of failed entries.
  final int failedEntryCount;

  /// The successfully and unsuccessfully ingested events results. If the
  /// ingestion was successful, the entry has the event ID in it. Otherwise, you
  /// can use the error code and error message to identify the problem with the
  /// entry.
  final List<PutEventsResultEntry> entries;

  PutEventsResponse({
    this.failedEntryCount,
    this.entries,
  });
  static PutEventsResponse fromJson(Map<String, dynamic> json) =>
      PutEventsResponse();
}

class PutEventsResultEntry {
  /// The ID of the event.
  final String eventId;

  /// The error code that indicates why the event submission failed.
  final String errorCode;

  /// The error message that explains why the event submission failed.
  final String errorMessage;

  PutEventsResultEntry({
    this.eventId,
    this.errorCode,
    this.errorMessage,
  });
  static PutEventsResultEntry fromJson(Map<String, dynamic> json) =>
      PutEventsResultEntry();
}

class PutPartnerEventsRequestEntry {
  /// The date and time of the event.
  final DateTime time;

  /// The event source that is generating the evntry.
  final String source;

  /// AWS resources, identified by Amazon Resource Name (ARN), that the event
  /// primarily concerns. Any number, including zero, can be present.
  final List<String> resources;

  /// A free-form string used to decide which fields to expect in the event
  /// detail.
  final String detailType;

  /// A valid JSON string. There is no other schema imposed. The JSON string can
  /// contain fields and nested subobjects.
  final String detail;

  PutPartnerEventsRequestEntry({
    this.time,
    this.source,
    this.resources,
    this.detailType,
    this.detail,
  });
}

class PutPartnerEventsResponse {
  /// The number of events from this operation that couldn't be written to the
  /// partner event bus.
  final int failedEntryCount;

  /// The list of events from this operation that were successfully written to
  /// the partner event bus.
  final List<PutPartnerEventsResultEntry> entries;

  PutPartnerEventsResponse({
    this.failedEntryCount,
    this.entries,
  });
  static PutPartnerEventsResponse fromJson(Map<String, dynamic> json) =>
      PutPartnerEventsResponse();
}

class PutPartnerEventsResultEntry {
  /// The ID of the event.
  final String eventId;

  /// The error code that indicates why the event submission failed.
  final String errorCode;

  /// The error message that explains why the event submission failed.
  final String errorMessage;

  PutPartnerEventsResultEntry({
    this.eventId,
    this.errorCode,
    this.errorMessage,
  });
  static PutPartnerEventsResultEntry fromJson(Map<String, dynamic> json) =>
      PutPartnerEventsResultEntry();
}

class PutRuleResponse {
  /// The Amazon Resource Name (ARN) of the rule.
  final String ruleArn;

  PutRuleResponse({
    this.ruleArn,
  });
  static PutRuleResponse fromJson(Map<String, dynamic> json) =>
      PutRuleResponse();
}

class PutTargetsResponse {
  /// The number of failed entries.
  final int failedEntryCount;

  /// The failed target entries.
  final List<PutTargetsResultEntry> failedEntries;

  PutTargetsResponse({
    this.failedEntryCount,
    this.failedEntries,
  });
  static PutTargetsResponse fromJson(Map<String, dynamic> json) =>
      PutTargetsResponse();
}

class PutTargetsResultEntry {
  /// The ID of the target.
  final String targetId;

  /// The error code that indicates why the target addition failed. If the value
  /// is `ConcurrentModificationException`, too many requests were made at the
  /// same time.
  final String errorCode;

  /// The error message that explains why the target addition failed.
  final String errorMessage;

  PutTargetsResultEntry({
    this.targetId,
    this.errorCode,
    this.errorMessage,
  });
  static PutTargetsResultEntry fromJson(Map<String, dynamic> json) =>
      PutTargetsResultEntry();
}

class RemoveTargetsResponse {
  /// The number of failed entries.
  final int failedEntryCount;

  /// The failed target entries.
  final List<RemoveTargetsResultEntry> failedEntries;

  RemoveTargetsResponse({
    this.failedEntryCount,
    this.failedEntries,
  });
  static RemoveTargetsResponse fromJson(Map<String, dynamic> json) =>
      RemoveTargetsResponse();
}

class RemoveTargetsResultEntry {
  /// The ID of the target.
  final String targetId;

  /// The error code that indicates why the target removal failed. If the value
  /// is `ConcurrentModificationException`, too many requests were made at the
  /// same time.
  final String errorCode;

  /// The error message that explains why the target removal failed.
  final String errorMessage;

  RemoveTargetsResultEntry({
    this.targetId,
    this.errorCode,
    this.errorMessage,
  });
  static RemoveTargetsResultEntry fromJson(Map<String, dynamic> json) =>
      RemoveTargetsResultEntry();
}

class Rule {
  /// The name of the rule.
  final String name;

  /// The Amazon Resource Name (ARN) of the rule.
  final String arn;

  /// The event pattern of the rule. For more information, see [Event
  /// Patterns](https://docs.aws.amazon.com/eventbridge/latest/userguide/eventbridge-and-event-patterns.html)
  /// in the _Amazon EventBridge User Guide_.
  final String eventPattern;

  /// The state of the rule.
  final String state;

  /// The description of the rule.
  final String description;

  /// The scheduling expression: for example, `"cron(0 20 * * ? *)"` or `"rate(5
  /// minutes)"`.
  final String scheduleExpression;

  /// The Amazon Resource Name (ARN) of the role that is used for target
  /// invocation.
  final String roleArn;

  /// If an AWS service created the rule on behalf of your account, this field
  /// displays the principal name of the service that created the rule.
  final String managedBy;

  /// The event bus associated with the rule.
  final String eventBusName;

  Rule({
    this.name,
    this.arn,
    this.eventPattern,
    this.state,
    this.description,
    this.scheduleExpression,
    this.roleArn,
    this.managedBy,
    this.eventBusName,
  });
  static Rule fromJson(Map<String, dynamic> json) => Rule();
}

class RunCommandParameters {
  /// Currently, we support including only one `RunCommandTarget` block, which
  /// specifies either an array of `InstanceIds` or a tag.
  final List<RunCommandTarget> runCommandTargets;

  RunCommandParameters({
    @required this.runCommandTargets,
  });
  static RunCommandParameters fromJson(Map<String, dynamic> json) =>
      RunCommandParameters();
}

class RunCommandTarget {
  /// Can be either `tag:` _tag-key_ or `InstanceIds`.
  final String key;

  /// If `Key` is `tag:` _tag-key_, `Values` is a list of tag values. If `Key`
  /// is `InstanceIds`, `Values` is a list of Amazon EC2 instance IDs.
  final List<String> values;

  RunCommandTarget({
    @required this.key,
    @required this.values,
  });
  static RunCommandTarget fromJson(Map<String, dynamic> json) =>
      RunCommandTarget();
}

class SqsParameters {
  /// The FIFO message group ID to use as the target.
  final String messageGroupId;

  SqsParameters({
    this.messageGroupId,
  });
  static SqsParameters fromJson(Map<String, dynamic> json) => SqsParameters();
}

class Tag {
  /// A string that you can use to assign a value. The combination of tag keys
  /// and values can help you organize and categorize your resources.
  final String key;

  /// The value for the specified tag key.
  final String value;

  Tag({
    @required this.key,
    @required this.value,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag();
}

class TagResourceResponse {
  TagResourceResponse();
  static TagResourceResponse fromJson(Map<String, dynamic> json) =>
      TagResourceResponse();
}

class Target {
  /// The ID of the target.
  final String id;

  /// The Amazon Resource Name (ARN) of the target.
  final String arn;

  /// The Amazon Resource Name (ARN) of the IAM role to be used for this target
  /// when the rule is triggered. If one rule triggers multiple targets, you can
  /// use a different IAM role for each target.
  final String roleArn;

  /// Valid JSON text passed to the target. In this case, nothing from the event
  /// itself is passed to the target. For more information, see [The JavaScript
  /// Object Notation (JSON) Data Interchange
  /// Format](http://www.rfc-editor.org/rfc/rfc7159.txt).
  final String input;

  /// The value of the JSONPath that is used for extracting part of the matched
  /// event when passing it to the target. You must use JSON dot notation, not
  /// bracket notation. For more information about JSON paths, see
  /// [JSONPath](http://goessner.net/articles/JsonPath/).
  final String inputPath;

  /// Settings to enable you to provide custom input to a target based on
  /// certain event data. You can extract one or more key-value pairs from the
  /// event and then use that data to send customized input to the target.
  final InputTransformer inputTransformer;

  /// The custom parameter that you can use to control the shard assignment when
  /// the target is a Kinesis data stream. If you don't include this parameter,
  /// the default is to use the `eventId` as the partition key.
  final KinesisParameters kinesisParameters;

  /// Parameters used when you are using the rule to invoke Amazon EC2 Run
  /// Command.
  final RunCommandParameters runCommandParameters;

  /// Contains the Amazon ECS task definition and task count to be used if the
  /// event target is an Amazon ECS task. For more information about Amazon ECS
  /// tasks, see [Task
  /// Definitions](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_defintions.html)
  ///  in the _Amazon EC2 Container Service Developer Guide_.
  final EcsParameters ecsParameters;

  /// If the event target is an AWS Batch job, this contains the job definition,
  /// job name, and other parameters. For more information, see
  /// [Jobs](https://docs.aws.amazon.com/batch/latest/userguide/jobs.html) in
  /// the _AWS Batch User Guide_.
  final BatchParameters batchParameters;

  /// Contains the message group ID to use when the target is a FIFO queue.
  ///
  /// If you specify an SQS FIFO queue as a target, the queue must have
  /// content-based deduplication enabled.
  final SqsParameters sqsParameters;

  Target({
    @required this.id,
    @required this.arn,
    this.roleArn,
    this.input,
    this.inputPath,
    this.inputTransformer,
    this.kinesisParameters,
    this.runCommandParameters,
    this.ecsParameters,
    this.batchParameters,
    this.sqsParameters,
  });
  static Target fromJson(Map<String, dynamic> json) => Target();
}

class TestEventPatternResponse {
  /// Indicates whether the event matches the event pattern.
  final bool result;

  TestEventPatternResponse({
    this.result,
  });
  static TestEventPatternResponse fromJson(Map<String, dynamic> json) =>
      TestEventPatternResponse();
}

class UntagResourceResponse {
  UntagResourceResponse();
  static UntagResourceResponse fromJson(Map<String, dynamic> json) =>
      UntagResourceResponse();
}
