import 'package:meta/meta.dart';
import 'dart:typed_data';

/// AWS Identity and Access Management
///
/// AWS Identity and Access Management (IAM) is a web service that you can use
/// to manage users and user permissions under your AWS account. This guide
/// provides descriptions of IAM actions that you can call programmatically. For
/// general information about IAM, see [AWS Identity and Access Management
/// (IAM)](http://aws.amazon.com/iam/). For the user guide for IAM, see [Using
/// IAM](https://docs.aws.amazon.com/IAM/latest/UserGuide/).
///
///  AWS provides SDKs that consist of libraries and sample code for various
/// programming languages and platforms (Java, Ruby, .NET, iOS, Android, etc.).
/// The SDKs provide a convenient way to create programmatic access to IAM and
/// AWS. For example, the SDKs take care of tasks such as cryptographically
/// signing requests (see below), managing errors, and retrying requests
/// automatically. For information about the AWS SDKs, including how to download
/// and install them, see the [Tools for Amazon Web
/// Services](http://aws.amazon.com/tools/) page.
///
/// We recommend that you use the AWS SDKs to make programmatic API calls to
/// IAM. However, you can also use the IAM Query API to make direct calls to the
/// IAM web service. To learn more about the IAM Query API, see [Making Query
/// Requests](https://docs.aws.amazon.com/IAM/latest/UserGuide/IAM_UsingQueryAPI.html)
/// in the _Using IAM_ guide. IAM supports GET and POST requests for all
/// actions. That is, the API does not require you to use GET for some actions
/// and POST for others. However, GET requests are subject to the limitation
/// size of a URL. Therefore, for operations that require larger sizes, use a
/// POST request.
///
///  **Signing Requests**
///
/// Requests must be signed using an access key ID and a secret access key. We
/// strongly recommend that you do not use your AWS account access key ID and
/// secret access key for everyday work with IAM. You can use the access key ID
/// and secret access key for an IAM user or you can use the AWS Security Token
/// Service to generate temporary security credentials and use those to sign
/// requests.
///
/// To sign requests, we recommend that you use [Signature Version
/// 4](https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html).
/// If you have an existing application that uses Signature Version 2, you do
/// not have to update it to use Signature Version 4. However, some operations
/// now require Signature Version 4. The documentation for operations that
/// require version 4 indicate this requirement.
///
///  **Additional Resources**
///
/// For more information, see the following:
///
/// *    [AWS Security
/// Credentials](https://docs.aws.amazon.com/general/latest/gr/aws-security-credentials.html).
/// This topic provides general information about the types of credentials used
/// for accessing AWS.
///
/// *    [IAM Best
/// Practices](https://docs.aws.amazon.com/IAM/latest/UserGuide/IAMBestPractices.html).
/// This topic presents a list of suggestions for using the IAM service to help
/// secure your AWS resources.
///
/// *    [Signing AWS API
/// Requests](https://docs.aws.amazon.com/general/latest/gr/signing_aws_api_requests.html).
/// This set of topics walk you through the process of signing a request using
/// an access key ID and secret access key.
class IamApi {
  /// Adds a new client ID (also known as audience) to the list of client IDs
  /// already registered for the specified IAM OpenID Connect (OIDC) provider
  /// resource.
  ///
  /// This operation is idempotent; it does not fail or return an error if you
  /// add an existing client ID to the provider.
  ///
  /// [openIDConnectProviderArn]: The Amazon Resource Name (ARN) of the IAM
  /// OpenID Connect (OIDC) provider resource to add the client ID to. You can
  /// get a list of OIDC provider ARNs by using the ListOpenIDConnectProviders
  /// operation.
  ///
  /// [clientID]: The client ID (also known as audience) to add to the IAM
  /// OpenID Connect provider resource.
  Future<void> addClientIDToOpenIDConnectProvider(
      {@required String openIDConnectProviderArn,
      @required String clientID}) async {}

