import 'package:meta/meta.dart';

/// Describes all of the AWS IoT 1-Click device-related API operations for the
/// service. Also provides sample requests, responses, and errors for the
/// supported web services protocols.
class Iot1ClickDevicesServiceApi {
  /// Adds device(s) to your account (i.e., claim one or more devices) if and
  /// only if you received a claim code with the device(s).
  ///
  /// [claimCode]: The claim code, starting with "C-", as provided by the device
  /// manufacturer.
  Future<ClaimDevicesByClaimCodeResponse> claimDevicesByClaimCode(
      String claimCode) async {
    return ClaimDevicesByClaimCodeResponse.fromJson({});
  }

  /// Given a device ID, returns a DescribeDeviceResponse object describing the
  /// details of the device.
  ///
  /// [deviceId]: The unique identifier of the device.
  Future<DescribeDeviceResponse> describeDevice(String deviceId) async {
    return DescribeDeviceResponse.fromJson({});
  }

  /// Given a device ID, finalizes the claim request for the associated device.
  ///
  /// Claiming a device consists of initiating a claim, then publishing a device
  /// event, and finalizing the claim. For a device of type button, a device
  /// event can be published by simply clicking the device.
  ///
  /// [deviceId]: The unique identifier of the device.
  ///
  /// [tags]: A collection of key/value pairs defining the resource tags. For
  /// example, { "tags": {"key1": "value1", "key2": "value2"} }. For more
  /// information, see [AWS Tagging
  /// Strategies](https://aws.amazon.com/answers/account-management/aws-tagging-strategies/).
  Future<FinalizeDeviceClaimResponse> finalizeDeviceClaim(String deviceId,
      {Map<String, String> tags}) async {
    return FinalizeDeviceClaimResponse.fromJson({});
  }

  /// Given a device ID, returns the invokable methods associated with the
  /// device.
  ///
  /// [deviceId]: The unique identifier of the device.
  Future<GetDeviceMethodsResponse> getDeviceMethods(String deviceId) async {
    return GetDeviceMethodsResponse.fromJson({});
  }

  /// Given a device ID, initiates a claim request for the associated device.
  ///
  /// Claiming a device consists of initiating a claim, then publishing a device
  /// event, and finalizing the claim. For a device of type button, a device
  /// event can be published by simply clicking the device.
  ///
  /// [deviceId]: The unique identifier of the device.
  Future<InitiateDeviceClaimResponse> initiateDeviceClaim(
      String deviceId) async {
    return InitiateDeviceClaimResponse.fromJson({});
  }

  /// Given a device ID, issues a request to invoke a named device method (with
  /// possible parameters). See the "Example POST" code snippet below.
  ///
  /// [deviceId]: The unique identifier of the device.
  ///
  /// [deviceMethod]: The device method to invoke.
  ///
  /// [deviceMethodParameters]: A JSON encoded string containing the device
  /// method request parameters.
  Future<InvokeDeviceMethodResponse> invokeDeviceMethod(String deviceId,
      {DeviceMethod deviceMethod, String deviceMethodParameters}) async {
    return InvokeDeviceMethodResponse.fromJson({});
  }

  /// Using a device ID, returns a DeviceEventsResponse object containing an
  /// array of events for the device.
  ///
  /// [deviceId]: The unique identifier of the device.
  ///
  /// [fromTimeStamp]: The start date for the device event query, in ISO8061
  /// format. For example, 2018-03-28T15:45:12.880Z
  ///
  /// [maxResults]: The maximum number of results to return per request. If not
  /// set, a default value of 100 is used.
  ///
  /// [nextToken]: The token to retrieve the next set of results.
  ///
  /// [toTimeStamp]: The end date for the device event query, in ISO8061 format.
  /// For example, 2018-03-28T15:45:12.880Z
  Future<ListDeviceEventsResponse> listDeviceEvents(
      {@required String deviceId,
      @required DateTime fromTimeStamp,
      int maxResults,
      String nextToken,
      @required DateTime toTimeStamp}) async {
    return ListDeviceEventsResponse.fromJson({});
  }

