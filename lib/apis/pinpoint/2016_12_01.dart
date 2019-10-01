import 'package:meta/meta.dart';
import 'dart:typed_data';

/// Doc Engage API - Amazon Pinpoint API
class PinpointApi {
  final _client;
  PinpointApi(client)
      : _client = client.configured('Pinpoint', serializer: 'rest-json');

  /// Creates an application.
  Future<CreateAppResponse> createApp(
      CreateApplicationRequest createApplicationRequest) async {
    var response_ = await _client.send('CreateApp', {
      'CreateApplicationRequest': createApplicationRequest,
    });
    return CreateAppResponse.fromJson(response_);
  }

  /// Creates a new campaign for an application or updates the settings of an
  /// existing campaign for an application.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  Future<CreateCampaignResponse> createCampaign(
      {@required String applicationId,
      @required WriteCampaignRequest writeCampaignRequest}) async {
    var response_ = await _client.send('CreateCampaign', {
      'ApplicationId': applicationId,
      'WriteCampaignRequest': writeCampaignRequest,
    });
    return CreateCampaignResponse.fromJson(response_);
  }

  /// Creates a new export job for an application.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  Future<CreateExportJobResponse> createExportJob(
      {@required String applicationId,
      @required ExportJobRequest exportJobRequest}) async {
    var response_ = await _client.send('CreateExportJob', {
      'ApplicationId': applicationId,
      'ExportJobRequest': exportJobRequest,
    });
    return CreateExportJobResponse.fromJson(response_);
  }

  /// Creates a new import job for an application.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  Future<CreateImportJobResponse> createImportJob(
      {@required String applicationId,
      @required ImportJobRequest importJobRequest}) async {
    var response_ = await _client.send('CreateImportJob', {
      'ApplicationId': applicationId,
      'ImportJobRequest': importJobRequest,
    });
    return CreateImportJobResponse.fromJson(response_);
  }

  /// Creates a new segment for an application or updates the configuration,
  /// dimension, and other settings for an existing segment that's associated
  /// with an application.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  Future<CreateSegmentResponse> createSegment(
      {@required String applicationId,
      @required WriteSegmentRequest writeSegmentRequest}) async {
    var response_ = await _client.send('CreateSegment', {
      'ApplicationId': applicationId,
      'WriteSegmentRequest': writeSegmentRequest,
    });
    return CreateSegmentResponse.fromJson(response_);
  }

  /// Disables the ADM channel for an application and deletes any existing
  /// settings for the channel.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  Future<DeleteAdmChannelResponse> deleteAdmChannel(
      String applicationId) async {
    var response_ = await _client.send('DeleteAdmChannel', {
      'ApplicationId': applicationId,
    });
    return DeleteAdmChannelResponse.fromJson(response_);
  }

  /// Disables the APNs channel for an application and deletes any existing
  /// settings for the channel.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  Future<DeleteApnsChannelResponse> deleteApnsChannel(
      String applicationId) async {
    var response_ = await _client.send('DeleteApnsChannel', {
      'ApplicationId': applicationId,
    });
    return DeleteApnsChannelResponse.fromJson(response_);
  }

  /// Disables the APNs sandbox channel for an application and deletes any
  /// existing settings for the channel.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  Future<DeleteApnsSandboxChannelResponse> deleteApnsSandboxChannel(
      String applicationId) async {
    var response_ = await _client.send('DeleteApnsSandboxChannel', {
      'ApplicationId': applicationId,
    });
    return DeleteApnsSandboxChannelResponse.fromJson(response_);
  }

  /// Disables the APNs VoIP channel for an application and deletes any existing
  /// settings for the channel.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  Future<DeleteApnsVoipChannelResponse> deleteApnsVoipChannel(
      String applicationId) async {
    var response_ = await _client.send('DeleteApnsVoipChannel', {
      'ApplicationId': applicationId,
    });
    return DeleteApnsVoipChannelResponse.fromJson(response_);
  }

  /// Disables the APNs VoIP sandbox channel for an application and deletes any
  /// existing settings for the channel.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  Future<DeleteApnsVoipSandboxChannelResponse> deleteApnsVoipSandboxChannel(
      String applicationId) async {
    var response_ = await _client.send('DeleteApnsVoipSandboxChannel', {
      'ApplicationId': applicationId,
    });
    return DeleteApnsVoipSandboxChannelResponse.fromJson(response_);
  }

  /// Deletes an application.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  Future<DeleteAppResponse> deleteApp(String applicationId) async {
    var response_ = await _client.send('DeleteApp', {
      'ApplicationId': applicationId,
    });
    return DeleteAppResponse.fromJson(response_);
  }

  /// Disables the Baidu channel for an application and deletes any existing
  /// settings for the channel.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  Future<DeleteBaiduChannelResponse> deleteBaiduChannel(
      String applicationId) async {
    var response_ = await _client.send('DeleteBaiduChannel', {
      'ApplicationId': applicationId,
    });
    return DeleteBaiduChannelResponse.fromJson(response_);
  }

  /// Deletes a campaign from an application.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  ///
  /// [campaignId]: The unique identifier for the campaign.
  Future<DeleteCampaignResponse> deleteCampaign(
      {@required String applicationId, @required String campaignId}) async {
    var response_ = await _client.send('DeleteCampaign', {
      'ApplicationId': applicationId,
      'CampaignId': campaignId,
    });
    return DeleteCampaignResponse.fromJson(response_);
  }

  /// Disables the email channel for an application and deletes any existing
  /// settings for the channel.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  Future<DeleteEmailChannelResponse> deleteEmailChannel(
      String applicationId) async {
    var response_ = await _client.send('DeleteEmailChannel', {
      'ApplicationId': applicationId,
    });
    return DeleteEmailChannelResponse.fromJson(response_);
  }

  /// Deletes an endpoint from an application.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  ///
  /// [endpointId]: The unique identifier for the endpoint.
  Future<DeleteEndpointResponse> deleteEndpoint(
      {@required String applicationId, @required String endpointId}) async {
    var response_ = await _client.send('DeleteEndpoint', {
      'ApplicationId': applicationId,
      'EndpointId': endpointId,
    });
    return DeleteEndpointResponse.fromJson(response_);
  }

  /// Deletes the event stream for an application.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  Future<DeleteEventStreamResponse> deleteEventStream(
      String applicationId) async {
    var response_ = await _client.send('DeleteEventStream', {
      'ApplicationId': applicationId,
    });
    return DeleteEventStreamResponse.fromJson(response_);
  }

  /// Disables the GCM channel for an application and deletes any existing
  /// settings for the channel.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  Future<DeleteGcmChannelResponse> deleteGcmChannel(
      String applicationId) async {
    var response_ = await _client.send('DeleteGcmChannel', {
      'ApplicationId': applicationId,
    });
    return DeleteGcmChannelResponse.fromJson(response_);
  }

  /// Deletes a segment from an application.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  ///
  /// [segmentId]: The unique identifier for the segment.
  Future<DeleteSegmentResponse> deleteSegment(
      {@required String applicationId, @required String segmentId}) async {
    var response_ = await _client.send('DeleteSegment', {
      'ApplicationId': applicationId,
      'SegmentId': segmentId,
    });
    return DeleteSegmentResponse.fromJson(response_);
  }

  /// Disables the SMS channel for an application and deletes any existing
  /// settings for the channel.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  Future<DeleteSmsChannelResponse> deleteSmsChannel(
      String applicationId) async {
    var response_ = await _client.send('DeleteSmsChannel', {
      'ApplicationId': applicationId,
    });
    return DeleteSmsChannelResponse.fromJson(response_);
  }

  /// Deletes all the endpoints that are associated with a specific user ID.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  ///
  /// [userId]: The unique identifier for the user.
  Future<DeleteUserEndpointsResponse> deleteUserEndpoints(
      {@required String applicationId, @required String userId}) async {
    var response_ = await _client.send('DeleteUserEndpoints', {
      'ApplicationId': applicationId,
      'UserId': userId,
    });
    return DeleteUserEndpointsResponse.fromJson(response_);
  }

  /// Disables the voice channel for an application and deletes any existing
  /// settings for the channel.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  Future<DeleteVoiceChannelResponse> deleteVoiceChannel(
      String applicationId) async {
    var response_ = await _client.send('DeleteVoiceChannel', {
      'ApplicationId': applicationId,
    });
    return DeleteVoiceChannelResponse.fromJson(response_);
  }

  /// Retrieves information about the status and settings of the ADM channel for
  /// an application.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  Future<GetAdmChannelResponse> getAdmChannel(String applicationId) async {
    var response_ = await _client.send('GetAdmChannel', {
      'ApplicationId': applicationId,
    });
    return GetAdmChannelResponse.fromJson(response_);
  }

  /// Retrieves information about the status and settings of the APNs channel
  /// for an application.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  Future<GetApnsChannelResponse> getApnsChannel(String applicationId) async {
    var response_ = await _client.send('GetApnsChannel', {
      'ApplicationId': applicationId,
    });
    return GetApnsChannelResponse.fromJson(response_);
  }

  /// Retrieves information about the status and settings of the APNs sandbox
  /// channel for an application.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  Future<GetApnsSandboxChannelResponse> getApnsSandboxChannel(
      String applicationId) async {
    var response_ = await _client.send('GetApnsSandboxChannel', {
      'ApplicationId': applicationId,
    });
    return GetApnsSandboxChannelResponse.fromJson(response_);
  }

  /// Retrieves information about the status and settings of the APNs VoIP
  /// channel for an application.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  Future<GetApnsVoipChannelResponse> getApnsVoipChannel(
      String applicationId) async {
    var response_ = await _client.send('GetApnsVoipChannel', {
      'ApplicationId': applicationId,
    });
    return GetApnsVoipChannelResponse.fromJson(response_);
  }

  /// Retrieves information about the status and settings of the APNs VoIP
  /// sandbox channel for an application.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  Future<GetApnsVoipSandboxChannelResponse> getApnsVoipSandboxChannel(
      String applicationId) async {
    var response_ = await _client.send('GetApnsVoipSandboxChannel', {
      'ApplicationId': applicationId,
    });
    return GetApnsVoipSandboxChannelResponse.fromJson(response_);
  }

  /// Retrieves information about an application.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  Future<GetAppResponse> getApp(String applicationId) async {
    var response_ = await _client.send('GetApp', {
      'ApplicationId': applicationId,
    });
    return GetAppResponse.fromJson(response_);
  }

  /// Retrieves (queries) pre-aggregated data for a standard metric that applies
  /// to an application.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  ///
  /// [endTime]: The last date to retrieve data for, as part of an inclusive
  /// date range that filters the query results. This value should be in ISO
  /// 8601 format, for example: 2019-07-19 for July 19, 2019. To define a date
  /// range that ends at a specific time, specify the date and time in ISO 8601
  /// format, for example: 2019-07-19T20:00Z for 8:00 PM July 19, 2019.
  ///
  /// [kpiName]: The name of the metric, also referred to as a _key performance
  /// indicator (KPI)_, to retrieve data for. This value describes the
  /// associated metric and consists of two or more terms, which are comprised
  /// of lowercase alphanumeric characters, separated by a hyphen. Examples are
  /// attempted-deliveries and successful-deliveries. For a list of valid
  /// values, see the [Amazon Pinpoint Developer Guide](developerguide.html).
  ///
  /// [nextToken]: The NextToken string that specifies which page of results to
  /// return in a paginated response. This parameter is currently not supported
  /// by the App Metrics and Campaign Metrics resources.
  ///
  /// [pageSize]: The maximum number of items to include in each page of a
  /// paginated response. This parameter is currently not supported by the App
  /// Metrics and Campaign Metrics resources.
  ///
  /// [startTime]: The first date to retrieve data for, as part of an inclusive
  /// date range that filters the query results. This value should be in ISO
  /// 8601 format, for example: 2019-07-15 for July 15, 2019. To define a date
  /// range that begins at a specific time, specify the date and time in ISO
  /// 8601 format, for example: 2019-07-15T16:00Z for 4:00 PM July 15, 2019.
  Future<GetApplicationDateRangeKpiResponse> getApplicationDateRangeKpi(
      {@required String applicationId,
      DateTime endTime,
      @required String kpiName,
      String nextToken,
      String pageSize,
      DateTime startTime}) async {
    var response_ = await _client.send('GetApplicationDateRangeKpi', {
      'ApplicationId': applicationId,
      if (endTime != null) 'EndTime': endTime,
      'KpiName': kpiName,
      if (nextToken != null) 'NextToken': nextToken,
      if (pageSize != null) 'PageSize': pageSize,
      if (startTime != null) 'StartTime': startTime,
    });
    return GetApplicationDateRangeKpiResponse.fromJson(response_);
  }

  /// Retrieves information about the settings for an application.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  Future<GetApplicationSettingsResponse> getApplicationSettings(
      String applicationId) async {
    var response_ = await _client.send('GetApplicationSettings', {
      'ApplicationId': applicationId,
    });
    return GetApplicationSettingsResponse.fromJson(response_);
  }

  /// Retrieves information about all of your applications.
  ///
  /// [pageSize]: The maximum number of items to include in each page of a
  /// paginated response. This parameter is currently not supported by the App
  /// Metrics and Campaign Metrics resources.
  ///
  /// [token]: The NextToken string that specifies which page of results to
  /// return in a paginated response.
  Future<GetAppsResponse> getApps({String pageSize, String token}) async {
    var response_ = await _client.send('GetApps', {
      if (pageSize != null) 'PageSize': pageSize,
      if (token != null) 'Token': token,
    });
    return GetAppsResponse.fromJson(response_);
  }

  /// Retrieves information about the status and settings of the Baidu Cloud
  /// Push channel for an application.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  Future<GetBaiduChannelResponse> getBaiduChannel(String applicationId) async {
    var response_ = await _client.send('GetBaiduChannel', {
      'ApplicationId': applicationId,
    });
    return GetBaiduChannelResponse.fromJson(response_);
  }

  /// Retrieves information about the status, configuration, and other settings
  /// for a campaign.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  ///
  /// [campaignId]: The unique identifier for the campaign.
  Future<GetCampaignResponse> getCampaign(
      {@required String applicationId, @required String campaignId}) async {
    var response_ = await _client.send('GetCampaign', {
      'ApplicationId': applicationId,
      'CampaignId': campaignId,
    });
    return GetCampaignResponse.fromJson(response_);
  }

  /// Retrieves information about the activity performed by a campaign.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  ///
  /// [campaignId]: The unique identifier for the campaign.
  ///
  /// [pageSize]: The maximum number of items to include in each page of a
  /// paginated response. This parameter is currently not supported by the App
  /// Metrics and Campaign Metrics resources.
  ///
  /// [token]: The NextToken string that specifies which page of results to
  /// return in a paginated response.
  Future<GetCampaignActivitiesResponse> getCampaignActivities(
      {@required String applicationId,
      @required String campaignId,
      String pageSize,
      String token}) async {
    var response_ = await _client.send('GetCampaignActivities', {
      'ApplicationId': applicationId,
      'CampaignId': campaignId,
      if (pageSize != null) 'PageSize': pageSize,
      if (token != null) 'Token': token,
    });
    return GetCampaignActivitiesResponse.fromJson(response_);
  }

  /// Retrieves (queries) pre-aggregated data for a standard metric that applies
  /// to a campaign.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  ///
  /// [campaignId]: The unique identifier for the campaign.
  ///
  /// [endTime]: The last date to retrieve data for, as part of an inclusive
  /// date range that filters the query results. This value should be in ISO
  /// 8601 format, for example: 2019-07-19 for July 19, 2019. To define a date
  /// range that ends at a specific time, specify the date and time in ISO 8601
  /// format, for example: 2019-07-19T20:00Z for 8:00 PM July 19, 2019.
  ///
  /// [kpiName]: The name of the metric, also referred to as a _key performance
  /// indicator (KPI)_, to retrieve data for. This value describes the
  /// associated metric and consists of two or more terms, which are comprised
  /// of lowercase alphanumeric characters, separated by a hyphen. Examples are
  /// attempted-deliveries and successful-deliveries. For a list of valid
  /// values, see the [Amazon Pinpoint Developer Guide](developerguide.html).
  ///
  /// [nextToken]: The NextToken string that specifies which page of results to
  /// return in a paginated response. This parameter is currently not supported
  /// by the App Metrics and Campaign Metrics resources.
  ///
  /// [pageSize]: The maximum number of items to include in each page of a
  /// paginated response. This parameter is currently not supported by the App
  /// Metrics and Campaign Metrics resources.
  ///
  /// [startTime]: The first date to retrieve data for, as part of an inclusive
  /// date range that filters the query results. This value should be in ISO
  /// 8601 format, for example: 2019-07-15 for July 15, 2019. To define a date
  /// range that begins at a specific time, specify the date and time in ISO
  /// 8601 format, for example: 2019-07-15T16:00Z for 4:00 PM July 15, 2019.
  Future<GetCampaignDateRangeKpiResponse> getCampaignDateRangeKpi(
      {@required String applicationId,
      @required String campaignId,
      DateTime endTime,
      @required String kpiName,
      String nextToken,
      String pageSize,
      DateTime startTime}) async {
    var response_ = await _client.send('GetCampaignDateRangeKpi', {
      'ApplicationId': applicationId,
      'CampaignId': campaignId,
      if (endTime != null) 'EndTime': endTime,
      'KpiName': kpiName,
      if (nextToken != null) 'NextToken': nextToken,
      if (pageSize != null) 'PageSize': pageSize,
      if (startTime != null) 'StartTime': startTime,
    });
    return GetCampaignDateRangeKpiResponse.fromJson(response_);
  }

  /// Retrieves information about the status, configuration, and other settings
  /// for a specific version of a campaign.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  ///
  /// [campaignId]: The unique identifier for the campaign.
  ///
  /// [version]: The unique version number (Version property) for the campaign
  /// version.
  Future<GetCampaignVersionResponse> getCampaignVersion(
      {@required String applicationId,
      @required String campaignId,
      @required String version}) async {
    var response_ = await _client.send('GetCampaignVersion', {
      'ApplicationId': applicationId,
      'CampaignId': campaignId,
      'Version': version,
    });
    return GetCampaignVersionResponse.fromJson(response_);
  }

  /// Retrieves information about the status, configuration, and other settings
  /// for all versions of a specific campaign.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  ///
  /// [campaignId]: The unique identifier for the campaign.
  ///
  /// [pageSize]: The maximum number of items to include in each page of a
  /// paginated response. This parameter is currently not supported by the App
  /// Metrics and Campaign Metrics resources.
  ///
  /// [token]: The NextToken string that specifies which page of results to
  /// return in a paginated response.
  Future<GetCampaignVersionsResponse> getCampaignVersions(
      {@required String applicationId,
      @required String campaignId,
      String pageSize,
      String token}) async {
    var response_ = await _client.send('GetCampaignVersions', {
      'ApplicationId': applicationId,
      'CampaignId': campaignId,
      if (pageSize != null) 'PageSize': pageSize,
      if (token != null) 'Token': token,
    });
    return GetCampaignVersionsResponse.fromJson(response_);
  }

  /// Retrieves information about the status, configuration, and other settings
  /// for all the campaigns that are associated with an application.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  ///
  /// [pageSize]: The maximum number of items to include in each page of a
  /// paginated response. This parameter is currently not supported by the App
  /// Metrics and Campaign Metrics resources.
  ///
  /// [token]: The NextToken string that specifies which page of results to
  /// return in a paginated response.
  Future<GetCampaignsResponse> getCampaigns(String applicationId,
      {String pageSize, String token}) async {
    var response_ = await _client.send('GetCampaigns', {
      'ApplicationId': applicationId,
      if (pageSize != null) 'PageSize': pageSize,
      if (token != null) 'Token': token,
    });
    return GetCampaignsResponse.fromJson(response_);
  }

  /// Retrieves information about the history and status of each channel for an
  /// application.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  Future<GetChannelsResponse> getChannels(String applicationId) async {
    var response_ = await _client.send('GetChannels', {
      'ApplicationId': applicationId,
    });
    return GetChannelsResponse.fromJson(response_);
  }

  /// Retrieves information about the status and settings of the email channel
  /// for an application.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  Future<GetEmailChannelResponse> getEmailChannel(String applicationId) async {
    var response_ = await _client.send('GetEmailChannel', {
      'ApplicationId': applicationId,
    });
    return GetEmailChannelResponse.fromJson(response_);
  }

  /// Retrieves information about the settings and attributes of a specific
  /// endpoint for an application.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  ///
  /// [endpointId]: The unique identifier for the endpoint.
  Future<GetEndpointResponse> getEndpoint(
      {@required String applicationId, @required String endpointId}) async {
    var response_ = await _client.send('GetEndpoint', {
      'ApplicationId': applicationId,
      'EndpointId': endpointId,
    });
    return GetEndpointResponse.fromJson(response_);
  }

  /// Retrieves information about the event stream settings for an application.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  Future<GetEventStreamResponse> getEventStream(String applicationId) async {
    var response_ = await _client.send('GetEventStream', {
      'ApplicationId': applicationId,
    });
    return GetEventStreamResponse.fromJson(response_);
  }

  /// Retrieves information about the status and settings of a specific export
  /// job for an application.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  ///
  /// [jobId]: The unique identifier for the job.
  Future<GetExportJobResponse> getExportJob(
      {@required String applicationId, @required String jobId}) async {
    var response_ = await _client.send('GetExportJob', {
      'ApplicationId': applicationId,
      'JobId': jobId,
    });
    return GetExportJobResponse.fromJson(response_);
  }

  /// Retrieves information about the status and settings of all the export jobs
  /// for an application.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  ///
  /// [pageSize]: The maximum number of items to include in each page of a
  /// paginated response. This parameter is currently not supported by the App
  /// Metrics and Campaign Metrics resources.
  ///
  /// [token]: The NextToken string that specifies which page of results to
  /// return in a paginated response.
  Future<GetExportJobsResponse> getExportJobs(String applicationId,
      {String pageSize, String token}) async {
    var response_ = await _client.send('GetExportJobs', {
      'ApplicationId': applicationId,
      if (pageSize != null) 'PageSize': pageSize,
      if (token != null) 'Token': token,
    });
    return GetExportJobsResponse.fromJson(response_);
  }

  /// Retrieves information about the status and settings of the GCM channel for
  /// an application.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  Future<GetGcmChannelResponse> getGcmChannel(String applicationId) async {
    var response_ = await _client.send('GetGcmChannel', {
      'ApplicationId': applicationId,
    });
    return GetGcmChannelResponse.fromJson(response_);
  }

  /// Retrieves information about the status and settings of a specific import
  /// job for an application.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  ///
  /// [jobId]: The unique identifier for the job.
  Future<GetImportJobResponse> getImportJob(
      {@required String applicationId, @required String jobId}) async {
    var response_ = await _client.send('GetImportJob', {
      'ApplicationId': applicationId,
      'JobId': jobId,
    });
    return GetImportJobResponse.fromJson(response_);
  }

  /// Retrieves information about the status and settings of all the import jobs
  /// for an application.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  ///
  /// [pageSize]: The maximum number of items to include in each page of a
  /// paginated response. This parameter is currently not supported by the App
  /// Metrics and Campaign Metrics resources.
  ///
  /// [token]: The NextToken string that specifies which page of results to
  /// return in a paginated response.
  Future<GetImportJobsResponse> getImportJobs(String applicationId,
      {String pageSize, String token}) async {
    var response_ = await _client.send('GetImportJobs', {
      'ApplicationId': applicationId,
      if (pageSize != null) 'PageSize': pageSize,
      if (token != null) 'Token': token,
    });
    return GetImportJobsResponse.fromJson(response_);
  }

  /// Retrieves information about the configuration, dimension, and other
  /// settings for a specific segment that's associated with an application.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  ///
  /// [segmentId]: The unique identifier for the segment.
  Future<GetSegmentResponse> getSegment(
      {@required String applicationId, @required String segmentId}) async {
    var response_ = await _client.send('GetSegment', {
      'ApplicationId': applicationId,
      'SegmentId': segmentId,
    });
    return GetSegmentResponse.fromJson(response_);
  }

  /// Retrieves information about the status and settings of the export jobs for
  /// a segment.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  ///
  /// [pageSize]: The maximum number of items to include in each page of a
  /// paginated response. This parameter is currently not supported by the App
  /// Metrics and Campaign Metrics resources.
  ///
  /// [segmentId]: The unique identifier for the segment.
  ///
  /// [token]: The NextToken string that specifies which page of results to
  /// return in a paginated response.
  Future<GetSegmentExportJobsResponse> getSegmentExportJobs(
      {@required String applicationId,
      String pageSize,
      @required String segmentId,
      String token}) async {
    var response_ = await _client.send('GetSegmentExportJobs', {
      'ApplicationId': applicationId,
      if (pageSize != null) 'PageSize': pageSize,
      'SegmentId': segmentId,
      if (token != null) 'Token': token,
    });
    return GetSegmentExportJobsResponse.fromJson(response_);
  }

  /// Retrieves information about the status and settings of the import jobs for
  /// a segment.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  ///
  /// [pageSize]: The maximum number of items to include in each page of a
  /// paginated response. This parameter is currently not supported by the App
  /// Metrics and Campaign Metrics resources.
  ///
  /// [segmentId]: The unique identifier for the segment.
  ///
  /// [token]: The NextToken string that specifies which page of results to
  /// return in a paginated response.
  Future<GetSegmentImportJobsResponse> getSegmentImportJobs(
      {@required String applicationId,
      String pageSize,
      @required String segmentId,
      String token}) async {
    var response_ = await _client.send('GetSegmentImportJobs', {
      'ApplicationId': applicationId,
      if (pageSize != null) 'PageSize': pageSize,
      'SegmentId': segmentId,
      if (token != null) 'Token': token,
    });
    return GetSegmentImportJobsResponse.fromJson(response_);
  }

  /// Retrieves information about the configuration, dimension, and other
  /// settings for a specific version of a segment that's associated with an
  /// application.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  ///
  /// [segmentId]: The unique identifier for the segment.
  ///
  /// [version]: The unique version number (Version property) for the campaign
  /// version.
  Future<GetSegmentVersionResponse> getSegmentVersion(
      {@required String applicationId,
      @required String segmentId,
      @required String version}) async {
    var response_ = await _client.send('GetSegmentVersion', {
      'ApplicationId': applicationId,
      'SegmentId': segmentId,
      'Version': version,
    });
    return GetSegmentVersionResponse.fromJson(response_);
  }

  /// Retrieves information about the configuration, dimension, and other
  /// settings for all versions of a specific segment that's associated with an
  /// application.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  ///
  /// [pageSize]: The maximum number of items to include in each page of a
  /// paginated response. This parameter is currently not supported by the App
  /// Metrics and Campaign Metrics resources.
  ///
  /// [segmentId]: The unique identifier for the segment.
  ///
  /// [token]: The NextToken string that specifies which page of results to
  /// return in a paginated response.
  Future<GetSegmentVersionsResponse> getSegmentVersions(
      {@required String applicationId,
      String pageSize,
      @required String segmentId,
      String token}) async {
    var response_ = await _client.send('GetSegmentVersions', {
      'ApplicationId': applicationId,
      if (pageSize != null) 'PageSize': pageSize,
      'SegmentId': segmentId,
      if (token != null) 'Token': token,
    });
    return GetSegmentVersionsResponse.fromJson(response_);
  }

  /// Retrieves information about the configuration, dimension, and other
  /// settings for all the segments that are associated with an application.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  ///
  /// [pageSize]: The maximum number of items to include in each page of a
  /// paginated response. This parameter is currently not supported by the App
  /// Metrics and Campaign Metrics resources.
  ///
  /// [token]: The NextToken string that specifies which page of results to
  /// return in a paginated response.
  Future<GetSegmentsResponse> getSegments(String applicationId,
      {String pageSize, String token}) async {
    var response_ = await _client.send('GetSegments', {
      'ApplicationId': applicationId,
      if (pageSize != null) 'PageSize': pageSize,
      if (token != null) 'Token': token,
    });
    return GetSegmentsResponse.fromJson(response_);
  }

  /// Retrieves information about the status and settings of the SMS channel for
  /// an application.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  Future<GetSmsChannelResponse> getSmsChannel(String applicationId) async {
    var response_ = await _client.send('GetSmsChannel', {
      'ApplicationId': applicationId,
    });
    return GetSmsChannelResponse.fromJson(response_);
  }

  /// Retrieves information about all the endpoints that are associated with a
  /// specific user ID.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  ///
  /// [userId]: The unique identifier for the user.
  Future<GetUserEndpointsResponse> getUserEndpoints(
      {@required String applicationId, @required String userId}) async {
    var response_ = await _client.send('GetUserEndpoints', {
      'ApplicationId': applicationId,
      'UserId': userId,
    });
    return GetUserEndpointsResponse.fromJson(response_);
  }

  /// Retrieves information about the status and settings of the voice channel
  /// for an application.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  Future<GetVoiceChannelResponse> getVoiceChannel(String applicationId) async {
    var response_ = await _client.send('GetVoiceChannel', {
      'ApplicationId': applicationId,
    });
    return GetVoiceChannelResponse.fromJson(response_);
  }

  /// Retrieves all the tags (keys and values) that are associated with an
  /// application, campaign, or segment.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the application,
  /// campaign, or segment.
  Future<ListTagsForResourceResponse> listTagsForResource(
      String resourceArn) async {
    var response_ = await _client.send('ListTagsForResource', {
      'ResourceArn': resourceArn,
    });
    return ListTagsForResourceResponse.fromJson(response_);
  }

  /// Retrieves information about a phone number.
  Future<PhoneNumberValidateResponse> phoneNumberValidate(
      NumberValidateRequest numberValidateRequest) async {
    var response_ = await _client.send('PhoneNumberValidate', {
      'NumberValidateRequest': numberValidateRequest,
    });
    return PhoneNumberValidateResponse.fromJson(response_);
  }

  /// Creates a new event stream for an application or updates the settings of
  /// an existing event stream for an application.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  Future<PutEventStreamResponse> putEventStream(
      {@required String applicationId,
      @required WriteEventStream writeEventStream}) async {
    var response_ = await _client.send('PutEventStream', {
      'ApplicationId': applicationId,
      'WriteEventStream': writeEventStream,
    });
    return PutEventStreamResponse.fromJson(response_);
  }

  /// Creates a new event to record for endpoints, or creates or updates
  /// endpoint data that existing events are associated with.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  Future<PutEventsResponse> putEvents(
      {@required String applicationId,
      @required EventsRequest eventsRequest}) async {
    var response_ = await _client.send('PutEvents', {
      'ApplicationId': applicationId,
      'EventsRequest': eventsRequest,
    });
    return PutEventsResponse.fromJson(response_);
  }

  /// Removes one or more attributes, of the same attribute type, from all the
  /// endpoints that are associated with an application.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  ///
  /// [attributeType]: The type of attribute or attributes to remove. Valid
  /// values are:
  ///
  /// *   endpoint-custom-attributes - Custom attributes that describe
  /// endpoints, such as the date when an associated user opted in or out of
  /// receiving communications from you through a specific type of channel.
  ///
  /// *   endpoint-custom-metrics - Custom metrics that your app reports to
  /// Amazon Pinpoint for endpoints, such as the number of app sessions or the
  /// number of items left in a cart.
  ///
  /// *   endpoint-user-attributes - Custom attributes that describe users, such
  /// as first name, last name, and age.
  Future<RemoveAttributesResponse> removeAttributes(
      {@required String applicationId,
      @required String attributeType,
      @required UpdateAttributesRequest updateAttributesRequest}) async {
    var response_ = await _client.send('RemoveAttributes', {
      'ApplicationId': applicationId,
      'AttributeType': attributeType,
      'UpdateAttributesRequest': updateAttributesRequest,
    });
    return RemoveAttributesResponse.fromJson(response_);
  }

  /// Creates and sends a direct message.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  Future<SendMessagesResponse> sendMessages(
      {@required String applicationId,
      @required MessageRequest messageRequest}) async {
    var response_ = await _client.send('SendMessages', {
      'ApplicationId': applicationId,
      'MessageRequest': messageRequest,
    });
    return SendMessagesResponse.fromJson(response_);
  }

  /// Creates and sends a message to a list of users.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  Future<SendUsersMessagesResponse> sendUsersMessages(
      {@required String applicationId,
      @required SendUsersMessageRequest sendUsersMessageRequest}) async {
    var response_ = await _client.send('SendUsersMessages', {
      'ApplicationId': applicationId,
      'SendUsersMessageRequest': sendUsersMessageRequest,
    });
    return SendUsersMessagesResponse.fromJson(response_);
  }

  /// Adds one or more tags (keys and values) to an application, campaign, or
  /// segment.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the application,
  /// campaign, or segment.
  Future<void> tagResource(
      {@required String resourceArn, @required TagsModel tagsModel}) async {
    await _client.send('TagResource', {
      'ResourceArn': resourceArn,
      'TagsModel': tagsModel,
    });
  }

  /// Removes one or more tags (keys and values) from an application, campaign,
  /// or segment.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the application,
  /// campaign, or segment.
  ///
  /// [tagKeys]: The key of the tag to remove from the application, campaign, or
  /// segment. To remove multiple tags, append the tagKeys parameter and
  /// argument for each additional tag to remove, separated by an ampersand (&).
  Future<void> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {
    await _client.send('UntagResource', {
      'ResourceArn': resourceArn,
      'TagKeys': tagKeys,
    });
  }

  /// Updates the ADM channel settings for an application.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  Future<UpdateAdmChannelResponse> updateAdmChannel(
      {@required AdmChannelRequest admChannelRequest,
      @required String applicationId}) async {
    var response_ = await _client.send('UpdateAdmChannel', {
      'ADMChannelRequest': admChannelRequest,
      'ApplicationId': applicationId,
    });
    return UpdateAdmChannelResponse.fromJson(response_);
  }

  /// Updates the APNs channel settings for an application.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  Future<UpdateApnsChannelResponse> updateApnsChannel(
      {@required ApnsChannelRequest apnsChannelRequest,
      @required String applicationId}) async {
    var response_ = await _client.send('UpdateApnsChannel', {
      'APNSChannelRequest': apnsChannelRequest,
      'ApplicationId': applicationId,
    });
    return UpdateApnsChannelResponse.fromJson(response_);
  }

  /// Updates the APNs sandbox channel settings for an application.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  Future<UpdateApnsSandboxChannelResponse> updateApnsSandboxChannel(
      {@required ApnsSandboxChannelRequest apnsSandboxChannelRequest,
      @required String applicationId}) async {
    var response_ = await _client.send('UpdateApnsSandboxChannel', {
      'APNSSandboxChannelRequest': apnsSandboxChannelRequest,
      'ApplicationId': applicationId,
    });
    return UpdateApnsSandboxChannelResponse.fromJson(response_);
  }

  /// Updates the APNs VoIP channel settings for an application.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  Future<UpdateApnsVoipChannelResponse> updateApnsVoipChannel(
      {@required ApnsVoipChannelRequest apnsVoipChannelRequest,
      @required String applicationId}) async {
    var response_ = await _client.send('UpdateApnsVoipChannel', {
      'APNSVoipChannelRequest': apnsVoipChannelRequest,
      'ApplicationId': applicationId,
    });
    return UpdateApnsVoipChannelResponse.fromJson(response_);
  }

  /// Updates the settings for the APNs VoIP sandbox channel for an application.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  Future<UpdateApnsVoipSandboxChannelResponse> updateApnsVoipSandboxChannel(
      {@required ApnsVoipSandboxChannelRequest apnsVoipSandboxChannelRequest,
      @required String applicationId}) async {
    var response_ = await _client.send('UpdateApnsVoipSandboxChannel', {
      'APNSVoipSandboxChannelRequest': apnsVoipSandboxChannelRequest,
      'ApplicationId': applicationId,
    });
    return UpdateApnsVoipSandboxChannelResponse.fromJson(response_);
  }

  /// Updates the settings for an application.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  Future<UpdateApplicationSettingsResponse> updateApplicationSettings(
      {@required
          String applicationId,
      @required
          WriteApplicationSettingsRequest
              writeApplicationSettingsRequest}) async {
    var response_ = await _client.send('UpdateApplicationSettings', {
      'ApplicationId': applicationId,
      'WriteApplicationSettingsRequest': writeApplicationSettingsRequest,
    });
    return UpdateApplicationSettingsResponse.fromJson(response_);
  }

  /// Updates the settings of the Baidu channel for an application.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  Future<UpdateBaiduChannelResponse> updateBaiduChannel(
      {@required String applicationId,
      @required BaiduChannelRequest baiduChannelRequest}) async {
    var response_ = await _client.send('UpdateBaiduChannel', {
      'ApplicationId': applicationId,
      'BaiduChannelRequest': baiduChannelRequest,
    });
    return UpdateBaiduChannelResponse.fromJson(response_);
  }

  /// Updates the settings for a campaign.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  ///
  /// [campaignId]: The unique identifier for the campaign.
  Future<UpdateCampaignResponse> updateCampaign(
      {@required String applicationId,
      @required String campaignId,
      @required WriteCampaignRequest writeCampaignRequest}) async {
    var response_ = await _client.send('UpdateCampaign', {
      'ApplicationId': applicationId,
      'CampaignId': campaignId,
      'WriteCampaignRequest': writeCampaignRequest,
    });
    return UpdateCampaignResponse.fromJson(response_);
  }

  /// Updates the status and settings of the email channel for an application.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  Future<UpdateEmailChannelResponse> updateEmailChannel(
      {@required String applicationId,
      @required EmailChannelRequest emailChannelRequest}) async {
    var response_ = await _client.send('UpdateEmailChannel', {
      'ApplicationId': applicationId,
      'EmailChannelRequest': emailChannelRequest,
    });
    return UpdateEmailChannelResponse.fromJson(response_);
  }

  /// Creates a new endpoint for an application or updates the settings and
  /// attributes of an existing endpoint for an application. You can also use
  /// this operation to define custom attributes (Attributes, Metrics, and
  /// UserAttributes properties) for an endpoint.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  ///
  /// [endpointId]: The unique identifier for the endpoint.
  Future<UpdateEndpointResponse> updateEndpoint(
      {@required String applicationId,
      @required String endpointId,
      @required EndpointRequest endpointRequest}) async {
    var response_ = await _client.send('UpdateEndpoint', {
      'ApplicationId': applicationId,
      'EndpointId': endpointId,
      'EndpointRequest': endpointRequest,
    });
    return UpdateEndpointResponse.fromJson(response_);
  }

  /// Creates a new batch of endpoints for an application or updates the
  /// settings and attributes of a batch of existing endpoints for an
  /// application. You can also use this operation to define custom attributes
  /// (Attributes, Metrics, and UserAttributes properties) for a batch of
  /// endpoints.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  Future<UpdateEndpointsBatchResponse> updateEndpointsBatch(
      {@required String applicationId,
      @required EndpointBatchRequest endpointBatchRequest}) async {
    var response_ = await _client.send('UpdateEndpointsBatch', {
      'ApplicationId': applicationId,
      'EndpointBatchRequest': endpointBatchRequest,
    });
    return UpdateEndpointsBatchResponse.fromJson(response_);
  }

  /// Updates the status and settings of the GCM channel for an application.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  Future<UpdateGcmChannelResponse> updateGcmChannel(
      {@required String applicationId,
      @required GcmChannelRequest gcmChannelRequest}) async {
    var response_ = await _client.send('UpdateGcmChannel', {
      'ApplicationId': applicationId,
      'GCMChannelRequest': gcmChannelRequest,
    });
    return UpdateGcmChannelResponse.fromJson(response_);
  }

  /// Creates a new segment for an application or updates the configuration,
  /// dimension, and other settings for an existing segment that's associated
  /// with an application.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  ///
  /// [segmentId]: The unique identifier for the segment.
  Future<UpdateSegmentResponse> updateSegment(
      {@required String applicationId,
      @required String segmentId,
      @required WriteSegmentRequest writeSegmentRequest}) async {
    var response_ = await _client.send('UpdateSegment', {
      'ApplicationId': applicationId,
      'SegmentId': segmentId,
      'WriteSegmentRequest': writeSegmentRequest,
    });
    return UpdateSegmentResponse.fromJson(response_);
  }

  /// Updates the status and settings of the SMS channel for an application.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  Future<UpdateSmsChannelResponse> updateSmsChannel(
      {@required String applicationId,
      @required SmsChannelRequest smsChannelRequest}) async {
    var response_ = await _client.send('UpdateSmsChannel', {
      'ApplicationId': applicationId,
      'SMSChannelRequest': smsChannelRequest,
    });
    return UpdateSmsChannelResponse.fromJson(response_);
  }

  /// Updates the status and settings of the voice channel for an application.
  ///
  /// [applicationId]: The unique identifier for the application. This
  /// identifier is displayed as the **Project ID** on the Amazon Pinpoint
  /// console.
  Future<UpdateVoiceChannelResponse> updateVoiceChannel(
      {@required String applicationId,
      @required VoiceChannelRequest voiceChannelRequest}) async {
    var response_ = await _client.send('UpdateVoiceChannel', {
      'ApplicationId': applicationId,
      'VoiceChannelRequest': voiceChannelRequest,
    });
    return UpdateVoiceChannelResponse.fromJson(response_);
  }
}

