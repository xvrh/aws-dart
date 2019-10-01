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
/// more information, see  [Amazon GuardDuty User
/// Guide](https://docs.aws.amazon.com/guardduty/latest/ug/what-is-guardduty.html).
class GuardDutyApi {
  /// Accepts the invitation to be monitored by a master GuardDuty account.
  Future<void> acceptInvitation(
      {@required String detectorId,
      @required String masterId,
      @required String invitationId}) async {}

  /// Archives GuardDuty findings specified by the list of finding IDs.
  ///
  ///
  ///
  /// Only the master account can archive findings. Member accounts do not have
  /// permission to archive findings from their accounts.
  Future<void> archiveFindings(
      {@required String detectorId, @required List<String> findingIds}) async {}

  /// Creates a single Amazon GuardDuty detector. A detector is a resource that
  /// represents the GuardDuty service. To start using GuardDuty, you must
  /// create a detector in each region that you enable the service. You can have
  /// only one detector per account per region.
  Future<void> createDetector(bool enable,
      {String clientToken,
      String findingPublishingFrequency,
      Map<String, String> tags}) async {}

  /// Creates a filter using the specified finding criteria.
  Future<void> createFilter(
      {@required String detectorId,
      @required String name,
      String description,
      String action,
      int rank,
      @required FindingCriteria findingCriteria,
      String clientToken,
      Map<String, String> tags}) async {}

  /// Creates a new IPSet - a list of trusted IP addresses that have been
  /// whitelisted for secure communication with AWS infrastructure and
  /// applications.
  Future<void> createIPSet(
      {@required String detectorId,
      @required String name,
      @required String format,
      @required String location,
      @required bool activate,
      String clientToken,
      Map<String, String> tags}) async {}

  /// Creates member accounts of the current AWS account by specifying a list of
  /// AWS account IDs. The current AWS account can then invite these members to
  /// manage GuardDuty in their accounts.
  Future<void> createMembers(
      {@required String detectorId,
      @required List<AccountDetail> accountDetails}) async {}

  /// Generates example findings of types specified by the list of finding
  /// types. If 'NULL' is specified for findingTypes, the API generates example
  /// findings of all supported finding types.
  Future<void> createSampleFindings(String detectorId,
      {List<String> findingTypes}) async {}

  /// Create a new ThreatIntelSet. ThreatIntelSets consist of known malicious IP
  /// addresses. GuardDuty generates findings based on ThreatIntelSets.
  Future<void> createThreatIntelSet(
      {@required String detectorId,
      @required String name,
      @required String format,
      @required String location,
      @required bool activate,
      String clientToken,
      Map<String, String> tags}) async {}

  /// Declines invitations sent to the current member account by AWS account
  /// specified by their account IDs.
  Future<void> declineInvitations(List<String> accountIds) async {}

  /// Deletes a Amazon GuardDuty detector specified by the detector ID.
  Future<void> deleteDetector(String detectorId) async {}

  /// Deletes the filter specified by the filter name.
  Future<void> deleteFilter(
      {@required String detectorId, @required String filterName}) async {}

  /// Deletes the IPSet specified by the IPSet ID.
  Future<void> deleteIPSet(
      {@required String detectorId, @required String ipSetId}) async {}

  /// Deletes invitations sent to the current member account by AWS accounts
  /// specified by their account IDs.
  Future<void> deleteInvitations(List<String> accountIds) async {}

  /// Deletes GuardDuty member accounts (to the current GuardDuty master
  /// account) specified by the account IDs.
  Future<void> deleteMembers(
      {@required String detectorId, @required List<String> accountIds}) async {}

  /// Deletes ThreatIntelSet specified by the ThreatIntelSet ID.
  Future<void> deleteThreatIntelSet(
      {@required String detectorId, @required String threatIntelSetId}) async {}

  /// Disassociates the current GuardDuty member account from its master
  /// account.
  Future<void> disassociateFromMasterAccount(String detectorId) async {}

  /// Disassociates GuardDuty member accounts (to the current GuardDuty master
  /// account) specified by the account IDs.
  Future<void> disassociateMembers(
      {@required String detectorId, @required List<String> accountIds}) async {}

