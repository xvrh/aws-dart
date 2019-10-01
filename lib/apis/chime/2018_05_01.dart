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
/// keys that you provide. For more information about AWS SDKs, see the [AWS
/// Developer Center](http://aws.amazon.com/developer/).
///
/// Using the AWS CLI
///
/// Use your access keys with the AWS CLI to make API calls. For information
/// about setting up the AWS CLI, see [Installing the AWS Command Line
/// Interface](https://docs.aws.amazon.com/cli/latest/userguide/installing.html)
/// in the _AWS Command Line Interface User Guide_. For a list of available
/// Amazon Chime commands, see the [Amazon Chime
/// commands](https://docs.aws.amazon.com/cli/latest/reference/chime/index.html)
/// in the _AWS CLI Command Reference_.
///
/// Using REST API
///
/// If you use REST to make API calls, you must authenticate your request by
/// providing a signature. Amazon Chime supports signature version 4. For more
/// information, see [Signature Version 4 Signing
/// Process](https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html)
/// in the _Amazon Web Services General Reference_.
///
/// When making REST API calls, use the service name `chime` and REST endpoint
/// `https://service.chime.aws.amazon.com`.
///
/// Administrative permissions are controlled using AWS Identity and Access
/// Management (IAM). For more information, see [Control Access to the Amazon
/// Chime
/// Console](https://docs.aws.amazon.com/chime/latest/ag/control-access.html) in
/// the _Amazon Chime Administration Guide_.
class ChimeApi {
  /// Associates a phone number with the specified Amazon Chime user.
  Future<void> associatePhoneNumberWithUser(
      {@required String accountId,
      @required String userId,
      @required String e164PhoneNumber}) async {}

  /// Associates a phone number with the specified Amazon Chime Voice Connector.
  Future<void> associatePhoneNumbersWithVoiceConnector(String voiceConnectorId,
      {List<String> e164PhoneNumbers}) async {}

  /// Moves phone numbers into the **Deletion queue**. Phone numbers must be
  /// disassociated from any users or Amazon Chime Voice Connectors before they
  /// can be deleted.
  ///
  /// Phone numbers remain in the **Deletion queue** for 7 days before they are
  /// deleted permanently.
  Future<void> batchDeletePhoneNumber(List<String> phoneNumberIds) async {}

  /// Suspends up to 50 users from a `Team` or `EnterpriseLWA` Amazon Chime
  /// account. For more information about different account types, see [Managing
  /// Your Amazon Chime
  /// Accounts](https://docs.aws.amazon.com/chime/latest/ag/manage-chime-account.html)
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
  Future<void> batchSuspendUser(
      {@required String accountId, @required List<String> userIdList}) async {}

  /// Removes the suspension from up to 50 previously suspended users for the
  /// specified Amazon Chime `EnterpriseLWA` account. Only users on
  /// `EnterpriseLWA` accounts can be unsuspended using this action. For more
  /// information about different account types, see [Managing Your Amazon Chime
  /// Accounts](https://docs.aws.amazon.com/chime/latest/ag/manage-chime-account.html)
  /// in the _Amazon Chime Administration Guide_.
  ///
  /// Previously suspended users who are unsuspended using this action are
  /// returned to `Registered` status. Users who are not previously suspended
  /// are ignored.
  Future<void> batchUnsuspendUser(
      {@required String accountId, @required List<String> userIdList}) async {}

  /// Updates phone number product types. Choose from Amazon Chime Business
  /// Calling and Amazon Chime Voice Connector product types. For toll-free
  /// numbers, you can use only the Amazon Chime Voice Connector product type.
  Future<void> batchUpdatePhoneNumber(
      List<UpdatePhoneNumberRequestItem> updatePhoneNumberRequestItems) async {}

  /// Updates user details within the UpdateUserRequestItem object for up to 20
  /// users for the specified Amazon Chime account. Currently, only
  /// `LicenseType` updates are supported for this action.
  Future<void> batchUpdateUser(
      {@required String accountId,
      @required List<UpdateUserRequestItem> updateUserRequestItems}) async {}

  /// Creates an Amazon Chime account under the administrator's AWS account.
  /// Only `Team` account types are currently supported for this action. For
  /// more information about different account types, see [Managing Your Amazon
  /// Chime
  /// Accounts](https://docs.aws.amazon.com/chime/latest/ag/manage-chime-account.html)
  /// in the _Amazon Chime Administration Guide_.
  Future<void> createAccount(String name) async {}

  /// Creates a bot for an Amazon Chime Enterprise account.
  Future<void> createBot(
      {@required String accountId,
      @required String displayName,
      String domain}) async {}

