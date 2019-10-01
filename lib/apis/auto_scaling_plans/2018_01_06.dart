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
/// the
/// [AWS Auto Scaling User Guide](https://docs.aws.amazon.com/autoscaling/plans/userguide/what-is-aws-auto-scaling.html).
class AutoScalingPlansApi {
  /// Creates a scaling plan.
  ///
  /// [scalingPlanName]: The name of the scaling plan. Names cannot contain
  /// vertical bars, colons, or forward slashes.
  ///
  /// [applicationSource]: A CloudFormation stack or set of tags. You can create
  /// one scaling plan per application source.
  ///
  /// [scalingInstructions]: The scaling instructions.
  Future<CreateScalingPlanResponse> createScalingPlan(
      {@required String scalingPlanName,
      @required ApplicationSource applicationSource,
      @required List<ScalingInstruction> scalingInstructions}) async {
    return CreateScalingPlanResponse.fromJson({});
  }

  /// Deletes the specified scaling plan.
  ///
  /// Deleting a scaling plan deletes the underlying ScalingInstruction for all
  /// of the scalable resources that are covered by the plan.
  ///
  /// If the plan has launched resources or has scaling activities in progress,
  /// you must delete those resources separately.
  ///
  /// [scalingPlanName]: The name of the scaling plan.
  ///
  /// [scalingPlanVersion]: The version number of the scaling plan.
  Future<DeleteScalingPlanResponse> deleteScalingPlan(
      {@required String scalingPlanName,
      @required BigInt scalingPlanVersion}) async {
    return DeleteScalingPlanResponse.fromJson({});
  }

  /// Describes the scalable resources in the specified scaling plan.
  ///
  /// [scalingPlanName]: The name of the scaling plan.
  ///
  /// [scalingPlanVersion]: The version number of the scaling plan.
  ///
  /// [maxResults]: The maximum number of scalable resources to return. The
  /// value must be between 1 and 50. The default value is 50.
  ///
  /// [nextToken]: The token for the next set of results.
  Future<DescribeScalingPlanResourcesResponse> describeScalingPlanResources(
      {@required String scalingPlanName,
      @required BigInt scalingPlanVersion,
      int maxResults,
      String nextToken}) async {
    return DescribeScalingPlanResourcesResponse.fromJson({});
  }

  /// Describes one or more of your scaling plans.
  ///
  /// [scalingPlanNames]: The names of the scaling plans (up to 10). If you
  /// specify application sources, you cannot specify scaling plan names.
  ///
  /// [scalingPlanVersion]: The version number of the scaling plan. If you
  /// specify a scaling plan version, you must also specify a scaling plan name.
  ///
  /// [applicationSources]: The sources for the applications (up to 10). If you
  /// specify scaling plan names, you cannot specify application sources.
  ///
  /// [maxResults]: The maximum number of scalable resources to return. This
  /// value can be between 1 and 50. The default value is 50.
  ///
  /// [nextToken]: The token for the next set of results.
  Future<DescribeScalingPlansResponse> describeScalingPlans(
      {List<String> scalingPlanNames,
      BigInt scalingPlanVersion,
      List<ApplicationSource> applicationSources,
      int maxResults,
      String nextToken}) async {
    return DescribeScalingPlansResponse.fromJson({});
  }

