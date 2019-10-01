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
  ///
  /// [groupName]: A name for the group that you want to create.
  ///
  /// [description]: A description for the group that you want to create.
  ///
  /// [awsAccountId]: The ID for the AWS account that the group is in.
  /// Currently, you use the ID for the AWS account that contains your Amazon
  /// QuickSight account.
  ///
  /// [namespace]: The namespace. Currently, you should set this to `default`.
  Future<CreateGroupResponse> createGroup(
      {@required String groupName,
      String description,
      @required String awsAccountId,
      @required String namespace}) async {
    return CreateGroupResponse.fromJson({});
  }

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
  ///
  /// [memberName]: The name of the user that you want to add to the group
  /// membership.
  ///
  /// [groupName]: The name of the group that you want to add the user to.
  ///
  /// [awsAccountId]: The ID for the AWS account that the group is in.
  /// Currently, you use the ID for the AWS account that contains your Amazon
  /// QuickSight account.
  ///
  /// [namespace]: The namespace. Currently, you should set this to `default`.
  Future<CreateGroupMembershipResponse> createGroupMembership(
      {@required String memberName,
      @required String groupName,
      @required String awsAccountId,
      @required String namespace}) async {
    return CreateGroupMembershipResponse.fromJson({});
  }

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
  ///
  /// [groupName]: The name of the group that you want to delete.
  ///
  /// [awsAccountId]: The ID for the AWS account that the group is in.
  /// Currently, you use the ID for the AWS account that contains your Amazon
  /// QuickSight account.
  ///
  /// [namespace]: The namespace. Currently, you should set this to `default`.
  Future<DeleteGroupResponse> deleteGroup(
      {@required String groupName,
      @required String awsAccountId,
      @required String namespace}) async {
    return DeleteGroupResponse.fromJson({});
  }

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
  ///
  /// [memberName]: The name of the user that you want to delete from the group
  /// membership.
  ///
  /// [groupName]: The name of the group that you want to delete the user from.
  ///
  /// [awsAccountId]: The ID for the AWS account that the group is in.
  /// Currently, you use the ID for the AWS account that contains your Amazon
  /// QuickSight account.
  ///
  /// [namespace]: The namespace. Currently, you should set this to `default`.
  Future<DeleteGroupMembershipResponse> deleteGroupMembership(
      {@required String memberName,
      @required String groupName,
      @required String awsAccountId,
      @required String namespace}) async {
    return DeleteGroupMembershipResponse.fromJson({});
  }

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
  ///
  /// [userName]: The name of the user that you want to delete.
  ///
  /// [awsAccountId]: The ID for the AWS account that the user is in. Currently,
  /// you use the ID for the AWS account that contains your Amazon QuickSight
  /// account.
  ///
  /// [namespace]: The namespace. Currently, you should set this to `default`.
  Future<DeleteUserResponse> deleteUser(
      {@required String userName,
      @required String awsAccountId,
      @required String namespace}) async {
    return DeleteUserResponse.fromJson({});
  }

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
  ///
  /// [principalId]: The principal ID of the user.
  ///
  /// [awsAccountId]: The ID for the AWS account that the user is in. Currently,
  /// you use the ID for the AWS account that contains your Amazon QuickSight
  /// account.
  ///
  /// [namespace]: The namespace. Currently, you should set this to `default`.
  Future<DeleteUserByPrincipalIdResponse> deleteUserByPrincipalId(
      {@required String principalId,
      @required String awsAccountId,
      @required String namespace}) async {
    return DeleteUserByPrincipalIdResponse.fromJson({});
  }

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
  ///
  /// [groupName]: The name of the group that you want to describe.
  ///
  /// [awsAccountId]: The ID for the AWS account that the group is in.
  /// Currently, you use the ID for the AWS account that contains your Amazon
  /// QuickSight account.
  ///
  /// [namespace]: The namespace. Currently, you should set this to `default`.
  Future<DescribeGroupResponse> describeGroup(
      {@required String groupName,
      @required String awsAccountId,
      @required String namespace}) async {
    return DescribeGroupResponse.fromJson({});
  }

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
  ///
  /// [userName]: The name of the user that you want to describe.
  ///
  /// [awsAccountId]: The ID for the AWS account that the user is in. Currently,
  /// you use the ID for the AWS account that contains your Amazon QuickSight
  /// account.
  ///
  /// [namespace]: The namespace. Currently, you should set this to `default`.
  Future<DescribeUserResponse> describeUser(
      {@required String userName,
      @required String awsAccountId,
      @required String namespace}) async {
    return DescribeUserResponse.fromJson({});
  }

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
  ///
  /// [awsAccountId]: AWS account ID that contains the dashboard you are
  /// embedding.
  ///
  /// [dashboardId]: The ID for the dashboard, also added to IAM policy
  ///
  /// [identityType]: The authentication method the user uses to sign in (IAM
  /// only).
  ///
  /// [sessionLifetimeInMinutes]: How many minutes the session is valid. The
  /// session lifetime must be between 15 and 600 minutes.
  ///
  /// [undoRedoDisabled]: Remove the undo/redo button on embedded dashboard. The
  /// default is FALSE, which enables the undo/redo button.
  ///
  /// [resetDisabled]: Remove the reset button on embedded dashboard. The
  /// default is FALSE, which allows the reset button.
  ///
  /// [userArn]: The Amazon QuickSight user's ARN, for use with `QUICKSIGHT`
  /// identity type. You can use this for any of the following:
  ///
  /// *   Amazon QuickSight users in your account (readers, authors, or admins)
  ///
  /// *   AD users
  ///
  /// *   Invited non-federated users
  ///
  /// *   Federated IAM users
  ///
  /// *   Federated IAM role-based sessions
  Future<GetDashboardEmbedUrlResponse> getDashboardEmbedUrl(
      {@required String awsAccountId,
      @required String dashboardId,
      @required String identityType,
      BigInt sessionLifetimeInMinutes,
      bool undoRedoDisabled,
      bool resetDisabled,
      String userArn}) async {
    return GetDashboardEmbedUrlResponse.fromJson({});
  }

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
  ///
  /// [groupName]: The name of the group that you want to see a membership list
  /// of.
  ///
  /// [nextToken]: A pagination token that can be used in a subsequent request.
  ///
  /// [maxResults]: The maximum number of results to return from this request.
  ///
  /// [awsAccountId]: The ID for the AWS account that the group is in.
  /// Currently, you use the ID for the AWS account that contains your Amazon
  /// QuickSight account.
  ///
  /// [namespace]: The namespace. Currently, you should set this to `default`.
  Future<ListGroupMembershipsResponse> listGroupMemberships(
      {@required String groupName,
      String nextToken,
      int maxResults,
      @required String awsAccountId,
      @required String namespace}) async {
    return ListGroupMembershipsResponse.fromJson({});
  }

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
  ///
  /// [awsAccountId]: The ID for the AWS account that the group is in.
  /// Currently, you use the ID for the AWS account that contains your Amazon
  /// QuickSight account.
  ///
  /// [nextToken]: A pagination token that can be used in a subsequent request.
  ///
  /// [maxResults]: The maximum number of results to return.
  ///
  /// [namespace]: The namespace. Currently, you should set this to `default`.
  Future<ListGroupsResponse> listGroups(
      {@required String awsAccountId,
      String nextToken,
      int maxResults,
      @required String namespace}) async {
    return ListGroupsResponse.fromJson({});
  }

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
  ///
  /// [userName]: The Amazon QuickSight user name that you want to list group
  /// memberships for.
  ///
  /// [awsAccountId]: The AWS Account ID that the user is in. Currently, you use
  /// the ID for the AWS account that contains your Amazon QuickSight account.
  ///
  /// [namespace]: The namespace. Currently, you should set this to `default`.
  ///
  /// [nextToken]: A pagination token that can be used in a subsequent request.
  ///
  /// [maxResults]: The maximum number of results to return from this request.
  Future<ListUserGroupsResponse> listUserGroups(
      {@required String userName,
      @required String awsAccountId,
      @required String namespace,
      String nextToken,
      int maxResults}) async {
    return ListUserGroupsResponse.fromJson({});
  }

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
  ///
  /// [awsAccountId]: The ID for the AWS account that the user is in. Currently,
  /// you use the ID for the AWS account that contains your Amazon QuickSight
  /// account.
  ///
  /// [nextToken]: A pagination token that can be used in a subsequent request.
  ///
  /// [maxResults]: The maximum number of results to return from this request.
  ///
  /// [namespace]: The namespace. Currently, you should set this to `default`.
  Future<ListUsersResponse> listUsers(
      {@required String awsAccountId,
      String nextToken,
      int maxResults,
      @required String namespace}) async {
    return ListUsersResponse.fromJson({});
  }

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
  ///
  /// [identityType]: Amazon QuickSight supports several ways of managing the
  /// identity of users. This parameter accepts two values:
  ///
  /// *    `IAM`: A user whose identity maps to an existing IAM user or role.
  ///
  /// *    `QUICKSIGHT`: A user whose identity is owned and managed internally
  /// by Amazon QuickSight.
  ///
  /// [email]: The email address of the user that you want to register.
  ///
  /// [userRole]: The Amazon QuickSight role of the user. The user role can be
  /// one of the following:
  ///
  /// *    `READER`: A user who has read-only access to dashboards.
  ///
  /// *    `AUTHOR`: A user who can create data sources, data sets, analyses,
  /// and dashboards.
  ///
  /// *    `ADMIN`: A user who is an author, who can also manage Amazon
  /// QuickSight settings.
  ///
  /// [iamArn]: The ARN of the IAM user or role that you are registering with
  /// Amazon QuickSight.
  ///
  /// [sessionName]: You need to use this parameter only when you register one
  /// or more users using an assumed IAM role. You don't need to provide the
  /// session name for other scenarios, for example when you are registering an
  /// IAM user or an Amazon QuickSight user. You can register multiple users
  /// using the same IAM role if each user has a different session name. For
  /// more information on assuming IAM roles, see
  /// [`assume-role`](https://docs.aws.amazon.com/cli/latest/reference/sts/assume-role.html)
  ///  in the _AWS CLI Reference._
  ///
  /// [awsAccountId]: The ID for the AWS account that the user is in. Currently,
  /// you use the ID for the AWS account that contains your Amazon QuickSight
  /// account.
  ///
  /// [namespace]: The namespace. Currently, you should set this to `default`.
  ///
  /// [userName]: The Amazon QuickSight user name that you want to create for
  /// the user you are registering.
  Future<RegisterUserResponse> registerUser(
      {@required String identityType,
      @required String email,
      @required String userRole,
      String iamArn,
      String sessionName,
      @required String awsAccountId,
      @required String namespace,
      String userName}) async {
    return RegisterUserResponse.fromJson({});
  }

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
  ///
  /// [groupName]: The name of the group that you want to update.
  ///
  /// [description]: The description for the group that you want to update.
  ///
  /// [awsAccountId]: The ID for the AWS account that the group is in.
  /// Currently, you use the ID for the AWS account that contains your Amazon
  /// QuickSight account.
  ///
  /// [namespace]: The namespace. Currently, you should set this to `default`.
  Future<UpdateGroupResponse> updateGroup(
      {@required String groupName,
      String description,
      @required String awsAccountId,
      @required String namespace}) async {
    return UpdateGroupResponse.fromJson({});
  }

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
  ///
  /// [userName]: The Amazon QuickSight user name that you want to update.
  ///
  /// [awsAccountId]: The ID for the AWS account that the user is in. Currently,
  /// you use the ID for the AWS account that contains your Amazon QuickSight
  /// account.
  ///
  /// [namespace]: The namespace. Currently, you should set this to `default`.
  ///
  /// [email]: The email address of the user that you want to update.
  ///
  /// [role]: The Amazon QuickSight role of the user. The user role can be one
  /// of the following:
  ///
  /// *    `READER`: A user who has read-only access to dashboards.
  ///
  /// *    `AUTHOR`: A user who can create data sources, data sets, analyses,
  /// and dashboards.
  ///
  /// *    `ADMIN`: A user who is an author, who can also manage Amazon
  /// QuickSight settings.
  Future<UpdateUserResponse> updateUser(
      {@required String userName,
      @required String awsAccountId,
      @required String namespace,
      @required String email,
      @required String role}) async {
    return UpdateUserResponse.fromJson({});
  }
}

