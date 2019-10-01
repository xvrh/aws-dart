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
  ///
  /// [userPoolId]: The user pool ID for the user pool where you want to add
  /// custom attributes.
  ///
  /// [customAttributes]: An array of custom attributes, such as Mutable and
  /// Name.
  Future<AddCustomAttributesResponse> addCustomAttributes(
      {@required String userPoolId,
      @required List<SchemaAttributeType> customAttributes}) async {
    return AddCustomAttributesResponse.fromJson({});
  }

  /// Adds the specified user to the specified group.
  ///
  /// Requires developer credentials.
  ///
  /// [userPoolId]: The user pool ID for the user pool.
  ///
  /// [username]: The username for the user.
  ///
  /// [groupName]: The group name.
  Future<void> adminAddUserToGroup(
      {@required String userPoolId,
      @required String username,
      @required String groupName}) async {}

  /// Confirms user registration as an admin without using a confirmation code.
  /// Works on any user.
  ///
  /// Requires developer credentials.
  ///
  /// [userPoolId]: The user pool ID for which you want to confirm user
  /// registration.
  ///
  /// [username]: The user name for which you want to confirm user registration.
  Future<AdminConfirmSignUpResponse> adminConfirmSignUp(
      {@required String userPoolId, @required String username}) async {
    return AdminConfirmSignUpResponse.fromJson({});
  }

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
  /// In either case, the user will be in the `FORCE_CHANGE_PASSWORD` state
  /// until they sign in and change their password.
  ///
  /// AdminCreateUser requires developer credentials.
  ///
  /// [userPoolId]: The user pool ID for the user pool where the user will be
  /// created.
  ///
  /// [username]: The username for the user. Must be unique within the user
  /// pool. Must be a UTF-8 string between 1 and 128 characters. After the user
  /// is created, the username cannot be changed.
  ///
  /// [userAttributes]: An array of name-value pairs that contain user
  /// attributes and attribute values to be set for the user to be created. You
  /// can create a user without specifying any attributes other than `Username`.
  /// However, any attributes that you specify as required (in or in the
  /// **Attributes** tab of the console) must be supplied either by you (in your
  /// call to `AdminCreateUser`) or by the user (when he or she signs up in
  /// response to your welcome message).
  ///
  /// For custom attributes, you must prepend the `custom:` prefix to the
  /// attribute name.
  ///
  /// To send a message inviting the user to sign up, you must specify the
  /// user's email address or phone number. This can be done in your call to
  /// AdminCreateUser or in the **Users** tab of the Amazon Cognito console for
  /// managing your user pools.
  ///
  /// In your call to `AdminCreateUser`, you can set the `email_verified`
  /// attribute to `True`, and you can set the `phone_number_verified` attribute
  /// to `True`. (You can also do this by calling .)
  ///
  /// *    **email**: The email address of the user to whom the message that
  /// contains the code and username will be sent. Required if the
  /// `email_verified` attribute is set to `True`, or if `"EMAIL"` is specified
  /// in the `DesiredDeliveryMediums` parameter.
  ///
  /// *    **phone_number**: The phone number of the user to whom the message
  /// that contains the code and username will be sent. Required if the
  /// `phone_number_verified` attribute is set to `True`, or if `"SMS"` is
  /// specified in the `DesiredDeliveryMediums` parameter.
  ///
  /// [validationData]: The user's validation data. This is an array of
  /// name-value pairs that contain user attributes and attribute values that
  /// you can use for custom validation, such as restricting the types of user
  /// accounts that can be registered. For example, you might choose to allow or
  /// disallow user sign-up based on the user's domain.
  ///
  /// To configure custom validation, you must create a Pre Sign-up Lambda
  /// trigger for the user pool as described in the Amazon Cognito Developer
  /// Guide. The Lambda trigger receives the validation data and uses it in the
  /// validation process.
  ///
  /// The user's validation data is not persisted.
  ///
  /// [temporaryPassword]: The user's temporary password. This password must
  /// conform to the password policy that you specified when you created the
  /// user pool.
  ///
  /// The temporary password is valid only once. To complete the Admin Create
  /// User flow, the user must enter the temporary password in the sign-in page
  /// along with a new password to be used in all future sign-ins.
  ///
  /// This parameter is not required. If you do not specify a value, Amazon
  /// Cognito generates one for you.
  ///
  /// The temporary password can only be used until the user account expiration
  /// limit that you specified when you created the user pool. To reset the
  /// account after that time limit, you must call `AdminCreateUser` again,
  /// specifying `"RESEND"` for the `MessageAction` parameter.
  ///
  /// [forceAliasCreation]: This parameter is only used if the
  /// `phone_number_verified` or `email_verified` attribute is set to `True`.
  /// Otherwise, it is ignored.
  ///
  /// If this parameter is set to `True` and the phone number or email address
  /// specified in the UserAttributes parameter already exists as an alias with
  /// a different user, the API call will migrate the alias from the previous
  /// user to the newly created user. The previous user will no longer be able
  /// to log in using that alias.
  ///
  /// If this parameter is set to `False`, the API throws an
  /// `AliasExistsException` error if the alias already exists. The default
  /// value is `False`.
  ///
  /// [messageAction]: Set to `"RESEND"` to resend the invitation message to a
  /// user that already exists and reset the expiration limit on the user's
  /// account. Set to `"SUPPRESS"` to suppress sending the message. Only one
  /// value can be specified.
  ///
  /// [desiredDeliveryMediums]: Specify `"EMAIL"` if email will be used to send
  /// the welcome message. Specify `"SMS"` if the phone number will be used. The
  /// default value is `"SMS"`. More than one value can be specified.
  Future<AdminCreateUserResponse> adminCreateUser(
      {@required String userPoolId,
      @required String username,
      List<AttributeType> userAttributes,
      List<AttributeType> validationData,
      String temporaryPassword,
      bool forceAliasCreation,
      String messageAction,
      List<String> desiredDeliveryMediums}) async {
    return AdminCreateUserResponse.fromJson({});
  }

  /// Deletes a user as an administrator. Works on any user.
  ///
  /// Requires developer credentials.
  ///
  /// [userPoolId]: The user pool ID for the user pool where you want to delete
  /// the user.
  ///
  /// [username]: The user name of the user you wish to delete.
  Future<void> adminDeleteUser(
      {@required String userPoolId, @required String username}) async {}

  /// Deletes the user attributes in a user pool as an administrator. Works on
  /// any user.
  ///
  /// Requires developer credentials.
  ///
  /// [userPoolId]: The user pool ID for the user pool where you want to delete
  /// user attributes.
  ///
  /// [username]: The user name of the user from which you would like to delete
  /// attributes.
  ///
  /// [userAttributeNames]: An array of strings representing the user attribute
  /// names you wish to delete.
  ///
  /// For custom attributes, you must prepend the `custom:` prefix to the
  /// attribute name.
  Future<AdminDeleteUserAttributesResponse> adminDeleteUserAttributes(
      {@required String userPoolId,
      @required String username,
      @required List<String> userAttributeNames}) async {
    return AdminDeleteUserAttributesResponse.fromJson({});
  }

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
  ///
  /// [userPoolId]: The user pool ID for the user pool.
  ///
  /// [user]: The user to be disabled.
  Future<AdminDisableProviderForUserResponse> adminDisableProviderForUser(
      {@required String userPoolId,
      @required ProviderUserIdentifierType user}) async {
    return AdminDisableProviderForUserResponse.fromJson({});
  }

  /// Disables the specified user as an administrator. Works on any user.
  ///
  /// Requires developer credentials.
  ///
  /// [userPoolId]: The user pool ID for the user pool where you want to disable
  /// the user.
  ///
  /// [username]: The user name of the user you wish to disable.
  Future<AdminDisableUserResponse> adminDisableUser(
      {@required String userPoolId, @required String username}) async {
    return AdminDisableUserResponse.fromJson({});
  }

  /// Enables the specified user as an administrator. Works on any user.
  ///
  /// Requires developer credentials.
  ///
  /// [userPoolId]: The user pool ID for the user pool where you want to enable
  /// the user.
  ///
  /// [username]: The user name of the user you wish to enable.
  Future<AdminEnableUserResponse> adminEnableUser(
      {@required String userPoolId, @required String username}) async {
    return AdminEnableUserResponse.fromJson({});
  }

  /// Forgets the device, as an administrator.
  ///
  /// Requires developer credentials.
  ///
  /// [userPoolId]: The user pool ID.
  ///
  /// [username]: The user name.
  ///
  /// [deviceKey]: The device key.
  Future<void> adminForgetDevice(
      {@required String userPoolId,
      @required String username,
      @required String deviceKey}) async {}

  /// Gets the device, as an administrator.
  ///
  /// Requires developer credentials.
  ///
  /// [deviceKey]: The device key.
  ///
  /// [userPoolId]: The user pool ID.
  ///
  /// [username]: The user name.
  Future<AdminGetDeviceResponse> adminGetDevice(
      {@required String deviceKey,
      @required String userPoolId,
      @required String username}) async {
    return AdminGetDeviceResponse.fromJson({});
  }

  /// Gets the specified user by user name in a user pool as an administrator.
  /// Works on any user.
  ///
  /// Requires developer credentials.
  ///
  /// [userPoolId]: The user pool ID for the user pool where you want to get
  /// information about the user.
  ///
  /// [username]: The user name of the user you wish to retrieve.
  Future<AdminGetUserResponse> adminGetUser(
      {@required String userPoolId, @required String username}) async {
    return AdminGetUserResponse.fromJson({});
  }

  /// Initiates the authentication flow, as an administrator.
  ///
  /// Requires developer credentials.
  ///
  /// [userPoolId]: The ID of the Amazon Cognito user pool.
  ///
  /// [clientId]: The app client ID.
  ///
  /// [authFlow]: The authentication flow for this call to execute. The API
  /// action will depend on this value. For example:
  ///
  /// *    `REFRESH_TOKEN_AUTH` will take in a valid refresh token and return
  /// new tokens.
  ///
  /// *    `USER_SRP_AUTH` will take in `USERNAME` and `SRP_A` and return the
  /// SRP variables to be used for next challenge execution.
  ///
  /// *    `USER_PASSWORD_AUTH` will take in `USERNAME` and `PASSWORD` and
  /// return the next challenge or tokens.
  ///
  ///
  /// Valid values include:
  ///
  /// *    `USER_SRP_AUTH`: Authentication flow for the Secure Remote Password
  /// (SRP) protocol.
  ///
  /// *    `REFRESH_TOKEN_AUTH`/`REFRESH_TOKEN`: Authentication flow for
  /// refreshing the access token and ID token by supplying a valid refresh
  /// token.
  ///
  /// *    `CUSTOM_AUTH`: Custom authentication flow.
  ///
  /// *    `ADMIN_NO_SRP_AUTH`: Non-SRP authentication flow; you can pass in the
  /// USERNAME and PASSWORD directly if the flow is enabled for calling the app
  /// client.
  ///
  /// *    `USER_PASSWORD_AUTH`: Non-SRP authentication flow; USERNAME and
  /// PASSWORD are passed directly. If a user migration Lambda trigger is set,
  /// this flow will invoke the user migration Lambda if the USERNAME is not
  /// found in the user pool.
  ///
  /// [authParameters]: The authentication parameters. These are inputs
  /// corresponding to the `AuthFlow` that you are invoking. The required values
  /// depend on the value of `AuthFlow`:
  ///
  /// *   For `USER_SRP_AUTH`: `USERNAME` (required), `SRP_A` (required),
  /// `SECRET_HASH` (required if the app client is configured with a client
  /// secret), `DEVICE_KEY`
  ///
  /// *   For `REFRESH_TOKEN_AUTH/REFRESH_TOKEN`: `REFRESH_TOKEN` (required),
  /// `SECRET_HASH` (required if the app client is configured with a client
  /// secret), `DEVICE_KEY`
  ///
  /// *   For `ADMIN_NO_SRP_AUTH`: `USERNAME` (required), `SECRET_HASH` (if app
  /// client is configured with client secret), `PASSWORD` (required),
  /// `DEVICE_KEY`
  ///
  /// *   For `CUSTOM_AUTH`: `USERNAME` (required), `SECRET_HASH` (if app client
  /// is configured with client secret), `DEVICE_KEY`
  ///
  /// [clientMetadata]: This is a random key-value pair map which can contain
  /// any key and will be passed to your PreAuthentication Lambda trigger as-is.
  /// It can be used to implement additional validations around authentication.
  ///
  /// [analyticsMetadata]: The analytics metadata for collecting Amazon Pinpoint
  /// metrics for `AdminInitiateAuth` calls.
  ///
  /// [contextData]: Contextual data such as the user's device fingerprint, IP
  /// address, or location used for evaluating the risk of an unexpected event
  /// by Amazon Cognito advanced security.
  Future<AdminInitiateAuthResponse> adminInitiateAuth(
      {@required String userPoolId,
      @required String clientId,
      @required String authFlow,
      Map<String, String> authParameters,
      Map<String, String> clientMetadata,
      AnalyticsMetadataType analyticsMetadata,
      ContextDataType contextData}) async {
    return AdminInitiateAuthResponse.fromJson({});
  }

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
  ///
  /// [userPoolId]: The user pool ID for the user pool.
  ///
  /// [destinationUser]: The existing user in the user pool to be linked to the
  /// external identity provider user account. Can be a native (Username +
  /// Password) Cognito User Pools user or a federated user (for example, a SAML
  /// or Facebook user). If the user doesn't exist, an exception is thrown. This
  /// is the user that is returned when the new user (with the linked identity
  /// provider attribute) signs in.
  ///
  /// For a native username + password user, the `ProviderAttributeValue` for
  /// the `DestinationUser` should be the username in the user pool. For a
  /// federated user, it should be the provider-specific `user_id`.
  ///
  /// The `ProviderAttributeName` of the `DestinationUser` is ignored.
  ///
  /// The `ProviderName` should be set to `Cognito` for users in Cognito user
  /// pools.
  ///
  /// [sourceUser]: An external identity provider account for a user who does
  /// not currently exist yet in the user pool. This user must be a federated
  /// user (for example, a SAML or Facebook user), not another native user.
  ///
  /// If the `SourceUser` is a federated social identity provider user
  /// (Facebook, Google, or Login with Amazon), you must set the
  /// `ProviderAttributeName` to `Cognito_Subject`. For social identity
  /// providers, the `ProviderName` will be `Facebook`, `Google`, or
  /// `LoginWithAmazon`, and Cognito will automatically parse the Facebook,
  /// Google, and Login with Amazon tokens for `id`, `sub`, and `user_id`,
  /// respectively. The `ProviderAttributeValue` for the user must be the same
  /// value as the `id`, `sub`, or `user_id` value found in the social identity
  /// provider token.
  ///
  /// For SAML, the `ProviderAttributeName` can be any value that matches a
  /// claim in the SAML assertion. If you wish to link SAML users based on the
  /// subject of the SAML assertion, you should map the subject to a claim
  /// through the SAML identity provider and submit that claim name as the
  /// `ProviderAttributeName`. If you set `ProviderAttributeName` to
  /// `Cognito_Subject`, Cognito will automatically parse the default unique
  /// identifier found in the subject from the SAML token.
  Future<AdminLinkProviderForUserResponse> adminLinkProviderForUser(
      {@required String userPoolId,
      @required ProviderUserIdentifierType destinationUser,
      @required ProviderUserIdentifierType sourceUser}) async {
    return AdminLinkProviderForUserResponse.fromJson({});
  }

  /// Lists devices, as an administrator.
  ///
  /// Requires developer credentials.
  ///
  /// [userPoolId]: The user pool ID.
  ///
  /// [username]: The user name.
  ///
  /// [limit]: The limit of the devices request.
  ///
  /// [paginationToken]: The pagination token.
  Future<AdminListDevicesResponse> adminListDevices(
      {@required String userPoolId,
      @required String username,
      int limit,
      String paginationToken}) async {
    return AdminListDevicesResponse.fromJson({});
  }

  /// Lists the groups that the user belongs to.
  ///
  /// Requires developer credentials.
  ///
  /// [username]: The username for the user.
  ///
  /// [userPoolId]: The user pool ID for the user pool.
  ///
  /// [limit]: The limit of the request to list groups.
  ///
  /// [nextToken]: An identifier that was returned from the previous call to
  /// this operation, which can be used to return the next set of items in the
  /// list.
  Future<AdminListGroupsForUserResponse> adminListGroupsForUser(
      {@required String username,
      @required String userPoolId,
      int limit,
      String nextToken}) async {
    return AdminListGroupsForUserResponse.fromJson({});
  }

  /// Lists a history of user activity and any risks detected as part of Amazon
  /// Cognito advanced security.
  ///
  /// [userPoolId]: The user pool ID.
  ///
  /// [username]: The user pool username or an alias.
  ///
  /// [maxResults]: The maximum number of authentication events to return.
  ///
  /// [nextToken]: A pagination token.
  Future<AdminListUserAuthEventsResponse> adminListUserAuthEvents(
      {@required String userPoolId,
      @required String username,
      int maxResults,
      String nextToken}) async {
    return AdminListUserAuthEventsResponse.fromJson({});
  }

  /// Removes the specified user from the specified group.
  ///
  /// Requires developer credentials.
  ///
  /// [userPoolId]: The user pool ID for the user pool.
  ///
  /// [username]: The username for the user.
  ///
  /// [groupName]: The group name.
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
  ///
  /// [userPoolId]: The user pool ID for the user pool where you want to reset
  /// the user's password.
  ///
  /// [username]: The user name of the user whose password you wish to reset.
  Future<AdminResetUserPasswordResponse> adminResetUserPassword(
      {@required String userPoolId, @required String username}) async {
    return AdminResetUserPasswordResponse.fromJson({});
  }

  /// Responds to an authentication challenge, as an administrator.
  ///
  /// Requires developer credentials.
  ///
  /// [userPoolId]: The ID of the Amazon Cognito user pool.
  ///
  /// [clientId]: The app client ID.
  ///
  /// [challengeName]: The challenge name. For more information, see .
  ///
  /// [challengeResponses]: The challenge responses. These are inputs
  /// corresponding to the value of `ChallengeName`, for example:
  ///
  /// *    `SMS_MFA`: `SMS_MFA_CODE`, `USERNAME`, `SECRET_HASH` (if app client
  /// is configured with client secret).
  ///
  /// *    `PASSWORD_VERIFIER`: `PASSWORD_CLAIM_SIGNATURE`,
  /// `PASSWORD_CLAIM_SECRET_BLOCK`, `TIMESTAMP`, `USERNAME`, `SECRET_HASH` (if
  /// app client is configured with client secret).
  ///
  /// *    `ADMIN_NO_SRP_AUTH`: `PASSWORD`, `USERNAME`, `SECRET_HASH` (if app
  /// client is configured with client secret).
  ///
  /// *    `NEW_PASSWORD_REQUIRED`: `NEW_PASSWORD`, any other required
  /// attributes, `USERNAME`, `SECRET_HASH` (if app client is configured with
  /// client secret).
  ///
  ///
  /// The value of the `USERNAME` attribute must be the user's actual username,
  /// not an alias (such as email address or phone number). To make this easier,
  /// the `AdminInitiateAuth` response includes the actual username value in the
  /// `USERNAMEUSER_ID_FOR_SRP` attribute, even if you specified an alias in
  /// your call to `AdminInitiateAuth`.
  ///
  /// [session]: The session which should be passed both ways in
  /// challenge-response calls to the service. If `InitiateAuth` or
  /// `RespondToAuthChallenge` API call determines that the caller needs to go
  /// through another challenge, they return a session with other challenge
  /// parameters. This session should be passed as it is to the next
  /// `RespondToAuthChallenge` API call.
  ///
  /// [analyticsMetadata]: The analytics metadata for collecting Amazon Pinpoint
  /// metrics for `AdminRespondToAuthChallenge` calls.
  ///
  /// [contextData]: Contextual data such as the user's device fingerprint, IP
  /// address, or location used for evaluating the risk of an unexpected event
  /// by Amazon Cognito advanced security.
  Future<AdminRespondToAuthChallengeResponse> adminRespondToAuthChallenge(
      {@required String userPoolId,
      @required String clientId,
      @required String challengeName,
      Map<String, String> challengeResponses,
      String session,
      AnalyticsMetadataType analyticsMetadata,
      ContextDataType contextData}) async {
    return AdminRespondToAuthChallengeResponse.fromJson({});
  }

  /// Sets the user's multi-factor authentication (MFA) preference.
  ///
  /// [smsMfaSettings]: The SMS text message MFA settings.
  ///
  /// [softwareTokenMfaSettings]: The time-based one-time password software
  /// token MFA settings.
  ///
  /// [username]: The user pool username or alias.
  ///
  /// [userPoolId]: The user pool ID.
  Future<AdminSetUserMfaPreferenceResponse> adminSetUserMfaPreference(
      {SmsMfaSettingsType smsMfaSettings,
      SoftwareTokenMfaSettingsType softwareTokenMfaSettings,
      @required String username,
      @required String userPoolId}) async {
    return AdminSetUserMfaPreferenceResponse.fromJson({});
  }

  Future<AdminSetUserPasswordResponse> adminSetUserPassword(
      {@required String userPoolId,
      @required String username,
      @required String password,
      bool permanent}) async {
    return AdminSetUserPasswordResponse.fromJson({});
  }

  /// Sets all the user settings for a specified user name. Works on any user.
  ///
  /// Requires developer credentials.
  ///
  /// [userPoolId]: The user pool ID for the user pool where you want to set the
  /// user's settings, such as MFA options.
  ///
  /// [username]: The user name of the user for whom you wish to set user
  /// settings.
  ///
  /// [mfaOptions]: Specifies the options for MFA (e.g., email or phone number).
  Future<AdminSetUserSettingsResponse> adminSetUserSettings(
      {@required String userPoolId,
      @required String username,
      @required List<MfaOptionType> mfaOptions}) async {
    return AdminSetUserSettingsResponse.fromJson({});
  }

  /// Provides feedback for an authentication event as to whether it was from a
  /// valid user. This feedback is used for improving the risk evaluation
  /// decision for the user pool as part of Amazon Cognito advanced security.
  ///
  /// [userPoolId]: The user pool ID.
  ///
  /// [username]: The user pool username.
  ///
  /// [eventId]: The authentication event ID.
  ///
  /// [feedbackValue]: The authentication event feedback value.
  Future<AdminUpdateAuthEventFeedbackResponse> adminUpdateAuthEventFeedback(
      {@required String userPoolId,
      @required String username,
      @required String eventId,
      @required String feedbackValue}) async {
    return AdminUpdateAuthEventFeedbackResponse.fromJson({});
  }

  /// Updates the device status as an administrator.
  ///
  /// Requires developer credentials.
  ///
  /// [userPoolId]: The user pool ID.
  ///
  /// [username]: The user name.
  ///
  /// [deviceKey]: The device key.
  ///
  /// [deviceRememberedStatus]: The status indicating whether a device has been
  /// remembered or not.
  Future<AdminUpdateDeviceStatusResponse> adminUpdateDeviceStatus(
      {@required String userPoolId,
      @required String username,
      @required String deviceKey,
      String deviceRememberedStatus}) async {
    return AdminUpdateDeviceStatusResponse.fromJson({});
  }

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
  ///
  /// [userPoolId]: The user pool ID for the user pool where you want to update
  /// user attributes.
  ///
  /// [username]: The user name of the user for whom you want to update user
  /// attributes.
  ///
  /// [userAttributes]: An array of name-value pairs representing user
  /// attributes.
  ///
  /// For custom attributes, you must prepend the `custom:` prefix to the
  /// attribute name.
  Future<AdminUpdateUserAttributesResponse> adminUpdateUserAttributes(
      {@required String userPoolId,
      @required String username,
      @required List<AttributeType> userAttributes}) async {
    return AdminUpdateUserAttributesResponse.fromJson({});
  }

  /// Signs out users from all devices, as an administrator.
  ///
  /// Requires developer credentials.
  ///
  /// [userPoolId]: The user pool ID.
  ///
  /// [username]: The user name.
  Future<AdminUserGlobalSignOutResponse> adminUserGlobalSignOut(
      {@required String userPoolId, @required String username}) async {
    return AdminUserGlobalSignOutResponse.fromJson({});
  }

  /// Returns a unique generated shared secret key code for the user account.
  /// The request takes an access token or a session string, but not both.
  ///
  /// [accessToken]: The access token.
  ///
  /// [session]: The session which should be passed both ways in
  /// challenge-response calls to the service. This allows authentication of the
  /// user as part of the MFA setup process.
  Future<AssociateSoftwareTokenResponse> associateSoftwareToken(
      {String accessToken, String session}) async {
    return AssociateSoftwareTokenResponse.fromJson({});
  }

  /// Changes the password for a specified user in a user pool.
  ///
  /// [previousPassword]: The old password.
  ///
  /// [proposedPassword]: The new password.
  ///
  /// [accessToken]: The access token.
  Future<ChangePasswordResponse> changePassword(
      {@required String previousPassword,
      @required String proposedPassword,
      @required String accessToken}) async {
    return ChangePasswordResponse.fromJson({});
  }

  /// Confirms tracking of the device. This API call is the call that begins
  /// device tracking.
  ///
  /// [accessToken]: The access token.
  ///
  /// [deviceKey]: The device key.
  ///
  /// [deviceSecretVerifierConfig]: The configuration of the device secret
  /// verifier.
  ///
  /// [deviceName]: The device name.
  Future<ConfirmDeviceResponse> confirmDevice(
      {@required String accessToken,
      @required String deviceKey,
      DeviceSecretVerifierConfigType deviceSecretVerifierConfig,
      String deviceName}) async {
    return ConfirmDeviceResponse.fromJson({});
  }

  /// Allows a user to enter a confirmation code to reset a forgotten password.
  ///
  /// [clientId]: The app client ID of the app associated with the user pool.
  ///
  /// [secretHash]: A keyed-hash message authentication code (HMAC) calculated
  /// using the secret key of a user pool client and username plus the client ID
  /// in the message.
  ///
  /// [username]: The user name of the user for whom you want to enter a code to
  /// retrieve a forgotten password.
  ///
  /// [confirmationCode]: The confirmation code sent by a user's request to
  /// retrieve a forgotten password. For more information, see
  ///
  /// [password]: The password sent by a user's request to retrieve a forgotten
  /// password.
  ///
  /// [analyticsMetadata]: The Amazon Pinpoint analytics metadata for collecting
  /// metrics for `ConfirmForgotPassword` calls.
  ///
  /// [userContextData]: Contextual data such as the user's device fingerprint,
  /// IP address, or location used for evaluating the risk of an unexpected
  /// event by Amazon Cognito advanced security.
  Future<ConfirmForgotPasswordResponse> confirmForgotPassword(
      {@required String clientId,
      String secretHash,
      @required String username,
      @required String confirmationCode,
      @required String password,
      AnalyticsMetadataType analyticsMetadata,
      UserContextDataType userContextData}) async {
    return ConfirmForgotPasswordResponse.fromJson({});
  }

  /// Confirms registration of a user and handles the existing alias from a
  /// previous user.
  ///
  /// [clientId]: The ID of the app client associated with the user pool.
  ///
  /// [secretHash]: A keyed-hash message authentication code (HMAC) calculated
  /// using the secret key of a user pool client and username plus the client ID
  /// in the message.
  ///
  /// [username]: The user name of the user whose registration you wish to
  /// confirm.
  ///
  /// [confirmationCode]: The confirmation code sent by a user's request to
  /// confirm registration.
  ///
  /// [forceAliasCreation]: Boolean to be specified to force user confirmation
  /// irrespective of existing alias. By default set to `False`. If this
  /// parameter is set to `True` and the phone number/email used for sign up
  /// confirmation already exists as an alias with a different user, the API
  /// call will migrate the alias from the previous user to the newly created
  /// user being confirmed. If set to `False`, the API will throw an
  /// **AliasExistsException** error.
  ///
  /// [analyticsMetadata]: The Amazon Pinpoint analytics metadata for collecting
  /// metrics for `ConfirmSignUp` calls.
  ///
  /// [userContextData]: Contextual data such as the user's device fingerprint,
  /// IP address, or location used for evaluating the risk of an unexpected
  /// event by Amazon Cognito advanced security.
  Future<ConfirmSignUpResponse> confirmSignUp(
      {@required String clientId,
      String secretHash,
      @required String username,
      @required String confirmationCode,
      bool forceAliasCreation,
      AnalyticsMetadataType analyticsMetadata,
      UserContextDataType userContextData}) async {
    return ConfirmSignUpResponse.fromJson({});
  }

  /// Creates a new group in the specified user pool.
  ///
  /// Requires developer credentials.
  ///
  /// [groupName]: The name of the group. Must be unique.
  ///
  /// [userPoolId]: The user pool ID for the user pool.
  ///
  /// [description]: A string containing the description of the group.
  ///
  /// [roleArn]: The role ARN for the group.
  ///
  /// [precedence]: A nonnegative integer value that specifies the precedence of
  /// this group relative to the other groups that a user can belong to in the
  /// user pool. Zero is the highest precedence value. Groups with lower
  /// `Precedence` values take precedence over groups with higher or null
  /// `Precedence` values. If a user belongs to two or more groups, it is the
  /// group with the lowest precedence value whose role ARN will be used in the
  /// `cognito:roles` and `cognito:preferred_role` claims in the user's tokens.
  ///
  /// Two groups can have the same `Precedence` value. If this happens, neither
  /// group takes precedence over the other. If two groups with the same
  /// `Precedence` have the same role ARN, that role is used in the
  /// `cognito:preferred_role` claim in tokens for users in each group. If the
  /// two groups have different role ARNs, the `cognito:preferred_role` claim is
  /// not set in users' tokens.
  ///
  /// The default `Precedence` value is null.
  Future<CreateGroupResponse> createGroup(
      {@required String groupName,
      @required String userPoolId,
      String description,
      String roleArn,
      int precedence}) async {
    return CreateGroupResponse.fromJson({});
  }

  /// Creates an identity provider for a user pool.
  ///
  /// [userPoolId]: The user pool ID.
  ///
  /// [providerName]: The identity provider name.
  ///
  /// [providerType]: The identity provider type.
  ///
  /// [providerDetails]: The identity provider details, such as `MetadataURL`
  /// and `MetadataFile`.
  ///
  /// [attributeMapping]: A mapping of identity provider attributes to standard
  /// and custom user pool attributes.
  ///
  /// [idpIdentifiers]: A list of identity provider identifiers.
  Future<CreateIdentityProviderResponse> createIdentityProvider(
      {@required String userPoolId,
      @required String providerName,
      @required String providerType,
      @required Map<String, String> providerDetails,
      Map<String, String> attributeMapping,
      List<String> idpIdentifiers}) async {
    return CreateIdentityProviderResponse.fromJson({});
  }

  /// Creates a new OAuth2.0 resource server and defines custom scopes in it.
  ///
  /// [userPoolId]: The user pool ID for the user pool.
  ///
  /// [identifier]: A unique resource server identifier for the resource server.
  /// This could be an HTTPS endpoint where the resource server is located. For
  /// example, `https://my-weather-api.example.com`.
  ///
  /// [name]: A friendly name for the resource server.
  ///
  /// [scopes]: A list of scopes. Each scope is map, where the keys are `name`
  /// and `description`.
  Future<CreateResourceServerResponse> createResourceServer(
      {@required String userPoolId,
      @required String identifier,
      @required String name,
      List<ResourceServerScopeType> scopes}) async {
    return CreateResourceServerResponse.fromJson({});
  }

  /// Creates the user import job.
  ///
  /// [jobName]: The job name for the user import job.
  ///
  /// [userPoolId]: The user pool ID for the user pool that the users are being
  /// imported into.
  ///
  /// [cloudWatchLogsRoleArn]: The role ARN for the Amazon CloudWatch Logging
  /// role for the user import job.
  Future<CreateUserImportJobResponse> createUserImportJob(
      {@required String jobName,
      @required String userPoolId,
      @required String cloudWatchLogsRoleArn}) async {
    return CreateUserImportJobResponse.fromJson({});
  }

  /// Creates a new Amazon Cognito user pool and sets the password policy for
  /// the pool.
  ///
  /// [poolName]: A string used to name the user pool.
  ///
  /// [policies]: The policies associated with the new user pool.
  ///
  /// [lambdaConfig]: The Lambda trigger configuration information for the new
  /// user pool.
  ///
  ///
  ///
  /// In a push model, event sources (such as Amazon S3 and custom applications)
  /// need permission to invoke a function. So you will need to make an extra
  /// call to add permission for these event sources to invoke your Lambda
  /// function.
  ///
  /// For more information on using the Lambda API to add permission, see
  /// [AddPermission](https://docs.aws.amazon.com/lambda/latest/dg/API_AddPermission.html)
  /// .
  ///
  /// For adding permission using the AWS CLI, see
  /// [add-permission](https://docs.aws.amazon.com/cli/latest/reference/lambda/add-permission.html)
  /// .
  ///
  /// [autoVerifiedAttributes]: The attributes to be auto-verified. Possible
  /// values: **email**, **phone_number**.
  ///
  /// [aliasAttributes]: Attributes supported as an alias for this user pool.
  /// Possible values: **phone_number**, **email**, or **preferred_username**.
  ///
  /// [usernameAttributes]: Specifies whether email addresses or phone numbers
  /// can be specified as usernames when a user signs up.
  ///
  /// [smsVerificationMessage]: A string representing the SMS verification
  /// message.
  ///
  /// [emailVerificationMessage]: A string representing the email verification
  /// message.
  ///
  /// [emailVerificationSubject]: A string representing the email verification
  /// subject.
  ///
  /// [verificationMessageTemplate]: The template for the verification message
  /// that the user sees when the app requests permission to access the user's
  /// information.
  ///
  /// [smsAuthenticationMessage]: A string representing the SMS authentication
  /// message.
  ///
  /// [mfaConfiguration]: Specifies MFA configuration details.
  ///
  /// [deviceConfiguration]: The device configuration.
  ///
  /// [emailConfiguration]: The email configuration.
  ///
  /// [smsConfiguration]: The SMS configuration.
  ///
  /// [userPoolTags]: The tag keys and values to assign to the user pool. A tag
  /// is a label that you can use to categorize and manage user pools in
  /// different ways, such as by purpose, owner, environment, or other criteria.
  ///
  /// [adminCreateUserConfig]: The configuration for `AdminCreateUser` requests.
  ///
  /// [schema]: An array of schema attributes for the new user pool. These
  /// attributes can be standard or custom attributes.
  ///
  /// [userPoolAddOns]: Used to enable advanced security risk detection. Set the
  /// key `AdvancedSecurityMode` to the value "AUDIT".
  Future<CreateUserPoolResponse> createUserPool(String poolName,
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
      UserPoolAddOnsType userPoolAddOns}) async {
    return CreateUserPoolResponse.fromJson({});
  }

  /// Creates the user pool client.
  ///
  /// [userPoolId]: The user pool ID for the user pool where you want to create
  /// a user pool client.
  ///
  /// [clientName]: The client name for the user pool client you would like to
  /// create.
  ///
  /// [generateSecret]: Boolean to specify whether you want to generate a secret
  /// for the user pool client being created.
  ///
  /// [refreshTokenValidity]: The time limit, in days, after which the refresh
  /// token is no longer valid and cannot be used.
  ///
  /// [readAttributes]: The read attributes.
  ///
  /// [writeAttributes]: The user pool attributes that the app client can write
  /// to.
  ///
  /// If your app client allows users to sign in through an identity provider,
  /// this array must include all attributes that are mapped to identity
  /// provider attributes. Amazon Cognito updates mapped attributes when users
  /// sign in to your application through an identity provider. If your app
  /// client lacks write access to a mapped attribute, Amazon Cognito throws an
  /// error when it attempts to update the attribute. For more information, see
  /// [Specifying Identity Provider Attribute Mappings for Your User Pool](https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-specifying-attribute-mapping.html).
  ///
  /// [explicitAuthFlows]: The explicit authentication flows.
  ///
  /// [supportedIdentityProviders]: A list of provider names for the identity
  /// providers that are supported on this client. The following are supported:
  /// `COGNITO`, `Facebook`, `Google` and `LoginWithAmazon`.
  ///
  /// [callbackURLs]: A list of allowed redirect (callback) URLs for the
  /// identity providers.
  ///
  /// A redirect URI must:
  ///
  /// *   Be an absolute URI.
  ///
  /// *   Be registered with the authorization server.
  ///
  /// *   Not include a fragment component.
  ///
  ///
  /// See
  /// [OAuth 2.0 - Redirection Endpoint](https://tools.ietf.org/html/rfc6749#section-3.1.2).
  ///
  /// Amazon Cognito requires HTTPS over HTTP except for http://localhost for
  /// testing purposes only.
  ///
  /// App callback URLs such as myapp://example are also supported.
  ///
  /// [logoutURLs]: A list of allowed logout URLs for the identity providers.
  ///
  /// [defaultRedirectUri]: The default redirect URI. Must be in the
  /// `CallbackURLs` list.
  ///
  /// A redirect URI must:
  ///
  /// *   Be an absolute URI.
  ///
  /// *   Be registered with the authorization server.
  ///
  /// *   Not include a fragment component.
  ///
  ///
  /// See
  /// [OAuth 2.0 - Redirection Endpoint](https://tools.ietf.org/html/rfc6749#section-3.1.2).
  ///
  /// Amazon Cognito requires HTTPS over HTTP except for http://localhost for
  /// testing purposes only.
  ///
  /// App callback URLs such as myapp://example are also supported.
  ///
  /// [allowedoAuthFlows]: Set to `code` to initiate a code grant flow, which
  /// provides an authorization code as the response. This code can be exchanged
  /// for access tokens with the token endpoint.
  ///
  /// Set to `token` to specify that the client should get the access token
  /// (and, optionally, ID token, based on scopes) directly.
  ///
  /// [allowedoAuthScopes]: A list of allowed `OAuth` scopes. Currently
  /// supported values are `"phone"`, `"email"`, `"openid"`, and `"Cognito"`.
  ///
  /// [allowedoAuthFlowsUserPoolClient]: Set to `True` if the client is allowed
  /// to follow the OAuth protocol when interacting with Cognito user pools.
  ///
  /// [analyticsConfiguration]: The Amazon Pinpoint analytics configuration for
  /// collecting metrics for this user pool.
  Future<CreateUserPoolClientResponse> createUserPoolClient(
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
      AnalyticsConfigurationType analyticsConfiguration}) async {
    return CreateUserPoolClientResponse.fromJson({});
  }

  /// Creates a new domain for a user pool.
  ///
  /// [domain]: The domain string.
  ///
  /// [userPoolId]: The user pool ID.
  ///
  /// [customDomainConfig]: The configuration for a custom domain that hosts the
  /// sign-up and sign-in webpages for your application.
  ///
  /// Provide this parameter only if you want to use a custom domain for your
  /// user pool. Otherwise, you can exclude this parameter and use the Amazon
  /// Cognito hosted domain instead.
  ///
  /// For more information about the hosted domain and custom domains, see
  /// [Configuring a User Pool Domain](https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-assign-domain.html).
  Future<CreateUserPoolDomainResponse> createUserPoolDomain(
      {@required String domain,
      @required String userPoolId,
      CustomDomainConfigType customDomainConfig}) async {
    return CreateUserPoolDomainResponse.fromJson({});
  }

  /// Deletes a group. Currently only groups with no members can be deleted.
  ///
  /// Requires developer credentials.
  ///
  /// [groupName]: The name of the group.
  ///
  /// [userPoolId]: The user pool ID for the user pool.
  Future<void> deleteGroup(
      {@required String groupName, @required String userPoolId}) async {}

  /// Deletes an identity provider for a user pool.
  ///
  /// [userPoolId]: The user pool ID.
  ///
  /// [providerName]: The identity provider name.
  Future<void> deleteIdentityProvider(
      {@required String userPoolId, @required String providerName}) async {}

  /// Deletes a resource server.
  ///
  /// [userPoolId]: The user pool ID for the user pool that hosts the resource
  /// server.
  ///
  /// [identifier]: The identifier for the resource server.
  Future<void> deleteResourceServer(
      {@required String userPoolId, @required String identifier}) async {}

  /// Allows a user to delete himself or herself.
  ///
  /// [accessToken]: The access token from a request to delete a user.
  Future<void> deleteUser(String accessToken) async {}

  /// Deletes the attributes for a user.
  ///
  /// [userAttributeNames]: An array of strings representing the user attribute
  /// names you wish to delete.
  ///
  /// For custom attributes, you must prepend the `custom:` prefix to the
  /// attribute name.
  ///
  /// [accessToken]: The access token used in the request to delete user
  /// attributes.
  Future<DeleteUserAttributesResponse> deleteUserAttributes(
      {@required List<String> userAttributeNames,
      @required String accessToken}) async {
    return DeleteUserAttributesResponse.fromJson({});
  }

  /// Deletes the specified Amazon Cognito user pool.
  ///
  /// [userPoolId]: The user pool ID for the user pool you want to delete.
  Future<void> deleteUserPool(String userPoolId) async {}

  /// Allows the developer to delete the user pool client.
  ///
  /// [userPoolId]: The user pool ID for the user pool where you want to delete
  /// the client.
  ///
  /// [clientId]: The app client ID of the app associated with the user pool.
  Future<void> deleteUserPoolClient(
      {@required String userPoolId, @required String clientId}) async {}

  /// Deletes a domain for a user pool.
  ///
  /// [domain]: The domain string.
  ///
  /// [userPoolId]: The user pool ID.
  Future<DeleteUserPoolDomainResponse> deleteUserPoolDomain(
      {@required String domain, @required String userPoolId}) async {
    return DeleteUserPoolDomainResponse.fromJson({});
  }

  /// Gets information about a specific identity provider.
  ///
  /// [userPoolId]: The user pool ID.
  ///
  /// [providerName]: The identity provider name.
  Future<DescribeIdentityProviderResponse> describeIdentityProvider(
      {@required String userPoolId, @required String providerName}) async {
    return DescribeIdentityProviderResponse.fromJson({});
  }

  /// Describes a resource server.
  ///
  /// [userPoolId]: The user pool ID for the user pool that hosts the resource
  /// server.
  ///
  /// [identifier]: The identifier for the resource server
  Future<DescribeResourceServerResponse> describeResourceServer(
      {@required String userPoolId, @required String identifier}) async {
    return DescribeResourceServerResponse.fromJson({});
  }

  /// Describes the risk configuration.
  ///
  /// [userPoolId]: The user pool ID.
  ///
  /// [clientId]: The app client ID.
  Future<DescribeRiskConfigurationResponse> describeRiskConfiguration(
      String userPoolId,
      {String clientId}) async {
    return DescribeRiskConfigurationResponse.fromJson({});
  }

  /// Describes the user import job.
  ///
  /// [userPoolId]: The user pool ID for the user pool that the users are being
  /// imported into.
  ///
  /// [jobId]: The job ID for the user import job.
  Future<DescribeUserImportJobResponse> describeUserImportJob(
      {@required String userPoolId, @required String jobId}) async {
    return DescribeUserImportJobResponse.fromJson({});
  }

  /// Returns the configuration information and metadata of the specified user
  /// pool.
  ///
  /// [userPoolId]: The user pool ID for the user pool you want to describe.
  Future<DescribeUserPoolResponse> describeUserPool(String userPoolId) async {
    return DescribeUserPoolResponse.fromJson({});
  }

  /// Client method for returning the configuration information and metadata of
  /// the specified user pool app client.
  ///
  /// [userPoolId]: The user pool ID for the user pool you want to describe.
  ///
  /// [clientId]: The app client ID of the app associated with the user pool.
  Future<DescribeUserPoolClientResponse> describeUserPoolClient(
      {@required String userPoolId, @required String clientId}) async {
    return DescribeUserPoolClientResponse.fromJson({});
  }

  /// Gets information about a domain.
  ///
  /// [domain]: The domain string.
  Future<DescribeUserPoolDomainResponse> describeUserPoolDomain(
      String domain) async {
    return DescribeUserPoolDomainResponse.fromJson({});
  }

  /// Forgets the specified device.
  ///
  /// [accessToken]: The access token for the forgotten device request.
  ///
  /// [deviceKey]: The device key.
  Future<void> forgetDevice(String deviceKey, {String accessToken}) async {}

  /// Calling this API causes a message to be sent to the end user with a
  /// confirmation code that is required to change the user's password. For the
  /// `Username` parameter, you can use the username or user alias. If a
  /// verified phone number exists for the user, the confirmation code is sent
  /// to the phone number. Otherwise, if a verified email exists, the
  /// confirmation code is sent to the email. If neither a verified phone number
  /// nor a verified email exists, `InvalidParameterException` is thrown. To use
  /// the confirmation code for resetting the password, call .
  ///
  /// [clientId]: The ID of the client associated with the user pool.
  ///
  /// [secretHash]: A keyed-hash message authentication code (HMAC) calculated
  /// using the secret key of a user pool client and username plus the client ID
  /// in the message.
  ///
  /// [userContextData]: Contextual data such as the user's device fingerprint,
  /// IP address, or location used for evaluating the risk of an unexpected
  /// event by Amazon Cognito advanced security.
  ///
  /// [username]: The user name of the user for whom you want to enter a code to
  /// reset a forgotten password.
  ///
  /// [analyticsMetadata]: The Amazon Pinpoint analytics metadata for collecting
  /// metrics for `ForgotPassword` calls.
  Future<ForgotPasswordResponse> forgotPassword(
      {@required String clientId,
      String secretHash,
      UserContextDataType userContextData,
      @required String username,
      AnalyticsMetadataType analyticsMetadata}) async {
    return ForgotPasswordResponse.fromJson({});
  }

  /// Gets the header information for the .csv file to be used as input for the
  /// user import job.
  ///
  /// [userPoolId]: The user pool ID for the user pool that the users are to be
  /// imported into.
  Future<GetCsvHeaderResponse> getCsvHeader(String userPoolId) async {
    return GetCsvHeaderResponse.fromJson({});
  }

  /// Gets the device.
  ///
  /// [deviceKey]: The device key.
  ///
  /// [accessToken]: The access token.
  Future<GetDeviceResponse> getDevice(String deviceKey,
      {String accessToken}) async {
    return GetDeviceResponse.fromJson({});
  }

  /// Gets a group.
  ///
  /// Requires developer credentials.
  ///
  /// [groupName]: The name of the group.
  ///
  /// [userPoolId]: The user pool ID for the user pool.
  Future<GetGroupResponse> getGroup(
      {@required String groupName, @required String userPoolId}) async {
    return GetGroupResponse.fromJson({});
  }

  /// Gets the specified identity provider.
  ///
  /// [userPoolId]: The user pool ID.
  ///
  /// [idpIdentifier]: The identity provider ID.
  Future<GetIdentityProviderByIdentifierResponse>
      getIdentityProviderByIdentifier(
          {@required String userPoolId, @required String idpIdentifier}) async {
    return GetIdentityProviderByIdentifierResponse.fromJson({});
  }

  /// This method takes a user pool ID, and returns the signing certificate.
  ///
  /// [userPoolId]: The user pool ID.
  Future<GetSigningCertificateResponse> getSigningCertificate(
      String userPoolId) async {
    return GetSigningCertificateResponse.fromJson({});
  }

  /// Gets the UI Customization information for a particular app client's app
  /// UI, if there is something set. If nothing is set for the particular
  /// client, but there is an existing pool level customization (app `clientId`
  /// will be `ALL`), then that is returned. If nothing is present, then an
  /// empty shape is returned.
  ///
  /// [userPoolId]: The user pool ID for the user pool.
  ///
  /// [clientId]: The client ID for the client app.
  Future<GetUICustomizationResponse> getUICustomization(String userPoolId,
      {String clientId}) async {
    return GetUICustomizationResponse.fromJson({});
  }

  /// Gets the user attributes and metadata for a user.
  ///
  /// [accessToken]: The access token returned by the server response to get
  /// information about the user.
  Future<GetUserResponse> getUser(String accessToken) async {
    return GetUserResponse.fromJson({});
  }

  /// Gets the user attribute verification code for the specified attribute
  /// name.
  ///
  /// [accessToken]: The access token returned by the server response to get the
  /// user attribute verification code.
  ///
  /// [attributeName]: The attribute name returned by the server response to get
  /// the user attribute verification code.
  Future<GetUserAttributeVerificationCodeResponse>
      getUserAttributeVerificationCode(
          {@required String accessToken,
          @required String attributeName}) async {
    return GetUserAttributeVerificationCodeResponse.fromJson({});
  }

  /// Gets the user pool multi-factor authentication (MFA) configuration.
  ///
  /// [userPoolId]: The user pool ID.
  Future<GetUserPoolMfaConfigResponse> getUserPoolMfaConfig(
      String userPoolId) async {
    return GetUserPoolMfaConfigResponse.fromJson({});
  }

  /// Signs out users from all devices.
  ///
  /// [accessToken]: The access token.
  Future<GlobalSignOutResponse> globalSignOut(String accessToken) async {
    return GlobalSignOutResponse.fromJson({});
  }

  /// Initiates the authentication flow.
  ///
  /// [authFlow]: The authentication flow for this call to execute. The API
  /// action will depend on this value. For example:
  ///
  /// *    `REFRESH_TOKEN_AUTH` will take in a valid refresh token and return
  /// new tokens.
  ///
  /// *    `USER_SRP_AUTH` will take in `USERNAME` and `SRP_A` and return the
  /// SRP variables to be used for next challenge execution.
  ///
  /// *    `USER_PASSWORD_AUTH` will take in `USERNAME` and `PASSWORD` and
  /// return the next challenge or tokens.
  ///
  ///
  /// Valid values include:
  ///
  /// *    `USER_SRP_AUTH`: Authentication flow for the Secure Remote Password
  /// (SRP) protocol.
  ///
  /// *    `REFRESH_TOKEN_AUTH`/`REFRESH_TOKEN`: Authentication flow for
  /// refreshing the access token and ID token by supplying a valid refresh
  /// token.
  ///
  /// *    `CUSTOM_AUTH`: Custom authentication flow.
  ///
  /// *    `USER_PASSWORD_AUTH`: Non-SRP authentication flow; USERNAME and
  /// PASSWORD are passed directly. If a user migration Lambda trigger is set,
  /// this flow will invoke the user migration Lambda if the USERNAME is not
  /// found in the user pool.
  ///
  ///
  ///  `ADMIN_NO_SRP_AUTH` is not a valid value.
  ///
  /// [authParameters]: The authentication parameters. These are inputs
  /// corresponding to the `AuthFlow` that you are invoking. The required values
  /// depend on the value of `AuthFlow`:
  ///
  /// *   For `USER_SRP_AUTH`: `USERNAME` (required), `SRP_A` (required),
  /// `SECRET_HASH` (required if the app client is configured with a client
  /// secret), `DEVICE_KEY`
  ///
  /// *   For `REFRESH_TOKEN_AUTH/REFRESH_TOKEN`: `REFRESH_TOKEN` (required),
  /// `SECRET_HASH` (required if the app client is configured with a client
  /// secret), `DEVICE_KEY`
  ///
  /// *   For `CUSTOM_AUTH`: `USERNAME` (required), `SECRET_HASH` (if app client
  /// is configured with client secret), `DEVICE_KEY`
  ///
  /// [clientMetadata]: This is a random key-value pair map which can contain
  /// any key and will be passed to your PreAuthentication Lambda trigger as-is.
  /// It can be used to implement additional validations around authentication.
  ///
  /// [clientId]: The app client ID.
  ///
  /// [analyticsMetadata]: The Amazon Pinpoint analytics metadata for collecting
  /// metrics for `InitiateAuth` calls.
  ///
  /// [userContextData]: Contextual data such as the user's device fingerprint,
  /// IP address, or location used for evaluating the risk of an unexpected
  /// event by Amazon Cognito advanced security.
  Future<InitiateAuthResponse> initiateAuth(
      {@required String authFlow,
      Map<String, String> authParameters,
      Map<String, String> clientMetadata,
      @required String clientId,
      AnalyticsMetadataType analyticsMetadata,
      UserContextDataType userContextData}) async {
    return InitiateAuthResponse.fromJson({});
  }

  /// Lists the devices.
  ///
  /// [accessToken]: The access tokens for the request to list devices.
  ///
  /// [limit]: The limit of the device request.
  ///
  /// [paginationToken]: The pagination token for the list request.
  Future<ListDevicesResponse> listDevices(String accessToken,
      {int limit, String paginationToken}) async {
    return ListDevicesResponse.fromJson({});
  }

  /// Lists the groups associated with a user pool.
  ///
  /// Requires developer credentials.
  ///
  /// [userPoolId]: The user pool ID for the user pool.
  ///
  /// [limit]: The limit of the request to list groups.
  ///
  /// [nextToken]: An identifier that was returned from the previous call to
  /// this operation, which can be used to return the next set of items in the
  /// list.
  Future<ListGroupsResponse> listGroups(String userPoolId,
      {int limit, String nextToken}) async {
    return ListGroupsResponse.fromJson({});
  }

  /// Lists information about all identity providers for a user pool.
  ///
  /// [userPoolId]: The user pool ID.
  ///
  /// [maxResults]: The maximum number of identity providers to return.
  ///
  /// [nextToken]: A pagination token.
  Future<ListIdentityProvidersResponse> listIdentityProviders(String userPoolId,
      {int maxResults, String nextToken}) async {
    return ListIdentityProvidersResponse.fromJson({});
  }

  /// Lists the resource servers for a user pool.
  ///
  /// [userPoolId]: The user pool ID for the user pool.
  ///
  /// [maxResults]: The maximum number of resource servers to return.
  ///
  /// [nextToken]: A pagination token.
  Future<ListResourceServersResponse> listResourceServers(String userPoolId,
      {int maxResults, String nextToken}) async {
    return ListResourceServersResponse.fromJson({});
  }

  /// Lists the tags that are assigned to an Amazon Cognito user pool.
  ///
  /// A tag is a label that you can apply to user pools to categorize and manage
  /// them in different ways, such as by purpose, owner, environment, or other
  /// criteria.
  ///
  /// You can use this action up to 10 times per second, per account.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the user pool that the
  /// tags are assigned to.
  Future<ListTagsForResourceResponse> listTagsForResource(
      String resourceArn) async {
    return ListTagsForResourceResponse.fromJson({});
  }

  /// Lists the user import jobs.
  ///
  /// [userPoolId]: The user pool ID for the user pool that the users are being
  /// imported into.
  ///
  /// [maxResults]: The maximum number of import jobs you want the request to
  /// return.
  ///
  /// [paginationToken]: An identifier that was returned from the previous call
  /// to `ListUserImportJobs`, which can be used to return the next set of
  /// import jobs in the list.
  Future<ListUserImportJobsResponse> listUserImportJobs(
      {@required String userPoolId,
      @required int maxResults,
      String paginationToken}) async {
    return ListUserImportJobsResponse.fromJson({});
  }

  /// Lists the clients that have been created for the specified user pool.
  ///
  /// [userPoolId]: The user pool ID for the user pool where you want to list
  /// user pool clients.
  ///
  /// [maxResults]: The maximum number of results you want the request to return
  /// when listing the user pool clients.
  ///
  /// [nextToken]: An identifier that was returned from the previous call to
  /// this operation, which can be used to return the next set of items in the
  /// list.
  Future<ListUserPoolClientsResponse> listUserPoolClients(String userPoolId,
      {int maxResults, String nextToken}) async {
    return ListUserPoolClientsResponse.fromJson({});
  }

  /// Lists the user pools associated with an AWS account.
  ///
  /// [nextToken]: An identifier that was returned from the previous call to
  /// this operation, which can be used to return the next set of items in the
  /// list.
  ///
  /// [maxResults]: The maximum number of results you want the request to return
  /// when listing the user pools.
  Future<ListUserPoolsResponse> listUserPools(int maxResults,
      {String nextToken}) async {
    return ListUserPoolsResponse.fromJson({});
  }

  /// Lists the users in the Amazon Cognito user pool.
  ///
  /// [userPoolId]: The user pool ID for the user pool on which the search
  /// should be performed.
  ///
  /// [attributesToGet]: An array of strings, where each string is the name of a
  /// user attribute to be returned for each user in the search results. If the
  /// array is null, all attributes are returned.
  ///
  /// [limit]: Maximum number of users to be returned.
  ///
  /// [paginationToken]: An identifier that was returned from the previous call
  /// to this operation, which can be used to return the next set of items in
  /// the list.
  ///
  /// [filter]: A filter string of the form "_AttributeName_ _Filter-Type_
  /// "_AttributeValue_"". Quotation marks within the filter string must be
  /// escaped using the backslash () character. For example, "`family_name` =
  /// "Reddy"".
  ///
  /// *    _AttributeName_: The name of the attribute to search for. You can
  /// only search for one attribute at a time.
  ///
  /// *    _Filter-Type_: For an exact match, use =, for example, "`given_name`
  /// = "Jon"". For a prefix ("starts with") match, use ^=, for example,
  /// "`given_name` ^= "Jon"".
  ///
  /// *    _AttributeValue_: The attribute value that must be matched for each
  /// user.
  ///
  ///
  /// If the filter string is empty, `ListUsers` returns all users in the user
  /// pool.
  ///
  /// You can only search for the following standard attributes:
  ///
  /// *    `username` (case-sensitive)
  ///
  /// *    `email`
  ///
  /// *    `phone_number`
  ///
  /// *    `name`
  ///
  /// *    `given_name`
  ///
  /// *    `family_name`
  ///
  /// *    `preferred_username`
  ///
  /// *    `cognito:user_status` (called **Status** in the Console)
  /// (case-insensitive)
  ///
  /// *    `status (called **Enabled** in the Console) (case-sensitive)`
  ///
  /// *    `sub`
  ///
  ///
  /// Custom attributes are not searchable.
  ///
  /// For more information, see
  /// [Searching for Users Using the ListUsers API](http://docs.aws.amazon.com/cognito/latest/developerguide/how-to-manage-user-accounts.html#cognito-user-pools-searching-for-users-using-listusers-api)
  /// and
  /// [Examples of Using the ListUsers API](http://docs.aws.amazon.com/cognito/latest/developerguide/how-to-manage-user-accounts.html#cognito-user-pools-searching-for-users-listusers-api-examples)
  /// in the _Amazon Cognito Developer Guide_.
  Future<ListUsersResponse> listUsers(String userPoolId,
      {List<String> attributesToGet,
      int limit,
      String paginationToken,
      String filter}) async {
    return ListUsersResponse.fromJson({});
  }

  /// Lists the users in the specified group.
  ///
  /// Requires developer credentials.
  ///
  /// [userPoolId]: The user pool ID for the user pool.
  ///
  /// [groupName]: The name of the group.
  ///
  /// [limit]: The limit of the request to list users.
  ///
  /// [nextToken]: An identifier that was returned from the previous call to
  /// this operation, which can be used to return the next set of items in the
  /// list.
  Future<ListUsersInGroupResponse> listUsersInGroup(
      {@required String userPoolId,
      @required String groupName,
      int limit,
      String nextToken}) async {
    return ListUsersInGroupResponse.fromJson({});
  }

  /// Resends the confirmation (for confirmation of registration) to a specific
  /// user in the user pool.
  ///
  /// [clientId]: The ID of the client associated with the user pool.
  ///
  /// [secretHash]: A keyed-hash message authentication code (HMAC) calculated
  /// using the secret key of a user pool client and username plus the client ID
  /// in the message.
  ///
  /// [userContextData]: Contextual data such as the user's device fingerprint,
  /// IP address, or location used for evaluating the risk of an unexpected
  /// event by Amazon Cognito advanced security.
  ///
  /// [username]: The user name of the user to whom you wish to resend a
  /// confirmation code.
  ///
  /// [analyticsMetadata]: The Amazon Pinpoint analytics metadata for collecting
  /// metrics for `ResendConfirmationCode` calls.
  Future<ResendConfirmationCodeResponse> resendConfirmationCode(
      {@required String clientId,
      String secretHash,
      UserContextDataType userContextData,
      @required String username,
      AnalyticsMetadataType analyticsMetadata}) async {
    return ResendConfirmationCodeResponse.fromJson({});
  }

  /// Responds to the authentication challenge.
  ///
  /// [clientId]: The app client ID.
  ///
  /// [challengeName]: The challenge name. For more information, see .
  ///
  ///  `ADMIN_NO_SRP_AUTH` is not a valid value.
  ///
  /// [session]: The session which should be passed both ways in
  /// challenge-response calls to the service. If `InitiateAuth` or
  /// `RespondToAuthChallenge` API call determines that the caller needs to go
  /// through another challenge, they return a session with other challenge
  /// parameters. This session should be passed as it is to the next
  /// `RespondToAuthChallenge` API call.
  ///
  /// [challengeResponses]: The challenge responses. These are inputs
  /// corresponding to the value of `ChallengeName`, for example:
  ///
  /// *    `SMS_MFA`: `SMS_MFA_CODE`, `USERNAME`, `SECRET_HASH` (if app client
  /// is configured with client secret).
  ///
  /// *    `PASSWORD_VERIFIER`: `PASSWORD_CLAIM_SIGNATURE`,
  /// `PASSWORD_CLAIM_SECRET_BLOCK`, `TIMESTAMP`, `USERNAME`, `SECRET_HASH` (if
  /// app client is configured with client secret).
  ///
  /// *    `NEW_PASSWORD_REQUIRED`: `NEW_PASSWORD`, any other required
  /// attributes, `USERNAME`, `SECRET_HASH` (if app client is configured with
  /// client secret).
  ///
  /// [analyticsMetadata]: The Amazon Pinpoint analytics metadata for collecting
  /// metrics for `RespondToAuthChallenge` calls.
  ///
  /// [userContextData]: Contextual data such as the user's device fingerprint,
  /// IP address, or location used for evaluating the risk of an unexpected
  /// event by Amazon Cognito advanced security.
  Future<RespondToAuthChallengeResponse> respondToAuthChallenge(
      {@required String clientId,
      @required String challengeName,
      String session,
      Map<String, String> challengeResponses,
      AnalyticsMetadataType analyticsMetadata,
      UserContextDataType userContextData}) async {
    return RespondToAuthChallengeResponse.fromJson({});
  }

  /// Configures actions on detected risks. To delete the risk configuration for
  /// `UserPoolId` or `ClientId`, pass null values for all four configuration
  /// types.
  ///
  /// To enable Amazon Cognito advanced security features, update the user pool
  /// to include the `UserPoolAddOns` key`AdvancedSecurityMode`.
  ///
  /// See .
  ///
  /// [userPoolId]: The user pool ID.
  ///
  /// [clientId]: The app client ID. If `ClientId` is null, then the risk
  /// configuration is mapped to `userPoolId`. When the client ID is null, the
  /// same risk configuration is applied to all the clients in the userPool.
  ///
  /// Otherwise, `ClientId` is mapped to the client. When the client ID is not
  /// null, the user pool configuration is overridden and the risk configuration
  /// for the client is used instead.
  ///
  /// [compromisedCredentialsRiskConfiguration]: The compromised credentials
  /// risk configuration.
  ///
  /// [accountTakeoverRiskConfiguration]: The account takeover risk
  /// configuration.
  ///
  /// [riskExceptionConfiguration]: The configuration to override the risk
  /// decision.
  Future<SetRiskConfigurationResponse> setRiskConfiguration(String userPoolId,
      {String clientId,
      CompromisedCredentialsRiskConfigurationType
          compromisedCredentialsRiskConfiguration,
      AccountTakeoverRiskConfigurationType accountTakeoverRiskConfiguration,
      RiskExceptionConfigurationType riskExceptionConfiguration}) async {
    return SetRiskConfigurationResponse.fromJson({});
  }

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
  ///
  /// [userPoolId]: The user pool ID for the user pool.
  ///
  /// [clientId]: The client ID for the client app.
  ///
  /// [css]: The CSS values in the UI customization.
  ///
  /// [imageFile]: The uploaded logo image for the UI customization.
  Future<SetUICustomizationResponse> setUICustomization(String userPoolId,
      {String clientId, String css, Uint8List imageFile}) async {
    return SetUICustomizationResponse.fromJson({});
  }

  /// Set the user's multi-factor authentication (MFA) method preference.
  ///
  /// [smsMfaSettings]: The SMS text message multi-factor authentication (MFA)
  /// settings.
  ///
  /// [softwareTokenMfaSettings]: The time-based one-time password software
  /// token MFA settings.
  ///
  /// [accessToken]: The access token.
  Future<SetUserMfaPreferenceResponse> setUserMfaPreference(String accessToken,
      {SmsMfaSettingsType smsMfaSettings,
      SoftwareTokenMfaSettingsType softwareTokenMfaSettings}) async {
    return SetUserMfaPreferenceResponse.fromJson({});
  }

  /// Set the user pool MFA configuration.
  ///
  /// [userPoolId]: The user pool ID.
  ///
  /// [smsMfaConfiguration]: The SMS text message MFA configuration.
  ///
  /// [softwareTokenMfaConfiguration]: The software token MFA configuration.
  ///
  /// [mfaConfiguration]: The MFA configuration.
  Future<SetUserPoolMfaConfigResponse> setUserPoolMfaConfig(String userPoolId,
      {SmsMfaConfigType smsMfaConfiguration,
      SoftwareTokenMfaConfigType softwareTokenMfaConfiguration,
      String mfaConfiguration}) async {
    return SetUserPoolMfaConfigResponse.fromJson({});
  }

  /// Sets the user settings like multi-factor authentication (MFA). If MFA is
  /// to be removed for a particular attribute pass the attribute with code
  /// delivery as null. If null list is passed, all MFA options are removed.
  ///
  /// [accessToken]: The access token for the set user settings request.
  ///
  /// [mfaOptions]: Specifies the options for MFA (e.g., email or phone number).
  Future<SetUserSettingsResponse> setUserSettings(
      {@required String accessToken,
      @required List<MfaOptionType> mfaOptions}) async {
    return SetUserSettingsResponse.fromJson({});
  }

  /// Registers the user in the specified user pool and creates a user name,
  /// password, and user attributes.
  ///
  /// [clientId]: The ID of the client associated with the user pool.
  ///
  /// [secretHash]: A keyed-hash message authentication code (HMAC) calculated
  /// using the secret key of a user pool client and username plus the client ID
  /// in the message.
  ///
  /// [username]: The user name of the user you wish to register.
  ///
  /// [password]: The password of the user you wish to register.
  ///
  /// [userAttributes]: An array of name-value pairs representing user
  /// attributes.
  ///
  /// For custom attributes, you must prepend the `custom:` prefix to the
  /// attribute name.
  ///
  /// [validationData]: The validation data in the request to register a user.
  ///
  /// [analyticsMetadata]: The Amazon Pinpoint analytics metadata for collecting
  /// metrics for `SignUp` calls.
  ///
  /// [userContextData]: Contextual data such as the user's device fingerprint,
  /// IP address, or location used for evaluating the risk of an unexpected
  /// event by Amazon Cognito advanced security.
  Future<SignUpResponse> signUp(
      {@required String clientId,
      String secretHash,
      @required String username,
      @required String password,
      List<AttributeType> userAttributes,
      List<AttributeType> validationData,
      AnalyticsMetadataType analyticsMetadata,
      UserContextDataType userContextData}) async {
    return SignUpResponse.fromJson({});
  }

  /// Starts the user import.
  ///
  /// [userPoolId]: The user pool ID for the user pool that the users are being
  /// imported into.
  ///
  /// [jobId]: The job ID for the user import job.
  Future<StartUserImportJobResponse> startUserImportJob(
      {@required String userPoolId, @required String jobId}) async {
    return StartUserImportJobResponse.fromJson({});
  }

  /// Stops the user import job.
  ///
  /// [userPoolId]: The user pool ID for the user pool that the users are being
  /// imported into.
  ///
  /// [jobId]: The job ID for the user import job.
  Future<StopUserImportJobResponse> stopUserImportJob(
      {@required String userPoolId, @required String jobId}) async {
    return StopUserImportJobResponse.fromJson({});
  }

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
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the user pool to assign
  /// the tags to.
  ///
  /// [tags]: The tags to assign to the user pool.
  Future<TagResourceResponse> tagResource(String resourceArn,
      {Map<String, String> tags}) async {
    return TagResourceResponse.fromJson({});
  }

  /// Removes the specified tags from an Amazon Cognito user pool. You can use
  /// this action up to 5 times per second, per account
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the user pool that the
  /// tags are assigned to.
  ///
  /// [tagKeys]: The keys of the tags to remove from the user pool.
  Future<UntagResourceResponse> untagResource(String resourceArn,
      {List<String> tagKeys}) async {
    return UntagResourceResponse.fromJson({});
  }

  /// Provides the feedback for an authentication event whether it was from a
  /// valid user or not. This feedback is used for improving the risk evaluation
  /// decision for the user pool as part of Amazon Cognito advanced security.
  ///
  /// [userPoolId]: The user pool ID.
  ///
  /// [username]: The user pool username.
  ///
  /// [eventId]: The event ID.
  ///
  /// [feedbackToken]: The feedback token.
  ///
  /// [feedbackValue]: The authentication event feedback value.
  Future<UpdateAuthEventFeedbackResponse> updateAuthEventFeedback(
      {@required String userPoolId,
      @required String username,
      @required String eventId,
      @required String feedbackToken,
      @required String feedbackValue}) async {
    return UpdateAuthEventFeedbackResponse.fromJson({});
  }

  /// Updates the device status.
  ///
  /// [accessToken]: The access token.
  ///
  /// [deviceKey]: The device key.
  ///
  /// [deviceRememberedStatus]: The status of whether a device is remembered.
  Future<UpdateDeviceStatusResponse> updateDeviceStatus(
      {@required String accessToken,
      @required String deviceKey,
      String deviceRememberedStatus}) async {
    return UpdateDeviceStatusResponse.fromJson({});
  }

  /// Updates the specified group with the specified attributes.
  ///
  /// Requires developer credentials.
  ///
  /// [groupName]: The name of the group.
  ///
  /// [userPoolId]: The user pool ID for the user pool.
  ///
  /// [description]: A string containing the new description of the group.
  ///
  /// [roleArn]: The new role ARN for the group. This is used for setting the
  /// `cognito:roles` and `cognito:preferred_role` claims in the token.
  ///
  /// [precedence]: The new precedence value for the group. For more information
  /// about this parameter, see .
  Future<UpdateGroupResponse> updateGroup(
      {@required String groupName,
      @required String userPoolId,
      String description,
      String roleArn,
      int precedence}) async {
    return UpdateGroupResponse.fromJson({});
  }

  /// Updates identity provider information for a user pool.
  ///
  /// [userPoolId]: The user pool ID.
  ///
  /// [providerName]: The identity provider name.
  ///
  /// [providerDetails]: The identity provider details to be updated, such as
  /// `MetadataURL` and `MetadataFile`.
  ///
  /// [attributeMapping]: The identity provider attribute mapping to be changed.
  ///
  /// [idpIdentifiers]: A list of identity provider identifiers.
  Future<UpdateIdentityProviderResponse> updateIdentityProvider(
      {@required String userPoolId,
      @required String providerName,
      Map<String, String> providerDetails,
      Map<String, String> attributeMapping,
      List<String> idpIdentifiers}) async {
    return UpdateIdentityProviderResponse.fromJson({});
  }

  /// Updates the name and scopes of resource server. All other fields are
  /// read-only.
  ///
  /// [userPoolId]: The user pool ID for the user pool.
  ///
  /// [identifier]: The identifier for the resource server.
  ///
  /// [name]: The name of the resource server.
  ///
  /// [scopes]: The scope values to be set for the resource server.
  Future<UpdateResourceServerResponse> updateResourceServer(
      {@required String userPoolId,
      @required String identifier,
      @required String name,
      List<ResourceServerScopeType> scopes}) async {
    return UpdateResourceServerResponse.fromJson({});
  }

  /// Allows a user to update a specific attribute (one at a time).
  ///
  /// [userAttributes]: An array of name-value pairs representing user
  /// attributes.
  ///
  /// For custom attributes, you must prepend the `custom:` prefix to the
  /// attribute name.
  ///
  /// [accessToken]: The access token for the request to update user attributes.
  Future<UpdateUserAttributesResponse> updateUserAttributes(
      {@required List<AttributeType> userAttributes,
      @required String accessToken}) async {
    return UpdateUserAttributesResponse.fromJson({});
  }

  /// Updates the specified user pool with the specified attributes. If you
  /// don't provide a value for an attribute, it will be set to the default
  /// value. You can get a list of the current user pool settings with .
  ///
  /// [userPoolId]: The user pool ID for the user pool you want to update.
  ///
  /// [policies]: A container with the policies you wish to update in a user
  /// pool.
  ///
  /// [lambdaConfig]: The AWS Lambda configuration information from the request
  /// to update the user pool.
  ///
  /// [autoVerifiedAttributes]: The attributes that are automatically verified
  /// when the Amazon Cognito service makes a request to update user pools.
  ///
  /// [smsVerificationMessage]: A container with information about the SMS
  /// verification message.
  ///
  /// [emailVerificationMessage]: The contents of the email verification
  /// message.
  ///
  /// [emailVerificationSubject]: The subject of the email verification message.
  ///
  /// [verificationMessageTemplate]: The template for verification messages.
  ///
  /// [smsAuthenticationMessage]: The contents of the SMS authentication
  /// message.
  ///
  /// [mfaConfiguration]: Can be one of the following values:
  ///
  /// *    `OFF` - MFA tokens are not required and cannot be specified during
  /// user registration.
  ///
  /// *    `ON` - MFA tokens are required for all user registrations. You can
  /// only specify required when you are initially creating a user pool.
  ///
  /// *    `OPTIONAL` - Users have the option when registering to create an MFA
  /// token.
  ///
  /// [deviceConfiguration]: Device configuration.
  ///
  /// [emailConfiguration]: Email configuration.
  ///
  /// [smsConfiguration]: SMS configuration.
  ///
  /// [userPoolTags]: The tag keys and values to assign to the user pool. A tag
  /// is a label that you can use to categorize and manage user pools in
  /// different ways, such as by purpose, owner, environment, or other criteria.
  ///
  /// [adminCreateUserConfig]: The configuration for `AdminCreateUser` requests.
  ///
  /// [userPoolAddOns]: Used to enable advanced security risk detection. Set the
  /// key `AdvancedSecurityMode` to the value "AUDIT".
  Future<UpdateUserPoolResponse> updateUserPool(String userPoolId,
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
      UserPoolAddOnsType userPoolAddOns}) async {
    return UpdateUserPoolResponse.fromJson({});
  }

  /// Updates the specified user pool app client with the specified attributes.
  /// If you don't provide a value for an attribute, it will be set to the
  /// default value. You can get a list of the current user pool app client
  /// settings with .
  ///
  /// [userPoolId]: The user pool ID for the user pool where you want to update
  /// the user pool client.
  ///
  /// [clientId]: The ID of the client associated with the user pool.
  ///
  /// [clientName]: The client name from the update user pool client request.
  ///
  /// [refreshTokenValidity]: The time limit, in days, after which the refresh
  /// token is no longer valid and cannot be used.
  ///
  /// [readAttributes]: The read-only attributes of the user pool.
  ///
  /// [writeAttributes]: The writeable attributes of the user pool.
  ///
  /// [explicitAuthFlows]: Explicit authentication flows.
  ///
  /// [supportedIdentityProviders]: A list of provider names for the identity
  /// providers that are supported on this client.
  ///
  /// [callbackURLs]: A list of allowed redirect (callback) URLs for the
  /// identity providers.
  ///
  /// A redirect URI must:
  ///
  /// *   Be an absolute URI.
  ///
  /// *   Be registered with the authorization server.
  ///
  /// *   Not include a fragment component.
  ///
  ///
  /// See
  /// [OAuth 2.0 - Redirection Endpoint](https://tools.ietf.org/html/rfc6749#section-3.1.2).
  ///
  /// Amazon Cognito requires HTTPS over HTTP except for http://localhost for
  /// testing purposes only.
  ///
  /// App callback URLs such as myapp://example are also supported.
  ///
  /// [logoutURLs]: A list of allowed logout URLs for the identity providers.
  ///
  /// [defaultRedirectUri]: The default redirect URI. Must be in the
  /// `CallbackURLs` list.
  ///
  /// A redirect URI must:
  ///
  /// *   Be an absolute URI.
  ///
  /// *   Be registered with the authorization server.
  ///
  /// *   Not include a fragment component.
  ///
  ///
  /// See
  /// [OAuth 2.0 - Redirection Endpoint](https://tools.ietf.org/html/rfc6749#section-3.1.2).
  ///
  /// Amazon Cognito requires HTTPS over HTTP except for http://localhost for
  /// testing purposes only.
  ///
  /// App callback URLs such as myapp://example are also supported.
  ///
  /// [allowedoAuthFlows]: Set to `code` to initiate a code grant flow, which
  /// provides an authorization code as the response. This code can be exchanged
  /// for access tokens with the token endpoint.
  ///
  /// [allowedoAuthScopes]: A list of allowed `OAuth` scopes. Currently
  /// supported values are `"phone"`, `"email"`, `"openid"`, and `"Cognito"`.
  ///
  /// [allowedoAuthFlowsUserPoolClient]: Set to TRUE if the client is allowed to
  /// follow the OAuth protocol when interacting with Cognito user pools.
  ///
  /// [analyticsConfiguration]: The Amazon Pinpoint analytics configuration for
  /// collecting metrics for this user pool.
  Future<UpdateUserPoolClientResponse> updateUserPoolClient(
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
      AnalyticsConfigurationType analyticsConfiguration}) async {
    return UpdateUserPoolClientResponse.fromJson({});
  }

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
  /// [Using Your Own Domain for the Hosted UI](https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-add-custom-domain.html).
  ///
  /// [domain]: The domain name for the custom domain that hosts the sign-up and
  /// sign-in pages for your application. For example: `auth.example.com`.
  ///
  /// This string can include only lowercase letters, numbers, and hyphens. Do
  /// not use a hyphen for the first or last character. Use periods to separate
  /// subdomain names.
  ///
  /// [userPoolId]: The ID of the user pool that is associated with the custom
  /// domain that you are updating the certificate for.
  ///
  /// [customDomainConfig]: The configuration for a custom domain that hosts the
  /// sign-up and sign-in pages for your application. Use this object to specify
  /// an SSL certificate that is managed by ACM.
  Future<UpdateUserPoolDomainResponse> updateUserPoolDomain(
      {@required String domain,
      @required String userPoolId,
      @required CustomDomainConfigType customDomainConfig}) async {
    return UpdateUserPoolDomainResponse.fromJson({});
  }

  /// Use this API to register a user's entered TOTP code and mark the user's
  /// software token MFA status as "verified" if successful. The request takes
  /// an access token or a session string, but not both.
  ///
  /// [accessToken]: The access token.
  ///
  /// [session]: The session which should be passed both ways in
  /// challenge-response calls to the service.
  ///
  /// [userCode]: The one time password computed using the secret code returned
  /// by
  ///
  /// [friendlyDeviceName]: The friendly device name.
  Future<VerifySoftwareTokenResponse> verifySoftwareToken(String userCode,
      {String accessToken, String session, String friendlyDeviceName}) async {
    return VerifySoftwareTokenResponse.fromJson({});
  }

  /// Verifies the specified user attributes in the user pool.
  ///
  /// [accessToken]: Represents the access token of the request to verify user
  /// attributes.
  ///
  /// [attributeName]: The attribute name in the request to verify user
  /// attributes.
  ///
  /// [code]: The verification code in the request to verify user attributes.
  Future<VerifyUserAttributeResponse> verifyUserAttribute(
      {@required String accessToken,
      @required String attributeName,
      @required String code}) async {
    return VerifyUserAttributeResponse.fromJson({});
  }
}