  /// Creates an order for phone numbers to be provisioned. Choose from Amazon
  /// Chime Business Calling and Amazon Chime Voice Connector product types. For
  /// toll-free numbers, you can use only the Amazon Chime Voice Connector
  /// product type.
  Future<void> createPhoneNumberOrder(
      {@required String productType,
      @required List<String> e164PhoneNumbers}) async {}

  /// Creates an Amazon Chime Voice Connector under the administrator's AWS
  /// account. Enabling CreateVoiceConnectorRequest$RequireEncryption configures
  /// your Amazon Chime Voice Connector to use TLS transport for SIP signaling
  /// and Secure RTP (SRTP) for media. Inbound calls use TLS transport, and
  /// unencrypted outbound calls are blocked.
  Future<void> createVoiceConnector(
      {@required String name, @required bool requireEncryption}) async {}

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
  Future<void> deleteAccount(String accountId) async {}

  /// Deletes the events configuration that allows a bot to receive outgoing
  /// events.
  Future<void> deleteEventsConfiguration(
      {@required String accountId, @required String botId}) async {}

  /// Moves the specified phone number into the **Deletion queue**. A phone
  /// number must be disassociated from any users or Amazon Chime Voice
  /// Connectors before it can be deleted.
  ///
  /// Deleted phone numbers remain in the **Deletion queue** for 7 days before
  /// they are deleted permanently.
  Future<void> deletePhoneNumber(String phoneNumberId) async {}

  /// Deletes the specified Amazon Chime Voice Connector. Any phone numbers
  /// assigned to the Amazon Chime Voice Connector must be unassigned from it
  /// before it can be deleted.
  Future<void> deleteVoiceConnector(String voiceConnectorId) async {}

  /// Deletes the origination settings for the specified Amazon Chime Voice
  /// Connector.
  Future<void> deleteVoiceConnectorOrigination(String voiceConnectorId) async {}

  /// Deletes the termination settings for the specified Amazon Chime Voice
  /// Connector.
  Future<void> deleteVoiceConnectorTermination(String voiceConnectorId) async {}

  /// Deletes the specified SIP credentials used by your equipment to
  /// authenticate during call termination.
  Future<void> deleteVoiceConnectorTerminationCredentials(
      String voiceConnectorId,
      {List<String> usernames}) async {}

  /// Disassociates the primary provisioned phone number from the specified
  /// Amazon Chime user.
  Future<void> disassociatePhoneNumberFromUser(
      {@required String accountId, @required String userId}) async {}

  /// Disassociates the specified phone number from the specified Amazon Chime
  /// Voice Connector.
  Future<void> disassociatePhoneNumbersFromVoiceConnector(
      String voiceConnectorId,
      {List<String> e164PhoneNumbers}) async {}

  /// Retrieves details for the specified Amazon Chime account, such as account
  /// type and supported licenses.
  Future<void> getAccount(String accountId) async {}

  /// Retrieves account settings for the specified Amazon Chime account ID, such
  /// as remote control and dial out settings. For more information about these
  /// settings, see [Use the Policies
  /// Page](https://docs.aws.amazon.com/chime/latest/ag/policies.html) in the
  /// _Amazon Chime Administration Guide_.
  Future<void> getAccountSettings(String accountId) async {}

  /// Retrieves details for the specified bot, such as bot email address, bot
  /// type, status, and display name.
  Future<void> getBot(
      {@required String accountId, @required String botId}) async {}

  /// Gets details for an events configuration that allows a bot to receive
  /// outgoing events, such as an HTTPS endpoint or Lambda function ARN.
  Future<void> getEventsConfiguration(
      {@required String accountId, @required String botId}) async {}

  /// Retrieves global settings for the administrator's AWS account, such as
  /// Amazon Chime Business Calling and Amazon Chime Voice Connector settings.
  Future<void> getGlobalSettings() async {}

  /// Retrieves details for the specified phone number ID, such as associations,
  /// capabilities, and product type.
  Future<void> getPhoneNumber(String phoneNumberId) async {}

  /// Retrieves details for the specified phone number order, such as order
  /// creation timestamp, phone numbers in E.164 format, product type, and order
  /// status.
  Future<void> getPhoneNumberOrder(String phoneNumberOrderId) async {}

  /// Retrieves details for the specified user ID, such as primary email
  /// address, license type, and personal meeting PIN.
  ///
  /// To retrieve user details with an email address instead of a user ID, use
  /// the ListUsers action, and then filter by email address.
  Future<void> getUser(
      {@required String accountId, @required String userId}) async {}

  /// Retrieves settings for the specified user ID, such as any associated phone
  /// number settings.
  Future<void> getUserSettings(
      {@required String accountId, @required String userId}) async {}

