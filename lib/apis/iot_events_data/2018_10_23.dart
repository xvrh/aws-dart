import 'package:meta/meta.dart';
import 'dart:typed_data';

/// AWS IoT Events monitors your equipment or device fleets for failures or
/// changes in operation, and triggers actions when such events occur. AWS IoT
/// Events Data API commands enable you to send inputs to detectors, list
/// detectors, and view or update a detector's status.
class IotEventsDataApi {
  /// Sends a set of messages to the AWS IoT Events system. Each message payload
  /// is transformed into the input you specify (`"inputName"`) and ingested
  /// into any detectors that monitor that input. If multiple messages are sent,
  /// the order in which the messages are processed isn't guaranteed. To
  /// guarantee ordering, you must send messages one at a time and wait for a
  /// successful response.
  ///
  /// [messages]: The list of messages to send. Each message has the following
  /// format: `'{ "messageId": "string", "inputName": "string", "payload":
  /// "string"}'`
  Future<BatchPutMessageResponse> batchPutMessage(
      List<Message> messages) async {
    return BatchPutMessageResponse.fromJson({});
  }

  /// Updates the state, variable values, and timer settings of one or more
  /// detectors (instances) of a specified detector model.
  ///
  /// [detectors]: The list of detectors (instances) to update, along with the
  /// values to update.
  Future<BatchUpdateDetectorResponse> batchUpdateDetector(
      List<UpdateDetectorRequest> detectors) async {
    return BatchUpdateDetectorResponse.fromJson({});
  }

  /// Returns information about the specified detector (instance).
  ///
  /// [detectorModelName]: The name of the detector model whose detectors
  /// (instances) you want information about.
  ///
  /// [keyValue]: A filter used to limit results to detectors (instances)
  /// created because of the given key ID.
  Future<DescribeDetectorResponse> describeDetector(String detectorModelName,
      {String keyValue}) async {
    return DescribeDetectorResponse.fromJson({});
  }

  /// Lists detectors (the instances of a detector model).
  ///
  /// [detectorModelName]: The name of the detector model whose detectors
  /// (instances) are listed.
  ///
  /// [stateName]: A filter that limits results to those detectors (instances)
  /// in the given state.
  ///
  /// [nextToken]: The token for the next set of results.
  ///
  /// [maxResults]: The maximum number of results to return at one time.
  Future<ListDetectorsResponse> listDetectors(String detectorModelName,
      {String stateName, String nextToken, int maxResults}) async {
    return ListDetectorsResponse.fromJson({});
  }
}

class BatchPutMessageErrorEntry {
  /// The ID of the message that caused the error. (See the value corresponding
  /// to the `"messageId"` key in the `"message"` object.)
  final String messageId;

  /// The code associated with the error.
  final String errorCode;

  /// More information about the error.
  final String errorMessage;

  BatchPutMessageErrorEntry({
    this.messageId,
    this.errorCode,
    this.errorMessage,
  });
  static BatchPutMessageErrorEntry fromJson(Map<String, dynamic> json) =>
      BatchPutMessageErrorEntry();
}

class BatchPutMessageResponse {
  /// A list of any errors encountered when sending the messages.
  final List<BatchPutMessageErrorEntry> batchPutMessageErrorEntries;

  BatchPutMessageResponse({
    this.batchPutMessageErrorEntries,
  });
  static BatchPutMessageResponse fromJson(Map<String, dynamic> json) =>
      BatchPutMessageResponse();
}

class BatchUpdateDetectorErrorEntry {
  /// The `"messageId"` of the update request that caused the error. (The value
  /// of the `"messageId"` in the update request `"Detector"` object.)
  final String messageId;

  /// The code of the error.
  final String errorCode;

  /// A message describing the error.
  final String errorMessage;

  BatchUpdateDetectorErrorEntry({
    this.messageId,
    this.errorCode,
    this.errorMessage,
  });
  static BatchUpdateDetectorErrorEntry fromJson(Map<String, dynamic> json) =>
      BatchUpdateDetectorErrorEntry();
}

class BatchUpdateDetectorResponse {
  /// A list of those detector updates that resulted in errors. (If an error is
  /// listed here, the specific update did not occur.)
  final List<BatchUpdateDetectorErrorEntry> batchUpdateDetectorErrorEntries;

  BatchUpdateDetectorResponse({
    this.batchUpdateDetectorErrorEntries,
  });
  static BatchUpdateDetectorResponse fromJson(Map<String, dynamic> json) =>
      BatchUpdateDetectorResponse();
}

class DescribeDetectorResponse {
  /// Information about the detector (instance).
  final Detector detector;

  DescribeDetectorResponse({
    this.detector,
  });
  static DescribeDetectorResponse fromJson(Map<String, dynamic> json) =>
      DescribeDetectorResponse();
}

class Detector {
  /// The name of the detector model that created this detector (instance).
  final String detectorModelName;

  /// The value of the key (identifying the device or system) that caused the
  /// creation of this detector (instance).
  final String keyValue;

