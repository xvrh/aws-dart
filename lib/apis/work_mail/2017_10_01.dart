import 'package:meta/meta.dart';

/// Amazon WorkMail is a secure, managed business email and calendaring service
/// with support for existing desktop and mobile email clients. You can access
/// your email, contacts, and calendars using Microsoft Outlook, your browser,
/// or other native iOS and Android email applications. You can integrate
/// WorkMail with your existing corporate directory and control both the keys
/// that encrypt your data and the location in which your data is stored.
///
/// The WorkMail API is designed for the following scenarios:
///
/// *   Listing and describing organizations
///
///
/// *   Managing users
///
///
/// *   Managing groups
///
///
/// *   Managing resources
///
///
/// All WorkMail API operations are Amazon-authenticated and certificate-signed.
/// They not only require the use of the AWS SDK, but also allow for the
/// exclusive use of AWS Identity and Access Management users and roles to help
/// facilitate access, trust, and permission policies. By creating a role and
/// allowing an IAM user to access the WorkMail site, the IAM user gains full
/// administrative visibility into the entire WorkMail organization (or as set
/// in the IAM policy). This includes, but is not limited to, the ability to
/// create, update, and delete users, groups, and resources. This allows
/// developers to perform the scenarios listed above, as well as give users the
/// ability to grant access on a selective basis using the IAM model.
class WorkMailApi {
  /// Adds a member (user or group) to the resource's set of delegates.
  ///
  /// [organizationId]: The organization under which the resource exists.
  ///
  /// [resourceId]: The resource for which members (users or groups) are
  /// associated.
  ///
  /// [entityId]: The member (user or group) to associate to the resource.
  Future<AssociateDelegateToResourceResponse> associateDelegateToResource(
      {@required String organizationId,
      @required String resourceId,
      @required String entityId}) async {
    return AssociateDelegateToResourceResponse.fromJson({});
  }

  /// Adds a member (user or group) to the group's set.
  ///
  /// [organizationId]: The organization under which the group exists.
  ///
  /// [groupId]: The group to which the member (user or group) is associated.
  ///
  /// [memberId]: The member (user or group) to associate to the group.
  Future<AssociateMemberToGroupResponse> associateMemberToGroup(
      {@required String organizationId,
      @required String groupId,
      @required String memberId}) async {
    return AssociateMemberToGroupResponse.fromJson({});
  }

  /// Adds an alias to the set of a given member (user or group) of Amazon
  /// WorkMail.
  ///
  /// [organizationId]: The organization under which the member (user or group)
  /// exists.
  ///
  /// [entityId]: The member (user or group) to which this alias is added.
  ///
  /// [alias]: The alias to add to the member set.
  Future<CreateAliasResponse> createAlias(
      {@required String organizationId,
      @required String entityId,
      @required String alias}) async {
    return CreateAliasResponse.fromJson({});
  }

  /// Creates a group that can be used in Amazon WorkMail by calling the
  /// RegisterToWorkMail operation.
  ///
  /// [organizationId]: The organization under which the group is to be created.
  ///
  /// [name]: The name of the group.
  Future<CreateGroupResponse> createGroup(
      {@required String organizationId, @required String name}) async {
    return CreateGroupResponse.fromJson({});
  }

  /// Creates a new Amazon WorkMail resource.
  ///
  /// [organizationId]: The identifier associated with the organization for
  /// which the resource is created.
  ///
  /// [name]: The name of the new resource.
  ///
  /// [type]: The type of the new resource. The available types are `equipment`
  /// and `room`.
  Future<CreateResourceResponse> createResource(
      {@required String organizationId,
      @required String name,
      @required String type}) async {
    return CreateResourceResponse.fromJson({});
  }

  /// Creates a user who can be used in Amazon WorkMail by calling the
  /// RegisterToWorkMail operation.
  ///
  /// [organizationId]: The identifier of the organization for which the user is
  /// created.
  ///
  /// [name]: The name for the new user. Simple AD or AD Connector user names
  /// have a maximum length of 20. All others have a maximum length of 64.
  ///
  /// [displayName]: The display name for the new user.
  ///
  /// [password]: The password for the new user.
  Future<CreateUserResponse> createUser(
      {@required String organizationId,
      @required String name,
      @required String displayName,
      @required String password}) async {
    return CreateUserResponse.fromJson({});
  }

  /// Remove one or more specified aliases from a set of aliases for a given
  /// user.
  ///
  /// [organizationId]: The identifier for the organization under which the user
  /// exists.
  ///
  /// [entityId]: The identifier for the member (user or group) from which to
  /// have the aliases removed.
  ///
  /// [alias]: The aliases to be removed from the user's set of aliases.
  /// Duplicate entries in the list are collapsed into single entries (the list
  /// is transformed into a set).
  Future<DeleteAliasResponse> deleteAlias(
      {@required String organizationId,
      @required String entityId,
      @required String alias}) async {
    return DeleteAliasResponse.fromJson({});
  }

