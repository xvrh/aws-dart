import 'package:meta/meta.dart';
import 'dart:typed_data';

/// Amazon Kinesis Data Streams Service API Reference
///
/// Amazon Kinesis Data Streams is a managed service that scales elastically for
/// real-time processing of streaming big data.
class KinesisApi {
  /// Adds or updates tags for the specified Kinesis data stream. Each time you
  /// invoke this operation, you can specify up to 10 tags. If you want to add
  /// more than 10 tags to your stream, you can invoke this operation multiple
  /// times. In total, each stream can have up to 50 tags.
  ///
  /// If tags have already been assigned to the stream, `AddTagsToStream`
  /// overwrites any existing tags that correspond to the specified tag keys.
  ///
  ///  AddTagsToStream has a limit of five transactions per second per account.
  ///
  /// [streamName]: The name of the stream.
  ///
  /// [tags]: A set of up to 10 key-value pairs to use to create the tags.
  Future<void> addTagsToStream(
      {@required String streamName,
      @required Map<String, String> tags}) async {}

  /// Creates a Kinesis data stream. A stream captures and transports data
  /// records that are continuously emitted from different data sources or
  /// _producers_. Scale-out within a stream is explicitly supported by means of
  /// shards, which are uniquely identified groups of data records in a stream.
  ///
  /// You specify and control the number of shards that a stream is composed of.
  /// Each shard can support reads up to five transactions per second, up to a
  /// maximum data read total of 2 MB per second. Each shard can support writes
  /// up to 1,000 records per second, up to a maximum data write total of 1 MB
  /// per second. If the amount of data input increases or decreases, you can
  /// add or remove shards.
  ///
  /// The stream name identifies the stream. The name is scoped to the AWS
  /// account used by the application. It is also scoped by AWS Region. That is,
  /// two streams in two different accounts can have the same name, and two
  /// streams in the same account, but in two different Regions, can have the
  /// same name.
  ///
  ///  `CreateStream` is an asynchronous operation. Upon receiving a
  /// `CreateStream` request, Kinesis Data Streams immediately returns and sets
  /// the stream status to `CREATING`. After the stream is created, Kinesis Data
  /// Streams sets the stream status to `ACTIVE`. You should perform read and
  /// write operations only on an `ACTIVE` stream.
  ///
  /// You receive a `LimitExceededException` when making a `CreateStream`
  /// request when you try to do one of the following:
  ///
  /// *   Have more than five streams in the `CREATING` state at any point in
  /// time.
  ///
  /// *   Create more shards than are authorized for your account.
  ///
  ///
  /// For the default shard limit for an AWS account, see
  /// [Amazon Kinesis Data Streams Limits](http://docs.aws.amazon.com/kinesis/latest/dev/service-sizes-and-limits.html)
  /// in the _Amazon Kinesis Data Streams Developer Guide_. To increase this
  /// limit,
  /// [contact AWS Support](http://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html).
  ///
  /// You can use `DescribeStream` to check the stream status, which is returned
  /// in `StreamStatus`.
  ///
  ///  CreateStream has a limit of five transactions per second per account.
  ///
  /// [streamName]: A name to identify the stream. The stream name is scoped to
  /// the AWS account used by the application that creates the stream. It is
  /// also scoped by AWS Region. That is, two streams in two different AWS
  /// accounts can have the same name. Two streams in the same AWS account but
  /// in two different Regions can also have the same name.
  ///
  /// [shardCount]: The number of shards that the stream will use. The
  /// throughput of the stream is a function of the number of shards; more
  /// shards are required for greater provisioned throughput.
  ///
  /// DefaultShardLimit;
  Future<void> createStream(
      {@required String streamName, @required int shardCount}) async {}

  /// Decreases the Kinesis data stream's retention period, which is the length
  /// of time data records are accessible after they are added to the stream.
  /// The minimum value of a stream's retention period is 24 hours.
  ///
  /// This operation may result in lost data. For example, if the stream's
  /// retention period is 48 hours and is decreased to 24 hours, any data
  /// already in the stream that is older than 24 hours is inaccessible.
  ///
  /// [streamName]: The name of the stream to modify.
  ///
  /// [retentionPeriodHours]: The new retention period of the stream, in hours.
  /// Must be less than the current retention period.
  Future<void> decreaseStreamRetentionPeriod(
      {@required String streamName,
      @required int retentionPeriodHours}) async {}

  /// Deletes a Kinesis data stream and all its shards and data. You must shut
  /// down any applications that are operating on the stream before you delete
  /// the stream. If an application attempts to operate on a deleted stream, it
  /// receives the exception `ResourceNotFoundException`.
  ///
  /// If the stream is in the `ACTIVE` state, you can delete it. After a
  /// `DeleteStream` request, the specified stream is in the `DELETING` state
  /// until Kinesis Data Streams completes the deletion.
  ///
  ///  **Note:** Kinesis Data Streams might continue to accept data read and
  /// write operations, such as PutRecord, PutRecords, and GetRecords, on a
  /// stream in the `DELETING` state until the stream deletion is complete.
  ///
  /// When you delete a stream, any shards in that stream are also deleted, and
  /// any tags are dissociated from the stream.
  ///
  /// You can use the DescribeStream operation to check the state of the stream,
  /// which is returned in `StreamStatus`.
  ///
  ///  DeleteStream has a limit of five transactions per second per account.
  ///
  /// [streamName]: The name of the stream to delete.
  ///
  /// [enforceConsumerDeletion]: If this parameter is unset (`null`) or if you
  /// set it to `false`, and the stream has registered consumers, the call to
  /// `DeleteStream` fails with a `ResourceInUseException`.
  Future<void> deleteStream(String streamName,
      {bool enforceConsumerDeletion}) async {}

  /// To deregister a consumer, provide its ARN. Alternatively, you can provide
  /// the ARN of the data stream and the name you gave the consumer when you
  /// registered it. You may also provide all three parameters, as long as they
  /// don't conflict with each other. If you don't know the name or ARN of the
  /// consumer that you want to deregister, you can use the ListStreamConsumers
  /// operation to get a list of the descriptions of all the consumers that are
  /// currently registered with a given data stream. The description of a
  /// consumer contains its name and ARN.
  ///
  /// This operation has a limit of five transactions per second per account.
  ///
  /// [streamArn]: The ARN of the Kinesis data stream that the consumer is
  /// registered with. For more information, see
  /// [Amazon Resource Names (ARNs) and AWS Service Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-kinesis-streams).
  ///
  /// [consumerName]: The name that you gave to the consumer.
  ///
  /// [consumerArn]: The ARN returned by Kinesis Data Streams when you
  /// registered the consumer. If you don't know the ARN of the consumer that
  /// you want to deregister, you can use the ListStreamConsumers operation to
  /// get a list of the descriptions of all the consumers that are currently
  /// registered with a given data stream. The description of a consumer
  /// contains its ARN.
  Future<void> deregisterStreamConsumer(
      {String streamArn, String consumerName, String consumerArn}) async {}

  /// Describes the shard limits and usage for the account.
  ///
  /// If you update your account limits, the old limits might be returned for a
  /// few minutes.
  ///
  /// This operation has a limit of one transaction per second per account.
  Future<DescribeLimitsOutput> describeLimits() async {
    return DescribeLimitsOutput.fromJson({});
  }

  /// Describes the specified Kinesis data stream.
  ///
  /// The information returned includes the stream name, Amazon Resource Name
  /// (ARN), creation time, enhanced metric configuration, and shard map. The
  /// shard map is an array of shard objects. For each shard object, there is
  /// the hash key and sequence number ranges that the shard spans, and the IDs
  /// of any earlier shards that played in a role in creating the shard. Every
  /// record ingested in the stream is identified by a sequence number, which is
  /// assigned when the record is put into the stream.
  ///
  /// You can limit the number of shards returned by each call. For more
  /// information, see
  /// [Retrieving Shards from a Stream](http://docs.aws.amazon.com/kinesis/latest/dev/kinesis-using-sdk-java-retrieve-shards.html)
  /// in the _Amazon Kinesis Data Streams Developer Guide_.
  ///
  /// There are no guarantees about the chronological order shards returned. To
  /// process shards in chronological order, use the ID of the parent shard to
  /// track the lineage to the oldest shard.
  ///
  /// This operation has a limit of 10 transactions per second per account.
  ///
  /// [streamName]: The name of the stream to describe.
  ///
  /// [limit]: The maximum number of shards to return in a single call. The
  /// default value is 100. If you specify a value greater than 100, at most 100
  /// shards are returned.
  ///
  /// [exclusiveStartShardId]: The shard ID of the shard to start with.
  Future<DescribeStreamOutput> describeStream(String streamName,
      {int limit, String exclusiveStartShardId}) async {
    return DescribeStreamOutput.fromJson({});
  }

  /// To get the description of a registered consumer, provide the ARN of the
  /// consumer. Alternatively, you can provide the ARN of the data stream and
  /// the name you gave the consumer when you registered it. You may also
  /// provide all three parameters, as long as they don't conflict with each
  /// other. If you don't know the name or ARN of the consumer that you want to
  /// describe, you can use the ListStreamConsumers operation to get a list of
  /// the descriptions of all the consumers that are currently registered with a
  /// given data stream.
  ///
  /// This operation has a limit of 20 transactions per second per account.
  ///
  /// [streamArn]: The ARN of the Kinesis data stream that the consumer is
  /// registered with. For more information, see
  /// [Amazon Resource Names (ARNs) and AWS Service Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-kinesis-streams).
  ///
  /// [consumerName]: The name that you gave to the consumer.
  ///
  /// [consumerArn]: The ARN returned by Kinesis Data Streams when you
  /// registered the consumer.
  Future<DescribeStreamConsumerOutput> describeStreamConsumer(
      {String streamArn, String consumerName, String consumerArn}) async {
    return DescribeStreamConsumerOutput.fromJson({});
  }