/// Account takeover action type.
class AccountTakeoverActionType {
  /// Flag specifying whether to send a notification.
  final bool notify;

  /// The event action.
  ///
  /// *    `BLOCK` Choosing this action will block the request.
  ///
  /// *    `MFA_IF_CONFIGURED` Throw MFA challenge if user has configured it,
  /// else allow the request.
  ///
  /// *    `MFA_REQUIRED` Throw MFA challenge if user has configured it, else
  /// block the request.
  ///
  /// *    `NO_ACTION` Allow the user sign-in.
  final String eventAction;

  AccountTakeoverActionType({
    @required this.notify,
    @required this.eventAction,
  });
  static AccountTakeoverActionType fromJson(Map<String, dynamic> json) =>
      AccountTakeoverActionType();
}

/// Account takeover actions type.
class AccountTakeoverActionsType {
  /// Action to take for a low risk.
  final AccountTakeoverActionType lowAction;

  /// Action to take for a medium risk.
  final AccountTakeoverActionType mediumAction;

  /// Action to take for a high risk.
  final AccountTakeoverActionType highAction;

  AccountTakeoverActionsType({
    this.lowAction,
    this.mediumAction,
    this.highAction,
  });
  static AccountTakeoverActionsType fromJson(Map<String, dynamic> json) =>
      AccountTakeoverActionsType();
}

