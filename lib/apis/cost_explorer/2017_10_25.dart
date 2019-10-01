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
/// For information about costs associated with the Cost Explorer API, see
/// [AWS Cost Management Pricing](https://aws.amazon.com/aws-cost-management/pricing/).
class CostExplorerApi {
  /// Retrieves cost and usage metrics for your account. You can specify which
  /// cost and usage-related metric, such as `BlendedCosts` or `UsageQuantity`,
  /// that you want the request to return. You can also filter and group your
  /// data by various dimensions, such as `SERVICE` or `AZ`, in a specific time
  /// range. For a complete list of valid dimensions, see the
  /// [GetDimensionValues](http://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_GetDimensionValues.html)
  /// operation. Master accounts in an organization in AWS Organizations have
  /// access to all member accounts.
  ///
  /// [timePeriod]: Sets the start and end dates for retrieving AWS costs. The
  /// start date is inclusive, but the end date is exclusive. For example, if
  /// `start` is `2017-01-01` and `end` is `2017-05-01`, then the cost and usage
  /// data is retrieved from `2017-01-01` up to and including `2017-04-30` but
  /// not including `2017-05-01`.
  ///
  /// [granularity]: Sets the AWS cost granularity to `MONTHLY` or `DAILY`. If
  /// `Granularity` isn't set, the response object doesn't include the
  /// `Granularity`, either `MONTHLY` or `DAILY`.
  ///
  /// The `GetCostAndUsageRequest` operation supports only `DAILY` and `MONTHLY`
  /// granularities.
  ///
  /// [filter]: Filters AWS costs by different dimensions. For example, you can
  /// specify `SERVICE` and `LINKED_ACCOUNT` and get the costs that are
  /// associated with that account's usage of that service. You can nest
  /// `Expression` objects to define any combination of dimension filters. For
  /// more information, see
  /// [Expression](http://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_Expression.html).
  ///
  /// [metrics]: Which metrics are returned in the query. For more information
  /// about blended and unblended rates, see
  /// [Why does the "blended" annotation appear on some line items in my bill?](https://aws.amazon.com/premiumsupport/knowledge-center/blended-rates-intro/).
  ///
  /// Valid values are `AmortizedCost`, `BlendedCost`, `NetAmortizedCost`,
  /// `NetUnblendedCost`, `NormalizedUsageAmount`, `UnblendedCost`, and
  /// `UsageQuantity`.
  ///
  ///  If you return the `UsageQuantity` metric, the service aggregates all
  /// usage numbers without taking into account the units. For example, if you
  /// aggregate `usageQuantity` across all of Amazon EC2, the results aren't
  /// meaningful because Amazon EC2 compute hours and data transfer are measured
  /// in different units (for example, hours vs. GB). To get more meaningful
  /// `UsageQuantity` metrics, filter by `UsageType` or `UsageTypeGroups`.
  ///
  ///  `Metrics` is required for `GetCostAndUsage` requests.
  ///
  /// [groupBy]: You can group AWS costs using up to two different groups,
  /// either dimensions, tag keys, or both.
  ///
  /// When you group by tag key, you get all tag values, including empty
  /// strings.
  ///
  /// Valid values are `AZ`, `INSTANCE_TYPE`, `LEGAL_ENTITY_NAME`,
  /// `LINKED_ACCOUNT`, `OPERATION`, `PLATFORM`, `PURCHASE_TYPE`, `SERVICE`,
  /// `TAGS`, `TENANCY`, and `USAGE_TYPE`.
  ///
  /// [nextPageToken]: The token to retrieve the next set of results. AWS
  /// provides the token when the response from a previous call has more results
  /// than the maximum page size.
  Future<GetCostAndUsageResponse> getCostAndUsage(DateInterval timePeriod,
      {String granularity,
      Expression filter,
      List<String> metrics,
      List<GroupDefinition> groupBy,
      String nextPageToken}) async {
    return GetCostAndUsageResponse.fromJson({});
  }

  /// Retrieves a forecast for how much Amazon Web Services predicts that you
  /// will spend over the forecast time period that you select, based on your
  /// past costs.
  ///
  /// [timePeriod]: The period of time that you want the forecast to cover.
  ///
  /// [metric]: Which metric Cost Explorer uses to create your forecast. For
  /// more information about blended and unblended rates, see
  /// [Why does the "blended" annotation appear on some line items in my bill?](https://aws.amazon.com/premiumsupport/knowledge-center/blended-rates-intro/).
  ///
  /// Valid values for a `GetCostForecast` call are the following:
  ///
  /// *   AMORTIZED_COST
  ///
  /// *   BLENDED_COST
  ///
  /// *   NET_AMORTIZED_COST
  ///
  /// *   NET_UNBLENDED_COST
  ///
  /// *   UNBLENDED_COST
  ///
  /// [granularity]: How granular you want the forecast to be. You can get 3
  /// months of `DAILY` forecasts or 12 months of `MONTHLY` forecasts.
  ///
  /// The `GetCostForecast` operation supports only `DAILY` and `MONTHLY`
  /// granularities.
  ///
  /// [filter]: The filters that you want to use to filter your forecast. Cost
  /// Explorer API supports all of the Cost Explorer filters.
  ///
  /// [predictionIntervalLevel]: Cost Explorer always returns the mean forecast
  /// as a single point. You can request a prediction interval around the mean
  /// by specifying a confidence level. The higher the confidence level, the
  /// more confident Cost Explorer is about the actual value falling in the
  /// prediction interval. Higher confidence levels result in wider prediction
  /// intervals.
  Future<GetCostForecastResponse> getCostForecast(
      {@required DateInterval timePeriod,
      @required String metric,
      @required String granularity,
      Expression filter,
      int predictionIntervalLevel}) async {
    return GetCostForecastResponse.fromJson({});
  }

