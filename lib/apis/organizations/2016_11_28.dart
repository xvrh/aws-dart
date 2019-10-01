import 'package:meta/meta.dart';

/// AWS Organizations API Reference
///
/// AWS Organizations is a web service that enables you to consolidate your
/// multiple AWS accounts into an _organization_ and centrally manage your
/// accounts and their resources.
///
/// This guide provides descriptions of the Organizations API. For more
/// information about using this service, see the [AWS Organizations User
/// Guide](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_introduction.html).
///
///  **API Version**
///
/// This version of the Organizations API Reference documents the Organizations
/// API version 2016-11-28.
///
///  As an alternative to using the API directly, you can use one of the AWS
/// SDKs, which consist of libraries and sample code for various programming
/// languages and platforms (Java, Ruby, .NET, iOS, Android, and more). The SDKs
/// provide a convenient way to create programmatic access to AWS Organizations.
/// For example, the SDKs take care of cryptographically signing requests,
/// managing errors, and retrying requests automatically. For more information
/// about the AWS SDKs, including how to download and install them, see [Tools
/// for Amazon Web Services](http://aws.amazon.com/tools/).
///
/// We recommend that you use the AWS SDKs to make programmatic API calls to
/// Organizations. However, you also can use the Organizations Query API to make
/// direct calls to the Organizations web service. To learn more about the
/// Organizations Query API, see [Making Query
/// Requests](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_query-requests.html)
/// in the _AWS Organizations User Guide_. Organizations supports GET and POST
/// requests for all actions. That is, the API does not require you to use GET
/// for some actions and POST for others. However, GET requests are subject to
/// the limitation size of a URL. Therefore, for operations that require larger
/// sizes, use a POST request.
///
///  **Signing Requests**
///
/// When you send HTTP requests to AWS, you must sign the requests so that AWS
/// can identify who sent them. You sign requests with your AWS access key,
/// which consists of an access key ID and a secret access key. We strongly
/// recommend that you do not create an access key for your root account. Anyone
/// who has the access key for your root account has unrestricted access to all
/// the resources in your account. Instead, create an access key for an IAM user
/// account that has administrative privileges. As another option, use AWS
/// Security Token Service to generate temporary security credentials, and use
/// those credentials to sign requests.
///
/// To sign requests, we recommend that you use [Signature Version
/// 4](https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html).
/// If you have an existing application that uses Signature Version 2, you do
/// not have to update it to use Signature Version 4. However, some operations
/// now require Signature Version 4. The documentation for operations that
/// require version 4 indicate this requirement.
///
/// When you use the AWS Command Line Interface (AWS CLI) or one of the AWS SDKs
/// to make requests to AWS, these tools automatically sign the requests for you
/// with the access key that you specify when you configure the tools.
///
/// In this release, each organization can have only one root. In a future
/// release, a single organization will support multiple roots.
///
///  **Support and Feedback for AWS Organizations**
///
/// We welcome your feedback. Send your comments to
/// [feedback-awsorganizations@amazon.com](mailto:feedback-awsorganizations@amazon.com)
/// or post your feedback and questions in the [AWS Organizations support
/// forum](http://forums.aws.amazon.com/forum.jspa?forumID=219). For more
/// information about the AWS support forums, see [Forums
/// Help](http://forums.aws.amazon.com/help.jspa).
///
///  **Endpoint to Call When Using the CLI or the AWS API**
///
/// For the current release of Organizations, you must specify the `us-east-1`
/// region for all AWS API and CLI calls. You can do this in the CLI by using
/// these parameters and commands:
///
/// *   Use the following parameter with each command to specify both the
/// endpoint and its region:
///
///      `--endpoint-url https://organizations.us-east-1.amazonaws.com`
///
/// *   Use the default endpoint, but configure your default region with this
/// command:
///
///      `aws configure set default.region us-east-1`
///
/// *   Use the following parameter with each command to specify the endpoint:
///
///      `--region us-east-1`
///
///
/// For the various SDKs used to call the APIs, see the documentation for the
/// SDK of interest to learn how to direct the requests to a specific endpoint.
/// For more information, see [Regions and
/// Endpoints](https://docs.aws.amazon.com/general/latest/gr/rande.html#sts_region)
/// in the _AWS General Reference_.
///
///  **How examples are presented**
///
/// The JSON returned by the AWS Organizations service as response to your
/// requests is returned as a single long string without line breaks or
/// formatting whitespace. Both line breaks and whitespace are included in the
/// examples in this guide to improve readability. When example input parameters
/// also would result in long strings that would extend beyond the screen, we
/// insert line breaks to enhance readability. You should always submit the
/// input as a single JSON text string.
///
///  **Recording API Requests**
///
/// AWS Organizations supports AWS CloudTrail, a service that records AWS API
/// calls for your AWS account and delivers log files to an Amazon S3 bucket. By
/// using information collected by AWS CloudTrail, you can determine which
/// requests were successfully made to Organizations, who made the request, when
/// it was made, and so on. For more about AWS Organizations and its support for
/// AWS CloudTrail, see [Logging AWS Organizations Events with AWS
/// CloudTrail](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_monitoring.html#orgs_cloudtrail-integration)
/// in the _AWS Organizations User Guide_. To learn more about CloudTrail,
/// including how to turn it on and find your log files, see the [AWS CloudTrail
/// User
/// Guide](https://docs.aws.amazon.com/awscloudtrail/latest/userguide/what_is_cloud_trail_top_level.html).
class OrganizationsApi {
  /// Sends a response to the originator of a handshake agreeing to the action
  /// proposed by the handshake request.
  ///
  /// This operation can be called only by the following principals when they
  /// also have the relevant IAM permissions:
  ///
  /// *    **Invitation to join** or **Approve all features request**
  /// handshakes: only a principal from the member account.
  ///
  ///     The user who calls the API for an invitation to join must have the
  /// `organizations:AcceptHandshake` permission. If you enabled all features in
  /// the organization, the user must also have the
  /// `iam:CreateServiceLinkedRole` permission so that AWS Organizations can
  /// create the required service-linked role named
  /// `AWSServiceRoleForOrganizations`. For more information, see [AWS
  /// Organizations and Service-Linked
  /// Roles](http://docs.aws.amazon.com/organizations/latest/userguide/orgs_integration_services.html#orgs_integration_service-linked-roles)
  /// in the _AWS Organizations User Guide_.
  ///
  /// *    **Enable all features final confirmation** handshake: only a
  /// principal from the master account.
  ///
  ///     For more information about invitations, see [Inviting an AWS Account
  /// to Join Your
  /// Organization](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_invites.html)
  /// in the _AWS Organizations User Guide._ For more information about requests
  /// to enable all features in the organization, see [Enabling All Features in
  /// Your
  /// Organization](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_org_support-all-features.html)
  /// in the _AWS Organizations User Guide._
  ///
  ///
  /// After you accept a handshake, it continues to appear in the results of
  /// relevant APIs for only 30 days. After that, it's deleted.
  ///
  /// [handshakeId]: The unique identifier (ID) of the handshake that you want
  /// to accept.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) for handshake ID
  /// string requires "h-" followed by from 8 to 32 lower-case letters or
  /// digits.
  Future<AcceptHandshakeResponse> acceptHandshake(String handshakeId) async {
    return AcceptHandshakeResponse.fromJson({});
  }

  /// Attaches a policy to a root, an organizational unit (OU), or an individual
  /// account. How the policy affects accounts depends on the type of policy:
  ///
  /// *    **Service control policy (SCP)** \- An SCP specifies what permissions
  /// can be delegated to users in affected member accounts. The scope of
  /// influence for a policy depends on what you attach the policy to:
  ///
  ///     *   If you attach an SCP to a root, it affects all accounts in the
  /// organization.
  ///
  ///     *   If you attach an SCP to an OU, it affects all accounts in that OU
  /// and in any child OUs.
  ///
  ///     *   If you attach the policy directly to an account, it affects only
  /// that account.
  ///
  ///
  ///     SCPs are JSON policies that specify the maximum permissions for an
  /// organization or organizational unit (OU). You can attach one SCP to a
  /// higher level root or OU, and a different SCP to a child OU or to an
  /// account. The child policy can further restrict only the permissions that
  /// pass through the parent filter and are available to the child. An SCP that
  /// is attached to a child can't grant a permission that the parent hasn't
  /// already granted. For example, imagine that the parent SCP allows
  /// permissions A, B, C, D, and E. The child SCP allows C, D, E, F, and G. The
  /// result is that the accounts affected by the child SCP are allowed to use
  /// only C, D, and E. They can't use A or B because the child OU filtered them
  /// out. They also can't use F and G because the parent OU filtered them out.
  /// They can't be granted back by the child SCP; child SCPs can only filter
  /// the permissions they receive from the parent SCP.
  ///
  ///     AWS Organizations attaches a default SCP named `"FullAWSAccess` to
  /// every root, OU, and account. This default SCP allows all services and
  /// actions, enabling any new child OU or account to inherit the permissions
  /// of the parent root or OU. If you detach the default policy, you must
  /// replace it with a policy that specifies the permissions that you want to
  /// allow in that OU or account.
  ///
  ///     For more information about how AWS Organizations policies permissions
  /// work, see [Using Service Control
  /// Policies](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scp.html)
  /// in the _AWS Organizations User Guide._
  ///
  ///
  /// This operation can be called only from the organization's master account.
  ///
  /// [policyId]: The unique identifier (ID) of the policy that you want to
  /// attach to the target. You can get the ID for the policy by calling the
  /// ListPolicies operation.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) for a policy ID
  /// string requires "p-" followed by from 8 to 128 lower-case letters or
  /// digits.
  ///
  /// [targetId]: The unique identifier (ID) of the root, OU, or account that
  /// you want to attach the policy to. You can get the ID by calling the
  /// ListRoots, ListOrganizationalUnitsForParent, or ListAccounts operations.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) for a target ID
  /// string requires one of the following:
  ///
  /// *    **Root** \- A string that begins with "r-" followed by from 4 to 32
  /// lower-case letters or digits.
  ///
  /// *    **Account** \- A string that consists of exactly 12 digits.
  ///
  /// *    **Organizational unit (OU)** \- A string that begins with "ou-"
  /// followed by from 4 to 32 lower-case letters or digits (the ID of the root
  /// that the OU is in) followed by a second "-" dash and from 8 to 32
  /// additional lower-case letters or digits.
  Future<void> attachPolicy(
      {@required String policyId, @required String targetId}) async {}

  /// Cancels a handshake. Canceling a handshake sets the handshake state to
  /// `CANCELED`.
  ///
  /// This operation can be called only from the account that originated the
  /// handshake. The recipient of the handshake can't cancel it, but can use
  /// DeclineHandshake instead. After a handshake is canceled, the recipient can
  /// no longer respond to that handshake.
  ///
  /// After you cancel a handshake, it continues to appear in the results of
  /// relevant APIs for only 30 days. After that, it's deleted.
  ///
  /// [handshakeId]: The unique identifier (ID) of the handshake that you want
  /// to cancel. You can get the ID from the ListHandshakesForOrganization
  /// operation.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) for handshake ID
  /// string requires "h-" followed by from 8 to 32 lower-case letters or
  /// digits.
  Future<CancelHandshakeResponse> cancelHandshake(String handshakeId) async {
    return CancelHandshakeResponse.fromJson({});
  }