/// Configuration for mitigation actions and notification for different levels
/// of risk detected for a potential account takeover.
class AccountTakeoverRiskConfigurationType {
  /// The notify configuration used to construct email notifications.
  final NotifyConfigurationType notifyConfiguration;

  /// Account takeover risk configuration actions
  final AccountTakeoverActionsType actions;

  AccountTakeoverRiskConfigurationType({
    this.notifyConfiguration,
    @required this.actions,
  });
  static AccountTakeoverRiskConfigurationType fromJson(
          Map<String, dynamic> json) =>
      AccountTakeoverRiskConfigurationType();
}

/// Represents the response from the server for the request to add custom
/// attributes.
class AddCustomAttributesResponse {
  AddCustomAttributesResponse();
  static AddCustomAttributesResponse fromJson(Map<String, dynamic> json) =>
      AddCustomAttributesResponse();
}

/// Represents the response from the server for the request to confirm
/// registration.
class AdminConfirmSignUpResponse {
  AdminConfirmSignUpResponse();
  static AdminConfirmSignUpResponse fromJson(Map<String, dynamic> json) =>
      AdminConfirmSignUpResponse();
}

/// The configuration for creating a new user profile.
class AdminCreateUserConfigType {
  /// Set to `True` if only the administrator is allowed to create user
  /// profiles. Set to `False` if users can sign themselves up via an app.
  final bool allowAdminCreateUserOnly;

