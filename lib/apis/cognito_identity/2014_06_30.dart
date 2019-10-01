import 'package:meta/meta.dart';

/// Amazon Cognito Federated Identities
///
/// Amazon Cognito Federated Identities is a web service that delivers scoped
/// temporary credentials to mobile devices and other untrusted environments. It
/// uniquely identifies a device and supplies the user with a consistent
/// identity over the lifetime of an application.
///
/// Using Amazon Cognito Federated Identities, you can enable authentication
/// with one or more third-party identity providers (Facebook, Google, or Login
/// with Amazon) or an Amazon Cognito user pool, and you can also choose to
/// support unauthenticated access from your app. Cognito delivers a unique
/// identifier for each user and acts as an OpenID token provider trusted by AWS
/// Security Token Service (STS) to access temporary, limited-privilege AWS
/// credentials.
///
/// For a description of the authentication flow from the Amazon Cognito
/// Developer Guide see [Authentication
/// Flow](https://docs.aws.amazon.com/cognito/latest/developerguide/authentication-flow.html).
///
/// For more information see [Amazon Cognito Federated
/// Identities](https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-identity.html).
class CognitoIdentityApi {
  /// Creates a new identity pool. The identity pool is a store of user identity
  /// information that is specific to your AWS account. The limit on identity
  /// pools is 60 per account. The keys for `SupportedLoginProviders` are as
  /// follows:
  ///
  /// *   Facebook: `graph.facebook.com`
  ///
  /// *   Google: `accounts.google.com`
  ///
  /// *   Amazon: `www.amazon.com`
  ///
  /// *   Twitter: `api.twitter.com`
  ///
  /// *   Digits: `www.digits.com`
  ///
  ///
  /// You must use AWS Developer credentials to call this API.
  ///
  /// [identityPoolName]: A string that you provide.
  ///
  /// [allowUnauthenticatedIdentities]: TRUE if the identity pool supports
  /// unauthenticated logins.
  ///
  /// [supportedLoginProviders]: Optional key:value pairs mapping provider names
  /// to provider app IDs.
  ///
  /// [developerProviderName]: The "domain" by which Cognito will refer to your
  /// users. This name acts as a placeholder that allows your backend and the
  /// Cognito service to communicate about the developer provider. For the
  /// `DeveloperProviderName`, you can use letters as well as period (`.`),
  /// underscore (`_`), and dash (`-`).
  ///
  /// Once you have set a developer provider name, you cannot change it. Please
  /// take care in setting this parameter.
  ///
  /// [openIdConnectProviderARNs]: A list of OpendID Connect provider ARNs.
  ///
  /// [cognitoIdentityProviders]: An array of Amazon Cognito user pools and
  /// their client IDs.
  ///
  /// [samlProviderARNs]: An array of Amazon Resource Names (ARNs) of the SAML
  /// provider for your identity pool.
  ///
  /// [identityPoolTags]: Tags to assign to the identity pool. A tag is a label
  /// that you can apply to identity pools to categorize and manage them in
  /// different ways, such as by purpose, owner, environment, or other criteria.
  Future<IdentityPool> createIdentityPool(
      {@required String identityPoolName,
      @required bool allowUnauthenticatedIdentities,
      Map<String, String> supportedLoginProviders,
      String developerProviderName,
      List<String> openIdConnectProviderARNs,
      List<CognitoIdentityProvider> cognitoIdentityProviders,
      List<String> samlProviderARNs,
      Map<String, String> identityPoolTags}) async {
    return IdentityPool.fromJson({});
  }

  /// Deletes identities from an identity pool. You can specify a list of 1-60
  /// identities that you want to delete.
  ///
  /// You must use AWS Developer credentials to call this API.
  ///
  /// [identityIdsToDelete]: A list of 1-60 identities that you want to delete.
  Future<DeleteIdentitiesResponse> deleteIdentities(
      List<String> identityIdsToDelete) async {
    return DeleteIdentitiesResponse.fromJson({});
  }

  /// Deletes an identity pool. Once a pool is deleted, users will not be able
  /// to authenticate with the pool.
  ///
  /// You must use AWS Developer credentials to call this API.
  ///
  /// [identityPoolId]: An identity pool ID in the format REGION:GUID.
  Future<void> deleteIdentityPool(String identityPoolId) async {}

