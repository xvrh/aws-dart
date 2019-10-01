import 'package:meta/meta.dart';

/// The Amazon Chime API (application programming interface) is designed for
/// administrators to use to perform key tasks, such as creating and managing
/// Amazon Chime accounts and users. This guide provides detailed information
/// about the Amazon Chime API, including operations, types, inputs and outputs,
/// and error codes.
///
/// You can use an AWS SDK, the AWS Command Line Interface (AWS CLI), or the
/// REST API to make API calls. We recommend using an AWS SDK or the AWS CLI.
/// Each API operation includes links to information about using it with a
/// language-specific AWS SDK or the AWS CLI.
///
/// Using an AWS SDK
///
/// You don't need to write code to calculate a signature for request
/// authentication. The SDK clients authenticate your requests by using access
/// keys that you provide. For more information about AWS SDKs, see the
/// [AWS Developer Center](http://aws.amazon.com/developer/).
///
/// Using the AWS CLI
///
/// Use your access keys with the AWS CLI to make API calls. For information
/// about setting up the AWS CLI, see
/// [Installing the AWS Command Line Interface](https://docs.aws.amazon.com/cli/latest/userguide/installing.html)
/// in the _AWS Command Line Interface User Guide_. For a list of available
/// Amazon Chime commands, see the
/// [Amazon Chime commands](https://docs.aws.amazon.com/cli/latest/reference/chime/index.html)
/// in the _AWS CLI Command Reference_.
///
/// Using REST API
///
/// If you use REST to make API calls, you must authenticate your request by
/// providing a signature. Amazon Chime supports signature version 4. For more
/// information, see
/// [Signature Version 4 Signing Process](https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html)
/// in the _Amazon Web Services General Reference_.
///
/// When making REST API calls, use the service name `chime` and REST endpoint
/// `https://service.chime.aws.amazon.com`.
///
/// Administrative permissions are controlled using AWS Identity and Access
/// Management (IAM). For more information, see
/// [Control Access to the Amazon Chime Console](https://docs.aws.amazon.com/chime/latest/ag/control-access.html)
/// in the _Amazon Chime Administration Guide_.
class ChimeApi {
  /// Associates a phone number with the specified Amazon Chime user.
  ///
  /// [accountId]: The Amazon Chime account ID.
  ///
  /// [userId]: The user ID.
  ///
  /// [e164PhoneNumber]: The phone number, in E.164 format.
  Future<AssociatePhoneNumberWithUserResponse> associatePhoneNumberWithUser(
      {@required String accountId,
      @required String userId,
      @required String e164PhoneNumber}) async {
    return AssociatePhoneNumberWithUserResponse.fromJson({});
  }

  /// Associates a phone number with the specified Amazon Chime Voice Connector.
  ///
  /// [voiceConnectorId]: The Amazon Chime Voice Connector ID.
  ///
  /// [e164PhoneNumbers]: List of phone numbers, in E.164 format.
  Future<AssociatePhoneNumbersWithVoiceConnectorResponse>
      associatePhoneNumbersWithVoiceConnector(String voiceConnectorId,
          {List<String> e164PhoneNumbers}) async {
    return AssociatePhoneNumbersWithVoiceConnectorResponse.fromJson({});
  }

  /// Moves phone numbers into the **Deletion queue**. Phone numbers must be
  /// disassociated from any users or Amazon Chime Voice Connectors before they
  /// can be deleted.
  ///
  /// Phone numbers remain in the **Deletion queue** for 7 days before they are
  /// deleted permanently.
  ///
  /// [phoneNumberIds]: List of phone number IDs.
  Future<BatchDeletePhoneNumberResponse> batchDeletePhoneNumber(
      List<String> phoneNumberIds) async {
    return BatchDeletePhoneNumberResponse.fromJson({});
  }

  /// Suspends up to 50 users from a `Team` or `EnterpriseLWA` Amazon Chime
  /// account. For more information about different account types, see
  /// [Managing Your Amazon Chime Accounts](https://docs.aws.amazon.com/chime/latest/ag/manage-chime-account.html)
  /// in the _Amazon Chime Administration Guide_.
  ///
  /// Users suspended from a `Team` account are dissasociated from the account,
  /// but they can continue to use Amazon Chime as free users. To remove the
  /// suspension from suspended `Team` account users, invite them to the `Team`
  /// account again. You can use the InviteUsers action to do so.
  ///
  /// Users suspended from an `EnterpriseLWA` account are immediately signed out
  /// of Amazon Chime and can no longer sign in. To remove the suspension from
  /// suspended `EnterpriseLWA` account users, use the BatchUnsuspendUser
  /// action.
  ///
  /// To sign out users without suspending them, use the LogoutUser action.
  ///
  /// [accountId]: The Amazon Chime account ID.
  ///
  /// [userIdList]: The request containing the user IDs to suspend.
  Future<BatchSuspendUserResponse> batchSuspendUser(
      {@required String accountId, @required List<String> userIdList}) async {
    return BatchSuspendUserResponse.fromJson({});
  }

  /// Removes the suspension from up to 50 previously suspended users for the
  /// specified Amazon Chime `EnterpriseLWA` account. Only users on
  /// `EnterpriseLWA` accounts can be unsuspended using this action. For more
  /// information about different account types, see
  /// [Managing Your Amazon Chime Accounts](https://docs.aws.amazon.com/chime/latest/ag/manage-chime-account.html)
  /// in the _Amazon Chime Administration Guide_.
  ///
  /// Previously suspended users who are unsuspended using this action are
  /// returned to `Registered` status. Users who are not previously suspended
  /// are ignored.
  ///
  /// [accountId]: The Amazon Chime account ID.
  ///
  /// [userIdList]: The request containing the user IDs to unsuspend.
  Future<BatchUnsuspendUserResponse> batchUnsuspendUser(
      {@required String accountId, @required List<String> userIdList}) async {
    return BatchUnsuspendUserResponse.fromJson({});
  }

  /// Updates phone number product types. Choose from Amazon Chime Business
  /// Calling and Amazon Chime Voice Connector product types. For toll-free
  /// numbers, you can use only the Amazon Chime Voice Connector product type.
  ///
  /// [updatePhoneNumberRequestItems]: The request containing the phone number
  /// IDs and product types to update.
  Future<BatchUpdatePhoneNumberResponse> batchUpdatePhoneNumber(
      List<UpdatePhoneNumberRequestItem> updatePhoneNumberRequestItems) async {
    return BatchUpdatePhoneNumberResponse.fromJson({});
  }

  /// Updates user details within the UpdateUserRequestItem object for up to 20
  /// users for the specified Amazon Chime account. Currently, only
  /// `LicenseType` updates are supported for this action.
  ///
  /// [accountId]: The Amazon Chime account ID.
  ///
  /// [updateUserRequestItems]: The request containing the user IDs and details
  /// to update.
  Future<BatchUpdateUserResponse> batchUpdateUser(
      {@required String accountId,
      @required List<UpdateUserRequestItem> updateUserRequestItems}) async {
    return BatchUpdateUserResponse.fromJson({});
  }

  /// Creates an Amazon Chime account under the administrator's AWS account.
  /// Only `Team` account types are currently supported for this action. For
  /// more information about different account types, see
  /// [Managing Your Amazon Chime Accounts](https://docs.aws.amazon.com/chime/latest/ag/manage-chime-account.html)
  /// in the _Amazon Chime Administration Guide_.
  ///
  /// [name]: The name of the Amazon Chime account.
  Future<CreateAccountResponse> createAccount(String name) async {
    return CreateAccountResponse.fromJson({});
  }

  /// Creates a bot for an Amazon Chime Enterprise account.
  ///
  /// [accountId]: The Amazon Chime account ID.
  ///
  /// [displayName]: The bot display name.
  ///
  /// [domain]: The domain of the Amazon Chime Enterprise account.
  Future<CreateBotResponse> createBot(
      {@required String accountId,
      @required String displayName,
      String domain}) async {
    return CreateBotResponse.fromJson({});
  }