  /// Adds the specified IAM role to the specified instance profile. An instance
  /// profile can contain only one role, and this limit cannot be increased. You
  /// can remove the existing role and then add a different role to an instance
  /// profile. You must then wait for the change to appear across all of AWS
  /// because of [eventual
  /// consistency](https://en.wikipedia.org/wiki/Eventual_consistency). To force
  /// the change, you must [disassociate the instance
  /// profile](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DisassociateIamInstanceProfile.html)
  /// and then [associate the instance
  /// profile](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_AssociateIamInstanceProfile.html),
  /// or you can stop your instance and then restart it.
  ///
  ///  The caller of this API must be granted the `PassRole` permission on the
  /// IAM role by a permissions policy.
  ///
  /// For more information about roles, go to [Working with
  /// Roles](https://docs.aws.amazon.com/IAM/latest/UserGuide/WorkingWithRoles.html).
  /// For more information about instance profiles, go to [About Instance
  /// Profiles](https://docs.aws.amazon.com/IAM/latest/UserGuide/AboutInstanceProfiles.html).
  ///
  /// [instanceProfileName]: The name of the instance profile to update.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  ///
  /// [roleName]: The name of the role to add.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  Future<void> addRoleToInstanceProfile(
      {@required String instanceProfileName,
      @required String roleName}) async {}

  /// Adds the specified user to the specified group.
  ///
  /// [groupName]: The name of the group to update.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  ///
  /// [userName]: The name of the user to add.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  Future<void> addUserToGroup(
      {@required String groupName, @required String userName}) async {}

  /// Attaches the specified managed policy to the specified IAM group.
  ///
  /// You use this API to attach a managed policy to a group. To embed an inline
  /// policy in a group, use PutGroupPolicy.
  ///
  /// For more information about policies, see [Managed Policies and Inline
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html)
  /// in the _IAM User Guide_.
  ///
  /// [groupName]: The name (friendly name, not ARN) of the group to attach the
  /// policy to.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  ///
  /// [policyArn]: The Amazon Resource Name (ARN) of the IAM policy you want to
  /// attach.
  ///
  /// For more information about ARNs, see [Amazon Resource Names (ARNs) and AWS
  /// Service
  /// Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html)
  /// in the _AWS General Reference_.
  Future<void> attachGroupPolicy(
      {@required String groupName, @required String policyArn}) async {}

  /// Attaches the specified managed policy to the specified IAM role. When you
  /// attach a managed policy to a role, the managed policy becomes part of the
  /// role's permission (access) policy.
  ///
  ///  You cannot use a managed policy as the role's trust policy. The role's
  /// trust policy is created at the same time as the role, using CreateRole.
  /// You can update a role's trust policy using UpdateAssumeRolePolicy.
  ///
  /// Use this API to attach a _managed_ policy to a role. To embed an inline
  /// policy in a role, use PutRolePolicy. For more information about policies,
  /// see [Managed Policies and Inline
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html)
  /// in the _IAM User Guide_.
  ///
  /// [roleName]: The name (friendly name, not ARN) of the role to attach the
  /// policy to.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  ///
  /// [policyArn]: The Amazon Resource Name (ARN) of the IAM policy you want to
  /// attach.
  ///
  /// For more information about ARNs, see [Amazon Resource Names (ARNs) and AWS
  /// Service
  /// Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html)
  /// in the _AWS General Reference_.
  Future<void> attachRolePolicy(
      {@required String roleName, @required String policyArn}) async {}

  /// Attaches the specified managed policy to the specified user.
  ///
  /// You use this API to attach a _managed_ policy to a user. To embed an
  /// inline policy in a user, use PutUserPolicy.
  ///
  /// For more information about policies, see [Managed Policies and Inline
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html)
  /// in the _IAM User Guide_.
  ///
  /// [userName]: The name (friendly name, not ARN) of the IAM user to attach
  /// the policy to.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  ///
  /// [policyArn]: The Amazon Resource Name (ARN) of the IAM policy you want to
  /// attach.
  ///
  /// For more information about ARNs, see [Amazon Resource Names (ARNs) and AWS
  /// Service
  /// Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html)
  /// in the _AWS General Reference_.
  Future<void> attachUserPolicy(
      {@required String userName, @required String policyArn}) async {}

  /// Changes the password of the IAM user who is calling this operation. The
  /// AWS account root user password is not affected by this operation.
  ///
  /// To change the password for a different user, see UpdateLoginProfile. For
  /// more information about modifying passwords, see [Managing
  /// Passwords](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_ManagingLogins.html)
  /// in the _IAM User Guide_.
  ///
  /// [oldPassword]: The IAM user's current password.
  ///
  /// [newPassword]: The new password. The new password must conform to the AWS
  /// account's password policy, if one exists.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) that is used to
  /// validate this parameter is a string of characters. That string can include
  /// almost any printable ASCII character from the space (\\u0020) through the
  /// end of the ASCII character range (\\u00FF). You can also include the tab
  /// (\\u0009), line feed (\\u000A), and carriage return (\\u000D) characters.
  /// Any of these characters are valid in a password. However, many tools, such
  /// as the AWS Management Console, might restrict the ability to type certain
  /// characters because they have special meaning within that tool.
  Future<void> changePassword(
      {@required String oldPassword, @required String newPassword}) async {}

  ///  Creates a new AWS secret access key and corresponding AWS access key ID
  /// for the specified user. The default status for new keys is `Active`.
  ///
  /// If you do not specify a user name, IAM determines the user name implicitly
  /// based on the AWS access key ID signing the request. This operation works
  /// for access keys under the AWS account. Consequently, you can use this
  /// operation to manage AWS account root user credentials. This is true even
  /// if the AWS account has no associated users.
  ///
  ///  For information about limits on the number of keys you can create, see
  /// [Limitations on IAM
  /// Entities](https://docs.aws.amazon.com/IAM/latest/UserGuide/LimitationsOnEntities.html)
  /// in the _IAM User Guide_.
  ///
  ///
  ///
  /// To ensure the security of your AWS account, the secret access key is
  /// accessible only during key and user creation. You must save the key (for
  /// example, in a text file) if you want to be able to access it again. If a
  /// secret key is lost, you can delete the access keys for the associated user
  /// and then create new keys.
  ///
  /// [userName]: The name of the IAM user that the new key will belong to.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  Future<CreateAccessKeyResponse> createAccessKey({String userName}) async {
    return CreateAccessKeyResponse.fromJson({});
  }

  /// Creates an alias for your AWS account. For information about using an AWS
  /// account alias, see [Using an Alias for Your AWS Account
  /// ID](https://docs.aws.amazon.com/IAM/latest/UserGuide/AccountAlias.html) in
  /// the _IAM User Guide_.
  ///
  /// [accountAlias]: The account alias to create.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of lowercase letters, digits, and dashes. You cannot start or
  /// finish with a dash, nor can you have two dashes in a row.
  Future<void> createAccountAlias(String accountAlias) async {}

  /// Creates a new group.
  ///
  ///  For information about the number of groups you can create, see
  /// [Limitations on IAM
  /// Entities](https://docs.aws.amazon.com/IAM/latest/UserGuide/LimitationsOnEntities.html)
  /// in the _IAM User Guide_.
  ///
  /// [path]:  The path to the group. For more information about paths, see [IAM
  /// Identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html)
  /// in the _IAM User Guide_.
  ///
  /// This parameter is optional. If it is not included, it defaults to a slash
  /// (/).
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of either a forward slash (/) by itself or a string that must
  /// begin and end with forward slashes. In addition, it can contain any ASCII
  /// character from the ! (\\u0021) through the DEL character (\\u007F),
  /// including most punctuation characters, digits, and upper and lowercased
  /// letters.
  ///
  /// [groupName]: The name of the group to create. Do not include the path in
  /// this value.
  ///
  /// IAM user, group, role, and policy names must be unique within the account.
  /// Names are not distinguished by case. For example, you cannot create
  /// resources named both "MyResource" and "myresource".
  Future<CreateGroupResponse> createGroup(String groupName,
      {String path}) async {
    return CreateGroupResponse.fromJson({});
  }

  ///  Creates a new instance profile. For information about instance profiles,
  /// go to [About Instance
  /// Profiles](https://docs.aws.amazon.com/IAM/latest/UserGuide/AboutInstanceProfiles.html).
  ///
  ///  For information about the number of instance profiles you can create, see
  /// [Limitations on IAM
  /// Entities](https://docs.aws.amazon.com/IAM/latest/UserGuide/LimitationsOnEntities.html)
  /// in the _IAM User Guide_.
  ///
  /// [instanceProfileName]: The name of the instance profile to create.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  ///
  /// [path]:  The path to the instance profile. For more information about
  /// paths, see [IAM
  /// Identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html)
  /// in the _IAM User Guide_.
  ///
  /// This parameter is optional. If it is not included, it defaults to a slash
  /// (/).
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of either a forward slash (/) by itself or a string that must
  /// begin and end with forward slashes. In addition, it can contain any ASCII
  /// character from the ! (\\u0021) through the DEL character (\\u007F),
  /// including most punctuation characters, digits, and upper and lowercased
  /// letters.
  Future<CreateInstanceProfileResponse> createInstanceProfile(
      String instanceProfileName,
      {String path}) async {
    return CreateInstanceProfileResponse.fromJson({});
  }

  ///  Creates a password for the specified user, giving the user the ability to
  /// access AWS services through the AWS Management Console. For more
  /// information about managing passwords, see [Managing
  /// Passwords](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_ManagingLogins.html)
  /// in the _IAM User Guide_.
  ///
  /// [userName]: The name of the IAM user to create a password for. The user
  /// must already exist.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  ///
  /// [password]: The new password for the user.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) that is used to
  /// validate this parameter is a string of characters. That string can include
  /// almost any printable ASCII character from the space (\\u0020) through the
  /// end of the ASCII character range (\\u00FF). You can also include the tab
  /// (\\u0009), line feed (\\u000A), and carriage return (\\u000D) characters.
  /// Any of these characters are valid in a password. However, many tools, such
  /// as the AWS Management Console, might restrict the ability to type certain
  /// characters because they have special meaning within that tool.
  ///
  /// [passwordResetRequired]: Specifies whether the user is required to set a
  /// new password on next sign-in.
  Future<CreateLoginProfileResponse> createLoginProfile(
      {@required String userName,
      @required String password,
      bool passwordResetRequired}) async {
    return CreateLoginProfileResponse.fromJson({});
  }

  /// Creates an IAM entity to describe an identity provider (IdP) that supports
  /// [OpenID Connect (OIDC)](http://openid.net/connect/).
  ///
  /// The OIDC provider that you create with this operation can be used as a
  /// principal in a role's trust policy. Such a policy establishes a trust
  /// relationship between AWS and the OIDC provider.
  ///
  /// When you create the IAM OIDC provider, you specify the following:
  ///
  /// *   The URL of the OIDC identity provider (IdP) to trust
  ///
  /// *   A list of client IDs (also known as audiences) that identify the
  /// application or applications that are allowed to authenticate using the
  /// OIDC provider
  ///
  /// *   A list of thumbprints of the server certificate(s) that the IdP uses
  ///
  ///
  /// You get all of this information from the OIDC IdP that you want to use to
  /// access AWS.
  ///
  ///
  ///
  /// The trust for the OIDC provider is derived from the IAM provider that this
  /// operation creates. Therefore, it is best to limit access to the
  /// CreateOpenIDConnectProvider operation to highly privileged users.
  ///
  /// [url]: The URL of the identity provider. The URL must begin with
  /// `https://` and should correspond to the `iss` claim in the provider's
  /// OpenID Connect ID tokens. Per the OIDC standard, path components are
  /// allowed but query parameters are not. Typically the URL consists of only a
  /// hostname, like `https://server.example.org` or `https://example.com`.
  ///
  /// You cannot register the same provider multiple times in a single AWS
  /// account. If you try to submit a URL that has already been used for an
  /// OpenID Connect provider in the AWS account, you will get an error.
  ///
  /// [clientIDList]: A list of client IDs (also known as audiences). When a
  /// mobile or web app registers with an OpenID Connect provider, they
  /// establish a value that identifies the application. (This is the value
  /// that's sent as the `client_id` parameter on OAuth requests.)
  ///
  /// You can register multiple client IDs with the same provider. For example,
  /// you might have multiple applications that use the same OIDC provider. You
  /// cannot register more than 100 client IDs with a single IAM OIDC provider.
  ///
  /// There is no defined format for a client ID. The
  /// `CreateOpenIDConnectProviderRequest` operation accepts client IDs up to
  /// 255 characters long.
  ///
  /// [thumbprintList]: A list of server certificate thumbprints for the OpenID
  /// Connect (OIDC) identity provider's server certificates. Typically this
  /// list includes only one entry. However, IAM lets you have up to five
  /// thumbprints for an OIDC provider. This lets you maintain multiple
  /// thumbprints if the identity provider is rotating certificates.
  ///
  /// The server certificate thumbprint is the hex-encoded SHA-1 hash value of
  /// the X.509 certificate used by the domain where the OpenID Connect provider
  /// makes its keys available. It is always a 40-character string.
  ///
  /// You must provide at least one thumbprint when creating an IAM OIDC
  /// provider. For example, assume that the OIDC provider is
  /// `server.example.com` and the provider stores its keys at
  /// https://keys.server.example.com/openid-connect. In that case, the
  /// thumbprint string would be the hex-encoded SHA-1 hash value of the
  /// certificate used by https://keys.server.example.com.
  ///
  /// For more information about obtaining the OIDC provider's thumbprint, see
  /// [Obtaining the Thumbprint for an OpenID Connect
  /// Provider](https://docs.aws.amazon.com/IAM/latest/UserGuide/identity-providers-oidc-obtain-thumbprint.html)
  /// in the _IAM User Guide_.
  Future<CreateOpenIDConnectProviderResponse> createOpenIDConnectProvider(
      {@required String url,
      List<String> clientIDList,
      @required List<String> thumbprintList}) async {
    return CreateOpenIDConnectProviderResponse.fromJson({});
  }

  /// Creates a new managed policy for your AWS account.
  ///
  /// This operation creates a policy version with a version identifier of `v1`
  /// and sets v1 as the policy's default version. For more information about
  /// policy versions, see [Versioning for Managed
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-versions.html)
  /// in the _IAM User Guide_.
  ///
  /// For more information about managed policies in general, see [Managed
  /// Policies and Inline
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html)
  /// in the _IAM User Guide_.
  ///
  /// [policyName]: The friendly name of the policy.
  ///
  /// IAM user, group, role, and policy names must be unique within the account.
  /// Names are not distinguished by case. For example, you cannot create
  /// resources named both "MyResource" and "myresource".
  ///
  /// [path]: The path for the policy.
  ///
  /// For more information about paths, see [IAM
  /// Identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html)
  /// in the _IAM User Guide_.
  ///
  /// This parameter is optional. If it is not included, it defaults to a slash
  /// (/).
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of either a forward slash (/) by itself or a string that must
  /// begin and end with forward slashes. In addition, it can contain any ASCII
  /// character from the ! (\\u0021) through the DEL character (\\u007F),
  /// including most punctuation characters, digits, and upper and lowercased
  /// letters.
  ///
  /// [policyDocument]: The JSON policy document that you want to use as the
  /// content for the new policy.
  ///
  /// You must provide policies in JSON format in IAM. However, for AWS
  /// CloudFormation templates formatted in YAML, you can provide the policy in
  /// JSON or YAML format. AWS CloudFormation always converts a YAML policy to
  /// JSON format before submitting it to IAM.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) used to validate this
  /// parameter is a string of characters consisting of the following:
  ///
  /// *   Any printable ASCII character ranging from the space character
  /// (\\u0020) through the end of the ASCII character range
  ///
  /// *   The printable characters in the Basic Latin and Latin-1 Supplement
  /// character set (through \\u00FF)
  ///
  /// *   The special characters tab (\\u0009), line feed (\\u000A), and
  /// carriage return (\\u000D)
  ///
  /// [description]: A friendly description of the policy.
  ///
  /// Typically used to store information about the permissions defined in the
  /// policy. For example, "Grants access to production DynamoDB tables."
  ///
  /// The policy description is immutable. After a value is assigned, it cannot
  /// be changed.
  Future<CreatePolicyResponse> createPolicy(
      {@required String policyName,
      String path,
      @required String policyDocument,
      String description}) async {
    return CreatePolicyResponse.fromJson({});
  }

  /// Creates a new version of the specified managed policy. To update a managed
  /// policy, you create a new policy version. A managed policy can have up to
  /// five versions. If the policy has five versions, you must delete an
  /// existing version using DeletePolicyVersion before you create a new
  /// version.
  ///
  /// Optionally, you can set the new version as the policy's default version.
  /// The default version is the version that is in effect for the IAM users,
  /// groups, and roles to which the policy is attached.
  ///
  /// For more information about managed policy versions, see [Versioning for
  /// Managed
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-versions.html)
  /// in the _IAM User Guide_.
  ///
  /// [policyArn]: The Amazon Resource Name (ARN) of the IAM policy to which you
  /// want to add a new version.
  ///
  /// For more information about ARNs, see [Amazon Resource Names (ARNs) and AWS
  /// Service
  /// Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html)
  /// in the _AWS General Reference_.
  ///
  /// [policyDocument]: The JSON policy document that you want to use as the
  /// content for this new version of the policy.
  ///
  /// You must provide policies in JSON format in IAM. However, for AWS
  /// CloudFormation templates formatted in YAML, you can provide the policy in
  /// JSON or YAML format. AWS CloudFormation always converts a YAML policy to
  /// JSON format before submitting it to IAM.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) used to validate this
  /// parameter is a string of characters consisting of the following:
  ///
  /// *   Any printable ASCII character ranging from the space character
  /// (\\u0020) through the end of the ASCII character range
  ///
  /// *   The printable characters in the Basic Latin and Latin-1 Supplement
  /// character set (through \\u00FF)
  ///
  /// *   The special characters tab (\\u0009), line feed (\\u000A), and
  /// carriage return (\\u000D)
  ///
  /// [setAsDefault]: Specifies whether to set this version as the policy's
  /// default version.
  ///
  /// When this parameter is `true`, the new policy version becomes the
  /// operative version. That is, it becomes the version that is in effect for
  /// the IAM users, groups, and roles that the policy is attached to.
  ///
  /// For more information about managed policy versions, see [Versioning for
  /// Managed
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-versions.html)
  /// in the _IAM User Guide_.
  Future<CreatePolicyVersionResponse> createPolicyVersion(
      {@required String policyArn,
      @required String policyDocument,
      bool setAsDefault}) async {
    return CreatePolicyVersionResponse.fromJson({});
  }

  /// Creates a new role for your AWS account. For more information about roles,
  /// go to [IAM
  /// Roles](https://docs.aws.amazon.com/IAM/latest/UserGuide/WorkingWithRoles.html).
  /// For information about limitations on role names and the number of roles
  /// you can create, go to [Limitations on IAM
  /// Entities](https://docs.aws.amazon.com/IAM/latest/UserGuide/LimitationsOnEntities.html)
  /// in the _IAM User Guide_.
  ///
  /// [path]:  The path to the role. For more information about paths, see [IAM
  /// Identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html)
  /// in the _IAM User Guide_.
  ///
  /// This parameter is optional. If it is not included, it defaults to a slash
  /// (/).
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of either a forward slash (/) by itself or a string that must
  /// begin and end with forward slashes. In addition, it can contain any ASCII
  /// character from the ! (\\u0021) through the DEL character (\\u007F),
  /// including most punctuation characters, digits, and upper and lowercased
  /// letters.
  ///
  /// [roleName]: The name of the role to create.
  ///
  /// IAM user, group, role, and policy names must be unique within the account.
  /// Names are not distinguished by case. For example, you cannot create
  /// resources named both "MyResource" and "myresource".
  ///
  /// [assumeRolePolicyDocument]: The trust relationship policy document that
  /// grants an entity permission to assume the role.
  ///
  /// In IAM, you must provide a JSON policy that has been converted to a
  /// string. However, for AWS CloudFormation templates formatted in YAML, you
  /// can provide the policy in JSON or YAML format. AWS CloudFormation always
  /// converts a YAML policy to JSON format before submitting it to IAM.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) used to validate this
  /// parameter is a string of characters consisting of the following:
  ///
  /// *   Any printable ASCII character ranging from the space character
  /// (\\u0020) through the end of the ASCII character range
  ///
  /// *   The printable characters in the Basic Latin and Latin-1 Supplement
  /// character set (through \\u00FF)
  ///
  /// *   The special characters tab (\\u0009), line feed (\\u000A), and
  /// carriage return (\\u000D)
  ///
  ///
  ///  Upon success, the response includes the same trust policy as a
  /// URL-encoded JSON string.
  ///
  /// [description]: A description of the role.
  ///
  /// [maxSessionDuration]: The maximum session duration (in seconds) that you
  /// want to set for the specified role. If you do not specify a value for this
  /// setting, the default maximum of one hour is applied. This setting can have
  /// a value from 1 hour to 12 hours.
  ///
  /// Anyone who assumes the role from the AWS CLI or API can use the
  /// `DurationSeconds` API parameter or the `duration-seconds` CLI parameter to
  /// request a longer session. The `MaxSessionDuration` setting determines the
  /// maximum duration that can be requested using the `DurationSeconds`
  /// parameter. If users don't specify a value for the `DurationSeconds`
  /// parameter, their security credentials are valid for one hour by default.
  /// This applies when you use the `AssumeRole*` API operations or the
  /// `assume-role*` CLI operations but does not apply when you use those
  /// operations to create a console URL. For more information, see [Using IAM
  /// Roles](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use.html)
  /// in the _IAM User Guide_.
  ///
  /// [permissionsBoundary]: The ARN of the policy that is used to set the
  /// permissions boundary for the role.
  ///
  /// [tags]: A list of tags that you want to attach to the newly created role.
  /// Each tag consists of a key name and an associated value. For more
  /// information about tagging, see [Tagging IAM
  /// Identities](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html)
  /// in the _IAM User Guide_.
  ///
  ///
  ///
  /// If any one of the tags is invalid or if you exceed the allowed number of
  /// tags per role, then the entire request fails and the role is not created.
  Future<CreateRoleResponse> createRole(
      {String path,
      @required String roleName,
      @required String assumeRolePolicyDocument,
      String description,
      int maxSessionDuration,
      String permissionsBoundary,
      List<Tag> tags}) async {
    return CreateRoleResponse.fromJson({});
  }

  /// Creates an IAM resource that describes an identity provider (IdP) that
  /// supports SAML 2.0.
  ///
  /// The SAML provider resource that you create with this operation can be used
  /// as a principal in an IAM role's trust policy. Such a policy can enable
  /// federated users who sign in using the SAML IdP to assume the role. You can
  /// create an IAM role that supports Web-based single sign-on (SSO) to the AWS
  /// Management Console or one that supports API access to AWS.
  ///
  /// When you create the SAML provider resource, you upload a SAML metadata
  /// document that you get from your IdP. That document includes the issuer's
  /// name, expiration information, and keys that can be used to validate the
  /// SAML authentication response (assertions) that the IdP sends. You must
  /// generate the metadata document using the identity management software that
  /// is used as your organization's IdP.
  ///
  ///   This operation requires [Signature Version
  /// 4](https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html).
  ///
  ///
  ///  For more information, see [Enabling SAML 2.0 Federated Users to Access
  /// the AWS Management
  /// Console](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_enable-console-saml.html)
  /// and [About SAML 2.0-based
  /// Federation](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_saml.html)
  /// in the _IAM User Guide_.
  ///
  /// [samlMetadataDocument]: An XML document generated by an identity provider
  /// (IdP) that supports SAML 2.0. The document includes the issuer's name,
  /// expiration information, and keys that can be used to validate the SAML
  /// authentication response (assertions) that are received from the IdP. You
  /// must generate the metadata document using the identity management software
  /// that is used as your organization's IdP.
  ///
  /// For more information, see [About SAML 2.0-based
  /// Federation](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_saml.html)
  /// in the _IAM User Guide_
  ///
  /// [name]: The name of the provider to create.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  Future<CreateSamlProviderResponse> createSamlProvider(
      {@required String samlMetadataDocument, @required String name}) async {
    return CreateSamlProviderResponse.fromJson({});
  }

  /// Creates an IAM role that is linked to a specific AWS service. The service
  /// controls the attached policies and when the role can be deleted. This
  /// helps ensure that the service is not broken by an unexpectedly changed or
  /// deleted role, which could put your AWS resources into an unknown state.
  /// Allowing the service to control the role helps improve service stability
  /// and proper cleanup when a service and its role are no longer needed. For
  /// more information, see [Using Service-Linked
  /// Roles](https://docs.aws.amazon.com/IAM/latest/UserGuide/using-service-linked-roles.html)
  /// in the _IAM User Guide_.
  ///
  /// To attach a policy to this service-linked role, you must make the request
  /// using the AWS service that depends on this role.
  ///
  /// [awsServiceName]: The service principal for the AWS service to which this
  /// role is attached. You use a string similar to a URL but without the
  /// http:// in front. For example: `elasticbeanstalk.amazonaws.com`.
  ///
  /// Service principals are unique and case-sensitive. To find the exact
  /// service principal for your service-linked role, see [AWS Services That
  /// Work with
  /// IAM](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-services-that-work-with-iam.html)
  /// in the _IAM User Guide_. Look for the services that have **Yes** in the
  /// **Service-Linked Role** column. Choose the **Yes** link to view the
  /// service-linked role documentation for that service.
  ///
  /// [description]: The description of the role.
  ///
  /// [customSuffix]: A string that you provide, which is combined with the
  /// service-provided prefix to form the complete role name. If you make
  /// multiple requests for the same service, then you must supply a different
  /// `CustomSuffix` for each request. Otherwise the request fails with a
  /// duplicate role name error. For example, you could add `-1` or `-debug` to
  /// the suffix.
  ///
  /// Some services do not support the `CustomSuffix` parameter. If you provide
  /// an optional suffix and the operation fails, try the operation again
  /// without the suffix.
  Future<CreateServiceLinkedRoleResponse> createServiceLinkedRole(
      String awsServiceName,
      {String description,
      String customSuffix}) async {
    return CreateServiceLinkedRoleResponse.fromJson({});
  }

  /// Generates a set of credentials consisting of a user name and password that
  /// can be used to access the service specified in the request. These
  /// credentials are generated by IAM, and can be used only for the specified
  /// service.
  ///
  /// You can have a maximum of two sets of service-specific credentials for
  /// each supported service per user.
  ///
  /// The only supported service at this time is AWS CodeCommit.
  ///
  /// You can reset the password to a new service-generated value by calling
  /// ResetServiceSpecificCredential.
  ///
  /// For more information about service-specific credentials, see [Using IAM
  /// with AWS CodeCommit: Git Credentials, SSH Keys, and AWS Access
  /// Keys](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_ssh-keys.html)
  /// in the _IAM User Guide_.
  ///
  /// [userName]: The name of the IAM user that is to be associated with the
  /// credentials. The new service-specific credentials have the same
  /// permissions as the associated user except that they can be used only to
  /// access the specified service.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  ///
  /// [serviceName]: The name of the AWS service that is to be associated with
  /// the credentials. The service you specify here is the only service that can
  /// be accessed using these credentials.
  Future<CreateServiceSpecificCredentialResponse>
      createServiceSpecificCredential(
          {@required String userName, @required String serviceName}) async {
    return CreateServiceSpecificCredentialResponse.fromJson({});
  }

  /// Creates a new IAM user for your AWS account.
  ///
  ///  For information about limitations on the number of IAM users you can
  /// create, see [Limitations on IAM
  /// Entities](https://docs.aws.amazon.com/IAM/latest/UserGuide/LimitationsOnEntities.html)
  /// in the _IAM User Guide_.
  ///
  /// [path]:  The path for the user name. For more information about paths, see
  /// [IAM
  /// Identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html)
  /// in the _IAM User Guide_.
  ///
  /// This parameter is optional. If it is not included, it defaults to a slash
  /// (/).
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of either a forward slash (/) by itself or a string that must
  /// begin and end with forward slashes. In addition, it can contain any ASCII
  /// character from the ! (\\u0021) through the DEL character (\\u007F),
  /// including most punctuation characters, digits, and upper and lowercased
  /// letters.
  ///
  /// [userName]: The name of the user to create.
  ///
  /// IAM user, group, role, and policy names must be unique within the account.
  /// Names are not distinguished by case. For example, you cannot create
  /// resources named both "MyResource" and "myresource".
  ///
  /// [permissionsBoundary]: The ARN of the policy that is used to set the
  /// permissions boundary for the user.
  ///
  /// [tags]: A list of tags that you want to attach to the newly created user.
  /// Each tag consists of a key name and an associated value. For more
  /// information about tagging, see [Tagging IAM
  /// Identities](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html)
  /// in the _IAM User Guide_.
  ///
  ///
  ///
  /// If any one of the tags is invalid or if you exceed the allowed number of
  /// tags per user, then the entire request fails and the user is not created.
  Future<CreateUserResponse> createUser(String userName,
      {String path, String permissionsBoundary, List<Tag> tags}) async {
    return CreateUserResponse.fromJson({});
  }

  /// Creates a new virtual MFA device for the AWS account. After creating the
  /// virtual MFA, use EnableMFADevice to attach the MFA device to an IAM user.
  /// For more information about creating and working with virtual MFA devices,
  /// go to [Using a Virtual MFA
  /// Device](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_VirtualMFA.html)
  /// in the _IAM User Guide_.
  ///
  /// For information about limits on the number of MFA devices you can create,
  /// see [Limitations on
  /// Entities](https://docs.aws.amazon.com/IAM/latest/UserGuide/LimitationsOnEntities.html)
  /// in the _IAM User Guide_.
  ///
  ///
  ///
  /// The seed information contained in the QR code and the Base32 string should
  /// be treated like any other secret access information. In other words,
  /// protect the seed information as you would your AWS access keys or your
  /// passwords. After you provision your virtual device, you should ensure that
  /// the information is destroyed following secure procedures.
  ///
  /// [path]:  The path for the virtual MFA device. For more information about
  /// paths, see [IAM
  /// Identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html)
  /// in the _IAM User Guide_.
  ///
  /// This parameter is optional. If it is not included, it defaults to a slash
  /// (/).
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of either a forward slash (/) by itself or a string that must
  /// begin and end with forward slashes. In addition, it can contain any ASCII
  /// character from the ! (\\u0021) through the DEL character (\\u007F),
  /// including most punctuation characters, digits, and upper and lowercased
  /// letters.
  ///
  /// [virtualMfaDeviceName]: The name of the virtual MFA device. Use with path
  /// to uniquely identify a virtual MFA device.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  Future<CreateVirtualMfaDeviceResponse> createVirtualMfaDevice(
      String virtualMfaDeviceName,
      {String path}) async {
    return CreateVirtualMfaDeviceResponse.fromJson({});
  }

  /// Deactivates the specified MFA device and removes it from association with
  /// the user name for which it was originally enabled.
  ///
  /// For more information about creating and working with virtual MFA devices,
  /// go to [Enabling a Virtual Multi-factor Authentication (MFA)
  /// Device](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_VirtualMFA.html)
  /// in the _IAM User Guide_.
  ///
  /// [userName]: The name of the user whose MFA device you want to deactivate.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  ///
  /// [serialNumber]: The serial number that uniquely identifies the MFA device.
  /// For virtual MFA devices, the serial number is the device ARN.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: =,.@:/-
  Future<void> deactivateMfaDevice(
      {@required String userName, @required String serialNumber}) async {}

  /// Deletes the access key pair associated with the specified IAM user.
  ///
  /// If you do not specify a user name, IAM determines the user name implicitly
  /// based on the AWS access key ID signing the request. This operation works
  /// for access keys under the AWS account. Consequently, you can use this
  /// operation to manage AWS account root user credentials even if the AWS
  /// account has no associated users.
  ///
  /// [userName]: The name of the user whose access key pair you want to delete.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  ///
  /// [accessKeyId]: The access key ID for the access key ID and secret access
  /// key you want to delete.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters that can
  /// consist of any upper or lowercased letter or digit.
  Future<void> deleteAccessKey(String accessKeyId, {String userName}) async {}

  ///  Deletes the specified AWS account alias. For information about using an
  /// AWS account alias, see [Using an Alias for Your AWS Account
  /// ID](https://docs.aws.amazon.com/IAM/latest/UserGuide/AccountAlias.html) in
  /// the _IAM User Guide_.
  ///
  /// [accountAlias]: The name of the account alias to delete.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of lowercase letters, digits, and dashes. You cannot start or
  /// finish with a dash, nor can you have two dashes in a row.
  Future<void> deleteAccountAlias(String accountAlias) async {}

  /// Deletes the password policy for the AWS account. There are no parameters.
  Future<void> deleteAccountPasswordPolicy() async {}

  /// Deletes the specified IAM group. The group must not contain any users or
  /// have any attached policies.
  ///
  /// [groupName]: The name of the IAM group to delete.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  Future<void> deleteGroup(String groupName) async {}

  /// Deletes the specified inline policy that is embedded in the specified IAM
  /// group.
  ///
  /// A group can also have managed policies attached to it. To detach a managed
  /// policy from a group, use DetachGroupPolicy. For more information about
  /// policies, refer to [Managed Policies and Inline
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html)
  /// in the _IAM User Guide_.
  ///
  /// [groupName]: The name (friendly name, not ARN) identifying the group that
  /// the policy is embedded in.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  ///
  /// [policyName]: The name identifying the policy document to delete.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  Future<void> deleteGroupPolicy(
      {@required String groupName, @required String policyName}) async {}

  /// Deletes the specified instance profile. The instance profile must not have
  /// an associated role.
  ///
  ///  Make sure that you do not have any Amazon EC2 instances running with the
  /// instance profile you are about to delete. Deleting a role or instance
  /// profile that is associated with a running instance will break any
  /// applications running on the instance.
  ///
  /// For more information about instance profiles, go to [About Instance
  /// Profiles](https://docs.aws.amazon.com/IAM/latest/UserGuide/AboutInstanceProfiles.html).
  ///
  /// [instanceProfileName]: The name of the instance profile to delete.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  Future<void> deleteInstanceProfile(String instanceProfileName) async {}

  /// Deletes the password for the specified IAM user, which terminates the
  /// user's ability to access AWS services through the AWS Management Console.
  ///
  ///   Deleting a user's password does not prevent a user from accessing AWS
  /// through the command line interface or the API. To prevent all user access,
  /// you must also either make any access keys inactive or delete them. For
  /// more information about making keys inactive or deleting them, see
  /// UpdateAccessKey and DeleteAccessKey.
  ///
  /// [userName]: The name of the user whose password you want to delete.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  Future<void> deleteLoginProfile(String userName) async {}

  /// Deletes an OpenID Connect identity provider (IdP) resource object in IAM.
  ///
  /// Deleting an IAM OIDC provider resource does not update any roles that
  /// reference the provider as a principal in their trust policies. Any attempt
  /// to assume a role that references a deleted provider fails.
  ///
  /// This operation is idempotent; it does not fail or return an error if you
  /// call the operation for a provider that does not exist.
  ///
  /// [openIDConnectProviderArn]: The Amazon Resource Name (ARN) of the IAM
  /// OpenID Connect provider resource object to delete. You can get a list of
  /// OpenID Connect provider resource ARNs by using the
  /// ListOpenIDConnectProviders operation.
  Future<void> deleteOpenIDConnectProvider(
      String openIDConnectProviderArn) async {}

  /// Deletes the specified managed policy.
  ///
  /// Before you can delete a managed policy, you must first detach the policy
  /// from all users, groups, and roles that it is attached to. In addition, you
  /// must delete all the policy's versions. The following steps describe the
  /// process for deleting a managed policy:
  ///
  /// *   Detach the policy from all users, groups, and roles that the policy is
  /// attached to, using the DetachUserPolicy, DetachGroupPolicy, or
  /// DetachRolePolicy API operations. To list all the users, groups, and roles
  /// that a policy is attached to, use ListEntitiesForPolicy.
  ///
  /// *   Delete all versions of the policy using DeletePolicyVersion. To list
  /// the policy's versions, use ListPolicyVersions. You cannot use
  /// DeletePolicyVersion to delete the version that is marked as the default
  /// version. You delete the policy's default version in the next step of the
  /// process.
  ///
  /// *   Delete the policy (this automatically deletes the policy's default
  /// version) using this API.
  ///
  ///
  /// For information about managed policies, see [Managed Policies and Inline
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html)
  /// in the _IAM User Guide_.
  ///
  /// [policyArn]: The Amazon Resource Name (ARN) of the IAM policy you want to
  /// delete.
  ///
  /// For more information about ARNs, see [Amazon Resource Names (ARNs) and AWS
  /// Service
  /// Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html)
  /// in the _AWS General Reference_.
  Future<void> deletePolicy(String policyArn) async {}

  /// Deletes the specified version from the specified managed policy.
  ///
  /// You cannot delete the default version from a policy using this API. To
  /// delete the default version from a policy, use DeletePolicy. To find out
  /// which version of a policy is marked as the default version, use
  /// ListPolicyVersions.
  ///
  /// For information about versions for managed policies, see [Versioning for
  /// Managed
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-versions.html)
  /// in the _IAM User Guide_.
  ///
  /// [policyArn]: The Amazon Resource Name (ARN) of the IAM policy from which
  /// you want to delete a version.
  ///
  /// For more information about ARNs, see [Amazon Resource Names (ARNs) and AWS
  /// Service
  /// Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html)
  /// in the _AWS General Reference_.
  ///
  /// [versionId]: The policy version to delete.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters that
  /// consists of the lowercase letter 'v' followed by one or two digits, and
  /// optionally followed by a period '.' and a string of letters and digits.
  ///
  /// For more information about managed policy versions, see [Versioning for
  /// Managed
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-versions.html)
  /// in the _IAM User Guide_.
  Future<void> deletePolicyVersion(
      {@required String policyArn, @required String versionId}) async {}

  /// Deletes the specified role. The role must not have any policies attached.
  /// For more information about roles, go to [Working with
  /// Roles](https://docs.aws.amazon.com/IAM/latest/UserGuide/WorkingWithRoles.html).
  ///
  ///
  ///
  /// Make sure that you do not have any Amazon EC2 instances running with the
  /// role you are about to delete. Deleting a role or instance profile that is
  /// associated with a running instance will break any applications running on
  /// the instance.
  ///
  /// [roleName]: The name of the role to delete.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  Future<void> deleteRole(String roleName) async {}

  /// Deletes the permissions boundary for the specified IAM role.
  ///
  ///
  ///
  /// Deleting the permissions boundary for a role might increase its
  /// permissions. For example, it might allow anyone who assumes the role to
  /// perform all the actions granted in its permissions policies.
  ///
  /// [roleName]: The name (friendly name, not ARN) of the IAM role from which
  /// you want to remove the permissions boundary.
  Future<void> deleteRolePermissionsBoundary(String roleName) async {}

  /// Deletes the specified inline policy that is embedded in the specified IAM
  /// role.
  ///
  /// A role can also have managed policies attached to it. To detach a managed
  /// policy from a role, use DetachRolePolicy. For more information about
  /// policies, refer to [Managed Policies and Inline
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html)
  /// in the _IAM User Guide_.
  ///
  /// [roleName]: The name (friendly name, not ARN) identifying the role that
  /// the policy is embedded in.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  ///
  /// [policyName]: The name of the inline policy to delete from the specified
  /// IAM role.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  Future<void> deleteRolePolicy(
      {@required String roleName, @required String policyName}) async {}

  /// Deletes a SAML provider resource in IAM.
  ///
  /// Deleting the provider resource from IAM does not update any roles that
  /// reference the SAML provider resource's ARN as a principal in their trust
  /// policies. Any attempt to assume a role that references a non-existent
  /// provider resource ARN fails.
  ///
  ///   This operation requires [Signature Version
  /// 4](https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html).
  ///
  /// [samlProviderArn]: The Amazon Resource Name (ARN) of the SAML provider to
  /// delete.
  Future<void> deleteSamlProvider(String samlProviderArn) async {}

  /// Deletes the specified SSH public key.
  ///
  /// The SSH public key deleted by this operation is used only for
  /// authenticating the associated IAM user to an AWS CodeCommit repository.
  /// For more information about using SSH keys to authenticate to an AWS
  /// CodeCommit repository, see [Set up AWS CodeCommit for SSH
  /// Connections](https://docs.aws.amazon.com/codecommit/latest/userguide/setting-up-credentials-ssh.html)
  /// in the _AWS CodeCommit User Guide_.
  ///
  /// [userName]: The name of the IAM user associated with the SSH public key.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  ///
  /// [sshPublicKeyId]: The unique identifier for the SSH public key.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters that can
  /// consist of any upper or lowercased letter or digit.
  Future<void> deleteSshPublicKey(
      {@required String userName, @required String sshPublicKeyId}) async {}

  /// Deletes the specified server certificate.
  ///
  /// For more information about working with server certificates, see [Working
  /// with Server
  /// Certificates](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_server-certs.html)
  /// in the _IAM User Guide_. This topic also includes a list of AWS services
  /// that can use the server certificates that you manage with IAM.
  ///
  ///   If you are using a server certificate with Elastic Load Balancing,
  /// deleting the certificate could have implications for your application. If
  /// Elastic Load Balancing doesn't detect the deletion of bound certificates,
  /// it may continue to use the certificates. This could cause Elastic Load
  /// Balancing to stop accepting traffic. We recommend that you remove the
  /// reference to the certificate from Elastic Load Balancing before using this
  /// command to delete the certificate. For more information, go to
  /// [DeleteLoadBalancerListeners](https://docs.aws.amazon.com/ElasticLoadBalancing/latest/APIReference/API_DeleteLoadBalancerListeners.html)
  /// in the _Elastic Load Balancing API Reference_.
  ///
  /// [serverCertificateName]: The name of the server certificate you want to
  /// delete.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  Future<void> deleteServerCertificate(String serverCertificateName) async {}

  /// Submits a service-linked role deletion request and returns a
  /// `DeletionTaskId`, which you can use to check the status of the deletion.
  /// Before you call this operation, confirm that the role has no active
  /// sessions and that any resources used by the role in the linked service are
  /// deleted. If you call this operation more than once for the same
  /// service-linked role and an earlier deletion task is not complete, then the
  /// `DeletionTaskId` of the earlier request is returned.
  ///
  /// If you submit a deletion request for a service-linked role whose linked
  /// service is still accessing a resource, then the deletion task fails. If it
  /// fails, the GetServiceLinkedRoleDeletionStatus API operation returns the
  /// reason for the failure, usually including the resources that must be
  /// deleted. To delete the service-linked role, you must first remove those
  /// resources from the linked service and then submit the deletion request
  /// again. Resources are specific to the service that is linked to the role.
  /// For more information about removing resources from a service, see the [AWS
  /// documentation](http://docs.aws.amazon.com/) for your service.
  ///
  /// For more information about service-linked roles, see [Roles Terms and
  /// Concepts: AWS Service-Linked
  /// Role](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_terms-and-concepts.html#iam-term-service-linked-role)
  /// in the _IAM User Guide_.
  ///
  /// [roleName]: The name of the service-linked role to be deleted.
  Future<DeleteServiceLinkedRoleResponse> deleteServiceLinkedRole(
      String roleName) async {
    return DeleteServiceLinkedRoleResponse.fromJson({});
  }

  /// Deletes the specified service-specific credential.
  ///
  /// [userName]: The name of the IAM user associated with the service-specific
  /// credential. If this value is not specified, then the operation assumes the
  /// user whose credentials are used to call the operation.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  ///
  /// [serviceSpecificCredentialId]: The unique identifier of the
  /// service-specific credential. You can get this value by calling
  /// ListServiceSpecificCredentials.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters that can
  /// consist of any upper or lowercased letter or digit.
  Future<void> deleteServiceSpecificCredential(
      String serviceSpecificCredentialId,
      {String userName}) async {}

  /// Deletes a signing certificate associated with the specified IAM user.
  ///
  /// If you do not specify a user name, IAM determines the user name implicitly
  /// based on the AWS access key ID signing the request. This operation works
  /// for access keys under the AWS account. Consequently, you can use this
  /// operation to manage AWS account root user credentials even if the AWS
  /// account has no associated IAM users.
  ///
  /// [userName]: The name of the user the signing certificate belongs to.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  ///
  /// [certificateId]: The ID of the signing certificate to delete.
  ///
  /// The format of this parameter, as described by its
  /// [regex](http://wikipedia.org/wiki/regex) pattern, is a string of
  /// characters that can be upper- or lower-cased letters or digits.
  Future<void> deleteSigningCertificate(String certificateId,
      {String userName}) async {}

  /// Deletes the specified IAM user. Unlike the AWS Management Console, when
  /// you delete a user programmatically, you must delete the items attached to
  /// the user manually, or the deletion fails. For more information, see
  /// [Deleting an IAM
  /// User](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_manage.html#id_users_deleting_cli).
  /// Before attempting to delete a user, remove the following items:
  ///
  /// *   Password (DeleteLoginProfile)
  ///
  /// *   Access keys (DeleteAccessKey)
  ///
  /// *   Signing certificate (DeleteSigningCertificate)
  ///
  /// *   SSH public key (DeleteSSHPublicKey)
  ///
  /// *   Git credentials (DeleteServiceSpecificCredential)
  ///
  /// *   Multi-factor authentication (MFA) device (DeactivateMFADevice,
  /// DeleteVirtualMFADevice)
  ///
  /// *   Inline policies (DeleteUserPolicy)
  ///
  /// *   Attached managed policies (DetachUserPolicy)
  ///
  /// *   Group memberships (RemoveUserFromGroup)
  ///
  /// [userName]: The name of the user to delete.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  Future<void> deleteUser(String userName) async {}

  /// Deletes the permissions boundary for the specified IAM user.
  ///
  ///
  ///
  /// Deleting the permissions boundary for a user might increase its
  /// permissions by allowing the user to perform all the actions granted in its
  /// permissions policies.
  ///
  /// [userName]: The name (friendly name, not ARN) of the IAM user from which
  /// you want to remove the permissions boundary.
  Future<void> deleteUserPermissionsBoundary(String userName) async {}

  /// Deletes the specified inline policy that is embedded in the specified IAM
  /// user.
  ///
  /// A user can also have managed policies attached to it. To detach a managed
  /// policy from a user, use DetachUserPolicy. For more information about
  /// policies, refer to [Managed Policies and Inline
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html)
  /// in the _IAM User Guide_.
  ///
  /// [userName]: The name (friendly name, not ARN) identifying the user that
  /// the policy is embedded in.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  ///
  /// [policyName]: The name identifying the policy document to delete.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  Future<void> deleteUserPolicy(
      {@required String userName, @required String policyName}) async {}

  /// Deletes a virtual MFA device.
  ///
  ///   You must deactivate a user's virtual MFA device before you can delete
  /// it. For information about deactivating MFA devices, see
  /// DeactivateMFADevice.
  ///
  /// [serialNumber]: The serial number that uniquely identifies the MFA device.
  /// For virtual MFA devices, the serial number is the same as the ARN.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: =,.@:/-
  Future<void> deleteVirtualMfaDevice(String serialNumber) async {}

  /// Removes the specified managed policy from the specified IAM group.
  ///
  /// A group can also have inline policies embedded with it. To delete an
  /// inline policy, use the DeleteGroupPolicy API. For information about
  /// policies, see [Managed Policies and Inline
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html)
  /// in the _IAM User Guide_.
  ///
  /// [groupName]: The name (friendly name, not ARN) of the IAM group to detach
  /// the policy from.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  ///
  /// [policyArn]: The Amazon Resource Name (ARN) of the IAM policy you want to
  /// detach.
  ///
  /// For more information about ARNs, see [Amazon Resource Names (ARNs) and AWS
  /// Service
  /// Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html)
  /// in the _AWS General Reference_.
  Future<void> detachGroupPolicy(
      {@required String groupName, @required String policyArn}) async {}

  /// Removes the specified managed policy from the specified role.
  ///
  /// A role can also have inline policies embedded with it. To delete an inline
  /// policy, use the DeleteRolePolicy API. For information about policies, see
  /// [Managed Policies and Inline
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html)
  /// in the _IAM User Guide_.
  ///
  /// [roleName]: The name (friendly name, not ARN) of the IAM role to detach
  /// the policy from.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  ///
  /// [policyArn]: The Amazon Resource Name (ARN) of the IAM policy you want to
  /// detach.
  ///
  /// For more information about ARNs, see [Amazon Resource Names (ARNs) and AWS
  /// Service
  /// Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html)
  /// in the _AWS General Reference_.
  Future<void> detachRolePolicy(
      {@required String roleName, @required String policyArn}) async {}

  /// Removes the specified managed policy from the specified user.
  ///
  /// A user can also have inline policies embedded with it. To delete an inline
  /// policy, use the DeleteUserPolicy API. For information about policies, see
  /// [Managed Policies and Inline
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html)
  /// in the _IAM User Guide_.
  ///
  /// [userName]: The name (friendly name, not ARN) of the IAM user to detach
  /// the policy from.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  ///
  /// [policyArn]: The Amazon Resource Name (ARN) of the IAM policy you want to
  /// detach.
  ///
  /// For more information about ARNs, see [Amazon Resource Names (ARNs) and AWS
  /// Service
  /// Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html)
  /// in the _AWS General Reference_.
  Future<void> detachUserPolicy(
      {@required String userName, @required String policyArn}) async {}

  /// Enables the specified MFA device and associates it with the specified IAM
  /// user. When enabled, the MFA device is required for every subsequent login
  /// by the IAM user associated with the device.
  ///
  /// [userName]: The name of the IAM user for whom you want to enable the MFA
  /// device.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  ///
  /// [serialNumber]: The serial number that uniquely identifies the MFA device.
  /// For virtual MFA devices, the serial number is the device ARN.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: =,.@:/-
  ///
  /// [authenticationCode1]: An authentication code emitted by the device.
  ///
  /// The format for this parameter is a string of six digits.
  ///
  ///
  ///
  /// Submit your request immediately after generating the authentication codes.
  /// If you generate the codes and then wait too long to submit the request,
  /// the MFA device successfully associates with the user but the MFA device
  /// becomes out of sync. This happens because time-based one-time passwords
  /// (TOTP) expire after a short period of time. If this happens, you can
  /// [resync the
  /// device](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_mfa_sync.html).
  ///
  /// [authenticationCode2]: A subsequent authentication code emitted by the
  /// device.
  ///
  /// The format for this parameter is a string of six digits.
  ///
  ///
  ///
  /// Submit your request immediately after generating the authentication codes.
  /// If you generate the codes and then wait too long to submit the request,
  /// the MFA device successfully associates with the user but the MFA device
  /// becomes out of sync. This happens because time-based one-time passwords
  /// (TOTP) expire after a short period of time. If this happens, you can
  /// [resync the
  /// device](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_mfa_sync.html).
  Future<void> enableMfaDevice(
      {@required String userName,
      @required String serialNumber,
      @required String authenticationCode1,
      @required String authenticationCode2}) async {}

  ///  Generates a credential report for the AWS account. For more information
  /// about the credential report, see [Getting Credential
  /// Reports](https://docs.aws.amazon.com/IAM/latest/UserGuide/credential-reports.html)
  /// in the _IAM User Guide_.
  Future<GenerateCredentialReportResponse> generateCredentialReport() async {
    return GenerateCredentialReportResponse.fromJson({});
  }

  /// Generates a report for service last accessed data for AWS Organizations.
  /// You can generate a report for any entities (organization root,
  /// organizational unit, or account) or policies in your organization.
  ///
  /// To call this operation, you must be signed in using your AWS Organizations
  /// master account credentials. You can use your long-term IAM user or root
  /// user credentials, or temporary credentials from assuming an IAM role. SCPs
  /// must be enabled for your organization root. You must have the required IAM
  /// and AWS Organizations permissions. For more information, see [Refining
  /// Permissions Using Service Last Accessed
  /// Data](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html)
  /// in the _IAM User Guide_.
  ///
  /// You can generate a service last accessed data report for entities by
  /// specifying only the entity's path. This data includes a list of services
  /// that are allowed by any service control policies (SCPs) that apply to the
  /// entity.
  ///
  /// You can generate a service last accessed data report for a policy by
  /// specifying an entity's path and an optional AWS Organizations policy ID.
  /// This data includes a list of services that are allowed by the specified
  /// SCP.
  ///
  /// For each service in both report types, the data includes the most recent
  /// account activity that the policy allows to account principals in the
  /// entity or the entity's children. For important information about the data,
  /// reporting period, permissions required, troubleshooting, and supported
  /// Regions see [Reducing Permissions Using Service Last Accessed
  /// Data](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html)
  /// in the _IAM User Guide_.
  ///
  ///  The data includes all attempts to access AWS, not just the successful
  /// ones. This includes all attempts that were made using the AWS Management
  /// Console, the AWS API through any of the SDKs, or any of the command line
  /// tools. An unexpected entry in the service last accessed data does not mean
  /// that an account has been compromised, because the request might have been
  /// denied. Refer to your CloudTrail logs as the authoritative source for
  /// information about all API calls and whether they were successful or denied
  /// access. For more information, see [Logging IAM Events with
  /// CloudTrail](https://docs.aws.amazon.com/IAM/latest/UserGuide/cloudtrail-integration.html)
  /// in the _IAM User Guide_.
  ///
  /// This operation returns a `JobId`. Use this parameter in the
  /// `GetOrganizationsAccessReport`  operation to check the status of the
  /// report generation. To check the status of this request, use the `JobId`
  /// parameter in the  `GetOrganizationsAccessReport`  operation and test the
  /// `JobStatus` response parameter. When the job is complete, you can retrieve
  /// the report.
  ///
  /// To generate a service last accessed data report for entities, specify an
  /// entity path without specifying the optional AWS Organizations policy ID.
  /// The type of entity that you specify determines the data returned in the
  /// report.
  ///
  /// *    **Root** – When you specify the organizations root as the entity, the
  /// resulting report lists all of the services allowed by SCPs that are
  /// attached to your root. For each service, the report includes data for all
  /// accounts in your organization except the master account, because the
  /// master account is not limited by SCPs.
  ///
  /// *    **OU** – When you specify an organizational unit (OU) as the entity,
  /// the resulting report lists all of the services allowed by SCPs that are
  /// attached to the OU and its parents. For each service, the report includes
  /// data for all accounts in the OU or its children. This data excludes the
  /// master account, because the master account is not limited by SCPs.
  ///
  /// *    **Master account** – When you specify the master account, the
  /// resulting report lists all AWS services, because the master account is not
  /// limited by SCPs. For each service, the report includes data for only the
  /// master account.
  ///
  /// *    **Account** – When you specify another account as the entity, the
  /// resulting report lists all of the services allowed by SCPs that are
  /// attached to the account and its parents. For each service, the report
  /// includes data for only the specified account.
  ///
  ///
  /// To generate a service last accessed data report for policies, specify an
  /// entity path and the optional AWS Organizations policy ID. The type of
  /// entity that you specify determines the data returned for each service.
  ///
  /// *    **Root** – When you specify the root entity and a policy ID, the
  /// resulting report lists all of the services that are allowed by the
  /// specified SCP. For each service, the report includes data for all accounts
  /// in your organization to which the SCP applies. This data excludes the
  /// master account, because the master account is not limited by SCPs. If the
  /// SCP is not attached to any entities in the organization, then the report
  /// will return a list of services with no data.
  ///
  /// *    **OU** – When you specify an OU entity and a policy ID, the resulting
  /// report lists all of the services that are allowed by the specified SCP.
  /// For each service, the report includes data for all accounts in the OU or
  /// its children to which the SCP applies. This means that other accounts
  /// outside the OU that are affected by the SCP might not be included in the
  /// data. This data excludes the master account, because the master account is
  /// not limited by SCPs. If the SCP is not attached to the OU or one of its
  /// children, the report will return a list of services with no data.
  ///
  /// *    **Master account** – When you specify the master account, the
  /// resulting report lists all AWS services, because the master account is not
  /// limited by SCPs. If you specify a policy ID in the CLI or API, the policy
  /// is ignored. For each service, the report includes data for only the master
  /// account.
  ///
  /// *    **Account** – When you specify another account entity and a policy
  /// ID, the resulting report lists all of the services that are allowed by the
  /// specified SCP. For each service, the report includes data for only the
  /// specified account. This means that other accounts in the organization that
  /// are affected by the SCP might not be included in the data. If the SCP is
  /// not attached to the account, the report will return a list of services
  /// with no data.
  ///
  ///
  ///  Service last accessed data does not use other policy types when
  /// determining whether a principal could access a service. These other policy
  /// types include identity-based policies, resource-based policies, access
  /// control lists, IAM permissions boundaries, and STS assume role policies.
  /// It only applies SCP logic. For more about the evaluation of policy types,
  /// see [Evaluating
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_evaluation-logic.html#policy-eval-basics)
  /// in the _IAM User Guide_.
  ///
  /// For more information about service last accessed data, see [Reducing
  /// Policy Scope by Viewing User
  /// Activity](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html)
  /// in the _IAM User Guide_.
  ///
  /// [entityPath]: The path of the AWS Organizations entity (root, OU, or
  /// account). You can build an entity path using the known structure of your
  /// organization. For example, assume that your account ID is `123456789012`
  /// and its parent OU ID is `ou-rge0-awsabcde`. The organization root ID is
  /// `r-f6g7h8i9j0example` and your organization ID is `o-a1b2c3d4e5`. Your
  /// entity path is
  /// `o-a1b2c3d4e5/r-f6g7h8i9j0example/ou-rge0-awsabcde/123456789012`.
  ///
  /// [organizationsPolicyId]: The identifier of the AWS Organizations service
  /// control policy (SCP). This parameter is optional.
  ///
  /// This ID is used to generate information about when an account principal
  /// that is limited by the SCP attempted to access an AWS service.
  Future<GenerateOrganizationsAccessReportResponse>
      generateOrganizationsAccessReport(String entityPath,
          {String organizationsPolicyId}) async {
    return GenerateOrganizationsAccessReportResponse.fromJson({});
  }

  /// Generates a report that includes details about when an IAM resource (user,
  /// group, role, or policy) was last used in an attempt to access AWS
  /// services. Recent activity usually appears within four hours. IAM reports
  /// activity for the last 365 days, or less if your Region began supporting
  /// this feature within the last year. For more information, see [Regions
  /// Where Data Is
  /// Tracked](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#access-advisor_tracking-period).
  ///
  ///  The service last accessed data includes all attempts to access an AWS
  /// API, not just the successful ones. This includes all attempts that were
  /// made using the AWS Management Console, the AWS API through any of the
  /// SDKs, or any of the command line tools. An unexpected entry in the service
  /// last accessed data does not mean that your account has been compromised,
  /// because the request might have been denied. Refer to your CloudTrail logs
  /// as the authoritative source for information about all API calls and
  /// whether they were successful or denied access. For more information,
  /// see [Logging IAM Events with
  /// CloudTrail](https://docs.aws.amazon.com/IAM/latest/UserGuide/cloudtrail-integration.html)
  /// in the _IAM User Guide_.
  ///
  /// The `GenerateServiceLastAccessedDetails` operation returns a `JobId`. Use
  /// this parameter in the following operations to retrieve the following
  /// details from your report:
  ///
  /// *    GetServiceLastAccessedDetails – Use this operation for users, groups,
  /// roles, or policies to list every AWS service that the resource could
  /// access using permissions policies. For each service, the response includes
  /// information about the most recent access attempt.
  ///
  /// *    GetServiceLastAccessedDetailsWithEntities – Use this operation for
  /// groups and policies to list information about the associated entities
  /// (users or roles) that attempted to access a specific AWS service.
  ///
  ///
  /// To check the status of the `GenerateServiceLastAccessedDetails` request,
  /// use the `JobId` parameter in the same operations and test the `JobStatus`
  /// response parameter.
  ///
  /// For additional information about the permissions policies that allow an
  /// identity (user, group, or role) to access specific services, use the
  /// ListPoliciesGrantingServiceAccess operation.
  ///
  ///  Service last accessed data does not use other policy types when
  /// determining whether a resource could access a service. These other policy
  /// types include resource-based policies, access control lists, AWS
  /// Organizations policies, IAM permissions boundaries, and AWS STS assume
  /// role policies. It only applies permissions policy logic. For more about
  /// the evaluation of policy types, see [Evaluating
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_evaluation-logic.html#policy-eval-basics)
  /// in the _IAM User Guide_.
  ///
  /// For more information about service last accessed data, see [Reducing
  /// Policy Scope by Viewing User
  /// Activity](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html)
  /// in the _IAM User Guide_.
  ///
  /// [arn]: The ARN of the IAM resource (user, group, role, or managed policy)
  /// used to generate information about when the resource was last used in an
  /// attempt to access an AWS service.
  Future<GenerateServiceLastAccessedDetailsResponse>
      generateServiceLastAccessedDetails(String arn) async {
    return GenerateServiceLastAccessedDetailsResponse.fromJson({});
  }

  /// Retrieves information about when the specified access key was last used.
  /// The information includes the date and time of last use, along with the AWS
  /// service and Region that were specified in the last request made with that
  /// key.
  ///
  /// [accessKeyId]: The identifier of an access key.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters that can
  /// consist of any upper or lowercased letter or digit.
  Future<GetAccessKeyLastUsedResponse> getAccessKeyLastUsed(
      String accessKeyId) async {
    return GetAccessKeyLastUsedResponse.fromJson({});
  }

  /// Retrieves information about all IAM users, groups, roles, and policies in
  /// your AWS account, including their relationships to one another. Use this
  /// API to obtain a snapshot of the configuration of IAM permissions (users,
  /// groups, roles, and policies) in your account.
  ///
  ///  Policies returned by this API are URL-encoded compliant with [RFC
  /// 3986](https://tools.ietf.org/html/rfc3986). You can use a URL decoding
  /// method to convert the policy back to plain JSON text. For example, if you
  /// use Java, you can use the `decode` method of the `java.net.URLDecoder`
  /// utility class in the Java SDK. Other languages and SDKs provide similar
  /// functionality.
  ///
  /// You can optionally filter the results using the `Filter` parameter. You
  /// can paginate the results using the `MaxItems` and `Marker` parameters.
  ///
  /// [filter]: A list of entity types used to filter the results. Only the
  /// entities that match the types you specify are included in the output. Use
  /// the value `LocalManagedPolicy` to include customer managed policies.
  ///
  /// The format for this parameter is a comma-separated (if more than one) list
  /// of strings. Each string value in the list must be one of the valid values
  /// listed below.
  ///
  /// [maxItems]: Use this only when paginating results to indicate the maximum
  /// number of items you want in the response. If additional items exist beyond
  /// the maximum you specify, the `IsTruncated` response element is `true`.
  ///
  /// If you do not include this parameter, the number of items defaults to 100.
  /// Note that IAM might return fewer results, even when there are more results
  /// available. In that case, the `IsTruncated` response element returns
  /// `true`, and `Marker` contains a value to include in the subsequent call
  /// that tells the service where to continue from.
  ///
  /// [marker]: Use this parameter only when paginating results and only after
  /// you receive a response indicating that the results are truncated. Set it
  /// to the value of the `Marker` element in the response that you received to
  /// indicate where the next call should start.
  Future<GetAccountAuthorizationDetailsResponse> getAccountAuthorizationDetails(
      {List<String> filter, int maxItems, String marker}) async {
    return GetAccountAuthorizationDetailsResponse.fromJson({});
  }

  /// Retrieves the password policy for the AWS account. For more information
  /// about using a password policy, go to [Managing an IAM Password
  /// Policy](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_ManagingPasswordPolicies.html).
  Future<GetAccountPasswordPolicyResponse> getAccountPasswordPolicy() async {
    return GetAccountPasswordPolicyResponse.fromJson({});
  }

  /// Retrieves information about IAM entity usage and IAM quotas in the AWS
  /// account.
  ///
  ///  For information about limitations on IAM entities, see [Limitations on
  /// IAM
  /// Entities](https://docs.aws.amazon.com/IAM/latest/UserGuide/LimitationsOnEntities.html)
  /// in the _IAM User Guide_.
  Future<GetAccountSummaryResponse> getAccountSummary() async {
    return GetAccountSummaryResponse.fromJson({});
  }

  /// Gets a list of all of the context keys referenced in the input policies.
  /// The policies are supplied as a list of one or more strings. To get the
  /// context keys from policies associated with an IAM user, group, or role,
  /// use GetContextKeysForPrincipalPolicy.
  ///
  /// Context keys are variables maintained by AWS and its services that provide
  /// details about the context of an API query request. Context keys can be
  /// evaluated by testing against a value specified in an IAM policy. Use
  /// `GetContextKeysForCustomPolicy` to understand what key names and values
  /// you must supply when you call SimulateCustomPolicy. Note that all
  /// parameters are shown in unencoded form here for clarity but must be URL
  /// encoded to be included as a part of a real HTML request.
  ///
  /// [policyInputList]: A list of policies for which you want the list of
  /// context keys referenced in those policies. Each document is specified as a
  /// string containing the complete, valid JSON text of an IAM policy.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) used to validate this
  /// parameter is a string of characters consisting of the following:
  ///
  /// *   Any printable ASCII character ranging from the space character
  /// (\\u0020) through the end of the ASCII character range
  ///
  /// *   The printable characters in the Basic Latin and Latin-1 Supplement
  /// character set (through \\u00FF)
  ///
  /// *   The special characters tab (\\u0009), line feed (\\u000A), and
  /// carriage return (\\u000D)
  Future<GetContextKeysForPolicyResponse> getContextKeysForCustomPolicy(
      List<String> policyInputList) async {
    return GetContextKeysForPolicyResponse.fromJson({});
  }

  /// Gets a list of all of the context keys referenced in all the IAM policies
  /// that are attached to the specified IAM entity. The entity can be an IAM
  /// user, group, or role. If you specify a user, then the request also
  /// includes all of the policies attached to groups that the user is a member
  /// of.
  ///
  /// You can optionally include a list of one or more additional policies,
  /// specified as strings. If you want to include _only_ a list of policies by
  /// string, use GetContextKeysForCustomPolicy instead.
  ///
  ///  **Note:** This API discloses information about the permissions granted to
  /// other users. If you do not want users to see other user's permissions,
  /// then consider allowing them to use GetContextKeysForCustomPolicy instead.
  ///
  /// Context keys are variables maintained by AWS and its services that provide
  /// details about the context of an API query request. Context keys can be
  /// evaluated by testing against a value in an IAM policy. Use
  /// GetContextKeysForPrincipalPolicy to understand what key names and values
  /// you must supply when you call SimulatePrincipalPolicy.
  ///
  /// [policySourceArn]: The ARN of a user, group, or role whose policies
  /// contain the context keys that you want listed. If you specify a user, the
  /// list includes context keys that are found in all policies that are
  /// attached to the user. The list also includes all groups that the user is a
  /// member of. If you pick a group or a role, then it includes only those
  /// context keys that are found in policies attached to that entity. Note that
  /// all parameters are shown in unencoded form here for clarity, but must be
  /// URL encoded to be included as a part of a real HTML request.
  ///
  /// For more information about ARNs, see [Amazon Resource Names (ARNs) and AWS
  /// Service
  /// Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html)
  /// in the _AWS General Reference_.
  ///
  /// [policyInputList]: An optional list of additional policies for which you
  /// want the list of context keys that are referenced.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) used to validate this
  /// parameter is a string of characters consisting of the following:
  ///
  /// *   Any printable ASCII character ranging from the space character
  /// (\\u0020) through the end of the ASCII character range
  ///
  /// *   The printable characters in the Basic Latin and Latin-1 Supplement
  /// character set (through \\u00FF)
  ///
  /// *   The special characters tab (\\u0009), line feed (\\u000A), and
  /// carriage return (\\u000D)
  Future<GetContextKeysForPolicyResponse> getContextKeysForPrincipalPolicy(
      String policySourceArn,
      {List<String> policyInputList}) async {
    return GetContextKeysForPolicyResponse.fromJson({});
  }

  ///  Retrieves a credential report for the AWS account. For more information
  /// about the credential report, see [Getting Credential
  /// Reports](https://docs.aws.amazon.com/IAM/latest/UserGuide/credential-reports.html)
  /// in the _IAM User Guide_.
  Future<GetCredentialReportResponse> getCredentialReport() async {
    return GetCredentialReportResponse.fromJson({});
  }

  ///  Returns a list of IAM users that are in the specified IAM group. You can
  /// paginate the results using the `MaxItems` and `Marker` parameters.
  ///
  /// [groupName]: The name of the group.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  ///
  /// [marker]: Use this parameter only when paginating results and only after
  /// you receive a response indicating that the results are truncated. Set it
  /// to the value of the `Marker` element in the response that you received to
  /// indicate where the next call should start.
  ///
  /// [maxItems]: Use this only when paginating results to indicate the maximum
  /// number of items you want in the response. If additional items exist beyond
  /// the maximum you specify, the `IsTruncated` response element is `true`.
  ///
  /// If you do not include this parameter, the number of items defaults to 100.
  /// Note that IAM might return fewer results, even when there are more results
  /// available. In that case, the `IsTruncated` response element returns
  /// `true`, and `Marker` contains a value to include in the subsequent call
  /// that tells the service where to continue from.
  Future<GetGroupResponse> getGroup(String groupName,
      {String marker, int maxItems}) async {
    return GetGroupResponse.fromJson({});
  }

  /// Retrieves the specified inline policy document that is embedded in the
  /// specified IAM group.
  ///
  ///  Policies returned by this API are URL-encoded compliant with [RFC
  /// 3986](https://tools.ietf.org/html/rfc3986). You can use a URL decoding
  /// method to convert the policy back to plain JSON text. For example, if you
  /// use Java, you can use the `decode` method of the `java.net.URLDecoder`
  /// utility class in the Java SDK. Other languages and SDKs provide similar
  /// functionality.
  ///
  /// An IAM group can also have managed policies attached to it. To retrieve a
  /// managed policy document that is attached to a group, use GetPolicy to
  /// determine the policy's default version, then use GetPolicyVersion to
  /// retrieve the policy document.
  ///
  /// For more information about policies, see [Managed Policies and Inline
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html)
  /// in the _IAM User Guide_.
  ///
  /// [groupName]: The name of the group the policy is associated with.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  ///
  /// [policyName]: The name of the policy document to get.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  Future<GetGroupPolicyResponse> getGroupPolicy(
      {@required String groupName, @required String policyName}) async {
    return GetGroupPolicyResponse.fromJson({});
  }

  ///  Retrieves information about the specified instance profile, including the
  /// instance profile's path, GUID, ARN, and role. For more information about
  /// instance profiles, see [About Instance
  /// Profiles](https://docs.aws.amazon.com/IAM/latest/UserGuide/AboutInstanceProfiles.html)
  /// in the _IAM User Guide_.
  ///
  /// [instanceProfileName]: The name of the instance profile to get information
  /// about.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  Future<GetInstanceProfileResponse> getInstanceProfile(
      String instanceProfileName) async {
    return GetInstanceProfileResponse.fromJson({});
  }

  /// Retrieves the user name and password-creation date for the specified IAM
  /// user. If the user has not been assigned a password, the operation returns
  /// a 404 (`NoSuchEntity`) error.
  ///
  /// [userName]: The name of the user whose login profile you want to retrieve.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  Future<GetLoginProfileResponse> getLoginProfile(String userName) async {
    return GetLoginProfileResponse.fromJson({});
  }

  /// Returns information about the specified OpenID Connect (OIDC) provider
  /// resource object in IAM.
  ///
  /// [openIDConnectProviderArn]: The Amazon Resource Name (ARN) of the OIDC
  /// provider resource object in IAM to get information for. You can get a list
  /// of OIDC provider resource ARNs by using the ListOpenIDConnectProviders
  /// operation.
  ///
  /// For more information about ARNs, see [Amazon Resource Names (ARNs) and AWS
  /// Service
  /// Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html)
  /// in the _AWS General Reference_.
  Future<GetOpenIDConnectProviderResponse> getOpenIDConnectProvider(
      String openIDConnectProviderArn) async {
    return GetOpenIDConnectProviderResponse.fromJson({});
  }

  /// Retrieves the service last accessed data report for AWS Organizations that
  /// was previously generated using the  `GenerateOrganizationsAccessReport`
  /// operation. This operation retrieves the status of your report job and the
  /// report contents.
  ///
  /// Depending on the parameters that you passed when you generated the report,
  /// the data returned could include different information. For details, see
  /// GenerateOrganizationsAccessReport.
  ///
  /// To call this operation, you must be signed in to the master account in
  /// your organization. SCPs must be enabled for your organization root. You
  /// must have permissions to perform this operation. For more information, see
  /// [Refining Permissions Using Service Last Accessed
  /// Data](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html)
  /// in the _IAM User Guide_.
  ///
  /// For each service that principals in an account (root users, IAM users, or
  /// IAM roles) could access using SCPs, the operation returns details about
  /// the most recent access attempt. If there was no attempt, the service is
  /// listed without details about the most recent attempt to access the
  /// service. If the operation fails, it returns the reason that it failed.
  ///
  /// By default, the list is sorted by service namespace.
  ///
  /// [jobId]: The identifier of the request generated by the
  /// GenerateOrganizationsAccessReport operation.
  ///
  /// [maxItems]: Use this only when paginating results to indicate the maximum
  /// number of items you want in the response. If additional items exist beyond
  /// the maximum you specify, the `IsTruncated` response element is `true`.
  ///
  /// If you do not include this parameter, the number of items defaults to 100.
  /// Note that IAM might return fewer results, even when there are more results
  /// available. In that case, the `IsTruncated` response element returns
  /// `true`, and `Marker` contains a value to include in the subsequent call
  /// that tells the service where to continue from.
  ///
  /// [marker]: Use this parameter only when paginating results and only after
  /// you receive a response indicating that the results are truncated. Set it
  /// to the value of the `Marker` element in the response that you received to
  /// indicate where the next call should start.
  ///
  /// [sortKey]: The key that is used to sort the results. If you choose the
  /// namespace key, the results are returned in alphabetical order. If you
  /// choose the time key, the results are sorted numerically by the date and
  /// time.
  Future<GetOrganizationsAccessReportResponse> getOrganizationsAccessReport(
      String jobId,
      {int maxItems,
      String marker,
      String sortKey}) async {
    return GetOrganizationsAccessReportResponse.fromJson({});
  }

  /// Retrieves information about the specified managed policy, including the
  /// policy's default version and the total number of IAM users, groups, and
  /// roles to which the policy is attached. To retrieve the list of the
  /// specific users, groups, and roles that the policy is attached to, use the
  /// ListEntitiesForPolicy API. This API returns metadata about the policy. To
  /// retrieve the actual policy document for a specific version of the policy,
  /// use GetPolicyVersion.
  ///
  /// This API retrieves information about managed policies. To retrieve
  /// information about an inline policy that is embedded with an IAM user,
  /// group, or role, use the GetUserPolicy, GetGroupPolicy, or GetRolePolicy
  /// API.
  ///
  /// For more information about policies, see [Managed Policies and Inline
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html)
  /// in the _IAM User Guide_.
  ///
  /// [policyArn]: The Amazon Resource Name (ARN) of the managed policy that you
  /// want information about.
  ///
  /// For more information about ARNs, see [Amazon Resource Names (ARNs) and AWS
  /// Service
  /// Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html)
  /// in the _AWS General Reference_.
  Future<GetPolicyResponse> getPolicy(String policyArn) async {
    return GetPolicyResponse.fromJson({});
  }

  /// Retrieves information about the specified version of the specified managed
  /// policy, including the policy document.
  ///
  ///  Policies returned by this API are URL-encoded compliant with [RFC
  /// 3986](https://tools.ietf.org/html/rfc3986). You can use a URL decoding
  /// method to convert the policy back to plain JSON text. For example, if you
  /// use Java, you can use the `decode` method of the `java.net.URLDecoder`
  /// utility class in the Java SDK. Other languages and SDKs provide similar
  /// functionality.
  ///
  /// To list the available versions for a policy, use ListPolicyVersions.
  ///
  /// This API retrieves information about managed policies. To retrieve
  /// information about an inline policy that is embedded in a user, group, or
  /// role, use the GetUserPolicy, GetGroupPolicy, or GetRolePolicy API.
  ///
  /// For more information about the types of policies, see [Managed Policies
  /// and Inline
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html)
  /// in the _IAM User Guide_.
  ///
  /// For more information about managed policy versions, see [Versioning for
  /// Managed
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-versions.html)
  /// in the _IAM User Guide_.
  ///
  /// [policyArn]: The Amazon Resource Name (ARN) of the managed policy that you
  /// want information about.
  ///
  /// For more information about ARNs, see [Amazon Resource Names (ARNs) and AWS
  /// Service
  /// Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html)
  /// in the _AWS General Reference_.
  ///
  /// [versionId]: Identifies the policy version to retrieve.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters that
  /// consists of the lowercase letter 'v' followed by one or two digits, and
  /// optionally followed by a period '.' and a string of letters and digits.
  Future<GetPolicyVersionResponse> getPolicyVersion(
      {@required String policyArn, @required String versionId}) async {
    return GetPolicyVersionResponse.fromJson({});
  }

  /// Retrieves information about the specified role, including the role's path,
  /// GUID, ARN, and the role's trust policy that grants permission to assume
  /// the role. For more information about roles, see [Working with
  /// Roles](https://docs.aws.amazon.com/IAM/latest/UserGuide/WorkingWithRoles.html).
  ///
  ///
  ///
  /// Policies returned by this API are URL-encoded compliant with [RFC
  /// 3986](https://tools.ietf.org/html/rfc3986). You can use a URL decoding
  /// method to convert the policy back to plain JSON text. For example, if you
  /// use Java, you can use the `decode` method of the `java.net.URLDecoder`
  /// utility class in the Java SDK. Other languages and SDKs provide similar
  /// functionality.
  ///
  /// [roleName]: The name of the IAM role to get information about.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  Future<GetRoleResponse> getRole(String roleName) async {
    return GetRoleResponse.fromJson({});
  }

  /// Retrieves the specified inline policy document that is embedded with the
  /// specified IAM role.
  ///
  ///  Policies returned by this API are URL-encoded compliant with [RFC
  /// 3986](https://tools.ietf.org/html/rfc3986). You can use a URL decoding
  /// method to convert the policy back to plain JSON text. For example, if you
  /// use Java, you can use the `decode` method of the `java.net.URLDecoder`
  /// utility class in the Java SDK. Other languages and SDKs provide similar
  /// functionality.
  ///
  /// An IAM role can also have managed policies attached to it. To retrieve a
  /// managed policy document that is attached to a role, use GetPolicy to
  /// determine the policy's default version, then use GetPolicyVersion to
  /// retrieve the policy document.
  ///
  /// For more information about policies, see [Managed Policies and Inline
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html)
  /// in the _IAM User Guide_.
  ///
  /// For more information about roles, see [Using Roles to Delegate Permissions
  /// and Federate
  /// Identities](https://docs.aws.amazon.com/IAM/latest/UserGuide/roles-toplevel.html).
  ///
  /// [roleName]: The name of the role associated with the policy.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  ///
  /// [policyName]: The name of the policy document to get.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  Future<GetRolePolicyResponse> getRolePolicy(
      {@required String roleName, @required String policyName}) async {
    return GetRolePolicyResponse.fromJson({});
  }

  /// Returns the SAML provider metadocument that was uploaded when the IAM SAML
  /// provider resource object was created or updated.
  ///
  ///
  ///
  /// This operation requires [Signature Version
  /// 4](https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html).
  ///
  /// [samlProviderArn]: The Amazon Resource Name (ARN) of the SAML provider
  /// resource object in IAM to get information about.
  ///
  /// For more information about ARNs, see [Amazon Resource Names (ARNs) and AWS
  /// Service
  /// Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html)
  /// in the _AWS General Reference_.
  Future<GetSamlProviderResponse> getSamlProvider(
      String samlProviderArn) async {
    return GetSamlProviderResponse.fromJson({});
  }

  /// Retrieves the specified SSH public key, including metadata about the key.
  ///
  /// The SSH public key retrieved by this operation is used only for
  /// authenticating the associated IAM user to an AWS CodeCommit repository.
  /// For more information about using SSH keys to authenticate to an AWS
  /// CodeCommit repository, see [Set up AWS CodeCommit for SSH
  /// Connections](https://docs.aws.amazon.com/codecommit/latest/userguide/setting-up-credentials-ssh.html)
  /// in the _AWS CodeCommit User Guide_.
  ///
  /// [userName]: The name of the IAM user associated with the SSH public key.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  ///
  /// [sshPublicKeyId]: The unique identifier for the SSH public key.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters that can
  /// consist of any upper or lowercased letter or digit.
  ///
  /// [encoding]: Specifies the public key encoding format to use in the
  /// response. To retrieve the public key in ssh-rsa format, use `SSH`. To
  /// retrieve the public key in PEM format, use `PEM`.
  Future<GetSshPublicKeyResponse> getSshPublicKey(
      {@required String userName,
      @required String sshPublicKeyId,
      @required String encoding}) async {
    return GetSshPublicKeyResponse.fromJson({});
  }

  /// Retrieves information about the specified server certificate stored in
  /// IAM.
  ///
  /// For more information about working with server certificates, see [Working
  /// with Server
  /// Certificates](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_server-certs.html)
  /// in the _IAM User Guide_. This topic includes a list of AWS services that
  /// can use the server certificates that you manage with IAM.
  ///
  /// [serverCertificateName]: The name of the server certificate you want to
  /// retrieve information about.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  Future<GetServerCertificateResponse> getServerCertificate(
      String serverCertificateName) async {
    return GetServerCertificateResponse.fromJson({});
  }

  /// Retrieves a service last accessed report that was created using the
  /// `GenerateServiceLastAccessedDetails` operation. You can use the `JobId`
  /// parameter in `GetServiceLastAccessedDetails` to retrieve the status of
  /// your report job. When the report is complete, you can retrieve the
  /// generated report. The report includes a list of AWS services that the
  /// resource (user, group, role, or managed policy) can access.
  ///
  ///  Service last accessed data does not use other policy types when
  /// determining whether a resource could access a service. These other policy
  /// types include resource-based policies, access control lists, AWS
  /// Organizations policies, IAM permissions boundaries, and AWS STS assume
  /// role policies. It only applies permissions policy logic. For more about
  /// the evaluation of policy types, see [Evaluating
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_evaluation-logic.html#policy-eval-basics)
  /// in the _IAM User Guide_.
  ///
  /// For each service that the resource could access using permissions
  /// policies, the operation returns details about the most recent access
  /// attempt. If there was no attempt, the service is listed without details
  /// about the most recent attempt to access the service. If the operation
  /// fails, the `GetServiceLastAccessedDetails` operation returns the reason
  /// that it failed.
  ///
  /// The `GetServiceLastAccessedDetails` operation returns a list of services.
  /// This list includes the number of entities that have attempted to access
  /// the service and the date and time of the last attempt. It also returns the
  /// ARN of the following entity, depending on the resource ARN that you used
  /// to generate the report:
  ///
  /// *    **User** – Returns the user ARN that you used to generate the report
  ///
  /// *    **Group** – Returns the ARN of the group member (user) that last
  /// attempted to access the service
  ///
  /// *    **Role** – Returns the role ARN that you used to generate the report
  ///
  /// *    **Policy** – Returns the ARN of the user or role that last used the
  /// policy to attempt to access the service
  ///
  ///
  /// By default, the list is sorted by service namespace.
  ///
  /// [jobId]: The ID of the request generated by the
  /// GenerateServiceLastAccessedDetails operation.
  ///
  /// [maxItems]: Use this only when paginating results to indicate the maximum
  /// number of items you want in the response. If additional items exist beyond
  /// the maximum you specify, the `IsTruncated` response element is `true`.
  ///
  /// If you do not include this parameter, the number of items defaults to 100.
  /// Note that IAM might return fewer results, even when there are more results
  /// available. In that case, the `IsTruncated` response element returns
  /// `true`, and `Marker` contains a value to include in the subsequent call
  /// that tells the service where to continue from.
  ///
  /// [marker]: Use this parameter only when paginating results and only after
  /// you receive a response indicating that the results are truncated. Set it
  /// to the value of the `Marker` element in the response that you received to
  /// indicate where the next call should start.
  Future<GetServiceLastAccessedDetailsResponse> getServiceLastAccessedDetails(
      String jobId,
      {int maxItems,
      String marker}) async {
    return GetServiceLastAccessedDetailsResponse.fromJson({});
  }

  /// After you generate a group or policy report using the
  /// `GenerateServiceLastAccessedDetails` operation, you can use the `JobId`
  /// parameter in `GetServiceLastAccessedDetailsWithEntities`. This operation
  /// retrieves the status of your report job and a list of entities that could
  /// have used group or policy permissions to access the specified service.
  ///
  /// *    **Group** – For a group report, this operation returns a list of
  /// users in the group that could have used the group’s policies in an attempt
  /// to access the service.
  ///
  /// *    **Policy** – For a policy report, this operation returns a list of
  /// entities (users or roles) that could have used the policy in an attempt to
  /// access the service.
  ///
  ///
  /// You can also use this operation for user or role reports to retrieve
  /// details about those entities.
  ///
  /// If the operation fails, the `GetServiceLastAccessedDetailsWithEntities`
  /// operation returns the reason that it failed.
  ///
  /// By default, the list of associated entities is sorted by date, with the
  /// most recent access listed first.
  ///
  /// [jobId]: The ID of the request generated by the
  /// `GenerateServiceLastAccessedDetails` operation.
  ///
  /// [serviceNamespace]: The service namespace for an AWS service. Provide the
  /// service namespace to learn when the IAM entity last attempted to access
  /// the specified service.
  ///
  /// To learn the service namespace for a service, go to [Actions, Resources,
  /// and Condition Keys for AWS
  /// Services](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_actions-resources-contextkeys.html)
  /// in the _IAM User Guide_. Choose the name of the service to view details
  /// for that service. In the first paragraph, find the service prefix. For
  /// example, `(service prefix: a4b)`. For more information about service
  /// namespaces, see [AWS Service
  /// Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#genref-aws-service-namespaces)
  /// in the _AWS General Reference_.
  ///
  /// [maxItems]: Use this only when paginating results to indicate the maximum
  /// number of items you want in the response. If additional items exist beyond
  /// the maximum you specify, the `IsTruncated` response element is `true`.
  ///
  /// If you do not include this parameter, the number of items defaults to 100.
  /// Note that IAM might return fewer results, even when there are more results
  /// available. In that case, the `IsTruncated` response element returns
  /// `true`, and `Marker` contains a value to include in the subsequent call
  /// that tells the service where to continue from.
  ///
  /// [marker]: Use this parameter only when paginating results and only after
  /// you receive a response indicating that the results are truncated. Set it
  /// to the value of the `Marker` element in the response that you received to
  /// indicate where the next call should start.
  Future<GetServiceLastAccessedDetailsWithEntitiesResponse>
      getServiceLastAccessedDetailsWithEntities(
          {@required String jobId,
          @required String serviceNamespace,
          int maxItems,
          String marker}) async {
    return GetServiceLastAccessedDetailsWithEntitiesResponse.fromJson({});
  }

  /// Retrieves the status of your service-linked role deletion. After you use
  /// the DeleteServiceLinkedRole API operation to submit a service-linked role
  /// for deletion, you can use the `DeletionTaskId` parameter in
  /// `GetServiceLinkedRoleDeletionStatus` to check the status of the deletion.
  /// If the deletion fails, this operation returns the reason that it failed,
  /// if that information is returned by the service.
  ///
  /// [deletionTaskId]: The deletion task identifier. This identifier is
  /// returned by the DeleteServiceLinkedRole operation in the format
  /// `task/aws-service-role/<service-principal-name>/<role-name>/<task-uuid>`.
  Future<GetServiceLinkedRoleDeletionStatusResponse>
      getServiceLinkedRoleDeletionStatus(String deletionTaskId) async {
    return GetServiceLinkedRoleDeletionStatusResponse.fromJson({});
  }

  /// Retrieves information about the specified IAM user, including the user's
  /// creation date, path, unique ID, and ARN.
  ///
  /// If you do not specify a user name, IAM determines the user name implicitly
  /// based on the AWS access key ID used to sign the request to this API.
  ///
  /// [userName]: The name of the user to get information about.
  ///
  /// This parameter is optional. If it is not included, it defaults to the user
  /// making the request. This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  Future<GetUserResponse> getUser({String userName}) async {
    return GetUserResponse.fromJson({});
  }

  /// Retrieves the specified inline policy document that is embedded in the
  /// specified IAM user.
  ///
  ///  Policies returned by this API are URL-encoded compliant with [RFC
  /// 3986](https://tools.ietf.org/html/rfc3986). You can use a URL decoding
  /// method to convert the policy back to plain JSON text. For example, if you
  /// use Java, you can use the `decode` method of the `java.net.URLDecoder`
  /// utility class in the Java SDK. Other languages and SDKs provide similar
  /// functionality.
  ///
  /// An IAM user can also have managed policies attached to it. To retrieve a
  /// managed policy document that is attached to a user, use GetPolicy to
  /// determine the policy's default version. Then use GetPolicyVersion to
  /// retrieve the policy document.
  ///
  /// For more information about policies, see [Managed Policies and Inline
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html)
  /// in the _IAM User Guide_.
  ///
  /// [userName]: The name of the user who the policy is associated with.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  ///
  /// [policyName]: The name of the policy document to get.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  Future<GetUserPolicyResponse> getUserPolicy(
      {@required String userName, @required String policyName}) async {
    return GetUserPolicyResponse.fromJson({});
  }

  /// Returns information about the access key IDs associated with the specified
  /// IAM user. If there is none, the operation returns an empty list.
  ///
  /// Although each user is limited to a small number of keys, you can still
  /// paginate the results using the `MaxItems` and `Marker` parameters.
  ///
  /// If the `UserName` field is not specified, the user name is determined
  /// implicitly based on the AWS access key ID used to sign the request. This
  /// operation works for access keys under the AWS account. Consequently, you
  /// can use this operation to manage AWS account root user credentials even if
  /// the AWS account has no associated users.
  ///
  ///
  ///
  /// To ensure the security of your AWS account, the secret access key is
  /// accessible only during key and user creation.
  ///
  /// [userName]: The name of the user.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  ///
  /// [marker]: Use this parameter only when paginating results and only after
  /// you receive a response indicating that the results are truncated. Set it
  /// to the value of the `Marker` element in the response that you received to
  /// indicate where the next call should start.
  ///
  /// [maxItems]: Use this only when paginating results to indicate the maximum
  /// number of items you want in the response. If additional items exist beyond
  /// the maximum you specify, the `IsTruncated` response element is `true`.
  ///
  /// If you do not include this parameter, the number of items defaults to 100.
  /// Note that IAM might return fewer results, even when there are more results
  /// available. In that case, the `IsTruncated` response element returns
  /// `true`, and `Marker` contains a value to include in the subsequent call
  /// that tells the service where to continue from.
  Future<ListAccessKeysResponse> listAccessKeys(
      {String userName, String marker, int maxItems}) async {
    return ListAccessKeysResponse.fromJson({});
  }

  /// Lists the account alias associated with the AWS account (Note: you can
  /// have only one). For information about using an AWS account alias, see
  /// [Using an Alias for Your AWS Account
  /// ID](https://docs.aws.amazon.com/IAM/latest/UserGuide/AccountAlias.html) in
  /// the _IAM User Guide_.
  ///
  /// [marker]: Use this parameter only when paginating results and only after
  /// you receive a response indicating that the results are truncated. Set it
  /// to the value of the `Marker` element in the response that you received to
  /// indicate where the next call should start.
  ///
  /// [maxItems]: Use this only when paginating results to indicate the maximum
  /// number of items you want in the response. If additional items exist beyond
  /// the maximum you specify, the `IsTruncated` response element is `true`.
  ///
  /// If you do not include this parameter, the number of items defaults to 100.
  /// Note that IAM might return fewer results, even when there are more results
  /// available. In that case, the `IsTruncated` response element returns
  /// `true`, and `Marker` contains a value to include in the subsequent call
  /// that tells the service where to continue from.
  Future<ListAccountAliasesResponse> listAccountAliases(
      {String marker, int maxItems}) async {
    return ListAccountAliasesResponse.fromJson({});
  }

  /// Lists all managed policies that are attached to the specified IAM group.
  ///
  /// An IAM group can also have inline policies embedded with it. To list the
  /// inline policies for a group, use the ListGroupPolicies API. For
  /// information about policies, see [Managed Policies and Inline
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html)
  /// in the _IAM User Guide_.
  ///
  /// You can paginate the results using the `MaxItems` and `Marker` parameters.
  /// You can use the `PathPrefix` parameter to limit the list of policies to
  /// only those matching the specified path prefix. If there are no policies
  /// attached to the specified group (or none that match the specified path
  /// prefix), the operation returns an empty list.
  ///
  /// [groupName]: The name (friendly name, not ARN) of the group to list
  /// attached policies for.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  ///
  /// [pathPrefix]: The path prefix for filtering the results. This parameter is
  /// optional. If it is not included, it defaults to a slash (/), listing all
  /// policies.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of either a forward slash (/) by itself or a string that must
  /// begin and end with forward slashes. In addition, it can contain any ASCII
  /// character from the ! (\\u0021) through the DEL character (\\u007F),
  /// including most punctuation characters, digits, and upper and lowercased
  /// letters.
  ///
  /// [marker]: Use this parameter only when paginating results and only after
  /// you receive a response indicating that the results are truncated. Set it
  /// to the value of the `Marker` element in the response that you received to
  /// indicate where the next call should start.
  ///
  /// [maxItems]: Use this only when paginating results to indicate the maximum
  /// number of items you want in the response. If additional items exist beyond
  /// the maximum you specify, the `IsTruncated` response element is `true`.
  ///
  /// If you do not include this parameter, the number of items defaults to 100.
  /// Note that IAM might return fewer results, even when there are more results
  /// available. In that case, the `IsTruncated` response element returns
  /// `true`, and `Marker` contains a value to include in the subsequent call
  /// that tells the service where to continue from.
  Future<ListAttachedGroupPoliciesResponse> listAttachedGroupPolicies(
      String groupName,
      {String pathPrefix,
      String marker,
      int maxItems}) async {
    return ListAttachedGroupPoliciesResponse.fromJson({});
  }

  /// Lists all managed policies that are attached to the specified IAM role.
  ///
  /// An IAM role can also have inline policies embedded with it. To list the
  /// inline policies for a role, use the ListRolePolicies API. For information
  /// about policies, see [Managed Policies and Inline
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html)
  /// in the _IAM User Guide_.
  ///
  /// You can paginate the results using the `MaxItems` and `Marker` parameters.
  /// You can use the `PathPrefix` parameter to limit the list of policies to
  /// only those matching the specified path prefix. If there are no policies
  /// attached to the specified role (or none that match the specified path
  /// prefix), the operation returns an empty list.
  ///
  /// [roleName]: The name (friendly name, not ARN) of the role to list attached
  /// policies for.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  ///
  /// [pathPrefix]: The path prefix for filtering the results. This parameter is
  /// optional. If it is not included, it defaults to a slash (/), listing all
  /// policies.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of either a forward slash (/) by itself or a string that must
  /// begin and end with forward slashes. In addition, it can contain any ASCII
  /// character from the ! (\\u0021) through the DEL character (\\u007F),
  /// including most punctuation characters, digits, and upper and lowercased
  /// letters.
  ///
  /// [marker]: Use this parameter only when paginating results and only after
  /// you receive a response indicating that the results are truncated. Set it
  /// to the value of the `Marker` element in the response that you received to
  /// indicate where the next call should start.
  ///
  /// [maxItems]: Use this only when paginating results to indicate the maximum
  /// number of items you want in the response. If additional items exist beyond
  /// the maximum you specify, the `IsTruncated` response element is `true`.
  ///
  /// If you do not include this parameter, the number of items defaults to 100.
  /// Note that IAM might return fewer results, even when there are more results
  /// available. In that case, the `IsTruncated` response element returns
  /// `true`, and `Marker` contains a value to include in the subsequent call
  /// that tells the service where to continue from.
  Future<ListAttachedRolePoliciesResponse> listAttachedRolePolicies(
      String roleName,
      {String pathPrefix,
      String marker,
      int maxItems}) async {
    return ListAttachedRolePoliciesResponse.fromJson({});
  }

  /// Lists all managed policies that are attached to the specified IAM user.
  ///
  /// An IAM user can also have inline policies embedded with it. To list the
  /// inline policies for a user, use the ListUserPolicies API. For information
  /// about policies, see [Managed Policies and Inline
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html)
  /// in the _IAM User Guide_.
  ///
  /// You can paginate the results using the `MaxItems` and `Marker` parameters.
  /// You can use the `PathPrefix` parameter to limit the list of policies to
  /// only those matching the specified path prefix. If there are no policies
  /// attached to the specified group (or none that match the specified path
  /// prefix), the operation returns an empty list.
  ///
  /// [userName]: The name (friendly name, not ARN) of the user to list attached
  /// policies for.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  ///
  /// [pathPrefix]: The path prefix for filtering the results. This parameter is
  /// optional. If it is not included, it defaults to a slash (/), listing all
  /// policies.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of either a forward slash (/) by itself or a string that must
  /// begin and end with forward slashes. In addition, it can contain any ASCII
  /// character from the ! (\\u0021) through the DEL character (\\u007F),
  /// including most punctuation characters, digits, and upper and lowercased
  /// letters.
  ///
  /// [marker]: Use this parameter only when paginating results and only after
  /// you receive a response indicating that the results are truncated. Set it
  /// to the value of the `Marker` element in the response that you received to
  /// indicate where the next call should start.
  ///
  /// [maxItems]: Use this only when paginating results to indicate the maximum
  /// number of items you want in the response. If additional items exist beyond
  /// the maximum you specify, the `IsTruncated` response element is `true`.
  ///
  /// If you do not include this parameter, the number of items defaults to 100.
  /// Note that IAM might return fewer results, even when there are more results
  /// available. In that case, the `IsTruncated` response element returns
  /// `true`, and `Marker` contains a value to include in the subsequent call
  /// that tells the service where to continue from.
  Future<ListAttachedUserPoliciesResponse> listAttachedUserPolicies(
      String userName,
      {String pathPrefix,
      String marker,
      int maxItems}) async {
    return ListAttachedUserPoliciesResponse.fromJson({});
  }

  /// Lists all IAM users, groups, and roles that the specified managed policy
  /// is attached to.
  ///
  /// You can use the optional `EntityFilter` parameter to limit the results to
  /// a particular type of entity (users, groups, or roles). For example, to
  /// list only the roles that are attached to the specified policy, set
  /// `EntityFilter` to `Role`.
  ///
  /// You can paginate the results using the `MaxItems` and `Marker` parameters.
  ///
  /// [policyArn]: The Amazon Resource Name (ARN) of the IAM policy for which
  /// you want the versions.
  ///
  /// For more information about ARNs, see [Amazon Resource Names (ARNs) and AWS
  /// Service
  /// Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html)
  /// in the _AWS General Reference_.
  ///
  /// [entityFilter]: The entity type to use for filtering the results.
  ///
  /// For example, when `EntityFilter` is `Role`, only the roles that are
  /// attached to the specified policy are returned. This parameter is optional.
  /// If it is not included, all attached entities (users, groups, and roles)
  /// are returned. The argument for this parameter must be one of the valid
  /// values listed below.
  ///
  /// [pathPrefix]: The path prefix for filtering the results. This parameter is
  /// optional. If it is not included, it defaults to a slash (/), listing all
  /// entities.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of either a forward slash (/) by itself or a string that must
  /// begin and end with forward slashes. In addition, it can contain any ASCII
  /// character from the ! (\\u0021) through the DEL character (\\u007F),
  /// including most punctuation characters, digits, and upper and lowercased
  /// letters.
  ///
  /// [policyUsageFilter]: The policy usage method to use for filtering the
  /// results.
  ///
  /// To list only permissions policies,
  /// set `PolicyUsageFilter` to `PermissionsPolicy`. To list only the policies
  /// used to set permissions boundaries, set the value
  /// to `PermissionsBoundary`.
  ///
  /// This parameter is optional. If it is not included, all policies are
  /// returned.
  ///
  /// [marker]: Use this parameter only when paginating results and only after
  /// you receive a response indicating that the results are truncated. Set it
  /// to the value of the `Marker` element in the response that you received to
  /// indicate where the next call should start.
  ///
  /// [maxItems]: Use this only when paginating results to indicate the maximum
  /// number of items you want in the response. If additional items exist beyond
  /// the maximum you specify, the `IsTruncated` response element is `true`.
  ///
  /// If you do not include this parameter, the number of items defaults to 100.
  /// Note that IAM might return fewer results, even when there are more results
  /// available. In that case, the `IsTruncated` response element returns
  /// `true`, and `Marker` contains a value to include in the subsequent call
  /// that tells the service where to continue from.
  Future<ListEntitiesForPolicyResponse> listEntitiesForPolicy(String policyArn,
      {String entityFilter,
      String pathPrefix,
      String policyUsageFilter,
      String marker,
      int maxItems}) async {
    return ListEntitiesForPolicyResponse.fromJson({});
  }

  /// Lists the names of the inline policies that are embedded in the specified
  /// IAM group.
  ///
  /// An IAM group can also have managed policies attached to it. To list the
  /// managed policies that are attached to a group, use
  /// ListAttachedGroupPolicies. For more information about policies, see
  /// [Managed Policies and Inline
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html)
  /// in the _IAM User Guide_.
  ///
  /// You can paginate the results using the `MaxItems` and `Marker` parameters.
  /// If there are no inline policies embedded with the specified group, the
  /// operation returns an empty list.
  ///
  /// [groupName]: The name of the group to list policies for.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  ///
  /// [marker]: Use this parameter only when paginating results and only after
  /// you receive a response indicating that the results are truncated. Set it
  /// to the value of the `Marker` element in the response that you received to
  /// indicate where the next call should start.
  ///
  /// [maxItems]: Use this only when paginating results to indicate the maximum
  /// number of items you want in the response. If additional items exist beyond
  /// the maximum you specify, the `IsTruncated` response element is `true`.
  ///
  /// If you do not include this parameter, the number of items defaults to 100.
  /// Note that IAM might return fewer results, even when there are more results
  /// available. In that case, the `IsTruncated` response element returns
  /// `true`, and `Marker` contains a value to include in the subsequent call
  /// that tells the service where to continue from.
  Future<ListGroupPoliciesResponse> listGroupPolicies(String groupName,
      {String marker, int maxItems}) async {
    return ListGroupPoliciesResponse.fromJson({});
  }

  /// Lists the IAM groups that have the specified path prefix.
  ///
  ///  You can paginate the results using the `MaxItems` and `Marker`
  /// parameters.
  ///
  /// [pathPrefix]:  The path prefix for filtering the results. For example, the
  /// prefix `/division\_abc/subdivision\_xyz/` gets all groups whose path
  /// starts with `/division\_abc/subdivision\_xyz/`.
  ///
  /// This parameter is optional. If it is not included, it defaults to a slash
  /// (/), listing all groups. This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of either a forward slash (/) by itself or a string that must
  /// begin and end with forward slashes. In addition, it can contain any ASCII
  /// character from the ! (\\u0021) through the DEL character (\\u007F),
  /// including most punctuation characters, digits, and upper and lowercased
  /// letters.
  ///
  /// [marker]: Use this parameter only when paginating results and only after
  /// you receive a response indicating that the results are truncated. Set it
  /// to the value of the `Marker` element in the response that you received to
  /// indicate where the next call should start.
  ///
  /// [maxItems]: Use this only when paginating results to indicate the maximum
  /// number of items you want in the response. If additional items exist beyond
  /// the maximum you specify, the `IsTruncated` response element is `true`.
  ///
  /// If you do not include this parameter, the number of items defaults to 100.
  /// Note that IAM might return fewer results, even when there are more results
  /// available. In that case, the `IsTruncated` response element returns
  /// `true`, and `Marker` contains a value to include in the subsequent call
  /// that tells the service where to continue from.
  Future<ListGroupsResponse> listGroups(
      {String pathPrefix, String marker, int maxItems}) async {
    return ListGroupsResponse.fromJson({});
  }

  /// Lists the IAM groups that the specified IAM user belongs to.
  ///
  /// You can paginate the results using the `MaxItems` and `Marker` parameters.
  ///
  /// [userName]: The name of the user to list groups for.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  ///
  /// [marker]: Use this parameter only when paginating results and only after
  /// you receive a response indicating that the results are truncated. Set it
  /// to the value of the `Marker` element in the response that you received to
  /// indicate where the next call should start.
  ///
  /// [maxItems]: Use this only when paginating results to indicate the maximum
  /// number of items you want in the response. If additional items exist beyond
  /// the maximum you specify, the `IsTruncated` response element is `true`.
  ///
  /// If you do not include this parameter, the number of items defaults to 100.
  /// Note that IAM might return fewer results, even when there are more results
  /// available. In that case, the `IsTruncated` response element returns
  /// `true`, and `Marker` contains a value to include in the subsequent call
  /// that tells the service where to continue from.
  Future<ListGroupsForUserResponse> listGroupsForUser(String userName,
      {String marker, int maxItems}) async {
    return ListGroupsForUserResponse.fromJson({});
  }

  /// Lists the instance profiles that have the specified path prefix. If there
  /// are none, the operation returns an empty list. For more information about
  /// instance profiles, go to [About Instance
  /// Profiles](https://docs.aws.amazon.com/IAM/latest/UserGuide/AboutInstanceProfiles.html).
  ///
  /// You can paginate the results using the `MaxItems` and `Marker` parameters.
  ///
  /// [pathPrefix]:  The path prefix for filtering the results. For example, the
  /// prefix `/application\_abc/component\_xyz/` gets all instance profiles
  /// whose path starts with `/application\_abc/component\_xyz/`.
  ///
  /// This parameter is optional. If it is not included, it defaults to a slash
  /// (/), listing all instance profiles. This parameter allows (through its
  /// [regex pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of either a forward slash (/) by itself or a string that must
  /// begin and end with forward slashes. In addition, it can contain any ASCII
  /// character from the ! (\\u0021) through the DEL character (\\u007F),
  /// including most punctuation characters, digits, and upper and lowercased
  /// letters.
  ///
  /// [marker]: Use this parameter only when paginating results and only after
  /// you receive a response indicating that the results are truncated. Set it
  /// to the value of the `Marker` element in the response that you received to
  /// indicate where the next call should start.
  ///
  /// [maxItems]: Use this only when paginating results to indicate the maximum
  /// number of items you want in the response. If additional items exist beyond
  /// the maximum you specify, the `IsTruncated` response element is `true`.
  ///
  /// If you do not include this parameter, the number of items defaults to 100.
  /// Note that IAM might return fewer results, even when there are more results
  /// available. In that case, the `IsTruncated` response element returns
  /// `true`, and `Marker` contains a value to include in the subsequent call
  /// that tells the service where to continue from.
  Future<ListInstanceProfilesResponse> listInstanceProfiles(
      {String pathPrefix, String marker, int maxItems}) async {
    return ListInstanceProfilesResponse.fromJson({});
  }

  /// Lists the instance profiles that have the specified associated IAM role.
  /// If there are none, the operation returns an empty list. For more
  /// information about instance profiles, go to [About Instance
  /// Profiles](https://docs.aws.amazon.com/IAM/latest/UserGuide/AboutInstanceProfiles.html).
  ///
  /// You can paginate the results using the `MaxItems` and `Marker` parameters.
  ///
  /// [roleName]: The name of the role to list instance profiles for.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  ///
  /// [marker]: Use this parameter only when paginating results and only after
  /// you receive a response indicating that the results are truncated. Set it
  /// to the value of the `Marker` element in the response that you received to
  /// indicate where the next call should start.
  ///
  /// [maxItems]: Use this only when paginating results to indicate the maximum
  /// number of items you want in the response. If additional items exist beyond
  /// the maximum you specify, the `IsTruncated` response element is `true`.
  ///
  /// If you do not include this parameter, the number of items defaults to 100.
  /// Note that IAM might return fewer results, even when there are more results
  /// available. In that case, the `IsTruncated` response element returns
  /// `true`, and `Marker` contains a value to include in the subsequent call
  /// that tells the service where to continue from.
  Future<ListInstanceProfilesForRoleResponse> listInstanceProfilesForRole(
      String roleName,
      {String marker,
      int maxItems}) async {
    return ListInstanceProfilesForRoleResponse.fromJson({});
  }

  /// Lists the MFA devices for an IAM user. If the request includes a IAM user
  /// name, then this operation lists all the MFA devices associated with the
  /// specified user. If you do not specify a user name, IAM determines the user
  /// name implicitly based on the AWS access key ID signing the request for
  /// this API.
  ///
  /// You can paginate the results using the `MaxItems` and `Marker` parameters.
  ///
  /// [userName]: The name of the user whose MFA devices you want to list.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  ///
  /// [marker]: Use this parameter only when paginating results and only after
  /// you receive a response indicating that the results are truncated. Set it
  /// to the value of the `Marker` element in the response that you received to
  /// indicate where the next call should start.
  ///
  /// [maxItems]: Use this only when paginating results to indicate the maximum
  /// number of items you want in the response. If additional items exist beyond
  /// the maximum you specify, the `IsTruncated` response element is `true`.
  ///
  /// If you do not include this parameter, the number of items defaults to 100.
  /// Note that IAM might return fewer results, even when there are more results
  /// available. In that case, the `IsTruncated` response element returns
  /// `true`, and `Marker` contains a value to include in the subsequent call
  /// that tells the service where to continue from.
  Future<ListMfaDevicesResponse> listMfaDevices(
      {String userName, String marker, int maxItems}) async {
    return ListMfaDevicesResponse.fromJson({});
  }

  /// Lists information about the IAM OpenID Connect (OIDC) provider resource
  /// objects defined in the AWS account.
  Future<ListOpenIDConnectProvidersResponse>
      listOpenIDConnectProviders() async {
    return ListOpenIDConnectProvidersResponse.fromJson({});
  }

  /// Lists all the managed policies that are available in your AWS account,
  /// including your own customer-defined managed policies and all AWS managed
  /// policies.
  ///
  /// You can filter the list of policies that is returned using the optional
  /// `OnlyAttached`, `Scope`, and `PathPrefix` parameters. For example, to list
  /// only the customer managed policies in your AWS account, set `Scope` to
  /// `Local`. To list only AWS managed policies, set `Scope` to `AWS`.
  ///
  /// You can paginate the results using the `MaxItems` and `Marker` parameters.
  ///
  /// For more information about managed policies, see [Managed Policies and
  /// Inline
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html)
  /// in the _IAM User Guide_.
  ///
  /// [scope]: The scope to use for filtering the results.
  ///
  /// To list only AWS managed policies, set `Scope` to `AWS`. To list only the
  /// customer managed policies in your AWS account, set `Scope` to `Local`.
  ///
  /// This parameter is optional. If it is not included, or if it is set to
  /// `All`, all policies are returned.
  ///
  /// [onlyAttached]: A flag to filter the results to only the attached
  /// policies.
  ///
  /// When `OnlyAttached` is `true`, the returned list contains only the
  /// policies that are attached to an IAM user, group, or role. When
  /// `OnlyAttached` is `false`, or when the parameter is not included, all
  /// policies are returned.
  ///
  /// [pathPrefix]: The path prefix for filtering the results. This parameter is
  /// optional. If it is not included, it defaults to a slash (/), listing all
  /// policies. This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of either a forward slash (/) by itself or a string that must
  /// begin and end with forward slashes. In addition, it can contain any ASCII
  /// character from the ! (\\u0021) through the DEL character (\\u007F),
  /// including most punctuation characters, digits, and upper and lowercased
  /// letters.
  ///
  /// [policyUsageFilter]: The policy usage method to use for filtering the
  /// results.
  ///
  /// To list only permissions policies,
  /// set `PolicyUsageFilter` to `PermissionsPolicy`. To list only the policies
  /// used to set permissions boundaries, set the value
  /// to `PermissionsBoundary`.
  ///
  /// This parameter is optional. If it is not included, all policies are
  /// returned.
  ///
  /// [marker]: Use this parameter only when paginating results and only after
  /// you receive a response indicating that the results are truncated. Set it
  /// to the value of the `Marker` element in the response that you received to
  /// indicate where the next call should start.
  ///
  /// [maxItems]: Use this only when paginating results to indicate the maximum
  /// number of items you want in the response. If additional items exist beyond
  /// the maximum you specify, the `IsTruncated` response element is `true`.
  ///
  /// If you do not include this parameter, the number of items defaults to 100.
  /// Note that IAM might return fewer results, even when there are more results
  /// available. In that case, the `IsTruncated` response element returns
  /// `true`, and `Marker` contains a value to include in the subsequent call
  /// that tells the service where to continue from.
  Future<ListPoliciesResponse> listPolicies(
      {String scope,
      bool onlyAttached,
      String pathPrefix,
      String policyUsageFilter,
      String marker,
      int maxItems}) async {
    return ListPoliciesResponse.fromJson({});
  }

  /// Retrieves a list of policies that the IAM identity (user, group, or role)
  /// can use to access each specified service.
  ///
  ///  This operation does not use other policy types when determining whether a
  /// resource could access a service. These other policy types include
  /// resource-based policies, access control lists, AWS Organizations policies,
  /// IAM permissions boundaries, and AWS STS assume role policies. It only
  /// applies permissions policy logic. For more about the evaluation of policy
  /// types, see [Evaluating
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_evaluation-logic.html#policy-eval-basics)
  /// in the _IAM User Guide_.
  ///
  /// The list of policies returned by the operation depends on the ARN of the
  /// identity that you provide.
  ///
  /// *    **User** – The list of policies includes the managed and inline
  /// policies that are attached to the user directly. The list also includes
  /// any additional managed and inline policies that are attached to the group
  /// to which the user belongs.
  ///
  /// *    **Group** – The list of policies includes only the managed and inline
  /// policies that are attached to the group directly. Policies that are
  /// attached to the group’s user are not included.
  ///
  /// *    **Role** – The list of policies includes only the managed and inline
  /// policies that are attached to the role.
  ///
  ///
  /// For each managed policy, this operation returns the ARN and policy name.
  /// For each inline policy, it returns the policy name and the entity to which
  /// it is attached. Inline policies do not have an ARN. For more information
  /// about these policy types, see [Managed Policies and Inline
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_managed-vs-inline.html)
  /// in the _IAM User Guide_.
  ///
  /// Policies that are attached to users and roles as permissions boundaries
  /// are not returned. To view which managed policy is currently used to set
  /// the permissions boundary for a user or role, use the GetUser or GetRole
  /// operations.
  ///
  /// [marker]: Use this parameter only when paginating results and only after
  /// you receive a response indicating that the results are truncated. Set it
  /// to the value of the `Marker` element in the response that you received to
  /// indicate where the next call should start.
  ///
  /// [arn]: The ARN of the IAM identity (user, group, or role) whose policies
  /// you want to list.
  ///
  /// [serviceNamespaces]: The service namespace for the AWS services whose
  /// policies you want to list.
  ///
  /// To learn the service namespace for a service, go to [Actions, Resources,
  /// and Condition Keys for AWS
  /// Services](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_actions-resources-contextkeys.html)
  /// in the _IAM User Guide_. Choose the name of the service to view details
  /// for that service. In the first paragraph, find the service prefix. For
  /// example, `(service prefix: a4b)`. For more information about service
  /// namespaces, see [AWS Service
  /// Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#genref-aws-service-namespaces)
  /// in the _AWS General Reference_.
  Future<ListPoliciesGrantingServiceAccessResponse>
      listPoliciesGrantingServiceAccess(
          {String marker,
          @required String arn,
          @required List<String> serviceNamespaces}) async {
    return ListPoliciesGrantingServiceAccessResponse.fromJson({});
  }

  /// Lists information about the versions of the specified managed policy,
  /// including the version that is currently set as the policy's default
  /// version.
  ///
  /// For more information about managed policies, see [Managed Policies and
  /// Inline
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html)
  /// in the _IAM User Guide_.
  ///
  /// [policyArn]: The Amazon Resource Name (ARN) of the IAM policy for which
  /// you want the versions.
  ///
  /// For more information about ARNs, see [Amazon Resource Names (ARNs) and AWS
  /// Service
  /// Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html)
  /// in the _AWS General Reference_.
  ///
  /// [marker]: Use this parameter only when paginating results and only after
  /// you receive a response indicating that the results are truncated. Set it
  /// to the value of the `Marker` element in the response that you received to
  /// indicate where the next call should start.
  ///
  /// [maxItems]: Use this only when paginating results to indicate the maximum
  /// number of items you want in the response. If additional items exist beyond
  /// the maximum you specify, the `IsTruncated` response element is `true`.
  ///
  /// If you do not include this parameter, the number of items defaults to 100.
  /// Note that IAM might return fewer results, even when there are more results
  /// available. In that case, the `IsTruncated` response element returns
  /// `true`, and `Marker` contains a value to include in the subsequent call
  /// that tells the service where to continue from.
  Future<ListPolicyVersionsResponse> listPolicyVersions(String policyArn,
      {String marker, int maxItems}) async {
    return ListPolicyVersionsResponse.fromJson({});
  }

  /// Lists the names of the inline policies that are embedded in the specified
  /// IAM role.
  ///
  /// An IAM role can also have managed policies attached to it. To list the
  /// managed policies that are attached to a role, use
  /// ListAttachedRolePolicies. For more information about policies, see
  /// [Managed Policies and Inline
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html)
  /// in the _IAM User Guide_.
  ///
  /// You can paginate the results using the `MaxItems` and `Marker` parameters.
  /// If there are no inline policies embedded with the specified role, the
  /// operation returns an empty list.
  ///
  /// [roleName]: The name of the role to list policies for.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  ///
  /// [marker]: Use this parameter only when paginating results and only after
  /// you receive a response indicating that the results are truncated. Set it
  /// to the value of the `Marker` element in the response that you received to
  /// indicate where the next call should start.
  ///
  /// [maxItems]: Use this only when paginating results to indicate the maximum
  /// number of items you want in the response. If additional items exist beyond
  /// the maximum you specify, the `IsTruncated` response element is `true`.
  ///
  /// If you do not include this parameter, the number of items defaults to 100.
  /// Note that IAM might return fewer results, even when there are more results
  /// available. In that case, the `IsTruncated` response element returns
  /// `true`, and `Marker` contains a value to include in the subsequent call
  /// that tells the service where to continue from.
  Future<ListRolePoliciesResponse> listRolePolicies(String roleName,
      {String marker, int maxItems}) async {
    return ListRolePoliciesResponse.fromJson({});
  }

  /// Lists the tags that are attached to the specified role. The returned list
  /// of tags is sorted by tag key. For more information about tagging, see
  /// [Tagging IAM
  /// Identities](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html)
  /// in the _IAM User Guide_.
  ///
  /// [roleName]: The name of the IAM role for which you want to see the list of
  /// tags.
  ///
  /// This parameter accepts (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters that
  /// consist of upper and lowercase alphanumeric characters with no spaces. You
  /// can also include any of the following characters: _+=,.@-
  ///
  /// [marker]: Use this parameter only when paginating results and only after
  /// you receive a response indicating that the results are truncated. Set it
  /// to the value of the `Marker` element in the response that you received to
  /// indicate where the next call should start.
  ///
  /// [maxItems]: (Optional) Use this only when paginating results to indicate
  /// the maximum number of items that you want in the response. If additional
  /// items exist beyond the maximum that you specify, the `IsTruncated`
  /// response element is `true`.
  ///
  /// If you do not include this parameter, it defaults to 100. Note that IAM
  /// might return fewer results, even when more results are available. In that
  /// case, the `IsTruncated` response element returns `true`, and `Marker`
  /// contains a value to include in the subsequent call that tells the service
  /// where to continue from.
  Future<ListRoleTagsResponse> listRoleTags(String roleName,
      {String marker, int maxItems}) async {
    return ListRoleTagsResponse.fromJson({});
  }

  /// Lists the IAM roles that have the specified path prefix. If there are
  /// none, the operation returns an empty list. For more information about
  /// roles, go to [Working with
  /// Roles](https://docs.aws.amazon.com/IAM/latest/UserGuide/WorkingWithRoles.html).
  ///
  /// You can paginate the results using the `MaxItems` and `Marker` parameters.
  ///
  /// [pathPrefix]:  The path prefix for filtering the results. For example, the
  /// prefix `/application\_abc/component\_xyz/` gets all roles whose path
  /// starts with `/application\_abc/component\_xyz/`.
  ///
  /// This parameter is optional. If it is not included, it defaults to a slash
  /// (/), listing all roles. This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of either a forward slash (/) by itself or a string that must
  /// begin and end with forward slashes. In addition, it can contain any ASCII
  /// character from the ! (\\u0021) through the DEL character (\\u007F),
  /// including most punctuation characters, digits, and upper and lowercased
  /// letters.
  ///
  /// [marker]: Use this parameter only when paginating results and only after
  /// you receive a response indicating that the results are truncated. Set it
  /// to the value of the `Marker` element in the response that you received to
  /// indicate where the next call should start.
  ///
  /// [maxItems]: Use this only when paginating results to indicate the maximum
  /// number of items you want in the response. If additional items exist beyond
  /// the maximum you specify, the `IsTruncated` response element is `true`.
  ///
  /// If you do not include this parameter, the number of items defaults to 100.
  /// Note that IAM might return fewer results, even when there are more results
  /// available. In that case, the `IsTruncated` response element returns
  /// `true`, and `Marker` contains a value to include in the subsequent call
  /// that tells the service where to continue from.
  Future<ListRolesResponse> listRoles(
      {String pathPrefix, String marker, int maxItems}) async {
    return ListRolesResponse.fromJson({});
  }

  /// Lists the SAML provider resource objects defined in IAM in the account.
  ///
  ///   This operation requires [Signature Version
  /// 4](https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html).
  Future<ListSamlProvidersResponse> listSamlProviders() async {
    return ListSamlProvidersResponse.fromJson({});
  }

  /// Returns information about the SSH public keys associated with the
  /// specified IAM user. If none exists, the operation returns an empty list.
  ///
  /// The SSH public keys returned by this operation are used only for
  /// authenticating the IAM user to an AWS CodeCommit repository. For more
  /// information about using SSH keys to authenticate to an AWS CodeCommit
  /// repository, see [Set up AWS CodeCommit for SSH
  /// Connections](https://docs.aws.amazon.com/codecommit/latest/userguide/setting-up-credentials-ssh.html)
  /// in the _AWS CodeCommit User Guide_.
  ///
  /// Although each user is limited to a small number of keys, you can still
  /// paginate the results using the `MaxItems` and `Marker` parameters.
  ///
  /// [userName]: The name of the IAM user to list SSH public keys for. If none
  /// is specified, the `UserName` field is determined implicitly based on the
  /// AWS access key used to sign the request.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  ///
  /// [marker]: Use this parameter only when paginating results and only after
  /// you receive a response indicating that the results are truncated. Set it
  /// to the value of the `Marker` element in the response that you received to
  /// indicate where the next call should start.
  ///
  /// [maxItems]: Use this only when paginating results to indicate the maximum
  /// number of items you want in the response. If additional items exist beyond
  /// the maximum you specify, the `IsTruncated` response element is `true`.
  ///
  /// If you do not include this parameter, the number of items defaults to 100.
  /// Note that IAM might return fewer results, even when there are more results
  /// available. In that case, the `IsTruncated` response element returns
  /// `true`, and `Marker` contains a value to include in the subsequent call
  /// that tells the service where to continue from.
  Future<ListSshPublicKeysResponse> listSshPublicKeys(
      {String userName, String marker, int maxItems}) async {
    return ListSshPublicKeysResponse.fromJson({});
  }

  /// Lists the server certificates stored in IAM that have the specified path
  /// prefix. If none exist, the operation returns an empty list.
  ///
  ///  You can paginate the results using the `MaxItems` and `Marker`
  /// parameters.
  ///
  /// For more information about working with server certificates, see [Working
  /// with Server
  /// Certificates](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_server-certs.html)
  /// in the _IAM User Guide_. This topic also includes a list of AWS services
  /// that can use the server certificates that you manage with IAM.
  ///
  /// [pathPrefix]:  The path prefix for filtering the results. For example:
  /// `/company/servercerts` would get all server certificates for which the
  /// path starts with `/company/servercerts`.
  ///
  /// This parameter is optional. If it is not included, it defaults to a slash
  /// (/), listing all server certificates. This parameter allows (through its
  /// [regex pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of either a forward slash (/) by itself or a string that must
  /// begin and end with forward slashes. In addition, it can contain any ASCII
  /// character from the ! (\\u0021) through the DEL character (\\u007F),
  /// including most punctuation characters, digits, and upper and lowercased
  /// letters.
  ///
  /// [marker]: Use this parameter only when paginating results and only after
  /// you receive a response indicating that the results are truncated. Set it
  /// to the value of the `Marker` element in the response that you received to
  /// indicate where the next call should start.
  ///
  /// [maxItems]: Use this only when paginating results to indicate the maximum
  /// number of items you want in the response. If additional items exist beyond
  /// the maximum you specify, the `IsTruncated` response element is `true`.
  ///
  /// If you do not include this parameter, the number of items defaults to 100.
  /// Note that IAM might return fewer results, even when there are more results
  /// available. In that case, the `IsTruncated` response element returns
  /// `true`, and `Marker` contains a value to include in the subsequent call
  /// that tells the service where to continue from.
  Future<ListServerCertificatesResponse> listServerCertificates(
      {String pathPrefix, String marker, int maxItems}) async {
    return ListServerCertificatesResponse.fromJson({});
  }

  /// Returns information about the service-specific credentials associated with
  /// the specified IAM user. If none exists, the operation returns an empty
  /// list. The service-specific credentials returned by this operation are used
  /// only for authenticating the IAM user to a specific service. For more
  /// information about using service-specific credentials to authenticate to an
  /// AWS service, see [Set Up service-specific
  /// credentials](https://docs.aws.amazon.com/codecommit/latest/userguide/setting-up-gc.html)
  /// in the AWS CodeCommit User Guide.
  ///
  /// [userName]: The name of the user whose service-specific credentials you
  /// want information about. If this value is not specified, then the operation
  /// assumes the user whose credentials are used to call the operation.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  ///
  /// [serviceName]: Filters the returned results to only those for the
  /// specified AWS service. If not specified, then AWS returns service-specific
  /// credentials for all services.
  Future<ListServiceSpecificCredentialsResponse> listServiceSpecificCredentials(
      {String userName, String serviceName}) async {
    return ListServiceSpecificCredentialsResponse.fromJson({});
  }

  /// Returns information about the signing certificates associated with the
  /// specified IAM user. If none exists, the operation returns an empty list.
  ///
  /// Although each user is limited to a small number of signing certificates,
  /// you can still paginate the results using the `MaxItems` and `Marker`
  /// parameters.
  ///
  /// If the `UserName` field is not specified, the user name is determined
  /// implicitly based on the AWS access key ID used to sign the request for
  /// this API. This operation works for access keys under the AWS account.
  /// Consequently, you can use this operation to manage AWS account root user
  /// credentials even if the AWS account has no associated users.
  ///
  /// [userName]: The name of the IAM user whose signing certificates you want
  /// to examine.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  ///
  /// [marker]: Use this parameter only when paginating results and only after
  /// you receive a response indicating that the results are truncated. Set it
  /// to the value of the `Marker` element in the response that you received to
  /// indicate where the next call should start.
  ///
  /// [maxItems]: Use this only when paginating results to indicate the maximum
  /// number of items you want in the response. If additional items exist beyond
  /// the maximum you specify, the `IsTruncated` response element is `true`.
  ///
  /// If you do not include this parameter, the number of items defaults to 100.
  /// Note that IAM might return fewer results, even when there are more results
  /// available. In that case, the `IsTruncated` response element returns
  /// `true`, and `Marker` contains a value to include in the subsequent call
  /// that tells the service where to continue from.
  Future<ListSigningCertificatesResponse> listSigningCertificates(
      {String userName, String marker, int maxItems}) async {
    return ListSigningCertificatesResponse.fromJson({});
  }

  /// Lists the names of the inline policies embedded in the specified IAM user.
  ///
  /// An IAM user can also have managed policies attached to it. To list the
  /// managed policies that are attached to a user, use
  /// ListAttachedUserPolicies. For more information about policies, see
  /// [Managed Policies and Inline
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html)
  /// in the _IAM User Guide_.
  ///
  /// You can paginate the results using the `MaxItems` and `Marker` parameters.
  /// If there are no inline policies embedded with the specified user, the
  /// operation returns an empty list.
  ///
  /// [userName]: The name of the user to list policies for.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  ///
  /// [marker]: Use this parameter only when paginating results and only after
  /// you receive a response indicating that the results are truncated. Set it
  /// to the value of the `Marker` element in the response that you received to
  /// indicate where the next call should start.
  ///
  /// [maxItems]: Use this only when paginating results to indicate the maximum
  /// number of items you want in the response. If additional items exist beyond
  /// the maximum you specify, the `IsTruncated` response element is `true`.
  ///
  /// If you do not include this parameter, the number of items defaults to 100.
  /// Note that IAM might return fewer results, even when there are more results
  /// available. In that case, the `IsTruncated` response element returns
  /// `true`, and `Marker` contains a value to include in the subsequent call
  /// that tells the service where to continue from.
  Future<ListUserPoliciesResponse> listUserPolicies(String userName,
      {String marker, int maxItems}) async {
    return ListUserPoliciesResponse.fromJson({});
  }

  /// Lists the tags that are attached to the specified user. The returned list
  /// of tags is sorted by tag key. For more information about tagging, see
  /// [Tagging IAM
  /// Identities](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html)
  /// in the _IAM User Guide_.
  ///
  /// [userName]: The name of the IAM user whose tags you want to see.
  ///
  /// This parameter accepts (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters that
  /// consist of upper and lowercase alphanumeric characters with no spaces. You
  /// can also include any of the following characters: =,.@-
  ///
  /// [marker]: Use this parameter only when paginating results and only after
  /// you receive a response indicating that the results are truncated. Set it
  /// to the value of the `Marker` element in the response that you received to
  /// indicate where the next call should start.
  ///
  /// [maxItems]: (Optional) Use this only when paginating results to indicate
  /// the maximum number of items that you want in the response. If additional
  /// items exist beyond the maximum that you specify, the `IsTruncated`
  /// response element is `true`.
  ///
  /// If you do not include this parameter, it defaults to 100. Note that IAM
  /// might return fewer results, even when more results are available. In that
  /// case, the `IsTruncated` response element returns `true`, and `Marker`
  /// contains a value to include in the subsequent call that tells the service
  /// where to continue from.
  Future<ListUserTagsResponse> listUserTags(String userName,
      {String marker, int maxItems}) async {
    return ListUserTagsResponse.fromJson({});
  }

  /// Lists the IAM users that have the specified path prefix. If no path prefix
  /// is specified, the operation returns all users in the AWS account. If there
  /// are none, the operation returns an empty list.
  ///
  /// You can paginate the results using the `MaxItems` and `Marker` parameters.
  ///
  /// [pathPrefix]:  The path prefix for filtering the results. For example:
  /// `/division\_abc/subdivision\_xyz/`, which would get all user names whose
  /// path starts with `/division\_abc/subdivision\_xyz/`.
  ///
  /// This parameter is optional. If it is not included, it defaults to a slash
  /// (/), listing all user names. This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of either a forward slash (/) by itself or a string that must
  /// begin and end with forward slashes. In addition, it can contain any ASCII
  /// character from the ! (\\u0021) through the DEL character (\\u007F),
  /// including most punctuation characters, digits, and upper and lowercased
  /// letters.
  ///
  /// [marker]: Use this parameter only when paginating results and only after
  /// you receive a response indicating that the results are truncated. Set it
  /// to the value of the `Marker` element in the response that you received to
  /// indicate where the next call should start.
  ///
  /// [maxItems]: Use this only when paginating results to indicate the maximum
  /// number of items you want in the response. If additional items exist beyond
  /// the maximum you specify, the `IsTruncated` response element is `true`.
  ///
  /// If you do not include this parameter, the number of items defaults to 100.
  /// Note that IAM might return fewer results, even when there are more results
  /// available. In that case, the `IsTruncated` response element returns
  /// `true`, and `Marker` contains a value to include in the subsequent call
  /// that tells the service where to continue from.
  Future<ListUsersResponse> listUsers(
      {String pathPrefix, String marker, int maxItems}) async {
    return ListUsersResponse.fromJson({});
  }

  /// Lists the virtual MFA devices defined in the AWS account by assignment
  /// status. If you do not specify an assignment status, the operation returns
  /// a list of all virtual MFA devices. Assignment status can be `Assigned`,
  /// `Unassigned`, or `Any`.
  ///
  /// You can paginate the results using the `MaxItems` and `Marker` parameters.
  ///
  /// [assignmentStatus]:  The status (`Unassigned` or `Assigned`) of the
  /// devices to list. If you do not specify an `AssignmentStatus`, the
  /// operation defaults to `Any`, which lists both assigned and unassigned
  /// virtual MFA devices.,
  ///
  /// [marker]: Use this parameter only when paginating results and only after
  /// you receive a response indicating that the results are truncated. Set it
  /// to the value of the `Marker` element in the response that you received to
  /// indicate where the next call should start.
  ///
  /// [maxItems]: Use this only when paginating results to indicate the maximum
  /// number of items you want in the response. If additional items exist beyond
  /// the maximum you specify, the `IsTruncated` response element is `true`.
  ///
  /// If you do not include this parameter, the number of items defaults to 100.
  /// Note that IAM might return fewer results, even when there are more results
  /// available. In that case, the `IsTruncated` response element returns
  /// `true`, and `Marker` contains a value to include in the subsequent call
  /// that tells the service where to continue from.
  Future<ListVirtualMfaDevicesResponse> listVirtualMfaDevices(
      {String assignmentStatus, String marker, int maxItems}) async {
    return ListVirtualMfaDevicesResponse.fromJson({});
  }

  /// Adds or updates an inline policy document that is embedded in the
  /// specified IAM group.
  ///
  /// A user can also have managed policies attached to it. To attach a managed
  /// policy to a group, use AttachGroupPolicy. To create a new managed policy,
  /// use CreatePolicy. For information about policies, see [Managed Policies
  /// and Inline
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html)
  /// in the _IAM User Guide_.
  ///
  /// For information about limits on the number of inline policies that you can
  /// embed in a group, see [Limitations on IAM
  /// Entities](https://docs.aws.amazon.com/IAM/latest/UserGuide/LimitationsOnEntities.html)
  /// in the _IAM User Guide_.
  ///
  ///
  ///
  /// Because policy documents can be large, you should use POST rather than GET
  /// when calling `PutGroupPolicy`. For general information about using the
  /// Query API with IAM, go to [Making Query
  /// Requests](https://docs.aws.amazon.com/IAM/latest/UserGuide/IAM_UsingQueryAPI.html)
  /// in the _IAM User Guide_.
  ///
  /// [groupName]: The name of the group to associate the policy with.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-.
  ///
  /// [policyName]: The name of the policy document.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  ///
  /// [policyDocument]: The policy document.
  ///
  /// You must provide policies in JSON format in IAM. However, for AWS
  /// CloudFormation templates formatted in YAML, you can provide the policy in
  /// JSON or YAML format. AWS CloudFormation always converts a YAML policy to
  /// JSON format before submitting it to IAM.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) used to validate this
  /// parameter is a string of characters consisting of the following:
  ///
  /// *   Any printable ASCII character ranging from the space character
  /// (\\u0020) through the end of the ASCII character range
  ///
  /// *   The printable characters in the Basic Latin and Latin-1 Supplement
  /// character set (through \\u00FF)
  ///
  /// *   The special characters tab (\\u0009), line feed (\\u000A), and
  /// carriage return (\\u000D)
  Future<void> putGroupPolicy(
      {@required String groupName,
      @required String policyName,
      @required String policyDocument}) async {}

  /// Adds or updates the policy that is specified as the IAM role's permissions
  /// boundary. You can use an AWS managed policy or a customer managed policy
  /// to set the boundary for a role. Use the boundary to control the maximum
  /// permissions that the role can have. Setting a permissions boundary is an
  /// advanced feature that can affect the permissions for the role.
  ///
  /// You cannot set the boundary for a service-linked role.
  ///
  ///
  ///
  /// Policies used as permissions boundaries do not provide permissions. You
  /// must also attach a permissions policy to the role. To learn how the
  /// effective permissions for a role are evaluated, see [IAM JSON Policy
  /// Evaluation
  /// Logic](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_evaluation-logic.html)
  /// in the IAM User Guide.
  ///
  /// [roleName]: The name (friendly name, not ARN) of the IAM role for which
  /// you want to set the permissions boundary.
  ///
  /// [permissionsBoundary]: The ARN of the policy that is used to set the
  /// permissions boundary for the role.
  Future<void> putRolePermissionsBoundary(
      {@required String roleName,
      @required String permissionsBoundary}) async {}

  /// Adds or updates an inline policy document that is embedded in the
  /// specified IAM role.
  ///
  /// When you embed an inline policy in a role, the inline policy is used as
  /// part of the role's access (permissions) policy. The role's trust policy is
  /// created at the same time as the role, using CreateRole. You can update a
  /// role's trust policy using UpdateAssumeRolePolicy. For more information
  /// about IAM roles, go to [Using Roles to Delegate Permissions and Federate
  /// Identities](https://docs.aws.amazon.com/IAM/latest/UserGuide/roles-toplevel.html).
  ///
  /// A role can also have a managed policy attached to it. To attach a managed
  /// policy to a role, use AttachRolePolicy. To create a new managed policy,
  /// use CreatePolicy. For information about policies, see [Managed Policies
  /// and Inline
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html)
  /// in the _IAM User Guide_.
  ///
  /// For information about limits on the number of inline policies that you can
  /// embed with a role, see [Limitations on IAM
  /// Entities](https://docs.aws.amazon.com/IAM/latest/UserGuide/LimitationsOnEntities.html)
  /// in the _IAM User Guide_.
  ///
  ///
  ///
  /// Because policy documents can be large, you should use POST rather than GET
  /// when calling `PutRolePolicy`. For general information about using the
  /// Query API with IAM, go to [Making Query
  /// Requests](https://docs.aws.amazon.com/IAM/latest/UserGuide/IAM_UsingQueryAPI.html)
  /// in the _IAM User Guide_.
  ///
  /// [roleName]: The name of the role to associate the policy with.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  ///
  /// [policyName]: The name of the policy document.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  ///
  /// [policyDocument]: The policy document.
  ///
  /// You must provide policies in JSON format in IAM. However, for AWS
  /// CloudFormation templates formatted in YAML, you can provide the policy in
  /// JSON or YAML format. AWS CloudFormation always converts a YAML policy to
  /// JSON format before submitting it to IAM.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) used to validate this
  /// parameter is a string of characters consisting of the following:
  ///
  /// *   Any printable ASCII character ranging from the space character
  /// (\\u0020) through the end of the ASCII character range
  ///
  /// *   The printable characters in the Basic Latin and Latin-1 Supplement
  /// character set (through \\u00FF)
  ///
  /// *   The special characters tab (\\u0009), line feed (\\u000A), and
  /// carriage return (\\u000D)
  Future<void> putRolePolicy(
      {@required String roleName,
      @required String policyName,
      @required String policyDocument}) async {}

  /// Adds or updates the policy that is specified as the IAM user's permissions
  /// boundary. You can use an AWS managed policy or a customer managed policy
  /// to set the boundary for a user. Use the boundary to control the maximum
  /// permissions that the user can have. Setting a permissions boundary is an
  /// advanced feature that can affect the permissions for the user.
  ///
  ///
  ///
  /// Policies that are used as permissions boundaries do not provide
  /// permissions. You must also attach a permissions policy to the user. To
  /// learn how the effective permissions for a user are evaluated, see [IAM
  /// JSON Policy Evaluation
  /// Logic](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_evaluation-logic.html)
  /// in the IAM User Guide.
  ///
  /// [userName]: The name (friendly name, not ARN) of the IAM user for which
  /// you want to set the permissions boundary.
  ///
  /// [permissionsBoundary]: The ARN of the policy that is used to set the
  /// permissions boundary for the user.
  Future<void> putUserPermissionsBoundary(
      {@required String userName,
      @required String permissionsBoundary}) async {}

  /// Adds or updates an inline policy document that is embedded in the
  /// specified IAM user.
  ///
  /// An IAM user can also have a managed policy attached to it. To attach a
  /// managed policy to a user, use AttachUserPolicy. To create a new managed
  /// policy, use CreatePolicy. For information about policies, see [Managed
  /// Policies and Inline
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html)
  /// in the _IAM User Guide_.
  ///
  /// For information about limits on the number of inline policies that you can
  /// embed in a user, see [Limitations on IAM
  /// Entities](https://docs.aws.amazon.com/IAM/latest/UserGuide/LimitationsOnEntities.html)
  /// in the _IAM User Guide_.
  ///
  ///
  ///
  /// Because policy documents can be large, you should use POST rather than GET
  /// when calling `PutUserPolicy`. For general information about using the
  /// Query API with IAM, go to [Making Query
  /// Requests](https://docs.aws.amazon.com/IAM/latest/UserGuide/IAM_UsingQueryAPI.html)
  /// in the _IAM User Guide_.
  ///
  /// [userName]: The name of the user to associate the policy with.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  ///
  /// [policyName]: The name of the policy document.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  ///
  /// [policyDocument]: The policy document.
  ///
  /// You must provide policies in JSON format in IAM. However, for AWS
  /// CloudFormation templates formatted in YAML, you can provide the policy in
  /// JSON or YAML format. AWS CloudFormation always converts a YAML policy to
  /// JSON format before submitting it to IAM.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) used to validate this
  /// parameter is a string of characters consisting of the following:
  ///
  /// *   Any printable ASCII character ranging from the space character
  /// (\\u0020) through the end of the ASCII character range
  ///
  /// *   The printable characters in the Basic Latin and Latin-1 Supplement
  /// character set (through \\u00FF)
  ///
  /// *   The special characters tab (\\u0009), line feed (\\u000A), and
  /// carriage return (\\u000D)
  Future<void> putUserPolicy(
      {@required String userName,
      @required String policyName,
      @required String policyDocument}) async {}

  /// Removes the specified client ID (also known as audience) from the list of
  /// client IDs registered for the specified IAM OpenID Connect (OIDC) provider
  /// resource object.
  ///
  /// This operation is idempotent; it does not fail or return an error if you
  /// try to remove a client ID that does not exist.
  ///
  /// [openIDConnectProviderArn]: The Amazon Resource Name (ARN) of the IAM OIDC
  /// provider resource to remove the client ID from. You can get a list of OIDC
  /// provider ARNs by using the ListOpenIDConnectProviders operation.
  ///
  /// For more information about ARNs, see [Amazon Resource Names (ARNs) and AWS
  /// Service
  /// Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html)
  /// in the _AWS General Reference_.
  ///
  /// [clientID]: The client ID (also known as audience) to remove from the IAM
  /// OIDC provider resource. For more information about client IDs, see
  /// CreateOpenIDConnectProvider.
  Future<void> removeClientIDFromOpenIDConnectProvider(
      {@required String openIDConnectProviderArn,
      @required String clientID}) async {}

  /// Removes the specified IAM role from the specified EC2 instance profile.
  ///
  ///  Make sure that you do not have any Amazon EC2 instances running with the
  /// role you are about to remove from the instance profile. Removing a role
  /// from an instance profile that is associated with a running instance might
  /// break any applications running on the instance.
  ///
  ///  For more information about IAM roles, go to [Working with
  /// Roles](https://docs.aws.amazon.com/IAM/latest/UserGuide/WorkingWithRoles.html).
  /// For more information about instance profiles, go to [About Instance
  /// Profiles](https://docs.aws.amazon.com/IAM/latest/UserGuide/AboutInstanceProfiles.html).
  ///
  /// [instanceProfileName]: The name of the instance profile to update.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  ///
  /// [roleName]: The name of the role to remove.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  Future<void> removeRoleFromInstanceProfile(
      {@required String instanceProfileName,
      @required String roleName}) async {}

  /// Removes the specified user from the specified group.
  ///
  /// [groupName]: The name of the group to update.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  ///
  /// [userName]: The name of the user to remove.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  Future<void> removeUserFromGroup(
      {@required String groupName, @required String userName}) async {}

  /// Resets the password for a service-specific credential. The new password is
  /// AWS generated and cryptographically strong. It cannot be configured by the
  /// user. Resetting the password immediately invalidates the previous password
  /// associated with this user.
  ///
  /// [userName]: The name of the IAM user associated with the service-specific
  /// credential. If this value is not specified, then the operation assumes the
  /// user whose credentials are used to call the operation.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  ///
  /// [serviceSpecificCredentialId]: The unique identifier of the
  /// service-specific credential.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters that can
  /// consist of any upper or lowercased letter or digit.
  Future<ResetServiceSpecificCredentialResponse> resetServiceSpecificCredential(
      String serviceSpecificCredentialId,
      {String userName}) async {
    return ResetServiceSpecificCredentialResponse.fromJson({});
  }

  /// Synchronizes the specified MFA device with its IAM resource object on the
  /// AWS servers.
  ///
  /// For more information about creating and working with virtual MFA devices,
  /// go to [Using a Virtual MFA
  /// Device](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_VirtualMFA.html)
  /// in the _IAM User Guide_.
  ///
  /// [userName]: The name of the user whose MFA device you want to
  /// resynchronize.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  ///
  /// [serialNumber]: Serial number that uniquely identifies the MFA device.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  ///
  /// [authenticationCode1]: An authentication code emitted by the device.
  ///
  /// The format for this parameter is a sequence of six digits.
  ///
  /// [authenticationCode2]: A subsequent authentication code emitted by the
  /// device.
  ///
  /// The format for this parameter is a sequence of six digits.
  Future<void> resyncMfaDevice(
      {@required String userName,
      @required String serialNumber,
      @required String authenticationCode1,
      @required String authenticationCode2}) async {}

  /// Sets the specified version of the specified policy as the policy's default
  /// (operative) version.
  ///
  /// This operation affects all users, groups, and roles that the policy is
  /// attached to. To list the users, groups, and roles that the policy is
  /// attached to, use the ListEntitiesForPolicy API.
  ///
  /// For information about managed policies, see [Managed Policies and Inline
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html)
  /// in the _IAM User Guide_.
  ///
  /// [policyArn]: The Amazon Resource Name (ARN) of the IAM policy whose
  /// default version you want to set.
  ///
  /// For more information about ARNs, see [Amazon Resource Names (ARNs) and AWS
  /// Service
  /// Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html)
  /// in the _AWS General Reference_.
  ///
  /// [versionId]: The version of the policy to set as the default (operative)
  /// version.
  ///
  /// For more information about managed policy versions, see [Versioning for
  /// Managed
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-versions.html)
  /// in the _IAM User Guide_.
  Future<void> setDefaultPolicyVersion(
      {@required String policyArn, @required String versionId}) async {}

  /// Sets the specified version of the global endpoint token as the token
  /// version used for the AWS account.
  ///
  /// By default, AWS Security Token Service (STS) is available as a global
  /// service, and all STS requests go to a single endpoint at
  /// `https://sts.amazonaws.com`. AWS recommends using Regional STS endpoints
  /// to reduce latency, build in redundancy, and increase session token
  /// availability. For information about Regional endpoints for STS, see [AWS
  /// Regions and
  /// Endpoints](https://docs.aws.amazon.com/general/latest/gr/rande.html#sts_region)
  /// in the _AWS General Reference_.
  ///
  /// If you make an STS call to the global endpoint, the resulting session
  /// tokens might be valid in some Regions but not others. It depends on the
  /// version that is set in this operation. Version 1 tokens are valid only in
  /// AWS Regions that are available by default. These tokens do not work in
  /// manually enabled Regions, such as Asia Pacific (Hong Kong). Version 2
  /// tokens are valid in all Regions. However, version 2 tokens are longer and
  /// might affect systems where you temporarily store tokens. For information,
  /// see [Activating and Deactivating STS in an AWS
  /// Region](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_enable-regions.html)
  /// in the _IAM User Guide_.
  ///
  /// To view the current session token version, see the
  /// `GlobalEndpointTokenVersion` entry in the response of the
  /// GetAccountSummary operation.
  ///
  /// [globalEndpointTokenVersion]: The version of the global endpoint token.
  /// Version 1 tokens are valid only in AWS Regions that are available by
  /// default. These tokens do not work in manually enabled Regions, such as
  /// Asia Pacific (Hong Kong). Version 2 tokens are valid in all Regions.
  /// However, version 2 tokens are longer and might affect systems where you
  /// temporarily store tokens.
  ///
  /// For information, see [Activating and Deactivating STS in an AWS
  /// Region](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_enable-regions.html)
  /// in the _IAM User Guide_.
  Future<void> setSecurityTokenServicePreferences(
      String globalEndpointTokenVersion) async {}

  /// Simulate how a set of IAM policies and optionally a resource-based policy
  /// works with a list of API operations and AWS resources to determine the
  /// policies' effective permissions. The policies are provided as strings.
  ///
  /// The simulation does not perform the API operations; it only checks the
  /// authorization to determine if the simulated policies allow or deny the
  /// operations.
  ///
  /// If you want to simulate existing policies attached to an IAM user, group,
  /// or role, use SimulatePrincipalPolicy instead.
  ///
  /// Context keys are variables maintained by AWS and its services that provide
  /// details about the context of an API query request. You can use the
  /// `Condition` element of an IAM policy to evaluate context keys. To get the
  /// list of context keys that the policies require for correct simulation, use
  /// GetContextKeysForCustomPolicy.
  ///
  /// If the output is long, you can use `MaxItems` and `Marker` parameters to
  /// paginate the results.
  ///
  /// [policyInputList]: A list of policy documents to include in the
  /// simulation. Each document is specified as a string containing the
  /// complete, valid JSON text of an IAM policy. Do not include any
  /// resource-based policies in this parameter. Any resource-based policy must
  /// be submitted with the `ResourcePolicy` parameter. The policies cannot be
  /// "scope-down" policies, such as you could include in a call to
  /// [GetFederationToken](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetFederationToken.html)
  /// or one of the
  /// [AssumeRole](https://docs.aws.amazon.com/IAM/latest/APIReference/API_AssumeRole.html)
  /// API operations. In other words, do not use policies designed to restrict
  /// what a user can do while using the temporary credentials.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) used to validate this
  /// parameter is a string of characters consisting of the following:
  ///
  /// *   Any printable ASCII character ranging from the space character
  /// (\\u0020) through the end of the ASCII character range
  ///
  /// *   The printable characters in the Basic Latin and Latin-1 Supplement
  /// character set (through \\u00FF)
  ///
  /// *   The special characters tab (\\u0009), line feed (\\u000A), and
  /// carriage return (\\u000D)
  ///
  /// [actionNames]: A list of names of API operations to evaluate in the
  /// simulation. Each operation is evaluated against each resource. Each
  /// operation must include the service identifier, such as `iam:CreateUser`.
  /// This operation does not support using wildcards (*) in an action name.
  ///
  /// [resourceArns]: A list of ARNs of AWS resources to include in the
  /// simulation. If this parameter is not provided, then the value defaults to
  /// `*` (all resources). Each API in the `ActionNames` parameter is evaluated
  /// for each resource in this list. The simulation determines the access
  /// result (allowed or denied) of each combination and reports it in the
  /// response.
  ///
  /// The simulation does not automatically retrieve policies for the specified
  /// resources. If you want to include a resource policy in the simulation,
  /// then you must include the policy as a string in the `ResourcePolicy`
  /// parameter.
  ///
  /// If you include a `ResourcePolicy`, then it must be applicable to all of
  /// the resources included in the simulation or you receive an invalid input
  /// error.
  ///
  /// For more information about ARNs, see [Amazon Resource Names (ARNs) and AWS
  /// Service
  /// Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html)
  /// in the _AWS General Reference_.
  ///
  /// [resourcePolicy]: A resource-based policy to include in the simulation
  /// provided as a string. Each resource in the simulation is treated as if it
  /// had this policy attached. You can include only one resource-based policy
  /// in a simulation.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) used to validate this
  /// parameter is a string of characters consisting of the following:
  ///
  /// *   Any printable ASCII character ranging from the space character
  /// (\\u0020) through the end of the ASCII character range
  ///
  /// *   The printable characters in the Basic Latin and Latin-1 Supplement
  /// character set (through \\u00FF)
  ///
  /// *   The special characters tab (\\u0009), line feed (\\u000A), and
  /// carriage return (\\u000D)
  ///
  /// [resourceOwner]: An ARN representing the AWS account ID that specifies the
  /// owner of any simulated resource that does not identify its owner in the
  /// resource ARN. Examples of resource ARNs include an S3 bucket or object. If
  /// `ResourceOwner` is specified, it is also used as the account owner of any
  /// `ResourcePolicy` included in the simulation. If the `ResourceOwner`
  /// parameter is not specified, then the owner of the resources and the
  /// resource policy defaults to the account of the identity provided in
  /// `CallerArn`. This parameter is required only if you specify a
  /// resource-based policy and account that owns the resource is different from
  /// the account that owns the simulated calling user `CallerArn`.
  ///
  /// The ARN for an account uses the following syntax:
  /// `arn:aws:iam::_AWS-account-ID_:root`. For example, to represent the
  /// account with the 112233445566 ID, use the following ARN:
  /// `arn:aws:iam::112233445566-ID:root`.
  ///
  /// [callerArn]: The ARN of the IAM user that you want to use as the simulated
  /// caller of the API operations. `CallerArn` is required if you include a
  /// `ResourcePolicy` so that the policy's `Principal` element has a value to
  /// use in evaluating the policy.
  ///
  /// You can specify only the ARN of an IAM user. You cannot specify the ARN of
  /// an assumed role, federated user, or a service principal.
  ///
  /// [contextEntries]: A list of context keys and corresponding values for the
  /// simulation to use. Whenever a context key is evaluated in one of the
  /// simulated IAM permissions policies, the corresponding value is supplied.
  ///
  /// [resourceHandlingOption]: Specifies the type of simulation to run.
  /// Different API operations that support resource-based policies require
  /// different combinations of resources. By specifying the type of simulation
  /// to run, you enable the policy simulator to enforce the presence of the
  /// required resources to ensure reliable simulation results. If your
  /// simulation does not match one of the following scenarios, then you can
  /// omit this parameter. The following list shows each of the supported
  /// scenario values and the resources that you must define to run the
  /// simulation.
  ///
  /// Each of the EC2 scenarios requires that you specify instance, image, and
  /// security-group resources. If your scenario includes an EBS volume, then
  /// you must specify that volume as a resource. If the EC2 scenario includes
  /// VPC, then you must supply the network-interface resource. If it includes
  /// an IP subnet, then you must specify the subnet resource. For more
  /// information on the EC2 scenario options, see [Supported
  /// Platforms](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-supported-platforms.html)
  /// in the _Amazon EC2 User Guide_.
  ///
  /// *    **EC2-Classic-InstanceStore**
  ///
  ///     instance, image, security-group
  ///
  /// *    **EC2-Classic-EBS**
  ///
  ///     instance, image, security-group, volume
  ///
  /// *    **EC2-VPC-InstanceStore**
  ///
  ///     instance, image, security-group, network-interface
  ///
  /// *    **EC2-VPC-InstanceStore-Subnet**
  ///
  ///     instance, image, security-group, network-interface, subnet
  ///
  /// *    **EC2-VPC-EBS**
  ///
  ///     instance, image, security-group, network-interface, volume
  ///
  /// *    **EC2-VPC-EBS-Subnet**
  ///
  ///     instance, image, security-group, network-interface, subnet, volume
  ///
  /// [maxItems]: Use this only when paginating results to indicate the maximum
  /// number of items you want in the response. If additional items exist beyond
  /// the maximum you specify, the `IsTruncated` response element is `true`.
  ///
  /// If you do not include this parameter, the number of items defaults to 100.
  /// Note that IAM might return fewer results, even when there are more results
  /// available. In that case, the `IsTruncated` response element returns
  /// `true`, and `Marker` contains a value to include in the subsequent call
  /// that tells the service where to continue from.
  ///
  /// [marker]: Use this parameter only when paginating results and only after
  /// you receive a response indicating that the results are truncated. Set it
  /// to the value of the `Marker` element in the response that you received to
  /// indicate where the next call should start.
  Future<SimulatePolicyResponse> simulateCustomPolicy(
      {@required List<String> policyInputList,
      @required List<String> actionNames,
      List<String> resourceArns,
      String resourcePolicy,
      String resourceOwner,
      String callerArn,
      List<ContextEntry> contextEntries,
      String resourceHandlingOption,
      int maxItems,
      String marker}) async {
    return SimulatePolicyResponse.fromJson({});
  }

  /// Simulate how a set of IAM policies attached to an IAM entity works with a
  /// list of API operations and AWS resources to determine the policies'
  /// effective permissions. The entity can be an IAM user, group, or role. If
  /// you specify a user, then the simulation also includes all of the policies
  /// that are attached to groups that the user belongs to.
  ///
  /// You can optionally include a list of one or more additional policies
  /// specified as strings to include in the simulation. If you want to simulate
  /// only policies specified as strings, use SimulateCustomPolicy instead.
  ///
  /// You can also optionally include one resource-based policy to be evaluated
  /// with each of the resources included in the simulation.
  ///
  /// The simulation does not perform the API operations; it only checks the
  /// authorization to determine if the simulated policies allow or deny the
  /// operations.
  ///
  ///  **Note:** This API discloses information about the permissions granted to
  /// other users. If you do not want users to see other user's permissions,
  /// then consider allowing them to use SimulateCustomPolicy instead.
  ///
  /// Context keys are variables maintained by AWS and its services that provide
  /// details about the context of an API query request. You can use the
  /// `Condition` element of an IAM policy to evaluate context keys. To get the
  /// list of context keys that the policies require for correct simulation, use
  /// GetContextKeysForPrincipalPolicy.
  ///
  /// If the output is long, you can use the `MaxItems` and `Marker` parameters
  /// to paginate the results.
  ///
  /// [policySourceArn]: The Amazon Resource Name (ARN) of a user, group, or
  /// role whose policies you want to include in the simulation. If you specify
  /// a user, group, or role, the simulation includes all policies that are
  /// associated with that entity. If you specify a user, the simulation also
  /// includes all policies that are attached to any groups the user belongs to.
  ///
  /// For more information about ARNs, see [Amazon Resource Names (ARNs) and AWS
  /// Service
  /// Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html)
  /// in the _AWS General Reference_.
  ///
  /// [policyInputList]: An optional list of additional policy documents to
  /// include in the simulation. Each document is specified as a string
  /// containing the complete, valid JSON text of an IAM policy.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) used to validate this
  /// parameter is a string of characters consisting of the following:
  ///
  /// *   Any printable ASCII character ranging from the space character
  /// (\\u0020) through the end of the ASCII character range
  ///
  /// *   The printable characters in the Basic Latin and Latin-1 Supplement
  /// character set (through \\u00FF)
  ///
  /// *   The special characters tab (\\u0009), line feed (\\u000A), and
  /// carriage return (\\u000D)
  ///
  /// [actionNames]: A list of names of API operations to evaluate in the
  /// simulation. Each operation is evaluated for each resource. Each operation
  /// must include the service identifier, such as `iam:CreateUser`.
  ///
  /// [resourceArns]: A list of ARNs of AWS resources to include in the
  /// simulation. If this parameter is not provided, then the value defaults to
  /// `*` (all resources). Each API in the `ActionNames` parameter is evaluated
  /// for each resource in this list. The simulation determines the access
  /// result (allowed or denied) of each combination and reports it in the
  /// response.
  ///
  /// The simulation does not automatically retrieve policies for the specified
  /// resources. If you want to include a resource policy in the simulation,
  /// then you must include the policy as a string in the `ResourcePolicy`
  /// parameter.
  ///
  /// For more information about ARNs, see [Amazon Resource Names (ARNs) and AWS
  /// Service
  /// Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html)
  /// in the _AWS General Reference_.
  ///
  /// [resourcePolicy]: A resource-based policy to include in the simulation
  /// provided as a string. Each resource in the simulation is treated as if it
  /// had this policy attached. You can include only one resource-based policy
  /// in a simulation.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) used to validate this
  /// parameter is a string of characters consisting of the following:
  ///
  /// *   Any printable ASCII character ranging from the space character
  /// (\\u0020) through the end of the ASCII character range
  ///
  /// *   The printable characters in the Basic Latin and Latin-1 Supplement
  /// character set (through \\u00FF)
  ///
  /// *   The special characters tab (\\u0009), line feed (\\u000A), and
  /// carriage return (\\u000D)
  ///
  /// [resourceOwner]: An AWS account ID that specifies the owner of any
  /// simulated resource that does not identify its owner in the resource ARN.
  /// Examples of resource ARNs include an S3 bucket or object. If
  /// `ResourceOwner` is specified, it is also used as the account owner of any
  /// `ResourcePolicy` included in the simulation. If the `ResourceOwner`
  /// parameter is not specified, then the owner of the resources and the
  /// resource policy defaults to the account of the identity provided in
  /// `CallerArn`. This parameter is required only if you specify a
  /// resource-based policy and account that owns the resource is different from
  /// the account that owns the simulated calling user `CallerArn`.
  ///
  /// [callerArn]: The ARN of the IAM user that you want to specify as the
  /// simulated caller of the API operations. If you do not specify a
  /// `CallerArn`, it defaults to the ARN of the user that you specify in
  /// `PolicySourceArn`, if you specified a user. If you include both a
  /// `PolicySourceArn` (for example, `arn:aws:iam::123456789012:user/David`)
  /// and a `CallerArn` (for example, `arn:aws:iam::123456789012:user/Bob`), the
  /// result is that you simulate calling the API operations as Bob, as if Bob
  /// had David's policies.
  ///
  /// You can specify only the ARN of an IAM user. You cannot specify the ARN of
  /// an assumed role, federated user, or a service principal.
  ///
  ///  `CallerArn` is required if you include a `ResourcePolicy` and the
  /// `PolicySourceArn` is not the ARN for an IAM user. This is required so that
  /// the resource-based policy's `Principal` element has a value to use in
  /// evaluating the policy.
  ///
  /// For more information about ARNs, see [Amazon Resource Names (ARNs) and AWS
  /// Service
  /// Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html)
  /// in the _AWS General Reference_.
  ///
  /// [contextEntries]: A list of context keys and corresponding values for the
  /// simulation to use. Whenever a context key is evaluated in one of the
  /// simulated IAM permissions policies, the corresponding value is supplied.
  ///
  /// [resourceHandlingOption]: Specifies the type of simulation to run.
  /// Different API operations that support resource-based policies require
  /// different combinations of resources. By specifying the type of simulation
  /// to run, you enable the policy simulator to enforce the presence of the
  /// required resources to ensure reliable simulation results. If your
  /// simulation does not match one of the following scenarios, then you can
  /// omit this parameter. The following list shows each of the supported
  /// scenario values and the resources that you must define to run the
  /// simulation.
  ///
  /// Each of the EC2 scenarios requires that you specify instance, image, and
  /// security group resources. If your scenario includes an EBS volume, then
  /// you must specify that volume as a resource. If the EC2 scenario includes
  /// VPC, then you must supply the network interface resource. If it includes
  /// an IP subnet, then you must specify the subnet resource. For more
  /// information on the EC2 scenario options, see [Supported
  /// Platforms](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-supported-platforms.html)
  /// in the _Amazon EC2 User Guide_.
  ///
  /// *    **EC2-Classic-InstanceStore**
  ///
  ///     instance, image, security group
  ///
  /// *    **EC2-Classic-EBS**
  ///
  ///     instance, image, security group, volume
  ///
  /// *    **EC2-VPC-InstanceStore**
  ///
  ///     instance, image, security group, network interface
  ///
  /// *    **EC2-VPC-InstanceStore-Subnet**
  ///
  ///     instance, image, security group, network interface, subnet
  ///
  /// *    **EC2-VPC-EBS**
  ///
  ///     instance, image, security group, network interface, volume
  ///
  /// *    **EC2-VPC-EBS-Subnet**
  ///
  ///     instance, image, security group, network interface, subnet, volume
  ///
  /// [maxItems]: Use this only when paginating results to indicate the maximum
  /// number of items you want in the response. If additional items exist beyond
  /// the maximum you specify, the `IsTruncated` response element is `true`.
  ///
  /// If you do not include this parameter, the number of items defaults to 100.
  /// Note that IAM might return fewer results, even when there are more results
  /// available. In that case, the `IsTruncated` response element returns
  /// `true`, and `Marker` contains a value to include in the subsequent call
  /// that tells the service where to continue from.
  ///
  /// [marker]: Use this parameter only when paginating results and only after
  /// you receive a response indicating that the results are truncated. Set it
  /// to the value of the `Marker` element in the response that you received to
  /// indicate where the next call should start.
  Future<SimulatePolicyResponse> simulatePrincipalPolicy(
      {@required String policySourceArn,
      List<String> policyInputList,
      @required List<String> actionNames,
      List<String> resourceArns,
      String resourcePolicy,
      String resourceOwner,
      String callerArn,
      List<ContextEntry> contextEntries,
      String resourceHandlingOption,
      int maxItems,
      String marker}) async {
    return SimulatePolicyResponse.fromJson({});
  }

  /// Adds one or more tags to an IAM role. The role can be a regular role or a
  /// service-linked role. If a tag with the same key name already exists, then
  /// that tag is overwritten with the new value.
  ///
  /// A tag consists of a key name and an associated value. By assigning tags to
  /// your resources, you can do the following:
  ///
  /// *    **Administrative grouping and discovery** \- Attach tags to resources
  /// to aid in organization and search. For example, you could search for all
  /// resources with the key name _Project_ and the value _MyImportantProject_.
  /// Or search for all resources with the key name _Cost Center_ and the value
  /// _41200_.
  ///
  /// *    **Access control** \- Reference tags in IAM user-based and
  /// resource-based policies. You can use tags to restrict access to only an
  /// IAM user or role that has a specified tag attached. You can also restrict
  /// access to only those resources that have a certain tag attached. For
  /// examples of policies that show how to use tags to control access, see
  /// [Control Access Using IAM
  /// Tags](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html)
  /// in the _IAM User Guide_.
  ///
  /// *    **Cost allocation** \- Use tags to help track which individuals and
  /// teams are using which AWS resources.
  ///
  ///
  ///  *   Make sure that you have no invalid tags and that you do not exceed
  /// the allowed number of tags per role. In either case, the entire request
  /// fails and _no_ tags are added to the role.
  ///
  /// *   AWS always interprets the tag `Value` as a single string. If you need
  /// to store an array, you can store comma-separated values in the string.
  /// However, you must interpret the value in your code.
  ///
  /// For more information about tagging, see [Tagging IAM
  /// Identities](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html)
  /// in the _IAM User Guide_.
  ///
  /// [roleName]: The name of the role that you want to add tags to.
  ///
  /// This parameter accepts (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters that
  /// consist of upper and lowercase alphanumeric characters with no spaces. You
  /// can also include any of the following characters: _+=,.@-
  ///
  /// [tags]: The list of tags that you want to attach to the role. Each tag
  /// consists of a key name and an associated value. You can specify this with
  /// a JSON string.
  Future<void> tagRole(
      {@required String roleName, @required List<Tag> tags}) async {}

  /// Adds one or more tags to an IAM user. If a tag with the same key name
  /// already exists, then that tag is overwritten with the new value.
  ///
  /// A tag consists of a key name and an associated value. By assigning tags to
  /// your resources, you can do the following:
  ///
  /// *    **Administrative grouping and discovery** \- Attach tags to resources
  /// to aid in organization and search. For example, you could search for all
  /// resources with the key name _Project_ and the value _MyImportantProject_.
  /// Or search for all resources with the key name _Cost Center_ and the value
  /// _41200_.
  ///
  /// *    **Access control** \- Reference tags in IAM user-based and
  /// resource-based policies. You can use tags to restrict access to only an
  /// IAM requesting user or to a role that has a specified tag attached. You
  /// can also restrict access to only those resources that have a certain tag
  /// attached. For examples of policies that show how to use tags to control
  /// access, see [Control Access Using IAM
  /// Tags](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html)
  /// in the _IAM User Guide_.
  ///
  /// *    **Cost allocation** \- Use tags to help track which individuals and
  /// teams are using which AWS resources.
  ///
  ///
  ///  *   Make sure that you have no invalid tags and that you do not exceed
  /// the allowed number of tags per role. In either case, the entire request
  /// fails and _no_ tags are added to the role.
  ///
  /// *   AWS always interprets the tag `Value` as a single string. If you need
  /// to store an array, you can store comma-separated values in the string.
  /// However, you must interpret the value in your code.
  ///
  /// For more information about tagging, see [Tagging IAM
  /// Identities](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html)
  /// in the _IAM User Guide_.
  ///
  /// [userName]: The name of the user that you want to add tags to.
  ///
  /// This parameter accepts (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters that
  /// consist of upper and lowercase alphanumeric characters with no spaces. You
  /// can also include any of the following characters: =,.@-
  ///
  /// [tags]: The list of tags that you want to attach to the user. Each tag
  /// consists of a key name and an associated value.
  Future<void> tagUser(
      {@required String userName, @required List<Tag> tags}) async {}

  /// Removes the specified tags from the role. For more information about
  /// tagging, see [Tagging IAM
  /// Identities](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html)
  /// in the _IAM User Guide_.
  ///
  /// [roleName]: The name of the IAM role from which you want to remove tags.
  ///
  /// This parameter accepts (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters that
  /// consist of upper and lowercase alphanumeric characters with no spaces. You
  /// can also include any of the following characters: _+=,.@-
  ///
  /// [tagKeys]: A list of key names as a simple array of strings. The tags with
  /// matching keys are removed from the specified role.
  Future<void> untagRole(
      {@required String roleName, @required List<String> tagKeys}) async {}

  /// Removes the specified tags from the user. For more information about
  /// tagging, see [Tagging IAM
  /// Identities](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html)
  /// in the _IAM User Guide_.
  ///
  /// [userName]: The name of the IAM user from which you want to remove tags.
  ///
  /// This parameter accepts (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters that
  /// consist of upper and lowercase alphanumeric characters with no spaces. You
  /// can also include any of the following characters: =,.@-
  ///
  /// [tagKeys]: A list of key names as a simple array of strings. The tags with
  /// matching keys are removed from the specified user.
  Future<void> untagUser(
      {@required String userName, @required List<String> tagKeys}) async {}

  /// Changes the status of the specified access key from Active to Inactive, or
  /// vice versa. This operation can be used to disable a user's key as part of
  /// a key rotation workflow.
  ///
  /// If the `UserName` is not specified, the user name is determined implicitly
  /// based on the AWS access key ID used to sign the request. This operation
  /// works for access keys under the AWS account. Consequently, you can use
  /// this operation to manage AWS account root user credentials even if the AWS
  /// account has no associated users.
  ///
  /// For information about rotating keys, see [Managing Keys and
  /// Certificates](https://docs.aws.amazon.com/IAM/latest/UserGuide/ManagingCredentials.html)
  /// in the _IAM User Guide_.
  ///
  /// [userName]: The name of the user whose key you want to update.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  ///
  /// [accessKeyId]: The access key ID of the secret access key you want to
  /// update.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters that can
  /// consist of any upper or lowercased letter or digit.
  ///
  /// [status]:  The status you want to assign to the secret access key.
  /// `Active` means that the key can be used for API calls to AWS, while
  /// `Inactive` means that the key cannot be used.
  Future<void> updateAccessKey(
      {String userName,
      @required String accessKeyId,
      @required String status}) async {}

  /// Updates the password policy settings for the AWS account.
  ///
  ///  *   This operation does not support partial updates. No parameters are
  /// required, but if you do not specify a parameter, that parameter's value
  /// reverts to its default value. See the **Request Parameters** section for
  /// each parameter's default value. Also note that some parameters do not
  /// allow the default parameter to be explicitly set. Instead, to invoke the
  /// default value, do not include that parameter when you invoke the
  /// operation.
  ///
  ///  For more information about using a password policy, see [Managing an IAM
  /// Password
  /// Policy](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_ManagingPasswordPolicies.html)
  /// in the _IAM User Guide_.
  ///
  /// [minimumPasswordLength]: The minimum number of characters allowed in an
  /// IAM user password.
  ///
  /// If you do not specify a value for this parameter, then the operation uses
  /// the default value of `6`.
  ///
  /// [requireSymbols]: Specifies whether IAM user passwords must contain at
  /// least one of the following non-alphanumeric characters:
  ///
  /// ! @ # $ % ^ & \* ( ) _ + - = \[ \] { } | '
  ///
  /// If you do not specify a value for this parameter, then the operation uses
  /// the default value of `false`. The result is that passwords do not require
  /// at least one symbol character.
  ///
  /// [requireNumbers]: Specifies whether IAM user passwords must contain at
  /// least one numeric character (0 to 9).
  ///
  /// If you do not specify a value for this parameter, then the operation uses
  /// the default value of `false`. The result is that passwords do not require
  /// at least one numeric character.
  ///
  /// [requireUppercaseCharacters]: Specifies whether IAM user passwords must
  /// contain at least one uppercase character from the ISO basic Latin alphabet
  /// (A to Z).
  ///
  /// If you do not specify a value for this parameter, then the operation uses
  /// the default value of `false`. The result is that passwords do not require
  /// at least one uppercase character.
  ///
  /// [requireLowercaseCharacters]: Specifies whether IAM user passwords must
  /// contain at least one lowercase character from the ISO basic Latin alphabet
  /// (a to z).
  ///
  /// If you do not specify a value for this parameter, then the operation uses
  /// the default value of `false`. The result is that passwords do not require
  /// at least one lowercase character.
  ///
  /// [allowUsersToChangePassword]:  Allows all IAM users in your account to use
  /// the AWS Management Console to change their own passwords. For more
  /// information, see [Letting IAM Users Change Their Own
  /// Passwords](https://docs.aws.amazon.com/IAM/latest/UserGuide/HowToPwdIAMUser.html)
  /// in the _IAM User Guide_.
  ///
  /// If you do not specify a value for this parameter, then the operation uses
  /// the default value of `false`. The result is that IAM users in the account
  /// do not automatically have permissions to change their own password.
  ///
  /// [maxPasswordAge]: The number of days that an IAM user password is valid.
  ///
  /// If you do not specify a value for this parameter, then the operation uses
  /// the default value of `0`. The result is that IAM user passwords never
  /// expire.
  ///
  /// [passwordReusePrevention]: Specifies the number of previous passwords that
  /// IAM users are prevented from reusing.
  ///
  /// If you do not specify a value for this parameter, then the operation uses
  /// the default value of `0`. The result is that IAM users are not prevented
  /// from reusing previous passwords.
  ///
  /// [hardExpiry]: Prevents IAM users from setting a new password after their
  /// password has expired. The IAM user cannot be accessed until an
  /// administrator resets the password.
  ///
  /// If you do not specify a value for this parameter, then the operation uses
  /// the default value of `false`. The result is that IAM users can change
  /// their passwords after they expire and continue to sign in as the user.
  Future<void> updateAccountPasswordPolicy(
      {int minimumPasswordLength,
      bool requireSymbols,
      bool requireNumbers,
      bool requireUppercaseCharacters,
      bool requireLowercaseCharacters,
      bool allowUsersToChangePassword,
      int maxPasswordAge,
      int passwordReusePrevention,
      bool hardExpiry}) async {}

  /// Updates the policy that grants an IAM entity permission to assume a role.
  /// This is typically referred to as the "role trust policy". For more
  /// information about roles, go to [Using Roles to Delegate Permissions and
  /// Federate
  /// Identities](https://docs.aws.amazon.com/IAM/latest/UserGuide/roles-toplevel.html).
  ///
  /// [roleName]: The name of the role to update with the new policy.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  ///
  /// [policyDocument]: The policy that grants an entity permission to assume
  /// the role.
  ///
  /// You must provide policies in JSON format in IAM. However, for AWS
  /// CloudFormation templates formatted in YAML, you can provide the policy in
  /// JSON or YAML format. AWS CloudFormation always converts a YAML policy to
  /// JSON format before submitting it to IAM.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) used to validate this
  /// parameter is a string of characters consisting of the following:
  ///
  /// *   Any printable ASCII character ranging from the space character
  /// (\\u0020) through the end of the ASCII character range
  ///
  /// *   The printable characters in the Basic Latin and Latin-1 Supplement
  /// character set (through \\u00FF)
  ///
  /// *   The special characters tab (\\u0009), line feed (\\u000A), and
  /// carriage return (\\u000D)
  Future<void> updateAssumeRolePolicy(
      {@required String roleName, @required String policyDocument}) async {}

  /// Updates the name and/or the path of the specified IAM group.
  ///
  ///   You should understand the implications of changing a group's path or
  /// name. For more information, see [Renaming Users and
  /// Groups](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_WorkingWithGroupsAndUsers.html)
  /// in the _IAM User Guide_.
  ///
  /// The person making the request (the principal), must have permission to
  /// change the role group with the old name and the new name. For example, to
  /// change the group named `Managers` to `MGRs`, the principal must have a
  /// policy that allows them to update both groups. If the principal has
  /// permission to update the `Managers` group, but not the `MGRs` group, then
  /// the update fails. For more information about permissions, see [Access
  /// Management](https://docs.aws.amazon.com/IAM/latest/UserGuide/access.html).
  ///
  /// [groupName]: Name of the IAM group to update. If you're changing the name
  /// of the group, this is the original name.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  ///
  /// [newPath]: New path for the IAM group. Only include this if changing the
  /// group's path.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of either a forward slash (/) by itself or a string that must
  /// begin and end with forward slashes. In addition, it can contain any ASCII
  /// character from the ! (\\u0021) through the DEL character (\\u007F),
  /// including most punctuation characters, digits, and upper and lowercased
  /// letters.
  ///
  /// [newGroupName]: New name for the IAM group. Only include this if changing
  /// the group's name.
  ///
  /// IAM user, group, role, and policy names must be unique within the account.
  /// Names are not distinguished by case. For example, you cannot create
  /// resources named both "MyResource" and "myresource".
  Future<void> updateGroup(String groupName,
      {String newPath, String newGroupName}) async {}

  /// Changes the password for the specified IAM user.
  ///
  /// IAM users can change their own passwords by calling ChangePassword. For
  /// more information about modifying passwords, see [Managing
  /// Passwords](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_ManagingLogins.html)
  /// in the _IAM User Guide_.
  ///
  /// [userName]: The name of the user whose password you want to update.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  ///
  /// [password]: The new password for the specified IAM user.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) used to validate this
  /// parameter is a string of characters consisting of the following:
  ///
  /// *   Any printable ASCII character ranging from the space character
  /// (\\u0020) through the end of the ASCII character range
  ///
  /// *   The printable characters in the Basic Latin and Latin-1 Supplement
  /// character set (through \\u00FF)
  ///
  /// *   The special characters tab (\\u0009), line feed (\\u000A), and
  /// carriage return (\\u000D)
  ///
  ///
  /// However, the format can be further restricted by the account administrator
  /// by setting a password policy on the AWS account. For more information, see
  /// UpdateAccountPasswordPolicy.
  ///
  /// [passwordResetRequired]: Allows this new password to be used only once by
  /// requiring the specified IAM user to set a new password on next sign-in.
  Future<void> updateLoginProfile(String userName,
      {String password, bool passwordResetRequired}) async {}

  /// Replaces the existing list of server certificate thumbprints associated
  /// with an OpenID Connect (OIDC) provider resource object with a new list of
  /// thumbprints.
  ///
  /// The list that you pass with this operation completely replaces the
  /// existing list of thumbprints. (The lists are not merged.)
  ///
  /// Typically, you need to update a thumbprint only when the identity
  /// provider's certificate changes, which occurs rarely. However, if the
  /// provider's certificate _does_ change, any attempt to assume an IAM role
  /// that specifies the OIDC provider as a principal fails until the
  /// certificate thumbprint is updated.
  ///
  ///
  ///
  /// Trust for the OIDC provider is derived from the provider's certificate and
  /// is validated by the thumbprint. Therefore, it is best to limit access to
  /// the `UpdateOpenIDConnectProviderThumbprint` operation to highly privileged
  /// users.
  ///
  /// [openIDConnectProviderArn]: The Amazon Resource Name (ARN) of the IAM OIDC
  /// provider resource object for which you want to update the thumbprint. You
  /// can get a list of OIDC provider ARNs by using the
  /// ListOpenIDConnectProviders operation.
  ///
  /// For more information about ARNs, see [Amazon Resource Names (ARNs) and AWS
  /// Service
  /// Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html)
  /// in the _AWS General Reference_.
  ///
  /// [thumbprintList]: A list of certificate thumbprints that are associated
  /// with the specified IAM OpenID Connect provider. For more information, see
  /// CreateOpenIDConnectProvider.
  Future<void> updateOpenIDConnectProviderThumbprint(
      {@required String openIDConnectProviderArn,
      @required List<String> thumbprintList}) async {}

  /// Updates the description or maximum session duration setting of a role.
  ///
  /// [roleName]: The name of the role that you want to modify.
  ///
  /// [description]: The new description that you want to apply to the specified
  /// role.
  ///
  /// [maxSessionDuration]: The maximum session duration (in seconds) that you
  /// want to set for the specified role. If you do not specify a value for this
  /// setting, the default maximum of one hour is applied. This setting can have
  /// a value from 1 hour to 12 hours.
  ///
  /// Anyone who assumes the role from the AWS CLI or API can use the
  /// `DurationSeconds` API parameter or the `duration-seconds` CLI parameter to
  /// request a longer session. The `MaxSessionDuration` setting determines the
  /// maximum duration that can be requested using the `DurationSeconds`
  /// parameter. If users don't specify a value for the `DurationSeconds`
  /// parameter, their security credentials are valid for one hour by default.
  /// This applies when you use the `AssumeRole*` API operations or the
  /// `assume-role*` CLI operations but does not apply when you use those
  /// operations to create a console URL. For more information, see [Using IAM
  /// Roles](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use.html)
  /// in the _IAM User Guide_.
  Future<UpdateRoleResponse> updateRole(String roleName,
      {String description, int maxSessionDuration}) async {
    return UpdateRoleResponse.fromJson({});
  }

  /// Use UpdateRole instead.
  ///
  /// Modifies only the description of a role. This operation performs the same
  /// function as the `Description` parameter in the `UpdateRole` operation.
  ///
  /// [roleName]: The name of the role that you want to modify.
  ///
  /// [description]: The new description that you want to apply to the specified
  /// role.
  Future<UpdateRoleDescriptionResponse> updateRoleDescription(
      {@required String roleName, @required String description}) async {
    return UpdateRoleDescriptionResponse.fromJson({});
  }

  /// Updates the metadata document for an existing SAML provider resource
  /// object.
  ///
  ///
  ///
  /// This operation requires [Signature Version
  /// 4](https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html).
  ///
  /// [samlMetadataDocument]: An XML document generated by an identity provider
  /// (IdP) that supports SAML 2.0. The document includes the issuer's name,
  /// expiration information, and keys that can be used to validate the SAML
  /// authentication response (assertions) that are received from the IdP. You
  /// must generate the metadata document using the identity management software
  /// that is used as your organization's IdP.
  ///
  /// [samlProviderArn]: The Amazon Resource Name (ARN) of the SAML provider to
  /// update.
  ///
  /// For more information about ARNs, see [Amazon Resource Names (ARNs) and AWS
  /// Service
  /// Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html)
  /// in the _AWS General Reference_.
  Future<UpdateSamlProviderResponse> updateSamlProvider(
      {@required String samlMetadataDocument,
      @required String samlProviderArn}) async {
    return UpdateSamlProviderResponse.fromJson({});
  }

  /// Sets the status of an IAM user's SSH public key to active or inactive. SSH
  /// public keys that are inactive cannot be used for authentication. This
  /// operation can be used to disable a user's SSH public key as part of a key
  /// rotation work flow.
  ///
  /// The SSH public key affected by this operation is used only for
  /// authenticating the associated IAM user to an AWS CodeCommit repository.
  /// For more information about using SSH keys to authenticate to an AWS
  /// CodeCommit repository, see [Set up AWS CodeCommit for SSH
  /// Connections](https://docs.aws.amazon.com/codecommit/latest/userguide/setting-up-credentials-ssh.html)
  /// in the _AWS CodeCommit User Guide_.
  ///
  /// [userName]: The name of the IAM user associated with the SSH public key.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  ///
  /// [sshPublicKeyId]: The unique identifier for the SSH public key.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters that can
  /// consist of any upper or lowercased letter or digit.
  ///
  /// [status]: The status to assign to the SSH public key. `Active` means that
  /// the key can be used for authentication with an AWS CodeCommit repository.
  /// `Inactive` means that the key cannot be used.
  Future<void> updateSshPublicKey(
      {@required String userName,
      @required String sshPublicKeyId,
      @required String status}) async {}

  /// Updates the name and/or the path of the specified server certificate
  /// stored in IAM.
  ///
  /// For more information about working with server certificates, see [Working
  /// with Server
  /// Certificates](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_server-certs.html)
  /// in the _IAM User Guide_. This topic also includes a list of AWS services
  /// that can use the server certificates that you manage with IAM.
  ///
  ///  You should understand the implications of changing a server certificate's
  /// path or name. For more information, see [Renaming a Server
  /// Certificate](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_server-certs_manage.html#RenamingServerCerts)
  /// in the _IAM User Guide_.
  ///
  /// The person making the request (the principal), must have permission to
  /// change the server certificate with the old name and the new name. For
  /// example, to change the certificate named `ProductionCert` to `ProdCert`,
  /// the principal must have a policy that allows them to update both
  /// certificates. If the principal has permission to update the
  /// `ProductionCert` group, but not the `ProdCert` certificate, then the
  /// update fails. For more information about permissions, see [Access
  /// Management](https://docs.aws.amazon.com/IAM/latest/UserGuide/access.html)
  /// in the _IAM User Guide_.
  ///
  /// [serverCertificateName]: The name of the server certificate that you want
  /// to update.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  ///
  /// [newPath]: The new path for the server certificate. Include this only if
  /// you are updating the server certificate's path.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of either a forward slash (/) by itself or a string that must
  /// begin and end with forward slashes. In addition, it can contain any ASCII
  /// character from the ! (\\u0021) through the DEL character (\\u007F),
  /// including most punctuation characters, digits, and upper and lowercased
  /// letters.
  ///
  /// [newServerCertificateName]: The new name for the server certificate.
  /// Include this only if you are updating the server certificate's name. The
  /// name of the certificate cannot contain any spaces.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  Future<void> updateServerCertificate(String serverCertificateName,
      {String newPath, String newServerCertificateName}) async {}

  /// Sets the status of a service-specific credential to `Active` or
  /// `Inactive`. Service-specific credentials that are inactive cannot be used
  /// for authentication to the service. This operation can be used to disable a
  /// user's service-specific credential as part of a credential rotation work
  /// flow.
  ///
  /// [userName]: The name of the IAM user associated with the service-specific
  /// credential. If you do not specify this value, then the operation assumes
  /// the user whose credentials are used to call the operation.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  ///
  /// [serviceSpecificCredentialId]: The unique identifier of the
  /// service-specific credential.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters that can
  /// consist of any upper or lowercased letter or digit.
  ///
  /// [status]: The status to be assigned to the service-specific credential.
  Future<void> updateServiceSpecificCredential(
      {String userName,
      @required String serviceSpecificCredentialId,
      @required String status}) async {}

  /// Changes the status of the specified user signing certificate from active
  /// to disabled, or vice versa. This operation can be used to disable an IAM
  /// user's signing certificate as part of a certificate rotation work flow.
  ///
  /// If the `UserName` field is not specified, the user name is determined
  /// implicitly based on the AWS access key ID used to sign the request. This
  /// operation works for access keys under the AWS account. Consequently, you
  /// can use this operation to manage AWS account root user credentials even if
  /// the AWS account has no associated users.
  ///
  /// [userName]: The name of the IAM user the signing certificate belongs to.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  ///
  /// [certificateId]: The ID of the signing certificate you want to update.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters that can
  /// consist of any upper or lowercased letter or digit.
  ///
  /// [status]:  The status you want to assign to the certificate. `Active`
  /// means that the certificate can be used for API calls to AWS `Inactive`
  /// means that the certificate cannot be used.
  Future<void> updateSigningCertificate(
      {String userName,
      @required String certificateId,
      @required String status}) async {}

  /// Updates the name and/or the path of the specified IAM user.
  ///
  ///   You should understand the implications of changing an IAM user's path or
  /// name. For more information, see [Renaming an IAM
  /// User](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_manage.html#id_users_renaming)
  /// and [Renaming an IAM
  /// Group](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_groups_manage_rename.html)
  /// in the _IAM User Guide_.   To change a user name, the requester must have
  /// appropriate permissions on both the source object and the target object.
  /// For example, to change Bob to Robert, the entity making the request must
  /// have permission on Bob and Robert, or must have permission on all (*). For
  /// more information about permissions, see [Permissions and
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/PermissionsAndPolicies.html).
  ///
  /// [userName]: Name of the user to update. If you're changing the name of the
  /// user, this is the original user name.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  ///
  /// [newPath]: New path for the IAM user. Include this parameter only if
  /// you're changing the user's path.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of either a forward slash (/) by itself or a string that must
  /// begin and end with forward slashes. In addition, it can contain any ASCII
  /// character from the ! (\\u0021) through the DEL character (\\u007F),
  /// including most punctuation characters, digits, and upper and lowercased
  /// letters.
  ///
  /// [newUserName]: New name for the user. Include this parameter only if
  /// you're changing the user's name.
  ///
  /// IAM user, group, role, and policy names must be unique within the account.
  /// Names are not distinguished by case. For example, you cannot create
  /// resources named both "MyResource" and "myresource".
  Future<void> updateUser(String userName,
      {String newPath, String newUserName}) async {}

  /// Uploads an SSH public key and associates it with the specified IAM user.
  ///
  /// The SSH public key uploaded by this operation can be used only for
  /// authenticating the associated IAM user to an AWS CodeCommit repository.
  /// For more information about using SSH keys to authenticate to an AWS
  /// CodeCommit repository, see [Set up AWS CodeCommit for SSH
  /// Connections](https://docs.aws.amazon.com/codecommit/latest/userguide/setting-up-credentials-ssh.html)
  /// in the _AWS CodeCommit User Guide_.
  ///
  /// [userName]: The name of the IAM user to associate the SSH public key with.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  ///
  /// [sshPublicKeyBody]: The SSH public key. The public key must be encoded in
  /// ssh-rsa format or PEM format. The minimum bit-length of the public key is
  /// 2048 bits. For example, you can generate a 2048-bit key, and the resulting
  /// PEM file is 1679 bytes long.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) used to validate this
  /// parameter is a string of characters consisting of the following:
  ///
  /// *   Any printable ASCII character ranging from the space character
  /// (\\u0020) through the end of the ASCII character range
  ///
  /// *   The printable characters in the Basic Latin and Latin-1 Supplement
  /// character set (through \\u00FF)
  ///
  /// *   The special characters tab (\\u0009), line feed (\\u000A), and
  /// carriage return (\\u000D)
  Future<UploadSshPublicKeyResponse> uploadSshPublicKey(
      {@required String userName, @required String sshPublicKeyBody}) async {
    return UploadSshPublicKeyResponse.fromJson({});
  }

  /// Uploads a server certificate entity for the AWS account. The server
  /// certificate entity includes a public key certificate, a private key, and
  /// an optional certificate chain, which should all be PEM-encoded.
  ///
  /// We recommend that you use [AWS Certificate
  /// Manager](https://docs.aws.amazon.com/acm/) to provision, manage, and
  /// deploy your server certificates. With ACM you can request a certificate,
  /// deploy it to AWS resources, and let ACM handle certificate renewals for
  /// you. Certificates provided by ACM are free. For more information about
  /// using ACM, see the [AWS Certificate Manager User
  /// Guide](https://docs.aws.amazon.com/acm/latest/userguide/).
  ///
  /// For more information about working with server certificates, see [Working
  /// with Server
  /// Certificates](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_server-certs.html)
  /// in the _IAM User Guide_. This topic includes a list of AWS services that
  /// can use the server certificates that you manage with IAM.
  ///
  /// For information about the number of server certificates you can upload,
  /// see [Limitations on IAM Entities and
  /// Objects](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-limits.html)
  /// in the _IAM User Guide_.
  ///
  ///
  ///
  /// Because the body of the public key certificate, private key, and the
  /// certificate chain can be large, you should use POST rather than GET when
  /// calling `UploadServerCertificate`. For information about setting up
  /// signatures and authorization through the API, go to [Signing AWS API
  /// Requests](https://docs.aws.amazon.com/general/latest/gr/signing_aws_api_requests.html)
  /// in the _AWS General Reference_. For general information about using the
  /// Query API with IAM, go to [Calling the API by Making HTTP Query
  /// Requests](https://docs.aws.amazon.com/IAM/latest/UserGuide/programming.html)
  /// in the _IAM User Guide_.
  ///
  /// [path]: The path for the server certificate. For more information about
  /// paths, see [IAM
  /// Identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html)
  /// in the _IAM User Guide_.
  ///
  /// This parameter is optional. If it is not included, it defaults to a slash
  /// (/). This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of either a forward slash (/) by itself or a string that must
  /// begin and end with forward slashes. In addition, it can contain any ASCII
  /// character from the ! (\\u0021) through the DEL character (\\u007F),
  /// including most punctuation characters, digits, and upper and lowercased
  /// letters.
  ///
  ///   If you are uploading a server certificate specifically for use with
  /// Amazon CloudFront distributions, you must specify a path using the `path`
  /// parameter. The path must begin with `/cloudfront` and must include a
  /// trailing slash (for example, `/cloudfront/test/`).
  ///
  /// [serverCertificateName]: The name for the server certificate. Do not
  /// include the path in this value. The name of the certificate cannot contain
  /// any spaces.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  ///
  /// [certificateBody]: The contents of the public key certificate in
  /// PEM-encoded format.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) used to validate this
  /// parameter is a string of characters consisting of the following:
  ///
  /// *   Any printable ASCII character ranging from the space character
  /// (\\u0020) through the end of the ASCII character range
  ///
  /// *   The printable characters in the Basic Latin and Latin-1 Supplement
  /// character set (through \\u00FF)
  ///
  /// *   The special characters tab (\\u0009), line feed (\\u000A), and
  /// carriage return (\\u000D)
  ///
  /// [privateKey]: The contents of the private key in PEM-encoded format.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) used to validate this
  /// parameter is a string of characters consisting of the following:
  ///
  /// *   Any printable ASCII character ranging from the space character
  /// (\\u0020) through the end of the ASCII character range
  ///
  /// *   The printable characters in the Basic Latin and Latin-1 Supplement
  /// character set (through \\u00FF)
  ///
  /// *   The special characters tab (\\u0009), line feed (\\u000A), and
  /// carriage return (\\u000D)
  ///
  /// [certificateChain]: The contents of the certificate chain. This is
  /// typically a concatenation of the PEM-encoded public key certificates of
  /// the chain.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) used to validate this
  /// parameter is a string of characters consisting of the following:
  ///
  /// *   Any printable ASCII character ranging from the space character
  /// (\\u0020) through the end of the ASCII character range
  ///
  /// *   The printable characters in the Basic Latin and Latin-1 Supplement
  /// character set (through \\u00FF)
  ///
  /// *   The special characters tab (\\u0009), line feed (\\u000A), and
  /// carriage return (\\u000D)
  Future<UploadServerCertificateResponse> uploadServerCertificate(
      {String path,
      @required String serverCertificateName,
      @required String certificateBody,
      @required String privateKey,
      String certificateChain}) async {
    return UploadServerCertificateResponse.fromJson({});
  }

  /// Uploads an X.509 signing certificate and associates it with the specified
  /// IAM user. Some AWS services use X.509 signing certificates to validate
  /// requests that are signed with a corresponding private key. When you upload
  /// the certificate, its default status is `Active`.
  ///
  /// If the `UserName` is not specified, the IAM user name is determined
  /// implicitly based on the AWS access key ID used to sign the request. This
  /// operation works for access keys under the AWS account. Consequently, you
  /// can use this operation to manage AWS account root user credentials even if
  /// the AWS account has no associated users.
  ///
  ///
  ///
  /// Because the body of an X.509 certificate can be large, you should use POST
  /// rather than GET when calling `UploadSigningCertificate`. For information
  /// about setting up signatures and authorization through the API, go to
  /// [Signing AWS API
  /// Requests](https://docs.aws.amazon.com/general/latest/gr/signing_aws_api_requests.html)
  /// in the _AWS General Reference_. For general information about using the
  /// Query API with IAM, go to [Making Query
  /// Requests](https://docs.aws.amazon.com/IAM/latest/UserGuide/IAM_UsingQueryAPI.html)
  /// in the _IAM User Guide_.
  ///
  /// [userName]: The name of the user the signing certificate is for.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  ///
  /// [certificateBody]: The contents of the signing certificate.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) used to validate this
  /// parameter is a string of characters consisting of the following:
  ///
  /// *   Any printable ASCII character ranging from the space character
  /// (\\u0020) through the end of the ASCII character range
  ///
  /// *   The printable characters in the Basic Latin and Latin-1 Supplement
  /// character set (through \\u00FF)
  ///
  /// *   The special characters tab (\\u0009), line feed (\\u000A), and
  /// carriage return (\\u000D)
  Future<UploadSigningCertificateResponse> uploadSigningCertificate(
      String certificateBody,
      {String userName}) async {
    return UploadSigningCertificateResponse.fromJson({});
  }
}

