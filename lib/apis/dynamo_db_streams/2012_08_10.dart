import 'package:meta/meta.dart';
import 'dart:typed_data';

/// Amazon DynamoDB
///
/// Amazon DynamoDB Streams provides API actions for accessing streams and
/// processing stream records. To learn more about application development with
/// Streams, see
/// [Capturing Table Activity with DynamoDB Streams](http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Streams.html)
/// in the Amazon DynamoDB Developer Guide.
class DynamoDBStreamsApi {
  final _client;
  DynamoDBStreamsApi(client)
      : _client = client.configured('DynamoDB Streams', serializer: 'json');

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
  ///
  /// [streamArn]: The Amazon Resource Name (ARN) for the stream.
  ///
  /// [limit]: The maximum number of shard objects to return. The upper limit is
  /// 100.
  ///
  /// [exclusiveStartShardId]: The shard ID of the first item that this
  /// operation will evaluate. Use the value that was returned for
  /// `LastEvaluatedShardId` in the previous operation.
  Future<DescribeStreamOutput> describeStream(String streamArn,
      {int limit, String exclusiveStartShardId}) async {
    var response_ = await _client.send('DescribeStream', {
      'StreamArn': streamArn,
      if (limit != null) 'Limit': limit,
      if (exclusiveStartShardId != null)
        'ExclusiveStartShardId': exclusiveStartShardId,
    });
    return DescribeStreamOutput.fromJson(response_);
  }

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
  ///
  /// [shardIterator]: A shard iterator that was retrieved from a previous
  /// GetShardIterator operation. This iterator can be used to access the stream
  /// records in this shard.
  ///
  /// [limit]: The maximum number of records to return from the shard. The upper
  /// limit is 1000.
  Future<GetRecordsOutput> getRecords(String shardIterator, {int limit}) async {
    var response_ = await _client.send('GetRecords', {
      'ShardIterator': shardIterator,
      if (limit != null) 'Limit': limit,
    });
    return GetRecordsOutput.fromJson(response_);
  }

  /// Returns a shard iterator. A shard iterator provides information about how
  /// to retrieve the stream records from within a shard. Use the shard iterator
  /// in a subsequent `GetRecords` request to read the stream records from the
  /// shard.
  ///
  ///
  ///
  /// A shard iterator expires 15 minutes after it is returned to the requester.
  ///
  /// [streamArn]: The Amazon Resource Name (ARN) for the stream.
  ///
  /// [shardId]: The identifier of the shard. The iterator will be returned for
  /// this shard ID.
  ///
  /// [shardIteratorType]: Determines how the shard iterator is used to start
  /// reading stream records from the shard:
  ///
  /// *    `AT_SEQUENCE_NUMBER` - Start reading exactly from the position
  /// denoted by a specific sequence number.
  ///
  /// *    `AFTER_SEQUENCE_NUMBER` - Start reading right after the position
  /// denoted by a specific sequence number.
  ///
  /// *    `TRIM_HORIZON` - Start reading at the last (untrimmed) stream record,
  /// which is the oldest record in the shard. In DynamoDB Streams, there is a
  /// 24 hour limit on data retention. Stream records whose age exceeds this
  /// limit are subject to removal (trimming) from the stream.
  ///
  /// *    `LATEST` - Start reading just after the most recent stream record in
  /// the shard, so that you always read the most recent data in the shard.
  ///
  /// [sequenceNumber]: The sequence number of a stream record in the shard from
  /// which to start reading.
  Future<GetShardIteratorOutput> getShardIterator(
      {@required String streamArn,
      @required String shardId,
      @required String shardIteratorType,
      String sequenceNumber}) async {
    var response_ = await _client.send('GetShardIterator', {
      'StreamArn': streamArn,
      'ShardId': shardId,
      'ShardIteratorType': shardIteratorType,
      if (sequenceNumber != null) 'SequenceNumber': sequenceNumber,
    });
    return GetShardIteratorOutput.fromJson(response_);
  }

