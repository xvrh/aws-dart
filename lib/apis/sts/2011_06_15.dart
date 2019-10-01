import 'package:meta/meta.dart';

/// AWS Security Token Service
///
/// The AWS Security Token Service (STS) is a web service that enables you to
/// request temporary, limited-privilege credentials for AWS Identity and Access
/// Management (IAM) users or for users that you authenticate (federated users).
/// This guide provides descriptions of the STS API. For more detailed
/// information about using this service, go to [Temporary Security
/// Credentials](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp.html).
///
/// For information about setting up signatures and authorization through the
/// API, go to [Signing AWS API
/// Requests](https://docs.aws.amazon.com/general/latest/gr/signing_aws_api_requests.html)
/// in the _AWS General Reference_. For general information about the Query API,
/// go to [Making Query
/// Requests](https://docs.aws.amazon.com/IAM/latest/UserGuide/IAM_UsingQueryAPI.html)
/// in _Using IAM_. For information about using security tokens with other AWS
/// products, go to [AWS Services That Work with
/// IAM](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-services-that-work-with-iam.html)
/// in the _IAM User Guide_.
///
/// If you're new to AWS and need additional technical information about a
/// specific AWS product, you can find the product's technical documentation at
/// [http://aws.amazon.com/documentation/](http://aws.amazon.com/documentation/).
///
///  **Endpoints**
///
/// By default, AWS Security Token Service (STS) is available as a global
/// service, and all AWS STS requests go to a single endpoint at
/// `https://sts.amazonaws.com`. Global requests map to the US East (N.
/// Virginia) region. AWS recommends using Regional AWS STS endpoints instead of
/// the global endpoint to reduce latency, build in redundancy, and increase
/// session token validity. For more information, see [Managing AWS STS in an
/// AWS
/// Region](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_enable-regions.html)
/// in the _IAM User Guide_.
///
/// Most AWS Regions are enabled for operations in all AWS services by default.
/// Those Regions are automatically activated for use with AWS STS. Some
/// Regions, such as Asia Pacific (Hong Kong), must be manually enabled. To
/// learn more about enabling and disabling AWS Regions, see [Managing AWS
/// Regions](https://docs.aws.amazon.com/general/latest/gr/rande-manage.html) in
/// the _AWS General Reference_. When you enable these AWS Regions, they are
/// automatically activated for use with AWS STS. You cannot activate the STS
/// endpoint for a Region that is disabled. Tokens that are valid in all AWS
/// Regions are longer than tokens that are valid in Regions that are enabled by
/// default. Changing this setting might affect existing systems where you
/// temporarily store tokens. For more information, see [Managing Global
/// Endpoint Session
/// Tokens](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_enable-regions.html#sts-regions-manage-tokens)
/// in the _IAM User Guide_.
///
/// After you activate a Region for use with AWS STS, you can direct AWS STS API
/// calls to that Region. AWS STS recommends that you provide both the Region
/// and endpoint when you make calls to a Regional endpoint. You can provide the
/// Region alone for manually enabled Regions, such as Asia Pacific (Hong Kong).
/// In this case, the calls are directed to the STS Regional endpoint. However,
/// if you provide the Region alone for Regions enabled by default, the calls
/// are directed to the global endpoint of `https://sts.amazonaws.com`.
///
/// To view the list of AWS STS endpoints and whether they are active by
/// default, see [Writing Code to Use AWS STS
/// Regions](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_enable-regions.html#id_credentials_temp_enable-regions_writing_code)
/// in the _IAM User Guide_.
///
///  **Recording API requests**
///
/// STS supports AWS CloudTrail, which is a service that records AWS calls for
/// your AWS account and delivers log files to an Amazon S3 bucket. By using
/// information collected by CloudTrail, you can determine what requests were
/// successfully made to STS, who made the request, when it was made, and so on.
///
/// If you activate AWS STS endpoints in Regions other than the default global
/// endpoint, then you must also turn on CloudTrail logging in those Regions.
/// This is necessary to record any AWS STS API calls that are made in those
/// Regions. For more information, see [Turning On CloudTrail in Additional
/// Regions](https://docs.aws.amazon.com/awscloudtrail/latest/userguide/aggregating_logs_regions_turn_on_ct.html)
/// in the _AWS CloudTrail User Guide_.
///
/// AWS Security Token Service (STS) is a global service with a single endpoint
/// at `https://sts.amazonaws.com`. Calls to this endpoint are logged as calls
/// to a global service. However, because this endpoint is physically located in
/// the US East (N. Virginia) Region, your logs list `us-east-1` as the event
/// Region. CloudTrail does not write these logs to the US East (Ohio) Region
/// unless you choose to include global service logs in that Region. CloudTrail
/// writes calls to all Regional endpoints to their respective Regions. For
/// example, calls to sts.us-east-2.amazonaws.com are published to the US East
/// (Ohio) Region and calls to sts.eu-central-1.amazonaws.com are published to
/// the EU (Frankfurt) Region.
///
/// To learn more about CloudTrail, including how to turn it on and find your
/// log files, see the [AWS CloudTrail User
/// Guide](https://docs.aws.amazon.com/awscloudtrail/latest/userguide/what_is_cloud_trail_top_level.html).
class StsApi {
  /// Returns a set of temporary security credentials that you can use to access
  /// AWS resources that you might not normally have access to. These temporary
  /// credentials consist of an access key ID, a secret access key, and a
  /// security token. Typically, you use `AssumeRole` within your account or for
  /// cross-account access. For a comparison of `AssumeRole` with other API
  /// operations that produce temporary credentials, see [Requesting Temporary
  /// Security
  /// Credentials](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_request.html)
  /// and [Comparing the AWS STS API
  /// operations](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_request.html#stsapi_comparison)
  /// in the _IAM User Guide_.
  ///
  ///  You cannot use AWS account root user credentials to call `AssumeRole`.
  /// You must use credentials for an IAM user or an IAM role to call
  /// `AssumeRole`.
  ///
  /// For cross-account access, imagine that you own multiple accounts and need
  /// to access resources in each account. You could create long-term
  /// credentials in each account to access those resources. However, managing
  /// all those credentials and remembering which one can access which account
  /// can be time consuming. Instead, you can create one set of long-term
  /// credentials in one account. Then use temporary security credentials to
  /// access all the other accounts by assuming roles in those accounts. For
  /// more information about roles, see [IAM
  /// Roles](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html) in
  /// the _IAM User Guide_.
  ///
  /// By default, the temporary security credentials created by `AssumeRole`
  /// last for one hour. However, you can use the optional `DurationSeconds`
  /// parameter to specify the duration of your session. You can provide a value
  /// from 900 seconds (15 minutes) up to the maximum session duration setting
  /// for the role. This setting can have a value from 1 hour to 12 hours. To
  /// learn how to view the maximum value for your role, see [View the Maximum
  /// Session Duration Setting for a
  /// Role](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use.html#id_roles_use_view-role-max-session)
  /// in the _IAM User Guide_. The maximum session duration limit applies when
  /// you use the `AssumeRole*` API operations or the `assume-role*` CLI
  /// commands. However the limit does not apply when you use those operations
  /// to create a console URL. For more information, see [Using IAM
  /// Roles](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use.html)
  /// in the _IAM User Guide_.
  ///
  /// The temporary security credentials created by `AssumeRole` can be used to
  /// make API calls to any AWS service with the following exception: You cannot
  /// call the AWS STS `GetFederationToken` or `GetSessionToken` API operations.
  ///
  /// (Optional) You can pass inline or managed [session
  /// policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session)
  /// to this operation. You can pass a single JSON policy document to use as an
  /// inline session policy. You can also specify up to 10 managed policies to
  /// use as managed session policies. The plain text that you use for both
  /// inline and managed session policies shouldn't exceed 2048 characters.
  /// Passing policies to this operation returns new temporary credentials. The
  /// resulting session's permissions are the intersection of the role's
  /// identity-based policy and the session policies. You can use the role's
  /// temporary credentials in subsequent AWS API calls to access resources in
  /// the account that owns the role. You cannot use session policies to grant
  /// more permissions than those allowed by the identity-based policy of the
  /// role that is being assumed. For more information, see [Session
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session)
  /// in the _IAM User Guide_.
  ///
  /// To assume a role from a different account, your AWS account must be
  /// trusted by the role. The trust relationship is defined in the role's trust
  /// policy when the role is created. That trust policy states which accounts
  /// are allowed to delegate that access to users in the account.
  ///
  /// A user who wants to access a role in a different account must also have
  /// permissions that are delegated from the user account administrator. The
  /// administrator must attach a policy that allows the user to call
  /// `AssumeRole` for the ARN of the role in the other account. If the user is
  /// in the same account as the role, then you can do either of the following:
  ///
  /// *   Attach a policy to the user (identical to the previous user in a
  /// different account).
  ///
  /// *   Add the user as a principal directly in the role's trust policy.
  ///
  ///
  /// In this case, the trust policy acts as an IAM resource-based policy. Users
  /// in the same account as the role do not need explicit permission to assume
  /// the role. For more information about trust policies and resource-based
  /// policies, see [IAM
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html)
  /// in the _IAM User Guide_.
  ///
  ///  **Using MFA with AssumeRole**
  ///
  /// (Optional) You can include multi-factor authentication (MFA) information
  /// when you call `AssumeRole`. This is useful for cross-account scenarios to
  /// ensure that the user that assumes the role has been authenticated with an
  /// AWS MFA device. In that scenario, the trust policy of the role being
  /// assumed includes a condition that tests for MFA authentication. If the
  /// caller does not include valid MFA information, the request to assume the
  /// role is denied. The condition in a trust policy that tests for MFA
  /// authentication might look like the following example.
  ///
  ///  `"Condition": {"Bool": {"aws:MultiFactorAuthPresent": true}}`
  ///
  /// For more information, see [Configuring MFA-Protected API
  /// Access](https://docs.aws.amazon.com/IAM/latest/UserGuide/MFAProtectedAPI.html)
  /// in the _IAM User Guide_ guide.
  ///
  /// To use MFA with `AssumeRole`, you pass values for the `SerialNumber` and
  /// `TokenCode` parameters. The `SerialNumber` value identifies the user's
  /// hardware or virtual MFA device. The `TokenCode` is the time-based one-time
  /// password (TOTP) that the MFA device produces.
  ///
  /// [roleArn]: The Amazon Resource Name (ARN) of the role to assume.
  ///
  /// [roleSessionName]: An identifier for the assumed role session.
  ///
  /// Use the role session name to uniquely identify a session when the same
  /// role is assumed by different principals or for different reasons. In
  /// cross-account scenarios, the role session name is visible to, and can be
  /// logged by the account that owns the role. The role session name is also
  /// used in the ARN of the assumed role principal. This means that subsequent
  /// cross-account API requests that use the temporary security credentials
  /// will expose the role session name to the external account in their AWS
  /// CloudTrail logs.
  ///
  /// The regex used to validate this parameter is a string of characters
  /// consisting of upper- and lower-case alphanumeric characters with no
  /// spaces. You can also include underscores or any of the following
  /// characters: =,.@-
  ///
  /// [policyArns]: The Amazon Resource Names (ARNs) of the IAM managed policies
  /// that you want to use as managed session policies. The policies must exist
  /// in the same account as the role.
  ///
  /// This parameter is optional. You can provide up to 10 managed policy ARNs.
  /// However, the plain text that you use for both inline and managed session
  /// policies shouldn't exceed 2048 characters. For more information about
  /// ARNs, see [Amazon Resource Names (ARNs) and AWS Service
  /// Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html)
  /// in the AWS General Reference.
  ///
  ///  The characters in this parameter count towards the 2048 character session
  /// policy guideline. However, an AWS conversion compresses the session
  /// policies into a packed binary format that has a separate limit. This is
  /// the enforced limit. The `PackedPolicySize` response element indicates by
  /// percentage how close the policy is to the upper size limit.
  ///
  /// Passing policies to this operation returns new temporary credentials. The
  /// resulting session's permissions are the intersection of the role's
  /// identity-based policy and the session policies. You can use the role's
  /// temporary credentials in subsequent AWS API calls to access resources in
  /// the account that owns the role. You cannot use session policies to grant
  /// more permissions than those allowed by the identity-based policy of the
  /// role that is being assumed. For more information, see [Session
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session)
  /// in the _IAM User Guide_.
  ///
  /// [policy]: An IAM policy in JSON format that you want to use as an inline
  /// session policy.
  ///
  /// This parameter is optional. Passing policies to this operation returns new
  /// temporary credentials. The resulting session's permissions are the
  /// intersection of the role's identity-based policy and the session policies.
  /// You can use the role's temporary credentials in subsequent AWS API calls
  /// to access resources in the account that owns the role. You cannot use
  /// session policies to grant more permissions than those allowed by the
  /// identity-based policy of the role that is being assumed. For more
  /// information, see [Session
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session)
  /// in the _IAM User Guide_.
  ///
  /// The plain text that you use for both inline and managed session policies
  /// shouldn't exceed 2048 characters. The JSON policy characters can be any
  /// ASCII character from the space character to the end of the valid character
  /// list (\\u0020 through \\u00FF). It can also include the tab (\\u0009),
  /// linefeed (\\u000A), and carriage return (\\u000D) characters.
  ///
  ///
  ///
  /// The characters in this parameter count towards the 2048 character session
  /// policy guideline. However, an AWS conversion compresses the session
  /// policies into a packed binary format that has a separate limit. This is
  /// the enforced limit. The `PackedPolicySize` response element indicates by
  /// percentage how close the policy is to the upper size limit.
  ///
  /// [durationSeconds]: The duration, in seconds, of the role session. The
  /// value can range from 900 seconds (15 minutes) up to the maximum session
  /// duration setting for the role. This setting can have a value from 1 hour
  /// to 12 hours. If you specify a value higher than this setting, the
  /// operation fails. For example, if you specify a session duration of 12
  /// hours, but your administrator set the maximum session duration to 6 hours,
  /// your operation fails. To learn how to view the maximum value for your
  /// role, see [View the Maximum Session Duration Setting for a
  /// Role](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use.html#id_roles_use_view-role-max-session)
  /// in the _IAM User Guide_.
  ///
  /// By default, the value is set to `3600` seconds.
  ///
  ///
  ///
  /// The `DurationSeconds` parameter is separate from the duration of a console
  /// session that you might request using the returned credentials. The request
  /// to the federation endpoint for a console sign-in token takes a
  /// `SessionDuration` parameter that specifies the maximum length of the
  /// console session. For more information, see [Creating a URL that Enables
  /// Federated Users to Access the AWS Management
  /// Console](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_enable-console-custom-url.html)
  /// in the _IAM User Guide_.
  ///
  /// [externalId]: A unique identifier that might be required when you assume a
  /// role in another account. If the administrator of the account to which the
  /// role belongs provided you with an external ID, then provide that value in
  /// the `ExternalId` parameter. This value can be any string, such as a
  /// passphrase or account number. A cross-account role is usually set up to
  /// trust everyone in an account. Therefore, the administrator of the trusting
  /// account might send an external ID to the administrator of the trusted
  /// account. That way, only someone with the ID can assume the role, rather
  /// than everyone in the account. For more information about the external ID,
  /// see [How to Use an External ID When Granting Access to Your AWS Resources
  /// to a Third
  /// Party](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_create_for-user_externalid.html)
  /// in the _IAM User Guide_.
  ///
  /// The regex used to validate this parameter is a string of characters
  /// consisting of upper- and lower-case alphanumeric characters with no
  /// spaces. You can also include underscores or any of the following
  /// characters: =,.@:/-
  ///
  /// [serialNumber]: The identification number of the MFA device that is
  /// associated with the user who is making the `AssumeRole` call. Specify this
  /// value if the trust policy of the role being assumed includes a condition
  /// that requires MFA authentication. The value is either the serial number
  /// for a hardware device (such as `GAHT12345678`) or an Amazon Resource Name
  /// (ARN) for a virtual device (such as `arn:aws:iam::123456789012:mfa/user`).
  ///
  /// The regex used to validate this parameter is a string of characters
  /// consisting of upper- and lower-case alphanumeric characters with no
  /// spaces. You can also include underscores or any of the following
  /// characters: =,.@-
  ///
  /// [tokenCode]: The value provided by the MFA device, if the trust policy of
  /// the role being assumed requires MFA (that is, if the policy includes a
  /// condition that tests for MFA). If the role being assumed requires MFA and
  /// if the `TokenCode` value is missing or expired, the `AssumeRole` call
  /// returns an "access denied" error.
  ///
  /// The format for this parameter, as described by its regex pattern, is a
  /// sequence of six numeric digits.
  Future<AssumeRoleResponse> assumeRole(
      {@required String roleArn,
      @required String roleSessionName,
      List<PolicyDescriptorType> policyArns,
      String policy,
      int durationSeconds,
      String externalId,
      String serialNumber,
      String tokenCode}) async {
    return AssumeRoleResponse.fromJson({});
  }

  /// Returns a set of temporary security credentials for users who have been
  /// authenticated via a SAML authentication response. This operation provides
  /// a mechanism for tying an enterprise identity store or directory to
  /// role-based AWS access without user-specific credentials or configuration.
  /// For a comparison of `AssumeRoleWithSAML` with the other API operations
  /// that produce temporary credentials, see [Requesting Temporary Security
  /// Credentials](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_request.html)
  /// and [Comparing the AWS STS API
  /// operations](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_request.html#stsapi_comparison)
  /// in the _IAM User Guide_.
  ///
  /// The temporary security credentials returned by this operation consist of
  /// an access key ID, a secret access key, and a security token. Applications
  /// can use these temporary security credentials to sign calls to AWS
  /// services.
  ///
  /// By default, the temporary security credentials created by
  /// `AssumeRoleWithSAML` last for one hour. However, you can use the optional
  /// `DurationSeconds` parameter to specify the duration of your session. Your
  /// role session lasts for the duration that you specify, or until the time
  /// specified in the SAML authentication response's `SessionNotOnOrAfter`
  /// value, whichever is shorter. You can provide a `DurationSeconds` value
  /// from 900 seconds (15 minutes) up to the maximum session duration setting
  /// for the role. This setting can have a value from 1 hour to 12 hours. To
  /// learn how to view the maximum value for your role, see [View the Maximum
  /// Session Duration Setting for a
  /// Role](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use.html#id_roles_use_view-role-max-session)
  /// in the _IAM User Guide_. The maximum session duration limit applies when
  /// you use the `AssumeRole*` API operations or the `assume-role*` CLI
  /// commands. However the limit does not apply when you use those operations
  /// to create a console URL. For more information, see [Using IAM
  /// Roles](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use.html)
  /// in the _IAM User Guide_.
  ///
  /// The temporary security credentials created by `AssumeRoleWithSAML` can be
  /// used to make API calls to any AWS service with the following exception:
  /// you cannot call the STS `GetFederationToken` or `GetSessionToken` API
  /// operations.
  ///
  /// (Optional) You can pass inline or managed [session
  /// policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session)
  /// to this operation. You can pass a single JSON policy document to use as an
  /// inline session policy. You can also specify up to 10 managed policies to
  /// use as managed session policies. The plain text that you use for both
  /// inline and managed session policies shouldn't exceed 2048 characters.
  /// Passing policies to this operation returns new temporary credentials. The
  /// resulting session's permissions are the intersection of the role's
  /// identity-based policy and the session policies. You can use the role's
  /// temporary credentials in subsequent AWS API calls to access resources in
  /// the account that owns the role. You cannot use session policies to grant
  /// more permissions than those allowed by the identity-based policy of the
  /// role that is being assumed. For more information, see [Session
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session)
  /// in the _IAM User Guide_.
  ///
  /// Before your application can call `AssumeRoleWithSAML`, you must configure
  /// your SAML identity provider (IdP) to issue the claims required by AWS.
  /// Additionally, you must use AWS Identity and Access Management (IAM) to
  /// create a SAML provider entity in your AWS account that represents your
  /// identity provider. You must also create an IAM role that specifies this
  /// SAML provider in its trust policy.
  ///
  /// Calling `AssumeRoleWithSAML` does not require the use of AWS security
  /// credentials. The identity of the caller is validated by using keys in the
  /// metadata document that is uploaded for the SAML provider entity for your
  /// identity provider.
  ///
  ///  Calling `AssumeRoleWithSAML` can result in an entry in your AWS
  /// CloudTrail logs. The entry includes the value in the `NameID` element of
  /// the SAML assertion. We recommend that you use a `NameIDType` that is not
  /// associated with any personally identifiable information (PII). For
  /// example, you could instead use the Persistent Identifier
  /// (`urn:oasis:names:tc:SAML:2.0:nameid-format:persistent`).
  ///
  /// For more information, see the following resources:
  ///
  /// *    [About SAML 2.0-based
  /// Federation](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_saml.html)
  /// in the _IAM User Guide_.
  ///
  /// *    [Creating SAML Identity
  /// Providers](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_create_saml.html)
  /// in the _IAM User Guide_.
  ///
  /// *    [Configuring a Relying Party and
  /// Claims](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_create_saml_relying-party.html)
  /// in the _IAM User Guide_.
  ///
  /// *    [Creating a Role for SAML 2.0
  /// Federation](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_create_for-idp_saml.html)
  /// in the _IAM User Guide_.
  ///
  /// [roleArn]: The Amazon Resource Name (ARN) of the role that the caller is
  /// assuming.
  ///
  /// [principalArn]: The Amazon Resource Name (ARN) of the SAML provider in IAM
  /// that describes the IdP.
  ///
  /// [samlAssertion]: The base-64 encoded SAML authentication response provided
  /// by the IdP.
  ///
  /// For more information, see [Configuring a Relying Party and Adding
  /// Claims](https://docs.aws.amazon.com/IAM/latest/UserGuide/create-role-saml-IdP-tasks.html)
  /// in the _IAM User Guide_.
  ///
  /// [policyArns]: The Amazon Resource Names (ARNs) of the IAM managed policies
  /// that you want to use as managed session policies. The policies must exist
  /// in the same account as the role.
  ///
  /// This parameter is optional. You can provide up to 10 managed policy ARNs.
  /// However, the plain text that you use for both inline and managed session
  /// policies shouldn't exceed 2048 characters. For more information about
  /// ARNs, see [Amazon Resource Names (ARNs) and AWS Service
  /// Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html)
  /// in the AWS General Reference.
  ///
  ///  The characters in this parameter count towards the 2048 character session
  /// policy guideline. However, an AWS conversion compresses the session
  /// policies into a packed binary format that has a separate limit. This is
  /// the enforced limit. The `PackedPolicySize` response element indicates by
  /// percentage how close the policy is to the upper size limit.
  ///
  /// Passing policies to this operation returns new temporary credentials. The
  /// resulting session's permissions are the intersection of the role's
  /// identity-based policy and the session policies. You can use the role's
  /// temporary credentials in subsequent AWS API calls to access resources in
  /// the account that owns the role. You cannot use session policies to grant
  /// more permissions than those allowed by the identity-based policy of the
  /// role that is being assumed. For more information, see [Session
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session)
  /// in the _IAM User Guide_.
  ///
  /// [policy]: An IAM policy in JSON format that you want to use as an inline
  /// session policy.
  ///
  /// This parameter is optional. Passing policies to this operation returns new
  /// temporary credentials. The resulting session's permissions are the
  /// intersection of the role's identity-based policy and the session policies.
  /// You can use the role's temporary credentials in subsequent AWS API calls
  /// to access resources in the account that owns the role. You cannot use
  /// session policies to grant more permissions than those allowed by the
  /// identity-based policy of the role that is being assumed. For more
  /// information, see [Session
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session)
  /// in the _IAM User Guide_.
  ///
  /// The plain text that you use for both inline and managed session policies
  /// shouldn't exceed 2048 characters. The JSON policy characters can be any
  /// ASCII character from the space character to the end of the valid character
  /// list (\\u0020 through \\u00FF). It can also include the tab (\\u0009),
  /// linefeed (\\u000A), and carriage return (\\u000D) characters.
  ///
  ///
  ///
  /// The characters in this parameter count towards the 2048 character session
  /// policy guideline. However, an AWS conversion compresses the session
  /// policies into a packed binary format that has a separate limit. This is
  /// the enforced limit. The `PackedPolicySize` response element indicates by
  /// percentage how close the policy is to the upper size limit.
  ///
  /// [durationSeconds]: The duration, in seconds, of the role session. Your
  /// role session lasts for the duration that you specify for the
  /// `DurationSeconds` parameter, or until the time specified in the SAML
  /// authentication response's `SessionNotOnOrAfter` value, whichever is
  /// shorter. You can provide a `DurationSeconds` value from 900 seconds (15
  /// minutes) up to the maximum session duration setting for the role. This
  /// setting can have a value from 1 hour to 12 hours. If you specify a value
  /// higher than this setting, the operation fails. For example, if you specify
  /// a session duration of 12 hours, but your administrator set the maximum
  /// session duration to 6 hours, your operation fails. To learn how to view
  /// the maximum value for your role, see [View the Maximum Session Duration
  /// Setting for a
  /// Role](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use.html#id_roles_use_view-role-max-session)
  /// in the _IAM User Guide_.
  ///
  /// By default, the value is set to `3600` seconds.
  ///
  ///
  ///
  /// The `DurationSeconds` parameter is separate from the duration of a console
  /// session that you might request using the returned credentials. The request
  /// to the federation endpoint for a console sign-in token takes a
  /// `SessionDuration` parameter that specifies the maximum length of the
  /// console session. For more information, see [Creating a URL that Enables
  /// Federated Users to Access the AWS Management
  /// Console](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_enable-console-custom-url.html)
  /// in the _IAM User Guide_.
  Future<AssumeRoleWithSamlResponse> assumeRoleWithSaml(
      {@required String roleArn,
      @required String principalArn,
      @required String samlAssertion,
      List<PolicyDescriptorType> policyArns,
      String policy,
      int durationSeconds}) async {
    return AssumeRoleWithSamlResponse.fromJson({});
  }

  /// Returns a set of temporary security credentials for users who have been
  /// authenticated in a mobile or web application with a web identity provider.
  /// Example providers include Amazon Cognito, Login with Amazon, Facebook,
  /// Google, or any OpenID Connect-compatible identity provider.
  ///
  ///  For mobile applications, we recommend that you use Amazon Cognito. You
  /// can use Amazon Cognito with the [AWS SDK for iOS Developer
  /// Guide](http://aws.amazon.com/sdkforios/) and the [AWS SDK for Android
  /// Developer Guide](http://aws.amazon.com/sdkforandroid/) to uniquely
  /// identify a user. You can also supply the user with a consistent identity
  /// throughout the lifetime of an application.
  ///
  /// To learn more about Amazon Cognito, see [Amazon Cognito
  /// Overview](https://docs.aws.amazon.com/mobile/sdkforandroid/developerguide/cognito-auth.html#d0e840)
  /// in _AWS SDK for Android Developer Guide_ and [Amazon Cognito
  /// Overview](https://docs.aws.amazon.com/mobile/sdkforios/developerguide/cognito-auth.html#d0e664)
  /// in the _AWS SDK for iOS Developer Guide_.
  ///
  /// Calling `AssumeRoleWithWebIdentity` does not require the use of AWS
  /// security credentials. Therefore, you can distribute an application (for
  /// example, on mobile devices) that requests temporary security credentials
  /// without including long-term AWS credentials in the application. You also
  /// don't need to deploy server-based proxy services that use long-term AWS
  /// credentials. Instead, the identity of the caller is validated by using a
  /// token from the web identity provider. For a comparison of
  /// `AssumeRoleWithWebIdentity` with the other API operations that produce
  /// temporary credentials, see [Requesting Temporary Security
  /// Credentials](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_request.html)
  /// and [Comparing the AWS STS API
  /// operations](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_request.html#stsapi_comparison)
  /// in the _IAM User Guide_.
  ///
  /// The temporary security credentials returned by this API consist of an
  /// access key ID, a secret access key, and a security token. Applications can
  /// use these temporary security credentials to sign calls to AWS service API
  /// operations.
  ///
  /// By default, the temporary security credentials created by
  /// `AssumeRoleWithWebIdentity` last for one hour. However, you can use the
  /// optional `DurationSeconds` parameter to specify the duration of your
  /// session. You can provide a value from 900 seconds (15 minutes) up to the
  /// maximum session duration setting for the role. This setting can have a
  /// value from 1 hour to 12 hours. To learn how to view the maximum value for
  /// your role, see [View the Maximum Session Duration Setting for a
  /// Role](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use.html#id_roles_use_view-role-max-session)
  /// in the _IAM User Guide_. The maximum session duration limit applies when
  /// you use the `AssumeRole*` API operations or the `assume-role*` CLI
  /// commands. However the limit does not apply when you use those operations
  /// to create a console URL. For more information, see [Using IAM
  /// Roles](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use.html)
  /// in the _IAM User Guide_.
  ///
  /// The temporary security credentials created by `AssumeRoleWithWebIdentity`
  /// can be used to make API calls to any AWS service with the following
  /// exception: you cannot call the STS `GetFederationToken` or
  /// `GetSessionToken` API operations.
  ///
  /// (Optional) You can pass inline or managed [session
  /// policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session)
  /// to this operation. You can pass a single JSON policy document to use as an
  /// inline session policy. You can also specify up to 10 managed policies to
  /// use as managed session policies. The plain text that you use for both
  /// inline and managed session policies shouldn't exceed 2048 characters.
  /// Passing policies to this operation returns new temporary credentials. The
  /// resulting session's permissions are the intersection of the role's
  /// identity-based policy and the session policies. You can use the role's
  /// temporary credentials in subsequent AWS API calls to access resources in
  /// the account that owns the role. You cannot use session policies to grant
  /// more permissions than those allowed by the identity-based policy of the
  /// role that is being assumed. For more information, see [Session
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session)
  /// in the _IAM User Guide_.
  ///
  /// Before your application can call `AssumeRoleWithWebIdentity`, you must
  /// have an identity token from a supported identity provider and create a
  /// role that the application can assume. The role that your application
  /// assumes must trust the identity provider that is associated with the
  /// identity token. In other words, the identity provider must be specified in
  /// the role's trust policy.
  ///
  ///  Calling `AssumeRoleWithWebIdentity` can result in an entry in your AWS
  /// CloudTrail logs. The entry includes the
  /// [Subject](http://openid.net/specs/openid-connect-core-1_0.html#Claims) of
  /// the provided Web Identity Token. We recommend that you avoid using any
  /// personally identifiable information (PII) in this field. For example, you
  /// could instead use a GUID or a pairwise identifier, as [suggested in the
  /// OIDC
  /// specification](http://openid.net/specs/openid-connect-core-1_0.html#SubjectIDTypes).
  ///
  ///
  /// For more information about how to use web identity federation and the
  /// `AssumeRoleWithWebIdentity` API, see the following resources:
  ///
  /// *    [Using Web Identity Federation API Operations for Mobile
  /// Apps](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_oidc_manual.html)
  /// and [Federation Through a Web-based Identity
  /// Provider](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_request.html#api_assumerolewithwebidentity).
  ///
  /// *     [Web Identity Federation
  /// Playground](https://web-identity-federation-playground.s3.amazonaws.com/index.html).
  /// Walk through the process of authenticating through Login with Amazon,
  /// Facebook, or Google, getting temporary security credentials, and then
  /// using those credentials to make a request to AWS.
  ///
  /// *    [AWS SDK for iOS Developer Guide](http://aws.amazon.com/sdkforios/)
  /// and [AWS SDK for Android Developer
  /// Guide](http://aws.amazon.com/sdkforandroid/). These toolkits contain
  /// sample apps that show how to invoke the identity providers, and then how
  /// to use the information from these providers to get and use temporary
  /// security credentials.
  ///
  /// *    [Web Identity Federation with Mobile
  /// Applications](http://aws.amazon.com/articles/web-identity-federation-with-mobile-applications).
  /// This article discusses web identity federation and shows an example of how
  /// to use web identity federation to get access to content in Amazon S3.
  ///
  /// [roleArn]: The Amazon Resource Name (ARN) of the role that the caller is
  /// assuming.
  ///
  /// [roleSessionName]: An identifier for the assumed role session. Typically,
  /// you pass the name or identifier that is associated with the user who is
  /// using your application. That way, the temporary security credentials that
  /// your application will use are associated with that user. This session name
  /// is included as part of the ARN and assumed role ID in the
  /// `AssumedRoleUser` response element.
  ///
  /// The regex used to validate this parameter is a string of characters
  /// consisting of upper- and lower-case alphanumeric characters with no
  /// spaces. You can also include underscores or any of the following
  /// characters: =,.@-
  ///
  /// [webIdentityToken]: The OAuth 2.0 access token or OpenID Connect ID token
  /// that is provided by the identity provider. Your application must get this
  /// token by authenticating the user who is using your application with a web
  /// identity provider before the application makes an
  /// `AssumeRoleWithWebIdentity` call.
  ///
  /// [providerId]: The fully qualified host component of the domain name of the
  /// identity provider.
  ///
  /// Specify this value only for OAuth 2.0 access tokens. Currently
  /// `www.amazon.com` and `graph.facebook.com` are the only supported identity
  /// providers for OAuth 2.0 access tokens. Do not include URL schemes and port
  /// numbers.
  ///
  /// Do not specify this value for OpenID Connect ID tokens.
  ///
  /// [policyArns]: The Amazon Resource Names (ARNs) of the IAM managed policies
  /// that you want to use as managed session policies. The policies must exist
  /// in the same account as the role.
  ///
  /// This parameter is optional. You can provide up to 10 managed policy ARNs.
  /// However, the plain text that you use for both inline and managed session
  /// policies shouldn't exceed 2048 characters. For more information about
  /// ARNs, see [Amazon Resource Names (ARNs) and AWS Service
  /// Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html)
  /// in the AWS General Reference.
  ///
  ///  The characters in this parameter count towards the 2048 character session
  /// policy guideline. However, an AWS conversion compresses the session
  /// policies into a packed binary format that has a separate limit. This is
  /// the enforced limit. The `PackedPolicySize` response element indicates by
  /// percentage how close the policy is to the upper size limit.
  ///
  /// Passing policies to this operation returns new temporary credentials. The
  /// resulting session's permissions are the intersection of the role's
  /// identity-based policy and the session policies. You can use the role's
  /// temporary credentials in subsequent AWS API calls to access resources in
  /// the account that owns the role. You cannot use session policies to grant
  /// more permissions than those allowed by the identity-based policy of the
  /// role that is being assumed. For more information, see [Session
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session)
  /// in the _IAM User Guide_.
  ///
  /// [policy]: An IAM policy in JSON format that you want to use as an inline
  /// session policy.
  ///
  /// This parameter is optional. Passing policies to this operation returns new
  /// temporary credentials. The resulting session's permissions are the
  /// intersection of the role's identity-based policy and the session policies.
  /// You can use the role's temporary credentials in subsequent AWS API calls
  /// to access resources in the account that owns the role. You cannot use
  /// session policies to grant more permissions than those allowed by the
  /// identity-based policy of the role that is being assumed. For more
  /// information, see [Session
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session)
  /// in the _IAM User Guide_.
  ///
  /// The plain text that you use for both inline and managed session policies
  /// shouldn't exceed 2048 characters. The JSON policy characters can be any
  /// ASCII character from the space character to the end of the valid character
  /// list (\\u0020 through \\u00FF). It can also include the tab (\\u0009),
  /// linefeed (\\u000A), and carriage return (\\u000D) characters.
  ///
  ///
  ///
  /// The characters in this parameter count towards the 2048 character session
  /// policy guideline. However, an AWS conversion compresses the session
  /// policies into a packed binary format that has a separate limit. This is
  /// the enforced limit. The `PackedPolicySize` response element indicates by
  /// percentage how close the policy is to the upper size limit.
  ///
  /// [durationSeconds]: The duration, in seconds, of the role session. The
  /// value can range from 900 seconds (15 minutes) up to the maximum session
  /// duration setting for the role. This setting can have a value from 1 hour
  /// to 12 hours. If you specify a value higher than this setting, the
  /// operation fails. For example, if you specify a session duration of 12
  /// hours, but your administrator set the maximum session duration to 6 hours,
  /// your operation fails. To learn how to view the maximum value for your
  /// role, see [View the Maximum Session Duration Setting for a
  /// Role](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use.html#id_roles_use_view-role-max-session)
  /// in the _IAM User Guide_.
  ///
  /// By default, the value is set to `3600` seconds.
  ///
  ///
  ///
  /// The `DurationSeconds` parameter is separate from the duration of a console
  /// session that you might request using the returned credentials. The request
  /// to the federation endpoint for a console sign-in token takes a
  /// `SessionDuration` parameter that specifies the maximum length of the
  /// console session. For more information, see [Creating a URL that Enables
  /// Federated Users to Access the AWS Management
  /// Console](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_enable-console-custom-url.html)
  /// in the _IAM User Guide_.
  Future<AssumeRoleWithWebIdentityResponse> assumeRoleWithWebIdentity(
      {@required String roleArn,
      @required String roleSessionName,
      @required String webIdentityToken,
      String providerId,
      List<PolicyDescriptorType> policyArns,
      String policy,
      int durationSeconds}) async {
    return AssumeRoleWithWebIdentityResponse.fromJson({});
  }

  /// Decodes additional information about the authorization status of a request
  /// from an encoded message returned in response to an AWS request.
  ///
  /// For example, if a user is not authorized to perform an operation that he
  /// or she has requested, the request returns a `Client.UnauthorizedOperation`
  /// response (an HTTP 403 response). Some AWS operations additionally return
  /// an encoded message that can provide details about this authorization
  /// failure.
  ///
  ///  Only certain AWS operations return an encoded authorization message. The
  /// documentation for an individual operation indicates whether that operation
  /// returns an encoded message in addition to returning an HTTP code.
  ///
  /// The message is encoded because the details of the authorization status can
  /// constitute privileged information that the user who requested the
  /// operation should not see. To decode an authorization status message, a
  /// user must be granted permissions via an IAM policy to request the
  /// `DecodeAuthorizationMessage` (`sts:DecodeAuthorizationMessage`) action.
  ///
  /// The decoded message includes the following type of information:
  ///
  /// *   Whether the request was denied due to an explicit deny or due to the
  /// absence of an explicit allow. For more information, see [Determining
  /// Whether a Request is Allowed or
  /// Denied](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_evaluation-logic.html#policy-eval-denyallow)
  /// in the _IAM User Guide_.
  ///
  /// *   The principal who made the request.
  ///
  /// *   The requested action.
  ///
  /// *   The requested resource.
  ///
  /// *   The values of condition keys in the context of the user's request.
  ///
  /// [encodedMessage]: The encoded message that was returned with the response.
  Future<DecodeAuthorizationMessageResponse> decodeAuthorizationMessage(
      String encodedMessage) async {
    return DecodeAuthorizationMessageResponse.fromJson({});
  }

  /// Returns the account identifier for the specified access key ID.
  ///
  /// Access keys consist of two parts: an access key ID (for example,
  /// `AKIAIOSFODNN7EXAMPLE`) and a secret access key (for example,
  /// `wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY`). For more information about
  /// access keys, see [Managing Access Keys for IAM
  /// Users](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html)
  /// in the _IAM User Guide_.
  ///
  /// When you pass an access key ID to this operation, it returns the ID of the
  /// AWS account to which the keys belong. Access key IDs beginning with `AKIA`
  /// are long-term credentials for an IAM user or the AWS account root user.
  /// Access key IDs beginning with `ASIA` are temporary credentials that are
  /// created using STS operations. If the account in the response belongs to
  /// you, you can sign in as the root user and review your root user access
  /// keys. Then, you can pull a [credentials
  /// report](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_getting-report.html)
  /// to learn which IAM user owns the keys. To learn who requested the
  /// temporary credentials for an `ASIA` access key, view the STS events in
  /// your [CloudTrail
  /// logs](https://docs.aws.amazon.com/IAM/latest/UserGuide/cloudtrail-integration.html).
  ///
  /// This operation does not indicate the state of the access key. The key
  /// might be active, inactive, or deleted. Active keys might not have
  /// permissions to perform an operation. Providing a deleted access key might
  /// return an error that the key doesn't exist.
  ///
  /// [accessKeyId]: The identifier of an access key.
  ///
  /// This parameter allows (through its regex pattern) a string of characters
  /// that can consist of any upper- or lowercased letter or digit.
  Future<GetAccessKeyInfoResponse> getAccessKeyInfo(String accessKeyId) async {
    return GetAccessKeyInfoResponse.fromJson({});
  }

  /// Returns details about the IAM user or role whose credentials are used to
  /// call the operation.
  ///
  ///
  ///
  /// No permissions are required to perform this operation. If an administrator
  /// adds a policy to your IAM user or role that explicitly denies access to
  /// the `sts:GetCallerIdentity` action, you can still perform this operation.
  /// Permissions are not required because the same information is returned when
  /// an IAM user or role is denied access. To view an example response, see [I
  /// Am Not Authorized to Perform:
  /// iam:DeleteVirtualMFADevice](https://docs.aws.amazon.com/IAM/latest/UserGuide/troubleshoot_general.html#troubleshoot_general_access-denied-delete-mfa).
  Future<GetCallerIdentityResponse> getCallerIdentity() async {
    return GetCallerIdentityResponse.fromJson({});
  }

  /// Returns a set of temporary security credentials (consisting of an access
  /// key ID, a secret access key, and a security token) for a federated user. A
  /// typical use is in a proxy application that gets temporary security
  /// credentials on behalf of distributed applications inside a corporate
  /// network. You must call the `GetFederationToken` operation using the
  /// long-term security credentials of an IAM user. As a result, this call is
  /// appropriate in contexts where those credentials can be safely stored,
  /// usually in a server-based application. For a comparison of
  /// `GetFederationToken` with the other API operations that produce temporary
  /// credentials, see [Requesting Temporary Security
  /// Credentials](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_request.html)
  /// and [Comparing the AWS STS API
  /// operations](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_request.html#stsapi_comparison)
  /// in the _IAM User Guide_.
  ///
  ///  You can create a mobile-based or browser-based app that can authenticate
  /// users using a web identity provider like Login with Amazon, Facebook,
  /// Google, or an OpenID Connect-compatible identity provider. In this case,
  /// we recommend that you use [Amazon Cognito](http://aws.amazon.com/cognito/)
  /// or `AssumeRoleWithWebIdentity`. For more information, see [Federation
  /// Through a Web-based Identity
  /// Provider](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_request.html#api_assumerolewithwebidentity).
  ///
  ///
  /// You can also call `GetFederationToken` using the security credentials of
  /// an AWS account root user, but we do not recommend it. Instead, we
  /// recommend that you create an IAM user for the purpose of the proxy
  /// application. Then attach a policy to the IAM user that limits federated
  /// users to only the actions and resources that they need to access. For more
  /// information, see [IAM Best
  /// Practices](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html)
  /// in the _IAM User Guide_.
  ///
  /// The temporary credentials are valid for the specified duration, from 900
  /// seconds (15 minutes) up to a maximum of 129,600 seconds (36 hours). The
  /// default is 43,200 seconds (12 hours). Temporary credentials that are
  /// obtained by using AWS account root user credentials have a maximum
  /// duration of 3,600 seconds (1 hour).
  ///
  /// The temporary security credentials created by `GetFederationToken` can be
  /// used to make API calls to any AWS service with the following exceptions:
  ///
  /// *   You cannot use these credentials to call any IAM API operations.
  ///
  /// *   You cannot call any STS API operations except `GetCallerIdentity`.
  ///
  ///
  ///  **Permissions**
  ///
  /// You must pass an inline or managed [session
  /// policy](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session)
  /// to this operation. You can pass a single JSON policy document to use as an
  /// inline session policy. You can also specify up to 10 managed policies to
  /// use as managed session policies. The plain text that you use for both
  /// inline and managed session policies shouldn't exceed 2048 characters.
  ///
  /// Though the session policy parameters are optional, if you do not pass a
  /// policy, then the resulting federated user session has no permissions. The
  /// only exception is when the credentials are used to access a resource that
  /// has a resource-based policy that specifically references the federated
  /// user session in the `Principal` element of the policy. When you pass
  /// session policies, the session permissions are the intersection of the IAM
  /// user policies and the session policies that you pass. This gives you a way
  /// to further restrict the permissions for a federated user. You cannot use
  /// session policies to grant more permissions than those that are defined in
  /// the permissions policy of the IAM user. For more information, see [Session
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session)
  /// in the _IAM User Guide_. For information about using `GetFederationToken`
  /// to create temporary security credentials, see
  /// [GetFederationToken—Federation Through a Custom Identity
  /// Broker](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_request.html#api_getfederationtoken).
  ///
  /// [name]: The name of the federated user. The name is used as an identifier
  /// for the temporary security credentials (such as `Bob`). For example, you
  /// can reference the federated user name in a resource-based policy, such as
  /// in an Amazon S3 bucket policy.
  ///
  /// The regex used to validate this parameter is a string of characters
  /// consisting of upper- and lower-case alphanumeric characters with no
  /// spaces. You can also include underscores or any of the following
  /// characters: =,.@-
  ///
  /// [policy]: An IAM policy in JSON format that you want to use as an inline
  /// session policy.
  ///
  /// You must pass an inline or managed [session
  /// policy](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session)
  /// to this operation. You can pass a single JSON policy document to use as an
  /// inline session policy. You can also specify up to 10 managed policies to
  /// use as managed session policies.
  ///
  /// This parameter is optional. However, if you do not pass any session
  /// policies, then the resulting federated user session has no permissions.
  /// The only exception is when the credentials are used to access a resource
  /// that has a resource-based policy that specifically references the
  /// federated user session in the `Principal` element of the policy.
  ///
  /// When you pass session policies, the session permissions are the
  /// intersection of the IAM user policies and the session policies that you
  /// pass. This gives you a way to further restrict the permissions for a
  /// federated user. You cannot use session policies to grant more permissions
  /// than those that are defined in the permissions policy of the IAM user. For
  /// more information, see [Session
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session)
  /// in the _IAM User Guide_.
  ///
  /// The plain text that you use for both inline and managed session policies
  /// shouldn't exceed 2048 characters. The JSON policy characters can be any
  /// ASCII character from the space character to the end of the valid character
  /// list (\\u0020 through \\u00FF). It can also include the tab (\\u0009),
  /// linefeed (\\u000A), and carriage return (\\u000D) characters.
  ///
  ///
  ///
  /// The characters in this parameter count towards the 2048 character session
  /// policy guideline. However, an AWS conversion compresses the session
  /// policies into a packed binary format that has a separate limit. This is
  /// the enforced limit. The `PackedPolicySize` response element indicates by
  /// percentage how close the policy is to the upper size limit.
  ///
  /// [policyArns]: The Amazon Resource Names (ARNs) of the IAM managed policies
  /// that you want to use as a managed session policy. The policies must exist
  /// in the same account as the IAM user that is requesting federated access.
  ///
  /// You must pass an inline or managed [session
  /// policy](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session)
  /// to this operation. You can pass a single JSON policy document to use as an
  /// inline session policy. You can also specify up to 10 managed policies to
  /// use as managed session policies. The plain text that you use for both
  /// inline and managed session policies shouldn't exceed 2048 characters. You
  /// can provide up to 10 managed policy ARNs. For more information about ARNs,
  /// see [Amazon Resource Names (ARNs) and AWS Service
  /// Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html)
  /// in the AWS General Reference.
  ///
  /// This parameter is optional. However, if you do not pass any session
  /// policies, then the resulting federated user session has no permissions.
  /// The only exception is when the credentials are used to access a resource
  /// that has a resource-based policy that specifically references the
  /// federated user session in the `Principal` element of the policy.
  ///
  /// When you pass session policies, the session permissions are the
  /// intersection of the IAM user policies and the session policies that you
  /// pass. This gives you a way to further restrict the permissions for a
  /// federated user. You cannot use session policies to grant more permissions
  /// than those that are defined in the permissions policy of the IAM user. For
  /// more information, see [Session
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session)
  /// in the _IAM User Guide_.
  ///
  ///
  ///
  /// The characters in this parameter count towards the 2048 character session
  /// policy guideline. However, an AWS conversion compresses the session
  /// policies into a packed binary format that has a separate limit. This is
  /// the enforced limit. The `PackedPolicySize` response element indicates by
  /// percentage how close the policy is to the upper size limit.
  ///
  /// [durationSeconds]: The duration, in seconds, that the session should last.
  /// Acceptable durations for federation sessions range from 900 seconds (15
  /// minutes) to 129,600 seconds (36 hours), with 43,200 seconds (12 hours) as
  /// the default. Sessions obtained using AWS account root user credentials are
  /// restricted to a maximum of 3,600 seconds (one hour). If the specified
  /// duration is longer than one hour, the session obtained by using root user
  /// credentials defaults to one hour.
  Future<GetFederationTokenResponse> getFederationToken(String name,
      {String policy,
      List<PolicyDescriptorType> policyArns,
      int durationSeconds}) async {
    return GetFederationTokenResponse.fromJson({});
  }

  /// Returns a set of temporary credentials for an AWS account or IAM user. The
  /// credentials consist of an access key ID, a secret access key, and a
  /// security token. Typically, you use `GetSessionToken` if you want to use
  /// MFA to protect programmatic calls to specific AWS API operations like
  /// Amazon EC2 `StopInstances`. MFA-enabled IAM users would need to call
  /// `GetSessionToken` and submit an MFA code that is associated with their MFA
  /// device. Using the temporary security credentials that are returned from
  /// the call, IAM users can then make programmatic calls to API operations
  /// that require MFA authentication. If you do not supply a correct MFA code,
  /// then the API returns an access denied error. For a comparison of
  /// `GetSessionToken` with the other API operations that produce temporary
  /// credentials, see [Requesting Temporary Security
  /// Credentials](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_request.html)
  /// and [Comparing the AWS STS API
  /// operations](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_request.html#stsapi_comparison)
  /// in the _IAM User Guide_.
  ///
  /// The `GetSessionToken` operation must be called by using the long-term AWS
  /// security credentials of the AWS account root user or an IAM user.
  /// Credentials that are created by IAM users are valid for the duration that
  /// you specify. This duration can range from 900 seconds (15 minutes) up to a
  /// maximum of 129,600 seconds (36 hours), with a default of 43,200 seconds
  /// (12 hours). Credentials based on account credentials can range from 900
  /// seconds (15 minutes) up to 3,600 seconds (1 hour), with a default of 1
  /// hour.
  ///
  /// The temporary security credentials created by `GetSessionToken` can be
  /// used to make API calls to any AWS service with the following exceptions:
  ///
  /// *   You cannot call any IAM API operations unless MFA authentication
  /// information is included in the request.
  ///
  /// *   You cannot call any STS API _except_ `AssumeRole` or
  /// `GetCallerIdentity`.
  ///
  ///
  ///  We recommend that you do not call `GetSessionToken` with AWS account root
  /// user credentials. Instead, follow our [best
  /// practices](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html#create-iam-users)
  /// by creating one or more IAM users, giving them the necessary permissions,
  /// and using IAM users for everyday interaction with AWS.
  ///
  /// The credentials that are returned by `GetSessionToken` are based on
  /// permissions associated with the user whose credentials were used to call
  /// the operation. If `GetSessionToken` is called using AWS account root user
  /// credentials, the temporary credentials have root user permissions.
  /// Similarly, if `GetSessionToken` is called using the credentials of an IAM
  /// user, the temporary credentials have the same permissions as the IAM user.
  ///
  /// For more information about using `GetSessionToken` to create temporary
  /// credentials, go to [Temporary Credentials for Users in Untrusted
  /// Environments](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_request.html#api_getsessiontoken)
  /// in the _IAM User Guide_.
  ///
  /// [durationSeconds]: The duration, in seconds, that the credentials should
  /// remain valid. Acceptable durations for IAM user sessions range from 900
  /// seconds (15 minutes) to 129,600 seconds (36 hours), with 43,200 seconds
  /// (12 hours) as the default. Sessions for AWS account owners are restricted
  /// to a maximum of 3,600 seconds (one hour). If the duration is longer than
  /// one hour, the session for AWS account owners defaults to one hour.
  ///
  /// [serialNumber]: The identification number of the MFA device that is
  /// associated with the IAM user who is making the `GetSessionToken` call.
  /// Specify this value if the IAM user has a policy that requires MFA
  /// authentication. The value is either the serial number for a hardware
  /// device (such as `GAHT12345678`) or an Amazon Resource Name (ARN) for a
  /// virtual device (such as `arn:aws:iam::123456789012:mfa/user`). You can
  /// find the device for an IAM user by going to the AWS Management Console and
  /// viewing the user's security credentials.
  ///
  /// The regex used to validate this parameter is a string of characters
  /// consisting of upper- and lower-case alphanumeric characters with no
  /// spaces. You can also include underscores or any of the following
  /// characters: =,.@:/-
  ///
  /// [tokenCode]: The value provided by the MFA device, if MFA is required. If
  /// any policy requires the IAM user to submit an MFA code, specify this
  /// value. If MFA authentication is required, the user must provide a code
  /// when requesting a set of temporary security credentials. A user who fails
  /// to provide the code receives an "access denied" response when requesting
  /// resources that require MFA authentication.
  ///
  /// The format for this parameter, as described by its regex pattern, is a
  /// sequence of six numeric digits.
  Future<GetSessionTokenResponse> getSessionToken(
      {int durationSeconds, String serialNumber, String tokenCode}) async {
    return GetSessionTokenResponse.fromJson({});
  }
}

