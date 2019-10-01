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
/// information, see the
/// [Elastic Load Balancing User Guide](http://docs.aws.amazon.com/elasticloadbalancing/latest/userguide/).
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
  /// For more information, see
  /// [Tag Your Classic Load Balancer](http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/add-remove-tags.html)
  /// in the _Classic Load Balancers Guide_.
  ///
  /// [loadBalancerNames]: The name of the load balancer. You can specify one
  /// load balancer only.
  ///
  /// [tags]: The tags.
  Future<AddTagsOutput> addTags(
      {@required List<String> loadBalancerNames,
      @required List<Tag> tags}) async {
    return AddTagsOutput.fromJson({});
  }

  /// Associates one or more security groups with your load balancer in a
  /// virtual private cloud (VPC). The specified security groups override the
  /// previously associated security groups.
  ///
  /// For more information, see
  /// [Security Groups for Load Balancers in a VPC](http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-security-groups.html#elb-vpc-security-groups)
  /// in the _Classic Load Balancers Guide_.
  ///
  /// [loadBalancerName]: The name of the load balancer.
  ///
  /// [securityGroups]: The IDs of the security groups to associate with the
  /// load balancer. Note that you cannot specify the name of the security
  /// group.
  Future<ApplySecurityGroupsToLoadBalancerOutput>
      applySecurityGroupsToLoadBalancer(
          {@required String loadBalancerName,
          @required List<String> securityGroups}) async {
    return ApplySecurityGroupsToLoadBalancerOutput.fromJson({});
  }

  /// Adds one or more subnets to the set of configured subnets for the
  /// specified load balancer.
  ///
  /// The load balancer evenly distributes requests across all registered
  /// subnets. For more information, see
  /// [Add or Remove Subnets for Your Load Balancer in a VPC](http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-manage-subnets.html)
  /// in the _Classic Load Balancers Guide_.
  ///
  /// [loadBalancerName]: The name of the load balancer.
  ///
  /// [subnets]: The IDs of the subnets to add. You can add only one subnet per
  /// Availability Zone.
  Future<AttachLoadBalancerToSubnetsOutput> attachLoadBalancerToSubnets(
      {@required String loadBalancerName,
      @required List<String> subnets}) async {
    return AttachLoadBalancerToSubnetsOutput.fromJson({});
  }

  /// Specifies the health check settings to use when evaluating the health
  /// state of your EC2 instances.
  ///
  /// For more information, see
  /// [Configure Health Checks for Your Load Balancer](http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-healthchecks.html)
  /// in the _Classic Load Balancers Guide_.
  ///
  /// [loadBalancerName]: The name of the load balancer.
  ///
  /// [healthCheck]: The configuration information.
  Future<ConfigureHealthCheckOutput> configureHealthCheck(
      {@required String loadBalancerName,
      @required HealthCheck healthCheck}) async {
    return ConfigureHealthCheckOutput.fromJson({});
  }

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
  /// For more information, see
  /// [Application-Controlled Session Stickiness](http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-sticky-sessions.html#enable-sticky-sessions-application)
  /// in the _Classic Load Balancers Guide_.
  ///
  /// [loadBalancerName]: The name of the load balancer.
  ///
  /// [policyName]: The name of the policy being created. Policy names must
  /// consist of alphanumeric characters and dashes (-). This name must be
  /// unique within the set of policies for this load balancer.
  ///
  /// [cookieName]: The name of the application cookie used for stickiness.
  Future<CreateAppCookieStickinessPolicyOutput> createAppCookieStickinessPolicy(
      {@required String loadBalancerName,
      @required String policyName,
      @required String cookieName}) async {
    return CreateAppCookieStickinessPolicyOutput.fromJson({});
  }

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
  /// For more information, see
  /// [Duration-Based Session Stickiness](http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-sticky-sessions.html#enable-sticky-sessions-duration)
  /// in the _Classic Load Balancers Guide_.
  ///
  /// [loadBalancerName]: The name of the load balancer.
  ///
  /// [policyName]: The name of the policy being created. Policy names must
  /// consist of alphanumeric characters and dashes (-). This name must be
  /// unique within the set of policies for this load balancer.
  ///
  /// [cookieExpirationPeriod]: The time period, in seconds, after which the
  /// cookie should be considered stale. If you do not specify this parameter,
  /// the default value is 0, which indicates that the sticky session should
  /// last for the duration of the browser session.
  Future<CreateLBCookieStickinessPolicyOutput> createLBCookieStickinessPolicy(
      {@required String loadBalancerName,
      @required String policyName,
      BigInt cookieExpirationPeriod}) async {
    return CreateLBCookieStickinessPolicyOutput.fromJson({});
  }

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
  /// more information, see
  /// [Limits for Your Classic Load Balancer](http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-limits.html)
  /// in the _Classic Load Balancers Guide_.
  ///
  /// [loadBalancerName]: The name of the load balancer.
  ///
  /// This name must be unique within your set of load balancers for the region,
  /// must have a maximum of 32 characters, must contain only alphanumeric
  /// characters or hyphens, and cannot begin or end with a hyphen.
  ///
  /// [listeners]: The listeners.
  ///
  /// For more information, see
  /// [Listeners for Your Classic Load Balancer](http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-listener-config.html)
  /// in the _Classic Load Balancers Guide_.
  ///
  /// [availabilityZones]: One or more Availability Zones from the same region
  /// as the load balancer.
  ///
  /// You must specify at least one Availability Zone.
  ///
  /// You can add more Availability Zones after you create the load balancer
  /// using EnableAvailabilityZonesForLoadBalancer.
  ///
  /// [subnets]: The IDs of the subnets in your VPC to attach to the load
  /// balancer. Specify one subnet per Availability Zone specified in
  /// `AvailabilityZones`.
  ///
  /// [securityGroups]: The IDs of the security groups to assign to the load
  /// balancer.
  ///
  /// [scheme]: The type of a load balancer. Valid only for load balancers in a
  /// VPC.
  ///
  /// By default, Elastic Load Balancing creates an Internet-facing load
  /// balancer with a DNS name that resolves to public IP addresses. For more
  /// information about Internet-facing and Internal load balancers, see
  /// [Load Balancer Scheme](http://docs.aws.amazon.com/elasticloadbalancing/latest/userguide/how-elastic-load-balancing-works.html#load-balancer-scheme)
  /// in the _Elastic Load Balancing User Guide_.
  ///
  /// Specify `internal` to create a load balancer with a DNS name that resolves
  /// to private IP addresses.
  ///
  /// [tags]: A list of tags to assign to the load balancer.
  ///
  /// For more information about tagging your load balancer, see
  /// [Tag Your Classic Load Balancer](http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/add-remove-tags.html)
  /// in the _Classic Load Balancers Guide_.
  Future<CreateAccessPointOutput> createLoadBalancer(
      {@required String loadBalancerName,
      @required List<Listener> listeners,
      List<String> availabilityZones,
      List<String> subnets,
      List<String> securityGroups,
      String scheme,
      List<Tag> tags}) async {
    return CreateAccessPointOutput.fromJson({});
  }

  /// Creates one or more listeners for the specified load balancer. If a
  /// listener with the specified port does not already exist, it is created;
  /// otherwise, the properties of the new listener must match the properties of
  /// the existing listener.
  ///
  /// For more information, see
  /// [Listeners for Your Classic Load Balancer](http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-listener-config.html)
  /// in the _Classic Load Balancers Guide_.
  ///
  /// [loadBalancerName]: The name of the load balancer.
  ///
  /// [listeners]: The listeners.
  Future<CreateLoadBalancerListenerOutput> createLoadBalancerListeners(
      {@required String loadBalancerName,
      @required List<Listener> listeners}) async {
    return CreateLoadBalancerListenerOutput.fromJson({});
  }

  /// Creates a policy with the specified attributes for the specified load
  /// balancer.
  ///
  /// Policies are settings that are saved for your load balancer and that can
  /// be applied to the listener or the application server, depending on the
  /// policy type.
  ///
  /// [loadBalancerName]: The name of the load balancer.
  ///
  /// [policyName]: The name of the load balancer policy to be created. This
  /// name must be unique within the set of policies for this load balancer.
  ///
  /// [policyTypeName]: The name of the base policy type. To get the list of
  /// policy types, use DescribeLoadBalancerPolicyTypes.
  ///
  /// [policyAttributes]: The policy attributes.
  Future<CreateLoadBalancerPolicyOutput> createLoadBalancerPolicy(
      {@required String loadBalancerName,
      @required String policyName,
      @required String policyTypeName,
      List<PolicyAttribute> policyAttributes}) async {
    return CreateLoadBalancerPolicyOutput.fromJson({});
  }

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
  ///
  /// [loadBalancerName]: The name of the load balancer.
  Future<DeleteAccessPointOutput> deleteLoadBalancer(
      String loadBalancerName) async {
    return DeleteAccessPointOutput.fromJson({});
  }

  /// Deletes the specified listeners from the specified load balancer.
  ///
  /// [loadBalancerName]: The name of the load balancer.
  ///
  /// [loadBalancerPorts]: The client port numbers of the listeners.
  Future<DeleteLoadBalancerListenerOutput> deleteLoadBalancerListeners(
      {@required String loadBalancerName,
      @required List<int> loadBalancerPorts}) async {
    return DeleteLoadBalancerListenerOutput.fromJson({});
  }

  /// Deletes the specified policy from the specified load balancer. This policy
  /// must not be enabled for any listeners.
  ///
  /// [loadBalancerName]: The name of the load balancer.
  ///
  /// [policyName]: The name of the policy.
  Future<DeleteLoadBalancerPolicyOutput> deleteLoadBalancerPolicy(
      {@required String loadBalancerName, @required String policyName}) async {
    return DeleteLoadBalancerPolicyOutput.fromJson({});
  }

  /// Deregisters the specified instances from the specified load balancer.
  /// After the instance is deregistered, it no longer receives traffic from the
  /// load balancer.
  ///
  /// You can use DescribeLoadBalancers to verify that the instance is
  /// deregistered from the load balancer.
  ///
  /// For more information, see
  /// [Register or De-Register EC2 Instances](http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-deregister-register-instances.html)
  /// in the _Classic Load Balancers Guide_.
  ///
  /// [loadBalancerName]: The name of the load balancer.
  ///
  /// [instances]: The IDs of the instances.
  Future<DeregisterEndPointsOutput> deregisterInstancesFromLoadBalancer(
      {@required String loadBalancerName,
      @required List<Instance> instances}) async {
    return DeregisterEndPointsOutput.fromJson({});
  }

  /// Describes the current Elastic Load Balancing resource limits for your AWS
  /// account.
  ///
  /// For more information, see
  /// [Limits for Your Classic Load Balancer](http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-limits.html)
  /// in the _Classic Load Balancers Guide_.
  ///
  /// [marker]: The marker for the next set of results. (You received this
  /// marker from a previous call.)
  ///
  /// [pageSize]: The maximum number of results to return with this call.
  Future<DescribeAccountLimitsOutput> describeAccountLimits(
      {String marker, int pageSize}) async {
    return DescribeAccountLimitsOutput.fromJson({});
  }

  /// Describes the state of the specified instances with respect to the
  /// specified load balancer. If no instances are specified, the call describes
  /// the state of all instances that are currently registered with the load
  /// balancer. If instances are specified, their state is returned even if they
  /// are no longer registered with the load balancer. The state of terminated
  /// instances is not returned.
  ///
  /// [loadBalancerName]: The name of the load balancer.
  ///
  /// [instances]: The IDs of the instances.
  Future<DescribeEndPointStateOutput> describeInstanceHealth(
      String loadBalancerName,
      {List<Instance> instances}) async {
    return DescribeEndPointStateOutput.fromJson({});
  }

  /// Describes the attributes for the specified load balancer.
  ///
  /// [loadBalancerName]: The name of the load balancer.
  Future<DescribeLoadBalancerAttributesOutput> describeLoadBalancerAttributes(
      String loadBalancerName) async {
    return DescribeLoadBalancerAttributesOutput.fromJson({});
  }

  /// Describes the specified policies.
  ///
  /// If you specify a load balancer name, the action returns the descriptions
  /// of all policies created for the load balancer. If you specify a policy
  /// name associated with your load balancer, the action returns the
  /// description of that policy. If you don't specify a load balancer name, the
  /// action returns descriptions of the specified sample policies, or
  /// descriptions of all sample policies. The names of the sample policies have
  /// the `ELBSample-` prefix.
  ///
  /// [loadBalancerName]: The name of the load balancer.
  ///
  /// [policyNames]: The names of the policies.
  Future<DescribeLoadBalancerPoliciesOutput> describeLoadBalancerPolicies(
      {String loadBalancerName, List<String> policyNames}) async {
    return DescribeLoadBalancerPoliciesOutput.fromJson({});
  }

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
  ///
  /// [policyTypeNames]: The names of the policy types. If no names are
  /// specified, describes all policy types defined by Elastic Load Balancing.
  Future<DescribeLoadBalancerPolicyTypesOutput> describeLoadBalancerPolicyTypes(
      {List<String> policyTypeNames}) async {
    return DescribeLoadBalancerPolicyTypesOutput.fromJson({});
  }

  /// Describes the specified the load balancers. If no load balancers are
  /// specified, the call describes all of your load balancers.
  ///
  /// [loadBalancerNames]: The names of the load balancers.
  ///
  /// [marker]: The marker for the next set of results. (You received this
  /// marker from a previous call.)
  ///
  /// [pageSize]: The maximum number of results to return with this call (a
  /// number from 1 to 400). The default is 400.
  Future<DescribeAccessPointsOutput> describeLoadBalancers(
      {List<String> loadBalancerNames, String marker, int pageSize}) async {
    return DescribeAccessPointsOutput.fromJson({});
  }

  /// Describes the tags associated with the specified load balancers.
  ///
  /// [loadBalancerNames]: The names of the load balancers.
  Future<DescribeTagsOutput> describeTags(
      List<String> loadBalancerNames) async {
    return DescribeTagsOutput.fromJson({});
  }

  /// Removes the specified subnets from the set of configured subnets for the
  /// load balancer.
  ///
  /// After a subnet is removed, all EC2 instances registered with the load
  /// balancer in the removed subnet go into the `OutOfService` state. Then, the
  /// load balancer balances the traffic among the remaining routable subnets.
  ///
  /// [loadBalancerName]: The name of the load balancer.
  ///
  /// [subnets]: The IDs of the subnets.
  Future<DetachLoadBalancerFromSubnetsOutput> detachLoadBalancerFromSubnets(
      {@required String loadBalancerName,
      @required List<String> subnets}) async {
    return DetachLoadBalancerFromSubnetsOutput.fromJson({});
  }

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
  /// For more information, see
  /// [Add or Remove Availability Zones](http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/enable-disable-az.html)
  /// in the _Classic Load Balancers Guide_.
  ///
  /// [loadBalancerName]: The name of the load balancer.
  ///
  /// [availabilityZones]: The Availability Zones.
  Future<RemoveAvailabilityZonesOutput> disableAvailabilityZonesForLoadBalancer(
      {@required String loadBalancerName,
      @required List<String> availabilityZones}) async {
    return RemoveAvailabilityZonesOutput.fromJson({});
  }

  /// Adds the specified Availability Zones to the set of Availability Zones for
  /// the specified load balancer in EC2-Classic or a default VPC.
  ///
  /// For load balancers in a non-default VPC, use AttachLoadBalancerToSubnets.
  ///
  /// The load balancer evenly distributes requests across all its registered
  /// Availability Zones that contain instances. For more information, see
  /// [Add or Remove Availability Zones](http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/enable-disable-az.html)
  /// in the _Classic Load Balancers Guide_.
  ///
  /// [loadBalancerName]: The name of the load balancer.
  ///
  /// [availabilityZones]: The Availability Zones. These must be in the same
  /// region as the load balancer.
  Future<AddAvailabilityZonesOutput> enableAvailabilityZonesForLoadBalancer(
      {@required String loadBalancerName,
      @required List<String> availabilityZones}) async {
    return AddAvailabilityZonesOutput.fromJson({});
  }

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
  /// *
  /// [Cross-Zone Load Balancing](http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/enable-disable-crosszone-lb.html)
  ///
  /// *
  /// [Connection Draining](http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/config-conn-drain.html)
  ///
  /// *
  /// [Access Logs](http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/access-log-collection.html)
  ///
  /// *
  /// [Idle Connection Timeout](http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/config-idle-timeout.html)
  ///
  /// [loadBalancerName]: The name of the load balancer.
  ///
  /// [loadBalancerAttributes]: The attributes for the load balancer.
  Future<ModifyLoadBalancerAttributesOutput> modifyLoadBalancerAttributes(
      {@required String loadBalancerName,
      @required LoadBalancerAttributes loadBalancerAttributes}) async {
    return ModifyLoadBalancerAttributesOutput.fromJson({});
  }

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
  /// For more information, see
  /// [Register or De-Register EC2 Instances](http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-deregister-register-instances.html)
  /// in the _Classic Load Balancers Guide_.
  ///
  /// [loadBalancerName]: The name of the load balancer.
  ///
  /// [instances]: The IDs of the instances.
  Future<RegisterEndPointsOutput> registerInstancesWithLoadBalancer(
      {@required String loadBalancerName,
      @required List<Instance> instances}) async {
    return RegisterEndPointsOutput.fromJson({});
  }

  /// Removes one or more tags from the specified load balancer.
  ///
  /// [loadBalancerNames]: The name of the load balancer. You can specify a
  /// maximum of one load balancer name.
  ///
  /// [tags]: The list of tag keys to remove.
  Future<RemoveTagsOutput> removeTags(
      {@required List<String> loadBalancerNames,
      @required List<TagKeyOnly> tags}) async {
    return RemoveTagsOutput.fromJson({});
  }

  /// Sets the certificate that terminates the specified listener's SSL
  /// connections. The specified certificate replaces any prior certificate that
  /// was used on the same load balancer and port.
  ///
  /// For more information about updating your SSL certificate, see
  /// [Replace the SSL Certificate for Your Load Balancer](http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-update-ssl-cert.html)
  /// in the _Classic Load Balancers Guide_.
  ///
  /// [loadBalancerName]: The name of the load balancer.
  ///
  /// [loadBalancerPort]: The port that uses the specified SSL certificate.
  ///
  /// [sslCertificateId]: The Amazon Resource Name (ARN) of the SSL certificate.
  Future<SetLoadBalancerListenerSslCertificateOutput>
      setLoadBalancerListenerSslCertificate(
          {@required String loadBalancerName,
          @required int loadBalancerPort,
          @required String sslCertificateId}) async {
    return SetLoadBalancerListenerSslCertificateOutput.fromJson({});
  }

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
  /// [Configure Back-end Instance Authentication](http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-create-https-ssl-load-balancer.html#configure_backendauth_clt)
  /// in the _Classic Load Balancers Guide_. For more information about Proxy
  /// Protocol, see
  /// [Configure Proxy Protocol Support](http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/enable-proxy-protocol.html)
  /// in the _Classic Load Balancers Guide_.
  ///
  /// [loadBalancerName]: The name of the load balancer.
  ///
  /// [instancePort]: The port number associated with the EC2 instance.
  ///
  /// [policyNames]: The names of the policies. If the list is empty, then all
  /// current polices are removed from the EC2 instance.
  Future<SetLoadBalancerPoliciesForBackendServerOutput>
      setLoadBalancerPoliciesForBackendServer(
          {@required String loadBalancerName,
          @required int instancePort,
          @required List<String> policyNames}) async {
    return SetLoadBalancerPoliciesForBackendServerOutput.fromJson({});
  }

  /// Replaces the current set of policies for the specified load balancer port
  /// with the specified set of policies.
  ///
  /// To enable back-end server authentication, use
  /// SetLoadBalancerPoliciesForBackendServer.
  ///
  /// For more information about setting policies, see
  /// [Update the SSL Negotiation Configuration](http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/ssl-config-update.html),
  /// [Duration-Based Session Stickiness](http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-sticky-sessions.html#enable-sticky-sessions-duration),
  /// and
  /// [Application-Controlled Session Stickiness](http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-sticky-sessions.html#enable-sticky-sessions-application)
  /// in the _Classic Load Balancers Guide_.
  ///
  /// [loadBalancerName]: The name of the load balancer.
  ///
  /// [loadBalancerPort]: The external port of the load balancer.
  ///
  /// [policyNames]: The names of the policies. This list must include all
  /// policies to be enabled. If you omit a policy that is currently enabled, it
  /// is disabled. If the list is empty, all current policies are disabled.
  Future<SetLoadBalancerPoliciesOfListenerOutput>
      setLoadBalancerPoliciesOfListener(
          {@required String loadBalancerName,
          @required int loadBalancerPort,
          @required List<String> policyNames}) async {
    return SetLoadBalancerPoliciesOfListenerOutput.fromJson({});
  }
}

