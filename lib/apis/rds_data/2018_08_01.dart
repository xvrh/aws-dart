import 'package:meta/meta.dart';

/// Amazon RDS Data Service
///
/// Amazon RDS provides an HTTP endpoint to run SQL statements on an Amazon
/// Aurora Serverless DB cluster. To run these statements, you work with the
/// Data Service API.
///
/// For more information about the Data Service API, see [Using the Data API for
/// Aurora
/// Serverless](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/data-api.html)
/// in the _Amazon Aurora User Guide_.
class RdsDataApi {
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
  Future<void> batchExecuteStatement(
      {String database,
      List<List<SqlParameter>> parameterSets,
      @required String resourceArn,
      String schema,
      @required String secretArn,
      @required String sql,
      String transactionId}) async {}

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
  Future<void> beginTransaction(
      {String database,
      @required String resourceArn,
      String schema,
      @required String secretArn}) async {}

  /// Ends a SQL transaction started with the `BeginTransaction` operation and
  /// commits the changes.
  Future<void> commitTransaction(
      {@required String resourceArn,
      @required String secretArn,
      @required String transactionId}) async {}

  /// Runs one or more SQL statements.
  ///
  ///
  ///
  /// This operation is deprecated. Use the `BatchExecuteStatement` or
  /// `ExecuteStatement` operation.
  Future<void> executeSql(
      {@required String awsSecretStoreArn,
      String database,
      @required String dbClusterOrInstanceArn,
      String schema,
      @required String sqlStatements}) async {}

  /// Runs a SQL statement against a database.
  ///
  ///  If a call isn't part of a transaction because it doesn't include the
  /// `transactionID` parameter, changes that result from the call are committed
  /// automatically.
  ///
  /// The response size limit is 1 MB or 1,000 records. If the call returns more
  /// than 1 MB of response data or over 1,000 records, the call is terminated.
  Future<void> executeStatement(
      {bool continueAfterTimeout,
      String database,
      bool includeResultMetadata,
      List<SqlParameter> parameters,
      @required String resourceArn,
      String schema,
      @required String secretArn,
      @required String sql,
      String transactionId}) async {}

  /// Performs a rollback of a transaction. Rolling back a transaction cancels
  /// its changes.
  Future<void> rollbackTransaction(
      {@required String resourceArn,
      @required String secretArn,
      @required String transactionId}) async {}
}

class ResultFrame {}

class CommitTransactionResponse {}

class SqlParameter {}

class Field {}

class StructValue {}

class Record {}

class Value {}

class ExecuteStatementResponse {}

class UpdateResult {}

class ExecuteSqlResponse {}

class SqlStatementResult {}

class RollbackTransactionResponse {}

class BatchExecuteStatementResponse {}

class ResultSetMetadata {}

class BeginTransactionResponse {}

class ColumnMetadata {}