  /// Creates an AWS account that is automatically a member of the organization
  /// whose credentials made the request. This is an asynchronous request that
  /// AWS performs in the background. Because `CreateAccount` operates
  /// asynchronously, it can return a successful completion message even though
  /// account initialization might still be in progress. You might need to wait
  /// a few minutes before you can successfully access the account. To check the
  /// status of the request, do one of the following:
  ///
  /// *   Use the `OperationId` response element from this operation to provide
  /// as a parameter to the DescribeCreateAccountStatus operation.
  ///
  /// *   Check the AWS CloudTrail log for the `CreateAccountResult` event. For
  /// information on using AWS CloudTrail with AWS Organizations, see
  /// [Monitoring the Activity in Your
  /// Organization](http://docs.aws.amazon.com/organizations/latest/userguide/orgs_monitoring.html)
  /// in the _AWS Organizations User Guide._
  ///
  ///
  /// The user who calls the API to create an account must have the
  /// `organizations:CreateAccount` permission. If you enabled all features in
  /// the organization, AWS Organizations creates the required service-linked
  /// role named `AWSServiceRoleForOrganizations`. For more information, see
  /// [AWS Organizations and Service-Linked
  /// Roles](http://docs.aws.amazon.com/organizations/latest/userguide/orgs_integrate_services.html#orgs_integrate_services-using_slrs)
  /// in the _AWS Organizations User Guide_.
  ///
  /// AWS Organizations preconfigures the new member account with a role (named
  /// `OrganizationAccountAccessRole` by default) that grants users in the
  /// master account administrator permissions in the new member account.
  /// Principals in the master account can assume the role. AWS Organizations
  /// clones the company name and address information for the new account from
  /// the organization's master account.
  ///
  /// This operation can be called only from the organization's master account.
  ///
  /// For more information about creating accounts, see [Creating an AWS Account
  /// in Your
  /// Organization](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_create.html)
  /// in the _AWS Organizations User Guide._
  ///
  ///  *   When you create an account in an organization using the AWS
  /// Organizations console, API, or CLI commands, the information required for
  /// the account to operate as a standalone account, such as a payment method
  /// and signing the end user license agreement (EULA) is _not_ automatically
  /// collected. If you must remove an account from your organization later, you
  /// can do so only after you provide the missing information. Follow the steps
  /// at  [To leave an organization as a member
  /// account](http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_remove.html#leave-without-all-info)
  /// in the _AWS Organizations User Guide_.
  ///
  /// *   If you get an exception that indicates that you exceeded your account
  /// limits for the organization, contact [AWS
  /// Support](https://console.aws.amazon.com/support/home#/).
  ///
  /// *   If you get an exception that indicates that the operation failed
  /// because your organization is still initializing, wait one hour and then
  /// try again. If the error persists, contact [AWS
  /// Support](https://console.aws.amazon.com/support/home#/).
  ///
  /// *   Using `CreateAccount` to create multiple temporary accounts isn't
  /// recommended. You can only close an account from the Billing and Cost
  /// Management Console, and you must be signed in as the root user. For
  /// information on the requirements and process for closing an account, see
  /// [Closing an AWS
  /// Account](http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_close.html)
  /// in the _AWS Organizations User Guide_.
  ///
  /// When you create a member account with this operation, you can choose
  /// whether to create the account with the **IAM User and Role Access to
  /// Billing Information** switch enabled. If you enable it, IAM users and
  /// roles that have appropriate permissions can view billing information for
  /// the account. If you disable it, only the account root user can access
  /// billing information. For information about how to disable this switch for
  /// an account, see [Granting Access to Your Billing Information and
  /// Tools](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/grantaccess.html).
  ///
  /// [email]: The email address of the owner to assign to the new member
  /// account. This email address must not already be associated with another
  /// AWS account. You must use a valid email address to complete account
  /// creation. You can't access the root user of the account or remove an
  /// account that was created with an invalid email address.
  ///
  /// [accountName]: The friendly name of the member account.
  ///
  /// [roleName]: (Optional)
  ///
  /// The name of an IAM role that AWS Organizations automatically preconfigures
  /// in the new member account. This role trusts the master account, allowing
  /// users in the master account to assume the role, as permitted by the master
  /// account administrator. The role has administrator permissions in the new
  /// member account.
  ///
  /// If you don't specify this parameter, the role name defaults to
  /// `OrganizationAccountAccessRole`.
  ///
  /// For more information about how to use this role to access the member
  /// account, see [Accessing and Administering the Member Accounts in Your
  /// Organization](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_access.html#orgs_manage_accounts_create-cross-account-role)
  /// in the _AWS Organizations User Guide_, and steps 2 and 3 in [Tutorial:
  /// Delegate Access Across AWS Accounts Using IAM
  /// Roles](https://docs.aws.amazon.com/IAM/latest/UserGuide/tutorial_cross-account-with-roles.html)
  /// in the _IAM User Guide._
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) that is used to
  /// validate this parameter is a string of characters that can consist of
  /// uppercase letters, lowercase letters, digits with no spaces, and any of
  /// the following characters: =,.@-
  ///
  /// [iamUserAccessToBilling]: If set to `ALLOW`, the new account enables IAM
  /// users to access account billing information _if_ they have the required
  /// permissions. If set to `DENY`, only the root user of the new account can
  /// access account billing information. For more information, see [Activating
  /// Access to the Billing and Cost Management
  /// Console](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/grantaccess.html#ControllingAccessWebsite-Activate)
  /// in the _AWS Billing and Cost Management User Guide_.
  ///
  /// If you don't specify this parameter, the value defaults to `ALLOW`, and
  /// IAM users and roles with the required permissions can access billing
  /// information for the new account.
  Future<CreateAccountResponse> createAccount(
      {@required String email,
      @required String accountName,
      String roleName,
      String iamUserAccessToBilling}) async {
    return CreateAccountResponse.fromJson({});
  }

  /// This action is available if all of the following are true:
  ///
  /// *   You're authorized to create accounts in the AWS GovCloud (US) Region.
  /// For more information on the AWS GovCloud (US) Region, see the  [_AWS
  /// GovCloud User
  /// Guide_.](http://docs.aws.amazon.com/govcloud-us/latest/UserGuide/welcome.html)
  ///
  /// *   You already have an account in the AWS GovCloud (US) Region that is
  /// associated with your master account in the commercial Region.
  ///
  /// *   You call this action from the master account of your organization in
  /// the commercial Region.
  ///
  /// *   You have the `organizations:CreateGovCloudAccount` permission. AWS
  /// Organizations creates the required service-linked role named
  /// `AWSServiceRoleForOrganizations`. For more information, see [AWS
  /// Organizations and Service-Linked
  /// Roles](http://docs.aws.amazon.com/organizations/latest/userguide/orgs_integrate_services.html#orgs_integrate_services-using_slrs)
  /// in the _AWS Organizations User Guide._
  ///
  ///
  /// AWS automatically enables AWS CloudTrail for AWS GovCloud (US) accounts,
  /// but you should also do the following:
  ///
  /// *   Verify that AWS CloudTrail is enabled to store logs.
  ///
  /// *   Create an S3 bucket for AWS CloudTrail log storage.
  ///
  ///     For more information, see [Verifying AWS CloudTrail Is
  /// Enabled](http://docs.aws.amazon.com/govcloud-us/latest/UserGuide/verifying-cloudtrail.html)
  /// in the _AWS GovCloud User Guide_.
  ///
  ///
  /// You call this action from the master account of your organization in the
  /// commercial Region to create a standalone AWS account in the AWS GovCloud
  /// (US) Region. After the account is created, the master account of an
  /// organization in the AWS GovCloud (US) Region can invite it to that
  /// organization. For more information on inviting standalone accounts in the
  /// AWS GovCloud (US) to join an organization, see [AWS
  /// Organizations](http://docs.aws.amazon.com/govcloud-us/latest/UserGuide/govcloud-organizations.html)
  /// in the _AWS GovCloud User Guide._
  ///
  /// Calling `CreateGovCloudAccount` is an asynchronous request that AWS
  /// performs in the background. Because `CreateGovCloudAccount` operates
  /// asynchronously, it can return a successful completion message even though
  /// account initialization might still be in progress. You might need to wait
  /// a few minutes before you can successfully access the account. To check the
  /// status of the request, do one of the following:
  ///
  /// *   Use the `OperationId` response element from this operation to provide
  /// as a parameter to the DescribeCreateAccountStatus operation.
  ///
  /// *   Check the AWS CloudTrail log for the `CreateAccountResult` event. For
  /// information on using AWS CloudTrail with Organizations, see [Monitoring
  /// the Activity in Your
  /// Organization](http://docs.aws.amazon.com/organizations/latest/userguide/orgs_monitoring.html)
  /// in the _AWS Organizations User Guide._
  ///
  ///
  /// When you call the `CreateGovCloudAccount` action, you create two accounts:
  /// a standalone account in the AWS GovCloud (US) Region and an associated
  /// account in the commercial Region for billing and support purposes. The
  /// account in the commercial Region is automatically a member of the
  /// organization whose credentials made the request. Both accounts are
  /// associated with the same email address.
  ///
  /// A role is created in the new account in the commercial Region that allows
  /// the master account in the organization in the commercial Region to assume
  /// it. An AWS GovCloud (US) account is then created and associated with the
  /// commercial account that you just created. A role is created in the new AWS
  /// GovCloud (US) account that can be assumed by the AWS GovCloud (US) account
  /// that is associated with the master account of the commercial organization.
  /// For more information and to view a diagram that explains how account
  /// access works, see [AWS
  /// Organizations](http://docs.aws.amazon.com/govcloud-us/latest/UserGuide/govcloud-organizations.html)
  /// in the _AWS GovCloud User Guide._
  ///
  /// For more information about creating accounts, see [Creating an AWS Account
  /// in Your
  /// Organization](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_create.html)
  /// in the _AWS Organizations User Guide._
  ///
  ///  *   When you create an account in an organization using the AWS
  /// Organizations console, API, or CLI commands, the information required for
  /// the account to operate as a standalone account, such as a payment method
  /// and signing the end user license agreement (EULA) is _not_ automatically
  /// collected. If you must remove an account from your organization later, you
  /// can do so only after you provide the missing information. Follow the steps
  /// at  [To leave an organization as a member
  /// account](http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_remove.html#leave-without-all-info)
  /// in the _AWS Organizations User Guide._
  ///
  /// *   If you get an exception that indicates that you exceeded your account
  /// limits for the organization, contact [AWS
  /// Support](https://console.aws.amazon.com/support/home#/).
  ///
  /// *   If you get an exception that indicates that the operation failed
  /// because your organization is still initializing, wait one hour and then
  /// try again. If the error persists, contact [AWS
  /// Support](https://console.aws.amazon.com/support/home#/).
  ///
  /// *   Using `CreateGovCloudAccount` to create multiple temporary accounts
  /// isn't recommended. You can only close an account from the AWS Billing and
  /// Cost Management console, and you must be signed in as the root user. For
  /// information on the requirements and process for closing an account, see
  /// [Closing an AWS
  /// Account](http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_close.html)
  /// in the _AWS Organizations User Guide_.
  ///
  /// When you create a member account with this operation, you can choose
  /// whether to create the account with the **IAM User and Role Access to
  /// Billing Information** switch enabled. If you enable it, IAM users and
  /// roles that have appropriate permissions can view billing information for
  /// the account. If you disable it, only the account root user can access
  /// billing information. For information about how to disable this switch for
  /// an account, see [Granting Access to Your Billing Information and
  /// Tools](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/grantaccess.html).
  ///
  /// [email]: The email address of the owner to assign to the new member
  /// account in the commercial Region. This email address must not already be
  /// associated with another AWS account. You must use a valid email address to
  /// complete account creation. You can't access the root user of the account
  /// or remove an account that was created with an invalid email address. Like
  /// all request parameters for `CreateGovCloudAccount`, the request for the
  /// email address for the AWS GovCloud (US) account originates from the
  /// commercial Region, not from the AWS GovCloud (US) Region.
  ///
  /// [accountName]: The friendly name of the member account.
  ///
  /// [roleName]: (Optional)
  ///
  /// The name of an IAM role that AWS Organizations automatically preconfigures
  /// in the new member accounts in both the AWS GovCloud (US) Region and in the
  /// commercial Region. This role trusts the master account, allowing users in
  /// the master account to assume the role, as permitted by the master account
  /// administrator. The role has administrator permissions in the new member
  /// account.
  ///
  /// If you don't specify this parameter, the role name defaults to
  /// `OrganizationAccountAccessRole`.
  ///
  /// For more information about how to use this role to access the member
  /// account, see [Accessing and Administering the Member Accounts in Your
  /// Organization](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_access.html#orgs_manage_accounts_create-cross-account-role)
  /// in the _AWS Organizations User Guide_ and steps 2 and 3 in [Tutorial:
  /// Delegate Access Across AWS Accounts Using IAM
  /// Roles](https://docs.aws.amazon.com/IAM/latest/UserGuide/tutorial_cross-account-with-roles.html)
  /// in the _IAM User Guide._
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) that is used to
  /// validate this parameter is a string of characters that can consist of
  /// uppercase letters, lowercase letters, digits with no spaces, and any of
  /// the following characters: =,.@-
  ///
  /// [iamUserAccessToBilling]: If set to `ALLOW`, the new linked account in the
  /// commercial Region enables IAM users to access account billing information
  /// _if_ they have the required permissions. If set to `DENY`, only the root
  /// user of the new account can access account billing information. For more
  /// information, see [Activating Access to the Billing and Cost Management
  /// Console](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/grantaccess.html#ControllingAccessWebsite-Activate)
  /// in the _AWS Billing and Cost Management User Guide._
  ///
  /// If you don't specify this parameter, the value defaults to `ALLOW`, and
  /// IAM users and roles with the required permissions can access billing
  /// information for the new account.
  Future<CreateGovCloudAccountResponse> createGovCloudAccount(
      {@required String email,
      @required String accountName,
      String roleName,
      String iamUserAccessToBilling}) async {
    return CreateGovCloudAccountResponse.fromJson({});
  }

  /// Creates an AWS organization. The account whose user is calling the
  /// `CreateOrganization` operation automatically becomes the [master
  /// account](https://docs.aws.amazon.com/IAM/latest/UserGuide/orgs_getting-started_concepts.html#account)
  /// of the new organization.
  ///
  /// This operation must be called using credentials from the account that is
  /// to become the new organization's master account. The principal must also
  /// have the relevant IAM permissions.
  ///
  /// By default (or if you set the `FeatureSet` parameter to `ALL`), the new
  /// organization is created with all features enabled and service control
  /// policies automatically enabled in the root. If you instead choose to
  /// create the organization supporting only the consolidated billing features
  /// by setting the `FeatureSet` parameter to `CONSOLIDATED_BILLING"`, no
  /// policy types are enabled by default, and you can't use organization
  /// policies.
  ///
  /// [featureSet]: Specifies the feature set supported by the new organization.
  /// Each feature set supports different levels of functionality.
  ///
  /// *    `CONSOLIDATED_BILLING`: All member accounts have their bills
  /// consolidated to and paid by the master account. For more information, see
  /// [Consolidated
  /// billing](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_getting-started_concepts.html#feature-set-cb-only)
  /// in the _AWS Organizations User Guide._
  ///
  ///      The consolidated billing feature subset isn't available for
  /// organizations in the AWS GovCloud (US) Region.
  ///
  /// *    `ALL`: In addition to all the features supported by the consolidated
  /// billing feature set, the master account can also apply any policy type to
  /// any member account in the organization. For more information, see [All
  /// features](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_getting-started_concepts.html#feature-set-all)
  /// in the _AWS Organizations User Guide._
  Future<CreateOrganizationResponse> createOrganization(
      {String featureSet}) async {
    return CreateOrganizationResponse.fromJson({});
  }

  /// Creates an organizational unit (OU) within a root or parent OU. An OU is a
  /// container for accounts that enables you to organize your accounts to apply
  /// policies according to your business requirements. The number of levels
  /// deep that you can nest OUs is dependent upon the policy types enabled for
  /// that root. For service control policies, the limit is five.
  ///
  /// For more information about OUs, see [Managing Organizational
  /// Units](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_ous.html)
  /// in the _AWS Organizations User Guide._
  ///
  /// This operation can be called only from the organization's master account.
  ///
  /// [parentId]: The unique identifier (ID) of the parent root or OU that you
  /// want to create the new OU in.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) for a parent ID
  /// string requires one of the following:
  ///
  /// *    **Root** \- A string that begins with "r-" followed by from 4 to 32
  /// lower-case letters or digits.
  ///
  /// *    **Organizational unit (OU)** \- A string that begins with "ou-"
  /// followed by from 4 to 32 lower-case letters or digits (the ID of the root
  /// that the OU is in) followed by a second "-" dash and from 8 to 32
  /// additional lower-case letters or digits.
  ///
  /// [name]: The friendly name to assign to the new OU.
  Future<CreateOrganizationalUnitResponse> createOrganizationalUnit(
      {@required String parentId, @required String name}) async {
    return CreateOrganizationalUnitResponse.fromJson({});
  }

  /// Creates a policy of a specified type that you can attach to a root, an
  /// organizational unit (OU), or an individual AWS account.
  ///
  /// For more information about policies and their use, see [Managing
  /// Organization
  /// Policies](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies.html).
  ///
  /// This operation can be called only from the organization's master account.
  ///
  /// [content]: The policy content to add to the new policy. For example, if
  /// you create a [service control
  /// policy](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scp.html)
  /// (SCP), this string must be JSON text that specifies the permissions that
  /// admins in attached accounts can delegate to their users, groups, and
  /// roles. For more information about the SCP syntax, see [Service Control
  /// Policy
  /// Syntax](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_reference_scp-syntax.html)
  /// in the _AWS Organizations User Guide._
  ///
  /// [description]: An optional description to assign to the policy.
  ///
  /// [name]: The friendly name to assign to the policy.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) that is used to
  /// validate this parameter is a string of any of the characters in the ASCII
  /// character range.
  ///
  /// [type]: The type of policy to create.
  ///
  ///
  ///
  /// In the current release, the only type of policy that you can create is a
  /// service control policy (SCP).
  Future<CreatePolicyResponse> createPolicy(
      {@required String content,
      @required String description,
      @required String name,
      @required String type}) async {
    return CreatePolicyResponse.fromJson({});
  }

  /// Declines a handshake request. This sets the handshake state to `DECLINED`
  /// and effectively deactivates the request.
  ///
  /// This operation can be called only from the account that received the
  /// handshake. The originator of the handshake can use CancelHandshake
  /// instead. The originator can't reactivate a declined request, but can
  /// reinitiate the process with a new handshake request.
  ///
  /// After you decline a handshake, it continues to appear in the results of
  /// relevant APIs for only 30 days. After that, it's deleted.
  ///
  /// [handshakeId]: The unique identifier (ID) of the handshake that you want
  /// to decline. You can get the ID from the ListHandshakesForAccount
  /// operation.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) for handshake ID
  /// string requires "h-" followed by from 8 to 32 lower-case letters or
  /// digits.
  Future<DeclineHandshakeResponse> declineHandshake(String handshakeId) async {
    return DeclineHandshakeResponse.fromJson({});
  }

  /// Deletes the organization. You can delete an organization only by using
  /// credentials from the master account. The organization must be empty of
  /// member accounts.
  Future<void> deleteOrganization() async {}

  /// Deletes an organizational unit (OU) from a root or another OU. You must
  /// first remove all accounts and child OUs from the OU that you want to
  /// delete.
  ///
  /// This operation can be called only from the organization's master account.
  ///
  /// [organizationalUnitId]: The unique identifier (ID) of the organizational
  /// unit that you want to delete. You can get the ID from the
  /// ListOrganizationalUnitsForParent operation.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) for an organizational
  /// unit ID string requires "ou-" followed by from 4 to 32 lower-case letters
  /// or digits (the ID of the root that contains the OU) followed by a second
  /// "-" dash and from 8 to 32 additional lower-case letters or digits.
  Future<void> deleteOrganizationalUnit(String organizationalUnitId) async {}

  /// Deletes the specified policy from your organization. Before you perform
  /// this operation, you must first detach the policy from all organizational
  /// units (OUs), roots, and accounts.
  ///
  /// This operation can be called only from the organization's master account.
  ///
  /// [policyId]: The unique identifier (ID) of the policy that you want to
  /// delete. You can get the ID from the ListPolicies or ListPoliciesForTarget
  /// operations.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) for a policy ID
  /// string requires "p-" followed by from 8 to 128 lower-case letters or
  /// digits.
  Future<void> deletePolicy(String policyId) async {}

  /// Retrieves AWS Organizations-related information about the specified
  /// account.
  ///
  /// This operation can be called only from the organization's master account.
  ///
  /// [accountId]: The unique identifier (ID) of the AWS account that you want
  /// information about. You can get the ID from the ListAccounts or
  /// ListAccountsForParent operations.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) for an account ID
  /// string requires exactly 12 digits.
  Future<DescribeAccountResponse> describeAccount(String accountId) async {
    return DescribeAccountResponse.fromJson({});
  }

  /// Retrieves the current status of an asynchronous request to create an
  /// account.
  ///
  /// This operation can be called only from the organization's master account.
  ///
  /// [createAccountRequestId]: Specifies the `operationId` that uniquely
  /// identifies the request. You can get the ID from the response to an earlier
  /// CreateAccount request, or from the ListCreateAccountStatus operation.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) for a create account
  /// request ID string requires "car-" followed by from 8 to 32 lower-case
  /// letters or digits.
  Future<DescribeCreateAccountStatusResponse> describeCreateAccountStatus(
      String createAccountRequestId) async {
    return DescribeCreateAccountStatusResponse.fromJson({});
  }

  /// Retrieves information about a previously requested handshake. The
  /// handshake ID comes from the response to the original
  /// InviteAccountToOrganization operation that generated the handshake.
  ///
  /// You can access handshakes that are `ACCEPTED`, `DECLINED`, or `CANCELED`
  /// for only 30 days after they change to that state. They're then deleted and
  /// no longer accessible.
  ///
  /// This operation can be called from any account in the organization.
  ///
  /// [handshakeId]: The unique identifier (ID) of the handshake that you want
  /// information about. You can get the ID from the original call to
  /// InviteAccountToOrganization, or from a call to ListHandshakesForAccount or
  /// ListHandshakesForOrganization.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) for handshake ID
  /// string requires "h-" followed by from 8 to 32 lower-case letters or
  /// digits.
  Future<DescribeHandshakeResponse> describeHandshake(
      String handshakeId) async {
    return DescribeHandshakeResponse.fromJson({});
  }

  /// Retrieves information about the organization that the user's account
  /// belongs to.
  ///
  /// This operation can be called from any account in the organization.
  ///
  ///
  ///
  /// Even if a policy type is shown as available in the organization, you can
  /// disable it separately at the root level with DisablePolicyType. Use
  /// ListRoots to see the status of policy types for a specified root.
  Future<DescribeOrganizationResponse> describeOrganization() async {
    return DescribeOrganizationResponse.fromJson({});
  }

  /// Retrieves information about an organizational unit (OU).
  ///
  /// This operation can be called only from the organization's master account.
  ///
  /// [organizationalUnitId]: The unique identifier (ID) of the organizational
  /// unit that you want details about. You can get the ID from the
  /// ListOrganizationalUnitsForParent operation.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) for an organizational
  /// unit ID string requires "ou-" followed by from 4 to 32 lower-case letters
  /// or digits (the ID of the root that contains the OU) followed by a second
  /// "-" dash and from 8 to 32 additional lower-case letters or digits.
  Future<DescribeOrganizationalUnitResponse> describeOrganizationalUnit(
      String organizationalUnitId) async {
    return DescribeOrganizationalUnitResponse.fromJson({});
  }

  /// Retrieves information about a policy.
  ///
  /// This operation can be called only from the organization's master account.
  ///
  /// [policyId]: The unique identifier (ID) of the policy that you want details
  /// about. You can get the ID from the ListPolicies or ListPoliciesForTarget
  /// operations.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) for a policy ID
  /// string requires "p-" followed by from 8 to 128 lower-case letters or
  /// digits.
  Future<DescribePolicyResponse> describePolicy(String policyId) async {
    return DescribePolicyResponse.fromJson({});
  }

  /// Detaches a policy from a target root, organizational unit (OU), or
  /// account. If the policy being detached is a service control policy (SCP),
  /// the changes to permissions for IAM users and roles in affected accounts
  /// are immediate.
  ///
  ///  **Note:** Every root, OU, and account must have at least one SCP
  /// attached. If you want to replace the default `FullAWSAccess` policy with
  /// one that limits the permissions that can be delegated, you must attach the
  /// replacement policy before you can remove the default one. This is the
  /// authorization strategy of
  /// [whitelisting](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_about-scps.html#orgs_policies_whitelist).
  /// If you instead attach a second SCP and leave the `FullAWSAccess` SCP still
  /// attached, and specify `"Effect": "Deny"` in the second SCP to override the
  /// `"Effect": "Allow"` in the `FullAWSAccess` policy (or any other attached
  /// SCP), you're using the authorization strategy of
  /// [blacklisting](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_about-scps.html#orgs_policies_blacklist)
  /// .
  ///
  /// This operation can be called only from the organization's master account.
  ///
  /// [policyId]: The unique identifier (ID) of the policy you want to detach.
  /// You can get the ID from the ListPolicies or ListPoliciesForTarget
  /// operations.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) for a policy ID
  /// string requires "p-" followed by from 8 to 128 lower-case letters or
  /// digits.
  ///
  /// [targetId]: The unique identifier (ID) of the root, OU, or account that
  /// you want to detach the policy from. You can get the ID from the ListRoots,
  /// ListOrganizationalUnitsForParent, or ListAccounts operations.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) for a target ID
  /// string requires one of the following:
  ///
  /// *    **Root** \- A string that begins with "r-" followed by from 4 to 32
  /// lower-case letters or digits.
  ///
  /// *    **Account** \- A string that consists of exactly 12 digits.
  ///
  /// *    **Organizational unit (OU)** \- A string that begins with "ou-"
  /// followed by from 4 to 32 lower-case letters or digits (the ID of the root
  /// that the OU is in) followed by a second "-" dash and from 8 to 32
  /// additional lower-case letters or digits.
  Future<void> detachPolicy(
      {@required String policyId, @required String targetId}) async {}

  /// Disables the integration of an AWS service (the service that is specified
  /// by `ServicePrincipal`) with AWS Organizations. When you disable
  /// integration, the specified service no longer can create a [service-linked
  /// role](http://docs.aws.amazon.com/IAM/latest/UserGuide/using-service-linked-roles.html)
  /// in _new_ accounts in your organization. This means the service can't
  /// perform operations on your behalf on any new accounts in your
  /// organization. The service can still perform operations in older accounts
  /// until the service completes its clean-up from AWS Organizations.
  ///
  ///
  ///
  /// We recommend that you disable integration between AWS Organizations and
  /// the specified AWS service by using the console or commands that are
  /// provided by the specified service. Doing so ensures that the other service
  /// is aware that it can clean up any resources that are required only for the
  /// integration. How the service cleans up its resources in the organization's
  /// accounts depends on that service. For more information, see the
  /// documentation for the other AWS service.
  ///
  /// After you perform the `DisableAWSServiceAccess` operation, the specified
  /// service can no longer perform operations in your organization's accounts
  /// unless the operations are explicitly permitted by the IAM policies that
  /// are attached to your roles.
  ///
  /// For more information about integrating other services with AWS
  /// Organizations, including the list of services that work with
  /// Organizations, see [Integrating AWS Organizations with Other AWS
  /// Services](http://docs.aws.amazon.com/organizations/latest/userguide/orgs_integrate_services.html)
  /// in the _AWS Organizations User Guide._
  ///
  /// This operation can be called only from the organization's master account.
  ///
  /// [servicePrincipal]: The service principal name of the AWS service for
  /// which you want to disable integration with your organization. This is
  /// typically in the form of a URL, such as
  /// `_service-abbreviation_.amazonaws.com`.
  Future<void> disableAwsServiceAccess(String servicePrincipal) async {}

  /// Disables an organizational control policy type in a root. A policy of a
  /// certain type can be attached to entities in a root only if that type is
  /// enabled in the root. After you perform this operation, you no longer can
  /// attach policies of the specified type to that root or to any
  /// organizational unit (OU) or account in that root. You can undo this by
  /// using the EnablePolicyType operation.
  ///
  /// This is an asynchronous request that AWS performs in the background. If
  /// you disable a policy for a root, it still appears enabled for the
  /// organization if [all
  /// features](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_org_support-all-features.html)
  /// are enabled for the organization. AWS recommends that you first use
  /// ListRoots to see the status of policy types for a specified root, and then
  /// use this operation.
  ///
  /// This operation can be called only from the organization's master account.
  ///
  ///  To view the status of available policy types in the organization, use
  /// DescribeOrganization.
  ///
  /// [rootId]: The unique identifier (ID) of the root in which you want to
  /// disable a policy type. You can get the ID from the ListRoots operation.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) for a root ID string
  /// requires "r-" followed by from 4 to 32 lower-case letters or digits.
  ///
  /// [policyType]: The policy type that you want to disable in this root.
  Future<DisablePolicyTypeResponse> disablePolicyType(
      {@required String rootId, @required String policyType}) async {
    return DisablePolicyTypeResponse.fromJson({});
  }

  /// Enables the integration of an AWS service (the service that is specified
  /// by `ServicePrincipal`) with AWS Organizations. When you enable
  /// integration, you allow the specified service to create a [service-linked
  /// role](http://docs.aws.amazon.com/IAM/latest/UserGuide/using-service-linked-roles.html)
  /// in all the accounts in your organization. This allows the service to
  /// perform operations on your behalf in your organization and its accounts.
  ///
  ///  We recommend that you enable integration between AWS Organizations and
  /// the specified AWS service by using the console or commands that are
  /// provided by the specified service. Doing so ensures that the service is
  /// aware that it can create the resources that are required for the
  /// integration. How the service creates those resources in the organization's
  /// accounts depends on that service. For more information, see the
  /// documentation for the other AWS service.
  ///
  /// For more information about enabling services to integrate with AWS
  /// Organizations, see [Integrating AWS Organizations with Other AWS
  /// Services](http://docs.aws.amazon.com/organizations/latest/userguide/orgs_integrate_services.html)
  /// in the _AWS Organizations User Guide._
  ///
  /// This operation can be called only from the organization's master account
  /// and only if the organization has [enabled all
  /// features](http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_org_support-all-features.html).
  ///
  /// [servicePrincipal]: The service principal name of the AWS service for
  /// which you want to enable integration with your organization. This is
  /// typically in the form of a URL, such as
  /// `_service-abbreviation_.amazonaws.com`.
  Future<void> enableAwsServiceAccess(String servicePrincipal) async {}

  /// Enables all features in an organization. This enables the use of
  /// organization policies that can restrict the services and actions that can
  /// be called in each account. Until you enable all features, you have access
  /// only to consolidated billing, and you can't use any of the advanced
  /// account administration features that AWS Organizations supports. For more
  /// information, see [Enabling All Features in Your
  /// Organization](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_org_support-all-features.html)
  /// in the _AWS Organizations User Guide._
  ///
  ///  This operation is required only for organizations that were created
  /// explicitly with only the consolidated billing features enabled. Calling
  /// this operation sends a handshake to every invited account in the
  /// organization. The feature set change can be finalized and the additional
  /// features enabled only after all administrators in the invited accounts
  /// approve the change by accepting the handshake.
  ///
  /// After you enable all features, you can separately enable or disable
  /// individual policy types in a root using EnablePolicyType and
  /// DisablePolicyType. To see the status of policy types in a root, use
  /// ListRoots.
  ///
  /// After all invited member accounts accept the handshake, you finalize the
  /// feature set change by accepting the handshake that contains `"Action":
  /// "ENABLE\_ALL\_FEATURES"`. This completes the change.
  ///
  /// After you enable all features in your organization, the master account in
  /// the organization can apply policies on all member accounts. These policies
  /// can restrict what users and even administrators in those accounts can do.
  /// The master account can apply policies that prevent accounts from leaving
  /// the organization. Ensure that your account administrators are aware of
  /// this.
  ///
  /// This operation can be called only from the organization's master account.
  Future<EnableAllFeaturesResponse> enableAllFeatures() async {
    return EnableAllFeaturesResponse.fromJson({});
  }

  /// Enables a policy type in a root. After you enable a policy type in a root,
  /// you can attach policies of that type to the root, any organizational unit
  /// (OU), or account in that root. You can undo this by using the
  /// DisablePolicyType operation.
  ///
  /// This is an asynchronous request that AWS performs in the background. AWS
  /// recommends that you first use ListRoots to see the status of policy types
  /// for a specified root, and then use this operation.
  ///
  /// This operation can be called only from the organization's master account.
  ///
  /// You can enable a policy type in a root only if that policy type is
  /// available in the organization. To view the status of available policy
  /// types in the organization, use DescribeOrganization.
  ///
  /// [rootId]: The unique identifier (ID) of the root in which you want to
  /// enable a policy type. You can get the ID from the ListRoots operation.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) for a root ID string
  /// requires "r-" followed by from 4 to 32 lower-case letters or digits.
  ///
  /// [policyType]: The policy type that you want to enable.
  Future<EnablePolicyTypeResponse> enablePolicyType(
      {@required String rootId, @required String policyType}) async {
    return EnablePolicyTypeResponse.fromJson({});
  }

  /// Sends an invitation to another account to join your organization as a
  /// member account. AWS Organizations sends email on your behalf to the email
  /// address that is associated with the other account's owner. The invitation
  /// is implemented as a Handshake whose details are in the response.
  ///
  ///  *   You can invite AWS accounts only from the same seller as the master
  /// account. For example, if your organization's master account was created by
  /// Amazon Internet Services Pvt. Ltd (AISPL), an AWS seller in India, you can
  /// invite only other AISPL accounts to your organization. You can't combine
  /// accounts from AISPL and AWS or from any other AWS seller. For more
  /// information, see [Consolidated Billing in
  /// India](http://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/useconsolidatedbilliing-India.html).
  ///
  /// *   If you receive an exception that indicates that you exceeded your
  /// account limits for the organization or that the operation failed because
  /// your organization is still initializing, wait one hour and then try again.
  /// If the error persists after an hour, contact [AWS
  /// Support](https://console.aws.amazon.com/support/home#/).
  ///
  /// This operation can be called only from the organization's master account.
  ///
  /// [target]: The identifier (ID) of the AWS account that you want to invite
  /// to join your organization. This is a JSON object that contains the
  /// following elements:
  ///
  ///  `{ "Type": "ACCOUNT", "Id": "< _**account id number**_ >" }`
  ///
  /// If you use the AWS CLI, you can submit this as a single string, similar to
  /// the following example:
  ///
  ///  `--target Id=123456789012,Type=ACCOUNT`
  ///
  /// If you specify `"Type": "ACCOUNT"`, you must provide the AWS account ID
  /// number as the `Id`. If you specify `"Type": "EMAIL"`, you must specify the
  /// email address that is associated with the account.
  ///
  ///  `--target Id=diego@example.com,Type=EMAIL`
  ///
  /// [notes]: Additional information that you want to include in the generated
  /// email to the recipient account owner.
  Future<InviteAccountToOrganizationResponse> inviteAccountToOrganization(
      HandshakeParty target,
      {String notes}) async {
    return InviteAccountToOrganizationResponse.fromJson({});
  }

  /// Removes a member account from its parent organization. This version of the
  /// operation is performed by the account that wants to leave. To remove a
  /// member account as a user in the master account, use
  /// RemoveAccountFromOrganization instead.
  ///
  /// This operation can be called only from a member account in the
  /// organization.
  ///
  ///
  ///
  /// *   The master account in an organization with all features enabled can
  /// set service control policies (SCPs) that can restrict what administrators
  /// of member accounts can do, including preventing them from successfully
  /// calling `LeaveOrganization` and leaving the organization.
  ///
  /// *   You can leave an organization as a member account only if the account
  /// is configured with the information required to operate as a standalone
  /// account. When you create an account in an organization using the AWS
  /// Organizations console, API, or CLI commands, the information required of
  /// standalone accounts is _not_ automatically collected. For each account
  /// that you want to make standalone, you must accept the end user license
  /// agreement (EULA), choose a support plan, provide and verify the required
  /// contact information, and provide a current payment method. AWS uses the
  /// payment method to charge for any billable (not free tier) AWS activity
  /// that occurs while the account isn't attached to an organization. Follow
  /// the steps at  [To leave an organization when all required account
  /// information has not yet been
  /// provided](http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_remove.html#leave-without-all-info)
  /// in the _AWS Organizations User Guide._
  ///
  /// *   You can leave an organization only after you enable IAM user access to
  /// billing in your account. For more information, see [Activating Access to
  /// the Billing and Cost Management
  /// Console](http://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/grantaccess.html#ControllingAccessWebsite-Activate)
  /// in the _AWS Billing and Cost Management User Guide._
  Future<void> leaveOrganization() async {}

  /// Returns a list of the AWS services that you enabled to integrate with your
  /// organization. After a service on this list creates the resources that it
  /// requires for the integration, it can perform operations on your
  /// organization and its accounts.
  ///
  /// For more information about integrating other services with AWS
  /// Organizations, including the list of services that currently work with
  /// Organizations, see [Integrating AWS Organizations with Other AWS
  /// Services](http://docs.aws.amazon.com/organizations/latest/userguide/orgs_integrate_services.html)
  /// in the _AWS Organizations User Guide._
  ///
  /// This operation can be called only from the organization's master account.
  ///
  /// [nextToken]: Use this parameter if you receive a `NextToken` response in a
  /// previous request that indicates that there is more output available. Set
  /// it to the value of the previous call's `NextToken` response to indicate
  /// where the output should continue from.
  ///
  /// [maxResults]: (Optional) Use this to limit the number of results you want
  /// included per page in the response. If you do not include this parameter,
  /// it defaults to a value that is specific to the operation. If additional
  /// items exist beyond the maximum you specify, the `NextToken` response
  /// element is present and has a value (is not null). Include that value as
  /// the `NextToken` request parameter in the next call to the operation to get
  /// the next part of the results. Note that Organizations might return fewer
  /// results than the maximum even when there are more results available. You
  /// should check `NextToken` after every operation to ensure that you receive
  /// all of the results.
  Future<ListAwsServiceAccessForOrganizationResponse>
      listAwsServiceAccessForOrganization(
          {String nextToken, int maxResults}) async {
    return ListAwsServiceAccessForOrganizationResponse.fromJson({});
  }

  /// Lists all the accounts in the organization. To request only the accounts
  /// in a specified root or organizational unit (OU), use the
  /// ListAccountsForParent operation instead.
  ///
  ///  Always check the `NextToken` response parameter for a `null` value when
  /// calling a `List*` operation. These operations can occasionally return an
  /// empty set of results even when there are more results available. The
  /// `NextToken` response parameter value is `null` _only_ when there are no
  /// more results to display.
  ///
  /// This operation can be called only from the organization's master account.
  ///
  /// [nextToken]: Use this parameter if you receive a `NextToken` response in a
  /// previous request that indicates that there is more output available. Set
  /// it to the value of the previous call's `NextToken` response to indicate
  /// where the output should continue from.
  ///
  /// [maxResults]: (Optional) Use this to limit the number of results you want
  /// included per page in the response. If you do not include this parameter,
  /// it defaults to a value that is specific to the operation. If additional
  /// items exist beyond the maximum you specify, the `NextToken` response
  /// element is present and has a value (is not null). Include that value as
  /// the `NextToken` request parameter in the next call to the operation to get
  /// the next part of the results. Note that Organizations might return fewer
  /// results than the maximum even when there are more results available. You
  /// should check `NextToken` after every operation to ensure that you receive
  /// all of the results.
  Future<ListAccountsResponse> listAccounts(
      {String nextToken, int maxResults}) async {
    return ListAccountsResponse.fromJson({});
  }

  /// Lists the accounts in an organization that are contained by the specified
  /// target root or organizational unit (OU). If you specify the root, you get
  /// a list of all the accounts that aren't in any OU. If you specify an OU,
  /// you get a list of all the accounts in only that OU and not in any child
  /// OUs. To get a list of all accounts in the organization, use the
  /// ListAccounts operation.
  ///
  ///  Always check the `NextToken` response parameter for a `null` value when
  /// calling a `List*` operation. These operations can occasionally return an
  /// empty set of results even when there are more results available. The
  /// `NextToken` response parameter value is `null` _only_ when there are no
  /// more results to display.
  ///
  /// This operation can be called only from the organization's master account.
  ///
  /// [parentId]: The unique identifier (ID) for the parent root or organization
  /// unit (OU) whose accounts you want to list.
  ///
  /// [nextToken]: Use this parameter if you receive a `NextToken` response in a
  /// previous request that indicates that there is more output available. Set
  /// it to the value of the previous call's `NextToken` response to indicate
  /// where the output should continue from.
  ///
  /// [maxResults]: (Optional) Use this to limit the number of results you want
  /// included per page in the response. If you do not include this parameter,
  /// it defaults to a value that is specific to the operation. If additional
  /// items exist beyond the maximum you specify, the `NextToken` response
  /// element is present and has a value (is not null). Include that value as
  /// the `NextToken` request parameter in the next call to the operation to get
  /// the next part of the results. Note that Organizations might return fewer
  /// results than the maximum even when there are more results available. You
  /// should check `NextToken` after every operation to ensure that you receive
  /// all of the results.
  Future<ListAccountsForParentResponse> listAccountsForParent(String parentId,
      {String nextToken, int maxResults}) async {
    return ListAccountsForParentResponse.fromJson({});
  }

  /// Lists all of the organizational units (OUs) or accounts that are contained
  /// in the specified parent OU or root. This operation, along with ListParents
  /// enables you to traverse the tree structure that makes up this root.
  ///
  ///  Always check the `NextToken` response parameter for a `null` value when
  /// calling a `List*` operation. These operations can occasionally return an
  /// empty set of results even when there are more results available. The
  /// `NextToken` response parameter value is `null` _only_ when there are no
  /// more results to display.
  ///
  /// This operation can be called only from the organization's master account.
  ///
  /// [parentId]: The unique identifier (ID) for the parent root or OU whose
  /// children you want to list.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) for a parent ID
  /// string requires one of the following:
  ///
  /// *    **Root** \- A string that begins with "r-" followed by from 4 to 32
  /// lower-case letters or digits.
  ///
  /// *    **Organizational unit (OU)** \- A string that begins with "ou-"
  /// followed by from 4 to 32 lower-case letters or digits (the ID of the root
  /// that the OU is in) followed by a second "-" dash and from 8 to 32
  /// additional lower-case letters or digits.
  ///
  /// [childType]: Filters the output to include only the specified child type.
  ///
  /// [nextToken]: Use this parameter if you receive a `NextToken` response in a
  /// previous request that indicates that there is more output available. Set
  /// it to the value of the previous call's `NextToken` response to indicate
  /// where the output should continue from.
  ///
  /// [maxResults]: (Optional) Use this to limit the number of results you want
  /// included per page in the response. If you do not include this parameter,
  /// it defaults to a value that is specific to the operation. If additional
  /// items exist beyond the maximum you specify, the `NextToken` response
  /// element is present and has a value (is not null). Include that value as
  /// the `NextToken` request parameter in the next call to the operation to get
  /// the next part of the results. Note that Organizations might return fewer
  /// results than the maximum even when there are more results available. You
  /// should check `NextToken` after every operation to ensure that you receive
  /// all of the results.
  Future<ListChildrenResponse> listChildren(
      {@required String parentId,
      @required String childType,
      String nextToken,
      int maxResults}) async {
    return ListChildrenResponse.fromJson({});
  }

  /// Lists the account creation requests that match the specified status that
  /// is currently being tracked for the organization.
  ///
  ///  Always check the `NextToken` response parameter for a `null` value when
  /// calling a `List*` operation. These operations can occasionally return an
  /// empty set of results even when there are more results available. The
  /// `NextToken` response parameter value is `null` _only_ when there are no
  /// more results to display.
  ///
  /// This operation can be called only from the organization's master account.
  ///
  /// [states]: A list of one or more states that you want included in the
  /// response. If this parameter isn't present, all requests are included in
  /// the response.
  ///
  /// [nextToken]: Use this parameter if you receive a `NextToken` response in a
  /// previous request that indicates that there is more output available. Set
  /// it to the value of the previous call's `NextToken` response to indicate
  /// where the output should continue from.
  ///
  /// [maxResults]: (Optional) Use this to limit the number of results you want
  /// included per page in the response. If you do not include this parameter,
  /// it defaults to a value that is specific to the operation. If additional
  /// items exist beyond the maximum you specify, the `NextToken` response
  /// element is present and has a value (is not null). Include that value as
  /// the `NextToken` request parameter in the next call to the operation to get
  /// the next part of the results. Note that Organizations might return fewer
  /// results than the maximum even when there are more results available. You
  /// should check `NextToken` after every operation to ensure that you receive
  /// all of the results.
  Future<ListCreateAccountStatusResponse> listCreateAccountStatus(
      {List<String> states, String nextToken, int maxResults}) async {
    return ListCreateAccountStatusResponse.fromJson({});
  }

  /// Lists the current handshakes that are associated with the account of the
  /// requesting user.
  ///
  /// Handshakes that are `ACCEPTED`, `DECLINED`, or `CANCELED` appear in the
  /// results of this API for only 30 days after changing to that state. After
  /// that, they're deleted and no longer accessible.
  ///
  ///  Always check the `NextToken` response parameter for a `null` value when
  /// calling a `List*` operation. These operations can occasionally return an
  /// empty set of results even when there are more results available. The
  /// `NextToken` response parameter value is `null` _only_ when there are no
  /// more results to display.
  ///
  /// This operation can be called from any account in the organization.
  ///
  /// [filter]: Filters the handshakes that you want included in the response.
  /// The default is all types. Use the `ActionType` element to limit the output
  /// to only a specified type, such as `INVITE`, `ENABLE\_ALL\_FEATURES`, or
  /// `APPROVE\_ALL\_FEATURES`. Alternatively, for the `ENABLE\_ALL\_FEATURES`
  /// handshake that generates a separate child handshake for each member
  /// account, you can specify `ParentHandshakeId` to see only the handshakes
  /// that were generated by that parent request.
  ///
  /// [nextToken]: Use this parameter if you receive a `NextToken` response in a
  /// previous request that indicates that there is more output available. Set
  /// it to the value of the previous call's `NextToken` response to indicate
  /// where the output should continue from.
  ///
  /// [maxResults]: (Optional) Use this to limit the number of results you want
  /// included per page in the response. If you do not include this parameter,
  /// it defaults to a value that is specific to the operation. If additional
  /// items exist beyond the maximum you specify, the `NextToken` response
  /// element is present and has a value (is not null). Include that value as
  /// the `NextToken` request parameter in the next call to the operation to get
  /// the next part of the results. Note that Organizations might return fewer
  /// results than the maximum even when there are more results available. You
  /// should check `NextToken` after every operation to ensure that you receive
  /// all of the results.
  Future<ListHandshakesForAccountResponse> listHandshakesForAccount(
      {HandshakeFilter filter, String nextToken, int maxResults}) async {
    return ListHandshakesForAccountResponse.fromJson({});
  }

  /// Lists the handshakes that are associated with the organization that the
  /// requesting user is part of. The `ListHandshakesForOrganization` operation
  /// returns a list of handshake structures. Each structure contains details
  /// and status about a handshake.
  ///
  /// Handshakes that are `ACCEPTED`, `DECLINED`, or `CANCELED` appear in the
  /// results of this API for only 30 days after changing to that state. After
  /// that, they're deleted and no longer accessible.
  ///
  ///  Always check the `NextToken` response parameter for a `null` value when
  /// calling a `List*` operation. These operations can occasionally return an
  /// empty set of results even when there are more results available. The
  /// `NextToken` response parameter value is `null` _only_ when there are no
  /// more results to display.
  ///
  /// This operation can be called only from the organization's master account.
  ///
  /// [filter]: A filter of the handshakes that you want included in the
  /// response. The default is all types. Use the `ActionType` element to limit
  /// the output to only a specified type, such as `INVITE`,
  /// `ENABLE-ALL-FEATURES`, or `APPROVE-ALL-FEATURES`. Alternatively, for the
  /// `ENABLE-ALL-FEATURES` handshake that generates a separate child handshake
  /// for each member account, you can specify the `ParentHandshakeId` to see
  /// only the handshakes that were generated by that parent request.
  ///
  /// [nextToken]: Use this parameter if you receive a `NextToken` response in a
  /// previous request that indicates that there is more output available. Set
  /// it to the value of the previous call's `NextToken` response to indicate
  /// where the output should continue from.
  ///
  /// [maxResults]: (Optional) Use this to limit the number of results you want
  /// included per page in the response. If you do not include this parameter,
  /// it defaults to a value that is specific to the operation. If additional
  /// items exist beyond the maximum you specify, the `NextToken` response
  /// element is present and has a value (is not null). Include that value as
  /// the `NextToken` request parameter in the next call to the operation to get
  /// the next part of the results. Note that Organizations might return fewer
  /// results than the maximum even when there are more results available. You
  /// should check `NextToken` after every operation to ensure that you receive
  /// all of the results.
  Future<ListHandshakesForOrganizationResponse> listHandshakesForOrganization(
      {HandshakeFilter filter, String nextToken, int maxResults}) async {
    return ListHandshakesForOrganizationResponse.fromJson({});
  }

  /// Lists the organizational units (OUs) in a parent organizational unit or
  /// root.
  ///
  ///  Always check the `NextToken` response parameter for a `null` value when
  /// calling a `List*` operation. These operations can occasionally return an
  /// empty set of results even when there are more results available. The
  /// `NextToken` response parameter value is `null` _only_ when there are no
  /// more results to display.
  ///
  /// This operation can be called only from the organization's master account.
  ///
  /// [parentId]: The unique identifier (ID) of the root or OU whose child OUs
  /// you want to list.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) for a parent ID
  /// string requires one of the following:
  ///
  /// *    **Root** \- A string that begins with "r-" followed by from 4 to 32
  /// lower-case letters or digits.
  ///
  /// *    **Organizational unit (OU)** \- A string that begins with "ou-"
  /// followed by from 4 to 32 lower-case letters or digits (the ID of the root
  /// that the OU is in) followed by a second "-" dash and from 8 to 32
  /// additional lower-case letters or digits.
  ///
  /// [nextToken]: Use this parameter if you receive a `NextToken` response in a
  /// previous request that indicates that there is more output available. Set
  /// it to the value of the previous call's `NextToken` response to indicate
  /// where the output should continue from.
  ///
  /// [maxResults]: (Optional) Use this to limit the number of results you want
  /// included per page in the response. If you do not include this parameter,
  /// it defaults to a value that is specific to the operation. If additional
  /// items exist beyond the maximum you specify, the `NextToken` response
  /// element is present and has a value (is not null). Include that value as
  /// the `NextToken` request parameter in the next call to the operation to get
  /// the next part of the results. Note that Organizations might return fewer
  /// results than the maximum even when there are more results available. You
  /// should check `NextToken` after every operation to ensure that you receive
  /// all of the results.
  Future<ListOrganizationalUnitsForParentResponse>
      listOrganizationalUnitsForParent(String parentId,
          {String nextToken, int maxResults}) async {
    return ListOrganizationalUnitsForParentResponse.fromJson({});
  }

  /// Lists the root or organizational units (OUs) that serve as the immediate
  /// parent of the specified child OU or account. This operation, along with
  /// ListChildren enables you to traverse the tree structure that makes up this
  /// root.
  ///
  ///  Always check the `NextToken` response parameter for a `null` value when
  /// calling a `List*` operation. These operations can occasionally return an
  /// empty set of results even when there are more results available. The
  /// `NextToken` response parameter value is `null` _only_ when there are no
  /// more results to display.
  ///
  /// This operation can be called only from the organization's master account.
  ///
  ///
  ///
  /// In the current release, a child can have only a single parent.
  ///
  /// [childId]: The unique identifier (ID) of the OU or account whose parent
  /// containers you want to list. Don't specify a root.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) for a child ID string
  /// requires one of the following:
  ///
  /// *    **Account** \- A string that consists of exactly 12 digits.
  ///
  /// *    **Organizational unit (OU)** \- A string that begins with "ou-"
  /// followed by from 4 to 32 lower-case letters or digits (the ID of the root
  /// that contains the OU) followed by a second "-" dash and from 8 to 32
  /// additional lower-case letters or digits.
  ///
  /// [nextToken]: Use this parameter if you receive a `NextToken` response in a
  /// previous request that indicates that there is more output available. Set
  /// it to the value of the previous call's `NextToken` response to indicate
  /// where the output should continue from.
  ///
  /// [maxResults]: (Optional) Use this to limit the number of results you want
  /// included per page in the response. If you do not include this parameter,
  /// it defaults to a value that is specific to the operation. If additional
  /// items exist beyond the maximum you specify, the `NextToken` response
  /// element is present and has a value (is not null). Include that value as
  /// the `NextToken` request parameter in the next call to the operation to get
  /// the next part of the results. Note that Organizations might return fewer
  /// results than the maximum even when there are more results available. You
  /// should check `NextToken` after every operation to ensure that you receive
  /// all of the results.
  Future<ListParentsResponse> listParents(String childId,
      {String nextToken, int maxResults}) async {
    return ListParentsResponse.fromJson({});
  }

  /// Retrieves the list of all policies in an organization of a specified type.
  ///
  ///  Always check the `NextToken` response parameter for a `null` value when
  /// calling a `List*` operation. These operations can occasionally return an
  /// empty set of results even when there are more results available. The
  /// `NextToken` response parameter value is `null` _only_ when there are no
  /// more results to display.
  ///
  /// This operation can be called only from the organization's master account.
  ///
  /// [filter]: Specifies the type of policy that you want to include in the
  /// response.
  ///
  /// [nextToken]: Use this parameter if you receive a `NextToken` response in a
  /// previous request that indicates that there is more output available. Set
  /// it to the value of the previous call's `NextToken` response to indicate
  /// where the output should continue from.
  ///
  /// [maxResults]: (Optional) Use this to limit the number of results you want
  /// included per page in the response. If you do not include this parameter,
  /// it defaults to a value that is specific to the operation. If additional
  /// items exist beyond the maximum you specify, the `NextToken` response
  /// element is present and has a value (is not null). Include that value as
  /// the `NextToken` request parameter in the next call to the operation to get
  /// the next part of the results. Note that Organizations might return fewer
  /// results than the maximum even when there are more results available. You
  /// should check `NextToken` after every operation to ensure that you receive
  /// all of the results.
  Future<ListPoliciesResponse> listPolicies(String filter,
      {String nextToken, int maxResults}) async {
    return ListPoliciesResponse.fromJson({});
  }

  /// Lists the policies that are directly attached to the specified target
  /// root, organizational unit (OU), or account. You must specify the policy
  /// type that you want included in the returned list.
  ///
  ///  Always check the `NextToken` response parameter for a `null` value when
  /// calling a `List*` operation. These operations can occasionally return an
  /// empty set of results even when there are more results available. The
  /// `NextToken` response parameter value is `null` _only_ when there are no
  /// more results to display.
  ///
  /// This operation can be called only from the organization's master account.
  ///
  /// [targetId]: The unique identifier (ID) of the root, organizational unit,
  /// or account whose policies you want to list.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) for a target ID
  /// string requires one of the following:
  ///
  /// *    **Root** \- A string that begins with "r-" followed by from 4 to 32
  /// lower-case letters or digits.
  ///
  /// *    **Account** \- A string that consists of exactly 12 digits.
  ///
  /// *    **Organizational unit (OU)** \- A string that begins with "ou-"
  /// followed by from 4 to 32 lower-case letters or digits (the ID of the root
  /// that the OU is in) followed by a second "-" dash and from 8 to 32
  /// additional lower-case letters or digits.
  ///
  /// [filter]: The type of policy that you want to include in the returned
  /// list.
  ///
  /// [nextToken]: Use this parameter if you receive a `NextToken` response in a
  /// previous request that indicates that there is more output available. Set
  /// it to the value of the previous call's `NextToken` response to indicate
  /// where the output should continue from.
  ///
  /// [maxResults]: (Optional) Use this to limit the number of results you want
  /// included per page in the response. If you do not include this parameter,
  /// it defaults to a value that is specific to the operation. If additional
  /// items exist beyond the maximum you specify, the `NextToken` response
  /// element is present and has a value (is not null). Include that value as
  /// the `NextToken` request parameter in the next call to the operation to get
  /// the next part of the results. Note that Organizations might return fewer
  /// results than the maximum even when there are more results available. You
  /// should check `NextToken` after every operation to ensure that you receive
  /// all of the results.
  Future<ListPoliciesForTargetResponse> listPoliciesForTarget(
      {@required String targetId,
      @required String filter,
      String nextToken,
      int maxResults}) async {
    return ListPoliciesForTargetResponse.fromJson({});
  }

  /// Lists the roots that are defined in the current organization.
  ///
  ///  Always check the `NextToken` response parameter for a `null` value when
  /// calling a `List*` operation. These operations can occasionally return an
  /// empty set of results even when there are more results available. The
  /// `NextToken` response parameter value is `null` _only_ when there are no
  /// more results to display.
  ///
  /// This operation can be called only from the organization's master account.
  ///
  ///
  ///
  /// Policy types can be enabled and disabled in roots. This is distinct from
  /// whether they're available in the organization. When you enable all
  /// features, you make policy types available for use in that organization.
  /// Individual policy types can then be enabled and disabled in a root. To see
  /// the availability of a policy type in an organization, use
  /// DescribeOrganization.
  ///
  /// [nextToken]: Use this parameter if you receive a `NextToken` response in a
  /// previous request that indicates that there is more output available. Set
  /// it to the value of the previous call's `NextToken` response to indicate
  /// where the output should continue from.
  ///
  /// [maxResults]: (Optional) Use this to limit the number of results you want
  /// included per page in the response. If you do not include this parameter,
  /// it defaults to a value that is specific to the operation. If additional
  /// items exist beyond the maximum you specify, the `NextToken` response
  /// element is present and has a value (is not null). Include that value as
  /// the `NextToken` request parameter in the next call to the operation to get
  /// the next part of the results. Note that Organizations might return fewer
  /// results than the maximum even when there are more results available. You
  /// should check `NextToken` after every operation to ensure that you receive
  /// all of the results.
  Future<ListRootsResponse> listRoots(
      {String nextToken, int maxResults}) async {
    return ListRootsResponse.fromJson({});
  }

  /// Lists tags for the specified resource.
  ///
  /// Currently, you can list tags on an account in AWS Organizations.
  ///
  /// [resourceId]: The ID of the resource that you want to retrieve tags for.
  ///
  /// [nextToken]: Use this parameter if you receive a `NextToken` response in a
  /// previous request that indicates that there is more output available. Set
  /// it to the value of the previous call's `NextToken` response to indicate
  /// where the output should continue from.
  Future<ListTagsForResourceResponse> listTagsForResource(String resourceId,
      {String nextToken}) async {
    return ListTagsForResourceResponse.fromJson({});
  }

  /// Lists all the roots, organizational units (OUs), and accounts that the
  /// specified policy is attached to.
  ///
  ///  Always check the `NextToken` response parameter for a `null` value when
  /// calling a `List*` operation. These operations can occasionally return an
  /// empty set of results even when there are more results available. The
  /// `NextToken` response parameter value is `null` _only_ when there are no
  /// more results to display.
  ///
  /// This operation can be called only from the organization's master account.
  ///
  /// [policyId]: The unique identifier (ID) of the policy whose attachments you
  /// want to know.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) for a policy ID
  /// string requires "p-" followed by from 8 to 128 lower-case letters or
  /// digits.
  ///
  /// [nextToken]: Use this parameter if you receive a `NextToken` response in a
  /// previous request that indicates that there is more output available. Set
  /// it to the value of the previous call's `NextToken` response to indicate
  /// where the output should continue from.
  ///
  /// [maxResults]: (Optional) Use this to limit the number of results you want
  /// included per page in the response. If you do not include this parameter,
  /// it defaults to a value that is specific to the operation. If additional
  /// items exist beyond the maximum you specify, the `NextToken` response
  /// element is present and has a value (is not null). Include that value as
  /// the `NextToken` request parameter in the next call to the operation to get
  /// the next part of the results. Note that Organizations might return fewer
  /// results than the maximum even when there are more results available. You
  /// should check `NextToken` after every operation to ensure that you receive
  /// all of the results.
  Future<ListTargetsForPolicyResponse> listTargetsForPolicy(String policyId,
      {String nextToken, int maxResults}) async {
    return ListTargetsForPolicyResponse.fromJson({});
  }

  /// Moves an account from its current source parent root or organizational
  /// unit (OU) to the specified destination parent root or OU.
  ///
  /// This operation can be called only from the organization's master account.
  ///
  /// [accountId]: The unique identifier (ID) of the account that you want to
  /// move.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) for an account ID
  /// string requires exactly 12 digits.
  ///
  /// [sourceParentId]: The unique identifier (ID) of the root or organizational
  /// unit that you want to move the account from.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) for a parent ID
  /// string requires one of the following:
  ///
  /// *    **Root** \- A string that begins with "r-" followed by from 4 to 32
  /// lower-case letters or digits.
  ///
  /// *    **Organizational unit (OU)** \- A string that begins with "ou-"
  /// followed by from 4 to 32 lower-case letters or digits (the ID of the root
  /// that the OU is in) followed by a second "-" dash and from 8 to 32
  /// additional lower-case letters or digits.
  ///
  /// [destinationParentId]: The unique identifier (ID) of the root or
  /// organizational unit that you want to move the account to.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) for a parent ID
  /// string requires one of the following:
  ///
  /// *    **Root** \- A string that begins with "r-" followed by from 4 to 32
  /// lower-case letters or digits.
  ///
  /// *    **Organizational unit (OU)** \- A string that begins with "ou-"
  /// followed by from 4 to 32 lower-case letters or digits (the ID of the root
  /// that the OU is in) followed by a second "-" dash and from 8 to 32
  /// additional lower-case letters or digits.
  Future<void> moveAccount(
      {@required String accountId,
      @required String sourceParentId,
      @required String destinationParentId}) async {}

  /// Removes the specified account from the organization.
  ///
  /// The removed account becomes a standalone account that isn't a member of
  /// any organization. It's no longer subject to any policies and is
  /// responsible for its own bill payments. The organization's master account
  /// is no longer charged for any expenses accrued by the member account after
  /// it's removed from the organization.
  ///
  /// This operation can be called only from the organization's master account.
  /// Member accounts can remove themselves with LeaveOrganization instead.
  ///
  ///
  ///
  /// You can remove an account from your organization only if the account is
  /// configured with the information required to operate as a standalone
  /// account. When you create an account in an organization using the AWS
  /// Organizations console, API, or CLI commands, the information required of
  /// standalone accounts is _not_ automatically collected. For an account that
  /// you want to make standalone, you must accept the end user license
  /// agreement (EULA), choose a support plan, provide and verify the required
  /// contact information, and provide a current payment method. AWS uses the
  /// payment method to charge for any billable (not free tier) AWS activity
  /// that occurs while the account isn't attached to an organization. To remove
  /// an account that doesn't yet have this information, you must sign in as the
  /// member account and follow the steps at  [To leave an organization when all
  /// required account information has not yet been
  /// provided](http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_remove.html#leave-without-all-info)
  /// in the _AWS Organizations User Guide._
  ///
  /// [accountId]: The unique identifier (ID) of the member account that you
  /// want to remove from the organization.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) for an account ID
  /// string requires exactly 12 digits.
  Future<void> removeAccountFromOrganization(String accountId) async {}

  /// Adds one or more tags to the specified resource.
  ///
  /// Currently, you can tag and untag accounts in AWS Organizations.
  ///
  /// [resourceId]: The ID of the resource to add a tag to.
  ///
  /// [tags]: The tag to add to the specified resource. Specifying the tag key
  /// is required. You can set the value of a tag to an empty string, but you
  /// can't set the value of a tag to null.
  Future<void> tagResource(
      {@required String resourceId, @required List<Tag> tags}) async {}

  /// Removes a tag from the specified resource.
  ///
  /// Currently, you can tag and untag accounts in AWS Organizations.
  ///
  /// [resourceId]: The ID of the resource to remove the tag from.
  ///
  /// [tagKeys]: The tag to remove from the specified resource.
  Future<void> untagResource(
      {@required String resourceId, @required List<String> tagKeys}) async {}

  /// Renames the specified organizational unit (OU). The ID and ARN don't
  /// change. The child OUs and accounts remain in place, and any attached
  /// policies of the OU remain attached.
  ///
  /// This operation can be called only from the organization's master account.
  ///
  /// [organizationalUnitId]: The unique identifier (ID) of the OU that you want
  /// to rename. You can get the ID from the ListOrganizationalUnitsForParent
  /// operation.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) for an organizational
  /// unit ID string requires "ou-" followed by from 4 to 32 lower-case letters
  /// or digits (the ID of the root that contains the OU) followed by a second
  /// "-" dash and from 8 to 32 additional lower-case letters or digits.
  ///
  /// [name]: The new name that you want to assign to the OU.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) that is used to
  /// validate this parameter is a string of any of the characters in the ASCII
  /// character range.
  Future<UpdateOrganizationalUnitResponse> updateOrganizationalUnit(
      String organizationalUnitId,
      {String name}) async {
    return UpdateOrganizationalUnitResponse.fromJson({});
  }

  /// Updates an existing policy with a new name, description, or content. If
  /// you don't supply any parameter, that value remains unchanged. You can't
  /// change a policy's type.
  ///
  /// This operation can be called only from the organization's master account.
  ///
  /// [policyId]: The unique identifier (ID) of the policy that you want to
  /// update.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) for a policy ID
  /// string requires "p-" followed by from 8 to 128 lower-case letters or
  /// digits.
  ///
  /// [name]: If provided, the new name for the policy.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) that is used to
  /// validate this parameter is a string of any of the characters in the ASCII
  /// character range.
  ///
  /// [description]: If provided, the new description for the policy.
  ///
  /// [content]: If provided, the new content for the policy. The text must be
  /// correctly formatted JSON that complies with the syntax for the policy's
  /// type. For more information, see [Service Control Policy
  /// Syntax](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_reference_scp-syntax.html)
  /// in the _AWS Organizations User Guide._
  Future<UpdatePolicyResponse> updatePolicy(String policyId,
      {String name, String description, String content}) async {
    return UpdatePolicyResponse.fromJson({});
  }
}

