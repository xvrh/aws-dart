import 'package:meta/meta.dart';

/// With Application Auto Scaling, you can configure automatic scaling for the
/// following resources:
///
/// *   Amazon ECS services
///
/// *   Amazon EC2 Spot Fleet requests
///
/// *   Amazon EMR clusters
///
/// *   Amazon AppStream 2.0 fleets
///
/// *   Amazon DynamoDB tables and global secondary indexes throughput capacity
///
/// *   Amazon Aurora Replicas
///
/// *   Amazon SageMaker endpoint variants
///
/// *   Custom resources provided by your own applications or services
///
///
///  **API Summary**
///
/// The Application Auto Scaling service API includes three key sets of actions:
///
/// *   Register and manage scalable targets - Register AWS or custom resources
/// as scalable targets (a resource that Application Auto Scaling can scale),
/// set minimum and maximum capacity limits, and retrieve information on
/// existing scalable targets.
///
/// *   Configure and manage automatic scaling - Define scaling policies to
/// dynamically scale your resources in response to CloudWatch alarms, schedule
/// one-time or recurring scaling actions, and retrieve your recent scaling
/// activity history.
///
/// *   Suspend and resume scaling - Temporarily suspend and later resume
/// automatic scaling by calling the RegisterScalableTarget action for any
/// Application Auto Scaling scalable target. You can suspend and resume,
/// individually or in combination, scale-out activities triggered by a scaling
/// policy, scale-in activities triggered by a scaling policy, and scheduled
/// scaling.
///
///
/// To learn more about Application Auto Scaling, including information about
/// granting IAM users required permissions for Application Auto Scaling
/// actions, see the [Application Auto Scaling User
/// Guide](https://docs.aws.amazon.com/autoscaling/application/userguide/what-is-application-auto-scaling.html).
class ApplicationAutoScalingApi {
  /// Deletes the specified scaling policy for an Application Auto Scaling
  /// scalable target.
  ///
  /// Deleting a step scaling policy deletes the underlying alarm action, but
  /// does not delete the CloudWatch alarm associated with the scaling policy,
  /// even if it no longer has an associated action.
  ///
  /// For more information, see [Delete a Step Scaling
  /// Policy](https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-step-scaling-policies.html#delete-step-scaling-policy)
  /// and [Delete a Target Tracking Scaling
  /// Policy](https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-target-tracking.html#delete-target-tracking-policy)
  /// in the _Application Auto Scaling User Guide_.
  ///
  /// To create a scaling policy or update an existing one, see
  /// PutScalingPolicy.
  Future<void> deleteScalingPolicy(
      {@required String policyName,
      @required String serviceNamespace,
      @required String resourceId,
      @required String scalableDimension}) async {}

  /// Deletes the specified scheduled action for an Application Auto Scaling
  /// scalable target.
  ///
  /// For more information, see [Delete a Scheduled
  /// Action](https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-scheduled-scaling.html#delete-scheduled-action)
  /// in the _Application Auto Scaling User Guide_.
  Future<void> deleteScheduledAction(
      {@required String serviceNamespace,
      @required String scheduledActionName,
      @required String resourceId,
      @required String scalableDimension}) async {}

  /// Deregisters an Application Auto Scaling scalable target.
  ///
  /// Deregistering a scalable target deletes the scaling policies that are
  /// associated with it.
  ///
  /// To create a scalable target or update an existing one, see
  /// RegisterScalableTarget.
  Future<void> deregisterScalableTarget(
      {@required String serviceNamespace,
      @required String resourceId,
      @required String scalableDimension}) async {}

  /// Gets information about the scalable targets in the specified namespace.
  ///
  /// You can filter the results using `ResourceIds` and `ScalableDimension`.
  ///
  /// To create a scalable target or update an existing one, see
  /// RegisterScalableTarget. If you are no longer using a scalable target, you
  /// can deregister it using DeregisterScalableTarget.
  Future<void> describeScalableTargets(String serviceNamespace,
      {List<String> resourceIds,
      String scalableDimension,
      int maxResults,
      String nextToken}) async {}

  /// Provides descriptive information about the scaling activities in the
  /// specified namespace from the previous six weeks.
  ///
  /// You can filter the results using `ResourceId` and `ScalableDimension`.
  ///
  /// Scaling activities are triggered by CloudWatch alarms that are associated
  /// with scaling policies. To view the scaling policies for a service
  /// namespace, see DescribeScalingPolicies. To create a scaling policy or
  /// update an existing one, see PutScalingPolicy.
  Future<void> describeScalingActivities(String serviceNamespace,
      {String resourceId,
      String scalableDimension,
      int maxResults,
      String nextToken}) async {}

  /// Describes the Application Auto Scaling scaling policies for the specified
  /// service namespace.
  ///
  /// You can filter the results using `ResourceId`, `ScalableDimension`, and
  /// `PolicyNames`.
  ///
  /// To create a scaling policy or update an existing one, see
  /// PutScalingPolicy. If you are no longer using a scaling policy, you can
  /// delete it using DeleteScalingPolicy.
  Future<void> describeScalingPolicies(String serviceNamespace,
      {List<String> policyNames,
      String resourceId,
      String scalableDimension,
      int maxResults,
      String nextToken}) async {}

  /// Describes the Application Auto Scaling scheduled actions for the specified
  /// service namespace.
  ///
  /// You can filter the results using the `ResourceId`, `ScalableDimension`,
  /// and `ScheduledActionNames` parameters.
  ///
  /// To create a scheduled action or update an existing one, see
  /// PutScheduledAction. If you are no longer using a scheduled action, you can
  /// delete it using DeleteScheduledAction.
  Future<void> describeScheduledActions(String serviceNamespace,
      {List<String> scheduledActionNames,
      String resourceId,
      String scalableDimension,
      int maxResults,
      String nextToken}) async {}

