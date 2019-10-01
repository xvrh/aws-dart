import 'package:meta/meta.dart';

/// You can use Amazon CloudWatch Logs to monitor, store, and access your log
/// files from Amazon EC2 instances, AWS CloudTrail, or other sources. You can
/// then retrieve the associated log data from CloudWatch Logs using the
/// CloudWatch console, CloudWatch Logs commands in the AWS CLI, CloudWatch Logs
/// API, or CloudWatch Logs SDK.
///
/// You can use CloudWatch Logs to:
///
/// *    **Monitor logs from EC2 instances in real-time**: You can use
/// CloudWatch Logs to monitor applications and systems using log data. For
/// example, CloudWatch Logs can track the number of errors that occur in your
/// application logs and send you a notification whenever the rate of errors
/// exceeds a threshold that you specify. CloudWatch Logs uses your log data for
/// monitoring; so, no code changes are required. For example, you can monitor
/// application logs for specific literal terms (such as
/// "NullReferenceException") or count the number of occurrences of a literal
/// term at a particular position in log data (such as "404" status codes in an
/// Apache access log). When the term you are searching for is found, CloudWatch
/// Logs reports the data to a CloudWatch metric that you specify.
///
/// *    **Monitor AWS CloudTrail logged events**: You can create alarms in
/// CloudWatch and receive notifications of particular API activity as captured
/// by CloudTrail and use the notification to perform troubleshooting.
///
/// *    **Archive log data**: You can use CloudWatch Logs to store your log
/// data in highly durable storage. You can change the log retention setting so
/// that any log events older than this setting are automatically deleted. The
/// CloudWatch Logs agent makes it easy to quickly send both rotated and
/// non-rotated log data off of a host and into the log service. You can then
/// access the raw log data when you need it.
class CloudWatchLogsApi {
  /// Associates the specified AWS Key Management Service (AWS KMS) customer
  /// master key (CMK) with the specified log group.
  ///
  /// Associating an AWS KMS CMK with a log group overrides any existing
  /// associations between the log group and a CMK. After a CMK is associated
  /// with a log group, all newly ingested data for the log group is encrypted
  /// using the CMK. This association is stored as long as the data encrypted
  /// with the CMK is still within Amazon CloudWatch Logs. This enables Amazon
  /// CloudWatch Logs to decrypt this data whenever it is requested.
  ///
  /// Note that it can take up to 5 minutes for this operation to take effect.
  ///
  /// If you attempt to associate a CMK with a log group but the CMK does not
  /// exist or the CMK is disabled, you will receive an
  /// `InvalidParameterException` error.
  Future<void> associateKmsKey(
      {@required String logGroupName, @required String kmsKeyId}) async {}

  /// Cancels the specified export task.
  ///
  /// The task must be in the `PENDING` or `RUNNING` state.
  Future<void> cancelExportTask(String taskId) async {}

  /// Creates an export task, which allows you to efficiently export data from a
  /// log group to an Amazon S3 bucket.
  ///
  /// This is an asynchronous call. If all the required information is provided,
  /// this operation initiates an export task and responds with the ID of the
  /// task. After the task has started, you can use DescribeExportTasks to get
  /// the status of the export task. Each account can only have one active
  /// (`RUNNING` or `PENDING`) export task at a time. To cancel an export task,
  /// use CancelExportTask.
  ///
  /// You can export logs from multiple log groups or multiple time ranges to
  /// the same S3 bucket. To separate out log data for each export task, you can
  /// specify a prefix to be used as the Amazon S3 key prefix for all exported
  /// objects.
  ///
  /// Exporting to S3 buckets that are encrypted with AES-256 is supported.
  /// Exporting to S3 buckets encrypted with SSE-KMS is not supported.
  Future<void> createExportTask(
      {String taskName,
      @required String logGroupName,
      String logStreamNamePrefix,
      @required BigInt from,
      @required BigInt to,
      @required String destination,
      String destinationPrefix}) async {}

