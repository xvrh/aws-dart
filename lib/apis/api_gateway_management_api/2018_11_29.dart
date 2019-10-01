import 'package:meta/meta.dart';
import 'dart:typed_data';

/// The Amazon API Gateway Management API allows you to directly manage runtime
/// aspects of your deployed APIs. To use it, you must explicitly set the SDK's
/// endpoint to point to the endpoint of your deployed API. The endpoint will be
/// of the form https://{api-id}.execute-api.{region}.amazonaws.com/{stage}, or
/// will be the endpoint corresponding to your API's custom domain and base
/// path, if applicable.
class ApiGatewayManagementApiApi {
  /// Delete the connection with the provided id.
  Future<void> deleteConnection(String connectionId) async {}

  /// Get information about the connection with the provided id.
  Future<void> getConnection(String connectionId) async {}

  /// Sends the provided data to the specified connection.
  Future<void> postToConnection(
      {@required Uint8List data, @required String connectionId}) async {}
}

class GetConnectionResponse {}

class Identity {}