  /// Provides a summarized description of the specified Kinesis data stream
  /// without the shard list.
  ///
  /// The information returned includes the stream name, Amazon Resource Name
  /// (ARN), status, record retention period, approximate creation time,
  /// monitoring, encryption details, and open shard count.
  ///
  /// [streamName]: The name of the stream to describe.
  Future<DescribeStreamSummaryOutput> describeStreamSummary(
      String streamName) async {
    return DescribeStreamSummaryOutput.fromJson({});
  }

  /// Disables enhanced monitoring.
  ///
  /// [streamName]: The name of the Kinesis data stream for which to disable
  /// enhanced monitoring.
  ///
  /// [shardLevelMetrics]: List of shard-level metrics to disable.
  ///
  /// The following are the valid shard-level metrics. The value "`ALL`"
  /// disables every metric.
  ///
  /// *    `IncomingBytes`
  ///
  /// *    `IncomingRecords`
  ///
  /// *    `OutgoingBytes`
  ///
  /// *    `OutgoingRecords`
  ///
  /// *    `WriteProvisionedThroughputExceeded`
  ///
  /// *    `ReadProvisionedThroughputExceeded`
  ///
  /// *    `IteratorAgeMilliseconds`
  ///
  /// *    `ALL`
  ///
  ///
  /// For more information, see
  /// [Monitoring the Amazon Kinesis Data Streams Service with Amazon CloudWatch](http://docs.aws.amazon.com/kinesis/latest/dev/monitoring-with-cloudwatch.html)
  /// in the _Amazon Kinesis Data Streams Developer Guide_.
  Future<EnhancedMonitoringOutput> disableEnhancedMonitoring(
      {@required String streamName,
      @required List<String> shardLevelMetrics}) async {
    return EnhancedMonitoringOutput.fromJson({});
  }

  /// Enables enhanced Kinesis data stream monitoring for shard-level metrics.
  ///
  /// [streamName]: The name of the stream for which to enable enhanced
  /// monitoring.
  ///
  /// [shardLevelMetrics]: List of shard-level metrics to enable.
  ///
  /// The following are the valid shard-level metrics. The value "`ALL`" enables
  /// every metric.
  ///
  /// *    `IncomingBytes`
  ///
  /// *    `IncomingRecords`
  ///
  /// *    `OutgoingBytes`
  ///
  /// *    `OutgoingRecords`
  ///
  /// *    `WriteProvisionedThroughputExceeded`
  ///
  /// *    `ReadProvisionedThroughputExceeded`
  ///
  /// *    `IteratorAgeMilliseconds`
  ///
  /// *    `ALL`
  ///
  ///
  /// For more information, see
  /// [Monitoring the Amazon Kinesis Data Streams Service with Amazon CloudWatch](http://docs.aws.amazon.com/kinesis/latest/dev/monitoring-with-cloudwatch.html)
  /// in the _Amazon Kinesis Data Streams Developer Guide_.
  Future<EnhancedMonitoringOutput> enableEnhancedMonitoring(
      {@required String streamName,
      @required List<String> shardLevelMetrics}) async {
    return EnhancedMonitoringOutput.fromJson({});
  }

  /// Gets data records from a Kinesis data stream's shard.
  ///
  /// Specify a shard iterator using the `ShardIterator` parameter. The shard
  /// iterator specifies the position in the shard from which you want to start
  /// reading data records sequentially. If there are no records available in
  /// the portion of the shard that the iterator points to, GetRecords returns
  /// an empty list. It might take multiple calls to get to a portion of the
  /// shard that contains records.
  ///
  /// You can scale by provisioning multiple shards per stream while considering
  /// service limits (for more information, see
  /// [Amazon Kinesis Data Streams Limits](http://docs.aws.amazon.com/kinesis/latest/dev/service-sizes-and-limits.html)
  /// in the _Amazon Kinesis Data Streams Developer Guide_). Your application
  /// should have one thread per shard, each reading continuously from its
  /// stream. To read from a stream continually, call GetRecords in a loop. Use
  /// GetShardIterator to get the shard iterator to specify in the first
  /// GetRecords call. GetRecords returns a new shard iterator in
  /// `NextShardIterator`. Specify the shard iterator returned in
  /// `NextShardIterator` in subsequent calls to GetRecords. If the shard has
  /// been closed, the shard iterator can't return more data and GetRecords
  /// returns `null` in `NextShardIterator`. You can terminate the loop when the
  /// shard is closed, or when the shard iterator reaches the record with the
  /// sequence number or other attribute that marks it as the last record to
  /// process.
  ///
  /// Each data record can be up to 1 MiB in size, and each shard can read up to
  /// 2 MiB per second. You can ensure that your calls don't exceed the maximum
  /// supported size or throughput by using the `Limit` parameter to specify the
  /// maximum number of records that GetRecords can return. Consider your
  /// average record size when determining this limit. The maximum number of
  /// records that can be returned per call is 10,000.
  ///
  /// The size of the data returned by GetRecords varies depending on the
  /// utilization of the shard. The maximum size of data that GetRecords can
  /// return is 10 MiB. If a call returns this amount of data, subsequent calls
  /// made within the next 5 seconds throw
  /// `ProvisionedThroughputExceededException`. If there is insufficient
  /// provisioned throughput on the stream, subsequent calls made within the
  /// next 1 second throw `ProvisionedThroughputExceededException`. GetRecords
  /// doesn't return any data when it throws an exception. For this reason, we
  /// recommend that you wait 1 second between calls to GetRecords. However,
  /// it's possible that the application will get exceptions for longer than 1
  /// second.
  ///
  /// To detect whether the application is falling behind in processing, you can
  /// use the `MillisBehindLatest` response attribute. You can also monitor the
  /// stream using CloudWatch metrics and other mechanisms (see
  /// [Monitoring](http://docs.aws.amazon.com/kinesis/latest/dev/monitoring.html)
  /// in the _Amazon Kinesis Data Streams Developer Guide_).
  ///
  /// Each Amazon Kinesis record includes a value,
  /// `ApproximateArrivalTimestamp`, that is set when a stream successfully
  /// receives and stores a record. This is commonly referred to as a
  /// server-side time stamp, whereas a client-side time stamp is set when a
  /// data producer creates or sends the record to a stream (a data producer is
  /// any data source putting data records into a stream, for example with
  /// PutRecords). The time stamp has millisecond precision. There are no
  /// guarantees about the time stamp accuracy, or that the time stamp is always
  /// increasing. For example, records in a shard or across a stream might have
  /// time stamps that are out of order.
  ///
  /// This operation has a limit of five transactions per second per account.
  ///
  /// [shardIterator]: The position in the shard from which you want to start
  /// sequentially reading data records. A shard iterator specifies this
  /// position using the sequence number of a data record in the shard.
  ///
  /// [limit]: The maximum number of records to return. Specify a value of up to
  /// 10,000. If you specify a value that is greater than 10,000, GetRecords
  /// throws `InvalidArgumentException`.
  Future<GetRecordsOutput> getRecords(String shardIterator, {int limit}) async {
    return GetRecordsOutput.fromJson({});
  }

  /// Gets an Amazon Kinesis shard iterator. A shard iterator expires 5 minutes
  /// after it is returned to the requester.
  ///
  /// A shard iterator specifies the shard position from which to start reading
  /// data records sequentially. The position is specified using the sequence
  /// number of a data record in a shard. A sequence number is the identifier
  /// associated with every record ingested in the stream, and is assigned when
  /// a record is put into the stream. Each stream has one or more shards.
  ///
  /// You must specify the shard iterator type. For example, you can set the
  /// `ShardIteratorType` parameter to read exactly from the position denoted by
  /// a specific sequence number by using the `AT_SEQUENCE_NUMBER` shard
  /// iterator type. Alternatively, the parameter can read right after the
  /// sequence number by using the `AFTER_SEQUENCE_NUMBER` shard iterator type,
  /// using sequence numbers returned by earlier calls to PutRecord, PutRecords,
  /// GetRecords, or DescribeStream. In the request, you can specify the shard
  /// iterator type `AT_TIMESTAMP` to read records from an arbitrary point in
  /// time, `TRIM_HORIZON` to cause `ShardIterator` to point to the last
  /// untrimmed record in the shard in the system (the oldest data record in the
  /// shard), or `LATEST` so that you always read the most recent data in the
  /// shard.
  ///
  /// When you read repeatedly from a stream, use a GetShardIterator request to
  /// get the first shard iterator for use in your first GetRecords request and
  /// for subsequent reads use the shard iterator returned by the GetRecords
  /// request in `NextShardIterator`. A new shard iterator is returned by every
  /// GetRecords request in `NextShardIterator`, which you use in the
  /// `ShardIterator` parameter of the next GetRecords request.
  ///
  /// If a GetShardIterator request is made too often, you receive a
  /// `ProvisionedThroughputExceededException`. For more information about
  /// throughput limits, see GetRecords, and
  /// [Streams Limits](http://docs.aws.amazon.com/kinesis/latest/dev/service-sizes-and-limits.html)
  /// in the _Amazon Kinesis Data Streams Developer Guide_.
  ///
  /// If the shard is closed, GetShardIterator returns a valid iterator for the
  /// last sequence number of the shard. A shard can be closed as a result of
  /// using SplitShard or MergeShards.
  ///
  ///  GetShardIterator has a limit of five transactions per second per account
  /// per open shard.
  ///
  /// [streamName]: The name of the Amazon Kinesis data stream.
  ///
  /// [shardId]: The shard ID of the Kinesis Data Streams shard to get the
  /// iterator for.
  ///
  /// [shardIteratorType]: Determines how the shard iterator is used to start
  /// reading data records from the shard.
  ///
  /// The following are the valid Amazon Kinesis shard iterator types:
  ///
  /// *   AT_SEQUENCE_NUMBER - Start reading from the position denoted by a
  /// specific sequence number, provided in the value `StartingSequenceNumber`.
  ///
  /// *   AFTER_SEQUENCE_NUMBER - Start reading right after the position denoted
  /// by a specific sequence number, provided in the value
  /// `StartingSequenceNumber`.
  ///
  /// *   AT_TIMESTAMP - Start reading from the position denoted by a specific
  /// time stamp, provided in the value `Timestamp`.
  ///
  /// *   TRIM_HORIZON - Start reading at the last untrimmed record in the shard
  /// in the system, which is the oldest data record in the shard.
  ///
  /// *   LATEST - Start reading just after the most recent record in the shard,
  /// so that you always read the most recent data in the shard.
  ///
  /// [startingSequenceNumber]: The sequence number of the data record in the
  /// shard from which to start reading. Used with shard iterator type
  /// AT_SEQUENCE_NUMBER and AFTER_SEQUENCE_NUMBER.
  ///
  /// [timestamp]: The time stamp of the data record from which to start
  /// reading. Used with shard iterator type AT_TIMESTAMP. A time stamp is the
  /// Unix epoch date with precision in milliseconds. For example,
  /// `2016-04-04T19:58:46.480-00:00` or `1459799926.480`. If a record with this
  /// exact time stamp does not exist, the iterator returned is for the next
  /// (later) record. If the time stamp is older than the current trim horizon,
  /// the iterator returned is for the oldest untrimmed data record
  /// (TRIM_HORIZON).
  Future<GetShardIteratorOutput> getShardIterator(
      {@required String streamName,
      @required String shardId,
      @required String shardIteratorType,
      String startingSequenceNumber,
      DateTime timestamp}) async {
    return GetShardIteratorOutput.fromJson({});
  }