  /// Creates a log group with the specified name.
  ///
  /// You can create up to 5000 log groups per account.
  ///
  /// You must use the following guidelines when naming a log group:
  ///
  /// *   Log group names must be unique within a region for an AWS account.
  ///
  /// *   Log group names can be between 1 and 512 characters long.
  ///
  /// *   Log group names consist of the following characters: a-z, A-Z, 0-9,
  /// '_' (underscore), '-' (hyphen), '/' (forward slash), and '.' (period).
  ///
  ///
  /// If you associate a AWS Key Management Service (AWS KMS) customer master
  /// key (CMK) with the log group, ingested data is encrypted using the CMK.
  /// This association is stored as long as the data encrypted with the CMK is
  /// still within Amazon CloudWatch Logs. This enables Amazon CloudWatch Logs
  /// to decrypt this data whenever it is requested.
  ///
  /// If you attempt to associate a CMK with the log group but the CMK does not
  /// exist or the CMK is disabled, you will receive an
  /// `InvalidParameterException` error.
  Future<void> createLogGroup(String logGroupName,
      {String kmsKeyId, Map<String, String> tags}) async {}

  /// Creates a log stream for the specified log group.
  ///
  /// There is no limit on the number of log streams that you can create for a
  /// log group.
  ///
  /// You must use the following guidelines when naming a log stream:
  ///
  /// *   Log stream names must be unique within the log group.
  ///
  /// *   Log stream names can be between 1 and 512 characters long.
  ///
  /// *   The ':' (colon) and '*' (asterisk) characters are not allowed.
  Future<void> createLogStream(
      {@required String logGroupName, @required String logStreamName}) async {}

  /// Deletes the specified destination, and eventually disables all the
  /// subscription filters that publish to it. This operation does not delete
  /// the physical resource encapsulated by the destination.
  Future<void> deleteDestination(String destinationName) async {}

  /// Deletes the specified log group and permanently deletes all the archived
  /// log events associated with the log group.
  Future<void> deleteLogGroup(String logGroupName) async {}

  /// Deletes the specified log stream and permanently deletes all the archived
  /// log events associated with the log stream.
  Future<void> deleteLogStream(
      {@required String logGroupName, @required String logStreamName}) async {}

  /// Deletes the specified metric filter.
  Future<void> deleteMetricFilter(
      {@required String logGroupName, @required String filterName}) async {}

  /// Deletes a resource policy from this account. This revokes the access of
  /// the identities in that policy to put log events to this account.
  Future<void> deleteResourcePolicy({String policyName}) async {}

  /// Deletes the specified retention policy.
  ///
  /// Log events do not expire if they belong to log groups without a retention
  /// policy.
  Future<void> deleteRetentionPolicy(String logGroupName) async {}

  /// Deletes the specified subscription filter.
  Future<void> deleteSubscriptionFilter(
      {@required String logGroupName, @required String filterName}) async {}

  /// Lists all your destinations. The results are ASCII-sorted by destination
  /// name.
  Future<void> describeDestinations(
      {String destinationNamePrefix, String nextToken, int limit}) async {}

  /// Lists the specified export tasks. You can list all your export tasks or
  /// filter the results based on task ID or task status.
  Future<void> describeExportTasks(
      {String taskId, String statusCode, String nextToken, int limit}) async {}

  /// Lists the specified log groups. You can list all your log groups or filter
  /// the results by prefix. The results are ASCII-sorted by log group name.
  Future<void> describeLogGroups(
      {String logGroupNamePrefix, String nextToken, int limit}) async {}

  /// Lists the log streams for the specified log group. You can list all the
  /// log streams or filter the results by prefix. You can also control how the
  /// results are ordered.
  ///
  /// This operation has a limit of five transactions per second, after which
  /// transactions are throttled.
  Future<void> describeLogStreams(String logGroupName,
      {String logStreamNamePrefix,
      String orderBy,
      bool descending,
      String nextToken,
      int limit}) async {}

  /// Lists the specified metric filters. You can list all the metric filters or
  /// filter the results by log name, prefix, metric name, or metric namespace.
  /// The results are ASCII-sorted by filter name.
  Future<void> describeMetricFilters(
      {String logGroupName,
      String filterNamePrefix,
      String nextToken,
      int limit,
      String metricName,
      String metricNamespace}) async {}

