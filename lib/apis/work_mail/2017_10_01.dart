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
  Future<void> associateDelegateToResource(
      {@required String organizationId,
      @required String resourceId,
      @required String entityId}) async {}

  /// Adds a member (user or group) to the group's set.
  Future<void> associateMemberToGroup(
      {@required String organizationId,
      @required String groupId,
      @required String memberId}) async {}

  /// Adds an alias to the set of a given member (user or group) of Amazon
  /// WorkMail.
  Future<void> createAlias(
      {@required String organizationId,
      @required String entityId,
      @required String alias}) async {}

  /// Creates a group that can be used in Amazon WorkMail by calling the
  /// RegisterToWorkMail operation.
  Future<void> createGroup(
      {@required String organizationId, @required String name}) async {}

  /// Creates a new Amazon WorkMail resource.
  Future<void> createResource(
      {@required String organizationId,
      @required String name,
      @required String type}) async {}

  /// Creates a user who can be used in Amazon WorkMail by calling the
  /// RegisterToWorkMail operation.
  Future<void> createUser(
      {@required String organizationId,
      @required String name,
      @required String displayName,
      @required String password}) async {}

  /// Remove one or more specified aliases from a set of aliases for a given
  /// user.
  Future<void> deleteAlias(
      {@required String organizationId,
      @required String entityId,
      @required String alias}) async {}

  /// Deletes a group from Amazon WorkMail.
  Future<void> deleteGroup(
      {@required String organizationId, @required String groupId}) async {}

  /// Deletes permissions granted to a member (user or group).
  Future<void> deleteMailboxPermissions(
      {@required String organizationId,
      @required String entityId,
      @required String granteeId}) async {}

  /// Deletes the specified resource.
  Future<void> deleteResource(
      {@required String organizationId, @required String resourceId}) async {}

  /// Deletes a user from Amazon WorkMail and all subsequent systems. Before you
  /// can delete a user, the user state must be `DISABLED`. Use the DescribeUser
  /// action to confirm the user state.
  ///
  /// Deleting a user is permanent and cannot be undone. WorkMail archives user
  /// mailboxes for 30 days before they are permanently removed.
  Future<void> deleteUser(
      {@required String organizationId, @required String userId}) async {}

  /// Mark a user, group, or resource as no longer used in Amazon WorkMail. This
  /// action disassociates the mailbox and schedules it for clean-up. WorkMail
  /// keeps mailboxes for 30 days before they are permanently removed. The
  /// functionality in the console is _Disable_.
  Future<void> deregisterFromWorkMail(
      {@required String organizationId, @required String entityId}) async {}

  /// Returns the data available for the group.
  Future<void> describeGroup(
      {@required String organizationId, @required String groupId}) async {}

  /// Provides more information regarding a given organization based on its
  /// identifier.
  Future<void> describeOrganization(String organizationId) async {}

  /// Returns the data available for the resource.
  Future<void> describeResource(
      {@required String organizationId, @required String resourceId}) async {}

  /// Provides information regarding the user.
  Future<void> describeUser(
      {@required String organizationId, @required String userId}) async {}

  /// Removes a member from the resource's set of delegates.
  Future<void> disassociateDelegateFromResource(
      {@required String organizationId,
      @required String resourceId,
      @required String entityId}) async {}

  /// Removes a member from a group.
  Future<void> disassociateMemberFromGroup(
      {@required String organizationId,
      @required String groupId,
      @required String memberId}) async {}

  /// Requests a user's mailbox details for a specified organization and user.
  Future<void> getMailboxDetails(
      {@required String organizationId, @required String userId}) async {}

  /// Creates a paginated call to list the aliases associated with a given
  /// entity.
  Future<void> listAliases(
      {@required String organizationId,
      @required String entityId,
      String nextToken,
      int maxResults}) async {}

  /// Returns an overview of the members of a group. Users and groups can be
  /// members of a group.
  Future<void> listGroupMembers(
      {@required String organizationId,
      @required String groupId,
      String nextToken,
      int maxResults}) async {}

  /// Returns summaries of the organization's groups.
  Future<void> listGroups(String organizationId,
      {String nextToken, int maxResults}) async {}

  /// Lists the mailbox permissions associated with a user, group, or resource
  /// mailbox.
  Future<void> listMailboxPermissions(
      {@required String organizationId,
      @required String entityId,
      String nextToken,
      int maxResults}) async {}

  /// Returns summaries of the customer's non-deleted organizations.
  Future<void> listOrganizations({String nextToken, int maxResults}) async {}

  /// Lists the delegates associated with a resource. Users and groups can be
  /// resource delegates and answer requests on behalf of the resource.
  Future<void> listResourceDelegates(
      {@required String organizationId,
      @required String resourceId,
      String nextToken,
      int maxResults}) async {}

  /// Returns summaries of the organization's resources.
  Future<void> listResources(String organizationId,
      {String nextToken, int maxResults}) async {}

  /// Returns summaries of the organization's users.
  Future<void> listUsers(String organizationId,
      {String nextToken, int maxResults}) async {}

  /// Sets permissions for a user, group, or resource. This replaces any
  /// pre-existing permissions.
  Future<void> putMailboxPermissions(
      {@required String organizationId,
      @required String entityId,
      @required String granteeId,
      @required List<String> permissionValues}) async {}

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
  Future<void> registerToWorkMail(
      {@required String organizationId,
      @required String entityId,
      @required String email}) async {}

  /// Allows the administrator to reset the password for a user.
  Future<void> resetPassword(
      {@required String organizationId,
      @required String userId,
      @required String password}) async {}

  /// Updates a user's current mailbox quota for a specified organization and
  /// user.
  Future<void> updateMailboxQuota(
      {@required String organizationId,
      @required String userId,
      @required int mailboxQuota}) async {}

  /// Updates the primary email for a user, group, or resource. The current
  /// email is moved into the list of aliases (or swapped between an existing
  /// alias and the current primary email), and the email provided in the input
  /// is promoted as the primary.
  Future<void> updatePrimaryEmailAddress(
      {@required String organizationId,
      @required String entityId,
      @required String email}) async {}

  /// Updates data for the resource. To have the latest information, it must be
  /// preceded by a DescribeResource call. The dataset in the request should be
  /// the one expected when performing another `DescribeResource` call.
  Future<void> updateResource(
      {@required String organizationId,
      @required String resourceId,
      String name,
      BookingOptions bookingOptions}) async {}
}