  /// Creates an order for phone numbers to be provisioned. Choose from Amazon
  /// Chime Business Calling and Amazon Chime Voice Connector product types. For
  /// toll-free numbers, you can use only the Amazon Chime Voice Connector
  /// product type.
  ///
  /// [productType]: The phone number product type.
  ///
  /// [e164PhoneNumbers]: List of phone numbers, in E.164 format.
  Future<CreatePhoneNumberOrderResponse> createPhoneNumberOrder(
      {@required String productType,
      @required List<String> e164PhoneNumbers}) async {
    return CreatePhoneNumberOrderResponse.fromJson({});
  }

  /// Creates an Amazon Chime Voice Connector under the administrator's AWS
  /// account. Enabling CreateVoiceConnectorRequest$RequireEncryption configures
  /// your Amazon Chime Voice Connector to use TLS transport for SIP signaling
  /// and Secure RTP (SRTP) for media. Inbound calls use TLS transport, and
  /// unencrypted outbound calls are blocked.
  ///
  /// [name]: The name of the Amazon Chime Voice Connector.
  ///
  /// [requireEncryption]: When enabled, requires encryption for the Amazon
  /// Chime Voice Connector.
  Future<CreateVoiceConnectorResponse> createVoiceConnector(
      {@required String name, @required bool requireEncryption}) async {
    return CreateVoiceConnectorResponse.fromJson({});
  }

  /// Deletes the specified Amazon Chime account. You must suspend all users
  /// before deleting a `Team` account. You can use the BatchSuspendUser action
  /// to do so.
  ///
  /// For `EnterpriseLWA` and `EnterpriseAD` accounts, you must release the
  /// claimed domains for your Amazon Chime account before deletion. As soon as
  /// you release the domain, all users under that account are suspended.
  ///
  /// Deleted accounts appear in your `Disabled` accounts list for 90 days. To
  /// restore a deleted account from your `Disabled` accounts list, you must
  /// contact AWS Support.
  ///
  /// After 90 days, deleted accounts are permanently removed from your
  /// `Disabled` accounts list.
  ///
  /// [accountId]: The Amazon Chime account ID.
  Future<DeleteAccountResponse> deleteAccount(String accountId) async {
    return DeleteAccountResponse.fromJson({});
  }

  /// Deletes the events configuration that allows a bot to receive outgoing
  /// events.
  ///
  /// [accountId]: The Amazon Chime account ID.
  ///
  /// [botId]: The bot ID.
  Future<void> deleteEventsConfiguration(
      {@required String accountId, @required String botId}) async {}

  /// Moves the specified phone number into the **Deletion queue**. A phone
  /// number must be disassociated from any users or Amazon Chime Voice
  /// Connectors before it can be deleted.
  ///
  /// Deleted phone numbers remain in the **Deletion queue** for 7 days before
  /// they are deleted permanently.
  ///
  /// [phoneNumberId]: The phone number ID.
  Future<void> deletePhoneNumber(String phoneNumberId) async {}

  /// Deletes the specified Amazon Chime Voice Connector. Any phone numbers
  /// assigned to the Amazon Chime Voice Connector must be unassigned from it
  /// before it can be deleted.
  ///
  /// [voiceConnectorId]: The Amazon Chime Voice Connector ID.
  Future<void> deleteVoiceConnector(String voiceConnectorId) async {}

  /// Deletes the origination settings for the specified Amazon Chime Voice
  /// Connector.
  ///
  /// [voiceConnectorId]: The Amazon Chime Voice Connector ID.
  Future<void> deleteVoiceConnectorOrigination(String voiceConnectorId) async {}

  /// Deletes the termination settings for the specified Amazon Chime Voice
  /// Connector.
  ///
  /// [voiceConnectorId]: The Amazon Chime Voice Connector ID.
  Future<void> deleteVoiceConnectorTermination(String voiceConnectorId) async {}

  /// Deletes the specified SIP credentials used by your equipment to
  /// authenticate during call termination.
  ///
  /// [voiceConnectorId]: The Amazon Chime Voice Connector ID.
  ///
  /// [usernames]: The RFC2617 compliant username associated with the SIP
  /// credentials, in US-ASCII format.
  Future<void> deleteVoiceConnectorTerminationCredentials(
      String voiceConnectorId,
      {List<String> usernames}) async {}

  /// Disassociates the primary provisioned phone number from the specified
  /// Amazon Chime user.
  ///
  /// [accountId]: The Amazon Chime account ID.
  ///
  /// [userId]: The user ID.
  Future<DisassociatePhoneNumberFromUserResponse>
      disassociatePhoneNumberFromUser(
          {@required String accountId, @required String userId}) async {
    return DisassociatePhoneNumberFromUserResponse.fromJson({});
  }

  /// Disassociates the specified phone number from the specified Amazon Chime
  /// Voice Connector.
  ///
  /// [voiceConnectorId]: The Amazon Chime Voice Connector ID.
  ///
  /// [e164PhoneNumbers]: List of phone numbers, in E.164 format.
  Future<DisassociatePhoneNumbersFromVoiceConnectorResponse>
      disassociatePhoneNumbersFromVoiceConnector(String voiceConnectorId,
          {List<String> e164PhoneNumbers}) async {
    return DisassociatePhoneNumbersFromVoiceConnectorResponse.fromJson({});
  }

  /// Retrieves details for the specified Amazon Chime account, such as account
  /// type and supported licenses.
  ///
  /// [accountId]: The Amazon Chime account ID.
  Future<GetAccountResponse> getAccount(String accountId) async {
    return GetAccountResponse.fromJson({});
  }

  /// Retrieves account settings for the specified Amazon Chime account ID, such
  /// as remote control and dial out settings. For more information about these
  /// settings, see
  /// [Use the Policies Page](https://docs.aws.amazon.com/chime/latest/ag/policies.html)
  /// in the _Amazon Chime Administration Guide_.
  ///
  /// [accountId]: The Amazon Chime account ID.
  Future<GetAccountSettingsResponse> getAccountSettings(
      String accountId) async {
    return GetAccountSettingsResponse.fromJson({});
  }

  /// Retrieves details for the specified bot, such as bot email address, bot
  /// type, status, and display name.
  ///
  /// [accountId]: The Amazon Chime account ID.
  ///
  /// [botId]: The bot ID.
  Future<GetBotResponse> getBot(
      {@required String accountId, @required String botId}) async {
    return GetBotResponse.fromJson({});
  }

  /// Gets details for an events configuration that allows a bot to receive
  /// outgoing events, such as an HTTPS endpoint or Lambda function ARN.
  ///
  /// [accountId]: The Amazon Chime account ID.
  ///
  /// [botId]: The bot ID.
  Future<GetEventsConfigurationResponse> getEventsConfiguration(
      {@required String accountId, @required String botId}) async {
    return GetEventsConfigurationResponse.fromJson({});
  }

  /// Retrieves global settings for the administrator's AWS account, such as
  /// Amazon Chime Business Calling and Amazon Chime Voice Connector settings.
  Future<GetGlobalSettingsResponse> getGlobalSettings() async {
    return GetGlobalSettingsResponse.fromJson({});
  }

  /// Retrieves details for the specified phone number ID, such as associations,
  /// capabilities, and product type.
  ///
  /// [phoneNumberId]: The phone number ID.
  Future<GetPhoneNumberResponse> getPhoneNumber(String phoneNumberId) async {
    return GetPhoneNumberResponse.fromJson({});
  }

  /// Retrieves details for the specified phone number order, such as order
  /// creation timestamp, phone numbers in E.164 format, product type, and order
  /// status.
  ///
  /// [phoneNumberOrderId]: The ID for the phone number order.
  Future<GetPhoneNumberOrderResponse> getPhoneNumberOrder(
      String phoneNumberOrderId) async {
    return GetPhoneNumberOrderResponse.fromJson({});
  }

  /// Retrieves details for the specified user ID, such as primary email
  /// address, license type, and personal meeting PIN.
  ///
  /// To retrieve user details with an email address instead of a user ID, use
  /// the ListUsers action, and then filter by email address.
  ///
  /// [accountId]: The Amazon Chime account ID.
  ///
  /// [userId]: The user ID.
  Future<GetUserResponse> getUser(
      {@required String accountId, @required String userId}) async {
    return GetUserResponse.fromJson({});
  }

