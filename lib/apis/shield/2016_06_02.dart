import 'package:meta/meta.dart';

/// AWS Shield Advanced
///
/// This is the _AWS Shield Advanced API Reference_. This guide is for
/// developers who need detailed information about the AWS Shield Advanced API
/// actions, data types, and errors. For detailed information about AWS WAF and
/// AWS Shield Advanced features and an overview of how to use the AWS WAF and
/// AWS Shield Advanced APIs, see the [AWS WAF and AWS Shield Developer
/// Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).
class ShieldApi {
  /// Authorizes the DDoS Response team (DRT) to access the specified Amazon S3
  /// bucket containing your AWS WAF logs. You can associate up to 10 Amazon S3
  /// buckets with your subscription.
  ///
  /// To use the services of the DRT and make an `AssociateDRTLogBucket`
  /// request, you must be subscribed to the [Business Support
  /// plan](https://aws.amazon.com/premiumsupport/business-support/) or the
  /// [Enterprise Support
  /// plan](https://aws.amazon.com/premiumsupport/enterprise-support/).
  ///
  /// [logBucket]: The Amazon S3 bucket that contains your AWS WAF logs.
  Future<AssociateDrtLogBucketResponse> associateDrtLogBucket(
      String logBucket) async {
    return AssociateDrtLogBucketResponse.fromJson({});
  }

  /// Authorizes the DDoS Response team (DRT), using the specified role, to
  /// access your AWS account to assist with DDoS attack mitigation during
  /// potential attacks. This enables the DRT to inspect your AWS WAF
  /// configuration and create or update AWS WAF rules and web ACLs.
  ///
  /// You can associate only one `RoleArn` with your subscription. If you submit
  /// an `AssociateDRTRole` request for an account that already has an
  /// associated role, the new `RoleArn` will replace the existing `RoleArn`.
  ///
  /// Prior to making the `AssociateDRTRole` request, you must attach the
  /// [AWSShieldDRTAccessPolicy](https://console.aws.amazon.com/iam/home?#/policies/arn:aws:iam::aws:policy/service-role/AWSShieldDRTAccessPolicy)
  /// managed policy to the role you will specify in the request. For more
  /// information see [Attaching and Detaching IAM Policies](
  /// https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_manage-attach-detach.html).
  /// The role must also trust the service principal
  /// `drt.shield.amazonaws.com`. For more information, see [IAM JSON Policy
  /// Elements:
  /// Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_principal.html).
  ///
  /// The DRT will have access only to your AWS WAF and Shield resources. By
  /// submitting this request, you authorize the DRT to inspect your AWS WAF and
  /// Shield configuration and create and update AWS WAF rules and web ACLs on
  /// your behalf. The DRT takes these actions only if explicitly authorized by
  /// you.
  ///
  /// You must have the `iam:PassRole` permission to make an `AssociateDRTRole`
  /// request. For more information, see [Granting a User Permissions to Pass a
  /// Role to an AWS
  /// Service](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_passrole.html).
  ///
  /// To use the services of the DRT and make an `AssociateDRTRole` request, you
  /// must be subscribed to the [Business Support
  /// plan](https://aws.amazon.com/premiumsupport/business-support/) or the
  /// [Enterprise Support
  /// plan](https://aws.amazon.com/premiumsupport/enterprise-support/).
  ///
  /// [roleArn]: The Amazon Resource Name (ARN) of the role the DRT will use to
  /// access your AWS account.
  ///
  /// Prior to making the `AssociateDRTRole` request, you must attach the
  /// [AWSShieldDRTAccessPolicy](https://console.aws.amazon.com/iam/home?#/policies/arn:aws:iam::aws:policy/service-role/AWSShieldDRTAccessPolicy)
  /// managed policy to this role. For more information see [Attaching and
  /// Detaching IAM Policies](
  /// https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_manage-attach-detach.html).
  Future<AssociateDrtRoleResponse> associateDrtRole(String roleArn) async {
    return AssociateDrtRoleResponse.fromJson({});
  }