class AcceptHandshakeResponse {
  /// A structure that contains details about the accepted handshake.
  final Handshake handshake;

  AcceptHandshakeResponse({
    this.handshake,
  });
  static AcceptHandshakeResponse fromJson(Map<String, dynamic> json) =>
      AcceptHandshakeResponse();
}

class Account {
  /// The unique identifier (ID) of the account.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) for an account ID
  /// string requires exactly 12 digits.
  final String id;

  /// The Amazon Resource Name (ARN) of the account.
  ///
  /// For more information about ARNs in Organizations, see [ARN Formats
  /// Supported by
  /// Organizations](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_permissions.html#orgs-permissions-arns)
  /// in the _AWS Organizations User Guide_.
  final String arn;

  /// The email address associated with the AWS account.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) for this parameter is
  /// a string of characters that represents a standard Internet email address.
  final String email;

  /// The friendly name of the account.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) that is used to
  /// validate this parameter is a string of any of the characters in the ASCII
  /// character range.
  final String name;

  /// The status of the account in the organization.
  final String status;

  /// The method by which the account joined the organization.
  final String joinedMethod;

  /// The date the account became a part of the organization.
  final DateTime joinedTimestamp;

  Account({
    this.id,
    this.arn,
    this.email,
    this.name,
    this.status,
    this.joinedMethod,
    this.joinedTimestamp,
  });
  static Account fromJson(Map<String, dynamic> json) => Account();
}

