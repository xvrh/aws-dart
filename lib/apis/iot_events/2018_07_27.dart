import 'package:meta/meta.dart';

/// AWS IoT Events monitors your equipment or device fleets for failures or
/// changes in operation, and triggers actions when such events occur. AWS IoT
/// Events API commands enable you to create, read, update and delete inputs and
/// detector models, and to list their versions.
class IotEventsApi {
  /// Creates a detector model.
  ///
  /// [detectorModelName]: The name of the detector model.
  ///
  /// [detectorModelDefinition]: Information that defines how the detectors
  /// operate.
  ///
  /// [detectorModelDescription]: A brief description of the detector model.
  ///
  /// [key]: The input attribute key used to identify a device or system in
  /// order to create a detector (an instance of the detector model) and then to
  /// route each input received to the appropriate detector (instance). This
  /// parameter uses a JSON-path expression to specify the attribute-value pair
  /// in the message payload of each input that is used to identify the device
  /// associated with the input.
  ///
  /// [roleArn]: The ARN of the role that grants permission to AWS IoT Events to
  /// perform its operations.
  ///
  /// [tags]: Metadata that can be used to manage the detector model.
  Future<CreateDetectorModelResponse> createDetectorModel(
      {@required String detectorModelName,
      @required DetectorModelDefinition detectorModelDefinition,
      String detectorModelDescription,
      String key,
      @required String roleArn,
      List<Tag> tags}) async {
    return CreateDetectorModelResponse.fromJson({});
  }

  /// Creates an input.
  ///
  /// [inputName]: The name you want to give to the input.
  ///
  /// [inputDescription]: A brief description of the input.
  ///
  /// [inputDefinition]: The definition of the input.
  ///
  /// [tags]: Metadata that can be used to manage the input.
  Future<CreateInputResponse> createInput(
      {@required String inputName,
      String inputDescription,
      @required InputDefinition inputDefinition,
      List<Tag> tags}) async {
    return CreateInputResponse.fromJson({});
  }

  /// Deletes a detector model. Any active instances of the detector model are
  /// also deleted.
  ///
  /// [detectorModelName]: The name of the detector model to be deleted.
  Future<DeleteDetectorModelResponse> deleteDetectorModel(
      String detectorModelName) async {
    return DeleteDetectorModelResponse.fromJson({});
  }

  /// Deletes an input.
  ///
  /// [inputName]: The name of the input to delete.
  Future<DeleteInputResponse> deleteInput(String inputName) async {
    return DeleteInputResponse.fromJson({});
  }

  /// Describes a detector model. If the `"version"` parameter is not specified,
  /// information about the latest version is returned.
  ///
  /// [detectorModelName]: The name of the detector model.
  ///
  /// [detectorModelVersion]: The version of the detector model.
  Future<DescribeDetectorModelResponse> describeDetectorModel(
      String detectorModelName,
      {String detectorModelVersion}) async {
    return DescribeDetectorModelResponse.fromJson({});
  }

  /// Describes an input.
  ///
  /// [inputName]: The name of the input.
  Future<DescribeInputResponse> describeInput(String inputName) async {
    return DescribeInputResponse.fromJson({});
  }

  /// Retrieves the current settings of the AWS IoT Events logging options.
  Future<DescribeLoggingOptionsResponse> describeLoggingOptions() async {
    return DescribeLoggingOptionsResponse.fromJson({});
  }

  /// Lists all the versions of a detector model. Only the metadata associated
  /// with each detector model version is returned.
  ///
  /// [detectorModelName]: The name of the detector model whose versions are
  /// returned.
  ///
  /// [nextToken]: The token for the next set of results.
  ///
  /// [maxResults]: The maximum number of results to return at one time.
  Future<ListDetectorModelVersionsResponse> listDetectorModelVersions(
      String detectorModelName,
      {String nextToken,
      int maxResults}) async {
    return ListDetectorModelVersionsResponse.fromJson({});
  }