class AssumeRoleResponse {
  /// The temporary security credentials, which include an access key ID, a
  /// secret access key, and a security (or session) token.
  ///
  ///
  ///
  /// The size of the security token that STS API operations return is not
  /// fixed. We strongly recommend that you make no assumptions about the
  /// maximum size.
  final Credentials credentials;

  /// The Amazon Resource Name (ARN) and the assumed role ID, which are
  /// identifiers that you can use to refer to the resulting temporary security
  /// credentials. For example, you can reference these credentials as a
  /// principal in a resource-based policy by using the ARN or assumed role ID.
  /// The ARN and ID include the `RoleSessionName` that you specified when you
  /// called `AssumeRole`.
  final AssumedRoleUser assumedRoleUser;

  /// A percentage value that indicates the size of the policy in packed form.
  /// The service rejects any policy with a packed size greater than 100
  /// percent, which means the policy exceeded the allowed space.
  final int packedPolicySize;

  AssumeRoleResponse({
    this.credentials,
    this.assumedRoleUser,
    this.packedPolicySize,
  });
  static AssumeRoleResponse fromJson(Map<String, dynamic> json) =>
      AssumeRoleResponse();
}

class AssumeRoleWithSamlResponse {
  /// The temporary security credentials, which include an access key ID, a
  /// secret access key, and a security (or session) token.
  ///
  ///
  ///
  /// The size of the security token that STS API operations return is not
  /// fixed. We strongly recommend that you make no assumptions about the
  /// maximum size.
  final Credentials credentials;

