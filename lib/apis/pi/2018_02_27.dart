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
  Future<void> describeDimensionKeys(
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
      String nextToken}) async {}

  /// Retrieve Performance Insights metrics for a set of data sources, over a
  /// time period. You can provide specific dimension groups and dimensions, and
  /// provide aggregation and filtering criteria for each group.
  Future<void> getResourceMetrics(
      {@required String serviceType,
      @required String identifier,
      @required List<MetricQuery> metricQueries,
      @required DateTime startTime,
      @required DateTime endTime,
      int periodInSeconds,
      int maxResults,
      String nextToken}) async {}
}

class DataPoint {}

class DescribeDimensionKeysResponse {}

class DimensionGroup {}

class DimensionKeyDescription {}

class GetResourceMetricsResponse {}

class MetricKeyDataPoints {}

class MetricQuery {}

class ResponsePartitionKey {}

class ResponseResourceMetricKey {}
