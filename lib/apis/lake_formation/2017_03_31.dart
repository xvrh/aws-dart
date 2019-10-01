import 'package:meta/meta.dart';

/// AWS Lake Formation
///
/// Defines the public endpoint for the AWS Lake Formation service.
class LakeFormationApi {
  /// Batch operation to grant permissions to the principal.
  ///
  /// [catalogId]: The identifier for the Data Catalog. By default, the account
  /// ID. The Data Catalog is the persistent metadata store. It contains
  /// database definitions, table definitions, and other control information to
  /// manage your AWS Lake Formation environment.
  ///
  /// [entries]: A list of up to 20 entries for resource permissions to be
  /// granted by batch operation to the principal.
  Future<BatchGrantPermissionsResponse> batchGrantPermissions(
      List<BatchPermissionsRequestEntry> entries,
      {String catalogId}) async {
    return BatchGrantPermissionsResponse.fromJson({});
  }

  /// Batch operation to revoke permissions from the principal.
  ///
  /// [catalogId]: The identifier for the Data Catalog. By default, the account
  /// ID. The Data Catalog is the persistent metadata store. It contains
  /// database definitions, table definitions, and other control information to
  /// manage your AWS Lake Formation environment.
  ///
  /// [entries]: A list of up to 20 entries for resource permissions to be
  /// revoked by batch operation to the principal.
  Future<BatchRevokePermissionsResponse> batchRevokePermissions(
      List<BatchPermissionsRequestEntry> entries,
      {String catalogId}) async {
    return BatchRevokePermissionsResponse.fromJson({});
  }

  /// Deregisters the resource as managed by the Data Catalog.
  ///
  /// When you deregister a path, Lake Formation removes the path from the
  /// inline policy attached to your service-linked role.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the resource that you
  /// want to deregister.
  Future<DeregisterResourceResponse> deregisterResource(
      String resourceArn) async {
    return DeregisterResourceResponse.fromJson({});
  }

  /// Retrieves the current data access role for the given resource registered
  /// in AWS Lake Formation.
  ///
  /// [resourceArn]: The resource ARN.
  Future<DescribeResourceResponse> describeResource(String resourceArn) async {
    return DescribeResourceResponse.fromJson({});
  }

  /// The AWS Lake Formation principal.
  ///
  /// [catalogId]: The identifier for the Data Catalog. By default, the account
  /// ID. The Data Catalog is the persistent metadata store. It contains
  /// database definitions, table definitions, and other control information to
  /// manage your AWS Lake Formation environment.
  Future<GetDataLakeSettingsResponse> getDataLakeSettings(
      {String catalogId}) async {
    return GetDataLakeSettingsResponse.fromJson({});
  }

  /// Returns the permissions for a specified table or database resource located
  /// at a path in Amazon S3.
  ///
  /// [catalogId]: The identifier for the Data Catalog. By default, the account
  /// ID. The Data Catalog is the persistent metadata store. It contains
  /// database definitions, table definitions, and other control information to
  /// manage your AWS Lake Formation environment.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the resource for which
  /// you want to get permissions.
  ///
  /// [nextToken]: A continuation token, if this is not the first call to
  /// retrieve this list.
  ///
  /// [maxResults]: The maximum number of results to return.
  Future<GetEffectivePermissionsForPathResponse> getEffectivePermissionsForPath(
      String resourceArn,
      {String catalogId,
      String nextToken,
      int maxResults}) async {
    return GetEffectivePermissionsForPathResponse.fromJson({});
  }