class AccessDetail {
  /// The name of the service in which access was attempted.
  final String serviceName;

  /// The namespace of the service in which access was attempted.
  ///
  /// To learn the service namespace of a service, go to [Actions, Resources,
  /// and Condition Keys for AWS
  /// Services](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_actions-resources-contextkeys.html)
  /// in the _IAM User Guide_. Choose the name of the service to view details
  /// for that service. In the first paragraph, find the service prefix. For
  /// example, `(service prefix: a4b)`. For more information about service
  /// namespaces, see [AWS Service
  /// Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#genref-aws-service-namespaces)
  /// in the _AWS General Reference_.
  final String serviceNamespace;

  /// The Region where the last service access attempt occurred.
  ///
  /// This field is null if no principals in the reported Organizations entity
  /// attempted to access the service within the [reporting
  /// period](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#service-last-accessed-reporting-period).
  final String region;

  /// The path of the Organizations entity (root, organizational unit, or
  /// account) from which an authenticated principal last attempted to access
  /// the service. AWS does not report unauthenticated requests.
  ///
  /// This field is null if no principals (IAM users, IAM roles, or root users)
  /// in the reported Organizations entity attempted to access the service
  /// within the [reporting
  /// period](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#service-last-accessed-reporting-period).
  final String entityPath;

