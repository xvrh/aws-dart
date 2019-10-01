import 'package:meta/meta.dart';
import 'dart:typed_data';

/// Amazon Kinesis Data Firehose API Reference
///
/// Amazon Kinesis Data Firehose is a fully managed service that delivers
/// real-time streaming data to destinations such as Amazon Simple Storage
/// Service (Amazon S3), Amazon Elasticsearch Service (Amazon ES), Amazon
/// Redshift, and Splunk.
class FirehoseApi {
  /// Creates a Kinesis Data Firehose delivery stream.
  ///
  /// By default, you can create up to 50 delivery streams per AWS Region.
  ///
  /// This is an asynchronous operation that immediately returns. The initial
  /// status of the delivery stream is `CREATING`. After the delivery stream is
  /// created, its status is `ACTIVE` and it now accepts data. Attempts to send
  /// data to a delivery stream that is not in the `ACTIVE` state cause an
  /// exception. To check the state of a delivery stream, use
  /// DescribeDeliveryStream.
  ///
  /// A Kinesis Data Firehose delivery stream can be configured to receive
  /// records directly from providers using PutRecord or PutRecordBatch, or it
  /// can be configured to use an existing Kinesis stream as its source. To
  /// specify a Kinesis data stream as input, set the `DeliveryStreamType`
  /// parameter to `KinesisStreamAsSource`, and provide the Kinesis stream
  /// Amazon Resource Name (ARN) and role ARN in the
  /// `KinesisStreamSourceConfiguration` parameter.
  ///
  /// A delivery stream is configured with a single destination: Amazon S3,
  /// Amazon ES, Amazon Redshift, or Splunk. You must specify only one of the
  /// following destination configuration parameters:
  /// `ExtendedS3DestinationConfiguration`, `S3DestinationConfiguration`,
  /// `ElasticsearchDestinationConfiguration`,
  /// `RedshiftDestinationConfiguration`, or `SplunkDestinationConfiguration`.
  ///
  /// When you specify `S3DestinationConfiguration`, you can also provide the
  /// following optional values: BufferingHints, `EncryptionConfiguration`, and
  /// `CompressionFormat`. By default, if no `BufferingHints` value is provided,
  /// Kinesis Data Firehose buffers data up to 5 MB or for 5 minutes, whichever
  /// condition is satisfied first. `BufferingHints` is a hint, so there are
  /// some cases where the service cannot adhere to these conditions strictly.
  /// For example, record boundaries might be such that the size is a little
  /// over or under the configured buffering size. By default, no encryption is
  /// performed. We strongly recommend that you enable encryption to ensure
  /// secure data storage in Amazon S3.
  ///
  /// A few notes about Amazon Redshift as a destination:
  ///
  /// *   An Amazon Redshift destination requires an S3 bucket as intermediate
  /// location. Kinesis Data Firehose first delivers data to Amazon S3 and then
  /// uses `COPY` syntax to load data into an Amazon Redshift table. This is
  /// specified in the `RedshiftDestinationConfiguration.S3Configuration`
  /// parameter.
  ///
  /// *   The compression formats `SNAPPY` or `ZIP` cannot be specified in
  /// `RedshiftDestinationConfiguration.S3Configuration` because the Amazon
  /// Redshift `COPY` operation that reads from the S3 bucket doesn't support
  /// these compression formats.
  ///
  /// *   We strongly recommend that you use the user name and password you
  /// provide exclusively with Kinesis Data Firehose, and that the permissions
  /// for the account are restricted for Amazon Redshift `INSERT` permissions.
  ///
  ///
  /// Kinesis Data Firehose assumes the IAM role that is configured as part of
  /// the destination. The role should allow the Kinesis Data Firehose principal
  /// to assume the role, and the role should have permissions that allow the
  /// service to deliver the data. For more information, see
  /// [Grant Kinesis Data Firehose Access to an Amazon S3 Destination](http://docs.aws.amazon.com/firehose/latest/dev/controlling-access.html#using-iam-s3)
  /// in the _Amazon Kinesis Data Firehose Developer Guide_.
  ///
  /// [deliveryStreamName]: The name of the delivery stream. This name must be
  /// unique per AWS account in the same AWS Region. If the delivery streams are
  /// in different accounts or different Regions, you can have multiple delivery
  /// streams with the same name.
  ///
  /// [deliveryStreamType]: The delivery stream type. This parameter can be one
  /// of the following values:
  ///
  /// *    `DirectPut`: Provider applications access the delivery stream
  /// directly.
  ///
  /// *    `KinesisStreamAsSource`: The delivery stream uses a Kinesis data
  /// stream as a source.
  ///
  /// [kinesisStreamSourceConfiguration]: When a Kinesis data stream is used as
  /// the source for the delivery stream, a KinesisStreamSourceConfiguration
  /// containing the Kinesis data stream Amazon Resource Name (ARN) and the role
  /// ARN for the source stream.
  ///
  /// [s3DestinationConfiguration]: [Deprecated] The destination in Amazon S3.
  /// You can specify only one destination.
  ///
  /// [extendedS3DestinationConfiguration]: The destination in Amazon S3. You
  /// can specify only one destination.
  ///
  /// [redshiftDestinationConfiguration]: The destination in Amazon Redshift.
  /// You can specify only one destination.
  ///
  /// [elasticsearchDestinationConfiguration]: The destination in Amazon ES. You
  /// can specify only one destination.
  ///
  /// [splunkDestinationConfiguration]: The destination in Splunk. You can
  /// specify only one destination.
  ///
  /// [tags]: A set of tags to assign to the delivery stream. A tag is a
  /// key-value pair that you can define and assign to AWS resources. Tags are
  /// metadata. For example, you can add friendly names and descriptions or
  /// other types of information that can help you distinguish the delivery
  /// stream. For more information about tags, see
  /// [Using Cost Allocation Tags](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html)
  /// in the AWS Billing and Cost Management User Guide.
  ///
  /// You can specify up to 50 tags when creating a delivery stream.
  Future<CreateDeliveryStreamOutput> createDeliveryStream(
      String deliveryStreamName,
      {String deliveryStreamType,
      KinesisStreamSourceConfiguration kinesisStreamSourceConfiguration,
      S3DestinationConfiguration s3DestinationConfiguration,
      ExtendedS3DestinationConfiguration extendedS3DestinationConfiguration,
      RedshiftDestinationConfiguration redshiftDestinationConfiguration,
      ElasticsearchDestinationConfiguration
          elasticsearchDestinationConfiguration,
      SplunkDestinationConfiguration splunkDestinationConfiguration,
      List<Tag> tags}) async {
    return CreateDeliveryStreamOutput.fromJson({});
  }

  /// Deletes a delivery stream and its data.
  ///
  /// You can delete a delivery stream only if it is in `ACTIVE` or `DELETING`
  /// state, and not in the `CREATING` state. While the deletion request is in
  /// process, the delivery stream is in the `DELETING` state.
  ///
  /// To check the state of a delivery stream, use DescribeDeliveryStream.
  ///
  /// While the delivery stream is `DELETING` state, the service might continue
  /// to accept the records, but it doesn't make any guarantees with respect to
  /// delivering the data. Therefore, as a best practice, you should first stop
  /// any applications that are sending records before deleting a delivery
  /// stream.
  ///
  /// [deliveryStreamName]: The name of the delivery stream.
  Future<DeleteDeliveryStreamOutput> deleteDeliveryStream(
      String deliveryStreamName) async {
    return DeleteDeliveryStreamOutput.fromJson({});
  }

  /// Describes the specified delivery stream and gets the status. For example,
  /// after your delivery stream is created, call `DescribeDeliveryStream` to
  /// see whether the delivery stream is `ACTIVE` and therefore ready for data
  /// to be sent to it.
  ///
  /// [deliveryStreamName]: The name of the delivery stream.
  ///
  /// [limit]: The limit on the number of destinations to return. You can have
  /// one destination per delivery stream.
  ///
  /// [exclusiveStartDestinationId]: The ID of the destination to start
  /// returning the destination information. Kinesis Data Firehose supports one
  /// destination per delivery stream.
  Future<DescribeDeliveryStreamOutput> describeDeliveryStream(
      String deliveryStreamName,
      {int limit,
      String exclusiveStartDestinationId}) async {
    return DescribeDeliveryStreamOutput.fromJson({});
  }

  /// Lists your delivery streams in alphabetical order of their names.
  ///
  /// The number of delivery streams might be too large to return using a single
  /// call to `ListDeliveryStreams`. You can limit the number of delivery
  /// streams returned, using the `Limit` parameter. To determine whether there
  /// are more delivery streams to list, check the value of
  /// `HasMoreDeliveryStreams` in the output. If there are more delivery streams
  /// to list, you can request them by calling this operation again and setting
  /// the `ExclusiveStartDeliveryStreamName` parameter to the name of the last
  /// delivery stream returned in the last call.
  ///
  /// [limit]: The maximum number of delivery streams to list. The default value
  /// is 10.
  ///
  /// [deliveryStreamType]: The delivery stream type. This can be one of the
  /// following values:
  ///
  /// *    `DirectPut`: Provider applications access the delivery stream
  /// directly.
  ///
  /// *    `KinesisStreamAsSource`: The delivery stream uses a Kinesis data
  /// stream as a source.
  ///
  ///
  /// This parameter is optional. If this parameter is omitted, delivery streams
  /// of all types are returned.
  ///
  /// [exclusiveStartDeliveryStreamName]: The list of delivery streams returned
  /// by this call to `ListDeliveryStreams` will start with the delivery stream
  /// whose name comes alphabetically immediately after the name you specify in
  /// `ExclusiveStartDeliveryStreamName`.
  Future<ListDeliveryStreamsOutput> listDeliveryStreams(
      {int limit,
      String deliveryStreamType,
      String exclusiveStartDeliveryStreamName}) async {
    return ListDeliveryStreamsOutput.fromJson({});
  }

  /// Lists the tags for the specified delivery stream. This operation has a
  /// limit of five transactions per second per account.
  ///
  /// [deliveryStreamName]: The name of the delivery stream whose tags you want
  /// to list.
  ///
  /// [exclusiveStartTagKey]: The key to use as the starting point for the list
  /// of tags. If you set this parameter, `ListTagsForDeliveryStream` gets all
  /// tags that occur after `ExclusiveStartTagKey`.
  ///
  /// [limit]: The number of tags to return. If this number is less than the
  /// total number of tags associated with the delivery stream, `HasMoreTags` is
  /// set to `true` in the response. To list additional tags, set
  /// `ExclusiveStartTagKey` to the last key in the response.
  Future<ListTagsForDeliveryStreamOutput> listTagsForDeliveryStream(
      String deliveryStreamName,
      {String exclusiveStartTagKey,
      int limit}) async {
    return ListTagsForDeliveryStreamOutput.fromJson({});
  }

