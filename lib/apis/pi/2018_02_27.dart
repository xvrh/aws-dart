import 'package:meta/meta.dart';

/// AWS Performance Insights enables you to monitor and explore different
/// dimensions of database load based on data captured from a running RDS
/// instance. The guide provides detailed information about Performance Insights
/// data types, parameters and errors. For more information about Performance
/// Insights capabilities see [Using Amazon RDS Performance
/// Insights](http://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_PerfInsights.html)
///  in the _Amazon RDS User Guide_.
///
///  The AWS Performance Insights API provides visibility into the performance
/// of your RDS instance, when Performance Insights is enabled for supported
/// engine types. While Amazon CloudWatch provides the authoritative source for
/// AWS service vended monitoring metrics, AWS Performance Insights offers a
/// domain-specific view of database load measured as Average Active Sessions
/// and provided to API consumers as a 2-dimensional time-series dataset. The
/// time dimension of the data provides DB load data for each time point in the
/// queried time range, and each time point decomposes overall load in relation
/// to the requested dimensions, such as SQL, Wait-event, User or Host, measured
/// at that time point.
class PIApi {
  /// For a specific time period, retrieve the top `N` dimension keys for a
  /// metric.
  ///
  /// [serviceType]: The AWS service for which Performance Insights will return
  /// metrics. The only valid value for _ServiceType_ is: `RDS`
  ///
  /// [identifier]: An immutable, AWS Region-unique identifier for a data
  /// source. Performance Insights gathers metrics from this data source.
  ///
  /// To use an Amazon RDS instance as a data source, you specify its
  /// `DbiResourceId` value - for example: `db-FAIHNTYBKTGAUSUZQYPDS2GW4A`
  ///
  /// [startTime]: The date and time specifying the beginning of the requested
  /// time series data. You can't specify a `StartTime` that's earlier than 7
  /// days ago. The value specified is _inclusive_ \- data points equal to or
  /// greater than `StartTime` will be returned.
  ///
  /// The value for `StartTime` must be earlier than the value for `EndTime`.
  ///
  /// [endTime]: The date and time specifying the end of the requested time
  /// series data. The value specified is _exclusive_ \- data points less than
  /// (but not equal to) `EndTime` will be returned.
  ///
  /// The value for `EndTime` must be later than the value for `StartTime`.
  ///
  /// [metric]: The name of a Performance Insights metric to be measured.
  ///
  /// Valid values for `Metric` are:
  ///
  /// *    `db.load.avg` \- a scaled representation of the number of active
  /// sessions for the database engine.
  ///
  /// *    `db.sampledload.avg` \- the raw number of active sessions for the
  /// database engine.
  ///
  /// [periodInSeconds]: The granularity, in seconds, of the data points
  /// returned from Performance Insights. A period can be as short as one
  /// second, or as long as one day (86400 seconds). Valid values are:
  ///
  /// *    `1` (one second)
  ///
  /// *    `60` (one minute)
  ///
  /// *    `300` (five minutes)
  ///
  /// *    `3600` (one hour)
  ///
  /// *    `86400` (twenty-four hours)
  ///
  ///
  /// If you don't specify `PeriodInSeconds`, then Performance Insights will
  /// choose a value for you, with a goal of returning roughly 100-200 data
  /// points in the response.
  ///
  /// [groupBy]: A specification for how to aggregate the data points from a
  /// query result. You must specify a valid dimension group. Performance
  /// Insights will return all of the dimensions within that group, unless you
  /// provide the names of specific dimensions within that group. You can also
  /// request that Performance Insights return a limited number of values for a
  /// dimension.
  ///
  /// [partitionBy]: For each dimension specified in `GroupBy`, specify a
  /// secondary dimension to further subdivide the partition keys in the
  /// response.
  ///
  /// [filter]: One or more filters to apply in the request. Restrictions:
  ///
  /// *   Any number of filters by the same dimension, as specified in the
  /// `GroupBy` or `Partition` parameters.
  ///
  /// *   A single filter for any other dimension in this dimension group.
  ///
  /// [maxResults]: The maximum number of items to return in the response. If
  /// more items exist than the specified `MaxRecords` value, a pagination token
  /// is included in the response so that the remaining results can be
  /// retrieved.
  ///
  /// [nextToken]: An optional pagination token provided by a previous request.
  /// If this parameter is specified, the response includes only records beyond
  /// the token, up to the value specified by `MaxRecords`.
  Future<DescribeDimensionKeysResponse> describeDimensionKeys(
      {@required String serviceType,
      @required String identifier,
      @required DateTime startTime,
      @required DateTime endTime,
      @required String metric,
      int periodInSeconds,
      @required DimensionGroup groupBy,
      DimensionGroup partitionBy,
      Map<String, String> filter,
      int maxResults,
      String nextToken}) async {
    return DescribeDimensionKeysResponse.fromJson({});
  }