  /// Retrieves the forecast data for a scalable resource.
  ///
  /// Capacity forecasts are represented as predicted values, or data points,
  /// that are calculated using historical data points from a specified
  /// CloudWatch load metric. Data points are available for up to 56 days.
  ///
  /// [scalingPlanName]: The name of the scaling plan.
  ///
  /// [scalingPlanVersion]: The version number of the scaling plan.
  ///
  /// [serviceNamespace]: The namespace of the AWS service.
  ///
  /// [resourceId]: The ID of the resource. This string consists of the resource
  /// type and unique identifier.
  ///
  /// *   Auto Scaling group - The resource type is `autoScalingGroup` and the
  /// unique identifier is the name of the Auto Scaling group. Example:
  /// `autoScalingGroup/my-asg`.
  ///
  /// *   ECS service - The resource type is `service` and the unique identifier
  /// is the cluster name and service name. Example:
  /// `service/default/sample-webapp`.
  ///
  /// *   Spot Fleet request - The resource type is `spot-fleet-request` and the
  /// unique identifier is the Spot Fleet request ID. Example:
  /// `spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE`.
  ///
  /// *   DynamoDB table - The resource type is `table` and the unique
  /// identifier is the resource ID. Example: `table/my-table`.
  ///
  /// *   DynamoDB global secondary index - The resource type is `index` and the
  /// unique identifier is the resource ID. Example:
  /// `table/my-table/index/my-table-index`.
  ///
  /// *   Aurora DB cluster - The resource type is `cluster` and the unique
  /// identifier is the cluster name. Example: `cluster:my-db-cluster`.
  ///
  /// [scalableDimension]: The scalable dimension for the resource.
  ///
  /// [forecastDataType]: The type of forecast data to get.
  ///
  /// *    `LoadForecast`: The load metric forecast.
  ///
  /// *    `CapacityForecast`: The capacity forecast.
  ///
  /// *    `ScheduledActionMinCapacity`: The minimum capacity for each scheduled
  /// scaling action. This data is calculated as the larger of two values: the
  /// capacity forecast or the minimum capacity in the scaling instruction.
  ///
  /// *    `ScheduledActionMaxCapacity`: The maximum capacity for each scheduled
  /// scaling action. The calculation used is determined by the predictive
  /// scaling maximum capacity behavior setting in the scaling instruction.
  ///
  /// [startTime]: The inclusive start time of the time range for the forecast
  /// data to get. The date and time can be at most 56 days before the current
  /// date and time.
  ///
  /// [endTime]: The exclusive end time of the time range for the forecast data
  /// to get. The maximum time duration between the start and end time is seven
  /// days.
  ///
  /// Although this parameter can accept a date and time that is more than two
  /// days in the future, the availability of forecast data has limits. AWS Auto
  /// Scaling only issues forecasts for periods of two days in advance.
  Future<GetScalingPlanResourceForecastDataResponse>
      getScalingPlanResourceForecastData(
          {@required String scalingPlanName,
          @required BigInt scalingPlanVersion,
          @required String serviceNamespace,
          @required String resourceId,
          @required String scalableDimension,
          @required String forecastDataType,
          @required DateTime startTime,
          @required DateTime endTime}) async {
    return GetScalingPlanResourceForecastDataResponse.fromJson({});
  }

  /// Updates the specified scaling plan.
  ///
  /// You cannot update a scaling plan if it is in the process of being created,
  /// updated, or deleted.
  ///
  /// [scalingPlanName]: The name of the scaling plan.
  ///
  /// [scalingPlanVersion]: The version number of the scaling plan.
  ///
  /// [applicationSource]: A CloudFormation stack or set of tags.
  ///
  /// [scalingInstructions]: The scaling instructions.
  Future<UpdateScalingPlanResponse> updateScalingPlan(
      {@required String scalingPlanName,
      @required BigInt scalingPlanVersion,
      ApplicationSource applicationSource,
      List<ScalingInstruction> scalingInstructions}) async {
    return UpdateScalingPlanResponse.fromJson({});
  }
}

/// Represents an application source.
class ApplicationSource {
  /// The Amazon Resource Name (ARN) of a AWS CloudFormation stack.
  final String cloudFormationStackArn;

  /// A set of tags (up to 50).
  final List<TagFilter> tagFilters;

  ApplicationSource({
    this.cloudFormationStackArn,
    this.tagFilters,
  });
  static ApplicationSource fromJson(Map<String, dynamic> json) =>
      ApplicationSource();
}

class CreateScalingPlanResponse {
  /// The version number of the scaling plan. This value is always 1.
  ///
  /// Currently, you cannot specify multiple scaling plan versions.
  final BigInt scalingPlanVersion;

  CreateScalingPlanResponse({
    @required this.scalingPlanVersion,
  });
  static CreateScalingPlanResponse fromJson(Map<String, dynamic> json) =>
      CreateScalingPlanResponse();
}