  /// Enables AWS Shield Advanced for a specific AWS resource. The resource can
  /// be an Amazon CloudFront distribution, Elastic Load Balancing load
  /// balancer, AWS Global Accelerator accelerator, Elastic IP Address, or an
  /// Amazon Route 53 hosted zone.
  ///
  /// You can add protection to only a single resource with each
  /// CreateProtection request. If you want to add protection to multiple
  /// resources at once, use the [AWS WAF
  /// console](https://console.aws.amazon.com/waf/). For more information see
  /// [Getting Started with AWS Shield
  /// Advanced](https://docs.aws.amazon.com/waf/latest/developerguide/getting-started-ddos.html)
  /// and [Add AWS Shield Advanced Protection to more AWS
  /// Resources](https://docs.aws.amazon.com/waf/latest/developerguide/configure-new-protection.html).
  ///
  /// [name]: Friendly name for the `Protection` you are creating.
  ///
  /// [resourceArn]: The ARN (Amazon Resource Name) of the resource to be
  /// protected.
  ///
  /// The ARN should be in one of the following formats:
  ///
  /// *   For an Application Load Balancer:
  /// `arn:aws:elasticloadbalancing:_region_:_account-id_:loadbalancer/app/_load-balancer-name_/_load-balancer-id_`
  ///
  ///
  /// *   For an Elastic Load Balancer (Classic Load Balancer):
  /// `arn:aws:elasticloadbalancing:_region_:_account-id_:loadbalancer/_load-balancer-name_`
  ///
  ///
  /// *   For an AWS CloudFront distribution:
  /// `arn:aws:cloudfront::_account-id_:distribution/_distribution-id_`
  ///
  /// *   For an AWS Global Accelerator accelerator:
  /// `arn:aws:globalaccelerator::_account-id_:accelerator/_accelerator-id_`
  ///
  /// *   For Amazon Route 53: `arn:aws:route53:::hostedzone/_hosted-zone-id_`
  ///
  /// *   For an Elastic IP address:
  /// `arn:aws:ec2:_region_:_account-id_:eip-allocation/_allocation-id_`
  Future<CreateProtectionResponse> createProtection(
      {@required String name, @required String resourceArn}) async {
    return CreateProtectionResponse.fromJson({});
  }

  /// Activates AWS Shield Advanced for an account.
  ///
  /// As part of this request you can specify `EmergencySettings` that
  /// automaticaly grant the DDoS response team (DRT) needed permissions to
  /// assist you during a suspected DDoS attack. For more information see
  /// [Authorize the DDoS Response Team to Create Rules and Web ACLs on Your
  /// Behalf](https://docs.aws.amazon.com/waf/latest/developerguide/authorize-DRT.html).
  ///
  /// To use the services of the DRT, you must be subscribed to the [Business
  /// Support plan](https://aws.amazon.com/premiumsupport/business-support/) or
  /// the [Enterprise Support
  /// plan](https://aws.amazon.com/premiumsupport/enterprise-support/).
  ///
  /// When you initally create a subscription, your subscription is set to be
  /// automatically renewed at the end of the existing subscription period. You
  /// can change this by submitting an `UpdateSubscription` request.
  Future<CreateSubscriptionResponse> createSubscription() async {
    return CreateSubscriptionResponse.fromJson({});
  }

  /// Deletes an AWS Shield Advanced Protection.
  ///
  /// [protectionId]: The unique identifier (ID) for the Protection object to be
  /// deleted.
  Future<DeleteProtectionResponse> deleteProtection(String protectionId) async {
    return DeleteProtectionResponse.fromJson({});
  }

  /// Removes AWS Shield Advanced from an account. AWS Shield Advanced requires
  /// a 1-year subscription commitment. You cannot delete a subscription prior
  /// to the completion of that commitment.
  Future<DeleteSubscriptionResponse> deleteSubscription() async {
    return DeleteSubscriptionResponse.fromJson({});
  }

