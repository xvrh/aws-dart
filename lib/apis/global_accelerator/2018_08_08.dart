import 'package:meta/meta.dart';

/// AWS Global Accelerator
///
/// This is the _AWS Global Accelerator API Reference_. This guide is for
/// developers who need detailed information about AWS Global Accelerator API
/// actions, data types, and errors. For more information about Global
/// Accelerator features, see the
/// [AWS Global Accelerator Developer Guide](https://docs.aws.amazon.com/global-accelerator/latest/dg/Welcome.html).
///
/// AWS Global Accelerator is a network layer service in which you create
/// accelerators to improve availability and performance for internet
/// applications used by a global audience.
///
///  You must specify the US-West-2 (Oregon) Region to create or update
/// accelerators.
///
/// Global Accelerator provides you with static IP addresses that you associate
/// with your accelerator. These IP addresses are anycast from the AWS edge
/// network and distribute incoming application traffic across multiple endpoint
/// resources in multiple AWS Regions, which increases the availability of your
/// applications. Endpoints can be Elastic IP addresses, Network Load Balancers,
/// and Application Load Balancers that are located in one AWS Region or
/// multiple Regions.
///
/// Global Accelerator uses the AWS global network to route traffic to the
/// optimal regional endpoint based on health, client location, and policies
/// that you configure. The service reacts instantly to changes in health or
/// configuration to ensure that internet traffic from clients is directed to
/// only healthy endpoints.
///
/// Global Accelerator includes components that work together to help you
/// improve performance and availability for your applications:
///
/// Static IP address
///
/// AWS Global Accelerator provides you with a set of static IP addresses which
/// are anycast from the AWS edge network and serve as the single fixed entry
/// points for your clients. If you already have Elastic Load Balancing or
/// Elastic IP address resources set up for your applications, you can easily
/// add those to Global Accelerator to allow the resources to be accessed by a
/// Global Accelerator static IP address.
///
/// Accelerator
///
/// An accelerator directs traffic to optimal endpoints over the AWS global
/// network to improve availability and performance for your internet
/// applications that have a global audience. Each accelerator includes one or
/// more listeners.
///
/// Network zone
///
/// A network zone services the static IP addresses for your accelerator from a
/// unique IP subnet. Similar to an AWS Availability Zone, a network zone is an
/// isolated unit with its own set of physical infrastructure. When you
/// configure an accelerator, Global Accelerator allocates two IPv4 addresses
/// for it. If one IP address from a network zone becomes unavailable due to IP
/// address blocking by certain client networks, or network disruptions, then
/// client applications can retry on the healthy static IP address from the
/// other isolated network zone.
///
/// Listener
///
/// A listener processes inbound connections from clients to Global Accelerator,
/// based on the protocol and port that you configure. Each listener has one or
/// more endpoint groups associated with it, and traffic is forwarded to
/// endpoints in one of the groups. You associate endpoint groups with listeners
/// by specifying the Regions that you want to distribute traffic to. Traffic is
/// distributed to optimal endpoints within the endpoint groups associated with
/// a listener.
///
/// Endpoint group
///
/// Each endpoint group is associated with a specific AWS Region. Endpoint
/// groups include one or more endpoints in the Region. You can increase or
/// reduce the percentage of traffic that would be otherwise directed to an
/// endpoint group by adjusting a setting called a _traffic dial_. The traffic
/// dial lets you easily do performance testing or blue/green deployment testing
/// for new releases across different AWS Regions, for example.
///
/// Endpoint
///
/// An endpoint is an Elastic IP address, Network Load Balancer, or Application
/// Load Balancer. Traffic is routed to endpoints based on several factors,
/// including the geo-proximity to the user, the health of the endpoint, and the
/// configuration options that you choose, such as endpoint weights. For each
/// endpoint, you can configure weights, which are numbers that you can use to
/// specify the proportion of traffic to route to each one. This can be useful,
/// for example, to do performance testing within a Region.
class GlobalAcceleratorApi {
  /// Create an accelerator. An accelerator includes one or more listeners that
  /// process inbound connections and direct traffic to one or more endpoint
  /// groups, each of which includes endpoints, such as Network Load Balancers.
  /// To see an AWS CLI example of creating an accelerator, scroll down to
  /// **Example**.
  ///
  ///
  ///
  /// You must specify the US-West-2 (Oregon) Region to create or update
  /// accelerators.
  ///
  /// [name]: The name of an accelerator. The name can have a maximum of 32
  /// characters, must contain only alphanumeric characters or hyphens (-), and
  /// must not begin or end with a hyphen.
  ///
  /// [ipAddressType]: The value for the address type must be IPv4.
  ///
  /// [enabled]: Indicates whether an accelerator is enabled. The value is true
  /// or false. The default value is true.
  ///
  /// If the value is set to true, an accelerator cannot be deleted. If set to
  /// false, the accelerator can be deleted.
  ///
  /// [idempotencyToken]: A unique, case-sensitive identifier that you provide
  /// to ensure the idempotency—that is, the uniqueness—of an accelerator.
  Future<CreateAcceleratorResponse> createAccelerator(
      {@required String name,
      String ipAddressType,
      bool enabled,
      @required String idempotencyToken}) async {
    return CreateAcceleratorResponse.fromJson({});
  }

