import 'package:meta/meta.dart';

/// Pinpoint SMS and Voice Messaging public facing APIs
class PinpointSmsVoiceApi {
  final _client;
  PinpointSmsVoiceApi(client)
      : _client =
            client.configured('Pinpoint SMS Voice', serializer: 'rest-json');

  /// Create a new configuration set. After you create the configuration set,
  /// you can add one or more event destinations to it.
  ///
  /// [configurationSetName]: The name that you want to give the configuration
  /// set.
  Future<CreateConfigurationSetResponse> createConfigurationSet(
      {String configurationSetName}) async {
    var response_ = await _client.send('CreateConfigurationSet', {
      if (configurationSetName != null)
        'ConfigurationSetName': configurationSetName,
    });
    return CreateConfigurationSetResponse.fromJson(response_);
  }

  /// Create a new event destination in a configuration set.
  ///
  /// [configurationSetName]: ConfigurationSetName
  ///
  /// [eventDestinationName]: A name that identifies the event destination.
  Future<CreateConfigurationSetEventDestinationResponse>
      createConfigurationSetEventDestination(String configurationSetName,
          {EventDestinationDefinition eventDestination,
          String eventDestinationName}) async {
    var response_ =
        await _client.send('CreateConfigurationSetEventDestination', {
      'ConfigurationSetName': configurationSetName,
      if (eventDestination != null) 'EventDestination': eventDestination,
      if (eventDestinationName != null)
        'EventDestinationName': eventDestinationName,
    });
    return CreateConfigurationSetEventDestinationResponse.fromJson(response_);
  }

  /// Deletes an existing configuration set.
  ///
  /// [configurationSetName]: ConfigurationSetName
  Future<DeleteConfigurationSetResponse> deleteConfigurationSet(
      String configurationSetName) async {
    var response_ = await _client.send('DeleteConfigurationSet', {
      'ConfigurationSetName': configurationSetName,
    });
    return DeleteConfigurationSetResponse.fromJson(response_);
  }

  /// Deletes an event destination in a configuration set.
  ///
  /// [configurationSetName]: ConfigurationSetName
  ///
  /// [eventDestinationName]: EventDestinationName
  Future<DeleteConfigurationSetEventDestinationResponse>
      deleteConfigurationSetEventDestination(
          {@required String configurationSetName,
          @required String eventDestinationName}) async {
    var response_ =
        await _client.send('DeleteConfigurationSetEventDestination', {
      'ConfigurationSetName': configurationSetName,
      'EventDestinationName': eventDestinationName,
    });
    return DeleteConfigurationSetEventDestinationResponse.fromJson(response_);
  }

  /// Obtain information about an event destination, including the types of
  /// events it reports, the Amazon Resource Name (ARN) of the destination, and
  /// the name of the event destination.
  ///
  /// [configurationSetName]: ConfigurationSetName
  Future<GetConfigurationSetEventDestinationsResponse>
      getConfigurationSetEventDestinations(String configurationSetName) async {
    var response_ = await _client.send('GetConfigurationSetEventDestinations', {
      'ConfigurationSetName': configurationSetName,
    });
    return GetConfigurationSetEventDestinationsResponse.fromJson(response_);
  }

  /// List all of the configuration sets associated with your Amazon Pinpoint
  /// account in the current region.
  ///
  /// [nextToken]: A token returned from a previous call to the API that
  /// indicates the position in the list of results.
  ///
  /// [pageSize]: Used to specify the number of items that should be returned in
  /// the response.
  Future<ListConfigurationSetsResponse> listConfigurationSets(
      {String nextToken, String pageSize}) async {
    var response_ = await _client.send('ListConfigurationSets', {
      if (nextToken != null) 'NextToken': nextToken,
      if (pageSize != null) 'PageSize': pageSize,
    });
    return ListConfigurationSetsResponse.fromJson(response_);
  }