/// Information about the `AccessLog` attribute.
class AccessLog {
  /// Specifies whether access logs are enabled for the load balancer.
  final bool enabled;

  /// The name of the Amazon S3 bucket where the access logs are stored.
  final String s3BucketName;

  /// The interval for publishing the access logs. You can specify an interval
  /// of either 5 minutes or 60 minutes.
  ///
  /// Default: 60 minutes
  final int emitInterval;

  /// The logical hierarchy you created for your Amazon S3 bucket, for example
  /// `my-bucket-prefix/prod`. If the prefix is not provided, the log is placed
  /// at the root level of the bucket.
  final String s3BucketPrefix;

  AccessLog({
    @required this.enabled,
    this.s3BucketName,
    this.emitInterval,
    this.s3BucketPrefix,
  });
  static AccessLog fromJson(Map<String, dynamic> json) => AccessLog();
}

/// Contains the output of EnableAvailabilityZonesForLoadBalancer.
class AddAvailabilityZonesOutput {
  /// The updated list of Availability Zones for the load balancer.
  final List<String> availabilityZones;

  AddAvailabilityZonesOutput({
    this.availabilityZones,
  });
  static AddAvailabilityZonesOutput fromJson(Map<String, dynamic> json) =>
      AddAvailabilityZonesOutput();
}

