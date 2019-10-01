import 'package:meta/meta.dart';
import 'dart:typed_data';

/// Amazon DynamoDB
///
/// Amazon DynamoDB is a fully managed NoSQL database service that provides fast
/// and predictable performance with seamless scalability. DynamoDB lets you
/// offload the administrative burdens of operating and scaling a distributed
/// database, so that you don't have to worry about hardware provisioning, setup
/// and configuration, replication, software patching, or cluster scaling.
///
/// With DynamoDB, you can create database tables that can store and retrieve
/// any amount of data, and serve any level of request traffic. You can scale up
/// or scale down your tables' throughput capacity without downtime or
/// performance degradation, and use the AWS Management Console to monitor
/// resource utilization and performance metrics.
///
/// DynamoDB automatically spreads the data and traffic for your tables over a
/// sufficient number of servers to handle your throughput and storage
/// requirements, while maintaining consistent and fast performance. All of your
/// data is stored on solid state disks (SSDs) and automatically replicated
/// across multiple Availability Zones in an AWS region, providing built-in high
/// availability and data durability.
class DynamoDBApi {
  final _client;
  DynamoDBApi(client)
      : _client = client.configured('DynamoDB', serializer: 'json');

  /// The `BatchGetItem` operation returns the attributes of one or more items
  /// from one or more tables. You identify requested items by primary key.
  ///
  /// A single operation can retrieve up to 16 MB of data, which can contain as
  /// many as 100 items. `BatchGetItem` returns a partial result if the response
  /// size limit is exceeded, the table's provisioned throughput is exceeded, or
  /// an internal processing failure occurs. If a partial result is returned,
  /// the operation returns a value for `UnprocessedKeys`. You can use this
  /// value to retry the operation starting with the next item to get.
  ///
  ///  If you request more than 100 items, `BatchGetItem` returns a
  /// `ValidationException` with the message "Too many items requested for the
  /// BatchGetItem call."
  ///
  /// For example, if you ask to retrieve 100 items, but each individual item is
  /// 300 KB in size, the system returns 52 items (so as not to exceed the 16 MB
  /// limit). It also returns an appropriate `UnprocessedKeys` value so you can
  /// get the next page of results. If desired, your application can include its
  /// own logic to assemble the pages of results into one dataset.
  ///
  /// If _none_ of the items can be processed due to insufficient provisioned
  /// throughput on all of the tables in the request, then `BatchGetItem`
  /// returns a `ProvisionedThroughputExceededException`. If _at least one_ of
  /// the items is successfully processed, then `BatchGetItem` completes
  /// successfully, while returning the keys of the unread items in
  /// `UnprocessedKeys`.
  ///
  ///  If DynamoDB returns any unprocessed items, you should retry the batch
  /// operation on those items. However, _we strongly recommend that you use an
  /// exponential backoff algorithm_. If you retry the batch operation
  /// immediately, the underlying read or write requests can still fail due to
  /// throttling on the individual tables. If you delay the batch operation
  /// using exponential backoff, the individual requests in the batch are much
  /// more likely to succeed.
  ///
  /// For more information, see
  /// [Batch Operations and Error Handling](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ErrorHandling.html#BatchOperations)
  /// in the _Amazon DynamoDB Developer Guide_.
  ///
  /// By default, `BatchGetItem` performs eventually consistent reads on every
  /// table in the request. If you want strongly consistent reads instead, you
  /// can set `ConsistentRead` to `true` for any or all tables.
  ///
  /// In order to minimize response latency, `BatchGetItem` retrieves items in
  /// parallel.
  ///
  /// When designing your application, keep in mind that DynamoDB does not
  /// return items in any particular order. To help parse the response by item,
  /// include the primary key values for the items in your request in the
  /// `ProjectionExpression` parameter.
  ///
  /// If a requested item does not exist, it is not returned in the result.
  /// Requests for nonexistent items consume the minimum read capacity units
  /// according to the type of read. For more information, see
  /// [Working with Tables](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/WorkingWithTables.html#CapacityUnitCalculations)
  /// in the _Amazon DynamoDB Developer Guide_.
  ///
  /// [requestItems]: A map of one or more table names and, for each table, a
  /// map that describes one or more items to retrieve from that table. Each
  /// table name can be used only once per `BatchGetItem` request.
  ///
  /// Each element in the map of items to retrieve consists of the following:
  ///
  /// *    `ConsistentRead` - If `true`, a strongly consistent read is used; if
  /// `false` (the default), an eventually consistent read is used.
  ///
  /// *    `ExpressionAttributeNames` - One or more substitution tokens for
  /// attribute names in the `ProjectionExpression` parameter. The following are
  /// some use cases for using `ExpressionAttributeNames`:
  ///
  ///     *   To access an attribute whose name conflicts with a DynamoDB
  /// reserved word.
  ///
  ///     *   To create a placeholder for repeating occurrences of an attribute
  /// name in an expression.
  ///
  ///     *   To prevent special characters in an attribute name from being
  /// misinterpreted in an expression.
  ///
  ///
  ///     Use the **#** character in an expression to dereference an attribute
  /// name. For example, consider the following attribute name:
  ///
  ///     *    `Percentile`
  ///
  ///
  ///     The name of this attribute conflicts with a reserved word, so it
  /// cannot be used directly in an expression. (For the complete list of
  /// reserved words, see
  /// [Reserved Words](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html)
  /// in the _Amazon DynamoDB Developer Guide_). To work around this, you could
  /// specify the following for `ExpressionAttributeNames`:
  ///
  ///     *    `{"#P":"Percentile"}`
  ///
  ///
  ///     You could then use this substitution in an expression, as in this
  /// example:
  ///
  ///     *    `#P = :val`
  ///
  ///
  ///      Tokens that begin with the **:** character are _expression attribute
  /// values_, which are placeholders for the actual value at runtime.
  ///
  ///     For more information about expression attribute names, see
  /// [Accessing Item Attributes](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html)
  /// in the _Amazon DynamoDB Developer Guide_.
  ///
  /// *    `Keys` - An array of primary key attribute values that define
  /// specific items in the table. For each primary key, you must provide _all_
  /// of the key attributes. For example, with a simple primary key, you only
  /// need to provide the partition key value. For a composite key, you must
  /// provide _both_ the partition key value and the sort key value.
  ///
  /// *    `ProjectionExpression` - A string that identifies one or more
  /// attributes to retrieve from the table. These attributes can include
  /// scalars, sets, or elements of a JSON document. The attributes in the
  /// expression must be separated by commas.
  ///
  ///     If no attribute names are specified, then all attributes are returned.
  /// If any of the requested attributes are not found, they do not appear in
  /// the result.
  ///
  ///     For more information, see
  /// [Accessing Item Attributes](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html)
  /// in the _Amazon DynamoDB Developer Guide_.
  ///
  /// *    `AttributesToGet` - This is a legacy parameter. Use
  /// `ProjectionExpression` instead. For more information, see
  /// [AttributesToGet](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.AttributesToGet.html)
  /// in the _Amazon DynamoDB Developer Guide_.
  Future<BatchGetItemOutput> batchGetItem(
      Map<String, KeysAndAttributes> requestItems,
      {String returnConsumedCapacity}) async {
    var response_ = await _client.send('BatchGetItem', {
      'RequestItems': requestItems,
      if (returnConsumedCapacity != null)
        'ReturnConsumedCapacity': returnConsumedCapacity,
    });
    return BatchGetItemOutput.fromJson(response_);
  }

  /// The `BatchWriteItem` operation puts or deletes multiple items in one or
  /// more tables. A single call to `BatchWriteItem` can write up to 16 MB of
  /// data, which can comprise as many as 25 put or delete requests. Individual
  /// items to be written can be as large as 400 KB.
  ///
  ///   `BatchWriteItem` cannot update items. To update items, use the
  /// `UpdateItem` action.
  ///
  /// The individual `PutItem` and `DeleteItem` operations specified in
  /// `BatchWriteItem` are atomic; however `BatchWriteItem` as a whole is not.
  /// If any requested operations fail because the table's provisioned
  /// throughput is exceeded or an internal processing failure occurs, the
  /// failed operations are returned in the `UnprocessedItems` response
  /// parameter. You can investigate and optionally resend the requests.
  /// Typically, you would call `BatchWriteItem` in a loop. Each iteration would
  /// check for unprocessed items and submit a new `BatchWriteItem` request with
  /// those unprocessed items until all items have been processed.
  ///
  /// If _none_ of the items can be processed due to insufficient provisioned
  /// throughput on all of the tables in the request, then `BatchWriteItem`
  /// returns a `ProvisionedThroughputExceededException`.
  ///
  ///  If DynamoDB returns any unprocessed items, you should retry the batch
  /// operation on those items. However, _we strongly recommend that you use an
  /// exponential backoff algorithm_. If you retry the batch operation
  /// immediately, the underlying read or write requests can still fail due to
  /// throttling on the individual tables. If you delay the batch operation
  /// using exponential backoff, the individual requests in the batch are much
  /// more likely to succeed.
  ///
  /// For more information, see
  /// [Batch Operations and Error Handling](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ErrorHandling.html#Programming.Errors.BatchOperations)
  /// in the _Amazon DynamoDB Developer Guide_.
  ///
  /// With `BatchWriteItem`, you can efficiently write or delete large amounts
  /// of data, such as from Amazon EMR, or copy data from another database into
  /// DynamoDB. In order to improve performance with these large-scale
  /// operations, `BatchWriteItem` does not behave in the same way as individual
  /// `PutItem` and `DeleteItem` calls would. For example, you cannot specify
  /// conditions on individual put and delete requests, and `BatchWriteItem`
  /// does not return deleted items in the response.
  ///
  /// If you use a programming language that supports concurrency, you can use
  /// threads to write items in parallel. Your application must include the
  /// necessary logic to manage the threads. With languages that don't support
  /// threading, you must update or delete the specified items one at a time. In
  /// both situations, `BatchWriteItem` performs the specified put and delete
  /// operations in parallel, giving you the power of the thread pool approach
  /// without having to introduce complexity into your application.
  ///
  /// Parallel processing reduces latency, but each specified put and delete
  /// request consumes the same number of write capacity units whether it is
  /// processed in parallel or not. Delete operations on nonexistent items
  /// consume one write capacity unit.
  ///
  /// If one or more of the following is true, DynamoDB rejects the entire batch
  /// write operation:
  ///
  /// *   One or more tables specified in the `BatchWriteItem` request does not
  /// exist.
  ///
  /// *   Primary key attributes specified on an item in the request do not
  /// match those in the corresponding table's primary key schema.
  ///
  /// *   You try to perform multiple operations on the same item in the same
  /// `BatchWriteItem` request. For example, you cannot put and delete the same
  /// item in the same `BatchWriteItem` request.
  ///
  /// *    Your request contains at least two items with identical hash and
  /// range keys (which essentially is two put operations).
  ///
  /// *   There are more than 25 requests in the batch.
  ///
  /// *   Any individual item in a batch exceeds 400 KB.
  ///
  /// *   The total request size exceeds 16 MB.
  ///
  /// [requestItems]: A map of one or more table names and, for each table, a
  /// list of operations to be performed (`DeleteRequest` or `PutRequest`). Each
  /// element in the map consists of the following:
  ///
  /// *    `DeleteRequest` - Perform a `DeleteItem` operation on the specified
  /// item. The item to be deleted is identified by a `Key` subelement:
  ///
  ///     *    `Key` - A map of primary key attribute values that uniquely
  /// identify the item. Each entry in this map consists of an attribute name
  /// and an attribute value. For each primary key, you must provide _all_ of
  /// the key attributes. For example, with a simple primary key, you only need
  /// to provide a value for the partition key. For a composite primary key, you
  /// must provide values for _both_ the partition key and the sort key.
  ///
  ///
  /// *    `PutRequest` - Perform a `PutItem` operation on the specified item.
  /// The item to be put is identified by an `Item` subelement:
  ///
  ///     *    `Item` - A map of attributes and their values. Each entry in this
  /// map consists of an attribute name and an attribute value. Attribute values
  /// must not be null; string and binary type attributes must have lengths
  /// greater than zero; and set type attributes must not be empty. Requests
  /// that contain empty values are rejected with a `ValidationException`
  /// exception.
  ///
  ///         If you specify any attributes that are part of an index key, then
  /// the data types for those attributes must match those of the schema in the
  /// table's attribute definition.
  ///
  /// [returnItemCollectionMetrics]: Determines whether item collection metrics
  /// are returned. If set to `SIZE`, the response includes statistics about
  /// item collections, if any, that were modified during the operation are
  /// returned in the response. If set to `NONE` (the default), no statistics
  /// are returned.
  Future<BatchWriteItemOutput> batchWriteItem(
      Map<String, List<WriteRequest>> requestItems,
      {String returnConsumedCapacity,
      String returnItemCollectionMetrics}) async {
    var response_ = await _client.send('BatchWriteItem', {
      'RequestItems': requestItems,
      if (returnConsumedCapacity != null)
        'ReturnConsumedCapacity': returnConsumedCapacity,
      if (returnItemCollectionMetrics != null)
        'ReturnItemCollectionMetrics': returnItemCollectionMetrics,
    });
    return BatchWriteItemOutput.fromJson(response_);
  }

  /// Creates a backup for an existing table.
  ///
  ///  Each time you create an on-demand backup, the entire table data is backed
  /// up. There is no limit to the number of on-demand backups that can be
  /// taken.
  ///
  ///  When you create an on-demand backup, a time marker of the request is
  /// cataloged, and the backup is created asynchronously, by applying all
  /// changes until the time of the request to the last full table snapshot.
  /// Backup requests are processed instantaneously and become available for
  /// restore within minutes.
  ///
  /// You can call `CreateBackup` at a maximum rate of 50 times per second.
  ///
  /// All backups in DynamoDB work without consuming any provisioned throughput
  /// on the table.
  ///
  ///  If you submit a backup request on 2018-12-14 at 14:25:00, the backup is
  /// guaranteed to contain all data committed to the table up to 14:24:00, and
  /// data committed after 14:26:00 will not be. The backup might contain data
  /// modifications made between 14:24:00 and 14:26:00. On-demand backup does
  /// not support causal consistency.
  ///
  ///  Along with data, the following are also included on the backups:
  ///
  /// *   Global secondary indexes (GSIs)
  ///
  /// *   Local secondary indexes (LSIs)
  ///
  /// *   Streams
  ///
  /// *   Provisioned read and write capacity
  ///
  /// [tableName]: The name of the table.
  ///
  /// [backupName]: Specified name for the backup.
  Future<CreateBackupOutput> createBackup(
      {@required String tableName, @required String backupName}) async {
    var response_ = await _client.send('CreateBackup', {
      'TableName': tableName,
      'BackupName': backupName,
    });
    return CreateBackupOutput.fromJson(response_);
  }

  /// Creates a global table from an existing table. A global table creates a
  /// replication relationship between two or more DynamoDB tables with the same
  /// table name in the provided Regions.
  ///
  /// If you want to add a new replica table to a global table, each of the
  /// following conditions must be true:
  ///
  /// *   The table must have the same primary key as all of the other replicas.
  ///
  /// *   The table must have the same name as all of the other replicas.
  ///
  /// *   The table must have DynamoDB Streams enabled, with the stream
  /// containing both the new and the old images of the item.
  ///
  /// *   None of the replica tables in the global table can contain any data.
  ///
  ///
  ///  If global secondary indexes are specified, then the following conditions
  /// must also be met:
  ///
  /// *    The global secondary indexes must have the same name.
  ///
  /// *    The global secondary indexes must have the same hash key and sort key
  /// (if present).
  ///
  ///
  ///   Write capacity settings should be set consistently across your replica
  /// tables and secondary indexes. DynamoDB strongly recommends enabling auto
  /// scaling to manage the write capacity settings for all of your global
  /// tables replicas and indexes.
  ///
  ///  If you prefer to manage write capacity settings manually, you should
  /// provision equal replicated write capacity units to your replica tables.
  /// You should also provision equal replicated write capacity units to
  /// matching secondary indexes across your global table.
  ///
  /// [globalTableName]: The global table name.
  ///
  /// [replicationGroup]: The Regions where the global table needs to be
  /// created.
  Future<CreateGlobalTableOutput> createGlobalTable(
      {@required String globalTableName,
      @required List<Replica> replicationGroup}) async {
    var response_ = await _client.send('CreateGlobalTable', {
      'GlobalTableName': globalTableName,
      'ReplicationGroup': replicationGroup,
    });
    return CreateGlobalTableOutput.fromJson(response_);
  }

  /// The `CreateTable` operation adds a new table to your account. In an AWS
  /// account, table names must be unique within each Region. That is, you can
  /// have two tables with same name if you create the tables in different
  /// Regions.
  ///
  ///  `CreateTable` is an asynchronous operation. Upon receiving a
  /// `CreateTable` request, DynamoDB immediately returns a response with a
  /// `TableStatus` of `CREATING`. After the table is created, DynamoDB sets the
  /// `TableStatus` to `ACTIVE`. You can perform read and write operations only
  /// on an `ACTIVE` table.
  ///
  /// You can optionally define secondary indexes on the new table, as part of
  /// the `CreateTable` operation. If you want to create multiple tables with
  /// secondary indexes on them, you must create the tables sequentially. Only
  /// one table with secondary indexes can be in the `CREATING` state at any
  /// given time.
  ///
  /// You can use the `DescribeTable` action to check the table status.
  ///
  /// [attributeDefinitions]: An array of attributes that describe the key
  /// schema for the table and indexes.
  ///
  /// [tableName]: The name of the table to create.
  ///
  /// [keySchema]: Specifies the attributes that make up the primary key for a
  /// table or an index. The attributes in `KeySchema` must also be defined in
  /// the `AttributeDefinitions` array. For more information, see
  /// [Data Model](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DataModel.html)
  /// in the _Amazon DynamoDB Developer Guide_.
  ///
  /// Each `KeySchemaElement` in the array is composed of:
  ///
  /// *    `AttributeName` - The name of this key attribute.
  ///
  /// *    `KeyType` - The role that the key attribute will assume:
  ///
  ///     *    `HASH` - partition key
  ///
  ///     *    `RANGE` - sort key
  ///
  ///
  ///
  ///  The partition key of an item is also known as its _hash attribute_. The
  /// term "hash attribute" derives from the DynamoDB usage of an internal hash
  /// function to evenly distribute data items across partitions, based on their
  /// partition key values.
  ///
  /// The sort key of an item is also known as its _range attribute_. The term
  /// "range attribute" derives from the way DynamoDB stores items with the same
  /// partition key physically close together, in sorted order by the sort key
  /// value.
  ///
  /// For a simple primary key (partition key), you must provide exactly one
  /// element with a `KeyType` of `HASH`.
  ///
  /// For a composite primary key (partition key and sort key), you must provide
  /// exactly two elements, in this order: The first element must have a
  /// `KeyType` of `HASH`, and the second element must have a `KeyType` of
  /// `RANGE`.
  ///
  /// For more information, see
  /// [Working with Tables](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/WorkingWithTables.html#WorkingWithTables.primary.key)
  /// in the _Amazon DynamoDB Developer Guide_.
  ///
  /// [localSecondaryIndexes]: One or more local secondary indexes (the maximum
  /// is 5) to be created on the table. Each index is scoped to a given
  /// partition key value. There is a 10 GB size limit per partition key value;
  /// otherwise, the size of a local secondary index is unconstrained.
  ///
  /// Each local secondary index in the array includes the following:
  ///
  /// *    `IndexName` - The name of the local secondary index. Must be unique
  /// only for this table.
  ///
  /// *    `KeySchema` - Specifies the key schema for the local secondary index.
  /// The key schema must begin with the same partition key as the table.
  ///
  /// *    `Projection` - Specifies attributes that are copied (projected) from
  /// the table into the index. These are in addition to the primary key
  /// attributes and index key attributes, which are automatically projected.
  /// Each attribute specification is composed of:
  ///
  ///     *    `ProjectionType` - One of the following:
  ///
  ///         *    `KEYS_ONLY` - Only the index and primary keys are projected
  /// into the index.
  ///
  ///         *    `INCLUDE` - Only the specified table attributes are projected
  /// into the index. The list of projected attributes is in `NonKeyAttributes`.
  ///
  ///         *    `ALL` - All of the table attributes are projected into the
  /// index.
  ///
  ///
  ///     *    `NonKeyAttributes` - A list of one or more non-key attribute
  /// names that are projected into the secondary index. The total count of
  /// attributes provided in `NonKeyAttributes`, summed across all of the
  /// secondary indexes, must not exceed 100. If you project the same attribute
  /// into two different indexes, this counts as two distinct attributes when
  /// determining the total.
  ///
  /// [globalSecondaryIndexes]: One or more global secondary indexes (the
  /// maximum is 20) to be created on the table. Each global secondary index in
  /// the array includes the following:
  ///
  /// *    `IndexName` - The name of the global secondary index. Must be unique
  /// only for this table.
  ///
  /// *    `KeySchema` - Specifies the key schema for the global secondary
  /// index.
  ///
  /// *    `Projection` - Specifies attributes that are copied (projected) from
  /// the table into the index. These are in addition to the primary key
  /// attributes and index key attributes, which are automatically projected.
  /// Each attribute specification is composed of:
  ///
  ///     *    `ProjectionType` - One of the following:
  ///
  ///         *    `KEYS_ONLY` - Only the index and primary keys are projected
  /// into the index.
  ///
  ///         *    `INCLUDE` - Only the specified table attributes are projected
  /// into the index. The list of projected attributes is in `NonKeyAttributes`.
  ///
  ///         *    `ALL` - All of the table attributes are projected into the
  /// index.
  ///
  ///
  ///     *    `NonKeyAttributes` - A list of one or more non-key attribute
  /// names that are projected into the secondary index. The total count of
  /// attributes provided in `NonKeyAttributes`, summed across all of the
  /// secondary indexes, must not exceed 100. If you project the same attribute
  /// into two different indexes, this counts as two distinct attributes when
  /// determining the total.
  ///
  ///
  /// *    `ProvisionedThroughput` - The provisioned throughput settings for the
  /// global secondary index, consisting of read and write capacity units.
  ///
  /// [billingMode]: Controls how you are charged for read and write throughput
  /// and how you manage capacity. This setting can be changed later.
  ///
  /// *    `PROVISIONED` - Sets the billing mode to `PROVISIONED`. We recommend
  /// using `PROVISIONED` for predictable workloads.
  ///
  /// *    `PAY_PER_REQUEST` - Sets the billing mode to `PAY_PER_REQUEST`. We
  /// recommend using `PAY_PER_REQUEST` for unpredictable workloads.
  ///
  /// [provisionedThroughput]: Represents the provisioned throughput settings
  /// for a specified table or index. The settings can be modified using the
  /// `UpdateTable` operation.
  ///
  ///  If you set BillingMode as `PROVISIONED`, you must specify this property.
  /// If you set BillingMode as `PAY_PER_REQUEST`, you cannot specify this
  /// property.
  ///
  /// For current minimum and maximum provisioned throughput values, see
  /// [Limits](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html)
  /// in the _Amazon DynamoDB Developer Guide_.
  ///
  /// [streamSpecification]: The settings for DynamoDB Streams on the table.
  /// These settings consist of:
  ///
  /// *    `StreamEnabled` - Indicates whether DynamoDB Streams is to be enabled
  /// (true) or disabled (false).
  ///
  /// *    `StreamViewType` - When an item in the table is modified,
  /// `StreamViewType` determines what information is written to the table's
  /// stream. Valid values for `StreamViewType` are:
  ///
  ///     *    `KEYS_ONLY` - Only the key attributes of the modified item are
  /// written to the stream.
  ///
  ///     *    `NEW_IMAGE` - The entire item, as it appears after it was
  /// modified, is written to the stream.
  ///
  ///     *    `OLD_IMAGE` - The entire item, as it appeared before it was
  /// modified, is written to the stream.
  ///
  ///     *    `NEW_AND_OLD_IMAGES` - Both the new and the old item images of
  /// the item are written to the stream.
  ///
  /// [sseSpecification]: Represents the settings used to enable server-side
  /// encryption.
  ///
  /// [tags]: A list of key-value pairs to label the table. For more
  /// information, see
  /// [Tagging for DynamoDB](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Tagging.html).
  Future<CreateTableOutput> createTable(
      {@required List<AttributeDefinition> attributeDefinitions,
      @required String tableName,
      @required List<KeySchemaElement> keySchema,
      List<LocalSecondaryIndex> localSecondaryIndexes,
      List<GlobalSecondaryIndex> globalSecondaryIndexes,
      String billingMode,
      ProvisionedThroughput provisionedThroughput,
      StreamSpecification streamSpecification,
      SseSpecification sseSpecification,
      List<Tag> tags}) async {
    var response_ = await _client.send('CreateTable', {
      'AttributeDefinitions': attributeDefinitions,
      'TableName': tableName,
      'KeySchema': keySchema,
      if (localSecondaryIndexes != null)
        'LocalSecondaryIndexes': localSecondaryIndexes,
      if (globalSecondaryIndexes != null)
        'GlobalSecondaryIndexes': globalSecondaryIndexes,
      if (billingMode != null) 'BillingMode': billingMode,
      if (provisionedThroughput != null)
        'ProvisionedThroughput': provisionedThroughput,
      if (streamSpecification != null)
        'StreamSpecification': streamSpecification,
      if (sseSpecification != null) 'SSESpecification': sseSpecification,
      if (tags != null) 'Tags': tags,
    });
    return CreateTableOutput.fromJson(response_);
  }

  /// Deletes an existing backup of a table.
  ///
  /// You can call `DeleteBackup` at a maximum rate of 10 times per second.
  ///
  /// [backupArn]: The ARN associated with the backup.
  Future<DeleteBackupOutput> deleteBackup(String backupArn) async {
    var response_ = await _client.send('DeleteBackup', {
      'BackupArn': backupArn,
    });
    return DeleteBackupOutput.fromJson(response_);
  }

  /// Deletes a single item in a table by primary key. You can perform a
  /// conditional delete operation that deletes the item if it exists, or if it
  /// has an expected attribute value.
  ///
  /// In addition to deleting an item, you can also return the item's attribute
  /// values in the same operation, using the `ReturnValues` parameter.
  ///
  /// Unless you specify conditions, the `DeleteItem` is an idempotent
  /// operation; running it multiple times on the same item or attribute does
  /// _not_ result in an error response.
  ///
  /// Conditional deletes are useful for deleting items only if specific
  /// conditions are met. If those conditions are met, DynamoDB performs the
  /// delete. Otherwise, the item is not deleted.
  ///
  /// [tableName]: The name of the table from which to delete the item.
  ///
  /// [key]: A map of attribute names to `AttributeValue` objects, representing
  /// the primary key of the item to delete.
  ///
  /// For the primary key, you must provide all of the attributes. For example,
  /// with a simple primary key, you only need to provide a value for the
  /// partition key. For a composite primary key, you must provide values for
  /// both the partition key and the sort key.
  ///
  /// [expected]: This is a legacy parameter. Use `ConditionExpression` instead.
  /// For more information, see
  /// [Expected](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.Expected.html)
  /// in the _Amazon DynamoDB Developer Guide_.
  ///
  /// [conditionalOperator]: This is a legacy parameter. Use
  /// `ConditionExpression` instead. For more information, see
  /// [ConditionalOperator](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.ConditionalOperator.html)
  /// in the _Amazon DynamoDB Developer Guide_.
  ///
  /// [returnValues]: Use `ReturnValues` if you want to get the item attributes
  /// as they appeared before they were deleted. For `DeleteItem`, the valid
  /// values are:
  ///
  /// *    `NONE` - If `ReturnValues` is not specified, or if its value is
  /// `NONE`, then nothing is returned. (This setting is the default for
  /// `ReturnValues`.)
  ///
  /// *    `ALL_OLD` - The content of the old item is returned.
  ///
  ///
  ///
  ///
  /// The `ReturnValues` parameter is used by several DynamoDB operations;
  /// however, `DeleteItem` does not recognize any values other than `NONE` or
  /// `ALL_OLD`.
  ///
  /// [returnItemCollectionMetrics]: Determines whether item collection metrics
  /// are returned. If set to `SIZE`, the response includes statistics about
  /// item collections, if any, that were modified during the operation are
  /// returned in the response. If set to `NONE` (the default), no statistics
  /// are returned.
  ///
  /// [conditionExpression]: A condition that must be satisfied in order for a
  /// conditional `DeleteItem` to succeed.
  ///
  /// An expression can contain any of the following:
  ///
  /// *   Functions: `attribute_exists | attribute_not_exists | attribute_type |
  /// contains | begins_with | size`
  ///
  ///     These function names are case-sensitive.
  ///
  /// *   Comparison operators: `= | <> | < | > | <= | >= | BETWEEN | IN`
  ///
  /// *    Logical operators: `AND | OR | NOT`
  ///
  ///
  /// For more information about condition expressions, see
  /// [Condition Expressions](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.SpecifyingConditions.html)
  /// in the _Amazon DynamoDB Developer Guide_.
  ///
  /// [expressionAttributeNames]: One or more substitution tokens for attribute
  /// names in an expression. The following are some use cases for using
  /// `ExpressionAttributeNames`:
  ///
  /// *   To access an attribute whose name conflicts with a DynamoDB reserved
  /// word.
  ///
  /// *   To create a placeholder for repeating occurrences of an attribute name
  /// in an expression.
  ///
  /// *   To prevent special characters in an attribute name from being
  /// misinterpreted in an expression.
  ///
  ///
  /// Use the **#** character in an expression to dereference an attribute name.
  /// For example, consider the following attribute name:
  ///
  /// *    `Percentile`
  ///
  ///
  /// The name of this attribute conflicts with a reserved word, so it cannot be
  /// used directly in an expression. (For the complete list of reserved words,
  /// see
  /// [Reserved Words](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html)
  /// in the _Amazon DynamoDB Developer Guide_). To work around this, you could
  /// specify the following for `ExpressionAttributeNames`:
  ///
  /// *    `{"#P":"Percentile"}`
  ///
  ///
  /// You could then use this substitution in an expression, as in this example:
  ///
  /// *    `#P = :val`
  ///
  ///
  ///  Tokens that begin with the **:** character are _expression attribute
  /// values_, which are placeholders for the actual value at runtime.
  ///
  /// For more information on expression attribute names, see
  /// [Specifying Item Attributes](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html)
  /// in the _Amazon DynamoDB Developer Guide_.
  ///
  /// [expressionAttributeValues]: One or more values that can be substituted in
  /// an expression.
  ///
  /// Use the **:** (colon) character in an expression to dereference an
  /// attribute value. For example, suppose that you wanted to check whether the
  /// value of the _ProductStatus_ attribute was one of the following:
  ///
  ///  `Available | Backordered | Discontinued`
  ///
  /// You would first need to specify `ExpressionAttributeValues` as follows:
  ///
  ///  `{ ":avail":{"S":"Available"}, ":back":{"S":"Backordered"},
  /// ":disc":{"S":"Discontinued"} }`
  ///
  /// You could then use these values in an expression, such as this:
  ///
  ///  `ProductStatus IN (:avail, :back, :disc)`
  ///
  /// For more information on expression attribute values, see
  /// [Condition Expressions](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.SpecifyingConditions.html)
  /// in the _Amazon DynamoDB Developer Guide_.
  Future<DeleteItemOutput> deleteItem(
      {@required String tableName,
      @required Map<String, AttributeValue> key,
      Map<String, ExpectedAttributeValue> expected,
      String conditionalOperator,
      String returnValues,
      String returnConsumedCapacity,
      String returnItemCollectionMetrics,
      String conditionExpression,
      Map<String, String> expressionAttributeNames,
      Map<String, AttributeValue> expressionAttributeValues}) async {
    var response_ = await _client.send('DeleteItem', {
      'TableName': tableName,
      'Key': key,
      if (expected != null) 'Expected': expected,
      if (conditionalOperator != null)
        'ConditionalOperator': conditionalOperator,
      if (returnValues != null) 'ReturnValues': returnValues,
      if (returnConsumedCapacity != null)
        'ReturnConsumedCapacity': returnConsumedCapacity,
      if (returnItemCollectionMetrics != null)
        'ReturnItemCollectionMetrics': returnItemCollectionMetrics,
      if (conditionExpression != null)
        'ConditionExpression': conditionExpression,
      if (expressionAttributeNames != null)
        'ExpressionAttributeNames': expressionAttributeNames,
      if (expressionAttributeValues != null)
        'ExpressionAttributeValues': expressionAttributeValues,
    });
    return DeleteItemOutput.fromJson(response_);
  }

  /// The `DeleteTable` operation deletes a table and all of its items. After a
  /// `DeleteTable` request, the specified table is in the `DELETING` state
  /// until DynamoDB completes the deletion. If the table is in the `ACTIVE`
  /// state, you can delete it. If a table is in `CREATING` or `UPDATING`
  /// states, then DynamoDB returns a `ResourceInUseException`. If the specified
  /// table does not exist, DynamoDB returns a `ResourceNotFoundException`. If
  /// table is already in the `DELETING` state, no error is returned.
  ///
  ///  DynamoDB might continue to accept data read and write operations, such as
  /// `GetItem` and `PutItem`, on a table in the `DELETING` state until the
  /// table deletion is complete.
  ///
  /// When you delete a table, any indexes on that table are also deleted.
  ///
  /// If you have DynamoDB Streams enabled on the table, then the corresponding
  /// stream on that table goes into the `DISABLED` state, and the stream is
  /// automatically deleted after 24 hours.
  ///
  /// Use the `DescribeTable` action to check the status of the table.
  ///
  /// [tableName]: The name of the table to delete.
  Future<DeleteTableOutput> deleteTable(String tableName) async {
    var response_ = await _client.send('DeleteTable', {
      'TableName': tableName,
    });
    return DeleteTableOutput.fromJson(response_);
  }

  /// Describes an existing backup of a table.
  ///
  /// You can call `DescribeBackup` at a maximum rate of 10 times per second.
  ///
  /// [backupArn]: The Amazon Resource Name (ARN) associated with the backup.
  Future<DescribeBackupOutput> describeBackup(String backupArn) async {
    var response_ = await _client.send('DescribeBackup', {
      'BackupArn': backupArn,
    });
    return DescribeBackupOutput.fromJson(response_);
  }

