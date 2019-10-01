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
  ///
  /// [resourceShareInvitationArn]: The Amazon Resource Name (ARN) of the
  /// invitation.
  ///
  /// [clientToken]: A unique, case-sensitive identifier that you provide to
  /// ensure the idempotency of the request.
  Future<AcceptResourceShareInvitationResponse> acceptResourceShareInvitation(
      String resourceShareInvitationArn,
      {String clientToken}) async {
    return AcceptResourceShareInvitationResponse.fromJson({});
  }

  /// Associates the specified resource share with the specified principals and
  /// resources.
  ///
  /// [resourceShareArn]: The Amazon Resource Name (ARN) of the resource share.
  ///
  /// [resourceArns]: The Amazon Resource Names (ARN) of the resources.
  ///
  /// [principals]: The principals.
  ///
  /// [clientToken]: A unique, case-sensitive identifier that you provide to
  /// ensure the idempotency of the request.
  Future<AssociateResourceShareResponse> associateResourceShare(
      String resourceShareArn,
      {List<String> resourceArns,
      List<String> principals,
      String clientToken}) async {
    return AssociateResourceShareResponse.fromJson({});
  }

  /// Creates a resource share.
  ///
  /// [name]: The name of the resource share.
  ///
  /// [resourceArns]: The Amazon Resource Names (ARN) of the resources to
  /// associate with the resource share.
  ///
  /// [principals]: The principals to associate with the resource share. The
  /// possible values are IDs of AWS accounts, the ARN of an OU or organization
  /// from AWS Organizations.
  ///
  /// [tags]: One or more tags.
  ///
  /// [allowExternalPrincipals]: Indicates whether principals outside your
  /// organization can be associated with a resource share.
  ///
  /// [clientToken]: A unique, case-sensitive identifier that you provide to
  /// ensure the idempotency of the request.
  Future<CreateResourceShareResponse> createResourceShare(String name,
      {List<String> resourceArns,
      List<String> principals,
      List<Tag> tags,
      bool allowExternalPrincipals,
      String clientToken}) async {
    return CreateResourceShareResponse.fromJson({});
  }

  /// Deletes the specified resource share.
  ///
  /// [resourceShareArn]: The Amazon Resource Name (ARN) of the resource share.
  ///
  /// [clientToken]: A unique, case-sensitive identifier that you provide to
  /// ensure the idempotency of the request.
  Future<DeleteResourceShareResponse> deleteResourceShare(
      String resourceShareArn,
      {String clientToken}) async {
    return DeleteResourceShareResponse.fromJson({});
  }

  /// Disassociates the specified principals or resources from the specified
  /// resource share.
  ///
  /// [resourceShareArn]: The Amazon Resource Name (ARN) of the resource share.
  ///
  /// [resourceArns]: The Amazon Resource Names (ARN) of the resources.
  ///
  /// [principals]: The principals.
  ///
  /// [clientToken]: A unique, case-sensitive identifier that you provide to
  /// ensure the idempotency of the request.
  Future<DisassociateResourceShareResponse> disassociateResourceShare(
      String resourceShareArn,
      {List<String> resourceArns,
      List<String> principals,
      String clientToken}) async {
    return DisassociateResourceShareResponse.fromJson({});
  }

  /// Enables resource sharing within your organization.
  Future<EnableSharingWithAwsOrganizationResponse>
      enableSharingWithAwsOrganization() async {
    return EnableSharingWithAwsOrganizationResponse.fromJson({});
  }

  /// Gets the policies for the specifies resources.
  ///
  /// [resourceArns]: The Amazon Resource Names (ARN) of the resources.
  ///
  /// [principal]: The principal.
  ///
  /// [nextToken]: The token for the next page of results.
  ///
  /// [maxResults]: The maximum number of results to return with a single call.
  /// To retrieve the remaining results, make another call with the returned
  /// `nextToken` value.
  Future<GetResourcePoliciesResponse> getResourcePolicies(
      List<String> resourceArns,
      {String principal,
      String nextToken,
      int maxResults}) async {
    return GetResourcePoliciesResponse.fromJson({});
  }

  /// Gets the associations for the specified resource share.
  ///
  /// [associationType]: The association type.
  ///
  /// [resourceShareArns]: The Amazon Resource Names (ARN) of the resource
  /// shares.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the resource.
  ///
  /// [principal]: The principal.
  ///
  /// [associationStatus]: The status of the association.
  ///
  /// [nextToken]: The token for the next page of results.
  ///
  /// [maxResults]: The maximum number of results to return with a single call.
  /// To retrieve the remaining results, make another call with the returned
  /// `nextToken` value.
  Future<GetResourceShareAssociationsResponse> getResourceShareAssociations(
      String associationType,
      {List<String> resourceShareArns,
      String resourceArn,
      String principal,
      String associationStatus,
      String nextToken,
      int maxResults}) async {
    return GetResourceShareAssociationsResponse.fromJson({});
  }

  /// Gets the specified invitations for resource sharing.
  ///
  /// [resourceShareInvitationArns]: The Amazon Resource Names (ARN) of the
  /// invitations.
  ///
  /// [resourceShareArns]: The Amazon Resource Names (ARN) of the resource
  /// shares.
  ///
  /// [nextToken]: The token for the next page of results.
  ///
  /// [maxResults]: The maximum number of results to return with a single call.
  /// To retrieve the remaining results, make another call with the returned
  /// `nextToken` value.
  Future<GetResourceShareInvitationsResponse> getResourceShareInvitations(
      {List<String> resourceShareInvitationArns,
      List<String> resourceShareArns,
      String nextToken,
      int maxResults}) async {
    return GetResourceShareInvitationsResponse.fromJson({});
  }

  /// Gets the specified resource shares or all of your resource shares.
  ///
  /// [resourceShareArns]: The Amazon Resource Names (ARN) of the resource
  /// shares.
  ///
  /// [resourceShareStatus]: The status of the resource share.
  ///
  /// [resourceOwner]: The type of owner.
  ///
  /// [name]: The name of the resource share.
  ///
  /// [tagFilters]: One or more tag filters.
  ///
  /// [nextToken]: The token for the next page of results.
  ///
  /// [maxResults]: The maximum number of results to return with a single call.
  /// To retrieve the remaining results, make another call with the returned
  /// `nextToken` value.
  Future<GetResourceSharesResponse> getResourceShares(String resourceOwner,
      {List<String> resourceShareArns,
      String resourceShareStatus,
      String name,
      List<TagFilter> tagFilters,
      String nextToken,
      int maxResults}) async {
    return GetResourceSharesResponse.fromJson({});
  }

  /// Lists the principals with access to the specified resource.
  ///
  /// [resourceOwner]: The type of owner.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the resource.
  ///
  /// [principals]: The principals.
  ///
  /// [resourceType]: The resource type.
  ///
  /// [resourceShareArns]: The Amazon Resource Names (ARN) of the resource
  /// shares.
  ///
  /// [nextToken]: The token for the next page of results.
  ///
  /// [maxResults]: The maximum number of results to return with a single call.
  /// To retrieve the remaining results, make another call with the returned
  /// `nextToken` value.
  Future<ListPrincipalsResponse> listPrincipals(String resourceOwner,
      {String resourceArn,
      List<String> principals,
      String resourceType,
      List<String> resourceShareArns,
      String nextToken,
      int maxResults}) async {
    return ListPrincipalsResponse.fromJson({});
  }

  /// Lists the resources that the specified principal can access.
  ///
  /// [resourceOwner]: The type of owner.
  ///
  /// [principal]: The principal.
  ///
  /// [resourceType]: The resource type.
  ///
  /// [resourceArns]: The Amazon Resource Names (ARN) of the resources.
  ///
  /// [resourceShareArns]: The Amazon Resource Names (ARN) of the resource
  /// shares.
  ///
  /// [nextToken]: The token for the next page of results.
  ///
  /// [maxResults]: The maximum number of results to return with a single call.
  /// To retrieve the remaining results, make another call with the returned
  /// `nextToken` value.
  Future<ListResourcesResponse> listResources(String resourceOwner,
      {String principal,
      String resourceType,
      List<String> resourceArns,
      List<String> resourceShareArns,
      String nextToken,
      int maxResults}) async {
    return ListResourcesResponse.fromJson({});
  }

  /// Rejects an invitation to a resource share from another AWS account.
  ///
  /// [resourceShareInvitationArn]: The Amazon Resource Name (ARN) of the
  /// invitation.
  ///
  /// [clientToken]: A unique, case-sensitive identifier that you provide to
  /// ensure the idempotency of the request.
  Future<RejectResourceShareInvitationResponse> rejectResourceShareInvitation(
      String resourceShareInvitationArn,
      {String clientToken}) async {
    return RejectResourceShareInvitationResponse.fromJson({});
  }

  /// Adds the specified tags to the specified resource share.
  ///
  /// [resourceShareArn]: The Amazon Resource Name (ARN) of the resource share.
  ///
  /// [tags]: One or more tags.
  Future<TagResourceResponse> tagResource(
      {@required String resourceShareArn, @required List<Tag> tags}) async {
    return TagResourceResponse.fromJson({});
  }

  /// Removes the specified tags from the specified resource share.
  ///
  /// [resourceShareArn]: The Amazon Resource Name (ARN) of the resource share.
  ///
  /// [tagKeys]: The tag keys of the tags to remove.
  Future<UntagResourceResponse> untagResource(
      {@required String resourceShareArn,
      @required List<String> tagKeys}) async {
    return UntagResourceResponse.fromJson({});
  }

  /// Updates the specified resource share.
  ///
  /// [resourceShareArn]: The Amazon Resource Name (ARN) of the resource share.
  ///
  /// [name]: The name of the resource share.
  ///
  /// [allowExternalPrincipals]: Indicates whether principals outside your
  /// organization can be associated with a resource share.
  ///
  /// [clientToken]: A unique, case-sensitive identifier that you provide to
  /// ensure the idempotency of the request.
  Future<UpdateResourceShareResponse> updateResourceShare(
      String resourceShareArn,
      {String name,
      bool allowExternalPrincipals,
      String clientToken}) async {
    return UpdateResourceShareResponse.fromJson({});
  }
}