class CancelHandshakeResponse {
  /// A structure that contains details about the handshake that you canceled.
  final Handshake handshake;

  CancelHandshakeResponse({
    this.handshake,
  });
  static CancelHandshakeResponse fromJson(Map<String, dynamic> json) =>
      CancelHandshakeResponse();
}

class Child {
  /// The unique identifier (ID) of this child entity.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) for a child ID string
  /// requires one of the following:
  ///
  /// *   Account: a string that consists of exactly 12 digits.
  ///
  /// *   Organizational unit (OU): a string that begins with "ou-" followed by
  /// from 4 to 32 lower-case letters or digits (the ID of the root that
  /// contains the OU) followed by a second "-" dash and from 8 to 32 additional
  /// lower-case letters or digits.
  final String id;

  /// The type of this child entity.
  final String type;

  Child({
    this.id,
    this.type,
  });
  static Child fromJson(Map<String, dynamic> json) => Child();
}

class CreateAccountResponse {
  /// A structure that contains details about the request to create an account.
  /// This response structure might not be fully populated when you first
  /// receive it because account creation is an asynchronous process. You can
  /// pass the returned `CreateAccountStatus` ID as a parameter to
  /// DescribeCreateAccountStatus to get status about the progress of the
  /// request at later times. You can also check the AWS CloudTrail log for the
  /// `CreateAccountResult` event. For more information, see [Monitoring the
  /// Activity in Your
  /// Organization](http://docs.aws.amazon.com/organizations/latest/userguide/orgs_monitoring.html)
  /// in the _AWS Organizations User Guide_.
  final CreateAccountStatus createAccountStatus;