  /// Returns metadata related to the given identity, including when the
  /// identity was created and any associated linked logins.
  ///
  /// You must use AWS Developer credentials to call this API.
  ///
  /// [identityId]: A unique identifier in the format REGION:GUID.
  Future<IdentityDescription> describeIdentity(String identityId) async {
    return IdentityDescription.fromJson({});
  }

  /// Gets details about a particular identity pool, including the pool name, ID
  /// description, creation date, and current number of users.
  ///
  /// You must use AWS Developer credentials to call this API.
  ///
  /// [identityPoolId]: An identity pool ID in the format REGION:GUID.
  Future<IdentityPool> describeIdentityPool(String identityPoolId) async {
    return IdentityPool.fromJson({});
  }

  /// Returns credentials for the provided identity ID. Any provided logins will
  /// be validated against supported login providers. If the token is for
  /// cognito-identity.amazonaws.com, it will be passed through to AWS Security
  /// Token Service with the appropriate role for the token.
  ///
  /// This is a public API. You do not need any credentials to call this API.
  ///
  /// [identityId]: A unique identifier in the format REGION:GUID.
  ///
  /// [logins]: A set of optional name-value pairs that map provider names to
  /// provider tokens. The name-value pair will follow the syntax
  /// "provider\_name": "provider\_user_identifier".
  ///
  /// Logins should not be specified when trying to get credentials for an
  /// unauthenticated identity.
  ///
  /// The Logins parameter is required when using identities associated with
  /// external identity providers such as FaceBook. For examples of `Logins`
  /// maps, see the code examples in the [External Identity
  /// Providers](http://docs.aws.amazon.com/cognito/latest/developerguide/external-identity-providers.html)
  /// section of the Amazon Cognito Developer Guide.
  ///
  /// [customRoleArn]: The Amazon Resource Name (ARN) of the role to be assumed
  /// when multiple roles were received in the token from the identity provider.
  /// For example, a SAML-based identity provider. This parameter is optional
  /// for identity providers that do not support role customization.
  Future<GetCredentialsForIdentityResponse> getCredentialsForIdentity(
      String identityId,
      {Map<String, String> logins,
      String customRoleArn}) async {
    return GetCredentialsForIdentityResponse.fromJson({});
  }

  /// Generates (or retrieves) a Cognito ID. Supplying multiple logins will
  /// create an implicit linked account.
  ///
  /// This is a public API. You do not need any credentials to call this API.
  ///
  /// [accountId]: A standard AWS account ID (9+ digits).
  ///
  /// [identityPoolId]: An identity pool ID in the format REGION:GUID.
  ///
  /// [logins]: A set of optional name-value pairs that map provider names to
  /// provider tokens. The available provider names for `Logins` are as follows:
  ///
  /// *   Facebook: `graph.facebook.com`
  ///
  /// *   Amazon Cognito user pool:
  /// `cognito-idp.<region>.amazonaws.com/<YOUR\_USER\_POOL_ID>`, for example,
  /// `cognito-idp.us-east-1.amazonaws.com/us-east-1_123456789`.
  ///
  /// *   Google: `accounts.google.com`
  ///
  /// *   Amazon: `www.amazon.com`
  ///
  /// *   Twitter: `api.twitter.com`
  ///
  /// *   Digits: `www.digits.com`
  Future<GetIdResponse> getId(String identityPoolId,
      {String accountId, Map<String, String> logins}) async {
    return GetIdResponse.fromJson({});
  }

  /// Gets the roles for an identity pool.
  ///
  /// You must use AWS Developer credentials to call this API.
  ///
  /// [identityPoolId]: An identity pool ID in the format REGION:GUID.
  Future<GetIdentityPoolRolesResponse> getIdentityPoolRoles(
      String identityPoolId) async {
    return GetIdentityPoolRolesResponse.fromJson({});
  }

  /// Gets an OpenID token, using a known Cognito ID. This known Cognito ID is
  /// returned by GetId. You can optionally add additional logins for the
  /// identity. Supplying multiple logins creates an implicit link.
  ///
  /// The OpenId token is valid for 10 minutes.
  ///
  /// This is a public API. You do not need any credentials to call this API.
  ///
  /// [identityId]: A unique identifier in the format REGION:GUID.
  ///
  /// [logins]: A set of optional name-value pairs that map provider names to
  /// provider tokens. When using graph.facebook.com and www.amazon.com, supply
  /// the access_token returned from the provider's authflow. For
  /// accounts.google.com, an Amazon Cognito user pool provider, or any other
  /// OpenId Connect provider, always include the `id_token`.
  Future<GetOpenIdTokenResponse> getOpenIdToken(String identityId,
      {Map<String, String> logins}) async {
    return GetOpenIdTokenResponse.fromJson({});
  }

