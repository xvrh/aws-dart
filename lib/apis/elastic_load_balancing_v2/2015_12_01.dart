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
  Future<void> addListenerCertificates(
      {@required String listenerArn,
      @required List<Certificate> certificates}) async {}

  /// Adds the specified tags to the specified Elastic Load Balancing resource.
  /// You can tag your Application Load Balancers, Network Load Balancers, and
  /// your target groups.
  ///
  /// Each tag consists of a key and an optional value. If a resource already
  /// has a tag with the same key, `AddTags` updates its value.
  ///
  /// To list the current tags for your resources, use DescribeTags. To remove
  /// tags from your resources, use RemoveTags.
  Future<void> addTags(
      {@required List<String> resourceArns, @required List<Tag> tags}) async {}

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
  Future<void> createListener(
      {@required String loadBalancerArn,
      @required String protocol,
      @required int port,
      String sslPolicy,
      List<Certificate> certificates,
      @required List<Action> defaultActions}) async {}

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
  Future<void> createLoadBalancer(String name,
      {List<String> subnets,
      List<SubnetMapping> subnetMappings,
      List<String> securityGroups,
      String scheme,
      List<Tag> tags,
      String type,
      String ipAddressType}) async {}

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
  Future<void> createRule(
      {@required String listenerArn,
      @required List<RuleCondition> conditions,
      @required int priority,
      @required List<Action> actions}) async {}

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
  Future<void> createTargetGroup(String name,
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
      String targetType}) async {}

  /// Deletes the specified listener.
  ///
  /// Alternatively, your listener is deleted when you delete the load balancer
  /// to which it is attached, using DeleteLoadBalancer.
  Future<void> deleteListener(String listenerArn) async {}

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
  Future<void> deleteLoadBalancer(String loadBalancerArn) async {}

  /// Deletes the specified rule.
  Future<void> deleteRule(String ruleArn) async {}

  /// Deletes the specified target group.
  ///
  /// You can delete a target group if it is not referenced by any actions.
  /// Deleting a target group also deletes any associated health checks.
  Future<void> deleteTargetGroup(String targetGroupArn) async {}

  /// Deregisters the specified targets from the specified target group. After
  /// the targets are deregistered, they no longer receive traffic from the load
  /// balancer.
  Future<void> deregisterTargets(
      {@required String targetGroupArn,
      @required List<TargetDescription> targets}) async {}

  /// Describes the current Elastic Load Balancing resource limits for your AWS
  /// account.
  ///
  /// For more information, see [Limits for Your Application Load
  /// Balancers](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-limits.html)
  /// in the _Application Load Balancer Guide_ or [Limits for Your Network Load
  /// Balancers](https://docs.aws.amazon.com/elasticloadbalancing/latest/network/load-balancer-limits.html)
  /// in the _Network Load Balancers Guide_.
  Future<void> describeAccountLimits({String marker, int pageSize}) async {}

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
  Future<void> describeListenerCertificates(String listenerArn,
      {String marker, int pageSize}) async {}

  /// Describes the specified listeners or the listeners for the specified
  /// Application Load Balancer or Network Load Balancer. You must specify
  /// either a load balancer or one or more listeners.
  ///
  /// For an HTTPS or TLS listener, the output includes the default certificate
  /// for the listener. To describe the certificate list for the listener, use
  /// DescribeListenerCertificates.
  Future<void> describeListeners(
      {String loadBalancerArn,
      List<String> listenerArns,
      String marker,
      int pageSize}) async {}

  /// Describes the attributes for the specified Application Load Balancer or
  /// Network Load Balancer.
  ///
  /// For more information, see [Load Balancer
  /// Attributes](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/application-load-balancers.html#load-balancer-attributes)
  /// in the _Application Load Balancers Guide_ or [Load Balancer
  /// Attributes](https://docs.aws.amazon.com/elasticloadbalancing/latest/network/network-load-balancers.html#load-balancer-attributes)
  /// in the _Network Load Balancers Guide_.
  Future<void> describeLoadBalancerAttributes(String loadBalancerArn) async {}

  /// Describes the specified load balancers or all of your load balancers.
  ///
  /// To describe the listeners for a load balancer, use DescribeListeners. To
  /// describe the attributes for a load balancer, use
  /// DescribeLoadBalancerAttributes.
  Future<void> describeLoadBalancers(
      {List<String> loadBalancerArns,
      List<String> names,
      String marker,
      int pageSize}) async {}

  /// Describes the specified rules or the rules for the specified listener. You
  /// must specify either a listener or one or more rules.
  Future<void> describeRules(
      {String listenerArn,
      List<String> ruleArns,
      String marker,
      int pageSize}) async {}

  /// Describes the specified policies or all policies used for SSL negotiation.
  ///
  /// For more information, see [Security
  /// Policies](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/create-https-listener.html#describe-ssl-policies)
  /// in the _Application Load Balancers Guide_.
  Future<void> describeSslPolicies(
      {List<String> names, String marker, int pageSize}) async {}

  /// Describes the tags for the specified resources. You can describe the tags
  /// for one or more Application Load Balancers, Network Load Balancers, and
  /// target groups.
  Future<void> describeTags(List<String> resourceArns) async {}

  /// Describes the attributes for the specified target group.
  ///
  /// For more information, see [Target Group
  /// Attributes](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-target-groups.html#target-group-attributes)
  /// in the _Application Load Balancers Guide_ or [Target Group
  /// Attributes](https://docs.aws.amazon.com/elasticloadbalancing/latest/network/load-balancer-target-groups.html#target-group-attributes)
  /// in the _Network Load Balancers Guide_.
  Future<void> describeTargetGroupAttributes(String targetGroupArn) async {}

  /// Describes the specified target groups or all of your target groups. By
  /// default, all target groups are described. Alternatively, you can specify
  /// one of the following to filter the results: the ARN of the load balancer,
  /// the names of one or more target groups, or the ARNs of one or more target
  /// groups.
  ///
  /// To describe the targets for a target group, use DescribeTargetHealth. To
  /// describe the attributes of a target group, use
  /// DescribeTargetGroupAttributes.
  Future<void> describeTargetGroups(
      {String loadBalancerArn,
      List<String> targetGroupArns,
      List<String> names,
      String marker,
      int pageSize}) async {}

  /// Describes the health of the specified targets or all of your targets.
  Future<void> describeTargetHealth(String targetGroupArn,
      {List<TargetDescription> targets}) async {}

  /// Modifies the specified properties of the specified listener.
  ///
  /// Any properties that you do not specify retain their current values.
  /// However, changing the protocol from HTTPS to HTTP, or from TLS to TCP,
  /// removes the security policy and default certificate properties. If you
  /// change the protocol from HTTP to HTTPS, or from TCP to TLS, you must add
  /// the security policy and default certificate properties.
  Future<void> modifyListener(String listenerArn,
      {int port,
      String protocol,
      String sslPolicy,
      List<Certificate> certificates,
      List<Action> defaultActions}) async {}

  /// Modifies the specified attributes of the specified Application Load
  /// Balancer or Network Load Balancer.
  ///
  /// If any of the specified attributes can't be modified as requested, the
  /// call fails. Any existing attributes that you do not modify retain their
  /// current values.
  Future<void> modifyLoadBalancerAttributes(
      {@required String loadBalancerArn,
      @required List<LoadBalancerAttribute> attributes}) async {}

  /// Modifies the specified rule.
  ///
  /// Any existing properties that you do not modify retain their current
  /// values.
  ///
  /// To modify the actions for the default rule, use ModifyListener.
  Future<void> modifyRule(String ruleArn,
      {List<RuleCondition> conditions, List<Action> actions}) async {}

  /// Modifies the health checks used when evaluating the health state of the
  /// targets in the specified target group.
  ///
  /// To monitor the health of the targets, use DescribeTargetHealth.
  Future<void> modifyTargetGroup(String targetGroupArn,
      {String healthCheckProtocol,
      String healthCheckPort,
      String healthCheckPath,
      bool healthCheckEnabled,
      int healthCheckIntervalSeconds,
      int healthCheckTimeoutSeconds,
      int healthyThresholdCount,
      int unhealthyThresholdCount,
      Matcher matcher}) async {}

  /// Modifies the specified attributes of the specified target group.
  Future<void> modifyTargetGroupAttributes(
      {@required String targetGroupArn,
      @required List<TargetGroupAttribute> attributes}) async {}

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
  Future<void> registerTargets(
      {@required String targetGroupArn,
      @required List<TargetDescription> targets}) async {}

  /// Removes the specified certificate from the certificate list for the
  /// specified HTTPS or TLS listener.
  ///
  /// You can't remove the default certificate for a listener. To replace the
  /// default certificate, call ModifyListener.
  ///
  /// To list the certificates for your listener, use
  /// DescribeListenerCertificates.
  Future<void> removeListenerCertificates(
      {@required String listenerArn,
      @required List<Certificate> certificates}) async {}

  /// Removes the specified tags from the specified Elastic Load Balancing
  /// resource.
  ///
  /// To list the current tags for your resources, use DescribeTags.
  Future<void> removeTags(
      {@required List<String> resourceArns,
      @required List<String> tagKeys}) async {}

  /// Sets the type of IP addresses used by the subnets of the specified
  /// Application Load Balancer or Network Load Balancer.
  Future<void> setIpAddressType(
      {@required String loadBalancerArn,
      @required String ipAddressType}) async {}

  /// Sets the priorities of the specified rules.
  ///
  /// You can reorder the rules as long as there are no priority conflicts in
  /// the new order. Any existing rules that you do not specify retain their
  /// current priority.
  Future<void> setRulePriorities(List<RulePriorityPair> rulePriorities) async {}

  /// Associates the specified security groups with the specified Application
  /// Load Balancer. The specified security groups override the previously
  /// associated security groups.
  ///
  /// You can't specify a security group for a Network Load Balancer.
  Future<void> setSecurityGroups(
      {@required String loadBalancerArn,
      @required List<String> securityGroups}) async {}

  /// Enables the Availability Zone for the specified public subnets for the
  /// specified Application Load Balancer. The specified subnets replace the
  /// previously enabled subnets.
  ///
  /// You can't change the subnets for a Network Load Balancer.
  Future<void> setSubnets(String loadBalancerArn,
      {List<String> subnets, List<SubnetMapping> subnetMappings}) async {}
}