  /// Increases the Kinesis data stream's retention period, which is the length
  /// of time data records are accessible after they are added to the stream.
  /// The maximum value of a stream's retention period is 168 hours (7 days).
  ///
  /// If you choose a longer stream retention period, this operation increases
  /// the time period during which records that have not yet expired are
  /// accessible. However, it does not make previous, expired data (older than
  /// the stream's previous retention period) accessible after the operation has
  /// been called. For example, if a stream's retention period is set to 24
  /// hours and is increased to 168 hours, any data that is older than 24 hours
  /// remains inaccessible to consumer applications.
  ///
  /// [streamName]: The name of the stream to modify.
  ///
  /// [retentionPeriodHours]: The new retention period of the stream, in hours.
  /// Must be more than the current retention period.
  Future<void> increaseStreamRetentionPeriod(
      {@required String streamName,
      @required int retentionPeriodHours}) async {}

  /// Lists the shards in a stream and provides information about each shard.
  /// This operation has a limit of 100 transactions per second per data stream.
  ///
  ///
  ///
  /// This API is a new operation that is used by the Amazon Kinesis Client
  /// Library (KCL). If you have a fine-grained IAM policy that only allows
  /// specific operations, you must update your policy to allow calls to this
  /// API. For more information, see
  /// [Controlling Access to Amazon Kinesis Data Streams Resources Using IAM](https://docs.aws.amazon.com/streams/latest/dev/controlling-access.html).
  ///
  /// [streamName]: The name of the data stream whose shards you want to list.
  ///
  /// You cannot specify this parameter if you specify the `NextToken`
  /// parameter.
  ///
  /// [nextToken]: When the number of shards in the data stream is greater than
  /// the default value for the `MaxResults` parameter, or if you explicitly
  /// specify a value for `MaxResults` that is less than the number of shards in
  /// the data stream, the response includes a pagination token named
  /// `NextToken`. You can specify this `NextToken` value in a subsequent call
  /// to `ListShards` to list the next set of shards.
  ///
  /// Don't specify `StreamName` or `StreamCreationTimestamp` if you specify
  /// `NextToken` because the latter unambiguously identifies the stream.
  ///
  /// You can optionally specify a value for the `MaxResults` parameter when you
  /// specify `NextToken`. If you specify a `MaxResults` value that is less than
  /// the number of shards that the operation returns if you don't specify
  /// `MaxResults`, the response will contain a new `NextToken` value. You can
  /// use the new `NextToken` value in a subsequent call to the `ListShards`
  /// operation.
  ///
  ///
  ///
  /// Tokens expire after 300 seconds. When you obtain a value for `NextToken`
  /// in the response to a call to `ListShards`, you have 300 seconds to use
  /// that value. If you specify an expired token in a call to `ListShards`, you
  /// get `ExpiredNextTokenException`.
  ///
  /// [exclusiveStartShardId]: Specify this parameter to indicate that you want
  /// to list the shards starting with the shard whose ID immediately follows
  /// `ExclusiveStartShardId`.
  ///
  /// If you don't specify this parameter, the default behavior is for
  /// `ListShards` to list the shards starting with the first one in the stream.
  ///
  /// You cannot specify this parameter if you specify `NextToken`.
  ///
  /// [maxResults]: The maximum number of shards to return in a single call to
  /// `ListShards`. The minimum value you can specify for this parameter is 1,
  /// and the maximum is 1,000, which is also the default.
  ///
  /// When the number of shards to be listed is greater than the value of
  /// `MaxResults`, the response contains a `NextToken` value that you can use
  /// in a subsequent call to `ListShards` to list the next set of shards.
  ///
  /// [streamCreationTimestamp]: Specify this input parameter to distinguish
  /// data streams that have the same name. For example, if you create a data
  /// stream and then delete it, and you later create another data stream with
  /// the same name, you can use this input parameter to specify which of the
  /// two streams you want to list the shards for.
  ///
  /// You cannot specify this parameter if you specify the `NextToken`
  /// parameter.
  Future<ListShardsOutput> listShards(
      {String streamName,
      String nextToken,
      String exclusiveStartShardId,
      int maxResults,
      DateTime streamCreationTimestamp}) async {
    return ListShardsOutput.fromJson({});
  }

  /// Lists the consumers registered to receive data from a stream using
  /// enhanced fan-out, and provides information about each consumer.
  ///
  /// This operation has a limit of 10 transactions per second per account.
  ///
  /// [streamArn]: The ARN of the Kinesis data stream for which you want to list
  /// the registered consumers. For more information, see
  /// [Amazon Resource Names (ARNs) and AWS Service Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-kinesis-streams).
  ///
  /// [nextToken]: When the number of consumers that are registered with the
  /// data stream is greater than the default value for the `MaxResults`
  /// parameter, or if you explicitly specify a value for `MaxResults` that is
  /// less than the number of consumers that are registered with the data
  /// stream, the response includes a pagination token named `NextToken`. You
  /// can specify this `NextToken` value in a subsequent call to
  /// `ListStreamConsumers` to list the next set of registered consumers.
  ///
  /// Don't specify `StreamName` or `StreamCreationTimestamp` if you specify
  /// `NextToken` because the latter unambiguously identifies the stream.
  ///
  /// You can optionally specify a value for the `MaxResults` parameter when you
  /// specify `NextToken`. If you specify a `MaxResults` value that is less than
  /// the number of consumers that the operation returns if you don't specify
  /// `MaxResults`, the response will contain a new `NextToken` value. You can
  /// use the new `NextToken` value in a subsequent call to the
  /// `ListStreamConsumers` operation to list the next set of consumers.
  ///
  ///
  ///
  /// Tokens expire after 300 seconds. When you obtain a value for `NextToken`
  /// in the response to a call to `ListStreamConsumers`, you have 300 seconds
  /// to use that value. If you specify an expired token in a call to
  /// `ListStreamConsumers`, you get `ExpiredNextTokenException`.
  ///
  /// [maxResults]: The maximum number of consumers that you want a single call
  /// of `ListStreamConsumers` to return.
  ///
  /// [streamCreationTimestamp]: Specify this input parameter to distinguish
  /// data streams that have the same name. For example, if you create a data
  /// stream and then delete it, and you later create another data stream with
  /// the same name, you can use this input parameter to specify which of the
  /// two streams you want to list the consumers for.
  ///
  /// You can't specify this parameter if you specify the NextToken parameter.
  Future<ListStreamConsumersOutput> listStreamConsumers(String streamArn,
      {String nextToken,
      int maxResults,
      DateTime streamCreationTimestamp}) async {
    return ListStreamConsumersOutput.fromJson({});
  }

  /// Lists your Kinesis data streams.
  ///
  /// The number of streams may be too large to return from a single call to
  /// `ListStreams`. You can limit the number of returned streams using the
  /// `Limit` parameter. If you do not specify a value for the `Limit`
  /// parameter, Kinesis Data Streams uses the default limit, which is currently
  /// 10.
  ///
  /// You can detect if there are more streams available to list by using the
  /// `HasMoreStreams` flag from the returned output. If there are more streams
  /// available, you can request more streams by using the name of the last
  /// stream returned by the `ListStreams` request in the
  /// `ExclusiveStartStreamName` parameter in a subsequent request to
  /// `ListStreams`. The group of stream names returned by the subsequent
  /// request is then added to the list. You can continue this process until all
  /// the stream names have been collected in the list.
  ///
  ///  ListStreams has a limit of five transactions per second per account.
  ///
  /// [limit]: The maximum number of streams to list.
  ///
  /// [exclusiveStartStreamName]: The name of the stream to start the list with.
  Future<ListStreamsOutput> listStreams(
      {int limit, String exclusiveStartStreamName}) async {
    return ListStreamsOutput.fromJson({});
  }