/// Specifies the status and settings of the ADM (Amazon Device Messaging)
/// channel for an application.
class AdmChannelRequest {
  /// The Client ID that you received from Amazon to send messages by using ADM.
  final String clientId;

  /// The Client Secret that you received from Amazon to send messages by using
  /// ADM.
  final String clientSecret;

  /// Specifies whether to enable the ADM channel for the application.
  final bool enabled;

  AdmChannelRequest({
    @required this.clientId,
    @required this.clientSecret,
    this.enabled,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides information about the status and settings of the ADM (Amazon Device
/// Messaging) channel for an application.
class AdmChannelResponse {
  /// The unique identifier for the application that the ADM channel applies to.
  final String applicationId;

  /// The date and time when the ADM channel was enabled.
  final String creationDate;

  /// Specifies whether the ADM channel is enabled for the application.
  final bool enabled;

  /// (Not used) This property is retained only for backward compatibility.
  final bool hasCredential;

  /// (Deprecated) An identifier for the ADM channel. This property is retained
  /// only for backward compatibility.
  final String id;

  /// Specifies whether the ADM channel is archived.
  final bool isArchived;

  /// The user who last modified the ADM channel.
  final String lastModifiedBy;

  /// The date and time when the ADM channel was last modified.
  final String lastModifiedDate;

  /// The type of messaging or notification platform for the channel. For the
  /// ADM channel, this value is ADM.
  final String platform;

  /// The current version of the ADM channel.
  final int version;

  AdmChannelResponse({
    this.applicationId,
    this.creationDate,
    this.enabled,
    this.hasCredential,
    this.id,
    this.isArchived,
    this.lastModifiedBy,
    this.lastModifiedDate,
    @required this.platform,
    this.version,
  });
  static AdmChannelResponse fromJson(Map<String, dynamic> json) =>
      AdmChannelResponse(
        applicationId: json.containsKey('ApplicationId')
            ? json['ApplicationId'] as String
            : null,
        creationDate: json.containsKey('CreationDate')
            ? json['CreationDate'] as String
            : null,
        enabled: json.containsKey('Enabled') ? json['Enabled'] as bool : null,
        hasCredential: json.containsKey('HasCredential')
            ? json['HasCredential'] as bool
            : null,
        id: json.containsKey('Id') ? json['Id'] as String : null,
        isArchived:
            json.containsKey('IsArchived') ? json['IsArchived'] as bool : null,
        lastModifiedBy: json.containsKey('LastModifiedBy')
            ? json['LastModifiedBy'] as String
            : null,
        lastModifiedDate: json.containsKey('LastModifiedDate')
            ? json['LastModifiedDate'] as String
            : null,
        platform: json['Platform'] as String,
        version: json.containsKey('Version') ? json['Version'] as int : null,
      );
}

/// Specifies the settings for a one-time message that's sent directly to an
/// endpoint through the ADM (Amazon Device Messaging) channel.
class AdmMessage {
  /// The action to occur if the recipient taps the push notification. Valid
  /// values are:
  ///
  /// *   OPEN_APP - Your app opens or it becomes the foreground app if it was
  /// sent to the background. This is the default action.
  ///
  /// *   DEEP_LINK - Your app opens and displays a designated user interface in
  /// the app. This action uses the deep-linking features of the Android
  /// platform.
  ///
  /// *   URL - The default mobile browser on the recipient's device opens and
  /// loads the web page at a URL that you specify.
  final String action;

  /// The body of the notification message.
  final String body;

  /// An arbitrary string that indicates that multiple messages are logically
  /// the same and that Amazon Device Messaging (ADM) can drop previously
  /// enqueued messages in favor of this message.
  final String consolidationKey;

  /// The JSON data payload to use for the push notification, if the
  /// notification is a silent push notification. This payload is added to the
  /// data.pinpoint.jsonBody object of the notification.
  final Map<String, String> data;

  /// The amount of time, in seconds, that ADM should store the message if the
  /// recipient's device is offline. Amazon Pinpoint specifies this value in the
  /// expiresAfter parameter when it sends the notification message to ADM.
  final String expiresAfter;

  /// The icon image name of the asset saved in your app.
  final String iconReference;

  /// The URL of the large icon image to display in the content view of the push
  /// notification.
  final String imageIconUrl;

  /// The URL of an image to display in the push notification.
  final String imageUrl;

  /// The base64-encoded, MD5 checksum of the value specified by the Data
  /// property. ADM uses the MD5 value to verify the integrity of the data.
  final String md5;

  /// The raw, JSON-formatted string to use as the payload for the notification
  /// message. This value overrides the message.
  final String rawContent;

  /// Specifies whether the notification is a silent push notification, which is
  /// a push notification that doesn't display on a recipient's device. Silent
  /// push notifications can be used for cases such as updating an app's
  /// configuration or supporting phone home functionality.
  final bool silentPush;

  /// The URL of the small icon image to display in the status bar and the
  /// content view of the push notification.
  final String smallImageIconUrl;

  /// The sound to play when the recipient receives the push notification. You
  /// can use the default stream or specify the file name of a sound resource
  /// that's bundled in your app. On an Android platform, the sound file must
  /// reside in /res/raw/.
  final String sound;

  /// The default message variables to use in the notification message. You can
  /// override the default variables with individual address variables.
  final Map<String, List<String>> substitutions;

  /// The title to display above the notification message on the recipient's
  /// device.
  final String title;

  /// The URL to open in the recipient's default mobile browser, if a recipient
  /// taps the push notification and the value of the Action property is URL.
  final String url;

  AdmMessage({
    this.action,
    this.body,
    this.consolidationKey,
    this.data,
    this.expiresAfter,
    this.iconReference,
    this.imageIconUrl,
    this.imageUrl,
    this.md5,
    this.rawContent,
    this.silentPush,
    this.smallImageIconUrl,
    this.sound,
    this.substitutions,
    this.title,
    this.url,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies the status and settings of the APNs (Apple Push Notification
/// service) channel for an application.
class ApnsChannelRequest {
  /// The bundle identifier that's assigned to your iOS app. This identifier is
  /// used for APNs tokens.
  final String bundleId;

  /// The APNs client certificate that you received from Apple, if you want
  /// Amazon Pinpoint to communicate with APNs by using an APNs certificate.
  final String certificate;

  /// The default authentication method that you want Amazon Pinpoint to use
  /// when authenticating with APNs, key or certificate.
  final String defaultAuthenticationMethod;

  /// Specifies whether to enable the APNs channel for the application.
  final bool enabled;

  /// The private key for the APNs client certificate that you want Amazon
  /// Pinpoint to use to communicate with APNs.
  final String privateKey;

  /// The identifier that's assigned to your Apple developer account team. This
  /// identifier is used for APNs tokens.
  final String teamId;

  /// The authentication key to use for APNs tokens.
  final String tokenKey;

  /// The key identifier that's assigned to your APNs signing key, if you want
  /// Amazon Pinpoint to communicate with APNs by using APNs tokens.
  final String tokenKeyId;

  ApnsChannelRequest({
    this.bundleId,
    this.certificate,
    this.defaultAuthenticationMethod,
    this.enabled,
    this.privateKey,
    this.teamId,
    this.tokenKey,
    this.tokenKeyId,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides information about the status and settings of the APNs (Apple Push
/// Notification service) channel for an application.
class ApnsChannelResponse {
  /// The unique identifier for the application that the APNs channel applies
  /// to.
  final String applicationId;

  /// The date and time when the APNs channel was enabled.
  final String creationDate;

  /// The default authentication method that Amazon Pinpoint uses to
  /// authenticate with APNs for this channel, key or certificate.
  final String defaultAuthenticationMethod;

  /// Specifies whether the APNs channel is enabled for the application.
  final bool enabled;

  /// (Not used) This property is retained only for backward compatibility.
  final bool hasCredential;

  /// Specifies whether the APNs channel is configured to communicate with APNs
  /// by using APNs tokens. To provide an authentication key for APNs tokens,
  /// set the TokenKey property of the channel.
  final bool hasTokenKey;

  /// (Deprecated) An identifier for the APNs channel. This property is retained
  /// only for backward compatibility.
  final String id;

  /// Specifies whether the APNs channel is archived.
  final bool isArchived;

  /// The user who last modified the APNs channel.
  final String lastModifiedBy;

  /// The date and time when the APNs channel was last modified.
  final String lastModifiedDate;

  /// The type of messaging or notification platform for the channel. For the
  /// APNs channel, this value is APNS.
  final String platform;

  /// The current version of the APNs channel.
  final int version;

  ApnsChannelResponse({
    this.applicationId,
    this.creationDate,
    this.defaultAuthenticationMethod,
    this.enabled,
    this.hasCredential,
    this.hasTokenKey,
    this.id,
    this.isArchived,
    this.lastModifiedBy,
    this.lastModifiedDate,
    @required this.platform,
    this.version,
  });
  static ApnsChannelResponse fromJson(Map<String, dynamic> json) =>
      ApnsChannelResponse(
        applicationId: json.containsKey('ApplicationId')
            ? json['ApplicationId'] as String
            : null,
        creationDate: json.containsKey('CreationDate')
            ? json['CreationDate'] as String
            : null,
        defaultAuthenticationMethod:
            json.containsKey('DefaultAuthenticationMethod')
                ? json['DefaultAuthenticationMethod'] as String
                : null,
        enabled: json.containsKey('Enabled') ? json['Enabled'] as bool : null,
        hasCredential: json.containsKey('HasCredential')
            ? json['HasCredential'] as bool
            : null,
        hasTokenKey: json.containsKey('HasTokenKey')
            ? json['HasTokenKey'] as bool
            : null,
        id: json.containsKey('Id') ? json['Id'] as String : null,
        isArchived:
            json.containsKey('IsArchived') ? json['IsArchived'] as bool : null,
        lastModifiedBy: json.containsKey('LastModifiedBy')
            ? json['LastModifiedBy'] as String
            : null,
        lastModifiedDate: json.containsKey('LastModifiedDate')
            ? json['LastModifiedDate'] as String
            : null,
        platform: json['Platform'] as String,
        version: json.containsKey('Version') ? json['Version'] as int : null,
      );
}

/// Specifies the settings for a one-time message that's sent directly to an
/// endpoint through the APNs (Apple Push Notification service) channel.
class ApnsMessage {
  /// The action to occur if the recipient taps the push notification. Valid
  /// values are:
  ///
  /// *   OPEN_APP - Your app opens or it becomes the foreground app if it was
  /// sent to the background. This is the default action.
  ///
  /// *   DEEP_LINK - Your app opens and displays a designated user interface in
  /// the app. This setting uses the deep-linking features of the iOS platform.
  ///
  /// *   URL - The default mobile browser on the recipient's device opens and
  /// loads the web page at a URL that you specify.
  final String action;

  /// The key that indicates whether and how to modify the badge of your app's
  /// icon when the recipient receives the push notification. If this key isn't
  /// included in the dictionary, the badge doesn't change. To remove the badge,
  /// set this value to 0.
  final int badge;

  /// The body of the notification message.
  final String body;

  /// The key that indicates the notification type for the push notification.
  /// This key is a value that's defined by the identifier property of one of
  /// your app's registered categories.
  final String category;

  /// An arbitrary identifier that, if assigned to multiple messages, APNs uses
  /// to coalesce the messages into a single push notification instead of
  /// delivering each message individually. This value can't exceed 64 bytes.
  ///
  /// Amazon Pinpoint specifies this value in the apns-collapse-id request
  /// header when it sends the notification message to APNs.
  final String collapseId;

  /// The JSON payload to use for a silent push notification. This payload is
  /// added to the data.pinpoint.jsonBody object of the notification.
  final Map<String, String> data;

  /// The URL of an image or video to display in the push notification.
  final String mediaUrl;

  /// The authentication method that you want Amazon Pinpoint to use when
  /// authenticating with Apple Push Notification service (APNs), CERTIFICATE or
  /// TOKEN.
  final String preferredAuthenticationMethod;

  /// para>5 - Low priority, the notification might be delayed, delivered as
  /// part of a group, or throttled.
  ///
  /// /listitem>*   10 - High priority, the notification is sent immediately.
  /// This is the default value. A high priority notification should trigger an
  /// alert, play a sound, or badge your app's icon on the recipient's device.
  ///
  /// /para>
  ///
  /// Amazon Pinpoint specifies this value in the apns-priority request header
  /// when it sends the notification message to APNs.
  ///
  /// The equivalent values for Firebase Cloud Messaging (FCM), formerly Google
  /// Cloud Messaging (GCM), are normal, for 5, and high, for 10. If you specify
  /// an FCM value for this property, Amazon Pinpoint accepts and converts the
  /// value to the corresponding APNs value.
  final String priority;

  /// The raw, JSON-formatted string to use as the payload for the notification
  /// message. This value overrides the message.
  final String rawContent;

  /// Specifies whether the notification is a silent push notification, which is
  /// a push notification that doesn't display on a recipient's device. Silent
  /// push notifications can be used for cases such as updating an app's
  /// configuration, displaying messages in an in-app message center, or
  /// supporting phone home functionality.
  final bool silentPush;

  /// The key for the sound to play when the recipient receives the push
  /// notification. The value of this key is the name of a sound file in your
  /// app's main bundle or the Library/Sounds folder in your app's data
  /// container. If the sound file can't be found or you specify default for the
  /// value, the system plays the default alert sound.
  final String sound;

  /// The default message variables to use in the notification message. You can
  /// override these default variables with individual address variables.
  final Map<String, List<String>> substitutions;

  /// The key that represents your app-specific identifier for grouping
  /// notifications. If you provide a Notification Content app extension, you
  /// can use this value to group your notifications together.
  final String threadId;

  /// The amount of time, in seconds, that APNs should store and attempt to
  /// deliver the push notification, if the service is unable to deliver the
  /// notification the first time. If this value is 0, APNs treats the
  /// notification as if it expires immediately and the service doesn't store or
  /// try to deliver the notification again.
  ///
  /// Amazon Pinpoint specifies this value in the apns-expiration request header
  /// when it sends the notification message to APNs.
  final int timeToLive;

  /// The title to display above the notification message on the recipient's
  /// device.
  final String title;

  /// The URL to open in the recipient's default mobile browser, if a recipient
  /// taps the push notification and the value of the Action property is URL.
  final String url;

  ApnsMessage({
    this.action,
    this.badge,
    this.body,
    this.category,
    this.collapseId,
    this.data,
    this.mediaUrl,
    this.preferredAuthenticationMethod,
    this.priority,
    this.rawContent,
    this.silentPush,
    this.sound,
    this.substitutions,
    this.threadId,
    this.timeToLive,
    this.title,
    this.url,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies the status and settings of the APNs (Apple Push Notification
/// service) sandbox channel for an application.
class ApnsSandboxChannelRequest {
  /// The bundle identifier that's assigned to your iOS app. This identifier is
  /// used for APNs tokens.
  final String bundleId;

  /// The APNs client certificate that you received from Apple, if you want
  /// Amazon Pinpoint to communicate with the APNs sandbox environment by using
  /// an APNs certificate.
  final String certificate;

  /// The default authentication method that you want Amazon Pinpoint to use
  /// when authenticating with the APNs sandbox environment, key or certificate.
  final String defaultAuthenticationMethod;

  /// Specifies whether to enable the APNs sandbox channel for the application.
  final bool enabled;

  /// The private key for the APNs client certificate that you want Amazon
  /// Pinpoint to use to communicate with the APNs sandbox environment.
  final String privateKey;

  /// The identifier that's assigned to your Apple developer account team. This
  /// identifier is used for APNs tokens.
  final String teamId;

  /// The authentication key to use for APNs tokens.
  final String tokenKey;

  /// The key identifier that's assigned to your APNs signing key, if you want
  /// Amazon Pinpoint to communicate with the APNs sandbox environment by using
  /// APNs tokens.
  final String tokenKeyId;

  ApnsSandboxChannelRequest({
    this.bundleId,
    this.certificate,
    this.defaultAuthenticationMethod,
    this.enabled,
    this.privateKey,
    this.teamId,
    this.tokenKey,
    this.tokenKeyId,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides information about the status and settings of the APNs (Apple Push
/// Notification service) sandbox channel for an application.
class ApnsSandboxChannelResponse {
  /// The unique identifier for the application that the APNs sandbox channel
  /// applies to.
  final String applicationId;

  /// The date and time when the APNs sandbox channel was enabled.
  final String creationDate;

  /// The default authentication method that Amazon Pinpoint uses to
  /// authenticate with the APNs sandbox environment for this channel, key or
  /// certificate.
  final String defaultAuthenticationMethod;

  /// Specifies whether the APNs sandbox channel is enabled for the application.
  final bool enabled;

  /// (Not used) This property is retained only for backward compatibility.
  final bool hasCredential;

  /// Specifies whether the APNs sandbox channel is configured to communicate
  /// with APNs by using APNs tokens. To provide an authentication key for APNs
  /// tokens, set the TokenKey property of the channel.
  final bool hasTokenKey;

  /// (Deprecated) An identifier for the APNs sandbox channel. This property is
  /// retained only for backward compatibility.
  final String id;

  /// Specifies whether the APNs sandbox channel is archived.
  final bool isArchived;

  /// The user who last modified the APNs sandbox channel.
  final String lastModifiedBy;

  /// The date and time when the APNs sandbox channel was last modified.
  final String lastModifiedDate;

  /// The type of messaging or notification platform for the channel. For the
  /// APNs sandbox channel, this value is APNS_SANDBOX.
  final String platform;

  /// The current version of the APNs sandbox channel.
  final int version;

  ApnsSandboxChannelResponse({
    this.applicationId,
    this.creationDate,
    this.defaultAuthenticationMethod,
    this.enabled,
    this.hasCredential,
    this.hasTokenKey,
    this.id,
    this.isArchived,
    this.lastModifiedBy,
    this.lastModifiedDate,
    @required this.platform,
    this.version,
  });
  static ApnsSandboxChannelResponse fromJson(Map<String, dynamic> json) =>
      ApnsSandboxChannelResponse(
        applicationId: json.containsKey('ApplicationId')
            ? json['ApplicationId'] as String
            : null,
        creationDate: json.containsKey('CreationDate')
            ? json['CreationDate'] as String
            : null,
        defaultAuthenticationMethod:
            json.containsKey('DefaultAuthenticationMethod')
                ? json['DefaultAuthenticationMethod'] as String
                : null,
        enabled: json.containsKey('Enabled') ? json['Enabled'] as bool : null,
        hasCredential: json.containsKey('HasCredential')
            ? json['HasCredential'] as bool
            : null,
        hasTokenKey: json.containsKey('HasTokenKey')
            ? json['HasTokenKey'] as bool
            : null,
        id: json.containsKey('Id') ? json['Id'] as String : null,
        isArchived:
            json.containsKey('IsArchived') ? json['IsArchived'] as bool : null,
        lastModifiedBy: json.containsKey('LastModifiedBy')
            ? json['LastModifiedBy'] as String
            : null,
        lastModifiedDate: json.containsKey('LastModifiedDate')
            ? json['LastModifiedDate'] as String
            : null,
        platform: json['Platform'] as String,
        version: json.containsKey('Version') ? json['Version'] as int : null,
      );
}

/// Specifies the status and settings of the APNs (Apple Push Notification
/// service) VoIP channel for an application.
class ApnsVoipChannelRequest {
  /// The bundle identifier that's assigned to your iOS app. This identifier is
  /// used for APNs tokens.
  final String bundleId;

  /// The APNs client certificate that you received from Apple, if you want
  /// Amazon Pinpoint to communicate with APNs by using an APNs certificate.
  final String certificate;

  /// The default authentication method that you want Amazon Pinpoint to use
  /// when authenticating with APNs, key or certificate.
  final String defaultAuthenticationMethod;

  /// Specifies whether to enable the APNs VoIP channel for the application.
  final bool enabled;

  /// The private key for the APNs client certificate that you want Amazon
  /// Pinpoint to use to communicate with APNs.
  final String privateKey;

  /// The identifier that's assigned to your Apple developer account team. This
  /// identifier is used for APNs tokens.
  final String teamId;

  /// The authentication key to use for APNs tokens.
  final String tokenKey;

  /// The key identifier that's assigned to your APNs signing key, if you want
  /// Amazon Pinpoint to communicate with APNs by using APNs tokens.
  final String tokenKeyId;

  ApnsVoipChannelRequest({
    this.bundleId,
    this.certificate,
    this.defaultAuthenticationMethod,
    this.enabled,
    this.privateKey,
    this.teamId,
    this.tokenKey,
    this.tokenKeyId,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides information about the status and settings of the APNs (Apple Push
/// Notification service) VoIP channel for an application.
class ApnsVoipChannelResponse {
  /// The unique identifier for the application that the APNs VoIP channel
  /// applies to.
  final String applicationId;

  /// The date and time when the APNs VoIP channel was enabled.
  final String creationDate;

  /// The default authentication method that Amazon Pinpoint uses to
  /// authenticate with APNs for this channel, key or certificate.
  final String defaultAuthenticationMethod;

  /// Specifies whether the APNs VoIP channel is enabled for the application.
  final bool enabled;

  /// (Not used) This property is retained only for backward compatibility.
  final bool hasCredential;

  /// Specifies whether the APNs VoIP channel is configured to communicate with
  /// APNs by using APNs tokens. To provide an authentication key for APNs
  /// tokens, set the TokenKey property of the channel.
  final bool hasTokenKey;

  /// (Deprecated) An identifier for the APNs VoIP channel. This property is
  /// retained only for backward compatibility.
  final String id;

  /// Specifies whether the APNs VoIP channel is archived.
  final bool isArchived;

  /// The user who last modified the APNs VoIP channel.
  final String lastModifiedBy;

  /// The date and time when the APNs VoIP channel was last modified.
  final String lastModifiedDate;

  /// The type of messaging or notification platform for the channel. For the
  /// APNs VoIP channel, this value is APNS_VOIP.
  final String platform;

  /// The current version of the APNs VoIP channel.
  final int version;

  ApnsVoipChannelResponse({
    this.applicationId,
    this.creationDate,
    this.defaultAuthenticationMethod,
    this.enabled,
    this.hasCredential,
    this.hasTokenKey,
    this.id,
    this.isArchived,
    this.lastModifiedBy,
    this.lastModifiedDate,
    @required this.platform,
    this.version,
  });
  static ApnsVoipChannelResponse fromJson(Map<String, dynamic> json) =>
      ApnsVoipChannelResponse(
        applicationId: json.containsKey('ApplicationId')
            ? json['ApplicationId'] as String
            : null,
        creationDate: json.containsKey('CreationDate')
            ? json['CreationDate'] as String
            : null,
        defaultAuthenticationMethod:
            json.containsKey('DefaultAuthenticationMethod')
                ? json['DefaultAuthenticationMethod'] as String
                : null,
        enabled: json.containsKey('Enabled') ? json['Enabled'] as bool : null,
        hasCredential: json.containsKey('HasCredential')
            ? json['HasCredential'] as bool
            : null,
        hasTokenKey: json.containsKey('HasTokenKey')
            ? json['HasTokenKey'] as bool
            : null,
        id: json.containsKey('Id') ? json['Id'] as String : null,
        isArchived:
            json.containsKey('IsArchived') ? json['IsArchived'] as bool : null,
        lastModifiedBy: json.containsKey('LastModifiedBy')
            ? json['LastModifiedBy'] as String
            : null,
        lastModifiedDate: json.containsKey('LastModifiedDate')
            ? json['LastModifiedDate'] as String
            : null,
        platform: json['Platform'] as String,
        version: json.containsKey('Version') ? json['Version'] as int : null,
      );
}

/// Specifies the status and settings of the APNs (Apple Push Notification
/// service) VoIP sandbox channel for an application.
class ApnsVoipSandboxChannelRequest {
  /// The bundle identifier that's assigned to your iOS app. This identifier is
  /// used for APNs tokens.
  final String bundleId;

  /// The APNs client certificate that you received from Apple, if you want
  /// Amazon Pinpoint to communicate with the APNs sandbox environment by using
  /// an APNs certificate.
  final String certificate;

  /// The default authentication method that you want Amazon Pinpoint to use
  /// when authenticating with the APNs sandbox environment for this channel,
  /// key or certificate.
  final String defaultAuthenticationMethod;

  /// Specifies whether the APNs VoIP sandbox channel is enabled for the
  /// application.
  final bool enabled;

  /// The private key for the APNs client certificate that you want Amazon
  /// Pinpoint to use to communicate with the APNs sandbox environment.
  final String privateKey;

  /// The identifier that's assigned to your Apple developer account team. This
  /// identifier is used for APNs tokens.
  final String teamId;

  /// The authentication key to use for APNs tokens.
  final String tokenKey;

  /// The key identifier that's assigned to your APNs signing key, if you want
  /// Amazon Pinpoint to communicate with the APNs sandbox environment by using
  /// APNs tokens.
  final String tokenKeyId;

  ApnsVoipSandboxChannelRequest({
    this.bundleId,
    this.certificate,
    this.defaultAuthenticationMethod,
    this.enabled,
    this.privateKey,
    this.teamId,
    this.tokenKey,
    this.tokenKeyId,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides information about the status and settings of the APNs (Apple Push
/// Notification service) VoIP sandbox channel for an application.
class ApnsVoipSandboxChannelResponse {
  /// The unique identifier for the application that the APNs VoIP sandbox
  /// channel applies to.
  final String applicationId;

  /// The date and time when the APNs VoIP sandbox channel was enabled.
  final String creationDate;

  /// The default authentication method that Amazon Pinpoint uses to
  /// authenticate with the APNs sandbox environment for this channel, key or
  /// certificate.
  final String defaultAuthenticationMethod;

  /// Specifies whether the APNs VoIP sandbox channel is enabled for the
  /// application.
  final bool enabled;

  /// (Not used) This property is retained only for backward compatibility.
  final bool hasCredential;

  /// Specifies whether the APNs VoIP sandbox channel is configured to
  /// communicate with APNs by using APNs tokens. To provide an authentication
  /// key for APNs tokens, set the TokenKey property of the channel.
  final bool hasTokenKey;

  /// (Deprecated) An identifier for the APNs VoIP sandbox channel. This
  /// property is retained only for backward compatibility.
  final String id;

  /// Specifies whether the APNs VoIP sandbox channel is archived.
  final bool isArchived;

  /// The user who last modified the APNs VoIP sandbox channel.
  final String lastModifiedBy;

  /// The date and time when the APNs VoIP sandbox channel was last modified.
  final String lastModifiedDate;

  /// The type of messaging or notification platform for the channel. For the
  /// APNs VoIP sandbox channel, this value is APNS_VOIP_SANDBOX.
  final String platform;

  /// The current version of the APNs VoIP sandbox channel.
  final int version;

  ApnsVoipSandboxChannelResponse({
    this.applicationId,
    this.creationDate,
    this.defaultAuthenticationMethod,
    this.enabled,
    this.hasCredential,
    this.hasTokenKey,
    this.id,
    this.isArchived,
    this.lastModifiedBy,
    this.lastModifiedDate,
    @required this.platform,
    this.version,
  });
  static ApnsVoipSandboxChannelResponse fromJson(Map<String, dynamic> json) =>
      ApnsVoipSandboxChannelResponse(
        applicationId: json.containsKey('ApplicationId')
            ? json['ApplicationId'] as String
            : null,
        creationDate: json.containsKey('CreationDate')
            ? json['CreationDate'] as String
            : null,
        defaultAuthenticationMethod:
            json.containsKey('DefaultAuthenticationMethod')
                ? json['DefaultAuthenticationMethod'] as String
                : null,
        enabled: json.containsKey('Enabled') ? json['Enabled'] as bool : null,
        hasCredential: json.containsKey('HasCredential')
            ? json['HasCredential'] as bool
            : null,
        hasTokenKey: json.containsKey('HasTokenKey')
            ? json['HasTokenKey'] as bool
            : null,
        id: json.containsKey('Id') ? json['Id'] as String : null,
        isArchived:
            json.containsKey('IsArchived') ? json['IsArchived'] as bool : null,
        lastModifiedBy: json.containsKey('LastModifiedBy')
            ? json['LastModifiedBy'] as String
            : null,
        lastModifiedDate: json.containsKey('LastModifiedDate')
            ? json['LastModifiedDate'] as String
            : null,
        platform: json['Platform'] as String,
        version: json.containsKey('Version') ? json['Version'] as int : null,
      );
}

/// Provides information about the activities that were performed by a campaign.
class ActivitiesResponse {
  /// An array of responses, one for each activity that was performed by the
  /// campaign.
  final List<ActivityResponse> item;

  /// The string to use in a subsequent request to get the next page of results
  /// in a paginated response. This value is null if there are no additional
  /// pages.
  final String nextToken;

  ActivitiesResponse({
    @required this.item,
    this.nextToken,
  });
  static ActivitiesResponse fromJson(Map<String, dynamic> json) =>
      ActivitiesResponse(
        item: (json['Item'] as List)
            .map((e) => ActivityResponse.fromJson(e))
            .toList(),
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// Provides information about an activity that was performed by a campaign.
class ActivityResponse {
  /// The unique identifier for the application that the campaign applies to.
  final String applicationId;

  /// The unique identifier for the campaign that the activity applies to.
  final String campaignId;

  /// The actual time, in ISO 8601 format, when the activity was marked
  /// CANCELLED or COMPLETED.
  final String end;

  /// The unique identifier for the activity.
  final String id;

  /// Specifies whether the activity succeeded. Possible values are SUCCESS and
  /// FAIL.
  final String result;

  /// The scheduled start time, in ISO 8601 format, for the activity.
  final String scheduledStart;

  /// The actual start time, in ISO 8601 format, of the activity.
  final String start;

  /// The state of the activity. Possible values are: PENDING, INITIALIZING,
  /// RUNNING, PAUSED, CANCELLED, and COMPLETED.
  final String state;

  /// The total number of endpoints that the campaign successfully delivered
  /// messages to.
  final int successfulEndpointCount;

  /// The total number of time zones that were completed.
  final int timezonesCompletedCount;

  /// The total number of unique time zones that are in the segment for the
  /// campaign.
  final int timezonesTotalCount;

  /// The total number of endpoints that the campaign attempted to deliver
  /// messages to.
  final int totalEndpointCount;

  /// The unique identifier for the campaign treatment that the activity applies
  /// to. A treatment is a variation of a campaign that's used for A/B testing
  /// of a campaign.
  final String treatmentId;

  ActivityResponse({
    @required this.applicationId,
    @required this.campaignId,
    this.end,
    @required this.id,
    this.result,
    this.scheduledStart,
    this.start,
    this.state,
    this.successfulEndpointCount,
    this.timezonesCompletedCount,
    this.timezonesTotalCount,
    this.totalEndpointCount,
    this.treatmentId,
  });
  static ActivityResponse fromJson(Map<String, dynamic> json) =>
      ActivityResponse(
        applicationId: json['ApplicationId'] as String,
        campaignId: json['CampaignId'] as String,
        end: json.containsKey('End') ? json['End'] as String : null,
        id: json['Id'] as String,
        result: json.containsKey('Result') ? json['Result'] as String : null,
        scheduledStart: json.containsKey('ScheduledStart')
            ? json['ScheduledStart'] as String
            : null,
        start: json.containsKey('Start') ? json['Start'] as String : null,
        state: json.containsKey('State') ? json['State'] as String : null,
        successfulEndpointCount: json.containsKey('SuccessfulEndpointCount')
            ? json['SuccessfulEndpointCount'] as int
            : null,
        timezonesCompletedCount: json.containsKey('TimezonesCompletedCount')
            ? json['TimezonesCompletedCount'] as int
            : null,
        timezonesTotalCount: json.containsKey('TimezonesTotalCount')
            ? json['TimezonesTotalCount'] as int
            : null,
        totalEndpointCount: json.containsKey('TotalEndpointCount')
            ? json['TotalEndpointCount'] as int
            : null,
        treatmentId: json.containsKey('TreatmentId')
            ? json['TreatmentId'] as String
            : null,
      );
}

/// Specifies address-based configuration settings for a message that's sent
/// directly to an endpoint.
class AddressConfiguration {
  /// The message body to use instead of the default message body. This value
  /// overrides the default message body.
  final String bodyOverride;

  /// The channel to use when sending the message.
  final String channelType;

  /// An object that maps custom attributes to attributes for the address and is
  /// attached to the message. For a push notification, this payload is added to
  /// the data.pinpoint object. For an email or text message, this payload is
  /// added to email/SMS delivery receipt event attributes.
  final Map<String, String> context;

  /// The raw, JSON-formatted string to use as the payload for the notification
  /// message. This value overrides the message.
  final String rawContent;

  /// An object that maps variable values for the message. Amazon Pinpoint
  /// merges these values with the variable values specified by properties of
  /// the DefaultMessage object. The substitutions in this map take precedence
  /// over all other substitutions.
  final Map<String, List<String>> substitutions;

  /// The message title to use instead of the default message title. This value
  /// overrides the default message title.
  final String titleOverride;

  AddressConfiguration({
    this.bodyOverride,
    this.channelType,
    this.context,
    this.rawContent,
    this.substitutions,
    this.titleOverride,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides the results of a query that retrieved the data for a standard
/// metric that applies to an application, and provides information about that
/// query.
class ApplicationDateRangeKpiResponse {
  /// The unique identifier for the application that the metric applies to.
  final String applicationId;

  /// The last date or date and time of the date range that was used to filter
  /// the query results, in ISO 8601 format. The date range is inclusive.
  final DateTime endTime;

  /// The name of the metric, also referred to as a _key performance indicator
  /// (KPI)_, that the data was retrieved for. This value describes the
  /// associated metric and consists of two or more terms, which are comprised
  /// of lowercase alphanumeric characters, separated by a hyphen. For a list of
  /// valid values, see the
  /// [Amazon Pinpoint Developer Guide](developerguide.html).
  final String kpiName;

  /// An array of objects that contains the results of the query. Each object
  /// contains the value for the metric and metadata about that value.
  final BaseKpiResult kpiResult;

  /// The string to use in a subsequent request to get the next page of results
  /// in a paginated response. This value is null for the App Metrics resource.
  /// The App Metrics resource returns all results in a single page.
  final String nextToken;

  /// The first date or date and time of the date range that was used to filter
  /// the query results, in ISO 8601 format. The date range is inclusive.
  final DateTime startTime;

  ApplicationDateRangeKpiResponse({
    @required this.applicationId,
    @required this.endTime,
    @required this.kpiName,
    @required this.kpiResult,
    this.nextToken,
    @required this.startTime,
  });
  static ApplicationDateRangeKpiResponse fromJson(Map<String, dynamic> json) =>
      ApplicationDateRangeKpiResponse(
        applicationId: json['ApplicationId'] as String,
        endTime: DateTime.parse(json['EndTime']),
        kpiName: json['KpiName'] as String,
        kpiResult: BaseKpiResult.fromJson(json['KpiResult']),
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
        startTime: DateTime.parse(json['StartTime']),
      );
}

/// Provides information about an application.
class ApplicationResponse {
  /// The Amazon Resource Name (ARN) of the application.
  final String arn;

  /// The unique identifier for the application. This identifier is displayed as
  /// the **Project ID** on the Amazon Pinpoint console.
  final String id;

  /// The display name of the application. This name is displayed as the
  /// **Project name** on the Amazon Pinpoint console.
  final String name;

  /// A string-to-string map of key-value pairs that identifies the tags that
  /// are associated with the application. Each tag consists of a required tag
  /// key and an associated tag value.
  final Map<String, String> tags;

  ApplicationResponse({
    @required this.arn,
    @required this.id,
    @required this.name,
    this.tags,
  });
  static ApplicationResponse fromJson(Map<String, dynamic> json) =>
      ApplicationResponse(
        arn: json['Arn'] as String,
        id: json['Id'] as String,
        name: json['Name'] as String,
        tags: json.containsKey('tags')
            ? (json['tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

/// Provides information about an application, including the default settings
/// for an application.
class ApplicationSettingsResource {
  /// The unique identifier for the application. This identifier is displayed as
  /// the **Project ID** on the Amazon Pinpoint console.
  final String applicationId;

  /// The settings for the AWS Lambda function to use by default as a code hook
  /// for campaigns in the application.
  final CampaignHook campaignHook;

  /// The date and time, in ISO 8601 format, when the application's settings
  /// were last modified.
  final String lastModifiedDate;

  /// The default sending limits for campaigns in the application.
  final CampaignLimits limits;

  /// The default quiet time for campaigns in the application. Quiet time is a
  /// specific time range when campaigns don't send messages to endpoints, if
  /// all the following conditions are met:
  ///
  /// *   The EndpointDemographic.Timezone property of the endpoint is set to a
  /// valid value.
  ///
  /// *   The current time in the endpoint's time zone is later than or equal to
  /// the time specified by the QuietTime.Start property for the application (or
  /// a campaign that has custom quiet time settings).
  ///
  /// *   The current time in the endpoint's time zone is earlier than or equal
  /// to the time specified by the QuietTime.End property for the application
  /// (or a campaign that has custom quiet time settings).
  ///
  ///
  /// If any of the preceding conditions isn't met, the endpoint will receive
  /// messages from a campaign, even if quiet time is enabled.
  final QuietTime quietTime;

  ApplicationSettingsResource({
    @required this.applicationId,
    this.campaignHook,
    this.lastModifiedDate,
    this.limits,
    this.quietTime,
  });
  static ApplicationSettingsResource fromJson(Map<String, dynamic> json) =>
      ApplicationSettingsResource(
        applicationId: json['ApplicationId'] as String,
        campaignHook: json.containsKey('CampaignHook')
            ? CampaignHook.fromJson(json['CampaignHook'])
            : null,
        lastModifiedDate: json.containsKey('LastModifiedDate')
            ? json['LastModifiedDate'] as String
            : null,
        limits: json.containsKey('Limits')
            ? CampaignLimits.fromJson(json['Limits'])
            : null,
        quietTime: json.containsKey('QuietTime')
            ? QuietTime.fromJson(json['QuietTime'])
            : null,
      );
}

/// Provides information about all of your applications.
class ApplicationsResponse {
  /// An array of responses, one for each application that was returned.
  final List<ApplicationResponse> item;

  /// The string to use in a subsequent request to get the next page of results
  /// in a paginated response. This value is null if there are no additional
  /// pages.
  final String nextToken;

  ApplicationsResponse({
    this.item,
    this.nextToken,
  });
  static ApplicationsResponse fromJson(Map<String, dynamic> json) =>
      ApplicationsResponse(
        item: json.containsKey('Item')
            ? (json['Item'] as List)
                .map((e) => ApplicationResponse.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// Specifies attribute-based criteria for including or excluding endpoints from
/// a segment.
class AttributeDimension {
  /// The type of segment dimension to use. Valid values are: INCLUSIVE,
  /// endpoints that match the criteria are included in the segment; and,
  /// EXCLUSIVE, endpoints that match the criteria are excluded from the
  /// segment.
  final String attributeType;

  /// The criteria values to use for the segment dimension. Depending on the
  /// value of the AttributeType property, endpoints are included or excluded
  /// from the segment if their attribute values match the criteria values.
  final List<String> values;

  AttributeDimension({
    this.attributeType,
    @required this.values,
  });
  static AttributeDimension fromJson(Map<String, dynamic> json) =>
      AttributeDimension(
        attributeType: json.containsKey('AttributeType')
            ? json['AttributeType'] as String
            : null,
        values: (json['Values'] as List).map((e) => e as String).toList(),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides information about the type and the names of attributes that were
/// removed from all the endpoints that are associated with an application.
class AttributesResource {
  /// The unique identifier for the application.
  final String applicationId;

  /// The type of attribute or attributes that were removed from the endpoints.
  /// Valid values are:
  ///
  /// *   endpoint-custom-attributes - Custom attributes that describe endpoints
  ///
  /// *   endpoint-custom-metrics - Custom metrics that your app reports to
  /// Amazon Pinpoint for endpoints
  ///
  /// *   endpoint-user-attributes - Custom attributes that describe users
  final String attributeType;

  /// An array that specifies the names of the attributes that were removed from
  /// the endpoints.
  final List<String> attributes;

  AttributesResource({
    @required this.applicationId,
    @required this.attributeType,
    this.attributes,
  });
  static AttributesResource fromJson(Map<String, dynamic> json) =>
      AttributesResource(
        applicationId: json['ApplicationId'] as String,
        attributeType: json['AttributeType'] as String,
        attributes: json.containsKey('Attributes')
            ? (json['Attributes'] as List).map((e) => e as String).toList()
            : null,
      );
}

/// Specifies the status and settings of the Baidu (Baidu Cloud Push) channel
/// for an application.
class BaiduChannelRequest {
  /// The API key that you received from the Baidu Cloud Push service to
  /// communicate with the service.
  final String apiKey;

  /// Specifies whether to enable the Baidu channel for the application.
  final bool enabled;

  /// The secret key that you received from the Baidu Cloud Push service to
  /// communicate with the service.
  final String secretKey;

  BaiduChannelRequest({
    @required this.apiKey,
    this.enabled,
    @required this.secretKey,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides information about the status and settings of the Baidu (Baidu Cloud
/// Push) channel for an application.
class BaiduChannelResponse {
  /// The unique identifier for the application that the Baidu channel applies
  /// to.
  final String applicationId;

  /// The date and time when the Baidu channel was enabled.
  final String creationDate;

  /// The API key that you received from the Baidu Cloud Push service to
  /// communicate with the service.
  final String credential;

  /// Specifies whether the Baidu channel is enabled for the application.
  final bool enabled;

  /// (Not used) This property is retained only for backward compatibility.
  final bool hasCredential;

  /// (Deprecated) An identifier for the Baidu channel. This property is
  /// retained only for backward compatibility.
  final String id;

  /// Specifies whether the Baidu channel is archived.
  final bool isArchived;

  /// The user who last modified the Baidu channel.
  final String lastModifiedBy;

  /// The date and time when the Baidu channel was last modified.
  final String lastModifiedDate;

  /// The type of messaging or notification platform for the channel. For the
  /// Baidu channel, this value is BAIDU.
  final String platform;

  /// The current version of the Baidu channel.
  final int version;

  BaiduChannelResponse({
    this.applicationId,
    this.creationDate,
    @required this.credential,
    this.enabled,
    this.hasCredential,
    this.id,
    this.isArchived,
    this.lastModifiedBy,
    this.lastModifiedDate,
    @required this.platform,
    this.version,
  });
  static BaiduChannelResponse fromJson(Map<String, dynamic> json) =>
      BaiduChannelResponse(
        applicationId: json.containsKey('ApplicationId')
            ? json['ApplicationId'] as String
            : null,
        creationDate: json.containsKey('CreationDate')
            ? json['CreationDate'] as String
            : null,
        credential: json['Credential'] as String,
        enabled: json.containsKey('Enabled') ? json['Enabled'] as bool : null,
        hasCredential: json.containsKey('HasCredential')
            ? json['HasCredential'] as bool
            : null,
        id: json.containsKey('Id') ? json['Id'] as String : null,
        isArchived:
            json.containsKey('IsArchived') ? json['IsArchived'] as bool : null,
        lastModifiedBy: json.containsKey('LastModifiedBy')
            ? json['LastModifiedBy'] as String
            : null,
        lastModifiedDate: json.containsKey('LastModifiedDate')
            ? json['LastModifiedDate'] as String
            : null,
        platform: json['Platform'] as String,
        version: json.containsKey('Version') ? json['Version'] as int : null,
      );
}

/// Specifies the settings for a one-time message that's sent directly to an
/// endpoint through the Baidu (Baidu Cloud Push) channel.
class BaiduMessage {
  /// The action to occur if the recipient taps the push notification. Valid
  /// values are:
  ///
  /// *   OPEN_APP - Your app opens or it becomes the foreground app if it was
  /// sent to the background. This is the default action.
  ///
  /// *   DEEP_LINK - Your app opens and displays a designated user interface in
  /// the app. This action uses the deep-linking features of the Android
  /// platform.
  ///
  /// *   URL - The default mobile browser on the recipient's device opens and
  /// loads the web page at a URL that you specify.
  final String action;

  /// The body of the notification message.
  final String body;

  /// The JSON data payload to use for the push notification, if the
  /// notification is a silent push notification. This payload is added to the
  /// data.pinpoint.jsonBody object of the notification.
  final Map<String, String> data;

  /// The icon image name of the asset saved in your app.
  final String iconReference;

  /// The URL of the large icon image to display in the content view of the push
  /// notification.
  final String imageIconUrl;

  /// The URL of an image to display in the push notification.
  final String imageUrl;

  /// The raw, JSON-formatted string to use as the payload for the notification
  /// message. This value overrides the message.
  final String rawContent;

  /// Specifies whether the notification is a silent push notification, which is
  /// a push notification that doesn't display on a recipient's device. Silent
  /// push notifications can be used for cases such as updating an app's
  /// configuration or supporting phone home functionality.
  final bool silentPush;

  /// The URL of the small icon image to display in the status bar and the
  /// content view of the push notification.
  final String smallImageIconUrl;

  /// The sound to play when the recipient receives the push notification. You
  /// can use the default stream or specify the file name of a sound resource
  /// that's bundled in your app. On an Android platform, the sound file must
  /// reside in /res/raw/.
  final String sound;

  /// The default message variables to use in the notification message. You can
  /// override the default variables with individual address variables.
  final Map<String, List<String>> substitutions;

  /// The amount of time, in seconds, that the Baidu Cloud Push service should
  /// store the message if the recipient's device is offline. The default value
  /// and maximum supported time is 604,800 seconds (7 days).
  final int timeToLive;

  /// The title to display above the notification message on the recipient's
  /// device.
  final String title;

  /// The URL to open in the recipient's default mobile browser, if a recipient
  /// taps the push notification and the value of the Action property is URL.
  final String url;

  BaiduMessage({
    this.action,
    this.body,
    this.data,
    this.iconReference,
    this.imageIconUrl,
    this.imageUrl,
    this.rawContent,
    this.silentPush,
    this.smallImageIconUrl,
    this.sound,
    this.substitutions,
    this.timeToLive,
    this.title,
    this.url,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides the results of a query that retrieved the data for a standard
/// metric that applies to an application or campaign.
class BaseKpiResult {
  /// An array of objects that provides the results of a query that retrieved
  /// the data for a standard metric that applies to an application or campaign.
  final List<ResultRow> rows;

  BaseKpiResult({
    @required this.rows,
  });
  static BaseKpiResult fromJson(Map<String, dynamic> json) => BaseKpiResult(
        rows: (json['Rows'] as List).map((e) => ResultRow.fromJson(e)).toList(),
      );
}

/// Provides the results of a query that retrieved the data for a standard
/// metric that applies to a campaign, and provides information about that
/// query.
class CampaignDateRangeKpiResponse {
  /// The unique identifier for the application that the metric applies to.
  final String applicationId;

  /// The unique identifier for the campaign that the metric applies to.
  final String campaignId;

  /// The last date or date and time of the date range that was used to filter
  /// the query results, in ISO 8601 format. The date range is inclusive.
  final DateTime endTime;

  /// The name of the metric, also referred to as a _key performance indicator
  /// (KPI)_, that the data was retrieved for. This value describes the
  /// associated metric and consists of two or more terms, which are comprised
  /// of lowercase alphanumeric characters, separated by a hyphen. For a list of
  /// valid values, see the
  /// [Amazon Pinpoint Developer Guide](developerguide.html).
  final String kpiName;

  /// An array of objects that contains the results of the query. Each object
  /// contains the value for the metric and metadata about that value.
  final BaseKpiResult kpiResult;

  /// The string to use in a subsequent request to get the next page of results
  /// in a paginated response. This value is null for the Campaign Metrics
  /// resource. The Campaign Metrics resource returns all results in a single
  /// page.
  final String nextToken;

  /// The first date or date and time of the date range that was used to filter
  /// the query results, in ISO 8601 format. The date range is inclusive.
  final DateTime startTime;

  CampaignDateRangeKpiResponse({
    @required this.applicationId,
    @required this.campaignId,
    @required this.endTime,
    @required this.kpiName,
    @required this.kpiResult,
    this.nextToken,
    @required this.startTime,
  });
  static CampaignDateRangeKpiResponse fromJson(Map<String, dynamic> json) =>
      CampaignDateRangeKpiResponse(
        applicationId: json['ApplicationId'] as String,
        campaignId: json['CampaignId'] as String,
        endTime: DateTime.parse(json['EndTime']),
        kpiName: json['KpiName'] as String,
        kpiResult: BaseKpiResult.fromJson(json['KpiResult']),
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
        startTime: DateTime.parse(json['StartTime']),
      );
}

/// Specifies the content and "From" address for an email message that's sent to
/// recipients of a campaign.
class CampaignEmailMessage {
  /// The body of the email for recipients whose email clients don't support
  /// HTML content.
  final String body;

  /// The verified email address to send the email from. The default address is
  /// the FromAddress specified for the email channel for the application.
  final String fromAddress;

  /// The body of the email, in HTML format, for recipients whose email clients
  /// support HTML content.
  final String htmlBody;

  /// The subject line, or title, of the email.
  final String title;

  CampaignEmailMessage({
    this.body,
    this.fromAddress,
    this.htmlBody,
    @required this.title,
  });
  static CampaignEmailMessage fromJson(Map<String, dynamic> json) =>
      CampaignEmailMessage(
        body: json.containsKey('Body') ? json['Body'] as String : null,
        fromAddress: json.containsKey('FromAddress')
            ? json['FromAddress'] as String
            : null,
        htmlBody:
            json.containsKey('HtmlBody') ? json['HtmlBody'] as String : null,
        title: json['Title'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies the settings for events that cause a campaign to be sent.
class CampaignEventFilter {
  /// The dimension settings of the event filter for the campaign.
  final EventDimensions dimensions;

  /// The type of event that causes the campaign to be sent. Valid values are:
  /// SYSTEM, sends the campaign when a system event occurs; and, ENDPOINT,
  /// sends the campaign when an endpoint event (Events resource) occurs.
  final String filterType;

  CampaignEventFilter({
    @required this.dimensions,
    @required this.filterType,
  });
  static CampaignEventFilter fromJson(Map<String, dynamic> json) =>
      CampaignEventFilter(
        dimensions: EventDimensions.fromJson(json['Dimensions']),
        filterType: json['FilterType'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies the AWS Lambda function to use as a code hook for a campaign.
class CampaignHook {
  /// The name or Amazon Resource Name (ARN) of the AWS Lambda function that
  /// Amazon Pinpoint invokes to send messages for a campaign.
  final String lambdaFunctionName;

  /// Specifies which Lambda mode to use when invoking the AWS Lambda function.
  final String mode;

  /// The web URL that Amazon Pinpoint calls to invoke the AWS Lambda function
  /// over HTTPS.
  final String webUrl;

  CampaignHook({
    this.lambdaFunctionName,
    this.mode,
    this.webUrl,
  });
  static CampaignHook fromJson(Map<String, dynamic> json) => CampaignHook(
        lambdaFunctionName: json.containsKey('LambdaFunctionName')
            ? json['LambdaFunctionName'] as String
            : null,
        mode: json.containsKey('Mode') ? json['Mode'] as String : null,
        webUrl: json.containsKey('WebUrl') ? json['WebUrl'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies limits on the messages that a campaign can send.
class CampaignLimits {
  /// The maximum number of messages that a campaign can send to a single
  /// endpoint during a 24-hour period. The maximum value is 100.
  final int daily;

  /// The maximum amount of time, in seconds, that a campaign can attempt to
  /// deliver a message after the scheduled start time for the campaign. The
  /// minimum value is 60 seconds.
  final int maximumDuration;

  /// The maximum number of messages that a campaign can send each second. The
  /// minimum value is 50. The maximum value is 20,000.
  final int messagesPerSecond;

  /// The maximum number of messages that a campaign can send to a single
  /// endpoint during the course of the campaign. The maximum value is 100.
  final int total;

  CampaignLimits({
    this.daily,
    this.maximumDuration,
    this.messagesPerSecond,
    this.total,
  });
  static CampaignLimits fromJson(Map<String, dynamic> json) => CampaignLimits(
        daily: json.containsKey('Daily') ? json['Daily'] as int : null,
        maximumDuration: json.containsKey('MaximumDuration')
            ? json['MaximumDuration'] as int
            : null,
        messagesPerSecond: json.containsKey('MessagesPerSecond')
            ? json['MessagesPerSecond'] as int
            : null,
        total: json.containsKey('Total') ? json['Total'] as int : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides information about the status, configuration, and other settings for
/// a campaign.
class CampaignResponse {
  /// An array of responses, one for each treatment that you defined for the
  /// campaign, in addition to the default treatment.
  final List<TreatmentResource> additionalTreatments;

  /// The unique identifier for the application that the campaign applies to.
  final String applicationId;

  /// The Amazon Resource Name (ARN) of the campaign.
  final String arn;

  /// The date, ISO 8601 format, when the campaign was created.
  final String creationDate;

  /// The current status of the campaign's default treatment. This value exists
  /// only for campaigns that have more than one treatment, to support A/B
  /// testing.
  final CampaignState defaultState;

  /// The custom description of the campaign.
  final String description;

  /// The allocated percentage of users (segment members) who shouldn't receive
  /// messages from the campaign.
  final int holdoutPercent;

  /// The settings for the AWS Lambda function to use as a code hook for the
  /// campaign.
  final CampaignHook hook;

  /// The unique identifier for the campaign.
  final String id;

  /// Specifies whether the campaign is paused. A paused campaign doesn't run
  /// unless you resume it by changing this value to false.
  final bool isPaused;

  /// The date, in ISO 8601 format, when the campaign was last modified.
  final String lastModifiedDate;

  /// The messaging limits for the campaign.
  final CampaignLimits limits;

  /// The message configuration settings for the campaign.
  final MessageConfiguration messageConfiguration;

  /// The name of the campaign.
  final String name;

  /// The schedule settings for the campaign.
  final Schedule schedule;

  /// The unique identifier for the segment that's associated with the campaign.
  final String segmentId;

  /// The version number of the segment that's associated with the campaign.
  final int segmentVersion;

  /// The current status of the campaign.
  final CampaignState state;

  /// A string-to-string map of key-value pairs that identifies the tags that
  /// are associated with the campaign. Each tag consists of a required tag key
  /// and an associated tag value.
  final Map<String, String> tags;

  /// The custom description of a variation of the campaign that's used for A/B
  /// testing.
  final String treatmentDescription;

  /// The custom name of a variation of the campaign that's used for A/B
  /// testing.
  final String treatmentName;

  /// The version number of the campaign.
  final int version;

  CampaignResponse({
    this.additionalTreatments,
    @required this.applicationId,
    @required this.arn,
    @required this.creationDate,
    this.defaultState,
    this.description,
    this.holdoutPercent,
    this.hook,
    @required this.id,
    this.isPaused,
    @required this.lastModifiedDate,
    this.limits,
    this.messageConfiguration,
    this.name,
    this.schedule,
    @required this.segmentId,
    @required this.segmentVersion,
    this.state,
    this.tags,
    this.treatmentDescription,
    this.treatmentName,
    this.version,
  });
  static CampaignResponse fromJson(Map<String, dynamic> json) =>
      CampaignResponse(
        additionalTreatments: json.containsKey('AdditionalTreatments')
            ? (json['AdditionalTreatments'] as List)
                .map((e) => TreatmentResource.fromJson(e))
                .toList()
            : null,
        applicationId: json['ApplicationId'] as String,
        arn: json['Arn'] as String,
        creationDate: json['CreationDate'] as String,
        defaultState: json.containsKey('DefaultState')
            ? CampaignState.fromJson(json['DefaultState'])
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        holdoutPercent: json.containsKey('HoldoutPercent')
            ? json['HoldoutPercent'] as int
            : null,
        hook: json.containsKey('Hook')
            ? CampaignHook.fromJson(json['Hook'])
            : null,
        id: json['Id'] as String,
        isPaused:
            json.containsKey('IsPaused') ? json['IsPaused'] as bool : null,
        lastModifiedDate: json['LastModifiedDate'] as String,
        limits: json.containsKey('Limits')
            ? CampaignLimits.fromJson(json['Limits'])
            : null,
        messageConfiguration: json.containsKey('MessageConfiguration')
            ? MessageConfiguration.fromJson(json['MessageConfiguration'])
            : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        schedule: json.containsKey('Schedule')
            ? Schedule.fromJson(json['Schedule'])
            : null,
        segmentId: json['SegmentId'] as String,
        segmentVersion: json['SegmentVersion'] as int,
        state: json.containsKey('State')
            ? CampaignState.fromJson(json['State'])
            : null,
        tags: json.containsKey('tags')
            ? (json['tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        treatmentDescription: json.containsKey('TreatmentDescription')
            ? json['TreatmentDescription'] as String
            : null,
        treatmentName: json.containsKey('TreatmentName')
            ? json['TreatmentName'] as String
            : null,
        version: json.containsKey('Version') ? json['Version'] as int : null,
      );
}

/// Specifies the content and settings for an SMS message that's sent to
/// recipients of a campaign.
class CampaignSmsMessage {
  /// The body of the SMS message.
  final String body;

  /// The type of SMS message. Valid values are: TRANSACTIONAL, the message is
  /// critical or time-sensitive, such as a one-time password that supports a
  /// customer transaction; and, PROMOTIONAL, the message isn't critical or
  /// time-sensitive, such as a marketing message.
  final String messageType;

  /// The sender ID to display on recipients' devices when they receive the SMS
  /// message.
  final String senderId;

  CampaignSmsMessage({
    this.body,
    this.messageType,
    this.senderId,
  });
  static CampaignSmsMessage fromJson(Map<String, dynamic> json) =>
      CampaignSmsMessage(
        body: json.containsKey('Body') ? json['Body'] as String : null,
        messageType: json.containsKey('MessageType')
            ? json['MessageType'] as String
            : null,
        senderId:
            json.containsKey('SenderId') ? json['SenderId'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides information about the status of a campaign.
class CampaignState {
  /// The status of the campaign, or the status of a treatment that belongs to
  /// an A/B test campaign. If a campaign uses A/B testing, the campaign has a
  /// status of COMPLETED only when all campaign treatments have a status of
  /// COMPLETED.
  final String campaignStatus;

  CampaignState({
    this.campaignStatus,
  });
  static CampaignState fromJson(Map<String, dynamic> json) => CampaignState(
        campaignStatus: json.containsKey('CampaignStatus')
            ? json['CampaignStatus'] as String
            : null,
      );
}

/// Provides information about the configuration and other settings for all the
/// campaigns that are associated with an application.
class CampaignsResponse {
  /// An array of responses, one for each campaign that's associated with the
  /// application.
  final List<CampaignResponse> item;

  /// The string to use in a subsequent request to get the next page of results
  /// in a paginated response. This value is null if there are no additional
  /// pages.
  final String nextToken;

  CampaignsResponse({
    @required this.item,
    this.nextToken,
  });
  static CampaignsResponse fromJson(Map<String, dynamic> json) =>
      CampaignsResponse(
        item: (json['Item'] as List)
            .map((e) => CampaignResponse.fromJson(e))
            .toList(),
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// Provides information about the general settings and status of a channel for
/// an application.
class ChannelResponse {
  /// The unique identifier for the application.
  final String applicationId;

  /// The date and time, in ISO 8601 format, when the channel was enabled.
  final String creationDate;

  /// Specifies whether the channel is enabled for the application.
  final bool enabled;

  /// (Not used) This property is retained only for backward compatibility.
  final bool hasCredential;

  /// (Deprecated) An identifier for the channel. This property is retained only
  /// for backward compatibility.
  final String id;

  /// Specifies whether the channel is archived.
  final bool isArchived;

  /// The user who last modified the channel.
  final String lastModifiedBy;

  /// The date and time, in ISO 8601 format, when the channel was last modified.
  final String lastModifiedDate;

  /// The current version of the channel.
  final int version;

  ChannelResponse({
    this.applicationId,
    this.creationDate,
    this.enabled,
    this.hasCredential,
    this.id,
    this.isArchived,
    this.lastModifiedBy,
    this.lastModifiedDate,
    this.version,
  });
  static ChannelResponse fromJson(Map<String, dynamic> json) => ChannelResponse(
        applicationId: json.containsKey('ApplicationId')
            ? json['ApplicationId'] as String
            : null,
        creationDate: json.containsKey('CreationDate')
            ? json['CreationDate'] as String
            : null,
        enabled: json.containsKey('Enabled') ? json['Enabled'] as bool : null,
        hasCredential: json.containsKey('HasCredential')
            ? json['HasCredential'] as bool
            : null,
        id: json.containsKey('Id') ? json['Id'] as String : null,
        isArchived:
            json.containsKey('IsArchived') ? json['IsArchived'] as bool : null,
        lastModifiedBy: json.containsKey('LastModifiedBy')
            ? json['LastModifiedBy'] as String
            : null,
        lastModifiedDate: json.containsKey('LastModifiedDate')
            ? json['LastModifiedDate'] as String
            : null,
        version: json.containsKey('Version') ? json['Version'] as int : null,
      );
}

/// Provides information about the general settings and status of all channels
/// for an application, including channels that aren't enabled for the
/// application.
class ChannelsResponse {
  /// A map that contains a multipart response for each channel. For each item
  /// in this object, the ChannelType is the key and the Channel is the value.
  final Map<String, ChannelResponse> channels;

  ChannelsResponse({
    @required this.channels,
  });
  static ChannelsResponse fromJson(Map<String, dynamic> json) =>
      ChannelsResponse(
        channels: (json['Channels'] as Map)
            .map((k, v) => MapEntry(k as String, ChannelResponse.fromJson(v))),
      );
}

class CreateAppResponse {
  final ApplicationResponse applicationResponse;

  CreateAppResponse({
    @required this.applicationResponse,
  });
  static CreateAppResponse fromJson(Map<String, dynamic> json) =>
      CreateAppResponse(
        applicationResponse:
            ApplicationResponse.fromJson(json['ApplicationResponse']),
      );
}

/// Specifies the display name of an application and the tags to associate with
/// the application.
class CreateApplicationRequest {
  /// The display name of the application. This name is displayed as the
  /// **Project name** on the Amazon Pinpoint console.
  final String name;

  /// A string-to-string map of key-value pairs that defines the tags to
  /// associate with the application. Each tag consists of a required tag key
  /// and an associated tag value.
  final Map<String, String> tags;

  CreateApplicationRequest({
    @required this.name,
    this.tags,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class CreateCampaignResponse {
  final CampaignResponse campaignResponse;

  CreateCampaignResponse({
    @required this.campaignResponse,
  });
  static CreateCampaignResponse fromJson(Map<String, dynamic> json) =>
      CreateCampaignResponse(
        campaignResponse: CampaignResponse.fromJson(json['CampaignResponse']),
      );
}

class CreateExportJobResponse {
  final ExportJobResponse exportJobResponse;

  CreateExportJobResponse({
    @required this.exportJobResponse,
  });
  static CreateExportJobResponse fromJson(Map<String, dynamic> json) =>
      CreateExportJobResponse(
        exportJobResponse:
            ExportJobResponse.fromJson(json['ExportJobResponse']),
      );
}

class CreateImportJobResponse {
  final ImportJobResponse importJobResponse;

  CreateImportJobResponse({
    @required this.importJobResponse,
  });
  static CreateImportJobResponse fromJson(Map<String, dynamic> json) =>
      CreateImportJobResponse(
        importJobResponse:
            ImportJobResponse.fromJson(json['ImportJobResponse']),
      );
}

class CreateSegmentResponse {
  final SegmentResponse segmentResponse;

  CreateSegmentResponse({
    @required this.segmentResponse,
  });
  static CreateSegmentResponse fromJson(Map<String, dynamic> json) =>
      CreateSegmentResponse(
        segmentResponse: SegmentResponse.fromJson(json['SegmentResponse']),
      );
}

/// Specifies the default message to use for all channels.
class DefaultMessage {
  /// The default message body of the push notification, email, or SMS message.
  final String body;

  /// The default message variables to use in the push notification, email, or
  /// SMS message. You can override these default variables with individual
  /// address variables.
  final Map<String, List<String>> substitutions;

  DefaultMessage({
    this.body,
    this.substitutions,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies the default settings and content for a push notification that's
/// sent directly to an endpoint.
class DefaultPushNotificationMessage {
  /// The default action to occur if a recipient taps the push notification.
  /// Valid values are:
  ///
  /// *   OPEN_APP - Your app opens or it becomes the foreground app if it was
  /// sent to the background. This is the default action.
  ///
  /// *   DEEP_LINK - Your app opens and displays a designated user interface in
  /// the app. This setting uses the deep-linking features of the iOS and
  /// Android platforms.
  ///
  /// *   URL - The default mobile browser on the recipient's device opens and
  /// loads the web page at a URL that you specify.
  final String action;

  /// The default body of the notification message.
  final String body;

  /// The JSON data payload to use for the default push notification, if the
  /// notification is a silent push notification. This payload is added to the
  /// data.pinpoint.jsonBody object of the notification.
  final Map<String, String> data;

  /// Specifies whether the default notification is a silent push notification,
  /// which is a push notification that doesn't display on a recipient's device.
  /// Silent push notifications can be used for cases such as updating an app's
  /// configuration or delivering messages to an in-app notification center.
  final bool silentPush;

  /// The default message variables to use in the notification message. You can
  /// override the default variables with individual address variables.
  final Map<String, List<String>> substitutions;

  /// The default title to display above the notification message on a
  /// recipient's device.
  final String title;

  /// The default URL to open in a recipient's default mobile browser, if a
  /// recipient taps the push notification and the value of the Action property
  /// is URL.
  final String url;

  DefaultPushNotificationMessage({
    this.action,
    this.body,
    this.data,
    this.silentPush,
    this.substitutions,
    this.title,
    this.url,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class DeleteAdmChannelResponse {
  final AdmChannelResponse admChannelResponse;

  DeleteAdmChannelResponse({
    @required this.admChannelResponse,
  });
  static DeleteAdmChannelResponse fromJson(Map<String, dynamic> json) =>
      DeleteAdmChannelResponse(
        admChannelResponse:
            AdmChannelResponse.fromJson(json['ADMChannelResponse']),
      );
}

class DeleteApnsChannelResponse {
  final ApnsChannelResponse apnsChannelResponse;

  DeleteApnsChannelResponse({
    @required this.apnsChannelResponse,
  });
  static DeleteApnsChannelResponse fromJson(Map<String, dynamic> json) =>
      DeleteApnsChannelResponse(
        apnsChannelResponse:
            ApnsChannelResponse.fromJson(json['APNSChannelResponse']),
      );
}

class DeleteApnsSandboxChannelResponse {
  final ApnsSandboxChannelResponse apnsSandboxChannelResponse;

  DeleteApnsSandboxChannelResponse({
    @required this.apnsSandboxChannelResponse,
  });
  static DeleteApnsSandboxChannelResponse fromJson(Map<String, dynamic> json) =>
      DeleteApnsSandboxChannelResponse(
        apnsSandboxChannelResponse: ApnsSandboxChannelResponse.fromJson(
            json['APNSSandboxChannelResponse']),
      );
}

class DeleteApnsVoipChannelResponse {
  final ApnsVoipChannelResponse apnsVoipChannelResponse;

  DeleteApnsVoipChannelResponse({
    @required this.apnsVoipChannelResponse,
  });
  static DeleteApnsVoipChannelResponse fromJson(Map<String, dynamic> json) =>
      DeleteApnsVoipChannelResponse(
        apnsVoipChannelResponse:
            ApnsVoipChannelResponse.fromJson(json['APNSVoipChannelResponse']),
      );
}

class DeleteApnsVoipSandboxChannelResponse {
  final ApnsVoipSandboxChannelResponse apnsVoipSandboxChannelResponse;

  DeleteApnsVoipSandboxChannelResponse({
    @required this.apnsVoipSandboxChannelResponse,
  });
  static DeleteApnsVoipSandboxChannelResponse fromJson(
          Map<String, dynamic> json) =>
      DeleteApnsVoipSandboxChannelResponse(
        apnsVoipSandboxChannelResponse: ApnsVoipSandboxChannelResponse.fromJson(
            json['APNSVoipSandboxChannelResponse']),
      );
}

class DeleteAppResponse {
  final ApplicationResponse applicationResponse;

  DeleteAppResponse({
    @required this.applicationResponse,
  });
  static DeleteAppResponse fromJson(Map<String, dynamic> json) =>
      DeleteAppResponse(
        applicationResponse:
            ApplicationResponse.fromJson(json['ApplicationResponse']),
      );
}

class DeleteBaiduChannelResponse {
  final BaiduChannelResponse baiduChannelResponse;

  DeleteBaiduChannelResponse({
    @required this.baiduChannelResponse,
  });
  static DeleteBaiduChannelResponse fromJson(Map<String, dynamic> json) =>
      DeleteBaiduChannelResponse(
        baiduChannelResponse:
            BaiduChannelResponse.fromJson(json['BaiduChannelResponse']),
      );
}

class DeleteCampaignResponse {
  final CampaignResponse campaignResponse;

  DeleteCampaignResponse({
    @required this.campaignResponse,
  });
  static DeleteCampaignResponse fromJson(Map<String, dynamic> json) =>
      DeleteCampaignResponse(
        campaignResponse: CampaignResponse.fromJson(json['CampaignResponse']),
      );
}

class DeleteEmailChannelResponse {
  final EmailChannelResponse emailChannelResponse;

  DeleteEmailChannelResponse({
    @required this.emailChannelResponse,
  });
  static DeleteEmailChannelResponse fromJson(Map<String, dynamic> json) =>
      DeleteEmailChannelResponse(
        emailChannelResponse:
            EmailChannelResponse.fromJson(json['EmailChannelResponse']),
      );
}

class DeleteEndpointResponse {
  final EndpointResponse endpointResponse;

  DeleteEndpointResponse({
    @required this.endpointResponse,
  });
  static DeleteEndpointResponse fromJson(Map<String, dynamic> json) =>
      DeleteEndpointResponse(
        endpointResponse: EndpointResponse.fromJson(json['EndpointResponse']),
      );
}

class DeleteEventStreamResponse {
  final EventStream eventStream;

  DeleteEventStreamResponse({
    @required this.eventStream,
  });
  static DeleteEventStreamResponse fromJson(Map<String, dynamic> json) =>
      DeleteEventStreamResponse(
        eventStream: EventStream.fromJson(json['EventStream']),
      );
}

class DeleteGcmChannelResponse {
  final GcmChannelResponse gcmChannelResponse;

  DeleteGcmChannelResponse({
    @required this.gcmChannelResponse,
  });
  static DeleteGcmChannelResponse fromJson(Map<String, dynamic> json) =>
      DeleteGcmChannelResponse(
        gcmChannelResponse:
            GcmChannelResponse.fromJson(json['GCMChannelResponse']),
      );
}

class DeleteSegmentResponse {
  final SegmentResponse segmentResponse;

  DeleteSegmentResponse({
    @required this.segmentResponse,
  });
  static DeleteSegmentResponse fromJson(Map<String, dynamic> json) =>
      DeleteSegmentResponse(
        segmentResponse: SegmentResponse.fromJson(json['SegmentResponse']),
      );
}

class DeleteSmsChannelResponse {
  final SmsChannelResponse smsChannelResponse;

  DeleteSmsChannelResponse({
    @required this.smsChannelResponse,
  });
  static DeleteSmsChannelResponse fromJson(Map<String, dynamic> json) =>
      DeleteSmsChannelResponse(
        smsChannelResponse:
            SmsChannelResponse.fromJson(json['SMSChannelResponse']),
      );
}

class DeleteUserEndpointsResponse {
  final EndpointsResponse endpointsResponse;

  DeleteUserEndpointsResponse({
    @required this.endpointsResponse,
  });
  static DeleteUserEndpointsResponse fromJson(Map<String, dynamic> json) =>
      DeleteUserEndpointsResponse(
        endpointsResponse:
            EndpointsResponse.fromJson(json['EndpointsResponse']),
      );
}

class DeleteVoiceChannelResponse {
  final VoiceChannelResponse voiceChannelResponse;

  DeleteVoiceChannelResponse({
    @required this.voiceChannelResponse,
  });
  static DeleteVoiceChannelResponse fromJson(Map<String, dynamic> json) =>
      DeleteVoiceChannelResponse(
        voiceChannelResponse:
            VoiceChannelResponse.fromJson(json['VoiceChannelResponse']),
      );
}

/// Specifies the settings and content for the default message and any default
/// messages that you tailored for specific channels.
class DirectMessageConfiguration {
  /// The default push notification message for the ADM (Amazon Device
  /// Messaging) channel. This message overrides the default push notification
  /// message (DefaultPushNotificationMessage).
  final AdmMessage admMessage;

  /// The default push notification message for the APNs (Apple Push
  /// Notification service) channel. This message overrides the default push
  /// notification message (DefaultPushNotificationMessage).
  final ApnsMessage apnsMessage;

  /// The default push notification message for the Baidu (Baidu Cloud Push)
  /// channel. This message overrides the default push notification message
  /// (DefaultPushNotificationMessage).
  final BaiduMessage baiduMessage;

  /// The default message body for all channels.
  final DefaultMessage defaultMessage;

  /// The default push notification message for all push channels.
  final DefaultPushNotificationMessage defaultPushNotificationMessage;

  /// The default message for the email channel. This message overrides the
  /// default message (DefaultMessage).
  final EmailMessage emailMessage;

  /// The default push notification message for the GCM channel, which is used
  /// to send notifications through the Firebase Cloud Messaging (FCM), formerly
  /// Google Cloud Messaging (GCM), service. This message overrides the default
  /// push notification message (DefaultPushNotificationMessage).
  final GcmMessage gcmMessage;

  /// The default message for the SMS channel. This message overrides the
  /// default message (DefaultMessage).
  final SmsMessage smsMessage;

  /// The default message for the voice channel. This message overrides the
  /// default message (DefaultMessage).
  final VoiceMessage voiceMessage;

  DirectMessageConfiguration({
    this.admMessage,
    this.apnsMessage,
    this.baiduMessage,
    this.defaultMessage,
    this.defaultPushNotificationMessage,
    this.emailMessage,
    this.gcmMessage,
    this.smsMessage,
    this.voiceMessage,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies the status and settings of the email channel for an application.
class EmailChannelRequest {
  /// The configuration set that you want to apply to email that you send
  /// through the channel by using the
  /// [Amazon Pinpoint Email API](emailAPIreference.html).
  final String configurationSet;

  /// Specifies whether to enable the email channel for the application.
  final bool enabled;

  /// The verified email address that you want to send email from when you send
  /// email through the channel.
  final String fromAddress;

  /// The Amazon Resource Name (ARN) of the identity, verified with Amazon
  /// Simple Email Service (Amazon SES), that you want to use when you send
  /// email through the channel.
  final String identity;

  /// The ARN of the AWS Identity and Access Management (IAM) role that you want
  /// Amazon Pinpoint to use when it submits email-related event data for the
  /// channel.
  final String roleArn;

  EmailChannelRequest({
    this.configurationSet,
    this.enabled,
    @required this.fromAddress,
    @required this.identity,
    this.roleArn,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides information about the status and settings of the email channel for
/// an application.
class EmailChannelResponse {
  /// The unique identifier for the application that the email channel applies
  /// to.
  final String applicationId;

  /// The configuration set that's applied to email that's sent through the
  /// channel by using the [Amazon Pinpoint Email API](emailAPIreference.html).
  final String configurationSet;

  /// The date and time, in ISO 8601 format, when the email channel was enabled.
  final String creationDate;

  /// Specifies whether the email channel is enabled for the application.
  final bool enabled;

  /// The verified email address that you send email from when you send email
  /// through the channel.
  final String fromAddress;

  /// (Not used) This property is retained only for backward compatibility.
  final bool hasCredential;

  /// (Deprecated) An identifier for the email channel. This property is
  /// retained only for backward compatibility.
  final String id;

  /// The Amazon Resource Name (ARN) of the identity, verified with Amazon
  /// Simple Email Service (Amazon SES), that you use when you send email
  /// through the channel.
  final String identity;

  /// Specifies whether the email channel is archived.
  final bool isArchived;

  /// The user who last modified the email channel.
  final String lastModifiedBy;

  /// The date and time, in ISO 8601 format, when the email channel was last
  /// modified.
  final String lastModifiedDate;

  /// The maximum number of emails that you can send through the channel each
  /// second.
  final int messagesPerSecond;

  /// The type of messaging or notification platform for the channel. For the
  /// email channel, this value is EMAIL.
  final String platform;

  /// The ARN of the AWS Identity and Access Management (IAM) role that Amazon
  /// Pinpoint uses to submit email-related event data for the channel.
  final String roleArn;

  /// The current version of the email channel.
  final int version;

  EmailChannelResponse({
    this.applicationId,
    this.configurationSet,
    this.creationDate,
    this.enabled,
    this.fromAddress,
    this.hasCredential,
    this.id,
    this.identity,
    this.isArchived,
    this.lastModifiedBy,
    this.lastModifiedDate,
    this.messagesPerSecond,
    @required this.platform,
    this.roleArn,
    this.version,
  });
  static EmailChannelResponse fromJson(Map<String, dynamic> json) =>
      EmailChannelResponse(
        applicationId: json.containsKey('ApplicationId')
            ? json['ApplicationId'] as String
            : null,
        configurationSet: json.containsKey('ConfigurationSet')
            ? json['ConfigurationSet'] as String
            : null,
        creationDate: json.containsKey('CreationDate')
            ? json['CreationDate'] as String
            : null,
        enabled: json.containsKey('Enabled') ? json['Enabled'] as bool : null,
        fromAddress: json.containsKey('FromAddress')
            ? json['FromAddress'] as String
            : null,
        hasCredential: json.containsKey('HasCredential')
            ? json['HasCredential'] as bool
            : null,
        id: json.containsKey('Id') ? json['Id'] as String : null,
        identity:
            json.containsKey('Identity') ? json['Identity'] as String : null,
        isArchived:
            json.containsKey('IsArchived') ? json['IsArchived'] as bool : null,
        lastModifiedBy: json.containsKey('LastModifiedBy')
            ? json['LastModifiedBy'] as String
            : null,
        lastModifiedDate: json.containsKey('LastModifiedDate')
            ? json['LastModifiedDate'] as String
            : null,
        messagesPerSecond: json.containsKey('MessagesPerSecond')
            ? json['MessagesPerSecond'] as int
            : null,
        platform: json['Platform'] as String,
        roleArn: json.containsKey('RoleArn') ? json['RoleArn'] as String : null,
        version: json.containsKey('Version') ? json['Version'] as int : null,
      );
}

/// Specifies the default settings and content for a one-time email message
/// that's sent directly to an endpoint.
class EmailMessage {
  /// The body of the email message.
  final String body;

  /// The email address to forward bounces and complaints to, if feedback
  /// forwarding is enabled.
  final String feedbackForwardingAddress;

  /// The verified email address to send the email message from. The default
  /// value is the FromAddress specified for the email channel.
  final String fromAddress;

  /// The email message, represented as a raw MIME message.
  final RawEmail rawEmail;

  /// The reply-to email address(es) for the email message. If a recipient
  /// replies to the email, each reply-to address receives the reply.
  final List<String> replyToAddresses;

  /// The email message, composed of a subject, a text part, and an HTML part.
  final SimpleEmail simpleEmail;

  /// The default message variables to use in the email message. You can
  /// override the default variables with individual address variables.
  final Map<String, List<String>> substitutions;

  EmailMessage({
    this.body,
    this.feedbackForwardingAddress,
    this.fromAddress,
    this.rawEmail,
    this.replyToAddresses,
    this.simpleEmail,
    this.substitutions,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies an endpoint to create or update and the settings and attributes to
/// set or change for the endpoint.
class EndpointBatchItem {
  /// The destination address for messages or push notifications that you send
  /// to the endpoint. The address varies by channel. For a push-notification
  /// channel, use the token provided by the push notification service, such as
  /// an Apple Push Notification service (APNs) device token or a Firebase Cloud
  /// Messaging (FCM) registration token. For the SMS channel, use a phone
  /// number in E.164 format, such as +12065550100. For the email channel, use
  /// an email address.
  final String address;

  /// One or more custom attributes that describe the endpoint by associating a
  /// name with an array of values. For example, the value of a custom attribute
  /// named Interests might be: ["science", "music", "travel"]. You can use
  /// these attributes as filter criteria when you create segments.
  ///
  /// When you define the name of a custom attribute, avoid using the following
  /// characters: number sign (#), colon (:), question mark (?), backslash (),
  /// and slash (/). The Amazon Pinpoint console can't display attribute names
  /// that contain these characters. This limitation doesn't apply to attribute
  /// values.
  final Map<String, List<String>> attributes;

  /// The channel to use when sending messages or push notifications to the
  /// endpoint.
  final String channelType;

  /// The demographic information for the endpoint, such as the time zone and
  /// platform.
  final EndpointDemographic demographic;

  /// The date and time, in ISO 8601 format, when the endpoint was created or
  /// updated.
  final String effectiveDate;

  /// Not used.
  final String endpointStatus;

  /// The unique identifier for the endpoint in the context of the batch.
  final String id;

  /// The geographic information for the endpoint.
  final EndpointLocation location;

  /// One or more custom metrics that your app reports to Amazon Pinpoint for
  /// the endpoint.
  final Map<String, double> metrics;

  /// Specifies whether the user who's associated with the endpoint has opted
  /// out of receiving messages and push notifications from you. Possible values
  /// are: ALL, the user has opted out and doesn't want to receive any messages
  /// or push notifications; and, NONE, the user hasn't opted out and wants to
  /// receive all messages and push notifications.
  final String optOut;

  /// The unique identifier for the request to create or update the endpoint.
  final String requestId;

  /// One or more custom user attributes that your app reports to Amazon
  /// Pinpoint for the user who's associated with the endpoint.
  final EndpointUser user;

  EndpointBatchItem({
    this.address,
    this.attributes,
    this.channelType,
    this.demographic,
    this.effectiveDate,
    this.endpointStatus,
    this.id,
    this.location,
    this.metrics,
    this.optOut,
    this.requestId,
    this.user,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies a batch of endpoints to create or update and the settings and
/// attributes to set or change for each endpoint.
class EndpointBatchRequest {
  /// An array that defines the endpoints to create or update and, for each
  /// endpoint, the property values to set or change. An array can contain a
  /// maximum of 100 items.
  final List<EndpointBatchItem> item;

  EndpointBatchRequest({
    @required this.item,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies demographic information about an endpoint, such as the applicable
/// time zone and platform.
class EndpointDemographic {
  /// The version of the app that's associated with the endpoint.
  final String appVersion;

  /// The locale of the endpoint, in the following format: the ISO 639-1 alpha-2
  /// code, followed by an underscore (_), followed by an ISO 3166-1 alpha-2
  /// value.
  final String locale;

  /// The manufacturer of the endpoint device, such as Apple or Samsung.
  final String make;

  /// The model name or number of the endpoint device, such as iPhone.
  final String model;

  /// The model version of the endpoint device.
  final String modelVersion;

  /// The platform of the endpoint device, such as iOS or Android.
  final String platform;

  /// The platform version of the endpoint device.
  final String platformVersion;

  /// The time zone of the endpoint, specified as a tz database name value, such
  /// as America/Los_Angeles.
  final String timezone;

  EndpointDemographic({
    this.appVersion,
    this.locale,
    this.make,
    this.model,
    this.modelVersion,
    this.platform,
    this.platformVersion,
    this.timezone,
  });
  static EndpointDemographic fromJson(Map<String, dynamic> json) =>
      EndpointDemographic(
        appVersion: json.containsKey('AppVersion')
            ? json['AppVersion'] as String
            : null,
        locale: json.containsKey('Locale') ? json['Locale'] as String : null,
        make: json.containsKey('Make') ? json['Make'] as String : null,
        model: json.containsKey('Model') ? json['Model'] as String : null,
        modelVersion: json.containsKey('ModelVersion')
            ? json['ModelVersion'] as String
            : null,
        platform:
            json.containsKey('Platform') ? json['Platform'] as String : null,
        platformVersion: json.containsKey('PlatformVersion')
            ? json['PlatformVersion'] as String
            : null,
        timezone:
            json.containsKey('Timezone') ? json['Timezone'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides the status code and message that result from processing data for an
/// endpoint.
class EndpointItemResponse {
  /// The custom message that's returned in the response as a result of
  /// processing the endpoint data.
  final String message;

  /// The status code that's returned in the response as a result of processing
  /// the endpoint data.
  final int statusCode;

  EndpointItemResponse({
    this.message,
    this.statusCode,
  });
  static EndpointItemResponse fromJson(Map<String, dynamic> json) =>
      EndpointItemResponse(
        message: json.containsKey('Message') ? json['Message'] as String : null,
        statusCode:
            json.containsKey('StatusCode') ? json['StatusCode'] as int : null,
      );
}

/// Specifies geographic information about an endpoint.
class EndpointLocation {
  /// The name of the city where the endpoint is located.
  final String city;

  /// The two-character code, in ISO 3166-1 alpha-2 format, for the country or
  /// region where the endpoint is located. For example, US for the United
  /// States.
  final String country;

  /// The latitude coordinate of the endpoint location, rounded to one decimal
  /// place.
  final double latitude;

  /// The longitude coordinate of the endpoint location, rounded to one decimal
  /// place.
  final double longitude;

  /// The postal or ZIP code for the area where the endpoint is located.
  final String postalCode;

  /// The name of the region where the endpoint is located. For locations in the
  /// United States, this value is the name of a state.
  final String region;

  EndpointLocation({
    this.city,
    this.country,
    this.latitude,
    this.longitude,
    this.postalCode,
    this.region,
  });
  static EndpointLocation fromJson(Map<String, dynamic> json) =>
      EndpointLocation(
        city: json.containsKey('City') ? json['City'] as String : null,
        country: json.containsKey('Country') ? json['Country'] as String : null,
        latitude:
            json.containsKey('Latitude') ? json['Latitude'] as double : null,
        longitude:
            json.containsKey('Longitude') ? json['Longitude'] as double : null,
        postalCode: json.containsKey('PostalCode')
            ? json['PostalCode'] as String
            : null,
        region: json.containsKey('Region') ? json['Region'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides information about the delivery status and results of sending a
/// message directly to an endpoint.
class EndpointMessageResult {
  /// The endpoint address that the message was delivered to.
  final String address;

  /// The delivery status of the message. Possible values are:
  ///
  /// *   DUPLICATE - The endpoint address is a duplicate of another endpoint
  /// address. Amazon Pinpoint won't attempt to send the message again.
  ///
  /// *   OPT_OUT - The user who's associated with the endpoint has opted out of
  /// receiving messages from you. Amazon Pinpoint won't attempt to send the
  /// message again.
  ///
  /// *   PERMANENT_FAILURE - An error occurred when delivering the message to
  /// the endpoint. Amazon Pinpoint won't attempt to send the message again.
  ///
  /// *   SUCCESSFUL - The message was successfully delivered to the endpoint.
  ///
  /// *   TEMPORARY_FAILURE - A temporary error occurred. Amazon Pinpoint will
  /// attempt to deliver the message again later.
  ///
  /// *   THROTTLED - Amazon Pinpoint throttled the operation to send the
  /// message to the endpoint.
  ///
  /// *   TIMEOUT - The message couldn't be sent within the timeout period.
  ///
  /// *   UNKNOWN_FAILURE - An unknown error occurred.
  final String deliveryStatus;

  /// The unique identifier for the message that was sent.
  final String messageId;

  /// The downstream service status code for delivering the message.
  final int statusCode;

  /// The status message for delivering the message.
  final String statusMessage;

  /// For push notifications that are sent through the GCM channel, specifies
  /// whether the token was updated as part of delivering the message.
  final String updatedToken;

  EndpointMessageResult({
    this.address,
    @required this.deliveryStatus,
    this.messageId,
    @required this.statusCode,
    this.statusMessage,
    this.updatedToken,
  });
  static EndpointMessageResult fromJson(Map<String, dynamic> json) =>
      EndpointMessageResult(
        address: json.containsKey('Address') ? json['Address'] as String : null,
        deliveryStatus: json['DeliveryStatus'] as String,
        messageId:
            json.containsKey('MessageId') ? json['MessageId'] as String : null,
        statusCode: json['StatusCode'] as int,
        statusMessage: json.containsKey('StatusMessage')
            ? json['StatusMessage'] as String
            : null,
        updatedToken: json.containsKey('UpdatedToken')
            ? json['UpdatedToken'] as String
            : null,
      );
}

/// Specifies the channel type and other settings for an endpoint.
class EndpointRequest {
  /// The destination address for messages or push notifications that you send
  /// to the endpoint. The address varies by channel. For a push-notification
  /// channel, use the token provided by the push notification service, such as
  /// an Apple Push Notification service (APNs) device token or a Firebase Cloud
  /// Messaging (FCM) registration token. For the SMS channel, use a phone
  /// number in E.164 format, such as +12065550100. For the email channel, use
  /// an email address.
  final String address;

  /// One or more custom attributes that describe the endpoint by associating a
  /// name with an array of values. For example, the value of a custom attribute
  /// named Interests might be: ["science", "music", "travel"]. You can use
  /// these attributes as filter criteria when you create segments.
  ///
  /// When you define the name of a custom attribute, avoid using the following
  /// characters: number sign (#), colon (:), question mark (?), backslash (),
  /// and slash (/). The Amazon Pinpoint console can't display attribute names
  /// that contain these characters. This limitation doesn't apply to attribute
  /// values.
  final Map<String, List<String>> attributes;

  /// The channel to use when sending messages or push notifications to the
  /// endpoint.
  final String channelType;

  /// The demographic information for the endpoint, such as the time zone and
  /// platform.
  final EndpointDemographic demographic;

  /// The date and time, in ISO 8601 format, when the endpoint is updated.
  final String effectiveDate;

  /// Not used.
  final String endpointStatus;

  /// The geographic information for the endpoint.
  final EndpointLocation location;

  /// One or more custom metrics that your app reports to Amazon Pinpoint for
  /// the endpoint.
  final Map<String, double> metrics;

  /// Specifies whether the user who's associated with the endpoint has opted
  /// out of receiving messages and push notifications from you. Possible values
  /// are: ALL, the user has opted out and doesn't want to receive any messages
  /// or push notifications; and, NONE, the user hasn't opted out and wants to
  /// receive all messages and push notifications.
  final String optOut;

  /// The unique identifier for the most recent request to update the endpoint.
  final String requestId;

  /// One or more custom user attributes that describe the user who's associated
  /// with the endpoint.
  final EndpointUser user;

  EndpointRequest({
    this.address,
    this.attributes,
    this.channelType,
    this.demographic,
    this.effectiveDate,
    this.endpointStatus,
    this.location,
    this.metrics,
    this.optOut,
    this.requestId,
    this.user,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides information about the channel type and other settings for an
/// endpoint.
class EndpointResponse {
  /// The destination address for messages or push notifications that you send
  /// to the endpoint. The address varies by channel. For example, the address
  /// for a push-notification channel is typically the token provided by a push
  /// notification service, such as an Apple Push Notification service (APNs)
  /// device token or a Firebase Cloud Messaging (FCM) registration token. The
  /// address for the SMS channel is a phone number in E.164 format, such as
  /// +12065550100. The address for the email channel is an email address.
  final String address;

  /// The unique identifier for the application that's associated with the
  /// endpoint.
  final String applicationId;

  /// One or more custom attributes that describe the endpoint by associating a
  /// name with an array of values. For example, the value of a custom attribute
  /// named Interests might be: ["science", "music", "travel"]. You can use
  /// these attributes as filter criteria when you create segments.
  final Map<String, List<String>> attributes;

  /// The channel that's used when sending messages or push notifications to the
  /// endpoint.
  final String channelType;

  /// A number from 0-99 that represents the cohort that the endpoint is
  /// assigned to. Endpoints are grouped into cohorts randomly, and each cohort
  /// contains approximately 1 percent of the endpoints for an application.
  /// Amazon Pinpoint assigns cohorts to the holdout or treatment allocations
  /// for campaigns.
  final String cohortId;

  /// The date and time, in ISO 8601 format, when the endpoint was created.
  final String creationDate;

  /// The demographic information for the endpoint, such as the time zone and
  /// platform.
  final EndpointDemographic demographic;

  /// The date and time, in ISO 8601 format, when the endpoint was last updated.
  final String effectiveDate;

  /// Not used.
  final String endpointStatus;

  /// The unique identifier that you assigned to the endpoint. The identifier
  /// should be a globally unique identifier (GUID) to ensure that it doesn't
  /// conflict with other endpoint identifiers that are associated with the
  /// application.
  final String id;

  /// The geographic information for the endpoint.
  final EndpointLocation location;

  /// One or more custom metrics that your app reports to Amazon Pinpoint for
  /// the endpoint.
  final Map<String, double> metrics;

  /// Specifies whether the user who's associated with the endpoint has opted
  /// out of receiving messages and push notifications from you. Possible values
  /// are: ALL, the user has opted out and doesn't want to receive any messages
  /// or push notifications; and, NONE, the user hasn't opted out and wants to
  /// receive all messages and push notifications.
  final String optOut;

  /// The unique identifier for the most recent request to update the endpoint.
  final String requestId;

  /// One or more custom user attributes that your app reports to Amazon
  /// Pinpoint for the user who's associated with the endpoint.
  final EndpointUser user;

  EndpointResponse({
    this.address,
    this.applicationId,
    this.attributes,
    this.channelType,
    this.cohortId,
    this.creationDate,
    this.demographic,
    this.effectiveDate,
    this.endpointStatus,
    this.id,
    this.location,
    this.metrics,
    this.optOut,
    this.requestId,
    this.user,
  });
  static EndpointResponse fromJson(Map<String, dynamic> json) =>
      EndpointResponse(
        address: json.containsKey('Address') ? json['Address'] as String : null,
        applicationId: json.containsKey('ApplicationId')
            ? json['ApplicationId'] as String
            : null,
        attributes: json.containsKey('Attributes')
            ? (json['Attributes'] as Map).map((k, v) => MapEntry(
                k as String, (v as List).map((e) => e as String).toList()))
            : null,
        channelType: json.containsKey('ChannelType')
            ? json['ChannelType'] as String
            : null,
        cohortId:
            json.containsKey('CohortId') ? json['CohortId'] as String : null,
        creationDate: json.containsKey('CreationDate')
            ? json['CreationDate'] as String
            : null,
        demographic: json.containsKey('Demographic')
            ? EndpointDemographic.fromJson(json['Demographic'])
            : null,
        effectiveDate: json.containsKey('EffectiveDate')
            ? json['EffectiveDate'] as String
            : null,
        endpointStatus: json.containsKey('EndpointStatus')
            ? json['EndpointStatus'] as String
            : null,
        id: json.containsKey('Id') ? json['Id'] as String : null,
        location: json.containsKey('Location')
            ? EndpointLocation.fromJson(json['Location'])
            : null,
        metrics: json.containsKey('Metrics')
            ? (json['Metrics'] as Map)
                .map((k, v) => MapEntry(k as String, v as double))
            : null,
        optOut: json.containsKey('OptOut') ? json['OptOut'] as String : null,
        requestId:
            json.containsKey('RequestId') ? json['RequestId'] as String : null,
        user: json.containsKey('User')
            ? EndpointUser.fromJson(json['User'])
            : null,
      );
}

/// Specifies the content, including message variables and attributes, to use in
/// a message that's sent directly to an endpoint.
class EndpointSendConfiguration {
  /// The body of the message. If specified, this value overrides the default
  /// message body.
  final String bodyOverride;

  /// A map of custom attributes to attach to the message for the address. For a
  /// push notification, this payload is added to the data.pinpoint object. For
  /// an email or text message, this payload is added to email/SMS delivery
  /// receipt event attributes.
  final Map<String, String> context;

  /// The raw, JSON-formatted string to use as the payload for the message. If
  /// specified, this value overrides the message.
  final String rawContent;

  /// A map of the message variables to merge with the variables specified for
  /// the default message (DefaultMessage.Substitutions). The variables
  /// specified in this map take precedence over all other variables.
  final Map<String, List<String>> substitutions;

  /// The title or subject line of the message. If specified, this value
  /// overrides the default message title or subject line.
  final String titleOverride;

  EndpointSendConfiguration({
    this.bodyOverride,
    this.context,
    this.rawContent,
    this.substitutions,
    this.titleOverride,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies data for one or more attributes that describe the user who's
/// associated with an endpoint.
class EndpointUser {
  /// One or more custom attributes that describe the user by associating a name
  /// with an array of values. For example, the value of an attribute named
  /// Interests might be: ["science", "music", "travel"]. You can use these
  /// attributes as filter criteria when you create segments.
  ///
  /// When you define the name of a custom attribute, avoid using the following
  /// characters: number sign (#), colon (:), question mark (?), backslash (),
  /// and slash (/). The Amazon Pinpoint console can't display attribute names
  /// that contain these characters. This limitation doesn't apply to attribute
  /// values.
  final Map<String, List<String>> userAttributes;

  /// The unique identifier for the user.
  final String userId;

  EndpointUser({
    this.userAttributes,
    this.userId,
  });
  static EndpointUser fromJson(Map<String, dynamic> json) => EndpointUser(
        userAttributes: json.containsKey('UserAttributes')
            ? (json['UserAttributes'] as Map).map((k, v) => MapEntry(
                k as String, (v as List).map((e) => e as String).toList()))
            : null,
        userId: json.containsKey('UserId') ? json['UserId'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides information about all the endpoints that are associated with a user
/// ID.
class EndpointsResponse {
  /// An array of responses, one for each endpoint that's associated with the
  /// user ID.
  final List<EndpointResponse> item;

  EndpointsResponse({
    @required this.item,
  });
  static EndpointsResponse fromJson(Map<String, dynamic> json) =>
      EndpointsResponse(
        item: (json['Item'] as List)
            .map((e) => EndpointResponse.fromJson(e))
            .toList(),
      );
}

/// Specifies information about an event that reports data to Amazon Pinpoint.
class Event {
  /// The package name of the app that's recording the event.
  final String appPackageName;

  /// The title of the app that's recording the event.
  final String appTitle;

  /// The version number of the app that's recording the event.
  final String appVersionCode;

  /// One or more custom attributes that are associated with the event.
  final Map<String, String> attributes;

  /// The version of the SDK that's running on the client device.
  final String clientSdkVersion;

  /// The name of the event.
  final String eventType;

  /// One or more custom metrics that are associated with the event.
  final Map<String, double> metrics;

  /// The name of the SDK that's being used to record the event.
  final String sdkName;

  /// Information about the session in which the event occurred.
  final Session session;

  /// The date and time, in ISO 8601 format, when the event occurred.
  final String timestamp;

  Event({
    this.appPackageName,
    this.appTitle,
    this.appVersionCode,
    this.attributes,
    this.clientSdkVersion,
    @required this.eventType,
    this.metrics,
    this.sdkName,
    this.session,
    @required this.timestamp,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies the dimensions for an event filter that determines when a campaign
/// is sent.
class EventDimensions {
  /// One or more custom attributes that your app reports to Amazon Pinpoint.
  /// You can use these attributes as selection criteria when you create an
  /// event filter.
  final Map<String, AttributeDimension> attributes;

  /// The name of the event that causes the campaign to be sent. This can be a
  /// standard type of event that Amazon Pinpoint generates, such as
  /// _session.start, or a custom event that's specific to your app.
  final SetDimension eventType;

  /// One or more custom metrics that your app reports to Amazon Pinpoint. You
  /// can use these metrics as selection criteria when you create an event
  /// filter.
  final Map<String, MetricDimension> metrics;

  EventDimensions({
    this.attributes,
    this.eventType,
    this.metrics,
  });
  static EventDimensions fromJson(Map<String, dynamic> json) => EventDimensions(
        attributes: json.containsKey('Attributes')
            ? (json['Attributes'] as Map).map(
                (k, v) => MapEntry(k as String, AttributeDimension.fromJson(v)))
            : null,
        eventType: json.containsKey('EventType')
            ? SetDimension.fromJson(json['EventType'])
            : null,
        metrics: json.containsKey('Metrics')
            ? (json['Metrics'] as Map).map(
                (k, v) => MapEntry(k as String, MetricDimension.fromJson(v)))
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides the status code and message that result from processing an event.
class EventItemResponse {
  /// A custom message that's returned in the response as a result of processing
  /// the event.
  final String message;

  /// The status code that's returned in the response as a result of processing
  /// the event. Possible values are: 202, for events that were accepted; and,
  /// 400, for events that weren't valid.
  final int statusCode;

  EventItemResponse({
    this.message,
    this.statusCode,
  });
  static EventItemResponse fromJson(Map<String, dynamic> json) =>
      EventItemResponse(
        message: json.containsKey('Message') ? json['Message'] as String : null,
        statusCode:
            json.containsKey('StatusCode') ? json['StatusCode'] as int : null,
      );
}

/// Specifies settings for publishing event data to an Amazon Kinesis data
/// stream or an Amazon Kinesis Data Firehose delivery stream.
class EventStream {
  /// The unique identifier for the application to publish event data for.
  final String applicationId;

  /// The Amazon Resource Name (ARN) of the Amazon Kinesis data stream or Amazon
  /// Kinesis Data Firehose delivery stream to publish event data to.
  ///
  /// For a Kinesis data stream, the ARN format is:
  /// arn:aws:kinesis:region:account-id:stream/stream_name
  ///
  /// For a Kinesis Data Firehose delivery stream, the ARN format is:
  /// arn:aws:firehose:region:account-id:deliverystream/stream_name
  final String destinationStreamArn;

  /// (Deprecated) Your AWS account ID, which you assigned to an external ID key
  /// in an IAM trust policy. Amazon Pinpoint previously used this value to
  /// assume an IAM role when publishing event data, but we removed this
  /// requirement. We don't recommend use of external IDs for IAM roles that are
  /// assumed by Amazon Pinpoint.
  final String externalId;

  /// The date, in ISO 8601 format, when the event stream was last modified.
  final String lastModifiedDate;

  /// The IAM user who last modified the event stream.
  final String lastUpdatedBy;

  /// The AWS Identity and Access Management (IAM) role that authorizes Amazon
  /// Pinpoint to publish event data to the stream in your AWS account.
  final String roleArn;

  EventStream({
    @required this.applicationId,
    @required this.destinationStreamArn,
    this.externalId,
    this.lastModifiedDate,
    this.lastUpdatedBy,
    @required this.roleArn,
  });
  static EventStream fromJson(Map<String, dynamic> json) => EventStream(
        applicationId: json['ApplicationId'] as String,
        destinationStreamArn: json['DestinationStreamArn'] as String,
        externalId: json.containsKey('ExternalId')
            ? json['ExternalId'] as String
            : null,
        lastModifiedDate: json.containsKey('LastModifiedDate')
            ? json['LastModifiedDate'] as String
            : null,
        lastUpdatedBy: json.containsKey('LastUpdatedBy')
            ? json['LastUpdatedBy'] as String
            : null,
        roleArn: json['RoleArn'] as String,
      );
}

/// Specifies a batch of endpoints and events to process.
class EventsBatch {
  /// A set of properties and attributes that are associated with the endpoint.
  final PublicEndpoint endpoint;

  /// A set of properties that are associated with the event.
  final Map<String, Event> events;

  EventsBatch({
    @required this.endpoint,
    @required this.events,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies a batch of events to process.
class EventsRequest {
  /// The batch of events to process. For each item in a batch, the endpoint ID
  /// acts as a key that has an EventsBatch object as its value.
  final Map<String, EventsBatch> batchItem;

  EventsRequest({
    @required this.batchItem,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides information about endpoints and the events that they're associated
/// with.
class EventsResponse {
  /// A map that contains a multipart response for each endpoint. For each item
  /// in this object, the endpoint ID is the key and the item response is the
  /// value. If no item response exists, the value can also be one of the
  /// following: 202, the request was processed successfully; or 400, the
  /// payload wasn't valid or required fields were missing.
  final Map<String, ItemResponse> results;

  EventsResponse({
    this.results,
  });
  static EventsResponse fromJson(Map<String, dynamic> json) => EventsResponse(
        results: json.containsKey('Results')
            ? (json['Results'] as Map)
                .map((k, v) => MapEntry(k as String, ItemResponse.fromJson(v)))
            : null,
      );
}

/// Specifies the settings for a job that exports endpoint definitions to an
/// Amazon Simple Storage Service (Amazon S3) bucket.
class ExportJobRequest {
  /// The Amazon Resource Name (ARN) of the AWS Identity and Access Management
  /// (IAM) role that authorizes Amazon Pinpoint to access the Amazon S3
  /// location where you want to export endpoint definitions to.
  final String roleArn;

  /// The URL of the location in an Amazon Simple Storage Service (Amazon S3)
  /// bucket where you want to export endpoint definitions to. This location is
  /// typically a folder that contains multiple files. The URL should be in the
  /// following format: s3://bucket-name/folder-name/.
  final String s3UrlPrefix;

  /// The identifier for the segment to export endpoint definitions from. If you
  /// don't specify this value, Amazon Pinpoint exports definitions for all the
  /// endpoints that are associated with the application.
  final String segmentId;

  /// The version of the segment to export endpoint definitions from, if
  /// specified.
  final int segmentVersion;

  ExportJobRequest({
    @required this.roleArn,
    @required this.s3UrlPrefix,
    this.segmentId,
    this.segmentVersion,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides information about the resource settings for a job that exports
/// endpoint definitions to a file. The file can be added directly to an Amazon
/// Simple Storage Service (Amazon S3) bucket by using the Amazon Pinpoint API
/// or downloaded directly to a computer by using the Amazon Pinpoint console.
class ExportJobResource {
  /// The Amazon Resource Name (ARN) of the AWS Identity and Access Management
  /// (IAM) role that authorized Amazon Pinpoint to access the Amazon S3
  /// location where the endpoint definitions were exported to.
  final String roleArn;

  /// The URL of the location in an Amazon Simple Storage Service (Amazon S3)
  /// bucket where the endpoint definitions were exported to. This location is
  /// typically a folder that contains multiple files. The URL should be in the
  /// following format: s3://bucket-name/folder-name/.
  final String s3UrlPrefix;

  /// The identifier for the segment that the endpoint definitions were exported
  /// from. If this value isn't present, Amazon Pinpoint exported definitions
  /// for all the endpoints that are associated with the application.
  final String segmentId;

  /// The version of the segment that the endpoint definitions were exported
  /// from.
  final int segmentVersion;

  ExportJobResource({
    @required this.roleArn,
    @required this.s3UrlPrefix,
    this.segmentId,
    this.segmentVersion,
  });
  static ExportJobResource fromJson(Map<String, dynamic> json) =>
      ExportJobResource(
        roleArn: json['RoleArn'] as String,
        s3UrlPrefix: json['S3UrlPrefix'] as String,
        segmentId:
            json.containsKey('SegmentId') ? json['SegmentId'] as String : null,
        segmentVersion: json.containsKey('SegmentVersion')
            ? json['SegmentVersion'] as int
            : null,
      );
}

/// Provides information about the status and settings of a job that exports
/// endpoint definitions to a file. The file can be added directly to an Amazon
/// Simple Storage Service (Amazon S3) bucket by using the Amazon Pinpoint API
/// or downloaded directly to a computer by using the Amazon Pinpoint console.
class ExportJobResponse {
  /// The unique identifier for the application that's associated with the
  /// export job.
  final String applicationId;

  /// The number of pieces that were processed successfully (completed) by the
  /// export job, as of the time of the request.
  final int completedPieces;

  /// The date, in ISO 8601 format, when the export job was completed.
  final String completionDate;

  /// The date, in ISO 8601 format, when the export job was created.
  final String creationDate;

  /// The resource settings that apply to the export job.
  final ExportJobResource definition;

  /// The number of pieces that weren't processed successfully (failed) by the
  /// export job, as of the time of the request.
  final int failedPieces;

  /// An array of entries, one for each of the first 100 entries that weren't
  /// processed successfully (failed) by the export job, if any.
  final List<String> failures;

  /// The unique identifier for the export job.
  final String id;

  /// The status of the export job. The job status is FAILED if Amazon Pinpoint
  /// wasn't able to process one or more pieces in the job.
  final String jobStatus;

  /// The total number of endpoint definitions that weren't processed
  /// successfully (failed) by the export job, typically because an error, such
  /// as a syntax error, occurred.
  final int totalFailures;

  /// The total number of pieces that must be processed to complete the export
  /// job. Each piece consists of an approximately equal portion of the endpoint
  /// definitions that are part of the export job.
  final int totalPieces;

  /// The total number of endpoint definitions that were processed by the export
  /// job.
  final int totalProcessed;

  /// The job type. This value is EXPORT for export jobs.
  final String type;

  ExportJobResponse({
    @required this.applicationId,
    this.completedPieces,
    this.completionDate,
    @required this.creationDate,
    @required this.definition,
    this.failedPieces,
    this.failures,
    @required this.id,
    @required this.jobStatus,
    this.totalFailures,
    this.totalPieces,
    this.totalProcessed,
    @required this.type,
  });
  static ExportJobResponse fromJson(Map<String, dynamic> json) =>
      ExportJobResponse(
        applicationId: json['ApplicationId'] as String,
        completedPieces: json.containsKey('CompletedPieces')
            ? json['CompletedPieces'] as int
            : null,
        completionDate: json.containsKey('CompletionDate')
            ? json['CompletionDate'] as String
            : null,
        creationDate: json['CreationDate'] as String,
        definition: ExportJobResource.fromJson(json['Definition']),
        failedPieces: json.containsKey('FailedPieces')
            ? json['FailedPieces'] as int
            : null,
        failures: json.containsKey('Failures')
            ? (json['Failures'] as List).map((e) => e as String).toList()
            : null,
        id: json['Id'] as String,
        jobStatus: json['JobStatus'] as String,
        totalFailures: json.containsKey('TotalFailures')
            ? json['TotalFailures'] as int
            : null,
        totalPieces:
            json.containsKey('TotalPieces') ? json['TotalPieces'] as int : null,
        totalProcessed: json.containsKey('TotalProcessed')
            ? json['TotalProcessed'] as int
            : null,
        type: json['Type'] as String,
      );
}

/// Provides information about all the export jobs that are associated with an
/// application or segment. An export job is a job that exports endpoint
/// definitions to a file.
class ExportJobsResponse {
  /// An array of responses, one for each export job that's associated with the
  /// application (Export Jobs resource) or segment (Segment Export Jobs
  /// resource).
  final List<ExportJobResponse> item;

  /// The string to use in a subsequent request to get the next page of results
  /// in a paginated response. This value is null if there are no additional
  /// pages.
  final String nextToken;

  ExportJobsResponse({
    @required this.item,
    this.nextToken,
  });
  static ExportJobsResponse fromJson(Map<String, dynamic> json) =>
      ExportJobsResponse(
        item: (json['Item'] as List)
            .map((e) => ExportJobResponse.fromJson(e))
            .toList(),
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// Specifies the status and settings of the GCM channel for an application.
/// This channel enables Amazon Pinpoint to send push notifications through the
/// Firebase Cloud Messaging (FCM), formerly Google Cloud Messaging (GCM),
/// service.
class GcmChannelRequest {
  /// The API key, also referred to as a _server key_, that you received from
  /// Google to communicate with Google services.
  final String apiKey;

  /// Specifies whether to enable the GCM channel for the application.
  final bool enabled;

  GcmChannelRequest({
    @required this.apiKey,
    this.enabled,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides information about the status and settings of the GCM channel for an
/// application. The GCM channel enables Amazon Pinpoint to send push
/// notifications through the Firebase Cloud Messaging (FCM), formerly Google
/// Cloud Messaging (GCM), service.
class GcmChannelResponse {
  /// The unique identifier for the application that the GCM channel applies to.
  final String applicationId;

  /// The date and time when the GCM channel was enabled.
  final String creationDate;

  /// The API key, also referred to as a _server key_, that you received from
  /// Google to communicate with Google services.
  final String credential;

  /// Specifies whether the GCM channel is enabled for the application.
  final bool enabled;

  /// (Not used) This property is retained only for backward compatibility.
  final bool hasCredential;

  /// (Deprecated) An identifier for the GCM channel. This property is retained
  /// only for backward compatibility.
  final String id;

  /// Specifies whether the GCM channel is archived.
  final bool isArchived;

  /// The user who last modified the GCM channel.
  final String lastModifiedBy;

  /// The date and time when the GCM channel was last modified.
  final String lastModifiedDate;

  /// The type of messaging or notification platform for the channel. For the
  /// GCM channel, this value is GCM.
  final String platform;

  /// The current version of the GCM channel.
  final int version;

  GcmChannelResponse({
    this.applicationId,
    this.creationDate,
    @required this.credential,
    this.enabled,
    this.hasCredential,
    this.id,
    this.isArchived,
    this.lastModifiedBy,
    this.lastModifiedDate,
    @required this.platform,
    this.version,
  });
  static GcmChannelResponse fromJson(Map<String, dynamic> json) =>
      GcmChannelResponse(
        applicationId: json.containsKey('ApplicationId')
            ? json['ApplicationId'] as String
            : null,
        creationDate: json.containsKey('CreationDate')
            ? json['CreationDate'] as String
            : null,
        credential: json['Credential'] as String,
        enabled: json.containsKey('Enabled') ? json['Enabled'] as bool : null,
        hasCredential: json.containsKey('HasCredential')
            ? json['HasCredential'] as bool
            : null,
        id: json.containsKey('Id') ? json['Id'] as String : null,
        isArchived:
            json.containsKey('IsArchived') ? json['IsArchived'] as bool : null,
        lastModifiedBy: json.containsKey('LastModifiedBy')
            ? json['LastModifiedBy'] as String
            : null,
        lastModifiedDate: json.containsKey('LastModifiedDate')
            ? json['LastModifiedDate'] as String
            : null,
        platform: json['Platform'] as String,
        version: json.containsKey('Version') ? json['Version'] as int : null,
      );
}

/// Specifies the settings for a one-time message that's sent directly to an
/// endpoint through the GCM channel. The GCM channel enables Amazon Pinpoint to
/// send messages to the Firebase Cloud Messaging (FCM), formerly Google Cloud
/// Messaging (GCM), service.
class GcmMessage {
  /// The action to occur if the recipient taps the push notification. Valid
  /// values are:
  ///
  /// *   OPEN_APP - Your app opens or it becomes the foreground app if it was
  /// sent to the background. This is the default action.
  ///
  /// *   DEEP_LINK - Your app opens and displays a designated user interface in
  /// the app. This action uses the deep-linking features of the Android
  /// platform.
  ///
  /// *   URL - The default mobile browser on the recipient's device opens and
  /// loads the web page at a URL that you specify.
  final String action;

  /// The body of the notification message.
  final String body;

  /// An arbitrary string that identifies a group of messages that can be
  /// collapsed to ensure that only the last message is sent when delivery can
  /// resume. This helps avoid sending too many instances of the same messages
  /// when the recipient's device comes online again or becomes active.
  ///
  /// Amazon Pinpoint specifies this value in the Firebase Cloud Messaging (FCM)
  /// collapse_key parameter when it sends the notification message to FCM.
  final String collapseKey;

  /// The JSON data payload to use for the push notification, if the
  /// notification is a silent push notification. This payload is added to the
  /// data.pinpoint.jsonBody object of the notification.
  final Map<String, String> data;

  /// The icon image name of the asset saved in your app.
  final String iconReference;

  /// The URL of the large icon image to display in the content view of the push
  /// notification.
  final String imageIconUrl;

  /// The URL of an image to display in the push notification.
  final String imageUrl;

  /// para>normal - The notification might be delayed. Delivery is optimized for
  /// battery usage on the recipient's device. Use this value unless immediate
  /// delivery is required.
  ///
  /// /listitem>*   high - The notification is sent immediately and might wake a
  /// sleeping device.
  ///
  /// /para>
  ///
  /// Amazon Pinpoint specifies this value in the FCM priority parameter when it
  /// sends the notification message to FCM.
  ///
  /// The equivalent values for Apple Push Notification service (APNs) are 5,
  /// for normal, and 10, for high. If you specify an APNs value for this
  /// property, Amazon Pinpoint accepts and converts the value to the
  /// corresponding FCM value.
  final String priority;

  /// The raw, JSON-formatted string to use as the payload for the notification
  /// message. This value overrides the message.
  final String rawContent;

  /// The package name of the application where registration tokens must match
  /// in order for the recipient to receive the message.
  final String restrictedPackageName;

  /// Specifies whether the notification is a silent push notification, which is
  /// a push notification that doesn't display on a recipient's device. Silent
  /// push notifications can be used for cases such as updating an app's
  /// configuration or supporting phone home functionality.
  final bool silentPush;

  /// The URL of the small icon image to display in the status bar and the
  /// content view of the push notification.
  final String smallImageIconUrl;

  /// The sound to play when the recipient receives the push notification. You
  /// can use the default stream or specify the file name of a sound resource
  /// that's bundled in your app. On an Android platform, the sound file must
  /// reside in /res/raw/.
  final String sound;

  /// The default message variables to use in the notification message. You can
  /// override the default variables with individual address variables.
  final Map<String, List<String>> substitutions;

  /// The amount of time, in seconds, that FCM should store and attempt to
  /// deliver the push notification, if the service is unable to deliver the
  /// notification the first time. If you don't specify this value, FCM defaults
  /// to the maximum value, which is 2,419,200 seconds (28 days).
  ///
  /// Amazon Pinpoint specifies this value in the FCM time_to_live parameter
  /// when it sends the notification message to FCM.
  final int timeToLive;

  /// The title to display above the notification message on the recipient's
  /// device.
  final String title;

  /// The URL to open in the recipient's default mobile browser, if a recipient
  /// taps the push notification and the value of the Action property is URL.
  final String url;

  GcmMessage({
    this.action,
    this.body,
    this.collapseKey,
    this.data,
    this.iconReference,
    this.imageIconUrl,
    this.imageUrl,
    this.priority,
    this.rawContent,
    this.restrictedPackageName,
    this.silentPush,
    this.smallImageIconUrl,
    this.sound,
    this.substitutions,
    this.timeToLive,
    this.title,
    this.url,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies the GPS coordinates of a location.
class GpsCoordinates {
  /// The latitude coordinate of the location.
  final double latitude;

  /// The longitude coordinate of the location.
  final double longitude;

  GpsCoordinates({
    @required this.latitude,
    @required this.longitude,
  });
  static GpsCoordinates fromJson(Map<String, dynamic> json) => GpsCoordinates(
        latitude: json['Latitude'] as double,
        longitude: json['Longitude'] as double,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies GPS-based criteria for including or excluding endpoints from a
/// segment.
class GpsPointDimension {
  /// The GPS coordinates to measure distance from.
  final GpsCoordinates coordinates;

  /// The range, in kilometers, from the GPS coordinates.
  final double rangeInKilometers;

  GpsPointDimension({
    @required this.coordinates,
    this.rangeInKilometers,
  });
  static GpsPointDimension fromJson(Map<String, dynamic> json) =>
      GpsPointDimension(
        coordinates: GpsCoordinates.fromJson(json['Coordinates']),
        rangeInKilometers: json.containsKey('RangeInKilometers')
            ? json['RangeInKilometers'] as double
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class GetAdmChannelResponse {
  final AdmChannelResponse admChannelResponse;

  GetAdmChannelResponse({
    @required this.admChannelResponse,
  });
  static GetAdmChannelResponse fromJson(Map<String, dynamic> json) =>
      GetAdmChannelResponse(
        admChannelResponse:
            AdmChannelResponse.fromJson(json['ADMChannelResponse']),
      );
}

class GetApnsChannelResponse {
  final ApnsChannelResponse apnsChannelResponse;

  GetApnsChannelResponse({
    @required this.apnsChannelResponse,
  });
  static GetApnsChannelResponse fromJson(Map<String, dynamic> json) =>
      GetApnsChannelResponse(
        apnsChannelResponse:
            ApnsChannelResponse.fromJson(json['APNSChannelResponse']),
      );
}

class GetApnsSandboxChannelResponse {
  final ApnsSandboxChannelResponse apnsSandboxChannelResponse;

  GetApnsSandboxChannelResponse({
    @required this.apnsSandboxChannelResponse,
  });
  static GetApnsSandboxChannelResponse fromJson(Map<String, dynamic> json) =>
      GetApnsSandboxChannelResponse(
        apnsSandboxChannelResponse: ApnsSandboxChannelResponse.fromJson(
            json['APNSSandboxChannelResponse']),
      );
}

class GetApnsVoipChannelResponse {
  final ApnsVoipChannelResponse apnsVoipChannelResponse;

  GetApnsVoipChannelResponse({
    @required this.apnsVoipChannelResponse,
  });
  static GetApnsVoipChannelResponse fromJson(Map<String, dynamic> json) =>
      GetApnsVoipChannelResponse(
        apnsVoipChannelResponse:
            ApnsVoipChannelResponse.fromJson(json['APNSVoipChannelResponse']),
      );
}

class GetApnsVoipSandboxChannelResponse {
  final ApnsVoipSandboxChannelResponse apnsVoipSandboxChannelResponse;

  GetApnsVoipSandboxChannelResponse({
    @required this.apnsVoipSandboxChannelResponse,
  });
  static GetApnsVoipSandboxChannelResponse fromJson(
          Map<String, dynamic> json) =>
      GetApnsVoipSandboxChannelResponse(
        apnsVoipSandboxChannelResponse: ApnsVoipSandboxChannelResponse.fromJson(
            json['APNSVoipSandboxChannelResponse']),
      );
}

class GetAppResponse {
  final ApplicationResponse applicationResponse;

  GetAppResponse({
    @required this.applicationResponse,
  });
  static GetAppResponse fromJson(Map<String, dynamic> json) => GetAppResponse(
        applicationResponse:
            ApplicationResponse.fromJson(json['ApplicationResponse']),
      );
}

class GetApplicationDateRangeKpiResponse {
  final ApplicationDateRangeKpiResponse applicationDateRangeKpiResponse;

  GetApplicationDateRangeKpiResponse({
    @required this.applicationDateRangeKpiResponse,
  });
  static GetApplicationDateRangeKpiResponse fromJson(
          Map<String, dynamic> json) =>
      GetApplicationDateRangeKpiResponse(
        applicationDateRangeKpiResponse:
            ApplicationDateRangeKpiResponse.fromJson(
                json['ApplicationDateRangeKpiResponse']),
      );
}

class GetApplicationSettingsResponse {
  final ApplicationSettingsResource applicationSettingsResource;

  GetApplicationSettingsResponse({
    @required this.applicationSettingsResource,
  });
  static GetApplicationSettingsResponse fromJson(Map<String, dynamic> json) =>
      GetApplicationSettingsResponse(
        applicationSettingsResource: ApplicationSettingsResource.fromJson(
            json['ApplicationSettingsResource']),
      );
}

class GetAppsResponse {
  final ApplicationsResponse applicationsResponse;

  GetAppsResponse({
    @required this.applicationsResponse,
  });
  static GetAppsResponse fromJson(Map<String, dynamic> json) => GetAppsResponse(
        applicationsResponse:
            ApplicationsResponse.fromJson(json['ApplicationsResponse']),
      );
}

class GetBaiduChannelResponse {
  final BaiduChannelResponse baiduChannelResponse;

  GetBaiduChannelResponse({
    @required this.baiduChannelResponse,
  });
  static GetBaiduChannelResponse fromJson(Map<String, dynamic> json) =>
      GetBaiduChannelResponse(
        baiduChannelResponse:
            BaiduChannelResponse.fromJson(json['BaiduChannelResponse']),
      );
}

class GetCampaignActivitiesResponse {
  final ActivitiesResponse activitiesResponse;

  GetCampaignActivitiesResponse({
    @required this.activitiesResponse,
  });
  static GetCampaignActivitiesResponse fromJson(Map<String, dynamic> json) =>
      GetCampaignActivitiesResponse(
        activitiesResponse:
            ActivitiesResponse.fromJson(json['ActivitiesResponse']),
      );
}

class GetCampaignDateRangeKpiResponse {
  final CampaignDateRangeKpiResponse campaignDateRangeKpiResponse;

  GetCampaignDateRangeKpiResponse({
    @required this.campaignDateRangeKpiResponse,
  });
  static GetCampaignDateRangeKpiResponse fromJson(Map<String, dynamic> json) =>
      GetCampaignDateRangeKpiResponse(
        campaignDateRangeKpiResponse: CampaignDateRangeKpiResponse.fromJson(
            json['CampaignDateRangeKpiResponse']),
      );
}

class GetCampaignResponse {
  final CampaignResponse campaignResponse;

  GetCampaignResponse({
    @required this.campaignResponse,
  });
  static GetCampaignResponse fromJson(Map<String, dynamic> json) =>
      GetCampaignResponse(
        campaignResponse: CampaignResponse.fromJson(json['CampaignResponse']),
      );
}

class GetCampaignVersionResponse {
  final CampaignResponse campaignResponse;

  GetCampaignVersionResponse({
    @required this.campaignResponse,
  });
  static GetCampaignVersionResponse fromJson(Map<String, dynamic> json) =>
      GetCampaignVersionResponse(
        campaignResponse: CampaignResponse.fromJson(json['CampaignResponse']),
      );
}

class GetCampaignVersionsResponse {
  final CampaignsResponse campaignsResponse;

  GetCampaignVersionsResponse({
    @required this.campaignsResponse,
  });
  static GetCampaignVersionsResponse fromJson(Map<String, dynamic> json) =>
      GetCampaignVersionsResponse(
        campaignsResponse:
            CampaignsResponse.fromJson(json['CampaignsResponse']),
      );
}

class GetCampaignsResponse {
  final CampaignsResponse campaignsResponse;

  GetCampaignsResponse({
    @required this.campaignsResponse,
  });
  static GetCampaignsResponse fromJson(Map<String, dynamic> json) =>
      GetCampaignsResponse(
        campaignsResponse:
            CampaignsResponse.fromJson(json['CampaignsResponse']),
      );
}

class GetChannelsResponse {
  final ChannelsResponse channelsResponse;

  GetChannelsResponse({
    @required this.channelsResponse,
  });
  static GetChannelsResponse fromJson(Map<String, dynamic> json) =>
      GetChannelsResponse(
        channelsResponse: ChannelsResponse.fromJson(json['ChannelsResponse']),
      );
}

class GetEmailChannelResponse {
  final EmailChannelResponse emailChannelResponse;

  GetEmailChannelResponse({
    @required this.emailChannelResponse,
  });
  static GetEmailChannelResponse fromJson(Map<String, dynamic> json) =>
      GetEmailChannelResponse(
        emailChannelResponse:
            EmailChannelResponse.fromJson(json['EmailChannelResponse']),
      );
}

class GetEndpointResponse {
  final EndpointResponse endpointResponse;

  GetEndpointResponse({
    @required this.endpointResponse,
  });
  static GetEndpointResponse fromJson(Map<String, dynamic> json) =>
      GetEndpointResponse(
        endpointResponse: EndpointResponse.fromJson(json['EndpointResponse']),
      );
}

class GetEventStreamResponse {
  final EventStream eventStream;

  GetEventStreamResponse({
    @required this.eventStream,
  });
  static GetEventStreamResponse fromJson(Map<String, dynamic> json) =>
      GetEventStreamResponse(
        eventStream: EventStream.fromJson(json['EventStream']),
      );
}

class GetExportJobResponse {
  final ExportJobResponse exportJobResponse;

  GetExportJobResponse({
    @required this.exportJobResponse,
  });
  static GetExportJobResponse fromJson(Map<String, dynamic> json) =>
      GetExportJobResponse(
        exportJobResponse:
            ExportJobResponse.fromJson(json['ExportJobResponse']),
      );
}

class GetExportJobsResponse {
  final ExportJobsResponse exportJobsResponse;

  GetExportJobsResponse({
    @required this.exportJobsResponse,
  });
  static GetExportJobsResponse fromJson(Map<String, dynamic> json) =>
      GetExportJobsResponse(
        exportJobsResponse:
            ExportJobsResponse.fromJson(json['ExportJobsResponse']),
      );
}

class GetGcmChannelResponse {
  final GcmChannelResponse gcmChannelResponse;

  GetGcmChannelResponse({
    @required this.gcmChannelResponse,
  });
  static GetGcmChannelResponse fromJson(Map<String, dynamic> json) =>
      GetGcmChannelResponse(
        gcmChannelResponse:
            GcmChannelResponse.fromJson(json['GCMChannelResponse']),
      );
}

class GetImportJobResponse {
  final ImportJobResponse importJobResponse;

  GetImportJobResponse({
    @required this.importJobResponse,
  });
  static GetImportJobResponse fromJson(Map<String, dynamic> json) =>
      GetImportJobResponse(
        importJobResponse:
            ImportJobResponse.fromJson(json['ImportJobResponse']),
      );
}

class GetImportJobsResponse {
  final ImportJobsResponse importJobsResponse;

  GetImportJobsResponse({
    @required this.importJobsResponse,
  });
  static GetImportJobsResponse fromJson(Map<String, dynamic> json) =>
      GetImportJobsResponse(
        importJobsResponse:
            ImportJobsResponse.fromJson(json['ImportJobsResponse']),
      );
}

class GetSegmentExportJobsResponse {
  final ExportJobsResponse exportJobsResponse;

  GetSegmentExportJobsResponse({
    @required this.exportJobsResponse,
  });
  static GetSegmentExportJobsResponse fromJson(Map<String, dynamic> json) =>
      GetSegmentExportJobsResponse(
        exportJobsResponse:
            ExportJobsResponse.fromJson(json['ExportJobsResponse']),
      );
}

class GetSegmentImportJobsResponse {
  final ImportJobsResponse importJobsResponse;

  GetSegmentImportJobsResponse({
    @required this.importJobsResponse,
  });
  static GetSegmentImportJobsResponse fromJson(Map<String, dynamic> json) =>
      GetSegmentImportJobsResponse(
        importJobsResponse:
            ImportJobsResponse.fromJson(json['ImportJobsResponse']),
      );
}

class GetSegmentResponse {
  final SegmentResponse segmentResponse;

  GetSegmentResponse({
    @required this.segmentResponse,
  });
  static GetSegmentResponse fromJson(Map<String, dynamic> json) =>
      GetSegmentResponse(
        segmentResponse: SegmentResponse.fromJson(json['SegmentResponse']),
      );
}

class GetSegmentVersionResponse {
  final SegmentResponse segmentResponse;

  GetSegmentVersionResponse({
    @required this.segmentResponse,
  });
  static GetSegmentVersionResponse fromJson(Map<String, dynamic> json) =>
      GetSegmentVersionResponse(
        segmentResponse: SegmentResponse.fromJson(json['SegmentResponse']),
      );
}

class GetSegmentVersionsResponse {
  final SegmentsResponse segmentsResponse;

  GetSegmentVersionsResponse({
    @required this.segmentsResponse,
  });
  static GetSegmentVersionsResponse fromJson(Map<String, dynamic> json) =>
      GetSegmentVersionsResponse(
        segmentsResponse: SegmentsResponse.fromJson(json['SegmentsResponse']),
      );
}

class GetSegmentsResponse {
  final SegmentsResponse segmentsResponse;

  GetSegmentsResponse({
    @required this.segmentsResponse,
  });
  static GetSegmentsResponse fromJson(Map<String, dynamic> json) =>
      GetSegmentsResponse(
        segmentsResponse: SegmentsResponse.fromJson(json['SegmentsResponse']),
      );
}

class GetSmsChannelResponse {
  final SmsChannelResponse smsChannelResponse;

  GetSmsChannelResponse({
    @required this.smsChannelResponse,
  });
  static GetSmsChannelResponse fromJson(Map<String, dynamic> json) =>
      GetSmsChannelResponse(
        smsChannelResponse:
            SmsChannelResponse.fromJson(json['SMSChannelResponse']),
      );
}

class GetUserEndpointsResponse {
  final EndpointsResponse endpointsResponse;

  GetUserEndpointsResponse({
    @required this.endpointsResponse,
  });
  static GetUserEndpointsResponse fromJson(Map<String, dynamic> json) =>
      GetUserEndpointsResponse(
        endpointsResponse:
            EndpointsResponse.fromJson(json['EndpointsResponse']),
      );
}

class GetVoiceChannelResponse {
  final VoiceChannelResponse voiceChannelResponse;

  GetVoiceChannelResponse({
    @required this.voiceChannelResponse,
  });
  static GetVoiceChannelResponse fromJson(Map<String, dynamic> json) =>
      GetVoiceChannelResponse(
        voiceChannelResponse:
            VoiceChannelResponse.fromJson(json['VoiceChannelResponse']),
      );
}

/// Specifies the settings for a job that imports endpoint definitions from an
/// Amazon Simple Storage Service (Amazon S3) bucket.
class ImportJobRequest {
  /// Specifies whether to create a segment that contains the endpoints, when
  /// the endpoint definitions are imported.
  final bool defineSegment;

  /// (Deprecated) Your AWS account ID, which you assigned to an external ID key
  /// in an IAM trust policy. Amazon Pinpoint previously used this value to
  /// assume an IAM role when importing endpoint definitions, but we removed
  /// this requirement. We don't recommend use of external IDs for IAM roles
  /// that are assumed by Amazon Pinpoint.
  final String externalId;

  /// The format of the files that contain the endpoint definitions to import.
  /// Valid values are: CSV, for comma-separated values format; and, JSON, for
  /// newline-delimited JSON format. If the Amazon S3 location stores multiple
  /// files that use different formats, Amazon Pinpoint imports data only from
  /// the files that use the specified format.
  final String format;

  /// Specifies whether to register the endpoints with Amazon Pinpoint, when the
  /// endpoint definitions are imported.
  final bool registerEndpoints;

  /// The Amazon Resource Name (ARN) of the AWS Identity and Access Management
  /// (IAM) role that authorizes Amazon Pinpoint to access the Amazon S3
  /// location to import endpoint definitions from.
  final String roleArn;

  /// The URL of the Amazon Simple Storage Service (Amazon S3) bucket that
  /// contains the endpoint definitions to import. This location can be a folder
  /// or a single file. If the location is a folder, Amazon Pinpoint imports
  /// endpoint definitions from the files in this location, including any
  /// subfolders that the folder contains.
  ///
  /// The URL should be in the following format:
  /// s3://bucket-name/folder-name/file-name. The location can end with the key
  /// for an individual object or a prefix that qualifies multiple objects.
  final String s3Url;

  /// The identifier for the segment to update or add the imported endpoint
  /// definitions to, if the import job is meant to update an existing segment.
  final String segmentId;

  /// The custom name for the segment that's created by the import job, if the
  /// value of the DefineSegment property is true.
  final String segmentName;

  ImportJobRequest({
    this.defineSegment,
    this.externalId,
    @required this.format,
    this.registerEndpoints,
    @required this.roleArn,
    @required this.s3Url,
    this.segmentId,
    this.segmentName,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides information about the resource settings for a job that imports
/// endpoint definitions from one or more files. The files can be stored in an
/// Amazon Simple Storage Service (Amazon S3) bucket or uploaded directly from a
/// computer by using the Amazon Pinpoint console.
class ImportJobResource {
  /// Specifies whether the import job creates a segment that contains the
  /// endpoints, when the endpoint definitions are imported.
  final bool defineSegment;

  /// (Deprecated) Your AWS account ID, which you assigned to an external ID key
  /// in an IAM trust policy. Amazon Pinpoint previously used this value to
  /// assume an IAM role when importing endpoint definitions, but we removed
  /// this requirement. We don't recommend use of external IDs for IAM roles
  /// that are assumed by Amazon Pinpoint.
  final String externalId;

  /// The format of the files that contain the endpoint definitions to import.
  /// Valid values are: CSV, for comma-separated values format; and, JSON, for
  /// newline-delimited JSON format.
  ///
  /// If the files are stored in an Amazon S3 location and that location
  /// contains multiple files that use different formats, Amazon Pinpoint
  /// imports data only from the files that use the specified format.
  final String format;

  /// Specifies whether the import job registers the endpoints with Amazon
  /// Pinpoint, when the endpoint definitions are imported.
  final bool registerEndpoints;

  /// The Amazon Resource Name (ARN) of the AWS Identity and Access Management
  /// (IAM) role that authorizes Amazon Pinpoint to access the Amazon S3
  /// location to import endpoint definitions from.
  final String roleArn;

  /// The URL of the Amazon Simple Storage Service (Amazon S3) bucket that
  /// contains the endpoint definitions to import. This location can be a folder
  /// or a single file. If the location is a folder, Amazon Pinpoint imports
  /// endpoint definitions from the files in this location, including any
  /// subfolders that the folder contains.
  ///
  /// The URL should be in the following format:
  /// s3://bucket-name/folder-name/file-name. The location can end with the key
  /// for an individual object or a prefix that qualifies multiple objects.
  final String s3Url;

  /// The identifier for the segment that the import job updates or adds
  /// endpoint definitions to, if the import job updates an existing segment.
  final String segmentId;

  /// The custom name for the segment that's created by the import job, if the
  /// value of the DefineSegment property is true.
  final String segmentName;

  ImportJobResource({
    this.defineSegment,
    this.externalId,
    @required this.format,
    this.registerEndpoints,
    @required this.roleArn,
    @required this.s3Url,
    this.segmentId,
    this.segmentName,
  });
  static ImportJobResource fromJson(Map<String, dynamic> json) =>
      ImportJobResource(
        defineSegment: json.containsKey('DefineSegment')
            ? json['DefineSegment'] as bool
            : null,
        externalId: json.containsKey('ExternalId')
            ? json['ExternalId'] as String
            : null,
        format: json['Format'] as String,
        registerEndpoints: json.containsKey('RegisterEndpoints')
            ? json['RegisterEndpoints'] as bool
            : null,
        roleArn: json['RoleArn'] as String,
        s3Url: json['S3Url'] as String,
        segmentId:
            json.containsKey('SegmentId') ? json['SegmentId'] as String : null,
        segmentName: json.containsKey('SegmentName')
            ? json['SegmentName'] as String
            : null,
      );
}

/// Provides information about the status and settings of a job that imports
/// endpoint definitions from one or more files. The files can be stored in an
/// Amazon Simple Storage Service (Amazon S3) bucket or uploaded directly from a
/// computer by using the Amazon Pinpoint console.
class ImportJobResponse {
  /// The unique identifier for the application that's associated with the
  /// import job.
  final String applicationId;

  /// The number of pieces that were processed successfully (completed) by the
  /// import job, as of the time of the request.
  final int completedPieces;

  /// The date, in ISO 8601 format, when the import job was completed.
  final String completionDate;

  /// The date, in ISO 8601 format, when the import job was created.
  final String creationDate;

  /// The resource settings that apply to the import job.
  final ImportJobResource definition;

  /// The number of pieces that weren't processed successfully (failed) by the
  /// import job, as of the time of the request.
  final int failedPieces;

  /// An array of entries, one for each of the first 100 entries that weren't
  /// processed successfully (failed) by the import job, if any.
  final List<String> failures;

  /// The unique identifier for the import job.
  final String id;

  /// The status of the import job. The job status is FAILED if Amazon Pinpoint
  /// wasn't able to process one or more pieces in the job.
  final String jobStatus;

  /// The total number of endpoint definitions that weren't processed
  /// successfully (failed) by the import job, typically because an error, such
  /// as a syntax error, occurred.
  final int totalFailures;

  /// The total number of pieces that must be processed to complete the import
  /// job. Each piece consists of an approximately equal portion of the endpoint
  /// definitions that are part of the import job.
  final int totalPieces;

  /// The total number of endpoint definitions that were processed by the import
  /// job.
  final int totalProcessed;

  /// The job type. This value is IMPORT for import jobs.
  final String type;

  ImportJobResponse({
    @required this.applicationId,
    this.completedPieces,
    this.completionDate,
    @required this.creationDate,
    @required this.definition,
    this.failedPieces,
    this.failures,
    @required this.id,
    @required this.jobStatus,
    this.totalFailures,
    this.totalPieces,
    this.totalProcessed,
    @required this.type,
  });
  static ImportJobResponse fromJson(Map<String, dynamic> json) =>
      ImportJobResponse(
        applicationId: json['ApplicationId'] as String,
        completedPieces: json.containsKey('CompletedPieces')
            ? json['CompletedPieces'] as int
            : null,
        completionDate: json.containsKey('CompletionDate')
            ? json['CompletionDate'] as String
            : null,
        creationDate: json['CreationDate'] as String,
        definition: ImportJobResource.fromJson(json['Definition']),
        failedPieces: json.containsKey('FailedPieces')
            ? json['FailedPieces'] as int
            : null,
        failures: json.containsKey('Failures')
            ? (json['Failures'] as List).map((e) => e as String).toList()
            : null,
        id: json['Id'] as String,
        jobStatus: json['JobStatus'] as String,
        totalFailures: json.containsKey('TotalFailures')
            ? json['TotalFailures'] as int
            : null,
        totalPieces:
            json.containsKey('TotalPieces') ? json['TotalPieces'] as int : null,
        totalProcessed: json.containsKey('TotalProcessed')
            ? json['TotalProcessed'] as int
            : null,
        type: json['Type'] as String,
      );
}

/// Provides information about the status and settings of all the import jobs
/// that are associated with an application or segment. An import job is a job
/// that imports endpoint definitions from one or more files.
class ImportJobsResponse {
  /// An array of responses, one for each import job that's associated with the
  /// application (Import Jobs resource) or segment (Segment Import Jobs
  /// resource).
  final List<ImportJobResponse> item;

  /// The string to use in a subsequent request to get the next page of results
  /// in a paginated response. This value is null if there are no additional
  /// pages.
  final String nextToken;

  ImportJobsResponse({
    @required this.item,
    this.nextToken,
  });
  static ImportJobsResponse fromJson(Map<String, dynamic> json) =>
      ImportJobsResponse(
        item: (json['Item'] as List)
            .map((e) => ImportJobResponse.fromJson(e))
            .toList(),
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// Provides information about the results of a request to create or update an
/// endpoint that's associated with an event.
class ItemResponse {
  /// The response that was received after the endpoint data was accepted.
  final EndpointItemResponse endpointItemResponse;

  /// A multipart response object that contains a key and a value for each event
  /// in the request. In each object, the event ID is the key and an
  /// EventItemResponse object is the value.
  final Map<String, EventItemResponse> eventsItemResponse;

  ItemResponse({
    this.endpointItemResponse,
    this.eventsItemResponse,
  });
  static ItemResponse fromJson(Map<String, dynamic> json) => ItemResponse(
        endpointItemResponse: json.containsKey('EndpointItemResponse')
            ? EndpointItemResponse.fromJson(json['EndpointItemResponse'])
            : null,
        eventsItemResponse: json.containsKey('EventsItemResponse')
            ? (json['EventsItemResponse'] as Map).map(
                (k, v) => MapEntry(k as String, EventItemResponse.fromJson(v)))
            : null,
      );
}

class ListTagsForResourceResponse {
  final TagsModel tagsModel;

  ListTagsForResourceResponse({
    @required this.tagsModel,
  });
  static ListTagsForResourceResponse fromJson(Map<String, dynamic> json) =>
      ListTagsForResourceResponse(
        tagsModel: TagsModel.fromJson(json['TagsModel']),
      );
}

/// Specifies the content and settings for a push notification that's sent to
/// recipients of a campaign.
class Message {
  /// The action to occur if a recipient taps the push notification. Valid
  /// values are:
  ///
  /// *   OPEN_APP - Your app opens or it becomes the foreground app if it was
  /// sent to the background. This is the default action.
  ///
  /// *   DEEP_LINK - Your app opens and displays a designated user interface in
  /// the app. This setting uses the deep-linking features of iOS and Android.
  ///
  /// *   URL - The default mobile browser on the recipient's device opens and
  /// loads the web page at a URL that you specify.
  final String action;

  /// The body of the notification message. The maximum number of characters is
  /// 200.
  final String body;

  /// The URL of the image to display as the push-notification icon, such as the
  /// icon for the app.
  final String imageIconUrl;

  /// The URL of the image to display as the small, push-notification icon, such
  /// as a small version of the icon for the app.
  final String imageSmallIconUrl;

  /// The URL of an image to display in the push notification.
  final String imageUrl;

  /// The JSON payload to use for a silent push notification.
  final String jsonBody;

  /// The URL of the image or video to display in the push notification.
  final String mediaUrl;

  /// The raw, JSON-formatted string to use as the payload for the notification
  /// message. This value overrides other values for the message.
  final String rawContent;

  /// Specifies whether the notification is a silent push notification, which is
  /// a push notification that doesn't display on a recipient's device. Silent
  /// push notifications can be used for cases such as updating an app's
  /// configuration, displaying messages in an in-app message center, or
  /// supporting phone home functionality.
  final bool silentPush;

  /// The number of seconds that the push-notification service should keep the
  /// message, if the service is unable to deliver the notification the first
  /// time. This value is converted to an expiration value when it's sent to a
  /// push-notification service. If this value is 0, the service treats the
  /// notification as if it expires immediately and the service doesn't store or
  /// try to deliver the notification again.
  ///
  /// This value doesn't apply to messages that are sent through the Amazon
  /// Device Messaging (ADM) service.
  final int timeToLive;

  /// The title to display above the notification message on a recipient's
  /// device.
  final String title;

  /// The URL to open in a recipient's default mobile browser, if a recipient
  /// taps the push notification and the value of the Action property is URL.
  final String url;

  Message({
    this.action,
    this.body,
    this.imageIconUrl,
    this.imageSmallIconUrl,
    this.imageUrl,
    this.jsonBody,
    this.mediaUrl,
    this.rawContent,
    this.silentPush,
    this.timeToLive,
    this.title,
    this.url,
  });
  static Message fromJson(Map<String, dynamic> json) => Message(
        action: json.containsKey('Action') ? json['Action'] as String : null,
        body: json.containsKey('Body') ? json['Body'] as String : null,
        imageIconUrl: json.containsKey('ImageIconUrl')
            ? json['ImageIconUrl'] as String
            : null,
        imageSmallIconUrl: json.containsKey('ImageSmallIconUrl')
            ? json['ImageSmallIconUrl'] as String
            : null,
        imageUrl:
            json.containsKey('ImageUrl') ? json['ImageUrl'] as String : null,
        jsonBody:
            json.containsKey('JsonBody') ? json['JsonBody'] as String : null,
        mediaUrl:
            json.containsKey('MediaUrl') ? json['MediaUrl'] as String : null,
        rawContent: json.containsKey('RawContent')
            ? json['RawContent'] as String
            : null,
        silentPush:
            json.containsKey('SilentPush') ? json['SilentPush'] as bool : null,
        timeToLive:
            json.containsKey('TimeToLive') ? json['TimeToLive'] as int : null,
        title: json.containsKey('Title') ? json['Title'] as String : null,
        url: json.containsKey('Url') ? json['Url'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides information about an API request or response.
class MessageBody {
  /// The message that's returned from the API.
  final String message;

  /// The unique identifier for the request or response.
  final String requestID;

  MessageBody({
    this.message,
    this.requestID,
  });
  static MessageBody fromJson(Map<String, dynamic> json) => MessageBody(
        message: json.containsKey('Message') ? json['Message'] as String : null,
        requestID:
            json.containsKey('RequestID') ? json['RequestID'] as String : null,
      );
}

/// Specifies the message configuration settings for a campaign.
class MessageConfiguration {
  /// The message that the campaign sends through the ADM (Amazon Device
  /// Messaging) channel. This message overrides the default message.
  final Message admMessage;

  /// The message that the campaign sends through the APNs (Apple Push
  /// Notification service) channel. This message overrides the default message.
  final Message apnsMessage;

  /// The message that the campaign sends through the Baidu (Baidu Cloud Push)
  /// channel. This message overrides the default message.
  final Message baiduMessage;

  /// The default message that the campaign sends through all the channels that
  /// are configured for the campaign.
  final Message defaultMessage;

  /// The message that the campaign sends through the email channel.
  final CampaignEmailMessage emailMessage;

  /// The message that the campaign sends through the GCM channel, which enables
  /// Amazon Pinpoint to send push notifications through the Firebase Cloud
  /// Messaging (FCM), formerly Google Cloud Messaging (GCM), service. This
  /// message overrides the default message.
  final Message gcmMessage;

  /// The message that the campaign sends through the SMS channel.
  final CampaignSmsMessage smsMessage;

  MessageConfiguration({
    this.admMessage,
    this.apnsMessage,
    this.baiduMessage,
    this.defaultMessage,
    this.emailMessage,
    this.gcmMessage,
    this.smsMessage,
  });
  static MessageConfiguration fromJson(Map<String, dynamic> json) =>
      MessageConfiguration(
        admMessage: json.containsKey('ADMMessage')
            ? Message.fromJson(json['ADMMessage'])
            : null,
        apnsMessage: json.containsKey('APNSMessage')
            ? Message.fromJson(json['APNSMessage'])
            : null,
        baiduMessage: json.containsKey('BaiduMessage')
            ? Message.fromJson(json['BaiduMessage'])
            : null,
        defaultMessage: json.containsKey('DefaultMessage')
            ? Message.fromJson(json['DefaultMessage'])
            : null,
        emailMessage: json.containsKey('EmailMessage')
            ? CampaignEmailMessage.fromJson(json['EmailMessage'])
            : null,
        gcmMessage: json.containsKey('GCMMessage')
            ? Message.fromJson(json['GCMMessage'])
            : null,
        smsMessage: json.containsKey('SMSMessage')
            ? CampaignSmsMessage.fromJson(json['SMSMessage'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies the objects that define configuration and other settings for a
/// message.
class MessageRequest {
  /// A map of key-value pairs, where each key is an address and each value is
  /// an AddressConfiguration object. An address can be a push notification
  /// token, a phone number, or an email address. You can use an
  /// AddressConfiguration object to tailor the message for an address by
  /// specifying settings such as content overrides and message variables.
  final Map<String, AddressConfiguration> addresses;

  /// A map of custom attributes to attach to the message. For a push
  /// notification, this payload is added to the data.pinpoint object. For an
  /// email or text message, this payload is added to email/SMS delivery receipt
  /// event attributes.
  final Map<String, String> context;

  /// A map of key-value pairs, where each key is an endpoint ID and each value
  /// is an EndpointSendConfiguration object. You can use an
  /// EndpointSendConfiguration object to tailor the message for an endpoint by
  /// specifying settings such as content overrides and message variables.
  final Map<String, EndpointSendConfiguration> endpoints;

  /// The set of properties that defines the configuration settings for the
  /// message.
  final DirectMessageConfiguration messageConfiguration;

  /// The unique identifier for tracing the message. This identifier is visible
  /// to message recipients.
  final String traceId;

  MessageRequest({
    this.addresses,
    this.context,
    this.endpoints,
    @required this.messageConfiguration,
    this.traceId,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides information about the results of a request to send a message to an
/// endpoint address.
class MessageResponse {
  /// The unique identifier for the application that was used to send the
  /// message.
  final String applicationId;

  /// A map that contains a multipart response for each address that the message
  /// was sent to. In the map, the endpoint ID is the key and the result is the
  /// value.
  final Map<String, EndpointMessageResult> endpointResult;

  /// The identifier for the original request that the message was delivered
  /// for.
  final String requestId;

  /// A map that contains a multipart response for each address (email address,
  /// phone number, or push notification token) that the message was sent to. In
  /// the map, the address is the key and the result is the value.
  final Map<String, MessageResult> result;

  MessageResponse({
    @required this.applicationId,
    this.endpointResult,
    this.requestId,
    this.result,
  });
  static MessageResponse fromJson(Map<String, dynamic> json) => MessageResponse(
        applicationId: json['ApplicationId'] as String,
        endpointResult: json.containsKey('EndpointResult')
            ? (json['EndpointResult'] as Map).map((k, v) =>
                MapEntry(k as String, EndpointMessageResult.fromJson(v)))
            : null,
        requestId:
            json.containsKey('RequestId') ? json['RequestId'] as String : null,
        result: json.containsKey('Result')
            ? (json['Result'] as Map)
                .map((k, v) => MapEntry(k as String, MessageResult.fromJson(v)))
            : null,
      );
}

/// Provides information about the results of sending a message directly to an
/// endpoint address.
class MessageResult {
  /// The delivery status of the message. Possible values are:
  ///
  /// *   DUPLICATE - The endpoint address is a duplicate of another endpoint
  /// address. Amazon Pinpoint won't attempt to send the message again.
  ///
  /// *   OPT_OUT - The user who's associated with the endpoint address has
  /// opted out of receiving messages from you. Amazon Pinpoint won't attempt to
  /// send the message again.
  ///
  /// *   PERMANENT_FAILURE - An error occurred when delivering the message to
  /// the endpoint address. Amazon Pinpoint won't attempt to send the message
  /// again.
  ///
  /// *   SUCCESSFUL - The message was successfully delivered to the endpoint
  /// address.
  ///
  /// *   TEMPORARY_FAILURE - A temporary error occurred. Amazon Pinpoint will
  /// attempt to deliver the message again later.
  ///
  /// *   THROTTLED - Amazon Pinpoint throttled the operation to send the
  /// message to the endpoint address.
  ///
  /// *   TIMEOUT - The message couldn't be sent within the timeout period.
  ///
  /// *   UNKNOWN_FAILURE - An unknown error occurred.
  final String deliveryStatus;

  /// The unique identifier for the message that was sent.
  final String messageId;

  /// The downstream service status code for delivering the message.
  final int statusCode;

  /// The status message for delivering the message.
  final String statusMessage;

  /// For push notifications that are sent through the GCM channel, specifies
  /// whether the token was updated as part of delivering the message.
  final String updatedToken;

  MessageResult({
    @required this.deliveryStatus,
    this.messageId,
    @required this.statusCode,
    this.statusMessage,
    this.updatedToken,
  });
  static MessageResult fromJson(Map<String, dynamic> json) => MessageResult(
        deliveryStatus: json['DeliveryStatus'] as String,
        messageId:
            json.containsKey('MessageId') ? json['MessageId'] as String : null,
        statusCode: json['StatusCode'] as int,
        statusMessage: json.containsKey('StatusMessage')
            ? json['StatusMessage'] as String
            : null,
        updatedToken: json.containsKey('UpdatedToken')
            ? json['UpdatedToken'] as String
            : null,
      );
}

/// Specifies metric-based criteria for including or excluding endpoints from a
/// segment. These criteria derive from custom metrics that you define for
/// endpoints.
class MetricDimension {
  /// The operator to use when comparing metric values. Valid values are:
  /// GREATER_THAN, LESS_THAN, GREATER_THAN_OR_EQUAL, LESS_THAN_OR_EQUAL, and
  /// EQUAL.
  final String comparisonOperator;

  /// The value to compare.
  final double value;

  MetricDimension({
    @required this.comparisonOperator,
    @required this.value,
  });
  static MetricDimension fromJson(Map<String, dynamic> json) => MetricDimension(
        comparisonOperator: json['ComparisonOperator'] as String,
        value: json['Value'] as double,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies a phone number to validate and retrieve information about.
class NumberValidateRequest {
  /// The two-character code, in ISO 3166-1 alpha-2 format, for the country or
  /// region where the phone number was originally registered.
  final String isoCountryCode;

  /// The phone number to retrieve information about. The phone number that you
  /// provide should include a valid numeric country code. Otherwise, the
  /// operation might result in an error.
  final String phoneNumber;

  NumberValidateRequest({
    this.isoCountryCode,
    this.phoneNumber,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides information about a phone number.
class NumberValidateResponse {
  /// The carrier or service provider that the phone number is currently
  /// registered with. In some countries and regions, this value may be the
  /// carrier or service provider that the phone number was originally
  /// registered with.
  final String carrier;

  /// The name of the city where the phone number was originally registered.
  final String city;

  /// The cleansed phone number, in E.164 format, for the location where the
  /// phone number was originally registered.
  final String cleansedPhoneNumberE164;

  /// The cleansed phone number, in the format for the location where the phone
  /// number was originally registered.
  final String cleansedPhoneNumberNational;

  /// The name of the country or region where the phone number was originally
  /// registered.
  final String country;

  /// The two-character code, in ISO 3166-1 alpha-2 format, for the country or
  /// region where the phone number was originally registered.
  final String countryCodeIso2;

  /// The numeric code for the country or region where the phone number was
  /// originally registered.
  final String countryCodeNumeric;

  /// The name of the county where the phone number was originally registered.
  final String county;

  /// The two-character code, in ISO 3166-1 alpha-2 format, that was sent in the
  /// request body.
  final String originalCountryCodeIso2;

  /// The phone number that was sent in the request body.
  final String originalPhoneNumber;

  /// The description of the phone type. Valid values are: MOBILE, LANDLINE,
  /// VOIP, INVALID, PREPAID, and OTHER.
  final String phoneType;

  /// The phone type, represented by an integer. Valid values are: 0 (mobile), 1
  /// (landline), 2 (VoIP), 3 (invalid), 4 (other), and 5 (prepaid).
  final int phoneTypeCode;

  /// The time zone for the location where the phone number was originally
  /// registered.
  final String timezone;

  /// The postal or ZIP code for the location where the phone number was
  /// originally registered.
  final String zipCode;

  NumberValidateResponse({
    this.carrier,
    this.city,
    this.cleansedPhoneNumberE164,
    this.cleansedPhoneNumberNational,
    this.country,
    this.countryCodeIso2,
    this.countryCodeNumeric,
    this.county,
    this.originalCountryCodeIso2,
    this.originalPhoneNumber,
    this.phoneType,
    this.phoneTypeCode,
    this.timezone,
    this.zipCode,
  });
  static NumberValidateResponse fromJson(Map<String, dynamic> json) =>
      NumberValidateResponse(
        carrier: json.containsKey('Carrier') ? json['Carrier'] as String : null,
        city: json.containsKey('City') ? json['City'] as String : null,
        cleansedPhoneNumberE164: json.containsKey('CleansedPhoneNumberE164')
            ? json['CleansedPhoneNumberE164'] as String
            : null,
        cleansedPhoneNumberNational:
            json.containsKey('CleansedPhoneNumberNational')
                ? json['CleansedPhoneNumberNational'] as String
                : null,
        country: json.containsKey('Country') ? json['Country'] as String : null,
        countryCodeIso2: json.containsKey('CountryCodeIso2')
            ? json['CountryCodeIso2'] as String
            : null,
        countryCodeNumeric: json.containsKey('CountryCodeNumeric')
            ? json['CountryCodeNumeric'] as String
            : null,
        county: json.containsKey('County') ? json['County'] as String : null,
        originalCountryCodeIso2: json.containsKey('OriginalCountryCodeIso2')
            ? json['OriginalCountryCodeIso2'] as String
            : null,
        originalPhoneNumber: json.containsKey('OriginalPhoneNumber')
            ? json['OriginalPhoneNumber'] as String
            : null,
        phoneType:
            json.containsKey('PhoneType') ? json['PhoneType'] as String : null,
        phoneTypeCode: json.containsKey('PhoneTypeCode')
            ? json['PhoneTypeCode'] as int
            : null,
        timezone:
            json.containsKey('Timezone') ? json['Timezone'] as String : null,
        zipCode: json.containsKey('ZipCode') ? json['ZipCode'] as String : null,
      );
}

class PhoneNumberValidateResponse {
  final NumberValidateResponse numberValidateResponse;

  PhoneNumberValidateResponse({
    @required this.numberValidateResponse,
  });
  static PhoneNumberValidateResponse fromJson(Map<String, dynamic> json) =>
      PhoneNumberValidateResponse(
        numberValidateResponse:
            NumberValidateResponse.fromJson(json['NumberValidateResponse']),
      );
}

/// Specifies the properties and attributes of an endpoint that's associated
/// with an event.
class PublicEndpoint {
  /// The unique identifier for the recipient, such as a device token, email
  /// address, or mobile phone number.
  final String address;

  /// One or more custom attributes that describe the endpoint by associating a
  /// name with an array of values. You can use these attributes as filter
  /// criteria when you create segments.
  final Map<String, List<String>> attributes;

  /// The channel that's used when sending messages or push notifications to the
  /// endpoint.
  final String channelType;

  /// The demographic information for the endpoint, such as the time zone and
  /// platform.
  final EndpointDemographic demographic;

  /// The date and time, in ISO 8601 format, when the endpoint was last updated.
  final String effectiveDate;

  /// The status of the update request for the endpoint. Possible values are:
  /// INACTIVE, the update failed; and, ACTIVE, the endpoint was updated
  /// successfully.
  final String endpointStatus;

  /// The geographic information for the endpoint.
  final EndpointLocation location;

  /// One or more custom metrics that your app reports to Amazon Pinpoint for
  /// the endpoint.
  final Map<String, double> metrics;

  /// Specifies whether the user who's associated with the endpoint has opted
  /// out of receiving messages and push notifications from you. Possible values
  /// are: ALL, the user has opted out and doesn't want to receive any messages
  /// or push notifications; and, NONE, the user hasn't opted out and wants to
  /// receive all messages and push notifications.
  final String optOut;

  /// A unique identifier that's generated each time the endpoint is updated.
  final String requestId;

  /// One or more custom user attributes that your app reports to Amazon
  /// Pinpoint for the user who's associated with the endpoint.
  final EndpointUser user;

  PublicEndpoint({
    this.address,
    this.attributes,
    this.channelType,
    this.demographic,
    this.effectiveDate,
    this.endpointStatus,
    this.location,
    this.metrics,
    this.optOut,
    this.requestId,
    this.user,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class PutEventStreamResponse {
  final EventStream eventStream;

  PutEventStreamResponse({
    @required this.eventStream,
  });
  static PutEventStreamResponse fromJson(Map<String, dynamic> json) =>
      PutEventStreamResponse(
        eventStream: EventStream.fromJson(json['EventStream']),
      );
}

class PutEventsResponse {
  final EventsResponse eventsResponse;

  PutEventsResponse({
    @required this.eventsResponse,
  });
  static PutEventsResponse fromJson(Map<String, dynamic> json) =>
      PutEventsResponse(
        eventsResponse: EventsResponse.fromJson(json['EventsResponse']),
      );
}

/// Specifies the start and end times that define a time range when messages
/// aren't sent to endpoints.
class QuietTime {
  /// The specific time when quiet time ends. This value has to use 24-hour
  /// notation and be in HH:MM format, where HH is the hour (with a leading
  /// zero, if applicable) and MM is the minutes. For example, use 02:30 to
  /// represent 2:30 AM, or 14:30 to represent 2:30 PM.
  final String end;

  /// The specific time when quiet time begins. This value has to use 24-hour
  /// notation and be in HH:MM format, where HH is the hour (with a leading
  /// zero, if applicable) and MM is the minutes. For example, use 02:30 to
  /// represent 2:30 AM, or 14:30 to represent 2:30 PM.
  final String start;

  QuietTime({
    this.end,
    this.start,
  });
  static QuietTime fromJson(Map<String, dynamic> json) => QuietTime(
        end: json.containsKey('End') ? json['End'] as String : null,
        start: json.containsKey('Start') ? json['Start'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies the contents of an email message, represented as a raw MIME
/// message.
class RawEmail {
  /// The email message, represented as a raw MIME message. The entire message
  /// must be base64 encoded.
  final Uint8List data;

  RawEmail({
    this.data,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies criteria for including or excluding endpoints from a segment based
/// on how recently an endpoint was active.
class RecencyDimension {
  /// The duration to use when determining whether an endpoint is active or
  /// inactive.
  final String duration;

  /// The type of recency dimension to use for the segment. Valid values are:
  /// ACTIVE, endpoints that were active within the specified duration are
  /// included in the segment; and, INACTIVE, endpoints that weren't active
  /// within the specified duration are included in the segment.
  final String recencyType;

  RecencyDimension({
    @required this.duration,
    @required this.recencyType,
  });
  static RecencyDimension fromJson(Map<String, dynamic> json) =>
      RecencyDimension(
        duration: json['Duration'] as String,
        recencyType: json['RecencyType'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class RemoveAttributesResponse {
  final AttributesResource attributesResource;

  RemoveAttributesResponse({
    @required this.attributesResource,
  });
  static RemoveAttributesResponse fromJson(Map<String, dynamic> json) =>
      RemoveAttributesResponse(
        attributesResource:
            AttributesResource.fromJson(json['AttributesResource']),
      );
}

/// Provides the results of a query that retrieved the data for a standard
/// metric that applies to an application or campaign.
class ResultRow {
  /// An array of objects that defines the field and field values that were used
  /// to group data in a result set that contains multiple results. This value
  /// is null if the data in a result set isn’t grouped.
  final List<ResultRowValue> groupedBys;

  /// An array of objects that provides pre-aggregated values for a standard
  /// metric that applies to an application or campaign.
  final List<ResultRowValue> values;

  ResultRow({
    @required this.groupedBys,
    @required this.values,
  });
  static ResultRow fromJson(Map<String, dynamic> json) => ResultRow(
        groupedBys: (json['GroupedBys'] as List)
            .map((e) => ResultRowValue.fromJson(e))
            .toList(),
        values: (json['Values'] as List)
            .map((e) => ResultRowValue.fromJson(e))
            .toList(),
      );
}

/// Provides a single value and metadata about that value as part of an array of
/// query results for a standard metric that applies to an application or
/// campaign.
class ResultRowValue {
  /// The name of the field that Amazon Pinpoint uses to store the value
  /// specified by the Value property.
  final String key;

  /// The data type of the value specified by the Value property.
  final String type;

  /// In a Values object, the value for the metric that the query retrieved data
  /// for. In a GroupedBys object, the value for the field that was used to
  /// group data in a result set that contains multiple results (Values
  /// objects).
  final String value;

  ResultRowValue({
    @required this.key,
    @required this.type,
    @required this.value,
  });
  static ResultRowValue fromJson(Map<String, dynamic> json) => ResultRowValue(
        key: json['Key'] as String,
        type: json['Type'] as String,
        value: json['Value'] as String,
      );
}

/// Specifies the status and settings of the SMS channel for an application.
class SmsChannelRequest {
  /// Specifies whether to enable the SMS channel for the application.
  final bool enabled;

  /// The identity that you want to display on recipients' devices when they
  /// receive messages from the SMS channel.
  final String senderId;

  /// The registered short code that you want to use when you send messages
  /// through the SMS channel.
  final String shortCode;

  SmsChannelRequest({
    this.enabled,
    this.senderId,
    this.shortCode,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides information about the status and settings of the SMS channel for an
/// application.
class SmsChannelResponse {
  /// The unique identifier for the application that the SMS channel applies to.
  final String applicationId;

  /// The date and time, in ISO 8601 format, when the SMS channel was enabled.
  final String creationDate;

  /// Specifies whether the SMS channel is enabled for the application.
  final bool enabled;

  /// (Not used) This property is retained only for backward compatibility.
  final bool hasCredential;

  /// (Deprecated) An identifier for the SMS channel. This property is retained
  /// only for backward compatibility.
  final String id;

  /// Specifies whether the SMS channel is archived.
  final bool isArchived;

  /// The user who last modified the SMS channel.
  final String lastModifiedBy;

  /// The date and time, in ISO 8601 format, when the SMS channel was last
  /// modified.
  final String lastModifiedDate;

  /// The type of messaging or notification platform for the channel. For the
  /// SMS channel, this value is SMS.
  final String platform;

  /// The maximum number of promotional messages that you can send through the
  /// SMS channel each second.
  final int promotionalMessagesPerSecond;

  /// The identity that displays on recipients' devices when they receive
  /// messages from the SMS channel.
  final String senderId;

  /// The registered short code to use when you send messages through the SMS
  /// channel.
  final String shortCode;

  /// The maximum number of transactional messages that you can send through the
  /// SMS channel each second.
  final int transactionalMessagesPerSecond;

  /// The current version of the SMS channel.
  final int version;

  SmsChannelResponse({
    this.applicationId,
    this.creationDate,
    this.enabled,
    this.hasCredential,
    this.id,
    this.isArchived,
    this.lastModifiedBy,
    this.lastModifiedDate,
    @required this.platform,
    this.promotionalMessagesPerSecond,
    this.senderId,
    this.shortCode,
    this.transactionalMessagesPerSecond,
    this.version,
  });
  static SmsChannelResponse fromJson(Map<String, dynamic> json) =>
      SmsChannelResponse(
        applicationId: json.containsKey('ApplicationId')
            ? json['ApplicationId'] as String
            : null,
        creationDate: json.containsKey('CreationDate')
            ? json['CreationDate'] as String
            : null,
        enabled: json.containsKey('Enabled') ? json['Enabled'] as bool : null,
        hasCredential: json.containsKey('HasCredential')
            ? json['HasCredential'] as bool
            : null,
        id: json.containsKey('Id') ? json['Id'] as String : null,
        isArchived:
            json.containsKey('IsArchived') ? json['IsArchived'] as bool : null,
        lastModifiedBy: json.containsKey('LastModifiedBy')
            ? json['LastModifiedBy'] as String
            : null,
        lastModifiedDate: json.containsKey('LastModifiedDate')
            ? json['LastModifiedDate'] as String
            : null,
        platform: json['Platform'] as String,
        promotionalMessagesPerSecond:
            json.containsKey('PromotionalMessagesPerSecond')
                ? json['PromotionalMessagesPerSecond'] as int
                : null,
        senderId:
            json.containsKey('SenderId') ? json['SenderId'] as String : null,
        shortCode:
            json.containsKey('ShortCode') ? json['ShortCode'] as String : null,
        transactionalMessagesPerSecond:
            json.containsKey('TransactionalMessagesPerSecond')
                ? json['TransactionalMessagesPerSecond'] as int
                : null,
        version: json.containsKey('Version') ? json['Version'] as int : null,
      );
}

/// Specifies the default settings for a one-time SMS message that's sent
/// directly to an endpoint.
class SmsMessage {
  /// The body of the SMS message.
  final String body;

  /// The SMS program name that you provided to AWS Support when you requested
  /// your dedicated number.
  final String keyword;

  /// The SMS message type. Valid values are: TRANSACTIONAL, the message is
  /// critical or time-sensitive, such as a one-time password that supports a
  /// customer transaction; and, PROMOTIONAL, the message is not critical or
  /// time-sensitive, such as a marketing message.
  final String messageType;

  /// The number that the SMS message originates from. This should be one of the
  /// dedicated long codes or short codes that you requested from AWS Support
  /// and is assigned to your AWS account. If you don't specify a long or short
  /// code, Amazon Pinpoint assigns a random long code to the SMS message.
  final String originationNumber;

  /// The sender ID to display as the sender of the message on a recipient's
  /// device. Support for sender IDs varies by country or region.
  final String senderId;

  /// The message variables to use in the SMS message. You can override the
  /// default variables with individual address variables.
  final Map<String, List<String>> substitutions;

  SmsMessage({
    this.body,
    this.keyword,
    this.messageType,
    this.originationNumber,
    this.senderId,
    this.substitutions,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies the schedule settings for a campaign.
class Schedule {
  /// The scheduled time, in ISO 8601 format, for the campaign to end.
  final String endTime;

  /// The type of event that causes the campaign to be sent, if the value of the
  /// Frequency property is EVENT.
  final CampaignEventFilter eventFilter;

  /// Specifies how often the campaign is sent or whether the campaign is sent
  /// in response to a specific event.
  final String frequency;

  /// Specifies whether the start and end times for the campaign schedule use
  /// each recipient's local time. To base the schedule on each recipient's
  /// local time, set this value to true.
  final bool isLocalTime;

  /// The default quiet time for the campaign. Quiet time is a specific time
  /// range when a campaign doesn't send messages to endpoints, if all the
  /// following conditions are met:
  ///
  /// *   The EndpointDemographic.Timezone property of the endpoint is set to a
  /// valid value.
  ///
  /// *   The current time in the endpoint's time zone is later than or equal to
  /// the time specified by the QuietTime.Start property for the campaign.
  ///
  /// *   The current time in the endpoint's time zone is earlier than or equal
  /// to the time specified by the QuietTime.End property for the campaign.
  ///
  ///
  /// If any of the preceding conditions isn't met, the endpoint will receive
  /// messages from the campaign, even if quiet time is enabled.
  final QuietTime quietTime;

  /// The scheduled time, in ISO 8601 format, for the campaign to begin.
  final String startTime;

  /// The starting UTC offset for the campaign schedule, if the value of the
  /// IsLocalTime property is true. Valid values are: UTC, UTC+01, UTC+02,
  /// UTC+03, UTC+03:30, UTC+04, UTC+04:30, UTC+05, UTC+05:30, UTC+05:45,
  /// UTC+06, UTC+06:30, UTC+07, UTC+08, UTC+09, UTC+09:30, UTC+10, UTC+10:30,
  /// UTC+11, UTC+12, UTC+13, UTC-02, UTC-03, UTC-04, UTC-05, UTC-06, UTC-07,
  /// UTC-08, UTC-09, UTC-10, and UTC-11.
  final String timezone;

  Schedule({
    this.endTime,
    this.eventFilter,
    this.frequency,
    this.isLocalTime,
    this.quietTime,
    @required this.startTime,
    this.timezone,
  });
  static Schedule fromJson(Map<String, dynamic> json) => Schedule(
        endTime: json.containsKey('EndTime') ? json['EndTime'] as String : null,
        eventFilter: json.containsKey('EventFilter')
            ? CampaignEventFilter.fromJson(json['EventFilter'])
            : null,
        frequency:
            json.containsKey('Frequency') ? json['Frequency'] as String : null,
        isLocalTime: json.containsKey('IsLocalTime')
            ? json['IsLocalTime'] as bool
            : null,
        quietTime: json.containsKey('QuietTime')
            ? QuietTime.fromJson(json['QuietTime'])
            : null,
        startTime: json['StartTime'] as String,
        timezone:
            json.containsKey('Timezone') ? json['Timezone'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies dimension settings for including or excluding endpoints from a
/// segment based on how recently an endpoint was active.
class SegmentBehaviors {
  /// The dimension settings that are based on how recently an endpoint was
  /// active.
  final RecencyDimension recency;

  SegmentBehaviors({
    this.recency,
  });
  static SegmentBehaviors fromJson(Map<String, dynamic> json) =>
      SegmentBehaviors(
        recency: json.containsKey('Recency')
            ? RecencyDimension.fromJson(json['Recency'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies demographic-based dimension settings for including or excluding
/// endpoints from a segment. These settings derive from characteristics of
/// endpoint devices, such as platform, make, and model.
class SegmentDemographics {
  /// The app version criteria for the segment.
  final SetDimension appVersion;

  /// The channel criteria for the segment.
  final SetDimension channel;

  /// The device type criteria for the segment.
  final SetDimension deviceType;

  /// The device make criteria for the segment.
  final SetDimension make;

  /// The device model criteria for the segment.
  final SetDimension model;

  /// The device platform criteria for the segment.
  final SetDimension platform;

  SegmentDemographics({
    this.appVersion,
    this.channel,
    this.deviceType,
    this.make,
    this.model,
    this.platform,
  });
  static SegmentDemographics fromJson(Map<String, dynamic> json) =>
      SegmentDemographics(
        appVersion: json.containsKey('AppVersion')
            ? SetDimension.fromJson(json['AppVersion'])
            : null,
        channel: json.containsKey('Channel')
            ? SetDimension.fromJson(json['Channel'])
            : null,
        deviceType: json.containsKey('DeviceType')
            ? SetDimension.fromJson(json['DeviceType'])
            : null,
        make: json.containsKey('Make')
            ? SetDimension.fromJson(json['Make'])
            : null,
        model: json.containsKey('Model')
            ? SetDimension.fromJson(json['Model'])
            : null,
        platform: json.containsKey('Platform')
            ? SetDimension.fromJson(json['Platform'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies the dimension settings for a segment.
class SegmentDimensions {
  /// One or more custom attributes to use as criteria for the segment.
  final Map<String, AttributeDimension> attributes;

  /// The behavior-based criteria, such as how recently users have used your
  /// app, for the segment.
  final SegmentBehaviors behavior;

  /// The demographic-based criteria, such as device platform, for the segment.
  final SegmentDemographics demographic;

  /// The location-based criteria, such as region or GPS coordinates, for the
  /// segment.
  final SegmentLocation location;

  /// One or more custom metrics to use as criteria for the segment.
  final Map<String, MetricDimension> metrics;

  /// One or more custom user attributes to use as criteria for the segment.
  final Map<String, AttributeDimension> userAttributes;

  SegmentDimensions({
    this.attributes,
    this.behavior,
    this.demographic,
    this.location,
    this.metrics,
    this.userAttributes,
  });
  static SegmentDimensions fromJson(Map<String, dynamic> json) =>
      SegmentDimensions(
        attributes: json.containsKey('Attributes')
            ? (json['Attributes'] as Map).map(
                (k, v) => MapEntry(k as String, AttributeDimension.fromJson(v)))
            : null,
        behavior: json.containsKey('Behavior')
            ? SegmentBehaviors.fromJson(json['Behavior'])
            : null,
        demographic: json.containsKey('Demographic')
            ? SegmentDemographics.fromJson(json['Demographic'])
            : null,
        location: json.containsKey('Location')
            ? SegmentLocation.fromJson(json['Location'])
            : null,
        metrics: json.containsKey('Metrics')
            ? (json['Metrics'] as Map).map(
                (k, v) => MapEntry(k as String, MetricDimension.fromJson(v)))
            : null,
        userAttributes: json.containsKey('UserAttributes')
            ? (json['UserAttributes'] as Map).map(
                (k, v) => MapEntry(k as String, AttributeDimension.fromJson(v)))
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies the base segments and dimensions for a segment, and the
/// relationships between these base segments and dimensions.
class SegmentGroup {
  /// An array that defines the dimensions for the segment.
  final List<SegmentDimensions> dimensions;

  /// The base segment to build the segment on. A base segment, also referred to
  /// as a _source segment_, defines the initial population of endpoints for a
  /// segment. When you add dimensions to a segment, Amazon Pinpoint filters the
  /// base segment by using the dimensions that you specify.
  ///
  /// You can specify more than one dimensional segment or only one imported
  /// segment. If you specify an imported segment, the Amazon Pinpoint console
  /// displays a segment size estimate that indicates the size of the imported
  /// segment without any filters applied to it.
  final List<SegmentReference> sourceSegments;

  /// Specifies how to handle multiple base segments for the segment. For
  /// example, if you specify three base segments for the segment, whether the
  /// resulting segment is based on all, any, or none of the base segments.
  final String sourceType;

  /// Specifies how to handle multiple dimensions for the segment. For example,
  /// if you specify three dimensions for the segment, whether the resulting
  /// segment includes endpoints that match all, any, or none of the dimensions.
  final String type;

  SegmentGroup({
    this.dimensions,
    this.sourceSegments,
    this.sourceType,
    this.type,
  });
  static SegmentGroup fromJson(Map<String, dynamic> json) => SegmentGroup(
        dimensions: json.containsKey('Dimensions')
            ? (json['Dimensions'] as List)
                .map((e) => SegmentDimensions.fromJson(e))
                .toList()
            : null,
        sourceSegments: json.containsKey('SourceSegments')
            ? (json['SourceSegments'] as List)
                .map((e) => SegmentReference.fromJson(e))
                .toList()
            : null,
        sourceType: json.containsKey('SourceType')
            ? json['SourceType'] as String
            : null,
        type: json.containsKey('Type') ? json['Type'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies the settings that define the relationships between segment groups
/// for a segment.
class SegmentGroupList {
  /// An array that defines the set of segment criteria to evaluate when
  /// handling segment groups for the segment.
  final List<SegmentGroup> groups;

  /// Specifies how to handle multiple segment groups for the segment. For
  /// example, if the segment includes three segment groups, whether the
  /// resulting segment includes endpoints that match all, any, or none of the
  /// segment groups.
  final String include;

  SegmentGroupList({
    this.groups,
    this.include,
  });
  static SegmentGroupList fromJson(Map<String, dynamic> json) =>
      SegmentGroupList(
        groups: json.containsKey('Groups')
            ? (json['Groups'] as List)
                .map((e) => SegmentGroup.fromJson(e))
                .toList()
            : null,
        include: json.containsKey('Include') ? json['Include'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides information about the import job that created a segment. An import
/// job is a job that creates a user segment by importing endpoint definitions.
class SegmentImportResource {
  /// The number of channel types in the endpoint definitions that were imported
  /// to create the segment.
  final Map<String, int> channelCounts;

  /// (Deprecated) Your AWS account ID, which you assigned to an external ID key
  /// in an IAM trust policy. Amazon Pinpoint previously used this value to
  /// assume an IAM role when importing endpoint definitions, but we removed
  /// this requirement. We don't recommend use of external IDs for IAM roles
  /// that are assumed by Amazon Pinpoint.
  final String externalId;

  /// The format of the files that were imported to create the segment. Valid
  /// values are: CSV, for comma-separated values format; and, JSON, for
  /// newline-delimited JSON format.
  final String format;

  /// The Amazon Resource Name (ARN) of the AWS Identity and Access Management
  /// (IAM) role that authorized Amazon Pinpoint to access the Amazon S3
  /// location to import endpoint definitions from.
  final String roleArn;

  /// The URL of the Amazon Simple Storage Service (Amazon S3) bucket that the
  /// endpoint definitions were imported from to create the segment.
  final String s3Url;

  /// The number of endpoint definitions that were imported successfully to
  /// create the segment.
  final int size;

  SegmentImportResource({
    this.channelCounts,
    @required this.externalId,
    @required this.format,
    @required this.roleArn,
    @required this.s3Url,
    @required this.size,
  });
  static SegmentImportResource fromJson(Map<String, dynamic> json) =>
      SegmentImportResource(
        channelCounts: json.containsKey('ChannelCounts')
            ? (json['ChannelCounts'] as Map)
                .map((k, v) => MapEntry(k as String, v as int))
            : null,
        externalId: json['ExternalId'] as String,
        format: json['Format'] as String,
        roleArn: json['RoleArn'] as String,
        s3Url: json['S3Url'] as String,
        size: json['Size'] as int,
      );
}

/// Specifies geographical dimension settings for a segment.
class SegmentLocation {
  /// The country or region code, in ISO 3166-1 alpha-2 format, for the segment.
  final SetDimension country;

  /// The GPS location and range for the segment.
  final GpsPointDimension gpsPoint;

  SegmentLocation({
    this.country,
    this.gpsPoint,
  });
  static SegmentLocation fromJson(Map<String, dynamic> json) => SegmentLocation(
        country: json.containsKey('Country')
            ? SetDimension.fromJson(json['Country'])
            : null,
        gpsPoint: json.containsKey('GPSPoint')
            ? GpsPointDimension.fromJson(json['GPSPoint'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies the segment identifier and version of a segment.
class SegmentReference {
  /// The unique identifier for the segment.
  final String id;

  /// The version number of the segment.
  final int version;

  SegmentReference({
    @required this.id,
    this.version,
  });
  static SegmentReference fromJson(Map<String, dynamic> json) =>
      SegmentReference(
        id: json['Id'] as String,
        version: json.containsKey('Version') ? json['Version'] as int : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides information about the configuration, dimension, and other settings
/// for a segment.
class SegmentResponse {
  /// The unique identifier for the application that the segment is associated
  /// with.
  final String applicationId;

  /// The Amazon Resource Name (ARN) of the segment.
  final String arn;

  /// The date and time when the segment was created.
  final String creationDate;

  /// The dimension settings for the segment.
  final SegmentDimensions dimensions;

  /// The unique identifier for the segment.
  final String id;

  /// The settings for the import job that's associated with the segment.
  final SegmentImportResource importDefinition;

  /// The date and time when the segment was last modified.
  final String lastModifiedDate;

  /// The name of the segment.
  final String name;

  /// A list of one or more segment groups that apply to the segment. Each
  /// segment group consists of zero or more base segments and the dimensions
  /// that are applied to those base segments.
  final SegmentGroupList segmentGroups;

  /// The segment type. Valid values are:
  ///
  /// *   DIMENSIONAL - A dynamic segment, which is a segment that uses
  /// selection criteria that you specify and is based on endpoint data that's
  /// reported by your app. Dynamic segments can change over time.
  ///
  /// *   IMPORT - A static segment, which is a segment that uses selection
  /// criteria that you specify and is based on endpoint definitions that you
  /// import from a file. Imported segments are static; they don't change over
  /// time.
  final String segmentType;

  /// A string-to-string map of key-value pairs that identifies the tags that
  /// are associated with the segment. Each tag consists of a required tag key
  /// and an associated tag value.
  final Map<String, String> tags;

  /// The version number of the segment.
  final int version;

  SegmentResponse({
    @required this.applicationId,
    @required this.arn,
    @required this.creationDate,
    this.dimensions,
    @required this.id,
    this.importDefinition,
    this.lastModifiedDate,
    this.name,
    this.segmentGroups,
    @required this.segmentType,
    this.tags,
    this.version,
  });
  static SegmentResponse fromJson(Map<String, dynamic> json) => SegmentResponse(
        applicationId: json['ApplicationId'] as String,
        arn: json['Arn'] as String,
        creationDate: json['CreationDate'] as String,
        dimensions: json.containsKey('Dimensions')
            ? SegmentDimensions.fromJson(json['Dimensions'])
            : null,
        id: json['Id'] as String,
        importDefinition: json.containsKey('ImportDefinition')
            ? SegmentImportResource.fromJson(json['ImportDefinition'])
            : null,
        lastModifiedDate: json.containsKey('LastModifiedDate')
            ? json['LastModifiedDate'] as String
            : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        segmentGroups: json.containsKey('SegmentGroups')
            ? SegmentGroupList.fromJson(json['SegmentGroups'])
            : null,
        segmentType: json['SegmentType'] as String,
        tags: json.containsKey('tags')
            ? (json['tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        version: json.containsKey('Version') ? json['Version'] as int : null,
      );
}

/// Provides information about all the segments that are associated with an
/// application.
class SegmentsResponse {
  /// An array of responses, one for each segment that's associated with the
  /// application (Segments resource) or each version of a segment that's
  /// associated with the application (Segment Versions resource).
  final List<SegmentResponse> item;

  /// The string to use in a subsequent request to get the next page of results
  /// in a paginated response. This value is null if there are no additional
  /// pages.
  final String nextToken;

  SegmentsResponse({
    @required this.item,
    this.nextToken,
  });
  static SegmentsResponse fromJson(Map<String, dynamic> json) =>
      SegmentsResponse(
        item: (json['Item'] as List)
            .map((e) => SegmentResponse.fromJson(e))
            .toList(),
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class SendMessagesResponse {
  final MessageResponse messageResponse;

  SendMessagesResponse({
    @required this.messageResponse,
  });
  static SendMessagesResponse fromJson(Map<String, dynamic> json) =>
      SendMessagesResponse(
        messageResponse: MessageResponse.fromJson(json['MessageResponse']),
      );
}

/// Specifies the configuration and other settings for a message to send to all
/// the endpoints that are associated with a list of users.
class SendUsersMessageRequest {
  /// A map of custom attribute-value pairs. For a push notification, Amazon
  /// Pinpoint adds these attributes to the data.pinpoint object in the body of
  /// the notification payload. Amazon Pinpoint also provides these attributes
  /// in the events that it generates for users-messages deliveries.
  final Map<String, String> context;

  /// The message definitions for the default message and any default messages
  /// that you defined for specific channels.
  final DirectMessageConfiguration messageConfiguration;

  /// The unique identifier for tracing the message. This identifier is visible
  /// to message recipients.
  final String traceId;

  /// A map that associates user IDs with EndpointSendConfiguration objects. You
  /// can use an EndpointSendConfiguration object to tailor the message for a
  /// user by specifying settings such as content overrides and message
  /// variables.
  final Map<String, EndpointSendConfiguration> users;

  SendUsersMessageRequest({
    this.context,
    @required this.messageConfiguration,
    this.traceId,
    @required this.users,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides information about which users and endpoints a message was sent to.
class SendUsersMessageResponse {
  /// The unique identifier for the application that was used to send the
  /// message.
  final String applicationId;

  /// The unique identifier that was assigned to the message request.
  final String requestId;

  /// An object that indicates which endpoints the message was sent to, for each
  /// user. The object lists user IDs and, for each user ID, provides the
  /// endpoint IDs that the message was sent to. For each endpoint ID, it
  /// provides an EndpointMessageResult object.
  final Map<String, Map<String, EndpointMessageResult>> result;

  SendUsersMessageResponse({
    @required this.applicationId,
    this.requestId,
    this.result,
  });
  static SendUsersMessageResponse fromJson(Map<String, dynamic> json) =>
      SendUsersMessageResponse(
        applicationId: json['ApplicationId'] as String,
        requestId:
            json.containsKey('RequestId') ? json['RequestId'] as String : null,
        result: json.containsKey('Result')
            ? (json['Result'] as Map).map((k, v) => MapEntry(
                k as String,
                (v as Map).map((k, v) =>
                    MapEntry(k as String, EndpointMessageResult.fromJson(v)))))
            : null,
      );
}

class SendUsersMessagesResponse {
  final SendUsersMessageResponse sendUsersMessageResponse;

  SendUsersMessagesResponse({
    @required this.sendUsersMessageResponse,
  });
  static SendUsersMessagesResponse fromJson(Map<String, dynamic> json) =>
      SendUsersMessagesResponse(
        sendUsersMessageResponse:
            SendUsersMessageResponse.fromJson(json['SendUsersMessageResponse']),
      );
}

/// Provides information about a session.
class Session {
  /// The duration of the session, in milliseconds.
  final int duration;

  /// The unique identifier for the session.
  final String id;

  /// The date and time when the session began.
  final String startTimestamp;

  /// The date and time when the session ended.
  final String stopTimestamp;

  Session({
    this.duration,
    @required this.id,
    @required this.startTimestamp,
    this.stopTimestamp,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies the dimension type and values for a segment dimension.
class SetDimension {
  /// The type of segment dimension to use. Valid values are: INCLUSIVE,
  /// endpoints that match the criteria are included in the segment; and,
  /// EXCLUSIVE, endpoints that match the criteria are excluded from the
  /// segment.
  final String dimensionType;

  /// The criteria values to use for the segment dimension. Depending on the
  /// value of the DimensionType property, endpoints are included or excluded
  /// from the segment if their values match the criteria values.
  final List<String> values;

  SetDimension({
    this.dimensionType,
    @required this.values,
  });
  static SetDimension fromJson(Map<String, dynamic> json) => SetDimension(
        dimensionType: json.containsKey('DimensionType')
            ? json['DimensionType'] as String
            : null,
        values: (json['Values'] as List).map((e) => e as String).toList(),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies the content of an email message, composed of a subject, a text
/// part, and an HTML part.
class SimpleEmail {
  /// The body of the email message, in HTML format. We recommend using an HTML
  /// part for email clients that support HTML. You can include links, formatted
  /// text, and more in an HTML message.
  final SimpleEmailPart htmlPart;

  /// The subject line, or title, of the email.
  final SimpleEmailPart subject;

  /// The body of the email message, in text format. We recommend using a text
  /// part for email clients that don't support HTML and clients that are
  /// connected to high-latency networks, such as mobile devices.
  final SimpleEmailPart textPart;

  SimpleEmail({
    this.htmlPart,
    this.subject,
    this.textPart,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies the subject or body of an email message, represented as textual
/// email data and the applicable character set.
class SimpleEmailPart {
  /// The applicable character set for the message content.
  final String charset;

  /// The textual data of the message content.
  final String data;

  SimpleEmailPart({
    this.charset,
    this.data,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies the tags (keys and values) for an application, campaign, or
/// segment.
class TagsModel {
  /// A string-to-string map of key-value pairs that defines the tags for an
  /// application, campaign, or segment. A project, campaign, or segment can
  /// have a maximum of 50 tags.
  ///
  /// Each tag consists of a required tag key and an associated tag value. The
  /// maximum length of a tag key is 128 characters. The maximum length of a tag
  /// value is 256 characters.
  final Map<String, String> tags;

  TagsModel({
    @required this.tags,
  });
  static TagsModel fromJson(Map<String, dynamic> json) => TagsModel(
        tags: (json['tags'] as Map)
            .map((k, v) => MapEntry(k as String, v as String)),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies the settings for a campaign treatment. A treatment is a variation
/// of a campaign that's used for A/B testing of a campaign.
class TreatmentResource {
  /// The unique identifier for the treatment.
  final String id;

  /// The message configuration settings for the treatment.
  final MessageConfiguration messageConfiguration;

  /// The schedule settings for the treatment.
  final Schedule schedule;

  /// The allocated percentage of users (segment members) that the treatment is
  /// sent to.
  final int sizePercent;

  /// The status of the treatment.
  final CampaignState state;

  /// The custom description of the treatment.
  final String treatmentDescription;

  /// The custom name of the treatment. A treatment is a variation of a campaign
  /// that's used for A/B testing of a campaign.
  final String treatmentName;

  TreatmentResource({
    @required this.id,
    this.messageConfiguration,
    this.schedule,
    @required this.sizePercent,
    this.state,
    this.treatmentDescription,
    this.treatmentName,
  });
  static TreatmentResource fromJson(Map<String, dynamic> json) =>
      TreatmentResource(
        id: json['Id'] as String,
        messageConfiguration: json.containsKey('MessageConfiguration')
            ? MessageConfiguration.fromJson(json['MessageConfiguration'])
            : null,
        schedule: json.containsKey('Schedule')
            ? Schedule.fromJson(json['Schedule'])
            : null,
        sizePercent: json['SizePercent'] as int,
        state: json.containsKey('State')
            ? CampaignState.fromJson(json['State'])
            : null,
        treatmentDescription: json.containsKey('TreatmentDescription')
            ? json['TreatmentDescription'] as String
            : null,
        treatmentName: json.containsKey('TreatmentName')
            ? json['TreatmentName'] as String
            : null,
      );
}

class UpdateAdmChannelResponse {
  final AdmChannelResponse admChannelResponse;

  UpdateAdmChannelResponse({
    @required this.admChannelResponse,
  });
  static UpdateAdmChannelResponse fromJson(Map<String, dynamic> json) =>
      UpdateAdmChannelResponse(
        admChannelResponse:
            AdmChannelResponse.fromJson(json['ADMChannelResponse']),
      );
}

class UpdateApnsChannelResponse {
  final ApnsChannelResponse apnsChannelResponse;

  UpdateApnsChannelResponse({
    @required this.apnsChannelResponse,
  });
  static UpdateApnsChannelResponse fromJson(Map<String, dynamic> json) =>
      UpdateApnsChannelResponse(
        apnsChannelResponse:
            ApnsChannelResponse.fromJson(json['APNSChannelResponse']),
      );
}

class UpdateApnsSandboxChannelResponse {
  final ApnsSandboxChannelResponse apnsSandboxChannelResponse;

  UpdateApnsSandboxChannelResponse({
    @required this.apnsSandboxChannelResponse,
  });
  static UpdateApnsSandboxChannelResponse fromJson(Map<String, dynamic> json) =>
      UpdateApnsSandboxChannelResponse(
        apnsSandboxChannelResponse: ApnsSandboxChannelResponse.fromJson(
            json['APNSSandboxChannelResponse']),
      );
}

class UpdateApnsVoipChannelResponse {
  final ApnsVoipChannelResponse apnsVoipChannelResponse;

  UpdateApnsVoipChannelResponse({
    @required this.apnsVoipChannelResponse,
  });
  static UpdateApnsVoipChannelResponse fromJson(Map<String, dynamic> json) =>
      UpdateApnsVoipChannelResponse(
        apnsVoipChannelResponse:
            ApnsVoipChannelResponse.fromJson(json['APNSVoipChannelResponse']),
      );
}

class UpdateApnsVoipSandboxChannelResponse {
  final ApnsVoipSandboxChannelResponse apnsVoipSandboxChannelResponse;

  UpdateApnsVoipSandboxChannelResponse({
    @required this.apnsVoipSandboxChannelResponse,
  });
  static UpdateApnsVoipSandboxChannelResponse fromJson(
          Map<String, dynamic> json) =>
      UpdateApnsVoipSandboxChannelResponse(
        apnsVoipSandboxChannelResponse: ApnsVoipSandboxChannelResponse.fromJson(
            json['APNSVoipSandboxChannelResponse']),
      );
}

class UpdateApplicationSettingsResponse {
  final ApplicationSettingsResource applicationSettingsResource;

  UpdateApplicationSettingsResponse({
    @required this.applicationSettingsResource,
  });
  static UpdateApplicationSettingsResponse fromJson(
          Map<String, dynamic> json) =>
      UpdateApplicationSettingsResponse(
        applicationSettingsResource: ApplicationSettingsResource.fromJson(
            json['ApplicationSettingsResource']),
      );
}

/// Specifies one or more attributes to remove from all the endpoints that are
/// associated with an application.
class UpdateAttributesRequest {
  /// An array of the attributes to remove from all the endpoints that are
  /// associated with the application. The array can specify the complete, exact
  /// name of each attribute to remove or it can specify a glob pattern that an
  /// attribute name must match in order for the attribute to be removed.
  final List<String> blacklist;

  UpdateAttributesRequest({
    this.blacklist,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class UpdateBaiduChannelResponse {
  final BaiduChannelResponse baiduChannelResponse;

  UpdateBaiduChannelResponse({
    @required this.baiduChannelResponse,
  });
  static UpdateBaiduChannelResponse fromJson(Map<String, dynamic> json) =>
      UpdateBaiduChannelResponse(
        baiduChannelResponse:
            BaiduChannelResponse.fromJson(json['BaiduChannelResponse']),
      );
}

class UpdateCampaignResponse {
  final CampaignResponse campaignResponse;

  UpdateCampaignResponse({
    @required this.campaignResponse,
  });
  static UpdateCampaignResponse fromJson(Map<String, dynamic> json) =>
      UpdateCampaignResponse(
        campaignResponse: CampaignResponse.fromJson(json['CampaignResponse']),
      );
}

class UpdateEmailChannelResponse {
  final EmailChannelResponse emailChannelResponse;

  UpdateEmailChannelResponse({
    @required this.emailChannelResponse,
  });
  static UpdateEmailChannelResponse fromJson(Map<String, dynamic> json) =>
      UpdateEmailChannelResponse(
        emailChannelResponse:
            EmailChannelResponse.fromJson(json['EmailChannelResponse']),
      );
}

class UpdateEndpointResponse {
  final MessageBody messageBody;

  UpdateEndpointResponse({
    @required this.messageBody,
  });
  static UpdateEndpointResponse fromJson(Map<String, dynamic> json) =>
      UpdateEndpointResponse(
        messageBody: MessageBody.fromJson(json['MessageBody']),
      );
}

class UpdateEndpointsBatchResponse {
  final MessageBody messageBody;

  UpdateEndpointsBatchResponse({
    @required this.messageBody,
  });
  static UpdateEndpointsBatchResponse fromJson(Map<String, dynamic> json) =>
      UpdateEndpointsBatchResponse(
        messageBody: MessageBody.fromJson(json['MessageBody']),
      );
}

class UpdateGcmChannelResponse {
  final GcmChannelResponse gcmChannelResponse;

  UpdateGcmChannelResponse({
    @required this.gcmChannelResponse,
  });
  static UpdateGcmChannelResponse fromJson(Map<String, dynamic> json) =>
      UpdateGcmChannelResponse(
        gcmChannelResponse:
            GcmChannelResponse.fromJson(json['GCMChannelResponse']),
      );
}

class UpdateSegmentResponse {
  final SegmentResponse segmentResponse;

  UpdateSegmentResponse({
    @required this.segmentResponse,
  });
  static UpdateSegmentResponse fromJson(Map<String, dynamic> json) =>
      UpdateSegmentResponse(
        segmentResponse: SegmentResponse.fromJson(json['SegmentResponse']),
      );
}

class UpdateSmsChannelResponse {
  final SmsChannelResponse smsChannelResponse;

  UpdateSmsChannelResponse({
    @required this.smsChannelResponse,
  });
  static UpdateSmsChannelResponse fromJson(Map<String, dynamic> json) =>
      UpdateSmsChannelResponse(
        smsChannelResponse:
            SmsChannelResponse.fromJson(json['SMSChannelResponse']),
      );
}

class UpdateVoiceChannelResponse {
  final VoiceChannelResponse voiceChannelResponse;

  UpdateVoiceChannelResponse({
    @required this.voiceChannelResponse,
  });
  static UpdateVoiceChannelResponse fromJson(Map<String, dynamic> json) =>
      UpdateVoiceChannelResponse(
        voiceChannelResponse:
            VoiceChannelResponse.fromJson(json['VoiceChannelResponse']),
      );
}

/// Specifies the status and settings of the voice channel for an application.
class VoiceChannelRequest {
  /// Specifies whether to enable the voice channel for the application.
  final bool enabled;

  VoiceChannelRequest({
    this.enabled,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides information about the status and settings of the voice channel for
/// an application.
class VoiceChannelResponse {
  /// The unique identifier for the application that the voice channel applies
  /// to.
  final String applicationId;

  /// The date and time, in ISO 8601 format, when the voice channel was enabled.
  final String creationDate;

  /// Specifies whether the voice channel is enabled for the application.
  final bool enabled;

  /// (Not used) This property is retained only for backward compatibility.
  final bool hasCredential;

  /// (Deprecated) An identifier for the voice channel. This property is
  /// retained only for backward compatibility.
  final String id;

  /// Specifies whether the voice channel is archived.
  final bool isArchived;

  /// The user who last modified the voice channel.
  final String lastModifiedBy;

  /// The date and time, in ISO 8601 format, when the voice channel was last
  /// modified.
  final String lastModifiedDate;

  /// The type of messaging or notification platform for the channel. For the
  /// voice channel, this value is VOICE.
  final String platform;

  /// The current version of the voice channel.
  final int version;

  VoiceChannelResponse({
    this.applicationId,
    this.creationDate,
    this.enabled,
    this.hasCredential,
    this.id,
    this.isArchived,
    this.lastModifiedBy,
    this.lastModifiedDate,
    @required this.platform,
    this.version,
  });
  static VoiceChannelResponse fromJson(Map<String, dynamic> json) =>
      VoiceChannelResponse(
        applicationId: json.containsKey('ApplicationId')
            ? json['ApplicationId'] as String
            : null,
        creationDate: json.containsKey('CreationDate')
            ? json['CreationDate'] as String
            : null,
        enabled: json.containsKey('Enabled') ? json['Enabled'] as bool : null,
        hasCredential: json.containsKey('HasCredential')
            ? json['HasCredential'] as bool
            : null,
        id: json.containsKey('Id') ? json['Id'] as String : null,
        isArchived:
            json.containsKey('IsArchived') ? json['IsArchived'] as bool : null,
        lastModifiedBy: json.containsKey('LastModifiedBy')
            ? json['LastModifiedBy'] as String
            : null,
        lastModifiedDate: json.containsKey('LastModifiedDate')
            ? json['LastModifiedDate'] as String
            : null,
        platform: json['Platform'] as String,
        version: json.containsKey('Version') ? json['Version'] as int : null,
      );
}

/// Specifies the settings for a one-time voice message that's sent directly to
/// an endpoint through the voice channel.
class VoiceMessage {
  /// The text script for the voice message.
  final String body;

  /// The language to use when delivering the message. For a list of supported
  /// languages, see the [Amazon Polly Developer Guide](AmazonPollyDG.html).
  final String languageCode;

  /// The phone number from the pool or messaging service to send the message
  /// from. Although it isn't required, we recommend that you specify the phone
  /// number in E.164 format to ensure prompt and accurate delivery.
  final String originationNumber;

  /// The default message variables to use in the voice message. You can
  /// override the default variables with individual address variables.
  final Map<String, List<String>> substitutions;

  /// The name of the voice to use when delivering the message. For a list of
  /// supported voices, see the
  /// [Amazon Polly Developer Guide](AmazonPollyDG.html).
  final String voiceId;

  VoiceMessage({
    this.body,
    this.languageCode,
    this.originationNumber,
    this.substitutions,
    this.voiceId,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies the default settings for an application.
class WriteApplicationSettingsRequest {
  /// The settings for the AWS Lambda function to use by default as a code hook
  /// for campaigns in the application. To override these settings for a
  /// specific campaign, use the Campaign resource to define custom Lambda
  /// function settings for the campaign.
  final CampaignHook campaignHook;

  /// Specifies whether to enable application-related alarms in Amazon
  /// CloudWatch.
  final bool cloudWatchMetricsEnabled;

  /// The default sending limits for campaigns in the application. To override
  /// these limits for a specific campaign, use the Campaign resource to define
  /// custom limits for the campaign.
  final CampaignLimits limits;

  /// The default quiet time for campaigns in the application. Quiet time is a
  /// specific time range when campaigns don't send messages to endpoints, if
  /// all the following conditions are met:
  ///
  /// *   The EndpointDemographic.Timezone property of the endpoint is set to a
  /// valid value.
  ///
  /// *   The current time in the endpoint's time zone is later than or equal to
  /// the time specified by the QuietTime.Start property for the application (or
  /// a campaign that has custom quiet time settings).
  ///
  /// *   The current time in the endpoint's time zone is earlier than or equal
  /// to the time specified by the QuietTime.End property for the application
  /// (or a campaign that has custom quiet time settings).
  ///
  ///
  /// If any of the preceding conditions isn't met, the endpoint will receive
  /// messages from a campaign, even if quiet time is enabled.
  ///
  /// To override the default quiet time settings for a specific campaign, use
  /// the Campaign resource to define a custom quiet time for the campaign.
  final QuietTime quietTime;

  WriteApplicationSettingsRequest({
    this.campaignHook,
    this.cloudWatchMetricsEnabled,
    this.limits,
    this.quietTime,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies the configuration and other settings for a campaign.
class WriteCampaignRequest {
  /// An array of requests that defines additional treatments for the campaign,
  /// in addition to the default treatment for the campaign.
  final List<WriteTreatmentResource> additionalTreatments;

  /// The custom description of the campaign.
  final String description;

  /// The allocated percentage of users (segment members) who shouldn't receive
  /// messages from the campaign.
  final int holdoutPercent;

  /// The settings for the AWS Lambda function to use as a code hook for the
  /// campaign.
  final CampaignHook hook;

  /// Specifies whether to pause the campaign. A paused campaign doesn't run
  /// unless you resume it by setting this value to false.
  final bool isPaused;

  /// The messaging limits for the campaign.
  final CampaignLimits limits;

  /// The message configuration settings for the campaign.
  final MessageConfiguration messageConfiguration;

  /// The custom name of the campaign.
  final String name;

  /// The schedule settings for the campaign.
  final Schedule schedule;

  /// The unique identifier for the segment to associate with the campaign.
  final String segmentId;

  /// The version of the segment to associate with the campaign.
  final int segmentVersion;

  /// A string-to-string map of key-value pairs that defines the tags to
  /// associate with the campaign. Each tag consists of a required tag key and
  /// an associated tag value.
  final Map<String, String> tags;

  /// The custom description of a variation of the campaign to use for A/B
  /// testing.
  final String treatmentDescription;

  /// The custom name of a variation of the campaign to use for A/B testing.
  final String treatmentName;

  WriteCampaignRequest({
    this.additionalTreatments,
    this.description,
    this.holdoutPercent,
    this.hook,
    this.isPaused,
    this.limits,
    this.messageConfiguration,
    this.name,
    this.schedule,
    this.segmentId,
    this.segmentVersion,
    this.tags,
    this.treatmentDescription,
    this.treatmentName,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies the Amazon Resource Name (ARN) of an event stream to publish
/// events to and the AWS Identity and Access Management (IAM) role to use when
/// publishing those events.
class WriteEventStream {
  /// The Amazon Resource Name (ARN) of the Amazon Kinesis data stream or Amazon
  /// Kinesis Data Firehose delivery stream that you want to publish event data
  /// to.
  ///
  /// For a Kinesis data stream, the ARN format is:
  /// arn:aws:kinesis:region:account-id:stream/stream_name
  ///
  /// For a Kinesis Data Firehose delivery stream, the ARN format is:
  /// arn:aws:firehose:region:account-id:deliverystream/stream_name
  final String destinationStreamArn;

  /// The AWS Identity and Access Management (IAM) role that authorizes Amazon
  /// Pinpoint to publish event data to the stream in your AWS account.
  final String roleArn;

  WriteEventStream({
    @required this.destinationStreamArn,
    @required this.roleArn,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies the configuration, dimension, and other settings for a segment. A
/// WriteSegmentRequest object can include a Dimensions object or a
/// SegmentGroups object, but not both.
class WriteSegmentRequest {
  /// The criteria that define the dimensions for the segment.
  final SegmentDimensions dimensions;

  /// The name of the segment.
  final String name;

  /// The segment group to use and the dimensions to apply to the group's base
  /// segments in order to build the segment. A segment group can consist of
  /// zero or more base segments. Your request can include only one segment
  /// group.
  final SegmentGroupList segmentGroups;

  /// A string-to-string map of key-value pairs that defines the tags to
  /// associate with the segment. Each tag consists of a required tag key and an
  /// associated tag value.
  final Map<String, String> tags;

  WriteSegmentRequest({
    this.dimensions,
    this.name,
    this.segmentGroups,
    this.tags,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies the settings for a campaign treatment. A treatment is a variation
/// of a campaign that's used for A/B testing of a campaign.
class WriteTreatmentResource {
  /// The message configuration settings for the treatment.
  final MessageConfiguration messageConfiguration;

  /// The schedule settings for the treatment.
  final Schedule schedule;

  /// The allocated percentage of users (segment members) to send the treatment
  /// to.
  final int sizePercent;

  /// The custom description of the treatment.
  final String treatmentDescription;

  /// The custom name of the treatment. A treatment is a variation of a campaign
  /// that's used for A/B testing of a campaign.
  final String treatmentName;

  WriteTreatmentResource({
    this.messageConfiguration,
    this.schedule,
    @required this.sizePercent,
    this.treatmentDescription,
    this.treatmentName,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}
