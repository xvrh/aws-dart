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
  final _client;
  RamApi(client) : _client = client.configured('RAM', serializer: 'rest-json');

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
    var response_ = await _client.send('AcceptResourceShareInvitation', {
      'resourceShareInvitationArn': resourceShareInvitationArn,
      if (clientToken != null) 'clientToken': clientToken,
    });
    return AcceptResourceShareInvitationResponse.fromJson(response_);
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
    var response_ = await _client.send('AssociateResourceShare', {
      'resourceShareArn': resourceShareArn,
      if (resourceArns != null) 'resourceArns': resourceArns,
      if (principals != null) 'principals': principals,
      if (clientToken != null) 'clientToken': clientToken,
    });
    return AssociateResourceShareResponse.fromJson(response_);
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
    var response_ = await _client.send('CreateResourceShare', {
      'name': name,
      if (resourceArns != null) 'resourceArns': resourceArns,
      if (principals != null) 'principals': principals,
      if (tags != null) 'tags': tags,
      if (allowExternalPrincipals != null)
        'allowExternalPrincipals': allowExternalPrincipals,
      if (clientToken != null) 'clientToken': clientToken,
    });
    return CreateResourceShareResponse.fromJson(response_);
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
    var response_ = await _client.send('DeleteResourceShare', {
      'resourceShareArn': resourceShareArn,
      if (clientToken != null) 'clientToken': clientToken,
    });
    return DeleteResourceShareResponse.fromJson(response_);
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
    var response_ = await _client.send('DisassociateResourceShare', {
      'resourceShareArn': resourceShareArn,
      if (resourceArns != null) 'resourceArns': resourceArns,
      if (principals != null) 'principals': principals,
      if (clientToken != null) 'clientToken': clientToken,
    });
    return DisassociateResourceShareResponse.fromJson(response_);
  }

  /// Enables resource sharing within your organization.
  Future<EnableSharingWithAwsOrganizationResponse>
      enableSharingWithAwsOrganization() async {
    var response_ = await _client.send('EnableSharingWithAwsOrganization', {});
    return EnableSharingWithAwsOrganizationResponse.fromJson(response_);
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
    var response_ = await _client.send('GetResourcePolicies', {
      'resourceArns': resourceArns,
      if (principal != null) 'principal': principal,
      if (nextToken != null) 'nextToken': nextToken,
      if (maxResults != null) 'maxResults': maxResults,
    });
    return GetResourcePoliciesResponse.fromJson(response_);
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
    var response_ = await _client.send('GetResourceShareAssociations', {
      'associationType': associationType,
      if (resourceShareArns != null) 'resourceShareArns': resourceShareArns,
      if (resourceArn != null) 'resourceArn': resourceArn,
      if (principal != null) 'principal': principal,
      if (associationStatus != null) 'associationStatus': associationStatus,
      if (nextToken != null) 'nextToken': nextToken,
      if (maxResults != null) 'maxResults': maxResults,
    });
    return GetResourceShareAssociationsResponse.fromJson(response_);
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
    var response_ = await _client.send('GetResourceShareInvitations', {
      if (resourceShareInvitationArns != null)
        'resourceShareInvitationArns': resourceShareInvitationArns,
      if (resourceShareArns != null) 'resourceShareArns': resourceShareArns,
      if (nextToken != null) 'nextToken': nextToken,
      if (maxResults != null) 'maxResults': maxResults,
    });
    return GetResourceShareInvitationsResponse.fromJson(response_);
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
    var response_ = await _client.send('GetResourceShares', {
      if (resourceShareArns != null) 'resourceShareArns': resourceShareArns,
      if (resourceShareStatus != null)
        'resourceShareStatus': resourceShareStatus,
      'resourceOwner': resourceOwner,
      if (name != null) 'name': name,
      if (tagFilters != null) 'tagFilters': tagFilters,
      if (nextToken != null) 'nextToken': nextToken,
      if (maxResults != null) 'maxResults': maxResults,
    });
    return GetResourceSharesResponse.fromJson(response_);
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
    var response_ = await _client.send('ListPrincipals', {
      'resourceOwner': resourceOwner,
      if (resourceArn != null) 'resourceArn': resourceArn,
      if (principals != null) 'principals': principals,
      if (resourceType != null) 'resourceType': resourceType,
      if (resourceShareArns != null) 'resourceShareArns': resourceShareArns,
      if (nextToken != null) 'nextToken': nextToken,
      if (maxResults != null) 'maxResults': maxResults,
    });
    return ListPrincipalsResponse.fromJson(response_);
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
    var response_ = await _client.send('ListResources', {
      'resourceOwner': resourceOwner,
      if (principal != null) 'principal': principal,
      if (resourceType != null) 'resourceType': resourceType,
      if (resourceArns != null) 'resourceArns': resourceArns,
      if (resourceShareArns != null) 'resourceShareArns': resourceShareArns,
      if (nextToken != null) 'nextToken': nextToken,
      if (maxResults != null) 'maxResults': maxResults,
    });
    return ListResourcesResponse.fromJson(response_);
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
    var response_ = await _client.send('RejectResourceShareInvitation', {
      'resourceShareInvitationArn': resourceShareInvitationArn,
      if (clientToken != null) 'clientToken': clientToken,
    });
    return RejectResourceShareInvitationResponse.fromJson(response_);
  }

  /// Adds the specified tags to the specified resource share.
  ///
  /// [resourceShareArn]: The Amazon Resource Name (ARN) of the resource share.
  ///
  /// [tags]: One or more tags.
  Future<TagResourceResponse> tagResource(
      {@required String resourceShareArn, @required List<Tag> tags}) async {
    var response_ = await _client.send('TagResource', {
      'resourceShareArn': resourceShareArn,
      'tags': tags,
    });
    return TagResourceResponse.fromJson(response_);
  }

  /// Removes the specified tags from the specified resource share.
  ///
  /// [resourceShareArn]: The Amazon Resource Name (ARN) of the resource share.
  ///
  /// [tagKeys]: The tag keys of the tags to remove.
  Future<UntagResourceResponse> untagResource(
      {@required String resourceShareArn,
      @required List<String> tagKeys}) async {
    var response_ = await _client.send('UntagResource', {
      'resourceShareArn': resourceShareArn,
      'tagKeys': tagKeys,
    });
    return UntagResourceResponse.fromJson(response_);
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
    var response_ = await _client.send('UpdateResourceShare', {
      'resourceShareArn': resourceShareArn,
      if (name != null) 'name': name,
      if (allowExternalPrincipals != null)
        'allowExternalPrincipals': allowExternalPrincipals,
      if (clientToken != null) 'clientToken': clientToken,
    });
    return UpdateResourceShareResponse.fromJson(response_);
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
      AcceptResourceShareInvitationResponse(
        resourceShareInvitation: json.containsKey('resourceShareInvitation')
            ? ResourceShareInvitation.fromJson(json['resourceShareInvitation'])
            : null,
        clientToken: json.containsKey('clientToken')
            ? json['clientToken'] as String
            : null,
      );
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
      AssociateResourceShareResponse(
        resourceShareAssociations: json.containsKey('resourceShareAssociations')
            ? (json['resourceShareAssociations'] as List)
                .map((e) => ResourceShareAssociation.fromJson(e))
                .toList()
            : null,
        clientToken: json.containsKey('clientToken')
            ? json['clientToken'] as String
            : null,
      );
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
      CreateResourceShareResponse(
        resourceShare: json.containsKey('resourceShare')
            ? ResourceShare.fromJson(json['resourceShare'])
            : null,
        clientToken: json.containsKey('clientToken')
            ? json['clientToken'] as String
            : null,
      );
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
      DeleteResourceShareResponse(
        returnValue: json.containsKey('returnValue')
            ? json['returnValue'] as bool
            : null,
        clientToken: json.containsKey('clientToken')
            ? json['clientToken'] as String
            : null,
      );
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
      DisassociateResourceShareResponse(
        resourceShareAssociations: json.containsKey('resourceShareAssociations')
            ? (json['resourceShareAssociations'] as List)
                .map((e) => ResourceShareAssociation.fromJson(e))
                .toList()
            : null,
        clientToken: json.containsKey('clientToken')
            ? json['clientToken'] as String
            : null,
      );
}

