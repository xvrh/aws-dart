import 'package:meta/meta.dart';

/// Elastic Load Balancing
///
/// A load balancer distributes incoming traffic across targets, such as your
/// EC2 instances. This enables you to increase the availability of your
/// application. The load balancer also monitors the health of its registered
/// targets and ensures that it routes traffic only to healthy targets. You
/// configure your load balancer to accept incoming traffic by specifying one or
/// more listeners, which are configured with a protocol and port number for
/// connections from clients to the load balancer. You configure a target group
/// with a protocol and port number for connections from the load balancer to
/// the targets, and with health check settings to be used when checking the
/// health status of the targets.
///
/// Elastic Load Balancing supports the following types of load balancers:
/// Application Load Balancers, Network Load Balancers, and Classic Load
/// Balancers. This reference covers Application Load Balancers and Network Load
/// Balancers.
///
/// An Application Load Balancer makes routing and load balancing decisions at
/// the application layer (HTTP/HTTPS). A Network Load Balancer makes routing
/// and load balancing decisions at the transport layer (TCP/TLS). Both
/// Application Load Balancers and Network Load Balancers can route requests to
/// one or more ports on each EC2 instance or container instance in your virtual
/// private cloud (VPC). For more information, see the [Elastic Load Balancing
/// User
/// Guide](https://docs.aws.amazon.com/elasticloadbalancing/latest/userguide/).
///
/// All Elastic Load Balancing operations are idempotent, which means that they
/// complete at most one time. If you repeat an operation, it succeeds.
class ElasticLoadBalancingV2Api {
  /// Adds the specified SSL server certificate to the certificate list for the
  /// specified HTTPS or TLS listener.
  ///
  /// If the certificate in already in the certificate list, the call is
  /// successful but the certificate is not added again.
  ///
  /// To get the certificate list for a listener, use
  /// DescribeListenerCertificates. To remove certificates from the certificate
  /// list for a listener, use RemoveListenerCertificates. To replace the
  /// default certificate for a listener, use ModifyListener.
  ///
  /// For more information, see [SSL
  /// Certificates](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/create-https-listener.html#https-listener-certificates)
  /// in the _Application Load Balancers Guide_.
  ///
  /// [listenerArn]: The Amazon Resource Name (ARN) of the listener.
  ///
  /// [certificates]: The certificate to add. You can specify one certificate
  /// per call. Set `CertificateArn` to the certificate ARN but do not set
  /// `IsDefault`.
  Future<AddListenerCertificatesOutput> addListenerCertificates(
      {@required String listenerArn,
      @required List<Certificate> certificates}) async {
    return AddListenerCertificatesOutput.fromJson({});
  }

  /// Adds the specified tags to the specified Elastic Load Balancing resource.
  /// You can tag your Application Load Balancers, Network Load Balancers, and
  /// your target groups.
  ///
  /// Each tag consists of a key and an optional value. If a resource already
  /// has a tag with the same key, `AddTags` updates its value.
  ///
  /// To list the current tags for your resources, use DescribeTags. To remove
  /// tags from your resources, use RemoveTags.
  ///
  /// [resourceArns]: The Amazon Resource Name (ARN) of the resource.
  ///
  /// [tags]: The tags. Each resource can have a maximum of 10 tags.
  Future<AddTagsOutput> addTags(
      {@required List<String> resourceArns, @required List<Tag> tags}) async {
    return AddTagsOutput.fromJson({});
  }

  /// Creates a listener for the specified Application Load Balancer or Network
  /// Load Balancer.
  ///
  /// To update a listener, use ModifyListener. When you are finished with a
  /// listener, you can delete it using DeleteListener. If you are finished with
  /// both the listener and the load balancer, you can delete them both using
  /// DeleteLoadBalancer.
  ///
  /// This operation is idempotent, which means that it completes at most one
  /// time. If you attempt to create multiple listeners with the same settings,
  /// each call succeeds.
  ///
  /// For more information, see [Listeners for Your Application Load
  /// Balancers](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-listeners.html)
  /// in the _Application Load Balancers Guide_ and [Listeners for Your Network
  /// Load
  /// Balancers](https://docs.aws.amazon.com/elasticloadbalancing/latest/network/load-balancer-listeners.html)
  /// in the _Network Load Balancers Guide_.
  ///
  /// [loadBalancerArn]: The Amazon Resource Name (ARN) of the load balancer.
  ///
  /// [protocol]: The protocol for connections from clients to the load
  /// balancer. For Application Load Balancers, the supported protocols are HTTP
  /// and HTTPS. For Network Load Balancers, the supported protocols are TCP,
  /// TLS, UDP, and TCP_UDP.
  ///
  /// [port]: The port on which the load balancer is listening.
  ///
  /// [sslPolicy]: \[HTTPS and TLS listeners\] The security policy that defines
  /// which ciphers and protocols are supported. The default is the current
  /// predefined security policy.
  ///
  /// [certificates]: \[HTTPS and TLS listeners\] The default certificate for
  /// the listener. You must provide exactly one certificate. Set
  /// `CertificateArn` to the certificate ARN but do not set `IsDefault`.
  ///
  /// To create a certificate list for the listener, use
  /// AddListenerCertificates.
  ///
  /// [defaultActions]: The actions for the default rule. The rule must include
  /// one forward action or one or more fixed-response actions.
  ///
  /// If the action type is `forward`, you specify a target group. The protocol
  /// of the target group must be HTTP or HTTPS for an Application Load
  /// Balancer. The protocol of the target group must be TCP, TLS, UDP, or
  /// TCP_UDP for a Network Load Balancer.
  ///
  /// \[HTTPS listeners\] If the action type is `authenticate-oidc`, you
  /// authenticate users through an identity provider that is OpenID Connect
  /// (OIDC) compliant.
  ///
  /// \[HTTPS listeners\] If the action type is `authenticate-cognito`, you
  /// authenticate users through the user pools supported by Amazon Cognito.
  ///
  /// \[Application Load Balancer\] If the action type is `redirect`, you
  /// redirect specified client requests from one URL to another.
  ///
  /// \[Application Load Balancer\] If the action type is `fixed-response`, you
  /// drop specified client requests and return a custom HTTP response.
  Future<CreateListenerOutput> createListener(
      {@required String loadBalancerArn,
      @required String protocol,
      @required int port,
      String sslPolicy,
      List<Certificate> certificates,
      @required List<Action> defaultActions}) async {
    return CreateListenerOutput.fromJson({});
  }

  /// Creates an Application Load Balancer or a Network Load Balancer.
  ///
  /// When you create a load balancer, you can specify security groups, public
  /// subnets, IP address type, and tags. Otherwise, you could do so later using
  /// SetSecurityGroups, SetSubnets, SetIpAddressType, and AddTags.
  ///
  /// To create listeners for your load balancer, use CreateListener. To
  /// describe your current load balancers, see DescribeLoadBalancers. When you
  /// are finished with a load balancer, you can delete it using
  /// DeleteLoadBalancer.
  ///
  /// For limit information, see [Limits for Your Application Load
  /// Balancer](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-limits.html)
  /// in the _Application Load Balancers Guide_ and [Limits for Your Network
  /// Load
  /// Balancer](https://docs.aws.amazon.com/elasticloadbalancing/latest/network/load-balancer-limits.html)
  /// in the _Network Load Balancers Guide_.
  ///
  /// This operation is idempotent, which means that it completes at most one
  /// time. If you attempt to create multiple load balancers with the same
  /// settings, each call succeeds.
  ///
  /// For more information, see [Application Load
  /// Balancers](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/application-load-balancers.html)
  /// in the _Application Load Balancers Guide_ and [Network Load
  /// Balancers](https://docs.aws.amazon.com/elasticloadbalancing/latest/network/network-load-balancers.html)
  /// in the _Network Load Balancers Guide_.
  ///
  /// [name]: The name of the load balancer.
  ///
  /// This name must be unique per region per account, can have a maximum of 32
  /// characters, must contain only alphanumeric characters or hyphens, must not
  /// begin or end with a hyphen, and must not begin with "internal-".
  ///
  /// [subnets]: The IDs of the public subnets. You can specify only one subnet
  /// per Availability Zone. You must specify either subnets or subnet mappings.
  ///
  /// \[Application Load Balancers\] You must specify subnets from at least two
  /// Availability Zones.
  ///
  /// \[Network Load Balancers\] You can specify subnets from one or more
  /// Availability Zones.
  ///
  /// [subnetMappings]: The IDs of the public subnets. You can specify only one
  /// subnet per Availability Zone. You must specify either subnets or subnet
  /// mappings.
  ///
  /// \[Application Load Balancers\] You must specify subnets from at least two
  /// Availability Zones. You cannot specify Elastic IP addresses for your
  /// subnets.
  ///
  /// \[Network Load Balancers\] You can specify subnets from one or more
  /// Availability Zones. You can specify one Elastic IP address per subnet if
  /// you need static IP addresses for your load balancer.
  ///
  /// [securityGroups]: \[Application Load Balancers\] The IDs of the security
  /// groups for the load balancer.
  ///
  /// [scheme]: The nodes of an Internet-facing load balancer have public IP
  /// addresses. The DNS name of an Internet-facing load balancer is publicly
  /// resolvable to the public IP addresses of the nodes. Therefore,
  /// Internet-facing load balancers can route requests from clients over the
  /// internet.
  ///
  /// The nodes of an internal load balancer have only private IP addresses. The
  /// DNS name of an internal load balancer is publicly resolvable to the
  /// private IP addresses of the nodes. Therefore, internal load balancers can
  /// only route requests from clients with access to the VPC for the load
  /// balancer.
  ///
  /// The default is an Internet-facing load balancer.
  ///
  /// [tags]: One or more tags to assign to the load balancer.
  ///
  /// [type]: The type of load balancer. The default is `application`.
  ///
  /// [ipAddressType]: \[Application Load Balancers\] The type of IP addresses
  /// used by the subnets for your load balancer. The possible values are `ipv4`
  /// (for IPv4 addresses) and `dualstack` (for IPv4 and IPv6 addresses).
  /// Internal load balancers must use `ipv4`.
  Future<CreateLoadBalancerOutput> createLoadBalancer(String name,
      {List<String> subnets,
      List<SubnetMapping> subnetMappings,
      List<String> securityGroups,
      String scheme,
      List<Tag> tags,
      String type,
      String ipAddressType}) async {
    return CreateLoadBalancerOutput.fromJson({});
  }

