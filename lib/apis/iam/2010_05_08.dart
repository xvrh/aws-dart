import 'package:meta/meta.dart';

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
  Future<void> addRoleToInstanceProfile(
      {@required String instanceProfileName,
      @required String roleName}) async {}

  /// Adds the specified user to the specified group.
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
  Future<void> attachUserPolicy(
      {@required String userName, @required String policyArn}) async {}

  /// Changes the password of the IAM user who is calling this operation. The
  /// AWS account root user password is not affected by this operation.
  ///
  /// To change the password for a different user, see UpdateLoginProfile. For
  /// more information about modifying passwords, see [Managing
  /// Passwords](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_ManagingLogins.html)
  /// in the _IAM User Guide_.
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
  Future<void> createAccessKey({String userName}) async {}

  /// Creates an alias for your AWS account. For information about using an AWS
  /// account alias, see [Using an Alias for Your AWS Account
  /// ID](https://docs.aws.amazon.com/IAM/latest/UserGuide/AccountAlias.html) in
  /// the _IAM User Guide_.
  Future<void> createAccountAlias(String accountAlias) async {}

  /// Creates a new group.
  ///
  ///  For information about the number of groups you can create, see
  /// [Limitations on IAM
  /// Entities](https://docs.aws.amazon.com/IAM/latest/UserGuide/LimitationsOnEntities.html)
  /// in the _IAM User Guide_.
  Future<void> createGroup(String groupName, {String path}) async {}

  ///  Creates a new instance profile. For information about instance profiles,
  /// go to [About Instance
  /// Profiles](https://docs.aws.amazon.com/IAM/latest/UserGuide/AboutInstanceProfiles.html).
  ///
  ///  For information about the number of instance profiles you can create, see
  /// [Limitations on IAM
  /// Entities](https://docs.aws.amazon.com/IAM/latest/UserGuide/LimitationsOnEntities.html)
  /// in the _IAM User Guide_.
  Future<void> createInstanceProfile(String instanceProfileName,
      {String path}) async {}

  ///  Creates a password for the specified user, giving the user the ability to
  /// access AWS services through the AWS Management Console. For more
  /// information about managing passwords, see [Managing
  /// Passwords](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_ManagingLogins.html)
  /// in the _IAM User Guide_.
  Future<void> createLoginProfile(
      {@required String userName,
      @required String password,
      bool passwordResetRequired}) async {}

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
  Future<void> createOpenIDConnectProvider(
      {@required String url,
      List<String> clientIDList,
      @required List<String> thumbprintList}) async {}

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
  Future<void> createPolicy(
      {@required String policyName,
      String path,
      @required String policyDocument,
      String description}) async {}

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
  Future<void> createPolicyVersion(
      {@required String policyArn,
      @required String policyDocument,
      bool setAsDefault}) async {}

  /// Creates a new role for your AWS account. For more information about roles,
  /// go to [IAM
  /// Roles](https://docs.aws.amazon.com/IAM/latest/UserGuide/WorkingWithRoles.html).
  /// For information about limitations on role names and the number of roles
  /// you can create, go to [Limitations on IAM
  /// Entities](https://docs.aws.amazon.com/IAM/latest/UserGuide/LimitationsOnEntities.html)
  /// in the _IAM User Guide_.
  Future<void> createRole(
      {String path,
      @required String roleName,
      @required String assumeRolePolicyDocument,
      String description,
      int maxSessionDuration,
      String permissionsBoundary,
      List<Tag> tags}) async {}

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
  Future<void> createSamlProvider(
      {@required String samlMetadataDocument, @required String name}) async {}

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
  Future<void> createServiceLinkedRole(String awsServiceName,
      {String description, String customSuffix}) async {}

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
  Future<void> createServiceSpecificCredential(
      {@required String userName, @required String serviceName}) async {}

  /// Creates a new IAM user for your AWS account.
  ///
  ///  For information about limitations on the number of IAM users you can
  /// create, see [Limitations on IAM
  /// Entities](https://docs.aws.amazon.com/IAM/latest/UserGuide/LimitationsOnEntities.html)
  /// in the _IAM User Guide_.
  Future<void> createUser(String userName,
      {String path, String permissionsBoundary, List<Tag> tags}) async {}

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
  Future<void> createVirtualMfaDevice(String virtualMfaDeviceName,
      {String path}) async {}

  /// Deactivates the specified MFA device and removes it from association with
  /// the user name for which it was originally enabled.
  ///
  /// For more information about creating and working with virtual MFA devices,
  /// go to [Enabling a Virtual Multi-factor Authentication (MFA)
  /// Device](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_VirtualMFA.html)
  /// in the _IAM User Guide_.
  Future<void> deactivateMfaDevice(
      {@required String userName, @required String serialNumber}) async {}

  /// Deletes the access key pair associated with the specified IAM user.
  ///
  /// If you do not specify a user name, IAM determines the user name implicitly
  /// based on the AWS access key ID signing the request. This operation works
  /// for access keys under the AWS account. Consequently, you can use this
  /// operation to manage AWS account root user credentials even if the AWS
  /// account has no associated users.
  Future<void> deleteAccessKey(String accessKeyId, {String userName}) async {}

  ///  Deletes the specified AWS account alias. For information about using an
  /// AWS account alias, see [Using an Alias for Your AWS Account
  /// ID](https://docs.aws.amazon.com/IAM/latest/UserGuide/AccountAlias.html) in
  /// the _IAM User Guide_.
  Future<void> deleteAccountAlias(String accountAlias) async {}

  /// Deletes the password policy for the AWS account. There are no parameters.
  Future<void> deleteAccountPasswordPolicy() async {}

  /// Deletes the specified IAM group. The group must not contain any users or
  /// have any attached policies.
  Future<void> deleteGroup(String groupName) async {}

  /// Deletes the specified inline policy that is embedded in the specified IAM
  /// group.
  ///
  /// A group can also have managed policies attached to it. To detach a managed
  /// policy from a group, use DetachGroupPolicy. For more information about
  /// policies, refer to [Managed Policies and Inline
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html)
  /// in the _IAM User Guide_.
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
  Future<void> deleteInstanceProfile(String instanceProfileName) async {}

  /// Deletes the password for the specified IAM user, which terminates the
  /// user's ability to access AWS services through the AWS Management Console.
  ///
  ///   Deleting a user's password does not prevent a user from accessing AWS
  /// through the command line interface or the API. To prevent all user access,
  /// you must also either make any access keys inactive or delete them. For
  /// more information about making keys inactive or deleting them, see
  /// UpdateAccessKey and DeleteAccessKey.
  Future<void> deleteLoginProfile(String userName) async {}

  /// Deletes an OpenID Connect identity provider (IdP) resource object in IAM.
  ///
  /// Deleting an IAM OIDC provider resource does not update any roles that
  /// reference the provider as a principal in their trust policies. Any attempt
  /// to assume a role that references a deleted provider fails.
  ///
  /// This operation is idempotent; it does not fail or return an error if you
  /// call the operation for a provider that does not exist.
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
  Future<void> deleteRole(String roleName) async {}

  /// Deletes the permissions boundary for the specified IAM role.
  ///
  ///
  ///
  /// Deleting the permissions boundary for a role might increase its
  /// permissions. For example, it might allow anyone who assumes the role to
  /// perform all the actions granted in its permissions policies.
  Future<void> deleteRolePermissionsBoundary(String roleName) async {}

  /// Deletes the specified inline policy that is embedded in the specified IAM
  /// role.
  ///
  /// A role can also have managed policies attached to it. To detach a managed
  /// policy from a role, use DetachRolePolicy. For more information about
  /// policies, refer to [Managed Policies and Inline
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html)
  /// in the _IAM User Guide_.
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
  Future<void> deleteSamlProvider(String samlProviderArn) async {}

  /// Deletes the specified SSH public key.
  ///
  /// The SSH public key deleted by this operation is used only for
  /// authenticating the associated IAM user to an AWS CodeCommit repository.
  /// For more information about using SSH keys to authenticate to an AWS
  /// CodeCommit repository, see [Set up AWS CodeCommit for SSH
  /// Connections](https://docs.aws.amazon.com/codecommit/latest/userguide/setting-up-credentials-ssh.html)
  /// in the _AWS CodeCommit User Guide_.
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
  Future<void> deleteServiceLinkedRole(String roleName) async {}

  /// Deletes the specified service-specific credential.
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
  Future<void> deleteUser(String userName) async {}

  /// Deletes the permissions boundary for the specified IAM user.
  ///
  ///
  ///
  /// Deleting the permissions boundary for a user might increase its
  /// permissions by allowing the user to perform all the actions granted in its
  /// permissions policies.
  Future<void> deleteUserPermissionsBoundary(String userName) async {}

  /// Deletes the specified inline policy that is embedded in the specified IAM
  /// user.
  ///
  /// A user can also have managed policies attached to it. To detach a managed
  /// policy from a user, use DetachUserPolicy. For more information about
  /// policies, refer to [Managed Policies and Inline
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html)
  /// in the _IAM User Guide_.
  Future<void> deleteUserPolicy(
      {@required String userName, @required String policyName}) async {}

  /// Deletes a virtual MFA device.
  ///
  ///   You must deactivate a user's virtual MFA device before you can delete
  /// it. For information about deactivating MFA devices, see
  /// DeactivateMFADevice.
  Future<void> deleteVirtualMfaDevice(String serialNumber) async {}

  /// Removes the specified managed policy from the specified IAM group.
  ///
  /// A group can also have inline policies embedded with it. To delete an
  /// inline policy, use the DeleteGroupPolicy API. For information about
  /// policies, see [Managed Policies and Inline
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html)
  /// in the _IAM User Guide_.
  Future<void> detachGroupPolicy(
      {@required String groupName, @required String policyArn}) async {}

  /// Removes the specified managed policy from the specified role.
  ///
  /// A role can also have inline policies embedded with it. To delete an inline
  /// policy, use the DeleteRolePolicy API. For information about policies, see
  /// [Managed Policies and Inline
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html)
  /// in the _IAM User Guide_.
  Future<void> detachRolePolicy(
      {@required String roleName, @required String policyArn}) async {}

  /// Removes the specified managed policy from the specified user.
  ///
  /// A user can also have inline policies embedded with it. To delete an inline
  /// policy, use the DeleteUserPolicy API. For information about policies, see
  /// [Managed Policies and Inline
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html)
  /// in the _IAM User Guide_.
  Future<void> detachUserPolicy(
      {@required String userName, @required String policyArn}) async {}

  /// Enables the specified MFA device and associates it with the specified IAM
  /// user. When enabled, the MFA device is required for every subsequent login
  /// by the IAM user associated with the device.
  Future<void> enableMfaDevice(
      {@required String userName,
      @required String serialNumber,
      @required String authenticationCode1,
      @required String authenticationCode2}) async {}

  ///  Generates a credential report for the AWS account. For more information
  /// about the credential report, see [Getting Credential
  /// Reports](https://docs.aws.amazon.com/IAM/latest/UserGuide/credential-reports.html)
  /// in the _IAM User Guide_.
  Future<void> generateCredentialReport() async {}

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
  Future<void> generateOrganizationsAccessReport(String entityPath,
      {String organizationsPolicyId}) async {}

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
  Future<void> generateServiceLastAccessedDetails(String arn) async {}

  /// Retrieves information about when the specified access key was last used.
  /// The information includes the date and time of last use, along with the AWS
  /// service and Region that were specified in the last request made with that
  /// key.
  Future<void> getAccessKeyLastUsed(String accessKeyId) async {}

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
  Future<void> getAccountAuthorizationDetails(
      {List<String> filter, int maxItems, String marker}) async {}

  /// Retrieves the password policy for the AWS account. For more information
  /// about using a password policy, go to [Managing an IAM Password
  /// Policy](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_ManagingPasswordPolicies.html).
  Future<void> getAccountPasswordPolicy() async {}

  /// Retrieves information about IAM entity usage and IAM quotas in the AWS
  /// account.
  ///
  ///  For information about limitations on IAM entities, see [Limitations on
  /// IAM
  /// Entities](https://docs.aws.amazon.com/IAM/latest/UserGuide/LimitationsOnEntities.html)
  /// in the _IAM User Guide_.
  Future<void> getAccountSummary() async {}

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
  Future<void> getContextKeysForCustomPolicy(
      List<String> policyInputList) async {}

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
  Future<void> getContextKeysForPrincipalPolicy(String policySourceArn,
      {List<String> policyInputList}) async {}

  ///  Retrieves a credential report for the AWS account. For more information
  /// about the credential report, see [Getting Credential
  /// Reports](https://docs.aws.amazon.com/IAM/latest/UserGuide/credential-reports.html)
  /// in the _IAM User Guide_.
  Future<void> getCredentialReport() async {}

  ///  Returns a list of IAM users that are in the specified IAM group. You can
  /// paginate the results using the `MaxItems` and `Marker` parameters.
  Future<void> getGroup(String groupName,
      {String marker, int maxItems}) async {}

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
  Future<void> getGroupPolicy(
      {@required String groupName, @required String policyName}) async {}

  ///  Retrieves information about the specified instance profile, including the
  /// instance profile's path, GUID, ARN, and role. For more information about
  /// instance profiles, see [About Instance
  /// Profiles](https://docs.aws.amazon.com/IAM/latest/UserGuide/AboutInstanceProfiles.html)
  /// in the _IAM User Guide_.
  Future<void> getInstanceProfile(String instanceProfileName) async {}

  /// Retrieves the user name and password-creation date for the specified IAM
  /// user. If the user has not been assigned a password, the operation returns
  /// a 404 (`NoSuchEntity`) error.
  Future<void> getLoginProfile(String userName) async {}

  /// Returns information about the specified OpenID Connect (OIDC) provider
  /// resource object in IAM.
  Future<void> getOpenIDConnectProvider(
      String openIDConnectProviderArn) async {}

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
  Future<void> getOrganizationsAccessReport(String jobId,
      {int maxItems, String marker, String sortKey}) async {}

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
  Future<void> getPolicy(String policyArn) async {}

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
  Future<void> getPolicyVersion(
      {@required String policyArn, @required String versionId}) async {}

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
  Future<void> getRole(String roleName) async {}

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
  Future<void> getRolePolicy(
      {@required String roleName, @required String policyName}) async {}

  /// Returns the SAML provider metadocument that was uploaded when the IAM SAML
  /// provider resource object was created or updated.
  ///
  ///
  ///
  /// This operation requires [Signature Version
  /// 4](https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html).
  Future<void> getSamlProvider(String samlProviderArn) async {}

  /// Retrieves the specified SSH public key, including metadata about the key.
  ///
  /// The SSH public key retrieved by this operation is used only for
  /// authenticating the associated IAM user to an AWS CodeCommit repository.
  /// For more information about using SSH keys to authenticate to an AWS
  /// CodeCommit repository, see [Set up AWS CodeCommit for SSH
  /// Connections](https://docs.aws.amazon.com/codecommit/latest/userguide/setting-up-credentials-ssh.html)
  /// in the _AWS CodeCommit User Guide_.
  Future<void> getSshPublicKey(
      {@required String userName,
      @required String sshPublicKeyId,
      @required String encoding}) async {}

  /// Retrieves information about the specified server certificate stored in
  /// IAM.
  ///
  /// For more information about working with server certificates, see [Working
  /// with Server
  /// Certificates](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_server-certs.html)
  /// in the _IAM User Guide_. This topic includes a list of AWS services that
  /// can use the server certificates that you manage with IAM.
  Future<void> getServerCertificate(String serverCertificateName) async {}

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
  Future<void> getServiceLastAccessedDetails(String jobId,
      {int maxItems, String marker}) async {}

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
  Future<void> getServiceLastAccessedDetailsWithEntities(
      {@required String jobId,
      @required String serviceNamespace,
      int maxItems,
      String marker}) async {}

  /// Retrieves the status of your service-linked role deletion. After you use
  /// the DeleteServiceLinkedRole API operation to submit a service-linked role
  /// for deletion, you can use the `DeletionTaskId` parameter in
  /// `GetServiceLinkedRoleDeletionStatus` to check the status of the deletion.
  /// If the deletion fails, this operation returns the reason that it failed,
  /// if that information is returned by the service.
  Future<void> getServiceLinkedRoleDeletionStatus(
      String deletionTaskId) async {}

  /// Retrieves information about the specified IAM user, including the user's
  /// creation date, path, unique ID, and ARN.
  ///
  /// If you do not specify a user name, IAM determines the user name implicitly
  /// based on the AWS access key ID used to sign the request to this API.
  Future<void> getUser({String userName}) async {}

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
  Future<void> getUserPolicy(
      {@required String userName, @required String policyName}) async {}

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
  Future<void> listAccessKeys(
      {String userName, String marker, int maxItems}) async {}

  /// Lists the account alias associated with the AWS account (Note: you can
  /// have only one). For information about using an AWS account alias, see
  /// [Using an Alias for Your AWS Account
  /// ID](https://docs.aws.amazon.com/IAM/latest/UserGuide/AccountAlias.html) in
  /// the _IAM User Guide_.
  Future<void> listAccountAliases({String marker, int maxItems}) async {}

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
  Future<void> listAttachedGroupPolicies(String groupName,
      {String pathPrefix, String marker, int maxItems}) async {}

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
  Future<void> listAttachedRolePolicies(String roleName,
      {String pathPrefix, String marker, int maxItems}) async {}

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
  Future<void> listAttachedUserPolicies(String userName,
      {String pathPrefix, String marker, int maxItems}) async {}

  /// Lists all IAM users, groups, and roles that the specified managed policy
  /// is attached to.
  ///
  /// You can use the optional `EntityFilter` parameter to limit the results to
  /// a particular type of entity (users, groups, or roles). For example, to
  /// list only the roles that are attached to the specified policy, set
  /// `EntityFilter` to `Role`.
  ///
  /// You can paginate the results using the `MaxItems` and `Marker` parameters.
  Future<void> listEntitiesForPolicy(String policyArn,
      {String entityFilter,
      String pathPrefix,
      String policyUsageFilter,
      String marker,
      int maxItems}) async {}

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
  Future<void> listGroupPolicies(String groupName,
      {String marker, int maxItems}) async {}

  /// Lists the IAM groups that have the specified path prefix.
  ///
  ///  You can paginate the results using the `MaxItems` and `Marker`
  /// parameters.
  Future<void> listGroups(
      {String pathPrefix, String marker, int maxItems}) async {}

  /// Lists the IAM groups that the specified IAM user belongs to.
  ///
  /// You can paginate the results using the `MaxItems` and `Marker` parameters.
  Future<void> listGroupsForUser(String userName,
      {String marker, int maxItems}) async {}

  /// Lists the instance profiles that have the specified path prefix. If there
  /// are none, the operation returns an empty list. For more information about
  /// instance profiles, go to [About Instance
  /// Profiles](https://docs.aws.amazon.com/IAM/latest/UserGuide/AboutInstanceProfiles.html).
  ///
  /// You can paginate the results using the `MaxItems` and `Marker` parameters.
  Future<void> listInstanceProfiles(
      {String pathPrefix, String marker, int maxItems}) async {}

  /// Lists the instance profiles that have the specified associated IAM role.
  /// If there are none, the operation returns an empty list. For more
  /// information about instance profiles, go to [About Instance
  /// Profiles](https://docs.aws.amazon.com/IAM/latest/UserGuide/AboutInstanceProfiles.html).
  ///
  /// You can paginate the results using the `MaxItems` and `Marker` parameters.
  Future<void> listInstanceProfilesForRole(String roleName,
      {String marker, int maxItems}) async {}

  /// Lists the MFA devices for an IAM user. If the request includes a IAM user
  /// name, then this operation lists all the MFA devices associated with the
  /// specified user. If you do not specify a user name, IAM determines the user
  /// name implicitly based on the AWS access key ID signing the request for
  /// this API.
  ///
  /// You can paginate the results using the `MaxItems` and `Marker` parameters.
  Future<void> listMfaDevices(
      {String userName, String marker, int maxItems}) async {}

  /// Lists information about the IAM OpenID Connect (OIDC) provider resource
  /// objects defined in the AWS account.
  Future<void> listOpenIDConnectProviders() async {}

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
  Future<void> listPolicies(
      {String scope,
      bool onlyAttached,
      String pathPrefix,
      String policyUsageFilter,
      String marker,
      int maxItems}) async {}

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
  Future<void> listPoliciesGrantingServiceAccess(
      {String marker,
      @required String arn,
      @required List<String> serviceNamespaces}) async {}

  /// Lists information about the versions of the specified managed policy,
  /// including the version that is currently set as the policy's default
  /// version.
  ///
  /// For more information about managed policies, see [Managed Policies and
  /// Inline
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html)
  /// in the _IAM User Guide_.
  Future<void> listPolicyVersions(String policyArn,
      {String marker, int maxItems}) async {}

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
  Future<void> listRolePolicies(String roleName,
      {String marker, int maxItems}) async {}

  /// Lists the tags that are attached to the specified role. The returned list
  /// of tags is sorted by tag key. For more information about tagging, see
  /// [Tagging IAM
  /// Identities](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html)
  /// in the _IAM User Guide_.
  Future<void> listRoleTags(String roleName,
      {String marker, int maxItems}) async {}

  /// Lists the IAM roles that have the specified path prefix. If there are
  /// none, the operation returns an empty list. For more information about
  /// roles, go to [Working with
  /// Roles](https://docs.aws.amazon.com/IAM/latest/UserGuide/WorkingWithRoles.html).
  ///
  /// You can paginate the results using the `MaxItems` and `Marker` parameters.
  Future<void> listRoles(
      {String pathPrefix, String marker, int maxItems}) async {}

  /// Lists the SAML provider resource objects defined in IAM in the account.
  ///
  ///   This operation requires [Signature Version
  /// 4](https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html).
  Future<void> listSamlProviders() async {}

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
  Future<void> listSshPublicKeys(
      {String userName, String marker, int maxItems}) async {}

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
  Future<void> listServerCertificates(
      {String pathPrefix, String marker, int maxItems}) async {}

  /// Returns information about the service-specific credentials associated with
  /// the specified IAM user. If none exists, the operation returns an empty
  /// list. The service-specific credentials returned by this operation are used
  /// only for authenticating the IAM user to a specific service. For more
  /// information about using service-specific credentials to authenticate to an
  /// AWS service, see [Set Up service-specific
  /// credentials](https://docs.aws.amazon.com/codecommit/latest/userguide/setting-up-gc.html)
  /// in the AWS CodeCommit User Guide.
  Future<void> listServiceSpecificCredentials(
      {String userName, String serviceName}) async {}

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
  Future<void> listSigningCertificates(
      {String userName, String marker, int maxItems}) async {}

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
  Future<void> listUserPolicies(String userName,
      {String marker, int maxItems}) async {}

  /// Lists the tags that are attached to the specified user. The returned list
  /// of tags is sorted by tag key. For more information about tagging, see
  /// [Tagging IAM
  /// Identities](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html)
  /// in the _IAM User Guide_.
  Future<void> listUserTags(String userName,
      {String marker, int maxItems}) async {}

  /// Lists the IAM users that have the specified path prefix. If no path prefix
  /// is specified, the operation returns all users in the AWS account. If there
  /// are none, the operation returns an empty list.
  ///
  /// You can paginate the results using the `MaxItems` and `Marker` parameters.
  Future<void> listUsers(
      {String pathPrefix, String marker, int maxItems}) async {}

  /// Lists the virtual MFA devices defined in the AWS account by assignment
  /// status. If you do not specify an assignment status, the operation returns
  /// a list of all virtual MFA devices. Assignment status can be `Assigned`,
  /// `Unassigned`, or `Any`.
  ///
  /// You can paginate the results using the `MaxItems` and `Marker` parameters.
  Future<void> listVirtualMfaDevices(
      {String assignmentStatus, String marker, int maxItems}) async {}

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
  Future<void> removeRoleFromInstanceProfile(
      {@required String instanceProfileName,
      @required String roleName}) async {}

  /// Removes the specified user from the specified group.
  Future<void> removeUserFromGroup(
      {@required String groupName, @required String userName}) async {}

  /// Resets the password for a service-specific credential. The new password is
  /// AWS generated and cryptographically strong. It cannot be configured by the
  /// user. Resetting the password immediately invalidates the previous password
  /// associated with this user.
  Future<void> resetServiceSpecificCredential(
      String serviceSpecificCredentialId,
      {String userName}) async {}

  /// Synchronizes the specified MFA device with its IAM resource object on the
  /// AWS servers.
  ///
  /// For more information about creating and working with virtual MFA devices,
  /// go to [Using a Virtual MFA
  /// Device](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_VirtualMFA.html)
  /// in the _IAM User Guide_.
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
  Future<void> simulateCustomPolicy(
      {@required List<String> policyInputList,
      @required List<String> actionNames,
      List<String> resourceArns,
      String resourcePolicy,
      String resourceOwner,
      String callerArn,
      List<ContextEntry> contextEntries,
      String resourceHandlingOption,
      int maxItems,
      String marker}) async {}

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
  Future<void> simulatePrincipalPolicy(
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
      String marker}) async {}

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
  Future<void> tagUser(
      {@required String userName, @required List<Tag> tags}) async {}

  /// Removes the specified tags from the role. For more information about
  /// tagging, see [Tagging IAM
  /// Identities](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html)
  /// in the _IAM User Guide_.
  Future<void> untagRole(
      {@required String roleName, @required List<String> tagKeys}) async {}

  /// Removes the specified tags from the user. For more information about
  /// tagging, see [Tagging IAM
  /// Identities](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html)
  /// in the _IAM User Guide_.
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
  Future<void> updateGroup(String groupName,
      {String newPath, String newGroupName}) async {}

  /// Changes the password for the specified IAM user.
  ///
  /// IAM users can change their own passwords by calling ChangePassword. For
  /// more information about modifying passwords, see [Managing
  /// Passwords](https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_ManagingLogins.html)
  /// in the _IAM User Guide_.
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
  Future<void> updateOpenIDConnectProviderThumbprint(
      {@required String openIDConnectProviderArn,
      @required List<String> thumbprintList}) async {}

  /// Updates the description or maximum session duration setting of a role.
  Future<void> updateRole(String roleName,
      {String description, int maxSessionDuration}) async {}

  /// Use UpdateRole instead.
  ///
  /// Modifies only the description of a role. This operation performs the same
  /// function as the `Description` parameter in the `UpdateRole` operation.
  Future<void> updateRoleDescription(
      {@required String roleName, @required String description}) async {}

  /// Updates the metadata document for an existing SAML provider resource
  /// object.
  ///
  ///
  ///
  /// This operation requires [Signature Version
  /// 4](https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html).
  Future<void> updateSamlProvider(
      {@required String samlMetadataDocument,
      @required String samlProviderArn}) async {}

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
  Future<void> updateServerCertificate(String serverCertificateName,
      {String newPath, String newServerCertificateName}) async {}

  /// Sets the status of a service-specific credential to `Active` or
  /// `Inactive`. Service-specific credentials that are inactive cannot be used
  /// for authentication to the service. This operation can be used to disable a
  /// user's service-specific credential as part of a credential rotation work
  /// flow.
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
  Future<void> uploadSshPublicKey(
      {@required String userName, @required String sshPublicKeyBody}) async {}

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
  Future<void> uploadServerCertificate(
      {String path,
      @required String serverCertificateName,
      @required String certificateBody,
      @required String privateKey,
      String certificateChain}) async {}

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
  Future<void> uploadSigningCertificate(String certificateBody,
      {String userName}) async {}
}

