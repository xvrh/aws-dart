import 'package:meta/meta.dart';
import 'dart:typed_data';

/// Using the Amazon Cognito User Pools API, you can create a user pool to
/// manage directories and users. You can authenticate a user to obtain tokens
/// related to user identity and access policies.
///
/// This API reference provides information about user pools in Amazon Cognito
/// User Pools.
///
/// For more information, see the Amazon Cognito Documentation.
class CognitoIdentityProviderApi {
  /// Adds additional user attributes to the user pool schema.
  Future<void> addCustomAttributes(
      {@required String userPoolId,
      @required List<SchemaAttributeType> customAttributes}) async {}

  /// Adds the specified user to the specified group.
  ///
  /// Requires developer credentials.
  Future<void> adminAddUserToGroup(
      {@required String userPoolId,
      @required String username,
      @required String groupName}) async {}

  /// Confirms user registration as an admin without using a confirmation code.
  /// Works on any user.
  ///
  /// Requires developer credentials.
  Future<void> adminConfirmSignUp(
      {@required String userPoolId, @required String username}) async {}

  /// Creates a new user in the specified user pool.
  ///
  /// If `MessageAction` is not set, the default is to send a welcome message
  /// via email or phone (SMS).
  ///
  ///  This message is based on a template that you configured in your call to
  /// or . This template includes your custom sign-up instructions and
  /// placeholders for user name and temporary password.
  ///
  /// Alternatively, you can call AdminCreateUser with “SUPPRESS” for the
  /// `MessageAction` parameter, and Amazon Cognito will not send any email.
  ///
  /// In either case, the user will be in the `FORCE\_CHANGE\_PASSWORD` state
  /// until they sign in and change their password.
  ///
  /// AdminCreateUser requires developer credentials.
  Future<void> adminCreateUser(
      {@required String userPoolId,
      @required String username,
      List<AttributeType> userAttributes,
      List<AttributeType> validationData,
      String temporaryPassword,
      bool forceAliasCreation,
      String messageAction,
      List<String> desiredDeliveryMediums}) async {}

  /// Deletes a user as an administrator. Works on any user.
  ///
  /// Requires developer credentials.
  Future<void> adminDeleteUser(
      {@required String userPoolId, @required String username}) async {}

  /// Deletes the user attributes in a user pool as an administrator. Works on
  /// any user.
  ///
  /// Requires developer credentials.
  Future<void> adminDeleteUserAttributes(
      {@required String userPoolId,
      @required String username,
      @required List<String> userAttributeNames}) async {}

  /// Disables the user from signing in with the specified external (SAML or
  /// social) identity provider. If the user to disable is a Cognito User Pools
  /// native username + password user, they are not permitted to use their
  /// password to sign-in. If the user to disable is a linked external IdP user,
  /// any link between that user and an existing user is removed. The next time
  /// the external user (no longer attached to the previously linked
  /// `DestinationUser`) signs in, they must create a new user account. See .
  ///
  /// This action is enabled only for admin access and requires developer
  /// credentials.
  ///
  /// The `ProviderName` must match the value specified when creating an IdP for
  /// the pool.
  ///
  /// To disable a native username + password user, the `ProviderName` value
  /// must be `Cognito` and the `ProviderAttributeName` must be
  /// `Cognito_Subject`, with the `ProviderAttributeValue` being the name that
  /// is used in the user pool for the user.
  ///
  /// The `ProviderAttributeName` must always be `Cognito_Subject` for social
  /// identity providers. The `ProviderAttributeValue` must always be the exact
  /// subject that was used when the user was originally linked as a source
  /// user.
  ///
  /// For de-linking a SAML identity, there are two scenarios. If the linked
  /// identity has not yet been used to sign-in, the `ProviderAttributeName` and
  /// `ProviderAttributeValue` must be the same values that were used for the
  /// `SourceUser` when the identities were originally linked in the call. (If
  /// the linking was done with `ProviderAttributeName` set to
  /// `Cognito_Subject`, the same applies here). However, if the user has
  /// already signed in, the `ProviderAttributeName` must be `Cognito_Subject`
  /// and `ProviderAttributeValue` must be the subject of the SAML assertion.
  Future<void> adminDisableProviderForUser(
      {@required String userPoolId,
      @required ProviderUserIdentifierType user}) async {}

  /// Disables the specified user as an administrator. Works on any user.
  ///
  /// Requires developer credentials.
  Future<void> adminDisableUser(
      {@required String userPoolId, @required String username}) async {}

  /// Enables the specified user as an administrator. Works on any user.
  ///
  /// Requires developer credentials.
  Future<void> adminEnableUser(
      {@required String userPoolId, @required String username}) async {}

