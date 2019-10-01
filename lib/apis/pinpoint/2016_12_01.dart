import 'package:meta/meta.dart';

/// Doc Engage API - Amazon Pinpoint API
class PinpointApi {
  /// Creates an application.
  Future<void> createApp(
      CreateApplicationRequest createApplicationRequest) async {}

  /// Creates a new campaign for an application or updates the settings of an
  /// existing campaign for an application.
  Future<void> createCampaign(
      {@required String applicationId,
      @required WriteCampaignRequest writeCampaignRequest}) async {}

  /// Creates a new export job for an application.
  Future<void> createExportJob(
      {@required String applicationId,
      @required ExportJobRequest exportJobRequest}) async {}

  /// Creates a new import job for an application.
  Future<void> createImportJob(
      {@required String applicationId,
      @required ImportJobRequest importJobRequest}) async {}

  /// Creates a new segment for an application or updates the configuration,
  /// dimension, and other settings for an existing segment that's associated
  /// with an application.
  Future<void> createSegment(
      {@required String applicationId,
      @required WriteSegmentRequest writeSegmentRequest}) async {}

  /// Disables the ADM channel for an application and deletes any existing
  /// settings for the channel.
  Future<void> deleteAdmChannel(String applicationId) async {}

  /// Disables the APNs channel for an application and deletes any existing
  /// settings for the channel.
  Future<void> deleteApnsChannel(String applicationId) async {}

  /// Disables the APNs sandbox channel for an application and deletes any
  /// existing settings for the channel.
  Future<void> deleteApnsSandboxChannel(String applicationId) async {}

  /// Disables the APNs VoIP channel for an application and deletes any existing
  /// settings for the channel.
  Future<void> deleteApnsVoipChannel(String applicationId) async {}

  /// Disables the APNs VoIP sandbox channel for an application and deletes any
  /// existing settings for the channel.
  Future<void> deleteApnsVoipSandboxChannel(String applicationId) async {}

  /// Deletes an application.
  Future<void> deleteApp(String applicationId) async {}

  /// Disables the Baidu channel for an application and deletes any existing
  /// settings for the channel.
  Future<void> deleteBaiduChannel(String applicationId) async {}

  /// Deletes a campaign from an application.
  Future<void> deleteCampaign(
      {@required String applicationId, @required String campaignId}) async {}

  /// Disables the email channel for an application and deletes any existing
  /// settings for the channel.
  Future<void> deleteEmailChannel(String applicationId) async {}

  /// Deletes an endpoint from an application.
  Future<void> deleteEndpoint(
      {@required String applicationId, @required String endpointId}) async {}

  /// Deletes the event stream for an application.
  Future<void> deleteEventStream(String applicationId) async {}

  /// Disables the GCM channel for an application and deletes any existing
  /// settings for the channel.
  Future<void> deleteGcmChannel(String applicationId) async {}

  /// Deletes a segment from an application.
  Future<void> deleteSegment(
      {@required String applicationId, @required String segmentId}) async {}

  /// Disables the SMS channel for an application and deletes any existing
  /// settings for the channel.
  Future<void> deleteSmsChannel(String applicationId) async {}

  /// Deletes all the endpoints that are associated with a specific user ID.
  Future<void> deleteUserEndpoints(
      {@required String applicationId, @required String userId}) async {}

  /// Disables the voice channel for an application and deletes any existing
  /// settings for the channel.
  Future<void> deleteVoiceChannel(String applicationId) async {}

  /// Retrieves information about the status and settings of the ADM channel for
  /// an application.
  Future<void> getAdmChannel(String applicationId) async {}

  /// Retrieves information about the status and settings of the APNs channel
  /// for an application.
  Future<void> getApnsChannel(String applicationId) async {}

  /// Retrieves information about the status and settings of the APNs sandbox
  /// channel for an application.
  Future<void> getApnsSandboxChannel(String applicationId) async {}

  /// Retrieves information about the status and settings of the APNs VoIP
  /// channel for an application.
  Future<void> getApnsVoipChannel(String applicationId) async {}

  /// Retrieves information about the status and settings of the APNs VoIP
  /// sandbox channel for an application.
  Future<void> getApnsVoipSandboxChannel(String applicationId) async {}

  /// Retrieves information about an application.
  Future<void> getApp(String applicationId) async {}