  /// Writes a single data record into an Amazon Kinesis Data Firehose delivery
  /// stream. To write multiple data records into a delivery stream, use
  /// PutRecordBatch. Applications using these operations are referred to as
  /// producers.
  ///
  /// By default, each delivery stream can take in up to 2,000 transactions per
  /// second, 5,000 records per second, or 5 MB per second. If you use PutRecord
  /// and PutRecordBatch, the limits are an aggregate across these two
  /// operations for each delivery stream. For more information about limits and
  /// how to request an increase, see
  /// [Amazon Kinesis Data Firehose Limits](http://docs.aws.amazon.com/firehose/latest/dev/limits.html).
  ///
  /// You must specify the name of the delivery stream and the data record when
  /// using PutRecord. The data record consists of a data blob that can be up to
  /// 1,000 KB in size, and any kind of data. For example, it can be a segment
  /// from a log file, geographic location data, website clickstream data, and
  /// so on.
  ///
  /// Kinesis Data Firehose buffers records before delivering them to the
  /// destination. To disambiguate the data blobs at the destination, a common
  /// solution is to use delimiters in the data, such as a newline (`n`) or some
  /// other character unique within the data. This allows the consumer
  /// application to parse individual data items when reading the data from the
  /// destination.
  ///
  /// The `PutRecord` operation returns a `RecordId`, which is a unique string
  /// assigned to each record. Producer applications can use this ID for
  /// purposes such as auditability and investigation.
  ///
  /// If the `PutRecord` operation throws a `ServiceUnavailableException`, back
  /// off and retry. If the exception persists, it is possible that the
  /// throughput limits have been exceeded for the delivery stream.
  ///
  /// Data records sent to Kinesis Data Firehose are stored for 24 hours from
  /// the time they are added to a delivery stream as it tries to send the
  /// records to the destination. If the destination is unreachable for more
  /// than 24 hours, the data is no longer available.
  ///
  ///
  ///
  /// Don't concatenate two or more base64 strings to form the data fields of
  /// your records. Instead, concatenate the raw data, then perform base64
  /// encoding.
  ///
  /// [deliveryStreamName]: The name of the delivery stream.
  ///
  /// [record]: The record.
  Future<PutRecordOutput> putRecord(
      {@required String deliveryStreamName, @required Record record}) async {
    return PutRecordOutput.fromJson({});
  }

  /// Writes multiple data records into a delivery stream in a single call,
  /// which can achieve higher throughput per producer than when writing single
  /// records. To write single data records into a delivery stream, use
  /// PutRecord. Applications using these operations are referred to as
  /// producers.
  ///
  /// By default, each delivery stream can take in up to 2,000 transactions per
  /// second, 5,000 records per second, or 5 MB per second. If you use PutRecord
  /// and PutRecordBatch, the limits are an aggregate across these two
  /// operations for each delivery stream. For more information about limits,
  /// see
  /// [Amazon Kinesis Data Firehose Limits](http://docs.aws.amazon.com/firehose/latest/dev/limits.html).
  ///
  /// Each PutRecordBatch request supports up to 500 records. Each record in the
  /// request can be as large as 1,000 KB (before 64-bit encoding), up to a
  /// limit of 4 MB for the entire request. These limits cannot be changed.
  ///
  /// You must specify the name of the delivery stream and the data record when
  /// using PutRecord. The data record consists of a data blob that can be up to
  /// 1,000 KB in size, and any kind of data. For example, it could be a segment
  /// from a log file, geographic location data, website clickstream data, and
  /// so on.
  ///
  /// Kinesis Data Firehose buffers records before delivering them to the
  /// destination. To disambiguate the data blobs at the destination, a common
  /// solution is to use delimiters in the data, such as a newline (`n`) or some
  /// other character unique within the data. This allows the consumer
  /// application to parse individual data items when reading the data from the
  /// destination.
  ///
  /// The PutRecordBatch response includes a count of failed records,
  /// `FailedPutCount`, and an array of responses, `RequestResponses`. Even if
  /// the PutRecordBatch call succeeds, the value of `FailedPutCount` may be
  /// greater than 0, indicating that there are records for which the operation
  /// didn't succeed. Each entry in the `RequestResponses` array provides
  /// additional information about the processed record. It directly correlates
  /// with a record in the request array using the same ordering, from the top
  /// to the bottom. The response array always includes the same number of
  /// records as the request array. `RequestResponses` includes both
  /// successfully and unsuccessfully processed records. Kinesis Data Firehose
  /// tries to process all records in each PutRecordBatch request. A single
  /// record failure does not stop the processing of subsequent records.
  ///
  /// A successfully processed record includes a `RecordId` value, which is
  /// unique for the record. An unsuccessfully processed record includes
  /// `ErrorCode` and `ErrorMessage` values. `ErrorCode` reflects the type of
  /// error, and is one of the following values: `ServiceUnavailableException`
  /// or `InternalFailure`. `ErrorMessage` provides more detailed information
  /// about the error.
  ///
  /// If there is an internal server error or a timeout, the write might have
  /// completed or it might have failed. If `FailedPutCount` is greater than 0,
  /// retry the request, resending only those records that might have failed
  /// processing. This minimizes the possible duplicate records and also reduces
  /// the total bytes sent (and corresponding charges). We recommend that you
  /// handle any duplicates at the destination.
  ///
  /// If PutRecordBatch throws `ServiceUnavailableException`, back off and
  /// retry. If the exception persists, it is possible that the throughput
  /// limits have been exceeded for the delivery stream.
  ///
  /// Data records sent to Kinesis Data Firehose are stored for 24 hours from
  /// the time they are added to a delivery stream as it attempts to send the
  /// records to the destination. If the destination is unreachable for more
  /// than 24 hours, the data is no longer available.
  ///
  ///
  ///
  /// Don't concatenate two or more base64 strings to form the data fields of
  /// your records. Instead, concatenate the raw data, then perform base64
  /// encoding.
  ///
  /// [deliveryStreamName]: The name of the delivery stream.
  ///
  /// [records]: One or more records.
  Future<PutRecordBatchOutput> putRecordBatch(
      {@required String deliveryStreamName,
      @required List<Record> records}) async {
    return PutRecordBatchOutput.fromJson({});
  }

  /// Enables server-side encryption (SSE) for the delivery stream.
  ///
  /// This operation is asynchronous. It returns immediately. When you invoke
  /// it, Kinesis Data Firehose first sets the status of the stream to
  /// `ENABLING`, and then to `ENABLED`. You can continue to read and write data
  /// to your stream while its status is `ENABLING`, but the data is not
  /// encrypted. It can take up to 5 seconds after the encryption status changes
  /// to `ENABLED` before all records written to the delivery stream are
  /// encrypted. To find out whether a record or a batch of records was
  /// encrypted, check the response elements PutRecordOutput$Encrypted and
  /// PutRecordBatchOutput$Encrypted, respectively.
  ///
  /// To check the encryption state of a delivery stream, use
  /// DescribeDeliveryStream.
  ///
  /// You can only enable SSE for a delivery stream that uses `DirectPut` as its
  /// source.
  ///
  /// The `StartDeliveryStreamEncryption` and `StopDeliveryStreamEncryption`
  /// operations have a combined limit of 25 calls per delivery stream per 24
  /// hours. For example, you reach the limit if you call
  /// `StartDeliveryStreamEncryption` 13 times and
  /// `StopDeliveryStreamEncryption` 12 times for the same delivery stream in a
  /// 24-hour period.
  ///
  /// [deliveryStreamName]: The name of the delivery stream for which you want
  /// to enable server-side encryption (SSE).
  Future<StartDeliveryStreamEncryptionOutput> startDeliveryStreamEncryption(
      String deliveryStreamName) async {
    return StartDeliveryStreamEncryptionOutput.fromJson({});
  }

  /// Disables server-side encryption (SSE) for the delivery stream.
  ///
  /// This operation is asynchronous. It returns immediately. When you invoke
  /// it, Kinesis Data Firehose first sets the status of the stream to
  /// `DISABLING`, and then to `DISABLED`. You can continue to read and write
  /// data to your stream while its status is `DISABLING`. It can take up to 5
  /// seconds after the encryption status changes to `DISABLED` before all
  /// records written to the delivery stream are no longer subject to
  /// encryption. To find out whether a record or a batch of records was
  /// encrypted, check the response elements PutRecordOutput$Encrypted and
  /// PutRecordBatchOutput$Encrypted, respectively.
  ///
  /// To check the encryption state of a delivery stream, use
  /// DescribeDeliveryStream.
  ///
  /// The `StartDeliveryStreamEncryption` and `StopDeliveryStreamEncryption`
  /// operations have a combined limit of 25 calls per delivery stream per 24
  /// hours. For example, you reach the limit if you call
  /// `StartDeliveryStreamEncryption` 13 times and
  /// `StopDeliveryStreamEncryption` 12 times for the same delivery stream in a
  /// 24-hour period.
  ///
  /// [deliveryStreamName]: The name of the delivery stream for which you want
  /// to disable server-side encryption (SSE).
  Future<StopDeliveryStreamEncryptionOutput> stopDeliveryStreamEncryption(
      String deliveryStreamName) async {
    return StopDeliveryStreamEncryptionOutput.fromJson({});
  }

  /// Adds or updates tags for the specified delivery stream. A tag is a
  /// key-value pair that you can define and assign to AWS resources. If you
  /// specify a tag that already exists, the tag value is replaced with the
  /// value that you specify in the request. Tags are metadata. For example, you
  /// can add friendly names and descriptions or other types of information that
  /// can help you distinguish the delivery stream. For more information about
  /// tags, see
  /// [Using Cost Allocation Tags](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html)
  /// in the _AWS Billing and Cost Management User Guide_.
  ///
  /// Each delivery stream can have up to 50 tags.
  ///
  /// This operation has a limit of five transactions per second per account.
  ///
  /// [deliveryStreamName]: The name of the delivery stream to which you want to
  /// add the tags.
  ///
  /// [tags]: A set of key-value pairs to use to create the tags.
  Future<TagDeliveryStreamOutput> tagDeliveryStream(
      {@required String deliveryStreamName, @required List<Tag> tags}) async {
    return TagDeliveryStreamOutput.fromJson({});
  }

  /// Removes tags from the specified delivery stream. Removed tags are deleted,
  /// and you can't recover them after this operation successfully completes.
  ///
  /// If you specify a tag that doesn't exist, the operation ignores it.
  ///
  /// This operation has a limit of five transactions per second per account.
  ///
  /// [deliveryStreamName]: The name of the delivery stream.
  ///
  /// [tagKeys]: A list of tag keys. Each corresponding tag is removed from the
  /// delivery stream.
  Future<UntagDeliveryStreamOutput> untagDeliveryStream(
      {@required String deliveryStreamName,
      @required List<String> tagKeys}) async {
    return UntagDeliveryStreamOutput.fromJson({});
  }

