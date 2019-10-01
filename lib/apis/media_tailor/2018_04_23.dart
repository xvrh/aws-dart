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
  ///
  /// [name]: The identifier for the playback configuration.
  Future<DeletePlaybackConfigurationResponse> deletePlaybackConfiguration(
      String name) async {
    return DeletePlaybackConfigurationResponse.fromJson({});
  }

  /// Returns the playback configuration for the specified name.
  ///
  /// [name]: The identifier for the playback configuration.
  Future<GetPlaybackConfigurationResponse> getPlaybackConfiguration(
      String name) async {
    return GetPlaybackConfigurationResponse.fromJson({});
  }

  /// Returns a list of the playback configurations defined in AWS Elemental
  /// MediaTailor. You can specify a maximum number of configurations to return
  /// at a time. The default maximum is 50. Results are returned in pagefuls. If
  /// MediaTailor has more configurations than the specified maximum, it
  /// provides parameters in the response that you can use to retrieve the next
  /// pageful.
  ///
  /// [maxResults]: Maximum number of records to return.
  ///
  /// [nextToken]: Pagination token returned by the GET list request when
  /// results exceed the maximum allowed. Use the token to fetch the next page
  /// of results.
  Future<ListPlaybackConfigurationsResponse> listPlaybackConfigurations(
      {int maxResults, String nextToken}) async {
    return ListPlaybackConfigurationsResponse.fromJson({});
  }

  /// Returns a list of the tags assigned to the specified playback
  /// configuration resource.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) for the playback
  /// configuration. You can get this from the response to any playback
  /// configuration request.
  Future<ListTagsForResourceResponse> listTagsForResource(
      String resourceArn) async {
    return ListTagsForResourceResponse.fromJson({});
  }

  /// Adds a new playback configuration to AWS Elemental MediaTailor.
  ///
  /// [adDecisionServerUrl]: The URL for the ad decision server (ADS). This
  /// includes the specification of static parameters and placeholders for
  /// dynamic parameters. AWS Elemental MediaTailor substitutes player-specific
  /// and session-specific parameters as needed when calling the ADS.
  /// Alternately, for testing you can provide a static VAST URL. The maximum
  /// length is 25,000 characters.
  ///
  /// [cdnConfiguration]: The configuration for using a content delivery network
  /// (CDN), like Amazon CloudFront, for content and ad segment management.
  ///
  /// [dashConfiguration]: The configuration for DASH content.
  ///
  /// [name]: The identifier for the playback configuration.
  ///
  /// [slateAdUrl]: The URL for a high-quality video asset to transcode and use
  /// to fill in time that's not used by ads. AWS Elemental MediaTailor shows
  /// the slate to fill in gaps in media content. Configuring the slate is
  /// optional for non-VPAID configurations. For VPAID, the slate is required
  /// because MediaTailor provides it in the slots that are designated for
  /// dynamic ad content. The slate must be a high-quality asset that contains
  /// both audio and video.
  ///
  /// [tags]: The tags to assign to the playback configuration.
  ///
  /// [transcodeProfileName]: The name that is used to associate this playback
  /// configuration with a custom transcode profile. This overrides the dynamic
  /// transcoding defaults of MediaTailor. Use this only if you have already set
  /// up custom profiles with the help of AWS Support.
  ///
  /// [videoContentSourceUrl]: The URL prefix for the master playlist for the
  /// stream, minus the asset ID. The maximum length is 512 characters.
  Future<PutPlaybackConfigurationResponse> putPlaybackConfiguration(
      {String adDecisionServerUrl,
      CdnConfiguration cdnConfiguration,
      DashConfigurationForPut dashConfiguration,
      String name,
      String slateAdUrl,
      Map<String, String> tags,
      String transcodeProfileName,
      String videoContentSourceUrl}) async {
    return PutPlaybackConfigurationResponse.fromJson({});
  }

  /// Adds tags to the specified playback configuration resource. You can
  /// specify one or more tags to add.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) for the playback
  /// configuration. You can get this from the response to any playback
  /// configuration request.
  ///
  /// [tags]: A comma-separated list of tag key:value pairs. For example: {
  /// "Key1": "Value1", "Key2": "Value2" }
  Future<void> tagResource(
      {@required String resourceArn,
      @required Map<String, String> tags}) async {}

  /// Removes tags from the specified playback configuration resource. You can
  /// specify one or more tags to remove.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) for the playback
  /// configuration. You can get this from the response to any playback
  /// configuration request.
  ///
  /// [tagKeys]: A comma-separated list of the tag keys to remove from the
  /// playback configuration.
  Future<void> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {}
}