  /// Returns an array of stream ARNs associated with the current account and
  /// endpoint. If the `TableName` parameter is present, then `ListStreams` will
  /// return only the streams ARNs for that table.
  ///
  ///
  ///
  /// You can call `ListStreams` at a maximum rate of 5 times per second.
  ///
  /// [tableName]: If this parameter is provided, then only the streams
  /// associated with this table name are returned.
  ///
  /// [limit]: The maximum number of streams to return. The upper limit is 100.
  ///
  /// [exclusiveStartStreamArn]: The ARN (Amazon Resource Name) of the first
  /// item that this operation will evaluate. Use the value that was returned
  /// for `LastEvaluatedStreamArn` in the previous operation.
  Future<ListStreamsOutput> listStreams(
      {String tableName, int limit, String exclusiveStartStreamArn}) async {
    var response_ = await _client.send('ListStreams', {
      if (tableName != null) 'TableName': tableName,
      if (limit != null) 'Limit': limit,
      if (exclusiveStartStreamArn != null)
        'ExclusiveStartStreamArn': exclusiveStartStreamArn,
    });
    return ListStreamsOutput.fromJson(response_);
  }
}

/// Represents the data for an attribute. You can set one, and only one, of the
/// elements.
///
/// Each attribute in an item is a name-value pair. An attribute can be
/// single-valued or multi-valued set. For example, a book item can have title
/// and authors attributes. Each book has one title but can have many authors.
/// The multi-valued attribute is a set; duplicate values are not allowed.
class AttributeValue {
  /// A String data type.
  final String s;

  /// A Number data type.
  final String n;

  /// A Binary data type.
  final Uint8List b;

  /// A String Set data type.
  final List<String> ss;

  /// A Number Set data type.
  final List<String> ns;

  /// A Binary Set data type.
  final List<Uint8List> bs;

  /// A Map data type.
  final Map<String, AttributeValue> m;

  /// A List data type.
  final List<AttributeValue> l;

  /// A Null data type.
  final bool null$;

  /// A Boolean data type.
  final bool bool$;

  AttributeValue({
    this.s,
    this.n,
    this.b,
    this.ss,
    this.ns,
    this.bs,
    this.m,
    this.l,
    this.null$,
    this.bool$,
  });
  static AttributeValue fromJson(Map<String, dynamic> json) => AttributeValue(
        s: json.containsKey('S') ? json['S'] as String : null,
        n: json.containsKey('N') ? json['N'] as String : null,
        b: json.containsKey('B') ? Uint8List(json['B']) : null,
        ss: json.containsKey('SS')
            ? (json['SS'] as List).map((e) => e as String).toList()
            : null,
        ns: json.containsKey('NS')
            ? (json['NS'] as List).map((e) => e as String).toList()
            : null,
        bs: json.containsKey('BS')
            ? (json['BS'] as List).map((e) => Uint8List(e)).toList()
            : null,
        m: json.containsKey('M')
            ? (json['M'] as Map).map(
                (k, v) => MapEntry(k as String, AttributeValue.fromJson(v)))
            : null,
        l: json.containsKey('L')
            ? (json['L'] as List)
                .map((e) => AttributeValue.fromJson(e))
                .toList()
            : null,
        null$: json.containsKey('NULL') ? json['NULL'] as bool : null,
        bool$: json.containsKey('BOOL') ? json['BOOL'] as bool : null,
      );
}

/// Represents the output of a `DescribeStream` operation.
class DescribeStreamOutput {
  /// A complete description of the stream, including its creation date and
  /// time, the DynamoDB table associated with the stream, the shard IDs within
  /// the stream, and the beginning and ending sequence numbers of stream
  /// records within the shards.
  final StreamDescription streamDescription;

  DescribeStreamOutput({
    this.streamDescription,
  });
  static DescribeStreamOutput fromJson(Map<String, dynamic> json) =>
      DescribeStreamOutput(
        streamDescription: json.containsKey('StreamDescription')
            ? StreamDescription.fromJson(json['StreamDescription'])
            : null,
      );
}

/// Represents the output of a `GetRecords` operation.
class GetRecordsOutput {
  /// The stream records from the shard, which were retrieved using the shard
  /// iterator.
  final List<Record> records;