class Action {}

class AddListenerCertificatesOutput {}

class AddTagsOutput {}

class AuthenticateCognitoActionConfig {}

class AuthenticateOidcActionConfig {}

class AvailabilityZone {}

class Certificate {}

class Cipher {}

class CreateListenerOutput {}

class CreateLoadBalancerOutput {}

class CreateRuleOutput {}

class CreateTargetGroupOutput {}

class DeleteListenerOutput {}

class DeleteLoadBalancerOutput {}

class DeleteRuleOutput {}

class DeleteTargetGroupOutput {}

class DeregisterTargetsOutput {}

class DescribeAccountLimitsOutput {}

class DescribeListenerCertificatesOutput {}

class DescribeListenersOutput {}

class DescribeLoadBalancerAttributesOutput {}

class DescribeLoadBalancersOutput {}

class DescribeRulesOutput {}

class DescribeSslPoliciesOutput {}

class DescribeTagsOutput {}

class DescribeTargetGroupAttributesOutput {}

class DescribeTargetGroupsOutput {}

class DescribeTargetHealthOutput {}

class FixedResponseActionConfig {}

class HostHeaderConditionConfig {}

class HttpHeaderConditionConfig {}

class HttpRequestMethodConditionConfig {}

class Limit {}

class Listener {}

class LoadBalancer {}

class LoadBalancerAddress {}

class LoadBalancerAttribute {}

class LoadBalancerState {}

class Matcher {}

class ModifyListenerOutput {}

class ModifyLoadBalancerAttributesOutput {}

class ModifyRuleOutput {}

class ModifyTargetGroupAttributesOutput {}

class ModifyTargetGroupOutput {}

class PathPatternConditionConfig {}

class QueryStringConditionConfig {}

class QueryStringKeyValuePair {}

class RedirectActionConfig {}

class RegisterTargetsOutput {}

class RemoveListenerCertificatesOutput {}

class RemoveTagsOutput {}

class Rule {}

class RuleCondition {}

class RulePriorityPair {}

class SetIpAddressTypeOutput {}

class SetRulePrioritiesOutput {}

class SetSecurityGroupsOutput {}

class SetSubnetsOutput {}

class SourceIpConditionConfig {}

class SslPolicy {}

class SubnetMapping {}

class Tag {}

class TagDescription {}

class TargetDescription {}

class TargetGroup {}

class TargetGroupAttribute {}

class TargetHealth {}

class TargetHealthDescription {}
