import 'package:meta/meta.dart';

/// Amazon EC2 Auto Scaling
///
/// Amazon EC2 Auto Scaling is designed to automatically launch or terminate EC2
/// instances based on user-defined scaling policies, scheduled actions, and
/// health checks. Use this service with AWS Auto Scaling, Amazon CloudWatch,
/// and Elastic Load Balancing.
///
/// For more information, including information about granting IAM users
/// required permissions for Amazon EC2 Auto Scaling actions, see the [Amazon
/// EC2 Auto Scaling User
/// Guide](https://docs.aws.amazon.com/autoscaling/ec2/userguide/what-is-amazon-ec2-auto-scaling.html).
class AutoScalingApi {
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
  /// For more information, see [Attach EC2 Instances to Your Auto Scaling
  /// Group](https://docs.aws.amazon.com/autoscaling/ec2/userguide/attach-instance-asg.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  Future<void> attachInstances(String autoScalingGroupName,
      {List<String> instanceIds}) async {}

  /// Attaches one or more target groups to the specified Auto Scaling group.
  ///
  /// To describe the target groups for an Auto Scaling group, use
  /// DescribeLoadBalancerTargetGroups. To detach the target group from the Auto
  /// Scaling group, use DetachLoadBalancerTargetGroups.
  ///
  /// With Application Load Balancers and Network Load Balancers, instances are
  /// registered as targets with a target group. With Classic Load Balancers,
  /// instances are registered with the load balancer. For more information, see
  /// [Attaching a Load Balancer to Your Auto Scaling
  /// Group](https://docs.aws.amazon.com/autoscaling/ec2/userguide/attach-load-balancer-asg.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  Future<void> attachLoadBalancerTargetGroups(
      {@required String autoScalingGroupName,
      @required List<String> targetGroupARNs}) async {}

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
  /// For more information, see [Attaching a Load Balancer to Your Auto Scaling
  /// Group](https://docs.aws.amazon.com/autoscaling/ec2/userguide/attach-load-balancer-asg.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  Future<void> attachLoadBalancers(
      {@required String autoScalingGroupName,
      @required List<String> loadBalancerNames}) async {}

  /// Deletes one or more scheduled actions for the specified Auto Scaling
  /// group.
  Future<void> batchDeleteScheduledAction(
      {@required String autoScalingGroupName,
      @required List<String> scheduledActionNames}) async {}

  /// Creates or updates one or more scheduled scaling actions for an Auto
  /// Scaling group. If you leave a parameter unspecified when updating a
  /// scheduled scaling action, the corresponding value remains unchanged.
  Future<void> batchPutScheduledUpdateGroupAction(
      {@required
          String autoScalingGroupName,
      @required
          List<ScheduledUpdateGroupActionRequest>
              scheduledUpdateGroupActions}) async {}

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
  /// For more information, see [Amazon EC2 Auto Scaling Lifecycle
  /// Hooks](https://docs.aws.amazon.com/autoscaling/ec2/userguide/lifecycle-hooks.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  Future<void> completeLifecycleAction(
      {@required String lifecycleHookName,
      @required String autoScalingGroupName,
      String lifecycleActionToken,
      @required String lifecycleActionResult,
      String instanceId}) async {}

  /// Creates an Auto Scaling group with the specified name and attributes.
  ///
  /// If you exceed your maximum limit of Auto Scaling groups, the call fails.
  /// For information about viewing this limit, see DescribeAccountLimits. For
  /// information about updating this limit, see [Amazon EC2 Auto Scaling
  /// Limits](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-account-limits.html)
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
      String serviceLinkedRoleArn}) async {}

  /// Creates a launch configuration.
  ///
  /// If you exceed your maximum limit of launch configurations, the call fails.
  /// For information about viewing this limit, see DescribeAccountLimits. For
  /// information about updating this limit, see [Amazon EC2 Auto Scaling
  /// Limits](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-account-limits.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  ///
  /// For more information, see [Launch
  /// Configurations](https://docs.aws.amazon.com/autoscaling/ec2/userguide/LaunchConfiguration.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
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
      String placementTenancy}) async {}

  /// Creates or updates tags for the specified Auto Scaling group.
  ///
  /// When you specify a tag with a key that already exists, the operation
  /// overwrites the previous tag definition, and you do not get an error
  /// message.
  ///
  /// For more information, see [Tagging Auto Scaling Groups and
  /// Instances](https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-tagging.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  Future<void> createOrUpdateTags(List<Tag> tags) async {}

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
  Future<void> deleteAutoScalingGroup(String autoScalingGroupName,
      {bool forceDelete}) async {}

  /// Deletes the specified launch configuration.
  ///
  /// The launch configuration must not be attached to an Auto Scaling group.
  /// When this call completes, the launch configuration is no longer available
  /// for use.
  Future<void> deleteLaunchConfiguration(
      String launchConfigurationName) async {}

  /// Deletes the specified lifecycle hook.
  ///
  /// If there are any outstanding lifecycle actions, they are completed first
  /// (`ABANDON` for launching instances, `CONTINUE` for terminating instances).
  Future<void> deleteLifecycleHook(
      {@required String lifecycleHookName,
      @required String autoScalingGroupName}) async {}

  /// Deletes the specified notification.
  Future<void> deleteNotificationConfiguration(
      {@required String autoScalingGroupName,
      @required String topicArn}) async {}

  /// Deletes the specified scaling policy.
  ///
  /// Deleting either a step scaling policy or a simple scaling policy deletes
  /// the underlying alarm action, but does not delete the alarm, even if it no
  /// longer has an associated action.
  ///
  /// For more information, see [Deleting a Scaling
  /// Policy](https://docs.aws.amazon.com/autoscaling/ec2/userguide/deleting-scaling-policy.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  Future<void> deletePolicy(String policyName,
      {String autoScalingGroupName}) async {}

  /// Deletes the specified scheduled action.
  Future<void> deleteScheduledAction(
      {@required String autoScalingGroupName,
      @required String scheduledActionName}) async {}

  /// Deletes the specified tags.
  Future<void> deleteTags(List<Tag> tags) async {}

  /// Describes the current Amazon EC2 Auto Scaling resource limits for your AWS
  /// account.
  ///
  /// For information about requesting an increase in these limits, see [Amazon
  /// EC2 Auto Scaling
  /// Limits](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-account-limits.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  Future<void> describeAccountLimits() async {}

  /// Describes the policy adjustment types for use with PutScalingPolicy.
  Future<void> describeAdjustmentTypes() async {}

  /// Describes one or more Auto Scaling groups.
  Future<void> describeAutoScalingGroups(
      {List<String> autoScalingGroupNames,
      String nextToken,
      int maxRecords}) async {}

  /// Describes one or more Auto Scaling instances.
  Future<void> describeAutoScalingInstances(
      {List<String> instanceIds, int maxRecords, String nextToken}) async {}

  /// Describes the notification types that are supported by Amazon EC2 Auto
  /// Scaling.
  Future<void> describeAutoScalingNotificationTypes() async {}

  /// Describes one or more launch configurations.
  Future<void> describeLaunchConfigurations(
      {List<String> launchConfigurationNames,
      String nextToken,
      int maxRecords}) async {}

  /// Describes the available types of lifecycle hooks.
  ///
  /// The following hook types are supported:
  ///
  /// *   autoscaling:EC2\_INSTANCE\_LAUNCHING
  ///
  /// *   autoscaling:EC2\_INSTANCE\_TERMINATING
  Future<void> describeLifecycleHookTypes() async {}

  /// Describes the lifecycle hooks for the specified Auto Scaling group.
  Future<void> describeLifecycleHooks(String autoScalingGroupName,
      {List<String> lifecycleHookNames}) async {}

  /// Describes the target groups for the specified Auto Scaling group.
  Future<void> describeLoadBalancerTargetGroups(String autoScalingGroupName,
      {String nextToken, int maxRecords}) async {}

  /// Describes the load balancers for the specified Auto Scaling group.
  ///
  /// This operation describes only Classic Load Balancers. If you have
  /// Application Load Balancers or Network Load Balancers, use
  /// DescribeLoadBalancerTargetGroups instead.
  Future<void> describeLoadBalancers(String autoScalingGroupName,
      {String nextToken, int maxRecords}) async {}

  /// Describes the available CloudWatch metrics for Amazon EC2 Auto Scaling.
  ///
  /// The `GroupStandbyInstances` metric is not returned by default. You must
  /// explicitly request this metric when calling EnableMetricsCollection.
  Future<void> describeMetricCollectionTypes() async {}

  /// Describes the notification actions associated with the specified Auto
  /// Scaling group.
  Future<void> describeNotificationConfigurations(
      {List<String> autoScalingGroupNames,
      String nextToken,
      int maxRecords}) async {}

  /// Describes the policies for the specified Auto Scaling group.
  Future<void> describePolicies(
      {String autoScalingGroupName,
      List<String> policyNames,
      List<String> policyTypes,
      String nextToken,
      int maxRecords}) async {}

  /// Describes one or more scaling activities for the specified Auto Scaling
  /// group.
  Future<void> describeScalingActivities(
      {List<String> activityIds,
      String autoScalingGroupName,
      int maxRecords,
      String nextToken}) async {}

  /// Describes the scaling process types for use with ResumeProcesses and
  /// SuspendProcesses.
  Future<void> describeScalingProcessTypes() async {}

  /// Describes the actions scheduled for your Auto Scaling group that haven't
  /// run or that have not reached their end time. To describe the actions that
  /// have already run, use DescribeScalingActivities.
  Future<void> describeScheduledActions(
      {String autoScalingGroupName,
      List<String> scheduledActionNames,
      DateTime startTime,
      DateTime endTime,
      String nextToken,
      int maxRecords}) async {}

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
  Future<void> describeTags(
      {List<Filter> filters, String nextToken, int maxRecords}) async {}

  /// Describes the termination policies supported by Amazon EC2 Auto Scaling.
  ///
  /// For more information, see [Controlling Which Auto Scaling Instances
  /// Terminate During Scale
  /// In](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-instance-termination.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  Future<void> describeTerminationPolicyTypes() async {}

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
  /// For more information, see [Detach EC2 Instances from Your Auto Scaling
  /// Group](https://docs.aws.amazon.com/autoscaling/ec2/userguide/detach-instance-asg.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  Future<void> detachInstances(
      {List<String> instanceIds,
      @required String autoScalingGroupName,
      @required bool shouldDecrementDesiredCapacity}) async {}

  /// Detaches one or more target groups from the specified Auto Scaling group.
  Future<void> detachLoadBalancerTargetGroups(
      {@required String autoScalingGroupName,
      @required List<String> targetGroupARNs}) async {}

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
  Future<void> detachLoadBalancers(
      {@required String autoScalingGroupName,
      @required List<String> loadBalancerNames}) async {}

  /// Disables group metrics for the specified Auto Scaling group.
  Future<void> disableMetricsCollection(String autoScalingGroupName,
      {List<String> metrics}) async {}

  /// Enables group metrics for the specified Auto Scaling group. For more
  /// information, see [Monitoring Your Auto Scaling Groups and
  /// Instances](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-instance-monitoring.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  Future<void> enableMetricsCollection(
      {@required String autoScalingGroupName,
      List<String> metrics,
      @required String granularity}) async {}

  /// Moves the specified instances into the standby state.
  ///
  /// For more information, see [Temporarily Removing Instances from Your Auto
  /// Scaling
  /// Group](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-enter-exit-standby.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  Future<void> enterStandby(
      {List<String> instanceIds,
      @required String autoScalingGroupName,
      @required bool shouldDecrementDesiredCapacity}) async {}

  /// Executes the specified policy.
  Future<void> executePolicy(String policyName,
      {String autoScalingGroupName,
      bool honorCooldown,
      double metricValue,
      double breachThreshold}) async {}

  /// Moves the specified instances out of the standby state.
  ///
  /// For more information, see [Temporarily Removing Instances from Your Auto
  /// Scaling
  /// Group](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-enter-exit-standby.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  Future<void> exitStandby(String autoScalingGroupName,
      {List<String> instanceIds}) async {}

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
  /// For more information, see [Amazon EC2 Auto Scaling Lifecycle
  /// Hooks](https://docs.aws.amazon.com/autoscaling/ec2/userguide/lifecycle-hooks.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  ///
  /// If you exceed your maximum limit of lifecycle hooks, which by default is
  /// 50 per Auto Scaling group, the call fails.
  ///
  /// You can view the lifecycle hooks for an Auto Scaling group using
  /// DescribeLifecycleHooks. If you are no longer using a lifecycle hook, you
  /// can delete it using DeleteLifecycleHook.
  Future<void> putLifecycleHook(
      {@required String lifecycleHookName,
      @required String autoScalingGroupName,
      String lifecycleTransition,
      String roleArn,
      String notificationTargetArn,
      String notificationMetadata,
      int heartbeatTimeout,
      String defaultResult}) async {}

  /// Configures an Auto Scaling group to send notifications when specified
  /// events take place. Subscribers to the specified topic can have messages
  /// delivered to an endpoint such as a web server or an email address.
  ///
  /// This configuration overwrites any existing configuration.
  ///
  /// For more information, see [Getting Amazon SNS Notifications When Your Auto
  /// Scaling Group
  /// Scales](https://docs.aws.amazon.com/autoscaling/ec2/userguide/ASGettingNotifications.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  Future<void> putNotificationConfiguration(
      {@required String autoScalingGroupName,
      @required String topicArn,
      @required List<String> notificationTypes}) async {}

  /// Creates or updates a scaling policy for an Auto Scaling group. To update
  /// an existing scaling policy, use the existing policy name and set the
  /// parameters to change. Any existing parameter not changed in an update to
  /// an existing policy is not changed in this update request.
  ///
  /// For more information about using scaling policies to scale your Auto
  /// Scaling group automatically, see [Dynamic
  /// Scaling](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-scale-based-on-demand.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  Future<void> putScalingPolicy(
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
      TargetTrackingConfiguration targetTrackingConfiguration}) async {}

  /// Creates or updates a scheduled scaling action for an Auto Scaling group.
  /// If you leave a parameter unspecified when updating a scheduled scaling
  /// action, the corresponding value remains unchanged.
  ///
  /// For more information, see [Scheduled
  /// Scaling](https://docs.aws.amazon.com/autoscaling/ec2/userguide/schedule_time.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  Future<void> putScheduledUpdateGroupAction(
      {@required String autoScalingGroupName,
      @required String scheduledActionName,
      DateTime time,
      DateTime startTime,
      DateTime endTime,
      String recurrence,
      int minSize,
      int maxSize,
      int desiredCapacity}) async {}

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
  /// For more information, see [Auto Scaling
  /// Lifecycle](https://docs.aws.amazon.com/autoscaling/ec2/userguide/AutoScalingGroupLifecycle.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  Future<void> recordLifecycleActionHeartbeat(
      {@required String lifecycleHookName,
      @required String autoScalingGroupName,
      String lifecycleActionToken,
      String instanceId}) async {}

  /// Resumes the specified suspended automatic scaling processes, or all
  /// suspended process, for the specified Auto Scaling group.
  ///
  /// For more information, see [Suspending and Resuming Scaling
  /// Processes](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-suspend-resume-processes.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  Future<void> resumeProcesses(String autoScalingGroupName,
      {List<String> scalingProcesses}) async {}

  /// Sets the size of the specified Auto Scaling group.
  ///
  /// For more information about desired capacity, see [What Is Amazon EC2 Auto
  /// Scaling?](https://docs.aws.amazon.com/autoscaling/ec2/userguide/what-is-amazon-ec2-auto-scaling.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  Future<void> setDesiredCapacity(
      {@required String autoScalingGroupName,
      @required int desiredCapacity,
      bool honorCooldown}) async {}

  /// Sets the health status of the specified instance.
  ///
  /// For more information, see [Health Checks for Auto Scaling
  /// Instances](https://docs.aws.amazon.com/autoscaling/ec2/userguide/healthcheck.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  Future<void> setInstanceHealth(
      {@required String instanceId,
      @required String healthStatus,
      bool shouldRespectGracePeriod}) async {}

  /// Updates the instance protection settings of the specified instances.
  ///
  /// For more information about preventing instances that are part of an Auto
  /// Scaling group from terminating on scale in, see [Instance
  /// Protection](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-instance-termination.html#instance-protection)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  Future<void> setInstanceProtection(
      {@required List<String> instanceIds,
      @required String autoScalingGroupName,
      @required bool protectedFromScaleIn}) async {}

  /// Suspends the specified automatic scaling processes, or all processes, for
  /// the specified Auto Scaling group.
  ///
  /// If you suspend either the `Launch` or `Terminate` process types, it can
  /// prevent other process types from functioning properly.
  ///
  /// To resume processes that have been suspended, use ResumeProcesses.
  ///
  /// For more information, see [Suspending and Resuming Scaling
  /// Processes](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-suspend-resume-processes.html)
  /// in the _Amazon EC2 Auto Scaling User Guide_.
  Future<void> suspendProcesses(String autoScalingGroupName,
      {List<String> scalingProcesses}) async {}

  /// Terminates the specified instance and optionally adjusts the desired group
  /// size.
  ///
  /// This call simply makes a termination request. The instance is not
  /// terminated immediately.
  Future<void> terminateInstanceInAutoScalingGroup(
      {@required String instanceId,
      @required bool shouldDecrementDesiredCapacity}) async {}

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
      String serviceLinkedRoleArn}) async {}
}