  /// The next position in the shard from which to start sequentially reading
  /// stream records. If set to `null`, the shard has been closed and the
  /// requested iterator will not return any more data.
  final String nextShardIterator;

  GetRecordsOutput({
    this.records,
    this.nextShardIterator,
  });
  static GetRecordsOutput fromJson(Map<String, dynamic> json) =>
      GetRecordsOutput(
        records: json.containsKey('Records')
            ? (json['Records'] as List).map((e) => Record.fromJson(e)).toList()
            : null,
        nextShardIterator: json.containsKey('NextShardIterator')
            ? json['NextShardIterator'] as String
            : null,
      );
}

/// Represents the output of a `GetShardIterator` operation.
class GetShardIteratorOutput {
  /// The position in the shard from which to start reading stream records
  /// sequentially. A shard iterator specifies this position using the sequence
  /// number of a stream record in a shard.
  final String shardIterator;

  GetShardIteratorOutput({
    this.shardIterator,
  });
  static GetShardIteratorOutput fromJson(Map<String, dynamic> json) =>
      GetShardIteratorOutput(
        shardIterator: json.containsKey('ShardIterator')
            ? json['ShardIterator'] as String
            : null,
      );
}

/// Contains details about the type of identity that made the request.
class Identity {
  /// A unique identifier for the entity that made the call. For Time To Live,
  /// the principalId is "dynamodb.amazonaws.com".
  final String principalId;

  /// The type of the identity. For Time To Live, the type is "Service".
  final String type;

  Identity({
    this.principalId,
    this.type,
  });
  static Identity fromJson(Map<String, dynamic> json) => Identity(
        principalId: json.containsKey('PrincipalId')
            ? json['PrincipalId'] as String
            : null,
        type: json.containsKey('Type') ? json['Type'] as String : null,
      );
}

/// Represents _a single element_ of a key schema. A key schema specifies the
/// attributes that make up the primary key of a table, or the key attributes of
/// an index.
///
/// A `KeySchemaElement` represents exactly one attribute of the primary key.
/// For example, a simple primary key (partition key) would be represented by
/// one `KeySchemaElement`. A composite primary key (partition key and sort key)
/// would require one `KeySchemaElement` for the partition key, and another
/// `KeySchemaElement` for the sort key.
///
///
///
/// The partition key of an item is also known as its _hash attribute_. The term
/// "hash attribute" derives from DynamoDB's usage of an internal hash function
/// to evenly distribute data items across partitions, based on their partition
/// key values.
///
/// The sort key of an item is also known as its _range attribute_. The term
/// "range attribute" derives from the way DynamoDB stores items with the same
/// partition key physically close together, in sorted order by the sort key
/// value.
class KeySchemaElement {
  /// The name of a key attribute.
  final String attributeName;

  /// The attribute data, consisting of the data type and the attribute value
  /// itself.
  final String keyType;

  KeySchemaElement({
    @required this.attributeName,
    @required this.keyType,
  });
  static KeySchemaElement fromJson(Map<String, dynamic> json) =>
      KeySchemaElement(
        attributeName: json['AttributeName'] as String,
        keyType: json['KeyType'] as String,
      );
}

/// Represents the output of a `ListStreams` operation.
class ListStreamsOutput {
  /// A list of stream descriptors associated with the current account and
  /// endpoint.
  final List<Stream> streams;

  /// The stream ARN of the item where the operation stopped, inclusive of the
  /// previous result set. Use this value to start a new operation, excluding
  /// this value in the new request.
  ///
  /// If `LastEvaluatedStreamArn` is empty, then the "last page" of results has
  /// been processed and there is no more data to be retrieved.
  ///
  /// If `LastEvaluatedStreamArn` is not empty, it does not necessarily mean
  /// that there is more data in the result set. The only way to know when you
  /// have reached the end of the result set is when `LastEvaluatedStreamArn` is
  /// empty.
  final String lastEvaluatedStreamArn;

