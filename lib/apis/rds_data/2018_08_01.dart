import 'package:meta/meta.dart';
import 'dart:typed_data';

/// Amazon RDS Data Service
///
/// Amazon RDS provides an HTTP endpoint to run SQL statements on an Amazon
/// Aurora Serverless DB cluster. To run these statements, you work with the
/// Data Service API.
///
/// For more information about the Data Service API, see
/// [Using the Data API for Aurora Serverless](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/data-api.html)
/// in the _Amazon Aurora User Guide_.
class RdsDataApi {
  final _client;
  RdsDataApi(client)
      : _client = client.configured('RDS Data', serializer: 'rest-json');

  /// Runs a batch SQL statement over an array of data.
  ///
  /// You can run bulk update and insert operations for multiple records using a
  /// DML statement with different parameter sets. Bulk operations can provide a
  /// significant performance improvement over individual insert and update
  /// operations.
  ///
  ///
  ///
  /// If a call isn't part of a transaction because it doesn't include the
  /// `transactionID` parameter, changes that result from the call are committed
  /// automatically.
  ///
  /// [database]: The name of the database.
  ///
  /// [parameterSets]: The parameter set for the batch operation.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the Aurora Serverless DB
  /// cluster.
  ///
  /// [schema]: The name of the database schema.
  ///
  /// [secretArn]: The name or ARN of the secret that enables access to the DB
  /// cluster.
  ///
  /// [sql]: The SQL statement to run.
  ///
  /// [transactionId]: The identifier of a transaction that was started by using
  /// the `BeginTransaction` operation. Specify the transaction ID of the
  /// transaction that you want to include the SQL statement in.
  ///
  /// If the SQL statement is not part of a transaction, don't set this
  /// parameter.
  Future<BatchExecuteStatementResponse> batchExecuteStatement(
      {String database,
      List<List<SqlParameter>> parameterSets,
      @required String resourceArn,
      String schema,
      @required String secretArn,
      @required String sql,
      String transactionId}) async {
    var response_ = await _client.send('BatchExecuteStatement', {
      if (database != null) 'database': database,
      if (parameterSets != null) 'parameterSets': parameterSets,
      'resourceArn': resourceArn,
      if (schema != null) 'schema': schema,
      'secretArn': secretArn,
      'sql': sql,
      if (transactionId != null) 'transactionId': transactionId,
    });
    return BatchExecuteStatementResponse.fromJson(response_);
  }

  /// Starts a SQL transaction.
  ///
  ///
  ///
  /// A transaction can run for a maximum of 24 hours. A transaction is
  /// terminated and rolled back automatically after 24 hours.
  ///
  /// A transaction times out if no calls use its transaction ID in three
  /// minutes. If a transaction times out before it's committed, it's rolled
  /// back automatically.
  ///
  /// DDL statements inside a transaction cause an implicit commit. We recommend
  /// that you run each DDL statement in a separate `ExecuteStatement` call with
  /// `continueAfterTimeout` enabled.
  ///
  /// [database]: The name of the database.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the Aurora Serverless DB
  /// cluster.
  ///
  /// [schema]: The name of the database schema.
  ///
  /// [secretArn]: The name or ARN of the secret that enables access to the DB
  /// cluster.
  Future<BeginTransactionResponse> beginTransaction(
      {String database,
      @required String resourceArn,
      String schema,
      @required String secretArn}) async {
    var response_ = await _client.send('BeginTransaction', {
      if (database != null) 'database': database,
      'resourceArn': resourceArn,
      if (schema != null) 'schema': schema,
      'secretArn': secretArn,
    });
    return BeginTransactionResponse.fromJson(response_);
  }

  /// Ends a SQL transaction started with the `BeginTransaction` operation and
  /// commits the changes.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the Aurora Serverless DB
  /// cluster.
  ///
  /// [secretArn]: The name or ARN of the secret that enables access to the DB
  /// cluster.
  ///
  /// [transactionId]: The identifier of the transaction to end and commit.
  Future<CommitTransactionResponse> commitTransaction(
      {@required String resourceArn,
      @required String secretArn,
      @required String transactionId}) async {
    var response_ = await _client.send('CommitTransaction', {
      'resourceArn': resourceArn,
      'secretArn': secretArn,
      'transactionId': transactionId,
    });
    return CommitTransactionResponse.fromJson(response_);
  }