  /// Deletes a group from Amazon WorkMail.
  ///
  /// [organizationId]: The organization that contains the group.
  ///
  /// [groupId]: The identifier of the group to be deleted.
  Future<DeleteGroupResponse> deleteGroup(
      {@required String organizationId, @required String groupId}) async {
    return DeleteGroupResponse.fromJson({});
  }

  /// Deletes permissions granted to a member (user or group).
  ///
  /// [organizationId]: The identifier of the organization under which the
  /// member (user or group) exists.
  ///
  /// [entityId]: The identifier of the member (user or group)that owns the
  /// mailbox.
  ///
  /// [granteeId]: The identifier of the member (user or group) for which to
  /// delete granted permissions.
  Future<DeleteMailboxPermissionsResponse> deleteMailboxPermissions(
      {@required String organizationId,
      @required String entityId,
      @required String granteeId}) async {
    return DeleteMailboxPermissionsResponse.fromJson({});
  }

  /// Deletes the specified resource.
  ///
  /// [organizationId]: The identifier associated with the organization from
  /// which the resource is deleted.
  ///
  /// [resourceId]: The identifier of the resource to be deleted.
  Future<DeleteResourceResponse> deleteResource(
      {@required String organizationId, @required String resourceId}) async {
    return DeleteResourceResponse.fromJson({});
  }

  /// Deletes a user from Amazon WorkMail and all subsequent systems. Before you
  /// can delete a user, the user state must be `DISABLED`. Use the DescribeUser
  /// action to confirm the user state.
  ///
  /// Deleting a user is permanent and cannot be undone. WorkMail archives user
  /// mailboxes for 30 days before they are permanently removed.
  ///
  /// [organizationId]: The organization that contains the user to be deleted.
  ///
  /// [userId]: The identifier of the user to be deleted.
  Future<DeleteUserResponse> deleteUser(
      {@required String organizationId, @required String userId}) async {
    return DeleteUserResponse.fromJson({});
  }

  /// Mark a user, group, or resource as no longer used in Amazon WorkMail. This
  /// action disassociates the mailbox and schedules it for clean-up. WorkMail
  /// keeps mailboxes for 30 days before they are permanently removed. The
  /// functionality in the console is _Disable_.
  ///
  /// [organizationId]: The identifier for the organization under which the
  /// Amazon WorkMail entity exists.
  ///
  /// [entityId]: The identifier for the member (user or group) to be updated.
  Future<DeregisterFromWorkMailResponse> deregisterFromWorkMail(
      {@required String organizationId, @required String entityId}) async {
    return DeregisterFromWorkMailResponse.fromJson({});
  }

  /// Returns the data available for the group.
  ///
  /// [organizationId]: The identifier for the organization under which the
  /// group exists.
  ///
  /// [groupId]: The identifier for the group to be described.
  Future<DescribeGroupResponse> describeGroup(
      {@required String organizationId, @required String groupId}) async {
    return DescribeGroupResponse.fromJson({});
  }

  /// Provides more information regarding a given organization based on its
  /// identifier.
  ///
  /// [organizationId]: The identifier for the organization to be described.
  Future<DescribeOrganizationResponse> describeOrganization(
      String organizationId) async {
    return DescribeOrganizationResponse.fromJson({});
  }

  /// Returns the data available for the resource.
  ///
  /// [organizationId]: The identifier associated with the organization for
  /// which the resource is described.
  ///
  /// [resourceId]: The identifier of the resource to be described.
  Future<DescribeResourceResponse> describeResource(
      {@required String organizationId, @required String resourceId}) async {
    return DescribeResourceResponse.fromJson({});
  }

  /// Provides information regarding the user.
  ///
  /// [organizationId]: The identifier for the organization under which the user
  /// exists.
  ///
  /// [userId]: The identifier for the user to be described.
  Future<DescribeUserResponse> describeUser(
      {@required String organizationId, @required String userId}) async {
    return DescribeUserResponse.fromJson({});
  }

  /// Removes a member from the resource's set of delegates.
  ///
  /// [organizationId]: The identifier for the organization under which the
  /// resource exists.
  ///
  /// [resourceId]: The identifier of the resource from which delegates' set
  /// members are removed.
  ///
  /// [entityId]: The identifier for the member (user, group) to be removed from
  /// the resource's delegates.
  Future<DisassociateDelegateFromResourceResponse>
      disassociateDelegateFromResource(
          {@required String organizationId,
          @required String resourceId,
          @required String entityId}) async {
    return DisassociateDelegateFromResourceResponse.fromJson({});
  }