  /// Creates a rule for the specified listener. The listener must be associated
  /// with an Application Load Balancer.
  ///
  /// Rules are evaluated in priority order, from the lowest value to the
  /// highest value. When the conditions for a rule are met, its actions are
  /// performed. If the conditions for no rules are met, the actions for the
  /// default rule are performed. For more information, see [Listener
  /// Rules](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-listeners.html#listener-rules)
  /// in the _Application Load Balancers Guide_.
  ///
  /// To view your current rules, use DescribeRules. To update a rule, use
  /// ModifyRule. To set the priorities of your rules, use SetRulePriorities. To
  /// delete a rule, use DeleteRule.
  ///
  /// [listenerArn]: The Amazon Resource Name (ARN) of the listener.
  ///
  /// [conditions]: The conditions. Each rule can include zero or one of the
  /// following conditions: `http-request-method`, `host-header`,
  /// `path-pattern`, and `source-ip`, and zero or more of the following
  /// conditions: `http-header` and `query-string`.
  ///
  /// [priority]: The rule priority. A listener can't have multiple rules with
  /// the same priority.
  ///
  /// [actions]: The actions. Each rule must include exactly one of the
  /// following types of actions: `forward`, `fixed-response`, or `redirect`.
  ///
  /// If the action type is `forward`, you specify a target group. The protocol
  /// of the target group must be HTTP or HTTPS for an Application Load
  /// Balancer. The protocol of the target group must be TCP, TLS, UDP, or
  /// TCP_UDP for a Network Load Balancer.
  ///
  /// \[HTTPS listeners\] If the action type is `authenticate-oidc`, you
  /// authenticate users through an identity provider that is OpenID Connect
  /// (OIDC) compliant.
  ///
  /// \[HTTPS listeners\] If the action type is `authenticate-cognito`, you
  /// authenticate users through the user pools supported by Amazon Cognito.
  ///
  /// \[Application Load Balancer\] If the action type is `redirect`, you
  /// redirect specified client requests from one URL to another.
  ///
  /// \[Application Load Balancer\] If the action type is `fixed-response`, you
  /// drop specified client requests and return a custom HTTP response.
  Future<CreateRuleOutput> createRule(
      {@required String listenerArn,
      @required List<RuleCondition> conditions,
      @required int priority,
      @required List<Action> actions}) async {
    return CreateRuleOutput.fromJson({});
  }

  /// Creates a target group.
  ///
  /// To register targets with the target group, use RegisterTargets. To update
  /// the health check settings for the target group, use ModifyTargetGroup. To
  /// monitor the health of targets in the target group, use
  /// DescribeTargetHealth.
  ///
  /// To route traffic to the targets in a target group, specify the target
  /// group in an action using CreateListener or CreateRule.
  ///
  /// To delete a target group, use DeleteTargetGroup.
  ///
  /// This operation is idempotent, which means that it completes at most one
  /// time. If you attempt to create multiple target groups with the same
  /// settings, each call succeeds.
  ///
  /// For more information, see [Target Groups for Your Application Load
  /// Balancers](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-target-groups.html)
  /// in the _Application Load Balancers Guide_ or [Target Groups for Your
  /// Network Load
  /// Balancers](https://docs.aws.amazon.com/elasticloadbalancing/latest/network/load-balancer-target-groups.html)
  /// in the _Network Load Balancers Guide_.
  ///
  /// [name]: The name of the target group.
  ///
  /// This name must be unique per region per account, can have a maximum of 32
  /// characters, must contain only alphanumeric characters or hyphens, and must
  /// not begin or end with a hyphen.
  ///
  /// [protocol]: The protocol to use for routing traffic to the targets. For
  /// Application Load Balancers, the supported protocols are HTTP and HTTPS.
  /// For Network Load Balancers, the supported protocols are TCP, TLS, UDP, or
  /// TCP\_UDP. A TCP\_UDP listener must be associated with a TCP_UDP target
  /// group. If the target is a Lambda function, this parameter does not apply.
  ///
  /// [port]: The port on which the targets receive traffic. This port is used
  /// unless you specify a port override when registering the target. If the
  /// target is a Lambda function, this parameter does not apply.
  ///
  /// [vpcId]: The identifier of the virtual private cloud (VPC). If the target
  /// is a Lambda function, this parameter does not apply. Otherwise, this
  /// parameter is required.
  ///
  /// [healthCheckProtocol]: The protocol the load balancer uses when performing
  /// health checks on targets. For Application Load Balancers, the default is
  /// HTTP. For Network Load Balancers, the default is TCP. The TCP protocol is
  /// supported for health checks only if the protocol of the target group is
  /// TCP, TLS, UDP, or TCP\_UDP. The TLS, UDP, and TCP\_UDP protocols are not
  /// supported for health checks.
  ///
  /// [healthCheckPort]: The port the load balancer uses when performing health
  /// checks on targets. The default is `traffic-port`, which is the port on
  /// which each target receives traffic from the load balancer.
  ///
  /// [healthCheckEnabled]: Indicates whether health checks are enabled. If the
  /// target type is `lambda`, health checks are disabled by default but can be
  /// enabled. If the target type is `instance` or `ip`, health checks are
  /// always enabled and cannot be disabled.
  ///
  /// [healthCheckPath]: \[HTTP/HTTPS health checks\] The ping path that is the
  /// destination on the targets for health checks. The default is /.
  ///
  /// [healthCheckIntervalSeconds]: The approximate amount of time, in seconds,
  /// between health checks of an individual target. For HTTP and HTTPS health
  /// checks, the range is 5–300 seconds. For TCP health checks, the supported
  /// values are 10 and 30 seconds. If the target type is `instance` or `ip`,
  /// the default is 30 seconds. If the target type is `lambda`, the default is
  /// 35 seconds.
  ///
  /// [healthCheckTimeoutSeconds]: The amount of time, in seconds, during which
  /// no response from a target means a failed health check. For target groups
  /// with a protocol of HTTP or HTTPS, the default is 5 seconds. For target
  /// groups with a protocol of TCP or TLS, this value must be 6 seconds for
  /// HTTP health checks and 10 seconds for TCP and HTTPS health checks. If the
  /// target type is `lambda`, the default is 30 seconds.
  ///
  /// [healthyThresholdCount]: The number of consecutive health checks successes
  /// required before considering an unhealthy target healthy. For target groups
  /// with a protocol of HTTP or HTTPS, the default is 5. For target groups with
  /// a protocol of TCP or TLS, the default is 3. If the target type is
  /// `lambda`, the default is 5.
  ///
  /// [unhealthyThresholdCount]: The number of consecutive health check failures
  /// required before considering a target unhealthy. For target groups with a
  /// protocol of HTTP or HTTPS, the default is 2. For target groups with a
  /// protocol of TCP or TLS, this value must be the same as the healthy
  /// threshold count. If the target type is `lambda`, the default is 2.
  ///
  /// [matcher]: \[HTTP/HTTPS health checks\] The HTTP codes to use when
  /// checking for a successful response from a target.
  ///
  /// [targetType]: The type of target that you must specify when registering
  /// targets with this target group. You can't specify targets for a target
  /// group using more than one target type.
  ///
  /// *    `instance` \- Targets are specified by instance ID. This is the
  /// default value. If the target group protocol is UDP or TCP_UDP, the target
  /// type must be `instance`.
  ///
  /// *    `ip` \- Targets are specified by IP address. You can specify IP
  /// addresses from the subnets of the virtual private cloud (VPC) for the
  /// target group, the RFC 1918 range (10.0.0.0/8, 172.16.0.0/12, and
  /// 192.168.0.0/16), and the RFC 6598 range (100.64.0.0/10). You can't specify
  /// publicly routable IP addresses.
  ///
  /// *    `lambda` \- The target groups contains a single Lambda function.
  Future<CreateTargetGroupOutput> createTargetGroup(String name,
      {String protocol,
      int port,
      String vpcId,
      String healthCheckProtocol,
      String healthCheckPort,
      bool healthCheckEnabled,
      String healthCheckPath,
      int healthCheckIntervalSeconds,
      int healthCheckTimeoutSeconds,
      int healthyThresholdCount,
      int unhealthyThresholdCount,
      Matcher matcher,
      String targetType}) async {
    return CreateTargetGroupOutput.fromJson({});
  }

  /// Deletes the specified listener.
  ///
  /// Alternatively, your listener is deleted when you delete the load balancer
  /// to which it is attached, using DeleteLoadBalancer.
  ///
  /// [listenerArn]: The Amazon Resource Name (ARN) of the listener.
  Future<DeleteListenerOutput> deleteListener(String listenerArn) async {
    return DeleteListenerOutput.fromJson({});
  }

  /// Deletes the specified Application Load Balancer or Network Load Balancer
  /// and its attached listeners.
  ///
  /// You can't delete a load balancer if deletion protection is enabled. If the
  /// load balancer does not exist or has already been deleted, the call
  /// succeeds.
  ///
  /// Deleting a load balancer does not affect its registered targets. For
  /// example, your EC2 instances continue to run and are still registered to
  /// their target groups. If you no longer need these EC2 instances, you can
  /// stop or terminate them.
  ///
  /// [loadBalancerArn]: The Amazon Resource Name (ARN) of the load balancer.
  Future<DeleteLoadBalancerOutput> deleteLoadBalancer(
      String loadBalancerArn) async {
    return DeleteLoadBalancerOutput.fromJson({});
  }

  /// Deletes the specified rule.
  ///
  /// [ruleArn]: The Amazon Resource Name (ARN) of the rule.
  Future<DeleteRuleOutput> deleteRule(String ruleArn) async {
    return DeleteRuleOutput.fromJson({});
  }

  /// Deletes the specified target group.
  ///
  /// You can delete a target group if it is not referenced by any actions.
  /// Deleting a target group also deletes any associated health checks.
  ///
  /// [targetGroupArn]: The Amazon Resource Name (ARN) of the target group.
  Future<DeleteTargetGroupOutput> deleteTargetGroup(
      String targetGroupArn) async {
    return DeleteTargetGroupOutput.fromJson({});
  }

  /// Deregisters the specified targets from the specified target group. After
  /// the targets are deregistered, they no longer receive traffic from the load
  /// balancer.
  ///
  /// [targetGroupArn]: The Amazon Resource Name (ARN) of the target group.
  ///
  /// [targets]: The targets. If you specified a port override when you
  /// registered a target, you must specify both the target ID and the port when
  /// you deregister it.
  Future<DeregisterTargetsOutput> deregisterTargets(
      {@required String targetGroupArn,
      @required List<TargetDescription> targets}) async {
    return DeregisterTargetsOutput.fromJson({});
  }

  /// Describes the current Elastic Load Balancing resource limits for your AWS
  /// account.
  ///
  /// For more information, see [Limits for Your Application Load
  /// Balancers](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-limits.html)
  /// in the _Application Load Balancer Guide_ or [Limits for Your Network Load
  /// Balancers](https://docs.aws.amazon.com/elasticloadbalancing/latest/network/load-balancer-limits.html)
  /// in the _Network Load Balancers Guide_.
  ///
  /// [marker]: The marker for the next set of results. (You received this
  /// marker from a previous call.)
  ///
  /// [pageSize]: The maximum number of results to return with this call.
  Future<DescribeAccountLimitsOutput> describeAccountLimits(
      {String marker, int pageSize}) async {
    return DescribeAccountLimitsOutput.fromJson({});
  }

