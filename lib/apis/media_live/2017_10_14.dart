import 'package:meta/meta.dart';

/// API for AWS Elemental MediaLive
class MediaLiveApi {
  /// Update a channel schedule
  Future<void> batchUpdateSchedule(String channelId,
      {BatchScheduleActionCreateRequest creates,
      BatchScheduleActionDeleteRequest deletes}) async {}

  /// Creates a new channel
  Future<void> createChannel(
      {String channelClass,
      List<OutputDestination> destinations,
      EncoderSettings encoderSettings,
      List<InputAttachment> inputAttachments,
      InputSpecification inputSpecification,
      String logLevel,
      String name,
      String requestId,
      String reserved,
      String roleArn,
      Map<String, String> tags}) async {}

  /// Create an input
  Future<void> createInput(
      {List<InputDestinationRequest> destinations,
      List<String> inputSecurityGroups,
      List<MediaConnectFlowRequest> mediaConnectFlows,
      String name,
      String requestId,
      String roleArn,
      List<InputSourceRequest> sources,
      Map<String, String> tags,
      String type,
      InputVpcRequest vpc}) async {}

  /// Creates a Input Security Group
  Future<void> createInputSecurityGroup(
      {Map<String, String> tags,
      List<InputWhitelistRuleCidr> whitelistRules}) async {}

  /// Create tags for a resource
  Future<void> createTags(String resourceArn,
      {Map<String, String> tags}) async {}

  /// Starts deletion of channel. The associated outputs are also deleted.
  Future<void> deleteChannel(String channelId) async {}

  /// Deletes the input end point
  Future<void> deleteInput(String inputId) async {}

  /// Deletes an Input Security Group
  Future<void> deleteInputSecurityGroup(String inputSecurityGroupId) async {}

  /// Delete an expired reservation.
  Future<void> deleteReservation(String reservationId) async {}

  /// Delete all schedule actions on a channel.
  Future<void> deleteSchedule(String channelId) async {}

  /// Removes tags for a resource
  Future<void> deleteTags(
      {@required String resourceArn, @required List<String> tagKeys}) async {}

  /// Gets details about a channel
  Future<void> describeChannel(String channelId) async {}

  /// Produces details about an input
  Future<void> describeInput(String inputId) async {}

  /// Produces a summary of an Input Security Group
  Future<void> describeInputSecurityGroup(String inputSecurityGroupId) async {}

  /// Get details for an offering.
  Future<void> describeOffering(String offeringId) async {}

  /// Get details for a reservation.
  Future<void> describeReservation(String reservationId) async {}

  /// Get a channel schedule
  Future<void> describeSchedule(String channelId,
      {int maxResults, String nextToken}) async {}

  /// Produces list of channels that have been created
  Future<void> listChannels({int maxResults, String nextToken}) async {}

  /// Produces a list of Input Security Groups for an account
  Future<void> listInputSecurityGroups(
      {int maxResults, String nextToken}) async {}

  /// Produces list of inputs that have been created
  Future<void> listInputs({int maxResults, String nextToken}) async {}

  /// List offerings available for purchase.
  Future<void> listOfferings(
      {String channelClass,
      String channelConfiguration,
      String codec,
      int maxResults,
      String maximumBitrate,
      String maximumFramerate,
      String nextToken,
      String resolution,
      String resourceType,
      String specialFeature,
      String videoQuality}) async {}

  /// List purchased reservations.
  Future<void> listReservations(
      {String channelClass,
      String codec,
      int maxResults,
      String maximumBitrate,
      String maximumFramerate,
      String nextToken,
      String resolution,
      String resourceType,
      String specialFeature,
      String videoQuality}) async {}

  /// Produces list of tags that have been created for a resource
  Future<void> listTagsForResource(String resourceArn) async {}

  /// Purchase an offering and create a reservation.
  Future<void> purchaseOffering(
      {@required int count,
      String name,
      @required String offeringId,
      String requestId,
      String start,
      Map<String, String> tags}) async {}