  /// The date and time, in [ISO 8601 date-time
  /// format](http://www.iso.org/iso/iso8601), when an authenticated principal
  /// most recently attempted to access the service. AWS does not report
  /// unauthenticated requests.
  ///
  /// This field is null if no principals in the reported Organizations entity
  /// attempted to access the service within the [reporting
  /// period](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#service-last-accessed-reporting-period).
  final DateTime lastAuthenticatedTime;

  /// The number of accounts with authenticated principals (root users, IAM
  /// users, and IAM roles) that attempted to access the service in the
  /// reporting period.
  final int totalAuthenticatedEntities;

  AccessDetail({
    @required this.serviceName,
    @required this.serviceNamespace,
    this.region,
    this.entityPath,
    this.lastAuthenticatedTime,
    this.totalAuthenticatedEntities,
  });
  static AccessDetail fromJson(Map<String, dynamic> json) => AccessDetail();
}

class AccessKey {
  /// The name of the IAM user that the access key is associated with.
  final String userName;

  /// The ID for this access key.
  final String accessKeyId;

  /// The status of the access key. `Active` means that the key is valid for API
  /// calls, while `Inactive` means it is not.
  final String status;

  /// The secret key used to sign requests.
  final String secretAccessKey;

  /// The date when the access key was created.
  final DateTime createDate;