class CreateGroupMembershipResponse {
  /// The group member.
  final GroupMember groupMember;

  /// The AWS request ID for this operation.
  final String requestId;

  /// The http status of the request.
  final int status;

  CreateGroupMembershipResponse({
    this.groupMember,
    this.requestId,
    this.status,
  });
  static CreateGroupMembershipResponse fromJson(Map<String, dynamic> json) =>
      CreateGroupMembershipResponse();
}

class CreateGroupResponse {
  /// The name of the group.
  final Group group;

  /// The AWS request ID for this operation.
  final String requestId;

  /// The http status of the request.
  final int status;

  CreateGroupResponse({
    this.group,
    this.requestId,
    this.status,
  });
  static CreateGroupResponse fromJson(Map<String, dynamic> json) =>
      CreateGroupResponse();
}

class DeleteGroupMembershipResponse {
  /// The AWS request ID for this operation.
  final String requestId;

  /// The http status of the request.
  final int status;

  DeleteGroupMembershipResponse({
    this.requestId,
    this.status,
  });
  static DeleteGroupMembershipResponse fromJson(Map<String, dynamic> json) =>
      DeleteGroupMembershipResponse();
}

class DeleteGroupResponse {
  /// The AWS request ID for this operation.
  final String requestId;

  /// The http status of the request.
  final int status;