  /// Lists the tags for the specified Kinesis data stream. This operation has a
  /// limit of five transactions per second per account.
  ///
  /// [streamName]: The name of the stream.
  ///
  /// [exclusiveStartTagKey]: The key to use as the starting point for the list
  /// of tags. If this parameter is set, `ListTagsForStream` gets all tags that
  /// occur after `ExclusiveStartTagKey`.
  ///
  /// [limit]: The number of tags to return. If this number is less than the
  /// total number of tags associated with the stream, `HasMoreTags` is set to
  /// `true`. To list additional tags, set `ExclusiveStartTagKey` to the last
  /// key in the response.
  Future<ListTagsForStreamOutput> listTagsForStream(String streamName,
      {String exclusiveStartTagKey, int limit}) async {
    return ListTagsForStreamOutput.fromJson({});
  }

  /// Merges two adjacent shards in a Kinesis data stream and combines them into
  /// a single shard to reduce the stream's capacity to ingest and transport
  /// data. Two shards are considered adjacent if the union of the hash key
  /// ranges for the two shards form a contiguous set with no gaps. For example,
  /// if you have two shards, one with a hash key range of 276...381 and the
  /// other with a hash key range of 382...454, then you could merge these two
  /// shards into a single shard that would have a hash key range of 276...454.
  /// After the merge, the single child shard receives data for all hash key
  /// values covered by the two parent shards.
  ///
  ///  `MergeShards` is called when there is a need to reduce the overall
  /// capacity of a stream because of excess capacity that is not being used.
  /// You must specify the shard to be merged and the adjacent shard for a
  /// stream. For more information about merging shards, see
  /// [Merge Two Shards](http://docs.aws.amazon.com/kinesis/latest/dev/kinesis-using-sdk-java-resharding-merge.html)
  /// in the _Amazon Kinesis Data Streams Developer Guide_.
  ///
  /// If the stream is in the `ACTIVE` state, you can call `MergeShards`. If a
  /// stream is in the `CREATING`, `UPDATING`, or `DELETING` state,
  /// `MergeShards` returns a `ResourceInUseException`. If the specified stream
  /// does not exist, `MergeShards` returns a `ResourceNotFoundException`.
  ///
  /// You can use DescribeStream to check the state of the stream, which is
  /// returned in `StreamStatus`.
  ///
  ///  `MergeShards` is an asynchronous operation. Upon receiving a
  /// `MergeShards` request, Amazon Kinesis Data Streams immediately returns a
  /// response and sets the `StreamStatus` to `UPDATING`. After the operation is
  /// completed, Kinesis Data Streams sets the `StreamStatus` to `ACTIVE`. Read
  /// and write operations continue to work while the stream is in the
  /// `UPDATING` state.
  ///
  /// You use DescribeStream to determine the shard IDs that are specified in
  /// the `MergeShards` request.
  ///
  /// If you try to operate on too many streams in parallel using CreateStream,
  /// DeleteStream, `MergeShards`, or SplitShard, you receive a
  /// `LimitExceededException`.
  ///
  ///  `MergeShards` has a limit of five transactions per second per account.
  ///
  /// [streamName]: The name of the stream for the merge.
  ///
  /// [shardToMerge]: The shard ID of the shard to combine with the adjacent
  /// shard for the merge.
  ///
  /// [adjacentShardToMerge]: The shard ID of the adjacent shard for the merge.
  Future<void> mergeShards(
      {@required String streamName,
      @required String shardToMerge,
      @required String adjacentShardToMerge}) async {}

  /// Writes a single data record into an Amazon Kinesis data stream. Call
  /// `PutRecord` to send data into the stream for real-time ingestion and
  /// subsequent processing, one record at a time. Each shard can support writes
  /// up to 1,000 records per second, up to a maximum data write total of 1 MB
  /// per second.
  ///
  /// You must specify the name of the stream that captures, stores, and
  /// transports the data; a partition key; and the data blob itself.
  ///
  /// The data blob can be any type of data; for example, a segment from a log
  /// file, geographic/location data, website clickstream data, and so on.
  ///
  /// The partition key is used by Kinesis Data Streams to distribute data
  /// across shards. Kinesis Data Streams segregates the data records that
  /// belong to a stream into multiple shards, using the partition key
  /// associated with each data record to determine the shard to which a given
  /// data record belongs.
  ///
  /// Partition keys are Unicode strings, with a maximum length limit of 256
  /// characters for each key. An MD5 hash function is used to map partition
  /// keys to 128-bit integer values and to map associated data records to
  /// shards using the hash key ranges of the shards. You can override hashing
  /// the partition key to determine the shard by explicitly specifying a hash
  /// value using the `ExplicitHashKey` parameter. For more information, see
  /// [Adding Data to a Stream](http://docs.aws.amazon.com/kinesis/latest/dev/developing-producers-with-sdk.html#kinesis-using-sdk-java-add-data-to-stream)
  /// in the _Amazon Kinesis Data Streams Developer Guide_.
  ///
  ///  `PutRecord` returns the shard ID of where the data record was placed and
  /// the sequence number that was assigned to the data record.
  ///
  /// Sequence numbers increase over time and are specific to a shard within a
  /// stream, not across all shards within a stream. To guarantee strictly
  /// increasing ordering, write serially to a shard and use the
  /// `SequenceNumberForOrdering` parameter. For more information, see
  /// [Adding Data to a Stream](http://docs.aws.amazon.com/kinesis/latest/dev/developing-producers-with-sdk.html#kinesis-using-sdk-java-add-data-to-stream)
  /// in the _Amazon Kinesis Data Streams Developer Guide_.
  ///
  /// If a `PutRecord` request cannot be processed because of insufficient
  /// provisioned throughput on the shard involved in the request, `PutRecord`
  /// throws `ProvisionedThroughputExceededException`.
  ///
  /// By default, data records are accessible for 24 hours from the time that
  /// they are added to a stream. You can use IncreaseStreamRetentionPeriod or
  /// DecreaseStreamRetentionPeriod to modify this retention period.
  ///
  /// [streamName]: The name of the stream to put the data record into.
  ///
  /// [data]: The data blob to put into the record, which is base64-encoded when
  /// the blob is serialized. When the data blob (the payload before
  /// base64-encoding) is added to the partition key size, the total size must
  /// not exceed the maximum record size (1 MB).
  ///
  /// [partitionKey]: Determines which shard in the stream the data record is
  /// assigned to. Partition keys are Unicode strings with a maximum length
  /// limit of 256 characters for each key. Amazon Kinesis Data Streams uses the
  /// partition key as input to a hash function that maps the partition key and
  /// associated data to a specific shard. Specifically, an MD5 hash function is
  /// used to map partition keys to 128-bit integer values and to map associated
  /// data records to shards. As a result of this hashing mechanism, all data
  /// records with the same partition key map to the same shard within the
  /// stream.
  ///
  /// [explicitHashKey]: The hash value used to explicitly determine the shard
  /// the data record is assigned to by overriding the partition key hash.
  ///
  /// [sequenceNumberForOrdering]: Guarantees strictly increasing sequence
  /// numbers, for puts from the same client and to the same partition key.
  /// Usage: set the `SequenceNumberForOrdering` of record _n_ to the sequence
  /// number of record _n-1_ (as returned in the result when putting record
  /// _n-1_). If this parameter is not set, records are coarsely ordered based
  /// on arrival time.
  Future<PutRecordOutput> putRecord(
      {@required String streamName,
      @required Uint8List data,
      @required String partitionKey,
      String explicitHashKey,
      String sequenceNumberForOrdering}) async {
    return PutRecordOutput.fromJson({});
  }

