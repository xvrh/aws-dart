import 'package:meta/meta.dart';

/// Amazon DynamoDB
///
/// Amazon DynamoDB Streams provides API actions for accessing streams and
/// processing stream records. To learn more about application development with
/// Streams, see [Capturing Table Activity with DynamoDB
/// Streams](http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Streams.html)
/// in the Amazon DynamoDB Developer Guide.
class DynamoDBStreamsApi {
  /// Returns information about a stream, including the current status of the
  /// stream, its Amazon Resource Name (ARN), the composition of its shards, and
  /// its corresponding DynamoDB table.
  ///
  ///  You can call `DescribeStream` at a maximum rate of 10 times per second.
  ///
  /// Each shard in the stream has a `SequenceNumberRange` associated with it.
  /// If the `SequenceNumberRange` has a `StartingSequenceNumber` but no
  /// `EndingSequenceNumber`, then the shard is still open (able to receive more
  /// stream records). If both `StartingSequenceNumber` and
  /// `EndingSequenceNumber` are present, then that shard is closed and can no
  /// longer receive more data.
  Future<void> describeStream(String streamArn,
      {int limit, String exclusiveStartShardId}) async {}

  /// Retrieves the stream records from a given shard.
  ///
  /// Specify a shard iterator using the `ShardIterator` parameter. The shard
  /// iterator specifies the position in the shard from which you want to start
  /// reading stream records sequentially. If there are no stream records
  /// available in the portion of the shard that the iterator points to,
  /// `GetRecords` returns an empty list. Note that it might take multiple calls
  /// to get to a portion of the shard that contains stream records.
  ///
  ///   `GetRecords` can retrieve a maximum of 1 MB of data or 1000 stream
  /// records, whichever comes first.
  Future<void> getRecords(String shardIterator, {int limit}) async {}

  /// Returns a shard iterator. A shard iterator provides information about how
  /// to retrieve the stream records from within a shard. Use the shard iterator
  /// in a subsequent `GetRecords` request to read the stream records from the
  /// shard.
  ///
  ///
  ///
  /// A shard iterator expires 15 minutes after it is returned to the requester.
  Future<void> getShardIterator(
      {@required String streamArn,
      @required String shardId,
      @required String shardIteratorType,
      String sequenceNumber}) async {}

  /// Returns an array of stream ARNs associated with the current account and
  /// endpoint. If the `TableName` parameter is present, then `ListStreams` will
  /// return only the streams ARNs for that table.
  ///
  ///
  ///
  /// You can call `ListStreams` at a maximum rate of 5 times per second.
  Future<void> listStreams(
      {String tableName, int limit, String exclusiveStartStreamArn}) async {}
}

class AttributeValue {}

class DescribeStreamOutput {}

class GetRecordsOutput {}

class GetShardIteratorOutput {}

class Identity {}

class KeySchemaElement {}

class ListStreamsOutput {}

class Record {}

class SequenceNumberRange {}

class Shard {}

class Stream {}

class StreamDescription {}

class StreamRecord {}
