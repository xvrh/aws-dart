import 'package:meta/meta.dart';

/// Security Hub provides you with a comprehensive view of the security state of
/// your AWS environment and resources. It also provides you with the compliance
/// status of your environment based on CIS AWS Foundations compliance checks.
/// Security Hub collects security data from AWS accounts, services, and
/// integrated third-party products and helps you analyze security trends in
/// your environment to identify the highest priority security issues. For more
/// information about Security Hub, see the
/// _[AWS Security Hub User Guide](https://docs.aws.amazon.com/securityhub/latest/userguide/what-is-securityhub.html)_
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
  final _client;
  SecurityHubApi(client)
      : _client = client.configured('SecurityHub', serializer: 'rest-json');

  /// Accepts the invitation to be a member account and be monitored by the
  /// Security Hub master account that the invitation was sent from. When the
  /// member account accepts the invitation, permission is granted to the master
  /// account to view findings generated in the member account.
  ///
  /// [masterId]: The account ID of the Security Hub master account that sent
  /// the invitation.
  ///
  /// [invitationId]: The ID of the invitation sent from the Security Hub master
  /// account.
  Future<AcceptInvitationResponse> acceptInvitation(
      {@required String masterId, @required String invitationId}) async {
    var response_ = await _client.send('AcceptInvitation', {
      'MasterId': masterId,
      'InvitationId': invitationId,
    });
    return AcceptInvitationResponse.fromJson(response_);
  }

  /// Disables the standards specified by the provided
  /// `StandardsSubscriptionArns`. For more information, see
  /// [Standards Supported in AWS Security Hub](https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards.html).
  ///
  /// [standardsSubscriptionArns]: The ARNs of the standards subscriptions to
  /// disable.
  Future<BatchDisableStandardsResponse> batchDisableStandards(
      List<String> standardsSubscriptionArns) async {
    var response_ = await _client.send('BatchDisableStandards', {
      'StandardsSubscriptionArns': standardsSubscriptionArns,
    });
    return BatchDisableStandardsResponse.fromJson(response_);
  }

  /// Enables the standards specified by the provided `standardsArn`. In this
  /// release, only CIS AWS Foundations standards are supported. For more
  /// information, see
  /// [Standards Supported in AWS Security Hub](https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards.html).
  ///
  /// [standardsSubscriptionRequests]: The list of standards compliance checks
  /// to enable.
  ///
  ///
  ///
  /// In this release, Security Hub supports only the CIS AWS Foundations
  /// standard.
  ///
  /// The ARN for the standard is
  /// `arn:aws:securityhub:::ruleset/cis-aws-foundations-benchmark/v/1.2.0`.
  Future<BatchEnableStandardsResponse> batchEnableStandards(
      List<StandardsSubscriptionRequest> standardsSubscriptionRequests) async {
    var response_ = await _client.send('BatchEnableStandards', {
      'StandardsSubscriptionRequests': standardsSubscriptionRequests,
    });
    return BatchEnableStandardsResponse.fromJson(response_);
  }

  /// Imports security findings generated from an integrated third-party product
  /// into Security Hub. This action is requested by the integrated product to
  /// import its findings into Security Hub. The maximum allowed size for a
  /// finding is 240 Kb. An error is returned for any finding larger than 240
  /// Kb.
  ///
  /// [findings]: A list of findings to import. To successfully import a
  /// finding, it must follow the
  /// [AWS Security Finding Format](https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-findings-format.html).
  Future<BatchImportFindingsResponse> batchImportFindings(
      List<AwsSecurityFinding> findings) async {
    var response_ = await _client.send('BatchImportFindings', {
      'Findings': findings,
    });
    return BatchImportFindingsResponse.fromJson(response_);
  }

  /// Creates a custom action target in Security Hub. You can use custom actions
  /// on findings and insights in Security Hub to trigger target actions in
  /// Amazon CloudWatch Events.
  ///
  /// [name]: The name of the custom action target.
  ///
  /// [description]: The description for the custom action target.
  ///
  /// [id]: The ID for the custom action target.
  Future<CreateActionTargetResponse> createActionTarget(
      {@required String name,
      @required String description,
      @required String id}) async {
    var response_ = await _client.send('CreateActionTarget', {
      'Name': name,
      'Description': description,
      'Id': id,
    });
    return CreateActionTargetResponse.fromJson(response_);
  }

  /// Creates a custom insight in Security Hub. An insight is a consolidation of
  /// findings that relate to a security issue that requires attention or
  /// remediation. Use the `GroupByAttribute` to group the related findings in
  /// the insight.
  ///
  /// [name]: The name of the custom insight to create.
  ///
  /// [filters]: One or more attributes used to filter the findings included in
  /// the insight. Only findings that match the criteria defined in the filters
  /// are included in the insight.
  ///
  /// [groupByAttribute]: The attribute used as the aggregator to group related
  /// findings for the insight.
  Future<CreateInsightResponse> createInsight(
      {@required String name,
      @required AwsSecurityFindingFilters filters,
      @required String groupByAttribute}) async {
    var response_ = await _client.send('CreateInsight', {
      'Name': name,
      'Filters': filters,
      'GroupByAttribute': groupByAttribute,
    });
    return CreateInsightResponse.fromJson(response_);
  }

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
  ///
  /// [accountDetails]: A list of account ID and email address pairs of the
  /// accounts to associate with the Security Hub master account.
  Future<CreateMembersResponse> createMembers(
      {List<AccountDetails> accountDetails}) async {
    var response_ = await _client.send('CreateMembers', {
      if (accountDetails != null) 'AccountDetails': accountDetails,
    });
    return CreateMembersResponse.fromJson(response_);
  }

  /// Declines invitations to become a member account.
  ///
  /// [accountIds]: A list of account IDs that specify the accounts that
  /// invitations to Security Hub are declined from.
  Future<DeclineInvitationsResponse> declineInvitations(
      List<String> accountIds) async {
    var response_ = await _client.send('DeclineInvitations', {
      'AccountIds': accountIds,
    });
    return DeclineInvitationsResponse.fromJson(response_);
  }

  /// Deletes a custom action target from Security Hub. Deleting a custom action
  /// target doesn't affect any findings or insights that were already sent to
  /// Amazon CloudWatch Events using the custom action.
  ///
  /// [actionTargetArn]: The ARN of the custom action target to delete.
  Future<DeleteActionTargetResponse> deleteActionTarget(
      String actionTargetArn) async {
    var response_ = await _client.send('DeleteActionTarget', {
      'ActionTargetArn': actionTargetArn,
    });
    return DeleteActionTargetResponse.fromJson(response_);
  }

  /// Deletes the insight specified by the `InsightArn`.
  ///
  /// [insightArn]: The ARN of the insight to delete.
  Future<DeleteInsightResponse> deleteInsight(String insightArn) async {
    var response_ = await _client.send('DeleteInsight', {
      'InsightArn': insightArn,
    });
    return DeleteInsightResponse.fromJson(response_);
  }

  /// Deletes invitations received by the AWS account to become a member
  /// account.
  ///
  /// [accountIds]: A list of the account IDs that sent the invitations to
  /// delete.
  Future<DeleteInvitationsResponse> deleteInvitations(
      List<String> accountIds) async {
    var response_ = await _client.send('DeleteInvitations', {
      'AccountIds': accountIds,
    });
    return DeleteInvitationsResponse.fromJson(response_);
  }

  /// Deletes the specified member accounts from Security Hub.
  ///
  /// [accountIds]: A list of account IDs of the member accounts to delete.
  Future<DeleteMembersResponse> deleteMembers({List<String> accountIds}) async {
    var response_ = await _client.send('DeleteMembers', {
      if (accountIds != null) 'AccountIds': accountIds,
    });
    return DeleteMembersResponse.fromJson(response_);
  }

  /// Returns a list of the custom action targets in Security Hub in your
  /// account.
  ///
  /// [actionTargetArns]: A list of custom action target ARNs for the custom
  /// action targets to retrieve.
  ///
  /// [nextToken]: The token that is required for pagination.
  ///
  /// [maxResults]: The maximum number of results to return.
  Future<DescribeActionTargetsResponse> describeActionTargets(
      {List<String> actionTargetArns, String nextToken, int maxResults}) async {
    var response_ = await _client.send('DescribeActionTargets', {
      if (actionTargetArns != null) 'ActionTargetArns': actionTargetArns,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return DescribeActionTargetsResponse.fromJson(response_);
  }

  /// Returns details about the Hub resource in your account, including the
  /// `HubArn` and the time when you enabled Security Hub.
  ///
  /// [hubArn]: The ARN of the Hub resource to retrieve.
  Future<DescribeHubResponse> describeHub({String hubArn}) async {
    var response_ = await _client.send('DescribeHub', {
      if (hubArn != null) 'HubArn': hubArn,
    });
    return DescribeHubResponse.fromJson(response_);
  }

  /// Returns information about the products available that you can subscribe to
  /// and integrate with Security Hub to consolidate findings.
  ///
  /// [nextToken]: The token that is required for pagination.
  ///
  /// [maxResults]: The maximum number of results to return.
  Future<DescribeProductsResponse> describeProducts(
      {String nextToken, int maxResults}) async {
    var response_ = await _client.send('DescribeProducts', {
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return DescribeProductsResponse.fromJson(response_);
  }

  /// Disables the integration of the specified product with Security Hub.
  /// Findings from that product are no longer sent to Security Hub after the
  /// integration is disabled.
  ///
  /// [productSubscriptionArn]: The ARN of the integrated product to disable the
  /// integration for.
  Future<DisableImportFindingsForProductResponse>
      disableImportFindingsForProduct(String productSubscriptionArn) async {
    var response_ = await _client.send('DisableImportFindingsForProduct', {
      'ProductSubscriptionArn': productSubscriptionArn,
    });
    return DisableImportFindingsForProductResponse.fromJson(response_);
  }

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
  Future<DisableSecurityHubResponse> disableSecurityHub() async {
    var response_ = await _client.send('DisableSecurityHub', {});
    return DisableSecurityHubResponse.fromJson(response_);
  }

  /// Disassociates the current Security Hub member account from the associated
  /// master account.
  Future<DisassociateFromMasterAccountResponse>
      disassociateFromMasterAccount() async {
    var response_ = await _client.send('DisassociateFromMasterAccount', {});
    return DisassociateFromMasterAccountResponse.fromJson(response_);
  }

  /// Disassociates the specified member accounts from the associated master
  /// account.
  ///
  /// [accountIds]: The account IDs of the member accounts to disassociate from
  /// the master account.
  Future<DisassociateMembersResponse> disassociateMembers(
      {List<String> accountIds}) async {
    var response_ = await _client.send('DisassociateMembers', {
      if (accountIds != null) 'AccountIds': accountIds,
    });
    return DisassociateMembersResponse.fromJson(response_);
  }

  /// Enables the integration of a partner product with Security Hub. Integrated
  /// products send findings to Security Hub. When you enable a product
  /// integration, a permission policy that grants permission for the product to
  /// send findings to Security Hub is applied.
  ///
  /// [productArn]: The ARN of the product to enable the integration for.
  Future<EnableImportFindingsForProductResponse> enableImportFindingsForProduct(
      String productArn) async {
    var response_ = await _client.send('EnableImportFindingsForProduct', {
      'ProductArn': productArn,
    });
    return EnableImportFindingsForProductResponse.fromJson(response_);
  }

  /// Enables Security Hub for your account in the current Region or the Region
  /// you specify in the request. When you enable Security Hub, you grant to
  /// Security Hub the permissions necessary to gather findings from AWS Config,
  /// Amazon GuardDuty, Amazon Inspector, and Amazon Macie. To learn more, see
  /// [Setting Up AWS Security Hub](https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-settingup.html).
  ///
  /// [tags]: The tags to add to the Hub resource when you enable Security Hub.
  Future<EnableSecurityHubResponse> enableSecurityHub(
      {Map<String, String> tags}) async {
    var response_ = await _client.send('EnableSecurityHub', {
      if (tags != null) 'Tags': tags,
    });
    return EnableSecurityHubResponse.fromJson(response_);
  }

  /// Returns a list of the standards that are currently enabled.
  ///
  /// [standardsSubscriptionArns]: A list of the standards subscription ARNs for
  /// the standards to retrieve.
  ///
  /// [nextToken]: Paginates results. On your first call to the
  /// `GetEnabledStandards` operation, set the value of this parameter to
  /// `NULL`. For subsequent calls to the operation, fill `nextToken` in the
  /// request with the value of `nextToken` from the previous response to
  /// continue listing data.
  ///
  /// [maxResults]: The maximum number of results to return in the response.
  Future<GetEnabledStandardsResponse> getEnabledStandards(
      {List<String> standardsSubscriptionArns,
      String nextToken,
      int maxResults}) async {
    var response_ = await _client.send('GetEnabledStandards', {
      if (standardsSubscriptionArns != null)
        'StandardsSubscriptionArns': standardsSubscriptionArns,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return GetEnabledStandardsResponse.fromJson(response_);
  }

  /// Returns a list of findings that match the specified criteria.
  ///
  /// [filters]: The findings attributes used to define a condition to filter
  /// the findings returned.
  ///
  /// [sortCriteria]: Findings attributes used to sort the list of findings
  /// returned.
  ///
  /// [nextToken]: Paginates results. On your first call to the `GetFindings`
  /// operation, set the value of this parameter to `NULL`. For subsequent calls
  /// to the operation, fill `nextToken` in the request with the value of
  /// `nextToken` from the previous response to continue listing data.
  ///
  /// [maxResults]: The maximum number of findings to return.
  Future<GetFindingsResponse> getFindings(
      {AwsSecurityFindingFilters filters,
      List<SortCriterion> sortCriteria,
      String nextToken,
      int maxResults}) async {
    var response_ = await _client.send('GetFindings', {
      if (filters != null) 'Filters': filters,
      if (sortCriteria != null) 'SortCriteria': sortCriteria,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return GetFindingsResponse.fromJson(response_);
  }

  /// Lists the results of the Security Hub insight that the insight ARN
  /// specifies.
  ///
  /// [insightArn]: The ARN of the insight whose results you want to see.
  Future<GetInsightResultsResponse> getInsightResults(String insightArn) async {
    var response_ = await _client.send('GetInsightResults', {
      'InsightArn': insightArn,
    });
    return GetInsightResultsResponse.fromJson(response_);
  }

  /// Lists and describes insights that insight ARNs specify.
  ///
  /// [insightArns]: The ARNs of the insights that you want to describe.
  ///
  /// [nextToken]: Paginates results. On your first call to the `GetInsights`
  /// operation, set the value of this parameter to `NULL`. For subsequent calls
  /// to the operation, fill `nextToken` in the request with the value of
  /// `nextToken` from the previous response to continue listing data.
  ///
  /// [maxResults]: The maximum number of items that you want in the response.
  Future<GetInsightsResponse> getInsights(
      {List<String> insightArns, String nextToken, int maxResults}) async {
    var response_ = await _client.send('GetInsights', {
      if (insightArns != null) 'InsightArns': insightArns,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return GetInsightsResponse.fromJson(response_);
  }

  /// Returns the count of all Security Hub membership invitations that were
  /// sent to the current member account, not including the currently accepted
  /// invitation.
  Future<GetInvitationsCountResponse> getInvitationsCount() async {
    var response_ = await _client.send('GetInvitationsCount', {});
    return GetInvitationsCountResponse.fromJson(response_);
  }

  /// Provides the details for the Security Hub master account to the current
  /// member account.
  Future<GetMasterAccountResponse> getMasterAccount() async {
    var response_ = await _client.send('GetMasterAccount', {});
    return GetMasterAccountResponse.fromJson(response_);
  }

  /// Returns the details on the Security Hub member accounts that the account
  /// IDs specify.
  ///
  /// [accountIds]: A list of account IDs for the Security Hub member accounts
  /// that you want to return the details for.
  Future<GetMembersResponse> getMembers(List<String> accountIds) async {
    var response_ = await _client.send('GetMembers', {
      'AccountIds': accountIds,
    });
    return GetMembersResponse.fromJson(response_);
  }

  /// Invites other AWS accounts to become member accounts for the Security Hub
  /// master account that the invitation is sent from. Before you can use this
  /// action to invite a member, you must first create the member account in
  /// Security Hub by using the CreateMembers action. When the account owner
  /// accepts the invitation to become a member account and enables Security
  /// Hub, the master account can view the findings generated from member
  /// account.
  ///
  /// [accountIds]: A list of IDs of the AWS accounts that you want to invite to
  /// Security Hub as members.
  Future<InviteMembersResponse> inviteMembers({List<String> accountIds}) async {
    var response_ = await _client.send('InviteMembers', {
      if (accountIds != null) 'AccountIds': accountIds,
    });
    return InviteMembersResponse.fromJson(response_);
  }

  /// Lists all findings-generating solutions (products) whose findings you have
  /// subscribed to receive in Security Hub.
  ///
  /// [nextToken]: Paginates results. On your first call to the
  /// `ListEnabledProductsForImport` operation, set the value of this parameter
  /// to `NULL`. For subsequent calls to the operation, fill `nextToken` in the
  /// request with the value of `NextToken` from the previous response to
  /// continue listing data.
  ///
  /// [maxResults]: The maximum number of items that you want in the response.
  Future<ListEnabledProductsForImportResponse> listEnabledProductsForImport(
      {String nextToken, int maxResults}) async {
    var response_ = await _client.send('ListEnabledProductsForImport', {
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return ListEnabledProductsForImportResponse.fromJson(response_);
  }

  /// Lists all Security Hub membership invitations that were sent to the
  /// current AWS account.
  ///
  /// [maxResults]: The maximum number of items that you want in the response.
  ///
  /// [nextToken]: Paginates results. On your first call to the
  /// `ListInvitations` operation, set the value of this parameter to `NULL`.
  /// For subsequent calls to the operation, fill `nextToken` in the request
  /// with the value of `NextToken` from the previous response to continue
  /// listing data.
  Future<ListInvitationsResponse> listInvitations(
      {int maxResults, String nextToken}) async {
    var response_ = await _client.send('ListInvitations', {
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListInvitationsResponse.fromJson(response_);
  }

  /// Lists details about all member accounts for the current Security Hub
  /// master account.
  ///
  /// [onlyAssociated]: Specifies which member accounts the response includes
  /// based on their relationship status with the master account. The default
  /// value is `TRUE`. If `onlyAssociated` is set to `TRUE`, the response
  /// includes member accounts whose relationship status with the master is set
  /// to `ENABLED` or `DISABLED`. If `onlyAssociated` is set to `FALSE`, the
  /// response includes all existing member accounts.
  ///
  /// [maxResults]: The maximum number of items that you want in the response.
  ///
  /// [nextToken]: Paginates results. Set the value of this parameter to `NULL`
  /// on your first call to the `ListMembers` operation. For subsequent calls to
  /// the operation, fill `nextToken` in the request with the value of
  /// `nextToken` from the previous response to continue listing data.
  Future<ListMembersResponse> listMembers(
      {bool onlyAssociated, int maxResults, String nextToken}) async {
    var response_ = await _client.send('ListMembers', {
      if (onlyAssociated != null) 'OnlyAssociated': onlyAssociated,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListMembersResponse.fromJson(response_);
  }

  /// Returns a list of tags associated with a resource.
  ///
  /// [resourceArn]: The ARN of the resource to retrieve tags for.
  Future<ListTagsForResourceResponse> listTagsForResource(
      String resourceArn) async {
    var response_ = await _client.send('ListTagsForResource', {
      'ResourceArn': resourceArn,
    });
    return ListTagsForResourceResponse.fromJson(response_);
  }

  /// Adds one or more tags to a resource.
  ///
  /// [resourceArn]: The ARN of the resource to apply the tags to.
  ///
  /// [tags]: The tags to add to the resource.
  Future<TagResourceResponse> tagResource(
      {@required String resourceArn,
      @required Map<String, String> tags}) async {
    var response_ = await _client.send('TagResource', {
      'ResourceArn': resourceArn,
      'Tags': tags,
    });
    return TagResourceResponse.fromJson(response_);
  }

  /// Removes one or more tags from a resource.
  ///
  /// [resourceArn]: The ARN of the resource to remove the tags from.
  ///
  /// [tagKeys]: The tag keys associated with the tags to remove from the
  /// resource.
  Future<UntagResourceResponse> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {
    var response_ = await _client.send('UntagResource', {
      'ResourceArn': resourceArn,
      'TagKeys': tagKeys,
    });
    return UntagResourceResponse.fromJson(response_);
  }

  /// Updates the name and description of a custom action target in Security
  /// Hub.
  ///
  /// [actionTargetArn]: The ARN of the custom action target to update.
  ///
  /// [name]: The updated name of the custom action target.
  ///
  /// [description]: The updated description for the custom action target.
  Future<UpdateActionTargetResponse> updateActionTarget(String actionTargetArn,
      {String name, String description}) async {
    var response_ = await _client.send('UpdateActionTarget', {
      'ActionTargetArn': actionTargetArn,
      if (name != null) 'Name': name,
      if (description != null) 'Description': description,
    });
    return UpdateActionTargetResponse.fromJson(response_);
  }

  /// Updates the `Note` and `RecordState` of the Security Hub-aggregated
  /// findings that the filter attributes specify. Any member account that can
  /// view the finding also sees the update to the finding.
  ///
  /// [filters]: A collection of attributes that specify which findings you want
  /// to update.
  ///
  /// [note]: The updated note for the finding.
  ///
  /// [recordState]: The updated record state for the finding.
  Future<UpdateFindingsResponse> updateFindings(
      AwsSecurityFindingFilters filters,
      {NoteUpdate note,
      String recordState}) async {
    var response_ = await _client.send('UpdateFindings', {
      'Filters': filters,
      if (note != null) 'Note': note,
      if (recordState != null) 'RecordState': recordState,
    });
    return UpdateFindingsResponse.fromJson(response_);
  }

  /// Updates the Security Hub insight that the insight ARN specifies.
  ///
  /// [insightArn]: The ARN of the insight that you want to update.
  ///
  /// [name]: The updated name for the insight.
  ///
  /// [filters]: The updated filters that define this insight.
  ///
  /// [groupByAttribute]: The updated `GroupBy` attribute that defines this
  /// insight.
  Future<UpdateInsightResponse> updateInsight(String insightArn,
      {String name,
      AwsSecurityFindingFilters filters,
      String groupByAttribute}) async {
    var response_ = await _client.send('UpdateInsight', {
      'InsightArn': insightArn,
      if (name != null) 'Name': name,
      if (filters != null) 'Filters': filters,
      if (groupByAttribute != null) 'GroupByAttribute': groupByAttribute,
    });
    return UpdateInsightResponse.fromJson(response_);
  }
}

class AcceptInvitationResponse {
  AcceptInvitationResponse();
  static AcceptInvitationResponse fromJson(Map<String, dynamic> json) =>
      AcceptInvitationResponse();
}

/// The details of an AWS account.
class AccountDetails {
  /// The ID of an AWS account.
  final String accountId;

  /// The email of an AWS account.
  final String email;

  AccountDetails({
    this.accountId,
    this.email,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// An `ActionTarget` object.
class ActionTarget {
  /// The ARN for the target action.
  final String actionTargetArn;

  /// The name of the action target.
  final String name;

  /// The description of the target action.
  final String description;

  ActionTarget({
    @required this.actionTargetArn,
    @required this.name,
    @required this.description,
  });
  static ActionTarget fromJson(Map<String, dynamic> json) => ActionTarget(
        actionTargetArn: json['ActionTargetArn'] as String,
        name: json['Name'] as String,
        description: json['Description'] as String,
      );
}

/// The details of an Amazon EC2 instance.
class AwsEc2InstanceDetails {
  /// The instance type of the instance.
  final String type;

  /// The Amazon Machine Image (AMI) ID of the instance.
  final String imageId;

  /// The IPv4 addresses associated with the instance.
  final List<String> ipV4Addresses;

  /// The IPv6 addresses associated with the instance.
  final List<String> ipV6Addresses;

  /// The key name associated with the instance.
  final String keyName;

  /// The IAM profile ARN of the instance.
  final String iamInstanceProfileArn;

  /// The identifier of the VPC that the instance was launched in.
  final String vpcId;

  /// The identifier of the subnet that the instance was launched in.
  final String subnetId;

  /// The date/time the instance was launched.
  final String launchedAt;

  AwsEc2InstanceDetails({
    this.type,
    this.imageId,
    this.ipV4Addresses,
    this.ipV6Addresses,
    this.keyName,
    this.iamInstanceProfileArn,
    this.vpcId,
    this.subnetId,
    this.launchedAt,
  });
  static AwsEc2InstanceDetails fromJson(Map<String, dynamic> json) =>
      AwsEc2InstanceDetails(
        type: json.containsKey('Type') ? json['Type'] as String : null,
        imageId: json.containsKey('ImageId') ? json['ImageId'] as String : null,
        ipV4Addresses: json.containsKey('IpV4Addresses')
            ? (json['IpV4Addresses'] as List).map((e) => e as String).toList()
            : null,
        ipV6Addresses: json.containsKey('IpV6Addresses')
            ? (json['IpV6Addresses'] as List).map((e) => e as String).toList()
            : null,
        keyName: json.containsKey('KeyName') ? json['KeyName'] as String : null,
        iamInstanceProfileArn: json.containsKey('IamInstanceProfileArn')
            ? json['IamInstanceProfileArn'] as String
            : null,
        vpcId: json.containsKey('VpcId') ? json['VpcId'] as String : null,
        subnetId:
            json.containsKey('SubnetId') ? json['SubnetId'] as String : null,
        launchedAt: json.containsKey('LaunchedAt')
            ? json['LaunchedAt'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// IAM access key details related to a finding.
class AwsIamAccessKeyDetails {
  /// The user associated with the IAM access key related to a finding.
  final String userName;

  /// The status of the IAM access key related to a finding.
  final String status;

  /// The creation date/time of the IAM access key related to a finding.
  final String createdAt;

  AwsIamAccessKeyDetails({
    this.userName,
    this.status,
    this.createdAt,
  });
  static AwsIamAccessKeyDetails fromJson(Map<String, dynamic> json) =>
      AwsIamAccessKeyDetails(
        userName:
            json.containsKey('UserName') ? json['UserName'] as String : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        createdAt:
            json.containsKey('CreatedAt') ? json['CreatedAt'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The details of an Amazon S3 bucket.
class AwsS3BucketDetails {
  /// The canonical user ID of the owner of the S3 bucket.
  final String ownerId;

  /// The display name of the owner of the S3 bucket.
  final String ownerName;

  AwsS3BucketDetails({
    this.ownerId,
    this.ownerName,
  });
  static AwsS3BucketDetails fromJson(Map<String, dynamic> json) =>
      AwsS3BucketDetails(
        ownerId: json.containsKey('OwnerId') ? json['OwnerId'] as String : null,
        ownerName:
            json.containsKey('OwnerName') ? json['OwnerName'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides consistent format for the contents of the Security Hub-aggregated
/// findings. `AwsSecurityFinding` format enables you to share findings between
/// AWS security services and third-party solutions, and compliance checks.
///
///
///
/// A finding is a potential security issue generated either by AWS services
/// (Amazon GuardDuty, Amazon Inspector, and Amazon Macie) or by the integrated
/// third-party solutions and compliance checks.
class AwsSecurityFinding {
  /// The schema version that a finding is formatted for.
  final String schemaVersion;

  /// The security findings provider-specific identifier for a finding.
  final String id;

  /// The ARN generated by Security Hub that uniquely identifies a third-party
  /// company (security-findings provider) after this provider's product
  /// (solution that generates findings) is registered with Security Hub.
  final String productArn;

  /// The identifier for the solution-specific component (a discrete unit of
  /// logic) that generated a finding. In various security-findings providers'
  /// solutions, this generator can be called a rule, a check, a detector, a
  /// plug-in, etc.
  final String generatorId;

  /// The AWS account ID that a finding is generated in.
  final String awsAccountId;

  /// One or more finding types in the format of `namespace/category/classifier`
  /// that classify a finding.
  ///
  /// Valid namespace values are: Software and Configuration Checks | TTPs |
  /// Effects | Unusual Behaviors | Sensitive Data Identifications
  final List<String> types;

  /// An ISO8601-formatted timestamp that indicates when the security-findings
  /// provider first observed the potential security issue that a finding
  /// captured.
  final String firstObservedAt;

  /// An ISO8601-formatted timestamp that indicates when the security-findings
  /// provider most recently observed the potential security issue that a
  /// finding captured.
  final String lastObservedAt;

  /// An ISO8601-formatted timestamp that indicates when the security-findings
  /// provider created the potential security issue that a finding captured.
  final String createdAt;

  /// An ISO8601-formatted timestamp that indicates when the security-findings
  /// provider last updated the finding record.
  final String updatedAt;

  /// A finding's severity.
  final Severity severity;

  /// A finding's confidence. Confidence is defined as the likelihood that a
  /// finding accurately identifies the behavior or issue that it was intended
  /// to identify. Confidence is scored on a 0-100 basis using a ratio scale,
  /// where 0 means zero percent confidence and 100 means 100 percent
  /// confidence.
  final int confidence;

  /// The level of importance assigned to the resources associated with the
  /// finding. A score of 0 means that the underlying resources have no
  /// criticality, and a score of 100 is reserved for the most critical
  /// resources.
  final int criticality;

  /// A finding's title.
  ///
  ///
  ///
  /// In this release, `Title` is a required property.
  final String title;

  /// A finding's description.
  ///
  ///
  ///
  /// In this release, `Description` is a required property.
  final String description;

  /// A data type that describes the remediation options for a finding.
  final Remediation remediation;

  /// A URL that links to a page about the current finding in the
  /// security-findings provider's solution.
  final String sourceUrl;

  /// A data type where security-findings providers can include additional
  /// solution-specific details that aren't part of the defined
  /// `AwsSecurityFinding` format.
  final Map<String, String> productFields;

  /// A list of name/value string pairs associated with the finding. These are
  /// custom, user-defined fields added to a finding.
  final Map<String, String> userDefinedFields;

  /// A list of malware related to a finding.
  final List<Malware> malware;

  /// The details of network-related information about a finding.
  final Network network;

  /// The details of process-related information about a finding.
  final ProcessDetails process;

  /// Threat intel details related to a finding.
  final List<ThreatIntelIndicator> threatIntelIndicators;

  /// A set of resource data types that describe the resources that the finding
  /// refers to.
  final List<Resource> resources;

  /// This data type is exclusive to findings that are generated as the result
  /// of a check run against a specific rule in a supported standard (for
  /// example, CIS AWS Foundations). Contains compliance-related finding
  /// details.
  final Compliance compliance;

  /// Indicates the veracity of a finding.
  final String verificationState;

  /// The workflow state of a finding.
  final String workflowState;

  /// The record state of a finding.
  final String recordState;

  /// A list of related findings.
  final List<RelatedFinding> relatedFindings;

  /// A user-defined note added to a finding.
  final Note note;

  AwsSecurityFinding({
    @required this.schemaVersion,
    @required this.id,
    @required this.productArn,
    @required this.generatorId,
    @required this.awsAccountId,
    @required this.types,
    this.firstObservedAt,
    this.lastObservedAt,
    @required this.createdAt,
    @required this.updatedAt,
    @required this.severity,
    this.confidence,
    this.criticality,
    @required this.title,
    @required this.description,
    this.remediation,
    this.sourceUrl,
    this.productFields,
    this.userDefinedFields,
    this.malware,
    this.network,
    this.process,
    this.threatIntelIndicators,
    @required this.resources,
    this.compliance,
    this.verificationState,
    this.workflowState,
    this.recordState,
    this.relatedFindings,
    this.note,
  });
  static AwsSecurityFinding fromJson(Map<String, dynamic> json) =>
      AwsSecurityFinding(
        schemaVersion: json['SchemaVersion'] as String,
        id: json['Id'] as String,
        productArn: json['ProductArn'] as String,
        generatorId: json['GeneratorId'] as String,
        awsAccountId: json['AwsAccountId'] as String,
        types: (json['Types'] as List).map((e) => e as String).toList(),
        firstObservedAt: json.containsKey('FirstObservedAt')
            ? json['FirstObservedAt'] as String
            : null,
        lastObservedAt: json.containsKey('LastObservedAt')
            ? json['LastObservedAt'] as String
            : null,
        createdAt: json['CreatedAt'] as String,
        updatedAt: json['UpdatedAt'] as String,
        severity: Severity.fromJson(json['Severity']),
        confidence:
            json.containsKey('Confidence') ? json['Confidence'] as int : null,
        criticality:
            json.containsKey('Criticality') ? json['Criticality'] as int : null,
        title: json['Title'] as String,
        description: json['Description'] as String,
        remediation: json.containsKey('Remediation')
            ? Remediation.fromJson(json['Remediation'])
            : null,
        sourceUrl:
            json.containsKey('SourceUrl') ? json['SourceUrl'] as String : null,
        productFields: json.containsKey('ProductFields')
            ? (json['ProductFields'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        userDefinedFields: json.containsKey('UserDefinedFields')
            ? (json['UserDefinedFields'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        malware: json.containsKey('Malware')
            ? (json['Malware'] as List).map((e) => Malware.fromJson(e)).toList()
            : null,
        network: json.containsKey('Network')
            ? Network.fromJson(json['Network'])
            : null,
        process: json.containsKey('Process')
            ? ProcessDetails.fromJson(json['Process'])
            : null,
        threatIntelIndicators: json.containsKey('ThreatIntelIndicators')
            ? (json['ThreatIntelIndicators'] as List)
                .map((e) => ThreatIntelIndicator.fromJson(e))
                .toList()
            : null,
        resources: (json['Resources'] as List)
            .map((e) => Resource.fromJson(e))
            .toList(),
        compliance: json.containsKey('Compliance')
            ? Compliance.fromJson(json['Compliance'])
            : null,
        verificationState: json.containsKey('VerificationState')
            ? json['VerificationState'] as String
            : null,
        workflowState: json.containsKey('WorkflowState')
            ? json['WorkflowState'] as String
            : null,
        recordState: json.containsKey('RecordState')
            ? json['RecordState'] as String
            : null,
        relatedFindings: json.containsKey('RelatedFindings')
            ? (json['RelatedFindings'] as List)
                .map((e) => RelatedFinding.fromJson(e))
                .toList()
            : null,
        note: json.containsKey('Note') ? Note.fromJson(json['Note']) : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A collection of attributes that are applied to all active Security
/// Hub-aggregated findings and that result in a subset of findings that are
/// included in this insight.
class AwsSecurityFindingFilters {
  /// The ARN generated by Security Hub that uniquely identifies a third-party
  /// company (security findings provider) after this provider's product
  /// (solution that generates findings) is registered with Security Hub.
  final List<StringFilter> productArn;

  /// The AWS account ID that a finding is generated in.
  final List<StringFilter> awsAccountId;

  /// The security findings provider-specific identifier for a finding.
  final List<StringFilter> id;

  /// The identifier for the solution-specific component (a discrete unit of
  /// logic) that generated a finding. In various security-findings providers'
  /// solutions, this generator can be called a rule, a check, a detector, a
  /// plug-in, etc.
  final List<StringFilter> generatorId;

  /// A finding type in the format of `namespace/category/classifier` that
  /// classifies a finding.
  final List<StringFilter> type;

  /// An ISO8601-formatted timestamp that indicates when the security-findings
  /// provider first observed the potential security issue that a finding
  /// captured.
  final List<DateFilter> firstObservedAt;

  /// An ISO8601-formatted timestamp that indicates when the security-findings
  /// provider most recently observed the potential security issue that a
  /// finding captured.
  final List<DateFilter> lastObservedAt;

  /// An ISO8601-formatted timestamp that indicates when the security-findings
  /// provider captured the potential security issue that a finding captured.
  final List<DateFilter> createdAt;

  /// An ISO8601-formatted timestamp that indicates when the security-findings
  /// provider last updated the finding record.
  final List<DateFilter> updatedAt;

  /// The native severity as defined by the security-findings provider's
  /// solution that generated the finding.
  final List<NumberFilter> severityProduct;

  /// The normalized severity of a finding.
  final List<NumberFilter> severityNormalized;

  /// The label of a finding's severity.
  final List<StringFilter> severityLabel;

  /// A finding's confidence. Confidence is defined as the likelihood that a
  /// finding accurately identifies the behavior or issue that it was intended
  /// to identify. Confidence is scored on a 0-100 basis using a ratio scale,
  /// where 0 means zero percent confidence and 100 means 100 percent
  /// confidence.
  final List<NumberFilter> confidence;

  /// The level of importance assigned to the resources associated with the
  /// finding. A score of 0 means that the underlying resources have no
  /// criticality, and a score of 100 is reserved for the most critical
  /// resources.
  final List<NumberFilter> criticality;

  /// A finding's title.
  final List<StringFilter> title;

  /// A finding's description.
  final List<StringFilter> description;

  /// The recommendation of what to do about the issue described in a finding.
  final List<StringFilter> recommendationText;

  /// A URL that links to a page about the current finding in the
  /// security-findings provider's solution.
  final List<StringFilter> sourceUrl;

  /// A data type where security-findings providers can include additional
  /// solution-specific details that aren't part of the defined
  /// `AwsSecurityFinding` format.
  final List<MapFilter> productFields;

  /// The name of the solution (product) that generates findings.
  final List<StringFilter> productName;

  /// The name of the findings provider (company) that owns the solution
  /// (product) that generates findings.
  final List<StringFilter> companyName;

  /// A list of name/value string pairs associated with the finding. These are
  /// custom, user-defined fields added to a finding.
  final List<MapFilter> userDefinedFields;

  /// The name of the malware that was observed.
  final List<StringFilter> malwareName;

  /// The type of the malware that was observed.
  final List<StringFilter> malwareType;

  /// The filesystem path of the malware that was observed.
  final List<StringFilter> malwarePath;

  /// The state of the malware that was observed.
  final List<StringFilter> malwareState;

  /// Indicates the direction of network traffic associated with a finding.
  final List<StringFilter> networkDirection;

  /// The protocol of network-related information about a finding.
  final List<StringFilter> networkProtocol;

  /// The source IPv4 address of network-related information about a finding.
  final List<IpFilter> networkSourceIpV4;

  /// The source IPv6 address of network-related information about a finding.
  final List<IpFilter> networkSourceIpV6;

  /// The source port of network-related information about a finding.
  final List<NumberFilter> networkSourcePort;

  /// The source domain of network-related information about a finding.
  final List<StringFilter> networkSourceDomain;

  /// The source media access control (MAC) address of network-related
  /// information about a finding.
  final List<StringFilter> networkSourceMac;

  /// The destination IPv4 address of network-related information about a
  /// finding.
  final List<IpFilter> networkDestinationIpV4;

  /// The destination IPv6 address of network-related information about a
  /// finding.
  final List<IpFilter> networkDestinationIpV6;

  /// The destination port of network-related information about a finding.
  final List<NumberFilter> networkDestinationPort;

  /// The destination domain of network-related information about a finding.
  final List<StringFilter> networkDestinationDomain;

  /// The name of the process.
  final List<StringFilter> processName;

  /// The path to the process executable.
  final List<StringFilter> processPath;

  /// The process ID.
  final List<NumberFilter> processPid;

  /// The parent process ID.
  final List<NumberFilter> processParentPid;

  /// The date/time that the process was launched.
  final List<DateFilter> processLaunchedAt;

  /// The date/time that the process was terminated.
  final List<DateFilter> processTerminatedAt;

  /// The type of a threat intel indicator.
  final List<StringFilter> threatIntelIndicatorType;

  /// The value of a threat intel indicator.
  final List<StringFilter> threatIntelIndicatorValue;

  /// The category of a threat intel indicator.
  final List<StringFilter> threatIntelIndicatorCategory;

  /// The date/time of the last observation of a threat intel indicator.
  final List<DateFilter> threatIntelIndicatorLastObservedAt;

  /// The source of the threat intel.
  final List<StringFilter> threatIntelIndicatorSource;

  /// The URL for more details from the source of the threat intel.
  final List<StringFilter> threatIntelIndicatorSourceUrl;

  /// Specifies the type of the resource that details are provided for.
  final List<StringFilter> resourceType;

  /// The canonical identifier for the given resource type.
  final List<StringFilter> resourceId;

  /// The canonical AWS partition name that the Region is assigned to.
  final List<StringFilter> resourcePartition;

  /// The canonical AWS external Region name where this resource is located.
  final List<StringFilter> resourceRegion;

  /// A list of AWS tags associated with a resource at the time the finding was
  /// processed.
  final List<MapFilter> resourceTags;

  /// The instance type of the instance.
  final List<StringFilter> resourceAwsEc2InstanceType;

  /// The Amazon Machine Image (AMI) ID of the instance.
  final List<StringFilter> resourceAwsEc2InstanceImageId;

  /// The IPv4 addresses associated with the instance.
  final List<IpFilter> resourceAwsEc2InstanceIpV4Addresses;

  /// The IPv6 addresses associated with the instance.
  final List<IpFilter> resourceAwsEc2InstanceIpV6Addresses;

  /// The key name associated with the instance.
  final List<StringFilter> resourceAwsEc2InstanceKeyName;

  /// The IAM profile ARN of the instance.
  final List<StringFilter> resourceAwsEc2InstanceIamInstanceProfileArn;

  /// The identifier of the VPC that the instance was launched in.
  final List<StringFilter> resourceAwsEc2InstanceVpcId;

  /// The identifier of the subnet that the instance was launched in.
  final List<StringFilter> resourceAwsEc2InstanceSubnetId;

  /// The date/time the instance was launched.
  final List<DateFilter> resourceAwsEc2InstanceLaunchedAt;

  /// The canonical user ID of the owner of the S3 bucket.
  final List<StringFilter> resourceAwsS3BucketOwnerId;

  /// The display name of the owner of the S3 bucket.
  final List<StringFilter> resourceAwsS3BucketOwnerName;

  /// The user associated with the IAM access key related to a finding.
  final List<StringFilter> resourceAwsIamAccessKeyUserName;

  /// The status of the IAM access key related to a finding.
  final List<StringFilter> resourceAwsIamAccessKeyStatus;

  /// The creation date/time of the IAM access key related to a finding.
  final List<DateFilter> resourceAwsIamAccessKeyCreatedAt;

  /// The name of the container related to a finding.
  final List<StringFilter> resourceContainerName;

  /// The identifier of the image related to a finding.
  final List<StringFilter> resourceContainerImageId;

  /// The name of the image related to a finding.
  final List<StringFilter> resourceContainerImageName;

  /// The date/time that the container was started.
  final List<DateFilter> resourceContainerLaunchedAt;

  /// The details of a resource that doesn't have a specific subfield for the
  /// resource type defined.
  final List<MapFilter> resourceDetailsOther;

  /// Exclusive to findings that are generated as the result of a check run
  /// against a specific rule in a supported standard (for example, CIS AWS
  /// Foundations). Contains compliance-related finding details.
  final List<StringFilter> complianceStatus;

  /// The veracity of a finding.
  final List<StringFilter> verificationState;

  /// The workflow state of a finding.
  final List<StringFilter> workflowState;

  /// The updated record state for the finding.
  final List<StringFilter> recordState;

  /// The ARN of the solution that generated a related finding.
  final List<StringFilter> relatedFindingsProductArn;

  /// The solution-generated identifier for a related finding.
  final List<StringFilter> relatedFindingsId;

  /// The text of a note.
  final List<StringFilter> noteText;

  /// The timestamp of when the note was updated.
  final List<DateFilter> noteUpdatedAt;

  /// The principal that created a note.
  final List<StringFilter> noteUpdatedBy;

  /// A keyword for a finding.
  final List<KeywordFilter> keyword;

  AwsSecurityFindingFilters({
    this.productArn,
    this.awsAccountId,
    this.id,
    this.generatorId,
    this.type,
    this.firstObservedAt,
    this.lastObservedAt,
    this.createdAt,
    this.updatedAt,
    this.severityProduct,
    this.severityNormalized,
    this.severityLabel,
    this.confidence,
    this.criticality,
    this.title,
    this.description,
    this.recommendationText,
    this.sourceUrl,
    this.productFields,
    this.productName,
    this.companyName,
    this.userDefinedFields,
    this.malwareName,
    this.malwareType,
    this.malwarePath,
    this.malwareState,
    this.networkDirection,
    this.networkProtocol,
    this.networkSourceIpV4,
    this.networkSourceIpV6,
    this.networkSourcePort,
    this.networkSourceDomain,
    this.networkSourceMac,
    this.networkDestinationIpV4,
    this.networkDestinationIpV6,
    this.networkDestinationPort,
    this.networkDestinationDomain,
    this.processName,
    this.processPath,
    this.processPid,
    this.processParentPid,
    this.processLaunchedAt,
    this.processTerminatedAt,
    this.threatIntelIndicatorType,
    this.threatIntelIndicatorValue,
    this.threatIntelIndicatorCategory,
    this.threatIntelIndicatorLastObservedAt,
    this.threatIntelIndicatorSource,
    this.threatIntelIndicatorSourceUrl,
    this.resourceType,
    this.resourceId,
    this.resourcePartition,
    this.resourceRegion,
    this.resourceTags,
    this.resourceAwsEc2InstanceType,
    this.resourceAwsEc2InstanceImageId,
    this.resourceAwsEc2InstanceIpV4Addresses,
    this.resourceAwsEc2InstanceIpV6Addresses,
    this.resourceAwsEc2InstanceKeyName,
    this.resourceAwsEc2InstanceIamInstanceProfileArn,
    this.resourceAwsEc2InstanceVpcId,
    this.resourceAwsEc2InstanceSubnetId,
    this.resourceAwsEc2InstanceLaunchedAt,
    this.resourceAwsS3BucketOwnerId,
    this.resourceAwsS3BucketOwnerName,
    this.resourceAwsIamAccessKeyUserName,
    this.resourceAwsIamAccessKeyStatus,
    this.resourceAwsIamAccessKeyCreatedAt,
    this.resourceContainerName,
    this.resourceContainerImageId,
    this.resourceContainerImageName,
    this.resourceContainerLaunchedAt,
    this.resourceDetailsOther,
    this.complianceStatus,
    this.verificationState,
    this.workflowState,
    this.recordState,
    this.relatedFindingsProductArn,
    this.relatedFindingsId,
    this.noteText,
    this.noteUpdatedAt,
    this.noteUpdatedBy,
    this.keyword,
  });
  static AwsSecurityFindingFilters fromJson(Map<String, dynamic> json) =>
      AwsSecurityFindingFilters(
        productArn: json.containsKey('ProductArn')
            ? (json['ProductArn'] as List)
                .map((e) => StringFilter.fromJson(e))
                .toList()
            : null,
        awsAccountId: json.containsKey('AwsAccountId')
            ? (json['AwsAccountId'] as List)
                .map((e) => StringFilter.fromJson(e))
                .toList()
            : null,
        id: json.containsKey('Id')
            ? (json['Id'] as List).map((e) => StringFilter.fromJson(e)).toList()
            : null,
        generatorId: json.containsKey('GeneratorId')
            ? (json['GeneratorId'] as List)
                .map((e) => StringFilter.fromJson(e))
                .toList()
            : null,
        type: json.containsKey('Type')
            ? (json['Type'] as List)
                .map((e) => StringFilter.fromJson(e))
                .toList()
            : null,
        firstObservedAt: json.containsKey('FirstObservedAt')
            ? (json['FirstObservedAt'] as List)
                .map((e) => DateFilter.fromJson(e))
                .toList()
            : null,
        lastObservedAt: json.containsKey('LastObservedAt')
            ? (json['LastObservedAt'] as List)
                .map((e) => DateFilter.fromJson(e))
                .toList()
            : null,
        createdAt: json.containsKey('CreatedAt')
            ? (json['CreatedAt'] as List)
                .map((e) => DateFilter.fromJson(e))
                .toList()
            : null,
        updatedAt: json.containsKey('UpdatedAt')
            ? (json['UpdatedAt'] as List)
                .map((e) => DateFilter.fromJson(e))
                .toList()
            : null,
        severityProduct: json.containsKey('SeverityProduct')
            ? (json['SeverityProduct'] as List)
                .map((e) => NumberFilter.fromJson(e))
                .toList()
            : null,
        severityNormalized: json.containsKey('SeverityNormalized')
            ? (json['SeverityNormalized'] as List)
                .map((e) => NumberFilter.fromJson(e))
                .toList()
            : null,
        severityLabel: json.containsKey('SeverityLabel')
            ? (json['SeverityLabel'] as List)
                .map((e) => StringFilter.fromJson(e))
                .toList()
            : null,
        confidence: json.containsKey('Confidence')
            ? (json['Confidence'] as List)
                .map((e) => NumberFilter.fromJson(e))
                .toList()
            : null,
        criticality: json.containsKey('Criticality')
            ? (json['Criticality'] as List)
                .map((e) => NumberFilter.fromJson(e))
                .toList()
            : null,
        title: json.containsKey('Title')
            ? (json['Title'] as List)
                .map((e) => StringFilter.fromJson(e))
                .toList()
            : null,
        description: json.containsKey('Description')
            ? (json['Description'] as List)
                .map((e) => StringFilter.fromJson(e))
                .toList()
            : null,
        recommendationText: json.containsKey('RecommendationText')
            ? (json['RecommendationText'] as List)
                .map((e) => StringFilter.fromJson(e))
                .toList()
            : null,
        sourceUrl: json.containsKey('SourceUrl')
            ? (json['SourceUrl'] as List)
                .map((e) => StringFilter.fromJson(e))
                .toList()
            : null,
        productFields: json.containsKey('ProductFields')
            ? (json['ProductFields'] as List)
                .map((e) => MapFilter.fromJson(e))
                .toList()
            : null,
        productName: json.containsKey('ProductName')
            ? (json['ProductName'] as List)
                .map((e) => StringFilter.fromJson(e))
                .toList()
            : null,
        companyName: json.containsKey('CompanyName')
            ? (json['CompanyName'] as List)
                .map((e) => StringFilter.fromJson(e))
                .toList()
            : null,
        userDefinedFields: json.containsKey('UserDefinedFields')
            ? (json['UserDefinedFields'] as List)
                .map((e) => MapFilter.fromJson(e))
                .toList()
            : null,
        malwareName: json.containsKey('MalwareName')
            ? (json['MalwareName'] as List)
                .map((e) => StringFilter.fromJson(e))
                .toList()
            : null,
        malwareType: json.containsKey('MalwareType')
            ? (json['MalwareType'] as List)
                .map((e) => StringFilter.fromJson(e))
                .toList()
            : null,
        malwarePath: json.containsKey('MalwarePath')
            ? (json['MalwarePath'] as List)
                .map((e) => StringFilter.fromJson(e))
                .toList()
            : null,
        malwareState: json.containsKey('MalwareState')
            ? (json['MalwareState'] as List)
                .map((e) => StringFilter.fromJson(e))
                .toList()
            : null,
        networkDirection: json.containsKey('NetworkDirection')
            ? (json['NetworkDirection'] as List)
                .map((e) => StringFilter.fromJson(e))
                .toList()
            : null,
        networkProtocol: json.containsKey('NetworkProtocol')
            ? (json['NetworkProtocol'] as List)
                .map((e) => StringFilter.fromJson(e))
                .toList()
            : null,
        networkSourceIpV4: json.containsKey('NetworkSourceIpV4')
            ? (json['NetworkSourceIpV4'] as List)
                .map((e) => IpFilter.fromJson(e))
                .toList()
            : null,
        networkSourceIpV6: json.containsKey('NetworkSourceIpV6')
            ? (json['NetworkSourceIpV6'] as List)
                .map((e) => IpFilter.fromJson(e))
                .toList()
            : null,
        networkSourcePort: json.containsKey('NetworkSourcePort')
            ? (json['NetworkSourcePort'] as List)
                .map((e) => NumberFilter.fromJson(e))
                .toList()
            : null,
        networkSourceDomain: json.containsKey('NetworkSourceDomain')
            ? (json['NetworkSourceDomain'] as List)
                .map((e) => StringFilter.fromJson(e))
                .toList()
            : null,
        networkSourceMac: json.containsKey('NetworkSourceMac')
            ? (json['NetworkSourceMac'] as List)
                .map((e) => StringFilter.fromJson(e))
                .toList()
            : null,
        networkDestinationIpV4: json.containsKey('NetworkDestinationIpV4')
            ? (json['NetworkDestinationIpV4'] as List)
                .map((e) => IpFilter.fromJson(e))
                .toList()
            : null,
        networkDestinationIpV6: json.containsKey('NetworkDestinationIpV6')
            ? (json['NetworkDestinationIpV6'] as List)
                .map((e) => IpFilter.fromJson(e))
                .toList()
            : null,
        networkDestinationPort: json.containsKey('NetworkDestinationPort')
            ? (json['NetworkDestinationPort'] as List)
                .map((e) => NumberFilter.fromJson(e))
                .toList()
            : null,
        networkDestinationDomain: json.containsKey('NetworkDestinationDomain')
            ? (json['NetworkDestinationDomain'] as List)
                .map((e) => StringFilter.fromJson(e))
                .toList()
            : null,
        processName: json.containsKey('ProcessName')
            ? (json['ProcessName'] as List)
                .map((e) => StringFilter.fromJson(e))
                .toList()
            : null,
        processPath: json.containsKey('ProcessPath')
            ? (json['ProcessPath'] as List)
                .map((e) => StringFilter.fromJson(e))
                .toList()
            : null,
        processPid: json.containsKey('ProcessPid')
            ? (json['ProcessPid'] as List)
                .map((e) => NumberFilter.fromJson(e))
                .toList()
            : null,
        processParentPid: json.containsKey('ProcessParentPid')
            ? (json['ProcessParentPid'] as List)
                .map((e) => NumberFilter.fromJson(e))
                .toList()
            : null,
        processLaunchedAt: json.containsKey('ProcessLaunchedAt')
            ? (json['ProcessLaunchedAt'] as List)
                .map((e) => DateFilter.fromJson(e))
                .toList()
            : null,
        processTerminatedAt: json.containsKey('ProcessTerminatedAt')
            ? (json['ProcessTerminatedAt'] as List)
                .map((e) => DateFilter.fromJson(e))
                .toList()
            : null,
        threatIntelIndicatorType: json.containsKey('ThreatIntelIndicatorType')
            ? (json['ThreatIntelIndicatorType'] as List)
                .map((e) => StringFilter.fromJson(e))
                .toList()
            : null,
        threatIntelIndicatorValue: json.containsKey('ThreatIntelIndicatorValue')
            ? (json['ThreatIntelIndicatorValue'] as List)
                .map((e) => StringFilter.fromJson(e))
                .toList()
            : null,
        threatIntelIndicatorCategory:
            json.containsKey('ThreatIntelIndicatorCategory')
                ? (json['ThreatIntelIndicatorCategory'] as List)
                    .map((e) => StringFilter.fromJson(e))
                    .toList()
                : null,
        threatIntelIndicatorLastObservedAt:
            json.containsKey('ThreatIntelIndicatorLastObservedAt')
                ? (json['ThreatIntelIndicatorLastObservedAt'] as List)
                    .map((e) => DateFilter.fromJson(e))
                    .toList()
                : null,
        threatIntelIndicatorSource:
            json.containsKey('ThreatIntelIndicatorSource')
                ? (json['ThreatIntelIndicatorSource'] as List)
                    .map((e) => StringFilter.fromJson(e))
                    .toList()
                : null,
        threatIntelIndicatorSourceUrl:
            json.containsKey('ThreatIntelIndicatorSourceUrl')
                ? (json['ThreatIntelIndicatorSourceUrl'] as List)
                    .map((e) => StringFilter.fromJson(e))
                    .toList()
                : null,
        resourceType: json.containsKey('ResourceType')
            ? (json['ResourceType'] as List)
                .map((e) => StringFilter.fromJson(e))
                .toList()
            : null,
        resourceId: json.containsKey('ResourceId')
            ? (json['ResourceId'] as List)
                .map((e) => StringFilter.fromJson(e))
                .toList()
            : null,
        resourcePartition: json.containsKey('ResourcePartition')
            ? (json['ResourcePartition'] as List)
                .map((e) => StringFilter.fromJson(e))
                .toList()
            : null,
        resourceRegion: json.containsKey('ResourceRegion')
            ? (json['ResourceRegion'] as List)
                .map((e) => StringFilter.fromJson(e))
                .toList()
            : null,
        resourceTags: json.containsKey('ResourceTags')
            ? (json['ResourceTags'] as List)
                .map((e) => MapFilter.fromJson(e))
                .toList()
            : null,
        resourceAwsEc2InstanceType:
            json.containsKey('ResourceAwsEc2InstanceType')
                ? (json['ResourceAwsEc2InstanceType'] as List)
                    .map((e) => StringFilter.fromJson(e))
                    .toList()
                : null,
        resourceAwsEc2InstanceImageId:
            json.containsKey('ResourceAwsEc2InstanceImageId')
                ? (json['ResourceAwsEc2InstanceImageId'] as List)
                    .map((e) => StringFilter.fromJson(e))
                    .toList()
                : null,
        resourceAwsEc2InstanceIpV4Addresses:
            json.containsKey('ResourceAwsEc2InstanceIpV4Addresses')
                ? (json['ResourceAwsEc2InstanceIpV4Addresses'] as List)
                    .map((e) => IpFilter.fromJson(e))
                    .toList()
                : null,
        resourceAwsEc2InstanceIpV6Addresses:
            json.containsKey('ResourceAwsEc2InstanceIpV6Addresses')
                ? (json['ResourceAwsEc2InstanceIpV6Addresses'] as List)
                    .map((e) => IpFilter.fromJson(e))
                    .toList()
                : null,
        resourceAwsEc2InstanceKeyName:
            json.containsKey('ResourceAwsEc2InstanceKeyName')
                ? (json['ResourceAwsEc2InstanceKeyName'] as List)
                    .map((e) => StringFilter.fromJson(e))
                    .toList()
                : null,
        resourceAwsEc2InstanceIamInstanceProfileArn:
            json.containsKey('ResourceAwsEc2InstanceIamInstanceProfileArn')
                ? (json['ResourceAwsEc2InstanceIamInstanceProfileArn'] as List)
                    .map((e) => StringFilter.fromJson(e))
                    .toList()
                : null,
        resourceAwsEc2InstanceVpcId:
            json.containsKey('ResourceAwsEc2InstanceVpcId')
                ? (json['ResourceAwsEc2InstanceVpcId'] as List)
                    .map((e) => StringFilter.fromJson(e))
                    .toList()
                : null,
        resourceAwsEc2InstanceSubnetId:
            json.containsKey('ResourceAwsEc2InstanceSubnetId')
                ? (json['ResourceAwsEc2InstanceSubnetId'] as List)
                    .map((e) => StringFilter.fromJson(e))
                    .toList()
                : null,
        resourceAwsEc2InstanceLaunchedAt:
            json.containsKey('ResourceAwsEc2InstanceLaunchedAt')
                ? (json['ResourceAwsEc2InstanceLaunchedAt'] as List)
                    .map((e) => DateFilter.fromJson(e))
                    .toList()
                : null,
        resourceAwsS3BucketOwnerId:
            json.containsKey('ResourceAwsS3BucketOwnerId')
                ? (json['ResourceAwsS3BucketOwnerId'] as List)
                    .map((e) => StringFilter.fromJson(e))
                    .toList()
                : null,
        resourceAwsS3BucketOwnerName:
            json.containsKey('ResourceAwsS3BucketOwnerName')
                ? (json['ResourceAwsS3BucketOwnerName'] as List)
                    .map((e) => StringFilter.fromJson(e))
                    .toList()
                : null,
        resourceAwsIamAccessKeyUserName:
            json.containsKey('ResourceAwsIamAccessKeyUserName')
                ? (json['ResourceAwsIamAccessKeyUserName'] as List)
                    .map((e) => StringFilter.fromJson(e))
                    .toList()
                : null,
        resourceAwsIamAccessKeyStatus:
            json.containsKey('ResourceAwsIamAccessKeyStatus')
                ? (json['ResourceAwsIamAccessKeyStatus'] as List)
                    .map((e) => StringFilter.fromJson(e))
                    .toList()
                : null,
        resourceAwsIamAccessKeyCreatedAt:
            json.containsKey('ResourceAwsIamAccessKeyCreatedAt')
                ? (json['ResourceAwsIamAccessKeyCreatedAt'] as List)
                    .map((e) => DateFilter.fromJson(e))
                    .toList()
                : null,
        resourceContainerName: json.containsKey('ResourceContainerName')
            ? (json['ResourceContainerName'] as List)
                .map((e) => StringFilter.fromJson(e))
                .toList()
            : null,
        resourceContainerImageId: json.containsKey('ResourceContainerImageId')
            ? (json['ResourceContainerImageId'] as List)
                .map((e) => StringFilter.fromJson(e))
                .toList()
            : null,
        resourceContainerImageName:
            json.containsKey('ResourceContainerImageName')
                ? (json['ResourceContainerImageName'] as List)
                    .map((e) => StringFilter.fromJson(e))
                    .toList()
                : null,
        resourceContainerLaunchedAt:
            json.containsKey('ResourceContainerLaunchedAt')
                ? (json['ResourceContainerLaunchedAt'] as List)
                    .map((e) => DateFilter.fromJson(e))
                    .toList()
                : null,
        resourceDetailsOther: json.containsKey('ResourceDetailsOther')
            ? (json['ResourceDetailsOther'] as List)
                .map((e) => MapFilter.fromJson(e))
                .toList()
            : null,
        complianceStatus: json.containsKey('ComplianceStatus')
            ? (json['ComplianceStatus'] as List)
                .map((e) => StringFilter.fromJson(e))
                .toList()
            : null,
        verificationState: json.containsKey('VerificationState')
            ? (json['VerificationState'] as List)
                .map((e) => StringFilter.fromJson(e))
                .toList()
            : null,
        workflowState: json.containsKey('WorkflowState')
            ? (json['WorkflowState'] as List)
                .map((e) => StringFilter.fromJson(e))
                .toList()
            : null,
        recordState: json.containsKey('RecordState')
            ? (json['RecordState'] as List)
                .map((e) => StringFilter.fromJson(e))
                .toList()
            : null,
        relatedFindingsProductArn: json.containsKey('RelatedFindingsProductArn')
            ? (json['RelatedFindingsProductArn'] as List)
                .map((e) => StringFilter.fromJson(e))
                .toList()
            : null,
        relatedFindingsId: json.containsKey('RelatedFindingsId')
            ? (json['RelatedFindingsId'] as List)
                .map((e) => StringFilter.fromJson(e))
                .toList()
            : null,
        noteText: json.containsKey('NoteText')
            ? (json['NoteText'] as List)
                .map((e) => StringFilter.fromJson(e))
                .toList()
            : null,
        noteUpdatedAt: json.containsKey('NoteUpdatedAt')
            ? (json['NoteUpdatedAt'] as List)
                .map((e) => DateFilter.fromJson(e))
                .toList()
            : null,
        noteUpdatedBy: json.containsKey('NoteUpdatedBy')
            ? (json['NoteUpdatedBy'] as List)
                .map((e) => StringFilter.fromJson(e))
                .toList()
            : null,
        keyword: json.containsKey('Keyword')
            ? (json['Keyword'] as List)
                .map((e) => KeywordFilter.fromJson(e))
                .toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class BatchDisableStandardsResponse {
  /// The details of the standards subscriptions that were disabled.
  final List<StandardsSubscription> standardsSubscriptions;

  BatchDisableStandardsResponse({
    this.standardsSubscriptions,
  });
  static BatchDisableStandardsResponse fromJson(Map<String, dynamic> json) =>
      BatchDisableStandardsResponse(
        standardsSubscriptions: json.containsKey('StandardsSubscriptions')
            ? (json['StandardsSubscriptions'] as List)
                .map((e) => StandardsSubscription.fromJson(e))
                .toList()
            : null,
      );
}

class BatchEnableStandardsResponse {
  /// The details of the standards subscriptions that were enabled.
  final List<StandardsSubscription> standardsSubscriptions;

  BatchEnableStandardsResponse({
    this.standardsSubscriptions,
  });
  static BatchEnableStandardsResponse fromJson(Map<String, dynamic> json) =>
      BatchEnableStandardsResponse(
        standardsSubscriptions: json.containsKey('StandardsSubscriptions')
            ? (json['StandardsSubscriptions'] as List)
                .map((e) => StandardsSubscription.fromJson(e))
                .toList()
            : null,
      );
}

class BatchImportFindingsResponse {
  /// The number of findings that failed to import.
  final int failedCount;

  /// The number of findings that were successfully imported.
  final int successCount;

  /// The list of the findings that failed to import.
  final List<ImportFindingsError> failedFindings;

  BatchImportFindingsResponse({
    @required this.failedCount,
    @required this.successCount,
    this.failedFindings,
  });
  static BatchImportFindingsResponse fromJson(Map<String, dynamic> json) =>
      BatchImportFindingsResponse(
        failedCount: json['FailedCount'] as int,
        successCount: json['SuccessCount'] as int,
        failedFindings: json.containsKey('FailedFindings')
            ? (json['FailedFindings'] as List)
                .map((e) => ImportFindingsError.fromJson(e))
                .toList()
            : null,
      );
}

/// Exclusive to findings that are generated as the result of a check run
/// against a specific rule in a supported standard (for example, CIS AWS
/// Foundations). Contains compliance-related finding details.
class Compliance {
  /// The result of a compliance check.
  final String status;

  Compliance({
    this.status,
  });
  static Compliance fromJson(Map<String, dynamic> json) => Compliance(
        status: json.containsKey('Status') ? json['Status'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Container details related to a finding.
class ContainerDetails {
  /// The name of the container related to a finding.
  final String name;

  /// The identifier of the image related to a finding.
  final String imageId;

  /// The name of the image related to a finding.
  final String imageName;

  /// The date and time when the container started.
  final String launchedAt;

  ContainerDetails({
    this.name,
    this.imageId,
    this.imageName,
    this.launchedAt,
  });
  static ContainerDetails fromJson(Map<String, dynamic> json) =>
      ContainerDetails(
        name: json.containsKey('Name') ? json['Name'] as String : null,
        imageId: json.containsKey('ImageId') ? json['ImageId'] as String : null,
        imageName:
            json.containsKey('ImageName') ? json['ImageName'] as String : null,
        launchedAt: json.containsKey('LaunchedAt')
            ? json['LaunchedAt'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class CreateActionTargetResponse {
  /// The ARN for the custom action target.
  final String actionTargetArn;

  CreateActionTargetResponse({
    @required this.actionTargetArn,
  });
  static CreateActionTargetResponse fromJson(Map<String, dynamic> json) =>
      CreateActionTargetResponse(
        actionTargetArn: json['ActionTargetArn'] as String,
      );
}

class CreateInsightResponse {
  /// The ARN of the insight created.
  final String insightArn;

  CreateInsightResponse({
    @required this.insightArn,
  });
  static CreateInsightResponse fromJson(Map<String, dynamic> json) =>
      CreateInsightResponse(
        insightArn: json['InsightArn'] as String,
      );
}

class CreateMembersResponse {
  /// A list of account ID and email address pairs of the AWS accounts that
  /// weren't processed.
  final List<Result> unprocessedAccounts;

  CreateMembersResponse({
    this.unprocessedAccounts,
  });
  static CreateMembersResponse fromJson(Map<String, dynamic> json) =>
      CreateMembersResponse(
        unprocessedAccounts: json.containsKey('UnprocessedAccounts')
            ? (json['UnprocessedAccounts'] as List)
                .map((e) => Result.fromJson(e))
                .toList()
            : null,
      );
}

/// A date filter for querying findings.
class DateFilter {
  /// A start date for the date filter.
  final String start;

  /// An end date for the date filter.
  final String end;

  /// A date range for the date filter.
  final DateRange dateRange;

  DateFilter({
    this.start,
    this.end,
    this.dateRange,
  });
  static DateFilter fromJson(Map<String, dynamic> json) => DateFilter(
        start: json.containsKey('Start') ? json['Start'] as String : null,
        end: json.containsKey('End') ? json['End'] as String : null,
        dateRange: json.containsKey('DateRange')
            ? DateRange.fromJson(json['DateRange'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A date range for the date filter.
class DateRange {
  /// A date range value for the date filter.
  final int value;

  /// A date range unit for the date filter.
  final String unit;

  DateRange({
    this.value,
    this.unit,
  });
  static DateRange fromJson(Map<String, dynamic> json) => DateRange(
        value: json.containsKey('Value') ? json['Value'] as int : null,
        unit: json.containsKey('Unit') ? json['Unit'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class DeclineInvitationsResponse {
  /// A list of account ID and email address pairs of the AWS accounts that
  /// weren't processed.
  final List<Result> unprocessedAccounts;

  DeclineInvitationsResponse({
    this.unprocessedAccounts,
  });
  static DeclineInvitationsResponse fromJson(Map<String, dynamic> json) =>
      DeclineInvitationsResponse(
        unprocessedAccounts: json.containsKey('UnprocessedAccounts')
            ? (json['UnprocessedAccounts'] as List)
                .map((e) => Result.fromJson(e))
                .toList()
            : null,
      );
}

class DeleteActionTargetResponse {
  /// The ARN of the custom action target that was deleted.
  final String actionTargetArn;

  DeleteActionTargetResponse({
    @required this.actionTargetArn,
  });
  static DeleteActionTargetResponse fromJson(Map<String, dynamic> json) =>
      DeleteActionTargetResponse(
        actionTargetArn: json['ActionTargetArn'] as String,
      );
}

class DeleteInsightResponse {
  /// The ARN of the insight that was deleted.
  final String insightArn;

  DeleteInsightResponse({
    @required this.insightArn,
  });
  static DeleteInsightResponse fromJson(Map<String, dynamic> json) =>
      DeleteInsightResponse(
        insightArn: json['InsightArn'] as String,
      );
}

class DeleteInvitationsResponse {
  /// A list of account ID and email address pairs of the AWS accounts that
  /// invitations weren't deleted for.
  final List<Result> unprocessedAccounts;

  DeleteInvitationsResponse({
    this.unprocessedAccounts,
  });
  static DeleteInvitationsResponse fromJson(Map<String, dynamic> json) =>
      DeleteInvitationsResponse(
        unprocessedAccounts: json.containsKey('UnprocessedAccounts')
            ? (json['UnprocessedAccounts'] as List)
                .map((e) => Result.fromJson(e))
                .toList()
            : null,
      );
}

class DeleteMembersResponse {
  /// A list of account ID and email address pairs of the AWS accounts that
  /// weren't deleted.
  final List<Result> unprocessedAccounts;

  DeleteMembersResponse({
    this.unprocessedAccounts,
  });
  static DeleteMembersResponse fromJson(Map<String, dynamic> json) =>
      DeleteMembersResponse(
        unprocessedAccounts: json.containsKey('UnprocessedAccounts')
            ? (json['UnprocessedAccounts'] as List)
                .map((e) => Result.fromJson(e))
                .toList()
            : null,
      );
}

class DescribeActionTargetsResponse {
  /// A list of `ActionTarget` objects. Each object includes the
  /// `ActionTargetArn`, `Description`, and `Name` of a custom action target
  /// available in Security Hub.
  final List<ActionTarget> actionTargets;

  /// The token that is required for pagination.
  final String nextToken;

  DescribeActionTargetsResponse({
    @required this.actionTargets,
    this.nextToken,
  });
  static DescribeActionTargetsResponse fromJson(Map<String, dynamic> json) =>
      DescribeActionTargetsResponse(
        actionTargets: (json['ActionTargets'] as List)
            .map((e) => ActionTarget.fromJson(e))
            .toList(),
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class DescribeHubResponse {
  /// The ARN of the Hub resource retrieved.
  final String hubArn;

  /// The date and time when Security Hub was enabled in the account.
  final String subscribedAt;

  DescribeHubResponse({
    this.hubArn,
    this.subscribedAt,
  });
  static DescribeHubResponse fromJson(Map<String, dynamic> json) =>
      DescribeHubResponse(
        hubArn: json.containsKey('HubArn') ? json['HubArn'] as String : null,
        subscribedAt: json.containsKey('SubscribedAt')
            ? json['SubscribedAt'] as String
            : null,
      );
}

class DescribeProductsResponse {
  /// A list of products, including details for each product.
  final List<Product> products;

  /// The token that is required for pagination.
  final String nextToken;

  DescribeProductsResponse({
    @required this.products,
    this.nextToken,
  });
  static DescribeProductsResponse fromJson(Map<String, dynamic> json) =>
      DescribeProductsResponse(
        products:
            (json['Products'] as List).map((e) => Product.fromJson(e)).toList(),
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class DisableImportFindingsForProductResponse {
  DisableImportFindingsForProductResponse();
  static DisableImportFindingsForProductResponse fromJson(
          Map<String, dynamic> json) =>
      DisableImportFindingsForProductResponse();
}

class DisableSecurityHubResponse {
  DisableSecurityHubResponse();
  static DisableSecurityHubResponse fromJson(Map<String, dynamic> json) =>
      DisableSecurityHubResponse();
}

class DisassociateFromMasterAccountResponse {
  DisassociateFromMasterAccountResponse();
  static DisassociateFromMasterAccountResponse fromJson(
          Map<String, dynamic> json) =>
      DisassociateFromMasterAccountResponse();
}

class DisassociateMembersResponse {
  DisassociateMembersResponse();
  static DisassociateMembersResponse fromJson(Map<String, dynamic> json) =>
      DisassociateMembersResponse();
}

class EnableImportFindingsForProductResponse {
  /// The ARN of your subscription to the product to enable integrations for.
  final String productSubscriptionArn;

  EnableImportFindingsForProductResponse({
    this.productSubscriptionArn,
  });
  static EnableImportFindingsForProductResponse fromJson(
          Map<String, dynamic> json) =>
      EnableImportFindingsForProductResponse(
        productSubscriptionArn: json.containsKey('ProductSubscriptionArn')
            ? json['ProductSubscriptionArn'] as String
            : null,
      );
}

class EnableSecurityHubResponse {
  EnableSecurityHubResponse();
  static EnableSecurityHubResponse fromJson(Map<String, dynamic> json) =>
      EnableSecurityHubResponse();
}

class GetEnabledStandardsResponse {
  /// A list of `StandardsSubscriptions` objects that include information about
  /// the enabled standards.
  final List<StandardsSubscription> standardsSubscriptions;

  /// The token that is required for pagination.
  final String nextToken;

  GetEnabledStandardsResponse({
    this.standardsSubscriptions,
    this.nextToken,
  });
  static GetEnabledStandardsResponse fromJson(Map<String, dynamic> json) =>
      GetEnabledStandardsResponse(
        standardsSubscriptions: json.containsKey('StandardsSubscriptions')
            ? (json['StandardsSubscriptions'] as List)
                .map((e) => StandardsSubscription.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class GetFindingsResponse {
  /// The findings that matched the filters specified in the request.
  final List<AwsSecurityFinding> findings;

  /// The token that is required for pagination.
  final String nextToken;

  GetFindingsResponse({
    @required this.findings,
    this.nextToken,
  });
  static GetFindingsResponse fromJson(Map<String, dynamic> json) =>
      GetFindingsResponse(
        findings: (json['Findings'] as List)
            .map((e) => AwsSecurityFinding.fromJson(e))
            .toList(),
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class GetInsightResultsResponse {
  /// The insight results returned by the operation.
  final InsightResults insightResults;

  GetInsightResultsResponse({
    @required this.insightResults,
  });
  static GetInsightResultsResponse fromJson(Map<String, dynamic> json) =>
      GetInsightResultsResponse(
        insightResults: InsightResults.fromJson(json['InsightResults']),
      );
}

class GetInsightsResponse {
  /// The insights returned by the operation.
  final List<Insight> insights;

  /// The token that is required for pagination.
  final String nextToken;

  GetInsightsResponse({
    @required this.insights,
    this.nextToken,
  });
  static GetInsightsResponse fromJson(Map<String, dynamic> json) =>
      GetInsightsResponse(
        insights:
            (json['Insights'] as List).map((e) => Insight.fromJson(e)).toList(),
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class GetInvitationsCountResponse {
  /// The number of all membership invitations sent to this Security Hub member
  /// account, not including the currently accepted invitation.
  final int invitationsCount;

  GetInvitationsCountResponse({
    this.invitationsCount,
  });
  static GetInvitationsCountResponse fromJson(Map<String, dynamic> json) =>
      GetInvitationsCountResponse(
        invitationsCount: json.containsKey('InvitationsCount')
            ? json['InvitationsCount'] as int
            : null,
      );
}

class GetMasterAccountResponse {
  /// A list of details about the Security Hub master account for the current
  /// member account.
  final Invitation master;

  GetMasterAccountResponse({
    this.master,
  });
  static GetMasterAccountResponse fromJson(Map<String, dynamic> json) =>
      GetMasterAccountResponse(
        master: json.containsKey('Master')
            ? Invitation.fromJson(json['Master'])
            : null,
      );
}

class GetMembersResponse {
  /// A list of details about the Security Hub member accounts.
  final List<Member> members;

  /// A list of account ID and email address pairs of the AWS accounts that
  /// couldn't be processed.
  final List<Result> unprocessedAccounts;

  GetMembersResponse({
    this.members,
    this.unprocessedAccounts,
  });
  static GetMembersResponse fromJson(Map<String, dynamic> json) =>
      GetMembersResponse(
        members: json.containsKey('Members')
            ? (json['Members'] as List).map((e) => Member.fromJson(e)).toList()
            : null,
        unprocessedAccounts: json.containsKey('UnprocessedAccounts')
            ? (json['UnprocessedAccounts'] as List)
                .map((e) => Result.fromJson(e))
                .toList()
            : null,
      );
}

/// Includes details of the list of the findings that can't be imported.
class ImportFindingsError {
  /// The ID of the error made during the `BatchImportFindings` operation.
  final String id;

  /// The code of the error made during the `BatchImportFindings` operation.
  final String errorCode;

  /// The message of the error made during the `BatchImportFindings` operation.
  final String errorMessage;

  ImportFindingsError({
    @required this.id,
    @required this.errorCode,
    @required this.errorMessage,
  });
  static ImportFindingsError fromJson(Map<String, dynamic> json) =>
      ImportFindingsError(
        id: json['Id'] as String,
        errorCode: json['ErrorCode'] as String,
        errorMessage: json['ErrorMessage'] as String,
      );
}

/// Contains information about a Security Hub insight.
class Insight {
  /// The ARN of a Security Hub insight.
  final String insightArn;

  /// The name of a Security Hub insight.
  final String name;

  /// One or more attributes used to filter the findings included in the
  /// insight. Only findings that match the criteria defined in the filters are
  /// included in the insight.
  final AwsSecurityFindingFilters filters;

  /// The attribute that the insight's findings are grouped by. This attribute
  /// is used as a findings aggregator for the purposes of viewing and managing
  /// multiple related findings under a single operand.
  final String groupByAttribute;

  Insight({
    @required this.insightArn,
    @required this.name,
    @required this.filters,
    @required this.groupByAttribute,
  });
  static Insight fromJson(Map<String, dynamic> json) => Insight(
        insightArn: json['InsightArn'] as String,
        name: json['Name'] as String,
        filters: AwsSecurityFindingFilters.fromJson(json['Filters']),
        groupByAttribute: json['GroupByAttribute'] as String,
      );
}

/// The insight result values returned by the `GetInsightResults` operation.
class InsightResultValue {
  /// The value of the attribute that the findings are grouped by for the
  /// insight whose results are returned by the `GetInsightResults` operation.
  final String groupByAttributeValue;

  /// The number of findings returned for each `GroupByAttributeValue`.
  final int count;

  InsightResultValue({
    @required this.groupByAttributeValue,
    @required this.count,
  });
  static InsightResultValue fromJson(Map<String, dynamic> json) =>
      InsightResultValue(
        groupByAttributeValue: json['GroupByAttributeValue'] as String,
        count: json['Count'] as int,
      );
}

/// The insight results returned by the `GetInsightResults` operation.
class InsightResults {
  /// The ARN of the insight whose results are returned by the
  /// `GetInsightResults` operation.
  final String insightArn;

  /// The attribute that the findings are grouped by for the insight whose
  /// results are returned by the `GetInsightResults` operation.
  final String groupByAttribute;

  /// The list of insight result values returned by the `GetInsightResults`
  /// operation.
  final List<InsightResultValue> resultValues;

  InsightResults({
    @required this.insightArn,
    @required this.groupByAttribute,
    @required this.resultValues,
  });
  static InsightResults fromJson(Map<String, dynamic> json) => InsightResults(
        insightArn: json['InsightArn'] as String,
        groupByAttribute: json['GroupByAttribute'] as String,
        resultValues: (json['ResultValues'] as List)
            .map((e) => InsightResultValue.fromJson(e))
            .toList(),
      );
}

/// Details about an invitation.
class Invitation {
  /// The account ID of the Security Hub master account that the invitation was
  /// sent from.
  final String accountId;

  /// The ID of the invitation sent to the member account.
  final String invitationId;

  /// The timestamp of when the invitation was sent.
  final DateTime invitedAt;

  /// The current status of the association between member and master accounts.
  final String memberStatus;

  Invitation({
    this.accountId,
    this.invitationId,
    this.invitedAt,
    this.memberStatus,
  });
  static Invitation fromJson(Map<String, dynamic> json) => Invitation(
        accountId:
            json.containsKey('AccountId') ? json['AccountId'] as String : null,
        invitationId: json.containsKey('InvitationId')
            ? json['InvitationId'] as String
            : null,
        invitedAt: json.containsKey('InvitedAt')
            ? DateTime.parse(json['InvitedAt'])
            : null,
        memberStatus: json.containsKey('MemberStatus')
            ? json['MemberStatus'] as String
            : null,
      );
}

class InviteMembersResponse {
  /// A list of account ID and email address pairs of the AWS accounts that
  /// couldn't be processed.
  final List<Result> unprocessedAccounts;

  InviteMembersResponse({
    this.unprocessedAccounts,
  });
  static InviteMembersResponse fromJson(Map<String, dynamic> json) =>
      InviteMembersResponse(
        unprocessedAccounts: json.containsKey('UnprocessedAccounts')
            ? (json['UnprocessedAccounts'] as List)
                .map((e) => Result.fromJson(e))
                .toList()
            : null,
      );
}

/// The IP filter for querying findings.
class IpFilter {
  /// A finding's CIDR value.
  final String cidr;

  IpFilter({
    this.cidr,
  });
  static IpFilter fromJson(Map<String, dynamic> json) => IpFilter(
        cidr: json.containsKey('Cidr') ? json['Cidr'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A keyword filter for querying findings.
class KeywordFilter {
  /// A value for the keyword.
  final String value;

  KeywordFilter({
    this.value,
  });
  static KeywordFilter fromJson(Map<String, dynamic> json) => KeywordFilter(
        value: json.containsKey('Value') ? json['Value'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class ListEnabledProductsForImportResponse {
  /// A list of ARNs for the resources that represent your subscriptions to
  /// products.
  final List<String> productSubscriptions;

  /// The token that is required for pagination.
  final String nextToken;

  ListEnabledProductsForImportResponse({
    this.productSubscriptions,
    this.nextToken,
  });
  static ListEnabledProductsForImportResponse fromJson(
          Map<String, dynamic> json) =>
      ListEnabledProductsForImportResponse(
        productSubscriptions: json.containsKey('ProductSubscriptions')
            ? (json['ProductSubscriptions'] as List)
                .map((e) => e as String)
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListInvitationsResponse {
  /// The details of the invitations returned by the operation.
  final List<Invitation> invitations;

  /// The token that is required for pagination.
  final String nextToken;

  ListInvitationsResponse({
    this.invitations,
    this.nextToken,
  });
  static ListInvitationsResponse fromJson(Map<String, dynamic> json) =>
      ListInvitationsResponse(
        invitations: json.containsKey('Invitations')
            ? (json['Invitations'] as List)
                .map((e) => Invitation.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListMembersResponse {
  /// Member details returned by the operation.
  final List<Member> members;

  /// The token that is required for pagination.
  final String nextToken;

  ListMembersResponse({
    this.members,
    this.nextToken,
  });
  static ListMembersResponse fromJson(Map<String, dynamic> json) =>
      ListMembersResponse(
        members: json.containsKey('Members')
            ? (json['Members'] as List).map((e) => Member.fromJson(e)).toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListTagsForResourceResponse {
  /// The tags associated with a resource.
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  static ListTagsForResourceResponse fromJson(Map<String, dynamic> json) =>
      ListTagsForResourceResponse(
        tags: json.containsKey('Tags')
            ? (json['Tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

/// A list of malware related to a finding.
class Malware {
  /// The name of the malware that was observed.
  final String name;

  /// The type of the malware that was observed.
  final String type;

  /// The file system path of the malware that was observed.
  final String path;

  /// The state of the malware that was observed.
  final String state;

  Malware({
    @required this.name,
    this.type,
    this.path,
    this.state,
  });
  static Malware fromJson(Map<String, dynamic> json) => Malware(
        name: json['Name'] as String,
        type: json.containsKey('Type') ? json['Type'] as String : null,
        path: json.containsKey('Path') ? json['Path'] as String : null,
        state: json.containsKey('State') ? json['State'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The map filter for querying findings.
class MapFilter {
  /// The key of the map filter.
  final String key;

  /// The value for the key in the map filter.
  final String value;

  /// The condition to apply to a key value when querying for findings with a
  /// map filter.
  final String comparison;

  MapFilter({
    this.key,
    this.value,
    this.comparison,
  });
  static MapFilter fromJson(Map<String, dynamic> json) => MapFilter(
        key: json.containsKey('Key') ? json['Key'] as String : null,
        value: json.containsKey('Value') ? json['Value'] as String : null,
        comparison: json.containsKey('Comparison')
            ? json['Comparison'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The details about a member account.
class Member {
  /// The AWS account ID of the member account.
  final String accountId;

  /// The email address of the member account.
  final String email;

  /// The AWS account ID of the Security Hub master account associated with this
  /// member account.
  final String masterId;

  /// The status of the relationship between the member account and its master
  /// account.
  final String memberStatus;

  /// A timestamp for the date and time when the invitation was sent to the
  /// member account.
  final DateTime invitedAt;

  /// The timestamp for the date and time when the member account was updated.
  final DateTime updatedAt;

  Member({
    this.accountId,
    this.email,
    this.masterId,
    this.memberStatus,
    this.invitedAt,
    this.updatedAt,
  });
  static Member fromJson(Map<String, dynamic> json) => Member(
        accountId:
            json.containsKey('AccountId') ? json['AccountId'] as String : null,
        email: json.containsKey('Email') ? json['Email'] as String : null,
        masterId:
            json.containsKey('MasterId') ? json['MasterId'] as String : null,
        memberStatus: json.containsKey('MemberStatus')
            ? json['MemberStatus'] as String
            : null,
        invitedAt: json.containsKey('InvitedAt')
            ? DateTime.parse(json['InvitedAt'])
            : null,
        updatedAt: json.containsKey('UpdatedAt')
            ? DateTime.parse(json['UpdatedAt'])
            : null,
      );
}

/// The details of network-related information about a finding.
class Network {
  /// The direction of network traffic associated with a finding.
  final String direction;

  /// The protocol of network-related information about a finding.
  final String protocol;

  /// The source IPv4 address of network-related information about a finding.
  final String sourceIpV4;

  /// The source IPv6 address of network-related information about a finding.
  final String sourceIpV6;

  /// The source port of network-related information about a finding.
  final int sourcePort;

  /// The source domain of network-related information about a finding.
  final String sourceDomain;

  /// The source media access control (MAC) address of network-related
  /// information about a finding.
  final String sourceMac;

  /// The destination IPv4 address of network-related information about a
  /// finding.
  final String destinationIpV4;

  /// The destination IPv6 address of network-related information about a
  /// finding.
  final String destinationIpV6;

  /// The destination port of network-related information about a finding.
  final int destinationPort;

  /// The destination domain of network-related information about a finding.
  final String destinationDomain;

  Network({
    this.direction,
    this.protocol,
    this.sourceIpV4,
    this.sourceIpV6,
    this.sourcePort,
    this.sourceDomain,
    this.sourceMac,
    this.destinationIpV4,
    this.destinationIpV6,
    this.destinationPort,
    this.destinationDomain,
  });
  static Network fromJson(Map<String, dynamic> json) => Network(
        direction:
            json.containsKey('Direction') ? json['Direction'] as String : null,
        protocol:
            json.containsKey('Protocol') ? json['Protocol'] as String : null,
        sourceIpV4: json.containsKey('SourceIpV4')
            ? json['SourceIpV4'] as String
            : null,
        sourceIpV6: json.containsKey('SourceIpV6')
            ? json['SourceIpV6'] as String
            : null,
        sourcePort:
            json.containsKey('SourcePort') ? json['SourcePort'] as int : null,
        sourceDomain: json.containsKey('SourceDomain')
            ? json['SourceDomain'] as String
            : null,
        sourceMac:
            json.containsKey('SourceMac') ? json['SourceMac'] as String : null,
        destinationIpV4: json.containsKey('DestinationIpV4')
            ? json['DestinationIpV4'] as String
            : null,
        destinationIpV6: json.containsKey('DestinationIpV6')
            ? json['DestinationIpV6'] as String
            : null,
        destinationPort: json.containsKey('DestinationPort')
            ? json['DestinationPort'] as int
            : null,
        destinationDomain: json.containsKey('DestinationDomain')
            ? json['DestinationDomain'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A user-defined note added to a finding.
class Note {
  /// The text of a note.
  final String text;

  /// The principal that created a note.
  final String updatedBy;

  /// The timestamp of when the note was updated.
  final String updatedAt;

  Note({
    @required this.text,
    @required this.updatedBy,
    @required this.updatedAt,
  });
  static Note fromJson(Map<String, dynamic> json) => Note(
        text: json['Text'] as String,
        updatedBy: json['UpdatedBy'] as String,
        updatedAt: json['UpdatedAt'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The updated note.
class NoteUpdate {
  /// The updated note text.
  final String text;

  /// The principal that updated the note.
  final String updatedBy;

  NoteUpdate({
    @required this.text,
    @required this.updatedBy,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A number filter for querying findings.
class NumberFilter {
  /// The greater-than-equal condition to be applied to a single field when
  /// querying for findings.
  final double gte;

  /// The less-than-equal condition to be applied to a single field when
  /// querying for findings.
  final double lte;

  /// The equal-to condition to be applied to a single field when querying for
  /// findings.
  final double eq;

  NumberFilter({
    this.gte,
    this.lte,
    this.eq,
  });
  static NumberFilter fromJson(Map<String, dynamic> json) => NumberFilter(
        gte: json.containsKey('Gte') ? json['Gte'] as double : null,
        lte: json.containsKey('Lte') ? json['Lte'] as double : null,
        eq: json.containsKey('Eq') ? json['Eq'] as double : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The details of process-related information about a finding.
class ProcessDetails {
  /// The name of the process.
  final String name;

  /// The path to the process executable.
  final String path;

  /// The process ID.
  final int pid;

  /// The parent process ID.
  final int parentPid;

  /// The date/time that the process was launched.
  final String launchedAt;

  /// The date and time when the process was terminated.
  final String terminatedAt;

  ProcessDetails({
    this.name,
    this.path,
    this.pid,
    this.parentPid,
    this.launchedAt,
    this.terminatedAt,
  });
  static ProcessDetails fromJson(Map<String, dynamic> json) => ProcessDetails(
        name: json.containsKey('Name') ? json['Name'] as String : null,
        path: json.containsKey('Path') ? json['Path'] as String : null,
        pid: json.containsKey('Pid') ? json['Pid'] as int : null,
        parentPid:
            json.containsKey('ParentPid') ? json['ParentPid'] as int : null,
        launchedAt: json.containsKey('LaunchedAt')
            ? json['LaunchedAt'] as String
            : null,
        terminatedAt: json.containsKey('TerminatedAt')
            ? json['TerminatedAt'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Contains details about a product.
class Product {
  /// The ARN assigned to the product.
  final String productArn;

  /// The name of the product.
  final String productName;

  /// The name of the company that provides the product.
  final String companyName;

  /// A description of the product.
  final String description;

  /// The categories assigned to the product.
  final List<String> categories;

  /// The URL for the page that contains more information about the product.
  final String marketplaceUrl;

  /// The URL used to activate the product.
  final String activationUrl;

  /// The resource policy associated with the product.
  final String productSubscriptionResourcePolicy;

  Product({
    @required this.productArn,
    this.productName,
    this.companyName,
    this.description,
    this.categories,
    this.marketplaceUrl,
    this.activationUrl,
    this.productSubscriptionResourcePolicy,
  });
  static Product fromJson(Map<String, dynamic> json) => Product(
        productArn: json['ProductArn'] as String,
        productName: json.containsKey('ProductName')
            ? json['ProductName'] as String
            : null,
        companyName: json.containsKey('CompanyName')
            ? json['CompanyName'] as String
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        categories: json.containsKey('Categories')
            ? (json['Categories'] as List).map((e) => e as String).toList()
            : null,
        marketplaceUrl: json.containsKey('MarketplaceUrl')
            ? json['MarketplaceUrl'] as String
            : null,
        activationUrl: json.containsKey('ActivationUrl')
            ? json['ActivationUrl'] as String
            : null,
        productSubscriptionResourcePolicy:
            json.containsKey('ProductSubscriptionResourcePolicy')
                ? json['ProductSubscriptionResourcePolicy'] as String
                : null,
      );
}

/// A recommendation on how to remediate the issue identified in a finding.
class Recommendation {
  /// Describes the recommended steps to take to remediate an issue identified
  /// in a finding.
  final String text;

  /// A URL to a page or site that contains information about how to remediate a
  /// finding.
  final String url;

  Recommendation({
    this.text,
    this.url,
  });
  static Recommendation fromJson(Map<String, dynamic> json) => Recommendation(
        text: json.containsKey('Text') ? json['Text'] as String : null,
        url: json.containsKey('Url') ? json['Url'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Details about a related finding.
class RelatedFinding {
  /// The ARN of the product that generated a related finding.
  final String productArn;

  /// The product-generated identifier for a related finding.
  final String id;

  RelatedFinding({
    @required this.productArn,
    @required this.id,
  });
  static RelatedFinding fromJson(Map<String, dynamic> json) => RelatedFinding(
        productArn: json['ProductArn'] as String,
        id: json['Id'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Details about the remediation steps for a finding.
class Remediation {
  /// A recommendation on the steps to take to remediate the issue identified by
  /// a finding.
  final Recommendation recommendation;

  Remediation({
    this.recommendation,
  });
  static Remediation fromJson(Map<String, dynamic> json) => Remediation(
        recommendation: json.containsKey('Recommendation')
            ? Recommendation.fromJson(json['Recommendation'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A resource related to a finding.
class Resource {
  /// The type of the resource that details are provided for.
  final String type;

  /// The canonical identifier for the given resource type.
  final String id;

  /// The canonical AWS partition name that the Region is assigned to.
  final String partition;

  /// The canonical AWS external Region name where this resource is located.
  final String region;

  /// A list of AWS tags associated with a resource at the time the finding was
  /// processed.
  final Map<String, String> tags;

  /// Additional details about the resource related to a finding.
  final ResourceDetails details;

  Resource({
    @required this.type,
    @required this.id,
    this.partition,
    this.region,
    this.tags,
    this.details,
  });
  static Resource fromJson(Map<String, dynamic> json) => Resource(
        type: json['Type'] as String,
        id: json['Id'] as String,
        partition:
            json.containsKey('Partition') ? json['Partition'] as String : null,
        region: json.containsKey('Region') ? json['Region'] as String : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        details: json.containsKey('Details')
            ? ResourceDetails.fromJson(json['Details'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Additional details about a resource related to a finding.
class ResourceDetails {
  /// Details about an Amazon EC2 instance related to a finding.
  final AwsEc2InstanceDetails awsEc2Instance;

  /// Details about an Amazon S3 Bucket related to a finding.
  final AwsS3BucketDetails awsS3Bucket;

  /// Details about an IAM access key related to a finding.
  final AwsIamAccessKeyDetails awsIamAccessKey;

  /// Details about a container resource related to a finding.
  final ContainerDetails container;

  /// Details about a resource that doesn't have a specific type defined.
  final Map<String, String> other;

  ResourceDetails({
    this.awsEc2Instance,
    this.awsS3Bucket,
    this.awsIamAccessKey,
    this.container,
    this.other,
  });
  static ResourceDetails fromJson(Map<String, dynamic> json) => ResourceDetails(
        awsEc2Instance: json.containsKey('AwsEc2Instance')
            ? AwsEc2InstanceDetails.fromJson(json['AwsEc2Instance'])
            : null,
        awsS3Bucket: json.containsKey('AwsS3Bucket')
            ? AwsS3BucketDetails.fromJson(json['AwsS3Bucket'])
            : null,
        awsIamAccessKey: json.containsKey('AwsIamAccessKey')
            ? AwsIamAccessKeyDetails.fromJson(json['AwsIamAccessKey'])
            : null,
        container: json.containsKey('Container')
            ? ContainerDetails.fromJson(json['Container'])
            : null,
        other: json.containsKey('Other')
            ? (json['Other'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Details about the account that wasn't processed.
class Result {
  /// An AWS account ID of the account that wasn't be processed.
  final String accountId;

  /// The reason that the account wasn't be processed.
  final String processingResult;

  Result({
    this.accountId,
    this.processingResult,
  });
  static Result fromJson(Map<String, dynamic> json) => Result(
        accountId:
            json.containsKey('AccountId') ? json['AccountId'] as String : null,
        processingResult: json.containsKey('ProcessingResult')
            ? json['ProcessingResult'] as String
            : null,
      );
}

/// The severity of the finding.
class Severity {
  /// The native severity as defined by the AWS service or integrated partner
  /// product that generated the finding.
  final double product;

  /// The normalized severity of a finding.
  final int normalized;

  Severity({
    this.product,
    @required this.normalized,
  });
  static Severity fromJson(Map<String, dynamic> json) => Severity(
        product: json.containsKey('Product') ? json['Product'] as double : null,
        normalized: json['Normalized'] as int,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A collection of finding attributes used to sort findings.
class SortCriterion {
  /// The finding attribute used to sort findings.
  final String field;

  /// The order used to sort findings.
  final String sortOrder;

  SortCriterion({
    this.field,
    this.sortOrder,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A resource that represents your subscription to a supported standard.
class StandardsSubscription {
  /// The ARN of a resource that represents your subscription to a supported
  /// standard.
  final String standardsSubscriptionArn;

  /// The ARN of a standard.
  ///
  /// In this release, Security Hub supports only the CIS AWS Foundations
  /// standard, which uses the following ARN:
  /// `arn:aws:securityhub:::ruleset/cis-aws-foundations-benchmark/v/1.2.0.`
  final String standardsArn;

  /// A key-value pair of input for the standard.
  final Map<String, String> standardsInput;

  /// The status of the standards subscription.
  final String standardsStatus;

  StandardsSubscription({
    @required this.standardsSubscriptionArn,
    @required this.standardsArn,
    @required this.standardsInput,
    @required this.standardsStatus,
  });
  static StandardsSubscription fromJson(Map<String, dynamic> json) =>
      StandardsSubscription(
        standardsSubscriptionArn: json['StandardsSubscriptionArn'] as String,
        standardsArn: json['StandardsArn'] as String,
        standardsInput: (json['StandardsInput'] as Map)
            .map((k, v) => MapEntry(k as String, v as String)),
        standardsStatus: json['StandardsStatus'] as String,
      );
}

/// The standard that you want to enable.
class StandardsSubscriptionRequest {
  /// The ARN of the standard that you want to enable.
  ///
  ///
  ///
  /// In this release, Security Hub only supports the CIS AWS Foundations
  /// standard.
  ///
  /// Its ARN is
  /// `arn:aws:securityhub:::ruleset/cis-aws-foundations-benchmark/v/1.2.0`.
  final String standardsArn;

  /// A key-value pair of input for the standard.
  final Map<String, String> standardsInput;

  StandardsSubscriptionRequest({
    @required this.standardsArn,
    this.standardsInput,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A string filter for querying findings.
class StringFilter {
  /// The string filter value.
  final String value;

  /// The condition to be applied to a string value when querying for findings.
  final String comparison;

  StringFilter({
    this.value,
    this.comparison,
  });
  static StringFilter fromJson(Map<String, dynamic> json) => StringFilter(
        value: json.containsKey('Value') ? json['Value'] as String : null,
        comparison: json.containsKey('Comparison')
            ? json['Comparison'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class TagResourceResponse {
  TagResourceResponse();
  static TagResourceResponse fromJson(Map<String, dynamic> json) =>
      TagResourceResponse();
}

/// Details about the threat intel related to a finding.
class ThreatIntelIndicator {
  /// The type of a threat intel indicator.
  final String type;

  /// The value of a threat intel indicator.
  final String value;

  /// The category of a threat intel indicator.
  final String category;

  /// The date and time when the most recent instance of a threat intel
  /// indicator was observed.
  final String lastObservedAt;

  /// The source of the threat intel indicator.
  final String source;

  /// The URL to the page or site where you can get more information about the
  /// threat intel indicator.
  final String sourceUrl;

  ThreatIntelIndicator({
    this.type,
    this.value,
    this.category,
    this.lastObservedAt,
    this.source,
    this.sourceUrl,
  });
  static ThreatIntelIndicator fromJson(Map<String, dynamic> json) =>
      ThreatIntelIndicator(
        type: json.containsKey('Type') ? json['Type'] as String : null,
        value: json.containsKey('Value') ? json['Value'] as String : null,
        category:
            json.containsKey('Category') ? json['Category'] as String : null,
        lastObservedAt: json.containsKey('LastObservedAt')
            ? json['LastObservedAt'] as String
            : null,
        source: json.containsKey('Source') ? json['Source'] as String : null,
        sourceUrl:
            json.containsKey('SourceUrl') ? json['SourceUrl'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class UntagResourceResponse {
  UntagResourceResponse();
  static UntagResourceResponse fromJson(Map<String, dynamic> json) =>
      UntagResourceResponse();
}

class UpdateActionTargetResponse {
  UpdateActionTargetResponse();
  static UpdateActionTargetResponse fromJson(Map<String, dynamic> json) =>
      UpdateActionTargetResponse();
}

class UpdateFindingsResponse {
  UpdateFindingsResponse();
  static UpdateFindingsResponse fromJson(Map<String, dynamic> json) =>
      UpdateFindingsResponse();
}

class UpdateInsightResponse {
  UpdateInsightResponse();
  static UpdateInsightResponse fromJson(Map<String, dynamic> json) =>
      UpdateInsightResponse();
}
