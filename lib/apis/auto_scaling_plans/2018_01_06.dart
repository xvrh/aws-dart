import 'package:meta/meta.dart';

/// AWS Auto Scaling
///
/// Use AWS Auto Scaling to quickly discover all the scalable AWS resources for
/// your application and configure dynamic scaling and predictive scaling for
/// your resources using scaling plans. Use this service in conjunction with the
/// Amazon EC2 Auto Scaling, Application Auto Scaling, Amazon CloudWatch, and
/// AWS CloudFormation services.
///
/// Currently, predictive scaling is only available for Amazon EC2 Auto Scaling
/// groups.
///
/// For more information about AWS Auto Scaling, including information about
/// granting IAM users required permissions for AWS Auto Scaling actions, see
/// the [AWS Auto Scaling User
/// Guide](https://docs.aws.amazon.com/autoscaling/plans/userguide/what-is-aws-auto-scaling.html).
class AutoScalingPlansApi {
  /// Creates a scaling plan.
  Future<void> createScalingPlan(
      {@required String scalingPlanName,
      @required ApplicationSource applicationSource,
      @required List<ScalingInstruction> scalingInstructions}) async {}

  /// Deletes the specified scaling plan.
  ///
  /// Deleting a scaling plan deletes the underlying ScalingInstruction for all
  /// of the scalable resources that are covered by the plan.
  ///
  /// If the plan has launched resources or has scaling activities in progress,
  /// you must delete those resources separately.
  Future<void> deleteScalingPlan(
      {@required String scalingPlanName,
      @required BigInt scalingPlanVersion}) async {}

  /// Describes the scalable resources in the specified scaling plan.
  Future<void> describeScalingPlanResources(
      {@required String scalingPlanName,
      @required BigInt scalingPlanVersion,
      int maxResults,
      String nextToken}) async {}

  /// Describes one or more of your scaling plans.
  Future<void> describeScalingPlans(
      {List<String> scalingPlanNames,
      BigInt scalingPlanVersion,
      List<ApplicationSource> applicationSources,
      int maxResults,
      String nextToken}) async {}

  /// Retrieves the forecast data for a scalable resource.
  ///
  /// Capacity forecasts are represented as predicted values, or data points,
  /// that are calculated using historical data points from a specified
  /// CloudWatch load metric. Data points are available for up to 56 days.
  Future<void> getScalingPlanResourceForecastData(
      {@required String scalingPlanName,
      @required BigInt scalingPlanVersion,
      @required String serviceNamespace,
      @required String resourceId,
      @required String scalableDimension,
      @required String forecastDataType,
      @required DateTime startTime,
      @required DateTime endTime}) async {}

  /// Updates the specified scaling plan.
  ///
  /// You cannot update a scaling plan if it is in the process of being created,
  /// updated, or deleted.
  Future<void> updateScalingPlan(
      {@required String scalingPlanName,
      @required BigInt scalingPlanVersion,
      ApplicationSource applicationSource,
      List<ScalingInstruction> scalingInstructions}) async {}
}

class ApplicationSource {}

class CreateScalingPlanResponse {}

class CustomizedLoadMetricSpecification {}

class CustomizedScalingMetricSpecification {}

class Datapoint {}

class DeleteScalingPlanResponse {}

class DescribeScalingPlanResourcesResponse {}

class DescribeScalingPlansResponse {}

class GetScalingPlanResourceForecastDataResponse {}

class MetricDimension {}

class PredefinedLoadMetricSpecification {}

class PredefinedScalingMetricSpecification {}

class ScalingInstruction {}

class ScalingPlan {}

class ScalingPlanResource {}

class ScalingPolicy {}

class TagFilter {}

class TargetTrackingConfiguration {}

class UpdateScalingPlanResponse {}