  /// Forgets the device, as an administrator.
  ///
  /// Requires developer credentials.
  Future<void> adminForgetDevice(
      {@required String userPoolId,
      @required String username,
      @required String deviceKey}) async {}

  /// Gets the device, as an administrator.
  ///
  /// Requires developer credentials.
  Future<void> adminGetDevice(
      {@required String deviceKey,
      @required String userPoolId,
      @required String username}) async {}

  /// Gets the specified user by user name in a user pool as an administrator.
  /// Works on any user.
  ///
  /// Requires developer credentials.
  Future<void> adminGetUser(
      {@required String userPoolId, @required String username}) async {}

  /// Initiates the authentication flow, as an administrator.
  ///
  /// Requires developer credentials.
  Future<void> adminInitiateAuth(
      {@required String userPoolId,
      @required String clientId,
      @required String authFlow,
      Map<String, String> authParameters,
      Map<String, String> clientMetadata,
      AnalyticsMetadataType analyticsMetadata,
      ContextDataType contextData}) async {}

  /// Links an existing user account in a user pool (`DestinationUser`) to an
  /// identity from an external identity provider (`SourceUser`) based on a
  /// specified attribute name and value from the external identity provider.
  /// This allows you to create a link from the existing user account to an
  /// external federated user identity that has not yet been used to sign in, so
  /// that the federated user identity can be used to sign in as the existing
  /// user account.
  ///
  ///  For example, if there is an existing user with a username and password,
  /// this API links that user to a federated user identity, so that when the
  /// federated user identity is used, the user signs in as the existing user
  /// account.
  ///
  ///  Because this API allows a user with an external federated identity to
  /// sign in as an existing user in the user pool, it is critical that it only
  /// be used with external identity providers and provider attributes that have
  /// been trusted by the application owner.
  ///
  /// See also .
  ///
  /// This action is enabled only for admin access and requires developer
  /// credentials.
  Future<void> adminLinkProviderForUser(
      {@required String userPoolId,
      @required ProviderUserIdentifierType destinationUser,
      @required ProviderUserIdentifierType sourceUser}) async {}

  /// Lists devices, as an administrator.
  ///
  /// Requires developer credentials.
  Future<void> adminListDevices(
      {@required String userPoolId,
      @required String username,
      int limit,
      String paginationToken}) async {}

  /// Lists the groups that the user belongs to.
  ///
  /// Requires developer credentials.
  Future<void> adminListGroupsForUser(
      {@required String username,
      @required String userPoolId,
      int limit,
      String nextToken}) async {}

  /// Lists a history of user activity and any risks detected as part of Amazon
  /// Cognito advanced security.
  Future<void> adminListUserAuthEvents(
      {@required String userPoolId,
      @required String username,
      int maxResults,
      String nextToken}) async {}

  /// Removes the specified user from the specified group.
  ///
  /// Requires developer credentials.
  Future<void> adminRemoveUserFromGroup(
      {@required String userPoolId,
      @required String username,
      @required String groupName}) async {}

  /// Resets the specified user's password in a user pool as an administrator.
  /// Works on any user.
  ///
  /// When a developer calls this API, the current password is invalidated, so
  /// it must be changed. If a user tries to sign in after the API is called,
  /// the app will get a PasswordResetRequiredException exception back and
  /// should direct the user down the flow to reset the password, which is the
  /// same as the forgot password flow. In addition, if the user pool has phone
  /// verification selected and a verified phone number exists for the user, or
  /// if email verification is selected and a verified email exists for the
  /// user, calling this API will also result in sending a message to the end
  /// user with the code to change their password.
  ///
  /// Requires developer credentials.
  Future<void> adminResetUserPassword(
      {@required String userPoolId, @required String username}) async {}

  /// Responds to an authentication challenge, as an administrator.
  ///
  /// Requires developer credentials.
  Future<void> adminRespondToAuthChallenge(
      {@required String userPoolId,
      @required String clientId,
      @required String challengeName,
      Map<String, String> challengeResponses,
      String session,
      AnalyticsMetadataType analyticsMetadata,
      ContextDataType contextData}) async {}

  /// Sets the user's multi-factor authentication (MFA) preference.
  Future<void> adminSetUserMfaPreference(
      {SmsMfaSettingsType smsMfaSettings,
      SoftwareTokenMfaSettingsType softwareTokenMfaSettings,
      @required String username,
      @required String userPoolId}) async {}

  Future<void> adminSetUserPassword(
      {@required String userPoolId,
      @required String username,
      @required String password,
      bool permanent}) async {}

