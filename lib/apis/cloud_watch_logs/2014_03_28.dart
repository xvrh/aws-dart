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
  ///
  /// [logGroupName]: The name of the log group.
  ///
  /// [kmsKeyId]: The Amazon Resource Name (ARN) of the CMK to use when
  /// encrypting log data. For more information, see
  /// [Amazon Resource Names - AWS Key Management Service (AWS KMS)](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-kms).
  Future<void> associateKmsKey(
      {@required String logGroupName, @required String kmsKeyId}) async {}

  /// Cancels the specified export task.
  ///
  /// The task must be in the `PENDING` or `RUNNING` state.
  ///
  /// [taskId]: The ID of the export task.
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
  ///
  /// [taskName]: The name of the export task.
  ///
  /// [logGroupName]: The name of the log group.
  ///
  /// [logStreamNamePrefix]: Export only log streams that match the provided
  /// prefix. If you don't specify a value, no prefix filter is applied.
  ///
  /// [from]: The start time of the range for the request, expressed as the
  /// number of milliseconds after Jan 1, 1970 00:00:00 UTC. Events with a
  /// timestamp earlier than this time are not exported.
  ///
  /// [to]: The end time of the range for the request, expressed as the number
  /// of milliseconds after Jan 1, 1970 00:00:00 UTC. Events with a timestamp
  /// later than this time are not exported.
  ///
  /// [destination]: The name of S3 bucket for the exported log data. The bucket
  /// must be in the same AWS region.
  ///
  /// [destinationPrefix]: The prefix used as the start of the key for every
  /// object exported. If you don't specify a value, the default is
  /// `exportedlogs`.
  Future<CreateExportTaskResponse> createExportTask(
      {String taskName,
      @required String logGroupName,
      String logStreamNamePrefix,
      @required BigInt from,
      @required BigInt to,
      @required String destination,
      String destinationPrefix}) async {
    return CreateExportTaskResponse.fromJson({});
  }

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
  ///
  /// [logGroupName]: The name of the log group.
  ///
  /// [kmsKeyId]: The Amazon Resource Name (ARN) of the CMK to use when
  /// encrypting log data. For more information, see
  /// [Amazon Resource Names - AWS Key Management Service (AWS KMS)](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-kms).
  ///
  /// [tags]: The key-value pairs to use for the tags.
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
  ///
  /// [logGroupName]: The name of the log group.
  ///
  /// [logStreamName]: The name of the log stream.
  Future<void> createLogStream(
      {@required String logGroupName, @required String logStreamName}) async {}

  /// Deletes the specified destination, and eventually disables all the
  /// subscription filters that publish to it. This operation does not delete
  /// the physical resource encapsulated by the destination.
  ///
  /// [destinationName]: The name of the destination.
  Future<void> deleteDestination(String destinationName) async {}

  /// Deletes the specified log group and permanently deletes all the archived
  /// log events associated with the log group.
  ///
  /// [logGroupName]: The name of the log group.
  Future<void> deleteLogGroup(String logGroupName) async {}

  /// Deletes the specified log stream and permanently deletes all the archived
  /// log events associated with the log stream.
  ///
  /// [logGroupName]: The name of the log group.
  ///
  /// [logStreamName]: The name of the log stream.
  Future<void> deleteLogStream(
      {@required String logGroupName, @required String logStreamName}) async {}

  /// Deletes the specified metric filter.
  ///
  /// [logGroupName]: The name of the log group.
  ///
  /// [filterName]: The name of the metric filter.
  Future<void> deleteMetricFilter(
      {@required String logGroupName, @required String filterName}) async {}

  /// Deletes a resource policy from this account. This revokes the access of
  /// the identities in that policy to put log events to this account.
  ///
  /// [policyName]: The name of the policy to be revoked. This parameter is
  /// required.
  Future<void> deleteResourcePolicy({String policyName}) async {}

  /// Deletes the specified retention policy.
  ///
  /// Log events do not expire if they belong to log groups without a retention
  /// policy.
  ///
  /// [logGroupName]: The name of the log group.
  Future<void> deleteRetentionPolicy(String logGroupName) async {}

  /// Deletes the specified subscription filter.
  ///
  /// [logGroupName]: The name of the log group.
  ///
  /// [filterName]: The name of the subscription filter.
  Future<void> deleteSubscriptionFilter(
      {@required String logGroupName, @required String filterName}) async {}

  /// Lists all your destinations. The results are ASCII-sorted by destination
  /// name.
  ///
  /// [destinationNamePrefix]: The prefix to match. If you don't specify a
  /// value, no prefix filter is applied.
  ///
  /// [nextToken]: The token for the next set of items to return. (You received
  /// this token from a previous call.)
  ///
  /// [limit]: The maximum number of items returned. If you don't specify a
  /// value, the default is up to 50 items.
  Future<DescribeDestinationsResponse> describeDestinations(
      {String destinationNamePrefix, String nextToken, int limit}) async {
    return DescribeDestinationsResponse.fromJson({});
  }

  /// Lists the specified export tasks. You can list all your export tasks or
  /// filter the results based on task ID or task status.
  ///
  /// [taskId]: The ID of the export task. Specifying a task ID filters the
  /// results to zero or one export tasks.
  ///
  /// [statusCode]: The status code of the export task. Specifying a status code
  /// filters the results to zero or more export tasks.
  ///
  /// [nextToken]: The token for the next set of items to return. (You received
  /// this token from a previous call.)
  ///
  /// [limit]: The maximum number of items returned. If you don't specify a
  /// value, the default is up to 50 items.
  Future<DescribeExportTasksResponse> describeExportTasks(
      {String taskId, String statusCode, String nextToken, int limit}) async {
    return DescribeExportTasksResponse.fromJson({});
  }

  /// Lists the specified log groups. You can list all your log groups or filter
  /// the results by prefix. The results are ASCII-sorted by log group name.
  ///
  /// [logGroupNamePrefix]: The prefix to match.
  ///
  /// [nextToken]: The token for the next set of items to return. (You received
  /// this token from a previous call.)
  ///
  /// [limit]: The maximum number of items returned. If you don't specify a
  /// value, the default is up to 50 items.
  Future<DescribeLogGroupsResponse> describeLogGroups(
      {String logGroupNamePrefix, String nextToken, int limit}) async {
    return DescribeLogGroupsResponse.fromJson({});
  }

  /// Lists the log streams for the specified log group. You can list all the
  /// log streams or filter the results by prefix. You can also control how the
  /// results are ordered.
  ///
  /// This operation has a limit of five transactions per second, after which
  /// transactions are throttled.
  ///
  /// [logGroupName]: The name of the log group.
  ///
  /// [logStreamNamePrefix]: The prefix to match.
  ///
  /// If `orderBy` is `LastEventTime`,you cannot specify this parameter.
  ///
  /// [orderBy]: If the value is `LogStreamName`, the results are ordered by log
  /// stream name. If the value is `LastEventTime`, the results are ordered by
  /// the event time. The default value is `LogStreamName`.
  ///
  /// If you order the results by event time, you cannot specify the
  /// `logStreamNamePrefix` parameter.
  ///
  /// lastEventTimestamp represents the time of the most recent log event in the
  /// log stream in CloudWatch Logs. This number is expressed as the number of
  /// milliseconds after Jan 1, 1970 00:00:00 UTC. lastEventTimeStamp updates on
  /// an eventual consistency basis. It typically updates in less than an hour
  /// from ingestion, but may take longer in some rare situations.
  ///
  /// [descending]: If the value is true, results are returned in descending
  /// order. If the value is to false, results are returned in ascending order.
  /// The default value is false.
  ///
  /// [nextToken]: The token for the next set of items to return. (You received
  /// this token from a previous call.)
  ///
  /// [limit]: The maximum number of items returned. If you don't specify a
  /// value, the default is up to 50 items.
  Future<DescribeLogStreamsResponse> describeLogStreams(String logGroupName,
      {String logStreamNamePrefix,
      String orderBy,
      bool descending,
      String nextToken,
      int limit}) async {
    return DescribeLogStreamsResponse.fromJson({});
  }

  /// Lists the specified metric filters. You can list all the metric filters or
  /// filter the results by log name, prefix, metric name, or metric namespace.
  /// The results are ASCII-sorted by filter name.
  ///
  /// [logGroupName]: The name of the log group.
  ///
  /// [filterNamePrefix]: The prefix to match.
  ///
  /// [nextToken]: The token for the next set of items to return. (You received
  /// this token from a previous call.)
  ///
  /// [limit]: The maximum number of items returned. If you don't specify a
  /// value, the default is up to 50 items.
  ///
  /// [metricName]: Filters results to include only those with the specified
  /// metric name. If you include this parameter in your request, you must also
  /// include the `metricNamespace` parameter.
  ///
  /// [metricNamespace]: Filters results to include only those in the specified
  /// namespace. If you include this parameter in your request, you must also
  /// include the `metricName` parameter.
  Future<DescribeMetricFiltersResponse> describeMetricFilters(
      {String logGroupName,
      String filterNamePrefix,
      String nextToken,
      int limit,
      String metricName,
      String metricNamespace}) async {
    return DescribeMetricFiltersResponse.fromJson({});
  }

  /// Returns a list of CloudWatch Logs Insights queries that are scheduled,
  /// executing, or have been executed recently in this account. You can request
  /// all queries, or limit it to queries of a specific log group or queries
  /// with a certain status.
  ///
  /// [logGroupName]: Limits the returned queries to only those for the
  /// specified log group.
  ///
  /// [status]: Limits the returned queries to only those that have the
  /// specified status. Valid values are `Cancelled`, `Complete`, `Failed`,
  /// `Running`, and `Scheduled`.
  ///
  /// [maxResults]: Limits the number of returned queries to the specified
  /// number.
  Future<DescribeQueriesResponse> describeQueries(
      {String logGroupName,
      String status,
      int maxResults,
      String nextToken}) async {
    return DescribeQueriesResponse.fromJson({});
  }

  /// Lists the resource policies in this account.
  ///
  /// [limit]: The maximum number of resource policies to be displayed with one
  /// call of this API.
  Future<DescribeResourcePoliciesResponse> describeResourcePolicies(
      {String nextToken, int limit}) async {
    return DescribeResourcePoliciesResponse.fromJson({});
  }

  /// Lists the subscription filters for the specified log group. You can list
  /// all the subscription filters or filter the results by prefix. The results
  /// are ASCII-sorted by filter name.
  ///
  /// [logGroupName]: The name of the log group.
  ///
  /// [filterNamePrefix]: The prefix to match. If you don't specify a value, no
  /// prefix filter is applied.
  ///
  /// [nextToken]: The token for the next set of items to return. (You received
  /// this token from a previous call.)
  ///
  /// [limit]: The maximum number of items returned. If you don't specify a
  /// value, the default is up to 50 items.
  Future<DescribeSubscriptionFiltersResponse> describeSubscriptionFilters(
      String logGroupName,
      {String filterNamePrefix,
      String nextToken,
      int limit}) async {
    return DescribeSubscriptionFiltersResponse.fromJson({});
  }

  /// Disassociates the associated AWS Key Management Service (AWS KMS) customer
  /// master key (CMK) from the specified log group.
  ///
  /// After the AWS KMS CMK is disassociated from the log group, AWS CloudWatch
  /// Logs stops encrypting newly ingested data for the log group. All
  /// previously ingested data remains encrypted, and AWS CloudWatch Logs
  /// requires permissions for the CMK whenever the encrypted data is requested.
  ///
  /// Note that it can take up to 5 minutes for this operation to take effect.
  ///
  /// [logGroupName]: The name of the log group.
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
  ///
  /// [logGroupName]: The name of the log group to search.
  ///
  /// [logStreamNames]: Filters the results to only logs from the log streams in
  /// this list.
  ///
  /// If you specify a value for both `logStreamNamePrefix` and
  /// `logStreamNames`, the action returns an `InvalidParameterException` error.
  ///
  /// [logStreamNamePrefix]: Filters the results to include only events from log
  /// streams that have names starting with this prefix.
  ///
  /// If you specify a value for both `logStreamNamePrefix` and
  /// `logStreamNames`, but the value for `logStreamNamePrefix` does not match
  /// any log stream names specified in `logStreamNames`, the action returns an
  /// `InvalidParameterException` error.
  ///
  /// [startTime]: The start of the time range, expressed as the number of
  /// milliseconds after Jan 1, 1970 00:00:00 UTC. Events with a timestamp
  /// before this time are not returned.
  ///
  /// [endTime]: The end of the time range, expressed as the number of
  /// milliseconds after Jan 1, 1970 00:00:00 UTC. Events with a timestamp later
  /// than this time are not returned.
  ///
  /// [filterPattern]: The filter pattern to use. For more information, see
  /// [Filter and Pattern Syntax](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/FilterAndPatternSyntax.html).
  ///
  /// If not provided, all the events are matched.
  ///
  /// [nextToken]: The token for the next set of events to return. (You received
  /// this token from a previous call.)
  ///
  /// [limit]: The maximum number of events to return. The default is 10,000
  /// events.
  ///
  /// [interleaved]: If the value is true, the operation makes a best effort to
  /// provide responses that contain events from multiple log streams within the
  /// log group, interleaved in a single response. If the value is false, all
  /// the matched log events in the first log stream are searched first, then
  /// those in the next log stream, and so on. The default is false.
  ///
  ///  **IMPORTANT:** Starting on June 17, 2019, this parameter will be ignored
  /// and the value will be assumed to be true. The response from this operation
  /// will always interleave events from multiple log streams within a log
  /// group.
  Future<FilterLogEventsResponse> filterLogEvents(String logGroupName,
      {List<String> logStreamNames,
      String logStreamNamePrefix,
      BigInt startTime,
      BigInt endTime,
      String filterPattern,
      String nextToken,
      int limit,
      bool interleaved}) async {
    return FilterLogEventsResponse.fromJson({});
  }

  /// Lists log events from the specified log stream. You can list all the log
  /// events or filter using a time range.
  ///
  /// By default, this operation returns as many log events as can fit in a
  /// response size of 1MB (up to 10,000 log events). You can get additional log
  /// events by specifying one of the tokens in a subsequent call.
  ///
  /// [logGroupName]: The name of the log group.
  ///
  /// [logStreamName]: The name of the log stream.
  ///
  /// [startTime]: The start of the time range, expressed as the number of
  /// milliseconds after Jan 1, 1970 00:00:00 UTC. Events with a timestamp equal
  /// to this time or later than this time are included. Events with a timestamp
  /// earlier than this time are not included.
  ///
  /// [endTime]: The end of the time range, expressed as the number of
  /// milliseconds after Jan 1, 1970 00:00:00 UTC. Events with a timestamp equal
  /// to or later than this time are not included.
  ///
  /// [nextToken]: The token for the next set of items to return. (You received
  /// this token from a previous call.)
  ///
  /// [limit]: The maximum number of log events returned. If you don't specify a
  /// value, the maximum is as many log events as can fit in a response size of
  /// 1 MB, up to 10,000 log events.
  ///
  /// [startFromHead]: If the value is true, the earliest log events are
  /// returned first. If the value is false, the latest log events are returned
  /// first. The default value is false.
  ///
  /// If you are using `nextToken` in this operation, you must specify `true`
  /// for `startFromHead`.
  Future<GetLogEventsResponse> getLogEvents(
      {@required String logGroupName,
      @required String logStreamName,
      BigInt startTime,
      BigInt endTime,
      String nextToken,
      int limit,
      bool startFromHead}) async {
    return GetLogEventsResponse.fromJson({});
  }

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
  ///
  /// [logGroupName]: The name of the log group to search.
  ///
  /// [time]: The time to set as the center of the query. If you specify `time`,
  /// the 8 minutes before and 8 minutes after this time are searched. If you
  /// omit `time`, the past 15 minutes are queried.
  ///
  /// The `time` value is specified as epoch time, the number of seconds since
  /// January 1, 1970, 00:00:00 UTC.
  Future<GetLogGroupFieldsResponse> getLogGroupFields(String logGroupName,
      {BigInt time}) async {
    return GetLogGroupFieldsResponse.fromJson({});
  }

  /// Retrieves all the fields and values of a single log event. All fields are
  /// retrieved, even if the original query that produced the `logRecordPointer`
  /// retrieved only a subset of fields. Fields are returned as field name/field
  /// value pairs.
  ///
  /// Additionally, the entire unparsed log event is returned within `@message`.
  ///
  /// [logRecordPointer]: The pointer corresponding to the log event record you
  /// want to retrieve. You get this from the response of a `GetQueryResults`
  /// operation. In that response, the value of the `@ptr` field for a log event
  /// is the value to use as `logRecordPointer` to retrieve that complete log
  /// event record.
  Future<GetLogRecordResponse> getLogRecord(String logRecordPointer) async {
    return GetLogRecordResponse.fromJson({});
  }

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
  ///
  /// [queryId]: The ID number of the query.
  Future<GetQueryResultsResponse> getQueryResults(String queryId) async {
    return GetQueryResultsResponse.fromJson({});
  }

  /// Lists the tags for the specified log group.
  ///
  /// [logGroupName]: The name of the log group.
  Future<ListTagsLogGroupResponse> listTagsLogGroup(String logGroupName) async {
    return ListTagsLogGroupResponse.fromJson({});
  }

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
  ///
  /// [destinationName]: A name for the destination.
  ///
  /// [targetArn]: The ARN of an Amazon Kinesis stream to which to deliver
  /// matching log events.
  ///
  /// [roleArn]: The ARN of an IAM role that grants CloudWatch Logs permissions
  /// to call the Amazon Kinesis PutRecord operation on the destination stream.
  Future<PutDestinationResponse> putDestination(
      {@required String destinationName,
      @required String targetArn,
      @required String roleArn}) async {
    return PutDestinationResponse.fromJson({});
  }

  /// Creates or updates an access policy associated with an existing
  /// destination. An access policy is an
  /// [IAM policy document](https://docs.aws.amazon.com/IAM/latest/UserGuide/policies_overview.html)
  /// that is used to authorize claims to register a subscription filter against
  /// a given destination.
  ///
  /// [destinationName]: A name for an existing destination.
  ///
  /// [accessPolicy]: An IAM policy document that authorizes cross-account users
  /// to deliver their log events to the associated destination.
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
  ///
  /// [logGroupName]: The name of the log group.
  ///
  /// [logStreamName]: The name of the log stream.
  ///
  /// [logEvents]: The log events.
  ///
  /// [sequenceToken]: The sequence token obtained from the response of the
  /// previous `PutLogEvents` call. An upload in a newly created log stream does
  /// not require a sequence token. You can also get the sequence token using
  /// DescribeLogStreams. If you call `PutLogEvents` twice within a narrow time
  /// period using the same value for `sequenceToken`, both calls may be
  /// successful, or one may be rejected.
  Future<PutLogEventsResponse> putLogEvents(
      {@required String logGroupName,
      @required String logStreamName,
      @required List<InputLogEvent> logEvents,
      String sequenceToken}) async {
    return PutLogEventsResponse.fromJson({});
  }

  /// Creates or updates a metric filter and associates it with the specified
  /// log group. Metric filters allow you to configure rules to extract metric
  /// data from log events ingested through PutLogEvents.
  ///
  /// The maximum number of metric filters that can be associated with a log
  /// group is 100.
  ///
  /// [logGroupName]: The name of the log group.
  ///
  /// [filterName]: A name for the metric filter.
  ///
  /// [filterPattern]: A filter pattern for extracting metric data out of
  /// ingested log events.
  ///
  /// [metricTransformations]: A collection of information that defines how
  /// metric data gets emitted.
  Future<void> putMetricFilter(
      {@required String logGroupName,
      @required String filterName,
      @required String filterPattern,
      @required List<MetricTransformation> metricTransformations}) async {}

  /// Creates or updates a resource policy allowing other AWS services to put
  /// log events to this account, such as Amazon Route 53. An account can have
  /// up to 10 resource policies per region.
  ///
  /// [policyName]: Name of the new policy. This parameter is required.
  ///
  /// [policyDocument]: Details of the new policy, including the identity of the
  /// principal that is enabled to put logs to this account. This is formatted
  /// as a JSON string. This parameter is required.
  ///
  /// The following example creates a resource policy enabling the Route 53
  /// service to put DNS query logs in to the specified log group. Replace
  /// "logArn" with the ARN of your CloudWatch Logs resource, such as a log
  /// group or log stream.
  ///
  ///  `{ "Version": "2012-10-17", "Statement":
  /// [ { "Sid": "Route53LogsToCloudWatchLogs", "Effect": "Allow", "Principal": { "Service": [ "route53.amazonaws.com" ]
  /// }, "Action":"logs:PutLogEvents", "Resource": "logArn" } ] }`
  Future<PutResourcePolicyResponse> putResourcePolicy(
      {String policyName, String policyDocument}) async {
    return PutResourcePolicyResponse.fromJson({});
  }

  /// Sets the retention of the specified log group. A retention policy allows
  /// you to configure the number of days for which to retain log events in the
  /// specified log group.
  ///
  /// [logGroupName]: The name of the log group.
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
  ///
  /// [logGroupName]: The name of the log group.
  ///
  /// [filterName]: A name for the subscription filter. If you are updating an
  /// existing filter, you must specify the correct name in `filterName`.
  /// Otherwise, the call fails because you cannot associate a second filter
  /// with a log group. To find the name of the filter currently associated with
  /// a log group, use DescribeSubscriptionFilters.
  ///
  /// [filterPattern]: A filter pattern for subscribing to a filtered stream of
  /// log events.
  ///
  /// [destinationArn]: The ARN of the destination to deliver matching log
  /// events to. Currently, the supported destinations are:
  ///
  /// *   An Amazon Kinesis stream belonging to the same account as the
  /// subscription filter, for same-account delivery.
  ///
  /// *   A logical destination (specified using an ARN) belonging to a
  /// different account, for cross-account delivery.
  ///
  /// *   An Amazon Kinesis Firehose delivery stream belonging to the same
  /// account as the subscription filter, for same-account delivery.
  ///
  /// *   An AWS Lambda function belonging to the same account as the
  /// subscription filter, for same-account delivery.
  ///
  /// [roleArn]: The ARN of an IAM role that grants CloudWatch Logs permissions
  /// to deliver ingested log events to the destination stream. You don't need
  /// to provide the ARN when you are working with a logical destination for
  /// cross-account delivery.
  ///
  /// [distribution]: The method used to distribute log data to the destination.
  /// By default log data is grouped by log stream, but the grouping can be set
  /// to random for a more even distribution. This property is only applicable
  /// when the destination is an Amazon Kinesis stream.
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
  /// For more information, see
  /// [CloudWatch Logs Insights Query Syntax](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_QuerySyntax.html).
  ///
  /// Queries time out after 15 minutes of execution. If your queries are timing
  /// out, reduce the time range being searched, or partition your query into a
  /// number of queries.
  ///
  /// [logGroupName]: The log group on which to perform the query.
  ///
  /// A `StartQuery` operation must include a `logGroupNames` or a
  /// `logGroupName` parameter, but not both.
  ///
  /// [logGroupNames]: The list of log groups to be queried. You can include up
  /// to 20 log groups.
  ///
  /// A `StartQuery` operation must include a `logGroupNames` or a
  /// `logGroupName` parameter, but not both.
  ///
  /// [startTime]: The beginning of the time range to query. The range is
  /// inclusive, so the specified start time is included in the query. Specified
  /// as epoch time, the number of seconds since January 1, 1970, 00:00:00 UTC.
  ///
  /// [endTime]: The end of the time range to query. The range is inclusive, so
  /// the specified end time is included in the query. Specified as epoch time,
  /// the number of seconds since January 1, 1970, 00:00:00 UTC.
  ///
  /// [queryString]: The query string to use. For more information, see
  /// [CloudWatch Logs Insights Query Syntax](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_QuerySyntax.html).
  ///
  /// [limit]: The maximum number of log events to return in the query. If the
  /// query string uses the `fields` command, only the specified fields and
  /// their values are returned.
  Future<StartQueryResponse> startQuery(
      {String logGroupName,
      List<String> logGroupNames,
      @required BigInt startTime,
      @required BigInt endTime,
      @required String queryString,
      int limit}) async {
    return StartQueryResponse.fromJson({});
  }

  /// Stops a CloudWatch Logs Insights query that is in progress. If the query
  /// has already ended, the operation returns an error indicating that the
  /// specified query is not running.
  ///
  /// [queryId]: The ID number of the query to stop. If necessary, you can use
  /// `DescribeQueries` to find this ID number.
  Future<StopQueryResponse> stopQuery(String queryId) async {
    return StopQueryResponse.fromJson({});
  }

  /// Adds or updates the specified tags for the specified log group.
  ///
  /// To list the tags for a log group, use ListTagsLogGroup. To remove tags,
  /// use UntagLogGroup.
  ///
  /// For more information about tags, see
  /// [Tag Log Groups in Amazon CloudWatch Logs](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/log-group-tagging.html)
  /// in the _Amazon CloudWatch Logs User Guide_.
  ///
  /// [logGroupName]: The name of the log group.
  ///
  /// [tags]: The key-value pairs to use for the tags.
  Future<void> tagLogGroup(
      {@required String logGroupName,
      @required Map<String, String> tags}) async {}

  /// Tests the filter pattern of a metric filter against a sample of log event
  /// messages. You can use this operation to validate the correctness of a
  /// metric filter pattern.
  ///
  /// [logEventMessages]: The log event messages to test.
  Future<TestMetricFilterResponse> testMetricFilter(
      {@required String filterPattern,
      @required List<String> logEventMessages}) async {
    return TestMetricFilterResponse.fromJson({});
  }

  /// Removes the specified tags from the specified log group.
  ///
  /// To list the tags for a log group, use ListTagsLogGroup. To add tags, use
  /// UntagLogGroup.
  ///
  /// [logGroupName]: The name of the log group.
  ///
  /// [tags]: The tag keys. The corresponding tags are removed from the log
  /// group.
  Future<void> untagLogGroup(
      {@required String logGroupName, @required List<String> tags}) async {}
}

