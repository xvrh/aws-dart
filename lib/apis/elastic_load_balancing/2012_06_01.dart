import 'package:meta/meta.dart';

/// Elastic Load Balancing
///
/// A load balancer can distribute incoming traffic across your EC2 instances.
/// This enables you to increase the availability of your application. The load
/// balancer also monitors the health of its registered instances and ensures
/// that it routes traffic only to healthy instances. You configure your load
/// balancer to accept incoming traffic by specifying one or more listeners,
/// which are configured with a protocol and port number for connections from
/// clients to the load balancer and a protocol and port number for connections
/// from the load balancer to the instances.
///
/// Elastic Load Balancing supports three types of load balancers: Application
/// Load Balancers, Network Load Balancers, and Classic Load Balancers. You can
/// select a load balancer based on your application needs. For more
/// information, see the [Elastic Load Balancing User
/// Guide](http://docs.aws.amazon.com/elasticloadbalancing/latest/userguide/).
///
/// This reference covers the 2012-06-01 API, which supports Classic Load
/// Balancers. The 2015-12-01 API supports Application Load Balancers and
/// Network Load Balancers.
///
/// To get started, create a load balancer with one or more listeners using
/// CreateLoadBalancer. Register your instances with the load balancer using
/// RegisterInstancesWithLoadBalancer.
///
/// All Elastic Load Balancing operations are _idempotent_, which means that
/// they complete at most one time. If you repeat an operation, it succeeds with
/// a 200 OK response code.
class ElasticLoadBalancingApi {
  /// Adds the specified tags to the specified load balancer. Each load balancer
  /// can have a maximum of 10 tags.
  ///
  /// Each tag consists of a key and an optional value. If a tag with the same
  /// key is already associated with the load balancer, `AddTags` updates its
  /// value.
  ///
  /// For more information, see [Tag Your Classic Load
  /// Balancer](http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/add-remove-tags.html)
  /// in the _Classic Load Balancers Guide_.
  Future<void> addTags(
      {@required List<String> loadBalancerNames,
      @required List<Tag> tags}) async {}

  /// Associates one or more security groups with your load balancer in a
  /// virtual private cloud (VPC). The specified security groups override the
  /// previously associated security groups.
  ///
  /// For more information, see [Security Groups for Load Balancers in a
  /// VPC](http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-security-groups.html#elb-vpc-security-groups)
  /// in the _Classic Load Balancers Guide_.
  Future<void> applySecurityGroupsToLoadBalancer(
      {@required String loadBalancerName,
      @required List<String> securityGroups}) async {}

  /// Adds one or more subnets to the set of configured subnets for the
  /// specified load balancer.
  ///
  /// The load balancer evenly distributes requests across all registered
  /// subnets. For more information, see [Add or Remove Subnets for Your Load
  /// Balancer in a
  /// VPC](http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-manage-subnets.html)
  /// in the _Classic Load Balancers Guide_.
  Future<void> attachLoadBalancerToSubnets(
      {@required String loadBalancerName,
      @required List<String> subnets}) async {}

  /// Specifies the health check settings to use when evaluating the health
  /// state of your EC2 instances.
  ///
  /// For more information, see [Configure Health Checks for Your Load
  /// Balancer](http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-healthchecks.html)
  /// in the _Classic Load Balancers Guide_.
  Future<void> configureHealthCheck(
      {@required String loadBalancerName,
      @required HealthCheck healthCheck}) async {}

  /// Generates a stickiness policy with sticky session lifetimes that follow
  /// that of an application-generated cookie. This policy can be associated
  /// only with HTTP/HTTPS listeners.
  ///
  /// This policy is similar to the policy created by
  /// CreateLBCookieStickinessPolicy, except that the lifetime of the special
  /// Elastic Load Balancing cookie, `AWSELB`, follows the lifetime of the
  /// application-generated cookie specified in the policy configuration. The
  /// load balancer only inserts a new stickiness cookie when the application
  /// response includes a new application cookie.
  ///
  /// If the application cookie is explicitly removed or expires, the session
  /// stops being sticky until a new application cookie is issued.
  ///
  /// For more information, see [Application-Controlled Session
  /// Stickiness](http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-sticky-sessions.html#enable-sticky-sessions-application)
  /// in the _Classic Load Balancers Guide_.
  Future<void> createAppCookieStickinessPolicy(
      {@required String loadBalancerName,
      @required String policyName,
      @required String cookieName}) async {}