  /// Create an endpoint group for the specified listener. An endpoint group is
  /// a collection of endpoints in one AWS Region. To see an AWS CLI example of
  /// creating an endpoint group, scroll down to **Example**.
  ///
  /// [listenerArn]: The Amazon Resource Name (ARN) of the listener.
  ///
  /// [endpointGroupRegion]: The name of the AWS Region where the endpoint group
  /// is located. A listener can have only one endpoint group in a specific
  /// Region.
  ///
  /// [endpointConfigurations]: The list of endpoint objects.
  ///
  /// [trafficDialPercentage]: The percentage of traffic to send to an AWS
  /// Region. Additional traffic is distributed to other endpoint groups for
  /// this listener.
  ///
  /// Use this action to increase (dial up) or decrease (dial down) traffic to a
  /// specific Region. The percentage is applied to the traffic that would
  /// otherwise have been routed to the Region based on optimal routing.
  ///
  /// The default value is 100.
  ///
  /// [healthCheckPort]: The port that AWS Global Accelerator uses to check the
  /// health of endpoints that are part of this endpoint group. The default port
  /// is the listener port that this endpoint group is associated with. If
  /// listener port is a list of ports, Global Accelerator uses the first port
  /// in the list.
  ///
  /// [healthCheckProtocol]: The protocol that AWS Global Accelerator uses to
  /// check the health of endpoints that are part of this endpoint group. The
  /// default value is TCP.
  ///
  /// [healthCheckPath]: If the protocol is HTTP/S, then this specifies the path
  /// that is the destination for health check targets. The default value is
  /// slash (/).
  ///
  /// [healthCheckIntervalSeconds]: The time—10 seconds or 30 seconds—between
  /// each health check for an endpoint. The default value is 30.
  ///
  /// [thresholdCount]: The number of consecutive health checks required to set
  /// the state of a healthy endpoint to unhealthy, or to set an unhealthy
  /// endpoint to healthy. The default value is 3.
  ///
  /// [idempotencyToken]: A unique, case-sensitive identifier that you provide
  /// to ensure the idempotency—that is, the uniqueness—of the request.
  Future<CreateEndpointGroupResponse> createEndpointGroup(
      {@required String listenerArn,
      @required String endpointGroupRegion,
      List<EndpointConfiguration> endpointConfigurations,
      double trafficDialPercentage,
      int healthCheckPort,
      String healthCheckProtocol,
      String healthCheckPath,
      int healthCheckIntervalSeconds,
      int thresholdCount,
      @required String idempotencyToken}) async {
    return CreateEndpointGroupResponse.fromJson({});
  }

  /// Create a listener to process inbound connections from clients to an
  /// accelerator. Connections arrive to assigned static IP addresses on a port,
  /// port range, or list of port ranges that you specify. To see an AWS CLI
  /// example of creating a listener, scroll down to **Example**.
  ///
  /// [acceleratorArn]: The Amazon Resource Name (ARN) of your accelerator.
  ///
  /// [portRanges]: The list of port ranges to support for connections from
  /// clients to your accelerator.
  ///
  /// [protocol]: The protocol for connections from clients to your accelerator.
  ///
  /// [clientAffinity]: Client affinity lets you direct all requests from a user
  /// to the same endpoint, if you have stateful applications, regardless of the
  /// port and protocol of the client request. Clienty affinity gives you
  /// control over whether to always route each client to the same specific
  /// endpoint.
  ///
  /// AWS Global Accelerator uses a consistent-flow hashing algorithm to choose
  /// the optimal endpoint for a connection. If client affinity is `NONE`,
  /// Global Accelerator uses the "five-tuple" (5-tuple) properties—source IP
  /// address, source port, destination IP address, destination port, and
  /// protocol—to select the hash value, and then chooses the best endpoint.
  /// However, with this setting, if someone uses different ports to connect to
  /// Global Accelerator, their connections might not be always routed to the
  /// same endpoint because the hash value changes.
  ///
  /// If you want a given client to always be routed to the same endpoint, set
  /// client affinity to `SOURCE_IP` instead. When you use the `SOURCE_IP`
  /// setting, Global Accelerator uses the "two-tuple" (2-tuple) properties—
  /// source (client) IP address and destination IP address—to select the hash
  /// value.
  ///
  /// The default value is `NONE`.
  ///
  /// [idempotencyToken]: A unique, case-sensitive identifier that you provide
  /// to ensure the idempotency—that is, the uniqueness—of the request.
  Future<CreateListenerResponse> createListener(
      {@required String acceleratorArn,
      @required List<PortRange> portRanges,
      @required String protocol,
      String clientAffinity,
      @required String idempotencyToken}) async {
    return CreateListenerResponse.fromJson({});
  }