  /// Lists the detector models you have created. Only the metadata associated
  /// with each detector model is returned.
  ///
  /// [nextToken]: The token for the next set of results.
  ///
  /// [maxResults]: The maximum number of results to return at one time.
  Future<ListDetectorModelsResponse> listDetectorModels(
      {String nextToken, int maxResults}) async {
    return ListDetectorModelsResponse.fromJson({});
  }

  /// Lists the inputs you have created.
  ///
  /// [nextToken]: The token for the next set of results.
  ///
  /// [maxResults]: The maximum number of results to return at one time.
  Future<ListInputsResponse> listInputs(
      {String nextToken, int maxResults}) async {
    return ListInputsResponse.fromJson({});
  }

  /// Lists the tags (metadata) you have assigned to the resource.
  ///
  /// [resourceArn]: The ARN of the resource.
  Future<ListTagsForResourceResponse> listTagsForResource(
      String resourceArn) async {
    return ListTagsForResourceResponse.fromJson({});
  }

  /// Sets or updates the AWS IoT Events logging options.
  ///
  /// If you update the value of any `"loggingOptions"` field, it takes up to
  /// one minute for the change to take effect. Also, if you change the policy
  /// attached to the role you specified in the `"roleArn"` field (for example,
  /// to correct an invalid policy) it takes up to five minutes for that change
  /// to take effect.
  ///
  /// [loggingOptions]: The new values of the AWS IoT Events logging options.
  Future<void> putLoggingOptions(LoggingOptions loggingOptions) async {}

  /// Adds to or modifies the tags of the given resource. Tags are metadata that
  /// can be used to manage a resource.
  ///
  /// [resourceArn]: The ARN of the resource.
  ///
  /// [tags]: The new or modified tags for the resource.
  Future<TagResourceResponse> tagResource(
      {@required String resourceArn, @required List<Tag> tags}) async {
    return TagResourceResponse.fromJson({});
  }

  /// Removes the given tags (metadata) from the resource.
  ///
  /// [resourceArn]: The ARN of the resource.
  ///
  /// [tagKeys]: A list of the keys of the tags to be removed from the resource.
  Future<UntagResourceResponse> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {
    return UntagResourceResponse.fromJson({});
  }

  /// Updates a detector model. Detectors (instances) spawned by the previous
  /// version are deleted and then re-created as new inputs arrive.
  ///
  /// [detectorModelName]: The name of the detector model that is updated.
  ///
  /// [detectorModelDefinition]: Information that defines how a detector
  /// operates.
  ///
  /// [detectorModelDescription]: A brief description of the detector model.
  ///
  /// [roleArn]: The ARN of the role that grants permission to AWS IoT Events to
  /// perform its operations.
  Future<UpdateDetectorModelResponse> updateDetectorModel(
      {@required String detectorModelName,
      @required DetectorModelDefinition detectorModelDefinition,
      String detectorModelDescription,
      @required String roleArn}) async {
    return UpdateDetectorModelResponse.fromJson({});
  }

  /// Updates an input.
  ///
  /// [inputName]: The name of the input you want to update.
  ///
  /// [inputDescription]: A brief description of the input.
  ///
  /// [inputDefinition]: The definition of the input.
  Future<UpdateInputResponse> updateInput(
      {@required String inputName,
      String inputDescription,
      @required InputDefinition inputDefinition}) async {
    return UpdateInputResponse.fromJson({});
  }
}

/// An action to be performed when the `"condition"` is TRUE.
class Action {
  /// Sets a variable to a specified value.
  final SetVariableAction setVariable;

  /// Sends an Amazon SNS message.
  final SnsTopicPublishAction sns;

  /// Publishes an MQTT message with the given topic to the AWS IoT message
  /// broker.
  final IotTopicPublishAction iotTopicPublish;

  /// Information needed to set the timer.
  final SetTimerAction setTimer;

  /// Information needed to clear the timer.
  final ClearTimerAction clearTimer;

  /// Information needed to reset the timer.
  final ResetTimerAction resetTimer;

  /// Calls a Lambda function, passing in information about the detector model
  /// instance and the event which triggered the action.
  final LambdaAction lambda;

  /// Sends an IoT Events input, passing in information about the detector model
  /// instance and the event which triggered the action.
  final IotEventsAction iotEvents;

