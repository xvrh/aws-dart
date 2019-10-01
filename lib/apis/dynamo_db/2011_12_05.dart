import 'package:meta/meta.dart';
import 'dart:typed_data';

/// Amazon DynamoDB is a fast, highly scalable, highly available, cost-effective
/// non-relational database service.
///
/// Amazon DynamoDB removes traditional scalability limitations on data storage
/// while maintaining low latency and predictable performance.
class DynamoDBApi {
  final _client;
  DynamoDBApi(client)
      : _client = client.configured('DynamoDB', serializer: 'json');

  /// Retrieves the attributes for multiple items from multiple tables using
  /// their primary keys.
  ///
  /// The maximum number of item attributes that can be retrieved for a single
  /// operation is 100. Also, the number of items retrieved is constrained by a
  /// 1 MB the size limit. If the response size limit is exceeded or a partial
  /// result is returned due to an internal processing failure, Amazon DynamoDB
  /// returns an `UnprocessedKeys` value so you can retry the operation starting
  /// with the next item to get.
  ///
  /// Amazon DynamoDB automatically adjusts the number of items returned per
  /// page to enforce this limit. For example, even if you ask to retrieve 100
  /// items, but each individual item is 50k in size, the system returns 20
  /// items and an appropriate `UnprocessedKeys` value so you can get the next
  /// page of results. If necessary, your application needs its own logic to
  /// assemble the pages of results into one set.
  Future<BatchGetItemOutput> batchGetItem(
      Map<String, KeysAndAttributes> requestItems) async {
    var response_ = await _client.send('BatchGetItem', {
      'RequestItems': requestItems,
    });
    return BatchGetItemOutput.fromJson(response_);
  }

  /// Allows to execute a batch of Put and/or Delete Requests for many tables in
  /// a single call. A total of 25 requests are allowed.
  ///
  /// There are no transaction guarantees provided by this API. It does not
  /// allow conditional puts nor does it support return values.
  ///
  /// [requestItems]: A map of table name to list-of-write-requests. Used as
  /// input to the `BatchWriteItem` API call
  Future<BatchWriteItemOutput> batchWriteItem(
      Map<String, List<WriteRequest>> requestItems) async {
    var response_ = await _client.send('BatchWriteItem', {
      'RequestItems': requestItems,
    });
    return BatchWriteItemOutput.fromJson(response_);
  }

  /// Adds a new table to your account.
  ///
  /// The table name must be unique among those associated with the AWS Account
  /// issuing the request, and the AWS Region that receives the request (e.g.
  /// `us-east-1`).
  ///
  /// The `CreateTable` operation triggers an asynchronous workflow to begin
  /// creating the table. Amazon DynamoDB immediately returns the state of the
  /// table (`CREATING`) until the table is in the `ACTIVE` state. Once the
  /// table is in the `ACTIVE` state, you can perform data plane operations.
  ///
  /// [tableName]: The name of the table you want to create. Allowed characters
  /// are `a-z`, `A-Z`, `0-9`, `_` (underscore), `-` (hyphen) and `.` (period).
  Future<CreateTableOutput> createTable(
      {@required String tableName,
      @required KeySchema keySchema,
      @required ProvisionedThroughput provisionedThroughput}) async {
    var response_ = await _client.send('CreateTable', {
      'TableName': tableName,
      'KeySchema': keySchema,
      'ProvisionedThroughput': provisionedThroughput,
    });
    return CreateTableOutput.fromJson(response_);
  }

  /// Deletes a single item in a table by primary key.
  ///
  /// You can perform a conditional delete operation that deletes the item if it
  /// exists, or if it has an expected attribute value.
  ///
  /// [tableName]: The name of the table in which you want to delete an item.
  /// Allowed characters are `a-z`, `A-Z`, `0-9`, `_` (underscore), `-` (hyphen)
  /// and `.` (period).
  Future<DeleteItemOutput> deleteItem(
      {@required String tableName,
      @required Key key,
      Map<String, ExpectedAttributeValue> expected,
      String returnValues}) async {
    var response_ = await _client.send('DeleteItem', {
      'TableName': tableName,
      'Key': key,
      if (expected != null) 'Expected': expected,
      if (returnValues != null) 'ReturnValues': returnValues,
    });
    return DeleteItemOutput.fromJson(response_);
  }

  /// Deletes a table and all of its items.
  ///
  /// If the table is in the `ACTIVE` state, you can delete it. If a table is in
  /// `CREATING` or `UPDATING` states then Amazon DynamoDB returns a
  /// `ResourceInUseException`. If the specified table does not exist, Amazon
  /// DynamoDB returns a `ResourceNotFoundException`.
  ///
  /// [tableName]: The name of the table you want to delete. Allowed characters
  /// are `a-z`, `A-Z`, `0-9`, `_` (underscore), `-` (hyphen) and `.` (period).
  Future<DeleteTableOutput> deleteTable(String tableName) async {
    var response_ = await _client.send('DeleteTable', {
      'TableName': tableName,
    });
    return DeleteTableOutput.fromJson(response_);
  }

