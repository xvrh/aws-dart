import 'package:meta/meta.dart';

/// Amazon EC2 Auto Scaling
///
/// Amazon EC2 Auto Scaling is designed to automatically launch or terminate EC2
/// instances based on user-defined scaling policies, scheduled actions, and
/// health checks. Use this service with AWS Auto Scaling, Amazon CloudWatch,
/// and Elastic Load Balancing.
///
/// For more information, including information about granting IAM users
/// required permissions for Amazon EC2 Auto Scaling actions, see the
/// [Amazon EC2 Auto Scaling User Guide](https://docs.aws.amazon.com/autoscaling/ec2/userguide/what-is-amazon-ec2-auto-scaling.html).
class AutoScalingApi {
  final _client;
  AutoScalingApi(client)
      : _client = client.configured('Auto Scaling', serializer: 'query');

  /// Attaches one or more EC2 instances to the specified Auto Scaling group.
  ///
  /// When you attach instances, Amazon EC2 Auto Scaling increases the desired
  /// capacity of the group by the number of instances being attached. If the
  /// number of instances being attached plus the desired capacity of the group
  /// exceeds the maximum size of the group, the operation fails.
  ///
  /// If there is a Classic Load Balancer attached to your Auto Scaling group,
  /// the instances are also registered with the load balancer. If there are
  /// target groups attached to your Auto Scaling group, the instances are also
  /// registered with the target groups.
  ///
  /// For more information, see
  /// [Attach EC2 Instances to Your Auto Scaling Group](https://docs.aws.amazon.com/autoscaling/ec2/userguide/attach-instance-asg.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  ///
  /// [instanceIds]: The IDs of the instances. You can specify up to 20
  /// instances.
  ///
  /// [autoScalingGroupName]: The name of the Auto Scaling group.
  Future<void> attachInstances(String autoScalingGroupName,
      {List<String> instanceIds}) async {
    await _client.send('AttachInstances', {
      if (instanceIds != null) 'InstanceIds': instanceIds,
      'AutoScalingGroupName': autoScalingGroupName,
    });
  }

  /// Attaches one or more target groups to the specified Auto Scaling group.
  ///
  /// To describe the target groups for an Auto Scaling group, use
  /// DescribeLoadBalancerTargetGroups. To detach the target group from the Auto
  /// Scaling group, use DetachLoadBalancerTargetGroups.
  ///
  /// With Application Load Balancers and Network Load Balancers, instances are
  /// registered as targets with a target group. With Classic Load Balancers,
  /// instances are registered with the load balancer. For more information, see
  /// [Attaching a Load Balancer to Your Auto Scaling Group](https://docs.aws.amazon.com/autoscaling/ec2/userguide/attach-load-balancer-asg.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  ///
  /// [autoScalingGroupName]: The name of the Auto Scaling group.
  ///
  /// [targetGroupARNs]: The Amazon Resource Names (ARN) of the target groups.
  /// You can specify up to 10 target groups.
  Future<AttachLoadBalancerTargetGroupsResultType>
      attachLoadBalancerTargetGroups(
          {@required String autoScalingGroupName,
          @required List<String> targetGroupARNs}) async {
    var response_ = await _client.send('AttachLoadBalancerTargetGroups', {
      'AutoScalingGroupName': autoScalingGroupName,
      'TargetGroupARNs': targetGroupARNs,
    });
    return AttachLoadBalancerTargetGroupsResultType.fromJson(response_);
  }

  /// Attaches one or more Classic Load Balancers to the specified Auto Scaling
  /// group.
  ///
  /// To attach an Application Load Balancer or a Network Load Balancer instead,
  /// see AttachLoadBalancerTargetGroups.
  ///
  /// To describe the load balancers for an Auto Scaling group, use
  /// DescribeLoadBalancers. To detach the load balancer from the Auto Scaling
  /// group, use DetachLoadBalancers.
  ///
  /// For more information, see
  /// [Attaching a Load Balancer to Your Auto Scaling Group](https://docs.aws.amazon.com/autoscaling/ec2/userguide/attach-load-balancer-asg.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  ///
  /// [autoScalingGroupName]: The name of the Auto Scaling group.
  ///
  /// [loadBalancerNames]: The names of the load balancers. You can specify up
  /// to 10 load balancers.
  Future<AttachLoadBalancersResultType> attachLoadBalancers(
      {@required String autoScalingGroupName,
      @required List<String> loadBalancerNames}) async {
    var response_ = await _client.send('AttachLoadBalancers', {
      'AutoScalingGroupName': autoScalingGroupName,
      'LoadBalancerNames': loadBalancerNames,
    });
    return AttachLoadBalancersResultType.fromJson(response_);
  }

  /// Deletes one or more scheduled actions for the specified Auto Scaling
  /// group.
  ///
  /// [autoScalingGroupName]: The name of the Auto Scaling group.
  ///
  /// [scheduledActionNames]: The names of the scheduled actions to delete. The
  /// maximum number allowed is 50.
  Future<BatchDeleteScheduledActionAnswer> batchDeleteScheduledAction(
      {@required String autoScalingGroupName,
      @required List<String> scheduledActionNames}) async {
    var response_ = await _client.send('BatchDeleteScheduledAction', {
      'AutoScalingGroupName': autoScalingGroupName,
      'ScheduledActionNames': scheduledActionNames,
    });
    return BatchDeleteScheduledActionAnswer.fromJson(response_);
  }

  /// Creates or updates one or more scheduled scaling actions for an Auto
  /// Scaling group. If you leave a parameter unspecified when updating a
  /// scheduled scaling action, the corresponding value remains unchanged.
  ///
  /// [autoScalingGroupName]: The name of the Auto Scaling group.
  ///
  /// [scheduledUpdateGroupActions]: One or more scheduled actions. The maximum
  /// number allowed is 50.
  Future<BatchPutScheduledUpdateGroupActionAnswer>
      batchPutScheduledUpdateGroupAction(
          {@required
              String autoScalingGroupName,
          @required
              List<ScheduledUpdateGroupActionRequest>
                  scheduledUpdateGroupActions}) async {
    var response_ = await _client.send('BatchPutScheduledUpdateGroupAction', {
      'AutoScalingGroupName': autoScalingGroupName,
      'ScheduledUpdateGroupActions': scheduledUpdateGroupActions,
    });
    return BatchPutScheduledUpdateGroupActionAnswer.fromJson(response_);
  }

  /// Completes the lifecycle action for the specified token or instance with
  /// the specified result.
  ///
  /// This step is a part of the procedure for adding a lifecycle hook to an
  /// Auto Scaling group:
  ///
  /// 1.  (Optional) Create a Lambda function and a rule that allows CloudWatch
  /// Events to invoke your Lambda function when Amazon EC2 Auto Scaling
  /// launches or terminates instances.
  ///
  /// 2.  (Optional) Create a notification target and an IAM role. The target
  /// can be either an Amazon SQS queue or an Amazon SNS topic. The role allows
  /// Amazon EC2 Auto Scaling to publish lifecycle notifications to the target.
  ///
  /// 3.  Create the lifecycle hook. Specify whether the hook is used when the
  /// instances launch or terminate.
  ///
  /// 4.  If you need more time, record the lifecycle action heartbeat to keep
  /// the instance in a pending state.
  ///
  /// 5.   **If you finish before the timeout period ends, complete the
  /// lifecycle action.**
  ///
  ///
  /// For more information, see
  /// [Amazon EC2 Auto Scaling Lifecycle Hooks](https://docs.aws.amazon.com/autoscaling/ec2/userguide/lifecycle-hooks.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  ///
  /// [lifecycleHookName]: The name of the lifecycle hook.
  ///
  /// [autoScalingGroupName]: The name of the Auto Scaling group.
  ///
  /// [lifecycleActionToken]: A universally unique identifier (UUID) that
  /// identifies a specific lifecycle action associated with an instance. Amazon
  /// EC2 Auto Scaling sends this token to the notification target you specified
  /// when you created the lifecycle hook.
  ///
  /// [lifecycleActionResult]: The action for the group to take. This parameter
  /// can be either `CONTINUE` or `ABANDON`.
  ///
  /// [instanceId]: The ID of the instance.
  Future<CompleteLifecycleActionAnswer> completeLifecycleAction(
      {@required String lifecycleHookName,
      @required String autoScalingGroupName,
      String lifecycleActionToken,
      @required String lifecycleActionResult,
      String instanceId}) async {
    var response_ = await _client.send('CompleteLifecycleAction', {
      'LifecycleHookName': lifecycleHookName,
      'AutoScalingGroupName': autoScalingGroupName,
      if (lifecycleActionToken != null)
        'LifecycleActionToken': lifecycleActionToken,
      'LifecycleActionResult': lifecycleActionResult,
      if (instanceId != null) 'InstanceId': instanceId,
    });
    return CompleteLifecycleActionAnswer.fromJson(response_);
  }