class AcceptResourceShareInvitationResponse {
  /// Information about the invitation.
  final ResourceShareInvitation resourceShareInvitation;

  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  final String clientToken;

  AcceptResourceShareInvitationResponse({
    this.resourceShareInvitation,
    this.clientToken,
  });
  static AcceptResourceShareInvitationResponse fromJson(
          Map<String, dynamic> json) =>
      AcceptResourceShareInvitationResponse();
}

class AssociateResourceShareResponse {
  /// Information about the associations.
  final List<ResourceShareAssociation> resourceShareAssociations;

  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  final String clientToken;

  AssociateResourceShareResponse({
    this.resourceShareAssociations,
    this.clientToken,
  });
  static AssociateResourceShareResponse fromJson(Map<String, dynamic> json) =>
      AssociateResourceShareResponse();
}

class CreateResourceShareResponse {
  /// Information about the resource share.
  final ResourceShare resourceShare;

  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  final String clientToken;

  CreateResourceShareResponse({
    this.resourceShare,
    this.clientToken,
  });
  static CreateResourceShareResponse fromJson(Map<String, dynamic> json) =>
      CreateResourceShareResponse();
}

class DeleteResourceShareResponse {
  /// Indicates whether the request succeeded.
  final bool returnValue;

  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  final String clientToken;