class CreateExportTaskResponse {
  /// The ID of the export task.
  final String taskId;

  CreateExportTaskResponse({
    this.taskId,
  });
  static CreateExportTaskResponse fromJson(Map<String, dynamic> json) =>
      CreateExportTaskResponse();
}

class DescribeDestinationsResponse {
  /// The destinations.
  final List<Destination> destinations;

  final String nextToken;

  DescribeDestinationsResponse({
    this.destinations,
    this.nextToken,
  });
  static DescribeDestinationsResponse fromJson(Map<String, dynamic> json) =>
      DescribeDestinationsResponse();
}

class DescribeExportTasksResponse {
  /// The export tasks.
  final List<ExportTask> exportTasks;

  final String nextToken;

  DescribeExportTasksResponse({
    this.exportTasks,
    this.nextToken,
  });
  static DescribeExportTasksResponse fromJson(Map<String, dynamic> json) =>
      DescribeExportTasksResponse();
}

class DescribeLogGroupsResponse {
  /// The log groups.
  final List<LogGroup> logGroups;

  final String nextToken;

  DescribeLogGroupsResponse({
    this.logGroups,
    this.nextToken,
  });
  static DescribeLogGroupsResponse fromJson(Map<String, dynamic> json) =>
      DescribeLogGroupsResponse();
}