  /// The identifiers for the temporary security credentials that the operation
  /// returns.
  final AssumedRoleUser assumedRoleUser;

  /// A percentage value that indicates the size of the policy in packed form.
  /// The service rejects any policy with a packed size greater than 100
  /// percent, which means the policy exceeded the allowed space.
  final int packedPolicySize;

  /// The value of the `NameID` element in the `Subject` element of the SAML
  /// assertion.
  final String subject;

  ///  The format of the name ID, as defined by the `Format` attribute in the
  /// `NameID` element of the SAML assertion. Typical examples of the format are
  /// `transient` or `persistent`.
  ///
  ///  If the format includes the prefix
  /// `urn:oasis:names:tc:SAML:2.0:nameid-format`, that prefix is removed. For
  /// example, `urn:oasis:names:tc:SAML:2.0:nameid-format:transient` is returned
  /// as `transient`. If the format includes any other prefix, the format is
  /// returned with no modifications.
  final String subjectType;

  /// The value of the `Issuer` element of the SAML assertion.
  final String issuer;

  ///  The value of the `Recipient` attribute of the `SubjectConfirmationData`
  /// element of the SAML assertion.
  final String audience;

  /// A hash value based on the concatenation of the `Issuer` response value,
  /// the AWS account ID, and the friendly name (the last part of the ARN) of
  /// the SAML provider in IAM. The combination of `NameQualifier` and `Subject`
  /// can be used to uniquely identify a federated user.
  ///
  /// The following pseudocode shows how the hash value is calculated:
  ///
  ///  `BASE64 ( SHA1 ( "https://example.com/saml" + "123456789012" +
  /// "/MySAMLIdP" ) )`
  final String nameQualifier;

