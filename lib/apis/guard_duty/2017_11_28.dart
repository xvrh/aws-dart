import 'package:meta/meta.dart';

/// Amazon GuardDuty is a continuous security monitoring service that analyzes
/// and processes the following data sources: VPC Flow Logs, AWS CloudTrail
/// event logs, and DNS logs. It uses threat intelligence feeds, such as lists
/// of malicious IPs and domains, and machine learning to identify unexpected
/// and potentially unauthorized and malicious activity within your AWS
/// environment. This can include issues like escalations of privileges, uses of
/// exposed credentials, or communication with malicious IPs, URLs, or domains.
/// For example, GuardDuty can detect compromised EC2 instances serving malware
/// or mining bitcoin. It also monitors AWS account access behavior for signs of
/// compromise, such as unauthorized infrastructure deployments, like instances
/// deployed in a region that has never been used, or unusual API calls, like a
/// password policy change to reduce password strength. GuardDuty informs you of
/// the status of your AWS environment by producing security findings that you
/// can view in the GuardDuty console or through Amazon CloudWatch events. For
/// more information, see
/// [Amazon GuardDuty User Guide](https://docs.aws.amazon.com/guardduty/latest/ug/what-is-guardduty.html).
class GuardDutyApi {
  final _client;
  GuardDutyApi(client)
      : _client = client.configured('GuardDuty', serializer: 'rest-json');

  /// Accepts the invitation to be monitored by a master GuardDuty account.
  ///
  /// [detectorId]: The unique ID of the detector of the GuardDuty member
  /// account.
  ///
  /// [masterId]: The account ID of the master GuardDuty account whose
  /// invitation you're accepting.
  ///
  /// [invitationId]: This value is used to validate the master account to the
  /// member account.
  Future<AcceptInvitationResponse> acceptInvitation(
      {@required String detectorId,
      @required String masterId,
      @required String invitationId}) async {
    var response_ = await _client.send('AcceptInvitation', {
      'DetectorId': detectorId,
      'MasterId': masterId,
      'InvitationId': invitationId,
    });
    return AcceptInvitationResponse.fromJson(response_);
  }

  /// Archives GuardDuty findings specified by the list of finding IDs.
  ///
  ///
  ///
  /// Only the master account can archive findings. Member accounts do not have
  /// permission to archive findings from their accounts.
  ///
  /// [detectorId]: The ID of the detector that specifies the GuardDuty service
  /// whose findings you want to archive.
  ///
  /// [findingIds]: IDs of the findings that you want to archive.
  Future<ArchiveFindingsResponse> archiveFindings(
      {@required String detectorId, @required List<String> findingIds}) async {
    var response_ = await _client.send('ArchiveFindings', {
      'DetectorId': detectorId,
      'FindingIds': findingIds,
    });
    return ArchiveFindingsResponse.fromJson(response_);
  }

  /// Creates a single Amazon GuardDuty detector. A detector is a resource that
  /// represents the GuardDuty service. To start using GuardDuty, you must
  /// create a detector in each region that you enable the service. You can have
  /// only one detector per account per region.
  ///
  /// [enable]: A boolean value that specifies whether the detector is to be
  /// enabled.
  ///
  /// [clientToken]: The idempotency token for the create request.
  ///
  /// [findingPublishingFrequency]: A enum value that specifies how frequently
  /// customer got Finding updates published.
  ///
  /// [tags]: The tags to be added to a new detector resource.
  Future<CreateDetectorResponse> createDetector(bool enable,
      {String clientToken,
      String findingPublishingFrequency,
      Map<String, String> tags}) async {
    var response_ = await _client.send('CreateDetector', {
      'Enable': enable,
      if (clientToken != null) 'ClientToken': clientToken,
      if (findingPublishingFrequency != null)
        'FindingPublishingFrequency': findingPublishingFrequency,
      if (tags != null) 'Tags': tags,
    });
    return CreateDetectorResponse.fromJson(response_);
  }

  /// Creates a filter using the specified finding criteria.
  ///
  /// [detectorId]: The unique ID of the detector of the GuardDuty account for
  /// which you want to create a filter.
  ///
  /// [name]: The name of the filter.
  ///
  /// [description]: The description of the filter.
  ///
  /// [action]: Specifies the action that is to be applied to the findings that
  /// match the filter.
  ///
  /// [rank]: Specifies the position of the filter in the list of current
  /// filters. Also specifies the order in which this filter is applied to the
  /// findings.
  ///
  /// [findingCriteria]: Represents the criteria to be used in the filter for
  /// querying findings.
  ///
  /// [clientToken]: The idempotency token for the create request.
  ///
  /// [tags]: The tags to be added to a new filter resource.
  Future<CreateFilterResponse> createFilter(
      {@required String detectorId,
      @required String name,
      String description,
      String action,
      int rank,
      @required FindingCriteria findingCriteria,
      String clientToken,
      Map<String, String> tags}) async {
    var response_ = await _client.send('CreateFilter', {
      'DetectorId': detectorId,
      'Name': name,
      if (description != null) 'Description': description,
      if (action != null) 'Action': action,
      if (rank != null) 'Rank': rank,
      'FindingCriteria': findingCriteria,
      if (clientToken != null) 'ClientToken': clientToken,
      if (tags != null) 'Tags': tags,
    });
    return CreateFilterResponse.fromJson(response_);
  }

  /// Creates a new IPSet - a list of trusted IP addresses that have been
  /// whitelisted for secure communication with AWS infrastructure and
  /// applications.
  ///
  /// [detectorId]: The unique ID of the detector of the GuardDuty account for
  /// which you want to create an IPSet.
  ///
  /// [name]: The user friendly name to identify the IPSet. This name is
  /// displayed in all findings that are triggered by activity that involves IP
  /// addresses included in this IPSet.
  ///
  /// [format]: The format of the file that contains the IPSet.
  ///
  /// [location]: The URI of the file that contains the IPSet. For example
  /// (https://s3.us-west-2.amazonaws.com/my-bucket/my-object-key)
  ///
  /// [activate]: A boolean value that indicates whether GuardDuty is to start
  /// using the uploaded IPSet.
  ///
  /// [clientToken]: The idempotency token for the create request.
  ///
  /// [tags]: The tags to be added to a new IP set resource.
  Future<CreateIPSetResponse> createIPSet(
      {@required String detectorId,
      @required String name,
      @required String format,
      @required String location,
      @required bool activate,
      String clientToken,
      Map<String, String> tags}) async {
    var response_ = await _client.send('CreateIPSet', {
      'DetectorId': detectorId,
      'Name': name,
      'Format': format,
      'Location': location,
      'Activate': activate,
      if (clientToken != null) 'ClientToken': clientToken,
      if (tags != null) 'Tags': tags,
    });
    return CreateIPSetResponse.fromJson(response_);
  }

  /// Creates member accounts of the current AWS account by specifying a list of
  /// AWS account IDs. The current AWS account can then invite these members to
  /// manage GuardDuty in their accounts.
  ///
  /// [detectorId]: The unique ID of the detector of the GuardDuty account with
  /// which you want to associate member accounts.
  ///
  /// [accountDetails]: A list of account ID and email address pairs of the
  /// accounts that you want to associate with the master GuardDuty account.
  Future<CreateMembersResponse> createMembers(
      {@required String detectorId,
      @required List<AccountDetail> accountDetails}) async {
    var response_ = await _client.send('CreateMembers', {
      'DetectorId': detectorId,
      'AccountDetails': accountDetails,
    });
    return CreateMembersResponse.fromJson(response_);
  }

  /// Generates example findings of types specified by the list of finding
  /// types. If 'NULL' is specified for findingTypes, the API generates example
  /// findings of all supported finding types.
  ///
  /// [detectorId]: The ID of the detector to create sample findings for.
  ///
  /// [findingTypes]: Types of sample findings that you want to generate.
  Future<CreateSampleFindingsResponse> createSampleFindings(String detectorId,
      {List<String> findingTypes}) async {
    var response_ = await _client.send('CreateSampleFindings', {
      'DetectorId': detectorId,
      if (findingTypes != null) 'FindingTypes': findingTypes,
    });
    return CreateSampleFindingsResponse.fromJson(response_);
  }

  /// Create a new ThreatIntelSet. ThreatIntelSets consist of known malicious IP
  /// addresses. GuardDuty generates findings based on ThreatIntelSets.
  ///
  /// [detectorId]: The unique ID of the detector of the GuardDuty account for
  /// which you want to create a threatIntelSet.
  ///
  /// [name]: A user-friendly ThreatIntelSet name that is displayed in all
  /// finding generated by activity that involves IP addresses included in this
  /// ThreatIntelSet.
  ///
  /// [format]: The format of the file that contains the ThreatIntelSet.
  ///
  /// [location]: The URI of the file that contains the ThreatIntelSet. For
  /// example (https://s3.us-west-2.amazonaws.com/my-bucket/my-object-key).
  ///
  /// [activate]: A boolean value that indicates whether GuardDuty is to start
  /// using the uploaded ThreatIntelSet.
  ///
  /// [clientToken]: The idempotency token for the create request.
  ///
  /// [tags]: The tags to be added to a new Threat List resource.
  Future<CreateThreatIntelSetResponse> createThreatIntelSet(
      {@required String detectorId,
      @required String name,
      @required String format,
      @required String location,
      @required bool activate,
      String clientToken,
      Map<String, String> tags}) async {
    var response_ = await _client.send('CreateThreatIntelSet', {
      'DetectorId': detectorId,
      'Name': name,
      'Format': format,
      'Location': location,
      'Activate': activate,
      if (clientToken != null) 'ClientToken': clientToken,
      if (tags != null) 'Tags': tags,
    });
    return CreateThreatIntelSetResponse.fromJson(response_);
  }

  /// Declines invitations sent to the current member account by AWS account
  /// specified by their account IDs.
  ///
  /// [accountIds]: A list of account IDs of the AWS accounts that sent
  /// invitations to the current member account that you want to decline
  /// invitations from.
  Future<DeclineInvitationsResponse> declineInvitations(
      List<String> accountIds) async {
    var response_ = await _client.send('DeclineInvitations', {
      'AccountIds': accountIds,
    });
    return DeclineInvitationsResponse.fromJson(response_);
  }

  /// Deletes a Amazon GuardDuty detector specified by the detector ID.
  ///
  /// [detectorId]: The unique ID of the detector that you want to delete.
  Future<DeleteDetectorResponse> deleteDetector(String detectorId) async {
    var response_ = await _client.send('DeleteDetector', {
      'DetectorId': detectorId,
    });
    return DeleteDetectorResponse.fromJson(response_);
  }

  /// Deletes the filter specified by the filter name.
  ///
  /// [detectorId]: The unique ID of the detector the filter is associated with.
  ///
  /// [filterName]: The name of the filter you want to delete.
  Future<DeleteFilterResponse> deleteFilter(
      {@required String detectorId, @required String filterName}) async {
    var response_ = await _client.send('DeleteFilter', {
      'DetectorId': detectorId,
      'FilterName': filterName,
    });
    return DeleteFilterResponse.fromJson(response_);
  }

