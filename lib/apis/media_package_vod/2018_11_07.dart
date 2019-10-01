import 'package:meta/meta.dart';

/// AWS Elemental MediaPackage VOD
class MediaPackageVodApi {
  final _client;
  MediaPackageVodApi(client)
      : _client =
            client.configured('MediaPackage Vod', serializer: 'rest-json');

  /// Creates a new MediaPackage VOD Asset resource.
  ///
  /// [id]: The unique identifier for the Asset.
  ///
  /// [packagingGroupId]: The ID of the PackagingGroup for the Asset.
  ///
  /// [resourceId]: The resource ID to include in SPEKE key requests.
  ///
  /// [sourceArn]: ARN of the source object in S3.
  ///
  /// [sourceRoleArn]: The IAM role ARN used to access the source S3 bucket.
  Future<CreateAssetResponse> createAsset(
      {@required String id,
      @required String packagingGroupId,
      String resourceId,
      @required String sourceArn,
      @required String sourceRoleArn}) async {
    var response_ = await _client.send('CreateAsset', {
      'Id': id,
      'PackagingGroupId': packagingGroupId,
      if (resourceId != null) 'ResourceId': resourceId,
      'SourceArn': sourceArn,
      'SourceRoleArn': sourceRoleArn,
    });
    return CreateAssetResponse.fromJson(response_);
  }

  /// Creates a new MediaPackage VOD PackagingConfiguration resource.
  ///
  /// [id]: The ID of the PackagingConfiguration.
  ///
  /// [packagingGroupId]: The ID of a PackagingGroup.
  Future<CreatePackagingConfigurationResponse> createPackagingConfiguration(
      {CmafPackage cmafPackage,
      DashPackage dashPackage,
      HlsPackage hlsPackage,
      @required String id,
      MssPackage mssPackage,
      @required String packagingGroupId}) async {
    var response_ = await _client.send('CreatePackagingConfiguration', {
      if (cmafPackage != null) 'CmafPackage': cmafPackage,
      if (dashPackage != null) 'DashPackage': dashPackage,
      if (hlsPackage != null) 'HlsPackage': hlsPackage,
      'Id': id,
      if (mssPackage != null) 'MssPackage': mssPackage,
      'PackagingGroupId': packagingGroupId,
    });
    return CreatePackagingConfigurationResponse.fromJson(response_);
  }

  /// Creates a new MediaPackage VOD PackagingGroup resource.
  ///
  /// [id]: The ID of the PackagingGroup.
  Future<CreatePackagingGroupResponse> createPackagingGroup(String id) async {
    var response_ = await _client.send('CreatePackagingGroup', {
      'Id': id,
    });
    return CreatePackagingGroupResponse.fromJson(response_);
  }

  /// Deletes an existing MediaPackage VOD Asset resource.
  ///
  /// [id]: The ID of the MediaPackage VOD Asset resource to delete.
  Future<DeleteAssetResponse> deleteAsset(String id) async {
    var response_ = await _client.send('DeleteAsset', {
      'Id': id,
    });
    return DeleteAssetResponse.fromJson(response_);
  }

  /// Deletes a MediaPackage VOD PackagingConfiguration resource.
  ///
  /// [id]: The ID of the MediaPackage VOD PackagingConfiguration resource to
  /// delete.
  Future<DeletePackagingConfigurationResponse> deletePackagingConfiguration(
      String id) async {
    var response_ = await _client.send('DeletePackagingConfiguration', {
      'Id': id,
    });
    return DeletePackagingConfigurationResponse.fromJson(response_);
  }

  /// Deletes a MediaPackage VOD PackagingGroup resource.
  ///
  /// [id]: The ID of the MediaPackage VOD PackagingGroup resource to delete.
  Future<DeletePackagingGroupResponse> deletePackagingGroup(String id) async {
    var response_ = await _client.send('DeletePackagingGroup', {
      'Id': id,
    });
    return DeletePackagingGroupResponse.fromJson(response_);
  }