/// Contains the output of AddTags.
class AddTagsOutput {
  AddTagsOutput();
  static AddTagsOutput fromJson(Map<String, dynamic> json) => AddTagsOutput();
}

/// This data type is reserved.
class AdditionalAttribute {
  /// This parameter is reserved.
  final String key;

  /// This parameter is reserved.
  final String value;

  AdditionalAttribute({
    this.key,
    this.value,
  });
  static AdditionalAttribute fromJson(Map<String, dynamic> json) =>
      AdditionalAttribute();
}

/// Information about a policy for application-controlled session stickiness.
class AppCookieStickinessPolicy {
  /// The mnemonic name for the policy being created. The name must be unique
  /// within a set of policies for this load balancer.
  final String policyName;

  /// The name of the application cookie used for stickiness.
  final String cookieName;

  AppCookieStickinessPolicy({
    this.policyName,
    this.cookieName,
  });
  static AppCookieStickinessPolicy fromJson(Map<String, dynamic> json) =>
      AppCookieStickinessPolicy();
}

/// Contains the output of ApplySecurityGroupsToLoadBalancer.
class ApplySecurityGroupsToLoadBalancerOutput {
  /// The IDs of the security groups associated with the load balancer.
  final List<String> securityGroups;

  ApplySecurityGroupsToLoadBalancerOutput({
    this.securityGroups,
  });
  static ApplySecurityGroupsToLoadBalancerOutput fromJson(
          Map<String, dynamic> json) =>
      ApplySecurityGroupsToLoadBalancerOutput();
}