  /// Returns a list of CloudWatch Logs Insights queries that are scheduled,
  /// executing, or have been executed recently in this account. You can request
  /// all queries, or limit it to queries of a specific log group or queries
  /// with a certain status.
  Future<void> describeQueries(
      {String logGroupName,
      String status,
      int maxResults,
      String nextToken}) async {}

  /// Lists the resource policies in this account.
  Future<void> describeResourcePolicies({String nextToken, int limit}) async {}

  /// Lists the subscription filters for the specified log group. You can list
  /// all the subscription filters or filter the results by prefix. The results
  /// are ASCII-sorted by filter name.
  Future<void> describeSubscriptionFilters(String logGroupName,
      {String filterNamePrefix, String nextToken, int limit}) async {}

  /// Disassociates the associated AWS Key Management Service (AWS KMS) customer
  /// master key (CMK) from the specified log group.
  ///
  /// After the AWS KMS CMK is disassociated from the log group, AWS CloudWatch
  /// Logs stops encrypting newly ingested data for the log group. All
  /// previously ingested data remains encrypted, and AWS CloudWatch Logs
  /// requires permissions for the CMK whenever the encrypted data is requested.
  ///
  /// Note that it can take up to 5 minutes for this operation to take effect.
  Future<void> disassociateKmsKey(String logGroupName) async {}

  /// Lists log events from the specified log group. You can list all the log
  /// events or filter the results using a filter pattern, a time range, and the
  /// name of the log stream.
  ///
  /// By default, this operation returns as many log events as can fit in 1 MB
  /// (up to 10,000 log events), or all the events found within the time range
  /// that you specify. If the results include a token, then there are more log
  /// events available, and you can get additional results by specifying the
  /// token in a subsequent call.
  Future<void> filterLogEvents(String logGroupName,
      {List<String> logStreamNames,
      String logStreamNamePrefix,
      BigInt startTime,
      BigInt endTime,
      String filterPattern,
      String nextToken,
      int limit,
      bool interleaved}) async {}

  /// Lists log events from the specified log stream. You can list all the log
  /// events or filter using a time range.
  ///
  /// By default, this operation returns as many log events as can fit in a
  /// response size of 1MB (up to 10,000 log events). You can get additional log
  /// events by specifying one of the tokens in a subsequent call.
  Future<void> getLogEvents(
      {@required String logGroupName,
      @required String logStreamName,
      BigInt startTime,
      BigInt endTime,
      String nextToken,
      int limit,
      bool startFromHead}) async {}

  /// Returns a list of the fields that are included in log events in the
  /// specified log group, along with the percentage of log events that contain
  /// each field. The search is limited to a time period that you specify.
  ///
  /// In the results, fields that start with @ are fields generated by
  /// CloudWatch Logs. For example, `@timestamp` is the timestamp of each log
  /// event.
  ///
  /// The response results are sorted by the frequency percentage, starting with
  /// the highest percentage.
  Future<void> getLogGroupFields(String logGroupName, {BigInt time}) async {}

  /// Retrieves all the fields and values of a single log event. All fields are
  /// retrieved, even if the original query that produced the `logRecordPointer`
  /// retrieved only a subset of fields. Fields are returned as field name/field
  /// value pairs.
  ///
  /// Additionally, the entire unparsed log event is returned within `@message`.
  Future<void> getLogRecord(String logRecordPointer) async {}

  /// Returns the results from the specified query.
  ///
  /// Only the fields requested in the query are returned, along with a `@ptr`
  /// field which is the identifier for the log record. You can use the value of
  /// `@ptr` in a operation to get the full log record.
  ///
  ///  `GetQueryResults` does not start a query execution. To run a query, use .
  ///
  /// If the value of the `Status` field in the output is `Running`, this
  /// operation returns only partial results. If you see a value of `Scheduled`
  /// or `Running` for the status, you can retry the operation later to see the
  /// final results.
  Future<void> getQueryResults(String queryId) async {}

  /// Lists the tags for the specified log group.
  Future<void> listTagsLogGroup(String logGroupName) async {}