  /// Lists the 1-Click compatible devices associated with your AWS account.
  ///
  /// [deviceType]: The type of the device, such as "button".
  ///
  /// [maxResults]: The maximum number of results to return per request. If not
  /// set, a default value of 100 is used.
  ///
  /// [nextToken]: The token to retrieve the next set of results.
  Future<ListDevicesResponse> listDevices(
      {String deviceType, int maxResults, String nextToken}) async {
    return ListDevicesResponse.fromJson({});
  }

  /// Lists the tags associated with the specified resource ARN.
  ///
  /// [resourceArn]: The ARN of the resource.
  Future<ListTagsForResourceResponse> listTagsForResource(
      String resourceArn) async {
    return ListTagsForResourceResponse.fromJson({});
  }

  /// Adds or updates the tags associated with the resource ARN. See [AWS IoT
  /// 1-Click Service
  /// Limits](https://docs.aws.amazon.com/iot-1-click/latest/developerguide/1click-appendix.html#1click-limits)
  /// for the maximum number of tags allowed per resource.
  ///
  /// [resourceArn]: The ARN of the resource.
  ///
  /// [tags]: A collection of key/value pairs defining the resource tags. For
  /// example, { "tags": {"key1": "value1", "key2": "value2"} }. For more
  /// information, see [AWS Tagging
  /// Strategies](https://aws.amazon.com/answers/account-management/aws-tagging-strategies/).
  Future<void> tagResource(
      {@required String resourceArn,
      @required Map<String, String> tags}) async {}

  /// Disassociates a device from your AWS account using its device ID.
  ///
  /// [deviceId]: The unique identifier of the device.
  Future<UnclaimDeviceResponse> unclaimDevice(String deviceId) async {
    return UnclaimDeviceResponse.fromJson({});
  }

  /// Using tag keys, deletes the tags (key/value pairs) associated with the
  /// specified resource ARN.
  ///
  /// [resourceArn]: The ARN of the resource.
  ///
  /// [tagKeys]: A collections of tag keys. For example, {"key1","key2"}
  Future<void> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {}

  /// Using a Boolean value (true or false), this operation enables or disables
  /// the device given a device ID.
  ///
  /// [deviceId]: The unique identifier of the device.
  ///
  /// [enabled]: If true, the device is enabled. If false, the device is
  /// disabled.
  Future<UpdateDeviceStateResponse> updateDeviceState(String deviceId,
      {bool enabled}) async {
    return UpdateDeviceStateResponse.fromJson({});
  }
}

class Attributes {
  Attributes();
  static Attributes fromJson(Map<String, dynamic> json) => Attributes();
}

class ClaimDevicesByClaimCodeResponse {
  /// The claim code provided by the device manufacturer.
  final String claimCode;

  /// The total number of devices associated with the claim code that has been
  /// processed in the claim request.
  final int total;

  ClaimDevicesByClaimCodeResponse({
    this.claimCode,
    this.total,
  });
  static ClaimDevicesByClaimCodeResponse fromJson(Map<String, dynamic> json) =>
      ClaimDevicesByClaimCodeResponse();
}

class DescribeDeviceResponse {
  /// Device details.
  final DeviceDescription deviceDescription;

  DescribeDeviceResponse({
    this.deviceDescription,
  });
  static DescribeDeviceResponse fromJson(Map<String, dynamic> json) =>
      DescribeDeviceResponse();
}

class Device {
  /// The user specified attributes associated with the device for an event.
  final Attributes attributes;

  /// The unique identifier of the device.
  final String deviceId;

  /// The device type, such as "button".
  final String type;

  Device({
    this.attributes,
    this.deviceId,
    this.type,
  });
  static Device fromJson(Map<String, dynamic> json) => Device();
}

class DeviceDescription {
  /// The ARN of the device.
  final String arn;

  /// An array of zero or more elements of DeviceAttribute objects providing
  /// user specified device attributes.
  final Map<String, String> attributes;

  /// The unique identifier of the device.
  final String deviceId;

  /// A Boolean value indicating whether or not the device is enabled.
  final bool enabled;

  /// A value between 0 and 1 inclusive, representing the fraction of life
  /// remaining for the device.
  final double remainingLife;