class ActivitiesType {}

class Activity {}

class ActivityType {}

class AdjustmentType {}

class Alarm {}

class AttachLoadBalancerTargetGroupsResultType {}

class AttachLoadBalancersResultType {}

class AutoScalingGroup {}

class AutoScalingGroupsType {}

class AutoScalingInstanceDetails {}

class AutoScalingInstancesType {}

class BatchDeleteScheduledActionAnswer {}

class BatchPutScheduledUpdateGroupActionAnswer {}

class BlockDeviceMapping {}

class CompleteLifecycleActionAnswer {}

class CustomizedMetricSpecification {}

class DeleteLifecycleHookAnswer {}

class DescribeAccountLimitsAnswer {}

class DescribeAdjustmentTypesAnswer {}

class DescribeAutoScalingNotificationTypesAnswer {}

class DescribeLifecycleHookTypesAnswer {}

class DescribeLifecycleHooksAnswer {}

class DescribeLoadBalancerTargetGroupsResponse {}

class DescribeLoadBalancersResponse {}

class DescribeMetricCollectionTypesAnswer {}

class DescribeNotificationConfigurationsAnswer {}

class DescribeTerminationPolicyTypesAnswer {}

class DetachInstancesAnswer {}

class DetachLoadBalancerTargetGroupsResultType {}

