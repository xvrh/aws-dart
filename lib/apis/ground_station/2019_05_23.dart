import 'package:meta/meta.dart';

/// Welcome to the AWS Ground Station API Reference. AWS Ground Station is a
/// fully managed service that enables you to control satellite communications,
/// downlink and process satellite data, and scale your satellite operations
/// efficiently and cost-effectively without having to build or manage your own
/// ground station infrastructure.
class GroundStationApi {
  final _client;
  GroundStationApi(client)
      : _client = client.configured('GroundStation', serializer: 'rest-json');

  /// Cancels a contact with a specified contact ID.
  ///
  /// [contactId]: UUID of a contact.
  Future<ContactIdResponse> cancelContact(String contactId) async {
    var response_ = await _client.send('CancelContact', {
      'contactId': contactId,
    });
    return ContactIdResponse.fromJson(response_);
  }

  /// Creates a `Config` with the specified `configData` parameters.
  ///
  /// Only one type of `configData` can be specified.
  ///
  /// [configData]: Parameters of a `Config`.
  ///
  /// [name]: Name of a `Config`.
  ///
  /// [tags]: Tags assigned to a `Config`.
  Future<ConfigIdResponse> createConfig(
      {@required ConfigTypeData configData,
      @required String name,
      Map<String, String> tags}) async {
    var response_ = await _client.send('CreateConfig', {
      'configData': configData,
      'name': name,
      if (tags != null) 'tags': tags,
    });
    return ConfigIdResponse.fromJson(response_);
  }

  /// Creates a `DataflowEndpoint` group containing the specified list of
  /// `DataflowEndpoint` objects.
  ///
  /// The `name` field in each endpoint is used in your mission profile
  /// `DataflowEndpointConfig` to specify which endpoints to use during a
  /// contact.
  ///
  /// When a contact uses multiple `DataflowEndpointConfig` objects, each
  /// `Config` must match a `DataflowEndpoint` in the same group.
  ///
  /// [endpointDetails]: Endpoint details of each endpoint in the dataflow
  /// endpoint group.
  ///
  /// [tags]: Tags of a dataflow endpoint group.
  Future<DataflowEndpointGroupIdResponse> createDataflowEndpointGroup(
      List<EndpointDetails> endpointDetails,
      {Map<String, String> tags}) async {
    var response_ = await _client.send('CreateDataflowEndpointGroup', {
      'endpointDetails': endpointDetails,
      if (tags != null) 'tags': tags,
    });
    return DataflowEndpointGroupIdResponse.fromJson(response_);
  }

  /// Creates a mission profile.
  ///
  ///  `dataflowEdges` is a list of lists of strings. Each lower level list of
  /// strings has two elements: a _from ARN_ and a _to ARN_.
  ///
  /// [contactPostPassDurationSeconds]: Amount of time after a contact ends that
  /// you’d like to receive a CloudWatch event indicating the pass has finished.
  ///
  /// [contactPrePassDurationSeconds]: Amount of time prior to contact start
  /// you’d like to receive a CloudWatch event indicating an upcoming pass.
  ///
  /// [dataflowEdges]: A list of lists of ARNs. Each list of ARNs is an edge,
  /// with a from `Config` and a to `Config`.
  ///
  /// [minimumViableContactDurationSeconds]: Smallest amount of time in seconds
  /// that you’d like to see for an available contact. AWS Ground Station will
  /// not present you with contacts shorter than this duration.
  ///
  /// [name]: Name of a mission profile.
  ///
  /// [tags]: Tags assigned to a mission profile.
  ///
  /// [trackingConfigArn]: ARN of a tracking `Config`.
  Future<MissionProfileIdResponse> createMissionProfile(
      {int contactPostPassDurationSeconds,
      int contactPrePassDurationSeconds,
      @required List<List<String>> dataflowEdges,
      @required int minimumViableContactDurationSeconds,
      @required String name,
      Map<String, String> tags,
      @required String trackingConfigArn}) async {
    var response_ = await _client.send('CreateMissionProfile', {
      if (contactPostPassDurationSeconds != null)
        'contactPostPassDurationSeconds': contactPostPassDurationSeconds,
      if (contactPrePassDurationSeconds != null)
        'contactPrePassDurationSeconds': contactPrePassDurationSeconds,
      'dataflowEdges': dataflowEdges,
      'minimumViableContactDurationSeconds':
          minimumViableContactDurationSeconds,
      'name': name,
      if (tags != null) 'tags': tags,
      'trackingConfigArn': trackingConfigArn,
    });
    return MissionProfileIdResponse.fromJson(response_);
  }

  /// Deletes a `Config`.
  ///
  /// [configId]: UUID of a `Config`.
  ///
  /// [configType]: Type of a `Config`.
  Future<ConfigIdResponse> deleteConfig(
      {@required String configId, @required String configType}) async {
    var response_ = await _client.send('DeleteConfig', {
      'configId': configId,
      'configType': configType,
    });
    return ConfigIdResponse.fromJson(response_);
  }

  /// Deletes a dataflow endpoint group.
  ///
  /// [dataflowEndpointGroupId]: ID of a dataflow endpoint group.
  Future<DataflowEndpointGroupIdResponse> deleteDataflowEndpointGroup(
      String dataflowEndpointGroupId) async {
    var response_ = await _client.send('DeleteDataflowEndpointGroup', {
      'dataflowEndpointGroupId': dataflowEndpointGroupId,
    });
    return DataflowEndpointGroupIdResponse.fromJson(response_);
  }

  /// Deletes a mission profile.
  ///
  /// [missionProfileId]: UUID of a mission profile.
  Future<MissionProfileIdResponse> deleteMissionProfile(
      String missionProfileId) async {
    var response_ = await _client.send('DeleteMissionProfile', {
      'missionProfileId': missionProfileId,
    });
    return MissionProfileIdResponse.fromJson(response_);
  }

  /// Describes an existing contact.
  ///
  /// [contactId]: UUID of a contact.
  Future<DescribeContactResponse> describeContact(String contactId) async {
    var response_ = await _client.send('DescribeContact', {
      'contactId': contactId,
    });
    return DescribeContactResponse.fromJson(response_);
  }

  /// Returns `Config` information.
  ///
  /// Only one `Config` response can be returned.
  ///
  /// [configId]: UUID of a `Config`.
  ///
  /// [configType]: Type of a `Config`.
  Future<GetConfigResponse> getConfig(
      {@required String configId, @required String configType}) async {
    var response_ = await _client.send('GetConfig', {
      'configId': configId,
      'configType': configType,
    });
    return GetConfigResponse.fromJson(response_);
  }

