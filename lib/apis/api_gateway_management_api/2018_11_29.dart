import 'package:meta/meta.dart';
import 'dart:typed_data';

/// The Amazon API Gateway Management API allows you to directly manage runtime
/// aspects of your deployed APIs. To use it, you must explicitly set the SDK's
/// endpoint to point to the endpoint of your deployed API. The endpoint will be
/// of the form https://{api-id}.execute-api.{region}.amazonaws.com/{stage}, or
/// will be the endpoint corresponding to your API's custom domain and base
/// path, if applicable.
class ApiGatewayManagementApiApi {
  final _client;
  ApiGatewayManagementApiApi(client)
      : _client = client.configured('ApiGatewayManagementApi',
            serializer: 'rest-json');

  /// Delete the connection with the provided id.
  Future<void> deleteConnection(String connectionId) async {
    await _client.send('DeleteConnection', {
      'ConnectionId': connectionId,
    });
  }

  /// Get information about the connection with the provided id.
  Future<GetConnectionResponse> getConnection(String connectionId) async {
    var response_ = await _client.send('GetConnection', {
      'ConnectionId': connectionId,
    });
    return GetConnectionResponse.fromJson(response_);
  }

  /// Sends the provided data to the specified connection.
  ///
  /// [data]: The data to be sent to the client specified by its connection id.
  ///
  /// [connectionId]: The identifier of the connection that a specific client is
  /// using.
  Future<void> postToConnection(
      {@required Uint8List data, @required String connectionId}) async {
    await _client.send('PostToConnection', {
      'Data': data,
      'ConnectionId': connectionId,
    });
  }
}

class GetConnectionResponse {
  /// The time in ISO 8601 format for when the connection was established.
  final DateTime connectedAt;

  final Identity identity;

  /// The time in ISO 8601 format for when the connection was last active.
  final DateTime lastActiveAt;

  GetConnectionResponse({
    this.connectedAt,
    this.identity,
    this.lastActiveAt,
  });
  static GetConnectionResponse fromJson(Map<String, dynamic> json) =>
      GetConnectionResponse(
        connectedAt: json.containsKey('ConnectedAt')
            ? DateTime.parse(json['ConnectedAt'])
            : null,
        identity: json.containsKey('Identity')
            ? Identity.fromJson(json['Identity'])
            : null,
        lastActiveAt: json.containsKey('LastActiveAt')
            ? DateTime.parse(json['LastActiveAt'])
            : null,
      );
}

class Identity {
  /// The source IP address of the TCP connection making the request to API
  /// Gateway.
  final String sourceIp;

  /// The User Agent of the API caller.
  final String userAgent;

  Identity({
    @required this.sourceIp,
    @required this.userAgent,
  });
  static Identity fromJson(Map<String, dynamic> json) => Identity(
        sourceIp: json['SourceIp'] as String,
        userAgent: json['UserAgent'] as String,
      );
}