  /// Retrieves settings for the specified user ID, such as any associated phone
  /// number settings.
  ///
  /// [accountId]: The Amazon Chime account ID.
  ///
  /// [userId]: The user ID.
  Future<GetUserSettingsResponse> getUserSettings(
      {@required String accountId, @required String userId}) async {
    return GetUserSettingsResponse.fromJson({});
  }

  /// Retrieves details for the specified Amazon Chime Voice Connector, such as
  /// timestamps, name, outbound host, and encryption requirements.
  ///
  /// [voiceConnectorId]: The Amazon Chime Voice Connector ID.
  Future<GetVoiceConnectorResponse> getVoiceConnector(
      String voiceConnectorId) async {
    return GetVoiceConnectorResponse.fromJson({});
  }

  /// Retrieves origination setting details for the specified Amazon Chime Voice
  /// Connector.
  ///
  /// [voiceConnectorId]: The Amazon Chime Voice Connector ID.
  Future<GetVoiceConnectorOriginationResponse> getVoiceConnectorOrigination(
      String voiceConnectorId) async {
    return GetVoiceConnectorOriginationResponse.fromJson({});
  }

  /// Retrieves termination setting details for the specified Amazon Chime Voice
  /// Connector.
  ///
  /// [voiceConnectorId]: The Amazon Chime Voice Connector ID.
  Future<GetVoiceConnectorTerminationResponse> getVoiceConnectorTermination(
      String voiceConnectorId) async {
    return GetVoiceConnectorTerminationResponse.fromJson({});
  }

  /// Retrieves information about the last time a SIP `OPTIONS` ping was
  /// received from your SIP infrastructure for the specified Amazon Chime Voice
  /// Connector.
  ///
  /// [voiceConnectorId]: The Amazon Chime Voice Connector ID.
  Future<GetVoiceConnectorTerminationHealthResponse>
      getVoiceConnectorTerminationHealth(String voiceConnectorId) async {
    return GetVoiceConnectorTerminationHealthResponse.fromJson({});
  }

  /// Sends email invites to as many as 50 users, inviting them to the specified
  /// Amazon Chime `Team` account. Only `Team` account types are currently
  /// supported for this action.
  ///
  /// [accountId]: The Amazon Chime account ID.
  ///
  /// [userEmailList]: The user email addresses to which to send the invite.
  Future<InviteUsersResponse> inviteUsers(
      {@required String accountId,
      @required List<String> userEmailList}) async {
    return InviteUsersResponse.fromJson({});
  }

  /// Lists the Amazon Chime accounts under the administrator's AWS account. You
  /// can filter accounts by account name prefix. To find out which Amazon Chime
  /// account a user belongs to, you can filter by the user's email address,
  /// which returns one account result.
  ///
  /// [name]: Amazon Chime account name prefix with which to filter results.
  ///
  /// [userEmail]: User email address with which to filter results.
  ///
  /// [nextToken]: The token to use to retrieve the next page of results.
  ///
  /// [maxResults]: The maximum number of results to return in a single call.
  /// Defaults to 100.
  Future<ListAccountsResponse> listAccounts(
      {String name, String userEmail, String nextToken, int maxResults}) async {
    return ListAccountsResponse.fromJson({});
  }

  /// Lists the bots associated with the administrator's Amazon Chime Enterprise
  /// account ID.
  ///
  /// [accountId]: The Amazon Chime account ID.
  ///
  /// [maxResults]: The maximum number of results to return in a single call.
  /// Default is 10.
  ///
  /// [nextToken]: The token to use to retrieve the next page of results.
  Future<ListBotsResponse> listBots(String accountId,
      {int maxResults, String nextToken}) async {
    return ListBotsResponse.fromJson({});
  }

  /// Lists the phone number orders for the administrator's Amazon Chime
  /// account.
  ///
  /// [nextToken]: The token to use to retrieve the next page of results.
  ///
  /// [maxResults]: The maximum number of results to return in a single call.
  Future<ListPhoneNumberOrdersResponse> listPhoneNumberOrders(
      {String nextToken, int maxResults}) async {
    return ListPhoneNumberOrdersResponse.fromJson({});
  }

  /// Lists the phone numbers for the specified Amazon Chime account, Amazon
  /// Chime user, or Amazon Chime Voice Connector.
  ///
  /// [status]: The phone number status.
  ///
  /// [productType]: The phone number product type.
  ///
  /// [filterName]: The filter to use to limit the number of results.
  ///
  /// [filterValue]: The value to use for the filter.
  ///
  /// [maxResults]: The maximum number of results to return in a single call.
  ///
  /// [nextToken]: The token to use to retrieve the next page of results.
  Future<ListPhoneNumbersResponse> listPhoneNumbers(
      {String status,
      String productType,
      String filterName,
      String filterValue,
      int maxResults,
      String nextToken}) async {
    return ListPhoneNumbersResponse.fromJson({});
  }

  /// Lists the users that belong to the specified Amazon Chime account. You can
  /// specify an email address to list only the user that the email address
  /// belongs to.
  ///
  /// [accountId]: The Amazon Chime account ID.
  ///
  /// [userEmail]: Optional. The user email address used to filter results.
  /// Maximum 1.
  ///
  /// [maxResults]: The maximum number of results to return in a single call.
  /// Defaults to 100.
  ///
  /// [nextToken]: The token to use to retrieve the next page of results.
  Future<ListUsersResponse> listUsers(String accountId,
      {String userEmail, int maxResults, String nextToken}) async {
    return ListUsersResponse.fromJson({});
  }

  /// Lists the SIP credentials for the specified Amazon Chime Voice Connector.
  ///
  /// [voiceConnectorId]: The Amazon Chime Voice Connector ID.
  Future<ListVoiceConnectorTerminationCredentialsResponse>
      listVoiceConnectorTerminationCredentials(String voiceConnectorId) async {
    return ListVoiceConnectorTerminationCredentialsResponse.fromJson({});
  }

  /// Lists the Amazon Chime Voice Connectors for the administrator's AWS
  /// account.
  ///
  /// [nextToken]: The token to use to retrieve the next page of results.
  ///
  /// [maxResults]: The maximum number of results to return in a single call.
  Future<ListVoiceConnectorsResponse> listVoiceConnectors(
      {String nextToken, int maxResults}) async {
    return ListVoiceConnectorsResponse.fromJson({});
  }

  /// Logs out the specified user from all of the devices they are currently
  /// logged into.
  ///
  /// [accountId]: The Amazon Chime account ID.
  ///
  /// [userId]: The user ID.
  Future<LogoutUserResponse> logoutUser(
      {@required String accountId, @required String userId}) async {
    return LogoutUserResponse.fromJson({});
  }

  /// Creates an events configuration that allows a bot to receive outgoing
  /// events sent by Amazon Chime. Choose either an HTTPS endpoint or a Lambda
  /// function ARN. For more information, see Bot.
  ///
  /// [accountId]: The Amazon Chime account ID.
  ///
  /// [botId]: The bot ID.
  ///
  /// [outboundEventsHttpsEndpoint]: HTTPS endpoint that allows the bot to
  /// receive outgoing events.
  ///
  /// [lambdaFunctionArn]: Lambda function ARN that allows the bot to receive
  /// outgoing events.
  Future<PutEventsConfigurationResponse> putEventsConfiguration(
      {@required String accountId,
      @required String botId,
      String outboundEventsHttpsEndpoint,
      String lambdaFunctionArn}) async {
    return PutEventsConfigurationResponse.fromJson({});
  }

  /// Adds origination settings for the specified Amazon Chime Voice Connector.
  ///
  /// [voiceConnectorId]: The Amazon Chime Voice Connector ID.
  ///
  /// [origination]: The origination setting details to add.
  Future<PutVoiceConnectorOriginationResponse> putVoiceConnectorOrigination(
      {@required String voiceConnectorId,
      @required Origination origination}) async {
    return PutVoiceConnectorOriginationResponse.fromJson({});
  }