  /// Delete an accelerator. Note: before you can delete an accelerator, you
  /// must disable it and remove all dependent resources (listeners and endpoint
  /// groups).
  ///
  /// [acceleratorArn]: The Amazon Resource Name (ARN) of an accelerator.
  Future<void> deleteAccelerator(String acceleratorArn) async {}

  /// Delete an endpoint group from a listener.
  ///
  /// [endpointGroupArn]: The Amazon Resource Name (ARN) of the endpoint group
  /// to delete.
  Future<void> deleteEndpointGroup(String endpointGroupArn) async {}

  /// Delete a listener from an accelerator.
  ///
  /// [listenerArn]: The Amazon Resource Name (ARN) of the listener.
  Future<void> deleteListener(String listenerArn) async {}

  /// Describe an accelerator. To see an AWS CLI example of describing an
  /// accelerator, scroll down to **Example**.
  ///
  /// [acceleratorArn]: The Amazon Resource Name (ARN) of the accelerator to
  /// describe.
  Future<DescribeAcceleratorResponse> describeAccelerator(
      String acceleratorArn) async {
    return DescribeAcceleratorResponse.fromJson({});
  }

  /// Describe the attributes of an accelerator.
  ///
  /// [acceleratorArn]: The Amazon Resource Name (ARN) of the accelerator with
  /// the attributes that you want to describe.
  Future<DescribeAcceleratorAttributesResponse> describeAcceleratorAttributes(
      String acceleratorArn) async {
    return DescribeAcceleratorAttributesResponse.fromJson({});
  }

  /// Describe an endpoint group.
  ///
  /// [endpointGroupArn]: The Amazon Resource Name (ARN) of the endpoint group
  /// to describe.
  Future<DescribeEndpointGroupResponse> describeEndpointGroup(
      String endpointGroupArn) async {
    return DescribeEndpointGroupResponse.fromJson({});
  }

  /// Describe a listener.
  ///
  /// [listenerArn]: The Amazon Resource Name (ARN) of the listener to describe.
  Future<DescribeListenerResponse> describeListener(String listenerArn) async {
    return DescribeListenerResponse.fromJson({});
  }

  /// List the accelerators for an AWS account.
  ///
  /// [maxResults]: The number of Global Accelerator objects that you want to
  /// return with this call. The default value is 10.
  ///
  /// [nextToken]: The token for the next set of results. You receive this token
  /// from a previous call.
  Future<ListAcceleratorsResponse> listAccelerators(
      {int maxResults, String nextToken}) async {
    return ListAcceleratorsResponse.fromJson({});
  }

  /// List the endpoint groups that are associated with a listener.
  ///
  /// [listenerArn]: The Amazon Resource Name (ARN) of the listener.
  ///
  /// [maxResults]: The number of endpoint group objects that you want to return
  /// with this call. The default value is 10.
  ///
  /// [nextToken]: The token for the next set of results. You receive this token
  /// from a previous call.
  Future<ListEndpointGroupsResponse> listEndpointGroups(String listenerArn,
      {int maxResults, String nextToken}) async {
    return ListEndpointGroupsResponse.fromJson({});
  }

  /// List the listeners for an accelerator.
  ///
  /// [acceleratorArn]: The Amazon Resource Name (ARN) of the accelerator for
  /// which you want to list listener objects.
  ///
  /// [maxResults]: The number of listener objects that you want to return with
  /// this call. The default value is 10.
  ///
  /// [nextToken]: The token for the next set of results. You receive this token
  /// from a previous call.
  Future<ListListenersResponse> listListeners(String acceleratorArn,
      {int maxResults, String nextToken}) async {
    return ListListenersResponse.fromJson({});
  }