  AssumeRoleWithSamlResponse({
    this.credentials,
    this.assumedRoleUser,
    this.packedPolicySize,
    this.subject,
    this.subjectType,
    this.issuer,
    this.audience,
    this.nameQualifier,
  });
  static AssumeRoleWithSamlResponse fromJson(Map<String, dynamic> json) =>
      AssumeRoleWithSamlResponse();
}

class AssumeRoleWithWebIdentityResponse {
  /// The temporary security credentials, which include an access key ID, a
  /// secret access key, and a security token.
  ///
  ///
  ///
  /// The size of the security token that STS API operations return is not
  /// fixed. We strongly recommend that you make no assumptions about the
  /// maximum size.
  final Credentials credentials;

  /// The unique user identifier that is returned by the identity provider. This
  /// identifier is associated with the `WebIdentityToken` that was submitted
  /// with the `AssumeRoleWithWebIdentity` call. The identifier is typically
  /// unique to the user and the application that acquired the
  /// `WebIdentityToken` (pairwise identifier). For OpenID Connect ID tokens,
  /// this field contains the value returned by the identity provider as the
  /// token's `sub` (Subject) claim.
  final String subjectFromWebIdentityToken;

  /// The Amazon Resource Name (ARN) and the assumed role ID, which are
  /// identifiers that you can use to refer to the resulting temporary security
  /// credentials. For example, you can reference these credentials as a
  /// principal in a resource-based policy by using the ARN or assumed role ID.
  /// The ARN and ID include the `RoleSessionName` that you specified when you
  /// called `AssumeRole`.
  final AssumedRoleUser assumedRoleUser;