  /// Describes the default certificate and the certificate list for the
  /// specified HTTPS or TLS listener.
  ///
  /// If the default certificate is also in the certificate list, it appears
  /// twice in the results (once with `IsDefault` set to true and once with
  /// `IsDefault` set to false).
  ///
  /// For more information, see [SSL
  /// Certificates](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/create-https-listener.html#https-listener-certificates)
  /// in the _Application Load Balancers Guide_.
  ///
  /// [listenerArn]: The Amazon Resource Names (ARN) of the listener.
  ///
  /// [marker]: The marker for the next set of results. (You received this
  /// marker from a previous call.)
  ///
  /// [pageSize]: The maximum number of results to return with this call.
  Future<DescribeListenerCertificatesOutput> describeListenerCertificates(
      String listenerArn,
      {String marker,
      int pageSize}) async {
    return DescribeListenerCertificatesOutput.fromJson({});
  }

  /// Describes the specified listeners or the listeners for the specified
  /// Application Load Balancer or Network Load Balancer. You must specify
  /// either a load balancer or one or more listeners.
  ///
  /// For an HTTPS or TLS listener, the output includes the default certificate
  /// for the listener. To describe the certificate list for the listener, use
  /// DescribeListenerCertificates.
  ///
  /// [loadBalancerArn]: The Amazon Resource Name (ARN) of the load balancer.
  ///
  /// [listenerArns]: The Amazon Resource Names (ARN) of the listeners.
  ///
  /// [marker]: The marker for the next set of results. (You received this
  /// marker from a previous call.)
  ///
  /// [pageSize]: The maximum number of results to return with this call.
  Future<DescribeListenersOutput> describeListeners(
      {String loadBalancerArn,
      List<String> listenerArns,
      String marker,
      int pageSize}) async {
    return DescribeListenersOutput.fromJson({});
  }

  /// Describes the attributes for the specified Application Load Balancer or
  /// Network Load Balancer.
  ///
  /// For more information, see [Load Balancer
  /// Attributes](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/application-load-balancers.html#load-balancer-attributes)
  /// in the _Application Load Balancers Guide_ or [Load Balancer
  /// Attributes](https://docs.aws.amazon.com/elasticloadbalancing/latest/network/network-load-balancers.html#load-balancer-attributes)
  /// in the _Network Load Balancers Guide_.
  ///
  /// [loadBalancerArn]: The Amazon Resource Name (ARN) of the load balancer.
  Future<DescribeLoadBalancerAttributesOutput> describeLoadBalancerAttributes(
      String loadBalancerArn) async {
    return DescribeLoadBalancerAttributesOutput.fromJson({});
  }

  /// Describes the specified load balancers or all of your load balancers.
  ///
  /// To describe the listeners for a load balancer, use DescribeListeners. To
  /// describe the attributes for a load balancer, use
  /// DescribeLoadBalancerAttributes.
  ///
  /// [loadBalancerArns]: The Amazon Resource Names (ARN) of the load balancers.
  /// You can specify up to 20 load balancers in a single call.
  ///
  /// [names]: The names of the load balancers.
  ///
  /// [marker]: The marker for the next set of results. (You received this
  /// marker from a previous call.)
  ///
  /// [pageSize]: The maximum number of results to return with this call.
  Future<DescribeLoadBalancersOutput> describeLoadBalancers(
      {List<String> loadBalancerArns,
      List<String> names,
      String marker,
      int pageSize}) async {
    return DescribeLoadBalancersOutput.fromJson({});
  }

  /// Describes the specified rules or the rules for the specified listener. You
  /// must specify either a listener or one or more rules.
  ///
  /// [listenerArn]: The Amazon Resource Name (ARN) of the listener.
  ///
  /// [ruleArns]: The Amazon Resource Names (ARN) of the rules.
  ///
  /// [marker]: The marker for the next set of results. (You received this
  /// marker from a previous call.)
  ///
  /// [pageSize]: The maximum number of results to return with this call.
  Future<DescribeRulesOutput> describeRules(
      {String listenerArn,
      List<String> ruleArns,
      String marker,
      int pageSize}) async {
    return DescribeRulesOutput.fromJson({});
  }

  /// Describes the specified policies or all policies used for SSL negotiation.
  ///
  /// For more information, see [Security
  /// Policies](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/create-https-listener.html#describe-ssl-policies)
  /// in the _Application Load Balancers Guide_.
  ///
  /// [names]: The names of the policies.
  ///
  /// [marker]: The marker for the next set of results. (You received this
  /// marker from a previous call.)
  ///
  /// [pageSize]: The maximum number of results to return with this call.
  Future<DescribeSslPoliciesOutput> describeSslPolicies(
      {List<String> names, String marker, int pageSize}) async {
    return DescribeSslPoliciesOutput.fromJson({});
  }

  /// Describes the tags for the specified resources. You can describe the tags
  /// for one or more Application Load Balancers, Network Load Balancers, and
  /// target groups.
  ///
  /// [resourceArns]: The Amazon Resource Names (ARN) of the resources.
  Future<DescribeTagsOutput> describeTags(List<String> resourceArns) async {
    return DescribeTagsOutput.fromJson({});
  }

  /// Describes the attributes for the specified target group.
  ///
  /// For more information, see [Target Group
  /// Attributes](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-target-groups.html#target-group-attributes)
  /// in the _Application Load Balancers Guide_ or [Target Group
  /// Attributes](https://docs.aws.amazon.com/elasticloadbalancing/latest/network/load-balancer-target-groups.html#target-group-attributes)
  /// in the _Network Load Balancers Guide_.
  ///
  /// [targetGroupArn]: The Amazon Resource Name (ARN) of the target group.
  Future<DescribeTargetGroupAttributesOutput> describeTargetGroupAttributes(
      String targetGroupArn) async {
    return DescribeTargetGroupAttributesOutput.fromJson({});
  }

  /// Describes the specified target groups or all of your target groups. By
  /// default, all target groups are described. Alternatively, you can specify
  /// one of the following to filter the results: the ARN of the load balancer,
  /// the names of one or more target groups, or the ARNs of one or more target
  /// groups.
  ///
  /// To describe the targets for a target group, use DescribeTargetHealth. To
  /// describe the attributes of a target group, use
  /// DescribeTargetGroupAttributes.
  ///
  /// [loadBalancerArn]: The Amazon Resource Name (ARN) of the load balancer.
  ///
  /// [targetGroupArns]: The Amazon Resource Names (ARN) of the target groups.
  ///
  /// [names]: The names of the target groups.
  ///
  /// [marker]: The marker for the next set of results. (You received this
  /// marker from a previous call.)
  ///
  /// [pageSize]: The maximum number of results to return with this call.
  Future<DescribeTargetGroupsOutput> describeTargetGroups(
      {String loadBalancerArn,
      List<String> targetGroupArns,
      List<String> names,
      String marker,
      int pageSize}) async {
    return DescribeTargetGroupsOutput.fromJson({});
  }

  /// Describes the health of the specified targets or all of your targets.
  ///
  /// [targetGroupArn]: The Amazon Resource Name (ARN) of the target group.
  ///
  /// [targets]: The targets.
  Future<DescribeTargetHealthOutput> describeTargetHealth(String targetGroupArn,
      {List<TargetDescription> targets}) async {
    return DescribeTargetHealthOutput.fromJson({});
  }

  /// Modifies the specified properties of the specified listener.
  ///
  /// Any properties that you do not specify retain their current values.
  /// However, changing the protocol from HTTPS to HTTP, or from TLS to TCP,
  /// removes the security policy and default certificate properties. If you
  /// change the protocol from HTTP to HTTPS, or from TCP to TLS, you must add
  /// the security policy and default certificate properties.
  ///
  /// [listenerArn]: The Amazon Resource Name (ARN) of the listener.
  ///
  /// [port]: The port for connections from clients to the load balancer.
  ///
  /// [protocol]: The protocol for connections from clients to the load
  /// balancer. Application Load Balancers support the HTTP and HTTPS protocols.
  /// Network Load Balancers support the TCP, TLS, UDP, and TCP_UDP protocols.
  ///
  /// [sslPolicy]: \[HTTPS and TLS listeners\] The security policy that defines
  /// which protocols and ciphers are supported. For more information, see
  /// [Security
  /// Policies](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/create-https-listener.html#describe-ssl-policies)
  /// in the _Application Load Balancers Guide_.
  ///
  /// [certificates]: \[HTTPS and TLS listeners\] The default certificate for
  /// the listener. You must provide exactly one certificate. Set
  /// `CertificateArn` to the certificate ARN but do not set `IsDefault`.
  ///
  /// To create a certificate list, use AddListenerCertificates.
  ///
  /// [defaultActions]: The actions for the default rule. The rule must include
  /// one forward action or one or more fixed-response actions.
  ///
  /// If the action type is `forward`, you specify a target group. The protocol
  /// of the target group must be HTTP or HTTPS for an Application Load
  /// Balancer. The protocol of the target group must be TCP, TLS, UDP, or
  /// TCP_UDP for a Network Load Balancer.
  ///
  /// \[HTTPS listeners\] If the action type is `authenticate-oidc`, you
  /// authenticate users through an identity provider that is OpenID Connect
  /// (OIDC) compliant.
  ///
  /// \[HTTPS listeners\] If the action type is `authenticate-cognito`, you
  /// authenticate users through the user pools supported by Amazon Cognito.
  ///
  /// \[Application Load Balancer\] If the action type is `redirect`, you
  /// redirect specified client requests from one URL to another.
  ///
  /// \[Application Load Balancer\] If the action type is `fixed-response`, you
  /// drop specified client requests and return a custom HTTP response.
  Future<ModifyListenerOutput> modifyListener(String listenerArn,
      {int port,
      String protocol,
      String sslPolicy,
      List<Certificate> certificates,
      List<Action> defaultActions}) async {
    return ModifyListenerOutput.fromJson({});
  }

  /// Modifies the specified attributes of the specified Application Load
  /// Balancer or Network Load Balancer.
  ///
  /// If any of the specified attributes can't be modified as requested, the
  /// call fails. Any existing attributes that you do not modify retain their
  /// current values.
  ///
  /// [loadBalancerArn]: The Amazon Resource Name (ARN) of the load balancer.
  ///
  /// [attributes]: The load balancer attributes.
  Future<ModifyLoadBalancerAttributesOutput> modifyLoadBalancerAttributes(
      {@required String loadBalancerArn,
      @required List<LoadBalancerAttribute> attributes}) async {
    return ModifyLoadBalancerAttributesOutput.fromJson({});
  }

