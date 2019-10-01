import 'package:meta/meta.dart';

/// Pinpoint SMS and Voice Messaging public facing APIs
class PinpointSmsVoiceApi {
  /// Create a new configuration set. After you create the configuration set,
  /// you can add one or more event destinations to it.
  Future<void> createConfigurationSet({String configurationSetName}) async {}

  /// Create a new event destination in a configuration set.
  Future<void> createConfigurationSetEventDestination(
      String configurationSetName,
      {EventDestinationDefinition eventDestination,
      String eventDestinationName}) async {}

  /// Deletes an existing configuration set.
  Future<void> deleteConfigurationSet(String configurationSetName) async {}

  /// Deletes an event destination in a configuration set.
  Future<void> deleteConfigurationSetEventDestination(
      {@required String configurationSetName,
      @required String eventDestinationName}) async {}

  /// Obtain information about an event destination, including the types of
  /// events it reports, the Amazon Resource Name (ARN) of the destination, and
  /// the name of the event destination.
  Future<void> getConfigurationSetEventDestinations(
      String configurationSetName) async {}

  /// List all of the configuration sets associated with your Amazon Pinpoint
  /// account in the current region.
  Future<void> listConfigurationSets(
      {String nextToken, String pageSize}) async {}

  /// Create a new voice message and send it to a recipient's phone number.
  Future<void> sendVoiceMessage(
      {String callerId,
      String configurationSetName,
      VoiceMessageContent content,
      String destinationPhoneNumber,
      String originationPhoneNumber}) async {}

  /// Update an event destination in a configuration set. An event destination
  /// is a location that you publish information about your voice calls to. For
  /// example, you can log an event to an Amazon CloudWatch destination when a
  /// call fails.
  Future<void> updateConfigurationSetEventDestination(
      {@required String configurationSetName,
      EventDestinationDefinition eventDestination,
      @required String eventDestinationName}) async {}
}

class CallInstructionsMessageType {}

class CloudWatchLogsDestination {}

class CreateConfigurationSetEventDestinationResponse {}

class CreateConfigurationSetResponse {}

class DeleteConfigurationSetEventDestinationResponse {}

class DeleteConfigurationSetResponse {}

class EventDestination {}

class EventDestinationDefinition {}

class GetConfigurationSetEventDestinationsResponse {}

class KinesisFirehoseDestination {}

class ListConfigurationSetsResponse {}

class PlainTextMessageType {}

class SsmlMessageType {}

class SendVoiceMessageResponse {}

class SnsDestination {}

class UpdateConfigurationSetEventDestinationResponse {}

class VoiceMessageContent {}