/// Represents a CloudWatch metric of your choosing that can be used for
/// predictive scaling.
///
/// For predictive scaling to work with a customized load metric specification,
/// AWS Auto Scaling needs access to the `Sum` and `Average` statistics that
/// CloudWatch computes from metric data. Statistics are calculations used to
/// aggregate data over specified time periods.
///
/// When you choose a load metric, make sure that the required `Sum` and
/// `Average` statistics for your metric are available in CloudWatch and that
/// they provide relevant data for predictive scaling. The `Sum` statistic must
/// represent the total load on the resource, and the `Average` statistic must
/// represent the average load per capacity unit of the resource. For example,
/// there is a metric that counts the number of requests processed by your Auto
/// Scaling group. If the `Sum` statistic represents the total request count
/// processed by the group, then the `Average` statistic for the specified
/// metric must represent the average request count processed by each instance
/// of the group.
///
/// For information about terminology, available metrics, or how to publish new
/// metrics, see
/// [Amazon CloudWatch Concepts](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_concepts.html)
/// in the _Amazon CloudWatch User Guide_.
class CustomizedLoadMetricSpecification {
  /// The name of the metric.
  final String metricName;

  /// The namespace of the metric.
  final String namespace;

  /// The dimensions of the metric.
  ///
  /// Conditional: If you published your metric with dimensions, you must
  /// specify the same dimensions in your customized load metric specification.
  final List<MetricDimension> dimensions;

  /// The statistic of the metric. Currently, the value must always be `Sum`.
  final String statistic;

  /// The unit of the metric.
  final String unit;

  CustomizedLoadMetricSpecification({
    @required this.metricName,
    @required this.namespace,
    this.dimensions,
    @required this.statistic,
    this.unit,
  });
  static CustomizedLoadMetricSpecification fromJson(
          Map<String, dynamic> json) =>
      CustomizedLoadMetricSpecification();
}

/// Represents a CloudWatch metric of your choosing that can be used for dynamic
/// scaling as part of a target tracking scaling policy.
///
/// To create your customized scaling metric specification:
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
class CustomizedScalingMetricSpecification {
  /// The name of the metric.
  final String metricName;

  /// The namespace of the metric.
  final String namespace;

  /// The dimensions of the metric.
  ///
  /// Conditional: If you published your metric with dimensions, you must
  /// specify the same dimensions in your customized scaling metric
  /// specification.
  final List<MetricDimension> dimensions;

  /// The statistic of the metric.
  final String statistic;

  /// The unit of the metric.
  final String unit;

  CustomizedScalingMetricSpecification({
    @required this.metricName,
    @required this.namespace,
    this.dimensions,
    @required this.statistic,
    this.unit,
  });
  static CustomizedScalingMetricSpecification fromJson(
          Map<String, dynamic> json) =>
      CustomizedScalingMetricSpecification();
}

/// Represents a single value in the forecast data used for predictive scaling.
class Datapoint {
  /// The time stamp for the data point in UTC format.
  final DateTime timestamp;

  /// The value of the data point.
  final double value;

  Datapoint({
    this.timestamp,
    this.value,
  });
  static Datapoint fromJson(Map<String, dynamic> json) => Datapoint();
}

class DeleteScalingPlanResponse {
  DeleteScalingPlanResponse();
  static DeleteScalingPlanResponse fromJson(Map<String, dynamic> json) =>
      DeleteScalingPlanResponse();
}

class DescribeScalingPlanResourcesResponse {
  /// Information about the scalable resources.
  final List<ScalingPlanResource> scalingPlanResources;

  /// The token required to get the next set of results. This value is `null` if
  /// there are no more results to return.
  final String nextToken;

  DescribeScalingPlanResourcesResponse({
    this.scalingPlanResources,
    this.nextToken,
  });
  static DescribeScalingPlanResourcesResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeScalingPlanResourcesResponse();
}

class DescribeScalingPlansResponse {
  /// Information about the scaling plans.
  final List<ScalingPlan> scalingPlans;

  /// The token required to get the next set of results. This value is `null` if
  /// there are no more results to return.
  final String nextToken;

  DescribeScalingPlansResponse({
    this.scalingPlans,
    this.nextToken,
  });
  static DescribeScalingPlansResponse fromJson(Map<String, dynamic> json) =>
      DescribeScalingPlansResponse();
}

class GetScalingPlanResourceForecastDataResponse {
  /// The data points to return.
  final List<Datapoint> datapoints;

  GetScalingPlanResourceForecastDataResponse({
    @required this.datapoints,
  });
  static GetScalingPlanResourceForecastDataResponse fromJson(
          Map<String, dynamic> json) =>
      GetScalingPlanResourceForecastDataResponse();
}