  /// Creates an Auto Scaling group with the specified name and attributes.
  ///
  /// If you exceed your maximum limit of Auto Scaling groups, the call fails.
  /// For information about viewing this limit, see DescribeAccountLimits. For
  /// information about updating this limit, see
  /// [Amazon EC2 Auto Scaling Limits](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-account-limits.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  ///
  /// [autoScalingGroupName]: The name of the Auto Scaling group. This name must
  /// be unique per Region per account.
  ///
  /// [launchConfigurationName]: The name of the launch configuration.
  ///
  /// If you do not specify `LaunchConfigurationName`, you must specify one of
  /// the following parameters: `InstanceId`, `LaunchTemplate`, or
  /// `MixedInstancesPolicy`.
  ///
  /// [launchTemplate]: The launch template to use to launch instances.
  ///
  /// For more information, see
  /// [LaunchTemplateSpecification](https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_LaunchTemplateSpecification.html)
  /// in the _Amazon EC2 Auto Scaling API Reference_.
  ///
  /// If you do not specify `LaunchTemplate`, you must specify one of the
  /// following parameters: `InstanceId`, `LaunchConfigurationName`, or
  /// `MixedInstancesPolicy`.
  ///
  /// [mixedInstancesPolicy]: An embedded object that specifies a mixed
  /// instances policy. The required parameters must be specified. If optional
  /// parameters are unspecified, their default values are used.
  ///
  /// The policy includes parameters that not only define the distribution of
  /// On-Demand Instances and Spot Instances, the maximum price to pay for Spot
  /// Instances, and how the Auto Scaling group allocates instance types to
  /// fulfill On-Demand and Spot capacity, but also the parameters that specify
  /// the instance configuration information—the launch template and instance
  /// types.
  ///
  /// For more information, see
  /// [MixedInstancesPolicy](https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_MixedInstancesPolicy.html)
  /// in the _Amazon EC2 Auto Scaling API Reference_ and
  /// [Auto Scaling Groups with Multiple Instance Types and Purchase Options](https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-purchase-options.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  ///
  /// You must specify one of the following parameters in your request:
  /// `LaunchConfigurationName`, `LaunchTemplate`, `InstanceId`, or
  /// `MixedInstancesPolicy`.
  ///
  /// [instanceId]: The ID of the instance used to create a launch configuration
  /// for the group.
  ///
  /// When you specify an ID of an instance, Amazon EC2 Auto Scaling creates a
  /// new launch configuration and associates it with the group. This launch
  /// configuration derives its attributes from the specified instance, except
  /// for the block device mapping.
  ///
  /// For more information, see
  /// [Create an Auto Scaling Group Using an EC2 Instance](https://docs.aws.amazon.com/autoscaling/ec2/userguide/create-asg-from-instance.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  ///
  /// You must specify one of the following parameters in your request:
  /// `LaunchConfigurationName`, `LaunchTemplate`, `InstanceId`, or
  /// `MixedInstancesPolicy`.
  ///
  /// [minSize]: The minimum size of the group.
  ///
  /// [maxSize]: The maximum size of the group.
  ///
  /// [desiredCapacity]: The number of Amazon EC2 instances that the Auto
  /// Scaling group attempts to maintain. This number must be greater than or
  /// equal to the minimum size of the group and less than or equal to the
  /// maximum size of the group. If you do not specify a desired capacity, the
  /// default is the minimum size of the group.
  ///
  /// [defaultCooldown]: The amount of time, in seconds, after a scaling
  /// activity completes before another scaling activity can start. The default
  /// value is `300`.
  ///
  /// For more information, see
  /// [Scaling Cooldowns](https://docs.aws.amazon.com/autoscaling/ec2/userguide/Cooldown.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  ///
  /// [availabilityZones]: One or more Availability Zones for the group. This
  /// parameter is optional if you specify one or more subnets for
  /// `VPCZoneIdentifier`.
  ///
  /// Conditional: If your account supports EC2-Classic and VPC, this parameter
  /// is required to launch instances into EC2-Classic.
  ///
  /// [loadBalancerNames]: A list of Classic Load Balancers associated with this
  /// Auto Scaling group. For Application Load Balancers and Network Load
  /// Balancers, specify a list of target groups using the `TargetGroupARNs`
  /// property instead.
  ///
  /// For more information, see
  /// [Using a Load Balancer with an Auto Scaling Group](https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-load-balancer.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  ///
  /// [targetGroupARNs]: The Amazon Resource Names (ARN) of the target groups to
  /// associate with the Auto Scaling group. Instances are registered as targets
  /// in a target group, and traffic is routed to the target group.
  ///
  /// For more information, see
  /// [Using a Load Balancer with an Auto Scaling Group](https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-load-balancer.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  ///
  /// [healthCheckType]: The service to use for the health checks. The valid
  /// values are `EC2` and `ELB`. The default value is `EC2`. If you configure
  /// an Auto Scaling group to use ELB health checks, it considers the instance
  /// unhealthy if it fails either the EC2 status checks or the load balancer
  /// health checks.
  ///
  /// For more information, see
  /// [Health Checks for Auto Scaling Instances](https://docs.aws.amazon.com/autoscaling/ec2/userguide/healthcheck.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  ///
  /// [healthCheckGracePeriod]: The amount of time, in seconds, that Amazon EC2
  /// Auto Scaling waits before checking the health status of an EC2 instance
  /// that has come into service. During this time, any health check failures
  /// for the instance are ignored. The default value is `0`.
  ///
  /// For more information, see
  /// [Health Check Grace Period](https://docs.aws.amazon.com/autoscaling/ec2/userguide/healthcheck.html#health-check-grace-period)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  ///
  /// Conditional: This parameter is required if you are adding an `ELB` health
  /// check.
  ///
  /// [placementGroup]: The name of the placement group into which to launch
  /// your instances, if any. A placement group is a logical grouping of
  /// instances within a single Availability Zone. You cannot specify multiple
  /// Availability Zones and a placement group. For more information, see
  /// [Placement Groups](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/placement-groups.html)
  /// in the _Amazon EC2 User Guide for Linux Instances_.
  ///
  /// [vpcZoneIdentifier]: A comma-separated list of subnet IDs for your virtual
  /// private cloud (VPC).
  ///
  /// If you specify `VPCZoneIdentifier` with `AvailabilityZones`, the subnets
  /// that you specify for this parameter must reside in those Availability
  /// Zones.
  ///
  /// Conditional: If your account supports EC2-Classic and VPC, this parameter
  /// is required to launch instances into a VPC.
  ///
  /// [terminationPolicies]: One or more termination policies used to select the
  /// instance to terminate. These policies are executed in the order that they
  /// are listed.
  ///
  /// For more information, see
  /// [Controlling Which Instances Auto Scaling Terminates During Scale In](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-instance-termination.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  ///
  /// [newInstancesProtectedFromScaleIn]: Indicates whether newly launched
  /// instances are protected from termination by Amazon EC2 Auto Scaling when
  /// scaling in.
  ///
  /// For more information about preventing instances from terminating on scale
  /// in, see
  /// [Instance Protection](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-instance-termination.html#instance-protection)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  ///
  /// [lifecycleHookSpecificationList]: One or more lifecycle hooks.
  ///
  /// [tags]: One or more tags.
  ///
  /// For more information, see
  /// [Tagging Auto Scaling Groups and Instances](https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-tagging.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  ///
  /// [serviceLinkedRoleArn]: The Amazon Resource Name (ARN) of the
  /// service-linked role that the Auto Scaling group uses to call other AWS
  /// services on your behalf. By default, Amazon EC2 Auto Scaling uses a
  /// service-linked role named AWSServiceRoleForAutoScaling, which it creates
  /// if it does not exist. For more information, see
  /// [Service-Linked Roles](https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-service-linked-role.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  Future<void> createAutoScalingGroup(
      {@required String autoScalingGroupName,
      String launchConfigurationName,
      LaunchTemplateSpecification launchTemplate,
      MixedInstancesPolicy mixedInstancesPolicy,
      String instanceId,
      @required int minSize,
      @required int maxSize,
      int desiredCapacity,
      int defaultCooldown,
      List<String> availabilityZones,
      List<String> loadBalancerNames,
      List<String> targetGroupARNs,
      String healthCheckType,
      int healthCheckGracePeriod,
      String placementGroup,
      String vpcZoneIdentifier,
      List<String> terminationPolicies,
      bool newInstancesProtectedFromScaleIn,
      List<LifecycleHookSpecification> lifecycleHookSpecificationList,
      List<Tag> tags,
      String serviceLinkedRoleArn}) async {
    await _client.send('CreateAutoScalingGroup', {
      'AutoScalingGroupName': autoScalingGroupName,
      if (launchConfigurationName != null)
        'LaunchConfigurationName': launchConfigurationName,
      if (launchTemplate != null) 'LaunchTemplate': launchTemplate,
      if (mixedInstancesPolicy != null)
        'MixedInstancesPolicy': mixedInstancesPolicy,
      if (instanceId != null) 'InstanceId': instanceId,
      'MinSize': minSize,
      'MaxSize': maxSize,
      if (desiredCapacity != null) 'DesiredCapacity': desiredCapacity,
      if (defaultCooldown != null) 'DefaultCooldown': defaultCooldown,
      if (availabilityZones != null) 'AvailabilityZones': availabilityZones,
      if (loadBalancerNames != null) 'LoadBalancerNames': loadBalancerNames,
      if (targetGroupARNs != null) 'TargetGroupARNs': targetGroupARNs,
      if (healthCheckType != null) 'HealthCheckType': healthCheckType,
      if (healthCheckGracePeriod != null)
        'HealthCheckGracePeriod': healthCheckGracePeriod,
      if (placementGroup != null) 'PlacementGroup': placementGroup,
      if (vpcZoneIdentifier != null) 'VPCZoneIdentifier': vpcZoneIdentifier,
      if (terminationPolicies != null)
        'TerminationPolicies': terminationPolicies,
      if (newInstancesProtectedFromScaleIn != null)
        'NewInstancesProtectedFromScaleIn': newInstancesProtectedFromScaleIn,
      if (lifecycleHookSpecificationList != null)
        'LifecycleHookSpecificationList': lifecycleHookSpecificationList,
      if (tags != null) 'Tags': tags,
      if (serviceLinkedRoleArn != null)
        'ServiceLinkedRoleARN': serviceLinkedRoleArn,
    });
  }

  /// Creates a launch configuration.
  ///
  /// If you exceed your maximum limit of launch configurations, the call fails.
  /// For information about viewing this limit, see DescribeAccountLimits. For
  /// information about updating this limit, see
  /// [Amazon EC2 Auto Scaling Limits](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-account-limits.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  ///
  /// For more information, see
  /// [Launch Configurations](https://docs.aws.amazon.com/autoscaling/ec2/userguide/LaunchConfiguration.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  ///
  /// [launchConfigurationName]: The name of the launch configuration. This name
  /// must be unique per Region per account.
  ///
  /// [imageId]: The ID of the Amazon Machine Image (AMI) that was assigned
  /// during registration. For more information, see
  /// [Finding an AMI](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/finding-an-ami.html)
  /// in the _Amazon EC2 User Guide for Linux Instances_.
  ///
  /// If you do not specify `InstanceId`, you must specify `ImageId`.
  ///
  /// [keyName]: The name of the key pair. For more information, see
  /// [Amazon EC2 Key Pairs](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html)
  /// in the _Amazon EC2 User Guide for Linux Instances_.
  ///
  /// [securityGroups]: A list that contains the security groups to assign to
  /// the instances in the Auto Scaling group.
  ///
  /// [EC2-VPC] Specify the security group IDs. For more information, see
  /// [Security Groups for Your VPC](https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_SecurityGroups.html)
  /// in the _Amazon Virtual Private Cloud User Guide_.
  ///
  /// [EC2-Classic] Specify either the security group names or the security
  /// group IDs. For more information, see
  /// [Amazon EC2 Security Groups](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-network-security.html)
  /// in the _Amazon EC2 User Guide for Linux Instances_.
  ///
  /// [classicLinkVpcId]: The ID of a ClassicLink-enabled VPC to link your
  /// EC2-Classic instances to. For more information, see
  /// [ClassicLink](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/vpc-classiclink.html)
  /// in the _Amazon EC2 User Guide for Linux Instances_ and
  /// [Linking EC2-Classic Instances to a VPC](https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-in-vpc.html#as-ClassicLink)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  ///
  /// This parameter can only be used if you are launching EC2-Classic
  /// instances.
  ///
  /// [classicLinkVpcSecurityGroups]: The IDs of one or more security groups for
  /// the specified ClassicLink-enabled VPC. For more information, see
  /// [ClassicLink](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/vpc-classiclink.html)
  /// in the _Amazon EC2 User Guide for Linux Instances_ and
  /// [Linking EC2-Classic Instances to a VPC](https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-in-vpc.html#as-ClassicLink)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  ///
  /// If you specify the `ClassicLinkVPCId` parameter, you must specify this
  /// parameter.
  ///
  /// [userData]: The Base64-encoded user data to make available to the launched
  /// EC2 instances. For more information, see
  /// [Instance Metadata and User Data](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-metadata.html)
  /// in the _Amazon EC2 User Guide for Linux Instances_.
  ///
  /// [instanceId]: The ID of the instance to use to create the launch
  /// configuration. The new launch configuration derives attributes from the
  /// instance, except for the block device mapping.
  ///
  /// To create a launch configuration with a block device mapping or override
  /// any other instance attributes, specify them as part of the same request.
  ///
  /// For more information, see
  /// [Create a Launch Configuration Using an EC2 Instance](https://docs.aws.amazon.com/autoscaling/ec2/userguide/create-lc-with-instanceID.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  ///
  /// If you do not specify `InstanceId`, you must specify both `ImageId` and
  /// `InstanceType`.
  ///
  /// [instanceType]: Specifies the instance type of the EC2 instance.
  ///
  /// For information about available instance types, see
  /// [Available Instance Types](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html#AvailableInstanceTypes)
  /// in the _Amazon EC2 User Guide for Linux Instances._
  ///
  /// If you do not specify `InstanceId`, you must specify `InstanceType`.
  ///
  /// [kernelId]: The ID of the kernel associated with the AMI.
  ///
  /// [ramdiskId]: The ID of the RAM disk to select.
  ///
  /// [blockDeviceMappings]: A block device mapping, which specifies the block
  /// devices for the instance. You can specify virtual devices and EBS volumes.
  /// For more information, see
  /// [Block Device Mapping](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/block-device-mapping-concepts.html)
  /// in the _Amazon EC2 User Guide for Linux Instances_.
  ///
  /// [instanceMonitoring]: Controls whether instances in this group are
  /// launched with detailed (`true`) or basic (`false`) monitoring.
  ///
  /// The default value is `true` (enabled).
  ///
  ///
  ///
  /// When detailed monitoring is enabled, Amazon CloudWatch generates metrics
  /// every minute and your account is charged a fee. When you disable detailed
  /// monitoring, CloudWatch generates metrics every 5 minutes. For more
  /// information, see
  /// [Configure Monitoring for Auto Scaling Instances](https://docs.aws.amazon.com/autoscaling/latest/userguide/as-instance-monitoring.html#enable-as-instance-metrics)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  ///
  /// [spotPrice]: The maximum hourly price to be paid for any Spot Instance
  /// launched to fulfill the request. Spot Instances are launched when the
  /// price you specify exceeds the current Spot market price. For more
  /// information, see
  /// [Launching Spot Instances in Your Auto Scaling Group](https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-launch-spot-instances.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  ///
  /// If a Spot price is set, then the Auto Scaling group will only launch
  /// instances when the Spot price has been met, regardless of the setting in
  /// the Auto Scaling group's `DesiredCapacity`.
  ///
  ///
  ///
  /// When you change your Spot price by creating a new launch configuration,
  /// running instances will continue to run as long as the Spot price for those
  /// running instances is higher than the current Spot market price.
  ///
  /// [iamInstanceProfile]: The name or the Amazon Resource Name (ARN) of the
  /// instance profile associated with the IAM role for the instance. The
  /// instance profile contains the IAM role.
  ///
  /// For more information, see
  /// [IAM Role for Applications That Run on Amazon EC2 Instances](https://docs.aws.amazon.com/autoscaling/ec2/userguide/us-iam-role.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  ///
  /// [ebsOptimized]: Specifies whether the launch configuration is optimized
  /// for EBS I/O (`true`) or not (`false`). The optimization provides dedicated
  /// throughput to Amazon EBS and an optimized configuration stack to provide
  /// optimal I/O performance. This optimization is not available with all
  /// instance types. Additional fees are incurred when you enable EBS
  /// optimization for an instance type that is not EBS-optimized by default.
  /// For more information, see
  /// [Amazon EBS-Optimized Instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSOptimized.html)
  /// in the _Amazon EC2 User Guide for Linux Instances_.
  ///
  /// The default value is `false`.
  ///
  /// [associatePublicIpAddress]: For Auto Scaling groups that are running in a
  /// virtual private cloud (VPC), specifies whether to assign a public IP
  /// address to the group's instances. If you specify `true`, each instance in
  /// the Auto Scaling group receives a unique public IP address. For more
  /// information, see
  /// [Launching Auto Scaling Instances in a VPC](https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-in-vpc.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  ///
  /// If you specify this parameter, you must specify at least one subnet for
  /// `VPCZoneIdentifier` when you create your group.
  ///
  ///
  ///
  /// If the instance is launched into a default subnet, the default is to
  /// assign a public IP address, unless you disabled the option to assign a
  /// public IP address on the subnet. If the instance is launched into a
  /// nondefault subnet, the default is not to assign a public IP address,
  /// unless you enabled the option to assign a public IP address on the subnet.
  ///
  /// [placementTenancy]: The tenancy of the instance. An instance with
  /// `dedicated` tenancy runs on isolated, single-tenant hardware and can only
  /// be launched into a VPC.
  ///
  /// To launch dedicated instances into a shared tenancy VPC (a VPC with the
  /// instance placement tenancy attribute set to `default`), you must set the
  /// value of this parameter to `dedicated`.
  ///
  /// If you specify `PlacementTenancy`, you must specify at least one subnet
  /// for `VPCZoneIdentifier` when you create your group.
  ///
  /// For more information, see
  /// [Instance Placement Tenancy](https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-in-vpc.html#as-vpc-tenancy)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  ///
  /// Valid values: `default` | `dedicated`
  Future<void> createLaunchConfiguration(String launchConfigurationName,
      {String imageId,
      String keyName,
      List<String> securityGroups,
      String classicLinkVpcId,
      List<String> classicLinkVpcSecurityGroups,
      String userData,
      String instanceId,
      String instanceType,
      String kernelId,
      String ramdiskId,
      List<BlockDeviceMapping> blockDeviceMappings,
      InstanceMonitoring instanceMonitoring,
      String spotPrice,
      String iamInstanceProfile,
      bool ebsOptimized,
      bool associatePublicIpAddress,
      String placementTenancy}) async {
    await _client.send('CreateLaunchConfiguration', {
      'LaunchConfigurationName': launchConfigurationName,
      if (imageId != null) 'ImageId': imageId,
      if (keyName != null) 'KeyName': keyName,
      if (securityGroups != null) 'SecurityGroups': securityGroups,
      if (classicLinkVpcId != null) 'ClassicLinkVPCId': classicLinkVpcId,
      if (classicLinkVpcSecurityGroups != null)
        'ClassicLinkVPCSecurityGroups': classicLinkVpcSecurityGroups,
      if (userData != null) 'UserData': userData,
      if (instanceId != null) 'InstanceId': instanceId,
      if (instanceType != null) 'InstanceType': instanceType,
      if (kernelId != null) 'KernelId': kernelId,
      if (ramdiskId != null) 'RamdiskId': ramdiskId,
      if (blockDeviceMappings != null)
        'BlockDeviceMappings': blockDeviceMappings,
      if (instanceMonitoring != null) 'InstanceMonitoring': instanceMonitoring,
      if (spotPrice != null) 'SpotPrice': spotPrice,
      if (iamInstanceProfile != null) 'IamInstanceProfile': iamInstanceProfile,
      if (ebsOptimized != null) 'EbsOptimized': ebsOptimized,
      if (associatePublicIpAddress != null)
        'AssociatePublicIpAddress': associatePublicIpAddress,
      if (placementTenancy != null) 'PlacementTenancy': placementTenancy,
    });
  }

  /// Creates or updates tags for the specified Auto Scaling group.
  ///
  /// When you specify a tag with a key that already exists, the operation
  /// overwrites the previous tag definition, and you do not get an error
  /// message.
  ///
  /// For more information, see
  /// [Tagging Auto Scaling Groups and Instances](https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-tagging.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  ///
  /// [tags]: One or more tags.
  Future<void> createOrUpdateTags(List<Tag> tags) async {
    await _client.send('CreateOrUpdateTags', {
      'Tags': tags,
    });
  }

  /// Deletes the specified Auto Scaling group.
  ///
  /// If the group has instances or scaling activities in progress, you must
  /// specify the option to force the deletion in order for it to succeed.
  ///
  /// If the group has policies, deleting the group deletes the policies, the
  /// underlying alarm actions, and any alarm that no longer has an associated
  /// action.
  ///
  /// To remove instances from the Auto Scaling group before deleting it, call
  /// DetachInstances with the list of instances and the option to decrement the
  /// desired capacity. This ensures that Amazon EC2 Auto Scaling does not
  /// launch replacement instances.
  ///
  /// To terminate all instances before deleting the Auto Scaling group, call
  /// UpdateAutoScalingGroup and set the minimum size and desired capacity of
  /// the Auto Scaling group to zero.
  ///
  /// [autoScalingGroupName]: The name of the Auto Scaling group.
  ///
  /// [forceDelete]: Specifies that the group is to be deleted along with all
  /// instances associated with the group, without waiting for all instances to
  /// be terminated. This parameter also deletes any lifecycle actions
  /// associated with the group.
  Future<void> deleteAutoScalingGroup(String autoScalingGroupName,
      {bool forceDelete}) async {
    await _client.send('DeleteAutoScalingGroup', {
      'AutoScalingGroupName': autoScalingGroupName,
      if (forceDelete != null) 'ForceDelete': forceDelete,
    });
  }

  /// Deletes the specified launch configuration.
  ///
  /// The launch configuration must not be attached to an Auto Scaling group.
  /// When this call completes, the launch configuration is no longer available
  /// for use.
  ///
  /// [launchConfigurationName]: The name of the launch configuration.
  Future<void> deleteLaunchConfiguration(String launchConfigurationName) async {
    await _client.send('DeleteLaunchConfiguration', {
      'LaunchConfigurationName': launchConfigurationName,
    });
  }

  /// Deletes the specified lifecycle hook.
  ///
  /// If there are any outstanding lifecycle actions, they are completed first
  /// (`ABANDON` for launching instances, `CONTINUE` for terminating instances).
  ///
  /// [lifecycleHookName]: The name of the lifecycle hook.
  ///
  /// [autoScalingGroupName]: The name of the Auto Scaling group.
  Future<DeleteLifecycleHookAnswer> deleteLifecycleHook(
      {@required String lifecycleHookName,
      @required String autoScalingGroupName}) async {
    var response_ = await _client.send('DeleteLifecycleHook', {
      'LifecycleHookName': lifecycleHookName,
      'AutoScalingGroupName': autoScalingGroupName,
    });
    return DeleteLifecycleHookAnswer.fromJson(response_);
  }

  /// Deletes the specified notification.
  ///
  /// [autoScalingGroupName]: The name of the Auto Scaling group.
  ///
  /// [topicArn]: The Amazon Resource Name (ARN) of the Amazon Simple
  /// Notification Service (Amazon SNS) topic.
  Future<void> deleteNotificationConfiguration(
      {@required String autoScalingGroupName,
      @required String topicArn}) async {
    await _client.send('DeleteNotificationConfiguration', {
      'AutoScalingGroupName': autoScalingGroupName,
      'TopicARN': topicArn,
    });
  }

  /// Deletes the specified scaling policy.
  ///
  /// Deleting either a step scaling policy or a simple scaling policy deletes
  /// the underlying alarm action, but does not delete the alarm, even if it no
  /// longer has an associated action.
  ///
  /// For more information, see
  /// [Deleting a Scaling Policy](https://docs.aws.amazon.com/autoscaling/ec2/userguide/deleting-scaling-policy.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  ///
  /// [autoScalingGroupName]: The name of the Auto Scaling group.
  ///
  /// [policyName]: The name or Amazon Resource Name (ARN) of the policy.
  Future<void> deletePolicy(String policyName,
      {String autoScalingGroupName}) async {
    await _client.send('DeletePolicy', {
      if (autoScalingGroupName != null)
        'AutoScalingGroupName': autoScalingGroupName,
      'PolicyName': policyName,
    });
  }

  /// Deletes the specified scheduled action.
  ///
  /// [autoScalingGroupName]: The name of the Auto Scaling group.
  ///
  /// [scheduledActionName]: The name of the action to delete.
  Future<void> deleteScheduledAction(
      {@required String autoScalingGroupName,
      @required String scheduledActionName}) async {
    await _client.send('DeleteScheduledAction', {
      'AutoScalingGroupName': autoScalingGroupName,
      'ScheduledActionName': scheduledActionName,
    });
  }

  /// Deletes the specified tags.
  ///
  /// [tags]: One or more tags.
  Future<void> deleteTags(List<Tag> tags) async {
    await _client.send('DeleteTags', {
      'Tags': tags,
    });
  }

  /// Describes the current Amazon EC2 Auto Scaling resource limits for your AWS
  /// account.
  ///
  /// For information about requesting an increase in these limits, see
  /// [Amazon EC2 Auto Scaling Limits](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-account-limits.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  Future<DescribeAccountLimitsAnswer> describeAccountLimits() async {
    var response_ = await _client.send('DescribeAccountLimits', {});
    return DescribeAccountLimitsAnswer.fromJson(response_);
  }

  /// Describes the policy adjustment types for use with PutScalingPolicy.
  Future<DescribeAdjustmentTypesAnswer> describeAdjustmentTypes() async {
    var response_ = await _client.send('DescribeAdjustmentTypes', {});
    return DescribeAdjustmentTypesAnswer.fromJson(response_);
  }

  /// Describes one or more Auto Scaling groups.
  ///
  /// [autoScalingGroupNames]: The names of the Auto Scaling groups. Each name
  /// can be a maximum of 1600 characters. By default, you can only specify up
  /// to 50 names. You can optionally increase this limit using the `MaxRecords`
  /// parameter.
  ///
  /// If you omit this parameter, all Auto Scaling groups are described.
  ///
  /// [nextToken]: The token for the next set of items to return. (You received
  /// this token from a previous call.)
  ///
  /// [maxRecords]: The maximum number of items to return with this call. The
  /// default value is `50` and the maximum value is `100`.
  Future<AutoScalingGroupsType> describeAutoScalingGroups(
      {List<String> autoScalingGroupNames,
      String nextToken,
      int maxRecords}) async {
    var response_ = await _client.send('DescribeAutoScalingGroups', {
      if (autoScalingGroupNames != null)
        'AutoScalingGroupNames': autoScalingGroupNames,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxRecords != null) 'MaxRecords': maxRecords,
    });
    return AutoScalingGroupsType.fromJson(response_);
  }

  /// Describes one or more Auto Scaling instances.
  ///
  /// [instanceIds]: The IDs of the instances. You can specify up to
  /// `MaxRecords` IDs. If you omit this parameter, all Auto Scaling instances
  /// are described. If you specify an ID that does not exist, it is ignored
  /// with no error.
  ///
  /// [maxRecords]: The maximum number of items to return with this call. The
  /// default value is `50` and the maximum value is `50`.
  ///
  /// [nextToken]: The token for the next set of items to return. (You received
  /// this token from a previous call.)
  Future<AutoScalingInstancesType> describeAutoScalingInstances(
      {List<String> instanceIds, int maxRecords, String nextToken}) async {
    var response_ = await _client.send('DescribeAutoScalingInstances', {
      if (instanceIds != null) 'InstanceIds': instanceIds,
      if (maxRecords != null) 'MaxRecords': maxRecords,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return AutoScalingInstancesType.fromJson(response_);
  }

  /// Describes the notification types that are supported by Amazon EC2 Auto
  /// Scaling.
  Future<DescribeAutoScalingNotificationTypesAnswer>
      describeAutoScalingNotificationTypes() async {
    var response_ =
        await _client.send('DescribeAutoScalingNotificationTypes', {});
    return DescribeAutoScalingNotificationTypesAnswer.fromJson(response_);
  }

  /// Describes one or more launch configurations.
  ///
  /// [launchConfigurationNames]: The launch configuration names. If you omit
  /// this parameter, all launch configurations are described.
  ///
  /// [nextToken]: The token for the next set of items to return. (You received
  /// this token from a previous call.)
  ///
  /// [maxRecords]: The maximum number of items to return with this call. The
  /// default value is `50` and the maximum value is `100`.
  Future<LaunchConfigurationsType> describeLaunchConfigurations(
      {List<String> launchConfigurationNames,
      String nextToken,
      int maxRecords}) async {
    var response_ = await _client.send('DescribeLaunchConfigurations', {
      if (launchConfigurationNames != null)
        'LaunchConfigurationNames': launchConfigurationNames,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxRecords != null) 'MaxRecords': maxRecords,
    });
    return LaunchConfigurationsType.fromJson(response_);
  }

  /// Describes the available types of lifecycle hooks.
  ///
  /// The following hook types are supported:
  ///
  /// *   autoscaling:EC2_INSTANCE_LAUNCHING
  ///
  /// *   autoscaling:EC2_INSTANCE_TERMINATING
  Future<DescribeLifecycleHookTypesAnswer> describeLifecycleHookTypes() async {
    var response_ = await _client.send('DescribeLifecycleHookTypes', {});
    return DescribeLifecycleHookTypesAnswer.fromJson(response_);
  }

  /// Describes the lifecycle hooks for the specified Auto Scaling group.
  ///
  /// [autoScalingGroupName]: The name of the Auto Scaling group.
  ///
  /// [lifecycleHookNames]: The names of one or more lifecycle hooks. If you
  /// omit this parameter, all lifecycle hooks are described.
  Future<DescribeLifecycleHooksAnswer> describeLifecycleHooks(
      String autoScalingGroupName,
      {List<String> lifecycleHookNames}) async {
    var response_ = await _client.send('DescribeLifecycleHooks', {
      'AutoScalingGroupName': autoScalingGroupName,
      if (lifecycleHookNames != null) 'LifecycleHookNames': lifecycleHookNames,
    });
    return DescribeLifecycleHooksAnswer.fromJson(response_);
  }

  /// Describes the target groups for the specified Auto Scaling group.
  ///
  /// [autoScalingGroupName]: The name of the Auto Scaling group.
  ///
  /// [nextToken]: The token for the next set of items to return. (You received
  /// this token from a previous call.)
  ///
  /// [maxRecords]: The maximum number of items to return with this call. The
  /// default value is `100` and the maximum value is `100`.
  Future<DescribeLoadBalancerTargetGroupsResponse>
      describeLoadBalancerTargetGroups(String autoScalingGroupName,
          {String nextToken, int maxRecords}) async {
    var response_ = await _client.send('DescribeLoadBalancerTargetGroups', {
      'AutoScalingGroupName': autoScalingGroupName,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxRecords != null) 'MaxRecords': maxRecords,
    });
    return DescribeLoadBalancerTargetGroupsResponse.fromJson(response_);
  }

  /// Describes the load balancers for the specified Auto Scaling group.
  ///
  /// This operation describes only Classic Load Balancers. If you have
  /// Application Load Balancers or Network Load Balancers, use
  /// DescribeLoadBalancerTargetGroups instead.
  ///
  /// [autoScalingGroupName]: The name of the Auto Scaling group.
  ///
  /// [nextToken]: The token for the next set of items to return. (You received
  /// this token from a previous call.)
  ///
  /// [maxRecords]: The maximum number of items to return with this call. The
  /// default value is `100` and the maximum value is `100`.
  Future<DescribeLoadBalancersResponse> describeLoadBalancers(
      String autoScalingGroupName,
      {String nextToken,
      int maxRecords}) async {
    var response_ = await _client.send('DescribeLoadBalancers', {
      'AutoScalingGroupName': autoScalingGroupName,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxRecords != null) 'MaxRecords': maxRecords,
    });
    return DescribeLoadBalancersResponse.fromJson(response_);
  }

  /// Describes the available CloudWatch metrics for Amazon EC2 Auto Scaling.
  ///
  /// The `GroupStandbyInstances` metric is not returned by default. You must
  /// explicitly request this metric when calling EnableMetricsCollection.
  Future<DescribeMetricCollectionTypesAnswer>
      describeMetricCollectionTypes() async {
    var response_ = await _client.send('DescribeMetricCollectionTypes', {});
    return DescribeMetricCollectionTypesAnswer.fromJson(response_);
  }

  /// Describes the notification actions associated with the specified Auto
  /// Scaling group.
  ///
  /// [autoScalingGroupNames]: The name of the Auto Scaling group.
  ///
  /// [nextToken]: The token for the next set of items to return. (You received
  /// this token from a previous call.)
  ///
  /// [maxRecords]: The maximum number of items to return with this call. The
  /// default value is `50` and the maximum value is `100`.
  Future<DescribeNotificationConfigurationsAnswer>
      describeNotificationConfigurations(
          {List<String> autoScalingGroupNames,
          String nextToken,
          int maxRecords}) async {
    var response_ = await _client.send('DescribeNotificationConfigurations', {
      if (autoScalingGroupNames != null)
        'AutoScalingGroupNames': autoScalingGroupNames,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxRecords != null) 'MaxRecords': maxRecords,
    });
    return DescribeNotificationConfigurationsAnswer.fromJson(response_);
  }

  /// Describes the policies for the specified Auto Scaling group.
  ///
  /// [autoScalingGroupName]: The name of the Auto Scaling group.
  ///
  /// [policyNames]: The names of one or more policies. If you omit this
  /// parameter, all policies are described. If a group name is provided, the
  /// results are limited to that group. This list is limited to 50 items. If
  /// you specify an unknown policy name, it is ignored with no error.
  ///
  /// [policyTypes]: One or more policy types. The valid values are
  /// `SimpleScaling`, `StepScaling`, and `TargetTrackingScaling`.
  ///
  /// [nextToken]: The token for the next set of items to return. (You received
  /// this token from a previous call.)
  ///
  /// [maxRecords]: The maximum number of items to be returned with each call.
  /// The default value is `50` and the maximum value is `100`.
  Future<PoliciesType> describePolicies(
      {String autoScalingGroupName,
      List<String> policyNames,
      List<String> policyTypes,
      String nextToken,
      int maxRecords}) async {
    var response_ = await _client.send('DescribePolicies', {
      if (autoScalingGroupName != null)
        'AutoScalingGroupName': autoScalingGroupName,
      if (policyNames != null) 'PolicyNames': policyNames,
      if (policyTypes != null) 'PolicyTypes': policyTypes,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxRecords != null) 'MaxRecords': maxRecords,
    });
    return PoliciesType.fromJson(response_);
  }

  /// Describes one or more scaling activities for the specified Auto Scaling
  /// group.
  ///
  /// [activityIds]: The activity IDs of the desired scaling activities. You can
  /// specify up to 50 IDs. If you omit this parameter, all activities for the
  /// past six weeks are described. If unknown activities are requested, they
  /// are ignored with no error. If you specify an Auto Scaling group, the
  /// results are limited to that group.
  ///
  /// [autoScalingGroupName]: The name of the Auto Scaling group.
  ///
  /// [maxRecords]: The maximum number of items to return with this call. The
  /// default value is `100` and the maximum value is `100`.
  ///
  /// [nextToken]: The token for the next set of items to return. (You received
  /// this token from a previous call.)
  Future<ActivitiesType> describeScalingActivities(
      {List<String> activityIds,
      String autoScalingGroupName,
      int maxRecords,
      String nextToken}) async {
    var response_ = await _client.send('DescribeScalingActivities', {
      if (activityIds != null) 'ActivityIds': activityIds,
      if (autoScalingGroupName != null)
        'AutoScalingGroupName': autoScalingGroupName,
      if (maxRecords != null) 'MaxRecords': maxRecords,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ActivitiesType.fromJson(response_);
  }

  /// Describes the scaling process types for use with ResumeProcesses and
  /// SuspendProcesses.
  Future<ProcessesType> describeScalingProcessTypes() async {
    var response_ = await _client.send('DescribeScalingProcessTypes', {});
    return ProcessesType.fromJson(response_);
  }

  /// Describes the actions scheduled for your Auto Scaling group that haven't
  /// run or that have not reached their end time. To describe the actions that
  /// have already run, use DescribeScalingActivities.
  ///
  /// [autoScalingGroupName]: The name of the Auto Scaling group.
  ///
  /// [scheduledActionNames]: The names of one or more scheduled actions. You
  /// can specify up to 50 actions. If you omit this parameter, all scheduled
  /// actions are described. If you specify an unknown scheduled action, it is
  /// ignored with no error.
  ///
  /// [startTime]: The earliest scheduled start time to return. If scheduled
  /// action names are provided, this parameter is ignored.
  ///
  /// [endTime]: The latest scheduled start time to return. If scheduled action
  /// names are provided, this parameter is ignored.
  ///
  /// [nextToken]: The token for the next set of items to return. (You received
  /// this token from a previous call.)
  ///
  /// [maxRecords]: The maximum number of items to return with this call. The
  /// default value is `50` and the maximum value is `100`.
  Future<ScheduledActionsType> describeScheduledActions(
      {String autoScalingGroupName,
      List<String> scheduledActionNames,
      DateTime startTime,
      DateTime endTime,
      String nextToken,
      int maxRecords}) async {
    var response_ = await _client.send('DescribeScheduledActions', {
      if (autoScalingGroupName != null)
        'AutoScalingGroupName': autoScalingGroupName,
      if (scheduledActionNames != null)
        'ScheduledActionNames': scheduledActionNames,
      if (startTime != null) 'StartTime': startTime,
      if (endTime != null) 'EndTime': endTime,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxRecords != null) 'MaxRecords': maxRecords,
    });
    return ScheduledActionsType.fromJson(response_);
  }

  /// Describes the specified tags.
  ///
  /// You can use filters to limit the results. For example, you can query for
  /// the tags for a specific Auto Scaling group. You can specify multiple
  /// values for a filter. A tag must match at least one of the specified values
  /// for it to be included in the results.
  ///
  /// You can also specify multiple filters. The result includes information for
  /// a particular tag only if it matches all the filters. If there's no match,
  /// no special message is returned.
  ///
  /// [filters]: One or more filters to scope the tags to return. The maximum
  /// number of filters per filter type (for example, `auto-scaling-group`) is
  /// 1000.
  ///
  /// [nextToken]: The token for the next set of items to return. (You received
  /// this token from a previous call.)
  ///
  /// [maxRecords]: The maximum number of items to return with this call. The
  /// default value is `50` and the maximum value is `100`.
  Future<TagsType> describeTags(
      {List<Filter> filters, String nextToken, int maxRecords}) async {
    var response_ = await _client.send('DescribeTags', {
      if (filters != null) 'Filters': filters,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxRecords != null) 'MaxRecords': maxRecords,
    });
    return TagsType.fromJson(response_);
  }

  /// Describes the termination policies supported by Amazon EC2 Auto Scaling.
  ///
  /// For more information, see
  /// [Controlling Which Auto Scaling Instances Terminate During Scale In](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-instance-termination.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  Future<DescribeTerminationPolicyTypesAnswer>
      describeTerminationPolicyTypes() async {
    var response_ = await _client.send('DescribeTerminationPolicyTypes', {});
    return DescribeTerminationPolicyTypesAnswer.fromJson(response_);
  }

  /// Removes one or more instances from the specified Auto Scaling group.
  ///
  /// After the instances are detached, you can manage them independent of the
  /// Auto Scaling group.
  ///
  /// If you do not specify the option to decrement the desired capacity, Amazon
  /// EC2 Auto Scaling launches instances to replace the ones that are detached.
  ///
  /// If there is a Classic Load Balancer attached to the Auto Scaling group,
  /// the instances are deregistered from the load balancer. If there are target
  /// groups attached to the Auto Scaling group, the instances are deregistered
  /// from the target groups.
  ///
  /// For more information, see
  /// [Detach EC2 Instances from Your Auto Scaling Group](https://docs.aws.amazon.com/autoscaling/ec2/userguide/detach-instance-asg.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  ///
  /// [instanceIds]: The IDs of the instances. You can specify up to 20
  /// instances.
  ///
  /// [autoScalingGroupName]: The name of the Auto Scaling group.
  ///
  /// [shouldDecrementDesiredCapacity]: Indicates whether the Auto Scaling group
  /// decrements the desired capacity value by the number of instances detached.
  Future<DetachInstancesAnswer> detachInstances(
      {List<String> instanceIds,
      @required String autoScalingGroupName,
      @required bool shouldDecrementDesiredCapacity}) async {
    var response_ = await _client.send('DetachInstances', {
      if (instanceIds != null) 'InstanceIds': instanceIds,
      'AutoScalingGroupName': autoScalingGroupName,
      'ShouldDecrementDesiredCapacity': shouldDecrementDesiredCapacity,
    });
    return DetachInstancesAnswer.fromJson(response_);
  }

  /// Detaches one or more target groups from the specified Auto Scaling group.
  ///
  /// [autoScalingGroupName]: The name of the Auto Scaling group.
  ///
  /// [targetGroupARNs]: The Amazon Resource Names (ARN) of the target groups.
  /// You can specify up to 10 target groups.
  Future<DetachLoadBalancerTargetGroupsResultType>
      detachLoadBalancerTargetGroups(
          {@required String autoScalingGroupName,
          @required List<String> targetGroupARNs}) async {
    var response_ = await _client.send('DetachLoadBalancerTargetGroups', {
      'AutoScalingGroupName': autoScalingGroupName,
      'TargetGroupARNs': targetGroupARNs,
    });
    return DetachLoadBalancerTargetGroupsResultType.fromJson(response_);
  }

  /// Detaches one or more Classic Load Balancers from the specified Auto
  /// Scaling group.
  ///
  /// This operation detaches only Classic Load Balancers. If you have
  /// Application Load Balancers or Network Load Balancers, use
  /// DetachLoadBalancerTargetGroups instead.
  ///
  /// When you detach a load balancer, it enters the `Removing` state while
  /// deregistering the instances in the group. When all instances are
  /// deregistered, then you can no longer describe the load balancer using
  /// DescribeLoadBalancers. The instances remain running.
  ///
  /// [autoScalingGroupName]: The name of the Auto Scaling group.
  ///
  /// [loadBalancerNames]: The names of the load balancers. You can specify up
  /// to 10 load balancers.
  Future<DetachLoadBalancersResultType> detachLoadBalancers(
      {@required String autoScalingGroupName,
      @required List<String> loadBalancerNames}) async {
    var response_ = await _client.send('DetachLoadBalancers', {
      'AutoScalingGroupName': autoScalingGroupName,
      'LoadBalancerNames': loadBalancerNames,
    });
    return DetachLoadBalancersResultType.fromJson(response_);
  }

  /// Disables group metrics for the specified Auto Scaling group.
  ///
  /// [autoScalingGroupName]: The name of the Auto Scaling group.
  ///
  /// [metrics]: One or more of the following metrics. If you omit this
  /// parameter, all metrics are disabled.
  ///
  /// *    `GroupMinSize`
  ///
  /// *    `GroupMaxSize`
  ///
  /// *    `GroupDesiredCapacity`
  ///
  /// *    `GroupInServiceInstances`
  ///
  /// *    `GroupPendingInstances`
  ///
  /// *    `GroupStandbyInstances`
  ///
  /// *    `GroupTerminatingInstances`
  ///
  /// *    `GroupTotalInstances`
  Future<void> disableMetricsCollection(String autoScalingGroupName,
      {List<String> metrics}) async {
    await _client.send('DisableMetricsCollection', {
      'AutoScalingGroupName': autoScalingGroupName,
      if (metrics != null) 'Metrics': metrics,
    });
  }

  /// Enables group metrics for the specified Auto Scaling group. For more
  /// information, see
  /// [Monitoring Your Auto Scaling Groups and Instances](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-instance-monitoring.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  ///
  /// [autoScalingGroupName]: The name of the Auto Scaling group.
  ///
  /// [metrics]: One or more of the following metrics. If you omit this
  /// parameter, all metrics are enabled.
  ///
  /// *    `GroupMinSize`
  ///
  /// *    `GroupMaxSize`
  ///
  /// *    `GroupDesiredCapacity`
  ///
  /// *    `GroupInServiceInstances`
  ///
  /// *    `GroupPendingInstances`
  ///
  /// *    `GroupStandbyInstances`
  ///
  /// *    `GroupTerminatingInstances`
  ///
  /// *    `GroupTotalInstances`
  ///
  /// [granularity]: The granularity to associate with the metrics to collect.
  /// The only valid value is `1Minute`.
  Future<void> enableMetricsCollection(
      {@required String autoScalingGroupName,
      List<String> metrics,
      @required String granularity}) async {
    await _client.send('EnableMetricsCollection', {
      'AutoScalingGroupName': autoScalingGroupName,
      if (metrics != null) 'Metrics': metrics,
      'Granularity': granularity,
    });
  }

  /// Moves the specified instances into the standby state.
  ///
  /// For more information, see
  /// [Temporarily Removing Instances from Your Auto Scaling Group](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-enter-exit-standby.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  ///
  /// [instanceIds]: The IDs of the instances. You can specify up to 20
  /// instances.
  ///
  /// [autoScalingGroupName]: The name of the Auto Scaling group.
  ///
  /// [shouldDecrementDesiredCapacity]: Indicates whether to decrement the
  /// desired capacity of the Auto Scaling group by the number of instances
  /// moved to `Standby` mode.
  Future<EnterStandbyAnswer> enterStandby(
      {List<String> instanceIds,
      @required String autoScalingGroupName,
      @required bool shouldDecrementDesiredCapacity}) async {
    var response_ = await _client.send('EnterStandby', {
      if (instanceIds != null) 'InstanceIds': instanceIds,
      'AutoScalingGroupName': autoScalingGroupName,
      'ShouldDecrementDesiredCapacity': shouldDecrementDesiredCapacity,
    });
    return EnterStandbyAnswer.fromJson(response_);
  }

  /// Executes the specified policy.
  ///
  /// [autoScalingGroupName]: The name of the Auto Scaling group.
  ///
  /// [policyName]: The name or ARN of the policy.
  ///
  /// [honorCooldown]: Indicates whether Amazon EC2 Auto Scaling waits for the
  /// cooldown period to complete before executing the policy.
  ///
  /// This parameter is not supported if the policy type is `StepScaling` or
  /// `TargetTrackingScaling`.
  ///
  /// For more information, see
  /// [Scaling Cooldowns](https://docs.aws.amazon.com/autoscaling/ec2/userguide/Cooldown.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  ///
  /// [metricValue]: The metric value to compare to `BreachThreshold`. This
  /// enables you to execute a policy of type `StepScaling` and determine which
  /// step adjustment to use. For example, if the breach threshold is 50 and you
  /// want to use a step adjustment with a lower bound of 0 and an upper bound
  /// of 10, you can set the metric value to 59.
  ///
  /// If you specify a metric value that doesn't correspond to a step adjustment
  /// for the policy, the call returns an error.
  ///
  /// Conditional: This parameter is required if the policy type is
  /// `StepScaling` and not supported otherwise.
  ///
  /// [breachThreshold]: The breach threshold for the alarm.
  ///
  /// Conditional: This parameter is required if the policy type is
  /// `StepScaling` and not supported otherwise.
  Future<void> executePolicy(String policyName,
      {String autoScalingGroupName,
      bool honorCooldown,
      double metricValue,
      double breachThreshold}) async {
    await _client.send('ExecutePolicy', {
      if (autoScalingGroupName != null)
        'AutoScalingGroupName': autoScalingGroupName,
      'PolicyName': policyName,
      if (honorCooldown != null) 'HonorCooldown': honorCooldown,
      if (metricValue != null) 'MetricValue': metricValue,
      if (breachThreshold != null) 'BreachThreshold': breachThreshold,
    });
  }

  /// Moves the specified instances out of the standby state.
  ///
  /// For more information, see
  /// [Temporarily Removing Instances from Your Auto Scaling Group](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-enter-exit-standby.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  ///
  /// [instanceIds]: The IDs of the instances. You can specify up to 20
  /// instances.
  ///
  /// [autoScalingGroupName]: The name of the Auto Scaling group.
  Future<ExitStandbyAnswer> exitStandby(String autoScalingGroupName,
      {List<String> instanceIds}) async {
    var response_ = await _client.send('ExitStandby', {
      if (instanceIds != null) 'InstanceIds': instanceIds,
      'AutoScalingGroupName': autoScalingGroupName,
    });
    return ExitStandbyAnswer.fromJson(response_);
  }

  /// Creates or updates a lifecycle hook for the specified Auto Scaling group.
  ///
  /// A lifecycle hook tells Amazon EC2 Auto Scaling to perform an action on an
  /// instance when the instance launches (before it is put into service) or as
  /// the instance terminates (before it is fully terminated).
  ///
  /// This step is a part of the procedure for adding a lifecycle hook to an
  /// Auto Scaling group:
  ///
  /// 1.  (Optional) Create a Lambda function and a rule that allows CloudWatch
  /// Events to invoke your Lambda function when Amazon EC2 Auto Scaling
  /// launches or terminates instances.
  ///
  /// 2.  (Optional) Create a notification target and an IAM role. The target
  /// can be either an Amazon SQS queue or an Amazon SNS topic. The role allows
  /// Amazon EC2 Auto Scaling to publish lifecycle notifications to the target.
  ///
  /// 3.   **Create the lifecycle hook. Specify whether the hook is used when
  /// the instances launch or terminate.**
  ///
  /// 4.  If you need more time, record the lifecycle action heartbeat to keep
  /// the instance in a pending state using RecordLifecycleActionHeartbeat.
  ///
  /// 5.  If you finish before the timeout period ends, complete the lifecycle
  /// action using CompleteLifecycleAction.
  ///
  ///
  /// For more information, see
  /// [Amazon EC2 Auto Scaling Lifecycle Hooks](https://docs.aws.amazon.com/autoscaling/ec2/userguide/lifecycle-hooks.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  ///
  /// If you exceed your maximum limit of lifecycle hooks, which by default is
  /// 50 per Auto Scaling group, the call fails.
  ///
  /// You can view the lifecycle hooks for an Auto Scaling group using
  /// DescribeLifecycleHooks. If you are no longer using a lifecycle hook, you
  /// can delete it using DeleteLifecycleHook.
  ///
  /// [lifecycleHookName]: The name of the lifecycle hook.
  ///
  /// [autoScalingGroupName]: The name of the Auto Scaling group.
  ///
  /// [lifecycleTransition]: The instance state to which you want to attach the
  /// lifecycle hook. The valid values are:
  ///
  /// *   autoscaling:EC2_INSTANCE_LAUNCHING
  ///
  /// *   autoscaling:EC2_INSTANCE_TERMINATING
  ///
  ///
  /// Conditional: This parameter is required for new lifecycle hooks, but
  /// optional when updating existing hooks.
  ///
  /// [roleArn]: The ARN of the IAM role that allows the Auto Scaling group to
  /// publish to the specified notification target, for example, an Amazon SNS
  /// topic or an Amazon SQS queue.
  ///
  /// Conditional: This parameter is required for new lifecycle hooks, but
  /// optional when updating existing hooks.
  ///
  /// [notificationTargetArn]: The ARN of the notification target that Amazon
  /// EC2 Auto Scaling uses to notify you when an instance is in the transition
  /// state for the lifecycle hook. This target can be either an SQS queue or an
  /// SNS topic.
  ///
  /// If you specify an empty string, this overrides the current ARN.
  ///
  /// This operation uses the JSON format when sending notifications to an
  /// Amazon SQS queue, and an email key-value pair format when sending
  /// notifications to an Amazon SNS topic.
  ///
  /// When you specify a notification target, Amazon EC2 Auto Scaling sends it a
  /// test message. Test messages contain the following additional key-value
  /// pair: `"Event": "autoscaling:TEST_NOTIFICATION"`.
  ///
  /// [notificationMetadata]: Additional information that you want to include
  /// any time Amazon EC2 Auto Scaling sends a message to the notification
  /// target.
  ///
  /// [heartbeatTimeout]: The maximum time, in seconds, that can elapse before
  /// the lifecycle hook times out. The range is from `30` to `7200` seconds.
  /// The default value is `3600` seconds (1 hour).
  ///
  /// If the lifecycle hook times out, Amazon EC2 Auto Scaling performs the
  /// action that you specified in the `DefaultResult` parameter. You can
  /// prevent the lifecycle hook from timing out by calling
  /// RecordLifecycleActionHeartbeat.
  ///
  /// [defaultResult]: Defines the action the Auto Scaling group should take
  /// when the lifecycle hook timeout elapses or if an unexpected failure
  /// occurs. This parameter can be either `CONTINUE` or `ABANDON`. The default
  /// value is `ABANDON`.
  Future<PutLifecycleHookAnswer> putLifecycleHook(
      {@required String lifecycleHookName,
      @required String autoScalingGroupName,
      String lifecycleTransition,
      String roleArn,
      String notificationTargetArn,
      String notificationMetadata,
      int heartbeatTimeout,
      String defaultResult}) async {
    var response_ = await _client.send('PutLifecycleHook', {
      'LifecycleHookName': lifecycleHookName,
      'AutoScalingGroupName': autoScalingGroupName,
      if (lifecycleTransition != null)
        'LifecycleTransition': lifecycleTransition,
      if (roleArn != null) 'RoleARN': roleArn,
      if (notificationTargetArn != null)
        'NotificationTargetARN': notificationTargetArn,
      if (notificationMetadata != null)
        'NotificationMetadata': notificationMetadata,
      if (heartbeatTimeout != null) 'HeartbeatTimeout': heartbeatTimeout,
      if (defaultResult != null) 'DefaultResult': defaultResult,
    });
    return PutLifecycleHookAnswer.fromJson(response_);
  }

  /// Configures an Auto Scaling group to send notifications when specified
  /// events take place. Subscribers to the specified topic can have messages
  /// delivered to an endpoint such as a web server or an email address.
  ///
  /// This configuration overwrites any existing configuration.
  ///
  /// For more information, see
  /// [Getting Amazon SNS Notifications When Your Auto Scaling Group Scales](https://docs.aws.amazon.com/autoscaling/ec2/userguide/ASGettingNotifications.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  ///
  /// [autoScalingGroupName]: The name of the Auto Scaling group.
  ///
  /// [topicArn]: The Amazon Resource Name (ARN) of the Amazon Simple
  /// Notification Service (Amazon SNS) topic.
  ///
  /// [notificationTypes]: The type of event that causes the notification to be
  /// sent. For more information about notification types supported by Amazon
  /// EC2 Auto Scaling, see DescribeAutoScalingNotificationTypes.
  Future<void> putNotificationConfiguration(
      {@required String autoScalingGroupName,
      @required String topicArn,
      @required List<String> notificationTypes}) async {
    await _client.send('PutNotificationConfiguration', {
      'AutoScalingGroupName': autoScalingGroupName,
      'TopicARN': topicArn,
      'NotificationTypes': notificationTypes,
    });
  }

  /// Creates or updates a scaling policy for an Auto Scaling group. To update
  /// an existing scaling policy, use the existing policy name and set the
  /// parameters to change. Any existing parameter not changed in an update to
  /// an existing policy is not changed in this update request.
  ///
  /// For more information about using scaling policies to scale your Auto
  /// Scaling group automatically, see
  /// [Dynamic Scaling](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-scale-based-on-demand.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  ///
  /// [autoScalingGroupName]: The name of the Auto Scaling group.
  ///
  /// [policyName]: The name of the policy.
  ///
  /// [policyType]: The policy type. The valid values are `SimpleScaling`,
  /// `StepScaling`, and `TargetTrackingScaling`. If the policy type is null,
  /// the value is treated as `SimpleScaling`.
  ///
  /// [adjustmentType]: Specifies whether the `ScalingAdjustment` parameter is
  /// an absolute number or a percentage of the current capacity. The valid
  /// values are `ChangeInCapacity`, `ExactCapacity`, and
  /// `PercentChangeInCapacity`.
  ///
  /// Valid only if the policy type is `StepScaling` or `SimpleScaling`. For
  /// more information, see
  /// [Scaling Adjustment Types](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-scaling-simple-step.html#as-scaling-adjustment)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  ///
  /// [minAdjustmentStep]: Available for backward compatibility. Use
  /// `MinAdjustmentMagnitude` instead.
  ///
  /// [minAdjustmentMagnitude]: The minimum number of instances to scale. If the
  /// value of `AdjustmentType` is `PercentChangeInCapacity`, the scaling policy
  /// changes the `DesiredCapacity` of the Auto Scaling group by at least this
  /// many instances. Otherwise, the error is `ValidationError`.
  ///
  /// This property replaces the `MinAdjustmentStep` property. For example,
  /// suppose that you create a step scaling policy to scale out an Auto Scaling
  /// group by 25 percent and you specify a `MinAdjustmentMagnitude` of 2. If
  /// the group has 4 instances and the scaling policy is performed, 25 percent
  /// of 4 is 1. However, because you specified a `MinAdjustmentMagnitude` of 2,
  /// Amazon EC2 Auto Scaling scales out the group by 2 instances.
  ///
  /// Valid only if the policy type is `SimpleScaling` or `StepScaling`.
  ///
  /// [scalingAdjustment]: The amount by which a simple scaling policy scales
  /// the Auto Scaling group in response to an alarm breach. The adjustment is
  /// based on the value that you specified in the `AdjustmentType` parameter
  /// (either an absolute number or a percentage). A positive value adds to the
  /// current capacity and a negative value subtracts from the current capacity.
  /// For exact capacity, you must specify a positive value.
  ///
  /// Conditional: If you specify `SimpleScaling` for the policy type, you must
  /// specify this parameter. (Not used with any other policy type.)
  ///
  /// [cooldown]: The amount of time, in seconds, after a scaling activity
  /// completes before any further dynamic scaling activities can start. If this
  /// parameter is not specified, the default cooldown period for the group
  /// applies.
  ///
  /// Valid only if the policy type is `SimpleScaling`. For more information,
  /// see
  /// [Scaling Cooldowns](https://docs.aws.amazon.com/autoscaling/ec2/userguide/Cooldown.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  ///
  /// [metricAggregationType]: The aggregation type for the CloudWatch metrics.
  /// The valid values are `Minimum`, `Maximum`, and `Average`. If the
  /// aggregation type is null, the value is treated as `Average`.
  ///
  /// Valid only if the policy type is `StepScaling`.
  ///
  /// [stepAdjustments]: A set of adjustments that enable you to scale based on
  /// the size of the alarm breach.
  ///
  /// Conditional: If you specify `StepScaling` for the policy type, you must
  /// specify this parameter. (Not used with any other policy type.)
  ///
  /// [estimatedInstanceWarmup]: The estimated time, in seconds, until a newly
  /// launched instance can contribute to the CloudWatch metrics. The default is
  /// to use the value specified for the default cooldown period for the group.
  ///
  /// Valid only if the policy type is `StepScaling` or `TargetTrackingScaling`.
  ///
  /// [targetTrackingConfiguration]: A target tracking scaling policy. Includes
  /// support for predefined or customized metrics.
  ///
  /// For more information, see
  /// [TargetTrackingConfiguration](https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_TargetTrackingConfiguration.html)
  /// in the _Amazon EC2 Auto Scaling API Reference_.
  ///
  /// Conditional: If you specify `TargetTrackingScaling` for the policy type,
  /// you must specify this parameter. (Not used with any other policy type.)
  Future<PolicyArnType> putScalingPolicy(
      {@required String autoScalingGroupName,
      @required String policyName,
      String policyType,
      String adjustmentType,
      int minAdjustmentStep,
      int minAdjustmentMagnitude,
      int scalingAdjustment,
      int cooldown,
      String metricAggregationType,
      List<StepAdjustment> stepAdjustments,
      int estimatedInstanceWarmup,
      TargetTrackingConfiguration targetTrackingConfiguration}) async {
    var response_ = await _client.send('PutScalingPolicy', {
      'AutoScalingGroupName': autoScalingGroupName,
      'PolicyName': policyName,
      if (policyType != null) 'PolicyType': policyType,
      if (adjustmentType != null) 'AdjustmentType': adjustmentType,
      if (minAdjustmentStep != null) 'MinAdjustmentStep': minAdjustmentStep,
      if (minAdjustmentMagnitude != null)
        'MinAdjustmentMagnitude': minAdjustmentMagnitude,
      if (scalingAdjustment != null) 'ScalingAdjustment': scalingAdjustment,
      if (cooldown != null) 'Cooldown': cooldown,
      if (metricAggregationType != null)
        'MetricAggregationType': metricAggregationType,
      if (stepAdjustments != null) 'StepAdjustments': stepAdjustments,
      if (estimatedInstanceWarmup != null)
        'EstimatedInstanceWarmup': estimatedInstanceWarmup,
      if (targetTrackingConfiguration != null)
        'TargetTrackingConfiguration': targetTrackingConfiguration,
    });
    return PolicyArnType.fromJson(response_);
  }

  /// Creates or updates a scheduled scaling action for an Auto Scaling group.
  /// If you leave a parameter unspecified when updating a scheduled scaling
  /// action, the corresponding value remains unchanged.
  ///
  /// For more information, see
  /// [Scheduled Scaling](https://docs.aws.amazon.com/autoscaling/ec2/userguide/schedule_time.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  ///
  /// [autoScalingGroupName]: The name of the Auto Scaling group.
  ///
  /// [scheduledActionName]: The name of this scaling action.
  ///
  /// [time]: This parameter is no longer used.
  ///
  /// [startTime]: The date and time for this action to start, in
  /// YYYY-MM-DDThh:mm:ssZ format in UTC/GMT only and in quotes (for example,
  /// `"2019-06-01T00:00:00Z"`).
  ///
  /// If you specify `Recurrence` and `StartTime`, Amazon EC2 Auto Scaling
  /// performs the action at this time, and then performs the action based on
  /// the specified recurrence.
  ///
  /// If you try to schedule your action in the past, Amazon EC2 Auto Scaling
  /// returns an error message.
  ///
  /// [endTime]: The date and time for the recurring schedule to end. Amazon EC2
  /// Auto Scaling does not perform the action after this time.
  ///
  /// [recurrence]: The recurring schedule for this action, in Unix cron syntax
  /// format. This format consists of five fields separated by white spaces:
  /// [Minute] [Hour] [Day_of_Month] [Month_of_Year] [Day_of_Week]. The value
  /// must be in quotes (for example, `"30 0 1 1,6,12 *"`). For more information
  /// about this format, see [Crontab](http://crontab.org).
  ///
  /// When `StartTime` and `EndTime` are specified with `Recurrence`, they form
  /// the boundaries of when the recurring action starts and stops.
  ///
  /// [minSize]: The minimum number of instances in the Auto Scaling group.
  ///
  /// [maxSize]: The maximum number of instances in the Auto Scaling group.
  ///
  /// [desiredCapacity]: The number of EC2 instances that should be running in
  /// the Auto Scaling group.
  Future<void> putScheduledUpdateGroupAction(
      {@required String autoScalingGroupName,
      @required String scheduledActionName,
      DateTime time,
      DateTime startTime,
      DateTime endTime,
      String recurrence,
      int minSize,
      int maxSize,
      int desiredCapacity}) async {
    await _client.send('PutScheduledUpdateGroupAction', {
      'AutoScalingGroupName': autoScalingGroupName,
      'ScheduledActionName': scheduledActionName,
      if (time != null) 'Time': time,
      if (startTime != null) 'StartTime': startTime,
      if (endTime != null) 'EndTime': endTime,
      if (recurrence != null) 'Recurrence': recurrence,
      if (minSize != null) 'MinSize': minSize,
      if (maxSize != null) 'MaxSize': maxSize,
      if (desiredCapacity != null) 'DesiredCapacity': desiredCapacity,
    });
  }

  /// Records a heartbeat for the lifecycle action associated with the specified
  /// token or instance. This extends the timeout by the length of time defined
  /// using PutLifecycleHook.
  ///
  /// This step is a part of the procedure for adding a lifecycle hook to an
  /// Auto Scaling group:
  ///
  /// 1.  (Optional) Create a Lambda function and a rule that allows CloudWatch
  /// Events to invoke your Lambda function when Amazon EC2 Auto Scaling
  /// launches or terminates instances.
  ///
  /// 2.  (Optional) Create a notification target and an IAM role. The target
  /// can be either an Amazon SQS queue or an Amazon SNS topic. The role allows
  /// Amazon EC2 Auto Scaling to publish lifecycle notifications to the target.
  ///
  /// 3.  Create the lifecycle hook. Specify whether the hook is used when the
  /// instances launch or terminate.
  ///
  /// 4.   **If you need more time, record the lifecycle action heartbeat to
  /// keep the instance in a pending state.**
  ///
  /// 5.  If you finish before the timeout period ends, complete the lifecycle
  /// action.
  ///
  ///
  /// For more information, see
  /// [Auto Scaling Lifecycle](https://docs.aws.amazon.com/autoscaling/ec2/userguide/AutoScalingGroupLifecycle.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  ///
  /// [lifecycleHookName]: The name of the lifecycle hook.
  ///
  /// [autoScalingGroupName]: The name of the Auto Scaling group.
  ///
  /// [lifecycleActionToken]: A token that uniquely identifies a specific
  /// lifecycle action associated with an instance. Amazon EC2 Auto Scaling
  /// sends this token to the notification target that you specified when you
  /// created the lifecycle hook.
  ///
  /// [instanceId]: The ID of the instance.
  Future<RecordLifecycleActionHeartbeatAnswer> recordLifecycleActionHeartbeat(
      {@required String lifecycleHookName,
      @required String autoScalingGroupName,
      String lifecycleActionToken,
      String instanceId}) async {
    var response_ = await _client.send('RecordLifecycleActionHeartbeat', {
      'LifecycleHookName': lifecycleHookName,
      'AutoScalingGroupName': autoScalingGroupName,
      if (lifecycleActionToken != null)
        'LifecycleActionToken': lifecycleActionToken,
      if (instanceId != null) 'InstanceId': instanceId,
    });
    return RecordLifecycleActionHeartbeatAnswer.fromJson(response_);
  }

  /// Resumes the specified suspended automatic scaling processes, or all
  /// suspended process, for the specified Auto Scaling group.
  ///
  /// For more information, see
  /// [Suspending and Resuming Scaling Processes](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-suspend-resume-processes.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  ///
  /// [autoScalingGroupName]: The name of the Auto Scaling group.
  ///
  /// [scalingProcesses]: One or more of the following processes. If you omit
  /// this parameter, all processes are specified.
  ///
  /// *    `Launch`
  ///
  /// *    `Terminate`
  ///
  /// *    `HealthCheck`
  ///
  /// *    `ReplaceUnhealthy`
  ///
  /// *    `AZRebalance`
  ///
  /// *    `AlarmNotification`
  ///
  /// *    `ScheduledActions`
  ///
  /// *    `AddToLoadBalancer`
  Future<void> resumeProcesses(String autoScalingGroupName,
      {List<String> scalingProcesses}) async {
    await _client.send('ResumeProcesses', {
      'AutoScalingGroupName': autoScalingGroupName,
      if (scalingProcesses != null) 'ScalingProcesses': scalingProcesses,
    });
  }

  /// Sets the size of the specified Auto Scaling group.
  ///
  /// For more information about desired capacity, see
  /// [What Is Amazon EC2 Auto Scaling?](https://docs.aws.amazon.com/autoscaling/ec2/userguide/what-is-amazon-ec2-auto-scaling.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  ///
  /// [autoScalingGroupName]: The name of the Auto Scaling group.
  ///
  /// [desiredCapacity]: The number of EC2 instances that should be running in
  /// the Auto Scaling group.
  ///
  /// [honorCooldown]: Indicates whether Amazon EC2 Auto Scaling waits for the
  /// cooldown period to complete before initiating a scaling activity to set
  /// your Auto Scaling group to its new capacity. By default, Amazon EC2 Auto
  /// Scaling does not honor the cooldown period during manual scaling
  /// activities.
  Future<void> setDesiredCapacity(
      {@required String autoScalingGroupName,
      @required int desiredCapacity,
      bool honorCooldown}) async {
    await _client.send('SetDesiredCapacity', {
      'AutoScalingGroupName': autoScalingGroupName,
      'DesiredCapacity': desiredCapacity,
      if (honorCooldown != null) 'HonorCooldown': honorCooldown,
    });
  }

  /// Sets the health status of the specified instance.
  ///
  /// For more information, see
  /// [Health Checks for Auto Scaling Instances](https://docs.aws.amazon.com/autoscaling/ec2/userguide/healthcheck.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  ///
  /// [instanceId]: The ID of the instance.
  ///
  /// [healthStatus]: The health status of the instance. Set to `Healthy` to
  /// have the instance remain in service. Set to `Unhealthy` to have the
  /// instance be out of service. Amazon EC2 Auto Scaling terminates and
  /// replaces the unhealthy instance.
  ///
  /// [shouldRespectGracePeriod]: If the Auto Scaling group of the specified
  /// instance has a `HealthCheckGracePeriod` specified for the group, by
  /// default, this call respects the grace period. Set this to `False`, to have
  /// the call not respect the grace period associated with the group.
  ///
  /// For more information about the health check grace period, see
  /// CreateAutoScalingGroup.
  Future<void> setInstanceHealth(
      {@required String instanceId,
      @required String healthStatus,
      bool shouldRespectGracePeriod}) async {
    await _client.send('SetInstanceHealth', {
      'InstanceId': instanceId,
      'HealthStatus': healthStatus,
      if (shouldRespectGracePeriod != null)
        'ShouldRespectGracePeriod': shouldRespectGracePeriod,
    });
  }

  /// Updates the instance protection settings of the specified instances.
  ///
  /// For more information about preventing instances that are part of an Auto
  /// Scaling group from terminating on scale in, see
  /// [Instance Protection](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-instance-termination.html#instance-protection)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  ///
  /// [instanceIds]: One or more instance IDs.
  ///
  /// [autoScalingGroupName]: The name of the Auto Scaling group.
  ///
  /// [protectedFromScaleIn]: Indicates whether the instance is protected from
  /// termination by Amazon EC2 Auto Scaling when scaling in.
  Future<SetInstanceProtectionAnswer> setInstanceProtection(
      {@required List<String> instanceIds,
      @required String autoScalingGroupName,
      @required bool protectedFromScaleIn}) async {
    var response_ = await _client.send('SetInstanceProtection', {
      'InstanceIds': instanceIds,
      'AutoScalingGroupName': autoScalingGroupName,
      'ProtectedFromScaleIn': protectedFromScaleIn,
    });
    return SetInstanceProtectionAnswer.fromJson(response_);
  }

  /// Suspends the specified automatic scaling processes, or all processes, for
  /// the specified Auto Scaling group.
  ///
  /// If you suspend either the `Launch` or `Terminate` process types, it can
  /// prevent other process types from functioning properly.
  ///
  /// To resume processes that have been suspended, use ResumeProcesses.
  ///
  /// For more information, see
  /// [Suspending and Resuming Scaling Processes](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-suspend-resume-processes.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  ///
  /// [autoScalingGroupName]: The name of the Auto Scaling group.
  ///
  /// [scalingProcesses]: One or more of the following processes. If you omit
  /// this parameter, all processes are specified.
  ///
  /// *    `Launch`
  ///
  /// *    `Terminate`
  ///
  /// *    `HealthCheck`
  ///
  /// *    `ReplaceUnhealthy`
  ///
  /// *    `AZRebalance`
  ///
  /// *    `AlarmNotification`
  ///
  /// *    `ScheduledActions`
  ///
  /// *    `AddToLoadBalancer`
  Future<void> suspendProcesses(String autoScalingGroupName,
      {List<String> scalingProcesses}) async {
    await _client.send('SuspendProcesses', {
      'AutoScalingGroupName': autoScalingGroupName,
      if (scalingProcesses != null) 'ScalingProcesses': scalingProcesses,
    });
  }

  /// Terminates the specified instance and optionally adjusts the desired group
  /// size.
  ///
  /// This call simply makes a termination request. The instance is not
  /// terminated immediately.
  ///
  /// [instanceId]: The ID of the instance.
  ///
  /// [shouldDecrementDesiredCapacity]: Indicates whether terminating the
  /// instance also decrements the size of the Auto Scaling group.
  Future<ActivityType> terminateInstanceInAutoScalingGroup(
      {@required String instanceId,
      @required bool shouldDecrementDesiredCapacity}) async {
    var response_ = await _client.send('TerminateInstanceInAutoScalingGroup', {
      'InstanceId': instanceId,
      'ShouldDecrementDesiredCapacity': shouldDecrementDesiredCapacity,
    });
    return ActivityType.fromJson(response_);
  }

  /// Updates the configuration for the specified Auto Scaling group.
  ///
  /// To update an Auto Scaling group, specify the name of the group and the
  /// parameter that you want to change. Any parameters that you don't specify
  /// are not changed by this update request. The new settings take effect on
  /// any scaling activities after this call returns. Scaling activities that
  /// are currently in progress aren't affected.
  ///
  /// If you associate a new launch configuration or template with an Auto
  /// Scaling group, all new instances will get the updated configuration.
  /// Existing instances continue to run with the configuration that they were
  /// originally launched with. When you update a group to specify a mixed
  /// instances policy instead of a launch configuration or template, existing
  /// instances may be replaced to match the new purchasing options that you
  /// specified in the policy. For example, if the group currently has 100%
  /// On-Demand capacity and the policy specifies 50% Spot capacity, this means
  /// that half of your instances will be gradually terminated and relaunched as
  /// Spot Instances. When replacing instances, Amazon EC2 Auto Scaling launches
  /// new instances before terminating the old ones, so that updating your group
  /// does not compromise the performance or availability of your application.
  ///
  /// Note the following about changing `DesiredCapacity`, `MaxSize`, or
  /// `MinSize`:
  ///
  /// *   If a scale-in event occurs as a result of a new `DesiredCapacity`
  /// value that is lower than the current size of the group, the Auto Scaling
  /// group uses its termination policy to determine which instances to
  /// terminate.
  ///
  /// *   If you specify a new value for `MinSize` without specifying a value
  /// for `DesiredCapacity`, and the new `MinSize` is larger than the current
  /// size of the group, this sets the group's `DesiredCapacity` to the new
  /// `MinSize` value.
  ///
  /// *   If you specify a new value for `MaxSize` without specifying a value
  /// for `DesiredCapacity`, and the new `MaxSize` is smaller than the current
  /// size of the group, this sets the group's `DesiredCapacity` to the new
  /// `MaxSize` value.
  ///
  ///
  /// To see which parameters have been set, use DescribeAutoScalingGroups. You
  /// can also view the scaling policies for an Auto Scaling group using
  /// DescribePolicies. If the group has scaling policies, you can update them
  /// using PutScalingPolicy.
  ///
  /// [autoScalingGroupName]: The name of the Auto Scaling group.
  ///
  /// [launchConfigurationName]: The name of the launch configuration. If you
  /// specify `LaunchConfigurationName` in your update request, you can't
  /// specify `LaunchTemplate` or `MixedInstancesPolicy`.
  ///
  ///
  ///
  /// To update an Auto Scaling group with a launch configuration with
  /// `InstanceMonitoring` set to `false`, you must first disable the collection
  /// of group metrics. Otherwise, you get an error. If you have previously
  /// enabled the collection of group metrics, you can disable it using
  /// DisableMetricsCollection.
  ///
  /// [launchTemplate]: The launch template and version to use to specify the
  /// updates. If you specify `LaunchTemplate` in your update request, you can't
  /// specify `LaunchConfigurationName` or `MixedInstancesPolicy`.
  ///
  /// For more information, see
  /// [LaunchTemplateSpecification](https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_LaunchTemplateSpecification.html)
  /// in the _Amazon EC2 Auto Scaling API Reference_.
  ///
  /// [mixedInstancesPolicy]: An embedded object that specifies a mixed
  /// instances policy.
  ///
  /// In your call to `UpdateAutoScalingGroup`, you can make changes to the
  /// policy that is specified. All optional parameters are left unchanged if
  /// not specified.
  ///
  /// For more information, see
  /// [MixedInstancesPolicy](https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_MixedInstancesPolicy.html)
  /// in the _Amazon EC2 Auto Scaling API Reference_ and
  /// [Auto Scaling Groups with Multiple Instance Types and Purchase Options](https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-purchase-options.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  ///
  /// [minSize]: The minimum size of the Auto Scaling group.
  ///
  /// [maxSize]: The maximum size of the Auto Scaling group.
  ///
  /// [desiredCapacity]: The number of EC2 instances that should be running in
  /// the Auto Scaling group. This number must be greater than or equal to the
  /// minimum size of the group and less than or equal to the maximum size of
  /// the group.
  ///
  /// [defaultCooldown]: The amount of time, in seconds, after a scaling
  /// activity completes before another scaling activity can start. The default
  /// value is `300`. This cooldown period is not used when a scaling-specific
  /// cooldown is specified.
  ///
  /// Cooldown periods are not supported for target tracking scaling policies,
  /// step scaling policies, or scheduled scaling. For more information, see
  /// [Scaling Cooldowns](https://docs.aws.amazon.com/autoscaling/ec2/userguide/Cooldown.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  ///
  /// [availabilityZones]: One or more Availability Zones for the group.
  ///
  /// [healthCheckType]: The service to use for the health checks. The valid
  /// values are `EC2` and `ELB`. If you configure an Auto Scaling group to use
  /// ELB health checks, it considers the instance unhealthy if it fails either
  /// the EC2 status checks or the load balancer health checks.
  ///
  /// [healthCheckGracePeriod]: The amount of time, in seconds, that Amazon EC2
  /// Auto Scaling waits before checking the health status of an EC2 instance
  /// that has come into service. The default value is `0`.
  ///
  /// For more information, see
  /// [Health Check Grace Period](https://docs.aws.amazon.com/autoscaling/ec2/userguide/healthcheck.html#health-check-grace-period)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  ///
  /// Conditional: This parameter is required if you are adding an `ELB` health
  /// check.
  ///
  /// [placementGroup]: The name of the placement group into which to launch
  /// your instances, if any. A placement group is a logical grouping of
  /// instances within a single Availability Zone. You cannot specify multiple
  /// Availability Zones and a placement group. For more information, see
  /// [Placement Groups](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/placement-groups.html)
  /// in the _Amazon EC2 User Guide for Linux Instances_.
  ///
  /// [vpcZoneIdentifier]: A comma-separated list of subnet IDs for virtual
  /// private cloud (VPC).
  ///
  /// If you specify `VPCZoneIdentifier` with `AvailabilityZones`, the subnets
  /// that you specify for this parameter must reside in those Availability
  /// Zones.
  ///
  /// [terminationPolicies]: A standalone termination policy or a list of
  /// termination policies used to select the instance to terminate. The
  /// policies are executed in the order that they are listed.
  ///
  /// For more information, see
  /// [Controlling Which Instances Auto Scaling Terminates During Scale In](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-instance-termination.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  ///
  /// [newInstancesProtectedFromScaleIn]: Indicates whether newly launched
  /// instances are protected from termination by Amazon EC2 Auto Scaling when
  /// scaling in.
  ///
  /// For more information about preventing instances from terminating on scale
  /// in, see
  /// [Instance Protection](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-instance-termination.html#instance-protection)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  ///
  /// [serviceLinkedRoleArn]: The Amazon Resource Name (ARN) of the
  /// service-linked role that the Auto Scaling group uses to call other AWS
  /// services on your behalf. For more information, see
  /// [Service-Linked Roles](https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-service-linked-role.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  Future<void> updateAutoScalingGroup(String autoScalingGroupName,
      {String launchConfigurationName,
      LaunchTemplateSpecification launchTemplate,
      MixedInstancesPolicy mixedInstancesPolicy,
      int minSize,
      int maxSize,
      int desiredCapacity,
      int defaultCooldown,
      List<String> availabilityZones,
      String healthCheckType,
      int healthCheckGracePeriod,
      String placementGroup,
      String vpcZoneIdentifier,
      List<String> terminationPolicies,
      bool newInstancesProtectedFromScaleIn,
      String serviceLinkedRoleArn}) async {
    await _client.send('UpdateAutoScalingGroup', {
      'AutoScalingGroupName': autoScalingGroupName,
      if (launchConfigurationName != null)
        'LaunchConfigurationName': launchConfigurationName,
      if (launchTemplate != null) 'LaunchTemplate': launchTemplate,
      if (mixedInstancesPolicy != null)
        'MixedInstancesPolicy': mixedInstancesPolicy,
      if (minSize != null) 'MinSize': minSize,
      if (maxSize != null) 'MaxSize': maxSize,
      if (desiredCapacity != null) 'DesiredCapacity': desiredCapacity,
      if (defaultCooldown != null) 'DefaultCooldown': defaultCooldown,
      if (availabilityZones != null) 'AvailabilityZones': availabilityZones,
      if (healthCheckType != null) 'HealthCheckType': healthCheckType,
      if (healthCheckGracePeriod != null)
        'HealthCheckGracePeriod': healthCheckGracePeriod,
      if (placementGroup != null) 'PlacementGroup': placementGroup,
      if (vpcZoneIdentifier != null) 'VPCZoneIdentifier': vpcZoneIdentifier,
      if (terminationPolicies != null)
        'TerminationPolicies': terminationPolicies,
      if (newInstancesProtectedFromScaleIn != null)
        'NewInstancesProtectedFromScaleIn': newInstancesProtectedFromScaleIn,
      if (serviceLinkedRoleArn != null)
        'ServiceLinkedRoleARN': serviceLinkedRoleArn,
    });
  }
}