  DeleteGroupResponse({
    this.requestId,
    this.status,
  });
  static DeleteGroupResponse fromJson(Map<String, dynamic> json) =>
      DeleteGroupResponse();
}

class DeleteUserByPrincipalIdResponse {
  /// The AWS request ID for this operation.
  final String requestId;

  /// The http status of the request.
  final int status;

  DeleteUserByPrincipalIdResponse({
    this.requestId,
    this.status,
  });
  static DeleteUserByPrincipalIdResponse fromJson(Map<String, dynamic> json) =>
      DeleteUserByPrincipalIdResponse();
}

class DeleteUserResponse {
  /// The AWS request ID for this operation.
  final String requestId;

  /// The http status of the request.
  final int status;

  DeleteUserResponse({
    this.requestId,
    this.status,
  });
  static DeleteUserResponse fromJson(Map<String, dynamic> json) =>
      DeleteUserResponse();
}

class DescribeGroupResponse {
  /// The name of the group.
  final Group group;

  /// The AWS request ID for this operation.
  final String requestId;

  /// The http status of the request.
  final int status;

  DescribeGroupResponse({
    this.group,
    this.requestId,
    this.status,
  });
  static DescribeGroupResponse fromJson(Map<String, dynamic> json) =>
      DescribeGroupResponse();
}