  /// Retrieves (queries) pre-aggregated data for a standard metric that applies
  /// to an application.
  Future<void> getApplicationDateRangeKpi(
      {@required String applicationId,
      DateTime endTime,
      @required String kpiName,
      String nextToken,
      String pageSize,
      DateTime startTime}) async {}

  /// Retrieves information about the settings for an application.
  Future<void> getApplicationSettings(String applicationId) async {}

  /// Retrieves information about all of your applications.
  Future<void> getApps({String pageSize, String token}) async {}

  /// Retrieves information about the status and settings of the Baidu Cloud
  /// Push channel for an application.
  Future<void> getBaiduChannel(String applicationId) async {}

  /// Retrieves information about the status, configuration, and other settings
  /// for a campaign.
  Future<void> getCampaign(
      {@required String applicationId, @required String campaignId}) async {}

  /// Retrieves information about the activity performed by a campaign.
  Future<void> getCampaignActivities(
      {@required String applicationId,
      @required String campaignId,
      String pageSize,
      String token}) async {}

  /// Retrieves (queries) pre-aggregated data for a standard metric that applies
  /// to a campaign.
  Future<void> getCampaignDateRangeKpi(
      {@required String applicationId,
      @required String campaignId,
      DateTime endTime,
      @required String kpiName,
      String nextToken,
      String pageSize,
      DateTime startTime}) async {}

  /// Retrieves information about the status, configuration, and other settings
  /// for a specific version of a campaign.
  Future<void> getCampaignVersion(
      {@required String applicationId,
      @required String campaignId,
      @required String version}) async {}

  /// Retrieves information about the status, configuration, and other settings
  /// for all versions of a specific campaign.
  Future<void> getCampaignVersions(
      {@required String applicationId,
      @required String campaignId,
      String pageSize,
      String token}) async {}

  /// Retrieves information about the status, configuration, and other settings
  /// for all the campaigns that are associated with an application.
  Future<void> getCampaigns(String applicationId,
      {String pageSize, String token}) async {}

  /// Retrieves information about the history and status of each channel for an
  /// application.
  Future<void> getChannels(String applicationId) async {}

  /// Retrieves information about the status and settings of the email channel
  /// for an application.
  Future<void> getEmailChannel(String applicationId) async {}

  /// Retrieves information about the settings and attributes of a specific
  /// endpoint for an application.
  Future<void> getEndpoint(
      {@required String applicationId, @required String endpointId}) async {}

  /// Retrieves information about the event stream settings for an application.
  Future<void> getEventStream(String applicationId) async {}

  /// Retrieves information about the status and settings of a specific export
  /// job for an application.
  Future<void> getExportJob(
      {@required String applicationId, @required String jobId}) async {}

  /// Retrieves information about the status and settings of all the export jobs
  /// for an application.
  Future<void> getExportJobs(String applicationId,
      {String pageSize, String token}) async {}

  /// Retrieves information about the status and settings of the GCM channel for
  /// an application.
  Future<void> getGcmChannel(String applicationId) async {}

  /// Retrieves information about the status and settings of a specific import
  /// job for an application.
  Future<void> getImportJob(
      {@required String applicationId, @required String jobId}) async {}

  /// Retrieves information about the status and settings of all the import jobs
  /// for an application.
  Future<void> getImportJobs(String applicationId,
      {String pageSize, String token}) async {}

  /// Retrieves information about the configuration, dimension, and other
  /// settings for a specific segment that's associated with an application.
  Future<void> getSegment(
      {@required String applicationId, @required String segmentId}) async {}

  /// Retrieves information about the status and settings of the export jobs for
  /// a segment.
  Future<void> getSegmentExportJobs(
      {@required String applicationId,
      String pageSize,
      @required String segmentId,
      String token}) async {}

  /// Retrieves information about the status and settings of the import jobs for
  /// a segment.
  Future<void> getSegmentImportJobs(
      {@required String applicationId,
      String pageSize,
      @required String segmentId,
      String token}) async {}

  /// Retrieves information about the configuration, dimension, and other
  /// settings for a specific version of a segment that's associated with an
  /// application.
  Future<void> getSegmentVersion(
      {@required String applicationId,
      @required String segmentId,
      @required String version}) async {}

