import 'package:meta/meta.dart';

/// Here's how you set up to query an Amazon Route 53 private hosted zone from
/// your network:
///
/// 1.  Connect your network to a VPC using AWS Direct Connect or a VPN.
///
/// 2.  Run the following AWS CLI command to create a Resolver endpoint:
///
///      `create-resolver-endpoint --name \[endpoint\_name\] --direction INBOUND
/// --creator-request-id \[unique\_string\] --security-group-ids
/// \[security\_group\_with\_inbound\_rules\] --ip-addresses
/// SubnetId=\[subnet\_id\] SubnetId=\[subnet\_id\_in\_different_AZ\]`
///
///     Note the resolver endpoint ID that appears in the response. You'll use
/// it in step 3.
///
/// 3.  Get the IP addresses for the Resolver endpoints:
///
///      `get-resolver-endpoint --resolver-endpoint-id
/// \[resolver\_endpoint\_id\]`
///
/// 4.  In your network configuration, define the IP addresses that you got in
/// step 3 as DNS servers.
///
///     You can now query instance names in your VPCs and the names of records
/// in your private hosted zone.
///
///
/// You can also perform the following operations using the AWS CLI:
///
/// *    `list-resolver-endpoints`: List all endpoints. The syntax includes
/// options for pagination and filtering.
///
/// *    `update-resolver-endpoints`: Add IP addresses to an endpoint or remove
/// IP addresses from an endpoint.
///
///
/// To delete an endpoint, use the following AWS CLI command:
///
///  `delete-resolver-endpoint --resolver-endpoint-id
/// \[resolver\_endpoint\_id\]`
class Route53ResolverApi {
  /// Adds IP addresses to an inbound or an outbound resolver endpoint. If you
  /// want to adding more than one IP address, submit one
  /// `AssociateResolverEndpointIpAddress` request for each IP address.
  ///
  /// To remove an IP address from an endpoint, see
  /// DisassociateResolverEndpointIpAddress.
  Future<void> associateResolverEndpointIpAddress(
      {@required String resolverEndpointId,
      @required IpAddressUpdate ipAddress}) async {}

  /// Associates a resolver rule with a VPC. When you associate a rule with a
  /// VPC, Resolver forwards all DNS queries for the domain name that is
  /// specified in the rule and that originate in the VPC. The queries are
  /// forwarded to the IP addresses for the DNS resolvers that are specified in
  /// the rule. For more information about rules, see CreateResolverRule.
  Future<void> associateResolverRule(
      {@required String resolverRuleId,
      String name,
      @required String vpcId}) async {}

  /// Creates a resolver endpoint. There are two types of resolver endpoints,
  /// inbound and outbound:
  ///
  /// *   An _inbound resolver endpoint_ forwards DNS queries to the DNS service
  /// for a VPC from your network or another VPC.
  ///
  /// *   An _outbound resolver endpoint_ forwards DNS queries from the DNS
  /// service for a VPC to your network or another VPC.
  Future<void> createResolverEndpoint(
      {@required String creatorRequestId,
      String name,
      @required List<String> securityGroupIds,
      @required String direction,
      @required List<IpAddressRequest> ipAddresses,
      List<Tag> tags}) async {}

  /// For DNS queries that originate in your VPCs, specifies which resolver
  /// endpoint the queries pass through, one domain name that you want to
  /// forward to your network, and the IP addresses of the DNS resolvers in your
  /// network.
  Future<void> createResolverRule(
      {@required String creatorRequestId,
      String name,
      @required String ruleType,
      @required String domainName,
      List<TargetAddress> targetIps,
      String resolverEndpointId,
      List<Tag> tags}) async {}

  /// Deletes a resolver endpoint. The effect of deleting a resolver endpoint
  /// depends on whether it's an inbound or an outbound resolver endpoint:
  ///
  /// *    **Inbound**: DNS queries from your network or another VPC are no
  /// longer routed to the DNS service for the specified VPC.
  ///
  /// *    **Outbound**: DNS queries from a VPC are no longer routed to your
  /// network or to another VPC.
  Future<void> deleteResolverEndpoint(String resolverEndpointId) async {}

  /// Deletes a resolver rule. Before you can delete a resolver rule, you must
  /// disassociate it from all the VPCs that you associated the resolver rule
  /// with. For more infomation, see DisassociateResolverRule.
  Future<void> deleteResolverRule(String resolverRuleId) async {}