  /// Updates the specified destination of the specified delivery stream.
  ///
  /// Use this operation to change the destination type (for example, to replace
  /// the Amazon S3 destination with Amazon Redshift) or change the parameters
  /// associated with a destination (for example, to change the bucket name of
  /// the Amazon S3 destination). The update might not occur immediately. The
  /// target delivery stream remains active while the configurations are
  /// updated, so data writes to the delivery stream can continue during this
  /// process. The updated configurations are usually effective within a few
  /// minutes.
  ///
  /// Switching between Amazon ES and other services is not supported. For an
  /// Amazon ES destination, you can only update to another Amazon ES
  /// destination.
  ///
  /// If the destination type is the same, Kinesis Data Firehose merges the
  /// configuration parameters specified with the destination configuration that
  /// already exists on the delivery stream. If any of the parameters are not
  /// specified in the call, the existing values are retained. For example, in
  /// the Amazon S3 destination, if EncryptionConfiguration is not specified,
  /// then the existing `EncryptionConfiguration` is maintained on the
  /// destination.
  ///
  /// If the destination type is not the same, for example, changing the
  /// destination from Amazon S3 to Amazon Redshift, Kinesis Data Firehose does
  /// not merge any parameters. In this case, all parameters must be specified.
  ///
  /// Kinesis Data Firehose uses `CurrentDeliveryStreamVersionId` to avoid race
  /// conditions and conflicting merges. This is a required field, and the
  /// service updates the configuration only if the existing configuration has a
  /// version ID that matches. After the update is applied successfully, the
  /// version ID is updated, and can be retrieved using DescribeDeliveryStream.
  /// Use the new version ID to set `CurrentDeliveryStreamVersionId` in the next
  /// call.
  ///
  /// [deliveryStreamName]: The name of the delivery stream.
  ///
  /// [currentDeliveryStreamVersionId]: Obtain this value from the `VersionId`
  /// result of DeliveryStreamDescription. This value is required, and helps the
  /// service perform conditional operations. For example, if there is an
  /// interleaving update and this value is null, then the update destination
  /// fails. After the update is successful, the `VersionId` value is updated.
  /// The service then performs a merge of the old configuration with the new
  /// configuration.
  ///
  /// [destinationId]: The ID of the destination.
  ///
  /// [s3DestinationUpdate]: [Deprecated] Describes an update for a destination
  /// in Amazon S3.
  ///
  /// [extendedS3DestinationUpdate]: Describes an update for a destination in
  /// Amazon S3.
  ///
  /// [redshiftDestinationUpdate]: Describes an update for a destination in
  /// Amazon Redshift.
  ///
  /// [elasticsearchDestinationUpdate]: Describes an update for a destination in
  /// Amazon ES.
  ///
  /// [splunkDestinationUpdate]: Describes an update for a destination in
  /// Splunk.
  Future<UpdateDestinationOutput> updateDestination(
      {@required String deliveryStreamName,
      @required String currentDeliveryStreamVersionId,
      @required String destinationId,
      S3DestinationUpdate s3DestinationUpdate,
      ExtendedS3DestinationUpdate extendedS3DestinationUpdate,
      RedshiftDestinationUpdate redshiftDestinationUpdate,
      ElasticsearchDestinationUpdate elasticsearchDestinationUpdate,
      SplunkDestinationUpdate splunkDestinationUpdate}) async {
    return UpdateDestinationOutput.fromJson({});
  }
}

/// Describes hints for the buffering to perform before delivering data to the
/// destination. These options are treated as hints, and therefore Kinesis Data
/// Firehose might choose to use different values when it is optimal.
class BufferingHints {
  /// Buffer incoming data to the specified size, in MBs, before delivering it
  /// to the destination. The default value is 5.
  ///
  /// We recommend setting this parameter to a value greater than the amount of
  /// data you typically ingest into the delivery stream in 10 seconds. For
  /// example, if you typically ingest data at 1 MB/sec, the value should be 10
  /// MB or higher.
  final int sizeInmBs;

  /// Buffer incoming data for the specified period of time, in seconds, before
  /// delivering it to the destination. The default value is 300.
  final int intervalInSeconds;

  BufferingHints({
    this.sizeInmBs,
    this.intervalInSeconds,
  });
  static BufferingHints fromJson(Map<String, dynamic> json) => BufferingHints();
}

/// Describes the Amazon CloudWatch logging options for your delivery stream.
class CloudWatchLoggingOptions {
  /// Enables or disables CloudWatch logging.
  final bool enabled;

  /// The CloudWatch group name for logging. This value is required if
  /// CloudWatch logging is enabled.
  final String logGroupName;

  /// The CloudWatch log stream name for logging. This value is required if
  /// CloudWatch logging is enabled.
  final String logStreamName;

  CloudWatchLoggingOptions({
    this.enabled,
    this.logGroupName,
    this.logStreamName,
  });
  static CloudWatchLoggingOptions fromJson(Map<String, dynamic> json) =>
      CloudWatchLoggingOptions();
}

/// Describes a `COPY` command for Amazon Redshift.
class CopyCommand {
  /// The name of the target table. The table must already exist in the
  /// database.
  final String dataTableName;

  /// A comma-separated list of column names.
  final String dataTableColumns;

  /// Optional parameters to use with the Amazon Redshift `COPY` command. For
  /// more information, see the "Optional Parameters" section of
  /// [Amazon Redshift COPY command](http://docs.aws.amazon.com/redshift/latest/dg/r_COPY.html).
  /// Some possible examples that would apply to Kinesis Data Firehose are as
  /// follows:
  ///
  ///  `delimiter 't' lzop;` - fields are delimited with "t" (TAB character) and
  /// compressed using lzop.
  ///
  ///  `delimiter '|'` - fields are delimited with "|" (this is the default
  /// delimiter).
  ///
  ///  `delimiter '|' escape` - the delimiter should be escaped.
  ///
  ///  `fixedwidth
  /// 'venueid:3,venuename:25,venuecity:12,venuestate:2,venueseats:6'` - fields
  /// are fixed width in the source, with each width specified after every
  /// column in the table.
  ///
  ///  `JSON 's3://mybucket/jsonpaths.txt'` - data is in JSON format, and the
  /// path specified is the format of the data.
  ///
  /// For more examples, see
  /// [Amazon Redshift COPY command examples](http://docs.aws.amazon.com/redshift/latest/dg/r_COPY_command_examples.html).
  final String copyOptions;

  CopyCommand({
    @required this.dataTableName,
    this.dataTableColumns,
    this.copyOptions,
  });
  static CopyCommand fromJson(Map<String, dynamic> json) => CopyCommand();
}

class CreateDeliveryStreamOutput {
  /// The ARN of the delivery stream.
  final String deliveryStreamArn;

  CreateDeliveryStreamOutput({
    this.deliveryStreamArn,
  });
  static CreateDeliveryStreamOutput fromJson(Map<String, dynamic> json) =>
      CreateDeliveryStreamOutput();
}

/// Specifies that you want Kinesis Data Firehose to convert data from the JSON
/// format to the Parquet or ORC format before writing it to Amazon S3. Kinesis
/// Data Firehose uses the serializer and deserializer that you specify, in
/// addition to the column information from the AWS Glue table, to deserialize
/// your input data from JSON and then serialize it to the Parquet or ORC
/// format. For more information, see
/// [Kinesis Data Firehose Record Format Conversion](https://docs.aws.amazon.com/firehose/latest/dev/record-format-conversion.html).
class DataFormatConversionConfiguration {
  /// Specifies the AWS Glue Data Catalog table that contains the column
  /// information.
  final SchemaConfiguration schemaConfiguration;

  /// Specifies the deserializer that you want Kinesis Data Firehose to use to
  /// convert the format of your data from JSON.
  final InputFormatConfiguration inputFormatConfiguration;

  /// Specifies the serializer that you want Kinesis Data Firehose to use to
  /// convert the format of your data to the Parquet or ORC format.
  final OutputFormatConfiguration outputFormatConfiguration;

  /// Defaults to `true`. Set it to `false` if you want to disable format
  /// conversion while preserving the configuration details.
  final bool enabled;

  DataFormatConversionConfiguration({
    this.schemaConfiguration,
    this.inputFormatConfiguration,
    this.outputFormatConfiguration,
    this.enabled,
  });
  static DataFormatConversionConfiguration fromJson(
          Map<String, dynamic> json) =>
      DataFormatConversionConfiguration();
}

class DeleteDeliveryStreamOutput {
  DeleteDeliveryStreamOutput();
  static DeleteDeliveryStreamOutput fromJson(Map<String, dynamic> json) =>
      DeleteDeliveryStreamOutput();
}

/// Contains information about a delivery stream.
class DeliveryStreamDescription {
  /// The name of the delivery stream.
  final String deliveryStreamName;

  /// The Amazon Resource Name (ARN) of the delivery stream. For more
  /// information, see
  /// [Amazon Resource Names (ARNs) and AWS Service Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html).
  final String deliveryStreamArn;

  /// The status of the delivery stream.
  final String deliveryStreamStatus;

  /// Indicates the server-side encryption (SSE) status for the delivery stream.
  final DeliveryStreamEncryptionConfiguration
      deliveryStreamEncryptionConfiguration;

  /// The delivery stream type. This can be one of the following values:
  ///
  /// *    `DirectPut`: Provider applications access the delivery stream
  /// directly.
  ///
  /// *    `KinesisStreamAsSource`: The delivery stream uses a Kinesis data
  /// stream as a source.
  final String deliveryStreamType;

  /// Each time the destination is updated for a delivery stream, the version ID
  /// is changed, and the current version ID is required when updating the
  /// destination. This is so that the service knows it is applying the changes
  /// to the correct version of the delivery stream.
  final String versionId;

  /// The date and time that the delivery stream was created.
  final DateTime createTimestamp;

  /// The date and time that the delivery stream was last updated.
  final DateTime lastUpdateTimestamp;

  /// If the `DeliveryStreamType` parameter is `KinesisStreamAsSource`, a
  /// SourceDescription object describing the source Kinesis data stream.
  final SourceDescription source;

  /// The destinations.
  final List<DestinationDescription> destinations;

  /// Indicates whether there are more destinations available to list.
  final bool hasMoreDestinations;

  DeliveryStreamDescription({
    @required this.deliveryStreamName,
    @required this.deliveryStreamArn,
    @required this.deliveryStreamStatus,
    this.deliveryStreamEncryptionConfiguration,
    @required this.deliveryStreamType,
    @required this.versionId,
    this.createTimestamp,
    this.lastUpdateTimestamp,
    this.source,
    @required this.destinations,
    @required this.hasMoreDestinations,
  });
  static DeliveryStreamDescription fromJson(Map<String, dynamic> json) =>
      DeliveryStreamDescription();
}

/// Indicates the server-side encryption (SSE) status for the delivery stream.
class DeliveryStreamEncryptionConfiguration {
  /// For a full description of the different values of this status, see
  /// StartDeliveryStreamEncryption and StopDeliveryStreamEncryption.
  final String status;

  DeliveryStreamEncryptionConfiguration({
    this.status,
  });
  static DeliveryStreamEncryptionConfiguration fromJson(
          Map<String, dynamic> json) =>
      DeliveryStreamEncryptionConfiguration();
}

class DescribeDeliveryStreamOutput {
  /// Information about the delivery stream.
  final DeliveryStreamDescription deliveryStreamDescription;

  DescribeDeliveryStreamOutput({
    @required this.deliveryStreamDescription,
  });
  static DescribeDeliveryStreamOutput fromJson(Map<String, dynamic> json) =>
      DescribeDeliveryStreamOutput();
}

/// The deserializer you want Kinesis Data Firehose to use for converting the
/// input data from JSON. Kinesis Data Firehose then serializes the data to its
/// final format using the Serializer. Kinesis Data Firehose supports two types
/// of deserializers: the
/// [Apache Hive JSON SerDe](https://cwiki.apache.org/confluence/display/Hive/LanguageManual+DDL#LanguageManualDDL-JSON)
/// and the [OpenX JSON SerDe](https://github.com/rcongiu/Hive-JSON-Serde).
class Deserializer {
  /// The OpenX SerDe. Used by Kinesis Data Firehose for deserializing data,
  /// which means converting it from the JSON format in preparation for
  /// serializing it to the Parquet or ORC format. This is one of two
  /// deserializers you can choose, depending on which one offers the
  /// functionality you need. The other option is the native Hive / HCatalog
  /// JsonSerDe.
  final OpenxJsonSerDe openxJsonSerDe;

  /// The native Hive / HCatalog JsonSerDe. Used by Kinesis Data Firehose for
  /// deserializing data, which means converting it from the JSON format in
  /// preparation for serializing it to the Parquet or ORC format. This is one
  /// of two deserializers you can choose, depending on which one offers the
  /// functionality you need. The other option is the OpenX SerDe.
  final HiveJsonSerDe hiveJsonSerDe;

