import 'package:meta/meta.dart';

/// The WorkMail Message Flow API provides access to email messages as they are
/// being sent and received by a WorkMail organization.
class WorkMailMessageFlowApi {
  /// Retrieves the raw content of an in-transit email message, in MIME format.
  Future<void> getRawMessageContent(String messageId) async {}
}

class GetRawMessageContentResponse {}