  /// Modifies the specified rule.
  ///
  /// Any existing properties that you do not modify retain their current
  /// values.
  ///
  /// To modify the actions for the default rule, use ModifyListener.
  ///
  /// [ruleArn]: The Amazon Resource Name (ARN) of the rule.
  ///
  /// [conditions]: The conditions. Each rule can include zero or one of the
  /// following conditions: `http-request-method`, `host-header`,
  /// `path-pattern`, and `source-ip`, and zero or more of the following
  /// conditions: `http-header` and `query-string`.
  ///
  /// [actions]: The actions. Each rule must include exactly one of the
  /// following types of actions: `forward`, `fixed-response`, or `redirect`.
  ///
  /// If the action type is `forward`, you specify a target group. The protocol
  /// of the target group must be HTTP or HTTPS for an Application Load
  /// Balancer. The protocol of the target group must be TCP, TLS, UDP, or
  /// TCP_UDP for a Network Load Balancer.
  ///
  /// \[HTTPS listeners\] If the action type is `authenticate-oidc`, you
  /// authenticate users through an identity provider that is OpenID Connect
  /// (OIDC) compliant.
  ///
  /// \[HTTPS listeners\] If the action type is `authenticate-cognito`, you
  /// authenticate users through the user pools supported by Amazon Cognito.
  ///
  /// \[Application Load Balancer\] If the action type is `redirect`, you
  /// redirect specified client requests from one URL to another.
  ///
  /// \[Application Load Balancer\] If the action type is `fixed-response`, you
  /// drop specified client requests and return a custom HTTP response.
  Future<ModifyRuleOutput> modifyRule(String ruleArn,
      {List<RuleCondition> conditions, List<Action> actions}) async {
    return ModifyRuleOutput.fromJson({});
  }

  /// Modifies the health checks used when evaluating the health state of the
  /// targets in the specified target group.
  ///
  /// To monitor the health of the targets, use DescribeTargetHealth.
  ///
  /// [targetGroupArn]: The Amazon Resource Name (ARN) of the target group.
  ///
  /// [healthCheckProtocol]: The protocol the load balancer uses when performing
  /// health checks on targets. The TCP protocol is supported for health checks
  /// only if the protocol of the target group is TCP, TLS, UDP, or TCP\_UDP.
  /// The TLS, UDP, and TCP\_UDP protocols are not supported for health checks.
  ///
  /// If the protocol of the target group is TCP, you can't modify this setting.
  ///
  /// [healthCheckPort]: The port the load balancer uses when performing health
  /// checks on targets.
  ///
  /// [healthCheckPath]: \[HTTP/HTTPS health checks\] The ping path that is the
  /// destination for the health check request.
  ///
  /// [healthCheckEnabled]: Indicates whether health checks are enabled.
  ///
  /// [healthCheckIntervalSeconds]: The approximate amount of time, in seconds,
  /// between health checks of an individual target. For Application Load
  /// Balancers, the range is 5 to 300 seconds. For Network Load Balancers, the
  /// supported values are 10 or 30 seconds.
  ///
  /// If the protocol of the target group is TCP, you can't modify this setting.
  ///
  /// [healthCheckTimeoutSeconds]: \[HTTP/HTTPS health checks\] The amount of
  /// time, in seconds, during which no response means a failed health check.
  ///
  /// If the protocol of the target group is TCP, you can't modify this setting.
  ///
  /// [healthyThresholdCount]: The number of consecutive health checks successes
  /// required before considering an unhealthy target healthy.
  ///
  /// [unhealthyThresholdCount]: The number of consecutive health check failures
  /// required before considering the target unhealthy. For Network Load
  /// Balancers, this value must be the same as the healthy threshold count.
  ///
  /// [matcher]: \[HTTP/HTTPS health checks\] The HTTP codes to use when
  /// checking for a successful response from a target.
  ///
  /// If the protocol of the target group is TCP, you can't modify this setting.
  Future<ModifyTargetGroupOutput> modifyTargetGroup(String targetGroupArn,
      {String healthCheckProtocol,
      String healthCheckPort,
      String healthCheckPath,
      bool healthCheckEnabled,
      int healthCheckIntervalSeconds,
      int healthCheckTimeoutSeconds,
      int healthyThresholdCount,
      int unhealthyThresholdCount,
      Matcher matcher}) async {
    return ModifyTargetGroupOutput.fromJson({});
  }

  /// Modifies the specified attributes of the specified target group.
  ///
  /// [targetGroupArn]: The Amazon Resource Name (ARN) of the target group.
  ///
  /// [attributes]: The attributes.
  Future<ModifyTargetGroupAttributesOutput> modifyTargetGroupAttributes(
      {@required String targetGroupArn,
      @required List<TargetGroupAttribute> attributes}) async {
    return ModifyTargetGroupAttributesOutput.fromJson({});
  }

  /// Registers the specified targets with the specified target group.
  ///
  /// If the target is an EC2 instance, it must be in the `running` state when
  /// you register it.
  ///
  /// By default, the load balancer routes requests to registered targets using
  /// the protocol and port for the target group. Alternatively, you can
  /// override the port for a target when you register it. You can register each
  /// EC2 instance or IP address with the same target group multiple times using
  /// different ports.
  ///
  /// With a Network Load Balancer, you cannot register instances by instance ID
  /// if they have the following instance types: C1, CC1, CC2, CG1, CG2, CR1,
  /// CS1, G1, G2, HI1, HS1, M1, M2, M3, and T1. You can register instances of
  /// these types by IP address.
  ///
  /// To remove a target from a target group, use DeregisterTargets.
  ///
  /// [targetGroupArn]: The Amazon Resource Name (ARN) of the target group.
  ///
  /// [targets]: The targets.
  ///
  /// To register a target by instance ID, specify the instance ID. To register
  /// a target by IP address, specify the IP address. To register a Lambda
  /// function, specify the ARN of the Lambda function.
  Future<RegisterTargetsOutput> registerTargets(
      {@required String targetGroupArn,
      @required List<TargetDescription> targets}) async {
    return RegisterTargetsOutput.fromJson({});
  }

  /// Removes the specified certificate from the certificate list for the
  /// specified HTTPS or TLS listener.
  ///
  /// You can't remove the default certificate for a listener. To replace the
  /// default certificate, call ModifyListener.
  ///
  /// To list the certificates for your listener, use
  /// DescribeListenerCertificates.
  ///
  /// [listenerArn]: The Amazon Resource Name (ARN) of the listener.
  ///
  /// [certificates]: The certificate to remove. You can specify one certificate
  /// per call. Set `CertificateArn` to the certificate ARN but do not set
  /// `IsDefault`.
  Future<RemoveListenerCertificatesOutput> removeListenerCertificates(
      {@required String listenerArn,
      @required List<Certificate> certificates}) async {
    return RemoveListenerCertificatesOutput.fromJson({});
  }

  /// Removes the specified tags from the specified Elastic Load Balancing
  /// resource.
  ///
  /// To list the current tags for your resources, use DescribeTags.
  ///
  /// [resourceArns]: The Amazon Resource Name (ARN) of the resource.
  ///
  /// [tagKeys]: The tag keys for the tags to remove.
  Future<RemoveTagsOutput> removeTags(
      {@required List<String> resourceArns,
      @required List<String> tagKeys}) async {
    return RemoveTagsOutput.fromJson({});
  }

  /// Sets the type of IP addresses used by the subnets of the specified
  /// Application Load Balancer or Network Load Balancer.
  ///
  /// [loadBalancerArn]: The Amazon Resource Name (ARN) of the load balancer.
  ///
  /// [ipAddressType]: The IP address type. The possible values are `ipv4` (for
  /// IPv4 addresses) and `dualstack` (for IPv4 and IPv6 addresses). Internal
  /// load balancers must use `ipv4`. Network Load Balancers must use `ipv4`.
  Future<SetIpAddressTypeOutput> setIpAddressType(
      {@required String loadBalancerArn,
      @required String ipAddressType}) async {
    return SetIpAddressTypeOutput.fromJson({});
  }

  /// Sets the priorities of the specified rules.
  ///
  /// You can reorder the rules as long as there are no priority conflicts in
  /// the new order. Any existing rules that you do not specify retain their
  /// current priority.
  ///
  /// [rulePriorities]: The rule priorities.
  Future<SetRulePrioritiesOutput> setRulePriorities(
      List<RulePriorityPair> rulePriorities) async {
    return SetRulePrioritiesOutput.fromJson({});
  }

  /// Associates the specified security groups with the specified Application
  /// Load Balancer. The specified security groups override the previously
  /// associated security groups.
  ///
  /// You can't specify a security group for a Network Load Balancer.
  ///
  /// [loadBalancerArn]: The Amazon Resource Name (ARN) of the load balancer.
  ///
  /// [securityGroups]: The IDs of the security groups.
  Future<SetSecurityGroupsOutput> setSecurityGroups(
      {@required String loadBalancerArn,
      @required List<String> securityGroups}) async {
    return SetSecurityGroupsOutput.fromJson({});
  }

  /// Enables the Availability Zone for the specified public subnets for the
  /// specified Application Load Balancer. The specified subnets replace the
  /// previously enabled subnets.
  ///
  /// You can't change the subnets for a Network Load Balancer.
  ///
  /// [loadBalancerArn]: The Amazon Resource Name (ARN) of the load balancer.
  ///
  /// [subnets]: The IDs of the public subnets. You must specify subnets from at
  /// least two Availability Zones. You can specify only one subnet per
  /// Availability Zone. You must specify either subnets or subnet mappings.
  ///
  /// [subnetMappings]: The IDs of the public subnets. You must specify subnets
  /// from at least two Availability Zones. You can specify only one subnet per
  /// Availability Zone. You must specify either subnets or subnet mappings.
  ///
  /// You cannot specify Elastic IP addresses for your subnets.
  Future<SetSubnetsOutput> setSubnets(String loadBalancerArn,
      {List<String> subnets, List<SubnetMapping> subnetMappings}) async {
    return SetSubnetsOutput.fromJson({});
  }
}

class Action {
  /// The type of action. Each rule must include exactly one of the following
  /// types of actions: `forward`, `fixed-response`, or `redirect`.
  final String type;

  /// The Amazon Resource Name (ARN) of the target group. Specify only when
  /// `Type` is `forward`.
  final String targetGroupArn;

  /// \[HTTPS listeners\] Information about an identity provider that is
  /// compliant with OpenID Connect (OIDC). Specify only when `Type` is
  /// `authenticate-oidc`.
  final AuthenticateOidcActionConfig authenticateOidcConfig;

  /// \[HTTPS listeners\] Information for using Amazon Cognito to authenticate
  /// users. Specify only when `Type` is `authenticate-cognito`.
  final AuthenticateCognitoActionConfig authenticateCognitoConfig;

  /// The order for the action. This value is required for rules with multiple
  /// actions. The action with the lowest value for order is performed first.
  /// The final action to be performed must be a `forward` or a `fixed-response`
  /// action.
  final int order;

  /// \[Application Load Balancer\] Information for creating a redirect action.
  /// Specify only when `Type` is `redirect`.
  final RedirectActionConfig redirectConfig;

  /// \[Application Load Balancer\] Information for creating an action that
  /// returns a custom HTTP response. Specify only when `Type` is
  /// `fixed-response`.
  final FixedResponseActionConfig fixedResponseConfig;