  /// Sets all the user settings for a specified user name. Works on any user.
  ///
  /// Requires developer credentials.
  Future<void> adminSetUserSettings(
      {@required String userPoolId,
      @required String username,
      @required List<MfaOptionType> mfaOptions}) async {}

  /// Provides feedback for an authentication event as to whether it was from a
  /// valid user. This feedback is used for improving the risk evaluation
  /// decision for the user pool as part of Amazon Cognito advanced security.
  Future<void> adminUpdateAuthEventFeedback(
      {@required String userPoolId,
      @required String username,
      @required String eventId,
      @required String feedbackValue}) async {}

  /// Updates the device status as an administrator.
  ///
  /// Requires developer credentials.
  Future<void> adminUpdateDeviceStatus(
      {@required String userPoolId,
      @required String username,
      @required String deviceKey,
      String deviceRememberedStatus}) async {}

  /// Updates the specified user's attributes, including developer attributes,
  /// as an administrator. Works on any user.
  ///
  /// For custom attributes, you must prepend the `custom:` prefix to the
  /// attribute name.
  ///
  /// In addition to updating user attributes, this API can also be used to mark
  /// phone and email as verified.
  ///
  /// Requires developer credentials.
  Future<void> adminUpdateUserAttributes(
      {@required String userPoolId,
      @required String username,
      @required List<AttributeType> userAttributes}) async {}

  /// Signs out users from all devices, as an administrator.
  ///
  /// Requires developer credentials.
  Future<void> adminUserGlobalSignOut(
      {@required String userPoolId, @required String username}) async {}

  /// Returns a unique generated shared secret key code for the user account.
  /// The request takes an access token or a session string, but not both.
  Future<void> associateSoftwareToken(
      {String accessToken, String session}) async {}

  /// Changes the password for a specified user in a user pool.
  Future<void> changePassword(
      {@required String previousPassword,
      @required String proposedPassword,
      @required String accessToken}) async {}

  /// Confirms tracking of the device. This API call is the call that begins
  /// device tracking.
  Future<void> confirmDevice(
      {@required String accessToken,
      @required String deviceKey,
      DeviceSecretVerifierConfigType deviceSecretVerifierConfig,
      String deviceName}) async {}

  /// Allows a user to enter a confirmation code to reset a forgotten password.
  Future<void> confirmForgotPassword(
      {@required String clientId,
      String secretHash,
      @required String username,
      @required String confirmationCode,
      @required String password,
      AnalyticsMetadataType analyticsMetadata,
      UserContextDataType userContextData}) async {}

  /// Confirms registration of a user and handles the existing alias from a
  /// previous user.
  Future<void> confirmSignUp(
      {@required String clientId,
      String secretHash,
      @required String username,
      @required String confirmationCode,
      bool forceAliasCreation,
      AnalyticsMetadataType analyticsMetadata,
      UserContextDataType userContextData}) async {}

  /// Creates a new group in the specified user pool.
  ///
  /// Requires developer credentials.
  Future<void> createGroup(
      {@required String groupName,
      @required String userPoolId,
      String description,
      String roleArn,
      int precedence}) async {}

  /// Creates an identity provider for a user pool.
  Future<void> createIdentityProvider(
      {@required String userPoolId,
      @required String providerName,
      @required String providerType,
      @required Map<String, String> providerDetails,
      Map<String, String> attributeMapping,
      List<String> idpIdentifiers}) async {}

  /// Creates a new OAuth2.0 resource server and defines custom scopes in it.
  Future<void> createResourceServer(
      {@required String userPoolId,
      @required String identifier,
      @required String name,
      List<ResourceServerScopeType> scopes}) async {}

  /// Creates the user import job.
  Future<void> createUserImportJob(
      {@required String jobName,
      @required String userPoolId,
      @required String cloudWatchLogsRoleArn}) async {}

  /// Creates a new Amazon Cognito user pool and sets the password policy for
  /// the pool.
  Future<void> createUserPool(String poolName,
      {UserPoolPolicyType policies,
      LambdaConfigType lambdaConfig,
      List<String> autoVerifiedAttributes,
      List<String> aliasAttributes,
      List<String> usernameAttributes,
      String smsVerificationMessage,
      String emailVerificationMessage,
      String emailVerificationSubject,
      VerificationMessageTemplateType verificationMessageTemplate,
      String smsAuthenticationMessage,
      String mfaConfiguration,
      DeviceConfigurationType deviceConfiguration,
      EmailConfigurationType emailConfiguration,
      SmsConfigurationType smsConfiguration,
      Map<String, String> userPoolTags,
      AdminCreateUserConfigType adminCreateUserConfig,
      List<SchemaAttributeType> schema,
      UserPoolAddOnsType userPoolAddOns}) async {}