  /// Writes multiple data records into a Kinesis data stream in a single call
  /// (also referred to as a `PutRecords` request). Use this operation to send
  /// data into the stream for data ingestion and processing.
  ///
  /// Each `PutRecords` request can support up to 500 records. Each record in
  /// the request can be as large as 1 MB, up to a limit of 5 MB for the entire
  /// request, including partition keys. Each shard can support writes up to
  /// 1,000 records per second, up to a maximum data write total of 1 MB per
  /// second.
  ///
  /// You must specify the name of the stream that captures, stores, and
  /// transports the data; and an array of request `Records`, with each record
  /// in the array requiring a partition key and data blob. The record size
  /// limit applies to the total size of the partition key and data blob.
  ///
  /// The data blob can be any type of data; for example, a segment from a log
  /// file, geographic/location data, website clickstream data, and so on.
  ///
  /// The partition key is used by Kinesis Data Streams as input to a hash
  /// function that maps the partition key and associated data to a specific
  /// shard. An MD5 hash function is used to map partition keys to 128-bit
  /// integer values and to map associated data records to shards. As a result
  /// of this hashing mechanism, all data records with the same partition key
  /// map to the same shard within the stream. For more information, see
  /// [Adding Data to a Stream](http://docs.aws.amazon.com/kinesis/latest/dev/developing-producers-with-sdk.html#kinesis-using-sdk-java-add-data-to-stream)
  /// in the _Amazon Kinesis Data Streams Developer Guide_.
  ///
  /// Each record in the `Records` array may include an optional parameter,
  /// `ExplicitHashKey`, which overrides the partition key to shard mapping.
  /// This parameter allows a data producer to determine explicitly the shard
  /// where the record is stored. For more information, see
  /// [Adding Multiple Records with PutRecords](http://docs.aws.amazon.com/kinesis/latest/dev/developing-producers-with-sdk.html#kinesis-using-sdk-java-putrecords)
  /// in the _Amazon Kinesis Data Streams Developer Guide_.
  ///
  /// The `PutRecords` response includes an array of response `Records`. Each
  /// record in the response array directly correlates with a record in the
  /// request array using natural ordering, from the top to the bottom of the
  /// request and response. The response `Records` array always includes the
  /// same number of records as the request array.
  ///
  /// The response `Records` array includes both successfully and unsuccessfully
  /// processed records. Kinesis Data Streams attempts to process all records in
  /// each `PutRecords` request. A single record failure does not stop the
  /// processing of subsequent records.
  ///
  /// A successfully processed record includes `ShardId` and `SequenceNumber`
  /// values. The `ShardId` parameter identifies the shard in the stream where
  /// the record is stored. The `SequenceNumber` parameter is an identifier
  /// assigned to the put record, unique to all records in the stream.
  ///
  /// An unsuccessfully processed record includes `ErrorCode` and `ErrorMessage`
  /// values. `ErrorCode` reflects the type of error and can be one of the
  /// following values: `ProvisionedThroughputExceededException` or
  /// `InternalFailure`. `ErrorMessage` provides more detailed information about
  /// the `ProvisionedThroughputExceededException` exception including the
  /// account ID, stream name, and shard ID of the record that was throttled.
  /// For more information about partially successful responses, see
  /// [Adding Multiple Records with PutRecords](http://docs.aws.amazon.com/kinesis/latest/dev/kinesis-using-sdk-java-add-data-to-stream.html#kinesis-using-sdk-java-putrecords)
  /// in the _Amazon Kinesis Data Streams Developer Guide_.
  ///
  /// By default, data records are accessible for 24 hours from the time that
  /// they are added to a stream. You can use IncreaseStreamRetentionPeriod or
  /// DecreaseStreamRetentionPeriod to modify this retention period.
  ///
  /// [records]: The records associated with the request.
  ///
  /// [streamName]: The stream name associated with the request.
  Future<PutRecordsOutput> putRecords(
      {@required List<PutRecordsRequestEntry> records,
      @required String streamName}) async {
    return PutRecordsOutput.fromJson({});
  }

  /// Registers a consumer with a Kinesis data stream. When you use this
  /// operation, the consumer you register can read data from the stream at a
  /// rate of up to 2 MiB per second. This rate is unaffected by the total
  /// number of consumers that read from the same stream.
  ///
  /// You can register up to 5 consumers per stream. A given consumer can only
  /// be registered with one stream.
  ///
  /// This operation has a limit of five transactions per second per account.
  ///
  /// [streamArn]: The ARN of the Kinesis data stream that you want to register
  /// the consumer with. For more info, see
  /// [Amazon Resource Names (ARNs) and AWS Service Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-kinesis-streams).
  ///
  /// [consumerName]: For a given Kinesis data stream, each consumer must have a
  /// unique name. However, consumer names don't have to be unique across data
  /// streams.
  Future<RegisterStreamConsumerOutput> registerStreamConsumer(
      {@required String streamArn, @required String consumerName}) async {
    return RegisterStreamConsumerOutput.fromJson({});
  }

  /// Removes tags from the specified Kinesis data stream. Removed tags are
  /// deleted and cannot be recovered after this operation successfully
  /// completes.
  ///
  /// If you specify a tag that does not exist, it is ignored.
  ///
  ///  RemoveTagsFromStream has a limit of five transactions per second per
  /// account.
  ///
  /// [streamName]: The name of the stream.
  ///
  /// [tagKeys]: A list of tag keys. Each corresponding tag is removed from the
  /// stream.
  Future<void> removeTagsFromStream(
      {@required String streamName, @required List<String> tagKeys}) async {}

  /// Splits a shard into two new shards in the Kinesis data stream, to increase
  /// the stream's capacity to ingest and transport data. `SplitShard` is called
  /// when there is a need to increase the overall capacity of a stream because
  /// of an expected increase in the volume of data records being ingested.
  ///
  /// You can also use `SplitShard` when a shard appears to be approaching its
  /// maximum utilization; for example, the producers sending data into the
  /// specific shard are suddenly sending more than previously anticipated. You
  /// can also call `SplitShard` to increase stream capacity, so that more
  /// Kinesis Data Streams applications can simultaneously read data from the
  /// stream for real-time processing.
  ///
  /// You must specify the shard to be split and the new hash key, which is the
  /// position in the shard where the shard gets split in two. In many cases,
  /// the new hash key might be the average of the beginning and ending hash
  /// key, but it can be any hash key value in the range being mapped into the
  /// shard. For more information, see
  /// [Split a Shard](http://docs.aws.amazon.com/kinesis/latest/dev/kinesis-using-sdk-java-resharding-split.html)
  /// in the _Amazon Kinesis Data Streams Developer Guide_.
  ///
  /// You can use DescribeStream to determine the shard ID and hash key values
  /// for the `ShardToSplit` and `NewStartingHashKey` parameters that are
  /// specified in the `SplitShard` request.
  ///
  ///  `SplitShard` is an asynchronous operation. Upon receiving a `SplitShard`
  /// request, Kinesis Data Streams immediately returns a response and sets the
  /// stream status to `UPDATING`. After the operation is completed, Kinesis
  /// Data Streams sets the stream status to `ACTIVE`. Read and write operations
  /// continue to work while the stream is in the `UPDATING` state.
  ///
  /// You can use `DescribeStream` to check the status of the stream, which is
  /// returned in `StreamStatus`. If the stream is in the `ACTIVE` state, you
  /// can call `SplitShard`. If a stream is in `CREATING` or `UPDATING` or
  /// `DELETING` states, `DescribeStream` returns a `ResourceInUseException`.
  ///
  /// If the specified stream does not exist, `DescribeStream` returns a
  /// `ResourceNotFoundException`. If you try to create more shards than are
  /// authorized for your account, you receive a `LimitExceededException`.
  ///
  /// For the default shard limit for an AWS account, see
  /// [Kinesis Data Streams Limits](http://docs.aws.amazon.com/kinesis/latest/dev/service-sizes-and-limits.html)
  /// in the _Amazon Kinesis Data Streams Developer Guide_. To increase this
  /// limit,
  /// [contact AWS Support](http://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html).
  ///
  /// If you try to operate on too many streams simultaneously using
  /// CreateStream, DeleteStream, MergeShards, and/or SplitShard, you receive a
  /// `LimitExceededException`.
  ///
  ///  `SplitShard` has a limit of five transactions per second per account.
  ///
  /// [streamName]: The name of the stream for the shard split.
  ///
  /// [shardToSplit]: The shard ID of the shard to split.
  ///
  /// [newStartingHashKey]: A hash key value for the starting hash key of one of
  /// the child shards created by the split. The hash key range for a given
  /// shard constitutes a set of ordered contiguous positive integers. The value
  /// for `NewStartingHashKey` must be in the range of hash keys being mapped
  /// into the shard. The `NewStartingHashKey` hash key value and all higher
  /// hash key values in hash key range are distributed to one of the child
  /// shards. All the lower hash key values in the range are distributed to the
  /// other child shard.
  Future<void> splitShard(
      {@required String streamName,
      @required String shardToSplit,
      @required String newStartingHashKey}) async {}

  /// Enables or updates server-side encryption using an AWS KMS key for a
  /// specified stream.
  ///
  /// Starting encryption is an asynchronous operation. Upon receiving the
  /// request, Kinesis Data Streams returns immediately and sets the status of
  /// the stream to `UPDATING`. After the update is complete, Kinesis Data
  /// Streams sets the status of the stream back to `ACTIVE`. Updating or
  /// applying encryption normally takes a few seconds to complete, but it can
  /// take minutes. You can continue to read and write data to your stream while
  /// its status is `UPDATING`. Once the status of the stream is `ACTIVE`,
  /// encryption begins for records written to the stream.
  ///
  /// API Limits: You can successfully apply a new AWS KMS key for server-side
  /// encryption 25 times in a rolling 24-hour period.
  ///
  /// Note: It can take up to 5 seconds after the stream is in an `ACTIVE`
  /// status before all records written to the stream are encrypted. After you
  /// enable encryption, you can verify that encryption is applied by inspecting
  /// the API response from `PutRecord` or `PutRecords`.
  ///
  /// [streamName]: The name of the stream for which to start encrypting
  /// records.
  ///
  /// [encryptionType]: The encryption type to use. The only valid value is
  /// `KMS`.
  ///
  /// [keyId]: The GUID for the customer-managed AWS KMS key to use for
  /// encryption. This value can be a globally unique identifier, a fully
  /// specified Amazon Resource Name (ARN) to either an alias or a key, or an
  /// alias name prefixed by "alias/".You can also use a master key owned by
  /// Kinesis Data Streams by specifying the alias `aws/kinesis`.
  ///
  /// *   Key ARN example:
  /// `arn:aws:kms:us-east-1:123456789012:key/12345678-1234-1234-1234-123456789012`
  ///
  /// *   Alias ARN example:
  /// `arn:aws:kms:us-east-1:123456789012:alias/MyAliasName`
  ///
  /// *   Globally unique key ID example: `12345678-1234-1234-1234-123456789012`
  ///
  /// *   Alias name example: `alias/MyAliasName`
  ///
  /// *   Master key owned by Kinesis Data Streams: `alias/aws/kinesis`
  Future<void> startStreamEncryption(
      {@required String streamName,
      @required String encryptionType,
      @required String keyId}) async {}