  Action({
    @required this.type,
    this.targetGroupArn,
    this.authenticateOidcConfig,
    this.authenticateCognitoConfig,
    this.order,
    this.redirectConfig,
    this.fixedResponseConfig,
  });
  static Action fromJson(Map<String, dynamic> json) => Action();
}

class AddListenerCertificatesOutput {
  /// Information about the certificates in the certificate list.
  final List<Certificate> certificates;

  AddListenerCertificatesOutput({
    this.certificates,
  });
  static AddListenerCertificatesOutput fromJson(Map<String, dynamic> json) =>
      AddListenerCertificatesOutput();
}

class AddTagsOutput {
  AddTagsOutput();
  static AddTagsOutput fromJson(Map<String, dynamic> json) => AddTagsOutput();
}

class AuthenticateCognitoActionConfig {
  /// The Amazon Resource Name (ARN) of the Amazon Cognito user pool.
  final String userPoolArn;

  /// The ID of the Amazon Cognito user pool client.
  final String userPoolClientId;

  /// The domain prefix or fully-qualified domain name of the Amazon Cognito
  /// user pool.
  final String userPoolDomain;

  /// The name of the cookie used to maintain session information. The default
  /// is AWSELBAuthSessionCookie.
  final String sessionCookieName;

  /// The set of user claims to be requested from the IdP. The default is
  /// `openid`.
  ///
  /// To verify which scope values your IdP supports and how to separate
  /// multiple values, see the documentation for your IdP.
  final String scope;

  /// The maximum duration of the authentication session, in seconds. The
  /// default is 604800 seconds (7 days).
  final BigInt sessionTimeout;

  /// The query parameters (up to 10) to include in the redirect request to the
  /// authorization endpoint.
  final Map<String, String> authenticationRequestExtraParams;

  /// The behavior if the user is not authenticated. The following are possible
  /// values:
  ///
  /// *   deny `\- Return an HTTP 401 Unauthorized error.`
  ///
  /// ```*   allow `\- Allow the request to be forwarded to the target.`
  ///
  /// ``*   authenticate `\- Redirect the request to the IdP authorization
  /// endpoint. This is the default value.`
  ///
  /// `` ```
  final String onUnauthenticatedRequest;

  AuthenticateCognitoActionConfig({
    @required this.userPoolArn,
    @required this.userPoolClientId,
    @required this.userPoolDomain,
    this.sessionCookieName,
    this.scope,
    this.sessionTimeout,
    this.authenticationRequestExtraParams,
    this.onUnauthenticatedRequest,
  });
  static AuthenticateCognitoActionConfig fromJson(Map<String, dynamic> json) =>
      AuthenticateCognitoActionConfig();
}

class AuthenticateOidcActionConfig {
  /// The OIDC issuer identifier of the IdP. This must be a full URL, including
  /// the HTTPS protocol, the domain, and the path.
  final String issuer;

  /// The authorization endpoint of the IdP. This must be a full URL, including
  /// the HTTPS protocol, the domain, and the path.
  final String authorizationEndpoint;

  /// The token endpoint of the IdP. This must be a full URL, including the
  /// HTTPS protocol, the domain, and the path.
  final String tokenEndpoint;

  /// The user info endpoint of the IdP. This must be a full URL, including the
  /// HTTPS protocol, the domain, and the path.
  final String userInfoEndpoint;

  /// The OAuth 2.0 client identifier.
  final String clientId;

  /// The OAuth 2.0 client secret. This parameter is required if you are
  /// creating a rule. If you are modifying a rule, you can omit this parameter
  /// if you set `UseExistingClientSecret` to true.
  final String clientSecret;

  /// The name of the cookie used to maintain session information. The default
  /// is AWSELBAuthSessionCookie.
  final String sessionCookieName;

  /// The set of user claims to be requested from the IdP. The default is
  /// `openid`.
  ///
  /// To verify which scope values your IdP supports and how to separate
  /// multiple values, see the documentation for your IdP.
  final String scope;

  /// The maximum duration of the authentication session, in seconds. The
  /// default is 604800 seconds (7 days).
  final BigInt sessionTimeout;

  /// The query parameters (up to 10) to include in the redirect request to the
  /// authorization endpoint.
  final Map<String, String> authenticationRequestExtraParams;

  /// The behavior if the user is not authenticated. The following are possible
  /// values:
  ///
  /// *   deny `\- Return an HTTP 401 Unauthorized error.`
  ///
  /// ```*   allow `\- Allow the request to be forwarded to the target.`
  ///
  /// ``*   authenticate `\- Redirect the request to the IdP authorization
  /// endpoint. This is the default value.`
  ///
  /// `` ```
  final String onUnauthenticatedRequest;

  /// Indicates whether to use the existing client secret when modifying a rule.
  /// If you are creating a rule, you can omit this parameter or set it to
  /// false.
  final bool useExistingClientSecret;

  AuthenticateOidcActionConfig({
    @required this.issuer,
    @required this.authorizationEndpoint,
    @required this.tokenEndpoint,
    @required this.userInfoEndpoint,
    @required this.clientId,
    this.clientSecret,
    this.sessionCookieName,
    this.scope,
    this.sessionTimeout,
    this.authenticationRequestExtraParams,
    this.onUnauthenticatedRequest,
    this.useExistingClientSecret,
  });
  static AuthenticateOidcActionConfig fromJson(Map<String, dynamic> json) =>
      AuthenticateOidcActionConfig();
}

class AvailabilityZone {
  /// The name of the Availability Zone.
  final String zoneName;

  /// The ID of the subnet. You can specify one subnet per Availability Zone.
  final String subnetId;

  /// \[Network Load Balancers\] If you need static IP addresses for your load
  /// balancer, you can specify one Elastic IP address per Availability Zone
  /// when you create the load balancer.
  final List<LoadBalancerAddress> loadBalancerAddresses;

  AvailabilityZone({
    this.zoneName,
    this.subnetId,
    this.loadBalancerAddresses,
  });
  static AvailabilityZone fromJson(Map<String, dynamic> json) =>
      AvailabilityZone();
}

class Certificate {
  /// The Amazon Resource Name (ARN) of the certificate.
  final String certificateArn;

  /// Indicates whether the certificate is the default certificate. Do not set
  /// this value when specifying a certificate as an input. This value is not
  /// included in the output when describing a listener, but is included when
  /// describing listener certificates.
  final bool isDefault;

  Certificate({
    this.certificateArn,
    this.isDefault,
  });
  static Certificate fromJson(Map<String, dynamic> json) => Certificate();
}

class Cipher {
  /// The name of the cipher.
  final String name;

  /// The priority of the cipher.
  final int priority;

  Cipher({
    this.name,
    this.priority,
  });
  static Cipher fromJson(Map<String, dynamic> json) => Cipher();
}

class CreateListenerOutput {
  /// Information about the listener.
  final List<Listener> listeners;

  CreateListenerOutput({
    this.listeners,
  });
  static CreateListenerOutput fromJson(Map<String, dynamic> json) =>
      CreateListenerOutput();
}

class CreateLoadBalancerOutput {
  /// Information about the load balancer.
  final List<LoadBalancer> loadBalancers;

  CreateLoadBalancerOutput({
    this.loadBalancers,
  });
  static CreateLoadBalancerOutput fromJson(Map<String, dynamic> json) =>
      CreateLoadBalancerOutput();
}

class CreateRuleOutput {
  /// Information about the rule.
  final List<Rule> rules;

  CreateRuleOutput({
    this.rules,
  });
  static CreateRuleOutput fromJson(Map<String, dynamic> json) =>
      CreateRuleOutput();
}

class CreateTargetGroupOutput {
  /// Information about the target group.
  final List<TargetGroup> targetGroups;

  CreateTargetGroupOutput({
    this.targetGroups,
  });
  static CreateTargetGroupOutput fromJson(Map<String, dynamic> json) =>
      CreateTargetGroupOutput();
}

class DeleteListenerOutput {
  DeleteListenerOutput();
  static DeleteListenerOutput fromJson(Map<String, dynamic> json) =>
      DeleteListenerOutput();
}

class DeleteLoadBalancerOutput {
  DeleteLoadBalancerOutput();
  static DeleteLoadBalancerOutput fromJson(Map<String, dynamic> json) =>
      DeleteLoadBalancerOutput();
}

class DeleteRuleOutput {
  DeleteRuleOutput();
  static DeleteRuleOutput fromJson(Map<String, dynamic> json) =>
      DeleteRuleOutput();
}

class DeleteTargetGroupOutput {
  DeleteTargetGroupOutput();
  static DeleteTargetGroupOutput fromJson(Map<String, dynamic> json) =>
      DeleteTargetGroupOutput();
}

class DeregisterTargetsOutput {
  DeregisterTargetsOutput();
  static DeregisterTargetsOutput fromJson(Map<String, dynamic> json) =>
      DeregisterTargetsOutput();
}

class DescribeAccountLimitsOutput {
  /// Information about the limits.
  final List<Limit> limits;

  /// If there are additional results, this is the marker for the next set of
  /// results. Otherwise, this is null.
  final String nextMarker;

  DescribeAccountLimitsOutput({
    this.limits,
    this.nextMarker,
  });
  static DescribeAccountLimitsOutput fromJson(Map<String, dynamic> json) =>
      DescribeAccountLimitsOutput();
}

class DescribeListenerCertificatesOutput {
  /// Information about the certificates.
  final List<Certificate> certificates;

  /// If there are additional results, this is the marker for the next set of
  /// results. Otherwise, this is null.
  final String nextMarker;

  DescribeListenerCertificatesOutput({
    this.certificates,
    this.nextMarker,
  });
  static DescribeListenerCertificatesOutput fromJson(
          Map<String, dynamic> json) =>
      DescribeListenerCertificatesOutput();
}

class DescribeListenersOutput {
  /// Information about the listeners.
  final List<Listener> listeners;

  /// If there are additional results, this is the marker for the next set of
  /// results. Otherwise, this is null.
  final String nextMarker;

  DescribeListenersOutput({
    this.listeners,
    this.nextMarker,
  });
  static DescribeListenersOutput fromJson(Map<String, dynamic> json) =>
      DescribeListenersOutput();
}

class DescribeLoadBalancerAttributesOutput {
  /// Information about the load balancer attributes.
  final List<LoadBalancerAttribute> attributes;

  DescribeLoadBalancerAttributesOutput({
    this.attributes,
  });
  static DescribeLoadBalancerAttributesOutput fromJson(
          Map<String, dynamic> json) =>
      DescribeLoadBalancerAttributesOutput();
}

class DescribeLoadBalancersOutput {
  /// Information about the load balancers.
  final List<LoadBalancer> loadBalancers;

  /// If there are additional results, this is the marker for the next set of
  /// results. Otherwise, this is null.
  final String nextMarker;