  /// Describes the details of a DDoS attack.
  ///
  /// [attackId]: The unique identifier (ID) for the attack that to be
  /// described.
  Future<DescribeAttackResponse> describeAttack(String attackId) async {
    return DescribeAttackResponse.fromJson({});
  }

  /// Returns the current role and list of Amazon S3 log buckets used by the
  /// DDoS Response team (DRT) to access your AWS account while assisting with
  /// attack mitigation.
  Future<DescribeDrtAccessResponse> describeDrtAccess() async {
    return DescribeDrtAccessResponse.fromJson({});
  }

  /// Lists the email addresses that the DRT can use to contact you during a
  /// suspected attack.
  Future<DescribeEmergencyContactSettingsResponse>
      describeEmergencyContactSettings() async {
    return DescribeEmergencyContactSettingsResponse.fromJson({});
  }

  /// Lists the details of a Protection object.
  ///
  /// [protectionId]: The unique identifier (ID) for the Protection object that
  /// is described. When submitting the `DescribeProtection` request you must
  /// provide either the `ResourceArn` or the `ProtectionID`, but not both.
  ///
  /// [resourceArn]: The ARN (Amazon Resource Name) of the AWS resource for the
  /// Protection object that is described. When submitting the
  /// `DescribeProtection` request you must provide either the `ResourceArn` or
  /// the `ProtectionID`, but not both.
  Future<DescribeProtectionResponse> describeProtection(
      {String protectionId, String resourceArn}) async {
    return DescribeProtectionResponse.fromJson({});
  }

  /// Provides details about the AWS Shield Advanced subscription for an
  /// account.
  Future<DescribeSubscriptionResponse> describeSubscription() async {
    return DescribeSubscriptionResponse.fromJson({});
  }

  /// Removes the DDoS Response team's (DRT) access to the specified Amazon S3
  /// bucket containing your AWS WAF logs.
  ///
  /// To make a `DisassociateDRTLogBucket` request, you must be subscribed to
  /// the [Business Support
  /// plan](https://aws.amazon.com/premiumsupport/business-support/) or the
  /// [Enterprise Support
  /// plan](https://aws.amazon.com/premiumsupport/enterprise-support/). However,
  /// if you are not subscribed to one of these support plans, but had been
  /// previously and had granted the DRT access to your account, you can submit
  /// a `DisassociateDRTLogBucket` request to remove this access.
  ///
  /// [logBucket]: The Amazon S3 bucket that contains your AWS WAF logs.
  Future<DisassociateDrtLogBucketResponse> disassociateDrtLogBucket(
      String logBucket) async {
    return DisassociateDrtLogBucketResponse.fromJson({});
  }

  /// Removes the DDoS Response team's (DRT) access to your AWS account.
  ///
  /// To make a `DisassociateDRTRole` request, you must be subscribed to the
  /// [Business Support
  /// plan](https://aws.amazon.com/premiumsupport/business-support/) or the
  /// [Enterprise Support
  /// plan](https://aws.amazon.com/premiumsupport/enterprise-support/). However,
  /// if you are not subscribed to one of these support plans, but had been
  /// previously and had granted the DRT access to your account, you can submit
  /// a `DisassociateDRTRole` request to remove this access.
  Future<DisassociateDrtRoleResponse> disassociateDrtRole() async {
    return DisassociateDrtRoleResponse.fromJson({});
  }

  /// Returns the `SubscriptionState`, either `Active` or `Inactive`.
  Future<GetSubscriptionStateResponse> getSubscriptionState() async {
    return GetSubscriptionStateResponse.fromJson({});
  }

