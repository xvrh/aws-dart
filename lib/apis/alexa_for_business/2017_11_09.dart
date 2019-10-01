import 'package:meta/meta.dart';

/// Alexa for Business helps you use Alexa in your organization. Alexa for
/// Business provides you with the tools to manage Alexa devices, enroll your
/// users, and assign skills, at scale. You can build your own context-aware
/// voice skills using the Alexa Skills Kit and the Alexa for Business API
/// operations. You can also make these available as private skills for your
/// organization. Alexa for Business makes it efficient to voice-enable your
/// products and services, thus providing context-aware voice experiences for
/// your customers. Device makers building with the Alexa Voice Service (AVS)
/// can create fully integrated solutions, register their products with Alexa
/// for Business, and manage them as shared devices in their organization.
class AlexaForBusinessApi {
  /// Associates a skill with the organization under the customer's AWS account.
  /// If a skill is private, the user implicitly accepts access to this skill
  /// during enablement.
  Future<void> approveSkill(String skillId) async {}

  /// Associates a contact with a given address book.
  Future<void> associateContactWithAddressBook(
      {@required String contactArn, @required String addressBookArn}) async {}

  /// Associates a device with the specified network profile.
  Future<void> associateDeviceWithNetworkProfile(
      {@required String deviceArn, @required String networkProfileArn}) async {}

  /// Associates a device with a given room. This applies all the settings from
  /// the room profile to the device, and all the skills in any skill groups
  /// added to that room. This operation requires the device to be online, or
  /// else a manual sync is required.
  Future<void> associateDeviceWithRoom(
      {String deviceArn, String roomArn}) async {}

  /// Associates a skill group with a given room. This enables all skills in the
  /// associated skill group on all devices in the room.
  Future<void> associateSkillGroupWithRoom(
      {String skillGroupArn, String roomArn}) async {}

  /// Associates a skill with a skill group.
  Future<void> associateSkillWithSkillGroup(String skillId,
      {String skillGroupArn}) async {}

  /// Makes a private skill available for enrolled users to enable on their
  /// devices.
  Future<void> associateSkillWithUsers(String skillId) async {}

  /// Creates an address book with the specified details.
  Future<void> createAddressBook(String name,
      {String description, String clientRequestToken}) async {}

  /// Creates a recurring schedule for usage reports to deliver to the specified
  /// S3 location with a specified daily or weekly interval.
  Future<void> createBusinessReportSchedule(
      {String scheduleName,
      String s3BucketName,
      String s3KeyPrefix,
      @required String format,
      @required BusinessReportContentRange contentRange,
      BusinessReportRecurrence recurrence,
      String clientRequestToken}) async {}

  /// Adds a new conference provider under the user's AWS account.
  Future<void> createConferenceProvider(
      {@required String conferenceProviderName,
      @required String conferenceProviderType,
      IPDialIn ipDialIn,
      PstnDialIn pstnDialIn,
      @required MeetingSetting meetingSetting,
      String clientRequestToken}) async {}

  /// Creates a contact with the specified details.
  Future<void> createContact(String firstName,
      {String displayName,
      String lastName,
      String phoneNumber,
      List<PhoneNumber> phoneNumbers,
      List<SipAddress> sipAddresses,
      String clientRequestToken}) async {}

  /// Creates a gateway group with the specified details.
  Future<void> createGatewayGroup(
      {@required String name,
      String description,
      @required String clientRequestToken}) async {}

  /// Creates a network profile with the specified details.
  Future<void> createNetworkProfile(
      {@required String networkProfileName,
      String description,
      @required String ssid,
      @required String securityType,
      String eapMethod,
      String currentPassword,
      String nextPassword,
      String certificateAuthorityArn,
      List<String> trustAnchors,
      @required String clientRequestToken}) async {}

  /// Creates a new room profile with the specified details.
  Future<void> createProfile(
      {@required String profileName,
      @required String timezone,
      @required String address,
      @required String distanceUnit,
      @required String temperatureUnit,
      @required String wakeWord,
      String locale,
      String clientRequestToken,
      bool setupModeDisabled,
      int maxVolumeLimit,
      bool pstnEnabled}) async {}

