import 'package:meta/meta.dart';

/// API for AWS Elemental MediaConnect
class MediaConnectApi {
  /// Adds outputs to an existing flow. You can create up to 20 outputs per
  /// flow.
  ///
  /// [flowArn]: The flow that you want to add outputs to.
  ///
  /// [outputs]: A list of outputs that you want to add.
  Future<AddFlowOutputsResponse> addFlowOutputs(
      {@required String flowArn,
      @required List<AddOutputRequest> outputs}) async {
    return AddFlowOutputsResponse.fromJson({});
  }

  /// Creates a new flow. The request must include one source. The request
  /// optionally can include outputs (up to 20) and entitlements (up to 50).
  ///
  /// [availabilityZone]: The Availability Zone that you want to create the flow
  /// in. These options are limited to the Availability Zones within the current
  /// AWS Region.
  ///
  /// [entitlements]: The entitlements that you want to grant on a flow.
  ///
  /// [name]: The name of the flow.
  ///
  /// [outputs]: The outputs that you want to add to this flow.
  Future<CreateFlowResponse> createFlow(
      {String availabilityZone,
      List<GrantEntitlementRequest> entitlements,
      @required String name,
      List<AddOutputRequest> outputs,
      @required SetSourceRequest source}) async {
    return CreateFlowResponse.fromJson({});
  }

  /// Deletes a flow. Before you can delete a flow, you must stop the flow.
  ///
  /// [flowArn]: The ARN of the flow that you want to delete.
  Future<DeleteFlowResponse> deleteFlow(String flowArn) async {
    return DeleteFlowResponse.fromJson({});
  }

  /// Displays the details of a flow. The response includes the flow ARN, name,
  /// and Availability Zone, as well as details about the source, outputs, and
  /// entitlements.
  ///
  /// [flowArn]: The ARN of the flow that you want to describe.
  Future<DescribeFlowResponse> describeFlow(String flowArn) async {
    return DescribeFlowResponse.fromJson({});
  }

  /// Grants entitlements to an existing flow.
  ///
  /// [entitlements]: The list of entitlements that you want to grant.
  ///
  /// [flowArn]: The flow that you want to grant entitlements on.
  Future<GrantFlowEntitlementsResponse> grantFlowEntitlements(
      {@required List<GrantEntitlementRequest> entitlements,
      @required String flowArn}) async {
    return GrantFlowEntitlementsResponse.fromJson({});
  }

  /// Displays a list of all entitlements that have been granted to this
  /// account. This request returns 20 results per page.
  ///
  /// [maxResults]: The maximum number of results to return per API request. For
  /// example, you submit a ListEntitlements request with MaxResults set at 5.
  /// Although 20 items match your request, the service returns no more than the
  /// first 5 items. (The service also returns a NextToken value that you can
  /// use to fetch the next batch of results.) The service might return fewer
  /// results than the MaxResults value. If MaxResults is not included in the
  /// request, the service defaults to pagination with a maximum of 20 results
  /// per page.
  ///
  /// [nextToken]: The token that identifies which batch of results that you
  /// want to see. For example, you submit a ListEntitlements request with
  /// MaxResults set at 5. The service returns the first batch of results (up to
  /// 5) and a NextToken value. To see the next batch of results, you can submit
  /// the ListEntitlements request a second time and specify the NextToken
  /// value.
  Future<ListEntitlementsResponse> listEntitlements(
      {int maxResults, String nextToken}) async {
    return ListEntitlementsResponse.fromJson({});
  }

  /// Displays a list of flows that are associated with this account. This
  /// request returns a paginated result.
  ///
  /// [maxResults]: The maximum number of results to return per API request. For
  /// example, you submit a ListFlows request with MaxResults set at 5. Although
  /// 20 items match your request, the service returns no more than the first 5
  /// items. (The service also returns a NextToken value that you can use to
  /// fetch the next batch of results.) The service might return fewer results
  /// than the MaxResults value. If MaxResults is not included in the request,
  /// the service defaults to pagination with a maximum of 10 results per page.
  ///
  /// [nextToken]: The token that identifies which batch of results that you
  /// want to see. For example, you submit a ListFlows request with MaxResults
  /// set at 5. The service returns the first batch of results (up to 5) and a
  /// NextToken value. To see the next batch of results, you can submit the
  /// ListFlows request a second time and specify the NextToken value.
  Future<ListFlowsResponse> listFlows(
      {int maxResults, String nextToken}) async {
    return ListFlowsResponse.fromJson({});
  }