  /// Checks the status of continuous backups and point in time recovery on the
  /// specified table. Continuous backups are `ENABLED` on all tables at table
  /// creation. If point in time recovery is enabled,
  /// `PointInTimeRecoveryStatus` will be set to ENABLED.
  ///
  ///  After continuous backups and point in time recovery are enabled, you can
  /// restore to any point in time within `EarliestRestorableDateTime` and
  /// `LatestRestorableDateTime`.
  ///
  ///  `LatestRestorableDateTime` is typically 5 minutes before the current
  /// time. You can restore your table to any point in time during the last 35
  /// days.
  ///
  /// You can call `DescribeContinuousBackups` at a maximum rate of 10 times per
  /// second.
  ///
  /// [tableName]: Name of the table for which the customer wants to check the
  /// continuous backups and point in time recovery settings.
  Future<DescribeContinuousBackupsOutput> describeContinuousBackups(
      String tableName) async {
    var response_ = await _client.send('DescribeContinuousBackups', {
      'TableName': tableName,
    });
    return DescribeContinuousBackupsOutput.fromJson(response_);
  }

  /// Returns the regional endpoint information.
  Future<DescribeEndpointsResponse> describeEndpoints() async {
    var response_ = await _client.send('DescribeEndpoints', {});
    return DescribeEndpointsResponse.fromJson(response_);
  }

  /// Returns information about the specified global table.
  ///
  /// [globalTableName]: The name of the global table.
  Future<DescribeGlobalTableOutput> describeGlobalTable(
      String globalTableName) async {
    var response_ = await _client.send('DescribeGlobalTable', {
      'GlobalTableName': globalTableName,
    });
    return DescribeGlobalTableOutput.fromJson(response_);
  }

  /// Describes Region-specific settings for a global table.
  ///
  /// [globalTableName]: The name of the global table to describe.
  Future<DescribeGlobalTableSettingsOutput> describeGlobalTableSettings(
      String globalTableName) async {
    var response_ = await _client.send('DescribeGlobalTableSettings', {
      'GlobalTableName': globalTableName,
    });
    return DescribeGlobalTableSettingsOutput.fromJson(response_);
  }

  /// Returns the current provisioned-capacity limits for your AWS account in a
  /// Region, both for the Region as a whole and for any one DynamoDB table that
  /// you create there.
  ///
  /// When you establish an AWS account, the account has initial limits on the
  /// maximum read capacity units and write capacity units that you can
  /// provision across all of your DynamoDB tables in a given Region. Also,
  /// there are per-table limits that apply when you create a table there. For
  /// more information, see
  /// [Limits](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html)
  /// page in the _Amazon DynamoDB Developer Guide_.
  ///
  /// Although you can increase these limits by filing a case at
  /// [AWS Support Center](https://console.aws.amazon.com/support/home#/),
  /// obtaining the increase is not instantaneous. The `DescribeLimits` action
  /// lets you write code to compare the capacity you are currently using to
  /// those limits imposed by your account so that you have enough time to apply
  /// for an increase before you hit a limit.
  ///
  /// For example, you could use one of the AWS SDKs to do the following:
  ///
  /// 1.  Call `DescribeLimits` for a particular Region to obtain your current
  /// account limits on provisioned capacity there.
  ///
  /// 2.  Create a variable to hold the aggregate read capacity units
  /// provisioned for all your tables in that Region, and one to hold the
  /// aggregate write capacity units. Zero them both.
  ///
  /// 3.  Call `ListTables` to obtain a list of all your DynamoDB tables.
  ///
  /// 4.  For each table name listed by `ListTables`, do the following:
  ///
  ///     *   Call `DescribeTable` with the table name.
  ///
  ///     *   Use the data returned by `DescribeTable` to add the read capacity
  /// units and write capacity units provisioned for the table itself to your
  /// variables.
  ///
  ///     *   If the table has one or more global secondary indexes (GSIs), loop
  /// over these GSIs and add their provisioned capacity values to your
  /// variables as well.
  ///
  ///
  /// 5.  Report the account limits for that Region returned by
  /// `DescribeLimits`, along with the total current provisioned capacity levels
  /// you have calculated.
  ///
  ///
  /// This will let you see whether you are getting close to your account-level
  /// limits.
  ///
  /// The per-table limits apply only when you are creating a new table. They
  /// restrict the sum of the provisioned capacity of the new table itself and
  /// all its global secondary indexes.
  ///
  /// For existing tables and their GSIs, DynamoDB doesn't let you increase
  /// provisioned capacity extremely rapidly. But the only upper limit that
  /// applies is that the aggregate provisioned capacity over all your tables
  /// and GSIs cannot exceed either of the per-account limits.
  ///
  ///   `DescribeLimits` should only be called periodically. You can expect
  /// throttling errors if you call it more than once in a minute.
  ///
  /// The `DescribeLimits` Request element has no content.
  Future<DescribeLimitsOutput> describeLimits() async {
    var response_ = await _client.send('DescribeLimits', {});
    return DescribeLimitsOutput.fromJson(response_);
  }

  /// Returns information about the table, including the current status of the
  /// table, when it was created, the primary key schema, and any indexes on the
  /// table.
  ///
  ///
  ///
  /// If you issue a `DescribeTable` request immediately after a `CreateTable`
  /// request, DynamoDB might return a `ResourceNotFoundException`. This is
  /// because `DescribeTable` uses an eventually consistent query, and the
  /// metadata for your table might not be available at that moment. Wait for a
  /// few seconds, and then try the `DescribeTable` request again.
  ///
  /// [tableName]: The name of the table to describe.
  Future<DescribeTableOutput> describeTable(String tableName) async {
    var response_ = await _client.send('DescribeTable', {
      'TableName': tableName,
    });
    return DescribeTableOutput.fromJson(response_);
  }

  /// Gives a description of the Time to Live (TTL) status on the specified
  /// table.
  ///
  /// [tableName]: The name of the table to be described.
  Future<DescribeTimeToLiveOutput> describeTimeToLive(String tableName) async {
    var response_ = await _client.send('DescribeTimeToLive', {
      'TableName': tableName,
    });
    return DescribeTimeToLiveOutput.fromJson(response_);
  }

  /// The `GetItem` operation returns a set of attributes for the item with the
  /// given primary key. If there is no matching item, `GetItem` does not return
  /// any data and there will be no `Item` element in the response.
  ///
  ///  `GetItem` provides an eventually consistent read by default. If your
  /// application requires a strongly consistent read, set `ConsistentRead` to
  /// `true`. Although a strongly consistent read might take more time than an
  /// eventually consistent read, it always returns the last updated value.
  ///
  /// [tableName]: The name of the table containing the requested item.
  ///
  /// [key]: A map of attribute names to `AttributeValue` objects, representing
  /// the primary key of the item to retrieve.
  ///
  /// For the primary key, you must provide all of the attributes. For example,
  /// with a simple primary key, you only need to provide a value for the
  /// partition key. For a composite primary key, you must provide values for
  /// both the partition key and the sort key.
  ///
  /// [attributesToGet]: This is a legacy parameter. Use `ProjectionExpression`
  /// instead. For more information, see
  /// [AttributesToGet](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.AttributesToGet.html)
  /// in the _Amazon DynamoDB Developer Guide_.
  ///
  /// [consistentRead]: Determines the read consistency model: If set to `true`,
  /// then the operation uses strongly consistent reads; otherwise, the
  /// operation uses eventually consistent reads.
  ///
  /// [projectionExpression]: A string that identifies one or more attributes to
  /// retrieve from the table. These attributes can include scalars, sets, or
  /// elements of a JSON document. The attributes in the expression must be
  /// separated by commas.
  ///
  /// If no attribute names are specified, then all attributes are returned. If
  /// any of the requested attributes are not found, they do not appear in the
  /// result.
  ///
  /// For more information, see
  /// [Specifying Item Attributes](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html)
  /// in the _Amazon DynamoDB Developer Guide_.
  ///
  /// [expressionAttributeNames]: One or more substitution tokens for attribute
  /// names in an expression. The following are some use cases for using
  /// `ExpressionAttributeNames`:
  ///
  /// *   To access an attribute whose name conflicts with a DynamoDB reserved
  /// word.
  ///
  /// *   To create a placeholder for repeating occurrences of an attribute name
  /// in an expression.
  ///
  /// *   To prevent special characters in an attribute name from being
  /// misinterpreted in an expression.
  ///
  ///
  /// Use the **#** character in an expression to dereference an attribute name.
  /// For example, consider the following attribute name:
  ///
  /// *    `Percentile`
  ///
  ///
  /// The name of this attribute conflicts with a reserved word, so it cannot be
  /// used directly in an expression. (For the complete list of reserved words,
  /// see
  /// [Reserved Words](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html)
  /// in the _Amazon DynamoDB Developer Guide_). To work around this, you could
  /// specify the following for `ExpressionAttributeNames`:
  ///
  /// *    `{"#P":"Percentile"}`
  ///
  ///
  /// You could then use this substitution in an expression, as in this example:
  ///
  /// *    `#P = :val`
  ///
  ///
  ///  Tokens that begin with the **:** character are _expression attribute
  /// values_, which are placeholders for the actual value at runtime.
  ///
  /// For more information on expression attribute names, see
  /// [Specifying Item Attributes](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html)
  /// in the _Amazon DynamoDB Developer Guide_.
  Future<GetItemOutput> getItem(
      {@required String tableName,
      @required Map<String, AttributeValue> key,
      List<String> attributesToGet,
      bool consistentRead,
      String returnConsumedCapacity,
      String projectionExpression,
      Map<String, String> expressionAttributeNames}) async {
    var response_ = await _client.send('GetItem', {
      'TableName': tableName,
      'Key': key,
      if (attributesToGet != null) 'AttributesToGet': attributesToGet,
      if (consistentRead != null) 'ConsistentRead': consistentRead,
      if (returnConsumedCapacity != null)
        'ReturnConsumedCapacity': returnConsumedCapacity,
      if (projectionExpression != null)
        'ProjectionExpression': projectionExpression,
      if (expressionAttributeNames != null)
        'ExpressionAttributeNames': expressionAttributeNames,
    });
    return GetItemOutput.fromJson(response_);
  }

  /// List backups associated with an AWS account. To list backups for a given
  /// table, specify `TableName`. `ListBackups` returns a paginated list of
  /// results with at most 1 MB worth of items in a page. You can also specify a
  /// limit for the maximum number of entries to be returned in a page.
  ///
  /// In the request, start time is inclusive, but end time is exclusive. Note
  /// that these limits are for the time at which the original backup was
  /// requested.
  ///
  /// You can call `ListBackups` a maximum of five times per second.
  ///
  /// [tableName]: The backups from the table specified by `TableName` are
  /// listed.
  ///
  /// [limit]: Maximum number of backups to return at once.
  ///
  /// [timeRangeLowerBound]: Only backups created after this time are listed.
  /// `TimeRangeLowerBound` is inclusive.
  ///
  /// [timeRangeUpperBound]: Only backups created before this time are listed.
  /// `TimeRangeUpperBound` is exclusive.
  ///
  /// [exclusiveStartBackupArn]:  `LastEvaluatedBackupArn` is the Amazon
  /// Resource Name (ARN) of the backup last evaluated when the current page of
  /// results was returned, inclusive of the current page of results. This value
  /// may be specified as the `ExclusiveStartBackupArn` of a new `ListBackups`
  /// operation in order to fetch the next page of results.
  ///
  /// [backupType]: The backups from the table specified by `BackupType` are
  /// listed.
  ///
  /// Where `BackupType` can be:
  ///
  /// *    `USER` - On-demand backup created by you.
  ///
  /// *    `SYSTEM` - On-demand backup automatically created by DynamoDB.
  ///
  /// *    `ALL` - All types of on-demand backups (USER and SYSTEM).
  Future<ListBackupsOutput> listBackups(
      {String tableName,
      int limit,
      DateTime timeRangeLowerBound,
      DateTime timeRangeUpperBound,
      String exclusiveStartBackupArn,
      String backupType}) async {
    var response_ = await _client.send('ListBackups', {
      if (tableName != null) 'TableName': tableName,
      if (limit != null) 'Limit': limit,
      if (timeRangeLowerBound != null)
        'TimeRangeLowerBound': timeRangeLowerBound,
      if (timeRangeUpperBound != null)
        'TimeRangeUpperBound': timeRangeUpperBound,
      if (exclusiveStartBackupArn != null)
        'ExclusiveStartBackupArn': exclusiveStartBackupArn,
      if (backupType != null) 'BackupType': backupType,
    });
    return ListBackupsOutput.fromJson(response_);
  }

  /// Lists all global tables that have a replica in the specified Region.
  ///
  /// [exclusiveStartGlobalTableName]: The first global table name that this
  /// operation will evaluate.
  ///
  /// [limit]: The maximum number of table names to return.
  ///
  /// [regionName]: Lists the global tables in a specific Region.
  Future<ListGlobalTablesOutput> listGlobalTables(
      {String exclusiveStartGlobalTableName,
      int limit,
      String regionName}) async {
    var response_ = await _client.send('ListGlobalTables', {
      if (exclusiveStartGlobalTableName != null)
        'ExclusiveStartGlobalTableName': exclusiveStartGlobalTableName,
      if (limit != null) 'Limit': limit,
      if (regionName != null) 'RegionName': regionName,
    });
    return ListGlobalTablesOutput.fromJson(response_);
  }

  /// Returns an array of table names associated with the current account and
  /// endpoint. The output from `ListTables` is paginated, with each page
  /// returning a maximum of 100 table names.
  ///
  /// [exclusiveStartTableName]: The first table name that this operation will
  /// evaluate. Use the value that was returned for `LastEvaluatedTableName` in
  /// a previous operation, so that you can obtain the next page of results.
  ///
  /// [limit]: A maximum number of table names to return. If this parameter is
  /// not specified, the limit is 100.
  Future<ListTablesOutput> listTables(
      {String exclusiveStartTableName, int limit}) async {
    var response_ = await _client.send('ListTables', {
      if (exclusiveStartTableName != null)
        'ExclusiveStartTableName': exclusiveStartTableName,
      if (limit != null) 'Limit': limit,
    });
    return ListTablesOutput.fromJson(response_);
  }

