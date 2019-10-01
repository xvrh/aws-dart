import 'package:meta/meta.dart';

/// AWS Elemental MediaPackage VOD
class MediaPackageVodApi {
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
    return CreateAssetResponse.fromJson({});
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
    return CreatePackagingConfigurationResponse.fromJson({});
  }

  /// Creates a new MediaPackage VOD PackagingGroup resource.
  ///
  /// [id]: The ID of the PackagingGroup.
  Future<CreatePackagingGroupResponse> createPackagingGroup(String id) async {
    return CreatePackagingGroupResponse.fromJson({});
  }

  /// Deletes an existing MediaPackage VOD Asset resource.
  ///
  /// [id]: The ID of the MediaPackage VOD Asset resource to delete.
  Future<DeleteAssetResponse> deleteAsset(String id) async {
    return DeleteAssetResponse.fromJson({});
  }

  /// Deletes a MediaPackage VOD PackagingConfiguration resource.
  ///
  /// [id]: The ID of the MediaPackage VOD PackagingConfiguration resource to
  /// delete.
  Future<DeletePackagingConfigurationResponse> deletePackagingConfiguration(
      String id) async {
    return DeletePackagingConfigurationResponse.fromJson({});
  }

  /// Deletes a MediaPackage VOD PackagingGroup resource.
  ///
  /// [id]: The ID of the MediaPackage VOD PackagingGroup resource to delete.
  Future<DeletePackagingGroupResponse> deletePackagingGroup(String id) async {
    return DeletePackagingGroupResponse.fromJson({});
  }

  /// Returns a description of a MediaPackage VOD Asset resource.
  ///
  /// [id]: The ID of an MediaPackage VOD Asset resource.
  Future<DescribeAssetResponse> describeAsset(String id) async {
    return DescribeAssetResponse.fromJson({});
  }

  /// Returns a description of a MediaPackage VOD PackagingConfiguration
  /// resource.
  ///
  /// [id]: The ID of a MediaPackage VOD PackagingConfiguration resource.
  Future<DescribePackagingConfigurationResponse> describePackagingConfiguration(
      String id) async {
    return DescribePackagingConfigurationResponse.fromJson({});
  }

  /// Returns a description of a MediaPackage VOD PackagingGroup resource.
  ///
  /// [id]: The ID of a MediaPackage VOD PackagingGroup resource.
  Future<DescribePackagingGroupResponse> describePackagingGroup(
      String id) async {
    return DescribePackagingGroupResponse.fromJson({});
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
    return ListAssetsResponse.fromJson({});
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
    return ListPackagingConfigurationsResponse.fromJson({});
  }

  /// Returns a collection of MediaPackage VOD PackagingGroup resources.
  ///
  /// [maxResults]: Upper bound on number of records to return.
  ///
  /// [nextToken]: A token used to resume pagination from the end of a previous
  /// request.
  Future<ListPackagingGroupsResponse> listPackagingGroups(
      {int maxResults, String nextToken}) async {
    return ListPackagingGroupsResponse.fromJson({});
  }
}

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
  static AssetShallow fromJson(Map<String, dynamic> json) => AssetShallow();
}

class CmafEncryption {
  final SpekeKeyProvider spekeKeyProvider;

  CmafEncryption({
    @required this.spekeKeyProvider,
  });
  static CmafEncryption fromJson(Map<String, dynamic> json) => CmafEncryption();
}

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
  static CmafPackage fromJson(Map<String, dynamic> json) => CmafPackage();
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
      CreateAssetResponse();
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
      CreatePackagingConfigurationResponse();
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
      CreatePackagingGroupResponse();
}

class DashEncryption {
  final SpekeKeyProvider spekeKeyProvider;

  DashEncryption({
    @required this.spekeKeyProvider,
  });
  static DashEncryption fromJson(Map<String, dynamic> json) => DashEncryption();
}

class DashManifest {
  /// An optional string to include in the name of the manifest.
  final String manifestName;

  /// Minimum duration (in seconds) that a player will buffer media before
  /// starting the presentation.
  final int minBufferTimeSeconds;

  /// The Dynamic Adaptive Streaming over HTTP (DASH) profile type. When set to
  /// "HBBTV\_1\_5", HbbTV 1.5 compliant output is enabled.
  final String profile;

  final StreamSelection streamSelection;

  DashManifest({
    this.manifestName,
    this.minBufferTimeSeconds,
    this.profile,
    this.streamSelection,
  });
  static DashManifest fromJson(Map<String, dynamic> json) => DashManifest();
}

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
  static DashPackage fromJson(Map<String, dynamic> json) => DashPackage();
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
      DescribeAssetResponse();
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
      DescribePackagingConfigurationResponse();
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
      DescribePackagingGroupResponse();
}

class EgressEndpoint {
  /// The ID of the PackagingConfiguration being applied to the Asset.
  final String packagingConfigurationId;

  /// The URL of the parent manifest for the repackaged Asset.
  final String url;

  EgressEndpoint({
    this.packagingConfigurationId,
    this.url,
  });
  static EgressEndpoint fromJson(Map<String, dynamic> json) => EgressEndpoint();
}

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
  static HlsEncryption fromJson(Map<String, dynamic> json) => HlsEncryption();
}

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
  static HlsManifest fromJson(Map<String, dynamic> json) => HlsManifest();
}

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
  static HlsPackage fromJson(Map<String, dynamic> json) => HlsPackage();
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
      ListAssetsResponse();
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
      ListPackagingConfigurationsResponse();
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
      ListPackagingGroupsResponse();
}

class MssEncryption {
  final SpekeKeyProvider spekeKeyProvider;

  MssEncryption({
    @required this.spekeKeyProvider,
  });
  static MssEncryption fromJson(Map<String, dynamic> json) => MssEncryption();
}

class MssManifest {
  /// An optional string to include in the name of the manifest.
  final String manifestName;

  final StreamSelection streamSelection;

  MssManifest({
    this.manifestName,
    this.streamSelection,
  });
  static MssManifest fromJson(Map<String, dynamic> json) => MssManifest();
}

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
  static MssPackage fromJson(Map<String, dynamic> json) => MssPackage();
}

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
      PackagingConfiguration();
}

class PackagingGroup {
  /// The ARN of the PackagingGroup.
  final String arn;

  /// The ID of the PackagingGroup.
  final String id;

  PackagingGroup({
    this.arn,
    this.id,
  });
  static PackagingGroup fromJson(Map<String, dynamic> json) => PackagingGroup();
}

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
      SpekeKeyProvider();
}

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
  static StreamSelection fromJson(Map<String, dynamic> json) =>
      StreamSelection();
}