  /// Sends information about the detector model instance and the event which
  /// triggered the action to an AWS SQS queue.
  final SqsAction sqs;

  /// Sends information about the detector model instance and the event which
  /// triggered the action to a Kinesis Data Firehose stream.
  final FirehoseAction firehose;

  Action({
    this.setVariable,
    this.sns,
    this.iotTopicPublish,
    this.setTimer,
    this.clearTimer,
    this.resetTimer,
    this.lambda,
    this.iotEvents,
    this.sqs,
    this.firehose,
  });
  static Action fromJson(Map<String, dynamic> json) => Action();
}

/// The attributes from the JSON payload that are made available by the input.
/// Inputs are derived from messages sent to the AWS IoT Events system using
/// `BatchPutMessage`. Each such message contains a JSON payload, and those
/// attributes (and their paired values) specified here are available for use in
/// the `condition` expressions used by detectors.
class Attribute {
  /// An expression that specifies an attribute-value pair in a JSON structure.
  /// Use this to specify an attribute from the JSON payload that is made
  /// available by the input. Inputs are derived from messages sent to the AWS
  /// IoT Events system (`BatchPutMessage`). Each such message contains a JSON
  /// payload, and the attribute (and its paired value) specified here are
  /// available for use in the `"condition"` expressions used by detectors.
  ///
  /// Syntax: `<field-name>.<field-name>...`
  final String jsonPath;

  Attribute({
    @required this.jsonPath,
  });
  static Attribute fromJson(Map<String, dynamic> json) => Attribute();
}

/// Information needed to clear the timer.
class ClearTimerAction {
  /// The name of the timer to clear.
  final String timerName;

  ClearTimerAction({
    @required this.timerName,
  });
  static ClearTimerAction fromJson(Map<String, dynamic> json) =>
      ClearTimerAction();
}

class CreateDetectorModelResponse {
  /// Information about how the detector model is configured.
  final DetectorModelConfiguration detectorModelConfiguration;

  CreateDetectorModelResponse({
    this.detectorModelConfiguration,
  });
  static CreateDetectorModelResponse fromJson(Map<String, dynamic> json) =>
      CreateDetectorModelResponse();
}

class CreateInputResponse {
  /// Information about the configuration of the input.
  final InputConfiguration inputConfiguration;

  CreateInputResponse({
    this.inputConfiguration,
  });
  static CreateInputResponse fromJson(Map<String, dynamic> json) =>
      CreateInputResponse();
}

class DeleteDetectorModelResponse {
  DeleteDetectorModelResponse();
  static DeleteDetectorModelResponse fromJson(Map<String, dynamic> json) =>
      DeleteDetectorModelResponse();
}

class DeleteInputResponse {
  DeleteInputResponse();
  static DeleteInputResponse fromJson(Map<String, dynamic> json) =>
      DeleteInputResponse();
}

class DescribeDetectorModelResponse {
  /// Information about the detector model.
  final DetectorModel detectorModel;

  DescribeDetectorModelResponse({
    this.detectorModel,
  });
  static DescribeDetectorModelResponse fromJson(Map<String, dynamic> json) =>
      DescribeDetectorModelResponse();
}

class DescribeInputResponse {
  /// Information about the input.
  final Input input;

  DescribeInputResponse({
    this.input,
  });
  static DescribeInputResponse fromJson(Map<String, dynamic> json) =>
      DescribeInputResponse();
}

class DescribeLoggingOptionsResponse {
  /// The current settings of the AWS IoT Events logging options.
  final LoggingOptions loggingOptions;

  DescribeLoggingOptionsResponse({
    this.loggingOptions,
  });
  static DescribeLoggingOptionsResponse fromJson(Map<String, dynamic> json) =>
      DescribeLoggingOptionsResponse();
}

/// The detector model and the specific detectors (instances) for which the
/// logging level is given.
class DetectorDebugOption {
  /// The name of the detector model.
  final String detectorModelName;

  /// The value of the input attribute key used to create the detector (the
  /// instance of the detector model).
  final String keyValue;