  /// Generates a stickiness policy with sticky session lifetimes controlled by
  /// the lifetime of the browser (user-agent) or a specified expiration period.
  /// This policy can be associated only with HTTP/HTTPS listeners.
  ///
  /// When a load balancer implements this policy, the load balancer uses a
  /// special cookie to track the instance for each request. When the load
  /// balancer receives a request, it first checks to see if this cookie is
  /// present in the request. If so, the load balancer sends the request to the
  /// application server specified in the cookie. If not, the load balancer
  /// sends the request to a server that is chosen based on the existing
  /// load-balancing algorithm.
  ///
  /// A cookie is inserted into the response for binding subsequent requests
  /// from the same user to that server. The validity of the cookie is based on
  /// the cookie expiration time, which is specified in the policy
  /// configuration.
  ///
  /// For more information, see [Duration-Based Session
  /// Stickiness](http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-sticky-sessions.html#enable-sticky-sessions-duration)
  /// in the _Classic Load Balancers Guide_.
  Future<void> createLBCookieStickinessPolicy(
      {@required String loadBalancerName,
      @required String policyName,
      BigInt cookieExpirationPeriod}) async {}

  /// Creates a Classic Load Balancer.
  ///
  /// You can add listeners, security groups, subnets, and tags when you create
  /// your load balancer, or you can add them later using
  /// CreateLoadBalancerListeners, ApplySecurityGroupsToLoadBalancer,
  /// AttachLoadBalancerToSubnets, and AddTags.
  ///
  /// To describe your current load balancers, see DescribeLoadBalancers. When
  /// you are finished with a load balancer, you can delete it using
  /// DeleteLoadBalancer.
  ///
  /// You can create up to 20 load balancers per region per account. You can
  /// request an increase for the number of load balancers for your account. For
  /// more information, see [Limits for Your Classic Load
  /// Balancer](http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-limits.html)
  /// in the _Classic Load Balancers Guide_.
  Future<void> createLoadBalancer(
      {@required String loadBalancerName,
      @required List<Listener> listeners,
      List<String> availabilityZones,
      List<String> subnets,
      List<String> securityGroups,
      String scheme,
      List<Tag> tags}) async {}

  /// Creates one or more listeners for the specified load balancer. If a
  /// listener with the specified port does not already exist, it is created;
  /// otherwise, the properties of the new listener must match the properties of
  /// the existing listener.
  ///
  /// For more information, see [Listeners for Your Classic Load
  /// Balancer](http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-listener-config.html)
  /// in the _Classic Load Balancers Guide_.
  Future<void> createLoadBalancerListeners(
      {@required String loadBalancerName,
      @required List<Listener> listeners}) async {}

  /// Creates a policy with the specified attributes for the specified load
  /// balancer.
  ///
  /// Policies are settings that are saved for your load balancer and that can
  /// be applied to the listener or the application server, depending on the
  /// policy type.
  Future<void> createLoadBalancerPolicy(
      {@required String loadBalancerName,
      @required String policyName,
      @required String policyTypeName,
      List<PolicyAttribute> policyAttributes}) async {}

  /// Deletes the specified load balancer.
  ///
  /// If you are attempting to recreate a load balancer, you must reconfigure
  /// all settings. The DNS name associated with a deleted load balancer are no
  /// longer usable. The name and associated DNS record of the deleted load
  /// balancer no longer exist and traffic sent to any of its IP addresses is no
  /// longer delivered to your instances.
  ///
  /// If the load balancer does not exist or has already been deleted, the call
  /// to `DeleteLoadBalancer` still succeeds.
  Future<void> deleteLoadBalancer(String loadBalancerName) async {}

  /// Deletes the specified listeners from the specified load balancer.
  Future<void> deleteLoadBalancerListeners(
      {@required String loadBalancerName,
      @required List<int> loadBalancerPorts}) async {}