  /// Disables server-side encryption for a specified stream.
  ///
  /// Stopping encryption is an asynchronous operation. Upon receiving the
  /// request, Kinesis Data Streams returns immediately and sets the status of
  /// the stream to `UPDATING`. After the update is complete, Kinesis Data
  /// Streams sets the status of the stream back to `ACTIVE`. Stopping
  /// encryption normally takes a few seconds to complete, but it can take
  /// minutes. You can continue to read and write data to your stream while its
  /// status is `UPDATING`. Once the status of the stream is `ACTIVE`, records
  /// written to the stream are no longer encrypted by Kinesis Data Streams.
  ///
  /// API Limits: You can successfully disable server-side encryption 25 times
  /// in a rolling 24-hour period.
  ///
  /// Note: It can take up to 5 seconds after the stream is in an `ACTIVE`
  /// status before all records written to the stream are no longer subject to
  /// encryption. After you disabled encryption, you can verify that encryption
  /// is not applied by inspecting the API response from `PutRecord` or
  /// `PutRecords`.
  ///
  /// [streamName]: The name of the stream on which to stop encrypting records.
  ///
  /// [encryptionType]: The encryption type. The only valid value is `KMS`.
  ///
  /// [keyId]: The GUID for the customer-managed AWS KMS key to use for
  /// encryption. This value can be a globally unique identifier, a fully
  /// specified Amazon Resource Name (ARN) to either an alias or a key, or an
  /// alias name prefixed by "alias/".You can also use a master key owned by
  /// Kinesis Data Streams by specifying the alias `aws/kinesis`.
  ///
  /// *   Key ARN example:
  /// `arn:aws:kms:us-east-1:123456789012:key/12345678-1234-1234-1234-123456789012`
  ///
  /// *   Alias ARN example:
  /// `arn:aws:kms:us-east-1:123456789012:alias/MyAliasName`
  ///
  /// *   Globally unique key ID example: `12345678-1234-1234-1234-123456789012`
  ///
  /// *   Alias name example: `alias/MyAliasName`
  ///
  /// *   Master key owned by Kinesis Data Streams: `alias/aws/kinesis`
  Future<void> stopStreamEncryption(
      {@required String streamName,
      @required String encryptionType,
      @required String keyId}) async {}

  /// Updates the shard count of the specified stream to the specified number of
  /// shards.
  ///
  /// Updating the shard count is an asynchronous operation. Upon receiving the
  /// request, Kinesis Data Streams returns immediately and sets the status of
  /// the stream to `UPDATING`. After the update is complete, Kinesis Data
  /// Streams sets the status of the stream back to `ACTIVE`. Depending on the
  /// size of the stream, the scaling action could take a few minutes to
  /// complete. You can continue to read and write data to your stream while its
  /// status is `UPDATING`.
  ///
  /// To update the shard count, Kinesis Data Streams performs splits or merges
  /// on individual shards. This can cause short-lived shards to be created, in
  /// addition to the final shards. We recommend that you double or halve the
  /// shard count, as this results in the fewest number of splits or merges.
  ///
  /// This operation has the following default limits. By default, you cannot do
  /// the following:
  ///
  /// *   Scale more than twice per rolling 24-hour period per stream
  ///
  /// *   Scale up to more than double your current shard count for a stream
  ///
  /// *   Scale down below half your current shard count for a stream
  ///
  /// *   Scale up to more than 500 shards in a stream
  ///
  /// *   Scale a stream with more than 500 shards down unless the result is
  /// less than 500 shards
  ///
  /// *   Scale up to more than the shard limit for your account
  ///
  ///
  /// For the default limits for an AWS account, see
  /// [Streams Limits](http://docs.aws.amazon.com/kinesis/latest/dev/service-sizes-and-limits.html)
  /// in the _Amazon Kinesis Data Streams Developer Guide_. To request an
  /// increase in the call rate limit, the shard limit for this API, or your
  /// overall shard limit, use the
  /// [limits form](https://console.aws.amazon.com/support/v1#/case/create?issueType=service-limit-increase&limitType=service-code-kinesis).
  ///
  /// [streamName]: The name of the stream.
  ///
  /// [targetShardCount]: The new number of shards.
  ///
  /// [scalingType]: The scaling type. Uniform scaling creates shards of equal
  /// size.
  Future<UpdateShardCountOutput> updateShardCount(
      {@required String streamName,
      @required int targetShardCount,
      @required String scalingType}) async {
    return UpdateShardCountOutput.fromJson({});
  }
}

/// An object that represents the details of the consumer you registered.
class Consumer {
  /// The name of the consumer is something you choose when you register the
  /// consumer.
  final String consumerName;

  /// When you register a consumer, Kinesis Data Streams generates an ARN for
  /// it. You need this ARN to be able to call SubscribeToShard.
  ///
  /// If you delete a consumer and then create a new one with the same name, it
  /// won't have the same ARN. That's because consumer ARNs contain the creation
  /// timestamp. This is important to keep in mind if you have IAM policies that
  /// reference consumer ARNs.
  final String consumerArn;

  /// A consumer can't read data while in the `CREATING` or `DELETING` states.
  final String consumerStatus;

  final DateTime consumerCreationTimestamp;

  Consumer({
    @required this.consumerName,
    @required this.consumerArn,
    @required this.consumerStatus,
    @required this.consumerCreationTimestamp,
  });
  static Consumer fromJson(Map<String, dynamic> json) => Consumer();
}

/// An object that represents the details of a registered consumer.
class ConsumerDescription {
  /// The name of the consumer is something you choose when you register the
  /// consumer.
  final String consumerName;

  /// When you register a consumer, Kinesis Data Streams generates an ARN for
  /// it. You need this ARN to be able to call SubscribeToShard.
  ///
  /// If you delete a consumer and then create a new one with the same name, it
  /// won't have the same ARN. That's because consumer ARNs contain the creation
  /// timestamp. This is important to keep in mind if you have IAM policies that
  /// reference consumer ARNs.
  final String consumerArn;

  /// A consumer can't read data while in the `CREATING` or `DELETING` states.
  final String consumerStatus;

  final DateTime consumerCreationTimestamp;

  /// The ARN of the stream with which you registered the consumer.
  final String streamArn;

  ConsumerDescription({
    @required this.consumerName,
    @required this.consumerArn,
    @required this.consumerStatus,
    @required this.consumerCreationTimestamp,
    @required this.streamArn,
  });
  static ConsumerDescription fromJson(Map<String, dynamic> json) =>
      ConsumerDescription();
}

class DescribeLimitsOutput {
  /// The maximum number of shards.
  final int shardLimit;

  /// The number of open shards.
  final int openShardCount;

  DescribeLimitsOutput({
    @required this.shardLimit,
    @required this.openShardCount,
  });
  static DescribeLimitsOutput fromJson(Map<String, dynamic> json) =>
      DescribeLimitsOutput();
}

class DescribeStreamConsumerOutput {
  /// An object that represents the details of the consumer.
  final ConsumerDescription consumerDescription;

  DescribeStreamConsumerOutput({
    @required this.consumerDescription,
  });
  static DescribeStreamConsumerOutput fromJson(Map<String, dynamic> json) =>
      DescribeStreamConsumerOutput();
}

/// Represents the output for `DescribeStream`.
class DescribeStreamOutput {
  /// The current status of the stream, the stream Amazon Resource Name (ARN),
  /// an array of shard objects that comprise the stream, and whether there are
  /// more shards available.
  final StreamDescription streamDescription;

  DescribeStreamOutput({
    @required this.streamDescription,
  });
  static DescribeStreamOutput fromJson(Map<String, dynamic> json) =>
      DescribeStreamOutput();
}

class DescribeStreamSummaryOutput {
  /// A StreamDescriptionSummary containing information about the stream.
  final StreamDescriptionSummary streamDescriptionSummary;

  DescribeStreamSummaryOutput({
    @required this.streamDescriptionSummary,
  });
  static DescribeStreamSummaryOutput fromJson(Map<String, dynamic> json) =>
      DescribeStreamSummaryOutput();
}

/// Represents enhanced metrics types.
class EnhancedMetrics {
  /// List of shard-level metrics.
  ///
  /// The following are the valid shard-level metrics. The value "`ALL`"
  /// enhances every metric.
  ///
  /// *    `IncomingBytes`
  ///
  /// *    `IncomingRecords`
  ///
  /// *    `OutgoingBytes`
  ///
  /// *    `OutgoingRecords`
  ///
  /// *    `WriteProvisionedThroughputExceeded`
  ///
  /// *    `ReadProvisionedThroughputExceeded`
  ///
  /// *    `IteratorAgeMilliseconds`
  ///
  /// *    `ALL`
  ///
  ///
  /// For more information, see
  /// [Monitoring the Amazon Kinesis Data Streams Service with Amazon CloudWatch](http://docs.aws.amazon.com/kinesis/latest/dev/monitoring-with-cloudwatch.html)
  /// in the _Amazon Kinesis Data Streams Developer Guide_.
  final List<String> shardLevelMetrics;

  EnhancedMetrics({
    this.shardLevelMetrics,
  });
  static EnhancedMetrics fromJson(Map<String, dynamic> json) =>
      EnhancedMetrics();
}

/// Represents the output for EnableEnhancedMonitoring and
/// DisableEnhancedMonitoring.
class EnhancedMonitoringOutput {
  /// The name of the Kinesis data stream.
  final String streamName;

  /// Represents the current state of the metrics that are in the enhanced state
  /// before the operation.
  final List<String> currentShardLevelMetrics;

  /// Represents the list of all the metrics that would be in the enhanced state
  /// after the operation.
  final List<String> desiredShardLevelMetrics;

  EnhancedMonitoringOutput({
    this.streamName,
    this.currentShardLevelMetrics,
    this.desiredShardLevelMetrics,
  });
  static EnhancedMonitoringOutput fromJson(Map<String, dynamic> json) =>
      EnhancedMonitoringOutput();
}