class DetachLoadBalancersResultType {}

class Ebs {}

class EnabledMetric {}

class EnterStandbyAnswer {}

class ExitStandbyAnswer {}

class FailedScheduledUpdateGroupActionRequest {}

class Filter {}

class Instance {}

class InstanceMonitoring {}

class InstancesDistribution {}

class LaunchConfiguration {}

class LaunchConfigurationsType {}

class LaunchTemplate {}

class LaunchTemplateOverrides {}

class LaunchTemplateSpecification {}

class LifecycleHook {}

class LifecycleHookSpecification {}

class LoadBalancerState {}

class LoadBalancerTargetGroupState {}

class MetricCollectionType {}

class MetricDimension {}

class MetricGranularityType {}

class MixedInstancesPolicy {}

class NotificationConfiguration {}

class PoliciesType {}

class PolicyArnType {}

class PredefinedMetricSpecification {}

class ProcessType {}

class ProcessesType {}

class PutLifecycleHookAnswer {}

class RecordLifecycleActionHeartbeatAnswer {}

class ScalingPolicy {}

class ScheduledActionsType {}

class ScheduledUpdateGroupAction {}

class ScheduledUpdateGroupActionRequest {}

class SetInstanceProtectionAnswer {}

class StepAdjustment {}

class SuspendedProcess {}

class Tag {}

class TagDescription {}

class TagsType {}

class TargetTrackingConfiguration {}
