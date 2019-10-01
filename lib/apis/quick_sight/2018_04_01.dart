import 'package:meta/meta.dart';

/// Amazon QuickSight API Reference
///
/// Amazon QuickSight is a fully managed, serverless, cloud business
/// intelligence service that makes it easy to extend data and insights to every
/// user in your organization. This API interface reference contains
/// documentation for a programming interface that you can use to manage Amazon
/// QuickSight.
class QuickSightApi {
  /// Creates an Amazon QuickSight group.
  ///
  /// The permissions resource is
  /// `arn:aws:quicksight:us-east-1:_<relevant-aws-account-id>_:group/default/_<group-name>_`
  /// .
  ///
  /// The response is a group object.
  ///
  ///  **CLI Sample:**
  ///
  ///  `aws quicksight create-group --aws-account-id=111122223333
  /// --namespace=default --group-name="Sales-Management" --description="Sales
  /// Management - Forecasting"`
  Future<void> createGroup(
      {@required String groupName,
      String description,
      @required String awsAccountId,
      @required String namespace}) async {}

  /// Adds an Amazon QuickSight user to an Amazon QuickSight group.
  ///
  /// The permissions resource is
  /// `arn:aws:quicksight:us-east-1:_<aws-account-id>_:group/default/_<group-name>_`
  /// .
  ///
  /// The condition resource is the user name.
  ///
  /// The condition key is `quicksight:UserName`.
  ///
  /// The response is the group member object.
  ///
  ///  **CLI Sample:**
  ///
  ///  `aws quicksight create-group-membership --aws-account-id=111122223333
  /// --namespace=default --group-name=Sales --member-name=Pat`
  Future<void> createGroupMembership(
      {@required String memberName,
      @required String groupName,
      @required String awsAccountId,
      @required String namespace}) async {}

  /// Removes a user group from Amazon QuickSight.
  ///
  /// The permissions resource is
  /// `arn:aws:quicksight:us-east-1:_<aws-account-id>_:group/default/_<group-name>_`
  /// .
  ///
  ///  **CLI Sample:**
  ///
  ///  `aws quicksight delete-group -\\-aws-account-id=111122223333
  /// -\\-namespace=default -\\-group-name=Sales-Management`
  Future<void> deleteGroup(
      {@required String groupName,
      @required String awsAccountId,
      @required String namespace}) async {}

  /// Removes a user from a group so that the user is no longer a member of the
  /// group.
  ///
  /// The permissions resource is
  /// `arn:aws:quicksight:us-east-1:_<aws-account-id>_:group/default/_<group-name>_`
  /// .
  ///
  /// The condition resource is the user name.
  ///
  /// The condition key is `quicksight:UserName`.
  ///
  ///  **CLI Sample:**
  ///
  ///  `aws quicksight delete-group-membership --aws-account-id=111122223333
  /// --namespace=default --group-name=Sales-Management --member-name=Charlie`
  Future<void> deleteGroupMembership(
      {@required String memberName,
      @required String groupName,
      @required String awsAccountId,
      @required String namespace}) async {}

  /// Deletes the Amazon QuickSight user that is associated with the identity of
  /// the AWS Identity and Access Management (IAM) user or role that's making
  /// the call. The IAM user isn't deleted as a result of this call.
  ///
  /// The permission resource is
  /// `arn:aws:quicksight:us-east-1:_<aws-account-id>_:user/default/_<user-name>_`
  /// .
  ///
  ///  **CLI Sample:**
  ///
  ///  `aws quicksight delete-user --aws-account-id=111122223333
  /// --namespace=default --user-name=Pat`
  Future<void> deleteUser(
      {@required String userName,
      @required String awsAccountId,
      @required String namespace}) async {}

  /// Deletes a user identified by its principal ID.
  ///
  /// The permission resource is
  /// `arn:aws:quicksight:us-east-1:_<aws-account-id>_:user/default/_<user-name>_`
  /// .
  ///
  ///  **CLI Sample:**
  ///
  ///  `aws quicksight delete-user-by-principal-id --aws-account-id=111122223333
  /// --namespace=default --principal-id=ABCDEFJA26JLI7EUUOEHS`
  Future<void> deleteUserByPrincipalId(
      {@required String principalId,
      @required String awsAccountId,
      @required String namespace}) async {}