  AccessKey({
    @required this.userName,
    @required this.accessKeyId,
    @required this.status,
    @required this.secretAccessKey,
    this.createDate,
  });
  static AccessKey fromJson(Map<String, dynamic> json) => AccessKey();
}

class AccessKeyLastUsed {
  /// The date and time, in [ISO 8601 date-time
  /// format](http://www.iso.org/iso/iso8601), when the access key was most
  /// recently used. This field is null in the following situations:
  ///
  /// *   The user does not have an access key.
  ///
  /// *   An access key exists but has not been used since IAM began tracking
  /// this information.
  ///
  /// *   There is no sign-in data associated with the user.
  final DateTime lastUsedDate;

  /// The name of the AWS service with which this access key was most recently
  /// used. The value of this field is "N/A" in the following situations:
  ///
  /// *   The user does not have an access key.
  ///
  /// *   An access key exists but has not been used since IAM started tracking
  /// this information.
  ///
  /// *   There is no sign-in data associated with the user.
  final String serviceName;

  /// The AWS Region where this access key was most recently used. The value for
  /// this field is "N/A" in the following situations:
  ///
  /// *   The user does not have an access key.
  ///
  /// *   An access key exists but has not been used since IAM began tracking
  /// this information.
  ///
  /// *   There is no sign-in data associated with the user.
  ///
  ///
  /// For more information about AWS Regions, see [Regions and
  /// Endpoints](https://docs.aws.amazon.com/general/latest/gr/rande.html) in
  /// the Amazon Web Services General Reference.
  final String region;