  /// Update an accelerator. To see an AWS CLI example of updating an
  /// accelerator, scroll down to **Example**.
  ///
  ///
  ///
  /// You must specify the US-West-2 (Oregon) Region to create or update
  /// accelerators.
  ///
  /// [acceleratorArn]: The Amazon Resource Name (ARN) of the accelerator to
  /// update.
  ///
  /// [name]: The name of the accelerator. The name can have a maximum of 32
  /// characters, must contain only alphanumeric characters or hyphens (-), and
  /// must not begin or end with a hyphen.
  ///
  /// [ipAddressType]: The value for the address type must be IPv4.
  ///
  /// [enabled]: Indicates whether an accelerator is enabled. The value is true
  /// or false. The default value is true.
  ///
  /// If the value is set to true, the accelerator cannot be deleted. If set to
  /// false, the accelerator can be deleted.
  Future<UpdateAcceleratorResponse> updateAccelerator(String acceleratorArn,
      {String name, String ipAddressType, bool enabled}) async {
    return UpdateAcceleratorResponse.fromJson({});
  }

  /// Update the attributes for an accelerator. To see an AWS CLI example of
  /// updating an accelerator to enable flow logs, scroll down to **Example**.
  ///
  /// [acceleratorArn]: The Amazon Resource Name (ARN) of the accelerator that
  /// you want to update.
  ///
  /// [flowLogsEnabled]: Update whether flow logs are enabled. The default value
  /// is false. If the value is true, `FlowLogsS3Bucket` and `FlowLogsS3Prefix`
  /// must be specified.
  ///
  /// For more information, see
  /// [Flow Logs](https://docs.aws.amazon.com/global-accelerator/latest/dg/monitoring-global-accelerator.flow-logs.html)
  /// in the _AWS Global Accelerator Developer Guide_.
  ///
  /// [flowLogsS3Bucket]: The name of the Amazon S3 bucket for the flow logs.
  /// Attribute is required if `FlowLogsEnabled` is `true`. The bucket must
  /// exist and have a bucket policy that grants AWS Global Accelerator
  /// permission to write to the bucket.
  ///
  /// [flowLogsS3Prefix]: Update the prefix for the location in the Amazon S3
  /// bucket for the flow logs. Attribute is required if `FlowLogsEnabled` is
  /// `true`. If you don’t specify a prefix, the flow logs are stored in the
  /// root of the bucket.
  Future<UpdateAcceleratorAttributesResponse> updateAcceleratorAttributes(
      String acceleratorArn,
      {bool flowLogsEnabled,
      String flowLogsS3Bucket,
      String flowLogsS3Prefix}) async {
    return UpdateAcceleratorAttributesResponse.fromJson({});
  }

  /// Update an endpoint group. To see an AWS CLI example of updating an
  /// endpoint group, scroll down to **Example**.
  ///
  /// [endpointGroupArn]: The Amazon Resource Name (ARN) of the endpoint group.
  ///
  /// [endpointConfigurations]: The list of endpoint objects.
  ///
  /// [trafficDialPercentage]: The percentage of traffic to send to an AWS
  /// Region. Additional traffic is distributed to other endpoint groups for
  /// this listener.
  ///
  /// Use this action to increase (dial up) or decrease (dial down) traffic to a
  /// specific Region. The percentage is applied to the traffic that would
  /// otherwise have been routed to the Region based on optimal routing.
  ///
  /// The default value is 100.
  ///
  /// [healthCheckPort]: The port that AWS Global Accelerator uses to check the
  /// health of endpoints that are part of this endpoint group. The default port
  /// is the listener port that this endpoint group is associated with. If the
  /// listener port is a list of ports, Global Accelerator uses the first port
  /// in the list.
  ///
  /// [healthCheckProtocol]: The protocol that AWS Global Accelerator uses to
  /// check the health of endpoints that are part of this endpoint group. The
  /// default value is TCP.
  ///
  /// [healthCheckPath]: If the protocol is HTTP/S, then this specifies the path
  /// that is the destination for health check targets. The default value is
  /// slash (/).
  ///
  /// [healthCheckIntervalSeconds]: The time—10 seconds or 30 seconds—between
  /// each health check for an endpoint. The default value is 30.
  ///
  /// [thresholdCount]: The number of consecutive health checks required to set
  /// the state of a healthy endpoint to unhealthy, or to set an unhealthy
  /// endpoint to healthy. The default value is 3.
  Future<UpdateEndpointGroupResponse> updateEndpointGroup(
      String endpointGroupArn,
      {List<EndpointConfiguration> endpointConfigurations,
      double trafficDialPercentage,
      int healthCheckPort,
      String healthCheckProtocol,
      String healthCheckPath,
      int healthCheckIntervalSeconds,
      int thresholdCount}) async {
    return UpdateEndpointGroupResponse.fromJson({});
  }