  CreateAccountResponse({
    this.createAccountStatus,
  });
  static CreateAccountResponse fromJson(Map<String, dynamic> json) =>
      CreateAccountResponse();
}

class CreateAccountStatus {
  /// The unique identifier (ID) that references this request. You get this
  /// value from the response of the initial CreateAccount request to create the
  /// account.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) for an create account
  /// request ID string requires "car-" followed by from 8 to 32 lower-case
  /// letters or digits.
  final String id;

  /// The account name given to the account when it was created.
  final String accountName;

  /// The status of the request.
  final String state;

  /// The date and time that the request was made for the account creation.
  final DateTime requestedTimestamp;

  /// The date and time that the account was created and the request completed.
  final DateTime completedTimestamp;

  /// If the account was created successfully, the unique identifier (ID) of the
  /// new account.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) for an account ID
  /// string requires exactly 12 digits.
  final String accountId;

  /// If the account was created successfully, the unique identifier (ID) of the
  /// new account in the AWS GovCloud (US) Region.
  final String govCloudAccountId;

  /// If the request failed, a description of the reason for the failure.
  ///
  /// *   ACCOUNT\_LIMIT\_EXCEEDED: The account could not be created because you
  /// have reached the limit on the number of accounts in your organization.
  ///
  /// *   EMAIL\_ALREADY\_EXISTS: The account could not be created because
  /// another AWS account with that email address already exists.
  ///
  /// *   INVALID_ADDRESS: The account could not be created because the address
  /// you provided is not valid.
  ///
  /// *   INVALID_EMAIL: The account could not be created because the email
  /// address you provided is not valid.
  ///
  /// *   INTERNAL_FAILURE: The account could not be created because of an
  /// internal failure. Try again later. If the problem persists, contact
  /// Customer Support.
  final String failureReason;