  DetectorDebugOption({
    @required this.detectorModelName,
    this.keyValue,
  });
  static DetectorDebugOption fromJson(Map<String, dynamic> json) =>
      DetectorDebugOption();
}

/// Information about the detector model.
class DetectorModel {
  /// Information that defines how a detector operates.
  final DetectorModelDefinition detectorModelDefinition;

  /// Information about how the detector is configured.
  final DetectorModelConfiguration detectorModelConfiguration;

  DetectorModel({
    this.detectorModelDefinition,
    this.detectorModelConfiguration,
  });
  static DetectorModel fromJson(Map<String, dynamic> json) => DetectorModel();
}

/// Information about how the detector model is configured.
class DetectorModelConfiguration {
  /// The name of the detector model.
  final String detectorModelName;

  /// The version of the detector model.
  final String detectorModelVersion;

  /// A brief description of the detector model.
  final String detectorModelDescription;

  /// The ARN of the detector model.
  final String detectorModelArn;

  /// The ARN of the role that grants permission to AWS IoT Events to perform
  /// its operations.
  final String roleArn;

  /// The time the detector model was created.
  final DateTime creationTime;

  /// The time the detector model was last updated.
  final DateTime lastUpdateTime;

  /// The status of the detector model.
  final String status;

  /// The input attribute key used to identify a device or system in order to
  /// create a detector (an instance of the detector model) and then to route
  /// each input received to the appropriate detector (instance). This parameter
  /// uses a JSON-path expression to specify the attribute-value pair in the
  /// message payload of each input that is used to identify the device
  /// associated with the input.
  final String key;

  DetectorModelConfiguration({
    this.detectorModelName,
    this.detectorModelVersion,
    this.detectorModelDescription,
    this.detectorModelArn,
    this.roleArn,
    this.creationTime,
    this.lastUpdateTime,
    this.status,
    this.key,
  });
  static DetectorModelConfiguration fromJson(Map<String, dynamic> json) =>
      DetectorModelConfiguration();
}

/// Information that defines how a detector operates.
class DetectorModelDefinition {
  /// Information about the states of the detector.
  final List<State> states;

  /// The state that is entered at the creation of each detector (instance).
  final String initialStateName;

  DetectorModelDefinition({
    @required this.states,
    @required this.initialStateName,
  });
  static DetectorModelDefinition fromJson(Map<String, dynamic> json) =>
      DetectorModelDefinition();
}

/// Information about the detector model.
class DetectorModelSummary {
  /// The name of the detector model.
  final String detectorModelName;

  /// A brief description of the detector model.
  final String detectorModelDescription;

  /// The time the detector model was created.
  final DateTime creationTime;

  DetectorModelSummary({
    this.detectorModelName,
    this.detectorModelDescription,
    this.creationTime,
  });
  static DetectorModelSummary fromJson(Map<String, dynamic> json) =>
      DetectorModelSummary();
}

/// Information about the detector model version.
class DetectorModelVersionSummary {
  /// The name of the detector model.
  final String detectorModelName;

  /// The ID of the detector model version.
  final String detectorModelVersion;

  /// The ARN of the detector model version.
  final String detectorModelArn;

  /// The ARN of the role that grants the detector model permission to perform
  /// its tasks.
  final String roleArn;

  /// The time the detector model version was created.
  final DateTime creationTime;

  /// The last time the detector model version was updated.
  final DateTime lastUpdateTime;

  /// The status of the detector model version.
  final String status;

  DetectorModelVersionSummary({
    this.detectorModelName,
    this.detectorModelVersion,
    this.detectorModelArn,
    this.roleArn,
    this.creationTime,
    this.lastUpdateTime,
    this.status,
  });
  static DetectorModelVersionSummary fromJson(Map<String, dynamic> json) =>
      DetectorModelVersionSummary();
}

/// Specifies the `"actions"` to be performed when the `"condition"` evaluates
/// to TRUE.
class Event {
  /// The name of the event.
  final String eventName;

  /// [Optional] The Boolean expression that when TRUE causes the `"actions"` to
  /// be performed. If not present, the actions are performed (=TRUE); if the
  /// expression result is not a Boolean value, the actions are NOT performed
  /// (=FALSE).
  final String condition;