  DescribeLoadBalancersOutput({
    this.loadBalancers,
    this.nextMarker,
  });
  static DescribeLoadBalancersOutput fromJson(Map<String, dynamic> json) =>
      DescribeLoadBalancersOutput();
}

class DescribeRulesOutput {
  /// Information about the rules.
  final List<Rule> rules;

  /// If there are additional results, this is the marker for the next set of
  /// results. Otherwise, this is null.
  final String nextMarker;

  DescribeRulesOutput({
    this.rules,
    this.nextMarker,
  });
  static DescribeRulesOutput fromJson(Map<String, dynamic> json) =>
      DescribeRulesOutput();
}

class DescribeSslPoliciesOutput {
  /// Information about the policies.
  final List<SslPolicy> sslPolicies;

  /// If there are additional results, this is the marker for the next set of
  /// results. Otherwise, this is null.
  final String nextMarker;

  DescribeSslPoliciesOutput({
    this.sslPolicies,
    this.nextMarker,
  });
  static DescribeSslPoliciesOutput fromJson(Map<String, dynamic> json) =>
      DescribeSslPoliciesOutput();
}

class DescribeTagsOutput {
  /// Information about the tags.
  final List<TagDescription> tagDescriptions;

  DescribeTagsOutput({
    this.tagDescriptions,
  });
  static DescribeTagsOutput fromJson(Map<String, dynamic> json) =>
      DescribeTagsOutput();
}

class DescribeTargetGroupAttributesOutput {
  /// Information about the target group attributes
  final List<TargetGroupAttribute> attributes;

  DescribeTargetGroupAttributesOutput({
    this.attributes,
  });
  static DescribeTargetGroupAttributesOutput fromJson(
          Map<String, dynamic> json) =>
      DescribeTargetGroupAttributesOutput();
}

class DescribeTargetGroupsOutput {
  /// Information about the target groups.
  final List<TargetGroup> targetGroups;

  /// If there are additional results, this is the marker for the next set of
  /// results. Otherwise, this is null.
  final String nextMarker;

  DescribeTargetGroupsOutput({
    this.targetGroups,
    this.nextMarker,
  });
  static DescribeTargetGroupsOutput fromJson(Map<String, dynamic> json) =>
      DescribeTargetGroupsOutput();
}

class DescribeTargetHealthOutput {
  /// Information about the health of the targets.
  final List<TargetHealthDescription> targetHealthDescriptions;

  DescribeTargetHealthOutput({
    this.targetHealthDescriptions,
  });
  static DescribeTargetHealthOutput fromJson(Map<String, dynamic> json) =>
      DescribeTargetHealthOutput();
}

class FixedResponseActionConfig {
  /// The message.
  final String messageBody;

  /// The HTTP response code (2XX, 4XX, or 5XX).
  final String statusCode;

  /// The content type.
  ///
  /// Valid Values: text/plain | text/css | text/html | application/javascript |
  /// application/json
  final String contentType;

  FixedResponseActionConfig({
    this.messageBody,
    @required this.statusCode,
    this.contentType,
  });
  static FixedResponseActionConfig fromJson(Map<String, dynamic> json) =>
      FixedResponseActionConfig();
}

class HostHeaderConditionConfig {
  /// One or more host names. The maximum size of each name is 128 characters.
  /// The comparison is case insensitive. The following wildcard characters are
  /// supported: * (matches 0 or more characters) and ? (matches exactly 1
  /// character).
  ///
  /// If you specify multiple strings, the condition is satisfied if one of the
  /// strings matches the host name.
  final List<String> values;

  HostHeaderConditionConfig({
    this.values,
  });
  static HostHeaderConditionConfig fromJson(Map<String, dynamic> json) =>
      HostHeaderConditionConfig();
}

class HttpHeaderConditionConfig {
  /// The name of the HTTP header field. The maximum size is 40 characters. The
  /// header name is case insensitive. The allowed characters are specified by
  /// RFC 7230. Wildcards are not supported.
  ///
  /// You can't use an HTTP header condition to specify the host header. Use
  /// HostHeaderConditionConfig to specify a host header condition.
  final String httpHeaderName;

  /// One or more strings to compare against the value of the HTTP header. The
  /// maximum size of each string is 128 characters. The comparison strings are
  /// case insensitive. The following wildcard characters are supported: *
  /// (matches 0 or more characters) and ? (matches exactly 1 character).
  ///
  /// If the same header appears multiple times in the request, we search them
  /// in order until a match is found.
  ///
  /// If you specify multiple strings, the condition is satisfied if one of the
  /// strings matches the value of the HTTP header. To require that all of the
  /// strings are a match, create one condition per string.
  final List<String> values;

  HttpHeaderConditionConfig({
    this.httpHeaderName,
    this.values,
  });
  static HttpHeaderConditionConfig fromJson(Map<String, dynamic> json) =>
      HttpHeaderConditionConfig();
}

class HttpRequestMethodConditionConfig {
  /// The name of the request method. The maximum size is 40 characters. The
  /// allowed characters are A-Z, hyphen (-), and underscore (_). The comparison
  /// is case sensitive. Wildcards are not supported; therefore, the method name
  /// must be an exact match.
  ///
  /// If you specify multiple strings, the condition is satisfied if one of the
  /// strings matches the HTTP request method. We recommend that you route GET
  /// and HEAD requests in the same way, because the response to a HEAD request
  /// may be cached.
  final List<String> values;

  HttpRequestMethodConditionConfig({
    this.values,
  });
  static HttpRequestMethodConditionConfig fromJson(Map<String, dynamic> json) =>
      HttpRequestMethodConditionConfig();
}

class Limit {
  /// The name of the limit. The possible values are:
  ///
  /// *   application-load-balancers
  ///
  /// *   listeners-per-application-load-balancer
  ///
  /// *   listeners-per-network-load-balancer
  ///
  /// *   network-load-balancers
  ///
  /// *   rules-per-application-load-balancer
  ///
  /// *   target-groups
  ///
  /// *   targets-per-application-load-balancer
  ///
  /// *   targets-per-availability-zone-per-network-load-balancer
  ///
  /// *   targets-per-network-load-balancer
  final String name;

  /// The maximum value of the limit.
  final String max;

  Limit({
    this.name,
    this.max,
  });
  static Limit fromJson(Map<String, dynamic> json) => Limit();
}

class Listener {
  /// The Amazon Resource Name (ARN) of the listener.
  final String listenerArn;

  /// The Amazon Resource Name (ARN) of the load balancer.
  final String loadBalancerArn;

  /// The port on which the load balancer is listening.
  final int port;

  /// The protocol for connections from clients to the load balancer.
  final String protocol;

  /// \[HTTPS or TLS listener\] The default certificate for the listener.
  final List<Certificate> certificates;

  /// \[HTTPS or TLS listener\] The security policy that defines which ciphers
  /// and protocols are supported. The default is the current predefined
  /// security policy.
  final String sslPolicy;

  /// The default actions for the listener.
  final List<Action> defaultActions;

  Listener({
    this.listenerArn,
    this.loadBalancerArn,
    this.port,
    this.protocol,
    this.certificates,
    this.sslPolicy,
    this.defaultActions,
  });
  static Listener fromJson(Map<String, dynamic> json) => Listener();
}

class LoadBalancer {
  /// The Amazon Resource Name (ARN) of the load balancer.
  final String loadBalancerArn;

  /// The public DNS name of the load balancer.
  final String dnsName;

  /// The ID of the Amazon Route 53 hosted zone associated with the load
  /// balancer.
  final String canonicalHostedZoneId;

  /// The date and time the load balancer was created.
  final DateTime createdTime;

  /// The name of the load balancer.
  final String loadBalancerName;

  /// The nodes of an Internet-facing load balancer have public IP addresses.
  /// The DNS name of an Internet-facing load balancer is publicly resolvable to
  /// the public IP addresses of the nodes. Therefore, Internet-facing load
  /// balancers can route requests from clients over the internet.
  ///
  /// The nodes of an internal load balancer have only private IP addresses. The
  /// DNS name of an internal load balancer is publicly resolvable to the
  /// private IP addresses of the nodes. Therefore, internal load balancers can
  /// only route requests from clients with access to the VPC for the load
  /// balancer.
  final String scheme;

  /// The ID of the VPC for the load balancer.
  final String vpcId;

  /// The state of the load balancer.
  final LoadBalancerState state;

  /// The type of load balancer.
  final String type;

  /// The Availability Zones for the load balancer.
  final List<AvailabilityZone> availabilityZones;

  /// The IDs of the security groups for the load balancer.
  final List<String> securityGroups;

  /// The type of IP addresses used by the subnets for your load balancer. The
  /// possible values are `ipv4` (for IPv4 addresses) and `dualstack` (for IPv4
  /// and IPv6 addresses).
  final String ipAddressType;

  LoadBalancer({
    this.loadBalancerArn,
    this.dnsName,
    this.canonicalHostedZoneId,
    this.createdTime,
    this.loadBalancerName,
    this.scheme,
    this.vpcId,
    this.state,
    this.type,
    this.availabilityZones,
    this.securityGroups,
    this.ipAddressType,
  });
  static LoadBalancer fromJson(Map<String, dynamic> json) => LoadBalancer();
}

class LoadBalancerAddress {
  /// The static IP address.
  final String ipAddress;

  /// \[Network Load Balancers\] The allocation ID of the Elastic IP address.
  final String allocationId;

  LoadBalancerAddress({
    this.ipAddress,
    this.allocationId,
  });
  static LoadBalancerAddress fromJson(Map<String, dynamic> json) =>
      LoadBalancerAddress();
}

class LoadBalancerAttribute {
  /// The name of the attribute.
  ///
  /// The following attributes are supported by both Application Load Balancers
  /// and Network Load Balancers:
  ///
  /// *    `access_logs.s3.enabled` \- Indicates whether access logs are
  /// enabled. The value is `true` or `false`. The default is `false`.
  ///
  /// *    `access_logs.s3.bucket` \- The name of the S3 bucket for the access
  /// logs. This attribute is required if access logs are enabled. The bucket
  /// must exist in the same region as the load balancer and have a bucket
  /// policy that grants Elastic Load Balancing permissions to write to the
  /// bucket.
  ///
  /// *    `access_logs.s3.prefix` \- The prefix for the location in the S3
  /// bucket for the access logs.
  ///
  /// *    `deletion_protection.enabled` \- Indicates whether deletion
  /// protection is enabled. The value is `true` or `false`. The default is
  /// `false`.
  ///
  ///
  /// The following attributes are supported by only Application Load Balancers:
  ///
  /// *    `idle\_timeout.timeout\_seconds` \- The idle timeout value, in
  /// seconds. The valid range is 1-4000 seconds. The default is 60 seconds.
  ///
  /// *    `routing.http2.enabled` \- Indicates whether HTTP/2 is enabled. The
  /// value is `true` or `false`. The default is `true`.
  ///
  ///
  /// The following attributes are supported by only Network Load Balancers:
  ///
  /// *    `load\_balancing.cross\_zone.enabled` \- Indicates whether cross-zone
  /// load balancing is enabled. The value is `true` or `false`. The default is
  /// `false`.
  final String key;