  /// Runs one or more SQL statements.
  ///
  ///
  ///
  /// This operation is deprecated. Use the `BatchExecuteStatement` or
  /// `ExecuteStatement` operation.
  ///
  /// [awsSecretStoreArn]: The Amazon Resource Name (ARN) of the secret that
  /// enables access to the DB cluster.
  ///
  /// [database]: The name of the database.
  ///
  /// [dbClusterOrInstanceArn]: The ARN of the Aurora Serverless DB cluster.
  ///
  /// [schema]: The name of the database schema.
  ///
  /// [sqlStatements]: One or more SQL statements to run on the DB cluster.
  ///
  /// You can separate SQL statements from each other with a semicolon (;). Any
  /// valid SQL statement is permitted, including data definition, data
  /// manipulation, and commit statements.
  Future<ExecuteSqlResponse> executeSql(
      {@required String awsSecretStoreArn,
      String database,
      @required String dbClusterOrInstanceArn,
      String schema,
      @required String sqlStatements}) async {
    var response_ = await _client.send('ExecuteSql', {
      'awsSecretStoreArn': awsSecretStoreArn,
      if (database != null) 'database': database,
      'dbClusterOrInstanceArn': dbClusterOrInstanceArn,
      if (schema != null) 'schema': schema,
      'sqlStatements': sqlStatements,
    });
    return ExecuteSqlResponse.fromJson(response_);
  }

  /// Runs a SQL statement against a database.
  ///
  ///  If a call isn't part of a transaction because it doesn't include the
  /// `transactionID` parameter, changes that result from the call are committed
  /// automatically.
  ///
  /// The response size limit is 1 MB or 1,000 records. If the call returns more
  /// than 1 MB of response data or over 1,000 records, the call is terminated.
  ///
  /// [continueAfterTimeout]: A value that indicates whether to continue running
  /// the statement after the call times out. By default, the statement stops
  /// running when the call times out.
  ///
  ///
  ///
  /// For DDL statements, we recommend continuing to run the statement after the
  /// call times out. When a DDL statement terminates before it is finished
  /// running, it can result in errors and possibly corrupted data structures.
  ///
  /// [database]: The name of the database.
  ///
  /// [includeResultMetadata]: A value that indicates whether to include
  /// metadata in the results.
  ///
  /// [parameters]: The parameters for the SQL statement.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the Aurora Serverless DB
  /// cluster.
  ///
  /// [schema]: The name of the database schema.
  ///
  /// [secretArn]: The name or ARN of the secret that enables access to the DB
  /// cluster.
  ///
  /// [sql]: The SQL statement to run.
  ///
  /// [transactionId]: The identifier of a transaction that was started by using
  /// the `BeginTransaction` operation. Specify the transaction ID of the
  /// transaction that you want to include the SQL statement in.
  ///
  /// If the SQL statement is not part of a transaction, don't set this
  /// parameter.
  Future<ExecuteStatementResponse> executeStatement(
      {bool continueAfterTimeout,
      String database,
      bool includeResultMetadata,
      List<SqlParameter> parameters,
      @required String resourceArn,
      String schema,
      @required String secretArn,
      @required String sql,
      String transactionId}) async {
    var response_ = await _client.send('ExecuteStatement', {
      if (continueAfterTimeout != null)
        'continueAfterTimeout': continueAfterTimeout,
      if (database != null) 'database': database,
      if (includeResultMetadata != null)
        'includeResultMetadata': includeResultMetadata,
      if (parameters != null) 'parameters': parameters,
      'resourceArn': resourceArn,
      if (schema != null) 'schema': schema,
      'secretArn': secretArn,
      'sql': sql,
      if (transactionId != null) 'transactionId': transactionId,
    });
    return ExecuteStatementResponse.fromJson(response_);
  }

  /// Performs a rollback of a transaction. Rolling back a transaction cancels
  /// its changes.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the Aurora Serverless DB
  /// cluster.
  ///
  /// [secretArn]: The name or ARN of the secret that enables access to the DB
  /// cluster.
  ///
  /// [transactionId]: The identifier of the transaction to roll back.
  Future<RollbackTransactionResponse> rollbackTransaction(
      {@required String resourceArn,
      @required String secretArn,
      @required String transactionId}) async {
    var response_ = await _client.send('RollbackTransaction', {
      'resourceArn': resourceArn,
      'secretArn': secretArn,
      'transactionId': transactionId,
    });
    return RollbackTransactionResponse.fromJson(response_);
  }
}

/// The result set returned by a SQL statement.
class ResultFrame {
  /// The records in the result set.
  final List<Record> records;

