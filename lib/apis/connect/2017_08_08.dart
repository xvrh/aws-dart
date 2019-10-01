import 'package:meta/meta.dart';

/// The Amazon Connect API Reference provides descriptions, syntax, and usage
/// examples for each of the Amazon Connect actions, data types, parameters, and
/// errors. Amazon Connect is a cloud-based contact center solution that makes
/// it easy to set up and manage a customer contact center and provide reliable
/// customer engagement at any scale.
///
/// Throttling limits for the Amazon Connect API operations:
///
/// For the `GetMetricData` and `GetCurrentMetricData` operations, a RateLimit
/// of 5 per second, and a BurstLimit of 8 per second.
///
/// For all other operations, a RateLimit of 2 per second, and a BurstLimit of 5
/// per second.
///
/// You can request an increase to the throttling limits by submitting a [Amazon
/// Connect service limits increase
/// form](https://console.aws.amazon.com/support/home#/case/create?issueType=service-limit-increase).
/// You must be signed in to your AWS account to access the form.
class ConnectApi {
  /// Creates a new user account in your Amazon Connect instance.
  Future<void> createUser(
      {@required String username,
      String password,
      UserIdentityInfo identityInfo,
      @required UserPhoneConfig phoneConfig,
      String directoryUserId,
      @required List<String> securityProfileIds,
      @required String routingProfileId,
      String hierarchyGroupId,
      @required String instanceId}) async {}

  /// Deletes a user account from Amazon Connect.
  Future<void> deleteUser(
      {@required String instanceId, @required String userId}) async {}

  /// Returns a `User` object that contains information about the user account
  /// specified by the `UserId`.
  Future<void> describeUser(
      {@required String userId, @required String instanceId}) async {}

  /// Returns a `HierarchyGroup` object that includes information about a
  /// hierarchy group in your instance.
  Future<void> describeUserHierarchyGroup(
      {@required String hierarchyGroupId, @required String instanceId}) async {}

  /// Returns a `HiearchyGroupStructure` object, which contains data about the
  /// levels in the agent hierarchy.
  Future<void> describeUserHierarchyStructure(String instanceId) async {}

  /// Retrieves the contact attributes associated with a contact.
  Future<void> getContactAttributes(
      {@required String instanceId, @required String initialContactId}) async {}

  /// The `GetCurrentMetricData` operation retrieves current metric data from
  /// your Amazon Connect instance.
  ///
  /// If you are using an IAM account, it must have permission to the
  /// `connect:GetCurrentMetricData` action.
  Future<void> getCurrentMetricData(
      {@required String instanceId,
      @required Filters filters,
      List<String> groupings,
      @required List<CurrentMetric> currentMetrics,
      String nextToken,
      int maxResults}) async {}

  /// Retrieves a token for federation.
  Future<void> getFederationToken(String instanceId) async {}

  /// The `GetMetricData` operation retrieves historical metrics data from your
  /// Amazon Connect instance.
  ///
  /// If you are using an IAM account, it must have permission to the
  /// `connect:GetMetricData` action.
  Future<void> getMetricData(
      {@required String instanceId,
      @required DateTime startTime,
      @required DateTime endTime,
      @required Filters filters,
      List<String> groupings,
      @required List<HistoricalMetric> historicalMetrics,
      String nextToken,
      int maxResults}) async {}

  /// Returns an array of `RoutingProfileSummary` objects that includes
  /// information about the routing profiles in your instance.
  Future<void> listRoutingProfiles(String instanceId,
      {String nextToken, int maxResults}) async {}

  /// Returns an array of SecurityProfileSummary objects that contain
  /// information about the security profiles in your instance, including the
  /// ARN, Id, and Name of the security profile.
  Future<void> listSecurityProfiles(String instanceId,
      {String nextToken, int maxResults}) async {}

  /// Returns a `UserHierarchyGroupSummaryList`, which is an array of
  /// `HierarchyGroupSummary` objects that contain information about the
  /// hierarchy groups in your instance.
  Future<void> listUserHierarchyGroups(String instanceId,
      {String nextToken, int maxResults}) async {}

  /// Returns a `UserSummaryList`, which is an array of `UserSummary` objects.
  Future<void> listUsers(String instanceId,
      {String nextToken, int maxResults}) async {}

