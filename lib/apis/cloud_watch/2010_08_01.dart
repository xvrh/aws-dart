import 'package:meta/meta.dart';
import 'dart:typed_data';

/// Amazon CloudWatch monitors your Amazon Web Services (AWS) resources and the
/// applications you run on AWS in real time. You can use CloudWatch to collect
/// and track metrics, which are the variables you want to measure for your
/// resources and applications.
///
/// CloudWatch alarms send notifications or automatically change the resources
/// you are monitoring based on rules that you define. For example, you can
/// monitor the CPU usage and disk reads and writes of your Amazon EC2
/// instances. Then, use this data to determine whether you should launch
/// additional instances to handle increased load. You can also use this data to
/// stop under-used instances to save money.
///
/// In addition to monitoring the built-in metrics that come with AWS, you can
/// monitor your own custom metrics. With CloudWatch, you gain system-wide
/// visibility into resource utilization, application performance, and
/// operational health.
class CloudWatchApi {
  final _client;
  CloudWatchApi(client)
      : _client = client.configured('CloudWatch', serializer: 'query');

  /// Deletes the specified alarms. You can delete up to 50 alarms in one
  /// operation. In the event of an error, no alarms are deleted.
  ///
  /// [alarmNames]: The alarms to be deleted.
  Future<void> deleteAlarms(List<String> alarmNames) async {
    await _client.send('DeleteAlarms', {
      'AlarmNames': alarmNames,
    });
  }

  /// Deletes the specified anomaly detection model from your account.
  ///
  /// [namespace]: The namespace associated with the anomaly detection model to
  /// delete.
  ///
  /// [metricName]: The metric name associated with the anomaly detection model
  /// to delete.
  ///
  /// [dimensions]: The metric dimensions associated with the anomaly detection
  /// model to delete.
  ///
  /// [stat]: The statistic associated with the anomaly detection model to
  /// delete.
  Future<DeleteAnomalyDetectorOutput> deleteAnomalyDetector(
      {@required String namespace,
      @required String metricName,
      List<Dimension> dimensions,
      @required String stat}) async {
    var response_ = await _client.send('DeleteAnomalyDetector', {
      'Namespace': namespace,
      'MetricName': metricName,
      if (dimensions != null) 'Dimensions': dimensions,
      'Stat': stat,
    });
    return DeleteAnomalyDetectorOutput.fromJson(response_);
  }

  /// Deletes all dashboards that you specify. You may specify up to 100
  /// dashboards to delete. If there is an error during this call, no dashboards
  /// are deleted.
  ///
  /// [dashboardNames]: The dashboards to be deleted. This parameter is
  /// required.
  Future<DeleteDashboardsOutput> deleteDashboards(
      List<String> dashboardNames) async {
    var response_ = await _client.send('DeleteDashboards', {
      'DashboardNames': dashboardNames,
    });
    return DeleteDashboardsOutput.fromJson(response_);
  }