  /// Creates the user pool client.
  Future<void> createUserPoolClient(
      {@required String userPoolId,
      @required String clientName,
      bool generateSecret,
      int refreshTokenValidity,
      List<String> readAttributes,
      List<String> writeAttributes,
      List<String> explicitAuthFlows,
      List<String> supportedIdentityProviders,
      List<String> callbackURLs,
      List<String> logoutURLs,
      String defaultRedirectUri,
      List<String> allowedoAuthFlows,
      List<String> allowedoAuthScopes,
      bool allowedoAuthFlowsUserPoolClient,
      AnalyticsConfigurationType analyticsConfiguration}) async {}

  /// Creates a new domain for a user pool.
  Future<void> createUserPoolDomain(
      {@required String domain,
      @required String userPoolId,
      CustomDomainConfigType customDomainConfig}) async {}

  /// Deletes a group. Currently only groups with no members can be deleted.
  ///
  /// Requires developer credentials.
  Future<void> deleteGroup(
      {@required String groupName, @required String userPoolId}) async {}

  /// Deletes an identity provider for a user pool.
  Future<void> deleteIdentityProvider(
      {@required String userPoolId, @required String providerName}) async {}

  /// Deletes a resource server.
  Future<void> deleteResourceServer(
      {@required String userPoolId, @required String identifier}) async {}

  /// Allows a user to delete himself or herself.
  Future<void> deleteUser(String accessToken) async {}

  /// Deletes the attributes for a user.
  Future<void> deleteUserAttributes(
      {@required List<String> userAttributeNames,
      @required String accessToken}) async {}

  /// Deletes the specified Amazon Cognito user pool.
  Future<void> deleteUserPool(String userPoolId) async {}

  /// Allows the developer to delete the user pool client.
  Future<void> deleteUserPoolClient(
      {@required String userPoolId, @required String clientId}) async {}

  /// Deletes a domain for a user pool.
  Future<void> deleteUserPoolDomain(
      {@required String domain, @required String userPoolId}) async {}

  /// Gets information about a specific identity provider.
  Future<void> describeIdentityProvider(
      {@required String userPoolId, @required String providerName}) async {}

  /// Describes a resource server.
  Future<void> describeResourceServer(
      {@required String userPoolId, @required String identifier}) async {}

  /// Describes the risk configuration.
  Future<void> describeRiskConfiguration(String userPoolId,
      {String clientId}) async {}

  /// Describes the user import job.
  Future<void> describeUserImportJob(
      {@required String userPoolId, @required String jobId}) async {}

  /// Returns the configuration information and metadata of the specified user
  /// pool.
  Future<void> describeUserPool(String userPoolId) async {}

  /// Client method for returning the configuration information and metadata of
  /// the specified user pool app client.
  Future<void> describeUserPoolClient(
      {@required String userPoolId, @required String clientId}) async {}

  /// Gets information about a domain.
  Future<void> describeUserPoolDomain(String domain) async {}

  /// Forgets the specified device.
  Future<void> forgetDevice(String deviceKey, {String accessToken}) async {}

  /// Calling this API causes a message to be sent to the end user with a
  /// confirmation code that is required to change the user's password. For the
  /// `Username` parameter, you can use the username or user alias. If a
  /// verified phone number exists for the user, the confirmation code is sent
  /// to the phone number. Otherwise, if a verified email exists, the
  /// confirmation code is sent to the email. If neither a verified phone number
  /// nor a verified email exists, `InvalidParameterException` is thrown. To use
  /// the confirmation code for resetting the password, call .
  Future<void> forgotPassword(
      {@required String clientId,
      String secretHash,
      UserContextDataType userContextData,
      @required String username,
      AnalyticsMetadataType analyticsMetadata}) async {}

  /// Gets the header information for the .csv file to be used as input for the
  /// user import job.
  Future<void> getCsvHeader(String userPoolId) async {}

  /// Gets the device.
  Future<void> getDevice(String deviceKey, {String accessToken}) async {}

  /// Gets a group.
  ///
  /// Requires developer credentials.
  Future<void> getGroup(
      {@required String groupName, @required String userPoolId}) async {}

  /// Gets the specified identity provider.
  Future<void> getIdentityProviderByIdentifier(
      {@required String userPoolId, @required String idpIdentifier}) async {}

  /// This method takes a user pool ID, and returns the signing certificate.
  Future<void> getSigningCertificate(String userPoolId) async {}