class DescribeLogStreamsResponse {
  /// The log streams.
  final List<LogStream> logStreams;

  final String nextToken;

  DescribeLogStreamsResponse({
    this.logStreams,
    this.nextToken,
  });
  static DescribeLogStreamsResponse fromJson(Map<String, dynamic> json) =>
      DescribeLogStreamsResponse();
}

class DescribeMetricFiltersResponse {
  /// The metric filters.
  final List<MetricFilter> metricFilters;

  final String nextToken;

  DescribeMetricFiltersResponse({
    this.metricFilters,
    this.nextToken,
  });
  static DescribeMetricFiltersResponse fromJson(Map<String, dynamic> json) =>
      DescribeMetricFiltersResponse();
}

class DescribeQueriesResponse {
  /// The list of queries that match the request.
  final List<QueryInfo> queries;

  final String nextToken;

  DescribeQueriesResponse({
    this.queries,
    this.nextToken,
  });
  static DescribeQueriesResponse fromJson(Map<String, dynamic> json) =>
      DescribeQueriesResponse();
}

class DescribeResourcePoliciesResponse {
  /// The resource policies that exist in this account.
  final List<ResourcePolicy> resourcePolicies;

  final String nextToken;

  DescribeResourcePoliciesResponse({
    this.resourcePolicies,
    this.nextToken,
  });
  static DescribeResourcePoliciesResponse fromJson(Map<String, dynamic> json) =>
      DescribeResourcePoliciesResponse();
}