class AccessDetail {}

class AccessKey {}

class AccessKeyLastUsed {}

class AccessKeyMetadata {}

class AttachedPermissionsBoundary {}

class AttachedPolicy {}

class ContextEntry {}

class CreateAccessKeyResponse {}

class CreateGroupResponse {}

class CreateInstanceProfileResponse {}

class CreateLoginProfileResponse {}

class CreateOpenIDConnectProviderResponse {}

class CreatePolicyResponse {}

class CreatePolicyVersionResponse {}

class CreateRoleResponse {}

class CreateSamlProviderResponse {}

class CreateServiceLinkedRoleResponse {}

class CreateServiceSpecificCredentialResponse {}

class CreateUserResponse {}

class CreateVirtualMfaDeviceResponse {}

class DeleteServiceLinkedRoleResponse {}

class DeletionTaskFailureReasonType {}

class EntityDetails {}

class EntityInfo {}

class ErrorDetails {}

class EvaluationResult {}

class GenerateCredentialReportResponse {}

class GenerateOrganizationsAccessReportResponse {}

class GenerateServiceLastAccessedDetailsResponse {}

class GetAccessKeyLastUsedResponse {}

class GetAccountAuthorizationDetailsResponse {}

class GetAccountPasswordPolicyResponse {}

class GetAccountSummaryResponse {}

