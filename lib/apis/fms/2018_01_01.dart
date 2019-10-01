import 'package:meta/meta.dart';

/// AWS Firewall Manager
///
/// This is the _AWS Firewall Manager API Reference_. This guide is for
/// developers who need detailed information about the AWS Firewall Manager API
/// actions, data types, and errors. For detailed information about AWS Firewall
/// Manager features, see the
/// [AWS Firewall Manager Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/fms-chapter.html).
class FmsApi {
  final _client;
  FmsApi(client) : _client = client.configured('FMS', serializer: 'json');

  /// Sets the AWS Firewall Manager administrator account. AWS Firewall Manager
  /// must be associated with the master account your AWS organization or
  /// associated with a member account that has the appropriate permissions. If
  /// the account ID that you submit is not an AWS Organizations master account,
  /// AWS Firewall Manager will set the appropriate permissions for the given
  /// member account.
  ///
  /// The account that you associate with AWS Firewall Manager is called the AWS
  /// Firewall Manager administrator account.
  ///
  /// [adminAccount]: The AWS account ID to associate with AWS Firewall Manager
  /// as the AWS Firewall Manager administrator account. This can be an AWS
  /// Organizations master account or a member account. For more information
  /// about AWS Organizations and master accounts, see
  /// [Managing the AWS Accounts in Your Organization](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts.html).
  Future<void> associateAdminAccount(String adminAccount) async {
    await _client.send('AssociateAdminAccount', {
      'AdminAccount': adminAccount,
    });
  }

  /// Deletes an AWS Firewall Manager association with the IAM role and the
  /// Amazon Simple Notification Service (SNS) topic that is used to record AWS
  /// Firewall Manager SNS logs.
  Future<void> deleteNotificationChannel() async {
    await _client.send('DeleteNotificationChannel', {});
  }

  /// Permanently deletes an AWS Firewall Manager policy.
  ///
  /// [policyId]: The ID of the policy that you want to delete. `PolicyId` is
  /// returned by `PutPolicy` and by `ListPolicies`.
  ///
  /// [deleteAllPolicyResources]: If `True`, the request will also perform a
  /// clean-up process that will:
  ///
  /// *   Delete rule groups created by AWS Firewall Manager
  ///
  /// *   Remove web ACLs from in-scope resources
  ///
  /// *   Delete web ACLs that contain no rules or rule groups
  ///
  ///
  /// After the cleanup, in-scope resources will no longer be protected by web
  /// ACLs in this policy. Protection of out-of-scope resources will remain
  /// unchanged. Scope is determined by tags and accounts associated with the
  /// policy. When creating the policy, if you specified that only resources in
  /// specific accounts or with specific tags be protected by the policy, those
  /// resources are in-scope. All others are out of scope. If you did not
  /// specify tags or accounts, all resources are in-scope.
  Future<void> deletePolicy(String policyId,
      {bool deleteAllPolicyResources}) async {
    await _client.send('DeletePolicy', {
      'PolicyId': policyId,
      if (deleteAllPolicyResources != null)
        'DeleteAllPolicyResources': deleteAllPolicyResources,
    });
  }

  /// Disassociates the account that has been set as the AWS Firewall Manager
  /// administrator account. To set a different account as the administrator
  /// account, you must submit an `AssociateAdminAccount` request .
  Future<void> disassociateAdminAccount() async {
    await _client.send('DisassociateAdminAccount', {});
  }

  /// Returns the AWS Organizations master account that is associated with AWS
  /// Firewall Manager as the AWS Firewall Manager administrator.
  Future<GetAdminAccountResponse> getAdminAccount() async {
    var response_ = await _client.send('GetAdminAccount', {});
    return GetAdminAccountResponse.fromJson(response_);
  }

  /// Returns detailed compliance information about the specified member
  /// account. Details include resources that are in and out of compliance with
  /// the specified policy. Resources are considered non-compliant if the
  /// specified policy has not been applied to them.
  ///
  /// [policyId]: The ID of the policy that you want to get the details for.
  /// `PolicyId` is returned by `PutPolicy` and by `ListPolicies`.
  ///
  /// [memberAccount]: The AWS account that owns the resources that you want to
  /// get the details for.
  Future<GetComplianceDetailResponse> getComplianceDetail(
      {@required String policyId, @required String memberAccount}) async {
    var response_ = await _client.send('GetComplianceDetail', {
      'PolicyId': policyId,
      'MemberAccount': memberAccount,
    });
    return GetComplianceDetailResponse.fromJson(response_);
  }