  /// The version of the detector model that created this detector (instance).
  final String detectorModelVersion;

  /// The current state of the detector (instance).
  final DetectorState state;

  /// The time the detector (instance) was created.
  final DateTime creationTime;

  /// The time the detector (instance) was last updated.
  final DateTime lastUpdateTime;

  Detector({
    this.detectorModelName,
    this.keyValue,
    this.detectorModelVersion,
    this.state,
    this.creationTime,
    this.lastUpdateTime,
  });
  static Detector fromJson(Map<String, dynamic> json) => Detector();
}

class DetectorState {
  /// The name of the state.
  final String stateName;

  /// The current values of the detector's variables.
  final List<Variable> variables;

  /// The current state of the detector's timers.
  final List<Timer> timers;

  DetectorState({
    @required this.stateName,
    @required this.variables,
    @required this.timers,
  });
  static DetectorState fromJson(Map<String, dynamic> json) => DetectorState();
}

class DetectorStateDefinition {
  /// The name of the new state of the detector (instance).
  final String stateName;

  /// The new values of the detector's variables. Any variable whose value isn't
  /// specified is cleared.
  final List<VariableDefinition> variables;

  /// The new values of the detector's timers. Any timer whose value isn't
  /// specified is cleared, and its timeout event won't occur.
  final List<TimerDefinition> timers;

  DetectorStateDefinition({
    @required this.stateName,
    @required this.variables,
    @required this.timers,
  });
}

class DetectorStateSummary {
  /// The name of the state.
  final String stateName;

  DetectorStateSummary({
    this.stateName,
  });
  static DetectorStateSummary fromJson(Map<String, dynamic> json) =>
      DetectorStateSummary();
}

class DetectorSummary {
  /// The name of the detector model that created this detector (instance).
  final String detectorModelName;

  /// The value of the key (identifying the device or system) that caused the
  /// creation of this detector (instance).
  final String keyValue;

  /// The version of the detector model that created this detector (instance).
  final String detectorModelVersion;

  /// The current state of the detector (instance).
  final DetectorStateSummary state;

  /// The time the detector (instance) was created.
  final DateTime creationTime;

  /// The time the detector (instance) was last updated.
  final DateTime lastUpdateTime;

  DetectorSummary({
    this.detectorModelName,
    this.keyValue,
    this.detectorModelVersion,
    this.state,
    this.creationTime,
    this.lastUpdateTime,
  });
  static DetectorSummary fromJson(Map<String, dynamic> json) =>
      DetectorSummary();
}

class ListDetectorsResponse {
  /// A list of summary information about the detectors (instances).
  final List<DetectorSummary> detectorSummaries;

  /// A token to retrieve the next set of results, or `null` if there are no
  /// additional results.
  final String nextToken;

  ListDetectorsResponse({
    this.detectorSummaries,
    this.nextToken,
  });
  static ListDetectorsResponse fromJson(Map<String, dynamic> json) =>
      ListDetectorsResponse();
}

class Message {
  /// The ID to assign to the message. Within each batch sent, each
  /// `"messageId"` must be unique.
  final String messageId;

  /// The name of the input into which the message payload is transformed.
  final String inputName;

  /// The payload of the message. This can be a JSON string or a Base-64-encoded
  /// string representing binary data (in which case you must decode it).
  final Uint8List payload;

  Message({
    @required this.messageId,
    @required this.inputName,
    @required this.payload,
  });
}

class Timer {
  /// The name of the timer.
  final String name;

  /// The number of seconds which have elapsed on the timer.
  final DateTime timestamp;

  Timer({
    @required this.name,
    @required this.timestamp,
  });
  static Timer fromJson(Map<String, dynamic> json) => Timer();
}

class TimerDefinition {
  /// The name of the timer.
  final String name;

  /// The new setting of the timer (the number of seconds before the timer
  /// elapses).
  final int seconds;

  TimerDefinition({
    @required this.name,
    @required this.seconds,
  });
}

class UpdateDetectorRequest {
  /// The ID to assign to the detector update `"message"`. Each `"messageId"`
  /// must be unique within each batch sent.
  final String messageId;

  /// The name of the detector model that created the detectors (instances).
  final String detectorModelName;

  /// The value of the input key attribute (identifying the device or system)
  /// that caused the creation of this detector (instance).
  final String keyValue;

  /// The new state, variable values, and timer settings of the detector
  /// (instance).
  final DetectorStateDefinition state;

  UpdateDetectorRequest({
    @required this.messageId,
    @required this.detectorModelName,
    this.keyValue,
    @required this.state,
  });
}

class Variable {
  /// The name of the variable.
  final String name;

  /// The current value of the variable.
  final String value;

  Variable({
    @required this.name,
    @required this.value,
  });
  static Variable fromJson(Map<String, dynamic> json) => Variable();
}

class VariableDefinition {
  /// The name of the variable.
  final String name;

  /// The new value of the variable.
  final String value;

  VariableDefinition({
    @required this.name,
    @required this.value,
  });
}