class ActivitiesType {
  /// The scaling activities. Activities are sorted by start time. Activities
  /// still in progress are described first.
  final List<Activity> activities;

  /// A string that indicates that the response contains more items than can be
  /// returned in a single response. To receive additional items, specify this
  /// string for the `NextToken` value when requesting the next set of items.
  /// This value is null when there are no more items to return.
  final String nextToken;

  ActivitiesType({
    @required this.activities,
    this.nextToken,
  });
  static ActivitiesType fromJson(Map<String, dynamic> json) => ActivitiesType(
        activities: (json['Activities'] as List)
            .map((e) => Activity.fromJson(e))
            .toList(),
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// Describes scaling activity, which is a long-running process that represents
/// a change to your Auto Scaling group, such as changing its size or replacing
/// an instance.
class Activity {
  /// The ID of the activity.
  final String activityId;

  /// The name of the Auto Scaling group.
  final String autoScalingGroupName;

  /// A friendly, more verbose description of the activity.
  final String description;

  /// The reason the activity began.
  final String cause;

  /// The start time of the activity.
  final DateTime startTime;

  /// The end time of the activity.
  final DateTime endTime;

  /// The current status of the activity.
  final String statusCode;

  /// A friendly, more verbose description of the activity status.
  final String statusMessage;

  /// A value between 0 and 100 that indicates the progress of the activity.
  final int progress;

  /// The details about the activity.
  final String details;

  Activity({
    @required this.activityId,
    @required this.autoScalingGroupName,
    this.description,
    @required this.cause,
    @required this.startTime,
    this.endTime,
    @required this.statusCode,
    this.statusMessage,
    this.progress,
    this.details,
  });
  static Activity fromJson(Map<String, dynamic> json) => Activity(
        activityId: json['ActivityId'] as String,
        autoScalingGroupName: json['AutoScalingGroupName'] as String,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        cause: json['Cause'] as String,
        startTime: DateTime.parse(json['StartTime']),
        endTime: json.containsKey('EndTime')
            ? DateTime.parse(json['EndTime'])
            : null,
        statusCode: json['StatusCode'] as String,
        statusMessage: json.containsKey('StatusMessage')
            ? json['StatusMessage'] as String
            : null,
        progress: json.containsKey('Progress') ? json['Progress'] as int : null,
        details: json.containsKey('Details') ? json['Details'] as String : null,
      );
}

class ActivityType {
  /// A scaling activity.
  final Activity activity;

  ActivityType({
    this.activity,
  });
  static ActivityType fromJson(Map<String, dynamic> json) => ActivityType(
        activity: json.containsKey('Activity')
            ? Activity.fromJson(json['Activity'])
            : null,
      );
}

/// Describes a policy adjustment type.
class AdjustmentType {
  /// The policy adjustment type. The valid values are `ChangeInCapacity`,
  /// `ExactCapacity`, and `PercentChangeInCapacity`.
  final String adjustmentType;

  AdjustmentType({
    this.adjustmentType,
  });
  static AdjustmentType fromJson(Map<String, dynamic> json) => AdjustmentType(
        adjustmentType: json.containsKey('AdjustmentType')
            ? json['AdjustmentType'] as String
            : null,
      );
}

/// Describes an alarm.
class Alarm {
  /// The name of the alarm.
  final String alarmName;

  /// The Amazon Resource Name (ARN) of the alarm.
  final String alarmArn;

  Alarm({
    this.alarmName,
    this.alarmArn,
  });
  static Alarm fromJson(Map<String, dynamic> json) => Alarm(
        alarmName:
            json.containsKey('AlarmName') ? json['AlarmName'] as String : null,
        alarmArn:
            json.containsKey('AlarmARN') ? json['AlarmARN'] as String : null,
      );
}

class AttachLoadBalancerTargetGroupsResultType {
  AttachLoadBalancerTargetGroupsResultType();
  static AttachLoadBalancerTargetGroupsResultType fromJson(
          Map<String, dynamic> json) =>
      AttachLoadBalancerTargetGroupsResultType();
}

class AttachLoadBalancersResultType {
  AttachLoadBalancersResultType();
  static AttachLoadBalancersResultType fromJson(Map<String, dynamic> json) =>
      AttachLoadBalancersResultType();
}

/// Describes an Auto Scaling group.
class AutoScalingGroup {
  /// The name of the Auto Scaling group.
  final String autoScalingGroupName;

  /// The Amazon Resource Name (ARN) of the Auto Scaling group.
  final String autoScalingGroupArn;

  /// The name of the associated launch configuration.
  final String launchConfigurationName;

  /// The launch template for the group.
  final LaunchTemplateSpecification launchTemplate;

  /// The mixed instances policy for the group.
  final MixedInstancesPolicy mixedInstancesPolicy;

  /// The minimum size of the group.
  final int minSize;

  /// The maximum size of the group.
  final int maxSize;

  /// The desired size of the group.
  final int desiredCapacity;

  /// The amount of time, in seconds, after a scaling activity completes before
  /// another scaling activity can start.
  final int defaultCooldown;

  /// One or more Availability Zones for the group.
  final List<String> availabilityZones;

  /// One or more load balancers associated with the group.
  final List<String> loadBalancerNames;

  /// The Amazon Resource Names (ARN) of the target groups for your load
  /// balancer.
  final List<String> targetGroupARNs;

  /// The service to use for the health checks. The valid values are `EC2` and
  /// `ELB`. If you configure an Auto Scaling group to use ELB health checks, it
  /// considers the instance unhealthy if it fails either the EC2 status checks
  /// or the load balancer health checks.
  final String healthCheckType;

  /// The amount of time, in seconds, that Amazon EC2 Auto Scaling waits before
  /// checking the health status of an EC2 instance that has come into service.
  final int healthCheckGracePeriod;

  /// The EC2 instances associated with the group.
  final List<Instance> instances;

  /// The date and time the group was created.
  final DateTime createdTime;

  /// The suspended processes associated with the group.
  final List<SuspendedProcess> suspendedProcesses;

  /// The name of the placement group into which to launch your instances, if
  /// any.
  final String placementGroup;

  /// One or more subnet IDs, if applicable, separated by commas.
  final String vpcZoneIdentifier;

  /// The metrics enabled for the group.
  final List<EnabledMetric> enabledMetrics;

  /// The current state of the group when DeleteAutoScalingGroup is in progress.
  final String status;

  /// The tags for the group.
  final List<TagDescription> tags;

  /// The termination policies for the group.
  final List<String> terminationPolicies;

  /// Indicates whether newly launched instances are protected from termination
  /// by Amazon EC2 Auto Scaling when scaling in.
  final bool newInstancesProtectedFromScaleIn;

  /// The Amazon Resource Name (ARN) of the service-linked role that the Auto
  /// Scaling group uses to call other AWS services on your behalf.
  final String serviceLinkedRoleArn;

  AutoScalingGroup({
    @required this.autoScalingGroupName,
    this.autoScalingGroupArn,
    this.launchConfigurationName,
    this.launchTemplate,
    this.mixedInstancesPolicy,
    @required this.minSize,
    @required this.maxSize,
    @required this.desiredCapacity,
    @required this.defaultCooldown,
    @required this.availabilityZones,
    this.loadBalancerNames,
    this.targetGroupARNs,
    @required this.healthCheckType,
    this.healthCheckGracePeriod,
    this.instances,
    @required this.createdTime,
    this.suspendedProcesses,
    this.placementGroup,
    this.vpcZoneIdentifier,
    this.enabledMetrics,
    this.status,
    this.tags,
    this.terminationPolicies,
    this.newInstancesProtectedFromScaleIn,
    this.serviceLinkedRoleArn,
  });
  static AutoScalingGroup fromJson(Map<String, dynamic> json) =>
      AutoScalingGroup(
        autoScalingGroupName: json['AutoScalingGroupName'] as String,
        autoScalingGroupArn: json.containsKey('AutoScalingGroupARN')
            ? json['AutoScalingGroupARN'] as String
            : null,
        launchConfigurationName: json.containsKey('LaunchConfigurationName')
            ? json['LaunchConfigurationName'] as String
            : null,
        launchTemplate: json.containsKey('LaunchTemplate')
            ? LaunchTemplateSpecification.fromJson(json['LaunchTemplate'])
            : null,
        mixedInstancesPolicy: json.containsKey('MixedInstancesPolicy')
            ? MixedInstancesPolicy.fromJson(json['MixedInstancesPolicy'])
            : null,
        minSize: json['MinSize'] as int,
        maxSize: json['MaxSize'] as int,
        desiredCapacity: json['DesiredCapacity'] as int,
        defaultCooldown: json['DefaultCooldown'] as int,
        availabilityZones: (json['AvailabilityZones'] as List)
            .map((e) => e as String)
            .toList(),
        loadBalancerNames: json.containsKey('LoadBalancerNames')
            ? (json['LoadBalancerNames'] as List)
                .map((e) => e as String)
                .toList()
            : null,
        targetGroupARNs: json.containsKey('TargetGroupARNs')
            ? (json['TargetGroupARNs'] as List).map((e) => e as String).toList()
            : null,
        healthCheckType: json['HealthCheckType'] as String,
        healthCheckGracePeriod: json.containsKey('HealthCheckGracePeriod')
            ? json['HealthCheckGracePeriod'] as int
            : null,
        instances: json.containsKey('Instances')
            ? (json['Instances'] as List)
                .map((e) => Instance.fromJson(e))
                .toList()
            : null,
        createdTime: DateTime.parse(json['CreatedTime']),
        suspendedProcesses: json.containsKey('SuspendedProcesses')
            ? (json['SuspendedProcesses'] as List)
                .map((e) => SuspendedProcess.fromJson(e))
                .toList()
            : null,
        placementGroup: json.containsKey('PlacementGroup')
            ? json['PlacementGroup'] as String
            : null,
        vpcZoneIdentifier: json.containsKey('VPCZoneIdentifier')
            ? json['VPCZoneIdentifier'] as String
            : null,
        enabledMetrics: json.containsKey('EnabledMetrics')
            ? (json['EnabledMetrics'] as List)
                .map((e) => EnabledMetric.fromJson(e))
                .toList()
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as List)
                .map((e) => TagDescription.fromJson(e))
                .toList()
            : null,
        terminationPolicies: json.containsKey('TerminationPolicies')
            ? (json['TerminationPolicies'] as List)
                .map((e) => e as String)
                .toList()
            : null,
        newInstancesProtectedFromScaleIn:
            json.containsKey('NewInstancesProtectedFromScaleIn')
                ? json['NewInstancesProtectedFromScaleIn'] as bool
                : null,
        serviceLinkedRoleArn: json.containsKey('ServiceLinkedRoleARN')
            ? json['ServiceLinkedRoleARN'] as String
            : null,
      );
}

class AutoScalingGroupsType {
  /// The groups.
  final List<AutoScalingGroup> autoScalingGroups;