  /// Gets the UI Customization information for a particular app client's app
  /// UI, if there is something set. If nothing is set for the particular
  /// client, but there is an existing pool level customization (app `clientId`
  /// will be `ALL`), then that is returned. If nothing is present, then an
  /// empty shape is returned.
  Future<void> getUICustomization(String userPoolId, {String clientId}) async {}

  /// Gets the user attributes and metadata for a user.
  Future<void> getUser(String accessToken) async {}

  /// Gets the user attribute verification code for the specified attribute
  /// name.
  Future<void> getUserAttributeVerificationCode(
      {@required String accessToken, @required String attributeName}) async {}

  /// Gets the user pool multi-factor authentication (MFA) configuration.
  Future<void> getUserPoolMfaConfig(String userPoolId) async {}

  /// Signs out users from all devices.
  Future<void> globalSignOut(String accessToken) async {}

  /// Initiates the authentication flow.
  Future<void> initiateAuth(
      {@required String authFlow,
      Map<String, String> authParameters,
      Map<String, String> clientMetadata,
      @required String clientId,
      AnalyticsMetadataType analyticsMetadata,
      UserContextDataType userContextData}) async {}

  /// Lists the devices.
  Future<void> listDevices(String accessToken,
      {int limit, String paginationToken}) async {}

  /// Lists the groups associated with a user pool.
  ///
  /// Requires developer credentials.
  Future<void> listGroups(String userPoolId,
      {int limit, String nextToken}) async {}

  /// Lists information about all identity providers for a user pool.
  Future<void> listIdentityProviders(String userPoolId,
      {int maxResults, String nextToken}) async {}

  /// Lists the resource servers for a user pool.
  Future<void> listResourceServers(String userPoolId,
      {int maxResults, String nextToken}) async {}

  /// Lists the tags that are assigned to an Amazon Cognito user pool.
  ///
  /// A tag is a label that you can apply to user pools to categorize and manage
  /// them in different ways, such as by purpose, owner, environment, or other
  /// criteria.
  ///
  /// You can use this action up to 10 times per second, per account.
  Future<void> listTagsForResource(String resourceArn) async {}

  /// Lists the user import jobs.
  Future<void> listUserImportJobs(
      {@required String userPoolId,
      @required int maxResults,
      String paginationToken}) async {}

  /// Lists the clients that have been created for the specified user pool.
  Future<void> listUserPoolClients(String userPoolId,
      {int maxResults, String nextToken}) async {}

  /// Lists the user pools associated with an AWS account.
  Future<void> listUserPools(int maxResults, {String nextToken}) async {}

  /// Lists the users in the Amazon Cognito user pool.
  Future<void> listUsers(String userPoolId,
      {List<String> attributesToGet,
      int limit,
      String paginationToken,
      String filter}) async {}

  /// Lists the users in the specified group.
  ///
  /// Requires developer credentials.
  Future<void> listUsersInGroup(
      {@required String userPoolId,
      @required String groupName,
      int limit,
      String nextToken}) async {}

  /// Resends the confirmation (for confirmation of registration) to a specific
  /// user in the user pool.
  Future<void> resendConfirmationCode(
      {@required String clientId,
      String secretHash,
      UserContextDataType userContextData,
      @required String username,
      AnalyticsMetadataType analyticsMetadata}) async {}

  /// Responds to the authentication challenge.
  Future<void> respondToAuthChallenge(
      {@required String clientId,
      @required String challengeName,
      String session,
      Map<String, String> challengeResponses,
      AnalyticsMetadataType analyticsMetadata,
      UserContextDataType userContextData}) async {}

  /// Configures actions on detected risks. To delete the risk configuration for
  /// `UserPoolId` or `ClientId`, pass null values for all four configuration
  /// types.
  ///
  /// To enable Amazon Cognito advanced security features, update the user pool
  /// to include the `UserPoolAddOns` key`AdvancedSecurityMode`.
  ///
  /// See .
  Future<void> setRiskConfiguration(String userPoolId,
      {String clientId,
      CompromisedCredentialsRiskConfigurationType
          compromisedCredentialsRiskConfiguration,
      AccountTakeoverRiskConfigurationType accountTakeoverRiskConfiguration,
      RiskExceptionConfigurationType riskExceptionConfiguration}) async {}

  /// Sets the UI customization information for a user pool's built-in app UI.
  ///
  /// You can specify app UI customization settings for a single client (with a
  /// specific `clientId`) or for all clients (by setting the `clientId` to
  /// `ALL`). If you specify `ALL`, the default configuration will be used for
  /// every client that has no UI customization set previously. If you specify
  /// UI customization settings for a particular client, it will no longer fall
  /// back to the `ALL` configuration.
  ///
  ///
  ///
  /// To use this API, your user pool must have a domain associated with it.
  /// Otherwise, there is no place to host the app's pages, and the service will
  /// throw an error.
  Future<void> setUICustomization(String userPoolId,
      {String clientId, String css, Uint8List imageFile}) async {}