  /// A percentage value that indicates the size of the policy in packed form.
  /// The service rejects any policy with a packed size greater than 100
  /// percent, which means the policy exceeded the allowed space.
  final int packedPolicySize;

  ///  The issuing authority of the web identity token presented. For OpenID
  /// Connect ID tokens, this contains the value of the `iss` field. For OAuth
  /// 2.0 access tokens, this contains the value of the `ProviderId` parameter
  /// that was passed in the `AssumeRoleWithWebIdentity` request.
  final String provider;

  /// The intended audience (also known as client ID) of the web identity token.
  /// This is traditionally the client identifier issued to the application that
  /// requested the web identity token.
  final String audience;

  AssumeRoleWithWebIdentityResponse({
    this.credentials,
    this.subjectFromWebIdentityToken,
    this.assumedRoleUser,
    this.packedPolicySize,
    this.provider,
    this.audience,
  });
  static AssumeRoleWithWebIdentityResponse fromJson(
          Map<String, dynamic> json) =>
      AssumeRoleWithWebIdentityResponse();
}

class AssumedRoleUser {
  /// A unique identifier that contains the role ID and the role session name of
  /// the role that is being assumed. The role ID is generated by AWS when the
  /// role is created.
  final String assumedRoleId;

  /// The ARN of the temporary security credentials that are returned from the
  /// AssumeRole action. For more information about ARNs and how to use them in
  /// policies, see [IAM
  /// Identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html)
  /// in _Using IAM_.
  final String arn;