  DeleteResourceShareResponse({
    this.returnValue,
    this.clientToken,
  });
  static DeleteResourceShareResponse fromJson(Map<String, dynamic> json) =>
      DeleteResourceShareResponse();
}

class DisassociateResourceShareResponse {
  /// Information about the associations.
  final List<ResourceShareAssociation> resourceShareAssociations;

  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  final String clientToken;

  DisassociateResourceShareResponse({
    this.resourceShareAssociations,
    this.clientToken,
  });
  static DisassociateResourceShareResponse fromJson(
          Map<String, dynamic> json) =>
      DisassociateResourceShareResponse();
}

class EnableSharingWithAwsOrganizationResponse {
  /// Indicates whether the request succeeded.
  final bool returnValue;

  EnableSharingWithAwsOrganizationResponse({
    this.returnValue,
  });
  static EnableSharingWithAwsOrganizationResponse fromJson(
          Map<String, dynamic> json) =>
      EnableSharingWithAwsOrganizationResponse();
}

class GetResourcePoliciesResponse {
  /// A key policy document, in JSON format.
  final List<String> policies;

  /// The token to use to retrieve the next page of results. This value is
  /// `null` when there are no more results to return.
  final String nextToken;

  GetResourcePoliciesResponse({
    this.policies,
    this.nextToken,
  });
  static GetResourcePoliciesResponse fromJson(Map<String, dynamic> json) =>
      GetResourcePoliciesResponse();
}