  Deserializer({
    this.openxJsonSerDe,
    this.hiveJsonSerDe,
  });
  static Deserializer fromJson(Map<String, dynamic> json) => Deserializer();
}

/// Describes the destination for a delivery stream.
class DestinationDescription {
  /// The ID of the destination.
  final String destinationId;

  /// [Deprecated] The destination in Amazon S3.
  final S3DestinationDescription s3DestinationDescription;

  /// The destination in Amazon S3.
  final ExtendedS3DestinationDescription extendedS3DestinationDescription;

  /// The destination in Amazon Redshift.
  final RedshiftDestinationDescription redshiftDestinationDescription;

  /// The destination in Amazon ES.
  final ElasticsearchDestinationDescription elasticsearchDestinationDescription;

  /// The destination in Splunk.
  final SplunkDestinationDescription splunkDestinationDescription;

  DestinationDescription({
    @required this.destinationId,
    this.s3DestinationDescription,
    this.extendedS3DestinationDescription,
    this.redshiftDestinationDescription,
    this.elasticsearchDestinationDescription,
    this.splunkDestinationDescription,
  });
  static DestinationDescription fromJson(Map<String, dynamic> json) =>
      DestinationDescription();
}

/// Describes the buffering to perform before delivering data to the Amazon ES
/// destination.
class ElasticsearchBufferingHints {
  /// Buffer incoming data for the specified period of time, in seconds, before
  /// delivering it to the destination. The default value is 300 (5 minutes).
  final int intervalInSeconds;

  /// Buffer incoming data to the specified size, in MBs, before delivering it
  /// to the destination. The default value is 5.
  ///
  /// We recommend setting this parameter to a value greater than the amount of
  /// data you typically ingest into the delivery stream in 10 seconds. For
  /// example, if you typically ingest data at 1 MB/sec, the value should be 10
  /// MB or higher.
  final int sizeInmBs;

  ElasticsearchBufferingHints({
    this.intervalInSeconds,
    this.sizeInmBs,
  });
  static ElasticsearchBufferingHints fromJson(Map<String, dynamic> json) =>
      ElasticsearchBufferingHints();
}

/// Describes the configuration of a destination in Amazon ES.
class ElasticsearchDestinationConfiguration {
  /// The Amazon Resource Name (ARN) of the IAM role to be assumed by Kinesis
  /// Data Firehose for calling the Amazon ES Configuration API and for indexing
  /// documents. For more information, see
  /// [Grant Kinesis Data Firehose Access to an Amazon S3 Destination](http://docs.aws.amazon.com/firehose/latest/dev/controlling-access.html#using-iam-s3)
  /// and
  /// [Amazon Resource Names (ARNs) and AWS Service Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html).
  final String roleArn;

  /// The ARN of the Amazon ES domain. The IAM role must have permissions
  /// for `DescribeElasticsearchDomain`, `DescribeElasticsearchDomains`, and
  /// `DescribeElasticsearchDomainConfig` after assuming the role specified in
  /// **RoleARN**. For more information, see
  /// [Amazon Resource Names (ARNs) and AWS Service Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html).
  final String domainArn;

  /// The Elasticsearch index name.
  final String indexName;

  /// The Elasticsearch type name. For Elasticsearch 6.x, there can be only one
  /// type per index. If you try to specify a new type for an existing index
  /// that already has another type, Kinesis Data Firehose returns an error
  /// during run time.
  final String typeName;

  /// The Elasticsearch index rotation period. Index rotation appends a
  /// timestamp to the `IndexName` to facilitate the expiration of old data. For
  /// more information, see
  /// [Index Rotation for the Amazon ES Destination](http://docs.aws.amazon.com/firehose/latest/dev/basic-deliver.html#es-index-rotation).
  /// The default value is `OneDay`.
  final String indexRotationPeriod;

  /// The buffering options. If no value is specified, the default values for
  /// `ElasticsearchBufferingHints` are used.
  final ElasticsearchBufferingHints bufferingHints;

  /// The retry behavior in case Kinesis Data Firehose is unable to deliver
  /// documents to Amazon ES. The default value is 300 (5 minutes).
  final ElasticsearchRetryOptions retryOptions;

  /// Defines how documents should be delivered to Amazon S3. When it is set to
  /// `FailedDocumentsOnly`, Kinesis Data Firehose writes any documents that
  /// could not be indexed to the configured Amazon S3 destination, with
  /// `elasticsearch-failed/` appended to the key prefix. When set to
  /// `AllDocuments`, Kinesis Data Firehose delivers all incoming records to
  /// Amazon S3, and also writes failed documents with `elasticsearch-failed/`
  /// appended to the prefix. For more information, see
  /// [Amazon S3 Backup for the Amazon ES Destination](http://docs.aws.amazon.com/firehose/latest/dev/basic-deliver.html#es-s3-backup).
  /// Default value is `FailedDocumentsOnly`.
  final String s3BackupMode;

  /// The configuration for the backup Amazon S3 location.
  final S3DestinationConfiguration s3Configuration;

  /// The data processing configuration.
  final ProcessingConfiguration processingConfiguration;

  /// The Amazon CloudWatch logging options for your delivery stream.
  final CloudWatchLoggingOptions cloudWatchLoggingOptions;

  ElasticsearchDestinationConfiguration({
    @required this.roleArn,
    @required this.domainArn,
    @required this.indexName,
    @required this.typeName,
    this.indexRotationPeriod,
    this.bufferingHints,
    this.retryOptions,
    this.s3BackupMode,
    @required this.s3Configuration,
    this.processingConfiguration,
    this.cloudWatchLoggingOptions,
  });
}

/// The destination description in Amazon ES.
class ElasticsearchDestinationDescription {
  /// The Amazon Resource Name (ARN) of the AWS credentials. For more
  /// information, see
  /// [Amazon Resource Names (ARNs) and AWS Service Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html).
  final String roleArn;

  /// The ARN of the Amazon ES domain. For more information, see
  /// [Amazon Resource Names (ARNs) and AWS Service Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html).
  final String domainArn;

  /// The Elasticsearch index name.
  final String indexName;

  /// The Elasticsearch type name.
  final String typeName;

  /// The Elasticsearch index rotation period
  final String indexRotationPeriod;

  /// The buffering options.
  final ElasticsearchBufferingHints bufferingHints;

  /// The Amazon ES retry options.
  final ElasticsearchRetryOptions retryOptions;

  /// The Amazon S3 backup mode.
  final String s3BackupMode;

  /// The Amazon S3 destination.
  final S3DestinationDescription s3DestinationDescription;

  /// The data processing configuration.
  final ProcessingConfiguration processingConfiguration;

  /// The Amazon CloudWatch logging options.
  final CloudWatchLoggingOptions cloudWatchLoggingOptions;

  ElasticsearchDestinationDescription({
    this.roleArn,
    this.domainArn,
    this.indexName,
    this.typeName,
    this.indexRotationPeriod,
    this.bufferingHints,
    this.retryOptions,
    this.s3BackupMode,
    this.s3DestinationDescription,
    this.processingConfiguration,
    this.cloudWatchLoggingOptions,
  });
  static ElasticsearchDestinationDescription fromJson(
          Map<String, dynamic> json) =>
      ElasticsearchDestinationDescription();
}

/// Describes an update for a destination in Amazon ES.
class ElasticsearchDestinationUpdate {
  /// The Amazon Resource Name (ARN) of the IAM role to be assumed by Kinesis
  /// Data Firehose for calling the Amazon ES Configuration API and for indexing
  /// documents. For more information, see
  /// [Grant Kinesis Data Firehose Access to an Amazon S3 Destination](http://docs.aws.amazon.com/firehose/latest/dev/controlling-access.html#using-iam-s3)
  /// and
  /// [Amazon Resource Names (ARNs) and AWS Service Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html).
  final String roleArn;

  /// The ARN of the Amazon ES domain. The IAM role must have permissions
  /// for `DescribeElasticsearchDomain`, `DescribeElasticsearchDomains`, and
  /// `DescribeElasticsearchDomainConfig` after assuming the IAM role specified
  /// in `RoleARN`. For more information, see
  /// [Amazon Resource Names (ARNs) and AWS Service Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html).
  final String domainArn;

  /// The Elasticsearch index name.
  final String indexName;

  /// The Elasticsearch type name. For Elasticsearch 6.x, there can be only one
  /// type per index. If you try to specify a new type for an existing index
  /// that already has another type, Kinesis Data Firehose returns an error
  /// during runtime.
  final String typeName;

  /// The Elasticsearch index rotation period. Index rotation appends a
  /// timestamp to `IndexName` to facilitate the expiration of old data. For
  /// more information, see
  /// [Index Rotation for the Amazon ES Destination](http://docs.aws.amazon.com/firehose/latest/dev/basic-deliver.html#es-index-rotation).
  /// Default value is `OneDay`.
  final String indexRotationPeriod;

  /// The buffering options. If no value is specified,
  /// `ElasticsearchBufferingHints` object default values are used.
  final ElasticsearchBufferingHints bufferingHints;

  /// The retry behavior in case Kinesis Data Firehose is unable to deliver
  /// documents to Amazon ES. The default value is 300 (5 minutes).
  final ElasticsearchRetryOptions retryOptions;

  /// The Amazon S3 destination.
  final S3DestinationUpdate s3Update;

  /// The data processing configuration.
  final ProcessingConfiguration processingConfiguration;

  /// The CloudWatch logging options for your delivery stream.
  final CloudWatchLoggingOptions cloudWatchLoggingOptions;

  ElasticsearchDestinationUpdate({
    this.roleArn,
    this.domainArn,
    this.indexName,
    this.typeName,
    this.indexRotationPeriod,
    this.bufferingHints,
    this.retryOptions,
    this.s3Update,
    this.processingConfiguration,
    this.cloudWatchLoggingOptions,
  });
}

/// Configures retry behavior in case Kinesis Data Firehose is unable to deliver
/// documents to Amazon ES.
class ElasticsearchRetryOptions {
  /// After an initial failure to deliver to Amazon ES, the total amount of time
  /// during which Kinesis Data Firehose retries delivery (including the first
  /// attempt). After this time has elapsed, the failed documents are written to
  /// Amazon S3. Default value is 300 seconds (5 minutes). A value of 0 (zero)
  /// results in no retries.
  final int durationInSeconds;

  ElasticsearchRetryOptions({
    this.durationInSeconds,
  });
  static ElasticsearchRetryOptions fromJson(Map<String, dynamic> json) =>
      ElasticsearchRetryOptions();
}

/// Describes the encryption for a destination in Amazon S3.
class EncryptionConfiguration {
  /// Specifically override existing encryption information to ensure that no
  /// encryption is used.
  final String noEncryptionConfig;

  /// The encryption key.
  final KmsEncryptionConfig kmsEncryptionConfig;

  EncryptionConfiguration({
    this.noEncryptionConfig,
    this.kmsEncryptionConfig,
  });
  static EncryptionConfiguration fromJson(Map<String, dynamic> json) =>
      EncryptionConfiguration();
}

/// Describes the configuration of a destination in Amazon S3.
class ExtendedS3DestinationConfiguration {
  /// The Amazon Resource Name (ARN) of the AWS credentials. For more
  /// information, see
  /// [Amazon Resource Names (ARNs) and AWS Service Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html).
  final String roleArn;

  /// The ARN of the S3 bucket. For more information, see
  /// [Amazon Resource Names (ARNs) and AWS Service Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html).
  final String bucketArn;