  /// The value of the attribute.
  final String value;

  LoadBalancerAttribute({
    this.key,
    this.value,
  });
  static LoadBalancerAttribute fromJson(Map<String, dynamic> json) =>
      LoadBalancerAttribute();
}

class LoadBalancerState {
  /// The state code. The initial state of the load balancer is `provisioning`.
  /// After the load balancer is fully set up and ready to route traffic, its
  /// state is `active`. If the load balancer could not be set up, its state is
  /// `failed`.
  final String code;

  /// A description of the state.
  final String reason;

  LoadBalancerState({
    this.code,
    this.reason,
  });
  static LoadBalancerState fromJson(Map<String, dynamic> json) =>
      LoadBalancerState();
}

class Matcher {
  /// The HTTP codes.
  ///
  /// For Application Load Balancers, you can specify values between 200 and
  /// 499, and the default value is 200. You can specify multiple values (for
  /// example, "200,202") or a range of values (for example, "200-299").
  ///
  /// For Network Load Balancers, this is 200–399.
  final String httpCode;

  Matcher({
    @required this.httpCode,
  });
  static Matcher fromJson(Map<String, dynamic> json) => Matcher();
}

class ModifyListenerOutput {
  /// Information about the modified listener.
  final List<Listener> listeners;

  ModifyListenerOutput({
    this.listeners,
  });
  static ModifyListenerOutput fromJson(Map<String, dynamic> json) =>
      ModifyListenerOutput();
}

class ModifyLoadBalancerAttributesOutput {
  /// Information about the load balancer attributes.
  final List<LoadBalancerAttribute> attributes;

  ModifyLoadBalancerAttributesOutput({
    this.attributes,
  });
  static ModifyLoadBalancerAttributesOutput fromJson(
          Map<String, dynamic> json) =>
      ModifyLoadBalancerAttributesOutput();
}

class ModifyRuleOutput {
  /// Information about the modified rule.
  final List<Rule> rules;

  ModifyRuleOutput({
    this.rules,
  });
  static ModifyRuleOutput fromJson(Map<String, dynamic> json) =>
      ModifyRuleOutput();
}

class ModifyTargetGroupAttributesOutput {
  /// Information about the attributes.
  final List<TargetGroupAttribute> attributes;

  ModifyTargetGroupAttributesOutput({
    this.attributes,
  });
  static ModifyTargetGroupAttributesOutput fromJson(
          Map<String, dynamic> json) =>
      ModifyTargetGroupAttributesOutput();
}

class ModifyTargetGroupOutput {
  /// Information about the modified target group.
  final List<TargetGroup> targetGroups;

  ModifyTargetGroupOutput({
    this.targetGroups,
  });
  static ModifyTargetGroupOutput fromJson(Map<String, dynamic> json) =>
      ModifyTargetGroupOutput();
}

class PathPatternConditionConfig {
  /// One or more path patterns to compare against the request URL. The maximum
  /// size of each string is 128 characters. The comparison is case sensitive.
  /// The following wildcard characters are supported: * (matches 0 or more
  /// characters) and ? (matches exactly 1 character).
  ///
  /// If you specify multiple strings, the condition is satisfied if one of them
  /// matches the request URL. The path pattern is compared only to the path of
  /// the URL, not to its query string. To compare against the query string, use
  /// QueryStringConditionConfig.
  final List<String> values;

  PathPatternConditionConfig({
    this.values,
  });
  static PathPatternConditionConfig fromJson(Map<String, dynamic> json) =>
      PathPatternConditionConfig();
}

class QueryStringConditionConfig {
  /// One or more key/value pairs or values to find in the query string. The
  /// maximum size of each string is 128 characters. The comparison is case
  /// insensitive. The following wildcard characters are supported: * (matches 0
  /// or more characters) and ? (matches exactly 1 character). To search for a
  /// literal '*' or '?' character in a query string, you must escape these
  /// characters in `Values` using a '\\' character.
  ///
  /// If you specify multiple key/value pairs or values, the condition is
  /// satisfied if one of them is found in the query string.
  final List<QueryStringKeyValuePair> values;

  QueryStringConditionConfig({
    this.values,
  });
  static QueryStringConditionConfig fromJson(Map<String, dynamic> json) =>
      QueryStringConditionConfig();
}

class QueryStringKeyValuePair {
  /// The key. You can omit the key.
  final String key;

  /// The value.
  final String value;

  QueryStringKeyValuePair({
    this.key,
    this.value,
  });
  static QueryStringKeyValuePair fromJson(Map<String, dynamic> json) =>
      QueryStringKeyValuePair();
}

class RedirectActionConfig {
  /// The protocol. You can specify HTTP, HTTPS, or #{protocol}. You can
  /// redirect HTTP to HTTP, HTTP to HTTPS, and HTTPS to HTTPS. You cannot
  /// redirect HTTPS to HTTP.
  final String protocol;

  /// The port. You can specify a value from 1 to 65535 or #{port}.
  final String port;

  /// The hostname. This component is not percent-encoded. The hostname can
  /// contain #{host}.
  final String host;

  /// The absolute path, starting with the leading "/". This component is not
  /// percent-encoded. The path can contain #{host}, #{path}, and #{port}.
  final String path;

  /// The query parameters, URL-encoded when necessary, but not percent-encoded.
  /// Do not include the leading "?", as it is automatically added. You can
  /// specify any of the reserved keywords.
  final String query;

  /// The HTTP redirect code. The redirect is either permanent (HTTP 301) or
  /// temporary (HTTP 302).
  final String statusCode;

  RedirectActionConfig({
    this.protocol,
    this.port,
    this.host,
    this.path,
    this.query,
    @required this.statusCode,
  });
  static RedirectActionConfig fromJson(Map<String, dynamic> json) =>
      RedirectActionConfig();
}

class RegisterTargetsOutput {
  RegisterTargetsOutput();
  static RegisterTargetsOutput fromJson(Map<String, dynamic> json) =>
      RegisterTargetsOutput();
}

class RemoveListenerCertificatesOutput {
  RemoveListenerCertificatesOutput();
  static RemoveListenerCertificatesOutput fromJson(Map<String, dynamic> json) =>
      RemoveListenerCertificatesOutput();
}

class RemoveTagsOutput {
  RemoveTagsOutput();
  static RemoveTagsOutput fromJson(Map<String, dynamic> json) =>
      RemoveTagsOutput();
}

class Rule {
  /// The Amazon Resource Name (ARN) of the rule.
  final String ruleArn;

  /// The priority.
  final String priority;

  /// The conditions. Each rule can include zero or one of the following
  /// conditions: `http-request-method`, `host-header`, `path-pattern`, and
  /// `source-ip`, and zero or more of the following conditions: `http-header`
  /// and `query-string`.
  final List<RuleCondition> conditions;

  /// The actions. Each rule must include exactly one of the following types of
  /// actions: `forward`, `redirect`, or `fixed-response`, and it must be the
  /// last action to be performed.
  final List<Action> actions;

  /// Indicates whether this is the default rule.
  final bool isDefault;

  Rule({
    this.ruleArn,
    this.priority,
    this.conditions,
    this.actions,
    this.isDefault,
  });
  static Rule fromJson(Map<String, dynamic> json) => Rule();
}

class RuleCondition {
  /// The field in the HTTP request. The following are the possible values:
  ///
  /// *    `http-header`
  ///
  /// *    `http-request-method`
  ///
  /// *    `host-header`
  ///
  /// *    `path-pattern`
  ///
  /// *    `query-string`
  ///
  /// *    `source-ip`
  final String field;

  /// The condition value. You can use `Values` if the rule contains only
  /// `host-header` and `path-pattern` conditions. Otherwise, you can use
  /// `HostHeaderConfig` for `host-header` conditions and `PathPatternConfig`
  /// for `path-pattern` conditions.
  ///
  /// If `Field` is `host-header`, you can specify a single host name (for
  /// example, my.example.com). A host name is case insensitive, can be up to
  /// 128 characters in length, and can contain any of the following characters.
  ///
  /// *   A-Z, a-z, 0-9
  ///
  /// *   \- .
  ///
  /// *   \* (matches 0 or more characters)
  ///
  /// *   ? (matches exactly 1 character)
  ///
  ///
  /// If `Field` is `path-pattern`, you can specify a single path pattern (for
  /// example, /img/*). A path pattern is case-sensitive, can be up to 128
  /// characters in length, and can contain any of the following characters.
  ///
  /// *   A-Z, a-z, 0-9
  ///
  /// *   _ - . $ / ~ " ' @ : +
  ///
  /// *   & (using &amp;)
  ///
  /// *   \* (matches 0 or more characters)
  ///
  /// *   ? (matches exactly 1 character)
  final List<String> values;

  /// Information for a host header condition. Specify only when `Field` is
  /// `host-header`.
  final HostHeaderConditionConfig hostHeaderConfig;

  /// Information for a path pattern condition. Specify only when `Field` is
  /// `path-pattern`.
  final PathPatternConditionConfig pathPatternConfig;

  /// Information for an HTTP header condition. Specify only when `Field` is
  /// `http-header`.
  final HttpHeaderConditionConfig httpHeaderConfig;

  /// Information for a query string condition. Specify only when `Field` is
  /// `query-string`.
  final QueryStringConditionConfig queryStringConfig;

  /// Information for an HTTP method condition. Specify only when `Field` is
  /// `http-request-method`.
  final HttpRequestMethodConditionConfig httpRequestMethodConfig;

  /// Information for a source IP condition. Specify only when `Field` is
  /// `source-ip`.
  final SourceIpConditionConfig sourceIpConfig;

  RuleCondition({
    this.field,
    this.values,
    this.hostHeaderConfig,
    this.pathPatternConfig,
    this.httpHeaderConfig,
    this.queryStringConfig,
    this.httpRequestMethodConfig,
    this.sourceIpConfig,
  });
  static RuleCondition fromJson(Map<String, dynamic> json) => RuleCondition();
}

class RulePriorityPair {
  /// The Amazon Resource Name (ARN) of the rule.
  final String ruleArn;

  /// The rule priority.
  final int priority;

  RulePriorityPair({
    this.ruleArn,
    this.priority,
  });
}

class SetIpAddressTypeOutput {
  /// The IP address type.
  final String ipAddressType;

  SetIpAddressTypeOutput({
    this.ipAddressType,
  });
  static SetIpAddressTypeOutput fromJson(Map<String, dynamic> json) =>
      SetIpAddressTypeOutput();
}

class SetRulePrioritiesOutput {
  /// Information about the rules.
  final List<Rule> rules;

  SetRulePrioritiesOutput({
    this.rules,
  });
  static SetRulePrioritiesOutput fromJson(Map<String, dynamic> json) =>
      SetRulePrioritiesOutput();
}