  /// Returns information about the Amazon Simple Notification Service (SNS)
  /// topic that is used to record AWS Firewall Manager SNS logs.
  Future<GetNotificationChannelResponse> getNotificationChannel() async {
    var response_ = await _client.send('GetNotificationChannel', {});
    return GetNotificationChannelResponse.fromJson(response_);
  }

  /// Returns information about the specified AWS Firewall Manager policy.
  ///
  /// [policyId]: The ID of the AWS Firewall Manager policy that you want the
  /// details for.
  Future<GetPolicyResponse> getPolicy(String policyId) async {
    var response_ = await _client.send('GetPolicy', {
      'PolicyId': policyId,
    });
    return GetPolicyResponse.fromJson(response_);
  }

  /// If you created a Shield Advanced policy, returns policy-level attack
  /// summary information in the event of a potential DDoS attack.
  ///
  /// [policyId]: The ID of the policy for which you want to get the attack
  /// information.
  ///
  /// [memberAccountId]: The AWS account that is in scope of the policy that you
  /// want to get the details for.
  ///
  /// [startTime]: The start of the time period to query for the attacks. This
  /// is a `timestamp` type. The sample request above indicates a number type
  /// because the default used by AWS Firewall Manager is Unix time in seconds.
  /// However, any valid `timestamp` format is allowed.
  ///
  /// [endTime]: The end of the time period to query for the attacks. This is a
  /// `timestamp` type. The sample request above indicates a number type because
  /// the default used by AWS Firewall Manager is Unix time in seconds. However,
  /// any valid `timestamp` format is allowed.
  ///
  /// [nextToken]: If you specify a value for `MaxResults` and you have more
  /// objects than the number that you specify for `MaxResults`, AWS Firewall
  /// Manager returns a `NextToken` value in the response that allows you to
  /// list another group of objects. For the second and subsequent
  /// `GetProtectionStatus` requests, specify the value of `NextToken` from the
  /// previous response to get information about another batch of objects.
  ///
  /// [maxResults]: Specifies the number of objects that you want AWS Firewall
  /// Manager to return for this request. If you have more objects than the
  /// number that you specify for `MaxResults`, the response includes a
  /// `NextToken` value that you can use to get another batch of objects.
  Future<GetProtectionStatusResponse> getProtectionStatus(String policyId,
      {String memberAccountId,
      DateTime startTime,
      DateTime endTime,
      String nextToken,
      int maxResults}) async {
    var response_ = await _client.send('GetProtectionStatus', {
      'PolicyId': policyId,
      if (memberAccountId != null) 'MemberAccountId': memberAccountId,
      if (startTime != null) 'StartTime': startTime,
      if (endTime != null) 'EndTime': endTime,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return GetProtectionStatusResponse.fromJson(response_);
  }

  /// Returns an array of `PolicyComplianceStatus` objects in the response. Use
  /// `PolicyComplianceStatus` to get a summary of which member accounts are
  /// protected by the specified policy.
  ///
  /// [policyId]: The ID of the AWS Firewall Manager policy that you want the
  /// details for.
  ///
  /// [nextToken]: If you specify a value for `MaxResults` and you have more
  /// `PolicyComplianceStatus` objects than the number that you specify for
  /// `MaxResults`, AWS Firewall Manager returns a `NextToken` value in the
  /// response that allows you to list another group of `PolicyComplianceStatus`
  /// objects. For the second and subsequent `ListComplianceStatus` requests,
  /// specify the value of `NextToken` from the previous response to get
  /// information about another batch of `PolicyComplianceStatus` objects.
  ///
  /// [maxResults]: Specifies the number of `PolicyComplianceStatus` objects
  /// that you want AWS Firewall Manager to return for this request. If you have
  /// more `PolicyComplianceStatus` objects than the number that you specify for
  /// `MaxResults`, the response includes a `NextToken` value that you can use
  /// to get another batch of `PolicyComplianceStatus` objects.
  Future<ListComplianceStatusResponse> listComplianceStatus(String policyId,
      {String nextToken, int maxResults}) async {
    var response_ = await _client.send('ListComplianceStatus', {
      'PolicyId': policyId,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return ListComplianceStatusResponse.fromJson(response_);
  }

  /// Returns a `MemberAccounts` object that lists the member accounts in the
  /// administrator's AWS organization.
  ///
  /// The `ListMemberAccounts` must be submitted by the account that is set as
  /// the AWS Firewall Manager administrator.
  ///
  /// [nextToken]: If you specify a value for `MaxResults` and you have more
  /// account IDs than the number that you specify for `MaxResults`, AWS
  /// Firewall Manager returns a `NextToken` value in the response that allows
  /// you to list another group of IDs. For the second and subsequent
  /// `ListMemberAccountsRequest` requests, specify the value of `NextToken`
  /// from the previous response to get information about another batch of
  /// member account IDs.
  ///
  /// [maxResults]: Specifies the number of member account IDs that you want AWS
  /// Firewall Manager to return for this request. If you have more IDs than the
  /// number that you specify for `MaxResults`, the response includes a
  /// `NextToken` value that you can use to get another batch of member account
  /// IDs.
  Future<ListMemberAccountsResponse> listMemberAccounts(
      {String nextToken, int maxResults}) async {
    var response_ = await _client.send('ListMemberAccounts', {
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return ListMemberAccountsResponse.fromJson(response_);
  }

  /// Returns an array of `PolicySummary` objects in the response.
  ///
  /// [nextToken]: If you specify a value for `MaxResults` and you have more
  /// `PolicySummary` objects than the number that you specify for `MaxResults`,
  /// AWS Firewall Manager returns a `NextToken` value in the response that
  /// allows you to list another group of `PolicySummary` objects. For the
  /// second and subsequent `ListPolicies` requests, specify the value of
  /// `NextToken` from the previous response to get information about another
  /// batch of `PolicySummary` objects.
  ///
  /// [maxResults]: Specifies the number of `PolicySummary` objects that you
  /// want AWS Firewall Manager to return for this request. If you have more
  /// `PolicySummary` objects than the number that you specify for `MaxResults`,
  /// the response includes a `NextToken` value that you can use to get another
  /// batch of `PolicySummary` objects.
  Future<ListPoliciesResponse> listPolicies(
      {String nextToken, int maxResults}) async {
    var response_ = await _client.send('ListPolicies', {
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return ListPoliciesResponse.fromJson(response_);
  }

  /// Designates the IAM role and Amazon Simple Notification Service (SNS) topic
  /// that AWS Firewall Manager uses to record SNS logs.
  ///
  /// [snsTopicArn]: The Amazon Resource Name (ARN) of the SNS topic that
  /// collects notifications from AWS Firewall Manager.
  ///
  /// [snsRoleName]: The Amazon Resource Name (ARN) of the IAM role that allows
  /// Amazon SNS to record AWS Firewall Manager activity.
  Future<void> putNotificationChannel(
      {@required String snsTopicArn, @required String snsRoleName}) async {
    await _client.send('PutNotificationChannel', {
      'SnsTopicArn': snsTopicArn,
      'SnsRoleName': snsRoleName,
    });
  }

  /// Creates an AWS Firewall Manager policy.
  ///
  /// Firewall Manager provides two types of policies: A Shield Advanced policy,
  /// which applies Shield Advanced protection to specified accounts and
  /// resources, or a WAF policy, which contains a rule group and defines which
  /// resources are to be protected by that rule group. A policy is specific to
  /// either WAF or Shield Advanced. If you want to enforce both WAF rules and
  /// Shield Advanced protection across accounts, you can create multiple
  /// policies. You can create one or more policies for WAF rules, and one or
  /// more policies for Shield Advanced.
  ///
  /// You must be subscribed to Shield Advanced to create a Shield Advanced
  /// policy. For more information on subscribing to Shield Advanced, see
  /// [CreateSubscription](https://docs.aws.amazon.com/waf/latest/DDOSAPIReference/API_CreateSubscription.html).
  ///
  /// [policy]: The details of the AWS Firewall Manager policy to be created.
  Future<PutPolicyResponse> putPolicy(Policy policy) async {
    var response_ = await _client.send('PutPolicy', {
      'Policy': policy,
    });
    return PutPolicyResponse.fromJson(response_);
  }
}

/// Details of the resource that is not protected by the policy.
class ComplianceViolator {
  /// The resource ID.
  final String resourceId;

  /// The reason that the resource is not protected by the policy.
  final String violationReason;

  /// The resource type. This is in the format shown in
  /// [AWS Resource Types Reference](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html).
  /// For example: `AWS::ElasticLoadBalancingV2::LoadBalancer` or
  /// `AWS::CloudFront::Distribution`.
  final String resourceType;

  ComplianceViolator({
    this.resourceId,
    this.violationReason,
    this.resourceType,
  });
  static ComplianceViolator fromJson(Map<String, dynamic> json) =>
      ComplianceViolator(
        resourceId: json.containsKey('ResourceId')
            ? json['ResourceId'] as String
            : null,
        violationReason: json.containsKey('ViolationReason')
            ? json['ViolationReason'] as String
            : null,
        resourceType: json.containsKey('ResourceType')
            ? json['ResourceType'] as String
            : null,
      );
}

/// Describes the compliance status for the account. An account is considered
/// non-compliant if it includes resources that are not protected by the
/// specified policy.
class EvaluationResult {
  /// Describes an AWS account's compliance with the AWS Firewall Manager
  /// policy.
  final String complianceStatus;

  /// Number of resources that are non-compliant with the specified policy. A
  /// resource is considered non-compliant if it is not associated with the
  /// specified policy.
  final BigInt violatorCount;

  /// Indicates that over 100 resources are non-compliant with the AWS Firewall
  /// Manager policy.
  final bool evaluationLimitExceeded;

  EvaluationResult({
    this.complianceStatus,
    this.violatorCount,
    this.evaluationLimitExceeded,
  });
  static EvaluationResult fromJson(Map<String, dynamic> json) =>
      EvaluationResult(
        complianceStatus: json.containsKey('ComplianceStatus')
            ? json['ComplianceStatus'] as String
            : null,
        violatorCount: json.containsKey('ViolatorCount')
            ? BigInt.from(json['ViolatorCount'])
            : null,
        evaluationLimitExceeded: json.containsKey('EvaluationLimitExceeded')
            ? json['EvaluationLimitExceeded'] as bool
            : null,
      );
}

class GetAdminAccountResponse {
  /// The AWS account that is set as the AWS Firewall Manager administrator.
  final String adminAccount;

  /// The status of the AWS account that you set as the AWS Firewall Manager
  /// administrator.
  final String roleStatus;

  GetAdminAccountResponse({
    this.adminAccount,
    this.roleStatus,
  });
  static GetAdminAccountResponse fromJson(Map<String, dynamic> json) =>
      GetAdminAccountResponse(
        adminAccount: json.containsKey('AdminAccount')
            ? json['AdminAccount'] as String
            : null,
        roleStatus: json.containsKey('RoleStatus')
            ? json['RoleStatus'] as String
            : null,
      );
}

class GetComplianceDetailResponse {
  /// Information about the resources and the policy that you specified in the
  /// `GetComplianceDetail` request.
  final PolicyComplianceDetail policyComplianceDetail;

  GetComplianceDetailResponse({
    this.policyComplianceDetail,
  });
  static GetComplianceDetailResponse fromJson(Map<String, dynamic> json) =>
      GetComplianceDetailResponse(
        policyComplianceDetail: json.containsKey('PolicyComplianceDetail')
            ? PolicyComplianceDetail.fromJson(json['PolicyComplianceDetail'])
            : null,
      );
}

class GetNotificationChannelResponse {
  /// The SNS topic that records AWS Firewall Manager activity.
  final String snsTopicArn;

  /// The IAM role that is used by AWS Firewall Manager to record activity to
  /// SNS.
  final String snsRoleName;

  GetNotificationChannelResponse({
    this.snsTopicArn,
    this.snsRoleName,
  });
  static GetNotificationChannelResponse fromJson(Map<String, dynamic> json) =>
      GetNotificationChannelResponse(
        snsTopicArn: json.containsKey('SnsTopicArn')
            ? json['SnsTopicArn'] as String
            : null,
        snsRoleName: json.containsKey('SnsRoleName')
            ? json['SnsRoleName'] as String
            : null,
      );
}

class GetPolicyResponse {
  /// Information about the specified AWS Firewall Manager policy.
  final Policy policy;

  /// The Amazon Resource Name (ARN) of the specified policy.
  final String policyArn;

  GetPolicyResponse({
    this.policy,
    this.policyArn,
  });
  static GetPolicyResponse fromJson(Map<String, dynamic> json) =>
      GetPolicyResponse(
        policy:
            json.containsKey('Policy') ? Policy.fromJson(json['Policy']) : null,
        policyArn:
            json.containsKey('PolicyArn') ? json['PolicyArn'] as String : null,
      );
}

class GetProtectionStatusResponse {
  /// The ID of the AWS Firewall administrator account for this policy.
  final String adminAccountId;

  /// The service type that is protected by the policy. Currently, this is
  /// always `SHIELD_ADVANCED`.
  final String serviceType;

  /// Details about the attack, including the following:
  ///
  /// *   Attack type
  ///
  /// *   Account ID
  ///
  /// *   ARN of the resource attacked
  ///
  /// *   Start time of the attack
  ///
  /// *   End time of the attack (ongoing attacks will not have an end time)
  ///
  ///
  /// The details are in JSON format. An example is shown in the Examples
  /// section below.
  final String data;

  /// If you have more objects than the number that you specified for
  /// `MaxResults` in the request, the response includes a `NextToken` value. To
  /// list more objects, submit another `GetProtectionStatus` request, and
  /// specify the `NextToken` value from the response in the `NextToken` value
  /// in the next request.
  ///
  /// AWS SDKs provide auto-pagination that identify `NextToken` in a response
  /// and make subsequent request calls automatically on your behalf. However,
  /// this feature is not supported by `GetProtectionStatus`. You must submit
  /// subsequent requests with `NextToken` using your own processes.
  final String nextToken;

  GetProtectionStatusResponse({
    this.adminAccountId,
    this.serviceType,
    this.data,
    this.nextToken,
  });
  static GetProtectionStatusResponse fromJson(Map<String, dynamic> json) =>
      GetProtectionStatusResponse(
        adminAccountId: json.containsKey('AdminAccountId')
            ? json['AdminAccountId'] as String
            : null,
        serviceType: json.containsKey('ServiceType')
            ? json['ServiceType'] as String
            : null,
        data: json.containsKey('Data') ? json['Data'] as String : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListComplianceStatusResponse {
  /// An array of `PolicyComplianceStatus` objects.
  final List<PolicyComplianceStatus> policyComplianceStatusList;

  /// If you have more `PolicyComplianceStatus` objects than the number that you
  /// specified for `MaxResults` in the request, the response includes a
  /// `NextToken` value. To list more `PolicyComplianceStatus` objects, submit
  /// another `ListComplianceStatus` request, and specify the `NextToken` value
  /// from the response in the `NextToken` value in the next request.
  final String nextToken;

  ListComplianceStatusResponse({
    this.policyComplianceStatusList,
    this.nextToken,
  });
  static ListComplianceStatusResponse fromJson(Map<String, dynamic> json) =>
      ListComplianceStatusResponse(
        policyComplianceStatusList:
            json.containsKey('PolicyComplianceStatusList')
                ? (json['PolicyComplianceStatusList'] as List)
                    .map((e) => PolicyComplianceStatus.fromJson(e))
                    .toList()
                : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListMemberAccountsResponse {
  /// An array of account IDs.
  final List<String> memberAccounts;

  /// If you have more member account IDs than the number that you specified for
  /// `MaxResults` in the request, the response includes a `NextToken` value. To
  /// list more IDs, submit another `ListMemberAccounts` request, and specify
  /// the `NextToken` value from the response in the `NextToken` value in the
  /// next request.
  final String nextToken;

  ListMemberAccountsResponse({
    this.memberAccounts,
    this.nextToken,
  });
  static ListMemberAccountsResponse fromJson(Map<String, dynamic> json) =>
      ListMemberAccountsResponse(
        memberAccounts: json.containsKey('MemberAccounts')
            ? (json['MemberAccounts'] as List).map((e) => e as String).toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListPoliciesResponse {
  /// An array of `PolicySummary` objects.
  final List<PolicySummary> policyList;

  /// If you have more `PolicySummary` objects than the number that you
  /// specified for `MaxResults` in the request, the response includes a
  /// `NextToken` value. To list more `PolicySummary` objects, submit another
  /// `ListPolicies` request, and specify the `NextToken` value from the
  /// response in the `NextToken` value in the next request.
  final String nextToken;

  ListPoliciesResponse({
    this.policyList,
    this.nextToken,
  });
  static ListPoliciesResponse fromJson(Map<String, dynamic> json) =>
      ListPoliciesResponse(
        policyList: json.containsKey('PolicyList')
            ? (json['PolicyList'] as List)
                .map((e) => PolicySummary.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// An AWS Firewall Manager policy.
class Policy {
  /// The ID of the AWS Firewall Manager policy.
  final String policyId;

  /// The friendly name of the AWS Firewall Manager policy.
  final String policyName;

  /// A unique identifier for each update to the policy. When issuing a
  /// `PutPolicy` request, the `PolicyUpdateToken` in the request must match the
  /// `PolicyUpdateToken` of the current policy version. To get the
  /// `PolicyUpdateToken` of the current policy version, use a `GetPolicy`
  /// request.
  final String policyUpdateToken;

  /// Details about the security service that is being used to protect the
  /// resources.
  final SecurityServicePolicyData securityServicePolicyData;

  /// The type of resource to protect with the policy. This is in the format
  /// shown in
  /// [AWS Resource Types Reference](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html).
  /// For example: `AWS::ElasticLoadBalancingV2::LoadBalancer` or
  /// `AWS::CloudFront::Distribution`.
  final String resourceType;

  /// An array of `ResourceType`.
  final List<String> resourceTypeList;

  /// An array of `ResourceTag` objects.
  final List<ResourceTag> resourceTags;

  /// If set to `True`, resources with the tags that are specified in the
  /// `ResourceTag` array are not protected by the policy. If set to `False`,
  /// and the `ResourceTag` array is not null, only resources with the specified
  /// tags are associated with the policy.
  final bool excludeResourceTags;

  /// Indicates if the policy should be automatically applied to new resources.
  final bool remediationEnabled;

  /// Specifies the AWS account IDs to include in the policy. If `IncludeMap` is
  /// null, all accounts in the organization in AWS Organizations are included
  /// in the policy. If `IncludeMap` is not null, only values listed in
  /// `IncludeMap` are included in the policy.
  ///
  /// The key to the map is `ACCOUNT`. For example, a valid `IncludeMap` would
  /// be `{“ACCOUNT” : [“accountID1”, “accountID2”]}`.
  final Map<String, List<String>> includeMap;

  /// Specifies the AWS account IDs to exclude from the policy. The `IncludeMap`
  /// values are evaluated first, with all the appropriate account IDs added to
  /// the policy. Then the accounts listed in `ExcludeMap` are removed,
  /// resulting in the final list of accounts to add to the policy.
  ///
  /// The key to the map is `ACCOUNT`. For example, a valid `ExcludeMap` would
  /// be `{“ACCOUNT” : [“accountID1”, “accountID2”]}`.
  final Map<String, List<String>> excludeMap;

  Policy({
    this.policyId,
    @required this.policyName,
    this.policyUpdateToken,
    @required this.securityServicePolicyData,
    @required this.resourceType,
    this.resourceTypeList,
    this.resourceTags,
    @required this.excludeResourceTags,
    @required this.remediationEnabled,
    this.includeMap,
    this.excludeMap,
  });
  static Policy fromJson(Map<String, dynamic> json) => Policy(
        policyId:
            json.containsKey('PolicyId') ? json['PolicyId'] as String : null,
        policyName: json['PolicyName'] as String,
        policyUpdateToken: json.containsKey('PolicyUpdateToken')
            ? json['PolicyUpdateToken'] as String
            : null,
        securityServicePolicyData: SecurityServicePolicyData.fromJson(
            json['SecurityServicePolicyData']),
        resourceType: json['ResourceType'] as String,
        resourceTypeList: json.containsKey('ResourceTypeList')
            ? (json['ResourceTypeList'] as List)
                .map((e) => e as String)
                .toList()
            : null,
        resourceTags: json.containsKey('ResourceTags')
            ? (json['ResourceTags'] as List)
                .map((e) => ResourceTag.fromJson(e))
                .toList()
            : null,
        excludeResourceTags: json['ExcludeResourceTags'] as bool,
        remediationEnabled: json['RemediationEnabled'] as bool,
        includeMap: json.containsKey('IncludeMap')
            ? (json['IncludeMap'] as Map).map((k, v) => MapEntry(
                k as String, (v as List).map((e) => e as String).toList()))
            : null,
        excludeMap: json.containsKey('ExcludeMap')
            ? (json['ExcludeMap'] as Map).map((k, v) => MapEntry(
                k as String, (v as List).map((e) => e as String).toList()))
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes the non-compliant resources in a member account for a specific AWS
/// Firewall Manager policy. A maximum of 100 entries are displayed. If more
/// than 100 resources are non-compliant, `EvaluationLimitExceeded` is set to
/// `True`.
class PolicyComplianceDetail {
  /// The AWS account that created the AWS Firewall Manager policy.
  final String policyOwner;

  /// The ID of the AWS Firewall Manager policy.
  final String policyId;

  /// The AWS account ID.
  final String memberAccount;

  /// An array of resources that are not protected by the policy.
  final List<ComplianceViolator> violators;

  /// Indicates if over 100 resources are non-compliant with the AWS Firewall
  /// Manager policy.
  final bool evaluationLimitExceeded;

  /// A time stamp that indicates when the returned information should be
  /// considered out-of-date.
  final DateTime expiredAt;

  /// Details about problems with dependent services, such as AWS WAF or AWS
  /// Config, that are causing a resource to be non-compliant. The details
  /// include the name of the dependent service and the error message received
  /// that indicates the problem with the service.
  final Map<String, String> issueInfoMap;

  PolicyComplianceDetail({
    this.policyOwner,
    this.policyId,
    this.memberAccount,
    this.violators,
    this.evaluationLimitExceeded,
    this.expiredAt,
    this.issueInfoMap,
  });
  static PolicyComplianceDetail fromJson(Map<String, dynamic> json) =>
      PolicyComplianceDetail(
        policyOwner: json.containsKey('PolicyOwner')
            ? json['PolicyOwner'] as String
            : null,
        policyId:
            json.containsKey('PolicyId') ? json['PolicyId'] as String : null,
        memberAccount: json.containsKey('MemberAccount')
            ? json['MemberAccount'] as String
            : null,
        violators: json.containsKey('Violators')
            ? (json['Violators'] as List)
                .map((e) => ComplianceViolator.fromJson(e))
                .toList()
            : null,
        evaluationLimitExceeded: json.containsKey('EvaluationLimitExceeded')
            ? json['EvaluationLimitExceeded'] as bool
            : null,
        expiredAt: json.containsKey('ExpiredAt')
            ? DateTime.parse(json['ExpiredAt'])
            : null,
        issueInfoMap: json.containsKey('IssueInfoMap')
            ? (json['IssueInfoMap'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

/// Indicates whether the account is compliant with the specified policy. An
/// account is considered non-compliant if it includes resources that are not
/// protected by the policy.
class PolicyComplianceStatus {
  /// The AWS account that created the AWS Firewall Manager policy.
  final String policyOwner;

  /// The ID of the AWS Firewall Manager policy.
  final String policyId;

  /// The friendly name of the AWS Firewall Manager policy.
  final String policyName;

  /// The member account ID.
  final String memberAccount;

  /// An array of `EvaluationResult` objects.
  final List<EvaluationResult> evaluationResults;

  /// Time stamp of the last update to the `EvaluationResult` objects.
  final DateTime lastUpdated;

  /// Details about problems with dependent services, such as AWS WAF or AWS
  /// Config, that are causing a resource to be non-compliant. The details
  /// include the name of the dependent service and the error message received
  /// that indicates the problem with the service.
  final Map<String, String> issueInfoMap;

  PolicyComplianceStatus({
    this.policyOwner,
    this.policyId,
    this.policyName,
    this.memberAccount,
    this.evaluationResults,
    this.lastUpdated,
    this.issueInfoMap,
  });
  static PolicyComplianceStatus fromJson(Map<String, dynamic> json) =>
      PolicyComplianceStatus(
        policyOwner: json.containsKey('PolicyOwner')
            ? json['PolicyOwner'] as String
            : null,
        policyId:
            json.containsKey('PolicyId') ? json['PolicyId'] as String : null,
        policyName: json.containsKey('PolicyName')
            ? json['PolicyName'] as String
            : null,
        memberAccount: json.containsKey('MemberAccount')
            ? json['MemberAccount'] as String
            : null,
        evaluationResults: json.containsKey('EvaluationResults')
            ? (json['EvaluationResults'] as List)
                .map((e) => EvaluationResult.fromJson(e))
                .toList()
            : null,
        lastUpdated: json.containsKey('LastUpdated')
            ? DateTime.parse(json['LastUpdated'])
            : null,
        issueInfoMap: json.containsKey('IssueInfoMap')
            ? (json['IssueInfoMap'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

/// Details of the AWS Firewall Manager policy.
class PolicySummary {
  /// The Amazon Resource Name (ARN) of the specified policy.
  final String policyArn;

  /// The ID of the specified policy.
  final String policyId;

  /// The friendly name of the specified policy.
  final String policyName;

  /// The type of resource to protect with the policy. This is in the format
  /// shown in
  /// [AWS Resource Types Reference](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html).
  /// For example: `AWS::ElasticLoadBalancingV2::LoadBalancer` or
  /// `AWS::CloudFront::Distribution`.
  final String resourceType;

  /// The service that the policy is using to protect the resources. This
  /// specifies the type of policy that is created, either a WAF policy or
  /// Shield Advanced policy.
  final String securityServiceType;

  /// Indicates if the policy should be automatically applied to new resources.
  final bool remediationEnabled;

  PolicySummary({
    this.policyArn,
    this.policyId,
    this.policyName,
    this.resourceType,
    this.securityServiceType,
    this.remediationEnabled,
  });
  static PolicySummary fromJson(Map<String, dynamic> json) => PolicySummary(
        policyArn:
            json.containsKey('PolicyArn') ? json['PolicyArn'] as String : null,
        policyId:
            json.containsKey('PolicyId') ? json['PolicyId'] as String : null,
        policyName: json.containsKey('PolicyName')
            ? json['PolicyName'] as String
            : null,
        resourceType: json.containsKey('ResourceType')
            ? json['ResourceType'] as String
            : null,
        securityServiceType: json.containsKey('SecurityServiceType')
            ? json['SecurityServiceType'] as String
            : null,
        remediationEnabled: json.containsKey('RemediationEnabled')
            ? json['RemediationEnabled'] as bool
            : null,
      );
}

class PutPolicyResponse {
  /// The details of the AWS Firewall Manager policy that was created.
  final Policy policy;

  /// The Amazon Resource Name (ARN) of the policy that was created.
  final String policyArn;

  PutPolicyResponse({
    this.policy,
    this.policyArn,
  });
  static PutPolicyResponse fromJson(Map<String, dynamic> json) =>
      PutPolicyResponse(
        policy:
            json.containsKey('Policy') ? Policy.fromJson(json['Policy']) : null,
        policyArn:
            json.containsKey('PolicyArn') ? json['PolicyArn'] as String : null,
      );
}

/// The resource tags that AWS Firewall Manager uses to determine if a
/// particular resource should be included or excluded from protection by the
/// AWS Firewall Manager policy. Tags enable you to categorize your AWS
/// resources in different ways, for example, by purpose, owner, or environment.
/// Each tag consists of a key and an optional value, both of which you define.
/// Tags are combined with an "OR." That is, if you add more than one tag, if
/// any of the tags matches, the resource is considered a match for the include
/// or exclude.
/// [Working with Tag Editor](https://docs.aws.amazon.com/awsconsolehelpdocs/latest/gsg/tag-editor.html).
class ResourceTag {
  /// The resource tag key.
  final String key;

  /// The resource tag value.
  final String value;

  ResourceTag({
    @required this.key,
    this.value,
  });
  static ResourceTag fromJson(Map<String, dynamic> json) => ResourceTag(
        key: json['Key'] as String,
        value: json.containsKey('Value') ? json['Value'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Details about the security service that is being used to protect the
/// resources.
class SecurityServicePolicyData {
  /// The service that the policy is using to protect the resources. This
  /// specifies the type of policy that is created, either a WAF policy or
  /// Shield Advanced policy.
  final String type;

  /// Details about the service. This contains `WAF` data in JSON format, as
  /// shown in the following example:
  ///
  ///  `ManagedServiceData": "{"type": "WAF", "ruleGroups":
  /// [{"id": "12345678-1bcd-9012-efga-0987654321ab", "overrideAction" : {"type": "COUNT"}}],
  /// "defaultAction": {"type": "BLOCK"}}`
  ///
  /// If this is a Shield Advanced policy, this string will be empty.
  final String managedServiceData;

  SecurityServicePolicyData({
    @required this.type,
    this.managedServiceData,
  });
  static SecurityServicePolicyData fromJson(Map<String, dynamic> json) =>
      SecurityServicePolicyData(
        type: json['Type'] as String,
        managedServiceData: json.containsKey('ManagedServiceData')
            ? json['ManagedServiceData'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}