  /// The "YYYY/MM/DD/HH" time format prefix is automatically used for delivered
  /// Amazon S3 files. You can specify an extra prefix to be added in front of
  /// the time format prefix. If the prefix ends with a slash, it appears as a
  /// folder in the S3 bucket. For more information, see
  /// [Amazon S3 Object Name Format](http://docs.aws.amazon.com/firehose/latest/dev/basic-deliver.html#s3-object-name)
  /// in the _Amazon Kinesis Data Firehose Developer Guide_.
  final String prefix;

  /// A prefix that Kinesis Data Firehose evaluates and adds to failed records
  /// before writing them to S3. This prefix appears immediately following the
  /// bucket name.
  final String errorOutputPrefix;

  /// The buffering option.
  final BufferingHints bufferingHints;

  /// The compression format. If no value is specified, the default is
  /// UNCOMPRESSED.
  final String compressionFormat;

  /// The encryption configuration. If no value is specified, the default is no
  /// encryption.
  final EncryptionConfiguration encryptionConfiguration;

  /// The Amazon CloudWatch logging options for your delivery stream.
  final CloudWatchLoggingOptions cloudWatchLoggingOptions;

  /// The data processing configuration.
  final ProcessingConfiguration processingConfiguration;

  /// The Amazon S3 backup mode.
  final String s3BackupMode;

  /// The configuration for backup in Amazon S3.
  final S3DestinationConfiguration s3BackupConfiguration;

  /// The serializer, deserializer, and schema for converting data from the JSON
  /// format to the Parquet or ORC format before writing it to Amazon S3.
  final DataFormatConversionConfiguration dataFormatConversionConfiguration;

  ExtendedS3DestinationConfiguration({
    @required this.roleArn,
    @required this.bucketArn,
    this.prefix,
    this.errorOutputPrefix,
    this.bufferingHints,
    this.compressionFormat,
    this.encryptionConfiguration,
    this.cloudWatchLoggingOptions,
    this.processingConfiguration,
    this.s3BackupMode,
    this.s3BackupConfiguration,
    this.dataFormatConversionConfiguration,
  });
}

/// Describes a destination in Amazon S3.
class ExtendedS3DestinationDescription {
  /// The Amazon Resource Name (ARN) of the AWS credentials. For more
  /// information, see
  /// [Amazon Resource Names (ARNs) and AWS Service Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html).
  final String roleArn;

  /// The ARN of the S3 bucket. For more information, see
  /// [Amazon Resource Names (ARNs) and AWS Service Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html).
  final String bucketArn;

  /// The "YYYY/MM/DD/HH" time format prefix is automatically used for delivered
  /// Amazon S3 files. You can specify an extra prefix to be added in front of
  /// the time format prefix. If the prefix ends with a slash, it appears as a
  /// folder in the S3 bucket. For more information, see
  /// [Amazon S3 Object Name Format](http://docs.aws.amazon.com/firehose/latest/dev/basic-deliver.html#s3-object-name)
  /// in the _Amazon Kinesis Data Firehose Developer Guide_.
  final String prefix;

  /// A prefix that Kinesis Data Firehose evaluates and adds to failed records
  /// before writing them to S3. This prefix appears immediately following the
  /// bucket name.
  final String errorOutputPrefix;

  /// The buffering option.
  final BufferingHints bufferingHints;

  /// The compression format. If no value is specified, the default is
  /// `UNCOMPRESSED`.
  final String compressionFormat;

  /// The encryption configuration. If no value is specified, the default is no
  /// encryption.
  final EncryptionConfiguration encryptionConfiguration;

  /// The Amazon CloudWatch logging options for your delivery stream.
  final CloudWatchLoggingOptions cloudWatchLoggingOptions;

  /// The data processing configuration.
  final ProcessingConfiguration processingConfiguration;

  /// The Amazon S3 backup mode.
  final String s3BackupMode;

  /// The configuration for backup in Amazon S3.
  final S3DestinationDescription s3BackupDescription;

  /// The serializer, deserializer, and schema for converting data from the JSON
  /// format to the Parquet or ORC format before writing it to Amazon S3.
  final DataFormatConversionConfiguration dataFormatConversionConfiguration;

  ExtendedS3DestinationDescription({
    @required this.roleArn,
    @required this.bucketArn,
    this.prefix,
    this.errorOutputPrefix,
    @required this.bufferingHints,
    @required this.compressionFormat,
    @required this.encryptionConfiguration,
    this.cloudWatchLoggingOptions,
    this.processingConfiguration,
    this.s3BackupMode,
    this.s3BackupDescription,
    this.dataFormatConversionConfiguration,
  });
  static ExtendedS3DestinationDescription fromJson(Map<String, dynamic> json) =>
      ExtendedS3DestinationDescription();
}

/// Describes an update for a destination in Amazon S3.
class ExtendedS3DestinationUpdate {
  /// The Amazon Resource Name (ARN) of the AWS credentials. For more
  /// information, see
  /// [Amazon Resource Names (ARNs) and AWS Service Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html).
  final String roleArn;

  /// The ARN of the S3 bucket. For more information, see
  /// [Amazon Resource Names (ARNs) and AWS Service Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html).
  final String bucketArn;

  /// The "YYYY/MM/DD/HH" time format prefix is automatically used for delivered
  /// Amazon S3 files. You can specify an extra prefix to be added in front of
  /// the time format prefix. If the prefix ends with a slash, it appears as a
  /// folder in the S3 bucket. For more information, see
  /// [Amazon S3 Object Name Format](http://docs.aws.amazon.com/firehose/latest/dev/basic-deliver.html#s3-object-name)
  /// in the _Amazon Kinesis Data Firehose Developer Guide_.
  final String prefix;

  /// A prefix that Kinesis Data Firehose evaluates and adds to failed records
  /// before writing them to S3. This prefix appears immediately following the
  /// bucket name.
  final String errorOutputPrefix;

  /// The buffering option.
  final BufferingHints bufferingHints;

  /// The compression format. If no value is specified, the default is
  /// `UNCOMPRESSED`.
  final String compressionFormat;

  /// The encryption configuration. If no value is specified, the default is no
  /// encryption.
  final EncryptionConfiguration encryptionConfiguration;

  /// The Amazon CloudWatch logging options for your delivery stream.
  final CloudWatchLoggingOptions cloudWatchLoggingOptions;

  /// The data processing configuration.
  final ProcessingConfiguration processingConfiguration;

  /// Enables or disables Amazon S3 backup mode.
  final String s3BackupMode;

  /// The Amazon S3 destination for backup.
  final S3DestinationUpdate s3BackupUpdate;

  /// The serializer, deserializer, and schema for converting data from the JSON
  /// format to the Parquet or ORC format before writing it to Amazon S3.
  final DataFormatConversionConfiguration dataFormatConversionConfiguration;

  ExtendedS3DestinationUpdate({
    this.roleArn,
    this.bucketArn,
    this.prefix,
    this.errorOutputPrefix,
    this.bufferingHints,
    this.compressionFormat,
    this.encryptionConfiguration,
    this.cloudWatchLoggingOptions,
    this.processingConfiguration,
    this.s3BackupMode,
    this.s3BackupUpdate,
    this.dataFormatConversionConfiguration,
  });
}

/// The native Hive / HCatalog JsonSerDe. Used by Kinesis Data Firehose for
/// deserializing data, which means converting it from the JSON format in
/// preparation for serializing it to the Parquet or ORC format. This is one of
/// two deserializers you can choose, depending on which one offers the
/// functionality you need. The other option is the OpenX SerDe.
class HiveJsonSerDe {
  /// Indicates how you want Kinesis Data Firehose to parse the date and
  /// timestamps that may be present in your input data JSON. To specify these
  /// format strings, follow the pattern syntax of JodaTime's DateTimeFormat
  /// format strings. For more information, see
  /// [Class DateTimeFormat](https://www.joda.org/joda-time/apidocs/org/joda/time/format/DateTimeFormat.html).
  /// You can also use the special value `millis` to parse timestamps in epoch
  /// milliseconds. If you don't specify a format, Kinesis Data Firehose uses
  /// `java.sql.Timestamp::valueOf` by default.
  final List<String> timestampFormats;

  HiveJsonSerDe({
    this.timestampFormats,
  });
  static HiveJsonSerDe fromJson(Map<String, dynamic> json) => HiveJsonSerDe();
}

/// Specifies the deserializer you want to use to convert the format of the
/// input data.
class InputFormatConfiguration {
  /// Specifies which deserializer to use. You can choose either the Apache Hive
  /// JSON SerDe or the OpenX JSON SerDe. If both are non-null, the server
  /// rejects the request.
  final Deserializer deserializer;

  InputFormatConfiguration({
    this.deserializer,
  });
  static InputFormatConfiguration fromJson(Map<String, dynamic> json) =>
      InputFormatConfiguration();
}

/// Describes an encryption key for a destination in Amazon S3.
class KmsEncryptionConfig {
  /// The Amazon Resource Name (ARN) of the encryption key. Must belong to the
  /// same AWS Region as the destination Amazon S3 bucket. For more information,
  /// see
  /// [Amazon Resource Names (ARNs) and AWS Service Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html).
  final String awskmsKeyArn;

  KmsEncryptionConfig({
    @required this.awskmsKeyArn,
  });
  static KmsEncryptionConfig fromJson(Map<String, dynamic> json) =>
      KmsEncryptionConfig();
}

/// The stream and role Amazon Resource Names (ARNs) for a Kinesis data stream
/// used as the source for a delivery stream.
class KinesisStreamSourceConfiguration {
  /// The ARN of the source Kinesis data stream. For more information, see
  /// [Amazon Kinesis Data Streams ARN Format](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-kinesis-streams).
  final String kinesisStreamArn;

  /// The ARN of the role that provides access to the source Kinesis data
  /// stream. For more information, see
  /// [AWS Identity and Access Management (IAM) ARN Format](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-iam).
  final String roleArn;

  KinesisStreamSourceConfiguration({
    @required this.kinesisStreamArn,
    @required this.roleArn,
  });
}

/// Details about a Kinesis data stream used as the source for a Kinesis Data
/// Firehose delivery stream.
class KinesisStreamSourceDescription {
  /// The Amazon Resource Name (ARN) of the source Kinesis data stream. For more
  /// information, see
  /// [Amazon Kinesis Data Streams ARN Format](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-kinesis-streams).
  final String kinesisStreamArn;

  /// The ARN of the role used by the source Kinesis data stream. For more
  /// information, see
  /// [AWS Identity and Access Management (IAM) ARN Format](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-iam).
  final String roleArn;

  /// Kinesis Data Firehose starts retrieving records from the Kinesis data
  /// stream starting with this timestamp.
  final DateTime deliveryStartTimestamp;

  KinesisStreamSourceDescription({
    this.kinesisStreamArn,
    this.roleArn,
    this.deliveryStartTimestamp,
  });
  static KinesisStreamSourceDescription fromJson(Map<String, dynamic> json) =>
      KinesisStreamSourceDescription();
}

class ListDeliveryStreamsOutput {
  /// The names of the delivery streams.
  final List<String> deliveryStreamNames;

  /// Indicates whether there are more delivery streams available to list.
  final bool hasMoreDeliveryStreams;

  ListDeliveryStreamsOutput({
    @required this.deliveryStreamNames,
    @required this.hasMoreDeliveryStreams,
  });
  static ListDeliveryStreamsOutput fromJson(Map<String, dynamic> json) =>
      ListDeliveryStreamsOutput();
}