  /// Deletes the specified policy from the specified load balancer. This policy
  /// must not be enabled for any listeners.
  Future<void> deleteLoadBalancerPolicy(
      {@required String loadBalancerName, @required String policyName}) async {}

  /// Deregisters the specified instances from the specified load balancer.
  /// After the instance is deregistered, it no longer receives traffic from the
  /// load balancer.
  ///
  /// You can use DescribeLoadBalancers to verify that the instance is
  /// deregistered from the load balancer.
  ///
  /// For more information, see [Register or De-Register EC2
  /// Instances](http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-deregister-register-instances.html)
  /// in the _Classic Load Balancers Guide_.
  Future<void> deregisterInstancesFromLoadBalancer(
      {@required String loadBalancerName,
      @required List<Instance> instances}) async {}

  /// Describes the current Elastic Load Balancing resource limits for your AWS
  /// account.
  ///
  /// For more information, see [Limits for Your Classic Load
  /// Balancer](http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-limits.html)
  /// in the _Classic Load Balancers Guide_.
  Future<void> describeAccountLimits({String marker, int pageSize}) async {}

  /// Describes the state of the specified instances with respect to the
  /// specified load balancer. If no instances are specified, the call describes
  /// the state of all instances that are currently registered with the load
  /// balancer. If instances are specified, their state is returned even if they
  /// are no longer registered with the load balancer. The state of terminated
  /// instances is not returned.
  Future<void> describeInstanceHealth(String loadBalancerName,
      {List<Instance> instances}) async {}

  /// Describes the attributes for the specified load balancer.
  Future<void> describeLoadBalancerAttributes(String loadBalancerName) async {}

  /// Describes the specified policies.
  ///
  /// If you specify a load balancer name, the action returns the descriptions
  /// of all policies created for the load balancer. If you specify a policy
  /// name associated with your load balancer, the action returns the
  /// description of that policy. If you don't specify a load balancer name, the
  /// action returns descriptions of the specified sample policies, or
  /// descriptions of all sample policies. The names of the sample policies have
  /// the `ELBSample-` prefix.
  Future<void> describeLoadBalancerPolicies(
      {String loadBalancerName, List<String> policyNames}) async {}

  /// Describes the specified load balancer policy types or all load balancer
  /// policy types.
  ///
  /// The description of each type indicates how it can be used. For example,
  /// some policies can be used only with layer 7 listeners, some policies can
  /// be used only with layer 4 listeners, and some policies can be used only
  /// with your EC2 instances.
  ///
  /// You can use CreateLoadBalancerPolicy to create a policy configuration for
  /// any of these policy types. Then, depending on the policy type, use either
  /// SetLoadBalancerPoliciesOfListener or
  /// SetLoadBalancerPoliciesForBackendServer to set the policy.
  Future<void> describeLoadBalancerPolicyTypes(
      {List<String> policyTypeNames}) async {}

  /// Describes the specified the load balancers. If no load balancers are
  /// specified, the call describes all of your load balancers.
  Future<void> describeLoadBalancers(
      {List<String> loadBalancerNames, String marker, int pageSize}) async {}

  /// Describes the tags associated with the specified load balancers.
  Future<void> describeTags(List<String> loadBalancerNames) async {}

  /// Removes the specified subnets from the set of configured subnets for the
  /// load balancer.
  ///
  /// After a subnet is removed, all EC2 instances registered with the load
  /// balancer in the removed subnet go into the `OutOfService` state. Then, the
  /// load balancer balances the traffic among the remaining routable subnets.
  Future<void> detachLoadBalancerFromSubnets(
      {@required String loadBalancerName,
      @required List<String> subnets}) async {}

  /// Removes the specified Availability Zones from the set of Availability
  /// Zones for the specified load balancer in EC2-Classic or a default VPC.
  ///
  /// For load balancers in a non-default VPC, use
  /// DetachLoadBalancerFromSubnets.
  ///
  /// There must be at least one Availability Zone registered with a load
  /// balancer at all times. After an Availability Zone is removed, all
  /// instances registered with the load balancer that are in the removed
  /// Availability Zone go into the `OutOfService` state. Then, the load
  /// balancer attempts to equally balance the traffic among its remaining
  /// Availability Zones.
  ///
  /// For more information, see [Add or Remove Availability
  /// Zones](http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/enable-disable-az.html)
  /// in the _Classic Load Balancers Guide_.
  Future<void> disableAvailabilityZonesForLoadBalancer(
      {@required String loadBalancerName,
      @required List<String> availabilityZones}) async {}