/// Represents a dimension for a customized metric.
class MetricDimension {
  /// The name of the dimension.
  final String name;

  /// The value of the dimension.
  final String value;

  MetricDimension({
    @required this.name,
    @required this.value,
  });
  static MetricDimension fromJson(Map<String, dynamic> json) =>
      MetricDimension();
}

/// Represents a predefined metric that can be used for predictive scaling.
class PredefinedLoadMetricSpecification {
  /// The metric type.
  final String predefinedLoadMetricType;

  /// Identifies the resource associated with the metric type. You can't specify
  /// a resource label unless the metric type is `ALBRequestCountPerTarget` and
  /// there is a target group for an Application Load Balancer attached to the
  /// Auto Scaling group.
  ///
  /// The format is
  /// app/<load-balancer-name>/<load-balancer-id>/targetgroup/<target-group-name>/<target-group-id>,
  /// where:
  ///
  /// *   app/<load-balancer-name>/<load-balancer-id> is the final portion of
  /// the load balancer ARN.
  ///
  /// *   targetgroup/<target-group-name>/<target-group-id> is the final portion
  /// of the target group ARN.
  final String resourceLabel;

  PredefinedLoadMetricSpecification({
    @required this.predefinedLoadMetricType,
    this.resourceLabel,
  });
  static PredefinedLoadMetricSpecification fromJson(
          Map<String, dynamic> json) =>
      PredefinedLoadMetricSpecification();
}

/// Represents a predefined metric that can be used for dynamic scaling as part
/// of a target tracking scaling policy.
class PredefinedScalingMetricSpecification {
  /// The metric type. The `ALBRequestCountPerTarget` metric type applies only
  /// to Auto Scaling groups, Spot Fleet requests, and ECS services.
  final String predefinedScalingMetricType;

  /// Identifies the resource associated with the metric type. You can't specify
  /// a resource label unless the metric type is `ALBRequestCountPerTarget` and
  /// there is a target group for an Application Load Balancer attached to the
  /// Auto Scaling group, Spot Fleet request, or ECS service.
  ///
  /// The format is
  /// app/<load-balancer-name>/<load-balancer-id>/targetgroup/<target-group-name>/<target-group-id>,
  /// where:
  ///
  /// *   app/<load-balancer-name>/<load-balancer-id> is the final portion of
  /// the load balancer ARN.
  ///
  /// *   targetgroup/<target-group-name>/<target-group-id> is the final portion
  /// of the target group ARN.
  final String resourceLabel;

  PredefinedScalingMetricSpecification({
    @required this.predefinedScalingMetricType,
    this.resourceLabel,
  });
  static PredefinedScalingMetricSpecification fromJson(
          Map<String, dynamic> json) =>
      PredefinedScalingMetricSpecification();
}

/// Describes a scaling instruction for a scalable resource.
///
/// The scaling instruction is used in combination with a scaling plan, which is
/// a set of instructions for configuring dynamic scaling and predictive scaling
/// for the scalable resources in your application. Each scaling instruction
/// applies to one resource.
///
/// AWS Auto Scaling creates target tracking scaling policies based on the
/// scaling instructions. Target tracking scaling policies adjust the capacity
/// of your scalable resource as required to maintain resource utilization at
/// the target value that you specified.
///
/// AWS Auto Scaling also configures predictive scaling for your Amazon EC2 Auto
/// Scaling groups using a subset of parameters, including the load metric, the
/// scaling metric, the target value for the scaling metric, the predictive
/// scaling mode (forecast and scale or forecast only), and the desired behavior
/// when the forecast capacity exceeds the maximum capacity of the resource.
/// With predictive scaling, AWS Auto Scaling generates forecasts with traffic
/// predictions for the two days ahead and schedules scaling actions that
/// proactively add and remove resource capacity to match the forecast.
///
/// We recommend waiting a minimum of 24 hours after creating an Auto Scaling
/// group to configure predictive scaling. At minimum, there must be 24 hours of
/// historical data to generate a forecast.
///
/// For more information, see
/// [Getting Started with AWS Auto Scaling](https://docs.aws.amazon.com/autoscaling/plans/userguide/auto-scaling-getting-started.html).
class ScalingInstruction {
  /// The namespace of the AWS service.
  final String serviceNamespace;