  /// Creates or updates a policy for an Application Auto Scaling scalable
  /// target.
  ///
  /// Each scalable target is identified by a service namespace, resource ID,
  /// and scalable dimension. A scaling policy applies to the scalable target
  /// identified by those three attributes. You cannot create a scaling policy
  /// until you have registered the resource as a scalable target using
  /// RegisterScalableTarget.
  ///
  /// To update a policy, specify its policy name and the parameters that you
  /// want to change. Any parameters that you don't specify are not changed by
  /// this update request.
  ///
  /// You can view the scaling policies for a service namespace using
  /// DescribeScalingPolicies. If you are no longer using a scaling policy, you
  /// can delete it using DeleteScalingPolicy.
  ///
  /// Multiple scaling policies can be in force at the same time for the same
  /// scalable target. You can have one or more target tracking scaling
  /// policies, one or more step scaling policies, or both. However, there is a
  /// chance that multiple policies could conflict, instructing the scalable
  /// target to scale out or in at the same time. Application Auto Scaling gives
  /// precedence to the policy that provides the largest capacity for both scale
  /// in and scale out. For example, if one policy increases capacity by 3,
  /// another policy increases capacity by 200 percent, and the current capacity
  /// is 10, Application Auto Scaling uses the policy with the highest
  /// calculated capacity (200% of 10 = 20) and scales out to 30.
  ///
  /// Learn more about how to work with scaling policies in the [Application
  /// Auto Scaling User
  /// Guide](https://docs.aws.amazon.com/autoscaling/application/userguide/what-is-application-auto-scaling.html).
  Future<void> putScalingPolicy(
      {@required String policyName,
      @required String serviceNamespace,
      @required String resourceId,
      @required String scalableDimension,
      String policyType,
      StepScalingPolicyConfiguration stepScalingPolicyConfiguration,
      TargetTrackingScalingPolicyConfiguration
          targetTrackingScalingPolicyConfiguration}) async {}

  /// Creates or updates a scheduled action for an Application Auto Scaling
  /// scalable target.
  ///
  /// Each scalable target is identified by a service namespace, resource ID,
  /// and scalable dimension. A scheduled action applies to the scalable target
  /// identified by those three attributes. You cannot create a scheduled action
  /// until you have registered the resource as a scalable target using
  /// RegisterScalableTarget.
  ///
  /// To update an action, specify its name and the parameters that you want to
  /// change. If you don't specify start and end times, the old values are
  /// deleted. Any other parameters that you don't specify are not changed by
  /// this update request.
  ///
  /// You can view the scheduled actions using DescribeScheduledActions. If you
  /// are no longer using a scheduled action, you can delete it using
  /// DeleteScheduledAction.
  ///
  /// Learn more about how to work with scheduled actions in the [Application
  /// Auto Scaling User
  /// Guide](https://docs.aws.amazon.com/autoscaling/application/userguide/what-is-application-auto-scaling.html).
  Future<void> putScheduledAction(
      {@required String serviceNamespace,
      String schedule,
      @required String scheduledActionName,
      @required String resourceId,
      @required String scalableDimension,
      DateTime startTime,
      DateTime endTime,
      ScalableTargetAction scalableTargetAction}) async {}

  /// Registers or updates a scalable target. A scalable target is a resource
  /// that Application Auto Scaling can scale out and scale in. Scalable targets
  /// are uniquely identified by the combination of resource ID, scalable
  /// dimension, and namespace.
  ///
  /// When you register a new scalable target, you must specify values for
  /// minimum and maximum capacity. Application Auto Scaling will not scale
  /// capacity to values that are outside of this range.
  ///
  /// To update a scalable target, specify the parameter that you want to change
  /// as well as the following parameters that identify the scalable target:
  /// resource ID, scalable dimension, and namespace. Any parameters that you
  /// don't specify are not changed by this update request.
  ///
  /// After you register a scalable target, you do not need to register it again
  /// to use other Application Auto Scaling operations. To see which resources
  /// have been registered, use DescribeScalableTargets. You can also view the
  /// scaling policies for a service namespace by using DescribeScalableTargets.
  ///
  /// If you no longer need a scalable target, you can deregister it by using
  /// DeregisterScalableTarget.
  Future<void> registerScalableTarget(
      {@required String serviceNamespace,
      @required String resourceId,
      @required String scalableDimension,
      int minCapacity,
      int maxCapacity,
      String roleArn,
      SuspendedState suspendedState}) async {}
}

class Alarm {}

class CustomizedMetricSpecification {}

class DeleteScalingPolicyResponse {}

class DeleteScheduledActionResponse {}

class DeregisterScalableTargetResponse {}

class DescribeScalableTargetsResponse {}

class DescribeScalingActivitiesResponse {}

class DescribeScalingPoliciesResponse {}

class DescribeScheduledActionsResponse {}

class MetricDimension {}

class PredefinedMetricSpecification {}

class PutScalingPolicyResponse {}

class PutScheduledActionResponse {}

class RegisterScalableTargetResponse {}

class ScalableTarget {}

class ScalableTargetAction {}

class ScalingActivity {}

class ScalingPolicy {}

class ScheduledAction {}

class StepAdjustment {}

class StepScalingPolicyConfiguration {}

class SuspendedState {}

class TargetTrackingScalingPolicyConfiguration {}