  /// Starts an existing channel
  Future<void> startChannel(String channelId) async {}

  /// Stops a running channel
  Future<void> stopChannel(String channelId) async {}

  /// Updates a channel.
  Future<void> updateChannel(String channelId,
      {List<OutputDestination> destinations,
      EncoderSettings encoderSettings,
      List<InputAttachment> inputAttachments,
      InputSpecification inputSpecification,
      String logLevel,
      String name,
      String roleArn}) async {}

  /// Changes the class of the channel.
  Future<void> updateChannelClass(
      {@required String channelClass,
      @required String channelId,
      List<OutputDestination> destinations}) async {}

  /// Updates an input.
  Future<void> updateInput(String inputId,
      {List<InputDestinationRequest> destinations,
      List<String> inputSecurityGroups,
      List<MediaConnectFlowRequest> mediaConnectFlows,
      String name,
      String roleArn,
      List<InputSourceRequest> sources}) async {}

  /// Update an Input Security Group's Whilelists.
  Future<void> updateInputSecurityGroup(String inputSecurityGroupId,
      {Map<String, String> tags,
      List<InputWhitelistRuleCidr> whitelistRules}) async {}

  /// Update reservation.
  Future<void> updateReservation(String reservationId, {String name}) async {}
}

class AacSettings {}

class Ac3Settings {}

class ArchiveContainerSettings {}

class ArchiveGroupSettings {}

class ArchiveOutputSettings {}

class AribDestinationSettings {}

class AribSourceSettings {}

class AudioChannelMapping {}

class AudioCodecSettings {}

class AudioDescription {}

class AudioLanguageSelection {}

class AudioNormalizationSettings {}

class AudioOnlyHlsSettings {}

class AudioPidSelection {}

class AudioSelector {}

class AudioSelectorSettings {}

class AvailBlanking {}

class AvailConfiguration {}

class AvailSettings {}

class BatchScheduleActionCreateRequest {}

class BatchScheduleActionCreateResult {}

class BatchScheduleActionDeleteRequest {}

class BatchScheduleActionDeleteResult {}

class BatchUpdateScheduleResponse {}

class BlackoutSlate {}

class BurnInDestinationSettings {}

class CaptionDescription {}

class CaptionDestinationSettings {}

class CaptionLanguageMapping {}

class CaptionSelector {}

class CaptionSelectorSettings {}

class Channel {}

class ChannelEgressEndpoint {}

class ChannelSummary {}

class ColorSpacePassthroughSettings {}

class CreateChannelResponse {}

class CreateInputResponse {}

class CreateInputSecurityGroupResponse {}

class DeleteChannelResponse {}

class DeleteInputResponse {}

class DeleteInputSecurityGroupResponse {}

class DeleteReservationResponse {}

class DeleteScheduleResponse {}

class DescribeChannelResponse {}

class DescribeInputResponse {}

class DescribeInputSecurityGroupResponse {}

class DescribeOfferingResponse {}

class DescribeReservationResponse {}

class DescribeScheduleResponse {}

class DvbNitSettings {}

class DvbSdtSettings {}

class DvbSubDestinationSettings {}

class DvbSubSourceSettings {}

class DvbTdtSettings {}

class Eac3Settings {}

class EmbeddedDestinationSettings {}

class EmbeddedPlusScte20DestinationSettings {}

class EmbeddedSourceSettings {}

class EncoderSettings {}

class FecOutputSettings {}

class FixedModeScheduleActionStartSettings {}

class FollowModeScheduleActionStartSettings {}

class FrameCaptureGroupSettings {}

class FrameCaptureOutputSettings {}

class FrameCaptureSettings {}

class GlobalConfiguration {}

class H264ColorSpaceSettings {}

class H264Settings {}

class H265ColorSpaceSettings {}

class H265Settings {}

class Hdr10Settings {}

class HlsAkamaiSettings {}