  /// Creates or updates a destination. A destination encapsulates a physical
  /// resource (such as an Amazon Kinesis stream) and enables you to subscribe
  /// to a real-time stream of log events for a different account, ingested
  /// using PutLogEvents. A destination can be an Amazon Kinesis stream, Amazon
  /// Kinesis Data Firehose strea, or an AWS Lambda function.
  ///
  /// Through an access policy, a destination controls what is written to it. By
  /// default, `PutDestination` does not set any access policy with the
  /// destination, which means a cross-account user cannot call
  /// PutSubscriptionFilter against this destination. To enable this, the
  /// destination owner must call PutDestinationPolicy after `PutDestination`.
  Future<void> putDestination(
      {@required String destinationName,
      @required String targetArn,
      @required String roleArn}) async {}

  /// Creates or updates an access policy associated with an existing
  /// destination. An access policy is an [IAM policy
  /// document](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies_overview.html)
  /// that is used to authorize claims to register a subscription filter against
  /// a given destination.
  Future<void> putDestinationPolicy(
      {@required String destinationName,
      @required String accessPolicy}) async {}

  /// Uploads a batch of log events to the specified log stream.
  ///
  /// You must include the sequence token obtained from the response of the
  /// previous call. An upload in a newly created log stream does not require a
  /// sequence token. You can also get the sequence token using
  /// DescribeLogStreams. If you call `PutLogEvents` twice within a narrow time
  /// period using the same value for `sequenceToken`, both calls may be
  /// successful, or one may be rejected.
  ///
  /// The batch of events must satisfy the following constraints:
  ///
  /// *   The maximum batch size is 1,048,576 bytes, and this size is calculated
  /// as the sum of all event messages in UTF-8, plus 26 bytes for each log
  /// event.
  ///
  /// *   None of the log events in the batch can be more than 2 hours in the
  /// future.
  ///
  /// *   None of the log events in the batch can be older than 14 days or older
  /// than the retention period of the log group.
  ///
  /// *   The log events in the batch must be in chronological ordered by their
  /// timestamp. The timestamp is the time the event occurred, expressed as the
  /// number of milliseconds after Jan 1, 1970 00:00:00 UTC. (In AWS Tools for
  /// PowerShell and the AWS SDK for .NET, the timestamp is specified in .NET
  /// format: yyyy-mm-ddThh:mm:ss. For example, 2017-09-15T13:45:30.)
  ///
  /// *   The maximum number of log events in a batch is 10,000.
  ///
  /// *   A batch of log events in a single request cannot span more than 24
  /// hours. Otherwise, the operation fails.
  ///
  ///
  /// If a call to PutLogEvents returns "UnrecognizedClientException" the most
  /// likely cause is an invalid AWS access key ID or secret key.
  Future<void> putLogEvents(
      {@required String logGroupName,
      @required String logStreamName,
      @required List<InputLogEvent> logEvents,
      String sequenceToken}) async {}

  /// Creates or updates a metric filter and associates it with the specified
  /// log group. Metric filters allow you to configure rules to extract metric
  /// data from log events ingested through PutLogEvents.
  ///
  /// The maximum number of metric filters that can be associated with a log
  /// group is 100.
  Future<void> putMetricFilter(
      {@required String logGroupName,
      @required String filterName,
      @required String filterPattern,
      @required List<MetricTransformation> metricTransformations}) async {}

  /// Creates or updates a resource policy allowing other AWS services to put
  /// log events to this account, such as Amazon Route 53. An account can have
  /// up to 10 resource policies per region.
  Future<void> putResourcePolicy(
      {String policyName, String policyDocument}) async {}

  /// Sets the retention of the specified log group. A retention policy allows
  /// you to configure the number of days for which to retain log events in the
  /// specified log group.
  Future<void> putRetentionPolicy(
      {@required String logGroupName, @required int retentionInDays}) async {}