  /// The actions to be performed.
  final List<Action> actions;

  Event({
    @required this.eventName,
    this.condition,
    this.actions,
  });
  static Event fromJson(Map<String, dynamic> json) => Event();
}

/// Sends information about the detector model instance and the event which
/// triggered the action to a Kinesis Data Firehose stream.
class FirehoseAction {
  /// The name of the Kinesis Data Firehose stream where the data is written.
  final String deliveryStreamName;

  /// A character separator that is used to separate records written to the
  /// Kinesis Data Firehose stream. Valid values are: 'n' (newline), 't' (tab),
  /// 'rn' (Windows newline), ',' (comma).
  final String separator;

  FirehoseAction({
    @required this.deliveryStreamName,
    this.separator,
  });
  static FirehoseAction fromJson(Map<String, dynamic> json) => FirehoseAction();
}

/// Information about the input.
class Input {
  /// Information about the configuration of an input.
  final InputConfiguration inputConfiguration;

  /// The definition of the input.
  final InputDefinition inputDefinition;

  Input({
    this.inputConfiguration,
    this.inputDefinition,
  });
  static Input fromJson(Map<String, dynamic> json) => Input();
}

/// Information about the configuration of an input.
class InputConfiguration {
  /// The name of the input.
  final String inputName;

  /// A brief description of the input.
  final String inputDescription;

  /// The ARN of the input.
  final String inputArn;

  /// The time the input was created.
  final DateTime creationTime;

  /// The last time the input was updated.
  final DateTime lastUpdateTime;

  /// The status of the input.
  final String status;

  InputConfiguration({
    @required this.inputName,
    this.inputDescription,
    @required this.inputArn,
    @required this.creationTime,
    @required this.lastUpdateTime,
    @required this.status,
  });
  static InputConfiguration fromJson(Map<String, dynamic> json) =>
      InputConfiguration();
}

/// The definition of the input.
class InputDefinition {
  /// The attributes from the JSON payload that are made available by the input.
  /// Inputs are derived from messages sent to the AWS IoT Events system using
  /// `BatchPutMessage`. Each such message contains a JSON payload, and those
  /// attributes (and their paired values) specified here are available for use
  /// in the `"condition"` expressions used by detectors that monitor this
  /// input.
  final List<Attribute> attributes;

  InputDefinition({
    @required this.attributes,
  });
  static InputDefinition fromJson(Map<String, dynamic> json) =>
      InputDefinition();
}

/// Information about the input.
class InputSummary {
  /// The name of the input.
  final String inputName;

  /// A brief description of the input.
  final String inputDescription;

  /// The ARN of the input.
  final String inputArn;

  /// The time the input was created.
  final DateTime creationTime;

  /// The last time the input was updated.
  final DateTime lastUpdateTime;

  /// The status of the input.
  final String status;

  InputSummary({
    this.inputName,
    this.inputDescription,
    this.inputArn,
    this.creationTime,
    this.lastUpdateTime,
    this.status,
  });
  static InputSummary fromJson(Map<String, dynamic> json) => InputSummary();
}

/// Sends an IoT Events input, passing in information about the detector model
/// instance and the event which triggered the action.
class IotEventsAction {
  /// The name of the AWS IoT Events input where the data is sent.
  final String inputName;

  IotEventsAction({
    @required this.inputName,
  });
  static IotEventsAction fromJson(Map<String, dynamic> json) =>
      IotEventsAction();
}

/// Information required to publish the MQTT message via the AWS IoT message
/// broker.
class IotTopicPublishAction {
  /// The MQTT topic of the message.
  final String mqttTopic;

  IotTopicPublishAction({
    @required this.mqttTopic,
  });
  static IotTopicPublishAction fromJson(Map<String, dynamic> json) =>
      IotTopicPublishAction();
}

/// Calls a Lambda function, passing in information about the detector model
/// instance and the event which triggered the action.
class LambdaAction {
  /// The ARN of the Lambda function which is executed.
  final String functionArn;

  LambdaAction({
    @required this.functionArn,
  });
  static LambdaAction fromJson(Map<String, dynamic> json) => LambdaAction();
}