  /// Deletes the IPSet specified by the IPSet ID.
  ///
  /// [detectorId]: The unique ID of the detector the ipSet is associated with.
  ///
  /// [ipSetId]: The unique ID of the ipSet you want to delete.
  Future<DeleteIPSetResponse> deleteIPSet(
      {@required String detectorId, @required String ipSetId}) async {
    var response_ = await _client.send('DeleteIPSet', {
      'DetectorId': detectorId,
      'IpSetId': ipSetId,
    });
    return DeleteIPSetResponse.fromJson(response_);
  }

  /// Deletes invitations sent to the current member account by AWS accounts
  /// specified by their account IDs.
  ///
  /// [accountIds]: A list of account IDs of the AWS accounts that sent
  /// invitations to the current member account that you want to delete
  /// invitations from.
  Future<DeleteInvitationsResponse> deleteInvitations(
      List<String> accountIds) async {
    var response_ = await _client.send('DeleteInvitations', {
      'AccountIds': accountIds,
    });
    return DeleteInvitationsResponse.fromJson(response_);
  }

  /// Deletes GuardDuty member accounts (to the current GuardDuty master
  /// account) specified by the account IDs.
  ///
  /// [detectorId]: The unique ID of the detector of the GuardDuty account whose
  /// members you want to delete.
  ///
  /// [accountIds]: A list of account IDs of the GuardDuty member accounts that
  /// you want to delete.
  Future<DeleteMembersResponse> deleteMembers(
      {@required String detectorId, @required List<String> accountIds}) async {
    var response_ = await _client.send('DeleteMembers', {
      'DetectorId': detectorId,
      'AccountIds': accountIds,
    });
    return DeleteMembersResponse.fromJson(response_);
  }

  /// Deletes ThreatIntelSet specified by the ThreatIntelSet ID.
  ///
  /// [detectorId]: The unique ID of the detector the threatIntelSet is
  /// associated with.
  ///
  /// [threatIntelSetId]: The unique ID of the threatIntelSet you want to
  /// delete.
  Future<DeleteThreatIntelSetResponse> deleteThreatIntelSet(
      {@required String detectorId, @required String threatIntelSetId}) async {
    var response_ = await _client.send('DeleteThreatIntelSet', {
      'DetectorId': detectorId,
      'ThreatIntelSetId': threatIntelSetId,
    });
    return DeleteThreatIntelSetResponse.fromJson(response_);
  }

  /// Disassociates the current GuardDuty member account from its master
  /// account.
  ///
  /// [detectorId]: The unique ID of the detector of the GuardDuty member
  /// account.
  Future<DisassociateFromMasterAccountResponse> disassociateFromMasterAccount(
      String detectorId) async {
    var response_ = await _client.send('DisassociateFromMasterAccount', {
      'DetectorId': detectorId,
    });
    return DisassociateFromMasterAccountResponse.fromJson(response_);
  }

  /// Disassociates GuardDuty member accounts (to the current GuardDuty master
  /// account) specified by the account IDs.
  ///
  /// [detectorId]: The unique ID of the detector of the GuardDuty account whose
  /// members you want to disassociate from master.
  ///
  /// [accountIds]: A list of account IDs of the GuardDuty member accounts that
  /// you want to disassociate from master.
  Future<DisassociateMembersResponse> disassociateMembers(
      {@required String detectorId, @required List<String> accountIds}) async {
    var response_ = await _client.send('DisassociateMembers', {
      'DetectorId': detectorId,
      'AccountIds': accountIds,
    });
    return DisassociateMembersResponse.fromJson(response_);
  }

  /// Retrieves an Amazon GuardDuty detector specified by the detectorId.
  ///
  /// [detectorId]: The unique ID of the detector that you want to get.
  Future<GetDetectorResponse> getDetector(String detectorId) async {
    var response_ = await _client.send('GetDetector', {
      'DetectorId': detectorId,
    });
    return GetDetectorResponse.fromJson(response_);
  }

  /// Returns the details of the filter specified by the filter name.
  ///
  /// [detectorId]: The unique ID of the detector the filter is associated with.
  ///
  /// [filterName]: The name of the filter you want to get.
  Future<GetFilterResponse> getFilter(
      {@required String detectorId, @required String filterName}) async {
    var response_ = await _client.send('GetFilter', {
      'DetectorId': detectorId,
      'FilterName': filterName,
    });
    return GetFilterResponse.fromJson(response_);
  }

  /// Describes Amazon GuardDuty findings specified by finding IDs.
  ///
  /// [detectorId]: The ID of the detector that specifies the GuardDuty service
  /// whose findings you want to retrieve.
  ///
  /// [findingIds]: IDs of the findings that you want to retrieve.
  ///
  /// [sortCriteria]: Represents the criteria used for sorting findings.
  Future<GetFindingsResponse> getFindings(
      {@required String detectorId,
      @required List<String> findingIds,
      SortCriteria sortCriteria}) async {
    var response_ = await _client.send('GetFindings', {
      'DetectorId': detectorId,
      'FindingIds': findingIds,
      if (sortCriteria != null) 'SortCriteria': sortCriteria,
    });
    return GetFindingsResponse.fromJson(response_);
  }

  /// Lists Amazon GuardDuty findings' statistics for the specified detector ID.
  ///
  /// [detectorId]: The ID of the detector that specifies the GuardDuty service
  /// whose findings' statistics you want to retrieve.
  ///
  /// [findingStatisticTypes]: Types of finding statistics to retrieve.
  ///
  /// [findingCriteria]: Represents the criteria used for querying findings.
  Future<GetFindingsStatisticsResponse> getFindingsStatistics(
      {@required String detectorId,
      @required List<String> findingStatisticTypes,
      FindingCriteria findingCriteria}) async {
    var response_ = await _client.send('GetFindingsStatistics', {
      'DetectorId': detectorId,
      'FindingStatisticTypes': findingStatisticTypes,
      if (findingCriteria != null) 'FindingCriteria': findingCriteria,
    });
    return GetFindingsStatisticsResponse.fromJson(response_);
  }

  /// Retrieves the IPSet specified by the IPSet ID.
  ///
  /// [detectorId]: The unique ID of the detector the ipSet is associated with.
  ///
  /// [ipSetId]: The unique ID of the ipSet you want to get.
  Future<GetIPSetResponse> getIPSet(
      {@required String detectorId, @required String ipSetId}) async {
    var response_ = await _client.send('GetIPSet', {
      'DetectorId': detectorId,
      'IpSetId': ipSetId,
    });
    return GetIPSetResponse.fromJson(response_);
  }

  /// Returns the count of all GuardDuty membership invitations that were sent
  /// to the current member account except the currently accepted invitation.
  Future<GetInvitationsCountResponse> getInvitationsCount() async {
    var response_ = await _client.send('GetInvitationsCount', {});
    return GetInvitationsCountResponse.fromJson(response_);
  }

  /// Provides the details for the GuardDuty master account associated with the
  /// current GuardDuty member account.
  ///
  /// [detectorId]: The unique ID of the detector of the GuardDuty member
  /// account.
  Future<GetMasterAccountResponse> getMasterAccount(String detectorId) async {
    var response_ = await _client.send('GetMasterAccount', {
      'DetectorId': detectorId,
    });
    return GetMasterAccountResponse.fromJson(response_);
  }

  /// Retrieves GuardDuty member accounts (to the current GuardDuty master
  /// account) specified by the account IDs.
  ///
  /// [detectorId]: The unique ID of the detector of the GuardDuty account whose
  /// members you want to retrieve.
  ///
  /// [accountIds]: A list of account IDs of the GuardDuty member accounts that
  /// you want to describe.
  Future<GetMembersResponse> getMembers(
      {@required String detectorId, @required List<String> accountIds}) async {
    var response_ = await _client.send('GetMembers', {
      'DetectorId': detectorId,
      'AccountIds': accountIds,
    });
    return GetMembersResponse.fromJson(response_);
  }

  /// Retrieves the ThreatIntelSet that is specified by the ThreatIntelSet ID.
  ///
  /// [detectorId]: The unique ID of the detector the threatIntelSet is
  /// associated with.
  ///
  /// [threatIntelSetId]: The unique ID of the threatIntelSet you want to get.
  Future<GetThreatIntelSetResponse> getThreatIntelSet(
      {@required String detectorId, @required String threatIntelSetId}) async {
    var response_ = await _client.send('GetThreatIntelSet', {
      'DetectorId': detectorId,
      'ThreatIntelSetId': threatIntelSetId,
    });
    return GetThreatIntelSetResponse.fromJson(response_);
  }

  /// Invites other AWS accounts (created as members of the current AWS account
  /// by CreateMembers) to enable GuardDuty and allow the current AWS account to
  /// view and manage these accounts' GuardDuty findings on their behalf as the
  /// master account.
  ///
  /// [detectorId]: The unique ID of the detector of the GuardDuty account with
  /// which you want to invite members.
  ///
  /// [accountIds]: A list of account IDs of the accounts that you want to
  /// invite to GuardDuty as members.
  ///
  /// [disableEmailNotification]: A boolean value that specifies whether you
  /// want to disable email notification to the accounts that you’re inviting to
  /// GuardDuty as members.
  ///
  /// [message]: The invitation message that you want to send to the accounts
  /// that you’re inviting to GuardDuty as members.
  Future<InviteMembersResponse> inviteMembers(
      {@required String detectorId,
      @required List<String> accountIds,
      bool disableEmailNotification,
      String message}) async {
    var response_ = await _client.send('InviteMembers', {
      'DetectorId': detectorId,
      'AccountIds': accountIds,
      if (disableEmailNotification != null)
        'DisableEmailNotification': disableEmailNotification,
      if (message != null) 'Message': message,
    });
    return InviteMembersResponse.fromJson(response_);
  }