  /// Removes a member from a group.
  ///
  /// [organizationId]: The identifier for the organization under which the
  /// group exists.
  ///
  /// [groupId]: The identifier for the group from which members are removed.
  ///
  /// [memberId]: The identifier for the member to be removed to the group.
  Future<DisassociateMemberFromGroupResponse> disassociateMemberFromGroup(
      {@required String organizationId,
      @required String groupId,
      @required String memberId}) async {
    return DisassociateMemberFromGroupResponse.fromJson({});
  }

  /// Requests a user's mailbox details for a specified organization and user.
  ///
  /// [organizationId]: The identifier for the organization that contains the
  /// user whose mailbox details are being requested.
  ///
  /// [userId]: The identifier for the user whose mailbox details are being
  /// requested.
  Future<GetMailboxDetailsResponse> getMailboxDetails(
      {@required String organizationId, @required String userId}) async {
    return GetMailboxDetailsResponse.fromJson({});
  }

  /// Creates a paginated call to list the aliases associated with a given
  /// entity.
  ///
  /// [organizationId]: The identifier for the organization under which the
  /// entity exists.
  ///
  /// [entityId]: The identifier for the entity for which to list the aliases.
  ///
  /// [nextToken]: The token to use to retrieve the next page of results. The
  /// first call does not contain any tokens.
  ///
  /// [maxResults]: The maximum number of results to return in a single call.
  Future<ListAliasesResponse> listAliases(
      {@required String organizationId,
      @required String entityId,
      String nextToken,
      int maxResults}) async {
    return ListAliasesResponse.fromJson({});
  }

  /// Returns an overview of the members of a group. Users and groups can be
  /// members of a group.
  ///
  /// [organizationId]: The identifier for the organization under which the
  /// group exists.
  ///
  /// [groupId]: The identifier for the group to which the members (users or
  /// groups) are associated.
  ///
  /// [nextToken]:  The token to use to retrieve the next page of results. The
  /// first call does not contain any tokens.
  ///
  /// [maxResults]: The maximum number of results to return in a single call.
  Future<ListGroupMembersResponse> listGroupMembers(
      {@required String organizationId,
      @required String groupId,
      String nextToken,
      int maxResults}) async {
    return ListGroupMembersResponse.fromJson({});
  }

  /// Returns summaries of the organization's groups.
  ///
  /// [organizationId]: The identifier for the organization under which the
  /// groups exist.
  ///
  /// [nextToken]: The token to use to retrieve the next page of results. The
  /// first call does not contain any tokens.
  ///
  /// [maxResults]: The maximum number of results to return in a single call.
  Future<ListGroupsResponse> listGroups(String organizationId,
      {String nextToken, int maxResults}) async {
    return ListGroupsResponse.fromJson({});
  }

  /// Lists the mailbox permissions associated with a user, group, or resource
  /// mailbox.
  ///
  /// [organizationId]: The identifier of the organization under which the user,
  /// group, or resource exists.
  ///
  /// [entityId]: The identifier of the user, group, or resource for which to
  /// list mailbox permissions.
  ///
  /// [nextToken]: The token to use to retrieve the next page of results. The
  /// first call does not contain any tokens.
  ///
  /// [maxResults]: The maximum number of results to return in a single call.
  Future<ListMailboxPermissionsResponse> listMailboxPermissions(
      {@required String organizationId,
      @required String entityId,
      String nextToken,
      int maxResults}) async {
    return ListMailboxPermissionsResponse.fromJson({});
  }

  /// Returns summaries of the customer's non-deleted organizations.
  ///
  /// [nextToken]: The token to use to retrieve the next page of results. The
  /// first call does not contain any tokens.
  ///
  /// [maxResults]: The maximum number of results to return in a single call.
  Future<ListOrganizationsResponse> listOrganizations(
      {String nextToken, int maxResults}) async {
    return ListOrganizationsResponse.fromJson({});
  }

  /// Lists the delegates associated with a resource. Users and groups can be
  /// resource delegates and answer requests on behalf of the resource.
  ///
  /// [organizationId]: The identifier for the organization that contains the
  /// resource for which delegates are listed.
  ///
  /// [resourceId]: The identifier for the resource whose delegates are listed.
  ///
  /// [nextToken]: The token used to paginate through the delegates associated
  /// with a resource.
  ///
  /// [maxResults]: The number of maximum results in a page.
  Future<ListResourceDelegatesResponse> listResourceDelegates(
      {@required String organizationId,
      @required String resourceId,
      String nextToken,
      int maxResults}) async {
    return ListResourceDelegatesResponse.fromJson({});
  }