/// The configuration for using a content delivery network (CDN), like Amazon
/// CloudFront, for content and ad segment management.
class CdnConfiguration {
  /// A non-default content delivery network (CDN) to serve ad segments. By
  /// default, AWS Elemental MediaTailor uses Amazon CloudFront with default
  /// cache settings as its CDN for ad segments. To set up an alternate CDN,
  /// create a rule in your CDN for the following origin:
  /// ads.mediatailor.<region>.amazonaws.com. Then specify the rule's name in
  /// this AdSegmentUrlPrefix. When AWS Elemental MediaTailor serves a manifest,
  /// it reports your CDN as the source for ad segments.
  final String adSegmentUrlPrefix;

  /// A content delivery network (CDN) to cache content segments, so that
  /// content requests don’t always have to go to the origin server. First,
  /// create a rule in your CDN for the content segment origin server. Then
  /// specify the rule's name in this ContentSegmentUrlPrefix. When AWS
  /// Elemental MediaTailor serves a manifest, it reports your CDN as the source
  /// for content segments.
  final String contentSegmentUrlPrefix;

  CdnConfiguration({
    this.adSegmentUrlPrefix,
    this.contentSegmentUrlPrefix,
  });
  static CdnConfiguration fromJson(Map<String, dynamic> json) =>
      CdnConfiguration();
}

/// The configuration for DASH content.
class DashConfiguration {
  /// The URL generated by MediaTailor to initiate a playback session. The
  /// session uses server-side reporting. This setting is ignored in PUT
  /// operations.
  final String manifestEndpointPrefix;

  /// The setting that controls whether MediaTailor includes the Location tag in
  /// DASH manifests. MediaTailor populates the Location tag with the URL for
  /// manifest update requests, to be used by players that don't support sticky
  /// redirects. Disable this if you have CDN routing rules set up for accessing
  /// MediaTailor manifests, and you are either using client-side reporting or
  /// your players support sticky HTTP redirects. Valid values are DISABLED and
  /// EMT_DEFAULT. The EMT_DEFAULT setting enables the inclusion of the tag and
  /// is the default value.
  final String mpdLocation;

  /// The setting that controls whether MediaTailor handles manifests from the
  /// origin server as multi-period manifests or single-period manifests. If
  /// your origin server produces single-period manifests, set this to
  /// SINGLE_PERIOD. The default setting is MULTI_PERIOD. For multi-period
  /// manifests, omit this setting or set it to MULTI_PERIOD.
  final String originManifestType;

  DashConfiguration({
    this.manifestEndpointPrefix,
    this.mpdLocation,
    this.originManifestType,
  });
  static DashConfiguration fromJson(Map<String, dynamic> json) =>
      DashConfiguration();
}

/// The configuration for DASH PUT operations.
class DashConfigurationForPut {
  /// The setting that controls whether MediaTailor includes the Location tag in
  /// DASH manifests. MediaTailor populates the Location tag with the URL for
  /// manifest update requests, to be used by players that don't support sticky
  /// redirects. Disable this if you have CDN routing rules set up for accessing
  /// MediaTailor manifests, and you are either using client-side reporting or
  /// your players support sticky HTTP redirects. Valid values are DISABLED and
  /// EMT_DEFAULT. The EMT_DEFAULT setting enables the inclusion of the tag and
  /// is the default value.
  final String mpdLocation;

  /// The setting that controls whether MediaTailor handles manifests from the
  /// origin server as multi-period manifests or single-period manifests. If
  /// your origin server produces single-period manifests, set this to
  /// SINGLE_PERIOD. The default setting is MULTI_PERIOD. For multi-period
  /// manifests, omit this setting or set it to MULTI_PERIOD.
  final String originManifestType;

  DashConfigurationForPut({
    this.mpdLocation,
    this.originManifestType,
  });
}

class DeletePlaybackConfigurationResponse {
  DeletePlaybackConfigurationResponse();
  static DeletePlaybackConfigurationResponse fromJson(
          Map<String, dynamic> json) =>
      DeletePlaybackConfigurationResponse();
}

class GetPlaybackConfigurationResponse {
  /// The URL for the ad decision server (ADS). This includes the specification
  /// of static parameters and placeholders for dynamic parameters. AWS
  /// Elemental MediaTailor substitutes player-specific and session-specific
  /// parameters as needed when calling the ADS. Alternately, for testing, you
  /// can provide a static VAST URL. The maximum length is 25,000 characters.
  final String adDecisionServerUrl;

