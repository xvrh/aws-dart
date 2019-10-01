import 'package:meta/meta.dart';

class KinesisVideoApi {
  /// Creates a new Kinesis video stream.
  ///
  /// When you create a new stream, Kinesis Video Streams assigns it a version
  /// number. When you change the stream's metadata, Kinesis Video Streams
  /// updates the version.
  ///
  ///  `CreateStream` is an asynchronous operation.
  ///
  /// For information about how the service works, see
  /// [How it Works](https://docs.aws.amazon.com/kinesisvideostreams/latest/dg/how-it-works.html).
  ///
  /// You must have permissions for the `KinesisVideo:CreateStream` action.
  ///
  /// [deviceName]: The name of the device that is writing to the stream.
  ///
  ///
  ///
  /// In the current implementation, Kinesis Video Streams does not use this
  /// name.
  ///
  /// [streamName]: A name for the stream that you are creating.
  ///
  /// The stream name is an identifier for the stream, and must be unique for
  /// each account and region.
  ///
  /// [mediaType]: The media type of the stream. Consumers of the stream can use
  /// this information when processing the stream. For more information about
  /// media types, see
  /// [Media Types](http://www.iana.org/assignments/media-types/media-types.xhtml).
  /// If you choose to specify the `MediaType`, see
  /// [Naming Requirements](https://tools.ietf.org/html/rfc6838#section-4.2) for
  /// guidelines.
  ///
  /// This parameter is optional; the default value is `null` (or empty in
  /// JSON).
  ///
  /// [kmsKeyId]: The ID of the AWS Key Management Service (AWS KMS) key that
  /// you want Kinesis Video Streams to use to encrypt stream data.
  ///
  /// If no key ID is specified, the default, Kinesis Video-managed key
  /// (`aws/kinesisvideo`) is used.
  ///
  ///  For more information, see
  /// [DescribeKey](https://docs.aws.amazon.com/kms/latest/APIReference/API_DescribeKey.html#API_DescribeKey_RequestParameters).
  ///
  /// [dataRetentionInHours]: The number of hours that you want to retain the
  /// data in the stream. Kinesis Video Streams retains the data in a data store
  /// that is associated with the stream.
  ///
  /// The default value is 0, indicating that the stream does not persist data.
  ///
  /// When the `DataRetentionInHours` value is 0, consumers can still consume
  /// the fragments that remain in the service host buffer, which has a
  /// retention time limit of 5 minutes and a retention memory limit of 200 MB.
  /// Fragments are removed from the buffer when either limit is reached.
  ///
  /// [tags]: A list of tags to associate with the specified stream. Each tag is
  /// a key-value pair (the value is optional).
  Future<CreateStreamOutput> createStream(String streamName,
      {String deviceName,
      String mediaType,
      String kmsKeyId,
      int dataRetentionInHours,
      Map<String, String> tags}) async {
    return CreateStreamOutput.fromJson({});
  }

  /// Deletes a Kinesis video stream and the data contained in the stream.
  ///
  /// This method marks the stream for deletion, and makes the data in the
  /// stream inaccessible immediately.
  ///
  ///  To ensure that you have the latest version of the stream before deleting
  /// it, you can specify the stream version. Kinesis Video Streams assigns a
  /// version to each stream. When you update a stream, Kinesis Video Streams
  /// assigns a new version number. To get the latest stream version, use the
  /// `DescribeStream` API.
  ///
  /// This operation requires permission for the `KinesisVideo:DeleteStream`
  /// action.
  ///
  /// [streamArn]: The Amazon Resource Name (ARN) of the stream that you want to
  /// delete.
  ///
  /// [currentVersion]: Optional: The version of the stream that you want to
  /// delete.
  ///
  /// Specify the version as a safeguard to ensure that your are deleting the
  /// correct stream. To get the stream version, use the `DescribeStream` API.
  ///
  /// If not specified, only the `CreationTime` is checked before deleting the
  /// stream.
  Future<DeleteStreamOutput> deleteStream(String streamArn,
      {String currentVersion}) async {
    return DeleteStreamOutput.fromJson({});
  }

  /// Returns the most current information about the specified stream. You must
  /// specify either the `StreamName` or the `StreamARN`.
  ///
  /// [streamName]: The name of the stream.
  ///
  /// [streamArn]: The Amazon Resource Name (ARN) of the stream.
  Future<DescribeStreamOutput> describeStream(
      {String streamName, String streamArn}) async {
    return DescribeStreamOutput.fromJson({});
  }