  AccessKeyLastUsed({
    @required this.lastUsedDate,
    @required this.serviceName,
    @required this.region,
  });
  static AccessKeyLastUsed fromJson(Map<String, dynamic> json) =>
      AccessKeyLastUsed();
}

class AccessKeyMetadata {
  /// The name of the IAM user that the key is associated with.
  final String userName;

  /// The ID for this access key.
  final String accessKeyId;

  /// The status of the access key. `Active` means that the key is valid for API
  /// calls; `Inactive` means it is not.
  final String status;

  /// The date when the access key was created.
  final DateTime createDate;

  AccessKeyMetadata({
    this.userName,
    this.accessKeyId,
    this.status,
    this.createDate,
  });
  static AccessKeyMetadata fromJson(Map<String, dynamic> json) =>
      AccessKeyMetadata();
}

class AttachedPermissionsBoundary {
  ///  The permissions boundary usage type that indicates what type of IAM
  /// resource is used as the permissions boundary for an entity. This data type
  /// can only have a value of `Policy`.
  final String permissionsBoundaryType;

  ///  The ARN of the policy used to set the permissions boundary for the user
  /// or role.
  final String permissionsBoundaryArn;

  AttachedPermissionsBoundary({
    this.permissionsBoundaryType,
    this.permissionsBoundaryArn,
  });
  static AttachedPermissionsBoundary fromJson(Map<String, dynamic> json) =>
      AttachedPermissionsBoundary();
}

class AttachedPolicy {
  /// The friendly name of the attached policy.
  final String policyName;

  final String policyArn;

  AttachedPolicy({
    this.policyName,
    this.policyArn,
  });
  static AttachedPolicy fromJson(Map<String, dynamic> json) => AttachedPolicy();
}

class ContextEntry {
  /// The full name of a condition context key, including the service prefix.
  /// For example, `aws:SourceIp` or `s3:VersionId`.
  final String contextKeyName;

  /// The value (or values, if the condition context key supports multiple
  /// values) to provide to the simulation when the key is referenced by a
  /// `Condition` element in an input policy.
  final List<String> contextKeyValues;

  /// The data type of the value (or values) specified in the `ContextKeyValues`
  /// parameter.
  final String contextKeyType;

  ContextEntry({
    this.contextKeyName,
    this.contextKeyValues,
    this.contextKeyType,
  });
}

class CreateAccessKeyResponse {
  /// A structure with details about the access key.
  final AccessKey accessKey;

  CreateAccessKeyResponse({
    @required this.accessKey,
  });
  static CreateAccessKeyResponse fromJson(Map<String, dynamic> json) =>
      CreateAccessKeyResponse();
}

class CreateGroupResponse {
  /// A structure containing details about the new group.
  final Group group;

  CreateGroupResponse({
    @required this.group,
  });
  static CreateGroupResponse fromJson(Map<String, dynamic> json) =>
      CreateGroupResponse();
}

class CreateInstanceProfileResponse {
  /// A structure containing details about the new instance profile.
  final InstanceProfile instanceProfile;

  CreateInstanceProfileResponse({
    @required this.instanceProfile,
  });
  static CreateInstanceProfileResponse fromJson(Map<String, dynamic> json) =>
      CreateInstanceProfileResponse();
}

class CreateLoginProfileResponse {
  /// A structure containing the user name and password create date.
  final LoginProfile loginProfile;

  CreateLoginProfileResponse({
    @required this.loginProfile,
  });
  static CreateLoginProfileResponse fromJson(Map<String, dynamic> json) =>
      CreateLoginProfileResponse();
}

class CreateOpenIDConnectProviderResponse {
  /// The Amazon Resource Name (ARN) of the new IAM OpenID Connect provider that
  /// is created. For more information, see OpenIDConnectProviderListEntry.
  final String openIDConnectProviderArn;

  CreateOpenIDConnectProviderResponse({
    this.openIDConnectProviderArn,
  });
  static CreateOpenIDConnectProviderResponse fromJson(
          Map<String, dynamic> json) =>
      CreateOpenIDConnectProviderResponse();
}

class CreatePolicyResponse {
  /// A structure containing details about the new policy.
  final Policy policy;

  CreatePolicyResponse({
    this.policy,
  });
  static CreatePolicyResponse fromJson(Map<String, dynamic> json) =>
      CreatePolicyResponse();
}

class CreatePolicyVersionResponse {
  /// A structure containing details about the new policy version.
  final PolicyVersion policyVersion;

  CreatePolicyVersionResponse({
    this.policyVersion,
  });
  static CreatePolicyVersionResponse fromJson(Map<String, dynamic> json) =>
      CreatePolicyVersionResponse();
}

class CreateRoleResponse {
  /// A structure containing details about the new role.
  final Role role;

  CreateRoleResponse({
    @required this.role,
  });
  static CreateRoleResponse fromJson(Map<String, dynamic> json) =>
      CreateRoleResponse();
}

class CreateSamlProviderResponse {
  /// The Amazon Resource Name (ARN) of the new SAML provider resource in IAM.
  final String samlProviderArn;

  CreateSamlProviderResponse({
    this.samlProviderArn,
  });
  static CreateSamlProviderResponse fromJson(Map<String, dynamic> json) =>
      CreateSamlProviderResponse();
}

class CreateServiceLinkedRoleResponse {
  /// A Role object that contains details about the newly created role.
  final Role role;

  CreateServiceLinkedRoleResponse({
    this.role,
  });
  static CreateServiceLinkedRoleResponse fromJson(Map<String, dynamic> json) =>
      CreateServiceLinkedRoleResponse();
}

class CreateServiceSpecificCredentialResponse {
  /// A structure that contains information about the newly created
  /// service-specific credential.
  ///
  ///
  ///
  /// This is the only time that the password for this credential set is
  /// available. It cannot be recovered later. Instead, you must reset the
  /// password with ResetServiceSpecificCredential.
  final ServiceSpecificCredential serviceSpecificCredential;

  CreateServiceSpecificCredentialResponse({
    this.serviceSpecificCredential,
  });
  static CreateServiceSpecificCredentialResponse fromJson(
          Map<String, dynamic> json) =>
      CreateServiceSpecificCredentialResponse();
}

class CreateUserResponse {
  /// A structure with details about the new IAM user.
  final User user;

  CreateUserResponse({
    this.user,
  });
  static CreateUserResponse fromJson(Map<String, dynamic> json) =>
      CreateUserResponse();
}

class CreateVirtualMfaDeviceResponse {
  /// A structure containing details about the new virtual MFA device.
  final VirtualMfaDevice virtualMfaDevice;

  CreateVirtualMfaDeviceResponse({
    @required this.virtualMfaDevice,
  });
  static CreateVirtualMfaDeviceResponse fromJson(Map<String, dynamic> json) =>
      CreateVirtualMfaDeviceResponse();
}

class DeleteServiceLinkedRoleResponse {
  /// The deletion task identifier that you can use to check the status of the
  /// deletion. This identifier is returned in the format
  /// `task/aws-service-role/<service-principal-name>/<role-name>/<task-uuid>`.
  final String deletionTaskId;

  DeleteServiceLinkedRoleResponse({
    @required this.deletionTaskId,
  });
  static DeleteServiceLinkedRoleResponse fromJson(Map<String, dynamic> json) =>
      DeleteServiceLinkedRoleResponse();
}

class DeletionTaskFailureReasonType {
  /// A short description of the reason that the service-linked role deletion
  /// failed.
  final String reason;

  /// A list of objects that contains details about the service-linked role
  /// deletion failure, if that information is returned by the service. If the
  /// service-linked role has active sessions or if any resources that were used
  /// by the role have not been deleted from the linked service, the role can't
  /// be deleted. This parameter includes a list of the resources that are
  /// associated with the role and the Region in which the resources are being
  /// used.
  final List<RoleUsageType> roleUsageList;

  DeletionTaskFailureReasonType({
    this.reason,
    this.roleUsageList,
  });
  static DeletionTaskFailureReasonType fromJson(Map<String, dynamic> json) =>
      DeletionTaskFailureReasonType();
}

class EntityDetails {
  /// The `EntityInfo` object that contains details about the entity (user or
  /// role).
  final EntityInfo entityInfo;

  /// The date and time, in [ISO 8601 date-time
  /// format](http://www.iso.org/iso/iso8601), when the authenticated entity
  /// last attempted to access AWS. AWS does not report unauthenticated
  /// requests.
  ///
  /// This field is null if no IAM entities attempted to access the service
  /// within the [reporting
  /// period](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#service-last-accessed-reporting-period).
  final DateTime lastAuthenticated;

  EntityDetails({
    @required this.entityInfo,
    this.lastAuthenticated,
  });
  static EntityDetails fromJson(Map<String, dynamic> json) => EntityDetails();
}

class EntityInfo {
  final String arn;

  /// The name of the entity (user or role).
  final String name;

  /// The type of entity (user or role).
  final String type;

  /// The identifier of the entity (user or role).
  final String id;

  /// The path to the entity (user or role). For more information about paths,
  /// see [IAM
  /// Identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html)
  /// in the _Using IAM_ guide.
  final String path;

  EntityInfo({
    @required this.arn,
    @required this.name,
    @required this.type,
    @required this.id,
    this.path,
  });
  static EntityInfo fromJson(Map<String, dynamic> json) => EntityInfo();
}

class ErrorDetails {
  /// Detailed information about the reason that the operation failed.
  final String message;

  /// The error code associated with the operation failure.
  final String code;

  ErrorDetails({
    @required this.message,
    @required this.code,
  });
  static ErrorDetails fromJson(Map<String, dynamic> json) => ErrorDetails();
}

class EvaluationResult {
  /// The name of the API operation tested on the indicated resource.
  final String evalActionName;

  /// The ARN of the resource that the indicated API operation was tested on.
  final String evalResourceName;

  /// The result of the simulation.
  final String evalDecision;

  /// A list of the statements in the input policies that determine the result
  /// for this scenario. Remember that even if multiple statements allow the
  /// operation on the resource, if only one statement denies that operation,
  /// then the explicit deny overrides any allow. In addition, the deny
  /// statement is the only entry included in the result.
  final List<Statement> matchedStatements;

  /// A list of context keys that are required by the included input policies
  /// but that were not provided by one of the input parameters. This list is
  /// used when the resource in a simulation is "*", either explicitly, or when
  /// the `ResourceArns` parameter blank. If you include a list of resources,
  /// then any missing context values are instead included under the
  /// `ResourceSpecificResults` section. To discover the context keys used by a
  /// set of policies, you can call GetContextKeysForCustomPolicy or
  /// GetContextKeysForPrincipalPolicy.
  final List<String> missingContextValues;

  /// A structure that details how Organizations and its service control
  /// policies affect the results of the simulation. Only applies if the
  /// simulated user's account is part of an organization.
  final OrganizationsDecisionDetail organizationsDecisionDetail;

  /// Additional details about the results of the evaluation decision. When
  /// there are both IAM policies and resource policies, this parameter explains
  /// how each set of policies contributes to the final evaluation decision.
  /// When simulating cross-account access to a resource, both the
  /// resource-based policy and the caller's IAM policy must grant access. See
  /// [How IAM Roles Differ from Resource-based
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_compare-resource-policies.html)
  final Map<String, String> evalDecisionDetails;

  /// The individual results of the simulation of the API operation specified in
  /// EvalActionName on each resource.
  final List<ResourceSpecificResult> resourceSpecificResults;

  EvaluationResult({
    @required this.evalActionName,
    this.evalResourceName,
    @required this.evalDecision,
    this.matchedStatements,
    this.missingContextValues,
    this.organizationsDecisionDetail,
    this.evalDecisionDetails,
    this.resourceSpecificResults,
  });
  static EvaluationResult fromJson(Map<String, dynamic> json) =>
      EvaluationResult();
}

class GenerateCredentialReportResponse {
  /// Information about the state of the credential report.
  final String state;

  /// Information about the credential report.
  final String description;

  GenerateCredentialReportResponse({
    this.state,
    this.description,
  });
  static GenerateCredentialReportResponse fromJson(Map<String, dynamic> json) =>
      GenerateCredentialReportResponse();
}

class GenerateOrganizationsAccessReportResponse {
  /// The job identifier that you can use in the GetOrganizationsAccessReport
  /// operation.
  final String jobId;

  GenerateOrganizationsAccessReportResponse({
    this.jobId,
  });
  static GenerateOrganizationsAccessReportResponse fromJson(
          Map<String, dynamic> json) =>
      GenerateOrganizationsAccessReportResponse();
}

class GenerateServiceLastAccessedDetailsResponse {
  /// The job ID that you can use in the GetServiceLastAccessedDetails or
  /// GetServiceLastAccessedDetailsWithEntities operations.
  final String jobId;

  GenerateServiceLastAccessedDetailsResponse({
    this.jobId,
  });
  static GenerateServiceLastAccessedDetailsResponse fromJson(
          Map<String, dynamic> json) =>
      GenerateServiceLastAccessedDetailsResponse();
}

class GetAccessKeyLastUsedResponse {
  /// The name of the AWS IAM user that owns this access key.
  final String userName;

  /// Contains information about the last time the access key was used.
  final AccessKeyLastUsed accessKeyLastUsed;

  GetAccessKeyLastUsedResponse({
    this.userName,
    this.accessKeyLastUsed,
  });
  static GetAccessKeyLastUsedResponse fromJson(Map<String, dynamic> json) =>
      GetAccessKeyLastUsedResponse();
}

class GetAccountAuthorizationDetailsResponse {
  /// A list containing information about IAM users.
  final List<UserDetail> userDetailList;

  /// A list containing information about IAM groups.
  final List<GroupDetail> groupDetailList;

  /// A list containing information about IAM roles.
  final List<RoleDetail> roleDetailList;

  /// A list containing information about managed policies.
  final List<ManagedPolicyDetail> policies;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the `Marker` request parameter to retrieve more items. Note that IAM might
  /// return fewer than the `MaxItems` number of results even when there are
  /// more results available. We recommend that you check `IsTruncated` after
  /// every call to ensure that you receive all your results.
  final bool isTruncated;

  /// When `IsTruncated` is `true`, this element is present and contains the
  /// value to use for the `Marker` parameter in a subsequent pagination
  /// request.
  final String marker;

  GetAccountAuthorizationDetailsResponse({
    this.userDetailList,
    this.groupDetailList,
    this.roleDetailList,
    this.policies,
    this.isTruncated,
    this.marker,
  });
  static GetAccountAuthorizationDetailsResponse fromJson(
          Map<String, dynamic> json) =>
      GetAccountAuthorizationDetailsResponse();
}

class GetAccountPasswordPolicyResponse {
  /// A structure that contains details about the account's password policy.
  final PasswordPolicy passwordPolicy;

  GetAccountPasswordPolicyResponse({
    @required this.passwordPolicy,
  });
  static GetAccountPasswordPolicyResponse fromJson(Map<String, dynamic> json) =>
      GetAccountPasswordPolicyResponse();
}

class GetAccountSummaryResponse {
  /// A set of key–value pairs containing information about IAM entity usage and
  /// IAM quotas.
  final Map<String, int> summaryMap;

  GetAccountSummaryResponse({
    this.summaryMap,
  });
  static GetAccountSummaryResponse fromJson(Map<String, dynamic> json) =>
      GetAccountSummaryResponse();
}

class GetContextKeysForPolicyResponse {
  /// The list of context keys that are referenced in the input policies.
  final List<String> contextKeyNames;

  GetContextKeysForPolicyResponse({
    this.contextKeyNames,
  });
  static GetContextKeysForPolicyResponse fromJson(Map<String, dynamic> json) =>
      GetContextKeysForPolicyResponse();
}

class GetCredentialReportResponse {
  /// Contains the credential report. The report is Base64-encoded.
  final Uint8List content;

  /// The format (MIME type) of the credential report.
  final String reportFormat;

  ///  The date and time when the credential report was created, in [ISO 8601
  /// date-time format](http://www.iso.org/iso/iso8601).
  final DateTime generatedTime;

  GetCredentialReportResponse({
    this.content,
    this.reportFormat,
    this.generatedTime,
  });
  static GetCredentialReportResponse fromJson(Map<String, dynamic> json) =>
      GetCredentialReportResponse();
}

class GetGroupPolicyResponse {
  /// The group the policy is associated with.
  final String groupName;

  /// The name of the policy.
  final String policyName;

  /// The policy document.
  ///
  /// IAM stores policies in JSON format. However, resources that were created
  /// using AWS CloudFormation templates can be formatted in YAML. AWS
  /// CloudFormation always converts a YAML policy to JSON format before
  /// submitting it to IAM.
  final String policyDocument;