  /// Retrieves information about the configuration, dimension, and other
  /// settings for all versions of a specific segment that's associated with an
  /// application.
  Future<void> getSegmentVersions(
      {@required String applicationId,
      String pageSize,
      @required String segmentId,
      String token}) async {}

  /// Retrieves information about the configuration, dimension, and other
  /// settings for all the segments that are associated with an application.
  Future<void> getSegments(String applicationId,
      {String pageSize, String token}) async {}

  /// Retrieves information about the status and settings of the SMS channel for
  /// an application.
  Future<void> getSmsChannel(String applicationId) async {}

  /// Retrieves information about all the endpoints that are associated with a
  /// specific user ID.
  Future<void> getUserEndpoints(
      {@required String applicationId, @required String userId}) async {}

  /// Retrieves information about the status and settings of the voice channel
  /// for an application.
  Future<void> getVoiceChannel(String applicationId) async {}

  /// Retrieves all the tags (keys and values) that are associated with an
  /// application, campaign, or segment.
  Future<void> listTagsForResource(String resourceArn) async {}

  /// Retrieves information about a phone number.
  Future<void> phoneNumberValidate(
      NumberValidateRequest numberValidateRequest) async {}

  /// Creates a new event stream for an application or updates the settings of
  /// an existing event stream for an application.
  Future<void> putEventStream(
      {@required String applicationId,
      @required WriteEventStream writeEventStream}) async {}

  /// Creates a new event to record for endpoints, or creates or updates
  /// endpoint data that existing events are associated with.
  Future<void> putEvents(
      {@required String applicationId,
      @required EventsRequest eventsRequest}) async {}

  /// Removes one or more attributes, of the same attribute type, from all the
  /// endpoints that are associated with an application.
  Future<void> removeAttributes(
      {@required String applicationId,
      @required String attributeType,
      @required UpdateAttributesRequest updateAttributesRequest}) async {}

  /// Creates and sends a direct message.
  Future<void> sendMessages(
      {@required String applicationId,
      @required MessageRequest messageRequest}) async {}

  /// Creates and sends a message to a list of users.
  Future<void> sendUsersMessages(
      {@required String applicationId,
      @required SendUsersMessageRequest sendUsersMessageRequest}) async {}

  /// Adds one or more tags (keys and values) to an application, campaign, or
  /// segment.
  Future<void> tagResource(
      {@required String resourceArn, @required TagsModel tagsModel}) async {}

  /// Removes one or more tags (keys and values) from an application, campaign,
  /// or segment.
  Future<void> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {}

  /// Updates the ADM channel settings for an application.
  Future<void> updateAdmChannel(
      {@required AdmChannelRequest admChannelRequest,
      @required String applicationId}) async {}

  /// Updates the APNs channel settings for an application.
  Future<void> updateApnsChannel(
      {@required ApnsChannelRequest apnsChannelRequest,
      @required String applicationId}) async {}

  /// Updates the APNs sandbox channel settings for an application.
  Future<void> updateApnsSandboxChannel(
      {@required ApnsSandboxChannelRequest apnsSandboxChannelRequest,
      @required String applicationId}) async {}

  /// Updates the APNs VoIP channel settings for an application.
  Future<void> updateApnsVoipChannel(
      {@required ApnsVoipChannelRequest apnsVoipChannelRequest,
      @required String applicationId}) async {}

  /// Updates the settings for the APNs VoIP sandbox channel for an application.
  Future<void> updateApnsVoipSandboxChannel(
      {@required ApnsVoipSandboxChannelRequest apnsVoipSandboxChannelRequest,
      @required String applicationId}) async {}

  /// Updates the settings for an application.
  Future<void> updateApplicationSettings(
      {@required
          String applicationId,
      @required
          WriteApplicationSettingsRequest
              writeApplicationSettingsRequest}) async {}

  /// Updates the settings of the Baidu channel for an application.
  Future<void> updateBaiduChannel(
      {@required String applicationId,
      @required BaiduChannelRequest baiduChannelRequest}) async {}

  /// Updates the settings for a campaign.
  Future<void> updateCampaign(
      {@required String applicationId,
      @required String campaignId,
      @required WriteCampaignRequest writeCampaignRequest}) async {}

  /// Updates the status and settings of the email channel for an application.
  Future<void> updateEmailChannel(
      {@required String applicationId,
      @required EmailChannelRequest emailChannelRequest}) async {}

