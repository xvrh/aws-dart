import 'package:meta/meta.dart';

/// The transactional data APIs for Amazon QLDB
class QldbSessionApi {
  /// Sends a command to an Amazon QLDB ledger.
  Future<void> sendCommand(
      {String sessionToken,
      StartSessionRequest startSession,
      StartTransactionRequest startTransaction,
      EndSessionRequest endSession,
      CommitTransactionRequest commitTransaction,
      AbortTransactionRequest abortTransaction,
      ExecuteStatementRequest executeStatement,
      FetchPageRequest fetchPage}) async {}
}

class AbortTransactionRequest {}

class AbortTransactionResult {}

class CommitTransactionRequest {}

class CommitTransactionResult {}

class EndSessionRequest {}

class EndSessionResult {}

class ExecuteStatementRequest {}

class ExecuteStatementResult {}

class FetchPageRequest {}

class FetchPageResult {}

class Page {}

class SendCommandResult {}

class StartSessionRequest {}

class StartSessionResult {}

class StartTransactionRequest {}

class StartTransactionResult {}

class ValueHolder {}
