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
  final _client;
  ChimeApi(client)
      : _client = client.configured('Chime', serializer: 'rest-json');

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
    var response_ = await _client.send('AssociatePhoneNumberWithUser', {
      'AccountId': accountId,
      'UserId': userId,
      'E164PhoneNumber': e164PhoneNumber,
    });
    return AssociatePhoneNumberWithUserResponse.fromJson(response_);
  }

  /// Associates a phone number with the specified Amazon Chime Voice Connector.
  ///
  /// [voiceConnectorId]: The Amazon Chime Voice Connector ID.
  ///
  /// [e164PhoneNumbers]: List of phone numbers, in E.164 format.
  Future<AssociatePhoneNumbersWithVoiceConnectorResponse>
      associatePhoneNumbersWithVoiceConnector(String voiceConnectorId,
          {List<String> e164PhoneNumbers}) async {
    var response_ =
        await _client.send('AssociatePhoneNumbersWithVoiceConnector', {
      'VoiceConnectorId': voiceConnectorId,
      if (e164PhoneNumbers != null) 'E164PhoneNumbers': e164PhoneNumbers,
    });
    return AssociatePhoneNumbersWithVoiceConnectorResponse.fromJson(response_);
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
    var response_ = await _client.send('BatchDeletePhoneNumber', {
      'PhoneNumberIds': phoneNumberIds,
    });
    return BatchDeletePhoneNumberResponse.fromJson(response_);
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
    var response_ = await _client.send('BatchSuspendUser', {
      'AccountId': accountId,
      'UserIdList': userIdList,
    });
    return BatchSuspendUserResponse.fromJson(response_);
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
    var response_ = await _client.send('BatchUnsuspendUser', {
      'AccountId': accountId,
      'UserIdList': userIdList,
    });
    return BatchUnsuspendUserResponse.fromJson(response_);
  }

  /// Updates phone number product types. Choose from Amazon Chime Business
  /// Calling and Amazon Chime Voice Connector product types. For toll-free
  /// numbers, you can use only the Amazon Chime Voice Connector product type.
  ///
  /// [updatePhoneNumberRequestItems]: The request containing the phone number
  /// IDs and product types to update.
  Future<BatchUpdatePhoneNumberResponse> batchUpdatePhoneNumber(
      List<UpdatePhoneNumberRequestItem> updatePhoneNumberRequestItems) async {
    var response_ = await _client.send('BatchUpdatePhoneNumber', {
      'UpdatePhoneNumberRequestItems': updatePhoneNumberRequestItems,
    });
    return BatchUpdatePhoneNumberResponse.fromJson(response_);
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
    var response_ = await _client.send('BatchUpdateUser', {
      'AccountId': accountId,
      'UpdateUserRequestItems': updateUserRequestItems,
    });
    return BatchUpdateUserResponse.fromJson(response_);
  }

  /// Creates an Amazon Chime account under the administrator's AWS account.
  /// Only `Team` account types are currently supported for this action. For
  /// more information about different account types, see
  /// [Managing Your Amazon Chime Accounts](https://docs.aws.amazon.com/chime/latest/ag/manage-chime-account.html)
  /// in the _Amazon Chime Administration Guide_.
  ///
  /// [name]: The name of the Amazon Chime account.
  Future<CreateAccountResponse> createAccount(String name) async {
    var response_ = await _client.send('CreateAccount', {
      'Name': name,
    });
    return CreateAccountResponse.fromJson(response_);
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
    var response_ = await _client.send('CreateBot', {
      'AccountId': accountId,
      'DisplayName': displayName,
      if (domain != null) 'Domain': domain,
    });
    return CreateBotResponse.fromJson(response_);
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
    var response_ = await _client.send('CreatePhoneNumberOrder', {
      'ProductType': productType,
      'E164PhoneNumbers': e164PhoneNumbers,
    });
    return CreatePhoneNumberOrderResponse.fromJson(response_);
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
    var response_ = await _client.send('CreateVoiceConnector', {
      'Name': name,
      'RequireEncryption': requireEncryption,
    });
    return CreateVoiceConnectorResponse.fromJson(response_);
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
    var response_ = await _client.send('DeleteAccount', {
      'AccountId': accountId,
    });
    return DeleteAccountResponse.fromJson(response_);
  }

  /// Deletes the events configuration that allows a bot to receive outgoing
  /// events.
  ///
  /// [accountId]: The Amazon Chime account ID.
  ///
  /// [botId]: The bot ID.
  Future<void> deleteEventsConfiguration(
      {@required String accountId, @required String botId}) async {
    await _client.send('DeleteEventsConfiguration', {
      'AccountId': accountId,
      'BotId': botId,
    });
  }

  /// Moves the specified phone number into the **Deletion queue**. A phone
  /// number must be disassociated from any users or Amazon Chime Voice
  /// Connectors before it can be deleted.
  ///
  /// Deleted phone numbers remain in the **Deletion queue** for 7 days before
  /// they are deleted permanently.
  ///
  /// [phoneNumberId]: The phone number ID.
  Future<void> deletePhoneNumber(String phoneNumberId) async {
    await _client.send('DeletePhoneNumber', {
      'PhoneNumberId': phoneNumberId,
    });
  }

  /// Deletes the specified Amazon Chime Voice Connector. Any phone numbers
  /// assigned to the Amazon Chime Voice Connector must be unassigned from it
  /// before it can be deleted.
  ///
  /// [voiceConnectorId]: The Amazon Chime Voice Connector ID.
  Future<void> deleteVoiceConnector(String voiceConnectorId) async {
    await _client.send('DeleteVoiceConnector', {
      'VoiceConnectorId': voiceConnectorId,
    });
  }

  /// Deletes the origination settings for the specified Amazon Chime Voice
  /// Connector.
  ///
  /// [voiceConnectorId]: The Amazon Chime Voice Connector ID.
  Future<void> deleteVoiceConnectorOrigination(String voiceConnectorId) async {
    await _client.send('DeleteVoiceConnectorOrigination', {
      'VoiceConnectorId': voiceConnectorId,
    });
  }

  /// Deletes the termination settings for the specified Amazon Chime Voice
  /// Connector.
  ///
  /// [voiceConnectorId]: The Amazon Chime Voice Connector ID.
  Future<void> deleteVoiceConnectorTermination(String voiceConnectorId) async {
    await _client.send('DeleteVoiceConnectorTermination', {
      'VoiceConnectorId': voiceConnectorId,
    });
  }

  /// Deletes the specified SIP credentials used by your equipment to
  /// authenticate during call termination.
  ///
  /// [voiceConnectorId]: The Amazon Chime Voice Connector ID.
  ///
  /// [usernames]: The RFC2617 compliant username associated with the SIP
  /// credentials, in US-ASCII format.
  Future<void> deleteVoiceConnectorTerminationCredentials(
      String voiceConnectorId,
      {List<String> usernames}) async {
    await _client.send('DeleteVoiceConnectorTerminationCredentials', {
      'VoiceConnectorId': voiceConnectorId,
      if (usernames != null) 'Usernames': usernames,
    });
  }

  /// Disassociates the primary provisioned phone number from the specified
  /// Amazon Chime user.
  ///
  /// [accountId]: The Amazon Chime account ID.
  ///
  /// [userId]: The user ID.
  Future<DisassociatePhoneNumberFromUserResponse>
      disassociatePhoneNumberFromUser(
          {@required String accountId, @required String userId}) async {
    var response_ = await _client.send('DisassociatePhoneNumberFromUser', {
      'AccountId': accountId,
      'UserId': userId,
    });
    return DisassociatePhoneNumberFromUserResponse.fromJson(response_);
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
    var response_ =
        await _client.send('DisassociatePhoneNumbersFromVoiceConnector', {
      'VoiceConnectorId': voiceConnectorId,
      if (e164PhoneNumbers != null) 'E164PhoneNumbers': e164PhoneNumbers,
    });
    return DisassociatePhoneNumbersFromVoiceConnectorResponse.fromJson(
        response_);
  }

  /// Retrieves details for the specified Amazon Chime account, such as account
  /// type and supported licenses.
  ///
  /// [accountId]: The Amazon Chime account ID.
  Future<GetAccountResponse> getAccount(String accountId) async {
    var response_ = await _client.send('GetAccount', {
      'AccountId': accountId,
    });
    return GetAccountResponse.fromJson(response_);
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
    var response_ = await _client.send('GetAccountSettings', {
      'AccountId': accountId,
    });
    return GetAccountSettingsResponse.fromJson(response_);
  }

  /// Retrieves details for the specified bot, such as bot email address, bot
  /// type, status, and display name.
  ///
  /// [accountId]: The Amazon Chime account ID.
  ///
  /// [botId]: The bot ID.
  Future<GetBotResponse> getBot(
      {@required String accountId, @required String botId}) async {
    var response_ = await _client.send('GetBot', {
      'AccountId': accountId,
      'BotId': botId,
    });
    return GetBotResponse.fromJson(response_);
  }

  /// Gets details for an events configuration that allows a bot to receive
  /// outgoing events, such as an HTTPS endpoint or Lambda function ARN.
  ///
  /// [accountId]: The Amazon Chime account ID.
  ///
  /// [botId]: The bot ID.
  Future<GetEventsConfigurationResponse> getEventsConfiguration(
      {@required String accountId, @required String botId}) async {
    var response_ = await _client.send('GetEventsConfiguration', {
      'AccountId': accountId,
      'BotId': botId,
    });
    return GetEventsConfigurationResponse.fromJson(response_);
  }

  /// Retrieves global settings for the administrator's AWS account, such as
  /// Amazon Chime Business Calling and Amazon Chime Voice Connector settings.
  Future<GetGlobalSettingsResponse> getGlobalSettings() async {
    var response_ = await _client.send('GetGlobalSettings', {});
    return GetGlobalSettingsResponse.fromJson(response_);
  }

  /// Retrieves details for the specified phone number ID, such as associations,
  /// capabilities, and product type.
  ///
  /// [phoneNumberId]: The phone number ID.
  Future<GetPhoneNumberResponse> getPhoneNumber(String phoneNumberId) async {
    var response_ = await _client.send('GetPhoneNumber', {
      'PhoneNumberId': phoneNumberId,
    });
    return GetPhoneNumberResponse.fromJson(response_);
  }

  /// Retrieves details for the specified phone number order, such as order
  /// creation timestamp, phone numbers in E.164 format, product type, and order
  /// status.
  ///
  /// [phoneNumberOrderId]: The ID for the phone number order.
  Future<GetPhoneNumberOrderResponse> getPhoneNumberOrder(
      String phoneNumberOrderId) async {
    var response_ = await _client.send('GetPhoneNumberOrder', {
      'PhoneNumberOrderId': phoneNumberOrderId,
    });
    return GetPhoneNumberOrderResponse.fromJson(response_);
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
    var response_ = await _client.send('GetUser', {
      'AccountId': accountId,
      'UserId': userId,
    });
    return GetUserResponse.fromJson(response_);
  }

  /// Retrieves settings for the specified user ID, such as any associated phone
  /// number settings.
  ///
  /// [accountId]: The Amazon Chime account ID.
  ///
  /// [userId]: The user ID.
  Future<GetUserSettingsResponse> getUserSettings(
      {@required String accountId, @required String userId}) async {
    var response_ = await _client.send('GetUserSettings', {
      'AccountId': accountId,
      'UserId': userId,
    });
    return GetUserSettingsResponse.fromJson(response_);
  }

  /// Retrieves details for the specified Amazon Chime Voice Connector, such as
  /// timestamps, name, outbound host, and encryption requirements.
  ///
  /// [voiceConnectorId]: The Amazon Chime Voice Connector ID.
  Future<GetVoiceConnectorResponse> getVoiceConnector(
      String voiceConnectorId) async {
    var response_ = await _client.send('GetVoiceConnector', {
      'VoiceConnectorId': voiceConnectorId,
    });
    return GetVoiceConnectorResponse.fromJson(response_);
  }

  /// Retrieves origination setting details for the specified Amazon Chime Voice
  /// Connector.
  ///
  /// [voiceConnectorId]: The Amazon Chime Voice Connector ID.
  Future<GetVoiceConnectorOriginationResponse> getVoiceConnectorOrigination(
      String voiceConnectorId) async {
    var response_ = await _client.send('GetVoiceConnectorOrigination', {
      'VoiceConnectorId': voiceConnectorId,
    });
    return GetVoiceConnectorOriginationResponse.fromJson(response_);
  }

  /// Retrieves termination setting details for the specified Amazon Chime Voice
  /// Connector.
  ///
  /// [voiceConnectorId]: The Amazon Chime Voice Connector ID.
  Future<GetVoiceConnectorTerminationResponse> getVoiceConnectorTermination(
      String voiceConnectorId) async {
    var response_ = await _client.send('GetVoiceConnectorTermination', {
      'VoiceConnectorId': voiceConnectorId,
    });
    return GetVoiceConnectorTerminationResponse.fromJson(response_);
  }

  /// Retrieves information about the last time a SIP `OPTIONS` ping was
  /// received from your SIP infrastructure for the specified Amazon Chime Voice
  /// Connector.
  ///
  /// [voiceConnectorId]: The Amazon Chime Voice Connector ID.
  Future<GetVoiceConnectorTerminationHealthResponse>
      getVoiceConnectorTerminationHealth(String voiceConnectorId) async {
    var response_ = await _client.send('GetVoiceConnectorTerminationHealth', {
      'VoiceConnectorId': voiceConnectorId,
    });
    return GetVoiceConnectorTerminationHealthResponse.fromJson(response_);
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
    var response_ = await _client.send('InviteUsers', {
      'AccountId': accountId,
      'UserEmailList': userEmailList,
    });
    return InviteUsersResponse.fromJson(response_);
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
    var response_ = await _client.send('ListAccounts', {
      if (name != null) 'Name': name,
      if (userEmail != null) 'UserEmail': userEmail,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return ListAccountsResponse.fromJson(response_);
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
    var response_ = await _client.send('ListBots', {
      'AccountId': accountId,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListBotsResponse.fromJson(response_);
  }

  /// Lists the phone number orders for the administrator's Amazon Chime
  /// account.
  ///
  /// [nextToken]: The token to use to retrieve the next page of results.
  ///
  /// [maxResults]: The maximum number of results to return in a single call.
  Future<ListPhoneNumberOrdersResponse> listPhoneNumberOrders(
      {String nextToken, int maxResults}) async {
    var response_ = await _client.send('ListPhoneNumberOrders', {
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return ListPhoneNumberOrdersResponse.fromJson(response_);
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
    var response_ = await _client.send('ListPhoneNumbers', {
      if (status != null) 'Status': status,
      if (productType != null) 'ProductType': productType,
      if (filterName != null) 'FilterName': filterName,
      if (filterValue != null) 'FilterValue': filterValue,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListPhoneNumbersResponse.fromJson(response_);
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
    var response_ = await _client.send('ListUsers', {
      'AccountId': accountId,
      if (userEmail != null) 'UserEmail': userEmail,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListUsersResponse.fromJson(response_);
  }

  /// Lists the SIP credentials for the specified Amazon Chime Voice Connector.
  ///
  /// [voiceConnectorId]: The Amazon Chime Voice Connector ID.
  Future<ListVoiceConnectorTerminationCredentialsResponse>
      listVoiceConnectorTerminationCredentials(String voiceConnectorId) async {
    var response_ =
        await _client.send('ListVoiceConnectorTerminationCredentials', {
      'VoiceConnectorId': voiceConnectorId,
    });
    return ListVoiceConnectorTerminationCredentialsResponse.fromJson(response_);
  }

  /// Lists the Amazon Chime Voice Connectors for the administrator's AWS
  /// account.
  ///
  /// [nextToken]: The token to use to retrieve the next page of results.
  ///
  /// [maxResults]: The maximum number of results to return in a single call.
  Future<ListVoiceConnectorsResponse> listVoiceConnectors(
      {String nextToken, int maxResults}) async {
    var response_ = await _client.send('ListVoiceConnectors', {
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return ListVoiceConnectorsResponse.fromJson(response_);
  }

  /// Logs out the specified user from all of the devices they are currently
  /// logged into.
  ///
  /// [accountId]: The Amazon Chime account ID.
  ///
  /// [userId]: The user ID.
  Future<LogoutUserResponse> logoutUser(
      {@required String accountId, @required String userId}) async {
    var response_ = await _client.send('LogoutUser', {
      'AccountId': accountId,
      'UserId': userId,
    });
    return LogoutUserResponse.fromJson(response_);
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
    var response_ = await _client.send('PutEventsConfiguration', {
      'AccountId': accountId,
      'BotId': botId,
      if (outboundEventsHttpsEndpoint != null)
        'OutboundEventsHTTPSEndpoint': outboundEventsHttpsEndpoint,
      if (lambdaFunctionArn != null) 'LambdaFunctionArn': lambdaFunctionArn,
    });
    return PutEventsConfigurationResponse.fromJson(response_);
  }

  /// Adds origination settings for the specified Amazon Chime Voice Connector.
  ///
  /// [voiceConnectorId]: The Amazon Chime Voice Connector ID.
  ///
  /// [origination]: The origination setting details to add.
  Future<PutVoiceConnectorOriginationResponse> putVoiceConnectorOrigination(
      {@required String voiceConnectorId,
      @required Origination origination}) async {
    var response_ = await _client.send('PutVoiceConnectorOrigination', {
      'VoiceConnectorId': voiceConnectorId,
      'Origination': origination,
    });
    return PutVoiceConnectorOriginationResponse.fromJson(response_);
  }

  /// Adds termination settings for the specified Amazon Chime Voice Connector.
  ///
  /// [voiceConnectorId]: The Amazon Chime Voice Connector ID.
  ///
  /// [termination]: The termination setting details to add.
  Future<PutVoiceConnectorTerminationResponse> putVoiceConnectorTermination(
      {@required String voiceConnectorId,
      @required Termination termination}) async {
    var response_ = await _client.send('PutVoiceConnectorTermination', {
      'VoiceConnectorId': voiceConnectorId,
      'Termination': termination,
    });
    return PutVoiceConnectorTerminationResponse.fromJson(response_);
  }

  /// Adds termination SIP credentials for the specified Amazon Chime Voice
  /// Connector.
  ///
  /// [voiceConnectorId]: The Amazon Chime Voice Connector ID.
  ///
  /// [credentials]: The termination SIP credentials.
  Future<void> putVoiceConnectorTerminationCredentials(String voiceConnectorId,
      {List<Credential> credentials}) async {
    await _client.send('PutVoiceConnectorTerminationCredentials', {
      'VoiceConnectorId': voiceConnectorId,
      if (credentials != null) 'Credentials': credentials,
    });
  }

  /// Regenerates the security token for a bot.
  ///
  /// [accountId]: The Amazon Chime account ID.
  ///
  /// [botId]: The bot ID.
  Future<RegenerateSecurityTokenResponse> regenerateSecurityToken(
      {@required String accountId, @required String botId}) async {
    var response_ = await _client.send('RegenerateSecurityToken', {
      'AccountId': accountId,
      'BotId': botId,
    });
    return RegenerateSecurityTokenResponse.fromJson(response_);
  }

  /// Resets the personal meeting PIN for the specified user on an Amazon Chime
  /// account. Returns the User object with the updated personal meeting PIN.
  ///
  /// [accountId]: The Amazon Chime account ID.
  ///
  /// [userId]: The user ID.
  Future<ResetPersonalPinResponse> resetPersonalPin(
      {@required String accountId, @required String userId}) async {
    var response_ = await _client.send('ResetPersonalPIN', {
      'AccountId': accountId,
      'UserId': userId,
    });
    return ResetPersonalPinResponse.fromJson(response_);
  }

  /// Moves a phone number from the **Deletion queue** back into the phone
  /// number **Inventory**.
  ///
  /// [phoneNumberId]: The phone number.
  Future<RestorePhoneNumberResponse> restorePhoneNumber(
      String phoneNumberId) async {
    var response_ = await _client.send('RestorePhoneNumber', {
      'PhoneNumberId': phoneNumberId,
    });
    return RestorePhoneNumberResponse.fromJson(response_);
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
    var response_ = await _client.send('SearchAvailablePhoneNumbers', {
      if (areaCode != null) 'AreaCode': areaCode,
      if (city != null) 'City': city,
      if (country != null) 'Country': country,
      if (state != null) 'State': state,
      if (tollFreePrefix != null) 'TollFreePrefix': tollFreePrefix,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return SearchAvailablePhoneNumbersResponse.fromJson(response_);
  }

  /// Updates account details for the specified Amazon Chime account. Currently,
  /// only account name updates are supported for this action.
  ///
  /// [accountId]: The Amazon Chime account ID.
  ///
  /// [name]: The new name for the specified Amazon Chime account.
  Future<UpdateAccountResponse> updateAccount(String accountId,
      {String name}) async {
    var response_ = await _client.send('UpdateAccount', {
      'AccountId': accountId,
      if (name != null) 'Name': name,
    });
    return UpdateAccountResponse.fromJson(response_);
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
    var response_ = await _client.send('UpdateAccountSettings', {
      'AccountId': accountId,
      'AccountSettings': accountSettings,
    });
    return UpdateAccountSettingsResponse.fromJson(response_);
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
    var response_ = await _client.send('UpdateBot', {
      'AccountId': accountId,
      'BotId': botId,
      if (disabled != null) 'Disabled': disabled,
    });
    return UpdateBotResponse.fromJson(response_);
  }

  /// Updates global settings for the administrator's AWS account, such as
  /// Amazon Chime Business Calling and Amazon Chime Voice Connector settings.
  ///
  /// [businessCalling]: The Amazon Chime Business Calling settings.
  ///
  /// [voiceConnector]: The Amazon Chime Voice Connector settings.
  Future<void> updateGlobalSettings(
      {@required BusinessCallingSettings businessCalling,
      @required VoiceConnectorSettings voiceConnector}) async {
    await _client.send('UpdateGlobalSettings', {
      'BusinessCalling': businessCalling,
      'VoiceConnector': voiceConnector,
    });
  }

  /// Updates phone number details, such as product type, for the specified
  /// phone number ID. For toll-free numbers, you can use only the Amazon Chime
  /// Voice Connector product type.
  ///
  /// [phoneNumberId]: The phone number ID.
  ///
  /// [productType]: The product type.
  Future<UpdatePhoneNumberResponse> updatePhoneNumber(String phoneNumberId,
      {String productType}) async {
    var response_ = await _client.send('UpdatePhoneNumber', {
      'PhoneNumberId': phoneNumberId,
      if (productType != null) 'ProductType': productType,
    });
    return UpdatePhoneNumberResponse.fromJson(response_);
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
    var response_ = await _client.send('UpdateUser', {
      'AccountId': accountId,
      'UserId': userId,
      if (licenseType != null) 'LicenseType': licenseType,
    });
    return UpdateUserResponse.fromJson(response_);
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
      @required UserSettings userSettings}) async {
    await _client.send('UpdateUserSettings', {
      'AccountId': accountId,
      'UserId': userId,
      'UserSettings': userSettings,
    });
  }

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
    var response_ = await _client.send('UpdateVoiceConnector', {
      'VoiceConnectorId': voiceConnectorId,
      'Name': name,
      'RequireEncryption': requireEncryption,
    });
    return UpdateVoiceConnectorResponse.fromJson(response_);
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
  static Account fromJson(Map<String, dynamic> json) => Account(
        awsAccountId: json['AwsAccountId'] as String,
        accountId: json['AccountId'] as String,
        name: json['Name'] as String,
        accountType: json.containsKey('AccountType')
            ? json['AccountType'] as String
            : null,
        createdTimestamp: json.containsKey('CreatedTimestamp')
            ? DateTime.parse(json['CreatedTimestamp'])
            : null,
        defaultLicense: json.containsKey('DefaultLicense')
            ? json['DefaultLicense'] as String
            : null,
        supportedLicenses: json.containsKey('SupportedLicenses')
            ? (json['SupportedLicenses'] as List)
                .map((e) => e as String)
                .toList()
            : null,
      );
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
  static AccountSettings fromJson(Map<String, dynamic> json) => AccountSettings(
        disableRemoteControl: json.containsKey('DisableRemoteControl')
            ? json['DisableRemoteControl'] as bool
            : null,
        enableDialOut: json.containsKey('EnableDialOut')
            ? json['EnableDialOut'] as bool
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
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
      AssociatePhoneNumbersWithVoiceConnectorResponse(
        phoneNumberErrors: json.containsKey('PhoneNumberErrors')
            ? (json['PhoneNumberErrors'] as List)
                .map((e) => PhoneNumberError.fromJson(e))
                .toList()
            : null,
      );
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
      BatchDeletePhoneNumberResponse(
        phoneNumberErrors: json.containsKey('PhoneNumberErrors')
            ? (json['PhoneNumberErrors'] as List)
                .map((e) => PhoneNumberError.fromJson(e))
                .toList()
            : null,
      );
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
      BatchSuspendUserResponse(
        userErrors: json.containsKey('UserErrors')
            ? (json['UserErrors'] as List)
                .map((e) => UserError.fromJson(e))
                .toList()
            : null,
      );
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
      BatchUnsuspendUserResponse(
        userErrors: json.containsKey('UserErrors')
            ? (json['UserErrors'] as List)
                .map((e) => UserError.fromJson(e))
                .toList()
            : null,
      );
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
      BatchUpdatePhoneNumberResponse(
        phoneNumberErrors: json.containsKey('PhoneNumberErrors')
            ? (json['PhoneNumberErrors'] as List)
                .map((e) => PhoneNumberError.fromJson(e))
                .toList()
            : null,
      );
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
      BatchUpdateUserResponse(
        userErrors: json.containsKey('UserErrors')
            ? (json['UserErrors'] as List)
                .map((e) => UserError.fromJson(e))
                .toList()
            : null,
      );
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
  static Bot fromJson(Map<String, dynamic> json) => Bot(
        botId: json.containsKey('BotId') ? json['BotId'] as String : null,
        userId: json.containsKey('UserId') ? json['UserId'] as String : null,
        displayName: json.containsKey('DisplayName')
            ? json['DisplayName'] as String
            : null,
        botType: json.containsKey('BotType') ? json['BotType'] as String : null,
        disabled:
            json.containsKey('Disabled') ? json['Disabled'] as bool : null,
        createdTimestamp: json.containsKey('CreatedTimestamp')
            ? DateTime.parse(json['CreatedTimestamp'])
            : null,
        updatedTimestamp: json.containsKey('UpdatedTimestamp')
            ? DateTime.parse(json['UpdatedTimestamp'])
            : null,
        botEmail:
            json.containsKey('BotEmail') ? json['BotEmail'] as String : null,
        securityToken: json.containsKey('SecurityToken')
            ? json['SecurityToken'] as String
            : null,
      );
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
      BusinessCallingSettings(
        cdrBucket:
            json.containsKey('CdrBucket') ? json['CdrBucket'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class CreateAccountResponse {
  /// The Amazon Chime account details.
  final Account account;

  CreateAccountResponse({
    this.account,
  });
  static CreateAccountResponse fromJson(Map<String, dynamic> json) =>
      CreateAccountResponse(
        account: json.containsKey('Account')
            ? Account.fromJson(json['Account'])
            : null,
      );
}

class CreateBotResponse {
  /// The bot details.
  final Bot bot;

  CreateBotResponse({
    this.bot,
  });
  static CreateBotResponse fromJson(Map<String, dynamic> json) =>
      CreateBotResponse(
        bot: json.containsKey('Bot') ? Bot.fromJson(json['Bot']) : null,
      );
}

class CreatePhoneNumberOrderResponse {
  /// The phone number order details.
  final PhoneNumberOrder phoneNumberOrder;

  CreatePhoneNumberOrderResponse({
    this.phoneNumberOrder,
  });
  static CreatePhoneNumberOrderResponse fromJson(Map<String, dynamic> json) =>
      CreatePhoneNumberOrderResponse(
        phoneNumberOrder: json.containsKey('PhoneNumberOrder')
            ? PhoneNumberOrder.fromJson(json['PhoneNumberOrder'])
            : null,
      );
}

class CreateVoiceConnectorResponse {
  /// The Amazon Chime Voice Connector details.
  final VoiceConnector voiceConnector;

  CreateVoiceConnectorResponse({
    this.voiceConnector,
  });
  static CreateVoiceConnectorResponse fromJson(Map<String, dynamic> json) =>
      CreateVoiceConnectorResponse(
        voiceConnector: json.containsKey('VoiceConnector')
            ? VoiceConnector.fromJson(json['VoiceConnector'])
            : null,
      );
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
  Map<String, dynamic> toJson() => <String, dynamic>{};
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
      DisassociatePhoneNumbersFromVoiceConnectorResponse(
        phoneNumberErrors: json.containsKey('PhoneNumberErrors')
            ? (json['PhoneNumberErrors'] as List)
                .map((e) => PhoneNumberError.fromJson(e))
                .toList()
            : null,
      );
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
      EventsConfiguration(
        botId: json.containsKey('BotId') ? json['BotId'] as String : null,
        outboundEventsHttpsEndpoint:
            json.containsKey('OutboundEventsHTTPSEndpoint')
                ? json['OutboundEventsHTTPSEndpoint'] as String
                : null,
        lambdaFunctionArn: json.containsKey('LambdaFunctionArn')
            ? json['LambdaFunctionArn'] as String
            : null,
      );
}

class GetAccountResponse {
  /// The Amazon Chime account details.
  final Account account;

  GetAccountResponse({
    this.account,
  });
  static GetAccountResponse fromJson(Map<String, dynamic> json) =>
      GetAccountResponse(
        account: json.containsKey('Account')
            ? Account.fromJson(json['Account'])
            : null,
      );
}

class GetAccountSettingsResponse {
  /// The Amazon Chime account settings.
  final AccountSettings accountSettings;

  GetAccountSettingsResponse({
    this.accountSettings,
  });
  static GetAccountSettingsResponse fromJson(Map<String, dynamic> json) =>
      GetAccountSettingsResponse(
        accountSettings: json.containsKey('AccountSettings')
            ? AccountSettings.fromJson(json['AccountSettings'])
            : null,
      );
}

class GetBotResponse {
  /// The chat bot details.
  final Bot bot;

  GetBotResponse({
    this.bot,
  });
  static GetBotResponse fromJson(Map<String, dynamic> json) => GetBotResponse(
        bot: json.containsKey('Bot') ? Bot.fromJson(json['Bot']) : null,
      );
}

class GetEventsConfigurationResponse {
  /// The events configuration details.
  final EventsConfiguration eventsConfiguration;

  GetEventsConfigurationResponse({
    this.eventsConfiguration,
  });
  static GetEventsConfigurationResponse fromJson(Map<String, dynamic> json) =>
      GetEventsConfigurationResponse(
        eventsConfiguration: json.containsKey('EventsConfiguration')
            ? EventsConfiguration.fromJson(json['EventsConfiguration'])
            : null,
      );
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
      GetGlobalSettingsResponse(
        businessCalling: json.containsKey('BusinessCalling')
            ? BusinessCallingSettings.fromJson(json['BusinessCalling'])
            : null,
        voiceConnector: json.containsKey('VoiceConnector')
            ? VoiceConnectorSettings.fromJson(json['VoiceConnector'])
            : null,
      );
}

class GetPhoneNumberOrderResponse {
  /// The phone number order details.
  final PhoneNumberOrder phoneNumberOrder;

  GetPhoneNumberOrderResponse({
    this.phoneNumberOrder,
  });
  static GetPhoneNumberOrderResponse fromJson(Map<String, dynamic> json) =>
      GetPhoneNumberOrderResponse(
        phoneNumberOrder: json.containsKey('PhoneNumberOrder')
            ? PhoneNumberOrder.fromJson(json['PhoneNumberOrder'])
            : null,
      );
}

class GetPhoneNumberResponse {
  /// The phone number details.
  final PhoneNumber phoneNumber;

  GetPhoneNumberResponse({
    this.phoneNumber,
  });
  static GetPhoneNumberResponse fromJson(Map<String, dynamic> json) =>
      GetPhoneNumberResponse(
        phoneNumber: json.containsKey('PhoneNumber')
            ? PhoneNumber.fromJson(json['PhoneNumber'])
            : null,
      );
}

class GetUserResponse {
  /// The user details.
  final User user;

  GetUserResponse({
    this.user,
  });
  static GetUserResponse fromJson(Map<String, dynamic> json) => GetUserResponse(
        user: json.containsKey('User') ? User.fromJson(json['User']) : null,
      );
}

class GetUserSettingsResponse {
  /// The user settings.
  final UserSettings userSettings;

  GetUserSettingsResponse({
    this.userSettings,
  });
  static GetUserSettingsResponse fromJson(Map<String, dynamic> json) =>
      GetUserSettingsResponse(
        userSettings: json.containsKey('UserSettings')
            ? UserSettings.fromJson(json['UserSettings'])
            : null,
      );
}

class GetVoiceConnectorOriginationResponse {
  /// The origination setting details.
  final Origination origination;

  GetVoiceConnectorOriginationResponse({
    this.origination,
  });
  static GetVoiceConnectorOriginationResponse fromJson(
          Map<String, dynamic> json) =>
      GetVoiceConnectorOriginationResponse(
        origination: json.containsKey('Origination')
            ? Origination.fromJson(json['Origination'])
            : null,
      );
}

class GetVoiceConnectorResponse {
  /// The Amazon Chime Voice Connector details.
  final VoiceConnector voiceConnector;

  GetVoiceConnectorResponse({
    this.voiceConnector,
  });
  static GetVoiceConnectorResponse fromJson(Map<String, dynamic> json) =>
      GetVoiceConnectorResponse(
        voiceConnector: json.containsKey('VoiceConnector')
            ? VoiceConnector.fromJson(json['VoiceConnector'])
            : null,
      );
}

class GetVoiceConnectorTerminationHealthResponse {
  /// The termination health details.
  final TerminationHealth terminationHealth;

  GetVoiceConnectorTerminationHealthResponse({
    this.terminationHealth,
  });
  static GetVoiceConnectorTerminationHealthResponse fromJson(
          Map<String, dynamic> json) =>
      GetVoiceConnectorTerminationHealthResponse(
        terminationHealth: json.containsKey('TerminationHealth')
            ? TerminationHealth.fromJson(json['TerminationHealth'])
            : null,
      );
}

class GetVoiceConnectorTerminationResponse {
  /// The termination setting details.
  final Termination termination;

  GetVoiceConnectorTerminationResponse({
    this.termination,
  });
  static GetVoiceConnectorTerminationResponse fromJson(
          Map<String, dynamic> json) =>
      GetVoiceConnectorTerminationResponse(
        termination: json.containsKey('Termination')
            ? Termination.fromJson(json['Termination'])
            : null,
      );
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
  static Invite fromJson(Map<String, dynamic> json) => Invite(
        inviteId:
            json.containsKey('InviteId') ? json['InviteId'] as String : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        emailAddress: json.containsKey('EmailAddress')
            ? json['EmailAddress'] as String
            : null,
        emailStatus: json.containsKey('EmailStatus')
            ? json['EmailStatus'] as String
            : null,
      );
}

class InviteUsersResponse {
  /// The invite details.
  final List<Invite> invites;

  InviteUsersResponse({
    this.invites,
  });
  static InviteUsersResponse fromJson(Map<String, dynamic> json) =>
      InviteUsersResponse(
        invites: json.containsKey('Invites')
            ? (json['Invites'] as List).map((e) => Invite.fromJson(e)).toList()
            : null,
      );
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
      ListAccountsResponse(
        accounts: json.containsKey('Accounts')
            ? (json['Accounts'] as List)
                .map((e) => Account.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
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
      ListBotsResponse(
        bots: json.containsKey('Bots')
            ? (json['Bots'] as List).map((e) => Bot.fromJson(e)).toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
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
      ListPhoneNumberOrdersResponse(
        phoneNumberOrders: json.containsKey('PhoneNumberOrders')
            ? (json['PhoneNumberOrders'] as List)
                .map((e) => PhoneNumberOrder.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
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
      ListPhoneNumbersResponse(
        phoneNumbers: json.containsKey('PhoneNumbers')
            ? (json['PhoneNumbers'] as List)
                .map((e) => PhoneNumber.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
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
      ListUsersResponse(
        users: json.containsKey('Users')
            ? (json['Users'] as List).map((e) => User.fromJson(e)).toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListVoiceConnectorTerminationCredentialsResponse {
  /// A list of user names.
  final List<String> usernames;

  ListVoiceConnectorTerminationCredentialsResponse({
    this.usernames,
  });
  static ListVoiceConnectorTerminationCredentialsResponse fromJson(
          Map<String, dynamic> json) =>
      ListVoiceConnectorTerminationCredentialsResponse(
        usernames: json.containsKey('Usernames')
            ? (json['Usernames'] as List).map((e) => e as String).toList()
            : null,
      );
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
      ListVoiceConnectorsResponse(
        voiceConnectors: json.containsKey('VoiceConnectors')
            ? (json['VoiceConnectors'] as List)
                .map((e) => VoiceConnector.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
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
      OrderedPhoneNumber(
        e164PhoneNumber: json.containsKey('E164PhoneNumber')
            ? json['E164PhoneNumber'] as String
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
      );
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
  static Origination fromJson(Map<String, dynamic> json) => Origination(
        routes: json.containsKey('Routes')
            ? (json['Routes'] as List)
                .map((e) => OriginationRoute.fromJson(e))
                .toList()
            : null,
        disabled:
            json.containsKey('Disabled') ? json['Disabled'] as bool : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
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
      OriginationRoute(
        host: json.containsKey('Host') ? json['Host'] as String : null,
        port: json.containsKey('Port') ? json['Port'] as int : null,
        protocol:
            json.containsKey('Protocol') ? json['Protocol'] as String : null,
        priority: json.containsKey('Priority') ? json['Priority'] as int : null,
        weight: json.containsKey('Weight') ? json['Weight'] as int : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
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
  static PhoneNumber fromJson(Map<String, dynamic> json) => PhoneNumber(
        phoneNumberId: json.containsKey('PhoneNumberId')
            ? json['PhoneNumberId'] as String
            : null,
        e164PhoneNumber: json.containsKey('E164PhoneNumber')
            ? json['E164PhoneNumber'] as String
            : null,
        type: json.containsKey('Type') ? json['Type'] as String : null,
        productType: json.containsKey('ProductType')
            ? json['ProductType'] as String
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        capabilities: json.containsKey('Capabilities')
            ? PhoneNumberCapabilities.fromJson(json['Capabilities'])
            : null,
        associations: json.containsKey('Associations')
            ? (json['Associations'] as List)
                .map((e) => PhoneNumberAssociation.fromJson(e))
                .toList()
            : null,
        createdTimestamp: json.containsKey('CreatedTimestamp')
            ? DateTime.parse(json['CreatedTimestamp'])
            : null,
        updatedTimestamp: json.containsKey('UpdatedTimestamp')
            ? DateTime.parse(json['UpdatedTimestamp'])
            : null,
        deletionTimestamp: json.containsKey('DeletionTimestamp')
            ? DateTime.parse(json['DeletionTimestamp'])
            : null,
      );
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
      PhoneNumberAssociation(
        value: json.containsKey('Value') ? json['Value'] as String : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        associatedTimestamp: json.containsKey('AssociatedTimestamp')
            ? DateTime.parse(json['AssociatedTimestamp'])
            : null,
      );
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
      PhoneNumberCapabilities(
        inboundCall: json.containsKey('InboundCall')
            ? json['InboundCall'] as bool
            : null,
        outboundCall: json.containsKey('OutboundCall')
            ? json['OutboundCall'] as bool
            : null,
        inboundSms:
            json.containsKey('InboundSMS') ? json['InboundSMS'] as bool : null,
        outboundSms: json.containsKey('OutboundSMS')
            ? json['OutboundSMS'] as bool
            : null,
        inboundMms:
            json.containsKey('InboundMMS') ? json['InboundMMS'] as bool : null,
        outboundMms: json.containsKey('OutboundMMS')
            ? json['OutboundMMS'] as bool
            : null,
      );
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
      PhoneNumberError(
        phoneNumberId: json.containsKey('PhoneNumberId')
            ? json['PhoneNumberId'] as String
            : null,
        errorCode:
            json.containsKey('ErrorCode') ? json['ErrorCode'] as String : null,
        errorMessage: json.containsKey('ErrorMessage')
            ? json['ErrorMessage'] as String
            : null,
      );
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
      PhoneNumberOrder(
        phoneNumberOrderId: json.containsKey('PhoneNumberOrderId')
            ? json['PhoneNumberOrderId'] as String
            : null,
        productType: json.containsKey('ProductType')
            ? json['ProductType'] as String
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        orderedPhoneNumbers: json.containsKey('OrderedPhoneNumbers')
            ? (json['OrderedPhoneNumbers'] as List)
                .map((e) => OrderedPhoneNumber.fromJson(e))
                .toList()
            : null,
        createdTimestamp: json.containsKey('CreatedTimestamp')
            ? DateTime.parse(json['CreatedTimestamp'])
            : null,
        updatedTimestamp: json.containsKey('UpdatedTimestamp')
            ? DateTime.parse(json['UpdatedTimestamp'])
            : null,
      );
}

class PutEventsConfigurationResponse {
  final EventsConfiguration eventsConfiguration;

  PutEventsConfigurationResponse({
    this.eventsConfiguration,
  });
  static PutEventsConfigurationResponse fromJson(Map<String, dynamic> json) =>
      PutEventsConfigurationResponse(
        eventsConfiguration: json.containsKey('EventsConfiguration')
            ? EventsConfiguration.fromJson(json['EventsConfiguration'])
            : null,
      );
}

class PutVoiceConnectorOriginationResponse {
  /// The updated origination setting details.
  final Origination origination;

  PutVoiceConnectorOriginationResponse({
    this.origination,
  });
  static PutVoiceConnectorOriginationResponse fromJson(
          Map<String, dynamic> json) =>
      PutVoiceConnectorOriginationResponse(
        origination: json.containsKey('Origination')
            ? Origination.fromJson(json['Origination'])
            : null,
      );
}

class PutVoiceConnectorTerminationResponse {
  /// The updated termination setting details.
  final Termination termination;

  PutVoiceConnectorTerminationResponse({
    this.termination,
  });
  static PutVoiceConnectorTerminationResponse fromJson(
          Map<String, dynamic> json) =>
      PutVoiceConnectorTerminationResponse(
        termination: json.containsKey('Termination')
            ? Termination.fromJson(json['Termination'])
            : null,
      );
}

class RegenerateSecurityTokenResponse {
  final Bot bot;

  RegenerateSecurityTokenResponse({
    this.bot,
  });
  static RegenerateSecurityTokenResponse fromJson(Map<String, dynamic> json) =>
      RegenerateSecurityTokenResponse(
        bot: json.containsKey('Bot') ? Bot.fromJson(json['Bot']) : null,
      );
}

class ResetPersonalPinResponse {
  /// The user details and new personal meeting PIN.
  final User user;

  ResetPersonalPinResponse({
    this.user,
  });
  static ResetPersonalPinResponse fromJson(Map<String, dynamic> json) =>
      ResetPersonalPinResponse(
        user: json.containsKey('User') ? User.fromJson(json['User']) : null,
      );
}

class RestorePhoneNumberResponse {
  /// The phone number details.
  final PhoneNumber phoneNumber;

  RestorePhoneNumberResponse({
    this.phoneNumber,
  });
  static RestorePhoneNumberResponse fromJson(Map<String, dynamic> json) =>
      RestorePhoneNumberResponse(
        phoneNumber: json.containsKey('PhoneNumber')
            ? PhoneNumber.fromJson(json['PhoneNumber'])
            : null,
      );
}

class SearchAvailablePhoneNumbersResponse {
  /// List of phone numbers, in E.164 format.
  final List<String> e164PhoneNumbers;

  SearchAvailablePhoneNumbersResponse({
    this.e164PhoneNumbers,
  });
  static SearchAvailablePhoneNumbersResponse fromJson(
          Map<String, dynamic> json) =>
      SearchAvailablePhoneNumbersResponse(
        e164PhoneNumbers: json.containsKey('E164PhoneNumbers')
            ? (json['E164PhoneNumbers'] as List)
                .map((e) => e as String)
                .toList()
            : null,
      );
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
      TelephonySettings(
        inboundCalling: json['InboundCalling'] as bool,
        outboundCalling: json['OutboundCalling'] as bool,
        sms: json['SMS'] as bool,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
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
  static Termination fromJson(Map<String, dynamic> json) => Termination(
        cpsLimit: json.containsKey('CpsLimit') ? json['CpsLimit'] as int : null,
        defaultPhoneNumber: json.containsKey('DefaultPhoneNumber')
            ? json['DefaultPhoneNumber'] as String
            : null,
        callingRegions: json.containsKey('CallingRegions')
            ? (json['CallingRegions'] as List).map((e) => e as String).toList()
            : null,
        cidrAllowedList: json.containsKey('CidrAllowedList')
            ? (json['CidrAllowedList'] as List).map((e) => e as String).toList()
            : null,
        disabled:
            json.containsKey('Disabled') ? json['Disabled'] as bool : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
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
      TerminationHealth(
        timestamp: json.containsKey('Timestamp')
            ? DateTime.parse(json['Timestamp'])
            : null,
        source: json.containsKey('Source') ? json['Source'] as String : null,
      );
}

class UpdateAccountResponse {
  /// The updated Amazon Chime account details.
  final Account account;

  UpdateAccountResponse({
    this.account,
  });
  static UpdateAccountResponse fromJson(Map<String, dynamic> json) =>
      UpdateAccountResponse(
        account: json.containsKey('Account')
            ? Account.fromJson(json['Account'])
            : null,
      );
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
      UpdateBotResponse(
        bot: json.containsKey('Bot') ? Bot.fromJson(json['Bot']) : null,
      );
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
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class UpdatePhoneNumberResponse {
  /// The updated phone number details.
  final PhoneNumber phoneNumber;

  UpdatePhoneNumberResponse({
    this.phoneNumber,
  });
  static UpdatePhoneNumberResponse fromJson(Map<String, dynamic> json) =>
      UpdatePhoneNumberResponse(
        phoneNumber: json.containsKey('PhoneNumber')
            ? PhoneNumber.fromJson(json['PhoneNumber'])
            : null,
      );
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
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class UpdateUserResponse {
  /// The updated user details.
  final User user;

  UpdateUserResponse({
    this.user,
  });
  static UpdateUserResponse fromJson(Map<String, dynamic> json) =>
      UpdateUserResponse(
        user: json.containsKey('User') ? User.fromJson(json['User']) : null,
      );
}

class UpdateVoiceConnectorResponse {
  /// The Amazon Chime Voice Connector details.
  final VoiceConnector voiceConnector;

  UpdateVoiceConnectorResponse({
    this.voiceConnector,
  });
  static UpdateVoiceConnectorResponse fromJson(Map<String, dynamic> json) =>
      UpdateVoiceConnectorResponse(
        voiceConnector: json.containsKey('VoiceConnector')
            ? VoiceConnector.fromJson(json['VoiceConnector'])
            : null,
      );
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
  static User fromJson(Map<String, dynamic> json) => User(
        userId: json['UserId'] as String,
        accountId:
            json.containsKey('AccountId') ? json['AccountId'] as String : null,
        primaryEmail: json.containsKey('PrimaryEmail')
            ? json['PrimaryEmail'] as String
            : null,
        primaryProvisionedNumber: json.containsKey('PrimaryProvisionedNumber')
            ? json['PrimaryProvisionedNumber'] as String
            : null,
        displayName: json.containsKey('DisplayName')
            ? json['DisplayName'] as String
            : null,
        licenseType: json.containsKey('LicenseType')
            ? json['LicenseType'] as String
            : null,
        userRegistrationStatus: json.containsKey('UserRegistrationStatus')
            ? json['UserRegistrationStatus'] as String
            : null,
        userInvitationStatus: json.containsKey('UserInvitationStatus')
            ? json['UserInvitationStatus'] as String
            : null,
        registeredOn: json.containsKey('RegisteredOn')
            ? DateTime.parse(json['RegisteredOn'])
            : null,
        invitedOn: json.containsKey('InvitedOn')
            ? DateTime.parse(json['InvitedOn'])
            : null,
        personalPin: json.containsKey('PersonalPIN')
            ? json['PersonalPIN'] as String
            : null,
      );
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
  static UserError fromJson(Map<String, dynamic> json) => UserError(
        userId: json.containsKey('UserId') ? json['UserId'] as String : null,
        errorCode:
            json.containsKey('ErrorCode') ? json['ErrorCode'] as String : null,
        errorMessage: json.containsKey('ErrorMessage')
            ? json['ErrorMessage'] as String
            : null,
      );
}

/// Settings associated with an Amazon Chime user, including inbound and
/// outbound calling and text messaging.
class UserSettings {
  /// The telephony settings associated with the user.
  final TelephonySettings telephony;

  UserSettings({
    @required this.telephony,
  });
  static UserSettings fromJson(Map<String, dynamic> json) => UserSettings(
        telephony: TelephonySettings.fromJson(json['Telephony']),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
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
  static VoiceConnector fromJson(Map<String, dynamic> json) => VoiceConnector(
        voiceConnectorId: json.containsKey('VoiceConnectorId')
            ? json['VoiceConnectorId'] as String
            : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        outboundHostName: json.containsKey('OutboundHostName')
            ? json['OutboundHostName'] as String
            : null,
        requireEncryption: json.containsKey('RequireEncryption')
            ? json['RequireEncryption'] as bool
            : null,
        createdTimestamp: json.containsKey('CreatedTimestamp')
            ? DateTime.parse(json['CreatedTimestamp'])
            : null,
        updatedTimestamp: json.containsKey('UpdatedTimestamp')
            ? DateTime.parse(json['UpdatedTimestamp'])
            : null,
      );
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
      VoiceConnectorSettings(
        cdrBucket:
            json.containsKey('CdrBucket') ? json['CdrBucket'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}