  /// List all tags on an AWS Elemental MediaConnect resource
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) that identifies the AWS
  /// Elemental MediaConnect resource for which to list the tags.
  Future<ListTagsForResourceResponse> listTagsForResource(
      String resourceArn) async {
    return ListTagsForResourceResponse.fromJson({});
  }

  /// Removes an output from an existing flow. This request can be made only on
  /// an output that does not have an entitlement associated with it. If the
  /// output has an entitlement, you must revoke the entitlement instead. When
  /// an entitlement is revoked from a flow, the service automatically removes
  /// the associated output.
  ///
  /// [flowArn]: The flow that you want to remove an output from.
  ///
  /// [outputArn]: The ARN of the output that you want to remove.
  Future<RemoveFlowOutputResponse> removeFlowOutput(
      {@required String flowArn, @required String outputArn}) async {
    return RemoveFlowOutputResponse.fromJson({});
  }

  /// Revokes an entitlement from a flow. Once an entitlement is revoked, the
  /// content becomes unavailable to the subscriber and the associated output is
  /// removed.
  ///
  /// [entitlementArn]: The ARN of the entitlement that you want to revoke.
  ///
  /// [flowArn]: The flow that you want to revoke an entitlement from.
  Future<RevokeFlowEntitlementResponse> revokeFlowEntitlement(
      {@required String entitlementArn, @required String flowArn}) async {
    return RevokeFlowEntitlementResponse.fromJson({});
  }

  /// Starts a flow.
  ///
  /// [flowArn]: The ARN of the flow that you want to start.
  Future<StartFlowResponse> startFlow(String flowArn) async {
    return StartFlowResponse.fromJson({});
  }

  /// Stops a flow.
  ///
  /// [flowArn]: The ARN of the flow that you want to stop.
  Future<StopFlowResponse> stopFlow(String flowArn) async {
    return StopFlowResponse.fromJson({});
  }

  /// Associates the specified tags to a resource with the specified
  /// resourceArn. If existing tags on a resource are not specified in the
  /// request parameters, they are not changed. When a resource is deleted, the
  /// tags associated with that resource are deleted as well.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) that identifies the AWS
  /// Elemental MediaConnect resource to which to add tags.
  ///
  /// [tags]: A map from tag keys to values. Tag keys can have a maximum
  /// character length of 128 characters, and tag values can have a maximum
  /// length of 256 characters.
  Future<void> tagResource(
      {@required String resourceArn,
      @required Map<String, String> tags}) async {}

  /// Deletes specified tags from a resource.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) that identifies the AWS
  /// Elemental MediaConnect resource from which to delete tags.
  ///
  /// [tagKeys]: The keys of the tags to be removed.
  Future<void> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {}

  /// You can change an entitlement's description, subscribers, and encryption.
  /// If you change the subscribers, the service will remove the outputs that
  /// are are used by the subscribers that are removed.
  ///
  /// [description]: A description of the entitlement. This description appears
  /// only on the AWS Elemental MediaConnect console and will not be seen by the
  /// subscriber or end user.
  ///
  /// [encryption]: The type of encryption that will be used on the output
  /// associated with this entitlement.
  ///
  /// [entitlementArn]: The ARN of the entitlement that you want to update.
  ///
  /// [flowArn]: The flow that is associated with the entitlement that you want
  /// to update.
  ///
  /// [subscribers]: The AWS account IDs that you want to share your content
  /// with. The receiving accounts (subscribers) will be allowed to create their
  /// own flow using your content as the source.
  Future<UpdateFlowEntitlementResponse> updateFlowEntitlement(
      {String description,
      UpdateEncryption encryption,
      @required String entitlementArn,
      @required String flowArn,
      List<String> subscribers}) async {
    return UpdateFlowEntitlementResponse.fromJson({});
  }

  /// Updates an existing flow output.
  ///
  /// [cidrAllowList]: The range of IP addresses that should be allowed to
  /// initiate output requests to this flow. These IP addresses should be in the
  /// form of a Classless Inter-Domain Routing (CIDR) block; for example,
  /// 10.0.0.0/16.
  ///
  /// [description]: A description of the output. This description appears only
  /// on the AWS Elemental MediaConnect console and will not be seen by the end
  /// user.
  ///
  /// [destination]: The IP address where you want to send the output.
  ///
  /// [encryption]: The type of key used for the encryption. If no keyType is
  /// provided, the service will use the default setting (static-key).
  ///
  /// [flowArn]: The flow that is associated with the output that you want to
  /// update.
  ///
  /// [maxLatency]: The maximum latency in milliseconds for Zixi-based streams.
  ///
  /// [outputArn]: The ARN of the output that you want to update.
  ///
  /// [port]: The port to use when content is distributed to this output.
  ///
  /// [protocol]: The protocol to use for the output.
  ///
  /// [remoteId]: The remote ID for the Zixi-pull stream.
  ///
  /// [smoothingLatency]: The smoothing latency in milliseconds for RIST, RTP,
  /// and RTP-FEC streams.
  ///
  /// [streamId]: The stream ID that you want to use for this transport. This
  /// parameter applies only to Zixi-based streams.
  Future<UpdateFlowOutputResponse> updateFlowOutput(
      {List<String> cidrAllowList,
      String description,
      String destination,
      UpdateEncryption encryption,
      @required String flowArn,
      int maxLatency,
      @required String outputArn,
      int port,
      String protocol,
      String remoteId,
      int smoothingLatency,
      String streamId}) async {
    return UpdateFlowOutputResponse.fromJson({});
  }

  /// Updates the source of a flow.
  ///
  /// [decryption]: The type of encryption used on the content ingested from
  /// this source.
  ///
  /// [description]: A description for the source. This value is not used or
  /// seen outside of the current AWS Elemental MediaConnect account.
  ///
  /// [entitlementArn]: The ARN of the entitlement that allows you to subscribe
  /// to this flow. The entitlement is set by the flow originator, and the ARN
  /// is generated as part of the originator's flow.
  ///
  /// [flowArn]: The flow that is associated with the source that you want to
  /// update.
  ///
  /// [ingestPort]: The port that the flow will be listening on for incoming
  /// content.
  ///
  /// [maxBitrate]: The smoothing max bitrate for RIST, RTP, and RTP-FEC
  /// streams.
  ///
  /// [maxLatency]: The maximum latency in milliseconds. This parameter applies
  /// only to RIST-based and Zixi-based streams.
  ///
  /// [protocol]: The protocol that is used by the source.
  ///
  /// [sourceArn]: The ARN of the source that you want to update.
  ///
  /// [streamId]: The stream ID that you want to use for this transport. This
  /// parameter applies only to Zixi-based streams.
  ///
  /// [whitelistCidr]: The range of IP addresses that should be allowed to
  /// contribute content to your source. These IP addresses should be in the
  /// form of a Classless Inter-Domain Routing (CIDR) block; for example,
  /// 10.0.0.0/16.
  Future<UpdateFlowSourceResponse> updateFlowSource(
      {UpdateEncryption decryption,
      String description,
      String entitlementArn,
      @required String flowArn,
      int ingestPort,
      int maxBitrate,
      int maxLatency,
      String protocol,
      @required String sourceArn,
      String streamId,
      String whitelistCidr}) async {
    return UpdateFlowSourceResponse.fromJson({});
  }
}

