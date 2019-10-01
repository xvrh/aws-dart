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
  final _client;
  AlexaForBusinessApi(client)
      : _client = client.configured('Alexa For Business', serializer: 'json');

  /// Associates a skill with the organization under the customer's AWS account.
  /// If a skill is private, the user implicitly accepts access to this skill
  /// during enablement.
  ///
  /// [skillId]: The unique identifier of the skill.
  Future<ApproveSkillResponse> approveSkill(String skillId) async {
    var response_ = await _client.send('ApproveSkill', {
      'SkillId': skillId,
    });
    return ApproveSkillResponse.fromJson(response_);
  }

  /// Associates a contact with a given address book.
  ///
  /// [contactArn]: The ARN of the contact to associate with an address book.
  ///
  /// [addressBookArn]: The ARN of the address book with which to associate the
  /// contact.
  Future<AssociateContactWithAddressBookResponse>
      associateContactWithAddressBook(
          {@required String contactArn,
          @required String addressBookArn}) async {
    var response_ = await _client.send('AssociateContactWithAddressBook', {
      'ContactArn': contactArn,
      'AddressBookArn': addressBookArn,
    });
    return AssociateContactWithAddressBookResponse.fromJson(response_);
  }

  /// Associates a device with the specified network profile.
  ///
  /// [deviceArn]: The device ARN.
  ///
  /// [networkProfileArn]: The ARN of the network profile to associate with a
  /// device.
  Future<AssociateDeviceWithNetworkProfileResponse>
      associateDeviceWithNetworkProfile(
          {@required String deviceArn,
          @required String networkProfileArn}) async {
    var response_ = await _client.send('AssociateDeviceWithNetworkProfile', {
      'DeviceArn': deviceArn,
      'NetworkProfileArn': networkProfileArn,
    });
    return AssociateDeviceWithNetworkProfileResponse.fromJson(response_);
  }

  /// Associates a device with a given room. This applies all the settings from
  /// the room profile to the device, and all the skills in any skill groups
  /// added to that room. This operation requires the device to be online, or
  /// else a manual sync is required.
  ///
  /// [deviceArn]: The ARN of the device to associate to a room. Required.
  ///
  /// [roomArn]: The ARN of the room with which to associate the device.
  /// Required.
  Future<AssociateDeviceWithRoomResponse> associateDeviceWithRoom(
      {String deviceArn, String roomArn}) async {
    var response_ = await _client.send('AssociateDeviceWithRoom', {
      if (deviceArn != null) 'DeviceArn': deviceArn,
      if (roomArn != null) 'RoomArn': roomArn,
    });
    return AssociateDeviceWithRoomResponse.fromJson(response_);
  }

  /// Associates a skill group with a given room. This enables all skills in the
  /// associated skill group on all devices in the room.
  ///
  /// [skillGroupArn]: The ARN of the skill group to associate with a room.
  /// Required.
  ///
  /// [roomArn]: The ARN of the room with which to associate the skill group.
  /// Required.
  Future<AssociateSkillGroupWithRoomResponse> associateSkillGroupWithRoom(
      {String skillGroupArn, String roomArn}) async {
    var response_ = await _client.send('AssociateSkillGroupWithRoom', {
      if (skillGroupArn != null) 'SkillGroupArn': skillGroupArn,
      if (roomArn != null) 'RoomArn': roomArn,
    });
    return AssociateSkillGroupWithRoomResponse.fromJson(response_);
  }

  /// Associates a skill with a skill group.
  ///
  /// [skillGroupArn]: The ARN of the skill group to associate the skill to.
  /// Required.
  ///
  /// [skillId]: The unique identifier of the skill.
  Future<AssociateSkillWithSkillGroupResponse> associateSkillWithSkillGroup(
      String skillId,
      {String skillGroupArn}) async {
    var response_ = await _client.send('AssociateSkillWithSkillGroup', {
      if (skillGroupArn != null) 'SkillGroupArn': skillGroupArn,
      'SkillId': skillId,
    });
    return AssociateSkillWithSkillGroupResponse.fromJson(response_);
  }

  /// Makes a private skill available for enrolled users to enable on their
  /// devices.
  ///
  /// [skillId]: The private skill ID you want to make available to enrolled
  /// users.
  Future<AssociateSkillWithUsersResponse> associateSkillWithUsers(
      String skillId) async {
    var response_ = await _client.send('AssociateSkillWithUsers', {
      'SkillId': skillId,
    });
    return AssociateSkillWithUsersResponse.fromJson(response_);
  }

  /// Creates an address book with the specified details.
  ///
  /// [name]: The name of the address book.
  ///
  /// [description]: The description of the address book.
  ///
  /// [clientRequestToken]: A unique, user-specified identifier for the request
  /// that ensures idempotency.
  Future<CreateAddressBookResponse> createAddressBook(String name,
      {String description, String clientRequestToken}) async {
    var response_ = await _client.send('CreateAddressBook', {
      'Name': name,
      if (description != null) 'Description': description,
      if (clientRequestToken != null) 'ClientRequestToken': clientRequestToken,
    });
    return CreateAddressBookResponse.fromJson(response_);
  }

  /// Creates a recurring schedule for usage reports to deliver to the specified
  /// S3 location with a specified daily or weekly interval.
  ///
  /// [scheduleName]: The name identifier of the schedule.
  ///
  /// [s3BucketName]: The S3 bucket name of the output reports. If this isn't
  /// specified, the report can be retrieved from a download link by calling
  /// ListBusinessReportSchedule.
  ///
  /// [s3KeyPrefix]: The S3 key where the report is delivered.
  ///
  /// [format]: The format of the generated report (individual CSV files or
  /// zipped files of individual files).
  ///
  /// [contentRange]: The content range of the reports.
  ///
  /// [recurrence]: The recurrence of the reports. If this isn't specified, the
  /// report will only be delivered one time when the API is called.
  ///
  /// [clientRequestToken]: The client request token.
  Future<CreateBusinessReportScheduleResponse> createBusinessReportSchedule(
      {String scheduleName,
      String s3BucketName,
      String s3KeyPrefix,
      @required String format,
      @required BusinessReportContentRange contentRange,
      BusinessReportRecurrence recurrence,
      String clientRequestToken}) async {
    var response_ = await _client.send('CreateBusinessReportSchedule', {
      if (scheduleName != null) 'ScheduleName': scheduleName,
      if (s3BucketName != null) 'S3BucketName': s3BucketName,
      if (s3KeyPrefix != null) 'S3KeyPrefix': s3KeyPrefix,
      'Format': format,
      'ContentRange': contentRange,
      if (recurrence != null) 'Recurrence': recurrence,
      if (clientRequestToken != null) 'ClientRequestToken': clientRequestToken,
    });
    return CreateBusinessReportScheduleResponse.fromJson(response_);
  }

  /// Adds a new conference provider under the user's AWS account.
  ///
  /// [conferenceProviderName]: The name of the conference provider.
  ///
  /// [conferenceProviderType]: Represents a type within a list of predefined
  /// types.
  ///
  /// [ipDialIn]: The IP endpoint and protocol for calling.
  ///
  /// [pstnDialIn]: The information for PSTN conferencing.
  ///
  /// [meetingSetting]: The meeting settings for the conference provider.
  ///
  /// [clientRequestToken]: The request token of the client.
  Future<CreateConferenceProviderResponse> createConferenceProvider(
      {@required String conferenceProviderName,
      @required String conferenceProviderType,
      IPDialIn ipDialIn,
      PstnDialIn pstnDialIn,
      @required MeetingSetting meetingSetting,
      String clientRequestToken}) async {
    var response_ = await _client.send('CreateConferenceProvider', {
      'ConferenceProviderName': conferenceProviderName,
      'ConferenceProviderType': conferenceProviderType,
      if (ipDialIn != null) 'IPDialIn': ipDialIn,
      if (pstnDialIn != null) 'PSTNDialIn': pstnDialIn,
      'MeetingSetting': meetingSetting,
      if (clientRequestToken != null) 'ClientRequestToken': clientRequestToken,
    });
    return CreateConferenceProviderResponse.fromJson(response_);
  }

  /// Creates a contact with the specified details.
  ///
  /// [displayName]: The name of the contact to display on the console.
  ///
  /// [firstName]: The first name of the contact that is used to call the
  /// contact on the device.
  ///
  /// [lastName]: The last name of the contact that is used to call the contact
  /// on the device.
  ///
  /// [phoneNumber]: The phone number of the contact in E.164 format. The phone
  /// number type defaults to WORK. You can specify PhoneNumber or PhoneNumbers.
  /// We recommend that you use PhoneNumbers, which lets you specify the phone
  /// number type and multiple numbers.
  ///
  /// [phoneNumbers]: The list of phone numbers for the contact.
  ///
  /// [sipAddresses]: The list of SIP addresses for the contact.
  ///
  /// [clientRequestToken]: A unique, user-specified identifier for this request
  /// that ensures idempotency.
  Future<CreateContactResponse> createContact(String firstName,
      {String displayName,
      String lastName,
      String phoneNumber,
      List<PhoneNumber> phoneNumbers,
      List<SipAddress> sipAddresses,
      String clientRequestToken}) async {
    var response_ = await _client.send('CreateContact', {
      if (displayName != null) 'DisplayName': displayName,
      'FirstName': firstName,
      if (lastName != null) 'LastName': lastName,
      if (phoneNumber != null) 'PhoneNumber': phoneNumber,
      if (phoneNumbers != null) 'PhoneNumbers': phoneNumbers,
      if (sipAddresses != null) 'SipAddresses': sipAddresses,
      if (clientRequestToken != null) 'ClientRequestToken': clientRequestToken,
    });
    return CreateContactResponse.fromJson(response_);
  }

  /// Creates a gateway group with the specified details.
  ///
  /// [name]: The name of the gateway group.
  ///
  /// [description]: The description of the gateway group.
  ///
  /// [clientRequestToken]:  A unique, user-specified identifier for the request
  /// that ensures idempotency.
  Future<CreateGatewayGroupResponse> createGatewayGroup(
      {@required String name,
      String description,
      @required String clientRequestToken}) async {
    var response_ = await _client.send('CreateGatewayGroup', {
      'Name': name,
      if (description != null) 'Description': description,
      'ClientRequestToken': clientRequestToken,
    });
    return CreateGatewayGroupResponse.fromJson(response_);
  }

  /// Creates a network profile with the specified details.
  ///
  /// [networkProfileName]: The name of the network profile associated with a
  /// device.
  ///
  /// [description]: Detailed information about a device's network profile.
  ///
  /// [ssid]: The SSID of the Wi-Fi network.
  ///
  /// [securityType]: The security type of the Wi-Fi network. This can be
  /// WPA2_ENTERPRISE, WPA2_PSK, WPA_PSK, WEP, or OPEN.
  ///
  /// [eapMethod]: The authentication standard that is used in the EAP
  /// framework. Currently, EAP_TLS is supported.
  ///
  /// [currentPassword]: The current password of the Wi-Fi network.
  ///
  /// [nextPassword]: The next, or subsequent, password of the Wi-Fi network.
  /// This password is asynchronously transmitted to the device and is used when
  /// the password of the network changes to NextPassword.
  ///
  /// [certificateAuthorityArn]: The ARN of the Private Certificate Authority
  /// (PCA) created in AWS Certificate Manager (ACM). This is used to issue
  /// certificates to the devices.
  ///
  /// [trustAnchors]: The root certificates of your authentication server that
  /// is installed on your devices and used to trust your authentication server
  /// during EAP negotiation.
  Future<CreateNetworkProfileResponse> createNetworkProfile(
      {@required String networkProfileName,
      String description,
      @required String ssid,
      @required String securityType,
      String eapMethod,
      String currentPassword,
      String nextPassword,
      String certificateAuthorityArn,
      List<String> trustAnchors,
      @required String clientRequestToken}) async {
    var response_ = await _client.send('CreateNetworkProfile', {
      'NetworkProfileName': networkProfileName,
      if (description != null) 'Description': description,
      'Ssid': ssid,
      'SecurityType': securityType,
      if (eapMethod != null) 'EapMethod': eapMethod,
      if (currentPassword != null) 'CurrentPassword': currentPassword,
      if (nextPassword != null) 'NextPassword': nextPassword,
      if (certificateAuthorityArn != null)
        'CertificateAuthorityArn': certificateAuthorityArn,
      if (trustAnchors != null) 'TrustAnchors': trustAnchors,
      'ClientRequestToken': clientRequestToken,
    });
    return CreateNetworkProfileResponse.fromJson(response_);
  }

  /// Creates a new room profile with the specified details.
  ///
  /// [profileName]: The name of a room profile.
  ///
  /// [timezone]: The time zone used by a room profile.
  ///
  /// [address]: The valid address for the room.
  ///
  /// [distanceUnit]: The distance unit to be used by devices in the profile.
  ///
  /// [temperatureUnit]: The temperature unit to be used by devices in the
  /// profile.
  ///
  /// [wakeWord]: A wake word for Alexa, Echo, Amazon, or a computer.
  ///
  /// [locale]: The locale of the room profile.
  ///
  /// [clientRequestToken]: The user-specified token that is used during the
  /// creation of a profile.
  ///
  /// [setupModeDisabled]: Whether room profile setup is enabled.
  ///
  /// [maxVolumeLimit]: The maximum volume limit for a room profile.
  ///
  /// [pstnEnabled]: Whether PSTN calling is enabled.
  Future<CreateProfileResponse> createProfile(
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
      bool pstnEnabled}) async {
    var response_ = await _client.send('CreateProfile', {
      'ProfileName': profileName,
      'Timezone': timezone,
      'Address': address,
      'DistanceUnit': distanceUnit,
      'TemperatureUnit': temperatureUnit,
      'WakeWord': wakeWord,
      if (locale != null) 'Locale': locale,
      if (clientRequestToken != null) 'ClientRequestToken': clientRequestToken,
      if (setupModeDisabled != null) 'SetupModeDisabled': setupModeDisabled,
      if (maxVolumeLimit != null) 'MaxVolumeLimit': maxVolumeLimit,
      if (pstnEnabled != null) 'PSTNEnabled': pstnEnabled,
    });
    return CreateProfileResponse.fromJson(response_);
  }

  /// Creates a room with the specified details.
  ///
  /// [roomName]: The name for the room.
  ///
  /// [description]: The description for the room.
  ///
  /// [profileArn]: The profile ARN for the room.
  ///
  /// [providerCalendarId]: The calendar ARN for the room.
  ///
  /// [clientRequestToken]: A unique, user-specified identifier for this request
  /// that ensures idempotency.
  ///
  /// [tags]: The tags for the room.
  Future<CreateRoomResponse> createRoom(String roomName,
      {String description,
      String profileArn,
      String providerCalendarId,
      String clientRequestToken,
      List<Tag> tags}) async {
    var response_ = await _client.send('CreateRoom', {
      'RoomName': roomName,
      if (description != null) 'Description': description,
      if (profileArn != null) 'ProfileArn': profileArn,
      if (providerCalendarId != null) 'ProviderCalendarId': providerCalendarId,
      if (clientRequestToken != null) 'ClientRequestToken': clientRequestToken,
      if (tags != null) 'Tags': tags,
    });
    return CreateRoomResponse.fromJson(response_);
  }

  /// Creates a skill group with a specified name and description.
  ///
  /// [skillGroupName]: The name for the skill group.
  ///
  /// [description]: The description for the skill group.
  ///
  /// [clientRequestToken]: A unique, user-specified identifier for this request
  /// that ensures idempotency.
  Future<CreateSkillGroupResponse> createSkillGroup(String skillGroupName,
      {String description, String clientRequestToken}) async {
    var response_ = await _client.send('CreateSkillGroup', {
      'SkillGroupName': skillGroupName,
      if (description != null) 'Description': description,
      if (clientRequestToken != null) 'ClientRequestToken': clientRequestToken,
    });
    return CreateSkillGroupResponse.fromJson(response_);
  }

  /// Creates a user.
  ///
  /// [userId]: The ARN for the user.
  ///
  /// [firstName]: The first name for the user.
  ///
  /// [lastName]: The last name for the user.
  ///
  /// [email]: The email address for the user.
  ///
  /// [clientRequestToken]: A unique, user-specified identifier for this request
  /// that ensures idempotency.
  ///
  /// [tags]: The tags for the user.
  Future<CreateUserResponse> createUser(String userId,
      {String firstName,
      String lastName,
      String email,
      String clientRequestToken,
      List<Tag> tags}) async {
    var response_ = await _client.send('CreateUser', {
      'UserId': userId,
      if (firstName != null) 'FirstName': firstName,
      if (lastName != null) 'LastName': lastName,
      if (email != null) 'Email': email,
      if (clientRequestToken != null) 'ClientRequestToken': clientRequestToken,
      if (tags != null) 'Tags': tags,
    });
    return CreateUserResponse.fromJson(response_);
  }

  /// Deletes an address book by the address book ARN.
  ///
  /// [addressBookArn]: The ARN of the address book to delete.
  Future<DeleteAddressBookResponse> deleteAddressBook(
      String addressBookArn) async {
    var response_ = await _client.send('DeleteAddressBook', {
      'AddressBookArn': addressBookArn,
    });
    return DeleteAddressBookResponse.fromJson(response_);
  }

  /// Deletes the recurring report delivery schedule with the specified schedule
  /// ARN.
  ///
  /// [scheduleArn]: The ARN of the business report schedule.
  Future<DeleteBusinessReportScheduleResponse> deleteBusinessReportSchedule(
      String scheduleArn) async {
    var response_ = await _client.send('DeleteBusinessReportSchedule', {
      'ScheduleArn': scheduleArn,
    });
    return DeleteBusinessReportScheduleResponse.fromJson(response_);
  }

  /// Deletes a conference provider.
  ///
  /// [conferenceProviderArn]: The ARN of the conference provider.
  Future<DeleteConferenceProviderResponse> deleteConferenceProvider(
      String conferenceProviderArn) async {
    var response_ = await _client.send('DeleteConferenceProvider', {
      'ConferenceProviderArn': conferenceProviderArn,
    });
    return DeleteConferenceProviderResponse.fromJson(response_);
  }

  /// Deletes a contact by the contact ARN.
  ///
  /// [contactArn]: The ARN of the contact to delete.
  Future<DeleteContactResponse> deleteContact(String contactArn) async {
    var response_ = await _client.send('DeleteContact', {
      'ContactArn': contactArn,
    });
    return DeleteContactResponse.fromJson(response_);
  }

  /// Removes a device from Alexa For Business.
  ///
  /// [deviceArn]: The ARN of the device for which to request details.
  Future<DeleteDeviceResponse> deleteDevice(String deviceArn) async {
    var response_ = await _client.send('DeleteDevice', {
      'DeviceArn': deviceArn,
    });
    return DeleteDeviceResponse.fromJson(response_);
  }

  /// When this action is called for a specified shared device, it allows
  /// authorized users to delete the device's entire previous history of voice
  /// input data and associated response data. This action can be called once
  /// every 24 hours for a specific shared device.
  ///
  /// [deviceArn]: The ARN of the device.
  ///
  /// [deviceUsageType]: The type of usage data to delete.
  Future<DeleteDeviceUsageDataResponse> deleteDeviceUsageData(
      {@required String deviceArn, @required String deviceUsageType}) async {
    var response_ = await _client.send('DeleteDeviceUsageData', {
      'DeviceArn': deviceArn,
      'DeviceUsageType': deviceUsageType,
    });
    return DeleteDeviceUsageDataResponse.fromJson(response_);
  }

  /// Deletes a gateway group.
  ///
  /// [gatewayGroupArn]: The ARN of the gateway group to delete.
  Future<DeleteGatewayGroupResponse> deleteGatewayGroup(
      String gatewayGroupArn) async {
    var response_ = await _client.send('DeleteGatewayGroup', {
      'GatewayGroupArn': gatewayGroupArn,
    });
    return DeleteGatewayGroupResponse.fromJson(response_);
  }

  /// Deletes a network profile by the network profile ARN.
  ///
  /// [networkProfileArn]: The ARN of the network profile associated with a
  /// device.
  Future<DeleteNetworkProfileResponse> deleteNetworkProfile(
      String networkProfileArn) async {
    var response_ = await _client.send('DeleteNetworkProfile', {
      'NetworkProfileArn': networkProfileArn,
    });
    return DeleteNetworkProfileResponse.fromJson(response_);
  }

  /// Deletes a room profile by the profile ARN.
  ///
  /// [profileArn]: The ARN of the room profile to delete. Required.
  Future<DeleteProfileResponse> deleteProfile({String profileArn}) async {
    var response_ = await _client.send('DeleteProfile', {
      if (profileArn != null) 'ProfileArn': profileArn,
    });
    return DeleteProfileResponse.fromJson(response_);
  }

  /// Deletes a room by the room ARN.
  ///
  /// [roomArn]: The ARN of the room to delete. Required.
  Future<DeleteRoomResponse> deleteRoom({String roomArn}) async {
    var response_ = await _client.send('DeleteRoom', {
      if (roomArn != null) 'RoomArn': roomArn,
    });
    return DeleteRoomResponse.fromJson(response_);
  }

  /// Deletes room skill parameter details by room, skill, and parameter key ID.
  ///
  /// [roomArn]: The ARN of the room from which to remove the room skill
  /// parameter details.
  ///
  /// [skillId]: The ID of the skill from which to remove the room skill
  /// parameter details.
  ///
  /// [parameterKey]: The room skill parameter key for which to remove details.
  Future<DeleteRoomSkillParameterResponse> deleteRoomSkillParameter(
      {String roomArn,
      @required String skillId,
      @required String parameterKey}) async {
    var response_ = await _client.send('DeleteRoomSkillParameter', {
      if (roomArn != null) 'RoomArn': roomArn,
      'SkillId': skillId,
      'ParameterKey': parameterKey,
    });
    return DeleteRoomSkillParameterResponse.fromJson(response_);
  }

  /// Unlinks a third-party account from a skill.
  ///
  /// [skillId]: The unique identifier of a skill.
  ///
  /// [roomArn]: The room that the skill is authorized for.
  Future<DeleteSkillAuthorizationResponse> deleteSkillAuthorization(
      String skillId,
      {String roomArn}) async {
    var response_ = await _client.send('DeleteSkillAuthorization', {
      'SkillId': skillId,
      if (roomArn != null) 'RoomArn': roomArn,
    });
    return DeleteSkillAuthorizationResponse.fromJson(response_);
  }

  /// Deletes a skill group by skill group ARN.
  ///
  /// [skillGroupArn]: The ARN of the skill group to delete. Required.
  Future<DeleteSkillGroupResponse> deleteSkillGroup(
      {String skillGroupArn}) async {
    var response_ = await _client.send('DeleteSkillGroup', {
      if (skillGroupArn != null) 'SkillGroupArn': skillGroupArn,
    });
    return DeleteSkillGroupResponse.fromJson(response_);
  }

  /// Deletes a specified user by user ARN and enrollment ARN.
  ///
  /// [userArn]: The ARN of the user to delete in the organization. Required.
  ///
  /// [enrollmentId]: The ARN of the user's enrollment in the organization.
  /// Required.
  Future<DeleteUserResponse> deleteUser(String enrollmentId,
      {String userArn}) async {
    var response_ = await _client.send('DeleteUser', {
      if (userArn != null) 'UserArn': userArn,
      'EnrollmentId': enrollmentId,
    });
    return DeleteUserResponse.fromJson(response_);
  }

  /// Disassociates a contact from a given address book.
  ///
  /// [contactArn]: The ARN of the contact to disassociate from an address book.
  ///
  /// [addressBookArn]: The ARN of the address from which to disassociate the
  /// contact.
  Future<DisassociateContactFromAddressBookResponse>
      disassociateContactFromAddressBook(
          {@required String contactArn,
          @required String addressBookArn}) async {
    var response_ = await _client.send('DisassociateContactFromAddressBook', {
      'ContactArn': contactArn,
      'AddressBookArn': addressBookArn,
    });
    return DisassociateContactFromAddressBookResponse.fromJson(response_);
  }

  /// Disassociates a device from its current room. The device continues to be
  /// connected to the Wi-Fi network and is still registered to the account. The
  /// device settings and skills are removed from the room.
  ///
  /// [deviceArn]: The ARN of the device to disassociate from a room. Required.
  Future<DisassociateDeviceFromRoomResponse> disassociateDeviceFromRoom(
      {String deviceArn}) async {
    var response_ = await _client.send('DisassociateDeviceFromRoom', {
      if (deviceArn != null) 'DeviceArn': deviceArn,
    });
    return DisassociateDeviceFromRoomResponse.fromJson(response_);
  }

  /// Disassociates a skill from a skill group.
  ///
  /// [skillGroupArn]: The unique identifier of a skill. Required.
  ///
  /// [skillId]: The ARN of a skill group to associate to a skill.
  Future<DisassociateSkillFromSkillGroupResponse>
      disassociateSkillFromSkillGroup(String skillId,
          {String skillGroupArn}) async {
    var response_ = await _client.send('DisassociateSkillFromSkillGroup', {
      if (skillGroupArn != null) 'SkillGroupArn': skillGroupArn,
      'SkillId': skillId,
    });
    return DisassociateSkillFromSkillGroupResponse.fromJson(response_);
  }

  /// Makes a private skill unavailable for enrolled users and prevents them
  /// from enabling it on their devices.
  ///
  /// [skillId]:  The private skill ID you want to make unavailable for enrolled
  /// users.
  Future<DisassociateSkillFromUsersResponse> disassociateSkillFromUsers(
      String skillId) async {
    var response_ = await _client.send('DisassociateSkillFromUsers', {
      'SkillId': skillId,
    });
    return DisassociateSkillFromUsersResponse.fromJson(response_);
  }

  /// Disassociates a skill group from a specified room. This disables all
  /// skills in the skill group on all devices in the room.
  ///
  /// [skillGroupArn]: The ARN of the skill group to disassociate from a room.
  /// Required.
  ///
  /// [roomArn]: The ARN of the room from which the skill group is to be
  /// disassociated. Required.
  Future<DisassociateSkillGroupFromRoomResponse> disassociateSkillGroupFromRoom(
      {String skillGroupArn, String roomArn}) async {
    var response_ = await _client.send('DisassociateSkillGroupFromRoom', {
      if (skillGroupArn != null) 'SkillGroupArn': skillGroupArn,
      if (roomArn != null) 'RoomArn': roomArn,
    });
    return DisassociateSkillGroupFromRoomResponse.fromJson(response_);
  }

  /// Forgets smart home appliances associated to a room.
  ///
  /// [roomArn]: The room that the appliances are associated with.
  Future<ForgetSmartHomeAppliancesResponse> forgetSmartHomeAppliances(
      String roomArn) async {
    var response_ = await _client.send('ForgetSmartHomeAppliances', {
      'RoomArn': roomArn,
    });
    return ForgetSmartHomeAppliancesResponse.fromJson(response_);
  }

  /// Gets address the book details by the address book ARN.
  ///
  /// [addressBookArn]: The ARN of the address book for which to request
  /// details.
  Future<GetAddressBookResponse> getAddressBook(String addressBookArn) async {
    var response_ = await _client.send('GetAddressBook', {
      'AddressBookArn': addressBookArn,
    });
    return GetAddressBookResponse.fromJson(response_);
  }

  /// Retrieves the existing conference preferences.
  Future<GetConferencePreferenceResponse> getConferencePreference() async {
    var response_ = await _client.send('GetConferencePreference', {});
    return GetConferencePreferenceResponse.fromJson(response_);
  }

  /// Gets details about a specific conference provider.
  ///
  /// [conferenceProviderArn]: The ARN of the newly created conference provider.
  Future<GetConferenceProviderResponse> getConferenceProvider(
      String conferenceProviderArn) async {
    var response_ = await _client.send('GetConferenceProvider', {
      'ConferenceProviderArn': conferenceProviderArn,
    });
    return GetConferenceProviderResponse.fromJson(response_);
  }

  /// Gets the contact details by the contact ARN.
  ///
  /// [contactArn]: The ARN of the contact for which to request details.
  Future<GetContactResponse> getContact(String contactArn) async {
    var response_ = await _client.send('GetContact', {
      'ContactArn': contactArn,
    });
    return GetContactResponse.fromJson(response_);
  }

  /// Gets the details of a device by device ARN.
  ///
  /// [deviceArn]: The ARN of the device for which to request details. Required.
  Future<GetDeviceResponse> getDevice({String deviceArn}) async {
    var response_ = await _client.send('GetDevice', {
      if (deviceArn != null) 'DeviceArn': deviceArn,
    });
    return GetDeviceResponse.fromJson(response_);
  }

  /// Retrieves the details of a gateway.
  ///
  /// [gatewayArn]: The ARN of the gateway to get.
  Future<GetGatewayResponse> getGateway(String gatewayArn) async {
    var response_ = await _client.send('GetGateway', {
      'GatewayArn': gatewayArn,
    });
    return GetGatewayResponse.fromJson(response_);
  }

  /// Retrieves the details of a gateway group.
  ///
  /// [gatewayGroupArn]: The ARN of the gateway group to get.
  Future<GetGatewayGroupResponse> getGatewayGroup(
      String gatewayGroupArn) async {
    var response_ = await _client.send('GetGatewayGroup', {
      'GatewayGroupArn': gatewayGroupArn,
    });
    return GetGatewayGroupResponse.fromJson(response_);
  }

  /// Retrieves the configured values for the user enrollment invitation email
  /// template.
  Future<GetInvitationConfigurationResponse>
      getInvitationConfiguration() async {
    var response_ = await _client.send('GetInvitationConfiguration', {});
    return GetInvitationConfigurationResponse.fromJson(response_);
  }

  /// Gets the network profile details by the network profile ARN.
  ///
  /// [networkProfileArn]: The ARN of the network profile associated with a
  /// device.
  Future<GetNetworkProfileResponse> getNetworkProfile(
      String networkProfileArn) async {
    var response_ = await _client.send('GetNetworkProfile', {
      'NetworkProfileArn': networkProfileArn,
    });
    return GetNetworkProfileResponse.fromJson(response_);
  }

  /// Gets the details of a room profile by profile ARN.
  ///
  /// [profileArn]: The ARN of the room profile for which to request details.
  /// Required.
  Future<GetProfileResponse> getProfile({String profileArn}) async {
    var response_ = await _client.send('GetProfile', {
      if (profileArn != null) 'ProfileArn': profileArn,
    });
    return GetProfileResponse.fromJson(response_);
  }

  /// Gets room details by room ARN.
  ///
  /// [roomArn]: The ARN of the room for which to request details. Required.
  Future<GetRoomResponse> getRoom({String roomArn}) async {
    var response_ = await _client.send('GetRoom', {
      if (roomArn != null) 'RoomArn': roomArn,
    });
    return GetRoomResponse.fromJson(response_);
  }

  /// Gets room skill parameter details by room, skill, and parameter key ARN.
  ///
  /// [roomArn]: The ARN of the room from which to get the room skill parameter
  /// details.
  ///
  /// [skillId]: The ARN of the skill from which to get the room skill parameter
  /// details. Required.
  ///
  /// [parameterKey]: The room skill parameter key for which to get details.
  /// Required.
  Future<GetRoomSkillParameterResponse> getRoomSkillParameter(
      {String roomArn,
      @required String skillId,
      @required String parameterKey}) async {
    var response_ = await _client.send('GetRoomSkillParameter', {
      if (roomArn != null) 'RoomArn': roomArn,
      'SkillId': skillId,
      'ParameterKey': parameterKey,
    });
    return GetRoomSkillParameterResponse.fromJson(response_);
  }

  /// Gets skill group details by skill group ARN.
  ///
  /// [skillGroupArn]: The ARN of the skill group for which to get details.
  /// Required.
  Future<GetSkillGroupResponse> getSkillGroup({String skillGroupArn}) async {
    var response_ = await _client.send('GetSkillGroup', {
      if (skillGroupArn != null) 'SkillGroupArn': skillGroupArn,
    });
    return GetSkillGroupResponse.fromJson(response_);
  }

  /// Lists the details of the schedules that a user configured.
  ///
  /// [nextToken]: The token used to list the remaining schedules from the
  /// previous API call.
  ///
  /// [maxResults]: The maximum number of schedules listed in the call.
  Future<ListBusinessReportSchedulesResponse> listBusinessReportSchedules(
      {String nextToken, int maxResults}) async {
    var response_ = await _client.send('ListBusinessReportSchedules', {
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return ListBusinessReportSchedulesResponse.fromJson(response_);
  }

  /// Lists conference providers under a specific AWS account.
  ///
  /// [nextToken]: The tokens used for pagination.
  ///
  /// [maxResults]: The maximum number of conference providers to be returned,
  /// per paginated calls.
  Future<ListConferenceProvidersResponse> listConferenceProviders(
      {String nextToken, int maxResults}) async {
    var response_ = await _client.send('ListConferenceProviders', {
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return ListConferenceProvidersResponse.fromJson(response_);
  }

  /// Lists the device event history, including device connection status, for up
  /// to 30 days.
  ///
  /// [deviceArn]: The ARN of a device.
  ///
  /// [eventType]: The event type to filter device events. If EventType isn't
  /// specified, this returns a list of all device events in reverse
  /// chronological order. If EventType is specified, this returns a list of
  /// device events for that EventType in reverse chronological order.
  ///
  /// [nextToken]: An optional token returned from a prior request. Use this
  /// token for pagination of results from this action. If this parameter is
  /// specified, the response only includes results beyond the token, up to the
  /// value specified by MaxResults. When the end of results is reached, the
  /// response has a value of null.
  ///
  /// [maxResults]: The maximum number of results to include in the response.
  /// The default value is 50. If more results exist than the specified
  /// MaxResults value, a token is included in the response so that the
  /// remaining results can be retrieved.
  Future<ListDeviceEventsResponse> listDeviceEvents(String deviceArn,
      {String eventType, String nextToken, int maxResults}) async {
    var response_ = await _client.send('ListDeviceEvents', {
      'DeviceArn': deviceArn,
      if (eventType != null) 'EventType': eventType,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return ListDeviceEventsResponse.fromJson(response_);
  }

  /// Retrieves a list of gateway group summaries. Use GetGatewayGroup to
  /// retrieve details of a specific gateway group.
  ///
  /// [nextToken]: The token used to paginate though multiple pages of gateway
  /// group summaries.
  ///
  /// [maxResults]: The maximum number of gateway group summaries to return. The
  /// default is 50.
  Future<ListGatewayGroupsResponse> listGatewayGroups(
      {String nextToken, int maxResults}) async {
    var response_ = await _client.send('ListGatewayGroups', {
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return ListGatewayGroupsResponse.fromJson(response_);
  }

  /// Retrieves a list of gateway summaries. Use GetGateway to retrieve details
  /// of a specific gateway. An optional gateway group ARN can be provided to
  /// only retrieve gateway summaries of gateways that are associated with that
  /// gateway group ARN.
  ///
  /// [gatewayGroupArn]: The gateway group ARN for which to list gateways.
  ///
  /// [nextToken]: The token used to paginate though multiple pages of gateway
  /// summaries.
  ///
  /// [maxResults]: The maximum number of gateway summaries to return. The
  /// default is 50.
  Future<ListGatewaysResponse> listGateways(
      {String gatewayGroupArn, String nextToken, int maxResults}) async {
    var response_ = await _client.send('ListGateways', {
      if (gatewayGroupArn != null) 'GatewayGroupArn': gatewayGroupArn,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return ListGatewaysResponse.fromJson(response_);
  }

  /// Lists all enabled skills in a specific skill group.
  ///
  /// [skillGroupArn]: The ARN of the skill group for which to list enabled
  /// skills. Required.
  ///
  /// [enablementType]: Whether the skill is enabled under the user's account,
  /// or if it requires linking to be used.
  ///
  /// [skillType]: Whether the skill is publicly available or is a private
  /// skill.
  ///
  /// [nextToken]: An optional token returned from a prior request. Use this
  /// token for pagination of results from this action. If this parameter is
  /// specified, the response includes only results beyond the token, up to the
  /// value specified by `MaxResults`. Required.
  ///
  /// [maxResults]: The maximum number of results to include in the response. If
  /// more results exist than the specified `MaxResults` value, a token is
  /// included in the response so that the remaining results can be retrieved.
  /// Required.
  Future<ListSkillsResponse> listSkills(
      {String skillGroupArn,
      String enablementType,
      String skillType,
      String nextToken,
      int maxResults}) async {
    var response_ = await _client.send('ListSkills', {
      if (skillGroupArn != null) 'SkillGroupArn': skillGroupArn,
      if (enablementType != null) 'EnablementType': enablementType,
      if (skillType != null) 'SkillType': skillType,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return ListSkillsResponse.fromJson(response_);
  }

  /// Lists all categories in the Alexa skill store.
  ///
  /// [nextToken]: The tokens used for pagination.
  ///
  /// [maxResults]: The maximum number of categories returned, per paginated
  /// calls.
  Future<ListSkillsStoreCategoriesResponse> listSkillsStoreCategories(
      {String nextToken, int maxResults}) async {
    var response_ = await _client.send('ListSkillsStoreCategories', {
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return ListSkillsStoreCategoriesResponse.fromJson(response_);
  }

  /// Lists all skills in the Alexa skill store by category.
  ///
  /// [categoryId]: The category ID for which the skills are being retrieved
  /// from the skill store.
  ///
  /// [nextToken]: The tokens used for pagination.
  ///
  /// [maxResults]: The maximum number of skills returned per paginated calls.
  Future<ListSkillsStoreSkillsByCategoryResponse>
      listSkillsStoreSkillsByCategory(BigInt categoryId,
          {String nextToken, int maxResults}) async {
    var response_ = await _client.send('ListSkillsStoreSkillsByCategory', {
      'CategoryId': categoryId,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return ListSkillsStoreSkillsByCategoryResponse.fromJson(response_);
  }

  /// Lists all of the smart home appliances associated with a room.
  ///
  /// [roomArn]: The room that the appliances are associated with.
  ///
  /// [maxResults]: The maximum number of appliances to be returned, per
  /// paginated calls.
  ///
  /// [nextToken]: The tokens used for pagination.
  Future<ListSmartHomeAppliancesResponse> listSmartHomeAppliances(
      String roomArn,
      {int maxResults,
      String nextToken}) async {
    var response_ = await _client.send('ListSmartHomeAppliances', {
      'RoomArn': roomArn,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListSmartHomeAppliancesResponse.fromJson(response_);
  }

  /// Lists all tags for the specified resource.
  ///
  /// [arn]: The ARN of the specified resource for which to list tags.
  ///
  /// [nextToken]: An optional token returned from a prior request. Use this
  /// token for pagination of results from this action. If this parameter is
  /// specified, the response includes only results beyond the token, up to the
  /// value specified by `MaxResults`.
  ///
  /// [maxResults]: The maximum number of results to include in the response. If
  /// more results exist than the specified `MaxResults` value, a token is
  /// included in the response so that the remaining results can be retrieved.
  Future<ListTagsResponse> listTags(String arn,
      {String nextToken, int maxResults}) async {
    var response_ = await _client.send('ListTags', {
      'Arn': arn,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return ListTagsResponse.fromJson(response_);
  }

  /// Sets the conference preferences on a specific conference provider at the
  /// account level.
  ///
  /// [conferencePreference]: The conference preference of a specific conference
  /// provider.
  Future<PutConferencePreferenceResponse> putConferencePreference(
      ConferencePreference conferencePreference) async {
    var response_ = await _client.send('PutConferencePreference', {
      'ConferencePreference': conferencePreference,
    });
    return PutConferencePreferenceResponse.fromJson(response_);
  }

  /// Configures the email template for the user enrollment invitation with the
  /// specified attributes.
  ///
  /// [organizationName]: The name of the organization sending the enrollment
  /// invite to a user.
  ///
  /// [contactEmail]: The email ID of the organization or individual contact
  /// that the enrolled user can use.
  ///
  /// [privateSkillIds]: The list of private skill IDs that you want to
  /// recommend to the user to enable in the invitation.
  Future<PutInvitationConfigurationResponse> putInvitationConfiguration(
      String organizationName,
      {String contactEmail,
      List<String> privateSkillIds}) async {
    var response_ = await _client.send('PutInvitationConfiguration', {
      'OrganizationName': organizationName,
      if (contactEmail != null) 'ContactEmail': contactEmail,
      if (privateSkillIds != null) 'PrivateSkillIds': privateSkillIds,
    });
    return PutInvitationConfigurationResponse.fromJson(response_);
  }

  /// Updates room skill parameter details by room, skill, and parameter key ID.
  /// Not all skills have a room skill parameter.
  ///
  /// [roomArn]: The ARN of the room associated with the room skill parameter.
  /// Required.
  ///
  /// [skillId]: The ARN of the skill associated with the room skill parameter.
  /// Required.
  ///
  /// [roomSkillParameter]: The updated room skill parameter. Required.
  Future<PutRoomSkillParameterResponse> putRoomSkillParameter(
      {String roomArn,
      @required String skillId,
      @required RoomSkillParameter roomSkillParameter}) async {
    var response_ = await _client.send('PutRoomSkillParameter', {
      if (roomArn != null) 'RoomArn': roomArn,
      'SkillId': skillId,
      'RoomSkillParameter': roomSkillParameter,
    });
    return PutRoomSkillParameterResponse.fromJson(response_);
  }

  /// Links a user's account to a third-party skill provider. If this API
  /// operation is called by an assumed IAM role, the skill being linked must be
  /// a private skill. Also, the skill must be owned by the AWS account that
  /// assumed the IAM role.
  ///
  /// [authorizationResult]: The authorization result specific to OAUTH code
  /// grant output. "Code” must be populated in the AuthorizationResult map to
  /// establish the authorization.
  ///
  /// [skillId]: The unique identifier of a skill.
  ///
  /// [roomArn]: The room that the skill is authorized for.
  Future<PutSkillAuthorizationResponse> putSkillAuthorization(
      {@required Map<String, String> authorizationResult,
      @required String skillId,
      String roomArn}) async {
    var response_ = await _client.send('PutSkillAuthorization', {
      'AuthorizationResult': authorizationResult,
      'SkillId': skillId,
      if (roomArn != null) 'RoomArn': roomArn,
    });
    return PutSkillAuthorizationResponse.fromJson(response_);
  }

  /// Registers an Alexa-enabled device built by an Original Equipment
  /// Manufacturer (OEM) using Alexa Voice Service (AVS).
  ///
  /// [clientId]: The client ID of the OEM used for code-based linking
  /// authorization on an AVS device.
  ///
  /// [userCode]: The code that is obtained after your AVS device has made a
  /// POST request to LWA as a part of the Device Authorization Request
  /// component of the OAuth code-based linking specification.
  ///
  /// [productId]: The product ID used to identify your AVS device during
  /// authorization.
  ///
  /// [deviceSerialNumber]: The key generated by the OEM that uniquely
  /// identifies a specified instance of your AVS device.
  ///
  /// [amazonId]: The device type ID for your AVS device generated by Amazon
  /// when the OEM creates a new product on Amazon's Developer Console.
  Future<RegisterAvsDeviceResponse> registerAvsDevice(
      {@required String clientId,
      @required String userCode,
      @required String productId,
      @required String deviceSerialNumber,
      @required String amazonId}) async {
    var response_ = await _client.send('RegisterAVSDevice', {
      'ClientId': clientId,
      'UserCode': userCode,
      'ProductId': productId,
      'DeviceSerialNumber': deviceSerialNumber,
      'AmazonId': amazonId,
    });
    return RegisterAvsDeviceResponse.fromJson(response_);
  }

  /// Disassociates a skill from the organization under a user's AWS account. If
  /// the skill is a private skill, it moves to an AcceptStatus of PENDING. Any
  /// private or public skill that is rejected can be added later by calling the
  /// ApproveSkill API.
  ///
  /// [skillId]: The unique identifier of the skill.
  Future<RejectSkillResponse> rejectSkill(String skillId) async {
    var response_ = await _client.send('RejectSkill', {
      'SkillId': skillId,
    });
    return RejectSkillResponse.fromJson(response_);
  }

  /// Determines the details for the room from which a skill request was
  /// invoked. This operation is used by skill developers.
  ///
  /// [userId]: The ARN of the user. Required.
  ///
  /// [skillId]: The ARN of the skill that was requested. Required.
  Future<ResolveRoomResponse> resolveRoom(
      {@required String userId, @required String skillId}) async {
    var response_ = await _client.send('ResolveRoom', {
      'UserId': userId,
      'SkillId': skillId,
    });
    return ResolveRoomResponse.fromJson(response_);
  }

  /// Revokes an invitation and invalidates the enrollment URL.
  ///
  /// [userArn]: The ARN of the user for whom to revoke an enrollment
  /// invitation. Required.
  ///
  /// [enrollmentId]: The ARN of the enrollment invitation to revoke. Required.
  Future<RevokeInvitationResponse> revokeInvitation(
      {String userArn, String enrollmentId}) async {
    var response_ = await _client.send('RevokeInvitation', {
      if (userArn != null) 'UserArn': userArn,
      if (enrollmentId != null) 'EnrollmentId': enrollmentId,
    });
    return RevokeInvitationResponse.fromJson(response_);
  }

  /// Searches address books and lists the ones that meet a set of filter and
  /// sort criteria.
  ///
  /// [filters]: The filters to use to list a specified set of address books.
  /// The supported filter key is AddressBookName.
  ///
  /// [sortCriteria]: The sort order to use in listing the specified set of
  /// address books. The supported sort key is AddressBookName.
  ///
  /// [nextToken]: An optional token returned from a prior request. Use this
  /// token for pagination of results from this action. If this parameter is
  /// specified, the response only includes results beyond the token, up to the
  /// value specified by MaxResults.
  ///
  /// [maxResults]: The maximum number of results to include in the response. If
  /// more results exist than the specified MaxResults value, a token is
  /// included in the response so that the remaining results can be retrieved.
  Future<SearchAddressBooksResponse> searchAddressBooks(
      {List<Filter> filters,
      List<Sort> sortCriteria,
      String nextToken,
      int maxResults}) async {
    var response_ = await _client.send('SearchAddressBooks', {
      if (filters != null) 'Filters': filters,
      if (sortCriteria != null) 'SortCriteria': sortCriteria,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return SearchAddressBooksResponse.fromJson(response_);
  }

  /// Searches contacts and lists the ones that meet a set of filter and sort
  /// criteria.
  ///
  /// [filters]: The filters to use to list a specified set of address books.
  /// The supported filter keys are DisplayName, FirstName, LastName, and
  /// AddressBookArns.
  ///
  /// [sortCriteria]: The sort order to use in listing the specified set of
  /// contacts. The supported sort keys are DisplayName, FirstName, and
  /// LastName.
  ///
  /// [nextToken]: An optional token returned from a prior request. Use this
  /// token for pagination of results from this action. If this parameter is
  /// specified, the response only includes results beyond the token, up to the
  /// value specified by MaxResults.
  ///
  /// [maxResults]: The maximum number of results to include in the response. If
  /// more results exist than the specified MaxResults value, a token is
  /// included in the response so that the remaining results can be retrieved.
  Future<SearchContactsResponse> searchContacts(
      {List<Filter> filters,
      List<Sort> sortCriteria,
      String nextToken,
      int maxResults}) async {
    var response_ = await _client.send('SearchContacts', {
      if (filters != null) 'Filters': filters,
      if (sortCriteria != null) 'SortCriteria': sortCriteria,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return SearchContactsResponse.fromJson(response_);
  }

  /// Searches devices and lists the ones that meet a set of filter criteria.
  ///
  /// [nextToken]: An optional token returned from a prior request. Use this
  /// token for pagination of results from this action. If this parameter is
  /// specified, the response includes only results beyond the token, up to the
  /// value specified by `MaxResults`.
  ///
  /// [maxResults]: The maximum number of results to include in the response. If
  /// more results exist than the specified `MaxResults` value, a token is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// [filters]: The filters to use to list a specified set of devices.
  /// Supported filter keys are DeviceName, DeviceStatus,
  /// DeviceStatusDetailCode, RoomName, DeviceType, DeviceSerialNumber,
  /// UnassociatedOnly, ConnectionStatus (ONLINE and OFFLINE),
  /// NetworkProfileName, NetworkProfileArn, Feature, and FailureCode.
  ///
  /// [sortCriteria]: The sort order to use in listing the specified set of
  /// devices. Supported sort keys are DeviceName, DeviceStatus, RoomName,
  /// DeviceType, DeviceSerialNumber, ConnectionStatus, NetworkProfileName,
  /// NetworkProfileArn, Feature, and FailureCode.
  Future<SearchDevicesResponse> searchDevices(
      {String nextToken,
      int maxResults,
      List<Filter> filters,
      List<Sort> sortCriteria}) async {
    var response_ = await _client.send('SearchDevices', {
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
      if (filters != null) 'Filters': filters,
      if (sortCriteria != null) 'SortCriteria': sortCriteria,
    });
    return SearchDevicesResponse.fromJson(response_);
  }

  /// Searches network profiles and lists the ones that meet a set of filter and
  /// sort criteria.
  ///
  /// [nextToken]: An optional token returned from a prior request. Use this
  /// token for pagination of results from this action. If this parameter is
  /// specified, the response includes only results beyond the token, up to the
  /// value specified by MaxResults.
  ///
  /// [maxResults]: The maximum number of results to include in the response. If
  /// more results exist than the specified MaxResults value, a token is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// [filters]: The filters to use to list a specified set of network profiles.
  /// Valid filters are NetworkProfileName, Ssid, and SecurityType.
  ///
  /// [sortCriteria]: The sort order to use to list the specified set of network
  /// profiles. Valid sort criteria includes NetworkProfileName, Ssid, and
  /// SecurityType.
  Future<SearchNetworkProfilesResponse> searchNetworkProfiles(
      {String nextToken,
      int maxResults,
      List<Filter> filters,
      List<Sort> sortCriteria}) async {
    var response_ = await _client.send('SearchNetworkProfiles', {
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
      if (filters != null) 'Filters': filters,
      if (sortCriteria != null) 'SortCriteria': sortCriteria,
    });
    return SearchNetworkProfilesResponse.fromJson(response_);
  }

  /// Searches room profiles and lists the ones that meet a set of filter
  /// criteria.
  ///
  /// [nextToken]: An optional token returned from a prior request. Use this
  /// token for pagination of results from this action. If this parameter is
  /// specified, the response includes only results beyond the token, up to the
  /// value specified by `MaxResults`.
  ///
  /// [maxResults]: The maximum number of results to include in the response. If
  /// more results exist than the specified `MaxResults` value, a token is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// [filters]: The filters to use to list a specified set of room profiles.
  /// Supported filter keys are ProfileName and Address. Required.
  ///
  /// [sortCriteria]: The sort order to use in listing the specified set of room
  /// profiles. Supported sort keys are ProfileName and Address.
  Future<SearchProfilesResponse> searchProfiles(
      {String nextToken,
      int maxResults,
      List<Filter> filters,
      List<Sort> sortCriteria}) async {
    var response_ = await _client.send('SearchProfiles', {
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
      if (filters != null) 'Filters': filters,
      if (sortCriteria != null) 'SortCriteria': sortCriteria,
    });
    return SearchProfilesResponse.fromJson(response_);
  }

  /// Searches rooms and lists the ones that meet a set of filter and sort
  /// criteria.
  ///
  /// [nextToken]: An optional token returned from a prior request. Use this
  /// token for pagination of results from this action. If this parameter is
  /// specified, the response includes only results beyond the token, up to the
  /// value specified by `MaxResults`.
  ///
  /// [maxResults]: The maximum number of results to include in the response. If
  /// more results exist than the specified `MaxResults` value, a token is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// [filters]: The filters to use to list a specified set of rooms. The
  /// supported filter keys are RoomName and ProfileName.
  ///
  /// [sortCriteria]: The sort order to use in listing the specified set of
  /// rooms. The supported sort keys are RoomName and ProfileName.
  Future<SearchRoomsResponse> searchRooms(
      {String nextToken,
      int maxResults,
      List<Filter> filters,
      List<Sort> sortCriteria}) async {
    var response_ = await _client.send('SearchRooms', {
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
      if (filters != null) 'Filters': filters,
      if (sortCriteria != null) 'SortCriteria': sortCriteria,
    });
    return SearchRoomsResponse.fromJson(response_);
  }

  /// Searches skill groups and lists the ones that meet a set of filter and
  /// sort criteria.
  ///
  /// [nextToken]: An optional token returned from a prior request. Use this
  /// token for pagination of results from this action. If this parameter is
  /// specified, the response includes only results beyond the token, up to the
  /// value specified by `MaxResults`. Required.
  ///
  /// [maxResults]: The maximum number of results to include in the response. If
  /// more results exist than the specified `MaxResults` value, a token is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// [filters]: The filters to use to list a specified set of skill groups. The
  /// supported filter key is SkillGroupName.
  ///
  /// [sortCriteria]: The sort order to use in listing the specified set of
  /// skill groups. The supported sort key is SkillGroupName.
  Future<SearchSkillGroupsResponse> searchSkillGroups(
      {String nextToken,
      int maxResults,
      List<Filter> filters,
      List<Sort> sortCriteria}) async {
    var response_ = await _client.send('SearchSkillGroups', {
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
      if (filters != null) 'Filters': filters,
      if (sortCriteria != null) 'SortCriteria': sortCriteria,
    });
    return SearchSkillGroupsResponse.fromJson(response_);
  }

  /// Searches users and lists the ones that meet a set of filter and sort
  /// criteria.
  ///
  /// [nextToken]: An optional token returned from a prior request. Use this
  /// token for pagination of results from this action. If this parameter is
  /// specified, the response includes only results beyond the token, up to the
  /// value specified by `MaxResults`. Required.
  ///
  /// [maxResults]: The maximum number of results to include in the response. If
  /// more results exist than the specified `MaxResults` value, a token is
  /// included in the response so that the remaining results can be retrieved.
  /// Required.
  ///
  /// [filters]: The filters to use for listing a specific set of users.
  /// Required. Supported filter keys are UserId, FirstName, LastName, Email,
  /// and EnrollmentStatus.
  ///
  /// [sortCriteria]: The sort order to use in listing the filtered set of
  /// users. Required. Supported sort keys are UserId, FirstName, LastName,
  /// Email, and EnrollmentStatus.
  Future<SearchUsersResponse> searchUsers(
      {String nextToken,
      int maxResults,
      List<Filter> filters,
      List<Sort> sortCriteria}) async {
    var response_ = await _client.send('SearchUsers', {
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
      if (filters != null) 'Filters': filters,
      if (sortCriteria != null) 'SortCriteria': sortCriteria,
    });
    return SearchUsersResponse.fromJson(response_);
  }

  /// Triggers an asynchronous flow to send text, SSML, or audio announcements
  /// to rooms that are identified by a search or filter.
  ///
  /// [roomFilters]: The filters to use to send an announcement to a specified
  /// list of rooms. The supported filter keys are RoomName, ProfileName,
  /// RoomArn, and ProfileArn. To send to all rooms, specify an empty
  /// RoomFilters list.
  ///
  /// [content]: The announcement content. This can contain only one of the
  /// three possible announcement types (text, SSML or audio).
  ///
  /// [timeToLiveInSeconds]: The time to live for an announcement. Default is
  /// 300. If delivery doesn't occur within this time, the announcement is not
  /// delivered.
  ///
  /// [clientRequestToken]: The unique, user-specified identifier for the
  /// request that ensures idempotency.
  Future<SendAnnouncementResponse> sendAnnouncement(
      {@required List<Filter> roomFilters,
      @required Content content,
      int timeToLiveInSeconds,
      @required String clientRequestToken}) async {
    var response_ = await _client.send('SendAnnouncement', {
      'RoomFilters': roomFilters,
      'Content': content,
      if (timeToLiveInSeconds != null)
        'TimeToLiveInSeconds': timeToLiveInSeconds,
      'ClientRequestToken': clientRequestToken,
    });
    return SendAnnouncementResponse.fromJson(response_);
  }

  /// Sends an enrollment invitation email with a URL to a user. The URL is
  /// valid for 30 days or until you call this operation again, whichever comes
  /// first.
  ///
  /// [userArn]: The ARN of the user to whom to send an invitation. Required.
  Future<SendInvitationResponse> sendInvitation({String userArn}) async {
    var response_ = await _client.send('SendInvitation', {
      if (userArn != null) 'UserArn': userArn,
    });
    return SendInvitationResponse.fromJson(response_);
  }

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
  ///
  /// [roomArn]: The ARN of the room with which the device to sync is
  /// associated. Required.
  ///
  /// [deviceArn]: The ARN of the device to sync. Required.
  ///
  /// [features]: Request structure to start the device sync. Required.
  Future<StartDeviceSyncResponse> startDeviceSync(List<String> features,
      {String roomArn, String deviceArn}) async {
    var response_ = await _client.send('StartDeviceSync', {
      if (roomArn != null) 'RoomArn': roomArn,
      if (deviceArn != null) 'DeviceArn': deviceArn,
      'Features': features,
    });
    return StartDeviceSyncResponse.fromJson(response_);
  }

  /// Initiates the discovery of any smart home appliances associated with the
  /// room.
  ///
  /// [roomArn]: The room where smart home appliance discovery was initiated.
  Future<StartSmartHomeApplianceDiscoveryResponse>
      startSmartHomeApplianceDiscovery(String roomArn) async {
    var response_ = await _client.send('StartSmartHomeApplianceDiscovery', {
      'RoomArn': roomArn,
    });
    return StartSmartHomeApplianceDiscoveryResponse.fromJson(response_);
  }

  /// Adds metadata tags to a specified resource.
  ///
  /// [arn]: The ARN of the resource to which to add metadata tags. Required.
  ///
  /// [tags]: The tags to be added to the specified resource. Do not provide
  /// system tags. Required.
  Future<TagResourceResponse> tagResource(
      {@required String arn, @required List<Tag> tags}) async {
    var response_ = await _client.send('TagResource', {
      'Arn': arn,
      'Tags': tags,
    });
    return TagResourceResponse.fromJson(response_);
  }

  /// Removes metadata tags from a specified resource.
  ///
  /// [arn]: The ARN of the resource from which to remove metadata tags.
  /// Required.
  ///
  /// [tagKeys]: The tags to be removed from the specified resource. Do not
  /// provide system tags. Required.
  Future<UntagResourceResponse> untagResource(
      {@required String arn, @required List<String> tagKeys}) async {
    var response_ = await _client.send('UntagResource', {
      'Arn': arn,
      'TagKeys': tagKeys,
    });
    return UntagResourceResponse.fromJson(response_);
  }

  /// Updates address book details by the address book ARN.
  ///
  /// [addressBookArn]: The ARN of the room to update.
  ///
  /// [name]: The updated name of the room.
  ///
  /// [description]: The updated description of the room.
  Future<UpdateAddressBookResponse> updateAddressBook(String addressBookArn,
      {String name, String description}) async {
    var response_ = await _client.send('UpdateAddressBook', {
      'AddressBookArn': addressBookArn,
      if (name != null) 'Name': name,
      if (description != null) 'Description': description,
    });
    return UpdateAddressBookResponse.fromJson(response_);
  }

  /// Updates the configuration of the report delivery schedule with the
  /// specified schedule ARN.
  ///
  /// [scheduleArn]: The ARN of the business report schedule.
  ///
  /// [s3BucketName]: The S3 location of the output reports.
  ///
  /// [s3KeyPrefix]: The S3 key where the report is delivered.
  ///
  /// [format]: The format of the generated report (individual CSV files or
  /// zipped files of individual files).
  ///
  /// [scheduleName]: The name identifier of the schedule.
  ///
  /// [recurrence]: The recurrence of the reports.
  Future<UpdateBusinessReportScheduleResponse> updateBusinessReportSchedule(
      String scheduleArn,
      {String s3BucketName,
      String s3KeyPrefix,
      String format,
      String scheduleName,
      BusinessReportRecurrence recurrence}) async {
    var response_ = await _client.send('UpdateBusinessReportSchedule', {
      'ScheduleArn': scheduleArn,
      if (s3BucketName != null) 'S3BucketName': s3BucketName,
      if (s3KeyPrefix != null) 'S3KeyPrefix': s3KeyPrefix,
      if (format != null) 'Format': format,
      if (scheduleName != null) 'ScheduleName': scheduleName,
      if (recurrence != null) 'Recurrence': recurrence,
    });
    return UpdateBusinessReportScheduleResponse.fromJson(response_);
  }

  /// Updates an existing conference provider's settings.
  ///
  /// [conferenceProviderArn]: The ARN of the conference provider.
  ///
  /// [conferenceProviderType]: The type of the conference provider.
  ///
  /// [ipDialIn]: The IP endpoint and protocol for calling.
  ///
  /// [pstnDialIn]: The information for PSTN conferencing.
  ///
  /// [meetingSetting]: The meeting settings for the conference provider.
  Future<UpdateConferenceProviderResponse> updateConferenceProvider(
      {@required String conferenceProviderArn,
      @required String conferenceProviderType,
      IPDialIn ipDialIn,
      PstnDialIn pstnDialIn,
      @required MeetingSetting meetingSetting}) async {
    var response_ = await _client.send('UpdateConferenceProvider', {
      'ConferenceProviderArn': conferenceProviderArn,
      'ConferenceProviderType': conferenceProviderType,
      if (ipDialIn != null) 'IPDialIn': ipDialIn,
      if (pstnDialIn != null) 'PSTNDialIn': pstnDialIn,
      'MeetingSetting': meetingSetting,
    });
    return UpdateConferenceProviderResponse.fromJson(response_);
  }

  /// Updates the contact details by the contact ARN.
  ///
  /// [contactArn]: The ARN of the contact to update.
  ///
  /// [displayName]: The updated display name of the contact.
  ///
  /// [firstName]: The updated first name of the contact.
  ///
  /// [lastName]: The updated last name of the contact.
  ///
  /// [phoneNumber]: The updated phone number of the contact. The phone number
  /// type defaults to WORK. You can either specify PhoneNumber or PhoneNumbers.
  /// We recommend that you use PhoneNumbers, which lets you specify the phone
  /// number type and multiple numbers.
  ///
  /// [phoneNumbers]: The list of phone numbers for the contact.
  ///
  /// [sipAddresses]: The list of SIP addresses for the contact.
  Future<UpdateContactResponse> updateContact(String contactArn,
      {String displayName,
      String firstName,
      String lastName,
      String phoneNumber,
      List<PhoneNumber> phoneNumbers,
      List<SipAddress> sipAddresses}) async {
    var response_ = await _client.send('UpdateContact', {
      'ContactArn': contactArn,
      if (displayName != null) 'DisplayName': displayName,
      if (firstName != null) 'FirstName': firstName,
      if (lastName != null) 'LastName': lastName,
      if (phoneNumber != null) 'PhoneNumber': phoneNumber,
      if (phoneNumbers != null) 'PhoneNumbers': phoneNumbers,
      if (sipAddresses != null) 'SipAddresses': sipAddresses,
    });
    return UpdateContactResponse.fromJson(response_);
  }

  /// Updates the device name by device ARN.
  ///
  /// [deviceArn]: The ARN of the device to update. Required.
  ///
  /// [deviceName]: The updated device name. Required.
  Future<UpdateDeviceResponse> updateDevice(
      {String deviceArn, String deviceName}) async {
    var response_ = await _client.send('UpdateDevice', {
      if (deviceArn != null) 'DeviceArn': deviceArn,
      if (deviceName != null) 'DeviceName': deviceName,
    });
    return UpdateDeviceResponse.fromJson(response_);
  }

  /// Updates the details of a gateway. If any optional field is not provided,
  /// the existing corresponding value is left unmodified.
  ///
  /// [gatewayArn]: The ARN of the gateway to update.
  ///
  /// [name]: The updated name of the gateway.
  ///
  /// [description]: The updated description of the gateway.
  ///
  /// [softwareVersion]: The updated software version of the gateway. The
  /// gateway automatically updates its software version during normal
  /// operation.
  Future<UpdateGatewayResponse> updateGateway(String gatewayArn,
      {String name, String description, String softwareVersion}) async {
    var response_ = await _client.send('UpdateGateway', {
      'GatewayArn': gatewayArn,
      if (name != null) 'Name': name,
      if (description != null) 'Description': description,
      if (softwareVersion != null) 'SoftwareVersion': softwareVersion,
    });
    return UpdateGatewayResponse.fromJson(response_);
  }

  /// Updates the details of a gateway group. If any optional field is not
  /// provided, the existing corresponding value is left unmodified.
  ///
  /// [gatewayGroupArn]: The ARN of the gateway group to update.
  ///
  /// [name]: The updated name of the gateway group.
  ///
  /// [description]: The updated description of the gateway group.
  Future<UpdateGatewayGroupResponse> updateGatewayGroup(String gatewayGroupArn,
      {String name, String description}) async {
    var response_ = await _client.send('UpdateGatewayGroup', {
      'GatewayGroupArn': gatewayGroupArn,
      if (name != null) 'Name': name,
      if (description != null) 'Description': description,
    });
    return UpdateGatewayGroupResponse.fromJson(response_);
  }

  /// Updates a network profile by the network profile ARN.
  ///
  /// [networkProfileArn]: The ARN of the network profile associated with a
  /// device.
  ///
  /// [networkProfileName]: The name of the network profile associated with a
  /// device.
  ///
  /// [description]: Detailed information about a device's network profile.
  ///
  /// [currentPassword]: The current password of the Wi-Fi network.
  ///
  /// [nextPassword]: The next, or subsequent, password of the Wi-Fi network.
  /// This password is asynchronously transmitted to the device and is used when
  /// the password of the network changes to NextPassword.
  ///
  /// [certificateAuthorityArn]: The ARN of the Private Certificate Authority
  /// (PCA) created in AWS Certificate Manager (ACM). This is used to issue
  /// certificates to the devices.
  ///
  /// [trustAnchors]: The root certificate(s) of your authentication server that
  /// will be installed on your devices and used to trust your authentication
  /// server during EAP negotiation.
  Future<UpdateNetworkProfileResponse> updateNetworkProfile(
      String networkProfileArn,
      {String networkProfileName,
      String description,
      String currentPassword,
      String nextPassword,
      String certificateAuthorityArn,
      List<String> trustAnchors}) async {
    var response_ = await _client.send('UpdateNetworkProfile', {
      'NetworkProfileArn': networkProfileArn,
      if (networkProfileName != null) 'NetworkProfileName': networkProfileName,
      if (description != null) 'Description': description,
      if (currentPassword != null) 'CurrentPassword': currentPassword,
      if (nextPassword != null) 'NextPassword': nextPassword,
      if (certificateAuthorityArn != null)
        'CertificateAuthorityArn': certificateAuthorityArn,
      if (trustAnchors != null) 'TrustAnchors': trustAnchors,
    });
    return UpdateNetworkProfileResponse.fromJson(response_);
  }

  /// Updates an existing room profile by room profile ARN.
  ///
  /// [profileArn]: The ARN of the room profile to update. Required.
  ///
  /// [profileName]: The updated name for the room profile.
  ///
  /// [isDefault]: Sets the profile as default if selected. If this is missing,
  /// no update is done to the default status.
  ///
  /// [timezone]: The updated timezone for the room profile.
  ///
  /// [address]: The updated address for the room profile.
  ///
  /// [distanceUnit]: The updated distance unit for the room profile.
  ///
  /// [temperatureUnit]: The updated temperature unit for the room profile.
  ///
  /// [wakeWord]: The updated wake word for the room profile.
  ///
  /// [locale]: The updated locale for the room profile.
  ///
  /// [setupModeDisabled]: Whether the setup mode of the profile is enabled.
  ///
  /// [maxVolumeLimit]: The updated maximum volume limit for the room profile.
  ///
  /// [pstnEnabled]: Whether the PSTN setting of the room profile is enabled.
  Future<UpdateProfileResponse> updateProfile(
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
      bool pstnEnabled}) async {
    var response_ = await _client.send('UpdateProfile', {
      if (profileArn != null) 'ProfileArn': profileArn,
      if (profileName != null) 'ProfileName': profileName,
      if (isDefault != null) 'IsDefault': isDefault,
      if (timezone != null) 'Timezone': timezone,
      if (address != null) 'Address': address,
      if (distanceUnit != null) 'DistanceUnit': distanceUnit,
      if (temperatureUnit != null) 'TemperatureUnit': temperatureUnit,
      if (wakeWord != null) 'WakeWord': wakeWord,
      if (locale != null) 'Locale': locale,
      if (setupModeDisabled != null) 'SetupModeDisabled': setupModeDisabled,
      if (maxVolumeLimit != null) 'MaxVolumeLimit': maxVolumeLimit,
      if (pstnEnabled != null) 'PSTNEnabled': pstnEnabled,
    });
    return UpdateProfileResponse.fromJson(response_);
  }

  /// Updates room details by room ARN.
  ///
  /// [roomArn]: The ARN of the room to update.
  ///
  /// [roomName]: The updated name for the room.
  ///
  /// [description]: The updated description for the room.
  ///
  /// [providerCalendarId]: The updated provider calendar ARN for the room.
  ///
  /// [profileArn]: The updated profile ARN for the room.
  Future<UpdateRoomResponse> updateRoom(
      {String roomArn,
      String roomName,
      String description,
      String providerCalendarId,
      String profileArn}) async {
    var response_ = await _client.send('UpdateRoom', {
      if (roomArn != null) 'RoomArn': roomArn,
      if (roomName != null) 'RoomName': roomName,
      if (description != null) 'Description': description,
      if (providerCalendarId != null) 'ProviderCalendarId': providerCalendarId,
      if (profileArn != null) 'ProfileArn': profileArn,
    });
    return UpdateRoomResponse.fromJson(response_);
  }

  /// Updates skill group details by skill group ARN.
  ///
  /// [skillGroupArn]: The ARN of the skill group to update.
  ///
  /// [skillGroupName]: The updated name for the skill group.
  ///
  /// [description]: The updated description for the skill group.
  Future<UpdateSkillGroupResponse> updateSkillGroup(
      {String skillGroupArn, String skillGroupName, String description}) async {
    var response_ = await _client.send('UpdateSkillGroup', {
      if (skillGroupArn != null) 'SkillGroupArn': skillGroupArn,
      if (skillGroupName != null) 'SkillGroupName': skillGroupName,
      if (description != null) 'Description': description,
    });
    return UpdateSkillGroupResponse.fromJson(response_);
  }
}

/// An address book with attributes.
class AddressBook {
  /// The ARN of the address book.
  final String addressBookArn;

  /// The name of the address book.
  final String name;

  /// The description of the address book.
  final String description;

  AddressBook({
    this.addressBookArn,
    this.name,
    this.description,
  });
  static AddressBook fromJson(Map<String, dynamic> json) => AddressBook(
        addressBookArn: json.containsKey('AddressBookArn')
            ? json['AddressBookArn'] as String
            : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
      );
}

/// Information related to an address book.
class AddressBookData {
  /// The ARN of the address book.
  final String addressBookArn;

  /// The name of the address book.
  final String name;

  /// The description of the address book.
  final String description;

  AddressBookData({
    this.addressBookArn,
    this.name,
    this.description,
  });
  static AddressBookData fromJson(Map<String, dynamic> json) => AddressBookData(
        addressBookArn: json.containsKey('AddressBookArn')
            ? json['AddressBookArn'] as String
            : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
      );
}

class ApproveSkillResponse {
  ApproveSkillResponse();
  static ApproveSkillResponse fromJson(Map<String, dynamic> json) =>
      ApproveSkillResponse();
}

class AssociateContactWithAddressBookResponse {
  AssociateContactWithAddressBookResponse();
  static AssociateContactWithAddressBookResponse fromJson(
          Map<String, dynamic> json) =>
      AssociateContactWithAddressBookResponse();
}

class AssociateDeviceWithNetworkProfileResponse {
  AssociateDeviceWithNetworkProfileResponse();
  static AssociateDeviceWithNetworkProfileResponse fromJson(
          Map<String, dynamic> json) =>
      AssociateDeviceWithNetworkProfileResponse();
}

class AssociateDeviceWithRoomResponse {
  AssociateDeviceWithRoomResponse();
  static AssociateDeviceWithRoomResponse fromJson(Map<String, dynamic> json) =>
      AssociateDeviceWithRoomResponse();
}

class AssociateSkillGroupWithRoomResponse {
  AssociateSkillGroupWithRoomResponse();
  static AssociateSkillGroupWithRoomResponse fromJson(
          Map<String, dynamic> json) =>
      AssociateSkillGroupWithRoomResponse();
}

class AssociateSkillWithSkillGroupResponse {
  AssociateSkillWithSkillGroupResponse();
  static AssociateSkillWithSkillGroupResponse fromJson(
          Map<String, dynamic> json) =>
      AssociateSkillWithSkillGroupResponse();
}

class AssociateSkillWithUsersResponse {
  AssociateSkillWithUsersResponse();
  static AssociateSkillWithUsersResponse fromJson(Map<String, dynamic> json) =>
      AssociateSkillWithUsersResponse();
}

/// The audio message. There is a 1 MB limit on the audio file input and the
/// only supported format is MP3. To convert your MP3 audio files to an
/// Alexa-friendly,
///
/// required codec version (MPEG version 2) and bit rate (48 kbps), you might
/// use converter software. One option for this is a command-line tool, FFmpeg.
/// For more information, see [FFmpeg](https://www.ffmpeg.org/). The following
/// command converts the provided <input-file> to an MP3 file that is played in
/// the announcement:
///
///  `ffmpeg -i <input-file> -ac 2 -codec:a libmp3lame -b:a 48k -ar 16000
/// <output-file.mp3>`
class Audio {
  /// The locale of the audio message. Currently, en-US is supported.
  final String locale;

  /// The location of the audio file. Currently, S3 URLs are supported. Only S3
  /// locations comprised of safe characters are valid. For more information,
  /// see
  /// [Safe Characters](https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingMetadata.html#Safe%20Characters).
  final String location;

  Audio({
    @required this.locale,
    @required this.location,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Usage report with specified parameters.
class BusinessReport {
  /// The status of the report generation execution (RUNNING, SUCCEEDED, or
  /// FAILED).
  final String status;

  /// The failure code.
  final String failureCode;

  /// The S3 location of the output reports.
  final BusinessReportS3Location s3Location;

  /// The time of report delivery.
  final DateTime deliveryTime;

  /// The download link where a user can download the report.
  final String downloadUrl;

  BusinessReport({
    this.status,
    this.failureCode,
    this.s3Location,
    this.deliveryTime,
    this.downloadUrl,
  });
  static BusinessReport fromJson(Map<String, dynamic> json) => BusinessReport(
        status: json.containsKey('Status') ? json['Status'] as String : null,
        failureCode: json.containsKey('FailureCode')
            ? json['FailureCode'] as String
            : null,
        s3Location: json.containsKey('S3Location')
            ? BusinessReportS3Location.fromJson(json['S3Location'])
            : null,
        deliveryTime: json.containsKey('DeliveryTime')
            ? DateTime.parse(json['DeliveryTime'])
            : null,
        downloadUrl: json.containsKey('DownloadUrl')
            ? json['DownloadUrl'] as String
            : null,
      );
}

/// The content range of the report.
class BusinessReportContentRange {
  /// The interval of the content range.
  final String interval;

  BusinessReportContentRange({
    this.interval,
  });
  static BusinessReportContentRange fromJson(Map<String, dynamic> json) =>
      BusinessReportContentRange(
        interval:
            json.containsKey('Interval') ? json['Interval'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The recurrence of the reports.
class BusinessReportRecurrence {
  /// The start date.
  final String startDate;

  BusinessReportRecurrence({
    this.startDate,
  });
  static BusinessReportRecurrence fromJson(Map<String, dynamic> json) =>
      BusinessReportRecurrence(
        startDate:
            json.containsKey('StartDate') ? json['StartDate'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The S3 location of the output reports.
class BusinessReportS3Location {
  /// The path of the business report.
  final String path;

  /// The S3 bucket name of the output reports.
  final String bucketName;

  BusinessReportS3Location({
    this.path,
    this.bucketName,
  });
  static BusinessReportS3Location fromJson(Map<String, dynamic> json) =>
      BusinessReportS3Location(
        path: json.containsKey('Path') ? json['Path'] as String : null,
        bucketName: json.containsKey('BucketName')
            ? json['BucketName'] as String
            : null,
      );
}

/// The schedule of the usage report.
class BusinessReportSchedule {
  /// The ARN of the business report schedule.
  final String scheduleArn;

  /// The name identifier of the schedule.
  final String scheduleName;

  /// The S3 bucket name of the output reports.
  final String s3BucketName;

  /// The S3 key where the report is delivered.
  final String s3KeyPrefix;

  /// The format of the generated report (individual CSV files or zipped files
  /// of individual files).
  final String format;

  /// The content range of the reports.
  final BusinessReportContentRange contentRange;

  /// The recurrence of the reports.
  final BusinessReportRecurrence recurrence;

  /// The details of the last business report delivery for a specified time
  /// interval.
  final BusinessReport lastBusinessReport;

  BusinessReportSchedule({
    this.scheduleArn,
    this.scheduleName,
    this.s3BucketName,
    this.s3KeyPrefix,
    this.format,
    this.contentRange,
    this.recurrence,
    this.lastBusinessReport,
  });
  static BusinessReportSchedule fromJson(Map<String, dynamic> json) =>
      BusinessReportSchedule(
        scheduleArn: json.containsKey('ScheduleArn')
            ? json['ScheduleArn'] as String
            : null,
        scheduleName: json.containsKey('ScheduleName')
            ? json['ScheduleName'] as String
            : null,
        s3BucketName: json.containsKey('S3BucketName')
            ? json['S3BucketName'] as String
            : null,
        s3KeyPrefix: json.containsKey('S3KeyPrefix')
            ? json['S3KeyPrefix'] as String
            : null,
        format: json.containsKey('Format') ? json['Format'] as String : null,
        contentRange: json.containsKey('ContentRange')
            ? BusinessReportContentRange.fromJson(json['ContentRange'])
            : null,
        recurrence: json.containsKey('Recurrence')
            ? BusinessReportRecurrence.fromJson(json['Recurrence'])
            : null,
        lastBusinessReport: json.containsKey('LastBusinessReport')
            ? BusinessReport.fromJson(json['LastBusinessReport'])
            : null,
      );
}

/// The skill store category that is shown. Alexa skills are assigned a specific
/// skill category during creation, such as News, Social, and Sports.
class Category {
  /// The ID of the skill store category.
  final BigInt categoryId;

  /// The name of the skill store category.
  final String categoryName;

  Category({
    this.categoryId,
    this.categoryName,
  });
  static Category fromJson(Map<String, dynamic> json) => Category(
        categoryId: json.containsKey('CategoryId')
            ? BigInt.from(json['CategoryId'])
            : null,
        categoryName: json.containsKey('CategoryName')
            ? json['CategoryName'] as String
            : null,
      );
}

/// The default conference provider that is used if no other scheduled meetings
/// are detected.
class ConferencePreference {
  /// The ARN of the default conference provider.
  final String defaultConferenceProviderArn;

  ConferencePreference({
    this.defaultConferenceProviderArn,
  });
  static ConferencePreference fromJson(Map<String, dynamic> json) =>
      ConferencePreference(
        defaultConferenceProviderArn:
            json.containsKey('DefaultConferenceProviderArn')
                ? json['DefaultConferenceProviderArn'] as String
                : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// An entity that provides a conferencing solution. Alexa for Business acts as
/// the voice interface and mediator that connects users to their preferred
/// conference provider. Examples of conference providers include Amazon Chime,
/// Zoom, Cisco, and Polycom.
class ConferenceProvider {
  /// The ARN of the newly created conference provider.
  final String arn;

  /// The name of the conference provider.
  final String name;

  /// The type of conference providers.
  final String type;

  /// The IP endpoint and protocol for calling.
  final IPDialIn ipDialIn;

  /// The information for PSTN conferencing.
  final PstnDialIn pstnDialIn;

  /// The meeting settings for the conference provider.
  final MeetingSetting meetingSetting;

  ConferenceProvider({
    this.arn,
    this.name,
    this.type,
    this.ipDialIn,
    this.pstnDialIn,
    this.meetingSetting,
  });
  static ConferenceProvider fromJson(Map<String, dynamic> json) =>
      ConferenceProvider(
        arn: json.containsKey('Arn') ? json['Arn'] as String : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        type: json.containsKey('Type') ? json['Type'] as String : null,
        ipDialIn: json.containsKey('IPDialIn')
            ? IPDialIn.fromJson(json['IPDialIn'])
            : null,
        pstnDialIn: json.containsKey('PSTNDialIn')
            ? PstnDialIn.fromJson(json['PSTNDialIn'])
            : null,
        meetingSetting: json.containsKey('MeetingSetting')
            ? MeetingSetting.fromJson(json['MeetingSetting'])
            : null,
      );
}

/// A contact with attributes.
class Contact {
  /// The ARN of the contact.
  final String contactArn;

  /// The name of the contact to display on the console.
  final String displayName;

  /// The first name of the contact, used to call the contact on the device.
  final String firstName;

  /// The last name of the contact, used to call the contact on the device.
  final String lastName;

  /// The phone number of the contact. The phone number type defaults to WORK.
  /// You can either specify PhoneNumber or PhoneNumbers. We recommend that you
  /// use PhoneNumbers, which lets you specify the phone number type and
  /// multiple numbers.
  final String phoneNumber;

  /// The list of phone numbers for the contact.
  final List<PhoneNumber> phoneNumbers;

  /// The list of SIP addresses for the contact.
  final List<SipAddress> sipAddresses;

  Contact({
    this.contactArn,
    this.displayName,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.phoneNumbers,
    this.sipAddresses,
  });
  static Contact fromJson(Map<String, dynamic> json) => Contact(
        contactArn: json.containsKey('ContactArn')
            ? json['ContactArn'] as String
            : null,
        displayName: json.containsKey('DisplayName')
            ? json['DisplayName'] as String
            : null,
        firstName:
            json.containsKey('FirstName') ? json['FirstName'] as String : null,
        lastName:
            json.containsKey('LastName') ? json['LastName'] as String : null,
        phoneNumber: json.containsKey('PhoneNumber')
            ? json['PhoneNumber'] as String
            : null,
        phoneNumbers: json.containsKey('PhoneNumbers')
            ? (json['PhoneNumbers'] as List)
                .map((e) => PhoneNumber.fromJson(e))
                .toList()
            : null,
        sipAddresses: json.containsKey('SipAddresses')
            ? (json['SipAddresses'] as List)
                .map((e) => SipAddress.fromJson(e))
                .toList()
            : null,
      );
}

/// Information related to a contact.
class ContactData {
  /// The ARN of the contact.
  final String contactArn;

  /// The name of the contact to display on the console.
  final String displayName;

  /// The first name of the contact, used to call the contact on the device.
  final String firstName;

  /// The last name of the contact, used to call the contact on the device.
  final String lastName;

  /// The phone number of the contact. The phone number type defaults to WORK.
  /// You can specify PhoneNumber or PhoneNumbers. We recommend that you use
  /// PhoneNumbers, which lets you specify the phone number type and multiple
  /// numbers.
  final String phoneNumber;

  /// The list of phone numbers for the contact.
  final List<PhoneNumber> phoneNumbers;

  /// The list of SIP addresses for the contact.
  final List<SipAddress> sipAddresses;

  ContactData({
    this.contactArn,
    this.displayName,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.phoneNumbers,
    this.sipAddresses,
  });
  static ContactData fromJson(Map<String, dynamic> json) => ContactData(
        contactArn: json.containsKey('ContactArn')
            ? json['ContactArn'] as String
            : null,
        displayName: json.containsKey('DisplayName')
            ? json['DisplayName'] as String
            : null,
        firstName:
            json.containsKey('FirstName') ? json['FirstName'] as String : null,
        lastName:
            json.containsKey('LastName') ? json['LastName'] as String : null,
        phoneNumber: json.containsKey('PhoneNumber')
            ? json['PhoneNumber'] as String
            : null,
        phoneNumbers: json.containsKey('PhoneNumbers')
            ? (json['PhoneNumbers'] as List)
                .map((e) => PhoneNumber.fromJson(e))
                .toList()
            : null,
        sipAddresses: json.containsKey('SipAddresses')
            ? (json['SipAddresses'] as List)
                .map((e) => SipAddress.fromJson(e))
                .toList()
            : null,
      );
}

/// The content definition. This can contain only one text, SSML, or audio list
/// object.
class Content {
  /// The list of text messages.
  final List<Text> textList;

  /// The list of SSML messages.
  final List<Ssml> ssmlList;

  /// The list of audio messages.
  final List<Audio> audioList;

  Content({
    this.textList,
    this.ssmlList,
    this.audioList,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class CreateAddressBookResponse {
  /// The ARN of the newly created address book.
  final String addressBookArn;

  CreateAddressBookResponse({
    this.addressBookArn,
  });
  static CreateAddressBookResponse fromJson(Map<String, dynamic> json) =>
      CreateAddressBookResponse(
        addressBookArn: json.containsKey('AddressBookArn')
            ? json['AddressBookArn'] as String
            : null,
      );
}

class CreateBusinessReportScheduleResponse {
  /// The ARN of the business report schedule.
  final String scheduleArn;

  CreateBusinessReportScheduleResponse({
    this.scheduleArn,
  });
  static CreateBusinessReportScheduleResponse fromJson(
          Map<String, dynamic> json) =>
      CreateBusinessReportScheduleResponse(
        scheduleArn: json.containsKey('ScheduleArn')
            ? json['ScheduleArn'] as String
            : null,
      );
}

class CreateConferenceProviderResponse {
  /// The ARN of the newly-created conference provider.
  final String conferenceProviderArn;

  CreateConferenceProviderResponse({
    this.conferenceProviderArn,
  });
  static CreateConferenceProviderResponse fromJson(Map<String, dynamic> json) =>
      CreateConferenceProviderResponse(
        conferenceProviderArn: json.containsKey('ConferenceProviderArn')
            ? json['ConferenceProviderArn'] as String
            : null,
      );
}

class CreateContactResponse {
  /// The ARN of the newly created address book.
  final String contactArn;

  CreateContactResponse({
    this.contactArn,
  });
  static CreateContactResponse fromJson(Map<String, dynamic> json) =>
      CreateContactResponse(
        contactArn: json.containsKey('ContactArn')
            ? json['ContactArn'] as String
            : null,
      );
}

class CreateGatewayGroupResponse {
  /// The ARN of the created gateway group.
  final String gatewayGroupArn;

  CreateGatewayGroupResponse({
    this.gatewayGroupArn,
  });
  static CreateGatewayGroupResponse fromJson(Map<String, dynamic> json) =>
      CreateGatewayGroupResponse(
        gatewayGroupArn: json.containsKey('GatewayGroupArn')
            ? json['GatewayGroupArn'] as String
            : null,
      );
}

class CreateNetworkProfileResponse {
  /// The ARN of the network profile associated with a device.
  final String networkProfileArn;

  CreateNetworkProfileResponse({
    this.networkProfileArn,
  });
  static CreateNetworkProfileResponse fromJson(Map<String, dynamic> json) =>
      CreateNetworkProfileResponse(
        networkProfileArn: json.containsKey('NetworkProfileArn')
            ? json['NetworkProfileArn'] as String
            : null,
      );
}

class CreateProfileResponse {
  /// The ARN of the newly created room profile in the response.
  final String profileArn;

  CreateProfileResponse({
    this.profileArn,
  });
  static CreateProfileResponse fromJson(Map<String, dynamic> json) =>
      CreateProfileResponse(
        profileArn: json.containsKey('ProfileArn')
            ? json['ProfileArn'] as String
            : null,
      );
}

class CreateRoomResponse {
  /// The ARN of the newly created room in the response.
  final String roomArn;

  CreateRoomResponse({
    this.roomArn,
  });
  static CreateRoomResponse fromJson(Map<String, dynamic> json) =>
      CreateRoomResponse(
        roomArn: json.containsKey('RoomArn') ? json['RoomArn'] as String : null,
      );
}

class CreateSkillGroupResponse {
  /// The ARN of the newly created skill group in the response.
  final String skillGroupArn;

  CreateSkillGroupResponse({
    this.skillGroupArn,
  });
  static CreateSkillGroupResponse fromJson(Map<String, dynamic> json) =>
      CreateSkillGroupResponse(
        skillGroupArn: json.containsKey('SkillGroupArn')
            ? json['SkillGroupArn'] as String
            : null,
      );
}

class CreateUserResponse {
  /// The ARN of the newly created user in the response.
  final String userArn;

  CreateUserResponse({
    this.userArn,
  });
  static CreateUserResponse fromJson(Map<String, dynamic> json) =>
      CreateUserResponse(
        userArn: json.containsKey('UserArn') ? json['UserArn'] as String : null,
      );
}

class DeleteAddressBookResponse {
  DeleteAddressBookResponse();
  static DeleteAddressBookResponse fromJson(Map<String, dynamic> json) =>
      DeleteAddressBookResponse();
}

class DeleteBusinessReportScheduleResponse {
  DeleteBusinessReportScheduleResponse();
  static DeleteBusinessReportScheduleResponse fromJson(
          Map<String, dynamic> json) =>
      DeleteBusinessReportScheduleResponse();
}

class DeleteConferenceProviderResponse {
  DeleteConferenceProviderResponse();
  static DeleteConferenceProviderResponse fromJson(Map<String, dynamic> json) =>
      DeleteConferenceProviderResponse();
}

class DeleteContactResponse {
  DeleteContactResponse();
  static DeleteContactResponse fromJson(Map<String, dynamic> json) =>
      DeleteContactResponse();
}

class DeleteDeviceResponse {
  DeleteDeviceResponse();
  static DeleteDeviceResponse fromJson(Map<String, dynamic> json) =>
      DeleteDeviceResponse();
}

class DeleteDeviceUsageDataResponse {
  DeleteDeviceUsageDataResponse();
  static DeleteDeviceUsageDataResponse fromJson(Map<String, dynamic> json) =>
      DeleteDeviceUsageDataResponse();
}

class DeleteGatewayGroupResponse {
  DeleteGatewayGroupResponse();
  static DeleteGatewayGroupResponse fromJson(Map<String, dynamic> json) =>
      DeleteGatewayGroupResponse();
}

class DeleteNetworkProfileResponse {
  DeleteNetworkProfileResponse();
  static DeleteNetworkProfileResponse fromJson(Map<String, dynamic> json) =>
      DeleteNetworkProfileResponse();
}

class DeleteProfileResponse {
  DeleteProfileResponse();
  static DeleteProfileResponse fromJson(Map<String, dynamic> json) =>
      DeleteProfileResponse();
}

class DeleteRoomResponse {
  DeleteRoomResponse();
  static DeleteRoomResponse fromJson(Map<String, dynamic> json) =>
      DeleteRoomResponse();
}

class DeleteRoomSkillParameterResponse {
  DeleteRoomSkillParameterResponse();
  static DeleteRoomSkillParameterResponse fromJson(Map<String, dynamic> json) =>
      DeleteRoomSkillParameterResponse();
}

class DeleteSkillAuthorizationResponse {
  DeleteSkillAuthorizationResponse();
  static DeleteSkillAuthorizationResponse fromJson(Map<String, dynamic> json) =>
      DeleteSkillAuthorizationResponse();
}

class DeleteSkillGroupResponse {
  DeleteSkillGroupResponse();
  static DeleteSkillGroupResponse fromJson(Map<String, dynamic> json) =>
      DeleteSkillGroupResponse();
}

class DeleteUserResponse {
  DeleteUserResponse();
  static DeleteUserResponse fromJson(Map<String, dynamic> json) =>
      DeleteUserResponse();
}

/// The details about the developer that published the skill.
class DeveloperInfo {
  /// The name of the developer.
  final String developerName;

  /// The URL of the privacy policy.
  final String privacyPolicy;

  /// The email of the developer.
  final String email;

  /// The website of the developer.
  final String url;

  DeveloperInfo({
    this.developerName,
    this.privacyPolicy,
    this.email,
    this.url,
  });
  static DeveloperInfo fromJson(Map<String, dynamic> json) => DeveloperInfo(
        developerName: json.containsKey('DeveloperName')
            ? json['DeveloperName'] as String
            : null,
        privacyPolicy: json.containsKey('PrivacyPolicy')
            ? json['PrivacyPolicy'] as String
            : null,
        email: json.containsKey('Email') ? json['Email'] as String : null,
        url: json.containsKey('Url') ? json['Url'] as String : null,
      );
}

/// A device with attributes.
class Device {
  /// The ARN of a device.
  final String deviceArn;

  /// The serial number of a device.
  final String deviceSerialNumber;

  /// The type of a device.
  final String deviceType;

  /// The name of a device.
  final String deviceName;

  /// The software version of a device.
  final String softwareVersion;

  /// The MAC address of a device.
  final String macAddress;

  /// The room ARN of a device.
  final String roomArn;

  /// The status of a device. If the status is not READY, check the
  /// DeviceStatusInfo value for details.
  final String deviceStatus;

  /// Detailed information about a device's status.
  final DeviceStatusInfo deviceStatusInfo;

  /// Detailed information about a device's network profile.
  final DeviceNetworkProfileInfo networkProfileInfo;

  Device({
    this.deviceArn,
    this.deviceSerialNumber,
    this.deviceType,
    this.deviceName,
    this.softwareVersion,
    this.macAddress,
    this.roomArn,
    this.deviceStatus,
    this.deviceStatusInfo,
    this.networkProfileInfo,
  });
  static Device fromJson(Map<String, dynamic> json) => Device(
        deviceArn:
            json.containsKey('DeviceArn') ? json['DeviceArn'] as String : null,
        deviceSerialNumber: json.containsKey('DeviceSerialNumber')
            ? json['DeviceSerialNumber'] as String
            : null,
        deviceType: json.containsKey('DeviceType')
            ? json['DeviceType'] as String
            : null,
        deviceName: json.containsKey('DeviceName')
            ? json['DeviceName'] as String
            : null,
        softwareVersion: json.containsKey('SoftwareVersion')
            ? json['SoftwareVersion'] as String
            : null,
        macAddress: json.containsKey('MacAddress')
            ? json['MacAddress'] as String
            : null,
        roomArn: json.containsKey('RoomArn') ? json['RoomArn'] as String : null,
        deviceStatus: json.containsKey('DeviceStatus')
            ? json['DeviceStatus'] as String
            : null,
        deviceStatusInfo: json.containsKey('DeviceStatusInfo')
            ? DeviceStatusInfo.fromJson(json['DeviceStatusInfo'])
            : null,
        networkProfileInfo: json.containsKey('NetworkProfileInfo')
            ? DeviceNetworkProfileInfo.fromJson(json['NetworkProfileInfo'])
            : null,
      );
}

/// Device attributes.
class DeviceData {
  /// The ARN of a device.
  final String deviceArn;

  /// The serial number of a device.
  final String deviceSerialNumber;

  /// The type of a device.
  final String deviceType;

  /// The name of a device.
  final String deviceName;

  /// The software version of a device.
  final String softwareVersion;

  /// The MAC address of a device.
  final String macAddress;

  /// The status of a device.
  final String deviceStatus;

  /// The ARN of the network profile associated with a device.
  final String networkProfileArn;

  /// The name of the network profile associated with a device.
  final String networkProfileName;

  /// The room ARN associated with a device.
  final String roomArn;

  /// The name of the room associated with a device.
  final String roomName;

  /// Detailed information about a device's status.
  final DeviceStatusInfo deviceStatusInfo;

  DeviceData({
    this.deviceArn,
    this.deviceSerialNumber,
    this.deviceType,
    this.deviceName,
    this.softwareVersion,
    this.macAddress,
    this.deviceStatus,
    this.networkProfileArn,
    this.networkProfileName,
    this.roomArn,
    this.roomName,
    this.deviceStatusInfo,
  });
  static DeviceData fromJson(Map<String, dynamic> json) => DeviceData(
        deviceArn:
            json.containsKey('DeviceArn') ? json['DeviceArn'] as String : null,
        deviceSerialNumber: json.containsKey('DeviceSerialNumber')
            ? json['DeviceSerialNumber'] as String
            : null,
        deviceType: json.containsKey('DeviceType')
            ? json['DeviceType'] as String
            : null,
        deviceName: json.containsKey('DeviceName')
            ? json['DeviceName'] as String
            : null,
        softwareVersion: json.containsKey('SoftwareVersion')
            ? json['SoftwareVersion'] as String
            : null,
        macAddress: json.containsKey('MacAddress')
            ? json['MacAddress'] as String
            : null,
        deviceStatus: json.containsKey('DeviceStatus')
            ? json['DeviceStatus'] as String
            : null,
        networkProfileArn: json.containsKey('NetworkProfileArn')
            ? json['NetworkProfileArn'] as String
            : null,
        networkProfileName: json.containsKey('NetworkProfileName')
            ? json['NetworkProfileName'] as String
            : null,
        roomArn: json.containsKey('RoomArn') ? json['RoomArn'] as String : null,
        roomName:
            json.containsKey('RoomName') ? json['RoomName'] as String : null,
        deviceStatusInfo: json.containsKey('DeviceStatusInfo')
            ? DeviceStatusInfo.fromJson(json['DeviceStatusInfo'])
            : null,
      );
}

/// The list of device events.
class DeviceEvent {
  /// The type of device event.
  final String type;

  /// The value of the event.
  final String value;

  /// The time (in epoch) when the event occurred.
  final DateTime timestamp;

  DeviceEvent({
    this.type,
    this.value,
    this.timestamp,
  });
  static DeviceEvent fromJson(Map<String, dynamic> json) => DeviceEvent(
        type: json.containsKey('Type') ? json['Type'] as String : null,
        value: json.containsKey('Value') ? json['Value'] as String : null,
        timestamp: json.containsKey('Timestamp')
            ? DateTime.parse(json['Timestamp'])
            : null,
      );
}

/// Detailed information about a device's network profile.
class DeviceNetworkProfileInfo {
  /// The ARN of the network profile associated with a device.
  final String networkProfileArn;

  /// The ARN of the certificate associated with a device.
  final String certificateArn;

  /// The time (in epoch) when the certificate expires.
  final DateTime certificateExpirationTime;

  DeviceNetworkProfileInfo({
    this.networkProfileArn,
    this.certificateArn,
    this.certificateExpirationTime,
  });
  static DeviceNetworkProfileInfo fromJson(Map<String, dynamic> json) =>
      DeviceNetworkProfileInfo(
        networkProfileArn: json.containsKey('NetworkProfileArn')
            ? json['NetworkProfileArn'] as String
            : null,
        certificateArn: json.containsKey('CertificateArn')
            ? json['CertificateArn'] as String
            : null,
        certificateExpirationTime: json.containsKey('CertificateExpirationTime')
            ? DateTime.parse(json['CertificateExpirationTime'])
            : null,
      );
}

/// Details of a device’s status.
class DeviceStatusDetail {
  /// The list of available features on the device.
  final String feature;

  /// The device status detail code.
  final String code;

  DeviceStatusDetail({
    this.feature,
    this.code,
  });
  static DeviceStatusDetail fromJson(Map<String, dynamic> json) =>
      DeviceStatusDetail(
        feature: json.containsKey('Feature') ? json['Feature'] as String : null,
        code: json.containsKey('Code') ? json['Code'] as String : null,
      );
}

/// Detailed information about a device's status.
class DeviceStatusInfo {
  /// One or more device status detail descriptions.
  final List<DeviceStatusDetail> deviceStatusDetails;

  /// The latest available information about the connection status of a device.
  final String connectionStatus;

  DeviceStatusInfo({
    this.deviceStatusDetails,
    this.connectionStatus,
  });
  static DeviceStatusInfo fromJson(Map<String, dynamic> json) =>
      DeviceStatusInfo(
        deviceStatusDetails: json.containsKey('DeviceStatusDetails')
            ? (json['DeviceStatusDetails'] as List)
                .map((e) => DeviceStatusDetail.fromJson(e))
                .toList()
            : null,
        connectionStatus: json.containsKey('ConnectionStatus')
            ? json['ConnectionStatus'] as String
            : null,
      );
}

class DisassociateContactFromAddressBookResponse {
  DisassociateContactFromAddressBookResponse();
  static DisassociateContactFromAddressBookResponse fromJson(
          Map<String, dynamic> json) =>
      DisassociateContactFromAddressBookResponse();
}

class DisassociateDeviceFromRoomResponse {
  DisassociateDeviceFromRoomResponse();
  static DisassociateDeviceFromRoomResponse fromJson(
          Map<String, dynamic> json) =>
      DisassociateDeviceFromRoomResponse();
}

class DisassociateSkillFromSkillGroupResponse {
  DisassociateSkillFromSkillGroupResponse();
  static DisassociateSkillFromSkillGroupResponse fromJson(
          Map<String, dynamic> json) =>
      DisassociateSkillFromSkillGroupResponse();
}

class DisassociateSkillFromUsersResponse {
  DisassociateSkillFromUsersResponse();
  static DisassociateSkillFromUsersResponse fromJson(
          Map<String, dynamic> json) =>
      DisassociateSkillFromUsersResponse();
}

class DisassociateSkillGroupFromRoomResponse {
  DisassociateSkillGroupFromRoomResponse();
  static DisassociateSkillGroupFromRoomResponse fromJson(
          Map<String, dynamic> json) =>
      DisassociateSkillGroupFromRoomResponse();
}

/// A filter name and value pair that is used to return a more specific list of
/// results. Filters can be used to match a set of resources by various
/// criteria.
class Filter {
  /// The key of a filter.
  final String key;

  /// The values of a filter.
  final List<String> values;

  Filter({
    @required this.key,
    @required this.values,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class ForgetSmartHomeAppliancesResponse {
  ForgetSmartHomeAppliancesResponse();
  static ForgetSmartHomeAppliancesResponse fromJson(
          Map<String, dynamic> json) =>
      ForgetSmartHomeAppliancesResponse();
}

/// The details of the gateway.
class Gateway {
  /// The ARN of the gateway.
  final String arn;

  /// The name of the gateway.
  final String name;

  /// The description of the gateway.
  final String description;

  /// The ARN of the gateway group that the gateway is associated to.
  final String gatewayGroupArn;

  /// The software version of the gateway. The gateway automatically updates its
  /// software version during normal operation.
  final String softwareVersion;

  Gateway({
    this.arn,
    this.name,
    this.description,
    this.gatewayGroupArn,
    this.softwareVersion,
  });
  static Gateway fromJson(Map<String, dynamic> json) => Gateway(
        arn: json.containsKey('Arn') ? json['Arn'] as String : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        gatewayGroupArn: json.containsKey('GatewayGroupArn')
            ? json['GatewayGroupArn'] as String
            : null,
        softwareVersion: json.containsKey('SoftwareVersion')
            ? json['SoftwareVersion'] as String
            : null,
      );
}

/// The details of the gateway group.
class GatewayGroup {
  /// The ARN of the gateway group.
  final String arn;

  /// The name of the gateway group.
  final String name;

  /// The description of the gateway group.
  final String description;

  GatewayGroup({
    this.arn,
    this.name,
    this.description,
  });
  static GatewayGroup fromJson(Map<String, dynamic> json) => GatewayGroup(
        arn: json.containsKey('Arn') ? json['Arn'] as String : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
      );
}

/// The summary of a gateway group.
class GatewayGroupSummary {
  /// The ARN of the gateway group.
  final String arn;

  /// The name of the gateway group.
  final String name;

  /// The description of the gateway group.
  final String description;

  GatewayGroupSummary({
    this.arn,
    this.name,
    this.description,
  });
  static GatewayGroupSummary fromJson(Map<String, dynamic> json) =>
      GatewayGroupSummary(
        arn: json.containsKey('Arn') ? json['Arn'] as String : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
      );
}

/// The summary of a gateway.
class GatewaySummary {
  /// The ARN of the gateway.
  final String arn;

  /// The name of the gateway.
  final String name;

  /// The description of the gateway.
  final String description;

  /// The ARN of the gateway group that the gateway is associated to.
  final String gatewayGroupArn;

  /// The software version of the gateway. The gateway automatically updates its
  /// software version during normal operation.
  final String softwareVersion;

  GatewaySummary({
    this.arn,
    this.name,
    this.description,
    this.gatewayGroupArn,
    this.softwareVersion,
  });
  static GatewaySummary fromJson(Map<String, dynamic> json) => GatewaySummary(
        arn: json.containsKey('Arn') ? json['Arn'] as String : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        gatewayGroupArn: json.containsKey('GatewayGroupArn')
            ? json['GatewayGroupArn'] as String
            : null,
        softwareVersion: json.containsKey('SoftwareVersion')
            ? json['SoftwareVersion'] as String
            : null,
      );
}

class GetAddressBookResponse {
  /// The details of the requested address book.
  final AddressBook addressBook;

  GetAddressBookResponse({
    this.addressBook,
  });
  static GetAddressBookResponse fromJson(Map<String, dynamic> json) =>
      GetAddressBookResponse(
        addressBook: json.containsKey('AddressBook')
            ? AddressBook.fromJson(json['AddressBook'])
            : null,
      );
}

class GetConferencePreferenceResponse {
  /// The conference preference.
  final ConferencePreference preference;

  GetConferencePreferenceResponse({
    this.preference,
  });
  static GetConferencePreferenceResponse fromJson(Map<String, dynamic> json) =>
      GetConferencePreferenceResponse(
        preference: json.containsKey('Preference')
            ? ConferencePreference.fromJson(json['Preference'])
            : null,
      );
}

class GetConferenceProviderResponse {
  /// The conference provider.
  final ConferenceProvider conferenceProvider;

  GetConferenceProviderResponse({
    this.conferenceProvider,
  });
  static GetConferenceProviderResponse fromJson(Map<String, dynamic> json) =>
      GetConferenceProviderResponse(
        conferenceProvider: json.containsKey('ConferenceProvider')
            ? ConferenceProvider.fromJson(json['ConferenceProvider'])
            : null,
      );
}

class GetContactResponse {
  /// The details of the requested contact.
  final Contact contact;

  GetContactResponse({
    this.contact,
  });
  static GetContactResponse fromJson(Map<String, dynamic> json) =>
      GetContactResponse(
        contact: json.containsKey('Contact')
            ? Contact.fromJson(json['Contact'])
            : null,
      );
}

class GetDeviceResponse {
  /// The details of the device requested. Required.
  final Device device;

  GetDeviceResponse({
    this.device,
  });
  static GetDeviceResponse fromJson(Map<String, dynamic> json) =>
      GetDeviceResponse(
        device:
            json.containsKey('Device') ? Device.fromJson(json['Device']) : null,
      );
}

class GetGatewayGroupResponse {
  final GatewayGroup gatewayGroup;

  GetGatewayGroupResponse({
    this.gatewayGroup,
  });
  static GetGatewayGroupResponse fromJson(Map<String, dynamic> json) =>
      GetGatewayGroupResponse(
        gatewayGroup: json.containsKey('GatewayGroup')
            ? GatewayGroup.fromJson(json['GatewayGroup'])
            : null,
      );
}

class GetGatewayResponse {
  /// The details of the gateway.
  final Gateway gateway;

  GetGatewayResponse({
    this.gateway,
  });
  static GetGatewayResponse fromJson(Map<String, dynamic> json) =>
      GetGatewayResponse(
        gateway: json.containsKey('Gateway')
            ? Gateway.fromJson(json['Gateway'])
            : null,
      );
}

class GetInvitationConfigurationResponse {
  /// The name of the organization sending the enrollment invite to a user.
  final String organizationName;

  /// The email ID of the organization or individual contact that the enrolled
  /// user can use.
  final String contactEmail;

  /// The list of private skill IDs that you want to recommend to the user to
  /// enable in the invitation.
  final List<String> privateSkillIds;

  GetInvitationConfigurationResponse({
    this.organizationName,
    this.contactEmail,
    this.privateSkillIds,
  });
  static GetInvitationConfigurationResponse fromJson(
          Map<String, dynamic> json) =>
      GetInvitationConfigurationResponse(
        organizationName: json.containsKey('OrganizationName')
            ? json['OrganizationName'] as String
            : null,
        contactEmail: json.containsKey('ContactEmail')
            ? json['ContactEmail'] as String
            : null,
        privateSkillIds: json.containsKey('PrivateSkillIds')
            ? (json['PrivateSkillIds'] as List).map((e) => e as String).toList()
            : null,
      );
}

class GetNetworkProfileResponse {
  /// The network profile associated with a device.
  final NetworkProfile networkProfile;

  GetNetworkProfileResponse({
    this.networkProfile,
  });
  static GetNetworkProfileResponse fromJson(Map<String, dynamic> json) =>
      GetNetworkProfileResponse(
        networkProfile: json.containsKey('NetworkProfile')
            ? NetworkProfile.fromJson(json['NetworkProfile'])
            : null,
      );
}

class GetProfileResponse {
  /// The details of the room profile requested. Required.
  final Profile profile;

  GetProfileResponse({
    this.profile,
  });
  static GetProfileResponse fromJson(Map<String, dynamic> json) =>
      GetProfileResponse(
        profile: json.containsKey('Profile')
            ? Profile.fromJson(json['Profile'])
            : null,
      );
}

class GetRoomResponse {
  /// The details of the room requested.
  final Room room;

  GetRoomResponse({
    this.room,
  });
  static GetRoomResponse fromJson(Map<String, dynamic> json) => GetRoomResponse(
        room: json.containsKey('Room') ? Room.fromJson(json['Room']) : null,
      );
}

class GetRoomSkillParameterResponse {
  /// The details of the room skill parameter requested. Required.
  final RoomSkillParameter roomSkillParameter;

  GetRoomSkillParameterResponse({
    this.roomSkillParameter,
  });
  static GetRoomSkillParameterResponse fromJson(Map<String, dynamic> json) =>
      GetRoomSkillParameterResponse(
        roomSkillParameter: json.containsKey('RoomSkillParameter')
            ? RoomSkillParameter.fromJson(json['RoomSkillParameter'])
            : null,
      );
}

class GetSkillGroupResponse {
  /// The details of the skill group requested. Required.
  final SkillGroup skillGroup;

  GetSkillGroupResponse({
    this.skillGroup,
  });
  static GetSkillGroupResponse fromJson(Map<String, dynamic> json) =>
      GetSkillGroupResponse(
        skillGroup: json.containsKey('SkillGroup')
            ? SkillGroup.fromJson(json['SkillGroup'])
            : null,
      );
}

/// The IP endpoint and protocol for calling.
class IPDialIn {
  /// The IP address.
  final String endpoint;

  /// The protocol, including SIP, SIPS, and H323.
  final String commsProtocol;

  IPDialIn({
    @required this.endpoint,
    @required this.commsProtocol,
  });
  static IPDialIn fromJson(Map<String, dynamic> json) => IPDialIn(
        endpoint: json['Endpoint'] as String,
        commsProtocol: json['CommsProtocol'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class ListBusinessReportSchedulesResponse {
  /// The schedule of the reports.
  final List<BusinessReportSchedule> businessReportSchedules;

  /// The token used to list the remaining schedules from the previous API call.
  final String nextToken;

  ListBusinessReportSchedulesResponse({
    this.businessReportSchedules,
    this.nextToken,
  });
  static ListBusinessReportSchedulesResponse fromJson(
          Map<String, dynamic> json) =>
      ListBusinessReportSchedulesResponse(
        businessReportSchedules: json.containsKey('BusinessReportSchedules')
            ? (json['BusinessReportSchedules'] as List)
                .map((e) => BusinessReportSchedule.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListConferenceProvidersResponse {
  /// The conference providers.
  final List<ConferenceProvider> conferenceProviders;

  /// The tokens used for pagination.
  final String nextToken;

  ListConferenceProvidersResponse({
    this.conferenceProviders,
    this.nextToken,
  });
  static ListConferenceProvidersResponse fromJson(Map<String, dynamic> json) =>
      ListConferenceProvidersResponse(
        conferenceProviders: json.containsKey('ConferenceProviders')
            ? (json['ConferenceProviders'] as List)
                .map((e) => ConferenceProvider.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListDeviceEventsResponse {
  /// The device events requested for the device ARN.
  final List<DeviceEvent> deviceEvents;

  /// The token returned to indicate that there is more data available.
  final String nextToken;

  ListDeviceEventsResponse({
    this.deviceEvents,
    this.nextToken,
  });
  static ListDeviceEventsResponse fromJson(Map<String, dynamic> json) =>
      ListDeviceEventsResponse(
        deviceEvents: json.containsKey('DeviceEvents')
            ? (json['DeviceEvents'] as List)
                .map((e) => DeviceEvent.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListGatewayGroupsResponse {
  /// The gateway groups in the list.
  final List<GatewayGroupSummary> gatewayGroups;

  /// The token used to paginate though multiple pages of gateway group
  /// summaries.
  final String nextToken;

  ListGatewayGroupsResponse({
    this.gatewayGroups,
    this.nextToken,
  });
  static ListGatewayGroupsResponse fromJson(Map<String, dynamic> json) =>
      ListGatewayGroupsResponse(
        gatewayGroups: json.containsKey('GatewayGroups')
            ? (json['GatewayGroups'] as List)
                .map((e) => GatewayGroupSummary.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListGatewaysResponse {
  /// The gateways in the list.
  final List<GatewaySummary> gateways;

  /// The token used to paginate though multiple pages of gateway summaries.
  final String nextToken;

  ListGatewaysResponse({
    this.gateways,
    this.nextToken,
  });
  static ListGatewaysResponse fromJson(Map<String, dynamic> json) =>
      ListGatewaysResponse(
        gateways: json.containsKey('Gateways')
            ? (json['Gateways'] as List)
                .map((e) => GatewaySummary.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListSkillsResponse {
  /// The list of enabled skills requested. Required.
  final List<SkillSummary> skillSummaries;

  /// The token returned to indicate that there is more data available.
  final String nextToken;

  ListSkillsResponse({
    this.skillSummaries,
    this.nextToken,
  });
  static ListSkillsResponse fromJson(Map<String, dynamic> json) =>
      ListSkillsResponse(
        skillSummaries: json.containsKey('SkillSummaries')
            ? (json['SkillSummaries'] as List)
                .map((e) => SkillSummary.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListSkillsStoreCategoriesResponse {
  /// The list of categories.
  final List<Category> categoryList;

  /// The tokens used for pagination.
  final String nextToken;

  ListSkillsStoreCategoriesResponse({
    this.categoryList,
    this.nextToken,
  });
  static ListSkillsStoreCategoriesResponse fromJson(
          Map<String, dynamic> json) =>
      ListSkillsStoreCategoriesResponse(
        categoryList: json.containsKey('CategoryList')
            ? (json['CategoryList'] as List)
                .map((e) => Category.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListSkillsStoreSkillsByCategoryResponse {
  /// The skill store skills.
  final List<SkillsStoreSkill> skillsStoreSkills;

  /// The tokens used for pagination.
  final String nextToken;

  ListSkillsStoreSkillsByCategoryResponse({
    this.skillsStoreSkills,
    this.nextToken,
  });
  static ListSkillsStoreSkillsByCategoryResponse fromJson(
          Map<String, dynamic> json) =>
      ListSkillsStoreSkillsByCategoryResponse(
        skillsStoreSkills: json.containsKey('SkillsStoreSkills')
            ? (json['SkillsStoreSkills'] as List)
                .map((e) => SkillsStoreSkill.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListSmartHomeAppliancesResponse {
  /// The smart home appliances.
  final List<SmartHomeAppliance> smartHomeAppliances;

  /// The tokens used for pagination.
  final String nextToken;

  ListSmartHomeAppliancesResponse({
    this.smartHomeAppliances,
    this.nextToken,
  });
  static ListSmartHomeAppliancesResponse fromJson(Map<String, dynamic> json) =>
      ListSmartHomeAppliancesResponse(
        smartHomeAppliances: json.containsKey('SmartHomeAppliances')
            ? (json['SmartHomeAppliances'] as List)
                .map((e) => SmartHomeAppliance.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListTagsResponse {
  /// The tags requested for the specified resource.
  final List<Tag> tags;

  /// The token returned to indicate that there is more data available.
  final String nextToken;

  ListTagsResponse({
    this.tags,
    this.nextToken,
  });
  static ListTagsResponse fromJson(Map<String, dynamic> json) =>
      ListTagsResponse(
        tags: json.containsKey('Tags')
            ? (json['Tags'] as List).map((e) => Tag.fromJson(e)).toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// The values that indicate whether a pin is always required (YES), never
/// required (NO), or OPTIONAL.
///
/// *   If YES, Alexa will always ask for a meeting pin.
///
/// *   If NO, Alexa will never ask for a meeting pin.
///
/// *   If OPTIONAL, Alexa will ask if you have a meeting pin and if the
/// customer responds with yes, it will ask for the meeting pin.
class MeetingSetting {
  /// The values that indicate whether the pin is always required.
  final String requirePin;

  MeetingSetting({
    @required this.requirePin,
  });
  static MeetingSetting fromJson(Map<String, dynamic> json) => MeetingSetting(
        requirePin: json['RequirePin'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The network profile associated with a device.
class NetworkProfile {
  /// The ARN of the network profile associated with a device.
  final String networkProfileArn;

  /// The name of the network profile associated with a device.
  final String networkProfileName;

  /// Detailed information about a device's network profile.
  final String description;

  /// The SSID of the Wi-Fi network.
  final String ssid;

  /// The security type of the Wi-Fi network. This can be WPA2_ENTERPRISE,
  /// WPA2_PSK, WPA_PSK, WEP, or OPEN.
  final String securityType;

  /// The authentication standard that is used in the EAP framework. Currently,
  /// EAP_TLS is supported.
  final String eapMethod;

  /// The current password of the Wi-Fi network.
  final String currentPassword;

  /// The next, or subsequent, password of the Wi-Fi network. This password is
  /// asynchronously transmitted to the device and is used when the password of
  /// the network changes to NextPassword.
  final String nextPassword;

  /// The ARN of the Private Certificate Authority (PCA) created in AWS
  /// Certificate Manager (ACM). This is used to issue certificates to the
  /// devices.
  final String certificateAuthorityArn;

  /// The root certificates of your authentication server, which is installed on
  /// your devices and used to trust your authentication server during EAP
  /// negotiation.
  final List<String> trustAnchors;

  NetworkProfile({
    this.networkProfileArn,
    this.networkProfileName,
    this.description,
    this.ssid,
    this.securityType,
    this.eapMethod,
    this.currentPassword,
    this.nextPassword,
    this.certificateAuthorityArn,
    this.trustAnchors,
  });
  static NetworkProfile fromJson(Map<String, dynamic> json) => NetworkProfile(
        networkProfileArn: json.containsKey('NetworkProfileArn')
            ? json['NetworkProfileArn'] as String
            : null,
        networkProfileName: json.containsKey('NetworkProfileName')
            ? json['NetworkProfileName'] as String
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        ssid: json.containsKey('Ssid') ? json['Ssid'] as String : null,
        securityType: json.containsKey('SecurityType')
            ? json['SecurityType'] as String
            : null,
        eapMethod:
            json.containsKey('EapMethod') ? json['EapMethod'] as String : null,
        currentPassword: json.containsKey('CurrentPassword')
            ? json['CurrentPassword'] as String
            : null,
        nextPassword: json.containsKey('NextPassword')
            ? json['NextPassword'] as String
            : null,
        certificateAuthorityArn: json.containsKey('CertificateAuthorityArn')
            ? json['CertificateAuthorityArn'] as String
            : null,
        trustAnchors: json.containsKey('TrustAnchors')
            ? (json['TrustAnchors'] as List).map((e) => e as String).toList()
            : null,
      );
}

/// The data associated with a network profile.
class NetworkProfileData {
  /// The ARN of the network profile associated with a device.
  final String networkProfileArn;

  /// The name of the network profile associated with a device.
  final String networkProfileName;

  /// Detailed information about a device's network profile.
  final String description;

  /// The SSID of the Wi-Fi network.
  final String ssid;

  /// The security type of the Wi-Fi network. This can be WPA2_ENTERPRISE,
  /// WPA2_PSK, WPA_PSK, WEP, or OPEN.
  final String securityType;

  /// The authentication standard that is used in the EAP framework. Currently,
  /// EAP_TLS is supported.
  final String eapMethod;

  /// The ARN of the Private Certificate Authority (PCA) created in AWS
  /// Certificate Manager (ACM). This is used to issue certificates to the
  /// devices.
  final String certificateAuthorityArn;

  NetworkProfileData({
    this.networkProfileArn,
    this.networkProfileName,
    this.description,
    this.ssid,
    this.securityType,
    this.eapMethod,
    this.certificateAuthorityArn,
  });
  static NetworkProfileData fromJson(Map<String, dynamic> json) =>
      NetworkProfileData(
        networkProfileArn: json.containsKey('NetworkProfileArn')
            ? json['NetworkProfileArn'] as String
            : null,
        networkProfileName: json.containsKey('NetworkProfileName')
            ? json['NetworkProfileName'] as String
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        ssid: json.containsKey('Ssid') ? json['Ssid'] as String : null,
        securityType: json.containsKey('SecurityType')
            ? json['SecurityType'] as String
            : null,
        eapMethod:
            json.containsKey('EapMethod') ? json['EapMethod'] as String : null,
        certificateAuthorityArn: json.containsKey('CertificateAuthorityArn')
            ? json['CertificateAuthorityArn'] as String
            : null,
      );
}

/// The information for public switched telephone network (PSTN) conferencing.
class PstnDialIn {
  /// The zip code.
  final String countryCode;

  /// The phone number to call to join the conference.
  final String phoneNumber;

  /// The delay duration before Alexa enters the conference ID with dual-tone
  /// multi-frequency (DTMF). Each number on the dial pad corresponds to a DTMF
  /// tone, which is how we send data over the telephone network.
  final String oneClickIdDelay;

  /// The delay duration before Alexa enters the conference pin with dual-tone
  /// multi-frequency (DTMF). Each number on the dial pad corresponds to a DTMF
  /// tone, which is how we send data over the telephone network.
  final String oneClickPinDelay;

  PstnDialIn({
    @required this.countryCode,
    @required this.phoneNumber,
    @required this.oneClickIdDelay,
    @required this.oneClickPinDelay,
  });
  static PstnDialIn fromJson(Map<String, dynamic> json) => PstnDialIn(
        countryCode: json['CountryCode'] as String,
        phoneNumber: json['PhoneNumber'] as String,
        oneClickIdDelay: json['OneClickIdDelay'] as String,
        oneClickPinDelay: json['OneClickPinDelay'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The phone number for the contact containing the raw number and phone number
/// type.
class PhoneNumber {
  /// The raw value of the phone number.
  final String number;

  /// The type of the phone number.
  final String type;

  PhoneNumber({
    @required this.number,
    @required this.type,
  });
  static PhoneNumber fromJson(Map<String, dynamic> json) => PhoneNumber(
        number: json['Number'] as String,
        type: json['Type'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A room profile with attributes.
class Profile {
  /// The ARN of a room profile.
  final String profileArn;

  /// The name of a room profile.
  final String profileName;

  /// Retrieves if the profile is default or not.
  final bool isDefault;

  /// The address of a room profile.
  final String address;

  /// The time zone of a room profile.
  final String timezone;

  /// The distance unit of a room profile.
  final String distanceUnit;

  /// The temperature unit of a room profile.
  final String temperatureUnit;

  /// The wake word of a room profile.
  final String wakeWord;

  /// The locale of a room profile.
  final String locale;

  /// The setup mode of a room profile.
  final bool setupModeDisabled;

  /// The max volume limit of a room profile.
  final int maxVolumeLimit;

  /// The PSTN setting of a room profile.
  final bool pstnEnabled;

  /// The ARN of the address book.
  final String addressBookArn;

  Profile({
    this.profileArn,
    this.profileName,
    this.isDefault,
    this.address,
    this.timezone,
    this.distanceUnit,
    this.temperatureUnit,
    this.wakeWord,
    this.locale,
    this.setupModeDisabled,
    this.maxVolumeLimit,
    this.pstnEnabled,
    this.addressBookArn,
  });
  static Profile fromJson(Map<String, dynamic> json) => Profile(
        profileArn: json.containsKey('ProfileArn')
            ? json['ProfileArn'] as String
            : null,
        profileName: json.containsKey('ProfileName')
            ? json['ProfileName'] as String
            : null,
        isDefault:
            json.containsKey('IsDefault') ? json['IsDefault'] as bool : null,
        address: json.containsKey('Address') ? json['Address'] as String : null,
        timezone:
            json.containsKey('Timezone') ? json['Timezone'] as String : null,
        distanceUnit: json.containsKey('DistanceUnit')
            ? json['DistanceUnit'] as String
            : null,
        temperatureUnit: json.containsKey('TemperatureUnit')
            ? json['TemperatureUnit'] as String
            : null,
        wakeWord:
            json.containsKey('WakeWord') ? json['WakeWord'] as String : null,
        locale: json.containsKey('Locale') ? json['Locale'] as String : null,
        setupModeDisabled: json.containsKey('SetupModeDisabled')
            ? json['SetupModeDisabled'] as bool
            : null,
        maxVolumeLimit: json.containsKey('MaxVolumeLimit')
            ? json['MaxVolumeLimit'] as int
            : null,
        pstnEnabled: json.containsKey('PSTNEnabled')
            ? json['PSTNEnabled'] as bool
            : null,
        addressBookArn: json.containsKey('AddressBookArn')
            ? json['AddressBookArn'] as String
            : null,
      );
}

/// The data of a room profile.
class ProfileData {
  /// The ARN of a room profile.
  final String profileArn;

  /// The name of a room profile.
  final String profileName;

  /// Retrieves if the profile data is default or not.
  final bool isDefault;

  /// The address of a room profile.
  final String address;

  /// The timezone of a room profile.
  final String timezone;

  /// The distance unit of a room profile.
  final String distanceUnit;

  /// The temperature unit of a room profile.
  final String temperatureUnit;

  /// The wake word of a room profile.
  final String wakeWord;

  /// The locale of a room profile.
  final String locale;

  ProfileData({
    this.profileArn,
    this.profileName,
    this.isDefault,
    this.address,
    this.timezone,
    this.distanceUnit,
    this.temperatureUnit,
    this.wakeWord,
    this.locale,
  });
  static ProfileData fromJson(Map<String, dynamic> json) => ProfileData(
        profileArn: json.containsKey('ProfileArn')
            ? json['ProfileArn'] as String
            : null,
        profileName: json.containsKey('ProfileName')
            ? json['ProfileName'] as String
            : null,
        isDefault:
            json.containsKey('IsDefault') ? json['IsDefault'] as bool : null,
        address: json.containsKey('Address') ? json['Address'] as String : null,
        timezone:
            json.containsKey('Timezone') ? json['Timezone'] as String : null,
        distanceUnit: json.containsKey('DistanceUnit')
            ? json['DistanceUnit'] as String
            : null,
        temperatureUnit: json.containsKey('TemperatureUnit')
            ? json['TemperatureUnit'] as String
            : null,
        wakeWord:
            json.containsKey('WakeWord') ? json['WakeWord'] as String : null,
        locale: json.containsKey('Locale') ? json['Locale'] as String : null,
      );
}

class PutConferencePreferenceResponse {
  PutConferencePreferenceResponse();
  static PutConferencePreferenceResponse fromJson(Map<String, dynamic> json) =>
      PutConferencePreferenceResponse();
}

class PutInvitationConfigurationResponse {
  PutInvitationConfigurationResponse();
  static PutInvitationConfigurationResponse fromJson(
          Map<String, dynamic> json) =>
      PutInvitationConfigurationResponse();
}

class PutRoomSkillParameterResponse {
  PutRoomSkillParameterResponse();
  static PutRoomSkillParameterResponse fromJson(Map<String, dynamic> json) =>
      PutRoomSkillParameterResponse();
}

class PutSkillAuthorizationResponse {
  PutSkillAuthorizationResponse();
  static PutSkillAuthorizationResponse fromJson(Map<String, dynamic> json) =>
      PutSkillAuthorizationResponse();
}

class RegisterAvsDeviceResponse {
  /// The ARN of the device.
  final String deviceArn;

  RegisterAvsDeviceResponse({
    this.deviceArn,
  });
  static RegisterAvsDeviceResponse fromJson(Map<String, dynamic> json) =>
      RegisterAvsDeviceResponse(
        deviceArn:
            json.containsKey('DeviceArn') ? json['DeviceArn'] as String : null,
      );
}

class RejectSkillResponse {
  RejectSkillResponse();
  static RejectSkillResponse fromJson(Map<String, dynamic> json) =>
      RejectSkillResponse();
}

class ResolveRoomResponse {
  /// The ARN of the room from which the skill request was invoked.
  final String roomArn;

  /// The name of the room from which the skill request was invoked.
  final String roomName;

  /// Response to get the room profile request. Required.
  final List<RoomSkillParameter> roomSkillParameters;

  ResolveRoomResponse({
    this.roomArn,
    this.roomName,
    this.roomSkillParameters,
  });
  static ResolveRoomResponse fromJson(Map<String, dynamic> json) =>
      ResolveRoomResponse(
        roomArn: json.containsKey('RoomArn') ? json['RoomArn'] as String : null,
        roomName:
            json.containsKey('RoomName') ? json['RoomName'] as String : null,
        roomSkillParameters: json.containsKey('RoomSkillParameters')
            ? (json['RoomSkillParameters'] as List)
                .map((e) => RoomSkillParameter.fromJson(e))
                .toList()
            : null,
      );
}

class RevokeInvitationResponse {
  RevokeInvitationResponse();
  static RevokeInvitationResponse fromJson(Map<String, dynamic> json) =>
      RevokeInvitationResponse();
}

/// A room with attributes.
class Room {
  /// The ARN of a room.
  final String roomArn;

  /// The name of a room.
  final String roomName;

  /// The description of a room.
  final String description;

  /// The provider calendar ARN of a room.
  final String providerCalendarId;

  /// The profile ARN of a room.
  final String profileArn;

  Room({
    this.roomArn,
    this.roomName,
    this.description,
    this.providerCalendarId,
    this.profileArn,
  });
  static Room fromJson(Map<String, dynamic> json) => Room(
        roomArn: json.containsKey('RoomArn') ? json['RoomArn'] as String : null,
        roomName:
            json.containsKey('RoomName') ? json['RoomName'] as String : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        providerCalendarId: json.containsKey('ProviderCalendarId')
            ? json['ProviderCalendarId'] as String
            : null,
        profileArn: json.containsKey('ProfileArn')
            ? json['ProfileArn'] as String
            : null,
      );
}

/// The data of a room.
class RoomData {
  /// The ARN of a room.
  final String roomArn;

  /// The name of a room.
  final String roomName;

  /// The description of a room.
  final String description;

  /// The provider calendar ARN of a room.
  final String providerCalendarId;

  /// The profile ARN of a room.
  final String profileArn;

  /// The profile name of a room.
  final String profileName;

  RoomData({
    this.roomArn,
    this.roomName,
    this.description,
    this.providerCalendarId,
    this.profileArn,
    this.profileName,
  });
  static RoomData fromJson(Map<String, dynamic> json) => RoomData(
        roomArn: json.containsKey('RoomArn') ? json['RoomArn'] as String : null,
        roomName:
            json.containsKey('RoomName') ? json['RoomName'] as String : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        providerCalendarId: json.containsKey('ProviderCalendarId')
            ? json['ProviderCalendarId'] as String
            : null,
        profileArn: json.containsKey('ProfileArn')
            ? json['ProfileArn'] as String
            : null,
        profileName: json.containsKey('ProfileName')
            ? json['ProfileName'] as String
            : null,
      );
}

/// A skill parameter associated with a room.
class RoomSkillParameter {
  /// The parameter key of a room skill parameter. ParameterKey is an enumerated
  /// type that only takes “DEFAULT” or “SCOPE” as valid values.
  final String parameterKey;

  /// The parameter value of a room skill parameter.
  final String parameterValue;

  RoomSkillParameter({
    @required this.parameterKey,
    @required this.parameterValue,
  });
  static RoomSkillParameter fromJson(Map<String, dynamic> json) =>
      RoomSkillParameter(
        parameterKey: json['ParameterKey'] as String,
        parameterValue: json['ParameterValue'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class SearchAddressBooksResponse {
  /// The address books that meet the specified set of filter criteria, in sort
  /// order.
  final List<AddressBookData> addressBooks;

  /// The token returned to indicate that there is more data available.
  final String nextToken;

  /// The total number of address books returned.
  final int totalCount;

  SearchAddressBooksResponse({
    this.addressBooks,
    this.nextToken,
    this.totalCount,
  });
  static SearchAddressBooksResponse fromJson(Map<String, dynamic> json) =>
      SearchAddressBooksResponse(
        addressBooks: json.containsKey('AddressBooks')
            ? (json['AddressBooks'] as List)
                .map((e) => AddressBookData.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
        totalCount:
            json.containsKey('TotalCount') ? json['TotalCount'] as int : null,
      );
}

class SearchContactsResponse {
  /// The contacts that meet the specified set of filter criteria, in sort
  /// order.
  final List<ContactData> contacts;

  /// The token returned to indicate that there is more data available.
  final String nextToken;

  /// The total number of contacts returned.
  final int totalCount;

  SearchContactsResponse({
    this.contacts,
    this.nextToken,
    this.totalCount,
  });
  static SearchContactsResponse fromJson(Map<String, dynamic> json) =>
      SearchContactsResponse(
        contacts: json.containsKey('Contacts')
            ? (json['Contacts'] as List)
                .map((e) => ContactData.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
        totalCount:
            json.containsKey('TotalCount') ? json['TotalCount'] as int : null,
      );
}

class SearchDevicesResponse {
  /// The devices that meet the specified set of filter criteria, in sort order.
  final List<DeviceData> devices;

  /// The token returned to indicate that there is more data available.
  final String nextToken;

  /// The total number of devices returned.
  final int totalCount;

  SearchDevicesResponse({
    this.devices,
    this.nextToken,
    this.totalCount,
  });
  static SearchDevicesResponse fromJson(Map<String, dynamic> json) =>
      SearchDevicesResponse(
        devices: json.containsKey('Devices')
            ? (json['Devices'] as List)
                .map((e) => DeviceData.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
        totalCount:
            json.containsKey('TotalCount') ? json['TotalCount'] as int : null,
      );
}

class SearchNetworkProfilesResponse {
  /// The network profiles that meet the specified set of filter criteria, in
  /// sort order. It is a list of NetworkProfileData objects.
  final List<NetworkProfileData> networkProfiles;

  /// An optional token returned from a prior request. Use this token for
  /// pagination of results from this action. If this parameter is specified,
  /// the response includes only results beyond the token, up to the value
  /// specified by MaxResults.
  final String nextToken;

  /// The total number of network profiles returned.
  final int totalCount;

  SearchNetworkProfilesResponse({
    this.networkProfiles,
    this.nextToken,
    this.totalCount,
  });
  static SearchNetworkProfilesResponse fromJson(Map<String, dynamic> json) =>
      SearchNetworkProfilesResponse(
        networkProfiles: json.containsKey('NetworkProfiles')
            ? (json['NetworkProfiles'] as List)
                .map((e) => NetworkProfileData.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
        totalCount:
            json.containsKey('TotalCount') ? json['TotalCount'] as int : null,
      );
}

class SearchProfilesResponse {
  /// The profiles that meet the specified set of filter criteria, in sort
  /// order.
  final List<ProfileData> profiles;

  /// The token returned to indicate that there is more data available.
  final String nextToken;

  /// The total number of room profiles returned.
  final int totalCount;

  SearchProfilesResponse({
    this.profiles,
    this.nextToken,
    this.totalCount,
  });
  static SearchProfilesResponse fromJson(Map<String, dynamic> json) =>
      SearchProfilesResponse(
        profiles: json.containsKey('Profiles')
            ? (json['Profiles'] as List)
                .map((e) => ProfileData.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
        totalCount:
            json.containsKey('TotalCount') ? json['TotalCount'] as int : null,
      );
}

class SearchRoomsResponse {
  /// The rooms that meet the specified set of filter criteria, in sort order.
  final List<RoomData> rooms;

  /// The token returned to indicate that there is more data available.
  final String nextToken;

  /// The total number of rooms returned.
  final int totalCount;

  SearchRoomsResponse({
    this.rooms,
    this.nextToken,
    this.totalCount,
  });
  static SearchRoomsResponse fromJson(Map<String, dynamic> json) =>
      SearchRoomsResponse(
        rooms: json.containsKey('Rooms')
            ? (json['Rooms'] as List).map((e) => RoomData.fromJson(e)).toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
        totalCount:
            json.containsKey('TotalCount') ? json['TotalCount'] as int : null,
      );
}

class SearchSkillGroupsResponse {
  /// The skill groups that meet the filter criteria, in sort order.
  final List<SkillGroupData> skillGroups;

  /// The token returned to indicate that there is more data available.
  final String nextToken;

  /// The total number of skill groups returned.
  final int totalCount;

  SearchSkillGroupsResponse({
    this.skillGroups,
    this.nextToken,
    this.totalCount,
  });
  static SearchSkillGroupsResponse fromJson(Map<String, dynamic> json) =>
      SearchSkillGroupsResponse(
        skillGroups: json.containsKey('SkillGroups')
            ? (json['SkillGroups'] as List)
                .map((e) => SkillGroupData.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
        totalCount:
            json.containsKey('TotalCount') ? json['TotalCount'] as int : null,
      );
}

class SearchUsersResponse {
  /// The users that meet the specified set of filter criteria, in sort order.
  final List<UserData> users;

  /// The token returned to indicate that there is more data available.
  final String nextToken;

  /// The total number of users returned.
  final int totalCount;

  SearchUsersResponse({
    this.users,
    this.nextToken,
    this.totalCount,
  });
  static SearchUsersResponse fromJson(Map<String, dynamic> json) =>
      SearchUsersResponse(
        users: json.containsKey('Users')
            ? (json['Users'] as List).map((e) => UserData.fromJson(e)).toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
        totalCount:
            json.containsKey('TotalCount') ? json['TotalCount'] as int : null,
      );
}

class SendAnnouncementResponse {
  /// The identifier of the announcement.
  final String announcementArn;

  SendAnnouncementResponse({
    this.announcementArn,
  });
  static SendAnnouncementResponse fromJson(Map<String, dynamic> json) =>
      SendAnnouncementResponse(
        announcementArn: json.containsKey('AnnouncementArn')
            ? json['AnnouncementArn'] as String
            : null,
      );
}

class SendInvitationResponse {
  SendInvitationResponse();
  static SendInvitationResponse fromJson(Map<String, dynamic> json) =>
      SendInvitationResponse();
}

/// The SIP address for the contact containing the URI and SIP address type.
class SipAddress {
  /// The URI for the SIP address.
  final String uri;

  /// The type of the SIP address.
  final String type;

  SipAddress({
    @required this.uri,
    @required this.type,
  });
  static SipAddress fromJson(Map<String, dynamic> json) => SipAddress(
        uri: json['Uri'] as String,
        type: json['Type'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Granular information about the skill.
class SkillDetails {
  /// The description of the product.
  final String productDescription;

  /// The phrase used to trigger the skill.
  final String invocationPhrase;

  /// The date when the skill was released.
  final String releaseDate;

  /// The URL of the end user license agreement.
  final String endUserLicenseAgreement;

  /// The generic keywords associated with the skill that can be used to find a
  /// skill.
  final List<String> genericKeywords;

  /// The details about what the skill supports organized as bullet points.
  final List<String> bulletPoints;

  /// The updates added in bullet points.
  final List<String> newInThisVersionBulletPoints;

  /// The types of skills.
  final List<String> skillTypes;

  /// The list of reviews for the skill, including Key and Value pair.
  final Map<String, String> reviews;

  /// The details about the developer that published the skill.
  final DeveloperInfo developerInfo;

  SkillDetails({
    this.productDescription,
    this.invocationPhrase,
    this.releaseDate,
    this.endUserLicenseAgreement,
    this.genericKeywords,
    this.bulletPoints,
    this.newInThisVersionBulletPoints,
    this.skillTypes,
    this.reviews,
    this.developerInfo,
  });
  static SkillDetails fromJson(Map<String, dynamic> json) => SkillDetails(
        productDescription: json.containsKey('ProductDescription')
            ? json['ProductDescription'] as String
            : null,
        invocationPhrase: json.containsKey('InvocationPhrase')
            ? json['InvocationPhrase'] as String
            : null,
        releaseDate: json.containsKey('ReleaseDate')
            ? json['ReleaseDate'] as String
            : null,
        endUserLicenseAgreement: json.containsKey('EndUserLicenseAgreement')
            ? json['EndUserLicenseAgreement'] as String
            : null,
        genericKeywords: json.containsKey('GenericKeywords')
            ? (json['GenericKeywords'] as List).map((e) => e as String).toList()
            : null,
        bulletPoints: json.containsKey('BulletPoints')
            ? (json['BulletPoints'] as List).map((e) => e as String).toList()
            : null,
        newInThisVersionBulletPoints:
            json.containsKey('NewInThisVersionBulletPoints')
                ? (json['NewInThisVersionBulletPoints'] as List)
                    .map((e) => e as String)
                    .toList()
                : null,
        skillTypes: json.containsKey('SkillTypes')
            ? (json['SkillTypes'] as List).map((e) => e as String).toList()
            : null,
        reviews: json.containsKey('Reviews')
            ? (json['Reviews'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        developerInfo: json.containsKey('DeveloperInfo')
            ? DeveloperInfo.fromJson(json['DeveloperInfo'])
            : null,
      );
}

/// A skill group with attributes.
class SkillGroup {
  /// The ARN of a skill group.
  final String skillGroupArn;

  /// The name of a skill group.
  final String skillGroupName;

  /// The description of a skill group.
  final String description;

  SkillGroup({
    this.skillGroupArn,
    this.skillGroupName,
    this.description,
  });
  static SkillGroup fromJson(Map<String, dynamic> json) => SkillGroup(
        skillGroupArn: json.containsKey('SkillGroupArn')
            ? json['SkillGroupArn'] as String
            : null,
        skillGroupName: json.containsKey('SkillGroupName')
            ? json['SkillGroupName'] as String
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
      );
}

/// The attributes of a skill group.
class SkillGroupData {
  /// The skill group ARN of a skill group.
  final String skillGroupArn;

  /// The skill group name of a skill group.
  final String skillGroupName;

  /// The description of a skill group.
  final String description;

  SkillGroupData({
    this.skillGroupArn,
    this.skillGroupName,
    this.description,
  });
  static SkillGroupData fromJson(Map<String, dynamic> json) => SkillGroupData(
        skillGroupArn: json.containsKey('SkillGroupArn')
            ? json['SkillGroupArn'] as String
            : null,
        skillGroupName: json.containsKey('SkillGroupName')
            ? json['SkillGroupName'] as String
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
      );
}

/// The summary of skills.
class SkillSummary {
  /// The ARN of the skill summary.
  final String skillId;

  /// The name of the skill.
  final String skillName;

  /// Linking support for a skill.
  final bool supportsLinking;

  /// Whether the skill is enabled under the user's account, or if it requires
  /// linking to be used.
  final String enablementType;

  /// Whether the skill is publicly available or is a private skill.
  final String skillType;

  SkillSummary({
    this.skillId,
    this.skillName,
    this.supportsLinking,
    this.enablementType,
    this.skillType,
  });
  static SkillSummary fromJson(Map<String, dynamic> json) => SkillSummary(
        skillId: json.containsKey('SkillId') ? json['SkillId'] as String : null,
        skillName:
            json.containsKey('SkillName') ? json['SkillName'] as String : null,
        supportsLinking: json.containsKey('SupportsLinking')
            ? json['SupportsLinking'] as bool
            : null,
        enablementType: json.containsKey('EnablementType')
            ? json['EnablementType'] as String
            : null,
        skillType:
            json.containsKey('SkillType') ? json['SkillType'] as String : null,
      );
}

/// The detailed information about an Alexa skill.
class SkillsStoreSkill {
  /// The ARN of the skill.
  final String skillId;

  /// The name of the skill.
  final String skillName;

  /// Short description about the skill.
  final String shortDescription;

  /// The URL where the skill icon resides.
  final String iconUrl;

  /// Sample utterances that interact with the skill.
  final List<String> sampleUtterances;

  /// Information about the skill.
  final SkillDetails skillDetails;

  /// Linking support for a skill.
  final bool supportsLinking;

  SkillsStoreSkill({
    this.skillId,
    this.skillName,
    this.shortDescription,
    this.iconUrl,
    this.sampleUtterances,
    this.skillDetails,
    this.supportsLinking,
  });
  static SkillsStoreSkill fromJson(Map<String, dynamic> json) =>
      SkillsStoreSkill(
        skillId: json.containsKey('SkillId') ? json['SkillId'] as String : null,
        skillName:
            json.containsKey('SkillName') ? json['SkillName'] as String : null,
        shortDescription: json.containsKey('ShortDescription')
            ? json['ShortDescription'] as String
            : null,
        iconUrl: json.containsKey('IconUrl') ? json['IconUrl'] as String : null,
        sampleUtterances: json.containsKey('SampleUtterances')
            ? (json['SampleUtterances'] as List)
                .map((e) => e as String)
                .toList()
            : null,
        skillDetails: json.containsKey('SkillDetails')
            ? SkillDetails.fromJson(json['SkillDetails'])
            : null,
        supportsLinking: json.containsKey('SupportsLinking')
            ? json['SupportsLinking'] as bool
            : null,
      );
}

/// A smart home appliance that can connect to a central system. Any domestic
/// device can be a smart appliance.
class SmartHomeAppliance {
  /// The friendly name of the smart home appliance.
  final String friendlyName;

  /// The description of the smart home appliance.
  final String description;

  /// The name of the manufacturer of the smart home appliance.
  final String manufacturerName;

  SmartHomeAppliance({
    this.friendlyName,
    this.description,
    this.manufacturerName,
  });
  static SmartHomeAppliance fromJson(Map<String, dynamic> json) =>
      SmartHomeAppliance(
        friendlyName: json.containsKey('FriendlyName')
            ? json['FriendlyName'] as String
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        manufacturerName: json.containsKey('ManufacturerName')
            ? json['ManufacturerName'] as String
            : null,
      );
}

/// An object representing a sort criteria.
class Sort {
  /// The sort key of a sort object.
  final String key;

  /// The sort value of a sort object.
  final String value;

  Sort({
    @required this.key,
    @required this.value,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The SSML message. For more information, see
/// [SSML Reference](https://developer.amazon.com/docs/custom-skills/speech-synthesis-markup-language-ssml-reference.html).
class Ssml {
  /// The locale of the SSML message. Currently, en-US is supported.
  final String locale;

  /// The value of the SSML message in the correct SSML format. The audio tag is
  /// not supported.
  final String value;

  Ssml({
    @required this.locale,
    @required this.value,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class StartDeviceSyncResponse {
  StartDeviceSyncResponse();
  static StartDeviceSyncResponse fromJson(Map<String, dynamic> json) =>
      StartDeviceSyncResponse();
}

class StartSmartHomeApplianceDiscoveryResponse {
  StartSmartHomeApplianceDiscoveryResponse();
  static StartSmartHomeApplianceDiscoveryResponse fromJson(
          Map<String, dynamic> json) =>
      StartSmartHomeApplianceDiscoveryResponse();
}

/// A key-value pair that can be associated with a resource.
class Tag {
  /// The key of a tag. Tag keys are case-sensitive.
  final String key;

  /// The value of a tag. Tag values are case-sensitive and can be null.
  final String value;

  Tag({
    @required this.key,
    @required this.value,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag(
        key: json['Key'] as String,
        value: json['Value'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class TagResourceResponse {
  TagResourceResponse();
  static TagResourceResponse fromJson(Map<String, dynamic> json) =>
      TagResourceResponse();
}

/// The text message.
class Text {
  /// The locale of the text message. Currently, en-US is supported.
  final String locale;

  /// The value of the text message.
  final String value;

  Text({
    @required this.locale,
    @required this.value,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class UntagResourceResponse {
  UntagResourceResponse();
  static UntagResourceResponse fromJson(Map<String, dynamic> json) =>
      UntagResourceResponse();
}

class UpdateAddressBookResponse {
  UpdateAddressBookResponse();
  static UpdateAddressBookResponse fromJson(Map<String, dynamic> json) =>
      UpdateAddressBookResponse();
}

class UpdateBusinessReportScheduleResponse {
  UpdateBusinessReportScheduleResponse();
  static UpdateBusinessReportScheduleResponse fromJson(
          Map<String, dynamic> json) =>
      UpdateBusinessReportScheduleResponse();
}

class UpdateConferenceProviderResponse {
  UpdateConferenceProviderResponse();
  static UpdateConferenceProviderResponse fromJson(Map<String, dynamic> json) =>
      UpdateConferenceProviderResponse();
}

class UpdateContactResponse {
  UpdateContactResponse();
  static UpdateContactResponse fromJson(Map<String, dynamic> json) =>
      UpdateContactResponse();
}

class UpdateDeviceResponse {
  UpdateDeviceResponse();
  static UpdateDeviceResponse fromJson(Map<String, dynamic> json) =>
      UpdateDeviceResponse();
}

class UpdateGatewayGroupResponse {
  UpdateGatewayGroupResponse();
  static UpdateGatewayGroupResponse fromJson(Map<String, dynamic> json) =>
      UpdateGatewayGroupResponse();
}

class UpdateGatewayResponse {
  UpdateGatewayResponse();
  static UpdateGatewayResponse fromJson(Map<String, dynamic> json) =>
      UpdateGatewayResponse();
}

class UpdateNetworkProfileResponse {
  UpdateNetworkProfileResponse();
  static UpdateNetworkProfileResponse fromJson(Map<String, dynamic> json) =>
      UpdateNetworkProfileResponse();
}

class UpdateProfileResponse {
  UpdateProfileResponse();
  static UpdateProfileResponse fromJson(Map<String, dynamic> json) =>
      UpdateProfileResponse();
}

class UpdateRoomResponse {
  UpdateRoomResponse();
  static UpdateRoomResponse fromJson(Map<String, dynamic> json) =>
      UpdateRoomResponse();
}

class UpdateSkillGroupResponse {
  UpdateSkillGroupResponse();
  static UpdateSkillGroupResponse fromJson(Map<String, dynamic> json) =>
      UpdateSkillGroupResponse();
}

/// Information related to a user.
class UserData {
  /// The ARN of a user.
  final String userArn;

  /// The first name of a user.
  final String firstName;

  /// The last name of a user.
  final String lastName;

  /// The email of a user.
  final String email;

  /// The enrollment status of a user.
  final String enrollmentStatus;

  /// The enrollment ARN of a user.
  final String enrollmentId;

  UserData({
    this.userArn,
    this.firstName,
    this.lastName,
    this.email,
    this.enrollmentStatus,
    this.enrollmentId,
  });
  static UserData fromJson(Map<String, dynamic> json) => UserData(
        userArn: json.containsKey('UserArn') ? json['UserArn'] as String : null,
        firstName:
            json.containsKey('FirstName') ? json['FirstName'] as String : null,
        lastName:
            json.containsKey('LastName') ? json['LastName'] as String : null,
        email: json.containsKey('Email') ? json['Email'] as String : null,
        enrollmentStatus: json.containsKey('EnrollmentStatus')
            ? json['EnrollmentStatus'] as String
            : null,
        enrollmentId: json.containsKey('EnrollmentId')
            ? json['EnrollmentId'] as String
            : null,
      );
}