  /// Adds termination settings for the specified Amazon Chime Voice Connector.
  ///
  /// [voiceConnectorId]: The Amazon Chime Voice Connector ID.
  ///
  /// [termination]: The termination setting details to add.
  Future<PutVoiceConnectorTerminationResponse> putVoiceConnectorTermination(
      {@required String voiceConnectorId,
      @required Termination termination}) async {
    return PutVoiceConnectorTerminationResponse.fromJson({});
  }

  /// Adds termination SIP credentials for the specified Amazon Chime Voice
  /// Connector.
  ///
  /// [voiceConnectorId]: The Amazon Chime Voice Connector ID.
  ///
  /// [credentials]: The termination SIP credentials.
  Future<void> putVoiceConnectorTerminationCredentials(String voiceConnectorId,
      {List<Credential> credentials}) async {}

  /// Regenerates the security token for a bot.
  ///
  /// [accountId]: The Amazon Chime account ID.
  ///
  /// [botId]: The bot ID.
  Future<RegenerateSecurityTokenResponse> regenerateSecurityToken(
      {@required String accountId, @required String botId}) async {
    return RegenerateSecurityTokenResponse.fromJson({});
  }

  /// Resets the personal meeting PIN for the specified user on an Amazon Chime
  /// account. Returns the User object with the updated personal meeting PIN.
  ///
  /// [accountId]: The Amazon Chime account ID.
  ///
  /// [userId]: The user ID.
  Future<ResetPersonalPinResponse> resetPersonalPin(
      {@required String accountId, @required String userId}) async {
    return ResetPersonalPinResponse.fromJson({});
  }

  /// Moves a phone number from the **Deletion queue** back into the phone
  /// number **Inventory**.
  ///
  /// [phoneNumberId]: The phone number.
  Future<RestorePhoneNumberResponse> restorePhoneNumber(
      String phoneNumberId) async {
    return RestorePhoneNumberResponse.fromJson({});
  }

  /// Searches phone numbers that can be ordered.
  ///
  /// [areaCode]: The area code used to filter results.
  ///
  /// [city]: The city used to filter results.
  ///
  /// [country]: The country used to filter results.
  ///
  /// [state]: The state used to filter results.
  ///
  /// [tollFreePrefix]: The toll-free prefix that you use to filter results.
  ///
  /// [maxResults]: The maximum number of results to return in a single call.
  ///
  /// [nextToken]: The token to use to retrieve the next page of results.
  Future<SearchAvailablePhoneNumbersResponse> searchAvailablePhoneNumbers(
      {String areaCode,
      String city,
      String country,
      String state,
      String tollFreePrefix,
      int maxResults,
      String nextToken}) async {
    return SearchAvailablePhoneNumbersResponse.fromJson({});
  }

  /// Updates account details for the specified Amazon Chime account. Currently,
  /// only account name updates are supported for this action.
  ///
  /// [accountId]: The Amazon Chime account ID.
  ///
  /// [name]: The new name for the specified Amazon Chime account.
  Future<UpdateAccountResponse> updateAccount(String accountId,
      {String name}) async {
    return UpdateAccountResponse.fromJson({});
  }

  /// Updates the settings for the specified Amazon Chime account. You can
  /// update settings for remote control of shared screens, or for the dial-out
  /// option. For more information about these settings, see
  /// [Use the Policies Page](https://docs.aws.amazon.com/chime/latest/ag/policies.html)
  /// in the _Amazon Chime Administration Guide_.
  ///
  /// [accountId]: The Amazon Chime account ID.
  ///
  /// [accountSettings]: The Amazon Chime account settings to update.
  Future<UpdateAccountSettingsResponse> updateAccountSettings(
      {@required String accountId,
      @required AccountSettings accountSettings}) async {
    return UpdateAccountSettingsResponse.fromJson({});
  }

  /// Updates the status of the specified bot, such as starting or stopping the
  /// bot from running in your Amazon Chime Enterprise account.
  ///
  /// [accountId]: The Amazon Chime account ID.
  ///
  /// [botId]: The bot ID.
  ///
  /// [disabled]: When true, stops the specified bot from running in your
  /// account.
  Future<UpdateBotResponse> updateBot(
      {@required String accountId,
      @required String botId,
      bool disabled}) async {
    return UpdateBotResponse.fromJson({});
  }

  /// Updates global settings for the administrator's AWS account, such as
  /// Amazon Chime Business Calling and Amazon Chime Voice Connector settings.
  ///
  /// [businessCalling]: The Amazon Chime Business Calling settings.
  ///
  /// [voiceConnector]: The Amazon Chime Voice Connector settings.
  Future<void> updateGlobalSettings(
      {@required BusinessCallingSettings businessCalling,
      @required VoiceConnectorSettings voiceConnector}) async {}

  /// Updates phone number details, such as product type, for the specified
  /// phone number ID. For toll-free numbers, you can use only the Amazon Chime
  /// Voice Connector product type.
  ///
  /// [phoneNumberId]: The phone number ID.
  ///
  /// [productType]: The product type.
  Future<UpdatePhoneNumberResponse> updatePhoneNumber(String phoneNumberId,
      {String productType}) async {
    return UpdatePhoneNumberResponse.fromJson({});
  }

  /// Updates user details for a specified user ID. Currently, only
  /// `LicenseType` updates are supported for this action.
  ///
  /// [accountId]: The Amazon Chime account ID.
  ///
  /// [userId]: The user ID.
  ///
  /// [licenseType]: The user license type to update. This must be a supported
  /// license type for the Amazon Chime account that the user belongs to.
  Future<UpdateUserResponse> updateUser(
      {@required String accountId,
      @required String userId,
      String licenseType}) async {
    return UpdateUserResponse.fromJson({});
  }

  /// Updates the settings for the specified user, such as phone number
  /// settings.
  ///
  /// [accountId]: The Amazon Chime account ID.
  ///
  /// [userId]: The user ID.
  ///
  /// [userSettings]: The user settings to update.
  Future<void> updateUserSettings(
      {@required String accountId,
      @required String userId,
      @required UserSettings userSettings}) async {}

  /// Updates details for the specified Amazon Chime Voice Connector.
  ///
  /// [voiceConnectorId]: The Amazon Chime Voice Connector ID.
  ///
  /// [name]: The name of the Amazon Chime Voice Connector.
  ///
  /// [requireEncryption]: When enabled, requires encryption for the Amazon
  /// Chime Voice Connector.
  Future<UpdateVoiceConnectorResponse> updateVoiceConnector(
      {@required String voiceConnectorId,
      @required String name,
      @required bool requireEncryption}) async {
    return UpdateVoiceConnectorResponse.fromJson({});
  }
}

/// The Amazon Chime account details. An AWS account can have multiple Amazon
/// Chime accounts.
class Account {
  /// The AWS account ID.
  final String awsAccountId;

  /// The Amazon Chime account ID.
  final String accountId;

  /// The Amazon Chime account name.
  final String name;

  /// The Amazon Chime account type. For more information about different
  /// account types, see
  /// [Managing Your Amazon Chime Accounts](https://docs.aws.amazon.com/chime/latest/ag/manage-chime-account.html)
  /// in the _Amazon Chime Administration Guide_.
  final String accountType;

  /// The Amazon Chime account creation timestamp, in ISO 8601 format.
  final DateTime createdTimestamp;

  /// The default license for the Amazon Chime account.
  final String defaultLicense;

  /// Supported licenses for the Amazon Chime account.
  final List<String> supportedLicenses;

  Account({
    @required this.awsAccountId,
    @required this.accountId,
    @required this.name,
    this.accountType,
    this.createdTimestamp,
    this.defaultLicense,
    this.supportedLicenses,
  });
  static Account fromJson(Map<String, dynamic> json) => Account();
}

/// Settings related to the Amazon Chime account. This includes settings that
/// start or stop remote control of shared screens, or start or stop the
/// dial-out option in the Amazon Chime web application. For more information
/// about these settings, see
/// [Use the Policies Page](https://docs.aws.amazon.com/chime/latest/ag/policies.html)
/// in the _Amazon Chime Administration Guide_.
class AccountSettings {
  /// Setting that stops or starts remote control of shared screens during
  /// meetings.
  final bool disableRemoteControl;