class AddFlowOutputsResponse {
  /// The ARN of the flow that these outputs were added to.
  final String flowArn;

  /// The details of the newly added outputs.
  final List<Output> outputs;

  AddFlowOutputsResponse({
    this.flowArn,
    this.outputs,
  });
  static AddFlowOutputsResponse fromJson(Map<String, dynamic> json) =>
      AddFlowOutputsResponse();
}

class AddOutputRequest {
  /// The range of IP addresses that should be allowed to initiate output
  /// requests to this flow. These IP addresses should be in the form of a
  /// Classless Inter-Domain Routing (CIDR) block; for example, 10.0.0.0/16.
  final List<String> cidrAllowList;

  /// A description of the output. This description appears only on the AWS
  /// Elemental MediaConnect console and will not be seen by the end user.
  final String description;

  /// The IP address from which video will be sent to output destinations.
  final String destination;

  /// The type of key used for the encryption. If no keyType is provided, the
  /// service will use the default setting (static-key).
  final Encryption encryption;

  /// The maximum latency in milliseconds for Zixi-based streams.
  final int maxLatency;

  /// The name of the output. This value must be unique within the current flow.
  final String name;

  /// The port to use when content is distributed to this output.
  final int port;

  /// The protocol to use for the output.
  final String protocol;