  /// The user account expiration limit, in days, after which the account is no
  /// longer usable. To reset the account after that time limit, you must call
  /// `AdminCreateUser` again, specifying `"RESEND"` for the `MessageAction`
  /// parameter. The default value for this parameter is 7.
  ///
  ///
  ///
  /// If you set a value for `TemporaryPasswordValidityDays` in
  /// `PasswordPolicy`, that value will be used and `UnusedAccountValidityDays`
  /// will be deprecated for that user pool.
  final int unusedAccountValidityDays;

  /// The message template to be used for the welcome message to new users.
  ///
  /// See also
  /// [Customizing User Invitation Messages](http://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pool-settings-message-customizations.html#cognito-user-pool-settings-user-invitation-message-customization).
  final MessageTemplateType inviteMessageTemplate;

  AdminCreateUserConfigType({
    this.allowAdminCreateUserOnly,
    this.unusedAccountValidityDays,
    this.inviteMessageTemplate,
  });
  static AdminCreateUserConfigType fromJson(Map<String, dynamic> json) =>
      AdminCreateUserConfigType();
}

/// Represents the response from the server to the request to create the user.
class AdminCreateUserResponse {
  /// The newly created user.
  final UserType user;

  AdminCreateUserResponse({
    this.user,
  });
  static AdminCreateUserResponse fromJson(Map<String, dynamic> json) =>
      AdminCreateUserResponse();
}