  /// Creates a room with the specified details.
  Future<void> createRoom(String roomName,
      {String description,
      String profileArn,
      String providerCalendarId,
      String clientRequestToken,
      List<Tag> tags}) async {}

  /// Creates a skill group with a specified name and description.
  Future<void> createSkillGroup(String skillGroupName,
      {String description, String clientRequestToken}) async {}

  /// Creates a user.
  Future<void> createUser(String userId,
      {String firstName,
      String lastName,
      String email,
      String clientRequestToken,
      List<Tag> tags}) async {}

  /// Deletes an address book by the address book ARN.
  Future<void> deleteAddressBook(String addressBookArn) async {}

  /// Deletes the recurring report delivery schedule with the specified schedule
  /// ARN.
  Future<void> deleteBusinessReportSchedule(String scheduleArn) async {}

  /// Deletes a conference provider.
  Future<void> deleteConferenceProvider(String conferenceProviderArn) async {}

  /// Deletes a contact by the contact ARN.
  Future<void> deleteContact(String contactArn) async {}

  /// Removes a device from Alexa For Business.
  Future<void> deleteDevice(String deviceArn) async {}

  /// When this action is called for a specified shared device, it allows
  /// authorized users to delete the device's entire previous history of voice
  /// input data and associated response data. This action can be called once
  /// every 24 hours for a specific shared device.
  Future<void> deleteDeviceUsageData(
      {@required String deviceArn, @required String deviceUsageType}) async {}

  /// Deletes a gateway group.
  Future<void> deleteGatewayGroup(String gatewayGroupArn) async {}

  /// Deletes a network profile by the network profile ARN.
  Future<void> deleteNetworkProfile(String networkProfileArn) async {}

  /// Deletes a room profile by the profile ARN.
  Future<void> deleteProfile({String profileArn}) async {}

  /// Deletes a room by the room ARN.
  Future<void> deleteRoom({String roomArn}) async {}

  /// Deletes room skill parameter details by room, skill, and parameter key ID.
  Future<void> deleteRoomSkillParameter(
      {String roomArn,
      @required String skillId,
      @required String parameterKey}) async {}

  /// Unlinks a third-party account from a skill.
  Future<void> deleteSkillAuthorization(String skillId,
      {String roomArn}) async {}

  /// Deletes a skill group by skill group ARN.
  Future<void> deleteSkillGroup({String skillGroupArn}) async {}

  /// Deletes a specified user by user ARN and enrollment ARN.
  Future<void> deleteUser(String enrollmentId, {String userArn}) async {}

  /// Disassociates a contact from a given address book.
  Future<void> disassociateContactFromAddressBook(
      {@required String contactArn, @required String addressBookArn}) async {}

  /// Disassociates a device from its current room. The device continues to be
  /// connected to the Wi-Fi network and is still registered to the account. The
  /// device settings and skills are removed from the room.
  Future<void> disassociateDeviceFromRoom({String deviceArn}) async {}

  /// Disassociates a skill from a skill group.
  Future<void> disassociateSkillFromSkillGroup(String skillId,
      {String skillGroupArn}) async {}

  /// Makes a private skill unavailable for enrolled users and prevents them
  /// from enabling it on their devices.
  Future<void> disassociateSkillFromUsers(String skillId) async {}

  /// Disassociates a skill group from a specified room. This disables all
  /// skills in the skill group on all devices in the room.
  Future<void> disassociateSkillGroupFromRoom(
      {String skillGroupArn, String roomArn}) async {}

  /// Forgets smart home appliances associated to a room.
  Future<void> forgetSmartHomeAppliances(String roomArn) async {}

  /// Gets address the book details by the address book ARN.
  Future<void> getAddressBook(String addressBookArn) async {}

  /// Retrieves the existing conference preferences.
  Future<void> getConferencePreference() async {}

  /// Gets details about a specific conference provider.
  Future<void> getConferenceProvider(String conferenceProviderArn) async {}