  /// The remote ID for the Zixi-pull output stream.
  final String remoteId;

  /// The smoothing latency in milliseconds for RIST, RTP, and RTP-FEC streams.
  final int smoothingLatency;

  /// The stream ID that you want to use for this transport. This parameter
  /// applies only to Zixi-based streams.
  final String streamId;

  AddOutputRequest({
    this.cidrAllowList,
    this.description,
    this.destination,
    this.encryption,
    this.maxLatency,
    this.name,
    this.port,
    @required this.protocol,
    this.remoteId,
    this.smoothingLatency,
    this.streamId,
  });
}

class CreateFlowResponse {
  final Flow flow;

  CreateFlowResponse({
    this.flow,
  });
  static CreateFlowResponse fromJson(Map<String, dynamic> json) =>
      CreateFlowResponse();
}

class DeleteFlowResponse {
  /// The ARN of the flow that was deleted.
  final String flowArn;

  /// The status of the flow when the DeleteFlow process begins.
  final String status;

  DeleteFlowResponse({
    this.flowArn,
    this.status,
  });
  static DeleteFlowResponse fromJson(Map<String, dynamic> json) =>
      DeleteFlowResponse();
}

class DescribeFlowResponse {
  final Flow flow;

  final Messages messages;

  DescribeFlowResponse({
    this.flow,
    this.messages,
  });
  static DescribeFlowResponse fromJson(Map<String, dynamic> json) =>
      DescribeFlowResponse();
}

class Encryption {
  /// The type of algorithm that is used for the encryption (such as aes128,
  /// aes192, or aes256).
  final String algorithm;

  /// A 128-bit, 16-byte hex value represented by a 32-character string, to be
  /// used with the key for encrypting content. This parameter is not valid for
  /// static key encryption.
  final String constantInitializationVector;

  /// The value of one of the devices that you configured with your digital
  /// rights management (DRM) platform key provider. This parameter is required
  /// for SPEKE encryption and is not valid for static key encryption.
  final String deviceId;

  /// The type of key that is used for the encryption. If no keyType is
  /// provided, the service will use the default setting (static-key).
  final String keyType;

  /// The AWS Region that the API Gateway proxy endpoint was created in. This
  /// parameter is required for SPEKE encryption and is not valid for static key
  /// encryption.
  final String region;

  /// An identifier for the content. The service sends this value to the key
  /// server to identify the current endpoint. The resource ID is also known as
  /// the content ID. This parameter is required for SPEKE encryption and is not
  /// valid for static key encryption.
  final String resourceId;

  /// The ARN of the role that you created during setup (when you set up AWS
  /// Elemental MediaConnect as a trusted entity).
  final String roleArn;

  /// The ARN of the secret that you created in AWS Secrets Manager to store the
  /// encryption key. This parameter is required for static key encryption and
  /// is not valid for SPEKE encryption.
  final String secretArn;

