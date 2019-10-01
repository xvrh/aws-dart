import 'package:meta/meta.dart';

/// Use AWS Resource Access Manager to share AWS resources between AWS accounts.
/// To share a resource, you create a resource share, associate the resource
/// with the resource share, and specify the principals that can access the
/// resource. The following principals are supported:
///
/// *   The ID of an AWS account
///
/// *   The Amazon Resource Name (ARN) of an OU from AWS Organizations
///
/// *   The Amazon Resource Name (ARN) of an organization from AWS Organizations
///
///
/// If you specify an AWS account that doesn't exist in the same organization as
/// the account that owns the resource share, the owner of the specified account
/// receives an invitation to accept the resource share. After the owner accepts
/// the invitation, they can access the resources in the resource share. An
/// administrator of the specified account can use IAM policies to restrict
/// access resources in the resource share.
class RamApi {
  /// Accepts an invitation to a resource share from another AWS account.
  Future<void> acceptResourceShareInvitation(String resourceShareInvitationArn,
      {String clientToken}) async {}

  /// Associates the specified resource share with the specified principals and
  /// resources.
  Future<void> associateResourceShare(String resourceShareArn,
      {List<String> resourceArns,
      List<String> principals,
      String clientToken}) async {}

  /// Creates a resource share.
  Future<void> createResourceShare(String name,
      {List<String> resourceArns,
      List<String> principals,
      List<Tag> tags,
      bool allowExternalPrincipals,
      String clientToken}) async {}

  /// Deletes the specified resource share.
  Future<void> deleteResourceShare(String resourceShareArn,
      {String clientToken}) async {}

  /// Disassociates the specified principals or resources from the specified
  /// resource share.
  Future<void> disassociateResourceShare(String resourceShareArn,
      {List<String> resourceArns,
      List<String> principals,
      String clientToken}) async {}

  /// Enables resource sharing within your organization.
  Future<void> enableSharingWithAwsOrganization() async {}

  /// Gets the policies for the specifies resources.
  Future<void> getResourcePolicies(List<String> resourceArns,
      {String principal, String nextToken, int maxResults}) async {}

  /// Gets the associations for the specified resource share.
  Future<void> getResourceShareAssociations(String associationType,
      {List<String> resourceShareArns,
      String resourceArn,
      String principal,
      String associationStatus,
      String nextToken,
      int maxResults}) async {}

  /// Gets the specified invitations for resource sharing.
  Future<void> getResourceShareInvitations(
      {List<String> resourceShareInvitationArns,
      List<String> resourceShareArns,
      String nextToken,
      int maxResults}) async {}

  /// Gets the specified resource shares or all of your resource shares.
  Future<void> getResourceShares(String resourceOwner,
      {List<String> resourceShareArns,
      String resourceShareStatus,
      String name,
      List<TagFilter> tagFilters,
      String nextToken,
      int maxResults}) async {}

  /// Lists the principals with access to the specified resource.
  Future<void> listPrincipals(String resourceOwner,
      {String resourceArn,
      List<String> principals,
      String resourceType,
      List<String> resourceShareArns,
      String nextToken,
      int maxResults}) async {}

  /// Lists the resources that the specified principal can access.
  Future<void> listResources(String resourceOwner,
      {String principal,
      String resourceType,
      List<String> resourceArns,
      List<String> resourceShareArns,
      String nextToken,
      int maxResults}) async {}

  /// Rejects an invitation to a resource share from another AWS account.
  Future<void> rejectResourceShareInvitation(String resourceShareInvitationArn,
      {String clientToken}) async {}

  /// Adds the specified tags to the specified resource share.
  Future<void> tagResource(
      {@required String resourceShareArn, @required List<Tag> tags}) async {}

  /// Removes the specified tags from the specified resource share.
  Future<void> untagResource(
      {@required String resourceShareArn,
      @required List<String> tagKeys}) async {}

  /// Updates the specified resource share.
  Future<void> updateResourceShare(String resourceShareArn,
      {String name, bool allowExternalPrincipals, String clientToken}) async {}
}

class AcceptResourceShareInvitationResponse {}

class AssociateResourceShareResponse {}

class CreateResourceShareResponse {}

class DeleteResourceShareResponse {}

class DisassociateResourceShareResponse {}

class EnableSharingWithAwsOrganizationResponse {}

class GetResourcePoliciesResponse {}

class GetResourceShareAssociationsResponse {}

class GetResourceShareInvitationsResponse {}

class GetResourceSharesResponse {}

class ListPrincipalsResponse {}

class ListResourcesResponse {}

class Principal {}

class RejectResourceShareInvitationResponse {}

class Resource {}

class ResourceShare {}

class ResourceShareAssociation {}

class ResourceShareInvitation {}

class Tag {}

class TagFilter {}

class TagResourceResponse {}

class UntagResourceResponse {}

class UpdateResourceShareResponse {}