  /// Retrieve Performance Insights metrics for a set of data sources, over a
  /// time period. You can provide specific dimension groups and dimensions, and
  /// provide aggregation and filtering criteria for each group.
  ///
  /// [serviceType]: The AWS service for which Performance Insights will return
  /// metrics. The only valid value for _ServiceType_ is: `RDS`
  ///
  /// [identifier]: An immutable, AWS Region-unique identifier for a data
  /// source. Performance Insights gathers metrics from this data source.
  ///
  /// To use an Amazon RDS instance as a data source, you specify its
  /// `DbiResourceId` value - for example: `db-FAIHNTYBKTGAUSUZQYPDS2GW4A`
  ///
  /// [metricQueries]: An array of one or more queries to perform. Each query
  /// must specify a Performance Insights metric, and can optionally specify
  /// aggregation and filtering criteria.
  ///
  /// [startTime]: The date and time specifying the beginning of the requested
  /// time series data. You can't specify a `StartTime` that's earlier than 7
  /// days ago. The value specified is _inclusive_ \- data points equal to or
  /// greater than `StartTime` will be returned.
  ///
  /// The value for `StartTime` must be earlier than the value for `EndTime`.
  ///
  /// [endTime]: The date and time specifiying the end of the requested time
  /// series data. The value specified is _exclusive_ \- data points less than
  /// (but not equal to) `EndTime` will be returned.
  ///
  /// The value for `EndTime` must be later than the value for `StartTime`.
  ///
  /// [periodInSeconds]: The granularity, in seconds, of the data points
  /// returned from Performance Insights. A period can be as short as one
  /// second, or as long as one day (86400 seconds). Valid values are:
  ///
  /// *    `1` (one second)
  ///
  /// *    `60` (one minute)
  ///
  /// *    `300` (five minutes)
  ///
  /// *    `3600` (one hour)
  ///
  /// *    `86400` (twenty-four hours)
  ///
  ///
  /// If you don't specify `PeriodInSeconds`, then Performance Insights will
  /// choose a value for you, with a goal of returning roughly 100-200 data
  /// points in the response.
  ///
  /// [maxResults]: The maximum number of items to return in the response. If
  /// more items exist than the specified `MaxRecords` value, a pagination token
  /// is included in the response so that the remaining results can be
  /// retrieved.
  ///
  /// [nextToken]: An optional pagination token provided by a previous request.
  /// If this parameter is specified, the response includes only records beyond
  /// the token, up to the value specified by `MaxRecords`.
  Future<GetResourceMetricsResponse> getResourceMetrics(
      {@required String serviceType,
      @required String identifier,
      @required List<MetricQuery> metricQueries,
      @required DateTime startTime,
      @required DateTime endTime,
      int periodInSeconds,
      int maxResults,
      String nextToken}) async {
    return GetResourceMetricsResponse.fromJson({});
  }
}

class DataPoint {
  /// The time, in epoch format, associated with a particular `Value`.
  final DateTime timestamp;

  /// The actual value associated with a particular `Timestamp`.
  final double value;

  DataPoint({
    @required this.timestamp,
    @required this.value,
  });
  static DataPoint fromJson(Map<String, dynamic> json) => DataPoint();
}

class DescribeDimensionKeysResponse {
  /// The start time for the returned dimension keys, after alignment to a
  /// granular boundary (as specified by `PeriodInSeconds`). `AlignedStartTime`
  /// will be less than or equal to the value of the user-specified `StartTime`.
  final DateTime alignedStartTime;

  /// The end time for the returned dimension keys, after alignment to a
  /// granular boundary (as specified by `PeriodInSeconds`). `AlignedEndTime`
  /// will be greater than or equal to the value of the user-specified
  /// `Endtime`.
  final DateTime alignedEndTime;

  /// If `PartitionBy` was present in the request, `PartitionKeys` contains the
  /// breakdown of dimension keys by the specified partitions.
  final List<ResponsePartitionKey> partitionKeys;

  /// The dimension keys that were requested.
  final List<DimensionKeyDescription> keys;

  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// token, up to the value specified by `MaxRecords`.
  final String nextToken;

  DescribeDimensionKeysResponse({
    this.alignedStartTime,
    this.alignedEndTime,
    this.partitionKeys,
    this.keys,
    this.nextToken,
  });
  static DescribeDimensionKeysResponse fromJson(Map<String, dynamic> json) =>
      DescribeDimensionKeysResponse();
}

class DimensionGroup {
  /// The name of the dimension group. Valid values are:
  ///
  /// *    `db.user`
  ///
  /// *    `db.host`
  ///
  /// *    `db.sql`
  ///
  /// *    `db.sql_tokenized`
  ///
  /// *    `db.wait_event`
  ///
  /// *    `db.wait\_event\_type`
  final String group;