  /// Setting that allows meeting participants to choose the **Call me at a
  /// phone number** option. For more information, see
  /// [Join a Meeting without the Amazon Chime App](https://docs.aws.amazon.com/chime/latest/ug/chime-join-meeting.html).
  final bool enableDialOut;

  AccountSettings({
    this.disableRemoteControl,
    this.enableDialOut,
  });
  static AccountSettings fromJson(Map<String, dynamic> json) =>
      AccountSettings();
}

class AssociatePhoneNumberWithUserResponse {
  AssociatePhoneNumberWithUserResponse();
  static AssociatePhoneNumberWithUserResponse fromJson(
          Map<String, dynamic> json) =>
      AssociatePhoneNumberWithUserResponse();
}

class AssociatePhoneNumbersWithVoiceConnectorResponse {
  /// If the action fails for one or more of the phone numbers in the request, a
  /// list of the phone numbers is returned, along with error codes and error
  /// messages.
  final List<PhoneNumberError> phoneNumberErrors;

  AssociatePhoneNumbersWithVoiceConnectorResponse({
    this.phoneNumberErrors,
  });
  static AssociatePhoneNumbersWithVoiceConnectorResponse fromJson(
          Map<String, dynamic> json) =>
      AssociatePhoneNumbersWithVoiceConnectorResponse();
}

class BatchDeletePhoneNumberResponse {
  /// If the action fails for one or more of the phone numbers in the request, a
  /// list of the phone numbers is returned, along with error codes and error
  /// messages.
  final List<PhoneNumberError> phoneNumberErrors;

  BatchDeletePhoneNumberResponse({
    this.phoneNumberErrors,
  });
  static BatchDeletePhoneNumberResponse fromJson(Map<String, dynamic> json) =>
      BatchDeletePhoneNumberResponse();
}

class BatchSuspendUserResponse {
  /// If the BatchSuspendUser action fails for one or more of the user IDs in
  /// the request, a list of the user IDs is returned, along with error codes
  /// and error messages.
  final List<UserError> userErrors;

  BatchSuspendUserResponse({
    this.userErrors,
  });
  static BatchSuspendUserResponse fromJson(Map<String, dynamic> json) =>
      BatchSuspendUserResponse();
}

class BatchUnsuspendUserResponse {
  /// If the BatchUnsuspendUser action fails for one or more of the user IDs in
  /// the request, a list of the user IDs is returned, along with error codes
  /// and error messages.
  final List<UserError> userErrors;

  BatchUnsuspendUserResponse({
    this.userErrors,
  });
  static BatchUnsuspendUserResponse fromJson(Map<String, dynamic> json) =>
      BatchUnsuspendUserResponse();
}

class BatchUpdatePhoneNumberResponse {
  /// If the action fails for one or more of the phone numbers in the request, a
  /// list of the phone numbers is returned, along with error codes and error
  /// messages.
  final List<PhoneNumberError> phoneNumberErrors;

  BatchUpdatePhoneNumberResponse({
    this.phoneNumberErrors,
  });
  static BatchUpdatePhoneNumberResponse fromJson(Map<String, dynamic> json) =>
      BatchUpdatePhoneNumberResponse();
}

class BatchUpdateUserResponse {
  /// If the BatchUpdateUser action fails for one or more of the user IDs in the
  /// request, a list of the user IDs is returned, along with error codes and
  /// error messages.
  final List<UserError> userErrors;

  BatchUpdateUserResponse({
    this.userErrors,
  });
  static BatchUpdateUserResponse fromJson(Map<String, dynamic> json) =>
      BatchUpdateUserResponse();
}

/// A resource that allows Enterprise account administrators to configure an
/// interface to receive events from Amazon Chime.
class Bot {
  /// The bot ID.
  final String botId;

  /// The unique ID for the bot user.
  final String userId;

  /// The bot display name.
  final String displayName;

  /// The bot type.
  final String botType;

  /// When true, the bot is stopped from running in your account.
  final bool disabled;

  /// The bot creation timestamp, in ISO 8601 format.
  final DateTime createdTimestamp;

  /// The updated bot timestamp, in ISO 8601 format.
  final DateTime updatedTimestamp;

  /// The bot email address.
  final String botEmail;

  /// The security token used to authenticate Amazon Chime with the outgoing
  /// event endpoint.
  final String securityToken;

  Bot({
    this.botId,
    this.userId,
    this.displayName,
    this.botType,
    this.disabled,
    this.createdTimestamp,
    this.updatedTimestamp,
    this.botEmail,
    this.securityToken,
  });
  static Bot fromJson(Map<String, dynamic> json) => Bot();
}

/// The Amazon Chime Business Calling settings for the administrator's AWS
/// account. Includes any Amazon S3 buckets designated for storing call detail
/// records.
class BusinessCallingSettings {
  /// The Amazon S3 bucket designated for call detail record storage.
  final String cdrBucket;

  BusinessCallingSettings({
    this.cdrBucket,
  });
  static BusinessCallingSettings fromJson(Map<String, dynamic> json) =>
      BusinessCallingSettings();
}

class CreateAccountResponse {
  /// The Amazon Chime account details.
  final Account account;

  CreateAccountResponse({
    this.account,
  });
  static CreateAccountResponse fromJson(Map<String, dynamic> json) =>
      CreateAccountResponse();
}

class CreateBotResponse {
  /// The bot details.
  final Bot bot;

  CreateBotResponse({
    this.bot,
  });
  static CreateBotResponse fromJson(Map<String, dynamic> json) =>
      CreateBotResponse();
}

class CreatePhoneNumberOrderResponse {
  /// The phone number order details.
  final PhoneNumberOrder phoneNumberOrder;

  CreatePhoneNumberOrderResponse({
    this.phoneNumberOrder,
  });
  static CreatePhoneNumberOrderResponse fromJson(Map<String, dynamic> json) =>
      CreatePhoneNumberOrderResponse();
}

class CreateVoiceConnectorResponse {
  /// The Amazon Chime Voice Connector details.
  final VoiceConnector voiceConnector;

  CreateVoiceConnectorResponse({
    this.voiceConnector,
  });
  static CreateVoiceConnectorResponse fromJson(Map<String, dynamic> json) =>
      CreateVoiceConnectorResponse();
}

/// The SIP credentials used to authenticate requests to your Amazon Chime Voice
/// Connector.
class Credential {
  /// The RFC2617 compliant user name associated with the SIP credentials, in
  /// US-ASCII format.
  final String username;

  /// The RFC2617 compliant password associated with the SIP credentials, in
  /// US-ASCII format.
  final String password;

  Credential({
    this.username,
    this.password,
  });
}

class DeleteAccountResponse {
  DeleteAccountResponse();
  static DeleteAccountResponse fromJson(Map<String, dynamic> json) =>
      DeleteAccountResponse();
}

class DisassociatePhoneNumberFromUserResponse {
  DisassociatePhoneNumberFromUserResponse();
  static DisassociatePhoneNumberFromUserResponse fromJson(
          Map<String, dynamic> json) =>
      DisassociatePhoneNumberFromUserResponse();
}

class DisassociatePhoneNumbersFromVoiceConnectorResponse {
  /// If the action fails for one or more of the phone numbers in the request, a
  /// list of the phone numbers is returned, along with error codes and error
  /// messages.
  final List<PhoneNumberError> phoneNumberErrors;

  DisassociatePhoneNumbersFromVoiceConnectorResponse({
    this.phoneNumberErrors,
  });
  static DisassociatePhoneNumbersFromVoiceConnectorResponse fromJson(
          Map<String, dynamic> json) =>
      DisassociatePhoneNumbersFromVoiceConnectorResponse();
}

/// The configuration that allows a bot to receive outgoing events. Can be
/// either an HTTPS endpoint or a Lambda function ARN.
class EventsConfiguration {
  /// The bot ID.
  final String botId;

  /// HTTPS endpoint that allows a bot to receive outgoing events.
  final String outboundEventsHttpsEndpoint;

