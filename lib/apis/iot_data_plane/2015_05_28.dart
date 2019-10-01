import 'package:meta/meta.dart';
import 'dart:typed_data';

/// AWS IoT
///
/// AWS IoT-Data enables secure, bi-directional communication between
/// Internet-connected things (such as sensors, actuators, embedded devices, or
/// smart appliances) and the AWS cloud. It implements a broker for applications
/// and things to publish messages over HTTP (Publish) and retrieve, update, and
/// delete thing shadows. A thing shadow is a persistent representation of your
/// things and their state in the AWS cloud.
class IotDataPlaneApi {
  /// Deletes the thing shadow for the specified thing.
  ///
  /// For more information, see
  /// [DeleteThingShadow](http://docs.aws.amazon.com/iot/latest/developerguide/API_DeleteThingShadow.html)
  /// in the _AWS IoT Developer Guide_.
  ///
  /// [thingName]: The name of the thing.
  Future<DeleteThingShadowResponse> deleteThingShadow(String thingName) async {
    return DeleteThingShadowResponse.fromJson({});
  }

  /// Gets the thing shadow for the specified thing.
  ///
  /// For more information, see
  /// [GetThingShadow](http://docs.aws.amazon.com/iot/latest/developerguide/API_GetThingShadow.html)
  /// in the _AWS IoT Developer Guide_.
  ///
  /// [thingName]: The name of the thing.
  Future<GetThingShadowResponse> getThingShadow(String thingName) async {
    return GetThingShadowResponse.fromJson({});
  }

  /// Publishes state information.
  ///
  /// For more information, see
  /// [HTTP Protocol](http://docs.aws.amazon.com/iot/latest/developerguide/protocols.html#http)
  /// in the _AWS IoT Developer Guide_.
  ///
  /// [topic]: The name of the MQTT topic.
  ///
  /// [qos]: The Quality of Service (QoS) level.
  ///
  /// [payload]: The state information, in JSON format.
  Future<void> publish(String topic, {int qos, Uint8List payload}) async {}

  /// Updates the thing shadow for the specified thing.
  ///
  /// For more information, see
  /// [UpdateThingShadow](http://docs.aws.amazon.com/iot/latest/developerguide/API_UpdateThingShadow.html)
  /// in the _AWS IoT Developer Guide_.
  ///
  /// [thingName]: The name of the thing.
  ///
  /// [payload]: The state information, in JSON format.
  Future<UpdateThingShadowResponse> updateThingShadow(
      {@required String thingName, @required Uint8List payload}) async {
    return UpdateThingShadowResponse.fromJson({});
  }
}

/// The output from the DeleteThingShadow operation.
class DeleteThingShadowResponse {
  /// The state information, in JSON format.
  final Uint8List payload;

  DeleteThingShadowResponse({
    @required this.payload,
  });
  static DeleteThingShadowResponse fromJson(Map<String, dynamic> json) =>
      DeleteThingShadowResponse();
}

/// The output from the GetThingShadow operation.
class GetThingShadowResponse {
  /// The state information, in JSON format.
  final Uint8List payload;

  GetThingShadowResponse({
    this.payload,
  });
  static GetThingShadowResponse fromJson(Map<String, dynamic> json) =>
      GetThingShadowResponse();
}

/// The output from the UpdateThingShadow operation.
class UpdateThingShadowResponse {
  /// The state information, in JSON format.
  final Uint8List payload;

  UpdateThingShadowResponse({
    this.payload,
  });
  static UpdateThingShadowResponse fromJson(Map<String, dynamic> json) =>
      UpdateThingShadowResponse();
}
