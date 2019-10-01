import 'package:meta/meta.dart';

/// AWS Lake Formation
///
/// Defines the public endpoint for the AWS Lake Formation service.
class LakeFormationApi {
  final _client;
  LakeFormationApi(client)
      : _client = client.configured('LakeFormation', serializer: 'json');

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
    var response_ = await _client.send('BatchGrantPermissions', {
      if (catalogId != null) 'CatalogId': catalogId,
      'Entries': entries,
    });
    return BatchGrantPermissionsResponse.fromJson(response_);
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
    var response_ = await _client.send('BatchRevokePermissions', {
      if (catalogId != null) 'CatalogId': catalogId,
      'Entries': entries,
    });
    return BatchRevokePermissionsResponse.fromJson(response_);
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
    var response_ = await _client.send('DeregisterResource', {
      'ResourceArn': resourceArn,
    });
    return DeregisterResourceResponse.fromJson(response_);
  }

  /// Retrieves the current data access role for the given resource registered
  /// in AWS Lake Formation.
  ///
  /// [resourceArn]: The resource ARN.
  Future<DescribeResourceResponse> describeResource(String resourceArn) async {
    var response_ = await _client.send('DescribeResource', {
      'ResourceArn': resourceArn,
    });
    return DescribeResourceResponse.fromJson(response_);
  }

  /// The AWS Lake Formation principal.
  ///
  /// [catalogId]: The identifier for the Data Catalog. By default, the account
  /// ID. The Data Catalog is the persistent metadata store. It contains
  /// database definitions, table definitions, and other control information to
  /// manage your AWS Lake Formation environment.
  Future<GetDataLakeSettingsResponse> getDataLakeSettings(
      {String catalogId}) async {
    var response_ = await _client.send('GetDataLakeSettings', {
      if (catalogId != null) 'CatalogId': catalogId,
    });
    return GetDataLakeSettingsResponse.fromJson(response_);
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
    var response_ = await _client.send('GetEffectivePermissionsForPath', {
      if (catalogId != null) 'CatalogId': catalogId,
      'ResourceArn': resourceArn,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return GetEffectivePermissionsForPathResponse.fromJson(response_);
  }

  /// Grants permissions to the principal to access metadata in the Data Catalog
  /// and data organized in underlying data storage such as Amazon S3.
  ///
  /// For information about permissions, see
  /// [Security and Access Control to Metadata and Data](https://docs-aws.amazon.com/michigan/latest/dg/security-data-access.html).
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
    var response_ = await _client.send('GrantPermissions', {
      if (catalogId != null) 'CatalogId': catalogId,
      'Principal': principal,
      'Resource': resource,
      'Permissions': permissions,
      if (permissionsWithGrantOption != null)
        'PermissionsWithGrantOption': permissionsWithGrantOption,
    });
    return GrantPermissionsResponse.fromJson(response_);
  }

  /// Returns a list of the principal permissions on the resource, filtered by
  /// the permissions of the caller. For example, if you are granted an ALTER
  /// permission, you are able to see only the principal permissions for ALTER.
  ///
  /// This operation returns only those permissions that have been explicitly
  /// granted.
  ///
  /// For information about permissions, see
  /// [Security and Access Control to Metadata and Data](https://docs-aws.amazon.com/michigan/latest/dg/security-data-access.html).
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
    var response_ = await _client.send('ListPermissions', {
      if (catalogId != null) 'CatalogId': catalogId,
      if (principal != null) 'Principal': principal,
      if (resourceType != null) 'ResourceType': resourceType,
      if (resource != null) 'Resource': resource,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return ListPermissionsResponse.fromJson(response_);
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
    var response_ = await _client.send('ListResources', {
      if (filterConditionList != null)
        'FilterConditionList': filterConditionList,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListResourcesResponse.fromJson(response_);
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
    var response_ = await _client.send('PutDataLakeSettings', {
      if (catalogId != null) 'CatalogId': catalogId,
      'DataLakeSettings': dataLakeSettings,
    });
    return PutDataLakeSettingsResponse.fromJson(response_);
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
    var response_ = await _client.send('RegisterResource', {
      'ResourceArn': resourceArn,
      if (useServiceLinkedRole != null)
        'UseServiceLinkedRole': useServiceLinkedRole,
      if (roleArn != null) 'RoleArn': roleArn,
    });
    return RegisterResourceResponse.fromJson(response_);
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
  /// For information about permissions, see
  /// [Security and Access Control to Metadata and Data](https://docs-aws.amazon.com/michigan/latest/dg/security-data-access.html).
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
    var response_ = await _client.send('RevokePermissions', {
      if (catalogId != null) 'CatalogId': catalogId,
      'Principal': principal,
      'Resource': resource,
      'Permissions': permissions,
      if (permissionsWithGrantOption != null)
        'PermissionsWithGrantOption': permissionsWithGrantOption,
    });
    return RevokePermissionsResponse.fromJson(response_);
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
    var response_ = await _client.send('UpdateResource', {
      'RoleArn': roleArn,
      'ResourceArn': resourceArn,
    });
    return UpdateResourceResponse.fromJson(response_);
  }
}

class BatchGrantPermissionsResponse {
  /// A list of failures to grant permissions to the resources.
  final List<BatchPermissionsFailureEntry> failures;

  BatchGrantPermissionsResponse({
    this.failures,
  });
  static BatchGrantPermissionsResponse fromJson(Map<String, dynamic> json) =>
      BatchGrantPermissionsResponse(
        failures: json.containsKey('Failures')
            ? (json['Failures'] as List)
                .map((e) => BatchPermissionsFailureEntry.fromJson(e))
                .toList()
            : null,
      );
}

/// A list of failures when performing a batch grant or batch revoke operation.
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
      BatchPermissionsFailureEntry(
        requestEntry: json.containsKey('RequestEntry')
            ? BatchPermissionsRequestEntry.fromJson(json['RequestEntry'])
            : null,
        error: json.containsKey('Error')
            ? ErrorDetail.fromJson(json['Error'])
            : null,
      );
}

/// A permission to a resource granted by batch operation to the principal.
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
      BatchPermissionsRequestEntry(
        id: json['Id'] as String,
        principal: json.containsKey('Principal')
            ? DataLakePrincipal.fromJson(json['Principal'])
            : null,
        resource: json.containsKey('Resource')
            ? Resource.fromJson(json['Resource'])
            : null,
        permissions: json.containsKey('Permissions')
            ? (json['Permissions'] as List).map((e) => e as String).toList()
            : null,
        permissionsWithGrantOption:
            json.containsKey('PermissionsWithGrantOption')
                ? (json['PermissionsWithGrantOption'] as List)
                    .map((e) => e as String)
                    .toList()
                : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class BatchRevokePermissionsResponse {
  /// A list of failures to revoke permissions to the resources.
  final List<BatchPermissionsFailureEntry> failures;

  BatchRevokePermissionsResponse({
    this.failures,
  });
  static BatchRevokePermissionsResponse fromJson(Map<String, dynamic> json) =>
      BatchRevokePermissionsResponse(
        failures: json.containsKey('Failures')
            ? (json['Failures'] as List)
                .map((e) => BatchPermissionsFailureEntry.fromJson(e))
                .toList()
            : null,
      );
}

/// A structure for the catalog object.
class CatalogResource {
  CatalogResource();
  static CatalogResource fromJson(Map<String, dynamic> json) =>
      CatalogResource();
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A wildcard object, consisting of an optional list of excluded column names
/// or indexes.
class ColumnWildcard {
  /// Excludes column names. Any column with this name will be excluded.
  final List<String> excludedColumnNames;

  ColumnWildcard({
    this.excludedColumnNames,
  });
  static ColumnWildcard fromJson(Map<String, dynamic> json) => ColumnWildcard(
        excludedColumnNames: json.containsKey('ExcludedColumnNames')
            ? (json['ExcludedColumnNames'] as List)
                .map((e) => e as String)
                .toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The AWS Lake Formation principal.
class DataLakePrincipal {
  /// An identifier for the AWS Lake Formation principal.
  final String dataLakePrincipalIdentifier;

  DataLakePrincipal({
    this.dataLakePrincipalIdentifier,
  });
  static DataLakePrincipal fromJson(Map<String, dynamic> json) =>
      DataLakePrincipal(
        dataLakePrincipalIdentifier:
            json.containsKey('DataLakePrincipalIdentifier')
                ? json['DataLakePrincipalIdentifier'] as String
                : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The AWS Lake Formation principal.
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
      DataLakeSettings(
        dataLakeAdmins: json.containsKey('DataLakeAdmins')
            ? (json['DataLakeAdmins'] as List)
                .map((e) => DataLakePrincipal.fromJson(e))
                .toList()
            : null,
        createDatabaseDefaultPermissions:
            json.containsKey('CreateDatabaseDefaultPermissions')
                ? (json['CreateDatabaseDefaultPermissions'] as List)
                    .map((e) => PrincipalPermissions.fromJson(e))
                    .toList()
                : null,
        createTableDefaultPermissions:
            json.containsKey('CreateTableDefaultPermissions')
                ? (json['CreateTableDefaultPermissions'] as List)
                    .map((e) => PrincipalPermissions.fromJson(e))
                    .toList()
                : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A structure for a data location object where permissions are granted or
/// revoked.
class DataLocationResource {
  /// The Amazon Resource Name (ARN) that uniquely identifies the data location
  /// resource.
  final String resourceArn;

  DataLocationResource({
    @required this.resourceArn,
  });
  static DataLocationResource fromJson(Map<String, dynamic> json) =>
      DataLocationResource(
        resourceArn: json['ResourceArn'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A structure for the database object.
class DatabaseResource {
  /// The name of the database resource. Unique to the Data Catalog.
  final String name;

  DatabaseResource({
    @required this.name,
  });
  static DatabaseResource fromJson(Map<String, dynamic> json) =>
      DatabaseResource(
        name: json['Name'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
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
      DescribeResourceResponse(
        resourceInfo: json.containsKey('ResourceInfo')
            ? ResourceInfo.fromJson(json['ResourceInfo'])
            : null,
      );
}

/// Contains details about an error.
class ErrorDetail {
  /// The code associated with this error.
  final String errorCode;

  /// A message describing the error.
  final String errorMessage;

  ErrorDetail({
    this.errorCode,
    this.errorMessage,
  });
  static ErrorDetail fromJson(Map<String, dynamic> json) => ErrorDetail(
        errorCode:
            json.containsKey('ErrorCode') ? json['ErrorCode'] as String : null,
        errorMessage: json.containsKey('ErrorMessage')
            ? json['ErrorMessage'] as String
            : null,
      );
}

/// This structure describes the filtering of columns in a table based on a
/// filter condition.
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
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class GetDataLakeSettingsResponse {
  /// A list of AWS Lake Formation principals.
  final DataLakeSettings dataLakeSettings;

  GetDataLakeSettingsResponse({
    this.dataLakeSettings,
  });
  static GetDataLakeSettingsResponse fromJson(Map<String, dynamic> json) =>
      GetDataLakeSettingsResponse(
        dataLakeSettings: json.containsKey('DataLakeSettings')
            ? DataLakeSettings.fromJson(json['DataLakeSettings'])
            : null,
      );
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
      GetEffectivePermissionsForPathResponse(
        permissions: json.containsKey('Permissions')
            ? (json['Permissions'] as List)
                .map((e) => PrincipalResourcePermissions.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
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
      ListPermissionsResponse(
        principalResourcePermissions:
            json.containsKey('PrincipalResourcePermissions')
                ? (json['PrincipalResourcePermissions'] as List)
                    .map((e) => PrincipalResourcePermissions.fromJson(e))
                    .toList()
                : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
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
      ListResourcesResponse(
        resourceInfoList: json.containsKey('ResourceInfoList')
            ? (json['ResourceInfoList'] as List)
                .map((e) => ResourceInfo.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// Permissions granted to a principal.
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
      PrincipalPermissions(
        principal: json.containsKey('Principal')
            ? DataLakePrincipal.fromJson(json['Principal'])
            : null,
        permissions: json.containsKey('Permissions')
            ? (json['Permissions'] as List).map((e) => e as String).toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The permissions granted or revoked on a resource.
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
      PrincipalResourcePermissions(
        principal: json.containsKey('Principal')
            ? DataLakePrincipal.fromJson(json['Principal'])
            : null,
        resource: json.containsKey('Resource')
            ? Resource.fromJson(json['Resource'])
            : null,
        permissions: json.containsKey('Permissions')
            ? (json['Permissions'] as List).map((e) => e as String).toList()
            : null,
        permissionsWithGrantOption:
            json.containsKey('PermissionsWithGrantOption')
                ? (json['PermissionsWithGrantOption'] as List)
                    .map((e) => e as String)
                    .toList()
                : null,
      );
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

/// A structure for the resource.
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
  static Resource fromJson(Map<String, dynamic> json) => Resource(
        catalog: json.containsKey('Catalog')
            ? CatalogResource.fromJson(json['Catalog'])
            : null,
        database: json.containsKey('Database')
            ? DatabaseResource.fromJson(json['Database'])
            : null,
        table: json.containsKey('Table')
            ? TableResource.fromJson(json['Table'])
            : null,
        tableWithColumns: json.containsKey('TableWithColumns')
            ? TableWithColumnsResource.fromJson(json['TableWithColumns'])
            : null,
        dataLocation: json.containsKey('DataLocation')
            ? DataLocationResource.fromJson(json['DataLocation'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A structure containing information about an AWS Lake Formation resource.
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
  static ResourceInfo fromJson(Map<String, dynamic> json) => ResourceInfo(
        resourceArn: json.containsKey('ResourceArn')
            ? json['ResourceArn'] as String
            : null,
        roleArn: json.containsKey('RoleArn') ? json['RoleArn'] as String : null,
        lastModified: json.containsKey('LastModified')
            ? DateTime.parse(json['LastModified'])
            : null,
      );
}

class RevokePermissionsResponse {
  RevokePermissionsResponse();
  static RevokePermissionsResponse fromJson(Map<String, dynamic> json) =>
      RevokePermissionsResponse();
}

/// A structure for the table object. A table is a metadata definition that
/// represents your data. You can Grant and Revoke table privileges to a
/// principal.
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
  static TableResource fromJson(Map<String, dynamic> json) => TableResource(
        databaseName: json['DatabaseName'] as String,
        name: json['Name'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A structure for a table with columns object. This object is only used when
/// granting a SELECT permission.
///
/// This object must take a value for at least one of `ColumnsNames`,
/// `ColumnsIndexes`, or `ColumnsWildcard`.
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
      TableWithColumnsResource(
        databaseName: json.containsKey('DatabaseName')
            ? json['DatabaseName'] as String
            : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        columnNames: json.containsKey('ColumnNames')
            ? (json['ColumnNames'] as List).map((e) => e as String).toList()
            : null,
        columnWildcard: json.containsKey('ColumnWildcard')
            ? ColumnWildcard.fromJson(json['ColumnWildcard'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class UpdateResourceResponse {
  UpdateResourceResponse();
  static UpdateResourceResponse fromJson(Map<String, dynamic> json) =>
      UpdateResourceResponse();
}