class GetResourceShareAssociationsResponse {
  /// Information about the association.
  final List<ResourceShareAssociation> resourceShareAssociations;

  /// The token to use to retrieve the next page of results. This value is
  /// `null` when there are no more results to return.
  final String nextToken;

  GetResourceShareAssociationsResponse({
    this.resourceShareAssociations,
    this.nextToken,
  });
  static GetResourceShareAssociationsResponse fromJson(
          Map<String, dynamic> json) =>
      GetResourceShareAssociationsResponse();
}

class GetResourceShareInvitationsResponse {
  /// Information about the invitations.
  final List<ResourceShareInvitation> resourceShareInvitations;

  /// The token to use to retrieve the next page of results. This value is
  /// `null` when there are no more results to return.
  final String nextToken;

  GetResourceShareInvitationsResponse({
    this.resourceShareInvitations,
    this.nextToken,
  });
  static GetResourceShareInvitationsResponse fromJson(
          Map<String, dynamic> json) =>
      GetResourceShareInvitationsResponse();
}

class GetResourceSharesResponse {
  /// Information about the resource shares.
  final List<ResourceShare> resourceShares;

  /// The token to use to retrieve the next page of results. This value is
  /// `null` when there are no more results to return.
  final String nextToken;

  GetResourceSharesResponse({
    this.resourceShares,
    this.nextToken,
  });
  static GetResourceSharesResponse fromJson(Map<String, dynamic> json) =>
      GetResourceSharesResponse();
}

class ListPrincipalsResponse {
  /// The principals.
  final List<Principal> principals;

  /// The token to use to retrieve the next page of results. This value is
  /// `null` when there are no more results to return.
  final String nextToken;

  ListPrincipalsResponse({
    this.principals,
    this.nextToken,
  });
  static ListPrincipalsResponse fromJson(Map<String, dynamic> json) =>
      ListPrincipalsResponse();
}

class ListResourcesResponse {
  /// Information about the resources.
  final List<Resource> resources;

  /// The token to use to retrieve the next page of results. This value is
  /// `null` when there are no more results to return.
  final String nextToken;

  ListResourcesResponse({
    this.resources,
    this.nextToken,
  });
  static ListResourcesResponse fromJson(Map<String, dynamic> json) =>
      ListResourcesResponse();
}

/// Describes a principal for use with AWS Resource Access Manager.
class Principal {
  /// The ID of the principal.
  final String id;

  /// The Amazon Resource Name (ARN) of the resource share.
  final String resourceShareArn;

  /// The time when the principal was associated with the resource share.
  final DateTime creationTime;

  /// The time when the association was last updated.
  final DateTime lastUpdatedTime;

  /// Indicates whether the principal belongs to the same organization as the
  /// AWS account that owns the resource share.
  final bool isExternal;

  Principal({
    this.id,
    this.resourceShareArn,
    this.creationTime,
    this.lastUpdatedTime,
    this.isExternal,
  });
  static Principal fromJson(Map<String, dynamic> json) => Principal();
}

class RejectResourceShareInvitationResponse {
  /// Information about the invitation.
  final ResourceShareInvitation resourceShareInvitation;

  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  final String clientToken;

  RejectResourceShareInvitationResponse({
    this.resourceShareInvitation,
    this.clientToken,
  });
  static RejectResourceShareInvitationResponse fromJson(
          Map<String, dynamic> json) =>
      RejectResourceShareInvitationResponse();
}

/// Describes a resource associated with a resource share.
class Resource {
  /// The Amazon Resource Name (ARN) of the resource.
  final String arn;

  /// The resource type.
  final String type;

  /// The Amazon Resource Name (ARN) of the resource share.
  final String resourceShareArn;

  /// The status of the resource.
  final String status;

  /// A message about the status of the resource.
  final String statusMessage;

  /// The time when the resource was associated with the resource share.
  final DateTime creationTime;

  /// The time when the association was last updated.
  final DateTime lastUpdatedTime;

  Resource({
    this.arn,
    this.type,
    this.resourceShareArn,
    this.status,
    this.statusMessage,
    this.creationTime,
    this.lastUpdatedTime,
  });
  static Resource fromJson(Map<String, dynamic> json) => Resource();
}