  /// Returns an Amazon QuickSight group's description and Amazon Resource Name
  /// (ARN).
  ///
  /// The permissions resource is
  /// `arn:aws:quicksight:us-east-1:_<relevant-aws-account-id>_:group/default/_<group-name>_`
  /// .
  ///
  /// The response is the group object.
  ///
  ///  **CLI Sample:**
  ///
  ///  `aws quicksight describe-group -\\-aws-account-id=11112222333
  /// -\\-namespace=default -\\-group-name=Sales`
  Future<void> describeGroup(
      {@required String groupName,
      @required String awsAccountId,
      @required String namespace}) async {}

  /// Returns information about a user, given the user name.
  ///
  /// The permission resource is
  /// `arn:aws:quicksight:us-east-1:_<aws-account-id>_:user/default/_<user-name>_`
  /// .
  ///
  /// The response is a user object that contains the user's Amazon Resource
  /// Name (ARN), AWS Identity and Access Management (IAM) role, and email
  /// address.
  ///
  ///  **CLI Sample:**
  ///
  ///  `aws quicksight describe-user --aws-account-id=111122223333
  /// --namespace=default --user-name=Pat`
  Future<void> describeUser(
      {@required String userName,
      @required String awsAccountId,
      @required String namespace}) async {}

  /// Generates a server-side embeddable URL and authorization code. Before this
  /// can work properly, first you need to configure the dashboards and user
  /// permissions. For more information, see  [Embedding Amazon QuickSight
  /// Dashboards](https://docs.aws.amazon.com/en_us/quicksight/latest/user/embedding.html).
  ///
  /// Currently, you can use `GetDashboardEmbedURL` only from the server, not
  /// from the user’s browser.
  ///
  ///  **CLI Sample:**
  ///
  /// Assume the role with permissions enabled for actions:
  /// `quickSight:RegisterUser` and `quicksight:GetDashboardEmbedURL`. You can
  /// use assume-role, assume-role-with-web-identity, or assume-role-with-saml.
  ///
  ///  `aws sts assume-role --role-arn
  /// "arn:aws:iam::111122223333:role/embedding\_quicksight\_dashboard_role"
  /// --role-session-name embeddingsession`
  ///
  /// If the user does not exist in QuickSight, register the user:
  ///
  ///  `aws quicksight register-user --aws-account-id 111122223333 --namespace
  /// default --identity-type IAM --iam-arn
  /// "arn:aws:iam::111122223333:role/embedding\_quicksight\_dashboard_role"
  /// --user-role READER --session-name "embeddingsession" --email
  /// user123@example.com --region us-east-1`
  ///
  /// Get the URL for the embedded dashboard
  ///
  ///  `aws quicksight get-dashboard-embed-url --aws-account-id 111122223333
  /// --dashboard-id 1a1ac2b2-3fc3-4b44-5e5d-c6db6778df89 --identity-type IAM`
  Future<void> getDashboardEmbedUrl(
      {@required String awsAccountId,
      @required String dashboardId,
      @required String identityType,
      BigInt sessionLifetimeInMinutes,
      bool undoRedoDisabled,
      bool resetDisabled,
      String userArn}) async {}

  /// Lists member users in a group.
  ///
  /// The permissions resource is
  /// `arn:aws:quicksight:us-east-1:_<aws-account-id>_:group/default/_<group-name>_`
  /// .
  ///
  /// The response is a list of group member objects.
  ///
  ///  **CLI Sample:**
  ///
  ///  `aws quicksight list-group-memberships -\\-aws-account-id=111122223333
  /// -\\-namespace=default`
  Future<void> listGroupMemberships(
      {@required String groupName,
      String nextToken,
      int maxResults,
      @required String awsAccountId,
      @required String namespace}) async {}

  /// Lists all user groups in Amazon QuickSight.
  ///
  /// The permissions resource is
  /// `arn:aws:quicksight:us-east-1:_<aws-account-id>_:group/default/*`.
  ///
  /// The response is a list of group objects.
  ///
  ///  **CLI Sample:**
  ///
  ///  `aws quicksight list-groups -\\-aws-account-id=111122223333
  /// -\\-namespace=default`
  Future<void> listGroups(
      {@required String awsAccountId,
      String nextToken,
      int maxResults,
      @required String namespace}) async {}