  /// Retrieves all available filter values for a specified filter over a period
  /// of time. You can search the dimension values for an arbitrary string.
  ///
  /// [searchString]: The value that you want to search the filter values for.
  ///
  /// [timePeriod]: The start and end dates for retrieving the dimension values.
  /// The start date is inclusive, but the end date is exclusive. For example,
  /// if `start` is `2017-01-01` and `end` is `2017-05-01`, then the cost and
  /// usage data is retrieved from `2017-01-01` up to and including `2017-04-30`
  /// but not including `2017-05-01`.
  ///
  /// [dimension]: The name of the dimension. Each `Dimension` is available for
  /// a different `Context`. For more information, see `Context`.
  ///
  /// [context]: The context for the call to `GetDimensionValues`. This can be
  /// `RESERVATIONS` or `COST_AND_USAGE`. The default value is `COST_AND_USAGE`.
  /// If the context is set to `RESERVATIONS`, the resulting dimension values
  /// can be used in the `GetReservationUtilization` operation. If the context
  /// is set to `COST_AND_USAGE`, the resulting dimension values can be used in
  /// the `GetCostAndUsage` operation.
  ///
  /// If you set the context to `COST_AND_USAGE`, you can use the following
  /// dimensions for searching:
  ///
  /// *   AZ - The Availability Zone. An example is `us-east-1a`.
  ///
  /// *   DATABASE_ENGINE - The Amazon Relational Database Service database.
  /// Examples are Aurora or MySQL.
  ///
  /// *   INSTANCE_TYPE - The type of Amazon EC2 instance. An example is
  /// `m4.xlarge`.
  ///
  /// *   LEGAL_ENTITY_NAME - The name of the organization that sells you AWS
  /// services, such as Amazon Web Services.
  ///
  /// *   LINKED_ACCOUNT - The description in the attribute map that includes
  /// the full name of the member account. The value field contains the AWS ID
  /// of the member account.
  ///
  /// *   OPERATING_SYSTEM - The operating system. Examples are Windows or
  /// Linux.
  ///
  /// *   OPERATION - The action performed. Examples include `RunInstance` and
  /// `CreateBucket`.
  ///
  /// *   PLATFORM - The Amazon EC2 operating system. Examples are Windows or
  /// Linux.
  ///
  /// *   PURCHASE_TYPE - The reservation type of the purchase to which this
  /// usage is related. Examples include On-Demand Instances and Standard
  /// Reserved Instances.
  ///
  /// *   SERVICE - The AWS service such as Amazon DynamoDB.
  ///
  /// *   USAGE_TYPE - The type of usage. An example is DataTransfer-In-Bytes.
  /// The response for the `GetDimensionValues` operation includes a unit
  /// attribute. Examples include GB and Hrs.
  ///
  /// *   USAGE_TYPE_GROUP - The grouping of common usage types. An example is
  /// Amazon EC2: CloudWatch – Alarms. The response for this operation includes
  /// a unit attribute.
  ///
  /// *   RECORD_TYPE - The different types of charges such as RI fees, usage
  /// costs, tax refunds, and credits.
  ///
  ///
  /// If you set the context to `RESERVATIONS`, you can use the following
  /// dimensions for searching:
  ///
  /// *   AZ - The Availability Zone. An example is `us-east-1a`.
  ///
  /// *   CACHE_ENGINE - The Amazon ElastiCache operating system. Examples are
  /// Windows or Linux.
  ///
  /// *   DEPLOYMENT_OPTION - The scope of Amazon Relational Database Service
  /// deployments. Valid values are `SingleAZ` and `MultiAZ`.
  ///
  /// *   INSTANCE_TYPE - The type of Amazon EC2 instance. An example is
  /// `m4.xlarge`.
  ///
  /// *   LINKED_ACCOUNT - The description in the attribute map that includes
  /// the full name of the member account. The value field contains the AWS ID
  /// of the member account.
  ///
  /// *   PLATFORM - The Amazon EC2 operating system. Examples are Windows or
  /// Linux.
  ///
  /// *   REGION - The AWS Region.
  ///
  /// *   SCOPE (Utilization only) - The scope of a Reserved Instance (RI).
  /// Values are regional or a single Availability Zone.
  ///
  /// *   TAG (Coverage only) - The tags that are associated with a Reserved
  /// Instance (RI).
  ///
  /// *   TENANCY - The tenancy of a resource. Examples are shared or dedicated.
  ///
  /// [nextPageToken]: The token to retrieve the next set of results. AWS
  /// provides the token when the response from a previous call has more results
  /// than the maximum page size.
  Future<GetDimensionValuesResponse> getDimensionValues(
      {String searchString,
      @required DateInterval timePeriod,
      @required String dimension,
      String context,
      String nextPageToken}) async {
    return GetDimensionValuesResponse.fromJson({});
  }

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
  ///
  /// [timePeriod]: The start and end dates of the period that you want to
  /// retrieve data about reservation coverage for. You can retrieve data for a
  /// maximum of 13 months: the last 12 months and the current month. The start
  /// date is inclusive, but the end date is exclusive. For example, if `start`
  /// is `2017-01-01` and `end` is `2017-05-01`, then the cost and usage data is
  /// retrieved from `2017-01-01` up to and including `2017-04-30` but not
  /// including `2017-05-01`.
  ///
  /// [groupBy]: You can group the data by the following attributes:
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
  /// *   TENANCY
  ///
  /// [granularity]: The granularity of the AWS cost data for the reservation.
  /// Valid values are `MONTHLY` and `DAILY`.
  ///
  /// If `GroupBy` is set, `Granularity` can't be set. If `Granularity` isn't
  /// set, the response object doesn't include `Granularity`, either `MONTHLY`
  /// or `DAILY`.
  ///
  /// The `GetReservationCoverage` operation supports only `DAILY` and `MONTHLY`
  /// granularities.
  ///
  /// [filter]: Filters utilization data by dimensions. You can filter by the
  /// following dimensions:
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
  ///  `GetReservationCoverage` uses the same
  /// [Expression](http://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_Expression.html)
  /// object as the other operations, but only `AND` is supported among each
  /// dimension. You can nest only one level deep. If there are multiple values
  /// for a dimension, they are OR'd together.
  ///
  /// If you don't provide a `SERVICE` filter, Cost Explorer defaults to EC2.
  ///
  /// [metrics]: The measurement that you want your reservation coverage
  /// reported in.
  ///
  /// Valid values are `Hour`, `Unit`, and `Cost`. You can use multiple values
  /// in a request.
  ///
  /// [nextPageToken]: The token to retrieve the next set of results. AWS
  /// provides the token when the response from a previous call has more results
  /// than the maximum page size.
  Future<GetReservationCoverageResponse> getReservationCoverage(
      DateInterval timePeriod,
      {List<GroupDefinition> groupBy,
      String granularity,
      Expression filter,
      List<String> metrics,
      String nextPageToken}) async {
    return GetReservationCoverageResponse.fromJson({});
  }

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
  ///
  /// [accountId]: The account ID that is associated with the recommendation.
  ///
  /// [service]: The specific service that you want recommendations for.
  ///
  /// [accountScope]: The account scope that you want recommendations for.
  /// `PAYER` means that AWS includes the master account and any member accounts
  /// when it calculates its recommendations. `LINKED` means that AWS includes
  /// only member accounts when it calculates its recommendations.
  ///
  /// Valid values are `PAYER` and `LINKED`.
  ///
  /// [lookbackPeriodInDays]: The number of previous days that you want AWS to
  /// consider when it calculates your recommendations.
  ///
  /// [termInYears]: The reservation term that you want recommendations for.
  ///
  /// [paymentOption]: The reservation purchase option that you want
  /// recommendations for.
  ///
  /// [serviceSpecification]: The hardware specifications for the service
  /// instances that you want recommendations for, such as standard or
  /// convertible Amazon EC2 instances.
  ///
  /// [pageSize]: The number of recommendations that you want returned in a
  /// single response object.
  ///
  /// [nextPageToken]: The pagination token that indicates the next set of
  /// results that you want to retrieve.
  Future<GetReservationPurchaseRecommendationResponse>
      getReservationPurchaseRecommendation(String service,
          {String accountId,
          String accountScope,
          String lookbackPeriodInDays,
          String termInYears,
          String paymentOption,
          ServiceSpecification serviceSpecification,
          int pageSize,
          String nextPageToken}) async {
    return GetReservationPurchaseRecommendationResponse.fromJson({});
  }

  /// Retrieves the reservation utilization for your account. Master accounts in
  /// an organization have access to member accounts. You can filter data by
  /// dimensions in a time period. You can use `GetDimensionValues` to determine
  /// the possible dimension values. Currently, you can group only by
  /// `SUBSCRIPTION_ID`.
  ///
  /// [timePeriod]: Sets the start and end dates for retrieving RI utilization.
  /// The start date is inclusive, but the end date is exclusive. For example,
  /// if `start` is `2017-01-01` and `end` is `2017-05-01`, then the cost and
  /// usage data is retrieved from `2017-01-01` up to and including `2017-04-30`
  /// but not including `2017-05-01`.
  ///
  /// [groupBy]: Groups only by `SUBSCRIPTION_ID`. Metadata is included.
  ///
  /// [granularity]: If `GroupBy` is set, `Granularity` can't be set. If
  /// `Granularity` isn't set, the response object doesn't include
  /// `Granularity`, either `MONTHLY` or `DAILY`. If both `GroupBy` and
  /// `Granularity` aren't set, `GetReservationUtilization` defaults to `DAILY`.
  ///
  /// The `GetReservationUtilization` operation supports only `DAILY` and
  /// `MONTHLY` granularities.
  ///
  /// [filter]: Filters utilization data by dimensions. You can filter by the
  /// following dimensions:
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
  /// *   SCOPE
  ///
  /// *   TENANCY
  ///
  ///
  ///  `GetReservationUtilization` uses the same
  /// [Expression](http://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_Expression.html)
  /// object as the other operations, but only `AND` is supported among each
  /// dimension, and nesting is supported up to only one level deep. If there
  /// are multiple values for a dimension, they are OR'd together.
  ///
  /// [nextPageToken]: The token to retrieve the next set of results. AWS
  /// provides the token when the response from a previous call has more results
  /// than the maximum page size.
  Future<GetReservationUtilizationResponse> getReservationUtilization(
      DateInterval timePeriod,
      {List<GroupDefinition> groupBy,
      String granularity,
      Expression filter,
      String nextPageToken}) async {
    return GetReservationUtilizationResponse.fromJson({});
  }

