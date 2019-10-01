import 'package:meta/meta.dart';

/// Security Hub provides you with a comprehensive view of the security state of
/// your AWS environment and resources. It also provides you with the compliance
/// status of your environment based on CIS AWS Foundations compliance checks.
/// Security Hub collects security data from AWS accounts, services, and
/// integrated third-party products and helps you analyze security trends in
/// your environment to identify the highest priority security issues. For more
/// information about Security Hub, see the  _[AWS Security Hub User
/// Guide](https://docs.aws.amazon.com/securityhub/latest/userguide/what-is-securityhub.html)_
/// .
///
/// When you use operations in the Security Hub API, the requests are executed
/// only in the AWS Region that is currently active or in the specific AWS
/// Region that you specify in your request. Any configuration or settings
/// change that results from the operation is applied only to that Region. To
/// make the same change in other Regions, execute the same command for each
/// Region to apply the change to. For example, if your Region is set to
/// `us-west-2`, when you use `CreateMembers` to add a member account to
/// Security Hub, the association of the member account with the master account
/// is created only in the us-west-2 Region. Security Hub must be enabled for
/// the member account in the same Region that the invite was sent from.
class SecurityHubApi {
  /// Accepts the invitation to be a member account and be monitored by the
  /// Security Hub master account that the invitation was sent from. When the
  /// member account accepts the invitation, permission is granted to the master
  /// account to view findings generated in the member account.
  Future<void> acceptInvitation(
      {@required String masterId, @required String invitationId}) async {}

  /// Disables the standards specified by the provided
  /// `StandardsSubscriptionArns`. For more information, see [Standards
  /// Supported in AWS Security
  /// Hub](https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards.html).
  Future<void> batchDisableStandards(
      List<String> standardsSubscriptionArns) async {}

  /// Enables the standards specified by the provided `standardsArn`. In this
  /// release, only CIS AWS Foundations standards are supported. For more
  /// information, see [Standards Supported in AWS Security
  /// Hub](https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards.html).
  Future<void> batchEnableStandards(
      List<StandardsSubscriptionRequest> standardsSubscriptionRequests) async {}

  /// Imports security findings generated from an integrated third-party product
  /// into Security Hub. This action is requested by the integrated product to
  /// import its findings into Security Hub. The maximum allowed size for a
  /// finding is 240 Kb. An error is returned for any finding larger than 240
  /// Kb.
  Future<void> batchImportFindings(List<AwsSecurityFinding> findings) async {}

  /// Creates a custom action target in Security Hub. You can use custom actions
  /// on findings and insights in Security Hub to trigger target actions in
  /// Amazon CloudWatch Events.
  Future<void> createActionTarget(
      {@required String name,
      @required String description,
      @required String id}) async {}

  /// Creates a custom insight in Security Hub. An insight is a consolidation of
  /// findings that relate to a security issue that requires attention or
  /// remediation. Use the `GroupByAttribute` to group the related findings in
  /// the insight.
  Future<void> createInsight(
      {@required String name,
      @required AwsSecurityFindingFilters filters,
      @required String groupByAttribute}) async {}

  /// Creates a member association in Security Hub between the specified
  /// accounts and the account used to make the request, which is the master
  /// account. To successfully create a member, you must use this action from an
  /// account that already has Security Hub enabled. You can use the
  /// EnableSecurityHub to enable Security Hub.
  ///
  /// After you use `CreateMembers` to create member account associations in
  /// Security Hub, you need to use the InviteMembers action, which invites the
  /// accounts to enable Security Hub and become member accounts in Security
  /// Hub. If the invitation is accepted by the account owner, the account
  /// becomes a member account in Security Hub, and a permission policy is added
  /// that permits the master account to view the findings generated in the
  /// member account. When Security Hub is enabled in the invited account,
  /// findings start being sent to both the member and master accounts.
  ///
  /// You can remove the association between the master and member accounts by
  /// using the DisassociateFromMasterAccount or DisassociateMembers operation.
  Future<void> createMembers({List<AccountDetails> accountDetails}) async {}

  /// Declines invitations to become a member account.
  Future<void> declineInvitations(List<String> accountIds) async {}