  /// Adds the specified Availability Zones to the set of Availability Zones for
  /// the specified load balancer in EC2-Classic or a default VPC.
  ///
  /// For load balancers in a non-default VPC, use AttachLoadBalancerToSubnets.
  ///
  /// The load balancer evenly distributes requests across all its registered
  /// Availability Zones that contain instances. For more information, see [Add
  /// or Remove Availability
  /// Zones](http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/enable-disable-az.html)
  /// in the _Classic Load Balancers Guide_.
  Future<void> enableAvailabilityZonesForLoadBalancer(
      {@required String loadBalancerName,
      @required List<String> availabilityZones}) async {}

  /// Modifies the attributes of the specified load balancer.
  ///
  /// You can modify the load balancer attributes, such as `AccessLogs`,
  /// `ConnectionDraining`, and `CrossZoneLoadBalancing` by either enabling or
  /// disabling them. Or, you can modify the load balancer attribute
  /// `ConnectionSettings` by specifying an idle connection timeout value for
  /// your load balancer.
  ///
  /// For more information, see the following in the _Classic Load Balancers
  /// Guide_:
  ///
  /// *    [Cross-Zone Load
  /// Balancing](http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/enable-disable-crosszone-lb.html)
  ///
  /// *    [Connection
  /// Draining](http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/config-conn-drain.html)
  ///
  /// *    [Access
  /// Logs](http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/access-log-collection.html)
  ///
  /// *    [Idle Connection
  /// Timeout](http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/config-idle-timeout.html)
  Future<void> modifyLoadBalancerAttributes(
      {@required String loadBalancerName,
      @required LoadBalancerAttributes loadBalancerAttributes}) async {}

  /// Adds the specified instances to the specified load balancer.
  ///
  /// The instance must be a running instance in the same network as the load
  /// balancer (EC2-Classic or the same VPC). If you have EC2-Classic instances
  /// and a load balancer in a VPC with ClassicLink enabled, you can link the
  /// EC2-Classic instances to that VPC and then register the linked EC2-Classic
  /// instances with the load balancer in the VPC.
  ///
  /// Note that `RegisterInstanceWithLoadBalancer` completes when the request
  /// has been registered. Instance registration takes a little time to
  /// complete. To check the state of the registered instances, use
  /// DescribeLoadBalancers or DescribeInstanceHealth.
  ///
  /// After the instance is registered, it starts receiving traffic and requests
  /// from the load balancer. Any instance that is not in one of the
  /// Availability Zones registered for the load balancer is moved to the
  /// `OutOfService` state. If an Availability Zone is added to the load
  /// balancer later, any instances registered with the load balancer move to
  /// the `InService` state.
  ///
  /// To deregister instances from a load balancer, use
  /// DeregisterInstancesFromLoadBalancer.
  ///
  /// For more information, see [Register or De-Register EC2
  /// Instances](http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-deregister-register-instances.html)
  /// in the _Classic Load Balancers Guide_.
  Future<void> registerInstancesWithLoadBalancer(
      {@required String loadBalancerName,
      @required List<Instance> instances}) async {}

  /// Removes one or more tags from the specified load balancer.
  Future<void> removeTags(
      {@required List<String> loadBalancerNames,
      @required List<TagKeyOnly> tags}) async {}

  /// Sets the certificate that terminates the specified listener's SSL
  /// connections. The specified certificate replaces any prior certificate that
  /// was used on the same load balancer and port.
  ///
  /// For more information about updating your SSL certificate, see [Replace the
  /// SSL Certificate for Your Load
  /// Balancer](http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-update-ssl-cert.html)
  /// in the _Classic Load Balancers Guide_.
  Future<void> setLoadBalancerListenerSslCertificate(
      {@required String loadBalancerName,
      @required int loadBalancerPort,
      @required String sslCertificateId}) async {}