  /// The ID of the resource. This string consists of the resource type and
  /// unique identifier.
  ///
  /// *   Auto Scaling group - The resource type is `autoScalingGroup` and the
  /// unique identifier is the name of the Auto Scaling group. Example:
  /// `autoScalingGroup/my-asg`.
  ///
  /// *   ECS service - The resource type is `service` and the unique identifier
  /// is the cluster name and service name. Example:
  /// `service/default/sample-webapp`.
  ///
  /// *   Spot Fleet request - The resource type is `spot-fleet-request` and the
  /// unique identifier is the Spot Fleet request ID. Example:
  /// `spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE`.
  ///
  /// *   DynamoDB table - The resource type is `table` and the unique
  /// identifier is the resource ID. Example: `table/my-table`.
  ///
  /// *   DynamoDB global secondary index - The resource type is `index` and the
  /// unique identifier is the resource ID. Example:
  /// `table/my-table/index/my-table-index`.
  ///
  /// *   Aurora DB cluster - The resource type is `cluster` and the unique
  /// identifier is the cluster name. Example: `cluster:my-db-cluster`.
  final String resourceId;

  /// The scalable dimension associated with the resource.
  ///
  /// *    `autoscaling:autoScalingGroup:DesiredCapacity` - The desired capacity
  /// of an Auto Scaling group.
  ///
  /// *    `ecs:service:DesiredCount` - The desired task count of an ECS
  /// service.
  ///
  /// *    `ec2:spot-fleet-request:TargetCapacity` - The target capacity of a
  /// Spot Fleet request.
  ///
  /// *    `dynamodb:table:ReadCapacityUnits` - The provisioned read capacity
  /// for a DynamoDB table.
  ///
  /// *    `dynamodb:table:WriteCapacityUnits` - The provisioned write capacity
  /// for a DynamoDB table.
  ///
  /// *    `dynamodb:index:ReadCapacityUnits` - The provisioned read capacity
  /// for a DynamoDB global secondary index.
  ///
  /// *    `dynamodb:index:WriteCapacityUnits` - The provisioned write capacity
  /// for a DynamoDB global secondary index.
  ///
  /// *    `rds:cluster:ReadReplicaCount` - The count of Aurora Replicas in an
  /// Aurora DB cluster. Available for Aurora MySQL-compatible edition and
  /// Aurora PostgreSQL-compatible edition.
  final String scalableDimension;

  /// The minimum capacity of the resource.
  final int minCapacity;

  /// The maximum capacity of the resource. The exception to this upper limit is
  /// if you specify a non-default setting for
  /// **PredictiveScalingMaxCapacityBehavior**.
  final int maxCapacity;

  /// The structure that defines new target tracking configurations (up to 10).
  /// Each of these structures includes a specific scaling metric and a target
  /// value for the metric, along with various parameters to use with dynamic
  /// scaling.
  ///
  /// With predictive scaling and dynamic scaling, the resource scales based on
  /// the target tracking configuration that provides the largest capacity for
  /// both scale in and scale out.
  ///
  /// Condition: The scaling metric must be unique across target tracking
  /// configurations.
  final List<TargetTrackingConfiguration> targetTrackingConfigurations;

  /// The predefined load metric to use for predictive scaling. This parameter
  /// or a **CustomizedLoadMetricSpecification** is required when configuring
  /// predictive scaling, and cannot be used otherwise.
  final PredefinedLoadMetricSpecification predefinedLoadMetricSpecification;

  /// The customized load metric to use for predictive scaling. This parameter
  /// or a **PredefinedLoadMetricSpecification** is required when configuring
  /// predictive scaling, and cannot be used otherwise.
  final CustomizedLoadMetricSpecification customizedLoadMetricSpecification;

  /// The amount of time, in seconds, to buffer the run time of scheduled
  /// scaling actions when scaling out. For example, if the forecast says to add
  /// capacity at 10:00 AM, and the buffer time is 5 minutes, then the run time
  /// of the corresponding scheduled scaling action will be 9:55 AM. The
  /// intention is to give resources time to be provisioned. For example, it can
  /// take a few minutes to launch an EC2 instance. The actual amount of time
  /// required depends on several factors, such as the size of the instance and
  /// whether there are startup scripts to complete.
  ///
  /// The value must be less than the forecast interval duration of 3600 seconds
  /// (60 minutes). The default is 300 seconds.
  ///
  /// Only valid when configuring predictive scaling.
  final int scheduledActionBufferTime;