  /// Creates a new endpoint for an application or updates the settings and
  /// attributes of an existing endpoint for an application. You can also use
  /// this operation to define custom attributes (Attributes, Metrics, and
  /// UserAttributes properties) for an endpoint.
  Future<void> updateEndpoint(
      {@required String applicationId,
      @required String endpointId,
      @required EndpointRequest endpointRequest}) async {}

  /// Creates a new batch of endpoints for an application or updates the
  /// settings and attributes of a batch of existing endpoints for an
  /// application. You can also use this operation to define custom attributes
  /// (Attributes, Metrics, and UserAttributes properties) for a batch of
  /// endpoints.
  Future<void> updateEndpointsBatch(
      {@required String applicationId,
      @required EndpointBatchRequest endpointBatchRequest}) async {}

  /// Updates the status and settings of the GCM channel for an application.
  Future<void> updateGcmChannel(
      {@required String applicationId,
      @required GcmChannelRequest gcmChannelRequest}) async {}

  /// Creates a new segment for an application or updates the configuration,
  /// dimension, and other settings for an existing segment that's associated
  /// with an application.
  Future<void> updateSegment(
      {@required String applicationId,
      @required String segmentId,
      @required WriteSegmentRequest writeSegmentRequest}) async {}

  /// Updates the status and settings of the SMS channel for an application.
  Future<void> updateSmsChannel(
      {@required String applicationId,
      @required SmsChannelRequest smsChannelRequest}) async {}

  /// Updates the status and settings of the voice channel for an application.
  Future<void> updateVoiceChannel(
      {@required String applicationId,
      @required VoiceChannelRequest voiceChannelRequest}) async {}
}

class AdmChannelRequest {}

class AdmChannelResponse {}

class AdmMessage {}

class ApnsChannelRequest {}

class ApnsChannelResponse {}

class ApnsMessage {}

class ApnsSandboxChannelRequest {}

class ApnsSandboxChannelResponse {}

class ApnsVoipChannelRequest {}

class ApnsVoipChannelResponse {}

class ApnsVoipSandboxChannelRequest {}

class ApnsVoipSandboxChannelResponse {}

class ActivitiesResponse {}

class ActivityResponse {}

class AddressConfiguration {}

class ApplicationDateRangeKpiResponse {}

class ApplicationResponse {}

class ApplicationSettingsResource {}

class ApplicationsResponse {}

class AttributeDimension {}

class AttributesResource {}

class BaiduChannelRequest {}

class BaiduChannelResponse {}

class BaiduMessage {}

class BaseKpiResult {}

class CampaignDateRangeKpiResponse {}

class CampaignEmailMessage {}

class CampaignEventFilter {}

class CampaignHook {}

class CampaignLimits {}

class CampaignResponse {}

class CampaignSmsMessage {}

class CampaignState {}

class CampaignsResponse {}

class ChannelResponse {}

class ChannelsResponse {}

class CreateAppResponse {}

class CreateApplicationRequest {}

class CreateCampaignResponse {}

class CreateExportJobResponse {}

class CreateImportJobResponse {}

class CreateSegmentResponse {}

class DefaultMessage {}

class DefaultPushNotificationMessage {}

class DeleteAdmChannelResponse {}

class DeleteApnsChannelResponse {}

class DeleteApnsSandboxChannelResponse {}

class DeleteApnsVoipChannelResponse {}

class DeleteApnsVoipSandboxChannelResponse {}

class DeleteAppResponse {}

class DeleteBaiduChannelResponse {}

class DeleteCampaignResponse {}

class DeleteEmailChannelResponse {}

class DeleteEndpointResponse {}

class DeleteEventStreamResponse {}

class DeleteGcmChannelResponse {}

class DeleteSegmentResponse {}

class DeleteSmsChannelResponse {}

class DeleteUserEndpointsResponse {}

class DeleteVoiceChannelResponse {}

class DirectMessageConfiguration {}

class EmailChannelRequest {}

class EmailChannelResponse {}

class EmailMessage {}

class EndpointBatchItem {}

class EndpointBatchRequest {}

class EndpointDemographic {}

class EndpointItemResponse {}

class EndpointLocation {}

class EndpointMessageResult {}

class EndpointRequest {}