  /// Create a new voice message and send it to a recipient's phone number.
  ///
  /// [callerId]: The phone number that appears on recipients' devices when they
  /// receive the message.
  ///
  /// [configurationSetName]: The name of the configuration set that you want to
  /// use to send the message.
  ///
  /// [destinationPhoneNumber]: The phone number that you want to send the voice
  /// message to.
  ///
  /// [originationPhoneNumber]: The phone number that Amazon Pinpoint should use
  /// to send the voice message. This isn't necessarily the phone number that
  /// appears on recipients' devices when they receive the message, because you
  /// can specify a CallerId parameter in the request.
  Future<SendVoiceMessageResponse> sendVoiceMessage(
      {String callerId,
      String configurationSetName,
      VoiceMessageContent content,
      String destinationPhoneNumber,
      String originationPhoneNumber}) async {
    var response_ = await _client.send('SendVoiceMessage', {
      if (callerId != null) 'CallerId': callerId,
      if (configurationSetName != null)
        'ConfigurationSetName': configurationSetName,
      if (content != null) 'Content': content,
      if (destinationPhoneNumber != null)
        'DestinationPhoneNumber': destinationPhoneNumber,
      if (originationPhoneNumber != null)
        'OriginationPhoneNumber': originationPhoneNumber,
    });
    return SendVoiceMessageResponse.fromJson(response_);
  }

  /// Update an event destination in a configuration set. An event destination
  /// is a location that you publish information about your voice calls to. For
  /// example, you can log an event to an Amazon CloudWatch destination when a
  /// call fails.
  ///
  /// [configurationSetName]: ConfigurationSetName
  ///
  /// [eventDestinationName]: EventDestinationName
  Future<UpdateConfigurationSetEventDestinationResponse>
      updateConfigurationSetEventDestination(
          {@required String configurationSetName,
          EventDestinationDefinition eventDestination,
          @required String eventDestinationName}) async {
    var response_ =
        await _client.send('UpdateConfigurationSetEventDestination', {
      'ConfigurationSetName': configurationSetName,
      if (eventDestination != null) 'EventDestination': eventDestination,
      'EventDestinationName': eventDestinationName,
    });
    return UpdateConfigurationSetEventDestinationResponse.fromJson(response_);
  }
}

/// An object that defines a message that contains text formatted using Amazon
/// Pinpoint Voice Instructions markup.
class CallInstructionsMessageType {
  /// The language to use when delivering the message. For a complete list of
  /// supported languages, see the Amazon Polly Developer Guide.
  final String text;