  /// Gets the contact details by the contact ARN.
  Future<void> getContact(String contactArn) async {}

  /// Gets the details of a device by device ARN.
  Future<void> getDevice({String deviceArn}) async {}

  /// Retrieves the details of a gateway.
  Future<void> getGateway(String gatewayArn) async {}

  /// Retrieves the details of a gateway group.
  Future<void> getGatewayGroup(String gatewayGroupArn) async {}

  /// Retrieves the configured values for the user enrollment invitation email
  /// template.
  Future<void> getInvitationConfiguration() async {}

  /// Gets the network profile details by the network profile ARN.
  Future<void> getNetworkProfile(String networkProfileArn) async {}

  /// Gets the details of a room profile by profile ARN.
  Future<void> getProfile({String profileArn}) async {}

  /// Gets room details by room ARN.
  Future<void> getRoom({String roomArn}) async {}

  /// Gets room skill parameter details by room, skill, and parameter key ARN.
  Future<void> getRoomSkillParameter(
      {String roomArn,
      @required String skillId,
      @required String parameterKey}) async {}

  /// Gets skill group details by skill group ARN.
  Future<void> getSkillGroup({String skillGroupArn}) async {}

  /// Lists the details of the schedules that a user configured.
  Future<void> listBusinessReportSchedules(
      {String nextToken, int maxResults}) async {}

  /// Lists conference providers under a specific AWS account.
  Future<void> listConferenceProviders(
      {String nextToken, int maxResults}) async {}

  /// Lists the device event history, including device connection status, for up
  /// to 30 days.
  Future<void> listDeviceEvents(String deviceArn,
      {String eventType, String nextToken, int maxResults}) async {}

  /// Retrieves a list of gateway group summaries. Use GetGatewayGroup to
  /// retrieve details of a specific gateway group.
  Future<void> listGatewayGroups({String nextToken, int maxResults}) async {}

  /// Retrieves a list of gateway summaries. Use GetGateway to retrieve details
  /// of a specific gateway. An optional gateway group ARN can be provided to
  /// only retrieve gateway summaries of gateways that are associated with that
  /// gateway group ARN.
  Future<void> listGateways(
      {String gatewayGroupArn, String nextToken, int maxResults}) async {}

  /// Lists all enabled skills in a specific skill group.
  Future<void> listSkills(
      {String skillGroupArn,
      String enablementType,
      String skillType,
      String nextToken,
      int maxResults}) async {}

  /// Lists all categories in the Alexa skill store.
  Future<void> listSkillsStoreCategories(
      {String nextToken, int maxResults}) async {}

  /// Lists all skills in the Alexa skill store by category.
  Future<void> listSkillsStoreSkillsByCategory(BigInt categoryId,
      {String nextToken, int maxResults}) async {}

  /// Lists all of the smart home appliances associated with a room.
  Future<void> listSmartHomeAppliances(String roomArn,
      {int maxResults, String nextToken}) async {}

  /// Lists all tags for the specified resource.
  Future<void> listTags(String arn, {String nextToken, int maxResults}) async {}

  /// Sets the conference preferences on a specific conference provider at the
  /// account level.
  Future<void> putConferencePreference(
      ConferencePreference conferencePreference) async {}

  /// Configures the email template for the user enrollment invitation with the
  /// specified attributes.
  Future<void> putInvitationConfiguration(String organizationName,
      {String contactEmail, List<String> privateSkillIds}) async {}

  /// Updates room skill parameter details by room, skill, and parameter key ID.
  /// Not all skills have a room skill parameter.
  Future<void> putRoomSkillParameter(
      {String roomArn,
      @required String skillId,
      @required RoomSkillParameter roomSkillParameter}) async {}

  /// Links a user's account to a third-party skill provider. If this API
  /// operation is called by an assumed IAM role, the skill being linked must be
  /// a private skill. Also, the skill must be owned by the AWS account that
  /// assumed the IAM role.
  Future<void> putSkillAuthorization(
      {@required Map<String, String> authorizationResult,
      @required String skillId,
      String roomArn}) async {}