  /// Registers (or retrieves) a Cognito `IdentityId` and an OpenID Connect
  /// token for a user authenticated by your backend authentication process.
  /// Supplying multiple logins will create an implicit linked account. You can
  /// only specify one developer provider as part of the `Logins` map, which is
  /// linked to the identity pool. The developer provider is the "domain" by
  /// which Cognito will refer to your users.
  ///
  /// You can use `GetOpenIdTokenForDeveloperIdentity` to create a new identity
  /// and to link new logins (that is, user credentials issued by a public
  /// provider or developer provider) to an existing identity. When you want to
  /// create a new identity, the `IdentityId` should be null. When you want to
  /// associate a new login with an existing authenticated/unauthenticated
  /// identity, you can do so by providing the existing `IdentityId`. This API
  /// will create the identity in the specified `IdentityPoolId`.
  ///
  /// You must use AWS Developer credentials to call this API.
  ///
  /// [identityPoolId]: An identity pool ID in the format REGION:GUID.
  ///
  /// [identityId]: A unique identifier in the format REGION:GUID.
  ///
  /// [logins]: A set of optional name-value pairs that map provider names to
  /// provider tokens. Each name-value pair represents a user from a public
  /// provider or developer provider. If the user is from a developer provider,
  /// the name-value pair will follow the syntax `"developer\_provider\_name":
  /// "developer\_user\_identifier"`. The developer provider is the "domain" by
  /// which Cognito will refer to your users; you provided this domain while
  /// creating/updating the identity pool. The developer user identifier is an
  /// identifier from your backend that uniquely identifies a user. When you
  /// create an identity pool, you can specify the supported logins.
  ///
  /// [tokenDuration]: The expiration time of the token, in seconds. You can
  /// specify a custom expiration time for the token so that you can cache it.
  /// If you don't provide an expiration time, the token is valid for 15
  /// minutes. You can exchange the token with Amazon STS for temporary AWS
  /// credentials, which are valid for a maximum of one hour. The maximum token
  /// duration you can set is 24 hours. You should take care in setting the
  /// expiration time for a token, as there are significant security
  /// implications: an attacker could use a leaked token to access your AWS
  /// resources for the token's duration.
  Future<GetOpenIdTokenForDeveloperIdentityResponse>
      getOpenIdTokenForDeveloperIdentity(
          {@required String identityPoolId,
          String identityId,
          @required Map<String, String> logins,
          BigInt tokenDuration}) async {
    return GetOpenIdTokenForDeveloperIdentityResponse.fromJson({});
  }

  /// Lists the identities in an identity pool.
  ///
  /// You must use AWS Developer credentials to call this API.
  ///
  /// [identityPoolId]: An identity pool ID in the format REGION:GUID.
  ///
  /// [maxResults]: The maximum number of identities to return.
  ///
  /// [nextToken]: A pagination token.
  ///
  /// [hideDisabled]: An optional boolean parameter that allows you to hide
  /// disabled identities. If omitted, the ListIdentities API will include
  /// disabled identities in the response.
  Future<ListIdentitiesResponse> listIdentities(
      {@required String identityPoolId,
      @required int maxResults,
      String nextToken,
      bool hideDisabled}) async {
    return ListIdentitiesResponse.fromJson({});
  }

  /// Lists all of the Cognito identity pools registered for your account.
  ///
  /// You must use AWS Developer credentials to call this API.
  ///
  /// [maxResults]: The maximum number of identities to return.
  ///
  /// [nextToken]: A pagination token.
  Future<ListIdentityPoolsResponse> listIdentityPools(int maxResults,
      {String nextToken}) async {
    return ListIdentityPoolsResponse.fromJson({});
  }

  /// Lists the tags that are assigned to an Amazon Cognito identity pool.
  ///
  /// A tag is a label that you can apply to identity pools to categorize and
  /// manage them in different ways, such as by purpose, owner, environment, or
  /// other criteria.
  ///
  /// You can use this action up to 10 times per second, per account.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the identity pool that
  /// the tags are assigned to.
  Future<ListTagsForResourceResponse> listTagsForResource(
      String resourceArn) async {
    return ListTagsForResourceResponse.fromJson({});
  }