  /// The URL from the API Gateway proxy that you set up to talk to your key
  /// server. This parameter is required for SPEKE encryption and is not valid
  /// for static key encryption.
  final String url;

  Encryption({
    @required this.algorithm,
    this.constantInitializationVector,
    this.deviceId,
    this.keyType,
    this.region,
    this.resourceId,
    @required this.roleArn,
    this.secretArn,
    this.url,
  });
  static Encryption fromJson(Map<String, dynamic> json) => Encryption();
}

class Entitlement {
  /// A description of the entitlement.
  final String description;

  /// The type of encryption that will be used on the output that is associated
  /// with this entitlement.
  final Encryption encryption;

  /// The ARN of the entitlement.
  final String entitlementArn;

  /// The name of the entitlement.
  final String name;

  /// The AWS account IDs that you want to share your content with. The
  /// receiving accounts (subscribers) will be allowed to create their own flow
  /// using your content as the source.
  final List<String> subscribers;

  Entitlement({
    this.description,
    this.encryption,
    @required this.entitlementArn,
    @required this.name,
    @required this.subscribers,
  });
  static Entitlement fromJson(Map<String, dynamic> json) => Entitlement();
}

class Flow {
  /// The Availability Zone that you want to create the flow in. These options
  /// are limited to the Availability Zones within the current AWS.
  final String availabilityZone;

  /// A description of the flow. This value is not used or seen outside of the
  /// current AWS Elemental MediaConnect account.
  final String description;

  /// The IP address from which video will be sent to output destinations.
  final String egressIp;

  /// The entitlements in this flow.
  final List<Entitlement> entitlements;

  /// The Amazon Resource Name (ARN), a unique identifier for any AWS resource,
  /// of the flow.
  final String flowArn;

  /// The name of the flow.
  final String name;

  /// The outputs in this flow.
  final List<Output> outputs;

  final Source source;

  /// The current status of the flow.
  final String status;

  Flow({
    @required this.availabilityZone,
    this.description,
    this.egressIp,
    @required this.entitlements,
    @required this.flowArn,
    @required this.name,
    @required this.outputs,
    @required this.source,
    @required this.status,
  });
  static Flow fromJson(Map<String, dynamic> json) => Flow();
}

class GrantEntitlementRequest {
  /// A description of the entitlement. This description appears only on the AWS
  /// Elemental MediaConnect console and will not be seen by the subscriber or
  /// end user.
  final String description;

  /// The type of encryption that will be used on the output that is associated
  /// with this entitlement.
  final Encryption encryption;

  /// The name of the entitlement. This value must be unique within the current
  /// flow.
  final String name;

  /// The AWS account IDs that you want to share your content with. The
  /// receiving accounts (subscribers) will be allowed to create their own flows
  /// using your content as the source.
  final List<String> subscribers;

  GrantEntitlementRequest({
    this.description,
    this.encryption,
    this.name,
    @required this.subscribers,
  });
}

class GrantFlowEntitlementsResponse {
  /// The entitlements that were just granted.
  final List<Entitlement> entitlements;

  /// The ARN of the flow that these entitlements were granted to.
  final String flowArn;

  GrantFlowEntitlementsResponse({
    this.entitlements,
    this.flowArn,
  });
  static GrantFlowEntitlementsResponse fromJson(Map<String, dynamic> json) =>
      GrantFlowEntitlementsResponse();
}

class ListEntitlementsResponse {
  /// A list of entitlements that have been granted to you from other AWS
  /// accounts.
  final List<ListedEntitlement> entitlements;

  /// The token that identifies which batch of results that you want to see. For
  /// example, you submit a ListEntitlements request with MaxResults set at 5.
  /// The service returns the first batch of results (up to 5) and a NextToken
  /// value. To see the next batch of results, you can submit the
  /// ListEntitlements request a second time and specify the NextToken value.
  final String nextToken;

  ListEntitlementsResponse({
    this.entitlements,
    this.nextToken,
  });
  static ListEntitlementsResponse fromJson(Map<String, dynamic> json) =>
      ListEntitlementsResponse();
}