  /// Returns a description of a MediaPackage VOD Asset resource.
  ///
  /// [id]: The ID of an MediaPackage VOD Asset resource.
  Future<DescribeAssetResponse> describeAsset(String id) async {
    var response_ = await _client.send('DescribeAsset', {
      'Id': id,
    });
    return DescribeAssetResponse.fromJson(response_);
  }

  /// Returns a description of a MediaPackage VOD PackagingConfiguration
  /// resource.
  ///
  /// [id]: The ID of a MediaPackage VOD PackagingConfiguration resource.
  Future<DescribePackagingConfigurationResponse> describePackagingConfiguration(
      String id) async {
    var response_ = await _client.send('DescribePackagingConfiguration', {
      'Id': id,
    });
    return DescribePackagingConfigurationResponse.fromJson(response_);
  }

  /// Returns a description of a MediaPackage VOD PackagingGroup resource.
  ///
  /// [id]: The ID of a MediaPackage VOD PackagingGroup resource.
  Future<DescribePackagingGroupResponse> describePackagingGroup(
      String id) async {
    var response_ = await _client.send('DescribePackagingGroup', {
      'Id': id,
    });
    return DescribePackagingGroupResponse.fromJson(response_);
  }

  /// Returns a collection of MediaPackage VOD Asset resources.
  ///
  /// [maxResults]: Upper bound on number of records to return.
  ///
  /// [nextToken]: A token used to resume pagination from the end of a previous
  /// request.
  ///
  /// [packagingGroupId]: Returns Assets associated with the specified
  /// PackagingGroup.
  Future<ListAssetsResponse> listAssets(
      {int maxResults, String nextToken, String packagingGroupId}) async {
    var response_ = await _client.send('ListAssets', {
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (packagingGroupId != null) 'PackagingGroupId': packagingGroupId,
    });
    return ListAssetsResponse.fromJson(response_);
  }

  /// Returns a collection of MediaPackage VOD PackagingConfiguration resources.
  ///
  /// [maxResults]: Upper bound on number of records to return.
  ///
  /// [nextToken]: A token used to resume pagination from the end of a previous
  /// request.
  ///
  /// [packagingGroupId]: Returns MediaPackage VOD PackagingConfigurations
  /// associated with the specified PackagingGroup.
  Future<ListPackagingConfigurationsResponse> listPackagingConfigurations(
      {int maxResults, String nextToken, String packagingGroupId}) async {
    var response_ = await _client.send('ListPackagingConfigurations', {
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (packagingGroupId != null) 'PackagingGroupId': packagingGroupId,
    });
    return ListPackagingConfigurationsResponse.fromJson(response_);
  }

