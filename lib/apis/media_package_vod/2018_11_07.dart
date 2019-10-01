import 'package:meta/meta.dart';

/// AWS Elemental MediaPackage VOD
class MediaPackageVodApi {
  /// Creates a new MediaPackage VOD Asset resource.
  Future<void> createAsset(
      {@required String id,
      @required String packagingGroupId,
      String resourceId,
      @required String sourceArn,
      @required String sourceRoleArn}) async {}

  /// Creates a new MediaPackage VOD PackagingConfiguration resource.
  Future<void> createPackagingConfiguration(
      {CmafPackage cmafPackage,
      DashPackage dashPackage,
      HlsPackage hlsPackage,
      @required String id,
      MssPackage mssPackage,
      @required String packagingGroupId}) async {}

  /// Creates a new MediaPackage VOD PackagingGroup resource.
  Future<void> createPackagingGroup(String id) async {}

  /// Deletes an existing MediaPackage VOD Asset resource.
  Future<void> deleteAsset(String id) async {}

  /// Deletes a MediaPackage VOD PackagingConfiguration resource.
  Future<void> deletePackagingConfiguration(String id) async {}

  /// Deletes a MediaPackage VOD PackagingGroup resource.
  Future<void> deletePackagingGroup(String id) async {}

  /// Returns a description of a MediaPackage VOD Asset resource.
  Future<void> describeAsset(String id) async {}

  /// Returns a description of a MediaPackage VOD PackagingConfiguration
  /// resource.
  Future<void> describePackagingConfiguration(String id) async {}

  /// Returns a description of a MediaPackage VOD PackagingGroup resource.
  Future<void> describePackagingGroup(String id) async {}

  /// Returns a collection of MediaPackage VOD Asset resources.
  Future<void> listAssets(
      {int maxResults, String nextToken, String packagingGroupId}) async {}

  /// Returns a collection of MediaPackage VOD PackagingConfiguration resources.
  Future<void> listPackagingConfigurations(
      {int maxResults, String nextToken, String packagingGroupId}) async {}

  /// Returns a collection of MediaPackage VOD PackagingGroup resources.
  Future<void> listPackagingGroups({int maxResults, String nextToken}) async {}
}

class AssetShallow {}

class CmafEncryption {}

class CmafPackage {}

class CreateAssetResponse {}

class CreatePackagingConfigurationResponse {}

class CreatePackagingGroupResponse {}

class DashEncryption {}

class DashManifest {}

class DashPackage {}

class DeleteAssetResponse {}

class DeletePackagingConfigurationResponse {}

class DeletePackagingGroupResponse {}

class DescribeAssetResponse {}

class DescribePackagingConfigurationResponse {}

class DescribePackagingGroupResponse {}

class EgressEndpoint {}

class HlsEncryption {}

class HlsManifest {}

class HlsPackage {}

class ListAssetsResponse {}

class ListPackagingConfigurationsResponse {}

class ListPackagingGroupsResponse {}

class MssEncryption {}

class MssManifest {}

class MssPackage {}

class PackagingConfiguration {}

class PackagingGroup {}

class SpekeKeyProvider {}

class StreamSelection {}