  AssumedRoleUser({
    @required this.assumedRoleId,
    @required this.arn,
  });
  static AssumedRoleUser fromJson(Map<String, dynamic> json) =>
      AssumedRoleUser();
}

class Credentials {
  /// The access key ID that identifies the temporary security credentials.
  final String accessKeyId;

  /// The secret access key that can be used to sign requests.
  final String secretAccessKey;

  /// The token that users must pass to the service API to use the temporary
  /// credentials.
  final String sessionToken;

  /// The date on which the current credentials expire.
  final DateTime expiration;

  Credentials({
    @required this.accessKeyId,
    @required this.secretAccessKey,
    @required this.sessionToken,
    @required this.expiration,
  });
  static Credentials fromJson(Map<String, dynamic> json) => Credentials();
}

class DecodeAuthorizationMessageResponse {
  /// An XML document that contains the decoded message.
  final String decodedMessage;

  DecodeAuthorizationMessageResponse({
    this.decodedMessage,
  });
  static DecodeAuthorizationMessageResponse fromJson(
          Map<String, dynamic> json) =>
      DecodeAuthorizationMessageResponse();
}

class FederatedUser {
  /// The string that identifies the federated user associated with the
  /// credentials, similar to the unique ID of an IAM user.
  final String federatedUserId;