/// Represents the response received from the server for a request to delete
/// user attributes.
class AdminDeleteUserAttributesResponse {
  AdminDeleteUserAttributesResponse();
  static AdminDeleteUserAttributesResponse fromJson(
          Map<String, dynamic> json) =>
      AdminDeleteUserAttributesResponse();
}

class AdminDisableProviderForUserResponse {
  AdminDisableProviderForUserResponse();
  static AdminDisableProviderForUserResponse fromJson(
          Map<String, dynamic> json) =>
      AdminDisableProviderForUserResponse();
}

/// Represents the response received from the server to disable the user as an
/// administrator.
class AdminDisableUserResponse {
  AdminDisableUserResponse();
  static AdminDisableUserResponse fromJson(Map<String, dynamic> json) =>
      AdminDisableUserResponse();
}

/// Represents the response from the server for the request to enable a user as
/// an administrator.
class AdminEnableUserResponse {
  AdminEnableUserResponse();
  static AdminEnableUserResponse fromJson(Map<String, dynamic> json) =>
      AdminEnableUserResponse();
}

/// Gets the device response, as an administrator.
class AdminGetDeviceResponse {
  /// The device.
  final DeviceType device;

  AdminGetDeviceResponse({
    @required this.device,
  });
  static AdminGetDeviceResponse fromJson(Map<String, dynamic> json) =>
      AdminGetDeviceResponse();
}

/// Represents the response from the server from the request to get the
/// specified user as an administrator.
class AdminGetUserResponse {
  /// The user name of the user about whom you are receiving information.
  final String username;

  /// An array of name-value pairs representing user attributes.
  final List<AttributeType> userAttributes;

  /// The date the user was created.
  final DateTime userCreateDate;

  /// The date the user was last modified.
  final DateTime userLastModifiedDate;

  /// Indicates that the status is enabled.
  final bool enabled;

  /// The user status. Can be one of the following:
  ///
  /// *   UNCONFIRMED - User has been created but not confirmed.
  ///
  /// *   CONFIRMED - User has been confirmed.
  ///
  /// *   ARCHIVED - User is no longer active.
  ///
  /// *   COMPROMISED - User is disabled due to a potential security threat.
  ///
  /// *   UNKNOWN - User status is not known.
  ///
  /// *   RESET_REQUIRED - User is confirmed, but the user must request a code
  /// and reset his or her password before he or she can sign in.
  ///
  /// *   FORCE_CHANGE_PASSWORD - The user is confirmed and the user can sign in
  /// using a temporary password, but on first sign-in, the user must change his
  /// or her password to a new value before doing anything else.
  final String userStatus;

  /// Specifies the options for MFA (e.g., email or phone number).
  final List<MfaOptionType> mfaOptions;

  /// The user's preferred MFA setting.
  final String preferredMfaSetting;

  /// The list of the user's MFA settings.
  final List<String> userMfaSettingList;

  AdminGetUserResponse({
    @required this.username,
    this.userAttributes,
    this.userCreateDate,
    this.userLastModifiedDate,
    this.enabled,
    this.userStatus,
    this.mfaOptions,
    this.preferredMfaSetting,
    this.userMfaSettingList,
  });
  static AdminGetUserResponse fromJson(Map<String, dynamic> json) =>
      AdminGetUserResponse();
}

/// Initiates the authentication response, as an administrator.
class AdminInitiateAuthResponse {
  /// The name of the challenge which you are responding to with this call. This
  /// is returned to you in the `AdminInitiateAuth` response if you need to pass
  /// another challenge.
  ///
  /// *    `MFA_SETUP`: If MFA is required, users who do not have at least one
  /// of the MFA methods set up are presented with an `MFA_SETUP` challenge. The
  /// user must set up at least one MFA type to continue to authenticate.
  ///
  /// *    `SELECT_MFA_TYPE`: Selects the MFA type. Valid MFA options are
  /// `SMS_MFA` for text SMS MFA, and `SOFTWARE_TOKEN_MFA` for TOTP software
  /// token MFA.
  ///
  /// *    `SMS_MFA`: Next challenge is to supply an `SMS_MFA_CODE`, delivered
  /// via SMS.
  ///
  /// *    `PASSWORD_VERIFIER`: Next challenge is to supply
  /// `PASSWORD_CLAIM_SIGNATURE`, `PASSWORD_CLAIM_SECRET_BLOCK`, and `TIMESTAMP`
  /// after the client-side SRP calculations.
  ///
  /// *    `CUSTOM_CHALLENGE`: This is returned if your custom authentication
  /// flow determines that the user should pass another challenge before tokens
  /// are issued.
  ///
  /// *    `DEVICE_SRP_AUTH`: If device tracking was enabled on your user pool
  /// and the previous challenges were passed, this challenge is returned so
  /// that Amazon Cognito can start tracking this device.
  ///
  /// *    `DEVICE_PASSWORD_VERIFIER`: Similar to `PASSWORD_VERIFIER`, but for
  /// devices only.
  ///
  /// *    `ADMIN_NO_SRP_AUTH`: This is returned if you need to authenticate
  /// with `USERNAME` and `PASSWORD` directly. An app client must be enabled to
  /// use this flow.
  ///
  /// *    `NEW_PASSWORD_REQUIRED`: For users which are required to change their
  /// passwords after successful first login. This challenge should be passed
  /// with `NEW_PASSWORD` and any other required attributes.
  final String challengeName;

  /// The session which should be passed both ways in challenge-response calls
  /// to the service. If `AdminInitiateAuth` or `AdminRespondToAuthChallenge`
  /// API call determines that the caller needs to go through another challenge,
  /// they return a session with other challenge parameters. This session should
  /// be passed as it is to the next `AdminRespondToAuthChallenge` API call.
  final String session;

  /// The challenge parameters. These are returned to you in the
  /// `AdminInitiateAuth` response if you need to pass another challenge. The
  /// responses in this parameter should be used to compute inputs to the next
  /// call (`AdminRespondToAuthChallenge`).
  ///
  /// All challenges require `USERNAME` and `SECRET_HASH` (if applicable).
  ///
  /// The value of the `USER_ID_FOR_SRP` attribute will be the user's actual
  /// username, not an alias (such as email address or phone number), even if
  /// you specified an alias in your call to `AdminInitiateAuth`. This is
  /// because, in the `AdminRespondToAuthChallenge` API `ChallengeResponses`,
  /// the `USERNAME` attribute cannot be an alias.
  final Map<String, String> challengeParameters;

  /// The result of the authentication response. This is only returned if the
  /// caller does not need to pass another challenge. If the caller does need to
  /// pass another challenge before it gets tokens, `ChallengeName`,
  /// `ChallengeParameters`, and `Session` are returned.
  final AuthenticationResultType authenticationResult;

  AdminInitiateAuthResponse({
    this.challengeName,
    this.session,
    this.challengeParameters,
    this.authenticationResult,
  });
  static AdminInitiateAuthResponse fromJson(Map<String, dynamic> json) =>
      AdminInitiateAuthResponse();
}

class AdminLinkProviderForUserResponse {
  AdminLinkProviderForUserResponse();
  static AdminLinkProviderForUserResponse fromJson(Map<String, dynamic> json) =>
      AdminLinkProviderForUserResponse();
}

/// Lists the device's response, as an administrator.
class AdminListDevicesResponse {
  /// The devices in the list of devices response.
  final List<DeviceType> devices;

  /// The pagination token.
  final String paginationToken;

  AdminListDevicesResponse({
    this.devices,
    this.paginationToken,
  });
  static AdminListDevicesResponse fromJson(Map<String, dynamic> json) =>
      AdminListDevicesResponse();
}

class AdminListGroupsForUserResponse {
  /// The groups that the user belongs to.
  final List<GroupType> groups;

  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  final String nextToken;

  AdminListGroupsForUserResponse({
    this.groups,
    this.nextToken,
  });
  static AdminListGroupsForUserResponse fromJson(Map<String, dynamic> json) =>
      AdminListGroupsForUserResponse();
}

class AdminListUserAuthEventsResponse {
  /// The response object. It includes the `EventID`, `EventType`,
  /// `CreationDate`, `EventRisk`, and `EventResponse`.
  final List<AuthEventType> authEvents;

  /// A pagination token.
  final String nextToken;

  AdminListUserAuthEventsResponse({
    this.authEvents,
    this.nextToken,
  });
  static AdminListUserAuthEventsResponse fromJson(Map<String, dynamic> json) =>
      AdminListUserAuthEventsResponse();
}

/// Represents the response from the server to reset a user password as an
/// administrator.
class AdminResetUserPasswordResponse {
  AdminResetUserPasswordResponse();
  static AdminResetUserPasswordResponse fromJson(Map<String, dynamic> json) =>
      AdminResetUserPasswordResponse();
}

/// Responds to the authentication challenge, as an administrator.
class AdminRespondToAuthChallengeResponse {
  /// The name of the challenge. For more information, see .
  final String challengeName;

  /// The session which should be passed both ways in challenge-response calls
  /// to the service. If the or API call determines that the caller needs to go
  /// through another challenge, they return a session with other challenge
  /// parameters. This session should be passed as it is to the next
  /// `RespondToAuthChallenge` API call.
  final String session;

  /// The challenge parameters. For more information, see .
  final Map<String, String> challengeParameters;

  /// The result returned by the server in response to the authentication
  /// request.
  final AuthenticationResultType authenticationResult;

  AdminRespondToAuthChallengeResponse({
    this.challengeName,
    this.session,
    this.challengeParameters,
    this.authenticationResult,
  });
  static AdminRespondToAuthChallengeResponse fromJson(
          Map<String, dynamic> json) =>
      AdminRespondToAuthChallengeResponse();
}

class AdminSetUserMfaPreferenceResponse {
  AdminSetUserMfaPreferenceResponse();
  static AdminSetUserMfaPreferenceResponse fromJson(
          Map<String, dynamic> json) =>
      AdminSetUserMfaPreferenceResponse();
}

class AdminSetUserPasswordResponse {
  AdminSetUserPasswordResponse();
  static AdminSetUserPasswordResponse fromJson(Map<String, dynamic> json) =>
      AdminSetUserPasswordResponse();
}

/// Represents the response from the server to set user settings as an
/// administrator.
class AdminSetUserSettingsResponse {
  AdminSetUserSettingsResponse();
  static AdminSetUserSettingsResponse fromJson(Map<String, dynamic> json) =>
      AdminSetUserSettingsResponse();
}

class AdminUpdateAuthEventFeedbackResponse {
  AdminUpdateAuthEventFeedbackResponse();
  static AdminUpdateAuthEventFeedbackResponse fromJson(
          Map<String, dynamic> json) =>
      AdminUpdateAuthEventFeedbackResponse();
}

/// The status response from the request to update the device, as an
/// administrator.
class AdminUpdateDeviceStatusResponse {
  AdminUpdateDeviceStatusResponse();
  static AdminUpdateDeviceStatusResponse fromJson(Map<String, dynamic> json) =>
      AdminUpdateDeviceStatusResponse();
}

/// Represents the response from the server for the request to update user
/// attributes as an administrator.
class AdminUpdateUserAttributesResponse {
  AdminUpdateUserAttributesResponse();
  static AdminUpdateUserAttributesResponse fromJson(
          Map<String, dynamic> json) =>
      AdminUpdateUserAttributesResponse();
}

/// The global sign-out response, as an administrator.
class AdminUserGlobalSignOutResponse {
  AdminUserGlobalSignOutResponse();
  static AdminUserGlobalSignOutResponse fromJson(Map<String, dynamic> json) =>
      AdminUserGlobalSignOutResponse();
}

/// The Amazon Pinpoint analytics configuration for collecting metrics for a
/// user pool.
class AnalyticsConfigurationType {
  /// The application ID for an Amazon Pinpoint application.
  final String applicationId;

  /// The ARN of an IAM role that authorizes Amazon Cognito to publish events to
  /// Amazon Pinpoint analytics.
  final String roleArn;

  /// The external ID.
  final String externalId;

  /// If `UserDataShared` is `true`, Amazon Cognito will include user data in
  /// the events it publishes to Amazon Pinpoint analytics.
  final bool userDataShared;

  AnalyticsConfigurationType({
    @required this.applicationId,
    @required this.roleArn,
    @required this.externalId,
    this.userDataShared,
  });
  static AnalyticsConfigurationType fromJson(Map<String, dynamic> json) =>
      AnalyticsConfigurationType();
}

/// An Amazon Pinpoint analytics endpoint.
///
/// An endpoint uniquely identifies a mobile device, email address, or phone
/// number that can receive messages from Amazon Pinpoint analytics.
class AnalyticsMetadataType {
  /// The endpoint ID.
  final String analyticsEndpointId;

  AnalyticsMetadataType({
    this.analyticsEndpointId,
  });
}

class AssociateSoftwareTokenResponse {
  /// A unique generated shared secret code that is used in the TOTP algorithm
  /// to generate a one time code.
  final String secretCode;

  /// The session which should be passed both ways in challenge-response calls
  /// to the service. This allows authentication of the user as part of the MFA
  /// setup process.
  final String session;

  AssociateSoftwareTokenResponse({
    this.secretCode,
    this.session,
  });
  static AssociateSoftwareTokenResponse fromJson(Map<String, dynamic> json) =>
      AssociateSoftwareTokenResponse();
}

/// Specifies whether the attribute is standard or custom.
class AttributeType {
  /// The name of the attribute.
  final String name;

  /// The value of the attribute.
  final String value;

  AttributeType({
    @required this.name,
    this.value,
  });
  static AttributeType fromJson(Map<String, dynamic> json) => AttributeType();
}

/// The authentication event type.
class AuthEventType {
  /// The event ID.
  final String eventId;

  /// The event type.
  final String eventType;

  /// The creation date
  final DateTime creationDate;

  /// The event response.
  final String eventResponse;

  /// The event risk.
  final EventRiskType eventRisk;

  /// The challenge responses.
  final List<ChallengeResponseType> challengeResponses;

  /// The user context data captured at the time of an event request. It
  /// provides additional information about the client from which event the
  /// request is received.
  final EventContextDataType eventContextData;

  /// A flag specifying the user feedback captured at the time of an event
  /// request is good or bad.
  final EventFeedbackType eventFeedback;

  AuthEventType({
    this.eventId,
    this.eventType,
    this.creationDate,
    this.eventResponse,
    this.eventRisk,
    this.challengeResponses,
    this.eventContextData,
    this.eventFeedback,
  });
  static AuthEventType fromJson(Map<String, dynamic> json) => AuthEventType();
}

/// The authentication result.
class AuthenticationResultType {
  /// The access token.
  final String accessToken;

  /// The expiration period of the authentication result in seconds.
  final int expiresIn;

  /// The token type.
  final String tokenType;

  /// The refresh token.
  final String refreshToken;

  /// The ID token.
  final String idToken;

  /// The new device metadata from an authentication result.
  final NewDeviceMetadataType newDeviceMetadata;

  AuthenticationResultType({
    this.accessToken,
    this.expiresIn,
    this.tokenType,
    this.refreshToken,
    this.idToken,
    this.newDeviceMetadata,
  });
  static AuthenticationResultType fromJson(Map<String, dynamic> json) =>
      AuthenticationResultType();
}

/// The challenge response type.
class ChallengeResponseType {
  /// The challenge name
  final String challengeName;

  /// The challenge response.
  final String challengeResponse;

  ChallengeResponseType({
    this.challengeName,
    this.challengeResponse,
  });
  static ChallengeResponseType fromJson(Map<String, dynamic> json) =>
      ChallengeResponseType();
}

/// The response from the server to the change password request.
class ChangePasswordResponse {
  ChangePasswordResponse();
  static ChangePasswordResponse fromJson(Map<String, dynamic> json) =>
      ChangePasswordResponse();
}

/// The code delivery details being returned from the server.
class CodeDeliveryDetailsType {
  /// The destination for the code delivery details.
  final String destination;

  /// The delivery medium (email message or phone number).
  final String deliveryMedium;

  /// The attribute name.
  final String attributeName;

  CodeDeliveryDetailsType({
    this.destination,
    this.deliveryMedium,
    this.attributeName,
  });
  static CodeDeliveryDetailsType fromJson(Map<String, dynamic> json) =>
      CodeDeliveryDetailsType();
}

/// The compromised credentials actions type
class CompromisedCredentialsActionsType {
  /// The event action.
  final String eventAction;

  CompromisedCredentialsActionsType({
    @required this.eventAction,
  });
  static CompromisedCredentialsActionsType fromJson(
          Map<String, dynamic> json) =>
      CompromisedCredentialsActionsType();
}

/// The compromised credentials risk configuration type.
class CompromisedCredentialsRiskConfigurationType {
  /// Perform the action for these events. The default is to perform all events
  /// if no event filter is specified.
  final List<String> eventFilter;

  /// The compromised credentials risk configuration actions.
  final CompromisedCredentialsActionsType actions;

  CompromisedCredentialsRiskConfigurationType({
    this.eventFilter,
    @required this.actions,
  });
  static CompromisedCredentialsRiskConfigurationType fromJson(
          Map<String, dynamic> json) =>
      CompromisedCredentialsRiskConfigurationType();
}

/// Confirms the device response.
class ConfirmDeviceResponse {
  /// Indicates whether the user confirmation is necessary to confirm the device
  /// response.
  final bool userConfirmationNecessary;

  ConfirmDeviceResponse({
    this.userConfirmationNecessary,
  });
  static ConfirmDeviceResponse fromJson(Map<String, dynamic> json) =>
      ConfirmDeviceResponse();
}

/// The response from the server that results from a user's request to retrieve
/// a forgotten password.
class ConfirmForgotPasswordResponse {
  ConfirmForgotPasswordResponse();
  static ConfirmForgotPasswordResponse fromJson(Map<String, dynamic> json) =>
      ConfirmForgotPasswordResponse();
}

/// Represents the response from the server for the registration confirmation.
class ConfirmSignUpResponse {
  ConfirmSignUpResponse();
  static ConfirmSignUpResponse fromJson(Map<String, dynamic> json) =>
      ConfirmSignUpResponse();
}

/// Contextual user data type used for evaluating the risk of an unexpected
/// event by Amazon Cognito advanced security.
class ContextDataType {
  /// Source IP address of your user.
  final String ipAddress;

  /// Your server endpoint where this API is invoked.
  final String serverName;

  /// Your server path where this API is invoked.
  final String serverPath;

  /// HttpHeaders received on your server in same order.
  final List<HttpHeader> httpHeaders;

  /// Encoded data containing device fingerprinting details, collected using the
  /// Amazon Cognito context data collection library.
  final String encodedData;

  ContextDataType({
    @required this.ipAddress,
    @required this.serverName,
    @required this.serverPath,
    @required this.httpHeaders,
    this.encodedData,
  });
}

class CreateGroupResponse {
  /// The group object for the group.
  final GroupType group;

  CreateGroupResponse({
    this.group,
  });
  static CreateGroupResponse fromJson(Map<String, dynamic> json) =>
      CreateGroupResponse();
}

class CreateIdentityProviderResponse {
  /// The newly created identity provider object.
  final IdentityProviderType identityProvider;

  CreateIdentityProviderResponse({
    @required this.identityProvider,
  });
  static CreateIdentityProviderResponse fromJson(Map<String, dynamic> json) =>
      CreateIdentityProviderResponse();
}

class CreateResourceServerResponse {
  /// The newly created resource server.
  final ResourceServerType resourceServer;