class EndpointResponse {}

class EndpointSendConfiguration {}

class EndpointUser {}

class EndpointsResponse {}

class Event {}

class EventDimensions {}

class EventItemResponse {}

class EventStream {}

class EventsBatch {}

class EventsRequest {}

class EventsResponse {}

class ExportJobRequest {}

class ExportJobResource {}

class ExportJobResponse {}

class ExportJobsResponse {}

class GcmChannelRequest {}

class GcmChannelResponse {}

class GcmMessage {}

class GpsCoordinates {}

class GpsPointDimension {}

class GetAdmChannelResponse {}

class GetApnsChannelResponse {}

class GetApnsSandboxChannelResponse {}

class GetApnsVoipChannelResponse {}

class GetApnsVoipSandboxChannelResponse {}

class GetAppResponse {}

class GetApplicationDateRangeKpiResponse {}

class GetApplicationSettingsResponse {}

class GetAppsResponse {}

class GetBaiduChannelResponse {}

class GetCampaignActivitiesResponse {}

class GetCampaignDateRangeKpiResponse {}

class GetCampaignResponse {}

class GetCampaignVersionResponse {}

class GetCampaignVersionsResponse {}

class GetCampaignsResponse {}

class GetChannelsResponse {}

class GetEmailChannelResponse {}

class GetEndpointResponse {}

class GetEventStreamResponse {}

class GetExportJobResponse {}

class GetExportJobsResponse {}

class GetGcmChannelResponse {}

class GetImportJobResponse {}

class GetImportJobsResponse {}

class GetSegmentExportJobsResponse {}

class GetSegmentImportJobsResponse {}

class GetSegmentResponse {}

class GetSegmentVersionResponse {}

class GetSegmentVersionsResponse {}

class GetSegmentsResponse {}

class GetSmsChannelResponse {}

class GetUserEndpointsResponse {}

class GetVoiceChannelResponse {}

class ImportJobRequest {}

class ImportJobResource {}

class ImportJobResponse {}

class ImportJobsResponse {}

class ItemResponse {}

class ListTagsForResourceResponse {}

class Message {}

class MessageBody {}

class MessageConfiguration {}

class MessageRequest {}

class MessageResponse {}

class MessageResult {}

class MetricDimension {}

class NumberValidateRequest {}

class NumberValidateResponse {}

class PhoneNumberValidateResponse {}

class PublicEndpoint {}

class PutEventStreamResponse {}

class PutEventsResponse {}

class QuietTime {}

class RawEmail {}

class RecencyDimension {}

class RemoveAttributesResponse {}

class ResultRow {}

class ResultRowValue {}

class SmsChannelRequest {}

class SmsChannelResponse {}

class SmsMessage {}

class Schedule {}

class SegmentBehaviors {}

class SegmentDemographics {}

class SegmentDimensions {}

class SegmentGroup {}

class SegmentGroupList {}

class SegmentImportResource {}

class SegmentLocation {}

class SegmentReference {}

class SegmentResponse {}

class SegmentsResponse {}

class SendMessagesResponse {}

class SendUsersMessageRequest {}

class SendUsersMessageResponse {}

class SendUsersMessagesResponse {}

class Session {}

class SetDimension {}

class SimpleEmail {}

class SimpleEmailPart {}

class TagsModel {}

class TreatmentResource {}

class UpdateAdmChannelResponse {}

class UpdateApnsChannelResponse {}

class UpdateApnsSandboxChannelResponse {}

class UpdateApnsVoipChannelResponse {}

class UpdateApnsVoipSandboxChannelResponse {}

class UpdateApplicationSettingsResponse {}

class UpdateAttributesRequest {}

class UpdateBaiduChannelResponse {}

class UpdateCampaignResponse {}

class UpdateEmailChannelResponse {}

class UpdateEndpointResponse {}

class UpdateEndpointsBatchResponse {}

class UpdateGcmChannelResponse {}

class UpdateSegmentResponse {}

class UpdateSmsChannelResponse {}

class UpdateVoiceChannelResponse {}

class VoiceChannelRequest {}

class VoiceChannelResponse {}

class VoiceMessage {}

class WriteApplicationSettingsRequest {}

class WriteCampaignRequest {}

class WriteEventStream {}

class WriteSegmentRequest {}

class WriteTreatmentResource {}
