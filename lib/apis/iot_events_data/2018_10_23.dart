import 'package:meta/meta.dart';

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
  Future<void> batchPutMessage(List<Message> messages) async {}

  /// Updates the state, variable values, and timer settings of one or more
  /// detectors (instances) of a specified detector model.
  Future<void> batchUpdateDetector(
      List<UpdateDetectorRequest> detectors) async {}

  /// Returns information about the specified detector (instance).
  Future<void> describeDetector(String detectorModelName,
      {String keyValue}) async {}

  /// Lists detectors (the instances of a detector model).
  Future<void> listDetectors(String detectorModelName,
      {String stateName, String nextToken, int maxResults}) async {}
}

class BatchPutMessageErrorEntry {}

class BatchPutMessageResponse {}

class BatchUpdateDetectorErrorEntry {}

class BatchUpdateDetectorResponse {}

class DescribeDetectorResponse {}

class Detector {}

class DetectorState {}

class DetectorStateDefinition {}

class DetectorStateSummary {}

class DetectorSummary {}

class ListDetectorsResponse {}

class Message {}

class Timer {}

class TimerDefinition {}

class UpdateDetectorRequest {}

class Variable {}

class VariableDefinition {}