  CreateAccountStatus({
    this.id,
    this.accountName,
    this.state,
    this.requestedTimestamp,
    this.completedTimestamp,
    this.accountId,
    this.govCloudAccountId,
    this.failureReason,
  });
  static CreateAccountStatus fromJson(Map<String, dynamic> json) =>
      CreateAccountStatus();
}

class CreateGovCloudAccountResponse {
  final CreateAccountStatus createAccountStatus;

  CreateGovCloudAccountResponse({
    this.createAccountStatus,
  });
  static CreateGovCloudAccountResponse fromJson(Map<String, dynamic> json) =>
      CreateGovCloudAccountResponse();
}

class CreateOrganizationResponse {
  /// A structure that contains details about the newly created organization.
  final Organization organization;

  CreateOrganizationResponse({
    this.organization,
  });
  static CreateOrganizationResponse fromJson(Map<String, dynamic> json) =>
      CreateOrganizationResponse();
}

class CreateOrganizationalUnitResponse {
  /// A structure that contains details about the newly created OU.
  final OrganizationalUnit organizationalUnit;

  CreateOrganizationalUnitResponse({
    this.organizationalUnit,
  });
  static CreateOrganizationalUnitResponse fromJson(Map<String, dynamic> json) =>
      CreateOrganizationalUnitResponse();
}