class ListTagsForDeliveryStreamOutput {
  /// A list of tags associated with `DeliveryStreamName`, starting with the
  /// first tag after `ExclusiveStartTagKey` and up to the specified `Limit`.
  final List<Tag> tags;

  /// If this is `true` in the response, more tags are available. To list the
  /// remaining tags, set `ExclusiveStartTagKey` to the key of the last tag
  /// returned and call `ListTagsForDeliveryStream` again.
  final bool hasMoreTags;

  ListTagsForDeliveryStreamOutput({
    @required this.tags,
    @required this.hasMoreTags,
  });
  static ListTagsForDeliveryStreamOutput fromJson(Map<String, dynamic> json) =>
      ListTagsForDeliveryStreamOutput();
}

/// The OpenX SerDe. Used by Kinesis Data Firehose for deserializing data, which
/// means converting it from the JSON format in preparation for serializing it
/// to the Parquet or ORC format. This is one of two deserializers you can
/// choose, depending on which one offers the functionality you need. The other
/// option is the native Hive / HCatalog JsonSerDe.
class OpenxJsonSerDe {
  /// When set to `true`, specifies that the names of the keys include dots and
  /// that you want Kinesis Data Firehose to replace them with underscores. This
  /// is useful because Apache Hive does not allow dots in column names. For
  /// example, if the JSON contains a key whose name is "a.b", you can define
  /// the column name to be "a_b" when using this option.
  ///
  /// The default is `false`.
  final bool convertDotsInJsonKeysToUnderscores;

  /// When set to `true`, which is the default, Kinesis Data Firehose converts
  /// JSON keys to lowercase before deserializing them.
  final bool caseInsensitive;

  /// Maps column names to JSON keys that aren't identical to the column names.
  /// This is useful when the JSON contains keys that are Hive keywords. For
  /// example, `timestamp` is a Hive keyword. If you have a JSON key named
  /// `timestamp`, set this parameter to `{"ts": "timestamp"}` to map this key
  /// to a column named `ts`.
  final Map<String, String> columnToJsonKeyMappings;

  OpenxJsonSerDe({
    this.convertDotsInJsonKeysToUnderscores,
    this.caseInsensitive,
    this.columnToJsonKeyMappings,
  });
  static OpenxJsonSerDe fromJson(Map<String, dynamic> json) => OpenxJsonSerDe();
}

/// A serializer to use for converting data to the ORC format before storing it
/// in Amazon S3. For more information, see
/// [Apache ORC](https://orc.apache.org/docs/).
class OrcSerDe {
  /// The number of bytes in each stripe. The default is 64 MiB and the minimum
  /// is 8 MiB.
  final int stripeSizeBytes;

  /// The Hadoop Distributed File System (HDFS) block size. This is useful if
  /// you intend to copy the data from Amazon S3 to HDFS before querying. The
  /// default is 256 MiB and the minimum is 64 MiB. Kinesis Data Firehose uses
  /// this value for padding calculations.
  final int blockSizeBytes;

  /// The number of rows between index entries. The default is 10,000 and the
  /// minimum is 1,000.
  final int rowIndexStride;

  /// Set this to `true` to indicate that you want stripes to be padded to the
  /// HDFS block boundaries. This is useful if you intend to copy the data from
  /// Amazon S3 to HDFS before querying. The default is `false`.
  final bool enablePadding;

  /// A number between 0 and 1 that defines the tolerance for block padding as a
  /// decimal fraction of stripe size. The default value is 0.05, which means 5
  /// percent of stripe size.
  ///
  /// For the default values of 64 MiB ORC stripes and 256 MiB HDFS blocks, the
  /// default block padding tolerance of 5 percent reserves a maximum of 3.2 MiB
  /// for padding within the 256 MiB block. In such a case, if the available
  /// size within the block is more than 3.2 MiB, a new, smaller stripe is
  /// inserted to fit within that space. This ensures that no stripe crosses
  /// block boundaries and causes remote reads within a node-local task.
  ///
  /// Kinesis Data Firehose ignores this parameter when OrcSerDe$EnablePadding
  /// is `false`.
  final double paddingTolerance;

  /// The compression code to use over data blocks. The default is `SNAPPY`.
  final String compression;

  /// The column names for which you want Kinesis Data Firehose to create bloom
  /// filters. The default is `null`.
  final List<String> bloomFilterColumns;

  /// The Bloom filter false positive probability (FPP). The lower the FPP, the
  /// bigger the Bloom filter. The default value is 0.05, the minimum is 0, and
  /// the maximum is 1.
  final double bloomFilterFalsePositiveProbability;

  /// Represents the fraction of the total number of non-null rows. To turn off
  /// dictionary encoding, set this fraction to a number that is less than the
  /// number of distinct keys in a dictionary. To always use dictionary
  /// encoding, set this threshold to 1.
  final double dictionaryKeyThreshold;

  /// The version of the file to write. The possible values are `V0_11` and
  /// `V0_12`. The default is `V0_12`.
  final String formatVersion;

  OrcSerDe({
    this.stripeSizeBytes,
    this.blockSizeBytes,
    this.rowIndexStride,
    this.enablePadding,
    this.paddingTolerance,
    this.compression,
    this.bloomFilterColumns,
    this.bloomFilterFalsePositiveProbability,
    this.dictionaryKeyThreshold,
    this.formatVersion,
  });
  static OrcSerDe fromJson(Map<String, dynamic> json) => OrcSerDe();
}

/// Specifies the serializer that you want Kinesis Data Firehose to use to
/// convert the format of your data before it writes it to Amazon S3.
class OutputFormatConfiguration {
  /// Specifies which serializer to use. You can choose either the ORC SerDe or
  /// the Parquet SerDe. If both are non-null, the server rejects the request.
  final Serializer serializer;

  OutputFormatConfiguration({
    this.serializer,
  });
  static OutputFormatConfiguration fromJson(Map<String, dynamic> json) =>
      OutputFormatConfiguration();
}

/// A serializer to use for converting data to the Parquet format before storing
/// it in Amazon S3. For more information, see
/// [Apache Parquet](https://parquet.apache.org/documentation/latest/).
class ParquetSerDe {
  /// The Hadoop Distributed File System (HDFS) block size. This is useful if
  /// you intend to copy the data from Amazon S3 to HDFS before querying. The
  /// default is 256 MiB and the minimum is 64 MiB. Kinesis Data Firehose uses
  /// this value for padding calculations.
  final int blockSizeBytes;

  /// The Parquet page size. Column chunks are divided into pages. A page is
  /// conceptually an indivisible unit (in terms of compression and encoding).
  /// The minimum value is 64 KiB and the default is 1 MiB.
  final int pageSizeBytes;

  /// The compression code to use over data blocks. The possible values are
  /// `UNCOMPRESSED`, `SNAPPY`, and `GZIP`, with the default being `SNAPPY`. Use
  /// `SNAPPY` for higher decompression speed. Use `GZIP` if the compression
  /// ration is more important than speed.
  final String compression;

  /// Indicates whether to enable dictionary compression.
  final bool enableDictionaryCompression;

  /// The maximum amount of padding to apply. This is useful if you intend to
  /// copy the data from Amazon S3 to HDFS before querying. The default is 0.
  final int maxPaddingBytes;

  /// Indicates the version of row format to output. The possible values are
  /// `V1` and `V2`. The default is `V1`.
  final String writerVersion;

  ParquetSerDe({
    this.blockSizeBytes,
    this.pageSizeBytes,
    this.compression,
    this.enableDictionaryCompression,
    this.maxPaddingBytes,
    this.writerVersion,
  });
  static ParquetSerDe fromJson(Map<String, dynamic> json) => ParquetSerDe();
}

/// Describes a data processing configuration.
class ProcessingConfiguration {
  /// Enables or disables data processing.
  final bool enabled;

  /// The data processors.
  final List<Processor> processors;

  ProcessingConfiguration({
    this.enabled,
    this.processors,
  });
  static ProcessingConfiguration fromJson(Map<String, dynamic> json) =>
      ProcessingConfiguration();
}

/// Describes a data processor.
class Processor {
  /// The type of processor.
  final String type;

  /// The processor parameters.
  final List<ProcessorParameter> parameters;

  Processor({
    @required this.type,
    this.parameters,
  });
  static Processor fromJson(Map<String, dynamic> json) => Processor();
}

/// Describes the processor parameter.
class ProcessorParameter {
  /// The name of the parameter.
  final String parameterName;

  /// The parameter value.
  final String parameterValue;

  ProcessorParameter({
    @required this.parameterName,
    @required this.parameterValue,
  });
  static ProcessorParameter fromJson(Map<String, dynamic> json) =>
      ProcessorParameter();
}

class PutRecordBatchOutput {
  /// The number of records that might have failed processing. This number might
  /// be greater than 0 even if the PutRecordBatch call succeeds. Check
  /// `FailedPutCount` to determine whether there are records that you need to
  /// resend.
  final int failedPutCount;

  /// Indicates whether server-side encryption (SSE) was enabled during this
  /// operation.
  final bool encrypted;

  /// The results array. For each record, the index of the response element is
  /// the same as the index used in the request array.
  final List<PutRecordBatchResponseEntry> requestResponses;

  PutRecordBatchOutput({
    @required this.failedPutCount,
    this.encrypted,
    @required this.requestResponses,
  });
  static PutRecordBatchOutput fromJson(Map<String, dynamic> json) =>
      PutRecordBatchOutput();
}

/// Contains the result for an individual record from a PutRecordBatch request.
/// If the record is successfully added to your delivery stream, it receives a
/// record ID. If the record fails to be added to your delivery stream, the
/// result includes an error code and an error message.
class PutRecordBatchResponseEntry {
  /// The ID of the record.
  final String recordId;

  /// The error code for an individual record result.
  final String errorCode;

  /// The error message for an individual record result.
  final String errorMessage;

  PutRecordBatchResponseEntry({
    this.recordId,
    this.errorCode,
    this.errorMessage,
  });
  static PutRecordBatchResponseEntry fromJson(Map<String, dynamic> json) =>
      PutRecordBatchResponseEntry();
}

class PutRecordOutput {
  /// The ID of the record.
  final String recordId;

  /// Indicates whether server-side encryption (SSE) was enabled during this
  /// operation.
  final bool encrypted;

  PutRecordOutput({
    @required this.recordId,
    this.encrypted,
  });
  static PutRecordOutput fromJson(Map<String, dynamic> json) =>
      PutRecordOutput();
}

/// The unit of data in a delivery stream.
class Record {
  /// The data blob, which is base64-encoded when the blob is serialized. The
  /// maximum size of the data blob, before base64-encoding, is 1,000 KiB.
  final Uint8List data;

  Record({
    @required this.data,
  });
}

/// Describes the configuration of a destination in Amazon Redshift.
class RedshiftDestinationConfiguration {
  /// The Amazon Resource Name (ARN) of the AWS credentials. For more
  /// information, see
  /// [Amazon Resource Names (ARNs) and AWS Service Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html).
  final String roleArn;

  /// The database connection string.
  final String clusterJdbcurl;

  /// The `COPY` command.
  final CopyCommand copyCommand;

  /// The name of the user.
  final String username;

  /// The user password.
  final String password;

  /// The retry behavior in case Kinesis Data Firehose is unable to deliver
  /// documents to Amazon Redshift. Default value is 3600 (60 minutes).
  final RedshiftRetryOptions retryOptions;