/// Represents the output for GetRecords.
class GetRecordsOutput {
  /// The data records retrieved from the shard.
  final List<Record> records;

  /// The next position in the shard from which to start sequentially reading
  /// data records. If set to `null`, the shard has been closed and the
  /// requested iterator does not return any more data.
  final String nextShardIterator;

  /// The number of milliseconds the GetRecords response is from the tip of the
  /// stream, indicating how far behind current time the consumer is. A value of
  /// zero indicates that record processing is caught up, and there are no new
  /// records to process at this moment.
  final BigInt millisBehindLatest;

  GetRecordsOutput({
    @required this.records,
    this.nextShardIterator,
    this.millisBehindLatest,
  });
  static GetRecordsOutput fromJson(Map<String, dynamic> json) =>
      GetRecordsOutput();
}

/// Represents the output for `GetShardIterator`.
class GetShardIteratorOutput {
  /// The position in the shard from which to start reading data records
  /// sequentially. A shard iterator specifies this position using the sequence
  /// number of a data record in a shard.
  final String shardIterator;

  GetShardIteratorOutput({
    this.shardIterator,
  });
  static GetShardIteratorOutput fromJson(Map<String, dynamic> json) =>
      GetShardIteratorOutput();
}

/// The range of possible hash key values for the shard, which is a set of
/// ordered contiguous positive integers.
class HashKeyRange {
  /// The starting hash key of the hash key range.
  final String startingHashKey;

  /// The ending hash key of the hash key range.
  final String endingHashKey;

  HashKeyRange({
    @required this.startingHashKey,
    @required this.endingHashKey,
  });
  static HashKeyRange fromJson(Map<String, dynamic> json) => HashKeyRange();
}

class ListShardsOutput {
  /// An array of JSON objects. Each object represents one shard and specifies
  /// the IDs of the shard, the shard's parent, and the shard that's adjacent to
  /// the shard's parent. Each object also contains the starting and ending hash
  /// keys and the starting and ending sequence numbers for the shard.
  final List<Shard> shards;

  /// When the number of shards in the data stream is greater than the default
  /// value for the `MaxResults` parameter, or if you explicitly specify a value
  /// for `MaxResults` that is less than the number of shards in the data
  /// stream, the response includes a pagination token named `NextToken`. You
  /// can specify this `NextToken` value in a subsequent call to `ListShards` to
  /// list the next set of shards. For more information about the use of this
  /// pagination token when calling the `ListShards` operation, see
  /// ListShardsInput$NextToken.
  ///
  ///
  ///
  /// Tokens expire after 300 seconds. When you obtain a value for `NextToken`
  /// in the response to a call to `ListShards`, you have 300 seconds to use
  /// that value. If you specify an expired token in a call to `ListShards`, you
  /// get `ExpiredNextTokenException`.
  final String nextToken;

  ListShardsOutput({
    this.shards,
    this.nextToken,
  });
  static ListShardsOutput fromJson(Map<String, dynamic> json) =>
      ListShardsOutput();
}

class ListStreamConsumersOutput {
  /// An array of JSON objects. Each object represents one registered consumer.
  final List<Consumer> consumers;

  /// When the number of consumers that are registered with the data stream is
  /// greater than the default value for the `MaxResults` parameter, or if you
  /// explicitly specify a value for `MaxResults` that is less than the number
  /// of registered consumers, the response includes a pagination token named
  /// `NextToken`. You can specify this `NextToken` value in a subsequent call
  /// to `ListStreamConsumers` to list the next set of registered consumers. For
  /// more information about the use of this pagination token when calling the
  /// `ListStreamConsumers` operation, see ListStreamConsumersInput$NextToken.
  ///
  ///
  ///
  /// Tokens expire after 300 seconds. When you obtain a value for `NextToken`
  /// in the response to a call to `ListStreamConsumers`, you have 300 seconds
  /// to use that value. If you specify an expired token in a call to
  /// `ListStreamConsumers`, you get `ExpiredNextTokenException`.
  final String nextToken;

  ListStreamConsumersOutput({
    this.consumers,
    this.nextToken,
  });
  static ListStreamConsumersOutput fromJson(Map<String, dynamic> json) =>
      ListStreamConsumersOutput();
}

/// Represents the output for `ListStreams`.
class ListStreamsOutput {
  /// The names of the streams that are associated with the AWS account making
  /// the `ListStreams` request.
  final List<String> streamNames;

  /// If set to `true`, there are more streams available to list.
  final bool hasMoreStreams;

  ListStreamsOutput({
    @required this.streamNames,
    @required this.hasMoreStreams,
  });
  static ListStreamsOutput fromJson(Map<String, dynamic> json) =>
      ListStreamsOutput();
}

/// Represents the output for `ListTagsForStream`.
class ListTagsForStreamOutput {
  /// A list of tags associated with `StreamName`, starting with the first tag
  /// after `ExclusiveStartTagKey` and up to the specified `Limit`.
  final List<Tag> tags;

  /// If set to `true`, more tags are available. To request additional tags, set
  /// `ExclusiveStartTagKey` to the key of the last tag returned.
  final bool hasMoreTags;

  ListTagsForStreamOutput({
    @required this.tags,
    @required this.hasMoreTags,
  });
  static ListTagsForStreamOutput fromJson(Map<String, dynamic> json) =>
      ListTagsForStreamOutput();
}

/// Represents the output for `PutRecord`.
class PutRecordOutput {
  /// The shard ID of the shard where the data record was placed.
  final String shardId;

  /// The sequence number identifier that was assigned to the put data record.
  /// The sequence number for the record is unique across all records in the
  /// stream. A sequence number is the identifier associated with every record
  /// put into the stream.
  final String sequenceNumber;

  /// The encryption type to use on the record. This parameter can be one of the
  /// following values:
  ///
  /// *    `NONE`: Do not encrypt the records in the stream.
  ///
  /// *    `KMS`: Use server-side encryption on the records in the stream using
  /// a customer-managed AWS KMS key.
  final String encryptionType;

  PutRecordOutput({
    @required this.shardId,
    @required this.sequenceNumber,
    this.encryptionType,
  });
  static PutRecordOutput fromJson(Map<String, dynamic> json) =>
      PutRecordOutput();
}

///  `PutRecords` results.
class PutRecordsOutput {
  /// The number of unsuccessfully processed records in a `PutRecords` request.
  final int failedRecordCount;

  /// An array of successfully and unsuccessfully processed record results,
  /// correlated with the request by natural ordering. A record that is
  /// successfully added to a stream includes `SequenceNumber` and `ShardId` in
  /// the result. A record that fails to be added to a stream includes
  /// `ErrorCode` and `ErrorMessage` in the result.
  final List<PutRecordsResultEntry> records;

  /// The encryption type used on the records. This parameter can be one of the
  /// following values:
  ///
  /// *    `NONE`: Do not encrypt the records.
  ///
  /// *    `KMS`: Use server-side encryption on the records using a
  /// customer-managed AWS KMS key.
  final String encryptionType;

  PutRecordsOutput({
    this.failedRecordCount,
    @required this.records,
    this.encryptionType,
  });
  static PutRecordsOutput fromJson(Map<String, dynamic> json) =>
      PutRecordsOutput();
}

/// Represents the output for `PutRecords`.
class PutRecordsRequestEntry {
  /// The data blob to put into the record, which is base64-encoded when the
  /// blob is serialized. When the data blob (the payload before
  /// base64-encoding) is added to the partition key size, the total size must
  /// not exceed the maximum record size (1 MB).
  final Uint8List data;

  /// The hash value used to determine explicitly the shard that the data record
  /// is assigned to by overriding the partition key hash.
  final String explicitHashKey;

  /// Determines which shard in the stream the data record is assigned to.
  /// Partition keys are Unicode strings with a maximum length limit of 256
  /// characters for each key. Amazon Kinesis Data Streams uses the partition
  /// key as input to a hash function that maps the partition key and associated
  /// data to a specific shard. Specifically, an MD5 hash function is used to
  /// map partition keys to 128-bit integer values and to map associated data
  /// records to shards. As a result of this hashing mechanism, all data records
  /// with the same partition key map to the same shard within the stream.
  final String partitionKey;

  PutRecordsRequestEntry({
    @required this.data,
    this.explicitHashKey,
    @required this.partitionKey,
  });
}

/// Represents the result of an individual record from a `PutRecords` request. A
/// record that is successfully added to a stream includes `SequenceNumber` and
/// `ShardId` in the result. A record that fails to be added to the stream
/// includes `ErrorCode` and `ErrorMessage` in the result.
class PutRecordsResultEntry {
  /// The sequence number for an individual record result.
  final String sequenceNumber;

  /// The shard ID for an individual record result.
  final String shardId;

  /// The error code for an individual record result. `ErrorCodes` can be either
  /// `ProvisionedThroughputExceededException` or `InternalFailure`.
  final String errorCode;

  /// The error message for an individual record result. An `ErrorCode` value of
  /// `ProvisionedThroughputExceededException` has an error message that
  /// includes the account ID, stream name, and shard ID. An `ErrorCode` value
  /// of `InternalFailure` has the error message `"Internal Service Failure"`.
  final String errorMessage;

  PutRecordsResultEntry({
    this.sequenceNumber,
    this.shardId,
    this.errorCode,
    this.errorMessage,
  });
  static PutRecordsResultEntry fromJson(Map<String, dynamic> json) =>
      PutRecordsResultEntry();
}

/// The unit of data of the Kinesis data stream, which is composed of a sequence
/// number, a partition key, and a data blob.
class Record {
  /// The unique identifier of the record within its shard.
  final String sequenceNumber;