  /// Returns summaries of the organization's resources.
  ///
  /// [organizationId]: The identifier for the organization under which the
  /// resources exist.
  ///
  /// [nextToken]: The token to use to retrieve the next page of results. The
  /// first call does not contain any tokens.
  ///
  /// [maxResults]: The maximum number of results to return in a single call.
  Future<ListResourcesResponse> listResources(String organizationId,
      {String nextToken, int maxResults}) async {
    return ListResourcesResponse.fromJson({});
  }

  /// Returns summaries of the organization's users.
  ///
  /// [organizationId]: The identifier for the organization under which the
  /// users exist.
  ///
  /// [nextToken]: The token to use to retrieve the next page of results. The
  /// first call does not contain any tokens.
  ///
  /// [maxResults]: The maximum number of results to return in a single call.
  Future<ListUsersResponse> listUsers(String organizationId,
      {String nextToken, int maxResults}) async {
    return ListUsersResponse.fromJson({});
  }

  /// Sets permissions for a user, group, or resource. This replaces any
  /// pre-existing permissions.
  ///
  /// [organizationId]: The identifier of the organization under which the user,
  /// group, or resource exists.
  ///
  /// [entityId]: The identifier of the user, group, or resource for which to
  /// update mailbox permissions.
  ///
  /// [granteeId]: The identifier of the user, group, or resource to which to
  /// grant the permissions.
  ///
  /// [permissionValues]: The permissions granted to the grantee. SEND_AS allows
  /// the grantee to send email as the owner of the mailbox (the grantee is not
  /// mentioned on these emails). SEND_ON_BEHALF allows the grantee to send
  /// email on behalf of the owner of the mailbox (the grantee is not mentioned
  /// as the physical sender of these emails). FULL_ACCESS allows the grantee
  /// full access to the mailbox, irrespective of other folder-level permissions
  /// set on the mailbox.
  Future<PutMailboxPermissionsResponse> putMailboxPermissions(
      {@required String organizationId,
      @required String entityId,
      @required String granteeId,
      @required List<String> permissionValues}) async {
    return PutMailboxPermissionsResponse.fromJson({});
  }

  /// Registers an existing and disabled user, group, or resource for Amazon
  /// WorkMail use by associating a mailbox and calendaring capabilities. It
  /// performs no change if the user, group, or resource is enabled and fails if
  /// the user, group, or resource is deleted. This operation results in the
  /// accumulation of costs. For more information, see
  /// [Pricing](https://aws.amazon.com//workmail/pricing). The equivalent
  /// console functionality for this operation is _Enable_.
  ///
  /// Users can either be created by calling the CreateUser API operation or
  /// they can be synchronized from your directory. For more information, see
  /// DeregisterFromWorkMail.
  ///
  /// [organizationId]: The identifier for the organization under which the
  /// user, group, or resource exists.
  ///
  /// [entityId]: The identifier for the user, group, or resource to be updated.
  ///
  /// [email]: The email for the user, group, or resource to be updated.
  Future<RegisterToWorkMailResponse> registerToWorkMail(
      {@required String organizationId,
      @required String entityId,
      @required String email}) async {
    return RegisterToWorkMailResponse.fromJson({});
  }

  /// Allows the administrator to reset the password for a user.
  ///
  /// [organizationId]: The identifier of the organization that contains the
  /// user for which the password is reset.
  ///
  /// [userId]: The identifier of the user for whom the password is reset.
  ///
  /// [password]: The new password for the user.
  Future<ResetPasswordResponse> resetPassword(
      {@required String organizationId,
      @required String userId,
      @required String password}) async {
    return ResetPasswordResponse.fromJson({});
  }

  /// Updates a user's current mailbox quota for a specified organization and
  /// user.
  ///
  /// [organizationId]: The identifier for the organization that contains the
  /// user for whom to update the mailbox quota.
  ///
  /// [userId]: The identifer for the user for whom to update the mailbox quota.
  ///
  /// [mailboxQuota]: The updated mailbox quota, in MB, for the specified user.
  Future<UpdateMailboxQuotaResponse> updateMailboxQuota(
      {@required String organizationId,
      @required String userId,
      @required int mailboxQuota}) async {
    return UpdateMailboxQuotaResponse.fromJson({});
  }

  /// Updates the primary email for a user, group, or resource. The current
  /// email is moved into the list of aliases (or swapped between an existing
  /// alias and the current primary email), and the email provided in the input
  /// is promoted as the primary.
  ///
  /// [organizationId]: The organization that contains the user, group, or
  /// resource to update.
  ///
  /// [entityId]: The user, group, or resource to update.
  ///
  /// [email]: The value of the email to be updated as primary.
  Future<UpdatePrimaryEmailAddressResponse> updatePrimaryEmailAddress(
      {@required String organizationId,
      @required String entityId,
      @required String email}) async {
    return UpdatePrimaryEmailAddressResponse.fromJson({});
  }