  /// A list of specific dimensions from a dimension group. If this parameter is
  /// not present, then it signifies that all of the dimensions in the group
  /// were requested, or are present in the response.
  ///
  /// Valid values for elements in the `Dimensions` array are:
  ///
  /// *   db.user.id
  ///
  /// *   db.user.name
  ///
  /// *   db.host.id
  ///
  /// *   db.host.name
  ///
  /// *   db.sql.id
  ///
  /// *   db.sql.db_id
  ///
  /// *   db.sql.statement
  ///
  /// *   db.sql.tokenized_id
  ///
  /// *   db.sql_tokenized.id
  ///
  /// *   db.sql\_tokenized.db\_id
  ///
  /// *   db.sql_tokenized.statement
  ///
  /// *   db.wait_event.name
  ///
  /// *   db.wait_event.type
  ///
  /// *   db.wait\_event\_type.name
  final List<String> dimensions;

  /// The maximum number of items to fetch for this dimension group.
  final int limit;

  DimensionGroup({
    @required this.group,
    this.dimensions,
    this.limit,
  });
}

class DimensionKeyDescription {
  /// A map of name-value pairs for the dimensions in the group.
  final Map<String, String> dimensions;

  /// The aggregated metric value for the dimension(s), over the requested time
  /// range.
  final double total;

  /// If `PartitionBy` was specified, `PartitionKeys` contains the dimensions
  /// that were.
  final List<double> partitions;

  DimensionKeyDescription({
    this.dimensions,
    this.total,
    this.partitions,
  });
  static DimensionKeyDescription fromJson(Map<String, dynamic> json) =>
      DimensionKeyDescription();
}

class GetResourceMetricsResponse {
  /// The start time for the returned metrics, after alignment to a granular
  /// boundary (as specified by `PeriodInSeconds`). `AlignedStartTime` will be
  /// less than or equal to the value of the user-specified `StartTime`.
  final DateTime alignedStartTime;

  /// The end time for the returned metrics, after alignment to a granular
  /// boundary (as specified by `PeriodInSeconds`). `AlignedEndTime` will be
  /// greater than or equal to the value of the user-specified `Endtime`.
  final DateTime alignedEndTime;

  /// An immutable, AWS Region-unique identifier for a data source. Performance
  /// Insights gathers metrics from this data source.
  ///
  /// To use an Amazon RDS instance as a data source, you specify its
  /// `DbiResourceId` value - for example: `db-FAIHNTYBKTGAUSUZQYPDS2GW4A`
  final String identifier;

  /// An array of metric results,, where each array element contains all of the
  /// data points for a particular dimension.
  final List<MetricKeyDataPoints> metricList;

  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// token, up to the value specified by `MaxRecords`.
  final String nextToken;

  GetResourceMetricsResponse({
    this.alignedStartTime,
    this.alignedEndTime,
    this.identifier,
    this.metricList,
    this.nextToken,
  });
  static GetResourceMetricsResponse fromJson(Map<String, dynamic> json) =>
      GetResourceMetricsResponse();
}

class MetricKeyDataPoints {
  /// The dimension(s) to which the data points apply.
  final ResponseResourceMetricKey key;

  /// An array of timestamp-value pairs, representing measurements over a period
  /// of time.
  final List<DataPoint> dataPoints;

  MetricKeyDataPoints({
    this.key,
    this.dataPoints,
  });
  static MetricKeyDataPoints fromJson(Map<String, dynamic> json) =>
      MetricKeyDataPoints();
}

class MetricQuery {
  /// The name of a Performance Insights metric to be measured.
  ///
  /// Valid values for `Metric` are:
  ///
  /// *    `db.load.avg` \- a scaled representation of the number of active
  /// sessions for the database engine.
  ///
  /// *    `db.sampledload.avg` \- the raw number of active sessions for the
  /// database engine.
  final String metric;

  /// A specification for how to aggregate the data points from a query result.
  /// You must specify a valid dimension group. Performance Insights will return
  /// all of the dimensions within that group, unless you provide the names of
  /// specific dimensions within that group. You can also request that
  /// Performance Insights return a limited number of values for a dimension.
  final DimensionGroup groupBy;

  /// One or more filters to apply in the request. Restrictions:
  ///
  /// *   Any number of filters by the same dimension, as specified in the
  /// `GroupBy` parameter.
  ///
  /// *   A single filter for any other dimension in this dimension group.
  final Map<String, String> filter;

  MetricQuery({
    @required this.metric,
    this.groupBy,
    this.filter,
  });
}

class ResponsePartitionKey {
  /// A dimension map that contains the dimension(s) for this partition.
  final Map<String, String> dimensions;

  ResponsePartitionKey({
    @required this.dimensions,
  });
  static ResponsePartitionKey fromJson(Map<String, dynamic> json) =>
      ResponsePartitionKey();
}

class ResponseResourceMetricKey {
  /// The name of a Performance Insights metric to be measured.
  ///
  /// Valid values for `Metric` are:
  ///
  /// *    `db.load.avg` \- a scaled representation of the number of active
  /// sessions for the database engine.
  ///
  /// *    `db.sampledload.avg` \- the raw number of active sessions for the
  /// database engine.
  final String metric;

  /// The valid dimensions for the metric.
  final Map<String, String> dimensions;

  ResponseResourceMetricKey({
    @required this.metric,
    this.dimensions,
  });
  static ResponseResourceMetricKey fromJson(Map<String, dynamic> json) =>
      ResponseResourceMetricKey();
}