class GetContextKeysForPolicyResponse {}

class GetCredentialReportResponse {}

class GetGroupPolicyResponse {}

class GetGroupResponse {}

class GetInstanceProfileResponse {}

class GetLoginProfileResponse {}

class GetOpenIDConnectProviderResponse {}

class GetOrganizationsAccessReportResponse {}

class GetPolicyResponse {}

class GetPolicyVersionResponse {}

class GetRolePolicyResponse {}

class GetRoleResponse {}

class GetSamlProviderResponse {}

class GetSshPublicKeyResponse {}

class GetServerCertificateResponse {}

class GetServiceLastAccessedDetailsResponse {}

class GetServiceLastAccessedDetailsWithEntitiesResponse {}

class GetServiceLinkedRoleDeletionStatusResponse {}

class GetUserPolicyResponse {}

class GetUserResponse {}

class Group {}

class GroupDetail {}

class InstanceProfile {}

class ListAccessKeysResponse {}

class ListAccountAliasesResponse {}

class ListAttachedGroupPoliciesResponse {}

class ListAttachedRolePoliciesResponse {}

class ListAttachedUserPoliciesResponse {}

class ListEntitiesForPolicyResponse {}

class ListGroupPoliciesResponse {}

class ListGroupsForUserResponse {}

class ListGroupsResponse {}