/// Contains the output of AttachLoadBalancerToSubnets.
class AttachLoadBalancerToSubnetsOutput {
  /// The IDs of the subnets attached to the load balancer.
  final List<String> subnets;

  AttachLoadBalancerToSubnetsOutput({
    this.subnets,
  });
  static AttachLoadBalancerToSubnetsOutput fromJson(
          Map<String, dynamic> json) =>
      AttachLoadBalancerToSubnetsOutput();
}

/// Information about the configuration of an EC2 instance.
class BackendServerDescription {
  /// The port on which the EC2 instance is listening.
  final int instancePort;

  /// The names of the policies enabled for the EC2 instance.
  final List<String> policyNames;

  BackendServerDescription({
    this.instancePort,
    this.policyNames,
  });
  static BackendServerDescription fromJson(Map<String, dynamic> json) =>
      BackendServerDescription();
}

/// Contains the output of ConfigureHealthCheck.
class ConfigureHealthCheckOutput {
  /// The updated health check.
  final HealthCheck healthCheck;

  ConfigureHealthCheckOutput({
    this.healthCheck,
  });
  static ConfigureHealthCheckOutput fromJson(Map<String, dynamic> json) =>
      ConfigureHealthCheckOutput();
}

/// Information about the `ConnectionDraining` attribute.
class ConnectionDraining {
  /// Specifies whether connection draining is enabled for the load balancer.
  final bool enabled;

  /// The maximum time, in seconds, to keep the existing connections open before
  /// deregistering the instances.
  final int timeout;

  ConnectionDraining({
    @required this.enabled,
    this.timeout,
  });
  static ConnectionDraining fromJson(Map<String, dynamic> json) =>
      ConnectionDraining();
}