  /// Registers an Alexa-enabled device built by an Original Equipment
  /// Manufacturer (OEM) using Alexa Voice Service (AVS).
  Future<void> registerAvsDevice(
      {@required String clientId,
      @required String userCode,
      @required String productId,
      @required String deviceSerialNumber,
      @required String amazonId}) async {}

  /// Disassociates a skill from the organization under a user's AWS account. If
  /// the skill is a private skill, it moves to an AcceptStatus of PENDING. Any
  /// private or public skill that is rejected can be added later by calling the
  /// ApproveSkill API.
  Future<void> rejectSkill(String skillId) async {}

  /// Determines the details for the room from which a skill request was
  /// invoked. This operation is used by skill developers.
  Future<void> resolveRoom(
      {@required String userId, @required String skillId}) async {}

  /// Revokes an invitation and invalidates the enrollment URL.
  Future<void> revokeInvitation({String userArn, String enrollmentId}) async {}

  /// Searches address books and lists the ones that meet a set of filter and
  /// sort criteria.
  Future<void> searchAddressBooks(
      {List<Filter> filters,
      List<Sort> sortCriteria,
      String nextToken,
      int maxResults}) async {}

  /// Searches contacts and lists the ones that meet a set of filter and sort
  /// criteria.
  Future<void> searchContacts(
      {List<Filter> filters,
      List<Sort> sortCriteria,
      String nextToken,
      int maxResults}) async {}

  /// Searches devices and lists the ones that meet a set of filter criteria.
  Future<void> searchDevices(
      {String nextToken,
      int maxResults,
      List<Filter> filters,
      List<Sort> sortCriteria}) async {}

  /// Searches network profiles and lists the ones that meet a set of filter and
  /// sort criteria.
  Future<void> searchNetworkProfiles(
      {String nextToken,
      int maxResults,
      List<Filter> filters,
      List<Sort> sortCriteria}) async {}

  /// Searches room profiles and lists the ones that meet a set of filter
  /// criteria.
  Future<void> searchProfiles(
      {String nextToken,
      int maxResults,
      List<Filter> filters,
      List<Sort> sortCriteria}) async {}

  /// Searches rooms and lists the ones that meet a set of filter and sort
  /// criteria.
  Future<void> searchRooms(
      {String nextToken,
      int maxResults,
      List<Filter> filters,
      List<Sort> sortCriteria}) async {}

  /// Searches skill groups and lists the ones that meet a set of filter and
  /// sort criteria.
  Future<void> searchSkillGroups(
      {String nextToken,
      int maxResults,
      List<Filter> filters,
      List<Sort> sortCriteria}) async {}

  /// Searches users and lists the ones that meet a set of filter and sort
  /// criteria.
  Future<void> searchUsers(
      {String nextToken,
      int maxResults,
      List<Filter> filters,
      List<Sort> sortCriteria}) async {}

  /// Triggers an asynchronous flow to send text, SSML, or audio announcements
  /// to rooms that are identified by a search or filter.
  Future<void> sendAnnouncement(
      {@required List<Filter> roomFilters,
      @required Content content,
      int timeToLiveInSeconds,
      @required String clientRequestToken}) async {}

  /// Sends an enrollment invitation email with a URL to a user. The URL is
  /// valid for 30 days or until you call this operation again, whichever comes
  /// first.
  Future<void> sendInvitation({String userArn}) async {}

  /// Resets a device and its account to the known default settings. This clears
  /// all information and settings set by previous users in the following ways:
  ///
  /// *   Bluetooth - This unpairs all bluetooth devices paired with your echo
  /// device.
  ///
  /// *   Volume - This resets the echo device's volume to the default value.
  ///
  /// *   Notifications - This clears all notifications from your echo device.
  ///
  /// *   Lists - This clears all to-do items from your echo device.
  ///
  /// *   Settings - This internally syncs the room's profile (if the device is
  /// assigned to a room), contacts, address books, delegation access for
  /// account linking, and communications (if enabled on the room profile).
  Future<void> startDeviceSync(List<String> features,
      {String roomArn, String deviceArn}) async {}