  ListStreamsOutput({
    this.streams,
    this.lastEvaluatedStreamArn,
  });
  static ListStreamsOutput fromJson(Map<String, dynamic> json) =>
      ListStreamsOutput(
        streams: json.containsKey('Streams')
            ? (json['Streams'] as List).map((e) => Stream.fromJson(e)).toList()
            : null,
        lastEvaluatedStreamArn: json.containsKey('LastEvaluatedStreamArn')
            ? json['LastEvaluatedStreamArn'] as String
            : null,
      );
}

/// A description of a unique event within a stream.
class Record {
  /// A globally unique identifier for the event that was recorded in this
  /// stream record.
  final String eventID;

  /// The type of data modification that was performed on the DynamoDB table:
  ///
  /// *    `INSERT` - a new item was added to the table.
  ///
  /// *    `MODIFY` - one or more of an existing item's attributes were
  /// modified.
  ///
  /// *    `REMOVE` - the item was deleted from the table
  final String eventName;

  /// The version number of the stream record format. This number is updated
  /// whenever the structure of `Record` is modified.
  ///
  /// Client applications must not assume that `eventVersion` will remain at a
  /// particular value, as this number is subject to change at any time. In
  /// general, `eventVersion` will only increase as the low-level DynamoDB
  /// Streams API evolves.
  final String eventVersion;

  /// The AWS service from which the stream record originated. For DynamoDB
  /// Streams, this is `aws:dynamodb`.
  final String eventSource;

  /// The region in which the `GetRecords` request was received.
  final String awsRegion;

  /// The main body of the stream record, containing all of the
  /// DynamoDB-specific fields.
  final StreamRecord dynamodb;

  /// Items that are deleted by the Time to Live process after expiration have
  /// the following fields:
  ///
  /// *   Records[].userIdentity.type
  ///
  ///     "Service"
  ///
  /// *   Records[].userIdentity.principalId
  ///
  ///     "dynamodb.amazonaws.com"
  final Identity userIdentity;

  Record({
    this.eventID,
    this.eventName,
    this.eventVersion,
    this.eventSource,
    this.awsRegion,
    this.dynamodb,
    this.userIdentity,
  });
  static Record fromJson(Map<String, dynamic> json) => Record(
        eventID: json.containsKey('eventID') ? json['eventID'] as String : null,
        eventName:
            json.containsKey('eventName') ? json['eventName'] as String : null,
        eventVersion: json.containsKey('eventVersion')
            ? json['eventVersion'] as String
            : null,
        eventSource: json.containsKey('eventSource')
            ? json['eventSource'] as String
            : null,
        awsRegion:
            json.containsKey('awsRegion') ? json['awsRegion'] as String : null,
        dynamodb: json.containsKey('dynamodb')
            ? StreamRecord.fromJson(json['dynamodb'])
            : null,
        userIdentity: json.containsKey('userIdentity')
            ? Identity.fromJson(json['userIdentity'])
            : null,
      );
}

/// The beginning and ending sequence numbers for the stream records contained
/// within a shard.
class SequenceNumberRange {
  /// The first sequence number.
  final String startingSequenceNumber;

  /// The last sequence number.
  final String endingSequenceNumber;

  SequenceNumberRange({
    this.startingSequenceNumber,
    this.endingSequenceNumber,
  });
  static SequenceNumberRange fromJson(Map<String, dynamic> json) =>
      SequenceNumberRange(
        startingSequenceNumber: json.containsKey('StartingSequenceNumber')
            ? json['StartingSequenceNumber'] as String
            : null,
        endingSequenceNumber: json.containsKey('EndingSequenceNumber')
            ? json['EndingSequenceNumber'] as String
            : null,
      );
}

/// A uniquely identified group of stream records within a stream.
class Shard {
  /// The system-generated identifier for this shard.
  final String shardId;

  /// The range of possible sequence numbers for the shard.
  final SequenceNumberRange sequenceNumberRange;

  /// The shard ID of the current shard's parent.
  final String parentShardId;