  /// Update a listener.
  ///
  /// [listenerArn]: The Amazon Resource Name (ARN) of the listener to update.
  ///
  /// [portRanges]: The updated list of port ranges for the connections from
  /// clients to the accelerator.
  ///
  /// [protocol]: The updated protocol for the connections from clients to the
  /// accelerator.
  ///
  /// [clientAffinity]: Client affinity lets you direct all requests from a user
  /// to the same endpoint, if you have stateful applications, regardless of the
  /// port and protocol of the client request. Clienty affinity gives you
  /// control over whether to always route each client to the same specific
  /// endpoint.
  ///
  /// AWS Global Accelerator uses a consistent-flow hashing algorithm to choose
  /// the optimal endpoint for a connection. If client affinity is `NONE`,
  /// Global Accelerator uses the "five-tuple" (5-tuple) properties—source IP
  /// address, source port, destination IP address, destination port, and
  /// protocol—to select the hash value, and then chooses the best endpoint.
  /// However, with this setting, if someone uses different ports to connect to
  /// Global Accelerator, their connections might not be always routed to the
  /// same endpoint because the hash value changes.
  ///
  /// If you want a given client to always be routed to the same endpoint, set
  /// client affinity to `SOURCE_IP` instead. When you use the `SOURCE_IP`
  /// setting, Global Accelerator uses the "two-tuple" (2-tuple) properties—
  /// source (client) IP address and destination IP address—to select the hash
  /// value.
  ///
  /// The default value is `NONE`.
  Future<UpdateListenerResponse> updateListener(String listenerArn,
      {List<PortRange> portRanges,
      String protocol,
      String clientAffinity}) async {
    return UpdateListenerResponse.fromJson({});
  }
}

/// An accelerator is a complex type that includes one or more listeners that
/// process inbound connections and then direct traffic to one or more endpoint
/// groups, each of which includes endpoints, such as load balancers.
class Accelerator {
  /// The Amazon Resource Name (ARN) of the accelerator.
  final String acceleratorArn;

  /// The name of the accelerator. The name must contain only alphanumeric
  /// characters or hyphens (-), and must not begin or end with a hyphen.
  final String name;

  /// The value for the address type must be IPv4.
  final String ipAddressType;

  /// Indicates whether the accelerator is enabled. The value is true or false.
  /// The default value is true.
  ///
  /// If the value is set to true, the accelerator cannot be deleted. If set to
  /// false, accelerator can be deleted.
  final bool enabled;

  /// The static IP addresses that Global Accelerator associates with the
  /// accelerator.
  final List<IpSet> ipSets;

  /// Describes the deployment status of the accelerator.
  final String status;

  /// The date and time that the accelerator was created.
  final DateTime createdTime;

  /// The date and time that the accelerator was last modified.
  final DateTime lastModifiedTime;

  Accelerator({
    this.acceleratorArn,
    this.name,
    this.ipAddressType,
    this.enabled,
    this.ipSets,
    this.status,
    this.createdTime,
    this.lastModifiedTime,
  });
  static Accelerator fromJson(Map<String, dynamic> json) => Accelerator();
}

/// Attributes of an accelerator.
class AcceleratorAttributes {
  /// Indicates whether flow logs are enabled. The default value is false. If
  /// the value is true, `FlowLogsS3Bucket` and `FlowLogsS3Prefix` must be
  /// specified.
  ///
  /// For more information, see
  /// [Flow Logs](https://docs.aws.amazon.com/global-accelerator/latest/dg/monitoring-global-accelerator.flow-logs.html)
  /// in the _AWS Global Accelerator Developer Guide_.
  final bool flowLogsEnabled;

  /// The name of the Amazon S3 bucket for the flow logs. Attribute is required
  /// if `FlowLogsEnabled` is `true`. The bucket must exist and have a bucket
  /// policy that grants AWS Global Accelerator permission to write to the
  /// bucket.
  final String flowLogsS3Bucket;

  /// The prefix for the location in the Amazon S3 bucket for the flow logs.
  /// Attribute is required if `FlowLogsEnabled` is `true`. If you don’t specify
  /// a prefix, the flow logs are stored in the root of the bucket.
  final String flowLogsS3Prefix;

  AcceleratorAttributes({
    this.flowLogsEnabled,
    this.flowLogsS3Bucket,
    this.flowLogsS3Prefix,
  });
  static AcceleratorAttributes fromJson(Map<String, dynamic> json) =>
      AcceleratorAttributes();
}

class CreateAcceleratorResponse {
  /// The accelerator that is created by specifying a listener and the supported
  /// IP address types.
  final Accelerator accelerator;

  CreateAcceleratorResponse({
    this.accelerator,
  });
  static CreateAcceleratorResponse fromJson(Map<String, dynamic> json) =>
      CreateAcceleratorResponse();
}