  GetGroupPolicyResponse({
    @required this.groupName,
    @required this.policyName,
    @required this.policyDocument,
  });
  static GetGroupPolicyResponse fromJson(Map<String, dynamic> json) =>
      GetGroupPolicyResponse();
}

class GetGroupResponse {
  /// A structure that contains details about the group.
  final Group group;

  /// A list of users in the group.
  final List<User> users;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the `Marker` request parameter to retrieve more items. Note that IAM might
  /// return fewer than the `MaxItems` number of results even when there are
  /// more results available. We recommend that you check `IsTruncated` after
  /// every call to ensure that you receive all your results.
  final bool isTruncated;

  /// When `IsTruncated` is `true`, this element is present and contains the
  /// value to use for the `Marker` parameter in a subsequent pagination
  /// request.
  final String marker;

  GetGroupResponse({
    @required this.group,
    @required this.users,
    this.isTruncated,
    this.marker,
  });
  static GetGroupResponse fromJson(Map<String, dynamic> json) =>
      GetGroupResponse();
}

class GetInstanceProfileResponse {
  /// A structure containing details about the instance profile.
  final InstanceProfile instanceProfile;

  GetInstanceProfileResponse({
    @required this.instanceProfile,
  });
  static GetInstanceProfileResponse fromJson(Map<String, dynamic> json) =>
      GetInstanceProfileResponse();
}

class GetLoginProfileResponse {
  /// A structure containing the user name and password create date for the
  /// user.
  final LoginProfile loginProfile;

  GetLoginProfileResponse({
    @required this.loginProfile,
  });
  static GetLoginProfileResponse fromJson(Map<String, dynamic> json) =>
      GetLoginProfileResponse();
}

class GetOpenIDConnectProviderResponse {
  /// The URL that the IAM OIDC provider resource object is associated with. For
  /// more information, see CreateOpenIDConnectProvider.
  final String url;

  /// A list of client IDs (also known as audiences) that are associated with
  /// the specified IAM OIDC provider resource object. For more information, see
  /// CreateOpenIDConnectProvider.
  final List<String> clientIDList;

  /// A list of certificate thumbprints that are associated with the specified
  /// IAM OIDC provider resource object. For more information, see
  /// CreateOpenIDConnectProvider.
  final List<String> thumbprintList;

  /// The date and time when the IAM OIDC provider resource object was created
  /// in the AWS account.
  final DateTime createDate;

  GetOpenIDConnectProviderResponse({
    this.url,
    this.clientIDList,
    this.thumbprintList,
    this.createDate,
  });
  static GetOpenIDConnectProviderResponse fromJson(Map<String, dynamic> json) =>
      GetOpenIDConnectProviderResponse();
}

class GetOrganizationsAccessReportResponse {
  /// The status of the job.
  final String jobStatus;

  /// The date and time, in [ISO 8601 date-time
  /// format](http://www.iso.org/iso/iso8601), when the report job was created.
  final DateTime jobCreationDate;

  /// The date and time, in [ISO 8601 date-time
  /// format](http://www.iso.org/iso/iso8601), when the generated report job was
  /// completed or failed.
  ///
  /// This field is null if the job is still in progress, as indicated by a job
  /// status value of `IN_PROGRESS`.
  final DateTime jobCompletionDate;

  /// The number of services that the applicable SCPs allow account principals
  /// to access.
  final int numberOfServicesAccessible;

  /// The number of services that account principals are allowed but did not
  /// attempt to access.
  final int numberOfServicesNotAccessed;

  /// An object that contains details about the most recent attempt to access
  /// the service.
  final List<AccessDetail> accessDetails;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the `Marker` request parameter to retrieve more items. Note that IAM might
  /// return fewer than the `MaxItems` number of results even when there are
  /// more results available. We recommend that you check `IsTruncated` after
  /// every call to ensure that you receive all your results.
  final bool isTruncated;

  /// When `IsTruncated` is `true`, this element is present and contains the
  /// value to use for the `Marker` parameter in a subsequent pagination
  /// request.
  final String marker;

  final ErrorDetails errorDetails;

  GetOrganizationsAccessReportResponse({
    @required this.jobStatus,
    @required this.jobCreationDate,
    this.jobCompletionDate,
    this.numberOfServicesAccessible,
    this.numberOfServicesNotAccessed,
    this.accessDetails,
    this.isTruncated,
    this.marker,
    this.errorDetails,
  });
  static GetOrganizationsAccessReportResponse fromJson(
          Map<String, dynamic> json) =>
      GetOrganizationsAccessReportResponse();
}

class GetPolicyResponse {
  /// A structure containing details about the policy.
  final Policy policy;

  GetPolicyResponse({
    this.policy,
  });
  static GetPolicyResponse fromJson(Map<String, dynamic> json) =>
      GetPolicyResponse();
}

class GetPolicyVersionResponse {
  /// A structure containing details about the policy version.
  final PolicyVersion policyVersion;

  GetPolicyVersionResponse({
    this.policyVersion,
  });
  static GetPolicyVersionResponse fromJson(Map<String, dynamic> json) =>
      GetPolicyVersionResponse();
}

class GetRolePolicyResponse {
  /// The role the policy is associated with.
  final String roleName;

  /// The name of the policy.
  final String policyName;

  /// The policy document.
  ///
  /// IAM stores policies in JSON format. However, resources that were created
  /// using AWS CloudFormation templates can be formatted in YAML. AWS
  /// CloudFormation always converts a YAML policy to JSON format before
  /// submitting it to IAM.
  final String policyDocument;

  GetRolePolicyResponse({
    @required this.roleName,
    @required this.policyName,
    @required this.policyDocument,
  });
  static GetRolePolicyResponse fromJson(Map<String, dynamic> json) =>
      GetRolePolicyResponse();
}

class GetRoleResponse {
  /// A structure containing details about the IAM role.
  final Role role;

  GetRoleResponse({
    @required this.role,
  });
  static GetRoleResponse fromJson(Map<String, dynamic> json) =>
      GetRoleResponse();
}

class GetSamlProviderResponse {
  /// The XML metadata document that includes information about an identity
  /// provider.
  final String samlMetadataDocument;

  /// The date and time when the SAML provider was created.
  final DateTime createDate;

  /// The expiration date and time for the SAML provider.
  final DateTime validUntil;

  GetSamlProviderResponse({
    this.samlMetadataDocument,
    this.createDate,
    this.validUntil,
  });
  static GetSamlProviderResponse fromJson(Map<String, dynamic> json) =>
      GetSamlProviderResponse();
}

class GetSshPublicKeyResponse {
  /// A structure containing details about the SSH public key.
  final SshPublicKey sshPublicKey;

  GetSshPublicKeyResponse({
    this.sshPublicKey,
  });
  static GetSshPublicKeyResponse fromJson(Map<String, dynamic> json) =>
      GetSshPublicKeyResponse();
}

class GetServerCertificateResponse {
  /// A structure containing details about the server certificate.
  final ServerCertificate serverCertificate;

  GetServerCertificateResponse({
    @required this.serverCertificate,
  });
  static GetServerCertificateResponse fromJson(Map<String, dynamic> json) =>
      GetServerCertificateResponse();
}

class GetServiceLastAccessedDetailsResponse {
  /// The status of the job.
  final String jobStatus;

  /// The date and time, in [ISO 8601 date-time
  /// format](http://www.iso.org/iso/iso8601), when the report job was created.
  final DateTime jobCreationDate;

  ///  A `ServiceLastAccessed` object that contains details about the most
  /// recent attempt to access the service.
  final List<ServiceLastAccessed> servicesLastAccessed;

  /// The date and time, in [ISO 8601 date-time
  /// format](http://www.iso.org/iso/iso8601), when the generated report job was
  /// completed or failed.
  ///
  /// This field is null if the job is still in progress, as indicated by a job
  /// status value of `IN_PROGRESS`.
  final DateTime jobCompletionDate;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the `Marker` request parameter to retrieve more items. Note that IAM might
  /// return fewer than the `MaxItems` number of results even when there are
  /// more results available. We recommend that you check `IsTruncated` after
  /// every call to ensure that you receive all your results.
  final bool isTruncated;

  /// When `IsTruncated` is `true`, this element is present and contains the
  /// value to use for the `Marker` parameter in a subsequent pagination
  /// request.
  final String marker;

  /// An object that contains details about the reason the operation failed.
  final ErrorDetails error;

  GetServiceLastAccessedDetailsResponse({
    @required this.jobStatus,
    @required this.jobCreationDate,
    @required this.servicesLastAccessed,
    @required this.jobCompletionDate,
    this.isTruncated,
    this.marker,
    this.error,
  });
  static GetServiceLastAccessedDetailsResponse fromJson(
          Map<String, dynamic> json) =>
      GetServiceLastAccessedDetailsResponse();
}

class GetServiceLastAccessedDetailsWithEntitiesResponse {
  /// The status of the job.
  final String jobStatus;

  /// The date and time, in [ISO 8601 date-time
  /// format](http://www.iso.org/iso/iso8601), when the report job was created.
  final DateTime jobCreationDate;

  /// The date and time, in [ISO 8601 date-time
  /// format](http://www.iso.org/iso/iso8601), when the generated report job was
  /// completed or failed.
  ///
  /// This field is null if the job is still in progress, as indicated by a job
  /// status value of `IN_PROGRESS`.
  final DateTime jobCompletionDate;

  /// An `EntityDetailsList` object that contains details about when an IAM
  /// entity (user or role) used group or policy permissions in an attempt to
  /// access the specified AWS service.
  final List<EntityDetails> entityDetailsList;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the `Marker` request parameter to retrieve more items. Note that IAM might
  /// return fewer than the `MaxItems` number of results even when there are
  /// more results available. We recommend that you check `IsTruncated` after
  /// every call to ensure that you receive all your results.
  final bool isTruncated;

  /// When `IsTruncated` is `true`, this element is present and contains the
  /// value to use for the `Marker` parameter in a subsequent pagination
  /// request.
  final String marker;

  /// An object that contains details about the reason the operation failed.
  final ErrorDetails error;

  GetServiceLastAccessedDetailsWithEntitiesResponse({
    @required this.jobStatus,
    @required this.jobCreationDate,
    @required this.jobCompletionDate,
    @required this.entityDetailsList,
    this.isTruncated,
    this.marker,
    this.error,
  });
  static GetServiceLastAccessedDetailsWithEntitiesResponse fromJson(
          Map<String, dynamic> json) =>
      GetServiceLastAccessedDetailsWithEntitiesResponse();
}

class GetServiceLinkedRoleDeletionStatusResponse {
  /// The status of the deletion.
  final String status;

  /// An object that contains details about the reason the deletion failed.
  final DeletionTaskFailureReasonType reason;

  GetServiceLinkedRoleDeletionStatusResponse({
    @required this.status,
    this.reason,
  });
  static GetServiceLinkedRoleDeletionStatusResponse fromJson(
          Map<String, dynamic> json) =>
      GetServiceLinkedRoleDeletionStatusResponse();
}

class GetUserPolicyResponse {
  /// The user the policy is associated with.
  final String userName;

  /// The name of the policy.
  final String policyName;

  /// The policy document.
  ///
  /// IAM stores policies in JSON format. However, resources that were created
  /// using AWS CloudFormation templates can be formatted in YAML. AWS
  /// CloudFormation always converts a YAML policy to JSON format before
  /// submitting it to IAM.
  final String policyDocument;

  GetUserPolicyResponse({
    @required this.userName,
    @required this.policyName,
    @required this.policyDocument,
  });
  static GetUserPolicyResponse fromJson(Map<String, dynamic> json) =>
      GetUserPolicyResponse();
}

class GetUserResponse {
  /// A structure containing details about the IAM user.
  ///
  ///
  ///
  /// Due to a service issue, password last used data does not include password
  /// use from May 3, 2018 22:50 PDT to May 23, 2018 14:08 PDT. This affects
  /// [last
  /// sign-in](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_finding-unused.html)
  /// dates shown in the IAM console and password last used dates in the [IAM
  /// credential
  /// report](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_getting-report.html),
  /// and returned by this GetUser API. If users signed in during the affected
  /// time, the password last used date that is returned is the date the user
  /// last signed in before May 3, 2018. For users that signed in after May 23,
  /// 2018 14:08 PDT, the returned password last used date is accurate.
  ///
  /// You can use password last used information to identify unused credentials
  /// for deletion. For example, you might delete users who did not sign in to
  /// AWS in the last 90 days. In cases like this, we recommend that you adjust
  /// your evaluation window to include dates after May 23, 2018. Alternatively,
  /// if your users use access keys to access AWS programmatically you can refer
  /// to access key last used information because it is accurate for all dates.
  final User user;

  GetUserResponse({
    @required this.user,
  });
  static GetUserResponse fromJson(Map<String, dynamic> json) =>
      GetUserResponse();
}

class Group {
  /// The path to the group. For more information about paths, see [IAM
  /// Identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html)
  /// in the _Using IAM_ guide.
  final String path;

  /// The friendly name that identifies the group.
  final String groupName;

  ///  The stable and unique string identifying the group. For more information
  /// about IDs, see [IAM
  /// Identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html)
  /// in the _Using IAM_ guide.
  final String groupId;

  ///  The Amazon Resource Name (ARN) specifying the group. For more information
  /// about ARNs and how to use them in policies, see [IAM
  /// Identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html)
  /// in the _Using IAM_ guide.
  final String arn;

  /// The date and time, in [ISO 8601 date-time
  /// format](http://www.iso.org/iso/iso8601), when the group was created.
  final DateTime createDate;

  Group({
    @required this.path,
    @required this.groupName,
    @required this.groupId,
    @required this.arn,
    @required this.createDate,
  });
  static Group fromJson(Map<String, dynamic> json) => Group();
}

class GroupDetail {
  /// The path to the group. For more information about paths, see [IAM
  /// Identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html)
  /// in the _Using IAM_ guide.
  final String path;

  /// The friendly name that identifies the group.
  final String groupName;

  /// The stable and unique string identifying the group. For more information
  /// about IDs, see [IAM
  /// Identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html)
  /// in the _Using IAM_ guide.
  final String groupId;

  final String arn;

  /// The date and time, in [ISO 8601 date-time
  /// format](http://www.iso.org/iso/iso8601), when the group was created.
  final DateTime createDate;

  /// A list of the inline policies embedded in the group.
  final List<PolicyDetail> groupPolicyList;

  /// A list of the managed policies attached to the group.
  final List<AttachedPolicy> attachedManagedPolicies;

  GroupDetail({
    this.path,
    this.groupName,
    this.groupId,
    this.arn,
    this.createDate,
    this.groupPolicyList,
    this.attachedManagedPolicies,
  });
  static GroupDetail fromJson(Map<String, dynamic> json) => GroupDetail();
}

class InstanceProfile {
  ///  The path to the instance profile. For more information about paths, see
  /// [IAM
  /// Identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html)
  /// in the _Using IAM_ guide.
  final String path;

  /// The name identifying the instance profile.
  final String instanceProfileName;

  ///  The stable and unique string identifying the instance profile. For more
  /// information about IDs, see [IAM
  /// Identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html)
  /// in the _Using IAM_ guide.
  final String instanceProfileId;

  ///  The Amazon Resource Name (ARN) specifying the instance profile. For more
  /// information about ARNs and how to use them in policies, see [IAM
  /// Identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html)
  /// in the _Using IAM_ guide.
  final String arn;

  /// The date when the instance profile was created.
  final DateTime createDate;

  /// The role associated with the instance profile.
  final List<Role> roles;

  InstanceProfile({
    @required this.path,
    @required this.instanceProfileName,
    @required this.instanceProfileId,
    @required this.arn,
    @required this.createDate,
    @required this.roles,
  });
  static InstanceProfile fromJson(Map<String, dynamic> json) =>
      InstanceProfile();
}

class ListAccessKeysResponse {
  /// A list of objects containing metadata about the access keys.
  final List<AccessKeyMetadata> accessKeyMetadata;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the `Marker` request parameter to retrieve more items. Note that IAM might
  /// return fewer than the `MaxItems` number of results even when there are
  /// more results available. We recommend that you check `IsTruncated` after
  /// every call to ensure that you receive all your results.
  final bool isTruncated;

  /// When `IsTruncated` is `true`, this element is present and contains the
  /// value to use for the `Marker` parameter in a subsequent pagination
  /// request.
  final String marker;

  ListAccessKeysResponse({
    @required this.accessKeyMetadata,
    this.isTruncated,
    this.marker,
  });
  static ListAccessKeysResponse fromJson(Map<String, dynamic> json) =>
      ListAccessKeysResponse();
}

class ListAccountAliasesResponse {
  /// A list of aliases associated with the account. AWS supports only one alias
  /// per account.
  final List<String> accountAliases;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the `Marker` request parameter to retrieve more items. Note that IAM might
  /// return fewer than the `MaxItems` number of results even when there are
  /// more results available. We recommend that you check `IsTruncated` after
  /// every call to ensure that you receive all your results.
  final bool isTruncated;

  /// When `IsTruncated` is `true`, this element is present and contains the
  /// value to use for the `Marker` parameter in a subsequent pagination
  /// request.
  final String marker;

  ListAccountAliasesResponse({
    @required this.accountAliases,
    this.isTruncated,
    this.marker,
  });
  static ListAccountAliasesResponse fromJson(Map<String, dynamic> json) =>
      ListAccountAliasesResponse();
}

class ListAttachedGroupPoliciesResponse {
  /// A list of the attached policies.
  final List<AttachedPolicy> attachedPolicies;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the `Marker` request parameter to retrieve more items. Note that IAM might
  /// return fewer than the `MaxItems` number of results even when there are
  /// more results available. We recommend that you check `IsTruncated` after
  /// every call to ensure that you receive all your results.
  final bool isTruncated;

  /// When `IsTruncated` is `true`, this element is present and contains the
  /// value to use for the `Marker` parameter in a subsequent pagination
  /// request.
  final String marker;

  ListAttachedGroupPoliciesResponse({
    this.attachedPolicies,
    this.isTruncated,
    this.marker,
  });
  static ListAttachedGroupPoliciesResponse fromJson(
          Map<String, dynamic> json) =>
      ListAttachedGroupPoliciesResponse();
}

class ListAttachedRolePoliciesResponse {
  /// A list of the attached policies.
  final List<AttachedPolicy> attachedPolicies;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the `Marker` request parameter to retrieve more items. Note that IAM might
  /// return fewer than the `MaxItems` number of results even when there are
  /// more results available. We recommend that you check `IsTruncated` after
  /// every call to ensure that you receive all your results.
  final bool isTruncated;

  /// When `IsTruncated` is `true`, this element is present and contains the
  /// value to use for the `Marker` parameter in a subsequent pagination
  /// request.
  final String marker;

  ListAttachedRolePoliciesResponse({
    this.attachedPolicies,
    this.isTruncated,
    this.marker,
  });
  static ListAttachedRolePoliciesResponse fromJson(Map<String, dynamic> json) =>
      ListAttachedRolePoliciesResponse();
}

class ListAttachedUserPoliciesResponse {
  /// A list of the attached policies.
  final List<AttachedPolicy> attachedPolicies;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the `Marker` request parameter to retrieve more items. Note that IAM might
  /// return fewer than the `MaxItems` number of results even when there are
  /// more results available. We recommend that you check `IsTruncated` after
  /// every call to ensure that you receive all your results.
  final bool isTruncated;

  /// When `IsTruncated` is `true`, this element is present and contains the
  /// value to use for the `Marker` parameter in a subsequent pagination
  /// request.
  final String marker;

  ListAttachedUserPoliciesResponse({
    this.attachedPolicies,
    this.isTruncated,
    this.marker,
  });
  static ListAttachedUserPoliciesResponse fromJson(Map<String, dynamic> json) =>
      ListAttachedUserPoliciesResponse();
}

class ListEntitiesForPolicyResponse {
  /// A list of IAM groups that the policy is attached to.
  final List<PolicyGroup> policyGroups;

  /// A list of IAM users that the policy is attached to.
  final List<PolicyUser> policyUsers;

  /// A list of IAM roles that the policy is attached to.
  final List<PolicyRole> policyRoles;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the `Marker` request parameter to retrieve more items. Note that IAM might
  /// return fewer than the `MaxItems` number of results even when there are
  /// more results available. We recommend that you check `IsTruncated` after
  /// every call to ensure that you receive all your results.
  final bool isTruncated;

  /// When `IsTruncated` is `true`, this element is present and contains the
  /// value to use for the `Marker` parameter in a subsequent pagination
  /// request.
  final String marker;

  ListEntitiesForPolicyResponse({
    this.policyGroups,
    this.policyUsers,
    this.policyRoles,
    this.isTruncated,
    this.marker,
  });
  static ListEntitiesForPolicyResponse fromJson(Map<String, dynamic> json) =>
      ListEntitiesForPolicyResponse();
}

class ListGroupPoliciesResponse {
  /// A list of policy names.
  ///
  /// This parameter allows (through its [regex
  /// pattern](http://wikipedia.org/wiki/regex)) a string of characters
  /// consisting of upper and lowercase alphanumeric characters with no spaces.
  /// You can also include any of the following characters: _+=,.@-
  final List<String> policyNames;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the `Marker` request parameter to retrieve more items. Note that IAM might
  /// return fewer than the `MaxItems` number of results even when there are
  /// more results available. We recommend that you check `IsTruncated` after
  /// every call to ensure that you receive all your results.
  final bool isTruncated;

  /// When `IsTruncated` is `true`, this element is present and contains the
  /// value to use for the `Marker` parameter in a subsequent pagination
  /// request.
  final String marker;

  ListGroupPoliciesResponse({
    @required this.policyNames,
    this.isTruncated,
    this.marker,
  });
  static ListGroupPoliciesResponse fromJson(Map<String, dynamic> json) =>
      ListGroupPoliciesResponse();
}

class ListGroupsForUserResponse {
  /// A list of groups.
  final List<Group> groups;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the `Marker` request parameter to retrieve more items. Note that IAM might
  /// return fewer than the `MaxItems` number of results even when there are
  /// more results available. We recommend that you check `IsTruncated` after
  /// every call to ensure that you receive all your results.
  final bool isTruncated;

  /// When `IsTruncated` is `true`, this element is present and contains the
  /// value to use for the `Marker` parameter in a subsequent pagination
  /// request.
  final String marker;

  ListGroupsForUserResponse({
    @required this.groups,
    this.isTruncated,
    this.marker,
  });
  static ListGroupsForUserResponse fromJson(Map<String, dynamic> json) =>
      ListGroupsForUserResponse();
}

class ListGroupsResponse {
  /// A list of groups.
  final List<Group> groups;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the `Marker` request parameter to retrieve more items. Note that IAM might
  /// return fewer than the `MaxItems` number of results even when there are
  /// more results available. We recommend that you check `IsTruncated` after
  /// every call to ensure that you receive all your results.
  final bool isTruncated;

  /// When `IsTruncated` is `true`, this element is present and contains the
  /// value to use for the `Marker` parameter in a subsequent pagination
  /// request.
  final String marker;

  ListGroupsResponse({
    @required this.groups,
    this.isTruncated,
    this.marker,
  });
  static ListGroupsResponse fromJson(Map<String, dynamic> json) =>
      ListGroupsResponse();
}

class ListInstanceProfilesForRoleResponse {
  /// A list of instance profiles.
  final List<InstanceProfile> instanceProfiles;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the `Marker` request parameter to retrieve more items. Note that IAM might
  /// return fewer than the `MaxItems` number of results even when there are
  /// more results available. We recommend that you check `IsTruncated` after
  /// every call to ensure that you receive all your results.
  final bool isTruncated;

  /// When `IsTruncated` is `true`, this element is present and contains the
  /// value to use for the `Marker` parameter in a subsequent pagination
  /// request.
  final String marker;

  ListInstanceProfilesForRoleResponse({
    @required this.instanceProfiles,
    this.isTruncated,
    this.marker,
  });
  static ListInstanceProfilesForRoleResponse fromJson(
          Map<String, dynamic> json) =>
      ListInstanceProfilesForRoleResponse();
}

class ListInstanceProfilesResponse {
  /// A list of instance profiles.
  final List<InstanceProfile> instanceProfiles;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the `Marker` request parameter to retrieve more items. Note that IAM might
  /// return fewer than the `MaxItems` number of results even when there are
  /// more results available. We recommend that you check `IsTruncated` after
  /// every call to ensure that you receive all your results.
  final bool isTruncated;

  /// When `IsTruncated` is `true`, this element is present and contains the
  /// value to use for the `Marker` parameter in a subsequent pagination
  /// request.
  final String marker;

  ListInstanceProfilesResponse({
    @required this.instanceProfiles,
    this.isTruncated,
    this.marker,
  });
  static ListInstanceProfilesResponse fromJson(Map<String, dynamic> json) =>
      ListInstanceProfilesResponse();
}

class ListMfaDevicesResponse {
  /// A list of MFA devices.
  final List<MfaDevice> mfaDevices;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the `Marker` request parameter to retrieve more items. Note that IAM might
  /// return fewer than the `MaxItems` number of results even when there are
  /// more results available. We recommend that you check `IsTruncated` after
  /// every call to ensure that you receive all your results.
  final bool isTruncated;

  /// When `IsTruncated` is `true`, this element is present and contains the
  /// value to use for the `Marker` parameter in a subsequent pagination
  /// request.
  final String marker;

  ListMfaDevicesResponse({
    @required this.mfaDevices,
    this.isTruncated,
    this.marker,
  });
  static ListMfaDevicesResponse fromJson(Map<String, dynamic> json) =>
      ListMfaDevicesResponse();
}

class ListOpenIDConnectProvidersResponse {
  /// The list of IAM OIDC provider resource objects defined in the AWS account.
  final List<OpenIDConnectProviderListEntry> openIDConnectProviderList;

  ListOpenIDConnectProvidersResponse({
    this.openIDConnectProviderList,
  });
  static ListOpenIDConnectProvidersResponse fromJson(
          Map<String, dynamic> json) =>
      ListOpenIDConnectProvidersResponse();
}

class ListPoliciesGrantingServiceAccessEntry {
  /// The namespace of the service that was accessed.
  ///
  /// To learn the service namespace of a service, go to [Actions, Resources,
  /// and Condition Keys for AWS
  /// Services](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_actions-resources-contextkeys.html)
  /// in the _IAM User Guide_. Choose the name of the service to view details
  /// for that service. In the first paragraph, find the service prefix. For
  /// example, `(service prefix: a4b)`. For more information about service
  /// namespaces, see [AWS Service
  /// Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#genref-aws-service-namespaces)
  /// in the _AWS General Reference_.
  final String serviceNamespace;

  /// The `PoliciesGrantingServiceAccess` object that contains details about the
  /// policy.
  final List<PolicyGrantingServiceAccess> policies;

  ListPoliciesGrantingServiceAccessEntry({
    this.serviceNamespace,
    this.policies,
  });
  static ListPoliciesGrantingServiceAccessEntry fromJson(
          Map<String, dynamic> json) =>
      ListPoliciesGrantingServiceAccessEntry();
}

class ListPoliciesGrantingServiceAccessResponse {
  /// A `ListPoliciesGrantingServiceAccess` object that contains details about
  /// the permissions policies attached to the specified identity (user, group,
  /// or role).
  final List<ListPoliciesGrantingServiceAccessEntry>
      policiesGrantingServiceAccess;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the `Marker` request parameter to retrieve more items. We recommend that
  /// you check `IsTruncated` after every call to ensure that you receive all
  /// your results.
  final bool isTruncated;

  /// When `IsTruncated` is `true`, this element is present and contains the
  /// value to use for the `Marker` parameter in a subsequent pagination
  /// request.
  final String marker;

  ListPoliciesGrantingServiceAccessResponse({
    @required this.policiesGrantingServiceAccess,
    this.isTruncated,
    this.marker,
  });
  static ListPoliciesGrantingServiceAccessResponse fromJson(
          Map<String, dynamic> json) =>
      ListPoliciesGrantingServiceAccessResponse();
}

class ListPoliciesResponse {
  /// A list of policies.
  final List<Policy> policies;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the `Marker` request parameter to retrieve more items. Note that IAM might
  /// return fewer than the `MaxItems` number of results even when there are
  /// more results available. We recommend that you check `IsTruncated` after
  /// every call to ensure that you receive all your results.
  final bool isTruncated;

  /// When `IsTruncated` is `true`, this element is present and contains the
  /// value to use for the `Marker` parameter in a subsequent pagination
  /// request.
  final String marker;

  ListPoliciesResponse({
    this.policies,
    this.isTruncated,
    this.marker,
  });
  static ListPoliciesResponse fromJson(Map<String, dynamic> json) =>
      ListPoliciesResponse();
}

class ListPolicyVersionsResponse {
  /// A list of policy versions.
  ///
  /// For more information about managed policy versions, see [Versioning for
  /// Managed
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-versions.html)
  /// in the _IAM User Guide_.
  final List<PolicyVersion> versions;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the `Marker` request parameter to retrieve more items. Note that IAM might
  /// return fewer than the `MaxItems` number of results even when there are
  /// more results available. We recommend that you check `IsTruncated` after
  /// every call to ensure that you receive all your results.
  final bool isTruncated;

  /// When `IsTruncated` is `true`, this element is present and contains the
  /// value to use for the `Marker` parameter in a subsequent pagination
  /// request.
  final String marker;

  ListPolicyVersionsResponse({
    this.versions,
    this.isTruncated,
    this.marker,
  });
  static ListPolicyVersionsResponse fromJson(Map<String, dynamic> json) =>
      ListPolicyVersionsResponse();
}

class ListRolePoliciesResponse {
  /// A list of policy names.
  final List<String> policyNames;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the `Marker` request parameter to retrieve more items. Note that IAM might
  /// return fewer than the `MaxItems` number of results even when there are
  /// more results available. We recommend that you check `IsTruncated` after
  /// every call to ensure that you receive all your results.
  final bool isTruncated;

  /// When `IsTruncated` is `true`, this element is present and contains the
  /// value to use for the `Marker` parameter in a subsequent pagination
  /// request.
  final String marker;

  ListRolePoliciesResponse({
    @required this.policyNames,
    this.isTruncated,
    this.marker,
  });
  static ListRolePoliciesResponse fromJson(Map<String, dynamic> json) =>
      ListRolePoliciesResponse();
}

class ListRoleTagsResponse {
  /// The list of tags currently that is attached to the role. Each tag consists
  /// of a key name and an associated value. If no tags are attached to the
  /// specified role, the response contains an empty list.
  final List<Tag> tags;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can use the `Marker` request parameter to make
  /// a subsequent pagination request that retrieves more items. Note that IAM
  /// might return fewer than the `MaxItems` number of results even when more
  /// results are available. Check `IsTruncated` after every call to ensure that
  /// you receive all of your results.
  final bool isTruncated;

  /// When `IsTruncated` is `true`, this element is present and contains the
  /// value to use for the `Marker` parameter in a subsequent pagination
  /// request.
  final String marker;

  ListRoleTagsResponse({
    @required this.tags,
    this.isTruncated,
    this.marker,
  });
  static ListRoleTagsResponse fromJson(Map<String, dynamic> json) =>
      ListRoleTagsResponse();
}

class ListRolesResponse {
  /// A list of roles.
  final List<Role> roles;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the `Marker` request parameter to retrieve more items. Note that IAM might
  /// return fewer than the `MaxItems` number of results even when there are
  /// more results available. We recommend that you check `IsTruncated` after
  /// every call to ensure that you receive all your results.
  final bool isTruncated;

  /// When `IsTruncated` is `true`, this element is present and contains the
  /// value to use for the `Marker` parameter in a subsequent pagination
  /// request.
  final String marker;

  ListRolesResponse({
    @required this.roles,
    this.isTruncated,
    this.marker,
  });
  static ListRolesResponse fromJson(Map<String, dynamic> json) =>
      ListRolesResponse();
}

class ListSamlProvidersResponse {
  /// The list of SAML provider resource objects defined in IAM for this AWS
  /// account.
  final List<SamlProviderListEntry> samlProviderList;

  ListSamlProvidersResponse({
    this.samlProviderList,
  });
  static ListSamlProvidersResponse fromJson(Map<String, dynamic> json) =>
      ListSamlProvidersResponse();
}

class ListSshPublicKeysResponse {
  /// A list of the SSH public keys assigned to IAM user.
  final List<SshPublicKeyMetadata> sshPublicKeys;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the `Marker` request parameter to retrieve more items. Note that IAM might
  /// return fewer than the `MaxItems` number of results even when there are
  /// more results available. We recommend that you check `IsTruncated` after
  /// every call to ensure that you receive all your results.
  final bool isTruncated;

  /// When `IsTruncated` is `true`, this element is present and contains the
  /// value to use for the `Marker` parameter in a subsequent pagination
  /// request.
  final String marker;

  ListSshPublicKeysResponse({
    this.sshPublicKeys,
    this.isTruncated,
    this.marker,
  });
  static ListSshPublicKeysResponse fromJson(Map<String, dynamic> json) =>
      ListSshPublicKeysResponse();
}

class ListServerCertificatesResponse {
  /// A list of server certificates.
  final List<ServerCertificateMetadata> serverCertificateMetadataList;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the `Marker` request parameter to retrieve more items. Note that IAM might
  /// return fewer than the `MaxItems` number of results even when there are
  /// more results available. We recommend that you check `IsTruncated` after
  /// every call to ensure that you receive all your results.
  final bool isTruncated;

  /// When `IsTruncated` is `true`, this element is present and contains the
  /// value to use for the `Marker` parameter in a subsequent pagination
  /// request.
  final String marker;

  ListServerCertificatesResponse({
    @required this.serverCertificateMetadataList,
    this.isTruncated,
    this.marker,
  });
  static ListServerCertificatesResponse fromJson(Map<String, dynamic> json) =>
      ListServerCertificatesResponse();
}

class ListServiceSpecificCredentialsResponse {
  /// A list of structures that each contain details about a service-specific
  /// credential.
  final List<ServiceSpecificCredentialMetadata> serviceSpecificCredentials;

  ListServiceSpecificCredentialsResponse({
    this.serviceSpecificCredentials,
  });
  static ListServiceSpecificCredentialsResponse fromJson(
          Map<String, dynamic> json) =>
      ListServiceSpecificCredentialsResponse();
}

class ListSigningCertificatesResponse {
  /// A list of the user's signing certificate information.
  final List<SigningCertificate> certificates;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the `Marker` request parameter to retrieve more items. Note that IAM might
  /// return fewer than the `MaxItems` number of results even when there are
  /// more results available. We recommend that you check `IsTruncated` after
  /// every call to ensure that you receive all your results.
  final bool isTruncated;

  /// When `IsTruncated` is `true`, this element is present and contains the
  /// value to use for the `Marker` parameter in a subsequent pagination
  /// request.
  final String marker;

  ListSigningCertificatesResponse({
    @required this.certificates,
    this.isTruncated,
    this.marker,
  });
  static ListSigningCertificatesResponse fromJson(Map<String, dynamic> json) =>
      ListSigningCertificatesResponse();
}

class ListUserPoliciesResponse {
  /// A list of policy names.
  final List<String> policyNames;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the `Marker` request parameter to retrieve more items. Note that IAM might
  /// return fewer than the `MaxItems` number of results even when there are
  /// more results available. We recommend that you check `IsTruncated` after
  /// every call to ensure that you receive all your results.
  final bool isTruncated;

  /// When `IsTruncated` is `true`, this element is present and contains the
  /// value to use for the `Marker` parameter in a subsequent pagination
  /// request.
  final String marker;

  ListUserPoliciesResponse({
    @required this.policyNames,
    this.isTruncated,
    this.marker,
  });
  static ListUserPoliciesResponse fromJson(Map<String, dynamic> json) =>
      ListUserPoliciesResponse();
}

class ListUserTagsResponse {
  /// The list of tags that are currently attached to the user. Each tag
  /// consists of a key name and an associated value. If no tags are attached to
  /// the specified user, the response contains an empty list.
  final List<Tag> tags;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can use the `Marker` request parameter to make
  /// a subsequent pagination request that retrieves more items. Note that IAM
  /// might return fewer than the `MaxItems` number of results even when more
  /// results are available. Check `IsTruncated` after every call to ensure that
  /// you receive all of your results.
  final bool isTruncated;

  /// When `IsTruncated` is `true`, this element is present and contains the
  /// value to use for the `Marker` parameter in a subsequent pagination
  /// request.
  final String marker;

  ListUserTagsResponse({
    @required this.tags,
    this.isTruncated,
    this.marker,
  });
  static ListUserTagsResponse fromJson(Map<String, dynamic> json) =>
      ListUserTagsResponse();
}

class ListUsersResponse {
  /// A list of users.
  final List<User> users;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the `Marker` request parameter to retrieve more items. Note that IAM might
  /// return fewer than the `MaxItems` number of results even when there are
  /// more results available. We recommend that you check `IsTruncated` after
  /// every call to ensure that you receive all your results.
  final bool isTruncated;

  /// When `IsTruncated` is `true`, this element is present and contains the
  /// value to use for the `Marker` parameter in a subsequent pagination
  /// request.
  final String marker;