class DescribeSubscriptionFiltersResponse {
  /// The subscription filters.
  final List<SubscriptionFilter> subscriptionFilters;

  final String nextToken;

  DescribeSubscriptionFiltersResponse({
    this.subscriptionFilters,
    this.nextToken,
  });
  static DescribeSubscriptionFiltersResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeSubscriptionFiltersResponse();
}

/// Represents a cross-account destination that receives subscription log
/// events.
class Destination {
  /// The name of the destination.
  final String destinationName;

  /// The Amazon Resource Name (ARN) of the physical target to where the log
  /// events are delivered (for example, a Kinesis stream).
  final String targetArn;

  /// A role for impersonation, used when delivering log events to the target.
  final String roleArn;

  /// An IAM policy document that governs which AWS accounts can create
  /// subscription filters against this destination.
  final String accessPolicy;

  /// The ARN of this destination.
  final String arn;

  /// The creation time of the destination, expressed as the number of
  /// milliseconds after Jan 1, 1970 00:00:00 UTC.
  final BigInt creationTime;

  Destination({
    this.destinationName,
    this.targetArn,
    this.roleArn,
    this.accessPolicy,
    this.arn,
    this.creationTime,
  });
  static Destination fromJson(Map<String, dynamic> json) => Destination();
}

/// Represents an export task.
class ExportTask {
  /// The ID of the export task.
  final String taskId;