/// Information about the `ConnectionSettings` attribute.
class ConnectionSettings {
  /// The time, in seconds, that the connection is allowed to be idle (no data
  /// has been sent over the connection) before it is closed by the load
  /// balancer.
  final int idleTimeout;

  ConnectionSettings({
    @required this.idleTimeout,
  });
  static ConnectionSettings fromJson(Map<String, dynamic> json) =>
      ConnectionSettings();
}

/// Contains the output for CreateLoadBalancer.
class CreateAccessPointOutput {
  /// The DNS name of the load balancer.
  final String dnsName;

  CreateAccessPointOutput({
    this.dnsName,
  });
  static CreateAccessPointOutput fromJson(Map<String, dynamic> json) =>
      CreateAccessPointOutput();
}

/// Contains the output for CreateAppCookieStickinessPolicy.
class CreateAppCookieStickinessPolicyOutput {
  CreateAppCookieStickinessPolicyOutput();
  static CreateAppCookieStickinessPolicyOutput fromJson(
          Map<String, dynamic> json) =>
      CreateAppCookieStickinessPolicyOutput();
}

/// Contains the output for CreateLBCookieStickinessPolicy.
class CreateLBCookieStickinessPolicyOutput {
  CreateLBCookieStickinessPolicyOutput();
  static CreateLBCookieStickinessPolicyOutput fromJson(
          Map<String, dynamic> json) =>
      CreateLBCookieStickinessPolicyOutput();
}

/// Contains the parameters for CreateLoadBalancerListener.
class CreateLoadBalancerListenerOutput {
  CreateLoadBalancerListenerOutput();
  static CreateLoadBalancerListenerOutput fromJson(Map<String, dynamic> json) =>
      CreateLoadBalancerListenerOutput();
}

/// Contains the output of CreateLoadBalancerPolicy.
class CreateLoadBalancerPolicyOutput {
  CreateLoadBalancerPolicyOutput();
  static CreateLoadBalancerPolicyOutput fromJson(Map<String, dynamic> json) =>
      CreateLoadBalancerPolicyOutput();
}

/// Information about the `CrossZoneLoadBalancing` attribute.
class CrossZoneLoadBalancing {
  /// Specifies whether cross-zone load balancing is enabled for the load
  /// balancer.
  final bool enabled;

  CrossZoneLoadBalancing({
    @required this.enabled,
  });
  static CrossZoneLoadBalancing fromJson(Map<String, dynamic> json) =>
      CrossZoneLoadBalancing();
}

/// Contains the output of DeleteLoadBalancer.
class DeleteAccessPointOutput {
  DeleteAccessPointOutput();
  static DeleteAccessPointOutput fromJson(Map<String, dynamic> json) =>
      DeleteAccessPointOutput();
}

/// Contains the output of DeleteLoadBalancerListeners.
class DeleteLoadBalancerListenerOutput {
  DeleteLoadBalancerListenerOutput();
  static DeleteLoadBalancerListenerOutput fromJson(Map<String, dynamic> json) =>
      DeleteLoadBalancerListenerOutput();
}

/// Contains the output of DeleteLoadBalancerPolicy.
class DeleteLoadBalancerPolicyOutput {
  DeleteLoadBalancerPolicyOutput();
  static DeleteLoadBalancerPolicyOutput fromJson(Map<String, dynamic> json) =>
      DeleteLoadBalancerPolicyOutput();
}

/// Contains the output of DeregisterInstancesFromLoadBalancer.
class DeregisterEndPointsOutput {
  /// The remaining instances registered with the load balancer.
  final List<Instance> instances;

  DeregisterEndPointsOutput({
    this.instances,
  });
  static DeregisterEndPointsOutput fromJson(Map<String, dynamic> json) =>
      DeregisterEndPointsOutput();
}

/// Contains the parameters for DescribeLoadBalancers.
class DescribeAccessPointsOutput {
  /// Information about the load balancers.
  final List<LoadBalancerDescription> loadBalancerDescriptions;

  /// The marker to use when requesting the next set of results. If there are no
  /// additional results, the string is empty.
  final String nextMarker;

  DescribeAccessPointsOutput({
    this.loadBalancerDescriptions,
    this.nextMarker,
  });
  static DescribeAccessPointsOutput fromJson(Map<String, dynamic> json) =>
      DescribeAccessPointsOutput();
}

class DescribeAccountLimitsOutput {
  /// Information about the limits.
  final List<Limit> limits;

  /// The marker to use when requesting the next set of results. If there are no
  /// additional results, the string is empty.
  final String nextMarker;

  DescribeAccountLimitsOutput({
    this.limits,
    this.nextMarker,
  });
  static DescribeAccountLimitsOutput fromJson(Map<String, dynamic> json) =>
      DescribeAccountLimitsOutput();
}

/// Contains the output for DescribeInstanceHealth.
class DescribeEndPointStateOutput {
  /// Information about the health of the instances.
  final List<InstanceState> instanceStates;

  DescribeEndPointStateOutput({
    this.instanceStates,
  });
  static DescribeEndPointStateOutput fromJson(Map<String, dynamic> json) =>
      DescribeEndPointStateOutput();
}

/// Contains the output of DescribeLoadBalancerAttributes.
class DescribeLoadBalancerAttributesOutput {
  /// Information about the load balancer attributes.
  final LoadBalancerAttributes loadBalancerAttributes;

  DescribeLoadBalancerAttributesOutput({
    this.loadBalancerAttributes,
  });
  static DescribeLoadBalancerAttributesOutput fromJson(
          Map<String, dynamic> json) =>
      DescribeLoadBalancerAttributesOutput();
}

/// Contains the output of DescribeLoadBalancerPolicies.
class DescribeLoadBalancerPoliciesOutput {
  /// Information about the policies.
  final List<PolicyDescription> policyDescriptions;

  DescribeLoadBalancerPoliciesOutput({
    this.policyDescriptions,
  });
  static DescribeLoadBalancerPoliciesOutput fromJson(
          Map<String, dynamic> json) =>
      DescribeLoadBalancerPoliciesOutput();
}

/// Contains the output of DescribeLoadBalancerPolicyTypes.
class DescribeLoadBalancerPolicyTypesOutput {
  /// Information about the policy types.
  final List<PolicyTypeDescription> policyTypeDescriptions;

  DescribeLoadBalancerPolicyTypesOutput({
    this.policyTypeDescriptions,
  });
  static DescribeLoadBalancerPolicyTypesOutput fromJson(
          Map<String, dynamic> json) =>
      DescribeLoadBalancerPolicyTypesOutput();
}

