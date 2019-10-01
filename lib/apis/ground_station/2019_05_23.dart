import 'package:meta/meta.dart';

/// Welcome to the AWS Ground Station API Reference. AWS Ground Station is a
/// fully managed service that enables you to control satellite communications,
/// downlink and process satellite data, and scale your satellite operations
/// efficiently and cost-effectively without having to build or manage your own
/// ground station infrastructure.
class GroundStationApi {
  /// Cancels a contact with a specified contact ID.
  Future<void> cancelContact(String contactId) async {}

  /// Creates a `Config` with the specified `configData` parameters.
  ///
  /// Only one type of `configData` can be specified.
  Future<void> createConfig(
      {@required ConfigTypeData configData,
      @required String name,
      Map<String, String> tags}) async {}

  /// Creates a `DataflowEndpoint` group containing the specified list of
  /// `DataflowEndpoint` objects.
  ///
  /// The `name` field in each endpoint is used in your mission profile
  /// `DataflowEndpointConfig` to specify which endpoints to use during a
  /// contact.
  ///
  /// When a contact uses multiple `DataflowEndpointConfig` objects, each
  /// `Config` must match a `DataflowEndpoint` in the same group.
  Future<void> createDataflowEndpointGroup(
      List<EndpointDetails> endpointDetails,
      {Map<String, String> tags}) async {}

  /// Creates a mission profile.
  ///
  ///  `dataflowEdges` is a list of lists of strings. Each lower level list of
  /// strings has two elements: a _from ARN_ and a _to ARN_.
  Future<void> createMissionProfile(
      {int contactPostPassDurationSeconds,
      int contactPrePassDurationSeconds,
      @required List<List<String>> dataflowEdges,
      @required int minimumViableContactDurationSeconds,
      @required String name,
      Map<String, String> tags,
      @required String trackingConfigArn}) async {}

  /// Deletes a `Config`.
  Future<void> deleteConfig(
      {@required String configId, @required String configType}) async {}

  /// Deletes a dataflow endpoint group.
  Future<void> deleteDataflowEndpointGroup(
      String dataflowEndpointGroupId) async {}

  /// Deletes a mission profile.
  Future<void> deleteMissionProfile(String missionProfileId) async {}

  /// Describes an existing contact.
  Future<void> describeContact(String contactId) async {}

  /// Returns `Config` information.
  ///
  /// Only one `Config` response can be returned.
  Future<void> getConfig(
      {@required String configId, @required String configType}) async {}

  /// Returns the dataflow endpoint group.
  Future<void> getDataflowEndpointGroup(String dataflowEndpointGroupId) async {}

  /// Returns a mission profile.
  Future<void> getMissionProfile(String missionProfileId) async {}

  /// Returns a list of `Config` objects.
  Future<void> listConfigs({int maxResults, String nextToken}) async {}

  /// Returns a list of contacts.
  ///
  /// If `statusList` contains AVAILABLE, the request must include
  /// `groundstation`, `missionprofileArn`, and `satelliteArn`.
  Future<void> listContacts(
      {@required DateTime endTime,
      String groundStation,
      int maxResults,
      String missionProfileArn,
      String nextToken,
      String satelliteArn,
      @required DateTime startTime,
      @required List<String> statusList}) async {}

  /// Returns a list of `DataflowEndpoint` groups.
  Future<void> listDataflowEndpointGroups(
      {int maxResults, String nextToken}) async {}

  /// Returns a list of mission profiles.
  Future<void> listMissionProfiles({int maxResults, String nextToken}) async {}

  /// Reserves a contact using specified parameters.
  Future<void> reserveContact(
      {@required DateTime endTime,
      @required String groundStation,
      @required String missionProfileArn,
      @required String satelliteArn,
      @required DateTime startTime,
      Map<String, String> tags}) async {}

  /// Updates the `Config` used when scheduling contacts.
  ///
  /// Updating a `Config` will not update the execution parameters for existing
  /// future contacts scheduled with this `Config`.
  Future<void> updateConfig(
      {@required ConfigTypeData configData,
      @required String configId,
      @required String configType,
      @required String name}) async {}

  /// Updates a mission profile.
  ///
  /// Updating a mission profile will not update the execution parameters for
  /// existing future contacts.
  Future<void> updateMissionProfile(String missionProfileId,
      {int contactPostPassDurationSeconds,
      int contactPrePassDurationSeconds,
      List<List<String>> dataflowEdges,
      int minimumViableContactDurationSeconds,
      String name,
      String trackingConfigArn}) async {}

  /// Returns the number of minutes used by account.
  Future<void> getMinuteUsage(
      {@required int month, @required int year}) async {}

  /// Returns a satellite.
  Future<void> getSatellite(String satelliteId) async {}

  /// Returns a list of ground stations.
  Future<void> listGroundStations({int maxResults, String nextToken}) async {}

  /// Returns a list of satellites.
  Future<void> listSatellites({int maxResults, String nextToken}) async {}

  /// Returns a list of tags or a specified resource.
  Future<void> listTagsForResource(String resourceArn) async {}

  /// Assigns a tag to a resource.
  Future<void> tagResource(String resourceArn,
      {Map<String, String> tags}) async {}

  /// Deassigns a resource tag.
  Future<void> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {}
}

class ConfigTypeData {}

class GroundStationData {}

class EndpointDetails {}

class GetMinuteUsageResponse {}

class MissionProfileListItem {}

class ListDataflowEndpointGroupsResponse {}

class AntennaDownlinkDemodDecodeConfig {}

class MissionProfileIdResponse {}

class AntennaUplinkConfig {}

class AntennaDownlinkConfig {}

class UplinkEchoConfig {}

class DecodeConfig {}

class Frequency {}

class UntagResourceResponse {}

class ConfigIdResponse {}

class SecurityDetails {}

class TrackingConfig {}

class Elevation {}

class UplinkSpectrumConfig {}

class GetMissionProfileResponse {}

class ContactIdResponse {}

class SpectrumConfig {}

class DemodulationConfig {}

class ListMissionProfilesResponse {}

class ListConfigsResponse {}

class Eirp {}

class GetSatelliteResponse {}

class ContactData {}

class ListGroundStationsResponse {}

class DataflowEndpoint {}

class SocketAddress {}

class GetConfigResponse {}

class TagResourceResponse {}

class SatelliteListItem {}

class ListSatellitesResponse {}

class DataflowEndpointConfig {}

class ListTagsForResourceResponse {}

class ListContactsResponse {}

class DescribeContactResponse {}

class ConfigListItem {}

class FrequencyBandwidth {}

class DataflowEndpointListItem {}

class GetDataflowEndpointGroupResponse {}

class DataflowEndpointGroupIdResponse {}