  /// Lambda function ARN that allows a bot to receive outgoing events.
  final String lambdaFunctionArn;

  EventsConfiguration({
    this.botId,
    this.outboundEventsHttpsEndpoint,
    this.lambdaFunctionArn,
  });
  static EventsConfiguration fromJson(Map<String, dynamic> json) =>
      EventsConfiguration();
}

class GetAccountResponse {
  /// The Amazon Chime account details.
  final Account account;

  GetAccountResponse({
    this.account,
  });
  static GetAccountResponse fromJson(Map<String, dynamic> json) =>
      GetAccountResponse();
}

class GetAccountSettingsResponse {
  /// The Amazon Chime account settings.
  final AccountSettings accountSettings;

  GetAccountSettingsResponse({
    this.accountSettings,
  });
  static GetAccountSettingsResponse fromJson(Map<String, dynamic> json) =>
      GetAccountSettingsResponse();
}

class GetBotResponse {
  /// The chat bot details.
  final Bot bot;

  GetBotResponse({
    this.bot,
  });
  static GetBotResponse fromJson(Map<String, dynamic> json) => GetBotResponse();
}

class GetEventsConfigurationResponse {
  /// The events configuration details.
  final EventsConfiguration eventsConfiguration;

  GetEventsConfigurationResponse({
    this.eventsConfiguration,
  });
  static GetEventsConfigurationResponse fromJson(Map<String, dynamic> json) =>
      GetEventsConfigurationResponse();
}

class GetGlobalSettingsResponse {
  /// The Amazon Chime Business Calling settings.
  final BusinessCallingSettings businessCalling;

  /// The Amazon Chime Voice Connector settings.
  final VoiceConnectorSettings voiceConnector;

  GetGlobalSettingsResponse({
    this.businessCalling,
    this.voiceConnector,
  });
  static GetGlobalSettingsResponse fromJson(Map<String, dynamic> json) =>
      GetGlobalSettingsResponse();
}

class GetPhoneNumberOrderResponse {
  /// The phone number order details.
  final PhoneNumberOrder phoneNumberOrder;

  GetPhoneNumberOrderResponse({
    this.phoneNumberOrder,
  });
  static GetPhoneNumberOrderResponse fromJson(Map<String, dynamic> json) =>
      GetPhoneNumberOrderResponse();
}

class GetPhoneNumberResponse {
  /// The phone number details.
  final PhoneNumber phoneNumber;

  GetPhoneNumberResponse({
    this.phoneNumber,
  });
  static GetPhoneNumberResponse fromJson(Map<String, dynamic> json) =>
      GetPhoneNumberResponse();
}

class GetUserResponse {
  /// The user details.
  final User user;

  GetUserResponse({
    this.user,
  });
  static GetUserResponse fromJson(Map<String, dynamic> json) =>
      GetUserResponse();
}

class GetUserSettingsResponse {
  /// The user settings.
  final UserSettings userSettings;

  GetUserSettingsResponse({
    this.userSettings,
  });
  static GetUserSettingsResponse fromJson(Map<String, dynamic> json) =>
      GetUserSettingsResponse();
}

class GetVoiceConnectorOriginationResponse {
  /// The origination setting details.
  final Origination origination;

  GetVoiceConnectorOriginationResponse({
    this.origination,
  });
  static GetVoiceConnectorOriginationResponse fromJson(
          Map<String, dynamic> json) =>
      GetVoiceConnectorOriginationResponse();
}

class GetVoiceConnectorResponse {
  /// The Amazon Chime Voice Connector details.
  final VoiceConnector voiceConnector;

  GetVoiceConnectorResponse({
    this.voiceConnector,
  });
  static GetVoiceConnectorResponse fromJson(Map<String, dynamic> json) =>
      GetVoiceConnectorResponse();
}

class GetVoiceConnectorTerminationHealthResponse {
  /// The termination health details.
  final TerminationHealth terminationHealth;

  GetVoiceConnectorTerminationHealthResponse({
    this.terminationHealth,
  });
  static GetVoiceConnectorTerminationHealthResponse fromJson(
          Map<String, dynamic> json) =>
      GetVoiceConnectorTerminationHealthResponse();
}

class GetVoiceConnectorTerminationResponse {
  /// The termination setting details.
  final Termination termination;

  GetVoiceConnectorTerminationResponse({
    this.termination,
  });
  static GetVoiceConnectorTerminationResponse fromJson(
          Map<String, dynamic> json) =>
      GetVoiceConnectorTerminationResponse();
}

/// Invitation object returned after emailing users to invite them to join the
/// Amazon Chime `Team` account.
class Invite {
  /// The invite ID.
  final String inviteId;

  /// The status of the invite.
  final String status;

  /// The email address to which the invite is sent.
  final String emailAddress;

  /// The status of the invite email.
  final String emailStatus;

  Invite({
    this.inviteId,
    this.status,
    this.emailAddress,
    this.emailStatus,
  });
  static Invite fromJson(Map<String, dynamic> json) => Invite();
}

class InviteUsersResponse {
  /// The invite details.
  final List<Invite> invites;

  InviteUsersResponse({
    this.invites,
  });
  static InviteUsersResponse fromJson(Map<String, dynamic> json) =>
      InviteUsersResponse();
}

class ListAccountsResponse {
  /// List of Amazon Chime accounts and account details.
  final List<Account> accounts;

  /// The token to use to retrieve the next page of results.
  final String nextToken;

  ListAccountsResponse({
    this.accounts,
    this.nextToken,
  });
  static ListAccountsResponse fromJson(Map<String, dynamic> json) =>
      ListAccountsResponse();
}

class ListBotsResponse {
  /// List of bots and bot details.
  final List<Bot> bots;

  /// The token to use to retrieve the next page of results.
  final String nextToken;

  ListBotsResponse({
    this.bots,
    this.nextToken,
  });
  static ListBotsResponse fromJson(Map<String, dynamic> json) =>
      ListBotsResponse();
}

class ListPhoneNumberOrdersResponse {
  /// The phone number order details.
  final List<PhoneNumberOrder> phoneNumberOrders;

  /// The token to use to retrieve the next page of results.
  final String nextToken;

  ListPhoneNumberOrdersResponse({
    this.phoneNumberOrders,
    this.nextToken,
  });
  static ListPhoneNumberOrdersResponse fromJson(Map<String, dynamic> json) =>
      ListPhoneNumberOrdersResponse();
}

class ListPhoneNumbersResponse {
  /// The phone number details.
  final List<PhoneNumber> phoneNumbers;

  /// The token to use to retrieve the next page of results.
  final String nextToken;

  ListPhoneNumbersResponse({
    this.phoneNumbers,
    this.nextToken,
  });
  static ListPhoneNumbersResponse fromJson(Map<String, dynamic> json) =>
      ListPhoneNumbersResponse();
}

class ListUsersResponse {
  /// List of users and user details.
  final List<User> users;

  /// The token to use to retrieve the next page of results.
  final String nextToken;

  ListUsersResponse({
    this.users,
    this.nextToken,
  });
  static ListUsersResponse fromJson(Map<String, dynamic> json) =>
      ListUsersResponse();
}

class ListVoiceConnectorTerminationCredentialsResponse {
  /// A list of user names.
  final List<String> usernames;

  ListVoiceConnectorTerminationCredentialsResponse({
    this.usernames,
  });
  static ListVoiceConnectorTerminationCredentialsResponse fromJson(
          Map<String, dynamic> json) =>
      ListVoiceConnectorTerminationCredentialsResponse();
}

class ListVoiceConnectorsResponse {
  /// The details of the Amazon Chime Voice Connectors.
  final List<VoiceConnector> voiceConnectors;

  /// The token to use to retrieve the next page of results.
  final String nextToken;

  ListVoiceConnectorsResponse({
    this.voiceConnectors,
    this.nextToken,
  });
  static ListVoiceConnectorsResponse fromJson(Map<String, dynamic> json) =>
      ListVoiceConnectorsResponse();
}

class LogoutUserResponse {
  LogoutUserResponse();
  static LogoutUserResponse fromJson(Map<String, dynamic> json) =>
      LogoutUserResponse();
}