class ListFlowsResponse {
  /// A list of flow summaries.
  final List<ListedFlow> flows;

  /// The token that identifies which batch of results that you want to see. For
  /// example, you submit a ListFlows request with MaxResults set at 5. The
  /// service returns the first batch of results (up to 5) and a NextToken
  /// value. To see the next batch of results, you can submit the ListFlows
  /// request a second time and specify the NextToken value.
  final String nextToken;

  ListFlowsResponse({
    this.flows,
    this.nextToken,
  });
  static ListFlowsResponse fromJson(Map<String, dynamic> json) =>
      ListFlowsResponse();
}

class ListTagsForResourceResponse {
  /// A map from tag keys to values. Tag keys can have a maximum character
  /// length of 128 characters, and tag values can have a maximum length of 256
  /// characters.
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  static ListTagsForResourceResponse fromJson(Map<String, dynamic> json) =>
      ListTagsForResourceResponse();
}

class ListedEntitlement {
  /// The ARN of the entitlement.
  final String entitlementArn;

  /// The name of the entitlement.
  final String entitlementName;

  ListedEntitlement({
    @required this.entitlementArn,
    @required this.entitlementName,
  });
  static ListedEntitlement fromJson(Map<String, dynamic> json) =>
      ListedEntitlement();
}

class ListedFlow {
  /// The Availability Zone that the flow was created in.
  final String availabilityZone;

  /// A description of the flow.
  final String description;

  /// The ARN of the flow.
  final String flowArn;

  /// The name of the flow.
  final String name;

  /// The type of source. This value is either owned (originated somewhere other
  /// than an AWS Elemental MediaConnect flow owned by another AWS account) or
  /// entitled (originated at an AWS Elemental MediaConnect flow owned by
  /// another AWS account).
  final String sourceType;

  /// The current status of the flow.
  final String status;

  ListedFlow({
    @required this.availabilityZone,
    @required this.description,
    @required this.flowArn,
    @required this.name,
    @required this.sourceType,
    @required this.status,
  });
  static ListedFlow fromJson(Map<String, dynamic> json) => ListedFlow();
}

class Messages {
  /// A list of errors that might have been generated from processes on this
  /// flow.
  final List<String> errors;

  Messages({
    @required this.errors,
  });
  static Messages fromJson(Map<String, dynamic> json) => Messages();
}

class Output {
  /// A description of the output.
  final String description;

  /// The address where you want to send the output.
  final String destination;

  /// The type of key used for the encryption. If no keyType is provided, the
  /// service will use the default setting (static-key).
  final Encryption encryption;

  /// The ARN of the entitlement on the originator''s flow. This value is
  /// relevant only on entitled flows.
  final String entitlementArn;

  /// The input ARN of the AWS Elemental MediaLive channel. This parameter is
  /// relevant only for outputs that were added by creating a MediaLive input.
  final String mediaLiveInputArn;

  /// The name of the output. This value must be unique within the current flow.
  final String name;

  /// The ARN of the output.
  final String outputArn;

  /// The port to use when content is distributed to this output.
  final int port;

  /// Attributes related to the transport stream that are used in the output.
  final Transport transport;

  Output({
    this.description,
    this.destination,
    this.encryption,
    this.entitlementArn,
    this.mediaLiveInputArn,
    @required this.name,
    @required this.outputArn,
    this.port,
    this.transport,
  });
  static Output fromJson(Map<String, dynamic> json) => Output();
}

class RemoveFlowOutputResponse {
  /// The ARN of the flow that is associated with the output you removed.
  final String flowArn;

  /// The ARN of the output that was removed.
  final String outputArn;

  RemoveFlowOutputResponse({
    this.flowArn,
    this.outputArn,
  });
  static RemoveFlowOutputResponse fromJson(Map<String, dynamic> json) =>
      RemoveFlowOutputResponse();
}

class RevokeFlowEntitlementResponse {
  /// The ARN of the entitlement that was revoked.
  final String entitlementArn;