  /// Retrieves details for the specified Amazon Chime Voice Connector, such as
  /// timestamps, name, outbound host, and encryption requirements.
  Future<void> getVoiceConnector(String voiceConnectorId) async {}

  /// Retrieves origination setting details for the specified Amazon Chime Voice
  /// Connector.
  Future<void> getVoiceConnectorOrigination(String voiceConnectorId) async {}

  /// Retrieves termination setting details for the specified Amazon Chime Voice
  /// Connector.
  Future<void> getVoiceConnectorTermination(String voiceConnectorId) async {}

  /// Retrieves information about the last time a SIP `OPTIONS` ping was
  /// received from your SIP infrastructure for the specified Amazon Chime Voice
  /// Connector.
  Future<void> getVoiceConnectorTerminationHealth(
      String voiceConnectorId) async {}

  /// Sends email invites to as many as 50 users, inviting them to the specified
  /// Amazon Chime `Team` account. Only `Team` account types are currently
  /// supported for this action.
  Future<void> inviteUsers(
      {@required String accountId,
      @required List<String> userEmailList}) async {}

  /// Lists the Amazon Chime accounts under the administrator's AWS account. You
  /// can filter accounts by account name prefix. To find out which Amazon Chime
  /// account a user belongs to, you can filter by the user's email address,
  /// which returns one account result.
  Future<void> listAccounts(
      {String name,
      String userEmail,
      String nextToken,
      int maxResults}) async {}

  /// Lists the bots associated with the administrator's Amazon Chime Enterprise
  /// account ID.
  Future<void> listBots(String accountId,
      {int maxResults, String nextToken}) async {}

  /// Lists the phone number orders for the administrator's Amazon Chime
  /// account.
  Future<void> listPhoneNumberOrders(
      {String nextToken, int maxResults}) async {}

  /// Lists the phone numbers for the specified Amazon Chime account, Amazon
  /// Chime user, or Amazon Chime Voice Connector.
  Future<void> listPhoneNumbers(
      {String status,
      String productType,
      String filterName,
      String filterValue,
      int maxResults,
      String nextToken}) async {}

  /// Lists the users that belong to the specified Amazon Chime account. You can
  /// specify an email address to list only the user that the email address
  /// belongs to.
  Future<void> listUsers(String accountId,
      {String userEmail, int maxResults, String nextToken}) async {}

  /// Lists the SIP credentials for the specified Amazon Chime Voice Connector.
  Future<void> listVoiceConnectorTerminationCredentials(
      String voiceConnectorId) async {}

  /// Lists the Amazon Chime Voice Connectors for the administrator's AWS
  /// account.
  Future<void> listVoiceConnectors({String nextToken, int maxResults}) async {}

  /// Logs out the specified user from all of the devices they are currently
  /// logged into.
  Future<void> logoutUser(
      {@required String accountId, @required String userId}) async {}

  /// Creates an events configuration that allows a bot to receive outgoing
  /// events sent by Amazon Chime. Choose either an HTTPS endpoint or a Lambda
  /// function ARN. For more information, see Bot.
  Future<void> putEventsConfiguration(
      {@required String accountId,
      @required String botId,
      String outboundEventsHttpsEndpoint,
      String lambdaFunctionArn}) async {}

  /// Adds origination settings for the specified Amazon Chime Voice Connector.
  Future<void> putVoiceConnectorOrigination(
      {@required String voiceConnectorId,
      @required Origination origination}) async {}

  /// Adds termination settings for the specified Amazon Chime Voice Connector.
  Future<void> putVoiceConnectorTermination(
      {@required String voiceConnectorId,
      @required Termination termination}) async {}

  /// Adds termination SIP credentials for the specified Amazon Chime Voice
  /// Connector.
  Future<void> putVoiceConnectorTerminationCredentials(String voiceConnectorId,
      {List<Credential> credentials}) async {}

  /// Regenerates the security token for a bot.
  Future<void> regenerateSecurityToken(
      {@required String accountId, @required String botId}) async {}

  /// Resets the personal meeting PIN for the specified user on an Amazon Chime
  /// account. Returns the User object with the updated personal meeting PIN.
  Future<void> resetPersonalPin(
      {@required String accountId, @required String userId}) async {}

  /// Moves a phone number from the **Deletion queue** back into the phone
  /// number **Inventory**.
  Future<void> restorePhoneNumber(String phoneNumberId) async {}

  /// Searches phone numbers that can be ordered.
  Future<void> searchAvailablePhoneNumbers(
      {String areaCode,
      String city,
      String country,
      String state,
      String tollFreePrefix,
      int maxResults,
      String nextToken}) async {}

  /// Updates account details for the specified Amazon Chime account. Currently,
  /// only account name updates are supported for this action.
  Future<void> updateAccount(String accountId, {String name}) async {}