/// Describes a resource share.
class ResourceShare {
  /// The Amazon Resource Name (ARN) of the resource share.
  final String resourceShareArn;

  /// The name of the resource share.
  final String name;

  /// The ID of the AWS account that owns the resource share.
  final String owningAccountId;

  /// Indicates whether principals outside your organization can be associated
  /// with a resource share.
  final bool allowExternalPrincipals;

  /// The status of the resource share.
  final String status;

  /// A message about the status of the resource share.
  final String statusMessage;

  /// The tags for the resource share.
  final List<Tag> tags;

  /// The time when the resource share was created.
  final DateTime creationTime;

  /// The time when the resource share was last updated.
  final DateTime lastUpdatedTime;

  ResourceShare({
    this.resourceShareArn,
    this.name,
    this.owningAccountId,
    this.allowExternalPrincipals,
    this.status,
    this.statusMessage,
    this.tags,
    this.creationTime,
    this.lastUpdatedTime,
  });
  static ResourceShare fromJson(Map<String, dynamic> json) => ResourceShare();
}

/// Describes an association with a resource share.
class ResourceShareAssociation {
  /// The Amazon Resource Name (ARN) of the resource share.
  final String resourceShareArn;

  /// The associated entity. For resource associations, this is the ARN of the
  /// resource. For principal associations, this is the ID of an AWS account or
  /// the ARN of an OU or organization from AWS Organizations.
  final String associatedEntity;

  /// The association type.
  final String associationType;

  /// The status of the association.
  final String status;

  /// A message about the status of the association.
  final String statusMessage;

  /// The time when the association was created.
  final DateTime creationTime;

  /// The time when the association was last updated.
  final DateTime lastUpdatedTime;

  /// Indicates whether the principal belongs to the same organization as the
  /// AWS account that owns the resource share.
  final bool isExternal;

  ResourceShareAssociation({
    this.resourceShareArn,
    this.associatedEntity,
    this.associationType,
    this.status,
    this.statusMessage,
    this.creationTime,
    this.lastUpdatedTime,
    this.isExternal,
  });
  static ResourceShareAssociation fromJson(Map<String, dynamic> json) =>
      ResourceShareAssociation();
}

/// Describes an invitation to join a resource share.
class ResourceShareInvitation {
  /// The Amazon Resource Name (ARN) of the invitation.
  final String resourceShareInvitationArn;

  /// The name of the resource share.
  final String resourceShareName;

  /// The Amazon Resource Name (ARN) of the resource share.
  final String resourceShareArn;

  /// The ID of the AWS account that sent the invitation.
  final String senderAccountId;

  /// The ID of the AWS account that received the invitation.
  final String receiverAccountId;

  /// The date and time when the invitation was sent.
  final DateTime invitationTimestamp;

  /// The status of the invitation.
  final String status;

  /// The resources associated with the resource share.
  final List<ResourceShareAssociation> resourceShareAssociations;

  ResourceShareInvitation({
    this.resourceShareInvitationArn,
    this.resourceShareName,
    this.resourceShareArn,
    this.senderAccountId,
    this.receiverAccountId,
    this.invitationTimestamp,
    this.status,
    this.resourceShareAssociations,
  });
  static ResourceShareInvitation fromJson(Map<String, dynamic> json) =>
      ResourceShareInvitation();
}

/// Information about a tag.
class Tag {
  /// The key of the tag.
  final String key;

  /// The value of the tag.
  final String value;

  Tag({
    this.key,
    this.value,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag();
}

/// Used to filter information based on tags.
class TagFilter {
  /// The tag key.
  final String tagKey;

  /// The tag values.
  final List<String> tagValues;

  TagFilter({
    this.tagKey,
    this.tagValues,
  });
}

class TagResourceResponse {
  TagResourceResponse();
  static TagResourceResponse fromJson(Map<String, dynamic> json) =>
      TagResourceResponse();
}

class UntagResourceResponse {
  UntagResourceResponse();
  static UntagResourceResponse fromJson(Map<String, dynamic> json) =>
      UntagResourceResponse();
}

class UpdateResourceShareResponse {
  /// Information about the resource share.
  final ResourceShare resourceShare;

  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  final String clientToken;

  UpdateResourceShareResponse({
    this.resourceShare,
    this.clientToken,
  });
  static UpdateResourceShareResponse fromJson(Map<String, dynamic> json) =>
      UpdateResourceShareResponse();
}