  /// Retrieves information about the table, including the current status of the
  /// table, the primary key schema and when the table was created.
  ///
  /// If the table does not exist, Amazon DynamoDB returns a
  /// `ResourceNotFoundException`.
  ///
  /// [tableName]: The name of the table you want to describe. Allowed
  /// characters are `a-z`, `A-Z`, `0-9`, `_` (underscore), `-` (hyphen) and `.`
  /// (period).
  Future<DescribeTableOutput> describeTable(String tableName) async {
    var response_ = await _client.send('DescribeTable', {
      'TableName': tableName,
    });
    return DescribeTableOutput.fromJson(response_);
  }

  /// Retrieves a set of Attributes for an item that matches the primary key.
  ///
  /// The `GetItem` operation provides an eventually-consistent read by default.
  /// If eventually-consistent reads are not acceptable for your application,
  /// use `ConsistentRead`. Although this operation might take longer than a
  /// standard read, it always returns the last updated value.
  ///
  /// [tableName]: The name of the table in which you want to get an item.
  /// Allowed characters are `a-z`, `A-Z`, `0-9`, `_` (underscore), `-` (hyphen)
  /// and `.` (period).
  Future<GetItemOutput> getItem(
      {@required String tableName,
      @required Key key,
      List<String> attributesToGet,
      bool consistentRead}) async {
    var response_ = await _client.send('GetItem', {
      'TableName': tableName,
      'Key': key,
      if (attributesToGet != null) 'AttributesToGet': attributesToGet,
      if (consistentRead != null) 'ConsistentRead': consistentRead,
    });
    return GetItemOutput.fromJson(response_);
  }

  /// Retrieves a paginated list of table names created by the AWS Account of
  /// the caller in the AWS Region (e.g. `us-east-1`).
  ///
  /// [exclusiveStartTableName]: The name of the table that starts the list. If
  /// you already ran a `ListTables` operation and received a
  /// `LastEvaluatedTableName` value in the response, use that value here to
  /// continue the list.
  Future<ListTablesOutput> listTables(
      {String exclusiveStartTableName, int limit}) async {
    var response_ = await _client.send('ListTables', {
      if (exclusiveStartTableName != null)
        'ExclusiveStartTableName': exclusiveStartTableName,
      if (limit != null) 'Limit': limit,
    });
    return ListTablesOutput.fromJson(response_);
  }

  /// Creates a new item, or replaces an old item with a new item (including all
  /// the attributes).
  ///
  /// If an item already exists in the specified table with the same primary
  /// key, the new item completely replaces the existing item. You can perform a
  /// conditional put (insert a new item if one with the specified primary key
  /// doesn't exist), or replace an existing item if it has certain attribute
  /// values.
  ///
  /// [tableName]: The name of the table in which you want to put an item.
  /// Allowed characters are `a-z`, `A-Z`, `0-9`, `_` (underscore), `-` (hyphen)
  /// and `.` (period).
  Future<PutItemOutput> putItem(
      {@required String tableName,
      @required Map<String, AttributeValue> item,
      Map<String, ExpectedAttributeValue> expected,
      String returnValues}) async {
    var response_ = await _client.send('PutItem', {
      'TableName': tableName,
      'Item': item,
      if (expected != null) 'Expected': expected,
      if (returnValues != null) 'ReturnValues': returnValues,
    });
    return PutItemOutput.fromJson(response_);
  }