  /// Defines the behavior that should be applied if the forecast capacity
  /// approaches or exceeds the maximum capacity specified for the resource. The
  /// default value is `SetForecastCapacityToMaxCapacity`.
  ///
  /// The following are possible values:
  ///
  /// *    `SetForecastCapacityToMaxCapacity` - AWS Auto Scaling cannot scale
  /// resource capacity higher than the maximum capacity. The maximum capacity
  /// is enforced as a hard limit.
  ///
  /// *    `SetMaxCapacityToForecastCapacity` - AWS Auto Scaling may scale
  /// resource capacity higher than the maximum capacity to equal but not exceed
  /// forecast capacity.
  ///
  /// *    `SetMaxCapacityAboveForecastCapacity` - AWS Auto Scaling may scale
  /// resource capacity higher than the maximum capacity by a specified buffer
  /// value. The intention is to give the target tracking scaling policy extra
  /// capacity if unexpected traffic occurs.
  ///
  ///
  /// Only valid when configuring predictive scaling.
  final String predictiveScalingMaxCapacityBehavior;

  /// The size of the capacity buffer to use when the forecast capacity is close
  /// to or exceeds the maximum capacity. The value is specified as a percentage
  /// relative to the forecast capacity. For example, if the buffer is 10, this
  /// means a 10 percent buffer, such that if the forecast capacity is 50, and
  /// the maximum capacity is 40, then the effective maximum capacity is 55.
  ///
  /// Only valid when configuring predictive scaling. Required if the
  /// **PredictiveScalingMaxCapacityBehavior** is set to
  /// `SetMaxCapacityAboveForecastCapacity`, and cannot be used otherwise.
  ///
  /// The range is 1-100.
  final int predictiveScalingMaxCapacityBuffer;

  /// The predictive scaling mode. The default value is `ForecastAndScale`.
  /// Otherwise, AWS Auto Scaling forecasts capacity but does not create any
  /// scheduled scaling actions based on the capacity forecast.
  final String predictiveScalingMode;

  /// Controls whether a resource's externally created scaling policies are kept
  /// or replaced.
  ///
  /// The default value is `KeepExternalPolicies`. If the parameter is set to
  /// `ReplaceExternalPolicies`, any scaling policies that are external to AWS
  /// Auto Scaling are deleted and new target tracking scaling policies created.
  ///
  /// Only valid when configuring dynamic scaling.
  ///
  /// Condition: The number of existing policies to be replaced must be less
  /// than or equal to 50. If there are more than 50 policies to be replaced,
  /// AWS Auto Scaling keeps all existing policies and does not create new ones.
  final String scalingPolicyUpdateBehavior;

  /// Controls whether dynamic scaling by AWS Auto Scaling is disabled. When
  /// dynamic scaling is enabled, AWS Auto Scaling creates target tracking
  /// scaling policies based on the specified target tracking configurations.
  ///
  /// The default is enabled (`false`).
  final bool disableDynamicScaling;

  ScalingInstruction({
    @required this.serviceNamespace,
    @required this.resourceId,
    @required this.scalableDimension,
    @required this.minCapacity,
    @required this.maxCapacity,
    @required this.targetTrackingConfigurations,
    this.predefinedLoadMetricSpecification,
    this.customizedLoadMetricSpecification,
    this.scheduledActionBufferTime,
    this.predictiveScalingMaxCapacityBehavior,
    this.predictiveScalingMaxCapacityBuffer,
    this.predictiveScalingMode,
    this.scalingPolicyUpdateBehavior,
    this.disableDynamicScaling,
  });
  static ScalingInstruction fromJson(Map<String, dynamic> json) =>
      ScalingInstruction();
}

/// Represents a scaling plan.
class ScalingPlan {
  /// The name of the scaling plan.
  final String scalingPlanName;

  /// The version number of the scaling plan.
  final BigInt scalingPlanVersion;

  /// The application source.
  final ApplicationSource applicationSource;

  /// The scaling instructions.
  final List<ScalingInstruction> scalingInstructions;