  /// Gets an endpoint for a specified stream for either reading or writing. Use
  /// this endpoint in your application to read from the specified stream (using
  /// the `GetMedia` or `GetMediaForFragmentList` operations) or write to it
  /// (using the `PutMedia` operation).
  ///
  ///  The returned endpoint does not have the API name appended. The client
  /// needs to add the API name to the returned endpoint.
  ///
  /// In the request, specify the stream either by `StreamName` or `StreamARN`.
  ///
  /// [streamName]: The name of the stream that you want to get the endpoint
  /// for. You must specify either this parameter or a `StreamARN` in the
  /// request.
  ///
  /// [streamArn]: The Amazon Resource Name (ARN) of the stream that you want to
  /// get the endpoint for. You must specify either this parameter or a
  /// `StreamName` in the request.
  ///
  /// [apiName]: The name of the API action for which to get an endpoint.
  Future<GetDataEndpointOutput> getDataEndpoint(String apiName,
      {String streamName, String streamArn}) async {
    return GetDataEndpointOutput.fromJson({});
  }

  /// Returns an array of `StreamInfo` objects. Each object describes a stream.
  /// To retrieve only streams that satisfy a specific condition, you can
  /// specify a `StreamNameCondition`.
  ///
  /// [maxResults]: The maximum number of streams to return in the response. The
  /// default is 10,000.
  ///
  /// [nextToken]: If you specify this parameter, when the result of a
  /// `ListStreams` operation is truncated, the call returns the `NextToken` in
  /// the response. To get another batch of streams, provide this token in your
  /// next request.
  ///
  /// [streamNameCondition]: Optional: Returns only streams that satisfy a
  /// specific condition. Currently, you can specify only the prefix of a stream
  /// name as a condition.
  Future<ListStreamsOutput> listStreams(
      {int maxResults,
      String nextToken,
      StreamNameCondition streamNameCondition}) async {
    return ListStreamsOutput.fromJson({});
  }

  /// Returns a list of tags associated with the specified stream.
  ///
  /// In the request, you must specify either the `StreamName` or the
  /// `StreamARN`.
  ///
  /// [nextToken]: If you specify this parameter and the result of a
  /// `ListTagsForStream` call is truncated, the response includes a token that
  /// you can use in the next request to fetch the next batch of tags.
  ///
  /// [streamArn]: The Amazon Resource Name (ARN) of the stream that you want to
  /// list tags for.
  ///
  /// [streamName]: The name of the stream that you want to list tags for.
  Future<ListTagsForStreamOutput> listTagsForStream(
      {String nextToken, String streamArn, String streamName}) async {
    return ListTagsForStreamOutput.fromJson({});
  }

  /// Adds one or more tags to a stream. A _tag_ is a key-value pair (the value
  /// is optional) that you can define and assign to AWS resources. If you
  /// specify a tag that already exists, the tag value is replaced with the
  /// value that you specify in the request. For more information, see
  /// [Using Cost Allocation Tags](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html)
  /// in the _AWS Billing and Cost Management User Guide_.
  ///
  /// You must provide either the `StreamName` or the `StreamARN`.
  ///
  /// This operation requires permission for the `KinesisVideo:TagStream`
  /// action.
  ///
  /// Kinesis video streams support up to 50 tags.
  ///
  /// [streamArn]: The Amazon Resource Name (ARN) of the resource that you want
  /// to add the tag or tags to.
  ///
  /// [streamName]: The name of the stream that you want to add the tag or tags
  /// to.
  ///
  /// [tags]: A list of tags to associate with the specified stream. Each tag is
  /// a key-value pair (the value is optional).
  Future<TagStreamOutput> tagStream(Map<String, String> tags,
      {String streamArn, String streamName}) async {
    return TagStreamOutput.fromJson({});
  }