  /// Gets the values of one or more items and its attributes by primary key
  /// (composite primary key, only).
  ///
  /// Narrow the scope of the query using comparison operators on the
  /// `RangeKeyValue` of the composite key. Use the `ScanIndexForward` parameter
  /// to get results in forward or reverse order by range key.
  ///
  /// [tableName]: The name of the table in which you want to query. Allowed
  /// characters are `a-z`, `A-Z`, `0-9`, `_` (underscore), `-` (hyphen) and `.`
  /// (period).
  ///
  /// [limit]: The maximum number of items to return. If Amazon DynamoDB hits
  /// this limit while querying the table, it stops the query and returns the
  /// matching values up to the limit, and a `LastEvaluatedKey` to apply in a
  /// subsequent operation to continue the query. Also, if the result set size
  /// exceeds 1MB before Amazon DynamoDB hits this limit, it stops the query and
  /// returns the matching values, and a `LastEvaluatedKey` to apply in a
  /// subsequent operation to continue the query.
  ///
  /// [count]: If set to `true`, Amazon DynamoDB returns a total number of items
  /// that match the query parameters, instead of a list of the matching items
  /// and their attributes. Do not set `Count` to `true` while providing a list
  /// of `AttributesToGet`, otherwise Amazon DynamoDB returns a validation
  /// error.
  ///
  /// [hashKeyValue]: Attribute value of the hash component of the composite
  /// primary key.
  ///
  /// [rangeKeyCondition]: A container for the attribute values and comparison
  /// operators to use for the query.
  ///
  /// [scanIndexForward]: Specifies forward or backward traversal of the index.
  /// Amazon DynamoDB returns results reflecting the requested order, determined
  /// by the range key. The default value is `true` (forward).
  ///
  /// [exclusiveStartKey]: Primary key of the item from which to continue an
  /// earlier query. An earlier query might provide this value as the
  /// `LastEvaluatedKey` if that query operation was interrupted before
  /// completing the query; either because of the result set size or the `Limit`
  /// parameter. The `LastEvaluatedKey` can be passed back in a new query
  /// request to continue the operation from that point.
  Future<QueryOutput> query(
      {@required String tableName,
      List<String> attributesToGet,
      int limit,
      bool consistentRead,
      bool count,
      @required AttributeValue hashKeyValue,
      Condition rangeKeyCondition,
      bool scanIndexForward,
      Key exclusiveStartKey}) async {
    var response_ = await _client.send('Query', {
      'TableName': tableName,
      if (attributesToGet != null) 'AttributesToGet': attributesToGet,
      if (limit != null) 'Limit': limit,
      if (consistentRead != null) 'ConsistentRead': consistentRead,
      if (count != null) 'Count': count,
      'HashKeyValue': hashKeyValue,
      if (rangeKeyCondition != null) 'RangeKeyCondition': rangeKeyCondition,
      if (scanIndexForward != null) 'ScanIndexForward': scanIndexForward,
      if (exclusiveStartKey != null) 'ExclusiveStartKey': exclusiveStartKey,
    });
    return QueryOutput.fromJson(response_);
  }

  /// Retrieves one or more items and its attributes by performing a full scan
  /// of a table.
  ///
  /// Provide a `ScanFilter` to get more specific results.
  ///
  /// [tableName]: The name of the table in which you want to scan. Allowed
  /// characters are `a-z`, `A-Z`, `0-9`, `_` (underscore), `-` (hyphen) and `.`
  /// (period).
  ///
  /// [limit]: The maximum number of items to return. If Amazon DynamoDB hits
  /// this limit while scanning the table, it stops the scan and returns the
  /// matching values up to the limit, and a `LastEvaluatedKey` to apply in a
  /// subsequent operation to continue the scan. Also, if the scanned data set
  /// size exceeds 1 MB before Amazon DynamoDB hits this limit, it stops the
  /// scan and returns the matching values up to the limit, and a
  /// `LastEvaluatedKey` to apply in a subsequent operation to continue the
  /// scan.
  ///
  /// [count]: If set to `true`, Amazon DynamoDB returns a total number of items
  /// for the `Scan` operation, even if the operation has no matching items for
  /// the assigned filter. Do not set `Count` to `true` while providing a list
  /// of `AttributesToGet`, otherwise Amazon DynamoDB returns a validation
  /// error.
  ///
  /// [scanFilter]: Evaluates the scan results and returns only the desired
  /// values.
  ///
  /// [exclusiveStartKey]: Primary key of the item from which to continue an
  /// earlier scan. An earlier scan might provide this value if that scan
  /// operation was interrupted before scanning the entire table; either because
  /// of the result set size or the `Limit` parameter. The `LastEvaluatedKey`
  /// can be passed back in a new scan request to continue the operation from
  /// that point.
  Future<ScanOutput> scan(String tableName,
      {List<String> attributesToGet,
      int limit,
      bool count,
      Map<String, Condition> scanFilter,
      Key exclusiveStartKey}) async {
    var response_ = await _client.send('Scan', {
      'TableName': tableName,
      if (attributesToGet != null) 'AttributesToGet': attributesToGet,
      if (limit != null) 'Limit': limit,
      if (count != null) 'Count': count,
      if (scanFilter != null) 'ScanFilter': scanFilter,
      if (exclusiveStartKey != null) 'ExclusiveStartKey': exclusiveStartKey,
    });
    return ScanOutput.fromJson(response_);
  }