  /// Retrieves an Amazon GuardDuty detector specified by the detectorId.
  Future<void> getDetector(String detectorId) async {}

  /// Returns the details of the filter specified by the filter name.
  Future<void> getFilter(
      {@required String detectorId, @required String filterName}) async {}

  /// Describes Amazon GuardDuty findings specified by finding IDs.
  Future<void> getFindings(
      {@required String detectorId,
      @required List<String> findingIds,
      SortCriteria sortCriteria}) async {}

  /// Lists Amazon GuardDuty findings' statistics for the specified detector ID.
  Future<void> getFindingsStatistics(
      {@required String detectorId,
      @required List<String> findingStatisticTypes,
      FindingCriteria findingCriteria}) async {}

  /// Retrieves the IPSet specified by the IPSet ID.
  Future<void> getIPSet(
      {@required String detectorId, @required String ipSetId}) async {}

  /// Returns the count of all GuardDuty membership invitations that were sent
  /// to the current member account except the currently accepted invitation.
  Future<void> getInvitationsCount() async {}

  /// Provides the details for the GuardDuty master account associated with the
  /// current GuardDuty member account.
  Future<void> getMasterAccount(String detectorId) async {}

  /// Retrieves GuardDuty member accounts (to the current GuardDuty master
  /// account) specified by the account IDs.
  Future<void> getMembers(
      {@required String detectorId, @required List<String> accountIds}) async {}

  /// Retrieves the ThreatIntelSet that is specified by the ThreatIntelSet ID.
  Future<void> getThreatIntelSet(
      {@required String detectorId, @required String threatIntelSetId}) async {}

  /// Invites other AWS accounts (created as members of the current AWS account
  /// by CreateMembers) to enable GuardDuty and allow the current AWS account to
  /// view and manage these accounts' GuardDuty findings on their behalf as the
  /// master account.
  Future<void> inviteMembers(
      {@required String detectorId,
      @required List<String> accountIds,
      bool disableEmailNotification,
      String message}) async {}

  /// Lists detectorIds of all the existing Amazon GuardDuty detector resources.
  Future<void> listDetectors({int maxResults, String nextToken}) async {}

  /// Returns a paginated list of the current filters.
  Future<void> listFilters(String detectorId,
      {int maxResults, String nextToken}) async {}

  /// Lists Amazon GuardDuty findings for the specified detector ID.
  Future<void> listFindings(String detectorId,
      {FindingCriteria findingCriteria,
      SortCriteria sortCriteria,
      int maxResults,
      String nextToken}) async {}

  /// Lists the IPSets of the GuardDuty service specified by the detector ID.
  Future<void> listIPSets(String detectorId,
      {int maxResults, String nextToken}) async {}

  /// Lists all GuardDuty membership invitations that were sent to the current
  /// AWS account.
  Future<void> listInvitations({int maxResults, String nextToken}) async {}

  /// Lists details about all member accounts for the current GuardDuty master
  /// account.
  Future<void> listMembers(String detectorId,
      {int maxResults, String nextToken, String onlyAssociated}) async {}

  /// Lists tags for a resource. Tagging is currently supported for detectors,
  /// finding filters, IP sets, and Threat Intel sets, with a limit of 50 tags
  /// per resource. When invoked, this operation returns all assigned tags for a
  /// given resource..
  Future<void> listTagsForResource(String resourceArn) async {}

  /// Lists the ThreatIntelSets of the GuardDuty service specified by the
  /// detector ID.
  Future<void> listThreatIntelSets(String detectorId,
      {int maxResults, String nextToken}) async {}

  /// Re-enables GuardDuty to monitor findings of the member accounts specified
  /// by the account IDs. A master GuardDuty account can run this command after
  /// disabling GuardDuty from monitoring these members' findings by running
  /// StopMonitoringMembers.
  Future<void> startMonitoringMembers(
      {@required String detectorId, @required List<String> accountIds}) async {}

  /// Disables GuardDuty from monitoring findings of the member accounts
  /// specified by the account IDs. After running this command, a master
  /// GuardDuty account can run StartMonitoringMembers to re-enable GuardDuty to
  /// monitor these members’ findings.
  Future<void> stopMonitoringMembers(
      {@required String detectorId, @required List<String> accountIds}) async {}

