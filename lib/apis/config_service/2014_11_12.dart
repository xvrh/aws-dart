import 'package:meta/meta.dart';

/// AWS Config
///
/// AWS Config provides a way to keep track of the configurations of all the AWS
/// resources associated with your AWS account. You can use AWS Config to get
/// the current and historical configurations of each AWS resource and also to
/// get information about the relationship between the resources. An AWS
/// resource can be an Amazon Compute Cloud (Amazon EC2) instance, an Elastic
/// Block Store (EBS) volume, an elastic network Interface (ENI), or a security
/// group. For a complete list of resources currently supported by AWS Config,
/// see
/// [Supported AWS Resources](https://docs.aws.amazon.com/config/latest/developerguide/resource-config-reference.html#supported-resources).
///
/// You can access and manage AWS Config through the AWS Management Console, the
/// AWS Command Line Interface (AWS CLI), the AWS Config API, or the AWS SDKs
/// for AWS Config. This reference guide contains documentation for the AWS
/// Config API and the AWS CLI commands that you can use to manage AWS Config.
/// The AWS Config API uses the Signature Version 4 protocol for signing
/// requests. For more information about how to sign a request with this
/// protocol, see
/// [Signature Version 4 Signing Process](https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html).
/// For detailed information about AWS Config features and their associated
/// actions or commands, as well as how to work with AWS Management Console, see
/// [What Is AWS Config](https://docs.aws.amazon.com/config/latest/developerguide/WhatIsConfig.html)
/// in the _AWS Config Developer Guide_.
class ConfigServiceApi {
  final _client;
  ConfigServiceApi(client)
      : _client = client.configured('Config Service', serializer: 'json');

  /// Returns the current configuration items for resources that are present in
  /// your AWS Config aggregator. The operation also returns a list of resources
  /// that are not processed in the current request. If there are no unprocessed
  /// resources, the operation returns an empty `unprocessedResourceIdentifiers`
  /// list.
  ///
  ///
  ///
  /// *   The API does not return results for deleted resources.
  ///
  /// *    The API does not return tags and relationships.
  ///
  /// [configurationAggregatorName]: The name of the configuration aggregator.
  ///
  /// [resourceIdentifiers]: A list of aggregate ResourceIdentifiers objects.
  Future<BatchGetAggregateResourceConfigResponse>
      batchGetAggregateResourceConfig(
          {@required
              String configurationAggregatorName,
          @required
              List<AggregateResourceIdentifier> resourceIdentifiers}) async {
    var response_ = await _client.send('BatchGetAggregateResourceConfig', {
      'ConfigurationAggregatorName': configurationAggregatorName,
      'ResourceIdentifiers': resourceIdentifiers,
    });
    return BatchGetAggregateResourceConfigResponse.fromJson(response_);
  }

  /// Returns the current configuration for one or more requested resources. The
  /// operation also returns a list of resources that are not processed in the
  /// current request. If there are no unprocessed resources, the operation
  /// returns an empty unprocessedResourceKeys list.
  ///
  ///
  ///
  /// *   The API does not return results for deleted resources.
  ///
  /// *    The API does not return any tags for the requested resources. This
  /// information is filtered out of the supplementaryConfiguration section of
  /// the API response.
  ///
  /// [resourceKeys]: A list of resource keys to be processed with the current
  /// request. Each element in the list consists of the resource type and
  /// resource ID.
  Future<BatchGetResourceConfigResponse> batchGetResourceConfig(
      List<ResourceKey> resourceKeys) async {
    var response_ = await _client.send('BatchGetResourceConfig', {
      'resourceKeys': resourceKeys,
    });
    return BatchGetResourceConfigResponse.fromJson(response_);
  }

  /// Deletes the authorization granted to the specified configuration
  /// aggregator account in a specified region.
  ///
  /// [authorizedAccountId]: The 12-digit account ID of the account authorized
  /// to aggregate data.
  ///
  /// [authorizedAwsRegion]: The region authorized to collect aggregated data.
  Future<void> deleteAggregationAuthorization(
      {@required String authorizedAccountId,
      @required String authorizedAwsRegion}) async {
    await _client.send('DeleteAggregationAuthorization', {
      'AuthorizedAccountId': authorizedAccountId,
      'AuthorizedAwsRegion': authorizedAwsRegion,
    });
  }

  /// Deletes the specified AWS Config rule and all of its evaluation results.
  ///
  /// AWS Config sets the state of a rule to `DELETING` until the deletion is
  /// complete. You cannot update a rule while it is in this state. If you make
  /// a `PutConfigRule` or `DeleteConfigRule` request for the rule, you will
  /// receive a `ResourceInUseException`.
  ///
  /// You can check the state of a rule by using the `DescribeConfigRules`
  /// request.
  ///
  /// [configRuleName]: The name of the AWS Config rule that you want to delete.
  Future<void> deleteConfigRule(String configRuleName) async {
    await _client.send('DeleteConfigRule', {
      'ConfigRuleName': configRuleName,
    });
  }

  /// Deletes the specified configuration aggregator and the aggregated data
  /// associated with the aggregator.
  ///
  /// [configurationAggregatorName]: The name of the configuration aggregator.
  Future<void> deleteConfigurationAggregator(
      String configurationAggregatorName) async {
    await _client.send('DeleteConfigurationAggregator', {
      'ConfigurationAggregatorName': configurationAggregatorName,
    });
  }

  /// Deletes the configuration recorder.
  ///
  /// After the configuration recorder is deleted, AWS Config will not record
  /// resource configuration changes until you create a new configuration
  /// recorder.
  ///
  /// This action does not delete the configuration information that was
  /// previously recorded. You will be able to access the previously recorded
  /// information by using the `GetResourceConfigHistory` action, but you will
  /// not be able to access this information in the AWS Config console until you
  /// create a new configuration recorder.
  ///
  /// [configurationRecorderName]: The name of the configuration recorder to be
  /// deleted. You can retrieve the name of your configuration recorder by using
  /// the `DescribeConfigurationRecorders` action.
  Future<void> deleteConfigurationRecorder(
      String configurationRecorderName) async {
    await _client.send('DeleteConfigurationRecorder', {
      'ConfigurationRecorderName': configurationRecorderName,
    });
  }

  /// Deletes the delivery channel.
  ///
  /// Before you can delete the delivery channel, you must stop the
  /// configuration recorder by using the StopConfigurationRecorder action.
  ///
  /// [deliveryChannelName]: The name of the delivery channel to delete.
  Future<void> deleteDeliveryChannel(String deliveryChannelName) async {
    await _client.send('DeleteDeliveryChannel', {
      'DeliveryChannelName': deliveryChannelName,
    });
  }

  /// Deletes the evaluation results for the specified AWS Config rule. You can
  /// specify one AWS Config rule per request. After you delete the evaluation
  /// results, you can call the StartConfigRulesEvaluation API to start
  /// evaluating your AWS resources against the rule.
  ///
  /// [configRuleName]: The name of the AWS Config rule for which you want to
  /// delete the evaluation results.
  Future<DeleteEvaluationResultsResponse> deleteEvaluationResults(
      String configRuleName) async {
    var response_ = await _client.send('DeleteEvaluationResults', {
      'ConfigRuleName': configRuleName,
    });
    return DeleteEvaluationResultsResponse.fromJson(response_);
  }

  /// Deletes the specified organization config rule and all of its evaluation
  /// results from all member accounts in that organization. Only a master
  /// account can delete an organization config rule.
  ///
  /// AWS Config sets the state of a rule to DELETE_IN_PROGRESS until the
  /// deletion is complete. You cannot update a rule while it is in this state.
  ///
  /// [organizationConfigRuleName]: The name of organization config rule that
  /// you want to delete.
  Future<void> deleteOrganizationConfigRule(
      String organizationConfigRuleName) async {
    await _client.send('DeleteOrganizationConfigRule', {
      'OrganizationConfigRuleName': organizationConfigRuleName,
    });
  }

  /// Deletes pending authorization requests for a specified aggregator account
  /// in a specified region.
  ///
  /// [requesterAccountId]: The 12-digit account ID of the account requesting to
  /// aggregate data.
  ///
  /// [requesterAwsRegion]: The region requesting to aggregate data.
  Future<void> deletePendingAggregationRequest(
      {@required String requesterAccountId,
      @required String requesterAwsRegion}) async {
    await _client.send('DeletePendingAggregationRequest', {
      'RequesterAccountId': requesterAccountId,
      'RequesterAwsRegion': requesterAwsRegion,
    });
  }

  /// Deletes the remediation configuration.
  ///
  /// [configRuleName]: The name of the AWS Config rule for which you want to
  /// delete remediation configuration.
  ///
  /// [resourceType]: The type of a resource.
  Future<DeleteRemediationConfigurationResponse> deleteRemediationConfiguration(
      String configRuleName,
      {String resourceType}) async {
    var response_ = await _client.send('DeleteRemediationConfiguration', {
      'ConfigRuleName': configRuleName,
      if (resourceType != null) 'ResourceType': resourceType,
    });
    return DeleteRemediationConfigurationResponse.fromJson(response_);
  }

  /// Deletes one or more remediation exceptions mentioned in the resource keys.
  ///
  /// [configRuleName]: The name of the AWS Config rule for which you want to
  /// delete remediation exception configuration.
  ///
  /// [resourceKeys]: An exception list of resource exception keys to be
  /// processed with the current request. AWS Config adds exception for each
  /// resource key. For example, AWS Config adds 3 exceptions for 3 resource
  /// keys.
  Future<DeleteRemediationExceptionsResponse> deleteRemediationExceptions(
      {@required String configRuleName,
      @required List<RemediationExceptionResourceKey> resourceKeys}) async {
    var response_ = await _client.send('DeleteRemediationExceptions', {
      'ConfigRuleName': configRuleName,
      'ResourceKeys': resourceKeys,
    });
    return DeleteRemediationExceptionsResponse.fromJson(response_);
  }

  /// Deletes the retention configuration.
  ///
  /// [retentionConfigurationName]: The name of the retention configuration to
  /// delete.
  Future<void> deleteRetentionConfiguration(
      String retentionConfigurationName) async {
    await _client.send('DeleteRetentionConfiguration', {
      'RetentionConfigurationName': retentionConfigurationName,
    });
  }

  /// Schedules delivery of a configuration snapshot to the Amazon S3 bucket in
  /// the specified delivery channel. After the delivery has started, AWS Config
  /// sends the following notifications using an Amazon SNS topic that you have
  /// specified.
  ///
  /// *   Notification of the start of the delivery.
  ///
  /// *   Notification of the completion of the delivery, if the delivery was
  /// successfully completed.
  ///
  /// *   Notification of delivery failure, if the delivery failed.
  ///
  /// [deliveryChannelName]: The name of the delivery channel through which the
  /// snapshot is delivered.
  Future<DeliverConfigSnapshotResponse> deliverConfigSnapshot(
      String deliveryChannelName) async {
    var response_ = await _client.send('DeliverConfigSnapshot', {
      'deliveryChannelName': deliveryChannelName,
    });
    return DeliverConfigSnapshotResponse.fromJson(response_);
  }