  CreateResourceServerResponse({
    @required this.resourceServer,
  });
  static CreateResourceServerResponse fromJson(Map<String, dynamic> json) =>
      CreateResourceServerResponse();
}

/// Represents the response from the server to the request to create the user
/// import job.
class CreateUserImportJobResponse {
  /// The job object that represents the user import job.
  final UserImportJobType userImportJob;

  CreateUserImportJobResponse({
    this.userImportJob,
  });
  static CreateUserImportJobResponse fromJson(Map<String, dynamic> json) =>
      CreateUserImportJobResponse();
}

/// Represents the response from the server to create a user pool client.
class CreateUserPoolClientResponse {
  /// The user pool client that was just created.
  final UserPoolClientType userPoolClient;

  CreateUserPoolClientResponse({
    this.userPoolClient,
  });
  static CreateUserPoolClientResponse fromJson(Map<String, dynamic> json) =>
      CreateUserPoolClientResponse();
}

class CreateUserPoolDomainResponse {
  /// The Amazon CloudFront endpoint that you use as the target of the alias
  /// that you set up with your Domain Name Service (DNS) provider.
  final String cloudFrontDomain;

  CreateUserPoolDomainResponse({
    this.cloudFrontDomain,
  });
  static CreateUserPoolDomainResponse fromJson(Map<String, dynamic> json) =>
      CreateUserPoolDomainResponse();
}

/// Represents the response from the server for the request to create a user
/// pool.
class CreateUserPoolResponse {
  /// A container for the user pool details.
  final UserPoolType userPool;

  CreateUserPoolResponse({
    this.userPool,
  });
  static CreateUserPoolResponse fromJson(Map<String, dynamic> json) =>
      CreateUserPoolResponse();
}

/// The configuration for a custom domain that hosts the sign-up and sign-in
/// webpages for your application.
class CustomDomainConfigType {
  /// The Amazon Resource Name (ARN) of an AWS Certificate Manager SSL
  /// certificate. You use this certificate for the subdomain of your custom
  /// domain.
  final String certificateArn;

  CustomDomainConfigType({
    @required this.certificateArn,
  });
  static CustomDomainConfigType fromJson(Map<String, dynamic> json) =>
      CustomDomainConfigType();
}

/// Represents the response from the server to delete user attributes.
class DeleteUserAttributesResponse {
  DeleteUserAttributesResponse();
  static DeleteUserAttributesResponse fromJson(Map<String, dynamic> json) =>
      DeleteUserAttributesResponse();
}

class DeleteUserPoolDomainResponse {
  DeleteUserPoolDomainResponse();
  static DeleteUserPoolDomainResponse fromJson(Map<String, dynamic> json) =>
      DeleteUserPoolDomainResponse();
}

class DescribeIdentityProviderResponse {
  /// The identity provider that was deleted.
  final IdentityProviderType identityProvider;

  DescribeIdentityProviderResponse({
    @required this.identityProvider,
  });
  static DescribeIdentityProviderResponse fromJson(Map<String, dynamic> json) =>
      DescribeIdentityProviderResponse();
}

class DescribeResourceServerResponse {
  /// The resource server.
  final ResourceServerType resourceServer;

  DescribeResourceServerResponse({
    @required this.resourceServer,
  });
  static DescribeResourceServerResponse fromJson(Map<String, dynamic> json) =>
      DescribeResourceServerResponse();
}

class DescribeRiskConfigurationResponse {
  /// The risk configuration.
  final RiskConfigurationType riskConfiguration;

  DescribeRiskConfigurationResponse({
    @required this.riskConfiguration,
  });
  static DescribeRiskConfigurationResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeRiskConfigurationResponse();
}

/// Represents the response from the server to the request to describe the user
/// import job.
class DescribeUserImportJobResponse {
  /// The job object that represents the user import job.
  final UserImportJobType userImportJob;

  DescribeUserImportJobResponse({
    this.userImportJob,
  });
  static DescribeUserImportJobResponse fromJson(Map<String, dynamic> json) =>
      DescribeUserImportJobResponse();
}

/// Represents the response from the server from a request to describe the user
/// pool client.
class DescribeUserPoolClientResponse {
  /// The user pool client from a server response to describe the user pool
  /// client.
  final UserPoolClientType userPoolClient;

  DescribeUserPoolClientResponse({
    this.userPoolClient,
  });
  static DescribeUserPoolClientResponse fromJson(Map<String, dynamic> json) =>
      DescribeUserPoolClientResponse();
}

class DescribeUserPoolDomainResponse {
  /// A domain description object containing information about the domain.
  final DomainDescriptionType domainDescription;

  DescribeUserPoolDomainResponse({
    this.domainDescription,
  });
  static DescribeUserPoolDomainResponse fromJson(Map<String, dynamic> json) =>
      DescribeUserPoolDomainResponse();
}

/// Represents the response to describe the user pool.
class DescribeUserPoolResponse {
  /// The container of metadata returned by the server to describe the pool.
  final UserPoolType userPool;

  DescribeUserPoolResponse({
    this.userPool,
  });
  static DescribeUserPoolResponse fromJson(Map<String, dynamic> json) =>
      DescribeUserPoolResponse();
}

/// The configuration for the user pool's device tracking.
class DeviceConfigurationType {
  /// Indicates whether a challenge is required on a new device. Only applicable
  /// to a new device.
  final bool challengeRequiredOnNewDevice;

  /// If true, a device is only remembered on user prompt.
  final bool deviceOnlyRememberedOnUserPrompt;

  DeviceConfigurationType({
    this.challengeRequiredOnNewDevice,
    this.deviceOnlyRememberedOnUserPrompt,
  });
  static DeviceConfigurationType fromJson(Map<String, dynamic> json) =>
      DeviceConfigurationType();
}

/// The device verifier against which it will be authenticated.
class DeviceSecretVerifierConfigType {
  /// The password verifier.
  final String passwordVerifier;

  /// The salt.
  final String salt;

  DeviceSecretVerifierConfigType({
    this.passwordVerifier,
    this.salt,
  });
}

/// The device type.
class DeviceType {
  /// The device key.
  final String deviceKey;

  /// The device attributes.
  final List<AttributeType> deviceAttributes;

  /// The creation date of the device.
  final DateTime deviceCreateDate;

  /// The last modified date of the device.
  final DateTime deviceLastModifiedDate;

  /// The date in which the device was last authenticated.
  final DateTime deviceLastAuthenticatedDate;

  DeviceType({
    this.deviceKey,
    this.deviceAttributes,
    this.deviceCreateDate,
    this.deviceLastModifiedDate,
    this.deviceLastAuthenticatedDate,
  });
  static DeviceType fromJson(Map<String, dynamic> json) => DeviceType();
}

/// A container for information about a domain.
class DomainDescriptionType {
  /// The user pool ID.
  final String userPoolId;

  /// The AWS account ID for the user pool owner.
  final String awsAccountId;

  /// The domain string.
  final String domain;

  /// The S3 bucket where the static files for this domain are stored.
  final String s3Bucket;

  /// The ARN of the CloudFront distribution.
  final String cloudFrontDistribution;

  /// The app version.
  final String version;

  /// The domain status.
  final String status;

  /// The configuration for a custom domain that hosts the sign-up and sign-in
  /// webpages for your application.
  final CustomDomainConfigType customDomainConfig;

  DomainDescriptionType({
    this.userPoolId,
    this.awsAccountId,
    this.domain,
    this.s3Bucket,
    this.cloudFrontDistribution,
    this.version,
    this.status,
    this.customDomainConfig,
  });
  static DomainDescriptionType fromJson(Map<String, dynamic> json) =>
      DomainDescriptionType();
}

/// The email configuration type.
class EmailConfigurationType {
  /// The Amazon Resource Name (ARN) of a verified email address in Amazon SES.
  /// This email address is used in one of the following ways, depending on the
  /// value that you specify for the `EmailSendingAccount` parameter:
  ///
  /// *   If you specify `COGNITO_DEFAULT`, Amazon Cognito uses this address as
  /// the custom FROM address when it emails your users by using its built-in
  /// email account.
  ///
  /// *   If you specify `DEVELOPER`, Amazon Cognito emails your users with this
  /// address by calling Amazon SES on your behalf.
  final String sourceArn;

  /// The destination to which the receiver of the email should reply to.
  final String replyToEmailAddress;

  /// Specifies whether Amazon Cognito emails your users by using its built-in
  /// email functionality or your Amazon SES email configuration. Specify one of
  /// the following values:
  ///
  /// COGNITO_DEFAULT
  ///
  /// When Amazon Cognito emails your users, it uses its built-in email
  /// functionality. When you use the default option, Amazon Cognito allows only
  /// a limited number of emails each day for your user pool. For typical
  /// production environments, the default email limit is below the required
  /// delivery volume. To achieve a higher delivery volume, specify DEVELOPER to
  /// use your Amazon SES email configuration.
  ///
  /// To look up the email delivery limit for the default option, see
  /// [Limits in Amazon Cognito](https://docs.aws.amazon.com/cognito/latest/developerguide/limits.html)
  /// in the _Amazon Cognito Developer Guide_.
  ///
  /// The default FROM address is no-reply@verificationemail.com. To customize
  /// the FROM address, provide the ARN of an Amazon SES verified email address
  /// for the `SourceArn` parameter.
  ///
  /// DEVELOPER
  ///
  /// When Amazon Cognito emails your users, it uses your Amazon SES
  /// configuration. Amazon Cognito calls Amazon SES on your behalf to send
  /// email from your verified email address. When you use this option, the
  /// email delivery limits are the same limits that apply to your Amazon SES
  /// verified email address in your AWS account.
  ///
  /// If you use this option, you must provide the ARN of an Amazon SES verified
  /// email address for the `SourceArn` parameter.
  ///
  /// Before Amazon Cognito can email your users, it requires additional
  /// permissions to call Amazon SES on your behalf. When you update your user
  /// pool with this option, Amazon Cognito creates a _service-linked role_,
  /// which is a type of IAM role, in your AWS account. This role contains the
  /// permissions that allow Amazon Cognito to access Amazon SES and send email
  /// messages with your address. For more information about the service-linked
  /// role that Amazon Cognito creates, see
  /// [Using Service-Linked Roles for Amazon Cognito](https://docs.aws.amazon.com/cognito/latest/developerguide/using-service-linked-roles.html)
  /// in the _Amazon Cognito Developer Guide_.
  final String emailSendingAccount;

  EmailConfigurationType({
    this.sourceArn,
    this.replyToEmailAddress,
    this.emailSendingAccount,
  });
  static EmailConfigurationType fromJson(Map<String, dynamic> json) =>
      EmailConfigurationType();
}

/// Specifies the user context data captured at the time of an event request.
class EventContextDataType {
  /// The user's IP address.
  final String ipAddress;

  /// The user's device name.
  final String deviceName;

  /// The user's time zone.
  final String timezone;

  /// The user's city.
  final String city;

  /// The user's country.
  final String country;

  EventContextDataType({
    this.ipAddress,
    this.deviceName,
    this.timezone,
    this.city,
    this.country,
  });
  static EventContextDataType fromJson(Map<String, dynamic> json) =>
      EventContextDataType();
}

/// Specifies the event feedback type.
class EventFeedbackType {
  /// The event feedback value.
  final String feedbackValue;

  /// The provider.
  final String provider;

  /// The event feedback date.
  final DateTime feedbackDate;

  EventFeedbackType({
    @required this.feedbackValue,
    @required this.provider,
    this.feedbackDate,
  });
  static EventFeedbackType fromJson(Map<String, dynamic> json) =>
      EventFeedbackType();
}

/// The event risk type.
class EventRiskType {
  /// The risk decision.
  final String riskDecision;

  /// The risk level.
  final String riskLevel;

  EventRiskType({
    this.riskDecision,
    this.riskLevel,
  });
  static EventRiskType fromJson(Map<String, dynamic> json) => EventRiskType();
}

/// Respresents the response from the server regarding the request to reset a
/// password.
class ForgotPasswordResponse {
  /// The code delivery details returned by the server in response to the
  /// request to reset a password.
  final CodeDeliveryDetailsType codeDeliveryDetails;

  ForgotPasswordResponse({
    this.codeDeliveryDetails,
  });
  static ForgotPasswordResponse fromJson(Map<String, dynamic> json) =>
      ForgotPasswordResponse();
}

/// Represents the response from the server to the request to get the header
/// information for the .csv file for the user import job.
class GetCsvHeaderResponse {
  /// The user pool ID for the user pool that the users are to be imported into.
  final String userPoolId;

  /// The header information for the .csv file for the user import job.
  final List<String> csvHeader;

  GetCsvHeaderResponse({
    this.userPoolId,
    this.csvHeader,
  });
  static GetCsvHeaderResponse fromJson(Map<String, dynamic> json) =>
      GetCsvHeaderResponse();
}

/// Gets the device response.
class GetDeviceResponse {
  /// The device.
  final DeviceType device;

  GetDeviceResponse({
    @required this.device,
  });
  static GetDeviceResponse fromJson(Map<String, dynamic> json) =>
      GetDeviceResponse();
}

class GetGroupResponse {
  /// The group object for the group.
  final GroupType group;

  GetGroupResponse({
    this.group,
  });
  static GetGroupResponse fromJson(Map<String, dynamic> json) =>
      GetGroupResponse();
}

class GetIdentityProviderByIdentifierResponse {
  /// The identity provider object.
  final IdentityProviderType identityProvider;

  GetIdentityProviderByIdentifierResponse({
    @required this.identityProvider,
  });
  static GetIdentityProviderByIdentifierResponse fromJson(
          Map<String, dynamic> json) =>
      GetIdentityProviderByIdentifierResponse();
}

/// Response from Cognito for a signing certificate request.
class GetSigningCertificateResponse {
  /// The signing certificate.
  final String certificate;

  GetSigningCertificateResponse({
    this.certificate,
  });
  static GetSigningCertificateResponse fromJson(Map<String, dynamic> json) =>
      GetSigningCertificateResponse();
}

class GetUICustomizationResponse {
  /// The UI customization information.
  final UICustomizationType uiCustomization;

  GetUICustomizationResponse({
    @required this.uiCustomization,
  });
  static GetUICustomizationResponse fromJson(Map<String, dynamic> json) =>
      GetUICustomizationResponse();
}

/// The verification code response returned by the server response to get the
/// user attribute verification code.
class GetUserAttributeVerificationCodeResponse {
  /// The code delivery details returned by the server in response to the
  /// request to get the user attribute verification code.
  final CodeDeliveryDetailsType codeDeliveryDetails;

  GetUserAttributeVerificationCodeResponse({
    this.codeDeliveryDetails,
  });
  static GetUserAttributeVerificationCodeResponse fromJson(
          Map<String, dynamic> json) =>
      GetUserAttributeVerificationCodeResponse();
}

class GetUserPoolMfaConfigResponse {
  /// The SMS text message multi-factor (MFA) configuration.
  final SmsMfaConfigType smsMfaConfiguration;

  /// The software token multi-factor (MFA) configuration.
  final SoftwareTokenMfaConfigType softwareTokenMfaConfiguration;

  /// The multi-factor (MFA) configuration.
  final String mfaConfiguration;

  GetUserPoolMfaConfigResponse({
    this.smsMfaConfiguration,
    this.softwareTokenMfaConfiguration,
    this.mfaConfiguration,
  });
  static GetUserPoolMfaConfigResponse fromJson(Map<String, dynamic> json) =>
      GetUserPoolMfaConfigResponse();
}

/// Represents the response from the server from the request to get information
/// about the user.
class GetUserResponse {
  /// The user name of the user you wish to retrieve from the get user request.
  final String username;

  /// An array of name-value pairs representing user attributes.
  ///
  /// For custom attributes, you must prepend the `custom:` prefix to the
  /// attribute name.
  final List<AttributeType> userAttributes;

  /// Specifies the options for MFA (e.g., email or phone number).
  final List<MfaOptionType> mfaOptions;

  /// The user's preferred MFA setting.
  final String preferredMfaSetting;

  /// The list of the user's MFA settings.
  final List<String> userMfaSettingList;

  GetUserResponse({
    @required this.username,
    @required this.userAttributes,
    this.mfaOptions,
    this.preferredMfaSetting,
    this.userMfaSettingList,
  });
  static GetUserResponse fromJson(Map<String, dynamic> json) =>
      GetUserResponse();
}

/// The response to the request to sign out all devices.
class GlobalSignOutResponse {
  GlobalSignOutResponse();
  static GlobalSignOutResponse fromJson(Map<String, dynamic> json) =>
      GlobalSignOutResponse();
}

/// The group type.
class GroupType {
  /// The name of the group.
  final String groupName;

  /// The user pool ID for the user pool.
  final String userPoolId;

  /// A string containing the description of the group.
  final String description;

  /// The role ARN for the group.
  final String roleArn;

  /// A nonnegative integer value that specifies the precedence of this group
  /// relative to the other groups that a user can belong to in the user pool.
  /// If a user belongs to two or more groups, it is the group with the highest
  /// precedence whose role ARN will be used in the `cognito:roles` and
  /// `cognito:preferred_role` claims in the user's tokens. Groups with higher
  /// `Precedence` values take precedence over groups with lower `Precedence`
  /// values or with null `Precedence` values.
  ///
  /// Two groups can have the same `Precedence` value. If this happens, neither
  /// group takes precedence over the other. If two groups with the same
  /// `Precedence` have the same role ARN, that role is used in the
  /// `cognito:preferred_role` claim in tokens for users in each group. If the
  /// two groups have different role ARNs, the `cognito:preferred_role` claim is
  /// not set in users' tokens.
  ///
  /// The default `Precedence` value is null.
  final int precedence;

  /// The date the group was last modified.
  final DateTime lastModifiedDate;

  /// The date the group was created.
  final DateTime creationDate;

  GroupType({
    this.groupName,
    this.userPoolId,
    this.description,
    this.roleArn,
    this.precedence,
    this.lastModifiedDate,
    this.creationDate,
  });
  static GroupType fromJson(Map<String, dynamic> json) => GroupType();
}

/// The HTTP header.
class HttpHeader {
  /// The header name
  final String headerName;

  /// The header value.
  final String headerValue;

  HttpHeader({
    this.headerName,
    this.headerValue,
  });
}

/// A container for information about an identity provider.
class IdentityProviderType {
  /// The user pool ID.
  final String userPoolId;

  /// The identity provider name.
  final String providerName;

  /// The identity provider type.
  final String providerType;

  /// The identity provider details, such as `MetadataURL` and `MetadataFile`.
  final Map<String, String> providerDetails;

  /// A mapping of identity provider attributes to standard and custom user pool
  /// attributes.
  final Map<String, String> attributeMapping;

  /// A list of identity provider identifiers.
  final List<String> idpIdentifiers;

  /// The date the identity provider was last modified.
  final DateTime lastModifiedDate;

  /// The date the identity provider was created.
  final DateTime creationDate;

  IdentityProviderType({
    this.userPoolId,
    this.providerName,
    this.providerType,
    this.providerDetails,
    this.attributeMapping,
    this.idpIdentifiers,
    this.lastModifiedDate,
    this.creationDate,
  });
  static IdentityProviderType fromJson(Map<String, dynamic> json) =>
      IdentityProviderType();
}

/// Initiates the authentication response.
class InitiateAuthResponse {
  /// The name of the challenge which you are responding to with this call. This
  /// is returned to you in the `AdminInitiateAuth` response if you need to pass
  /// another challenge.
  ///
  /// Valid values include the following. Note that all of these challenges
  /// require `USERNAME` and `SECRET_HASH` (if applicable) in the parameters.
  ///
  /// *    `SMS_MFA`: Next challenge is to supply an `SMS_MFA_CODE`, delivered
  /// via SMS.
  ///
  /// *    `PASSWORD_VERIFIER`: Next challenge is to supply
  /// `PASSWORD_CLAIM_SIGNATURE`, `PASSWORD_CLAIM_SECRET_BLOCK`, and `TIMESTAMP`
  /// after the client-side SRP calculations.
  ///
  /// *    `CUSTOM_CHALLENGE`: This is returned if your custom authentication
  /// flow determines that the user should pass another challenge before tokens
  /// are issued.
  ///
  /// *    `DEVICE_SRP_AUTH`: If device tracking was enabled on your user pool
  /// and the previous challenges were passed, this challenge is returned so
  /// that Amazon Cognito can start tracking this device.
  ///
  /// *    `DEVICE_PASSWORD_VERIFIER`: Similar to `PASSWORD_VERIFIER`, but for
  /// devices only.
  ///
  /// *    `NEW_PASSWORD_REQUIRED`: For users which are required to change their
  /// passwords after successful first login. This challenge should be passed
  /// with `NEW_PASSWORD` and any other required attributes.
  final String challengeName;