  /// A string that indicates that the response contains more items than can be
  /// returned in a single response. To receive additional items, specify this
  /// string for the `NextToken` value when requesting the next set of items.
  /// This value is null when there are no more items to return.
  final String nextToken;

  AutoScalingGroupsType({
    @required this.autoScalingGroups,
    this.nextToken,
  });
  static AutoScalingGroupsType fromJson(Map<String, dynamic> json) =>
      AutoScalingGroupsType(
        autoScalingGroups: (json['AutoScalingGroups'] as List)
            .map((e) => AutoScalingGroup.fromJson(e))
            .toList(),
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// Describes an EC2 instance associated with an Auto Scaling group.
class AutoScalingInstanceDetails {
  /// The ID of the instance.
  final String instanceId;

  /// The name of the Auto Scaling group for the instance.
  final String autoScalingGroupName;

  /// The Availability Zone for the instance.
  final String availabilityZone;

  /// The lifecycle state for the instance.
  final String lifecycleState;

  /// The last reported health status of this instance. "Healthy" means that the
  /// instance is healthy and should remain in service. "Unhealthy" means that
  /// the instance is unhealthy and Amazon EC2 Auto Scaling should terminate and
  /// replace it.
  final String healthStatus;

  /// The launch configuration used to launch the instance. This value is not
  /// available if you attached the instance to the Auto Scaling group.
  final String launchConfigurationName;

  /// The launch template for the instance.
  final LaunchTemplateSpecification launchTemplate;

  /// Indicates whether the instance is protected from termination by Amazon EC2
  /// Auto Scaling when scaling in.
  final bool protectedFromScaleIn;

  AutoScalingInstanceDetails({
    @required this.instanceId,
    @required this.autoScalingGroupName,
    @required this.availabilityZone,
    @required this.lifecycleState,
    @required this.healthStatus,
    this.launchConfigurationName,
    this.launchTemplate,
    @required this.protectedFromScaleIn,
  });
  static AutoScalingInstanceDetails fromJson(Map<String, dynamic> json) =>
      AutoScalingInstanceDetails(
        instanceId: json['InstanceId'] as String,
        autoScalingGroupName: json['AutoScalingGroupName'] as String,
        availabilityZone: json['AvailabilityZone'] as String,
        lifecycleState: json['LifecycleState'] as String,
        healthStatus: json['HealthStatus'] as String,
        launchConfigurationName: json.containsKey('LaunchConfigurationName')
            ? json['LaunchConfigurationName'] as String
            : null,
        launchTemplate: json.containsKey('LaunchTemplate')
            ? LaunchTemplateSpecification.fromJson(json['LaunchTemplate'])
            : null,
        protectedFromScaleIn: json['ProtectedFromScaleIn'] as bool,
      );
}

class AutoScalingInstancesType {
  /// The instances.
  final List<AutoScalingInstanceDetails> autoScalingInstances;

  /// A string that indicates that the response contains more items than can be
  /// returned in a single response. To receive additional items, specify this
  /// string for the `NextToken` value when requesting the next set of items.
  /// This value is null when there are no more items to return.
  final String nextToken;

  AutoScalingInstancesType({
    this.autoScalingInstances,
    this.nextToken,
  });
  static AutoScalingInstancesType fromJson(Map<String, dynamic> json) =>
      AutoScalingInstancesType(
        autoScalingInstances: json.containsKey('AutoScalingInstances')
            ? (json['AutoScalingInstances'] as List)
                .map((e) => AutoScalingInstanceDetails.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class BatchDeleteScheduledActionAnswer {
  /// The names of the scheduled actions that could not be deleted, including an
  /// error message.
  final List<FailedScheduledUpdateGroupActionRequest> failedScheduledActions;

  BatchDeleteScheduledActionAnswer({
    this.failedScheduledActions,
  });
  static BatchDeleteScheduledActionAnswer fromJson(Map<String, dynamic> json) =>
      BatchDeleteScheduledActionAnswer(
        failedScheduledActions: json.containsKey('FailedScheduledActions')
            ? (json['FailedScheduledActions'] as List)
                .map((e) => FailedScheduledUpdateGroupActionRequest.fromJson(e))
                .toList()
            : null,
      );
}

class BatchPutScheduledUpdateGroupActionAnswer {
  /// The names of the scheduled actions that could not be created or updated,
  /// including an error message.
  final List<FailedScheduledUpdateGroupActionRequest>
      failedScheduledUpdateGroupActions;

  BatchPutScheduledUpdateGroupActionAnswer({
    this.failedScheduledUpdateGroupActions,
  });
  static BatchPutScheduledUpdateGroupActionAnswer fromJson(
          Map<String, dynamic> json) =>
      BatchPutScheduledUpdateGroupActionAnswer(
        failedScheduledUpdateGroupActions: json
                .containsKey('FailedScheduledUpdateGroupActions')
            ? (json['FailedScheduledUpdateGroupActions'] as List)
                .map((e) => FailedScheduledUpdateGroupActionRequest.fromJson(e))
                .toList()
            : null,
      );
}

/// Describes a block device mapping.
class BlockDeviceMapping {
  /// The name of the virtual device (for example, `ephemeral0`).
  final String virtualName;

  /// The device name exposed to the EC2 instance (for example, `/dev/sdh` or
  /// `xvdh`). For more information, see
  /// [Device Naming on Linux Instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/device_naming.html)
  /// in the _Amazon EC2 User Guide for Linux Instances_.
  final String deviceName;

  /// The information about the Amazon EBS volume.
  final Ebs ebs;

  /// Suppresses a device mapping.
  ///
  /// If this parameter is true for the root device, the instance might fail the
  /// EC2 health check. In that case, Amazon EC2 Auto Scaling launches a
  /// replacement instance.
  final bool noDevice;

  BlockDeviceMapping({
    this.virtualName,
    @required this.deviceName,
    this.ebs,
    this.noDevice,
  });
  static BlockDeviceMapping fromJson(Map<String, dynamic> json) =>
      BlockDeviceMapping(
        virtualName: json.containsKey('VirtualName')
            ? json['VirtualName'] as String
            : null,
        deviceName: json['DeviceName'] as String,
        ebs: json.containsKey('Ebs') ? Ebs.fromJson(json['Ebs']) : null,
        noDevice:
            json.containsKey('NoDevice') ? json['NoDevice'] as bool : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class CompleteLifecycleActionAnswer {
  CompleteLifecycleActionAnswer();
  static CompleteLifecycleActionAnswer fromJson(Map<String, dynamic> json) =>
      CompleteLifecycleActionAnswer();
}

/// Represents a CloudWatch metric of your choosing for a target tracking
/// scaling policy to use with Amazon EC2 Auto Scaling.
///
/// To create your customized metric specification:
///
/// *   Add values for each required parameter from CloudWatch. You can use an
/// existing metric, or a new metric that you create. To use your own metric,
/// you must first publish the metric to CloudWatch. For more information, see
/// [Publish Custom Metrics](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/publishingMetrics.html)
/// in the _Amazon CloudWatch User Guide_.
///
/// *   Choose a metric that changes proportionally with capacity. The value of
/// the metric should increase or decrease in inverse proportion to the number
/// of capacity units. That is, the value of the metric should decrease when
/// capacity increases.
///
///
/// For more information about CloudWatch, see
/// [Amazon CloudWatch Concepts](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_concepts.html).
class CustomizedMetricSpecification {
  /// The name of the metric.
  final String metricName;

  /// The namespace of the metric.
  final String namespace;

  /// The dimensions of the metric.
  ///
  /// Conditional: If you published your metric with dimensions, you must
  /// specify the same dimensions in your scaling policy.
  final List<MetricDimension> dimensions;

  /// The statistic of the metric.
  final String statistic;

  /// The unit of the metric.
  final String unit;

  CustomizedMetricSpecification({
    @required this.metricName,
    @required this.namespace,
    this.dimensions,
    @required this.statistic,
    this.unit,
  });
  static CustomizedMetricSpecification fromJson(Map<String, dynamic> json) =>
      CustomizedMetricSpecification(
        metricName: json['MetricName'] as String,
        namespace: json['Namespace'] as String,
        dimensions: json.containsKey('Dimensions')
            ? (json['Dimensions'] as List)
                .map((e) => MetricDimension.fromJson(e))
                .toList()
            : null,
        statistic: json['Statistic'] as String,
        unit: json.containsKey('Unit') ? json['Unit'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class DeleteLifecycleHookAnswer {
  DeleteLifecycleHookAnswer();
  static DeleteLifecycleHookAnswer fromJson(Map<String, dynamic> json) =>
      DeleteLifecycleHookAnswer();
}

class DescribeAccountLimitsAnswer {
  /// The maximum number of groups allowed for your AWS account. The default
  /// limit is 200 per AWS Region.
  final int maxNumberOfAutoScalingGroups;

  /// The maximum number of launch configurations allowed for your AWS account.
  /// The default limit is 200 per AWS Region.
  final int maxNumberOfLaunchConfigurations;

  /// The current number of groups for your AWS account.
  final int numberOfAutoScalingGroups;

  /// The current number of launch configurations for your AWS account.
  final int numberOfLaunchConfigurations;

  DescribeAccountLimitsAnswer({
    this.maxNumberOfAutoScalingGroups,
    this.maxNumberOfLaunchConfigurations,
    this.numberOfAutoScalingGroups,
    this.numberOfLaunchConfigurations,
  });
  static DescribeAccountLimitsAnswer fromJson(Map<String, dynamic> json) =>
      DescribeAccountLimitsAnswer(
        maxNumberOfAutoScalingGroups:
            json.containsKey('MaxNumberOfAutoScalingGroups')
                ? json['MaxNumberOfAutoScalingGroups'] as int
                : null,
        maxNumberOfLaunchConfigurations:
            json.containsKey('MaxNumberOfLaunchConfigurations')
                ? json['MaxNumberOfLaunchConfigurations'] as int
                : null,
        numberOfAutoScalingGroups: json.containsKey('NumberOfAutoScalingGroups')
            ? json['NumberOfAutoScalingGroups'] as int
            : null,
        numberOfLaunchConfigurations:
            json.containsKey('NumberOfLaunchConfigurations')
                ? json['NumberOfLaunchConfigurations'] as int
                : null,
      );
}

class DescribeAdjustmentTypesAnswer {
  /// The policy adjustment types.
  final List<AdjustmentType> adjustmentTypes;

  DescribeAdjustmentTypesAnswer({
    this.adjustmentTypes,
  });
  static DescribeAdjustmentTypesAnswer fromJson(Map<String, dynamic> json) =>
      DescribeAdjustmentTypesAnswer(
        adjustmentTypes: json.containsKey('AdjustmentTypes')
            ? (json['AdjustmentTypes'] as List)
                .map((e) => AdjustmentType.fromJson(e))
                .toList()
            : null,
      );
}

class DescribeAutoScalingNotificationTypesAnswer {
  /// The notification types.
  final List<String> autoScalingNotificationTypes;

  DescribeAutoScalingNotificationTypesAnswer({
    this.autoScalingNotificationTypes,
  });
  static DescribeAutoScalingNotificationTypesAnswer fromJson(
          Map<String, dynamic> json) =>
      DescribeAutoScalingNotificationTypesAnswer(
        autoScalingNotificationTypes:
            json.containsKey('AutoScalingNotificationTypes')
                ? (json['AutoScalingNotificationTypes'] as List)
                    .map((e) => e as String)
                    .toList()
                : null,
      );
}

class DescribeLifecycleHookTypesAnswer {
  /// The lifecycle hook types.
  final List<String> lifecycleHookTypes;

  DescribeLifecycleHookTypesAnswer({
    this.lifecycleHookTypes,
  });
  static DescribeLifecycleHookTypesAnswer fromJson(Map<String, dynamic> json) =>
      DescribeLifecycleHookTypesAnswer(
        lifecycleHookTypes: json.containsKey('LifecycleHookTypes')
            ? (json['LifecycleHookTypes'] as List)
                .map((e) => e as String)
                .toList()
            : null,
      );
}

class DescribeLifecycleHooksAnswer {
  /// The lifecycle hooks for the specified group.
  final List<LifecycleHook> lifecycleHooks;

  DescribeLifecycleHooksAnswer({
    this.lifecycleHooks,
  });
  static DescribeLifecycleHooksAnswer fromJson(Map<String, dynamic> json) =>
      DescribeLifecycleHooksAnswer(
        lifecycleHooks: json.containsKey('LifecycleHooks')
            ? (json['LifecycleHooks'] as List)
                .map((e) => LifecycleHook.fromJson(e))
                .toList()
            : null,
      );
}

class DescribeLoadBalancerTargetGroupsResponse {
  /// Information about the target groups.
  final List<LoadBalancerTargetGroupState> loadBalancerTargetGroups;

  /// A string that indicates that the response contains more items than can be
  /// returned in a single response. To receive additional items, specify this
  /// string for the `NextToken` value when requesting the next set of items.
  /// This value is null when there are no more items to return.
  final String nextToken;

  DescribeLoadBalancerTargetGroupsResponse({
    this.loadBalancerTargetGroups,
    this.nextToken,
  });
  static DescribeLoadBalancerTargetGroupsResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeLoadBalancerTargetGroupsResponse(
        loadBalancerTargetGroups: json.containsKey('LoadBalancerTargetGroups')
            ? (json['LoadBalancerTargetGroups'] as List)
                .map((e) => LoadBalancerTargetGroupState.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class DescribeLoadBalancersResponse {
  /// The load balancers.
  final List<LoadBalancerState> loadBalancers;

  /// A string that indicates that the response contains more items than can be
  /// returned in a single response. To receive additional items, specify this
  /// string for the `NextToken` value when requesting the next set of items.
  /// This value is null when there are no more items to return.
  final String nextToken;

  DescribeLoadBalancersResponse({
    this.loadBalancers,
    this.nextToken,
  });
  static DescribeLoadBalancersResponse fromJson(Map<String, dynamic> json) =>
      DescribeLoadBalancersResponse(
        loadBalancers: json.containsKey('LoadBalancers')
            ? (json['LoadBalancers'] as List)
                .map((e) => LoadBalancerState.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class DescribeMetricCollectionTypesAnswer {
  /// One or more metrics.
  final List<MetricCollectionType> metrics;

  /// The granularities for the metrics.
  final List<MetricGranularityType> granularities;

  DescribeMetricCollectionTypesAnswer({
    this.metrics,
    this.granularities,
  });
  static DescribeMetricCollectionTypesAnswer fromJson(
          Map<String, dynamic> json) =>
      DescribeMetricCollectionTypesAnswer(
        metrics: json.containsKey('Metrics')
            ? (json['Metrics'] as List)
                .map((e) => MetricCollectionType.fromJson(e))
                .toList()
            : null,
        granularities: json.containsKey('Granularities')
            ? (json['Granularities'] as List)
                .map((e) => MetricGranularityType.fromJson(e))
                .toList()
            : null,
      );
}

class DescribeNotificationConfigurationsAnswer {
  /// The notification configurations.
  final List<NotificationConfiguration> notificationConfigurations;

  /// A string that indicates that the response contains more items than can be
  /// returned in a single response. To receive additional items, specify this
  /// string for the `NextToken` value when requesting the next set of items.
  /// This value is null when there are no more items to return.
  final String nextToken;

  DescribeNotificationConfigurationsAnswer({
    @required this.notificationConfigurations,
    this.nextToken,
  });
  static DescribeNotificationConfigurationsAnswer fromJson(
          Map<String, dynamic> json) =>
      DescribeNotificationConfigurationsAnswer(
        notificationConfigurations: (json['NotificationConfigurations'] as List)
            .map((e) => NotificationConfiguration.fromJson(e))
            .toList(),
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class DescribeTerminationPolicyTypesAnswer {
  /// The termination policies supported by Amazon EC2 Auto Scaling:
  /// `OldestInstance`, `OldestLaunchConfiguration`, `NewestInstance`,
  /// `ClosestToNextInstanceHour`, `Default`, `OldestLaunchTemplate`, and
  /// `AllocationStrategy`.
  final List<String> terminationPolicyTypes;

  DescribeTerminationPolicyTypesAnswer({
    this.terminationPolicyTypes,
  });
  static DescribeTerminationPolicyTypesAnswer fromJson(
          Map<String, dynamic> json) =>
      DescribeTerminationPolicyTypesAnswer(
        terminationPolicyTypes: json.containsKey('TerminationPolicyTypes')
            ? (json['TerminationPolicyTypes'] as List)
                .map((e) => e as String)
                .toList()
            : null,
      );
}

class DetachInstancesAnswer {
  /// The activities related to detaching the instances from the Auto Scaling
  /// group.
  final List<Activity> activities;

  DetachInstancesAnswer({
    this.activities,
  });
  static DetachInstancesAnswer fromJson(Map<String, dynamic> json) =>
      DetachInstancesAnswer(
        activities: json.containsKey('Activities')
            ? (json['Activities'] as List)
                .map((e) => Activity.fromJson(e))
                .toList()
            : null,
      );
}

class DetachLoadBalancerTargetGroupsResultType {
  DetachLoadBalancerTargetGroupsResultType();
  static DetachLoadBalancerTargetGroupsResultType fromJson(
          Map<String, dynamic> json) =>
      DetachLoadBalancerTargetGroupsResultType();
}

class DetachLoadBalancersResultType {
  DetachLoadBalancersResultType();
  static DetachLoadBalancersResultType fromJson(Map<String, dynamic> json) =>
      DetachLoadBalancersResultType();
}

/// Describes an Amazon EBS volume. Used in combination with BlockDeviceMapping.
class Ebs {
  /// The snapshot ID of the volume to use.
  ///
  /// Conditional: This parameter is optional if you specify a volume size. If
  /// you specify both `SnapshotId` and `VolumeSize`, `VolumeSize` must be equal
  /// or greater than the size of the snapshot.
  final String snapshotId;

  /// The volume size, in Gibibytes (GiB).
  ///
  /// This can be a number from 1-1,024 for `standard`, 4-16,384 for `io1`,
  /// 1-16,384 for `gp2`, and 500-16,384 for `st1` and `sc1`. If you specify a
  /// snapshot, the volume size must be equal to or larger than the snapshot
  /// size.
  ///
  /// Default: If you create a volume from a snapshot and you don't specify a
  /// volume size, the default is the snapshot size.
  ///
  ///
  ///
  /// At least one of VolumeSize or SnapshotId is required.
  final int volumeSize;

  /// The volume type, which can be `standard` for Magnetic, `io1` for
  /// Provisioned IOPS SSD, `gp2` for General Purpose SSD, `st1` for Throughput
  /// Optimized HDD, or `sc1` for Cold HDD. For more information, see
  /// [Amazon EBS Volume Types](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSVolumeTypes.html)
  /// in the _Amazon EC2 User Guide for Linux Instances_.
  ///
  /// Valid values: `standard` | `io1` | `gp2` | `st1` | `sc1`
  final String volumeType;

  /// Indicates whether the volume is deleted on instance termination. For
  /// Amazon EC2 Auto Scaling, the default value is `true`.
  final bool deleteOnTermination;

  /// The number of I/O operations per second (IOPS) to provision for the
  /// volume. The maximum ratio of IOPS to volume size (in GiB) is 50:1. For
  /// more information, see
  /// [Amazon EBS Volume Types](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSVolumeTypes.html)
  /// in the _Amazon EC2 User Guide for Linux Instances_.
  ///
  /// Conditional: This parameter is required when the volume type is `io1`.
  /// (Not used with `standard`, `gp2`, `st1`, or `sc1` volumes.)
  final int iops;

  /// Specifies whether the volume should be encrypted. Encrypted EBS volumes
  /// can only be attached to instances that support Amazon EBS encryption. For
  /// more information, see
  /// [Supported Instance Types](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html#EBSEncryption_supported_instances).
  /// If your AMI uses encrypted volumes, you can also only launch it on
  /// supported instance types.
  ///
  ///  If you are creating a volume from a snapshot, you cannot specify an
  /// encryption value. Volumes that are created from encrypted snapshots are
  /// automatically encrypted, and volumes that are created from unencrypted
  /// snapshots are automatically unencrypted. By default, encrypted snapshots
  /// use the AWS managed CMK that is used for EBS encryption, but you can
  /// specify a custom CMK when you create the snapshot. The ability to encrypt
  /// a snapshot during copying also allows you to apply a new CMK to an
  /// already-encrypted snapshot. Volumes restored from the resulting copy are
  /// only accessible using the new CMK.
  ///
  /// Enabling
  /// [encryption by default](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html#encryption-by-default)
  /// results in all EBS volumes being encrypted with the AWS managed CMK or a
  /// customer managed CMK, whether or not the snapshot was encrypted.
  ///
  /// For more information, see
  /// [Using Encryption with EBS-Backed AMIs](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AMIEncryption.html)
  /// in the _Amazon EC2 User Guide for Linux Instances_ and
  /// [Required CMK Key Policy for Use with Encrypted Volumes](https://docs.aws.amazon.com/autoscaling/ec2/userguide/key-policy-requirements-EBS-encryption.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  final bool encrypted;

  Ebs({
    this.snapshotId,
    this.volumeSize,
    this.volumeType,
    this.deleteOnTermination,
    this.iops,
    this.encrypted,
  });
  static Ebs fromJson(Map<String, dynamic> json) => Ebs(
        snapshotId: json.containsKey('SnapshotId')
            ? json['SnapshotId'] as String
            : null,
        volumeSize:
            json.containsKey('VolumeSize') ? json['VolumeSize'] as int : null,
        volumeType: json.containsKey('VolumeType')
            ? json['VolumeType'] as String
            : null,
        deleteOnTermination: json.containsKey('DeleteOnTermination')
            ? json['DeleteOnTermination'] as bool
            : null,
        iops: json.containsKey('Iops') ? json['Iops'] as int : null,
        encrypted:
            json.containsKey('Encrypted') ? json['Encrypted'] as bool : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes an enabled metric.
class EnabledMetric {
  /// One of the following metrics:
  ///
  /// *    `GroupMinSize`
  ///
  /// *    `GroupMaxSize`
  ///
  /// *    `GroupDesiredCapacity`
  ///
  /// *    `GroupInServiceInstances`
  ///
  /// *    `GroupPendingInstances`
  ///
  /// *    `GroupStandbyInstances`
  ///
  /// *    `GroupTerminatingInstances`
  ///
  /// *    `GroupTotalInstances`
  final String metric;

  /// The granularity of the metric. The only valid value is `1Minute`.
  final String granularity;

  EnabledMetric({
    this.metric,
    this.granularity,
  });
  static EnabledMetric fromJson(Map<String, dynamic> json) => EnabledMetric(
        metric: json.containsKey('Metric') ? json['Metric'] as String : null,
        granularity: json.containsKey('Granularity')
            ? json['Granularity'] as String
            : null,
      );
}

class EnterStandbyAnswer {
  /// The activities related to moving instances into `Standby` mode.
  final List<Activity> activities;

  EnterStandbyAnswer({
    this.activities,
  });
  static EnterStandbyAnswer fromJson(Map<String, dynamic> json) =>
      EnterStandbyAnswer(
        activities: json.containsKey('Activities')
            ? (json['Activities'] as List)
                .map((e) => Activity.fromJson(e))
                .toList()
            : null,
      );
}

class ExitStandbyAnswer {
  /// The activities related to moving instances out of `Standby` mode.
  final List<Activity> activities;

  ExitStandbyAnswer({
    this.activities,
  });
  static ExitStandbyAnswer fromJson(Map<String, dynamic> json) =>
      ExitStandbyAnswer(
        activities: json.containsKey('Activities')
            ? (json['Activities'] as List)
                .map((e) => Activity.fromJson(e))
                .toList()
            : null,
      );
}

/// Describes a scheduled action that could not be created, updated, or deleted.
class FailedScheduledUpdateGroupActionRequest {
  /// The name of the scheduled action.
  final String scheduledActionName;

  /// The error code.
  final String errorCode;

  /// The error message accompanying the error code.
  final String errorMessage;

  FailedScheduledUpdateGroupActionRequest({
    @required this.scheduledActionName,
    this.errorCode,
    this.errorMessage,
  });
  static FailedScheduledUpdateGroupActionRequest fromJson(
          Map<String, dynamic> json) =>
      FailedScheduledUpdateGroupActionRequest(
        scheduledActionName: json['ScheduledActionName'] as String,
        errorCode:
            json.containsKey('ErrorCode') ? json['ErrorCode'] as String : null,
        errorMessage: json.containsKey('ErrorMessage')
            ? json['ErrorMessage'] as String
            : null,
      );
}

/// Describes a filter.
class Filter {
  /// The name of the filter. The valid values are: `"auto-scaling-group"`,
  /// `"key"`, `"value"`, and `"propagate-at-launch"`.
  final String name;

  /// The value of the filter.
  final List<String> values;

  Filter({
    this.name,
    this.values,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes an EC2 instance.
class Instance {
  /// The ID of the instance.
  final String instanceId;

  /// The Availability Zone in which the instance is running.
  final String availabilityZone;

  /// A description of the current lifecycle state. The `Quarantined` state is
  /// not used.
  final String lifecycleState;

  /// The last reported health status of the instance. "Healthy" means that the
  /// instance is healthy and should remain in service. "Unhealthy" means that
  /// the instance is unhealthy and that Amazon EC2 Auto Scaling should
  /// terminate and replace it.
  final String healthStatus;

  /// The launch configuration associated with the instance.
  final String launchConfigurationName;

  /// The launch template for the instance.
  final LaunchTemplateSpecification launchTemplate;

  /// Indicates whether the instance is protected from termination by Amazon EC2
  /// Auto Scaling when scaling in.
  final bool protectedFromScaleIn;

  Instance({
    @required this.instanceId,
    @required this.availabilityZone,
    @required this.lifecycleState,
    @required this.healthStatus,
    this.launchConfigurationName,
    this.launchTemplate,
    @required this.protectedFromScaleIn,
  });
  static Instance fromJson(Map<String, dynamic> json) => Instance(
        instanceId: json['InstanceId'] as String,
        availabilityZone: json['AvailabilityZone'] as String,
        lifecycleState: json['LifecycleState'] as String,
        healthStatus: json['HealthStatus'] as String,
        launchConfigurationName: json.containsKey('LaunchConfigurationName')
            ? json['LaunchConfigurationName'] as String
            : null,
        launchTemplate: json.containsKey('LaunchTemplate')
            ? LaunchTemplateSpecification.fromJson(json['LaunchTemplate'])
            : null,
        protectedFromScaleIn: json['ProtectedFromScaleIn'] as bool,
      );
}

/// Describes whether detailed monitoring is enabled for the Auto Scaling
/// instances.
class InstanceMonitoring {
  /// If `true`, detailed monitoring is enabled. Otherwise, basic monitoring is
  /// enabled.
  final bool enabled;

  InstanceMonitoring({
    this.enabled,
  });
  static InstanceMonitoring fromJson(Map<String, dynamic> json) =>
      InstanceMonitoring(
        enabled: json.containsKey('Enabled') ? json['Enabled'] as bool : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes an instances distribution for an Auto Scaling group with
/// MixedInstancesPolicy.
///
/// The instances distribution specifies the distribution of On-Demand Instances
/// and Spot Instances, the maximum price to pay for Spot Instances, and how the
/// Auto Scaling group allocates instance types to fulfill On-Demand and Spot
/// capacity.
class InstancesDistribution {
  /// Indicates how to allocate instance types to fulfill On-Demand capacity.
  ///
  /// The only valid value is `prioritized`, which is also the default value.
  /// This strategy uses the order of instance type overrides for the
  /// LaunchTemplate to define the launch priority of each instance type. The
  /// first instance type in the array is prioritized higher than the last. If
  /// all your On-Demand capacity cannot be fulfilled using your highest
  /// priority instance, then the Auto Scaling groups launches the remaining
  /// capacity using the second priority instance type, and so on.
  final String onDemandAllocationStrategy;

  /// The minimum amount of the Auto Scaling group's capacity that must be
  /// fulfilled by On-Demand Instances. This base portion is provisioned first
  /// as your group scales.
  ///
  /// The default value is `0`. If you leave this parameter set to `0`,
  /// On-Demand Instances are launched as a percentage of the Auto Scaling
  /// group's desired capacity, per the `OnDemandPercentageAboveBaseCapacity`
  /// setting.
  final int onDemandBaseCapacity;

  /// Controls the percentages of On-Demand Instances and Spot Instances for
  /// your additional capacity beyond `OnDemandBaseCapacity`. The range is
  /// 0–100.
  ///
  /// The default value is `100`. If you leave this parameter set to `100`, the
  /// percentages are 100% for On-Demand Instances and 0% for Spot Instances.
  final int onDemandPercentageAboveBaseCapacity;

  /// Indicates how to allocate instances across Spot Instance pools.
  ///
  /// If the allocation strategy is `lowest-price`, the Auto Scaling group
  /// launches instances using the Spot pools with the lowest price, and evenly
  /// allocates your instances across the number of Spot pools that you specify.
  /// If the allocation strategy is `capacity-optimized`, the Auto Scaling group
  /// launches instances using Spot pools that are optimally chosen based on the
  /// available Spot capacity.
  ///
  /// The default Spot allocation strategy for calls that you make through the
  /// API, the AWS CLI, or the AWS SDKs is `lowest-price`. The default Spot
  /// allocation strategy for the AWS Management Console is
  /// `capacity-optimized`.
  ///
  /// Valid values: `lowest-price` | `capacity-optimized`
  final String spotAllocationStrategy;

  /// The number of Spot Instance pools across which to allocate your Spot
  /// Instances. The Spot pools are determined from the different instance types
  /// in the Overrides array of LaunchTemplate. The range is 1–20. The default
  /// value is `2`.
  ///
  /// Valid only when the Spot allocation strategy is `lowest-price`.
  final int spotInstancePools;

  /// The maximum price per unit hour that you are willing to pay for a Spot
  /// Instance. If you leave the value of this parameter blank (which is the
  /// default), the maximum Spot price is set at the On-Demand price.
  ///
  /// To remove a value that you previously set, include the parameter but leave
  /// the value blank.
  final String spotMaxPrice;

  InstancesDistribution({
    this.onDemandAllocationStrategy,
    this.onDemandBaseCapacity,
    this.onDemandPercentageAboveBaseCapacity,
    this.spotAllocationStrategy,
    this.spotInstancePools,
    this.spotMaxPrice,
  });
  static InstancesDistribution fromJson(Map<String, dynamic> json) =>
      InstancesDistribution(
        onDemandAllocationStrategy:
            json.containsKey('OnDemandAllocationStrategy')
                ? json['OnDemandAllocationStrategy'] as String
                : null,
        onDemandBaseCapacity: json.containsKey('OnDemandBaseCapacity')
            ? json['OnDemandBaseCapacity'] as int
            : null,
        onDemandPercentageAboveBaseCapacity:
            json.containsKey('OnDemandPercentageAboveBaseCapacity')
                ? json['OnDemandPercentageAboveBaseCapacity'] as int
                : null,
        spotAllocationStrategy: json.containsKey('SpotAllocationStrategy')
            ? json['SpotAllocationStrategy'] as String
            : null,
        spotInstancePools: json.containsKey('SpotInstancePools')
            ? json['SpotInstancePools'] as int
            : null,
        spotMaxPrice: json.containsKey('SpotMaxPrice')
            ? json['SpotMaxPrice'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes a launch configuration.
class LaunchConfiguration {
  /// The name of the launch configuration.
  final String launchConfigurationName;

  /// The Amazon Resource Name (ARN) of the launch configuration.
  final String launchConfigurationArn;

  /// The ID of the Amazon Machine Image (AMI) to use to launch your EC2
  /// instances.
  ///
  /// For more information, see
  /// [Finding an AMI](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/finding-an-ami.html)
  /// in the _Amazon EC2 User Guide for Linux Instances_.
  final String imageId;

  /// The name of the key pair.
  ///
  /// For more information, see
  /// [Amazon EC2 Key Pairs](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html)
  /// in the _Amazon EC2 User Guide for Linux Instances_.
  final String keyName;

  /// A list that contains the security groups to assign to the instances in the
  /// Auto Scaling group.
  ///
  /// For more information, see
  /// [Security Groups for Your VPC](https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_SecurityGroups.html)
  /// in the _Amazon Virtual Private Cloud User Guide_.
  final List<String> securityGroups;

  /// The ID of a ClassicLink-enabled VPC to link your EC2-Classic instances to.
  ///
  /// For more information, see
  /// [ClassicLink](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/vpc-classiclink.html)
  /// in the _Amazon EC2 User Guide for Linux Instances_ and
  /// [Linking EC2-Classic Instances to a VPC](https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-in-vpc.html#as-ClassicLink)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  final String classicLinkVpcId;

  /// The IDs of one or more security groups for the VPC specified in
  /// `ClassicLinkVPCId`.
  ///
  /// For more information, see
  /// [ClassicLink](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/vpc-classiclink.html)
  /// in the _Amazon EC2 User Guide for Linux Instances_ and
  /// [Linking EC2-Classic Instances to a VPC](https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-in-vpc.html#as-ClassicLink)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  final List<String> classicLinkVpcSecurityGroups;

  /// The Base64-encoded user data to make available to the launched EC2
  /// instances.
  ///
  /// For more information, see
  /// [Instance Metadata and User Data](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-metadata.html)
  /// in the _Amazon EC2 User Guide for Linux Instances_.
  final String userData;

  /// The instance type for the instances.
  ///
  /// For information about available instance types, see
  /// [Available Instance Types](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html#AvailableInstanceTypes)
  /// in the _Amazon EC2 User Guide for Linux Instances._
  final String instanceType;

  /// The ID of the kernel associated with the AMI.
  final String kernelId;

  /// The ID of the RAM disk associated with the AMI.
  final String ramdiskId;

  /// A block device mapping, which specifies the block devices for the
  /// instance.
  ///
  /// For more information, see
  /// [Block Device Mapping](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/block-device-mapping-concepts.html)
  /// in the _Amazon EC2 User Guide for Linux Instances_.
  final List<BlockDeviceMapping> blockDeviceMappings;

  /// Controls whether instances in this group are launched with detailed
  /// (`true`) or basic (`false`) monitoring.
  ///
  /// For more information, see
  /// [Configure Monitoring for Auto Scaling Instances](https://docs.aws.amazon.com/autoscaling/latest/userguide/as-instance-monitoring.html#enable-as-instance-metrics)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  final InstanceMonitoring instanceMonitoring;

  /// The maximum hourly price to be paid for any Spot Instance launched to
  /// fulfill the request. Spot Instances are launched when the price you
  /// specify exceeds the current Spot market price.
  ///
  /// For more information, see
  /// [Launching Spot Instances in Your Auto Scaling Group](https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-launch-spot-instances.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  final String spotPrice;

  /// The name or the Amazon Resource Name (ARN) of the instance profile
  /// associated with the IAM role for the instance. The instance profile
  /// contains the IAM role.
  ///
  /// For more information, see
  /// [IAM Role for Applications That Run on Amazon EC2 Instances](https://docs.aws.amazon.com/autoscaling/ec2/userguide/us-iam-role.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  final String iamInstanceProfile;

  /// The creation date and time for the launch configuration.
  final DateTime createdTime;

  /// Specifies whether the launch configuration is optimized for EBS I/O
  /// (`true`) or not (`false`).
  ///
  /// For more information, see
  /// [Amazon EBS-Optimized Instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSOptimized.html)
  /// in the _Amazon EC2 User Guide for Linux Instances_.
  final bool ebsOptimized;

  /// For Auto Scaling groups that are running in a VPC, specifies whether to
  /// assign a public IP address to the group's instances.
  ///
  /// For more information, see
  /// [Launching Auto Scaling Instances in a VPC](https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-in-vpc.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  final bool associatePublicIpAddress;

  /// The tenancy of the instance, either `default` or `dedicated`. An instance
  /// with `dedicated` tenancy runs on isolated, single-tenant hardware and can
  /// only be launched into a VPC.
  ///
  /// For more information, see
  /// [Instance Placement Tenancy](https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-in-vpc.html#as-vpc-tenancy)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  final String placementTenancy;

  LaunchConfiguration({
    @required this.launchConfigurationName,
    this.launchConfigurationArn,
    @required this.imageId,
    this.keyName,
    this.securityGroups,
    this.classicLinkVpcId,
    this.classicLinkVpcSecurityGroups,
    this.userData,
    @required this.instanceType,
    this.kernelId,
    this.ramdiskId,
    this.blockDeviceMappings,
    this.instanceMonitoring,
    this.spotPrice,
    this.iamInstanceProfile,
    @required this.createdTime,
    this.ebsOptimized,
    this.associatePublicIpAddress,
    this.placementTenancy,
  });
  static LaunchConfiguration fromJson(Map<String, dynamic> json) =>
      LaunchConfiguration(
        launchConfigurationName: json['LaunchConfigurationName'] as String,
        launchConfigurationArn: json.containsKey('LaunchConfigurationARN')
            ? json['LaunchConfigurationARN'] as String
            : null,
        imageId: json['ImageId'] as String,
        keyName: json.containsKey('KeyName') ? json['KeyName'] as String : null,
        securityGroups: json.containsKey('SecurityGroups')
            ? (json['SecurityGroups'] as List).map((e) => e as String).toList()
            : null,
        classicLinkVpcId: json.containsKey('ClassicLinkVPCId')
            ? json['ClassicLinkVPCId'] as String
            : null,
        classicLinkVpcSecurityGroups:
            json.containsKey('ClassicLinkVPCSecurityGroups')
                ? (json['ClassicLinkVPCSecurityGroups'] as List)
                    .map((e) => e as String)
                    .toList()
                : null,
        userData:
            json.containsKey('UserData') ? json['UserData'] as String : null,
        instanceType: json['InstanceType'] as String,
        kernelId:
            json.containsKey('KernelId') ? json['KernelId'] as String : null,
        ramdiskId:
            json.containsKey('RamdiskId') ? json['RamdiskId'] as String : null,
        blockDeviceMappings: json.containsKey('BlockDeviceMappings')
            ? (json['BlockDeviceMappings'] as List)
                .map((e) => BlockDeviceMapping.fromJson(e))
                .toList()
            : null,
        instanceMonitoring: json.containsKey('InstanceMonitoring')
            ? InstanceMonitoring.fromJson(json['InstanceMonitoring'])
            : null,
        spotPrice:
            json.containsKey('SpotPrice') ? json['SpotPrice'] as String : null,
        iamInstanceProfile: json.containsKey('IamInstanceProfile')
            ? json['IamInstanceProfile'] as String
            : null,
        createdTime: DateTime.parse(json['CreatedTime']),
        ebsOptimized: json.containsKey('EbsOptimized')
            ? json['EbsOptimized'] as bool
            : null,
        associatePublicIpAddress: json.containsKey('AssociatePublicIpAddress')
            ? json['AssociatePublicIpAddress'] as bool
            : null,
        placementTenancy: json.containsKey('PlacementTenancy')
            ? json['PlacementTenancy'] as String
            : null,
      );
}

class LaunchConfigurationsType {
  /// The launch configurations.
  final List<LaunchConfiguration> launchConfigurations;

  /// A string that indicates that the response contains more items than can be
  /// returned in a single response. To receive additional items, specify this
  /// string for the `NextToken` value when requesting the next set of items.
  /// This value is null when there are no more items to return.
  final String nextToken;

  LaunchConfigurationsType({
    @required this.launchConfigurations,
    this.nextToken,
  });
  static LaunchConfigurationsType fromJson(Map<String, dynamic> json) =>
      LaunchConfigurationsType(
        launchConfigurations: (json['LaunchConfigurations'] as List)
            .map((e) => LaunchConfiguration.fromJson(e))
            .toList(),
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// Describes a launch template and overrides.
///
/// The overrides are used to override the instance type specified by the launch
/// template with multiple instance types that can be used to launch On-Demand
/// Instances and Spot Instances.
class LaunchTemplate {
  /// The launch template to use. You must specify either the launch template ID
  /// or launch template name in the request.
  final LaunchTemplateSpecification launchTemplateSpecification;

  /// Any parameters that you specify override the same parameters in the launch
  /// template. Currently, the only supported override is instance type. You
  /// must specify between 2 and 20 overrides.
  final List<LaunchTemplateOverrides> overrides;

  LaunchTemplate({
    this.launchTemplateSpecification,
    this.overrides,
  });
  static LaunchTemplate fromJson(Map<String, dynamic> json) => LaunchTemplate(
        launchTemplateSpecification:
            json.containsKey('LaunchTemplateSpecification')
                ? LaunchTemplateSpecification.fromJson(
                    json['LaunchTemplateSpecification'])
                : null,
        overrides: json.containsKey('Overrides')
            ? (json['Overrides'] as List)
                .map((e) => LaunchTemplateOverrides.fromJson(e))
                .toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes an override for a launch template.
class LaunchTemplateOverrides {
  /// The instance type.
  ///
  /// For information about available instance types, see
  /// [Available Instance Types](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html#AvailableInstanceTypes)
  /// in the _Amazon Elastic Compute Cloud User Guide._
  final String instanceType;

  LaunchTemplateOverrides({
    this.instanceType,
  });
  static LaunchTemplateOverrides fromJson(Map<String, dynamic> json) =>
      LaunchTemplateOverrides(
        instanceType: json.containsKey('InstanceType')
            ? json['InstanceType'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes a launch template and the launch template version.
///
/// The launch template that is specified must be configured for use with an
/// Auto Scaling group. For more information, see
/// [Creating a Launch Template for an Auto Scaling Group](https://docs.aws.amazon.com/autoscaling/ec2/userguide/create-launch-template.html)
/// in the _Amazon EC2 Auto Scaling User Guide_.
class LaunchTemplateSpecification {
  /// The ID of the launch template. You must specify either a template ID or a
  /// template name.
  final String launchTemplateId;

  /// The name of the launch template. You must specify either a template name
  /// or a template ID.
  final String launchTemplateName;

  /// The version number, `$Latest`, or `$Default`. If the value is `$Latest`,
  /// Amazon EC2 Auto Scaling selects the latest version of the launch template
  /// when launching instances. If the value is `$Default`, Amazon EC2 Auto
  /// Scaling selects the default version of the launch template when launching
  /// instances. The default value is `$Default`.
  final String version;

  LaunchTemplateSpecification({
    this.launchTemplateId,
    this.launchTemplateName,
    this.version,
  });
  static LaunchTemplateSpecification fromJson(Map<String, dynamic> json) =>
      LaunchTemplateSpecification(
        launchTemplateId: json.containsKey('LaunchTemplateId')
            ? json['LaunchTemplateId'] as String
            : null,
        launchTemplateName: json.containsKey('LaunchTemplateName')
            ? json['LaunchTemplateName'] as String
            : null,
        version: json.containsKey('Version') ? json['Version'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes a lifecycle hook, which tells Amazon EC2 Auto Scaling that you
/// want to perform an action whenever it launches instances or terminates
/// instances. Used in response to DescribeLifecycleHooks.
class LifecycleHook {
  /// The name of the lifecycle hook.
  final String lifecycleHookName;

  /// The name of the Auto Scaling group for the lifecycle hook.
  final String autoScalingGroupName;

  /// The state of the EC2 instance to which to attach the lifecycle hook. The
  /// following are possible values:
  ///
  /// *   autoscaling:EC2_INSTANCE_LAUNCHING
  ///
  /// *   autoscaling:EC2_INSTANCE_TERMINATING
  final String lifecycleTransition;

  /// The ARN of the target that Amazon EC2 Auto Scaling sends notifications to
  /// when an instance is in the transition state for the lifecycle hook. The
  /// notification target can be either an SQS queue or an SNS topic.
  final String notificationTargetArn;

  /// The ARN of the IAM role that allows the Auto Scaling group to publish to
  /// the specified notification target.
  final String roleArn;

  /// Additional information that is included any time Amazon EC2 Auto Scaling
  /// sends a message to the notification target.
  final String notificationMetadata;

  /// The maximum time, in seconds, that can elapse before the lifecycle hook
  /// times out. If the lifecycle hook times out, Amazon EC2 Auto Scaling
  /// performs the action that you specified in the `DefaultResult` parameter.
  final int heartbeatTimeout;

  /// The maximum time, in seconds, that an instance can remain in a
  /// `Pending:Wait` or `Terminating:Wait` state. The maximum is 172800 seconds
  /// (48 hours) or 100 times `HeartbeatTimeout`, whichever is smaller.
  final int globalTimeout;

  /// Defines the action the Auto Scaling group should take when the lifecycle
  /// hook timeout elapses or if an unexpected failure occurs. The possible
  /// values are `CONTINUE` and `ABANDON`.
  final String defaultResult;

  LifecycleHook({
    this.lifecycleHookName,
    this.autoScalingGroupName,
    this.lifecycleTransition,
    this.notificationTargetArn,
    this.roleArn,
    this.notificationMetadata,
    this.heartbeatTimeout,
    this.globalTimeout,
    this.defaultResult,
  });
  static LifecycleHook fromJson(Map<String, dynamic> json) => LifecycleHook(
        lifecycleHookName: json.containsKey('LifecycleHookName')
            ? json['LifecycleHookName'] as String
            : null,
        autoScalingGroupName: json.containsKey('AutoScalingGroupName')
            ? json['AutoScalingGroupName'] as String
            : null,
        lifecycleTransition: json.containsKey('LifecycleTransition')
            ? json['LifecycleTransition'] as String
            : null,
        notificationTargetArn: json.containsKey('NotificationTargetARN')
            ? json['NotificationTargetARN'] as String
            : null,
        roleArn: json.containsKey('RoleARN') ? json['RoleARN'] as String : null,
        notificationMetadata: json.containsKey('NotificationMetadata')
            ? json['NotificationMetadata'] as String
            : null,
        heartbeatTimeout: json.containsKey('HeartbeatTimeout')
            ? json['HeartbeatTimeout'] as int
            : null,
        globalTimeout: json.containsKey('GlobalTimeout')
            ? json['GlobalTimeout'] as int
            : null,
        defaultResult: json.containsKey('DefaultResult')
            ? json['DefaultResult'] as String
            : null,
      );
}

/// Describes a lifecycle hook. Used in combination with CreateAutoScalingGroup.
///
/// A lifecycle hook tells Amazon EC2 Auto Scaling to perform an action on an
/// instance when the instance launches (before it is put into service) or as
/// the instance terminates (before it is fully terminated).
///
/// This step is a part of the procedure for creating a lifecycle hook for an
/// Auto Scaling group:
///
/// 1.  (Optional) Create a Lambda function and a rule that allows CloudWatch
/// Events to invoke your Lambda function when Amazon EC2 Auto Scaling launches
/// or terminates instances.
///
/// 2.  (Optional) Create a notification target and an IAM role. The target can
/// be either an Amazon SQS queue or an Amazon SNS topic. The role allows Amazon
/// EC2 Auto Scaling to publish lifecycle notifications to the target.
///
/// 3.   **Create the lifecycle hook. Specify whether the hook is used when the
/// instances launch or terminate.**
///
/// 4.  If you need more time, record the lifecycle action heartbeat to keep the
/// instance in a pending state using RecordLifecycleActionHeartbeat.
///
/// 5.  If you finish before the timeout period ends, complete the lifecycle
/// action using CompleteLifecycleAction.
///
///
/// For more information, see
/// [Amazon EC2 Auto Scaling Lifecycle Hooks](https://docs.aws.amazon.com/autoscaling/ec2/userguide/lifecycle-hooks.html)
/// in the _Amazon EC2 Auto Scaling User Guide_.
///
/// You can view the lifecycle hooks for an Auto Scaling group using
/// DescribeLifecycleHooks. You can modify an existing lifecycle hook or create
/// new lifecycle hooks using PutLifecycleHook. If you are no longer using a
/// lifecycle hook, you can delete it using DeleteLifecycleHook.
class LifecycleHookSpecification {
  /// The name of the lifecycle hook.
  final String lifecycleHookName;

  /// The state of the EC2 instance to which you want to attach the lifecycle
  /// hook. The valid values are:
  ///
  /// *   autoscaling:EC2_INSTANCE_LAUNCHING
  ///
  /// *   autoscaling:EC2_INSTANCE_TERMINATING
  final String lifecycleTransition;

  /// Additional information that you want to include any time Amazon EC2 Auto
  /// Scaling sends a message to the notification target.
  final String notificationMetadata;

  /// The maximum time, in seconds, that can elapse before the lifecycle hook
  /// times out.
  ///
  /// If the lifecycle hook times out, Amazon EC2 Auto Scaling performs the
  /// action that you specified in the `DefaultResult` parameter. You can
  /// prevent the lifecycle hook from timing out by calling
  /// RecordLifecycleActionHeartbeat.
  final int heartbeatTimeout;

  /// Defines the action the Auto Scaling group should take when the lifecycle
  /// hook timeout elapses or if an unexpected failure occurs. The valid values
  /// are `CONTINUE` and `ABANDON`. The default value is `ABANDON`.
  final String defaultResult;

  /// The ARN of the target that Amazon EC2 Auto Scaling sends notifications to
  /// when an instance is in the transition state for the lifecycle hook. The
  /// notification target can be either an SQS queue or an SNS topic.
  final String notificationTargetArn;

  /// The ARN of the IAM role that allows the Auto Scaling group to publish to
  /// the specified notification target, for example, an Amazon SNS topic or an
  /// Amazon SQS queue.
  final String roleArn;

  LifecycleHookSpecification({
    @required this.lifecycleHookName,
    @required this.lifecycleTransition,
    this.notificationMetadata,
    this.heartbeatTimeout,
    this.defaultResult,
    this.notificationTargetArn,
    this.roleArn,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes the state of a Classic Load Balancer.
///
/// If you specify a load balancer when creating the Auto Scaling group, the
/// state of the load balancer is `InService`.
///
/// If you attach a load balancer to an existing Auto Scaling group, the initial
/// state is `Adding`. The state transitions to `Added` after all instances in
/// the group are registered with the load balancer. If Elastic Load Balancing
/// health checks are enabled for the load balancer, the state transitions to
/// `InService` after at least one instance in the group passes the health
/// check. If EC2 health checks are enabled instead, the load balancer remains
/// in the `Added` state.
class LoadBalancerState {
  /// The name of the load balancer.
  final String loadBalancerName;

  /// One of the following load balancer states:
  ///
  /// *    `Adding` - The instances in the group are being registered with the
  /// load balancer.
  ///
  /// *    `Added` - All instances in the group are registered with the load
  /// balancer.
  ///
  /// *    `InService` - At least one instance in the group passed an ELB health
  /// check.
  ///
  /// *    `Removing` - The instances in the group are being deregistered from
  /// the load balancer. If connection draining is enabled, Elastic Load
  /// Balancing waits for in-flight requests to complete before deregistering
  /// the instances.
  ///
  /// *    `Removed` - All instances in the group are deregistered from the load
  /// balancer.
  final String state;

  LoadBalancerState({
    this.loadBalancerName,
    this.state,
  });
  static LoadBalancerState fromJson(Map<String, dynamic> json) =>
      LoadBalancerState(
        loadBalancerName: json.containsKey('LoadBalancerName')
            ? json['LoadBalancerName'] as String
            : null,
        state: json.containsKey('State') ? json['State'] as String : null,
      );
}

/// Describes the state of a target group.
///
/// If you attach a target group to an existing Auto Scaling group, the initial
/// state is `Adding`. The state transitions to `Added` after all Auto Scaling
/// instances are registered with the target group. If Elastic Load Balancing
/// health checks are enabled, the state transitions to `InService` after at
/// least one Auto Scaling instance passes the health check. If EC2 health
/// checks are enabled instead, the target group remains in the `Added` state.
class LoadBalancerTargetGroupState {
  /// The Amazon Resource Name (ARN) of the target group.
  final String loadBalancerTargetGroupArn;

  /// The state of the target group.
  ///
  /// *    `Adding` - The Auto Scaling instances are being registered with the
  /// target group.
  ///
  /// *    `Added` - All Auto Scaling instances are registered with the target
  /// group.
  ///
  /// *    `InService` - At least one Auto Scaling instance passed an ELB health
  /// check.
  ///
  /// *    `Removing` - The Auto Scaling instances are being deregistered from
  /// the target group. If connection draining is enabled, Elastic Load
  /// Balancing waits for in-flight requests to complete before deregistering
  /// the instances.
  ///
  /// *    `Removed` - All Auto Scaling instances are deregistered from the
  /// target group.
  final String state;

  LoadBalancerTargetGroupState({
    this.loadBalancerTargetGroupArn,
    this.state,
  });
  static LoadBalancerTargetGroupState fromJson(Map<String, dynamic> json) =>
      LoadBalancerTargetGroupState(
        loadBalancerTargetGroupArn:
            json.containsKey('LoadBalancerTargetGroupARN')
                ? json['LoadBalancerTargetGroupARN'] as String
                : null,
        state: json.containsKey('State') ? json['State'] as String : null,
      );
}

/// Describes a metric.
class MetricCollectionType {
  /// One of the following metrics:
  ///
  /// *    `GroupMinSize`
  ///
  /// *    `GroupMaxSize`
  ///
  /// *    `GroupDesiredCapacity`
  ///
  /// *    `GroupInServiceInstances`
  ///
  /// *    `GroupPendingInstances`
  ///
  /// *    `GroupStandbyInstances`
  ///
  /// *    `GroupTerminatingInstances`
  ///
  /// *    `GroupTotalInstances`
  final String metric;

  MetricCollectionType({
    this.metric,
  });
  static MetricCollectionType fromJson(Map<String, dynamic> json) =>
      MetricCollectionType(
        metric: json.containsKey('Metric') ? json['Metric'] as String : null,
      );
}

/// Describes the dimension of a metric.
class MetricDimension {
  /// The name of the dimension.
  final String name;

  /// The value of the dimension.
  final String value;

  MetricDimension({
    @required this.name,
    @required this.value,
  });
  static MetricDimension fromJson(Map<String, dynamic> json) => MetricDimension(
        name: json['Name'] as String,
        value: json['Value'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes a granularity of a metric.
class MetricGranularityType {
  /// The granularity. The only valid value is `1Minute`.
  final String granularity;

  MetricGranularityType({
    this.granularity,
  });
  static MetricGranularityType fromJson(Map<String, dynamic> json) =>
      MetricGranularityType(
        granularity: json.containsKey('Granularity')
            ? json['Granularity'] as String
            : null,
      );
}

/// Describes a mixed instances policy for an Auto Scaling group. With mixed
/// instances, your Auto Scaling group can provision a combination of On-Demand
/// Instances and Spot Instances across multiple instance types. For more
/// information, see
/// [Auto Scaling Groups with Multiple Instance Types and Purchase Options](https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-purchase-options.html)
/// in the _Amazon EC2 Auto Scaling User Guide_.
///
/// You can create a mixed instances policy for a new Auto Scaling group, or you
/// can create it for an existing group by updating the group to specify
/// `MixedInstancesPolicy` as the top-level parameter instead of a launch
/// configuration or template. For more information, see CreateAutoScalingGroup
/// and UpdateAutoScalingGroup.
class MixedInstancesPolicy {
  /// The launch template and instance types (overrides).
  ///
  /// This parameter must be specified when creating a mixed instances policy.
  final LaunchTemplate launchTemplate;

  /// The instances distribution to use.
  ///
  /// If you leave this parameter unspecified when creating a mixed instances
  /// policy, the default values are used.
  final InstancesDistribution instancesDistribution;

  MixedInstancesPolicy({
    this.launchTemplate,
    this.instancesDistribution,
  });
  static MixedInstancesPolicy fromJson(Map<String, dynamic> json) =>
      MixedInstancesPolicy(
        launchTemplate: json.containsKey('LaunchTemplate')
            ? LaunchTemplate.fromJson(json['LaunchTemplate'])
            : null,
        instancesDistribution: json.containsKey('InstancesDistribution')
            ? InstancesDistribution.fromJson(json['InstancesDistribution'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes a notification.
class NotificationConfiguration {
  /// The name of the Auto Scaling group.
  final String autoScalingGroupName;

  /// The Amazon Resource Name (ARN) of the Amazon Simple Notification Service
  /// (Amazon SNS) topic.
  final String topicArn;

  /// One of the following event notification types:
  ///
  /// *    `autoscaling:EC2_INSTANCE_LAUNCH`
  ///
  /// *    `autoscaling:EC2_INSTANCE_LAUNCH_ERROR`
  ///
  /// *    `autoscaling:EC2_INSTANCE_TERMINATE`
  ///
  /// *    `autoscaling:EC2_INSTANCE_TERMINATE_ERROR`
  ///
  /// *    `autoscaling:TEST_NOTIFICATION`
  final String notificationType;

  NotificationConfiguration({
    this.autoScalingGroupName,
    this.topicArn,
    this.notificationType,
  });
  static NotificationConfiguration fromJson(Map<String, dynamic> json) =>
      NotificationConfiguration(
        autoScalingGroupName: json.containsKey('AutoScalingGroupName')
            ? json['AutoScalingGroupName'] as String
            : null,
        topicArn:
            json.containsKey('TopicARN') ? json['TopicARN'] as String : null,
        notificationType: json.containsKey('NotificationType')
            ? json['NotificationType'] as String
            : null,
      );
}

class PoliciesType {
  /// The scaling policies.
  final List<ScalingPolicy> scalingPolicies;

  /// A string that indicates that the response contains more items than can be
  /// returned in a single response. To receive additional items, specify this
  /// string for the `NextToken` value when requesting the next set of items.
  /// This value is null when there are no more items to return.
  final String nextToken;

  PoliciesType({
    this.scalingPolicies,
    this.nextToken,
  });
  static PoliciesType fromJson(Map<String, dynamic> json) => PoliciesType(
        scalingPolicies: json.containsKey('ScalingPolicies')
            ? (json['ScalingPolicies'] as List)
                .map((e) => ScalingPolicy.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// Contains the output of PutScalingPolicy.
class PolicyArnType {
  /// The Amazon Resource Name (ARN) of the policy.
  final String policyArn;

  /// The CloudWatch alarms created for the target tracking scaling policy.
  final List<Alarm> alarms;

  PolicyArnType({
    this.policyArn,
    this.alarms,
  });
  static PolicyArnType fromJson(Map<String, dynamic> json) => PolicyArnType(
        policyArn:
            json.containsKey('PolicyARN') ? json['PolicyARN'] as String : null,
        alarms: json.containsKey('Alarms')
            ? (json['Alarms'] as List).map((e) => Alarm.fromJson(e)).toList()
            : null,
      );
}

/// Represents a predefined metric for a target tracking scaling policy to use
/// with Amazon EC2 Auto Scaling.
class PredefinedMetricSpecification {
  /// The metric type.
  final String predefinedMetricType;

  /// Identifies the resource associated with the metric type. The following
  /// predefined metrics are available:
  ///
  /// *    `ASGAverageCPUUtilization` - Average CPU utilization of the Auto
  /// Scaling group.
  ///
  /// *    `ASGAverageNetworkIn` - Average number of bytes received on all
  /// network interfaces by the Auto Scaling group.
  ///
  /// *    `ASGAverageNetworkOut` - Average number of bytes sent out on all
  /// network interfaces by the Auto Scaling group.
  ///
  /// *    `ALBRequestCountPerTarget` - Number of requests completed per target
  /// in an Application Load Balancer target group.
  ///
  ///
  /// For predefined metric types `ASGAverageCPUUtilization`,
  /// `ASGAverageNetworkIn`, and `ASGAverageNetworkOut`, the parameter must not
  /// be specified as the resource associated with the metric type is the Auto
  /// Scaling group. For predefined metric type `ALBRequestCountPerTarget`, the
  /// parameter must be specified in the format:
  /// `app/_load-balancer-name_/_load-balancer-id_/targetgroup/_target-group-name_/_target-group-id_`
  /// , where `app/_load-balancer-name_/_load-balancer-id_`  is the final
  /// portion of the load balancer ARN, and
  /// `targetgroup/_target-group-name_/_target-group-id_`  is the final portion
  /// of the target group ARN. The target group must be attached to the Auto
  /// Scaling group.
  final String resourceLabel;

  PredefinedMetricSpecification({
    @required this.predefinedMetricType,
    this.resourceLabel,
  });
  static PredefinedMetricSpecification fromJson(Map<String, dynamic> json) =>
      PredefinedMetricSpecification(
        predefinedMetricType: json['PredefinedMetricType'] as String,
        resourceLabel: json.containsKey('ResourceLabel')
            ? json['ResourceLabel'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes a process type.
///
/// For more information, see
/// [Scaling Processes](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-suspend-resume-processes.html#process-types)
/// in the _Amazon EC2 Auto Scaling User Guide_.
class ProcessType {
  /// One of the following processes:
  ///
  /// *    `Launch`
  ///
  /// *    `Terminate`
  ///
  /// *    `AddToLoadBalancer`
  ///
  /// *    `AlarmNotification`
  ///
  /// *    `AZRebalance`
  ///
  /// *    `HealthCheck`
  ///
  /// *    `ReplaceUnhealthy`
  ///
  /// *    `ScheduledActions`
  final String processName;

  ProcessType({
    @required this.processName,
  });
  static ProcessType fromJson(Map<String, dynamic> json) => ProcessType(
        processName: json['ProcessName'] as String,
      );
}

class ProcessesType {
  /// The names of the process types.
  final List<ProcessType> processes;

  ProcessesType({
    this.processes,
  });
  static ProcessesType fromJson(Map<String, dynamic> json) => ProcessesType(
        processes: json.containsKey('Processes')
            ? (json['Processes'] as List)
                .map((e) => ProcessType.fromJson(e))
                .toList()
            : null,
      );
}

class PutLifecycleHookAnswer {
  PutLifecycleHookAnswer();
  static PutLifecycleHookAnswer fromJson(Map<String, dynamic> json) =>
      PutLifecycleHookAnswer();
}

class RecordLifecycleActionHeartbeatAnswer {
  RecordLifecycleActionHeartbeatAnswer();
  static RecordLifecycleActionHeartbeatAnswer fromJson(
          Map<String, dynamic> json) =>
      RecordLifecycleActionHeartbeatAnswer();
}

/// Describes a scaling policy.
class ScalingPolicy {
  /// The name of the Auto Scaling group.
  final String autoScalingGroupName;

  /// The name of the scaling policy.
  final String policyName;

  /// The Amazon Resource Name (ARN) of the policy.
  final String policyArn;

  /// The policy type. The valid values are `SimpleScaling`, `StepScaling`, and
  /// `TargetTrackingScaling`.
  final String policyType;

  /// The adjustment type, which specifies how `ScalingAdjustment` is
  /// interpreted. The valid values are `ChangeInCapacity`, `ExactCapacity`, and
  /// `PercentChangeInCapacity`.
  final String adjustmentType;

  /// Available for backward compatibility. Use `MinAdjustmentMagnitude`
  /// instead.
  final int minAdjustmentStep;

  /// The minimum number of instances to scale. If the value of `AdjustmentType`
  /// is `PercentChangeInCapacity`, the scaling policy changes the
  /// `DesiredCapacity` of the Auto Scaling group by at least this many
  /// instances. Otherwise, the error is `ValidationError`.
  final int minAdjustmentMagnitude;

  /// The amount by which to scale, based on the specified adjustment type. A
  /// positive value adds to the current capacity while a negative number
  /// removes from the current capacity.
  final int scalingAdjustment;

  /// The amount of time, in seconds, after a scaling activity completes before
  /// any further dynamic scaling activities can start.
  final int cooldown;

  /// A set of adjustments that enable you to scale based on the size of the
  /// alarm breach.
  final List<StepAdjustment> stepAdjustments;

  /// The aggregation type for the CloudWatch metrics. The valid values are
  /// `Minimum`, `Maximum`, and `Average`.
  final String metricAggregationType;

  /// The estimated time, in seconds, until a newly launched instance can
  /// contribute to the CloudWatch metrics.
  final int estimatedInstanceWarmup;

  /// The CloudWatch alarms related to the policy.
  final List<Alarm> alarms;

  /// A target tracking scaling policy.
  final TargetTrackingConfiguration targetTrackingConfiguration;

  ScalingPolicy({
    this.autoScalingGroupName,
    this.policyName,
    this.policyArn,
    this.policyType,
    this.adjustmentType,
    this.minAdjustmentStep,
    this.minAdjustmentMagnitude,
    this.scalingAdjustment,
    this.cooldown,
    this.stepAdjustments,
    this.metricAggregationType,
    this.estimatedInstanceWarmup,
    this.alarms,
    this.targetTrackingConfiguration,
  });
  static ScalingPolicy fromJson(Map<String, dynamic> json) => ScalingPolicy(
        autoScalingGroupName: json.containsKey('AutoScalingGroupName')
            ? json['AutoScalingGroupName'] as String
            : null,
        policyName: json.containsKey('PolicyName')
            ? json['PolicyName'] as String
            : null,
        policyArn:
            json.containsKey('PolicyARN') ? json['PolicyARN'] as String : null,
        policyType: json.containsKey('PolicyType')
            ? json['PolicyType'] as String
            : null,
        adjustmentType: json.containsKey('AdjustmentType')
            ? json['AdjustmentType'] as String
            : null,
        minAdjustmentStep: json.containsKey('MinAdjustmentStep')
            ? json['MinAdjustmentStep'] as int
            : null,
        minAdjustmentMagnitude: json.containsKey('MinAdjustmentMagnitude')
            ? json['MinAdjustmentMagnitude'] as int
            : null,
        scalingAdjustment: json.containsKey('ScalingAdjustment')
            ? json['ScalingAdjustment'] as int
            : null,
        cooldown: json.containsKey('Cooldown') ? json['Cooldown'] as int : null,
        stepAdjustments: json.containsKey('StepAdjustments')
            ? (json['StepAdjustments'] as List)
                .map((e) => StepAdjustment.fromJson(e))
                .toList()
            : null,
        metricAggregationType: json.containsKey('MetricAggregationType')
            ? json['MetricAggregationType'] as String
            : null,
        estimatedInstanceWarmup: json.containsKey('EstimatedInstanceWarmup')
            ? json['EstimatedInstanceWarmup'] as int
            : null,
        alarms: json.containsKey('Alarms')
            ? (json['Alarms'] as List).map((e) => Alarm.fromJson(e)).toList()
            : null,
        targetTrackingConfiguration:
            json.containsKey('TargetTrackingConfiguration')
                ? TargetTrackingConfiguration.fromJson(
                    json['TargetTrackingConfiguration'])
                : null,
      );
}

class ScheduledActionsType {
  /// The scheduled actions.
  final List<ScheduledUpdateGroupAction> scheduledUpdateGroupActions;

  /// A string that indicates that the response contains more items than can be
  /// returned in a single response. To receive additional items, specify this
  /// string for the `NextToken` value when requesting the next set of items.
  /// This value is null when there are no more items to return.
  final String nextToken;

  ScheduledActionsType({
    this.scheduledUpdateGroupActions,
    this.nextToken,
  });
  static ScheduledActionsType fromJson(Map<String, dynamic> json) =>
      ScheduledActionsType(
        scheduledUpdateGroupActions:
            json.containsKey('ScheduledUpdateGroupActions')
                ? (json['ScheduledUpdateGroupActions'] as List)
                    .map((e) => ScheduledUpdateGroupAction.fromJson(e))
                    .toList()
                : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// Describes a scheduled scaling action. Used in response to
/// DescribeScheduledActions.
class ScheduledUpdateGroupAction {
  /// The name of the Auto Scaling group.
  final String autoScalingGroupName;

  /// The name of the scheduled action.
  final String scheduledActionName;

  /// The Amazon Resource Name (ARN) of the scheduled action.
  final String scheduledActionArn;

  /// This parameter is no longer used.
  final DateTime time;

  /// The date and time in UTC for this action to start. For example,
  /// `"2019-06-01T00:00:00Z"`.
  final DateTime startTime;

  /// The date and time in UTC for the recurring schedule to end. For example,
  /// `"2019-06-01T00:00:00Z"`.
  final DateTime endTime;

  /// The recurring schedule for the action, in Unix cron syntax format.
  ///
  /// When `StartTime` and `EndTime` are specified with `Recurrence`, they form
  /// the boundaries of when the recurring action starts and stops.
  final String recurrence;

  /// The minimum number of instances in the Auto Scaling group.
  final int minSize;

  /// The maximum number of instances in the Auto Scaling group.
  final int maxSize;

  /// The number of instances you prefer to maintain in the group.
  final int desiredCapacity;

  ScheduledUpdateGroupAction({
    this.autoScalingGroupName,
    this.scheduledActionName,
    this.scheduledActionArn,
    this.time,
    this.startTime,
    this.endTime,
    this.recurrence,
    this.minSize,
    this.maxSize,
    this.desiredCapacity,
  });
  static ScheduledUpdateGroupAction fromJson(Map<String, dynamic> json) =>
      ScheduledUpdateGroupAction(
        autoScalingGroupName: json.containsKey('AutoScalingGroupName')
            ? json['AutoScalingGroupName'] as String
            : null,
        scheduledActionName: json.containsKey('ScheduledActionName')
            ? json['ScheduledActionName'] as String
            : null,
        scheduledActionArn: json.containsKey('ScheduledActionARN')
            ? json['ScheduledActionARN'] as String
            : null,
        time: json.containsKey('Time') ? DateTime.parse(json['Time']) : null,
        startTime: json.containsKey('StartTime')
            ? DateTime.parse(json['StartTime'])
            : null,
        endTime: json.containsKey('EndTime')
            ? DateTime.parse(json['EndTime'])
            : null,
        recurrence: json.containsKey('Recurrence')
            ? json['Recurrence'] as String
            : null,
        minSize: json.containsKey('MinSize') ? json['MinSize'] as int : null,
        maxSize: json.containsKey('MaxSize') ? json['MaxSize'] as int : null,
        desiredCapacity: json.containsKey('DesiredCapacity')
            ? json['DesiredCapacity'] as int
            : null,
      );
}

/// Describes one or more scheduled scaling action updates for a specified Auto
/// Scaling group. Used in combination with BatchPutScheduledUpdateGroupAction.
///
/// When updating a scheduled scaling action, all optional parameters are left
/// unchanged if not specified.
class ScheduledUpdateGroupActionRequest {
  /// The name of the scaling action.
  final String scheduledActionName;

  /// The date and time for the action to start, in YYYY-MM-DDThh:mm:ssZ format
  /// in UTC/GMT only and in quotes (for example, `"2019-06-01T00:00:00Z"`).
  ///
  /// If you specify `Recurrence` and `StartTime`, Amazon EC2 Auto Scaling
  /// performs the action at this time, and then performs the action based on
  /// the specified recurrence.
  ///
  /// If you try to schedule the action in the past, Amazon EC2 Auto Scaling
  /// returns an error message.
  final DateTime startTime;

  /// The date and time for the recurring schedule to end. Amazon EC2 Auto
  /// Scaling does not perform the action after this time.
  final DateTime endTime;

  /// The recurring schedule for the action, in Unix cron syntax format. This
  /// format consists of five fields separated by white spaces: [Minute] [Hour]
  /// [Day_of_Month] [Month_of_Year] [Day_of_Week]. The value must be in quotes
  /// (for example, `"30 0 1 1,6,12 *"`). For more information about this
  /// format, see [Crontab](http://crontab.org).
  ///
  /// When `StartTime` and `EndTime` are specified with `Recurrence`, they form
  /// the boundaries of when the recurring action starts and stops.
  final String recurrence;

  /// The minimum number of instances in the Auto Scaling group.
  final int minSize;

  /// The maximum number of instances in the Auto Scaling group.
  final int maxSize;

  /// The number of EC2 instances that should be running in the group.
  final int desiredCapacity;

  ScheduledUpdateGroupActionRequest({
    @required this.scheduledActionName,
    this.startTime,
    this.endTime,
    this.recurrence,
    this.minSize,
    this.maxSize,
    this.desiredCapacity,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class SetInstanceProtectionAnswer {
  SetInstanceProtectionAnswer();
  static SetInstanceProtectionAnswer fromJson(Map<String, dynamic> json) =>
      SetInstanceProtectionAnswer();
}

/// Describes an adjustment based on the difference between the value of the
/// aggregated CloudWatch metric and the breach threshold that you've defined
/// for the alarm. Used in combination with PutScalingPolicy.
///
/// For the following examples, suppose that you have an alarm with a breach
/// threshold of 50:
///
/// *   To trigger the adjustment when the metric is greater than or equal to 50
/// and less than 60, specify a lower bound of 0 and an upper bound of 10.
///
/// *   To trigger the adjustment when the metric is greater than 40 and less
/// than or equal to 50, specify a lower bound of -10 and an upper bound of 0.
///
///
/// There are a few rules for the step adjustments for your step policy:
///
/// *   The ranges of your step adjustments can't overlap or have a gap.
///
/// *   At most, one step adjustment can have a null lower bound. If one step
/// adjustment has a negative lower bound, then there must be a step adjustment
/// with a null lower bound.
///
/// *   At most, one step adjustment can have a null upper bound. If one step
/// adjustment has a positive upper bound, then there must be a step adjustment
/// with a null upper bound.
///
/// *   The upper and lower bound can't be null in the same step adjustment.
class StepAdjustment {
  /// The lower bound for the difference between the alarm threshold and the
  /// CloudWatch metric. If the metric value is above the breach threshold, the
  /// lower bound is inclusive (the metric must be greater than or equal to the
  /// threshold plus the lower bound). Otherwise, it is exclusive (the metric
  /// must be greater than the threshold plus the lower bound). A null value
  /// indicates negative infinity.
  final double metricIntervalLowerBound;

  /// The upper bound for the difference between the alarm threshold and the
  /// CloudWatch metric. If the metric value is above the breach threshold, the
  /// upper bound is exclusive (the metric must be less than the threshold plus
  /// the upper bound). Otherwise, it is inclusive (the metric must be less than
  /// or equal to the threshold plus the upper bound). A null value indicates
  /// positive infinity.
  ///
  /// The upper bound must be greater than the lower bound.
  final double metricIntervalUpperBound;

  /// The amount by which to scale, based on the specified adjustment type. A
  /// positive value adds to the current capacity while a negative number
  /// removes from the current capacity.
  final int scalingAdjustment;

  StepAdjustment({
    this.metricIntervalLowerBound,
    this.metricIntervalUpperBound,
    @required this.scalingAdjustment,
  });
  static StepAdjustment fromJson(Map<String, dynamic> json) => StepAdjustment(
        metricIntervalLowerBound: json.containsKey('MetricIntervalLowerBound')
            ? json['MetricIntervalLowerBound'] as double
            : null,
        metricIntervalUpperBound: json.containsKey('MetricIntervalUpperBound')
            ? json['MetricIntervalUpperBound'] as double
            : null,
        scalingAdjustment: json['ScalingAdjustment'] as int,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes an automatic scaling process that has been suspended. For more
/// information, see ProcessType.
class SuspendedProcess {
  /// The name of the suspended process.
  final String processName;

  /// The reason that the process was suspended.
  final String suspensionReason;

  SuspendedProcess({
    this.processName,
    this.suspensionReason,
  });
  static SuspendedProcess fromJson(Map<String, dynamic> json) =>
      SuspendedProcess(
        processName: json.containsKey('ProcessName')
            ? json['ProcessName'] as String
            : null,
        suspensionReason: json.containsKey('SuspensionReason')
            ? json['SuspensionReason'] as String
            : null,
      );
}

/// Describes a tag for an Auto Scaling group.
class Tag {
  /// The name of the group.
  final String resourceId;

  /// The type of resource. The only supported value is `auto-scaling-group`.
  final String resourceType;

  /// The tag key.
  final String key;

  /// The tag value.
  final String value;

  /// Determines whether the tag is added to new instances as they are launched
  /// in the group.
  final bool propagateAtLaunch;

  Tag({
    this.resourceId,
    this.resourceType,
    @required this.key,
    this.value,
    this.propagateAtLaunch,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes a tag for an Auto Scaling group.
class TagDescription {
  /// The name of the group.
  final String resourceId;

  /// The type of resource. The only supported value is `auto-scaling-group`.
  final String resourceType;

  /// The tag key.
  final String key;

  /// The tag value.
  final String value;

  /// Determines whether the tag is added to new instances as they are launched
  /// in the group.
  final bool propagateAtLaunch;

  TagDescription({
    this.resourceId,
    this.resourceType,
    this.key,
    this.value,
    this.propagateAtLaunch,
  });
  static TagDescription fromJson(Map<String, dynamic> json) => TagDescription(
        resourceId: json.containsKey('ResourceId')
            ? json['ResourceId'] as String
            : null,
        resourceType: json.containsKey('ResourceType')
            ? json['ResourceType'] as String
            : null,
        key: json.containsKey('Key') ? json['Key'] as String : null,
        value: json.containsKey('Value') ? json['Value'] as String : null,
        propagateAtLaunch: json.containsKey('PropagateAtLaunch')
            ? json['PropagateAtLaunch'] as bool
            : null,
      );
}

class TagsType {
  /// One or more tags.
  final List<TagDescription> tags;

  /// A string that indicates that the response contains more items than can be
  /// returned in a single response. To receive additional items, specify this
  /// string for the `NextToken` value when requesting the next set of items.
  /// This value is null when there are no more items to return.
  final String nextToken;

  TagsType({
    this.tags,
    this.nextToken,
  });
  static TagsType fromJson(Map<String, dynamic> json) => TagsType(
        tags: json.containsKey('Tags')
            ? (json['Tags'] as List)
                .map((e) => TagDescription.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// Represents a target tracking scaling policy configuration to use with Amazon
/// EC2 Auto Scaling.
class TargetTrackingConfiguration {
  /// A predefined metric. You must specify either a predefined metric or a
  /// customized metric.
  final PredefinedMetricSpecification predefinedMetricSpecification;

  /// A customized metric. You must specify either a predefined metric or a
  /// customized metric.
  final CustomizedMetricSpecification customizedMetricSpecification;

  /// The target value for the metric.
  final double targetValue;

  /// Indicates whether scaling in by the target tracking scaling policy is
  /// disabled. If scaling in is disabled, the target tracking scaling policy
  /// doesn't remove instances from the Auto Scaling group. Otherwise, the
  /// target tracking scaling policy can remove instances from the Auto Scaling
  /// group. The default is `false`.
  final bool disableScaleIn;

  TargetTrackingConfiguration({
    this.predefinedMetricSpecification,
    this.customizedMetricSpecification,
    @required this.targetValue,
    this.disableScaleIn,
  });
  static TargetTrackingConfiguration fromJson(Map<String, dynamic> json) =>
      TargetTrackingConfiguration(
        predefinedMetricSpecification:
            json.containsKey('PredefinedMetricSpecification')
                ? PredefinedMetricSpecification.fromJson(
                    json['PredefinedMetricSpecification'])
                : null,
        customizedMetricSpecification:
            json.containsKey('CustomizedMetricSpecification')
                ? CustomizedMetricSpecification.fromJson(
                    json['CustomizedMetricSpecification'])
                : null,
        targetValue: json['TargetValue'] as double,
        disableScaleIn: json.containsKey('DisableScaleIn')
            ? json['DisableScaleIn'] as bool
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}