class HlsBasicPutSettings {}

class HlsCdnSettings {}

class HlsGroupSettings {}

class HlsInputSettings {}

class HlsMediaStoreSettings {}

class HlsOutputSettings {}

class HlsSettings {}

class HlsTimedMetadataScheduleActionSettings {}

class HlsWebdavSettings {}

class ImmediateModeScheduleActionStartSettings {}

class Input {}

class InputAttachment {}

class InputChannelLevel {}

class InputClippingSettings {}

class InputDestination {}

class InputDestinationRequest {}

class InputDestinationVpc {}

class InputLocation {}

class InputLossBehavior {}

class InputSecurityGroup {}

class InputSettings {}

class InputSource {}

class InputSourceRequest {}

class InputSpecification {}

class InputSwitchScheduleActionSettings {}

class InputVpcRequest {}

class InputWhitelistRule {}

class InputWhitelistRuleCidr {}

class KeyProviderSettings {}

class ListChannelsResponse {}

class ListInputSecurityGroupsResponse {}

class ListInputsResponse {}

class ListOfferingsResponse {}

class ListReservationsResponse {}

class ListTagsForResourceResponse {}

class M2TsSettings {}

class M3U8Settings {}

class MediaConnectFlow {}

class MediaConnectFlowRequest {}

class MediaPackageGroupSettings {}

class MediaPackageOutputDestinationSettings {}

class MediaPackageOutputSettings {}

class Mp2Settings {}

class MsSmoothGroupSettings {}

class MsSmoothOutputSettings {}

class NetworkInputSettings {}

class Offering {}

class Output {}

class OutputDestination {}

class OutputDestinationSettings {}

class OutputGroup {}

class OutputGroupSettings {}

class OutputLocationRef {}

class OutputSettings {}

class PassThroughSettings {}

class PauseStateScheduleActionSettings {}

class PipelineDetail {}

class PipelinePauseStateSettings {}

class PurchaseOfferingResponse {}

class Rec601Settings {}

class Rec709Settings {}

class RemixSettings {}

class Reservation {}

class ReservationResourceSpecification {}

class RtmpCaptionInfoDestinationSettings {}

class RtmpGroupSettings {}

class RtmpOutputSettings {}

class ScheduleAction {}

class ScheduleActionSettings {}

class ScheduleActionStartSettings {}

class Scte20PlusEmbeddedDestinationSettings {}

class Scte20SourceSettings {}

class Scte27DestinationSettings {}

class Scte27SourceSettings {}

class Scte35DeliveryRestrictions {}

class Scte35Descriptor {}

class Scte35DescriptorSettings {}

class Scte35ReturnToNetworkScheduleActionSettings {}

class Scte35SegmentationDescriptor {}

class Scte35SpliceInsert {}

class Scte35SpliceInsertScheduleActionSettings {}

class Scte35TimeSignalApos {}

class Scte35TimeSignalScheduleActionSettings {}

class SmpteTtDestinationSettings {}

class StandardHlsSettings {}

class StartChannelResponse {}

class StartTimecode {}

class StaticImageActivateScheduleActionSettings {}

class StaticImageDeactivateScheduleActionSettings {}

class StaticKeySettings {}

class StopChannelResponse {}

class StopTimecode {}

class TeletextDestinationSettings {}

class TeletextSourceSettings {}

class TimecodeConfig {}

class TtmlDestinationSettings {}

class UdpContainerSettings {}

class UdpGroupSettings {}

class UdpOutputSettings {}

class UpdateChannelClassResponse {}

class UpdateChannelResponse {}

class UpdateInputResponse {}

class UpdateInputSecurityGroupResponse {}

class UpdateReservationResponse {}

class VideoCodecSettings {}

class VideoDescription {}

class VideoSelector {}

class VideoSelectorPid {}

class VideoSelectorProgramId {}

class VideoSelectorSettings {}

class WebvttDestinationSettings {}