  Shard({
    this.shardId,
    this.sequenceNumberRange,
    this.parentShardId,
  });
  static Shard fromJson(Map<String, dynamic> json) => Shard(
        shardId: json.containsKey('ShardId') ? json['ShardId'] as String : null,
        sequenceNumberRange: json.containsKey('SequenceNumberRange')
            ? SequenceNumberRange.fromJson(json['SequenceNumberRange'])
            : null,
        parentShardId: json.containsKey('ParentShardId')
            ? json['ParentShardId'] as String
            : null,
      );
}

/// Represents all of the data describing a particular stream.
class Stream {
  /// The Amazon Resource Name (ARN) for the stream.
  final String streamArn;

  /// The DynamoDB table with which the stream is associated.
  final String tableName;

  /// A timestamp, in ISO 8601 format, for this stream.
  ///
  /// Note that `LatestStreamLabel` is not a unique identifier for the stream,
  /// because it is possible that a stream from another table might have the
  /// same timestamp. However, the combination of the following three elements
  /// is guaranteed to be unique:
  ///
  /// *   the AWS customer ID.
  ///
  /// *   the table name
  ///
  /// *   the `StreamLabel`
  final String streamLabel;

  Stream({
    this.streamArn,
    this.tableName,
    this.streamLabel,
  });
  static Stream fromJson(Map<String, dynamic> json) => Stream(
        streamArn:
            json.containsKey('StreamArn') ? json['StreamArn'] as String : null,
        tableName:
            json.containsKey('TableName') ? json['TableName'] as String : null,
        streamLabel: json.containsKey('StreamLabel')
            ? json['StreamLabel'] as String
            : null,
      );
}

/// Represents all of the data describing a particular stream.
class StreamDescription {
  /// The Amazon Resource Name (ARN) for the stream.
  final String streamArn;

  /// A timestamp, in ISO 8601 format, for this stream.
  ///
  /// Note that `LatestStreamLabel` is not a unique identifier for the stream,
  /// because it is possible that a stream from another table might have the
  /// same timestamp. However, the combination of the following three elements
  /// is guaranteed to be unique:
  ///
  /// *   the AWS customer ID.
  ///
  /// *   the table name
  ///
  /// *   the `StreamLabel`
  final String streamLabel;

  /// Indicates the current status of the stream:
  ///
  /// *    `ENABLING` - Streams is currently being enabled on the DynamoDB
  /// table.
  ///
  /// *    `ENABLED` - the stream is enabled.
  ///
  /// *    `DISABLING` - Streams is currently being disabled on the DynamoDB
  /// table.
  ///
  /// *    `DISABLED` - the stream is disabled.
  final String streamStatus;

  /// Indicates the format of the records within this stream:
  ///
  /// *    `KEYS_ONLY` - only the key attributes of items that were modified in
  /// the DynamoDB table.
  ///
  /// *    `NEW_IMAGE` - entire items from the table, as they appeared after
  /// they were modified.
  ///
  /// *    `OLD_IMAGE` - entire items from the table, as they appeared before
  /// they were modified.
  ///
  /// *    `NEW_AND_OLD_IMAGES` - both the new and the old images of the items
  /// from the table.
  final String streamViewType;

  /// The date and time when the request to create this stream was issued.
  final DateTime creationRequestDateTime;

  /// The DynamoDB table with which the stream is associated.
  final String tableName;

  /// The key attribute(s) of the stream's DynamoDB table.
  final List<KeySchemaElement> keySchema;

  /// The shards that comprise the stream.
  final List<Shard> shards;

  /// The shard ID of the item where the operation stopped, inclusive of the
  /// previous result set. Use this value to start a new operation, excluding
  /// this value in the new request.
  ///
  /// If `LastEvaluatedShardId` is empty, then the "last page" of results has
  /// been processed and there is currently no more data to be retrieved.
  ///
  /// If `LastEvaluatedShardId` is not empty, it does not necessarily mean that
  /// there is more data in the result set. The only way to know when you have
  /// reached the end of the result set is when `LastEvaluatedShardId` is empty.
  final String lastEvaluatedShardId;

