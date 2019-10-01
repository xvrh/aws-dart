import 'package:meta/meta.dart';

/// AWS Lake Formation
///
/// Defines the public endpoint for the AWS Lake Formation service.
class LakeFormationApi {
  /// Batch operation to grant permissions to the principal.
  Future<void> batchGrantPermissions(List<BatchPermissionsRequestEntry> entries,
      {String catalogId}) async {}

  /// Batch operation to revoke permissions from the principal.
  Future<void> batchRevokePermissions(
      List<BatchPermissionsRequestEntry> entries,
      {String catalogId}) async {}

  /// Deregisters the resource as managed by the Data Catalog.
  ///
  /// When you deregister a path, Lake Formation removes the path from the
  /// inline policy attached to your service-linked role.
  Future<void> deregisterResource(String resourceArn) async {}

  /// Retrieves the current data access role for the given resource registered
  /// in AWS Lake Formation.
  Future<void> describeResource(String resourceArn) async {}

  /// The AWS Lake Formation principal.
  Future<void> getDataLakeSettings({String catalogId}) async {}

  /// Returns the permissions for a specified table or database resource located
  /// at a path in Amazon S3.
  Future<void> getEffectivePermissionsForPath(String resourceArn,
      {String catalogId, String nextToken, int maxResults}) async {}

  /// Grants permissions to the principal to access metadata in the Data Catalog
  /// and data organized in underlying data storage such as Amazon S3.
  ///
  /// For information about permissions, see [Security and Access Control to
  /// Metadata and
  /// Data](https://docs-aws.amazon.com/michigan/latest/dg/security-data-access.html).
  Future<void> grantPermissions(
      {String catalogId,
      @required DataLakePrincipal principal,
      @required Resource resource,
      @required List<String> permissions,
      List<String> permissionsWithGrantOption}) async {}

  /// Returns a list of the principal permissions on the resource, filtered by
  /// the permissions of the caller. For example, if you are granted an ALTER
  /// permission, you are able to see only the principal permissions for ALTER.
  ///
  /// This operation returns only those permissions that have been explicitly
  /// granted.
  ///
  /// For information about permissions, see [Security and Access Control to
  /// Metadata and
  /// Data](https://docs-aws.amazon.com/michigan/latest/dg/security-data-access.html).
  Future<void> listPermissions(
      {String catalogId,
      DataLakePrincipal principal,
      String resourceType,
      Resource resource,
      String nextToken,
      int maxResults}) async {}

  /// Lists the resources registered to be managed by the Data Catalog.
  Future<void> listResources(
      {List<FilterCondition> filterConditionList,
      int maxResults,
      String nextToken}) async {}

  /// The AWS Lake Formation principal.
  Future<void> putDataLakeSettings(DataLakeSettings dataLakeSettings,
      {String catalogId}) async {}

  /// Registers the resource as managed by the Data Catalog.
  ///
  /// To add or update data, Lake Formation needs read/write access to the
  /// chosen Amazon S3 path. Choose a role that you know has permission to do
  /// this, or choose the AWSServiceRoleForLakeFormationDataAccess
  /// service-linked role. When you register the first Amazon S3 path, the
  /// service-linked role and a new inline policy are created on your behalf.
  /// Lake Formation adds the first path to the inline policy and attaches it to
  /// the service-linked role. When you register subsequent paths, Lake
  /// Formation adds the path to the existing policy.
  Future<void> registerResource(String resourceArn,
      {bool useServiceLinkedRole, String roleArn}) async {}

  /// Revokes permissions to the principal to access metadata in the Data
  /// Catalog and data organized in underlying data storage such as Amazon S3.
  Future<void> revokePermissions(
      {String catalogId,
      @required DataLakePrincipal principal,
      @required Resource resource,
      @required List<String> permissions,
      List<String> permissionsWithGrantOption}) async {}

  /// Updates the data access role used for vending access to the given
  /// (registered) resource in AWS Lake Formation.
  Future<void> updateResource(
      {@required String roleArn, @required String resourceArn}) async {}
}

class BatchGrantPermissionsResponse {}

class BatchPermissionsFailureEntry {}

class BatchPermissionsRequestEntry {}

class BatchRevokePermissionsResponse {}

class CatalogResource {}

class ColumnWildcard {}

class DataLakePrincipal {}

class DataLakeSettings {}

class DataLocationResource {}

class DatabaseResource {}

class DeregisterResourceResponse {}

class DescribeResourceResponse {}

class ErrorDetail {}

class FilterCondition {}

class GetDataLakeSettingsResponse {}

class GetEffectivePermissionsForPathResponse {}

class GrantPermissionsResponse {}

class ListPermissionsResponse {}

class ListResourcesResponse {}

class PrincipalPermissions {}

class PrincipalResourcePermissions {}

class PutDataLakeSettingsResponse {}

class RegisterResourceResponse {}

class Resource {}

class ResourceInfo {}

class RevokePermissionsResponse {}

class TableResource {}

class TableWithColumnsResource {}

class UpdateResourceResponse {}
