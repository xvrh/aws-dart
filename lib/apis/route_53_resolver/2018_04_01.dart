import 'package:meta/meta.dart';

/// Here's how you set up to query an Amazon Route 53 private hosted zone from
/// your network:
///
/// 1.  Connect your network to a VPC using AWS Direct Connect or a VPN.
///
/// 2.  Run the following AWS CLI command to create a Resolver endpoint:
///
///      `create-resolver-endpoint --name [endpoint_name] --direction INBOUND
/// --creator-request-id [unique_string] --security-group-ids
/// [security_group_with_inbound_rules] --ip-addresses SubnetId=[subnet_id]
/// SubnetId=[subnet_id_in_different_AZ]`
///
///     Note the resolver endpoint ID that appears in the response. You'll use
/// it in step 3.
///
/// 3.  Get the IP addresses for the Resolver endpoints:
///
///      `get-resolver-endpoint --resolver-endpoint-id [resolver_endpoint_id]`
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
///  `delete-resolver-endpoint --resolver-endpoint-id [resolver_endpoint_id]`
class Route53ResolverApi {
  final _client;
  Route53ResolverApi(client)
      : _client = client.configured('Route53Resolver', serializer: 'json');

  /// Adds IP addresses to an inbound or an outbound resolver endpoint. If you
  /// want to adding more than one IP address, submit one
  /// `AssociateResolverEndpointIpAddress` request for each IP address.
  ///
  /// To remove an IP address from an endpoint, see
  /// DisassociateResolverEndpointIpAddress.
  ///
  /// [resolverEndpointId]: The ID of the resolver endpoint that you want to
  /// associate IP addresses with.
  ///
  /// [ipAddress]: Either the IPv4 address that you want to add to a resolver
  /// endpoint or a subnet ID. If you specify a subnet ID, Resolver chooses an
  /// IP address for you from the available IPs in the specified subnet.
  Future<AssociateResolverEndpointIpAddressResponse>
      associateResolverEndpointIpAddress(
          {@required String resolverEndpointId,
          @required IpAddressUpdate ipAddress}) async {
    var response_ = await _client.send('AssociateResolverEndpointIpAddress', {
      'ResolverEndpointId': resolverEndpointId,
      'IpAddress': ipAddress,
    });
    return AssociateResolverEndpointIpAddressResponse.fromJson(response_);
  }

  /// Associates a resolver rule with a VPC. When you associate a rule with a
  /// VPC, Resolver forwards all DNS queries for the domain name that is
  /// specified in the rule and that originate in the VPC. The queries are
  /// forwarded to the IP addresses for the DNS resolvers that are specified in
  /// the rule. For more information about rules, see CreateResolverRule.
  ///
  /// [resolverRuleId]: The ID of the resolver rule that you want to associate
  /// with the VPC. To list the existing resolver rules, use ListResolverRules.
  ///
  /// [name]: A name for the association that you're creating between a resolver
  /// rule and a VPC.
  ///
  /// [vpcId]: The ID of the VPC that you want to associate the resolver rule
  /// with.
  Future<AssociateResolverRuleResponse> associateResolverRule(
      {@required String resolverRuleId,
      String name,
      @required String vpcId}) async {
    var response_ = await _client.send('AssociateResolverRule', {
      'ResolverRuleId': resolverRuleId,
      if (name != null) 'Name': name,
      'VPCId': vpcId,
    });
    return AssociateResolverRuleResponse.fromJson(response_);
  }

  /// Creates a resolver endpoint. There are two types of resolver endpoints,
  /// inbound and outbound:
  ///
  /// *   An _inbound resolver endpoint_ forwards DNS queries to the DNS service
  /// for a VPC from your network or another VPC.
  ///
  /// *   An _outbound resolver endpoint_ forwards DNS queries from the DNS
  /// service for a VPC to your network or another VPC.
  ///
  /// [creatorRequestId]: A unique string that identifies the request and that
  /// allows failed requests to be retried without the risk of executing the
  /// operation twice. `CreatorRequestId` can be any unique string, for example,
  /// a date/time stamp.
  ///
  /// [name]: A friendly name that lets you easily find a configuration in the
  /// Resolver dashboard in the Route 53 console.
  ///
  /// [securityGroupIds]: The ID of one or more security groups that you want to
  /// use to control access to this VPC. The security group that you specify
  /// must include one or more inbound rules (for inbound resolver endpoints) or
  /// outbound rules (for outbound resolver endpoints).
  ///
  /// [direction]: Specify the applicable value:
  ///
  /// *    `INBOUND`: Resolver forwards DNS queries to the DNS service for a VPC
  /// from your network or another VPC
  ///
  /// *    `OUTBOUND`: Resolver forwards DNS queries from the DNS service for a
  /// VPC to your network or another VPC
  ///
  /// [ipAddresses]: The subnets and IP addresses in your VPC that you want DNS
  /// queries to pass through on the way from your VPCs to your network (for
  /// outbound endpoints) or on the way from your network to your VPCs (for
  /// inbound resolver endpoints).
  ///
  /// [tags]: A list of the tag keys and values that you want to associate with
  /// the endpoint.
  Future<CreateResolverEndpointResponse> createResolverEndpoint(
      {@required String creatorRequestId,
      String name,
      @required List<String> securityGroupIds,
      @required String direction,
      @required List<IpAddressRequest> ipAddresses,
      List<Tag> tags}) async {
    var response_ = await _client.send('CreateResolverEndpoint', {
      'CreatorRequestId': creatorRequestId,
      if (name != null) 'Name': name,
      'SecurityGroupIds': securityGroupIds,
      'Direction': direction,
      'IpAddresses': ipAddresses,
      if (tags != null) 'Tags': tags,
    });
    return CreateResolverEndpointResponse.fromJson(response_);
  }

