import 'package:meta/meta.dart';

/// Use the AWS Elemental MediaTailor SDK to configure scalable ad insertion for
/// your live and VOD content. With AWS Elemental MediaTailor, you can serve
/// targeted ads to viewers while maintaining broadcast quality in over-the-top
/// (OTT) video applications. For information about using the service, including
/// detailed information about the settings covered in this guide, see the AWS
/// Elemental MediaTailor User Guide.
///
/// Through the SDK, you manage AWS Elemental MediaTailor configurations the
/// same as you do through the console. For example, you specify ad insertion
/// behavior and mapping information for the origin server and the ad decision
/// server (ADS).
class MediaTailorApi {
  /// Deletes the playback configuration for the specified name.
  Future<void> deletePlaybackConfiguration(String name) async {}

  /// Returns the playback configuration for the specified name.
  Future<void> getPlaybackConfiguration(String name) async {}

  /// Returns a list of the playback configurations defined in AWS Elemental
  /// MediaTailor. You can specify a maximum number of configurations to return
  /// at a time. The default maximum is 50. Results are returned in pagefuls. If
  /// MediaTailor has more configurations than the specified maximum, it
  /// provides parameters in the response that you can use to retrieve the next
  /// pageful.
  Future<void> listPlaybackConfigurations(
      {int maxResults, String nextToken}) async {}

  /// Returns a list of the tags assigned to the specified playback
  /// configuration resource.
  Future<void> listTagsForResource(String resourceArn) async {}

  /// Adds a new playback configuration to AWS Elemental MediaTailor.
  Future<void> putPlaybackConfiguration(
      {String adDecisionServerUrl,
      CdnConfiguration cdnConfiguration,
      DashConfigurationForPut dashConfiguration,
      String name,
      String slateAdUrl,
      Map<String, String> tags,
      String transcodeProfileName,
      String videoContentSourceUrl}) async {}

  /// Adds tags to the specified playback configuration resource. You can
  /// specify one or more tags to add.
  Future<void> tagResource(
      {@required String resourceArn,
      @required Map<String, String> tags}) async {}

  /// Removes tags from the specified playback configuration resource. You can
  /// specify one or more tags to remove.
  Future<void> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {}
}

class CdnConfiguration {}

class DashConfiguration {}

class DashConfigurationForPut {}

class DeletePlaybackConfigurationResponse {}

class GetPlaybackConfigurationResponse {}

class HlsConfiguration {}

class ListPlaybackConfigurationsResponse {}

class ListTagsForResourceResponse {}

class PlaybackConfiguration {}

class PutPlaybackConfigurationResponse {}