class ListDetectorModelVersionsResponse {
  /// Summary information about the detector model versions.
  final List<DetectorModelVersionSummary> detectorModelVersionSummaries;

  /// A token to retrieve the next set of results, or `null` if there are no
  /// additional results.
  final String nextToken;

  ListDetectorModelVersionsResponse({
    this.detectorModelVersionSummaries,
    this.nextToken,
  });
  static ListDetectorModelVersionsResponse fromJson(
          Map<String, dynamic> json) =>
      ListDetectorModelVersionsResponse();
}

class ListDetectorModelsResponse {
  /// Summary information about the detector models.
  final List<DetectorModelSummary> detectorModelSummaries;

  /// A token to retrieve the next set of results, or `null` if there are no
  /// additional results.
  final String nextToken;

  ListDetectorModelsResponse({
    this.detectorModelSummaries,
    this.nextToken,
  });
  static ListDetectorModelsResponse fromJson(Map<String, dynamic> json) =>
      ListDetectorModelsResponse();
}

class ListInputsResponse {
  /// Summary information about the inputs.
  final List<InputSummary> inputSummaries;

  /// A token to retrieve the next set of results, or `null` if there are no
  /// additional results.
  final String nextToken;

  ListInputsResponse({
    this.inputSummaries,
    this.nextToken,
  });
  static ListInputsResponse fromJson(Map<String, dynamic> json) =>
      ListInputsResponse();
}

class ListTagsForResourceResponse {
  /// The list of tags assigned to the resource.
  final List<Tag> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  static ListTagsForResourceResponse fromJson(Map<String, dynamic> json) =>
      ListTagsForResourceResponse();
}

/// The values of the AWS IoT Events logging options.
class LoggingOptions {
  /// The ARN of the role that grants permission to AWS IoT Events to perform
  /// logging.
  final String roleArn;

  /// The logging level.
  final String level;

  /// If TRUE, logging is enabled for AWS IoT Events.
  final bool enabled;

  /// Information that identifies those detector models and their detectors
  /// (instances) for which the logging level is given.
  final List<DetectorDebugOption> detectorDebugOptions;

  LoggingOptions({
    @required this.roleArn,
    @required this.level,
    @required this.enabled,
    this.detectorDebugOptions,
  });
  static LoggingOptions fromJson(Map<String, dynamic> json) => LoggingOptions();
}

/// When entering this state, perform these `actions` if the `condition` is
/// TRUE.
class OnEnterLifecycle {
  /// Specifies the actions that are performed when the state is entered and the
  /// `"condition"` is TRUE.
  final List<Event> events;

  OnEnterLifecycle({
    this.events,
  });
  static OnEnterLifecycle fromJson(Map<String, dynamic> json) =>
      OnEnterLifecycle();
}

/// When exiting this state, perform these `"actions"` if the specified
/// `"condition"` is TRUE.
class OnExitLifecycle {
  /// Specifies the `"actions"` that are performed when the state is exited and
  /// the `"condition"` is TRUE.
  final List<Event> events;

  OnExitLifecycle({
    this.events,
  });
  static OnExitLifecycle fromJson(Map<String, dynamic> json) =>
      OnExitLifecycle();
}

/// Specifies the actions performed when the `"condition"` evaluates to TRUE.
class OnInputLifecycle {
  /// Specifies the actions performed when the `"condition"` evaluates to TRUE.
  final List<Event> events;

  /// Specifies the actions performed, and the next state entered, when a
  /// `"condition"` evaluates to TRUE.
  final List<TransitionEvent> transitionEvents;

  OnInputLifecycle({
    this.events,
    this.transitionEvents,
  });
  static OnInputLifecycle fromJson(Map<String, dynamic> json) =>
      OnInputLifecycle();
}

/// Information needed to reset the timer.
class ResetTimerAction {
  /// The name of the timer to reset.
  final String timerName;

  ResetTimerAction({
    @required this.timerName,
  });
  static ResetTimerAction fromJson(Map<String, dynamic> json) =>
      ResetTimerAction();
}