  /// The name of the export task.
  final String taskName;

  /// The name of the log group from which logs data was exported.
  final String logGroupName;

  /// The start time, expressed as the number of milliseconds after Jan 1, 1970
  /// 00:00:00 UTC. Events with a timestamp before this time are not exported.
  final BigInt from;

  /// The end time, expressed as the number of milliseconds after Jan 1, 1970
  /// 00:00:00 UTC. Events with a timestamp later than this time are not
  /// exported.
  final BigInt to;

  /// The name of Amazon S3 bucket to which the log data was exported.
  final String destination;

  /// The prefix that was used as the start of Amazon S3 key for every object
  /// exported.
  final String destinationPrefix;

  /// The status of the export task.
  final ExportTaskStatus status;

  /// Execution info about the export task.
  final ExportTaskExecutionInfo executionInfo;

  ExportTask({
    this.taskId,
    this.taskName,
    this.logGroupName,
    this.from,
    this.to,
    this.destination,
    this.destinationPrefix,
    this.status,
    this.executionInfo,
  });
  static ExportTask fromJson(Map<String, dynamic> json) => ExportTask();
}

/// Represents the status of an export task.
class ExportTaskExecutionInfo {
  /// The creation time of the export task, expressed as the number of
  /// milliseconds after Jan 1, 1970 00:00:00 UTC.
  final BigInt creationTime;