/// A phone number for which an order has been placed.
class OrderedPhoneNumber {
  /// The phone number, in E.164 format.
  final String e164PhoneNumber;

  /// The phone number status.
  final String status;

  OrderedPhoneNumber({
    this.e164PhoneNumber,
    this.status,
  });
  static OrderedPhoneNumber fromJson(Map<String, dynamic> json) =>
      OrderedPhoneNumber();
}

/// Origination settings enable your SIP hosts to receive inbound calls using
/// your Amazon Chime Voice Connector.
class Origination {
  /// The call distribution properties defined for your SIP hosts. Valid range:
  /// Minimum value of 1. Maximum value of 20.
  final List<OriginationRoute> routes;

  /// When origination settings are disabled, inbound calls are not enabled for
  /// your Amazon Chime Voice Connector.
  final bool disabled;

  Origination({
    this.routes,
    this.disabled,
  });
  static Origination fromJson(Map<String, dynamic> json) => Origination();
}

/// Origination routes define call distribution properties for your SIP hosts to
/// receive inbound calls using your Amazon Chime Voice Connector. Limit: 10
/// origination routes per Amazon Chime Voice Connector.
class OriginationRoute {
  /// The FODN or IP address to contact for origination traffic.
  final String host;

  /// The designated origination route port. Defaults to 5060.
  final int port;

  /// The protocol to use for the origination route. Encryption-enabled Amazon
  /// Chime Voice Connectors use TCP protocol by default.
  final String protocol;

  /// The priority associated with the host, with 1 being the highest priority.
  /// Higher priority hosts are attempted first.
  final int priority;

  /// The weight associated with the host. If hosts are equal in priority, calls
  /// are distributed among them based on their relative weight.
  final int weight;

  OriginationRoute({
    this.host,
    this.port,
    this.protocol,
    this.priority,
    this.weight,
  });
  static OriginationRoute fromJson(Map<String, dynamic> json) =>
      OriginationRoute();
}

/// A phone number used for Amazon Chime Business Calling or an Amazon Chime
/// Voice Connector.
class PhoneNumber {
  /// The phone number ID.
  final String phoneNumberId;

  /// The phone number, in E.164 format.
  final String e164PhoneNumber;

  /// The phone number type.
  final String type;

  /// The phone number product type.
  final String productType;

  /// The phone number status.
  final String status;

  /// The phone number capabilities.
  final PhoneNumberCapabilities capabilities;

  /// The phone number associations.
  final List<PhoneNumberAssociation> associations;

  /// The phone number creation timestamp, in ISO 8601 format.
  final DateTime createdTimestamp;

  /// The updated phone number timestamp, in ISO 8601 format.
  final DateTime updatedTimestamp;

  /// The deleted phone number timestamp, in ISO 8601 format.
  final DateTime deletionTimestamp;

  PhoneNumber({
    this.phoneNumberId,
    this.e164PhoneNumber,
    this.type,
    this.productType,
    this.status,
    this.capabilities,
    this.associations,
    this.createdTimestamp,
    this.updatedTimestamp,
    this.deletionTimestamp,
  });
  static PhoneNumber fromJson(Map<String, dynamic> json) => PhoneNumber();
}

/// The phone number associations, such as Amazon Chime account ID, Amazon Chime
/// user ID, or Amazon Chime Voice Connector ID.
class PhoneNumberAssociation {
  /// Contains the ID for the entity specified in Name.
  final String value;

  /// Defines the association with an Amazon Chime account ID, user ID, or
  /// Amazon Chime Voice Connector ID.
  final String name;

  /// The timestamp of the phone number association, in ISO 8601 format.
  final DateTime associatedTimestamp;

  PhoneNumberAssociation({
    this.value,
    this.name,
    this.associatedTimestamp,
  });
  static PhoneNumberAssociation fromJson(Map<String, dynamic> json) =>
      PhoneNumberAssociation();
}

/// The phone number capabilities, such as enabled inbound and outbound calling
/// and text messaging.
class PhoneNumberCapabilities {
  /// Allows or denies inbound calling for the specified phone number.
  final bool inboundCall;

  /// Allows or denies outbound calling for the specified phone number.
  final bool outboundCall;

  /// Allows or denies inbound SMS messaging for the specified phone number.
  final bool inboundSms;

  /// Allows or denies outbound SMS messaging for the specified phone number.
  final bool outboundSms;

  /// Allows or denies inbound MMS messaging for the specified phone number.
  final bool inboundMms;

  /// Allows or denies outbound MMS messaging for the specified phone number.
  final bool outboundMms;

  PhoneNumberCapabilities({
    this.inboundCall,
    this.outboundCall,
    this.inboundSms,
    this.outboundSms,
    this.inboundMms,
    this.outboundMms,
  });
  static PhoneNumberCapabilities fromJson(Map<String, dynamic> json) =>
      PhoneNumberCapabilities();
}

/// If the phone number action fails for one or more of the phone numbers in the
/// request, a list of the phone numbers is returned, along with error codes and
/// error messages.
class PhoneNumberError {
  /// The phone number ID for which the action failed.
  final String phoneNumberId;

  /// The error code.
  final String errorCode;

  /// The error message.
  final String errorMessage;

  PhoneNumberError({
    this.phoneNumberId,
    this.errorCode,
    this.errorMessage,
  });
  static PhoneNumberError fromJson(Map<String, dynamic> json) =>
      PhoneNumberError();
}

/// The details of a phone number order created for Amazon Chime.
class PhoneNumberOrder {
  /// The phone number order ID.
  final String phoneNumberOrderId;

  /// The phone number order product type.
  final String productType;

  /// The status of the phone number order.
  final String status;

  /// The ordered phone number details, such as the phone number in E.164 format
  /// and the phone number status.
  final List<OrderedPhoneNumber> orderedPhoneNumbers;

  /// The phone number order creation timestamp, in ISO 8601 format.
  final DateTime createdTimestamp;

  /// The updated phone number order timestamp, in ISO 8601 format.
  final DateTime updatedTimestamp;

  PhoneNumberOrder({
    this.phoneNumberOrderId,
    this.productType,
    this.status,
    this.orderedPhoneNumbers,
    this.createdTimestamp,
    this.updatedTimestamp,
  });
  static PhoneNumberOrder fromJson(Map<String, dynamic> json) =>
      PhoneNumberOrder();
}

class PutEventsConfigurationResponse {
  final EventsConfiguration eventsConfiguration;

  PutEventsConfigurationResponse({
    this.eventsConfiguration,
  });
  static PutEventsConfigurationResponse fromJson(Map<String, dynamic> json) =>
      PutEventsConfigurationResponse();
}

class PutVoiceConnectorOriginationResponse {
  /// The updated origination setting details.
  final Origination origination;

  PutVoiceConnectorOriginationResponse({
    this.origination,
  });
  static PutVoiceConnectorOriginationResponse fromJson(
          Map<String, dynamic> json) =>
      PutVoiceConnectorOriginationResponse();
}

class PutVoiceConnectorTerminationResponse {
  /// The updated termination setting details.
  final Termination termination;

  PutVoiceConnectorTerminationResponse({
    this.termination,
  });
  static PutVoiceConnectorTerminationResponse fromJson(
          Map<String, dynamic> json) =>
      PutVoiceConnectorTerminationResponse();
}

class RegenerateSecurityTokenResponse {
  final Bot bot;

  RegenerateSecurityTokenResponse({
    this.bot,
  });
  static RegenerateSecurityTokenResponse fromJson(Map<String, dynamic> json) =>
      RegenerateSecurityTokenResponse();
}

class ResetPersonalPinResponse {
  /// The user details and new personal meeting PIN.
  final User user;

  ResetPersonalPinResponse({
    this.user,
  });
  static ResetPersonalPinResponse fromJson(Map<String, dynamic> json) =>
      ResetPersonalPinResponse();
}

class RestorePhoneNumberResponse {
  /// The phone number details.
  final PhoneNumber phoneNumber;

