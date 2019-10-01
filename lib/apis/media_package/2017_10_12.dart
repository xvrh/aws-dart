import 'package:meta/meta.dart';

/// AWS Elemental MediaPackage
class MediaPackageApi {
  final _client;
  MediaPackageApi(client)
      : _client = client.configured('MediaPackage', serializer: 'rest-json');

  /// Creates a new Channel.
  ///
  /// [description]: A short text description of the Channel.
  ///
  /// [id]: The ID of the Channel. The ID must be unique within the region and
  /// it cannot be changed after a Channel is created.
  Future<CreateChannelResponse> createChannel(String id,
      {String description, Map<String, String> tags}) async {
    var response_ = await _client.send('CreateChannel', {
      if (description != null) 'Description': description,
      'Id': id,
      if (tags != null) 'Tags': tags,
    });
    return CreateChannelResponse.fromJson(response_);
  }

  /// Creates a new OriginEndpoint record.
  ///
  /// [channelId]: The ID of the Channel that the OriginEndpoint will be
  /// associated with. This cannot be changed after the OriginEndpoint is
  /// created.
  ///
  /// [description]: A short text description of the OriginEndpoint.
  ///
  /// [id]: The ID of the OriginEndpoint. The ID must be unique within the
  /// region and it cannot be changed after the OriginEndpoint is created.
  ///
  /// [manifestName]: A short string that will be used as the filename of the
  /// OriginEndpoint URL (defaults to "index").
  ///
  /// [startoverWindowSeconds]: Maximum duration (seconds) of content to retain
  /// for startover playback. If not specified, startover playback will be
  /// disabled for the OriginEndpoint.
  ///
  /// [timeDelaySeconds]: Amount of delay (seconds) to enforce on the playback
  /// of live content. If not specified, there will be no time delay in effect
  /// for the OriginEndpoint.
  ///
  /// [whitelist]: A list of source IP CIDR blocks that will be allowed to
  /// access the OriginEndpoint.
  Future<CreateOriginEndpointResponse> createOriginEndpoint(
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
      List<String> whitelist}) async {
    var response_ = await _client.send('CreateOriginEndpoint', {
      'ChannelId': channelId,
      if (cmafPackage != null) 'CmafPackage': cmafPackage,
      if (dashPackage != null) 'DashPackage': dashPackage,
      if (description != null) 'Description': description,
      if (hlsPackage != null) 'HlsPackage': hlsPackage,
      'Id': id,
      if (manifestName != null) 'ManifestName': manifestName,
      if (mssPackage != null) 'MssPackage': mssPackage,
      if (startoverWindowSeconds != null)
        'StartoverWindowSeconds': startoverWindowSeconds,
      if (tags != null) 'Tags': tags,
      if (timeDelaySeconds != null) 'TimeDelaySeconds': timeDelaySeconds,
      if (whitelist != null) 'Whitelist': whitelist,
    });
    return CreateOriginEndpointResponse.fromJson(response_);
  }

  /// Deletes an existing Channel.
  ///
  /// [id]: The ID of the Channel to delete.
  Future<DeleteChannelResponse> deleteChannel(String id) async {
    var response_ = await _client.send('DeleteChannel', {
      'Id': id,
    });
    return DeleteChannelResponse.fromJson(response_);
  }

  /// Deletes an existing OriginEndpoint.
  ///
  /// [id]: The ID of the OriginEndpoint to delete.
  Future<DeleteOriginEndpointResponse> deleteOriginEndpoint(String id) async {
    var response_ = await _client.send('DeleteOriginEndpoint', {
      'Id': id,
    });
    return DeleteOriginEndpointResponse.fromJson(response_);
  }

  /// Gets details about a Channel.
  ///
  /// [id]: The ID of a Channel.
  Future<DescribeChannelResponse> describeChannel(String id) async {
    var response_ = await _client.send('DescribeChannel', {
      'Id': id,
    });
    return DescribeChannelResponse.fromJson(response_);
  }

  /// Gets details about an existing OriginEndpoint.
  ///
  /// [id]: The ID of the OriginEndpoint.
  Future<DescribeOriginEndpointResponse> describeOriginEndpoint(
      String id) async {
    var response_ = await _client.send('DescribeOriginEndpoint', {
      'Id': id,
    });
    return DescribeOriginEndpointResponse.fromJson(response_);
  }

  /// Returns a collection of Channels.
  ///
  /// [maxResults]: Upper bound on number of records to return.
  ///
  /// [nextToken]: A token used to resume pagination from the end of a previous
  /// request.
  Future<ListChannelsResponse> listChannels(
      {int maxResults, String nextToken}) async {
    var response_ = await _client.send('ListChannels', {
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListChannelsResponse.fromJson(response_);
  }

  /// Returns a collection of OriginEndpoint records.
  ///
  /// [channelId]: When specified, the request will return only OriginEndpoints
  /// associated with the given Channel ID.
  ///
  /// [maxResults]: The upper bound on the number of records to return.
  ///
  /// [nextToken]: A token used to resume pagination from the end of a previous
  /// request.
  Future<ListOriginEndpointsResponse> listOriginEndpoints(
      {String channelId, int maxResults, String nextToken}) async {
    var response_ = await _client.send('ListOriginEndpoints', {
      if (channelId != null) 'ChannelId': channelId,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListOriginEndpointsResponse.fromJson(response_);
  }

  Future<ListTagsForResourceResponse> listTagsForResource(
      String resourceArn) async {
    var response_ = await _client.send('ListTagsForResource', {
      'ResourceArn': resourceArn,
    });
    return ListTagsForResourceResponse.fromJson(response_);
  }

  /// Changes the Channel's first IngestEndpoint's username and password.
  /// WARNING - This API is deprecated. Please use
  /// RotateIngestEndpointCredentials instead
  ///
  /// [id]: The ID of the channel to update.
  Future<RotateChannelCredentialsResponse> rotateChannelCredentials(
      String id) async {
    var response_ = await _client.send('RotateChannelCredentials', {
      'Id': id,
    });
    return RotateChannelCredentialsResponse.fromJson(response_);
  }

  /// Rotate the IngestEndpoint's username and password, as specified by the
  /// IngestEndpoint's id.
  ///
  /// [id]: The ID of the channel the IngestEndpoint is on.
  ///
  /// [ingestEndpointId]: The id of the IngestEndpoint whose credentials should
  /// be rotated
  Future<RotateIngestEndpointCredentialsResponse>
      rotateIngestEndpointCredentials(
          {@required String id, @required String ingestEndpointId}) async {
    var response_ = await _client.send('RotateIngestEndpointCredentials', {
      'Id': id,
      'IngestEndpointId': ingestEndpointId,
    });
    return RotateIngestEndpointCredentialsResponse.fromJson(response_);
  }

  Future<void> tagResource(
      {@required String resourceArn,
      @required Map<String, String> tags}) async {
    await _client.send('TagResource', {
      'ResourceArn': resourceArn,
      'Tags': tags,
    });
  }

  ///
  /// [tagKeys]: The key(s) of tag to be deleted
  Future<void> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {
    await _client.send('UntagResource', {
      'ResourceArn': resourceArn,
      'TagKeys': tagKeys,
    });
  }

  /// Updates an existing Channel.
  ///
  /// [description]: A short text description of the Channel.
  ///
  /// [id]: The ID of the Channel to update.
  Future<UpdateChannelResponse> updateChannel(String id,
      {String description}) async {
    var response_ = await _client.send('UpdateChannel', {
      if (description != null) 'Description': description,
      'Id': id,
    });
    return UpdateChannelResponse.fromJson(response_);
  }

  /// Updates an existing OriginEndpoint.
  ///
  /// [description]: A short text description of the OriginEndpoint.
  ///
  /// [id]: The ID of the OriginEndpoint to update.
  ///
  /// [manifestName]: A short string that will be appended to the end of the
  /// Endpoint URL.
  ///
  /// [startoverWindowSeconds]: Maximum duration (in seconds) of content to
  /// retain for startover playback. If not specified, startover playback will
  /// be disabled for the OriginEndpoint.
  ///
  /// [timeDelaySeconds]: Amount of delay (in seconds) to enforce on the
  /// playback of live content. If not specified, there will be no time delay in
  /// effect for the OriginEndpoint.
  ///
  /// [whitelist]: A list of source IP CIDR blocks that will be allowed to
  /// access the OriginEndpoint.
  Future<UpdateOriginEndpointResponse> updateOriginEndpoint(String id,
      {CmafPackageCreateOrUpdateParameters cmafPackage,
      DashPackage dashPackage,
      String description,
      HlsPackage hlsPackage,
      String manifestName,
      MssPackage mssPackage,
      int startoverWindowSeconds,
      int timeDelaySeconds,
      List<String> whitelist}) async {
    var response_ = await _client.send('UpdateOriginEndpoint', {
      if (cmafPackage != null) 'CmafPackage': cmafPackage,
      if (dashPackage != null) 'DashPackage': dashPackage,
      if (description != null) 'Description': description,
      if (hlsPackage != null) 'HlsPackage': hlsPackage,
      'Id': id,
      if (manifestName != null) 'ManifestName': manifestName,
      if (mssPackage != null) 'MssPackage': mssPackage,
      if (startoverWindowSeconds != null)
        'StartoverWindowSeconds': startoverWindowSeconds,
      if (timeDelaySeconds != null) 'TimeDelaySeconds': timeDelaySeconds,
      if (whitelist != null) 'Whitelist': whitelist,
    });
    return UpdateOriginEndpointResponse.fromJson(response_);
  }
}

/// A Channel resource configuration.
class Channel {
  /// The Amazon Resource Name (ARN) assigned to the Channel.
  final String arn;

  /// A short text description of the Channel.
  final String description;

  final HlsIngest hlsIngest;

  /// The ID of the Channel.
  final String id;

  final Map<String, String> tags;

  Channel({
    this.arn,
    this.description,
    this.hlsIngest,
    this.id,
    this.tags,
  });
  static Channel fromJson(Map<String, dynamic> json) => Channel(
        arn: json.containsKey('Arn') ? json['Arn'] as String : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        hlsIngest: json.containsKey('HlsIngest')
            ? HlsIngest.fromJson(json['HlsIngest'])
            : null,
        id: json.containsKey('Id') ? json['Id'] as String : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

/// A Common Media Application Format (CMAF) encryption configuration.
class CmafEncryption {
  /// Time (in seconds) between each encryption key rotation.
  final int keyRotationIntervalSeconds;

  final SpekeKeyProvider spekeKeyProvider;

  CmafEncryption({
    this.keyRotationIntervalSeconds,
    @required this.spekeKeyProvider,
  });
  static CmafEncryption fromJson(Map<String, dynamic> json) => CmafEncryption(
        keyRotationIntervalSeconds:
            json.containsKey('KeyRotationIntervalSeconds')
                ? json['KeyRotationIntervalSeconds'] as int
                : null,
        spekeKeyProvider: SpekeKeyProvider.fromJson(json['SpekeKeyProvider']),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A Common Media Application Format (CMAF) packaging configuration.
class CmafPackage {
  final CmafEncryption encryption;

  /// A list of HLS manifest configurations
  final List<HlsManifest> hlsManifests;

  /// Duration (in seconds) of each segment. Actual segments will be rounded to
  /// the nearest multiple of the source segment duration.
  final int segmentDurationSeconds;

  /// An optional custom string that is prepended to the name of each segment.
  /// If not specified, it defaults to the ChannelId.
  final String segmentPrefix;

  final StreamSelection streamSelection;

  CmafPackage({
    this.encryption,
    this.hlsManifests,
    this.segmentDurationSeconds,
    this.segmentPrefix,
    this.streamSelection,
  });
  static CmafPackage fromJson(Map<String, dynamic> json) => CmafPackage(
        encryption: json.containsKey('Encryption')
            ? CmafEncryption.fromJson(json['Encryption'])
            : null,
        hlsManifests: json.containsKey('HlsManifests')
            ? (json['HlsManifests'] as List)
                .map((e) => HlsManifest.fromJson(e))
                .toList()
            : null,
        segmentDurationSeconds: json.containsKey('SegmentDurationSeconds')
            ? json['SegmentDurationSeconds'] as int
            : null,
        segmentPrefix: json.containsKey('SegmentPrefix')
            ? json['SegmentPrefix'] as String
            : null,
        streamSelection: json.containsKey('StreamSelection')
            ? StreamSelection.fromJson(json['StreamSelection'])
            : null,
      );
}

/// A Common Media Application Format (CMAF) packaging configuration.
class CmafPackageCreateOrUpdateParameters {
  final CmafEncryption encryption;

  /// A list of HLS manifest configurations
  final List<HlsManifestCreateOrUpdateParameters> hlsManifests;

  /// Duration (in seconds) of each segment. Actual segments will be rounded to
  /// the nearest multiple of the source segment duration.
  final int segmentDurationSeconds;

  /// An optional custom string that is prepended to the name of each segment.
  /// If not specified, it defaults to the ChannelId.
  final String segmentPrefix;

  final StreamSelection streamSelection;

  CmafPackageCreateOrUpdateParameters({
    this.encryption,
    this.hlsManifests,
    this.segmentDurationSeconds,
    this.segmentPrefix,
    this.streamSelection,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class CreateChannelResponse {
  /// The Amazon Resource Name (ARN) assigned to the Channel.
  final String arn;

  /// A short text description of the Channel.
  final String description;

  final HlsIngest hlsIngest;

  /// The ID of the Channel.
  final String id;

  final Map<String, String> tags;

  CreateChannelResponse({
    this.arn,
    this.description,
    this.hlsIngest,
    this.id,
    this.tags,
  });
  static CreateChannelResponse fromJson(Map<String, dynamic> json) =>
      CreateChannelResponse(
        arn: json.containsKey('Arn') ? json['Arn'] as String : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        hlsIngest: json.containsKey('HlsIngest')
            ? HlsIngest.fromJson(json['HlsIngest'])
            : null,
        id: json.containsKey('Id') ? json['Id'] as String : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

class CreateOriginEndpointResponse {
  /// The Amazon Resource Name (ARN) assigned to the OriginEndpoint.
  final String arn;

  /// The ID of the Channel the OriginEndpoint is associated with.
  final String channelId;

  final CmafPackage cmafPackage;

  final DashPackage dashPackage;

  /// A short text description of the OriginEndpoint.
  final String description;

  final HlsPackage hlsPackage;

  /// The ID of the OriginEndpoint.
  final String id;

  /// A short string appended to the end of the OriginEndpoint URL.
  final String manifestName;

  final MssPackage mssPackage;

  /// Maximum duration (seconds) of content to retain for startover playback. If
  /// not specified, startover playback will be disabled for the OriginEndpoint.
  final int startoverWindowSeconds;

  final Map<String, String> tags;

  /// Amount of delay (seconds) to enforce on the playback of live content. If
  /// not specified, there will be no time delay in effect for the
  /// OriginEndpoint.
  final int timeDelaySeconds;

  /// The URL of the packaged OriginEndpoint for consumption.
  final String url;

  /// A list of source IP CIDR blocks that will be allowed to access the
  /// OriginEndpoint.
  final List<String> whitelist;

  CreateOriginEndpointResponse({
    this.arn,
    this.channelId,
    this.cmafPackage,
    this.dashPackage,
    this.description,
    this.hlsPackage,
    this.id,
    this.manifestName,
    this.mssPackage,
    this.startoverWindowSeconds,
    this.tags,
    this.timeDelaySeconds,
    this.url,
    this.whitelist,
  });
  static CreateOriginEndpointResponse fromJson(Map<String, dynamic> json) =>
      CreateOriginEndpointResponse(
        arn: json.containsKey('Arn') ? json['Arn'] as String : null,
        channelId:
            json.containsKey('ChannelId') ? json['ChannelId'] as String : null,
        cmafPackage: json.containsKey('CmafPackage')
            ? CmafPackage.fromJson(json['CmafPackage'])
            : null,
        dashPackage: json.containsKey('DashPackage')
            ? DashPackage.fromJson(json['DashPackage'])
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        hlsPackage: json.containsKey('HlsPackage')
            ? HlsPackage.fromJson(json['HlsPackage'])
            : null,
        id: json.containsKey('Id') ? json['Id'] as String : null,
        manifestName: json.containsKey('ManifestName')
            ? json['ManifestName'] as String
            : null,
        mssPackage: json.containsKey('MssPackage')
            ? MssPackage.fromJson(json['MssPackage'])
            : null,
        startoverWindowSeconds: json.containsKey('StartoverWindowSeconds')
            ? json['StartoverWindowSeconds'] as int
            : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        timeDelaySeconds: json.containsKey('TimeDelaySeconds')
            ? json['TimeDelaySeconds'] as int
            : null,
        url: json.containsKey('Url') ? json['Url'] as String : null,
        whitelist: json.containsKey('Whitelist')
            ? (json['Whitelist'] as List).map((e) => e as String).toList()
            : null,
      );
}

/// A Dynamic Adaptive Streaming over HTTP (DASH) encryption configuration.
class DashEncryption {
  /// Time (in seconds) between each encryption key rotation.
  final int keyRotationIntervalSeconds;

  final SpekeKeyProvider spekeKeyProvider;

  DashEncryption({
    this.keyRotationIntervalSeconds,
    @required this.spekeKeyProvider,
  });
  static DashEncryption fromJson(Map<String, dynamic> json) => DashEncryption(
        keyRotationIntervalSeconds:
            json.containsKey('KeyRotationIntervalSeconds')
                ? json['KeyRotationIntervalSeconds'] as int
                : null,
        spekeKeyProvider: SpekeKeyProvider.fromJson(json['SpekeKeyProvider']),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A Dynamic Adaptive Streaming over HTTP (DASH) packaging configuration.
class DashPackage {
  final List<String> adTriggers;

  final String adsOnDeliveryRestrictions;

  final DashEncryption encryption;

  /// Determines the position of some tags in the Media Presentation Description
  /// (MPD). When set to FULL, elements like SegmentTemplate and
  /// ContentProtection are included in each Representation. When set to
  /// COMPACT, duplicate elements are combined and presented at the
  /// AdaptationSet level.
  final String manifestLayout;

  /// Time window (in seconds) contained in each manifest.
  final int manifestWindowSeconds;

  /// Minimum duration (in seconds) that a player will buffer media before
  /// starting the presentation.
  final int minBufferTimeSeconds;

  /// Minimum duration (in seconds) between potential changes to the Dynamic
  /// Adaptive Streaming over HTTP (DASH) Media Presentation Description (MPD).
  final int minUpdatePeriodSeconds;

  /// A list of triggers that controls when the outgoing Dynamic Adaptive
  /// Streaming over HTTP (DASH) Media Presentation Description (MPD) will be
  /// partitioned into multiple periods. If empty, the content will not be
  /// partitioned into more than one period. If the list contains "ADS", new
  /// periods will be created where the Channel source contains SCTE-35 ad
  /// markers.
  final List<String> periodTriggers;

  /// The Dynamic Adaptive Streaming over HTTP (DASH) profile type. When set to
  /// "HBBTV_1_5", HbbTV 1.5 compliant output is enabled.
  final String profile;

  /// Duration (in seconds) of each segment. Actual segments will be rounded to
  /// the nearest multiple of the source segment duration.
  final int segmentDurationSeconds;

  /// Determines the type of SegmentTemplate included in the Media Presentation
  /// Description (MPD). When set to NUMBER_WITH_TIMELINE, a full timeline is
  /// presented in each SegmentTemplate, with $Number$ media URLs. When set to
  /// TIME_WITH_TIMELINE, a full timeline is presented in each SegmentTemplate,
  /// with $Time$ media URLs. When set to NUMBER_WITH_DURATION, only a duration
  /// is included in each SegmentTemplate, with $Number$ media URLs.
  final String segmentTemplateFormat;

  final StreamSelection streamSelection;

  /// Duration (in seconds) to delay live content before presentation.
  final int suggestedPresentationDelaySeconds;

  DashPackage({
    this.adTriggers,
    this.adsOnDeliveryRestrictions,
    this.encryption,
    this.manifestLayout,
    this.manifestWindowSeconds,
    this.minBufferTimeSeconds,
    this.minUpdatePeriodSeconds,
    this.periodTriggers,
    this.profile,
    this.segmentDurationSeconds,
    this.segmentTemplateFormat,
    this.streamSelection,
    this.suggestedPresentationDelaySeconds,
  });
  static DashPackage fromJson(Map<String, dynamic> json) => DashPackage(
        adTriggers: json.containsKey('AdTriggers')
            ? (json['AdTriggers'] as List).map((e) => e as String).toList()
            : null,
        adsOnDeliveryRestrictions: json.containsKey('AdsOnDeliveryRestrictions')
            ? json['AdsOnDeliveryRestrictions'] as String
            : null,
        encryption: json.containsKey('Encryption')
            ? DashEncryption.fromJson(json['Encryption'])
            : null,
        manifestLayout: json.containsKey('ManifestLayout')
            ? json['ManifestLayout'] as String
            : null,
        manifestWindowSeconds: json.containsKey('ManifestWindowSeconds')
            ? json['ManifestWindowSeconds'] as int
            : null,
        minBufferTimeSeconds: json.containsKey('MinBufferTimeSeconds')
            ? json['MinBufferTimeSeconds'] as int
            : null,
        minUpdatePeriodSeconds: json.containsKey('MinUpdatePeriodSeconds')
            ? json['MinUpdatePeriodSeconds'] as int
            : null,
        periodTriggers: json.containsKey('PeriodTriggers')
            ? (json['PeriodTriggers'] as List).map((e) => e as String).toList()
            : null,
        profile: json.containsKey('Profile') ? json['Profile'] as String : null,
        segmentDurationSeconds: json.containsKey('SegmentDurationSeconds')
            ? json['SegmentDurationSeconds'] as int
            : null,
        segmentTemplateFormat: json.containsKey('SegmentTemplateFormat')
            ? json['SegmentTemplateFormat'] as String
            : null,
        streamSelection: json.containsKey('StreamSelection')
            ? StreamSelection.fromJson(json['StreamSelection'])
            : null,
        suggestedPresentationDelaySeconds:
            json.containsKey('SuggestedPresentationDelaySeconds')
                ? json['SuggestedPresentationDelaySeconds'] as int
                : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class DeleteChannelResponse {
  DeleteChannelResponse();
  static DeleteChannelResponse fromJson(Map<String, dynamic> json) =>
      DeleteChannelResponse();
}

class DeleteOriginEndpointResponse {
  DeleteOriginEndpointResponse();
  static DeleteOriginEndpointResponse fromJson(Map<String, dynamic> json) =>
      DeleteOriginEndpointResponse();
}

class DescribeChannelResponse {
  /// The Amazon Resource Name (ARN) assigned to the Channel.
  final String arn;

  /// A short text description of the Channel.
  final String description;

  final HlsIngest hlsIngest;

  /// The ID of the Channel.
  final String id;

  final Map<String, String> tags;

  DescribeChannelResponse({
    this.arn,
    this.description,
    this.hlsIngest,
    this.id,
    this.tags,
  });
  static DescribeChannelResponse fromJson(Map<String, dynamic> json) =>
      DescribeChannelResponse(
        arn: json.containsKey('Arn') ? json['Arn'] as String : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        hlsIngest: json.containsKey('HlsIngest')
            ? HlsIngest.fromJson(json['HlsIngest'])
            : null,
        id: json.containsKey('Id') ? json['Id'] as String : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

class DescribeOriginEndpointResponse {
  /// The Amazon Resource Name (ARN) assigned to the OriginEndpoint.
  final String arn;

  /// The ID of the Channel the OriginEndpoint is associated with.
  final String channelId;

  final CmafPackage cmafPackage;

  final DashPackage dashPackage;

  /// A short text description of the OriginEndpoint.
  final String description;

  final HlsPackage hlsPackage;

  /// The ID of the OriginEndpoint.
  final String id;

  /// A short string appended to the end of the OriginEndpoint URL.
  final String manifestName;

  final MssPackage mssPackage;

  /// Maximum duration (seconds) of content to retain for startover playback. If
  /// not specified, startover playback will be disabled for the OriginEndpoint.
  final int startoverWindowSeconds;

  final Map<String, String> tags;

  /// Amount of delay (seconds) to enforce on the playback of live content. If
  /// not specified, there will be no time delay in effect for the
  /// OriginEndpoint.
  final int timeDelaySeconds;

  /// The URL of the packaged OriginEndpoint for consumption.
  final String url;

  /// A list of source IP CIDR blocks that will be allowed to access the
  /// OriginEndpoint.
  final List<String> whitelist;

  DescribeOriginEndpointResponse({
    this.arn,
    this.channelId,
    this.cmafPackage,
    this.dashPackage,
    this.description,
    this.hlsPackage,
    this.id,
    this.manifestName,
    this.mssPackage,
    this.startoverWindowSeconds,
    this.tags,
    this.timeDelaySeconds,
    this.url,
    this.whitelist,
  });
  static DescribeOriginEndpointResponse fromJson(Map<String, dynamic> json) =>
      DescribeOriginEndpointResponse(
        arn: json.containsKey('Arn') ? json['Arn'] as String : null,
        channelId:
            json.containsKey('ChannelId') ? json['ChannelId'] as String : null,
        cmafPackage: json.containsKey('CmafPackage')
            ? CmafPackage.fromJson(json['CmafPackage'])
            : null,
        dashPackage: json.containsKey('DashPackage')
            ? DashPackage.fromJson(json['DashPackage'])
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        hlsPackage: json.containsKey('HlsPackage')
            ? HlsPackage.fromJson(json['HlsPackage'])
            : null,
        id: json.containsKey('Id') ? json['Id'] as String : null,
        manifestName: json.containsKey('ManifestName')
            ? json['ManifestName'] as String
            : null,
        mssPackage: json.containsKey('MssPackage')
            ? MssPackage.fromJson(json['MssPackage'])
            : null,
        startoverWindowSeconds: json.containsKey('StartoverWindowSeconds')
            ? json['StartoverWindowSeconds'] as int
            : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        timeDelaySeconds: json.containsKey('TimeDelaySeconds')
            ? json['TimeDelaySeconds'] as int
            : null,
        url: json.containsKey('Url') ? json['Url'] as String : null,
        whitelist: json.containsKey('Whitelist')
            ? (json['Whitelist'] as List).map((e) => e as String).toList()
            : null,
      );
}

/// An HTTP Live Streaming (HLS) encryption configuration.
class HlsEncryption {
  /// A constant initialization vector for encryption (optional). When not
  /// specified the initialization vector will be periodically rotated.
  final String constantInitializationVector;

  /// The encryption method to use.
  final String encryptionMethod;

  /// Interval (in seconds) between each encryption key rotation.
  final int keyRotationIntervalSeconds;

  /// When enabled, the EXT-X-KEY tag will be repeated in output manifests.
  final bool repeatExtxKey;

  final SpekeKeyProvider spekeKeyProvider;

  HlsEncryption({
    this.constantInitializationVector,
    this.encryptionMethod,
    this.keyRotationIntervalSeconds,
    this.repeatExtxKey,
    @required this.spekeKeyProvider,
  });
  static HlsEncryption fromJson(Map<String, dynamic> json) => HlsEncryption(
        constantInitializationVector:
            json.containsKey('ConstantInitializationVector')
                ? json['ConstantInitializationVector'] as String
                : null,
        encryptionMethod: json.containsKey('EncryptionMethod')
            ? json['EncryptionMethod'] as String
            : null,
        keyRotationIntervalSeconds:
            json.containsKey('KeyRotationIntervalSeconds')
                ? json['KeyRotationIntervalSeconds'] as int
                : null,
        repeatExtxKey: json.containsKey('RepeatExtXKey')
            ? json['RepeatExtXKey'] as bool
            : null,
        spekeKeyProvider: SpekeKeyProvider.fromJson(json['SpekeKeyProvider']),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// An HTTP Live Streaming (HLS) ingest resource configuration.
class HlsIngest {
  /// A list of endpoints to which the source stream should be sent.
  final List<IngestEndpoint> ingestEndpoints;

  HlsIngest({
    this.ingestEndpoints,
  });
  static HlsIngest fromJson(Map<String, dynamic> json) => HlsIngest(
        ingestEndpoints: json.containsKey('IngestEndpoints')
            ? (json['IngestEndpoints'] as List)
                .map((e) => IngestEndpoint.fromJson(e))
                .toList()
            : null,
      );
}

/// A HTTP Live Streaming (HLS) manifest configuration.
class HlsManifest {
  /// This setting controls how ad markers are included in the packaged
  /// OriginEndpoint. "NONE" will omit all SCTE-35 ad markers from the output.
  /// "PASSTHROUGH" causes the manifest to contain a copy of the SCTE-35 ad
  /// markers (comments) taken directly from the input HTTP Live Streaming (HLS)
  /// manifest. "SCTE35_ENHANCED" generates ad markers and blackout tags based
  /// on SCTE-35 messages in the input source.
  final String adMarkers;

  /// The ID of the manifest. The ID must be unique within the OriginEndpoint
  /// and it cannot be changed after it is created.
  final String id;

  /// When enabled, an I-Frame only stream will be included in the output.
  final bool includeIframeOnlyStream;

  /// An optional short string appended to the end of the OriginEndpoint URL. If
  /// not specified, defaults to the manifestName for the OriginEndpoint.
  final String manifestName;

  /// The HTTP Live Streaming (HLS) playlist type. When either "EVENT" or "VOD"
  /// is specified, a corresponding EXT-X-PLAYLIST-TYPE entry will be included
  /// in the media playlist.
  final String playlistType;

  /// Time window (in seconds) contained in each parent manifest.
  final int playlistWindowSeconds;

  /// The interval (in seconds) between each EXT-X-PROGRAM-DATE-TIME tag
  /// inserted into manifests. Additionally, when an interval is specified
  /// ID3Timed Metadata messages will be generated every 5 seconds using the
  /// ingest time of the content. If the interval is not specified, or set to 0,
  /// then no EXT-X-PROGRAM-DATE-TIME tags will be inserted into manifests and
  /// no ID3Timed Metadata messages will be generated. Note that irrespective of
  /// this parameter, if any ID3 Timed Metadata is found in HTTP Live Streaming
  /// (HLS) input, it will be passed through to HLS output.
  final int programDateTimeIntervalSeconds;

  /// The URL of the packaged OriginEndpoint for consumption.
  final String url;

  HlsManifest({
    this.adMarkers,
    @required this.id,
    this.includeIframeOnlyStream,
    this.manifestName,
    this.playlistType,
    this.playlistWindowSeconds,
    this.programDateTimeIntervalSeconds,
    this.url,
  });
  static HlsManifest fromJson(Map<String, dynamic> json) => HlsManifest(
        adMarkers:
            json.containsKey('AdMarkers') ? json['AdMarkers'] as String : null,
        id: json['Id'] as String,
        includeIframeOnlyStream: json.containsKey('IncludeIframeOnlyStream')
            ? json['IncludeIframeOnlyStream'] as bool
            : null,
        manifestName: json.containsKey('ManifestName')
            ? json['ManifestName'] as String
            : null,
        playlistType: json.containsKey('PlaylistType')
            ? json['PlaylistType'] as String
            : null,
        playlistWindowSeconds: json.containsKey('PlaylistWindowSeconds')
            ? json['PlaylistWindowSeconds'] as int
            : null,
        programDateTimeIntervalSeconds:
            json.containsKey('ProgramDateTimeIntervalSeconds')
                ? json['ProgramDateTimeIntervalSeconds'] as int
                : null,
        url: json.containsKey('Url') ? json['Url'] as String : null,
      );
}

/// A HTTP Live Streaming (HLS) manifest configuration.
class HlsManifestCreateOrUpdateParameters {
  /// This setting controls how ad markers are included in the packaged
  /// OriginEndpoint. "NONE" will omit all SCTE-35 ad markers from the output.
  /// "PASSTHROUGH" causes the manifest to contain a copy of the SCTE-35 ad
  /// markers (comments) taken directly from the input HTTP Live Streaming (HLS)
  /// manifest. "SCTE35_ENHANCED" generates ad markers and blackout tags based
  /// on SCTE-35 messages in the input source.
  final String adMarkers;

  final List<String> adTriggers;

  final String adsOnDeliveryRestrictions;

  /// The ID of the manifest. The ID must be unique within the OriginEndpoint
  /// and it cannot be changed after it is created.
  final String id;

  /// When enabled, an I-Frame only stream will be included in the output.
  final bool includeIframeOnlyStream;

  /// An optional short string appended to the end of the OriginEndpoint URL. If
  /// not specified, defaults to the manifestName for the OriginEndpoint.
  final String manifestName;

  /// The HTTP Live Streaming (HLS) playlist type. When either "EVENT" or "VOD"
  /// is specified, a corresponding EXT-X-PLAYLIST-TYPE entry will be included
  /// in the media playlist.
  final String playlistType;

  /// Time window (in seconds) contained in each parent manifest.
  final int playlistWindowSeconds;

  /// The interval (in seconds) between each EXT-X-PROGRAM-DATE-TIME tag
  /// inserted into manifests. Additionally, when an interval is specified
  /// ID3Timed Metadata messages will be generated every 5 seconds using the
  /// ingest time of the content. If the interval is not specified, or set to 0,
  /// then no EXT-X-PROGRAM-DATE-TIME tags will be inserted into manifests and
  /// no ID3Timed Metadata messages will be generated. Note that irrespective of
  /// this parameter, if any ID3 Timed Metadata is found in HTTP Live Streaming
  /// (HLS) input, it will be passed through to HLS output.
  final int programDateTimeIntervalSeconds;

  HlsManifestCreateOrUpdateParameters({
    this.adMarkers,
    this.adTriggers,
    this.adsOnDeliveryRestrictions,
    @required this.id,
    this.includeIframeOnlyStream,
    this.manifestName,
    this.playlistType,
    this.playlistWindowSeconds,
    this.programDateTimeIntervalSeconds,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// An HTTP Live Streaming (HLS) packaging configuration.
class HlsPackage {
  /// This setting controls how ad markers are included in the packaged
  /// OriginEndpoint. "NONE" will omit all SCTE-35 ad markers from the output.
  /// "PASSTHROUGH" causes the manifest to contain a copy of the SCTE-35 ad
  /// markers (comments) taken directly from the input HTTP Live Streaming (HLS)
  /// manifest. "SCTE35_ENHANCED" generates ad markers and blackout tags based
  /// on SCTE-35 messages in the input source.
  final String adMarkers;

  final List<String> adTriggers;

  final String adsOnDeliveryRestrictions;

  final HlsEncryption encryption;

  /// When enabled, an I-Frame only stream will be included in the output.
  final bool includeIframeOnlyStream;

  /// The HTTP Live Streaming (HLS) playlist type. When either "EVENT" or "VOD"
  /// is specified, a corresponding EXT-X-PLAYLIST-TYPE entry will be included
  /// in the media playlist.
  final String playlistType;

  /// Time window (in seconds) contained in each parent manifest.
  final int playlistWindowSeconds;

  /// The interval (in seconds) between each EXT-X-PROGRAM-DATE-TIME tag
  /// inserted into manifests. Additionally, when an interval is specified
  /// ID3Timed Metadata messages will be generated every 5 seconds using the
  /// ingest time of the content. If the interval is not specified, or set to 0,
  /// then no EXT-X-PROGRAM-DATE-TIME tags will be inserted into manifests and
  /// no ID3Timed Metadata messages will be generated. Note that irrespective of
  /// this parameter, if any ID3 Timed Metadata is found in HTTP Live Streaming
  /// (HLS) input, it will be passed through to HLS output.
  final int programDateTimeIntervalSeconds;

  /// Duration (in seconds) of each fragment. Actual fragments will be rounded
  /// to the nearest multiple of the source fragment duration.
  final int segmentDurationSeconds;

  final StreamSelection streamSelection;

  /// When enabled, audio streams will be placed in rendition groups in the
  /// output.
  final bool useAudioRenditionGroup;

  HlsPackage({
    this.adMarkers,
    this.adTriggers,
    this.adsOnDeliveryRestrictions,
    this.encryption,
    this.includeIframeOnlyStream,
    this.playlistType,
    this.playlistWindowSeconds,
    this.programDateTimeIntervalSeconds,
    this.segmentDurationSeconds,
    this.streamSelection,
    this.useAudioRenditionGroup,
  });
  static HlsPackage fromJson(Map<String, dynamic> json) => HlsPackage(
        adMarkers:
            json.containsKey('AdMarkers') ? json['AdMarkers'] as String : null,
        adTriggers: json.containsKey('AdTriggers')
            ? (json['AdTriggers'] as List).map((e) => e as String).toList()
            : null,
        adsOnDeliveryRestrictions: json.containsKey('AdsOnDeliveryRestrictions')
            ? json['AdsOnDeliveryRestrictions'] as String
            : null,
        encryption: json.containsKey('Encryption')
            ? HlsEncryption.fromJson(json['Encryption'])
            : null,
        includeIframeOnlyStream: json.containsKey('IncludeIframeOnlyStream')
            ? json['IncludeIframeOnlyStream'] as bool
            : null,
        playlistType: json.containsKey('PlaylistType')
            ? json['PlaylistType'] as String
            : null,
        playlistWindowSeconds: json.containsKey('PlaylistWindowSeconds')
            ? json['PlaylistWindowSeconds'] as int
            : null,
        programDateTimeIntervalSeconds:
            json.containsKey('ProgramDateTimeIntervalSeconds')
                ? json['ProgramDateTimeIntervalSeconds'] as int
                : null,
        segmentDurationSeconds: json.containsKey('SegmentDurationSeconds')
            ? json['SegmentDurationSeconds'] as int
            : null,
        streamSelection: json.containsKey('StreamSelection')
            ? StreamSelection.fromJson(json['StreamSelection'])
            : null,
        useAudioRenditionGroup: json.containsKey('UseAudioRenditionGroup')
            ? json['UseAudioRenditionGroup'] as bool
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// An endpoint for ingesting source content for a Channel.
class IngestEndpoint {
  /// The system generated unique identifier for the IngestEndpoint
  final String id;

  /// The system generated password for ingest authentication.
  final String password;

  /// The ingest URL to which the source stream should be sent.
  final String url;

  /// The system generated username for ingest authentication.
  final String username;

  IngestEndpoint({
    this.id,
    this.password,
    this.url,
    this.username,
  });
  static IngestEndpoint fromJson(Map<String, dynamic> json) => IngestEndpoint(
        id: json.containsKey('Id') ? json['Id'] as String : null,
        password:
            json.containsKey('Password') ? json['Password'] as String : null,
        url: json.containsKey('Url') ? json['Url'] as String : null,
        username:
            json.containsKey('Username') ? json['Username'] as String : null,
      );
}

class ListChannelsResponse {
  /// A list of Channel records.
  final List<Channel> channels;

  /// A token that can be used to resume pagination from the end of the
  /// collection.
  final String nextToken;

  ListChannelsResponse({
    this.channels,
    this.nextToken,
  });
  static ListChannelsResponse fromJson(Map<String, dynamic> json) =>
      ListChannelsResponse(
        channels: json.containsKey('Channels')
            ? (json['Channels'] as List)
                .map((e) => Channel.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListOriginEndpointsResponse {
  /// A token that can be used to resume pagination from the end of the
  /// collection.
  final String nextToken;

  /// A list of OriginEndpoint records.
  final List<OriginEndpoint> originEndpoints;

  ListOriginEndpointsResponse({
    this.nextToken,
    this.originEndpoints,
  });
  static ListOriginEndpointsResponse fromJson(Map<String, dynamic> json) =>
      ListOriginEndpointsResponse(
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
        originEndpoints: json.containsKey('OriginEndpoints')
            ? (json['OriginEndpoints'] as List)
                .map((e) => OriginEndpoint.fromJson(e))
                .toList()
            : null,
      );
}

class ListTagsForResourceResponse {
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  static ListTagsForResourceResponse fromJson(Map<String, dynamic> json) =>
      ListTagsForResourceResponse(
        tags: json.containsKey('Tags')
            ? (json['Tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

/// A Microsoft Smooth Streaming (MSS) encryption configuration.
class MssEncryption {
  final SpekeKeyProvider spekeKeyProvider;

  MssEncryption({
    @required this.spekeKeyProvider,
  });
  static MssEncryption fromJson(Map<String, dynamic> json) => MssEncryption(
        spekeKeyProvider: SpekeKeyProvider.fromJson(json['SpekeKeyProvider']),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A Microsoft Smooth Streaming (MSS) packaging configuration.
class MssPackage {
  final MssEncryption encryption;

  /// The time window (in seconds) contained in each manifest.
  final int manifestWindowSeconds;

  /// The duration (in seconds) of each segment.
  final int segmentDurationSeconds;

  final StreamSelection streamSelection;

  MssPackage({
    this.encryption,
    this.manifestWindowSeconds,
    this.segmentDurationSeconds,
    this.streamSelection,
  });
  static MssPackage fromJson(Map<String, dynamic> json) => MssPackage(
        encryption: json.containsKey('Encryption')
            ? MssEncryption.fromJson(json['Encryption'])
            : null,
        manifestWindowSeconds: json.containsKey('ManifestWindowSeconds')
            ? json['ManifestWindowSeconds'] as int
            : null,
        segmentDurationSeconds: json.containsKey('SegmentDurationSeconds')
            ? json['SegmentDurationSeconds'] as int
            : null,
        streamSelection: json.containsKey('StreamSelection')
            ? StreamSelection.fromJson(json['StreamSelection'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// An OriginEndpoint resource configuration.
class OriginEndpoint {
  /// The Amazon Resource Name (ARN) assigned to the OriginEndpoint.
  final String arn;

  /// The ID of the Channel the OriginEndpoint is associated with.
  final String channelId;

  final CmafPackage cmafPackage;

  final DashPackage dashPackage;

  /// A short text description of the OriginEndpoint.
  final String description;

  final HlsPackage hlsPackage;

  /// The ID of the OriginEndpoint.
  final String id;

  /// A short string appended to the end of the OriginEndpoint URL.
  final String manifestName;

  final MssPackage mssPackage;

  /// Maximum duration (seconds) of content to retain for startover playback. If
  /// not specified, startover playback will be disabled for the OriginEndpoint.
  final int startoverWindowSeconds;

  final Map<String, String> tags;

  /// Amount of delay (seconds) to enforce on the playback of live content. If
  /// not specified, there will be no time delay in effect for the
  /// OriginEndpoint.
  final int timeDelaySeconds;

  /// The URL of the packaged OriginEndpoint for consumption.
  final String url;

  /// A list of source IP CIDR blocks that will be allowed to access the
  /// OriginEndpoint.
  final List<String> whitelist;

  OriginEndpoint({
    this.arn,
    this.channelId,
    this.cmafPackage,
    this.dashPackage,
    this.description,
    this.hlsPackage,
    this.id,
    this.manifestName,
    this.mssPackage,
    this.startoverWindowSeconds,
    this.tags,
    this.timeDelaySeconds,
    this.url,
    this.whitelist,
  });
  static OriginEndpoint fromJson(Map<String, dynamic> json) => OriginEndpoint(
        arn: json.containsKey('Arn') ? json['Arn'] as String : null,
        channelId:
            json.containsKey('ChannelId') ? json['ChannelId'] as String : null,
        cmafPackage: json.containsKey('CmafPackage')
            ? CmafPackage.fromJson(json['CmafPackage'])
            : null,
        dashPackage: json.containsKey('DashPackage')
            ? DashPackage.fromJson(json['DashPackage'])
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        hlsPackage: json.containsKey('HlsPackage')
            ? HlsPackage.fromJson(json['HlsPackage'])
            : null,
        id: json.containsKey('Id') ? json['Id'] as String : null,
        manifestName: json.containsKey('ManifestName')
            ? json['ManifestName'] as String
            : null,
        mssPackage: json.containsKey('MssPackage')
            ? MssPackage.fromJson(json['MssPackage'])
            : null,
        startoverWindowSeconds: json.containsKey('StartoverWindowSeconds')
            ? json['StartoverWindowSeconds'] as int
            : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        timeDelaySeconds: json.containsKey('TimeDelaySeconds')
            ? json['TimeDelaySeconds'] as int
            : null,
        url: json.containsKey('Url') ? json['Url'] as String : null,
        whitelist: json.containsKey('Whitelist')
            ? (json['Whitelist'] as List).map((e) => e as String).toList()
            : null,
      );
}

class RotateChannelCredentialsResponse {
  /// The Amazon Resource Name (ARN) assigned to the Channel.
  final String arn;

  /// A short text description of the Channel.
  final String description;

  final HlsIngest hlsIngest;

  /// The ID of the Channel.
  final String id;

  final Map<String, String> tags;

  RotateChannelCredentialsResponse({
    this.arn,
    this.description,
    this.hlsIngest,
    this.id,
    this.tags,
  });
  static RotateChannelCredentialsResponse fromJson(Map<String, dynamic> json) =>
      RotateChannelCredentialsResponse(
        arn: json.containsKey('Arn') ? json['Arn'] as String : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        hlsIngest: json.containsKey('HlsIngest')
            ? HlsIngest.fromJson(json['HlsIngest'])
            : null,
        id: json.containsKey('Id') ? json['Id'] as String : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

class RotateIngestEndpointCredentialsResponse {
  /// The Amazon Resource Name (ARN) assigned to the Channel.
  final String arn;

  /// A short text description of the Channel.
  final String description;

  final HlsIngest hlsIngest;

  /// The ID of the Channel.
  final String id;

  final Map<String, String> tags;

  RotateIngestEndpointCredentialsResponse({
    this.arn,
    this.description,
    this.hlsIngest,
    this.id,
    this.tags,
  });
  static RotateIngestEndpointCredentialsResponse fromJson(
          Map<String, dynamic> json) =>
      RotateIngestEndpointCredentialsResponse(
        arn: json.containsKey('Arn') ? json['Arn'] as String : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        hlsIngest: json.containsKey('HlsIngest')
            ? HlsIngest.fromJson(json['HlsIngest'])
            : null,
        id: json.containsKey('Id') ? json['Id'] as String : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

/// A configuration for accessing an external Secure Packager and Encoder Key
/// Exchange (SPEKE) service that will provide encryption keys.
class SpekeKeyProvider {
  /// An Amazon Resource Name (ARN) of a Certificate Manager certificate that
  /// MediaPackage will use for enforcing secure end-to-end data transfer with
  /// the key provider service.
  final String certificateArn;

  /// The resource ID to include in key requests.
  final String resourceId;

  /// An Amazon Resource Name (ARN) of an IAM role that AWS Elemental
  /// MediaPackage will assume when accessing the key provider service.
  final String roleArn;

  /// The system IDs to include in key requests.
  final List<String> systemIds;

  /// The URL of the external key provider service.
  final String url;

  SpekeKeyProvider({
    this.certificateArn,
    @required this.resourceId,
    @required this.roleArn,
    @required this.systemIds,
    @required this.url,
  });
  static SpekeKeyProvider fromJson(Map<String, dynamic> json) =>
      SpekeKeyProvider(
        certificateArn: json.containsKey('CertificateArn')
            ? json['CertificateArn'] as String
            : null,
        resourceId: json['ResourceId'] as String,
        roleArn: json['RoleArn'] as String,
        systemIds: (json['SystemIds'] as List).map((e) => e as String).toList(),
        url: json['Url'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A StreamSelection configuration.
class StreamSelection {
  /// The maximum video bitrate (bps) to include in output.
  final int maxVideoBitsPerSecond;

  /// The minimum video bitrate (bps) to include in output.
  final int minVideoBitsPerSecond;

  /// A directive that determines the order of streams in the output.
  final String streamOrder;

  StreamSelection({
    this.maxVideoBitsPerSecond,
    this.minVideoBitsPerSecond,
    this.streamOrder,
  });
  static StreamSelection fromJson(Map<String, dynamic> json) => StreamSelection(
        maxVideoBitsPerSecond: json.containsKey('MaxVideoBitsPerSecond')
            ? json['MaxVideoBitsPerSecond'] as int
            : null,
        minVideoBitsPerSecond: json.containsKey('MinVideoBitsPerSecond')
            ? json['MinVideoBitsPerSecond'] as int
            : null,
        streamOrder: json.containsKey('StreamOrder')
            ? json['StreamOrder'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class UpdateChannelResponse {
  /// The Amazon Resource Name (ARN) assigned to the Channel.
  final String arn;

  /// A short text description of the Channel.
  final String description;

  final HlsIngest hlsIngest;

  /// The ID of the Channel.
  final String id;

  final Map<String, String> tags;

  UpdateChannelResponse({
    this.arn,
    this.description,
    this.hlsIngest,
    this.id,
    this.tags,
  });
  static UpdateChannelResponse fromJson(Map<String, dynamic> json) =>
      UpdateChannelResponse(
        arn: json.containsKey('Arn') ? json['Arn'] as String : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        hlsIngest: json.containsKey('HlsIngest')
            ? HlsIngest.fromJson(json['HlsIngest'])
            : null,
        id: json.containsKey('Id') ? json['Id'] as String : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

class UpdateOriginEndpointResponse {
  /// The Amazon Resource Name (ARN) assigned to the OriginEndpoint.
  final String arn;

  /// The ID of the Channel the OriginEndpoint is associated with.
  final String channelId;

  final CmafPackage cmafPackage;

  final DashPackage dashPackage;

  /// A short text description of the OriginEndpoint.
  final String description;

  final HlsPackage hlsPackage;

  /// The ID of the OriginEndpoint.
  final String id;

  /// A short string appended to the end of the OriginEndpoint URL.
  final String manifestName;

  final MssPackage mssPackage;

  /// Maximum duration (seconds) of content to retain for startover playback. If
  /// not specified, startover playback will be disabled for the OriginEndpoint.
  final int startoverWindowSeconds;

  final Map<String, String> tags;

  /// Amount of delay (seconds) to enforce on the playback of live content. If
  /// not specified, there will be no time delay in effect for the
  /// OriginEndpoint.
  final int timeDelaySeconds;

  /// The URL of the packaged OriginEndpoint for consumption.
  final String url;

  /// A list of source IP CIDR blocks that will be allowed to access the
  /// OriginEndpoint.
  final List<String> whitelist;

  UpdateOriginEndpointResponse({
    this.arn,
    this.channelId,
    this.cmafPackage,
    this.dashPackage,
    this.description,
    this.hlsPackage,
    this.id,
    this.manifestName,
    this.mssPackage,
    this.startoverWindowSeconds,
    this.tags,
    this.timeDelaySeconds,
    this.url,
    this.whitelist,
  });
  static UpdateOriginEndpointResponse fromJson(Map<String, dynamic> json) =>
      UpdateOriginEndpointResponse(
        arn: json.containsKey('Arn') ? json['Arn'] as String : null,
        channelId:
            json.containsKey('ChannelId') ? json['ChannelId'] as String : null,
        cmafPackage: json.containsKey('CmafPackage')
            ? CmafPackage.fromJson(json['CmafPackage'])
            : null,
        dashPackage: json.containsKey('DashPackage')
            ? DashPackage.fromJson(json['DashPackage'])
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        hlsPackage: json.containsKey('HlsPackage')
            ? HlsPackage.fromJson(json['HlsPackage'])
            : null,
        id: json.containsKey('Id') ? json['Id'] as String : null,
        manifestName: json.containsKey('ManifestName')
            ? json['ManifestName'] as String
            : null,
        mssPackage: json.containsKey('MssPackage')
            ? MssPackage.fromJson(json['MssPackage'])
            : null,
        startoverWindowSeconds: json.containsKey('StartoverWindowSeconds')
            ? json['StartoverWindowSeconds'] as int
            : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        timeDelaySeconds: json.containsKey('TimeDelaySeconds')
            ? json['TimeDelaySeconds'] as int
            : null,
        url: json.containsKey('Url') ? json['Url'] as String : null,
        whitelist: json.containsKey('Whitelist')
            ? (json['Whitelist'] as List).map((e) => e as String).toList()
            : null,
      );
}