  /// Edits an existing item's attributes.
  ///
  /// You can perform a conditional update (insert a new attribute name-value
  /// pair if it doesn't exist, or replace an existing name-value pair if it has
  /// certain expected attribute values).
  ///
  /// [tableName]: The name of the table in which you want to update an item.
  /// Allowed characters are `a-z`, `A-Z`, `0-9`, `_` (underscore), `-` (hyphen)
  /// and `.` (period).
  Future<UpdateItemOutput> updateItem(
      {@required String tableName,
      @required Key key,
      @required Map<String, AttributeValueUpdate> attributeUpdates,
      Map<String, ExpectedAttributeValue> expected,
      String returnValues}) async {
    var response_ = await _client.send('UpdateItem', {
      'TableName': tableName,
      'Key': key,
      'AttributeUpdates': attributeUpdates,
      if (expected != null) 'Expected': expected,
      if (returnValues != null) 'ReturnValues': returnValues,
    });
    return UpdateItemOutput.fromJson(response_);
  }

  /// Updates the provisioned throughput for the given table.
  ///
  /// Setting the throughput for a table helps you manage performance and is
  /// part of the Provisioned Throughput feature of Amazon DynamoDB.
  ///
  /// [tableName]: The name of the table you want to update. Allowed characters
  /// are `a-z`, `A-Z`, `0-9`, `_` (underscore), `-` (hyphen) and `.` (period).
  Future<UpdateTableOutput> updateTable(
      {@required String tableName,
      @required ProvisionedThroughput provisionedThroughput}) async {
    var response_ = await _client.send('UpdateTable', {
      'TableName': tableName,
      'ProvisionedThroughput': provisionedThroughput,
    });
    return UpdateTableOutput.fromJson(response_);
  }
}

/// AttributeValue can be `String`, `Number`, `Binary`, `StringSet`,
/// `NumberSet`, `BinarySet`.
class AttributeValue {
  /// Strings are Unicode with UTF-8 binary encoding. The maximum size is
  /// limited by the size of the primary key (1024 bytes as a range part of a
  /// key or 2048 bytes as a single part hash key) or the item size (64k).
  final String s;

  /// Numbers are positive or negative exact-value decimals and integers. A
  /// number can have up to 38 digits precision and can be between 10^-128 to
  /// 10^+126.
  final String n;

  /// Binary attributes are sequences of unsigned bytes.
  final Uint8List b;

  /// A set of strings.
  final List<String> ss;

  /// A set of numbers.
  final List<String> ns;

  /// A set of binary attributes.
  final List<Uint8List> bs;