  /// Returns all ongoing DDoS attacks or all DDoS attacks during a specified
  /// time period.
  ///
  /// [resourceArns]: The ARN (Amazon Resource Name) of the resource that was
  /// attacked. If this is left blank, all applicable resources for this account
  /// will be included.
  ///
  /// [startTime]: The start of the time period for the attacks. This is a
  /// `timestamp` type. The sample request above indicates a `number` type
  /// because the default used by WAF is Unix time in seconds. However any valid
  /// [timestamp
  /// format](http://docs.aws.amazon.com/cli/latest/userguide/cli-using-param.html#parameter-types)
  /// is allowed.
  ///
  /// [endTime]: The end of the time period for the attacks. This is a
  /// `timestamp` type. The sample request above indicates a `number` type
  /// because the default used by WAF is Unix time in seconds. However any valid
  /// [timestamp
  /// format](http://docs.aws.amazon.com/cli/latest/userguide/cli-using-param.html#parameter-types)
  /// is allowed.
  ///
  /// [nextToken]: The `ListAttacksRequest.NextMarker` value from a previous
  /// call to `ListAttacksRequest`. Pass null if this is the first call.
  ///
  /// [maxResults]: The maximum number of AttackSummary objects to be returned.
  /// If this is left blank, the first 20 results will be returned.
  ///
  /// This is a maximum value; it is possible that AWS WAF will return the
  /// results in smaller batches. That is, the number of AttackSummary objects
  /// returned could be less than `MaxResults`, even if there are still more
  /// AttackSummary objects yet to return. If there are more AttackSummary
  /// objects to return, AWS WAF will always also return a `NextToken`.
  Future<ListAttacksResponse> listAttacks(
      {List<String> resourceArns,
      TimeRange startTime,
      TimeRange endTime,
      String nextToken,
      int maxResults}) async {
    return ListAttacksResponse.fromJson({});
  }

  /// Lists all Protection objects for the account.
  ///
  /// [nextToken]: The `ListProtectionsRequest.NextToken` value from a previous
  /// call to `ListProtections`. Pass null if this is the first call.
  ///
  /// [maxResults]: The maximum number of Protection objects to be returned. If
  /// this is left blank the first 20 results will be returned.
  ///
  /// This is a maximum value; it is possible that AWS WAF will return the
  /// results in smaller batches. That is, the number of Protection objects
  /// returned could be less than `MaxResults`, even if there are still more
  /// Protection objects yet to return. If there are more Protection objects to
  /// return, AWS WAF will always also return a `NextToken`.
  Future<ListProtectionsResponse> listProtections(
      {String nextToken, int maxResults}) async {
    return ListProtectionsResponse.fromJson({});
  }

  /// Updates the details of the list of email addresses that the DRT can use to
  /// contact you during a suspected attack.
  ///
  /// [emergencyContactList]: A list of email addresses that the DRT can use to
  /// contact you during a suspected attack.
  Future<UpdateEmergencyContactSettingsResponse> updateEmergencyContactSettings(
      {List<EmergencyContact> emergencyContactList}) async {
    return UpdateEmergencyContactSettingsResponse.fromJson({});
  }

  /// Updates the details of an existing subscription. Only enter values for
  /// parameters you want to change. Empty parameters are not updated.
  ///
  /// [autoRenew]: When you initally create a subscription, `AutoRenew` is set
  /// to `ENABLED`. If `ENABLED`, the subscription will be automatically renewed
  /// at the end of the existing subscription period. You can change this by
  /// submitting an `UpdateSubscription` request. If the `UpdateSubscription`
  /// request does not included a value for `AutoRenew`, the existing value for
  /// `AutoRenew` remains unchanged.
  Future<UpdateSubscriptionResponse> updateSubscription(
      {String autoRenew}) async {
    return UpdateSubscriptionResponse.fromJson({});
  }
}

class AssociateDrtLogBucketResponse {
  AssociateDrtLogBucketResponse();
  static AssociateDrtLogBucketResponse fromJson(Map<String, dynamic> json) =>
      AssociateDrtLogBucketResponse();
}