  /// Initiates the discovery of any smart home appliances associated with the
  /// room.
  Future<void> startSmartHomeApplianceDiscovery(String roomArn) async {}

  /// Adds metadata tags to a specified resource.
  Future<void> tagResource(
      {@required String arn, @required List<Tag> tags}) async {}

  /// Removes metadata tags from a specified resource.
  Future<void> untagResource(
      {@required String arn, @required List<String> tagKeys}) async {}

  /// Updates address book details by the address book ARN.
  Future<void> updateAddressBook(String addressBookArn,
      {String name, String description}) async {}

  /// Updates the configuration of the report delivery schedule with the
  /// specified schedule ARN.
  Future<void> updateBusinessReportSchedule(String scheduleArn,
      {String s3BucketName,
      String s3KeyPrefix,
      String format,
      String scheduleName,
      BusinessReportRecurrence recurrence}) async {}

  /// Updates an existing conference provider's settings.
  Future<void> updateConferenceProvider(
      {@required String conferenceProviderArn,
      @required String conferenceProviderType,
      IPDialIn ipDialIn,
      PstnDialIn pstnDialIn,
      @required MeetingSetting meetingSetting}) async {}

  /// Updates the contact details by the contact ARN.
  Future<void> updateContact(String contactArn,
      {String displayName,
      String firstName,
      String lastName,
      String phoneNumber,
      List<PhoneNumber> phoneNumbers,
      List<SipAddress> sipAddresses}) async {}

  /// Updates the device name by device ARN.
  Future<void> updateDevice({String deviceArn, String deviceName}) async {}

  /// Updates the details of a gateway. If any optional field is not provided,
  /// the existing corresponding value is left unmodified.
  Future<void> updateGateway(String gatewayArn,
      {String name, String description, String softwareVersion}) async {}

  /// Updates the details of a gateway group. If any optional field is not
  /// provided, the existing corresponding value is left unmodified.
  Future<void> updateGatewayGroup(String gatewayGroupArn,
      {String name, String description}) async {}

  /// Updates a network profile by the network profile ARN.
  Future<void> updateNetworkProfile(String networkProfileArn,
      {String networkProfileName,
      String description,
      String currentPassword,
      String nextPassword,
      String certificateAuthorityArn,
      List<String> trustAnchors}) async {}

  /// Updates an existing room profile by room profile ARN.
  Future<void> updateProfile(
      {String profileArn,
      String profileName,
      bool isDefault,
      String timezone,
      String address,
      String distanceUnit,
      String temperatureUnit,
      String wakeWord,
      String locale,
      bool setupModeDisabled,
      int maxVolumeLimit,
      bool pstnEnabled}) async {}

  /// Updates room details by room ARN.
  Future<void> updateRoom(
      {String roomArn,
      String roomName,
      String description,
      String providerCalendarId,
      String profileArn}) async {}

  /// Updates skill group details by skill group ARN.
  Future<void> updateSkillGroup(
      {String skillGroupArn,
      String skillGroupName,
      String description}) async {}
}

class AddressBook {}

class AddressBookData {}

class ApproveSkillResponse {}

class AssociateContactWithAddressBookResponse {}

class AssociateDeviceWithNetworkProfileResponse {}

class AssociateDeviceWithRoomResponse {}

class AssociateSkillGroupWithRoomResponse {}

class AssociateSkillWithSkillGroupResponse {}

class AssociateSkillWithUsersResponse {}

class Audio {}

class BusinessReport {}

class BusinessReportContentRange {}

class BusinessReportRecurrence {}

class BusinessReportS3Location {}

class BusinessReportSchedule {}

class Category {}

class ConferencePreference {}

class ConferenceProvider {}

class Contact {}

class ContactData {}

class Content {}

class CreateAddressBookResponse {}

class CreateBusinessReportScheduleResponse {}

class CreateConferenceProviderResponse {}

class CreateContactResponse {}

class CreateGatewayGroupResponse {}

class CreateNetworkProfileResponse {}

class CreateProfileResponse {}

class CreateRoomResponse {}

class CreateSkillGroupResponse {}

class CreateUserResponse {}