  /// Set the user's multi-factor authentication (MFA) method preference.
  Future<void> setUserMfaPreference(String accessToken,
      {SmsMfaSettingsType smsMfaSettings,
      SoftwareTokenMfaSettingsType softwareTokenMfaSettings}) async {}

  /// Set the user pool MFA configuration.
  Future<void> setUserPoolMfaConfig(String userPoolId,
      {SmsMfaConfigType smsMfaConfiguration,
      SoftwareTokenMfaConfigType softwareTokenMfaConfiguration,
      String mfaConfiguration}) async {}

  /// Sets the user settings like multi-factor authentication (MFA). If MFA is
  /// to be removed for a particular attribute pass the attribute with code
  /// delivery as null. If null list is passed, all MFA options are removed.
  Future<void> setUserSettings(
      {@required String accessToken,
      @required List<MfaOptionType> mfaOptions}) async {}

  /// Registers the user in the specified user pool and creates a user name,
  /// password, and user attributes.
  Future<void> signUp(
      {@required String clientId,
      String secretHash,
      @required String username,
      @required String password,
      List<AttributeType> userAttributes,
      List<AttributeType> validationData,
      AnalyticsMetadataType analyticsMetadata,
      UserContextDataType userContextData}) async {}

  /// Starts the user import.
  Future<void> startUserImportJob(
      {@required String userPoolId, @required String jobId}) async {}

  /// Stops the user import job.
  Future<void> stopUserImportJob(
      {@required String userPoolId, @required String jobId}) async {}

  /// Assigns a set of tags to an Amazon Cognito user pool. A tag is a label
  /// that you can use to categorize and manage user pools in different ways,
  /// such as by purpose, owner, environment, or other criteria.
  ///
  /// Each tag consists of a key and value, both of which you define. A key is a
  /// general category for more specific values. For example, if you have two
  /// versions of a user pool, one for testing and another for production, you
  /// might assign an `Environment` tag key to both user pools. The value of
  /// this key might be `Test` for one user pool and `Production` for the other.
  ///
  /// Tags are useful for cost tracking and access control. You can activate
  /// your tags so that they appear on the Billing and Cost Management console,
  /// where you can track the costs associated with your user pools. In an IAM
  /// policy, you can constrain permissions for user pools based on specific
  /// tags or tag values.
  ///
  /// You can use this action up to 5 times per second, per account. A user pool
  /// can have as many as 50 tags.
  Future<void> tagResource(String resourceArn,
      {Map<String, String> tags}) async {}

  /// Removes the specified tags from an Amazon Cognito user pool. You can use
  /// this action up to 5 times per second, per account
  Future<void> untagResource(String resourceArn,
      {List<String> tagKeys}) async {}

  /// Provides the feedback for an authentication event whether it was from a
  /// valid user or not. This feedback is used for improving the risk evaluation
  /// decision for the user pool as part of Amazon Cognito advanced security.
  Future<void> updateAuthEventFeedback(
      {@required String userPoolId,
      @required String username,
      @required String eventId,
      @required String feedbackToken,
      @required String feedbackValue}) async {}

  /// Updates the device status.
  Future<void> updateDeviceStatus(
      {@required String accessToken,
      @required String deviceKey,
      String deviceRememberedStatus}) async {}

  /// Updates the specified group with the specified attributes.
  ///
  /// Requires developer credentials.
  Future<void> updateGroup(
      {@required String groupName,
      @required String userPoolId,
      String description,
      String roleArn,
      int precedence}) async {}

  /// Updates identity provider information for a user pool.
  Future<void> updateIdentityProvider(
      {@required String userPoolId,
      @required String providerName,
      Map<String, String> providerDetails,
      Map<String, String> attributeMapping,
      List<String> idpIdentifiers}) async {}

  /// Updates the name and scopes of resource server. All other fields are
  /// read-only.
  Future<void> updateResourceServer(
      {@required String userPoolId,
      @required String identifier,
      @required String name,
      List<ResourceServerScopeType> scopes}) async {}

  /// Allows a user to update a specific attribute (one at a time).
  Future<void> updateUserAttributes(
      {@required List<AttributeType> userAttributes,
      @required String accessToken}) async {}