  /// Returns a collection of MediaPackage VOD PackagingGroup resources.
  ///
  /// [maxResults]: Upper bound on number of records to return.
  ///
  /// [nextToken]: A token used to resume pagination from the end of a previous
  /// request.
  Future<ListPackagingGroupsResponse> listPackagingGroups(
      {int maxResults, String nextToken}) async {
    var response_ = await _client.send('ListPackagingGroups', {
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListPackagingGroupsResponse.fromJson(response_);
  }
}

/// A MediaPackage VOD Asset resource.
class AssetShallow {
  /// The ARN of the Asset.
  final String arn;

  /// The unique identifier for the Asset.
  final String id;

  /// The ID of the PackagingGroup for the Asset.
  final String packagingGroupId;

  /// The resource ID to include in SPEKE key requests.
  final String resourceId;

  /// ARN of the source object in S3.
  final String sourceArn;

  /// The IAM role ARN used to access the source S3 bucket.
  final String sourceRoleArn;

  AssetShallow({
    this.arn,
    this.id,
    this.packagingGroupId,
    this.resourceId,
    this.sourceArn,
    this.sourceRoleArn,
  });
  static AssetShallow fromJson(Map<String, dynamic> json) => AssetShallow(
        arn: json.containsKey('Arn') ? json['Arn'] as String : null,
        id: json.containsKey('Id') ? json['Id'] as String : null,
        packagingGroupId: json.containsKey('PackagingGroupId')
            ? json['PackagingGroupId'] as String
            : null,
        resourceId: json.containsKey('ResourceId')
            ? json['ResourceId'] as String
            : null,
        sourceArn:
            json.containsKey('SourceArn') ? json['SourceArn'] as String : null,
        sourceRoleArn: json.containsKey('SourceRoleArn')
            ? json['SourceRoleArn'] as String
            : null,
      );
}

/// A CMAF encryption configuration.
class CmafEncryption {
  final SpekeKeyProvider spekeKeyProvider;

  CmafEncryption({
    @required this.spekeKeyProvider,
  });
  static CmafEncryption fromJson(Map<String, dynamic> json) => CmafEncryption(
        spekeKeyProvider: SpekeKeyProvider.fromJson(json['SpekeKeyProvider']),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A CMAF packaging configuration.
class CmafPackage {
  final CmafEncryption encryption;

  /// A list of HLS manifest configurations.
  final List<HlsManifest> hlsManifests;

  /// Duration (in seconds) of each fragment. Actual fragments will be rounded
  /// to the nearest multiple of the source fragment duration.
  final int segmentDurationSeconds;

  CmafPackage({
    this.encryption,
    @required this.hlsManifests,
    this.segmentDurationSeconds,
  });
  static CmafPackage fromJson(Map<String, dynamic> json) => CmafPackage(
        encryption: json.containsKey('Encryption')
            ? CmafEncryption.fromJson(json['Encryption'])
            : null,
        hlsManifests: (json['HlsManifests'] as List)
            .map((e) => HlsManifest.fromJson(e))
            .toList(),
        segmentDurationSeconds: json.containsKey('SegmentDurationSeconds')
            ? json['SegmentDurationSeconds'] as int
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class CreateAssetResponse {
  /// The ARN of the Asset.
  final String arn;

  /// The list of egress endpoints available for the Asset.
  final List<EgressEndpoint> egressEndpoints;

  /// The unique identifier for the Asset.
  final String id;

  /// The ID of the PackagingGroup for the Asset.
  final String packagingGroupId;

  /// The resource ID to include in SPEKE key requests.
  final String resourceId;

  /// ARN of the source object in S3.
  final String sourceArn;

  /// The IAM role_arn used to access the source S3 bucket.
  final String sourceRoleArn;

  CreateAssetResponse({
    this.arn,
    this.egressEndpoints,
    this.id,
    this.packagingGroupId,
    this.resourceId,
    this.sourceArn,
    this.sourceRoleArn,
  });
  static CreateAssetResponse fromJson(Map<String, dynamic> json) =>
      CreateAssetResponse(
        arn: json.containsKey('Arn') ? json['Arn'] as String : null,
        egressEndpoints: json.containsKey('EgressEndpoints')
            ? (json['EgressEndpoints'] as List)
                .map((e) => EgressEndpoint.fromJson(e))
                .toList()
            : null,
        id: json.containsKey('Id') ? json['Id'] as String : null,
        packagingGroupId: json.containsKey('PackagingGroupId')
            ? json['PackagingGroupId'] as String
            : null,
        resourceId: json.containsKey('ResourceId')
            ? json['ResourceId'] as String
            : null,
        sourceArn:
            json.containsKey('SourceArn') ? json['SourceArn'] as String : null,
        sourceRoleArn: json.containsKey('SourceRoleArn')
            ? json['SourceRoleArn'] as String
            : null,
      );
}

class CreatePackagingConfigurationResponse {
  /// The ARN of the PackagingConfiguration.
  final String arn;

  final CmafPackage cmafPackage;

  final DashPackage dashPackage;

  final HlsPackage hlsPackage;

  /// The ID of the PackagingConfiguration.
  final String id;

  final MssPackage mssPackage;

  /// The ID of a PackagingGroup.
  final String packagingGroupId;

  CreatePackagingConfigurationResponse({
    this.arn,
    this.cmafPackage,
    this.dashPackage,
    this.hlsPackage,
    this.id,
    this.mssPackage,
    this.packagingGroupId,
  });
  static CreatePackagingConfigurationResponse fromJson(
          Map<String, dynamic> json) =>
      CreatePackagingConfigurationResponse(
        arn: json.containsKey('Arn') ? json['Arn'] as String : null,
        cmafPackage: json.containsKey('CmafPackage')
            ? CmafPackage.fromJson(json['CmafPackage'])
            : null,
        dashPackage: json.containsKey('DashPackage')
            ? DashPackage.fromJson(json['DashPackage'])
            : null,
        hlsPackage: json.containsKey('HlsPackage')
            ? HlsPackage.fromJson(json['HlsPackage'])
            : null,
        id: json.containsKey('Id') ? json['Id'] as String : null,
        mssPackage: json.containsKey('MssPackage')
            ? MssPackage.fromJson(json['MssPackage'])
            : null,
        packagingGroupId: json.containsKey('PackagingGroupId')
            ? json['PackagingGroupId'] as String
            : null,
      );
}

class CreatePackagingGroupResponse {
  /// The ARN of the PackagingGroup.
  final String arn;

  /// The ID of the PackagingGroup.
  final String id;

  CreatePackagingGroupResponse({
    this.arn,
    this.id,
  });
  static CreatePackagingGroupResponse fromJson(Map<String, dynamic> json) =>
      CreatePackagingGroupResponse(
        arn: json.containsKey('Arn') ? json['Arn'] as String : null,
        id: json.containsKey('Id') ? json['Id'] as String : null,
      );
}

/// A Dynamic Adaptive Streaming over HTTP (DASH) encryption configuration.
class DashEncryption {
  final SpekeKeyProvider spekeKeyProvider;

  DashEncryption({
    @required this.spekeKeyProvider,
  });
  static DashEncryption fromJson(Map<String, dynamic> json) => DashEncryption(
        spekeKeyProvider: SpekeKeyProvider.fromJson(json['SpekeKeyProvider']),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A DASH manifest configuration.
class DashManifest {
  /// An optional string to include in the name of the manifest.
  final String manifestName;

  /// Minimum duration (in seconds) that a player will buffer media before
  /// starting the presentation.
  final int minBufferTimeSeconds;

  /// The Dynamic Adaptive Streaming over HTTP (DASH) profile type. When set to
  /// "HBBTV_1_5", HbbTV 1.5 compliant output is enabled.
  final String profile;

  final StreamSelection streamSelection;

  DashManifest({
    this.manifestName,
    this.minBufferTimeSeconds,
    this.profile,
    this.streamSelection,
  });
  static DashManifest fromJson(Map<String, dynamic> json) => DashManifest(
        manifestName: json.containsKey('ManifestName')
            ? json['ManifestName'] as String
            : null,
        minBufferTimeSeconds: json.containsKey('MinBufferTimeSeconds')
            ? json['MinBufferTimeSeconds'] as int
            : null,
        profile: json.containsKey('Profile') ? json['Profile'] as String : null,
        streamSelection: json.containsKey('StreamSelection')
            ? StreamSelection.fromJson(json['StreamSelection'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A Dynamic Adaptive Streaming over HTTP (DASH) packaging configuration.
class DashPackage {
  /// A list of DASH manifest configurations.
  final List<DashManifest> dashManifests;

  final DashEncryption encryption;

  /// Duration (in seconds) of each segment. Actual segments will be rounded to
  /// the nearest multiple of the source segment duration.
  final int segmentDurationSeconds;

  DashPackage({
    @required this.dashManifests,
    this.encryption,
    this.segmentDurationSeconds,
  });
  static DashPackage fromJson(Map<String, dynamic> json) => DashPackage(
        dashManifests: (json['DashManifests'] as List)
            .map((e) => DashManifest.fromJson(e))
            .toList(),
        encryption: json.containsKey('Encryption')
            ? DashEncryption.fromJson(json['Encryption'])
            : null,
        segmentDurationSeconds: json.containsKey('SegmentDurationSeconds')
            ? json['SegmentDurationSeconds'] as int
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class DeleteAssetResponse {
  DeleteAssetResponse();
  static DeleteAssetResponse fromJson(Map<String, dynamic> json) =>
      DeleteAssetResponse();
}

class DeletePackagingConfigurationResponse {
  DeletePackagingConfigurationResponse();
  static DeletePackagingConfigurationResponse fromJson(
          Map<String, dynamic> json) =>
      DeletePackagingConfigurationResponse();
}

class DeletePackagingGroupResponse {
  DeletePackagingGroupResponse();
  static DeletePackagingGroupResponse fromJson(Map<String, dynamic> json) =>
      DeletePackagingGroupResponse();
}

class DescribeAssetResponse {
  /// The ARN of the Asset.
  final String arn;

  /// The list of egress endpoints available for the Asset.
  final List<EgressEndpoint> egressEndpoints;

  /// The unique identifier for the Asset.
  final String id;

  /// The ID of the PackagingGroup for the Asset.
  final String packagingGroupId;

  /// The resource ID to include in SPEKE key requests.
  final String resourceId;

  /// ARN of the source object in S3.
  final String sourceArn;

  /// The IAM role_arn used to access the source S3 bucket.
  final String sourceRoleArn;

  DescribeAssetResponse({
    this.arn,
    this.egressEndpoints,
    this.id,
    this.packagingGroupId,
    this.resourceId,
    this.sourceArn,
    this.sourceRoleArn,
  });
  static DescribeAssetResponse fromJson(Map<String, dynamic> json) =>
      DescribeAssetResponse(
        arn: json.containsKey('Arn') ? json['Arn'] as String : null,
        egressEndpoints: json.containsKey('EgressEndpoints')
            ? (json['EgressEndpoints'] as List)
                .map((e) => EgressEndpoint.fromJson(e))
                .toList()
            : null,
        id: json.containsKey('Id') ? json['Id'] as String : null,
        packagingGroupId: json.containsKey('PackagingGroupId')
            ? json['PackagingGroupId'] as String
            : null,
        resourceId: json.containsKey('ResourceId')
            ? json['ResourceId'] as String
            : null,
        sourceArn:
            json.containsKey('SourceArn') ? json['SourceArn'] as String : null,
        sourceRoleArn: json.containsKey('SourceRoleArn')
            ? json['SourceRoleArn'] as String
            : null,
      );
}

class DescribePackagingConfigurationResponse {
  /// The ARN of the PackagingConfiguration.
  final String arn;

  final CmafPackage cmafPackage;

  final DashPackage dashPackage;

  final HlsPackage hlsPackage;

  /// The ID of the PackagingConfiguration.
  final String id;

  final MssPackage mssPackage;

  /// The ID of a PackagingGroup.
  final String packagingGroupId;

  DescribePackagingConfigurationResponse({
    this.arn,
    this.cmafPackage,
    this.dashPackage,
    this.hlsPackage,
    this.id,
    this.mssPackage,
    this.packagingGroupId,
  });
  static DescribePackagingConfigurationResponse fromJson(
          Map<String, dynamic> json) =>
      DescribePackagingConfigurationResponse(
        arn: json.containsKey('Arn') ? json['Arn'] as String : null,
        cmafPackage: json.containsKey('CmafPackage')
            ? CmafPackage.fromJson(json['CmafPackage'])
            : null,
        dashPackage: json.containsKey('DashPackage')
            ? DashPackage.fromJson(json['DashPackage'])
            : null,
        hlsPackage: json.containsKey('HlsPackage')
            ? HlsPackage.fromJson(json['HlsPackage'])
            : null,
        id: json.containsKey('Id') ? json['Id'] as String : null,
        mssPackage: json.containsKey('MssPackage')
            ? MssPackage.fromJson(json['MssPackage'])
            : null,
        packagingGroupId: json.containsKey('PackagingGroupId')
            ? json['PackagingGroupId'] as String
            : null,
      );
}

class DescribePackagingGroupResponse {
  /// The ARN of the PackagingGroup.
  final String arn;

  /// The ID of the PackagingGroup.
  final String id;

  DescribePackagingGroupResponse({
    this.arn,
    this.id,
  });
  static DescribePackagingGroupResponse fromJson(Map<String, dynamic> json) =>
      DescribePackagingGroupResponse(
        arn: json.containsKey('Arn') ? json['Arn'] as String : null,
        id: json.containsKey('Id') ? json['Id'] as String : null,
      );
}

/// The endpoint URL used to access an Asset using one PackagingConfiguration.
class EgressEndpoint {
  /// The ID of the PackagingConfiguration being applied to the Asset.
  final String packagingConfigurationId;

  /// The URL of the parent manifest for the repackaged Asset.
  final String url;

  EgressEndpoint({
    this.packagingConfigurationId,
    this.url,
  });
  static EgressEndpoint fromJson(Map<String, dynamic> json) => EgressEndpoint(
        packagingConfigurationId: json.containsKey('PackagingConfigurationId')
            ? json['PackagingConfigurationId'] as String
            : null,
        url: json.containsKey('Url') ? json['Url'] as String : null,
      );
}

/// An HTTP Live Streaming (HLS) encryption configuration.
class HlsEncryption {
  /// A constant initialization vector for encryption (optional). When not
  /// specified the initialization vector will be periodically rotated.
  final String constantInitializationVector;

  /// The encryption method to use.
  final String encryptionMethod;

  final SpekeKeyProvider spekeKeyProvider;

  HlsEncryption({
    this.constantInitializationVector,
    this.encryptionMethod,
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
        spekeKeyProvider: SpekeKeyProvider.fromJson(json['SpekeKeyProvider']),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// An HTTP Live Streaming (HLS) manifest configuration.
class HlsManifest {
  /// This setting controls how ad markers are included in the packaged
  /// OriginEndpoint. "NONE" will omit all SCTE-35 ad markers from the output.
  /// "PASSTHROUGH" causes the manifest to contain a copy of the SCTE-35 ad
  /// markers (comments) taken directly from the input HTTP Live Streaming (HLS)
  /// manifest. "SCTE35_ENHANCED" generates ad markers and blackout tags based
  /// on SCTE-35 messages in the input source.
  final String adMarkers;

  /// When enabled, an I-Frame only stream will be included in the output.
  final bool includeIframeOnlyStream;

  /// An optional string to include in the name of the manifest.
  final String manifestName;

  /// The interval (in seconds) between each EXT-X-PROGRAM-DATE-TIME tag
  /// inserted into manifests. Additionally, when an interval is specified
  /// ID3Timed Metadata messages will be generated every 5 seconds using the
  /// ingest time of the content. If the interval is not specified, or set to 0,
  /// then no EXT-X-PROGRAM-DATE-TIME tags will be inserted into manifests and
  /// no ID3Timed Metadata messages will be generated. Note that irrespective of
  /// this parameter, if any ID3 Timed Metadata is found in HTTP Live Streaming
  /// (HLS) input, it will be passed through to HLS output.
  final int programDateTimeIntervalSeconds;

  /// When enabled, the EXT-X-KEY tag will be repeated in output manifests.
  final bool repeatExtxKey;

  final StreamSelection streamSelection;

  HlsManifest({
    this.adMarkers,
    this.includeIframeOnlyStream,
    this.manifestName,
    this.programDateTimeIntervalSeconds,
    this.repeatExtxKey,
    this.streamSelection,
  });
  static HlsManifest fromJson(Map<String, dynamic> json) => HlsManifest(
        adMarkers:
            json.containsKey('AdMarkers') ? json['AdMarkers'] as String : null,
        includeIframeOnlyStream: json.containsKey('IncludeIframeOnlyStream')
            ? json['IncludeIframeOnlyStream'] as bool
            : null,
        manifestName: json.containsKey('ManifestName')
            ? json['ManifestName'] as String
            : null,
        programDateTimeIntervalSeconds:
            json.containsKey('ProgramDateTimeIntervalSeconds')
                ? json['ProgramDateTimeIntervalSeconds'] as int
                : null,
        repeatExtxKey: json.containsKey('RepeatExtXKey')
            ? json['RepeatExtXKey'] as bool
            : null,
        streamSelection: json.containsKey('StreamSelection')
            ? StreamSelection.fromJson(json['StreamSelection'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// An HTTP Live Streaming (HLS) packaging configuration.
class HlsPackage {
  final HlsEncryption encryption;

  /// A list of HLS manifest configurations.
  final List<HlsManifest> hlsManifests;

  /// Duration (in seconds) of each fragment. Actual fragments will be rounded
  /// to the nearest multiple of the source fragment duration.
  final int segmentDurationSeconds;

  /// When enabled, audio streams will be placed in rendition groups in the
  /// output.
  final bool useAudioRenditionGroup;

  HlsPackage({
    this.encryption,
    @required this.hlsManifests,
    this.segmentDurationSeconds,
    this.useAudioRenditionGroup,
  });
  static HlsPackage fromJson(Map<String, dynamic> json) => HlsPackage(
        encryption: json.containsKey('Encryption')
            ? HlsEncryption.fromJson(json['Encryption'])
            : null,
        hlsManifests: (json['HlsManifests'] as List)
            .map((e) => HlsManifest.fromJson(e))
            .toList(),
        segmentDurationSeconds: json.containsKey('SegmentDurationSeconds')
            ? json['SegmentDurationSeconds'] as int
            : null,
        useAudioRenditionGroup: json.containsKey('UseAudioRenditionGroup')
            ? json['UseAudioRenditionGroup'] as bool
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class ListAssetsResponse {
  /// A list of MediaPackage VOD Asset resources.
  final List<AssetShallow> assets;

  /// A token that can be used to resume pagination from the end of the
  /// collection.
  final String nextToken;

  ListAssetsResponse({
    this.assets,
    this.nextToken,
  });
  static ListAssetsResponse fromJson(Map<String, dynamic> json) =>
      ListAssetsResponse(
        assets: json.containsKey('Assets')
            ? (json['Assets'] as List)
                .map((e) => AssetShallow.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListPackagingConfigurationsResponse {
  /// A token that can be used to resume pagination from the end of the
  /// collection.
  final String nextToken;

  /// A list of MediaPackage VOD PackagingConfiguration resources.
  final List<PackagingConfiguration> packagingConfigurations;

  ListPackagingConfigurationsResponse({
    this.nextToken,
    this.packagingConfigurations,
  });
  static ListPackagingConfigurationsResponse fromJson(
          Map<String, dynamic> json) =>
      ListPackagingConfigurationsResponse(
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
        packagingConfigurations: json.containsKey('PackagingConfigurations')
            ? (json['PackagingConfigurations'] as List)
                .map((e) => PackagingConfiguration.fromJson(e))
                .toList()
            : null,
      );
}

class ListPackagingGroupsResponse {
  /// A token that can be used to resume pagination from the end of the
  /// collection.
  final String nextToken;

  /// A list of MediaPackage VOD PackagingGroup resources.
  final List<PackagingGroup> packagingGroups;

  ListPackagingGroupsResponse({
    this.nextToken,
    this.packagingGroups,
  });
  static ListPackagingGroupsResponse fromJson(Map<String, dynamic> json) =>
      ListPackagingGroupsResponse(
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
        packagingGroups: json.containsKey('PackagingGroups')
            ? (json['PackagingGroups'] as List)
                .map((e) => PackagingGroup.fromJson(e))
                .toList()
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

/// A Microsoft Smooth Streaming (MSS) manifest configuration.
class MssManifest {
  /// An optional string to include in the name of the manifest.
  final String manifestName;

  final StreamSelection streamSelection;

  MssManifest({
    this.manifestName,
    this.streamSelection,
  });
  static MssManifest fromJson(Map<String, dynamic> json) => MssManifest(
        manifestName: json.containsKey('ManifestName')
            ? json['ManifestName'] as String
            : null,
        streamSelection: json.containsKey('StreamSelection')
            ? StreamSelection.fromJson(json['StreamSelection'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A Microsoft Smooth Streaming (MSS) PackagingConfiguration.
class MssPackage {
  final MssEncryption encryption;

  /// A list of MSS manifest configurations.
  final List<MssManifest> mssManifests;

  /// The duration (in seconds) of each segment.
  final int segmentDurationSeconds;

  MssPackage({
    this.encryption,
    @required this.mssManifests,
    this.segmentDurationSeconds,
  });
  static MssPackage fromJson(Map<String, dynamic> json) => MssPackage(
        encryption: json.containsKey('Encryption')
            ? MssEncryption.fromJson(json['Encryption'])
            : null,
        mssManifests: (json['MssManifests'] as List)
            .map((e) => MssManifest.fromJson(e))
            .toList(),
        segmentDurationSeconds: json.containsKey('SegmentDurationSeconds')
            ? json['SegmentDurationSeconds'] as int
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A MediaPackage VOD PackagingConfiguration resource.
class PackagingConfiguration {
  /// The ARN of the PackagingConfiguration.
  final String arn;

  final CmafPackage cmafPackage;

  final DashPackage dashPackage;

  final HlsPackage hlsPackage;

  /// The ID of the PackagingConfiguration.
  final String id;

  final MssPackage mssPackage;

  /// The ID of a PackagingGroup.
  final String packagingGroupId;

  PackagingConfiguration({
    this.arn,
    this.cmafPackage,
    this.dashPackage,
    this.hlsPackage,
    this.id,
    this.mssPackage,
    this.packagingGroupId,
  });
  static PackagingConfiguration fromJson(Map<String, dynamic> json) =>
      PackagingConfiguration(
        arn: json.containsKey('Arn') ? json['Arn'] as String : null,
        cmafPackage: json.containsKey('CmafPackage')
            ? CmafPackage.fromJson(json['CmafPackage'])
            : null,
        dashPackage: json.containsKey('DashPackage')
            ? DashPackage.fromJson(json['DashPackage'])
            : null,
        hlsPackage: json.containsKey('HlsPackage')
            ? HlsPackage.fromJson(json['HlsPackage'])
            : null,
        id: json.containsKey('Id') ? json['Id'] as String : null,
        mssPackage: json.containsKey('MssPackage')
            ? MssPackage.fromJson(json['MssPackage'])
            : null,
        packagingGroupId: json.containsKey('PackagingGroupId')
            ? json['PackagingGroupId'] as String
            : null,
      );
}

/// A MediaPackage VOD PackagingGroup resource.
class PackagingGroup {
  /// The ARN of the PackagingGroup.
  final String arn;

  /// The ID of the PackagingGroup.
  final String id;

  PackagingGroup({
    this.arn,
    this.id,
  });
  static PackagingGroup fromJson(Map<String, dynamic> json) => PackagingGroup(
        arn: json.containsKey('Arn') ? json['Arn'] as String : null,
        id: json.containsKey('Id') ? json['Id'] as String : null,
      );
}

/// A configuration for accessing an external Secure Packager and Encoder Key
/// Exchange (SPEKE) service that will provide encryption keys.
class SpekeKeyProvider {
  /// An Amazon Resource Name (ARN) of an IAM role that AWS Elemental
  /// MediaPackage will assume when accessing the key provider service.
  final String roleArn;

  /// The system IDs to include in key requests.
  final List<String> systemIds;

  /// The URL of the external key provider service.
  final String url;

  SpekeKeyProvider({
    @required this.roleArn,
    @required this.systemIds,
    @required this.url,
  });
  static SpekeKeyProvider fromJson(Map<String, dynamic> json) =>
      SpekeKeyProvider(
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