class DescribeUserResponse {
  /// The user name.
  final User user;

  /// The AWS request ID for this operation.
  final String requestId;

  /// The http status of the request.
  final int status;

  DescribeUserResponse({
    this.user,
    this.requestId,
    this.status,
  });
  static DescribeUserResponse fromJson(Map<String, dynamic> json) =>
      DescribeUserResponse();
}

class GetDashboardEmbedUrlResponse {
  /// URL that you can put into your server-side webpage to embed your
  /// dashboard. This URL is valid for 5 minutes, and the resulting session is
  /// valid for 10 hours. The API provides the URL with an auth_code that
  /// enables a single-signon session.
  final String embedUrl;

  /// The http status of the request.
  final int status;

  /// The AWS request ID for this operation.
  final String requestId;

  GetDashboardEmbedUrlResponse({
    this.embedUrl,
    this.status,
    this.requestId,
  });
  static GetDashboardEmbedUrlResponse fromJson(Map<String, dynamic> json) =>
      GetDashboardEmbedUrlResponse();
}

class Group {
  /// The Amazon Resource Name (ARN) for the group.
  final String arn;

  /// The name of the group.
  final String groupName;

  /// The group description.
  final String description;

  /// The principal ID of the group.
  final String principalId;

  Group({
    this.arn,
    this.groupName,
    this.description,
    this.principalId,
  });
  static Group fromJson(Map<String, dynamic> json) => Group();
}

class GroupMember {
  /// The Amazon Resource Name (ARN) for the group member (user).
  final String arn;

  /// The name of the group member (user).
  final String memberName;