  /// Retrieves the `IdentityID` associated with a `DeveloperUserIdentifier` or
  /// the list of `DeveloperUserIdentifier` values associated with an
  /// `IdentityId` for an existing identity. Either `IdentityID` or
  /// `DeveloperUserIdentifier` must not be null. If you supply only one of
  /// these values, the other value will be searched in the database and
  /// returned as a part of the response. If you supply both,
  /// `DeveloperUserIdentifier` will be matched against `IdentityID`. If the
  /// values are verified against the database, the response returns both values
  /// and is the same as the request. Otherwise a `ResourceConflictException` is
  /// thrown.
  ///
  ///  `LookupDeveloperIdentity` is intended for low-throughput control plane
  /// operations: for example, to enable customer service to locate an identity
  /// ID by username. If you are using it for higher-volume operations such as
  /// user authentication, your requests are likely to be throttled.
  /// GetOpenIdTokenForDeveloperIdentity is a better option for higher-volume
  /// operations for user authentication.
  ///
  /// You must use AWS Developer credentials to call this API.
  ///
  /// [identityPoolId]: An identity pool ID in the format REGION:GUID.
  ///
  /// [identityId]: A unique identifier in the format REGION:GUID.
  ///
  /// [developerUserIdentifier]: A unique ID used by your backend authentication
  /// process to identify a user. Typically, a developer identity provider would
  /// issue many developer user identifiers, in keeping with the number of
  /// users.
  ///
  /// [maxResults]: The maximum number of identities to return.
  ///
  /// [nextToken]: A pagination token. The first call you make will have
  /// `NextToken` set to null. After that the service will return `NextToken`
  /// values as needed. For example, let's say you make a request with
  /// `MaxResults` set to 10, and there are 20 matches in the database. The
  /// service will return a pagination token as a part of the response. This
  /// token can be used to call the API again and get results starting from the
  /// 11th match.
  Future<LookupDeveloperIdentityResponse> lookupDeveloperIdentity(
      String identityPoolId,
      {String identityId,
      String developerUserIdentifier,
      int maxResults,
      String nextToken}) async {
    return LookupDeveloperIdentityResponse.fromJson({});
  }

  /// Merges two users having different `IdentityId`s, existing in the same
  /// identity pool, and identified by the same developer provider. You can use
  /// this action to request that discrete users be merged and identified as a
  /// single user in the Cognito environment. Cognito associates the given
  /// source user (`SourceUserIdentifier`) with the `IdentityId` of the
  /// `DestinationUserIdentifier`. Only developer-authenticated users can be
  /// merged. If the users to be merged are associated with the same public
  /// provider, but as two different users, an exception will be thrown.
  ///
  /// The number of linked logins is limited to 20. So, the number of linked
  /// logins for the source user, `SourceUserIdentifier`, and the destination
  /// user, `DestinationUserIdentifier`, together should not be larger than 20.
  /// Otherwise, an exception will be thrown.
  ///
  /// You must use AWS Developer credentials to call this API.
  ///
  /// [sourceUserIdentifier]: User identifier for the source user. The value
  /// should be a `DeveloperUserIdentifier`.
  ///
  /// [destinationUserIdentifier]: User identifier for the destination user. The
  /// value should be a `DeveloperUserIdentifier`.
  ///
  /// [developerProviderName]: The "domain" by which Cognito will refer to your
  /// users. This is a (pseudo) domain name that you provide while creating an
  /// identity pool. This name acts as a placeholder that allows your backend
  /// and the Cognito service to communicate about the developer provider. For
  /// the `DeveloperProviderName`, you can use letters as well as period (.),
  /// underscore (_), and dash (-).
  ///
  /// [identityPoolId]: An identity pool ID in the format REGION:GUID.
  Future<MergeDeveloperIdentitiesResponse> mergeDeveloperIdentities(
      {@required String sourceUserIdentifier,
      @required String destinationUserIdentifier,
      @required String developerProviderName,
      @required String identityPoolId}) async {
    return MergeDeveloperIdentitiesResponse.fromJson({});
  }