  /// The approximate time that the record was inserted into the stream.
  final DateTime approximateArrivalTimestamp;

  /// The data blob. The data in the blob is both opaque and immutable to
  /// Kinesis Data Streams, which does not inspect, interpret, or change the
  /// data in the blob in any way. When the data blob (the payload before
  /// base64-encoding) is added to the partition key size, the total size must
  /// not exceed the maximum record size (1 MB).
  final Uint8List data;

  /// Identifies which shard in the stream the data record is assigned to.
  final String partitionKey;

  /// The encryption type used on the record. This parameter can be one of the
  /// following values:
  ///
  /// *    `NONE`: Do not encrypt the records in the stream.
  ///
  /// *    `KMS`: Use server-side encryption on the records in the stream using
  /// a customer-managed AWS KMS key.
  final String encryptionType;

  Record({
    @required this.sequenceNumber,
    this.approximateArrivalTimestamp,
    @required this.data,
    @required this.partitionKey,
    this.encryptionType,
  });
  static Record fromJson(Map<String, dynamic> json) => Record();
}

class RegisterStreamConsumerOutput {
  /// An object that represents the details of the consumer you registered. When
  /// you register a consumer, it gets an ARN that is generated by Kinesis Data
  /// Streams.
  final Consumer consumer;

  RegisterStreamConsumerOutput({
    @required this.consumer,
  });
  static RegisterStreamConsumerOutput fromJson(Map<String, dynamic> json) =>
      RegisterStreamConsumerOutput();
}

/// The range of possible sequence numbers for the shard.
class SequenceNumberRange {
  /// The starting sequence number for the range.
  final String startingSequenceNumber;

  /// The ending sequence number for the range. Shards that are in the OPEN
  /// state have an ending sequence number of `null`.
  final String endingSequenceNumber;

  SequenceNumberRange({
    @required this.startingSequenceNumber,
    this.endingSequenceNumber,
  });
  static SequenceNumberRange fromJson(Map<String, dynamic> json) =>
      SequenceNumberRange();
}

/// A uniquely identified group of data records in a Kinesis data stream.
class Shard {
  /// The unique identifier of the shard within the stream.
  final String shardId;

  /// The shard ID of the shard's parent.
  final String parentShardId;

  /// The shard ID of the shard adjacent to the shard's parent.
  final String adjacentParentShardId;

  /// The range of possible hash key values for the shard, which is a set of
  /// ordered contiguous positive integers.
  final HashKeyRange hashKeyRange;

  /// The range of possible sequence numbers for the shard.
  final SequenceNumberRange sequenceNumberRange;

  Shard({
    @required this.shardId,
    this.parentShardId,
    this.adjacentParentShardId,
    @required this.hashKeyRange,
    @required this.sequenceNumberRange,
  });
  static Shard fromJson(Map<String, dynamic> json) => Shard();
}

/// Represents the output for DescribeStream.
class StreamDescription {
  /// The name of the stream being described.
  final String streamName;

  /// The Amazon Resource Name (ARN) for the stream being described.
  final String streamArn;

  /// The current status of the stream being described. The stream status is one
  /// of the following states:
  ///
  /// *    `CREATING` - The stream is being created. Kinesis Data Streams
  /// immediately returns and sets `StreamStatus` to `CREATING`.
  ///
  /// *    `DELETING` - The stream is being deleted. The specified stream is in
  /// the `DELETING` state until Kinesis Data Streams completes the deletion.
  ///
  /// *    `ACTIVE` - The stream exists and is ready for read and write
  /// operations or deletion. You should perform read and write operations only
  /// on an `ACTIVE` stream.
  ///
  /// *    `UPDATING` - Shards in the stream are being merged or split. Read and
  /// write operations continue to work while the stream is in the `UPDATING`
  /// state.
  final String streamStatus;

  /// The shards that comprise the stream.
  final List<Shard> shards;

  /// If set to `true`, more shards in the stream are available to describe.
  final bool hasMoreShards;

  /// The current retention period, in hours.
  final int retentionPeriodHours;

  /// The approximate time that the stream was created.
  final DateTime streamCreationTimestamp;

  /// Represents the current enhanced monitoring settings of the stream.
  final List<EnhancedMetrics> enhancedMonitoring;

  /// The server-side encryption type used on the stream. This parameter can be
  /// one of the following values:
  ///
  /// *    `NONE`: Do not encrypt the records in the stream.
  ///
  /// *    `KMS`: Use server-side encryption on the records in the stream using
  /// a customer-managed AWS KMS key.
  final String encryptionType;

  /// The GUID for the customer-managed AWS KMS key to use for encryption. This
  /// value can be a globally unique identifier, a fully specified ARN to either
  /// an alias or a key, or an alias name prefixed by "alias/".You can also use
  /// a master key owned by Kinesis Data Streams by specifying the alias
  /// `aws/kinesis`.
  ///
  /// *   Key ARN example:
  /// `arn:aws:kms:us-east-1:123456789012:key/12345678-1234-1234-1234-123456789012`
  ///
  /// *   Alias ARN example:
  /// `arn:aws:kms:us-east-1:123456789012:alias/MyAliasName`
  ///
  /// *   Globally unique key ID example: `12345678-1234-1234-1234-123456789012`
  ///
  /// *   Alias name example: `alias/MyAliasName`
  ///
  /// *   Master key owned by Kinesis Data Streams: `alias/aws/kinesis`
  final String keyId;

  StreamDescription({
    @required this.streamName,
    @required this.streamArn,
    @required this.streamStatus,
    @required this.shards,
    @required this.hasMoreShards,
    @required this.retentionPeriodHours,
    @required this.streamCreationTimestamp,
    @required this.enhancedMonitoring,
    this.encryptionType,
    this.keyId,
  });
  static StreamDescription fromJson(Map<String, dynamic> json) =>
      StreamDescription();
}

/// Represents the output for DescribeStreamSummary
class StreamDescriptionSummary {
  /// The name of the stream being described.
  final String streamName;

  /// The Amazon Resource Name (ARN) for the stream being described.
  final String streamArn;

  /// The current status of the stream being described. The stream status is one
  /// of the following states:
  ///
  /// *    `CREATING` - The stream is being created. Kinesis Data Streams
  /// immediately returns and sets `StreamStatus` to `CREATING`.
  ///
  /// *    `DELETING` - The stream is being deleted. The specified stream is in
  /// the `DELETING` state until Kinesis Data Streams completes the deletion.
  ///
  /// *    `ACTIVE` - The stream exists and is ready for read and write
  /// operations or deletion. You should perform read and write operations only
  /// on an `ACTIVE` stream.
  ///
  /// *    `UPDATING` - Shards in the stream are being merged or split. Read and
  /// write operations continue to work while the stream is in the `UPDATING`
  /// state.
  final String streamStatus;

  /// The current retention period, in hours.
  final int retentionPeriodHours;

  /// The approximate time that the stream was created.
  final DateTime streamCreationTimestamp;

  /// Represents the current enhanced monitoring settings of the stream.
  final List<EnhancedMetrics> enhancedMonitoring;

  /// The encryption type used. This value is one of the following:
  ///
  /// *    `KMS`
  ///
  /// *    `NONE`
  final String encryptionType;

  /// The GUID for the customer-managed AWS KMS key to use for encryption. This
  /// value can be a globally unique identifier, a fully specified ARN to either
  /// an alias or a key, or an alias name prefixed by "alias/".You can also use
  /// a master key owned by Kinesis Data Streams by specifying the alias
  /// `aws/kinesis`.
  ///
  /// *   Key ARN example:
  /// `arn:aws:kms:us-east-1:123456789012:key/12345678-1234-1234-1234-123456789012`
  ///
  /// *   Alias ARN example:
  /// `arn:aws:kms:us-east-1:123456789012:alias/MyAliasName`
  ///
  /// *   Globally unique key ID example: `12345678-1234-1234-1234-123456789012`
  ///
  /// *   Alias name example: `alias/MyAliasName`
  ///
  /// *   Master key owned by Kinesis Data Streams: `alias/aws/kinesis`
  final String keyId;

  /// The number of open shards in the stream.
  final int openShardCount;

  /// The number of enhanced fan-out consumers registered with the stream.
  final int consumerCount;

  StreamDescriptionSummary({
    @required this.streamName,
    @required this.streamArn,
    @required this.streamStatus,
    @required this.retentionPeriodHours,
    @required this.streamCreationTimestamp,
    @required this.enhancedMonitoring,
    this.encryptionType,
    this.keyId,
    @required this.openShardCount,
    this.consumerCount,
  });
  static StreamDescriptionSummary fromJson(Map<String, dynamic> json) =>
      StreamDescriptionSummary();
}

/// Metadata assigned to the stream, consisting of a key-value pair.
class Tag {
  /// A unique identifier for the tag. Maximum length: 128 characters. Valid
  /// characters: Unicode letters, digits, white space, _ . / = + - % @
  final String key;

  /// An optional string, typically used to describe or define the tag. Maximum
  /// length: 256 characters. Valid characters: Unicode letters, digits, white
  /// space, _ . / = + - % @
  final String value;

  Tag({
    @required this.key,
    this.value,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag();
}

class UpdateShardCountOutput {
  /// The name of the stream.
  final String streamName;

  /// The current number of shards.
  final int currentShardCount;

  /// The updated number of shards.
  final int targetShardCount;

  UpdateShardCountOutput({
    this.streamName,
    this.currentShardCount,
    this.targetShardCount,
  });
  static UpdateShardCountOutput fromJson(Map<String, dynamic> json) =>
      UpdateShardCountOutput();
}