class SetSecurityGroupsOutput {
  /// The IDs of the security groups associated with the load balancer.
  final List<String> securityGroupIds;

  SetSecurityGroupsOutput({
    this.securityGroupIds,
  });
  static SetSecurityGroupsOutput fromJson(Map<String, dynamic> json) =>
      SetSecurityGroupsOutput();
}

class SetSubnetsOutput {
  /// Information about the subnet and Availability Zone.
  final List<AvailabilityZone> availabilityZones;

  SetSubnetsOutput({
    this.availabilityZones,
  });
  static SetSubnetsOutput fromJson(Map<String, dynamic> json) =>
      SetSubnetsOutput();
}

class SourceIpConditionConfig {
  /// One or more source IP addresses, in CIDR format. You can use both IPv4 and
  /// IPv6 addresses. Wildcards are not supported.
  ///
  /// If you specify multiple addresses, the condition is satisfied if the
  /// source IP address of the request matches one of the CIDR blocks. This
  /// condition is not satisfied by the addresses in the X-Forwarded-For header.
  /// To search for addresses in the X-Forwarded-For header, use
  /// HttpHeaderConditionConfig.
  final List<String> values;

  SourceIpConditionConfig({
    this.values,
  });
  static SourceIpConditionConfig fromJson(Map<String, dynamic> json) =>
      SourceIpConditionConfig();
}

class SslPolicy {
  /// The protocols.
  final List<String> sslProtocols;

  /// The ciphers.
  final List<Cipher> ciphers;

  /// The name of the policy.
  final String name;

  SslPolicy({
    this.sslProtocols,
    this.ciphers,
    this.name,
  });
  static SslPolicy fromJson(Map<String, dynamic> json) => SslPolicy();
}

class SubnetMapping {
  /// The ID of the subnet.
  final String subnetId;

  /// \[Network Load Balancers\] The allocation ID of the Elastic IP address.
  final String allocationId;

  SubnetMapping({
    this.subnetId,
    this.allocationId,
  });
}

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

class TagDescription {
  /// The Amazon Resource Name (ARN) of the resource.
  final String resourceArn;

  /// Information about the tags.
  final List<Tag> tags;

  TagDescription({
    this.resourceArn,
    this.tags,
  });
  static TagDescription fromJson(Map<String, dynamic> json) => TagDescription();
}

class TargetDescription {
  /// The ID of the target. If the target type of the target group is
  /// `instance`, specify an instance ID. If the target type is `ip`, specify an
  /// IP address. If the target type is `lambda`, specify the ARN of the Lambda
  /// function.
  final String id;

  /// The port on which the target is listening.
  final int port;

  /// An Availability Zone or `all`. This determines whether the target receives
  /// traffic from the load balancer nodes in the specified Availability Zone or
  /// from all enabled Availability Zones for the load balancer.
  ///
  /// This parameter is not supported if the target type of the target group is
  /// `instance`.
  ///
  /// If the target type is `ip` and the IP address is in a subnet of the VPC
  /// for the target group, the Availability Zone is automatically detected and
  /// this parameter is optional. If the IP address is outside the VPC, this
  /// parameter is required.
  ///
  /// With an Application Load Balancer, if the target type is `ip` and the IP
  /// address is outside the VPC for the target group, the only supported value
  /// is `all`.
  ///
  /// If the target type is `lambda`, this parameter is optional and the only
  /// supported value is `all`.
  final String availabilityZone;

  TargetDescription({
    @required this.id,
    this.port,
    this.availabilityZone,
  });
  static TargetDescription fromJson(Map<String, dynamic> json) =>
      TargetDescription();
}

class TargetGroup {
  /// The Amazon Resource Name (ARN) of the target group.
  final String targetGroupArn;

  /// The name of the target group.
  final String targetGroupName;

  /// The protocol to use for routing traffic to the targets.
  final String protocol;

  /// The port on which the targets are listening.
  final int port;

  /// The ID of the VPC for the targets.
  final String vpcId;

  /// The protocol to use to connect with the target.
  final String healthCheckProtocol;

  /// The port to use to connect with the target.
  final String healthCheckPort;

  /// Indicates whether health checks are enabled.
  final bool healthCheckEnabled;

  /// The approximate amount of time, in seconds, between health checks of an
  /// individual target.
  final int healthCheckIntervalSeconds;

  /// The amount of time, in seconds, during which no response means a failed
  /// health check.
  final int healthCheckTimeoutSeconds;

  /// The number of consecutive health checks successes required before
  /// considering an unhealthy target healthy.
  final int healthyThresholdCount;

  /// The number of consecutive health check failures required before
  /// considering the target unhealthy.
  final int unhealthyThresholdCount;

  /// The destination for the health check request.
  final String healthCheckPath;

  /// The HTTP codes to use when checking for a successful response from a
  /// target.
  final Matcher matcher;

  /// The Amazon Resource Names (ARN) of the load balancers that route traffic
  /// to this target group.
  final List<String> loadBalancerArns;

  /// The type of target that you must specify when registering targets with
  /// this target group. The possible values are `instance` (targets are
  /// specified by instance ID) or `ip` (targets are specified by IP address).
  final String targetType;

  TargetGroup({
    this.targetGroupArn,
    this.targetGroupName,
    this.protocol,
    this.port,
    this.vpcId,
    this.healthCheckProtocol,
    this.healthCheckPort,
    this.healthCheckEnabled,
    this.healthCheckIntervalSeconds,
    this.healthCheckTimeoutSeconds,
    this.healthyThresholdCount,
    this.unhealthyThresholdCount,
    this.healthCheckPath,
    this.matcher,
    this.loadBalancerArns,
    this.targetType,
  });
  static TargetGroup fromJson(Map<String, dynamic> json) => TargetGroup();
}

class TargetGroupAttribute {
  /// The name of the attribute.
  ///
  /// The following attribute is supported by both Application Load Balancers
  /// and Network Load Balancers:
  ///
  /// *    `deregistration\_delay.timeout\_seconds` \- The amount of time, in
  /// seconds, for Elastic Load Balancing to wait before changing the state of a
  /// deregistering target from `draining` to `unused`. The range is 0-3600
  /// seconds. The default value is 300 seconds. If the target is a Lambda
  /// function, this attribute is not supported.
  ///
  ///
  /// The following attributes are supported by Application Load Balancers if
  /// the target is not a Lambda function:
  ///
  /// *    `slow\_start.duration\_seconds` \- The time period, in seconds,
  /// during which a newly registered target receives a linearly increasing
  /// share of the traffic to the target group. After this time period ends, the
  /// target receives its full share of traffic. The range is 30-900 seconds (15
  /// minutes). Slow start mode is disabled by default.
  ///
  /// *    `stickiness.enabled` \- Indicates whether sticky sessions are
  /// enabled. The value is `true` or `false`. The default is `false`.
  ///
  /// *    `stickiness.type` \- The type of sticky sessions. The possible value
  /// is `lb_cookie`.
  ///
  /// *    `stickiness.lb\_cookie.duration\_seconds` \- The time period, in
  /// seconds, during which requests from a client should be routed to the same
  /// target. After this time period expires, the load balancer-generated cookie
  /// is considered stale. The range is 1 second to 1 week (604800 seconds). The
  /// default value is 1 day (86400 seconds).
  ///
  ///
  /// The following attribute is supported only if the target is a Lambda
  /// function.
  ///
  /// *    `lambda.multi\_value\_headers.enabled` \- Indicates whether the
  /// request and response headers exchanged between the load balancer and the
  /// Lambda function include arrays of values or strings. The value is `true`
  /// or `false`. The default is `false`. If the value is `false` and the
  /// request contains a duplicate header field name or query parameter key, the
  /// load balancer uses the last value sent by the client.
  ///
  ///
  /// The following attribute is supported only by Network Load Balancers:
  ///
  /// *    `proxy\_protocol\_v2.enabled` \- Indicates whether Proxy Protocol
  /// version 2 is enabled. The value is `true` or `false`. The default is
  /// `false`.
  final String key;

  /// The value of the attribute.
  final String value;

  TargetGroupAttribute({
    this.key,
    this.value,
  });
  static TargetGroupAttribute fromJson(Map<String, dynamic> json) =>
      TargetGroupAttribute();
}

class TargetHealth {
  /// The state of the target.
  final String state;

  /// The reason code.
  ///
  /// If the target state is `healthy`, a reason code is not provided.
  ///
  /// If the target state is `initial`, the reason code can be one of the
  /// following values:
  ///
  /// *    `Elb.RegistrationInProgress` \- The target is in the process of being
  /// registered with the load balancer.
  ///
  /// *    `Elb.InitialHealthChecking` \- The load balancer is still sending the
  /// target the minimum number of health checks required to determine its
  /// health status.
  ///
  ///
  /// If the target state is `unhealthy`, the reason code can be one of the
  /// following values:
  ///
  /// *    `Target.ResponseCodeMismatch` \- The health checks did not return an
  /// expected HTTP code.
  ///
  /// *    `Target.Timeout` \- The health check requests timed out.
  ///
  /// *    `Target.FailedHealthChecks` \- The load balancer received an error
  /// while establishing a connection to the target or the target response was
  /// malformed.
  ///
  /// *    `Elb.InternalError` \- The health checks failed due to an internal
  /// error.
  ///
  ///
  /// If the target state is `unused`, the reason code can be one of the
  /// following values:
  ///
  /// *    `Target.NotRegistered` \- The target is not registered with the
  /// target group.
  ///
  /// *    `Target.NotInUse` \- The target group is not used by any load
  /// balancer or the target is in an Availability Zone that is not enabled for
  /// its load balancer.
  ///
  /// *    `Target.IpUnusable` \- The target IP address is reserved for use by a
  /// load balancer.
  ///
  /// *    `Target.InvalidState` \- The target is in the stopped or terminated
  /// state.
  ///
  ///
  /// If the target state is `draining`, the reason code can be the following
  /// value:
  ///
  /// *    `Target.DeregistrationInProgress` \- The target is in the process of
  /// being deregistered and the deregistration delay period has not expired.
  ///
  ///
  /// If the target state is `unavailable`, the reason code can be the following
  /// value:
  ///
  /// *    `Target.HealthCheckDisabled` \- Health checks are disabled for the
  /// target group.
  final String reason;

  /// A description of the target health that provides additional details. If
  /// the state is `healthy`, a description is not provided.
  final String description;

  TargetHealth({
    this.state,
    this.reason,
    this.description,
  });
  static TargetHealth fromJson(Map<String, dynamic> json) => TargetHealth();
}

class TargetHealthDescription {
  /// The description of the target.
  final TargetDescription target;

  /// The port to use to connect with the target.
  final String healthCheckPort;

  /// The health information for the target.
  final TargetHealth targetHealth;

  TargetHealthDescription({
    this.target,
    this.healthCheckPort,
    this.targetHealth,
  });
  static TargetHealthDescription fromJson(Map<String, dynamic> json) =>
      TargetHealthDescription();
}