class AssociateDrtRoleResponse {
  AssociateDrtRoleResponse();
  static AssociateDrtRoleResponse fromJson(Map<String, dynamic> json) =>
      AssociateDrtRoleResponse();
}

class AttackDetail {
  /// The unique identifier (ID) of the attack.
  final String attackId;

  /// The ARN (Amazon Resource Name) of the resource that was attacked.
  final String resourceArn;

  /// If applicable, additional detail about the resource being attacked, for
  /// example, IP address or URL.
  final List<SubResourceSummary> subResources;

  /// The time the attack started, in Unix time in seconds. For more information
  /// see
  /// [timestamp](http://docs.aws.amazon.com/cli/latest/userguide/cli-using-param.html#parameter-types).
  final DateTime startTime;

  /// The time the attack ended, in Unix time in seconds. For more information
  /// see
  /// [timestamp](http://docs.aws.amazon.com/cli/latest/userguide/cli-using-param.html#parameter-types).
  final DateTime endTime;

  /// List of counters that describe the attack for the specified time period.
  final List<SummarizedCounter> attackCounters;

  /// The array of AttackProperty objects.
  final List<AttackProperty> attackProperties;

  /// List of mitigation actions taken for the attack.
  final List<Mitigation> mitigations;

  AttackDetail({
    this.attackId,
    this.resourceArn,
    this.subResources,
    this.startTime,
    this.endTime,
    this.attackCounters,
    this.attackProperties,
    this.mitigations,
  });
  static AttackDetail fromJson(Map<String, dynamic> json) => AttackDetail();
}

class AttackProperty {
  /// The type of distributed denial of service (DDoS) event that was observed.
  /// `NETWORK` indicates layer 3 and layer 4 events and `APPLICATION` indicates
  /// layer 7 events.
  final String attackLayer;

  /// Defines the DDoS attack property information that is provided. The
  /// `WORDPRESS\_PINGBACK\_REFLECTOR` and `WORDPRESS\_PINGBACK\_SOURCE` values
  /// are valid only for WordPress reflective pingback DDoS attacks.
  final String attackPropertyIdentifier;

  /// The array of Contributor objects that includes the top five contributors
  /// to an attack.
  final List<Contributor> topContributors;

  /// The unit of the `Value` of the contributions.
  final String unit;

  /// The total contributions made to this attack by all contributors, not just
  /// the five listed in the `TopContributors` list.
  final BigInt total;

  AttackProperty({
    this.attackLayer,
    this.attackPropertyIdentifier,
    this.topContributors,
    this.unit,
    this.total,
  });
  static AttackProperty fromJson(Map<String, dynamic> json) => AttackProperty();
}

class AttackSummary {
  /// The unique identifier (ID) of the attack.
  final String attackId;

  /// The ARN (Amazon Resource Name) of the resource that was attacked.
  final String resourceArn;

  /// The start time of the attack, in Unix time in seconds. For more
  /// information see
  /// [timestamp](http://docs.aws.amazon.com/cli/latest/userguide/cli-using-param.html#parameter-types).
  final DateTime startTime;

  /// The end time of the attack, in Unix time in seconds. For more information
  /// see
  /// [timestamp](http://docs.aws.amazon.com/cli/latest/userguide/cli-using-param.html#parameter-types).
  final DateTime endTime;

  /// The list of attacks for a specified time period.
  final List<AttackVectorDescription> attackVectors;

  AttackSummary({
    this.attackId,
    this.resourceArn,
    this.startTime,
    this.endTime,
    this.attackVectors,
  });
  static AttackSummary fromJson(Map<String, dynamic> json) => AttackSummary();
}