  /// The `StartOutboundVoiceContact` operation initiates a contact flow to
  /// place an outbound call to a customer.
  ///
  /// If you are using an IAM account, it must have permission to the
  /// `connect:StartOutboundVoiceContact` action.
  ///
  /// There is a 60 second dialing timeout for this operation. If the call is
  /// not connected after 60 seconds, the call fails.
  Future<void> startOutboundVoiceContact(
      {@required String destinationPhoneNumber,
      @required String contactFlowId,
      @required String instanceId,
      String clientToken,
      String sourcePhoneNumber,
      String queueId,
      Map<String, String> attributes}) async {}

  /// Ends the contact initiated by the `StartOutboundVoiceContact` operation.
  ///
  /// If you are using an IAM account, it must have permission to the
  /// `connect:StopContact` action.
  Future<void> stopContact(
      {@required String contactId, @required String instanceId}) async {}

  /// The `UpdateContactAttributes` operation lets you programmatically create
  /// new, or update existing, contact attributes associated with a contact. You
  /// can use the operation to add or update attributes for both ongoing and
  /// completed contacts. For example, you can update the customer's name or the
  /// reason the customer called while the call is active, or add notes about
  /// steps that the agent took during the call that are displayed to the next
  /// agent that takes the call. You can also use the `UpdateContactAttributes`
  /// operation to update attributes for a contact using data from your CRM
  /// application and save the data with the contact in Amazon Connect. You
  /// could also flag calls for additional analysis, such as legal review or
  /// identifying abusive callers.
  ///
  /// Contact attributes are available in Amazon Connect for 24 months, and are
  /// then deleted.
  ///
  ///  _Important:_
  ///
  /// You cannot use the operation to update attributes for contacts that
  /// occurred prior to the release of the API, September 12, 2018. You can
  /// update attributes only for contacts that started after the release of the
  /// API. If you attempt to update attributes for a contact that occurred prior
  /// to the release of the API, a 400 error is returned. This applies also to
  /// queued callbacks that were initiated prior to the release of the API but
  /// are still active in your instance.
  Future<void> updateContactAttributes(
      {@required String initialContactId,
      @required String instanceId,
      @required Map<String, String> attributes}) async {}

  /// Assigns the specified hierarchy group to the user.
  Future<void> updateUserHierarchy(
      {String hierarchyGroupId,
      @required String userId,
      @required String instanceId}) async {}

  /// Updates the identity information for the specified user in a
  /// `UserIdentityInfo` object, including email, first name, and last name.
  Future<void> updateUserIdentityInfo(
      {@required UserIdentityInfo identityInfo,
      @required String userId,
      @required String instanceId}) async {}

  /// Updates the phone configuration settings in the `UserPhoneConfig` object
  /// for the specified user.
  Future<void> updateUserPhoneConfig(
      {@required UserPhoneConfig phoneConfig,
      @required String userId,
      @required String instanceId}) async {}

  /// Assigns the specified routing profile to a user.
  Future<void> updateUserRoutingProfile(
      {@required String routingProfileId,
      @required String userId,
      @required String instanceId}) async {}

  /// Updates the security profiles assigned to the user.
  Future<void> updateUserSecurityProfiles(
      {@required List<String> securityProfileIds,
      @required String userId,
      @required String instanceId}) async {}
}

class CreateUserResponse {}

class Credentials {}

class CurrentMetric {}

class CurrentMetricData {}

class CurrentMetricResult {}

class DescribeUserHierarchyGroupResponse {}

class DescribeUserHierarchyStructureResponse {}

class DescribeUserResponse {}

class Dimensions {}

class Filters {}

class GetContactAttributesResponse {}

class GetCurrentMetricDataResponse {}

class GetFederationTokenResponse {}

class GetMetricDataResponse {}

class HierarchyGroup {}

class HierarchyGroupSummary {}

class HierarchyLevel {}

class HierarchyPath {}

class HierarchyStructure {}

class HistoricalMetric {}

class HistoricalMetricData {}

class HistoricalMetricResult {}

class ListRoutingProfilesResponse {}

class ListSecurityProfilesResponse {}

class ListUserHierarchyGroupsResponse {}

class ListUsersResponse {}

class QueueReference {}

class RoutingProfileSummary {}

class SecurityProfileSummary {}

class StartOutboundVoiceContactResponse {}

class StopContactResponse {}

class Threshold {}

class UpdateContactAttributesResponse {}

class User {}

class UserIdentityInfo {}

class UserPhoneConfig {}

class UserSummary {}