  /// The ARN that specifies the federated user that is associated with the
  /// credentials. For more information about ARNs and how to use them in
  /// policies, see [IAM
  /// Identifiers](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html)
  /// in _Using IAM_.
  final String arn;

  FederatedUser({
    @required this.federatedUserId,
    @required this.arn,
  });
  static FederatedUser fromJson(Map<String, dynamic> json) => FederatedUser();
}

class GetAccessKeyInfoResponse {
  /// The number used to identify the AWS account.
  final String account;

  GetAccessKeyInfoResponse({
    this.account,
  });
  static GetAccessKeyInfoResponse fromJson(Map<String, dynamic> json) =>
      GetAccessKeyInfoResponse();
}

class GetCallerIdentityResponse {
  /// The unique identifier of the calling entity. The exact value depends on
  /// the type of entity that is making the call. The values returned are those
  /// listed in the **aws:userid** column in the [Principal
  /// table](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_variables.html#principaltable)
  /// found on the **Policy Variables** reference page in the _IAM User Guide_.
  final String userId;

  /// The AWS account ID number of the account that owns or contains the calling
  /// entity.
  final String account;

  /// The AWS ARN associated with the calling entity.
  final String arn;

  GetCallerIdentityResponse({
    this.userId,
    this.account,
    this.arn,
  });
  static GetCallerIdentityResponse fromJson(Map<String, dynamic> json) =>
      GetCallerIdentityResponse();
}

