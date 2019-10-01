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
  Future<void> associateDrtLogBucket(String logBucket) async {}

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
  Future<void> associateDrtRole(String roleArn) async {}

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
  Future<void> createProtection(
      {@required String name, @required String resourceArn}) async {}

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
  Future<void> createSubscription() async {}

  /// Deletes an AWS Shield Advanced Protection.
  Future<void> deleteProtection(String protectionId) async {}

  /// Removes AWS Shield Advanced from an account. AWS Shield Advanced requires
  /// a 1-year subscription commitment. You cannot delete a subscription prior
  /// to the completion of that commitment.
  Future<void> deleteSubscription() async {}

  /// Describes the details of a DDoS attack.
  Future<void> describeAttack(String attackId) async {}

  /// Returns the current role and list of Amazon S3 log buckets used by the
  /// DDoS Response team (DRT) to access your AWS account while assisting with
  /// attack mitigation.
  Future<void> describeDrtAccess() async {}

  /// Lists the email addresses that the DRT can use to contact you during a
  /// suspected attack.
  Future<void> describeEmergencyContactSettings() async {}

  /// Lists the details of a Protection object.
  Future<void> describeProtection(
      {String protectionId, String resourceArn}) async {}

  /// Provides details about the AWS Shield Advanced subscription for an
  /// account.
  Future<void> describeSubscription() async {}

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
  Future<void> disassociateDrtLogBucket(String logBucket) async {}

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
  Future<void> disassociateDrtRole() async {}

  /// Returns the `SubscriptionState`, either `Active` or `Inactive`.
  Future<void> getSubscriptionState() async {}

  /// Returns all ongoing DDoS attacks or all DDoS attacks during a specified
  /// time period.
  Future<void> listAttacks(
      {List<String> resourceArns,
      TimeRange startTime,
      TimeRange endTime,
      String nextToken,
      int maxResults}) async {}

  /// Lists all Protection objects for the account.
  Future<void> listProtections({String nextToken, int maxResults}) async {}

  /// Updates the details of the list of email addresses that the DRT can use to
  /// contact you during a suspected attack.
  Future<void> updateEmergencyContactSettings(
      {List<EmergencyContact> emergencyContactList}) async {}

  /// Updates the details of an existing subscription. Only enter values for
  /// parameters you want to change. Empty parameters are not updated.
  Future<void> updateSubscription({String autoRenew}) async {}
}

class AssociateDrtLogBucketResponse {}

class AssociateDrtRoleResponse {}

class AttackDetail {}

class AttackProperty {}

class AttackSummary {}

class AttackVectorDescription {}

class Contributor {}

class CreateProtectionResponse {}

class CreateSubscriptionResponse {}

class DeleteProtectionResponse {}

class DeleteSubscriptionResponse {}

class DescribeAttackResponse {}

class DescribeDrtAccessResponse {}

class DescribeEmergencyContactSettingsResponse {}

class DescribeProtectionResponse {}

class DescribeSubscriptionResponse {}

class DisassociateDrtLogBucketResponse {}

class DisassociateDrtRoleResponse {}

class EmergencyContact {}

class GetSubscriptionStateResponse {}

class Limit {}

class ListAttacksResponse {}

class ListProtectionsResponse {}

class Mitigation {}

class Protection {}

class SubResourceSummary {}

class Subscription {}

class SummarizedAttackVector {}

class SummarizedCounter {}

class TimeRange {}

class UpdateEmergencyContactSettingsResponse {}

class UpdateSubscriptionResponse {}