  /// Creates recommendations that helps you save cost by identifying idle and
  /// underutilized Amazon EC2 instances.
  ///
  /// Recommendations are generated to either downsize or terminate instances,
  /// along with providing savings detail and metrics. For details on
  /// calculation and function, see
  /// [Optimizing Your Cost with Rightsizing Recommendations](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/ce-what-is.html).
  ///
  /// [service]: The specific service that you want recommendations for.
  ///
  /// [pageSize]: The number of recommendations that you want returned in a
  /// single response object.
  ///
  /// [nextPageToken]: The pagination token that indicates the next set of
  /// results that you want to retrieve.
  Future<GetRightsizingRecommendationResponse> getRightsizingRecommendation(
      String service,
      {Expression filter,
      int pageSize,
      String nextPageToken}) async {
    return GetRightsizingRecommendationResponse.fromJson({});
  }

  /// Queries for available tag keys and tag values for a specified period. You
  /// can search the tag values for an arbitrary string.
  ///
  /// [searchString]: The value that you want to search for.
  ///
  /// [timePeriod]: The start and end dates for retrieving the dimension values.
  /// The start date is inclusive, but the end date is exclusive. For example,
  /// if `start` is `2017-01-01` and `end` is `2017-05-01`, then the cost and
  /// usage data is retrieved from `2017-01-01` up to and including `2017-04-30`
  /// but not including `2017-05-01`.
  ///
  /// [tagKey]: The key of the tag that you want to return values for.
  ///
  /// [nextPageToken]: The token to retrieve the next set of results. AWS
  /// provides the token when the response from a previous call has more results
  /// than the maximum page size.
  Future<GetTagsResponse> getTags(DateInterval timePeriod,
      {String searchString, String tagKey, String nextPageToken}) async {
    return GetTagsResponse.fromJson({});
  }

  /// Retrieves a forecast for how much Amazon Web Services predicts that you
  /// will use over the forecast time period that you select, based on your past
  /// usage.
  ///
  /// [timePeriod]: The start and end dates of the period that you want to
  /// retrieve usage forecast for. The start date is inclusive, but the end date
  /// is exclusive. For example, if `start` is `2017-01-01` and `end` is
  /// `2017-05-01`, then the cost and usage data is retrieved from `2017-01-01`
  /// up to and including `2017-04-30` but not including `2017-05-01`.
  ///
  /// [metric]: Which metric Cost Explorer uses to create your forecast.
  ///
  /// Valid values for a `GetUsageForecast` call are the following:
  ///
  /// *   USAGE_QUANTITY
  ///
  /// *   NORMALIZED_USAGE_AMOUNT
  ///
  /// [granularity]: How granular you want the forecast to be. You can get 3
  /// months of `DAILY` forecasts or 12 months of `MONTHLY` forecasts.
  ///
  /// The `GetUsageForecast` operation supports only `DAILY` and `MONTHLY`
  /// granularities.
  ///
  /// [filter]: The filters that you want to use to filter your forecast. Cost
  /// Explorer API supports all of the Cost Explorer filters.
  ///
  /// [predictionIntervalLevel]: Cost Explorer always returns the mean forecast
  /// as a single point. You can request a prediction interval around the mean
  /// by specifying a confidence level. The higher the confidence level, the
  /// more confident Cost Explorer is about the actual value falling in the
  /// prediction interval. Higher confidence levels result in wider prediction
  /// intervals.
  Future<GetUsageForecastResponse> getUsageForecast(
      {@required DateInterval timePeriod,
      @required String metric,
      @required String granularity,
      Expression filter,
      int predictionIntervalLevel}) async {
    return GetUsageForecastResponse.fromJson({});
  }
}

/// The amount of instance usage that a reservation covered.
class Coverage {
  /// The amount of instance usage that the reservation covered, in hours.
  final CoverageHours coverageHours;

  /// The amount of instance usage that the reservation covered, in normalized
  /// units.
  final CoverageNormalizedUnits coverageNormalizedUnits;

  /// The amount of cost that the reservation covered.
  final CoverageCost coverageCost;

  Coverage({
    this.coverageHours,
    this.coverageNormalizedUnits,
    this.coverageCost,
  });
  static Coverage fromJson(Map<String, dynamic> json) => Coverage();
}

/// Reservation coverage for a specified period, in hours.
class CoverageByTime {
  /// The period that this coverage was used over.
  final DateInterval timePeriod;

  /// The groups of instances that the reservation covered.
  final List<ReservationCoverageGroup> groups;

  /// The total reservation coverage, in hours.
  final Coverage total;

  CoverageByTime({
    this.timePeriod,
    this.groups,
    this.total,
  });
  static CoverageByTime fromJson(Map<String, dynamic> json) => CoverageByTime();
}

/// How much it cost to run an instance.
class CoverageCost {
  /// How much an On-Demand instance cost.
  final String onDemandCost;

  CoverageCost({
    this.onDemandCost,
  });
  static CoverageCost fromJson(Map<String, dynamic> json) => CoverageCost();
}

/// How long a running instance either used a reservation or was On-Demand.
class CoverageHours {
  /// The number of instance running hours that On-Demand Instances covered.
  final String onDemandHours;

  /// The number of instance running hours that reservations covered.
  final String reservedHours;

  /// The total instance usage, in hours.
  final String totalRunningHours;

  /// The percentage of instance hours that a reservation covered.
  final String coverageHoursPercentage;

  CoverageHours({
    this.onDemandHours,
    this.reservedHours,
    this.totalRunningHours,
    this.coverageHoursPercentage,
  });
  static CoverageHours fromJson(Map<String, dynamic> json) => CoverageHours();
}

/// The amount of instance usage, in normalized units. Normalized units enable
/// you to see your EC2 usage for multiple sizes of instances in a uniform way.
/// For example, suppose you run an xlarge instance and a 2xlarge instance. If
/// you run both instances for the same amount of time, the 2xlarge instance
/// uses twice as much of your reservation as the xlarge instance, even though
/// both instances show only one instance-hour. Using normalized units instead
/// of instance-hours, the xlarge instance used 8 normalized units, and the
/// 2xlarge instance used 16 normalized units.
///
/// For more information, see
/// [Modifying Reserved Instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-modifying.html)
/// in the _Amazon Elastic Compute Cloud User Guide for Linux Instances_.
class CoverageNormalizedUnits {
  /// The number of normalized units that are covered by On-Demand Instances
  /// instead of a reservation.
  final String onDemandNormalizedUnits;

  /// The number of normalized units that a reservation covers.
  final String reservedNormalizedUnits;

  /// The total number of normalized units that you used.
  final String totalRunningNormalizedUnits;

  /// The percentage of your used instance normalized units that a reservation
  /// covers.
  final String coverageNormalizedUnitsPercentage;

  CoverageNormalizedUnits({
    this.onDemandNormalizedUnits,
    this.reservedNormalizedUnits,
    this.totalRunningNormalizedUnits,
    this.coverageNormalizedUnitsPercentage,
  });
  static CoverageNormalizedUnits fromJson(Map<String, dynamic> json) =>
      CoverageNormalizedUnits();
}

/// Context about the current instance.
class CurrentInstance {
  /// Resource ID of the current instance.
  final String resourceId;

  /// Cost allocation resource tags applied to the instance.
  final List<TagValues> tags;

  ///  Details about the resource and utilization.
  final ResourceDetails resourceDetails;

  ///  Utilization information of the current instance during the lookback
  /// period.
  final ResourceUtilization resourceUtilization;

  ///  Number of hours during the lookback period covered by reservations.
  final String reservationCoveredHoursInLookbackPeriod;

  ///  Number of hours during the lookback period billed at On Demand rates.
  final String onDemandHoursInLookbackPeriod;

  ///  The total number of hours the instance ran during the lookback period.
  final String totalRunningHoursInLookbackPeriod;

  ///  Current On Demand cost of operating this instance on a monthly basis.
  final String monthlyCost;

