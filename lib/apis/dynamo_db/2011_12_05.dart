import 'package:meta/meta.dart';

/// Amazon DynamoDB is a fast, highly scalable, highly available, cost-effective
/// non-relational database service.
///
/// Amazon DynamoDB removes traditional scalability limitations on data storage
/// while maintaining low latency and predictable performance.
class DynamoDBApi {
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
  Future<void> batchGetItem(
      Map<String, KeysAndAttributes> requestItems) async {}

  /// Allows to execute a batch of Put and/or Delete Requests for many tables in
  /// a single call. A total of 25 requests are allowed.
  ///
  /// There are no transaction guarantees provided by this API. It does not
  /// allow conditional puts nor does it support return values.
  Future<void> batchWriteItem(
      Map<String, List<WriteRequest>> requestItems) async {}

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
  Future<void> createTable(
      {@required String tableName,
      @required KeySchema keySchema,
      @required ProvisionedThroughput provisionedThroughput}) async {}

  /// Deletes a single item in a table by primary key.
  ///
  /// You can perform a conditional delete operation that deletes the item if it
  /// exists, or if it has an expected attribute value.
  Future<void> deleteItem(
      {@required String tableName,
      @required Key key,
      Map<String, ExpectedAttributeValue> expected,
      String returnValues}) async {}

  /// Deletes a table and all of its items.
  ///
  /// If the table is in the `ACTIVE` state, you can delete it. If a table is in
  /// `CREATING` or `UPDATING` states then Amazon DynamoDB returns a
  /// `ResourceInUseException`. If the specified table does not exist, Amazon
  /// DynamoDB returns a `ResourceNotFoundException`.
  Future<void> deleteTable(String tableName) async {}

  /// Retrieves information about the table, including the current status of the
  /// table, the primary key schema and when the table was created.
  ///
  /// If the table does not exist, Amazon DynamoDB returns a
  /// `ResourceNotFoundException`.
  Future<void> describeTable(String tableName) async {}

  /// Retrieves a set of Attributes for an item that matches the primary key.
  ///
  /// The `GetItem` operation provides an eventually-consistent read by default.
  /// If eventually-consistent reads are not acceptable for your application,
  /// use `ConsistentRead`. Although this operation might take longer than a
  /// standard read, it always returns the last updated value.
  Future<void> getItem(
      {@required String tableName,
      @required Key key,
      List<String> attributesToGet,
      bool consistentRead}) async {}

  /// Retrieves a paginated list of table names created by the AWS Account of
  /// the caller in the AWS Region (e.g. `us-east-1`).
  Future<void> listTables({String exclusiveStartTableName, int limit}) async {}

  /// Creates a new item, or replaces an old item with a new item (including all
  /// the attributes).
  ///
  /// If an item already exists in the specified table with the same primary
  /// key, the new item completely replaces the existing item. You can perform a
  /// conditional put (insert a new item if one with the specified primary key
  /// doesn't exist), or replace an existing item if it has certain attribute
  /// values.
  Future<void> putItem(
      {@required String tableName,
      @required Map<String, AttributeValue> item,
      Map<String, ExpectedAttributeValue> expected,
      String returnValues}) async {}

  /// Gets the values of one or more items and its attributes by primary key
  /// (composite primary key, only).
  ///
  /// Narrow the scope of the query using comparison operators on the
  /// `RangeKeyValue` of the composite key. Use the `ScanIndexForward` parameter
  /// to get results in forward or reverse order by range key.
  Future<void> query(
      {@required String tableName,
      List<String> attributesToGet,
      int limit,
      bool consistentRead,
      bool count,
      @required AttributeValue hashKeyValue,
      Condition rangeKeyCondition,
      bool scanIndexForward,
      Key exclusiveStartKey}) async {}

  /// Retrieves one or more items and its attributes by performing a full scan
  /// of a table.
  ///
  /// Provide a `ScanFilter` to get more specific results.
  Future<void> scan(String tableName,
      {List<String> attributesToGet,
      int limit,
      bool count,
      Map<String, Condition> scanFilter,
      Key exclusiveStartKey}) async {}

  /// Edits an existing item's attributes.
  ///
  /// You can perform a conditional update (insert a new attribute name-value
  /// pair if it doesn't exist, or replace an existing name-value pair if it has
  /// certain expected attribute values).
  Future<void> updateItem(
      {@required String tableName,
      @required Key key,
      @required Map<String, AttributeValueUpdate> attributeUpdates,
      Map<String, ExpectedAttributeValue> expected,
      String returnValues}) async {}

  /// Updates the provisioned throughput for the given table.
  ///
  /// Setting the throughput for a table helps you manage performance and is
  /// part of the Provisioned Throughput feature of Amazon DynamoDB.
  Future<void> updateTable(
      {@required String tableName,
      @required ProvisionedThroughput provisionedThroughput}) async {}
}

class AttributeValue {}

class AttributeValueUpdate {}

class BatchGetItemOutput {}

class BatchResponse {}

class BatchWriteItemOutput {}

class BatchWriteResponse {}

class Condition {}

class CreateTableOutput {}

class DeleteItemOutput {}

class DeleteRequest {}

class DeleteTableOutput {}

class DescribeTableOutput {}

class ExpectedAttributeValue {}

class GetItemOutput {}

class Key {}

class KeySchema {}

class KeySchemaElement {}

class KeysAndAttributes {}

class ListTablesOutput {}

class ProvisionedThroughput {}

class ProvisionedThroughputDescription {}

class PutItemOutput {}

class PutRequest {}

class QueryOutput {}

class ScanOutput {}

class TableDescription {}

class UpdateItemOutput {}

class UpdateTableOutput {}

class WriteRequest {}