  /// Sets the roles for an identity pool. These roles are used when making
  /// calls to GetCredentialsForIdentity action.
  ///
  /// You must use AWS Developer credentials to call this API.
  ///
  /// [identityPoolId]: An identity pool ID in the format REGION:GUID.
  ///
  /// [roles]: The map of roles associated with this pool. For a given role, the
  /// key will be either "authenticated" or "unauthenticated" and the value will
  /// be the Role ARN.
  ///
  /// [roleMappings]: How users for a specific identity provider are to mapped
  /// to roles. This is a string to RoleMapping object map. The string
  /// identifies the identity provider, for example, "graph.facebook.com" or
  /// "cognito-idp-east-1.amazonaws.com/us-east-1\_abcdefghi:app\_client_id".
  ///
  /// Up to 25 rules can be specified per identity provider.
  Future<void> setIdentityPoolRoles(
      {@required String identityPoolId,
      @required Map<String, String> roles,
      Map<String, RoleMapping> roleMappings}) async {}

  /// Assigns a set of tags to an Amazon Cognito identity pool. A tag is a label
  /// that you can use to categorize and manage identity pools in different
  /// ways, such as by purpose, owner, environment, or other criteria.
  ///
  /// Each tag consists of a key and value, both of which you define. A key is a
  /// general category for more specific values. For example, if you have two
  /// versions of an identity pool, one for testing and another for production,
  /// you might assign an `Environment` tag key to both identity pools. The
  /// value of this key might be `Test` for one identity pool and `Production`
  /// for the other.
  ///
  /// Tags are useful for cost tracking and access control. You can activate
  /// your tags so that they appear on the Billing and Cost Management console,
  /// where you can track the costs associated with your identity pools. In an
  /// IAM policy, you can constrain permissions for identity pools based on
  /// specific tags or tag values.
  ///
  /// You can use this action up to 5 times per second, per account. An identity
  /// pool can have as many as 50 tags.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the identity pool to
  /// assign the tags to.
  ///
  /// [tags]: The tags to assign to the identity pool.
  Future<TagResourceResponse> tagResource(String resourceArn,
      {Map<String, String> tags}) async {
    return TagResourceResponse.fromJson({});
  }

  /// Unlinks a `DeveloperUserIdentifier` from an existing identity. Unlinked
  /// developer users will be considered new identities next time they are seen.
  /// If, for a given Cognito identity, you remove all federated identities as
  /// well as the developer user identifier, the Cognito identity becomes
  /// inaccessible.
  ///
  /// You must use AWS Developer credentials to call this API.
  ///
  /// [identityId]: A unique identifier in the format REGION:GUID.
  ///
  /// [identityPoolId]: An identity pool ID in the format REGION:GUID.
  ///
  /// [developerProviderName]: The "domain" by which Cognito will refer to your
  /// users.
  ///
  /// [developerUserIdentifier]: A unique ID used by your backend authentication
  /// process to identify a user.
  Future<void> unlinkDeveloperIdentity(
      {@required String identityId,
      @required String identityPoolId,
      @required String developerProviderName,
      @required String developerUserIdentifier}) async {}

  /// Unlinks a federated identity from an existing account. Unlinked logins
  /// will be considered new identities next time they are seen. Removing the
  /// last linked login will make this identity inaccessible.
  ///
  /// This is a public API. You do not need any credentials to call this API.
  ///
  /// [identityId]: A unique identifier in the format REGION:GUID.
  ///
  /// [logins]: A set of optional name-value pairs that map provider names to
  /// provider tokens.
  ///
  /// [loginsToRemove]: Provider names to unlink from this identity.
  Future<void> unlinkIdentity(
      {@required String identityId,
      @required Map<String, String> logins,
      @required List<String> loginsToRemove}) async {}

  /// Removes the specified tags from an Amazon Cognito identity pool. You can
  /// use this action up to 5 times per second, per account
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the identity pool that
  /// the tags are assigned to.
  ///
  /// [tagKeys]: The keys of the tags to remove from the user pool.
  Future<UntagResourceResponse> untagResource(String resourceArn,
      {List<String> tagKeys}) async {
    return UntagResourceResponse.fromJson({});
  }