  /// The configuration for the intermediate Amazon S3 location from which
  /// Amazon Redshift obtains data. Restrictions are described in the topic for
  /// CreateDeliveryStream.
  ///
  /// The compression formats `SNAPPY` or `ZIP` cannot be specified in
  /// `RedshiftDestinationConfiguration.S3Configuration` because the Amazon
  /// Redshift `COPY` operation that reads from the S3 bucket doesn't support
  /// these compression formats.
  final S3DestinationConfiguration s3Configuration;

  /// The data processing configuration.
  final ProcessingConfiguration processingConfiguration;

  /// The Amazon S3 backup mode.
  final String s3BackupMode;

  /// The configuration for backup in Amazon S3.
  final S3DestinationConfiguration s3BackupConfiguration;

  /// The CloudWatch logging options for your delivery stream.
  final CloudWatchLoggingOptions cloudWatchLoggingOptions;

  RedshiftDestinationConfiguration({
    @required this.roleArn,
    @required this.clusterJdbcurl,
    @required this.copyCommand,
    @required this.username,
    @required this.password,
    this.retryOptions,
    @required this.s3Configuration,
    this.processingConfiguration,
    this.s3BackupMode,
    this.s3BackupConfiguration,
    this.cloudWatchLoggingOptions,
  });
}

/// Describes a destination in Amazon Redshift.
class RedshiftDestinationDescription {
  /// The Amazon Resource Name (ARN) of the AWS credentials. For more
  /// information, see
  /// [Amazon Resource Names (ARNs) and AWS Service Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html).
  final String roleArn;

  /// The database connection string.
  final String clusterJdbcurl;

  /// The `COPY` command.
  final CopyCommand copyCommand;

  /// The name of the user.
  final String username;

  /// The retry behavior in case Kinesis Data Firehose is unable to deliver
  /// documents to Amazon Redshift. Default value is 3600 (60 minutes).
  final RedshiftRetryOptions retryOptions;

  /// The Amazon S3 destination.
  final S3DestinationDescription s3DestinationDescription;

  /// The data processing configuration.
  final ProcessingConfiguration processingConfiguration;

  /// The Amazon S3 backup mode.
  final String s3BackupMode;

  /// The configuration for backup in Amazon S3.
  final S3DestinationDescription s3BackupDescription;

  /// The Amazon CloudWatch logging options for your delivery stream.
  final CloudWatchLoggingOptions cloudWatchLoggingOptions;

  RedshiftDestinationDescription({
    @required this.roleArn,
    @required this.clusterJdbcurl,
    @required this.copyCommand,
    @required this.username,
    this.retryOptions,
    @required this.s3DestinationDescription,
    this.processingConfiguration,
    this.s3BackupMode,
    this.s3BackupDescription,
    this.cloudWatchLoggingOptions,
  });
  static RedshiftDestinationDescription fromJson(Map<String, dynamic> json) =>
      RedshiftDestinationDescription();
}

/// Describes an update for a destination in Amazon Redshift.
class RedshiftDestinationUpdate {
  /// The Amazon Resource Name (ARN) of the AWS credentials. For more
  /// information, see
  /// [Amazon Resource Names (ARNs) and AWS Service Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html).
  final String roleArn;

  /// The database connection string.
  final String clusterJdbcurl;

  /// The `COPY` command.
  final CopyCommand copyCommand;

  /// The name of the user.
  final String username;

  /// The user password.
  final String password;

  /// The retry behavior in case Kinesis Data Firehose is unable to deliver
  /// documents to Amazon Redshift. Default value is 3600 (60 minutes).
  final RedshiftRetryOptions retryOptions;

  /// The Amazon S3 destination.
  ///
  /// The compression formats `SNAPPY` or `ZIP` cannot be specified in
  /// `RedshiftDestinationUpdate.S3Update` because the Amazon Redshift `COPY`
  /// operation that reads from the S3 bucket doesn't support these compression
  /// formats.
  final S3DestinationUpdate s3Update;

  /// The data processing configuration.
  final ProcessingConfiguration processingConfiguration;

  /// The Amazon S3 backup mode.
  final String s3BackupMode;

  /// The Amazon S3 destination for backup.
  final S3DestinationUpdate s3BackupUpdate;

  /// The Amazon CloudWatch logging options for your delivery stream.
  final CloudWatchLoggingOptions cloudWatchLoggingOptions;

  RedshiftDestinationUpdate({
    this.roleArn,
    this.clusterJdbcurl,
    this.copyCommand,
    this.username,
    this.password,
    this.retryOptions,
    this.s3Update,
    this.processingConfiguration,
    this.s3BackupMode,
    this.s3BackupUpdate,
    this.cloudWatchLoggingOptions,
  });
}

/// Configures retry behavior in case Kinesis Data Firehose is unable to deliver
/// documents to Amazon Redshift.
class RedshiftRetryOptions {
  /// The length of time during which Kinesis Data Firehose retries delivery
  /// after a failure, starting from the initial request and including the first
  /// attempt. The default value is 3600 seconds (60 minutes). Kinesis Data
  /// Firehose does not retry if the value of `DurationInSeconds` is 0 (zero) or
  /// if the first delivery attempt takes longer than the current value.
  final int durationInSeconds;

  RedshiftRetryOptions({
    this.durationInSeconds,
  });
  static RedshiftRetryOptions fromJson(Map<String, dynamic> json) =>
      RedshiftRetryOptions();
}

/// Describes the configuration of a destination in Amazon S3.
class S3DestinationConfiguration {
  /// The Amazon Resource Name (ARN) of the AWS credentials. For more
  /// information, see
  /// [Amazon Resource Names (ARNs) and AWS Service Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html).
  final String roleArn;

  /// The ARN of the S3 bucket. For more information, see
  /// [Amazon Resource Names (ARNs) and AWS Service Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html).
  final String bucketArn;

  /// The "YYYY/MM/DD/HH" time format prefix is automatically used for delivered
  /// Amazon S3 files. You can specify an extra prefix to be added in front of
  /// the time format prefix. If the prefix ends with a slash, it appears as a
  /// folder in the S3 bucket. For more information, see
  /// [Amazon S3 Object Name Format](http://docs.aws.amazon.com/firehose/latest/dev/basic-deliver.html#s3-object-name)
  /// in the _Amazon Kinesis Data Firehose Developer Guide_.
  final String prefix;

  /// A prefix that Kinesis Data Firehose evaluates and adds to failed records
  /// before writing them to S3. This prefix appears immediately following the
  /// bucket name.
  final String errorOutputPrefix;

  /// The buffering option. If no value is specified, `BufferingHints` object
  /// default values are used.
  final BufferingHints bufferingHints;

  /// The compression format. If no value is specified, the default is
  /// `UNCOMPRESSED`.
  ///
  /// The compression formats `SNAPPY` or `ZIP` cannot be specified for Amazon
  /// Redshift destinations because they are not supported by the Amazon
  /// Redshift `COPY` operation that reads from the S3 bucket.
  final String compressionFormat;

  /// The encryption configuration. If no value is specified, the default is no
  /// encryption.
  final EncryptionConfiguration encryptionConfiguration;

  /// The CloudWatch logging options for your delivery stream.
  final CloudWatchLoggingOptions cloudWatchLoggingOptions;

  S3DestinationConfiguration({
    @required this.roleArn,
    @required this.bucketArn,
    this.prefix,
    this.errorOutputPrefix,
    this.bufferingHints,
    this.compressionFormat,
    this.encryptionConfiguration,
    this.cloudWatchLoggingOptions,
  });
}

/// Describes a destination in Amazon S3.
class S3DestinationDescription {
  /// The Amazon Resource Name (ARN) of the AWS credentials. For more
  /// information, see
  /// [Amazon Resource Names (ARNs) and AWS Service Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html).
  final String roleArn;

  /// The ARN of the S3 bucket. For more information, see
  /// [Amazon Resource Names (ARNs) and AWS Service Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html).
  final String bucketArn;

  /// The "YYYY/MM/DD/HH" time format prefix is automatically used for delivered
  /// Amazon S3 files. You can specify an extra prefix to be added in front of
  /// the time format prefix. If the prefix ends with a slash, it appears as a
  /// folder in the S3 bucket. For more information, see
  /// [Amazon S3 Object Name Format](http://docs.aws.amazon.com/firehose/latest/dev/basic-deliver.html#s3-object-name)
  /// in the _Amazon Kinesis Data Firehose Developer Guide_.
  final String prefix;

  /// A prefix that Kinesis Data Firehose evaluates and adds to failed records
  /// before writing them to S3. This prefix appears immediately following the
  /// bucket name.
  final String errorOutputPrefix;

  /// The buffering option. If no value is specified, `BufferingHints` object
  /// default values are used.
  final BufferingHints bufferingHints;

  /// The compression format. If no value is specified, the default is
  /// `UNCOMPRESSED`.
  final String compressionFormat;

  /// The encryption configuration. If no value is specified, the default is no
  /// encryption.
  final EncryptionConfiguration encryptionConfiguration;

  /// The Amazon CloudWatch logging options for your delivery stream.
  final CloudWatchLoggingOptions cloudWatchLoggingOptions;

  S3DestinationDescription({
    @required this.roleArn,
    @required this.bucketArn,
    this.prefix,
    this.errorOutputPrefix,
    @required this.bufferingHints,
    @required this.compressionFormat,
    @required this.encryptionConfiguration,
    this.cloudWatchLoggingOptions,
  });
  static S3DestinationDescription fromJson(Map<String, dynamic> json) =>
      S3DestinationDescription();
}

/// Describes an update for a destination in Amazon S3.
class S3DestinationUpdate {
  /// The Amazon Resource Name (ARN) of the AWS credentials. For more
  /// information, see
  /// [Amazon Resource Names (ARNs) and AWS Service Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html).
  final String roleArn;

  /// The ARN of the S3 bucket. For more information, see
  /// [Amazon Resource Names (ARNs) and AWS Service Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html).
  final String bucketArn;

  /// The "YYYY/MM/DD/HH" time format prefix is automatically used for delivered
  /// Amazon S3 files. You can specify an extra prefix to be added in front of
  /// the time format prefix. If the prefix ends with a slash, it appears as a
  /// folder in the S3 bucket. For more information, see
  /// [Amazon S3 Object Name Format](http://docs.aws.amazon.com/firehose/latest/dev/basic-deliver.html#s3-object-name)
  /// in the _Amazon Kinesis Data Firehose Developer Guide_.
  final String prefix;

  /// A prefix that Kinesis Data Firehose evaluates and adds to failed records
  /// before writing them to S3. This prefix appears immediately following the
  /// bucket name.
  final String errorOutputPrefix;

  /// The buffering option. If no value is specified, `BufferingHints` object
  /// default values are used.
  final BufferingHints bufferingHints;

  /// The compression format. If no value is specified, the default is
  /// `UNCOMPRESSED`.
  ///
  /// The compression formats `SNAPPY` or `ZIP` cannot be specified for Amazon
  /// Redshift destinations because they are not supported by the Amazon
  /// Redshift `COPY` operation that reads from the S3 bucket.
  final String compressionFormat;

  /// The encryption configuration. If no value is specified, the default is no
  /// encryption.
  final EncryptionConfiguration encryptionConfiguration;

  /// The CloudWatch logging options for your delivery stream.
  final CloudWatchLoggingOptions cloudWatchLoggingOptions;

  S3DestinationUpdate({
    this.roleArn,
    this.bucketArn,
    this.prefix,
    this.errorOutputPrefix,
    this.bufferingHints,
    this.compressionFormat,
    this.encryptionConfiguration,
    this.cloudWatchLoggingOptions,
  });
}