  /// Grants permissions to the principal to access metadata in the Data Catalog
  /// and data organized in underlying data storage such as Amazon S3.
  ///
  /// For information about permissions, see [Security and Access Control to
  /// Metadata and
  /// Data](https://docs-aws.amazon.com/michigan/latest/dg/security-data-access.html).
  ///
  /// [catalogId]: The identifier for the Data Catalog. By default, the account
  /// ID. The Data Catalog is the persistent metadata store. It contains
  /// database definitions, table definitions, and other control information to
  /// manage your AWS Lake Formation environment.
  ///
  /// [principal]: The principal to be granted the permissions on the resource.
  /// Supported principals are IAM users or IAM roles, and they are defined by
  /// their principal type and their ARN.
  ///
  /// Note that if you define a resource with a particular ARN, then later
  /// delete, and recreate a resource with that same ARN, the resource maintains
  /// the permissions already granted.
  ///
  /// [resource]: The resource to which permissions are to be granted. Resources
  /// in AWS Lake Formation are the Data Catalog, databases, and tables.
  ///
  /// [permissions]: The permissions granted to the principal on the resource.
  /// AWS Lake Formation defines privileges to grant and revoke access to
  /// metadata in the Data Catalog and data organized in underlying data storage
  /// such as Amazon S3. AWS Lake Formation requires that each principal be
  /// authorized to perform a specific task on AWS Lake Formation resources.
  ///
  /// [permissionsWithGrantOption]: Indicates a list of the granted permissions
  /// that the principal may pass to other users. These permissions may only be
  /// a subset of the permissions granted in the `Privileges`.
  Future<GrantPermissionsResponse> grantPermissions(
      {String catalogId,
      @required DataLakePrincipal principal,
      @required Resource resource,
      @required List<String> permissions,
      List<String> permissionsWithGrantOption}) async {
    return GrantPermissionsResponse.fromJson({});
  }

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
  ///
  /// [catalogId]: The identifier for the Data Catalog. By default, the account
  /// ID. The Data Catalog is the persistent metadata store. It contains
  /// database definitions, table definitions, and other control information to
  /// manage your AWS Lake Formation environment.
  ///
  /// [principal]: Specifies a principal to filter the permissions returned.
  ///
  /// [resourceType]: Specifies a resource type to filter the permissions
  /// returned.
  ///
  /// [resource]: A resource where you will get a list of the principal
  /// permissions.
  ///
  /// This operation does not support getting privileges on a table with
  /// columns. Instead, call this operation on the table, and the operation
  /// returns the table and the table w columns.
  ///
  /// [nextToken]: A continuation token, if this is not the first call to
  /// retrieve this list.
  ///
  /// [maxResults]: The maximum number of results to return.
  Future<ListPermissionsResponse> listPermissions(
      {String catalogId,
      DataLakePrincipal principal,
      String resourceType,
      Resource resource,
      String nextToken,
      int maxResults}) async {
    return ListPermissionsResponse.fromJson({});
  }

  /// Lists the resources registered to be managed by the Data Catalog.
  ///
  /// [filterConditionList]: Any applicable row-level and/or column-level
  /// filtering conditions for the resources.
  ///
  /// [maxResults]: The maximum number of resource results.
  ///
  /// [nextToken]: A continuation token, if this is not the first call to
  /// retrieve these resources.
  Future<ListResourcesResponse> listResources(
      {List<FilterCondition> filterConditionList,
      int maxResults,
      String nextToken}) async {
    return ListResourcesResponse.fromJson({});
  }

  /// The AWS Lake Formation principal.
  ///
  /// [catalogId]: The identifier for the Data Catalog. By default, the account
  /// ID. The Data Catalog is the persistent metadata store. It contains
  /// database definitions, table definitions, and other control information to
  /// manage your AWS Lake Formation environment.
  ///
  /// [dataLakeSettings]: A list of AWS Lake Formation principals.
  Future<PutDataLakeSettingsResponse> putDataLakeSettings(
      DataLakeSettings dataLakeSettings,
      {String catalogId}) async {
    return PutDataLakeSettingsResponse.fromJson({});
  }

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
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the resource that you
  /// want to register.
  ///
  /// [useServiceLinkedRole]: Designates a trusted caller, an IAM principal, by
  /// registering this caller with the Data Catalog.
  ///
  /// [roleArn]: The identifier for the role.
  Future<RegisterResourceResponse> registerResource(String resourceArn,
      {bool useServiceLinkedRole, String roleArn}) async {
    return RegisterResourceResponse.fromJson({});
  }

  /// Revokes permissions to the principal to access metadata in the Data
  /// Catalog and data organized in underlying data storage such as Amazon S3.
  ///
  /// [catalogId]: The identifier for the Data Catalog. By default, the account
  /// ID. The Data Catalog is the persistent metadata store. It contains
  /// database definitions, table definitions, and other control information to
  /// manage your AWS Lake Formation environment.
  ///
  /// [principal]: The principal to be revoked permissions on the resource.
  ///
  /// [resource]: The resource to which permissions are to be revoked.
  ///
  /// [permissions]: The permissions revoked to the principal on the resource.
  /// For information about permissions, see [Security and Access Control to
  /// Metadata and
  /// Data](https://docs-aws.amazon.com/michigan/latest/dg/security-data-access.html).
  ///
  /// [permissionsWithGrantOption]: Indicates a list of permissions for which to
  /// revoke the grant option allowing the principal to pass permissions to
  /// other principals.
  Future<RevokePermissionsResponse> revokePermissions(
      {String catalogId,
      @required DataLakePrincipal principal,
      @required Resource resource,
      @required List<String> permissions,
      List<String> permissionsWithGrantOption}) async {
    return RevokePermissionsResponse.fromJson({});
  }