  /// Updates an identity pool.
  ///
  /// You must use AWS Developer credentials to call this API.
  ///
  /// [identityPoolId]: An identity pool ID in the format REGION:GUID.
  ///
  /// [identityPoolName]: A string that you provide.
  ///
  /// [allowUnauthenticatedIdentities]: TRUE if the identity pool supports
  /// unauthenticated logins.
  ///
  /// [supportedLoginProviders]: Optional key:value pairs mapping provider names
  /// to provider app IDs.
  ///
  /// [developerProviderName]: The "domain" by which Cognito will refer to your
  /// users.
  ///
  /// [openIdConnectProviderARNs]: A list of OpendID Connect provider ARNs.
  ///
  /// [cognitoIdentityProviders]: A list representing an Amazon Cognito user
  /// pool and its client ID.
  ///
  /// [samlProviderARNs]: An array of Amazon Resource Names (ARNs) of the SAML
  /// provider for your identity pool.
  ///
  /// [identityPoolTags]: The tags that are assigned to the identity pool. A tag
  /// is a label that you can apply to identity pools to categorize and manage
  /// them in different ways, such as by purpose, owner, environment, or other
  /// criteria.
  Future<IdentityPool> updateIdentityPool(
      {@required String identityPoolId,
      @required String identityPoolName,
      @required bool allowUnauthenticatedIdentities,
      Map<String, String> supportedLoginProviders,
      String developerProviderName,
      List<String> openIdConnectProviderARNs,
      List<CognitoIdentityProvider> cognitoIdentityProviders,
      List<String> samlProviderARNs,
      Map<String, String> identityPoolTags}) async {
    return IdentityPool.fromJson({});
  }
}

class CognitoIdentityProvider {
  /// The provider name for an Amazon Cognito user pool. For example,
  /// `cognito-idp.us-east-1.amazonaws.com/us-east-1_123456789`.
  final String providerName;

  /// The client ID for the Amazon Cognito user pool.
  final String clientId;

  /// TRUE if server-side token validation is enabled for the identity
  /// provider’s token.
  ///
  /// Once you set `ServerSideTokenCheck` to TRUE for an identity pool, that
  /// identity pool will check with the integrated user pools to make sure that
  /// the user has not been globally signed out or deleted before the identity
  /// pool provides an OIDC token or AWS credentials for the user.
  ///
  /// If the user is signed out or deleted, the identity pool will return a 400
  /// Not Authorized error.
  final bool serverSideTokenCheck;

  CognitoIdentityProvider({
    this.providerName,
    this.clientId,
    this.serverSideTokenCheck,
  });
  static CognitoIdentityProvider fromJson(Map<String, dynamic> json) =>
      CognitoIdentityProvider();
}

class Credentials {
  /// The Access Key portion of the credentials.
  final String accessKeyId;

  /// The Secret Access Key portion of the credentials
  final String secretKey;

  /// The Session Token portion of the credentials
  final String sessionToken;

  /// The date at which these credentials will expire.
  final DateTime expiration;

  Credentials({
    this.accessKeyId,
    this.secretKey,
    this.sessionToken,
    this.expiration,
  });
  static Credentials fromJson(Map<String, dynamic> json) => Credentials();
}

class DeleteIdentitiesResponse {
  /// An array of UnprocessedIdentityId objects, each of which contains an
  /// ErrorCode and IdentityId.
  final List<UnprocessedIdentityId> unprocessedIdentityIds;

  DeleteIdentitiesResponse({
    this.unprocessedIdentityIds,
  });
  static DeleteIdentitiesResponse fromJson(Map<String, dynamic> json) =>
      DeleteIdentitiesResponse();
}

class GetCredentialsForIdentityResponse {
  /// A unique identifier in the format REGION:GUID.
  final String identityId;

  /// Credentials for the provided identity ID.
  final Credentials credentials;

  GetCredentialsForIdentityResponse({
    this.identityId,
    this.credentials,
  });
  static GetCredentialsForIdentityResponse fromJson(
          Map<String, dynamic> json) =>
      GetCredentialsForIdentityResponse();
}

class GetIdResponse {
  /// A unique identifier in the format REGION:GUID.
  final String identityId;

  GetIdResponse({
    this.identityId,
  });
  static GetIdResponse fromJson(Map<String, dynamic> json) => GetIdResponse();
}

class GetIdentityPoolRolesResponse {
  /// An identity pool ID in the format REGION:GUID.
  final String identityPoolId;

  /// The map of roles associated with this pool. Currently only authenticated
  /// and unauthenticated roles are supported.
  final Map<String, String> roles;

  /// How users for a specific identity provider are to mapped to roles. This is
  /// a String-to-RoleMapping object map. The string identifies the identity
  /// provider, for example, "graph.facebook.com" or
  /// "cognito-idp.us-east-1.amazonaws.com/us-east-1\_abcdefghi:app\_client_id".
  final Map<String, RoleMapping> roleMappings;