  /// Updates the specified user pool with the specified attributes. If you
  /// don't provide a value for an attribute, it will be set to the default
  /// value. You can get a list of the current user pool settings with .
  Future<void> updateUserPool(String userPoolId,
      {UserPoolPolicyType policies,
      LambdaConfigType lambdaConfig,
      List<String> autoVerifiedAttributes,
      String smsVerificationMessage,
      String emailVerificationMessage,
      String emailVerificationSubject,
      VerificationMessageTemplateType verificationMessageTemplate,
      String smsAuthenticationMessage,
      String mfaConfiguration,
      DeviceConfigurationType deviceConfiguration,
      EmailConfigurationType emailConfiguration,
      SmsConfigurationType smsConfiguration,
      Map<String, String> userPoolTags,
      AdminCreateUserConfigType adminCreateUserConfig,
      UserPoolAddOnsType userPoolAddOns}) async {}

  /// Updates the specified user pool app client with the specified attributes.
  /// If you don't provide a value for an attribute, it will be set to the
  /// default value. You can get a list of the current user pool app client
  /// settings with .
  Future<void> updateUserPoolClient(
      {@required String userPoolId,
      @required String clientId,
      String clientName,
      int refreshTokenValidity,
      List<String> readAttributes,
      List<String> writeAttributes,
      List<String> explicitAuthFlows,
      List<String> supportedIdentityProviders,
      List<String> callbackURLs,
      List<String> logoutURLs,
      String defaultRedirectUri,
      List<String> allowedoAuthFlows,
      List<String> allowedoAuthScopes,
      bool allowedoAuthFlowsUserPoolClient,
      AnalyticsConfigurationType analyticsConfiguration}) async {}

  /// Updates the Secure Sockets Layer (SSL) certificate for the custom domain
  /// for your user pool.
  ///
  /// You can use this operation to provide the Amazon Resource Name (ARN) of a
  /// new certificate to Amazon Cognito. You cannot use it to change the domain
  /// for a user pool.
  ///
  /// A custom domain is used to host the Amazon Cognito hosted UI, which
  /// provides sign-up and sign-in pages for your application. When you set up a
  /// custom domain, you provide a certificate that you manage with AWS
  /// Certificate Manager (ACM). When necessary, you can use this operation to
  /// change the certificate that you applied to your custom domain.
  ///
  /// Usually, this is unnecessary following routine certificate renewal with
  /// ACM. When you renew your existing certificate in ACM, the ARN for your
  /// certificate remains the same, and your custom domain uses the new
  /// certificate automatically.
  ///
  /// However, if you replace your existing certificate with a new one, ACM
  /// gives the new certificate a new ARN. To apply the new certificate to your
  /// custom domain, you must provide this ARN to Amazon Cognito.
  ///
  /// When you add your new certificate in ACM, you must choose US East (N.
  /// Virginia) as the AWS Region.
  ///
  /// After you submit your request, Amazon Cognito requires up to 1 hour to
  /// distribute your new certificate to your custom domain.
  ///
  /// For more information about adding a custom domain to your user pool, see
  /// [Using Your Own Domain for the Hosted
  /// UI](https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-add-custom-domain.html).
  Future<void> updateUserPoolDomain(
      {@required String domain,
      @required String userPoolId,
      @required CustomDomainConfigType customDomainConfig}) async {}

  /// Use this API to register a user's entered TOTP code and mark the user's
  /// software token MFA status as "verified" if successful. The request takes
  /// an access token or a session string, but not both.
  Future<void> verifySoftwareToken(String userCode,
      {String accessToken, String session, String friendlyDeviceName}) async {}

  /// Verifies the specified user attributes in the user pool.
  Future<void> verifyUserAttribute(
      {@required String accessToken,
      @required String attributeName,
      @required String code}) async {}
}

class AccountTakeoverActionType {}

class AccountTakeoverActionsType {}

class AccountTakeoverRiskConfigurationType {}

class AddCustomAttributesResponse {}

class AdminConfirmSignUpResponse {}

class AdminCreateUserConfigType {}

class AdminCreateUserResponse {}

class AdminDeleteUserAttributesResponse {}

class AdminDisableProviderForUserResponse {}

class AdminDisableUserResponse {}

class AdminEnableUserResponse {}

class AdminGetDeviceResponse {}

class AdminGetUserResponse {}

class AdminInitiateAuthResponse {}

class AdminLinkProviderForUserResponse {}

class AdminListDevicesResponse {}

class AdminListGroupsForUserResponse {}

class AdminListUserAuthEventsResponse {}

class AdminResetUserPasswordResponse {}

class AdminRespondToAuthChallengeResponse {}

class AdminSetUserMfaPreferenceResponse {}

class AdminSetUserPasswordResponse {}

class AdminSetUserSettingsResponse {}

class AdminUpdateAuthEventFeedbackResponse {}

class AdminUpdateDeviceStatusResponse {}