  /// Deletes a custom action target from Security Hub. Deleting a custom action
  /// target doesn't affect any findings or insights that were already sent to
  /// Amazon CloudWatch Events using the custom action.
  Future<void> deleteActionTarget(String actionTargetArn) async {}

  /// Deletes the insight specified by the `InsightArn`.
  Future<void> deleteInsight(String insightArn) async {}

  /// Deletes invitations received by the AWS account to become a member
  /// account.
  Future<void> deleteInvitations(List<String> accountIds) async {}

  /// Deletes the specified member accounts from Security Hub.
  Future<void> deleteMembers({List<String> accountIds}) async {}

  /// Returns a list of the custom action targets in Security Hub in your
  /// account.
  Future<void> describeActionTargets(
      {List<String> actionTargetArns,
      String nextToken,
      int maxResults}) async {}

  /// Returns details about the Hub resource in your account, including the
  /// `HubArn` and the time when you enabled Security Hub.
  Future<void> describeHub({String hubArn}) async {}

  /// Returns information about the products available that you can subscribe to
  /// and integrate with Security Hub to consolidate findings.
  Future<void> describeProducts({String nextToken, int maxResults}) async {}

  /// Disables the integration of the specified product with Security Hub.
  /// Findings from that product are no longer sent to Security Hub after the
  /// integration is disabled.
  Future<void> disableImportFindingsForProduct(
      String productSubscriptionArn) async {}

  /// Disables Security Hub in your account only in the current Region. To
  /// disable Security Hub in all Regions, you must submit one request per
  /// Region where you have enabled Security Hub. When you disable Security Hub
  /// for a master account, it doesn't disable Security Hub for any associated
  /// member accounts.
  ///
  /// When you disable Security Hub, your existing findings and insights and any
  /// Security Hub configuration settings are deleted after 90 days and can't be
  /// recovered. Any standards that were enabled are disabled, and your master
  /// and member account associations are removed. If you want to save your
  /// existing findings, you must export them before you disable Security Hub.
  Future<void> disableSecurityHub() async {}

  /// Disassociates the current Security Hub member account from the associated
  /// master account.
  Future<void> disassociateFromMasterAccount() async {}

  /// Disassociates the specified member accounts from the associated master
  /// account.
  Future<void> disassociateMembers({List<String> accountIds}) async {}

  /// Enables the integration of a partner product with Security Hub. Integrated
  /// products send findings to Security Hub. When you enable a product
  /// integration, a permission policy that grants permission for the product to
  /// send findings to Security Hub is applied.
  Future<void> enableImportFindingsForProduct(String productArn) async {}

  /// Enables Security Hub for your account in the current Region or the Region
  /// you specify in the request. When you enable Security Hub, you grant to
  /// Security Hub the permissions necessary to gather findings from AWS Config,
  /// Amazon GuardDuty, Amazon Inspector, and Amazon Macie. To learn more, see
  /// [Setting Up AWS Security
  /// Hub](https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-settingup.html).
  Future<void> enableSecurityHub({Map<String, String> tags}) async {}

  /// Returns a list of the standards that are currently enabled.
  Future<void> getEnabledStandards(
      {List<String> standardsSubscriptionArns,
      String nextToken,
      int maxResults}) async {}

  /// Returns a list of findings that match the specified criteria.
  Future<void> getFindings(
      {AwsSecurityFindingFilters filters,
      List<SortCriterion> sortCriteria,
      String nextToken,
      int maxResults}) async {}

  /// Lists the results of the Security Hub insight that the insight ARN
  /// specifies.
  Future<void> getInsightResults(String insightArn) async {}

  /// Lists and describes insights that insight ARNs specify.
  Future<void> getInsights(
      {List<String> insightArns, String nextToken, int maxResults}) async {}

  /// Returns the count of all Security Hub membership invitations that were
  /// sent to the current member account, not including the currently accepted
  /// invitation.
  Future<void> getInvitationsCount() async {}

  /// Provides the details for the Security Hub master account to the current
  /// member account.
  Future<void> getMasterAccount() async {}

  /// Returns the details on the Security Hub member accounts that the account
  /// IDs specify.
  Future<void> getMembers(List<String> accountIds) async {}