  /// The completion time of the export task, expressed as the number of
  /// milliseconds after Jan 1, 1970 00:00:00 UTC.
  final BigInt completionTime;

  ExportTaskExecutionInfo({
    this.creationTime,
    this.completionTime,
  });
  static ExportTaskExecutionInfo fromJson(Map<String, dynamic> json) =>
      ExportTaskExecutionInfo();
}

/// Represents the status of an export task.
class ExportTaskStatus {
  /// The status code of the export task.
  final String code;

  /// The status message related to the status code.
  final String message;

  ExportTaskStatus({
    this.code,
    this.message,
  });
  static ExportTaskStatus fromJson(Map<String, dynamic> json) =>
      ExportTaskStatus();
}

class FilterLogEventsResponse {
  /// The matched events.
  final List<FilteredLogEvent> events;

  /// Indicates which log streams have been searched and whether each has been
  /// searched completely.
  final List<SearchedLogStream> searchedLogStreams;

  /// The token to use when requesting the next set of items. The token expires
  /// after 24 hours.
  final String nextToken;

  FilterLogEventsResponse({
    this.events,
    this.searchedLogStreams,
    this.nextToken,
  });
  static FilterLogEventsResponse fromJson(Map<String, dynamic> json) =>
      FilterLogEventsResponse();
}

/// Represents a matched event.
class FilteredLogEvent {
  /// The name of the log stream to which this event belongs.
  final String logStreamName;

  /// The time the event occurred, expressed as the number of milliseconds after
  /// Jan 1, 1970 00:00:00 UTC.
  final BigInt timestamp;

  /// The data contained in the log event.
  final String message;

  /// The time the event was ingested, expressed as the number of milliseconds
  /// after Jan 1, 1970 00:00:00 UTC.
  final BigInt ingestionTime;

  /// The ID of the event.
  final String eventId;

  FilteredLogEvent({
    this.logStreamName,
    this.timestamp,
    this.message,
    this.ingestionTime,
    this.eventId,
  });
  static FilteredLogEvent fromJson(Map<String, dynamic> json) =>
      FilteredLogEvent();
}

class GetLogEventsResponse {
  /// The events.
  final List<OutputLogEvent> events;

  /// The token for the next set of items in the forward direction. The token
  /// expires after 24 hours. If you have reached the end of the stream, it will
  /// return the same token you passed in.
  final String nextForwardToken;

  /// The token for the next set of items in the backward direction. The token
  /// expires after 24 hours. This token will never be null. If you have reached
  /// the end of the stream, it will return the same token you passed in.
  final String nextBackwardToken;

  GetLogEventsResponse({
    this.events,
    this.nextForwardToken,
    this.nextBackwardToken,
  });
  static GetLogEventsResponse fromJson(Map<String, dynamic> json) =>
      GetLogEventsResponse();
}

class GetLogGroupFieldsResponse {
  /// The array of fields found in the query. Each object in the array contains
  /// the name of the field, along with the percentage of time it appeared in
  /// the log events that were queried.
  final List<LogGroupField> logGroupFields;

  GetLogGroupFieldsResponse({
    this.logGroupFields,
  });
  static GetLogGroupFieldsResponse fromJson(Map<String, dynamic> json) =>
      GetLogGroupFieldsResponse();
}

class GetLogRecordResponse {
  /// The requested log event, as a JSON string.
  final Map<String, String> logRecord;

  GetLogRecordResponse({
    this.logRecord,
  });
  static GetLogRecordResponse fromJson(Map<String, dynamic> json) =>
      GetLogRecordResponse();
}

class GetQueryResultsResponse {
  /// The log events that matched the query criteria during the most recent time
  /// it ran.
  ///
  /// The `results` value is an array of arrays. Each log event is one object in
  /// the top-level array. Each of these log event objects is an array of
  /// `field`/`value` pairs.
  final List<List<ResultField>> results;

  /// Includes the number of log events scanned by the query, the number of log
  /// events that matched the query criteria, and the total number of bytes in
  /// the log events that were scanned.
  final QueryStatistics statistics;

  /// The status of the most recent running of the query. Possible values are
  /// `Cancelled`, `Complete`, `Failed`, `Running`, `Scheduled`, `Timeout`, and
  /// `Unknown`.
  ///
  /// Queries time out after 15 minutes of execution. To avoid having your
  /// queries time out, reduce the time range being searched, or partition your
  /// query into a number of queries.
  final String status;

  GetQueryResultsResponse({
    this.results,
    this.statistics,
    this.status,
  });
  static GetQueryResultsResponse fromJson(Map<String, dynamic> json) =>
      GetQueryResultsResponse();
}