  /// Removes one or more tags from a stream. In the request, specify only a tag
  /// key or keys; don't specify the value. If you specify a tag key that does
  /// not exist, it's ignored.
  ///
  /// In the request, you must provide the `StreamName` or `StreamARN`.
  ///
  /// [streamArn]: The Amazon Resource Name (ARN) of the stream that you want to
  /// remove tags from.
  ///
  /// [streamName]: The name of the stream that you want to remove tags from.
  ///
  /// [tagKeyList]: A list of the keys of the tags that you want to remove.
  Future<UntagStreamOutput> untagStream(List<String> tagKeyList,
      {String streamArn, String streamName}) async {
    return UntagStreamOutput.fromJson({});
  }

  ///  Increases or decreases the stream's data retention period by the value
  /// that you specify. To indicate whether you want to increase or decrease the
  /// data retention period, specify the `Operation` parameter in the request
  /// body. In the request, you must specify either the `StreamName` or the
  /// `StreamARN`.
  ///
  ///  The retention period that you specify replaces the current value.
  ///
  /// This operation requires permission for the
  /// `KinesisVideo:UpdateDataRetention` action.
  ///
  /// Changing the data retention period affects the data in the stream as
  /// follows:
  ///
  /// *   If the data retention period is increased, existing data is retained
  /// for the new retention period. For example, if the data retention period is
  /// increased from one hour to seven hours, all existing data is retained for
  /// seven hours.
  ///
  /// *   If the data retention period is decreased, existing data is retained
  /// for the new retention period. For example, if the data retention period is
  /// decreased from seven hours to one hour, all existing data is retained for
  /// one hour, and any data older than one hour is deleted immediately.
  ///
  /// [streamName]: The name of the stream whose retention period you want to
  /// change.
  ///
  /// [streamArn]: The Amazon Resource Name (ARN) of the stream whose retention
  /// period you want to change.
  ///
  /// [currentVersion]: The version of the stream whose retention period you
  /// want to change. To get the version, call either the `DescribeStream` or
  /// the `ListStreams` API.
  ///
  /// [operation]: Indicates whether you want to increase or decrease the
  /// retention period.
  ///
  /// [dataRetentionChangeInHours]: The retention period, in hours. The value
  /// you specify replaces the current value. The maximum value for this
  /// parameter is 87600 (ten years).
  Future<UpdateDataRetentionOutput> updateDataRetention(
      {String streamName,
      String streamArn,
      @required String currentVersion,
      @required String operation,
      @required int dataRetentionChangeInHours}) async {
    return UpdateDataRetentionOutput.fromJson({});
  }

  /// Updates stream metadata, such as the device name and media type.
  ///
  /// You must provide the stream name or the Amazon Resource Name (ARN) of the
  /// stream.
  ///
  /// To make sure that you have the latest version of the stream before
  /// updating it, you can specify the stream version. Kinesis Video Streams
  /// assigns a version to each stream. When you update a stream, Kinesis Video
  /// Streams assigns a new version number. To get the latest stream version,
  /// use the `DescribeStream` API.
  ///
  ///  `UpdateStream` is an asynchronous operation, and takes time to complete.
  ///
  /// [streamName]: The name of the stream whose metadata you want to update.
  ///
  /// The stream name is an identifier for the stream, and must be unique for
  /// each account and region.
  ///
  /// [streamArn]: The ARN of the stream whose metadata you want to update.
  ///
  /// [currentVersion]: The version of the stream whose metadata you want to
  /// update.
  ///
  /// [deviceName]: The name of the device that is writing to the stream.
  ///
  ///   In the current implementation, Kinesis Video Streams does not use this
  /// name.
  ///
  /// [mediaType]: The stream's media type. Use `MediaType` to specify the type
  /// of content that the stream contains to the consumers of the stream. For
  /// more information about media types, see
  /// [Media Types](http://www.iana.org/assignments/media-types/media-types.xhtml).
  /// If you choose to specify the `MediaType`, see
  /// [Naming Requirements](https://tools.ietf.org/html/rfc6838#section-4.2).
  ///
  /// To play video on the console, you must specify the correct video type. For
  /// example, if the video in the stream is H.264, specify `video/h264` as the
  /// `MediaType`.
  Future<UpdateStreamOutput> updateStream(String currentVersion,
      {String streamName,
      String streamArn,
      String deviceName,
      String mediaType}) async {
    return UpdateStreamOutput.fromJson({});
  }
}

class CreateStreamOutput {
  /// The Amazon Resource Name (ARN) of the stream.
  final String streamArn;