  /// Updates the data access role used for vending access to the given
  /// (registered) resource in AWS Lake Formation.
  ///
  /// [roleArn]: The new role to use for the given resource registered in AWS
  /// Lake Formation.
  ///
  /// [resourceArn]: The resource ARN.
  Future<UpdateResourceResponse> updateResource(
      {@required String roleArn, @required String resourceArn}) async {
    return UpdateResourceResponse.fromJson({});
  }
}

class BatchGrantPermissionsResponse {
  /// A list of failures to grant permissions to the resources.
  final List<BatchPermissionsFailureEntry> failures;

  BatchGrantPermissionsResponse({
    this.failures,
  });
  static BatchGrantPermissionsResponse fromJson(Map<String, dynamic> json) =>
      BatchGrantPermissionsResponse();
}

class BatchPermissionsFailureEntry {
  /// An identifier for an entry of the batch request.
  final BatchPermissionsRequestEntry requestEntry;

  /// An error message that applies to the failure of the entry.
  final ErrorDetail error;

  BatchPermissionsFailureEntry({
    this.requestEntry,
    this.error,
  });
  static BatchPermissionsFailureEntry fromJson(Map<String, dynamic> json) =>
      BatchPermissionsFailureEntry();
}

class BatchPermissionsRequestEntry {
  /// A unique identifier for the batch permissions request entry.
  final String id;

  /// The principal to be granted a permission.
  final DataLakePrincipal principal;

  /// The resource to which the principal is to be granted a permission.
  final Resource resource;

  /// The permissions to be granted.
  final List<String> permissions;

  /// Indicates if the option to pass permissions is granted.
  final List<String> permissionsWithGrantOption;

  BatchPermissionsRequestEntry({
    @required this.id,
    this.principal,
    this.resource,
    this.permissions,
    this.permissionsWithGrantOption,
  });
  static BatchPermissionsRequestEntry fromJson(Map<String, dynamic> json) =>
      BatchPermissionsRequestEntry();
}

class BatchRevokePermissionsResponse {
  /// A list of failures to revoke permissions to the resources.
  final List<BatchPermissionsFailureEntry> failures;

  BatchRevokePermissionsResponse({
    this.failures,
  });
  static BatchRevokePermissionsResponse fromJson(Map<String, dynamic> json) =>
      BatchRevokePermissionsResponse();
}

class CatalogResource {
  CatalogResource();
  static CatalogResource fromJson(Map<String, dynamic> json) =>
      CatalogResource();
}

class ColumnWildcard {
  /// Excludes column names. Any column with this name will be excluded.
  final List<String> excludedColumnNames;

  ColumnWildcard({
    this.excludedColumnNames,
  });
  static ColumnWildcard fromJson(Map<String, dynamic> json) => ColumnWildcard();
}

class DataLakePrincipal {
  /// An identifier for the AWS Lake Formation principal.
  final String dataLakePrincipalIdentifier;

  DataLakePrincipal({
    this.dataLakePrincipalIdentifier,
  });
  static DataLakePrincipal fromJson(Map<String, dynamic> json) =>
      DataLakePrincipal();
}

class DataLakeSettings {
  /// A list of AWS Lake Formation principals.
  final List<DataLakePrincipal> dataLakeAdmins;

  /// A list of up to three principal permissions entries for default create
  /// database permissions.
  final List<PrincipalPermissions> createDatabaseDefaultPermissions;

  /// A list of up to three principal permissions entries for default create
  /// table permissions.
  final List<PrincipalPermissions> createTableDefaultPermissions;

  DataLakeSettings({
    this.dataLakeAdmins,
    this.createDatabaseDefaultPermissions,
    this.createTableDefaultPermissions,
  });
  static DataLakeSettings fromJson(Map<String, dynamic> json) =>
      DataLakeSettings();
}

