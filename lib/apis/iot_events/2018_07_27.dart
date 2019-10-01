import 'package:meta/meta.dart';

/// AWS IoT Events monitors your equipment or device fleets for failures or
/// changes in operation, and triggers actions when such events occur. AWS IoT
/// Events API commands enable you to create, read, update and delete inputs and
/// detector models, and to list their versions.
class IotEventsApi {
  /// Creates a detector model.
  Future<void> createDetectorModel(
      {@required String detectorModelName,
      @required DetectorModelDefinition detectorModelDefinition,
      String detectorModelDescription,
      String key,
      @required String roleArn,
      List<Tag> tags}) async {}

  /// Creates an input.
  Future<void> createInput(
      {@required String inputName,
      String inputDescription,
      @required InputDefinition inputDefinition,
      List<Tag> tags}) async {}

  /// Deletes a detector model. Any active instances of the detector model are
  /// also deleted.
  Future<void> deleteDetectorModel(String detectorModelName) async {}

  /// Deletes an input.
  Future<void> deleteInput(String inputName) async {}

  /// Describes a detector model. If the `"version"` parameter is not specified,
  /// information about the latest version is returned.
  Future<void> describeDetectorModel(String detectorModelName,
      {String detectorModelVersion}) async {}

  /// Describes an input.
  Future<void> describeInput(String inputName) async {}

  /// Retrieves the current settings of the AWS IoT Events logging options.
  Future<void> describeLoggingOptions() async {}

  /// Lists all the versions of a detector model. Only the metadata associated
  /// with each detector model version is returned.
  Future<void> listDetectorModelVersions(String detectorModelName,
      {String nextToken, int maxResults}) async {}

  /// Lists the detector models you have created. Only the metadata associated
  /// with each detector model is returned.
  Future<void> listDetectorModels({String nextToken, int maxResults}) async {}

  /// Lists the inputs you have created.
  Future<void> listInputs({String nextToken, int maxResults}) async {}

  /// Lists the tags (metadata) you have assigned to the resource.
  Future<void> listTagsForResource(String resourceArn) async {}

  /// Sets or updates the AWS IoT Events logging options.
  ///
  /// If you update the value of any `"loggingOptions"` field, it takes up to
  /// one minute for the change to take effect. Also, if you change the policy
  /// attached to the role you specified in the `"roleArn"` field (for example,
  /// to correct an invalid policy) it takes up to five minutes for that change
  /// to take effect.
  Future<void> putLoggingOptions(LoggingOptions loggingOptions) async {}

  /// Adds to or modifies the tags of the given resource. Tags are metadata that
  /// can be used to manage a resource.
  Future<void> tagResource(
      {@required String resourceArn, @required List<Tag> tags}) async {}

  /// Removes the given tags (metadata) from the resource.
  Future<void> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {}

  /// Updates a detector model. Detectors (instances) spawned by the previous
  /// version are deleted and then re-created as new inputs arrive.
  Future<void> updateDetectorModel(
      {@required String detectorModelName,
      @required DetectorModelDefinition detectorModelDefinition,
      String detectorModelDescription,
      @required String roleArn}) async {}

  /// Updates an input.
  Future<void> updateInput(
      {@required String inputName,
      String inputDescription,
      @required InputDefinition inputDefinition}) async {}
}

class Action {}

class Attribute {}

class ClearTimerAction {}

class CreateDetectorModelResponse {}

class CreateInputResponse {}

class DeleteDetectorModelResponse {}

class DeleteInputResponse {}

class DescribeDetectorModelResponse {}

class DescribeInputResponse {}

class DescribeLoggingOptionsResponse {}

class DetectorDebugOption {}

class DetectorModel {}

class DetectorModelConfiguration {}

class DetectorModelDefinition {}

class DetectorModelSummary {}

class DetectorModelVersionSummary {}

class Event {}

class FirehoseAction {}

class Input {}

class InputConfiguration {}

class InputDefinition {}

class InputSummary {}

class IotEventsAction {}

class IotTopicPublishAction {}

class LambdaAction {}

class ListDetectorModelVersionsResponse {}

class ListDetectorModelsResponse {}

class ListInputsResponse {}

class ListTagsForResourceResponse {}

class LoggingOptions {}

class OnEnterLifecycle {}

class OnExitLifecycle {}

class OnInputLifecycle {}

class ResetTimerAction {}

class SnsTopicPublishAction {}

class SetTimerAction {}

class SetVariableAction {}

class SqsAction {}

class State {}

class Tag {}

class TagResourceResponse {}

class TransitionEvent {}

class UntagResourceResponse {}

class UpdateDetectorModelResponse {}

class UpdateInputResponse {}