  /// Lists detectorIds of all the existing Amazon GuardDuty detector resources.
  ///
  /// [maxResults]: You can use this parameter to indicate the maximum number of
  /// items you want in the response. The default value is 50. The maximum value
  /// is 50.
  ///
  /// [nextToken]: You can use this parameter when paginating results. Set the
  /// value of this parameter to null on your first call to the list action. For
  /// subsequent calls to the action fill nextToken in the request with the
  /// value of NextToken from the previous response to continue listing data.
  Future<ListDetectorsResponse> listDetectors(
      {int maxResults, String nextToken}) async {
    var response_ = await _client.send('ListDetectors', {
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListDetectorsResponse.fromJson(response_);
  }

  /// Returns a paginated list of the current filters.
  ///
  /// [detectorId]: The unique ID of the detector the filter is associated with.
  ///
  /// [maxResults]: You can use this parameter to indicate the maximum number of
  /// items you want in the response. The default value is 50. The maximum value
  /// is 50.
  ///
  /// [nextToken]: You can use this parameter when paginating results. Set the
  /// value of this parameter to null on your first call to the list action. For
  /// subsequent calls to the action fill nextToken in the request with the
  /// value of NextToken from the previous response to continue listing data.
  Future<ListFiltersResponse> listFilters(String detectorId,
      {int maxResults, String nextToken}) async {
    var response_ = await _client.send('ListFilters', {
      'DetectorId': detectorId,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListFiltersResponse.fromJson(response_);
  }

  /// Lists Amazon GuardDuty findings for the specified detector ID.
  ///
  /// [detectorId]: The ID of the detector that specifies the GuardDuty service
  /// whose findings you want to list.
  ///
  /// [findingCriteria]: Represents the criteria used for querying findings.
  ///
  /// [sortCriteria]: Represents the criteria used for sorting findings.
  ///
  /// [maxResults]: You can use this parameter to indicate the maximum number of
  /// items you want in the response. The default value is 50. The maximum value
  /// is 50.
  ///
  /// [nextToken]: You can use this parameter when paginating results. Set the
  /// value of this parameter to null on your first call to the list action. For
  /// subsequent calls to the action fill nextToken in the request with the
  /// value of NextToken from the previous response to continue listing data.
  Future<ListFindingsResponse> listFindings(String detectorId,
      {FindingCriteria findingCriteria,
      SortCriteria sortCriteria,
      int maxResults,
      String nextToken}) async {
    var response_ = await _client.send('ListFindings', {
      'DetectorId': detectorId,
      if (findingCriteria != null) 'FindingCriteria': findingCriteria,
      if (sortCriteria != null) 'SortCriteria': sortCriteria,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListFindingsResponse.fromJson(response_);
  }

  /// Lists the IPSets of the GuardDuty service specified by the detector ID.
  ///
  /// [detectorId]: The unique ID of the detector the ipSet is associated with.
  ///
  /// [maxResults]: You can use this parameter to indicate the maximum number of
  /// items you want in the response. The default value is 50. The maximum value
  /// is 50.
  ///
  /// [nextToken]: You can use this parameter when paginating results. Set the
  /// value of this parameter to null on your first call to the list action. For
  /// subsequent calls to the action fill nextToken in the request with the
  /// value of NextToken from the previous response to continue listing data.
  Future<ListIPSetsResponse> listIPSets(String detectorId,
      {int maxResults, String nextToken}) async {
    var response_ = await _client.send('ListIPSets', {
      'DetectorId': detectorId,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListIPSetsResponse.fromJson(response_);
  }

  /// Lists all GuardDuty membership invitations that were sent to the current
  /// AWS account.
  ///
  /// [maxResults]: You can use this parameter to indicate the maximum number of
  /// items you want in the response. The default value is 50. The maximum value
  /// is 50.
  ///
  /// [nextToken]: You can use this parameter when paginating results. Set the
  /// value of this parameter to null on your first call to the list action. For
  /// subsequent calls to the action fill nextToken in the request with the
  /// value of NextToken from the previous response to continue listing data.
  Future<ListInvitationsResponse> listInvitations(
      {int maxResults, String nextToken}) async {
    var response_ = await _client.send('ListInvitations', {
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListInvitationsResponse.fromJson(response_);
  }

  /// Lists details about all member accounts for the current GuardDuty master
  /// account.
  ///
  /// [detectorId]: The unique ID of the detector the member is associated with.
  ///
  /// [maxResults]: You can use this parameter to indicate the maximum number of
  /// items you want in the response. The default value is 50. The maximum value
  /// is 50.
  ///
  /// [nextToken]: You can use this parameter when paginating results. Set the
  /// value of this parameter to null on your first call to the list action. For
  /// subsequent calls to the action fill nextToken in the request with the
  /// value of NextToken from the previous response to continue listing data.
  ///
  /// [onlyAssociated]: Specifies whether to only return associated members or
  /// to return all members (including members which haven't been invited yet or
  /// have been disassociated).
  Future<ListMembersResponse> listMembers(String detectorId,
      {int maxResults, String nextToken, String onlyAssociated}) async {
    var response_ = await _client.send('ListMembers', {
      'DetectorId': detectorId,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (onlyAssociated != null) 'OnlyAssociated': onlyAssociated,
    });
    return ListMembersResponse.fromJson(response_);
  }

  /// Lists tags for a resource. Tagging is currently supported for detectors,
  /// finding filters, IP sets, and Threat Intel sets, with a limit of 50 tags
  /// per resource. When invoked, this operation returns all assigned tags for a
  /// given resource..
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) for the given GuardDuty
  /// resource
  Future<ListTagsForResourceResponse> listTagsForResource(
      String resourceArn) async {
    var response_ = await _client.send('ListTagsForResource', {
      'ResourceArn': resourceArn,
    });
    return ListTagsForResourceResponse.fromJson(response_);
  }

  /// Lists the ThreatIntelSets of the GuardDuty service specified by the
  /// detector ID.
  ///
  /// [detectorId]: The unique ID of the detector the threatIntelSet is
  /// associated with.
  ///
  /// [maxResults]: You can use this parameter to indicate the maximum number of
  /// items you want in the response. The default value is 50. The maximum value
  /// is 50.
  ///
  /// [nextToken]: You can use this parameter when paginating results. Set the
  /// value of this parameter to null on your first call to the list action. For
  /// subsequent calls to the action fill nextToken in the request with the
  /// value of NextToken from the previous response to continue listing data.
  Future<ListThreatIntelSetsResponse> listThreatIntelSets(String detectorId,
      {int maxResults, String nextToken}) async {
    var response_ = await _client.send('ListThreatIntelSets', {
      'DetectorId': detectorId,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListThreatIntelSetsResponse.fromJson(response_);
  }

  /// Re-enables GuardDuty to monitor findings of the member accounts specified
  /// by the account IDs. A master GuardDuty account can run this command after
  /// disabling GuardDuty from monitoring these members' findings by running
  /// StopMonitoringMembers.
  ///
  /// [detectorId]: The unique ID of the detector of the GuardDuty account whom
  /// you want to re-enable to monitor members' findings.
  ///
  /// [accountIds]: A list of account IDs of the GuardDuty member accounts whose
  /// findings you want the master account to monitor.
  Future<StartMonitoringMembersResponse> startMonitoringMembers(
      {@required String detectorId, @required List<String> accountIds}) async {
    var response_ = await _client.send('StartMonitoringMembers', {
      'DetectorId': detectorId,
      'AccountIds': accountIds,
    });
    return StartMonitoringMembersResponse.fromJson(response_);
  }

  /// Disables GuardDuty from monitoring findings of the member accounts
  /// specified by the account IDs. After running this command, a master
  /// GuardDuty account can run StartMonitoringMembers to re-enable GuardDuty to
  /// monitor these members’ findings.
  ///
  /// [detectorId]: The unique ID of the detector of the GuardDuty account that
  /// you want to stop from monitor members' findings.
  ///
  /// [accountIds]: A list of account IDs of the GuardDuty member accounts whose
  /// findings you want the master account to stop monitoring.
  Future<StopMonitoringMembersResponse> stopMonitoringMembers(
      {@required String detectorId, @required List<String> accountIds}) async {
    var response_ = await _client.send('StopMonitoringMembers', {
      'DetectorId': detectorId,
      'AccountIds': accountIds,
    });
    return StopMonitoringMembersResponse.fromJson(response_);
  }

  /// Adds tags to a resource.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) for the given GuardDuty
  /// resource
  ///
  /// [tags]: The tags to be added to a resource.
  Future<TagResourceResponse> tagResource(
      {@required String resourceArn,
      @required Map<String, String> tags}) async {
    var response_ = await _client.send('TagResource', {
      'ResourceArn': resourceArn,
      'Tags': tags,
    });
    return TagResourceResponse.fromJson(response_);
  }

  /// Unarchives Amazon GuardDuty findings specified by the list of finding IDs.
  ///
  /// [detectorId]: The ID of the detector that specifies the GuardDuty service
  /// whose findings you want to unarchive.
  ///
  /// [findingIds]: IDs of the findings that you want to unarchive.
  Future<UnarchiveFindingsResponse> unarchiveFindings(
      {@required String detectorId, @required List<String> findingIds}) async {
    var response_ = await _client.send('UnarchiveFindings', {
      'DetectorId': detectorId,
      'FindingIds': findingIds,
    });
    return UnarchiveFindingsResponse.fromJson(response_);
  }

  /// Removes tags from a resource.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) for the given GuardDuty
  /// resource
  ///
  /// [tagKeys]: The tag keys to remove from a resource.
  Future<UntagResourceResponse> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {
    var response_ = await _client.send('UntagResource', {
      'ResourceArn': resourceArn,
      'TagKeys': tagKeys,
    });
    return UntagResourceResponse.fromJson(response_);
  }

  /// Updates an Amazon GuardDuty detector specified by the detectorId.
  ///
  /// [detectorId]: The unique ID of the detector that you want to update.
  ///
  /// [enable]: Updated boolean value for the detector that specifies whether
  /// the detector is enabled.
  ///
  /// [findingPublishingFrequency]: A enum value that specifies how frequently
  /// customer got Finding updates published.
  Future<UpdateDetectorResponse> updateDetector(String detectorId,
      {bool enable, String findingPublishingFrequency}) async {
    var response_ = await _client.send('UpdateDetector', {
      'DetectorId': detectorId,
      if (enable != null) 'Enable': enable,
      if (findingPublishingFrequency != null)
        'FindingPublishingFrequency': findingPublishingFrequency,
    });
    return UpdateDetectorResponse.fromJson(response_);
  }

  /// Updates the filter specified by the filter name.
  ///
  /// [detectorId]: The unique ID of the detector that specifies the GuardDuty
  /// service where you want to update a filter.
  ///
  /// [filterName]: The name of the filter.
  ///
  /// [description]: The description of the filter.
  ///
  /// [action]: Specifies the action that is to be applied to the findings that
  /// match the filter.
  ///
  /// [rank]: Specifies the position of the filter in the list of current
  /// filters. Also specifies the order in which this filter is applied to the
  /// findings.
  ///
  /// [findingCriteria]: Represents the criteria to be used in the filter for
  /// querying findings.
  Future<UpdateFilterResponse> updateFilter(
      {@required String detectorId,
      @required String filterName,
      String description,
      String action,
      int rank,
      FindingCriteria findingCriteria}) async {
    var response_ = await _client.send('UpdateFilter', {
      'DetectorId': detectorId,
      'FilterName': filterName,
      if (description != null) 'Description': description,
      if (action != null) 'Action': action,
      if (rank != null) 'Rank': rank,
      if (findingCriteria != null) 'FindingCriteria': findingCriteria,
    });
    return UpdateFilterResponse.fromJson(response_);
  }

  /// Marks specified Amazon GuardDuty findings as useful or not useful.
  ///
  /// [detectorId]: The ID of the detector that specifies the GuardDuty service
  /// whose findings you want to mark as useful or not useful.
  ///
  /// [findingIds]: IDs of the findings that you want to mark as useful or not
  /// useful.
  ///
  /// [feedback]: Valid values: USEFUL | NOT_USEFUL
  ///
  /// [comments]: Additional feedback about the GuardDuty findings.
  Future<UpdateFindingsFeedbackResponse> updateFindingsFeedback(
      {@required String detectorId,
      @required List<String> findingIds,
      @required String feedback,
      String comments}) async {
    var response_ = await _client.send('UpdateFindingsFeedback', {
      'DetectorId': detectorId,
      'FindingIds': findingIds,
      'Feedback': feedback,
      if (comments != null) 'Comments': comments,
    });
    return UpdateFindingsFeedbackResponse.fromJson(response_);
  }

  /// Updates the IPSet specified by the IPSet ID.
  ///
  /// [detectorId]: The detectorID that specifies the GuardDuty service whose
  /// IPSet you want to update.
  ///
  /// [ipSetId]: The unique ID that specifies the IPSet that you want to update.
  ///
  /// [name]: The unique ID that specifies the IPSet that you want to update.
  ///
  /// [location]: The updated URI of the file that contains the IPSet. For
  /// example (https://s3.us-west-2.amazonaws.com/my-bucket/my-object-key).
  ///
  /// [activate]: The updated boolean value that specifies whether the IPSet is
  /// active or not.
  Future<UpdateIPSetResponse> updateIPSet(
      {@required String detectorId,
      @required String ipSetId,
      String name,
      String location,
      bool activate}) async {
    var response_ = await _client.send('UpdateIPSet', {
      'DetectorId': detectorId,
      'IpSetId': ipSetId,
      if (name != null) 'Name': name,
      if (location != null) 'Location': location,
      if (activate != null) 'Activate': activate,
    });
    return UpdateIPSetResponse.fromJson(response_);
  }

  /// Updates the ThreatIntelSet specified by ThreatIntelSet ID.
  ///
  /// [detectorId]: The detectorID that specifies the GuardDuty service whose
  /// ThreatIntelSet you want to update.
  ///
  /// [threatIntelSetId]: The unique ID that specifies the ThreatIntelSet that
  /// you want to update.
  ///
  /// [name]: The unique ID that specifies the ThreatIntelSet that you want to
  /// update.
  ///
  /// [location]: The updated URI of the file that contains the ThreateIntelSet.
  /// For example (https://s3.us-west-2.amazonaws.com/my-bucket/my-object-key)
  ///
  /// [activate]: The updated boolean value that specifies whether the
  /// ThreateIntelSet is active or not.
  Future<UpdateThreatIntelSetResponse> updateThreatIntelSet(
      {@required String detectorId,
      @required String threatIntelSetId,
      String name,
      String location,
      bool activate}) async {
    var response_ = await _client.send('UpdateThreatIntelSet', {
      'DetectorId': detectorId,
      'ThreatIntelSetId': threatIntelSetId,
      if (name != null) 'Name': name,
      if (location != null) 'Location': location,
      if (activate != null) 'Activate': activate,
    });
    return UpdateThreatIntelSetResponse.fromJson(response_);
  }
}

class AcceptInvitationResponse {
  AcceptInvitationResponse();
  static AcceptInvitationResponse fromJson(Map<String, dynamic> json) =>
      AcceptInvitationResponse();
}

/// Contains information about the access keys.
class AccessKeyDetails {
  /// Access key ID of the user.
  final String accessKeyId;

  /// The principal ID of the user.
  final String principalId;

  /// The name of the user.
  final String userName;

  /// The type of the user.
  final String userType;

  AccessKeyDetails({
    this.accessKeyId,
    this.principalId,
    this.userName,
    this.userType,
  });
  static AccessKeyDetails fromJson(Map<String, dynamic> json) =>
      AccessKeyDetails(
        accessKeyId: json.containsKey('AccessKeyId')
            ? json['AccessKeyId'] as String
            : null,
        principalId: json.containsKey('PrincipalId')
            ? json['PrincipalId'] as String
            : null,
        userName:
            json.containsKey('UserName') ? json['UserName'] as String : null,
        userType:
            json.containsKey('UserType') ? json['UserType'] as String : null,
      );
}

/// Contains information about the account.
class AccountDetail {
  /// Member account ID.
  final String accountId;

  /// Member account's email address.
  final String email;

  AccountDetail({
    @required this.accountId,
    @required this.email,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Contains information about action.
class Action {
  /// GuardDuty Finding activity type.
  final String actionType;

  /// Information about the AWS_API_CALL action described in this finding.
  final AwsApiCallAction awsApiCallAction;

  /// Information about the DNS_REQUEST action described in this finding.
  final DnsRequestAction dnsRequestAction;

  /// Information about the NETWORK_CONNECTION action described in this finding.
  final NetworkConnectionAction networkConnectionAction;

  /// Information about the PORT_PROBE action described in this finding.
  final PortProbeAction portProbeAction;

  Action({
    this.actionType,
    this.awsApiCallAction,
    this.dnsRequestAction,
    this.networkConnectionAction,
    this.portProbeAction,
  });
  static Action fromJson(Map<String, dynamic> json) => Action(
        actionType: json.containsKey('ActionType')
            ? json['ActionType'] as String
            : null,
        awsApiCallAction: json.containsKey('AwsApiCallAction')
            ? AwsApiCallAction.fromJson(json['AwsApiCallAction'])
            : null,
        dnsRequestAction: json.containsKey('DnsRequestAction')
            ? DnsRequestAction.fromJson(json['DnsRequestAction'])
            : null,
        networkConnectionAction: json.containsKey('NetworkConnectionAction')
            ? NetworkConnectionAction.fromJson(json['NetworkConnectionAction'])
            : null,
        portProbeAction: json.containsKey('PortProbeAction')
            ? PortProbeAction.fromJson(json['PortProbeAction'])
            : null,
      );
}

class ArchiveFindingsResponse {
  ArchiveFindingsResponse();
  static ArchiveFindingsResponse fromJson(Map<String, dynamic> json) =>
      ArchiveFindingsResponse();
}

/// Contains information about the API operation.
class AwsApiCallAction {
  /// AWS API name.
  final String api;

  /// AWS API caller type.
  final String callerType;

  /// Domain information for the AWS API call.
  final DomainDetails domainDetails;

  /// Remote IP information of the connection.
  final RemoteIpDetails remoteIpDetails;

  /// AWS service name whose API was invoked.
  final String serviceName;

  AwsApiCallAction({
    this.api,
    this.callerType,
    this.domainDetails,
    this.remoteIpDetails,
    this.serviceName,
  });
  static AwsApiCallAction fromJson(Map<String, dynamic> json) =>
      AwsApiCallAction(
        api: json.containsKey('Api') ? json['Api'] as String : null,
        callerType: json.containsKey('CallerType')
            ? json['CallerType'] as String
            : null,
        domainDetails: json.containsKey('DomainDetails')
            ? DomainDetails.fromJson(json['DomainDetails'])
            : null,
        remoteIpDetails: json.containsKey('RemoteIpDetails')
            ? RemoteIpDetails.fromJson(json['RemoteIpDetails'])
            : null,
        serviceName: json.containsKey('ServiceName')
            ? json['ServiceName'] as String
            : null,
      );
}

/// Contains information about the city associated with the IP address.
class City {
  /// City name of the remote IP address.
  final String cityName;

  City({
    this.cityName,
  });
  static City fromJson(Map<String, dynamic> json) => City(
        cityName:
            json.containsKey('CityName') ? json['CityName'] as String : null,
      );
}

/// Contains information about the condition.
class Condition {
  /// Deprecated. Represents the equal condition to be applied to a single field
  /// when querying for findings.
  final List<String> eq;

  /// Deprecated. Represents the not equal condition to be applied to a single
  /// field when querying for findings.
  final List<String> neq;

  /// Deprecated. Represents a greater than condition to be applied to a single
  /// field when querying for findings.
  final int gt;

  /// Deprecated. Represents a greater than equal condition to be applied to a
  /// single field when querying for findings.
  final int gte;

  /// Deprecated. Represents a less than condition to be applied to a single
  /// field when querying for findings.
  final int lt;

  /// Deprecated. Represents a less than equal condition to be applied to a
  /// single field when querying for findings.
  final int lte;

  /// Represents an **equal** condition to be applied to a single field when
  /// querying for findings.
  final List<String> equals;

  /// Represents an **not equal** condition to be applied to a single field when
  /// querying for findings.
  final List<String> notEquals;

  /// Represents a greater than condition to be applied to a single field when
  /// querying for findings.
  final BigInt greaterThan;

  /// Represents a greater than equal condition to be applied to a single field
  /// when querying for findings.
  final BigInt greaterThanOrEqual;

  /// Represents a less than condition to be applied to a single field when
  /// querying for findings.
  final BigInt lessThan;

  /// Represents a less than equal condition to be applied to a single field
  /// when querying for findings.
  final BigInt lessThanOrEqual;

  Condition({
    this.eq,
    this.neq,
    this.gt,
    this.gte,
    this.lt,
    this.lte,
    this.equals,
    this.notEquals,
    this.greaterThan,
    this.greaterThanOrEqual,
    this.lessThan,
    this.lessThanOrEqual,
  });
  static Condition fromJson(Map<String, dynamic> json) => Condition(
        eq: json.containsKey('Eq')
            ? (json['Eq'] as List).map((e) => e as String).toList()
            : null,
        neq: json.containsKey('Neq')
            ? (json['Neq'] as List).map((e) => e as String).toList()
            : null,
        gt: json.containsKey('Gt') ? json['Gt'] as int : null,
        gte: json.containsKey('Gte') ? json['Gte'] as int : null,
        lt: json.containsKey('Lt') ? json['Lt'] as int : null,
        lte: json.containsKey('Lte') ? json['Lte'] as int : null,
        equals: json.containsKey('Equals')
            ? (json['Equals'] as List).map((e) => e as String).toList()
            : null,
        notEquals: json.containsKey('NotEquals')
            ? (json['NotEquals'] as List).map((e) => e as String).toList()
            : null,
        greaterThan: json.containsKey('GreaterThan')
            ? BigInt.from(json['GreaterThan'])
            : null,
        greaterThanOrEqual: json.containsKey('GreaterThanOrEqual')
            ? BigInt.from(json['GreaterThanOrEqual'])
            : null,
        lessThan:
            json.containsKey('LessThan') ? BigInt.from(json['LessThan']) : null,
        lessThanOrEqual: json.containsKey('LessThanOrEqual')
            ? BigInt.from(json['LessThanOrEqual'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Contains information about the country.
class Country {
  /// Country code of the remote IP address.
  final String countryCode;

  /// Country name of the remote IP address.
  final String countryName;

  Country({
    this.countryCode,
    this.countryName,
  });
  static Country fromJson(Map<String, dynamic> json) => Country(
        countryCode: json.containsKey('CountryCode')
            ? json['CountryCode'] as String
            : null,
        countryName: json.containsKey('CountryName')
            ? json['CountryName'] as String
            : null,
      );
}

class CreateDetectorResponse {
  /// The unique ID of the created detector.
  final String detectorId;

  CreateDetectorResponse({
    this.detectorId,
  });
  static CreateDetectorResponse fromJson(Map<String, dynamic> json) =>
      CreateDetectorResponse(
        detectorId: json.containsKey('DetectorId')
            ? json['DetectorId'] as String
            : null,
      );
}

class CreateFilterResponse {
  /// The name of the successfully created filter.
  final String name;

  CreateFilterResponse({
    @required this.name,
  });
  static CreateFilterResponse fromJson(Map<String, dynamic> json) =>
      CreateFilterResponse(
        name: json['Name'] as String,
      );
}

class CreateIPSetResponse {
  /// The ID of the IPSet resource.
  final String ipSetId;

  CreateIPSetResponse({
    @required this.ipSetId,
  });
  static CreateIPSetResponse fromJson(Map<String, dynamic> json) =>
      CreateIPSetResponse(
        ipSetId: json['IpSetId'] as String,
      );
}

class CreateMembersResponse {
  /// A list of objects containing the unprocessed account and a result string
  /// explaining why it was unprocessed.
  final List<UnprocessedAccount> unprocessedAccounts;

  CreateMembersResponse({
    @required this.unprocessedAccounts,
  });
  static CreateMembersResponse fromJson(Map<String, dynamic> json) =>
      CreateMembersResponse(
        unprocessedAccounts: (json['UnprocessedAccounts'] as List)
            .map((e) => UnprocessedAccount.fromJson(e))
            .toList(),
      );
}

class CreateSampleFindingsResponse {
  CreateSampleFindingsResponse();
  static CreateSampleFindingsResponse fromJson(Map<String, dynamic> json) =>
      CreateSampleFindingsResponse();
}

class CreateThreatIntelSetResponse {
  /// The ID of the ThreatIntelSet resource.
  final String threatIntelSetId;

  CreateThreatIntelSetResponse({
    @required this.threatIntelSetId,
  });
  static CreateThreatIntelSetResponse fromJson(Map<String, dynamic> json) =>
      CreateThreatIntelSetResponse(
        threatIntelSetId: json['ThreatIntelSetId'] as String,
      );
}

class DeclineInvitationsResponse {
  /// A list of objects containing the unprocessed account and a result string
  /// explaining why it was unprocessed.
  final List<UnprocessedAccount> unprocessedAccounts;

  DeclineInvitationsResponse({
    @required this.unprocessedAccounts,
  });
  static DeclineInvitationsResponse fromJson(Map<String, dynamic> json) =>
      DeclineInvitationsResponse(
        unprocessedAccounts: (json['UnprocessedAccounts'] as List)
            .map((e) => UnprocessedAccount.fromJson(e))
            .toList(),
      );
}

class DeleteDetectorResponse {
  DeleteDetectorResponse();
  static DeleteDetectorResponse fromJson(Map<String, dynamic> json) =>
      DeleteDetectorResponse();
}

class DeleteFilterResponse {
  DeleteFilterResponse();
  static DeleteFilterResponse fromJson(Map<String, dynamic> json) =>
      DeleteFilterResponse();
}

class DeleteIPSetResponse {
  DeleteIPSetResponse();
  static DeleteIPSetResponse fromJson(Map<String, dynamic> json) =>
      DeleteIPSetResponse();
}

class DeleteInvitationsResponse {
  /// A list of objects containing the unprocessed account and a result string
  /// explaining why it was unprocessed.
  final List<UnprocessedAccount> unprocessedAccounts;

  DeleteInvitationsResponse({
    @required this.unprocessedAccounts,
  });
  static DeleteInvitationsResponse fromJson(Map<String, dynamic> json) =>
      DeleteInvitationsResponse(
        unprocessedAccounts: (json['UnprocessedAccounts'] as List)
            .map((e) => UnprocessedAccount.fromJson(e))
            .toList(),
      );
}

class DeleteMembersResponse {
  /// The accounts that could not be processed.
  final List<UnprocessedAccount> unprocessedAccounts;

  DeleteMembersResponse({
    @required this.unprocessedAccounts,
  });
  static DeleteMembersResponse fromJson(Map<String, dynamic> json) =>
      DeleteMembersResponse(
        unprocessedAccounts: (json['UnprocessedAccounts'] as List)
            .map((e) => UnprocessedAccount.fromJson(e))
            .toList(),
      );
}

class DeleteThreatIntelSetResponse {
  DeleteThreatIntelSetResponse();
  static DeleteThreatIntelSetResponse fromJson(Map<String, dynamic> json) =>
      DeleteThreatIntelSetResponse();
}

class DisassociateFromMasterAccountResponse {
  DisassociateFromMasterAccountResponse();
  static DisassociateFromMasterAccountResponse fromJson(
          Map<String, dynamic> json) =>
      DisassociateFromMasterAccountResponse();
}

class DisassociateMembersResponse {
  /// A list of objects containing the unprocessed account and a result string
  /// explaining why it was unprocessed.
  final List<UnprocessedAccount> unprocessedAccounts;

  DisassociateMembersResponse({
    @required this.unprocessedAccounts,
  });
  static DisassociateMembersResponse fromJson(Map<String, dynamic> json) =>
      DisassociateMembersResponse(
        unprocessedAccounts: (json['UnprocessedAccounts'] as List)
            .map((e) => UnprocessedAccount.fromJson(e))
            .toList(),
      );
}

/// Contains information about the DNS request.
class DnsRequestAction {
  /// Domain information for the DNS request.
  final String domain;

  DnsRequestAction({
    this.domain,
  });
  static DnsRequestAction fromJson(Map<String, dynamic> json) =>
      DnsRequestAction(
        domain: json.containsKey('Domain') ? json['Domain'] as String : null,
      );
}

/// Contains information about the domain.
class DomainDetails {
  /// Domain information for the AWS API call.
  final String domain;

  DomainDetails({
    this.domain,
  });
  static DomainDetails fromJson(Map<String, dynamic> json) => DomainDetails(
        domain: json.containsKey('Domain') ? json['Domain'] as String : null,
      );
}

/// Contains information about the reason that the finding was generated.
class Evidence {
  /// A list of threat intelligence details related to the evidence.
  final List<ThreatIntelligenceDetail> threatIntelligenceDetails;

  Evidence({
    this.threatIntelligenceDetails,
  });
  static Evidence fromJson(Map<String, dynamic> json) => Evidence(
        threatIntelligenceDetails: json.containsKey('ThreatIntelligenceDetails')
            ? (json['ThreatIntelligenceDetails'] as List)
                .map((e) => ThreatIntelligenceDetail.fromJson(e))
                .toList()
            : null,
      );
}

/// Contains information about the finding.
class Finding {
  /// The ID of the account in which the finding was generated.
  final String accountId;

  /// The ARN for the finding.
  final String arn;

  /// The confidence score for the finding.
  final double confidence;

  /// The time and date at which the finding was created.
  final String createdAt;

  /// The description of the finding.
  final String description;

  /// The ID of the finding.
  final String id;

  /// The partition associated with the finding.
  final String partition;

  /// The Region in which the finding was generated.
  final String region;

  final Resource resource;

  /// The version of the schema used for the finding.
  final String schemaVersion;

  final Service service;

  /// The severity of the finding.
  final double severity;

  /// The title for the finding.
  final String title;

  /// The type of the finding.
  final String type;

  /// The time and date at which the finding was laste updated.
  final String updatedAt;

  Finding({
    @required this.accountId,
    @required this.arn,
    this.confidence,
    @required this.createdAt,
    this.description,
    @required this.id,
    this.partition,
    @required this.region,
    @required this.resource,
    @required this.schemaVersion,
    this.service,
    @required this.severity,
    this.title,
    @required this.type,
    @required this.updatedAt,
  });
  static Finding fromJson(Map<String, dynamic> json) => Finding(
        accountId: json['AccountId'] as String,
        arn: json['Arn'] as String,
        confidence: json.containsKey('Confidence')
            ? json['Confidence'] as double
            : null,
        createdAt: json['CreatedAt'] as String,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        id: json['Id'] as String,
        partition:
            json.containsKey('Partition') ? json['Partition'] as String : null,
        region: json['Region'] as String,
        resource: Resource.fromJson(json['Resource']),
        schemaVersion: json['SchemaVersion'] as String,
        service: json.containsKey('Service')
            ? Service.fromJson(json['Service'])
            : null,
        severity: json['Severity'] as double,
        title: json.containsKey('Title') ? json['Title'] as String : null,
        type: json['Type'] as String,
        updatedAt: json['UpdatedAt'] as String,
      );
}

/// Contains finding criteria information.
class FindingCriteria {
  /// Represents a map of finding properties that match specified conditions and
  /// values when querying findings.
  final Map<String, Condition> criterion;

  FindingCriteria({
    this.criterion,
  });
  static FindingCriteria fromJson(Map<String, dynamic> json) => FindingCriteria(
        criterion: json.containsKey('Criterion')
            ? (json['Criterion'] as Map)
                .map((k, v) => MapEntry(k as String, Condition.fromJson(v)))
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Contains information about finding statistics.
class FindingStatistics {
  /// Represents a map of severity to count statistic for a set of findings
  final Map<String, int> countBySeverity;

  FindingStatistics({
    this.countBySeverity,
  });
  static FindingStatistics fromJson(Map<String, dynamic> json) =>
      FindingStatistics(
        countBySeverity: json.containsKey('CountBySeverity')
            ? (json['CountBySeverity'] as Map)
                .map((k, v) => MapEntry(k as String, v as int))
            : null,
      );
}

/// Contains information about the
class GeoLocation {
  /// Latitude information of remote IP address.
  final double lat;

  /// Longitude information of remote IP address.
  final double lon;

  GeoLocation({
    this.lat,
    this.lon,
  });
  static GeoLocation fromJson(Map<String, dynamic> json) => GeoLocation(
        lat: json.containsKey('Lat') ? json['Lat'] as double : null,
        lon: json.containsKey('Lon') ? json['Lon'] as double : null,
      );
}

class GetDetectorResponse {
  /// Detector creation timestamp.
  final String createdAt;

  /// Finding publishing frequency.
  final String findingPublishingFrequency;

  /// The GuardDuty service role.
  final String serviceRole;

  /// The detector status.
  final String status;

  /// Detector last update timestamp.
  final String updatedAt;

  /// The tags of the detector resource.
  final Map<String, String> tags;

  GetDetectorResponse({
    this.createdAt,
    this.findingPublishingFrequency,
    @required this.serviceRole,
    @required this.status,
    this.updatedAt,
    this.tags,
  });
  static GetDetectorResponse fromJson(Map<String, dynamic> json) =>
      GetDetectorResponse(
        createdAt:
            json.containsKey('CreatedAt') ? json['CreatedAt'] as String : null,
        findingPublishingFrequency:
            json.containsKey('FindingPublishingFrequency')
                ? json['FindingPublishingFrequency'] as String
                : null,
        serviceRole: json['ServiceRole'] as String,
        status: json['Status'] as String,
        updatedAt:
            json.containsKey('UpdatedAt') ? json['UpdatedAt'] as String : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

class GetFilterResponse {
  /// The name of the filter.
  final String name;

  /// The description of the filter.
  final String description;

  /// Specifies the action that is to be applied to the findings that match the
  /// filter.
  final String action;

  /// Specifies the position of the filter in the list of current filters. Also
  /// specifies the order in which this filter is applied to the findings.
  final int rank;

  /// Represents the criteria to be used in the filter for querying findings.
  final FindingCriteria findingCriteria;

  /// The tags of the filter resource.
  final Map<String, String> tags;

  GetFilterResponse({
    @required this.name,
    this.description,
    @required this.action,
    this.rank,
    @required this.findingCriteria,
    this.tags,
  });
  static GetFilterResponse fromJson(Map<String, dynamic> json) =>
      GetFilterResponse(
        name: json['Name'] as String,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        action: json['Action'] as String,
        rank: json.containsKey('Rank') ? json['Rank'] as int : null,
        findingCriteria: FindingCriteria.fromJson(json['FindingCriteria']),
        tags: json.containsKey('Tags')
            ? (json['Tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

class GetFindingsResponse {
  /// A list of findings.
  final List<Finding> findings;

  GetFindingsResponse({
    @required this.findings,
  });
  static GetFindingsResponse fromJson(Map<String, dynamic> json) =>
      GetFindingsResponse(
        findings:
            (json['Findings'] as List).map((e) => Finding.fromJson(e)).toList(),
      );
}

class GetFindingsStatisticsResponse {
  /// Finding statistics object.
  final FindingStatistics findingStatistics;

  GetFindingsStatisticsResponse({
    @required this.findingStatistics,
  });
  static GetFindingsStatisticsResponse fromJson(Map<String, dynamic> json) =>
      GetFindingsStatisticsResponse(
        findingStatistics:
            FindingStatistics.fromJson(json['FindingStatistics']),
      );
}

class GetIPSetResponse {
  /// The user friendly name to identify the IPSet. This name is displayed in
  /// all findings that are triggered by activity that involves IP addresses
  /// included in this IPSet.
  final String name;

  /// The format of the file that contains the IPSet.
  final String format;

  /// The URI of the file that contains the IPSet. For example
  /// (https://s3.us-west-2.amazonaws.com/my-bucket/my-object-key)
  final String location;

  /// The status of ipSet file uploaded.
  final String status;

  /// The tags of the IP set resource.
  final Map<String, String> tags;

  GetIPSetResponse({
    @required this.name,
    @required this.format,
    @required this.location,
    @required this.status,
    this.tags,
  });
  static GetIPSetResponse fromJson(Map<String, dynamic> json) =>
      GetIPSetResponse(
        name: json['Name'] as String,
        format: json['Format'] as String,
        location: json['Location'] as String,
        status: json['Status'] as String,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

class GetInvitationsCountResponse {
  /// The number of received invitations.
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
  /// Master account details.
  final Master master;

  GetMasterAccountResponse({
    @required this.master,
  });
  static GetMasterAccountResponse fromJson(Map<String, dynamic> json) =>
      GetMasterAccountResponse(
        master: Master.fromJson(json['Master']),
      );
}

class GetMembersResponse {
  /// A list of members.
  final List<Member> members;

  /// A list of objects containing the unprocessed account and a result string
  /// explaining why it was unprocessed.
  final List<UnprocessedAccount> unprocessedAccounts;

  GetMembersResponse({
    @required this.members,
    @required this.unprocessedAccounts,
  });
  static GetMembersResponse fromJson(Map<String, dynamic> json) =>
      GetMembersResponse(
        members:
            (json['Members'] as List).map((e) => Member.fromJson(e)).toList(),
        unprocessedAccounts: (json['UnprocessedAccounts'] as List)
            .map((e) => UnprocessedAccount.fromJson(e))
            .toList(),
      );
}

class GetThreatIntelSetResponse {
  /// A user-friendly ThreatIntelSet name that is displayed in all finding
  /// generated by activity that involves IP addresses included in this
  /// ThreatIntelSet.
  final String name;

  /// The format of the threatIntelSet.
  final String format;

  /// The URI of the file that contains the ThreatIntelSet. For example
  /// (https://s3.us-west-2.amazonaws.com/my-bucket/my-object-key).
  final String location;

  /// The status of threatIntelSet file uploaded.
  final String status;

  /// The tags of the Threat List resource.
  final Map<String, String> tags;

  GetThreatIntelSetResponse({
    @required this.name,
    @required this.format,
    @required this.location,
    @required this.status,
    this.tags,
  });
  static GetThreatIntelSetResponse fromJson(Map<String, dynamic> json) =>
      GetThreatIntelSetResponse(
        name: json['Name'] as String,
        format: json['Format'] as String,
        location: json['Location'] as String,
        status: json['Status'] as String,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

/// Contains information about the instance profile.
class IamInstanceProfile {
  /// AWS EC2 instance profile ARN.
  final String arn;

  /// AWS EC2 instance profile ID.
  final String id;

  IamInstanceProfile({
    this.arn,
    this.id,
  });
  static IamInstanceProfile fromJson(Map<String, dynamic> json) =>
      IamInstanceProfile(
        arn: json.containsKey('Arn') ? json['Arn'] as String : null,
        id: json.containsKey('Id') ? json['Id'] as String : null,
      );
}

/// Contains information about the details of an instance.
class InstanceDetails {
  /// The availability zone of the EC2 instance.
  final String availabilityZone;

  /// The profile information of the EC2 instance.
  final IamInstanceProfile iamInstanceProfile;

  /// The image description of the EC2 instance.
  final String imageDescription;

  /// The image ID of the EC2 instance.
  final String imageId;

  /// The ID of the EC2 instance.
  final String instanceId;

  /// The state of the EC2 instance.
  final String instanceState;

  /// The type of the EC2 instance.
  final String instanceType;

  /// The launch time of the EC2 instance.
  final String launchTime;

  /// The network interface information of the EC2 instance.
  final List<NetworkInterface> networkInterfaces;

  /// The platform of the EC2 instance.
  final String platform;

  /// The product code of the EC2 instance.
  final List<ProductCode> productCodes;

  /// The tags of the EC2 instance.
  final List<Tag> tags;

  InstanceDetails({
    this.availabilityZone,
    this.iamInstanceProfile,
    this.imageDescription,
    this.imageId,
    this.instanceId,
    this.instanceState,
    this.instanceType,
    this.launchTime,
    this.networkInterfaces,
    this.platform,
    this.productCodes,
    this.tags,
  });
  static InstanceDetails fromJson(Map<String, dynamic> json) => InstanceDetails(
        availabilityZone: json.containsKey('AvailabilityZone')
            ? json['AvailabilityZone'] as String
            : null,
        iamInstanceProfile: json.containsKey('IamInstanceProfile')
            ? IamInstanceProfile.fromJson(json['IamInstanceProfile'])
            : null,
        imageDescription: json.containsKey('ImageDescription')
            ? json['ImageDescription'] as String
            : null,
        imageId: json.containsKey('ImageId') ? json['ImageId'] as String : null,
        instanceId: json.containsKey('InstanceId')
            ? json['InstanceId'] as String
            : null,
        instanceState: json.containsKey('InstanceState')
            ? json['InstanceState'] as String
            : null,
        instanceType: json.containsKey('InstanceType')
            ? json['InstanceType'] as String
            : null,
        launchTime: json.containsKey('LaunchTime')
            ? json['LaunchTime'] as String
            : null,
        networkInterfaces: json.containsKey('NetworkInterfaces')
            ? (json['NetworkInterfaces'] as List)
                .map((e) => NetworkInterface.fromJson(e))
                .toList()
            : null,
        platform:
            json.containsKey('Platform') ? json['Platform'] as String : null,
        productCodes: json.containsKey('ProductCodes')
            ? (json['ProductCodes'] as List)
                .map((e) => ProductCode.fromJson(e))
                .toList()
            : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as List).map((e) => Tag.fromJson(e)).toList()
            : null,
      );
}

/// Contains information about the invitation.
class Invitation {
  /// Inviter account ID
  final String accountId;

  /// This value is used to validate the inviter account to the member account.
  final String invitationId;

  /// The status of the relationship between the inviter and invitee accounts.
  final String relationshipStatus;

  /// Timestamp at which the invitation was sent
  final String invitedAt;

  Invitation({
    this.accountId,
    this.invitationId,
    this.relationshipStatus,
    this.invitedAt,
  });
  static Invitation fromJson(Map<String, dynamic> json) => Invitation(
        accountId:
            json.containsKey('AccountId') ? json['AccountId'] as String : null,
        invitationId: json.containsKey('InvitationId')
            ? json['InvitationId'] as String
            : null,
        relationshipStatus: json.containsKey('RelationshipStatus')
            ? json['RelationshipStatus'] as String
            : null,
        invitedAt:
            json.containsKey('InvitedAt') ? json['InvitedAt'] as String : null,
      );
}

class InviteMembersResponse {
  /// A list of objects containing the unprocessed account and a result string
  /// explaining why it was unprocessed.
  final List<UnprocessedAccount> unprocessedAccounts;

  InviteMembersResponse({
    @required this.unprocessedAccounts,
  });
  static InviteMembersResponse fromJson(Map<String, dynamic> json) =>
      InviteMembersResponse(
        unprocessedAccounts: (json['UnprocessedAccounts'] as List)
            .map((e) => UnprocessedAccount.fromJson(e))
            .toList(),
      );
}

class ListDetectorsResponse {
  /// A list of detector Ids.
  final List<String> detectorIds;

  /// Pagination parameter to be used on the next list operation to retrieve
  /// more items.
  final String nextToken;

  ListDetectorsResponse({
    @required this.detectorIds,
    this.nextToken,
  });
  static ListDetectorsResponse fromJson(Map<String, dynamic> json) =>
      ListDetectorsResponse(
        detectorIds:
            (json['DetectorIds'] as List).map((e) => e as String).toList(),
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListFiltersResponse {
  /// A list of filter names
  final List<String> filterNames;

  /// Pagination parameter to be used on the next list operation to retrieve
  /// more items.
  final String nextToken;

  ListFiltersResponse({
    @required this.filterNames,
    this.nextToken,
  });
  static ListFiltersResponse fromJson(Map<String, dynamic> json) =>
      ListFiltersResponse(
        filterNames:
            (json['FilterNames'] as List).map((e) => e as String).toList(),
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListFindingsResponse {
  /// The IDs of the findings you are listing.
  final List<String> findingIds;

  /// Pagination parameter to be used on the next list operation to retrieve
  /// more items.
  final String nextToken;

  ListFindingsResponse({
    @required this.findingIds,
    this.nextToken,
  });
  static ListFindingsResponse fromJson(Map<String, dynamic> json) =>
      ListFindingsResponse(
        findingIds:
            (json['FindingIds'] as List).map((e) => e as String).toList(),
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListIPSetsResponse {
  /// The IDs of the IPSet resources.
  final List<String> ipSetIds;

  /// Pagination parameter to be used on the next list operation to retrieve
  /// more items.
  final String nextToken;

  ListIPSetsResponse({
    @required this.ipSetIds,
    this.nextToken,
  });
  static ListIPSetsResponse fromJson(Map<String, dynamic> json) =>
      ListIPSetsResponse(
        ipSetIds: (json['IpSetIds'] as List).map((e) => e as String).toList(),
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListInvitationsResponse {
  /// A list of invitation descriptions.
  final List<Invitation> invitations;

  /// Pagination parameter to be used on the next list operation to retrieve
  /// more items.
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
  /// A list of members.
  final List<Member> members;

  /// Pagination parameter to be used on the next list operation to retrieve
  /// more items.
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
  /// The tags associated with the resource.
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

class ListThreatIntelSetsResponse {
  /// The IDs of the ThreatIntelSet resources.
  final List<String> threatIntelSetIds;

  /// Pagination parameter to be used on the next list operation to retrieve
  /// more items.
  final String nextToken;

  ListThreatIntelSetsResponse({
    @required this.threatIntelSetIds,
    this.nextToken,
  });
  static ListThreatIntelSetsResponse fromJson(Map<String, dynamic> json) =>
      ListThreatIntelSetsResponse(
        threatIntelSetIds: (json['ThreatIntelSetIds'] as List)
            .map((e) => e as String)
            .toList(),
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// Contains information about the port for the local connection.
class LocalPortDetails {
  /// Port number of the local connection.
  final int port;

  /// Port name of the local connection.
  final String portName;

  LocalPortDetails({
    this.port,
    this.portName,
  });
  static LocalPortDetails fromJson(Map<String, dynamic> json) =>
      LocalPortDetails(
        port: json.containsKey('Port') ? json['Port'] as int : null,
        portName:
            json.containsKey('PortName') ? json['PortName'] as String : null,
      );
}

/// Contains information about the Master account and invitation.
class Master {
  /// The ID of the account used as the Master account.
  final String accountId;

  /// This value is used to validate the master account to the member account.
  final String invitationId;

  /// The status of the relationship between the master and member accounts.
  final String relationshipStatus;

  /// Timestamp at which the invitation was sent.
  final String invitedAt;

  Master({
    this.accountId,
    this.invitationId,
    this.relationshipStatus,
    this.invitedAt,
  });
  static Master fromJson(Map<String, dynamic> json) => Master(
        accountId:
            json.containsKey('AccountId') ? json['AccountId'] as String : null,
        invitationId: json.containsKey('InvitationId')
            ? json['InvitationId'] as String
            : null,
        relationshipStatus: json.containsKey('RelationshipStatus')
            ? json['RelationshipStatus'] as String
            : null,
        invitedAt:
            json.containsKey('InvitedAt') ? json['InvitedAt'] as String : null,
      );
}

/// Continas information about the member account
class Member {
  /// Member account ID.
  final String accountId;

  /// Member account's detector ID.
  final String detectorId;

  /// Master account ID.
  final String masterId;

  /// Member account's email address.
  final String email;

  /// The status of the relationship between the member and the master.
  final String relationshipStatus;

  /// Timestamp at which the invitation was sent
  final String invitedAt;

  /// Member last updated timestamp.
  final String updatedAt;

  Member({
    @required this.accountId,
    this.detectorId,
    @required this.masterId,
    @required this.email,
    @required this.relationshipStatus,
    this.invitedAt,
    @required this.updatedAt,
  });
  static Member fromJson(Map<String, dynamic> json) => Member(
        accountId: json['AccountId'] as String,
        detectorId: json.containsKey('DetectorId')
            ? json['DetectorId'] as String
            : null,
        masterId: json['MasterId'] as String,
        email: json['Email'] as String,
        relationshipStatus: json['RelationshipStatus'] as String,
        invitedAt:
            json.containsKey('InvitedAt') ? json['InvitedAt'] as String : null,
        updatedAt: json['UpdatedAt'] as String,
      );
}

/// Contains information about the network connection.
class NetworkConnectionAction {
  /// Network connection blocked information.
  final bool blocked;

  /// Network connection direction.
  final String connectionDirection;

  /// Local port information of the connection.
  final LocalPortDetails localPortDetails;

  /// Network connection protocol.
  final String protocol;

  /// Remote IP information of the connection.
  final RemoteIpDetails remoteIpDetails;

  /// Remote port information of the connection.
  final RemotePortDetails remotePortDetails;

  NetworkConnectionAction({
    this.blocked,
    this.connectionDirection,
    this.localPortDetails,
    this.protocol,
    this.remoteIpDetails,
    this.remotePortDetails,
  });
  static NetworkConnectionAction fromJson(Map<String, dynamic> json) =>
      NetworkConnectionAction(
        blocked: json.containsKey('Blocked') ? json['Blocked'] as bool : null,
        connectionDirection: json.containsKey('ConnectionDirection')
            ? json['ConnectionDirection'] as String
            : null,
        localPortDetails: json.containsKey('LocalPortDetails')
            ? LocalPortDetails.fromJson(json['LocalPortDetails'])
            : null,
        protocol:
            json.containsKey('Protocol') ? json['Protocol'] as String : null,
        remoteIpDetails: json.containsKey('RemoteIpDetails')
            ? RemoteIpDetails.fromJson(json['RemoteIpDetails'])
            : null,
        remotePortDetails: json.containsKey('RemotePortDetails')
            ? RemotePortDetails.fromJson(json['RemotePortDetails'])
            : null,
      );
}

/// Contains information about the network interface.
class NetworkInterface {
  /// A list of EC2 instance IPv6 address information.
  final List<String> ipv6Addresses;

  /// The ID of the network interface
  final String networkInterfaceId;

  /// Private DNS name of the EC2 instance.
  final String privateDnsName;

  /// Private IP address of the EC2 instance.
  final String privateIpAddress;

  /// Other private IP address information of the EC2 instance.
  final List<PrivateIpAddressDetails> privateIpAddresses;

  /// Public DNS name of the EC2 instance.
  final String publicDnsName;

  /// Public IP address of the EC2 instance.
  final String publicIp;

  /// Security groups associated with the EC2 instance.
  final List<SecurityGroup> securityGroups;

  /// The subnet ID of the EC2 instance.
  final String subnetId;

  /// The VPC ID of the EC2 instance.
  final String vpcId;

  NetworkInterface({
    this.ipv6Addresses,
    this.networkInterfaceId,
    this.privateDnsName,
    this.privateIpAddress,
    this.privateIpAddresses,
    this.publicDnsName,
    this.publicIp,
    this.securityGroups,
    this.subnetId,
    this.vpcId,
  });
  static NetworkInterface fromJson(Map<String, dynamic> json) =>
      NetworkInterface(
        ipv6Addresses: json.containsKey('Ipv6Addresses')
            ? (json['Ipv6Addresses'] as List).map((e) => e as String).toList()
            : null,
        networkInterfaceId: json.containsKey('NetworkInterfaceId')
            ? json['NetworkInterfaceId'] as String
            : null,
        privateDnsName: json.containsKey('PrivateDnsName')
            ? json['PrivateDnsName'] as String
            : null,
        privateIpAddress: json.containsKey('PrivateIpAddress')
            ? json['PrivateIpAddress'] as String
            : null,
        privateIpAddresses: json.containsKey('PrivateIpAddresses')
            ? (json['PrivateIpAddresses'] as List)
                .map((e) => PrivateIpAddressDetails.fromJson(e))
                .toList()
            : null,
        publicDnsName: json.containsKey('PublicDnsName')
            ? json['PublicDnsName'] as String
            : null,
        publicIp:
            json.containsKey('PublicIp') ? json['PublicIp'] as String : null,
        securityGroups: json.containsKey('SecurityGroups')
            ? (json['SecurityGroups'] as List)
                .map((e) => SecurityGroup.fromJson(e))
                .toList()
            : null,
        subnetId:
            json.containsKey('SubnetId') ? json['SubnetId'] as String : null,
        vpcId: json.containsKey('VpcId') ? json['VpcId'] as String : null,
      );
}

/// Continas information about the organization.
class Organization {
  /// Autonomous system number of the internet provider of the remote IP
  /// address.
  final String asn;

  /// Organization that registered this ASN.
  final String asnOrg;

  /// ISP information for the internet provider.
  final String isp;

  /// Name of the internet provider.
  final String org;

  Organization({
    this.asn,
    this.asnOrg,
    this.isp,
    this.org,
  });
  static Organization fromJson(Map<String, dynamic> json) => Organization(
        asn: json.containsKey('Asn') ? json['Asn'] as String : null,
        asnOrg: json.containsKey('AsnOrg') ? json['AsnOrg'] as String : null,
        isp: json.containsKey('Isp') ? json['Isp'] as String : null,
        org: json.containsKey('Org') ? json['Org'] as String : null,
      );
}

/// Contains information about the port probe.
class PortProbeAction {
  /// Port probe blocked information.
  final bool blocked;

  /// A list of port probe details objects.
  final List<PortProbeDetail> portProbeDetails;

  PortProbeAction({
    this.blocked,
    this.portProbeDetails,
  });
  static PortProbeAction fromJson(Map<String, dynamic> json) => PortProbeAction(
        blocked: json.containsKey('Blocked') ? json['Blocked'] as bool : null,
        portProbeDetails: json.containsKey('PortProbeDetails')
            ? (json['PortProbeDetails'] as List)
                .map((e) => PortProbeDetail.fromJson(e))
                .toList()
            : null,
      );
}

/// Contains information about the port probe details.
class PortProbeDetail {
  /// Local port information of the connection.
  final LocalPortDetails localPortDetails;

  /// Remote IP information of the connection.
  final RemoteIpDetails remoteIpDetails;

  PortProbeDetail({
    this.localPortDetails,
    this.remoteIpDetails,
  });
  static PortProbeDetail fromJson(Map<String, dynamic> json) => PortProbeDetail(
        localPortDetails: json.containsKey('LocalPortDetails')
            ? LocalPortDetails.fromJson(json['LocalPortDetails'])
            : null,
        remoteIpDetails: json.containsKey('RemoteIpDetails')
            ? RemoteIpDetails.fromJson(json['RemoteIpDetails'])
            : null,
      );
}

/// Contains information about the private IP address.
class PrivateIpAddressDetails {
  /// Private DNS name of the EC2 instance.
  final String privateDnsName;

  /// Private IP address of the EC2 instance.
  final String privateIpAddress;

  PrivateIpAddressDetails({
    this.privateDnsName,
    this.privateIpAddress,
  });
  static PrivateIpAddressDetails fromJson(Map<String, dynamic> json) =>
      PrivateIpAddressDetails(
        privateDnsName: json.containsKey('PrivateDnsName')
            ? json['PrivateDnsName'] as String
            : null,
        privateIpAddress: json.containsKey('PrivateIpAddress')
            ? json['PrivateIpAddress'] as String
            : null,
      );
}

/// Contains information about the product code.
class ProductCode {
  /// Product code information.
  final String code;

  /// Product code type.
  final String productType;

  ProductCode({
    this.code,
    this.productType,
  });
  static ProductCode fromJson(Map<String, dynamic> json) => ProductCode(
        code: json.containsKey('Code') ? json['Code'] as String : null,
        productType: json.containsKey('ProductType')
            ? json['ProductType'] as String
            : null,
      );
}

/// Continas information about the remote IP address.
class RemoteIpDetails {
  /// City information of the remote IP address.
  final City city;

  /// Country code of the remote IP address.
  final Country country;

  /// Location information of the remote IP address.
  final GeoLocation geoLocation;

  /// IPV4 remote address of the connection.
  final String ipAddressV4;

  /// ISP Organization information of the remote IP address.
  final Organization organization;

  RemoteIpDetails({
    this.city,
    this.country,
    this.geoLocation,
    this.ipAddressV4,
    this.organization,
  });
  static RemoteIpDetails fromJson(Map<String, dynamic> json) => RemoteIpDetails(
        city: json.containsKey('City') ? City.fromJson(json['City']) : null,
        country: json.containsKey('Country')
            ? Country.fromJson(json['Country'])
            : null,
        geoLocation: json.containsKey('GeoLocation')
            ? GeoLocation.fromJson(json['GeoLocation'])
            : null,
        ipAddressV4: json.containsKey('IpAddressV4')
            ? json['IpAddressV4'] as String
            : null,
        organization: json.containsKey('Organization')
            ? Organization.fromJson(json['Organization'])
            : null,
      );
}

/// Contains information about the remote port.
class RemotePortDetails {
  /// Port number of the remote connection.
  final int port;

  /// Port name of the remote connection.
  final String portName;

  RemotePortDetails({
    this.port,
    this.portName,
  });
  static RemotePortDetails fromJson(Map<String, dynamic> json) =>
      RemotePortDetails(
        port: json.containsKey('Port') ? json['Port'] as int : null,
        portName:
            json.containsKey('PortName') ? json['PortName'] as String : null,
      );
}

/// Contains information about the resource.
class Resource {
  /// The IAM access key details (IAM user information) of a user that engaged
  /// in the activity that prompted GuardDuty to generate a finding.
  final AccessKeyDetails accessKeyDetails;

  /// The information about the EC2 instance associated with the activity that
  /// prompted GuardDuty to generate a finding.
  final InstanceDetails instanceDetails;

  /// The type of the AWS resource.
  final String resourceType;

  Resource({
    this.accessKeyDetails,
    this.instanceDetails,
    this.resourceType,
  });
  static Resource fromJson(Map<String, dynamic> json) => Resource(
        accessKeyDetails: json.containsKey('AccessKeyDetails')
            ? AccessKeyDetails.fromJson(json['AccessKeyDetails'])
            : null,
        instanceDetails: json.containsKey('InstanceDetails')
            ? InstanceDetails.fromJson(json['InstanceDetails'])
            : null,
        resourceType: json.containsKey('ResourceType')
            ? json['ResourceType'] as String
            : null,
      );
}

/// Contains information about the security group.
class SecurityGroup {
  /// EC2 instance's security group ID.
  final String groupId;

  /// EC2 instance's security group name.
  final String groupName;

  SecurityGroup({
    this.groupId,
    this.groupName,
  });
  static SecurityGroup fromJson(Map<String, dynamic> json) => SecurityGroup(
        groupId: json.containsKey('GroupId') ? json['GroupId'] as String : null,
        groupName:
            json.containsKey('GroupName') ? json['GroupName'] as String : null,
      );
}

/// Contains information about the service.
class Service {
  /// Information about the activity described in a finding.
  final Action action;

  /// An evidence object associated with the service.
  final Evidence evidence;

  /// Indicates whether this finding is archived.
  final bool archived;

  /// Total count of the occurrences of this finding type.
  final int count;

  /// Detector ID for the GuardDuty service.
  final String detectorId;

  /// First seen timestamp of the activity that prompted GuardDuty to generate
  /// this finding.
  final String eventFirstSeen;

  /// Last seen timestamp of the activity that prompted GuardDuty to generate
  /// this finding.
  final String eventLastSeen;

  /// Resource role information for this finding.
  final String resourceRole;

  /// The name of the AWS service (GuardDuty) that generated a finding.
  final String serviceName;

  /// Feedback left about the finding.
  final String userFeedback;

  Service({
    this.action,
    this.evidence,
    this.archived,
    this.count,
    this.detectorId,
    this.eventFirstSeen,
    this.eventLastSeen,
    this.resourceRole,
    this.serviceName,
    this.userFeedback,
  });
  static Service fromJson(Map<String, dynamic> json) => Service(
        action:
            json.containsKey('Action') ? Action.fromJson(json['Action']) : null,
        evidence: json.containsKey('Evidence')
            ? Evidence.fromJson(json['Evidence'])
            : null,
        archived:
            json.containsKey('Archived') ? json['Archived'] as bool : null,
        count: json.containsKey('Count') ? json['Count'] as int : null,
        detectorId: json.containsKey('DetectorId')
            ? json['DetectorId'] as String
            : null,
        eventFirstSeen: json.containsKey('EventFirstSeen')
            ? json['EventFirstSeen'] as String
            : null,
        eventLastSeen: json.containsKey('EventLastSeen')
            ? json['EventLastSeen'] as String
            : null,
        resourceRole: json.containsKey('ResourceRole')
            ? json['ResourceRole'] as String
            : null,
        serviceName: json.containsKey('ServiceName')
            ? json['ServiceName'] as String
            : null,
        userFeedback: json.containsKey('UserFeedback')
            ? json['UserFeedback'] as String
            : null,
      );
}

/// Contains information about the criteria for sorting.
class SortCriteria {
  /// Represents the finding attribute (for example, accountId) by which to sort
  /// findings.
  final String attributeName;

  /// Order by which the sorted findings are to be displayed.
  final String orderBy;

  SortCriteria({
    this.attributeName,
    this.orderBy,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class StartMonitoringMembersResponse {
  /// A list of objects containing the unprocessed account and a result string
  /// explaining why it was unprocessed.
  final List<UnprocessedAccount> unprocessedAccounts;

  StartMonitoringMembersResponse({
    @required this.unprocessedAccounts,
  });
  static StartMonitoringMembersResponse fromJson(Map<String, dynamic> json) =>
      StartMonitoringMembersResponse(
        unprocessedAccounts: (json['UnprocessedAccounts'] as List)
            .map((e) => UnprocessedAccount.fromJson(e))
            .toList(),
      );
}

class StopMonitoringMembersResponse {
  /// A list of objects containing the unprocessed account and a result string
  /// explaining why it was unprocessed.
  final List<UnprocessedAccount> unprocessedAccounts;

  StopMonitoringMembersResponse({
    @required this.unprocessedAccounts,
  });
  static StopMonitoringMembersResponse fromJson(Map<String, dynamic> json) =>
      StopMonitoringMembersResponse(
        unprocessedAccounts: (json['UnprocessedAccounts'] as List)
            .map((e) => UnprocessedAccount.fromJson(e))
            .toList(),
      );
}

/// Contains information about the tag associated with the resource.
class Tag {
  /// EC2 instance tag key.
  final String key;

  /// EC2 instance tag value.
  final String value;

  Tag({
    this.key,
    this.value,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag(
        key: json.containsKey('Key') ? json['Key'] as String : null,
        value: json.containsKey('Value') ? json['Value'] as String : null,
      );
}

class TagResourceResponse {
  TagResourceResponse();
  static TagResourceResponse fromJson(Map<String, dynamic> json) =>
      TagResourceResponse();
}

/// An instance of a threat intelligence detail that constitutes evidence for
/// the finding.
class ThreatIntelligenceDetail {
  /// The name of the threat intelligence list that triggered the finding.
  final String threatListName;

  /// A list of names of the threats in the threat intelligence list that
  /// triggered the finding.
  final List<String> threatNames;

  ThreatIntelligenceDetail({
    this.threatListName,
    this.threatNames,
  });
  static ThreatIntelligenceDetail fromJson(Map<String, dynamic> json) =>
      ThreatIntelligenceDetail(
        threatListName: json.containsKey('ThreatListName')
            ? json['ThreatListName'] as String
            : null,
        threatNames: json.containsKey('ThreatNames')
            ? (json['ThreatNames'] as List).map((e) => e as String).toList()
            : null,
      );
}

class UnarchiveFindingsResponse {
  UnarchiveFindingsResponse();
  static UnarchiveFindingsResponse fromJson(Map<String, dynamic> json) =>
      UnarchiveFindingsResponse();
}

/// Contains information about the accounts that were not processed.
class UnprocessedAccount {
  /// AWS Account ID.
  final String accountId;

  /// A reason why the account hasn't been processed.
  final String result;

  UnprocessedAccount({
    @required this.accountId,
    @required this.result,
  });
  static UnprocessedAccount fromJson(Map<String, dynamic> json) =>
      UnprocessedAccount(
        accountId: json['AccountId'] as String,
        result: json['Result'] as String,
      );
}

class UntagResourceResponse {
  UntagResourceResponse();
  static UntagResourceResponse fromJson(Map<String, dynamic> json) =>
      UntagResourceResponse();
}

class UpdateDetectorResponse {
  UpdateDetectorResponse();
  static UpdateDetectorResponse fromJson(Map<String, dynamic> json) =>
      UpdateDetectorResponse();
}

class UpdateFilterResponse {
  /// The name of the filter.
  final String name;

  UpdateFilterResponse({
    @required this.name,
  });
  static UpdateFilterResponse fromJson(Map<String, dynamic> json) =>
      UpdateFilterResponse(
        name: json['Name'] as String,
      );
}

class UpdateFindingsFeedbackResponse {
  UpdateFindingsFeedbackResponse();
  static UpdateFindingsFeedbackResponse fromJson(Map<String, dynamic> json) =>
      UpdateFindingsFeedbackResponse();
}

class UpdateIPSetResponse {
  UpdateIPSetResponse();
  static UpdateIPSetResponse fromJson(Map<String, dynamic> json) =>
      UpdateIPSetResponse();
}

class UpdateThreatIntelSetResponse {
  UpdateThreatIntelSetResponse();
  static UpdateThreatIntelSetResponse fromJson(Map<String, dynamic> json) =>
      UpdateThreatIntelSetResponse();
}