  /// Invites other AWS accounts to become member accounts for the Security Hub
  /// master account that the invitation is sent from. Before you can use this
  /// action to invite a member, you must first create the member account in
  /// Security Hub by using the CreateMembers action. When the account owner
  /// accepts the invitation to become a member account and enables Security
  /// Hub, the master account can view the findings generated from member
  /// account.
  Future<void> inviteMembers({List<String> accountIds}) async {}

  /// Lists all findings-generating solutions (products) whose findings you have
  /// subscribed to receive in Security Hub.
  Future<void> listEnabledProductsForImport(
      {String nextToken, int maxResults}) async {}

  /// Lists all Security Hub membership invitations that were sent to the
  /// current AWS account.
  Future<void> listInvitations({int maxResults, String nextToken}) async {}

  /// Lists details about all member accounts for the current Security Hub
  /// master account.
  Future<void> listMembers(
      {bool onlyAssociated, int maxResults, String nextToken}) async {}

  /// Returns a list of tags associated with a resource.
  Future<void> listTagsForResource(String resourceArn) async {}

  /// Adds one or more tags to a resource.
  Future<void> tagResource(
      {@required String resourceArn,
      @required Map<String, String> tags}) async {}

  /// Removes one or more tags from a resource.
  Future<void> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {}

  /// Updates the name and description of a custom action target in Security
  /// Hub.
  Future<void> updateActionTarget(String actionTargetArn,
      {String name, String description}) async {}

  /// Updates the `Note` and `RecordState` of the Security Hub-aggregated
  /// findings that the filter attributes specify. Any member account that can
  /// view the finding also sees the update to the finding.
  Future<void> updateFindings(AwsSecurityFindingFilters filters,
      {NoteUpdate note, String recordState}) async {}

  /// Updates the Security Hub insight that the insight ARN specifies.
  Future<void> updateInsight(String insightArn,
      {String name,
      AwsSecurityFindingFilters filters,
      String groupByAttribute}) async {}
}

class AcceptInvitationResponse {}

class AccountDetails {}

class ActionTarget {}

class AwsEc2InstanceDetails {}

class AwsIamAccessKeyDetails {}

class AwsS3BucketDetails {}

class AwsSecurityFinding {}

class AwsSecurityFindingFilters {}

class BatchDisableStandardsResponse {}

class BatchEnableStandardsResponse {}

class BatchImportFindingsResponse {}

class Compliance {}

class ContainerDetails {}

class CreateActionTargetResponse {}

class CreateInsightResponse {}

class CreateMembersResponse {}

class DateFilter {}

class DateRange {}

class DeclineInvitationsResponse {}

class DeleteActionTargetResponse {}

class DeleteInsightResponse {}

class DeleteInvitationsResponse {}

class DeleteMembersResponse {}

class DescribeActionTargetsResponse {}

class DescribeHubResponse {}

class DescribeProductsResponse {}

class DisableImportFindingsForProductResponse {}

class DisableSecurityHubResponse {}

class DisassociateFromMasterAccountResponse {}

class DisassociateMembersResponse {}

class EnableImportFindingsForProductResponse {}

class EnableSecurityHubResponse {}

class GetEnabledStandardsResponse {}

class GetFindingsResponse {}

class GetInsightResultsResponse {}

class GetInsightsResponse {}

class GetInvitationsCountResponse {}

class GetMasterAccountResponse {}

class GetMembersResponse {}

class ImportFindingsError {}

class Insight {}

class InsightResultValue {}

class InsightResults {}

class Invitation {}

class InviteMembersResponse {}

class IpFilter {}

class KeywordFilter {}

class ListEnabledProductsForImportResponse {}

class ListInvitationsResponse {}

class ListMembersResponse {}

class ListTagsForResourceResponse {}

class Malware {}

class MapFilter {}

class Member {}

class Network {}

class Note {}

class NoteUpdate {}

class NumberFilter {}

class ProcessDetails {}

class Product {}

class Recommendation {}

class RelatedFinding {}

class Remediation {}

class Resource {}

class ResourceDetails {}

class Result {}

class Severity {}

class SortCriterion {}

class StandardsSubscription {}

class StandardsSubscriptionRequest {}

class StringFilter {}

class TagResourceResponse {}

class ThreatIntelIndicator {}

class UntagResourceResponse {}

class UpdateActionTargetResponse {}

class UpdateFindingsResponse {}

class UpdateInsightResponse {}