  /// The session which should be passed both ways in challenge-response calls
  /// to the service. If the or API call determines that the caller needs to go
  /// through another challenge, they return a session with other challenge
  /// parameters. This session should be passed as it is to the next
  /// `RespondToAuthChallenge` API call.
  final String session;

  /// The challenge parameters. These are returned to you in the `InitiateAuth`
  /// response if you need to pass another challenge. The responses in this
  /// parameter should be used to compute inputs to the next call
  /// (`RespondToAuthChallenge`).
  ///
  /// All challenges require `USERNAME` and `SECRET_HASH` (if applicable).
  final Map<String, String> challengeParameters;

  /// The result of the authentication response. This is only returned if the
  /// caller does not need to pass another challenge. If the caller does need to
  /// pass another challenge before it gets tokens, `ChallengeName`,
  /// `ChallengeParameters`, and `Session` are returned.
  final AuthenticationResultType authenticationResult;

  InitiateAuthResponse({
    this.challengeName,
    this.session,
    this.challengeParameters,
    this.authenticationResult,
  });
  static InitiateAuthResponse fromJson(Map<String, dynamic> json) =>
      InitiateAuthResponse();
}

/// Specifies the configuration for AWS Lambda triggers.
class LambdaConfigType {
  /// A pre-registration AWS Lambda trigger.
  final String preSignUp;

  /// A custom Message AWS Lambda trigger.
  final String customMessage;

  /// A post-confirmation AWS Lambda trigger.
  final String postConfirmation;

  /// A pre-authentication AWS Lambda trigger.
  final String preAuthentication;

  /// A post-authentication AWS Lambda trigger.
  final String postAuthentication;

  /// Defines the authentication challenge.
  final String defineAuthChallenge;

  /// Creates an authentication challenge.
  final String createAuthChallenge;

  /// Verifies the authentication challenge response.
  final String verifyAuthChallengeResponse;

  /// A Lambda trigger that is invoked before token generation.
  final String preTokenGeneration;

  /// The user migration Lambda config type.
  final String userMigration;

  LambdaConfigType({
    this.preSignUp,
    this.customMessage,
    this.postConfirmation,
    this.preAuthentication,
    this.postAuthentication,
    this.defineAuthChallenge,
    this.createAuthChallenge,
    this.verifyAuthChallengeResponse,
    this.preTokenGeneration,
    this.userMigration,
  });
  static LambdaConfigType fromJson(Map<String, dynamic> json) =>
      LambdaConfigType();
}

/// Represents the response to list devices.
class ListDevicesResponse {
  /// The devices returned in the list devices response.
  final List<DeviceType> devices;

  /// The pagination token for the list device response.
  final String paginationToken;

  ListDevicesResponse({
    this.devices,
    this.paginationToken,
  });
  static ListDevicesResponse fromJson(Map<String, dynamic> json) =>
      ListDevicesResponse();
}

class ListGroupsResponse {
  /// The group objects for the groups.
  final List<GroupType> groups;

  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  final String nextToken;

  ListGroupsResponse({
    this.groups,
    this.nextToken,
  });
  static ListGroupsResponse fromJson(Map<String, dynamic> json) =>
      ListGroupsResponse();
}

class ListIdentityProvidersResponse {
  /// A list of identity provider objects.
  final List<ProviderDescription> providers;

  /// A pagination token.
  final String nextToken;

  ListIdentityProvidersResponse({
    @required this.providers,
    this.nextToken,
  });
  static ListIdentityProvidersResponse fromJson(Map<String, dynamic> json) =>
      ListIdentityProvidersResponse();
}

class ListResourceServersResponse {
  /// The resource servers.
  final List<ResourceServerType> resourceServers;

  /// A pagination token.
  final String nextToken;

  ListResourceServersResponse({
    @required this.resourceServers,
    this.nextToken,
  });
  static ListResourceServersResponse fromJson(Map<String, dynamic> json) =>
      ListResourceServersResponse();
}

class ListTagsForResourceResponse {
  /// The tags that are assigned to the user pool.
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  static ListTagsForResourceResponse fromJson(Map<String, dynamic> json) =>
      ListTagsForResourceResponse();
}

/// Represents the response from the server to the request to list the user
/// import jobs.
class ListUserImportJobsResponse {
  /// The user import jobs.
  final List<UserImportJobType> userImportJobs;

  /// An identifier that can be used to return the next set of user import jobs
  /// in the list.
  final String paginationToken;

  ListUserImportJobsResponse({
    this.userImportJobs,
    this.paginationToken,
  });
  static ListUserImportJobsResponse fromJson(Map<String, dynamic> json) =>
      ListUserImportJobsResponse();
}

/// Represents the response from the server that lists user pool clients.
class ListUserPoolClientsResponse {
  /// The user pool clients in the response that lists user pool clients.
  final List<UserPoolClientDescription> userPoolClients;

  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  final String nextToken;

  ListUserPoolClientsResponse({
    this.userPoolClients,
    this.nextToken,
  });
  static ListUserPoolClientsResponse fromJson(Map<String, dynamic> json) =>
      ListUserPoolClientsResponse();
}

/// Represents the response to list user pools.
class ListUserPoolsResponse {
  /// The user pools from the response to list users.
  final List<UserPoolDescriptionType> userPools;

  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  final String nextToken;

  ListUserPoolsResponse({
    this.userPools,
    this.nextToken,
  });
  static ListUserPoolsResponse fromJson(Map<String, dynamic> json) =>
      ListUserPoolsResponse();
}

class ListUsersInGroupResponse {
  /// The users returned in the request to list users.
  final List<UserType> users;

  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  final String nextToken;

  ListUsersInGroupResponse({
    this.users,
    this.nextToken,
  });
  static ListUsersInGroupResponse fromJson(Map<String, dynamic> json) =>
      ListUsersInGroupResponse();
}

/// The response from the request to list users.
class ListUsersResponse {
  /// The users returned in the request to list users.
  final List<UserType> users;

  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  final String paginationToken;

  ListUsersResponse({
    this.users,
    this.paginationToken,
  });
  static ListUsersResponse fromJson(Map<String, dynamic> json) =>
      ListUsersResponse();
}

/// Specifies the different settings for multi-factor authentication (MFA).
class MfaOptionType {
  /// The delivery medium (email message or SMS message) to send the MFA code.
  final String deliveryMedium;

  /// The attribute name of the MFA option type.
  final String attributeName;

  MfaOptionType({
    this.deliveryMedium,
    this.attributeName,
  });
  static MfaOptionType fromJson(Map<String, dynamic> json) => MfaOptionType();
}

/// The message template structure.
class MessageTemplateType {
  /// The message template for SMS messages.
  final String smsMessage;

  /// The message template for email messages.
  final String emailMessage;

  /// The subject line for email messages.
  final String emailSubject;

  MessageTemplateType({
    this.smsMessage,
    this.emailMessage,
    this.emailSubject,
  });
  static MessageTemplateType fromJson(Map<String, dynamic> json) =>
      MessageTemplateType();
}

/// The new device metadata type.
class NewDeviceMetadataType {
  /// The device key.
  final String deviceKey;

  /// The device group key.
  final String deviceGroupKey;

  NewDeviceMetadataType({
    this.deviceKey,
    this.deviceGroupKey,
  });
  static NewDeviceMetadataType fromJson(Map<String, dynamic> json) =>
      NewDeviceMetadataType();
}

/// The notify configuration type.
class NotifyConfigurationType {
  /// The email address that is sending the email. It must be either
  /// individually verified with Amazon SES, or from a domain that has been
  /// verified with Amazon SES.
  final String from;

  /// The destination to which the receiver of an email should reply to.
  final String replyTo;

  /// The Amazon Resource Name (ARN) of the identity that is associated with the
  /// sending authorization policy. It permits Amazon Cognito to send for the
  /// email address specified in the `From` parameter.
  final String sourceArn;

  /// Email template used when a detected risk event is blocked.
  final NotifyEmailType blockEmail;

  /// The email template used when a detected risk event is allowed.
  final NotifyEmailType noActionEmail;

  /// The MFA email template used when MFA is challenged as part of a detected
  /// risk.
  final NotifyEmailType mfaEmail;

  NotifyConfigurationType({
    this.from,
    this.replyTo,
    @required this.sourceArn,
    this.blockEmail,
    this.noActionEmail,
    this.mfaEmail,
  });
  static NotifyConfigurationType fromJson(Map<String, dynamic> json) =>
      NotifyConfigurationType();
}

/// The notify email type.
class NotifyEmailType {
  /// The subject.
  final String subject;

  /// The HTML body.
  final String htmlBody;

  /// The text body.
  final String textBody;

  NotifyEmailType({
    @required this.subject,
    this.htmlBody,
    this.textBody,
  });
  static NotifyEmailType fromJson(Map<String, dynamic> json) =>
      NotifyEmailType();
}

/// The minimum and maximum value of an attribute that is of the number data
/// type.
class NumberAttributeConstraintsType {
  /// The minimum value of an attribute that is of the number data type.
  final String minValue;

  /// The maximum value of an attribute that is of the number data type.
  final String maxValue;

  NumberAttributeConstraintsType({
    this.minValue,
    this.maxValue,
  });
  static NumberAttributeConstraintsType fromJson(Map<String, dynamic> json) =>
      NumberAttributeConstraintsType();
}

/// The password policy type.
class PasswordPolicyType {
  /// The minimum length of the password policy that you have set. Cannot be
  /// less than 6.
  final int minimumLength;

  /// In the password policy that you have set, refers to whether you have
  /// required users to use at least one uppercase letter in their password.
  final bool requireUppercase;

  /// In the password policy that you have set, refers to whether you have
  /// required users to use at least one lowercase letter in their password.
  final bool requireLowercase;

  /// In the password policy that you have set, refers to whether you have
  /// required users to use at least one number in their password.
  final bool requireNumbers;

  /// In the password policy that you have set, refers to whether you have
  /// required users to use at least one symbol in their password.
  final bool requireSymbols;

  final int temporaryPasswordValidityDays;

  PasswordPolicyType({
    this.minimumLength,
    this.requireUppercase,
    this.requireLowercase,
    this.requireNumbers,
    this.requireSymbols,
    this.temporaryPasswordValidityDays,
  });
  static PasswordPolicyType fromJson(Map<String, dynamic> json) =>
      PasswordPolicyType();
}

/// A container for identity provider details.
class ProviderDescription {
  /// The identity provider name.
  final String providerName;

  /// The identity provider type.
  final String providerType;

  /// The date the provider was last modified.
  final DateTime lastModifiedDate;

  /// The date the provider was added to the user pool.
  final DateTime creationDate;

  ProviderDescription({
    this.providerName,
    this.providerType,
    this.lastModifiedDate,
    this.creationDate,
  });
  static ProviderDescription fromJson(Map<String, dynamic> json) =>
      ProviderDescription();
}

/// A container for information about an identity provider for a user pool.
class ProviderUserIdentifierType {
  /// The name of the provider, for example, Facebook, Google, or Login with
  /// Amazon.
  final String providerName;

  /// The name of the provider attribute to link to, for example, `NameID`.
  final String providerAttributeName;

  /// The value of the provider attribute to link to, for example,
  /// `xxxxx_account`.
  final String providerAttributeValue;

  ProviderUserIdentifierType({
    this.providerName,
    this.providerAttributeName,
    this.providerAttributeValue,
  });
}

/// The response from the server when the Amazon Cognito Your User Pools service
/// makes the request to resend a confirmation code.
class ResendConfirmationCodeResponse {
  /// The code delivery details returned by the server in response to the
  /// request to resend the confirmation code.
  final CodeDeliveryDetailsType codeDeliveryDetails;

  ResendConfirmationCodeResponse({
    this.codeDeliveryDetails,
  });
  static ResendConfirmationCodeResponse fromJson(Map<String, dynamic> json) =>
      ResendConfirmationCodeResponse();
}

/// A resource server scope.
class ResourceServerScopeType {
  /// The name of the scope.
  final String scopeName;

  /// A description of the scope.
  final String scopeDescription;

  ResourceServerScopeType({
    @required this.scopeName,
    @required this.scopeDescription,
  });
  static ResourceServerScopeType fromJson(Map<String, dynamic> json) =>
      ResourceServerScopeType();
}

/// A container for information about a resource server for a user pool.
class ResourceServerType {
  /// The user pool ID for the user pool that hosts the resource server.
  final String userPoolId;

  /// The identifier for the resource server.
  final String identifier;

  /// The name of the resource server.
  final String name;

  /// A list of scopes that are defined for the resource server.
  final List<ResourceServerScopeType> scopes;

  ResourceServerType({
    this.userPoolId,
    this.identifier,
    this.name,
    this.scopes,
  });
  static ResourceServerType fromJson(Map<String, dynamic> json) =>
      ResourceServerType();
}

/// The response to respond to the authentication challenge.
class RespondToAuthChallengeResponse {
  /// The challenge name. For more information, see .
  final String challengeName;

  /// The session which should be passed both ways in challenge-response calls
  /// to the service. If the or API call determines that the caller needs to go
  /// through another challenge, they return a session with other challenge
  /// parameters. This session should be passed as it is to the next
  /// `RespondToAuthChallenge` API call.
  final String session;

  /// The challenge parameters. For more information, see .
  final Map<String, String> challengeParameters;

  /// The result returned by the server in response to the request to respond to
  /// the authentication challenge.
  final AuthenticationResultType authenticationResult;

  RespondToAuthChallengeResponse({
    this.challengeName,
    this.session,
    this.challengeParameters,
    this.authenticationResult,
  });
  static RespondToAuthChallengeResponse fromJson(Map<String, dynamic> json) =>
      RespondToAuthChallengeResponse();
}

/// The risk configuration type.
class RiskConfigurationType {
  /// The user pool ID.
  final String userPoolId;

  /// The app client ID.
  final String clientId;

  /// The compromised credentials risk configuration object including the
  /// `EventFilter` and the `EventAction`
  final CompromisedCredentialsRiskConfigurationType
      compromisedCredentialsRiskConfiguration;

  /// The account takeover risk configuration object including the
  /// `NotifyConfiguration` object and `Actions` to take in the case of an
  /// account takeover.
  final AccountTakeoverRiskConfigurationType accountTakeoverRiskConfiguration;

  /// The configuration to override the risk decision.
  final RiskExceptionConfigurationType riskExceptionConfiguration;

  /// The last modified date.
  final DateTime lastModifiedDate;

  RiskConfigurationType({
    this.userPoolId,
    this.clientId,
    this.compromisedCredentialsRiskConfiguration,
    this.accountTakeoverRiskConfiguration,
    this.riskExceptionConfiguration,
    this.lastModifiedDate,
  });
  static RiskConfigurationType fromJson(Map<String, dynamic> json) =>
      RiskConfigurationType();
}

/// The type of the configuration to override the risk decision.
class RiskExceptionConfigurationType {
  /// Overrides the risk decision to always block the pre-authentication
  /// requests. The IP range is in CIDR notation: a compact representation of an
  /// IP address and its associated routing prefix.
  final List<String> blockedIPRangeList;

  /// Risk detection is not performed on the IP addresses in the range list. The
  /// IP range is in CIDR notation.
  final List<String> skippedIPRangeList;

  RiskExceptionConfigurationType({
    this.blockedIPRangeList,
    this.skippedIPRangeList,
  });
  static RiskExceptionConfigurationType fromJson(Map<String, dynamic> json) =>
      RiskExceptionConfigurationType();
}

/// The SMS multi-factor authentication (MFA) settings type.
class SmsMfaSettingsType {
  /// Specifies whether SMS text message MFA is enabled.
  final bool enabled;

  /// The preferred MFA method.
  final bool preferredMfa;

  SmsMfaSettingsType({
    this.enabled,
    this.preferredMfa,
  });
}

/// Contains information about the schema attribute.
class SchemaAttributeType {
  /// A schema attribute of the name type.
  final String name;

  /// The attribute data type.
  final String attributeDataType;

  /// Specifies whether the attribute type is developer only.
  final bool developerOnlyAttribute;

  /// Specifies whether the value of the attribute can be changed.
  ///
  /// For any user pool attribute that's mapped to an identity provider
  /// attribute, you must set this parameter to `true`. Amazon Cognito updates
  /// mapped attributes when users sign in to your application through an
  /// identity provider. If an attribute is immutable, Amazon Cognito throws an
  /// error when it attempts to update the attribute. For more information, see
  /// [Specifying Identity Provider Attribute Mappings for Your User Pool](https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-specifying-attribute-mapping.html).
  final bool mutable;

  /// Specifies whether a user pool attribute is required. If the attribute is
  /// required and the user does not provide a value, registration or sign-in
  /// will fail.
  final bool isRequired;

  /// Specifies the constraints for an attribute of the number type.
  final NumberAttributeConstraintsType numberAttributeConstraints;

  /// Specifies the constraints for an attribute of the string type.
  final StringAttributeConstraintsType stringAttributeConstraints;

  SchemaAttributeType({
    this.name,
    this.attributeDataType,
    this.developerOnlyAttribute,
    this.mutable,
    this.isRequired,
    this.numberAttributeConstraints,
    this.stringAttributeConstraints,
  });
  static SchemaAttributeType fromJson(Map<String, dynamic> json) =>
      SchemaAttributeType();
}

class SetRiskConfigurationResponse {
  /// The risk configuration.
  final RiskConfigurationType riskConfiguration;

  SetRiskConfigurationResponse({
    @required this.riskConfiguration,
  });
  static SetRiskConfigurationResponse fromJson(Map<String, dynamic> json) =>
      SetRiskConfigurationResponse();
}

class SetUICustomizationResponse {
  /// The UI customization information.
  final UICustomizationType uiCustomization;

  SetUICustomizationResponse({
    @required this.uiCustomization,
  });
  static SetUICustomizationResponse fromJson(Map<String, dynamic> json) =>
      SetUICustomizationResponse();
}

class SetUserMfaPreferenceResponse {
  SetUserMfaPreferenceResponse();
  static SetUserMfaPreferenceResponse fromJson(Map<String, dynamic> json) =>
      SetUserMfaPreferenceResponse();
}

class SetUserPoolMfaConfigResponse {
  /// The SMS text message MFA configuration.
  final SmsMfaConfigType smsMfaConfiguration;

  /// The software token MFA configuration.
  final SoftwareTokenMfaConfigType softwareTokenMfaConfiguration;

  /// The MFA configuration.
  final String mfaConfiguration;

  SetUserPoolMfaConfigResponse({
    this.smsMfaConfiguration,
    this.softwareTokenMfaConfiguration,
    this.mfaConfiguration,
  });
  static SetUserPoolMfaConfigResponse fromJson(Map<String, dynamic> json) =>
      SetUserPoolMfaConfigResponse();
}

/// The response from the server for a set user settings request.
class SetUserSettingsResponse {
  SetUserSettingsResponse();
  static SetUserSettingsResponse fromJson(Map<String, dynamic> json) =>
      SetUserSettingsResponse();
}

/// The response from the server for a registration request.
class SignUpResponse {
  /// A response from the server indicating that a user registration has been
  /// confirmed.
  final bool userConfirmed;

  /// The code delivery details returned by the server response to the user
  /// registration request.
  final CodeDeliveryDetailsType codeDeliveryDetails;

  /// The UUID of the authenticated user. This is not the same as `username`.
  final String userSub;

  SignUpResponse({
    @required this.userConfirmed,
    this.codeDeliveryDetails,
    @required this.userSub,
  });
  static SignUpResponse fromJson(Map<String, dynamic> json) => SignUpResponse();
}

/// The SMS configuration type.
class SmsConfigurationType {
  /// The Amazon Resource Name (ARN) of the Amazon Simple Notification Service
  /// (SNS) caller.
  final String snsCallerArn;

  /// The external ID.
  final String externalId;

  SmsConfigurationType({
    @required this.snsCallerArn,
    this.externalId,
  });
  static SmsConfigurationType fromJson(Map<String, dynamic> json) =>
      SmsConfigurationType();
}

/// The SMS text message multi-factor authentication (MFA) configuration type.
class SmsMfaConfigType {
  /// The SMS authentication message.
  final String smsAuthenticationMessage;

  /// The SMS configuration.
  final SmsConfigurationType smsConfiguration;

  SmsMfaConfigType({
    this.smsAuthenticationMessage,
    this.smsConfiguration,
  });
  static SmsMfaConfigType fromJson(Map<String, dynamic> json) =>
      SmsMfaConfigType();
}

/// The type used for enabling software token MFA at the user pool level.
class SoftwareTokenMfaConfigType {
  /// Specifies whether software token MFA is enabled.
  final bool enabled;

  SoftwareTokenMfaConfigType({
    this.enabled,
  });
  static SoftwareTokenMfaConfigType fromJson(Map<String, dynamic> json) =>
      SoftwareTokenMfaConfigType();
}

/// The type used for enabling software token MFA at the user level.
class SoftwareTokenMfaSettingsType {
  /// Specifies whether software token MFA is enabled.
  final bool enabled;