  /// Retrieves the history for the specified alarm. You can filter the results
  /// by date range or item type. If an alarm name is not specified, the
  /// histories for all alarms are returned.
  ///
  /// CloudWatch retains the history of an alarm even if you delete the alarm.
  ///
  /// [alarmName]: The name of the alarm.
  ///
  /// [historyItemType]: The type of alarm histories to retrieve.
  ///
  /// [startDate]: The starting date to retrieve alarm history.
  ///
  /// [endDate]: The ending date to retrieve alarm history.
  ///
  /// [maxRecords]: The maximum number of alarm history records to retrieve.
  ///
  /// [nextToken]: The token returned by a previous call to indicate that there
  /// is more data available.
  Future<DescribeAlarmHistoryOutput> describeAlarmHistory(
      {String alarmName,
      String historyItemType,
      DateTime startDate,
      DateTime endDate,
      int maxRecords,
      String nextToken}) async {
    var response_ = await _client.send('DescribeAlarmHistory', {
      if (alarmName != null) 'AlarmName': alarmName,
      if (historyItemType != null) 'HistoryItemType': historyItemType,
      if (startDate != null) 'StartDate': startDate,
      if (endDate != null) 'EndDate': endDate,
      if (maxRecords != null) 'MaxRecords': maxRecords,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return DescribeAlarmHistoryOutput.fromJson(response_);
  }

  /// Retrieves the specified alarms. If no alarms are specified, all alarms are
  /// returned. Alarms can be retrieved by using only a prefix for the alarm
  /// name, the alarm state, or a prefix for any action.
  ///
  /// [alarmNames]: The names of the alarms.
  ///
  /// [alarmNamePrefix]: The alarm name prefix. If this parameter is specified,
  /// you cannot specify `AlarmNames`.
  ///
  /// [stateValue]: The state value to be used in matching alarms.
  ///
  /// [actionPrefix]: The action name prefix.
  ///
  /// [maxRecords]: The maximum number of alarm descriptions to retrieve.
  ///
  /// [nextToken]: The token returned by a previous call to indicate that there
  /// is more data available.
  Future<DescribeAlarmsOutput> describeAlarms(
      {List<String> alarmNames,
      String alarmNamePrefix,
      String stateValue,
      String actionPrefix,
      int maxRecords,
      String nextToken}) async {
    var response_ = await _client.send('DescribeAlarms', {
      if (alarmNames != null) 'AlarmNames': alarmNames,
      if (alarmNamePrefix != null) 'AlarmNamePrefix': alarmNamePrefix,
      if (stateValue != null) 'StateValue': stateValue,
      if (actionPrefix != null) 'ActionPrefix': actionPrefix,
      if (maxRecords != null) 'MaxRecords': maxRecords,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return DescribeAlarmsOutput.fromJson(response_);
  }

  /// Retrieves the alarms for the specified metric. To filter the results,
  /// specify a statistic, period, or unit.
  ///
  /// [metricName]: The name of the metric.
  ///
  /// [namespace]: The namespace of the metric.
  ///
  /// [statistic]: The statistic for the metric, other than percentiles. For
  /// percentile statistics, use `ExtendedStatistics`.
  ///
  /// [extendedStatistic]: The percentile statistic for the metric. Specify a
  /// value between p0.0 and p100.
  ///
  /// [dimensions]: The dimensions associated with the metric. If the metric has
  /// any associated dimensions, you must specify them in order for the call to
  /// succeed.
  ///
  /// [period]: The period, in seconds, over which the statistic is applied.
  ///
  /// [unit]: The unit for the metric.
  Future<DescribeAlarmsForMetricOutput> describeAlarmsForMetric(
      {@required String metricName,
      @required String namespace,
      String statistic,
      String extendedStatistic,
      List<Dimension> dimensions,
      int period,
      String unit}) async {
    var response_ = await _client.send('DescribeAlarmsForMetric', {
      'MetricName': metricName,
      'Namespace': namespace,
      if (statistic != null) 'Statistic': statistic,
      if (extendedStatistic != null) 'ExtendedStatistic': extendedStatistic,
      if (dimensions != null) 'Dimensions': dimensions,
      if (period != null) 'Period': period,
      if (unit != null) 'Unit': unit,
    });
    return DescribeAlarmsForMetricOutput.fromJson(response_);
  }

  /// Lists the anomaly detection models that you have created in your account.
  /// You can list all models in your account or filter the results to only the
  /// models that are related to a certain namespace, metric name, or metric
  /// dimension.
  ///
  /// [nextToken]: Use the token returned by the previous operation to request
  /// the next page of results.
  ///
  /// [maxResults]: The maximum number of results to return in one operation.
  /// The maximum value you can specify is 10.
  ///
  /// To retrieve the remaining results, make another call with the returned
  /// `NextToken` value.
  ///
  /// [namespace]: Limits the results to only the anomaly detection models that
  /// are associated with the specified namespace.
  ///
  /// [metricName]: Limits the results to only the anomaly detection models that
  /// are associated with the specified metric name. If there are multiple
  /// metrics with this name in different namespaces that have anomaly detection
  /// models, they're all returned.
  ///
  /// [dimensions]: Limits the results to only the anomaly detection models that
  /// are associated with the specified metric dimensions. If there are multiple
  /// metrics that have these dimensions and have anomaly detection models
  /// associated, they're all returned.
  Future<DescribeAnomalyDetectorsOutput> describeAnomalyDetectors(
      {String nextToken,
      int maxResults,
      String namespace,
      String metricName,
      List<Dimension> dimensions}) async {
    var response_ = await _client.send('DescribeAnomalyDetectors', {
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
      if (namespace != null) 'Namespace': namespace,
      if (metricName != null) 'MetricName': metricName,
      if (dimensions != null) 'Dimensions': dimensions,
    });
    return DescribeAnomalyDetectorsOutput.fromJson(response_);
  }

  /// Disables the actions for the specified alarms. When an alarm's actions are
  /// disabled, the alarm actions do not execute when the alarm state changes.
  ///
  /// [alarmNames]: The names of the alarms.
  Future<void> disableAlarmActions(List<String> alarmNames) async {
    await _client.send('DisableAlarmActions', {
      'AlarmNames': alarmNames,
    });
  }

  /// Enables the actions for the specified alarms.
  ///
  /// [alarmNames]: The names of the alarms.
  Future<void> enableAlarmActions(List<String> alarmNames) async {
    await _client.send('EnableAlarmActions', {
      'AlarmNames': alarmNames,
    });
  }

  /// Displays the details of the dashboard that you specify.
  ///
  /// To copy an existing dashboard, use `GetDashboard`, and then use the data
  /// returned within `DashboardBody` as the template for the new dashboard when
  /// you call `PutDashboard` to create the copy.
  ///
  /// [dashboardName]: The name of the dashboard to be described.
  Future<GetDashboardOutput> getDashboard(String dashboardName) async {
    var response_ = await _client.send('GetDashboard', {
      'DashboardName': dashboardName,
    });
    return GetDashboardOutput.fromJson(response_);
  }

  /// You can use the `GetMetricData` API to retrieve as many as 100 different
  /// metrics in a single request, with a total of as many as 100,800
  /// datapoints. You can also optionally perform math expressions on the values
  /// of the returned statistics, to create new time series that represent new
  /// insights into your data. For example, using Lambda metrics, you could
  /// divide the Errors metric by the Invocations metric to get an error rate
  /// time series. For more information about metric math expressions, see
  /// [Metric Math Syntax and Functions](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/using-metric-math.html#metric-math-syntax)
  /// in the _Amazon CloudWatch User Guide_.
  ///
  /// Calls to the `GetMetricData` API have a different pricing structure than
  /// calls to `GetMetricStatistics`. For more information about pricing, see
  /// [Amazon CloudWatch Pricing](https://aws.amazon.com/cloudwatch/pricing/).
  ///
  /// Amazon CloudWatch retains metric data as follows:
  ///
  /// *   Data points with a period of less than 60 seconds are available for 3
  /// hours. These data points are high-resolution metrics and are available
  /// only for custom metrics that have been defined with a `StorageResolution`
  /// of 1.
  ///
  /// *   Data points with a period of 60 seconds (1-minute) are available for
  /// 15 days.
  ///
  /// *   Data points with a period of 300 seconds (5-minute) are available for
  /// 63 days.
  ///
  /// *   Data points with a period of 3600 seconds (1 hour) are available for
  /// 455 days (15 months).
  ///
  ///
  /// Data points that are initially published with a shorter period are
  /// aggregated together for long-term storage. For example, if you collect
  /// data using a period of 1 minute, the data remains available for 15 days
  /// with 1-minute resolution. After 15 days, this data is still available, but
  /// is aggregated and retrievable only with a resolution of 5 minutes. After
  /// 63 days, the data is further aggregated and is available with a resolution
  /// of 1 hour.
  ///
  /// If you omit `Unit` in your request, all data that was collected with any
  /// unit is returned, along with the corresponding units that were specified
  /// when the data was reported to CloudWatch. If you specify a unit, the
  /// operation returns only data data that was collected with that unit
  /// specified. If you specify a unit that does not match the data collected,
  /// the results of the operation are null. CloudWatch does not perform unit
  /// conversions.
  ///
  /// [metricDataQueries]: The metric queries to be returned. A single
  /// `GetMetricData` call can include as many as 100 `MetricDataQuery`
  /// structures. Each of these structures can specify either a metric to
  /// retrieve, or a math expression to perform on retrieved data.
  ///
  /// [startTime]: The time stamp indicating the earliest data to be returned.
  ///
  /// The value specified is inclusive; results include data points with the
  /// specified time stamp.
  ///
  /// CloudWatch rounds the specified time stamp as follows:
  ///
  /// *   Start time less than 15 days ago - Round down to the nearest whole
  /// minute. For example, 12:32:34 is rounded down to 12:32:00.
  ///
  /// *   Start time between 15 and 63 days ago - Round down to the nearest
  /// 5-minute clock interval. For example, 12:32:34 is rounded down to
  /// 12:30:00.
  ///
  /// *   Start time greater than 63 days ago - Round down to the nearest 1-hour
  /// clock interval. For example, 12:32:34 is rounded down to 12:00:00.
  ///
  ///
  /// If you set `Period` to 5, 10, or 30, the start time of your request is
  /// rounded down to the nearest time that corresponds to even 5-, 10-, or
  /// 30-second divisions of a minute. For example, if you make a query at
  /// (HH:mm:ss) 01:05:23 for the previous 10-second period, the start time of
  /// your request is rounded down and you receive data from 01:05:10 to
  /// 01:05:20. If you make a query at 15:07:17 for the previous 5 minutes of
  /// data, using a period of 5 seconds, you receive data timestamped between
  /// 15:02:15 and 15:07:15.
  ///
  /// For better performance, specify `StartTime` and `EndTime` values that
  /// align with the value of the metric's `Period` and sync up with the
  /// beginning and end of an hour. For example, if the `Period` of a metric is
  /// 5 minutes, specifying 12:05 or 12:30 as `StartTime` can get a faster
  /// response from CloudWatch than setting 12:07 or 12:29 as the `StartTime`.
  ///
  /// [endTime]: The time stamp indicating the latest data to be returned.
  ///
  /// The value specified is exclusive; results include data points up to the
  /// specified time stamp.
  ///
  /// For better performance, specify `StartTime` and `EndTime` values that
  /// align with the value of the metric's `Period` and sync up with the
  /// beginning and end of an hour. For example, if the `Period` of a metric is
  /// 5 minutes, specifying 12:05 or 12:30 as `EndTime` can get a faster
  /// response from CloudWatch than setting 12:07 or 12:29 as the `EndTime`.
  ///
  /// [nextToken]: Include this value, if it was returned by the previous call,
  /// to get the next set of data points.
  ///
  /// [scanBy]: The order in which data points should be returned.
  /// `TimestampDescending` returns the newest data first and paginates when the
  /// `MaxDatapoints` limit is reached. `TimestampAscending` returns the oldest
  /// data first and paginates when the `MaxDatapoints` limit is reached.
  ///
  /// [maxDatapoints]: The maximum number of data points the request should
  /// return before paginating. If you omit this, the default of 100,800 is
  /// used.
  Future<GetMetricDataOutput> getMetricData(
      {@required List<MetricDataQuery> metricDataQueries,
      @required DateTime startTime,
      @required DateTime endTime,
      String nextToken,
      String scanBy,
      int maxDatapoints}) async {
    var response_ = await _client.send('GetMetricData', {
      'MetricDataQueries': metricDataQueries,
      'StartTime': startTime,
      'EndTime': endTime,
      if (nextToken != null) 'NextToken': nextToken,
      if (scanBy != null) 'ScanBy': scanBy,
      if (maxDatapoints != null) 'MaxDatapoints': maxDatapoints,
    });
    return GetMetricDataOutput.fromJson(response_);
  }

  /// Gets statistics for the specified metric.
  ///
  /// The maximum number of data points returned from a single call is 1,440. If
  /// you request more than 1,440 data points, CloudWatch returns an error. To
  /// reduce the number of data points, you can narrow the specified time range
  /// and make multiple requests across adjacent time ranges, or you can
  /// increase the specified period. Data points are not returned in
  /// chronological order.
  ///
  /// CloudWatch aggregates data points based on the length of the period that
  /// you specify. For example, if you request statistics with a one-hour
  /// period, CloudWatch aggregates all data points with time stamps that fall
  /// within each one-hour period. Therefore, the number of values aggregated by
  /// CloudWatch is larger than the number of data points returned.
  ///
  /// CloudWatch needs raw data points to calculate percentile statistics. If
  /// you publish data using a statistic set instead, you can only retrieve
  /// percentile statistics for this data if one of the following conditions is
  /// true:
  ///
  /// *   The SampleCount value of the statistic set is 1.
  ///
  /// *   The Min and the Max values of the statistic set are equal.
  ///
  ///
  /// Percentile statistics are not available for metrics when any of the metric
  /// values are negative numbers.
  ///
  /// Amazon CloudWatch retains metric data as follows:
  ///
  /// *   Data points with a period of less than 60 seconds are available for 3
  /// hours. These data points are high-resolution metrics and are available
  /// only for custom metrics that have been defined with a `StorageResolution`
  /// of 1.
  ///
  /// *   Data points with a period of 60 seconds (1-minute) are available for
  /// 15 days.
  ///
  /// *   Data points with a period of 300 seconds (5-minute) are available for
  /// 63 days.
  ///
  /// *   Data points with a period of 3600 seconds (1 hour) are available for
  /// 455 days (15 months).
  ///
  ///
  /// Data points that are initially published with a shorter period are
  /// aggregated together for long-term storage. For example, if you collect
  /// data using a period of 1 minute, the data remains available for 15 days
  /// with 1-minute resolution. After 15 days, this data is still available, but
  /// is aggregated and retrievable only with a resolution of 5 minutes. After
  /// 63 days, the data is further aggregated and is available with a resolution
  /// of 1 hour.
  ///
  /// CloudWatch started retaining 5-minute and 1-hour metric data as of July 9,
  /// 2016.
  ///
  /// For information about metrics and dimensions supported by AWS services,
  /// see the
  /// [Amazon CloudWatch Metrics and Dimensions Reference](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CW_Support_For_AWS.html)
  /// in the _Amazon CloudWatch User Guide_.
  ///
  /// [namespace]: The namespace of the metric, with or without spaces.
  ///
  /// [metricName]: The name of the metric, with or without spaces.
  ///
  /// [dimensions]: The dimensions. If the metric contains multiple dimensions,
  /// you must include a value for each dimension. CloudWatch treats each unique
  /// combination of dimensions as a separate metric. If a specific combination
  /// of dimensions was not published, you can't retrieve statistics for it. You
  /// must specify the same dimensions that were used when the metrics were
  /// created. For an example, see
  /// [Dimension Combinations](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_concepts.html#dimension-combinations)
  /// in the _Amazon CloudWatch User Guide_. For more information about
  /// specifying dimensions, see
  /// [Publishing Metrics](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/publishingMetrics.html)
  /// in the _Amazon CloudWatch User Guide_.
  ///
  /// [startTime]: The time stamp that determines the first data point to
  /// return. Start times are evaluated relative to the time that CloudWatch
  /// receives the request.
  ///
  /// The value specified is inclusive; results include data points with the
  /// specified time stamp. The time stamp must be in ISO 8601 UTC format (for
  /// example, 2016-10-03T23:00:00Z).
  ///
  /// CloudWatch rounds the specified time stamp as follows:
  ///
  /// *   Start time less than 15 days ago - Round down to the nearest whole
  /// minute. For example, 12:32:34 is rounded down to 12:32:00.
  ///
  /// *   Start time between 15 and 63 days ago - Round down to the nearest
  /// 5-minute clock interval. For example, 12:32:34 is rounded down to
  /// 12:30:00.
  ///
  /// *   Start time greater than 63 days ago - Round down to the nearest 1-hour
  /// clock interval. For example, 12:32:34 is rounded down to 12:00:00.
  ///
  ///
  /// If you set `Period` to 5, 10, or 30, the start time of your request is
  /// rounded down to the nearest time that corresponds to even 5-, 10-, or
  /// 30-second divisions of a minute. For example, if you make a query at
  /// (HH:mm:ss) 01:05:23 for the previous 10-second period, the start time of
  /// your request is rounded down and you receive data from 01:05:10 to
  /// 01:05:20. If you make a query at 15:07:17 for the previous 5 minutes of
  /// data, using a period of 5 seconds, you receive data timestamped between
  /// 15:02:15 and 15:07:15.
  ///
  /// [endTime]: The time stamp that determines the last data point to return.
  ///
  /// The value specified is exclusive; results include data points up to the
  /// specified time stamp. The time stamp must be in ISO 8601 UTC format (for
  /// example, 2016-10-10T23:00:00Z).
  ///
  /// [period]: The granularity, in seconds, of the returned data points. For
  /// metrics with regular resolution, a period can be as short as one minute
  /// (60 seconds) and must be a multiple of 60. For high-resolution metrics
  /// that are collected at intervals of less than one minute, the period can be
  /// 1, 5, 10, 30, 60, or any multiple of 60. High-resolution metrics are those
  /// metrics stored by a `PutMetricData` call that includes a
  /// `StorageResolution` of 1 second.
  ///
  /// If the `StartTime` parameter specifies a time stamp that is greater than 3
  /// hours ago, you must specify the period as follows or no data points in
  /// that time range is returned:
  ///
  /// *   Start time between 3 hours and 15 days ago - Use a multiple of 60
  /// seconds (1 minute).
  ///
  /// *   Start time between 15 and 63 days ago - Use a multiple of 300 seconds
  /// (5 minutes).
  ///
  /// *   Start time greater than 63 days ago - Use a multiple of 3600 seconds
  /// (1 hour).
  ///
  /// [statistics]: The metric statistics, other than percentile. For percentile
  /// statistics, use `ExtendedStatistics`. When calling `GetMetricStatistics`,
  /// you must specify either `Statistics` or `ExtendedStatistics`, but not
  /// both.
  ///
  /// [extendedStatistics]: The percentile statistics. Specify values between
  /// p0.0 and p100. When calling `GetMetricStatistics`, you must specify either
  /// `Statistics` or `ExtendedStatistics`, but not both. Percentile statistics
  /// are not available for metrics when any of the metric values are negative
  /// numbers.
  ///
  /// [unit]: The unit for a given metric. If you omit `Unit`, all data that was
  /// collected with any unit is returned, along with the corresponding units
  /// that were specified when the data was reported to CloudWatch. If you
  /// specify a unit, the operation returns only data data that was collected
  /// with that unit specified. If you specify a unit that does not match the
  /// data collected, the results of the operation are null. CloudWatch does not
  /// perform unit conversions.
  Future<GetMetricStatisticsOutput> getMetricStatistics(
      {@required String namespace,
      @required String metricName,
      List<Dimension> dimensions,
      @required DateTime startTime,
      @required DateTime endTime,
      @required int period,
      List<String> statistics,
      List<String> extendedStatistics,
      String unit}) async {
    var response_ = await _client.send('GetMetricStatistics', {
      'Namespace': namespace,
      'MetricName': metricName,
      if (dimensions != null) 'Dimensions': dimensions,
      'StartTime': startTime,
      'EndTime': endTime,
      'Period': period,
      if (statistics != null) 'Statistics': statistics,
      if (extendedStatistics != null) 'ExtendedStatistics': extendedStatistics,
      if (unit != null) 'Unit': unit,
    });
    return GetMetricStatisticsOutput.fromJson(response_);
  }

  /// You can use the `GetMetricWidgetImage` API to retrieve a snapshot graph of
  /// one or more Amazon CloudWatch metrics as a bitmap image. You can then
  /// embed this image into your services and products, such as wiki pages,
  /// reports, and documents. You could also retrieve images regularly, such as
  /// every minute, and create your own custom live dashboard.
  ///
  /// The graph you retrieve can include all CloudWatch metric graph features,
  /// including metric math and horizontal and vertical annotations.
  ///
  /// There is a limit of 20 transactions per second for this API. Each
  /// `GetMetricWidgetImage` action has the following limits:
  ///
  /// *   As many as 100 metrics in the graph.
  ///
  /// *   Up to 100 KB uncompressed payload.
  ///
  /// [metricWidget]: A JSON string that defines the bitmap graph to be
  /// retrieved. The string includes the metrics to include in the graph,
  /// statistics, annotations, title, axis limits, and so on. You can include
  /// only one `MetricWidget` parameter in each `GetMetricWidgetImage` call.
  ///
  /// For more information about the syntax of `MetricWidget` see
  /// CloudWatch-Metric-Widget-Structure.
  ///
  /// If any metric on the graph could not load all the requested data points,
  /// an orange triangle with an exclamation point appears next to the graph
  /// legend.
  ///
  /// [outputFormat]: The format of the resulting image. Only PNG images are
  /// supported.
  ///
  /// The default is `png`. If you specify `png`, the API returns an HTTP
  /// response with the content-type set to `text/xml`. The image data is in a
  /// `MetricWidgetImage` field. For example:
  ///
  ///   `<GetMetricWidgetImageResponse xmlns=<URLstring>>`
  ///
  ///   `<GetMetricWidgetImageResult>`
  ///
  ///   `<MetricWidgetImage>`
  ///
  ///   `iVBORw0KGgoAAAANSUhEUgAAAlgAAAGQEAYAAAAip...`
  ///
  ///   `</MetricWidgetImage>`
  ///
  ///   `</GetMetricWidgetImageResult>`
  ///
  ///   `<ResponseMetadata>`
  ///
  ///   `<RequestId>6f0d4192-4d42-11e8-82c1-f539a07e0e3b</RequestId>`
  ///
  ///   `</ResponseMetadata>`
  ///
  ///  `</GetMetricWidgetImageResponse>`
  ///
  /// The `image/png` setting is intended only for custom HTTP requests. For
  /// most use cases, and all actions using an AWS SDK, you should use `png`. If
  /// you specify `image/png`, the HTTP response has a content-type set to
  /// `image/png`, and the body of the response is a PNG image.
  Future<GetMetricWidgetImageOutput> getMetricWidgetImage(String metricWidget,
      {String outputFormat}) async {
    var response_ = await _client.send('GetMetricWidgetImage', {
      'MetricWidget': metricWidget,
      if (outputFormat != null) 'OutputFormat': outputFormat,
    });
    return GetMetricWidgetImageOutput.fromJson(response_);
  }

  /// Returns a list of the dashboards for your account. If you include
  /// `DashboardNamePrefix`, only those dashboards with names starting with the
  /// prefix are listed. Otherwise, all dashboards in your account are listed.
  ///
  ///  `ListDashboards` returns up to 1000 results on one page. If there are
  /// more than 1000 dashboards, you can call `ListDashboards` again and include
  /// the value you received for `NextToken` in the first call, to receive the
  /// next 1000 results.
  ///
  /// [dashboardNamePrefix]: If you specify this parameter, only the dashboards
  /// with names starting with the specified string are listed. The maximum
  /// length is 255, and valid characters are A-Z, a-z, 0-9, ".", "-", and "_".
  ///
  /// [nextToken]: The token returned by a previous call to indicate that there
  /// is more data available.
  Future<ListDashboardsOutput> listDashboards(
      {String dashboardNamePrefix, String nextToken}) async {
    var response_ = await _client.send('ListDashboards', {
      if (dashboardNamePrefix != null)
        'DashboardNamePrefix': dashboardNamePrefix,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListDashboardsOutput.fromJson(response_);
  }

  /// List the specified metrics. You can use the returned metrics with
  /// GetMetricData or GetMetricStatistics to obtain statistical data.
  ///
  /// Up to 500 results are returned for any one call. To retrieve additional
  /// results, use the returned token with subsequent calls.
  ///
  /// After you create a metric, allow up to fifteen minutes before the metric
  /// appears. Statistics about the metric, however, are available sooner using
  /// GetMetricData or GetMetricStatistics.
  ///
  /// [namespace]: The namespace to filter against.
  ///
  /// [metricName]: The name of the metric to filter against.
  ///
  /// [dimensions]: The dimensions to filter against.
  ///
  /// [nextToken]: The token returned by a previous call to indicate that there
  /// is more data available.
  Future<ListMetricsOutput> listMetrics(
      {String namespace,
      String metricName,
      List<DimensionFilter> dimensions,
      String nextToken}) async {
    var response_ = await _client.send('ListMetrics', {
      if (namespace != null) 'Namespace': namespace,
      if (metricName != null) 'MetricName': metricName,
      if (dimensions != null) 'Dimensions': dimensions,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListMetricsOutput.fromJson(response_);
  }

  /// Displays the tags associated with a CloudWatch resource. Alarms support
  /// tagging.
  ///
  /// [resourceArn]: The ARN of the CloudWatch resource that you want to view
  /// tags for. For more information on ARN format, see
  /// [Example ARNs](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-cloudwatch)
  /// in the _Amazon Web Services General Reference_.
  Future<ListTagsForResourceOutput> listTagsForResource(
      String resourceArn) async {
    var response_ = await _client.send('ListTagsForResource', {
      'ResourceARN': resourceArn,
    });
    return ListTagsForResourceOutput.fromJson(response_);
  }

  /// Creates an anomaly detection model for a CloudWatch metric. You can use
  /// the model to display a band of expected normal values when the metric is
  /// graphed.
  ///
  /// For more information, see
  /// [CloudWatch Anomaly Detection](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Anomaly_Detection.html).
  ///
  /// [namespace]: The namespace of the metric to create the anomaly detection
  /// model for.
  ///
  /// [metricName]: The name of the metric to create the anomaly detection model
  /// for.
  ///
  /// [dimensions]: The metric dimensions to create the anomaly detection model
  /// for.
  ///
  /// [stat]: The statistic to use for the metric and the anomaly detection
  /// model.
  ///
  /// [configuration]: The configuration specifies details about how the anomaly
  /// detection model is to be trained, including time ranges to exclude when
  /// training and updating the model. You can specify as many as 10 time
  /// ranges.
  ///
  /// The configuration can also include the time zone to use for the metric.
  ///
  /// You can in
  Future<PutAnomalyDetectorOutput> putAnomalyDetector(
      {@required String namespace,
      @required String metricName,
      List<Dimension> dimensions,
      @required String stat,
      AnomalyDetectorConfiguration configuration}) async {
    var response_ = await _client.send('PutAnomalyDetector', {
      'Namespace': namespace,
      'MetricName': metricName,
      if (dimensions != null) 'Dimensions': dimensions,
      'Stat': stat,
      if (configuration != null) 'Configuration': configuration,
    });
    return PutAnomalyDetectorOutput.fromJson(response_);
  }

  /// Creates a dashboard if it does not already exist, or updates an existing
  /// dashboard. If you update a dashboard, the entire contents are replaced
  /// with what you specify here.
  ///
  /// All dashboards in your account are global, not region-specific.
  ///
  /// A simple way to create a dashboard using `PutDashboard` is to copy an
  /// existing dashboard. To copy an existing dashboard using the console, you
  /// can load the dashboard and then use the View/edit source command in the
  /// Actions menu to display the JSON block for that dashboard. Another way to
  /// copy a dashboard is to use `GetDashboard`, and then use the data returned
  /// within `DashboardBody` as the template for the new dashboard when you call
  /// `PutDashboard`.
  ///
  /// When you create a dashboard with `PutDashboard`, a good practice is to add
  /// a text widget at the top of the dashboard with a message that the
  /// dashboard was created by script and should not be changed in the console.
  /// This message could also point console users to the location of the
  /// `DashboardBody` script or the CloudFormation template used to create the
  /// dashboard.
  ///
  /// [dashboardName]: The name of the dashboard. If a dashboard with this name
  /// already exists, this call modifies that dashboard, replacing its current
  /// contents. Otherwise, a new dashboard is created. The maximum length is
  /// 255, and valid characters are A-Z, a-z, 0-9, "-", and "_". This parameter
  /// is required.
  ///
  /// [dashboardBody]: The detailed information about the dashboard in JSON
  /// format, including the widgets to include and their location on the
  /// dashboard. This parameter is required.
  ///
  /// For more information about the syntax, see
  /// CloudWatch-Dashboard-Body-Structure.
  Future<PutDashboardOutput> putDashboard(
      {@required String dashboardName, @required String dashboardBody}) async {
    var response_ = await _client.send('PutDashboard', {
      'DashboardName': dashboardName,
      'DashboardBody': dashboardBody,
    });
    return PutDashboardOutput.fromJson(response_);
  }

  /// Creates or updates an alarm and associates it with the specified metric,
  /// metric math expression, or anomaly detection model.
  ///
  /// Alarms based on anomaly detection models cannot have Auto Scaling actions.
  ///
  /// When this operation creates an alarm, the alarm state is immediately set
  /// to `INSUFFICIENT_DATA`. The alarm is then evaluated and its state is set
  /// appropriately. Any actions associated with the new state are then
  /// executed.
  ///
  /// When you update an existing alarm, its state is left unchanged, but the
  /// update completely overwrites the previous configuration of the alarm.
  ///
  /// If you are an IAM user, you must have Amazon EC2 permissions for some
  /// alarm operations:
  ///
  /// *    `iam:CreateServiceLinkedRole` for all alarms with EC2 actions
  ///
  /// *    `ec2:DescribeInstanceStatus` and `ec2:DescribeInstances` for all
  /// alarms on EC2 instance status metrics
  ///
  /// *    `ec2:StopInstances` for alarms with stop actions
  ///
  /// *    `ec2:TerminateInstances` for alarms with terminate actions
  ///
  /// *   No specific permissions are needed for alarms with recover actions
  ///
  ///
  /// If you have read/write permissions for Amazon CloudWatch but not for
  /// Amazon EC2, you can still create an alarm, but the stop or terminate
  /// actions are not performed. However, if you are later granted the required
  /// permissions, the alarm actions that you created earlier are performed.
  ///
  /// If you are using an IAM role (for example, an EC2 instance profile), you
  /// cannot stop or terminate the instance using alarm actions. However, you
  /// can still see the alarm state and perform any other actions such as Amazon
  /// SNS notifications or Auto Scaling policies.
  ///
  /// If you are using temporary security credentials granted using AWS STS, you
  /// cannot stop or terminate an EC2 instance using alarm actions.
  ///
  /// The first time you create an alarm in the AWS Management Console, the CLI,
  /// or by using the PutMetricAlarm API, CloudWatch creates the necessary
  /// service-linked role for you. The service-linked role is called
  /// `AWSServiceRoleForCloudWatchEvents`. For more information, see
  /// [AWS service-linked role](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_terms-and-concepts.html#iam-term-service-linked-role).
  ///
  /// [alarmName]: The name for the alarm. This name must be unique within your
  /// AWS account.
  ///
  /// [alarmDescription]: The description for the alarm.
  ///
  /// [actionsEnabled]: Indicates whether actions should be executed during any
  /// changes to the alarm state. The default is `TRUE`.
  ///
  /// [okActions]: The actions to execute when this alarm transitions to an `OK`
  /// state from any other state. Each action is specified as an Amazon Resource
  /// Name (ARN).
  ///
  /// Valid Values: `arn:aws:automate:_region_:ec2:stop` |
  /// `arn:aws:automate:_region_:ec2:terminate` |
  /// `arn:aws:automate:_region_:ec2:recover` |
  /// `arn:aws:automate:_region_:ec2:reboot` |
  /// `arn:aws:sns:_region_:_account-id_:_sns-topic-name_`  |
  /// `arn:aws:autoscaling:_region_:_account-id_:scalingPolicy:_policy-id_autoScalingGroupName/_group-friendly-name_:policyName/_policy-friendly-name_`
  ///
  ///
  /// Valid Values (for use with IAM roles):
  /// `arn:aws:swf:_region_:_account-id_:action/actions/AWS_EC2.InstanceId.Stop/1.0`
  /// |
  /// `arn:aws:swf:_region_:_account-id_:action/actions/AWS_EC2.InstanceId.Terminate/1.0`
  /// |
  /// `arn:aws:swf:_region_:_account-id_:action/actions/AWS_EC2.InstanceId.Reboot/1.0`
  ///
  /// [alarmActions]: The actions to execute when this alarm transitions to the
  /// `ALARM` state from any other state. Each action is specified as an Amazon
  /// Resource Name (ARN).
  ///
  /// Valid Values: `arn:aws:automate:_region_:ec2:stop` |
  /// `arn:aws:automate:_region_:ec2:terminate` |
  /// `arn:aws:automate:_region_:ec2:recover` |
  /// `arn:aws:automate:_region_:ec2:reboot` |
  /// `arn:aws:sns:_region_:_account-id_:_sns-topic-name_`  |
  /// `arn:aws:autoscaling:_region_:_account-id_:scalingPolicy:_policy-id_autoScalingGroupName/_group-friendly-name_:policyName/_policy-friendly-name_`
  ///
  ///
  /// Valid Values (for use with IAM roles):
  /// `arn:aws:swf:_region_:_account-id_:action/actions/AWS_EC2.InstanceId.Stop/1.0`
  /// |
  /// `arn:aws:swf:_region_:_account-id_:action/actions/AWS_EC2.InstanceId.Terminate/1.0`
  /// |
  /// `arn:aws:swf:_region_:_account-id_:action/actions/AWS_EC2.InstanceId.Reboot/1.0`
  ///
  /// [insufficientDataActions]: The actions to execute when this alarm
  /// transitions to the `INSUFFICIENT_DATA` state from any other state. Each
  /// action is specified as an Amazon Resource Name (ARN).
  ///
  /// Valid Values: `arn:aws:automate:_region_:ec2:stop` |
  /// `arn:aws:automate:_region_:ec2:terminate` |
  /// `arn:aws:automate:_region_:ec2:recover` |
  /// `arn:aws:automate:_region_:ec2:reboot` |
  /// `arn:aws:sns:_region_:_account-id_:_sns-topic-name_`  |
  /// `arn:aws:autoscaling:_region_:_account-id_:scalingPolicy:_policy-id_autoScalingGroupName/_group-friendly-name_:policyName/_policy-friendly-name_`
  ///
  ///
  /// Valid Values (for use with IAM roles):
  /// `>arn:aws:swf:_region_:_account-id_:action/actions/AWS_EC2.InstanceId.Stop/1.0`
  /// |
  /// `arn:aws:swf:_region_:_account-id_:action/actions/AWS_EC2.InstanceId.Terminate/1.0`
  /// |
  /// `arn:aws:swf:_region_:_account-id_:action/actions/AWS_EC2.InstanceId.Reboot/1.0`
  ///
  /// [metricName]: The name for the metric associated with the alarm. For each
  /// `PutMetricAlarm` operation, you must specify either `MetricName` or a
  /// `Metrics` array.
  ///
  /// If you are creating an alarm based on a math expression, you cannot
  /// specify this parameter, or any of the `Dimensions`, `Period`, `Namespace`,
  /// `Statistic`, or `ExtendedStatistic` parameters. Instead, you specify all
  /// this information in the `Metrics` array.
  ///
  /// [namespace]: The namespace for the metric associated specified in
  /// `MetricName`.
  ///
  /// [statistic]: The statistic for the metric specified in `MetricName`, other
  /// than percentile. For percentile statistics, use `ExtendedStatistic`. When
  /// you call `PutMetricAlarm` and specify a `MetricName`, you must specify
  /// either `Statistic` or `ExtendedStatistic,` but not both.
  ///
  /// [extendedStatistic]: The percentile statistic for the metric specified in
  /// `MetricName`. Specify a value between p0.0 and p100. When you call
  /// `PutMetricAlarm` and specify a `MetricName`, you must specify either
  /// `Statistic` or `ExtendedStatistic,` but not both.
  ///
  /// [dimensions]: The dimensions for the metric specified in `MetricName`.
  ///
  /// [period]: The length, in seconds, used each time the metric specified in
  /// `MetricName` is evaluated. Valid values are 10, 30, and any multiple of
  /// 60.
  ///
  ///  `Period` is required for alarms based on static thresholds. If you are
  /// creating an alarm based on a metric math expression, you specify the
  /// period for each metric within the objects in the `Metrics` array.
  ///
  /// Be sure to specify 10 or 30 only for metrics that are stored by a
  /// `PutMetricData` call with a `StorageResolution` of 1. If you specify a
  /// period of 10 or 30 for a metric that does not have sub-minute resolution,
  /// the alarm still attempts to gather data at the period rate that you
  /// specify. In this case, it does not receive data for the attempts that do
  /// not correspond to a one-minute data resolution, and the alarm may often
  /// lapse into INSUFFICENT_DATA status. Specifying 10 or 30 also sets this
  /// alarm as a high-resolution alarm, which has a higher charge than other
  /// alarms. For more information about pricing, see
  /// [Amazon CloudWatch Pricing](https://aws.amazon.com/cloudwatch/pricing/).
  ///
  /// An alarm's total current evaluation period can be no longer than one day,
  /// so `Period` multiplied by `EvaluationPeriods` cannot be more than 86,400
  /// seconds.
  ///
  /// [unit]: The unit of measure for the statistic. For example, the units for
  /// the Amazon EC2 NetworkIn metric are Bytes because NetworkIn tracks the
  /// number of bytes that an instance receives on all network interfaces. You
  /// can also specify a unit when you create a custom metric. Units help
  /// provide conceptual meaning to your data. Metric data points that specify a
  /// unit of measure, such as Percent, are aggregated separately.
  ///
  /// If you don't specify `Unit`, CloudWatch retrieves all unit types that have
  /// been published for the metric and attempts to evaluate the alarm. Usually
  /// metrics are published with only one unit, so the alarm will work as
  /// intended.
  ///
  /// However, if the metric is published with multiple types of units and you
  /// don't specify a unit, the alarm's behavior is not defined and will behave
  /// un-predictably.
  ///
  /// We recommend omitting `Unit` so that you don't inadvertently specify an
  /// incorrect unit that is not published for this metric. Doing so causes the
  /// alarm to be stuck in the `INSUFFICIENT DATA` state.
  ///
  /// [evaluationPeriods]: The number of periods over which data is compared to
  /// the specified threshold. If you are setting an alarm that requires that a
  /// number of consecutive data points be breaching to trigger the alarm, this
  /// value specifies that number. If you are setting an "M out of N" alarm,
  /// this value is the N.
  ///
  /// An alarm's total current evaluation period can be no longer than one day,
  /// so this number multiplied by `Period` cannot be more than 86,400 seconds.
  ///
  /// [datapointsToAlarm]: The number of datapoints that must be breaching to
  /// trigger the alarm. This is used only if you are setting an "M out of N"
  /// alarm. In that case, this value is the M. For more information, see
  /// [Evaluating an Alarm](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/AlarmThatSendsEmail.html#alarm-evaluation)
  /// in the _Amazon CloudWatch User Guide_.
  ///
  /// [threshold]: The value against which the specified statistic is compared.
  ///
  /// This parameter is required for alarms based on static thresholds, but
  /// should not be used for alarms based on anomaly detection models.
  ///
  /// [comparisonOperator]:  The arithmetic operation to use when comparing the
  /// specified statistic and threshold. The specified statistic value is used
  /// as the first operand.
  ///
  /// The values `LessThanLowerOrGreaterThanUpperThreshold`,
  /// `LessThanLowerThreshold`, and `GreaterThanUpperThreshold` are used only
  /// for alarms based on anomaly detection models.
  ///
  /// [treatMissingData]:  Sets how this alarm is to handle missing data points.
  /// If `TreatMissingData` is omitted, the default behavior of `missing` is
  /// used. For more information, see
  /// [Configuring How CloudWatch Alarms Treats Missing Data](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/AlarmThatSendsEmail.html#alarms-and-missing-data).
  ///
  /// Valid Values: `breaching | notBreaching | ignore | missing`
  ///
  /// [evaluateLowSampleCountPercentile]:  Used only for alarms based on
  /// percentiles. If you specify `ignore`, the alarm state does not change
  /// during periods with too few data points to be statistically significant.
  /// If you specify `evaluate` or omit this parameter, the alarm is always
  /// evaluated and possibly changes state no matter how many data points are
  /// available. For more information, see
  /// [Percentile-Based CloudWatch Alarms and Low Data Samples](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/AlarmThatSendsEmail.html#percentiles-with-low-samples).
  ///
  /// Valid Values: `evaluate | ignore`
  ///
  /// [metrics]: An array of `MetricDataQuery` structures that enable you to
  /// create an alarm based on the result of a metric math expression. For each
  /// `PutMetricAlarm` operation, you must specify either `MetricName` or a
  /// `Metrics` array.
  ///
  /// Each item in the `Metrics` array either retrieves a metric or performs a
  /// math expression.
  ///
  /// One item in the `Metrics` array is the expression that the alarm watches.
  /// You designate this expression by setting `ReturnValue` to true for this
  /// object in the array. For more information, see MetricDataQuery.
  ///
  /// If you use the `Metrics` parameter, you cannot include the `MetricName`,
  /// `Dimensions`, `Period`, `Namespace`, `Statistic`, or `ExtendedStatistic`
  /// parameters of `PutMetricAlarm` in the same operation. Instead, you
  /// retrieve the metrics you are using in your math expression as part of the
  /// `Metrics` array.
  ///
  /// [tags]: A list of key-value pairs to associate with the alarm. You can
  /// associate as many as 50 tags with an alarm.
  ///
  /// Tags can help you organize and categorize your resources. You can also use
  /// them to scope user permissions, by granting a user permission to access or
  /// change only resources with certain tag values.
  ///
  /// [thresholdMetricId]: If this is an alarm based on an anomaly detection
  /// model, make this value match the ID of the `ANOMALY_DETECTION_BAND`
  /// function.
  ///
  /// For an example of how to use this parameter, see the **Anomaly Detection
  /// Model Alarm** example on this page.
  ///
  /// If your alarm uses this parameter, it cannot have Auto Scaling actions.
  Future<void> putMetricAlarm(
      {@required String alarmName,
      String alarmDescription,
      bool actionsEnabled,
      List<String> okActions,
      List<String> alarmActions,
      List<String> insufficientDataActions,
      String metricName,
      String namespace,
      String statistic,
      String extendedStatistic,
      List<Dimension> dimensions,
      int period,
      String unit,
      @required int evaluationPeriods,
      int datapointsToAlarm,
      double threshold,
      @required String comparisonOperator,
      String treatMissingData,
      String evaluateLowSampleCountPercentile,
      List<MetricDataQuery> metrics,
      List<Tag> tags,
      String thresholdMetricId}) async {
    await _client.send('PutMetricAlarm', {
      'AlarmName': alarmName,
      if (alarmDescription != null) 'AlarmDescription': alarmDescription,
      if (actionsEnabled != null) 'ActionsEnabled': actionsEnabled,
      if (okActions != null) 'OKActions': okActions,
      if (alarmActions != null) 'AlarmActions': alarmActions,
      if (insufficientDataActions != null)
        'InsufficientDataActions': insufficientDataActions,
      if (metricName != null) 'MetricName': metricName,
      if (namespace != null) 'Namespace': namespace,
      if (statistic != null) 'Statistic': statistic,
      if (extendedStatistic != null) 'ExtendedStatistic': extendedStatistic,
      if (dimensions != null) 'Dimensions': dimensions,
      if (period != null) 'Period': period,
      if (unit != null) 'Unit': unit,
      'EvaluationPeriods': evaluationPeriods,
      if (datapointsToAlarm != null) 'DatapointsToAlarm': datapointsToAlarm,
      if (threshold != null) 'Threshold': threshold,
      'ComparisonOperator': comparisonOperator,
      if (treatMissingData != null) 'TreatMissingData': treatMissingData,
      if (evaluateLowSampleCountPercentile != null)
        'EvaluateLowSampleCountPercentile': evaluateLowSampleCountPercentile,
      if (metrics != null) 'Metrics': metrics,
      if (tags != null) 'Tags': tags,
      if (thresholdMetricId != null) 'ThresholdMetricId': thresholdMetricId,
    });
  }

  /// Publishes metric data points to Amazon CloudWatch. CloudWatch associates
  /// the data points with the specified metric. If the specified metric does
  /// not exist, CloudWatch creates the metric. When CloudWatch creates a
  /// metric, it can take up to fifteen minutes for the metric to appear in
  /// calls to ListMetrics.
  ///
  /// You can publish either individual data points in the `Value` field, or
  /// arrays of values and the number of times each value occurred during the
  /// period by using the `Values` and `Counts` fields in the `MetricDatum`
  /// structure. Using the `Values` and `Counts` method enables you to publish
  /// up to 150 values per metric with one `PutMetricData` request, and supports
  /// retrieving percentile statistics on this data.
  ///
  /// Each `PutMetricData` request is limited to 40 KB in size for HTTP POST
  /// requests. You can send a payload compressed by gzip. Each request is also
  /// limited to no more than 20 different metrics.
  ///
  /// Although the `Value` parameter accepts numbers of type `Double`,
  /// CloudWatch rejects values that are either too small or too large. Values
  /// must be in the range of 8.515920e-109 to 1.174271e+108 (Base 10) or 2e-360
  /// to 2e360 (Base 2). In addition, special values (for example, NaN,
  /// +Infinity, -Infinity) are not supported.
  ///
  /// You can use up to 10 dimensions per metric to further clarify what data
  /// the metric collects. Each dimension consists of a Name and Value pair. For
  /// more information about specifying dimensions, see
  /// [Publishing Metrics](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/publishingMetrics.html)
  /// in the _Amazon CloudWatch User Guide_.
  ///
  /// Data points with time stamps from 24 hours ago or longer can take at least
  /// 48 hours to become available for GetMetricData or GetMetricStatistics from
  /// the time they are submitted.
  ///
  /// CloudWatch needs raw data points to calculate percentile statistics. If
  /// you publish data using a statistic set instead, you can only retrieve
  /// percentile statistics for this data if one of the following conditions is
  /// true:
  ///
  /// *   The `SampleCount` value of the statistic set is 1 and `Min`, `Max`,
  /// and `Sum` are all equal.
  ///
  /// *   The `Min` and `Max` are equal, and `Sum` is equal to `Min` multiplied
  /// by `SampleCount`.
  ///
  /// [namespace]: The namespace for the metric data.
  ///
  /// To avoid conflicts with AWS service namespaces, you should not specify a
  /// namespace that begins with `AWS/`
  ///
  /// [metricData]: The data for the metric. The array can include no more than
  /// 20 metrics per call.
  Future<void> putMetricData(
      {@required String namespace,
      @required List<MetricDatum> metricData}) async {
    await _client.send('PutMetricData', {
      'Namespace': namespace,
      'MetricData': metricData,
    });
  }

  /// Temporarily sets the state of an alarm for testing purposes. When the
  /// updated state differs from the previous value, the action configured for
  /// the appropriate state is invoked. For example, if your alarm is configured
  /// to send an Amazon SNS message when an alarm is triggered, temporarily
  /// changing the alarm state to `ALARM` sends an SNS message. The alarm
  /// returns to its actual state (often within seconds). Because the alarm
  /// state change happens quickly, it is typically only visible in the alarm's
  /// **History** tab in the Amazon CloudWatch console or through
  /// DescribeAlarmHistory.
  ///
  /// [alarmName]: The name for the alarm. This name must be unique within the
  /// AWS account. The maximum length is 255 characters.
  ///
  /// [stateValue]: The value of the state.
  ///
  /// [stateReason]: The reason that this alarm is set to this specific state,
  /// in text format.
  ///
  /// [stateReasonData]: The reason that this alarm is set to this specific
  /// state, in JSON format.
  Future<void> setAlarmState(
      {@required String alarmName,
      @required String stateValue,
      @required String stateReason,
      String stateReasonData}) async {
    await _client.send('SetAlarmState', {
      'AlarmName': alarmName,
      'StateValue': stateValue,
      'StateReason': stateReason,
      if (stateReasonData != null) 'StateReasonData': stateReasonData,
    });
  }

  /// Assigns one or more tags (key-value pairs) to the specified CloudWatch
  /// resource. Tags can help you organize and categorize your resources. You
  /// can also use them to scope user permissions, by granting a user permission
  /// to access or change only resources with certain tag values. In CloudWatch,
  /// alarms can be tagged.
  ///
  /// Tags don't have any semantic meaning to AWS and are interpreted strictly
  /// as strings of characters.
  ///
  /// You can use the `TagResource` action with a resource that already has
  /// tags. If you specify a new tag key for the resource, this tag is appended
  /// to the list of tags associated with the resource. If you specify a tag key
  /// that is already associated with the resource, the new tag value that you
  /// specify replaces the previous value for that tag.
  ///
  /// You can associate as many as 50 tags with a resource.
  ///
  /// [resourceArn]: The ARN of the CloudWatch resource that you're adding tags
  /// to. For more information on ARN format, see
  /// [Example ARNs](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-cloudwatch)
  /// in the _Amazon Web Services General Reference_.
  ///
  /// [tags]: The list of key-value pairs to associate with the resource.
  Future<TagResourceOutput> tagResource(
      {@required String resourceArn, @required List<Tag> tags}) async {
    var response_ = await _client.send('TagResource', {
      'ResourceARN': resourceArn,
      'Tags': tags,
    });
    return TagResourceOutput.fromJson(response_);
  }

  /// Removes one or more tags from the specified resource.
  ///
  /// [resourceArn]: The ARN of the CloudWatch resource that you're removing
  /// tags from. For more information on ARN format, see
  /// [Example ARNs](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-cloudwatch)
  /// in the _Amazon Web Services General Reference_.
  ///
  /// [tagKeys]: The list of tag keys to remove from the resource.
  Future<UntagResourceOutput> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {
    var response_ = await _client.send('UntagResource', {
      'ResourceARN': resourceArn,
      'TagKeys': tagKeys,
    });
    return UntagResourceOutput.fromJson(response_);
  }
}

/// Represents the history of a specific alarm.
class AlarmHistoryItem {
  /// The descriptive name for the alarm.
  final String alarmName;

  /// The time stamp for the alarm history item.
  final DateTime timestamp;

  /// The type of alarm history item.
  final String historyItemType;

  /// A summary of the alarm history, in text format.
  final String historySummary;

  /// Data about the alarm, in JSON format.
  final String historyData;

  AlarmHistoryItem({
    this.alarmName,
    this.timestamp,
    this.historyItemType,
    this.historySummary,
    this.historyData,
  });
  static AlarmHistoryItem fromJson(Map<String, dynamic> json) =>
      AlarmHistoryItem(
        alarmName:
            json.containsKey('AlarmName') ? json['AlarmName'] as String : null,
        timestamp: json.containsKey('Timestamp')
            ? DateTime.parse(json['Timestamp'])
            : null,
        historyItemType: json.containsKey('HistoryItemType')
            ? json['HistoryItemType'] as String
            : null,
        historySummary: json.containsKey('HistorySummary')
            ? json['HistorySummary'] as String
            : null,
        historyData: json.containsKey('HistoryData')
            ? json['HistoryData'] as String
            : null,
      );
}

/// An anomaly detection model associated with a particular CloudWatch metric
/// athresnd statistic. You can use the model to display a band of expected
/// normal values when the metric is graphed.
class AnomalyDetector {
  /// The namespace of the metric associated with the anomaly detection model.
  final String namespace;

  /// The name of the metric associated with the anomaly detection model.
  final String metricName;

  /// The metric dimensions associated with the anomaly detection model.
  final List<Dimension> dimensions;

  /// The statistic associated with the anomaly detection model.
  final String stat;

  /// The configuration specifies details about how the anomaly detection model
  /// is to be trained, including time ranges to exclude from use for training
  /// the model, and the time zone to use for the metric.
  final AnomalyDetectorConfiguration configuration;

  AnomalyDetector({
    this.namespace,
    this.metricName,
    this.dimensions,
    this.stat,
    this.configuration,
  });
  static AnomalyDetector fromJson(Map<String, dynamic> json) => AnomalyDetector(
        namespace:
            json.containsKey('Namespace') ? json['Namespace'] as String : null,
        metricName: json.containsKey('MetricName')
            ? json['MetricName'] as String
            : null,
        dimensions: json.containsKey('Dimensions')
            ? (json['Dimensions'] as List)
                .map((e) => Dimension.fromJson(e))
                .toList()
            : null,
        stat: json.containsKey('Stat') ? json['Stat'] as String : null,
        configuration: json.containsKey('Configuration')
            ? AnomalyDetectorConfiguration.fromJson(json['Configuration'])
            : null,
      );
}

/// The configuration specifies details about how the anomaly detection model is
/// to be trained, including time ranges to exclude from use for training the
/// model and the time zone to use for the metric.
class AnomalyDetectorConfiguration {
  /// An array of time ranges to exclude from use when the anomaly detection
  /// model is trained. Use this to make sure that events that could cause
  /// unusual values for the metric, such as deployments, aren't used when
  /// CloudWatch creates the model.
  final List<Range> excludedTimeRanges;

  /// The time zone to use for the metric. This is useful to enable the model to
  /// automatically account for daylight savings time changes if the metric is
  /// sensitive to such time changes.
  ///
  /// To specify a time zone, use the name of the time zone as specified in the
  /// standard tz database. For more information, see
  /// [tz database](https://en.wikipedia.org/wiki/Tz_database).
  final String metricTimezone;

  AnomalyDetectorConfiguration({
    this.excludedTimeRanges,
    this.metricTimezone,
  });
  static AnomalyDetectorConfiguration fromJson(Map<String, dynamic> json) =>
      AnomalyDetectorConfiguration(
        excludedTimeRanges: json.containsKey('ExcludedTimeRanges')
            ? (json['ExcludedTimeRanges'] as List)
                .map((e) => Range.fromJson(e))
                .toList()
            : null,
        metricTimezone: json.containsKey('MetricTimezone')
            ? json['MetricTimezone'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Represents a specific dashboard.
class DashboardEntry {
  /// The name of the dashboard.
  final String dashboardName;

  /// The Amazon Resource Name (ARN) of the dashboard.
  final String dashboardArn;

  /// The time stamp of when the dashboard was last modified, either by an API
  /// call or through the console. This number is expressed as the number of
  /// milliseconds since Jan 1, 1970 00:00:00 UTC.
  final DateTime lastModified;

  /// The size of the dashboard, in bytes.
  final BigInt size;

  DashboardEntry({
    this.dashboardName,
    this.dashboardArn,
    this.lastModified,
    this.size,
  });
  static DashboardEntry fromJson(Map<String, dynamic> json) => DashboardEntry(
        dashboardName: json.containsKey('DashboardName')
            ? json['DashboardName'] as String
            : null,
        dashboardArn: json.containsKey('DashboardArn')
            ? json['DashboardArn'] as String
            : null,
        lastModified: json.containsKey('LastModified')
            ? DateTime.parse(json['LastModified'])
            : null,
        size: json.containsKey('Size') ? BigInt.from(json['Size']) : null,
      );
}

/// An error or warning for the operation.
class DashboardValidationMessage {
  /// The data path related to the message.
  final String dataPath;

  /// A message describing the error or warning.
  final String message;

  DashboardValidationMessage({
    this.dataPath,
    this.message,
  });
  static DashboardValidationMessage fromJson(Map<String, dynamic> json) =>
      DashboardValidationMessage(
        dataPath:
            json.containsKey('DataPath') ? json['DataPath'] as String : null,
        message: json.containsKey('Message') ? json['Message'] as String : null,
      );
}

/// Encapsulates the statistical data that CloudWatch computes from metric data.
class Datapoint {
  /// The time stamp used for the data point.
  final DateTime timestamp;

  /// The number of metric values that contributed to the aggregate value of
  /// this data point.
  final double sampleCount;

  /// The average of the metric values that correspond to the data point.
  final double average;

  /// The sum of the metric values for the data point.
  final double sum;

  /// The minimum metric value for the data point.
  final double minimum;

  /// The maximum metric value for the data point.
  final double maximum;

  /// The standard unit for the data point.
  final String unit;

  /// The percentile statistic for the data point.
  final Map<String, double> extendedStatistics;

  Datapoint({
    this.timestamp,
    this.sampleCount,
    this.average,
    this.sum,
    this.minimum,
    this.maximum,
    this.unit,
    this.extendedStatistics,
  });
  static Datapoint fromJson(Map<String, dynamic> json) => Datapoint(
        timestamp: json.containsKey('Timestamp')
            ? DateTime.parse(json['Timestamp'])
            : null,
        sampleCount: json.containsKey('SampleCount')
            ? json['SampleCount'] as double
            : null,
        average: json.containsKey('Average') ? json['Average'] as double : null,
        sum: json.containsKey('Sum') ? json['Sum'] as double : null,
        minimum: json.containsKey('Minimum') ? json['Minimum'] as double : null,
        maximum: json.containsKey('Maximum') ? json['Maximum'] as double : null,
        unit: json.containsKey('Unit') ? json['Unit'] as String : null,
        extendedStatistics: json.containsKey('ExtendedStatistics')
            ? (json['ExtendedStatistics'] as Map)
                .map((k, v) => MapEntry(k as String, v as double))
            : null,
      );
}

class DeleteAnomalyDetectorOutput {
  DeleteAnomalyDetectorOutput();
  static DeleteAnomalyDetectorOutput fromJson(Map<String, dynamic> json) =>
      DeleteAnomalyDetectorOutput();
}

class DeleteDashboardsOutput {
  DeleteDashboardsOutput();
  static DeleteDashboardsOutput fromJson(Map<String, dynamic> json) =>
      DeleteDashboardsOutput();
}

class DescribeAlarmHistoryOutput {
  /// The alarm histories, in JSON format.
  final List<AlarmHistoryItem> alarmHistoryItems;

  /// The token that marks the start of the next batch of returned results.
  final String nextToken;

  DescribeAlarmHistoryOutput({
    this.alarmHistoryItems,
    this.nextToken,
  });
  static DescribeAlarmHistoryOutput fromJson(Map<String, dynamic> json) =>
      DescribeAlarmHistoryOutput(
        alarmHistoryItems: json.containsKey('AlarmHistoryItems')
            ? (json['AlarmHistoryItems'] as List)
                .map((e) => AlarmHistoryItem.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class DescribeAlarmsForMetricOutput {
  /// The information for each alarm with the specified metric.
  final List<MetricAlarm> metricAlarms;

  DescribeAlarmsForMetricOutput({
    this.metricAlarms,
  });
  static DescribeAlarmsForMetricOutput fromJson(Map<String, dynamic> json) =>
      DescribeAlarmsForMetricOutput(
        metricAlarms: json.containsKey('MetricAlarms')
            ? (json['MetricAlarms'] as List)
                .map((e) => MetricAlarm.fromJson(e))
                .toList()
            : null,
      );
}

class DescribeAlarmsOutput {
  /// The information for the specified alarms.
  final List<MetricAlarm> metricAlarms;

  /// The token that marks the start of the next batch of returned results.
  final String nextToken;

  DescribeAlarmsOutput({
    this.metricAlarms,
    this.nextToken,
  });
  static DescribeAlarmsOutput fromJson(Map<String, dynamic> json) =>
      DescribeAlarmsOutput(
        metricAlarms: json.containsKey('MetricAlarms')
            ? (json['MetricAlarms'] as List)
                .map((e) => MetricAlarm.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class DescribeAnomalyDetectorsOutput {
  /// The list of anomaly detection models returned by the operation.
  final List<AnomalyDetector> anomalyDetectors;

  /// A token that you can use in a subsequent operation to retrieve the next
  /// set of results.
  final String nextToken;

  DescribeAnomalyDetectorsOutput({
    this.anomalyDetectors,
    this.nextToken,
  });
  static DescribeAnomalyDetectorsOutput fromJson(Map<String, dynamic> json) =>
      DescribeAnomalyDetectorsOutput(
        anomalyDetectors: json.containsKey('AnomalyDetectors')
            ? (json['AnomalyDetectors'] as List)
                .map((e) => AnomalyDetector.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// Expands the identity of a metric.
class Dimension {
  /// The name of the dimension.
  final String name;

  /// The value representing the dimension measurement.
  final String value;

  Dimension({
    @required this.name,
    @required this.value,
  });
  static Dimension fromJson(Map<String, dynamic> json) => Dimension(
        name: json['Name'] as String,
        value: json['Value'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Represents filters for a dimension.
class DimensionFilter {
  /// The dimension name to be matched.
  final String name;

  /// The value of the dimension to be matched.
  final String value;

  DimensionFilter({
    @required this.name,
    this.value,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class GetDashboardOutput {
  /// The Amazon Resource Name (ARN) of the dashboard.
  final String dashboardArn;

  /// The detailed information about the dashboard, including what widgets are
  /// included and their location on the dashboard. For more information about
  /// the `DashboardBody` syntax, see CloudWatch-Dashboard-Body-Structure.
  final String dashboardBody;

  /// The name of the dashboard.
  final String dashboardName;

  GetDashboardOutput({
    this.dashboardArn,
    this.dashboardBody,
    this.dashboardName,
  });
  static GetDashboardOutput fromJson(Map<String, dynamic> json) =>
      GetDashboardOutput(
        dashboardArn: json.containsKey('DashboardArn')
            ? json['DashboardArn'] as String
            : null,
        dashboardBody: json.containsKey('DashboardBody')
            ? json['DashboardBody'] as String
            : null,
        dashboardName: json.containsKey('DashboardName')
            ? json['DashboardName'] as String
            : null,
      );
}

class GetMetricDataOutput {
  /// The metrics that are returned, including the metric name, namespace, and
  /// dimensions.
  final List<MetricDataResult> metricDataResults;

  /// A token that marks the next batch of returned results.
  final String nextToken;

  /// Contains a message about this `GetMetricData` operation, if the operation
  /// results in such a message. An example of a message that may be returned is
  /// `Maximum number of allowed metrics exceeded`. If there is a message, as
  /// much of the operation as possible is still executed.
  ///
  /// A message appears here only if it is related to the global `GetMetricData`
  /// operation. Any message about a specific metric returned by the operation
  /// appears in the `MetricDataResult` object returned for that metric.
  final List<MessageData> messages;

  GetMetricDataOutput({
    this.metricDataResults,
    this.nextToken,
    this.messages,
  });
  static GetMetricDataOutput fromJson(Map<String, dynamic> json) =>
      GetMetricDataOutput(
        metricDataResults: json.containsKey('MetricDataResults')
            ? (json['MetricDataResults'] as List)
                .map((e) => MetricDataResult.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
        messages: json.containsKey('Messages')
            ? (json['Messages'] as List)
                .map((e) => MessageData.fromJson(e))
                .toList()
            : null,
      );
}

class GetMetricStatisticsOutput {
  /// A label for the specified metric.
  final String label;

  /// The data points for the specified metric.
  final List<Datapoint> datapoints;

  GetMetricStatisticsOutput({
    this.label,
    this.datapoints,
  });
  static GetMetricStatisticsOutput fromJson(Map<String, dynamic> json) =>
      GetMetricStatisticsOutput(
        label: json.containsKey('Label') ? json['Label'] as String : null,
        datapoints: json.containsKey('Datapoints')
            ? (json['Datapoints'] as List)
                .map((e) => Datapoint.fromJson(e))
                .toList()
            : null,
      );
}

class GetMetricWidgetImageOutput {
  /// The image of the graph, in the output format specified.
  final Uint8List metricWidgetImage;

  GetMetricWidgetImageOutput({
    this.metricWidgetImage,
  });
  static GetMetricWidgetImageOutput fromJson(Map<String, dynamic> json) =>
      GetMetricWidgetImageOutput(
        metricWidgetImage: json.containsKey('MetricWidgetImage')
            ? Uint8List(json['MetricWidgetImage'])
            : null,
      );
}

class ListDashboardsOutput {
  /// The list of matching dashboards.
  final List<DashboardEntry> dashboardEntries;

  /// The token that marks the start of the next batch of returned results.
  final String nextToken;

  ListDashboardsOutput({
    this.dashboardEntries,
    this.nextToken,
  });
  static ListDashboardsOutput fromJson(Map<String, dynamic> json) =>
      ListDashboardsOutput(
        dashboardEntries: json.containsKey('DashboardEntries')
            ? (json['DashboardEntries'] as List)
                .map((e) => DashboardEntry.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListMetricsOutput {
  /// The metrics.
  final List<Metric> metrics;

  /// The token that marks the start of the next batch of returned results.
  final String nextToken;

  ListMetricsOutput({
    this.metrics,
    this.nextToken,
  });
  static ListMetricsOutput fromJson(Map<String, dynamic> json) =>
      ListMetricsOutput(
        metrics: json.containsKey('Metrics')
            ? (json['Metrics'] as List).map((e) => Metric.fromJson(e)).toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListTagsForResourceOutput {
  /// The list of tag keys and values associated with the resource you
  /// specified.
  final List<Tag> tags;

  ListTagsForResourceOutput({
    this.tags,
  });
  static ListTagsForResourceOutput fromJson(Map<String, dynamic> json) =>
      ListTagsForResourceOutput(
        tags: json.containsKey('Tags')
            ? (json['Tags'] as List).map((e) => Tag.fromJson(e)).toList()
            : null,
      );
}

/// A message returned by the `GetMetricData`API, including a code and a
/// description.
class MessageData {
  /// The error code or status code associated with the message.
  final String code;

  /// The message text.
  final String value;

  MessageData({
    this.code,
    this.value,
  });
  static MessageData fromJson(Map<String, dynamic> json) => MessageData(
        code: json.containsKey('Code') ? json['Code'] as String : null,
        value: json.containsKey('Value') ? json['Value'] as String : null,
      );
}

/// Represents a specific metric.
class Metric {
  /// The namespace of the metric.
  final String namespace;

  /// The name of the metric. This is a required field.
  final String metricName;

  /// The dimensions for the metric.
  final List<Dimension> dimensions;

  Metric({
    this.namespace,
    this.metricName,
    this.dimensions,
  });
  static Metric fromJson(Map<String, dynamic> json) => Metric(
        namespace:
            json.containsKey('Namespace') ? json['Namespace'] as String : null,
        metricName: json.containsKey('MetricName')
            ? json['MetricName'] as String
            : null,
        dimensions: json.containsKey('Dimensions')
            ? (json['Dimensions'] as List)
                .map((e) => Dimension.fromJson(e))
                .toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Represents an alarm.
class MetricAlarm {
  /// The name of the alarm.
  final String alarmName;

  /// The Amazon Resource Name (ARN) of the alarm.
  final String alarmArn;

  /// The description of the alarm.
  final String alarmDescription;

  /// The time stamp of the last update to the alarm configuration.
  final DateTime alarmConfigurationUpdatedTimestamp;

  /// Indicates whether actions should be executed during any changes to the
  /// alarm state.
  final bool actionsEnabled;

  /// The actions to execute when this alarm transitions to the `OK` state from
  /// any other state. Each action is specified as an Amazon Resource Name
  /// (ARN).
  final List<String> okActions;

  /// The actions to execute when this alarm transitions to the `ALARM` state
  /// from any other state. Each action is specified as an Amazon Resource Name
  /// (ARN).
  final List<String> alarmActions;

  /// The actions to execute when this alarm transitions to the
  /// `INSUFFICIENT_DATA` state from any other state. Each action is specified
  /// as an Amazon Resource Name (ARN).
  final List<String> insufficientDataActions;

  /// The state value for the alarm.
  final String stateValue;

  /// An explanation for the alarm state, in text format.
  final String stateReason;

  /// An explanation for the alarm state, in JSON format.
  final String stateReasonData;

  /// The time stamp of the last update to the alarm state.
  final DateTime stateUpdatedTimestamp;

  /// The name of the metric associated with the alarm, if this is an alarm
  /// based on a single metric.
  final String metricName;

  /// The namespace of the metric associated with the alarm.
  final String namespace;

  /// The statistic for the metric associated with the alarm, other than
  /// percentile. For percentile statistics, use `ExtendedStatistic`.
  final String statistic;

  /// The percentile statistic for the metric associated with the alarm. Specify
  /// a value between p0.0 and p100.
  final String extendedStatistic;

  /// The dimensions for the metric associated with the alarm.
  final List<Dimension> dimensions;

  /// The period, in seconds, over which the statistic is applied.
  final int period;

  /// The unit of the metric associated with the alarm.
  final String unit;

  /// The number of periods over which data is compared to the specified
  /// threshold.
  final int evaluationPeriods;

  /// The number of datapoints that must be breaching to trigger the alarm.
  final int datapointsToAlarm;

  /// The value to compare with the specified statistic.
  final double threshold;

  /// The arithmetic operation to use when comparing the specified statistic and
  /// threshold. The specified statistic value is used as the first operand.
  final String comparisonOperator;

  /// Sets how this alarm is to handle missing data points. If this parameter is
  /// omitted, the default behavior of `missing` is used.
  final String treatMissingData;

  /// Used only for alarms based on percentiles. If `ignore`, the alarm state
  /// does not change during periods with too few data points to be
  /// statistically significant. If `evaluate` or this parameter is not used,
  /// the alarm is always evaluated and possibly changes state no matter how
  /// many data points are available.
  final String evaluateLowSampleCountPercentile;

  /// An array of MetricDataQuery structures, used in an alarm based on a metric
  /// math expression. Each structure either retrieves a metric or performs a
  /// math expression. One item in the Metrics array is the math expression that
  /// the alarm watches. This expression by designated by having `ReturnValue`
  /// set to true.
  final List<MetricDataQuery> metrics;

  /// In an alarm based on an anomaly detection model, this is the ID of the
  /// `ANOMALY_DETECTION_BAND` function used as the threshold for the alarm.
  final String thresholdMetricId;

  MetricAlarm({
    this.alarmName,
    this.alarmArn,
    this.alarmDescription,
    this.alarmConfigurationUpdatedTimestamp,
    this.actionsEnabled,
    this.okActions,
    this.alarmActions,
    this.insufficientDataActions,
    this.stateValue,
    this.stateReason,
    this.stateReasonData,
    this.stateUpdatedTimestamp,
    this.metricName,
    this.namespace,
    this.statistic,
    this.extendedStatistic,
    this.dimensions,
    this.period,
    this.unit,
    this.evaluationPeriods,
    this.datapointsToAlarm,
    this.threshold,
    this.comparisonOperator,
    this.treatMissingData,
    this.evaluateLowSampleCountPercentile,
    this.metrics,
    this.thresholdMetricId,
  });
  static MetricAlarm fromJson(Map<String, dynamic> json) => MetricAlarm(
        alarmName:
            json.containsKey('AlarmName') ? json['AlarmName'] as String : null,
        alarmArn:
            json.containsKey('AlarmArn') ? json['AlarmArn'] as String : null,
        alarmDescription: json.containsKey('AlarmDescription')
            ? json['AlarmDescription'] as String
            : null,
        alarmConfigurationUpdatedTimestamp:
            json.containsKey('AlarmConfigurationUpdatedTimestamp')
                ? DateTime.parse(json['AlarmConfigurationUpdatedTimestamp'])
                : null,
        actionsEnabled: json.containsKey('ActionsEnabled')
            ? json['ActionsEnabled'] as bool
            : null,
        okActions: json.containsKey('OKActions')
            ? (json['OKActions'] as List).map((e) => e as String).toList()
            : null,
        alarmActions: json.containsKey('AlarmActions')
            ? (json['AlarmActions'] as List).map((e) => e as String).toList()
            : null,
        insufficientDataActions: json.containsKey('InsufficientDataActions')
            ? (json['InsufficientDataActions'] as List)
                .map((e) => e as String)
                .toList()
            : null,
        stateValue: json.containsKey('StateValue')
            ? json['StateValue'] as String
            : null,
        stateReason: json.containsKey('StateReason')
            ? json['StateReason'] as String
            : null,
        stateReasonData: json.containsKey('StateReasonData')
            ? json['StateReasonData'] as String
            : null,
        stateUpdatedTimestamp: json.containsKey('StateUpdatedTimestamp')
            ? DateTime.parse(json['StateUpdatedTimestamp'])
            : null,
        metricName: json.containsKey('MetricName')
            ? json['MetricName'] as String
            : null,
        namespace:
            json.containsKey('Namespace') ? json['Namespace'] as String : null,
        statistic:
            json.containsKey('Statistic') ? json['Statistic'] as String : null,
        extendedStatistic: json.containsKey('ExtendedStatistic')
            ? json['ExtendedStatistic'] as String
            : null,
        dimensions: json.containsKey('Dimensions')
            ? (json['Dimensions'] as List)
                .map((e) => Dimension.fromJson(e))
                .toList()
            : null,
        period: json.containsKey('Period') ? json['Period'] as int : null,
        unit: json.containsKey('Unit') ? json['Unit'] as String : null,
        evaluationPeriods: json.containsKey('EvaluationPeriods')
            ? json['EvaluationPeriods'] as int
            : null,
        datapointsToAlarm: json.containsKey('DatapointsToAlarm')
            ? json['DatapointsToAlarm'] as int
            : null,
        threshold:
            json.containsKey('Threshold') ? json['Threshold'] as double : null,
        comparisonOperator: json.containsKey('ComparisonOperator')
            ? json['ComparisonOperator'] as String
            : null,
        treatMissingData: json.containsKey('TreatMissingData')
            ? json['TreatMissingData'] as String
            : null,
        evaluateLowSampleCountPercentile:
            json.containsKey('EvaluateLowSampleCountPercentile')
                ? json['EvaluateLowSampleCountPercentile'] as String
                : null,
        metrics: json.containsKey('Metrics')
            ? (json['Metrics'] as List)
                .map((e) => MetricDataQuery.fromJson(e))
                .toList()
            : null,
        thresholdMetricId: json.containsKey('ThresholdMetricId')
            ? json['ThresholdMetricId'] as String
            : null,
      );
}

/// This structure is used in both `GetMetricData` and `PutMetricAlarm`. The
/// supported use of this structure is different for those two operations.
///
/// When used in `GetMetricData`, it indicates the metric data to return, and
/// whether this call is just retrieving a batch set of data for one metric, or
/// is performing a math expression on metric data. A single `GetMetricData`
/// call can include up to 100 `MetricDataQuery` structures.
///
/// When used in `PutMetricAlarm`, it enables you to create an alarm based on a
/// metric math expression. Each `MetricDataQuery` in the array specifies either
/// a metric to retrieve, or a math expression to be performed on retrieved
/// metrics. A single `PutMetricAlarm` call can include up to 20
/// `MetricDataQuery` structures in the array. The 20 structures can include as
/// many as 10 structures that contain a `MetricStat` parameter to retrieve a
/// metric, and as many as 10 structures that contain the `Expression` parameter
/// to perform a math expression. Of those `Expression` structures, one must
/// have `True` as the value for `ReturnData`. The result of this expression is
/// the value the alarm watches.
///
/// Any expression used in a `PutMetricAlarm` operation must return a single
/// time series. For more information, see
/// [Metric Math Syntax and Functions](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/using-metric-math.html#metric-math-syntax)
/// in the _Amazon CloudWatch User Guide_.
///
/// Some of the parameters of this structure also have different uses whether
/// you are using this structure in a `GetMetricData` operation or a
/// `PutMetricAlarm` operation. These differences are explained in the following
/// parameter list.
class MetricDataQuery {
  /// A short name used to tie this object to the results in the response. This
  /// name must be unique within a single call to `GetMetricData`. If you are
  /// performing math expressions on this set of data, this name represents that
  /// data and can serve as a variable in the mathematical expression. The valid
  /// characters are letters, numbers, and underscore. The first character must
  /// be a lowercase letter.
  final String id;

  /// The metric to be returned, along with statistics, period, and units. Use
  /// this parameter only if this object is retrieving a metric and not
  /// performing a math expression on returned data.
  ///
  /// Within one MetricDataQuery object, you must specify either `Expression` or
  /// `MetricStat` but not both.
  final MetricStat metricStat;

  /// The math expression to be performed on the returned data, if this object
  /// is performing a math expression. This expression can use the `Id` of the
  /// other metrics to refer to those metrics, and can also use the `Id` of
  /// other expressions to use the result of those expressions. For more
  /// information about metric math expressions, see
  /// [Metric Math Syntax and Functions](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/using-metric-math.html#metric-math-syntax)
  /// in the _Amazon CloudWatch User Guide_.
  ///
  /// Within each MetricDataQuery object, you must specify either `Expression`
  /// or `MetricStat` but not both.
  final String expression;

  /// A human-readable label for this metric or expression. This is especially
  /// useful if this is an expression, so that you know what the value
  /// represents. If the metric or expression is shown in a CloudWatch dashboard
  /// widget, the label is shown. If Label is omitted, CloudWatch generates a
  /// default.
  final String label;

  /// When used in `GetMetricData`, this option indicates whether to return the
  /// timestamps and raw data values of this metric. If you are performing this
  /// call just to do math expressions and do not also need the raw data
  /// returned, you can specify `False`. If you omit this, the default of `True`
  /// is used.
  ///
  /// When used in `PutMetricAlarm`, specify `True` for the one expression
  /// result to use as the alarm. For all other metrics and expressions in the
  /// same `PutMetricAlarm` operation, specify `ReturnData` as False.
  final bool returnData;

  MetricDataQuery({
    @required this.id,
    this.metricStat,
    this.expression,
    this.label,
    this.returnData,
  });
  static MetricDataQuery fromJson(Map<String, dynamic> json) => MetricDataQuery(
        id: json['Id'] as String,
        metricStat: json.containsKey('MetricStat')
            ? MetricStat.fromJson(json['MetricStat'])
            : null,
        expression: json.containsKey('Expression')
            ? json['Expression'] as String
            : null,
        label: json.containsKey('Label') ? json['Label'] as String : null,
        returnData:
            json.containsKey('ReturnData') ? json['ReturnData'] as bool : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A `GetMetricData` call returns an array of `MetricDataResult` structures.
/// Each of these structures includes the data points for that metric, along
/// with the timestamps of those data points and other identifying information.
class MetricDataResult {
  /// The short name you specified to represent this metric.
  final String id;

  /// The human-readable label associated with the data.
  final String label;

  /// The timestamps for the data points, formatted in Unix timestamp format.
  /// The number of timestamps always matches the number of values and the value
  /// for Timestamps[x] is Values[x].
  final List<DateTime> timestamps;

  /// The data points for the metric corresponding to `Timestamps`. The number
  /// of values always matches the number of timestamps and the timestamp for
  /// Values[x] is Timestamps[x].
  final List<double> values;

  /// The status of the returned data. `Complete` indicates that all data points
  /// in the requested time range were returned. `PartialData` means that an
  /// incomplete set of data points were returned. You can use the `NextToken`
  /// value that was returned and repeat your request to get more data points.
  /// `NextToken` is not returned if you are performing a math expression.
  /// `InternalError` indicates that an error occurred. Retry your request using
  /// `NextToken`, if present.
  final String statusCode;

  /// A list of messages with additional information about the data returned.
  final List<MessageData> messages;

  MetricDataResult({
    this.id,
    this.label,
    this.timestamps,
    this.values,
    this.statusCode,
    this.messages,
  });
  static MetricDataResult fromJson(Map<String, dynamic> json) =>
      MetricDataResult(
        id: json.containsKey('Id') ? json['Id'] as String : null,
        label: json.containsKey('Label') ? json['Label'] as String : null,
        timestamps: json.containsKey('Timestamps')
            ? (json['Timestamps'] as List)
                .map((e) => DateTime.parse(e))
                .toList()
            : null,
        values: json.containsKey('Values')
            ? (json['Values'] as List).map((e) => e as double).toList()
            : null,
        statusCode: json.containsKey('StatusCode')
            ? json['StatusCode'] as String
            : null,
        messages: json.containsKey('Messages')
            ? (json['Messages'] as List)
                .map((e) => MessageData.fromJson(e))
                .toList()
            : null,
      );
}

/// Encapsulates the information sent to either create a metric or add new
/// values to be aggregated into an existing metric.
class MetricDatum {
  /// The name of the metric.
  final String metricName;

  /// The dimensions associated with the metric.
  final List<Dimension> dimensions;

  /// The time the metric data was received, expressed as the number of
  /// milliseconds since Jan 1, 1970 00:00:00 UTC.
  final DateTime timestamp;

  /// The value for the metric.
  ///
  /// Although the parameter accepts numbers of type Double, CloudWatch rejects
  /// values that are either too small or too large. Values must be in the range
  /// of 8.515920e-109 to 1.174271e+108 (Base 10) or 2e-360 to 2e360 (Base 2).
  /// In addition, special values (for example, NaN, +Infinity, -Infinity) are
  /// not supported.
  final double value;

  /// The statistical values for the metric.
  final StatisticSet statisticValues;

  /// Array of numbers representing the values for the metric during the period.
  /// Each unique value is listed just once in this array, and the corresponding
  /// number in the `Counts` array specifies the number of times that value
  /// occurred during the period. You can include up to 150 unique values in
  /// each `PutMetricData` action that specifies a `Values` array.
  ///
  /// Although the `Values` array accepts numbers of type `Double`, CloudWatch
  /// rejects values that are either too small or too large. Values must be in
  /// the range of 8.515920e-109 to 1.174271e+108 (Base 10) or 2e-360 to 2e360
  /// (Base 2). In addition, special values (for example, NaN, +Infinity,
  /// -Infinity) are not supported.
  final List<double> values;

  /// Array of numbers that is used along with the `Values` array. Each number
  /// in the `Count` array is the number of times the corresponding value in the
  /// `Values` array occurred during the period.
  ///
  /// If you omit the `Counts` array, the default of 1 is used as the value for
  /// each count. If you include a `Counts` array, it must include the same
  /// amount of values as the `Values` array.
  final List<double> counts;

  /// When you are using a `Put` operation, this defines what unit you want to
  /// use when storing the metric.
  ///
  /// In a `Get` operation, this displays the unit that is used for the metric.
  final String unit;

  /// Valid values are 1 and 60. Setting this to 1 specifies this metric as a
  /// high-resolution metric, so that CloudWatch stores the metric with
  /// sub-minute resolution down to one second. Setting this to 60 specifies
  /// this metric as a regular-resolution metric, which CloudWatch stores at
  /// 1-minute resolution. Currently, high resolution is available only for
  /// custom metrics. For more information about high-resolution metrics, see
  /// [High-Resolution Metrics](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/publishingMetrics.html#high-resolution-metrics)
  /// in the _Amazon CloudWatch User Guide_.
  ///
  /// This field is optional, if you do not specify it the default of 60 is
  /// used.
  final int storageResolution;

  MetricDatum({
    @required this.metricName,
    this.dimensions,
    this.timestamp,
    this.value,
    this.statisticValues,
    this.values,
    this.counts,
    this.unit,
    this.storageResolution,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// This structure defines the metric to be returned, along with the statistics,
/// period, and units.
class MetricStat {
  /// The metric to return, including the metric name, namespace, and
  /// dimensions.
  final Metric metric;

  /// The period, in seconds, to use when retrieving the metric.
  final int period;

  /// The statistic to return. It can include any CloudWatch statistic or
  /// extended statistic.
  final String stat;

  /// When you are using a `Put` operation, this defines what unit you want to
  /// use when storing the metric.
  ///
  /// In a `Get` operation, if you omit `Unit` then all data that was collected
  /// with any unit is returned, along with the corresponding units that were
  /// specified when the data was reported to CloudWatch. If you specify a unit,
  /// the operation returns only data data that was collected with that unit
  /// specified. If you specify a unit that does not match the data collected,
  /// the results of the operation are null. CloudWatch does not perform unit
  /// conversions.
  final String unit;

  MetricStat({
    @required this.metric,
    @required this.period,
    @required this.stat,
    this.unit,
  });
  static MetricStat fromJson(Map<String, dynamic> json) => MetricStat(
        metric: Metric.fromJson(json['Metric']),
        period: json['Period'] as int,
        stat: json['Stat'] as String,
        unit: json.containsKey('Unit') ? json['Unit'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class PutAnomalyDetectorOutput {
  PutAnomalyDetectorOutput();
  static PutAnomalyDetectorOutput fromJson(Map<String, dynamic> json) =>
      PutAnomalyDetectorOutput();
}

class PutDashboardOutput {
  /// If the input for `PutDashboard` was correct and the dashboard was
  /// successfully created or modified, this result is empty.
  ///
  /// If this result includes only warning messages, then the input was valid
  /// enough for the dashboard to be created or modified, but some elements of
  /// the dashboard may not render.
  ///
  /// If this result includes error messages, the input was not valid and the
  /// operation failed.
  final List<DashboardValidationMessage> dashboardValidationMessages;

  PutDashboardOutput({
    this.dashboardValidationMessages,
  });
  static PutDashboardOutput fromJson(Map<String, dynamic> json) =>
      PutDashboardOutput(
        dashboardValidationMessages:
            json.containsKey('DashboardValidationMessages')
                ? (json['DashboardValidationMessages'] as List)
                    .map((e) => DashboardValidationMessage.fromJson(e))
                    .toList()
                : null,
      );
}

/// Specifies one range of days or times to exclude from use for training an
/// anomaly detection model.
class Range {
  /// The start time of the range to exclude. The format is
  /// `yyyy-MM-dd'T'HH:mm:ss`. For example, `2019-07-01T23:59:59`.
  final DateTime startTime;

  /// The end time of the range to exclude. The format is
  /// `yyyy-MM-dd'T'HH:mm:ss`. For example, `2019-07-01T23:59:59`.
  final DateTime endTime;

  Range({
    @required this.startTime,
    @required this.endTime,
  });
  static Range fromJson(Map<String, dynamic> json) => Range(
        startTime: DateTime.parse(json['StartTime']),
        endTime: DateTime.parse(json['EndTime']),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Represents a set of statistics that describes a specific metric.
class StatisticSet {
  /// The number of samples used for the statistic set.
  final double sampleCount;

  /// The sum of values for the sample set.
  final double sum;

  /// The minimum value of the sample set.
  final double minimum;

  /// The maximum value of the sample set.
  final double maximum;

  StatisticSet({
    @required this.sampleCount,
    @required this.sum,
    @required this.minimum,
    @required this.maximum,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A key-value pair associated with a CloudWatch resource.
class Tag {
  /// A string that you can use to assign a value. The combination of tag keys
  /// and values can help you organize and categorize your resources.
  final String key;

  /// The value for the specified tag key.
  final String value;

  Tag({
    @required this.key,
    @required this.value,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag(
        key: json['Key'] as String,
        value: json['Value'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class TagResourceOutput {
  TagResourceOutput();
  static TagResourceOutput fromJson(Map<String, dynamic> json) =>
      TagResourceOutput();
}

class UntagResourceOutput {
  UntagResourceOutput();
  static UntagResourceOutput fromJson(Map<String, dynamic> json) =>
      UntagResourceOutput();
}
