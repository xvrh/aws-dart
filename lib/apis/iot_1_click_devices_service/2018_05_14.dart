import 'package:meta/meta.dart';

/// Describes all of the AWS IoT 1-Click device-related API operations for the
/// service. Also provides sample requests, responses, and errors for the
/// supported web services protocols.
class Iot1ClickDevicesServiceApi {
  /// Adds device(s) to your account (i.e., claim one or more devices) if and
  /// only if you received a claim code with the device(s).
  Future<void> claimDevicesByClaimCode(String claimCode) async {}

  /// Given a device ID, returns a DescribeDeviceResponse object describing the
  /// details of the device.
  Future<void> describeDevice(String deviceId) async {}

  /// Given a device ID, finalizes the claim request for the associated device.
  ///
  /// Claiming a device consists of initiating a claim, then publishing a device
  /// event, and finalizing the claim. For a device of type button, a device
  /// event can be published by simply clicking the device.
  Future<void> finalizeDeviceClaim(String deviceId,
      {Map<String, String> tags}) async {}

  /// Given a device ID, returns the invokable methods associated with the
  /// device.
  Future<void> getDeviceMethods(String deviceId) async {}

  /// Given a device ID, initiates a claim request for the associated device.
  ///
  /// Claiming a device consists of initiating a claim, then publishing a device
  /// event, and finalizing the claim. For a device of type button, a device
  /// event can be published by simply clicking the device.
  Future<void> initiateDeviceClaim(String deviceId) async {}

  /// Given a device ID, issues a request to invoke a named device method (with
  /// possible parameters). See the "Example POST" code snippet below.
  Future<void> invokeDeviceMethod(String deviceId,
      {DeviceMethod deviceMethod, String deviceMethodParameters}) async {}

  /// Using a device ID, returns a DeviceEventsResponse object containing an
  /// array of events for the device.
  Future<void> listDeviceEvents(
      {@required String deviceId,
      @required DateTime fromTimeStamp,
      int maxResults,
      String nextToken,
      @required DateTime toTimeStamp}) async {}

  /// Lists the 1-Click compatible devices associated with your AWS account.
  Future<void> listDevices(
      {String deviceType, int maxResults, String nextToken}) async {}

  /// Lists the tags associated with the specified resource ARN.
  Future<void> listTagsForResource(String resourceArn) async {}

  /// Adds or updates the tags associated with the resource ARN. See [AWS IoT
  /// 1-Click Service
  /// Limits](https://docs.aws.amazon.com/iot-1-click/latest/developerguide/1click-appendix.html#1click-limits)
  /// for the maximum number of tags allowed per resource.
  Future<void> tagResource(
      {@required String resourceArn,
      @required Map<String, String> tags}) async {}

  /// Disassociates a device from your AWS account using its device ID.
  Future<void> unclaimDevice(String deviceId) async {}

  /// Using tag keys, deletes the tags (key/value pairs) associated with the
  /// specified resource ARN.
  Future<void> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {}

  /// Using a Boolean value (true or false), this operation enables or disables
  /// the device given a device ID.
  Future<void> updateDeviceState(String deviceId, {bool enabled}) async {}
}

class Attributes {}

class ClaimDevicesByClaimCodeResponse {}

class DescribeDeviceResponse {}

class Device {}

class DeviceDescription {}

class DeviceEvent {}

class DeviceMethod {}

class FinalizeDeviceClaimResponse {}

class GetDeviceMethodsResponse {}

class InitiateDeviceClaimResponse {}

class InvokeDeviceMethodResponse {}

class ListDeviceEventsResponse {}

class ListDevicesResponse {}

class ListTagsForResourceResponse {}

class UnclaimDeviceResponse {}

class UpdateDeviceStateResponse {}