  /// Updates data for the resource. To have the latest information, it must be
  /// preceded by a DescribeResource call. The dataset in the request should be
  /// the one expected when performing another `DescribeResource` call.
  ///
  /// [organizationId]: The identifier associated with the organization for
  /// which the resource is updated.
  ///
  /// [resourceId]: The identifier of the resource to be updated.
  ///
  /// [name]: The name of the resource to be updated.
  ///
  /// [bookingOptions]: The resource's booking options to be updated.
  Future<UpdateResourceResponse> updateResource(
      {@required String organizationId,
      @required String resourceId,
      String name,
      BookingOptions bookingOptions}) async {
    return UpdateResourceResponse.fromJson({});
  }
}

class AssociateDelegateToResourceResponse {
  AssociateDelegateToResourceResponse();
  static AssociateDelegateToResourceResponse fromJson(
          Map<String, dynamic> json) =>
      AssociateDelegateToResourceResponse();
}

class AssociateMemberToGroupResponse {
  AssociateMemberToGroupResponse();
  static AssociateMemberToGroupResponse fromJson(Map<String, dynamic> json) =>
      AssociateMemberToGroupResponse();
}

/// At least one delegate must be associated to the resource to disable
/// automatic replies from the resource.
class BookingOptions {
  /// The resource's ability to automatically reply to requests. If disabled,
  /// delegates must be associated to the resource.
  final bool autoAcceptRequests;

  /// The resource's ability to automatically decline any recurring requests.
  final bool autoDeclineRecurringRequests;

  /// The resource's ability to automatically decline any conflicting requests.
  final bool autoDeclineConflictingRequests;

  BookingOptions({
    this.autoAcceptRequests,
    this.autoDeclineRecurringRequests,
    this.autoDeclineConflictingRequests,
  });
  static BookingOptions fromJson(Map<String, dynamic> json) => BookingOptions();
}

class CreateAliasResponse {
  CreateAliasResponse();
  static CreateAliasResponse fromJson(Map<String, dynamic> json) =>
      CreateAliasResponse();
}

class CreateGroupResponse {
  /// The identifier of the group.
  final String groupId;

  CreateGroupResponse({
    this.groupId,
  });
  static CreateGroupResponse fromJson(Map<String, dynamic> json) =>
      CreateGroupResponse();
}

class CreateResourceResponse {
  /// The identifier of the new resource.
  final String resourceId;

  CreateResourceResponse({
    this.resourceId,
  });
  static CreateResourceResponse fromJson(Map<String, dynamic> json) =>
      CreateResourceResponse();
}

class CreateUserResponse {
  /// The identifier for the new user.
  final String userId;

  CreateUserResponse({
    this.userId,
  });
  static CreateUserResponse fromJson(Map<String, dynamic> json) =>
      CreateUserResponse();
}

/// The name of the attribute, which is one of the values defined in the
/// UserAttribute enumeration.
class Delegate {
  /// The identifier for the user or group associated as the resource's
  /// delegate.
  final String id;

  /// The type of the delegate: user or group.
  final String type;

  Delegate({
    @required this.id,
    @required this.type,
  });
  static Delegate fromJson(Map<String, dynamic> json) => Delegate();
}

class DeleteAliasResponse {
  DeleteAliasResponse();
  static DeleteAliasResponse fromJson(Map<String, dynamic> json) =>
      DeleteAliasResponse();
}

class DeleteGroupResponse {
  DeleteGroupResponse();
  static DeleteGroupResponse fromJson(Map<String, dynamic> json) =>
      DeleteGroupResponse();
}

class DeleteMailboxPermissionsResponse {
  DeleteMailboxPermissionsResponse();
  static DeleteMailboxPermissionsResponse fromJson(Map<String, dynamic> json) =>
      DeleteMailboxPermissionsResponse();
}

class DeleteResourceResponse {
  DeleteResourceResponse();
  static DeleteResourceResponse fromJson(Map<String, dynamic> json) =>
      DeleteResourceResponse();
}

class DeleteUserResponse {
  DeleteUserResponse();
  static DeleteUserResponse fromJson(Map<String, dynamic> json) =>
      DeleteUserResponse();
}

class DeregisterFromWorkMailResponse {
  DeregisterFromWorkMailResponse();
  static DeregisterFromWorkMailResponse fromJson(Map<String, dynamic> json) =>
      DeregisterFromWorkMailResponse();
}

class DescribeGroupResponse {
  /// The identifier of the described group.
  final String groupId;

  /// The name of the described group.
  final String name;

  /// The email of the described group.
  final String email;

  /// The state of the user: enabled (registered to Amazon WorkMail) or disabled
  /// (deregistered or never registered to WorkMail).
  final String state;