  /// Returns the dataflow endpoint group.
  ///
  /// [dataflowEndpointGroupId]: UUID of a dataflow endpoint group.
  Future<GetDataflowEndpointGroupResponse> getDataflowEndpointGroup(
      String dataflowEndpointGroupId) async {
    var response_ = await _client.send('GetDataflowEndpointGroup', {
      'dataflowEndpointGroupId': dataflowEndpointGroupId,
    });
    return GetDataflowEndpointGroupResponse.fromJson(response_);
  }

  /// Returns a mission profile.
  ///
  /// [missionProfileId]: UUID of a mission profile.
  Future<GetMissionProfileResponse> getMissionProfile(
      String missionProfileId) async {
    var response_ = await _client.send('GetMissionProfile', {
      'missionProfileId': missionProfileId,
    });
    return GetMissionProfileResponse.fromJson(response_);
  }

  /// Returns a list of `Config` objects.
  ///
  /// [maxResults]: Maximum number of `Configs` returned.
  ///
  /// [nextToken]: Next token returned in the request of a previous
  /// `ListConfigs` call. Used to get the next page of results.
  Future<ListConfigsResponse> listConfigs(
      {int maxResults, String nextToken}) async {
    var response_ = await _client.send('ListConfigs', {
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    });
    return ListConfigsResponse.fromJson(response_);
  }

  /// Returns a list of contacts.
  ///
  /// If `statusList` contains AVAILABLE, the request must include
  /// `groundstation`, `missionprofileArn`, and `satelliteArn`.
  ///
  /// [endTime]: End time of a contact.
  ///
  /// [groundStation]: Name of a ground station.
  ///
  /// [maxResults]: Maximum number of contacts returned.
  ///
  /// [missionProfileArn]: ARN of a mission profile.
  ///
  /// [nextToken]: Next token returned in the request of a previous
  /// `ListContacts` call. Used to get the next page of results.
  ///
  /// [satelliteArn]: ARN of a satellite.
  ///
  /// [startTime]: Start time of a contact.
  ///
  /// [statusList]: Status of a contact reservation.
  Future<ListContactsResponse> listContacts(
      {@required DateTime endTime,
      String groundStation,
      int maxResults,
      String missionProfileArn,
      String nextToken,
      String satelliteArn,
      @required DateTime startTime,
      @required List<String> statusList}) async {
    var response_ = await _client.send('ListContacts', {
      'endTime': endTime,
      if (groundStation != null) 'groundStation': groundStation,
      if (maxResults != null) 'maxResults': maxResults,
      if (missionProfileArn != null) 'missionProfileArn': missionProfileArn,
      if (nextToken != null) 'nextToken': nextToken,
      if (satelliteArn != null) 'satelliteArn': satelliteArn,
      'startTime': startTime,
      'statusList': statusList,
    });
    return ListContactsResponse.fromJson(response_);
  }

  /// Returns a list of `DataflowEndpoint` groups.
  ///
  /// [maxResults]: Maximum number of dataflow endpoint groups returned.
  ///
  /// [nextToken]: Next token returned in the request of a previous
  /// `ListDataflowEndpointGroups` call. Used to get the next page of results.
  Future<ListDataflowEndpointGroupsResponse> listDataflowEndpointGroups(
      {int maxResults, String nextToken}) async {
    var response_ = await _client.send('ListDataflowEndpointGroups', {
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    });
    return ListDataflowEndpointGroupsResponse.fromJson(response_);
  }

  /// Returns a list of mission profiles.
  ///
  /// [maxResults]: Maximum number of mission profiles returned.
  ///
  /// [nextToken]: Next token returned in the request of a previous
  /// `ListMissionProfiles` call. Used to get the next page of results.
  Future<ListMissionProfilesResponse> listMissionProfiles(
      {int maxResults, String nextToken}) async {
    var response_ = await _client.send('ListMissionProfiles', {
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    });
    return ListMissionProfilesResponse.fromJson(response_);
  }

  /// Reserves a contact using specified parameters.
  ///
  /// [endTime]: End time of a contact.
  ///
  /// [groundStation]: Name of a ground station.
  ///
  /// [missionProfileArn]: ARN of a mission profile.
  ///
  /// [satelliteArn]: ARN of a satellite
  ///
  /// [startTime]: Start time of a contact.
  ///
  /// [tags]: Tags assigned to a contact.
  Future<ContactIdResponse> reserveContact(
      {@required DateTime endTime,
      @required String groundStation,
      @required String missionProfileArn,
      @required String satelliteArn,
      @required DateTime startTime,
      Map<String, String> tags}) async {
    var response_ = await _client.send('ReserveContact', {
      'endTime': endTime,
      'groundStation': groundStation,
      'missionProfileArn': missionProfileArn,
      'satelliteArn': satelliteArn,
      'startTime': startTime,
      if (tags != null) 'tags': tags,
    });
    return ContactIdResponse.fromJson(response_);
  }

  /// Updates the `Config` used when scheduling contacts.
  ///
  /// Updating a `Config` will not update the execution parameters for existing
  /// future contacts scheduled with this `Config`.
  ///
  /// [configData]: Parameters for a `Config`.
  ///
  /// [configId]: UUID of a `Config`.
  ///
  /// [configType]: Type of a `Config`.
  ///
  /// [name]: Name of a `Config`.
  Future<ConfigIdResponse> updateConfig(
      {@required ConfigTypeData configData,
      @required String configId,
      @required String configType,
      @required String name}) async {
    var response_ = await _client.send('UpdateConfig', {
      'configData': configData,
      'configId': configId,
      'configType': configType,
      'name': name,
    });
    return ConfigIdResponse.fromJson(response_);
  }

  /// Updates a mission profile.
  ///
  /// Updating a mission profile will not update the execution parameters for
  /// existing future contacts.
  ///
  /// [contactPostPassDurationSeconds]: Amount of time after a contact ends that
  /// you’d like to receive a CloudWatch event indicating the pass has finished.
  ///
  /// [contactPrePassDurationSeconds]: Amount of time after a contact ends that
  /// you’d like to receive a CloudWatch event indicating the pass has finished.
  ///
  /// [dataflowEdges]: A list of lists of ARNs. Each list of ARNs is an edge,
  /// with a from `Config` and a to `Config`.
  ///
  /// [minimumViableContactDurationSeconds]: Smallest amount of time in seconds
  /// that you’d like to see for an available contact. AWS Ground Station will
  /// not present you with contacts shorter than this duration.
  ///
  /// [missionProfileId]: ID of a mission profile.
  ///
  /// [name]: Name of a mission profile.
  ///
  /// [trackingConfigArn]: ARN of a tracking `Config`.
  Future<MissionProfileIdResponse> updateMissionProfile(String missionProfileId,
      {int contactPostPassDurationSeconds,
      int contactPrePassDurationSeconds,
      List<List<String>> dataflowEdges,
      int minimumViableContactDurationSeconds,
      String name,
      String trackingConfigArn}) async {
    var response_ = await _client.send('UpdateMissionProfile', {
      if (contactPostPassDurationSeconds != null)
        'contactPostPassDurationSeconds': contactPostPassDurationSeconds,
      if (contactPrePassDurationSeconds != null)
        'contactPrePassDurationSeconds': contactPrePassDurationSeconds,
      if (dataflowEdges != null) 'dataflowEdges': dataflowEdges,
      if (minimumViableContactDurationSeconds != null)
        'minimumViableContactDurationSeconds':
            minimumViableContactDurationSeconds,
      'missionProfileId': missionProfileId,
      if (name != null) 'name': name,
      if (trackingConfigArn != null) 'trackingConfigArn': trackingConfigArn,
    });
    return MissionProfileIdResponse.fromJson(response_);
  }