  StreamDescription({
    this.streamArn,
    this.streamLabel,
    this.streamStatus,
    this.streamViewType,
    this.creationRequestDateTime,
    this.tableName,
    this.keySchema,
    this.shards,
    this.lastEvaluatedShardId,
  });
  static StreamDescription fromJson(Map<String, dynamic> json) =>
      StreamDescription(
        streamArn:
            json.containsKey('StreamArn') ? json['StreamArn'] as String : null,
        streamLabel: json.containsKey('StreamLabel')
            ? json['StreamLabel'] as String
            : null,
        streamStatus: json.containsKey('StreamStatus')
            ? json['StreamStatus'] as String
            : null,
        streamViewType: json.containsKey('StreamViewType')
            ? json['StreamViewType'] as String
            : null,
        creationRequestDateTime: json.containsKey('CreationRequestDateTime')
            ? DateTime.parse(json['CreationRequestDateTime'])
            : null,
        tableName:
            json.containsKey('TableName') ? json['TableName'] as String : null,
        keySchema: json.containsKey('KeySchema')
            ? (json['KeySchema'] as List)
                .map((e) => KeySchemaElement.fromJson(e))
                .toList()
            : null,
        shards: json.containsKey('Shards')
            ? (json['Shards'] as List).map((e) => Shard.fromJson(e)).toList()
            : null,
        lastEvaluatedShardId: json.containsKey('LastEvaluatedShardId')
            ? json['LastEvaluatedShardId'] as String
            : null,
      );
}

/// A description of a single data modification that was performed on an item in
/// a DynamoDB table.
class StreamRecord {
  /// The approximate date and time when the stream record was created, in
  /// [UNIX epoch time](http://www.epochconverter.com/) format.
  final DateTime approximateCreationDateTime;

  /// The primary key attribute(s) for the DynamoDB item that was modified.
  final Map<String, AttributeValue> keys;

  /// The item in the DynamoDB table as it appeared after it was modified.
  final Map<String, AttributeValue> newImage;

  /// The item in the DynamoDB table as it appeared before it was modified.
  final Map<String, AttributeValue> oldImage;

  /// The sequence number of the stream record.
  final String sequenceNumber;

  /// The size of the stream record, in bytes.
  final BigInt sizeBytes;

  /// The type of data from the modified DynamoDB item that was captured in this
  /// stream record:
  ///
  /// *    `KEYS_ONLY` - only the key attributes of the modified item.
  ///
  /// *    `NEW_IMAGE` - the entire item, as it appeared after it was modified.
  ///
  /// *    `OLD_IMAGE` - the entire item, as it appeared before it was modified.
  ///
  /// *    `NEW_AND_OLD_IMAGES` - both the new and the old item images of the
  /// item.
  final String streamViewType;

  StreamRecord({
    this.approximateCreationDateTime,
    this.keys,
    this.newImage,
    this.oldImage,
    this.sequenceNumber,
    this.sizeBytes,
    this.streamViewType,
  });
  static StreamRecord fromJson(Map<String, dynamic> json) => StreamRecord(
        approximateCreationDateTime:
            json.containsKey('ApproximateCreationDateTime')
                ? DateTime.parse(json['ApproximateCreationDateTime'])
                : null,
        keys: json.containsKey('Keys')
            ? (json['Keys'] as Map).map(
                (k, v) => MapEntry(k as String, AttributeValue.fromJson(v)))
            : null,
        newImage: json.containsKey('NewImage')
            ? (json['NewImage'] as Map).map(
                (k, v) => MapEntry(k as String, AttributeValue.fromJson(v)))
            : null,
        oldImage: json.containsKey('OldImage')
            ? (json['OldImage'] as Map).map(
                (k, v) => MapEntry(k as String, AttributeValue.fromJson(v)))
            : null,
        sequenceNumber: json.containsKey('SequenceNumber')
            ? json['SequenceNumber'] as String
            : null,
        sizeBytes: json.containsKey('SizeBytes')
            ? BigInt.from(json['SizeBytes'])
            : null,
        streamViewType: json.containsKey('StreamViewType')
            ? json['StreamViewType'] as String
            : null,
      );
}