  GetIdentityPoolRolesResponse({
    this.identityPoolId,
    this.roles,
    this.roleMappings,
  });
  static GetIdentityPoolRolesResponse fromJson(Map<String, dynamic> json) =>
      GetIdentityPoolRolesResponse();
}

class GetOpenIdTokenForDeveloperIdentityResponse {
  /// A unique identifier in the format REGION:GUID.
  final String identityId;

  /// An OpenID token.
  final String token;

  GetOpenIdTokenForDeveloperIdentityResponse({
    this.identityId,
    this.token,
  });
  static GetOpenIdTokenForDeveloperIdentityResponse fromJson(
          Map<String, dynamic> json) =>
      GetOpenIdTokenForDeveloperIdentityResponse();
}

class GetOpenIdTokenResponse {
  /// A unique identifier in the format REGION:GUID. Note that the IdentityId
  /// returned may not match the one passed on input.
  final String identityId;

  /// An OpenID token, valid for 10 minutes.
  final String token;

  GetOpenIdTokenResponse({
    this.identityId,
    this.token,
  });
  static GetOpenIdTokenResponse fromJson(Map<String, dynamic> json) =>
      GetOpenIdTokenResponse();
}

class IdentityDescription {
  /// A unique identifier in the format REGION:GUID.
  final String identityId;

  /// The provider names.
  final List<String> logins;

  /// Date on which the identity was created.
  final DateTime creationDate;

  /// Date on which the identity was last modified.
  final DateTime lastModifiedDate;

  IdentityDescription({
    this.identityId,
    this.logins,
    this.creationDate,
    this.lastModifiedDate,
  });
  static IdentityDescription fromJson(Map<String, dynamic> json) =>
      IdentityDescription();
}

class IdentityPool {
  /// An identity pool ID in the format REGION:GUID.
  final String identityPoolId;

  /// A string that you provide.
  final String identityPoolName;

  /// TRUE if the identity pool supports unauthenticated logins.
  final bool allowUnauthenticatedIdentities;

  /// Optional key:value pairs mapping provider names to provider app IDs.
  final Map<String, String> supportedLoginProviders;

  /// The "domain" by which Cognito will refer to your users.
  final String developerProviderName;

  /// A list of OpendID Connect provider ARNs.
  final List<String> openIdConnectProviderARNs;

  /// A list representing an Amazon Cognito user pool and its client ID.
  final List<CognitoIdentityProvider> cognitoIdentityProviders;

  /// An array of Amazon Resource Names (ARNs) of the SAML provider for your
  /// identity pool.
  final List<String> samlProviderARNs;

  /// The tags that are assigned to the identity pool. A tag is a label that you
  /// can apply to identity pools to categorize and manage them in different
  /// ways, such as by purpose, owner, environment, or other criteria.
  final Map<String, String> identityPoolTags;

  IdentityPool({
    @required this.identityPoolId,
    @required this.identityPoolName,
    @required this.allowUnauthenticatedIdentities,
    this.supportedLoginProviders,
    this.developerProviderName,
    this.openIdConnectProviderARNs,
    this.cognitoIdentityProviders,
    this.samlProviderARNs,
    this.identityPoolTags,
  });
  static IdentityPool fromJson(Map<String, dynamic> json) => IdentityPool();
}

class IdentityPoolShortDescription {
  /// An identity pool ID in the format REGION:GUID.
  final String identityPoolId;

  /// A string that you provide.
  final String identityPoolName;

  IdentityPoolShortDescription({
    this.identityPoolId,
    this.identityPoolName,
  });
  static IdentityPoolShortDescription fromJson(Map<String, dynamic> json) =>
      IdentityPoolShortDescription();
}

class ListIdentitiesResponse {
  /// An identity pool ID in the format REGION:GUID.
  final String identityPoolId;

  /// An object containing a set of identities and associated mappings.
  final List<IdentityDescription> identities;

  /// A pagination token.
  final String nextToken;

  ListIdentitiesResponse({
    this.identityPoolId,
    this.identities,
    this.nextToken,
  });
  static ListIdentitiesResponse fromJson(Map<String, dynamic> json) =>
      ListIdentitiesResponse();
}

class ListIdentityPoolsResponse {
  /// The identity pools returned by the ListIdentityPools action.
  final List<IdentityPoolShortDescription> identityPools;

  /// A pagination token.
  final String nextToken;

