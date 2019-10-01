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
  /// For information about how the service works, see [How it
  /// Works](https://docs.aws.amazon.com/kinesisvideostreams/latest/dg/how-it-works.html).
  ///
  /// You must have permissions for the `KinesisVideo:CreateStream` action.
  Future<void> createStream(String streamName,
      {String deviceName,
      String mediaType,
      String kmsKeyId,
      int dataRetentionInHours,
      Map<String, String> tags}) async {}

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
  Future<void> deleteStream(String streamArn, {String currentVersion}) async {}

  /// Returns the most current information about the specified stream. You must
  /// specify either the `StreamName` or the `StreamARN`.
  Future<void> describeStream({String streamName, String streamArn}) async {}

  /// Gets an endpoint for a specified stream for either reading or writing. Use
  /// this endpoint in your application to read from the specified stream (using
  /// the `GetMedia` or `GetMediaForFragmentList` operations) or write to it
  /// (using the `PutMedia` operation).
  ///
  ///  The returned endpoint does not have the API name appended. The client
  /// needs to add the API name to the returned endpoint.
  ///
  /// In the request, specify the stream either by `StreamName` or `StreamARN`.
  Future<void> getDataEndpoint(String apiName,
      {String streamName, String streamArn}) async {}

  /// Returns an array of `StreamInfo` objects. Each object describes a stream.
  /// To retrieve only streams that satisfy a specific condition, you can
  /// specify a `StreamNameCondition`.
  Future<void> listStreams(
      {int maxResults,
      String nextToken,
      StreamNameCondition streamNameCondition}) async {}

  /// Returns a list of tags associated with the specified stream.
  ///
  /// In the request, you must specify either the `StreamName` or the
  /// `StreamARN`.
  Future<void> listTagsForStream(
      {String nextToken, String streamArn, String streamName}) async {}

  /// Adds one or more tags to a stream. A _tag_ is a key-value pair (the value
  /// is optional) that you can define and assign to AWS resources. If you
  /// specify a tag that already exists, the tag value is replaced with the
  /// value that you specify in the request. For more information, see [Using
  /// Cost Allocation
  /// Tags](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html)
  /// in the _AWS Billing and Cost Management User Guide_.
  ///
  /// You must provide either the `StreamName` or the `StreamARN`.
  ///
  /// This operation requires permission for the `KinesisVideo:TagStream`
  /// action.
  ///
  /// Kinesis video streams support up to 50 tags.
  Future<void> tagStream(Map<String, String> tags,
      {String streamArn, String streamName}) async {}

  /// Removes one or more tags from a stream. In the request, specify only a tag
  /// key or keys; don't specify the value. If you specify a tag key that does
  /// not exist, it's ignored.
  ///
  /// In the request, you must provide the `StreamName` or `StreamARN`.
  Future<void> untagStream(List<String> tagKeyList,
      {String streamArn, String streamName}) async {}

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
  Future<void> updateDataRetention(
      {String streamName,
      String streamArn,
      @required String currentVersion,
      @required String operation,
      @required int dataRetentionChangeInHours}) async {}

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
  Future<void> updateStream(String currentVersion,
      {String streamName,
      String streamArn,
      String deviceName,
      String mediaType}) async {}
}

class CreateStreamOutput {}

class DeleteStreamOutput {}

class DescribeStreamOutput {}

class GetDataEndpointOutput {}

class ListStreamsOutput {}

class ListTagsForStreamOutput {}

class StreamInfo {}

class StreamNameCondition {}

class TagStreamOutput {}

class UntagStreamOutput {}

class UpdateDataRetentionOutput {}

class UpdateStreamOutput {}