class AdminUpdateUserAttributesResponse {}

class AdminUserGlobalSignOutResponse {}

class AnalyticsConfigurationType {}

class AnalyticsMetadataType {}

class AssociateSoftwareTokenResponse {}

class AttributeType {}

class AuthEventType {}

class AuthenticationResultType {}

class ChallengeResponseType {}

class ChangePasswordResponse {}

class CodeDeliveryDetailsType {}

class CompromisedCredentialsActionsType {}

class CompromisedCredentialsRiskConfigurationType {}

class ConfirmDeviceResponse {}

class ConfirmForgotPasswordResponse {}

class ConfirmSignUpResponse {}

class ContextDataType {}

class CreateGroupResponse {}

class CreateIdentityProviderResponse {}

class CreateResourceServerResponse {}

class CreateUserImportJobResponse {}

class CreateUserPoolClientResponse {}

class CreateUserPoolDomainResponse {}

class CreateUserPoolResponse {}

class CustomDomainConfigType {}

class DeleteUserAttributesResponse {}

class DeleteUserPoolDomainResponse {}

class DescribeIdentityProviderResponse {}

class DescribeResourceServerResponse {}

class DescribeRiskConfigurationResponse {}

class DescribeUserImportJobResponse {}

class DescribeUserPoolClientResponse {}

class DescribeUserPoolDomainResponse {}

class DescribeUserPoolResponse {}

class DeviceConfigurationType {}

class DeviceSecretVerifierConfigType {}

class DeviceType {}

class DomainDescriptionType {}

class EmailConfigurationType {}

class EventContextDataType {}

class EventFeedbackType {}

class EventRiskType {}

class ForgotPasswordResponse {}

class GetCsvHeaderResponse {}

class GetDeviceResponse {}

class GetGroupResponse {}

class GetIdentityProviderByIdentifierResponse {}

class GetSigningCertificateResponse {}

class GetUICustomizationResponse {}

class GetUserAttributeVerificationCodeResponse {}

class GetUserPoolMfaConfigResponse {}

class GetUserResponse {}

class GlobalSignOutResponse {}

class GroupType {}

class HttpHeader {}

class IdentityProviderType {}

class InitiateAuthResponse {}

class LambdaConfigType {}

class ListDevicesResponse {}

class ListGroupsResponse {}

class ListIdentityProvidersResponse {}

class ListResourceServersResponse {}

class ListTagsForResourceResponse {}

class ListUserImportJobsResponse {}

class ListUserPoolClientsResponse {}

class ListUserPoolsResponse {}

class ListUsersInGroupResponse {}

class ListUsersResponse {}

class MfaOptionType {}

class MessageTemplateType {}

class NewDeviceMetadataType {}

class NotifyConfigurationType {}

class NotifyEmailType {}

class NumberAttributeConstraintsType {}

class PasswordPolicyType {}

class ProviderDescription {}

class ProviderUserIdentifierType {}

class ResendConfirmationCodeResponse {}

class ResourceServerScopeType {}

class ResourceServerType {}

class RespondToAuthChallengeResponse {}

class RiskConfigurationType {}

class RiskExceptionConfigurationType {}

class SmsMfaSettingsType {}

class SchemaAttributeType {}

class SetRiskConfigurationResponse {}

class SetUICustomizationResponse {}

class SetUserMfaPreferenceResponse {}

class SetUserPoolMfaConfigResponse {}

class SetUserSettingsResponse {}

class SignUpResponse {}

class SmsConfigurationType {}

class SmsMfaConfigType {}

class SoftwareTokenMfaConfigType {}

class SoftwareTokenMfaSettingsType {}

class StartUserImportJobResponse {}

class StopUserImportJobResponse {}

class StringAttributeConstraintsType {}

class TagResourceResponse {}

class UICustomizationType {}

class UntagResourceResponse {}

class UpdateAuthEventFeedbackResponse {}

class UpdateDeviceStatusResponse {}

class UpdateGroupResponse {}

class UpdateIdentityProviderResponse {}

class UpdateResourceServerResponse {}

class UpdateUserAttributesResponse {}

class UpdateUserPoolClientResponse {}

class UpdateUserPoolDomainResponse {}

class UpdateUserPoolResponse {}

class UserContextDataType {}

class UserImportJobType {}

class UserPoolAddOnsType {}

class UserPoolClientDescription {}

class UserPoolClientType {}

class UserPoolDescriptionType {}

class UserPoolPolicyType {}

class UserPoolType {}

class UserType {}

class VerificationMessageTemplateType {}

class VerifySoftwareTokenResponse {}

class VerifyUserAttributeResponse {}