class DataLocationResource {
  /// The Amazon Resource Name (ARN) that uniquely identifies the data location
  /// resource.
  final String resourceArn;

  DataLocationResource({
    @required this.resourceArn,
  });
  static DataLocationResource fromJson(Map<String, dynamic> json) =>
      DataLocationResource();
}

class DatabaseResource {
  /// The name of the database resource. Unique to the Data Catalog.
  final String name;

  DatabaseResource({
    @required this.name,
  });
  static DatabaseResource fromJson(Map<String, dynamic> json) =>
      DatabaseResource();
}

class DeregisterResourceResponse {
  DeregisterResourceResponse();
  static DeregisterResourceResponse fromJson(Map<String, dynamic> json) =>
      DeregisterResourceResponse();
}

class DescribeResourceResponse {
  /// A structure containing information about an AWS Lake Formation resource.
  final ResourceInfo resourceInfo;

  DescribeResourceResponse({
    this.resourceInfo,
  });
  static DescribeResourceResponse fromJson(Map<String, dynamic> json) =>
      DescribeResourceResponse();
}

class ErrorDetail {
  /// The code associated with this error.
  final String errorCode;

  /// A message describing the error.
  final String errorMessage;

  ErrorDetail({
    this.errorCode,
    this.errorMessage,
  });
  static ErrorDetail fromJson(Map<String, dynamic> json) => ErrorDetail();
}

class FilterCondition {
  /// The field to filter in the filter condition.
  final String field;

  /// The comparison operator used in the filter condition.
  final String comparisonOperator;

  /// A string with values used in evaluating the filter condition.
  final List<String> stringValueList;

  FilterCondition({
    this.field,
    this.comparisonOperator,
    this.stringValueList,
  });
}

class GetDataLakeSettingsResponse {
  /// A list of AWS Lake Formation principals.
  final DataLakeSettings dataLakeSettings;

  GetDataLakeSettingsResponse({
    this.dataLakeSettings,
  });
  static GetDataLakeSettingsResponse fromJson(Map<String, dynamic> json) =>
      GetDataLakeSettingsResponse();
}

class GetEffectivePermissionsForPathResponse {
  /// A list of the permissions for the specified table or database resource
  /// located at the path in Amazon S3.
  final List<PrincipalResourcePermissions> permissions;

  /// A continuation token, if this is not the first call to retrieve this list.
  final String nextToken;

  GetEffectivePermissionsForPathResponse({
    this.permissions,
    this.nextToken,
  });
  static GetEffectivePermissionsForPathResponse fromJson(
          Map<String, dynamic> json) =>
      GetEffectivePermissionsForPathResponse();
}

class GrantPermissionsResponse {
  GrantPermissionsResponse();
  static GrantPermissionsResponse fromJson(Map<String, dynamic> json) =>
      GrantPermissionsResponse();
}

class ListPermissionsResponse {
  /// A list of principals and their permissions on the resource for the
  /// specified principal and resource types.
  final List<PrincipalResourcePermissions> principalResourcePermissions;

  /// A continuation token, if this is not the first call to retrieve this list.
  final String nextToken;

  ListPermissionsResponse({
    this.principalResourcePermissions,
    this.nextToken,
  });
  static ListPermissionsResponse fromJson(Map<String, dynamic> json) =>
      ListPermissionsResponse();
}

class ListResourcesResponse {
  /// A summary of the data lake resources.
  final List<ResourceInfo> resourceInfoList;

  /// A continuation token, if this is not the first call to retrieve these
  /// resources.
  final String nextToken;

  ListResourcesResponse({
    this.resourceInfoList,
    this.nextToken,
  });
  static ListResourcesResponse fromJson(Map<String, dynamic> json) =>
      ListResourcesResponse();
}

class PrincipalPermissions {
  /// The principal who is granted permissions.
  final DataLakePrincipal principal;

  /// The permissions that are granted to the principal.
  final List<String> permissions;

  PrincipalPermissions({
    this.principal,
    this.permissions,
  });
  static PrincipalPermissions fromJson(Map<String, dynamic> json) =>
      PrincipalPermissions();
}

class PrincipalResourcePermissions {
  /// The Data Lake principal to be granted or revoked permissions.
  final DataLakePrincipal principal;