  /// The status of the scaling plan.
  ///
  /// *    `Active` - The scaling plan is active.
  ///
  /// *    `ActiveWithProblems` - The scaling plan is active, but the scaling
  /// configuration for one or more resources could not be applied.
  ///
  /// *    `CreationInProgress` - The scaling plan is being created.
  ///
  /// *    `CreationFailed` - The scaling plan could not be created.
  ///
  /// *    `DeletionInProgress` - The scaling plan is being deleted.
  ///
  /// *    `DeletionFailed` - The scaling plan could not be deleted.
  ///
  /// *    `UpdateInProgress` - The scaling plan is being updated.
  ///
  /// *    `UpdateFailed` - The scaling plan could not be updated.
  final String statusCode;

  /// A simple message about the current status of the scaling plan.
  final String statusMessage;

  /// The Unix time stamp when the scaling plan entered the current status.
  final DateTime statusStartTime;

  /// The Unix time stamp when the scaling plan was created.
  final DateTime creationTime;

  ScalingPlan({
    @required this.scalingPlanName,
    @required this.scalingPlanVersion,
    @required this.applicationSource,
    @required this.scalingInstructions,
    @required this.statusCode,
    this.statusMessage,
    this.statusStartTime,
    this.creationTime,
  });
  static ScalingPlan fromJson(Map<String, dynamic> json) => ScalingPlan();
}

/// Represents a scalable resource.
class ScalingPlanResource {
  /// The name of the scaling plan.
  final String scalingPlanName;

  /// The version number of the scaling plan.
  final BigInt scalingPlanVersion;

  /// The namespace of the AWS service.
  final String serviceNamespace;

  /// The ID of the resource. This string consists of the resource type and
  /// unique identifier.
  ///
  /// *   Auto Scaling group - The resource type is `autoScalingGroup` and the
  /// unique identifier is the name of the Auto Scaling group. Example:
  /// `autoScalingGroup/my-asg`.
  ///
  /// *   ECS service - The resource type is `service` and the unique identifier
  /// is the cluster name and service name. Example:
  /// `service/default/sample-webapp`.
  ///
  /// *   Spot Fleet request - The resource type is `spot-fleet-request` and the
  /// unique identifier is the Spot Fleet request ID. Example:
  /// `spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE`.
  ///
  /// *   DynamoDB table - The resource type is `table` and the unique
  /// identifier is the resource ID. Example: `table/my-table`.
  ///
  /// *   DynamoDB global secondary index - The resource type is `index` and the
  /// unique identifier is the resource ID. Example:
  /// `table/my-table/index/my-table-index`.
  ///
  /// *   Aurora DB cluster - The resource type is `cluster` and the unique
  /// identifier is the cluster name. Example: `cluster:my-db-cluster`.
  final String resourceId;

  /// The scalable dimension for the resource.
  ///
  /// *    `autoscaling:autoScalingGroup:DesiredCapacity` - The desired capacity
  /// of an Auto Scaling group.
  ///
  /// *    `ecs:service:DesiredCount` - The desired task count of an ECS
  /// service.
  ///
  /// *    `ec2:spot-fleet-request:TargetCapacity` - The target capacity of a
  /// Spot Fleet request.
  ///
  /// *    `dynamodb:table:ReadCapacityUnits` - The provisioned read capacity
  /// for a DynamoDB table.
  ///
  /// *    `dynamodb:table:WriteCapacityUnits` - The provisioned write capacity
  /// for a DynamoDB table.
  ///
  /// *    `dynamodb:index:ReadCapacityUnits` - The provisioned read capacity
  /// for a DynamoDB global secondary index.
  ///
  /// *    `dynamodb:index:WriteCapacityUnits` - The provisioned write capacity
  /// for a DynamoDB global secondary index.
  ///
  /// *    `rds:cluster:ReadReplicaCount` - The count of Aurora Replicas in an
  /// Aurora DB cluster. Available for Aurora MySQL-compatible edition and
  /// Aurora PostgreSQL-compatible edition.
  final String scalableDimension;

  /// The scaling policies.
  final List<ScalingPolicy> scalingPolicies;

  /// The scaling status of the resource.
  ///
  /// *    `Active` - The scaling configuration is active.
  ///
  /// *    `Inactive` - The scaling configuration is not active because the
  /// scaling plan is being created or the scaling configuration could not be
  /// applied. Check the status message for more information.
  ///
  /// *    `PartiallyActive` - The scaling configuration is partially active
  /// because the scaling plan is being created or deleted or the scaling
  /// configuration could not be fully applied. Check the status message for
  /// more information.
  final String scalingStatusCode;