  /// For DNS queries that originate in your VPCs, specifies which resolver
  /// endpoint the queries pass through, one domain name that you want to
  /// forward to your network, and the IP addresses of the DNS resolvers in your
  /// network.
  ///
  /// [creatorRequestId]: A unique string that identifies the request and that
  /// allows failed requests to be retried without the risk of executing the
  /// operation twice. `CreatorRequestId` can be any unique string, for example,
  /// a date/time stamp.
  ///
  /// [name]: A friendly name that lets you easily find a rule in the Resolver
  /// dashboard in the Route 53 console.
  ///
  /// [ruleType]: Specify `FORWARD`. Other resolver rule types aren't supported.
  ///
  /// [domainName]: DNS queries for this domain name are forwarded to the IP
  /// addresses that you specify in `TargetIps`. If a query matches multiple
  /// resolver rules (example.com and www.example.com), outbound DNS queries are
  /// routed using the resolver rule that contains the most specific domain name
  /// (www.example.com).
  ///
  /// [targetIps]: The IPs that you want Resolver to forward DNS queries to. You
  /// can specify only IPv4 addresses. Separate IP addresses with a comma.
  ///
  /// [resolverEndpointId]: The ID of the outbound resolver endpoint that you
  /// want to use to route DNS queries to the IP addresses that you specify in
  /// `TargetIps`.
  ///
  /// [tags]: A list of the tag keys and values that you want to associate with
  /// the endpoint.
  Future<CreateResolverRuleResponse> createResolverRule(
      {@required String creatorRequestId,
      String name,
      @required String ruleType,
      @required String domainName,
      List<TargetAddress> targetIps,
      String resolverEndpointId,
      List<Tag> tags}) async {
    var response_ = await _client.send('CreateResolverRule', {
      'CreatorRequestId': creatorRequestId,
      if (name != null) 'Name': name,
      'RuleType': ruleType,
      'DomainName': domainName,
      if (targetIps != null) 'TargetIps': targetIps,
      if (resolverEndpointId != null) 'ResolverEndpointId': resolverEndpointId,
      if (tags != null) 'Tags': tags,
    });
    return CreateResolverRuleResponse.fromJson(response_);
  }

  /// Deletes a resolver endpoint. The effect of deleting a resolver endpoint
  /// depends on whether it's an inbound or an outbound resolver endpoint:
  ///
  /// *    **Inbound**: DNS queries from your network or another VPC are no
  /// longer routed to the DNS service for the specified VPC.
  ///
  /// *    **Outbound**: DNS queries from a VPC are no longer routed to your
  /// network or to another VPC.
  ///
  /// [resolverEndpointId]: The ID of the resolver endpoint that you want to
  /// delete.
  Future<DeleteResolverEndpointResponse> deleteResolverEndpoint(
      String resolverEndpointId) async {
    var response_ = await _client.send('DeleteResolverEndpoint', {
      'ResolverEndpointId': resolverEndpointId,
    });
    return DeleteResolverEndpointResponse.fromJson(response_);
  }

  /// Deletes a resolver rule. Before you can delete a resolver rule, you must
  /// disassociate it from all the VPCs that you associated the resolver rule
  /// with. For more infomation, see DisassociateResolverRule.
  ///
  /// [resolverRuleId]: The ID of the resolver rule that you want to delete.
  Future<DeleteResolverRuleResponse> deleteResolverRule(
      String resolverRuleId) async {
    var response_ = await _client.send('DeleteResolverRule', {
      'ResolverRuleId': resolverRuleId,
    });
    return DeleteResolverRuleResponse.fromJson(response_);
  }

  /// Removes IP addresses from an inbound or an outbound resolver endpoint. If
  /// you want to remove more than one IP address, submit one
  /// `DisassociateResolverEndpointIpAddress` request for each IP address.
  ///
  /// To add an IP address to an endpoint, see
  /// AssociateResolverEndpointIpAddress.
  ///
  /// [resolverEndpointId]: The ID of the resolver endpoint that you want to
  /// disassociate an IP address from.
  ///
  /// [ipAddress]: The IPv4 address that you want to remove from a resolver
  /// endpoint.
  Future<DisassociateResolverEndpointIpAddressResponse>
      disassociateResolverEndpointIpAddress(
          {@required String resolverEndpointId,
          @required IpAddressUpdate ipAddress}) async {
    var response_ =
        await _client.send('DisassociateResolverEndpointIpAddress', {
      'ResolverEndpointId': resolverEndpointId,
      'IpAddress': ipAddress,
    });
    return DisassociateResolverEndpointIpAddressResponse.fromJson(response_);
  }

  /// Removes the association between a specified resolver rule and a specified
  /// VPC.
  ///
  ///
  ///
  /// If you disassociate a resolver rule from a VPC, Resolver stops forwarding
  /// DNS queries for the domain name that you specified in the resolver rule.
  ///
  /// [vpcId]: The ID of the VPC that you want to disassociate the resolver rule
  /// from.
  ///
  /// [resolverRuleId]: The ID of the resolver rule that you want to
  /// disassociate from the specified VPC.
  Future<DisassociateResolverRuleResponse> disassociateResolverRule(
      {@required String vpcId, @required String resolverRuleId}) async {
    var response_ = await _client.send('DisassociateResolverRule', {
      'VPCId': vpcId,
      'ResolverRuleId': resolverRuleId,
    });
    return DisassociateResolverRuleResponse.fromJson(response_);
  }

  /// Gets information about a specified resolver endpoint, such as whether it's
  /// an inbound or an outbound resolver endpoint, and the current status of the
  /// endpoint.
  ///
  /// [resolverEndpointId]: The ID of the resolver endpoint that you want to get
  /// information about.
  Future<GetResolverEndpointResponse> getResolverEndpoint(
      String resolverEndpointId) async {
    var response_ = await _client.send('GetResolverEndpoint', {
      'ResolverEndpointId': resolverEndpointId,
    });
    return GetResolverEndpointResponse.fromJson(response_);
  }

  /// Gets information about a specified resolver rule, such as the domain name
  /// that the rule forwards DNS queries for and the ID of the outbound resolver
  /// endpoint that the rule is associated with.
  ///
  /// [resolverRuleId]: The ID of the resolver rule that you want to get
  /// information about.
  Future<GetResolverRuleResponse> getResolverRule(String resolverRuleId) async {
    var response_ = await _client.send('GetResolverRule', {
      'ResolverRuleId': resolverRuleId,
    });
    return GetResolverRuleResponse.fromJson(response_);
  }