class GetFederationTokenResponse {
  /// The temporary security credentials, which include an access key ID, a
  /// secret access key, and a security (or session) token.
  ///
  ///
  ///
  /// The size of the security token that STS API operations return is not
  /// fixed. We strongly recommend that you make no assumptions about the
  /// maximum size.
  final Credentials credentials;

  /// Identifiers for the federated user associated with the credentials (such
  /// as `arn:aws:sts::123456789012:federated-user/Bob` or `123456789012:Bob`).
  /// You can use the federated user's ARN in your resource-based policies, such
  /// as an Amazon S3 bucket policy.
  final FederatedUser federatedUser;

  /// A percentage value indicating the size of the policy in packed form. The
  /// service rejects policies for which the packed size is greater than 100
  /// percent of the allowed value.
  final int packedPolicySize;

  GetFederationTokenResponse({
    this.credentials,
    this.federatedUser,
    this.packedPolicySize,
  });
  static GetFederationTokenResponse fromJson(Map<String, dynamic> json) =>
      GetFederationTokenResponse();
}

class GetSessionTokenResponse {
  /// The temporary security credentials, which include an access key ID, a
  /// secret access key, and a security (or session) token.
  ///
  ///
  ///
  /// The size of the security token that STS API operations return is not
  /// fixed. We strongly recommend that you make no assumptions about the
  /// maximum size.
  final Credentials credentials;

  GetSessionTokenResponse({
    this.credentials,
  });
  static GetSessionTokenResponse fromJson(Map<String, dynamic> json) =>
      GetSessionTokenResponse();
}

class PolicyDescriptorType {
  /// The Amazon Resource Name (ARN) of the IAM managed policy to use as a
  /// session policy for the role. For more information about ARNs, see [Amazon
  /// Resource Names (ARNs) and AWS Service
  /// Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html)
  /// in the _AWS General Reference_.
  final String arn;

  PolicyDescriptorType({
    this.arn,
  });
}
