import 'package:meta/meta.dart';

/// Describes all of the AWS IoT 1-Click device-related API operations for the
/// service. Also provides sample requests, responses, and errors for the
/// supported web services protocols.
class Iot1ClickDevicesServiceApi {
  final _client;
  Iot1ClickDevicesServiceApi(client)
      : _client = client.configured('IoT 1Click Devices Service',
            serializer: 'rest-json');

  /// Adds device(s) to your account (i.e., claim one or more devices) if and
  /// only if you received a claim code with the device(s).
  ///
  /// [claimCode]: The claim code, starting with "C-", as provided by the device
  /// manufacturer.
  Future<ClaimDevicesByClaimCodeResponse> claimDevicesByClaimCode(
      String claimCode) async {
    var response_ = await _client.send('ClaimDevicesByClaimCode', {
      'ClaimCode': claimCode,
    });
    return ClaimDevicesByClaimCodeResponse.fromJson(response_);
  }

  /// Given a device ID, returns a DescribeDeviceResponse object describing the
  /// details of the device.
  ///
  /// [deviceId]: The unique identifier of the device.
  Future<DescribeDeviceResponse> describeDevice(String deviceId) async {
    var response_ = await _client.send('DescribeDevice', {
      'DeviceId': deviceId,
    });
    return DescribeDeviceResponse.fromJson(response_);
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
  /// information, see
  /// [AWS Tagging Strategies](https://aws.amazon.com/answers/account-management/aws-tagging-strategies/).
  Future<FinalizeDeviceClaimResponse> finalizeDeviceClaim(String deviceId,
      {Map<String, String> tags}) async {
    var response_ = await _client.send('FinalizeDeviceClaim', {
      'DeviceId': deviceId,
      if (tags != null) 'Tags': tags,
    });
    return FinalizeDeviceClaimResponse.fromJson(response_);
  }

  /// Given a device ID, returns the invokable methods associated with the
  /// device.
  ///
  /// [deviceId]: The unique identifier of the device.
  Future<GetDeviceMethodsResponse> getDeviceMethods(String deviceId) async {
    var response_ = await _client.send('GetDeviceMethods', {
      'DeviceId': deviceId,
    });
    return GetDeviceMethodsResponse.fromJson(response_);
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
    var response_ = await _client.send('InitiateDeviceClaim', {
      'DeviceId': deviceId,
    });
    return InitiateDeviceClaimResponse.fromJson(response_);
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
    var response_ = await _client.send('InvokeDeviceMethod', {
      'DeviceId': deviceId,
      if (deviceMethod != null) 'DeviceMethod': deviceMethod,
      if (deviceMethodParameters != null)
        'DeviceMethodParameters': deviceMethodParameters,
    });
    return InvokeDeviceMethodResponse.fromJson(response_);
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
    var response_ = await _client.send('ListDeviceEvents', {
      'DeviceId': deviceId,
      'FromTimeStamp': fromTimeStamp,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      'ToTimeStamp': toTimeStamp,
    });
    return ListDeviceEventsResponse.fromJson(response_);
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
    var response_ = await _client.send('ListDevices', {
      if (deviceType != null) 'DeviceType': deviceType,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListDevicesResponse.fromJson(response_);
  }

  /// Lists the tags associated with the specified resource ARN.
  ///
  /// [resourceArn]: The ARN of the resource.
  Future<ListTagsForResourceResponse> listTagsForResource(
      String resourceArn) async {
    var response_ = await _client.send('ListTagsForResource', {
      'ResourceArn': resourceArn,
    });
    return ListTagsForResourceResponse.fromJson(response_);
  }

  /// Adds or updates the tags associated with the resource ARN. See
  /// [AWS IoT 1-Click Service Limits](https://docs.aws.amazon.com/iot-1-click/latest/developerguide/1click-appendix.html#1click-limits)
  /// for the maximum number of tags allowed per resource.
  ///
  /// [resourceArn]: The ARN of the resource.
  ///
  /// [tags]: A collection of key/value pairs defining the resource tags. For
  /// example, { "tags": {"key1": "value1", "key2": "value2"} }. For more
  /// information, see
  /// [AWS Tagging Strategies](https://aws.amazon.com/answers/account-management/aws-tagging-strategies/).
  Future<void> tagResource(
      {@required String resourceArn,
      @required Map<String, String> tags}) async {
    await _client.send('TagResource', {
      'ResourceArn': resourceArn,
      'Tags': tags,
    });
  }

  /// Disassociates a device from your AWS account using its device ID.
  ///
  /// [deviceId]: The unique identifier of the device.
  Future<UnclaimDeviceResponse> unclaimDevice(String deviceId) async {
    var response_ = await _client.send('UnclaimDevice', {
      'DeviceId': deviceId,
    });
    return UnclaimDeviceResponse.fromJson(response_);
  }

  /// Using tag keys, deletes the tags (key/value pairs) associated with the
  /// specified resource ARN.
  ///
  /// [resourceArn]: The ARN of the resource.
  ///
  /// [tagKeys]: A collections of tag keys. For example, {"key1","key2"}
  Future<void> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {
    await _client.send('UntagResource', {
      'ResourceArn': resourceArn,
      'TagKeys': tagKeys,
    });
  }

  /// Using a Boolean value (true or false), this operation enables or disables
  /// the device given a device ID.
  ///
  /// [deviceId]: The unique identifier of the device.
  ///
  /// [enabled]: If true, the device is enabled. If false, the device is
  /// disabled.
  Future<UpdateDeviceStateResponse> updateDeviceState(String deviceId,
      {bool enabled}) async {
    var response_ = await _client.send('UpdateDeviceState', {
      'DeviceId': deviceId,
      if (enabled != null) 'Enabled': enabled,
    });
    return UpdateDeviceStateResponse.fromJson(response_);
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
      ClaimDevicesByClaimCodeResponse(
        claimCode:
            json.containsKey('ClaimCode') ? json['ClaimCode'] as String : null,
        total: json.containsKey('Total') ? json['Total'] as int : null,
      );
}

class DescribeDeviceResponse {
  /// Device details.
  final DeviceDescription deviceDescription;

  DescribeDeviceResponse({
    this.deviceDescription,
  });
  static DescribeDeviceResponse fromJson(Map<String, dynamic> json) =>
      DescribeDeviceResponse(
        deviceDescription: json.containsKey('DeviceDescription')
            ? DeviceDescription.fromJson(json['DeviceDescription'])
            : null,
      );
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
  static Device fromJson(Map<String, dynamic> json) => Device(
        attributes: json.containsKey('Attributes')
            ? Attributes.fromJson(json['Attributes'])
            : null,
        deviceId:
            json.containsKey('DeviceId') ? json['DeviceId'] as String : null,
        type: json.containsKey('Type') ? json['Type'] as String : null,
      );
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
      DeviceDescription(
        arn: json.containsKey('Arn') ? json['Arn'] as String : null,
        attributes: json.containsKey('Attributes')
            ? (json['Attributes'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        deviceId:
            json.containsKey('DeviceId') ? json['DeviceId'] as String : null,
        enabled: json.containsKey('Enabled') ? json['Enabled'] as bool : null,
        remainingLife: json.containsKey('RemainingLife')
            ? json['RemainingLife'] as double
            : null,
        type: json.containsKey('Type') ? json['Type'] as String : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
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
  static DeviceEvent fromJson(Map<String, dynamic> json) => DeviceEvent(
        device:
            json.containsKey('Device') ? Device.fromJson(json['Device']) : null,
        stdEvent:
            json.containsKey('StdEvent') ? json['StdEvent'] as String : null,
      );
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
  static DeviceMethod fromJson(Map<String, dynamic> json) => DeviceMethod(
        deviceType: json.containsKey('DeviceType')
            ? json['DeviceType'] as String
            : null,
        methodName: json.containsKey('MethodName')
            ? json['MethodName'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class FinalizeDeviceClaimResponse {
  /// The device's final claim state.
  final String state;

  FinalizeDeviceClaimResponse({
    this.state,
  });
  static FinalizeDeviceClaimResponse fromJson(Map<String, dynamic> json) =>
      FinalizeDeviceClaimResponse(
        state: json.containsKey('State') ? json['State'] as String : null,
      );
}

class GetDeviceMethodsResponse {
  /// List of available device APIs.
  final List<DeviceMethod> deviceMethods;

  GetDeviceMethodsResponse({
    this.deviceMethods,
  });
  static GetDeviceMethodsResponse fromJson(Map<String, dynamic> json) =>
      GetDeviceMethodsResponse(
        deviceMethods: json.containsKey('DeviceMethods')
            ? (json['DeviceMethods'] as List)
                .map((e) => DeviceMethod.fromJson(e))
                .toList()
            : null,
      );
}

class InitiateDeviceClaimResponse {
  /// The device's final claim state.
  final String state;

  InitiateDeviceClaimResponse({
    this.state,
  });
  static InitiateDeviceClaimResponse fromJson(Map<String, dynamic> json) =>
      InitiateDeviceClaimResponse(
        state: json.containsKey('State') ? json['State'] as String : null,
      );
}

class InvokeDeviceMethodResponse {
  /// A JSON encoded string containing the device method response.
  final String deviceMethodResponse;

  InvokeDeviceMethodResponse({
    this.deviceMethodResponse,
  });
  static InvokeDeviceMethodResponse fromJson(Map<String, dynamic> json) =>
      InvokeDeviceMethodResponse(
        deviceMethodResponse: json.containsKey('DeviceMethodResponse')
            ? json['DeviceMethodResponse'] as String
            : null,
      );
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
      ListDeviceEventsResponse(
        events: json.containsKey('Events')
            ? (json['Events'] as List)
                .map((e) => DeviceEvent.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
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
      ListDevicesResponse(
        devices: json.containsKey('Devices')
            ? (json['Devices'] as List)
                .map((e) => DeviceDescription.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListTagsForResourceResponse {
  /// A collection of key/value pairs defining the resource tags. For example, {
  /// "tags": {"key1": "value1", "key2": "value2"} }. For more information, see
  /// [AWS Tagging Strategies](https://aws.amazon.com/answers/account-management/aws-tagging-strategies/).
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  static ListTagsForResourceResponse fromJson(Map<String, dynamic> json) =>
      ListTagsForResourceResponse(
        tags: json.containsKey('Tags')
            ? (json['Tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

class UnclaimDeviceResponse {
  /// The device's final claim state.
  final String state;

  UnclaimDeviceResponse({
    this.state,
  });
  static UnclaimDeviceResponse fromJson(Map<String, dynamic> json) =>
      UnclaimDeviceResponse(
        state: json.containsKey('State') ? json['State'] as String : null,
      );
}

class UpdateDeviceStateResponse {
  UpdateDeviceStateResponse();
  static UpdateDeviceStateResponse fromJson(Map<String, dynamic> json) =>
      UpdateDeviceStateResponse();
}
