import 'package:meta/meta.dart';

/// AWS Global Accelerator
///
/// This is the _AWS Global Accelerator API Reference_. This guide is for
/// developers who need detailed information about AWS Global Accelerator API
/// actions, data types, and errors. For more information about Global
/// Accelerator features, see the [AWS Global Accelerator Developer
/// Guide](https://docs.aws.amazon.com/global-accelerator/latest/dg/Welcome.html).
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
  Future<void> createAccelerator(
      {@required String name,
      String ipAddressType,
      bool enabled,
      @required String idempotencyToken}) async {}

  /// Create an endpoint group for the specified listener. An endpoint group is
  /// a collection of endpoints in one AWS Region. To see an AWS CLI example of
  /// creating an endpoint group, scroll down to **Example**.
  Future<void> createEndpointGroup(
      {@required String listenerArn,
      @required String endpointGroupRegion,
      List<EndpointConfiguration> endpointConfigurations,
      double trafficDialPercentage,
      int healthCheckPort,
      String healthCheckProtocol,
      String healthCheckPath,
      int healthCheckIntervalSeconds,
      int thresholdCount,
      @required String idempotencyToken}) async {}

  /// Create a listener to process inbound connections from clients to an
  /// accelerator. Connections arrive to assigned static IP addresses on a port,
  /// port range, or list of port ranges that you specify. To see an AWS CLI
  /// example of creating a listener, scroll down to **Example**.
  Future<void> createListener(
      {@required String acceleratorArn,
      @required List<PortRange> portRanges,
      @required String protocol,
      String clientAffinity,
      @required String idempotencyToken}) async {}

  /// Delete an accelerator. Note: before you can delete an accelerator, you
  /// must disable it and remove all dependent resources (listeners and endpoint
  /// groups).
  Future<void> deleteAccelerator(String acceleratorArn) async {}

  /// Delete an endpoint group from a listener.
  Future<void> deleteEndpointGroup(String endpointGroupArn) async {}

  /// Delete a listener from an accelerator.
  Future<void> deleteListener(String listenerArn) async {}

  /// Describe an accelerator. To see an AWS CLI example of describing an
  /// accelerator, scroll down to **Example**.
  Future<void> describeAccelerator(String acceleratorArn) async {}

  /// Describe the attributes of an accelerator.
  Future<void> describeAcceleratorAttributes(String acceleratorArn) async {}

  /// Describe an endpoint group.
  Future<void> describeEndpointGroup(String endpointGroupArn) async {}

  /// Describe a listener.
  Future<void> describeListener(String listenerArn) async {}

  /// List the accelerators for an AWS account.
  Future<void> listAccelerators({int maxResults, String nextToken}) async {}

  /// List the endpoint groups that are associated with a listener.
  Future<void> listEndpointGroups(String listenerArn,
      {int maxResults, String nextToken}) async {}

  /// List the listeners for an accelerator.
  Future<void> listListeners(String acceleratorArn,
      {int maxResults, String nextToken}) async {}

  /// Update an accelerator. To see an AWS CLI example of updating an
  /// accelerator, scroll down to **Example**.
  ///
  ///
  ///
  /// You must specify the US-West-2 (Oregon) Region to create or update
  /// accelerators.
  Future<void> updateAccelerator(String acceleratorArn,
      {String name, String ipAddressType, bool enabled}) async {}

  /// Update the attributes for an accelerator. To see an AWS CLI example of
  /// updating an accelerator to enable flow logs, scroll down to **Example**.
  Future<void> updateAcceleratorAttributes(String acceleratorArn,
      {bool flowLogsEnabled,
      String flowLogsS3Bucket,
      String flowLogsS3Prefix}) async {}

  /// Update an endpoint group. To see an AWS CLI example of updating an
  /// endpoint group, scroll down to **Example**.
  Future<void> updateEndpointGroup(String endpointGroupArn,
      {List<EndpointConfiguration> endpointConfigurations,
      double trafficDialPercentage,
      int healthCheckPort,
      String healthCheckProtocol,
      String healthCheckPath,
      int healthCheckIntervalSeconds,
      int thresholdCount}) async {}

  /// Update a listener.
  Future<void> updateListener(String listenerArn,
      {List<PortRange> portRanges,
      String protocol,
      String clientAffinity}) async {}
}

class Accelerator {}

class AcceleratorAttributes {}

class CreateAcceleratorResponse {}

class CreateEndpointGroupResponse {}

class CreateListenerResponse {}

class DescribeAcceleratorAttributesResponse {}

class DescribeAcceleratorResponse {}

class DescribeEndpointGroupResponse {}

class DescribeListenerResponse {}

class EndpointConfiguration {}

class EndpointDescription {}

class EndpointGroup {}

class IpSet {}

class ListAcceleratorsResponse {}

class ListEndpointGroupsResponse {}

class ListListenersResponse {}

class Listener {}

class PortRange {}

class UpdateAcceleratorAttributesResponse {}

class UpdateAcceleratorResponse {}

class UpdateEndpointGroupResponse {}

class UpdateListenerResponse {}