  /// The date and time when a user was registered to WorkMail, in UNIX epoch
  /// time format.
  final DateTime enabledDate;

  /// The date and time when a user was deregistered from WorkMail, in UNIX
  /// epoch time format.
  final DateTime disabledDate;

  DescribeGroupResponse({
    this.groupId,
    this.name,
    this.email,
    this.state,
    this.enabledDate,
    this.disabledDate,
  });
  static DescribeGroupResponse fromJson(Map<String, dynamic> json) =>
      DescribeGroupResponse();
}

class DescribeOrganizationResponse {
  /// The identifier of an organization.
  final String organizationId;

  /// The alias for an organization.
  final String alias;

  /// The state of an organization.
  final String state;

  /// The identifier for the directory associated with an Amazon WorkMail
  /// organization.
  final String directoryId;

  /// The type of directory associated with the WorkMail organization.
  final String directoryType;

  /// The default mail domain associated with the organization.
  final String defaultMailDomain;

  /// The date at which the organization became usable in the WorkMail context,
  /// in UNIX epoch time format.
  final DateTime completedDate;

  /// (Optional) The error message indicating if unexpected behavior was
  /// encountered with regards to the organization.
  final String errorMessage;

  DescribeOrganizationResponse({
    this.organizationId,
    this.alias,
    this.state,
    this.directoryId,
    this.directoryType,
    this.defaultMailDomain,
    this.completedDate,
    this.errorMessage,
  });
  static DescribeOrganizationResponse fromJson(Map<String, dynamic> json) =>
      DescribeOrganizationResponse();
}

class DescribeResourceResponse {
  /// The identifier of the described resource.
  final String resourceId;

  /// The email of the described resource.
  final String email;

  /// The name of the described resource.
  final String name;

  /// The type of the described resource.
  final String type;

  /// The booking options for the described resource.
  final BookingOptions bookingOptions;

  /// The state of the resource: enabled (registered to Amazon WorkMail) or
  /// disabled (deregistered or never registered to WorkMail).
  final String state;

  /// The date and time when a resource was enabled for WorkMail, in UNIX epoch
  /// time format.
  final DateTime enabledDate;

  /// The date and time when a resource was disabled from WorkMail, in UNIX
  /// epoch time format.
  final DateTime disabledDate;

  DescribeResourceResponse({
    this.resourceId,
    this.email,
    this.name,
    this.type,
    this.bookingOptions,
    this.state,
    this.enabledDate,
    this.disabledDate,
  });
  static DescribeResourceResponse fromJson(Map<String, dynamic> json) =>
      DescribeResourceResponse();
}

class DescribeUserResponse {
  /// The identifier for the described user.
  final String userId;

  /// The name for the user.
  final String name;

  /// The email of the user.
  final String email;

  /// The display name of the user.
  final String displayName;

  /// The state of a user: enabled (registered to Amazon WorkMail) or disabled
  /// (deregistered or never registered to WorkMail).
  final String state;

  /// In certain cases, other entities are modeled as users. If interoperability
  /// is enabled, resources are imported into Amazon WorkMail as users. Because
  /// different WorkMail organizations rely on different directory types,
  /// administrators can distinguish between an unregistered user (account is
  /// disabled and has a user role) and the directory administrators. The values
  /// are USER, RESOURCE, and SYSTEM_USER.
  final String userRole;

  /// The date and time at which the user was enabled for Amazon WorkMail usage,
  /// in UNIX epoch time format.
  final DateTime enabledDate;

  /// The date and time at which the user was disabled for Amazon WorkMail
  /// usage, in UNIX epoch time format.
  final DateTime disabledDate;

  DescribeUserResponse({
    this.userId,
    this.name,
    this.email,
    this.displayName,
    this.state,
    this.userRole,
    this.enabledDate,
    this.disabledDate,
  });
  static DescribeUserResponse fromJson(Map<String, dynamic> json) =>
      DescribeUserResponse();
}

class DisassociateDelegateFromResourceResponse {
  DisassociateDelegateFromResourceResponse();
  static DisassociateDelegateFromResourceResponse fromJson(
          Map<String, dynamic> json) =>
      DisassociateDelegateFromResourceResponse();
}

class DisassociateMemberFromGroupResponse {
  DisassociateMemberFromGroupResponse();
  static DisassociateMemberFromGroupResponse fromJson(
          Map<String, dynamic> json) =>
      DisassociateMemberFromGroupResponse();
}

class GetMailboxDetailsResponse {
  /// The maximum allowed mailbox size, in MB, for the specified user.
  final int mailboxQuota;

  /// The current mailbox size, in MB, for the specified user.
  final double mailboxSize;

  GetMailboxDetailsResponse({
    this.mailboxQuota,
    this.mailboxSize,
  });
  static GetMailboxDetailsResponse fromJson(Map<String, dynamic> json) =>
      GetMailboxDetailsResponse();
}