class CreateEndpointGroupResponse {
  /// The information about the endpoint group that was created.
  final EndpointGroup endpointGroup;

  CreateEndpointGroupResponse({
    this.endpointGroup,
  });
  static CreateEndpointGroupResponse fromJson(Map<String, dynamic> json) =>
      CreateEndpointGroupResponse();
}

class CreateListenerResponse {
  /// The listener that you've created.
  final Listener listener;

  CreateListenerResponse({
    this.listener,
  });
  static CreateListenerResponse fromJson(Map<String, dynamic> json) =>
      CreateListenerResponse();
}

class DescribeAcceleratorAttributesResponse {
  /// The attributes of the accelerator.
  final AcceleratorAttributes acceleratorAttributes;

  DescribeAcceleratorAttributesResponse({
    this.acceleratorAttributes,
  });
  static DescribeAcceleratorAttributesResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeAcceleratorAttributesResponse();
}

class DescribeAcceleratorResponse {
  /// The description of the accelerator.
  final Accelerator accelerator;

  DescribeAcceleratorResponse({
    this.accelerator,
  });
  static DescribeAcceleratorResponse fromJson(Map<String, dynamic> json) =>
      DescribeAcceleratorResponse();
}

class DescribeEndpointGroupResponse {
  /// The description of an endpoint group.
  final EndpointGroup endpointGroup;

  DescribeEndpointGroupResponse({
    this.endpointGroup,
  });
  static DescribeEndpointGroupResponse fromJson(Map<String, dynamic> json) =>
      DescribeEndpointGroupResponse();
}

class DescribeListenerResponse {
  /// The description of a listener.
  final Listener listener;

  DescribeListenerResponse({
    this.listener,
  });
  static DescribeListenerResponse fromJson(Map<String, dynamic> json) =>
      DescribeListenerResponse();
}

/// A complex type for endpoints.
class EndpointConfiguration {
  /// An ID for the endpoint. If the endpoint is a Network Load Balancer or
  /// Application Load Balancer, this is the Amazon Resource Name (ARN) of the
  /// resource. If the endpoint is an Elastic IP address, this is the Elastic IP
  /// address allocation ID.
  final String endpointId;

  /// The weight associated with the endpoint. When you add weights to
  /// endpoints, you configure AWS Global Accelerator to route traffic based on
  /// proportions that you specify. For example, you might specify endpoint
  /// weights of 4, 5, 5, and 6 (sum=20). The result is that 4/20 of your
  /// traffic, on average, is routed to the first endpoint, 5/20 is routed both
  /// to the second and third endpoints, and 6/20 is routed to the last
  /// endpoint. For more information, see
  /// [Endpoint Weights](https://docs.aws.amazon.com/global-accelerator/latest/dg/about-endpoints-endpoint-weights.html)
  /// in the _AWS Global Accelerator Developer Guide_.
  final int weight;

  /// Indicates whether client IP address preservation is enabled for an
  /// Application Load Balancer endpoint. The value is true or false. The
  /// default value is true for new accelerators.
  ///
  /// If the value is set to true, the client's IP address is preserved in the
  /// `X-Forwarded-For` request header as traffic travels to applications on the
  /// Application Load Balancer endpoint fronted by the accelerator.
  ///
  /// For more information, see
  /// [Viewing Client IP Addresses in AWS Global Accelerator](https://docs.aws.amazon.com/global-accelerator/latest/dg/introduction-how-it-works-client-ip.html)
  /// in the _AWS Global Accelerator Developer Guide_.
  final bool clientIPPreservationEnabled;

  EndpointConfiguration({
    this.endpointId,
    this.weight,
    this.clientIPPreservationEnabled,
  });
}

/// A complex type for an endpoint. Each endpoint group can include one or more
/// endpoints, such as load balancers.
class EndpointDescription {
  /// An ID for the endpoint. If the endpoint is a Network Load Balancer or
  /// Application Load Balancer, this is the Amazon Resource Name (ARN) of the
  /// resource. If the endpoint is an Elastic IP address, this is the Elastic IP
  /// address allocation ID. An Application Load Balancer can be either internal
  /// or internet-facing.
  final String endpointId;

  /// The weight associated with the endpoint. When you add weights to
  /// endpoints, you configure AWS Global Accelerator to route traffic based on
  /// proportions that you specify. For example, you might specify endpoint
  /// weights of 4, 5, 5, and 6 (sum=20). The result is that 4/20 of your
  /// traffic, on average, is routed to the first endpoint, 5/20 is routed both
  /// to the second and third endpoints, and 6/20 is routed to the last
  /// endpoint. For more information, see
  /// [Endpoint Weights](https://docs.aws.amazon.com/global-accelerator/latest/dg/about-endpoints-endpoint-weights.html)
  /// in the _AWS Global Accelerator Developer Guide_.
  final int weight;