/// Specifies the schema to which you want Kinesis Data Firehose to configure
/// your data before it writes it to Amazon S3.
class SchemaConfiguration {
  /// The role that Kinesis Data Firehose can use to access AWS Glue. This role
  /// must be in the same account you use for Kinesis Data Firehose.
  /// Cross-account roles aren't allowed.
  final String roleArn;

  /// The ID of the AWS Glue Data Catalog. If you don't supply this, the AWS
  /// account ID is used by default.
  final String catalogId;

  /// Specifies the name of the AWS Glue database that contains the schema for
  /// the output data.
  final String databaseName;

  /// Specifies the AWS Glue table that contains the column information that
  /// constitutes your data schema.
  final String tableName;

  /// If you don't specify an AWS Region, the default is the current Region.
  final String region;

  /// Specifies the table version for the output data schema. If you don't
  /// specify this version ID, or if you set it to `LATEST`, Kinesis Data
  /// Firehose uses the most recent version. This means that any updates to the
  /// table are automatically picked up.
  final String versionId;

  SchemaConfiguration({
    this.roleArn,
    this.catalogId,
    this.databaseName,
    this.tableName,
    this.region,
    this.versionId,
  });
  static SchemaConfiguration fromJson(Map<String, dynamic> json) =>
      SchemaConfiguration();
}

/// The serializer that you want Kinesis Data Firehose to use to convert data to
/// the target format before writing it to Amazon S3. Kinesis Data Firehose
/// supports two types of serializers: the
/// [ORC SerDe](https://hive.apache.org/javadocs/r1.2.2/api/org/apache/hadoop/hive/ql/io/orc/OrcSerde.html)
/// and the
/// [Parquet SerDe](https://hive.apache.org/javadocs/r1.2.2/api/org/apache/hadoop/hive/ql/io/parquet/serde/ParquetHiveSerDe.html).
class Serializer {
  /// A serializer to use for converting data to the Parquet format before
  /// storing it in Amazon S3. For more information, see
  /// [Apache Parquet](https://parquet.apache.org/documentation/latest/).
  final ParquetSerDe parquetSerDe;

  /// A serializer to use for converting data to the ORC format before storing
  /// it in Amazon S3. For more information, see
  /// [Apache ORC](https://orc.apache.org/docs/).
  final OrcSerDe orcSerDe;

  Serializer({
    this.parquetSerDe,
    this.orcSerDe,
  });
  static Serializer fromJson(Map<String, dynamic> json) => Serializer();
}

/// Details about a Kinesis data stream used as the source for a Kinesis Data
/// Firehose delivery stream.
class SourceDescription {
  /// The KinesisStreamSourceDescription value for the source Kinesis data
  /// stream.
  final KinesisStreamSourceDescription kinesisStreamSourceDescription;

  SourceDescription({
    this.kinesisStreamSourceDescription,
  });
  static SourceDescription fromJson(Map<String, dynamic> json) =>
      SourceDescription();
}

/// Describes the configuration of a destination in Splunk.
class SplunkDestinationConfiguration {
  /// The HTTP Event Collector (HEC) endpoint to which Kinesis Data Firehose
  /// sends your data.
  final String hecEndpoint;

  /// This type can be either "Raw" or "Event."
  final String hecEndpointType;

  /// This is a GUID that you obtain from your Splunk cluster when you create a
  /// new HEC endpoint.
  final String hecToken;

  /// The amount of time that Kinesis Data Firehose waits to receive an
  /// acknowledgment from Splunk after it sends it data. At the end of the
  /// timeout period, Kinesis Data Firehose either tries to send the data again
  /// or considers it an error, based on your retry settings.
  final int hecAcknowledgmentTimeoutInSeconds;

  /// The retry behavior in case Kinesis Data Firehose is unable to deliver data
  /// to Splunk, or if it doesn't receive an acknowledgment of receipt from
  /// Splunk.
  final SplunkRetryOptions retryOptions;

  /// Defines how documents should be delivered to Amazon S3. When set to
  /// `FailedDocumentsOnly`, Kinesis Data Firehose writes any data that could
  /// not be indexed to the configured Amazon S3 destination. When set to
  /// `AllDocuments`, Kinesis Data Firehose delivers all incoming records to
  /// Amazon S3, and also writes failed documents to Amazon S3. Default value is
  /// `FailedDocumentsOnly`.
  final String s3BackupMode;

  /// The configuration for the backup Amazon S3 location.
  final S3DestinationConfiguration s3Configuration;

  /// The data processing configuration.
  final ProcessingConfiguration processingConfiguration;

  /// The Amazon CloudWatch logging options for your delivery stream.
  final CloudWatchLoggingOptions cloudWatchLoggingOptions;

  SplunkDestinationConfiguration({
    @required this.hecEndpoint,
    @required this.hecEndpointType,
    @required this.hecToken,
    this.hecAcknowledgmentTimeoutInSeconds,
    this.retryOptions,
    this.s3BackupMode,
    @required this.s3Configuration,
    this.processingConfiguration,
    this.cloudWatchLoggingOptions,
  });
}

/// Describes a destination in Splunk.
class SplunkDestinationDescription {
  /// The HTTP Event Collector (HEC) endpoint to which Kinesis Data Firehose
  /// sends your data.
  final String hecEndpoint;

  /// This type can be either "Raw" or "Event."
  final String hecEndpointType;

  /// A GUID you obtain from your Splunk cluster when you create a new HEC
  /// endpoint.
  final String hecToken;

  /// The amount of time that Kinesis Data Firehose waits to receive an
  /// acknowledgment from Splunk after it sends it data. At the end of the
  /// timeout period, Kinesis Data Firehose either tries to send the data again
  /// or considers it an error, based on your retry settings.
  final int hecAcknowledgmentTimeoutInSeconds;

  /// The retry behavior in case Kinesis Data Firehose is unable to deliver data
  /// to Splunk or if it doesn't receive an acknowledgment of receipt from
  /// Splunk.
  final SplunkRetryOptions retryOptions;

  /// Defines how documents should be delivered to Amazon S3. When set to
  /// `FailedDocumentsOnly`, Kinesis Data Firehose writes any data that could
  /// not be indexed to the configured Amazon S3 destination. When set to
  /// `AllDocuments`, Kinesis Data Firehose delivers all incoming records to
  /// Amazon S3, and also writes failed documents to Amazon S3. Default value is
  /// `FailedDocumentsOnly`.
  final String s3BackupMode;

  /// The Amazon S3 destination.>
  final S3DestinationDescription s3DestinationDescription;

  /// The data processing configuration.
  final ProcessingConfiguration processingConfiguration;

  /// The Amazon CloudWatch logging options for your delivery stream.
  final CloudWatchLoggingOptions cloudWatchLoggingOptions;

  SplunkDestinationDescription({
    this.hecEndpoint,
    this.hecEndpointType,
    this.hecToken,
    this.hecAcknowledgmentTimeoutInSeconds,
    this.retryOptions,
    this.s3BackupMode,
    this.s3DestinationDescription,
    this.processingConfiguration,
    this.cloudWatchLoggingOptions,
  });
  static SplunkDestinationDescription fromJson(Map<String, dynamic> json) =>
      SplunkDestinationDescription();
}

/// Describes an update for a destination in Splunk.
class SplunkDestinationUpdate {
  /// The HTTP Event Collector (HEC) endpoint to which Kinesis Data Firehose
  /// sends your data.
  final String hecEndpoint;

  /// This type can be either "Raw" or "Event."
  final String hecEndpointType;

  /// A GUID that you obtain from your Splunk cluster when you create a new HEC
  /// endpoint.
  final String hecToken;

  /// The amount of time that Kinesis Data Firehose waits to receive an
  /// acknowledgment from Splunk after it sends data. At the end of the timeout
  /// period, Kinesis Data Firehose either tries to send the data again or
  /// considers it an error, based on your retry settings.
  final int hecAcknowledgmentTimeoutInSeconds;

  /// The retry behavior in case Kinesis Data Firehose is unable to deliver data
  /// to Splunk or if it doesn't receive an acknowledgment of receipt from
  /// Splunk.
  final SplunkRetryOptions retryOptions;

  /// Defines how documents should be delivered to Amazon S3. When set to
  /// `FailedDocumentsOnly`, Kinesis Data Firehose writes any data that could
  /// not be indexed to the configured Amazon S3 destination. When set to
  /// `AllDocuments`, Kinesis Data Firehose delivers all incoming records to
  /// Amazon S3, and also writes failed documents to Amazon S3. Default value is
  /// `FailedDocumentsOnly`.
  final String s3BackupMode;

  /// Your update to the configuration of the backup Amazon S3 location.
  final S3DestinationUpdate s3Update;

  /// The data processing configuration.
  final ProcessingConfiguration processingConfiguration;

  /// The Amazon CloudWatch logging options for your delivery stream.
  final CloudWatchLoggingOptions cloudWatchLoggingOptions;

  SplunkDestinationUpdate({
    this.hecEndpoint,
    this.hecEndpointType,
    this.hecToken,
    this.hecAcknowledgmentTimeoutInSeconds,
    this.retryOptions,
    this.s3BackupMode,
    this.s3Update,
    this.processingConfiguration,
    this.cloudWatchLoggingOptions,
  });
}

/// Configures retry behavior in case Kinesis Data Firehose is unable to deliver
/// documents to Splunk, or if it doesn't receive an acknowledgment from Splunk.
class SplunkRetryOptions {
  /// The total amount of time that Kinesis Data Firehose spends on retries.
  /// This duration starts after the initial attempt to send data to Splunk
  /// fails. It doesn't include the periods during which Kinesis Data Firehose
  /// waits for acknowledgment from Splunk after each attempt.
  final int durationInSeconds;

  SplunkRetryOptions({
    this.durationInSeconds,
  });
  static SplunkRetryOptions fromJson(Map<String, dynamic> json) =>
      SplunkRetryOptions();
}

class StartDeliveryStreamEncryptionOutput {
  StartDeliveryStreamEncryptionOutput();
  static StartDeliveryStreamEncryptionOutput fromJson(
          Map<String, dynamic> json) =>
      StartDeliveryStreamEncryptionOutput();
}

class StopDeliveryStreamEncryptionOutput {
  StopDeliveryStreamEncryptionOutput();
  static StopDeliveryStreamEncryptionOutput fromJson(
          Map<String, dynamic> json) =>
      StopDeliveryStreamEncryptionOutput();
}

/// Metadata that you can assign to a delivery stream, consisting of a key-value
/// pair.
class Tag {
  /// A unique identifier for the tag. Maximum length: 128 characters. Valid
  /// characters: Unicode letters, digits, white space, _ . / = + - % @
  final String key;

  /// An optional string, which you can use to describe or define the tag.
  /// Maximum length: 256 characters. Valid characters: Unicode letters, digits,
  /// white space, _ . / = + - % @
  final String value;

  Tag({
    @required this.key,
    this.value,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag();
}

class TagDeliveryStreamOutput {
  TagDeliveryStreamOutput();
  static TagDeliveryStreamOutput fromJson(Map<String, dynamic> json) =>
      TagDeliveryStreamOutput();
}

class UntagDeliveryStreamOutput {
  UntagDeliveryStreamOutput();
  static UntagDeliveryStreamOutput fromJson(Map<String, dynamic> json) =>
      UntagDeliveryStreamOutput();
}

class UpdateDestinationOutput {
  UpdateDestinationOutput();
  static UpdateDestinationOutput fromJson(Map<String, dynamic> json) =>
      UpdateDestinationOutput();
}