class ListInstanceProfilesForRoleResponse {}

class ListInstanceProfilesResponse {}

class ListMfaDevicesResponse {}

class ListOpenIDConnectProvidersResponse {}

class ListPoliciesGrantingServiceAccessEntry {}

class ListPoliciesGrantingServiceAccessResponse {}

class ListPoliciesResponse {}

class ListPolicyVersionsResponse {}

class ListRolePoliciesResponse {}

class ListRoleTagsResponse {}

class ListRolesResponse {}

class ListSamlProvidersResponse {}

class ListSshPublicKeysResponse {}

class ListServerCertificatesResponse {}

class ListServiceSpecificCredentialsResponse {}

class ListSigningCertificatesResponse {}

class ListUserPoliciesResponse {}

class ListUserTagsResponse {}

class ListUsersResponse {}

class ListVirtualMfaDevicesResponse {}

class LoginProfile {}

class MfaDevice {}

class ManagedPolicyDetail {}

class OpenIDConnectProviderListEntry {}

class OrganizationsDecisionDetail {}

class PasswordPolicy {}

class Policy {}

class PolicyDetail {}

class PolicyGrantingServiceAccess {}

class PolicyGroup {}

class PolicyRole {}

class PolicyUser {}

class PolicyVersion {}

class Position {}

class ResetServiceSpecificCredentialResponse {}

class ResourceSpecificResult {}

class Role {}

class RoleDetail {}

class RoleUsageType {}

class SamlProviderListEntry {}

class SshPublicKey {}

class SshPublicKeyMetadata {}

class ServerCertificate {}

class ServerCertificateMetadata {}

class ServiceLastAccessed {}

class ServiceSpecificCredential {}

class ServiceSpecificCredentialMetadata {}

class SigningCertificate {}

class SimulatePolicyResponse {}

class Statement {}

class Tag {}

class UpdateRoleDescriptionResponse {}

class UpdateRoleResponse {}

class UpdateSamlProviderResponse {}

class UploadSshPublicKeyResponse {}

class UploadServerCertificateResponse {}

class UploadSigningCertificateResponse {}

class User {}

class UserDetail {}

class VirtualMfaDevice {}