  /// List all tags on an Amazon DynamoDB resource. You can call
  /// ListTagsOfResource up to 10 times per second, per account.
  ///
  /// For an overview on tagging DynamoDB resources, see
  /// [Tagging for DynamoDB](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Tagging.html)
  /// in the _Amazon DynamoDB Developer Guide_.
  ///
  /// [resourceArn]: The Amazon DynamoDB resource with tags to be listed. This
  /// value is an Amazon Resource Name (ARN).
  ///
  /// [nextToken]: An optional string that, if supplied, must be copied from the
  /// output of a previous call to ListTagOfResource. When provided in this
  /// manner, this API fetches the next page of results.
  Future<ListTagsOfResourceOutput> listTagsOfResource(String resourceArn,
      {String nextToken}) async {
    var response_ = await _client.send('ListTagsOfResource', {
      'ResourceArn': resourceArn,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListTagsOfResourceOutput.fromJson(response_);
  }

  /// Creates a new item, or replaces an old item with a new item. If an item
  /// that has the same primary key as the new item already exists in the
  /// specified table, the new item completely replaces the existing item. You
  /// can perform a conditional put operation (add a new item if one with the
  /// specified primary key doesn't exist), or replace an existing item if it
  /// has certain attribute values. You can return the item's attribute values
  /// in the same operation, using the `ReturnValues` parameter.
  ///
  ///  This topic provides general information about the `PutItem` API.
  ///
  /// For information on how to call the `PutItem` API using the AWS SDK in
  /// specific languages, see the following:
  ///
  /// *
  /// [PutItem in the AWS Command Line Interface](http://docs.aws.amazon.com/goto/aws-cli/dynamodb-2012-08-10/PutItem)
  ///
  /// *
  /// [PutItem in the AWS SDK for .NET](http://docs.aws.amazon.com/goto/DotNetSDKV3/dynamodb-2012-08-10/PutItem)
  ///
  /// *
  /// [PutItem in the AWS SDK for C++](http://docs.aws.amazon.com/goto/SdkForCpp/dynamodb-2012-08-10/PutItem)
  ///
  /// *
  /// [PutItem in the AWS SDK for Go](http://docs.aws.amazon.com/goto/SdkForGoV1/dynamodb-2012-08-10/PutItem)
  ///
  /// *
  /// [PutItem in the AWS SDK for Java](http://docs.aws.amazon.com/goto/SdkForJava/dynamodb-2012-08-10/PutItem)
  ///
  /// *
  /// [PutItem in the AWS SDK for JavaScript](http://docs.aws.amazon.com/goto/AWSJavaScriptSDK/dynamodb-2012-08-10/PutItem)
  ///
  /// *
  /// [PutItem in the AWS SDK for PHP V3](http://docs.aws.amazon.com/goto/SdkForPHPV3/dynamodb-2012-08-10/PutItem)
  ///
  /// *
  /// [PutItem in the AWS SDK for Python](http://docs.aws.amazon.com/goto/boto3/dynamodb-2012-08-10/PutItem)
  ///
  /// *
  /// [PutItem in the AWS SDK for Ruby V2](http://docs.aws.amazon.com/goto/SdkForRubyV2/dynamodb-2012-08-10/PutItem)
  ///
  ///
  /// When you add an item, the primary key attributes are the only required
  /// attributes. Attribute values cannot be null. String and Binary type
  /// attributes must have lengths greater than zero. Set type attributes cannot
  /// be empty. Requests with empty values will be rejected with a
  /// `ValidationException` exception.
  ///
  ///  To prevent a new item from replacing an existing item, use a conditional
  /// expression that contains the `attribute_not_exists` function with the name
  /// of the attribute being used as the partition key for the table. Since
  /// every record must contain that attribute, the `attribute_not_exists`
  /// function will only succeed if no matching item exists.
  ///
  /// For more information about `PutItem`, see
  /// [Working with Items](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/WorkingWithItems.html)
  /// in the _Amazon DynamoDB Developer Guide_.
  ///
  /// [tableName]: The name of the table to contain the item.
  ///
  /// [item]: A map of attribute name/value pairs, one for each attribute. Only
  /// the primary key attributes are required; you can optionally provide other
  /// attribute name-value pairs for the item.
  ///
  /// You must provide all of the attributes for the primary key. For example,
  /// with a simple primary key, you only need to provide a value for the
  /// partition key. For a composite primary key, you must provide both values
  /// for both the partition key and the sort key.
  ///
  /// If you specify any attributes that are part of an index key, then the data
  /// types for those attributes must match those of the schema in the table's
  /// attribute definition.
  ///
  /// For more information about primary keys, see
  /// [Primary Key](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.CoreComponents.html#HowItWorks.CoreComponents.PrimaryKey)
  /// in the _Amazon DynamoDB Developer Guide_.
  ///
  /// Each element in the `Item` map is an `AttributeValue` object.
  ///
  /// [expected]: This is a legacy parameter. Use `ConditionExpression` instead.
  /// For more information, see
  /// [Expected](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.Expected.html)
  /// in the _Amazon DynamoDB Developer Guide_.
  ///
  /// [returnValues]: Use `ReturnValues` if you want to get the item attributes
  /// as they appeared before they were updated with the `PutItem` request. For
  /// `PutItem`, the valid values are:
  ///
  /// *    `NONE` - If `ReturnValues` is not specified, or if its value is
  /// `NONE`, then nothing is returned. (This setting is the default for
  /// `ReturnValues`.)
  ///
  /// *    `ALL_OLD` - If `PutItem` overwrote an attribute name-value pair, then
  /// the content of the old item is returned.
  ///
  ///
  ///
  ///
  /// The `ReturnValues` parameter is used by several DynamoDB operations;
  /// however, `PutItem` does not recognize any values other than `NONE` or
  /// `ALL_OLD`.
  ///
  /// [returnItemCollectionMetrics]: Determines whether item collection metrics
  /// are returned. If set to `SIZE`, the response includes statistics about
  /// item collections, if any, that were modified during the operation are
  /// returned in the response. If set to `NONE` (the default), no statistics
  /// are returned.
  ///
  /// [conditionalOperator]: This is a legacy parameter. Use
  /// `ConditionExpression` instead. For more information, see
  /// [ConditionalOperator](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.ConditionalOperator.html)
  /// in the _Amazon DynamoDB Developer Guide_.
  ///
  /// [conditionExpression]: A condition that must be satisfied in order for a
  /// conditional `PutItem` operation to succeed.
  ///
  /// An expression can contain any of the following:
  ///
  /// *   Functions: `attribute_exists | attribute_not_exists | attribute_type |
  /// contains | begins_with | size`
  ///
  ///     These function names are case-sensitive.
  ///
  /// *   Comparison operators: `= | <> | < | > | <= | >= | BETWEEN | IN`
  ///
  /// *    Logical operators: `AND | OR | NOT`
  ///
  ///
  /// For more information on condition expressions, see
  /// [Condition Expressions](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.SpecifyingConditions.html)
  /// in the _Amazon DynamoDB Developer Guide_.
  ///
  /// [expressionAttributeNames]: One or more substitution tokens for attribute
  /// names in an expression. The following are some use cases for using
  /// `ExpressionAttributeNames`:
  ///
  /// *   To access an attribute whose name conflicts with a DynamoDB reserved
  /// word.
  ///
  /// *   To create a placeholder for repeating occurrences of an attribute name
  /// in an expression.
  ///
  /// *   To prevent special characters in an attribute name from being
  /// misinterpreted in an expression.
  ///
  ///
  /// Use the **#** character in an expression to dereference an attribute name.
  /// For example, consider the following attribute name:
  ///
  /// *    `Percentile`
  ///
  ///
  /// The name of this attribute conflicts with a reserved word, so it cannot be
  /// used directly in an expression. (For the complete list of reserved words,
  /// see
  /// [Reserved Words](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html)
  /// in the _Amazon DynamoDB Developer Guide_). To work around this, you could
  /// specify the following for `ExpressionAttributeNames`:
  ///
  /// *    `{"#P":"Percentile"}`
  ///
  ///
  /// You could then use this substitution in an expression, as in this example:
  ///
  /// *    `#P = :val`
  ///
  ///
  ///  Tokens that begin with the **:** character are _expression attribute
  /// values_, which are placeholders for the actual value at runtime.
  ///
  /// For more information on expression attribute names, see
  /// [Specifying Item Attributes](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html)
  /// in the _Amazon DynamoDB Developer Guide_.
  ///
  /// [expressionAttributeValues]: One or more values that can be substituted in
  /// an expression.
  ///
  /// Use the **:** (colon) character in an expression to dereference an
  /// attribute value. For example, suppose that you wanted to check whether the
  /// value of the _ProductStatus_ attribute was one of the following:
  ///
  ///  `Available | Backordered | Discontinued`
  ///
  /// You would first need to specify `ExpressionAttributeValues` as follows:
  ///
  ///  `{ ":avail":{"S":"Available"}, ":back":{"S":"Backordered"},
  /// ":disc":{"S":"Discontinued"} }`
  ///
  /// You could then use these values in an expression, such as this:
  ///
  ///  `ProductStatus IN (:avail, :back, :disc)`
  ///
  /// For more information on expression attribute values, see
  /// [Condition Expressions](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.SpecifyingConditions.html)
  /// in the _Amazon DynamoDB Developer Guide_.
  Future<PutItemOutput> putItem(
      {@required String tableName,
      @required Map<String, AttributeValue> item,
      Map<String, ExpectedAttributeValue> expected,
      String returnValues,
      String returnConsumedCapacity,
      String returnItemCollectionMetrics,
      String conditionalOperator,
      String conditionExpression,
      Map<String, String> expressionAttributeNames,
      Map<String, AttributeValue> expressionAttributeValues}) async {
    var response_ = await _client.send('PutItem', {
      'TableName': tableName,
      'Item': item,
      if (expected != null) 'Expected': expected,
      if (returnValues != null) 'ReturnValues': returnValues,
      if (returnConsumedCapacity != null)
        'ReturnConsumedCapacity': returnConsumedCapacity,
      if (returnItemCollectionMetrics != null)
        'ReturnItemCollectionMetrics': returnItemCollectionMetrics,
      if (conditionalOperator != null)
        'ConditionalOperator': conditionalOperator,
      if (conditionExpression != null)
        'ConditionExpression': conditionExpression,
      if (expressionAttributeNames != null)
        'ExpressionAttributeNames': expressionAttributeNames,
      if (expressionAttributeValues != null)
        'ExpressionAttributeValues': expressionAttributeValues,
    });
    return PutItemOutput.fromJson(response_);
  }

  /// The `Query` operation finds items based on primary key values. You can
  /// query any table or secondary index that has a composite primary key (a
  /// partition key and a sort key).
  ///
  /// Use the `KeyConditionExpression` parameter to provide a specific value for
  /// the partition key. The `Query` operation will return all of the items from
  /// the table or index with that partition key value. You can optionally
  /// narrow the scope of the `Query` operation by specifying a sort key value
  /// and a comparison operator in `KeyConditionExpression`. To further refine
  /// the `Query` results, you can optionally provide a `FilterExpression`. A
  /// `FilterExpression` determines which items within the results should be
  /// returned to you. All of the other results are discarded.
  ///
  ///  A `Query` operation always returns a result set. If no matching items are
  /// found, the result set will be empty. Queries that do not return results
  /// consume the minimum number of read capacity units for that type of read
  /// operation.
  ///
  ///   DynamoDB calculates the number of read capacity units consumed based on
  /// item size, not on the amount of data that is returned to an application.
  /// The number of capacity units consumed will be the same whether you request
  /// all of the attributes (the default behavior) or just some of them (using a
  /// projection expression). The number will also be the same whether or not
  /// you use a `FilterExpression`.
  ///
  ///  `Query` results are always sorted by the sort key value. If the data type
  /// of the sort key is Number, the results are returned in numeric order;
  /// otherwise, the results are returned in order of UTF-8 bytes. By default,
  /// the sort order is ascending. To reverse the order, set the
  /// `ScanIndexForward` parameter to false.
  ///
  ///  A single `Query` operation will read up to the maximum number of items
  /// set (if using the `Limit` parameter) or a maximum of 1 MB of data and then
  /// apply any filtering to the results using `FilterExpression`. If
  /// `LastEvaluatedKey` is present in the response, you will need to paginate
  /// the result set. For more information, see
  /// [Paginating the Results](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Query.html#Query.Pagination)
  /// in the _Amazon DynamoDB Developer Guide_.
  ///
  ///  `FilterExpression` is applied after a `Query` finishes, but before the
  /// results are returned. A `FilterExpression` cannot contain partition key or
  /// sort key attributes. You need to specify those attributes in the
  /// `KeyConditionExpression`.
  ///
  ///   A `Query` operation can return an empty result set and a
  /// `LastEvaluatedKey` if all the items read for the page of results are
  /// filtered out.
  ///
  /// You can query a table, a local secondary index, or a global secondary
  /// index. For a query on a table or on a local secondary index, you can set
  /// the `ConsistentRead` parameter to `true` and obtain a strongly consistent
  /// result. Global secondary indexes support eventually consistent reads only,
  /// so do not specify `ConsistentRead` when querying a global secondary index.
  ///
  /// [tableName]: The name of the table containing the requested items.
  ///
  /// [indexName]: The name of an index to query. This index can be any local
  /// secondary index or global secondary index on the table. Note that if you
  /// use the `IndexName` parameter, you must also provide `TableName.`
  ///
  /// [select]: The attributes to be returned in the result. You can retrieve
  /// all item attributes, specific item attributes, the count of matching
  /// items, or in the case of an index, some or all of the attributes projected
  /// into the index.
  ///
  /// *    `ALL_ATTRIBUTES` - Returns all of the item attributes from the
  /// specified table or index. If you query a local secondary index, then for
  /// each matching item in the index, DynamoDB fetches the entire item from the
  /// parent table. If the index is configured to project all item attributes,
  /// then all of the data can be obtained from the local secondary index, and
  /// no fetching is required.
  ///
  /// *    `ALL_PROJECTED_ATTRIBUTES` - Allowed only when querying an index.
  /// Retrieves all attributes that have been projected into the index. If the
  /// index is configured to project all attributes, this return value is
  /// equivalent to specifying `ALL_ATTRIBUTES`.
  ///
  /// *    `COUNT` - Returns the number of matching items, rather than the
  /// matching items themselves.
  ///
  /// *    `SPECIFIC_ATTRIBUTES` - Returns only the attributes listed in
  /// `AttributesToGet`. This return value is equivalent to specifying
  /// `AttributesToGet` without specifying any value for `Select`.
  ///
  ///     If you query or scan a local secondary index and request only
  /// attributes that are projected into that index, the operation will read
  /// only the index and not the table. If any of the requested attributes are
  /// not projected into the local secondary index, DynamoDB fetches each of
  /// these attributes from the parent table. This extra fetching incurs
  /// additional throughput cost and latency.
  ///
  ///     If you query or scan a global secondary index, you can only request
  /// attributes that are projected into the index. Global secondary index
  /// queries cannot fetch attributes from the parent table.
  ///
  ///
  /// If neither `Select` nor `AttributesToGet` are specified, DynamoDB defaults
  /// to `ALL_ATTRIBUTES` when accessing a table, and `ALL_PROJECTED_ATTRIBUTES`
  /// when accessing an index. You cannot use both `Select` and
  /// `AttributesToGet` together in a single request, unless the value for
  /// `Select` is `SPECIFIC_ATTRIBUTES`. (This usage is equivalent to specifying
  /// `AttributesToGet` without any value for `Select`.)
  ///
  ///
  ///
  /// If you use the `ProjectionExpression` parameter, then the value for
  /// `Select` can only be `SPECIFIC_ATTRIBUTES`. Any other value for `Select`
  /// will return an error.
  ///
  /// [attributesToGet]: This is a legacy parameter. Use `ProjectionExpression`
  /// instead. For more information, see
  /// [AttributesToGet](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.AttributesToGet.html)
  /// in the _Amazon DynamoDB Developer Guide_.
  ///
  /// [limit]: The maximum number of items to evaluate (not necessarily the
  /// number of matching items). If DynamoDB processes the number of items up to
  /// the limit while processing the results, it stops the operation and returns
  /// the matching values up to that point, and a key in `LastEvaluatedKey` to
  /// apply in a subsequent operation, so that you can pick up where you left
  /// off. Also, if the processed dataset size exceeds 1 MB before DynamoDB
  /// reaches this limit, it stops the operation and returns the matching values
  /// up to the limit, and a key in `LastEvaluatedKey` to apply in a subsequent
  /// operation to continue the operation. For more information, see
  /// [Query and Scan](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/QueryAndScan.html)
  /// in the _Amazon DynamoDB Developer Guide_.
  ///
  /// [consistentRead]: Determines the read consistency model: If set to `true`,
  /// then the operation uses strongly consistent reads; otherwise, the
  /// operation uses eventually consistent reads.
  ///
  /// Strongly consistent reads are not supported on global secondary indexes.
  /// If you query a global secondary index with `ConsistentRead` set to `true`,
  /// you will receive a `ValidationException`.
  ///
  /// [keyConditions]: This is a legacy parameter. Use `KeyConditionExpression`
  /// instead. For more information, see
  /// [KeyConditions](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.KeyConditions.html)
  /// in the _Amazon DynamoDB Developer Guide_.
  ///
  /// [queryFilter]: This is a legacy parameter. Use `FilterExpression` instead.
  /// For more information, see
  /// [QueryFilter](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.QueryFilter.html)
  /// in the _Amazon DynamoDB Developer Guide_.
  ///
  /// [conditionalOperator]: This is a legacy parameter. Use `FilterExpression`
  /// instead. For more information, see
  /// [ConditionalOperator](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.ConditionalOperator.html)
  /// in the _Amazon DynamoDB Developer Guide_.
  ///
  /// [scanIndexForward]: Specifies the order for index traversal: If `true`
  /// (default), the traversal is performed in ascending order; if `false`, the
  /// traversal is performed in descending order.
  ///
  /// Items with the same partition key value are stored in sorted order by sort
  /// key. If the sort key data type is Number, the results are stored in
  /// numeric order. For type String, the results are stored in order of UTF-8
  /// bytes. For type Binary, DynamoDB treats each byte of the binary data as
  /// unsigned.
  ///
  /// If `ScanIndexForward` is `true`, DynamoDB returns the results in the order
  /// in which they are stored (by sort key value). This is the default
  /// behavior. If `ScanIndexForward` is `false`, DynamoDB reads the results in
  /// reverse order by sort key value, and then returns the results to the
  /// client.
  ///
  /// [exclusiveStartKey]: The primary key of the first item that this operation
  /// will evaluate. Use the value that was returned for `LastEvaluatedKey` in
  /// the previous operation.
  ///
  /// The data type for `ExclusiveStartKey` must be String, Number, or Binary.
  /// No set data types are allowed.
  ///
  /// [projectionExpression]: A string that identifies one or more attributes to
  /// retrieve from the table. These attributes can include scalars, sets, or
  /// elements of a JSON document. The attributes in the expression must be
  /// separated by commas.
  ///
  /// If no attribute names are specified, then all attributes will be returned.
  /// If any of the requested attributes are not found, they will not appear in
  /// the result.
  ///
  /// For more information, see
  /// [Accessing Item Attributes](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html)
  /// in the _Amazon DynamoDB Developer Guide_.
  ///
  /// [filterExpression]: A string that contains conditions that DynamoDB
  /// applies after the `Query` operation, but before the data is returned to
  /// you. Items that do not satisfy the `FilterExpression` criteria are not
  /// returned.
  ///
  /// A `FilterExpression` does not allow key attributes. You cannot define a
  /// filter expression based on a partition key or a sort key.
  ///
  ///  A `FilterExpression` is applied after the items have already been read;
  /// the process of filtering does not consume any additional read capacity
  /// units.
  ///
  /// For more information, see
  /// [Filter Expressions](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/QueryAndScan.html#FilteringResults)
  /// in the _Amazon DynamoDB Developer Guide_.
  ///
  /// [keyConditionExpression]: The condition that specifies the key values for
  /// items to be retrieved by the `Query` action.
  ///
  /// The condition must perform an equality test on a single partition key
  /// value.
  ///
  /// The condition can optionally perform one of several comparison tests on a
  /// single sort key value. This allows `Query` to retrieve one item with a
  /// given partition key value and sort key value, or several items that have
  /// the same partition key value but different sort key values.
  ///
  /// The partition key equality test is required, and must be specified in the
  /// following format:
  ///
  ///  `partitionKeyName` _=_ `:partitionkeyval`
  ///
  /// If you also want to provide a condition for the sort key, it must be
  /// combined using `AND` with the condition for the sort key. Following is an
  /// example, using the **=** comparison operator for the sort key:
  ///
  ///  `partitionKeyName` `=` `:partitionkeyval` `AND` `sortKeyName` `=`
  /// `:sortkeyval`
  ///
  /// Valid comparisons for the sort key condition are as follows:
  ///
  /// *    `sortKeyName` `=` `:sortkeyval` - true if the sort key value is equal
  /// to `:sortkeyval`.
  ///
  /// *    `sortKeyName` `<` `:sortkeyval` - true if the sort key value is less
  /// than `:sortkeyval`.
  ///
  /// *    `sortKeyName` `<=` `:sortkeyval` - true if the sort key value is less
  /// than or equal to `:sortkeyval`.
  ///
  /// *    `sortKeyName` `>` `:sortkeyval` - true if the sort key value is
  /// greater than `:sortkeyval`.
  ///
  /// *    `sortKeyName` `>=`  `:sortkeyval` - true if the sort key value is
  /// greater than or equal to `:sortkeyval`.
  ///
  /// *    `sortKeyName` `BETWEEN` `:sortkeyval1` `AND` `:sortkeyval2` - true if
  /// the sort key value is greater than or equal to `:sortkeyval1`, and less
  /// than or equal to `:sortkeyval2`.
  ///
  /// *    `begins_with (` `sortKeyName`, `:sortkeyval` `)` - true if the sort
  /// key value begins with a particular operand. (You cannot use this function
  /// with a sort key that is of type Number.) Note that the function name
  /// `begins_with` is case-sensitive.
  ///
  ///
  /// Use the `ExpressionAttributeValues` parameter to replace tokens such as
  /// `:partitionval` and `:sortval` with actual values at runtime.
  ///
  /// You can optionally use the `ExpressionAttributeNames` parameter to replace
  /// the names of the partition key and sort key with placeholder tokens. This
  /// option might be necessary if an attribute name conflicts with a DynamoDB
  /// reserved word. For example, the following `KeyConditionExpression`
  /// parameter causes an error because _Size_ is a reserved word:
  ///
  /// *    `Size = :myval`
  ///
  ///
  /// To work around this, define a placeholder (such a `#S`) to represent the
  /// attribute name _Size_. `KeyConditionExpression` then is as follows:
  ///
  /// *    `#S = :myval`
  ///
  ///
  /// For a list of reserved words, see
  /// [Reserved Words](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html)
  /// in the _Amazon DynamoDB Developer Guide_.
  ///
  /// For more information on `ExpressionAttributeNames` and
  /// `ExpressionAttributeValues`, see
  /// [Using Placeholders for Attribute Names and Values](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ExpressionPlaceholders.html)
  /// in the _Amazon DynamoDB Developer Guide_.
  ///
  /// [expressionAttributeNames]: One or more substitution tokens for attribute
  /// names in an expression. The following are some use cases for using
  /// `ExpressionAttributeNames`:
  ///
  /// *   To access an attribute whose name conflicts with a DynamoDB reserved
  /// word.
  ///
  /// *   To create a placeholder for repeating occurrences of an attribute name
  /// in an expression.
  ///
  /// *   To prevent special characters in an attribute name from being
  /// misinterpreted in an expression.
  ///
  ///
  /// Use the **#** character in an expression to dereference an attribute name.
  /// For example, consider the following attribute name:
  ///
  /// *    `Percentile`
  ///
  ///
  /// The name of this attribute conflicts with a reserved word, so it cannot be
  /// used directly in an expression. (For the complete list of reserved words,
  /// see
  /// [Reserved Words](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html)
  /// in the _Amazon DynamoDB Developer Guide_). To work around this, you could
  /// specify the following for `ExpressionAttributeNames`:
  ///
  /// *    `{"#P":"Percentile"}`
  ///
  ///
  /// You could then use this substitution in an expression, as in this example:
  ///
  /// *    `#P = :val`
  ///
  ///
  ///  Tokens that begin with the **:** character are _expression attribute
  /// values_, which are placeholders for the actual value at runtime.
  ///
  /// For more information on expression attribute names, see
  /// [Specifying Item Attributes](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html)
  /// in the _Amazon DynamoDB Developer Guide_.
  ///
  /// [expressionAttributeValues]: One or more values that can be substituted in
  /// an expression.
  ///
  /// Use the **:** (colon) character in an expression to dereference an
  /// attribute value. For example, suppose that you wanted to check whether the
  /// value of the _ProductStatus_ attribute was one of the following:
  ///
  ///  `Available | Backordered | Discontinued`
  ///
  /// You would first need to specify `ExpressionAttributeValues` as follows:
  ///
  ///  `{ ":avail":{"S":"Available"}, ":back":{"S":"Backordered"},
  /// ":disc":{"S":"Discontinued"} }`
  ///
  /// You could then use these values in an expression, such as this:
  ///
  ///  `ProductStatus IN (:avail, :back, :disc)`
  ///
  /// For more information on expression attribute values, see
  /// [Specifying Conditions](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.SpecifyingConditions.html)
  /// in the _Amazon DynamoDB Developer Guide_.
  Future<QueryOutput> query(String tableName,
      {String indexName,
      String select,
      List<String> attributesToGet,
      int limit,
      bool consistentRead,
      Map<String, Condition> keyConditions,
      Map<String, Condition> queryFilter,
      String conditionalOperator,
      bool scanIndexForward,
      Map<String, AttributeValue> exclusiveStartKey,
      String returnConsumedCapacity,
      String projectionExpression,
      String filterExpression,
      String keyConditionExpression,
      Map<String, String> expressionAttributeNames,
      Map<String, AttributeValue> expressionAttributeValues}) async {
    var response_ = await _client.send('Query', {
      'TableName': tableName,
      if (indexName != null) 'IndexName': indexName,
      if (select != null) 'Select': select,
      if (attributesToGet != null) 'AttributesToGet': attributesToGet,
      if (limit != null) 'Limit': limit,
      if (consistentRead != null) 'ConsistentRead': consistentRead,
      if (keyConditions != null) 'KeyConditions': keyConditions,
      if (queryFilter != null) 'QueryFilter': queryFilter,
      if (conditionalOperator != null)
        'ConditionalOperator': conditionalOperator,
      if (scanIndexForward != null) 'ScanIndexForward': scanIndexForward,
      if (exclusiveStartKey != null) 'ExclusiveStartKey': exclusiveStartKey,
      if (returnConsumedCapacity != null)
        'ReturnConsumedCapacity': returnConsumedCapacity,
      if (projectionExpression != null)
        'ProjectionExpression': projectionExpression,
      if (filterExpression != null) 'FilterExpression': filterExpression,
      if (keyConditionExpression != null)
        'KeyConditionExpression': keyConditionExpression,
      if (expressionAttributeNames != null)
        'ExpressionAttributeNames': expressionAttributeNames,
      if (expressionAttributeValues != null)
        'ExpressionAttributeValues': expressionAttributeValues,
    });
    return QueryOutput.fromJson(response_);
  }

  /// Creates a new table from an existing backup. Any number of users can
  /// execute up to 4 concurrent restores (any type of restore) in a given
  /// account.
  ///
  /// You can call `RestoreTableFromBackup` at a maximum rate of 10 times per
  /// second.
  ///
  /// You must manually set up the following on the restored table:
  ///
  /// *   Auto scaling policies
  ///
  /// *   IAM policies
  ///
  /// *   Amazon CloudWatch metrics and alarms
  ///
  /// *   Tags
  ///
  /// *   Stream settings
  ///
  /// *   Time to Live (TTL) settings
  ///
  /// [targetTableName]: The name of the new table to which the backup must be
  /// restored.
  ///
  /// [backupArn]: The Amazon Resource Name (ARN) associated with the backup.
  Future<RestoreTableFromBackupOutput> restoreTableFromBackup(
      {@required String targetTableName, @required String backupArn}) async {
    var response_ = await _client.send('RestoreTableFromBackup', {
      'TargetTableName': targetTableName,
      'BackupArn': backupArn,
    });
    return RestoreTableFromBackupOutput.fromJson(response_);
  }

  /// Restores the specified table to the specified point in time within
  /// `EarliestRestorableDateTime` and `LatestRestorableDateTime`. You can
  /// restore your table to any point in time during the last 35 days. Any
  /// number of users can execute up to 4 concurrent restores (any type of
  /// restore) in a given account.
  ///
  ///  When you restore using point in time recovery, DynamoDB restores your
  /// table data to the state based on the selected date and time
  /// (day:hour:minute:second) to a new table.
  ///
  ///  Along with data, the following are also included on the new restored
  /// table using point in time recovery:
  ///
  /// *   Global secondary indexes (GSIs)
  ///
  /// *   Local secondary indexes (LSIs)
  ///
  /// *   Provisioned read and write capacity
  ///
  /// *   Encryption settings
  ///
  ///       All these settings come from the current settings of the source
  /// table at the time of restore.
  ///
  /// You must manually set up the following on the restored table:
  ///
  /// *   Auto scaling policies
  ///
  /// *   IAM policies
  ///
  /// *   Amazon CloudWatch metrics and alarms
  ///
  /// *   Tags
  ///
  /// *   Stream settings
  ///
  /// *   Time to Live (TTL) settings
  ///
  /// *   Point in time recovery settings
  ///
  /// [sourceTableName]: Name of the source table that is being restored.
  ///
  /// [targetTableName]: The name of the new table to which it must be restored
  /// to.
  ///
  /// [useLatestRestorableTime]: Restore the table to the latest possible time.
  /// `LatestRestorableDateTime` is typically 5 minutes before the current time.
  ///
  /// [restoreDateTime]: Time in the past to restore the table to.
  Future<RestoreTableToPointInTimeOutput> restoreTableToPointInTime(
      {@required String sourceTableName,
      @required String targetTableName,
      bool useLatestRestorableTime,
      DateTime restoreDateTime}) async {
    var response_ = await _client.send('RestoreTableToPointInTime', {
      'SourceTableName': sourceTableName,
      'TargetTableName': targetTableName,
      if (useLatestRestorableTime != null)
        'UseLatestRestorableTime': useLatestRestorableTime,
      if (restoreDateTime != null) 'RestoreDateTime': restoreDateTime,
    });
    return RestoreTableToPointInTimeOutput.fromJson(response_);
  }

  /// The `Scan` operation returns one or more items and item attributes by
  /// accessing every item in a table or a secondary index. To have DynamoDB
  /// return fewer items, you can provide a `FilterExpression` operation.
  ///
  /// If the total number of scanned items exceeds the maximum dataset size
  /// limit of 1 MB, the scan stops and results are returned to the user as a
  /// `LastEvaluatedKey` value to continue the scan in a subsequent operation.
  /// The results also include the number of items exceeding the limit. A scan
  /// can result in no table data meeting the filter criteria.
  ///
  /// A single `Scan` operation reads up to the maximum number of items set (if
  /// using the `Limit` parameter) or a maximum of 1 MB of data and then apply
  /// any filtering to the results using `FilterExpression`. If
  /// `LastEvaluatedKey` is present in the response, you need to paginate the
  /// result set. For more information, see
  /// [Paginating the Results](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Scan.html#Scan.Pagination)
  /// in the _Amazon DynamoDB Developer Guide_.
  ///
  ///  `Scan` operations proceed sequentially; however, for faster performance
  /// on a large table or secondary index, applications can request a parallel
  /// `Scan` operation by providing the `Segment` and `TotalSegments`
  /// parameters. For more information, see
  /// [Parallel Scan](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Scan.html#Scan.ParallelScan)
  /// in the _Amazon DynamoDB Developer Guide_.
  ///
  ///  `Scan` uses eventually consistent reads when accessing the data in a
  /// table; therefore, the result set might not include the changes to data in
  /// the table immediately before the operation began. If you need a consistent
  /// copy of the data, as of the time that the `Scan` begins, you can set the
  /// `ConsistentRead` parameter to `true`.
  ///
  /// [tableName]: The name of the table containing the requested items; or, if
  /// you provide `IndexName`, the name of the table to which that index
  /// belongs.
  ///
  /// [indexName]: The name of a secondary index to scan. This index can be any
  /// local secondary index or global secondary index. Note that if you use the
  /// `IndexName` parameter, you must also provide `TableName`.
  ///
  /// [attributesToGet]: This is a legacy parameter. Use `ProjectionExpression`
  /// instead. For more information, see
  /// [AttributesToGet](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.AttributesToGet.html)
  /// in the _Amazon DynamoDB Developer Guide_.
  ///
  /// [limit]: The maximum number of items to evaluate (not necessarily the
  /// number of matching items). If DynamoDB processes the number of items up to
  /// the limit while processing the results, it stops the operation and returns
  /// the matching values up to that point, and a key in `LastEvaluatedKey` to
  /// apply in a subsequent operation, so that you can pick up where you left
  /// off. Also, if the processed dataset size exceeds 1 MB before DynamoDB
  /// reaches this limit, it stops the operation and returns the matching values
  /// up to the limit, and a key in `LastEvaluatedKey` to apply in a subsequent
  /// operation to continue the operation. For more information, see
  /// [Working with Queries](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/QueryAndScan.html)
  /// in the _Amazon DynamoDB Developer Guide_.
  ///
  /// [select]: The attributes to be returned in the result. You can retrieve
  /// all item attributes, specific item attributes, the count of matching
  /// items, or in the case of an index, some or all of the attributes projected
  /// into the index.
  ///
  /// *    `ALL_ATTRIBUTES` - Returns all of the item attributes from the
  /// specified table or index. If you query a local secondary index, then for
  /// each matching item in the index, DynamoDB fetches the entire item from the
  /// parent table. If the index is configured to project all item attributes,
  /// then all of the data can be obtained from the local secondary index, and
  /// no fetching is required.
  ///
  /// *    `ALL_PROJECTED_ATTRIBUTES` - Allowed only when querying an index.
  /// Retrieves all attributes that have been projected into the index. If the
  /// index is configured to project all attributes, this return value is
  /// equivalent to specifying `ALL_ATTRIBUTES`.
  ///
  /// *    `COUNT` - Returns the number of matching items, rather than the
  /// matching items themselves.
  ///
  /// *    `SPECIFIC_ATTRIBUTES` - Returns only the attributes listed in
  /// `AttributesToGet`. This return value is equivalent to specifying
  /// `AttributesToGet` without specifying any value for `Select`.
  ///
  ///     If you query or scan a local secondary index and request only
  /// attributes that are projected into that index, the operation reads only
  /// the index and not the table. If any of the requested attributes are not
  /// projected into the local secondary index, DynamoDB fetches each of these
  /// attributes from the parent table. This extra fetching incurs additional
  /// throughput cost and latency.
  ///
  ///     If you query or scan a global secondary index, you can only request
  /// attributes that are projected into the index. Global secondary index
  /// queries cannot fetch attributes from the parent table.
  ///
  ///
  /// If neither `Select` nor `AttributesToGet` are specified, DynamoDB defaults
  /// to `ALL_ATTRIBUTES` when accessing a table, and `ALL_PROJECTED_ATTRIBUTES`
  /// when accessing an index. You cannot use both `Select` and
  /// `AttributesToGet` together in a single request, unless the value for
  /// `Select` is `SPECIFIC_ATTRIBUTES`. (This usage is equivalent to specifying
  /// `AttributesToGet` without any value for `Select`.)
  ///
  ///
  ///
  /// If you use the `ProjectionExpression` parameter, then the value for
  /// `Select` can only be `SPECIFIC_ATTRIBUTES`. Any other value for `Select`
  /// will return an error.
  ///
  /// [scanFilter]: This is a legacy parameter. Use `FilterExpression` instead.
  /// For more information, see
  /// [ScanFilter](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.ScanFilter.html)
  /// in the _Amazon DynamoDB Developer Guide_.
  ///
  /// [conditionalOperator]: This is a legacy parameter. Use `FilterExpression`
  /// instead. For more information, see
  /// [ConditionalOperator](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.ConditionalOperator.html)
  /// in the _Amazon DynamoDB Developer Guide_.
  ///
  /// [exclusiveStartKey]: The primary key of the first item that this operation
  /// will evaluate. Use the value that was returned for `LastEvaluatedKey` in
  /// the previous operation.
  ///
  /// The data type for `ExclusiveStartKey` must be String, Number or Binary. No
  /// set data types are allowed.
  ///
  /// In a parallel scan, a `Scan` request that includes `ExclusiveStartKey`
  /// must specify the same segment whose previous `Scan` returned the
  /// corresponding value of `LastEvaluatedKey`.
  ///
  /// [totalSegments]: For a parallel `Scan` request, `TotalSegments` represents
  /// the total number of segments into which the `Scan` operation will be
  /// divided. The value of `TotalSegments` corresponds to the number of
  /// application workers that will perform the parallel scan. For example, if
  /// you want to use four application threads to scan a table or an index,
  /// specify a `TotalSegments` value of 4.
  ///
  /// The value for `TotalSegments` must be greater than or equal to 1, and less
  /// than or equal to 1000000. If you specify a `TotalSegments` value of 1, the
  /// `Scan` operation will be sequential rather than parallel.
  ///
  /// If you specify `TotalSegments`, you must also specify `Segment`.
  ///
  /// [segment]: For a parallel `Scan` request, `Segment` identifies an
  /// individual segment to be scanned by an application worker.
  ///
  /// Segment IDs are zero-based, so the first segment is always 0. For example,
  /// if you want to use four application threads to scan a table or an index,
  /// then the first thread specifies a `Segment` value of 0, the second thread
  /// specifies 1, and so on.
  ///
  /// The value of `LastEvaluatedKey` returned from a parallel `Scan` request
  /// must be used as `ExclusiveStartKey` with the same segment ID in a
  /// subsequent `Scan` operation.
  ///
  /// The value for `Segment` must be greater than or equal to 0, and less than
  /// the value provided for `TotalSegments`.
  ///
  /// If you provide `Segment`, you must also provide `TotalSegments`.
  ///
  /// [projectionExpression]: A string that identifies one or more attributes to
  /// retrieve from the specified table or index. These attributes can include
  /// scalars, sets, or elements of a JSON document. The attributes in the
  /// expression must be separated by commas.
  ///
  /// If no attribute names are specified, then all attributes will be returned.
  /// If any of the requested attributes are not found, they will not appear in
  /// the result.
  ///
  /// For more information, see
  /// [Specifying Item Attributes](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html)
  /// in the _Amazon DynamoDB Developer Guide_.
  ///
  /// [filterExpression]: A string that contains conditions that DynamoDB
  /// applies after the `Scan` operation, but before the data is returned to
  /// you. Items that do not satisfy the `FilterExpression` criteria are not
  /// returned.
  ///
  ///  A `FilterExpression` is applied after the items have already been read;
  /// the process of filtering does not consume any additional read capacity
  /// units.
  ///
  /// For more information, see
  /// [Filter Expressions](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/QueryAndScan.html#FilteringResults)
  /// in the _Amazon DynamoDB Developer Guide_.
  ///
  /// [expressionAttributeNames]: One or more substitution tokens for attribute
  /// names in an expression. The following are some use cases for using
  /// `ExpressionAttributeNames`:
  ///
  /// *   To access an attribute whose name conflicts with a DynamoDB reserved
  /// word.
  ///
  /// *   To create a placeholder for repeating occurrences of an attribute name
  /// in an expression.
  ///
  /// *   To prevent special characters in an attribute name from being
  /// misinterpreted in an expression.
  ///
  ///
  /// Use the **#** character in an expression to dereference an attribute name.
  /// For example, consider the following attribute name:
  ///
  /// *    `Percentile`
  ///
  ///
  /// The name of this attribute conflicts with a reserved word, so it cannot be
  /// used directly in an expression. (For the complete list of reserved words,
  /// see
  /// [Reserved Words](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html)
  /// in the _Amazon DynamoDB Developer Guide_). To work around this, you could
  /// specify the following for `ExpressionAttributeNames`:
  ///
  /// *    `{"#P":"Percentile"}`
  ///
  ///
  /// You could then use this substitution in an expression, as in this example:
  ///
  /// *    `#P = :val`
  ///
  ///
  ///  Tokens that begin with the **:** character are _expression attribute
  /// values_, which are placeholders for the actual value at runtime.
  ///
  /// For more information on expression attribute names, see
  /// [Specifying Item Attributes](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html)
  /// in the _Amazon DynamoDB Developer Guide_.
  ///
  /// [expressionAttributeValues]: One or more values that can be substituted in
  /// an expression.
  ///
  /// Use the **:** (colon) character in an expression to dereference an
  /// attribute value. For example, suppose that you wanted to check whether the
  /// value of the `ProductStatus` attribute was one of the following:
  ///
  ///  `Available | Backordered | Discontinued`
  ///
  /// You would first need to specify `ExpressionAttributeValues` as follows:
  ///
  ///  `{ ":avail":{"S":"Available"}, ":back":{"S":"Backordered"},
  /// ":disc":{"S":"Discontinued"} }`
  ///
  /// You could then use these values in an expression, such as this:
  ///
  ///  `ProductStatus IN (:avail, :back, :disc)`
  ///
  /// For more information on expression attribute values, see
  /// [Condition Expressions](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.SpecifyingConditions.html)
  /// in the _Amazon DynamoDB Developer Guide_.
  ///
  /// [consistentRead]: A Boolean value that determines the read consistency
  /// model during the scan:
  ///
  /// *   If `ConsistentRead` is `false`, then the data returned from `Scan`
  /// might not contain the results from other recently completed write
  /// operations (`PutItem`, `UpdateItem`, or `DeleteItem`).
  ///
  /// *   If `ConsistentRead` is `true`, then all of the write operations that
  /// completed before the `Scan` began are guaranteed to be contained in the
  /// `Scan` response.
  ///
  ///
  /// The default setting for `ConsistentRead` is `false`.
  ///
  /// The `ConsistentRead` parameter is not supported on global secondary
  /// indexes. If you scan a global secondary index with `ConsistentRead` set to
  /// true, you will receive a `ValidationException`.
  Future<ScanOutput> scan(String tableName,
      {String indexName,
      List<String> attributesToGet,
      int limit,
      String select,
      Map<String, Condition> scanFilter,
      String conditionalOperator,
      Map<String, AttributeValue> exclusiveStartKey,
      String returnConsumedCapacity,
      int totalSegments,
      int segment,
      String projectionExpression,
      String filterExpression,
      Map<String, String> expressionAttributeNames,
      Map<String, AttributeValue> expressionAttributeValues,
      bool consistentRead}) async {
    var response_ = await _client.send('Scan', {
      'TableName': tableName,
      if (indexName != null) 'IndexName': indexName,
      if (attributesToGet != null) 'AttributesToGet': attributesToGet,
      if (limit != null) 'Limit': limit,
      if (select != null) 'Select': select,
      if (scanFilter != null) 'ScanFilter': scanFilter,
      if (conditionalOperator != null)
        'ConditionalOperator': conditionalOperator,
      if (exclusiveStartKey != null) 'ExclusiveStartKey': exclusiveStartKey,
      if (returnConsumedCapacity != null)
        'ReturnConsumedCapacity': returnConsumedCapacity,
      if (totalSegments != null) 'TotalSegments': totalSegments,
      if (segment != null) 'Segment': segment,
      if (projectionExpression != null)
        'ProjectionExpression': projectionExpression,
      if (filterExpression != null) 'FilterExpression': filterExpression,
      if (expressionAttributeNames != null)
        'ExpressionAttributeNames': expressionAttributeNames,
      if (expressionAttributeValues != null)
        'ExpressionAttributeValues': expressionAttributeValues,
      if (consistentRead != null) 'ConsistentRead': consistentRead,
    });
    return ScanOutput.fromJson(response_);
  }

  /// Associate a set of tags with an Amazon DynamoDB resource. You can then
  /// activate these user-defined tags so that they appear on the Billing and
  /// Cost Management console for cost allocation tracking. You can call
  /// TagResource up to five times per second, per account.
  ///
  /// For an overview on tagging DynamoDB resources, see
  /// [Tagging for DynamoDB](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Tagging.html)
  /// in the _Amazon DynamoDB Developer Guide_.
  ///
  /// [resourceArn]: Identifies the Amazon DynamoDB resource to which tags
  /// should be added. This value is an Amazon Resource Name (ARN).
  ///
  /// [tags]: The tags to be assigned to the Amazon DynamoDB resource.
  Future<void> tagResource(
      {@required String resourceArn, @required List<Tag> tags}) async {
    await _client.send('TagResource', {
      'ResourceArn': resourceArn,
      'Tags': tags,
    });
  }

  ///  `TransactGetItems` is a synchronous operation that atomically retrieves
  /// multiple items from one or more tables (but not from indexes) in a single
  /// account and Region. A `TransactGetItems` call can contain up to 25
  /// `TransactGetItem` objects, each of which contains a `Get` structure that
  /// specifies an item to retrieve from a table in the account and Region. A
  /// call to `TransactGetItems` cannot retrieve items from tables in more than
  /// one AWS account or Region. The aggregate size of the items in the
  /// transaction cannot exceed 4 MB.
  ///
  ///  All AWS Regions and AWS GovCloud (US) support up to 25 items per
  /// transaction with up to 4 MB of data, except the following AWS Regions:
  ///
  /// *   China (Beijing)
  ///
  /// *   China (Ningxia)
  ///
  ///
  /// The China (Beijing) and China (Ningxia) Regions support up to 10 items per
  /// transaction with up to 4 MB of data.
  ///
  /// DynamoDB rejects the entire `TransactGetItems` request if any of the
  /// following is true:
  ///
  /// *   A conflicting operation is in the process of updating an item to be
  /// read.
  ///
  /// *   There is insufficient provisioned capacity for the transaction to be
  /// completed.
  ///
  /// *   There is a user error, such as an invalid data format.
  ///
  /// *   The aggregate size of the items in the transaction cannot exceed 4 MB.
  ///
  /// [transactItems]: An ordered array of up to 25 `TransactGetItem` objects,
  /// each of which contains a `Get` structure.
  ///
  /// [returnConsumedCapacity]: A value of `TOTAL` causes consumed capacity
  /// information to be returned, and a value of `NONE` prevents that
  /// information from being returned. No other value is valid.
  Future<TransactGetItemsOutput> transactGetItems(
      List<TransactGetItem> transactItems,
      {String returnConsumedCapacity}) async {
    var response_ = await _client.send('TransactGetItems', {
      'TransactItems': transactItems,
      if (returnConsumedCapacity != null)
        'ReturnConsumedCapacity': returnConsumedCapacity,
    });
    return TransactGetItemsOutput.fromJson(response_);
  }

  ///  `TransactWriteItems` is a synchronous write operation that groups up to
  /// 25 action requests. These actions can target items in different tables,
  /// but not in different AWS accounts or Regions, and no two actions can
  /// target the same item. For example, you cannot both `ConditionCheck` and
  /// `Update` the same item. The aggregate size of the items in the transaction
  /// cannot exceed 4 MB.
  ///
  ///  All AWS Regions and AWS GovCloud (US) support up to 25 items per
  /// transaction with up to 4 MB of data, except the following AWS Regions:
  ///
  /// *   China (Beijing)
  ///
  /// *   China (Ningxia)
  ///
  ///
  /// The China (Beijing) and China (Ningxia) Regions support up to 10 items per
  /// transaction with up to 4 MB of data.
  ///
  /// The actions are completed atomically so that either all of them succeed,
  /// or all of them fail. They are defined by the following objects:
  ///
  /// *    `Put`  —   Initiates a `PutItem` operation to write a new item. This
  /// structure specifies the primary key of the item to be written, the name of
  /// the table to write it in, an optional condition expression that must be
  /// satisfied for the write to succeed, a list of the item's attributes, and a
  /// field indicating whether to retrieve the item's attributes if the
  /// condition is not met.
  ///
  /// *    `Update`  —   Initiates an `UpdateItem` operation to update an
  /// existing item. This structure specifies the primary key of the item to be
  /// updated, the name of the table where it resides, an optional condition
  /// expression that must be satisfied for the update to succeed, an expression
  /// that defines one or more attributes to be updated, and a field indicating
  /// whether to retrieve the item's attributes if the condition is not met.
  ///
  /// *    `Delete`  —   Initiates a `DeleteItem` operation to delete an
  /// existing item. This structure specifies the primary key of the item to be
  /// deleted, the name of the table where it resides, an optional condition
  /// expression that must be satisfied for the deletion to succeed, and a field
  /// indicating whether to retrieve the item's attributes if the condition is
  /// not met.
  ///
  /// *    `ConditionCheck`  —   Applies a condition to an item that is not
  /// being modified by the transaction. This structure specifies the primary
  /// key of the item to be checked, the name of the table where it resides, a
  /// condition expression that must be satisfied for the transaction to
  /// succeed, and a field indicating whether to retrieve the item's attributes
  /// if the condition is not met.
  ///
  ///
  /// DynamoDB rejects the entire `TransactWriteItems` request if any of the
  /// following is true:
  ///
  /// *   A condition in one of the condition expressions is not met.
  ///
  /// *   An ongoing operation is in the process of updating the same item.
  ///
  /// *   There is insufficient provisioned capacity for the transaction to be
  /// completed.
  ///
  /// *   An item size becomes too large (bigger than 400 KB), a local secondary
  /// index (LSI) becomes too large, or a similar validation error occurs
  /// because of changes made by the transaction.
  ///
  /// *   The aggregate size of the items in the transaction exceeds 4 MB.
  ///
  /// *   There is a user error, such as an invalid data format.
  ///
  /// [transactItems]: An ordered array of up to 25 `TransactWriteItem` objects,
  /// each of which contains a `ConditionCheck`, `Put`, `Update`, or `Delete`
  /// object. These can operate on items in different tables, but the tables
  /// must reside in the same AWS account and Region, and no two of them can
  /// operate on the same item.
  ///
  /// [returnItemCollectionMetrics]: Determines whether item collection metrics
  /// are returned. If set to `SIZE`, the response includes statistics about
  /// item collections (if any), that were modified during the operation and are
  /// returned in the response. If set to `NONE` (the default), no statistics
  /// are returned.
  ///
  /// [clientRequestToken]: Providing a `ClientRequestToken` makes the call to
  /// `TransactWriteItems` idempotent, meaning that multiple identical calls
  /// have the same effect as one single call.
  ///
  /// Although multiple identical calls using the same client request token
  /// produce the same result on the server (no side effects), the responses to
  /// the calls might not be the same. If the `ReturnConsumedCapacity>`
  /// parameter is set, then the initial `TransactWriteItems` call returns the
  /// amount of write capacity units consumed in making the changes. Subsequent
  /// `TransactWriteItems` calls with the same client token return the number of
  /// read capacity units consumed in reading the item.
  ///
  /// A client request token is valid for 10 minutes after the first request
  /// that uses it is completed. After 10 minutes, any request with the same
  /// client token is treated as a new request. Do not resubmit the same request
  /// with the same client token for more than 10 minutes, or the result might
  /// not be idempotent.
  ///
  /// If you submit a request with the same client token but a change in other
  /// parameters within the 10-minute idempotency window, DynamoDB returns an
  /// `IdempotentParameterMismatch` exception.
  Future<TransactWriteItemsOutput> transactWriteItems(
      List<TransactWriteItem> transactItems,
      {String returnConsumedCapacity,
      String returnItemCollectionMetrics,
      String clientRequestToken}) async {
    var response_ = await _client.send('TransactWriteItems', {
      'TransactItems': transactItems,
      if (returnConsumedCapacity != null)
        'ReturnConsumedCapacity': returnConsumedCapacity,
      if (returnItemCollectionMetrics != null)
        'ReturnItemCollectionMetrics': returnItemCollectionMetrics,
      if (clientRequestToken != null) 'ClientRequestToken': clientRequestToken,
    });
    return TransactWriteItemsOutput.fromJson(response_);
  }

  /// Removes the association of tags from an Amazon DynamoDB resource. You can
  /// call `UntagResource` up to five times per second, per account.
  ///
  /// For an overview on tagging DynamoDB resources, see
  /// [Tagging for DynamoDB](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Tagging.html)
  /// in the _Amazon DynamoDB Developer Guide_.
  ///
  /// [resourceArn]: The DynamoDB resource that the tags will be removed from.
  /// This value is an Amazon Resource Name (ARN).
  ///
  /// [tagKeys]: A list of tag keys. Existing tags of the resource whose keys
  /// are members of this list will be removed from the DynamoDB resource.
  Future<void> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {
    await _client.send('UntagResource', {
      'ResourceArn': resourceArn,
      'TagKeys': tagKeys,
    });
  }

  ///  `UpdateContinuousBackups` enables or disables point in time recovery for
  /// the specified table. A successful `UpdateContinuousBackups` call returns
  /// the current `ContinuousBackupsDescription`. Continuous backups are
  /// `ENABLED` on all tables at table creation. If point in time recovery is
  /// enabled, `PointInTimeRecoveryStatus` will be set to ENABLED.
  ///
  ///  Once continuous backups and point in time recovery are enabled, you can
  /// restore to any point in time within `EarliestRestorableDateTime` and
  /// `LatestRestorableDateTime`.
  ///
  ///  `LatestRestorableDateTime` is typically 5 minutes before the current
  /// time. You can restore your table to any point in time during the last 35
  /// days.
  ///
  /// [tableName]: The name of the table.
  ///
  /// [pointInTimeRecoverySpecification]: Represents the settings used to enable
  /// point in time recovery.
  Future<UpdateContinuousBackupsOutput> updateContinuousBackups(
      {@required
          String tableName,
      @required
          PointInTimeRecoverySpecification
              pointInTimeRecoverySpecification}) async {
    var response_ = await _client.send('UpdateContinuousBackups', {
      'TableName': tableName,
      'PointInTimeRecoverySpecification': pointInTimeRecoverySpecification,
    });
    return UpdateContinuousBackupsOutput.fromJson(response_);
  }

  /// Adds or removes replicas in the specified global table. The global table
  /// must already exist to be able to use this operation. Any replica to be
  /// added must be empty, have the same name as the global table, have the same
  /// key schema, have DynamoDB Streams enabled, and have the same provisioned
  /// and maximum write capacity units.
  ///
  ///  Although you can use `UpdateGlobalTable` to add replicas and remove
  /// replicas in a single request, for simplicity we recommend that you issue
  /// separate requests for adding or removing replicas.
  ///
  ///  If global secondary indexes are specified, then the following conditions
  /// must also be met:
  ///
  /// *    The global secondary indexes must have the same name.
  ///
  /// *    The global secondary indexes must have the same hash key and sort key
  /// (if present).
  ///
  /// *    The global secondary indexes must have the same provisioned and
  /// maximum write capacity units.
  ///
  /// [globalTableName]: The global table name.
  ///
  /// [replicaUpdates]: A list of Regions that should be added or removed from
  /// the global table.
  Future<UpdateGlobalTableOutput> updateGlobalTable(
      {@required String globalTableName,
      @required List<ReplicaUpdate> replicaUpdates}) async {
    var response_ = await _client.send('UpdateGlobalTable', {
      'GlobalTableName': globalTableName,
      'ReplicaUpdates': replicaUpdates,
    });
    return UpdateGlobalTableOutput.fromJson(response_);
  }

  /// Updates settings for a global table.
  ///
  /// [globalTableName]: The name of the global table
  ///
  /// [globalTableBillingMode]: The billing mode of the global table. If
  /// `GlobalTableBillingMode` is not specified, the global table defaults to
  /// `PROVISIONED` capacity billing mode.
  ///
  /// [globalTableProvisionedWriteCapacityUnits]: The maximum number of writes
  /// consumed per second before DynamoDB returns a `ThrottlingException.`
  ///
  /// [globalTableProvisionedWriteCapacityAutoScalingSettingsUpdate]: Auto
  /// scaling settings for managing provisioned write capacity for the global
  /// table.
  ///
  /// [globalTableGlobalSecondaryIndexSettingsUpdate]: Represents the settings
  /// of a global secondary index for a global table that will be modified.
  ///
  /// [replicaSettingsUpdate]: Represents the settings for a global table in a
  /// Region that will be modified.
  Future<UpdateGlobalTableSettingsOutput> updateGlobalTableSettings(
      String globalTableName,
      {String globalTableBillingMode,
      BigInt globalTableProvisionedWriteCapacityUnits,
      AutoScalingSettingsUpdate
          globalTableProvisionedWriteCapacityAutoScalingSettingsUpdate,
      List<GlobalTableGlobalSecondaryIndexSettingsUpdate>
          globalTableGlobalSecondaryIndexSettingsUpdate,
      List<ReplicaSettingsUpdate> replicaSettingsUpdate}) async {
    var response_ = await _client.send('UpdateGlobalTableSettings', {
      'GlobalTableName': globalTableName,
      if (globalTableBillingMode != null)
        'GlobalTableBillingMode': globalTableBillingMode,
      if (globalTableProvisionedWriteCapacityUnits != null)
        'GlobalTableProvisionedWriteCapacityUnits':
            globalTableProvisionedWriteCapacityUnits,
      if (globalTableProvisionedWriteCapacityAutoScalingSettingsUpdate != null)
        'GlobalTableProvisionedWriteCapacityAutoScalingSettingsUpdate':
            globalTableProvisionedWriteCapacityAutoScalingSettingsUpdate,
      if (globalTableGlobalSecondaryIndexSettingsUpdate != null)
        'GlobalTableGlobalSecondaryIndexSettingsUpdate':
            globalTableGlobalSecondaryIndexSettingsUpdate,
      if (replicaSettingsUpdate != null)
        'ReplicaSettingsUpdate': replicaSettingsUpdate,
    });
    return UpdateGlobalTableSettingsOutput.fromJson(response_);
  }

  /// Edits an existing item's attributes, or adds a new item to the table if it
  /// does not already exist. You can put, delete, or add attribute values. You
  /// can also perform a conditional update on an existing item (insert a new
  /// attribute name-value pair if it doesn't exist, or replace an existing
  /// name-value pair if it has certain expected attribute values).
  ///
  /// You can also return the item's attribute values in the same `UpdateItem`
  /// operation using the `ReturnValues` parameter.
  ///
  /// [tableName]: The name of the table containing the item to update.
  ///
  /// [key]: The primary key of the item to be updated. Each element consists of
  /// an attribute name and a value for that attribute.
  ///
  /// For the primary key, you must provide all of the attributes. For example,
  /// with a simple primary key, you only need to provide a value for the
  /// partition key. For a composite primary key, you must provide values for
  /// both the partition key and the sort key.
  ///
  /// [attributeUpdates]: This is a legacy parameter. Use `UpdateExpression`
  /// instead. For more information, see
  /// [AttributeUpdates](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.AttributeUpdates.html)
  /// in the _Amazon DynamoDB Developer Guide_.
  ///
  /// [expected]: This is a legacy parameter. Use `ConditionExpression` instead.
  /// For more information, see
  /// [Expected](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.Expected.html)
  /// in the _Amazon DynamoDB Developer Guide_.
  ///
  /// [conditionalOperator]: This is a legacy parameter. Use
  /// `ConditionExpression` instead. For more information, see
  /// [ConditionalOperator](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.ConditionalOperator.html)
  /// in the _Amazon DynamoDB Developer Guide_.
  ///
  /// [returnValues]: Use `ReturnValues` if you want to get the item attributes
  /// as they appear before or after they are updated. For `UpdateItem`, the
  /// valid values are:
  ///
  /// *    `NONE` - If `ReturnValues` is not specified, or if its value is
  /// `NONE`, then nothing is returned. (This setting is the default for
  /// `ReturnValues`.)
  ///
  /// *    `ALL_OLD` - Returns all of the attributes of the item, as they
  /// appeared before the UpdateItem operation.
  ///
  /// *    `UPDATED_OLD` - Returns only the updated attributes, as they appeared
  /// before the UpdateItem operation.
  ///
  /// *    `ALL_NEW` - Returns all of the attributes of the item, as they appear
  /// after the UpdateItem operation.
  ///
  /// *    `UPDATED_NEW` - Returns only the updated attributes, as they appear
  /// after the UpdateItem operation.
  ///
  ///
  /// There is no additional cost associated with requesting a return value
  /// aside from the small network and processing overhead of receiving a larger
  /// response. No read capacity units are consumed.
  ///
  /// The values returned are strongly consistent.
  ///
  /// [returnItemCollectionMetrics]: Determines whether item collection metrics
  /// are returned. If set to `SIZE`, the response includes statistics about
  /// item collections, if any, that were modified during the operation are
  /// returned in the response. If set to `NONE` (the default), no statistics
  /// are returned.
  ///
  /// [updateExpression]: An expression that defines one or more attributes to
  /// be updated, the action to be performed on them, and new values for them.
  ///
  /// The following action values are available for `UpdateExpression`.
  ///
  /// *    `SET` - Adds one or more attributes and values to an item. If any of
  /// these attributes already exist, they are replaced by the new values. You
  /// can also use `SET` to add or subtract from an attribute that is of type
  /// Number. For example: `SET myNum = myNum + :val`
  ///
  ///      `SET` supports the following functions:
  ///
  ///     *    `if_not_exists (path, operand)` - if the item does not contain an
  /// attribute at the specified path, then `if_not_exists` evaluates to
  /// operand; otherwise, it evaluates to path. You can use this function to
  /// avoid overwriting an attribute that may already be present in the item.
  ///
  ///     *    `list_append (operand, operand)` - evaluates to a list with a new
  /// element added to it. You can append the new element to the start or the
  /// end of the list by reversing the order of the operands.
  ///
  ///
  ///     These function names are case-sensitive.
  ///
  /// *    `REMOVE` - Removes one or more attributes from an item.
  ///
  /// *    `ADD` - Adds the specified value to the item, if the attribute does
  /// not already exist. If the attribute does exist, then the behavior of `ADD`
  /// depends on the data type of the attribute:
  ///
  ///     *   If the existing attribute is a number, and if `Value` is also a
  /// number, then `Value` is mathematically added to the existing attribute. If
  /// `Value` is a negative number, then it is subtracted from the existing
  /// attribute.
  ///
  ///          If you use `ADD` to increment or decrement a number value for an
  /// item that doesn't exist before the update, DynamoDB uses `0` as the
  /// initial value.
  ///
  ///         Similarly, if you use `ADD` for an existing item to increment or
  /// decrement an attribute value that doesn't exist before the update,
  /// DynamoDB uses `0` as the initial value. For example, suppose that the item
  /// you want to update doesn't have an attribute named `itemcount`, but you
  /// decide to `ADD` the number `3` to this attribute anyway. DynamoDB will
  /// create the `itemcount` attribute, set its initial value to `0`, and
  /// finally add `3` to it. The result will be a new `itemcount` attribute in
  /// the item, with a value of `3`.
  ///     *   If the existing data type is a set and if `Value` is also a set,
  /// then `Value` is added to the existing set. For example, if the attribute
  /// value is the set `[1,2]`, and the `ADD` action specified `[3]`, then the
  /// final attribute value is `[1,2,3]`. An error occurs if an `ADD` action is
  /// specified for a set attribute and the attribute type specified does not
  /// match the existing set type.
  ///
  ///         Both sets must have the same primitive data type. For example, if
  /// the existing data type is a set of strings, the `Value` must also be a set
  /// of strings.
  ///
  ///
  ///      The `ADD` action only supports Number and set data types. In
  /// addition, `ADD` can only be used on top-level attributes, not nested
  /// attributes.
  /// *    `DELETE` - Deletes an element from a set.
  ///
  ///     If a set of values is specified, then those values are subtracted from
  /// the old set. For example, if the attribute value was the set `[a,b,c]` and
  /// the `DELETE` action specifies `[a,c]`, then the final attribute value is
  /// `[b]`. Specifying an empty set is an error.
  ///
  ///      The `DELETE` action only supports set data types. In addition,
  /// `DELETE` can only be used on top-level attributes, not nested attributes.
  ///
  /// You can have many actions in a single expression, such as the following:
  /// `SET a=:value1, b=:value2 DELETE :value3, :value4, :value5`
  ///
  /// For more information on update expressions, see
  /// [Modifying Items and Attributes](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.Modifying.html)
  /// in the _Amazon DynamoDB Developer Guide_.
  ///
  /// [conditionExpression]: A condition that must be satisfied in order for a
  /// conditional update to succeed.
  ///
  /// An expression can contain any of the following:
  ///
  /// *   Functions: `attribute_exists | attribute_not_exists | attribute_type |
  /// contains | begins_with | size`
  ///
  ///     These function names are case-sensitive.
  ///
  /// *   Comparison operators: `= | <> | < | > | <= | >= | BETWEEN | IN`
  ///
  /// *    Logical operators: `AND | OR | NOT`
  ///
  ///
  /// For more information about condition expressions, see
  /// [Specifying Conditions](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.SpecifyingConditions.html)
  /// in the _Amazon DynamoDB Developer Guide_.
  ///
  /// [expressionAttributeNames]: One or more substitution tokens for attribute
  /// names in an expression. The following are some use cases for using
  /// `ExpressionAttributeNames`:
  ///
  /// *   To access an attribute whose name conflicts with a DynamoDB reserved
  /// word.
  ///
  /// *   To create a placeholder for repeating occurrences of an attribute name
  /// in an expression.
  ///
  /// *   To prevent special characters in an attribute name from being
  /// misinterpreted in an expression.
  ///
  ///
  /// Use the **#** character in an expression to dereference an attribute name.
  /// For example, consider the following attribute name:
  ///
  /// *    `Percentile`
  ///
  ///
  /// The name of this attribute conflicts with a reserved word, so it cannot be
  /// used directly in an expression. (For the complete list of reserved words,
  /// see
  /// [Reserved Words](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html)
  /// in the _Amazon DynamoDB Developer Guide_.) To work around this, you could
  /// specify the following for `ExpressionAttributeNames`:
  ///
  /// *    `{"#P":"Percentile"}`
  ///
  ///
  /// You could then use this substitution in an expression, as in this example:
  ///
  /// *    `#P = :val`
  ///
  ///
  ///  Tokens that begin with the **:** character are _expression attribute
  /// values_, which are placeholders for the actual value at runtime.
  ///
  /// For more information about expression attribute names, see
  /// [Specifying Item Attributes](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html)
  /// in the _Amazon DynamoDB Developer Guide_.
  ///
  /// [expressionAttributeValues]: One or more values that can be substituted in
  /// an expression.
  ///
  /// Use the **:** (colon) character in an expression to dereference an
  /// attribute value. For example, suppose that you wanted to check whether the
  /// value of the `ProductStatus` attribute was one of the following:
  ///
  ///  `Available | Backordered | Discontinued`
  ///
  /// You would first need to specify `ExpressionAttributeValues` as follows:
  ///
  ///  `{ ":avail":{"S":"Available"}, ":back":{"S":"Backordered"},
  /// ":disc":{"S":"Discontinued"} }`
  ///
  /// You could then use these values in an expression, such as this:
  ///
  ///  `ProductStatus IN (:avail, :back, :disc)`
  ///
  /// For more information on expression attribute values, see
  /// [Condition Expressions](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.SpecifyingConditions.html)
  /// in the _Amazon DynamoDB Developer Guide_.
  Future<UpdateItemOutput> updateItem(
      {@required String tableName,
      @required Map<String, AttributeValue> key,
      Map<String, AttributeValueUpdate> attributeUpdates,
      Map<String, ExpectedAttributeValue> expected,
      String conditionalOperator,
      String returnValues,
      String returnConsumedCapacity,
      String returnItemCollectionMetrics,
      String updateExpression,
      String conditionExpression,
      Map<String, String> expressionAttributeNames,
      Map<String, AttributeValue> expressionAttributeValues}) async {
    var response_ = await _client.send('UpdateItem', {
      'TableName': tableName,
      'Key': key,
      if (attributeUpdates != null) 'AttributeUpdates': attributeUpdates,
      if (expected != null) 'Expected': expected,
      if (conditionalOperator != null)
        'ConditionalOperator': conditionalOperator,
      if (returnValues != null) 'ReturnValues': returnValues,
      if (returnConsumedCapacity != null)
        'ReturnConsumedCapacity': returnConsumedCapacity,
      if (returnItemCollectionMetrics != null)
        'ReturnItemCollectionMetrics': returnItemCollectionMetrics,
      if (updateExpression != null) 'UpdateExpression': updateExpression,
      if (conditionExpression != null)
        'ConditionExpression': conditionExpression,
      if (expressionAttributeNames != null)
        'ExpressionAttributeNames': expressionAttributeNames,
      if (expressionAttributeValues != null)
        'ExpressionAttributeValues': expressionAttributeValues,
    });
    return UpdateItemOutput.fromJson(response_);
  }

  /// Modifies the provisioned throughput settings, global secondary indexes, or
  /// DynamoDB Streams settings for a given table.
  ///
  /// You can only perform one of the following operations at once:
  ///
  /// *   Modify the provisioned throughput settings of the table.
  ///
  /// *   Enable or disable DynamoDB Streams on the table.
  ///
  /// *   Remove a global secondary index from the table.
  ///
  /// *   Create a new global secondary index on the table. After the index
  /// begins backfilling, you can use `UpdateTable` to perform other operations.
  ///
  ///
  ///  `UpdateTable` is an asynchronous operation; while it is executing, the
  /// table status changes from `ACTIVE` to `UPDATING`. While it is `UPDATING`,
  /// you cannot issue another `UpdateTable` request. When the table returns to
  /// the `ACTIVE` state, the `UpdateTable` operation is complete.
  ///
  /// [attributeDefinitions]: An array of attributes that describe the key
  /// schema for the table and indexes. If you are adding a new global secondary
  /// index to the table, `AttributeDefinitions` must include the key element(s)
  /// of the new index.
  ///
  /// [tableName]: The name of the table to be updated.
  ///
  /// [billingMode]: Controls how you are charged for read and write throughput
  /// and how you manage capacity. When switching from pay-per-request to
  /// provisioned capacity, initial provisioned capacity values must be set. The
  /// initial provisioned capacity values are estimated based on the consumed
  /// read and write capacity of your table and global secondary indexes over
  /// the past 30 minutes.
  ///
  /// *    `PROVISIONED` - Sets the billing mode to `PROVISIONED`. We recommend
  /// using `PROVISIONED` for predictable workloads.
  ///
  /// *    `PAY_PER_REQUEST` - Sets the billing mode to `PAY_PER_REQUEST`. We
  /// recommend using `PAY_PER_REQUEST` for unpredictable workloads.
  ///
  /// [provisionedThroughput]: The new provisioned throughput settings for the
  /// specified table or index.
  ///
  /// [globalSecondaryIndexUpdates]: An array of one or more global secondary
  /// indexes for the table. For each index in the array, you can request one
  /// action:
  ///
  /// *    `Create` - add a new global secondary index to the table.
  ///
  /// *    `Update` - modify the provisioned throughput settings of an existing
  /// global secondary index.
  ///
  /// *    `Delete` - remove a global secondary index from the table.
  ///
  ///
  /// For more information, see
  /// [Managing Global Secondary Indexes](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/GSI.OnlineOps.html)
  /// in the _Amazon DynamoDB Developer Guide_.
  ///
  /// [streamSpecification]: Represents the DynamoDB Streams configuration for
  /// the table.
  ///
  ///
  ///
  /// You receive a `ResourceInUseException` if you try to enable a stream on a
  /// table that already has a stream, or if you try to disable a stream on a
  /// table that doesn't have a stream.
  ///
  /// [sseSpecification]: The new server-side encryption settings for the
  /// specified table.
  Future<UpdateTableOutput> updateTable(String tableName,
      {List<AttributeDefinition> attributeDefinitions,
      String billingMode,
      ProvisionedThroughput provisionedThroughput,
      List<GlobalSecondaryIndexUpdate> globalSecondaryIndexUpdates,
      StreamSpecification streamSpecification,
      SseSpecification sseSpecification}) async {
    var response_ = await _client.send('UpdateTable', {
      if (attributeDefinitions != null)
        'AttributeDefinitions': attributeDefinitions,
      'TableName': tableName,
      if (billingMode != null) 'BillingMode': billingMode,
      if (provisionedThroughput != null)
        'ProvisionedThroughput': provisionedThroughput,
      if (globalSecondaryIndexUpdates != null)
        'GlobalSecondaryIndexUpdates': globalSecondaryIndexUpdates,
      if (streamSpecification != null)
        'StreamSpecification': streamSpecification,
      if (sseSpecification != null) 'SSESpecification': sseSpecification,
    });
    return UpdateTableOutput.fromJson(response_);
  }

  /// The `UpdateTimeToLive` method enables or disables Time to Live (TTL) for
  /// the specified table. A successful `UpdateTimeToLive` call returns the
  /// current `TimeToLiveSpecification`. It can take up to one hour for the
  /// change to fully process. Any additional `UpdateTimeToLive` calls for the
  /// same table during this one hour duration result in a
  /// `ValidationException`.
  ///
  /// TTL compares the current time in epoch time format to the time stored in
  /// the TTL attribute of an item. If the epoch time value stored in the
  /// attribute is less than the current time, the item is marked as expired and
  /// subsequently deleted.
  ///
  ///   The epoch time format is the number of seconds elapsed since 12:00:00 AM
  /// January 1, 1970 UTC.
  ///
  /// DynamoDB deletes expired items on a best-effort basis to ensure
  /// availability of throughput for other data operations.
  ///
  ///  DynamoDB typically deletes expired items within two days of expiration.
  /// The exact duration within which an item gets deleted after expiration is
  /// specific to the nature of the workload. Items that have expired and not
  /// been deleted will still show up in reads, queries, and scans.
  ///
  /// As items are deleted, they are removed from any local secondary index and
  /// global secondary index immediately in the same eventually consistent way
  /// as a standard delete operation.
  ///
  /// For more information, see
  /// [Time To Live](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/TTL.html)
  /// in the Amazon DynamoDB Developer Guide.
  ///
  /// [tableName]: The name of the table to be configured.
  ///
  /// [timeToLiveSpecification]: Represents the settings used to enable or
  /// disable Time to Live for the specified table.
  Future<UpdateTimeToLiveOutput> updateTimeToLive(
      {@required String tableName,
      @required TimeToLiveSpecification timeToLiveSpecification}) async {
    var response_ = await _client.send('UpdateTimeToLive', {
      'TableName': tableName,
      'TimeToLiveSpecification': timeToLiveSpecification,
    });
    return UpdateTimeToLiveOutput.fromJson(response_);
  }
}

/// Represents an attribute for describing the key schema for the table and
/// indexes.
class AttributeDefinition {
  /// A name for the attribute.
  final String attributeName;

  /// The data type for the attribute, where:
  ///
  /// *    `S` - the attribute is of type String
  ///
  /// *    `N` - the attribute is of type Number
  ///
  /// *    `B` - the attribute is of type Binary
  final String attributeType;

  AttributeDefinition({
    @required this.attributeName,
    @required this.attributeType,
  });
  static AttributeDefinition fromJson(Map<String, dynamic> json) =>
      AttributeDefinition(
        attributeName: json['AttributeName'] as String,
        attributeType: json['AttributeType'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Represents the data for an attribute.
///
/// Each attribute value is described as a name-value pair. The name is the data
/// type, and the value is the data itself.
///
/// For more information, see
/// [Data Types](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.NamingRulesDataTypes.html#HowItWorks.DataTypes)
/// in the _Amazon DynamoDB Developer Guide_.
class AttributeValue {
  /// An attribute of type String. For example:
  ///
  ///  `"S": "Hello"`
  final String s;

  /// An attribute of type Number. For example:
  ///
  ///  `"N": "123.45"`
  ///
  /// Numbers are sent across the network to DynamoDB as strings, to maximize
  /// compatibility across languages and libraries. However, DynamoDB treats
  /// them as number type attributes for mathematical operations.
  final String n;

  /// An attribute of type Binary. For example:
  ///
  ///  `"B": "dGhpcyB0ZXh0IGlzIGJhc2U2NC1lbmNvZGVk"`
  final Uint8List b;

  /// An attribute of type String Set. For example:
  ///
  ///  `"SS": ["Giraffe", "Hippo" ,"Zebra"]`
  final List<String> ss;

  /// An attribute of type Number Set. For example:
  ///
  ///  `"NS": ["42.2", "-19", "7.5", "3.14"]`
  ///
  /// Numbers are sent across the network to DynamoDB as strings, to maximize
  /// compatibility across languages and libraries. However, DynamoDB treats
  /// them as number type attributes for mathematical operations.
  final List<String> ns;

  /// An attribute of type Binary Set. For example:
  ///
  ///  `"BS": ["U3Vubnk=", "UmFpbnk=", "U25vd3k="]`
  final List<Uint8List> bs;

  /// An attribute of type Map. For example:
  ///
  ///  `"M": {"Name": {"S": "Joe"}, "Age": {"N": "35"}}`
  final Map<String, AttributeValue> m;

  /// An attribute of type List. For example:
  ///
  ///  `"L": [ {"S": "Cookies"} , {"S": "Coffee"}, {"N", "3.14159"}]`
  final List<AttributeValue> l;

  /// An attribute of type Null. For example:
  ///
  ///  `"NULL": true`
  final bool null$;

  /// An attribute of type Boolean. For example:
  ///
  ///  `"BOOL": true`
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
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// For the `UpdateItem` operation, represents the attributes to be modified,
/// the action to perform on each, and the new value for each.
///
///  You cannot use `UpdateItem` to update any primary key attributes. Instead,
/// you will need to delete the item, and then use `PutItem` to create a new
/// item with new attributes.
///
/// Attribute values cannot be null; string and binary type attributes must have
/// lengths greater than zero; and set type attributes must not be empty.
/// Requests with empty values will be rejected with a `ValidationException`
/// exception.
class AttributeValueUpdate {
  /// Represents the data for an attribute.
  ///
  /// Each attribute value is described as a name-value pair. The name is the
  /// data type, and the value is the data itself.
  ///
  /// For more information, see
  /// [Data Types](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.NamingRulesDataTypes.html#HowItWorks.DataTypes)
  /// in the _Amazon DynamoDB Developer Guide_.
  final AttributeValue value;

  /// Specifies how to perform the update. Valid values are `PUT` (default),
  /// `DELETE`, and `ADD`. The behavior depends on whether the specified primary
  /// key already exists in the table.
  ///
  ///  **If an item with the specified _Key_ is found in the table:**
  ///
  /// *    `PUT` - Adds the specified attribute to the item. If the attribute
  /// already exists, it is replaced by the new value.
  ///
  /// *    `DELETE` - If no value is specified, the attribute and its value are
  /// removed from the item. The data type of the specified value must match the
  /// existing value's data type.
  ///
  ///     If a _set_ of values is specified, then those values are subtracted
  /// from the old set. For example, if the attribute value was the set
  /// `[a,b,c]` and the `DELETE` action specified `[a,c]`, then the final
  /// attribute value would be `[b]`. Specifying an empty set is an error.
  ///
  /// *    `ADD` - If the attribute does not already exist, then the attribute
  /// and its values are added to the item. If the attribute does exist, then
  /// the behavior of `ADD` depends on the data type of the attribute:
  ///
  ///     *   If the existing attribute is a number, and if `Value` is also a
  /// number, then the `Value` is mathematically added to the existing
  /// attribute. If `Value` is a negative number, then it is subtracted from the
  /// existing attribute.
  ///
  ///           If you use `ADD` to increment or decrement a number value for an
  /// item that doesn't exist before the update, DynamoDB uses 0 as the initial
  /// value.
  ///
  ///         In addition, if you use `ADD` to update an existing item, and
  /// intend to increment or decrement an attribute value which does not yet
  /// exist, DynamoDB uses `0` as the initial value. For example, suppose that
  /// the item you want to update does not yet have an attribute named
  /// _itemcount_, but you decide to `ADD` the number `3` to this attribute
  /// anyway, even though it currently does not exist. DynamoDB will create the
  /// _itemcount_ attribute, set its initial value to `0`, and finally add `3`
  /// to it. The result will be a new _itemcount_ attribute in the item, with a
  /// value of `3`.
  ///     *   If the existing data type is a set, and if the `Value` is also a
  /// set, then the `Value` is added to the existing set. (This is a _set_
  /// operation, not mathematical addition.) For example, if the attribute value
  /// was the set `[1,2]`, and the `ADD` action specified `[3]`, then the final
  /// attribute value would be `[1,2,3]`. An error occurs if an Add action is
  /// specified for a set attribute and the attribute type specified does not
  /// match the existing set type.
  ///
  ///         Both sets must have the same primitive data type. For example, if
  /// the existing data type is a set of strings, the `Value` must also be a set
  /// of strings. The same holds true for number sets and binary sets.
  ///
  ///
  ///     This action is only valid for an existing attribute whose data type is
  /// number or is a set. Do not use `ADD` for any other data types.
  ///
  ///
  ///  **If no item with the specified _Key_ is found:**
  ///
  /// *    `PUT` - DynamoDB creates a new item with the specified primary key,
  /// and then adds the attribute.
  ///
  /// *    `DELETE` - Nothing happens; there is no attribute to delete.
  ///
  /// *    `ADD` - DynamoDB creates an item with the supplied primary key and
  /// number (or set of numbers) for the attribute value. The only data types
  /// allowed are number and number set; no other data types can be specified.
  final String action;

  AttributeValueUpdate({
    this.value,
    this.action,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Represents the properties of the scaling policy.
class AutoScalingPolicyDescription {
  /// The name of the scaling policy.
  final String policyName;

  /// Represents a target tracking scaling policy configuration.
  final AutoScalingTargetTrackingScalingPolicyConfigurationDescription
      targetTrackingScalingPolicyConfiguration;

  AutoScalingPolicyDescription({
    this.policyName,
    this.targetTrackingScalingPolicyConfiguration,
  });
  static AutoScalingPolicyDescription fromJson(Map<String, dynamic> json) =>
      AutoScalingPolicyDescription(
        policyName: json.containsKey('PolicyName')
            ? json['PolicyName'] as String
            : null,
        targetTrackingScalingPolicyConfiguration:
            json.containsKey('TargetTrackingScalingPolicyConfiguration')
                ? AutoScalingTargetTrackingScalingPolicyConfigurationDescription
                    .fromJson(json['TargetTrackingScalingPolicyConfiguration'])
                : null,
      );
}

/// Represents the autoscaling policy to be modified.
class AutoScalingPolicyUpdate {
  /// The name of the scaling policy.
  final String policyName;

  /// Represents a target tracking scaling policy configuration.
  final AutoScalingTargetTrackingScalingPolicyConfigurationUpdate
      targetTrackingScalingPolicyConfiguration;

  AutoScalingPolicyUpdate({
    this.policyName,
    @required this.targetTrackingScalingPolicyConfiguration,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Represents the autoscaling settings for a global table or global secondary
/// index.
class AutoScalingSettingsDescription {
  /// The minimum capacity units that a global table or global secondary index
  /// should be scaled down to.
  final BigInt minimumUnits;

  /// The maximum capacity units that a global table or global secondary index
  /// should be scaled up to.
  final BigInt maximumUnits;

  /// Disabled autoscaling for this global table or global secondary index.
  final bool autoScalingDisabled;

  /// Role ARN used for configuring autoScaling policy.
  final String autoScalingRoleArn;

  /// Information about the scaling policies.
  final List<AutoScalingPolicyDescription> scalingPolicies;

  AutoScalingSettingsDescription({
    this.minimumUnits,
    this.maximumUnits,
    this.autoScalingDisabled,
    this.autoScalingRoleArn,
    this.scalingPolicies,
  });
  static AutoScalingSettingsDescription fromJson(Map<String, dynamic> json) =>
      AutoScalingSettingsDescription(
        minimumUnits: json.containsKey('MinimumUnits')
            ? BigInt.from(json['MinimumUnits'])
            : null,
        maximumUnits: json.containsKey('MaximumUnits')
            ? BigInt.from(json['MaximumUnits'])
            : null,
        autoScalingDisabled: json.containsKey('AutoScalingDisabled')
            ? json['AutoScalingDisabled'] as bool
            : null,
        autoScalingRoleArn: json.containsKey('AutoScalingRoleArn')
            ? json['AutoScalingRoleArn'] as String
            : null,
        scalingPolicies: json.containsKey('ScalingPolicies')
            ? (json['ScalingPolicies'] as List)
                .map((e) => AutoScalingPolicyDescription.fromJson(e))
                .toList()
            : null,
      );
}

/// Represents the autoscaling settings to be modified for a global table or
/// global secondary index.
class AutoScalingSettingsUpdate {
  /// The minimum capacity units that a global table or global secondary index
  /// should be scaled down to.
  final BigInt minimumUnits;

  /// The maximum capacity units that a global table or global secondary index
  /// should be scaled up to.
  final BigInt maximumUnits;

  /// Disabled autoscaling for this global table or global secondary index.
  final bool autoScalingDisabled;

  /// Role ARN used for configuring autoscaling policy.
  final String autoScalingRoleArn;

  /// The scaling policy to apply for scaling target global table or global
  /// secondary index capacity units.
  final AutoScalingPolicyUpdate scalingPolicyUpdate;

  AutoScalingSettingsUpdate({
    this.minimumUnits,
    this.maximumUnits,
    this.autoScalingDisabled,
    this.autoScalingRoleArn,
    this.scalingPolicyUpdate,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Represents the properties of a target tracking scaling policy.
class AutoScalingTargetTrackingScalingPolicyConfigurationDescription {
  /// Indicates whether scale in by the target tracking policy is disabled. If
  /// the value is true, scale in is disabled and the target tracking policy
  /// won't remove capacity from the scalable resource. Otherwise, scale in is
  /// enabled and the target tracking policy can remove capacity from the
  /// scalable resource. The default value is false.
  final bool disableScaleIn;

  /// The amount of time, in seconds, after a scale in activity completes before
  /// another scale in activity can start. The cooldown period is used to block
  /// subsequent scale in requests until it has expired. You should scale in
  /// conservatively to protect your application's availability. However, if
  /// another alarm triggers a scale out policy during the cooldown period after
  /// a scale-in, application autoscaling scales out your scalable target
  /// immediately.
  final int scaleInCooldown;

  /// The amount of time, in seconds, after a scale out activity completes
  /// before another scale out activity can start. While the cooldown period is
  /// in effect, the capacity that has been added by the previous scale out
  /// event that initiated the cooldown is calculated as part of the desired
  /// capacity for the next scale out. You should continuously (but not
  /// excessively) scale out.
  final int scaleOutCooldown;

  /// The target value for the metric. The range is 8.515920e-109 to
  /// 1.174271e+108 (Base 10) or 2e-360 to 2e360 (Base 2).
  final double targetValue;

  AutoScalingTargetTrackingScalingPolicyConfigurationDescription({
    this.disableScaleIn,
    this.scaleInCooldown,
    this.scaleOutCooldown,
    @required this.targetValue,
  });
  static AutoScalingTargetTrackingScalingPolicyConfigurationDescription
      fromJson(Map<String, dynamic> json) =>
          AutoScalingTargetTrackingScalingPolicyConfigurationDescription(
            disableScaleIn: json.containsKey('DisableScaleIn')
                ? json['DisableScaleIn'] as bool
                : null,
            scaleInCooldown: json.containsKey('ScaleInCooldown')
                ? json['ScaleInCooldown'] as int
                : null,
            scaleOutCooldown: json.containsKey('ScaleOutCooldown')
                ? json['ScaleOutCooldown'] as int
                : null,
            targetValue: json['TargetValue'] as double,
          );
}

/// Represents the settings of a target tracking scaling policy that will be
/// modified.
class AutoScalingTargetTrackingScalingPolicyConfigurationUpdate {
  /// Indicates whether scale in by the target tracking policy is disabled. If
  /// the value is true, scale in is disabled and the target tracking policy
  /// won't remove capacity from the scalable resource. Otherwise, scale in is
  /// enabled and the target tracking policy can remove capacity from the
  /// scalable resource. The default value is false.
  final bool disableScaleIn;

  /// The amount of time, in seconds, after a scale in activity completes before
  /// another scale in activity can start. The cooldown period is used to block
  /// subsequent scale in requests until it has expired. You should scale in
  /// conservatively to protect your application's availability. However, if
  /// another alarm triggers a scale out policy during the cooldown period after
  /// a scale-in, application autoscaling scales out your scalable target
  /// immediately.
  final int scaleInCooldown;

  /// The amount of time, in seconds, after a scale out activity completes
  /// before another scale out activity can start. While the cooldown period is
  /// in effect, the capacity that has been added by the previous scale out
  /// event that initiated the cooldown is calculated as part of the desired
  /// capacity for the next scale out. You should continuously (but not
  /// excessively) scale out.
  final int scaleOutCooldown;

  /// The target value for the metric. The range is 8.515920e-109 to
  /// 1.174271e+108 (Base 10) or 2e-360 to 2e360 (Base 2).
  final double targetValue;

  AutoScalingTargetTrackingScalingPolicyConfigurationUpdate({
    this.disableScaleIn,
    this.scaleInCooldown,
    this.scaleOutCooldown,
    @required this.targetValue,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Contains the description of the backup created for the table.
class BackupDescription {
  /// Contains the details of the backup created for the table.
  final BackupDetails backupDetails;

  /// Contains the details of the table when the backup was created.
  final SourceTableDetails sourceTableDetails;

  /// Contains the details of the features enabled on the table when the backup
  /// was created. For example, LSIs, GSIs, streams, TTL.
  final SourceTableFeatureDetails sourceTableFeatureDetails;

  BackupDescription({
    this.backupDetails,
    this.sourceTableDetails,
    this.sourceTableFeatureDetails,
  });
  static BackupDescription fromJson(Map<String, dynamic> json) =>
      BackupDescription(
        backupDetails: json.containsKey('BackupDetails')
            ? BackupDetails.fromJson(json['BackupDetails'])
            : null,
        sourceTableDetails: json.containsKey('SourceTableDetails')
            ? SourceTableDetails.fromJson(json['SourceTableDetails'])
            : null,
        sourceTableFeatureDetails: json.containsKey('SourceTableFeatureDetails')
            ? SourceTableFeatureDetails.fromJson(
                json['SourceTableFeatureDetails'])
            : null,
      );
}

/// Contains the details of the backup created for the table.
class BackupDetails {
  /// ARN associated with the backup.
  final String backupArn;

  /// Name of the requested backup.
  final String backupName;

  /// Size of the backup in bytes.
  final BigInt backupSizeBytes;

  /// Backup can be in one of the following states: CREATING, ACTIVE, DELETED.
  final String backupStatus;

  /// BackupType:
  ///
  /// *    `USER` - You create and manage these using the on-demand backup
  /// feature.
  ///
  /// *    `SYSTEM` - If you delete a table with point-in-time recovery enabled,
  /// a `SYSTEM` backup is automatically created and is retained for 35 days (at
  /// no additional cost). System backups allow you to restore the deleted table
  /// to the state it was in just before the point of deletion.
  ///
  /// *    `AWS_BACKUP` - On-demand backup created by you from AWS Backup
  /// service.
  final String backupType;

  /// Time at which the backup was created. This is the request time of the
  /// backup.
  final DateTime backupCreationDateTime;

  /// Time at which the automatic on-demand backup created by DynamoDB will
  /// expire. This `SYSTEM` on-demand backup expires automatically 35 days after
  /// its creation.
  final DateTime backupExpiryDateTime;

  BackupDetails({
    @required this.backupArn,
    @required this.backupName,
    this.backupSizeBytes,
    @required this.backupStatus,
    @required this.backupType,
    @required this.backupCreationDateTime,
    this.backupExpiryDateTime,
  });
  static BackupDetails fromJson(Map<String, dynamic> json) => BackupDetails(
        backupArn: json['BackupArn'] as String,
        backupName: json['BackupName'] as String,
        backupSizeBytes: json.containsKey('BackupSizeBytes')
            ? BigInt.from(json['BackupSizeBytes'])
            : null,
        backupStatus: json['BackupStatus'] as String,
        backupType: json['BackupType'] as String,
        backupCreationDateTime: DateTime.parse(json['BackupCreationDateTime']),
        backupExpiryDateTime: json.containsKey('BackupExpiryDateTime')
            ? DateTime.parse(json['BackupExpiryDateTime'])
            : null,
      );
}

/// Contains details for the backup.
class BackupSummary {
  /// Name of the table.
  final String tableName;

  /// Unique identifier for the table.
  final String tableId;

  /// ARN associated with the table.
  final String tableArn;

  /// ARN associated with the backup.
  final String backupArn;

  /// Name of the specified backup.
  final String backupName;

  /// Time at which the backup was created.
  final DateTime backupCreationDateTime;

  /// Time at which the automatic on-demand backup created by DynamoDB will
  /// expire. This `SYSTEM` on-demand backup expires automatically 35 days after
  /// its creation.
  final DateTime backupExpiryDateTime;

  /// Backup can be in one of the following states: CREATING, ACTIVE, DELETED.
  final String backupStatus;

  /// BackupType:
  ///
  /// *    `USER` - You create and manage these using the on-demand backup
  /// feature.
  ///
  /// *    `SYSTEM` - If you delete a table with point-in-time recovery enabled,
  /// a `SYSTEM` backup is automatically created and is retained for 35 days (at
  /// no additional cost). System backups allow you to restore the deleted table
  /// to the state it was in just before the point of deletion.
  ///
  /// *    `AWS_BACKUP` - On-demand backup created by you from AWS Backup
  /// service.
  final String backupType;

  /// Size of the backup in bytes.
  final BigInt backupSizeBytes;

  BackupSummary({
    this.tableName,
    this.tableId,
    this.tableArn,
    this.backupArn,
    this.backupName,
    this.backupCreationDateTime,
    this.backupExpiryDateTime,
    this.backupStatus,
    this.backupType,
    this.backupSizeBytes,
  });
  static BackupSummary fromJson(Map<String, dynamic> json) => BackupSummary(
        tableName:
            json.containsKey('TableName') ? json['TableName'] as String : null,
        tableId: json.containsKey('TableId') ? json['TableId'] as String : null,
        tableArn:
            json.containsKey('TableArn') ? json['TableArn'] as String : null,
        backupArn:
            json.containsKey('BackupArn') ? json['BackupArn'] as String : null,
        backupName: json.containsKey('BackupName')
            ? json['BackupName'] as String
            : null,
        backupCreationDateTime: json.containsKey('BackupCreationDateTime')
            ? DateTime.parse(json['BackupCreationDateTime'])
            : null,
        backupExpiryDateTime: json.containsKey('BackupExpiryDateTime')
            ? DateTime.parse(json['BackupExpiryDateTime'])
            : null,
        backupStatus: json.containsKey('BackupStatus')
            ? json['BackupStatus'] as String
            : null,
        backupType: json.containsKey('BackupType')
            ? json['BackupType'] as String
            : null,
        backupSizeBytes: json.containsKey('BackupSizeBytes')
            ? BigInt.from(json['BackupSizeBytes'])
            : null,
      );
}

/// Represents the output of a `BatchGetItem` operation.
class BatchGetItemOutput {
  /// A map of table name to a list of items. Each object in `Responses`
  /// consists of a table name, along with a map of attribute data consisting of
  /// the data type and attribute value.
  final Map<String, List<Map<String, AttributeValue>>> responses;

  /// A map of tables and their respective keys that were not processed with the
  /// current response. The `UnprocessedKeys` value is in the same form as
  /// `RequestItems`, so the value can be provided directly to a subsequent
  /// `BatchGetItem` operation. For more information, see `RequestItems` in the
  /// Request Parameters section.
  ///
  /// Each element consists of:
  ///
  /// *    `Keys` - An array of primary key attribute values that define
  /// specific items in the table.
  ///
  /// *    `ProjectionExpression` - One or more attributes to be retrieved from
  /// the table or index. By default, all attributes are returned. If a
  /// requested attribute is not found, it does not appear in the result.
  ///
  /// *    `ConsistentRead` - The consistency of a read operation. If set to
  /// `true`, then a strongly consistent read is used; otherwise, an eventually
  /// consistent read is used.
  ///
  ///
  /// If there are no unprocessed keys remaining, the response contains an empty
  /// `UnprocessedKeys` map.
  final Map<String, KeysAndAttributes> unprocessedKeys;

  /// The read capacity units consumed by the entire `BatchGetItem` operation.
  ///
  /// Each element consists of:
  ///
  /// *    `TableName` - The table that consumed the provisioned throughput.
  ///
  /// *    `CapacityUnits` - The total number of capacity units consumed.
  final List<ConsumedCapacity> consumedCapacity;

  BatchGetItemOutput({
    this.responses,
    this.unprocessedKeys,
    this.consumedCapacity,
  });
  static BatchGetItemOutput fromJson(Map<String, dynamic> json) =>
      BatchGetItemOutput(
        responses: json.containsKey('Responses')
            ? (json['Responses'] as Map).map((k, v) => MapEntry(
                k as String,
                (v as List)
                    .map((e) => (e as Map).map((k, v) =>
                        MapEntry(k as String, AttributeValue.fromJson(v))))
                    .toList()))
            : null,
        unprocessedKeys: json.containsKey('UnprocessedKeys')
            ? (json['UnprocessedKeys'] as Map).map(
                (k, v) => MapEntry(k as String, KeysAndAttributes.fromJson(v)))
            : null,
        consumedCapacity: json.containsKey('ConsumedCapacity')
            ? (json['ConsumedCapacity'] as List)
                .map((e) => ConsumedCapacity.fromJson(e))
                .toList()
            : null,
      );
}

/// Represents the output of a `BatchWriteItem` operation.
class BatchWriteItemOutput {
  /// A map of tables and requests against those tables that were not processed.
  /// The `UnprocessedItems` value is in the same form as `RequestItems`, so you
  /// can provide this value directly to a subsequent `BatchGetItem` operation.
  /// For more information, see `RequestItems` in the Request Parameters
  /// section.
  ///
  /// Each `UnprocessedItems` entry consists of a table name and, for that
  /// table, a list of operations to perform (`DeleteRequest` or `PutRequest`).
  ///
  /// *    `DeleteRequest` - Perform a `DeleteItem` operation on the specified
  /// item. The item to be deleted is identified by a `Key` subelement:
  ///
  ///     *    `Key` - A map of primary key attribute values that uniquely
  /// identify the item. Each entry in this map consists of an attribute name
  /// and an attribute value.
  ///
  ///
  /// *    `PutRequest` - Perform a `PutItem` operation on the specified item.
  /// The item to be put is identified by an `Item` subelement:
  ///
  ///     *    `Item` - A map of attributes and their values. Each entry in this
  /// map consists of an attribute name and an attribute value. Attribute values
  /// must not be null; string and binary type attributes must have lengths
  /// greater than zero; and set type attributes must not be empty. Requests
  /// that contain empty values will be rejected with a `ValidationException`
  /// exception.
  ///
  ///         If you specify any attributes that are part of an index key, then
  /// the data types for those attributes must match those of the schema in the
  /// table's attribute definition.
  ///
  ///
  ///
  /// If there are no unprocessed items remaining, the response contains an
  /// empty `UnprocessedItems` map.
  final Map<String, List<WriteRequest>> unprocessedItems;

  /// A list of tables that were processed by `BatchWriteItem` and, for each
  /// table, information about any item collections that were affected by
  /// individual `DeleteItem` or `PutItem` operations.
  ///
  /// Each entry consists of the following subelements:
  ///
  /// *    `ItemCollectionKey` - The partition key value of the item collection.
  /// This is the same as the partition key value of the item.
  ///
  /// *    `SizeEstimateRangeGB` - An estimate of item collection size,
  /// expressed in GB. This is a two-element array containing a lower bound and
  /// an upper bound for the estimate. The estimate includes the size of all the
  /// items in the table, plus the size of all attributes projected into all of
  /// the local secondary indexes on the table. Use this estimate to measure
  /// whether a local secondary index is approaching its size limit.
  ///
  ///     The estimate is subject to change over time; therefore, do not rely on
  /// the precision or accuracy of the estimate.
  final Map<String, List<ItemCollectionMetrics>> itemCollectionMetrics;

  /// The capacity units consumed by the entire `BatchWriteItem` operation.
  ///
  /// Each element consists of:
  ///
  /// *    `TableName` - The table that consumed the provisioned throughput.
  ///
  /// *    `CapacityUnits` - The total number of capacity units consumed.
  final List<ConsumedCapacity> consumedCapacity;

  BatchWriteItemOutput({
    this.unprocessedItems,
    this.itemCollectionMetrics,
    this.consumedCapacity,
  });
  static BatchWriteItemOutput fromJson(Map<String, dynamic> json) =>
      BatchWriteItemOutput(
        unprocessedItems: json.containsKey('UnprocessedItems')
            ? (json['UnprocessedItems'] as Map).map((k, v) => MapEntry(
                k as String,
                (v as List).map((e) => WriteRequest.fromJson(e)).toList()))
            : null,
        itemCollectionMetrics: json.containsKey('ItemCollectionMetrics')
            ? (json['ItemCollectionMetrics'] as Map).map((k, v) => MapEntry(
                k as String,
                (v as List)
                    .map((e) => ItemCollectionMetrics.fromJson(e))
                    .toList()))
            : null,
        consumedCapacity: json.containsKey('ConsumedCapacity')
            ? (json['ConsumedCapacity'] as List)
                .map((e) => ConsumedCapacity.fromJson(e))
                .toList()
            : null,
      );
}

/// Contains the details for the read/write capacity mode.
class BillingModeSummary {
  /// Controls how you are charged for read and write throughput and how you
  /// manage capacity. This setting can be changed later.
  ///
  /// *    `PROVISIONED` - Sets the read/write capacity mode to `PROVISIONED`.
  /// We recommend using `PROVISIONED` for predictable workloads.
  ///
  /// *    `PAY_PER_REQUEST` - Sets the read/write capacity mode to
  /// `PAY_PER_REQUEST`. We recommend using `PAY_PER_REQUEST` for unpredictable
  /// workloads.
  final String billingMode;

  /// Represents the time when `PAY_PER_REQUEST` was last set as the read/write
  /// capacity mode.
  final DateTime lastUpdateToPayPerRequestDateTime;

  BillingModeSummary({
    this.billingMode,
    this.lastUpdateToPayPerRequestDateTime,
  });
  static BillingModeSummary fromJson(Map<String, dynamic> json) =>
      BillingModeSummary(
        billingMode: json.containsKey('BillingMode')
            ? json['BillingMode'] as String
            : null,
        lastUpdateToPayPerRequestDateTime:
            json.containsKey('LastUpdateToPayPerRequestDateTime')
                ? DateTime.parse(json['LastUpdateToPayPerRequestDateTime'])
                : null,
      );
}

/// Represents the amount of provisioned throughput capacity consumed on a table
/// or an index.
class Capacity {
  /// The total number of read capacity units consumed on a table or an index.
  final double readCapacityUnits;

  /// The total number of write capacity units consumed on a table or an index.
  final double writeCapacityUnits;

  /// The total number of capacity units consumed on a table or an index.
  final double capacityUnits;

  Capacity({
    this.readCapacityUnits,
    this.writeCapacityUnits,
    this.capacityUnits,
  });
  static Capacity fromJson(Map<String, dynamic> json) => Capacity(
        readCapacityUnits: json.containsKey('ReadCapacityUnits')
            ? json['ReadCapacityUnits'] as double
            : null,
        writeCapacityUnits: json.containsKey('WriteCapacityUnits')
            ? json['WriteCapacityUnits'] as double
            : null,
        capacityUnits: json.containsKey('CapacityUnits')
            ? json['CapacityUnits'] as double
            : null,
      );
}

/// Represents the selection criteria for a `Query` or `Scan` operation:
///
/// *   For a `Query` operation, `Condition` is used for specifying the
/// `KeyConditions` to use when querying a table or an index. For
/// `KeyConditions`, only the following comparison operators are supported:
///
///      `EQ | LE | LT | GE | GT | BEGINS_WITH | BETWEEN`
///
///      `Condition` is also used in a `QueryFilter`, which evaluates the query
/// results and returns only the desired values.
///
/// *   For a `Scan` operation, `Condition` is used in a `ScanFilter`, which
/// evaluates the scan results and returns only the desired values.
class Condition {
  /// One or more values to evaluate against the supplied attribute. The number
  /// of values in the list depends on the `ComparisonOperator` being used.
  ///
  /// For type Number, value comparisons are numeric.
  ///
  /// String value comparisons for greater than, equals, or less than are based
  /// on ASCII character code values. For example, `a` is greater than `A`, and
  /// `a` is greater than `B`. For a list of code values, see
  /// [http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters](http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters).
  ///
  /// For Binary, DynamoDB treats each byte of the binary data as unsigned when
  /// it compares binary values.
  final List<AttributeValue> attributeValueList;

  /// A comparator for evaluating attributes. For example, equals, greater than,
  /// less than, etc.
  ///
  /// The following comparison operators are available:
  ///
  ///  `EQ | NE | LE | LT | GE | GT | NOT_NULL | NULL | CONTAINS | NOT_CONTAINS
  /// | BEGINS_WITH | IN | BETWEEN`
  ///
  /// The following are descriptions of each comparison operator.
  ///
  /// *    `EQ` : Equal. `EQ` is supported for all data types, including lists
  /// and maps.
  ///
  ///      `AttributeValueList` can contain only one `AttributeValue` element of
  /// type String, Number, Binary, String Set, Number Set, or Binary Set. If an
  /// item contains an `AttributeValue` element of a different type than the one
  /// provided in the request, the value does not match. For example,
  /// `{"S":"6"}` does not equal `{"N":"6"}`. Also, `{"N":"6"}` does not equal
  /// `{"NS":["6", "2", "1"]}`.
  ///
  /// *    `NE` : Not equal. `NE` is supported for all data types, including
  /// lists and maps.
  ///
  ///      `AttributeValueList` can contain only one `AttributeValue` of type
  /// String, Number, Binary, String Set, Number Set, or Binary Set. If an item
  /// contains an `AttributeValue` of a different type than the one provided in
  /// the request, the value does not match. For example, `{"S":"6"}` does not
  /// equal `{"N":"6"}`. Also, `{"N":"6"}` does not equal
  /// `{"NS":["6", "2", "1"]}`.
  ///
  /// *    `LE` : Less than or equal.
  ///
  ///      `AttributeValueList` can contain only one `AttributeValue` element of
  /// type String, Number, or Binary (not a set type). If an item contains an
  /// `AttributeValue` element of a different type than the one provided in the
  /// request, the value does not match. For example, `{"S":"6"}` does not equal
  /// `{"N":"6"}`. Also, `{"N":"6"}` does not compare to
  /// `{"NS":["6", "2", "1"]}`.
  ///
  /// *    `LT` : Less than.
  ///
  ///      `AttributeValueList` can contain only one `AttributeValue` of type
  /// String, Number, or Binary (not a set type). If an item contains an
  /// `AttributeValue` element of a different type than the one provided in the
  /// request, the value does not match. For example, `{"S":"6"}` does not equal
  /// `{"N":"6"}`. Also, `{"N":"6"}` does not compare to
  /// `{"NS":["6", "2", "1"]}`.
  ///
  /// *    `GE` : Greater than or equal.
  ///
  ///      `AttributeValueList` can contain only one `AttributeValue` element of
  /// type String, Number, or Binary (not a set type). If an item contains an
  /// `AttributeValue` element of a different type than the one provided in the
  /// request, the value does not match. For example, `{"S":"6"}` does not equal
  /// `{"N":"6"}`. Also, `{"N":"6"}` does not compare to
  /// `{"NS":["6", "2", "1"]}`.
  ///
  /// *    `GT` : Greater than.
  ///
  ///      `AttributeValueList` can contain only one `AttributeValue` element of
  /// type String, Number, or Binary (not a set type). If an item contains an
  /// `AttributeValue` element of a different type than the one provided in the
  /// request, the value does not match. For example, `{"S":"6"}` does not equal
  /// `{"N":"6"}`. Also, `{"N":"6"}` does not compare to
  /// `{"NS":["6", "2", "1"]}`.
  ///
  /// *    `NOT_NULL` : The attribute exists. `NOT_NULL` is supported for all
  /// data types, including lists and maps.
  ///
  ///      This operator tests for the existence of an attribute, not its data
  /// type. If the data type of attribute "`a`" is null, and you evaluate it
  /// using `NOT_NULL`, the result is a Boolean `true`. This result is because
  /// the attribute "`a`" exists; its data type is not relevant to the
  /// `NOT_NULL` comparison operator.
  /// *    `NULL` : The attribute does not exist. `NULL` is supported for all
  /// data types, including lists and maps.
  ///
  ///      This operator tests for the nonexistence of an attribute, not its
  /// data type. If the data type of attribute "`a`" is null, and you evaluate
  /// it using `NULL`, the result is a Boolean `false`. This is because the
  /// attribute "`a`" exists; its data type is not relevant to the `NULL`
  /// comparison operator.
  /// *    `CONTAINS` : Checks for a subsequence, or value in a set.
  ///
  ///      `AttributeValueList` can contain only one `AttributeValue` element of
  /// type String, Number, or Binary (not a set type). If the target attribute
  /// of the comparison is of type String, then the operator checks for a
  /// substring match. If the target attribute of the comparison is of type
  /// Binary, then the operator looks for a subsequence of the target that
  /// matches the input. If the target attribute of the comparison is a set
  /// ("`SS`", "`NS`", or "`BS`"), then the operator evaluates to true if it
  /// finds an exact match with any member of the set.
  ///
  ///     CONTAINS is supported for lists: When evaluating "`a CONTAINS b`",
  /// "`a`" can be a list; however, "`b`" cannot be a set, a map, or a list.
  ///
  /// *    `NOT_CONTAINS` : Checks for absence of a subsequence, or absence of a
  /// value in a set.
  ///
  ///      `AttributeValueList` can contain only one `AttributeValue` element of
  /// type String, Number, or Binary (not a set type). If the target attribute
  /// of the comparison is a String, then the operator checks for the absence of
  /// a substring match. If the target attribute of the comparison is Binary,
  /// then the operator checks for the absence of a subsequence of the target
  /// that matches the input. If the target attribute of the comparison is a set
  /// ("`SS`", "`NS`", or "`BS`"), then the operator evaluates to true if it
  /// _does not_ find an exact match with any member of the set.
  ///
  ///     NOT_CONTAINS is supported for lists: When evaluating "`a NOT CONTAINS
  /// b`", "`a`" can be a list; however, "`b`" cannot be a set, a map, or a
  /// list.
  ///
  /// *    `BEGINS_WITH` : Checks for a prefix.
  ///
  ///      `AttributeValueList` can contain only one `AttributeValue` of type
  /// String or Binary (not a Number or a set type). The target attribute of the
  /// comparison must be of type String or Binary (not a Number or a set type).
  ///
  /// *    `IN` : Checks for matching elements in a list.
  ///
  ///      `AttributeValueList` can contain one or more `AttributeValue`
  /// elements of type String, Number, or Binary. These attributes are compared
  /// against an existing attribute of an item. If any elements of the input are
  /// equal to the item attribute, the expression evaluates to true.
  ///
  /// *    `BETWEEN` : Greater than or equal to the first value, and less than
  /// or equal to the second value.
  ///
  ///      `AttributeValueList` must contain two `AttributeValue` elements of
  /// the same type, either String, Number, or Binary (not a set type). A target
  /// attribute matches if the target value is greater than, or equal to, the
  /// first element and less than, or equal to, the second element. If an item
  /// contains an `AttributeValue` element of a different type than the one
  /// provided in the request, the value does not match. For example,
  /// `{"S":"6"}` does not compare to `{"N":"6"}`. Also, `{"N":"6"}` does not
  /// compare to `{"NS":["6", "2", "1"]}`
  ///
  ///
  /// For usage examples of `AttributeValueList` and `ComparisonOperator`, see
  /// [Legacy Conditional Parameters](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.html)
  /// in the _Amazon DynamoDB Developer Guide_.
  final String comparisonOperator;

  Condition({
    this.attributeValueList,
    @required this.comparisonOperator,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Represents a request to perform a check that an item exists or to check the
/// condition of specific attributes of the item..
class ConditionCheck {
  /// The primary key of the item to be checked. Each element consists of an
  /// attribute name and a value for that attribute.
  final Map<String, AttributeValue> key;

  /// Name of the table for the check item request.
  final String tableName;

  /// A condition that must be satisfied in order for a conditional update to
  /// succeed.
  final String conditionExpression;

  /// One or more substitution tokens for attribute names in an expression.
  final Map<String, String> expressionAttributeNames;

  /// One or more values that can be substituted in an expression.
  final Map<String, AttributeValue> expressionAttributeValues;

  /// Use `ReturnValuesOnConditionCheckFailure` to get the item attributes if
  /// the `ConditionCheck` condition fails. For
  /// `ReturnValuesOnConditionCheckFailure`, the valid values are: NONE and
  /// ALL_OLD.
  final String returnValuesOnConditionCheckFailure;

  ConditionCheck({
    @required this.key,
    @required this.tableName,
    @required this.conditionExpression,
    this.expressionAttributeNames,
    this.expressionAttributeValues,
    this.returnValuesOnConditionCheckFailure,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The capacity units consumed by an operation. The data returned includes the
/// total provisioned throughput consumed, along with statistics for the table
/// and any indexes involved in the operation. `ConsumedCapacity` is only
/// returned if the request asked for it. For more information, see
/// [Provisioned Throughput](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ProvisionedThroughputIntro.html)
/// in the _Amazon DynamoDB Developer Guide_.
class ConsumedCapacity {
  /// The name of the table that was affected by the operation.
  final String tableName;

  /// The total number of capacity units consumed by the operation.
  final double capacityUnits;

  /// The total number of read capacity units consumed by the operation.
  final double readCapacityUnits;

  /// The total number of write capacity units consumed by the operation.
  final double writeCapacityUnits;

  /// The amount of throughput consumed on the table affected by the operation.
  final Capacity table;

  /// The amount of throughput consumed on each local index affected by the
  /// operation.
  final Map<String, Capacity> localSecondaryIndexes;

  /// The amount of throughput consumed on each global index affected by the
  /// operation.
  final Map<String, Capacity> globalSecondaryIndexes;

  ConsumedCapacity({
    this.tableName,
    this.capacityUnits,
    this.readCapacityUnits,
    this.writeCapacityUnits,
    this.table,
    this.localSecondaryIndexes,
    this.globalSecondaryIndexes,
  });
  static ConsumedCapacity fromJson(Map<String, dynamic> json) =>
      ConsumedCapacity(
        tableName:
            json.containsKey('TableName') ? json['TableName'] as String : null,
        capacityUnits: json.containsKey('CapacityUnits')
            ? json['CapacityUnits'] as double
            : null,
        readCapacityUnits: json.containsKey('ReadCapacityUnits')
            ? json['ReadCapacityUnits'] as double
            : null,
        writeCapacityUnits: json.containsKey('WriteCapacityUnits')
            ? json['WriteCapacityUnits'] as double
            : null,
        table:
            json.containsKey('Table') ? Capacity.fromJson(json['Table']) : null,
        localSecondaryIndexes: json.containsKey('LocalSecondaryIndexes')
            ? (json['LocalSecondaryIndexes'] as Map)
                .map((k, v) => MapEntry(k as String, Capacity.fromJson(v)))
            : null,
        globalSecondaryIndexes: json.containsKey('GlobalSecondaryIndexes')
            ? (json['GlobalSecondaryIndexes'] as Map)
                .map((k, v) => MapEntry(k as String, Capacity.fromJson(v)))
            : null,
      );
}

/// Represents the continuous backups and point in time recovery settings on the
/// table.
class ContinuousBackupsDescription {
  ///  `ContinuousBackupsStatus` can be one of the following states: ENABLED,
  /// DISABLED
  final String continuousBackupsStatus;

  /// The description of the point in time recovery settings applied to the
  /// table.
  final PointInTimeRecoveryDescription pointInTimeRecoveryDescription;

  ContinuousBackupsDescription({
    @required this.continuousBackupsStatus,
    this.pointInTimeRecoveryDescription,
  });
  static ContinuousBackupsDescription fromJson(Map<String, dynamic> json) =>
      ContinuousBackupsDescription(
        continuousBackupsStatus: json['ContinuousBackupsStatus'] as String,
        pointInTimeRecoveryDescription:
            json.containsKey('PointInTimeRecoveryDescription')
                ? PointInTimeRecoveryDescription.fromJson(
                    json['PointInTimeRecoveryDescription'])
                : null,
      );
}

class CreateBackupOutput {
  /// Contains the details of the backup created for the table.
  final BackupDetails backupDetails;

  CreateBackupOutput({
    this.backupDetails,
  });
  static CreateBackupOutput fromJson(Map<String, dynamic> json) =>
      CreateBackupOutput(
        backupDetails: json.containsKey('BackupDetails')
            ? BackupDetails.fromJson(json['BackupDetails'])
            : null,
      );
}

/// Represents a new global secondary index to be added to an existing table.
class CreateGlobalSecondaryIndexAction {
  /// The name of the global secondary index to be created.
  final String indexName;

  /// The key schema for the global secondary index.
  final List<KeySchemaElement> keySchema;

  /// Represents attributes that are copied (projected) from the table into an
  /// index. These are in addition to the primary key attributes and index key
  /// attributes, which are automatically projected.
  final Projection projection;

  /// Represents the provisioned throughput settings for the specified global
  /// secondary index.
  ///
  /// For current minimum and maximum provisioned throughput values, see
  /// [Limits](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html)
  /// in the _Amazon DynamoDB Developer Guide_.
  final ProvisionedThroughput provisionedThroughput;

  CreateGlobalSecondaryIndexAction({
    @required this.indexName,
    @required this.keySchema,
    @required this.projection,
    this.provisionedThroughput,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class CreateGlobalTableOutput {
  /// Contains the details of the global table.
  final GlobalTableDescription globalTableDescription;

  CreateGlobalTableOutput({
    this.globalTableDescription,
  });
  static CreateGlobalTableOutput fromJson(Map<String, dynamic> json) =>
      CreateGlobalTableOutput(
        globalTableDescription: json.containsKey('GlobalTableDescription')
            ? GlobalTableDescription.fromJson(json['GlobalTableDescription'])
            : null,
      );
}

/// Represents a replica to be added.
class CreateReplicaAction {
  /// The region of the replica to be added.
  final String regionName;

  CreateReplicaAction({
    @required this.regionName,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Represents the output of a `CreateTable` operation.
class CreateTableOutput {
  /// Represents the properties of the table.
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

/// Represents a request to perform a `DeleteItem` operation.
class Delete {
  /// The primary key of the item to be deleted. Each element consists of an
  /// attribute name and a value for that attribute.
  final Map<String, AttributeValue> key;

  /// Name of the table in which the item to be deleted resides.
  final String tableName;

  /// A condition that must be satisfied in order for a conditional delete to
  /// succeed.
  final String conditionExpression;

  /// One or more substitution tokens for attribute names in an expression.
  final Map<String, String> expressionAttributeNames;

  /// One or more values that can be substituted in an expression.
  final Map<String, AttributeValue> expressionAttributeValues;

  /// Use `ReturnValuesOnConditionCheckFailure` to get the item attributes if
  /// the `Delete` condition fails. For `ReturnValuesOnConditionCheckFailure`,
  /// the valid values are: NONE and ALL_OLD.
  final String returnValuesOnConditionCheckFailure;

  Delete({
    @required this.key,
    @required this.tableName,
    this.conditionExpression,
    this.expressionAttributeNames,
    this.expressionAttributeValues,
    this.returnValuesOnConditionCheckFailure,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class DeleteBackupOutput {
  /// Contains the description of the backup created for the table.
  final BackupDescription backupDescription;

  DeleteBackupOutput({
    this.backupDescription,
  });
  static DeleteBackupOutput fromJson(Map<String, dynamic> json) =>
      DeleteBackupOutput(
        backupDescription: json.containsKey('BackupDescription')
            ? BackupDescription.fromJson(json['BackupDescription'])
            : null,
      );
}

/// Represents a global secondary index to be deleted from an existing table.
class DeleteGlobalSecondaryIndexAction {
  /// The name of the global secondary index to be deleted.
  final String indexName;

  DeleteGlobalSecondaryIndexAction({
    @required this.indexName,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Represents the output of a `DeleteItem` operation.
class DeleteItemOutput {
  /// A map of attribute names to `AttributeValue` objects, representing the
  /// item as it appeared before the `DeleteItem` operation. This map appears in
  /// the response only if `ReturnValues` was specified as `ALL_OLD` in the
  /// request.
  final Map<String, AttributeValue> attributes;

  /// The capacity units consumed by the `DeleteItem` operation. The data
  /// returned includes the total provisioned throughput consumed, along with
  /// statistics for the table and any indexes involved in the operation.
  /// `ConsumedCapacity` is only returned if the `ReturnConsumedCapacity`
  /// parameter was specified. For more information, see
  /// [Provisioned Mode](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ProvisionedThroughputIntro.html)
  /// in the _Amazon DynamoDB Developer Guide_.
  final ConsumedCapacity consumedCapacity;

  /// Information about item collections, if any, that were affected by the
  /// `DeleteItem` operation. `ItemCollectionMetrics` is only returned if the
  /// `ReturnItemCollectionMetrics` parameter was specified. If the table does
  /// not have any local secondary indexes, this information is not returned in
  /// the response.
  ///
  /// Each `ItemCollectionMetrics` element consists of:
  ///
  /// *    `ItemCollectionKey` - The partition key value of the item collection.
  /// This is the same as the partition key value of the item itself.
  ///
  /// *    `SizeEstimateRangeGB` - An estimate of item collection size, in
  /// gigabytes. This value is a two-element array containing a lower bound and
  /// an upper bound for the estimate. The estimate includes the size of all the
  /// items in the table, plus the size of all attributes projected into all of
  /// the local secondary indexes on that table. Use this estimate to measure
  /// whether a local secondary index is approaching its size limit.
  ///
  ///     The estimate is subject to change over time; therefore, do not rely on
  /// the precision or accuracy of the estimate.
  final ItemCollectionMetrics itemCollectionMetrics;

  DeleteItemOutput({
    this.attributes,
    this.consumedCapacity,
    this.itemCollectionMetrics,
  });
  static DeleteItemOutput fromJson(Map<String, dynamic> json) =>
      DeleteItemOutput(
        attributes: json.containsKey('Attributes')
            ? (json['Attributes'] as Map).map(
                (k, v) => MapEntry(k as String, AttributeValue.fromJson(v)))
            : null,
        consumedCapacity: json.containsKey('ConsumedCapacity')
            ? ConsumedCapacity.fromJson(json['ConsumedCapacity'])
            : null,
        itemCollectionMetrics: json.containsKey('ItemCollectionMetrics')
            ? ItemCollectionMetrics.fromJson(json['ItemCollectionMetrics'])
            : null,
      );
}

/// Represents a replica to be removed.
class DeleteReplicaAction {
  /// The region of the replica to be removed.
  final String regionName;

  DeleteReplicaAction({
    @required this.regionName,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Represents a request to perform a `DeleteItem` operation on an item.
class DeleteRequest {
  /// A map of attribute name to attribute values, representing the primary key
  /// of the item to delete. All of the table's primary key attributes must be
  /// specified, and their data types must match those of the table's key
  /// schema.
  final Map<String, AttributeValue> key;

  DeleteRequest({
    @required this.key,
  });
  static DeleteRequest fromJson(Map<String, dynamic> json) => DeleteRequest(
        key: (json['Key'] as Map)
            .map((k, v) => MapEntry(k as String, AttributeValue.fromJson(v))),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Represents the output of a `DeleteTable` operation.
class DeleteTableOutput {
  /// Represents the properties of a table.
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

class DescribeBackupOutput {
  /// Contains the description of the backup created for the table.
  final BackupDescription backupDescription;

  DescribeBackupOutput({
    this.backupDescription,
  });
  static DescribeBackupOutput fromJson(Map<String, dynamic> json) =>
      DescribeBackupOutput(
        backupDescription: json.containsKey('BackupDescription')
            ? BackupDescription.fromJson(json['BackupDescription'])
            : null,
      );
}

class DescribeContinuousBackupsOutput {
  /// Represents the continuous backups and point in time recovery settings on
  /// the table.
  final ContinuousBackupsDescription continuousBackupsDescription;

  DescribeContinuousBackupsOutput({
    this.continuousBackupsDescription,
  });
  static DescribeContinuousBackupsOutput fromJson(Map<String, dynamic> json) =>
      DescribeContinuousBackupsOutput(
        continuousBackupsDescription:
            json.containsKey('ContinuousBackupsDescription')
                ? ContinuousBackupsDescription.fromJson(
                    json['ContinuousBackupsDescription'])
                : null,
      );
}

class DescribeEndpointsResponse {
  /// List of endpoints.
  final List<Endpoint> endpoints;

  DescribeEndpointsResponse({
    @required this.endpoints,
  });
  static DescribeEndpointsResponse fromJson(Map<String, dynamic> json) =>
      DescribeEndpointsResponse(
        endpoints: (json['Endpoints'] as List)
            .map((e) => Endpoint.fromJson(e))
            .toList(),
      );
}

class DescribeGlobalTableOutput {
  /// Contains the details of the global table.
  final GlobalTableDescription globalTableDescription;

  DescribeGlobalTableOutput({
    this.globalTableDescription,
  });
  static DescribeGlobalTableOutput fromJson(Map<String, dynamic> json) =>
      DescribeGlobalTableOutput(
        globalTableDescription: json.containsKey('GlobalTableDescription')
            ? GlobalTableDescription.fromJson(json['GlobalTableDescription'])
            : null,
      );
}

class DescribeGlobalTableSettingsOutput {
  /// The name of the global table.
  final String globalTableName;

  /// The Region-specific settings for the global table.
  final List<ReplicaSettingsDescription> replicaSettings;

  DescribeGlobalTableSettingsOutput({
    this.globalTableName,
    this.replicaSettings,
  });
  static DescribeGlobalTableSettingsOutput fromJson(
          Map<String, dynamic> json) =>
      DescribeGlobalTableSettingsOutput(
        globalTableName: json.containsKey('GlobalTableName')
            ? json['GlobalTableName'] as String
            : null,
        replicaSettings: json.containsKey('ReplicaSettings')
            ? (json['ReplicaSettings'] as List)
                .map((e) => ReplicaSettingsDescription.fromJson(e))
                .toList()
            : null,
      );
}

/// Represents the output of a `DescribeLimits` operation.
class DescribeLimitsOutput {
  /// The maximum total read capacity units that your account allows you to
  /// provision across all of your tables in this Region.
  final BigInt accountMaxReadCapacityUnits;

  /// The maximum total write capacity units that your account allows you to
  /// provision across all of your tables in this Region.
  final BigInt accountMaxWriteCapacityUnits;

  /// The maximum read capacity units that your account allows you to provision
  /// for a new table that you are creating in this Region, including the read
  /// capacity units provisioned for its global secondary indexes (GSIs).
  final BigInt tableMaxReadCapacityUnits;

  /// The maximum write capacity units that your account allows you to provision
  /// for a new table that you are creating in this Region, including the write
  /// capacity units provisioned for its global secondary indexes (GSIs).
  final BigInt tableMaxWriteCapacityUnits;

  DescribeLimitsOutput({
    this.accountMaxReadCapacityUnits,
    this.accountMaxWriteCapacityUnits,
    this.tableMaxReadCapacityUnits,
    this.tableMaxWriteCapacityUnits,
  });
  static DescribeLimitsOutput fromJson(Map<String, dynamic> json) =>
      DescribeLimitsOutput(
        accountMaxReadCapacityUnits:
            json.containsKey('AccountMaxReadCapacityUnits')
                ? BigInt.from(json['AccountMaxReadCapacityUnits'])
                : null,
        accountMaxWriteCapacityUnits:
            json.containsKey('AccountMaxWriteCapacityUnits')
                ? BigInt.from(json['AccountMaxWriteCapacityUnits'])
                : null,
        tableMaxReadCapacityUnits: json.containsKey('TableMaxReadCapacityUnits')
            ? BigInt.from(json['TableMaxReadCapacityUnits'])
            : null,
        tableMaxWriteCapacityUnits:
            json.containsKey('TableMaxWriteCapacityUnits')
                ? BigInt.from(json['TableMaxWriteCapacityUnits'])
                : null,
      );
}

/// Represents the output of a `DescribeTable` operation.
class DescribeTableOutput {
  /// The properties of the table.
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

class DescribeTimeToLiveOutput {
  final TimeToLiveDescription timeToLiveDescription;

  DescribeTimeToLiveOutput({
    this.timeToLiveDescription,
  });
  static DescribeTimeToLiveOutput fromJson(Map<String, dynamic> json) =>
      DescribeTimeToLiveOutput(
        timeToLiveDescription: json.containsKey('TimeToLiveDescription')
            ? TimeToLiveDescription.fromJson(json['TimeToLiveDescription'])
            : null,
      );
}

/// An endpoint information details.
class Endpoint {
  /// IP address of the endpoint.
  final String address;

  /// Endpoint cache time to live (TTL) value.
  final BigInt cachePeriodInMinutes;

  Endpoint({
    @required this.address,
    @required this.cachePeriodInMinutes,
  });
  static Endpoint fromJson(Map<String, dynamic> json) => Endpoint(
        address: json['Address'] as String,
        cachePeriodInMinutes: BigInt.from(json['CachePeriodInMinutes']),
      );
}

/// Represents a condition to be compared with an attribute value. This
/// condition can be used with `DeleteItem`, `PutItem` or `UpdateItem`
/// operations; if the comparison evaluates to true, the operation succeeds; if
/// not, the operation fails. You can use `ExpectedAttributeValue` in one of two
/// different ways:
///
/// *   Use `AttributeValueList` to specify one or more values to compare
/// against an attribute. Use `ComparisonOperator` to specify how you want to
/// perform the comparison. If the comparison evaluates to true, then the
/// conditional operation succeeds.
///
/// *   Use `Value` to specify a value that DynamoDB will compare against an
/// attribute. If the values match, then `ExpectedAttributeValue` evaluates to
/// true and the conditional operation succeeds. Optionally, you can also set
/// `Exists` to false, indicating that you _do not_ expect to find the attribute
/// value in the table. In this case, the conditional operation succeeds only if
/// the comparison evaluates to false.
///
///
///  `Value` and `Exists` are incompatible with `AttributeValueList` and
/// `ComparisonOperator`. Note that if you use both sets of parameters at once,
/// DynamoDB will return a `ValidationException` exception.
class ExpectedAttributeValue {
  /// Represents the data for the expected attribute.
  ///
  /// Each attribute value is described as a name-value pair. The name is the
  /// data type, and the value is the data itself.
  ///
  /// For more information, see
  /// [Data Types](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.NamingRulesDataTypes.html#HowItWorks.DataTypes)
  /// in the _Amazon DynamoDB Developer Guide_.
  final AttributeValue value;

  /// Causes DynamoDB to evaluate the value before attempting a conditional
  /// operation:
  ///
  /// *   If `Exists` is `true`, DynamoDB will check to see if that attribute
  /// value already exists in the table. If it is found, then the operation
  /// succeeds. If it is not found, the operation fails with a
  /// `ConditionCheckFailedException`.
  ///
  /// *   If `Exists` is `false`, DynamoDB assumes that the attribute value does
  /// not exist in the table. If in fact the value does not exist, then the
  /// assumption is valid and the operation succeeds. If the value is found,
  /// despite the assumption that it does not exist, the operation fails with a
  /// `ConditionCheckFailedException`.
  ///
  ///
  /// The default setting for `Exists` is `true`. If you supply a `Value` all by
  /// itself, DynamoDB assumes the attribute exists: You don't have to set
  /// `Exists` to `true`, because it is implied.
  ///
  /// DynamoDB returns a `ValidationException` if:
  ///
  /// *    `Exists` is `true` but there is no `Value` to check. (You expect a
  /// value to exist, but don't specify what that value is.)
  ///
  /// *    `Exists` is `false` but you also provide a `Value`. (You cannot
  /// expect an attribute to have a value, while also expecting it not to
  /// exist.)
  final bool exists;

  /// A comparator for evaluating attributes in the `AttributeValueList`. For
  /// example, equals, greater than, less than, etc.
  ///
  /// The following comparison operators are available:
  ///
  ///  `EQ | NE | LE | LT | GE | GT | NOT_NULL | NULL | CONTAINS | NOT_CONTAINS
  /// | BEGINS_WITH | IN | BETWEEN`
  ///
  /// The following are descriptions of each comparison operator.
  ///
  /// *    `EQ` : Equal. `EQ` is supported for all data types, including lists
  /// and maps.
  ///
  ///      `AttributeValueList` can contain only one `AttributeValue` element of
  /// type String, Number, Binary, String Set, Number Set, or Binary Set. If an
  /// item contains an `AttributeValue` element of a different type than the one
  /// provided in the request, the value does not match. For example,
  /// `{"S":"6"}` does not equal `{"N":"6"}`. Also, `{"N":"6"}` does not equal
  /// `{"NS":["6", "2", "1"]}`.
  ///
  /// *    `NE` : Not equal. `NE` is supported for all data types, including
  /// lists and maps.
  ///
  ///      `AttributeValueList` can contain only one `AttributeValue` of type
  /// String, Number, Binary, String Set, Number Set, or Binary Set. If an item
  /// contains an `AttributeValue` of a different type than the one provided in
  /// the request, the value does not match. For example, `{"S":"6"}` does not
  /// equal `{"N":"6"}`. Also, `{"N":"6"}` does not equal
  /// `{"NS":["6", "2", "1"]}`.
  ///
  /// *    `LE` : Less than or equal.
  ///
  ///      `AttributeValueList` can contain only one `AttributeValue` element of
  /// type String, Number, or Binary (not a set type). If an item contains an
  /// `AttributeValue` element of a different type than the one provided in the
  /// request, the value does not match. For example, `{"S":"6"}` does not equal
  /// `{"N":"6"}`. Also, `{"N":"6"}` does not compare to
  /// `{"NS":["6", "2", "1"]}`.
  ///
  /// *    `LT` : Less than.
  ///
  ///      `AttributeValueList` can contain only one `AttributeValue` of type
  /// String, Number, or Binary (not a set type). If an item contains an
  /// `AttributeValue` element of a different type than the one provided in the
  /// request, the value does not match. For example, `{"S":"6"}` does not equal
  /// `{"N":"6"}`. Also, `{"N":"6"}` does not compare to
  /// `{"NS":["6", "2", "1"]}`.
  ///
  /// *    `GE` : Greater than or equal.
  ///
  ///      `AttributeValueList` can contain only one `AttributeValue` element of
  /// type String, Number, or Binary (not a set type). If an item contains an
  /// `AttributeValue` element of a different type than the one provided in the
  /// request, the value does not match. For example, `{"S":"6"}` does not equal
  /// `{"N":"6"}`. Also, `{"N":"6"}` does not compare to
  /// `{"NS":["6", "2", "1"]}`.
  ///
  /// *    `GT` : Greater than.
  ///
  ///      `AttributeValueList` can contain only one `AttributeValue` element of
  /// type String, Number, or Binary (not a set type). If an item contains an
  /// `AttributeValue` element of a different type than the one provided in the
  /// request, the value does not match. For example, `{"S":"6"}` does not equal
  /// `{"N":"6"}`. Also, `{"N":"6"}` does not compare to
  /// `{"NS":["6", "2", "1"]}`.
  ///
  /// *    `NOT_NULL` : The attribute exists. `NOT_NULL` is supported for all
  /// data types, including lists and maps.
  ///
  ///      This operator tests for the existence of an attribute, not its data
  /// type. If the data type of attribute "`a`" is null, and you evaluate it
  /// using `NOT_NULL`, the result is a Boolean `true`. This result is because
  /// the attribute "`a`" exists; its data type is not relevant to the
  /// `NOT_NULL` comparison operator.
  /// *    `NULL` : The attribute does not exist. `NULL` is supported for all
  /// data types, including lists and maps.
  ///
  ///      This operator tests for the nonexistence of an attribute, not its
  /// data type. If the data type of attribute "`a`" is null, and you evaluate
  /// it using `NULL`, the result is a Boolean `false`. This is because the
  /// attribute "`a`" exists; its data type is not relevant to the `NULL`
  /// comparison operator.
  /// *    `CONTAINS` : Checks for a subsequence, or value in a set.
  ///
  ///      `AttributeValueList` can contain only one `AttributeValue` element of
  /// type String, Number, or Binary (not a set type). If the target attribute
  /// of the comparison is of type String, then the operator checks for a
  /// substring match. If the target attribute of the comparison is of type
  /// Binary, then the operator looks for a subsequence of the target that
  /// matches the input. If the target attribute of the comparison is a set
  /// ("`SS`", "`NS`", or "`BS`"), then the operator evaluates to true if it
  /// finds an exact match with any member of the set.
  ///
  ///     CONTAINS is supported for lists: When evaluating "`a CONTAINS b`",
  /// "`a`" can be a list; however, "`b`" cannot be a set, a map, or a list.
  ///
  /// *    `NOT_CONTAINS` : Checks for absence of a subsequence, or absence of a
  /// value in a set.
  ///
  ///      `AttributeValueList` can contain only one `AttributeValue` element of
  /// type String, Number, or Binary (not a set type). If the target attribute
  /// of the comparison is a String, then the operator checks for the absence of
  /// a substring match. If the target attribute of the comparison is Binary,
  /// then the operator checks for the absence of a subsequence of the target
  /// that matches the input. If the target attribute of the comparison is a set
  /// ("`SS`", "`NS`", or "`BS`"), then the operator evaluates to true if it
  /// _does not_ find an exact match with any member of the set.
  ///
  ///     NOT_CONTAINS is supported for lists: When evaluating "`a NOT CONTAINS
  /// b`", "`a`" can be a list; however, "`b`" cannot be a set, a map, or a
  /// list.
  ///
  /// *    `BEGINS_WITH` : Checks for a prefix.
  ///
  ///      `AttributeValueList` can contain only one `AttributeValue` of type
  /// String or Binary (not a Number or a set type). The target attribute of the
  /// comparison must be of type String or Binary (not a Number or a set type).
  ///
  /// *    `IN` : Checks for matching elements in a list.
  ///
  ///      `AttributeValueList` can contain one or more `AttributeValue`
  /// elements of type String, Number, or Binary. These attributes are compared
  /// against an existing attribute of an item. If any elements of the input are
  /// equal to the item attribute, the expression evaluates to true.
  ///
  /// *    `BETWEEN` : Greater than or equal to the first value, and less than
  /// or equal to the second value.
  ///
  ///      `AttributeValueList` must contain two `AttributeValue` elements of
  /// the same type, either String, Number, or Binary (not a set type). A target
  /// attribute matches if the target value is greater than, or equal to, the
  /// first element and less than, or equal to, the second element. If an item
  /// contains an `AttributeValue` element of a different type than the one
  /// provided in the request, the value does not match. For example,
  /// `{"S":"6"}` does not compare to `{"N":"6"}`. Also, `{"N":"6"}` does not
  /// compare to `{"NS":["6", "2", "1"]}`
  final String comparisonOperator;

  /// One or more values to evaluate against the supplied attribute. The number
  /// of values in the list depends on the `ComparisonOperator` being used.
  ///
  /// For type Number, value comparisons are numeric.
  ///
  /// String value comparisons for greater than, equals, or less than are based
  /// on ASCII character code values. For example, `a` is greater than `A`, and
  /// `a` is greater than `B`. For a list of code values, see
  /// [http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters](http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters).
  ///
  /// For Binary, DynamoDB treats each byte of the binary data as unsigned when
  /// it compares binary values.
  ///
  /// For information on specifying data types in JSON, see
  /// [JSON Data Format](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DataFormat.html)
  /// in the _Amazon DynamoDB Developer Guide_.
  final List<AttributeValue> attributeValueList;

  ExpectedAttributeValue({
    this.value,
    this.exists,
    this.comparisonOperator,
    this.attributeValueList,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies an item and related attribute values to retrieve in a
/// `TransactGetItem` object.
class Get {
  /// A map of attribute names to `AttributeValue` objects that specifies the
  /// primary key of the item to retrieve.
  final Map<String, AttributeValue> key;

  /// The name of the table from which to retrieve the specified item.
  final String tableName;

  /// A string that identifies one or more attributes of the specified item to
  /// retrieve from the table. The attributes in the expression must be
  /// separated by commas. If no attribute names are specified, then all
  /// attributes of the specified item are returned. If any of the requested
  /// attributes are not found, they do not appear in the result.
  final String projectionExpression;

  /// One or more substitution tokens for attribute names in the
  /// ProjectionExpression parameter.
  final Map<String, String> expressionAttributeNames;

  Get({
    @required this.key,
    @required this.tableName,
    this.projectionExpression,
    this.expressionAttributeNames,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Represents the output of a `GetItem` operation.
class GetItemOutput {
  /// A map of attribute names to `AttributeValue` objects, as specified by
  /// `ProjectionExpression`.
  final Map<String, AttributeValue> item;

  /// The capacity units consumed by the `GetItem` operation. The data returned
  /// includes the total provisioned throughput consumed, along with statistics
  /// for the table and any indexes involved in the operation.
  /// `ConsumedCapacity` is only returned if the `ReturnConsumedCapacity`
  /// parameter was specified. For more information, see
  /// [Read/Write Capacity Mode](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ProvisionedThroughputIntro.html)
  /// in the _Amazon DynamoDB Developer Guide_.
  final ConsumedCapacity consumedCapacity;

  GetItemOutput({
    this.item,
    this.consumedCapacity,
  });
  static GetItemOutput fromJson(Map<String, dynamic> json) => GetItemOutput(
        item: json.containsKey('Item')
            ? (json['Item'] as Map).map(
                (k, v) => MapEntry(k as String, AttributeValue.fromJson(v)))
            : null,
        consumedCapacity: json.containsKey('ConsumedCapacity')
            ? ConsumedCapacity.fromJson(json['ConsumedCapacity'])
            : null,
      );
}

/// Represents the properties of a global secondary index.
class GlobalSecondaryIndex {
  /// The name of the global secondary index. The name must be unique among all
  /// other indexes on this table.
  final String indexName;

  /// The complete key schema for a global secondary index, which consists of
  /// one or more pairs of attribute names and key types:
  ///
  /// *    `HASH` - partition key
  ///
  /// *    `RANGE` - sort key
  ///
  ///
  ///
  ///
  /// The partition key of an item is also known as its _hash attribute_. The
  /// term "hash attribute" derives from DynamoDB' usage of an internal hash
  /// function to evenly distribute data items across partitions, based on their
  /// partition key values.
  ///
  /// The sort key of an item is also known as its _range attribute_. The term
  /// "range attribute" derives from the way DynamoDB stores items with the same
  /// partition key physically close together, in sorted order by the sort key
  /// value.
  final List<KeySchemaElement> keySchema;

  /// Represents attributes that are copied (projected) from the table into the
  /// global secondary index. These are in addition to the primary key
  /// attributes and index key attributes, which are automatically projected.
  final Projection projection;

  /// Represents the provisioned throughput settings for the specified global
  /// secondary index.
  ///
  /// For current minimum and maximum provisioned throughput values, see
  /// [Limits](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html)
  /// in the _Amazon DynamoDB Developer Guide_.
  final ProvisionedThroughput provisionedThroughput;

  GlobalSecondaryIndex({
    @required this.indexName,
    @required this.keySchema,
    @required this.projection,
    this.provisionedThroughput,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Represents the properties of a global secondary index.
class GlobalSecondaryIndexDescription {
  /// The name of the global secondary index.
  final String indexName;

  /// The complete key schema for a global secondary index, which consists of
  /// one or more pairs of attribute names and key types:
  ///
  /// *    `HASH` - partition key
  ///
  /// *    `RANGE` - sort key
  ///
  ///
  ///
  ///
  /// The partition key of an item is also known as its _hash attribute_. The
  /// term "hash attribute" derives from DynamoDB' usage of an internal hash
  /// function to evenly distribute data items across partitions, based on their
  /// partition key values.
  ///
  /// The sort key of an item is also known as its _range attribute_. The term
  /// "range attribute" derives from the way DynamoDB stores items with the same
  /// partition key physically close together, in sorted order by the sort key
  /// value.
  final List<KeySchemaElement> keySchema;

  /// Represents attributes that are copied (projected) from the table into the
  /// global secondary index. These are in addition to the primary key
  /// attributes and index key attributes, which are automatically projected.
  final Projection projection;

  /// The current state of the global secondary index:
  ///
  /// *    `CREATING` - The index is being created.
  ///
  /// *    `UPDATING` - The index is being updated.
  ///
  /// *    `DELETING` - The index is being deleted.
  ///
  /// *    `ACTIVE` - The index is ready for use.
  final String indexStatus;

  /// Indicates whether the index is currently backfilling. _Backfilling_ is the
  /// process of reading items from the table and determining whether they can
  /// be added to the index. (Not all items will qualify: For example, a
  /// partition key cannot have any duplicate values.) If an item can be added
  /// to the index, DynamoDB will do so. After all items have been processed,
  /// the backfilling operation is complete and `Backfilling` is false.
  ///
  ///
  ///
  /// For indexes that were created during a `CreateTable` operation, the
  /// `Backfilling` attribute does not appear in the `DescribeTable` output.
  final bool backfilling;

  /// Represents the provisioned throughput settings for the specified global
  /// secondary index.
  ///
  /// For current minimum and maximum provisioned throughput values, see
  /// [Limits](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html)
  /// in the _Amazon DynamoDB Developer Guide_.
  final ProvisionedThroughputDescription provisionedThroughput;

  /// The total size of the specified index, in bytes. DynamoDB updates this
  /// value approximately every six hours. Recent changes might not be reflected
  /// in this value.
  final BigInt indexSizeBytes;

  /// The number of items in the specified index. DynamoDB updates this value
  /// approximately every six hours. Recent changes might not be reflected in
  /// this value.
  final BigInt itemCount;

  /// The Amazon Resource Name (ARN) that uniquely identifies the index.
  final String indexArn;

  GlobalSecondaryIndexDescription({
    this.indexName,
    this.keySchema,
    this.projection,
    this.indexStatus,
    this.backfilling,
    this.provisionedThroughput,
    this.indexSizeBytes,
    this.itemCount,
    this.indexArn,
  });
  static GlobalSecondaryIndexDescription fromJson(Map<String, dynamic> json) =>
      GlobalSecondaryIndexDescription(
        indexName:
            json.containsKey('IndexName') ? json['IndexName'] as String : null,
        keySchema: json.containsKey('KeySchema')
            ? (json['KeySchema'] as List)
                .map((e) => KeySchemaElement.fromJson(e))
                .toList()
            : null,
        projection: json.containsKey('Projection')
            ? Projection.fromJson(json['Projection'])
            : null,
        indexStatus: json.containsKey('IndexStatus')
            ? json['IndexStatus'] as String
            : null,
        backfilling: json.containsKey('Backfilling')
            ? json['Backfilling'] as bool
            : null,
        provisionedThroughput: json.containsKey('ProvisionedThroughput')
            ? ProvisionedThroughputDescription.fromJson(
                json['ProvisionedThroughput'])
            : null,
        indexSizeBytes: json.containsKey('IndexSizeBytes')
            ? BigInt.from(json['IndexSizeBytes'])
            : null,
        itemCount: json.containsKey('ItemCount')
            ? BigInt.from(json['ItemCount'])
            : null,
        indexArn:
            json.containsKey('IndexArn') ? json['IndexArn'] as String : null,
      );
}

/// Represents the properties of a global secondary index for the table when the
/// backup was created.
class GlobalSecondaryIndexInfo {
  /// The name of the global secondary index.
  final String indexName;

  /// The complete key schema for a global secondary index, which consists of
  /// one or more pairs of attribute names and key types:
  ///
  /// *    `HASH` - partition key
  ///
  /// *    `RANGE` - sort key
  ///
  ///
  ///
  ///
  /// The partition key of an item is also known as its _hash attribute_. The
  /// term "hash attribute" derives from DynamoDB' usage of an internal hash
  /// function to evenly distribute data items across partitions, based on their
  /// partition key values.
  ///
  /// The sort key of an item is also known as its _range attribute_. The term
  /// "range attribute" derives from the way DynamoDB stores items with the same
  /// partition key physically close together, in sorted order by the sort key
  /// value.
  final List<KeySchemaElement> keySchema;

  /// Represents attributes that are copied (projected) from the table into the
  /// global secondary index. These are in addition to the primary key
  /// attributes and index key attributes, which are automatically projected.
  final Projection projection;

  /// Represents the provisioned throughput settings for the specified global
  /// secondary index.
  final ProvisionedThroughput provisionedThroughput;

  GlobalSecondaryIndexInfo({
    this.indexName,
    this.keySchema,
    this.projection,
    this.provisionedThroughput,
  });
  static GlobalSecondaryIndexInfo fromJson(Map<String, dynamic> json) =>
      GlobalSecondaryIndexInfo(
        indexName:
            json.containsKey('IndexName') ? json['IndexName'] as String : null,
        keySchema: json.containsKey('KeySchema')
            ? (json['KeySchema'] as List)
                .map((e) => KeySchemaElement.fromJson(e))
                .toList()
            : null,
        projection: json.containsKey('Projection')
            ? Projection.fromJson(json['Projection'])
            : null,
        provisionedThroughput: json.containsKey('ProvisionedThroughput')
            ? ProvisionedThroughput.fromJson(json['ProvisionedThroughput'])
            : null,
      );
}

/// Represents one of the following:
///
/// *   A new global secondary index to be added to an existing table.
///
/// *   New provisioned throughput parameters for an existing global secondary
/// index.
///
/// *   An existing global secondary index to be removed from an existing table.
class GlobalSecondaryIndexUpdate {
  /// The name of an existing global secondary index, along with new provisioned
  /// throughput settings to be applied to that index.
  final UpdateGlobalSecondaryIndexAction update;

  /// The parameters required for creating a global secondary index on an
  /// existing table:
  ///
  /// *    `IndexName`
  ///
  /// *    `KeySchema`
  ///
  /// *    `AttributeDefinitions`
  ///
  /// *    `Projection`
  ///
  /// *    `ProvisionedThroughput`
  final CreateGlobalSecondaryIndexAction create;

  /// The name of an existing global secondary index to be removed.
  final DeleteGlobalSecondaryIndexAction delete;

  GlobalSecondaryIndexUpdate({
    this.update,
    this.create,
    this.delete,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Represents the properties of a global table.
class GlobalTable {
  /// The global table name.
  final String globalTableName;

  /// The regions where the global table has replicas.
  final List<Replica> replicationGroup;

  GlobalTable({
    this.globalTableName,
    this.replicationGroup,
  });
  static GlobalTable fromJson(Map<String, dynamic> json) => GlobalTable(
        globalTableName: json.containsKey('GlobalTableName')
            ? json['GlobalTableName'] as String
            : null,
        replicationGroup: json.containsKey('ReplicationGroup')
            ? (json['ReplicationGroup'] as List)
                .map((e) => Replica.fromJson(e))
                .toList()
            : null,
      );
}

/// Contains details about the global table.
class GlobalTableDescription {
  /// The regions where the global table has replicas.
  final List<ReplicaDescription> replicationGroup;

  /// The unique identifier of the global table.
  final String globalTableArn;

  /// The creation time of the global table.
  final DateTime creationDateTime;

  /// The current state of the global table:
  ///
  /// *    `CREATING` - The global table is being created.
  ///
  /// *    `UPDATING` - The global table is being updated.
  ///
  /// *    `DELETING` - The global table is being deleted.
  ///
  /// *    `ACTIVE` - The global table is ready for use.
  final String globalTableStatus;

  /// The global table name.
  final String globalTableName;

  GlobalTableDescription({
    this.replicationGroup,
    this.globalTableArn,
    this.creationDateTime,
    this.globalTableStatus,
    this.globalTableName,
  });
  static GlobalTableDescription fromJson(Map<String, dynamic> json) =>
      GlobalTableDescription(
        replicationGroup: json.containsKey('ReplicationGroup')
            ? (json['ReplicationGroup'] as List)
                .map((e) => ReplicaDescription.fromJson(e))
                .toList()
            : null,
        globalTableArn: json.containsKey('GlobalTableArn')
            ? json['GlobalTableArn'] as String
            : null,
        creationDateTime: json.containsKey('CreationDateTime')
            ? DateTime.parse(json['CreationDateTime'])
            : null,
        globalTableStatus: json.containsKey('GlobalTableStatus')
            ? json['GlobalTableStatus'] as String
            : null,
        globalTableName: json.containsKey('GlobalTableName')
            ? json['GlobalTableName'] as String
            : null,
      );
}

/// Represents the settings of a global secondary index for a global table that
/// will be modified.
class GlobalTableGlobalSecondaryIndexSettingsUpdate {
  /// The name of the global secondary index. The name must be unique among all
  /// other indexes on this table.
  final String indexName;

  /// The maximum number of writes consumed per second before DynamoDB returns a
  /// `ThrottlingException.`
  final BigInt provisionedWriteCapacityUnits;

  /// AutoScaling settings for managing a global secondary index's write
  /// capacity units.
  final AutoScalingSettingsUpdate
      provisionedWriteCapacityAutoScalingSettingsUpdate;

  GlobalTableGlobalSecondaryIndexSettingsUpdate({
    @required this.indexName,
    this.provisionedWriteCapacityUnits,
    this.provisionedWriteCapacityAutoScalingSettingsUpdate,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Information about item collections, if any, that were affected by the
/// operation. `ItemCollectionMetrics` is only returned if the request asked for
/// it. If the table does not have any local secondary indexes, this information
/// is not returned in the response.
class ItemCollectionMetrics {
  /// The partition key value of the item collection. This value is the same as
  /// the partition key value of the item.
  final Map<String, AttributeValue> itemCollectionKey;

  /// An estimate of item collection size, in gigabytes. This value is a
  /// two-element array containing a lower bound and an upper bound for the
  /// estimate. The estimate includes the size of all the items in the table,
  /// plus the size of all attributes projected into all of the local secondary
  /// indexes on that table. Use this estimate to measure whether a local
  /// secondary index is approaching its size limit.
  ///
  /// The estimate is subject to change over time; therefore, do not rely on the
  /// precision or accuracy of the estimate.
  final List<double> sizeEstimateRangeGB;

  ItemCollectionMetrics({
    this.itemCollectionKey,
    this.sizeEstimateRangeGB,
  });
  static ItemCollectionMetrics fromJson(Map<String, dynamic> json) =>
      ItemCollectionMetrics(
        itemCollectionKey: json.containsKey('ItemCollectionKey')
            ? (json['ItemCollectionKey'] as Map).map(
                (k, v) => MapEntry(k as String, AttributeValue.fromJson(v)))
            : null,
        sizeEstimateRangeGB: json.containsKey('SizeEstimateRangeGB')
            ? (json['SizeEstimateRangeGB'] as List)
                .map((e) => e as double)
                .toList()
            : null,
      );
}

/// Details for the requested item.
class ItemResponse {
  /// Map of attribute data consisting of the data type and attribute value.
  final Map<String, AttributeValue> item;

  ItemResponse({
    this.item,
  });
  static ItemResponse fromJson(Map<String, dynamic> json) => ItemResponse(
        item: json.containsKey('Item')
            ? (json['Item'] as Map).map(
                (k, v) => MapEntry(k as String, AttributeValue.fromJson(v)))
            : null,
      );
}

/// Represents _a single element_ of a key schema. A key schema specifies the
/// attributes that make up the primary key of a table, or the key attributes of
/// an index.
///
/// A `KeySchemaElement` represents exactly one attribute of the primary key.
/// For example, a simple primary key would be represented by one
/// `KeySchemaElement` (for the partition key). A composite primary key would
/// require one `KeySchemaElement` for the partition key, and another
/// `KeySchemaElement` for the sort key.
///
/// A `KeySchemaElement` must be a scalar, top-level attribute (not a nested
/// attribute). The data type must be one of String, Number, or Binary. The
/// attribute cannot be nested within a List or a Map.
class KeySchemaElement {
  /// The name of a key attribute.
  final String attributeName;

  /// The role that this key attribute will assume:
  ///
  /// *    `HASH` - partition key
  ///
  /// *    `RANGE` - sort key
  ///
  ///
  ///
  ///
  /// The partition key of an item is also known as its _hash attribute_. The
  /// term "hash attribute" derives from DynamoDB' usage of an internal hash
  /// function to evenly distribute data items across partitions, based on their
  /// partition key values.
  ///
  /// The sort key of an item is also known as its _range attribute_. The term
  /// "range attribute" derives from the way DynamoDB stores items with the same
  /// partition key physically close together, in sorted order by the sort key
  /// value.
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
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Represents a set of primary keys and, for each key, the attributes to
/// retrieve from the table.
///
/// For each primary key, you must provide _all_ of the key attributes. For
/// example, with a simple primary key, you only need to provide the partition
/// key. For a composite primary key, you must provide _both_ the partition key
/// and the sort key.
class KeysAndAttributes {
  /// The primary key attribute values that define the items and the attributes
  /// associated with the items.
  final List<Map<String, AttributeValue>> keys;

  /// This is a legacy parameter. Use `ProjectionExpression` instead. For more
  /// information, see
  /// [Legacy Conditional Parameters](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.html)
  /// in the _Amazon DynamoDB Developer Guide_.
  final List<String> attributesToGet;

  /// The consistency of a read operation. If set to `true`, then a strongly
  /// consistent read is used; otherwise, an eventually consistent read is used.
  final bool consistentRead;

  /// A string that identifies one or more attributes to retrieve from the
  /// table. These attributes can include scalars, sets, or elements of a JSON
  /// document. The attributes in the `ProjectionExpression` must be separated
  /// by commas.
  ///
  /// If no attribute names are specified, then all attributes will be returned.
  /// If any of the requested attributes are not found, they will not appear in
  /// the result.
  ///
  /// For more information, see
  /// [Accessing Item Attributes](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html)
  /// in the _Amazon DynamoDB Developer Guide_.
  final String projectionExpression;

  /// One or more substitution tokens for attribute names in an expression. The
  /// following are some use cases for using `ExpressionAttributeNames`:
  ///
  /// *   To access an attribute whose name conflicts with a DynamoDB reserved
  /// word.
  ///
  /// *   To create a placeholder for repeating occurrences of an attribute name
  /// in an expression.
  ///
  /// *   To prevent special characters in an attribute name from being
  /// misinterpreted in an expression.
  ///
  ///
  /// Use the **#** character in an expression to dereference an attribute name.
  /// For example, consider the following attribute name:
  ///
  /// *    `Percentile`
  ///
  ///
  /// The name of this attribute conflicts with a reserved word, so it cannot be
  /// used directly in an expression. (For the complete list of reserved words,
  /// see
  /// [Reserved Words](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html)
  /// in the _Amazon DynamoDB Developer Guide_). To work around this, you could
  /// specify the following for `ExpressionAttributeNames`:
  ///
  /// *    `{"#P":"Percentile"}`
  ///
  ///
  /// You could then use this substitution in an expression, as in this example:
  ///
  /// *    `#P = :val`
  ///
  ///
  ///  Tokens that begin with the **:** character are _expression attribute
  /// values_, which are placeholders for the actual value at runtime.
  ///
  /// For more information on expression attribute names, see
  /// [Accessing Item Attributes](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html)
  /// in the _Amazon DynamoDB Developer Guide_.
  final Map<String, String> expressionAttributeNames;

  KeysAndAttributes({
    @required this.keys,
    this.attributesToGet,
    this.consistentRead,
    this.projectionExpression,
    this.expressionAttributeNames,
  });
  static KeysAndAttributes fromJson(Map<String, dynamic> json) =>
      KeysAndAttributes(
        keys: (json['Keys'] as List)
            .map((e) => (e as Map).map(
                (k, v) => MapEntry(k as String, AttributeValue.fromJson(v))))
            .toList(),
        attributesToGet: json.containsKey('AttributesToGet')
            ? (json['AttributesToGet'] as List).map((e) => e as String).toList()
            : null,
        consistentRead: json.containsKey('ConsistentRead')
            ? json['ConsistentRead'] as bool
            : null,
        projectionExpression: json.containsKey('ProjectionExpression')
            ? json['ProjectionExpression'] as String
            : null,
        expressionAttributeNames: json.containsKey('ExpressionAttributeNames')
            ? (json['ExpressionAttributeNames'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class ListBackupsOutput {
  /// List of `BackupSummary` objects.
  final List<BackupSummary> backupSummaries;

  ///  The ARN of the backup last evaluated when the current page of results was
  /// returned, inclusive of the current page of results. This value may be
  /// specified as the `ExclusiveStartBackupArn` of a new `ListBackups`
  /// operation in order to fetch the next page of results.
  ///
  ///  If `LastEvaluatedBackupArn` is empty, then the last page of results has
  /// been processed and there are no more results to be retrieved.
  ///
  ///  If `LastEvaluatedBackupArn` is not empty, this may or may not indicate
  /// that there is more data to be returned. All results are guaranteed to have
  /// been returned if and only if no value for `LastEvaluatedBackupArn` is
  /// returned.
  final String lastEvaluatedBackupArn;

  ListBackupsOutput({
    this.backupSummaries,
    this.lastEvaluatedBackupArn,
  });
  static ListBackupsOutput fromJson(Map<String, dynamic> json) =>
      ListBackupsOutput(
        backupSummaries: json.containsKey('BackupSummaries')
            ? (json['BackupSummaries'] as List)
                .map((e) => BackupSummary.fromJson(e))
                .toList()
            : null,
        lastEvaluatedBackupArn: json.containsKey('LastEvaluatedBackupArn')
            ? json['LastEvaluatedBackupArn'] as String
            : null,
      );
}

class ListGlobalTablesOutput {
  /// List of global table names.
  final List<GlobalTable> globalTables;

  /// Last evaluated global table name.
  final String lastEvaluatedGlobalTableName;

  ListGlobalTablesOutput({
    this.globalTables,
    this.lastEvaluatedGlobalTableName,
  });
  static ListGlobalTablesOutput fromJson(Map<String, dynamic> json) =>
      ListGlobalTablesOutput(
        globalTables: json.containsKey('GlobalTables')
            ? (json['GlobalTables'] as List)
                .map((e) => GlobalTable.fromJson(e))
                .toList()
            : null,
        lastEvaluatedGlobalTableName:
            json.containsKey('LastEvaluatedGlobalTableName')
                ? json['LastEvaluatedGlobalTableName'] as String
                : null,
      );
}

/// Represents the output of a `ListTables` operation.
class ListTablesOutput {
  /// The names of the tables associated with the current account at the current
  /// endpoint. The maximum size of this array is 100.
  ///
  /// If `LastEvaluatedTableName` also appears in the output, you can use this
  /// value as the `ExclusiveStartTableName` parameter in a subsequent
  /// `ListTables` request and obtain the next page of results.
  final List<String> tableNames;

  /// The name of the last table in the current page of results. Use this value
  /// as the `ExclusiveStartTableName` in a new request to obtain the next page
  /// of results, until all the table names are returned.
  ///
  /// If you do not receive a `LastEvaluatedTableName` value in the response,
  /// this means that there are no more table names to be retrieved.
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

class ListTagsOfResourceOutput {
  /// The tags currently associated with the Amazon DynamoDB resource.
  final List<Tag> tags;

  /// If this value is returned, there are additional results to be displayed.
  /// To retrieve them, call ListTagsOfResource again, with NextToken set to
  /// this value.
  final String nextToken;

  ListTagsOfResourceOutput({
    this.tags,
    this.nextToken,
  });
  static ListTagsOfResourceOutput fromJson(Map<String, dynamic> json) =>
      ListTagsOfResourceOutput(
        tags: json.containsKey('Tags')
            ? (json['Tags'] as List).map((e) => Tag.fromJson(e)).toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// Represents the properties of a local secondary index.
class LocalSecondaryIndex {
  /// The name of the local secondary index. The name must be unique among all
  /// other indexes on this table.
  final String indexName;

  /// The complete key schema for the local secondary index, consisting of one
  /// or more pairs of attribute names and key types:
  ///
  /// *    `HASH` - partition key
  ///
  /// *    `RANGE` - sort key
  ///
  ///
  ///
  ///
  /// The partition key of an item is also known as its _hash attribute_. The
  /// term "hash attribute" derives from DynamoDB' usage of an internal hash
  /// function to evenly distribute data items across partitions, based on their
  /// partition key values.
  ///
  /// The sort key of an item is also known as its _range attribute_. The term
  /// "range attribute" derives from the way DynamoDB stores items with the same
  /// partition key physically close together, in sorted order by the sort key
  /// value.
  final List<KeySchemaElement> keySchema;

  /// Represents attributes that are copied (projected) from the table into the
  /// local secondary index. These are in addition to the primary key attributes
  /// and index key attributes, which are automatically projected.
  final Projection projection;

  LocalSecondaryIndex({
    @required this.indexName,
    @required this.keySchema,
    @required this.projection,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Represents the properties of a local secondary index.
class LocalSecondaryIndexDescription {
  /// Represents the name of the local secondary index.
  final String indexName;

  /// The complete key schema for the local secondary index, consisting of one
  /// or more pairs of attribute names and key types:
  ///
  /// *    `HASH` - partition key
  ///
  /// *    `RANGE` - sort key
  ///
  ///
  ///
  ///
  /// The partition key of an item is also known as its _hash attribute_. The
  /// term "hash attribute" derives from DynamoDB' usage of an internal hash
  /// function to evenly distribute data items across partitions, based on their
  /// partition key values.
  ///
  /// The sort key of an item is also known as its _range attribute_. The term
  /// "range attribute" derives from the way DynamoDB stores items with the same
  /// partition key physically close together, in sorted order by the sort key
  /// value.
  final List<KeySchemaElement> keySchema;

  /// Represents attributes that are copied (projected) from the table into the
  /// global secondary index. These are in addition to the primary key
  /// attributes and index key attributes, which are automatically projected.
  final Projection projection;

  /// The total size of the specified index, in bytes. DynamoDB updates this
  /// value approximately every six hours. Recent changes might not be reflected
  /// in this value.
  final BigInt indexSizeBytes;

  /// The number of items in the specified index. DynamoDB updates this value
  /// approximately every six hours. Recent changes might not be reflected in
  /// this value.
  final BigInt itemCount;

  /// The Amazon Resource Name (ARN) that uniquely identifies the index.
  final String indexArn;

  LocalSecondaryIndexDescription({
    this.indexName,
    this.keySchema,
    this.projection,
    this.indexSizeBytes,
    this.itemCount,
    this.indexArn,
  });
  static LocalSecondaryIndexDescription fromJson(Map<String, dynamic> json) =>
      LocalSecondaryIndexDescription(
        indexName:
            json.containsKey('IndexName') ? json['IndexName'] as String : null,
        keySchema: json.containsKey('KeySchema')
            ? (json['KeySchema'] as List)
                .map((e) => KeySchemaElement.fromJson(e))
                .toList()
            : null,
        projection: json.containsKey('Projection')
            ? Projection.fromJson(json['Projection'])
            : null,
        indexSizeBytes: json.containsKey('IndexSizeBytes')
            ? BigInt.from(json['IndexSizeBytes'])
            : null,
        itemCount: json.containsKey('ItemCount')
            ? BigInt.from(json['ItemCount'])
            : null,
        indexArn:
            json.containsKey('IndexArn') ? json['IndexArn'] as String : null,
      );
}

/// Represents the properties of a local secondary index for the table when the
/// backup was created.
class LocalSecondaryIndexInfo {
  /// Represents the name of the local secondary index.
  final String indexName;

  /// The complete key schema for a local secondary index, which consists of one
  /// or more pairs of attribute names and key types:
  ///
  /// *    `HASH` - partition key
  ///
  /// *    `RANGE` - sort key
  ///
  ///
  ///
  ///
  /// The partition key of an item is also known as its _hash attribute_. The
  /// term "hash attribute" derives from DynamoDB' usage of an internal hash
  /// function to evenly distribute data items across partitions, based on their
  /// partition key values.
  ///
  /// The sort key of an item is also known as its _range attribute_. The term
  /// "range attribute" derives from the way DynamoDB stores items with the same
  /// partition key physically close together, in sorted order by the sort key
  /// value.
  final List<KeySchemaElement> keySchema;

  /// Represents attributes that are copied (projected) from the table into the
  /// global secondary index. These are in addition to the primary key
  /// attributes and index key attributes, which are automatically projected.
  final Projection projection;

  LocalSecondaryIndexInfo({
    this.indexName,
    this.keySchema,
    this.projection,
  });
  static LocalSecondaryIndexInfo fromJson(Map<String, dynamic> json) =>
      LocalSecondaryIndexInfo(
        indexName:
            json.containsKey('IndexName') ? json['IndexName'] as String : null,
        keySchema: json.containsKey('KeySchema')
            ? (json['KeySchema'] as List)
                .map((e) => KeySchemaElement.fromJson(e))
                .toList()
            : null,
        projection: json.containsKey('Projection')
            ? Projection.fromJson(json['Projection'])
            : null,
      );
}

/// The description of the point in time settings applied to the table.
class PointInTimeRecoveryDescription {
  /// The current state of point in time recovery:
  ///
  /// *    `ENABLING` - Point in time recovery is being enabled.
  ///
  /// *    `ENABLED` - Point in time recovery is enabled.
  ///
  /// *    `DISABLED` - Point in time recovery is disabled.
  final String pointInTimeRecoveryStatus;

  /// Specifies the earliest point in time you can restore your table to. It You
  /// can restore your table to any point in time during the last 35 days.
  final DateTime earliestRestorableDateTime;

  ///  `LatestRestorableDateTime` is typically 5 minutes before the current
  /// time.
  final DateTime latestRestorableDateTime;

  PointInTimeRecoveryDescription({
    this.pointInTimeRecoveryStatus,
    this.earliestRestorableDateTime,
    this.latestRestorableDateTime,
  });
  static PointInTimeRecoveryDescription fromJson(Map<String, dynamic> json) =>
      PointInTimeRecoveryDescription(
        pointInTimeRecoveryStatus: json.containsKey('PointInTimeRecoveryStatus')
            ? json['PointInTimeRecoveryStatus'] as String
            : null,
        earliestRestorableDateTime:
            json.containsKey('EarliestRestorableDateTime')
                ? DateTime.parse(json['EarliestRestorableDateTime'])
                : null,
        latestRestorableDateTime: json.containsKey('LatestRestorableDateTime')
            ? DateTime.parse(json['LatestRestorableDateTime'])
            : null,
      );
}

/// Represents the settings used to enable point in time recovery.
class PointInTimeRecoverySpecification {
  /// Indicates whether point in time recovery is enabled (true) or disabled
  /// (false) on the table.
  final bool pointInTimeRecoveryEnabled;

  PointInTimeRecoverySpecification({
    @required this.pointInTimeRecoveryEnabled,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Represents attributes that are copied (projected) from the table into an
/// index. These are in addition to the primary key attributes and index key
/// attributes, which are automatically projected.
class Projection {
  /// The set of attributes that are projected into the index:
  ///
  /// *    `KEYS_ONLY` - Only the index and primary keys are projected into the
  /// index.
  ///
  /// *    `INCLUDE` - Only the specified table attributes are projected into
  /// the index. The list of projected attributes are in `NonKeyAttributes`.
  ///
  /// *    `ALL` - All of the table attributes are projected into the index.
  final String projectionType;

  /// Represents the non-key attribute names which will be projected into the
  /// index.
  ///
  /// For local secondary indexes, the total count of `NonKeyAttributes` summed
  /// across all of the local secondary indexes, must not exceed 20. If you
  /// project the same attribute into two different indexes, this counts as two
  /// distinct attributes when determining the total.
  final List<String> nonKeyAttributes;

  Projection({
    this.projectionType,
    this.nonKeyAttributes,
  });
  static Projection fromJson(Map<String, dynamic> json) => Projection(
        projectionType: json.containsKey('ProjectionType')
            ? json['ProjectionType'] as String
            : null,
        nonKeyAttributes: json.containsKey('NonKeyAttributes')
            ? (json['NonKeyAttributes'] as List)
                .map((e) => e as String)
                .toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Represents the provisioned throughput settings for a specified table or
/// index. The settings can be modified using the `UpdateTable` operation.
///
/// For current minimum and maximum provisioned throughput values, see
/// [Limits](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html)
/// in the _Amazon DynamoDB Developer Guide_.
class ProvisionedThroughput {
  /// The maximum number of strongly consistent reads consumed per second before
  /// DynamoDB returns a `ThrottlingException`. For more information, see
  /// [Specifying Read and Write Requirements](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/WorkingWithTables.html#ProvisionedThroughput)
  /// in the _Amazon DynamoDB Developer Guide_.
  ///
  /// If read/write capacity mode is `PAY_PER_REQUEST` the value is set to 0.
  final BigInt readCapacityUnits;

  /// The maximum number of writes consumed per second before DynamoDB returns a
  /// `ThrottlingException`. For more information, see
  /// [Specifying Read and Write Requirements](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/WorkingWithTables.html#ProvisionedThroughput)
  /// in the _Amazon DynamoDB Developer Guide_.
  ///
  /// If read/write capacity mode is `PAY_PER_REQUEST` the value is set to 0.
  final BigInt writeCapacityUnits;

  ProvisionedThroughput({
    @required this.readCapacityUnits,
    @required this.writeCapacityUnits,
  });
  static ProvisionedThroughput fromJson(Map<String, dynamic> json) =>
      ProvisionedThroughput(
        readCapacityUnits: BigInt.from(json['ReadCapacityUnits']),
        writeCapacityUnits: BigInt.from(json['WriteCapacityUnits']),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Represents the provisioned throughput settings for the table, consisting of
/// read and write capacity units, along with data about increases and
/// decreases.
class ProvisionedThroughputDescription {
  /// The date and time of the last provisioned throughput increase for this
  /// table.
  final DateTime lastIncreaseDateTime;

  /// The date and time of the last provisioned throughput decrease for this
  /// table.
  final DateTime lastDecreaseDateTime;

  /// The number of provisioned throughput decreases for this table during this
  /// UTC calendar day. For current maximums on provisioned throughput
  /// decreases, see
  /// [Limits](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html)
  /// in the _Amazon DynamoDB Developer Guide_.
  final BigInt numberOfDecreasesToday;

  /// The maximum number of strongly consistent reads consumed per second before
  /// DynamoDB returns a `ThrottlingException`. Eventually consistent reads
  /// require less effort than strongly consistent reads, so a setting of 50
  /// `ReadCapacityUnits` per second provides 100 eventually consistent
  /// `ReadCapacityUnits` per second.
  final BigInt readCapacityUnits;

  /// The maximum number of writes consumed per second before DynamoDB returns a
  /// `ThrottlingException`.
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

/// Represents a request to perform a `PutItem` operation.
class Put {
  /// A map of attribute name to attribute values, representing the primary key
  /// of the item to be written by `PutItem`. All of the table's primary key
  /// attributes must be specified, and their data types must match those of the
  /// table's key schema. If any attributes are present in the item that are
  /// part of an index key schema for the table, their types must match the
  /// index key schema.
  final Map<String, AttributeValue> item;

  /// Name of the table in which to write the item.
  final String tableName;

  /// A condition that must be satisfied in order for a conditional update to
  /// succeed.
  final String conditionExpression;

  /// One or more substitution tokens for attribute names in an expression.
  final Map<String, String> expressionAttributeNames;

  /// One or more values that can be substituted in an expression.
  final Map<String, AttributeValue> expressionAttributeValues;

  /// Use `ReturnValuesOnConditionCheckFailure` to get the item attributes if
  /// the `Put` condition fails. For `ReturnValuesOnConditionCheckFailure`, the
  /// valid values are: NONE and ALL_OLD.
  final String returnValuesOnConditionCheckFailure;

  Put({
    @required this.item,
    @required this.tableName,
    this.conditionExpression,
    this.expressionAttributeNames,
    this.expressionAttributeValues,
    this.returnValuesOnConditionCheckFailure,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Represents the output of a `PutItem` operation.
class PutItemOutput {
  /// The attribute values as they appeared before the `PutItem` operation, but
  /// only if `ReturnValues` is specified as `ALL_OLD` in the request. Each
  /// element consists of an attribute name and an attribute value.
  final Map<String, AttributeValue> attributes;

  /// The capacity units consumed by the `PutItem` operation. The data returned
  /// includes the total provisioned throughput consumed, along with statistics
  /// for the table and any indexes involved in the operation.
  /// `ConsumedCapacity` is only returned if the `ReturnConsumedCapacity`
  /// parameter was specified. For more information, see
  /// [Read/Write Capacity Mode](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ProvisionedThroughputIntro.html)
  /// in the _Amazon DynamoDB Developer Guide_.
  final ConsumedCapacity consumedCapacity;

  /// Information about item collections, if any, that were affected by the
  /// `PutItem` operation. `ItemCollectionMetrics` is only returned if the
  /// `ReturnItemCollectionMetrics` parameter was specified. If the table does
  /// not have any local secondary indexes, this information is not returned in
  /// the response.
  ///
  /// Each `ItemCollectionMetrics` element consists of:
  ///
  /// *    `ItemCollectionKey` - The partition key value of the item collection.
  /// This is the same as the partition key value of the item itself.
  ///
  /// *    `SizeEstimateRangeGB` - An estimate of item collection size, in
  /// gigabytes. This value is a two-element array containing a lower bound and
  /// an upper bound for the estimate. The estimate includes the size of all the
  /// items in the table, plus the size of all attributes projected into all of
  /// the local secondary indexes on that table. Use this estimate to measure
  /// whether a local secondary index is approaching its size limit.
  ///
  ///     The estimate is subject to change over time; therefore, do not rely on
  /// the precision or accuracy of the estimate.
  final ItemCollectionMetrics itemCollectionMetrics;

  PutItemOutput({
    this.attributes,
    this.consumedCapacity,
    this.itemCollectionMetrics,
  });
  static PutItemOutput fromJson(Map<String, dynamic> json) => PutItemOutput(
        attributes: json.containsKey('Attributes')
            ? (json['Attributes'] as Map).map(
                (k, v) => MapEntry(k as String, AttributeValue.fromJson(v)))
            : null,
        consumedCapacity: json.containsKey('ConsumedCapacity')
            ? ConsumedCapacity.fromJson(json['ConsumedCapacity'])
            : null,
        itemCollectionMetrics: json.containsKey('ItemCollectionMetrics')
            ? ItemCollectionMetrics.fromJson(json['ItemCollectionMetrics'])
            : null,
      );
}

/// Represents a request to perform a `PutItem` operation on an item.
class PutRequest {
  /// A map of attribute name to attribute values, representing the primary key
  /// of an item to be processed by `PutItem`. All of the table's primary key
  /// attributes must be specified, and their data types must match those of the
  /// table's key schema. If any attributes are present in the item which are
  /// part of an index key schema for the table, their types must match the
  /// index key schema.
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

/// Represents the output of a `Query` operation.
class QueryOutput {
  /// An array of item attributes that match the query criteria. Each element in
  /// this array consists of an attribute name and the value for that attribute.
  final List<Map<String, AttributeValue>> items;

  /// The number of items in the response.
  ///
  /// If you used a `QueryFilter` in the request, then `Count` is the number of
  /// items returned after the filter was applied, and `ScannedCount` is the
  /// number of matching items before the filter was applied.
  ///
  /// If you did not use a filter in the request, then `Count` and
  /// `ScannedCount` are the same.
  final int count;

  /// The number of items evaluated, before any `QueryFilter` is applied. A high
  /// `ScannedCount` value with few, or no, `Count` results indicates an
  /// inefficient `Query` operation. For more information, see
  /// [Count and ScannedCount](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/QueryAndScan.html#Count)
  /// in the _Amazon DynamoDB Developer Guide_.
  ///
  /// If you did not use a filter in the request, then `ScannedCount` is the
  /// same as `Count`.
  final int scannedCount;

  /// The primary key of the item where the operation stopped, inclusive of the
  /// previous result set. Use this value to start a new operation, excluding
  /// this value in the new request.
  ///
  /// If `LastEvaluatedKey` is empty, then the "last page" of results has been
  /// processed and there is no more data to be retrieved.
  ///
  /// If `LastEvaluatedKey` is not empty, it does not necessarily mean that
  /// there is more data in the result set. The only way to know when you have
  /// reached the end of the result set is when `LastEvaluatedKey` is empty.
  final Map<String, AttributeValue> lastEvaluatedKey;

  /// The capacity units consumed by the `Query` operation. The data returned
  /// includes the total provisioned throughput consumed, along with statistics
  /// for the table and any indexes involved in the operation.
  /// `ConsumedCapacity` is only returned if the `ReturnConsumedCapacity`
  /// parameter was specified. For more information, see
  /// [Provisioned Throughput](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ProvisionedThroughputIntro.html)
  /// in the _Amazon DynamoDB Developer Guide_.
  final ConsumedCapacity consumedCapacity;

  QueryOutput({
    this.items,
    this.count,
    this.scannedCount,
    this.lastEvaluatedKey,
    this.consumedCapacity,
  });
  static QueryOutput fromJson(Map<String, dynamic> json) => QueryOutput(
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
            ? (json['LastEvaluatedKey'] as Map).map(
                (k, v) => MapEntry(k as String, AttributeValue.fromJson(v)))
            : null,
        consumedCapacity: json.containsKey('ConsumedCapacity')
            ? ConsumedCapacity.fromJson(json['ConsumedCapacity'])
            : null,
      );
}

/// Represents the properties of a replica.
class Replica {
  /// The region where the replica needs to be created.
  final String regionName;

  Replica({
    this.regionName,
  });
  static Replica fromJson(Map<String, dynamic> json) => Replica(
        regionName: json.containsKey('RegionName')
            ? json['RegionName'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Contains the details of the replica.
class ReplicaDescription {
  /// The name of the region.
  final String regionName;

  ReplicaDescription({
    this.regionName,
  });
  static ReplicaDescription fromJson(Map<String, dynamic> json) =>
      ReplicaDescription(
        regionName: json.containsKey('RegionName')
            ? json['RegionName'] as String
            : null,
      );
}

/// Represents the properties of a global secondary index.
class ReplicaGlobalSecondaryIndexSettingsDescription {
  /// The name of the global secondary index. The name must be unique among all
  /// other indexes on this table.
  final String indexName;

  ///  The current status of the global secondary index:
  ///
  /// *    `CREATING` - The global secondary index is being created.
  ///
  /// *    `UPDATING` - The global secondary index is being updated.
  ///
  /// *    `DELETING` - The global secondary index is being deleted.
  ///
  /// *    `ACTIVE` - The global secondary index is ready for use.
  final String indexStatus;

  /// The maximum number of strongly consistent reads consumed per second before
  /// DynamoDB returns a `ThrottlingException`.
  final BigInt provisionedReadCapacityUnits;

  /// Autoscaling settings for a global secondary index replica's read capacity
  /// units.
  final AutoScalingSettingsDescription
      provisionedReadCapacityAutoScalingSettings;

  /// The maximum number of writes consumed per second before DynamoDB returns a
  /// `ThrottlingException`.
  final BigInt provisionedWriteCapacityUnits;

  /// AutoScaling settings for a global secondary index replica's write capacity
  /// units.
  final AutoScalingSettingsDescription
      provisionedWriteCapacityAutoScalingSettings;

  ReplicaGlobalSecondaryIndexSettingsDescription({
    @required this.indexName,
    this.indexStatus,
    this.provisionedReadCapacityUnits,
    this.provisionedReadCapacityAutoScalingSettings,
    this.provisionedWriteCapacityUnits,
    this.provisionedWriteCapacityAutoScalingSettings,
  });
  static ReplicaGlobalSecondaryIndexSettingsDescription fromJson(
          Map<String, dynamic> json) =>
      ReplicaGlobalSecondaryIndexSettingsDescription(
        indexName: json['IndexName'] as String,
        indexStatus: json.containsKey('IndexStatus')
            ? json['IndexStatus'] as String
            : null,
        provisionedReadCapacityUnits:
            json.containsKey('ProvisionedReadCapacityUnits')
                ? BigInt.from(json['ProvisionedReadCapacityUnits'])
                : null,
        provisionedReadCapacityAutoScalingSettings:
            json.containsKey('ProvisionedReadCapacityAutoScalingSettings')
                ? AutoScalingSettingsDescription.fromJson(
                    json['ProvisionedReadCapacityAutoScalingSettings'])
                : null,
        provisionedWriteCapacityUnits:
            json.containsKey('ProvisionedWriteCapacityUnits')
                ? BigInt.from(json['ProvisionedWriteCapacityUnits'])
                : null,
        provisionedWriteCapacityAutoScalingSettings:
            json.containsKey('ProvisionedWriteCapacityAutoScalingSettings')
                ? AutoScalingSettingsDescription.fromJson(
                    json['ProvisionedWriteCapacityAutoScalingSettings'])
                : null,
      );
}

/// Represents the settings of a global secondary index for a global table that
/// will be modified.
class ReplicaGlobalSecondaryIndexSettingsUpdate {
  /// The name of the global secondary index. The name must be unique among all
  /// other indexes on this table.
  final String indexName;

  /// The maximum number of strongly consistent reads consumed per second before
  /// DynamoDB returns a `ThrottlingException`.
  final BigInt provisionedReadCapacityUnits;

  /// Autoscaling settings for managing a global secondary index replica's read
  /// capacity units.
  final AutoScalingSettingsUpdate
      provisionedReadCapacityAutoScalingSettingsUpdate;

  ReplicaGlobalSecondaryIndexSettingsUpdate({
    @required this.indexName,
    this.provisionedReadCapacityUnits,
    this.provisionedReadCapacityAutoScalingSettingsUpdate,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Represents the properties of a replica.
class ReplicaSettingsDescription {
  /// The region name of the replica.
  final String regionName;

  /// The current state of the region:
  ///
  /// *    `CREATING` - The region is being created.
  ///
  /// *    `UPDATING` - The region is being updated.
  ///
  /// *    `DELETING` - The region is being deleted.
  ///
  /// *    `ACTIVE` - The region is ready for use.
  final String replicaStatus;

  /// The read/write capacity mode of the replica.
  final BillingModeSummary replicaBillingModeSummary;

  /// The maximum number of strongly consistent reads consumed per second before
  /// DynamoDB returns a `ThrottlingException`. For more information, see
  /// [Specifying Read and Write Requirements](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/WorkingWithTables.html#ProvisionedThroughput)
  /// in the _Amazon DynamoDB Developer Guide_.
  final BigInt replicaProvisionedReadCapacityUnits;

  /// Autoscaling settings for a global table replica's read capacity units.
  final AutoScalingSettingsDescription
      replicaProvisionedReadCapacityAutoScalingSettings;

  /// The maximum number of writes consumed per second before DynamoDB returns a
  /// `ThrottlingException`. For more information, see
  /// [Specifying Read and Write Requirements](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/WorkingWithTables.html#ProvisionedThroughput)
  /// in the _Amazon DynamoDB Developer Guide_.
  final BigInt replicaProvisionedWriteCapacityUnits;

  /// AutoScaling settings for a global table replica's write capacity units.
  final AutoScalingSettingsDescription
      replicaProvisionedWriteCapacityAutoScalingSettings;

  /// Replica global secondary index settings for the global table.
  final List<ReplicaGlobalSecondaryIndexSettingsDescription>
      replicaGlobalSecondaryIndexSettings;

  ReplicaSettingsDescription({
    @required this.regionName,
    this.replicaStatus,
    this.replicaBillingModeSummary,
    this.replicaProvisionedReadCapacityUnits,
    this.replicaProvisionedReadCapacityAutoScalingSettings,
    this.replicaProvisionedWriteCapacityUnits,
    this.replicaProvisionedWriteCapacityAutoScalingSettings,
    this.replicaGlobalSecondaryIndexSettings,
  });
  static ReplicaSettingsDescription fromJson(Map<String, dynamic> json) =>
      ReplicaSettingsDescription(
        regionName: json['RegionName'] as String,
        replicaStatus: json.containsKey('ReplicaStatus')
            ? json['ReplicaStatus'] as String
            : null,
        replicaBillingModeSummary: json.containsKey('ReplicaBillingModeSummary')
            ? BillingModeSummary.fromJson(json['ReplicaBillingModeSummary'])
            : null,
        replicaProvisionedReadCapacityUnits:
            json.containsKey('ReplicaProvisionedReadCapacityUnits')
                ? BigInt.from(json['ReplicaProvisionedReadCapacityUnits'])
                : null,
        replicaProvisionedReadCapacityAutoScalingSettings: json.containsKey(
                'ReplicaProvisionedReadCapacityAutoScalingSettings')
            ? AutoScalingSettingsDescription.fromJson(
                json['ReplicaProvisionedReadCapacityAutoScalingSettings'])
            : null,
        replicaProvisionedWriteCapacityUnits:
            json.containsKey('ReplicaProvisionedWriteCapacityUnits')
                ? BigInt.from(json['ReplicaProvisionedWriteCapacityUnits'])
                : null,
        replicaProvisionedWriteCapacityAutoScalingSettings: json.containsKey(
                'ReplicaProvisionedWriteCapacityAutoScalingSettings')
            ? AutoScalingSettingsDescription.fromJson(
                json['ReplicaProvisionedWriteCapacityAutoScalingSettings'])
            : null,
        replicaGlobalSecondaryIndexSettings: json
                .containsKey('ReplicaGlobalSecondaryIndexSettings')
            ? (json['ReplicaGlobalSecondaryIndexSettings'] as List)
                .map((e) =>
                    ReplicaGlobalSecondaryIndexSettingsDescription.fromJson(e))
                .toList()
            : null,
      );
}

/// Represents the settings for a global table in a region that will be
/// modified.
class ReplicaSettingsUpdate {
  /// The region of the replica to be added.
  final String regionName;

  /// The maximum number of strongly consistent reads consumed per second before
  /// DynamoDB returns a `ThrottlingException`. For more information, see
  /// [Specifying Read and Write Requirements](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/WorkingWithTables.html#ProvisionedThroughput)
  /// in the _Amazon DynamoDB Developer Guide_.
  final BigInt replicaProvisionedReadCapacityUnits;

  /// Autoscaling settings for managing a global table replica's read capacity
  /// units.
  final AutoScalingSettingsUpdate
      replicaProvisionedReadCapacityAutoScalingSettingsUpdate;

  /// Represents the settings of a global secondary index for a global table
  /// that will be modified.
  final List<ReplicaGlobalSecondaryIndexSettingsUpdate>
      replicaGlobalSecondaryIndexSettingsUpdate;

  ReplicaSettingsUpdate({
    @required this.regionName,
    this.replicaProvisionedReadCapacityUnits,
    this.replicaProvisionedReadCapacityAutoScalingSettingsUpdate,
    this.replicaGlobalSecondaryIndexSettingsUpdate,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Represents one of the following:
///
/// *   A new replica to be added to an existing global table.
///
/// *   New parameters for an existing replica.
///
/// *   An existing replica to be removed from an existing global table.
class ReplicaUpdate {
  /// The parameters required for creating a replica on an existing global
  /// table.
  final CreateReplicaAction create;

  /// The name of the existing replica to be removed.
  final DeleteReplicaAction delete;

  ReplicaUpdate({
    this.create,
    this.delete,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Contains details for the restore.
class RestoreSummary {
  /// ARN of the backup from which the table was restored.
  final String sourceBackupArn;

  /// ARN of the source table of the backup that is being restored.
  final String sourceTableArn;

  /// Point in time or source backup time.
  final DateTime restoreDateTime;

  /// Indicates if a restore is in progress or not.
  final bool restoreInProgress;

  RestoreSummary({
    this.sourceBackupArn,
    this.sourceTableArn,
    @required this.restoreDateTime,
    @required this.restoreInProgress,
  });
  static RestoreSummary fromJson(Map<String, dynamic> json) => RestoreSummary(
        sourceBackupArn: json.containsKey('SourceBackupArn')
            ? json['SourceBackupArn'] as String
            : null,
        sourceTableArn: json.containsKey('SourceTableArn')
            ? json['SourceTableArn'] as String
            : null,
        restoreDateTime: DateTime.parse(json['RestoreDateTime']),
        restoreInProgress: json['RestoreInProgress'] as bool,
      );
}

class RestoreTableFromBackupOutput {
  /// The description of the table created from an existing backup.
  final TableDescription tableDescription;

  RestoreTableFromBackupOutput({
    this.tableDescription,
  });
  static RestoreTableFromBackupOutput fromJson(Map<String, dynamic> json) =>
      RestoreTableFromBackupOutput(
        tableDescription: json.containsKey('TableDescription')
            ? TableDescription.fromJson(json['TableDescription'])
            : null,
      );
}

class RestoreTableToPointInTimeOutput {
  /// Represents the properties of a table.
  final TableDescription tableDescription;

  RestoreTableToPointInTimeOutput({
    this.tableDescription,
  });
  static RestoreTableToPointInTimeOutput fromJson(Map<String, dynamic> json) =>
      RestoreTableToPointInTimeOutput(
        tableDescription: json.containsKey('TableDescription')
            ? TableDescription.fromJson(json['TableDescription'])
            : null,
      );
}

/// The description of the server-side encryption status on the specified table.
class SseDescription {
  /// Represents the current state of server-side encryption. The only supported
  /// values are:
  ///
  /// *    `ENABLED` - Server-side encryption is enabled.
  ///
  /// *    `UPDATING` - Server-side encryption is being updated.
  final String status;

  /// Server-side encryption type. The only supported value is:
  ///
  /// *    `KMS` - Server-side encryption which uses AWS Key Management Service.
  /// Key is stored in your account and is managed by AWS KMS (KMS charges
  /// apply).
  final String sseType;

  /// The KMS customer master key (CMK) ARN used for the KMS encryption.
  final String kmsMasterKeyArn;

  SseDescription({
    this.status,
    this.sseType,
    this.kmsMasterKeyArn,
  });
  static SseDescription fromJson(Map<String, dynamic> json) => SseDescription(
        status: json.containsKey('Status') ? json['Status'] as String : null,
        sseType: json.containsKey('SSEType') ? json['SSEType'] as String : null,
        kmsMasterKeyArn: json.containsKey('KMSMasterKeyArn')
            ? json['KMSMasterKeyArn'] as String
            : null,
      );
}

/// Represents the settings used to enable server-side encryption.
class SseSpecification {
  /// Indicates whether server-side encryption is done using an AWS managed CMK
  /// or an AWS owned CMK. If enabled (true), server-side encryption type is set
  /// to `KMS` and an AWS managed CMK is used (AWS KMS charges apply). If
  /// disabled (false) or not specified, server-side encryption is set to AWS
  /// owned CMK.
  final bool enabled;

  /// Server-side encryption type. The only supported value is:
  ///
  /// *    `KMS` - Server-side encryption which uses AWS Key Management Service.
  /// Key is stored in your account and is managed by AWS KMS (KMS charges
  /// apply).
  final String sseType;

  /// The KMS Customer Master Key (CMK) which should be used for the KMS
  /// encryption. To specify a CMK, use its key ID, Amazon Resource Name (ARN),
  /// alias name, or alias ARN. Note that you should only provide this parameter
  /// if the key is different from the default DynamoDB Customer Master Key
  /// alias/aws/dynamodb.
  final String kmsMasterKeyId;

  SseSpecification({
    this.enabled,
    this.sseType,
    this.kmsMasterKeyId,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Represents the output of a `Scan` operation.
class ScanOutput {
  /// An array of item attributes that match the scan criteria. Each element in
  /// this array consists of an attribute name and the value for that attribute.
  final List<Map<String, AttributeValue>> items;

  /// The number of items in the response.
  ///
  /// If you set `ScanFilter` in the request, then `Count` is the number of
  /// items returned after the filter was applied, and `ScannedCount` is the
  /// number of matching items before the filter was applied.
  ///
  /// If you did not use a filter in the request, then `Count` is the same as
  /// `ScannedCount`.
  final int count;

  /// The number of items evaluated, before any `ScanFilter` is applied. A high
  /// `ScannedCount` value with few, or no, `Count` results indicates an
  /// inefficient `Scan` operation. For more information, see
  /// [Count and ScannedCount](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/QueryAndScan.html#Count)
  /// in the _Amazon DynamoDB Developer Guide_.
  ///
  /// If you did not use a filter in the request, then `ScannedCount` is the
  /// same as `Count`.
  final int scannedCount;

  /// The primary key of the item where the operation stopped, inclusive of the
  /// previous result set. Use this value to start a new operation, excluding
  /// this value in the new request.
  ///
  /// If `LastEvaluatedKey` is empty, then the "last page" of results has been
  /// processed and there is no more data to be retrieved.
  ///
  /// If `LastEvaluatedKey` is not empty, it does not necessarily mean that
  /// there is more data in the result set. The only way to know when you have
  /// reached the end of the result set is when `LastEvaluatedKey` is empty.
  final Map<String, AttributeValue> lastEvaluatedKey;

  /// The capacity units consumed by the `Scan` operation. The data returned
  /// includes the total provisioned throughput consumed, along with statistics
  /// for the table and any indexes involved in the operation.
  /// `ConsumedCapacity` is only returned if the `ReturnConsumedCapacity`
  /// parameter was specified. For more information, see
  /// [Provisioned Throughput](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ProvisionedThroughputIntro.html)
  /// in the _Amazon DynamoDB Developer Guide_.
  final ConsumedCapacity consumedCapacity;

  ScanOutput({
    this.items,
    this.count,
    this.scannedCount,
    this.lastEvaluatedKey,
    this.consumedCapacity,
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
            ? (json['LastEvaluatedKey'] as Map).map(
                (k, v) => MapEntry(k as String, AttributeValue.fromJson(v)))
            : null,
        consumedCapacity: json.containsKey('ConsumedCapacity')
            ? ConsumedCapacity.fromJson(json['ConsumedCapacity'])
            : null,
      );
}

/// Contains the details of the table when the backup was created.
class SourceTableDetails {
  /// The name of the table for which the backup was created.
  final String tableName;

  /// Unique identifier for the table for which the backup was created.
  final String tableId;

  /// ARN of the table for which backup was created.
  final String tableArn;

  /// Size of the table in bytes. Please note this is an approximate value.
  final BigInt tableSizeBytes;

  /// Schema of the table.
  final List<KeySchemaElement> keySchema;

  /// Time when the source table was created.
  final DateTime tableCreationDateTime;

  /// Read IOPs and Write IOPS on the table when the backup was created.
  final ProvisionedThroughput provisionedThroughput;

  /// Number of items in the table. Please note this is an approximate value.
  final BigInt itemCount;

  /// Controls how you are charged for read and write throughput and how you
  /// manage capacity. This setting can be changed later.
  ///
  /// *    `PROVISIONED` - Sets the read/write capacity mode to `PROVISIONED`.
  /// We recommend using `PROVISIONED` for predictable workloads.
  ///
  /// *    `PAY_PER_REQUEST` - Sets the read/write capacity mode to
  /// `PAY_PER_REQUEST`. We recommend using `PAY_PER_REQUEST` for unpredictable
  /// workloads.
  final String billingMode;

  SourceTableDetails({
    @required this.tableName,
    @required this.tableId,
    this.tableArn,
    this.tableSizeBytes,
    @required this.keySchema,
    @required this.tableCreationDateTime,
    @required this.provisionedThroughput,
    this.itemCount,
    this.billingMode,
  });
  static SourceTableDetails fromJson(Map<String, dynamic> json) =>
      SourceTableDetails(
        tableName: json['TableName'] as String,
        tableId: json['TableId'] as String,
        tableArn:
            json.containsKey('TableArn') ? json['TableArn'] as String : null,
        tableSizeBytes: json.containsKey('TableSizeBytes')
            ? BigInt.from(json['TableSizeBytes'])
            : null,
        keySchema: (json['KeySchema'] as List)
            .map((e) => KeySchemaElement.fromJson(e))
            .toList(),
        tableCreationDateTime: DateTime.parse(json['TableCreationDateTime']),
        provisionedThroughput:
            ProvisionedThroughput.fromJson(json['ProvisionedThroughput']),
        itemCount: json.containsKey('ItemCount')
            ? BigInt.from(json['ItemCount'])
            : null,
        billingMode: json.containsKey('BillingMode')
            ? json['BillingMode'] as String
            : null,
      );
}

/// Contains the details of the features enabled on the table when the backup
/// was created. For example, LSIs, GSIs, streams, TTL.
class SourceTableFeatureDetails {
  /// Represents the LSI properties for the table when the backup was created.
  /// It includes the IndexName, KeySchema and Projection for the LSIs on the
  /// table at the time of backup.
  final List<LocalSecondaryIndexInfo> localSecondaryIndexes;

  /// Represents the GSI properties for the table when the backup was created.
  /// It includes the IndexName, KeySchema, Projection and ProvisionedThroughput
  /// for the GSIs on the table at the time of backup.
  final List<GlobalSecondaryIndexInfo> globalSecondaryIndexes;

  /// Stream settings on the table when the backup was created.
  final StreamSpecification streamDescription;

  /// Time to Live settings on the table when the backup was created.
  final TimeToLiveDescription timeToLiveDescription;

  /// The description of the server-side encryption status on the table when the
  /// backup was created.
  final SseDescription sseDescription;

  SourceTableFeatureDetails({
    this.localSecondaryIndexes,
    this.globalSecondaryIndexes,
    this.streamDescription,
    this.timeToLiveDescription,
    this.sseDescription,
  });
  static SourceTableFeatureDetails fromJson(Map<String, dynamic> json) =>
      SourceTableFeatureDetails(
        localSecondaryIndexes: json.containsKey('LocalSecondaryIndexes')
            ? (json['LocalSecondaryIndexes'] as List)
                .map((e) => LocalSecondaryIndexInfo.fromJson(e))
                .toList()
            : null,
        globalSecondaryIndexes: json.containsKey('GlobalSecondaryIndexes')
            ? (json['GlobalSecondaryIndexes'] as List)
                .map((e) => GlobalSecondaryIndexInfo.fromJson(e))
                .toList()
            : null,
        streamDescription: json.containsKey('StreamDescription')
            ? StreamSpecification.fromJson(json['StreamDescription'])
            : null,
        timeToLiveDescription: json.containsKey('TimeToLiveDescription')
            ? TimeToLiveDescription.fromJson(json['TimeToLiveDescription'])
            : null,
        sseDescription: json.containsKey('SSEDescription')
            ? SseDescription.fromJson(json['SSEDescription'])
            : null,
      );
}

/// Represents the DynamoDB Streams configuration for a table in DynamoDB.
class StreamSpecification {
  /// Indicates whether DynamoDB Streams is enabled (true) or disabled (false)
  /// on the table.
  final bool streamEnabled;

  ///  When an item in the table is modified, `StreamViewType` determines what
  /// information is written to the stream for this table. Valid values for
  /// `StreamViewType` are:
  ///
  /// *    `KEYS_ONLY` - Only the key attributes of the modified item are
  /// written to the stream.
  ///
  /// *    `NEW_IMAGE` - The entire item, as it appears after it was modified,
  /// is written to the stream.
  ///
  /// *    `OLD_IMAGE` - The entire item, as it appeared before it was modified,
  /// is written to the stream.
  ///
  /// *    `NEW_AND_OLD_IMAGES` - Both the new and the old item images of the
  /// item are written to the stream.
  final String streamViewType;

  StreamSpecification({
    this.streamEnabled,
    this.streamViewType,
  });
  static StreamSpecification fromJson(Map<String, dynamic> json) =>
      StreamSpecification(
        streamEnabled: json.containsKey('StreamEnabled')
            ? json['StreamEnabled'] as bool
            : null,
        streamViewType: json.containsKey('StreamViewType')
            ? json['StreamViewType'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Represents the properties of a table.
class TableDescription {
  /// An array of `AttributeDefinition` objects. Each of these objects describes
  /// one attribute in the table and index key schema.
  ///
  /// Each `AttributeDefinition` object in this array is composed of:
  ///
  /// *    `AttributeName` - The name of the attribute.
  ///
  /// *    `AttributeType` - The data type for the attribute.
  final List<AttributeDefinition> attributeDefinitions;

  /// The name of the table.
  final String tableName;

  /// The primary key structure for the table. Each `KeySchemaElement` consists
  /// of:
  ///
  /// *    `AttributeName` - The name of the attribute.
  ///
  /// *    `KeyType` - The role of the attribute:
  ///
  ///     *    `HASH` - partition key
  ///
  ///     *    `RANGE` - sort key
  ///
  ///
  ///      The partition key of an item is also known as its _hash attribute_.
  /// The term "hash attribute" derives from DynamoDB's usage of an internal
  /// hash function to evenly distribute data items across partitions, based on
  /// their partition key values.
  ///
  ///     The sort key of an item is also known as its _range attribute_. The
  /// term "range attribute" derives from the way DynamoDB stores items with the
  /// same partition key physically close together, in sorted order by the sort
  /// key value.
  ///
  /// For more information about primary keys, see
  /// [Primary Key](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DataModel.html#DataModelPrimaryKey)
  /// in the _Amazon DynamoDB Developer Guide_.
  final List<KeySchemaElement> keySchema;

  /// The current state of the table:
  ///
  /// *    `CREATING` - The table is being created.
  ///
  /// *    `UPDATING` - The table is being updated.
  ///
  /// *    `DELETING` - The table is being deleted.
  ///
  /// *    `ACTIVE` - The table is ready for use.
  final String tableStatus;

  /// The date and time when the table was created, in
  /// [UNIX epoch time](http://www.epochconverter.com/) format.
  final DateTime creationDateTime;

  /// The provisioned throughput settings for the table, consisting of read and
  /// write capacity units, along with data about increases and decreases.
  final ProvisionedThroughputDescription provisionedThroughput;

  /// The total size of the specified table, in bytes. DynamoDB updates this
  /// value approximately every six hours. Recent changes might not be reflected
  /// in this value.
  final BigInt tableSizeBytes;

  /// The number of items in the specified table. DynamoDB updates this value
  /// approximately every six hours. Recent changes might not be reflected in
  /// this value.
  final BigInt itemCount;

  /// The Amazon Resource Name (ARN) that uniquely identifies the table.
  final String tableArn;

  /// Unique identifier for the table for which the backup was created.
  final String tableId;

  /// Contains the details for the read/write capacity mode.
  final BillingModeSummary billingModeSummary;

  /// Represents one or more local secondary indexes on the table. Each index is
  /// scoped to a given partition key value. Tables with one or more local
  /// secondary indexes are subject to an item collection size limit, where the
  /// amount of data within a given item collection cannot exceed 10 GB. Each
  /// element is composed of:
  ///
  /// *    `IndexName` - The name of the local secondary index.
  ///
  /// *    `KeySchema` - Specifies the complete index key schema. The attribute
  /// names in the key schema must be between 1 and 255 characters (inclusive).
  /// The key schema must begin with the same partition key as the table.
  ///
  /// *    `Projection` - Specifies attributes that are copied (projected) from
  /// the table into the index. These are in addition to the primary key
  /// attributes and index key attributes, which are automatically projected.
  /// Each attribute specification is composed of:
  ///
  ///     *    `ProjectionType` - One of the following:
  ///
  ///         *    `KEYS_ONLY` - Only the index and primary keys are projected
  /// into the index.
  ///
  ///         *    `INCLUDE` - Only the specified table attributes are projected
  /// into the index. The list of projected attributes are in
  /// `NonKeyAttributes`.
  ///
  ///         *    `ALL` - All of the table attributes are projected into the
  /// index.
  ///
  ///
  ///     *    `NonKeyAttributes` - A list of one or more non-key attribute
  /// names that are projected into the secondary index. The total count of
  /// attributes provided in `NonKeyAttributes`, summed across all of the
  /// secondary indexes, must not exceed 20. If you project the same attribute
  /// into two different indexes, this counts as two distinct attributes when
  /// determining the total.
  ///
  ///
  /// *    `IndexSizeBytes` - Represents the total size of the index, in bytes.
  /// DynamoDB updates this value approximately every six hours. Recent changes
  /// might not be reflected in this value.
  ///
  /// *    `ItemCount` - Represents the number of items in the index. DynamoDB
  /// updates this value approximately every six hours. Recent changes might not
  /// be reflected in this value.
  ///
  ///
  /// If the table is in the `DELETING` state, no information about indexes will
  /// be returned.
  final List<LocalSecondaryIndexDescription> localSecondaryIndexes;

  /// The global secondary indexes, if any, on the table. Each index is scoped
  /// to a given partition key value. Each element is composed of:
  ///
  /// *    `Backfilling` - If true, then the index is currently in the
  /// backfilling phase. Backfilling occurs only when a new global secondary
  /// index is added to the table; it is the process by which DynamoDB populates
  /// the new index with data from the table. (This attribute does not appear
  /// for indexes that were created during a `CreateTable` operation.)
  ///
  /// *    `IndexName` - The name of the global secondary index.
  ///
  /// *    `IndexSizeBytes` - The total size of the global secondary index, in
  /// bytes. DynamoDB updates this value approximately every six hours. Recent
  /// changes might not be reflected in this value.
  ///
  /// *    `IndexStatus` - The current status of the global secondary index:
  ///
  ///     *    `CREATING` - The index is being created.
  ///
  ///     *    `UPDATING` - The index is being updated.
  ///
  ///     *    `DELETING` - The index is being deleted.
  ///
  ///     *    `ACTIVE` - The index is ready for use.
  ///
  ///
  /// *    `ItemCount` - The number of items in the global secondary index.
  /// DynamoDB updates this value approximately every six hours. Recent changes
  /// might not be reflected in this value.
  ///
  /// *    `KeySchema` - Specifies the complete index key schema. The attribute
  /// names in the key schema must be between 1 and 255 characters (inclusive).
  /// The key schema must begin with the same partition key as the table.
  ///
  /// *    `Projection` - Specifies attributes that are copied (projected) from
  /// the table into the index. These are in addition to the primary key
  /// attributes and index key attributes, which are automatically projected.
  /// Each attribute specification is composed of:
  ///
  ///     *    `ProjectionType` - One of the following:
  ///
  ///         *    `KEYS_ONLY` - Only the index and primary keys are projected
  /// into the index.
  ///
  ///         *    `INCLUDE` - Only the specified table attributes are projected
  /// into the index. The list of projected attributes are in
  /// `NonKeyAttributes`.
  ///
  ///         *    `ALL` - All of the table attributes are projected into the
  /// index.
  ///
  ///
  ///     *    `NonKeyAttributes` - A list of one or more non-key attribute
  /// names that are projected into the secondary index. The total count of
  /// attributes provided in `NonKeyAttributes`, summed across all of the
  /// secondary indexes, must not exceed 20. If you project the same attribute
  /// into two different indexes, this counts as two distinct attributes when
  /// determining the total.
  ///
  ///
  /// *    `ProvisionedThroughput` - The provisioned throughput settings for the
  /// global secondary index, consisting of read and write capacity units, along
  /// with data about increases and decreases.
  ///
  ///
  /// If the table is in the `DELETING` state, no information about indexes will
  /// be returned.
  final List<GlobalSecondaryIndexDescription> globalSecondaryIndexes;

  /// The current DynamoDB Streams configuration for the table.
  final StreamSpecification streamSpecification;

  /// A timestamp, in ISO 8601 format, for this stream.
  ///
  /// Note that `LatestStreamLabel` is not a unique identifier for the stream,
  /// because it is possible that a stream from another table might have the
  /// same timestamp. However, the combination of the following three elements
  /// is guaranteed to be unique:
  ///
  /// *   the AWS customer ID.
  ///
  /// *   the table name.
  ///
  /// *   the `StreamLabel`.
  final String latestStreamLabel;

  /// The Amazon Resource Name (ARN) that uniquely identifies the latest stream
  /// for this table.
  final String latestStreamArn;

  /// Contains details for the restore.
  final RestoreSummary restoreSummary;

  /// The description of the server-side encryption status on the specified
  /// table.
  final SseDescription sseDescription;

  TableDescription({
    this.attributeDefinitions,
    this.tableName,
    this.keySchema,
    this.tableStatus,
    this.creationDateTime,
    this.provisionedThroughput,
    this.tableSizeBytes,
    this.itemCount,
    this.tableArn,
    this.tableId,
    this.billingModeSummary,
    this.localSecondaryIndexes,
    this.globalSecondaryIndexes,
    this.streamSpecification,
    this.latestStreamLabel,
    this.latestStreamArn,
    this.restoreSummary,
    this.sseDescription,
  });
  static TableDescription fromJson(Map<String, dynamic> json) =>
      TableDescription(
        attributeDefinitions: json.containsKey('AttributeDefinitions')
            ? (json['AttributeDefinitions'] as List)
                .map((e) => AttributeDefinition.fromJson(e))
                .toList()
            : null,
        tableName:
            json.containsKey('TableName') ? json['TableName'] as String : null,
        keySchema: json.containsKey('KeySchema')
            ? (json['KeySchema'] as List)
                .map((e) => KeySchemaElement.fromJson(e))
                .toList()
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
        tableArn:
            json.containsKey('TableArn') ? json['TableArn'] as String : null,
        tableId: json.containsKey('TableId') ? json['TableId'] as String : null,
        billingModeSummary: json.containsKey('BillingModeSummary')
            ? BillingModeSummary.fromJson(json['BillingModeSummary'])
            : null,
        localSecondaryIndexes: json.containsKey('LocalSecondaryIndexes')
            ? (json['LocalSecondaryIndexes'] as List)
                .map((e) => LocalSecondaryIndexDescription.fromJson(e))
                .toList()
            : null,
        globalSecondaryIndexes: json.containsKey('GlobalSecondaryIndexes')
            ? (json['GlobalSecondaryIndexes'] as List)
                .map((e) => GlobalSecondaryIndexDescription.fromJson(e))
                .toList()
            : null,
        streamSpecification: json.containsKey('StreamSpecification')
            ? StreamSpecification.fromJson(json['StreamSpecification'])
            : null,
        latestStreamLabel: json.containsKey('LatestStreamLabel')
            ? json['LatestStreamLabel'] as String
            : null,
        latestStreamArn: json.containsKey('LatestStreamArn')
            ? json['LatestStreamArn'] as String
            : null,
        restoreSummary: json.containsKey('RestoreSummary')
            ? RestoreSummary.fromJson(json['RestoreSummary'])
            : null,
        sseDescription: json.containsKey('SSEDescription')
            ? SseDescription.fromJson(json['SSEDescription'])
            : null,
      );
}

/// Describes a tag. A tag is a key-value pair. You can add up to 50 tags to a
/// single DynamoDB table.
///
///  AWS-assigned tag names and values are automatically assigned the `aws:`
/// prefix, which the user cannot assign. AWS-assigned tag names do not count
/// towards the tag limit of 50. User-assigned tag names have the prefix `user:`
/// in the Cost Allocation Report. You cannot backdate the application of a tag.
///
/// For an overview on tagging DynamoDB resources, see
/// [Tagging for DynamoDB](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Tagging.html)
/// in the _Amazon DynamoDB Developer Guide_.
class Tag {
  /// The key of the tag. Tag keys are case sensitive. Each DynamoDB table can
  /// only have up to one tag with the same key. If you try to add an existing
  /// tag (same key), the existing tag value will be updated to the new value.
  final String key;

  /// The value of the tag. Tag values are case-sensitive and can be null.
  final String value;

  Tag({
    @required this.key,
    @required this.value,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag(
        key: json['Key'] as String,
        value: json['Value'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The description of the Time to Live (TTL) status on the specified table.
class TimeToLiveDescription {
  ///  The TTL status for the table.
  final String timeToLiveStatus;

  ///  The name of the TTL attribute for items in the table.
  final String attributeName;

  TimeToLiveDescription({
    this.timeToLiveStatus,
    this.attributeName,
  });
  static TimeToLiveDescription fromJson(Map<String, dynamic> json) =>
      TimeToLiveDescription(
        timeToLiveStatus: json.containsKey('TimeToLiveStatus')
            ? json['TimeToLiveStatus'] as String
            : null,
        attributeName: json.containsKey('AttributeName')
            ? json['AttributeName'] as String
            : null,
      );
}

/// Represents the settings used to enable or disable Time to Live (TTL) for the
/// specified table.
class TimeToLiveSpecification {
  /// Indicates whether TTL is to be enabled (true) or disabled (false) on the
  /// table.
  final bool enabled;

  /// The name of the TTL attribute used to store the expiration time for items
  /// in the table.
  final String attributeName;

  TimeToLiveSpecification({
    @required this.enabled,
    @required this.attributeName,
  });
  static TimeToLiveSpecification fromJson(Map<String, dynamic> json) =>
      TimeToLiveSpecification(
        enabled: json['Enabled'] as bool,
        attributeName: json['AttributeName'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies an item to be retrieved as part of the transaction.
class TransactGetItem {
  /// Contains the primary key that identifies the item to get, together with
  /// the name of the table that contains the item, and optionally the specific
  /// attributes of the item to retrieve.
  final Get get;

  TransactGetItem({
    @required this.get,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class TransactGetItemsOutput {
  /// If the _ReturnConsumedCapacity_ value was `TOTAL`, this is an array of
  /// `ConsumedCapacity` objects, one for each table addressed by
  /// `TransactGetItem` objects in the _TransactItems_ parameter. These
  /// `ConsumedCapacity` objects report the read-capacity units consumed by the
  /// `TransactGetItems` call in that table.
  final List<ConsumedCapacity> consumedCapacity;

  /// An ordered array of up to 25 `ItemResponse` objects, each of which
  /// corresponds to the `TransactGetItem` object in the same position in the
  /// _TransactItems_ array. Each `ItemResponse` object contains a Map of the
  /// name-value pairs that are the projected attributes of the requested item.
  ///
  /// If a requested item could not be retrieved, the corresponding
  /// `ItemResponse` object is Null, or if the requested item has no projected
  /// attributes, the corresponding `ItemResponse` object is an empty Map.
  final List<ItemResponse> responses;

  TransactGetItemsOutput({
    this.consumedCapacity,
    this.responses,
  });
  static TransactGetItemsOutput fromJson(Map<String, dynamic> json) =>
      TransactGetItemsOutput(
        consumedCapacity: json.containsKey('ConsumedCapacity')
            ? (json['ConsumedCapacity'] as List)
                .map((e) => ConsumedCapacity.fromJson(e))
                .toList()
            : null,
        responses: json.containsKey('Responses')
            ? (json['Responses'] as List)
                .map((e) => ItemResponse.fromJson(e))
                .toList()
            : null,
      );
}

/// A list of requests that can perform update, put, delete, or check operations
/// on multiple items in one or more tables atomically.
class TransactWriteItem {
  /// A request to perform a check item operation.
  final ConditionCheck conditionCheck;

  /// A request to perform a `PutItem` operation.
  final Put put;

  /// A request to perform a `DeleteItem` operation.
  final Delete delete;

  /// A request to perform an `UpdateItem` operation.
  final Update update;

  TransactWriteItem({
    this.conditionCheck,
    this.put,
    this.delete,
    this.update,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class TransactWriteItemsOutput {
  /// The capacity units consumed by the entire `TransactWriteItems` operation.
  /// The values of the list are ordered according to the ordering of the
  /// `TransactItems` request parameter.
  final List<ConsumedCapacity> consumedCapacity;

  /// A list of tables that were processed by `TransactWriteItems` and, for each
  /// table, information about any item collections that were affected by
  /// individual `UpdateItem`, `PutItem`, or `DeleteItem` operations.
  final Map<String, List<ItemCollectionMetrics>> itemCollectionMetrics;

  TransactWriteItemsOutput({
    this.consumedCapacity,
    this.itemCollectionMetrics,
  });
  static TransactWriteItemsOutput fromJson(Map<String, dynamic> json) =>
      TransactWriteItemsOutput(
        consumedCapacity: json.containsKey('ConsumedCapacity')
            ? (json['ConsumedCapacity'] as List)
                .map((e) => ConsumedCapacity.fromJson(e))
                .toList()
            : null,
        itemCollectionMetrics: json.containsKey('ItemCollectionMetrics')
            ? (json['ItemCollectionMetrics'] as Map).map((k, v) => MapEntry(
                k as String,
                (v as List)
                    .map((e) => ItemCollectionMetrics.fromJson(e))
                    .toList()))
            : null,
      );
}

/// Represents a request to perform an `UpdateItem` operation.
class Update {
  /// The primary key of the item to be updated. Each element consists of an
  /// attribute name and a value for that attribute.
  final Map<String, AttributeValue> key;

  /// An expression that defines one or more attributes to be updated, the
  /// action to be performed on them, and new value(s) for them.
  final String updateExpression;

  /// Name of the table for the `UpdateItem` request.
  final String tableName;

  /// A condition that must be satisfied in order for a conditional update to
  /// succeed.
  final String conditionExpression;

  /// One or more substitution tokens for attribute names in an expression.
  final Map<String, String> expressionAttributeNames;

  /// One or more values that can be substituted in an expression.
  final Map<String, AttributeValue> expressionAttributeValues;

  /// Use `ReturnValuesOnConditionCheckFailure` to get the item attributes if
  /// the `Update` condition fails. For `ReturnValuesOnConditionCheckFailure`,
  /// the valid values are: NONE, ALL_OLD, UPDATED_OLD, ALL_NEW, UPDATED_NEW.
  final String returnValuesOnConditionCheckFailure;

  Update({
    @required this.key,
    @required this.updateExpression,
    @required this.tableName,
    this.conditionExpression,
    this.expressionAttributeNames,
    this.expressionAttributeValues,
    this.returnValuesOnConditionCheckFailure,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class UpdateContinuousBackupsOutput {
  /// Represents the continuous backups and point in time recovery settings on
  /// the table.
  final ContinuousBackupsDescription continuousBackupsDescription;

  UpdateContinuousBackupsOutput({
    this.continuousBackupsDescription,
  });
  static UpdateContinuousBackupsOutput fromJson(Map<String, dynamic> json) =>
      UpdateContinuousBackupsOutput(
        continuousBackupsDescription:
            json.containsKey('ContinuousBackupsDescription')
                ? ContinuousBackupsDescription.fromJson(
                    json['ContinuousBackupsDescription'])
                : null,
      );
}

/// Represents the new provisioned throughput settings to be applied to a global
/// secondary index.
class UpdateGlobalSecondaryIndexAction {
  /// The name of the global secondary index to be updated.
  final String indexName;

  /// Represents the provisioned throughput settings for the specified global
  /// secondary index.
  ///
  /// For current minimum and maximum provisioned throughput values, see
  /// [Limits](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html)
  /// in the _Amazon DynamoDB Developer Guide_.
  final ProvisionedThroughput provisionedThroughput;

  UpdateGlobalSecondaryIndexAction({
    @required this.indexName,
    @required this.provisionedThroughput,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class UpdateGlobalTableOutput {
  /// Contains the details of the global table.
  final GlobalTableDescription globalTableDescription;

  UpdateGlobalTableOutput({
    this.globalTableDescription,
  });
  static UpdateGlobalTableOutput fromJson(Map<String, dynamic> json) =>
      UpdateGlobalTableOutput(
        globalTableDescription: json.containsKey('GlobalTableDescription')
            ? GlobalTableDescription.fromJson(json['GlobalTableDescription'])
            : null,
      );
}

class UpdateGlobalTableSettingsOutput {
  /// The name of the global table.
  final String globalTableName;

  /// The Region-specific settings for the global table.
  final List<ReplicaSettingsDescription> replicaSettings;

  UpdateGlobalTableSettingsOutput({
    this.globalTableName,
    this.replicaSettings,
  });
  static UpdateGlobalTableSettingsOutput fromJson(Map<String, dynamic> json) =>
      UpdateGlobalTableSettingsOutput(
        globalTableName: json.containsKey('GlobalTableName')
            ? json['GlobalTableName'] as String
            : null,
        replicaSettings: json.containsKey('ReplicaSettings')
            ? (json['ReplicaSettings'] as List)
                .map((e) => ReplicaSettingsDescription.fromJson(e))
                .toList()
            : null,
      );
}

/// Represents the output of an `UpdateItem` operation.
class UpdateItemOutput {
  /// A map of attribute values as they appear before or after the `UpdateItem`
  /// operation, as determined by the `ReturnValues` parameter.
  ///
  /// The `Attributes` map is only present if `ReturnValues` was specified as
  /// something other than `NONE` in the request. Each element represents one
  /// attribute.
  final Map<String, AttributeValue> attributes;

  /// The capacity units consumed by the `UpdateItem` operation. The data
  /// returned includes the total provisioned throughput consumed, along with
  /// statistics for the table and any indexes involved in the operation.
  /// `ConsumedCapacity` is only returned if the `ReturnConsumedCapacity`
  /// parameter was specified. For more information, see
  /// [Provisioned Throughput](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ProvisionedThroughputIntro.html)
  /// in the _Amazon DynamoDB Developer Guide_.
  final ConsumedCapacity consumedCapacity;

  /// Information about item collections, if any, that were affected by the
  /// `UpdateItem` operation. `ItemCollectionMetrics` is only returned if the
  /// `ReturnItemCollectionMetrics` parameter was specified. If the table does
  /// not have any local secondary indexes, this information is not returned in
  /// the response.
  ///
  /// Each `ItemCollectionMetrics` element consists of:
  ///
  /// *    `ItemCollectionKey` - The partition key value of the item collection.
  /// This is the same as the partition key value of the item itself.
  ///
  /// *    `SizeEstimateRangeGB` - An estimate of item collection size, in
  /// gigabytes. This value is a two-element array containing a lower bound and
  /// an upper bound for the estimate. The estimate includes the size of all the
  /// items in the table, plus the size of all attributes projected into all of
  /// the local secondary indexes on that table. Use this estimate to measure
  /// whether a local secondary index is approaching its size limit.
  ///
  ///     The estimate is subject to change over time; therefore, do not rely on
  /// the precision or accuracy of the estimate.
  final ItemCollectionMetrics itemCollectionMetrics;

  UpdateItemOutput({
    this.attributes,
    this.consumedCapacity,
    this.itemCollectionMetrics,
  });
  static UpdateItemOutput fromJson(Map<String, dynamic> json) =>
      UpdateItemOutput(
        attributes: json.containsKey('Attributes')
            ? (json['Attributes'] as Map).map(
                (k, v) => MapEntry(k as String, AttributeValue.fromJson(v)))
            : null,
        consumedCapacity: json.containsKey('ConsumedCapacity')
            ? ConsumedCapacity.fromJson(json['ConsumedCapacity'])
            : null,
        itemCollectionMetrics: json.containsKey('ItemCollectionMetrics')
            ? ItemCollectionMetrics.fromJson(json['ItemCollectionMetrics'])
            : null,
      );
}

/// Represents the output of an `UpdateTable` operation.
class UpdateTableOutput {
  /// Represents the properties of the table.
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

class UpdateTimeToLiveOutput {
  /// Represents the output of an `UpdateTimeToLive` operation.
  final TimeToLiveSpecification timeToLiveSpecification;

  UpdateTimeToLiveOutput({
    this.timeToLiveSpecification,
  });
  static UpdateTimeToLiveOutput fromJson(Map<String, dynamic> json) =>
      UpdateTimeToLiveOutput(
        timeToLiveSpecification: json.containsKey('TimeToLiveSpecification')
            ? TimeToLiveSpecification.fromJson(json['TimeToLiveSpecification'])
            : null,
      );
}

/// Represents an operation to perform - either `DeleteItem` or `PutItem`. You
/// can only request one of these operations, not both, in a single
/// `WriteRequest`. If you do need to perform both of these operations, you will
/// need to provide two separate `WriteRequest` objects.
class WriteRequest {
  /// A request to perform a `PutItem` operation.
  final PutRequest putRequest;

  /// A request to perform a `DeleteItem` operation.
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