class CreatePolicyResponse {
  /// A structure that contains details about the newly created policy.
  final Policy policy;

  CreatePolicyResponse({
    this.policy,
  });
  static CreatePolicyResponse fromJson(Map<String, dynamic> json) =>
      CreatePolicyResponse();
}

class DeclineHandshakeResponse {
  /// A structure that contains details about the declined handshake. The state
  /// is updated to show the value `DECLINED`.
  final Handshake handshake;

  DeclineHandshakeResponse({
    this.handshake,
  });
  static DeclineHandshakeResponse fromJson(Map<String, dynamic> json) =>
      DeclineHandshakeResponse();
}

class DescribeAccountResponse {
  /// A structure that contains information about the requested account.
  final Account account;

  DescribeAccountResponse({
    this.account,
  });
  static DescribeAccountResponse fromJson(Map<String, dynamic> json) =>
      DescribeAccountResponse();
}

class DescribeCreateAccountStatusResponse {
  /// A structure that contains the current status of an account creation
  /// request.
  final CreateAccountStatus createAccountStatus;

  DescribeCreateAccountStatusResponse({
    this.createAccountStatus,
  });
  static DescribeCreateAccountStatusResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeCreateAccountStatusResponse();
}

class DescribeHandshakeResponse {
  /// A structure that contains information about the specified handshake.
  final Handshake handshake;

  DescribeHandshakeResponse({
    this.handshake,
  });
  static DescribeHandshakeResponse fromJson(Map<String, dynamic> json) =>
      DescribeHandshakeResponse();
}

class DescribeOrganizationResponse {
  /// A structure that contains information about the organization.
  final Organization organization;

  DescribeOrganizationResponse({
    this.organization,
  });
  static DescribeOrganizationResponse fromJson(Map<String, dynamic> json) =>
      DescribeOrganizationResponse();
}

class DescribeOrganizationalUnitResponse {
  /// A structure that contains details about the specified OU.
  final OrganizationalUnit organizationalUnit;

  DescribeOrganizationalUnitResponse({
    this.organizationalUnit,
  });
  static DescribeOrganizationalUnitResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeOrganizationalUnitResponse();
}

class DescribePolicyResponse {
  /// A structure that contains details about the specified policy.
  final Policy policy;

  DescribePolicyResponse({
    this.policy,
  });
  static DescribePolicyResponse fromJson(Map<String, dynamic> json) =>
      DescribePolicyResponse();
}

class DisablePolicyTypeResponse {
  /// A structure that shows the root with the updated list of enabled policy
  /// types.
  final Root root;

  DisablePolicyTypeResponse({
    this.root,
  });
  static DisablePolicyTypeResponse fromJson(Map<String, dynamic> json) =>
      DisablePolicyTypeResponse();
}

class EnableAllFeaturesResponse {
  /// A structure that contains details about the handshake created to support
  /// this request to enable all features in the organization.
  final Handshake handshake;

  EnableAllFeaturesResponse({
    this.handshake,
  });
  static EnableAllFeaturesResponse fromJson(Map<String, dynamic> json) =>
      EnableAllFeaturesResponse();
}

class EnablePolicyTypeResponse {
  /// A structure that shows the root with the updated list of enabled policy
  /// types.
  final Root root;

  EnablePolicyTypeResponse({
    this.root,
  });
  static EnablePolicyTypeResponse fromJson(Map<String, dynamic> json) =>
      EnablePolicyTypeResponse();
}

class EnabledServicePrincipal {
  /// The name of the service principal. This is typically in the form of a URL,
  /// such as:  `_servicename_.amazonaws.com`.
  final String servicePrincipal;

  /// The date that the service principal was enabled for integration with AWS
  /// Organizations.
  final DateTime dateEnabled;

  EnabledServicePrincipal({
    this.servicePrincipal,
    this.dateEnabled,
  });
  static EnabledServicePrincipal fromJson(Map<String, dynamic> json) =>
      EnabledServicePrincipal();
}

class Handshake {
  /// The unique identifier (ID) of a handshake. The originating account creates
  /// the ID when it initiates the handshake.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) for handshake ID
  /// string requires "h-" followed by from 8 to 32 lower-case letters or
  /// digits.
  final String id;

  /// The Amazon Resource Name (ARN) of a handshake.
  ///
  /// For more information about ARNs in Organizations, see [ARN Formats
  /// Supported by
  /// Organizations](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_permissions.html#orgs-permissions-arns)
  /// in the _AWS Organizations User Guide_.
  final String arn;

  /// Information about the two accounts that are participating in the
  /// handshake.
  final List<HandshakeParty> parties;

  /// The current state of the handshake. Use the state to trace the flow of the
  /// handshake through the process from its creation to its acceptance. The
  /// meaning of each of the valid values is as follows:
  ///
  /// *    **REQUESTED**: This handshake was sent to multiple recipients
  /// (applicable to only some handshake types) and not all recipients have
  /// responded yet. The request stays in this state until all recipients
  /// respond.
  ///
  /// *    **OPEN**: This handshake was sent to multiple recipients (applicable
  /// to only some policy types) and all recipients have responded, allowing the
  /// originator to complete the handshake action.
  ///
  /// *    **CANCELED**: This handshake is no longer active because it was
  /// canceled by the originating account.
  ///
  /// *    **ACCEPTED**: This handshake is complete because it has been accepted
  /// by the recipient.
  ///
  /// *    **DECLINED**: This handshake is no longer active because it was
  /// declined by the recipient account.
  ///
  /// *    **EXPIRED**: This handshake is no longer active because the
  /// originator did not receive a response of any kind from the recipient
  /// before the expiration time (15 days).
  final String state;

  /// The date and time that the handshake request was made.
  final DateTime requestedTimestamp;

  /// The date and time that the handshake expires. If the recipient of the
  /// handshake request fails to respond before the specified date and time, the
  /// handshake becomes inactive and is no longer valid.
  final DateTime expirationTimestamp;

  /// The type of handshake, indicating what action occurs when the recipient
  /// accepts the handshake. The following handshake types are supported:
  ///
  /// *    **INVITE**: This type of handshake represents a request to join an
  /// organization. It is always sent from the master account to only non-member
  /// accounts.
  ///
  /// *    **ENABLE\_ALL\_FEATURES**: This type of handshake represents a
  /// request to enable all features in an organization. It is always sent from
  /// the master account to only _invited_ member accounts. Created accounts do
  /// not receive this because those accounts were created by the organization's
  /// master account and approval is inferred.
  ///
  /// *    **APPROVE\_ALL\_FEATURES**: This type of handshake is sent from the
  /// Organizations service when all member accounts have approved the
  /// `ENABLE\_ALL\_FEATURES` invitation. It is sent only to the master account
  /// and signals the master that it can finalize the process to enable all
  /// features.
  final String action;

  /// Additional information that is needed to process the handshake.
  final List<HandshakeResource> resources;

  Handshake({
    this.id,
    this.arn,
    this.parties,
    this.state,
    this.requestedTimestamp,
    this.expirationTimestamp,
    this.action,
    this.resources,
  });
  static Handshake fromJson(Map<String, dynamic> json) => Handshake();
}

class HandshakeFilter {
  /// Specifies the type of handshake action.
  ///
  /// If you specify `ActionType`, you cannot also specify `ParentHandshakeId`.
  final String actionType;

  /// Specifies the parent handshake. Only used for handshake types that are a
  /// child of another type.
  ///
  /// If you specify `ParentHandshakeId`, you cannot also specify `ActionType`.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) for handshake ID
  /// string requires "h-" followed by from 8 to 32 lower-case letters or
  /// digits.
  final String parentHandshakeId;

  HandshakeFilter({
    this.actionType,
    this.parentHandshakeId,
  });
}

class HandshakeParty {
  /// The unique identifier (ID) for the party.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) for handshake ID
  /// string requires "h-" followed by from 8 to 32 lower-case letters or
  /// digits.
  final String id;

  /// The type of party.
  final String type;

  HandshakeParty({
    @required this.id,
    @required this.type,
  });
  static HandshakeParty fromJson(Map<String, dynamic> json) => HandshakeParty();
}

class HandshakeResource {
  /// The information that is passed to the other party in the handshake. The
  /// format of the value string must match the requirements of the specified
  /// type.
  final String value;

  /// The type of information being passed, specifying how the value is to be
  /// interpreted by the other party:
  ///
  /// *    `ACCOUNT` \- Specifies an AWS account ID number.
  ///
  /// *    `ORGANIZATION` \- Specifies an organization ID number.
  ///
  /// *    `EMAIL` \- Specifies the email address that is associated with the
  /// account that receives the handshake.
  ///
  /// *    `OWNER_EMAIL` \- Specifies the email address associated with the
  /// master account. Included as information about an organization.
  ///
  /// *    `OWNER_NAME` \- Specifies the name associated with the master
  /// account. Included as information about an organization.
  ///
  /// *    `NOTES` \- Additional text provided by the handshake initiator and
  /// intended for the recipient to read.
  final String type;

  /// When needed, contains an additional array of `HandshakeResource` objects.
  final List<HandshakeResource> resources;

  HandshakeResource({
    this.value,
    this.type,
    this.resources,
  });
  static HandshakeResource fromJson(Map<String, dynamic> json) =>
      HandshakeResource();
}

class InviteAccountToOrganizationResponse {
  /// A structure that contains details about the handshake that is created to
  /// support this invitation request.
  final Handshake handshake;

  InviteAccountToOrganizationResponse({
    this.handshake,
  });
  static InviteAccountToOrganizationResponse fromJson(
          Map<String, dynamic> json) =>
      InviteAccountToOrganizationResponse();
}

class ListAwsServiceAccessForOrganizationResponse {
  /// A list of the service principals for the services that are enabled to
  /// integrate with your organization. Each principal is a structure that
  /// includes the name and the date that it was enabled for integration with
  /// AWS Organizations.
  final List<EnabledServicePrincipal> enabledServicePrincipals;

  /// If present, this value indicates that there is more output available than
  /// is included in the current response. Use this value in the `NextToken`
  /// request parameter in a subsequent call to the operation to get the next
  /// part of the output. You should repeat this until the `NextToken` response
  /// element comes back as `null`.
  final String nextToken;

  ListAwsServiceAccessForOrganizationResponse({
    this.enabledServicePrincipals,
    this.nextToken,
  });
  static ListAwsServiceAccessForOrganizationResponse fromJson(
          Map<String, dynamic> json) =>
      ListAwsServiceAccessForOrganizationResponse();
}

class ListAccountsForParentResponse {
  /// A list of the accounts in the specified root or OU.
  final List<Account> accounts;

  /// If present, this value indicates that there is more output available than
  /// is included in the current response. Use this value in the `NextToken`
  /// request parameter in a subsequent call to the operation to get the next
  /// part of the output. You should repeat this until the `NextToken` response
  /// element comes back as `null`.
  final String nextToken;

  ListAccountsForParentResponse({
    this.accounts,
    this.nextToken,
  });
  static ListAccountsForParentResponse fromJson(Map<String, dynamic> json) =>
      ListAccountsForParentResponse();
}

class ListAccountsResponse {
  /// A list of objects in the organization.
  final List<Account> accounts;

  /// If present, this value indicates that there is more output available than
  /// is included in the current response. Use this value in the `NextToken`
  /// request parameter in a subsequent call to the operation to get the next
  /// part of the output. You should repeat this until the `NextToken` response
  /// element comes back as `null`.
  final String nextToken;

  ListAccountsResponse({
    this.accounts,
    this.nextToken,
  });
  static ListAccountsResponse fromJson(Map<String, dynamic> json) =>
      ListAccountsResponse();
}

class ListChildrenResponse {
  /// The list of children of the specified parent container.
  final List<Child> children;

  /// If present, this value indicates that there is more output available than
  /// is included in the current response. Use this value in the `NextToken`
  /// request parameter in a subsequent call to the operation to get the next
  /// part of the output. You should repeat this until the `NextToken` response
  /// element comes back as `null`.
  final String nextToken;

  ListChildrenResponse({
    this.children,
    this.nextToken,
  });
  static ListChildrenResponse fromJson(Map<String, dynamic> json) =>
      ListChildrenResponse();
}

class ListCreateAccountStatusResponse {
  /// A list of objects with details about the requests. Certain elements, such
  /// as the accountId number, are present in the output only after the account
  /// has been successfully created.
  final List<CreateAccountStatus> createAccountStatuses;

  /// If present, this value indicates that there is more output available than
  /// is included in the current response. Use this value in the `NextToken`
  /// request parameter in a subsequent call to the operation to get the next
  /// part of the output. You should repeat this until the `NextToken` response
  /// element comes back as `null`.
  final String nextToken;

  ListCreateAccountStatusResponse({
    this.createAccountStatuses,
    this.nextToken,
  });
  static ListCreateAccountStatusResponse fromJson(Map<String, dynamic> json) =>
      ListCreateAccountStatusResponse();
}

class ListHandshakesForAccountResponse {
  /// A list of Handshake objects with details about each of the handshakes that
  /// is associated with the specified account.
  final List<Handshake> handshakes;

  /// If present, this value indicates that there is more output available than
  /// is included in the current response. Use this value in the `NextToken`
  /// request parameter in a subsequent call to the operation to get the next
  /// part of the output. You should repeat this until the `NextToken` response
  /// element comes back as `null`.
  final String nextToken;

  ListHandshakesForAccountResponse({
    this.handshakes,
    this.nextToken,
  });
  static ListHandshakesForAccountResponse fromJson(Map<String, dynamic> json) =>
      ListHandshakesForAccountResponse();
}

class ListHandshakesForOrganizationResponse {
  /// A list of Handshake objects with details about each of the handshakes that
  /// are associated with an organization.
  final List<Handshake> handshakes;

