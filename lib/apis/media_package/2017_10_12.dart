import 'package:meta/meta.dart';

/// AWS Elemental MediaPackage
class MediaPackageApi {
  /// Creates a new Channel.
  Future<void> createChannel(String id,
      {String description, Map<String, String> tags}) async {}

  /// Creates a new OriginEndpoint record.
  Future<void> createOriginEndpoint(
      {@required String channelId,
      CmafPackageCreateOrUpdateParameters cmafPackage,
      DashPackage dashPackage,
      String description,
      HlsPackage hlsPackage,
      @required String id,
      String manifestName,
      MssPackage mssPackage,
      int startoverWindowSeconds,
      Map<String, String> tags,
      int timeDelaySeconds,
      List<String> whitelist}) async {}

  /// Deletes an existing Channel.
  Future<void> deleteChannel(String id) async {}

  /// Deletes an existing OriginEndpoint.
  Future<void> deleteOriginEndpoint(String id) async {}

  /// Gets details about a Channel.
  Future<void> describeChannel(String id) async {}

  /// Gets details about an existing OriginEndpoint.
  Future<void> describeOriginEndpoint(String id) async {}

  /// Returns a collection of Channels.
  Future<void> listChannels({int maxResults, String nextToken}) async {}

  /// Returns a collection of OriginEndpoint records.
  Future<void> listOriginEndpoints(
      {String channelId, int maxResults, String nextToken}) async {}

  Future<void> listTagsForResource(String resourceArn) async {}

  /// Changes the Channel's first IngestEndpoint's username and password.
  /// WARNING - This API is deprecated. Please use
  /// RotateIngestEndpointCredentials instead
  Future<void> rotateChannelCredentials(String id) async {}

  /// Rotate the IngestEndpoint's username and password, as specified by the
  /// IngestEndpoint's id.
  Future<void> rotateIngestEndpointCredentials(
      {@required String id, @required String ingestEndpointId}) async {}

  Future<void> tagResource(
      {@required String resourceArn,
      @required Map<String, String> tags}) async {}

  Future<void> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {}

  /// Updates an existing Channel.
  Future<void> updateChannel(String id, {String description}) async {}

  /// Updates an existing OriginEndpoint.
  Future<void> updateOriginEndpoint(String id,
      {CmafPackageCreateOrUpdateParameters cmafPackage,
      DashPackage dashPackage,
      String description,
      HlsPackage hlsPackage,
      String manifestName,
      MssPackage mssPackage,
      int startoverWindowSeconds,
      int timeDelaySeconds,
      List<String> whitelist}) async {}
}

class Channel {}

class CmafEncryption {}

class CmafPackage {}

class CmafPackageCreateOrUpdateParameters {}

class CreateChannelResponse {}

class CreateOriginEndpointResponse {}

class DashEncryption {}

class DashPackage {}

class DeleteChannelResponse {}

class DeleteOriginEndpointResponse {}

class DescribeChannelResponse {}

class DescribeOriginEndpointResponse {}

class HlsEncryption {}

class HlsIngest {}

class HlsManifest {}

class HlsManifestCreateOrUpdateParameters {}

class HlsPackage {}

class IngestEndpoint {}

class ListChannelsResponse {}

class ListOriginEndpointsResponse {}

class ListTagsForResourceResponse {}

class MssEncryption {}

class MssPackage {}

class OriginEndpoint {}

class RotateChannelCredentialsResponse {}

class RotateIngestEndpointCredentialsResponse {}

class SpekeKeyProvider {}

class StreamSelection {}

class UpdateChannelResponse {}

class UpdateOriginEndpointResponse {}