class DeleteAddressBookResponse {}

class DeleteBusinessReportScheduleResponse {}

class DeleteConferenceProviderResponse {}

class DeleteContactResponse {}

class DeleteDeviceResponse {}

class DeleteDeviceUsageDataResponse {}

class DeleteGatewayGroupResponse {}

class DeleteNetworkProfileResponse {}

class DeleteProfileResponse {}

class DeleteRoomResponse {}

class DeleteRoomSkillParameterResponse {}

class DeleteSkillAuthorizationResponse {}

class DeleteSkillGroupResponse {}

class DeleteUserResponse {}

class DeveloperInfo {}

class Device {}

class DeviceData {}

class DeviceEvent {}

class DeviceNetworkProfileInfo {}

class DeviceStatusDetail {}

class DeviceStatusInfo {}

class DisassociateContactFromAddressBookResponse {}

class DisassociateDeviceFromRoomResponse {}

class DisassociateSkillFromSkillGroupResponse {}

class DisassociateSkillFromUsersResponse {}

class DisassociateSkillGroupFromRoomResponse {}

class Filter {}

class ForgetSmartHomeAppliancesResponse {}

class Gateway {}

class GatewayGroup {}

class GatewayGroupSummary {}

class GatewaySummary {}

class GetAddressBookResponse {}

class GetConferencePreferenceResponse {}

class GetConferenceProviderResponse {}

class GetContactResponse {}

class GetDeviceResponse {}

class GetGatewayGroupResponse {}

class GetGatewayResponse {}

class GetInvitationConfigurationResponse {}

class GetNetworkProfileResponse {}

class GetProfileResponse {}

class GetRoomResponse {}

class GetRoomSkillParameterResponse {}

class GetSkillGroupResponse {}

class IPDialIn {}

class ListBusinessReportSchedulesResponse {}

class ListConferenceProvidersResponse {}

class ListDeviceEventsResponse {}

class ListGatewayGroupsResponse {}

class ListGatewaysResponse {}

class ListSkillsResponse {}

class ListSkillsStoreCategoriesResponse {}

class ListSkillsStoreSkillsByCategoryResponse {}

class ListSmartHomeAppliancesResponse {}

class ListTagsResponse {}

class MeetingSetting {}

class NetworkProfile {}

class NetworkProfileData {}

class PstnDialIn {}

class PhoneNumber {}

class Profile {}

class ProfileData {}

class PutConferencePreferenceResponse {}

class PutInvitationConfigurationResponse {}

class PutRoomSkillParameterResponse {}

class PutSkillAuthorizationResponse {}

class RegisterAvsDeviceResponse {}

class RejectSkillResponse {}

class ResolveRoomResponse {}

class RevokeInvitationResponse {}

class Room {}

class RoomData {}

class RoomSkillParameter {}

class SearchAddressBooksResponse {}

class SearchContactsResponse {}

class SearchDevicesResponse {}

class SearchNetworkProfilesResponse {}

class SearchProfilesResponse {}

class SearchRoomsResponse {}

class SearchSkillGroupsResponse {}

class SearchUsersResponse {}

class SendAnnouncementResponse {}

class SendInvitationResponse {}

class SipAddress {}

class SkillDetails {}

class SkillGroup {}

class SkillGroupData {}

class SkillSummary {}

class SkillsStoreSkill {}

class SmartHomeAppliance {}

class Sort {}

class Ssml {}

class StartDeviceSyncResponse {}

class StartSmartHomeApplianceDiscoveryResponse {}

class Tag {}

class TagResourceResponse {}

class Text {}

class UntagResourceResponse {}

class UpdateAddressBookResponse {}

class UpdateBusinessReportScheduleResponse {}

class UpdateConferenceProviderResponse {}

class UpdateContactResponse {}

class UpdateDeviceResponse {}

class UpdateGatewayGroupResponse {}

class UpdateGatewayResponse {}

class UpdateNetworkProfileResponse {}

class UpdateProfileResponse {}

class UpdateRoomResponse {}

class UpdateSkillGroupResponse {}

class UserData {}