  /// The resource where permissions are to be granted or revoked.
  final Resource resource;

  /// The permissions to be granted or revoked on the resource.
  final List<String> permissions;

  /// Indicates whether to grant the ability to grant permissions (as a subset
  /// of permissions granted).
  final List<String> permissionsWithGrantOption;

  PrincipalResourcePermissions({
    this.principal,
    this.resource,
    this.permissions,
    this.permissionsWithGrantOption,
  });
  static PrincipalResourcePermissions fromJson(Map<String, dynamic> json) =>
      PrincipalResourcePermissions();
}

class PutDataLakeSettingsResponse {
  PutDataLakeSettingsResponse();
  static PutDataLakeSettingsResponse fromJson(Map<String, dynamic> json) =>
      PutDataLakeSettingsResponse();
}

class RegisterResourceResponse {
  RegisterResourceResponse();
  static RegisterResourceResponse fromJson(Map<String, dynamic> json) =>
      RegisterResourceResponse();
}

class Resource {
  /// The identifier for the Data Catalog. By default, the account ID. The Data
  /// Catalog is the persistent metadata store. It contains database
  /// definitions, table definitions, and other control information to manage
  /// your AWS Lake Formation environment.
  final CatalogResource catalog;

  /// The database for the resource. Unique to the Data Catalog. A database is a
  /// set of associated table definitions organized into a logical group. You
  /// can Grant and Revoke database permissions to a principal.
  final DatabaseResource database;

  /// The table for the resource. A table is a metadata definition that
  /// represents your data. You can Grant and Revoke table privileges to a
  /// principal.
  final TableResource table;

  /// The table with columns for the resource. A principal with permissions to
  /// this resource can select metadata from the columns of a table in the Data
  /// Catalog and the underlying data in Amazon S3.
  final TableWithColumnsResource tableWithColumns;

  /// The location of an Amazon S3 path where permissions are granted or
  /// revoked.
  final DataLocationResource dataLocation;

  Resource({
    this.catalog,
    this.database,
    this.table,
    this.tableWithColumns,
    this.dataLocation,
  });
  static Resource fromJson(Map<String, dynamic> json) => Resource();
}

class ResourceInfo {
  /// The Amazon Resource Name (ARN) of the resource.
  final String resourceArn;

  /// The IAM role that registered a resource.
  final String roleArn;

  /// The date and time the resource was last modified.
  final DateTime lastModified;

  ResourceInfo({
    this.resourceArn,
    this.roleArn,
    this.lastModified,
  });
  static ResourceInfo fromJson(Map<String, dynamic> json) => ResourceInfo();
}

class RevokePermissionsResponse {
  RevokePermissionsResponse();
  static RevokePermissionsResponse fromJson(Map<String, dynamic> json) =>
      RevokePermissionsResponse();
}

class TableResource {
  /// The name of the database for the table. Unique to a Data Catalog. A
  /// database is a set of associated table definitions organized into a logical
  /// group. You can Grant and Revoke database privileges to a principal.
  final String databaseName;

  /// The name of the table.
  final String name;

  TableResource({
    @required this.databaseName,
    @required this.name,
  });
  static TableResource fromJson(Map<String, dynamic> json) => TableResource();
}

class TableWithColumnsResource {
  /// The name of the database for the table with columns resource. Unique to
  /// the Data Catalog. A database is a set of associated table definitions
  /// organized into a logical group. You can Grant and Revoke database
  /// privileges to a principal.
  final String databaseName;

  /// The name of the table resource. A table is a metadata definition that
  /// represents your data. You can Grant and Revoke table privileges to a
  /// principal.
  final String name;

  /// The list of column names for the table. At least one of `ColumnNames` or
  /// `ColumnWildcard` is required.
  final List<String> columnNames;

  /// A wildcard specified by a `ColumnWildcard` object. At least one of
  /// `ColumnNames` or `ColumnWildcard` is required.
  final ColumnWildcard columnWildcard;

  TableWithColumnsResource({
    this.databaseName,
    this.name,
    this.columnNames,
    this.columnWildcard,
  });
  static TableWithColumnsResource fromJson(Map<String, dynamic> json) =>
      TableWithColumnsResource();
}

class UpdateResourceResponse {
  UpdateResourceResponse();
  static UpdateResourceResponse fromJson(Map<String, dynamic> json) =>
      UpdateResourceResponse();
}