  CreateStreamOutput({
    this.streamArn,
  });
  static CreateStreamOutput fromJson(Map<String, dynamic> json) =>
      CreateStreamOutput();
}

class DeleteStreamOutput {
  DeleteStreamOutput();
  static DeleteStreamOutput fromJson(Map<String, dynamic> json) =>
      DeleteStreamOutput();
}

class DescribeStreamOutput {
  /// An object that describes the stream.
  final StreamInfo streamInfo;

  DescribeStreamOutput({
    this.streamInfo,
  });
  static DescribeStreamOutput fromJson(Map<String, dynamic> json) =>
      DescribeStreamOutput();
}

class GetDataEndpointOutput {
  /// The endpoint value. To read data from the stream or to write data to it,
  /// specify this endpoint in your application.
  final String dataEndpoint;

  GetDataEndpointOutput({
    this.dataEndpoint,
  });
  static GetDataEndpointOutput fromJson(Map<String, dynamic> json) =>
      GetDataEndpointOutput();
}

class ListStreamsOutput {
  /// An array of `StreamInfo` objects.
  final List<StreamInfo> streamInfoList;

  /// If the response is truncated, the call returns this element with a token.
  /// To get the next batch of streams, use this token in your next request.
  final String nextToken;

  ListStreamsOutput({
    this.streamInfoList,
    this.nextToken,
  });
  static ListStreamsOutput fromJson(Map<String, dynamic> json) =>
      ListStreamsOutput();
}

class ListTagsForStreamOutput {
  /// If you specify this parameter and the result of a `ListTags` call is
  /// truncated, the response includes a token that you can use in the next
  /// request to fetch the next set of tags.
  final String nextToken;

  /// A map of tag keys and values associated with the specified stream.
  final Map<String, String> tags;

  ListTagsForStreamOutput({
    this.nextToken,
    this.tags,
  });
  static ListTagsForStreamOutput fromJson(Map<String, dynamic> json) =>
      ListTagsForStreamOutput();
}

/// An object describing a Kinesis video stream.
class StreamInfo {
  /// The name of the device that is associated with the stream.
  final String deviceName;

  /// The name of the stream.
  final String streamName;

  /// The Amazon Resource Name (ARN) of the stream.
  final String streamArn;

  /// The `MediaType` of the stream.
  final String mediaType;

  /// The ID of the AWS Key Management Service (AWS KMS) key that Kinesis Video
  /// Streams uses to encrypt data on the stream.
  final String kmsKeyId;

  /// The version of the stream.
  final String version;

  /// The status of the stream.
  final String status;

  /// A time stamp that indicates when the stream was created.
  final DateTime creationTime;

  /// How long the stream retains data, in hours.
  final int dataRetentionInHours;

  StreamInfo({
    this.deviceName,
    this.streamName,
    this.streamArn,
    this.mediaType,
    this.kmsKeyId,
    this.version,
    this.status,
    this.creationTime,
    this.dataRetentionInHours,
  });
  static StreamInfo fromJson(Map<String, dynamic> json) => StreamInfo();
}

/// Specifies the condition that streams must satisfy to be returned when you
/// list streams (see the `ListStreams` API). A condition has a comparison
/// operation and a value. Currently, you can specify only the `BEGINS_WITH`
/// operator, which finds streams whose names start with a given prefix.
class StreamNameCondition {
  /// A comparison operator. Currently, you can specify only the `BEGINS_WITH`
  /// operator, which finds streams whose names start with a given prefix.
  final String comparisonOperator;

  /// A value to compare.
  final String comparisonValue;

  StreamNameCondition({
    this.comparisonOperator,
    this.comparisonValue,
  });
}

class TagStreamOutput {
  TagStreamOutput();
  static TagStreamOutput fromJson(Map<String, dynamic> json) =>
      TagStreamOutput();
}

class UntagStreamOutput {
  UntagStreamOutput();
  static UntagStreamOutput fromJson(Map<String, dynamic> json) =>
      UntagStreamOutput();
}

class UpdateDataRetentionOutput {
  UpdateDataRetentionOutput();
  static UpdateDataRetentionOutput fromJson(Map<String, dynamic> json) =>
      UpdateDataRetentionOutput();
}

class UpdateStreamOutput {
  UpdateStreamOutput();
  static UpdateStreamOutput fromJson(Map<String, dynamic> json) =>
      UpdateStreamOutput();
}