  /// The type of the device, such as "button".
  final String type;

  /// The tags currently associated with the AWS IoT 1-Click device.
  final Map<String, String> tags;

  DeviceDescription({
    this.arn,
    this.attributes,
    this.deviceId,
    this.enabled,
    this.remainingLife,
    this.type,
    this.tags,
  });
  static DeviceDescription fromJson(Map<String, dynamic> json) =>
      DeviceDescription();
}

class DeviceEvent {
  /// An object representing the device associated with the event.
  final Device device;

  /// A serialized JSON object representing the device-type specific event.
  final String stdEvent;

  DeviceEvent({
    this.device,
    this.stdEvent,
  });
  static DeviceEvent fromJson(Map<String, dynamic> json) => DeviceEvent();
}

class DeviceMethod {
  /// The type of the device, such as "button".
  final String deviceType;

  /// The name of the method applicable to the deviceType.
  final String methodName;

  DeviceMethod({
    this.deviceType,
    this.methodName,
  });
  static DeviceMethod fromJson(Map<String, dynamic> json) => DeviceMethod();
}

class FinalizeDeviceClaimResponse {
  /// The device's final claim state.
  final String state;

  FinalizeDeviceClaimResponse({
    this.state,
  });
  static FinalizeDeviceClaimResponse fromJson(Map<String, dynamic> json) =>
      FinalizeDeviceClaimResponse();
}

class GetDeviceMethodsResponse {
  /// List of available device APIs.
  final List<DeviceMethod> deviceMethods;

  GetDeviceMethodsResponse({
    this.deviceMethods,
  });
  static GetDeviceMethodsResponse fromJson(Map<String, dynamic> json) =>
      GetDeviceMethodsResponse();
}

class InitiateDeviceClaimResponse {
  /// The device's final claim state.
  final String state;

  InitiateDeviceClaimResponse({
    this.state,
  });
  static InitiateDeviceClaimResponse fromJson(Map<String, dynamic> json) =>
      InitiateDeviceClaimResponse();
}

class InvokeDeviceMethodResponse {
  /// A JSON encoded string containing the device method response.
  final String deviceMethodResponse;

  InvokeDeviceMethodResponse({
    this.deviceMethodResponse,
  });
  static InvokeDeviceMethodResponse fromJson(Map<String, dynamic> json) =>
      InvokeDeviceMethodResponse();
}

class ListDeviceEventsResponse {
  /// An array of zero or more elements describing the event(s) associated with
  /// the device.
  final List<DeviceEvent> events;

  /// The token to retrieve the next set of results.
  final String nextToken;

  ListDeviceEventsResponse({
    this.events,
    this.nextToken,
  });
  static ListDeviceEventsResponse fromJson(Map<String, dynamic> json) =>
      ListDeviceEventsResponse();
}

class ListDevicesResponse {
  /// A list of devices.
  final List<DeviceDescription> devices;

  /// The token to retrieve the next set of results.
  final String nextToken;

  ListDevicesResponse({
    this.devices,
    this.nextToken,
  });
  static ListDevicesResponse fromJson(Map<String, dynamic> json) =>
      ListDevicesResponse();
}

class ListTagsForResourceResponse {
  /// A collection of key/value pairs defining the resource tags. For example, {
  /// "tags": {"key1": "value1", "key2": "value2"} }. For more information, see
  /// [AWS Tagging
  /// Strategies](https://aws.amazon.com/answers/account-management/aws-tagging-strategies/).
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  static ListTagsForResourceResponse fromJson(Map<String, dynamic> json) =>
      ListTagsForResourceResponse();
}

class UnclaimDeviceResponse {
  /// The device's final claim state.
  final String state;

  UnclaimDeviceResponse({
    this.state,
  });
  static UnclaimDeviceResponse fromJson(Map<String, dynamic> json) =>
      UnclaimDeviceResponse();
}

class UpdateDeviceStateResponse {
  UpdateDeviceStateResponse();
  static UpdateDeviceStateResponse fromJson(Map<String, dynamic> json) =>
      UpdateDeviceStateResponse();
}