  ListIdentityPoolsResponse({
    this.identityPools,
    this.nextToken,
  });
  static ListIdentityPoolsResponse fromJson(Map<String, dynamic> json) =>
      ListIdentityPoolsResponse();
}

class ListTagsForResourceResponse {
  /// The tags that are assigned to the identity pool.
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  static ListTagsForResourceResponse fromJson(Map<String, dynamic> json) =>
      ListTagsForResourceResponse();
}

class LookupDeveloperIdentityResponse {
  /// A unique identifier in the format REGION:GUID.
  final String identityId;

  /// This is the list of developer user identifiers associated with an identity
  /// ID. Cognito supports the association of multiple developer user
  /// identifiers with an identity ID.
  final List<String> developerUserIdentifierList;

  /// A pagination token. The first call you make will have `NextToken` set to
  /// null. After that the service will return `NextToken` values as needed. For
  /// example, let's say you make a request with `MaxResults` set to 10, and
  /// there are 20 matches in the database. The service will return a pagination
  /// token as a part of the response. This token can be used to call the API
  /// again and get results starting from the 11th match.
  final String nextToken;

  LookupDeveloperIdentityResponse({
    this.identityId,
    this.developerUserIdentifierList,
    this.nextToken,
  });
  static LookupDeveloperIdentityResponse fromJson(Map<String, dynamic> json) =>
      LookupDeveloperIdentityResponse();
}

class MappingRule {
  /// The claim name that must be present in the token, for example, "isAdmin"
  /// or "paid".
  final String claim;

  /// The match condition that specifies how closely the claim value in the IdP
  /// token must match `Value`.
  final String matchType;

  /// A brief string that the claim must match, for example, "paid" or "yes".
  final String value;

  /// The role ARN.
  final String roleArn;

  MappingRule({
    @required this.claim,
    @required this.matchType,
    @required this.value,
    @required this.roleArn,
  });
  static MappingRule fromJson(Map<String, dynamic> json) => MappingRule();
}

class MergeDeveloperIdentitiesResponse {
  /// A unique identifier in the format REGION:GUID.
  final String identityId;

  MergeDeveloperIdentitiesResponse({
    this.identityId,
  });
  static MergeDeveloperIdentitiesResponse fromJson(Map<String, dynamic> json) =>
      MergeDeveloperIdentitiesResponse();
}

class RoleMapping {
  /// The role mapping type. Token will use `cognito:roles` and
  /// `cognito:preferred_role` claims from the Cognito identity provider token
  /// to map groups to roles. Rules will attempt to match claims from the token
  /// to map to a role.
  final String type;

  /// If you specify Token or Rules as the `Type`, `AmbiguousRoleResolution` is
  /// required.
  ///
  /// Specifies the action to be taken if either no rules match the claim value
  /// for the `Rules` type, or there is no `cognito:preferred_role` claim and
  /// there are multiple `cognito:roles` matches for the `Token` type.
  final String ambiguousRoleResolution;

  /// The rules to be used for mapping users to roles.
  ///
  /// If you specify Rules as the role mapping type, `RulesConfiguration` is
  /// required.
  final RulesConfigurationType rulesConfiguration;

  RoleMapping({
    @required this.type,
    this.ambiguousRoleResolution,
    this.rulesConfiguration,
  });
  static RoleMapping fromJson(Map<String, dynamic> json) => RoleMapping();
}

class RulesConfigurationType {
  /// An array of rules. You can specify up to 25 rules per identity provider.
  ///
  /// Rules are evaluated in order. The first one to match specifies the role.
  final List<MappingRule> rules;

  RulesConfigurationType({
    @required this.rules,
  });
  static RulesConfigurationType fromJson(Map<String, dynamic> json) =>
      RulesConfigurationType();
}

class TagResourceResponse {
  TagResourceResponse();
  static TagResourceResponse fromJson(Map<String, dynamic> json) =>
      TagResourceResponse();
}

class UnprocessedIdentityId {
  /// A unique identifier in the format REGION:GUID.
  final String identityId;

  /// The error code indicating the type of error that occurred.
  final String errorCode;

  UnprocessedIdentityId({
    this.identityId,
    this.errorCode,
  });
  static UnprocessedIdentityId fromJson(Map<String, dynamic> json) =>
      UnprocessedIdentityId();
}

class UntagResourceResponse {
  UntagResourceResponse();
  static UntagResourceResponse fromJson(Map<String, dynamic> json) =>
      UntagResourceResponse();
}