/// The representation of an Amazon WorkMail group.
class Group {
  /// The identifier of the group.
  final String id;

  /// The email of the group.
  final String email;

  /// The name of the group.
  final String name;

  /// The state of the group, which can be ENABLED, DISABLED, or DELETED.
  final String state;

  /// The date indicating when the group was enabled for Amazon WorkMail use.
  final DateTime enabledDate;

  /// The date indicating when the group was disabled from Amazon WorkMail use.
  final DateTime disabledDate;

  Group({
    this.id,
    this.email,
    this.name,
    this.state,
    this.enabledDate,
    this.disabledDate,
  });
  static Group fromJson(Map<String, dynamic> json) => Group();
}

class ListAliasesResponse {
  /// The entity's paginated aliases.
  final List<String> aliases;

  /// The token to use to retrieve the next page of results. The value is "null"
  /// when there are no more results to return.
  final String nextToken;

  ListAliasesResponse({
    this.aliases,
    this.nextToken,
  });
  static ListAliasesResponse fromJson(Map<String, dynamic> json) =>
      ListAliasesResponse();
}

class ListGroupMembersResponse {
  /// The members associated to the group.
  final List<Member> members;

  /// The token to use to retrieve the next page of results. The first call does
  /// not contain any tokens.
  final String nextToken;

  ListGroupMembersResponse({
    this.members,
    this.nextToken,
  });
  static ListGroupMembersResponse fromJson(Map<String, dynamic> json) =>
      ListGroupMembersResponse();
}

class ListGroupsResponse {
  /// The overview of groups for an organization.
  final List<Group> groups;

  /// The token to use to retrieve the next page of results. The value is "null"
  /// when there are no more results to return.
  final String nextToken;

  ListGroupsResponse({
    this.groups,
    this.nextToken,
  });
  static ListGroupsResponse fromJson(Map<String, dynamic> json) =>
      ListGroupsResponse();
}

class ListMailboxPermissionsResponse {
  /// One page of the user, group, or resource mailbox permissions.
  final List<Permission> permissions;

  /// The token to use to retrieve the next page of results. The value is "null"
  /// when there are no more results to return.
  final String nextToken;

  ListMailboxPermissionsResponse({
    this.permissions,
    this.nextToken,
  });
  static ListMailboxPermissionsResponse fromJson(Map<String, dynamic> json) =>
      ListMailboxPermissionsResponse();
}

class ListOrganizationsResponse {
  /// The overview of owned organizations presented as a list of organization
  /// summaries.
  final List<OrganizationSummary> organizationSummaries;

  /// The token to use to retrieve the next page of results. The value is "null"
  /// when there are no more results to return.
  final String nextToken;

  ListOrganizationsResponse({
    this.organizationSummaries,
    this.nextToken,
  });
  static ListOrganizationsResponse fromJson(Map<String, dynamic> json) =>
      ListOrganizationsResponse();
}

class ListResourceDelegatesResponse {
  /// One page of the resource's delegates.
  final List<Delegate> delegates;

  /// The token used to paginate through the delegates associated with a
  /// resource. While results are still available, it has an associated value.
  /// When the last page is reached, the token is empty.
  final String nextToken;

  ListResourceDelegatesResponse({
    this.delegates,
    this.nextToken,
  });
  static ListResourceDelegatesResponse fromJson(Map<String, dynamic> json) =>
      ListResourceDelegatesResponse();
}

class ListResourcesResponse {
  /// One page of the organization's resource representation.
  final List<Resource> resources;

  ///  The token used to paginate through all the organization's resources.
  /// While results are still available, it has an associated value. When the
  /// last page is reached, the token is empty.
  final String nextToken;

  ListResourcesResponse({
    this.resources,
    this.nextToken,
  });
  static ListResourcesResponse fromJson(Map<String, dynamic> json) =>
      ListResourcesResponse();
}

class ListUsersResponse {
  /// The overview of users for an organization.
  final List<User> users;

  ///  The token to use to retrieve the next page of results. This value is
  /// `null` when there are no more results to return.
  final String nextToken;

  ListUsersResponse({
    this.users,
    this.nextToken,
  });
  static ListUsersResponse fromJson(Map<String, dynamic> json) =>
      ListUsersResponse();
}

/// The representation of a user or group.
class Member {
  /// The identifier of the member.
  final String id;

  /// The name of the member.
  final String name;

  /// A member can be a user or group.
  final String type;

  /// The state of the member, which can be ENABLED, DISABLED, or DELETED.
  final String state;

  /// The date indicating when the member was enabled for Amazon WorkMail use.
  final DateTime enabledDate;

  /// The date indicating when the member was disabled from Amazon WorkMail use.
  final DateTime disabledDate;