  /// Creates or updates a subscription filter and associates it with the
  /// specified log group. Subscription filters allow you to subscribe to a
  /// real-time stream of log events ingested through PutLogEvents and have them
  /// delivered to a specific destination. Currently, the supported destinations
  /// are:
  ///
  /// *   An Amazon Kinesis stream belonging to the same account as the
  /// subscription filter, for same-account delivery.
  ///
  /// *   A logical destination that belongs to a different account, for
  /// cross-account delivery.
  ///
  /// *   An Amazon Kinesis Firehose delivery stream that belongs to the same
  /// account as the subscription filter, for same-account delivery.
  ///
  /// *   An AWS Lambda function that belongs to the same account as the
  /// subscription filter, for same-account delivery.
  ///
  ///
  /// There can only be one subscription filter associated with a log group. If
  /// you are updating an existing filter, you must specify the correct name in
  /// `filterName`. Otherwise, the call fails because you cannot associate a
  /// second filter with a log group.
  Future<void> putSubscriptionFilter(
      {@required String logGroupName,
      @required String filterName,
      @required String filterPattern,
      @required String destinationArn,
      String roleArn,
      String distribution}) async {}

  /// Schedules a query of a log group using CloudWatch Logs Insights. You
  /// specify the log group and time range to query, and the query string to
  /// use.
  ///
  /// For more information, see [CloudWatch Logs Insights Query
  /// Syntax](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_QuerySyntax.html).
  ///
  /// Queries time out after 15 minutes of execution. If your queries are timing
  /// out, reduce the time range being searched, or partition your query into a
  /// number of queries.
  Future<void> startQuery(
      {String logGroupName,
      List<String> logGroupNames,
      @required BigInt startTime,
      @required BigInt endTime,
      @required String queryString,
      int limit}) async {}

  /// Stops a CloudWatch Logs Insights query that is in progress. If the query
  /// has already ended, the operation returns an error indicating that the
  /// specified query is not running.
  Future<void> stopQuery(String queryId) async {}

  /// Adds or updates the specified tags for the specified log group.
  ///
  /// To list the tags for a log group, use ListTagsLogGroup. To remove tags,
  /// use UntagLogGroup.
  ///
  /// For more information about tags, see [Tag Log Groups in Amazon CloudWatch
  /// Logs](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/log-group-tagging.html)
  /// in the _Amazon CloudWatch Logs User Guide_.
  Future<void> tagLogGroup(
      {@required String logGroupName,
      @required Map<String, String> tags}) async {}

  /// Tests the filter pattern of a metric filter against a sample of log event
  /// messages. You can use this operation to validate the correctness of a
  /// metric filter pattern.
  Future<void> testMetricFilter(
      {@required String filterPattern,
      @required List<String> logEventMessages}) async {}

  /// Removes the specified tags from the specified log group.
  ///
  /// To list the tags for a log group, use ListTagsLogGroup. To add tags, use
  /// UntagLogGroup.
  Future<void> untagLogGroup(
      {@required String logGroupName, @required List<String> tags}) async {}
}

class CreateExportTaskResponse {}

class DescribeDestinationsResponse {}

class DescribeExportTasksResponse {}

class DescribeLogGroupsResponse {}

class DescribeLogStreamsResponse {}

class DescribeMetricFiltersResponse {}

class DescribeQueriesResponse {}

class DescribeResourcePoliciesResponse {}

class DescribeSubscriptionFiltersResponse {}

class Destination {}

class ExportTask {}

class ExportTaskExecutionInfo {}

class ExportTaskStatus {}

class FilterLogEventsResponse {}

class FilteredLogEvent {}

class GetLogEventsResponse {}

class GetLogGroupFieldsResponse {}

class GetLogRecordResponse {}

class GetQueryResultsResponse {}

class InputLogEvent {}

class ListTagsLogGroupResponse {}

class LogGroup {}

class LogGroupField {}

class LogStream {}

class MetricFilter {}

class MetricFilterMatchRecord {}

class MetricTransformation {}

class OutputLogEvent {}

class PutDestinationResponse {}

class PutLogEventsResponse {}

class PutResourcePolicyResponse {}

class QueryInfo {}

class QueryStatistics {}

class RejectedLogEventsInfo {}

class ResourcePolicy {}

class ResultField {}

class SearchedLogStream {}

class StartQueryResponse {}

class StopQueryResponse {}

class SubscriptionFilter {}

class TestMetricFilterResponse {}