  /// Returns a list of compliant and noncompliant rules with the number of
  /// resources for compliant and noncompliant rules.
  ///
  ///
  ///
  /// The results can return an empty result page, but if you have a
  /// `nextToken`, the results are displayed on the next page.
  ///
  /// [configurationAggregatorName]: The name of the configuration aggregator.
  ///
  /// [filters]: Filters the results by ConfigRuleComplianceFilters object.
  ///
  /// [limit]: The maximum number of evaluation results returned on each page.
  /// The default is maximum. If you specify 0, AWS Config uses the default.
  ///
  /// [nextToken]: The `nextToken` string returned on a previous page that you
  /// use to get the next page of results in a paginated response.
  Future<DescribeAggregateComplianceByConfigRulesResponse>
      describeAggregateComplianceByConfigRules(
          String configurationAggregatorName,
          {ConfigRuleComplianceFilters filters,
          int limit,
          String nextToken}) async {
    var response_ =
        await _client.send('DescribeAggregateComplianceByConfigRules', {
      'ConfigurationAggregatorName': configurationAggregatorName,
      if (filters != null) 'Filters': filters,
      if (limit != null) 'Limit': limit,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return DescribeAggregateComplianceByConfigRulesResponse.fromJson(response_);
  }

  /// Returns a list of authorizations granted to various aggregator accounts
  /// and regions.
  ///
  /// [limit]: The maximum number of AggregationAuthorizations returned on each
  /// page. The default is maximum. If you specify 0, AWS Config uses the
  /// default.
  ///
  /// [nextToken]: The `nextToken` string returned on a previous page that you
  /// use to get the next page of results in a paginated response.
  Future<DescribeAggregationAuthorizationsResponse>
      describeAggregationAuthorizations({int limit, String nextToken}) async {
    var response_ = await _client.send('DescribeAggregationAuthorizations', {
      if (limit != null) 'Limit': limit,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return DescribeAggregationAuthorizationsResponse.fromJson(response_);
  }

  /// Indicates whether the specified AWS Config rules are compliant. If a rule
  /// is noncompliant, this action returns the number of AWS resources that do
  /// not comply with the rule.
  ///
  /// A rule is compliant if all of the evaluated resources comply with it. It
  /// is noncompliant if any of these resources do not comply.
  ///
  /// If AWS Config has no current evaluation results for the rule, it returns
  /// `INSUFFICIENT_DATA`. This result might indicate one of the following
  /// conditions:
  ///
  /// *   AWS Config has never invoked an evaluation for the rule. To check
  /// whether it has, use the `DescribeConfigRuleEvaluationStatus` action to get
  /// the `LastSuccessfulInvocationTime` and `LastFailedInvocationTime`.
  ///
  /// *   The rule's AWS Lambda function is failing to send evaluation results
  /// to AWS Config. Verify that the role you assigned to your configuration
  /// recorder includes the `config:PutEvaluations` permission. If the rule is a
  /// custom rule, verify that the AWS Lambda execution role includes the
  /// `config:PutEvaluations` permission.
  ///
  /// *   The rule's AWS Lambda function has returned `NOT_APPLICABLE` for all
  /// evaluation results. This can occur if the resources were deleted or
  /// removed from the rule's scope.
  ///
  /// [configRuleNames]: Specify one or more AWS Config rule names to filter the
  /// results by rule.
  ///
  /// [complianceTypes]: Filters the results by compliance.
  ///
  /// The allowed values are `COMPLIANT` and `NON_COMPLIANT`.
  ///
  /// [nextToken]: The `nextToken` string returned on a previous page that you
  /// use to get the next page of results in a paginated response.
  Future<DescribeComplianceByConfigRuleResponse> describeComplianceByConfigRule(
      {List<String> configRuleNames,
      List<String> complianceTypes,
      String nextToken}) async {
    var response_ = await _client.send('DescribeComplianceByConfigRule', {
      if (configRuleNames != null) 'ConfigRuleNames': configRuleNames,
      if (complianceTypes != null) 'ComplianceTypes': complianceTypes,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return DescribeComplianceByConfigRuleResponse.fromJson(response_);
  }

  /// Indicates whether the specified AWS resources are compliant. If a resource
  /// is noncompliant, this action returns the number of AWS Config rules that
  /// the resource does not comply with.
  ///
  /// A resource is compliant if it complies with all the AWS Config rules that
  /// evaluate it. It is noncompliant if it does not comply with one or more of
  /// these rules.
  ///
  /// If AWS Config has no current evaluation results for the resource, it
  /// returns `INSUFFICIENT_DATA`. This result might indicate one of the
  /// following conditions about the rules that evaluate the resource:
  ///
  /// *   AWS Config has never invoked an evaluation for the rule. To check
  /// whether it has, use the `DescribeConfigRuleEvaluationStatus` action to get
  /// the `LastSuccessfulInvocationTime` and `LastFailedInvocationTime`.
  ///
  /// *   The rule's AWS Lambda function is failing to send evaluation results
  /// to AWS Config. Verify that the role that you assigned to your
  /// configuration recorder includes the `config:PutEvaluations` permission. If
  /// the rule is a custom rule, verify that the AWS Lambda execution role
  /// includes the `config:PutEvaluations` permission.
  ///
  /// *   The rule's AWS Lambda function has returned `NOT_APPLICABLE` for all
  /// evaluation results. This can occur if the resources were deleted or
  /// removed from the rule's scope.
  ///
  /// [resourceType]: The types of AWS resources for which you want compliance
  /// information (for example, `AWS::EC2::Instance`). For this action, you can
  /// specify that the resource type is an AWS account by specifying
  /// `AWS::::Account`.
  ///
  /// [resourceId]: The ID of the AWS resource for which you want compliance
  /// information. You can specify only one resource ID. If you specify a
  /// resource ID, you must also specify a type for `ResourceType`.
  ///
  /// [complianceTypes]: Filters the results by compliance.
  ///
  /// The allowed values are `COMPLIANT`, `NON_COMPLIANT`, and
  /// `INSUFFICIENT_DATA`.
  ///
  /// [limit]: The maximum number of evaluation results returned on each page.
  /// The default is 10. You cannot specify a number greater than 100. If you
  /// specify 0, AWS Config uses the default.
  ///
  /// [nextToken]: The `nextToken` string returned on a previous page that you
  /// use to get the next page of results in a paginated response.
  Future<DescribeComplianceByResourceResponse> describeComplianceByResource(
      {String resourceType,
      String resourceId,
      List<String> complianceTypes,
      int limit,
      String nextToken}) async {
    var response_ = await _client.send('DescribeComplianceByResource', {
      if (resourceType != null) 'ResourceType': resourceType,
      if (resourceId != null) 'ResourceId': resourceId,
      if (complianceTypes != null) 'ComplianceTypes': complianceTypes,
      if (limit != null) 'Limit': limit,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return DescribeComplianceByResourceResponse.fromJson(response_);
  }

  /// Returns status information for each of your AWS managed Config rules. The
  /// status includes information such as the last time AWS Config invoked the
  /// rule, the last time AWS Config failed to invoke the rule, and the related
  /// error for the last failure.
  ///
  /// [configRuleNames]: The name of the AWS managed Config rules for which you
  /// want status information. If you do not specify any names, AWS Config
  /// returns status information for all AWS managed Config rules that you use.
  ///
  /// [nextToken]: The `nextToken` string returned on a previous page that you
  /// use to get the next page of results in a paginated response.
  ///
  /// [limit]: The number of rule evaluation results that you want returned.
  ///
  /// This parameter is required if the rule limit for your account is more than
  /// the default of 150 rules.
  ///
  /// For information about requesting a rule limit increase, see
  /// [AWS Config Limits](http://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html#limits_config)
  /// in the _AWS General Reference Guide_.
  Future<DescribeConfigRuleEvaluationStatusResponse>
      describeConfigRuleEvaluationStatus(
          {List<String> configRuleNames, String nextToken, int limit}) async {
    var response_ = await _client.send('DescribeConfigRuleEvaluationStatus', {
      if (configRuleNames != null) 'ConfigRuleNames': configRuleNames,
      if (nextToken != null) 'NextToken': nextToken,
      if (limit != null) 'Limit': limit,
    });
    return DescribeConfigRuleEvaluationStatusResponse.fromJson(response_);
  }

  /// Returns details about your AWS Config rules.
  ///
  /// [configRuleNames]: The names of the AWS Config rules for which you want
  /// details. If you do not specify any names, AWS Config returns details for
  /// all your rules.
  ///
  /// [nextToken]: The `nextToken` string returned on a previous page that you
  /// use to get the next page of results in a paginated response.
  Future<DescribeConfigRulesResponse> describeConfigRules(
      {List<String> configRuleNames, String nextToken}) async {
    var response_ = await _client.send('DescribeConfigRules', {
      if (configRuleNames != null) 'ConfigRuleNames': configRuleNames,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return DescribeConfigRulesResponse.fromJson(response_);
  }

  /// Returns status information for sources within an aggregator. The status
  /// includes information about the last time AWS Config verified authorization
  /// between the source account and an aggregator account. In case of a
  /// failure, the status contains the related error code or message.
  ///
  /// [configurationAggregatorName]: The name of the configuration aggregator.
  ///
  /// [updateStatus]: Filters the status type.
  ///
  /// *   Valid value FAILED indicates errors while moving data.
  ///
  /// *   Valid value SUCCEEDED indicates the data was successfully moved.
  ///
  /// *   Valid value OUTDATED indicates the data is not the most recent.
  ///
  /// [nextToken]: The `nextToken` string returned on a previous page that you
  /// use to get the next page of results in a paginated response.
  ///
  /// [limit]: The maximum number of AggregatorSourceStatus returned on each
  /// page. The default is maximum. If you specify 0, AWS Config uses the
  /// default.
  Future<DescribeConfigurationAggregatorSourcesStatusResponse>
      describeConfigurationAggregatorSourcesStatus(
          String configurationAggregatorName,
          {List<String> updateStatus,
          String nextToken,
          int limit}) async {
    var response_ =
        await _client.send('DescribeConfigurationAggregatorSourcesStatus', {
      'ConfigurationAggregatorName': configurationAggregatorName,
      if (updateStatus != null) 'UpdateStatus': updateStatus,
      if (nextToken != null) 'NextToken': nextToken,
      if (limit != null) 'Limit': limit,
    });
    return DescribeConfigurationAggregatorSourcesStatusResponse.fromJson(
        response_);
  }

  /// Returns the details of one or more configuration aggregators. If the
  /// configuration aggregator is not specified, this action returns the details
  /// for all the configuration aggregators associated with the account.
  ///
  /// [configurationAggregatorNames]: The name of the configuration aggregators.
  ///
  /// [nextToken]: The `nextToken` string returned on a previous page that you
  /// use to get the next page of results in a paginated response.
  ///
  /// [limit]: The maximum number of configuration aggregators returned on each
  /// page. The default is maximum. If you specify 0, AWS Config uses the
  /// default.
  Future<DescribeConfigurationAggregatorsResponse>
      describeConfigurationAggregators(
          {List<String> configurationAggregatorNames,
          String nextToken,
          int limit}) async {
    var response_ = await _client.send('DescribeConfigurationAggregators', {
      if (configurationAggregatorNames != null)
        'ConfigurationAggregatorNames': configurationAggregatorNames,
      if (nextToken != null) 'NextToken': nextToken,
      if (limit != null) 'Limit': limit,
    });
    return DescribeConfigurationAggregatorsResponse.fromJson(response_);
  }

  /// Returns the current status of the specified configuration recorder. If a
  /// configuration recorder is not specified, this action returns the status of
  /// all configuration recorders associated with the account.
  ///
  ///
  ///
  /// Currently, you can specify only one configuration recorder per region in
  /// your account.
  ///
  /// [configurationRecorderNames]: The name(s) of the configuration recorder.
  /// If the name is not specified, the action returns the current status of all
  /// the configuration recorders associated with the account.
  Future<DescribeConfigurationRecorderStatusResponse>
      describeConfigurationRecorderStatus(
          {List<String> configurationRecorderNames}) async {
    var response_ = await _client.send('DescribeConfigurationRecorderStatus', {
      if (configurationRecorderNames != null)
        'ConfigurationRecorderNames': configurationRecorderNames,
    });
    return DescribeConfigurationRecorderStatusResponse.fromJson(response_);
  }

  /// Returns the details for the specified configuration recorders. If the
  /// configuration recorder is not specified, this action returns the details
  /// for all configuration recorders associated with the account.
  ///
  ///
  ///
  /// Currently, you can specify only one configuration recorder per region in
  /// your account.
  ///
  /// [configurationRecorderNames]: A list of configuration recorder names.
  Future<DescribeConfigurationRecordersResponse> describeConfigurationRecorders(
      {List<String> configurationRecorderNames}) async {
    var response_ = await _client.send('DescribeConfigurationRecorders', {
      if (configurationRecorderNames != null)
        'ConfigurationRecorderNames': configurationRecorderNames,
    });
    return DescribeConfigurationRecordersResponse.fromJson(response_);
  }

  /// Returns the current status of the specified delivery channel. If a
  /// delivery channel is not specified, this action returns the current status
  /// of all delivery channels associated with the account.
  ///
  ///
  ///
  /// Currently, you can specify only one delivery channel per region in your
  /// account.
  ///
  /// [deliveryChannelNames]: A list of delivery channel names.
  Future<DescribeDeliveryChannelStatusResponse> describeDeliveryChannelStatus(
      {List<String> deliveryChannelNames}) async {
    var response_ = await _client.send('DescribeDeliveryChannelStatus', {
      if (deliveryChannelNames != null)
        'DeliveryChannelNames': deliveryChannelNames,
    });
    return DescribeDeliveryChannelStatusResponse.fromJson(response_);
  }

  /// Returns details about the specified delivery channel. If a delivery
  /// channel is not specified, this action returns the details of all delivery
  /// channels associated with the account.
  ///
  ///
  ///
  /// Currently, you can specify only one delivery channel per region in your
  /// account.
  ///
  /// [deliveryChannelNames]: A list of delivery channel names.
  Future<DescribeDeliveryChannelsResponse> describeDeliveryChannels(
      {List<String> deliveryChannelNames}) async {
    var response_ = await _client.send('DescribeDeliveryChannels', {
      if (deliveryChannelNames != null)
        'DeliveryChannelNames': deliveryChannelNames,
    });
    return DescribeDeliveryChannelsResponse.fromJson(response_);
  }

  /// Provides organization config rule deployment status for an organization.
  ///
  ///
  ///
  /// The status is not considered successful until organization config rule is
  /// successfully deployed in all the member accounts with an exception of
  /// excluded accounts.
  ///
  /// When you specify the limit and the next token, you receive a paginated
  /// response. Limit and next token are not applicable if you specify
  /// organization config rule names. It is only applicable, when you request
  /// all the organization config rules.
  ///
  /// Only a master account can call this API.
  ///
  /// [organizationConfigRuleNames]: The names of organization config rules for
  /// which you want status details. If you do not specify any names, AWS Config
  /// returns details for all your organization AWS Confg rules.
  ///
  /// [limit]: The maximum number of `OrganizationConfigRuleStatuses` returned
  /// on each page. If you do no specify a number, AWS Config uses the default.
  /// The default is 100.
  ///
  /// [nextToken]: The `nextToken` string returned on a previous page that you
  /// use to get the next page of results in a paginated response.
  Future<DescribeOrganizationConfigRuleStatusesResponse>
      describeOrganizationConfigRuleStatuses(
          {List<String> organizationConfigRuleNames,
          int limit,
          String nextToken}) async {
    var response_ =
        await _client.send('DescribeOrganizationConfigRuleStatuses', {
      if (organizationConfigRuleNames != null)
        'OrganizationConfigRuleNames': organizationConfigRuleNames,
      if (limit != null) 'Limit': limit,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return DescribeOrganizationConfigRuleStatusesResponse.fromJson(response_);
  }

  /// Returns a list of organization config rules.
  ///
  ///
  ///
  /// When you specify the limit and the next token, you receive a paginated
  /// response. Limit and next token are not applicable if you specify
  /// organization config rule names. It is only applicable, when you request
  /// all the organization config rules.
  ///
  /// Only a master account can call this API.
  ///
  /// [organizationConfigRuleNames]: The names of organization config rules for
  /// which you want details. If you do not specify any names, AWS Config
  /// returns details for all your organization config rules.
  ///
  /// [limit]: The maximum number of organization config rules returned on each
  /// page. If you do no specify a number, AWS Config uses the default. The
  /// default is 100.
  ///
  /// [nextToken]: The `nextToken` string returned on a previous page that you
  /// use to get the next page of results in a paginated response.
  Future<DescribeOrganizationConfigRulesResponse>
      describeOrganizationConfigRules(
          {List<String> organizationConfigRuleNames,
          int limit,
          String nextToken}) async {
    var response_ = await _client.send('DescribeOrganizationConfigRules', {
      if (organizationConfigRuleNames != null)
        'OrganizationConfigRuleNames': organizationConfigRuleNames,
      if (limit != null) 'Limit': limit,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return DescribeOrganizationConfigRulesResponse.fromJson(response_);
  }

  /// Returns a list of all pending aggregation requests.
  ///
  /// [limit]: The maximum number of evaluation results returned on each page.
  /// The default is maximum. If you specify 0, AWS Config uses the default.
  ///
  /// [nextToken]: The `nextToken` string returned on a previous page that you
  /// use to get the next page of results in a paginated response.
  Future<DescribePendingAggregationRequestsResponse>
      describePendingAggregationRequests({int limit, String nextToken}) async {
    var response_ = await _client.send('DescribePendingAggregationRequests', {
      if (limit != null) 'Limit': limit,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return DescribePendingAggregationRequestsResponse.fromJson(response_);
  }

  /// Returns the details of one or more remediation configurations.
  ///
  /// [configRuleNames]: A list of AWS Config rule names of remediation
  /// configurations for which you want details.
  Future<DescribeRemediationConfigurationsResponse>
      describeRemediationConfigurations(List<String> configRuleNames) async {
    var response_ = await _client.send('DescribeRemediationConfigurations', {
      'ConfigRuleNames': configRuleNames,
    });
    return DescribeRemediationConfigurationsResponse.fromJson(response_);
  }

  /// Returns the details of one or more remediation exceptions. A detailed view
  /// of a remediation exception for a set of resources that includes an
  /// explanation of an exception and the time when the exception will be
  /// deleted. When you specify the limit and the next token, you receive a
  /// paginated response.
  ///
  ///
  ///
  /// When you specify the limit and the next token, you receive a paginated
  /// response.
  ///
  /// Limit and next token are not applicable if you request resources in batch.
  /// It is only applicable, when you request all resources.
  ///
  /// [configRuleName]: The name of the AWS Config rule.
  ///
  /// [resourceKeys]: An exception list of resource exception keys to be
  /// processed with the current request. AWS Config adds exception for each
  /// resource key. For example, AWS Config adds 3 exceptions for 3 resource
  /// keys.
  ///
  /// [limit]: The maximum number of RemediationExceptionResourceKey returned on
  /// each page. The default is 25. If you specify 0, AWS Config uses the
  /// default.
  ///
  /// [nextToken]: The `nextToken` string returned in a previous request that
  /// you use to request the next page of results in a paginated response.
  Future<DescribeRemediationExceptionsResponse> describeRemediationExceptions(
      String configRuleName,
      {List<RemediationExceptionResourceKey> resourceKeys,
      int limit,
      String nextToken}) async {
    var response_ = await _client.send('DescribeRemediationExceptions', {
      'ConfigRuleName': configRuleName,
      if (resourceKeys != null) 'ResourceKeys': resourceKeys,
      if (limit != null) 'Limit': limit,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return DescribeRemediationExceptionsResponse.fromJson(response_);
  }

  /// Provides a detailed view of a Remediation Execution for a set of resources
  /// including state, timestamps for when steps for the remediation execution
  /// occur, and any error messages for steps that have failed. When you specify
  /// the limit and the next token, you receive a paginated response.
  ///
  /// [configRuleName]: A list of AWS Config rule names.
  ///
  /// [resourceKeys]: A list of resource keys to be processed with the current
  /// request. Each element in the list consists of the resource type and
  /// resource ID.
  ///
  /// [limit]: The maximum number of RemediationExecutionStatuses returned on
  /// each page. The default is maximum. If you specify 0, AWS Config uses the
  /// default.
  ///
  /// [nextToken]: The `nextToken` string returned on a previous page that you
  /// use to get the next page of results in a paginated response.
  Future<DescribeRemediationExecutionStatusResponse>
      describeRemediationExecutionStatus(String configRuleName,
          {List<ResourceKey> resourceKeys, int limit, String nextToken}) async {
    var response_ = await _client.send('DescribeRemediationExecutionStatus', {
      'ConfigRuleName': configRuleName,
      if (resourceKeys != null) 'ResourceKeys': resourceKeys,
      if (limit != null) 'Limit': limit,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return DescribeRemediationExecutionStatusResponse.fromJson(response_);
  }

  /// Returns the details of one or more retention configurations. If the
  /// retention configuration name is not specified, this action returns the
  /// details for all the retention configurations for that account.
  ///
  ///
  ///
  /// Currently, AWS Config supports only one retention configuration per region
  /// in your account.
  ///
  /// [retentionConfigurationNames]: A list of names of retention configurations
  /// for which you want details. If you do not specify a name, AWS Config
  /// returns details for all the retention configurations for that account.
  ///
  ///
  ///
  /// Currently, AWS Config supports only one retention configuration per region
  /// in your account.
  ///
  /// [nextToken]: The `nextToken` string returned on a previous page that you
  /// use to get the next page of results in a paginated response.
  Future<DescribeRetentionConfigurationsResponse>
      describeRetentionConfigurations(
          {List<String> retentionConfigurationNames, String nextToken}) async {
    var response_ = await _client.send('DescribeRetentionConfigurations', {
      if (retentionConfigurationNames != null)
        'RetentionConfigurationNames': retentionConfigurationNames,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return DescribeRetentionConfigurationsResponse.fromJson(response_);
  }

  /// Returns the evaluation results for the specified AWS Config rule for a
  /// specific resource in a rule. The results indicate which AWS resources were
  /// evaluated by the rule, when each resource was last evaluated, and whether
  /// each resource complies with the rule.
  ///
  ///
  ///
  /// The results can return an empty result page. But if you have a
  /// `nextToken`, the results are displayed on the next page.
  ///
  /// [configurationAggregatorName]: The name of the configuration aggregator.
  ///
  /// [configRuleName]: The name of the AWS Config rule for which you want
  /// compliance information.
  ///
  /// [accountId]: The 12-digit account ID of the source account.
  ///
  /// [awsRegion]: The source region from where the data is aggregated.
  ///
  /// [complianceType]: The resource compliance status.
  ///
  ///
  ///
  /// For the `GetAggregateComplianceDetailsByConfigRuleRequest` data type, AWS
  /// Config supports only the `COMPLIANT` and `NON_COMPLIANT`. AWS Config does
  /// not support the `NOT_APPLICABLE` and `INSUFFICIENT_DATA` values.
  ///
  /// [limit]: The maximum number of evaluation results returned on each page.
  /// The default is 50. You cannot specify a number greater than 100. If you
  /// specify 0, AWS Config uses the default.
  ///
  /// [nextToken]: The `nextToken` string returned on a previous page that you
  /// use to get the next page of results in a paginated response.
  Future<GetAggregateComplianceDetailsByConfigRuleResponse>
      getAggregateComplianceDetailsByConfigRule(
          {@required String configurationAggregatorName,
          @required String configRuleName,
          @required String accountId,
          @required String awsRegion,
          String complianceType,
          int limit,
          String nextToken}) async {
    var response_ =
        await _client.send('GetAggregateComplianceDetailsByConfigRule', {
      'ConfigurationAggregatorName': configurationAggregatorName,
      'ConfigRuleName': configRuleName,
      'AccountId': accountId,
      'AwsRegion': awsRegion,
      if (complianceType != null) 'ComplianceType': complianceType,
      if (limit != null) 'Limit': limit,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return GetAggregateComplianceDetailsByConfigRuleResponse.fromJson(
        response_);
  }

  /// Returns the number of compliant and noncompliant rules for one or more
  /// accounts and regions in an aggregator.
  ///
  ///
  ///
  /// The results can return an empty result page, but if you have a nextToken,
  /// the results are displayed on the next page.
  ///
  /// [configurationAggregatorName]: The name of the configuration aggregator.
  ///
  /// [filters]: Filters the results based on the
  /// ConfigRuleComplianceSummaryFilters object.
  ///
  /// [groupByKey]: Groups the result based on ACCOUNT_ID or AWS_REGION.
  ///
  /// [limit]: The maximum number of evaluation results returned on each page.
  /// The default is 1000. You cannot specify a number greater than 1000. If you
  /// specify 0, AWS Config uses the default.
  ///
  /// [nextToken]: The `nextToken` string returned on a previous page that you
  /// use to get the next page of results in a paginated response.
  Future<GetAggregateConfigRuleComplianceSummaryResponse>
      getAggregateConfigRuleComplianceSummary(
          String configurationAggregatorName,
          {ConfigRuleComplianceSummaryFilters filters,
          String groupByKey,
          int limit,
          String nextToken}) async {
    var response_ =
        await _client.send('GetAggregateConfigRuleComplianceSummary', {
      'ConfigurationAggregatorName': configurationAggregatorName,
      if (filters != null) 'Filters': filters,
      if (groupByKey != null) 'GroupByKey': groupByKey,
      if (limit != null) 'Limit': limit,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return GetAggregateConfigRuleComplianceSummaryResponse.fromJson(response_);
  }

  /// Returns the resource counts across accounts and regions that are present
  /// in your AWS Config aggregator. You can request the resource counts by
  /// providing filters and GroupByKey.
  ///
  /// For example, if the input contains accountID 12345678910 and region
  /// us-east-1 in filters, the API returns the count of resources in account ID
  /// 12345678910 and region us-east-1. If the input contains ACCOUNT_ID as a
  /// GroupByKey, the API returns resource counts for all source accounts that
  /// are present in your aggregator.
  ///
  /// [configurationAggregatorName]: The name of the configuration aggregator.
  ///
  /// [filters]: Filters the results based on the `ResourceCountFilters` object.
  ///
  /// [groupByKey]: The key to group the resource counts.
  ///
  /// [limit]: The maximum number of GroupedResourceCount objects returned on
  /// each page. The default is 1000. You cannot specify a number greater than
  /// 1000. If you specify 0, AWS Config uses the default.
  ///
  /// [nextToken]: The `nextToken` string returned on a previous page that you
  /// use to get the next page of results in a paginated response.
  Future<GetAggregateDiscoveredResourceCountsResponse>
      getAggregateDiscoveredResourceCounts(String configurationAggregatorName,
          {ResourceCountFilters filters,
          String groupByKey,
          int limit,
          String nextToken}) async {
    var response_ = await _client.send('GetAggregateDiscoveredResourceCounts', {
      'ConfigurationAggregatorName': configurationAggregatorName,
      if (filters != null) 'Filters': filters,
      if (groupByKey != null) 'GroupByKey': groupByKey,
      if (limit != null) 'Limit': limit,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return GetAggregateDiscoveredResourceCountsResponse.fromJson(response_);
  }

  /// Returns configuration item that is aggregated for your specific resource
  /// in a specific source account and region.
  ///
  /// [configurationAggregatorName]: The name of the configuration aggregator.
  ///
  /// [resourceIdentifier]: An object that identifies aggregate resource.
  Future<GetAggregateResourceConfigResponse> getAggregateResourceConfig(
      {@required String configurationAggregatorName,
      @required AggregateResourceIdentifier resourceIdentifier}) async {
    var response_ = await _client.send('GetAggregateResourceConfig', {
      'ConfigurationAggregatorName': configurationAggregatorName,
      'ResourceIdentifier': resourceIdentifier,
    });
    return GetAggregateResourceConfigResponse.fromJson(response_);
  }

  /// Returns the evaluation results for the specified AWS Config rule. The
  /// results indicate which AWS resources were evaluated by the rule, when each
  /// resource was last evaluated, and whether each resource complies with the
  /// rule.
  ///
  /// [configRuleName]: The name of the AWS Config rule for which you want
  /// compliance information.
  ///
  /// [complianceTypes]: Filters the results by compliance.
  ///
  /// The allowed values are `COMPLIANT`, `NON_COMPLIANT`, and `NOT_APPLICABLE`.
  ///
  /// [limit]: The maximum number of evaluation results returned on each page.
  /// The default is 10. You cannot specify a number greater than 100. If you
  /// specify 0, AWS Config uses the default.
  ///
  /// [nextToken]: The `nextToken` string returned on a previous page that you
  /// use to get the next page of results in a paginated response.
  Future<GetComplianceDetailsByConfigRuleResponse>
      getComplianceDetailsByConfigRule(String configRuleName,
          {List<String> complianceTypes, int limit, String nextToken}) async {
    var response_ = await _client.send('GetComplianceDetailsByConfigRule', {
      'ConfigRuleName': configRuleName,
      if (complianceTypes != null) 'ComplianceTypes': complianceTypes,
      if (limit != null) 'Limit': limit,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return GetComplianceDetailsByConfigRuleResponse.fromJson(response_);
  }

  /// Returns the evaluation results for the specified AWS resource. The results
  /// indicate which AWS Config rules were used to evaluate the resource, when
  /// each rule was last used, and whether the resource complies with each rule.
  ///
  /// [resourceType]: The type of the AWS resource for which you want compliance
  /// information.
  ///
  /// [resourceId]: The ID of the AWS resource for which you want compliance
  /// information.
  ///
  /// [complianceTypes]: Filters the results by compliance.
  ///
  /// The allowed values are `COMPLIANT`, `NON_COMPLIANT`, and `NOT_APPLICABLE`.
  ///
  /// [nextToken]: The `nextToken` string returned on a previous page that you
  /// use to get the next page of results in a paginated response.
  Future<GetComplianceDetailsByResourceResponse> getComplianceDetailsByResource(
      {@required String resourceType,
      @required String resourceId,
      List<String> complianceTypes,
      String nextToken}) async {
    var response_ = await _client.send('GetComplianceDetailsByResource', {
      'ResourceType': resourceType,
      'ResourceId': resourceId,
      if (complianceTypes != null) 'ComplianceTypes': complianceTypes,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return GetComplianceDetailsByResourceResponse.fromJson(response_);
  }

  /// Returns the number of AWS Config rules that are compliant and
  /// noncompliant, up to a maximum of 25 for each.
  Future<GetComplianceSummaryByConfigRuleResponse>
      getComplianceSummaryByConfigRule() async {
    var response_ = await _client.send('GetComplianceSummaryByConfigRule', {});
    return GetComplianceSummaryByConfigRuleResponse.fromJson(response_);
  }

  /// Returns the number of resources that are compliant and the number that are
  /// noncompliant. You can specify one or more resource types to get these
  /// numbers for each resource type. The maximum number returned is 100.
  ///
  /// [resourceTypes]: Specify one or more resource types to get the number of
  /// resources that are compliant and the number that are noncompliant for each
  /// resource type.
  ///
  /// For this request, you can specify an AWS resource type such as
  /// `AWS::EC2::Instance`. You can specify that the resource type is an AWS
  /// account by specifying `AWS::::Account`.
  Future<GetComplianceSummaryByResourceTypeResponse>
      getComplianceSummaryByResourceType({List<String> resourceTypes}) async {
    var response_ = await _client.send('GetComplianceSummaryByResourceType', {
      if (resourceTypes != null) 'ResourceTypes': resourceTypes,
    });
    return GetComplianceSummaryByResourceTypeResponse.fromJson(response_);
  }

  /// Returns the resource types, the number of each resource type, and the
  /// total number of resources that AWS Config is recording in this region for
  /// your AWS account.
  ///
  ///  **Example**
  ///
  /// 1.  AWS Config is recording three resource types in the US East (Ohio)
  /// Region for your account: 25 EC2 instances, 20 IAM users, and 15 S3
  /// buckets.
  ///
  /// 2.  You make a call to the `GetDiscoveredResourceCounts` action and
  /// specify that you want all resource types.
  ///
  /// 3.  AWS Config returns the following:
  ///
  ///     *   The resource types (EC2 instances, IAM users, and S3 buckets).
  ///
  ///     *   The number of each resource type (25, 20, and 15).
  ///
  ///     *   The total number of all resources (60).
  ///
  ///
  ///
  /// The response is paginated. By default, AWS Config lists 100 ResourceCount
  /// objects on each page. You can customize this number with the `limit`
  /// parameter. The response includes a `nextToken` string. To get the next
  /// page of results, run the request again and specify the string for the
  /// `nextToken` parameter.
  ///
  ///
  ///
  /// If you make a call to the GetDiscoveredResourceCounts action, you might
  /// not immediately receive resource counts in the following situations:
  ///
  /// *   You are a new AWS Config customer.
  ///
  /// *   You just enabled resource recording.
  ///
  ///
  /// It might take a few minutes for AWS Config to record and count your
  /// resources. Wait a few minutes and then retry the
  /// GetDiscoveredResourceCounts action.
  ///
  /// [resourceTypes]: The comma-separated list that specifies the resource
  /// types that you want AWS Config to return (for example,
  /// `"AWS::EC2::Instance"`, `"AWS::IAM::User"`).
  ///
  /// If a value for `resourceTypes` is not specified, AWS Config returns all
  /// resource types that AWS Config is recording in the region for your
  /// account.
  ///
  ///
  ///
  /// If the configuration recorder is turned off, AWS Config returns an empty
  /// list of ResourceCount objects. If the configuration recorder is not
  /// recording a specific resource type (for example, S3 buckets), that
  /// resource type is not returned in the list of ResourceCount objects.
  ///
  /// [limit]: The maximum number of ResourceCount objects returned on each
  /// page. The default is 100. You cannot specify a number greater than 100. If
  /// you specify 0, AWS Config uses the default.
  ///
  /// [nextToken]: The `nextToken` string returned on a previous page that you
  /// use to get the next page of results in a paginated response.
  Future<GetDiscoveredResourceCountsResponse> getDiscoveredResourceCounts(
      {List<String> resourceTypes, int limit, String nextToken}) async {
    var response_ = await _client.send('GetDiscoveredResourceCounts', {
      if (resourceTypes != null) 'resourceTypes': resourceTypes,
      if (limit != null) 'limit': limit,
      if (nextToken != null) 'nextToken': nextToken,
    });
    return GetDiscoveredResourceCountsResponse.fromJson(response_);
  }

  /// Returns detailed status for each member account within an organization for
  /// a given organization config rule.
  ///
  ///
  ///
  /// Only a master account can call this API.
  ///
  /// [organizationConfigRuleName]: The name of organization config rule for
  /// which you want status details for member accounts.
  ///
  /// [filters]: A `StatusDetailFilters` object.
  ///
  /// [limit]: The maximum number of `OrganizationConfigRuleDetailedStatus`
  /// returned on each page. If you do not specify a number, AWS Config uses the
  /// default. The default is 100.
  ///
  /// [nextToken]: The `nextToken` string returned on a previous page that you
  /// use to get the next page of results in a paginated response.
  Future<GetOrganizationConfigRuleDetailedStatusResponse>
      getOrganizationConfigRuleDetailedStatus(String organizationConfigRuleName,
          {StatusDetailFilters filters, int limit, String nextToken}) async {
    var response_ =
        await _client.send('GetOrganizationConfigRuleDetailedStatus', {
      'OrganizationConfigRuleName': organizationConfigRuleName,
      if (filters != null) 'Filters': filters,
      if (limit != null) 'Limit': limit,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return GetOrganizationConfigRuleDetailedStatusResponse.fromJson(response_);
  }

  /// Returns a list of configuration items for the specified resource. The list
  /// contains details about each state of the resource during the specified
  /// time interval. If you specified a retention period to retain your
  /// `ConfigurationItems` between a minimum of 30 days and a maximum of 7 years
  /// (2557 days), AWS Config returns the `ConfigurationItems` for the specified
  /// retention period.
  ///
  /// The response is paginated. By default, AWS Config returns a limit of 10
  /// configuration items per page. You can customize this number with the
  /// `limit` parameter. The response includes a `nextToken` string. To get the
  /// next page of results, run the request again and specify the string for the
  /// `nextToken` parameter.
  ///
  ///
  ///
  /// Each call to the API is limited to span a duration of seven days. It is
  /// likely that the number of records returned is smaller than the specified
  /// `limit`. In such cases, you can make another call, using the `nextToken`.
  ///
  /// [resourceType]: The resource type.
  ///
  /// [resourceId]: The ID of the resource (for example., `sg-xxxxxx`).
  ///
  /// [laterTime]: The time stamp that indicates a later time. If not specified,
  /// current time is taken.
  ///
  /// [earlierTime]: The time stamp that indicates an earlier time. If not
  /// specified, the action returns paginated results that contain configuration
  /// items that start when the first configuration item was recorded.
  ///
  /// [chronologicalOrder]: The chronological order for configuration items
  /// listed. By default, the results are listed in reverse chronological order.
  ///
  /// [limit]: The maximum number of configuration items returned on each page.
  /// The default is 10. You cannot specify a number greater than 100. If you
  /// specify 0, AWS Config uses the default.
  ///
  /// [nextToken]: The `nextToken` string returned on a previous page that you
  /// use to get the next page of results in a paginated response.
  Future<GetResourceConfigHistoryResponse> getResourceConfigHistory(
      {@required String resourceType,
      @required String resourceId,
      DateTime laterTime,
      DateTime earlierTime,
      String chronologicalOrder,
      int limit,
      String nextToken}) async {
    var response_ = await _client.send('GetResourceConfigHistory', {
      'resourceType': resourceType,
      'resourceId': resourceId,
      if (laterTime != null) 'laterTime': laterTime,
      if (earlierTime != null) 'earlierTime': earlierTime,
      if (chronologicalOrder != null) 'chronologicalOrder': chronologicalOrder,
      if (limit != null) 'limit': limit,
      if (nextToken != null) 'nextToken': nextToken,
    });
    return GetResourceConfigHistoryResponse.fromJson(response_);
  }

  /// Accepts a resource type and returns a list of resource identifiers that
  /// are aggregated for a specific resource type across accounts and regions. A
  /// resource identifier includes the resource type, ID, (if available) the
  /// custom resource name, source account, and source region. You can narrow
  /// the results to include only resources that have specific resource IDs, or
  /// a resource name, or source account ID, or source region.
  ///
  /// For example, if the input consists of accountID 12345678910 and the region
  /// is us-east-1 for resource type `AWS::EC2::Instance` then the API returns
  /// all the EC2 instance identifiers of accountID 12345678910 and region
  /// us-east-1.
  ///
  /// [configurationAggregatorName]: The name of the configuration aggregator.
  ///
  /// [resourceType]: The type of resources that you want AWS Config to list in
  /// the response.
  ///
  /// [filters]: Filters the results based on the `ResourceFilters` object.
  ///
  /// [limit]: The maximum number of resource identifiers returned on each page.
  /// The default is 100. You cannot specify a number greater than 100. If you
  /// specify 0, AWS Config uses the default.
  ///
  /// [nextToken]: The `nextToken` string returned on a previous page that you
  /// use to get the next page of results in a paginated response.
  Future<ListAggregateDiscoveredResourcesResponse>
      listAggregateDiscoveredResources(
          {@required String configurationAggregatorName,
          @required String resourceType,
          ResourceFilters filters,
          int limit,
          String nextToken}) async {
    var response_ = await _client.send('ListAggregateDiscoveredResources', {
      'ConfigurationAggregatorName': configurationAggregatorName,
      'ResourceType': resourceType,
      if (filters != null) 'Filters': filters,
      if (limit != null) 'Limit': limit,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListAggregateDiscoveredResourcesResponse.fromJson(response_);
  }

  /// Accepts a resource type and returns a list of resource identifiers for the
  /// resources of that type. A resource identifier includes the resource type,
  /// ID, and (if available) the custom resource name. The results consist of
  /// resources that AWS Config has discovered, including those that AWS Config
  /// is not currently recording. You can narrow the results to include only
  /// resources that have specific resource IDs or a resource name.
  ///
  ///  You can specify either resource IDs or a resource name, but not both, in
  /// the same request.
  ///
  /// The response is paginated. By default, AWS Config lists 100 resource
  /// identifiers on each page. You can customize this number with the `limit`
  /// parameter. The response includes a `nextToken` string. To get the next
  /// page of results, run the request again and specify the string for the
  /// `nextToken` parameter.
  ///
  /// [resourceType]: The type of resources that you want AWS Config to list in
  /// the response.
  ///
  /// [resourceIds]: The IDs of only those resources that you want AWS Config to
  /// list in the response. If you do not specify this parameter, AWS Config
  /// lists all resources of the specified type that it has discovered.
  ///
  /// [resourceName]: The custom name of only those resources that you want AWS
  /// Config to list in the response. If you do not specify this parameter, AWS
  /// Config lists all resources of the specified type that it has discovered.
  ///
  /// [limit]: The maximum number of resource identifiers returned on each page.
  /// The default is 100. You cannot specify a number greater than 100. If you
  /// specify 0, AWS Config uses the default.
  ///
  /// [includeDeletedResources]: Specifies whether AWS Config includes deleted
  /// resources in the results. By default, deleted resources are not included.
  ///
  /// [nextToken]: The `nextToken` string returned on a previous page that you
  /// use to get the next page of results in a paginated response.
  Future<ListDiscoveredResourcesResponse> listDiscoveredResources(
      String resourceType,
      {List<String> resourceIds,
      String resourceName,
      int limit,
      bool includeDeletedResources,
      String nextToken}) async {
    var response_ = await _client.send('ListDiscoveredResources', {
      'resourceType': resourceType,
      if (resourceIds != null) 'resourceIds': resourceIds,
      if (resourceName != null) 'resourceName': resourceName,
      if (limit != null) 'limit': limit,
      if (includeDeletedResources != null)
        'includeDeletedResources': includeDeletedResources,
      if (nextToken != null) 'nextToken': nextToken,
    });
    return ListDiscoveredResourcesResponse.fromJson(response_);
  }

  /// List the tags for AWS Config resource.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) that identifies the resource
  /// for which to list the tags. Currently, the supported resources are
  /// `ConfigRule`, `ConfigurationAggregator` and `AggregatorAuthorization`.
  ///
  /// [limit]: The maximum number of tags returned on each page. The limit
  /// maximum is 50. You cannot specify a number greater than 50. If you specify
  /// 0, AWS Config uses the default.
  ///
  /// [nextToken]: The `nextToken` string returned on a previous page that you
  /// use to get the next page of results in a paginated response.
  Future<ListTagsForResourceResponse> listTagsForResource(String resourceArn,
      {int limit, String nextToken}) async {
    var response_ = await _client.send('ListTagsForResource', {
      'ResourceArn': resourceArn,
      if (limit != null) 'Limit': limit,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListTagsForResourceResponse.fromJson(response_);
  }

  /// Authorizes the aggregator account and region to collect data from the
  /// source account and region.
  ///
  /// [authorizedAccountId]: The 12-digit account ID of the account authorized
  /// to aggregate data.
  ///
  /// [authorizedAwsRegion]: The region authorized to collect aggregated data.
  ///
  /// [tags]: An array of tag object.
  Future<PutAggregationAuthorizationResponse> putAggregationAuthorization(
      {@required String authorizedAccountId,
      @required String authorizedAwsRegion,
      List<Tag> tags}) async {
    var response_ = await _client.send('PutAggregationAuthorization', {
      'AuthorizedAccountId': authorizedAccountId,
      'AuthorizedAwsRegion': authorizedAwsRegion,
      if (tags != null) 'Tags': tags,
    });
    return PutAggregationAuthorizationResponse.fromJson(response_);
  }

  /// Adds or updates an AWS Config rule for evaluating whether your AWS
  /// resources comply with your desired configurations.
  ///
  /// You can use this action for custom AWS Config rules and AWS managed Config
  /// rules. A custom AWS Config rule is a rule that you develop and maintain.
  /// An AWS managed Config rule is a customizable, predefined rule that AWS
  /// Config provides.
  ///
  /// If you are adding a new custom AWS Config rule, you must first create the
  /// AWS Lambda function that the rule invokes to evaluate your resources. When
  /// you use the `PutConfigRule` action to add the rule to AWS Config, you must
  /// specify the Amazon Resource Name (ARN) that AWS Lambda assigns to the
  /// function. Specify the ARN for the `SourceIdentifier` key. This key is part
  /// of the `Source` object, which is part of the `ConfigRule` object.
  ///
  /// If you are adding an AWS managed Config rule, specify the rule's
  /// identifier for the `SourceIdentifier` key. To reference AWS managed Config
  /// rule identifiers, see
  /// [About AWS Managed Config Rules](https://docs.aws.amazon.com/config/latest/developerguide/evaluate-config_use-managed-rules.html).
  ///
  /// For any new rule that you add, specify the `ConfigRuleName` in the
  /// `ConfigRule` object. Do not specify the `ConfigRuleArn` or the
  /// `ConfigRuleId`. These values are generated by AWS Config for new rules.
  ///
  /// If you are updating a rule that you added previously, you can specify the
  /// rule by `ConfigRuleName`, `ConfigRuleId`, or `ConfigRuleArn` in the
  /// `ConfigRule` data type that you use in this request.
  ///
  /// The maximum number of rules that AWS Config supports is 150.
  ///
  /// For information about requesting a rule limit increase, see
  /// [AWS Config Limits](http://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html#limits_config)
  /// in the _AWS General Reference Guide_.
  ///
  /// For more information about developing and using AWS Config rules, see
  /// [Evaluating AWS Resource Configurations with AWS Config](https://docs.aws.amazon.com/config/latest/developerguide/evaluate-config.html)
  /// in the _AWS Config Developer Guide_.
  ///
  /// [configRule]: The rule that you want to add to your account.
  ///
  /// [tags]: An array of tag object.
  Future<void> putConfigRule(ConfigRule configRule, {List<Tag> tags}) async {
    await _client.send('PutConfigRule', {
      'ConfigRule': configRule,
      if (tags != null) 'Tags': tags,
    });
  }

  /// Creates and updates the configuration aggregator with the selected source
  /// accounts and regions. The source account can be individual account(s) or
  /// an organization.
  ///
  ///
  ///
  /// AWS Config should be enabled in source accounts and regions you want to
  /// aggregate.
  ///
  /// If your source type is an organization, you must be signed in to the
  /// master account and all features must be enabled in your organization. AWS
  /// Config calls `EnableAwsServiceAccess` API to enable integration between
  /// AWS Config and AWS Organizations.
  ///
  /// [configurationAggregatorName]: The name of the configuration aggregator.
  ///
  /// [accountAggregationSources]: A list of AccountAggregationSource object.
  ///
  /// [organizationAggregationSource]: An OrganizationAggregationSource object.
  ///
  /// [tags]: An array of tag object.
  Future<PutConfigurationAggregatorResponse> putConfigurationAggregator(
      String configurationAggregatorName,
      {List<AccountAggregationSource> accountAggregationSources,
      OrganizationAggregationSource organizationAggregationSource,
      List<Tag> tags}) async {
    var response_ = await _client.send('PutConfigurationAggregator', {
      'ConfigurationAggregatorName': configurationAggregatorName,
      if (accountAggregationSources != null)
        'AccountAggregationSources': accountAggregationSources,
      if (organizationAggregationSource != null)
        'OrganizationAggregationSource': organizationAggregationSource,
      if (tags != null) 'Tags': tags,
    });
    return PutConfigurationAggregatorResponse.fromJson(response_);
  }

  /// Creates a new configuration recorder to record the selected resource
  /// configurations.
  ///
  /// You can use this action to change the role `roleARN` or the
  /// `recordingGroup` of an existing recorder. To change the role, call the
  /// action on the existing configuration recorder and specify a role.
  ///
  ///
  ///
  /// Currently, you can specify only one configuration recorder per region in
  /// your account.
  ///
  /// If `ConfigurationRecorder` does not have the **recordingGroup** parameter
  /// specified, the default is to record all supported resource types.
  ///
  /// [configurationRecorder]: The configuration recorder object that records
  /// each configuration change made to the resources.
  Future<void> putConfigurationRecorder(
      ConfigurationRecorder configurationRecorder) async {
    await _client.send('PutConfigurationRecorder', {
      'ConfigurationRecorder': configurationRecorder,
    });
  }

  /// Creates a delivery channel object to deliver configuration information to
  /// an Amazon S3 bucket and Amazon SNS topic.
  ///
  /// Before you can create a delivery channel, you must create a configuration
  /// recorder.
  ///
  /// You can use this action to change the Amazon S3 bucket or an Amazon SNS
  /// topic of the existing delivery channel. To change the Amazon S3 bucket or
  /// an Amazon SNS topic, call this action and specify the changed values for
  /// the S3 bucket and the SNS topic. If you specify a different value for
  /// either the S3 bucket or the SNS topic, this action will keep the existing
  /// value for the parameter that is not changed.
  ///
  ///
  ///
  /// You can have only one delivery channel per region in your account.
  ///
  /// [deliveryChannel]: The configuration delivery channel object that delivers
  /// the configuration information to an Amazon S3 bucket and to an Amazon SNS
  /// topic.
  Future<void> putDeliveryChannel(DeliveryChannel deliveryChannel) async {
    await _client.send('PutDeliveryChannel', {
      'DeliveryChannel': deliveryChannel,
    });
  }

  /// Used by an AWS Lambda function to deliver evaluation results to AWS
  /// Config. This action is required in every AWS Lambda function that is
  /// invoked by an AWS Config rule.
  ///
  /// [evaluations]: The assessments that the AWS Lambda function performs. Each
  /// evaluation identifies an AWS resource and indicates whether it complies
  /// with the AWS Config rule that invokes the AWS Lambda function.
  ///
  /// [resultToken]: An encrypted token that associates an evaluation with an
  /// AWS Config rule. Identifies the rule and the event that triggered the
  /// evaluation.
  ///
  /// [testMode]: Use this parameter to specify a test run for `PutEvaluations`.
  /// You can verify whether your AWS Lambda function will deliver evaluation
  /// results to AWS Config. No updates occur to your existing evaluations, and
  /// evaluation results are not sent to AWS Config.
  ///
  ///
  ///
  /// When `TestMode` is `true`, `PutEvaluations` doesn't require a valid value
  /// for the `ResultToken` parameter, but the value cannot be null.
  Future<PutEvaluationsResponse> putEvaluations(String resultToken,
      {List<Evaluation> evaluations, bool testMode}) async {
    var response_ = await _client.send('PutEvaluations', {
      if (evaluations != null) 'Evaluations': evaluations,
      'ResultToken': resultToken,
      if (testMode != null) 'TestMode': testMode,
    });
    return PutEvaluationsResponse.fromJson(response_);
  }

  /// Adds or updates organization config rule for your entire organization
  /// evaluating whether your AWS resources comply with your desired
  /// configurations. Only a master account can create or update an organization
  /// config rule.
  ///
  /// This API enables organization service access through the
  /// `EnableAWSServiceAccess` action and creates a service linked role
  /// `AWSServiceRoleForConfigMultiAccountSetup` in the master account of your
  /// organization. The service linked role is created only when the role does
  /// not exist in the master account. AWS Config verifies the existence of role
  /// with `GetRole` action.
  ///
  /// You can use this action to create both custom AWS Config rules and AWS
  /// managed Config rules. If you are adding a new custom AWS Config rule, you
  /// must first create AWS Lambda function in the master account that the rule
  /// invokes to evaluate your resources. When you use the
  /// `PutOrganizationConfigRule` action to add the rule to AWS Config, you must
  /// specify the Amazon Resource Name (ARN) that AWS Lambda assigns to the
  /// function. If you are adding an AWS managed Config rule, specify the rule's
  /// identifier for the `RuleIdentifier` key.
  ///
  /// The maximum number of organization config rules that AWS Config supports
  /// is 150.
  ///
  ///
  ///
  /// Specify either `OrganizationCustomRuleMetadata` or
  /// `OrganizationManagedRuleMetadata`.
  ///
  /// [organizationConfigRuleName]: The name that you assign to an organization
  /// config rule.
  ///
  /// [organizationManagedRuleMetadata]: An `OrganizationManagedRuleMetadata`
  /// object.
  ///
  /// [organizationCustomRuleMetadata]: An `OrganizationCustomRuleMetadata`
  /// object.
  ///
  /// [excludedAccounts]: A comma-separated list of accounts that you want to
  /// exclude from an organization config rule.
  Future<PutOrganizationConfigRuleResponse> putOrganizationConfigRule(
      String organizationConfigRuleName,
      {OrganizationManagedRuleMetadata organizationManagedRuleMetadata,
      OrganizationCustomRuleMetadata organizationCustomRuleMetadata,
      List<String> excludedAccounts}) async {
    var response_ = await _client.send('PutOrganizationConfigRule', {
      'OrganizationConfigRuleName': organizationConfigRuleName,
      if (organizationManagedRuleMetadata != null)
        'OrganizationManagedRuleMetadata': organizationManagedRuleMetadata,
      if (organizationCustomRuleMetadata != null)
        'OrganizationCustomRuleMetadata': organizationCustomRuleMetadata,
      if (excludedAccounts != null) 'ExcludedAccounts': excludedAccounts,
    });
    return PutOrganizationConfigRuleResponse.fromJson(response_);
  }

  /// Adds or updates the remediation configuration with a specific AWS Config
  /// rule with the selected target or action. The API creates the
  /// `RemediationConfiguration` object for the AWS Config rule. The AWS Config
  /// rule must already exist for you to add a remediation configuration. The
  /// target (SSM document) must exist and have permissions to use the target.
  ///
  /// [remediationConfigurations]: A list of remediation configuration objects.
  Future<PutRemediationConfigurationsResponse> putRemediationConfigurations(
      List<RemediationConfiguration> remediationConfigurations) async {
    var response_ = await _client.send('PutRemediationConfigurations', {
      'RemediationConfigurations': remediationConfigurations,
    });
    return PutRemediationConfigurationsResponse.fromJson(response_);
  }

  /// A remediation exception is when a specific resource is no longer
  /// considered for auto-remediation. This API adds a new exception or updates
  /// an exisiting exception for a specific resource with a specific AWS Config
  /// rule.
  ///
  /// [configRuleName]: The name of the AWS Config rule for which you want to
  /// create remediation exception.
  ///
  /// [resourceKeys]: An exception list of resource exception keys to be
  /// processed with the current request. AWS Config adds exception for each
  /// resource key. For example, AWS Config adds 3 exceptions for 3 resource
  /// keys.
  ///
  /// [message]: The message contains an explanation of the exception.
  ///
  /// [expirationTime]: The exception is automatically deleted after the
  /// expiration date.
  Future<PutRemediationExceptionsResponse> putRemediationExceptions(
      {@required String configRuleName,
      @required List<RemediationExceptionResourceKey> resourceKeys,
      String message,
      DateTime expirationTime}) async {
    var response_ = await _client.send('PutRemediationExceptions', {
      'ConfigRuleName': configRuleName,
      'ResourceKeys': resourceKeys,
      if (message != null) 'Message': message,
      if (expirationTime != null) 'ExpirationTime': expirationTime,
    });
    return PutRemediationExceptionsResponse.fromJson(response_);
  }

  /// Creates and updates the retention configuration with details about
  /// retention period (number of days) that AWS Config stores your historical
  /// information. The API creates the `RetentionConfiguration` object and names
  /// the object as **default**. When you have a `RetentionConfiguration` object
  /// named **default**, calling the API modifies the default object.
  ///
  ///
  ///
  /// Currently, AWS Config supports only one retention configuration per region
  /// in your account.
  ///
  /// [retentionPeriodInDays]: Number of days AWS Config stores your historical
  /// information.
  ///
  ///
  ///
  /// Currently, only applicable to the configuration item history.
  Future<PutRetentionConfigurationResponse> putRetentionConfiguration(
      int retentionPeriodInDays) async {
    var response_ = await _client.send('PutRetentionConfiguration', {
      'RetentionPeriodInDays': retentionPeriodInDays,
    });
    return PutRetentionConfigurationResponse.fromJson(response_);
  }

  /// Accepts a structured query language (SQL) `SELECT` command, performs the
  /// corresponding search, and returns resource configurations matching the
  /// properties.
  ///
  /// For more information about query components, see the
  /// [**Query Components**](https://docs.aws.amazon.com/config/latest/developerguide/query-components.html)
  ///  section in the AWS Config Developer Guide.
  ///
  /// [expression]: The SQL query `SELECT` command.
  ///
  /// [limit]: The maximum number of query results returned on each page.
  ///
  /// [nextToken]: The `nextToken` string returned in a previous request that
  /// you use to request the next page of results in a paginated response.
  Future<SelectResourceConfigResponse> selectResourceConfig(String expression,
      {int limit, String nextToken}) async {
    var response_ = await _client.send('SelectResourceConfig', {
      'Expression': expression,
      if (limit != null) 'Limit': limit,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return SelectResourceConfigResponse.fromJson(response_);
  }

  /// Runs an on-demand evaluation for the specified AWS Config rules against
  /// the last known configuration state of the resources. Use
  /// `StartConfigRulesEvaluation` when you want to test that a rule you updated
  /// is working as expected. `StartConfigRulesEvaluation` does not re-record
  /// the latest configuration state for your resources. It re-runs an
  /// evaluation against the last known state of your resources.
  ///
  /// You can specify up to 25 AWS Config rules per request.
  ///
  /// An existing `StartConfigRulesEvaluation` call for the specified rules must
  /// complete before you can call the API again. If you chose to have AWS
  /// Config stream to an Amazon SNS topic, you will receive a
  /// `ConfigRuleEvaluationStarted` notification when the evaluation starts.
  ///
  ///  You don't need to call the `StartConfigRulesEvaluation` API to run an
  /// evaluation for a new rule. When you create a rule, AWS Config evaluates
  /// your resources against the rule automatically.
  ///
  /// The `StartConfigRulesEvaluation` API is useful if you want to run
  /// on-demand evaluations, such as the following example:
  ///
  /// 1.  You have a custom rule that evaluates your IAM resources every 24
  /// hours.
  ///
  /// 2.  You update your Lambda function to add additional conditions to your
  /// rule.
  ///
  /// 3.  Instead of waiting for the next periodic evaluation, you call the
  /// `StartConfigRulesEvaluation` API.
  ///
  /// 4.  AWS Config invokes your Lambda function and evaluates your IAM
  /// resources.
  ///
  /// 5.  Your custom rule will still run periodic evaluations every 24 hours.
  ///
  /// [configRuleNames]: The list of names of AWS Config rules that you want to
  /// run evaluations for.
  Future<StartConfigRulesEvaluationResponse> startConfigRulesEvaluation(
      {List<String> configRuleNames}) async {
    var response_ = await _client.send('StartConfigRulesEvaluation', {
      if (configRuleNames != null) 'ConfigRuleNames': configRuleNames,
    });
    return StartConfigRulesEvaluationResponse.fromJson(response_);
  }

  /// Starts recording configurations of the AWS resources you have selected to
  /// record in your AWS account.
  ///
  /// You must have created at least one delivery channel to successfully start
  /// the configuration recorder.
  ///
  /// [configurationRecorderName]: The name of the recorder object that records
  /// each configuration change made to the resources.
  Future<void> startConfigurationRecorder(
      String configurationRecorderName) async {
    await _client.send('StartConfigurationRecorder', {
      'ConfigurationRecorderName': configurationRecorderName,
    });
  }

  /// Runs an on-demand remediation for the specified AWS Config rules against
  /// the last known remediation configuration. It runs an execution against the
  /// current state of your resources. Remediation execution is asynchronous.
  ///
  /// You can specify up to 100 resource keys per request. An existing
  /// StartRemediationExecution call for the specified resource keys must
  /// complete before you can call the API again.
  ///
  /// [configRuleName]: The list of names of AWS Config rules that you want to
  /// run remediation execution for.
  ///
  /// [resourceKeys]: A list of resource keys to be processed with the current
  /// request. Each element in the list consists of the resource type and
  /// resource ID.
  Future<StartRemediationExecutionResponse> startRemediationExecution(
      {@required String configRuleName,
      @required List<ResourceKey> resourceKeys}) async {
    var response_ = await _client.send('StartRemediationExecution', {
      'ConfigRuleName': configRuleName,
      'ResourceKeys': resourceKeys,
    });
    return StartRemediationExecutionResponse.fromJson(response_);
  }

  /// Stops recording configurations of the AWS resources you have selected to
  /// record in your AWS account.
  ///
  /// [configurationRecorderName]: The name of the recorder object that records
  /// each configuration change made to the resources.
  Future<void> stopConfigurationRecorder(
      String configurationRecorderName) async {
    await _client.send('StopConfigurationRecorder', {
      'ConfigurationRecorderName': configurationRecorderName,
    });
  }

  /// Associates the specified tags to a resource with the specified
  /// resourceArn. If existing tags on a resource are not specified in the
  /// request parameters, they are not changed. When a resource is deleted, the
  /// tags associated with that resource are deleted as well.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) that identifies the resource
  /// for which to list the tags. Currently, the supported resources are
  /// `ConfigRule`, `ConfigurationAggregator` and `AggregatorAuthorization`.
  ///
  /// [tags]: An array of tag object.
  Future<void> tagResource(
      {@required String resourceArn, @required List<Tag> tags}) async {
    await _client.send('TagResource', {
      'ResourceArn': resourceArn,
      'Tags': tags,
    });
  }

  /// Deletes specified tags from a resource.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) that identifies the resource
  /// for which to list the tags. Currently, the supported resources are
  /// `ConfigRule`, `ConfigurationAggregator` and `AggregatorAuthorization`.
  ///
  /// [tagKeys]: The keys of the tags to be removed.
  Future<void> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {
    await _client.send('UntagResource', {
      'ResourceArn': resourceArn,
      'TagKeys': tagKeys,
    });
  }
}

/// A collection of accounts and regions.
class AccountAggregationSource {
  /// The 12-digit account ID of the account being aggregated.
  final List<String> accountIds;

  /// If true, aggregate existing AWS Config regions and future regions.
  final bool allAwsRegions;

  /// The source regions being aggregated.
  final List<String> awsRegions;

  AccountAggregationSource({
    @required this.accountIds,
    this.allAwsRegions,
    this.awsRegions,
  });
  static AccountAggregationSource fromJson(Map<String, dynamic> json) =>
      AccountAggregationSource(
        accountIds:
            (json['AccountIds'] as List).map((e) => e as String).toList(),
        allAwsRegions: json.containsKey('AllAwsRegions')
            ? json['AllAwsRegions'] as bool
            : null,
        awsRegions: json.containsKey('AwsRegions')
            ? (json['AwsRegions'] as List).map((e) => e as String).toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Indicates whether an AWS Config rule is compliant based on account ID,
/// region, compliance, and rule name.
///
/// A rule is compliant if all of the resources that the rule evaluated comply
/// with it. It is noncompliant if any of these resources do not comply.
class AggregateComplianceByConfigRule {
  /// The name of the AWS Config rule.
  final String configRuleName;

  /// Indicates whether an AWS resource or AWS Config rule is compliant and
  /// provides the number of contributors that affect the compliance.
  final Compliance compliance;

  /// The 12-digit account ID of the source account.
  final String accountId;

  /// The source region from where the data is aggregated.
  final String awsRegion;

  AggregateComplianceByConfigRule({
    this.configRuleName,
    this.compliance,
    this.accountId,
    this.awsRegion,
  });
  static AggregateComplianceByConfigRule fromJson(Map<String, dynamic> json) =>
      AggregateComplianceByConfigRule(
        configRuleName: json.containsKey('ConfigRuleName')
            ? json['ConfigRuleName'] as String
            : null,
        compliance: json.containsKey('Compliance')
            ? Compliance.fromJson(json['Compliance'])
            : null,
        accountId:
            json.containsKey('AccountId') ? json['AccountId'] as String : null,
        awsRegion:
            json.containsKey('AwsRegion') ? json['AwsRegion'] as String : null,
      );
}

/// Returns the number of compliant and noncompliant rules for one or more
/// accounts and regions in an aggregator.
class AggregateComplianceCount {
  /// The 12-digit account ID or region based on the GroupByKey value.
  final String groupName;

  /// The number of compliant and noncompliant AWS Config rules.
  final ComplianceSummary complianceSummary;

  AggregateComplianceCount({
    this.groupName,
    this.complianceSummary,
  });
  static AggregateComplianceCount fromJson(Map<String, dynamic> json) =>
      AggregateComplianceCount(
        groupName:
            json.containsKey('GroupName') ? json['GroupName'] as String : null,
        complianceSummary: json.containsKey('ComplianceSummary')
            ? ComplianceSummary.fromJson(json['ComplianceSummary'])
            : null,
      );
}

/// The details of an AWS Config evaluation for an account ID and region in an
/// aggregator. Provides the AWS resource that was evaluated, the compliance of
/// the resource, related time stamps, and supplementary information.
class AggregateEvaluationResult {
  /// Uniquely identifies the evaluation result.
  final EvaluationResultIdentifier evaluationResultIdentifier;

  /// The resource compliance status.
  ///
  /// For the `AggregationEvaluationResult` data type, AWS Config supports only
  /// the `COMPLIANT` and `NON_COMPLIANT`. AWS Config does not support the
  /// `NOT_APPLICABLE` and `INSUFFICIENT_DATA` value.
  final String complianceType;

  /// The time when AWS Config recorded the aggregate evaluation result.
  final DateTime resultRecordedTime;

  /// The time when the AWS Config rule evaluated the AWS resource.
  final DateTime configRuleInvokedTime;

  /// Supplementary information about how the agrregate evaluation determined
  /// the compliance.
  final String annotation;

  /// The 12-digit account ID of the source account.
  final String accountId;

  /// The source region from where the data is aggregated.
  final String awsRegion;

  AggregateEvaluationResult({
    this.evaluationResultIdentifier,
    this.complianceType,
    this.resultRecordedTime,
    this.configRuleInvokedTime,
    this.annotation,
    this.accountId,
    this.awsRegion,
  });
  static AggregateEvaluationResult fromJson(Map<String, dynamic> json) =>
      AggregateEvaluationResult(
        evaluationResultIdentifier:
            json.containsKey('EvaluationResultIdentifier')
                ? EvaluationResultIdentifier.fromJson(
                    json['EvaluationResultIdentifier'])
                : null,
        complianceType: json.containsKey('ComplianceType')
            ? json['ComplianceType'] as String
            : null,
        resultRecordedTime: json.containsKey('ResultRecordedTime')
            ? DateTime.parse(json['ResultRecordedTime'])
            : null,
        configRuleInvokedTime: json.containsKey('ConfigRuleInvokedTime')
            ? DateTime.parse(json['ConfigRuleInvokedTime'])
            : null,
        annotation: json.containsKey('Annotation')
            ? json['Annotation'] as String
            : null,
        accountId:
            json.containsKey('AccountId') ? json['AccountId'] as String : null,
        awsRegion:
            json.containsKey('AwsRegion') ? json['AwsRegion'] as String : null,
      );
}

/// The details that identify a resource that is collected by AWS Config
/// aggregator, including the resource type, ID, (if available) the custom
/// resource name, the source account, and source region.
class AggregateResourceIdentifier {
  /// The 12-digit account ID of the source account.
  final String sourceAccountId;

  /// The source region where data is aggregated.
  final String sourceRegion;

  /// The ID of the AWS resource.
  final String resourceId;

  /// The type of the AWS resource.
  final String resourceType;

  /// The name of the AWS resource.
  final String resourceName;

  AggregateResourceIdentifier({
    @required this.sourceAccountId,
    @required this.sourceRegion,
    @required this.resourceId,
    @required this.resourceType,
    this.resourceName,
  });
  static AggregateResourceIdentifier fromJson(Map<String, dynamic> json) =>
      AggregateResourceIdentifier(
        sourceAccountId: json['SourceAccountId'] as String,
        sourceRegion: json['SourceRegion'] as String,
        resourceId: json['ResourceId'] as String,
        resourceType: json['ResourceType'] as String,
        resourceName: json.containsKey('ResourceName')
            ? json['ResourceName'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The current sync status between the source and the aggregator account.
class AggregatedSourceStatus {
  /// The source account ID or an organization.
  final String sourceId;

  /// The source account or an organization.
  final String sourceType;

  /// The region authorized to collect aggregated data.
  final String awsRegion;

  /// Filters the last updated status type.
  ///
  /// *   Valid value FAILED indicates errors while moving data.
  ///
  /// *   Valid value SUCCEEDED indicates the data was successfully moved.
  ///
  /// *   Valid value OUTDATED indicates the data is not the most recent.
  final String lastUpdateStatus;

  /// The time of the last update.
  final DateTime lastUpdateTime;

  /// The error code that AWS Config returned when the source account
  /// aggregation last failed.
  final String lastErrorCode;

  /// The message indicating that the source account aggregation failed due to
  /// an error.
  final String lastErrorMessage;

  AggregatedSourceStatus({
    this.sourceId,
    this.sourceType,
    this.awsRegion,
    this.lastUpdateStatus,
    this.lastUpdateTime,
    this.lastErrorCode,
    this.lastErrorMessage,
  });
  static AggregatedSourceStatus fromJson(Map<String, dynamic> json) =>
      AggregatedSourceStatus(
        sourceId:
            json.containsKey('SourceId') ? json['SourceId'] as String : null,
        sourceType: json.containsKey('SourceType')
            ? json['SourceType'] as String
            : null,
        awsRegion:
            json.containsKey('AwsRegion') ? json['AwsRegion'] as String : null,
        lastUpdateStatus: json.containsKey('LastUpdateStatus')
            ? json['LastUpdateStatus'] as String
            : null,
        lastUpdateTime: json.containsKey('LastUpdateTime')
            ? DateTime.parse(json['LastUpdateTime'])
            : null,
        lastErrorCode: json.containsKey('LastErrorCode')
            ? json['LastErrorCode'] as String
            : null,
        lastErrorMessage: json.containsKey('LastErrorMessage')
            ? json['LastErrorMessage'] as String
            : null,
      );
}

/// An object that represents the authorizations granted to aggregator accounts
/// and regions.
class AggregationAuthorization {
  /// The Amazon Resource Name (ARN) of the aggregation object.
  final String aggregationAuthorizationArn;

  /// The 12-digit account ID of the account authorized to aggregate data.
  final String authorizedAccountId;

  /// The region authorized to collect aggregated data.
  final String authorizedAwsRegion;

  /// The time stamp when the aggregation authorization was created.
  final DateTime creationTime;

  AggregationAuthorization({
    this.aggregationAuthorizationArn,
    this.authorizedAccountId,
    this.authorizedAwsRegion,
    this.creationTime,
  });
  static AggregationAuthorization fromJson(Map<String, dynamic> json) =>
      AggregationAuthorization(
        aggregationAuthorizationArn:
            json.containsKey('AggregationAuthorizationArn')
                ? json['AggregationAuthorizationArn'] as String
                : null,
        authorizedAccountId: json.containsKey('AuthorizedAccountId')
            ? json['AuthorizedAccountId'] as String
            : null,
        authorizedAwsRegion: json.containsKey('AuthorizedAwsRegion')
            ? json['AuthorizedAwsRegion'] as String
            : null,
        creationTime: json.containsKey('CreationTime')
            ? DateTime.parse(json['CreationTime'])
            : null,
      );
}

/// The detailed configuration of a specified resource.
class BaseConfigurationItem {
  /// The version number of the resource configuration.
  final String version;

  /// The 12-digit AWS account ID associated with the resource.
  final String accountId;

  /// The time when the configuration recording was initiated.
  final DateTime configurationItemCaptureTime;

  /// The configuration item status.
  final String configurationItemStatus;

  /// An identifier that indicates the ordering of the configuration items of a
  /// resource.
  final String configurationStateId;

  /// The Amazon Resource Name (ARN) of the resource.
  final String arn;

  /// The type of AWS resource.
  final String resourceType;

  /// The ID of the resource (for example., sg-xxxxxx).
  final String resourceId;

  /// The custom name of the resource, if available.
  final String resourceName;

  /// The region where the resource resides.
  final String awsRegion;

  /// The Availability Zone associated with the resource.
  final String availabilityZone;

  /// The time stamp when the resource was created.
  final DateTime resourceCreationTime;

  /// The description of the resource configuration.
  final String configuration;

  /// Configuration attributes that AWS Config returns for certain resource
  /// types to supplement the information returned for the configuration
  /// parameter.
  final Map<String, String> supplementaryConfiguration;

  BaseConfigurationItem({
    this.version,
    this.accountId,
    this.configurationItemCaptureTime,
    this.configurationItemStatus,
    this.configurationStateId,
    this.arn,
    this.resourceType,
    this.resourceId,
    this.resourceName,
    this.awsRegion,
    this.availabilityZone,
    this.resourceCreationTime,
    this.configuration,
    this.supplementaryConfiguration,
  });
  static BaseConfigurationItem fromJson(Map<String, dynamic> json) =>
      BaseConfigurationItem(
        version: json.containsKey('version') ? json['version'] as String : null,
        accountId:
            json.containsKey('accountId') ? json['accountId'] as String : null,
        configurationItemCaptureTime:
            json.containsKey('configurationItemCaptureTime')
                ? DateTime.parse(json['configurationItemCaptureTime'])
                : null,
        configurationItemStatus: json.containsKey('configurationItemStatus')
            ? json['configurationItemStatus'] as String
            : null,
        configurationStateId: json.containsKey('configurationStateId')
            ? json['configurationStateId'] as String
            : null,
        arn: json.containsKey('arn') ? json['arn'] as String : null,
        resourceType: json.containsKey('resourceType')
            ? json['resourceType'] as String
            : null,
        resourceId: json.containsKey('resourceId')
            ? json['resourceId'] as String
            : null,
        resourceName: json.containsKey('resourceName')
            ? json['resourceName'] as String
            : null,
        awsRegion:
            json.containsKey('awsRegion') ? json['awsRegion'] as String : null,
        availabilityZone: json.containsKey('availabilityZone')
            ? json['availabilityZone'] as String
            : null,
        resourceCreationTime: json.containsKey('resourceCreationTime')
            ? DateTime.parse(json['resourceCreationTime'])
            : null,
        configuration: json.containsKey('configuration')
            ? json['configuration'] as String
            : null,
        supplementaryConfiguration:
            json.containsKey('supplementaryConfiguration')
                ? (json['supplementaryConfiguration'] as Map)
                    .map((k, v) => MapEntry(k as String, v as String))
                : null,
      );
}

class BatchGetAggregateResourceConfigResponse {
  /// A list that contains the current configuration of one or more resources.
  final List<BaseConfigurationItem> baseConfigurationItems;

  /// A list of resource identifiers that were not processed with current scope.
  /// The list is empty if all the resources are processed.
  final List<AggregateResourceIdentifier> unprocessedResourceIdentifiers;

  BatchGetAggregateResourceConfigResponse({
    this.baseConfigurationItems,
    this.unprocessedResourceIdentifiers,
  });
  static BatchGetAggregateResourceConfigResponse fromJson(
          Map<String, dynamic> json) =>
      BatchGetAggregateResourceConfigResponse(
        baseConfigurationItems: json.containsKey('BaseConfigurationItems')
            ? (json['BaseConfigurationItems'] as List)
                .map((e) => BaseConfigurationItem.fromJson(e))
                .toList()
            : null,
        unprocessedResourceIdentifiers:
            json.containsKey('UnprocessedResourceIdentifiers')
                ? (json['UnprocessedResourceIdentifiers'] as List)
                    .map((e) => AggregateResourceIdentifier.fromJson(e))
                    .toList()
                : null,
      );
}

class BatchGetResourceConfigResponse {
  /// A list that contains the current configuration of one or more resources.
  final List<BaseConfigurationItem> baseConfigurationItems;

  /// A list of resource keys that were not processed with the current response.
  /// The unprocessesResourceKeys value is in the same form as ResourceKeys, so
  /// the value can be directly provided to a subsequent BatchGetResourceConfig
  /// operation. If there are no unprocessed resource keys, the response
  /// contains an empty unprocessedResourceKeys list.
  final List<ResourceKey> unprocessedResourceKeys;

  BatchGetResourceConfigResponse({
    this.baseConfigurationItems,
    this.unprocessedResourceKeys,
  });
  static BatchGetResourceConfigResponse fromJson(Map<String, dynamic> json) =>
      BatchGetResourceConfigResponse(
        baseConfigurationItems: json.containsKey('baseConfigurationItems')
            ? (json['baseConfigurationItems'] as List)
                .map((e) => BaseConfigurationItem.fromJson(e))
                .toList()
            : null,
        unprocessedResourceKeys: json.containsKey('unprocessedResourceKeys')
            ? (json['unprocessedResourceKeys'] as List)
                .map((e) => ResourceKey.fromJson(e))
                .toList()
            : null,
      );
}

/// Indicates whether an AWS resource or AWS Config rule is compliant and
/// provides the number of contributors that affect the compliance.
class Compliance {
  /// Indicates whether an AWS resource or AWS Config rule is compliant.
  ///
  /// A resource is compliant if it complies with all of the AWS Config rules
  /// that evaluate it. A resource is noncompliant if it does not comply with
  /// one or more of these rules.
  ///
  /// A rule is compliant if all of the resources that the rule evaluates comply
  /// with it. A rule is noncompliant if any of these resources do not comply.
  ///
  /// AWS Config returns the `INSUFFICIENT_DATA` value when no evaluation
  /// results are available for the AWS resource or AWS Config rule.
  ///
  /// For the `Compliance` data type, AWS Config supports only `COMPLIANT`,
  /// `NON_COMPLIANT`, and `INSUFFICIENT_DATA` values. AWS Config does not
  /// support the `NOT_APPLICABLE` value for the `Compliance` data type.
  final String complianceType;

  /// The number of AWS resources or AWS Config rules that cause a result of
  /// `NON_COMPLIANT`, up to a maximum number.
  final ComplianceContributorCount complianceContributorCount;

  Compliance({
    this.complianceType,
    this.complianceContributorCount,
  });
  static Compliance fromJson(Map<String, dynamic> json) => Compliance(
        complianceType: json.containsKey('ComplianceType')
            ? json['ComplianceType'] as String
            : null,
        complianceContributorCount:
            json.containsKey('ComplianceContributorCount')
                ? ComplianceContributorCount.fromJson(
                    json['ComplianceContributorCount'])
                : null,
      );
}

/// Indicates whether an AWS Config rule is compliant. A rule is compliant if
/// all of the resources that the rule evaluated comply with it. A rule is
/// noncompliant if any of these resources do not comply.
class ComplianceByConfigRule {
  /// The name of the AWS Config rule.
  final String configRuleName;

  /// Indicates whether the AWS Config rule is compliant.
  final Compliance compliance;

  ComplianceByConfigRule({
    this.configRuleName,
    this.compliance,
  });
  static ComplianceByConfigRule fromJson(Map<String, dynamic> json) =>
      ComplianceByConfigRule(
        configRuleName: json.containsKey('ConfigRuleName')
            ? json['ConfigRuleName'] as String
            : null,
        compliance: json.containsKey('Compliance')
            ? Compliance.fromJson(json['Compliance'])
            : null,
      );
}

/// Indicates whether an AWS resource that is evaluated according to one or more
/// AWS Config rules is compliant. A resource is compliant if it complies with
/// all of the rules that evaluate it. A resource is noncompliant if it does not
/// comply with one or more of these rules.
class ComplianceByResource {
  /// The type of the AWS resource that was evaluated.
  final String resourceType;

  /// The ID of the AWS resource that was evaluated.
  final String resourceId;

  /// Indicates whether the AWS resource complies with all of the AWS Config
  /// rules that evaluated it.
  final Compliance compliance;

  ComplianceByResource({
    this.resourceType,
    this.resourceId,
    this.compliance,
  });
  static ComplianceByResource fromJson(Map<String, dynamic> json) =>
      ComplianceByResource(
        resourceType: json.containsKey('ResourceType')
            ? json['ResourceType'] as String
            : null,
        resourceId: json.containsKey('ResourceId')
            ? json['ResourceId'] as String
            : null,
        compliance: json.containsKey('Compliance')
            ? Compliance.fromJson(json['Compliance'])
            : null,
      );
}

/// The number of AWS resources or AWS Config rules responsible for the current
/// compliance of the item, up to a maximum number.
class ComplianceContributorCount {
  /// The number of AWS resources or AWS Config rules responsible for the
  /// current compliance of the item.
  final int cappedCount;

  /// Indicates whether the maximum count is reached.
  final bool capExceeded;

  ComplianceContributorCount({
    this.cappedCount,
    this.capExceeded,
  });
  static ComplianceContributorCount fromJson(Map<String, dynamic> json) =>
      ComplianceContributorCount(
        cappedCount:
            json.containsKey('CappedCount') ? json['CappedCount'] as int : null,
        capExceeded: json.containsKey('CapExceeded')
            ? json['CapExceeded'] as bool
            : null,
      );
}

/// The number of AWS Config rules or AWS resources that are compliant and
/// noncompliant.
class ComplianceSummary {
  /// The number of AWS Config rules or AWS resources that are compliant, up to
  /// a maximum of 25 for rules and 100 for resources.
  final ComplianceContributorCount compliantResourceCount;

  /// The number of AWS Config rules or AWS resources that are noncompliant, up
  /// to a maximum of 25 for rules and 100 for resources.
  final ComplianceContributorCount nonCompliantResourceCount;

  /// The time that AWS Config created the compliance summary.
  final DateTime complianceSummaryTimestamp;

  ComplianceSummary({
    this.compliantResourceCount,
    this.nonCompliantResourceCount,
    this.complianceSummaryTimestamp,
  });
  static ComplianceSummary fromJson(Map<String, dynamic> json) =>
      ComplianceSummary(
        compliantResourceCount: json.containsKey('CompliantResourceCount')
            ? ComplianceContributorCount.fromJson(
                json['CompliantResourceCount'])
            : null,
        nonCompliantResourceCount: json.containsKey('NonCompliantResourceCount')
            ? ComplianceContributorCount.fromJson(
                json['NonCompliantResourceCount'])
            : null,
        complianceSummaryTimestamp:
            json.containsKey('ComplianceSummaryTimestamp')
                ? DateTime.parse(json['ComplianceSummaryTimestamp'])
                : null,
      );
}

/// The number of AWS resources of a specific type that are compliant or
/// noncompliant, up to a maximum of 100 for each.
class ComplianceSummaryByResourceType {
  /// The type of AWS resource.
  final String resourceType;

  /// The number of AWS resources that are compliant or noncompliant, up to a
  /// maximum of 100 for each.
  final ComplianceSummary complianceSummary;

  ComplianceSummaryByResourceType({
    this.resourceType,
    this.complianceSummary,
  });
  static ComplianceSummaryByResourceType fromJson(Map<String, dynamic> json) =>
      ComplianceSummaryByResourceType(
        resourceType: json.containsKey('ResourceType')
            ? json['ResourceType'] as String
            : null,
        complianceSummary: json.containsKey('ComplianceSummary')
            ? ComplianceSummary.fromJson(json['ComplianceSummary'])
            : null,
      );
}

/// Provides status of the delivery of the snapshot or the configuration history
/// to the specified Amazon S3 bucket. Also provides the status of notifications
/// about the Amazon S3 delivery to the specified Amazon SNS topic.
class ConfigExportDeliveryInfo {
  /// Status of the last attempted delivery.
  final String lastStatus;

  /// The error code from the last attempted delivery.
  final String lastErrorCode;

  /// The error message from the last attempted delivery.
  final String lastErrorMessage;

  /// The time of the last attempted delivery.
  final DateTime lastAttemptTime;

  /// The time of the last successful delivery.
  final DateTime lastSuccessfulTime;

  /// The time that the next delivery occurs.
  final DateTime nextDeliveryTime;

  ConfigExportDeliveryInfo({
    this.lastStatus,
    this.lastErrorCode,
    this.lastErrorMessage,
    this.lastAttemptTime,
    this.lastSuccessfulTime,
    this.nextDeliveryTime,
  });
  static ConfigExportDeliveryInfo fromJson(Map<String, dynamic> json) =>
      ConfigExportDeliveryInfo(
        lastStatus: json.containsKey('lastStatus')
            ? json['lastStatus'] as String
            : null,
        lastErrorCode: json.containsKey('lastErrorCode')
            ? json['lastErrorCode'] as String
            : null,
        lastErrorMessage: json.containsKey('lastErrorMessage')
            ? json['lastErrorMessage'] as String
            : null,
        lastAttemptTime: json.containsKey('lastAttemptTime')
            ? DateTime.parse(json['lastAttemptTime'])
            : null,
        lastSuccessfulTime: json.containsKey('lastSuccessfulTime')
            ? DateTime.parse(json['lastSuccessfulTime'])
            : null,
        nextDeliveryTime: json.containsKey('nextDeliveryTime')
            ? DateTime.parse(json['nextDeliveryTime'])
            : null,
      );
}

/// An AWS Config rule represents an AWS Lambda function that you create for a
/// custom rule or a predefined function for an AWS managed rule. The function
/// evaluates configuration items to assess whether your AWS resources comply
/// with your desired configurations. This function can run when AWS Config
/// detects a configuration change to an AWS resource and at a periodic
/// frequency that you choose (for example, every 24 hours).
///
///  You can use the AWS CLI and AWS SDKs if you want to create a rule that
/// triggers evaluations for your resources when AWS Config delivers the
/// configuration snapshot. For more information, see
/// ConfigSnapshotDeliveryProperties.
///
/// For more information about developing and using AWS Config rules, see
/// [Evaluating AWS Resource Configurations with AWS Config](https://docs.aws.amazon.com/config/latest/developerguide/evaluate-config.html)
/// in the _AWS Config Developer Guide_.
class ConfigRule {
  /// The name that you assign to the AWS Config rule. The name is required if
  /// you are adding a new rule.
  final String configRuleName;

  /// The Amazon Resource Name (ARN) of the AWS Config rule.
  final String configRuleArn;

  /// The ID of the AWS Config rule.
  final String configRuleId;

  /// The description that you provide for the AWS Config rule.
  final String description;

  /// Defines which resources can trigger an evaluation for the rule. The scope
  /// can include one or more resource types, a combination of one resource type
  /// and one resource ID, or a combination of a tag key and value. Specify a
  /// scope to constrain the resources that can trigger an evaluation for the
  /// rule. If you do not specify a scope, evaluations are triggered when any
  /// resource in the recording group changes.
  final Scope scope;

  /// Provides the rule owner (AWS or customer), the rule identifier, and the
  /// notifications that cause the function to evaluate your AWS resources.
  final Source source;

  /// A string, in JSON format, that is passed to the AWS Config rule Lambda
  /// function.
  final String inputParameters;

  /// The maximum frequency with which AWS Config runs evaluations for a rule.
  /// You can specify a value for `MaximumExecutionFrequency` when:
  ///
  /// *   You are using an AWS managed rule that is triggered at a periodic
  /// frequency.
  ///
  /// *   Your custom rule is triggered when AWS Config delivers the
  /// configuration snapshot. For more information, see
  /// ConfigSnapshotDeliveryProperties.
  ///
  ///
  ///
  ///
  /// By default, rules with a periodic trigger are evaluated every 24 hours. To
  /// change the frequency, specify a valid value for the
  /// `MaximumExecutionFrequency` parameter.
  final String maximumExecutionFrequency;

  /// Indicates whether the AWS Config rule is active or is currently being
  /// deleted by AWS Config. It can also indicate the evaluation status for the
  /// AWS Config rule.
  ///
  /// AWS Config sets the state of the rule to `EVALUATING` temporarily after
  /// you use the `StartConfigRulesEvaluation` request to evaluate your
  /// resources against the AWS Config rule.
  ///
  /// AWS Config sets the state of the rule to `DELETING_RESULTS` temporarily
  /// after you use the `DeleteEvaluationResults` request to delete the current
  /// evaluation results for the AWS Config rule.
  ///
  /// AWS Config temporarily sets the state of a rule to `DELETING` after you
  /// use the `DeleteConfigRule` request to delete the rule. After AWS Config
  /// deletes the rule, the rule and all of its evaluations are erased and are
  /// no longer available.
  final String configRuleState;

  /// Service principal name of the service that created the rule.
  ///
  ///
  ///
  /// The field is populated only if the service linked rule is created by a
  /// service. The field is empty if you create your own rule.
  final String createdBy;

  ConfigRule({
    this.configRuleName,
    this.configRuleArn,
    this.configRuleId,
    this.description,
    this.scope,
    @required this.source,
    this.inputParameters,
    this.maximumExecutionFrequency,
    this.configRuleState,
    this.createdBy,
  });
  static ConfigRule fromJson(Map<String, dynamic> json) => ConfigRule(
        configRuleName: json.containsKey('ConfigRuleName')
            ? json['ConfigRuleName'] as String
            : null,
        configRuleArn: json.containsKey('ConfigRuleArn')
            ? json['ConfigRuleArn'] as String
            : null,
        configRuleId: json.containsKey('ConfigRuleId')
            ? json['ConfigRuleId'] as String
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        scope: json.containsKey('Scope') ? Scope.fromJson(json['Scope']) : null,
        source: Source.fromJson(json['Source']),
        inputParameters: json.containsKey('InputParameters')
            ? json['InputParameters'] as String
            : null,
        maximumExecutionFrequency: json.containsKey('MaximumExecutionFrequency')
            ? json['MaximumExecutionFrequency'] as String
            : null,
        configRuleState: json.containsKey('ConfigRuleState')
            ? json['ConfigRuleState'] as String
            : null,
        createdBy:
            json.containsKey('CreatedBy') ? json['CreatedBy'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Filters the compliance results based on account ID, region, compliance type,
/// and rule name.
class ConfigRuleComplianceFilters {
  /// The name of the AWS Config rule.
  final String configRuleName;

  /// The rule compliance status.
  ///
  /// For the `ConfigRuleComplianceFilters` data type, AWS Config supports only
  /// `COMPLIANT` and `NON_COMPLIANT`. AWS Config does not support the
  /// `NOT_APPLICABLE` and the `INSUFFICIENT_DATA` values.
  final String complianceType;

  /// The 12-digit account ID of the source account.
  final String accountId;

  /// The source region where the data is aggregated.
  final String awsRegion;

  ConfigRuleComplianceFilters({
    this.configRuleName,
    this.complianceType,
    this.accountId,
    this.awsRegion,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Filters the results based on the account IDs and regions.
class ConfigRuleComplianceSummaryFilters {
  /// The 12-digit account ID of the source account.
  final String accountId;

  /// The source region where the data is aggregated.
  final String awsRegion;

  ConfigRuleComplianceSummaryFilters({
    this.accountId,
    this.awsRegion,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Status information for your AWS managed Config rules. The status includes
/// information such as the last time the rule ran, the last time it failed, and
/// the related error for the last failure.
///
/// This action does not return status information about custom AWS Config
/// rules.
class ConfigRuleEvaluationStatus {
  /// The name of the AWS Config rule.
  final String configRuleName;

  /// The Amazon Resource Name (ARN) of the AWS Config rule.
  final String configRuleArn;

  /// The ID of the AWS Config rule.
  final String configRuleId;

  /// The time that AWS Config last successfully invoked the AWS Config rule to
  /// evaluate your AWS resources.
  final DateTime lastSuccessfulInvocationTime;

  /// The time that AWS Config last failed to invoke the AWS Config rule to
  /// evaluate your AWS resources.
  final DateTime lastFailedInvocationTime;

  /// The time that AWS Config last successfully evaluated your AWS resources
  /// against the rule.
  final DateTime lastSuccessfulEvaluationTime;

  /// The time that AWS Config last failed to evaluate your AWS resources
  /// against the rule.
  final DateTime lastFailedEvaluationTime;

  /// The time that you first activated the AWS Config rule.
  final DateTime firstActivatedTime;

  /// The error code that AWS Config returned when the rule last failed.
  final String lastErrorCode;

  /// The error message that AWS Config returned when the rule last failed.
  final String lastErrorMessage;

  /// Indicates whether AWS Config has evaluated your resources against the rule
  /// at least once.
  ///
  /// *    `true` - AWS Config has evaluated your AWS resources against the rule
  /// at least once.
  ///
  /// *    `false` - AWS Config has not once finished evaluating your AWS
  /// resources against the rule.
  final bool firstEvaluationStarted;

  ConfigRuleEvaluationStatus({
    this.configRuleName,
    this.configRuleArn,
    this.configRuleId,
    this.lastSuccessfulInvocationTime,
    this.lastFailedInvocationTime,
    this.lastSuccessfulEvaluationTime,
    this.lastFailedEvaluationTime,
    this.firstActivatedTime,
    this.lastErrorCode,
    this.lastErrorMessage,
    this.firstEvaluationStarted,
  });
  static ConfigRuleEvaluationStatus fromJson(Map<String, dynamic> json) =>
      ConfigRuleEvaluationStatus(
        configRuleName: json.containsKey('ConfigRuleName')
            ? json['ConfigRuleName'] as String
            : null,
        configRuleArn: json.containsKey('ConfigRuleArn')
            ? json['ConfigRuleArn'] as String
            : null,
        configRuleId: json.containsKey('ConfigRuleId')
            ? json['ConfigRuleId'] as String
            : null,
        lastSuccessfulInvocationTime:
            json.containsKey('LastSuccessfulInvocationTime')
                ? DateTime.parse(json['LastSuccessfulInvocationTime'])
                : null,
        lastFailedInvocationTime: json.containsKey('LastFailedInvocationTime')
            ? DateTime.parse(json['LastFailedInvocationTime'])
            : null,
        lastSuccessfulEvaluationTime:
            json.containsKey('LastSuccessfulEvaluationTime')
                ? DateTime.parse(json['LastSuccessfulEvaluationTime'])
                : null,
        lastFailedEvaluationTime: json.containsKey('LastFailedEvaluationTime')
            ? DateTime.parse(json['LastFailedEvaluationTime'])
            : null,
        firstActivatedTime: json.containsKey('FirstActivatedTime')
            ? DateTime.parse(json['FirstActivatedTime'])
            : null,
        lastErrorCode: json.containsKey('LastErrorCode')
            ? json['LastErrorCode'] as String
            : null,
        lastErrorMessage: json.containsKey('LastErrorMessage')
            ? json['LastErrorMessage'] as String
            : null,
        firstEvaluationStarted: json.containsKey('FirstEvaluationStarted')
            ? json['FirstEvaluationStarted'] as bool
            : null,
      );
}

/// Provides options for how often AWS Config delivers configuration snapshots
/// to the Amazon S3 bucket in your delivery channel.
///
/// The frequency for a rule that triggers evaluations for your resources when
/// AWS Config delivers the configuration snapshot is set by one of two values,
/// depending on which is less frequent:
///
/// *   The value for the `deliveryFrequency` parameter within the delivery
/// channel configuration, which sets how often AWS Config delivers
/// configuration snapshots. This value also sets how often AWS Config invokes
/// evaluations for AWS Config rules.
///
/// *   The value for the `MaximumExecutionFrequency` parameter, which sets the
/// maximum frequency with which AWS Config invokes evaluations for the rule.
/// For more information, see ConfigRule.
///
///
/// If the `deliveryFrequency` value is less frequent than the
/// `MaximumExecutionFrequency` value for a rule, AWS Config invokes the rule
/// only as often as the `deliveryFrequency` value.
///
/// 1.  For example, you want your rule to run evaluations when AWS Config
/// delivers the configuration snapshot.
///
/// 2.  You specify the `MaximumExecutionFrequency` value for `Six_Hours`.
///
/// 3.  You then specify the delivery channel `deliveryFrequency` value for
/// `TwentyFour_Hours`.
///
/// 4.  Because the value for `deliveryFrequency` is less frequent than
/// `MaximumExecutionFrequency`, AWS Config invokes evaluations for the rule
/// every 24 hours.
///
///
/// You should set the `MaximumExecutionFrequency` value to be at least as
/// frequent as the `deliveryFrequency` value. You can view the
/// `deliveryFrequency` value by using the `DescribeDeliveryChannnels` action.
///
/// To update the `deliveryFrequency` with which AWS Config delivers your
/// configuration snapshots, use the `PutDeliveryChannel` action.
class ConfigSnapshotDeliveryProperties {
  /// The frequency with which AWS Config delivers configuration snapshots.
  final String deliveryFrequency;

  ConfigSnapshotDeliveryProperties({
    this.deliveryFrequency,
  });
  static ConfigSnapshotDeliveryProperties fromJson(Map<String, dynamic> json) =>
      ConfigSnapshotDeliveryProperties(
        deliveryFrequency: json.containsKey('deliveryFrequency')
            ? json['deliveryFrequency'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A list that contains the status of the delivery of the configuration stream
/// notification to the Amazon SNS topic.
class ConfigStreamDeliveryInfo {
  /// Status of the last attempted delivery.
  ///
  ///  **Note** Providing an SNS topic on a
  /// [DeliveryChannel](https://docs.aws.amazon.com/config/latest/APIReference/API_DeliveryChannel.html)
  /// for AWS Config is optional. If the SNS delivery is turned off, the last
  /// status will be **Not_Applicable**.
  final String lastStatus;

  /// The error code from the last attempted delivery.
  final String lastErrorCode;

  /// The error message from the last attempted delivery.
  final String lastErrorMessage;

  /// The time from the last status change.
  final DateTime lastStatusChangeTime;

  ConfigStreamDeliveryInfo({
    this.lastStatus,
    this.lastErrorCode,
    this.lastErrorMessage,
    this.lastStatusChangeTime,
  });
  static ConfigStreamDeliveryInfo fromJson(Map<String, dynamic> json) =>
      ConfigStreamDeliveryInfo(
        lastStatus: json.containsKey('lastStatus')
            ? json['lastStatus'] as String
            : null,
        lastErrorCode: json.containsKey('lastErrorCode')
            ? json['lastErrorCode'] as String
            : null,
        lastErrorMessage: json.containsKey('lastErrorMessage')
            ? json['lastErrorMessage'] as String
            : null,
        lastStatusChangeTime: json.containsKey('lastStatusChangeTime')
            ? DateTime.parse(json['lastStatusChangeTime'])
            : null,
      );
}

/// The details about the configuration aggregator, including information about
/// source accounts, regions, and metadata of the aggregator.
class ConfigurationAggregator {
  /// The name of the aggregator.
  final String configurationAggregatorName;

  /// The Amazon Resource Name (ARN) of the aggregator.
  final String configurationAggregatorArn;

  /// Provides a list of source accounts and regions to be aggregated.
  final List<AccountAggregationSource> accountAggregationSources;

  /// Provides an organization and list of regions to be aggregated.
  final OrganizationAggregationSource organizationAggregationSource;

  /// The time stamp when the configuration aggregator was created.
  final DateTime creationTime;

  /// The time of the last update.
  final DateTime lastUpdatedTime;

  ConfigurationAggregator({
    this.configurationAggregatorName,
    this.configurationAggregatorArn,
    this.accountAggregationSources,
    this.organizationAggregationSource,
    this.creationTime,
    this.lastUpdatedTime,
  });
  static ConfigurationAggregator fromJson(Map<String, dynamic> json) =>
      ConfigurationAggregator(
        configurationAggregatorName:
            json.containsKey('ConfigurationAggregatorName')
                ? json['ConfigurationAggregatorName'] as String
                : null,
        configurationAggregatorArn:
            json.containsKey('ConfigurationAggregatorArn')
                ? json['ConfigurationAggregatorArn'] as String
                : null,
        accountAggregationSources: json.containsKey('AccountAggregationSources')
            ? (json['AccountAggregationSources'] as List)
                .map((e) => AccountAggregationSource.fromJson(e))
                .toList()
            : null,
        organizationAggregationSource:
            json.containsKey('OrganizationAggregationSource')
                ? OrganizationAggregationSource.fromJson(
                    json['OrganizationAggregationSource'])
                : null,
        creationTime: json.containsKey('CreationTime')
            ? DateTime.parse(json['CreationTime'])
            : null,
        lastUpdatedTime: json.containsKey('LastUpdatedTime')
            ? DateTime.parse(json['LastUpdatedTime'])
            : null,
      );
}

/// A list that contains detailed configurations of a specified resource.
class ConfigurationItem {
  /// The version number of the resource configuration.
  final String version;

  /// The 12-digit AWS account ID associated with the resource.
  final String accountId;

  /// The time when the configuration recording was initiated.
  final DateTime configurationItemCaptureTime;

  /// The configuration item status.
  final String configurationItemStatus;

  /// An identifier that indicates the ordering of the configuration items of a
  /// resource.
  final String configurationStateId;

  /// Unique MD5 hash that represents the configuration item's state.
  ///
  /// You can use MD5 hash to compare the states of two or more configuration
  /// items that are associated with the same resource.
  final String configurationItemMd5Hash;

  /// accoun
  final String arn;

  /// The type of AWS resource.
  final String resourceType;

  /// The ID of the resource (for example, `sg-xxxxxx`).
  final String resourceId;

  /// The custom name of the resource, if available.
  final String resourceName;

  /// The region where the resource resides.
  final String awsRegion;

  /// The Availability Zone associated with the resource.
  final String availabilityZone;

  /// The time stamp when the resource was created.
  final DateTime resourceCreationTime;

  /// A mapping of key value tags associated with the resource.
  final Map<String, String> tags;

  /// A list of CloudTrail event IDs.
  ///
  /// A populated field indicates that the current configuration was initiated
  /// by the events recorded in the CloudTrail log. For more information about
  /// CloudTrail, see
  /// [What Is AWS CloudTrail](https://docs.aws.amazon.com/awscloudtrail/latest/userguide/what_is_cloud_trail_top_level.html).
  ///
  /// An empty field indicates that the current configuration was not initiated
  /// by any event.
  final List<String> relatedEvents;

  /// A list of related AWS resources.
  final List<Relationship> relationships;

  /// The description of the resource configuration.
  final String configuration;

  /// Configuration attributes that AWS Config returns for certain resource
  /// types to supplement the information returned for the `configuration`
  /// parameter.
  final Map<String, String> supplementaryConfiguration;

  ConfigurationItem({
    this.version,
    this.accountId,
    this.configurationItemCaptureTime,
    this.configurationItemStatus,
    this.configurationStateId,
    this.configurationItemMd5Hash,
    this.arn,
    this.resourceType,
    this.resourceId,
    this.resourceName,
    this.awsRegion,
    this.availabilityZone,
    this.resourceCreationTime,
    this.tags,
    this.relatedEvents,
    this.relationships,
    this.configuration,
    this.supplementaryConfiguration,
  });
  static ConfigurationItem fromJson(Map<String, dynamic> json) =>
      ConfigurationItem(
        version: json.containsKey('version') ? json['version'] as String : null,
        accountId:
            json.containsKey('accountId') ? json['accountId'] as String : null,
        configurationItemCaptureTime:
            json.containsKey('configurationItemCaptureTime')
                ? DateTime.parse(json['configurationItemCaptureTime'])
                : null,
        configurationItemStatus: json.containsKey('configurationItemStatus')
            ? json['configurationItemStatus'] as String
            : null,
        configurationStateId: json.containsKey('configurationStateId')
            ? json['configurationStateId'] as String
            : null,
        configurationItemMd5Hash: json.containsKey('configurationItemMD5Hash')
            ? json['configurationItemMD5Hash'] as String
            : null,
        arn: json.containsKey('arn') ? json['arn'] as String : null,
        resourceType: json.containsKey('resourceType')
            ? json['resourceType'] as String
            : null,
        resourceId: json.containsKey('resourceId')
            ? json['resourceId'] as String
            : null,
        resourceName: json.containsKey('resourceName')
            ? json['resourceName'] as String
            : null,
        awsRegion:
            json.containsKey('awsRegion') ? json['awsRegion'] as String : null,
        availabilityZone: json.containsKey('availabilityZone')
            ? json['availabilityZone'] as String
            : null,
        resourceCreationTime: json.containsKey('resourceCreationTime')
            ? DateTime.parse(json['resourceCreationTime'])
            : null,
        tags: json.containsKey('tags')
            ? (json['tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        relatedEvents: json.containsKey('relatedEvents')
            ? (json['relatedEvents'] as List).map((e) => e as String).toList()
            : null,
        relationships: json.containsKey('relationships')
            ? (json['relationships'] as List)
                .map((e) => Relationship.fromJson(e))
                .toList()
            : null,
        configuration: json.containsKey('configuration')
            ? json['configuration'] as String
            : null,
        supplementaryConfiguration:
            json.containsKey('supplementaryConfiguration')
                ? (json['supplementaryConfiguration'] as Map)
                    .map((k, v) => MapEntry(k as String, v as String))
                : null,
      );
}

/// An object that represents the recording of configuration changes of an AWS
/// resource.
class ConfigurationRecorder {
  /// The name of the recorder. By default, AWS Config automatically assigns the
  /// name "default" when creating the configuration recorder. You cannot change
  /// the assigned name.
  final String name;

  /// Amazon Resource Name (ARN) of the IAM role used to describe the AWS
  /// resources associated with the account.
  final String roleArn;

  /// Specifies the types of AWS resources for which AWS Config records
  /// configuration changes.
  final RecordingGroup recordingGroup;

  ConfigurationRecorder({
    this.name,
    this.roleArn,
    this.recordingGroup,
  });
  static ConfigurationRecorder fromJson(Map<String, dynamic> json) =>
      ConfigurationRecorder(
        name: json.containsKey('name') ? json['name'] as String : null,
        roleArn: json.containsKey('roleARN') ? json['roleARN'] as String : null,
        recordingGroup: json.containsKey('recordingGroup')
            ? RecordingGroup.fromJson(json['recordingGroup'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The current status of the configuration recorder.
class ConfigurationRecorderStatus {
  /// The name of the configuration recorder.
  final String name;

  /// The time the recorder was last started.
  final DateTime lastStartTime;

  /// The time the recorder was last stopped.
  final DateTime lastStopTime;

  /// Specifies whether or not the recorder is currently recording.
  final bool recording;

  /// The last (previous) status of the recorder.
  final String lastStatus;

  /// The error code indicating that the recording failed.
  final String lastErrorCode;

  /// The message indicating that the recording failed due to an error.
  final String lastErrorMessage;

  /// The time when the status was last changed.
  final DateTime lastStatusChangeTime;

  ConfigurationRecorderStatus({
    this.name,
    this.lastStartTime,
    this.lastStopTime,
    this.recording,
    this.lastStatus,
    this.lastErrorCode,
    this.lastErrorMessage,
    this.lastStatusChangeTime,
  });
  static ConfigurationRecorderStatus fromJson(Map<String, dynamic> json) =>
      ConfigurationRecorderStatus(
        name: json.containsKey('name') ? json['name'] as String : null,
        lastStartTime: json.containsKey('lastStartTime')
            ? DateTime.parse(json['lastStartTime'])
            : null,
        lastStopTime: json.containsKey('lastStopTime')
            ? DateTime.parse(json['lastStopTime'])
            : null,
        recording:
            json.containsKey('recording') ? json['recording'] as bool : null,
        lastStatus: json.containsKey('lastStatus')
            ? json['lastStatus'] as String
            : null,
        lastErrorCode: json.containsKey('lastErrorCode')
            ? json['lastErrorCode'] as String
            : null,
        lastErrorMessage: json.containsKey('lastErrorMessage')
            ? json['lastErrorMessage'] as String
            : null,
        lastStatusChangeTime: json.containsKey('lastStatusChangeTime')
            ? DateTime.parse(json['lastStatusChangeTime'])
            : null,
      );
}

/// The output when you delete the evaluation results for the specified AWS
/// Config rule.
class DeleteEvaluationResultsResponse {
  DeleteEvaluationResultsResponse();
  static DeleteEvaluationResultsResponse fromJson(Map<String, dynamic> json) =>
      DeleteEvaluationResultsResponse();
}

class DeleteRemediationConfigurationResponse {
  DeleteRemediationConfigurationResponse();
  static DeleteRemediationConfigurationResponse fromJson(
          Map<String, dynamic> json) =>
      DeleteRemediationConfigurationResponse();
}

class DeleteRemediationExceptionsResponse {
  /// Returns a list of failed delete remediation exceptions batch objects. Each
  /// object in the batch consists of a list of failed items and failure
  /// messages.
  final List<FailedDeleteRemediationExceptionsBatch> failedBatches;

  DeleteRemediationExceptionsResponse({
    this.failedBatches,
  });
  static DeleteRemediationExceptionsResponse fromJson(
          Map<String, dynamic> json) =>
      DeleteRemediationExceptionsResponse(
        failedBatches: json.containsKey('FailedBatches')
            ? (json['FailedBatches'] as List)
                .map((e) => FailedDeleteRemediationExceptionsBatch.fromJson(e))
                .toList()
            : null,
      );
}

/// The output for the DeliverConfigSnapshot action, in JSON format.
class DeliverConfigSnapshotResponse {
  /// The ID of the snapshot that is being created.
  final String configSnapshotId;

  DeliverConfigSnapshotResponse({
    this.configSnapshotId,
  });
  static DeliverConfigSnapshotResponse fromJson(Map<String, dynamic> json) =>
      DeliverConfigSnapshotResponse(
        configSnapshotId: json.containsKey('configSnapshotId')
            ? json['configSnapshotId'] as String
            : null,
      );
}

/// The channel through which AWS Config delivers notifications and updated
/// configuration states.
class DeliveryChannel {
  /// The name of the delivery channel. By default, AWS Config assigns the name
  /// "default" when creating the delivery channel. To change the delivery
  /// channel name, you must use the DeleteDeliveryChannel action to delete your
  /// current delivery channel, and then you must use the PutDeliveryChannel
  /// command to create a delivery channel that has the desired name.
  final String name;

  /// The name of the Amazon S3 bucket to which AWS Config delivers
  /// configuration snapshots and configuration history files.
  ///
  /// If you specify a bucket that belongs to another AWS account, that bucket
  /// must have policies that grant access permissions to AWS Config. For more
  /// information, see
  /// [Permissions for the Amazon S3 Bucket](https://docs.aws.amazon.com/config/latest/developerguide/s3-bucket-policy.html)
  /// in the AWS Config Developer Guide.
  final String s3BucketName;

  /// The prefix for the specified Amazon S3 bucket.
  final String s3KeyPrefix;

  /// The Amazon Resource Name (ARN) of the Amazon SNS topic to which AWS Config
  /// sends notifications about configuration changes.
  ///
  /// If you choose a topic from another account, the topic must have policies
  /// that grant access permissions to AWS Config. For more information, see
  /// [Permissions for the Amazon SNS Topic](https://docs.aws.amazon.com/config/latest/developerguide/sns-topic-policy.html)
  /// in the AWS Config Developer Guide.
  final String snsTopicArn;

  /// The options for how often AWS Config delivers configuration snapshots to
  /// the Amazon S3 bucket.
  final ConfigSnapshotDeliveryProperties configSnapshotDeliveryProperties;

  DeliveryChannel({
    this.name,
    this.s3BucketName,
    this.s3KeyPrefix,
    this.snsTopicArn,
    this.configSnapshotDeliveryProperties,
  });
  static DeliveryChannel fromJson(Map<String, dynamic> json) => DeliveryChannel(
        name: json.containsKey('name') ? json['name'] as String : null,
        s3BucketName: json.containsKey('s3BucketName')
            ? json['s3BucketName'] as String
            : null,
        s3KeyPrefix: json.containsKey('s3KeyPrefix')
            ? json['s3KeyPrefix'] as String
            : null,
        snsTopicArn: json.containsKey('snsTopicARN')
            ? json['snsTopicARN'] as String
            : null,
        configSnapshotDeliveryProperties:
            json.containsKey('configSnapshotDeliveryProperties')
                ? ConfigSnapshotDeliveryProperties.fromJson(
                    json['configSnapshotDeliveryProperties'])
                : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The status of a specified delivery channel.
///
/// Valid values: `Success` | `Failure`
class DeliveryChannelStatus {
  /// The name of the delivery channel.
  final String name;

  /// A list containing the status of the delivery of the snapshot to the
  /// specified Amazon S3 bucket.
  final ConfigExportDeliveryInfo configSnapshotDeliveryInfo;

  /// A list that contains the status of the delivery of the configuration
  /// history to the specified Amazon S3 bucket.
  final ConfigExportDeliveryInfo configHistoryDeliveryInfo;

  /// A list containing the status of the delivery of the configuration stream
  /// notification to the specified Amazon SNS topic.
  final ConfigStreamDeliveryInfo configStreamDeliveryInfo;

  DeliveryChannelStatus({
    this.name,
    this.configSnapshotDeliveryInfo,
    this.configHistoryDeliveryInfo,
    this.configStreamDeliveryInfo,
  });
  static DeliveryChannelStatus fromJson(Map<String, dynamic> json) =>
      DeliveryChannelStatus(
        name: json.containsKey('name') ? json['name'] as String : null,
        configSnapshotDeliveryInfo:
            json.containsKey('configSnapshotDeliveryInfo')
                ? ConfigExportDeliveryInfo.fromJson(
                    json['configSnapshotDeliveryInfo'])
                : null,
        configHistoryDeliveryInfo: json.containsKey('configHistoryDeliveryInfo')
            ? ConfigExportDeliveryInfo.fromJson(
                json['configHistoryDeliveryInfo'])
            : null,
        configStreamDeliveryInfo: json.containsKey('configStreamDeliveryInfo')
            ? ConfigStreamDeliveryInfo.fromJson(
                json['configStreamDeliveryInfo'])
            : null,
      );
}

class DescribeAggregateComplianceByConfigRulesResponse {
  /// Returns a list of AggregateComplianceByConfigRule object.
  final List<AggregateComplianceByConfigRule> aggregateComplianceByConfigRules;

  /// The `nextToken` string returned on a previous page that you use to get the
  /// next page of results in a paginated response.
  final String nextToken;

  DescribeAggregateComplianceByConfigRulesResponse({
    this.aggregateComplianceByConfigRules,
    this.nextToken,
  });
  static DescribeAggregateComplianceByConfigRulesResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeAggregateComplianceByConfigRulesResponse(
        aggregateComplianceByConfigRules:
            json.containsKey('AggregateComplianceByConfigRules')
                ? (json['AggregateComplianceByConfigRules'] as List)
                    .map((e) => AggregateComplianceByConfigRule.fromJson(e))
                    .toList()
                : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class DescribeAggregationAuthorizationsResponse {
  /// Returns a list of authorizations granted to various aggregator accounts
  /// and regions.
  final List<AggregationAuthorization> aggregationAuthorizations;

  /// The `nextToken` string returned on a previous page that you use to get the
  /// next page of results in a paginated response.
  final String nextToken;

  DescribeAggregationAuthorizationsResponse({
    this.aggregationAuthorizations,
    this.nextToken,
  });
  static DescribeAggregationAuthorizationsResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeAggregationAuthorizationsResponse(
        aggregationAuthorizations: json.containsKey('AggregationAuthorizations')
            ? (json['AggregationAuthorizations'] as List)
                .map((e) => AggregationAuthorization.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class DescribeComplianceByConfigRuleResponse {
  /// Indicates whether each of the specified AWS Config rules is compliant.
  final List<ComplianceByConfigRule> complianceByConfigRules;

  /// The string that you use in a subsequent request to get the next page of
  /// results in a paginated response.
  final String nextToken;

  DescribeComplianceByConfigRuleResponse({
    this.complianceByConfigRules,
    this.nextToken,
  });
  static DescribeComplianceByConfigRuleResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeComplianceByConfigRuleResponse(
        complianceByConfigRules: json.containsKey('ComplianceByConfigRules')
            ? (json['ComplianceByConfigRules'] as List)
                .map((e) => ComplianceByConfigRule.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class DescribeComplianceByResourceResponse {
  /// Indicates whether the specified AWS resource complies with all of the AWS
  /// Config rules that evaluate it.
  final List<ComplianceByResource> complianceByResources;

  /// The string that you use in a subsequent request to get the next page of
  /// results in a paginated response.
  final String nextToken;

  DescribeComplianceByResourceResponse({
    this.complianceByResources,
    this.nextToken,
  });
  static DescribeComplianceByResourceResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeComplianceByResourceResponse(
        complianceByResources: json.containsKey('ComplianceByResources')
            ? (json['ComplianceByResources'] as List)
                .map((e) => ComplianceByResource.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class DescribeConfigRuleEvaluationStatusResponse {
  /// Status information about your AWS managed Config rules.
  final List<ConfigRuleEvaluationStatus> configRulesEvaluationStatus;

  /// The string that you use in a subsequent request to get the next page of
  /// results in a paginated response.
  final String nextToken;

  DescribeConfigRuleEvaluationStatusResponse({
    this.configRulesEvaluationStatus,
    this.nextToken,
  });
  static DescribeConfigRuleEvaluationStatusResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeConfigRuleEvaluationStatusResponse(
        configRulesEvaluationStatus:
            json.containsKey('ConfigRulesEvaluationStatus')
                ? (json['ConfigRulesEvaluationStatus'] as List)
                    .map((e) => ConfigRuleEvaluationStatus.fromJson(e))
                    .toList()
                : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class DescribeConfigRulesResponse {
  /// The details about your AWS Config rules.
  final List<ConfigRule> configRules;

  /// The string that you use in a subsequent request to get the next page of
  /// results in a paginated response.
  final String nextToken;

  DescribeConfigRulesResponse({
    this.configRules,
    this.nextToken,
  });
  static DescribeConfigRulesResponse fromJson(Map<String, dynamic> json) =>
      DescribeConfigRulesResponse(
        configRules: json.containsKey('ConfigRules')
            ? (json['ConfigRules'] as List)
                .map((e) => ConfigRule.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class DescribeConfigurationAggregatorSourcesStatusResponse {
  /// Returns an AggregatedSourceStatus object.
  final List<AggregatedSourceStatus> aggregatedSourceStatusList;

  /// The `nextToken` string returned on a previous page that you use to get the
  /// next page of results in a paginated response.
  final String nextToken;

  DescribeConfigurationAggregatorSourcesStatusResponse({
    this.aggregatedSourceStatusList,
    this.nextToken,
  });
  static DescribeConfigurationAggregatorSourcesStatusResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeConfigurationAggregatorSourcesStatusResponse(
        aggregatedSourceStatusList:
            json.containsKey('AggregatedSourceStatusList')
                ? (json['AggregatedSourceStatusList'] as List)
                    .map((e) => AggregatedSourceStatus.fromJson(e))
                    .toList()
                : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class DescribeConfigurationAggregatorsResponse {
  /// Returns a ConfigurationAggregators object.
  final List<ConfigurationAggregator> configurationAggregators;

  /// The `nextToken` string returned on a previous page that you use to get the
  /// next page of results in a paginated response.
  final String nextToken;

  DescribeConfigurationAggregatorsResponse({
    this.configurationAggregators,
    this.nextToken,
  });
  static DescribeConfigurationAggregatorsResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeConfigurationAggregatorsResponse(
        configurationAggregators: json.containsKey('ConfigurationAggregators')
            ? (json['ConfigurationAggregators'] as List)
                .map((e) => ConfigurationAggregator.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// The output for the DescribeConfigurationRecorderStatus action, in JSON
/// format.
class DescribeConfigurationRecorderStatusResponse {
  /// A list that contains status of the specified recorders.
  final List<ConfigurationRecorderStatus> configurationRecordersStatus;

  DescribeConfigurationRecorderStatusResponse({
    this.configurationRecordersStatus,
  });
  static DescribeConfigurationRecorderStatusResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeConfigurationRecorderStatusResponse(
        configurationRecordersStatus:
            json.containsKey('ConfigurationRecordersStatus')
                ? (json['ConfigurationRecordersStatus'] as List)
                    .map((e) => ConfigurationRecorderStatus.fromJson(e))
                    .toList()
                : null,
      );
}

/// The output for the DescribeConfigurationRecorders action.
class DescribeConfigurationRecordersResponse {
  /// A list that contains the descriptions of the specified configuration
  /// recorders.
  final List<ConfigurationRecorder> configurationRecorders;

  DescribeConfigurationRecordersResponse({
    this.configurationRecorders,
  });
  static DescribeConfigurationRecordersResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeConfigurationRecordersResponse(
        configurationRecorders: json.containsKey('ConfigurationRecorders')
            ? (json['ConfigurationRecorders'] as List)
                .map((e) => ConfigurationRecorder.fromJson(e))
                .toList()
            : null,
      );
}

/// The output for the DescribeDeliveryChannelStatus action.
class DescribeDeliveryChannelStatusResponse {
  /// A list that contains the status of a specified delivery channel.
  final List<DeliveryChannelStatus> deliveryChannelsStatus;

  DescribeDeliveryChannelStatusResponse({
    this.deliveryChannelsStatus,
  });
  static DescribeDeliveryChannelStatusResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeDeliveryChannelStatusResponse(
        deliveryChannelsStatus: json.containsKey('DeliveryChannelsStatus')
            ? (json['DeliveryChannelsStatus'] as List)
                .map((e) => DeliveryChannelStatus.fromJson(e))
                .toList()
            : null,
      );
}

/// The output for the DescribeDeliveryChannels action.
class DescribeDeliveryChannelsResponse {
  /// A list that contains the descriptions of the specified delivery channel.
  final List<DeliveryChannel> deliveryChannels;

  DescribeDeliveryChannelsResponse({
    this.deliveryChannels,
  });
  static DescribeDeliveryChannelsResponse fromJson(Map<String, dynamic> json) =>
      DescribeDeliveryChannelsResponse(
        deliveryChannels: json.containsKey('DeliveryChannels')
            ? (json['DeliveryChannels'] as List)
                .map((e) => DeliveryChannel.fromJson(e))
                .toList()
            : null,
      );
}

class DescribeOrganizationConfigRuleStatusesResponse {
  /// A list of `OrganizationConfigRuleStatus` objects.
  final List<OrganizationConfigRuleStatus> organizationConfigRuleStatuses;

  /// The `nextToken` string returned on a previous page that you use to get the
  /// next page of results in a paginated response.
  final String nextToken;

  DescribeOrganizationConfigRuleStatusesResponse({
    this.organizationConfigRuleStatuses,
    this.nextToken,
  });
  static DescribeOrganizationConfigRuleStatusesResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeOrganizationConfigRuleStatusesResponse(
        organizationConfigRuleStatuses:
            json.containsKey('OrganizationConfigRuleStatuses')
                ? (json['OrganizationConfigRuleStatuses'] as List)
                    .map((e) => OrganizationConfigRuleStatus.fromJson(e))
                    .toList()
                : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class DescribeOrganizationConfigRulesResponse {
  /// Retuns a list `OrganizationConfigRule` objects.
  final List<OrganizationConfigRule> organizationConfigRules;

  /// The `nextToken` string returned on a previous page that you use to get the
  /// next page of results in a paginated response.
  final String nextToken;

  DescribeOrganizationConfigRulesResponse({
    this.organizationConfigRules,
    this.nextToken,
  });
  static DescribeOrganizationConfigRulesResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeOrganizationConfigRulesResponse(
        organizationConfigRules: json.containsKey('OrganizationConfigRules')
            ? (json['OrganizationConfigRules'] as List)
                .map((e) => OrganizationConfigRule.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class DescribePendingAggregationRequestsResponse {
  /// Returns a PendingAggregationRequests object.
  final List<PendingAggregationRequest> pendingAggregationRequests;

  /// The `nextToken` string returned on a previous page that you use to get the
  /// next page of results in a paginated response.
  final String nextToken;

  DescribePendingAggregationRequestsResponse({
    this.pendingAggregationRequests,
    this.nextToken,
  });
  static DescribePendingAggregationRequestsResponse fromJson(
          Map<String, dynamic> json) =>
      DescribePendingAggregationRequestsResponse(
        pendingAggregationRequests:
            json.containsKey('PendingAggregationRequests')
                ? (json['PendingAggregationRequests'] as List)
                    .map((e) => PendingAggregationRequest.fromJson(e))
                    .toList()
                : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class DescribeRemediationConfigurationsResponse {
  /// Returns a remediation configuration object.
  final List<RemediationConfiguration> remediationConfigurations;

  DescribeRemediationConfigurationsResponse({
    this.remediationConfigurations,
  });
  static DescribeRemediationConfigurationsResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeRemediationConfigurationsResponse(
        remediationConfigurations: json.containsKey('RemediationConfigurations')
            ? (json['RemediationConfigurations'] as List)
                .map((e) => RemediationConfiguration.fromJson(e))
                .toList()
            : null,
      );
}

class DescribeRemediationExceptionsResponse {
  /// Returns a list of remediation exception objects.
  final List<RemediationException> remediationExceptions;

  /// The `nextToken` string returned in a previous request that you use to
  /// request the next page of results in a paginated response.
  final String nextToken;

  DescribeRemediationExceptionsResponse({
    this.remediationExceptions,
    this.nextToken,
  });
  static DescribeRemediationExceptionsResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeRemediationExceptionsResponse(
        remediationExceptions: json.containsKey('RemediationExceptions')
            ? (json['RemediationExceptions'] as List)
                .map((e) => RemediationException.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class DescribeRemediationExecutionStatusResponse {
  /// Returns a list of remediation execution statuses objects.
  final List<RemediationExecutionStatus> remediationExecutionStatuses;

  /// The `nextToken` string returned on a previous page that you use to get the
  /// next page of results in a paginated response.
  final String nextToken;

  DescribeRemediationExecutionStatusResponse({
    this.remediationExecutionStatuses,
    this.nextToken,
  });
  static DescribeRemediationExecutionStatusResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeRemediationExecutionStatusResponse(
        remediationExecutionStatuses:
            json.containsKey('RemediationExecutionStatuses')
                ? (json['RemediationExecutionStatuses'] as List)
                    .map((e) => RemediationExecutionStatus.fromJson(e))
                    .toList()
                : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class DescribeRetentionConfigurationsResponse {
  /// Returns a retention configuration object.
  final List<RetentionConfiguration> retentionConfigurations;

  /// The `nextToken` string returned on a previous page that you use to get the
  /// next page of results in a paginated response.
  final String nextToken;

  DescribeRetentionConfigurationsResponse({
    this.retentionConfigurations,
    this.nextToken,
  });
  static DescribeRetentionConfigurationsResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeRetentionConfigurationsResponse(
        retentionConfigurations: json.containsKey('RetentionConfigurations')
            ? (json['RetentionConfigurations'] as List)
                .map((e) => RetentionConfiguration.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// Identifies an AWS resource and indicates whether it complies with the AWS
/// Config rule that it was evaluated against.
class Evaluation {
  /// The type of AWS resource that was evaluated.
  final String complianceResourceType;

  /// The ID of the AWS resource that was evaluated.
  final String complianceResourceId;

  /// Indicates whether the AWS resource complies with the AWS Config rule that
  /// it was evaluated against.
  ///
  /// For the `Evaluation` data type, AWS Config supports only the `COMPLIANT`,
  /// `NON_COMPLIANT`, and `NOT_APPLICABLE` values. AWS Config does not support
  /// the `INSUFFICIENT_DATA` value for this data type.
  ///
  /// Similarly, AWS Config does not accept `INSUFFICIENT_DATA` as the value for
  /// `ComplianceType` from a `PutEvaluations` request. For example, an AWS
  /// Lambda function for a custom AWS Config rule cannot pass an
  /// `INSUFFICIENT_DATA` value to AWS Config.
  final String complianceType;

  /// Supplementary information about how the evaluation determined the
  /// compliance.
  final String annotation;

  /// The time of the event in AWS Config that triggered the evaluation. For
  /// event-based evaluations, the time indicates when AWS Config created the
  /// configuration item that triggered the evaluation. For periodic
  /// evaluations, the time indicates when AWS Config triggered the evaluation
  /// at the frequency that you specified (for example, every 24 hours).
  final DateTime orderingTimestamp;

  Evaluation({
    @required this.complianceResourceType,
    @required this.complianceResourceId,
    @required this.complianceType,
    this.annotation,
    @required this.orderingTimestamp,
  });
  static Evaluation fromJson(Map<String, dynamic> json) => Evaluation(
        complianceResourceType: json['ComplianceResourceType'] as String,
        complianceResourceId: json['ComplianceResourceId'] as String,
        complianceType: json['ComplianceType'] as String,
        annotation: json.containsKey('Annotation')
            ? json['Annotation'] as String
            : null,
        orderingTimestamp: DateTime.parse(json['OrderingTimestamp']),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The details of an AWS Config evaluation. Provides the AWS resource that was
/// evaluated, the compliance of the resource, related time stamps, and
/// supplementary information.
class EvaluationResult {
  /// Uniquely identifies the evaluation result.
  final EvaluationResultIdentifier evaluationResultIdentifier;

  /// Indicates whether the AWS resource complies with the AWS Config rule that
  /// evaluated it.
  ///
  /// For the `EvaluationResult` data type, AWS Config supports only the
  /// `COMPLIANT`, `NON_COMPLIANT`, and `NOT_APPLICABLE` values. AWS Config does
  /// not support the `INSUFFICIENT_DATA` value for the `EvaluationResult` data
  /// type.
  final String complianceType;

  /// The time when AWS Config recorded the evaluation result.
  final DateTime resultRecordedTime;

  /// The time when the AWS Config rule evaluated the AWS resource.
  final DateTime configRuleInvokedTime;

  /// Supplementary information about how the evaluation determined the
  /// compliance.
  final String annotation;

  /// An encrypted token that associates an evaluation with an AWS Config rule.
  /// The token identifies the rule, the AWS resource being evaluated, and the
  /// event that triggered the evaluation.
  final String resultToken;

  EvaluationResult({
    this.evaluationResultIdentifier,
    this.complianceType,
    this.resultRecordedTime,
    this.configRuleInvokedTime,
    this.annotation,
    this.resultToken,
  });
  static EvaluationResult fromJson(Map<String, dynamic> json) =>
      EvaluationResult(
        evaluationResultIdentifier:
            json.containsKey('EvaluationResultIdentifier')
                ? EvaluationResultIdentifier.fromJson(
                    json['EvaluationResultIdentifier'])
                : null,
        complianceType: json.containsKey('ComplianceType')
            ? json['ComplianceType'] as String
            : null,
        resultRecordedTime: json.containsKey('ResultRecordedTime')
            ? DateTime.parse(json['ResultRecordedTime'])
            : null,
        configRuleInvokedTime: json.containsKey('ConfigRuleInvokedTime')
            ? DateTime.parse(json['ConfigRuleInvokedTime'])
            : null,
        annotation: json.containsKey('Annotation')
            ? json['Annotation'] as String
            : null,
        resultToken: json.containsKey('ResultToken')
            ? json['ResultToken'] as String
            : null,
      );
}

/// Uniquely identifies an evaluation result.
class EvaluationResultIdentifier {
  /// Identifies an AWS Config rule used to evaluate an AWS resource, and
  /// provides the type and ID of the evaluated resource.
  final EvaluationResultQualifier evaluationResultQualifier;

  /// The time of the event that triggered the evaluation of your AWS resources.
  /// The time can indicate when AWS Config delivered a configuration item
  /// change notification, or it can indicate when AWS Config delivered the
  /// configuration snapshot, depending on which event triggered the evaluation.
  final DateTime orderingTimestamp;

  EvaluationResultIdentifier({
    this.evaluationResultQualifier,
    this.orderingTimestamp,
  });
  static EvaluationResultIdentifier fromJson(Map<String, dynamic> json) =>
      EvaluationResultIdentifier(
        evaluationResultQualifier: json.containsKey('EvaluationResultQualifier')
            ? EvaluationResultQualifier.fromJson(
                json['EvaluationResultQualifier'])
            : null,
        orderingTimestamp: json.containsKey('OrderingTimestamp')
            ? DateTime.parse(json['OrderingTimestamp'])
            : null,
      );
}

/// Identifies an AWS Config rule that evaluated an AWS resource, and provides
/// the type and ID of the resource that the rule evaluated.
class EvaluationResultQualifier {
  /// The name of the AWS Config rule that was used in the evaluation.
  final String configRuleName;

  /// The type of AWS resource that was evaluated.
  final String resourceType;

  /// The ID of the evaluated AWS resource.
  final String resourceId;

  EvaluationResultQualifier({
    this.configRuleName,
    this.resourceType,
    this.resourceId,
  });
  static EvaluationResultQualifier fromJson(Map<String, dynamic> json) =>
      EvaluationResultQualifier(
        configRuleName: json.containsKey('ConfigRuleName')
            ? json['ConfigRuleName'] as String
            : null,
        resourceType: json.containsKey('ResourceType')
            ? json['ResourceType'] as String
            : null,
        resourceId: json.containsKey('ResourceId')
            ? json['ResourceId'] as String
            : null,
      );
}

/// The controls that AWS Config uses for executing remediations.
class ExecutionControls {
  /// A SsmControls object.
  final SsmControls ssmControls;

  ExecutionControls({
    this.ssmControls,
  });
  static ExecutionControls fromJson(Map<String, dynamic> json) =>
      ExecutionControls(
        ssmControls: json.containsKey('SsmControls')
            ? SsmControls.fromJson(json['SsmControls'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// List of each of the failed delete remediation exceptions with specific
/// reasons.
class FailedDeleteRemediationExceptionsBatch {
  /// Returns a failure message for delete remediation exception. For example,
  /// AWS Config creates an exception due to an internal error.
  final String failureMessage;

  /// Returns remediation exception resource key object of the failed items.
  final List<RemediationExceptionResourceKey> failedItems;

  FailedDeleteRemediationExceptionsBatch({
    this.failureMessage,
    this.failedItems,
  });
  static FailedDeleteRemediationExceptionsBatch fromJson(
          Map<String, dynamic> json) =>
      FailedDeleteRemediationExceptionsBatch(
        failureMessage: json.containsKey('FailureMessage')
            ? json['FailureMessage'] as String
            : null,
        failedItems: json.containsKey('FailedItems')
            ? (json['FailedItems'] as List)
                .map((e) => RemediationExceptionResourceKey.fromJson(e))
                .toList()
            : null,
      );
}

/// List of each of the failed remediations with specific reasons.
class FailedRemediationBatch {
  /// Returns a failure message. For example, the resource is already compliant.
  final String failureMessage;

  /// Returns remediation configurations of the failed items.
  final List<RemediationConfiguration> failedItems;

  FailedRemediationBatch({
    this.failureMessage,
    this.failedItems,
  });
  static FailedRemediationBatch fromJson(Map<String, dynamic> json) =>
      FailedRemediationBatch(
        failureMessage: json.containsKey('FailureMessage')
            ? json['FailureMessage'] as String
            : null,
        failedItems: json.containsKey('FailedItems')
            ? (json['FailedItems'] as List)
                .map((e) => RemediationConfiguration.fromJson(e))
                .toList()
            : null,
      );
}

/// List of each of the failed remediation exceptions with specific reasons.
class FailedRemediationExceptionBatch {
  /// Returns a failure message. For example, the auto-remediation has failed.
  final String failureMessage;

  /// Returns remediation exception resource key object of the failed items.
  final List<RemediationException> failedItems;

  FailedRemediationExceptionBatch({
    this.failureMessage,
    this.failedItems,
  });
  static FailedRemediationExceptionBatch fromJson(Map<String, dynamic> json) =>
      FailedRemediationExceptionBatch(
        failureMessage: json.containsKey('FailureMessage')
            ? json['FailureMessage'] as String
            : null,
        failedItems: json.containsKey('FailedItems')
            ? (json['FailedItems'] as List)
                .map((e) => RemediationException.fromJson(e))
                .toList()
            : null,
      );
}

/// Details about the fields such as name of the field.
class FieldInfo {
  /// Name of the field.
  final String name;

  FieldInfo({
    this.name,
  });
  static FieldInfo fromJson(Map<String, dynamic> json) => FieldInfo(
        name: json.containsKey('Name') ? json['Name'] as String : null,
      );
}

class GetAggregateComplianceDetailsByConfigRuleResponse {
  /// Returns an AggregateEvaluationResults object.
  final List<AggregateEvaluationResult> aggregateEvaluationResults;

  /// The `nextToken` string returned on a previous page that you use to get the
  /// next page of results in a paginated response.
  final String nextToken;

  GetAggregateComplianceDetailsByConfigRuleResponse({
    this.aggregateEvaluationResults,
    this.nextToken,
  });
  static GetAggregateComplianceDetailsByConfigRuleResponse fromJson(
          Map<String, dynamic> json) =>
      GetAggregateComplianceDetailsByConfigRuleResponse(
        aggregateEvaluationResults:
            json.containsKey('AggregateEvaluationResults')
                ? (json['AggregateEvaluationResults'] as List)
                    .map((e) => AggregateEvaluationResult.fromJson(e))
                    .toList()
                : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class GetAggregateConfigRuleComplianceSummaryResponse {
  /// Groups the result based on ACCOUNT_ID or AWS_REGION.
  final String groupByKey;

  /// Returns a list of AggregateComplianceCounts object.
  final List<AggregateComplianceCount> aggregateComplianceCounts;

  /// The `nextToken` string returned on a previous page that you use to get the
  /// next page of results in a paginated response.
  final String nextToken;

  GetAggregateConfigRuleComplianceSummaryResponse({
    this.groupByKey,
    this.aggregateComplianceCounts,
    this.nextToken,
  });
  static GetAggregateConfigRuleComplianceSummaryResponse fromJson(
          Map<String, dynamic> json) =>
      GetAggregateConfigRuleComplianceSummaryResponse(
        groupByKey: json.containsKey('GroupByKey')
            ? json['GroupByKey'] as String
            : null,
        aggregateComplianceCounts: json.containsKey('AggregateComplianceCounts')
            ? (json['AggregateComplianceCounts'] as List)
                .map((e) => AggregateComplianceCount.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class GetAggregateDiscoveredResourceCountsResponse {
  /// The total number of resources that are present in an aggregator with the
  /// filters that you provide.
  final BigInt totalDiscoveredResources;

  /// The key passed into the request object. If `GroupByKey` is not provided,
  /// the result will be empty.
  final String groupByKey;

  /// Returns a list of GroupedResourceCount objects.
  final List<GroupedResourceCount> groupedResourceCounts;

  /// The `nextToken` string returned on a previous page that you use to get the
  /// next page of results in a paginated response.
  final String nextToken;

  GetAggregateDiscoveredResourceCountsResponse({
    @required this.totalDiscoveredResources,
    this.groupByKey,
    this.groupedResourceCounts,
    this.nextToken,
  });
  static GetAggregateDiscoveredResourceCountsResponse fromJson(
          Map<String, dynamic> json) =>
      GetAggregateDiscoveredResourceCountsResponse(
        totalDiscoveredResources: BigInt.from(json['TotalDiscoveredResources']),
        groupByKey: json.containsKey('GroupByKey')
            ? json['GroupByKey'] as String
            : null,
        groupedResourceCounts: json.containsKey('GroupedResourceCounts')
            ? (json['GroupedResourceCounts'] as List)
                .map((e) => GroupedResourceCount.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class GetAggregateResourceConfigResponse {
  /// Returns a `ConfigurationItem` object.
  final ConfigurationItem configurationItem;

  GetAggregateResourceConfigResponse({
    this.configurationItem,
  });
  static GetAggregateResourceConfigResponse fromJson(
          Map<String, dynamic> json) =>
      GetAggregateResourceConfigResponse(
        configurationItem: json.containsKey('ConfigurationItem')
            ? ConfigurationItem.fromJson(json['ConfigurationItem'])
            : null,
      );
}

class GetComplianceDetailsByConfigRuleResponse {
  /// Indicates whether the AWS resource complies with the specified AWS Config
  /// rule.
  final List<EvaluationResult> evaluationResults;

  /// The string that you use in a subsequent request to get the next page of
  /// results in a paginated response.
  final String nextToken;

  GetComplianceDetailsByConfigRuleResponse({
    this.evaluationResults,
    this.nextToken,
  });
  static GetComplianceDetailsByConfigRuleResponse fromJson(
          Map<String, dynamic> json) =>
      GetComplianceDetailsByConfigRuleResponse(
        evaluationResults: json.containsKey('EvaluationResults')
            ? (json['EvaluationResults'] as List)
                .map((e) => EvaluationResult.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class GetComplianceDetailsByResourceResponse {
  /// Indicates whether the specified AWS resource complies each AWS Config
  /// rule.
  final List<EvaluationResult> evaluationResults;

  /// The string that you use in a subsequent request to get the next page of
  /// results in a paginated response.
  final String nextToken;

  GetComplianceDetailsByResourceResponse({
    this.evaluationResults,
    this.nextToken,
  });
  static GetComplianceDetailsByResourceResponse fromJson(
          Map<String, dynamic> json) =>
      GetComplianceDetailsByResourceResponse(
        evaluationResults: json.containsKey('EvaluationResults')
            ? (json['EvaluationResults'] as List)
                .map((e) => EvaluationResult.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class GetComplianceSummaryByConfigRuleResponse {
  /// The number of AWS Config rules that are compliant and the number that are
  /// noncompliant, up to a maximum of 25 for each.
  final ComplianceSummary complianceSummary;

  GetComplianceSummaryByConfigRuleResponse({
    this.complianceSummary,
  });
  static GetComplianceSummaryByConfigRuleResponse fromJson(
          Map<String, dynamic> json) =>
      GetComplianceSummaryByConfigRuleResponse(
        complianceSummary: json.containsKey('ComplianceSummary')
            ? ComplianceSummary.fromJson(json['ComplianceSummary'])
            : null,
      );
}

class GetComplianceSummaryByResourceTypeResponse {
  /// The number of resources that are compliant and the number that are
  /// noncompliant. If one or more resource types were provided with the
  /// request, the numbers are returned for each resource type. The maximum
  /// number returned is 100.
  final List<ComplianceSummaryByResourceType> complianceSummariesByResourceType;

  GetComplianceSummaryByResourceTypeResponse({
    this.complianceSummariesByResourceType,
  });
  static GetComplianceSummaryByResourceTypeResponse fromJson(
          Map<String, dynamic> json) =>
      GetComplianceSummaryByResourceTypeResponse(
        complianceSummariesByResourceType:
            json.containsKey('ComplianceSummariesByResourceType')
                ? (json['ComplianceSummariesByResourceType'] as List)
                    .map((e) => ComplianceSummaryByResourceType.fromJson(e))
                    .toList()
                : null,
      );
}

class GetDiscoveredResourceCountsResponse {
  /// The total number of resources that AWS Config is recording in the region
  /// for your account. If you specify resource types in the request, AWS Config
  /// returns only the total number of resources for those resource types.
  ///
  ///  **Example**
  ///
  /// 1.  AWS Config is recording three resource types in the US East (Ohio)
  /// Region for your account: 25 EC2 instances, 20 IAM users, and 15 S3
  /// buckets, for a total of 60 resources.
  ///
  /// 2.  You make a call to the `GetDiscoveredResourceCounts` action and
  /// specify the resource type, `"AWS::EC2::Instances"`, in the request.
  ///
  /// 3.  AWS Config returns 25 for `totalDiscoveredResources`.
  final BigInt totalDiscoveredResources;

  /// The list of `ResourceCount` objects. Each object is listed in descending
  /// order by the number of resources.
  final List<ResourceCount> resourceCounts;

  /// The string that you use in a subsequent request to get the next page of
  /// results in a paginated response.
  final String nextToken;

  GetDiscoveredResourceCountsResponse({
    this.totalDiscoveredResources,
    this.resourceCounts,
    this.nextToken,
  });
  static GetDiscoveredResourceCountsResponse fromJson(
          Map<String, dynamic> json) =>
      GetDiscoveredResourceCountsResponse(
        totalDiscoveredResources: json.containsKey('totalDiscoveredResources')
            ? BigInt.from(json['totalDiscoveredResources'])
            : null,
        resourceCounts: json.containsKey('resourceCounts')
            ? (json['resourceCounts'] as List)
                .map((e) => ResourceCount.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

class GetOrganizationConfigRuleDetailedStatusResponse {
  /// A list of `MemberAccountStatus` objects.
  final List<MemberAccountStatus> organizationConfigRuleDetailedStatus;

  /// The `nextToken` string returned on a previous page that you use to get the
  /// next page of results in a paginated response.
  final String nextToken;

  GetOrganizationConfigRuleDetailedStatusResponse({
    this.organizationConfigRuleDetailedStatus,
    this.nextToken,
  });
  static GetOrganizationConfigRuleDetailedStatusResponse fromJson(
          Map<String, dynamic> json) =>
      GetOrganizationConfigRuleDetailedStatusResponse(
        organizationConfigRuleDetailedStatus:
            json.containsKey('OrganizationConfigRuleDetailedStatus')
                ? (json['OrganizationConfigRuleDetailedStatus'] as List)
                    .map((e) => MemberAccountStatus.fromJson(e))
                    .toList()
                : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// The output for the GetResourceConfigHistory action.
class GetResourceConfigHistoryResponse {
  /// A list that contains the configuration history of one or more resources.
  final List<ConfigurationItem> configurationItems;

  /// The string that you use in a subsequent request to get the next page of
  /// results in a paginated response.
  final String nextToken;

  GetResourceConfigHistoryResponse({
    this.configurationItems,
    this.nextToken,
  });
  static GetResourceConfigHistoryResponse fromJson(Map<String, dynamic> json) =>
      GetResourceConfigHistoryResponse(
        configurationItems: json.containsKey('configurationItems')
            ? (json['configurationItems'] as List)
                .map((e) => ConfigurationItem.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

/// The count of resources that are grouped by the group name.
class GroupedResourceCount {
  /// The name of the group that can be region, account ID, or resource type.
  /// For example, region1, region2 if the region was chosen as `GroupByKey`.
  final String groupName;

  /// The number of resources in the group.
  final BigInt resourceCount;

  GroupedResourceCount({
    @required this.groupName,
    @required this.resourceCount,
  });
  static GroupedResourceCount fromJson(Map<String, dynamic> json) =>
      GroupedResourceCount(
        groupName: json['GroupName'] as String,
        resourceCount: BigInt.from(json['ResourceCount']),
      );
}

class ListAggregateDiscoveredResourcesResponse {
  /// Returns a list of `ResourceIdentifiers` objects.
  final List<AggregateResourceIdentifier> resourceIdentifiers;

  /// The `nextToken` string returned on a previous page that you use to get the
  /// next page of results in a paginated response.
  final String nextToken;

  ListAggregateDiscoveredResourcesResponse({
    this.resourceIdentifiers,
    this.nextToken,
  });
  static ListAggregateDiscoveredResourcesResponse fromJson(
          Map<String, dynamic> json) =>
      ListAggregateDiscoveredResourcesResponse(
        resourceIdentifiers: json.containsKey('ResourceIdentifiers')
            ? (json['ResourceIdentifiers'] as List)
                .map((e) => AggregateResourceIdentifier.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListDiscoveredResourcesResponse {
  /// The details that identify a resource that is discovered by AWS Config,
  /// including the resource type, ID, and (if available) the custom resource
  /// name.
  final List<ResourceIdentifier> resourceIdentifiers;

  /// The string that you use in a subsequent request to get the next page of
  /// results in a paginated response.
  final String nextToken;

  ListDiscoveredResourcesResponse({
    this.resourceIdentifiers,
    this.nextToken,
  });
  static ListDiscoveredResourcesResponse fromJson(Map<String, dynamic> json) =>
      ListDiscoveredResourcesResponse(
        resourceIdentifiers: json.containsKey('resourceIdentifiers')
            ? (json['resourceIdentifiers'] as List)
                .map((e) => ResourceIdentifier.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

class ListTagsForResourceResponse {
  /// The tags for the resource.
  final List<Tag> tags;

  /// The `nextToken` string returned on a previous page that you use to get the
  /// next page of results in a paginated response.
  final String nextToken;

  ListTagsForResourceResponse({
    this.tags,
    this.nextToken,
  });
  static ListTagsForResourceResponse fromJson(Map<String, dynamic> json) =>
      ListTagsForResourceResponse(
        tags: json.containsKey('Tags')
            ? (json['Tags'] as List).map((e) => Tag.fromJson(e)).toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// Organization config rule creation or deletion status in each member account.
/// This includes the name of the rule, the status, error code and error message
/// when the rule creation or deletion failed.
class MemberAccountStatus {
  /// The 12-digit account ID of a member account.
  final String accountId;

  /// The name of config rule deployed in the member account.
  final String configRuleName;

  /// Indicates deployment status for config rule in the member account. When
  /// master account calls `PutOrganizationConfigRule` action for the first
  /// time, config rule status is created in the member account. When master
  /// account calls `PutOrganizationConfigRule` action for the second time,
  /// config rule status is updated in the member account. Config rule status is
  /// deleted when the master account deletes `OrganizationConfigRule` and
  /// disables service access for `config-multiaccountsetup.amazonaws.com`.
  ///
  ///  AWS Config sets the state of the rule to:
  ///
  /// *    `CREATE_SUCCESSFUL` when config rule has been created in the member
  /// account.
  ///
  /// *    `CREATE_IN_PROGRESS` when config rule is being created in the member
  /// account.
  ///
  /// *    `CREATE_FAILED` when config rule creation has failed in the member
  /// account.
  ///
  /// *    `DELETE_FAILED` when config rule deletion has failed in the member
  /// account.
  ///
  /// *    `DELETE_IN_PROGRESS` when config rule is being deleted in the member
  /// account.
  ///
  /// *    `DELETE_SUCCESSFUL` when config rule has been deleted in the member
  /// account.
  ///
  /// *    `UPDATE_SUCCESSFUL` when config rule has been updated in the member
  /// account.
  ///
  /// *    `UPDATE_IN_PROGRESS` when config rule is being updated in the member
  /// account.
  ///
  /// *    `UPDATE_FAILED` when config rule deletion has failed in the member
  /// account.
  final String memberAccountRuleStatus;

  /// An error code that is returned when config rule creation or deletion
  /// failed in the member account.
  final String errorCode;

  /// An error message indicating that config rule account creation or deletion
  /// has failed due to an error in the member account.
  final String errorMessage;

  /// The timestamp of the last status update.
  final DateTime lastUpdateTime;

  MemberAccountStatus({
    @required this.accountId,
    @required this.configRuleName,
    @required this.memberAccountRuleStatus,
    this.errorCode,
    this.errorMessage,
    this.lastUpdateTime,
  });
  static MemberAccountStatus fromJson(Map<String, dynamic> json) =>
      MemberAccountStatus(
        accountId: json['AccountId'] as String,
        configRuleName: json['ConfigRuleName'] as String,
        memberAccountRuleStatus: json['MemberAccountRuleStatus'] as String,
        errorCode:
            json.containsKey('ErrorCode') ? json['ErrorCode'] as String : null,
        errorMessage: json.containsKey('ErrorMessage')
            ? json['ErrorMessage'] as String
            : null,
        lastUpdateTime: json.containsKey('LastUpdateTime')
            ? DateTime.parse(json['LastUpdateTime'])
            : null,
      );
}

/// This object contains regions to set up the aggregator and an IAM role to
/// retrieve organization details.
class OrganizationAggregationSource {
  /// ARN of the IAM role used to retrieve AWS Organization details associated
  /// with the aggregator account.
  final String roleArn;

  /// The source regions being aggregated.
  final List<String> awsRegions;

  /// If true, aggregate existing AWS Config regions and future regions.
  final bool allAwsRegions;

  OrganizationAggregationSource({
    @required this.roleArn,
    this.awsRegions,
    this.allAwsRegions,
  });
  static OrganizationAggregationSource fromJson(Map<String, dynamic> json) =>
      OrganizationAggregationSource(
        roleArn: json['RoleArn'] as String,
        awsRegions: json.containsKey('AwsRegions')
            ? (json['AwsRegions'] as List).map((e) => e as String).toList()
            : null,
        allAwsRegions: json.containsKey('AllAwsRegions')
            ? json['AllAwsRegions'] as bool
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// An organization config rule that has information about config rules that AWS
/// Config creates in member accounts.
class OrganizationConfigRule {
  /// The name that you assign to organization config rule.
  final String organizationConfigRuleName;

  /// The Amazon Resource Name (ARN) of organization config rule.
  final String organizationConfigRuleArn;

  /// An `OrganizationManagedRuleMetadata` object.
  final OrganizationManagedRuleMetadata organizationManagedRuleMetadata;

  /// An `OrganizationCustomRuleMetadata` object.
  final OrganizationCustomRuleMetadata organizationCustomRuleMetadata;

  /// A comma-separated list of accounts excluded from organization config rule.
  final List<String> excludedAccounts;

  /// The timestamp of the last update.
  final DateTime lastUpdateTime;

  OrganizationConfigRule({
    @required this.organizationConfigRuleName,
    @required this.organizationConfigRuleArn,
    this.organizationManagedRuleMetadata,
    this.organizationCustomRuleMetadata,
    this.excludedAccounts,
    this.lastUpdateTime,
  });
  static OrganizationConfigRule fromJson(Map<String, dynamic> json) =>
      OrganizationConfigRule(
        organizationConfigRuleName:
            json['OrganizationConfigRuleName'] as String,
        organizationConfigRuleArn: json['OrganizationConfigRuleArn'] as String,
        organizationManagedRuleMetadata:
            json.containsKey('OrganizationManagedRuleMetadata')
                ? OrganizationManagedRuleMetadata.fromJson(
                    json['OrganizationManagedRuleMetadata'])
                : null,
        organizationCustomRuleMetadata:
            json.containsKey('OrganizationCustomRuleMetadata')
                ? OrganizationCustomRuleMetadata.fromJson(
                    json['OrganizationCustomRuleMetadata'])
                : null,
        excludedAccounts: json.containsKey('ExcludedAccounts')
            ? (json['ExcludedAccounts'] as List)
                .map((e) => e as String)
                .toList()
            : null,
        lastUpdateTime: json.containsKey('LastUpdateTime')
            ? DateTime.parse(json['LastUpdateTime'])
            : null,
      );
}

/// Returns the status for an organization config rule in an organization.
class OrganizationConfigRuleStatus {
  /// The name that you assign to organization config rule.
  final String organizationConfigRuleName;

  /// Indicates deployment status of an organization config rule. When master
  /// account calls PutOrganizationConfigRule action for the first time, config
  /// rule status is created in all the member accounts. When master account
  /// calls PutOrganizationConfigRule action for the second time, config rule
  /// status is updated in all the member accounts. Additionally, config rule
  /// status is updated when one or more member accounts join or leave an
  /// organization. Config rule status is deleted when the master account
  /// deletes OrganizationConfigRule in all the member accounts and disables
  /// service access for `config-multiaccountsetup.amazonaws.com`.
  ///
  /// AWS Config sets the state of the rule to:
  ///
  /// *    `CREATE_SUCCESSFUL` when an organization config rule has been
  /// successfully created in all the member accounts.
  ///
  /// *    `CREATE_IN_PROGRESS` when an organization config rule creation is in
  /// progress.
  ///
  /// *    `CREATE_FAILED` when an organization config rule creation failed in
  /// one or more member accounts within that organization.
  ///
  /// *    `DELETE_FAILED` when an organization config rule deletion failed in
  /// one or more member accounts within that organization.
  ///
  /// *    `DELETE_IN_PROGRESS` when an organization config rule deletion is in
  /// progress.
  ///
  /// *    `DELETE_SUCCESSFUL` when an organization config rule has been
  /// successfully deleted from all the member accounts.
  ///
  /// *    `UPDATE_SUCCESSFUL` when an organization config rule has been
  /// successfully updated in all the member accounts.
  ///
  /// *    `UPDATE_IN_PROGRESS` when an organization config rule update is in
  /// progress.
  ///
  /// *    `UPDATE_FAILED` when an organization config rule update failed in one
  /// or more member accounts within that organization.
  final String organizationRuleStatus;

  /// An error code that is returned when organization config rule creation or
  /// deletion has failed.
  final String errorCode;

  /// An error message indicating that organization config rule creation or
  /// deletion failed due to an error.
  final String errorMessage;

  /// The timestamp of the last update.
  final DateTime lastUpdateTime;

  OrganizationConfigRuleStatus({
    @required this.organizationConfigRuleName,
    @required this.organizationRuleStatus,
    this.errorCode,
    this.errorMessage,
    this.lastUpdateTime,
  });
  static OrganizationConfigRuleStatus fromJson(Map<String, dynamic> json) =>
      OrganizationConfigRuleStatus(
        organizationConfigRuleName:
            json['OrganizationConfigRuleName'] as String,
        organizationRuleStatus: json['OrganizationRuleStatus'] as String,
        errorCode:
            json.containsKey('ErrorCode') ? json['ErrorCode'] as String : null,
        errorMessage: json.containsKey('ErrorMessage')
            ? json['ErrorMessage'] as String
            : null,
        lastUpdateTime: json.containsKey('LastUpdateTime')
            ? DateTime.parse(json['LastUpdateTime'])
            : null,
      );
}

/// An object that specifies organization custom rule metadata such as resource
/// type, resource ID of AWS resource, Lamdba function ARN, and organization
/// trigger types that trigger AWS Config to evaluate your AWS resources against
/// a rule. It also provides the frequency with which you want AWS Config to run
/// evaluations for the rule if the trigger type is periodic.
class OrganizationCustomRuleMetadata {
  /// The description that you provide for organization config rule.
  final String description;

  /// The lambda function ARN.
  final String lambdaFunctionArn;

  /// The type of notification that triggers AWS Config to run an evaluation for
  /// a rule. You can specify the following notification types:
  ///
  /// *    `ConfigurationItemChangeNotification` - Triggers an evaluation when
  /// AWS Config delivers a configuration item as a result of a resource change.
  ///
  /// *    `OversizedConfigurationItemChangeNotification` - Triggers an
  /// evaluation when AWS Config delivers an oversized configuration item. AWS
  /// Config may generate this notification type when a resource changes and the
  /// notification exceeds the maximum size allowed by Amazon SNS.
  ///
  /// *    `ScheduledNotification` - Triggers a periodic evaluation at the
  /// frequency specified for `MaximumExecutionFrequency`.
  final List<String> organizationConfigRuleTriggerTypes;

  /// A string, in JSON format, that is passed to organization config rule
  /// Lambda function.
  final String inputParameters;

  /// The maximum frequency with which AWS Config runs evaluations for a rule.
  /// Your custom rule is triggered when AWS Config delivers the configuration
  /// snapshot. For more information, see ConfigSnapshotDeliveryProperties.
  ///
  ///
  ///
  /// By default, rules with a periodic trigger are evaluated every 24 hours. To
  /// change the frequency, specify a valid value for the
  /// `MaximumExecutionFrequency` parameter.
  final String maximumExecutionFrequency;

  /// The type of the AWS resource that was evaluated.
  final List<String> resourceTypesScope;

  /// The ID of the AWS resource that was evaluated.
  final String resourceIdScope;

  /// One part of a key-value pair that make up a tag. A key is a general label
  /// that acts like a category for more specific tag values.
  final String tagKeyScope;

  /// The optional part of a key-value pair that make up a tag. A value acts as
  /// a descriptor within a tag category (key).
  final String tagValueScope;

  OrganizationCustomRuleMetadata({
    this.description,
    @required this.lambdaFunctionArn,
    @required this.organizationConfigRuleTriggerTypes,
    this.inputParameters,
    this.maximumExecutionFrequency,
    this.resourceTypesScope,
    this.resourceIdScope,
    this.tagKeyScope,
    this.tagValueScope,
  });
  static OrganizationCustomRuleMetadata fromJson(Map<String, dynamic> json) =>
      OrganizationCustomRuleMetadata(
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        lambdaFunctionArn: json['LambdaFunctionArn'] as String,
        organizationConfigRuleTriggerTypes:
            (json['OrganizationConfigRuleTriggerTypes'] as List)
                .map((e) => e as String)
                .toList(),
        inputParameters: json.containsKey('InputParameters')
            ? json['InputParameters'] as String
            : null,
        maximumExecutionFrequency: json.containsKey('MaximumExecutionFrequency')
            ? json['MaximumExecutionFrequency'] as String
            : null,
        resourceTypesScope: json.containsKey('ResourceTypesScope')
            ? (json['ResourceTypesScope'] as List)
                .map((e) => e as String)
                .toList()
            : null,
        resourceIdScope: json.containsKey('ResourceIdScope')
            ? json['ResourceIdScope'] as String
            : null,
        tagKeyScope: json.containsKey('TagKeyScope')
            ? json['TagKeyScope'] as String
            : null,
        tagValueScope: json.containsKey('TagValueScope')
            ? json['TagValueScope'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// An object that specifies organization managed rule metadata such as resource
/// type and ID of AWS resource along with the rule identifier. It also provides
/// the frequency with which you want AWS Config to run evaluations for the rule
/// if the trigger type is periodic.
class OrganizationManagedRuleMetadata {
  /// The description that you provide for organization config rule.
  final String description;

  /// For organization config managed rules, a predefined identifier from a
  /// list. For example, `IAM_PASSWORD_POLICY` is a managed rule. To reference a
  /// managed rule, see
  /// [Using AWS Managed Config Rules](https://docs.aws.amazon.com/config/latest/developerguide/evaluate-config_use-managed-rules.html).
  final String ruleIdentifier;

  /// A string, in JSON format, that is passed to organization config rule
  /// Lambda function.
  final String inputParameters;

  /// The maximum frequency with which AWS Config runs evaluations for a rule.
  /// You are using an AWS managed rule that is triggered at a periodic
  /// frequency.
  ///
  ///
  ///
  /// By default, rules with a periodic trigger are evaluated every 24 hours. To
  /// change the frequency, specify a valid value for the
  /// `MaximumExecutionFrequency` parameter.
  final String maximumExecutionFrequency;

  /// The type of the AWS resource that was evaluated.
  final List<String> resourceTypesScope;

  /// The ID of the AWS resource that was evaluated.
  final String resourceIdScope;

  /// One part of a key-value pair that make up a tag. A key is a general label
  /// that acts like a category for more specific tag values.
  final String tagKeyScope;

  /// The optional part of a key-value pair that make up a tag. A value acts as
  /// a descriptor within a tag category (key).
  final String tagValueScope;

  OrganizationManagedRuleMetadata({
    this.description,
    @required this.ruleIdentifier,
    this.inputParameters,
    this.maximumExecutionFrequency,
    this.resourceTypesScope,
    this.resourceIdScope,
    this.tagKeyScope,
    this.tagValueScope,
  });
  static OrganizationManagedRuleMetadata fromJson(Map<String, dynamic> json) =>
      OrganizationManagedRuleMetadata(
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        ruleIdentifier: json['RuleIdentifier'] as String,
        inputParameters: json.containsKey('InputParameters')
            ? json['InputParameters'] as String
            : null,
        maximumExecutionFrequency: json.containsKey('MaximumExecutionFrequency')
            ? json['MaximumExecutionFrequency'] as String
            : null,
        resourceTypesScope: json.containsKey('ResourceTypesScope')
            ? (json['ResourceTypesScope'] as List)
                .map((e) => e as String)
                .toList()
            : null,
        resourceIdScope: json.containsKey('ResourceIdScope')
            ? json['ResourceIdScope'] as String
            : null,
        tagKeyScope: json.containsKey('TagKeyScope')
            ? json['TagKeyScope'] as String
            : null,
        tagValueScope: json.containsKey('TagValueScope')
            ? json['TagValueScope'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// An object that represents the account ID and region of an aggregator account
/// that is requesting authorization but is not yet authorized.
class PendingAggregationRequest {
  /// The 12-digit account ID of the account requesting to aggregate data.
  final String requesterAccountId;

  /// The region requesting to aggregate data.
  final String requesterAwsRegion;

  PendingAggregationRequest({
    this.requesterAccountId,
    this.requesterAwsRegion,
  });
  static PendingAggregationRequest fromJson(Map<String, dynamic> json) =>
      PendingAggregationRequest(
        requesterAccountId: json.containsKey('RequesterAccountId')
            ? json['RequesterAccountId'] as String
            : null,
        requesterAwsRegion: json.containsKey('RequesterAwsRegion')
            ? json['RequesterAwsRegion'] as String
            : null,
      );
}

class PutAggregationAuthorizationResponse {
  /// Returns an AggregationAuthorization object.
  final AggregationAuthorization aggregationAuthorization;

  PutAggregationAuthorizationResponse({
    this.aggregationAuthorization,
  });
  static PutAggregationAuthorizationResponse fromJson(
          Map<String, dynamic> json) =>
      PutAggregationAuthorizationResponse(
        aggregationAuthorization: json.containsKey('AggregationAuthorization')
            ? AggregationAuthorization.fromJson(
                json['AggregationAuthorization'])
            : null,
      );
}

class PutConfigurationAggregatorResponse {
  /// Returns a ConfigurationAggregator object.
  final ConfigurationAggregator configurationAggregator;

  PutConfigurationAggregatorResponse({
    this.configurationAggregator,
  });
  static PutConfigurationAggregatorResponse fromJson(
          Map<String, dynamic> json) =>
      PutConfigurationAggregatorResponse(
        configurationAggregator: json.containsKey('ConfigurationAggregator')
            ? ConfigurationAggregator.fromJson(json['ConfigurationAggregator'])
            : null,
      );
}

class PutEvaluationsResponse {
  /// Requests that failed because of a client or server error.
  final List<Evaluation> failedEvaluations;

  PutEvaluationsResponse({
    this.failedEvaluations,
  });
  static PutEvaluationsResponse fromJson(Map<String, dynamic> json) =>
      PutEvaluationsResponse(
        failedEvaluations: json.containsKey('FailedEvaluations')
            ? (json['FailedEvaluations'] as List)
                .map((e) => Evaluation.fromJson(e))
                .toList()
            : null,
      );
}

class PutOrganizationConfigRuleResponse {
  /// The Amazon Resource Name (ARN) of an organization config rule.
  final String organizationConfigRuleArn;

  PutOrganizationConfigRuleResponse({
    this.organizationConfigRuleArn,
  });
  static PutOrganizationConfigRuleResponse fromJson(
          Map<String, dynamic> json) =>
      PutOrganizationConfigRuleResponse(
        organizationConfigRuleArn: json.containsKey('OrganizationConfigRuleArn')
            ? json['OrganizationConfigRuleArn'] as String
            : null,
      );
}

class PutRemediationConfigurationsResponse {
  /// Returns a list of failed remediation batch objects.
  final List<FailedRemediationBatch> failedBatches;

  PutRemediationConfigurationsResponse({
    this.failedBatches,
  });
  static PutRemediationConfigurationsResponse fromJson(
          Map<String, dynamic> json) =>
      PutRemediationConfigurationsResponse(
        failedBatches: json.containsKey('FailedBatches')
            ? (json['FailedBatches'] as List)
                .map((e) => FailedRemediationBatch.fromJson(e))
                .toList()
            : null,
      );
}

class PutRemediationExceptionsResponse {
  /// Returns a list of failed remediation exceptions batch objects. Each object
  /// in the batch consists of a list of failed items and failure messages.
  final List<FailedRemediationExceptionBatch> failedBatches;

  PutRemediationExceptionsResponse({
    this.failedBatches,
  });
  static PutRemediationExceptionsResponse fromJson(Map<String, dynamic> json) =>
      PutRemediationExceptionsResponse(
        failedBatches: json.containsKey('FailedBatches')
            ? (json['FailedBatches'] as List)
                .map((e) => FailedRemediationExceptionBatch.fromJson(e))
                .toList()
            : null,
      );
}

class PutRetentionConfigurationResponse {
  /// Returns a retention configuration object.
  final RetentionConfiguration retentionConfiguration;

  PutRetentionConfigurationResponse({
    this.retentionConfiguration,
  });
  static PutRetentionConfigurationResponse fromJson(
          Map<String, dynamic> json) =>
      PutRetentionConfigurationResponse(
        retentionConfiguration: json.containsKey('RetentionConfiguration')
            ? RetentionConfiguration.fromJson(json['RetentionConfiguration'])
            : null,
      );
}

/// Details about the query.
class QueryInfo {
  /// Returns a `FieldInfo` object.
  final List<FieldInfo> selectFields;

  QueryInfo({
    this.selectFields,
  });
  static QueryInfo fromJson(Map<String, dynamic> json) => QueryInfo(
        selectFields: json.containsKey('SelectFields')
            ? (json['SelectFields'] as List)
                .map((e) => FieldInfo.fromJson(e))
                .toList()
            : null,
      );
}

/// Specifies the types of AWS resource for which AWS Config records
/// configuration changes.
///
/// In the recording group, you specify whether all supported types or specific
/// types of resources are recorded.
///
/// By default, AWS Config records configuration changes for all supported types
/// of regional resources that AWS Config discovers in the region in which it is
/// running. Regional resources are tied to a region and can be used only in
/// that region. Examples of regional resources are EC2 instances and EBS
/// volumes.
///
/// You can also have AWS Config record configuration changes for supported
/// types of global resources (for example, IAM resources). Global resources are
/// not tied to an individual region and can be used in all regions.
///
///  The configuration details for any global resource are the same in all
/// regions. If you customize AWS Config in multiple regions to record global
/// resources, it will create multiple configuration items each time a global
/// resource changes: one configuration item for each region. These
/// configuration items will contain identical data. To prevent duplicate
/// configuration items, you should consider customizing AWS Config in only one
/// region to record global resources, unless you want the configuration items
/// to be available in multiple regions.
///
/// If you don't want AWS Config to record all resources, you can specify which
/// types of resources it will record with the `resourceTypes` parameter.
///
/// For a list of supported resource types, see
/// [Supported Resource Types](https://docs.aws.amazon.com/config/latest/developerguide/resource-config-reference.html#supported-resources).
///
/// For more information, see
/// [Selecting Which Resources AWS Config Records](https://docs.aws.amazon.com/config/latest/developerguide/select-resources.html).
class RecordingGroup {
  /// Specifies whether AWS Config records configuration changes for every
  /// supported type of regional resource.
  ///
  /// If you set this option to `true`, when AWS Config adds support for a new
  /// type of regional resource, it starts recording resources of that type
  /// automatically.
  ///
  /// If you set this option to `true`, you cannot enumerate a list of
  /// `resourceTypes`.
  final bool allSupported;

  /// Specifies whether AWS Config includes all supported types of global
  /// resources (for example, IAM resources) with the resources that it records.
  ///
  /// Before you can set this option to `true`, you must set the `allSupported`
  /// option to `true`.
  ///
  /// If you set this option to `true`, when AWS Config adds support for a new
  /// type of global resource, it starts recording resources of that type
  /// automatically.
  ///
  /// The configuration details for any global resource are the same in all
  /// regions. To prevent duplicate configuration items, you should consider
  /// customizing AWS Config in only one region to record global resources.
  final bool includeGlobalResourceTypes;

  /// A comma-separated list that specifies the types of AWS resources for which
  /// AWS Config records configuration changes (for example,
  /// `AWS::EC2::Instance` or `AWS::CloudTrail::Trail`).
  ///
  /// Before you can set this option to `true`, you must set the `allSupported`
  /// option to `false`.
  ///
  /// If you set this option to `true`, when AWS Config adds support for a new
  /// type of resource, it will not record resources of that type unless you
  /// manually add that type to your recording group.
  ///
  /// For a list of valid `resourceTypes` values, see the **resourceType Value**
  /// column in
  /// [Supported AWS Resource Types](https://docs.aws.amazon.com/config/latest/developerguide/resource-config-reference.html#supported-resources).
  final List<String> resourceTypes;

  RecordingGroup({
    this.allSupported,
    this.includeGlobalResourceTypes,
    this.resourceTypes,
  });
  static RecordingGroup fromJson(Map<String, dynamic> json) => RecordingGroup(
        allSupported: json.containsKey('allSupported')
            ? json['allSupported'] as bool
            : null,
        includeGlobalResourceTypes:
            json.containsKey('includeGlobalResourceTypes')
                ? json['includeGlobalResourceTypes'] as bool
                : null,
        resourceTypes: json.containsKey('resourceTypes')
            ? (json['resourceTypes'] as List).map((e) => e as String).toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The relationship of the related resource to the main resource.
class Relationship {
  /// The resource type of the related resource.
  final String resourceType;

  /// The ID of the related resource (for example, `sg-xxxxxx`).
  final String resourceId;

  /// The custom name of the related resource, if available.
  final String resourceName;

  /// The type of relationship with the related resource.
  final String relationshipName;

  Relationship({
    this.resourceType,
    this.resourceId,
    this.resourceName,
    this.relationshipName,
  });
  static Relationship fromJson(Map<String, dynamic> json) => Relationship(
        resourceType: json.containsKey('resourceType')
            ? json['resourceType'] as String
            : null,
        resourceId: json.containsKey('resourceId')
            ? json['resourceId'] as String
            : null,
        resourceName: json.containsKey('resourceName')
            ? json['resourceName'] as String
            : null,
        relationshipName: json.containsKey('relationshipName')
            ? json['relationshipName'] as String
            : null,
      );
}

/// An object that represents the details about the remediation configuration
/// that includes the remediation action, parameters, and data to execute the
/// action.
class RemediationConfiguration {
  /// The name of the AWS Config rule.
  final String configRuleName;

  /// The type of the target. Target executes remediation. For example, SSM
  /// document.
  final String targetType;

  /// Target ID is the name of the public document.
  final String targetId;

  /// Version of the target. For example, version of the SSM document.
  final String targetVersion;

  /// An object of the RemediationParameterValue.
  final Map<String, RemediationParameterValue> parameters;

  /// The type of a resource.
  final String resourceType;

  /// The remediation is triggered automatically.
  final bool automatic;

  /// An ExecutionControls object.
  final ExecutionControls executionControls;

  /// The maximum number of failed attempts for auto-remediation. If you do not
  /// select a number, the default is 5.
  ///
  /// For example, if you specify MaximumAutomaticAttempts as 5 with
  /// RetryAttemptsSeconds as 50 seconds, AWS Config throws an exception after
  /// the 5th failed attempt within 50 seconds.
  final int maximumAutomaticAttempts;

  /// Maximum time in seconds that AWS Config runs auto-remediation. If you do
  /// not select a number, the default is 60 seconds.
  ///
  /// For example, if you specify RetryAttemptsSeconds as 50 seconds and
  /// MaximumAutomaticAttempts as 5, AWS Config will run auto-remediations 5
  /// times within 50 seconds before throwing an exception.
  final BigInt retryAttemptSeconds;

  /// Amazon Resource Name (ARN) of remediation configuration.
  final String arn;

  /// Name of the service that owns the service linked rule, if applicable.
  final String createdByService;

  RemediationConfiguration({
    @required this.configRuleName,
    @required this.targetType,
    @required this.targetId,
    this.targetVersion,
    this.parameters,
    this.resourceType,
    this.automatic,
    this.executionControls,
    this.maximumAutomaticAttempts,
    this.retryAttemptSeconds,
    this.arn,
    this.createdByService,
  });
  static RemediationConfiguration fromJson(Map<String, dynamic> json) =>
      RemediationConfiguration(
        configRuleName: json['ConfigRuleName'] as String,
        targetType: json['TargetType'] as String,
        targetId: json['TargetId'] as String,
        targetVersion: json.containsKey('TargetVersion')
            ? json['TargetVersion'] as String
            : null,
        parameters: json.containsKey('Parameters')
            ? (json['Parameters'] as Map).map((k, v) =>
                MapEntry(k as String, RemediationParameterValue.fromJson(v)))
            : null,
        resourceType: json.containsKey('ResourceType')
            ? json['ResourceType'] as String
            : null,
        automatic:
            json.containsKey('Automatic') ? json['Automatic'] as bool : null,
        executionControls: json.containsKey('ExecutionControls')
            ? ExecutionControls.fromJson(json['ExecutionControls'])
            : null,
        maximumAutomaticAttempts: json.containsKey('MaximumAutomaticAttempts')
            ? json['MaximumAutomaticAttempts'] as int
            : null,
        retryAttemptSeconds: json.containsKey('RetryAttemptSeconds')
            ? BigInt.from(json['RetryAttemptSeconds'])
            : null,
        arn: json.containsKey('Arn') ? json['Arn'] as String : null,
        createdByService: json.containsKey('CreatedByService')
            ? json['CreatedByService'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// An object that represents the details about the remediation exception. The
/// details include the rule name, an explanation of an exception, the time when
/// the exception will be deleted, the resource ID, and resource type.
class RemediationException {
  /// The name of the AWS Config rule.
  final String configRuleName;

  /// The type of a resource.
  final String resourceType;

  /// The ID of the resource (for example., sg-xxxxxx).
  final String resourceId;

  /// An explanation of an remediation exception.
  final String message;

  /// The time when the remediation exception will be deleted.
  final DateTime expirationTime;

  RemediationException({
    @required this.configRuleName,
    @required this.resourceType,
    @required this.resourceId,
    this.message,
    this.expirationTime,
  });
  static RemediationException fromJson(Map<String, dynamic> json) =>
      RemediationException(
        configRuleName: json['ConfigRuleName'] as String,
        resourceType: json['ResourceType'] as String,
        resourceId: json['ResourceId'] as String,
        message: json.containsKey('Message') ? json['Message'] as String : null,
        expirationTime: json.containsKey('ExpirationTime')
            ? DateTime.parse(json['ExpirationTime'])
            : null,
      );
}

/// The details that identify a resource within AWS Config, including the
/// resource type and resource ID.
class RemediationExceptionResourceKey {
  /// The type of a resource.
  final String resourceType;

  /// The ID of the resource (for example., sg-xxxxxx).
  final String resourceId;

  RemediationExceptionResourceKey({
    this.resourceType,
    this.resourceId,
  });
  static RemediationExceptionResourceKey fromJson(Map<String, dynamic> json) =>
      RemediationExceptionResourceKey(
        resourceType: json.containsKey('ResourceType')
            ? json['ResourceType'] as String
            : null,
        resourceId: json.containsKey('ResourceId')
            ? json['ResourceId'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides details of the current status of the invoked remediation action for
/// that resource.
class RemediationExecutionStatus {
  final ResourceKey resourceKey;

  /// ENUM of the values.
  final String state;

  /// Details of every step.
  final List<RemediationExecutionStep> stepDetails;

  /// Start time when the remediation was executed.
  final DateTime invocationTime;

  /// The time when the remediation execution was last updated.
  final DateTime lastUpdatedTime;

  RemediationExecutionStatus({
    this.resourceKey,
    this.state,
    this.stepDetails,
    this.invocationTime,
    this.lastUpdatedTime,
  });
  static RemediationExecutionStatus fromJson(Map<String, dynamic> json) =>
      RemediationExecutionStatus(
        resourceKey: json.containsKey('ResourceKey')
            ? ResourceKey.fromJson(json['ResourceKey'])
            : null,
        state: json.containsKey('State') ? json['State'] as String : null,
        stepDetails: json.containsKey('StepDetails')
            ? (json['StepDetails'] as List)
                .map((e) => RemediationExecutionStep.fromJson(e))
                .toList()
            : null,
        invocationTime: json.containsKey('InvocationTime')
            ? DateTime.parse(json['InvocationTime'])
            : null,
        lastUpdatedTime: json.containsKey('LastUpdatedTime')
            ? DateTime.parse(json['LastUpdatedTime'])
            : null,
      );
}

/// Name of the step from the SSM document.
class RemediationExecutionStep {
  /// The details of the step.
  final String name;

  /// The valid status of the step.
  final String state;

  /// An error message if the step was interrupted during execution.
  final String errorMessage;

  /// The time when the step started.
  final DateTime startTime;

  /// The time when the step stopped.
  final DateTime stopTime;

  RemediationExecutionStep({
    this.name,
    this.state,
    this.errorMessage,
    this.startTime,
    this.stopTime,
  });
  static RemediationExecutionStep fromJson(Map<String, dynamic> json) =>
      RemediationExecutionStep(
        name: json.containsKey('Name') ? json['Name'] as String : null,
        state: json.containsKey('State') ? json['State'] as String : null,
        errorMessage: json.containsKey('ErrorMessage')
            ? json['ErrorMessage'] as String
            : null,
        startTime: json.containsKey('StartTime')
            ? DateTime.parse(json['StartTime'])
            : null,
        stopTime: json.containsKey('StopTime')
            ? DateTime.parse(json['StopTime'])
            : null,
      );
}

/// The value is either a dynamic (resource) value or a static value. You must
/// select either a dynamic value or a static value.
class RemediationParameterValue {
  /// The value is dynamic and changes at run-time.
  final ResourceValue resourceValue;

  /// The value is static and does not change at run-time.
  final StaticValue staticValue;

  RemediationParameterValue({
    this.resourceValue,
    this.staticValue,
  });
  static RemediationParameterValue fromJson(Map<String, dynamic> json) =>
      RemediationParameterValue(
        resourceValue: json.containsKey('ResourceValue')
            ? ResourceValue.fromJson(json['ResourceValue'])
            : null,
        staticValue: json.containsKey('StaticValue')
            ? StaticValue.fromJson(json['StaticValue'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// An object that contains the resource type and the number of resources.
class ResourceCount {
  /// The resource type (for example, `"AWS::EC2::Instance"`).
  final String resourceType;

  /// The number of resources.
  final BigInt count;

  ResourceCount({
    this.resourceType,
    this.count,
  });
  static ResourceCount fromJson(Map<String, dynamic> json) => ResourceCount(
        resourceType: json.containsKey('resourceType')
            ? json['resourceType'] as String
            : null,
        count: json.containsKey('count') ? BigInt.from(json['count']) : null,
      );
}

/// Filters the resource count based on account ID, region, and resource type.
class ResourceCountFilters {
  /// The type of the AWS resource.
  final String resourceType;

  /// The 12-digit ID of the account.
  final String accountId;

  /// The region where the account is located.
  final String region;

  ResourceCountFilters({
    this.resourceType,
    this.accountId,
    this.region,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Filters the results by resource account ID, region, resource ID, and
/// resource name.
class ResourceFilters {
  /// The 12-digit source account ID.
  final String accountId;

  /// The ID of the resource.
  final String resourceId;

  /// The name of the resource.
  final String resourceName;

  /// The source region.
  final String region;

  ResourceFilters({
    this.accountId,
    this.resourceId,
    this.resourceName,
    this.region,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The details that identify a resource that is discovered by AWS Config,
/// including the resource type, ID, and (if available) the custom resource
/// name.
class ResourceIdentifier {
  /// The type of resource.
  final String resourceType;

  /// The ID of the resource (for example, `sg-xxxxxx`).
  final String resourceId;

  /// The custom name of the resource (if available).
  final String resourceName;

  /// The time that the resource was deleted.
  final DateTime resourceDeletionTime;

  ResourceIdentifier({
    this.resourceType,
    this.resourceId,
    this.resourceName,
    this.resourceDeletionTime,
  });
  static ResourceIdentifier fromJson(Map<String, dynamic> json) =>
      ResourceIdentifier(
        resourceType: json.containsKey('resourceType')
            ? json['resourceType'] as String
            : null,
        resourceId: json.containsKey('resourceId')
            ? json['resourceId'] as String
            : null,
        resourceName: json.containsKey('resourceName')
            ? json['resourceName'] as String
            : null,
        resourceDeletionTime: json.containsKey('resourceDeletionTime')
            ? DateTime.parse(json['resourceDeletionTime'])
            : null,
      );
}

/// The details that identify a resource within AWS Config, including the
/// resource type and resource ID.
class ResourceKey {
  /// The resource type.
  final String resourceType;

  /// The ID of the resource (for example., sg-xxxxxx).
  final String resourceId;

  ResourceKey({
    @required this.resourceType,
    @required this.resourceId,
  });
  static ResourceKey fromJson(Map<String, dynamic> json) => ResourceKey(
        resourceType: json['resourceType'] as String,
        resourceId: json['resourceId'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The dynamic value of the resource.
class ResourceValue {
  /// The value is a resource ID.
  final String value;

  ResourceValue({
    @required this.value,
  });
  static ResourceValue fromJson(Map<String, dynamic> json) => ResourceValue(
        value: json['Value'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// An object with the name of the retention configuration and the retention
/// period in days. The object stores the configuration for data retention in
/// AWS Config.
class RetentionConfiguration {
  /// The name of the retention configuration object.
  final String name;

  /// Number of days AWS Config stores your historical information.
  ///
  ///
  ///
  /// Currently, only applicable to the configuration item history.
  final int retentionPeriodInDays;

  RetentionConfiguration({
    @required this.name,
    @required this.retentionPeriodInDays,
  });
  static RetentionConfiguration fromJson(Map<String, dynamic> json) =>
      RetentionConfiguration(
        name: json['Name'] as String,
        retentionPeriodInDays: json['RetentionPeriodInDays'] as int,
      );
}

/// Defines which resources trigger an evaluation for an AWS Config rule. The
/// scope can include one or more resource types, a combination of a tag key and
/// value, or a combination of one resource type and one resource ID. Specify a
/// scope to constrain which resources trigger an evaluation for a rule.
/// Otherwise, evaluations for the rule are triggered when any resource in your
/// recording group changes in configuration.
class Scope {
  /// The resource types of only those AWS resources that you want to trigger an
  /// evaluation for the rule. You can only specify one type if you also specify
  /// a resource ID for `ComplianceResourceId`.
  final List<String> complianceResourceTypes;

  /// The tag key that is applied to only those AWS resources that you want to
  /// trigger an evaluation for the rule.
  final String tagKey;

  /// The tag value applied to only those AWS resources that you want to trigger
  /// an evaluation for the rule. If you specify a value for `TagValue`, you
  /// must also specify a value for `TagKey`.
  final String tagValue;

  /// The ID of the only AWS resource that you want to trigger an evaluation for
  /// the rule. If you specify a resource ID, you must specify one resource type
  /// for `ComplianceResourceTypes`.
  final String complianceResourceId;

  Scope({
    this.complianceResourceTypes,
    this.tagKey,
    this.tagValue,
    this.complianceResourceId,
  });
  static Scope fromJson(Map<String, dynamic> json) => Scope(
        complianceResourceTypes: json.containsKey('ComplianceResourceTypes')
            ? (json['ComplianceResourceTypes'] as List)
                .map((e) => e as String)
                .toList()
            : null,
        tagKey: json.containsKey('TagKey') ? json['TagKey'] as String : null,
        tagValue:
            json.containsKey('TagValue') ? json['TagValue'] as String : null,
        complianceResourceId: json.containsKey('ComplianceResourceId')
            ? json['ComplianceResourceId'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class SelectResourceConfigResponse {
  /// Returns the results for the SQL query.
  final List<String> results;

  /// Returns the `QueryInfo` object.
  final QueryInfo queryInfo;

  /// The `nextToken` string returned in a previous request that you use to
  /// request the next page of results in a paginated response.
  final String nextToken;

  SelectResourceConfigResponse({
    this.results,
    this.queryInfo,
    this.nextToken,
  });
  static SelectResourceConfigResponse fromJson(Map<String, dynamic> json) =>
      SelectResourceConfigResponse(
        results: json.containsKey('Results')
            ? (json['Results'] as List).map((e) => e as String).toList()
            : null,
        queryInfo: json.containsKey('QueryInfo')
            ? QueryInfo.fromJson(json['QueryInfo'])
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// Provides the AWS Config rule owner (AWS or customer), the rule identifier,
/// and the events that trigger the evaluation of your AWS resources.
class Source {
  /// Indicates whether AWS or the customer owns and manages the AWS Config
  /// rule.
  final String owner;

  /// For AWS Config managed rules, a predefined identifier from a list. For
  /// example, `IAM_PASSWORD_POLICY` is a managed rule. To reference a managed
  /// rule, see
  /// [Using AWS Managed Config Rules](https://docs.aws.amazon.com/config/latest/developerguide/evaluate-config_use-managed-rules.html).
  ///
  /// For custom rules, the identifier is the Amazon Resource Name (ARN) of the
  /// rule's AWS Lambda function, such as
  /// `arn:aws:lambda:us-east-2:123456789012:function:custom_rule_name`.
  final String sourceIdentifier;

  /// Provides the source and type of the event that causes AWS Config to
  /// evaluate your AWS resources.
  final List<SourceDetail> sourceDetails;

  Source({
    @required this.owner,
    @required this.sourceIdentifier,
    this.sourceDetails,
  });
  static Source fromJson(Map<String, dynamic> json) => Source(
        owner: json['Owner'] as String,
        sourceIdentifier: json['SourceIdentifier'] as String,
        sourceDetails: json.containsKey('SourceDetails')
            ? (json['SourceDetails'] as List)
                .map((e) => SourceDetail.fromJson(e))
                .toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides the source and the message types that trigger AWS Config to
/// evaluate your AWS resources against a rule. It also provides the frequency
/// with which you want AWS Config to run evaluations for the rule if the
/// trigger type is periodic. You can specify the parameter values for
/// `SourceDetail` only for custom rules.
class SourceDetail {
  /// The source of the event, such as an AWS service, that triggers AWS Config
  /// to evaluate your AWS resources.
  final String eventSource;

  /// The type of notification that triggers AWS Config to run an evaluation for
  /// a rule. You can specify the following notification types:
  ///
  /// *    `ConfigurationItemChangeNotification` - Triggers an evaluation when
  /// AWS Config delivers a configuration item as a result of a resource change.
  ///
  /// *    `OversizedConfigurationItemChangeNotification` - Triggers an
  /// evaluation when AWS Config delivers an oversized configuration item. AWS
  /// Config may generate this notification type when a resource changes and the
  /// notification exceeds the maximum size allowed by Amazon SNS.
  ///
  /// *    `ScheduledNotification` - Triggers a periodic evaluation at the
  /// frequency specified for `MaximumExecutionFrequency`.
  ///
  /// *    `ConfigurationSnapshotDeliveryCompleted` - Triggers a periodic
  /// evaluation when AWS Config delivers a configuration snapshot.
  ///
  ///
  /// If you want your custom rule to be triggered by configuration changes,
  /// specify two SourceDetail objects, one for
  /// `ConfigurationItemChangeNotification` and one for
  /// `OversizedConfigurationItemChangeNotification`.
  final String messageType;

  /// The frequency at which you want AWS Config to run evaluations for a custom
  /// rule with a periodic trigger. If you specify a value for
  /// `MaximumExecutionFrequency`, then `MessageType` must use the
  /// `ScheduledNotification` value.
  ///
  ///
  ///
  /// By default, rules with a periodic trigger are evaluated every 24 hours. To
  /// change the frequency, specify a valid value for the
  /// `MaximumExecutionFrequency` parameter.
  ///
  /// Based on the valid value you choose, AWS Config runs evaluations once for
  /// each valid value. For example, if you choose `Three_Hours`, AWS Config
  /// runs evaluations once every three hours. In this case, `Three_Hours` is
  /// the frequency of this rule.
  final String maximumExecutionFrequency;

  SourceDetail({
    this.eventSource,
    this.messageType,
    this.maximumExecutionFrequency,
  });
  static SourceDetail fromJson(Map<String, dynamic> json) => SourceDetail(
        eventSource: json.containsKey('EventSource')
            ? json['EventSource'] as String
            : null,
        messageType: json.containsKey('MessageType')
            ? json['MessageType'] as String
            : null,
        maximumExecutionFrequency: json.containsKey('MaximumExecutionFrequency')
            ? json['MaximumExecutionFrequency'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// AWS Systems Manager (SSM) specific remediation controls.
class SsmControls {
  /// The maximum percentage of remediation actions allowed to run in parallel
  /// on the non-compliant resources for that specific rule. You can specify a
  /// percentage, such as 10%. The default value is 10.
  final int concurrentExecutionRatePercentage;

  /// The percentage of errors that are allowed before SSM stops running
  /// automations on non-compliant resources for that specific rule. You can
  /// specify a percentage of errors, for example 10%. If you do not specifiy a
  /// percentage, the default is 50%. For example, if you set the
  /// ErrorPercentage to 40% for 10 non-compliant resources, then SSM stops
  /// running the automations when the fifth error is received.
  final int errorPercentage;

  SsmControls({
    this.concurrentExecutionRatePercentage,
    this.errorPercentage,
  });
  static SsmControls fromJson(Map<String, dynamic> json) => SsmControls(
        concurrentExecutionRatePercentage:
            json.containsKey('ConcurrentExecutionRatePercentage')
                ? json['ConcurrentExecutionRatePercentage'] as int
                : null,
        errorPercentage: json.containsKey('ErrorPercentage')
            ? json['ErrorPercentage'] as int
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The output when you start the evaluation for the specified AWS Config rule.
class StartConfigRulesEvaluationResponse {
  StartConfigRulesEvaluationResponse();
  static StartConfigRulesEvaluationResponse fromJson(
          Map<String, dynamic> json) =>
      StartConfigRulesEvaluationResponse();
}

class StartRemediationExecutionResponse {
  /// Returns a failure message. For example, the resource is already compliant.
  final String failureMessage;

  /// For resources that have failed to start execution, the API returns a
  /// resource key object.
  final List<ResourceKey> failedItems;

  StartRemediationExecutionResponse({
    this.failureMessage,
    this.failedItems,
  });
  static StartRemediationExecutionResponse fromJson(
          Map<String, dynamic> json) =>
      StartRemediationExecutionResponse(
        failureMessage: json.containsKey('FailureMessage')
            ? json['FailureMessage'] as String
            : null,
        failedItems: json.containsKey('FailedItems')
            ? (json['FailedItems'] as List)
                .map((e) => ResourceKey.fromJson(e))
                .toList()
            : null,
      );
}

/// The static value of the resource.
class StaticValue {
  /// A list of values. For example, the ARN of the assumed role.
  final List<String> values;

  StaticValue({
    @required this.values,
  });
  static StaticValue fromJson(Map<String, dynamic> json) => StaticValue(
        values: (json['Values'] as List).map((e) => e as String).toList(),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Status filter object to filter results based on specific member account ID
/// or status type for an organization config rule.
class StatusDetailFilters {
  /// The 12-digit account ID of the member account within an organization.
  final String accountId;

  /// Indicates deployment status for config rule in the member account. When
  /// master account calls `PutOrganizationConfigRule` action for the first
  /// time, config rule status is created in the member account. When master
  /// account calls `PutOrganizationConfigRule` action for the second time,
  /// config rule status is updated in the member account. Config rule status is
  /// deleted when the master account deletes `OrganizationConfigRule` and
  /// disables service access for `config-multiaccountsetup.amazonaws.com`.
  ///
  /// AWS Config sets the state of the rule to:
  ///
  /// *    `CREATE_SUCCESSFUL` when config rule has been created in the member
  /// account.
  ///
  /// *    `CREATE_IN_PROGRESS` when config rule is being created in the member
  /// account.
  ///
  /// *    `CREATE_FAILED` when config rule creation has failed in the member
  /// account.
  ///
  /// *    `DELETE_FAILED` when config rule deletion has failed in the member
  /// account.
  ///
  /// *    `DELETE_IN_PROGRESS` when config rule is being deleted in the member
  /// account.
  ///
  /// *    `DELETE_SUCCESSFUL` when config rule has been deleted in the member
  /// account.
  ///
  /// *    `UPDATE_SUCCESSFUL` when config rule has been updated in the member
  /// account.
  ///
  /// *    `UPDATE_IN_PROGRESS` when config rule is being updated in the member
  /// account.
  ///
  /// *    `UPDATE_FAILED` when config rule deletion has failed in the member
  /// account.
  final String memberAccountRuleStatus;

  StatusDetailFilters({
    this.accountId,
    this.memberAccountRuleStatus,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The tags for the resource. The metadata that you apply to a resource to help
/// you categorize and organize them. Each tag consists of a key and an optional
/// value, both of which you define. Tag keys can have a maximum character
/// length of 128 characters, and tag values can have a maximum length of 256
/// characters.
class Tag {
  /// One part of a key-value pair that make up a tag. A key is a general label
  /// that acts like a category for more specific tag values.
  final String key;

  /// The optional part of a key-value pair that make up a tag. A value acts as
  /// a descriptor within a tag category (key).
  final String value;

  Tag({
    this.key,
    this.value,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag(
        key: json.containsKey('Key') ? json['Key'] as String : null,
        value: json.containsKey('Value') ? json['Value'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}