  /// The result-set metadata in the result set.
  final ResultSetMetadata resultSetMetadata;

  ResultFrame({
    this.records,
    this.resultSetMetadata,
  });
  static ResultFrame fromJson(Map<String, dynamic> json) => ResultFrame(
        records: json.containsKey('records')
            ? (json['records'] as List).map((e) => Record.fromJson(e)).toList()
            : null,
        resultSetMetadata: json.containsKey('resultSetMetadata')
            ? ResultSetMetadata.fromJson(json['resultSetMetadata'])
            : null,
      );
}

/// The response elements represent the output of a commit transaction request.
class CommitTransactionResponse {
  /// The status of the commit operation.
  final String transactionStatus;

  CommitTransactionResponse({
    this.transactionStatus,
  });
  static CommitTransactionResponse fromJson(Map<String, dynamic> json) =>
      CommitTransactionResponse(
        transactionStatus: json.containsKey('transactionStatus')
            ? json['transactionStatus'] as String
            : null,
      );
}

/// A parameter used in a SQL statement.
class SqlParameter {
  /// The name of the parameter.
  final String name;

  /// The value of the parameter.
  final Field value;

  SqlParameter({
    this.name,
    this.value,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Contains a value.
class Field {
  /// A value of BLOB data type.
  final Uint8List blobValue;

  /// A value of Boolean data type.
  final bool booleanValue;

  /// A value of double data type.
  final double doubleValue;

  /// A NULL value.
  final bool isNull;

  /// A value of long data type.
  final BigInt longValue;

  /// A value of string data type.
  final String stringValue;

  Field({
    this.blobValue,
    this.booleanValue,
    this.doubleValue,
    this.isNull,
    this.longValue,
    this.stringValue,
  });
  static Field fromJson(Map<String, dynamic> json) => Field(
        blobValue:
            json.containsKey('blobValue') ? Uint8List(json['blobValue']) : null,
        booleanValue: json.containsKey('booleanValue')
            ? json['booleanValue'] as bool
            : null,
        doubleValue: json.containsKey('doubleValue')
            ? json['doubleValue'] as double
            : null,
        isNull: json.containsKey('isNull') ? json['isNull'] as bool : null,
        longValue: json.containsKey('longValue')
            ? BigInt.from(json['longValue'])
            : null,
        stringValue: json.containsKey('stringValue')
            ? json['stringValue'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A structure value returned by a call.
class StructValue {
  /// The attributes returned in the record.
  final List<Value> attributes;

  StructValue({
    this.attributes,
  });
  static StructValue fromJson(Map<String, dynamic> json) => StructValue(
        attributes: json.containsKey('attributes')
            ? (json['attributes'] as List)
                .map((e) => Value.fromJson(e))
                .toList()
            : null,
      );
}

/// A record returned by a call.
class Record {
  /// The values returned in the record.
  final List<Value> values;

  Record({
    this.values,
  });
  static Record fromJson(Map<String, dynamic> json) => Record(
        values: json.containsKey('values')
            ? (json['values'] as List).map((e) => Value.fromJson(e)).toList()
            : null,
      );
}

/// Contains the value of a column.
class Value {
  /// An array of column values.
  final List<Value> arrayValues;

  /// A value for a column of big integer data type.
  final BigInt bigIntValue;

  /// A value for a column of BIT data type.
  final bool bitValue;

  /// A value for a column of BLOB data type.
  final Uint8List blobValue;

  /// A value for a column of double data type.
  final double doubleValue;

  /// A value for a column of integer data type.
  final int intValue;

  /// A NULL value.
  final bool isNull;

  /// A value for a column of real data type.
  final double realValue;

  /// A value for a column of string data type.
  final String stringValue;

  /// A value for a column of STRUCT data type.
  final StructValue structValue;

  Value({
    this.arrayValues,
    this.bigIntValue,
    this.bitValue,
    this.blobValue,
    this.doubleValue,
    this.intValue,
    this.isNull,
    this.realValue,
    this.stringValue,
    this.structValue,
  });
  static Value fromJson(Map<String, dynamic> json) => Value(
        arrayValues: json.containsKey('arrayValues')
            ? (json['arrayValues'] as List)
                .map((e) => Value.fromJson(e))
                .toList()
            : null,
        bigIntValue: json.containsKey('bigIntValue')
            ? BigInt.from(json['bigIntValue'])
            : null,
        bitValue:
            json.containsKey('bitValue') ? json['bitValue'] as bool : null,
        blobValue:
            json.containsKey('blobValue') ? Uint8List(json['blobValue']) : null,
        doubleValue: json.containsKey('doubleValue')
            ? json['doubleValue'] as double
            : null,
        intValue: json.containsKey('intValue') ? json['intValue'] as int : null,
        isNull: json.containsKey('isNull') ? json['isNull'] as bool : null,
        realValue:
            json.containsKey('realValue') ? json['realValue'] as double : null,
        stringValue: json.containsKey('stringValue')
            ? json['stringValue'] as String
            : null,
        structValue: json.containsKey('structValue')
            ? StructValue.fromJson(json['structValue'])
            : null,
      );
}

/// The response elements represent the output of a request to run a SQL
/// statement against a database.
class ExecuteStatementResponse {
  /// Metadata for the columns included in the results.
  final List<ColumnMetadata> columnMetadata;

  /// Values for fields generated during the request.
  final List<Field> generatedFields;

  /// The number of records updated by the request.
  final BigInt numberOfRecordsUpdated;

  /// The records returned by the SQL statement.
  final List<List<Field>> records;

  ExecuteStatementResponse({
    this.columnMetadata,
    this.generatedFields,
    this.numberOfRecordsUpdated,
    this.records,
  });
  static ExecuteStatementResponse fromJson(Map<String, dynamic> json) =>
      ExecuteStatementResponse(
        columnMetadata: json.containsKey('columnMetadata')
            ? (json['columnMetadata'] as List)
                .map((e) => ColumnMetadata.fromJson(e))
                .toList()
            : null,
        generatedFields: json.containsKey('generatedFields')
            ? (json['generatedFields'] as List)
                .map((e) => Field.fromJson(e))
                .toList()
            : null,
        numberOfRecordsUpdated: json.containsKey('numberOfRecordsUpdated')
            ? BigInt.from(json['numberOfRecordsUpdated'])
            : null,
        records: json.containsKey('records')
            ? (json['records'] as List)
                .map((e) => (e as List).map((e) => Field.fromJson(e)).toList())
                .toList()
            : null,
      );
}

/// The response elements represent the results of an update.
class UpdateResult {
  /// Values for fields generated during the request.
  final List<Field> generatedFields;

  UpdateResult({
    this.generatedFields,
  });
  static UpdateResult fromJson(Map<String, dynamic> json) => UpdateResult(
        generatedFields: json.containsKey('generatedFields')
            ? (json['generatedFields'] as List)
                .map((e) => Field.fromJson(e))
                .toList()
            : null,
      );
}

/// The response elements represent the output of a request to run one or more
/// SQL statements.
class ExecuteSqlResponse {
  /// The results of the SQL statement or statements.
  final List<SqlStatementResult> sqlStatementResults;

  ExecuteSqlResponse({
    this.sqlStatementResults,
  });
  static ExecuteSqlResponse fromJson(Map<String, dynamic> json) =>
      ExecuteSqlResponse(
        sqlStatementResults: json.containsKey('sqlStatementResults')
            ? (json['sqlStatementResults'] as List)
                .map((e) => SqlStatementResult.fromJson(e))
                .toList()
            : null,
      );
}

/// The result of a SQL statement.
class SqlStatementResult {
  /// The number of records updated by a SQL statement.
  final BigInt numberOfRecordsUpdated;

  /// The result set of the SQL statement.
  final ResultFrame resultFrame;

  SqlStatementResult({
    this.numberOfRecordsUpdated,
    this.resultFrame,
  });
  static SqlStatementResult fromJson(Map<String, dynamic> json) =>
      SqlStatementResult(
        numberOfRecordsUpdated: json.containsKey('numberOfRecordsUpdated')
            ? BigInt.from(json['numberOfRecordsUpdated'])
            : null,
        resultFrame: json.containsKey('resultFrame')
            ? ResultFrame.fromJson(json['resultFrame'])
            : null,
      );
}

/// The response elements represent the output of a request to perform a
/// rollback of a transaction.
class RollbackTransactionResponse {
  /// The status of the rollback operation.
  final String transactionStatus;

  RollbackTransactionResponse({
    this.transactionStatus,
  });
  static RollbackTransactionResponse fromJson(Map<String, dynamic> json) =>
      RollbackTransactionResponse(
        transactionStatus: json.containsKey('transactionStatus')
            ? json['transactionStatus'] as String
            : null,
      );
}

/// The response elements represent the output of a SQL statement over an array
/// of data.
class BatchExecuteStatementResponse {
  /// The execution results of each batch entry.
  final List<UpdateResult> updateResults;

  BatchExecuteStatementResponse({
    this.updateResults,
  });
  static BatchExecuteStatementResponse fromJson(Map<String, dynamic> json) =>
      BatchExecuteStatementResponse(
        updateResults: json.containsKey('updateResults')
            ? (json['updateResults'] as List)
                .map((e) => UpdateResult.fromJson(e))
                .toList()
            : null,
      );
}

/// The metadata of the result set returned by a SQL statement.
class ResultSetMetadata {
  /// The number of columns in the result set.
  final BigInt columnCount;

  /// The metadata of the columns in the result set.
  final List<ColumnMetadata> columnMetadata;

  ResultSetMetadata({
    this.columnCount,
    this.columnMetadata,
  });
  static ResultSetMetadata fromJson(Map<String, dynamic> json) =>
      ResultSetMetadata(
        columnCount: json.containsKey('columnCount')
            ? BigInt.from(json['columnCount'])
            : null,
        columnMetadata: json.containsKey('columnMetadata')
            ? (json['columnMetadata'] as List)
                .map((e) => ColumnMetadata.fromJson(e))
                .toList()
            : null,
      );
}

/// The response elements represent the output of a request to start a SQL
/// transaction.
class BeginTransactionResponse {
  /// The transaction ID of the transaction started by the call.
  final String transactionId;

  BeginTransactionResponse({
    this.transactionId,
  });
  static BeginTransactionResponse fromJson(Map<String, dynamic> json) =>
      BeginTransactionResponse(
        transactionId: json.containsKey('transactionId')
            ? json['transactionId'] as String
            : null,
      );
}

/// Contains the metadata for a column.
class ColumnMetadata {
  /// The type of the column.
  final int arrayBaseColumnType;

  /// A value that indicates whether the column increments automatically.
  final bool isAutoIncrement;

  /// A value that indicates whether the column is case-sensitive.
  final bool isCaseSensitive;

  /// A value that indicates whether the column contains currency values.
  final bool isCurrency;

  /// A value that indicates whether an integer column is signed.
  final bool isSigned;

  /// The label for the column.
  final String label;

  /// The name of the column.
  final String name;

  /// A value that indicates whether the column is nullable.
  final int nullable;

  /// The precision value of a decimal number column.
  final int precision;

  /// The scale value of a decimal number column.
  final int scale;

  /// The name of the schema that owns the table that includes the column.
  final String schemaName;

  /// The name of the table that includes the column.
  final String tableName;

  /// The type of the column.
  final int type;

  /// The database-specific data type of the column.
  final String typeName;

  ColumnMetadata({
    this.arrayBaseColumnType,
    this.isAutoIncrement,
    this.isCaseSensitive,
    this.isCurrency,
    this.isSigned,
    this.label,
    this.name,
    this.nullable,
    this.precision,
    this.scale,
    this.schemaName,
    this.tableName,
    this.type,
    this.typeName,
  });
  static ColumnMetadata fromJson(Map<String, dynamic> json) => ColumnMetadata(
        arrayBaseColumnType: json.containsKey('arrayBaseColumnType')
            ? json['arrayBaseColumnType'] as int
            : null,
        isAutoIncrement: json.containsKey('isAutoIncrement')
            ? json['isAutoIncrement'] as bool
            : null,
        isCaseSensitive: json.containsKey('isCaseSensitive')
            ? json['isCaseSensitive'] as bool
            : null,
        isCurrency:
            json.containsKey('isCurrency') ? json['isCurrency'] as bool : null,
        isSigned:
            json.containsKey('isSigned') ? json['isSigned'] as bool : null,
        label: json.containsKey('label') ? json['label'] as String : null,
        name: json.containsKey('name') ? json['name'] as String : null,
        nullable: json.containsKey('nullable') ? json['nullable'] as int : null,
        precision:
            json.containsKey('precision') ? json['precision'] as int : null,
        scale: json.containsKey('scale') ? json['scale'] as int : null,
        schemaName: json.containsKey('schemaName')
            ? json['schemaName'] as String
            : null,
        tableName:
            json.containsKey('tableName') ? json['tableName'] as String : null,
        type: json.containsKey('type') ? json['type'] as int : null,
        typeName:
            json.containsKey('typeName') ? json['typeName'] as String : null,
      );
}