/// Represents a log event, which is a record of activity that was recorded by
/// the application or resource being monitored.
class InputLogEvent {
  /// The time the event occurred, expressed as the number of milliseconds after
  /// Jan 1, 1970 00:00:00 UTC.
  final BigInt timestamp;

  /// The raw event message.
  final String message;

  InputLogEvent({
    @required this.timestamp,
    @required this.message,
  });
}

class ListTagsLogGroupResponse {
  /// The tags for the log group.
  final Map<String, String> tags;

  ListTagsLogGroupResponse({
    this.tags,
  });
  static ListTagsLogGroupResponse fromJson(Map<String, dynamic> json) =>
      ListTagsLogGroupResponse();
}

/// Represents a log group.
class LogGroup {
  /// The name of the log group.
  final String logGroupName;

  /// The creation time of the log group, expressed as the number of
  /// milliseconds after Jan 1, 1970 00:00:00 UTC.
  final BigInt creationTime;

  final int retentionInDays;

  /// The number of metric filters.
  final int metricFilterCount;

  /// The Amazon Resource Name (ARN) of the log group.
  final String arn;

  /// The number of bytes stored.
  final BigInt storedBytes;

  /// The Amazon Resource Name (ARN) of the CMK to use when encrypting log data.
  final String kmsKeyId;

  LogGroup({
    this.logGroupName,
    this.creationTime,
    this.retentionInDays,
    this.metricFilterCount,
    this.arn,
    this.storedBytes,
    this.kmsKeyId,
  });
  static LogGroup fromJson(Map<String, dynamic> json) => LogGroup();
}

/// The fields contained in log events found by a `GetLogGroupFields` operation,
/// along with the percentage of queried log events in which each field appears.
class LogGroupField {
  /// The name of a log field.
  final String name;

  /// The percentage of log events queried that contained the field.
  final int percent;

  LogGroupField({
    this.name,
    this.percent,
  });
  static LogGroupField fromJson(Map<String, dynamic> json) => LogGroupField();
}

/// Represents a log stream, which is a sequence of log events from a single
/// emitter of logs.
class LogStream {
  /// The name of the log stream.
  final String logStreamName;

  /// The creation time of the stream, expressed as the number of milliseconds
  /// after Jan 1, 1970 00:00:00 UTC.
  final BigInt creationTime;

  /// The time of the first event, expressed as the number of milliseconds after
  /// Jan 1, 1970 00:00:00 UTC.
  final BigInt firstEventTimestamp;

  /// The time of the most recent log event in the log stream in CloudWatch
  /// Logs. This number is expressed as the number of milliseconds after Jan 1,
  /// 1970 00:00:00 UTC. The `lastEventTime` value updates on an eventual
  /// consistency basis. It typically updates in less than an hour from
  /// ingestion, but may take longer in some rare situations.
  final BigInt lastEventTimestamp;

  /// The ingestion time, expressed as the number of milliseconds after Jan 1,
  /// 1970 00:00:00 UTC.
  final BigInt lastIngestionTime;

  /// The sequence token.
  final String uploadSequenceToken;

  /// The Amazon Resource Name (ARN) of the log stream.
  final String arn;

  /// The number of bytes stored.
  ///
  ///  **IMPORTANT:** Starting on June 17, 2019, this parameter will be
  /// deprecated for log streams, and will be reported as zero. This change
  /// applies only to log streams. The `storedBytes` parameter for log groups is
  /// not affected.
  final BigInt storedBytes;

  LogStream({
    this.logStreamName,
    this.creationTime,
    this.firstEventTimestamp,
    this.lastEventTimestamp,
    this.lastIngestionTime,
    this.uploadSequenceToken,
    this.arn,
    this.storedBytes,
  });
  static LogStream fromJson(Map<String, dynamic> json) => LogStream();
}

/// Metric filters express how CloudWatch Logs would extract metric observations
/// from ingested log events and transform them into metric data in a CloudWatch
/// metric.
class MetricFilter {
  /// The name of the metric filter.
  final String filterName;

  final String filterPattern;

  /// The metric transformations.
  final List<MetricTransformation> metricTransformations;

  /// The creation time of the metric filter, expressed as the number of
  /// milliseconds after Jan 1, 1970 00:00:00 UTC.
  final BigInt creationTime;

  /// The name of the log group.
  final String logGroupName;

  MetricFilter({
    this.filterName,
    this.filterPattern,
    this.metricTransformations,
    this.creationTime,
    this.logGroupName,
  });
  static MetricFilter fromJson(Map<String, dynamic> json) => MetricFilter();
}

/// Represents a matched event.
class MetricFilterMatchRecord {
  /// The event number.
  final BigInt eventNumber;

  /// The raw event data.
  final String eventMessage;

  /// The values extracted from the event data by the filter.
  final Map<String, String> extractedValues;

  MetricFilterMatchRecord({
    this.eventNumber,
    this.eventMessage,
    this.extractedValues,
  });
  static MetricFilterMatchRecord fromJson(Map<String, dynamic> json) =>
      MetricFilterMatchRecord();
}

/// Indicates how to transform ingested log events to metric data in a
/// CloudWatch metric.
class MetricTransformation {
  /// The name of the CloudWatch metric.
  final String metricName;

  /// The namespace of the CloudWatch metric.
  final String metricNamespace;

  /// The value to publish to the CloudWatch metric when a filter pattern
  /// matches a log event.
  final String metricValue;

  /// (Optional) The value to emit when a filter pattern does not match a log
  /// event. This value can be null.
  final double defaultValue;

  MetricTransformation({
    @required this.metricName,
    @required this.metricNamespace,
    @required this.metricValue,
    this.defaultValue,
  });
  static MetricTransformation fromJson(Map<String, dynamic> json) =>
      MetricTransformation();
}

/// Represents a log event.
class OutputLogEvent {
  /// The time the event occurred, expressed as the number of milliseconds after
  /// Jan 1, 1970 00:00:00 UTC.
  final BigInt timestamp;

  /// The data contained in the log event.
  final String message;

  /// The time the event was ingested, expressed as the number of milliseconds
  /// after Jan 1, 1970 00:00:00 UTC.
  final BigInt ingestionTime;