  /// The configuration for using a content delivery network (CDN), like Amazon
  /// CloudFront, for content and ad segment management.
  final CdnConfiguration cdnConfiguration;

  /// The configuration for DASH content.
  final DashConfiguration dashConfiguration;

  /// The configuration for HLS content.
  final HlsConfiguration hlsConfiguration;

  /// The identifier for the playback configuration.
  final String name;

  /// The Amazon Resource Name (ARN) for the playback configuration.
  final String playbackConfigurationArn;

  /// The URL that the player accesses to get a manifest from AWS Elemental
  /// MediaTailor. This session will use server-side reporting.
  final String playbackEndpointPrefix;

  /// The URL that the player uses to initialize a session that uses client-side
  /// reporting.
  final String sessionInitializationEndpointPrefix;

  /// The URL for a high-quality video asset to transcode and use to fill in
  /// time that's not used by ads. AWS Elemental MediaTailor shows the slate to
  /// fill in gaps in media content. Configuring the slate is optional for
  /// non-VPAID playback configurations. For VPAID, the slate is required
  /// because MediaTailor provides it in the slots designated for dynamic ad
  /// content. The slate must be a high-quality asset that contains both audio
  /// and video.
  final String slateAdUrl;

  /// The tags assigned to the playback configuration.
  final Map<String, String> tags;

  /// The name that is used to associate this playback configuration with a
  /// custom transcode profile. This overrides the dynamic transcoding defaults
  /// of MediaTailor. Use this only if you have already set up custom profiles
  /// with the help of AWS Support.
  final String transcodeProfileName;

  /// The URL prefix for the master playlist for the stream, minus the asset ID.
  /// The maximum length is 512 characters.
  final String videoContentSourceUrl;

  GetPlaybackConfigurationResponse({
    this.adDecisionServerUrl,
    this.cdnConfiguration,
    this.dashConfiguration,
    this.hlsConfiguration,
    this.name,
    this.playbackConfigurationArn,
    this.playbackEndpointPrefix,
    this.sessionInitializationEndpointPrefix,
    this.slateAdUrl,
    this.tags,
    this.transcodeProfileName,
    this.videoContentSourceUrl,
  });
  static GetPlaybackConfigurationResponse fromJson(Map<String, dynamic> json) =>
      GetPlaybackConfigurationResponse();
}

/// The configuration for HLS content.
class HlsConfiguration {
  /// The URL that is used to initiate a playback session for devices that
  /// support Apple HLS. The session uses server-side reporting.
  final String manifestEndpointPrefix;

  HlsConfiguration({
    this.manifestEndpointPrefix,
  });
  static HlsConfiguration fromJson(Map<String, dynamic> json) =>
      HlsConfiguration();
}

class ListPlaybackConfigurationsResponse {
  /// Array of playback configurations. This might be all the available
  /// configurations or a subset, depending on the settings that you provide and
  /// the total number of configurations stored.
  final List<PlaybackConfiguration> items;

  /// Pagination token returned by the GET list request when results exceed the
  /// maximum allowed. Use the token to fetch the next page of results.
  final String nextToken;

  ListPlaybackConfigurationsResponse({
    this.items,
    this.nextToken,
  });
  static ListPlaybackConfigurationsResponse fromJson(
          Map<String, dynamic> json) =>
      ListPlaybackConfigurationsResponse();
}

class ListTagsForResourceResponse {
  /// A comma-separated list of tag key:value pairs. For example: { "Key1":
  /// "Value1", "Key2": "Value2" }
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  static ListTagsForResourceResponse fromJson(Map<String, dynamic> json) =>
      ListTagsForResourceResponse();
}

/// The AWSMediaTailor configuration.
class PlaybackConfiguration {
  /// The URL for the ad decision server (ADS). This includes the specification
  /// of static parameters and placeholders for dynamic parameters. AWS
  /// Elemental MediaTailor substitutes player-specific and session-specific
  /// parameters as needed when calling the ADS. Alternately, for testing, you
  /// can provide a static VAST URL. The maximum length is 25,000 characters.
  final String adDecisionServerUrl;

  /// The configuration for using a content delivery network (CDN), like Amazon
  /// CloudFront, for content and ad segment management.
  final CdnConfiguration cdnConfiguration;

  /// The configuration for DASH content.
  final DashConfiguration dashConfiguration;

  /// The configuration for HLS content.
  final HlsConfiguration hlsConfiguration;

  /// The identifier for the playback configuration.
  final String name;

  /// The Amazon Resource Name (ARN) for the playback configuration.
  final String playbackConfigurationArn;