/// Contains the output for DescribeTags.
class DescribeTagsOutput {
  /// Information about the tags.
  final List<TagDescription> tagDescriptions;

  DescribeTagsOutput({
    this.tagDescriptions,
  });
  static DescribeTagsOutput fromJson(Map<String, dynamic> json) =>
      DescribeTagsOutput();
}

/// Contains the output of DetachLoadBalancerFromSubnets.
class DetachLoadBalancerFromSubnetsOutput {
  /// The IDs of the remaining subnets for the load balancer.
  final List<String> subnets;

  DetachLoadBalancerFromSubnetsOutput({
    this.subnets,
  });
  static DetachLoadBalancerFromSubnetsOutput fromJson(
          Map<String, dynamic> json) =>
      DetachLoadBalancerFromSubnetsOutput();
}

/// Information about a health check.
class HealthCheck {
  /// The instance being checked. The protocol is either TCP, HTTP, HTTPS, or
  /// SSL. The range of valid ports is one (1) through 65535.
  ///
  /// TCP is the default, specified as a TCP: port pair, for example "TCP:5000".
  /// In this case, a health check simply attempts to open a TCP connection to
  /// the instance on the specified port. Failure to connect within the
  /// configured timeout is considered unhealthy.
  ///
  /// SSL is also specified as SSL: port pair, for example, SSL:5000.
  ///
  /// For HTTP/HTTPS, you must include a ping path in the string. HTTP is
  /// specified as a HTTP:port;/;PathToPing; grouping, for example
  /// "HTTP:80/weather/us/wa/seattle". In this case, a HTTP GET request is
  /// issued to the instance on the given port and path. Any answer other than
  /// "200 OK" within the timeout period is considered unhealthy.
  ///
  /// The total length of the HTTP ping target must be 1024 16-bit Unicode
  /// characters or less.
  final String target;

  /// The approximate interval, in seconds, between health checks of an
  /// individual instance.
  final int interval;

  /// The amount of time, in seconds, during which no response means a failed
  /// health check.
  ///
  /// This value must be less than the `Interval` value.
  final int timeout;

  /// The number of consecutive health check failures required before moving the
  /// instance to the `Unhealthy` state.
  final int unhealthyThreshold;

  /// The number of consecutive health checks successes required before moving
  /// the instance to the `Healthy` state.
  final int healthyThreshold;

  HealthCheck({
    @required this.target,
    @required this.interval,
    @required this.timeout,
    @required this.unhealthyThreshold,
    @required this.healthyThreshold,
  });
  static HealthCheck fromJson(Map<String, dynamic> json) => HealthCheck();
}

/// The ID of an EC2 instance.
class Instance {
  /// The instance ID.
  final String instanceId;

  Instance({
    this.instanceId,
  });
  static Instance fromJson(Map<String, dynamic> json) => Instance();
}

/// Information about the state of an EC2 instance.
class InstanceState {
  /// The ID of the instance.
  final String instanceId;

  /// The current state of the instance.
  ///
  /// Valid values: `InService` | `OutOfService` | `Unknown`
  final String state;

  /// Information about the cause of `OutOfService` instances. Specifically,
  /// whether the cause is Elastic Load Balancing or the instance.
  ///
  /// Valid values: `ELB` | `Instance` | `N/A`
  final String reasonCode;

  /// A description of the instance state. This string can contain one or more
  /// of the following messages.
  ///
  /// *    `N/A`
  ///
  /// *    `A transient error occurred. Please try again later.`
  ///
  /// *    `Instance has failed at least the UnhealthyThreshold number of health
  /// checks consecutively.`
  ///
  /// *    `Instance has not passed the configured HealthyThreshold number of
  /// health checks consecutively.`
  ///
  /// *    `Instance registration is still in progress.`
  ///
  /// *    `Instance is in the EC2 Availability Zone for which LoadBalancer is
  /// not configured to route traffic to.`
  ///
  /// *    `Instance is not currently registered with the LoadBalancer.`
  ///
  /// *    `Instance deregistration currently in progress.`
  ///
  /// *    `Disable Availability Zone is currently in progress.`
  ///
  /// *    `Instance is in pending state.`
  ///
  /// *    `Instance is in stopped state.`
  ///
  /// *    `Instance is in terminated state.`
  final String description;

  InstanceState({
    this.instanceId,
    this.state,
    this.reasonCode,
    this.description,
  });
  static InstanceState fromJson(Map<String, dynamic> json) => InstanceState();
}

/// Information about a policy for duration-based session stickiness.
class LBCookieStickinessPolicy {
  /// The name of the policy. This name must be unique within the set of
  /// policies for this load balancer.
  final String policyName;

  /// The time period, in seconds, after which the cookie should be considered
  /// stale. If this parameter is not specified, the stickiness session lasts
  /// for the duration of the browser session.
  final BigInt cookieExpirationPeriod;

  LBCookieStickinessPolicy({
    this.policyName,
    this.cookieExpirationPeriod,
  });
  static LBCookieStickinessPolicy fromJson(Map<String, dynamic> json) =>
      LBCookieStickinessPolicy();
}

/// Information about an Elastic Load Balancing resource limit for your AWS
/// account.
class Limit {
  /// The name of the limit. The possible values are:
  ///
  /// *   classic-listeners
  ///
  /// *   classic-load-balancers
  ///
  /// *   classic-registered-instances
  final String name;

  /// The maximum value of the limit.
  final String max;

  Limit({
    this.name,
    this.max,
  });
  static Limit fromJson(Map<String, dynamic> json) => Limit();
}

/// Information about a listener.
///
/// For information about the protocols and the ports supported by Elastic Load
/// Balancing, see
/// [Listeners for Your Classic Load Balancer](http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-listener-config.html)
/// in the _Classic Load Balancers Guide_.
class Listener {
  /// The load balancer transport protocol to use for routing: HTTP, HTTPS, TCP,
  /// or SSL.
  final String protocol;

  /// The port on which the load balancer is listening. On EC2-VPC, you can
  /// specify any port from the range 1-65535. On EC2-Classic, you can specify
  /// any port from the following list: 25, 80, 443, 465, 587, 1024-65535.
  final int loadBalancerPort;