  /// A simple message about the current scaling status of the resource.
  final String scalingStatusMessage;

  ScalingPlanResource({
    @required this.scalingPlanName,
    @required this.scalingPlanVersion,
    @required this.serviceNamespace,
    @required this.resourceId,
    @required this.scalableDimension,
    this.scalingPolicies,
    @required this.scalingStatusCode,
    this.scalingStatusMessage,
  });
  static ScalingPlanResource fromJson(Map<String, dynamic> json) =>
      ScalingPlanResource();
}

/// Represents a scaling policy.
class ScalingPolicy {
  /// The name of the scaling policy.
  final String policyName;

  /// The type of scaling policy.
  final String policyType;

  /// The target tracking scaling policy. Includes support for predefined or
  /// customized metrics.
  final TargetTrackingConfiguration targetTrackingConfiguration;

  ScalingPolicy({
    @required this.policyName,
    @required this.policyType,
    this.targetTrackingConfiguration,
  });
  static ScalingPolicy fromJson(Map<String, dynamic> json) => ScalingPolicy();
}

/// Represents a tag.
class TagFilter {
  /// The tag key.
  final String key;

  /// The tag values (0 to 20).
  final List<String> values;

  TagFilter({
    this.key,
    this.values,
  });
  static TagFilter fromJson(Map<String, dynamic> json) => TagFilter();
}

/// Describes a target tracking configuration to use with AWS Auto Scaling. Used
/// with ScalingInstruction and ScalingPolicy.
class TargetTrackingConfiguration {
  /// A predefined metric. You can specify either a predefined metric or a
  /// customized metric.
  final PredefinedScalingMetricSpecification
      predefinedScalingMetricSpecification;

  /// A customized metric. You can specify either a predefined metric or a
  /// customized metric.
  final CustomizedScalingMetricSpecification
      customizedScalingMetricSpecification;

  /// The target value for the metric. The range is 8.515920e-109 to
  /// 1.174271e+108 (Base 10) or 2e-360 to 2e360 (Base 2).
  final double targetValue;

  /// Indicates whether scale in by the target tracking scaling policy is
  /// disabled. If the value is `true`, scale in is disabled and the target
  /// tracking scaling policy doesn't remove capacity from the scalable
  /// resource. Otherwise, scale in is enabled and the target tracking scaling
  /// policy can remove capacity from the scalable resource.
  ///
  /// The default value is `false`.
  final bool disableScaleIn;

  /// The amount of time, in seconds, after a scale-out activity completes
  /// before another scale-out activity can start. This value is not used if the
  /// scalable resource is an Auto Scaling group.
  ///
  /// While the cooldown period is in effect, the capacity that has been added
  /// by the previous scale-out event that initiated the cooldown is calculated
  /// as part of the desired capacity for the next scale out. The intention is
  /// to continuously (but not excessively) scale out.
  final int scaleOutCooldown;

  /// The amount of time, in seconds, after a scale in activity completes before
  /// another scale in activity can start. This value is not used if the
  /// scalable resource is an Auto Scaling group.
  ///
  /// The cooldown period is used to block subsequent scale in requests until it
  /// has expired. The intention is to scale in conservatively to protect your
  /// application's availability. However, if another alarm triggers a scale-out
  /// policy during the cooldown period after a scale-in, AWS Auto Scaling
  /// scales out your scalable target immediately.
  final int scaleInCooldown;

  /// The estimated time, in seconds, until a newly launched instance can
  /// contribute to the CloudWatch metrics. This value is used only if the
  /// resource is an Auto Scaling group.
  final int estimatedInstanceWarmup;

  TargetTrackingConfiguration({
    this.predefinedScalingMetricSpecification,
    this.customizedScalingMetricSpecification,
    @required this.targetValue,
    this.disableScaleIn,
    this.scaleOutCooldown,
    this.scaleInCooldown,
    this.estimatedInstanceWarmup,
  });
  static TargetTrackingConfiguration fromJson(Map<String, dynamic> json) =>
      TargetTrackingConfiguration();
}

class UpdateScalingPlanResponse {
  UpdateScalingPlanResponse();
  static UpdateScalingPlanResponse fromJson(Map<String, dynamic> json) =>
      UpdateScalingPlanResponse();
}