class AssociateDelegateToResourceResponse {}

class AssociateMemberToGroupResponse {}

class BookingOptions {}

class CreateAliasResponse {}

class CreateGroupResponse {}

class CreateResourceResponse {}

class CreateUserResponse {}

class Delegate {}

class DeleteAliasResponse {}

class DeleteGroupResponse {}

class DeleteMailboxPermissionsResponse {}

class DeleteResourceResponse {}

class DeleteUserResponse {}

class DeregisterFromWorkMailResponse {}

class DescribeGroupResponse {}

class DescribeOrganizationResponse {}

class DescribeResourceResponse {}

class DescribeUserResponse {}

class DisassociateDelegateFromResourceResponse {}

class DisassociateMemberFromGroupResponse {}

class GetMailboxDetailsResponse {}

class Group {}

class ListAliasesResponse {}

class ListGroupMembersResponse {}

class ListGroupsResponse {}

class ListMailboxPermissionsResponse {}

class ListOrganizationsResponse {}

class ListResourceDelegatesResponse {}

class ListResourcesResponse {}

class ListUsersResponse {}

class Member {}

class OrganizationSummary {}

class Permission {}

class PutMailboxPermissionsResponse {}

class RegisterToWorkMailResponse {}

class ResetPasswordResponse {}

class Resource {}

class UpdateMailboxQuotaResponse {}

class UpdatePrimaryEmailAddressResponse {}

class UpdateResourceResponse {}

class User {}
