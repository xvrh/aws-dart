import 'package:meta/meta.dart';
import 'dart:typed_data';

/// The transactional data APIs for Amazon QLDB
class QldbSessionApi {
  final _client;
  QldbSessionApi(client)
      : _client = client.configured('QLDB Session', serializer: 'json');

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
    var response_ = await _client.send('SendCommand', {
      if (sessionToken != null) 'SessionToken': sessionToken,
      if (startSession != null) 'StartSession': startSession,
      if (startTransaction != null) 'StartTransaction': startTransaction,
      if (endSession != null) 'EndSession': endSession,
      if (commitTransaction != null) 'CommitTransaction': commitTransaction,
      if (abortTransaction != null) 'AbortTransaction': abortTransaction,
      if (executeStatement != null) 'ExecuteStatement': executeStatement,
      if (fetchPage != null) 'FetchPage': fetchPage,
    });
    return SendCommandResult.fromJson(response_);
  }
}

/// Contains the details of the transaction to abort.
class AbortTransactionRequest {
  AbortTransactionRequest();
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Contains the details of the aborted transaction.
class AbortTransactionResult {
  AbortTransactionResult();
  static AbortTransactionResult fromJson(Map<String, dynamic> json) =>
      AbortTransactionResult();
}

/// Contains the details of the transaction to commit.
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
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Contains the details of the committed transaction.
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
      CommitTransactionResult(
        transactionId: json.containsKey('TransactionId')
            ? json['TransactionId'] as String
            : null,
        commitDigest: json.containsKey('CommitDigest')
            ? Uint8List(json['CommitDigest'])
            : null,
      );
}

/// Specifies a request to end the session.
class EndSessionRequest {
  EndSessionRequest();
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Contains the details of the ended session.
class EndSessionResult {
  EndSessionResult();
  static EndSessionResult fromJson(Map<String, dynamic> json) =>
      EndSessionResult();
}

/// Specifies a request to execute a statement.
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
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Contains the details of the executed statement.
class ExecuteStatementResult {
  /// Contains the details of the first fetched page.
  final Page firstPage;

  ExecuteStatementResult({
    this.firstPage,
  });
  static ExecuteStatementResult fromJson(Map<String, dynamic> json) =>
      ExecuteStatementResult(
        firstPage: json.containsKey('FirstPage')
            ? Page.fromJson(json['FirstPage'])
            : null,
      );
}

/// Specifies the details of the page to be fetched.
class FetchPageRequest {
  /// Specifies the transaction id of the page to be fetched.
  final String transactionId;

  /// Specifies the next page token of the page to be fetched.
  final String nextPageToken;

  FetchPageRequest({
    @required this.transactionId,
    @required this.nextPageToken,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Contains the page that was fetched.
class FetchPageResult {
  /// Contains details of the fetched page.
  final Page page;

  FetchPageResult({
    this.page,
  });
  static FetchPageResult fromJson(Map<String, dynamic> json) => FetchPageResult(
        page: json.containsKey('Page') ? Page.fromJson(json['Page']) : null,
      );
}

/// Contains details of the fetched page.
class Page {
  /// A structure that contains values in multiple encoding formats.
  final List<ValueHolder> values;

  /// The token of the next page.
  final String nextPageToken;

  Page({
    this.values,
    this.nextPageToken,
  });
  static Page fromJson(Map<String, dynamic> json) => Page(
        values: json.containsKey('Values')
            ? (json['Values'] as List)
                .map((e) => ValueHolder.fromJson(e))
                .toList()
            : null,
        nextPageToken: json.containsKey('NextPageToken')
            ? json['NextPageToken'] as String
            : null,
      );
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
      SendCommandResult(
        startSession: json.containsKey('StartSession')
            ? StartSessionResult.fromJson(json['StartSession'])
            : null,
        startTransaction: json.containsKey('StartTransaction')
            ? StartTransactionResult.fromJson(json['StartTransaction'])
            : null,
        endSession: json.containsKey('EndSession')
            ? EndSessionResult.fromJson(json['EndSession'])
            : null,
        commitTransaction: json.containsKey('CommitTransaction')
            ? CommitTransactionResult.fromJson(json['CommitTransaction'])
            : null,
        abortTransaction: json.containsKey('AbortTransaction')
            ? AbortTransactionResult.fromJson(json['AbortTransaction'])
            : null,
        executeStatement: json.containsKey('ExecuteStatement')
            ? ExecuteStatementResult.fromJson(json['ExecuteStatement'])
            : null,
        fetchPage: json.containsKey('FetchPage')
            ? FetchPageResult.fromJson(json['FetchPage'])
            : null,
      );
}

/// Specifies a request to start a a new session.
class StartSessionRequest {
  /// The name of the ledger to start a new session against.
  final String ledgerName;

  StartSessionRequest({
    @required this.ledgerName,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Contains the details of the started session.
class StartSessionResult {
  /// Session token of the started session. This `SessionToken` is required for
  /// every subsequent command that is issued during the current session.
  final String sessionToken;

  StartSessionResult({
    this.sessionToken,
  });
  static StartSessionResult fromJson(Map<String, dynamic> json) =>
      StartSessionResult(
        sessionToken: json.containsKey('SessionToken')
            ? json['SessionToken'] as String
            : null,
      );
}

/// Specifies a request to start a transaction.
class StartTransactionRequest {
  StartTransactionRequest();
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Contains the details of the started transaction.
class StartTransactionResult {
  /// The transaction id of the started transaction.
  final String transactionId;

  StartTransactionResult({
    this.transactionId,
  });
  static StartTransactionResult fromJson(Map<String, dynamic> json) =>
      StartTransactionResult(
        transactionId: json.containsKey('TransactionId')
            ? json['TransactionId'] as String
            : null,
      );
}

/// A structure that can contains values in multiple encoding formats.
class ValueHolder {
  /// An Amazon Ion binary value contained in a `ValueHolder` structure.
  final Uint8List ionBinary;

  /// An Amazon Ion plaintext value contained in a `ValueHolder` structure.
  final String ionText;

  ValueHolder({
    this.ionBinary,
    this.ionText,
  });
  static ValueHolder fromJson(Map<String, dynamic> json) => ValueHolder(
        ionBinary:
            json.containsKey('IonBinary') ? Uint8List(json['IonBinary']) : null,
        ionText: json.containsKey('IonText') ? json['IonText'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}