  AttributeValue({
    this.s,
    this.n,
    this.b,
    this.ss,
    this.ns,
    this.bs,
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
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies the attribute to update and how to perform the update. Possible
/// values: `PUT` (default), `ADD` or `DELETE`.
class AttributeValueUpdate {
  final AttributeValue value;

  final String action;

  AttributeValueUpdate({
    this.value,
    this.action,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class BatchGetItemOutput {
  final Map<String, BatchResponse> responses;

  /// Contains a map of tables and their respective keys that were not processed
  /// with the current response, possibly due to reaching a limit on the
  /// response size. The `UnprocessedKeys` value is in the same form as a
  /// `RequestItems` parameter (so the value can be provided directly to a
  /// subsequent `BatchGetItem` operation). For more information, see the above
  /// `RequestItems` parameter.
  final Map<String, KeysAndAttributes> unprocessedKeys;

  BatchGetItemOutput({
    this.responses,
    this.unprocessedKeys,
  });
  static BatchGetItemOutput fromJson(Map<String, dynamic> json) =>
      BatchGetItemOutput(
        responses: json.containsKey('Responses')
            ? (json['Responses'] as Map)
                .map((k, v) => MapEntry(k as String, BatchResponse.fromJson(v)))
            : null,
        unprocessedKeys: json.containsKey('UnprocessedKeys')
            ? (json['UnprocessedKeys'] as Map).map(
                (k, v) => MapEntry(k as String, KeysAndAttributes.fromJson(v)))
            : null,
      );
}

/// The item attributes from a response in a specific table, along with the read
/// resources consumed on the table during the request.
class BatchResponse {
  final List<Map<String, AttributeValue>> items;

  final double consumedCapacityUnits;

  BatchResponse({
    this.items,
    this.consumedCapacityUnits,
  });
  static BatchResponse fromJson(Map<String, dynamic> json) => BatchResponse(
        items: json.containsKey('Items')
            ? (json['Items'] as List)
                .map((e) => (e as Map).map((k, v) =>
                    MapEntry(k as String, AttributeValue.fromJson(v))))
                .toList()
            : null,
        consumedCapacityUnits: json.containsKey('ConsumedCapacityUnits')
            ? json['ConsumedCapacityUnits'] as double
            : null,
      );
}

/// A container for `BatchWriteItem` response
class BatchWriteItemOutput {
  /// The response object as a result of `BatchWriteItem` call. This is
  /// essentially a map of table name to `ConsumedCapacityUnits`.
  final Map<String, BatchWriteResponse> responses;

  /// The Items which we could not successfully process in a `BatchWriteItem`
  /// call is returned as `UnprocessedItems`
  final Map<String, List<WriteRequest>> unprocessedItems;

  BatchWriteItemOutput({
    this.responses,
    this.unprocessedItems,
  });
  static BatchWriteItemOutput fromJson(Map<String, dynamic> json) =>
      BatchWriteItemOutput(
        responses: json.containsKey('Responses')
            ? (json['Responses'] as Map).map(
                (k, v) => MapEntry(k as String, BatchWriteResponse.fromJson(v)))
            : null,
        unprocessedItems: json.containsKey('UnprocessedItems')
            ? (json['UnprocessedItems'] as Map).map((k, v) => MapEntry(
                k as String,
                (v as List).map((e) => WriteRequest.fromJson(e)).toList()))
            : null,
      );
}

class BatchWriteResponse {
  final double consumedCapacityUnits;

  BatchWriteResponse({
    this.consumedCapacityUnits,
  });
  static BatchWriteResponse fromJson(Map<String, dynamic> json) =>
      BatchWriteResponse(
        consumedCapacityUnits: json.containsKey('ConsumedCapacityUnits')
            ? json['ConsumedCapacityUnits'] as double
            : null,
      );
}

class Condition {
  final List<AttributeValue> attributeValueList;

  final String comparisonOperator;

  Condition({
    this.attributeValueList,
    @required this.comparisonOperator,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class CreateTableOutput {
  final TableDescription tableDescription;

  CreateTableOutput({
    this.tableDescription,
  });
  static CreateTableOutput fromJson(Map<String, dynamic> json) =>
      CreateTableOutput(
        tableDescription: json.containsKey('TableDescription')
            ? TableDescription.fromJson(json['TableDescription'])
            : null,
      );
}

class DeleteItemOutput {
  /// If the `ReturnValues` parameter is provided as `ALL_OLD` in the request,
  /// Amazon DynamoDB returns an array of attribute name-value pairs
  /// (essentially, the deleted item). Otherwise, the response contains an empty
  /// set.
  final Map<String, AttributeValue> attributes;

  final double consumedCapacityUnits;

  DeleteItemOutput({
    this.attributes,
    this.consumedCapacityUnits,
  });
  static DeleteItemOutput fromJson(Map<String, dynamic> json) =>
      DeleteItemOutput(
        attributes: json.containsKey('Attributes')
            ? (json['Attributes'] as Map).map(
                (k, v) => MapEntry(k as String, AttributeValue.fromJson(v)))
            : null,
        consumedCapacityUnits: json.containsKey('ConsumedCapacityUnits')
            ? json['ConsumedCapacityUnits'] as double
            : null,
      );
}

/// A container for a Delete BatchWrite request
class DeleteRequest {
  /// The item's key to be delete
  final Key key;

  DeleteRequest({
    @required this.key,
  });
  static DeleteRequest fromJson(Map<String, dynamic> json) => DeleteRequest(
        key: Key.fromJson(json['Key']),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class DeleteTableOutput {
  final TableDescription tableDescription;

  DeleteTableOutput({
    this.tableDescription,
  });
  static DeleteTableOutput fromJson(Map<String, dynamic> json) =>
      DeleteTableOutput(
        tableDescription: json.containsKey('TableDescription')
            ? TableDescription.fromJson(json['TableDescription'])
            : null,
      );
}

class DescribeTableOutput {
  final TableDescription table;

  DescribeTableOutput({
    this.table,
  });
  static DescribeTableOutput fromJson(Map<String, dynamic> json) =>
      DescribeTableOutput(
        table: json.containsKey('Table')
            ? TableDescription.fromJson(json['Table'])
            : null,
      );
}

/// Allows you to provide an attribute name, and whether or not Amazon DynamoDB
/// should check to see if the attribute value already exists; or if the
/// attribute value exists and has a particular value before changing it.
class ExpectedAttributeValue {
  /// Specify whether or not a value already exists and has a specific content
  /// for the attribute name-value pair.
  final AttributeValue value;

  /// Specify whether or not a value already exists for the attribute name-value
  /// pair.
  final bool exists;

  ExpectedAttributeValue({
    this.value,
    this.exists,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class GetItemOutput {
  /// Contains the requested attributes.
  final Map<String, AttributeValue> item;

  final double consumedCapacityUnits;

  GetItemOutput({
    this.item,
    this.consumedCapacityUnits,
  });
  static GetItemOutput fromJson(Map<String, dynamic> json) => GetItemOutput(
        item: json.containsKey('Item')
            ? (json['Item'] as Map).map(
                (k, v) => MapEntry(k as String, AttributeValue.fromJson(v)))
            : null,
        consumedCapacityUnits: json.containsKey('ConsumedCapacityUnits')
            ? json['ConsumedCapacityUnits'] as double
            : null,
      );
}

/// The primary key that uniquely identifies each item in a table. A primary key
/// can be a one attribute (hash) primary key or a two attribute
/// (hash-and-range) primary key.
class Key {
  /// A hash key element is treated as the primary key, and can be a string or a
  /// number. Single attribute primary keys have one index value. The value can
  /// be `String`, `Number`, `StringSet`, `NumberSet`.
  final AttributeValue hashKeyElement;

  /// A range key element is treated as a secondary key (used in conjunction
  /// with the primary key), and can be a string or a number, and is only used
  /// for hash-and-range primary keys. The value can be `String`, `Number`,
  /// `StringSet`, `NumberSet`.
  final AttributeValue rangeKeyElement;

  Key({
    @required this.hashKeyElement,
    this.rangeKeyElement,
  });
  static Key fromJson(Map<String, dynamic> json) => Key(
        hashKeyElement: AttributeValue.fromJson(json['HashKeyElement']),
        rangeKeyElement: json.containsKey('RangeKeyElement')
            ? AttributeValue.fromJson(json['RangeKeyElement'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The KeySchema identifies the primary key as a one attribute primary key
/// (hash) or a composite two attribute (hash-and-range) primary key. Single
/// attribute primary keys have one index value: a `HashKeyElement`. A composite
/// hash-and-range primary key contains two attribute values: a `HashKeyElement`
/// and a `RangeKeyElement`.
class KeySchema {
  /// A hash key element is treated as the primary key, and can be a string or a
  /// number. Single attribute primary keys have one index value. The value can
  /// be `String`, `Number`, `StringSet`, `NumberSet`.
  final KeySchemaElement hashKeyElement;

  /// A range key element is treated as a secondary key (used in conjunction
  /// with the primary key), and can be a string or a number, and is only used
  /// for hash-and-range primary keys. The value can be `String`, `Number`,
  /// `StringSet`, `NumberSet`.
  final KeySchemaElement rangeKeyElement;

  KeySchema({
    @required this.hashKeyElement,
    this.rangeKeyElement,
  });
  static KeySchema fromJson(Map<String, dynamic> json) => KeySchema(
        hashKeyElement: KeySchemaElement.fromJson(json['HashKeyElement']),
        rangeKeyElement: json.containsKey('RangeKeyElement')
            ? KeySchemaElement.fromJson(json['RangeKeyElement'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// `KeySchemaElement` is the primary key (hash or hash-and-range) structure for
/// the table.
class KeySchemaElement {
  /// The `AttributeName` of the `KeySchemaElement`.
  final String attributeName;

  /// The `AttributeType` of the `KeySchemaElement` which can be a `String` or a
  /// `Number`.
  final String attributeType;

  KeySchemaElement({
    @required this.attributeName,
    @required this.attributeType,
  });
  static KeySchemaElement fromJson(Map<String, dynamic> json) =>
      KeySchemaElement(
        attributeName: json['AttributeName'] as String,
        attributeType: json['AttributeType'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class KeysAndAttributes {
  final List<Key> keys;

  final List<String> attributesToGet;

  final bool consistentRead;

  KeysAndAttributes({
    @required this.keys,
    this.attributesToGet,
    this.consistentRead,
  });
  static KeysAndAttributes fromJson(Map<String, dynamic> json) =>
      KeysAndAttributes(
        keys: (json['Keys'] as List).map((e) => Key.fromJson(e)).toList(),
        attributesToGet: json.containsKey('AttributesToGet')
            ? (json['AttributesToGet'] as List).map((e) => e as String).toList()
            : null,
        consistentRead: json.containsKey('ConsistentRead')
            ? json['ConsistentRead'] as bool
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class ListTablesOutput {
  final List<String> tableNames;

  /// The name of the last table in the current list. Use this value as the
  /// `ExclusiveStartTableName` in a new request to continue the list until all
  /// the table names are returned. If this value is null, all table names have
  /// been returned.
  final String lastEvaluatedTableName;

  ListTablesOutput({
    this.tableNames,
    this.lastEvaluatedTableName,
  });
  static ListTablesOutput fromJson(Map<String, dynamic> json) =>
      ListTablesOutput(
        tableNames: json.containsKey('TableNames')
            ? (json['TableNames'] as List).map((e) => e as String).toList()
            : null,
        lastEvaluatedTableName: json.containsKey('LastEvaluatedTableName')
            ? json['LastEvaluatedTableName'] as String
            : null,
      );
}

/// Provisioned throughput reserves the required read and write resources for
/// your table in terms of `ReadCapacityUnits` and `WriteCapacityUnits`. Values
/// for provisioned throughput depend upon your expected read/write rates, item
/// size, and consistency. Provide the expected number of read and write
/// operations, assuming an item size of 1k and strictly consistent reads. For
/// 2k item size, double the value. For 3k, triple the value, etc.
/// Eventually-consistent reads consume half the resources of strictly
/// consistent reads.
class ProvisionedThroughput {
  /// `ReadCapacityUnits` are in terms of strictly consistent reads, assuming
  /// items of 1k. 2k items require twice the `ReadCapacityUnits`.
  /// Eventually-consistent reads only require half the `ReadCapacityUnits` of
  /// stirctly consistent reads.
  final BigInt readCapacityUnits;

  /// `WriteCapacityUnits` are in terms of strictly consistent reads, assuming
  /// items of 1k. 2k items require twice the `WriteCapacityUnits`.
  final BigInt writeCapacityUnits;

  ProvisionedThroughput({
    @required this.readCapacityUnits,
    @required this.writeCapacityUnits,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class ProvisionedThroughputDescription {
  final DateTime lastIncreaseDateTime;

  final DateTime lastDecreaseDateTime;

  final BigInt numberOfDecreasesToday;

  final BigInt readCapacityUnits;

  final BigInt writeCapacityUnits;

  ProvisionedThroughputDescription({
    this.lastIncreaseDateTime,
    this.lastDecreaseDateTime,
    this.numberOfDecreasesToday,
    this.readCapacityUnits,
    this.writeCapacityUnits,
  });
  static ProvisionedThroughputDescription fromJson(Map<String, dynamic> json) =>
      ProvisionedThroughputDescription(
        lastIncreaseDateTime: json.containsKey('LastIncreaseDateTime')
            ? DateTime.parse(json['LastIncreaseDateTime'])
            : null,
        lastDecreaseDateTime: json.containsKey('LastDecreaseDateTime')
            ? DateTime.parse(json['LastDecreaseDateTime'])
            : null,
        numberOfDecreasesToday: json.containsKey('NumberOfDecreasesToday')
            ? BigInt.from(json['NumberOfDecreasesToday'])
            : null,
        readCapacityUnits: json.containsKey('ReadCapacityUnits')
            ? BigInt.from(json['ReadCapacityUnits'])
            : null,
        writeCapacityUnits: json.containsKey('WriteCapacityUnits')
            ? BigInt.from(json['WriteCapacityUnits'])
            : null,
      );
}

class PutItemOutput {
  /// Attribute values before the put operation, but only if the `ReturnValues`
  /// parameter is specified as `ALL_OLD` in the request.
  final Map<String, AttributeValue> attributes;

  final double consumedCapacityUnits;

  PutItemOutput({
    this.attributes,
    this.consumedCapacityUnits,
  });
  static PutItemOutput fromJson(Map<String, dynamic> json) => PutItemOutput(
        attributes: json.containsKey('Attributes')
            ? (json['Attributes'] as Map).map(
                (k, v) => MapEntry(k as String, AttributeValue.fromJson(v)))
            : null,
        consumedCapacityUnits: json.containsKey('ConsumedCapacityUnits')
            ? json['ConsumedCapacityUnits'] as double
            : null,
      );
}

/// A container for a Put BatchWrite request
class PutRequest {
  /// The item to put
  final Map<String, AttributeValue> item;

  PutRequest({
    @required this.item,
  });
  static PutRequest fromJson(Map<String, dynamic> json) => PutRequest(
        item: (json['Item'] as Map)
            .map((k, v) => MapEntry(k as String, AttributeValue.fromJson(v))),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class QueryOutput {
  final List<Map<String, AttributeValue>> items;

  /// Number of items in the response.
  final int count;

  /// Primary key of the item where the query operation stopped, inclusive of
  /// the previous result set. Use this value to start a new operation excluding
  /// this value in the new request. The `LastEvaluatedKey` is null when the
  /// entire query result set is complete (i.e. the operation processed the
  /// "last page").
  final Key lastEvaluatedKey;

  final double consumedCapacityUnits;

  QueryOutput({
    this.items,
    this.count,
    this.lastEvaluatedKey,
    this.consumedCapacityUnits,
  });
  static QueryOutput fromJson(Map<String, dynamic> json) => QueryOutput(
        items: json.containsKey('Items')
            ? (json['Items'] as List)
                .map((e) => (e as Map).map((k, v) =>
                    MapEntry(k as String, AttributeValue.fromJson(v))))
                .toList()
            : null,
        count: json.containsKey('Count') ? json['Count'] as int : null,
        lastEvaluatedKey: json.containsKey('LastEvaluatedKey')
            ? Key.fromJson(json['LastEvaluatedKey'])
            : null,
        consumedCapacityUnits: json.containsKey('ConsumedCapacityUnits')
            ? json['ConsumedCapacityUnits'] as double
            : null,
      );
}

class ScanOutput {
  final List<Map<String, AttributeValue>> items;

  /// Number of items in the response.
  final int count;

  /// Number of items in the complete scan before any filters are applied. A
  /// high `ScannedCount` value with few, or no, `Count` results indicates an
  /// inefficient `Scan` operation.
  final int scannedCount;

  /// Primary key of the item where the scan operation stopped. Provide this
  /// value in a subsequent scan operation to continue the operation from that
  /// point. The `LastEvaluatedKey` is null when the entire scan result set is
  /// complete (i.e. the operation processed the "last page").
  final Key lastEvaluatedKey;

  final double consumedCapacityUnits;

  ScanOutput({
    this.items,
    this.count,
    this.scannedCount,
    this.lastEvaluatedKey,
    this.consumedCapacityUnits,
  });
  static ScanOutput fromJson(Map<String, dynamic> json) => ScanOutput(
        items: json.containsKey('Items')
            ? (json['Items'] as List)
                .map((e) => (e as Map).map((k, v) =>
                    MapEntry(k as String, AttributeValue.fromJson(v))))
                .toList()
            : null,
        count: json.containsKey('Count') ? json['Count'] as int : null,
        scannedCount: json.containsKey('ScannedCount')
            ? json['ScannedCount'] as int
            : null,
        lastEvaluatedKey: json.containsKey('LastEvaluatedKey')
            ? Key.fromJson(json['LastEvaluatedKey'])
            : null,
        consumedCapacityUnits: json.containsKey('ConsumedCapacityUnits')
            ? json['ConsumedCapacityUnits'] as double
            : null,
      );
}

class TableDescription {
  /// The name of the table being described.
  final String tableName;

  final KeySchema keySchema;

  final String tableStatus;

  final DateTime creationDateTime;

  final ProvisionedThroughputDescription provisionedThroughput;

  final BigInt tableSizeBytes;

  final BigInt itemCount;

  TableDescription({
    this.tableName,
    this.keySchema,
    this.tableStatus,
    this.creationDateTime,
    this.provisionedThroughput,
    this.tableSizeBytes,
    this.itemCount,
  });
  static TableDescription fromJson(Map<String, dynamic> json) =>
      TableDescription(
        tableName:
            json.containsKey('TableName') ? json['TableName'] as String : null,
        keySchema: json.containsKey('KeySchema')
            ? KeySchema.fromJson(json['KeySchema'])
            : null,
        tableStatus: json.containsKey('TableStatus')
            ? json['TableStatus'] as String
            : null,
        creationDateTime: json.containsKey('CreationDateTime')
            ? DateTime.parse(json['CreationDateTime'])
            : null,
        provisionedThroughput: json.containsKey('ProvisionedThroughput')
            ? ProvisionedThroughputDescription.fromJson(
                json['ProvisionedThroughput'])
            : null,
        tableSizeBytes: json.containsKey('TableSizeBytes')
            ? BigInt.from(json['TableSizeBytes'])
            : null,
        itemCount: json.containsKey('ItemCount')
            ? BigInt.from(json['ItemCount'])
            : null,
      );
}

class UpdateItemOutput {
  /// A map of attribute name-value pairs, but only if the `ReturnValues`
  /// parameter is specified as something other than `NONE` in the request.
  final Map<String, AttributeValue> attributes;

  final double consumedCapacityUnits;

  UpdateItemOutput({
    this.attributes,
    this.consumedCapacityUnits,
  });
  static UpdateItemOutput fromJson(Map<String, dynamic> json) =>
      UpdateItemOutput(
        attributes: json.containsKey('Attributes')
            ? (json['Attributes'] as Map).map(
                (k, v) => MapEntry(k as String, AttributeValue.fromJson(v)))
            : null,
        consumedCapacityUnits: json.containsKey('ConsumedCapacityUnits')
            ? json['ConsumedCapacityUnits'] as double
            : null,
      );
}

class UpdateTableOutput {
  final TableDescription tableDescription;

  UpdateTableOutput({
    this.tableDescription,
  });
  static UpdateTableOutput fromJson(Map<String, dynamic> json) =>
      UpdateTableOutput(
        tableDescription: json.containsKey('TableDescription')
            ? TableDescription.fromJson(json['TableDescription'])
            : null,
      );
}

/// This structure is a Union of PutRequest and DeleteRequest. It can contain
/// exactly one of `PutRequest` or `DeleteRequest`. Never Both. This is enforced
/// in the code.
class WriteRequest {
  final PutRequest putRequest;

  final DeleteRequest deleteRequest;

  WriteRequest({
    this.putRequest,
    this.deleteRequest,
  });
  static WriteRequest fromJson(Map<String, dynamic> json) => WriteRequest(
        putRequest: json.containsKey('PutRequest')
            ? PutRequest.fromJson(json['PutRequest'])
            : null,
        deleteRequest: json.containsKey('DeleteRequest')
            ? DeleteRequest.fromJson(json['DeleteRequest'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}