  RestorePhoneNumberResponse({
    this.phoneNumber,
  });
  static RestorePhoneNumberResponse fromJson(Map<String, dynamic> json) =>
      RestorePhoneNumberResponse();
}

class SearchAvailablePhoneNumbersResponse {
  /// List of phone numbers, in E.164 format.
  final List<String> e164PhoneNumbers;

  SearchAvailablePhoneNumbersResponse({
    this.e164PhoneNumbers,
  });
  static SearchAvailablePhoneNumbersResponse fromJson(
          Map<String, dynamic> json) =>
      SearchAvailablePhoneNumbersResponse();
}

/// Settings that allow management of telephony permissions for an Amazon Chime
/// user, such as inbound and outbound calling and text messaging.
class TelephonySettings {
  /// Allows or denies inbound calling.
  final bool inboundCalling;

  /// Allows or denies outbound calling.
  final bool outboundCalling;

  /// Allows or denies SMS messaging.
  final bool sms;

  TelephonySettings({
    @required this.inboundCalling,
    @required this.outboundCalling,
    @required this.sms,
  });
  static TelephonySettings fromJson(Map<String, dynamic> json) =>
      TelephonySettings();
}

/// Termination settings enable your SIP hosts to make outbound calls using your
/// Amazon Chime Voice Connector.
class Termination {
  /// The limit on calls per second. Max value based on account service limit.
  /// Default value of 1.
  final int cpsLimit;

  /// The default caller ID phone number.
  final String defaultPhoneNumber;

  /// The countries to which calls are allowed.
  final List<String> callingRegions;

  /// The IP addresses allowed to make calls, in CIDR format.
  final List<String> cidrAllowedList;

  /// When termination settings are disabled, outbound calls can not be made.
  final bool disabled;

  Termination({
    this.cpsLimit,
    this.defaultPhoneNumber,
    this.callingRegions,
    this.cidrAllowedList,
    this.disabled,
  });
  static Termination fromJson(Map<String, dynamic> json) => Termination();
}

/// The termination health details, including the source IP address and
/// timestamp of the last successful SIP `OPTIONS` message from your SIP
/// infrastructure.
class TerminationHealth {
  /// The timestamp, in ISO 8601 format.
  final DateTime timestamp;

  /// The source IP address.
  final String source;

  TerminationHealth({
    this.timestamp,
    this.source,
  });
  static TerminationHealth fromJson(Map<String, dynamic> json) =>
      TerminationHealth();
}

class UpdateAccountResponse {
  /// The updated Amazon Chime account details.
  final Account account;

  UpdateAccountResponse({
    this.account,
  });
  static UpdateAccountResponse fromJson(Map<String, dynamic> json) =>
      UpdateAccountResponse();
}

class UpdateAccountSettingsResponse {
  UpdateAccountSettingsResponse();
  static UpdateAccountSettingsResponse fromJson(Map<String, dynamic> json) =>
      UpdateAccountSettingsResponse();
}

class UpdateBotResponse {
  /// The updated bot details.
  final Bot bot;

  UpdateBotResponse({
    this.bot,
  });
  static UpdateBotResponse fromJson(Map<String, dynamic> json) =>
      UpdateBotResponse();
}

/// The phone number ID and product type fields to update, used with the
/// BatchUpdatePhoneNumber and UpdatePhoneNumber actions.
class UpdatePhoneNumberRequestItem {
  /// The phone number ID to update.
  final String phoneNumberId;

  /// The product type to update.
  final String productType;

  UpdatePhoneNumberRequestItem({
    @required this.phoneNumberId,
    this.productType,
  });
}

class UpdatePhoneNumberResponse {
  /// The updated phone number details.
  final PhoneNumber phoneNumber;

  UpdatePhoneNumberResponse({
    this.phoneNumber,
  });
  static UpdatePhoneNumberResponse fromJson(Map<String, dynamic> json) =>
      UpdatePhoneNumberResponse();
}

/// The user ID and user fields to update, used with the BatchUpdateUser action.
class UpdateUserRequestItem {
  /// The user ID.
  final String userId;

  /// The user license type.
  final String licenseType;

  UpdateUserRequestItem({
    @required this.userId,
    this.licenseType,
  });
}

class UpdateUserResponse {
  /// The updated user details.
  final User user;

  UpdateUserResponse({
    this.user,
  });
  static UpdateUserResponse fromJson(Map<String, dynamic> json) =>
      UpdateUserResponse();
}

class UpdateVoiceConnectorResponse {
  /// The Amazon Chime Voice Connector details.
  final VoiceConnector voiceConnector;

  UpdateVoiceConnectorResponse({
    this.voiceConnector,
  });
  static UpdateVoiceConnectorResponse fromJson(Map<String, dynamic> json) =>
      UpdateVoiceConnectorResponse();
}

/// The user on the Amazon Chime account.
class User {
  /// The user ID.
  final String userId;

  /// The Amazon Chime account ID.
  final String accountId;

  /// The primary email address of the user.
  final String primaryEmail;

  /// The primary phone number associated with the user.
  final String primaryProvisionedNumber;

  /// The display name of the user.
  final String displayName;

  /// The license type for the user.
  final String licenseType;

  /// The user registration status.
  final String userRegistrationStatus;

  /// The user invite status.
  final String userInvitationStatus;

  /// Date and time when the user is registered, in ISO 8601 format.
  final DateTime registeredOn;

  /// Date and time when the user is invited to the Amazon Chime account, in ISO
  /// 8601 format.
  final DateTime invitedOn;

  /// The user's personal meeting PIN.
  final String personalPin;

  User({
    @required this.userId,
    this.accountId,
    this.primaryEmail,
    this.primaryProvisionedNumber,
    this.displayName,
    this.licenseType,
    this.userRegistrationStatus,
    this.userInvitationStatus,
    this.registeredOn,
    this.invitedOn,
    this.personalPin,
  });
  static User fromJson(Map<String, dynamic> json) => User();
}

/// The list of errors returned when errors are encountered during the
/// BatchSuspendUser, BatchUnsuspendUser, or BatchUpdateUser actions. This
/// includes user IDs, error codes, and error messages.
class UserError {
  /// The user ID for which the action failed.
  final String userId;

  /// The error code.
  final String errorCode;

  /// The error message.
  final String errorMessage;

  UserError({
    this.userId,
    this.errorCode,
    this.errorMessage,
  });
  static UserError fromJson(Map<String, dynamic> json) => UserError();
}

/// Settings associated with an Amazon Chime user, including inbound and
/// outbound calling and text messaging.
class UserSettings {
  /// The telephony settings associated with the user.
  final TelephonySettings telephony;

  UserSettings({
    @required this.telephony,
  });
  static UserSettings fromJson(Map<String, dynamic> json) => UserSettings();
}

/// The Amazon Chime Voice Connector configuration, including outbound host name
/// and encryption settings.
class VoiceConnector {
  /// The Amazon Chime Voice Connector ID.
  final String voiceConnectorId;

  /// The name of the Amazon Chime Voice Connector.
  final String name;

  /// The outbound host name for the Amazon Chime Voice Connector.
  final String outboundHostName;

  /// Designates whether encryption is required for the Amazon Chime Voice
  /// Connector.
  final bool requireEncryption;

  /// The Amazon Chime Voice Connector creation timestamp, in ISO 8601 format.
  final DateTime createdTimestamp;

  /// The updated Amazon Chime Voice Connector timestamp, in ISO 8601 format.
  final DateTime updatedTimestamp;

  VoiceConnector({
    this.voiceConnectorId,
    this.name,
    this.outboundHostName,
    this.requireEncryption,
    this.createdTimestamp,
    this.updatedTimestamp,
  });
  static VoiceConnector fromJson(Map<String, dynamic> json) => VoiceConnector();
}

/// The Amazon Chime Voice Connector settings. Includes any Amazon S3 buckets
/// designated for storing call detail records.
class VoiceConnectorSettings {
  /// The Amazon S3 bucket designated for call detail record storage.
  final String cdrBucket;

  VoiceConnectorSettings({
    this.cdrBucket,
  });
  static VoiceConnectorSettings fromJson(Map<String, dynamic> json) =>
      VoiceConnectorSettings();
}