  /// If present, this value indicates that there is more output available than
  /// is included in the current response. Use this value in the `NextToken`
  /// request parameter in a subsequent call to the operation to get the next
  /// part of the output. You should repeat this until the `NextToken` response
  /// element comes back as `null`.
  final String nextToken;

  ListHandshakesForOrganizationResponse({
    this.handshakes,
    this.nextToken,
  });
  static ListHandshakesForOrganizationResponse fromJson(
          Map<String, dynamic> json) =>
      ListHandshakesForOrganizationResponse();
}

class ListOrganizationalUnitsForParentResponse {
  /// A list of the OUs in the specified root or parent OU.
  final List<OrganizationalUnit> organizationalUnits;

  /// If present, this value indicates that there is more output available than
  /// is included in the current response. Use this value in the `NextToken`
  /// request parameter in a subsequent call to the operation to get the next
  /// part of the output. You should repeat this until the `NextToken` response
  /// element comes back as `null`.
  final String nextToken;

  ListOrganizationalUnitsForParentResponse({
    this.organizationalUnits,
    this.nextToken,
  });
  static ListOrganizationalUnitsForParentResponse fromJson(
          Map<String, dynamic> json) =>
      ListOrganizationalUnitsForParentResponse();
}

class ListParentsResponse {
  /// A list of parents for the specified child account or OU.
  final List<Parent> parents;

  /// If present, this value indicates that there is more output available than
  /// is included in the current response. Use this value in the `NextToken`
  /// request parameter in a subsequent call to the operation to get the next
  /// part of the output. You should repeat this until the `NextToken` response
  /// element comes back as `null`.
  final String nextToken;

  ListParentsResponse({
    this.parents,
    this.nextToken,
  });
  static ListParentsResponse fromJson(Map<String, dynamic> json) =>
      ListParentsResponse();
}

class ListPoliciesForTargetResponse {
  /// The list of policies that match the criteria in the request.
  final List<PolicySummary> policies;

  /// If present, this value indicates that there is more output available than
  /// is included in the current response. Use this value in the `NextToken`
  /// request parameter in a subsequent call to the operation to get the next
  /// part of the output. You should repeat this until the `NextToken` response
  /// element comes back as `null`.
  final String nextToken;

  ListPoliciesForTargetResponse({
    this.policies,
    this.nextToken,
  });
  static ListPoliciesForTargetResponse fromJson(Map<String, dynamic> json) =>
      ListPoliciesForTargetResponse();
}

class ListPoliciesResponse {
  /// A list of policies that match the filter criteria in the request. The
  /// output list doesn't include the policy contents. To see the content for a
  /// policy, see DescribePolicy.
  final List<PolicySummary> policies;

  /// If present, this value indicates that there is more output available than
  /// is included in the current response. Use this value in the `NextToken`
  /// request parameter in a subsequent call to the operation to get the next
  /// part of the output. You should repeat this until the `NextToken` response
  /// element comes back as `null`.
  final String nextToken;

  ListPoliciesResponse({
    this.policies,
    this.nextToken,
  });
  static ListPoliciesResponse fromJson(Map<String, dynamic> json) =>
      ListPoliciesResponse();
}

class ListRootsResponse {
  /// A list of roots that are defined in an organization.
  final List<Root> roots;

  /// If present, this value indicates that there is more output available than
  /// is included in the current response. Use this value in the `NextToken`
  /// request parameter in a subsequent call to the operation to get the next
  /// part of the output. You should repeat this until the `NextToken` response
  /// element comes back as `null`.
  final String nextToken;

  ListRootsResponse({
    this.roots,
    this.nextToken,
  });
  static ListRootsResponse fromJson(Map<String, dynamic> json) =>
      ListRootsResponse();
}

class ListTagsForResourceResponse {
  /// The tags that are assigned to the resource.
  final List<Tag> tags;

  /// If present, this value indicates that there is more output available than
  /// is included in the current response. Use this value in the `NextToken`
  /// request parameter in a subsequent call to the operation to get the next
  /// part of the output. You should repeat this until the `NextToken` response
  /// element comes back as `null`.
  final String nextToken;

  ListTagsForResourceResponse({
    this.tags,
    this.nextToken,
  });
  static ListTagsForResourceResponse fromJson(Map<String, dynamic> json) =>
      ListTagsForResourceResponse();
}

class ListTargetsForPolicyResponse {
  /// A list of structures, each of which contains details about one of the
  /// entities to which the specified policy is attached.
  final List<PolicyTargetSummary> targets;

  /// If present, this value indicates that there is more output available than
  /// is included in the current response. Use this value in the `NextToken`
  /// request parameter in a subsequent call to the operation to get the next
  /// part of the output. You should repeat this until the `NextToken` response
  /// element comes back as `null`.
  final String nextToken;

  ListTargetsForPolicyResponse({
    this.targets,
    this.nextToken,
  });
  static ListTargetsForPolicyResponse fromJson(Map<String, dynamic> json) =>
      ListTargetsForPolicyResponse();
}

class Organization {
  /// The unique identifier (ID) of an organization.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) for an organization
  /// ID string requires "o-" followed by from 10 to 32 lower-case letters or
  /// digits.
  final String id;

  /// The Amazon Resource Name (ARN) of an organization.
  ///
  /// For more information about ARNs in Organizations, see [ARN Formats
  /// Supported by
  /// Organizations](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_permissions.html#orgs-permissions-arns)
  /// in the _AWS Organizations User Guide_.
  final String arn;

  /// Specifies the functionality that currently is available to the
  /// organization. If set to "ALL", then all features are enabled and policies
  /// can be applied to accounts in the organization. If set to
  /// "CONSOLIDATED_BILLING", then only consolidated billing functionality is
  /// available. For more information, see [Enabling All Features in Your
  /// Organization](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_org_support-all-features.html)
  /// in the _AWS Organizations User Guide_.
  final String featureSet;

  /// The Amazon Resource Name (ARN) of the account that is designated as the
  /// master account for the organization.
  ///
  /// For more information about ARNs in Organizations, see [ARN Formats
  /// Supported by
  /// Organizations](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_permissions.html#orgs-permissions-arns)
  /// in the _AWS Organizations User Guide_.
  final String masterAccountArn;

  /// The unique identifier (ID) of the master account of an organization.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) for an account ID
  /// string requires exactly 12 digits.
  final String masterAccountId;

  /// The email address that is associated with the AWS account that is
  /// designated as the master account for the organization.
  final String masterAccountEmail;

  /// A list of policy types that are enabled for this organization. For
  /// example, if your organization has all features enabled, then service
  /// control policies (SCPs) are included in the list.
  ///
  ///
  ///
  /// Even if a policy type is shown as available in the organization, you can
  /// separately enable and disable them at the root level by using
  /// EnablePolicyType and DisablePolicyType. Use ListRoots to see the status of
  /// a policy type in that root.
  final List<PolicyTypeSummary> availablePolicyTypes;

  Organization({
    this.id,
    this.arn,
    this.featureSet,
    this.masterAccountArn,
    this.masterAccountId,
    this.masterAccountEmail,
    this.availablePolicyTypes,
  });
  static Organization fromJson(Map<String, dynamic> json) => Organization();
}

class OrganizationalUnit {
  /// The unique identifier (ID) associated with this OU.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) for an organizational
  /// unit ID string requires "ou-" followed by from 4 to 32 lower-case letters
  /// or digits (the ID of the root that contains the OU) followed by a second
  /// "-" dash and from 8 to 32 additional lower-case letters or digits.
  final String id;

  /// The Amazon Resource Name (ARN) of this OU.
  ///
  /// For more information about ARNs in Organizations, see [ARN Formats
  /// Supported by
  /// Organizations](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_permissions.html#orgs-permissions-arns)
  /// in the _AWS Organizations User Guide_.
  final String arn;

  /// The friendly name of this OU.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) that is used to
  /// validate this parameter is a string of any of the characters in the ASCII
  /// character range.
  final String name;

  OrganizationalUnit({
    this.id,
    this.arn,
    this.name,
  });
  static OrganizationalUnit fromJson(Map<String, dynamic> json) =>
      OrganizationalUnit();
}

class Parent {
  /// The unique identifier (ID) of the parent entity.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) for a parent ID
  /// string requires one of the following:
  ///
  /// *   Root: a string that begins with "r-" followed by from 4 to 32
  /// lower-case letters or digits.
  ///
  /// *   Organizational unit (OU): a string that begins with "ou-" followed by
  /// from 4 to 32 lower-case letters or digits (the ID of the root that the OU
  /// is in) followed by a second "-" dash and from 8 to 32 additional
  /// lower-case letters or digits.
  final String id;

  /// The type of the parent entity.
  final String type;

  Parent({
    this.id,
    this.type,
  });
  static Parent fromJson(Map<String, dynamic> json) => Parent();
}

class Policy {
  /// A structure that contains additional details about the policy.
  final PolicySummary policySummary;

  /// The text content of the policy.
  final String content;

  Policy({
    this.policySummary,
    this.content,
  });
  static Policy fromJson(Map<String, dynamic> json) => Policy();
}

class PolicySummary {
  /// The unique identifier (ID) of the policy.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) for a policy ID
  /// string requires "p-" followed by from 8 to 128 lower-case letters or
  /// digits.
  final String id;

  /// The Amazon Resource Name (ARN) of the policy.
  ///
  /// For more information about ARNs in Organizations, see [ARN Formats
  /// Supported by
  /// Organizations](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_permissions.html#orgs-permissions-arns)
  /// in the _AWS Organizations User Guide_.
  final String arn;

  /// The friendly name of the policy.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) that is used to
  /// validate this parameter is a string of any of the characters in the ASCII
  /// character range.
  final String name;

  /// The description of the policy.
  final String description;

  /// The type of policy.
  final String type;

  /// A boolean value that indicates whether the specified policy is an AWS
  /// managed policy. If true, then you can attach the policy to roots, OUs, or
  /// accounts, but you cannot edit it.
  final bool awsManaged;

  PolicySummary({
    this.id,
    this.arn,
    this.name,
    this.description,
    this.type,
    this.awsManaged,
  });
  static PolicySummary fromJson(Map<String, dynamic> json) => PolicySummary();
}

class PolicyTargetSummary {
  /// The unique identifier (ID) of the policy target.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) for a target ID
  /// string requires one of the following:
  ///
  /// *   Root: a string that begins with "r-" followed by from 4 to 32
  /// lower-case letters or digits.
  ///
  /// *   Account: a string that consists of exactly 12 digits.
  ///
  /// *   Organizational unit (OU): a string that begins with "ou-" followed by
  /// from 4 to 32 lower-case letters or digits (the ID of the root that the OU
  /// is in) followed by a second "-" dash and from 8 to 32 additional
  /// lower-case letters or digits.
  final String targetId;

  /// The Amazon Resource Name (ARN) of the policy target.
  ///
  /// For more information about ARNs in Organizations, see [ARN Formats
  /// Supported by
  /// Organizations](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_permissions.html#orgs-permissions-arns)
  /// in the _AWS Organizations User Guide_.
  final String arn;

  /// The friendly name of the policy target.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) that is used to
  /// validate this parameter is a string of any of the characters in the ASCII
  /// character range.
  final String name;

  /// The type of the policy target.
  final String type;

  PolicyTargetSummary({
    this.targetId,
    this.arn,
    this.name,
    this.type,
  });
  static PolicyTargetSummary fromJson(Map<String, dynamic> json) =>
      PolicyTargetSummary();
}

class PolicyTypeSummary {
  /// The name of the policy type.
  final String type;

  /// The status of the policy type as it relates to the associated root. To
  /// attach a policy of the specified type to a root or to an OU or account in
  /// that root, it must be available in the organization and enabled for that
  /// root.
  final String status;

  PolicyTypeSummary({
    this.type,
    this.status,
  });
  static PolicyTypeSummary fromJson(Map<String, dynamic> json) =>
      PolicyTypeSummary();
}

class Root {
  /// The unique identifier (ID) for the root.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) for a root ID string
  /// requires "r-" followed by from 4 to 32 lower-case letters or digits.
  final String id;

  /// The Amazon Resource Name (ARN) of the root.
  ///
  /// For more information about ARNs in Organizations, see [ARN Formats
  /// Supported by
  /// Organizations](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_permissions.html#orgs-permissions-arns)
  /// in the _AWS Organizations User Guide_.
  final String arn;

  /// The friendly name of the root.
  ///
  /// The [regex pattern](http://wikipedia.org/wiki/regex) that is used to
  /// validate this parameter is a string of any of the characters in the ASCII
  /// character range.
  final String name;

  /// The types of policies that are currently enabled for the root and
  /// therefore can be attached to the root or to its OUs or accounts.
  ///
  ///
  ///
  /// Even if a policy type is shown as available in the organization, you can
  /// separately enable and disable them at the root level by using
  /// EnablePolicyType and DisablePolicyType. Use DescribeOrganization to see
  /// the availability of the policy types in that organization.
  final List<PolicyTypeSummary> policyTypes;

  Root({
    this.id,
    this.arn,
    this.name,
    this.policyTypes,
  });
  static Root fromJson(Map<String, dynamic> json) => Root();
}

class Tag {
  /// The key identifier, or name, of the tag.
  final String key;

  /// The string value that's associated with the key of the tag. You can set
  /// the value of a tag to an empty string, but you can't set the value of a
  /// tag to null.
  final String value;

  Tag({
    @required this.key,
    @required this.value,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag();
}

class UpdateOrganizationalUnitResponse {
  /// A structure that contains the details about the specified OU, including
  /// its new name.
  final OrganizationalUnit organizationalUnit;

  UpdateOrganizationalUnitResponse({
    this.organizationalUnit,
  });
  static UpdateOrganizationalUnitResponse fromJson(Map<String, dynamic> json) =>
      UpdateOrganizationalUnitResponse();
}

class UpdatePolicyResponse {
  /// A structure that contains details about the updated policy, showing the
  /// requested changes.
  final Policy policy;

  UpdatePolicyResponse({
    this.policy,
  });
  static UpdatePolicyResponse fromJson(Map<String, dynamic> json) =>
      UpdatePolicyResponse();
}