  /// Gets information about an association between a specified resolver rule
  /// and a VPC. You associate a resolver rule and a VPC using
  /// AssociateResolverRule.
  ///
  /// [resolverRuleAssociationId]: The ID of the resolver rule association that
  /// you want to get information about.
  Future<GetResolverRuleAssociationResponse> getResolverRuleAssociation(
      String resolverRuleAssociationId) async {
    var response_ = await _client.send('GetResolverRuleAssociation', {
      'ResolverRuleAssociationId': resolverRuleAssociationId,
    });
    return GetResolverRuleAssociationResponse.fromJson(response_);
  }

  /// Gets information about a resolver rule policy. A resolver rule policy
  /// specifies the Resolver operations and resources that you want to allow
  /// another AWS account to be able to use.
  ///
  /// [arn]: The ID of the resolver rule policy that you want to get information
  /// about.
  Future<GetResolverRulePolicyResponse> getResolverRulePolicy(
      String arn) async {
    var response_ = await _client.send('GetResolverRulePolicy', {
      'Arn': arn,
    });
    return GetResolverRulePolicyResponse.fromJson(response_);
  }

  /// Gets the IP addresses for a specified resolver endpoint.
  ///
  /// [resolverEndpointId]: The ID of the resolver endpoint that you want to get
  /// IP addresses for.
  ///
  /// [maxResults]: The maximum number of IP addresses that you want to return
  /// in the response to a `ListResolverEndpointIpAddresses` request. If you
  /// don't specify a value for `MaxResults`, Resolver returns up to 100 IP
  /// addresses.
  ///
  /// [nextToken]: For the first `ListResolverEndpointIpAddresses` request, omit
  /// this value.
  ///
  /// If the specified resolver endpoint has more than `MaxResults` IP
  /// addresses, you can submit another `ListResolverEndpointIpAddresses`
  /// request to get the next group of IP addresses. In the next request,
  /// specify the value of `NextToken` from the previous response.
  Future<ListResolverEndpointIpAddressesResponse>
      listResolverEndpointIpAddresses(String resolverEndpointId,
          {int maxResults, String nextToken}) async {
    var response_ = await _client.send('ListResolverEndpointIpAddresses', {
      'ResolverEndpointId': resolverEndpointId,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListResolverEndpointIpAddressesResponse.fromJson(response_);
  }

  /// Lists all the resolver endpoints that were created using the current AWS
  /// account.
  ///
  /// [maxResults]: The maximum number of resolver endpoints that you want to
  /// return in the response to a `ListResolverEndpoints` request. If you don't
  /// specify a value for `MaxResults`, Resolver returns up to 100 resolver
  /// endpoints.
  ///
  /// [nextToken]: For the first `ListResolverEndpoints` request, omit this
  /// value.
  ///
  /// If you have more than `MaxResults` resolver endpoints, you can submit
  /// another `ListResolverEndpoints` request to get the next group of resolver
  /// endpoints. In the next request, specify the value of `NextToken` from the
  /// previous response.
  ///
  /// [filters]: An optional specification to return a subset of resolver
  /// endpoints, such as all inbound resolver endpoints.
  ///
  ///
  ///
  /// If you submit a second or subsequent `ListResolverEndpoints` request and
  /// specify the `NextToken` parameter, you must use the same values for
  /// `Filters`, if any, as in the previous request.
  Future<ListResolverEndpointsResponse> listResolverEndpoints(
      {int maxResults, String nextToken, List<Filter> filters}) async {
    var response_ = await _client.send('ListResolverEndpoints', {
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (filters != null) 'Filters': filters,
    });
    return ListResolverEndpointsResponse.fromJson(response_);
  }

  /// Lists the associations that were created between resolver rules and VPCs
  /// using the current AWS account.
  ///
  /// [maxResults]: The maximum number of rule associations that you want to
  /// return in the response to a `ListResolverRuleAssociations` request. If you
  /// don't specify a value for `MaxResults`, Resolver returns up to 100 rule
  /// associations.
  ///
  /// [nextToken]: For the first `ListResolverRuleAssociation` request, omit
  /// this value.
  ///
  /// If you have more than `MaxResults` rule associations, you can submit
  /// another `ListResolverRuleAssociation` request to get the next group of
  /// rule associations. In the next request, specify the value of `NextToken`
  /// from the previous response.
  ///
  /// [filters]: An optional specification to return a subset of resolver rules,
  /// such as resolver rules that are associated with the same VPC ID.
  ///
  ///
  ///
  /// If you submit a second or subsequent `ListResolverRuleAssociations`
  /// request and specify the `NextToken` parameter, you must use the same
  /// values for `Filters`, if any, as in the previous request.
  Future<ListResolverRuleAssociationsResponse> listResolverRuleAssociations(
      {int maxResults, String nextToken, List<Filter> filters}) async {
    var response_ = await _client.send('ListResolverRuleAssociations', {
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (filters != null) 'Filters': filters,
    });
    return ListResolverRuleAssociationsResponse.fromJson(response_);
  }

  /// Lists the resolver rules that were created using the current AWS account.
  ///
  /// [maxResults]: The maximum number of resolver rules that you want to return
  /// in the response to a `ListResolverRules` request. If you don't specify a
  /// value for `MaxResults`, Resolver returns up to 100 resolver rules.
  ///
  /// [nextToken]: For the first `ListResolverRules` request, omit this value.
  ///
  /// If you have more than `MaxResults` resolver rules, you can submit another
  /// `ListResolverRules` request to get the next group of resolver rules. In
  /// the next request, specify the value of `NextToken` from the previous
  /// response.
  ///
  /// [filters]: An optional specification to return a subset of resolver rules,
  /// such as all resolver rules that are associated with the same resolver
  /// endpoint.
  ///
  ///
  ///
  /// If you submit a second or subsequent `ListResolverRules` request and
  /// specify the `NextToken` parameter, you must use the same values for
  /// `Filters`, if any, as in the previous request.
  Future<ListResolverRulesResponse> listResolverRules(
      {int maxResults, String nextToken, List<Filter> filters}) async {
    var response_ = await _client.send('ListResolverRules', {
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (filters != null) 'Filters': filters,
    });
    return ListResolverRulesResponse.fromJson(response_);
  }

  /// Lists the tags that you associated with the specified resource.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) for the resource that you
  /// want to list tags for.
  ///
  /// [maxResults]: The maximum number of tags that you want to return in the
  /// response to a `ListTagsForResource` request. If you don't specify a value
  /// for `MaxResults`, Resolver returns up to 100 tags.
  ///
  /// [nextToken]: For the first `ListTagsForResource` request, omit this value.
  ///
  /// If you have more than `MaxResults` tags, you can submit another
  /// `ListTagsForResource` request to get the next group of tags for the
  /// resource. In the next request, specify the value of `NextToken` from the
  /// previous response.
  Future<ListTagsForResourceResponse> listTagsForResource(String resourceArn,
      {int maxResults, String nextToken}) async {
    var response_ = await _client.send('ListTagsForResource', {
      'ResourceArn': resourceArn,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListTagsForResourceResponse.fromJson(response_);
  }

  /// Specifies the Resolver operations and resources that you want to allow
  /// another AWS account to be able to use.
  ///
  /// [arn]: The Amazon Resource Name (ARN) of the account that you want to
  /// grant permissions to.
  ///
  /// [resolverRulePolicy]: An AWS Identity and Access Management policy
  /// statement that lists the permissions that you want to grant to another AWS
  /// account.
  Future<PutResolverRulePolicyResponse> putResolverRulePolicy(
      {@required String arn, @required String resolverRulePolicy}) async {
    var response_ = await _client.send('PutResolverRulePolicy', {
      'Arn': arn,
      'ResolverRulePolicy': resolverRulePolicy,
    });
    return PutResolverRulePolicyResponse.fromJson(response_);
  }

  /// Adds one or more tags to a specified resource.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) for the resource that you
  /// want to add tags to. To get the ARN for a resource, use the applicable
  /// `Get` or `List` command:
  ///
  /// *    GetResolverEndpoint
  ///
  /// *    GetResolverRule
  ///
  /// *    GetResolverRuleAssociation
  ///
  /// *    ListResolverEndpoints
  ///
  /// *    ListResolverRuleAssociations
  ///
  /// *    ListResolverRules
  ///
  /// [tags]: The tags that you want to add to the specified resource.
  Future<TagResourceResponse> tagResource(
      {@required String resourceArn, @required List<Tag> tags}) async {
    var response_ = await _client.send('TagResource', {
      'ResourceArn': resourceArn,
      'Tags': tags,
    });
    return TagResourceResponse.fromJson(response_);
  }

  /// Removes one or more tags from a specified resource.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) for the resource that you
  /// want to remove tags from. To get the ARN for a resource, use the
  /// applicable `Get` or `List` command:
  ///
  /// *    GetResolverEndpoint
  ///
  /// *    GetResolverRule
  ///
  /// *    GetResolverRuleAssociation
  ///
  /// *    ListResolverEndpoints
  ///
  /// *    ListResolverRuleAssociations
  ///
  /// *    ListResolverRules
  ///
  /// [tagKeys]: The tags that you want to remove to the specified resource.
  Future<UntagResourceResponse> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {
    var response_ = await _client.send('UntagResource', {
      'ResourceArn': resourceArn,
      'TagKeys': tagKeys,
    });
    return UntagResourceResponse.fromJson(response_);
  }

  /// Updates the name of an inbound or an outbound resolver endpoint.
  ///
  /// [resolverEndpointId]: The ID of the resolver endpoint that you want to
  /// update.
  ///
  /// [name]: The name of the resolver endpoint that you want to update.
  Future<UpdateResolverEndpointResponse> updateResolverEndpoint(
      String resolverEndpointId,
      {String name}) async {
    var response_ = await _client.send('UpdateResolverEndpoint', {
      'ResolverEndpointId': resolverEndpointId,
      if (name != null) 'Name': name,
    });
    return UpdateResolverEndpointResponse.fromJson(response_);
  }

  /// Updates settings for a specified resolver rule. `ResolverRuleId` is
  /// required, and all other parameters are optional. If you don't specify a
  /// parameter, it retains its current value.
  ///
  /// [resolverRuleId]: The ID of the resolver rule that you want to update.
  ///
  /// [config]: The new settings for the resolver rule.
  Future<UpdateResolverRuleResponse> updateResolverRule(
      {@required String resolverRuleId,
      @required ResolverRuleConfig config}) async {
    var response_ = await _client.send('UpdateResolverRule', {
      'ResolverRuleId': resolverRuleId,
      'Config': config,
    });
    return UpdateResolverRuleResponse.fromJson(response_);
  }
}

class AssociateResolverEndpointIpAddressResponse {
  /// The response to an `AssociateResolverEndpointIpAddress` request.
  final ResolverEndpoint resolverEndpoint;

  AssociateResolverEndpointIpAddressResponse({
    this.resolverEndpoint,
  });
  static AssociateResolverEndpointIpAddressResponse fromJson(
          Map<String, dynamic> json) =>
      AssociateResolverEndpointIpAddressResponse(
        resolverEndpoint: json.containsKey('ResolverEndpoint')
            ? ResolverEndpoint.fromJson(json['ResolverEndpoint'])
            : null,
      );
}

class AssociateResolverRuleResponse {
  /// Information about the `AssociateResolverRule` request, including the
  /// status of the request.
  final ResolverRuleAssociation resolverRuleAssociation;

  AssociateResolverRuleResponse({
    this.resolverRuleAssociation,
  });
  static AssociateResolverRuleResponse fromJson(Map<String, dynamic> json) =>
      AssociateResolverRuleResponse(
        resolverRuleAssociation: json.containsKey('ResolverRuleAssociation')
            ? ResolverRuleAssociation.fromJson(json['ResolverRuleAssociation'])
            : null,
      );
}

class CreateResolverEndpointResponse {
  /// Information about the `CreateResolverEndpoint` request, including the
  /// status of the request.
  final ResolverEndpoint resolverEndpoint;

  CreateResolverEndpointResponse({
    this.resolverEndpoint,
  });
  static CreateResolverEndpointResponse fromJson(Map<String, dynamic> json) =>
      CreateResolverEndpointResponse(
        resolverEndpoint: json.containsKey('ResolverEndpoint')
            ? ResolverEndpoint.fromJson(json['ResolverEndpoint'])
            : null,
      );
}

class CreateResolverRuleResponse {
  /// Information about the `CreateResolverRule` request, including the status
  /// of the request.
  final ResolverRule resolverRule;

  CreateResolverRuleResponse({
    this.resolverRule,
  });
  static CreateResolverRuleResponse fromJson(Map<String, dynamic> json) =>
      CreateResolverRuleResponse(
        resolverRule: json.containsKey('ResolverRule')
            ? ResolverRule.fromJson(json['ResolverRule'])
            : null,
      );
}

class DeleteResolverEndpointResponse {
  /// Information about the `DeleteResolverEndpoint` request, including the
  /// status of the request.
  final ResolverEndpoint resolverEndpoint;

  DeleteResolverEndpointResponse({
    this.resolverEndpoint,
  });
  static DeleteResolverEndpointResponse fromJson(Map<String, dynamic> json) =>
      DeleteResolverEndpointResponse(
        resolverEndpoint: json.containsKey('ResolverEndpoint')
            ? ResolverEndpoint.fromJson(json['ResolverEndpoint'])
            : null,
      );
}

class DeleteResolverRuleResponse {
  /// Information about the `DeleteResolverRule` request, including the status
  /// of the request.
  final ResolverRule resolverRule;

  DeleteResolverRuleResponse({
    this.resolverRule,
  });
  static DeleteResolverRuleResponse fromJson(Map<String, dynamic> json) =>
      DeleteResolverRuleResponse(
        resolverRule: json.containsKey('ResolverRule')
            ? ResolverRule.fromJson(json['ResolverRule'])
            : null,
      );
}

class DisassociateResolverEndpointIpAddressResponse {
  /// The response to an `DisassociateResolverEndpointIpAddress` request.
  final ResolverEndpoint resolverEndpoint;

  DisassociateResolverEndpointIpAddressResponse({
    this.resolverEndpoint,
  });
  static DisassociateResolverEndpointIpAddressResponse fromJson(
          Map<String, dynamic> json) =>
      DisassociateResolverEndpointIpAddressResponse(
        resolverEndpoint: json.containsKey('ResolverEndpoint')
            ? ResolverEndpoint.fromJson(json['ResolverEndpoint'])
            : null,
      );
}

class DisassociateResolverRuleResponse {
  /// Information about the `DisassociateResolverRule` request, including the
  /// status of the request.
  final ResolverRuleAssociation resolverRuleAssociation;

  DisassociateResolverRuleResponse({
    this.resolverRuleAssociation,
  });
  static DisassociateResolverRuleResponse fromJson(Map<String, dynamic> json) =>
      DisassociateResolverRuleResponse(
        resolverRuleAssociation: json.containsKey('ResolverRuleAssociation')
            ? ResolverRuleAssociation.fromJson(json['ResolverRuleAssociation'])
            : null,
      );
}

/// For `List` operations, an optional specification to return a subset of
/// objects, such as resolver endpoints or resolver rules.
class Filter {
  /// When you're using a `List` operation and you want the operation to return
  /// a subset of objects, such as resolver endpoints or resolver rules, the
  /// name of the parameter that you want to use to filter objects. For example,
  /// to list only inbound resolver endpoints, specify `Direction` for the value
  /// of `Name`.
  final String name;

  /// When you're using a `List` operation and you want the operation to return
  /// a subset of objects, such as resolver endpoints or resolver rules, the
  /// value of the parameter that you want to use to filter objects. For
  /// example, to list only inbound resolver endpoints, specify `INBOUND` for
  /// the value of `Values`.
  final List<String> values;

  Filter({
    this.name,
    this.values,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class GetResolverEndpointResponse {
  /// Information about the resolver endpoint that you specified in a
  /// `GetResolverEndpoint` request.
  final ResolverEndpoint resolverEndpoint;

  GetResolverEndpointResponse({
    this.resolverEndpoint,
  });
  static GetResolverEndpointResponse fromJson(Map<String, dynamic> json) =>
      GetResolverEndpointResponse(
        resolverEndpoint: json.containsKey('ResolverEndpoint')
            ? ResolverEndpoint.fromJson(json['ResolverEndpoint'])
            : null,
      );
}

class GetResolverRuleAssociationResponse {
  /// Information about the resolver rule association that you specified in a
  /// `GetResolverRuleAssociation` request.
  final ResolverRuleAssociation resolverRuleAssociation;

  GetResolverRuleAssociationResponse({
    this.resolverRuleAssociation,
  });
  static GetResolverRuleAssociationResponse fromJson(
          Map<String, dynamic> json) =>
      GetResolverRuleAssociationResponse(
        resolverRuleAssociation: json.containsKey('ResolverRuleAssociation')
            ? ResolverRuleAssociation.fromJson(json['ResolverRuleAssociation'])
            : null,
      );
}

class GetResolverRulePolicyResponse {
  /// Information about the resolver rule policy that you specified in a
  /// `GetResolverRulePolicy` request.
  final String resolverRulePolicy;

  GetResolverRulePolicyResponse({
    this.resolverRulePolicy,
  });
  static GetResolverRulePolicyResponse fromJson(Map<String, dynamic> json) =>
      GetResolverRulePolicyResponse(
        resolverRulePolicy: json.containsKey('ResolverRulePolicy')
            ? json['ResolverRulePolicy'] as String
            : null,
      );
}

class GetResolverRuleResponse {
  /// Information about the resolver rule that you specified in a
  /// `GetResolverRule` request.
  final ResolverRule resolverRule;

  GetResolverRuleResponse({
    this.resolverRule,
  });
  static GetResolverRuleResponse fromJson(Map<String, dynamic> json) =>
      GetResolverRuleResponse(
        resolverRule: json.containsKey('ResolverRule')
            ? ResolverRule.fromJson(json['ResolverRule'])
            : null,
      );
}

/// In an CreateResolverEndpoint request, a subnet and IP address that you want
/// to use for DNS queries.
class IpAddressRequest {
  /// The subnet that contains the IP address.
  final String subnetId;

  /// The IP address that you want to use for DNS queries.
  final String ip;

  IpAddressRequest({
    @required this.subnetId,
    this.ip,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// In the response to a GetResolverEndpoint request, information about the IP
/// addresses that the resolver endpoint uses for DNS queries.
class IpAddressResponse {
  /// The ID of one IP address.
  final String ipId;

  /// The ID of one subnet.
  final String subnetId;

  /// One IP address that the resolver endpoint uses for DNS queries.
  final String ip;

  /// A status code that gives the current status of the request.
  final String status;

  /// A message that provides additional information about the status of the
  /// request.
  final String statusMessage;

  /// The date and time that the IP address was created, in Unix time format and
  /// Coordinated Universal Time (UTC).
  final String creationTime;

  /// The date and time that the IP address was last modified, in Unix time
  /// format and Coordinated Universal Time (UTC).
  final String modificationTime;

  IpAddressResponse({
    this.ipId,
    this.subnetId,
    this.ip,
    this.status,
    this.statusMessage,
    this.creationTime,
    this.modificationTime,
  });
  static IpAddressResponse fromJson(Map<String, dynamic> json) =>
      IpAddressResponse(
        ipId: json.containsKey('IpId') ? json['IpId'] as String : null,
        subnetId:
            json.containsKey('SubnetId') ? json['SubnetId'] as String : null,
        ip: json.containsKey('Ip') ? json['Ip'] as String : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        statusMessage: json.containsKey('StatusMessage')
            ? json['StatusMessage'] as String
            : null,
        creationTime: json.containsKey('CreationTime')
            ? json['CreationTime'] as String
            : null,
        modificationTime: json.containsKey('ModificationTime')
            ? json['ModificationTime'] as String
            : null,
      );
}

/// In an UpdateResolverEndpoint request, information about an IP address to
/// update.
class IpAddressUpdate {
  ///  _Only when removing an IP address from a resolver endpoint_: The ID of
  /// the IP address that you want to remove. To get this ID, use
  /// GetResolverEndpoint.
  final String ipId;

  /// The ID of the subnet that includes the IP address that you want to update.
  /// To get this ID, use GetResolverEndpoint.
  final String subnetId;

  /// The new IP address.
  final String ip;

  IpAddressUpdate({
    this.ipId,
    this.subnetId,
    this.ip,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class ListResolverEndpointIpAddressesResponse {
  /// If the specified endpoint has more than `MaxResults` IP addresses, you can
  /// submit another `ListResolverEndpointIpAddresses` request to get the next
  /// group of IP addresses. In the next request, specify the value of
  /// `NextToken` from the previous response.
  final String nextToken;

  /// The value that you specified for `MaxResults` in the request.
  final int maxResults;

  /// The IP addresses that DNS queries pass through on their way to your
  /// network (outbound endpoint) or on the way to Resolver (inbound endpoint).
  final List<IpAddressResponse> ipAddresses;

  ListResolverEndpointIpAddressesResponse({
    this.nextToken,
    this.maxResults,
    this.ipAddresses,
  });
  static ListResolverEndpointIpAddressesResponse fromJson(
          Map<String, dynamic> json) =>
      ListResolverEndpointIpAddressesResponse(
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
        maxResults:
            json.containsKey('MaxResults') ? json['MaxResults'] as int : null,
        ipAddresses: json.containsKey('IpAddresses')
            ? (json['IpAddresses'] as List)
                .map((e) => IpAddressResponse.fromJson(e))
                .toList()
            : null,
      );
}

class ListResolverEndpointsResponse {
  /// If more than `MaxResults` IP addresses match the specified criteria, you
  /// can submit another `ListResolverEndpoint` request to get the next group of
  /// results. In the next request, specify the value of `NextToken` from the
  /// previous response.
  final String nextToken;

  /// The value that you specified for `MaxResults` in the request.
  final int maxResults;

  /// The resolver endpoints that were created by using the current AWS account,
  /// and that match the specified filters, if any.
  final List<ResolverEndpoint> resolverEndpoints;

  ListResolverEndpointsResponse({
    this.nextToken,
    this.maxResults,
    this.resolverEndpoints,
  });
  static ListResolverEndpointsResponse fromJson(Map<String, dynamic> json) =>
      ListResolverEndpointsResponse(
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
        maxResults:
            json.containsKey('MaxResults') ? json['MaxResults'] as int : null,
        resolverEndpoints: json.containsKey('ResolverEndpoints')
            ? (json['ResolverEndpoints'] as List)
                .map((e) => ResolverEndpoint.fromJson(e))
                .toList()
            : null,
      );
}

class ListResolverRuleAssociationsResponse {
  /// If more than `MaxResults` rule associations match the specified criteria,
  /// you can submit another `ListResolverRuleAssociation` request to get the
  /// next group of results. In the next request, specify the value of
  /// `NextToken` from the previous response.
  final String nextToken;

  /// The value that you specified for `MaxResults` in the request.
  final int maxResults;

  /// The associations that were created between resolver rules and VPCs using
  /// the current AWS account, and that match the specified filters, if any.
  final List<ResolverRuleAssociation> resolverRuleAssociations;

  ListResolverRuleAssociationsResponse({
    this.nextToken,
    this.maxResults,
    this.resolverRuleAssociations,
  });
  static ListResolverRuleAssociationsResponse fromJson(
          Map<String, dynamic> json) =>
      ListResolverRuleAssociationsResponse(
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
        maxResults:
            json.containsKey('MaxResults') ? json['MaxResults'] as int : null,
        resolverRuleAssociations: json.containsKey('ResolverRuleAssociations')
            ? (json['ResolverRuleAssociations'] as List)
                .map((e) => ResolverRuleAssociation.fromJson(e))
                .toList()
            : null,
      );
}

class ListResolverRulesResponse {
  /// If more than `MaxResults` resolver rules match the specified criteria, you
  /// can submit another `ListResolverRules` request to get the next group of
  /// results. In the next request, specify the value of `NextToken` from the
  /// previous response.
  final String nextToken;

  /// The value that you specified for `MaxResults` in the request.
  final int maxResults;

  /// The resolver rules that were created using the current AWS account and
  /// that match the specified filters, if any.
  final List<ResolverRule> resolverRules;

  ListResolverRulesResponse({
    this.nextToken,
    this.maxResults,
    this.resolverRules,
  });
  static ListResolverRulesResponse fromJson(Map<String, dynamic> json) =>
      ListResolverRulesResponse(
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
        maxResults:
            json.containsKey('MaxResults') ? json['MaxResults'] as int : null,
        resolverRules: json.containsKey('ResolverRules')
            ? (json['ResolverRules'] as List)
                .map((e) => ResolverRule.fromJson(e))
                .toList()
            : null,
      );
}

class ListTagsForResourceResponse {
  /// The tags that are associated with the resource that you specified in the
  /// `ListTagsForResource` request.
  final List<Tag> tags;

  /// If more than `MaxResults` tags match the specified criteria, you can
  /// submit another `ListTagsForResource` request to get the next group of
  /// results. In the next request, specify the value of `NextToken` from the
  /// previous response.
  final String nextToken;

  ListTagsForResourceResponse({
    this.tags,
    this.nextToken,
  });
  static ListTagsForResourceResponse fromJson(Map<String, dynamic> json) =>
      ListTagsForResourceResponse(
        tags: json.containsKey('Tags')
            ? (json['Tags'] as List).map((e) => Tag.fromJson(e)).toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// The response to a `PutResolverRulePolicy` request.
class PutResolverRulePolicyResponse {
  /// Whether the `PutResolverRulePolicy` request was successful.
  final bool returnValue;

  PutResolverRulePolicyResponse({
    this.returnValue,
  });
  static PutResolverRulePolicyResponse fromJson(Map<String, dynamic> json) =>
      PutResolverRulePolicyResponse(
        returnValue: json.containsKey('ReturnValue')
            ? json['ReturnValue'] as bool
            : null,
      );
}

/// In the response to a CreateResolverEndpoint, DeleteResolverEndpoint,
/// GetResolverEndpoint, ListResolverEndpoints, or UpdateResolverEndpoint
/// request, a complex type that contains settings for an existing inbound or
/// outbound resolver endpoint.
class ResolverEndpoint {
  /// The ID of the resolver endpoint.
  final String id;

  /// A unique string that identifies the request that created the resolver
  /// endpoint. The `CreatorRequestId` allows failed requests to be retried
  /// without the risk of executing the operation twice.
  final String creatorRequestId;

  /// The ARN (Amazon Resource Name) for the resolver endpoint.
  final String arn;

  /// The name that you assigned to the resolver endpoint when you submitted a
  /// CreateResolverEndpoint request.
  final String name;

  /// The ID of one or more security groups that control access to this VPC. The
  /// security group must include one or more inbound resolver rules.
  final List<String> securityGroupIds;

  /// Indicates whether the resolver endpoint allows inbound or outbound DNS
  /// queries:
  ///
  /// *    `INBOUND`: allows DNS queries to your VPC from your network or
  /// another VPC
  ///
  /// *    `OUTBOUND`: allows DNS queries from your VPC to your network or
  /// another VPC
  final String direction;

  /// The number of IP addresses that the resolver endpoint can use for DNS
  /// queries.
  final int ipAddressCount;

  /// The ID of the VPC that you want to create the resolver endpoint in.
  final String hostVpcId;

  /// A code that specifies the current status of the resolver endpoint.
  final String status;

  /// A detailed description of the status of the resolver endpoint.
  final String statusMessage;

  /// The date and time that the endpoint was created, in Unix time format and
  /// Coordinated Universal Time (UTC).
  final String creationTime;

  /// The date and time that the endpoint was last modified, in Unix time format
  /// and Coordinated Universal Time (UTC).
  final String modificationTime;

  ResolverEndpoint({
    this.id,
    this.creatorRequestId,
    this.arn,
    this.name,
    this.securityGroupIds,
    this.direction,
    this.ipAddressCount,
    this.hostVpcId,
    this.status,
    this.statusMessage,
    this.creationTime,
    this.modificationTime,
  });
  static ResolverEndpoint fromJson(Map<String, dynamic> json) =>
      ResolverEndpoint(
        id: json.containsKey('Id') ? json['Id'] as String : null,
        creatorRequestId: json.containsKey('CreatorRequestId')
            ? json['CreatorRequestId'] as String
            : null,
        arn: json.containsKey('Arn') ? json['Arn'] as String : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        securityGroupIds: json.containsKey('SecurityGroupIds')
            ? (json['SecurityGroupIds'] as List)
                .map((e) => e as String)
                .toList()
            : null,
        direction:
            json.containsKey('Direction') ? json['Direction'] as String : null,
        ipAddressCount: json.containsKey('IpAddressCount')
            ? json['IpAddressCount'] as int
            : null,
        hostVpcId:
            json.containsKey('HostVPCId') ? json['HostVPCId'] as String : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        statusMessage: json.containsKey('StatusMessage')
            ? json['StatusMessage'] as String
            : null,
        creationTime: json.containsKey('CreationTime')
            ? json['CreationTime'] as String
            : null,
        modificationTime: json.containsKey('ModificationTime')
            ? json['ModificationTime'] as String
            : null,
      );
}

/// For queries that originate in your VPC, detailed information about a
/// resolver rule, which specifies how to route DNS queries out of the VPC. The
/// `ResolverRule` parameter appears in the response to a CreateResolverRule,
/// DeleteResolverRule, GetResolverRule, ListResolverRules, or
/// UpdateResolverRule request.
class ResolverRule {
  /// The ID that Resolver assigned to the resolver rule when you created it.
  final String id;

  /// A unique string that you specified when you created the resolver rule.
  /// `CreatorRequestId`identifies the request and allows failed requests to be
  /// retried without the risk of executing the operation twice.
  final String creatorRequestId;

  /// The ARN (Amazon Resource Name) for the resolver rule specified by `Id`.
  final String arn;

  /// DNS queries for this domain name are forwarded to the IP addresses that
  /// are specified in `TargetIps`. If a query matches multiple resolver rules
  /// (example.com and www.example.com), the query is routed using the resolver
  /// rule that contains the most specific domain name (www.example.com).
  final String domainName;

  /// A code that specifies the current status of the resolver rule.
  final String status;

  /// A detailed description of the status of a resolver rule.
  final String statusMessage;

  /// This value is always `FORWARD`. Other resolver rule types aren't
  /// supported.
  final String ruleType;

  /// The name for the resolver rule, which you specified when you created the
  /// resolver rule.
  final String name;

  /// An array that contains the IP addresses and ports that you want to forward
  final List<TargetAddress> targetIps;

  /// The ID of the endpoint that the rule is associated with.
  final String resolverEndpointId;

  /// When a rule is shared with another AWS account, the account ID of the
  /// account that the rule is shared with.
  final String ownerId;

  /// Whether the rules is shared and, if so, whether the current account is
  /// sharing the rule with another account, or another account is sharing the
  /// rule with the current account.
  final String shareStatus;

  ResolverRule({
    this.id,
    this.creatorRequestId,
    this.arn,
    this.domainName,
    this.status,
    this.statusMessage,
    this.ruleType,
    this.name,
    this.targetIps,
    this.resolverEndpointId,
    this.ownerId,
    this.shareStatus,
  });
  static ResolverRule fromJson(Map<String, dynamic> json) => ResolverRule(
        id: json.containsKey('Id') ? json['Id'] as String : null,
        creatorRequestId: json.containsKey('CreatorRequestId')
            ? json['CreatorRequestId'] as String
            : null,
        arn: json.containsKey('Arn') ? json['Arn'] as String : null,
        domainName: json.containsKey('DomainName')
            ? json['DomainName'] as String
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        statusMessage: json.containsKey('StatusMessage')
            ? json['StatusMessage'] as String
            : null,
        ruleType:
            json.containsKey('RuleType') ? json['RuleType'] as String : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        targetIps: json.containsKey('TargetIps')
            ? (json['TargetIps'] as List)
                .map((e) => TargetAddress.fromJson(e))
                .toList()
            : null,
        resolverEndpointId: json.containsKey('ResolverEndpointId')
            ? json['ResolverEndpointId'] as String
            : null,
        ownerId: json.containsKey('OwnerId') ? json['OwnerId'] as String : null,
        shareStatus: json.containsKey('ShareStatus')
            ? json['ShareStatus'] as String
            : null,
      );
}

/// In the response to an AssociateResolverRule, DisassociateResolverRule, or
/// ListResolverRuleAssociations request, information about an association
/// between a resolver rule and a VPC.
class ResolverRuleAssociation {
  /// The ID of the association between a resolver rule and a VPC. Resolver
  /// assigns this value when you submit an AssociateResolverRule request.
  final String id;

  /// The ID of the resolver rule that you associated with the VPC that is
  /// specified by `VPCId`.
  final String resolverRuleId;

  /// The name of an association between a resolver rule and a VPC.
  final String name;

  /// The ID of the VPC that you associated the resolver rule with.
  final String vpcId;

  /// A code that specifies the current status of the association between a
  /// resolver rule and a VPC.
  final String status;

  /// A detailed description of the status of the association between a resolver
  /// rule and a VPC.
  final String statusMessage;

  ResolverRuleAssociation({
    this.id,
    this.resolverRuleId,
    this.name,
    this.vpcId,
    this.status,
    this.statusMessage,
  });
  static ResolverRuleAssociation fromJson(Map<String, dynamic> json) =>
      ResolverRuleAssociation(
        id: json.containsKey('Id') ? json['Id'] as String : null,
        resolverRuleId: json.containsKey('ResolverRuleId')
            ? json['ResolverRuleId'] as String
            : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        vpcId: json.containsKey('VPCId') ? json['VPCId'] as String : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        statusMessage: json.containsKey('StatusMessage')
            ? json['StatusMessage'] as String
            : null,
      );
}

/// In an UpdateResolverRule request, information about the changes that you
/// want to make.
class ResolverRuleConfig {
  /// The new name for the resolver rule. The name that you specify appears in
  /// the Resolver dashboard in the Route 53 console.
  final String name;

  /// For DNS queries that originate in your VPC, the new IP addresses that you
  /// want to route outbound DNS queries to.
  final List<TargetAddress> targetIps;

  /// The ID of the new outbound resolver endpoint that you want to use to route
  /// DNS queries to the IP addresses that you specify in `TargetIps`.
  final String resolverEndpointId;

  ResolverRuleConfig({
    this.name,
    this.targetIps,
    this.resolverEndpointId,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// One tag that you want to add to the specified resource. A tag consists of a
/// `Key` (a name for the tag) and a `Value`.
class Tag {
  /// The name for the tag. For example, if you want to associate Resolver
  /// resources with the account IDs of your customers for billing purposes, the
  /// value of `Key` might be `account-id`.
  final String key;

  /// The value for the tag. For example, if `Key` is `account-id`, then `Value`
  /// might be the ID of the customer account that you're creating the resource
  /// for.
  final String value;

  Tag({
    this.key,
    this.value,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag(
        key: json.containsKey('Key') ? json['Key'] as String : null,
        value: json.containsKey('Value') ? json['Value'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class TagResourceResponse {
  TagResourceResponse();
  static TagResourceResponse fromJson(Map<String, dynamic> json) =>
      TagResourceResponse();
}

/// In a CreateResolverRule request, an array of the IPs that you want to
/// forward DNS queries to.
class TargetAddress {
  /// One IP address that you want to forward DNS queries to. You can specify
  /// only IPv4 addresses.
  final String ip;

  /// The port at `Ip` that you want to forward DNS queries to.
  final int port;

  TargetAddress({
    @required this.ip,
    this.port,
  });
  static TargetAddress fromJson(Map<String, dynamic> json) => TargetAddress(
        ip: json['Ip'] as String,
        port: json.containsKey('Port') ? json['Port'] as int : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class UntagResourceResponse {
  UntagResourceResponse();
  static UntagResourceResponse fromJson(Map<String, dynamic> json) =>
      UntagResourceResponse();
}

class UpdateResolverEndpointResponse {
  /// The response to an `UpdateResolverEndpoint` request.
  final ResolverEndpoint resolverEndpoint;

  UpdateResolverEndpointResponse({
    this.resolverEndpoint,
  });
  static UpdateResolverEndpointResponse fromJson(Map<String, dynamic> json) =>
      UpdateResolverEndpointResponse(
        resolverEndpoint: json.containsKey('ResolverEndpoint')
            ? ResolverEndpoint.fromJson(json['ResolverEndpoint'])
            : null,
      );
}

class UpdateResolverRuleResponse {
  /// The response to an `UpdateResolverRule` request.
  final ResolverRule resolverRule;

  UpdateResolverRuleResponse({
    this.resolverRule,
  });
  static UpdateResolverRuleResponse fromJson(Map<String, dynamic> json) =>
      UpdateResolverRuleResponse(
        resolverRule: json.containsKey('ResolverRule')
            ? ResolverRule.fromJson(json['ResolverRule'])
            : null,
      );
}