  /// Updates the settings for the specified Amazon Chime account. You can
  /// update settings for remote control of shared screens, or for the dial-out
  /// option. For more information about these settings, see [Use the Policies
  /// Page](https://docs.aws.amazon.com/chime/latest/ag/policies.html) in the
  /// _Amazon Chime Administration Guide_.
  Future<void> updateAccountSettings(
      {@required String accountId,
      @required AccountSettings accountSettings}) async {}

  /// Updates the status of the specified bot, such as starting or stopping the
  /// bot from running in your Amazon Chime Enterprise account.
  Future<void> updateBot(
      {@required String accountId,
      @required String botId,
      bool disabled}) async {}

  /// Updates global settings for the administrator's AWS account, such as
  /// Amazon Chime Business Calling and Amazon Chime Voice Connector settings.
  Future<void> updateGlobalSettings(
      {@required BusinessCallingSettings businessCalling,
      @required VoiceConnectorSettings voiceConnector}) async {}

  /// Updates phone number details, such as product type, for the specified
  /// phone number ID. For toll-free numbers, you can use only the Amazon Chime
  /// Voice Connector product type.
  Future<void> updatePhoneNumber(String phoneNumberId,
      {String productType}) async {}

  /// Updates user details for a specified user ID. Currently, only
  /// `LicenseType` updates are supported for this action.
  Future<void> updateUser(
      {@required String accountId,
      @required String userId,
      String licenseType}) async {}

  /// Updates the settings for the specified user, such as phone number
  /// settings.
  Future<void> updateUserSettings(
      {@required String accountId,
      @required String userId,
      @required UserSettings userSettings}) async {}

  /// Updates details for the specified Amazon Chime Voice Connector.
  Future<void> updateVoiceConnector(
      {@required String voiceConnectorId,
      @required String name,
      @required bool requireEncryption}) async {}
}

class Account {}

class AccountSettings {}

class AssociatePhoneNumberWithUserResponse {}

class AssociatePhoneNumbersWithVoiceConnectorResponse {}

class BatchDeletePhoneNumberResponse {}

class BatchSuspendUserResponse {}

class BatchUnsuspendUserResponse {}

class BatchUpdatePhoneNumberResponse {}

class BatchUpdateUserResponse {}

class Bot {}

class BusinessCallingSettings {}

class CreateAccountResponse {}

class CreateBotResponse {}

class CreatePhoneNumberOrderResponse {}

class CreateVoiceConnectorResponse {}

class Credential {}

class DeleteAccountResponse {}

class DisassociatePhoneNumberFromUserResponse {}

class DisassociatePhoneNumbersFromVoiceConnectorResponse {}

class EventsConfiguration {}

class GetAccountResponse {}

class GetAccountSettingsResponse {}

class GetBotResponse {}

class GetEventsConfigurationResponse {}

class GetGlobalSettingsResponse {}

class GetPhoneNumberOrderResponse {}

class GetPhoneNumberResponse {}

class GetUserResponse {}

class GetUserSettingsResponse {}

class GetVoiceConnectorOriginationResponse {}

class GetVoiceConnectorResponse {}

class GetVoiceConnectorTerminationHealthResponse {}

class GetVoiceConnectorTerminationResponse {}

class Invite {}

class InviteUsersResponse {}

class ListAccountsResponse {}

class ListBotsResponse {}

class ListPhoneNumberOrdersResponse {}

class ListPhoneNumbersResponse {}

class ListUsersResponse {}

class ListVoiceConnectorTerminationCredentialsResponse {}

class ListVoiceConnectorsResponse {}

class LogoutUserResponse {}

class OrderedPhoneNumber {}

class Origination {}

class OriginationRoute {}

class PhoneNumber {}

class PhoneNumberAssociation {}

class PhoneNumberCapabilities {}

class PhoneNumberError {}

class PhoneNumberOrder {}

class PutEventsConfigurationResponse {}

class PutVoiceConnectorOriginationResponse {}

class PutVoiceConnectorTerminationResponse {}

class RegenerateSecurityTokenResponse {}

class ResetPersonalPinResponse {}

class RestorePhoneNumberResponse {}

class SearchAvailablePhoneNumbersResponse {}

class TelephonySettings {}

class Termination {}

class TerminationHealth {}

class UpdateAccountResponse {}

class UpdateAccountSettingsResponse {}

class UpdateBotResponse {}

class UpdatePhoneNumberRequestItem {}

class UpdatePhoneNumberResponse {}

class UpdateUserRequestItem {}

class UpdateUserResponse {}

class UpdateVoiceConnectorResponse {}

class User {}

class UserError {}

class UserSettings {}

class VoiceConnector {}

class VoiceConnectorSettings {}
