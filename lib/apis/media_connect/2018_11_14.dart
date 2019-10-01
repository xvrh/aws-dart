import 'package:meta/meta.dart';

/// API for AWS Elemental MediaConnect
class MediaConnectApi {
  /// Adds outputs to an existing flow. You can create up to 20 outputs per
  /// flow.
  Future<void> addFlowOutputs(
      {@required String flowArn,
      @required List<AddOutputRequest> outputs}) async {}

  /// Creates a new flow. The request must include one source. The request
  /// optionally can include outputs (up to 20) and entitlements (up to 50).
  Future<void> createFlow(
      {String availabilityZone,
      List<GrantEntitlementRequest> entitlements,
      @required String name,
      List<AddOutputRequest> outputs,
      @required SetSourceRequest source}) async {}

  /// Deletes a flow. Before you can delete a flow, you must stop the flow.
  Future<void> deleteFlow(String flowArn) async {}

  /// Displays the details of a flow. The response includes the flow ARN, name,
  /// and Availability Zone, as well as details about the source, outputs, and
  /// entitlements.
  Future<void> describeFlow(String flowArn) async {}

  /// Grants entitlements to an existing flow.
  Future<void> grantFlowEntitlements(
      {@required List<GrantEntitlementRequest> entitlements,
      @required String flowArn}) async {}

  /// Displays a list of all entitlements that have been granted to this
  /// account. This request returns 20 results per page.
  Future<void> listEntitlements({int maxResults, String nextToken}) async {}

  /// Displays a list of flows that are associated with this account. This
  /// request returns a paginated result.
  Future<void> listFlows({int maxResults, String nextToken}) async {}

  /// List all tags on an AWS Elemental MediaConnect resource
  Future<void> listTagsForResource(String resourceArn) async {}

  /// Removes an output from an existing flow. This request can be made only on
  /// an output that does not have an entitlement associated with it. If the
  /// output has an entitlement, you must revoke the entitlement instead. When
  /// an entitlement is revoked from a flow, the service automatically removes
  /// the associated output.
  Future<void> removeFlowOutput(
      {@required String flowArn, @required String outputArn}) async {}

  /// Revokes an entitlement from a flow. Once an entitlement is revoked, the
  /// content becomes unavailable to the subscriber and the associated output is
  /// removed.
  Future<void> revokeFlowEntitlement(
      {@required String entitlementArn, @required String flowArn}) async {}

  /// Starts a flow.
  Future<void> startFlow(String flowArn) async {}

  /// Stops a flow.
  Future<void> stopFlow(String flowArn) async {}

  /// Associates the specified tags to a resource with the specified
  /// resourceArn. If existing tags on a resource are not specified in the
  /// request parameters, they are not changed. When a resource is deleted, the
  /// tags associated with that resource are deleted as well.
  Future<void> tagResource(
      {@required String resourceArn,
      @required Map<String, String> tags}) async {}

  /// Deletes specified tags from a resource.
  Future<void> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {}

  /// You can change an entitlement's description, subscribers, and encryption.
  /// If you change the subscribers, the service will remove the outputs that
  /// are are used by the subscribers that are removed.
  Future<void> updateFlowEntitlement(
      {String description,
      UpdateEncryption encryption,
      @required String entitlementArn,
      @required String flowArn,
      List<String> subscribers}) async {}

  /// Updates an existing flow output.
  Future<void> updateFlowOutput(
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
      String streamId}) async {}

  /// Updates the source of a flow.
  Future<void> updateFlowSource(
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
      String whitelistCidr}) async {}
}

class AddFlowOutputsResponse {}

class AddOutputRequest {}

class CreateFlowResponse {}

class DeleteFlowResponse {}

class DescribeFlowResponse {}

class Encryption {}

class Entitlement {}

class Flow {}

class GrantEntitlementRequest {}

class GrantFlowEntitlementsResponse {}

class ListEntitlementsResponse {}

class ListFlowsResponse {}

class ListTagsForResourceResponse {}

class ListedEntitlement {}

class ListedFlow {}

class Messages {}

class Output {}

class RemoveFlowOutputResponse {}

class RevokeFlowEntitlementResponse {}

class SetSourceRequest {}

class Source {}

class StartFlowResponse {}

class StopFlowResponse {}

class Transport {}

class UpdateEncryption {}

class UpdateFlowEntitlementResponse {}

class UpdateFlowOutputResponse {}

class UpdateFlowSourceResponse {}