  /// The ARN of the flow that the entitlement was revoked from.
  final String flowArn;

  RevokeFlowEntitlementResponse({
    this.entitlementArn,
    this.flowArn,
  });
  static RevokeFlowEntitlementResponse fromJson(Map<String, dynamic> json) =>
      RevokeFlowEntitlementResponse();
}

class SetSourceRequest {
  /// The type of encryption that is used on the content ingested from this
  /// source.
  final Encryption decryption;

  /// A description for the source. This value is not used or seen outside of
  /// the current AWS Elemental MediaConnect account.
  final String description;

  /// The ARN of the entitlement that allows you to subscribe to this flow. The
  /// entitlement is set by the flow originator, and the ARN is generated as
  /// part of the originator's flow.
  final String entitlementArn;

  /// The port that the flow will be listening on for incoming content.
  final int ingestPort;

  /// The smoothing max bitrate for RIST, RTP, and RTP-FEC streams.
  final int maxBitrate;

  /// The maximum latency in milliseconds. This parameter applies only to
  /// RIST-based and Zixi-based streams.
  final int maxLatency;

  /// The name of the source.
  final String name;

  /// The protocol that is used by the source.
  final String protocol;

  /// The stream ID that you want to use for this transport. This parameter
  /// applies only to Zixi-based streams.
  final String streamId;

  /// The range of IP addresses that should be allowed to contribute content to
  /// your source. These IP addresses should be in the form of a Classless
  /// Inter-Domain Routing (CIDR) block; for example, 10.0.0.0/16.
  final String whitelistCidr;

  SetSourceRequest({
    this.decryption,
    this.description,
    this.entitlementArn,
    this.ingestPort,
    this.maxBitrate,
    this.maxLatency,
    this.name,
    this.protocol,
    this.streamId,
    this.whitelistCidr,
  });
}

class Source {
  /// The type of encryption that is used on the content ingested from this
  /// source.
  final Encryption decryption;

  /// A description for the source. This value is not used or seen outside of
  /// the current AWS Elemental MediaConnect account.
  final String description;

  /// The ARN of the entitlement that allows you to subscribe to content that
  /// comes from another AWS account. The entitlement is set by the content
  /// originator and the ARN is generated as part of the originator's flow.
  final String entitlementArn;

  /// The IP address that the flow will be listening on for incoming content.
  final String ingestIp;

  /// The port that the flow will be listening on for incoming content.
  final int ingestPort;

  /// The name of the source.
  final String name;

  /// The ARN of the source.
  final String sourceArn;

  /// Attributes related to the transport stream that are used in the source.
  final Transport transport;

  /// The range of IP addresses that should be allowed to contribute content to
  /// your source. These IP addresses should be in the form of a Classless
  /// Inter-Domain Routing (CIDR) block; for example, 10.0.0.0/16.
  final String whitelistCidr;

  Source({
    this.decryption,
    this.description,
    this.entitlementArn,
    this.ingestIp,
    this.ingestPort,
    @required this.name,
    @required this.sourceArn,
    this.transport,
    this.whitelistCidr,
  });
  static Source fromJson(Map<String, dynamic> json) => Source();
}

class StartFlowResponse {
  /// The ARN of the flow that you started.
  final String flowArn;

  /// The status of the flow when the StartFlow process begins.
  final String status;

  StartFlowResponse({
    this.flowArn,
    this.status,
  });
  static StartFlowResponse fromJson(Map<String, dynamic> json) =>
      StartFlowResponse();
}

class StopFlowResponse {
  /// The ARN of the flow that you stopped.
  final String flowArn;

  /// The status of the flow when the StopFlow process begins.
  final String status;

  StopFlowResponse({
    this.flowArn,
    this.status,
  });
  static StopFlowResponse fromJson(Map<String, dynamic> json) =>
      StopFlowResponse();
}

class Transport {
  /// The range of IP addresses that should be allowed to initiate output
  /// requests to this flow. These IP addresses should be in the form of a
  /// Classless Inter-Domain Routing (CIDR) block; for example, 10.0.0.0/16.
  final List<String> cidrAllowList;