  /// Returns the number of minutes used by account.
  ///
  /// [month]: The month being requested, with a value of 1-12.
  ///
  /// [year]: The year being requested, in the format of YYYY.
  Future<GetMinuteUsageResponse> getMinuteUsage(
      {@required int month, @required int year}) async {
    var response_ = await _client.send('GetMinuteUsage', {
      'month': month,
      'year': year,
    });
    return GetMinuteUsageResponse.fromJson(response_);
  }

  /// Returns a satellite.
  ///
  /// [satelliteId]: UUID of a satellite.
  Future<GetSatelliteResponse> getSatellite(String satelliteId) async {
    var response_ = await _client.send('GetSatellite', {
      'satelliteId': satelliteId,
    });
    return GetSatelliteResponse.fromJson(response_);
  }

  /// Returns a list of ground stations.
  ///
  /// [maxResults]: Maximum number of ground stations returned.
  ///
  /// [nextToken]: Next token that can be supplied in the next call to get the
  /// next page of ground stations.
  Future<ListGroundStationsResponse> listGroundStations(
      {int maxResults, String nextToken}) async {
    var response_ = await _client.send('ListGroundStations', {
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    });
    return ListGroundStationsResponse.fromJson(response_);
  }

  /// Returns a list of satellites.
  ///
  /// [maxResults]: Maximum number of satellites returned.
  ///
  /// [nextToken]: Next token that can be supplied in the next call to get the
  /// next page of satellites.
  Future<ListSatellitesResponse> listSatellites(
      {int maxResults, String nextToken}) async {
    var response_ = await _client.send('ListSatellites', {
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    });
    return ListSatellitesResponse.fromJson(response_);
  }

  /// Returns a list of tags or a specified resource.
  ///
  /// [resourceArn]: ARN of a resource.
  Future<ListTagsForResourceResponse> listTagsForResource(
      String resourceArn) async {
    var response_ = await _client.send('ListTagsForResource', {
      'resourceArn': resourceArn,
    });
    return ListTagsForResourceResponse.fromJson(response_);
  }

  /// Assigns a tag to a resource.
  ///
  /// [resourceArn]: ARN of a resource tag.
  ///
  /// [tags]: Tags assigned to a resource.
  Future<TagResourceResponse> tagResource(String resourceArn,
      {Map<String, String> tags}) async {
    var response_ = await _client.send('TagResource', {
      'resourceArn': resourceArn,
      if (tags != null) 'tags': tags,
    });
    return TagResourceResponse.fromJson(response_);
  }

  /// Deassigns a resource tag.
  ///
  /// [resourceArn]: ARN of a resource.
  ///
  /// [tagKeys]: Keys of a resource tag.
  Future<UntagResourceResponse> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {
    var response_ = await _client.send('UntagResource', {
      'resourceArn': resourceArn,
      'tagKeys': tagKeys,
    });
    return UntagResourceResponse.fromJson(response_);
  }
}

/// Object containing the parameters for a `Config`.
///
/// See the subtype definitions for what each type of `Config` contains.
class ConfigTypeData {
  /// Information about how AWS Ground Station should configure an antenna for
  /// downlink during a contact.
  final AntennaDownlinkConfig antennaDownlinkConfig;

  /// Information about how AWS Ground Station should conﬁgure an antenna for
  /// downlink demod decode during a contact.
  final AntennaDownlinkDemodDecodeConfig antennaDownlinkDemodDecodeConfig;

  /// Information about how AWS Ground Station should conﬁgure an antenna for
  /// uplink during a contact.
  final AntennaUplinkConfig antennaUplinkConfig;

  /// Information about the dataflow endpoint `Config`.
  final DataflowEndpointConfig dataflowEndpointConfig;

  /// Object that determines whether tracking should be used during a contact
  /// executed with this `Config` in the mission profile.
  final TrackingConfig trackingConfig;

  /// Information about an uplink echo `Config`.
  ///
  /// Parameters from the `AntennaUplinkConfig`, corresponding to the specified
  /// `AntennaUplinkConfigArn`, are used when this `UplinkEchoConfig` is used in
  /// a contact.
  final UplinkEchoConfig uplinkEchoConfig;