  ///  The currency code that Amazon Web Services used to calculate the costs
  /// for this instance.
  final String currencyCode;

  CurrentInstance({
    this.resourceId,
    this.tags,
    this.resourceDetails,
    this.resourceUtilization,
    this.reservationCoveredHoursInLookbackPeriod,
    this.onDemandHoursInLookbackPeriod,
    this.totalRunningHoursInLookbackPeriod,
    this.monthlyCost,
    this.currencyCode,
  });
  static CurrentInstance fromJson(Map<String, dynamic> json) =>
      CurrentInstance();
}

/// The time period that you want the usage and costs for.
class DateInterval {
  /// The beginning of the time period that you want the usage and costs for.
  /// The start date is inclusive. For example, if `start` is `2017-01-01`, AWS
  /// retrieves cost and usage data starting at `2017-01-01` up to the end date.
  final String start;

  /// The end of the time period that you want the usage and costs for. The end
  /// date is exclusive. For example, if `end` is `2017-05-01`, AWS retrieves
  /// cost and usage data from the start date up to, but not including,
  /// `2017-05-01`.
  final String end;

  DateInterval({
    @required this.start,
    @required this.end,
  });
  static DateInterval fromJson(Map<String, dynamic> json) => DateInterval();
}

/// The metadata that you can use to filter and group your results. You can use
/// `GetDimensionValues` to find specific values.
class DimensionValues {
  /// The names of the metadata types that you can use to filter and group your
  /// results. For example, `AZ` returns a list of Availability Zones.
  final String key;

  /// The metadata values that you can use to filter and group your results. You
  /// can use `GetDimensionValues` to find specific values.
  ///
  /// Valid values for the `SERVICE` dimension are `Amazon Elastic Compute Cloud
  /// - Compute`, `Amazon Elasticsearch Service`, `Amazon ElastiCache`, `Amazon
  /// Redshift`, and `Amazon Relational Database Service`.
  final List<String> values;

  DimensionValues({
    this.key,
    this.values,
  });
}

/// The metadata of a specific type that you can use to filter and group your
/// results. You can use `GetDimensionValues` to find specific values.
class DimensionValuesWithAttributes {
  /// The value of a dimension with a specific attribute.
  final String value;

  /// The attribute that applies to a specific `Dimension`.
  final Map<String, String> attributes;

  DimensionValuesWithAttributes({
    this.value,
    this.attributes,
  });
  static DimensionValuesWithAttributes fromJson(Map<String, dynamic> json) =>
      DimensionValuesWithAttributes();
}

/// Details about the Amazon EC2 instances that AWS recommends that you
/// purchase.
class Ec2InstanceDetails {
  /// The instance family of the recommended reservation.
  final String family;

  /// The type of instance that AWS recommends.
  final String instanceType;

  /// The AWS Region of the recommended reservation.
  final String region;

  /// The Availability Zone of the recommended reservation.
  final String availabilityZone;

  /// The platform of the recommended reservation. The platform is the specific
  /// combination of operating system, license model, and software on an
  /// instance.
  final String platform;

  /// Whether the recommended reservation is dedicated or shared.
  final String tenancy;

  /// Whether the recommendation is for a current-generation instance.
  final bool currentGeneration;

  /// Whether the recommended reservation is size flexible.
  final bool sizeFlexEligible;

  Ec2InstanceDetails({
    this.family,
    this.instanceType,
    this.region,
    this.availabilityZone,
    this.platform,
    this.tenancy,
    this.currentGeneration,
    this.sizeFlexEligible,
  });
  static Ec2InstanceDetails fromJson(Map<String, dynamic> json) =>
      Ec2InstanceDetails();
}

///  Details on the Amazon EC2 Resource.
class Ec2ResourceDetails {
  ///  Hourly public On Demand rate for the instance type.
  final String hourlyOnDemandRate;

  ///  The type of Amazon Web Services instance.
  final String instanceType;

  ///  The platform of the Amazon Web Services instance. The platform is the
  /// specific combination of operating system, license model, and software on
  /// an instance.
  final String platform;

  ///  The Amazon Web Services Region of the instance.
  final String region;

  ///  The SKU of the product.
  final String sku;

  ///  Memory capacity of Amazon Web Services instance.
  final String memory;

  ///  Network performance capacity of the Amazon Web Services instance.
  final String networkPerformance;

  ///  The disk storage of the Amazon Web Services instance (Not EBS storage).
  final String storage;

  ///  Number of VCPU cores in the Amazon Web Services instance type.
  final String vcpu;

  Ec2ResourceDetails({
    this.hourlyOnDemandRate,
    this.instanceType,
    this.platform,
    this.region,
    this.sku,
    this.memory,
    this.networkPerformance,
    this.storage,
    this.vcpu,
  });
  static Ec2ResourceDetails fromJson(Map<String, dynamic> json) =>
      Ec2ResourceDetails();
}

///  Utilization metrics of the instance.
class Ec2ResourceUtilization {
  ///  Maximum observed or expected CPU utilization of the instance.
  final String maxCpuUtilizationPercentage;

  ///  Maximum observed or expected memory utilization of the instance.
  final String maxMemoryUtilizationPercentage;

  ///  Maximum observed or expected storage utilization of the instance (does
  /// not measure EBS storage).
  final String maxStorageUtilizationPercentage;

  Ec2ResourceUtilization({
    this.maxCpuUtilizationPercentage,
    this.maxMemoryUtilizationPercentage,
    this.maxStorageUtilizationPercentage,
  });
  static Ec2ResourceUtilization fromJson(Map<String, dynamic> json) =>
      Ec2ResourceUtilization();
}

/// The Amazon EC2 hardware specifications that you want AWS to provide
/// recommendations for.
class Ec2Specification {
  /// Whether you want a recommendation for standard or convertible
  /// reservations.
  final String offeringClass;

  Ec2Specification({
    this.offeringClass,
  });
  static Ec2Specification fromJson(Map<String, dynamic> json) =>
      Ec2Specification();
}

/// Details about the Amazon ES instances that AWS recommends that you purchase.
class ESInstanceDetails {
  /// The class of instance that AWS recommends.
  final String instanceClass;

  /// The size of instance that AWS recommends.
  final String instanceSize;

  /// The AWS Region of the recommended reservation.
  final String region;

  /// Whether the recommendation is for a current-generation instance.
  final bool currentGeneration;

  /// Whether the recommended reservation is size flexible.
  final bool sizeFlexEligible;

  ESInstanceDetails({
    this.instanceClass,
    this.instanceSize,
    this.region,
    this.currentGeneration,
    this.sizeFlexEligible,
  });
  static ESInstanceDetails fromJson(Map<String, dynamic> json) =>
      ESInstanceDetails();
}

/// Details about the Amazon ElastiCache instances that AWS recommends that you
/// purchase.
class ElastiCacheInstanceDetails {
  /// The instance family of the recommended reservation.
  final String family;

  /// The type of node that AWS recommends.
  final String nodeType;

  /// The AWS Region of the recommended reservation.
  final String region;

  /// The description of the recommended reservation.
  final String productDescription;

  /// Whether the recommendation is for a current generation instance.
  final bool currentGeneration;

  /// Whether the recommended reservation is size flexible.
  final bool sizeFlexEligible;

  ElastiCacheInstanceDetails({
    this.family,
    this.nodeType,
    this.region,
    this.productDescription,
    this.currentGeneration,
    this.sizeFlexEligible,
  });
  static ElastiCacheInstanceDetails fromJson(Map<String, dynamic> json) =>
      ElastiCacheInstanceDetails();
}