  /// The smoothing max bitrate for RIST, RTP, and RTP-FEC streams.
  final int maxBitrate;

  /// The maximum latency in milliseconds. This parameter applies only to
  /// RIST-based and Zixi-based streams.
  final int maxLatency;

  /// The protocol that is used by the source or output.
  final String protocol;

  /// The remote ID for the Zixi-pull stream.
  final String remoteId;

  /// The smoothing latency in milliseconds for RIST, RTP, and RTP-FEC streams.
  final int smoothingLatency;

  /// The stream ID that you want to use for this transport. This parameter
  /// applies only to Zixi-based streams.
  final String streamId;

  Transport({
    this.cidrAllowList,
    this.maxBitrate,
    this.maxLatency,
    @required this.protocol,
    this.remoteId,
    this.smoothingLatency,
    this.streamId,
  });
  static Transport fromJson(Map<String, dynamic> json) => Transport();
}

class UpdateEncryption {
  /// The type of algorithm that is used for the encryption (such as aes128,
  /// aes192, or aes256).
  final String algorithm;

  /// A 128-bit, 16-byte hex value represented by a 32-character string, to be
  /// used with the key for encrypting content. This parameter is not valid for
  /// static key encryption.
  final String constantInitializationVector;

  /// The value of one of the devices that you configured with your digital
  /// rights management (DRM) platform key provider. This parameter is required
  /// for SPEKE encryption and is not valid for static key encryption.
  final String deviceId;

  /// The type of key that is used for the encryption. If no keyType is
  /// provided, the service will use the default setting (static-key).
  final String keyType;

  /// The AWS Region that the API Gateway proxy endpoint was created in. This
  /// parameter is required for SPEKE encryption and is not valid for static key
  /// encryption.
  final String region;

  /// An identifier for the content. The service sends this value to the key
  /// server to identify the current endpoint. The resource ID is also known as
  /// the content ID. This parameter is required for SPEKE encryption and is not
  /// valid for static key encryption.
  final String resourceId;

  /// The ARN of the role that you created during setup (when you set up AWS
  /// Elemental MediaConnect as a trusted entity).
  final String roleArn;

  /// The ARN of the secret that you created in AWS Secrets Manager to store the
  /// encryption key. This parameter is required for static key encryption and
  /// is not valid for SPEKE encryption.
  final String secretArn;

  /// The URL from the API Gateway proxy that you set up to talk to your key
  /// server. This parameter is required for SPEKE encryption and is not valid
  /// for static key encryption.
  final String url;

  UpdateEncryption({
    this.algorithm,
    this.constantInitializationVector,
    this.deviceId,
    this.keyType,
    this.region,
    this.resourceId,
    this.roleArn,
    this.secretArn,
    this.url,
  });
}

class UpdateFlowEntitlementResponse {
  final Entitlement entitlement;

  /// The ARN of the flow that this entitlement was granted on.
  final String flowArn;

  UpdateFlowEntitlementResponse({
    this.entitlement,
    this.flowArn,
  });
  static UpdateFlowEntitlementResponse fromJson(Map<String, dynamic> json) =>
      UpdateFlowEntitlementResponse();
}

class UpdateFlowOutputResponse {
  /// The ARN of the flow that is associated with the updated output.
  final String flowArn;

  final Output output;

  UpdateFlowOutputResponse({
    this.flowArn,
    this.output,
  });
  static UpdateFlowOutputResponse fromJson(Map<String, dynamic> json) =>
      UpdateFlowOutputResponse();
}

class UpdateFlowSourceResponse {
  /// The ARN of the flow that you want to update.
  final String flowArn;

  /// The settings for the source of the flow.
  final Source source;

  UpdateFlowSourceResponse({
    this.flowArn,
    this.source,
  });
  static UpdateFlowSourceResponse fromJson(Map<String, dynamic> json) =>
      UpdateFlowSourceResponse();
}