  GroupMember({
    this.arn,
    this.memberName,
  });
  static GroupMember fromJson(Map<String, dynamic> json) => GroupMember();
}

class ListGroupMembershipsResponse {
  /// The list of the members of the group.
  final List<GroupMember> groupMemberList;

  /// A pagination token that can be used in a subsequent request.
  final String nextToken;

  /// The AWS request ID for this operation.
  final String requestId;

  /// The http status of the request.
  final int status;

  ListGroupMembershipsResponse({
    this.groupMemberList,
    this.nextToken,
    this.requestId,
    this.status,
  });
  static ListGroupMembershipsResponse fromJson(Map<String, dynamic> json) =>
      ListGroupMembershipsResponse();
}

class ListGroupsResponse {
  /// The list of the groups.
  final List<Group> groupList;

  /// A pagination token that can be used in a subsequent request.
  final String nextToken;

  /// The AWS request ID for this operation.
  final String requestId;

  /// The http status of the request.
  final int status;

  ListGroupsResponse({
    this.groupList,
    this.nextToken,
    this.requestId,
    this.status,
  });
  static ListGroupsResponse fromJson(Map<String, dynamic> json) =>
      ListGroupsResponse();
}

class ListUserGroupsResponse {
  /// The list of groups the user is a member of.
  final List<Group> groupList;

  /// A pagination token that can be used in a subsequent request.
  final String nextToken;

  /// The AWS request ID for this operation.
  final String requestId;

  /// The HTTP status of the request.
  final int status;

  ListUserGroupsResponse({
    this.groupList,
    this.nextToken,
    this.requestId,
    this.status,
  });
  static ListUserGroupsResponse fromJson(Map<String, dynamic> json) =>
      ListUserGroupsResponse();
}

class ListUsersResponse {
  /// The list of users.
  final List<User> userList;

  /// A pagination token that can be used in a subsequent request.
  final String nextToken;

  /// The AWS request ID for this operation.
  final String requestId;

  /// The http status of the request.
  final int status;

  ListUsersResponse({
    this.userList,
    this.nextToken,
    this.requestId,
    this.status,
  });
  static ListUsersResponse fromJson(Map<String, dynamic> json) =>
      ListUsersResponse();
}

class RegisterUserResponse {
  /// The user name.
  final User user;

  /// The URL the user visits to complete registration and provide a password.
  /// This is returned only for users with an identity type of `QUICKSIGHT`.
  final String userInvitationUrl;

  /// The AWS request ID for this operation.
  final String requestId;

  /// The http status of the request.
  final int status;

  RegisterUserResponse({
    this.user,
    this.userInvitationUrl,
    this.requestId,
    this.status,
  });
  static RegisterUserResponse fromJson(Map<String, dynamic> json) =>
      RegisterUserResponse();
}

class UpdateGroupResponse {
  /// The name of the group.
  final Group group;

  /// The AWS request ID for this operation.
  final String requestId;

  /// The http status of the request.
  final int status;

  UpdateGroupResponse({
    this.group,
    this.requestId,
    this.status,
  });
  static UpdateGroupResponse fromJson(Map<String, dynamic> json) =>
      UpdateGroupResponse();
}

class UpdateUserResponse {
  /// The Amazon QuickSight user.
  final User user;

  /// The AWS request ID for this operation.
  final String requestId;

  /// The http status of the request.
  final int status;

  UpdateUserResponse({
    this.user,
    this.requestId,
    this.status,
  });
  static UpdateUserResponse fromJson(Map<String, dynamic> json) =>
      UpdateUserResponse();
}

class User {
  /// The Amazon Resource Name (ARN) for the user.
  final String arn;

  /// The user's user name.
  final String userName;

  /// The user's email address.
  final String email;

  /// The Amazon QuickSight role for the user.
  final String role;

  /// The type of identity authentication used by the user.
  final String identityType;

  /// Active status of user. When you create an Amazon QuickSight user that’s
  /// not an IAM user or an AD user, that user is inactive until they sign in
  /// and provide a password
  final bool active;

  /// The principal ID of the user.
  final String principalId;

  User({
    this.arn,
    this.userName,
    this.email,
    this.role,
    this.identityType,
    this.active,
    this.principalId,
  });
  static User fromJson(Map<String, dynamic> json) => User();
}
