import 'package:meta/meta.dart';
import 'dart:typed_data';

/// The WorkMail Message Flow API provides access to email messages as they are
/// being sent and received by a WorkMail organization.
class WorkMailMessageFlowApi {
  final _client;
  WorkMailMessageFlowApi(client)
      : _client =
            client.configured('WorkMailMessageFlow', serializer: 'rest-json');

  /// Retrieves the raw content of an in-transit email message, in MIME format.
  ///
  /// [messageId]: The identifier of the email message to retrieve.
  Future<GetRawMessageContentResponse> getRawMessageContent(
      String messageId) async {
    var response_ = await _client.send('GetRawMessageContent', {
      'messageId': messageId,
    });
    return GetRawMessageContentResponse.fromJson(response_);
  }
}

class GetRawMessageContentResponse {
  /// The raw content of the email message, in MIME format.
  final Uint8List messageContent;

  GetRawMessageContentResponse({
    @required this.messageContent,
  });
  static GetRawMessageContentResponse fromJson(Map<String, dynamic> json) =>
      GetRawMessageContentResponse(
        messageContent: Uint8List(json['messageContent']),
      );
}