  Member({
    this.id,
    this.name,
    this.type,
    this.state,
    this.enabledDate,
    this.disabledDate,
  });
  static Member fromJson(Map<String, dynamic> json) => Member();
}

/// The representation of an organization.
class OrganizationSummary {
  /// The identifier associated with the organization.
  final String organizationId;

  /// The alias associated with the organization.
  final String alias;

  /// The error message associated with the organization. It is only present if
  /// unexpected behavior has occurred with regards to the organization. It
  /// provides insight or solutions regarding unexpected behavior.
  final String errorMessage;

  /// The state associated with the organization.
  final String state;

  OrganizationSummary({
    this.organizationId,
    this.alias,
    this.errorMessage,
    this.state,
  });
  static OrganizationSummary fromJson(Map<String, dynamic> json) =>
      OrganizationSummary();
}

/// Permission granted to a user, group, or resource to access a certain aspect
/// of another user, group, or resource mailbox.
class Permission {
  /// The identifier of the user, group, or resource to which the permissions
  /// are granted.
  final String granteeId;

  /// The type of user, group, or resource referred to in GranteeId.
  final String granteeType;

  /// The permissions granted to the grantee. SEND_AS allows the grantee to send
  /// email as the owner of the mailbox (the grantee is not mentioned on these
  /// emails). SEND_ON_BEHALF allows the grantee to send email on behalf of the
  /// owner of the mailbox (the grantee is not mentioned as the physical sender
  /// of these emails). FULL_ACCESS allows the grantee full access to the
  /// mailbox, irrespective of other folder-level permissions set on the
  /// mailbox.
  final List<String> permissionValues;

  Permission({
    @required this.granteeId,
    @required this.granteeType,
    @required this.permissionValues,
  });
  static Permission fromJson(Map<String, dynamic> json) => Permission();
}

class PutMailboxPermissionsResponse {
  PutMailboxPermissionsResponse();
  static PutMailboxPermissionsResponse fromJson(Map<String, dynamic> json) =>
      PutMailboxPermissionsResponse();
}

class RegisterToWorkMailResponse {
  RegisterToWorkMailResponse();
  static RegisterToWorkMailResponse fromJson(Map<String, dynamic> json) =>
      RegisterToWorkMailResponse();
}

class ResetPasswordResponse {
  ResetPasswordResponse();
  static ResetPasswordResponse fromJson(Map<String, dynamic> json) =>
      ResetPasswordResponse();
}

/// The representation of a resource.
class Resource {
  /// The identifier of the resource.
  final String id;

  /// The email of the resource.
  final String email;

  /// The name of the resource.
  final String name;

  /// The type of the resource: equipment or room.
  final String type;

  /// The state of the resource, which can be ENABLED, DISABLED, or DELETED.
  final String state;

  /// The date indicating when the resource was enabled for Amazon WorkMail use.
  final DateTime enabledDate;

  /// The date indicating when the resource was disabled from Amazon WorkMail
  /// use.
  final DateTime disabledDate;

  Resource({
    this.id,
    this.email,
    this.name,
    this.type,
    this.state,
    this.enabledDate,
    this.disabledDate,
  });
  static Resource fromJson(Map<String, dynamic> json) => Resource();
}

class UpdateMailboxQuotaResponse {
  UpdateMailboxQuotaResponse();
  static UpdateMailboxQuotaResponse fromJson(Map<String, dynamic> json) =>
      UpdateMailboxQuotaResponse();
}

class UpdatePrimaryEmailAddressResponse {
  UpdatePrimaryEmailAddressResponse();
  static UpdatePrimaryEmailAddressResponse fromJson(
          Map<String, dynamic> json) =>
      UpdatePrimaryEmailAddressResponse();
}

class UpdateResourceResponse {
  UpdateResourceResponse();
  static UpdateResourceResponse fromJson(Map<String, dynamic> json) =>
      UpdateResourceResponse();
}

/// The representation of an Amazon WorkMail user.
class User {
  /// The identifier of the user.
  final String id;

  /// The email of the user.
  final String email;

  /// The name of the user.
  final String name;

  /// The display name of the user.
  final String displayName;

  /// The state of the user, which can be ENABLED, DISABLED, or DELETED.
  final String state;

  /// The role of the user.
  final String userRole;

  /// The date indicating when the user was enabled for Amazon WorkMail use.
  final DateTime enabledDate;

  /// The date indicating when the user was disabled from Amazon WorkMail use.
  final DateTime disabledDate;

  User({
    this.id,
    this.email,
    this.name,
    this.displayName,
    this.state,
    this.userRole,
    this.enabledDate,
    this.disabledDate,
  });
  static User fromJson(Map<String, dynamic> json) => User();
}
