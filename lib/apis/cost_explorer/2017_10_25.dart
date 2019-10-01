import 'package:meta/meta.dart';

/// The Cost Explorer API enables you to programmatically query your cost and
/// usage data. You can query for aggregated data such as total monthly costs or
/// total daily usage. You can also query for granular data, such as the number
/// of daily write operations for Amazon DynamoDB database tables in your
/// production environment.
///
/// Service Endpoint
///
/// The Cost Explorer API provides the following endpoint:
///
/// *    `https://ce.us-east-1.amazonaws.com`
///
///
/// For information about costs associated with the Cost Explorer API, see [AWS
/// Cost Management
/// Pricing](https://aws.amazon.com/aws-cost-management/pricing/).
class CostExplorerApi {
  /// Retrieves cost and usage metrics for your account. You can specify which
  /// cost and usage-related metric, such as `BlendedCosts` or `UsageQuantity`,
  /// that you want the request to return. You can also filter and group your
  /// data by various dimensions, such as `SERVICE` or `AZ`, in a specific time
  /// range. For a complete list of valid dimensions, see the
  /// [GetDimensionValues](http://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_GetDimensionValues.html)
  /// operation. Master accounts in an organization in AWS Organizations have
  /// access to all member accounts.
  Future<void> getCostAndUsage(DateInterval timePeriod,
      {String granularity,
      Expression filter,
      List<String> metrics,
      List<GroupDefinition> groupBy,
      String nextPageToken}) async {}

  /// Retrieves a forecast for how much Amazon Web Services predicts that you
  /// will spend over the forecast time period that you select, based on your
  /// past costs.
  Future<void> getCostForecast(
      {@required DateInterval timePeriod,
      @required String metric,
      @required String granularity,
      Expression filter,
      int predictionIntervalLevel}) async {}

  /// Retrieves all available filter values for a specified filter over a period
  /// of time. You can search the dimension values for an arbitrary string.
  Future<void> getDimensionValues(
      {String searchString,
      @required DateInterval timePeriod,
      @required String dimension,
      String context,
      String nextPageToken}) async {}

  /// Retrieves the reservation coverage for your account. This enables you to
  /// see how much of your Amazon Elastic Compute Cloud, Amazon ElastiCache,
  /// Amazon Relational Database Service, or Amazon Redshift usage is covered by
  /// a reservation. An organization's master account can see the coverage of
  /// the associated member accounts. For any time period, you can filter data
  /// about reservation usage by the following dimensions:
  ///
  /// *   AZ
  ///
  /// *   CACHE_ENGINE
  ///
  /// *   DATABASE_ENGINE
  ///
  /// *   DEPLOYMENT_OPTION
  ///
  /// *   INSTANCE_TYPE
  ///
  /// *   LINKED_ACCOUNT
  ///
  /// *   OPERATING_SYSTEM
  ///
  /// *   PLATFORM
  ///
  /// *   REGION
  ///
  /// *   SERVICE
  ///
  /// *   TAG
  ///
  /// *   TENANCY
  ///
  ///
  /// To determine valid values for a dimension, use the `GetDimensionValues`
  /// operation.
  Future<void> getReservationCoverage(DateInterval timePeriod,
      {List<GroupDefinition> groupBy,
      String granularity,
      Expression filter,
      List<String> metrics,
      String nextPageToken}) async {}

