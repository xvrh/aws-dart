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
  Future<void> deleteThingShadow(String thingName) async {}

  /// Gets the thing shadow for the specified thing.
  ///
  /// For more information, see
  /// [GetThingShadow](http://docs.aws.amazon.com/iot/latest/developerguide/API_GetThingShadow.html)
  /// in the _AWS IoT Developer Guide_.
  Future<void> getThingShadow(String thingName) async {}

  /// Publishes state information.
  ///
  /// For more information, see [HTTP
  /// Protocol](http://docs.aws.amazon.com/iot/latest/developerguide/protocols.html#http)
  /// in the _AWS IoT Developer Guide_.
  Future<void> publish(String topic, {int qos, Uint8List payload}) async {}

  /// Updates the thing shadow for the specified thing.
  ///
  /// For more information, see
  /// [UpdateThingShadow](http://docs.aws.amazon.com/iot/latest/developerguide/API_UpdateThingShadow.html)
  /// in the _AWS IoT Developer Guide_.
  Future<void> updateThingShadow(
      {@required String thingName, @required Uint8List payload}) async {}
}

class DeleteThingShadowResponse {}

class GetThingShadowResponse {}

class UpdateThingShadowResponse {}