  OutputLogEvent({
    this.timestamp,
    this.message,
    this.ingestionTime,
  });
  static OutputLogEvent fromJson(Map<String, dynamic> json) => OutputLogEvent();
}

class PutDestinationResponse {
  /// The destination.
  final Destination destination;

  PutDestinationResponse({
    this.destination,
  });
  static PutDestinationResponse fromJson(Map<String, dynamic> json) =>
      PutDestinationResponse();
}

class PutLogEventsResponse {
  /// The next sequence token.
  final String nextSequenceToken;

  /// The rejected events.
  final RejectedLogEventsInfo rejectedLogEventsInfo;

  PutLogEventsResponse({
    this.nextSequenceToken,
    this.rejectedLogEventsInfo,
  });
  static PutLogEventsResponse fromJson(Map<String, dynamic> json) =>
      PutLogEventsResponse();
}

class PutResourcePolicyResponse {
  /// The new policy.
  final ResourcePolicy resourcePolicy;

  PutResourcePolicyResponse({
    this.resourcePolicy,
  });
  static PutResourcePolicyResponse fromJson(Map<String, dynamic> json) =>
      PutResourcePolicyResponse();
}

/// Information about one CloudWatch Logs Insights query that matches the
/// request in a `DescribeQueries` operation.
class QueryInfo {
  /// The unique ID number of this query.
  final String queryId;

  /// The query string used in this query.
  final String queryString;

  /// The status of this query. Possible values are `Cancelled`, `Complete`,
  /// `Failed`, `Running`, `Scheduled`, and `Unknown`.
  final String status;

  /// The date and time that this query was created.
  final BigInt createTime;

  /// The name of the log group scanned by this query.
  final String logGroupName;

  QueryInfo({
    this.queryId,
    this.queryString,
    this.status,
    this.createTime,
    this.logGroupName,
  });
  static QueryInfo fromJson(Map<String, dynamic> json) => QueryInfo();
}

/// Contains the number of log events scanned by the query, the number of log
/// events that matched the query criteria, and the total number of bytes in the
/// log events that were scanned.
class QueryStatistics {
  /// The number of log events that matched the query string.
  final double recordsMatched;

  /// The total number of log events scanned during the query.
  final double recordsScanned;

  /// The total number of bytes in the log events scanned during the query.
  final double bytesScanned;

  QueryStatistics({
    this.recordsMatched,
    this.recordsScanned,
    this.bytesScanned,
  });
  static QueryStatistics fromJson(Map<String, dynamic> json) =>
      QueryStatistics();
}

/// Represents the rejected events.
class RejectedLogEventsInfo {
  /// The log events that are too new.
  final int tooNewLogEventStartIndex;

  /// The log events that are too old.
  final int tooOldLogEventEndIndex;

  /// The expired log events.
  final int expiredLogEventEndIndex;

  RejectedLogEventsInfo({
    this.tooNewLogEventStartIndex,
    this.tooOldLogEventEndIndex,
    this.expiredLogEventEndIndex,
  });
  static RejectedLogEventsInfo fromJson(Map<String, dynamic> json) =>
      RejectedLogEventsInfo();
}

/// A policy enabling one or more entities to put logs to a log group in this
/// account.
class ResourcePolicy {
  /// The name of the resource policy.
  final String policyName;

  /// The details of the policy.
  final String policyDocument;

  /// Timestamp showing when this policy was last updated, expressed as the
  /// number of milliseconds after Jan 1, 1970 00:00:00 UTC.
  final BigInt lastUpdatedTime;

  ResourcePolicy({
    this.policyName,
    this.policyDocument,
    this.lastUpdatedTime,
  });
  static ResourcePolicy fromJson(Map<String, dynamic> json) => ResourcePolicy();
}

/// Contains one field from one log event returned by a CloudWatch Logs Insights
/// query, along with the value of that field.
class ResultField {
  /// The log event field.
  final String field;

  /// The value of this field.
  final String value;

  ResultField({
    this.field,
    this.value,
  });
  static ResultField fromJson(Map<String, dynamic> json) => ResultField();
}

/// Represents the search status of a log stream.
class SearchedLogStream {
  /// The name of the log stream.
  final String logStreamName;

  /// Indicates whether all the events in this log stream were searched.
  final bool searchedCompletely;

  SearchedLogStream({
    this.logStreamName,
    this.searchedCompletely,
  });
  static SearchedLogStream fromJson(Map<String, dynamic> json) =>
      SearchedLogStream();
}

class StartQueryResponse {
  /// The unique ID of the query.
  final String queryId;

  StartQueryResponse({
    this.queryId,
  });
  static StartQueryResponse fromJson(Map<String, dynamic> json) =>
      StartQueryResponse();
}

class StopQueryResponse {
  /// This is true if the query was stopped by the `StopQuery` operation.
  final bool success;

  StopQueryResponse({
    this.success,
  });
  static StopQueryResponse fromJson(Map<String, dynamic> json) =>
      StopQueryResponse();
}

/// Represents a subscription filter.
class SubscriptionFilter {
  /// The name of the subscription filter.
  final String filterName;

  /// The name of the log group.
  final String logGroupName;

  final String filterPattern;

  /// The Amazon Resource Name (ARN) of the destination.
  final String destinationArn;

  final String roleArn;

  final String distribution;

  /// The creation time of the subscription filter, expressed as the number of
  /// milliseconds after Jan 1, 1970 00:00:00 UTC.
  final BigInt creationTime;

  SubscriptionFilter({
    this.filterName,
    this.logGroupName,
    this.filterPattern,
    this.destinationArn,
    this.roleArn,
    this.distribution,
    this.creationTime,
  });
  static SubscriptionFilter fromJson(Map<String, dynamic> json) =>
      SubscriptionFilter();
}

class TestMetricFilterResponse {
  /// The matched events.
  final List<MetricFilterMatchRecord> matches;

  TestMetricFilterResponse({
    this.matches,
  });
  static TestMetricFilterResponse fromJson(Map<String, dynamic> json) =>
      TestMetricFilterResponse();
}