  CallInstructionsMessageType({
    this.text,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// An object that contains information about an event destination that sends
/// data to Amazon CloudWatch Logs.
class CloudWatchLogsDestination {
  /// The Amazon Resource Name (ARN) of an Amazon Identity and Access Management
  /// (IAM) role that is able to write event data to an Amazon CloudWatch
  /// destination.
  final String iamRoleArn;

  /// The name of the Amazon CloudWatch Log Group that you want to record events
  /// in.
  final String logGroupArn;

  CloudWatchLogsDestination({
    this.iamRoleArn,
    this.logGroupArn,
  });
  static CloudWatchLogsDestination fromJson(Map<String, dynamic> json) =>
      CloudWatchLogsDestination(
        iamRoleArn: json.containsKey('IamRoleArn')
            ? json['IamRoleArn'] as String
            : null,
        logGroupArn: json.containsKey('LogGroupArn')
            ? json['LogGroupArn'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// An empty object that indicates that the event destination was created
/// successfully.
class CreateConfigurationSetEventDestinationResponse {
  CreateConfigurationSetEventDestinationResponse();
  static CreateConfigurationSetEventDestinationResponse fromJson(
          Map<String, dynamic> json) =>
      CreateConfigurationSetEventDestinationResponse();
}

/// An empty object that indicates that the configuration set was successfully
/// created.
class CreateConfigurationSetResponse {
  CreateConfigurationSetResponse();
  static CreateConfigurationSetResponse fromJson(Map<String, dynamic> json) =>
      CreateConfigurationSetResponse();
}

/// An empty object that indicates that the event destination was deleted
/// successfully.
class DeleteConfigurationSetEventDestinationResponse {
  DeleteConfigurationSetEventDestinationResponse();
  static DeleteConfigurationSetEventDestinationResponse fromJson(
          Map<String, dynamic> json) =>
      DeleteConfigurationSetEventDestinationResponse();
}

/// An empty object that indicates that the configuration set was deleted
/// successfully.
class DeleteConfigurationSetResponse {
  DeleteConfigurationSetResponse();
  static DeleteConfigurationSetResponse fromJson(Map<String, dynamic> json) =>
      DeleteConfigurationSetResponse();
}

/// An object that defines an event destination.
class EventDestination {
  final CloudWatchLogsDestination cloudWatchLogsDestination;

  /// Indicates whether or not the event destination is enabled. If the event
  /// destination is enabled, then Amazon Pinpoint sends response data to the
  /// specified event destination.
  final bool enabled;

  final KinesisFirehoseDestination kinesisFirehoseDestination;

  final List<String> matchingEventTypes;

  /// A name that identifies the event destination configuration.
  final String name;

  final SnsDestination snsDestination;

  EventDestination({
    this.cloudWatchLogsDestination,
    this.enabled,
    this.kinesisFirehoseDestination,
    this.matchingEventTypes,
    this.name,
    this.snsDestination,
  });
  static EventDestination fromJson(Map<String, dynamic> json) =>
      EventDestination(
        cloudWatchLogsDestination: json.containsKey('CloudWatchLogsDestination')
            ? CloudWatchLogsDestination.fromJson(
                json['CloudWatchLogsDestination'])
            : null,
        enabled: json.containsKey('Enabled') ? json['Enabled'] as bool : null,
        kinesisFirehoseDestination:
            json.containsKey('KinesisFirehoseDestination')
                ? KinesisFirehoseDestination.fromJson(
                    json['KinesisFirehoseDestination'])
                : null,
        matchingEventTypes: json.containsKey('MatchingEventTypes')
            ? (json['MatchingEventTypes'] as List)
                .map((e) => e as String)
                .toList()
            : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        snsDestination: json.containsKey('SnsDestination')
            ? SnsDestination.fromJson(json['SnsDestination'])
            : null,
      );
}

/// An object that defines a single event destination.
class EventDestinationDefinition {
  final CloudWatchLogsDestination cloudWatchLogsDestination;

  /// Indicates whether or not the event destination is enabled. If the event
  /// destination is enabled, then Amazon Pinpoint sends response data to the
  /// specified event destination.
  final bool enabled;

  final KinesisFirehoseDestination kinesisFirehoseDestination;

  final List<String> matchingEventTypes;

  final SnsDestination snsDestination;

  EventDestinationDefinition({
    this.cloudWatchLogsDestination,
    this.enabled,
    this.kinesisFirehoseDestination,
    this.matchingEventTypes,
    this.snsDestination,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// An object that contains information about an event destination.
class GetConfigurationSetEventDestinationsResponse {
  final List<EventDestination> eventDestinations;

  GetConfigurationSetEventDestinationsResponse({
    this.eventDestinations,
  });
  static GetConfigurationSetEventDestinationsResponse fromJson(
          Map<String, dynamic> json) =>
      GetConfigurationSetEventDestinationsResponse(
        eventDestinations: json.containsKey('EventDestinations')
            ? (json['EventDestinations'] as List)
                .map((e) => EventDestination.fromJson(e))
                .toList()
            : null,
      );
}

/// An object that contains information about an event destination that sends
/// data to Amazon Kinesis Data Firehose.
class KinesisFirehoseDestination {
  /// The Amazon Resource Name (ARN) of an IAM role that can write data to an
  /// Amazon Kinesis Data Firehose stream.
  final String deliveryStreamArn;

  /// The Amazon Resource Name (ARN) of the Amazon Kinesis Data Firehose
  /// destination that you want to use in the event destination.
  final String iamRoleArn;

  KinesisFirehoseDestination({
    this.deliveryStreamArn,
    this.iamRoleArn,
  });
  static KinesisFirehoseDestination fromJson(Map<String, dynamic> json) =>
      KinesisFirehoseDestination(
        deliveryStreamArn: json.containsKey('DeliveryStreamArn')
            ? json['DeliveryStreamArn'] as String
            : null,
        iamRoleArn: json.containsKey('IamRoleArn')
            ? json['IamRoleArn'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// An object that contains information about the configuration sets for your
/// account in the current region.
class ListConfigurationSetsResponse {
  /// An object that contains a list of configuration sets for your account in
  /// the current region.
  final List<String> configurationSets;

  /// A token returned from a previous call to ListConfigurationSets to indicate
  /// the position in the list of configuration sets.
  final String nextToken;

  ListConfigurationSetsResponse({
    this.configurationSets,
    this.nextToken,
  });
  static ListConfigurationSetsResponse fromJson(Map<String, dynamic> json) =>
      ListConfigurationSetsResponse(
        configurationSets: json.containsKey('ConfigurationSets')
            ? (json['ConfigurationSets'] as List)
                .map((e) => e as String)
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// An object that defines a message that contains unformatted text.
class PlainTextMessageType {
  /// The language to use when delivering the message. For a complete list of
  /// supported languages, see the Amazon Polly Developer Guide.
  final String languageCode;

  /// The plain (not SSML-formatted) text to deliver to the recipient.
  final String text;

  /// The name of the voice that you want to use to deliver the message. For a
  /// complete list of supported voices, see the Amazon Polly Developer Guide.
  final String voiceId;

  PlainTextMessageType({
    this.languageCode,
    this.text,
    this.voiceId,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// An object that defines a message that contains SSML-formatted text.
class SsmlMessageType {
  /// The language to use when delivering the message. For a complete list of
  /// supported languages, see the Amazon Polly Developer Guide.
  final String languageCode;

  /// The SSML-formatted text to deliver to the recipient.
  final String text;

  /// The name of the voice that you want to use to deliver the message. For a
  /// complete list of supported voices, see the Amazon Polly Developer Guide.
  final String voiceId;

  SsmlMessageType({
    this.languageCode,
    this.text,
    this.voiceId,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// An object that that contains the Message ID of a Voice message that was sent
/// successfully.
class SendVoiceMessageResponse {
  /// A unique identifier for the voice message.
  final String messageId;

  SendVoiceMessageResponse({
    this.messageId,
  });
  static SendVoiceMessageResponse fromJson(Map<String, dynamic> json) =>
      SendVoiceMessageResponse(
        messageId:
            json.containsKey('MessageId') ? json['MessageId'] as String : null,
      );
}

/// An object that contains information about an event destination that sends
/// data to Amazon SNS.
class SnsDestination {
  /// The Amazon Resource Name (ARN) of the Amazon SNS topic that you want to
  /// publish events to.
  final String topicArn;

  SnsDestination({
    this.topicArn,
  });
  static SnsDestination fromJson(Map<String, dynamic> json) => SnsDestination(
        topicArn:
            json.containsKey('TopicArn') ? json['TopicArn'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// An empty object that indicates that the event destination was updated
/// successfully.
class UpdateConfigurationSetEventDestinationResponse {
  UpdateConfigurationSetEventDestinationResponse();
  static UpdateConfigurationSetEventDestinationResponse fromJson(
          Map<String, dynamic> json) =>
      UpdateConfigurationSetEventDestinationResponse();
}

/// An object that contains a voice message and information about the recipient
/// that you want to send it to.
class VoiceMessageContent {
  final CallInstructionsMessageType callInstructionsMessage;

  final PlainTextMessageType plainTextMessage;

  final SsmlMessageType ssmlMessage;

  VoiceMessageContent({
    this.callInstructionsMessage,
    this.plainTextMessage,
    this.ssmlMessage,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}