  /// The preferred MFA method.
  final bool preferredMfa;

  SoftwareTokenMfaSettingsType({
    this.enabled,
    this.preferredMfa,
  });
}

/// Represents the response from the server to the request to start the user
/// import job.
class StartUserImportJobResponse {
  /// The job object that represents the user import job.
  final UserImportJobType userImportJob;

  StartUserImportJobResponse({
    this.userImportJob,
  });
  static StartUserImportJobResponse fromJson(Map<String, dynamic> json) =>
      StartUserImportJobResponse();
}

/// Represents the response from the server to the request to stop the user
/// import job.
class StopUserImportJobResponse {
  /// The job object that represents the user import job.
  final UserImportJobType userImportJob;

  StopUserImportJobResponse({
    this.userImportJob,
  });
  static StopUserImportJobResponse fromJson(Map<String, dynamic> json) =>
      StopUserImportJobResponse();
}

/// The constraints associated with a string attribute.
class StringAttributeConstraintsType {
  /// The minimum length.
  final String minLength;

  /// The maximum length.
  final String maxLength;

  StringAttributeConstraintsType({
    this.minLength,
    this.maxLength,
  });
  static StringAttributeConstraintsType fromJson(Map<String, dynamic> json) =>
      StringAttributeConstraintsType();
}

class TagResourceResponse {
  TagResourceResponse();
  static TagResourceResponse fromJson(Map<String, dynamic> json) =>
      TagResourceResponse();
}

/// A container for the UI customization information for a user pool's built-in
/// app UI.
class UICustomizationType {
  /// The user pool ID for the user pool.
  final String userPoolId;

  /// The client ID for the client app.
  final String clientId;

  /// The logo image for the UI customization.
  final String imageUrl;

  /// The CSS values in the UI customization.
  final String css;

  /// The CSS version number.
  final String cssVersion;

  /// The last-modified date for the UI customization.
  final DateTime lastModifiedDate;

  /// The creation date for the UI customization.
  final DateTime creationDate;

  UICustomizationType({
    this.userPoolId,
    this.clientId,
    this.imageUrl,
    this.css,
    this.cssVersion,
    this.lastModifiedDate,
    this.creationDate,
  });
  static UICustomizationType fromJson(Map<String, dynamic> json) =>
      UICustomizationType();
}

class UntagResourceResponse {
  UntagResourceResponse();
  static UntagResourceResponse fromJson(Map<String, dynamic> json) =>
      UntagResourceResponse();
}

class UpdateAuthEventFeedbackResponse {
  UpdateAuthEventFeedbackResponse();
  static UpdateAuthEventFeedbackResponse fromJson(Map<String, dynamic> json) =>
      UpdateAuthEventFeedbackResponse();
}

/// The response to the request to update the device status.
class UpdateDeviceStatusResponse {
  UpdateDeviceStatusResponse();
  static UpdateDeviceStatusResponse fromJson(Map<String, dynamic> json) =>
      UpdateDeviceStatusResponse();
}

class UpdateGroupResponse {
  /// The group object for the group.
  final GroupType group;

  UpdateGroupResponse({
    this.group,
  });
  static UpdateGroupResponse fromJson(Map<String, dynamic> json) =>
      UpdateGroupResponse();
}

class UpdateIdentityProviderResponse {
  /// The identity provider object.
  final IdentityProviderType identityProvider;

  UpdateIdentityProviderResponse({
    @required this.identityProvider,
  });
  static UpdateIdentityProviderResponse fromJson(Map<String, dynamic> json) =>
      UpdateIdentityProviderResponse();
}

class UpdateResourceServerResponse {
  /// The resource server.
  final ResourceServerType resourceServer;

  UpdateResourceServerResponse({
    @required this.resourceServer,
  });
  static UpdateResourceServerResponse fromJson(Map<String, dynamic> json) =>
      UpdateResourceServerResponse();
}

/// Represents the response from the server for the request to update user
/// attributes.
class UpdateUserAttributesResponse {
  /// The code delivery details list from the server for the request to update
  /// user attributes.
  final List<CodeDeliveryDetailsType> codeDeliveryDetailsList;

  UpdateUserAttributesResponse({
    this.codeDeliveryDetailsList,
  });
  static UpdateUserAttributesResponse fromJson(Map<String, dynamic> json) =>
      UpdateUserAttributesResponse();
}

/// Represents the response from the server to the request to update the user
/// pool client.
class UpdateUserPoolClientResponse {
  /// The user pool client value from the response from the server when an
  /// update user pool client request is made.
  final UserPoolClientType userPoolClient;

  UpdateUserPoolClientResponse({
    this.userPoolClient,
  });
  static UpdateUserPoolClientResponse fromJson(Map<String, dynamic> json) =>
      UpdateUserPoolClientResponse();
}

/// The UpdateUserPoolDomain response output.
class UpdateUserPoolDomainResponse {
  /// The Amazon CloudFront endpoint that Amazon Cognito set up when you added
  /// the custom domain to your user pool.
  final String cloudFrontDomain;

  UpdateUserPoolDomainResponse({
    this.cloudFrontDomain,
  });
  static UpdateUserPoolDomainResponse fromJson(Map<String, dynamic> json) =>
      UpdateUserPoolDomainResponse();
}

/// Represents the response from the server when you make a request to update
/// the user pool.
class UpdateUserPoolResponse {
  UpdateUserPoolResponse();
  static UpdateUserPoolResponse fromJson(Map<String, dynamic> json) =>
      UpdateUserPoolResponse();
}

/// Contextual data such as the user's device fingerprint, IP address, or
/// location used for evaluating the risk of an unexpected event by Amazon
/// Cognito advanced security.
class UserContextDataType {
  /// Contextual data such as the user's device fingerprint, IP address, or
  /// location used for evaluating the risk of an unexpected event by Amazon
  /// Cognito advanced security.
  final String encodedData;

  UserContextDataType({
    this.encodedData,
  });
}

/// The user import job type.
class UserImportJobType {
  /// The job name for the user import job.
  final String jobName;

  /// The job ID for the user import job.
  final String jobId;

  /// The user pool ID for the user pool that the users are being imported into.
  final String userPoolId;

  /// The pre-signed URL to be used to upload the `.csv` file.
  final String preSignedUrl;

  /// The date the user import job was created.
  final DateTime creationDate;

  /// The date when the user import job was started.
  final DateTime startDate;

  /// The date when the user import job was completed.
  final DateTime completionDate;

  /// The status of the user import job. One of the following:
  ///
  /// *    `Created` - The job was created but not started.
  ///
  /// *    `Pending` - A transition state. You have started the job, but it has
  /// not begun importing users yet.
  ///
  /// *    `InProgress` - The job has started, and users are being imported.
  ///
  /// *    `Stopping` - You have stopped the job, but the job has not stopped
  /// importing users yet.
  ///
  /// *    `Stopped` - You have stopped the job, and the job has stopped
  /// importing users.
  ///
  /// *    `Succeeded` - The job has completed successfully.
  ///
  /// *    `Failed` - The job has stopped due to an error.
  ///
  /// *    `Expired` - You created a job, but did not start the job within 24-48
  /// hours. All data associated with the job was deleted, and the job cannot be
  /// started.
  final String status;

  /// The role ARN for the Amazon CloudWatch Logging role for the user import
  /// job. For more information, see "Creating the CloudWatch Logs IAM Role" in
  /// the Amazon Cognito Developer Guide.
  final String cloudWatchLogsRoleArn;

  /// The number of users that were successfully imported.
  final BigInt importedUsers;

  /// The number of users that were skipped.
  final BigInt skippedUsers;

  /// The number of users that could not be imported.
  final BigInt failedUsers;

  /// The message returned when the user import job is completed.
  final String completionMessage;

  UserImportJobType({
    this.jobName,
    this.jobId,
    this.userPoolId,
    this.preSignedUrl,
    this.creationDate,
    this.startDate,
    this.completionDate,
    this.status,
    this.cloudWatchLogsRoleArn,
    this.importedUsers,
    this.skippedUsers,
    this.failedUsers,
    this.completionMessage,
  });
  static UserImportJobType fromJson(Map<String, dynamic> json) =>
      UserImportJobType();
}

/// The user pool add-ons type.
class UserPoolAddOnsType {
  /// The advanced security mode.
  final String advancedSecurityMode;

  UserPoolAddOnsType({
    @required this.advancedSecurityMode,
  });
  static UserPoolAddOnsType fromJson(Map<String, dynamic> json) =>
      UserPoolAddOnsType();
}

/// The description of the user pool client.
class UserPoolClientDescription {
  /// The ID of the client associated with the user pool.
  final String clientId;

  /// The user pool ID for the user pool where you want to describe the user
  /// pool client.
  final String userPoolId;

  /// The client name from the user pool client description.
  final String clientName;

  UserPoolClientDescription({
    this.clientId,
    this.userPoolId,
    this.clientName,
  });
  static UserPoolClientDescription fromJson(Map<String, dynamic> json) =>
      UserPoolClientDescription();
}

/// Contains information about a user pool client.
class UserPoolClientType {
  /// The user pool ID for the user pool client.
  final String userPoolId;

  /// The client name from the user pool request of the client type.
  final String clientName;

  /// The ID of the client associated with the user pool.
  final String clientId;

  /// The client secret from the user pool request of the client type.
  final String clientSecret;

  /// The date the user pool client was last modified.
  final DateTime lastModifiedDate;

  /// The date the user pool client was created.
  final DateTime creationDate;

  /// The time limit, in days, after which the refresh token is no longer valid
  /// and cannot be used.
  final int refreshTokenValidity;

  /// The Read-only attributes.
  final List<String> readAttributes;

  /// The writeable attributes.
  final List<String> writeAttributes;

  /// The explicit authentication flows.
  final List<String> explicitAuthFlows;

  /// A list of provider names for the identity providers that are supported on
  /// this client.
  final List<String> supportedIdentityProviders;

  /// A list of allowed redirect (callback) URLs for the identity providers.
  ///
  /// A redirect URI must:
  ///
  /// *   Be an absolute URI.
  ///
  /// *   Be registered with the authorization server.
  ///
  /// *   Not include a fragment component.
  ///
  ///
  /// See
  /// [OAuth 2.0 - Redirection Endpoint](https://tools.ietf.org/html/rfc6749#section-3.1.2).
  ///
  /// Amazon Cognito requires HTTPS over HTTP except for http://localhost for
  /// testing purposes only.
  ///
  /// App callback URLs such as myapp://example are also supported.
  final List<String> callbackURLs;

  /// A list of allowed logout URLs for the identity providers.
  final List<String> logoutURLs;

  /// The default redirect URI. Must be in the `CallbackURLs` list.
  ///
  /// A redirect URI must:
  ///
  /// *   Be an absolute URI.
  ///
  /// *   Be registered with the authorization server.
  ///
  /// *   Not include a fragment component.
  ///
  ///
  /// See
  /// [OAuth 2.0 - Redirection Endpoint](https://tools.ietf.org/html/rfc6749#section-3.1.2).
  ///
  /// Amazon Cognito requires HTTPS over HTTP except for http://localhost for
  /// testing purposes only.
  ///
  /// App callback URLs such as myapp://example are also supported.
  final String defaultRedirectUri;

  /// Set to `code` to initiate a code grant flow, which provides an
  /// authorization code as the response. This code can be exchanged for access
  /// tokens with the token endpoint.
  ///
  /// Set to `token` to specify that the client should get the access token
  /// (and, optionally, ID token, based on scopes) directly.
  final List<String> allowedoAuthFlows;

  /// A list of allowed `OAuth` scopes. Currently supported values are
  /// `"phone"`, `"email"`, `"openid"`, and `"Cognito"`.
  final List<String> allowedoAuthScopes;

  /// Set to TRUE if the client is allowed to follow the OAuth protocol when
  /// interacting with Cognito user pools.
  final bool allowedoAuthFlowsUserPoolClient;

  /// The Amazon Pinpoint analytics configuration for the user pool client.
  final AnalyticsConfigurationType analyticsConfiguration;

  UserPoolClientType({
    this.userPoolId,
    this.clientName,
    this.clientId,
    this.clientSecret,
    this.lastModifiedDate,
    this.creationDate,
    this.refreshTokenValidity,
    this.readAttributes,
    this.writeAttributes,
    this.explicitAuthFlows,
    this.supportedIdentityProviders,
    this.callbackURLs,
    this.logoutURLs,
    this.defaultRedirectUri,
    this.allowedoAuthFlows,
    this.allowedoAuthScopes,
    this.allowedoAuthFlowsUserPoolClient,
    this.analyticsConfiguration,
  });
  static UserPoolClientType fromJson(Map<String, dynamic> json) =>
      UserPoolClientType();
}

/// A user pool description.
class UserPoolDescriptionType {
  /// The ID in a user pool description.
  final String id;

  /// The name in a user pool description.
  final String name;

  /// The AWS Lambda configuration information in a user pool description.
  final LambdaConfigType lambdaConfig;

  /// The user pool status in a user pool description.
  final String status;

  /// The date the user pool description was last modified.
  final DateTime lastModifiedDate;

  /// The date the user pool description was created.
  final DateTime creationDate;

  UserPoolDescriptionType({
    this.id,
    this.name,
    this.lambdaConfig,
    this.status,
    this.lastModifiedDate,
    this.creationDate,
  });
  static UserPoolDescriptionType fromJson(Map<String, dynamic> json) =>
      UserPoolDescriptionType();
}

/// The policy associated with a user pool.
class UserPoolPolicyType {
  /// The password policy.
  final PasswordPolicyType passwordPolicy;

  UserPoolPolicyType({
    this.passwordPolicy,
  });
  static UserPoolPolicyType fromJson(Map<String, dynamic> json) =>
      UserPoolPolicyType();
}

/// A container for information about the user pool.
class UserPoolType {
  /// The ID of the user pool.
  final String id;

  /// The name of the user pool.
  final String name;

  /// The policies associated with the user pool.
  final UserPoolPolicyType policies;

  /// The AWS Lambda triggers associated with the user pool.
  final LambdaConfigType lambdaConfig;

  /// The status of a user pool.
  final String status;

  /// The date the user pool was last modified.
  final DateTime lastModifiedDate;

  /// The date the user pool was created.
  final DateTime creationDate;

  /// A container with the schema attributes of a user pool.
  final List<SchemaAttributeType> schemaAttributes;

  /// Specifies the attributes that are auto-verified in a user pool.
  final List<String> autoVerifiedAttributes;

  /// Specifies the attributes that are aliased in a user pool.
  final List<String> aliasAttributes;

  /// Specifies whether email addresses or phone numbers can be specified as
  /// usernames when a user signs up.
  final List<String> usernameAttributes;

  /// The contents of the SMS verification message.
  final String smsVerificationMessage;

  /// The contents of the email verification message.
  final String emailVerificationMessage;

  /// The subject of the email verification message.
  final String emailVerificationSubject;

  /// The template for verification messages.
  final VerificationMessageTemplateType verificationMessageTemplate;

  /// The contents of the SMS authentication message.
  final String smsAuthenticationMessage;

  /// Can be one of the following values:
  ///
  /// *    `OFF` - MFA tokens are not required and cannot be specified during
  /// user registration.
  ///
  /// *    `ON` - MFA tokens are required for all user registrations. You can
  /// only specify required when you are initially creating a user pool.
  ///
  /// *    `OPTIONAL` - Users have the option when registering to create an MFA
  /// token.
  final String mfaConfiguration;

  /// The device configuration.
  final DeviceConfigurationType deviceConfiguration;

  /// A number estimating the size of the user pool.
  final int estimatedNumberOfUsers;

  /// The email configuration.
  final EmailConfigurationType emailConfiguration;

  /// The SMS configuration.
  final SmsConfigurationType smsConfiguration;

  /// The tags that are assigned to the user pool. A tag is a label that you can
  /// apply to user pools to categorize and manage them in different ways, such
  /// as by purpose, owner, environment, or other criteria.
  final Map<String, String> userPoolTags;

  /// The reason why the SMS configuration cannot send the messages to your
  /// users.
  final String smsConfigurationFailure;

  /// The reason why the email configuration cannot send the messages to your
  /// users.
  final String emailConfigurationFailure;

  /// Holds the domain prefix if the user pool has a domain associated with it.
  final String domain;

  /// A custom domain name that you provide to Amazon Cognito. This parameter
  /// applies only if you use a custom domain to host the sign-up and sign-in
  /// pages for your application. For example: `auth.example.com`.
  ///
  /// For more information about adding a custom domain to your user pool, see
  /// [Using Your Own Domain for the Hosted UI](https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-add-custom-domain.html).
  final String customDomain;

  /// The configuration for `AdminCreateUser` requests.
  final AdminCreateUserConfigType adminCreateUserConfig;

  /// The user pool add-ons.
  final UserPoolAddOnsType userPoolAddOns;

  /// The Amazon Resource Name (ARN) for the user pool.
  final String arn;

  UserPoolType({
    this.id,
    this.name,
    this.policies,
    this.lambdaConfig,
    this.status,
    this.lastModifiedDate,
    this.creationDate,
    this.schemaAttributes,
    this.autoVerifiedAttributes,
    this.aliasAttributes,
    this.usernameAttributes,
    this.smsVerificationMessage,
    this.emailVerificationMessage,
    this.emailVerificationSubject,
    this.verificationMessageTemplate,
    this.smsAuthenticationMessage,
    this.mfaConfiguration,
    this.deviceConfiguration,
    this.estimatedNumberOfUsers,
    this.emailConfiguration,
    this.smsConfiguration,
    this.userPoolTags,
    this.smsConfigurationFailure,
    this.emailConfigurationFailure,
    this.domain,
    this.customDomain,
    this.adminCreateUserConfig,
    this.userPoolAddOns,
    this.arn,
  });
  static UserPoolType fromJson(Map<String, dynamic> json) => UserPoolType();
}

/// The user type.
class UserType {
  /// The user name of the user you wish to describe.
  final String username;

  /// A container with information about the user type attributes.
  final List<AttributeType> attributes;

  /// The creation date of the user.
  final DateTime userCreateDate;

  /// The last modified date of the user.
  final DateTime userLastModifiedDate;

  /// Specifies whether the user is enabled.
  final bool enabled;

  /// The user status. Can be one of the following:
  ///
  /// *   UNCONFIRMED - User has been created but not confirmed.
  ///
  /// *   CONFIRMED - User has been confirmed.
  ///
  /// *   ARCHIVED - User is no longer active.
  ///
  /// *   COMPROMISED - User is disabled due to a potential security threat.
  ///
  /// *   UNKNOWN - User status is not known.
  ///
  /// *   RESET_REQUIRED - User is confirmed, but the user must request a code
  /// and reset his or her password before he or she can sign in.
  ///
  /// *   FORCE_CHANGE_PASSWORD - The user is confirmed and the user can sign in
  /// using a temporary password, but on first sign-in, the user must change his
  /// or her password to a new value before doing anything else.
  final String userStatus;

  /// The MFA options for the user.
  final List<MfaOptionType> mfaOptions;

  UserType({
    this.username,
    this.attributes,
    this.userCreateDate,
    this.userLastModifiedDate,
    this.enabled,
    this.userStatus,
    this.mfaOptions,
  });
  static UserType fromJson(Map<String, dynamic> json) => UserType();
}

/// The template for verification messages.
class VerificationMessageTemplateType {
  /// The SMS message template.
  final String smsMessage;

  /// The email message template.
  final String emailMessage;

  /// The subject line for the email message template.
  final String emailSubject;

  /// The email message template for sending a confirmation link to the user.
  final String emailMessageByLink;

  /// The subject line for the email message template for sending a confirmation
  /// link to the user.
  final String emailSubjectByLink;

  /// The default email option.
  final String defaultEmailOption;

  VerificationMessageTemplateType({
    this.smsMessage,
    this.emailMessage,
    this.emailSubject,
    this.emailMessageByLink,
    this.emailSubjectByLink,
    this.defaultEmailOption,
  });
  static VerificationMessageTemplateType fromJson(Map<String, dynamic> json) =>
      VerificationMessageTemplateType();
}

class VerifySoftwareTokenResponse {
  /// The status of the verify software token.
  final String status;

  /// The session which should be passed both ways in challenge-response calls
  /// to the service.
  final String session;

  VerifySoftwareTokenResponse({
    this.status,
    this.session,
  });
  static VerifySoftwareTokenResponse fromJson(Map<String, dynamic> json) =>
      VerifySoftwareTokenResponse();
}

/// A container representing the response from the server from the request to
/// verify user attributes.
class VerifyUserAttributeResponse {
  VerifyUserAttributeResponse();
  static VerifyUserAttributeResponse fromJson(Map<String, dynamic> json) =>
      VerifyUserAttributeResponse();
}