  /// The protocol to use for routing traffic to instances: HTTP, HTTPS, TCP, or
  /// SSL.
  ///
  /// If the front-end protocol is HTTP, HTTPS, TCP, or SSL, `InstanceProtocol`
  /// must be at the same protocol.
  ///
  /// If there is another listener with the same `InstancePort` whose
  /// `InstanceProtocol` is secure, (HTTPS or SSL), the listener's
  /// `InstanceProtocol` must also be secure.
  ///
  /// If there is another listener with the same `InstancePort` whose
  /// `InstanceProtocol` is HTTP or TCP, the listener's `InstanceProtocol` must
  /// be HTTP or TCP.
  final String instanceProtocol;

  /// The port on which the instance is listening.
  final int instancePort;

  /// The Amazon Resource Name (ARN) of the server certificate.
  final String sslCertificateId;

  Listener({
    @required this.protocol,
    @required this.loadBalancerPort,
    this.instanceProtocol,
    @required this.instancePort,
    this.sslCertificateId,
  });
  static Listener fromJson(Map<String, dynamic> json) => Listener();
}

/// The policies enabled for a listener.
class ListenerDescription {
  /// The listener.
  final Listener listener;

  /// The policies. If there are no policies enabled, the list is empty.
  final List<String> policyNames;

  ListenerDescription({
    this.listener,
    this.policyNames,
  });
  static ListenerDescription fromJson(Map<String, dynamic> json) =>
      ListenerDescription();
}

/// The attributes for a load balancer.
class LoadBalancerAttributes {
  /// If enabled, the load balancer routes the request traffic evenly across all
  /// instances regardless of the Availability Zones.
  ///
  /// For more information, see
  /// [Configure Cross-Zone Load Balancing](http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/enable-disable-crosszone-lb.html)
  /// in the _Classic Load Balancers Guide_.
  final CrossZoneLoadBalancing crossZoneLoadBalancing;

  /// If enabled, the load balancer captures detailed information of all
  /// requests and delivers the information to the Amazon S3 bucket that you
  /// specify.
  ///
  /// For more information, see
  /// [Enable Access Logs](http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/enable-access-logs.html)
  /// in the _Classic Load Balancers Guide_.
  final AccessLog accessLog;

  /// If enabled, the load balancer allows existing requests to complete before
  /// the load balancer shifts traffic away from a deregistered or unhealthy
  /// instance.
  ///
  /// For more information, see
  /// [Configure Connection Draining](http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/config-conn-drain.html)
  /// in the _Classic Load Balancers Guide_.
  final ConnectionDraining connectionDraining;

  /// If enabled, the load balancer allows the connections to remain idle (no
  /// data is sent over the connection) for the specified duration.
  ///
  /// By default, Elastic Load Balancing maintains a 60-second idle connection
  /// timeout for both front-end and back-end connections of your load balancer.
  /// For more information, see
  /// [Configure Idle Connection Timeout](http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/config-idle-timeout.html)
  /// in the _Classic Load Balancers Guide_.
  final ConnectionSettings connectionSettings;

  /// This parameter is reserved.
  final List<AdditionalAttribute> additionalAttributes;

  LoadBalancerAttributes({
    this.crossZoneLoadBalancing,
    this.accessLog,
    this.connectionDraining,
    this.connectionSettings,
    this.additionalAttributes,
  });
  static LoadBalancerAttributes fromJson(Map<String, dynamic> json) =>
      LoadBalancerAttributes();
}

/// Information about a load balancer.
class LoadBalancerDescription {
  /// The name of the load balancer.
  final String loadBalancerName;

  /// The DNS name of the load balancer.
  final String dnsName;

  /// The DNS name of the load balancer.
  ///
  /// For more information, see
  /// [Configure a Custom Domain Name](http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/using-domain-names-with-elb.html)
  /// in the _Classic Load Balancers Guide_.
  final String canonicalHostedZoneName;

  /// The ID of the Amazon Route 53 hosted zone for the load balancer.
  final String canonicalHostedZoneNameID;

  /// The listeners for the load balancer.
  final List<ListenerDescription> listenerDescriptions;

  /// The policies defined for the load balancer.
  final Policies policies;

  /// Information about your EC2 instances.
  final List<BackendServerDescription> backendServerDescriptions;

  /// The Availability Zones for the load balancer.
  final List<String> availabilityZones;

  /// The IDs of the subnets for the load balancer.
  final List<String> subnets;

  /// The ID of the VPC for the load balancer.
  final String vpcId;

  /// The IDs of the instances for the load balancer.
  final List<Instance> instances;

  /// Information about the health checks conducted on the load balancer.
  final HealthCheck healthCheck;

  /// The security group for the load balancer, which you can use as part of
  /// your inbound rules for your registered instances. To only allow traffic
  /// from load balancers, add a security group rule that specifies this source
  /// security group as the inbound source.
  final SourceSecurityGroup sourceSecurityGroup;

  /// The security groups for the load balancer. Valid only for load balancers
  /// in a VPC.
  final List<String> securityGroups;

  /// The date and time the load balancer was created.
  final DateTime createdTime;

  /// The type of load balancer. Valid only for load balancers in a VPC.
  ///
  /// If `Scheme` is `internet-facing`, the load balancer has a public DNS name
  /// that resolves to a public IP address.
  ///
  /// If `Scheme` is `internal`, the load balancer has a public DNS name that
  /// resolves to a private IP address.
  final String scheme;

  LoadBalancerDescription({
    this.loadBalancerName,
    this.dnsName,
    this.canonicalHostedZoneName,
    this.canonicalHostedZoneNameID,
    this.listenerDescriptions,
    this.policies,
    this.backendServerDescriptions,
    this.availabilityZones,
    this.subnets,
    this.vpcId,
    this.instances,
    this.healthCheck,
    this.sourceSecurityGroup,
    this.securityGroups,
    this.createdTime,
    this.scheme,
  });
  static LoadBalancerDescription fromJson(Map<String, dynamic> json) =>
      LoadBalancerDescription();
}

/// Contains the output of ModifyLoadBalancerAttributes.
class ModifyLoadBalancerAttributesOutput {
  /// The name of the load balancer.
  final String loadBalancerName;

  /// Information about the load balancer attributes.
  final LoadBalancerAttributes loadBalancerAttributes;

  ModifyLoadBalancerAttributesOutput({
    this.loadBalancerName,
    this.loadBalancerAttributes,
  });
  static ModifyLoadBalancerAttributesOutput fromJson(
          Map<String, dynamic> json) =>
      ModifyLoadBalancerAttributesOutput();
}

/// The policies for a load balancer.
class Policies {
  /// The stickiness policies created using CreateAppCookieStickinessPolicy.
  final List<AppCookieStickinessPolicy> appCookieStickinessPolicies;