  /// The health status of the endpoint.
  final String healthState;

  /// The reason code associated with why the endpoint is not healthy. If the
  /// endpoint state is healthy, a reason code is not provided.
  ///
  /// If the endpoint state is **unhealthy**, the reason code can be one of the
  /// following values:
  ///
  /// *    **Timeout**: The health check requests to the endpoint are timing out
  /// before returning a status.
  ///
  /// *    **Failed**: The health check failed, for example because the endpoint
  /// response was invalid (malformed).
  ///
  ///
  /// If the endpoint state is **initial**, the reason code can be one of the
  /// following values:
  ///
  /// *    **ProvisioningInProgress**: The endpoint is in the process of being
  /// provisioned.
  ///
  /// *    **InitialHealthChecking**: Global Accelerator is still setting up the
  /// minimum number of health checks for the endpoint that are required to
  /// determine its health status.
  final String healthReason;

  /// Indicates whether client IP address preservation is enabled for an
  /// Application Load Balancer endpoint. The value is true or false. The
  /// default value is true for new accelerators.
  ///
  /// If the value is set to true, the client's IP address is preserved in the
  /// `X-Forwarded-For` request header as traffic travels to applications on the
  /// Application Load Balancer endpoint fronted by the accelerator.
  ///
  /// For more information, see
  /// [Viewing Client IP Addresses in AWS Global Accelerator](https://docs.aws.amazon.com/global-accelerator/latest/dg/introduction-how-it-works-client-ip.html)
  /// in the _AWS Global Accelerator Developer Guide_.
  final bool clientIPPreservationEnabled;

  EndpointDescription({
    this.endpointId,
    this.weight,
    this.healthState,
    this.healthReason,
    this.clientIPPreservationEnabled,
  });
  static EndpointDescription fromJson(Map<String, dynamic> json) =>
      EndpointDescription();
}

/// A complex type for the endpoint group. An AWS Region can have only one
/// endpoint group for a specific listener.
class EndpointGroup {
  /// The Amazon Resource Name (ARN) of the endpoint group.
  final String endpointGroupArn;

  /// The AWS Region that this endpoint group belongs.
  final String endpointGroupRegion;

  /// The list of endpoint objects.
  final List<EndpointDescription> endpointDescriptions;

  /// The percentage of traffic to send to an AWS Region. Additional traffic is
  /// distributed to other endpoint groups for this listener.
  ///
  /// Use this action to increase (dial up) or decrease (dial down) traffic to a
  /// specific Region. The percentage is applied to the traffic that would
  /// otherwise have been routed to the Region based on optimal routing.
  ///
  /// The default value is 100.
  final double trafficDialPercentage;

  /// The port that Global Accelerator uses to perform health checks on
  /// endpoints that are part of this endpoint group.
  ///
  /// The default port is the port for the listener that this endpoint group is
  /// associated with. If the listener port is a list, Global Accelerator uses
  /// the first specified port in the list of ports.
  final int healthCheckPort;

  /// The protocol that Global Accelerator uses to perform health checks on
  /// endpoints that are part of this endpoint group. The default value is TCP.
  final String healthCheckProtocol;

  /// If the protocol is HTTP/S, then this value provides the ping path that
  /// Global Accelerator uses for the destination on the endpoints for health
  /// checks. The default is slash (/).
  final String healthCheckPath;

  /// The time—10 seconds or 30 seconds—between health checks for each endpoint.
  /// The default value is 30.
  final int healthCheckIntervalSeconds;

  /// The number of consecutive health checks required to set the state of a
  /// healthy endpoint to unhealthy, or to set an unhealthy endpoint to healthy.
  /// The default value is 3.
  final int thresholdCount;

  EndpointGroup({
    this.endpointGroupArn,
    this.endpointGroupRegion,
    this.endpointDescriptions,
    this.trafficDialPercentage,
    this.healthCheckPort,
    this.healthCheckProtocol,
    this.healthCheckPath,
    this.healthCheckIntervalSeconds,
    this.thresholdCount,
  });
  static EndpointGroup fromJson(Map<String, dynamic> json) => EndpointGroup();
}

/// A complex type for the set of IP addresses for an accelerator.
class IpSet {
  /// The types of IP addresses included in this IP set.
  final String ipFamily;

  /// The array of IP addresses in the IP address set. An IP address set can
  /// have a maximum of two IP addresses.
  final List<String> ipAddresses;

  IpSet({
    this.ipFamily,
    this.ipAddresses,
  });
  static IpSet fromJson(Map<String, dynamic> json) => IpSet();
}