/// Information required to publish the Amazon SNS message.
class SnsTopicPublishAction {
  /// The ARN of the Amazon SNS target where the message is sent.
  final String targetArn;

  SnsTopicPublishAction({
    @required this.targetArn,
  });
  static SnsTopicPublishAction fromJson(Map<String, dynamic> json) =>
      SnsTopicPublishAction();
}

/// Information needed to set the timer.
class SetTimerAction {
  /// The name of the timer.
  final String timerName;

  /// The number of seconds until the timer expires. The minimum value is 60
  /// seconds to ensure accuracy.
  final int seconds;

  SetTimerAction({
    @required this.timerName,
    @required this.seconds,
  });
  static SetTimerAction fromJson(Map<String, dynamic> json) => SetTimerAction();
}

/// Information about the variable and its new value.
class SetVariableAction {
  /// The name of the variable.
  final String variableName;

  /// The new value of the variable.
  final String value;

  SetVariableAction({
    @required this.variableName,
    @required this.value,
  });
  static SetVariableAction fromJson(Map<String, dynamic> json) =>
      SetVariableAction();
}

/// Sends information about the detector model instance and the event which
/// triggered the action to an AWS SQS queue.
class SqsAction {
  /// The URL of the SQS queue where the data is written.
  final String queueUrl;

  /// Set this to TRUE if you want the data to be Base-64 encoded before it is
  /// written to the queue. Otherwise, set this to FALSE.
  final bool useBase64;

  SqsAction({
    @required this.queueUrl,
    this.useBase64,
  });
  static SqsAction fromJson(Map<String, dynamic> json) => SqsAction();
}

/// Information that defines a state of a detector.
class State {
  /// The name of the state.
  final String stateName;

  /// When an input is received and the `"condition"` is TRUE, perform the
  /// specified `"actions"`.
  final OnInputLifecycle onInput;

  /// When entering this state, perform these `"actions"` if the `"condition"`
  /// is TRUE.
  final OnEnterLifecycle onEnter;

  /// When exiting this state, perform these `"actions"` if the specified
  /// `"condition"` is TRUE.
  final OnExitLifecycle onExit;

  State({
    @required this.stateName,
    this.onInput,
    this.onEnter,
    this.onExit,
  });
  static State fromJson(Map<String, dynamic> json) => State();
}

/// Metadata that can be used to manage the resource.
class Tag {
  /// The tag's key.
  final String key;

  /// The tag's value.
  final String value;

  Tag({
    @required this.key,
    @required this.value,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag();
}

class TagResourceResponse {
  TagResourceResponse();
  static TagResourceResponse fromJson(Map<String, dynamic> json) =>
      TagResourceResponse();
}

/// Specifies the actions performed and the next state entered when a
/// `"condition"` evaluates to TRUE.
class TransitionEvent {
  /// The name of the transition event.
  final String eventName;

  /// *required* A Boolean expression that when TRUE causes the actions to be
  /// performed and the `"nextState"` to be entered.
  final String condition;

  /// The actions to be performed.
  final List<Action> actions;

  /// The next state to enter.
  final String nextState;

  TransitionEvent({
    @required this.eventName,
    @required this.condition,
    this.actions,
    @required this.nextState,
  });
  static TransitionEvent fromJson(Map<String, dynamic> json) =>
      TransitionEvent();
}

class UntagResourceResponse {
  UntagResourceResponse();
  static UntagResourceResponse fromJson(Map<String, dynamic> json) =>
      UntagResourceResponse();
}

class UpdateDetectorModelResponse {
  /// Information about how the detector model is configured.
  final DetectorModelConfiguration detectorModelConfiguration;

  UpdateDetectorModelResponse({
    this.detectorModelConfiguration,
  });
  static UpdateDetectorModelResponse fromJson(Map<String, dynamic> json) =>
      UpdateDetectorModelResponse();
}

class UpdateInputResponse {
  /// Information about the configuration of the input.
  final InputConfiguration inputConfiguration;

  UpdateInputResponse({
    this.inputConfiguration,
  });
  static UpdateInputResponse fromJson(Map<String, dynamic> json) =>
      UpdateInputResponse();
}