  /// Lists the Amazon QuickSight groups that an Amazon QuickSight user is a
  /// member of.
  ///
  /// The permission resource is
  /// `arn:aws:quicksight:us-east-1:_<aws-account-id>_:user/default/_<user-name>_`
  /// .
  ///
  /// The response is a one or more group objects.
  ///
  ///  **CLI Sample:**
  ///
  ///  `aws quicksight list-user-groups -\\-user-name=Pat
  /// -\\-aws-account-id=111122223333 -\\-namespace=default
  /// -\\-region=us-east-1`
  Future<void> listUserGroups(
      {@required String userName,
      @required String awsAccountId,
      @required String namespace,
      String nextToken,
      int maxResults}) async {}

  /// Returns a list of all of the Amazon QuickSight users belonging to this
  /// account.
  ///
  /// The permission resource is
  /// `arn:aws:quicksight:us-east-1:_<aws-account-id>_:user/default/_*_` .
  ///
  /// The response is a list of user objects, containing each user's Amazon
  /// Resource Name (ARN), AWS Identity and Access Management (IAM) role, and
  /// email address.
  ///
  ///  **CLI Sample:**
  ///
  ///  `aws quicksight list-users --aws-account-id=111122223333
  /// --namespace=default`
  Future<void> listUsers(
      {@required String awsAccountId,
      String nextToken,
      int maxResults,
      @required String namespace}) async {}

  /// Creates an Amazon QuickSight user, whose identity is associated with the
  /// AWS Identity and Access Management (IAM) identity or role specified in the
  /// request.
  ///
  /// The permission resource is
  /// `arn:aws:quicksight:us-east-1:_<aws-account-id>_:user/default/_<user-name>_`
  /// .
  ///
  /// The condition resource is the Amazon Resource Name (ARN) for the IAM user
  /// or role, and the session name.
  ///
  /// The condition keys are `quicksight:IamArn` and `quicksight:SessionName`.
  ///
  ///  **CLI Sample:**
  ///
  ///  `aws quicksight register-user -\\-aws-account-id=111122223333
  /// -\\-namespace=default -\\-email=pat@example.com -\\-identity-type=IAM
  /// -\\-user-role=AUTHOR -\\-iam-arn=arn:aws:iam::111122223333:user/Pat`
  Future<void> registerUser(
      {@required String identityType,
      @required String email,
      @required String userRole,
      String iamArn,
      String sessionName,
      @required String awsAccountId,
      @required String namespace,
      String userName}) async {}

  /// Changes a group description.
  ///
  /// The permissions resource is
  /// `arn:aws:quicksight:us-east-1:_<aws-account-id>_:group/default/_<group-name>_`
  /// .
  ///
  /// The response is a group object.
  ///
  ///  **CLI Sample:**
  ///
  ///  `aws quicksight update-group --aws-account-id=111122223333
  /// --namespace=default --group-name=Sales --description="Sales BI
  /// Dashboards"`
  Future<void> updateGroup(
      {@required String groupName,
      String description,
      @required String awsAccountId,
      @required String namespace}) async {}

  /// Updates an Amazon QuickSight user.
  ///
  /// The permission resource is
  /// `arn:aws:quicksight:us-east-1:_<aws-account-id>_:user/default/_<user-name>_`
  /// .
  ///
  /// The response is a user object that contains the user's Amazon QuickSight
  /// user name, email address, active or inactive status in Amazon QuickSight,
  /// Amazon QuickSight role, and Amazon Resource Name (ARN).
  ///
  ///  **CLI Sample:**
  ///
  ///  `aws quicksight update-user --user-name=Pat --role=ADMIN
  /// --email=new_address@amazon.com --aws-account-id=111122223333
  /// --namespace=default --region=us-east-1`
  Future<void> updateUser(
      {@required String userName,
      @required String awsAccountId,
      @required String namespace,
      @required String email,
      @required String role}) async {}
}

class CreateGroupMembershipResponse {}

class CreateGroupResponse {}

class DeleteGroupMembershipResponse {}

class DeleteGroupResponse {}

class DeleteUserByPrincipalIdResponse {}

class DeleteUserResponse {}

class DescribeGroupResponse {}

class DescribeUserResponse {}

class GetDashboardEmbedUrlResponse {}

class Group {}

class GroupMember {}

class ListGroupMembershipsResponse {}

class ListGroupsResponse {}

class ListUserGroupsResponse {}

class ListUsersResponse {}

class RegisterUserResponse {}

class UpdateGroupResponse {}

class UpdateUserResponse {}

class User {}