  /// Removes IP addresses from an inbound or an outbound resolver endpoint. If
  /// you want to remove more than one IP address, submit one
  /// `DisassociateResolverEndpointIpAddress` request for each IP address.
  ///
  /// To add an IP address to an endpoint, see
  /// AssociateResolverEndpointIpAddress.
  Future<void> disassociateResolverEndpointIpAddress(
      {@required String resolverEndpointId,
      @required IpAddressUpdate ipAddress}) async {}

  /// Removes the association between a specified resolver rule and a specified
  /// VPC.
  ///
  ///
  ///
  /// If you disassociate a resolver rule from a VPC, Resolver stops forwarding
  /// DNS queries for the domain name that you specified in the resolver rule.
  Future<void> disassociateResolverRule(
      {@required String vpcId, @required String resolverRuleId}) async {}

  /// Gets information about a specified resolver endpoint, such as whether it's
  /// an inbound or an outbound resolver endpoint, and the current status of the
  /// endpoint.
  Future<void> getResolverEndpoint(String resolverEndpointId) async {}

  /// Gets information about a specified resolver rule, such as the domain name
  /// that the rule forwards DNS queries for and the ID of the outbound resolver
  /// endpoint that the rule is associated with.
  Future<void> getResolverRule(String resolverRuleId) async {}

  /// Gets information about an association between a specified resolver rule
  /// and a VPC. You associate a resolver rule and a VPC using
  /// AssociateResolverRule.
  Future<void> getResolverRuleAssociation(
      String resolverRuleAssociationId) async {}

  /// Gets information about a resolver rule policy. A resolver rule policy
  /// specifies the Resolver operations and resources that you want to allow
  /// another AWS account to be able to use.
  Future<void> getResolverRulePolicy(String arn) async {}

  /// Gets the IP addresses for a specified resolver endpoint.
  Future<void> listResolverEndpointIpAddresses(String resolverEndpointId,
      {int maxResults, String nextToken}) async {}

  /// Lists all the resolver endpoints that were created using the current AWS
  /// account.
  Future<void> listResolverEndpoints(
      {int maxResults, String nextToken, List<Filter> filters}) async {}

  /// Lists the associations that were created between resolver rules and VPCs
  /// using the current AWS account.
  Future<void> listResolverRuleAssociations(
      {int maxResults, String nextToken, List<Filter> filters}) async {}

  /// Lists the resolver rules that were created using the current AWS account.
  Future<void> listResolverRules(
      {int maxResults, String nextToken, List<Filter> filters}) async {}

  /// Lists the tags that you associated with the specified resource.
  Future<void> listTagsForResource(String resourceArn,
      {int maxResults, String nextToken}) async {}

  /// Specifies the Resolver operations and resources that you want to allow
  /// another AWS account to be able to use.
  Future<void> putResolverRulePolicy(
      {@required String arn, @required String resolverRulePolicy}) async {}

  /// Adds one or more tags to a specified resource.
  Future<void> tagResource(
      {@required String resourceArn, @required List<Tag> tags}) async {}

  /// Removes one or more tags from a specified resource.
  Future<void> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {}

  /// Updates the name of an inbound or an outbound resolver endpoint.
  Future<void> updateResolverEndpoint(String resolverEndpointId,
      {String name}) async {}

  /// Updates settings for a specified resolver rule. `ResolverRuleId` is
  /// required, and all other parameters are optional. If you don't specify a
  /// parameter, it retains its current value.
  Future<void> updateResolverRule(
      {@required String resolverRuleId,
      @required ResolverRuleConfig config}) async {}
}

class AssociateResolverEndpointIpAddressResponse {}

class AssociateResolverRuleResponse {}

class CreateResolverEndpointResponse {}

class CreateResolverRuleResponse {}

class DeleteResolverEndpointResponse {}

class DeleteResolverRuleResponse {}

class DisassociateResolverEndpointIpAddressResponse {}

class DisassociateResolverRuleResponse {}

class Filter {}

class GetResolverEndpointResponse {}

class GetResolverRuleAssociationResponse {}

class GetResolverRulePolicyResponse {}

class GetResolverRuleResponse {}

class IpAddressRequest {}

class IpAddressResponse {}

class IpAddressUpdate {}

class ListResolverEndpointIpAddressesResponse {}

class ListResolverEndpointsResponse {}

class ListResolverRuleAssociationsResponse {}

class ListResolverRulesResponse {}

class ListTagsForResourceResponse {}

class PutResolverRulePolicyResponse {}

class ResolverEndpoint {}

class ResolverRule {}

class ResolverRuleAssociation {}

class ResolverRuleConfig {}

class Tag {}

class TagResourceResponse {}

class TargetAddress {}

class UntagResourceResponse {}

class UpdateResolverEndpointResponse {}

class UpdateResolverRuleResponse {}