  ConfigTypeData({
    this.antennaDownlinkConfig,
    this.antennaDownlinkDemodDecodeConfig,
    this.antennaUplinkConfig,
    this.dataflowEndpointConfig,
    this.trackingConfig,
    this.uplinkEchoConfig,
  });
  static ConfigTypeData fromJson(Map<String, dynamic> json) => ConfigTypeData(
        antennaDownlinkConfig: json.containsKey('antennaDownlinkConfig')
            ? AntennaDownlinkConfig.fromJson(json['antennaDownlinkConfig'])
            : null,
        antennaDownlinkDemodDecodeConfig:
            json.containsKey('antennaDownlinkDemodDecodeConfig')
                ? AntennaDownlinkDemodDecodeConfig.fromJson(
                    json['antennaDownlinkDemodDecodeConfig'])
                : null,
        antennaUplinkConfig: json.containsKey('antennaUplinkConfig')
            ? AntennaUplinkConfig.fromJson(json['antennaUplinkConfig'])
            : null,
        dataflowEndpointConfig: json.containsKey('dataflowEndpointConfig')
            ? DataflowEndpointConfig.fromJson(json['dataflowEndpointConfig'])
            : null,
        trackingConfig: json.containsKey('trackingConfig')
            ? TrackingConfig.fromJson(json['trackingConfig'])
            : null,
        uplinkEchoConfig: json.containsKey('uplinkEchoConfig')
            ? UplinkEchoConfig.fromJson(json['uplinkEchoConfig'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Information about the ground station data.
class GroundStationData {
  /// ID of a ground station.
  final String groundStationId;

  /// Name of a ground station.
  final String groundStationName;

  /// Ground station Region.
  final String region;

  GroundStationData({
    this.groundStationId,
    this.groundStationName,
    this.region,
  });
  static GroundStationData fromJson(Map<String, dynamic> json) =>
      GroundStationData(
        groundStationId: json.containsKey('groundStationId')
            ? json['groundStationId'] as String
            : null,
        groundStationName: json.containsKey('groundStationName')
            ? json['groundStationName'] as String
            : null,
        region: json.containsKey('region') ? json['region'] as String : null,
      );
}

/// Information about the endpoint details.
class EndpointDetails {
  /// A dataflow endpoint.
  final DataflowEndpoint endpoint;

  /// Endpoint security details.
  final SecurityDetails securityDetails;

  EndpointDetails({
    this.endpoint,
    this.securityDetails,
  });
  static EndpointDetails fromJson(Map<String, dynamic> json) => EndpointDetails(
        endpoint: json.containsKey('endpoint')
            ? DataflowEndpoint.fromJson(json['endpoint'])
            : null,
        securityDetails: json.containsKey('securityDetails')
            ? SecurityDetails.fromJson(json['securityDetails'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class GetMinuteUsageResponse {
  /// Estimated number of minutes remaining for an account, specific to the
  /// month being requested.
  final int estimatedMinutesRemaining;

  /// Returns whether or not an account has signed up for the reserved minutes
  /// pricing plan, specific to the month being requested.
  final bool isReservedMinutesCustomer;

  /// Total number of reserved minutes allocated, specific to the month being
  /// requested.
  final int totalReservedMinuteAllocation;

  /// Total scheduled minutes for an account, specific to the month being
  /// requested.
  final int totalScheduledMinutes;

  /// Upcoming minutes scheduled for an account, specific to the month being
  /// requested.
  final int upcomingMinutesScheduled;

  GetMinuteUsageResponse({
    this.estimatedMinutesRemaining,
    this.isReservedMinutesCustomer,
    this.totalReservedMinuteAllocation,
    this.totalScheduledMinutes,
    this.upcomingMinutesScheduled,
  });
  static GetMinuteUsageResponse fromJson(Map<String, dynamic> json) =>
      GetMinuteUsageResponse(
        estimatedMinutesRemaining: json.containsKey('estimatedMinutesRemaining')
            ? json['estimatedMinutesRemaining'] as int
            : null,
        isReservedMinutesCustomer: json.containsKey('isReservedMinutesCustomer')
            ? json['isReservedMinutesCustomer'] as bool
            : null,
        totalReservedMinuteAllocation:
            json.containsKey('totalReservedMinuteAllocation')
                ? json['totalReservedMinuteAllocation'] as int
                : null,
        totalScheduledMinutes: json.containsKey('totalScheduledMinutes')
            ? json['totalScheduledMinutes'] as int
            : null,
        upcomingMinutesScheduled: json.containsKey('upcomingMinutesScheduled')
            ? json['upcomingMinutesScheduled'] as int
            : null,
      );
}

/// Item in a list of mission profiles.
class MissionProfileListItem {
  /// ARN of a mission profile.
  final String missionProfileArn;

  /// ID of a mission profile.
  final String missionProfileId;

  /// Name of a mission profile.
  final String name;

  /// Region of a mission profile.
  final String region;

  MissionProfileListItem({
    this.missionProfileArn,
    this.missionProfileId,
    this.name,
    this.region,
  });
  static MissionProfileListItem fromJson(Map<String, dynamic> json) =>
      MissionProfileListItem(
        missionProfileArn: json.containsKey('missionProfileArn')
            ? json['missionProfileArn'] as String
            : null,
        missionProfileId: json.containsKey('missionProfileId')
            ? json['missionProfileId'] as String
            : null,
        name: json.containsKey('name') ? json['name'] as String : null,
        region: json.containsKey('region') ? json['region'] as String : null,
      );
}

class ListDataflowEndpointGroupsResponse {
  /// A list of dataflow endpoint groups.
  final List<DataflowEndpointListItem> dataflowEndpointGroupList;

  /// Next token returned in the response of a previous
  /// `ListDataflowEndpointGroups` call. Used to get the next page of results.
  final String nextToken;

  ListDataflowEndpointGroupsResponse({
    this.dataflowEndpointGroupList,
    this.nextToken,
  });
  static ListDataflowEndpointGroupsResponse fromJson(
          Map<String, dynamic> json) =>
      ListDataflowEndpointGroupsResponse(
        dataflowEndpointGroupList: json.containsKey('dataflowEndpointGroupList')
            ? (json['dataflowEndpointGroupList'] as List)
                .map((e) => DataflowEndpointListItem.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

/// Information about how AWS Ground Station should conﬁgure an antenna for
/// downlink demod decode during a contact.
class AntennaDownlinkDemodDecodeConfig {
  /// Information about the decode `Config`.
  final DecodeConfig decodeConfig;

  /// Information about the demodulation `Config`.
  final DemodulationConfig demodulationConfig;

  /// Information about the spectral `Config`.
  final SpectrumConfig spectrumConfig;

  AntennaDownlinkDemodDecodeConfig({
    @required this.decodeConfig,
    @required this.demodulationConfig,
    @required this.spectrumConfig,
  });
  static AntennaDownlinkDemodDecodeConfig fromJson(Map<String, dynamic> json) =>
      AntennaDownlinkDemodDecodeConfig(
        decodeConfig: DecodeConfig.fromJson(json['decodeConfig']),
        demodulationConfig:
            DemodulationConfig.fromJson(json['demodulationConfig']),
        spectrumConfig: SpectrumConfig.fromJson(json['spectrumConfig']),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class MissionProfileIdResponse {
  /// ID of a mission profile.
  final String missionProfileId;

  MissionProfileIdResponse({
    this.missionProfileId,
  });
  static MissionProfileIdResponse fromJson(Map<String, dynamic> json) =>
      MissionProfileIdResponse(
        missionProfileId: json.containsKey('missionProfileId')
            ? json['missionProfileId'] as String
            : null,
      );
}

/// Information about the uplink `Config` of an antenna.
class AntennaUplinkConfig {
  /// Information about the uplink spectral `Config`.
  final UplinkSpectrumConfig spectrumConfig;

  /// EIRP of the target.
  final Eirp targetEirp;

  AntennaUplinkConfig({
    @required this.spectrumConfig,
    @required this.targetEirp,
  });
  static AntennaUplinkConfig fromJson(Map<String, dynamic> json) =>
      AntennaUplinkConfig(
        spectrumConfig: UplinkSpectrumConfig.fromJson(json['spectrumConfig']),
        targetEirp: Eirp.fromJson(json['targetEirp']),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Information about how AWS Ground Station should configure an antenna for
/// downlink during a contact.
class AntennaDownlinkConfig {
  /// Object that describes a spectral `Config`.
  final SpectrumConfig spectrumConfig;

  AntennaDownlinkConfig({
    @required this.spectrumConfig,
  });
  static AntennaDownlinkConfig fromJson(Map<String, dynamic> json) =>
      AntennaDownlinkConfig(
        spectrumConfig: SpectrumConfig.fromJson(json['spectrumConfig']),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Information about an uplink echo `Config`.
///
/// Parameters from the `AntennaUplinkConfig`, corresponding to the specified
/// `AntennaUplinkConfigArn`, are used when this `UplinkEchoConfig` is used in a
/// contact.
class UplinkEchoConfig {
  /// ARN of an uplink `Config`.
  final String antennaUplinkConfigArn;

  /// Whether or not an uplink `Config` is enabled.
  final bool enabled;

  UplinkEchoConfig({
    @required this.antennaUplinkConfigArn,
    @required this.enabled,
  });
  static UplinkEchoConfig fromJson(Map<String, dynamic> json) =>
      UplinkEchoConfig(
        antennaUplinkConfigArn: json['antennaUplinkConfigArn'] as String,
        enabled: json['enabled'] as bool,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Information about the decode `Config`.
class DecodeConfig {
  /// Unvalidated JSON of a decode `Config`.
  final String unvalidatedJson;

  DecodeConfig({
    @required this.unvalidatedJson,
  });
  static DecodeConfig fromJson(Map<String, dynamic> json) => DecodeConfig(
        unvalidatedJson: json['unvalidatedJSON'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Object that describes the frequency.
class Frequency {
  /// Frequency units.
  final String units;

  /// Frequency value.
  final double value;

  Frequency({
    @required this.units,
    @required this.value,
  });
  static Frequency fromJson(Map<String, dynamic> json) => Frequency(
        units: json['units'] as String,
        value: json['value'] as double,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class UntagResourceResponse {
  UntagResourceResponse();
  static UntagResourceResponse fromJson(Map<String, dynamic> json) =>
      UntagResourceResponse();
}

class ConfigIdResponse {
  /// ARN of a `Config`.
  final String configArn;

  /// UUID of a `Config`.
  final String configId;

  /// Type of a `Config`.
  final String configType;

  ConfigIdResponse({
    this.configArn,
    this.configId,
    this.configType,
  });
  static ConfigIdResponse fromJson(Map<String, dynamic> json) =>
      ConfigIdResponse(
        configArn:
            json.containsKey('configArn') ? json['configArn'] as String : null,
        configId:
            json.containsKey('configId') ? json['configId'] as String : null,
        configType: json.containsKey('configType')
            ? json['configType'] as String
            : null,
      );
}

/// Information about endpoints.
class SecurityDetails {
  /// ARN to a role needed for connecting streams to your instances.
  final String roleArn;

  /// The security groups to attach to the elastic network interfaces.
  final List<String> securityGroupIds;

  /// A list of subnets where AWS Ground Station places elastic network
  /// interfaces to send streams to your instances.
  final List<String> subnetIds;

  SecurityDetails({
    @required this.roleArn,
    @required this.securityGroupIds,
    @required this.subnetIds,
  });
  static SecurityDetails fromJson(Map<String, dynamic> json) => SecurityDetails(
        roleArn: json['roleArn'] as String,
        securityGroupIds:
            (json['securityGroupIds'] as List).map((e) => e as String).toList(),
        subnetIds: (json['subnetIds'] as List).map((e) => e as String).toList(),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Object that determines whether tracking should be used during a contact
/// executed with this `Config` in the mission profile.
class TrackingConfig {
  /// Current setting for autotrack.
  final String autotrack;

  TrackingConfig({
    @required this.autotrack,
  });
  static TrackingConfig fromJson(Map<String, dynamic> json) => TrackingConfig(
        autotrack: json['autotrack'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Elevation angle of the satellite in the sky during a contact.
class Elevation {
  /// Elevation angle units.
  final String unit;

  /// Elevation angle value.
  final double value;

  Elevation({
    @required this.unit,
    @required this.value,
  });
  static Elevation fromJson(Map<String, dynamic> json) => Elevation(
        unit: json['unit'] as String,
        value: json['value'] as double,
      );
}

/// Information about the uplink spectral `Config`.
class UplinkSpectrumConfig {
  /// Center frequency of an uplink spectral `Config`.
  final Frequency centerFrequency;

  /// Polarization of an uplink spectral `Config`.
  final String polarization;

  UplinkSpectrumConfig({
    @required this.centerFrequency,
    this.polarization,
  });
  static UplinkSpectrumConfig fromJson(Map<String, dynamic> json) =>
      UplinkSpectrumConfig(
        centerFrequency: Frequency.fromJson(json['centerFrequency']),
        polarization: json.containsKey('polarization')
            ? json['polarization'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class GetMissionProfileResponse {
  /// Amount of time after a contact ends that you’d like to receive a
  /// CloudWatch event indicating the pass has finished.
  final int contactPostPassDurationSeconds;

  /// Amount of time prior to contact start you’d like to receive a CloudWatch
  /// event indicating an upcoming pass.
  final int contactPrePassDurationSeconds;

  /// A list of lists of ARNs. Each list of ARNs is an edge, with a from
  /// `Config` and a to `Config`.
  final List<List<String>> dataflowEdges;

  /// Smallest amount of time in seconds that you’d like to see for an available
  /// contact. AWS Ground Station will not present you with contacts shorter
  /// than this duration.
  final int minimumViableContactDurationSeconds;

  /// ARN of a mission profile.
  final String missionProfileArn;

  /// ID of a mission profile.
  final String missionProfileId;

  /// Name of a mission profile.
  final String name;

  /// Region of a mission profile.
  final String region;

  /// Tags assigned to a mission profile.
  final Map<String, String> tags;

  /// ARN of a tracking `Config`.
  final String trackingConfigArn;

  GetMissionProfileResponse({
    this.contactPostPassDurationSeconds,
    this.contactPrePassDurationSeconds,
    this.dataflowEdges,
    this.minimumViableContactDurationSeconds,
    this.missionProfileArn,
    this.missionProfileId,
    this.name,
    this.region,
    this.tags,
    this.trackingConfigArn,
  });
  static GetMissionProfileResponse fromJson(Map<String, dynamic> json) =>
      GetMissionProfileResponse(
        contactPostPassDurationSeconds:
            json.containsKey('contactPostPassDurationSeconds')
                ? json['contactPostPassDurationSeconds'] as int
                : null,
        contactPrePassDurationSeconds:
            json.containsKey('contactPrePassDurationSeconds')
                ? json['contactPrePassDurationSeconds'] as int
                : null,
        dataflowEdges: json.containsKey('dataflowEdges')
            ? (json['dataflowEdges'] as List)
                .map((e) => (e as List).map((e) => e as String).toList())
                .toList()
            : null,
        minimumViableContactDurationSeconds:
            json.containsKey('minimumViableContactDurationSeconds')
                ? json['minimumViableContactDurationSeconds'] as int
                : null,
        missionProfileArn: json.containsKey('missionProfileArn')
            ? json['missionProfileArn'] as String
            : null,
        missionProfileId: json.containsKey('missionProfileId')
            ? json['missionProfileId'] as String
            : null,
        name: json.containsKey('name') ? json['name'] as String : null,
        region: json.containsKey('region') ? json['region'] as String : null,
        tags: json.containsKey('tags')
            ? (json['tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        trackingConfigArn: json.containsKey('trackingConfigArn')
            ? json['trackingConfigArn'] as String
            : null,
      );
}

class ContactIdResponse {
  /// UUID of a contact.
  final String contactId;

  ContactIdResponse({
    this.contactId,
  });
  static ContactIdResponse fromJson(Map<String, dynamic> json) =>
      ContactIdResponse(
        contactId:
            json.containsKey('contactId') ? json['contactId'] as String : null,
      );
}

/// Object that describes a spectral `Config`.
class SpectrumConfig {
  /// Bandwidth of a spectral `Config`.
  final FrequencyBandwidth bandwidth;

  /// Center frequency of a spectral `Config`.
  final Frequency centerFrequency;

  /// Polarization of a spectral `Config`.
  final String polarization;

  SpectrumConfig({
    @required this.bandwidth,
    @required this.centerFrequency,
    this.polarization,
  });
  static SpectrumConfig fromJson(Map<String, dynamic> json) => SpectrumConfig(
        bandwidth: FrequencyBandwidth.fromJson(json['bandwidth']),
        centerFrequency: Frequency.fromJson(json['centerFrequency']),
        polarization: json.containsKey('polarization')
            ? json['polarization'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Information about the demodulation `Config`.
class DemodulationConfig {
  /// Unvalidated JSON of a demodulation `Config`.
  final String unvalidatedJson;

  DemodulationConfig({
    @required this.unvalidatedJson,
  });
  static DemodulationConfig fromJson(Map<String, dynamic> json) =>
      DemodulationConfig(
        unvalidatedJson: json['unvalidatedJSON'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class ListMissionProfilesResponse {
  /// List of mission profiles
  final List<MissionProfileListItem> missionProfileList;

  /// Next token returned in the response of a previous `ListMissionProfiles`
  /// call. Used to get the next page of results.
  final String nextToken;

  ListMissionProfilesResponse({
    this.missionProfileList,
    this.nextToken,
  });
  static ListMissionProfilesResponse fromJson(Map<String, dynamic> json) =>
      ListMissionProfilesResponse(
        missionProfileList: json.containsKey('missionProfileList')
            ? (json['missionProfileList'] as List)
                .map((e) => MissionProfileListItem.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

class ListConfigsResponse {
  /// List of `Config` items.
  final List<ConfigListItem> configList;

  /// Next token returned in the response of a previous `ListConfigs` call. Used
  /// to get the next page of results.
  final String nextToken;

  ListConfigsResponse({
    this.configList,
    this.nextToken,
  });
  static ListConfigsResponse fromJson(Map<String, dynamic> json) =>
      ListConfigsResponse(
        configList: json.containsKey('configList')
            ? (json['configList'] as List)
                .map((e) => ConfigListItem.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

/// Object that represents EIRP.
class Eirp {
  /// Units of an EIRP.
  final String units;

  /// Value of an EIRP.
  final double value;

  Eirp({
    @required this.units,
    @required this.value,
  });
  static Eirp fromJson(Map<String, dynamic> json) => Eirp(
        units: json['units'] as String,
        value: json['value'] as double,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class GetSatelliteResponse {
  /// When a satellite was created.
  final DateTime dateCreated;

  /// When a satellite was last updated.
  final DateTime lastUpdated;

  /// NORAD satellite ID number.
  final int noradSatelliteID;

  /// ARN of a satellite.
  final String satelliteArn;

  /// UUID of a satellite.
  final String satelliteId;

  /// Tags assigned to a satellite.
  final Map<String, String> tags;

  GetSatelliteResponse({
    this.dateCreated,
    this.lastUpdated,
    this.noradSatelliteID,
    this.satelliteArn,
    this.satelliteId,
    this.tags,
  });
  static GetSatelliteResponse fromJson(Map<String, dynamic> json) =>
      GetSatelliteResponse(
        dateCreated: json.containsKey('dateCreated')
            ? DateTime.parse(json['dateCreated'])
            : null,
        lastUpdated: json.containsKey('lastUpdated')
            ? DateTime.parse(json['lastUpdated'])
            : null,
        noradSatelliteID: json.containsKey('noradSatelliteID')
            ? json['noradSatelliteID'] as int
            : null,
        satelliteArn: json.containsKey('satelliteArn')
            ? json['satelliteArn'] as String
            : null,
        satelliteId: json.containsKey('satelliteId')
            ? json['satelliteId'] as String
            : null,
        tags: json.containsKey('tags')
            ? (json['tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

/// Data describing a contact.
class ContactData {
  /// UUID of a contact.
  final String contactId;

  /// Status of a contact.
  final String contactStatus;

  /// End time of a contact.
  final DateTime endTime;

  /// Error message of a contact.
  final String errorMessage;

  /// Name of a ground station.
  final String groundStation;

  /// Maximum elevation angle of a contact.
  final Elevation maximumElevation;

  /// ARN of a mission profile.
  final String missionProfileArn;

  /// Amount of time after a contact ends that you’d like to receive a
  /// CloudWatch event indicating the pass has finished.
  final DateTime postPassEndTime;

  /// Amount of time prior to contact start you’d like to receive a CloudWatch
  /// event indicating an upcoming pass.
  final DateTime prePassStartTime;

  /// ARN of a satellite.
  final String satelliteArn;

  /// Start time of a contact.
  final DateTime startTime;

  /// Tags assigned to a contact.
  final Map<String, String> tags;

  ContactData({
    this.contactId,
    this.contactStatus,
    this.endTime,
    this.errorMessage,
    this.groundStation,
    this.maximumElevation,
    this.missionProfileArn,
    this.postPassEndTime,
    this.prePassStartTime,
    this.satelliteArn,
    this.startTime,
    this.tags,
  });
  static ContactData fromJson(Map<String, dynamic> json) => ContactData(
        contactId:
            json.containsKey('contactId') ? json['contactId'] as String : null,
        contactStatus: json.containsKey('contactStatus')
            ? json['contactStatus'] as String
            : null,
        endTime: json.containsKey('endTime')
            ? DateTime.parse(json['endTime'])
            : null,
        errorMessage: json.containsKey('errorMessage')
            ? json['errorMessage'] as String
            : null,
        groundStation: json.containsKey('groundStation')
            ? json['groundStation'] as String
            : null,
        maximumElevation: json.containsKey('maximumElevation')
            ? Elevation.fromJson(json['maximumElevation'])
            : null,
        missionProfileArn: json.containsKey('missionProfileArn')
            ? json['missionProfileArn'] as String
            : null,
        postPassEndTime: json.containsKey('postPassEndTime')
            ? DateTime.parse(json['postPassEndTime'])
            : null,
        prePassStartTime: json.containsKey('prePassStartTime')
            ? DateTime.parse(json['prePassStartTime'])
            : null,
        satelliteArn: json.containsKey('satelliteArn')
            ? json['satelliteArn'] as String
            : null,
        startTime: json.containsKey('startTime')
            ? DateTime.parse(json['startTime'])
            : null,
        tags: json.containsKey('tags')
            ? (json['tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

class ListGroundStationsResponse {
  /// List of ground stations.
  final List<GroundStationData> groundStationList;

  /// Next token that can be supplied in the next call to get the next page of
  /// ground stations.
  final String nextToken;

  ListGroundStationsResponse({
    this.groundStationList,
    this.nextToken,
  });
  static ListGroundStationsResponse fromJson(Map<String, dynamic> json) =>
      ListGroundStationsResponse(
        groundStationList: json.containsKey('groundStationList')
            ? (json['groundStationList'] as List)
                .map((e) => GroundStationData.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

/// Information about a dataflow endpoint.
class DataflowEndpoint {
  /// Socket address of a dataflow endpoint.
  final SocketAddress address;

  /// Name of a dataflow endpoint.
  final String name;

  /// Status of a dataflow endpoint.
  final String status;

  DataflowEndpoint({
    this.address,
    this.name,
    this.status,
  });
  static DataflowEndpoint fromJson(Map<String, dynamic> json) =>
      DataflowEndpoint(
        address: json.containsKey('address')
            ? SocketAddress.fromJson(json['address'])
            : null,
        name: json.containsKey('name') ? json['name'] as String : null,
        status: json.containsKey('status') ? json['status'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Information about the socket address.
class SocketAddress {
  /// Name of a socket address.
  final String name;

  /// Port of a socket address.
  final int port;

  SocketAddress({
    @required this.name,
    @required this.port,
  });
  static SocketAddress fromJson(Map<String, dynamic> json) => SocketAddress(
        name: json['name'] as String,
        port: json['port'] as int,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class GetConfigResponse {
  /// ARN of a `Config`
  final String configArn;

  /// Data elements in a `Config`.
  final ConfigTypeData configData;

  /// UUID of a `Config`.
  final String configId;

  /// Type of a `Config`.
  final String configType;

  /// Name of a `Config`.
  final String name;

  /// Tags assigned to a `Config`.
  final Map<String, String> tags;

  GetConfigResponse({
    @required this.configArn,
    @required this.configData,
    @required this.configId,
    this.configType,
    @required this.name,
    this.tags,
  });
  static GetConfigResponse fromJson(Map<String, dynamic> json) =>
      GetConfigResponse(
        configArn: json['configArn'] as String,
        configData: ConfigTypeData.fromJson(json['configData']),
        configId: json['configId'] as String,
        configType: json.containsKey('configType')
            ? json['configType'] as String
            : null,
        name: json['name'] as String,
        tags: json.containsKey('tags')
            ? (json['tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

class TagResourceResponse {
  TagResourceResponse();
  static TagResourceResponse fromJson(Map<String, dynamic> json) =>
      TagResourceResponse();
}

/// Item in a list of satellites.
class SatelliteListItem {
  /// NORAD satellite ID number.
  final int noradSatelliteID;

  /// ARN of a satellite.
  final String satelliteArn;

  /// ID of a satellite.
  final String satelliteId;

  SatelliteListItem({
    this.noradSatelliteID,
    this.satelliteArn,
    this.satelliteId,
  });
  static SatelliteListItem fromJson(Map<String, dynamic> json) =>
      SatelliteListItem(
        noradSatelliteID: json.containsKey('noradSatelliteID')
            ? json['noradSatelliteID'] as int
            : null,
        satelliteArn: json.containsKey('satelliteArn')
            ? json['satelliteArn'] as String
            : null,
        satelliteId: json.containsKey('satelliteId')
            ? json['satelliteId'] as String
            : null,
      );
}

class ListSatellitesResponse {
  /// Next token that can be supplied in the next call to get the next page of
  /// satellites.
  final String nextToken;

  /// List of satellites.
  final List<SatelliteListItem> satellites;

  ListSatellitesResponse({
    this.nextToken,
    this.satellites,
  });
  static ListSatellitesResponse fromJson(Map<String, dynamic> json) =>
      ListSatellitesResponse(
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
        satellites: json.containsKey('satellites')
            ? (json['satellites'] as List)
                .map((e) => SatelliteListItem.fromJson(e))
                .toList()
            : null,
      );
}

/// Information about the dataflow endpoint `Config`.
class DataflowEndpointConfig {
  /// Name of a dataflow endpoint.
  final String dataflowEndpointName;

  DataflowEndpointConfig({
    @required this.dataflowEndpointName,
  });
  static DataflowEndpointConfig fromJson(Map<String, dynamic> json) =>
      DataflowEndpointConfig(
        dataflowEndpointName: json['dataflowEndpointName'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class ListTagsForResourceResponse {
  /// Tags assigned to a resource.
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  static ListTagsForResourceResponse fromJson(Map<String, dynamic> json) =>
      ListTagsForResourceResponse(
        tags: json.containsKey('tags')
            ? (json['tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

class ListContactsResponse {
  /// List of contacts.
  final List<ContactData> contactList;

  /// Next token returned in the response of a previous `ListContacts` call.
  /// Used to get the next page of results.
  final String nextToken;

  ListContactsResponse({
    this.contactList,
    this.nextToken,
  });
  static ListContactsResponse fromJson(Map<String, dynamic> json) =>
      ListContactsResponse(
        contactList: json.containsKey('contactList')
            ? (json['contactList'] as List)
                .map((e) => ContactData.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

class DescribeContactResponse {
  /// UUID of a contact.
  final String contactId;

  /// Status of a contact.
  final String contactStatus;

  /// End time of a contact.
  final DateTime endTime;

  /// Error message for a contact.
  final String errorMessage;

  /// Ground station for a contact.
  final String groundStation;

  /// Maximum elevation angle of a contact.
  final Elevation maximumElevation;

  /// ARN of a mission profile.
  final String missionProfileArn;

  /// Amount of time after a contact ends that you’d like to receive a
  /// CloudWatch event indicating the pass has finished.
  final DateTime postPassEndTime;

  /// Amount of time prior to contact start you’d like to receive a CloudWatch
  /// event indicating an upcoming pass.
  final DateTime prePassStartTime;

  /// ARN of a satellite.
  final String satelliteArn;

  /// Start time of a contact.
  final DateTime startTime;

  /// Tags assigned to a contact.
  final Map<String, String> tags;

  DescribeContactResponse({
    this.contactId,
    this.contactStatus,
    this.endTime,
    this.errorMessage,
    this.groundStation,
    this.maximumElevation,
    this.missionProfileArn,
    this.postPassEndTime,
    this.prePassStartTime,
    this.satelliteArn,
    this.startTime,
    this.tags,
  });
  static DescribeContactResponse fromJson(Map<String, dynamic> json) =>
      DescribeContactResponse(
        contactId:
            json.containsKey('contactId') ? json['contactId'] as String : null,
        contactStatus: json.containsKey('contactStatus')
            ? json['contactStatus'] as String
            : null,
        endTime: json.containsKey('endTime')
            ? DateTime.parse(json['endTime'])
            : null,
        errorMessage: json.containsKey('errorMessage')
            ? json['errorMessage'] as String
            : null,
        groundStation: json.containsKey('groundStation')
            ? json['groundStation'] as String
            : null,
        maximumElevation: json.containsKey('maximumElevation')
            ? Elevation.fromJson(json['maximumElevation'])
            : null,
        missionProfileArn: json.containsKey('missionProfileArn')
            ? json['missionProfileArn'] as String
            : null,
        postPassEndTime: json.containsKey('postPassEndTime')
            ? DateTime.parse(json['postPassEndTime'])
            : null,
        prePassStartTime: json.containsKey('prePassStartTime')
            ? DateTime.parse(json['prePassStartTime'])
            : null,
        satelliteArn: json.containsKey('satelliteArn')
            ? json['satelliteArn'] as String
            : null,
        startTime: json.containsKey('startTime')
            ? DateTime.parse(json['startTime'])
            : null,
        tags: json.containsKey('tags')
            ? (json['tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

/// An item in a list of `Config` objects.
class ConfigListItem {
  /// ARN of a `Config`.
  final String configArn;

  /// UUID of a `Config`.
  final String configId;

  /// Type of a `Config`.
  final String configType;

  /// Name of a `Config`.
  final String name;

  ConfigListItem({
    this.configArn,
    this.configId,
    this.configType,
    this.name,
  });
  static ConfigListItem fromJson(Map<String, dynamic> json) => ConfigListItem(
        configArn:
            json.containsKey('configArn') ? json['configArn'] as String : null,
        configId:
            json.containsKey('configId') ? json['configId'] as String : null,
        configType: json.containsKey('configType')
            ? json['configType'] as String
            : null,
        name: json.containsKey('name') ? json['name'] as String : null,
      );
}

/// Object that describes the frequency bandwidth.
class FrequencyBandwidth {
  /// Frequency bandwidth units.
  final String units;

  /// Frequency bandwidth value.
  final double value;

  FrequencyBandwidth({
    @required this.units,
    @required this.value,
  });
  static FrequencyBandwidth fromJson(Map<String, dynamic> json) =>
      FrequencyBandwidth(
        units: json['units'] as String,
        value: json['value'] as double,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Item in a list of `DataflowEndpoint` groups.
class DataflowEndpointListItem {
  /// ARN of a dataflow endpoint group.
  final String dataflowEndpointGroupArn;

  /// UUID of a dataflow endpoint group.
  final String dataflowEndpointGroupId;

  DataflowEndpointListItem({
    this.dataflowEndpointGroupArn,
    this.dataflowEndpointGroupId,
  });
  static DataflowEndpointListItem fromJson(Map<String, dynamic> json) =>
      DataflowEndpointListItem(
        dataflowEndpointGroupArn: json.containsKey('dataflowEndpointGroupArn')
            ? json['dataflowEndpointGroupArn'] as String
            : null,
        dataflowEndpointGroupId: json.containsKey('dataflowEndpointGroupId')
            ? json['dataflowEndpointGroupId'] as String
            : null,
      );
}

class GetDataflowEndpointGroupResponse {
  /// ARN of a dataflow endpoint group.
  final String dataflowEndpointGroupArn;

  /// UUID of a dataflow endpoint group.
  final String dataflowEndpointGroupId;

  /// Details of a dataflow endpoint.
  final List<EndpointDetails> endpointsDetails;

  /// Tags assigned to a dataflow endpoint group.
  final Map<String, String> tags;

  GetDataflowEndpointGroupResponse({
    this.dataflowEndpointGroupArn,
    this.dataflowEndpointGroupId,
    this.endpointsDetails,
    this.tags,
  });
  static GetDataflowEndpointGroupResponse fromJson(Map<String, dynamic> json) =>
      GetDataflowEndpointGroupResponse(
        dataflowEndpointGroupArn: json.containsKey('dataflowEndpointGroupArn')
            ? json['dataflowEndpointGroupArn'] as String
            : null,
        dataflowEndpointGroupId: json.containsKey('dataflowEndpointGroupId')
            ? json['dataflowEndpointGroupId'] as String
            : null,
        endpointsDetails: json.containsKey('endpointsDetails')
            ? (json['endpointsDetails'] as List)
                .map((e) => EndpointDetails.fromJson(e))
                .toList()
            : null,
        tags: json.containsKey('tags')
            ? (json['tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

class DataflowEndpointGroupIdResponse {
  /// ID of a dataflow endpoint group.
  final String dataflowEndpointGroupId;

  DataflowEndpointGroupIdResponse({
    this.dataflowEndpointGroupId,
  });
  static DataflowEndpointGroupIdResponse fromJson(Map<String, dynamic> json) =>
      DataflowEndpointGroupIdResponse(
        dataflowEndpointGroupId: json.containsKey('dataflowEndpointGroupId')
            ? json['dataflowEndpointGroupId'] as String
            : null,
      );
}