  ListUsersResponse({
    @required this.users,
    this.isTruncated,
    this.marker,
  });
  static ListUsersResponse fromJson(Map<String, dynamic> json) =>
      ListUsersResponse();
}

class ListVirtualMfaDevicesResponse {
  ///  The list of virtual MFA devices in the current account that match the
  /// `AssignmentStatus` value that was passed in the request.
  final List<VirtualMfaDevice> virtualMfaDevices;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the `Marker` request parameter to retrieve more items. Note that IAM might
  /// return fewer than the `MaxItems` number of results even when there are
  /// more results available. We recommend that you check `IsTruncated` after
  /// every call to ensure that you receive all your results.
  final bool isTruncated;

  /// When `IsTruncated` is `true`, this element is present and contains the
  /// value to use for the `Marker` parameter in a subsequent pagination
  /// request.
  final String marker;

  ListVirtualMfaDevicesResponse({
    @required this.virtualMfaDevices,
    this.isTruncated,
    this.marker,
  });
  static ListVirtualMfaDevicesResponse fromJson(Map<String, dynamic> json) =>
      ListVirtualMfaDevicesResponse();
}

class LoginProfile {
  /// The name of the user, which can be used for signing in to the AWS
  /// Management Console.
  final String userName;

  /// The date when the password for the user was created.
  final DateTime createDate;

  /// Specifies whether the user is required to set a new password on next
  /// sign-in.
  final bool passwordResetRequired;

  LoginProfile({
    @required this.userName,
    @required this.createDate,
    this.passwordResetRequired,
  });
  static LoginProfile fromJson(Map<String, dynamic> json) => LoginProfile();
}

class MfaDevice {
  /// The user with whom the MFA device is associated.
  final String userName;

  /// The serial number that uniquely identifies the MFA device. For virtual MFA
  /// devices, the serial number is the device ARN.
  final String serialNumber;

  /// The date when the MFA device was enabled for the user.
  final DateTime enableDate;

  MfaDevice({
    @required this.userName,
    @required this.serialNumber,
    @required this.enableDate,
  });
  static MfaDevice fromJson(Map<String, dynamic> json) => MfaDevice();
}

class ManagedPolicyDetail {
  /// The friendly name (not ARN) identifying the policy.
  final String policyName;

  /// The stable and unique string identifying the policy.
  ///
  /// For more information about IDs, see [IAM
  /// Identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html)
  /// in the _Using IAM_ guide.
  final String policyId;

  final String arn;

  /// The path to the policy.
  ///
  /// For more information about paths, see [IAM
  /// Identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html)
  /// in the _Using IAM_ guide.
  final String path;

  /// The identifier for the version of the policy that is set as the default
  /// (operative) version.
  ///
  /// For more information about policy versions, see [Versioning for Managed
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-versions.html)
  /// in the _Using IAM_ guide.
  final String defaultVersionId;

  /// The number of principal entities (users, groups, and roles) that the
  /// policy is attached to.
  final int attachmentCount;

  /// The number of entities (users and roles) for which the policy is used as
  /// the permissions boundary.
  ///
  /// For more information about permissions boundaries, see [Permissions
  /// Boundaries for IAM
  /// Identities](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html)
  ///  in the _IAM User Guide_.
  final int permissionsBoundaryUsageCount;

  /// Specifies whether the policy can be attached to an IAM user, group, or
  /// role.
  final bool isAttachable;

  /// A friendly description of the policy.
  final String description;

  /// The date and time, in [ISO 8601 date-time
  /// format](http://www.iso.org/iso/iso8601), when the policy was created.
  final DateTime createDate;

  /// The date and time, in [ISO 8601 date-time
  /// format](http://www.iso.org/iso/iso8601), when the policy was last updated.
  ///
  /// When a policy has only one version, this field contains the date and time
  /// when the policy was created. When a policy has more than one version, this
  /// field contains the date and time when the most recent policy version was
  /// created.
  final DateTime updateDate;

  /// A list containing information about the versions of the policy.
  final List<PolicyVersion> policyVersionList;

  ManagedPolicyDetail({
    this.policyName,
    this.policyId,
    this.arn,
    this.path,
    this.defaultVersionId,
    this.attachmentCount,
    this.permissionsBoundaryUsageCount,
    this.isAttachable,
    this.description,
    this.createDate,
    this.updateDate,
    this.policyVersionList,
  });
  static ManagedPolicyDetail fromJson(Map<String, dynamic> json) =>
      ManagedPolicyDetail();
}

class OpenIDConnectProviderListEntry {
  final String arn;

  OpenIDConnectProviderListEntry({
    this.arn,
  });
  static OpenIDConnectProviderListEntry fromJson(Map<String, dynamic> json) =>
      OpenIDConnectProviderListEntry();
}

class OrganizationsDecisionDetail {
  /// Specifies whether the simulated operation is allowed by the Organizations
  /// service control policies that impact the simulated user's account.
  final bool allowedByOrganizations;

  OrganizationsDecisionDetail({
    this.allowedByOrganizations,
  });
  static OrganizationsDecisionDetail fromJson(Map<String, dynamic> json) =>
      OrganizationsDecisionDetail();
}

class PasswordPolicy {
  /// Minimum length to require for IAM user passwords.
  final int minimumPasswordLength;

  /// Specifies whether to require symbols for IAM user passwords.
  final bool requireSymbols;

  /// Specifies whether to require numbers for IAM user passwords.
  final bool requireNumbers;

  /// Specifies whether to require uppercase characters for IAM user passwords.
  final bool requireUppercaseCharacters;

  /// Specifies whether to require lowercase characters for IAM user passwords.
  final bool requireLowercaseCharacters;

  /// Specifies whether IAM users are allowed to change their own password.
  final bool allowUsersToChangePassword;

  /// Indicates whether passwords in the account expire. Returns true if
  /// `MaxPasswordAge` contains a value greater than 0. Returns false if
  /// MaxPasswordAge is 0 or not present.
  final bool expirePasswords;

  /// The number of days that an IAM user password is valid.
  final int maxPasswordAge;

  /// Specifies the number of previous passwords that IAM users are prevented
  /// from reusing.
  final int passwordReusePrevention;

  /// Specifies whether IAM users are prevented from setting a new password
  /// after their password has expired.
  final bool hardExpiry;

  PasswordPolicy({
    this.minimumPasswordLength,
    this.requireSymbols,
    this.requireNumbers,
    this.requireUppercaseCharacters,
    this.requireLowercaseCharacters,
    this.allowUsersToChangePassword,
    this.expirePasswords,
    this.maxPasswordAge,
    this.passwordReusePrevention,
    this.hardExpiry,
  });
  static PasswordPolicy fromJson(Map<String, dynamic> json) => PasswordPolicy();
}

class Policy {
  /// The friendly name (not ARN) identifying the policy.
  final String policyName;

  /// The stable and unique string identifying the policy.
  ///
  /// For more information about IDs, see [IAM
  /// Identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html)
  /// in the _Using IAM_ guide.
  final String policyId;

  final String arn;

  /// The path to the policy.
  ///
  /// For more information about paths, see [IAM
  /// Identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html)
  /// in the _Using IAM_ guide.
  final String path;

  /// The identifier for the version of the policy that is set as the default
  /// version.
  final String defaultVersionId;

  /// The number of entities (users, groups, and roles) that the policy is
  /// attached to.
  final int attachmentCount;

  /// The number of entities (users and roles) for which the policy is used to
  /// set the permissions boundary.
  ///
  /// For more information about permissions boundaries, see [Permissions
  /// Boundaries for IAM
  /// Identities](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html)
  ///  in the _IAM User Guide_.
  final int permissionsBoundaryUsageCount;

  /// Specifies whether the policy can be attached to an IAM user, group, or
  /// role.
  final bool isAttachable;

  /// A friendly description of the policy.
  ///
  /// This element is included in the response to the GetPolicy operation. It is
  /// not included in the response to the ListPolicies operation.
  final String description;

  /// The date and time, in [ISO 8601 date-time
  /// format](http://www.iso.org/iso/iso8601), when the policy was created.
  final DateTime createDate;

  /// The date and time, in [ISO 8601 date-time
  /// format](http://www.iso.org/iso/iso8601), when the policy was last updated.
  ///
  /// When a policy has only one version, this field contains the date and time
  /// when the policy was created. When a policy has more than one version, this
  /// field contains the date and time when the most recent policy version was
  /// created.
  final DateTime updateDate;

  Policy({
    this.policyName,
    this.policyId,
    this.arn,
    this.path,
    this.defaultVersionId,
    this.attachmentCount,
    this.permissionsBoundaryUsageCount,
    this.isAttachable,
    this.description,
    this.createDate,
    this.updateDate,
  });
  static Policy fromJson(Map<String, dynamic> json) => Policy();
}

class PolicyDetail {
  /// The name of the policy.
  final String policyName;

  /// The policy document.
  final String policyDocument;

  PolicyDetail({
    this.policyName,
    this.policyDocument,
  });
  static PolicyDetail fromJson(Map<String, dynamic> json) => PolicyDetail();
}

class PolicyGrantingServiceAccess {
  /// The policy name.
  final String policyName;

  /// The policy type. For more information about these policy types, see
  /// [Managed Policies and Inline
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_managed-vs-inline.html)
  /// in the _IAM User Guide_.
  final String policyType;

  final String policyArn;

  /// The type of entity (user or role) that used the policy to access the
  /// service to which the inline policy is attached.
  ///
  /// This field is null for managed policies. For more information about these
  /// policy types, see [Managed Policies and Inline
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_managed-vs-inline.html)
  /// in the _IAM User Guide_.
  final String entityType;

  /// The name of the entity (user or role) to which the inline policy is
  /// attached.
  ///
  /// This field is null for managed policies. For more information about these
  /// policy types, see [Managed Policies and Inline
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_managed-vs-inline.html)
  /// in the _IAM User Guide_.
  final String entityName;

  PolicyGrantingServiceAccess({
    @required this.policyName,
    @required this.policyType,
    this.policyArn,
    this.entityType,
    this.entityName,
  });
  static PolicyGrantingServiceAccess fromJson(Map<String, dynamic> json) =>
      PolicyGrantingServiceAccess();
}

class PolicyGroup {
  /// The name (friendly name, not ARN) identifying the group.
  final String groupName;

  /// The stable and unique string identifying the group. For more information
  /// about IDs, see [IAM
  /// Identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html)
  /// in the _IAM User Guide_.
  final String groupId;

  PolicyGroup({
    this.groupName,
    this.groupId,
  });
  static PolicyGroup fromJson(Map<String, dynamic> json) => PolicyGroup();
}

class PolicyRole {
  /// The name (friendly name, not ARN) identifying the role.
  final String roleName;

  /// The stable and unique string identifying the role. For more information
  /// about IDs, see [IAM
  /// Identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html)
  /// in the _IAM User Guide_.
  final String roleId;

  PolicyRole({
    this.roleName,
    this.roleId,
  });
  static PolicyRole fromJson(Map<String, dynamic> json) => PolicyRole();
}

class PolicyUser {
  /// The name (friendly name, not ARN) identifying the user.
  final String userName;

  /// The stable and unique string identifying the user. For more information
  /// about IDs, see [IAM
  /// Identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html)
  /// in the _IAM User Guide_.
  final String userId;

  PolicyUser({
    this.userName,
    this.userId,
  });
  static PolicyUser fromJson(Map<String, dynamic> json) => PolicyUser();
}

class PolicyVersion {
  /// The policy document.
  ///
  /// The policy document is returned in the response to the GetPolicyVersion
  /// and GetAccountAuthorizationDetails operations. It is not returned in the
  /// response to the CreatePolicyVersion or ListPolicyVersions operations.
  ///
  /// The policy document returned in this structure is URL-encoded compliant
  /// with [RFC 3986](https://tools.ietf.org/html/rfc3986). You can use a URL
  /// decoding method to convert the policy back to plain JSON text. For
  /// example, if you use Java, you can use the `decode` method of the
  /// `java.net.URLDecoder` utility class in the Java SDK. Other languages and
  /// SDKs provide similar functionality.
  final String document;

  /// The identifier for the policy version.
  ///
  /// Policy version identifiers always begin with `v` (always lowercase). When
  /// a policy is created, the first policy version is `v1`.
  final String versionId;

  /// Specifies whether the policy version is set as the policy's default
  /// version.
  final bool isDefaultVersion;

  /// The date and time, in [ISO 8601 date-time
  /// format](http://www.iso.org/iso/iso8601), when the policy version was
  /// created.
  final DateTime createDate;

  PolicyVersion({
    this.document,
    this.versionId,
    this.isDefaultVersion,
    this.createDate,
  });
  static PolicyVersion fromJson(Map<String, dynamic> json) => PolicyVersion();
}

class Position {
  /// The line containing the specified position in the document.
  final int line;

  /// The column in the line containing the specified position in the document.
  final int column;

  Position({
    this.line,
    this.column,
  });
  static Position fromJson(Map<String, dynamic> json) => Position();
}

class ResetServiceSpecificCredentialResponse {
  /// A structure with details about the updated service-specific credential,
  /// including the new password.
  ///
  ///
  ///
  /// This is the **only** time that you can access the password. You cannot
  /// recover the password later, but you can reset it again.
  final ServiceSpecificCredential serviceSpecificCredential;

  ResetServiceSpecificCredentialResponse({
    this.serviceSpecificCredential,
  });
  static ResetServiceSpecificCredentialResponse fromJson(
          Map<String, dynamic> json) =>
      ResetServiceSpecificCredentialResponse();
}

class ResourceSpecificResult {
  /// The name of the simulated resource, in Amazon Resource Name (ARN) format.
  final String evalResourceName;

  /// The result of the simulation of the simulated API operation on the
  /// resource specified in `EvalResourceName`.
  final String evalResourceDecision;

  /// A list of the statements in the input policies that determine the result
  /// for this part of the simulation. Remember that even if multiple statements
  /// allow the operation on the resource, if _any_ statement denies that
  /// operation, then the explicit deny overrides any allow. In addition, the
  /// deny statement is the only entry included in the result.
  final List<Statement> matchedStatements;

  /// A list of context keys that are required by the included input policies
  /// but that were not provided by one of the input parameters. This list is
  /// used when a list of ARNs is included in the `ResourceArns` parameter
  /// instead of "*". If you do not specify individual resources, by setting
  /// `ResourceArns` to "*" or by not including the `ResourceArns` parameter,
  /// then any missing context values are instead included under the
  /// `EvaluationResults` section. To discover the context keys used by a set of
  /// policies, you can call GetContextKeysForCustomPolicy or
  /// GetContextKeysForPrincipalPolicy.
  final List<String> missingContextValues;

  /// Additional details about the results of the evaluation decision. When
  /// there are both IAM policies and resource policies, this parameter explains
  /// how each set of policies contributes to the final evaluation decision.
  /// When simulating cross-account access to a resource, both the
  /// resource-based policy and the caller's IAM policy must grant access.
  final Map<String, String> evalDecisionDetails;

  ResourceSpecificResult({
    @required this.evalResourceName,
    @required this.evalResourceDecision,
    this.matchedStatements,
    this.missingContextValues,
    this.evalDecisionDetails,
  });
  static ResourceSpecificResult fromJson(Map<String, dynamic> json) =>
      ResourceSpecificResult();
}

class Role {
  ///  The path to the role. For more information about paths, see [IAM
  /// Identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html)
  /// in the _Using IAM_ guide.
  final String path;

  /// The friendly name that identifies the role.
  final String roleName;

  ///  The stable and unique string identifying the role. For more information
  /// about IDs, see [IAM
  /// Identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html)
  /// in the _Using IAM_ guide.
  final String roleId;

  ///  The Amazon Resource Name (ARN) specifying the role. For more information
  /// about ARNs and how to use them in policies, see [IAM
  /// Identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html)
  /// in the _IAM User Guide_ guide.
  final String arn;

  /// The date and time, in [ISO 8601 date-time
  /// format](http://www.iso.org/iso/iso8601), when the role was created.
  final DateTime createDate;

  /// The policy that grants an entity permission to assume the role.
  final String assumeRolePolicyDocument;

  /// A description of the role that you provide.
  final String description;

  /// The maximum session duration (in seconds) for the specified role. Anyone
  /// who uses the AWS CLI, or API to assume the role can specify the duration
  /// using the optional `DurationSeconds` API parameter or `duration-seconds`
  /// CLI parameter.
  final int maxSessionDuration;

  /// The ARN of the policy used to set the permissions boundary for the role.
  ///
  /// For more information about permissions boundaries, see [Permissions
  /// Boundaries for IAM
  /// Identities](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html)
  ///  in the _IAM User Guide_.
  final AttachedPermissionsBoundary permissionsBoundary;

  /// A list of tags that are attached to the specified role. For more
  /// information about tagging, see [Tagging IAM
  /// Identities](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html)
  /// in the _IAM User Guide_.
  final List<Tag> tags;

  Role({
    @required this.path,
    @required this.roleName,
    @required this.roleId,
    @required this.arn,
    @required this.createDate,
    this.assumeRolePolicyDocument,
    this.description,
    this.maxSessionDuration,
    this.permissionsBoundary,
    this.tags,
  });
  static Role fromJson(Map<String, dynamic> json) => Role();
}

class RoleDetail {
  /// The path to the role. For more information about paths, see [IAM
  /// Identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html)
  /// in the _Using IAM_ guide.
  final String path;

  /// The friendly name that identifies the role.
  final String roleName;

  /// The stable and unique string identifying the role. For more information
  /// about IDs, see [IAM
  /// Identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html)
  /// in the _Using IAM_ guide.
  final String roleId;

  final String arn;

  /// The date and time, in [ISO 8601 date-time
  /// format](http://www.iso.org/iso/iso8601), when the role was created.
  final DateTime createDate;

  /// The trust policy that grants permission to assume the role.
  final String assumeRolePolicyDocument;

  /// A list of instance profiles that contain this role.
  final List<InstanceProfile> instanceProfileList;

  /// A list of inline policies embedded in the role. These policies are the
  /// role's access (permissions) policies.
  final List<PolicyDetail> rolePolicyList;

  /// A list of managed policies attached to the role. These policies are the
  /// role's access (permissions) policies.
  final List<AttachedPolicy> attachedManagedPolicies;

  /// The ARN of the policy used to set the permissions boundary for the role.
  ///
  /// For more information about permissions boundaries, see [Permissions
  /// Boundaries for IAM
  /// Identities](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html)
  ///  in the _IAM User Guide_.
  final AttachedPermissionsBoundary permissionsBoundary;

  /// A list of tags that are attached to the specified role. For more
  /// information about tagging, see [Tagging IAM
  /// Identities](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html)
  /// in the _IAM User Guide_.
  final List<Tag> tags;

  RoleDetail({
    this.path,
    this.roleName,
    this.roleId,
    this.arn,
    this.createDate,
    this.assumeRolePolicyDocument,
    this.instanceProfileList,
    this.rolePolicyList,
    this.attachedManagedPolicies,
    this.permissionsBoundary,
    this.tags,
  });
  static RoleDetail fromJson(Map<String, dynamic> json) => RoleDetail();
}

class RoleUsageType {
  /// The name of the Region where the service-linked role is being used.
  final String region;

  /// The name of the resource that is using the service-linked role.
  final List<String> resources;

  RoleUsageType({
    this.region,
    this.resources,
  });
  static RoleUsageType fromJson(Map<String, dynamic> json) => RoleUsageType();
}

class SamlProviderListEntry {
  /// The Amazon Resource Name (ARN) of the SAML provider.
  final String arn;

  /// The expiration date and time for the SAML provider.
  final DateTime validUntil;

  /// The date and time when the SAML provider was created.
  final DateTime createDate;

  SamlProviderListEntry({
    this.arn,
    this.validUntil,
    this.createDate,
  });
  static SamlProviderListEntry fromJson(Map<String, dynamic> json) =>
      SamlProviderListEntry();
}

class SshPublicKey {
  /// The name of the IAM user associated with the SSH public key.
  final String userName;

  /// The unique identifier for the SSH public key.
  final String sshPublicKeyId;

  /// The MD5 message digest of the SSH public key.
  final String fingerprint;

  /// The SSH public key.
  final String sshPublicKeyBody;

  /// The status of the SSH public key. `Active` means that the key can be used
  /// for authentication with an AWS CodeCommit repository. `Inactive` means
  /// that the key cannot be used.
  final String status;

  /// The date and time, in [ISO 8601 date-time
  /// format](http://www.iso.org/iso/iso8601), when the SSH public key was
  /// uploaded.
  final DateTime uploadDate;

  SshPublicKey({
    @required this.userName,
    @required this.sshPublicKeyId,
    @required this.fingerprint,
    @required this.sshPublicKeyBody,
    @required this.status,
    this.uploadDate,
  });
  static SshPublicKey fromJson(Map<String, dynamic> json) => SshPublicKey();
}

class SshPublicKeyMetadata {
  /// The name of the IAM user associated with the SSH public key.
  final String userName;

  /// The unique identifier for the SSH public key.
  final String sshPublicKeyId;

  /// The status of the SSH public key. `Active` means that the key can be used
  /// for authentication with an AWS CodeCommit repository. `Inactive` means
  /// that the key cannot be used.
  final String status;

  /// The date and time, in [ISO 8601 date-time
  /// format](http://www.iso.org/iso/iso8601), when the SSH public key was
  /// uploaded.
  final DateTime uploadDate;

  SshPublicKeyMetadata({
    @required this.userName,
    @required this.sshPublicKeyId,
    @required this.status,
    @required this.uploadDate,
  });
  static SshPublicKeyMetadata fromJson(Map<String, dynamic> json) =>
      SshPublicKeyMetadata();
}

class ServerCertificate {
  /// The meta information of the server certificate, such as its name, path,
  /// ID, and ARN.
  final ServerCertificateMetadata serverCertificateMetadata;

  /// The contents of the public key certificate.
  final String certificateBody;

  /// The contents of the public key certificate chain.
  final String certificateChain;

  ServerCertificate({
    @required this.serverCertificateMetadata,
    @required this.certificateBody,
    this.certificateChain,
  });
  static ServerCertificate fromJson(Map<String, dynamic> json) =>
      ServerCertificate();
}

class ServerCertificateMetadata {
  ///  The path to the server certificate. For more information about paths, see
  /// [IAM
  /// Identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html)
  /// in the _Using IAM_ guide.
  final String path;

  /// The name that identifies the server certificate.
  final String serverCertificateName;

  ///  The stable and unique string identifying the server certificate. For more
  /// information about IDs, see [IAM
  /// Identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html)
  /// in the _Using IAM_ guide.
  final String serverCertificateId;

  ///  The Amazon Resource Name (ARN) specifying the server certificate. For
  /// more information about ARNs and how to use them in policies, see [IAM
  /// Identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html)
  /// in the _Using IAM_ guide.
  final String arn;

  /// The date when the server certificate was uploaded.
  final DateTime uploadDate;

  /// The date on which the certificate is set to expire.
  final DateTime expiration;

  ServerCertificateMetadata({
    @required this.path,
    @required this.serverCertificateName,
    @required this.serverCertificateId,
    @required this.arn,
    this.uploadDate,
    this.expiration,
  });
  static ServerCertificateMetadata fromJson(Map<String, dynamic> json) =>
      ServerCertificateMetadata();
}

class ServiceLastAccessed {
  /// The name of the service in which access was attempted.
  final String serviceName;

  /// The date and time, in [ISO 8601 date-time
  /// format](http://www.iso.org/iso/iso8601), when an authenticated entity most
  /// recently attempted to access the service. AWS does not report
  /// unauthenticated requests.
  ///
  /// This field is null if no IAM entities attempted to access the service
  /// within the [reporting
  /// period](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#service-last-accessed-reporting-period).
  final DateTime lastAuthenticated;

  /// The namespace of the service in which access was attempted.
  ///
  /// To learn the service namespace of a service, go to [Actions, Resources,
  /// and Condition Keys for AWS
  /// Services](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_actions-resources-contextkeys.html)
  /// in the _IAM User Guide_. Choose the name of the service to view details
  /// for that service. In the first paragraph, find the service prefix. For
  /// example, `(service prefix: a4b)`. For more information about service
  /// namespaces, see [AWS Service
  /// Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#genref-aws-service-namespaces)
  /// in the _AWS General Reference_.
  final String serviceNamespace;

  /// The ARN of the authenticated entity (user or role) that last attempted to
  /// access the service. AWS does not report unauthenticated requests.
  ///
  /// This field is null if no IAM entities attempted to access the service
  /// within the [reporting
  /// period](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#service-last-accessed-reporting-period).
  final String lastAuthenticatedEntity;

  /// The total number of authenticated principals (root user, IAM users, or IAM
  /// roles) that have attempted to access the service.
  ///
  /// This field is null if no principals attempted to access the service within
  /// the [reporting
  /// period](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#service-last-accessed-reporting-period).
  final int totalAuthenticatedEntities;

  ServiceLastAccessed({
    @required this.serviceName,
    this.lastAuthenticated,
    @required this.serviceNamespace,
    this.lastAuthenticatedEntity,
    this.totalAuthenticatedEntities,
  });
  static ServiceLastAccessed fromJson(Map<String, dynamic> json) =>
      ServiceLastAccessed();
}

class ServiceSpecificCredential {
  /// The date and time, in [ISO 8601 date-time
  /// format](http://www.iso.org/iso/iso8601), when the service-specific
  /// credential were created.
  final DateTime createDate;

  /// The name of the service associated with the service-specific credential.
  final String serviceName;

  /// The generated user name for the service-specific credential. This value is
  /// generated by combining the IAM user's name combined with the ID number of
  /// the AWS account, as in `jane-at-123456789012`, for example. This value
  /// cannot be configured by the user.
  final String serviceUserName;

  /// The generated password for the service-specific credential.
  final String servicePassword;

  /// The unique identifier for the service-specific credential.
  final String serviceSpecificCredentialId;

  /// The name of the IAM user associated with the service-specific credential.
  final String userName;

  /// The status of the service-specific credential. `Active` means that the key
  /// is valid for API calls, while `Inactive` means it is not.
  final String status;

  ServiceSpecificCredential({
    @required this.createDate,
    @required this.serviceName,
    @required this.serviceUserName,
    @required this.servicePassword,
    @required this.serviceSpecificCredentialId,
    @required this.userName,
    @required this.status,
  });
  static ServiceSpecificCredential fromJson(Map<String, dynamic> json) =>
      ServiceSpecificCredential();
}

class ServiceSpecificCredentialMetadata {
  /// The name of the IAM user associated with the service-specific credential.
  final String userName;

  /// The status of the service-specific credential. `Active` means that the key
  /// is valid for API calls, while `Inactive` means it is not.
  final String status;

  /// The generated user name for the service-specific credential.
  final String serviceUserName;

  /// The date and time, in [ISO 8601 date-time
  /// format](http://www.iso.org/iso/iso8601), when the service-specific
  /// credential were created.
  final DateTime createDate;

  /// The unique identifier for the service-specific credential.
  final String serviceSpecificCredentialId;

  /// The name of the service associated with the service-specific credential.
  final String serviceName;

  ServiceSpecificCredentialMetadata({
    @required this.userName,
    @required this.status,
    @required this.serviceUserName,
    @required this.createDate,
    @required this.serviceSpecificCredentialId,
    @required this.serviceName,
  });
  static ServiceSpecificCredentialMetadata fromJson(
          Map<String, dynamic> json) =>
      ServiceSpecificCredentialMetadata();
}

class SigningCertificate {
  /// The name of the user the signing certificate is associated with.
  final String userName;

  /// The ID for the signing certificate.
  final String certificateId;

  /// The contents of the signing certificate.
  final String certificateBody;

  /// The status of the signing certificate. `Active` means that the key is
  /// valid for API calls, while `Inactive` means it is not.
  final String status;

  /// The date when the signing certificate was uploaded.
  final DateTime uploadDate;

  SigningCertificate({
    @required this.userName,
    @required this.certificateId,
    @required this.certificateBody,
    @required this.status,
    this.uploadDate,
  });
  static SigningCertificate fromJson(Map<String, dynamic> json) =>
      SigningCertificate();
}

class SimulatePolicyResponse {
  /// The results of the simulation.
  final List<EvaluationResult> evaluationResults;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the `Marker` request parameter to retrieve more items. Note that IAM might
  /// return fewer than the `MaxItems` number of results even when there are
  /// more results available. We recommend that you check `IsTruncated` after
  /// every call to ensure that you receive all your results.
  final bool isTruncated;

  /// When `IsTruncated` is `true`, this element is present and contains the
  /// value to use for the `Marker` parameter in a subsequent pagination
  /// request.
  final String marker;

  SimulatePolicyResponse({
    this.evaluationResults,
    this.isTruncated,
    this.marker,
  });
  static SimulatePolicyResponse fromJson(Map<String, dynamic> json) =>
      SimulatePolicyResponse();
}

class Statement {
  /// The identifier of the policy that was provided as an input.
  final String sourcePolicyId;

  /// The type of the policy.
  final String sourcePolicyType;

  /// The row and column of the beginning of the `Statement` in an IAM policy.
  final Position startPosition;

  /// The row and column of the end of a `Statement` in an IAM policy.
  final Position endPosition;

  Statement({
    this.sourcePolicyId,
    this.sourcePolicyType,
    this.startPosition,
    this.endPosition,
  });
  static Statement fromJson(Map<String, dynamic> json) => Statement();
}

class Tag {
  /// The key name that can be used to look up or retrieve the associated value.
  /// For example, `Department` or `Cost Center` are common choices.
  final String key;

  /// The value associated with this tag. For example, tags with a key name of
  /// `Department` could have values such as `Human Resources`, `Accounting`,
  /// and `Support`. Tags with a key name of `Cost Center` might have values
  /// that consist of the number associated with the different cost centers in
  /// your company. Typically, many resources have tags with the same key name
  /// but with different values.
  ///
  ///
  ///
  /// AWS always interprets the tag `Value` as a single string. If you need to
  /// store an array, you can store comma-separated values in the string.
  /// However, you must interpret the value in your code.
  final String value;

  Tag({
    @required this.key,
    @required this.value,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag();
}

class UpdateRoleDescriptionResponse {
  /// A structure that contains details about the modified role.
  final Role role;

  UpdateRoleDescriptionResponse({
    this.role,
  });
  static UpdateRoleDescriptionResponse fromJson(Map<String, dynamic> json) =>
      UpdateRoleDescriptionResponse();
}

class UpdateRoleResponse {
  UpdateRoleResponse();
  static UpdateRoleResponse fromJson(Map<String, dynamic> json) =>
      UpdateRoleResponse();
}

class UpdateSamlProviderResponse {
  /// The Amazon Resource Name (ARN) of the SAML provider that was updated.
  final String samlProviderArn;

  UpdateSamlProviderResponse({
    this.samlProviderArn,
  });
  static UpdateSamlProviderResponse fromJson(Map<String, dynamic> json) =>
      UpdateSamlProviderResponse();
}

class UploadSshPublicKeyResponse {
  /// Contains information about the SSH public key.
  final SshPublicKey sshPublicKey;

  UploadSshPublicKeyResponse({
    this.sshPublicKey,
  });
  static UploadSshPublicKeyResponse fromJson(Map<String, dynamic> json) =>
      UploadSshPublicKeyResponse();
}

class UploadServerCertificateResponse {
  /// The meta information of the uploaded server certificate without its
  /// certificate body, certificate chain, and private key.
  final ServerCertificateMetadata serverCertificateMetadata;

  UploadServerCertificateResponse({
    this.serverCertificateMetadata,
  });
  static UploadServerCertificateResponse fromJson(Map<String, dynamic> json) =>
      UploadServerCertificateResponse();
}

class UploadSigningCertificateResponse {
  /// Information about the certificate.
  final SigningCertificate certificate;

  UploadSigningCertificateResponse({
    @required this.certificate,
  });
  static UploadSigningCertificateResponse fromJson(Map<String, dynamic> json) =>
      UploadSigningCertificateResponse();
}

class User {
  /// The path to the user. For more information about paths, see [IAM
  /// Identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html)
  /// in the _Using IAM_ guide.
  final String path;

  /// The friendly name identifying the user.
  final String userName;

  /// The stable and unique string identifying the user. For more information
  /// about IDs, see [IAM
  /// Identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html)
  /// in the _Using IAM_ guide.
  final String userId;

  /// The Amazon Resource Name (ARN) that identifies the user. For more
  /// information about ARNs and how to use ARNs in policies, see [IAM
  /// Identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html)
  /// in the _Using IAM_ guide.
  final String arn;

  /// The date and time, in [ISO 8601 date-time
  /// format](http://www.iso.org/iso/iso8601), when the user was created.
  final DateTime createDate;

  /// The date and time, in [ISO 8601 date-time
  /// format](http://www.iso.org/iso/iso8601), when the user's password was last
  /// used to sign in to an AWS website. For a list of AWS websites that capture
  /// a user's last sign-in time, see the [Credential
  /// Reports](https://docs.aws.amazon.com/IAM/latest/UserGuide/credential-reports.html)
  /// topic in the _Using IAM_ guide. If a password is used more than once in a
  /// five-minute span, only the first use is returned in this field. If the
  /// field is null (no value), then it indicates that they never signed in with
  /// a password. This can be because:
  ///
  /// *   The user never had a password.
  ///
  /// *   A password exists but has not been used since IAM started tracking
  /// this information on October 20, 2014.
  ///
  ///
  /// A null value does not mean that the user _never_ had a password. Also, if
  /// the user does not currently have a password, but had one in the past, then
  /// this field contains the date and time the most recent password was used.
  ///
  /// This value is returned only in the GetUser and ListUsers operations.
  final DateTime passwordLastUsed;

  /// The ARN of the policy used to set the permissions boundary for the user.
  ///
  /// For more information about permissions boundaries, see [Permissions
  /// Boundaries for IAM
  /// Identities](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html)
  ///  in the _IAM User Guide_.
  final AttachedPermissionsBoundary permissionsBoundary;

  /// A list of tags that are associated with the specified user. For more
  /// information about tagging, see [Tagging IAM
  /// Identities](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html)
  /// in the _IAM User Guide_.
  final List<Tag> tags;

  User({
    @required this.path,
    @required this.userName,
    @required this.userId,
    @required this.arn,
    @required this.createDate,
    this.passwordLastUsed,
    this.permissionsBoundary,
    this.tags,
  });
  static User fromJson(Map<String, dynamic> json) => User();
}

class UserDetail {
  /// The path to the user. For more information about paths, see [IAM
  /// Identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html)
  /// in the _Using IAM_ guide.
  final String path;

  /// The friendly name identifying the user.
  final String userName;

  /// The stable and unique string identifying the user. For more information
  /// about IDs, see [IAM
  /// Identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html)
  /// in the _Using IAM_ guide.
  final String userId;

  final String arn;

  /// The date and time, in [ISO 8601 date-time
  /// format](http://www.iso.org/iso/iso8601), when the user was created.
  final DateTime createDate;

  /// A list of the inline policies embedded in the user.
  final List<PolicyDetail> userPolicyList;

  /// A list of IAM groups that the user is in.
  final List<String> groupList;

  /// A list of the managed policies attached to the user.
  final List<AttachedPolicy> attachedManagedPolicies;

  /// The ARN of the policy used to set the permissions boundary for the user.
  ///
  /// For more information about permissions boundaries, see [Permissions
  /// Boundaries for IAM
  /// Identities](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html)
  ///  in the _IAM User Guide_.
  final AttachedPermissionsBoundary permissionsBoundary;

  /// A list of tags that are associated with the specified user. For more
  /// information about tagging, see [Tagging IAM
  /// Identities](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html)
  /// in the _IAM User Guide_.
  final List<Tag> tags;

  UserDetail({
    this.path,
    this.userName,
    this.userId,
    this.arn,
    this.createDate,
    this.userPolicyList,
    this.groupList,
    this.attachedManagedPolicies,
    this.permissionsBoundary,
    this.tags,
  });
  static UserDetail fromJson(Map<String, dynamic> json) => UserDetail();
}

class VirtualMfaDevice {
  /// The serial number associated with `VirtualMFADevice`.
  final String serialNumber;

  ///  The base32 seed defined as specified in
  /// [RFC3548](https://tools.ietf.org/html/rfc3548.txt). The `Base32StringSeed`
  /// is base64-encoded.
  final Uint8List base32StringSeed;

  ///  A QR code PNG image that encodes
  /// `otpauth://totp/$virtualMFADeviceName@$AccountName?secret=$Base32String`
  /// where `$virtualMFADeviceName` is one of the create call arguments.
  /// `AccountName` is the user name if set (otherwise, the account ID
  /// otherwise), and `Base32String` is the seed in base32 format. The
  /// `Base32String` value is base64-encoded.
  final Uint8List qrCodePng;

  /// The IAM user associated with this virtual MFA device.
  final User user;

  /// The date and time on which the virtual MFA device was enabled.
  final DateTime enableDate;

  VirtualMfaDevice({
    @required this.serialNumber,
    this.base32StringSeed,
    this.qrCodePng,
    this.user,
    this.enableDate,
  });
  static VirtualMfaDevice fromJson(Map<String, dynamic> json) =>
      VirtualMfaDevice();
}