class ListAcceleratorsResponse {
  /// The list of accelerators for a customer account.
  final List<Accelerator> accelerators;

  /// The token for the next set of results. You receive this token from a
  /// previous call.
  final String nextToken;

  ListAcceleratorsResponse({
    this.accelerators,
    this.nextToken,
  });
  static ListAcceleratorsResponse fromJson(Map<String, dynamic> json) =>
      ListAcceleratorsResponse();
}

class ListEndpointGroupsResponse {
  /// The list of the endpoint groups associated with a listener.
  final List<EndpointGroup> endpointGroups;

  /// The token for the next set of results. You receive this token from a
  /// previous call.
  final String nextToken;

  ListEndpointGroupsResponse({
    this.endpointGroups,
    this.nextToken,
  });
  static ListEndpointGroupsResponse fromJson(Map<String, dynamic> json) =>
      ListEndpointGroupsResponse();
}

class ListListenersResponse {
  /// The list of listeners for an accelerator.
  final List<Listener> listeners;

  /// The token for the next set of results. You receive this token from a
  /// previous call.
  final String nextToken;

  ListListenersResponse({
    this.listeners,
    this.nextToken,
  });
  static ListListenersResponse fromJson(Map<String, dynamic> json) =>
      ListListenersResponse();
}

/// A complex type for a listener.
class Listener {
  /// The Amazon Resource Name (ARN) of the listener.
  final String listenerArn;

  /// The list of port ranges for the connections from clients to the
  /// accelerator.
  final List<PortRange> portRanges;

  /// The protocol for the connections from clients to the accelerator.
  final String protocol;

  /// Client affinity lets you direct all requests from a user to the same
  /// endpoint, if you have stateful applications, regardless of the port and
  /// protocol of the client request. Clienty affinity gives you control over
  /// whether to always route each client to the same specific endpoint.
  ///
  /// AWS Global Accelerator uses a consistent-flow hashing algorithm to choose
  /// the optimal endpoint for a connection. If client affinity is `NONE`,
  /// Global Accelerator uses the "five-tuple" (5-tuple) properties—source IP
  /// address, source port, destination IP address, destination port, and
  /// protocol—to select the hash value, and then chooses the best endpoint.
  /// However, with this setting, if someone uses different ports to connect to
  /// Global Accelerator, their connections might not be always routed to the
  /// same endpoint because the hash value changes.
  ///
  /// If you want a given client to always be routed to the same endpoint, set
  /// client affinity to `SOURCE_IP` instead. When you use the `SOURCE_IP`
  /// setting, Global Accelerator uses the "two-tuple" (2-tuple) properties—
  /// source (client) IP address and destination IP address—to select the hash
  /// value.
  ///
  /// The default value is `NONE`.
  final String clientAffinity;

  Listener({
    this.listenerArn,
    this.portRanges,
    this.protocol,
    this.clientAffinity,
  });
  static Listener fromJson(Map<String, dynamic> json) => Listener();
}

/// A complex type for a range of ports for a listener.
class PortRange {
  /// The first port in the range of ports, inclusive.
  final int fromPort;

  /// The last port in the range of ports, inclusive.
  final int toPort;

  PortRange({
    this.fromPort,
    this.toPort,
  });
  static PortRange fromJson(Map<String, dynamic> json) => PortRange();
}

class UpdateAcceleratorAttributesResponse {
  /// Updated attributes for the accelerator.
  final AcceleratorAttributes acceleratorAttributes;

  UpdateAcceleratorAttributesResponse({
    this.acceleratorAttributes,
  });
  static UpdateAcceleratorAttributesResponse fromJson(
          Map<String, dynamic> json) =>
      UpdateAcceleratorAttributesResponse();
}

class UpdateAcceleratorResponse {
  /// Information about the updated accelerator.
  final Accelerator accelerator;

  UpdateAcceleratorResponse({
    this.accelerator,
  });
  static UpdateAcceleratorResponse fromJson(Map<String, dynamic> json) =>
      UpdateAcceleratorResponse();
}

class UpdateEndpointGroupResponse {
  /// The information about the endpoint group that was updated.
  final EndpointGroup endpointGroup;

  UpdateEndpointGroupResponse({
    this.endpointGroup,
  });
  static UpdateEndpointGroupResponse fromJson(Map<String, dynamic> json) =>
      UpdateEndpointGroupResponse();
}

class UpdateListenerResponse {
  /// Information for the updated listener.
  final Listener listener;

  UpdateListenerResponse({
    this.listener,
  });
  static UpdateListenerResponse fromJson(Map<String, dynamic> json) =>
      UpdateListenerResponse();
}