/// Use `Expression` to filter by cost or by usage. There are two patterns:
///
/// *   Simple dimension values - You can set the dimension name and values for
/// the filters that you plan to use. For example, you can filter for
/// `REGION==us-east-1 OR REGION==us-west-1`. The `Expression` for that looks
/// like this:
///
///      `{ "Dimensions": { "Key": "REGION", "Values":
/// [ "us-east-1", “us-west-1” ] } }`
///
///     The list of dimension values are OR'd together to retrieve cost or usage
/// data. You can create `Expression` and `DimensionValues` objects using either
/// `with*` methods or `set*` methods in multiple lines.
///
/// *   Compound dimension values with logical operations - You can use multiple
/// `Expression` types and the logical operators `AND/OR/NOT` to create a list
/// of one or more `Expression` objects. This allows you to filter on more
/// advanced options. For example, you can filter on `((REGION == us-east-1 OR
/// REGION == us-west-1) OR (TAG.Type == Type1)) AND (USAGE_TYPE !=
/// DataTransfer)`. The `Expression` for that looks like this:
///
///      `{ "And":
/// [ {"Or": [ {"Dimensions": { "Key": "REGION", "Values": [ "us-east-1", "us-west-1" ]
/// }}, {"Tags": { "Key": "TagName", "Values": ["Value1"] } } ]}, {"Not":
/// {"Dimensions": { "Key": "USAGE_TYPE", "Values": ["DataTransfer"] }}} ] }`
///
///      Because each `Expression` can have only one operator, the service
/// returns an error if more than one is specified. The following example shows
/// an `Expression` object that creates an error.
///
///       `{ "And": [ ... ], "DimensionValues": { "Dimension": "USAGE_TYPE",
/// "Values": [ "DataTransfer" ] } }`
///
///
///
///
/// For `GetRightsizingRecommendation` action, a combination of OR and NOT is
/// not supported. OR is not supported between different dimensions, or
/// dimensions and tags. NOT operators aren't supported. Dimentions are also
/// limited to `LINKED_ACCOUNT`, `REGION`, or `RIGHTSIZING_TYPE`.
class Expression {
  /// Return results that match either `Dimension` object.
  final List<Expression> or;

  /// Return results that match both `Dimension` objects.
  final List<Expression> and;

  /// Return results that don't match a `Dimension` object.
  final Expression not;

  /// The specific `Dimension` to use for `Expression`.
  final DimensionValues dimensions;

  /// The specific `Tag` to use for `Expression`.
  final TagValues tags;

  Expression({
    this.or,
    this.and,
    this.not,
    this.dimensions,
    this.tags,
  });
}

/// The forecast created for your query.
class ForecastResult {
  /// The period of time that the forecast covers.
  final DateInterval timePeriod;

  /// The mean value of the forecast.
  final String meanValue;

  /// The lower limit for the prediction interval.
  final String predictionIntervalLowerBound;

  /// The upper limit for the prediction interval.
  final String predictionIntervalUpperBound;

  ForecastResult({
    this.timePeriod,
    this.meanValue,
    this.predictionIntervalLowerBound,
    this.predictionIntervalUpperBound,
  });
  static ForecastResult fromJson(Map<String, dynamic> json) => ForecastResult();
}

class GetCostAndUsageResponse {
  /// The token for the next set of retrievable results. AWS provides the token
  /// when the response from a previous call has more results than the maximum
  /// page size.
  final String nextPageToken;

  /// The groups that are specified by the `Filter` or `GroupBy` parameters in
  /// the request.
  final List<GroupDefinition> groupDefinitions;

  /// The time period that is covered by the results in the response.
  final List<ResultByTime> resultsByTime;

  GetCostAndUsageResponse({
    this.nextPageToken,
    this.groupDefinitions,
    this.resultsByTime,
  });
  static GetCostAndUsageResponse fromJson(Map<String, dynamic> json) =>
      GetCostAndUsageResponse();
}

class GetCostForecastResponse {
  /// How much you are forecasted to spend over the forecast period, in `USD`.
  final MetricValue total;

  /// The forecasts for your query, in order. For `DAILY` forecasts, this is a
  /// list of days. For `MONTHLY` forecasts, this is a list of months.
  final List<ForecastResult> forecastResultsByTime;

  GetCostForecastResponse({
    this.total,
    this.forecastResultsByTime,
  });
  static GetCostForecastResponse fromJson(Map<String, dynamic> json) =>
      GetCostForecastResponse();
}

class GetDimensionValuesResponse {
  /// The filters that you used to filter your request. Some dimensions are
  /// available only for a specific context.
  ///
  /// If you set the context to `COST_AND_USAGE`, you can use the following
  /// dimensions for searching:
  ///
  /// *   AZ - The Availability Zone. An example is `us-east-1a`.
  ///
  /// *   DATABASE_ENGINE - The Amazon Relational Database Service database.
  /// Examples are Aurora or MySQL.
  ///
  /// *   INSTANCE_TYPE - The type of Amazon EC2 instance. An example is
  /// `m4.xlarge`.
  ///
  /// *   LEGAL_ENTITY_NAME - The name of the organization that sells you AWS
  /// services, such as Amazon Web Services.
  ///
  /// *   LINKED_ACCOUNT - The description in the attribute map that includes
  /// the full name of the member account. The value field contains the AWS ID
  /// of the member account.
  ///
  /// *   OPERATING_SYSTEM - The operating system. Examples are Windows or
  /// Linux.
  ///
  /// *   OPERATION - The action performed. Examples include `RunInstance` and
  /// `CreateBucket`.
  ///
  /// *   PLATFORM - The Amazon EC2 operating system. Examples are Windows or
  /// Linux.
  ///
  /// *   PURCHASE_TYPE - The reservation type of the purchase to which this
  /// usage is related. Examples include On-Demand Instances and Standard
  /// Reserved Instances.
  ///
  /// *   SERVICE - The AWS service such as Amazon DynamoDB.
  ///
  /// *   USAGE_TYPE - The type of usage. An example is DataTransfer-In-Bytes.
  /// The response for the `GetDimensionValues` operation includes a unit
  /// attribute. Examples include GB and Hrs.
  ///
  /// *   USAGE_TYPE_GROUP - The grouping of common usage types. An example is
  /// Amazon EC2: CloudWatch – Alarms. The response for this operation includes
  /// a unit attribute.
  ///
  /// *   RECORD_TYPE - The different types of charges such as RI fees, usage
  /// costs, tax refunds, and credits.
  ///
  ///
  /// If you set the context to `RESERVATIONS`, you can use the following
  /// dimensions for searching:
  ///
  /// *   AZ - The Availability Zone. An example is `us-east-1a`.
  ///
  /// *   CACHE_ENGINE - The Amazon ElastiCache operating system. Examples are
  /// Windows or Linux.
  ///
  /// *   DEPLOYMENT_OPTION - The scope of Amazon Relational Database Service
  /// deployments. Valid values are `SingleAZ` and `MultiAZ`.
  ///
  /// *   INSTANCE_TYPE - The type of Amazon EC2 instance. An example is
  /// `m4.xlarge`.
  ///
  /// *   LINKED_ACCOUNT - The description in the attribute map that includes
  /// the full name of the member account. The value field contains the AWS ID
  /// of the member account.
  ///
  /// *   PLATFORM - The Amazon EC2 operating system. Examples are Windows or
  /// Linux.
  ///
  /// *   REGION - The AWS Region.
  ///
  /// *   SCOPE (Utilization only) - The scope of a Reserved Instance (RI).
  /// Values are regional or a single Availability Zone.
  ///
  /// *   TAG (Coverage only) - The tags that are associated with a Reserved
  /// Instance (RI).
  ///
  /// *   TENANCY - The tenancy of a resource. Examples are shared or dedicated.
  final List<DimensionValuesWithAttributes> dimensionValues;

  /// The number of results that AWS returned at one time.
  final int returnSize;

  /// The total number of search results.
  final int totalSize;

  /// The token for the next set of retrievable results. AWS provides the token
  /// when the response from a previous call has more results than the maximum
  /// page size.
  final String nextPageToken;

  GetDimensionValuesResponse({
    @required this.dimensionValues,
    @required this.returnSize,
    @required this.totalSize,
    this.nextPageToken,
  });
  static GetDimensionValuesResponse fromJson(Map<String, dynamic> json) =>
      GetDimensionValuesResponse();
}

class GetReservationCoverageResponse {
  /// The amount of time that your reservations covered.
  final List<CoverageByTime> coveragesByTime;

  /// The total amount of instance usage that a reservation covered.
  final Coverage total;

  /// The token for the next set of retrievable results. AWS provides the token
  /// when the response from a previous call has more results than the maximum
  /// page size.
  final String nextPageToken;