class EnableSharingWithAwsOrganizationResponse {
  /// Indicates whether the request succeeded.
  final bool returnValue;

  EnableSharingWithAwsOrganizationResponse({
    this.returnValue,
  });
  static EnableSharingWithAwsOrganizationResponse fromJson(
          Map<String, dynamic> json) =>
      EnableSharingWithAwsOrganizationResponse(
        returnValue: json.containsKey('returnValue')
            ? json['returnValue'] as bool
            : null,
      );
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
      GetResourcePoliciesResponse(
        policies: json.containsKey('policies')
            ? (json['policies'] as List).map((e) => e as String).toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
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
      GetResourceShareAssociationsResponse(
        resourceShareAssociations: json.containsKey('resourceShareAssociations')
            ? (json['resourceShareAssociations'] as List)
                .map((e) => ResourceShareAssociation.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
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
      GetResourceShareInvitationsResponse(
        resourceShareInvitations: json.containsKey('resourceShareInvitations')
            ? (json['resourceShareInvitations'] as List)
                .map((e) => ResourceShareInvitation.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
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
      GetResourceSharesResponse(
        resourceShares: json.containsKey('resourceShares')
            ? (json['resourceShares'] as List)
                .map((e) => ResourceShare.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
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
      ListPrincipalsResponse(
        principals: json.containsKey('principals')
            ? (json['principals'] as List)
                .map((e) => Principal.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
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
      ListResourcesResponse(
        resources: json.containsKey('resources')
            ? (json['resources'] as List)
                .map((e) => Resource.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
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
  static Principal fromJson(Map<String, dynamic> json) => Principal(
        id: json.containsKey('id') ? json['id'] as String : null,
        resourceShareArn: json.containsKey('resourceShareArn')
            ? json['resourceShareArn'] as String
            : null,
        creationTime: json.containsKey('creationTime')
            ? DateTime.parse(json['creationTime'])
            : null,
        lastUpdatedTime: json.containsKey('lastUpdatedTime')
            ? DateTime.parse(json['lastUpdatedTime'])
            : null,
        isExternal:
            json.containsKey('external') ? json['external'] as bool : null,
      );
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
      RejectResourceShareInvitationResponse(
        resourceShareInvitation: json.containsKey('resourceShareInvitation')
            ? ResourceShareInvitation.fromJson(json['resourceShareInvitation'])
            : null,
        clientToken: json.containsKey('clientToken')
            ? json['clientToken'] as String
            : null,
      );
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
  static Resource fromJson(Map<String, dynamic> json) => Resource(
        arn: json.containsKey('arn') ? json['arn'] as String : null,
        type: json.containsKey('type') ? json['type'] as String : null,
        resourceShareArn: json.containsKey('resourceShareArn')
            ? json['resourceShareArn'] as String
            : null,
        status: json.containsKey('status') ? json['status'] as String : null,
        statusMessage: json.containsKey('statusMessage')
            ? json['statusMessage'] as String
            : null,
        creationTime: json.containsKey('creationTime')
            ? DateTime.parse(json['creationTime'])
            : null,
        lastUpdatedTime: json.containsKey('lastUpdatedTime')
            ? DateTime.parse(json['lastUpdatedTime'])
            : null,
      );
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
  static ResourceShare fromJson(Map<String, dynamic> json) => ResourceShare(
        resourceShareArn: json.containsKey('resourceShareArn')
            ? json['resourceShareArn'] as String
            : null,
        name: json.containsKey('name') ? json['name'] as String : null,
        owningAccountId: json.containsKey('owningAccountId')
            ? json['owningAccountId'] as String
            : null,
        allowExternalPrincipals: json.containsKey('allowExternalPrincipals')
            ? json['allowExternalPrincipals'] as bool
            : null,
        status: json.containsKey('status') ? json['status'] as String : null,
        statusMessage: json.containsKey('statusMessage')
            ? json['statusMessage'] as String
            : null,
        tags: json.containsKey('tags')
            ? (json['tags'] as List).map((e) => Tag.fromJson(e)).toList()
            : null,
        creationTime: json.containsKey('creationTime')
            ? DateTime.parse(json['creationTime'])
            : null,
        lastUpdatedTime: json.containsKey('lastUpdatedTime')
            ? DateTime.parse(json['lastUpdatedTime'])
            : null,
      );
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
      ResourceShareAssociation(
        resourceShareArn: json.containsKey('resourceShareArn')
            ? json['resourceShareArn'] as String
            : null,
        associatedEntity: json.containsKey('associatedEntity')
            ? json['associatedEntity'] as String
            : null,
        associationType: json.containsKey('associationType')
            ? json['associationType'] as String
            : null,
        status: json.containsKey('status') ? json['status'] as String : null,
        statusMessage: json.containsKey('statusMessage')
            ? json['statusMessage'] as String
            : null,
        creationTime: json.containsKey('creationTime')
            ? DateTime.parse(json['creationTime'])
            : null,
        lastUpdatedTime: json.containsKey('lastUpdatedTime')
            ? DateTime.parse(json['lastUpdatedTime'])
            : null,
        isExternal:
            json.containsKey('external') ? json['external'] as bool : null,
      );
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
      ResourceShareInvitation(
        resourceShareInvitationArn:
            json.containsKey('resourceShareInvitationArn')
                ? json['resourceShareInvitationArn'] as String
                : null,
        resourceShareName: json.containsKey('resourceShareName')
            ? json['resourceShareName'] as String
            : null,
        resourceShareArn: json.containsKey('resourceShareArn')
            ? json['resourceShareArn'] as String
            : null,
        senderAccountId: json.containsKey('senderAccountId')
            ? json['senderAccountId'] as String
            : null,
        receiverAccountId: json.containsKey('receiverAccountId')
            ? json['receiverAccountId'] as String
            : null,
        invitationTimestamp: json.containsKey('invitationTimestamp')
            ? DateTime.parse(json['invitationTimestamp'])
            : null,
        status: json.containsKey('status') ? json['status'] as String : null,
        resourceShareAssociations: json.containsKey('resourceShareAssociations')
            ? (json['resourceShareAssociations'] as List)
                .map((e) => ResourceShareAssociation.fromJson(e))
                .toList()
            : null,
      );
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
  static Tag fromJson(Map<String, dynamic> json) => Tag(
        key: json.containsKey('key') ? json['key'] as String : null,
        value: json.containsKey('value') ? json['value'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
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
  Map<String, dynamic> toJson() => <String, dynamic>{};
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
      UpdateResourceShareResponse(
        resourceShare: json.containsKey('resourceShare')
            ? ResourceShare.fromJson(json['resourceShare'])
            : null,
        clientToken: json.containsKey('clientToken')
            ? json['clientToken'] as String
            : null,
      );
}
