import 'package:meta/meta.dart';

/// AWS Firewall Manager
///
/// This is the _AWS Firewall Manager API Reference_. This guide is for
/// developers who need detailed information about the AWS Firewall Manager API
/// actions, data types, and errors. For detailed information about AWS Firewall
/// Manager features, see the [AWS Firewall Manager Developer
/// Guide](https://docs.aws.amazon.com/waf/latest/developerguide/fms-chapter.html).
class FmsApi {
  /// Sets the AWS Firewall Manager administrator account. AWS Firewall Manager
  /// must be associated with the master account your AWS organization or
  /// associated with a member account that has the appropriate permissions. If
  /// the account ID that you submit is not an AWS Organizations master account,
  /// AWS Firewall Manager will set the appropriate permissions for the given
  /// member account.
  ///
  /// The account that you associate with AWS Firewall Manager is called the AWS
  /// Firewall Manager administrator account.
  Future<void> associateAdminAccount(String adminAccount) async {}

  /// Deletes an AWS Firewall Manager association with the IAM role and the
  /// Amazon Simple Notification Service (SNS) topic that is used to record AWS
  /// Firewall Manager SNS logs.
  Future<void> deleteNotificationChannel() async {}

  /// Permanently deletes an AWS Firewall Manager policy.
  Future<void> deletePolicy(String policyId,
      {bool deleteAllPolicyResources}) async {}

  /// Disassociates the account that has been set as the AWS Firewall Manager
  /// administrator account. To set a different account as the administrator
  /// account, you must submit an `AssociateAdminAccount` request .
  Future<void> disassociateAdminAccount() async {}

  /// Returns the AWS Organizations master account that is associated with AWS
  /// Firewall Manager as the AWS Firewall Manager administrator.
  Future<void> getAdminAccount() async {}

  /// Returns detailed compliance information about the specified member
  /// account. Details include resources that are in and out of compliance with
  /// the specified policy. Resources are considered non-compliant if the
  /// specified policy has not been applied to them.
  Future<void> getComplianceDetail(
      {@required String policyId, @required String memberAccount}) async {}

  /// Returns information about the Amazon Simple Notification Service (SNS)
  /// topic that is used to record AWS Firewall Manager SNS logs.
  Future<void> getNotificationChannel() async {}

  /// Returns information about the specified AWS Firewall Manager policy.
  Future<void> getPolicy(String policyId) async {}

  /// If you created a Shield Advanced policy, returns policy-level attack
  /// summary information in the event of a potential DDoS attack.
  Future<void> getProtectionStatus(String policyId,
      {String memberAccountId,
      DateTime startTime,
      DateTime endTime,
      String nextToken,
      int maxResults}) async {}

  /// Returns an array of `PolicyComplianceStatus` objects in the response. Use
  /// `PolicyComplianceStatus` to get a summary of which member accounts are
  /// protected by the specified policy.
  Future<void> listComplianceStatus(String policyId,
      {String nextToken, int maxResults}) async {}

  /// Returns a `MemberAccounts` object that lists the member accounts in the
  /// administrator's AWS organization.
  ///
  /// The `ListMemberAccounts` must be submitted by the account that is set as
  /// the AWS Firewall Manager administrator.
  Future<void> listMemberAccounts({String nextToken, int maxResults}) async {}

  /// Returns an array of `PolicySummary` objects in the response.
  Future<void> listPolicies({String nextToken, int maxResults}) async {}

  /// Designates the IAM role and Amazon Simple Notification Service (SNS) topic
  /// that AWS Firewall Manager uses to record SNS logs.
  Future<void> putNotificationChannel(
      {@required String snsTopicArn, @required String snsRoleName}) async {}

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
  Future<void> putPolicy(Policy policy) async {}
}

class ComplianceViolator {}

class EvaluationResult {}

class GetAdminAccountResponse {}

class GetComplianceDetailResponse {}

class GetNotificationChannelResponse {}

class GetPolicyResponse {}

class GetProtectionStatusResponse {}

class ListComplianceStatusResponse {}

class ListMemberAccountsResponse {}

class ListPoliciesResponse {}

class Policy {}

class PolicyComplianceDetail {}

class PolicyComplianceStatus {}

class PolicySummary {}

class PutPolicyResponse {}

class ResourceTag {}

class SecurityServicePolicyData {}