  GetReservationCoverageResponse({
    @required this.coveragesByTime,
    this.total,
    this.nextPageToken,
  });
  static GetReservationCoverageResponse fromJson(Map<String, dynamic> json) =>
      GetReservationCoverageResponse();
}

class GetReservationPurchaseRecommendationResponse {
  /// Information about this specific recommendation call, such as the time
  /// stamp for when Cost Explorer generated this recommendation.
  final ReservationPurchaseRecommendationMetadata metadata;

  /// Recommendations for reservations to purchase.
  final List<ReservationPurchaseRecommendation> recommendations;

  /// The pagination token for the next set of retrievable results.
  final String nextPageToken;

  GetReservationPurchaseRecommendationResponse({
    this.metadata,
    this.recommendations,
    this.nextPageToken,
  });
  static GetReservationPurchaseRecommendationResponse fromJson(
          Map<String, dynamic> json) =>
      GetReservationPurchaseRecommendationResponse();
}

class GetReservationUtilizationResponse {
  /// The amount of time that you used your RIs.
  final List<UtilizationByTime> utilizationsByTime;

  /// The total amount of time that you used your RIs.
  final ReservationAggregates total;

  /// The token for the next set of retrievable results. AWS provides the token
  /// when the response from a previous call has more results than the maximum
  /// page size.
  final String nextPageToken;

  GetReservationUtilizationResponse({
    @required this.utilizationsByTime,
    this.total,
    this.nextPageToken,
  });
  static GetReservationUtilizationResponse fromJson(
          Map<String, dynamic> json) =>
      GetReservationUtilizationResponse();
}

class GetRightsizingRecommendationResponse {
  /// Information regarding this specific recommendation set.
  final RightsizingRecommendationMetadata metadata;

  /// Summary of this recommendation set.
  final RightsizingRecommendationSummary summary;

  /// Recommendations to rightsize resources.
  final List<RightsizingRecommendation> rightsizingRecommendations;

  /// The token to retrieve the next set of results.
  final String nextPageToken;

  GetRightsizingRecommendationResponse({
    this.metadata,
    this.summary,
    this.rightsizingRecommendations,
    this.nextPageToken,
  });
  static GetRightsizingRecommendationResponse fromJson(
          Map<String, dynamic> json) =>
      GetRightsizingRecommendationResponse();
}

class GetTagsResponse {
  /// The token for the next set of retrievable results. AWS provides the token
  /// when the response from a previous call has more results than the maximum
  /// page size.
  final String nextPageToken;

  /// The tags that match your request.
  final List<String> tags;

  /// The number of query results that AWS returns at a time.
  final int returnSize;

  /// The total number of query results.
  final int totalSize;

  GetTagsResponse({
    this.nextPageToken,
    @required this.tags,
    @required this.returnSize,
    @required this.totalSize,
  });
  static GetTagsResponse fromJson(Map<String, dynamic> json) =>
      GetTagsResponse();
}

class GetUsageForecastResponse {
  /// How much you're forecasted to use over the forecast period.
  final MetricValue total;

  /// The forecasts for your query, in order. For `DAILY` forecasts, this is a
  /// list of days. For `MONTHLY` forecasts, this is a list of months.
  final List<ForecastResult> forecastResultsByTime;

  GetUsageForecastResponse({
    this.total,
    this.forecastResultsByTime,
  });
  static GetUsageForecastResponse fromJson(Map<String, dynamic> json) =>
      GetUsageForecastResponse();
}

/// One level of grouped data in the results.
class Group {
  /// The keys that are included in this group.
  final List<String> keys;

  /// The metrics that are included in this group.
  final Map<String, MetricValue> metrics;

  Group({
    this.keys,
    this.metrics,
  });
  static Group fromJson(Map<String, dynamic> json) => Group();
}

/// Represents a group when you specify a group by criteria or in the response
/// to a query with a specific grouping.
class GroupDefinition {
  /// The string that represents the type of group.
  final String type;

  /// The string that represents a key for a specified group.
  final String key;

  GroupDefinition({
    this.type,
    this.key,
  });
  static GroupDefinition fromJson(Map<String, dynamic> json) =>
      GroupDefinition();
}

/// Details about the instances that AWS recommends that you purchase.
class InstanceDetails {
  /// The Amazon EC2 instances that AWS recommends that you purchase.
  final Ec2InstanceDetails ec2InstanceDetails;

  /// The Amazon RDS instances that AWS recommends that you purchase.
  final RdsInstanceDetails rdsInstanceDetails;

  /// The Amazon Redshift instances that AWS recommends that you purchase.
  final RedshiftInstanceDetails redshiftInstanceDetails;

  /// The ElastiCache instances that AWS recommends that you purchase.
  final ElastiCacheInstanceDetails elastiCacheInstanceDetails;

  /// The Amazon ES instances that AWS recommends that you purchase.
  final ESInstanceDetails esInstanceDetails;

  InstanceDetails({
    this.ec2InstanceDetails,
    this.rdsInstanceDetails,
    this.redshiftInstanceDetails,
    this.elastiCacheInstanceDetails,
    this.esInstanceDetails,
  });
  static InstanceDetails fromJson(Map<String, dynamic> json) =>
      InstanceDetails();
}

/// The aggregated value for a metric.
class MetricValue {
  /// The actual number that represents the metric.
  final String amount;

  /// The unit that the metric is given in.
  final String unit;

  MetricValue({
    this.amount,
    this.unit,
  });
  static MetricValue fromJson(Map<String, dynamic> json) => MetricValue();
}

///  Details on the modification recommendation.
class ModifyRecommendationDetail {
  ///  Identifies whether this instance type is the Amazon Web Services default
  /// recommendation.
  final List<TargetInstance> targetInstances;

  ModifyRecommendationDetail({
    this.targetInstances,
  });
  static ModifyRecommendationDetail fromJson(Map<String, dynamic> json) =>
      ModifyRecommendationDetail();
}

/// Details about the Amazon RDS instances that AWS recommends that you
/// purchase.
class RdsInstanceDetails {
  /// The instance family of the recommended reservation.
  final String family;

  /// The type of instance that AWS recommends.
  final String instanceType;

  /// The AWS Region of the recommended reservation.
  final String region;

  /// The database engine that the recommended reservation supports.
  final String databaseEngine;

  /// The database edition that the recommended reservation supports.
  final String databaseEdition;

  /// Whether the recommendation is for a reservation in a single Availability
  /// Zone or a reservation with a backup in a second Availability Zone.
  final String deploymentOption;

  /// The license model that the recommended reservation supports.
  final String licenseModel;

  /// Whether the recommendation is for a current-generation instance.
  final bool currentGeneration;

  /// Whether the recommended reservation is size flexible.
  final bool sizeFlexEligible;

  RdsInstanceDetails({
    this.family,
    this.instanceType,
    this.region,
    this.databaseEngine,
    this.databaseEdition,
    this.deploymentOption,
    this.licenseModel,
    this.currentGeneration,
    this.sizeFlexEligible,
  });
  static RdsInstanceDetails fromJson(Map<String, dynamic> json) =>
      RdsInstanceDetails();
}

/// Details about the Amazon Redshift instances that AWS recommends that you
/// purchase.
class RedshiftInstanceDetails {
  /// The instance family of the recommended reservation.
  final String family;

  /// The type of node that AWS recommends.
  final String nodeType;

  /// The AWS Region of the recommended reservation.
  final String region;

  /// Whether the recommendation is for a current-generation instance.
  final bool currentGeneration;

  /// Whether the recommended reservation is size flexible.
  final bool sizeFlexEligible;

  RedshiftInstanceDetails({
    this.family,
    this.nodeType,
    this.region,
    this.currentGeneration,
    this.sizeFlexEligible,
  });
  static RedshiftInstanceDetails fromJson(Map<String, dynamic> json) =>
      RedshiftInstanceDetails();
}

/// The aggregated numbers for your reservation usage.
class ReservationAggregates {
  /// The percentage of reservation time that you used.
  final String utilizationPercentage;