  /// The URL that the player accesses to get a manifest from AWS Elemental
  /// MediaTailor. This session will use server-side reporting.
  final String playbackEndpointPrefix;

  /// The URL that the player uses to initialize a session that uses client-side
  /// reporting.
  final String sessionInitializationEndpointPrefix;

  /// The URL for a high-quality video asset to transcode and use to fill in
  /// time that's not used by ads. AWS Elemental MediaTailor shows the slate to
  /// fill in gaps in media content. Configuring the slate is optional for
  /// non-VPAID playback configurations. For VPAID, the slate is required
  /// because MediaTailor provides it in the slots designated for dynamic ad
  /// content. The slate must be a high-quality asset that contains both audio
  /// and video.
  final String slateAdUrl;

  /// The tags assigned to the playback configuration.
  final Map<String, String> tags;

  /// The name that is used to associate this playback configuration with a
  /// custom transcode profile. This overrides the dynamic transcoding defaults
  /// of MediaTailor. Use this only if you have already set up custom profiles
  /// with the help of AWS Support.
  final String transcodeProfileName;

  /// The URL prefix for the master playlist for the stream, minus the asset ID.
  /// The maximum length is 512 characters.
  final String videoContentSourceUrl;

  PlaybackConfiguration({
    this.adDecisionServerUrl,
    this.cdnConfiguration,
    this.dashConfiguration,
    this.hlsConfiguration,
    this.name,
    this.playbackConfigurationArn,
    this.playbackEndpointPrefix,
    this.sessionInitializationEndpointPrefix,
    this.slateAdUrl,
    this.tags,
    this.transcodeProfileName,
    this.videoContentSourceUrl,
  });
  static PlaybackConfiguration fromJson(Map<String, dynamic> json) =>
      PlaybackConfiguration();
}

class PutPlaybackConfigurationResponse {
  /// The URL for the ad decision server (ADS). This includes the specification
  /// of static parameters and placeholders for dynamic parameters. AWS
  /// Elemental MediaTailor substitutes player-specific and session-specific
  /// parameters as needed when calling the ADS. Alternately, for testing, you
  /// can provide a static VAST URL. The maximum length is 25,000 characters.
  final String adDecisionServerUrl;

  /// The configuration for using a content delivery network (CDN), like Amazon
  /// CloudFront, for content and ad segment management.
  final CdnConfiguration cdnConfiguration;

  /// The configuration for DASH content.
  final DashConfiguration dashConfiguration;

  /// The configuration for HLS content.
  final HlsConfiguration hlsConfiguration;

  /// The identifier for the playback configuration.
  final String name;

  /// The Amazon Resource Name (ARN) for the playback configuration.
  final String playbackConfigurationArn;

  /// The URL that the player accesses to get a manifest from AWS Elemental
  /// MediaTailor. This session will use server-side reporting.
  final String playbackEndpointPrefix;

  /// The URL that the player uses to initialize a session that uses client-side
  /// reporting.
  final String sessionInitializationEndpointPrefix;

  /// The URL for a high-quality video asset to transcode and use to fill in
  /// time that's not used by ads. AWS Elemental MediaTailor shows the slate to
  /// fill in gaps in media content. Configuring the slate is optional for
  /// non-VPAID playback configurations. For VPAID, the slate is required
  /// because MediaTailor provides it in the slots designated for dynamic ad
  /// content. The slate must be a high-quality asset that contains both audio
  /// and video.
  final String slateAdUrl;

  /// The tags assigned to the playback configuration.
  final Map<String, String> tags;

  /// The name that is used to associate this playback configuration with a
  /// custom transcode profile. This overrides the dynamic transcoding defaults
  /// of MediaTailor. Use this only if you have already set up custom profiles
  /// with the help of AWS Support.
  final String transcodeProfileName;

  /// The URL prefix for the master playlist for the stream, minus the asset ID.
  /// The maximum length is 512 characters.
  final String videoContentSourceUrl;

  PutPlaybackConfigurationResponse({
    this.adDecisionServerUrl,
    this.cdnConfiguration,
    this.dashConfiguration,
    this.hlsConfiguration,
    this.name,
    this.playbackConfigurationArn,
    this.playbackEndpointPrefix,
    this.sessionInitializationEndpointPrefix,
    this.slateAdUrl,
    this.tags,
    this.transcodeProfileName,
    this.videoContentSourceUrl,
  });
  static PutPlaybackConfigurationResponse fromJson(Map<String, dynamic> json) =>
      PutPlaybackConfigurationResponse();
}