  /// Gets recommendations for which reservations to purchase. These
  /// recommendations could help you reduce your costs. Reservations provide a
  /// discounted hourly rate (up to 75%) compared to On-Demand pricing.
  ///
  /// AWS generates your recommendations by identifying your On-Demand usage
  /// during a specific time period and collecting your usage into categories
  /// that are eligible for a reservation. After AWS has these categories, it
  /// simulates every combination of reservations in each category of usage to
  /// identify the best number of each type of RI to purchase to maximize your
  /// estimated savings.
  ///
  /// For example, AWS automatically aggregates your Amazon EC2 Linux, shared
  /// tenancy, and c4 family usage in the US West (Oregon) Region and recommends
  /// that you buy size-flexible regional reservations to apply to the c4 family
  /// usage. AWS recommends the smallest size instance in an instance family.
  /// This makes it easier to purchase a size-flexible RI. AWS also shows the
  /// equal number of normalized units so that you can purchase any instance
  /// size that you want. For this example, your RI recommendation would be for
  /// `c4.large` because that is the smallest size instance in the c4 instance
  /// family.
  Future<void> getReservationPurchaseRecommendation(String service,
      {String accountId,
      String accountScope,
      String lookbackPeriodInDays,
      String termInYears,
      String paymentOption,
      ServiceSpecification serviceSpecification,
      int pageSize,
      String nextPageToken}) async {}

  /// Retrieves the reservation utilization for your account. Master accounts in
  /// an organization have access to member accounts. You can filter data by
  /// dimensions in a time period. You can use `GetDimensionValues` to determine
  /// the possible dimension values. Currently, you can group only by
  /// `SUBSCRIPTION_ID`.
  Future<void> getReservationUtilization(DateInterval timePeriod,
      {List<GroupDefinition> groupBy,
      String granularity,
      Expression filter,
      String nextPageToken}) async {}

  /// Creates recommendations that helps you save cost by identifying idle and
  /// underutilized Amazon EC2 instances.
  ///
  /// Recommendations are generated to either downsize or terminate instances,
  /// along with providing savings detail and metrics. For details on
  /// calculation and function, see [Optimizing Your Cost with Rightsizing
  /// Recommendations](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/ce-what-is.html).
  Future<void> getRightsizingRecommendation(String service,
      {Expression filter, int pageSize, String nextPageToken}) async {}

  /// Queries for available tag keys and tag values for a specified period. You
  /// can search the tag values for an arbitrary string.
  Future<void> getTags(DateInterval timePeriod,
      {String searchString, String tagKey, String nextPageToken}) async {}

  /// Retrieves a forecast for how much Amazon Web Services predicts that you
  /// will use over the forecast time period that you select, based on your past
  /// usage.
  Future<void> getUsageForecast(
      {@required DateInterval timePeriod,
      @required String metric,
      @required String granularity,
      Expression filter,
      int predictionIntervalLevel}) async {}
}

class Coverage {}

class CoverageByTime {}

class CoverageCost {}

class CoverageHours {}

class CoverageNormalizedUnits {}

class CurrentInstance {}

class DateInterval {}

class DimensionValues {}

class DimensionValuesWithAttributes {}

class Ec2InstanceDetails {}

class Ec2ResourceDetails {}

class Ec2ResourceUtilization {}

class Ec2Specification {}

class ESInstanceDetails {}

class ElastiCacheInstanceDetails {}

class Expression {}

class ForecastResult {}

class GetCostAndUsageResponse {}

class GetCostForecastResponse {}

class GetDimensionValuesResponse {}

class GetReservationCoverageResponse {}

class GetReservationPurchaseRecommendationResponse {}

class GetReservationUtilizationResponse {}

class GetRightsizingRecommendationResponse {}

class GetTagsResponse {}

class GetUsageForecastResponse {}

class Group {}

class GroupDefinition {}

class InstanceDetails {}

class MetricValue {}

class ModifyRecommendationDetail {}

class RdsInstanceDetails {}

class RedshiftInstanceDetails {}

class ReservationAggregates {}

class ReservationCoverageGroup {}

class ReservationPurchaseRecommendation {}

class ReservationPurchaseRecommendationDetail {}

class ReservationPurchaseRecommendationMetadata {}

class ReservationPurchaseRecommendationSummary {}

class ReservationUtilizationGroup {}

class ResourceDetails {}

class ResourceUtilization {}

class ResultByTime {}

class RightsizingRecommendation {}

class RightsizingRecommendationMetadata {}

class RightsizingRecommendationSummary {}

class ServiceSpecification {}

class TagValues {}

class TargetInstance {}

class TerminateRecommendationDetail {}

class UtilizationByTime {}