class AttackVectorDescription {
  /// The attack type. Valid values:
  ///
  /// *   UDP_TRAFFIC
  ///
  /// *   UDP_FRAGMENT
  ///
  /// *   GENERIC\_UDP\_REFLECTION
  ///
  /// *   DNS_REFLECTION
  ///
  /// *   NTP_REFLECTION
  ///
  /// *   CHARGEN_REFLECTION
  ///
  /// *   SSDP_REFLECTION
  ///
  /// *   PORT_MAPPER
  ///
  /// *   RIP_REFLECTION
  ///
  /// *   SNMP_REFLECTION
  ///
  /// *   MSSQL_REFLECTION
  ///
  /// *   NET\_BIOS\_REFLECTION
  ///
  /// *   SYN_FLOOD
  ///
  /// *   ACK_FLOOD
  ///
  /// *   REQUEST_FLOOD
  ///
  /// *   HTTP_REFLECTION
  ///
  /// *   UDS_REFLECTION
  ///
  /// *   MEMCACHED_REFLECTION
  final String vectorType;

  AttackVectorDescription({
    @required this.vectorType,
  });
  static AttackVectorDescription fromJson(Map<String, dynamic> json) =>
      AttackVectorDescription();
}

class Contributor {
  /// The name of the contributor. This is dependent on the
  /// `AttackPropertyIdentifier`. For example, if the `AttackPropertyIdentifier`
  /// is `SOURCE_COUNTRY`, the `Name` could be `United States`.
  final String name;

  /// The contribution of this contributor expressed in Protection units. For
  /// example `10,000`.
  final BigInt value;

  Contributor({
    this.name,
    this.value,
  });
  static Contributor fromJson(Map<String, dynamic> json) => Contributor();
}

class CreateProtectionResponse {
  /// The unique identifier (ID) for the Protection object that is created.
  final String protectionId;

  CreateProtectionResponse({
    this.protectionId,
  });
  static CreateProtectionResponse fromJson(Map<String, dynamic> json) =>
      CreateProtectionResponse();
}

class CreateSubscriptionResponse {
  CreateSubscriptionResponse();
  static CreateSubscriptionResponse fromJson(Map<String, dynamic> json) =>
      CreateSubscriptionResponse();
}

class DeleteProtectionResponse {
  DeleteProtectionResponse();
  static DeleteProtectionResponse fromJson(Map<String, dynamic> json) =>
      DeleteProtectionResponse();
}

class DeleteSubscriptionResponse {
  DeleteSubscriptionResponse();
  static DeleteSubscriptionResponse fromJson(Map<String, dynamic> json) =>
      DeleteSubscriptionResponse();
}

class DescribeAttackResponse {
  /// The attack that is described.
  final AttackDetail attack;

  DescribeAttackResponse({
    this.attack,
  });
  static DescribeAttackResponse fromJson(Map<String, dynamic> json) =>
      DescribeAttackResponse();
}

class DescribeDrtAccessResponse {
  /// The Amazon Resource Name (ARN) of the role the DRT used to access your AWS
  /// account.
  final String roleArn;

  /// The list of Amazon S3 buckets accessed by the DRT.
  final List<String> logBucketList;

  DescribeDrtAccessResponse({
    this.roleArn,
    this.logBucketList,
  });
  static DescribeDrtAccessResponse fromJson(Map<String, dynamic> json) =>
      DescribeDrtAccessResponse();
}

class DescribeEmergencyContactSettingsResponse {
  /// A list of email addresses that the DRT can use to contact you during a
  /// suspected attack.
  final List<EmergencyContact> emergencyContactList;

  DescribeEmergencyContactSettingsResponse({
    this.emergencyContactList,
  });
  static DescribeEmergencyContactSettingsResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeEmergencyContactSettingsResponse();
}

class DescribeProtectionResponse {
  /// The Protection object that is described.
  final Protection protection;

  DescribeProtectionResponse({
    this.protection,
  });
  static DescribeProtectionResponse fromJson(Map<String, dynamic> json) =>
      DescribeProtectionResponse();
}