  /// Adds tags to a resource.
  Future<void> tagResource(
      {@required String resourceArn,
      @required Map<String, String> tags}) async {}

  /// Unarchives Amazon GuardDuty findings specified by the list of finding IDs.
  Future<void> unarchiveFindings(
      {@required String detectorId, @required List<String> findingIds}) async {}

  /// Removes tags from a resource.
  Future<void> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {}

  /// Updates an Amazon GuardDuty detector specified by the detectorId.
  Future<void> updateDetector(String detectorId,
      {bool enable, String findingPublishingFrequency}) async {}

  /// Updates the filter specified by the filter name.
  Future<void> updateFilter(
      {@required String detectorId,
      @required String filterName,
      String description,
      String action,
      int rank,
      FindingCriteria findingCriteria}) async {}

  /// Marks specified Amazon GuardDuty findings as useful or not useful.
  Future<void> updateFindingsFeedback(
      {@required String detectorId,
      @required List<String> findingIds,
      @required String feedback,
      String comments}) async {}

  /// Updates the IPSet specified by the IPSet ID.
  Future<void> updateIPSet(
      {@required String detectorId,
      @required String ipSetId,
      String name,
      String location,
      bool activate}) async {}

  /// Updates the ThreatIntelSet specified by ThreatIntelSet ID.
  Future<void> updateThreatIntelSet(
      {@required String detectorId,
      @required String threatIntelSetId,
      String name,
      String location,
      bool activate}) async {}
}

class AcceptInvitationResponse {}

class AccessKeyDetails {}

class AccountDetail {}

class Action {}

class ArchiveFindingsResponse {}

class AwsApiCallAction {}

class City {}

class Condition {}

class Country {}

class CreateDetectorResponse {}

class CreateFilterResponse {}

class CreateIPSetResponse {}

class CreateMembersResponse {}

class CreateSampleFindingsResponse {}

class CreateThreatIntelSetResponse {}

class DeclineInvitationsResponse {}

class DeleteDetectorResponse {}

class DeleteFilterResponse {}

class DeleteIPSetResponse {}

class DeleteInvitationsResponse {}

class DeleteMembersResponse {}

class DeleteThreatIntelSetResponse {}

class DisassociateFromMasterAccountResponse {}

class DisassociateMembersResponse {}

class DnsRequestAction {}

class DomainDetails {}

class Evidence {}

class Finding {}

class FindingCriteria {}

class FindingStatistics {}

class GeoLocation {}

class GetDetectorResponse {}

class GetFilterResponse {}

class GetFindingsResponse {}

class GetFindingsStatisticsResponse {}

class GetIPSetResponse {}

class GetInvitationsCountResponse {}

class GetMasterAccountResponse {}

class GetMembersResponse {}

class GetThreatIntelSetResponse {}

class IamInstanceProfile {}

class InstanceDetails {}

class Invitation {}

class InviteMembersResponse {}

class ListDetectorsResponse {}

class ListFiltersResponse {}

class ListFindingsResponse {}

class ListIPSetsResponse {}

class ListInvitationsResponse {}

class ListMembersResponse {}

class ListTagsForResourceResponse {}

class ListThreatIntelSetsResponse {}

class LocalPortDetails {}

class Master {}

class Member {}

class NetworkConnectionAction {}

class NetworkInterface {}

class Organization {}

class PortProbeAction {}

class PortProbeDetail {}

class PrivateIpAddressDetails {}

class ProductCode {}

class RemoteIpDetails {}

class RemotePortDetails {}

class Resource {}

class SecurityGroup {}

class Service {}

class SortCriteria {}

class StartMonitoringMembersResponse {}

class StopMonitoringMembersResponse {}

class Tag {}

class TagResourceResponse {}

class ThreatIntelligenceDetail {}

class UnarchiveFindingsResponse {}

class UnprocessedAccount {}

class UntagResourceResponse {}

class UpdateDetectorResponse {}

class UpdateFilterResponse {}

class UpdateFindingsFeedbackResponse {}

class UpdateIPSetResponse {}

class UpdateThreatIntelSetResponse {}