  /// Replaces the set of policies associated with the specified port on which
  /// the EC2 instance is listening with a new set of policies. At this time,
  /// only the back-end server authentication policy type can be applied to the
  /// instance ports; this policy type is composed of multiple public key
  /// policies.
  ///
  /// Each time you use `SetLoadBalancerPoliciesForBackendServer` to enable the
  /// policies, use the `PolicyNames` parameter to list the policies that you
  /// want to enable.
  ///
  /// You can use DescribeLoadBalancers or DescribeLoadBalancerPolicies to
  /// verify that the policy is associated with the EC2 instance.
  ///
  /// For more information about enabling back-end instance authentication, see
  /// [Configure Back-end Instance
  /// Authentication](http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-create-https-ssl-load-balancer.html#configure_backendauth_clt)
  /// in the _Classic Load Balancers Guide_. For more information about Proxy
  /// Protocol, see [Configure Proxy Protocol
  /// Support](http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/enable-proxy-protocol.html)
  /// in the _Classic Load Balancers Guide_.
  Future<void> setLoadBalancerPoliciesForBackendServer(
      {@required String loadBalancerName,
      @required int instancePort,
      @required List<String> policyNames}) async {}

  /// Replaces the current set of policies for the specified load balancer port
  /// with the specified set of policies.
  ///
  /// To enable back-end server authentication, use
  /// SetLoadBalancerPoliciesForBackendServer.
  ///
  /// For more information about setting policies, see [Update the SSL
  /// Negotiation
  /// Configuration](http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/ssl-config-update.html),
  /// [Duration-Based Session
  /// Stickiness](http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-sticky-sessions.html#enable-sticky-sessions-duration),
  /// and [Application-Controlled Session
  /// Stickiness](http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-sticky-sessions.html#enable-sticky-sessions-application)
  /// in the _Classic Load Balancers Guide_.
  Future<void> setLoadBalancerPoliciesOfListener(
      {@required String loadBalancerName,
      @required int loadBalancerPort,
      @required List<String> policyNames}) async {}
}

class AccessLog {}

class AddAvailabilityZonesOutput {}

class AddTagsOutput {}

class AdditionalAttribute {}

class AppCookieStickinessPolicy {}

class ApplySecurityGroupsToLoadBalancerOutput {}

class AttachLoadBalancerToSubnetsOutput {}

class BackendServerDescription {}

class ConfigureHealthCheckOutput {}

class ConnectionDraining {}

class ConnectionSettings {}

class CreateAccessPointOutput {}

class CreateAppCookieStickinessPolicyOutput {}

class CreateLBCookieStickinessPolicyOutput {}

class CreateLoadBalancerListenerOutput {}

class CreateLoadBalancerPolicyOutput {}

class CrossZoneLoadBalancing {}

class DeleteAccessPointOutput {}

class DeleteLoadBalancerListenerOutput {}

class DeleteLoadBalancerPolicyOutput {}

class DeregisterEndPointsOutput {}

class DescribeAccessPointsOutput {}

class DescribeAccountLimitsOutput {}

class DescribeEndPointStateOutput {}

class DescribeLoadBalancerAttributesOutput {}

class DescribeLoadBalancerPoliciesOutput {}

class DescribeLoadBalancerPolicyTypesOutput {}

class DescribeTagsOutput {}

class DetachLoadBalancerFromSubnetsOutput {}

class HealthCheck {}

class Instance {}

class InstanceState {}

class LBCookieStickinessPolicy {}

class Limit {}

class Listener {}

class ListenerDescription {}

class LoadBalancerAttributes {}

class LoadBalancerDescription {}

class ModifyLoadBalancerAttributesOutput {}

class Policies {}

class PolicyAttribute {}

class PolicyAttributeDescription {}

class PolicyAttributeTypeDescription {}

class PolicyDescription {}

class PolicyTypeDescription {}

class RegisterEndPointsOutput {}

class RemoveAvailabilityZonesOutput {}

class RemoveTagsOutput {}

class SetLoadBalancerListenerSslCertificateOutput {}

class SetLoadBalancerPoliciesForBackendServerOutput {}

class SetLoadBalancerPoliciesOfListenerOutput {}

class SourceSecurityGroup {}

class Tag {}

class TagDescription {}

class TagKeyOnly {}