class DescribeSubscriptionResponse {
  /// The AWS Shield Advanced subscription details for an account.
  final Subscription subscription;

  DescribeSubscriptionResponse({
    this.subscription,
  });
  static DescribeSubscriptionResponse fromJson(Map<String, dynamic> json) =>
      DescribeSubscriptionResponse();
}

class DisassociateDrtLogBucketResponse {
  DisassociateDrtLogBucketResponse();
  static DisassociateDrtLogBucketResponse fromJson(Map<String, dynamic> json) =>
      DisassociateDrtLogBucketResponse();
}

class DisassociateDrtRoleResponse {
  DisassociateDrtRoleResponse();
  static DisassociateDrtRoleResponse fromJson(Map<String, dynamic> json) =>
      DisassociateDrtRoleResponse();
}

class EmergencyContact {
  /// An email address that the DRT can use to contact you during a suspected
  /// attack.
  final String emailAddress;

  EmergencyContact({
    @required this.emailAddress,
  });
  static EmergencyContact fromJson(Map<String, dynamic> json) =>
      EmergencyContact();
}

class GetSubscriptionStateResponse {
  /// The status of the subscription.
  final String subscriptionState;

  GetSubscriptionStateResponse({
    @required this.subscriptionState,
  });
  static GetSubscriptionStateResponse fromJson(Map<String, dynamic> json) =>
      GetSubscriptionStateResponse();
}

class Limit {
  /// The type of protection.
  final String type;

  /// The maximum number of protections that can be created for the specified
  /// `Type`.
  final BigInt max;

  Limit({
    this.type,
    this.max,
  });
  static Limit fromJson(Map<String, dynamic> json) => Limit();
}

class ListAttacksResponse {
  /// The attack information for the specified time range.
  final List<AttackSummary> attackSummaries;

  /// The token returned by a previous call to indicate that there is more data
  /// available. If not null, more results are available. Pass this value for
  /// the `NextMarker` parameter in a subsequent call to `ListAttacks` to
  /// retrieve the next set of items.
  ///
  /// AWS WAF might return the list of AttackSummary objects in batches smaller
  /// than the number specified by MaxResults. If there are more AttackSummary
  /// objects to return, AWS WAF will always also return a `NextToken`.
  final String nextToken;

  ListAttacksResponse({
    this.attackSummaries,
    this.nextToken,
  });
  static ListAttacksResponse fromJson(Map<String, dynamic> json) =>
      ListAttacksResponse();
}

class ListProtectionsResponse {
  /// The array of enabled Protection objects.
  final List<Protection> protections;

  /// If you specify a value for `MaxResults` and you have more Protections than
  /// the value of MaxResults, AWS Shield Advanced returns a NextToken value in
  /// the response that allows you to list another group of Protections. For the
  /// second and subsequent ListProtections requests, specify the value of
  /// NextToken from the previous response to get information about another
  /// batch of Protections.
  ///
  /// AWS WAF might return the list of Protection objects in batches smaller
  /// than the number specified by MaxResults. If there are more Protection
  /// objects to return, AWS WAF will always also return a `NextToken`.
  final String nextToken;

  ListProtectionsResponse({
    this.protections,
    this.nextToken,
  });
  static ListProtectionsResponse fromJson(Map<String, dynamic> json) =>
      ListProtectionsResponse();
}

class Mitigation {
  /// The name of the mitigation taken for this attack.
  final String mitigationName;

  Mitigation({
    this.mitigationName,
  });
  static Mitigation fromJson(Map<String, dynamic> json) => Mitigation();
}

class Protection {
  /// The unique identifier (ID) of the protection.
  final String id;

  /// The friendly name of the protection. For example, `My CloudFront
  /// distributions`.
  final String name;

  /// The ARN (Amazon Resource Name) of the AWS resource that is protected.
  final String resourceArn;