  /// The stickiness policies created using CreateLBCookieStickinessPolicy.
  final List<LBCookieStickinessPolicy> lbCookieStickinessPolicies;

  /// The policies other than the stickiness policies.
  final List<String> otherPolicies;

  Policies({
    this.appCookieStickinessPolicies,
    this.lbCookieStickinessPolicies,
    this.otherPolicies,
  });
  static Policies fromJson(Map<String, dynamic> json) => Policies();
}

/// Information about a policy attribute.
class PolicyAttribute {
  /// The name of the attribute.
  final String attributeName;

  /// The value of the attribute.
  final String attributeValue;

  PolicyAttribute({
    this.attributeName,
    this.attributeValue,
  });
}

/// Information about a policy attribute.
class PolicyAttributeDescription {
  /// The name of the attribute.
  final String attributeName;

  /// The value of the attribute.
  final String attributeValue;

  PolicyAttributeDescription({
    this.attributeName,
    this.attributeValue,
  });
  static PolicyAttributeDescription fromJson(Map<String, dynamic> json) =>
      PolicyAttributeDescription();
}

/// Information about a policy attribute type.
class PolicyAttributeTypeDescription {
  /// The name of the attribute.
  final String attributeName;

  /// The type of the attribute. For example, `Boolean` or `Integer`.
  final String attributeType;

  /// A description of the attribute.
  final String description;

  /// The default value of the attribute, if applicable.
  final String defaultValue;

  /// The cardinality of the attribute.
  ///
  /// Valid values:
  ///
  /// *   ONE(1) : Single value required
  ///
  /// *   ZERO_OR_ONE(0..1) : Up to one value is allowed
  ///
  /// *   ZERO_OR_MORE(0..*) : Optional. Multiple values are allowed
  ///
  /// *   ONE_OR_MORE(1..*0) : Required. Multiple values are allowed
  final String cardinality;

  PolicyAttributeTypeDescription({
    this.attributeName,
    this.attributeType,
    this.description,
    this.defaultValue,
    this.cardinality,
  });
  static PolicyAttributeTypeDescription fromJson(Map<String, dynamic> json) =>
      PolicyAttributeTypeDescription();
}

/// Information about a policy.
class PolicyDescription {
  /// The name of the policy.
  final String policyName;

  /// The name of the policy type.
  final String policyTypeName;

  /// The policy attributes.
  final List<PolicyAttributeDescription> policyAttributeDescriptions;

  PolicyDescription({
    this.policyName,
    this.policyTypeName,
    this.policyAttributeDescriptions,
  });
  static PolicyDescription fromJson(Map<String, dynamic> json) =>
      PolicyDescription();
}

/// Information about a policy type.
class PolicyTypeDescription {
  /// The name of the policy type.
  final String policyTypeName;

  /// A description of the policy type.
  final String description;

  /// The description of the policy attributes associated with the policies
  /// defined by Elastic Load Balancing.
  final List<PolicyAttributeTypeDescription> policyAttributeTypeDescriptions;

  PolicyTypeDescription({
    this.policyTypeName,
    this.description,
    this.policyAttributeTypeDescriptions,
  });
  static PolicyTypeDescription fromJson(Map<String, dynamic> json) =>
      PolicyTypeDescription();
}

/// Contains the output of RegisterInstancesWithLoadBalancer.
class RegisterEndPointsOutput {
  /// The updated list of instances for the load balancer.
  final List<Instance> instances;

  RegisterEndPointsOutput({
    this.instances,
  });
  static RegisterEndPointsOutput fromJson(Map<String, dynamic> json) =>
      RegisterEndPointsOutput();
}

/// Contains the output for DisableAvailabilityZonesForLoadBalancer.
class RemoveAvailabilityZonesOutput {
  /// The remaining Availability Zones for the load balancer.
  final List<String> availabilityZones;

  RemoveAvailabilityZonesOutput({
    this.availabilityZones,
  });
  static RemoveAvailabilityZonesOutput fromJson(Map<String, dynamic> json) =>
      RemoveAvailabilityZonesOutput();
}

/// Contains the output of RemoveTags.
class RemoveTagsOutput {
  RemoveTagsOutput();
  static RemoveTagsOutput fromJson(Map<String, dynamic> json) =>
      RemoveTagsOutput();
}

/// Contains the output of SetLoadBalancerListenerSSLCertificate.
class SetLoadBalancerListenerSslCertificateOutput {
  SetLoadBalancerListenerSslCertificateOutput();
  static SetLoadBalancerListenerSslCertificateOutput fromJson(
          Map<String, dynamic> json) =>
      SetLoadBalancerListenerSslCertificateOutput();
}

/// Contains the output of SetLoadBalancerPoliciesForBackendServer.
class SetLoadBalancerPoliciesForBackendServerOutput {
  SetLoadBalancerPoliciesForBackendServerOutput();
  static SetLoadBalancerPoliciesForBackendServerOutput fromJson(
          Map<String, dynamic> json) =>
      SetLoadBalancerPoliciesForBackendServerOutput();
}

/// Contains the output of SetLoadBalancePoliciesOfListener.
class SetLoadBalancerPoliciesOfListenerOutput {
  SetLoadBalancerPoliciesOfListenerOutput();
  static SetLoadBalancerPoliciesOfListenerOutput fromJson(
          Map<String, dynamic> json) =>
      SetLoadBalancerPoliciesOfListenerOutput();
}

/// Information about a source security group.
class SourceSecurityGroup {
  /// The owner of the security group.
  final String ownerAlias;

  /// The name of the security group.
  final String groupName;

  SourceSecurityGroup({
    this.ownerAlias,
    this.groupName,
  });
  static SourceSecurityGroup fromJson(Map<String, dynamic> json) =>
      SourceSecurityGroup();
}

/// Information about a tag.
class Tag {
  /// The key of the tag.
  final String key;

  /// The value of the tag.
  final String value;

  Tag({
    @required this.key,
    this.value,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag();
}

/// The tags associated with a load balancer.
class TagDescription {
  /// The name of the load balancer.
  final String loadBalancerName;

  /// The tags.
  final List<Tag> tags;

  TagDescription({
    this.loadBalancerName,
    this.tags,
  });
  static TagDescription fromJson(Map<String, dynamic> json) => TagDescription();
}

/// The key of a tag.
class TagKeyOnly {
  /// The name of the key.
  final String key;

  TagKeyOnly({
    this.key,
  });
}