  /// The percentage of Amazon EC2 reservation time that you used, converted to
  /// normalized units. Normalized units are available only for Amazon EC2 usage
  /// after November 11, 2017.
  final String utilizationPercentageInUnits;

  /// How many reservation hours that you purchased.
  final String purchasedHours;

  /// How many Amazon EC2 reservation hours that you purchased, converted to
  /// normalized units. Normalized units are available only for Amazon EC2 usage
  /// after November 11, 2017.
  final String purchasedUnits;

  /// The total number of reservation hours that you used.
  final String totalActualHours;

  /// The total number of Amazon EC2 reservation hours that you used, converted
  /// to normalized units. Normalized units are available only for Amazon EC2
  /// usage after November 11, 2017.
  final String totalActualUnits;

  /// The number of reservation hours that you didn't use.
  final String unusedHours;

  /// The number of Amazon EC2 reservation hours that you didn't use, converted
  /// to normalized units. Normalized units are available only for Amazon EC2
  /// usage after November 11, 2017.
  final String unusedUnits;

  /// How much your reservation would cost if charged On-Demand rates.
  final String onDemandCostOfRIHoursUsed;

  /// How much you saved due to purchasing and utilizing reservation. AWS
  /// calculates this by subtracting `TotalAmortizedFee` from
  /// `OnDemandCostOfRIHoursUsed`.
  final String netRISavings;

  /// How much you could save if you use your entire reservation.
  final String totalPotentialRISavings;

  /// The upfront cost of your reservation, amortized over the reservation
  /// period.
  final String amortizedUpfrontFee;

  /// The monthly cost of your reservation, amortized over the reservation
  /// period.
  final String amortizedRecurringFee;

  /// The total cost of your reservation, amortized over the reservation period.
  final String totalAmortizedFee;

  ReservationAggregates({
    this.utilizationPercentage,
    this.utilizationPercentageInUnits,
    this.purchasedHours,
    this.purchasedUnits,
    this.totalActualHours,
    this.totalActualUnits,
    this.unusedHours,
    this.unusedUnits,
    this.onDemandCostOfRIHoursUsed,
    this.netRISavings,
    this.totalPotentialRISavings,
    this.amortizedUpfrontFee,
    this.amortizedRecurringFee,
    this.totalAmortizedFee,
  });
  static ReservationAggregates fromJson(Map<String, dynamic> json) =>
      ReservationAggregates();
}

/// A group of reservations that share a set of attributes.
class ReservationCoverageGroup {
  /// The attributes for this group of reservations.
  final Map<String, String> attributes;

  /// How much instance usage this group of reservations covered.
  final Coverage coverage;

  ReservationCoverageGroup({
    this.attributes,
    this.coverage,
  });
  static ReservationCoverageGroup fromJson(Map<String, dynamic> json) =>
      ReservationCoverageGroup();
}

/// A specific reservation that AWS recommends for purchase.
class ReservationPurchaseRecommendation {
  /// The account scope that AWS recommends that you purchase this instance for.
  /// For example, you can purchase this reservation for an entire organization
  /// in AWS Organizations.
  final String accountScope;

  /// How many days of previous usage that AWS considers when making this
  /// recommendation.
  final String lookbackPeriodInDays;

  /// The term of the reservation that you want recommendations for, in years.
  final String termInYears;

  /// The payment option for the reservation. For example, `AllUpfront` or
  /// `NoUpfront`.
  final String paymentOption;

  /// Hardware specifications for the service that you want recommendations for.
  final ServiceSpecification serviceSpecification;

  /// Details about the recommended purchases.
  final List<ReservationPurchaseRecommendationDetail> recommendationDetails;

  /// A summary about the recommended purchase.
  final ReservationPurchaseRecommendationSummary recommendationSummary;

  ReservationPurchaseRecommendation({
    this.accountScope,
    this.lookbackPeriodInDays,
    this.termInYears,
    this.paymentOption,
    this.serviceSpecification,
    this.recommendationDetails,
    this.recommendationSummary,
  });
  static ReservationPurchaseRecommendation fromJson(
          Map<String, dynamic> json) =>
      ReservationPurchaseRecommendation();
}

/// Details about your recommended reservation purchase.
class ReservationPurchaseRecommendationDetail {
  /// The account that this RI recommendation is for.
  final String accountId;

  /// Details about the instances that AWS recommends that you purchase.
  final InstanceDetails instanceDetails;

  /// The number of instances that AWS recommends that you purchase.
  final String recommendedNumberOfInstancesToPurchase;

  /// The number of normalized units that AWS recommends that you purchase.
  final String recommendedNormalizedUnitsToPurchase;

  /// The minimum number of instances that you used in an hour during the
  /// historical period. AWS uses this to calculate your recommended reservation
  /// purchases.
  final String minimumNumberOfInstancesUsedPerHour;

  /// The minimum number of normalized units that you used in an hour during the
  /// historical period. AWS uses this to calculate your recommended reservation
  /// purchases.
  final String minimumNormalizedUnitsUsedPerHour;

  /// The maximum number of instances that you used in an hour during the
  /// historical period. AWS uses this to calculate your recommended reservation
  /// purchases.
  final String maximumNumberOfInstancesUsedPerHour;

  /// The maximum number of normalized units that you used in an hour during the
  /// historical period. AWS uses this to calculate your recommended reservation
  /// purchases.
  final String maximumNormalizedUnitsUsedPerHour;

  /// The average number of instances that you used in an hour during the
  /// historical period. AWS uses this to calculate your recommended reservation
  /// purchases.
  final String averageNumberOfInstancesUsedPerHour;

  /// The average number of normalized units that you used in an hour during the
  /// historical period. AWS uses this to calculate your recommended reservation
  /// purchases.
  final String averageNormalizedUnitsUsedPerHour;

  /// The average utilization of your instances. AWS uses this to calculate your
  /// recommended reservation purchases.
  final String averageUtilization;

  /// How long AWS estimates that it takes for this instance to start saving you
  /// money, in months.
  final String estimatedBreakEvenInMonths;

  /// The currency code that AWS used to calculate the costs for this instance.
  final String currencyCode;

  /// How much AWS estimates that this specific recommendation could save you in
  /// a month.
  final String estimatedMonthlySavingsAmount;

  /// How much AWS estimates that this specific recommendation could save you in
  /// a month, as a percentage of your overall costs.
  final String estimatedMonthlySavingsPercentage;

  /// How much AWS estimates that you spend on On-Demand Instances in a month.
  final String estimatedMonthlyOnDemandCost;

  /// How much AWS estimates that you would have spent for all usage during the
  /// specified historical period if you had had a reservation.
  final String estimatedReservationCostForLookbackPeriod;

  /// How much purchasing this instance costs you upfront.
  final String upfrontCost;

  /// How much purchasing this instance costs you on a monthly basis.
  final String recurringStandardMonthlyCost;

  ReservationPurchaseRecommendationDetail({
    this.accountId,
    this.instanceDetails,
    this.recommendedNumberOfInstancesToPurchase,
    this.recommendedNormalizedUnitsToPurchase,
    this.minimumNumberOfInstancesUsedPerHour,
    this.minimumNormalizedUnitsUsedPerHour,
    this.maximumNumberOfInstancesUsedPerHour,
    this.maximumNormalizedUnitsUsedPerHour,
    this.averageNumberOfInstancesUsedPerHour,
    this.averageNormalizedUnitsUsedPerHour,
    this.averageUtilization,
    this.estimatedBreakEvenInMonths,
    this.currencyCode,
    this.estimatedMonthlySavingsAmount,
    this.estimatedMonthlySavingsPercentage,
    this.estimatedMonthlyOnDemandCost,
    this.estimatedReservationCostForLookbackPeriod,
    this.upfrontCost,
    this.recurringStandardMonthlyCost,
  });
  static ReservationPurchaseRecommendationDetail fromJson(
          Map<String, dynamic> json) =>
      ReservationPurchaseRecommendationDetail();
}

/// Information about this specific recommendation, such as the time stamp for
/// when AWS made a specific recommendation.
class ReservationPurchaseRecommendationMetadata {
  /// The ID for this specific recommendation.
  final String recommendationId;