  Protection({
    this.id,
    this.name,
    this.resourceArn,
  });
  static Protection fromJson(Map<String, dynamic> json) => Protection();
}

class SubResourceSummary {
  /// The `SubResource` type.
  final String type;

  /// The unique identifier (ID) of the `SubResource`.
  final String id;

  /// The list of attack types and associated counters.
  final List<SummarizedAttackVector> attackVectors;

  /// The counters that describe the details of the attack.
  final List<SummarizedCounter> counters;

  SubResourceSummary({
    this.type,
    this.id,
    this.attackVectors,
    this.counters,
  });
  static SubResourceSummary fromJson(Map<String, dynamic> json) =>
      SubResourceSummary();
}

class Subscription {
  /// The start time of the subscription, in Unix time in seconds. For more
  /// information see
  /// [timestamp](http://docs.aws.amazon.com/cli/latest/userguide/cli-using-param.html#parameter-types).
  final DateTime startTime;

  /// The date and time your subscription will end.
  final DateTime endTime;

  /// The length, in seconds, of the AWS Shield Advanced subscription for the
  /// account.
  final BigInt timeCommitmentInSeconds;

  /// If `ENABLED`, the subscription will be automatically renewed at the end of
  /// the existing subscription period.
  ///
  /// When you initally create a subscription, `AutoRenew` is set to `ENABLED`.
  /// You can change this by submitting an `UpdateSubscription` request. If the
  /// `UpdateSubscription` request does not included a value for `AutoRenew`,
  /// the existing value for `AutoRenew` remains unchanged.
  final String autoRenew;

  /// Specifies how many protections of a given type you can create.
  final List<Limit> limits;

  Subscription({
    this.startTime,
    this.endTime,
    this.timeCommitmentInSeconds,
    this.autoRenew,
    this.limits,
  });
  static Subscription fromJson(Map<String, dynamic> json) => Subscription();
}

class SummarizedAttackVector {
  /// The attack type, for example, SNMP reflection or SYN flood.
  final String vectorType;

  /// The list of counters that describe the details of the attack.
  final List<SummarizedCounter> vectorCounters;

  SummarizedAttackVector({
    @required this.vectorType,
    this.vectorCounters,
  });
  static SummarizedAttackVector fromJson(Map<String, dynamic> json) =>
      SummarizedAttackVector();
}

class SummarizedCounter {
  /// The counter name.
  final String name;

  /// The maximum value of the counter for a specified time period.
  final double max;

  /// The average value of the counter for a specified time period.
  final double average;

  /// The total of counter values for a specified time period.
  final double sum;

  /// The number of counters for a specified time period.
  final int n;

  /// The unit of the counters.
  final String unit;

  SummarizedCounter({
    this.name,
    this.max,
    this.average,
    this.sum,
    this.n,
    this.unit,
  });
  static SummarizedCounter fromJson(Map<String, dynamic> json) =>
      SummarizedCounter();
}

class TimeRange {
  /// The start time, in Unix time in seconds. For more information see
  /// [timestamp](http://docs.aws.amazon.com/cli/latest/userguide/cli-using-param.html#parameter-types).
  final DateTime fromInclusive;

  /// The end time, in Unix time in seconds. For more information see
  /// [timestamp](http://docs.aws.amazon.com/cli/latest/userguide/cli-using-param.html#parameter-types).
  final DateTime toExclusive;

  TimeRange({
    this.fromInclusive,
    this.toExclusive,
  });
}

class UpdateEmergencyContactSettingsResponse {
  UpdateEmergencyContactSettingsResponse();
  static UpdateEmergencyContactSettingsResponse fromJson(
          Map<String, dynamic> json) =>
      UpdateEmergencyContactSettingsResponse();
}

class UpdateSubscriptionResponse {
  UpdateSubscriptionResponse();
  static UpdateSubscriptionResponse fromJson(Map<String, dynamic> json) =>
      UpdateSubscriptionResponse();
}
