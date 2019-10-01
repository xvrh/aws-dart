import 'package:meta/meta.dart';
import 'dart:typed_data';

/// The transactional data APIs for Amazon QLDB
class QldbSessionApi {
  /// Sends a command to an Amazon QLDB ledger.
  ///
  /// [sessionToken]: Specifies the session token for the current command. A
  /// session token is constant throughout the life of the session.
  ///
  /// To obtain a session token, run the `StartSession` command. This
  /// `SessionToken` is required for every subsequent command that is issued
  /// during the current session.
  ///
  /// [startSession]: Command to start a new session. A session token is
  /// obtained as part of the response.
  ///
  /// [startTransaction]: Command to start a new transaction.
  ///
  /// [endSession]: Command to end the current session.
  ///
  /// [commitTransaction]: Command to commit the specified transaction.
  ///
  /// [abortTransaction]: Command to abort the current transaction.
  ///
  /// [executeStatement]: Command to execute a statement in the specified
  /// transaction.
  ///
  /// [fetchPage]: Command to fetch a page.
  Future<SendCommandResult> sendCommand(
      {String sessionToken,
      StartSessionRequest startSession,
      StartTransactionRequest startTransaction,
      EndSessionRequest endSession,
      CommitTransactionRequest commitTransaction,
      AbortTransactionRequest abortTransaction,
      ExecuteStatementRequest executeStatement,
      FetchPageRequest fetchPage}) async {
    return SendCommandResult.fromJson({});
  }
}

class AbortTransactionRequest {
  AbortTransactionRequest();
}

class AbortTransactionResult {
  AbortTransactionResult();
  static AbortTransactionResult fromJson(Map<String, dynamic> json) =>
      AbortTransactionResult();
}

class CommitTransactionRequest {
  /// Specifies the transaction id of the transaction to commit.
  final String transactionId;

  /// Specifies the commit digest for the transaction to commit. For every
  /// active transaction, the commit digest must be passed. QLDB validates
  /// `CommitDigest` and rejects the commit with an error if the digest computed
  /// on the client does not match the digest computed by QLDB.
  final Uint8List commitDigest;

  CommitTransactionRequest({
    @required this.transactionId,
    @required this.commitDigest,
  });
}

class CommitTransactionResult {
  /// The transaction id of the committed transaction.
  final String transactionId;

  /// The commit digest of the committed transaction.
  final Uint8List commitDigest;

  CommitTransactionResult({
    this.transactionId,
    this.commitDigest,
  });
  static CommitTransactionResult fromJson(Map<String, dynamic> json) =>
      CommitTransactionResult();
}

class EndSessionRequest {
  EndSessionRequest();
}

class EndSessionResult {
  EndSessionResult();
  static EndSessionResult fromJson(Map<String, dynamic> json) =>
      EndSessionResult();
}

class ExecuteStatementRequest {
  /// Specifies the transaction id of the request.
  final String transactionId;

  /// Specifies the statement of the request.
  final String statement;

  /// Specifies the parameters for the parameterized statement in the request.
  final List<ValueHolder> parameters;

  ExecuteStatementRequest({
    @required this.transactionId,
    @required this.statement,
    this.parameters,
  });
}

class ExecuteStatementResult {
  /// Contains the details of the first fetched page.
  final Page firstPage;

  ExecuteStatementResult({
    this.firstPage,
  });
  static ExecuteStatementResult fromJson(Map<String, dynamic> json) =>
      ExecuteStatementResult();
}

class FetchPageRequest {
  /// Specifies the transaction id of the page to be fetched.
  final String transactionId;

  /// Specifies the next page token of the page to be fetched.
  final String nextPageToken;

  FetchPageRequest({
    @required this.transactionId,
    @required this.nextPageToken,
  });
}

class FetchPageResult {
  /// Contains details of the fetched page.
  final Page page;

  FetchPageResult({
    this.page,
  });
  static FetchPageResult fromJson(Map<String, dynamic> json) =>
      FetchPageResult();
}

class Page {
  /// A structure that contains values in multiple encoding formats.
  final List<ValueHolder> values;

  /// The token of the next page.
  final String nextPageToken;

  Page({
    this.values,
    this.nextPageToken,
  });
  static Page fromJson(Map<String, dynamic> json) => Page();
}

class SendCommandResult {
  /// Contains the details of the started session that includes a session token.
  /// This `SessionToken` is required for every subsequent command that is
  /// issued during the current session.
  final StartSessionResult startSession;

  /// Contains the details of the started transaction.
  final StartTransactionResult startTransaction;

  /// Contains the details of the ended session.
  final EndSessionResult endSession;

  /// Contains the details of the committed transaction.
  final CommitTransactionResult commitTransaction;

  /// Contains the details of the aborted transaction.
  final AbortTransactionResult abortTransaction;

  /// Contains the details of the executed statement.
  final ExecuteStatementResult executeStatement;

  /// Contains the details of the fetched page.
  final FetchPageResult fetchPage;

  SendCommandResult({
    this.startSession,
    this.startTransaction,
    this.endSession,
    this.commitTransaction,
    this.abortTransaction,
    this.executeStatement,
    this.fetchPage,
  });
  static SendCommandResult fromJson(Map<String, dynamic> json) =>
      SendCommandResult();
}

class StartSessionRequest {
  /// The name of the ledger to start a new session against.
  final String ledgerName;

  StartSessionRequest({
    @required this.ledgerName,
  });
}

class StartSessionResult {
  /// Session token of the started session. This `SessionToken` is required for
  /// every subsequent command that is issued during the current session.
  final String sessionToken;

  StartSessionResult({
    this.sessionToken,
  });
  static StartSessionResult fromJson(Map<String, dynamic> json) =>
      StartSessionResult();
}

class StartTransactionRequest {
  StartTransactionRequest();
}

class StartTransactionResult {
  /// The transaction id of the started transaction.
  final String transactionId;

  StartTransactionResult({
    this.transactionId,
  });
  static StartTransactionResult fromJson(Map<String, dynamic> json) =>
      StartTransactionResult();
}

class ValueHolder {
  /// An Amazon Ion binary value contained in a `ValueHolder` structure.
  final Uint8List ionBinary;

  /// An Amazon Ion plaintext value contained in a `ValueHolder` structure.
  final String ionText;

  ValueHolder({
    this.ionBinary,
    this.ionText,
  });
  static ValueHolder fromJson(Map<String, dynamic> json) => ValueHolder();
}