  /// The time stamp for when AWS made this recommendation.
  final String generationTimestamp;

  ReservationPurchaseRecommendationMetadata({
    this.recommendationId,
    this.generationTimestamp,
  });
  static ReservationPurchaseRecommendationMetadata fromJson(
          Map<String, dynamic> json) =>
      ReservationPurchaseRecommendationMetadata();
}

/// A summary about this recommendation, such as the currency code, the amount
/// that AWS estimates that you could save, and the total amount of reservation
/// to purchase.
class ReservationPurchaseRecommendationSummary {
  /// The total amount that AWS estimates that this recommendation could save
  /// you in a month.
  final String totalEstimatedMonthlySavingsAmount;

  /// The total amount that AWS estimates that this recommendation could save
  /// you in a month, as a percentage of your costs.
  final String totalEstimatedMonthlySavingsPercentage;

  /// The currency code used for this recommendation.
  final String currencyCode;

  ReservationPurchaseRecommendationSummary({
    this.totalEstimatedMonthlySavingsAmount,
    this.totalEstimatedMonthlySavingsPercentage,
    this.currencyCode,
  });
  static ReservationPurchaseRecommendationSummary fromJson(
          Map<String, dynamic> json) =>
      ReservationPurchaseRecommendationSummary();
}

/// A group of reservations that share a set of attributes.
class ReservationUtilizationGroup {
  /// The key for a specific reservation attribute.
  final String key;

  /// The value of a specific reservation attribute.
  final String value;

  /// The attributes for this group of reservations.
  final Map<String, String> attributes;

  /// How much you used this group of reservations.
  final ReservationAggregates utilization;

  ReservationUtilizationGroup({
    this.key,
    this.value,
    this.attributes,
    this.utilization,
  });
  static ReservationUtilizationGroup fromJson(Map<String, dynamic> json) =>
      ReservationUtilizationGroup();
}

/// Details on the resource.
class ResourceDetails {
  /// Details on the Amazon EC2 resource.
  final Ec2ResourceDetails ec2ResourceDetails;

  ResourceDetails({
    this.ec2ResourceDetails,
  });
  static ResourceDetails fromJson(Map<String, dynamic> json) =>
      ResourceDetails();
}

/// Resource utilization of current resource.
class ResourceUtilization {
  /// Utilization of current Amazon EC2 Instance
  final Ec2ResourceUtilization ec2ResourceUtilization;

  ResourceUtilization({
    this.ec2ResourceUtilization,
  });
  static ResourceUtilization fromJson(Map<String, dynamic> json) =>
      ResourceUtilization();
}

/// The result that is associated with a time period.
class ResultByTime {
  /// The time period that the result covers.
  final DateInterval timePeriod;

  /// The total amount of cost or usage accrued during the time period.
  final Map<String, MetricValue> total;

  /// The groups that this time period includes.
  final List<Group> groups;

  /// Whether the result is estimated.
  final bool estimated;

  ResultByTime({
    this.timePeriod,
    this.total,
    this.groups,
    this.estimated,
  });
  static ResultByTime fromJson(Map<String, dynamic> json) => ResultByTime();
}

/// Recommendations to rightsize resources.
class RightsizingRecommendation {
  /// The account that this recommendation is for.
  final String accountId;

  ///  Context regarding the current instance.
  final CurrentInstance currentInstance;

  /// Recommendation to either terminate or modify the resource.
  final String rightsizingType;

  ///  Details for modification recommendations.
  final ModifyRecommendationDetail modifyRecommendationDetail;

  /// Details for termination recommendations.
  final TerminateRecommendationDetail terminateRecommendationDetail;

  RightsizingRecommendation({
    this.accountId,
    this.currentInstance,
    this.rightsizingType,
    this.modifyRecommendationDetail,
    this.terminateRecommendationDetail,
  });
  static RightsizingRecommendation fromJson(Map<String, dynamic> json) =>
      RightsizingRecommendation();
}

/// Metadata for this recommendation set.
class RightsizingRecommendationMetadata {
  ///  The ID for this specific recommendation.
  final String recommendationId;

  ///  The time stamp for when Amazon Web Services made this recommendation.
  final String generationTimestamp;

  ///  How many days of previous usage that Amazon Web Services considers when
  /// making this recommendation.
  final String lookbackPeriodInDays;

  RightsizingRecommendationMetadata({
    this.recommendationId,
    this.generationTimestamp,
    this.lookbackPeriodInDays,
  });
  static RightsizingRecommendationMetadata fromJson(
          Map<String, dynamic> json) =>
      RightsizingRecommendationMetadata();
}

///  Summary of rightsizing recommendations
class RightsizingRecommendationSummary {
  ///  Total number of instance recommendations.
  final String totalRecommendationCount;

  ///  Estimated total savings resulting from modifications, on a monthly basis.
  final String estimatedTotalMonthlySavingsAmount;

  ///  The currency code that Amazon Web Services used to calculate the savings.
  final String savingsCurrencyCode;

  ///  Savings percentage based on the recommended modifications, relative to
  /// the total On Demand costs associated with these instances.
  final String savingsPercentage;

  RightsizingRecommendationSummary({
    this.totalRecommendationCount,
    this.estimatedTotalMonthlySavingsAmount,
    this.savingsCurrencyCode,
    this.savingsPercentage,
  });
  static RightsizingRecommendationSummary fromJson(Map<String, dynamic> json) =>
      RightsizingRecommendationSummary();
}

/// Hardware specifications for the service that you want recommendations for.
class ServiceSpecification {
  /// The Amazon EC2 hardware specifications that you want AWS to provide
  /// recommendations for.
  final Ec2Specification ec2Specification;

  ServiceSpecification({
    this.ec2Specification,
  });
  static ServiceSpecification fromJson(Map<String, dynamic> json) =>
      ServiceSpecification();
}

/// The values that are available for a tag.
class TagValues {
  /// The key for the tag.
  final String key;

  /// The specific value of the tag.
  final List<String> values;

  TagValues({
    this.key,
    this.values,
  });
  static TagValues fromJson(Map<String, dynamic> json) => TagValues();
}

///  Details on recommended instance.
class TargetInstance {
  ///  Expected cost to operate this instance type on a monthly basis.
  final String estimatedMonthlyCost;

  ///  Estimated savings resulting from modification, on a monthly basis.
  final String estimatedMonthlySavings;

  ///  The currency code that Amazon Web Services used to calculate the costs
  /// for this instance.
  final String currencyCode;

  ///  Indicates whether or not this recommendation is the defaulted Amazon Web
  /// Services recommendation.
  final bool defaultTargetInstance;

  ///  Details on the target instance type.
  final ResourceDetails resourceDetails;

  ///  Expected utilization metrics for target instance type.
  final ResourceUtilization expectedResourceUtilization;

  TargetInstance({
    this.estimatedMonthlyCost,
    this.estimatedMonthlySavings,
    this.currencyCode,
    this.defaultTargetInstance,
    this.resourceDetails,
    this.expectedResourceUtilization,
  });
  static TargetInstance fromJson(Map<String, dynamic> json) => TargetInstance();
}

///  Details on termination recommendation.
class TerminateRecommendationDetail {
  ///  Estimated savings resulting from modification, on a monthly basis.
  final String estimatedMonthlySavings;

  ///  The currency code that Amazon Web Services used to calculate the costs
  /// for this instance.
  final String currencyCode;

  TerminateRecommendationDetail({
    this.estimatedMonthlySavings,
    this.currencyCode,
  });
  static TerminateRecommendationDetail fromJson(Map<String, dynamic> json) =>
      TerminateRecommendationDetail();
}

/// The amount of utilization, in hours.
class UtilizationByTime {
  /// The period of time that this utilization was used for.
  final DateInterval timePeriod;

  /// The groups that this utilization result uses.
  final List<ReservationUtilizationGroup> groups;

  /// The total number of reservation hours that were used.
  final ReservationAggregates total;

  UtilizationByTime({
    this.timePeriod,
    this.groups,
    this.total,
  });
  static UtilizationByTime fromJson(Map<String, dynamic> json) =>
      UtilizationByTime();
}
