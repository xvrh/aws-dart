import 'package:meta/meta.dart';

/// Amazon FSx is a fully managed service that makes it easy for storage and
/// application administrators to launch and use shared file storage.
class FSxApi {
  final _client;
  FSxApi(client) : _client = client.configured('FSx', serializer: 'json');

  /// Creates a backup of an existing Amazon FSx for Windows File Server file
  /// system. Creating regular backups for your file system is a best practice
  /// that complements the replication that Amazon FSx for Windows File Server
  /// performs for your file system. It also enables you to restore from user
  /// modification of data.
  ///
  /// If a backup with the specified client request token exists, and the
  /// parameters match, this operation returns the description of the existing
  /// backup. If a backup specified client request token exists, and the
  /// parameters don't match, this operation returns
  /// `IncompatibleParameterError`. If a backup with the specified client
  /// request token doesn't exist, `CreateBackup` does the following:
  ///
  /// *   Creates a new Amazon FSx backup with an assigned ID, and an initial
  /// lifecycle state of `CREATING`.
  ///
  /// *   Returns the description of the backup.
  ///
  ///
  /// By using the idempotent operation, you can retry a `CreateBackup`
  /// operation without the risk of creating an extra backup. This approach can
  /// be useful when an initial call fails in a way that makes it unclear
  /// whether a backup was created. If you use the same client request token and
  /// the initial call created a backup, the operation returns a successful
  /// result because all the parameters are the same.
  ///
  /// The `CreateFileSystem` operation returns while the backup's lifecycle
  /// state is still `CREATING`. You can check the file system creation status
  /// by calling the DescribeBackups operation, which returns the backup state
  /// along with other information.
  ///
  /// [fileSystemId]: The ID of the file system to back up.
  ///
  /// [clientRequestToken]: (Optional) A string of up to 64 ASCII characters
  /// that Amazon FSx uses to ensure idempotent creation. This string is
  /// automatically filled on your behalf when you use the AWS Command Line
  /// Interface (AWS CLI) or an AWS SDK.
  ///
  /// [tags]: The tags to apply to the backup at backup creation. The key value
  /// of the `Name` tag appears in the console as the backup name.
  Future<CreateBackupResponse> createBackup(String fileSystemId,
      {String clientRequestToken, List<Tag> tags}) async {
    var response_ = await _client.send('CreateBackup', {
      'FileSystemId': fileSystemId,
      if (clientRequestToken != null) 'ClientRequestToken': clientRequestToken,
      if (tags != null) 'Tags': tags,
    });
    return CreateBackupResponse.fromJson(response_);
  }

  /// Creates a new, empty Amazon FSx file system.
  ///
  /// If a file system with the specified client request token exists and the
  /// parameters match, `CreateFileSystem` returns the description of the
  /// existing file system. If a file system specified client request token
  /// exists and the parameters don't match, this call returns
  /// `IncompatibleParameterError`. If a file system with the specified client
  /// request token doesn't exist, `CreateFileSystem` does the following:
  ///
  /// *   Creates a new, empty Amazon FSx file system with an assigned ID, and
  /// an initial lifecycle state of `CREATING`.
  ///
  /// *   Returns the description of the file system.
  ///
  ///
  /// This operation requires a client request token in the request that Amazon
  /// FSx uses to ensure idempotent creation. This means that calling the
  /// operation multiple times with the same client request token has no effect.
  /// By using the idempotent operation, you can retry a `CreateFileSystem`
  /// operation without the risk of creating an extra file system. This approach
  /// can be useful when an initial call fails in a way that makes it unclear
  /// whether a file system was created. Examples are if a transport level
  /// timeout occurred, or your connection was reset. If you use the same client
  /// request token and the initial call created a file system, the client
  /// receives success as long as the parameters are the same.
  ///
  ///
  ///
  /// The `CreateFileSystem` call returns while the file system's lifecycle
  /// state is still `CREATING`. You can check the file-system creation status
  /// by calling the DescribeFileSystems operation, which returns the file
  /// system state along with other information.
  ///
  /// [clientRequestToken]: (Optional) A string of up to 64 ASCII characters
  /// that Amazon FSx uses to ensure idempotent creation. This string is
  /// automatically filled on your behalf when you use the AWS Command Line
  /// Interface (AWS CLI) or an AWS SDK.
  ///
  /// [fileSystemType]: The type of Amazon FSx file system to create.
  ///
  /// [storageCapacity]: The storage capacity of the file system being created.
  ///
  /// For Windows file systems, the storage capacity has a minimum of 300 GiB,
  /// and a maximum of 65,536 GiB.
  ///
  /// For Lustre file systems, the storage capacity has a minimum of 3,600 GiB.
  /// Storage capacity is provisioned in increments of 3,600 GiB.
  ///
  /// [subnetIds]: The IDs of the subnets that the file system will be
  /// accessible from. File systems support only one subnet. The file server is
  /// also launched in that subnet's Availability Zone.
  ///
  /// [securityGroupIds]: A list of IDs specifying the security groups to apply
  /// to all network interfaces created for file system access. This list isn't
  /// returned in later requests to describe the file system.
  ///
  /// [tags]: The tags to apply to the file system being created. The key value
  /// of the `Name` tag appears in the console as the file system name.
  ///
  /// [windowsConfiguration]: The Microsoft Windows configuration for the file
  /// system being created. This value is required if `FileSystemType` is set to
  /// `WINDOWS`.
  Future<CreateFileSystemResponse> createFileSystem(
      {String clientRequestToken,
      @required String fileSystemType,
      @required int storageCapacity,
      @required List<String> subnetIds,
      List<String> securityGroupIds,
      List<Tag> tags,
      String kmsKeyId,
      CreateFileSystemWindowsConfiguration windowsConfiguration,
      CreateFileSystemLustreConfiguration lustreConfiguration}) async {
    var response_ = await _client.send('CreateFileSystem', {
      if (clientRequestToken != null) 'ClientRequestToken': clientRequestToken,
      'FileSystemType': fileSystemType,
      'StorageCapacity': storageCapacity,
      'SubnetIds': subnetIds,
      if (securityGroupIds != null) 'SecurityGroupIds': securityGroupIds,
      if (tags != null) 'Tags': tags,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (windowsConfiguration != null)
        'WindowsConfiguration': windowsConfiguration,
      if (lustreConfiguration != null)
        'LustreConfiguration': lustreConfiguration,
    });
    return CreateFileSystemResponse.fromJson(response_);
  }

  /// Creates a new Amazon FSx file system from an existing Amazon FSx for
  /// Windows File Server backup.
  ///
  /// If a file system with the specified client request token exists and the
  /// parameters match, this operation returns the description of the file
  /// system. If a client request token specified by the file system exists and
  /// the parameters don't match, this call returns
  /// `IncompatibleParameterError`. If a file system with the specified client
  /// request token doesn't exist, this operation does the following:
  ///
  /// *   Creates a new Amazon FSx file system from backup with an assigned ID,
  /// and an initial lifecycle state of `CREATING`.
  ///
  /// *   Returns the description of the file system.
  ///
  ///
  /// Parameters like Active Directory, default share name, automatic backup,
  /// and backup settings default to the parameters of the file system that was
  /// backed up, unless overridden. You can explicitly supply other settings.
  ///
  /// By using the idempotent operation, you can retry a
  /// `CreateFileSystemFromBackup` call without the risk of creating an extra
  /// file system. This approach can be useful when an initial call fails in a
  /// way that makes it unclear whether a file system was created. Examples are
  /// if a transport level timeout occurred, or your connection was reset. If
  /// you use the same client request token and the initial call created a file
  /// system, the client receives success as long as the parameters are the
  /// same.
  ///
  ///
  ///
  /// The `CreateFileSystemFromBackup` call returns while the file system's
  /// lifecycle state is still `CREATING`. You can check the file-system
  /// creation status by calling the DescribeFileSystems operation, which
  /// returns the file system state along with other information.
  ///
  /// [clientRequestToken]: (Optional) A string of up to 64 ASCII characters
  /// that Amazon FSx uses to ensure idempotent creation. This string is
  /// automatically filled on your behalf when you use the AWS Command Line
  /// Interface (AWS CLI) or an AWS SDK.
  ///
  /// [subnetIds]: A list of IDs for the subnets that the file system will be
  /// accessible from. Currently, you can specify only one subnet. The file
  /// server is also launched in that subnet's Availability Zone.
  ///
  /// [securityGroupIds]: A list of IDs for the security groups that apply to
  /// the specified network interfaces created for file system access. These
  /// security groups apply to all network interfaces. This value isn't returned
  /// in later describe requests.
  ///
  /// [tags]: The tags to be applied to the file system at file system creation.
  /// The key value of the `Name` tag appears in the console as the file system
  /// name.
  ///
  /// [windowsConfiguration]: The configuration for this Microsoft Windows file
  /// system.
  Future<CreateFileSystemFromBackupResponse> createFileSystemFromBackup(
      {@required String backupId,
      String clientRequestToken,
      @required List<String> subnetIds,
      List<String> securityGroupIds,
      List<Tag> tags,
      CreateFileSystemWindowsConfiguration windowsConfiguration}) async {
    var response_ = await _client.send('CreateFileSystemFromBackup', {
      'BackupId': backupId,
      if (clientRequestToken != null) 'ClientRequestToken': clientRequestToken,
      'SubnetIds': subnetIds,
      if (securityGroupIds != null) 'SecurityGroupIds': securityGroupIds,
      if (tags != null) 'Tags': tags,
      if (windowsConfiguration != null)
        'WindowsConfiguration': windowsConfiguration,
    });
    return CreateFileSystemFromBackupResponse.fromJson(response_);
  }

  /// Deletes an Amazon FSx for Windows File Server backup, deleting its
  /// contents. After deletion, the backup no longer exists, and its data is
  /// gone.
  ///
  /// The `DeleteBackup` call returns instantly. The backup will not show up in
  /// later `DescribeBackups` calls.
  ///
  ///
  ///
  /// The data in a deleted backup is also deleted and can't be recovered by any
  /// means.
  ///
  /// [backupId]: The ID of the backup you want to delete.
  ///
  /// [clientRequestToken]: (Optional) A string of up to 64 ASCII characters
  /// that Amazon FSx uses to ensure idempotent deletion. This is automatically
  /// filled on your behalf when using the AWS CLI or SDK.
  Future<DeleteBackupResponse> deleteBackup(String backupId,
      {String clientRequestToken}) async {
    var response_ = await _client.send('DeleteBackup', {
      'BackupId': backupId,
      if (clientRequestToken != null) 'ClientRequestToken': clientRequestToken,
    });
    return DeleteBackupResponse.fromJson(response_);
  }

  /// Deletes a file system, deleting its contents. After deletion, the file
  /// system no longer exists, and its data is gone. Any existing automatic
  /// backups will also be deleted.
  ///
  /// By default, when you delete an Amazon FSx for Windows File Server file
  /// system, a final backup is created upon deletion. This final backup is not
  /// subject to the file system's retention policy, and must be manually
  /// deleted.
  ///
  /// The `DeleteFileSystem` action returns while the file system has the
  /// `DELETING` status. You can check the file system deletion status by
  /// calling the DescribeFileSystems action, which returns a list of file
  /// systems in your account. If you pass the file system ID for a deleted file
  /// system, the DescribeFileSystems returns a `FileSystemNotFound` error.
  ///
  ///
  ///
  /// The data in a deleted file system is also deleted and can't be recovered
  /// by any means.
  ///
  /// [fileSystemId]: The ID of the file system you want to delete.
  ///
  /// [clientRequestToken]: (Optional) A string of up to 64 ASCII characters
  /// that Amazon FSx uses to ensure idempotent deletion. This is automatically
  /// filled on your behalf when using the AWS CLI or SDK.
  Future<DeleteFileSystemResponse> deleteFileSystem(String fileSystemId,
      {String clientRequestToken,
      DeleteFileSystemWindowsConfiguration windowsConfiguration}) async {
    var response_ = await _client.send('DeleteFileSystem', {
      'FileSystemId': fileSystemId,
      if (clientRequestToken != null) 'ClientRequestToken': clientRequestToken,
      if (windowsConfiguration != null)
        'WindowsConfiguration': windowsConfiguration,
    });
    return DeleteFileSystemResponse.fromJson(response_);
  }

  /// Returns the description of specific Amazon FSx for Windows File Server
  /// backups, if a `BackupIds` value is provided for that backup. Otherwise, it
  /// returns all backups owned by your AWS account in the AWS Region of the
  /// endpoint that you're calling.
  ///
  /// When retrieving all backups, you can optionally specify the `MaxResults`
  /// parameter to limit the number of backups in a response. If more backups
  /// remain, Amazon FSx returns a `NextToken` value in the response. In this
  /// case, send a later request with the `NextToken` request parameter set to
  /// the value of `NextToken` from the last response.
  ///
  /// This action is used in an iterative process to retrieve a list of your
  /// backups. `DescribeBackups` is called first without a `NextToken`value.
  /// Then the action continues to be called with the `NextToken` parameter set
  /// to the value of the last `NextToken` value until a response has no
  /// `NextToken`.
  ///
  /// When using this action, keep the following in mind:
  ///
  /// *   The implementation might return fewer than `MaxResults` file system
  /// descriptions while still including a `NextToken` value.
  ///
  /// *   The order of backups returned in the response of one `DescribeBackups`
  /// call and the order of backups returned across the responses of a
  /// multi-call iteration is unspecified.
  ///
  /// [backupIds]: (Optional) IDs of the backups you want to retrieve (String).
  /// This overrides any filters. If any IDs are not found, BackupNotFound will
  /// be thrown.
  ///
  /// [filters]: (Optional) Filters structure. Supported names are
  /// file-system-id and backup-type.
  ///
  /// [maxResults]: (Optional) Maximum number of backups to return in the
  /// response (integer). This parameter value must be greater than 0. The
  /// number of items that Amazon FSx returns is the minimum of the `MaxResults`
  /// parameter specified in the request and the service's internal maximum
  /// number of items per page.
  ///
  /// [nextToken]: (Optional) Opaque pagination token returned from a previous
  /// `DescribeBackups` operation (String). If a token present, the action
  /// continues the list from where the returning call left off.
  Future<DescribeBackupsResponse> describeBackups(
      {List<String> backupIds,
      List<Filter> filters,
      int maxResults,
      String nextToken}) async {
    var response_ = await _client.send('DescribeBackups', {
      if (backupIds != null) 'BackupIds': backupIds,
      if (filters != null) 'Filters': filters,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return DescribeBackupsResponse.fromJson(response_);
  }

  /// Returns the description of specific Amazon FSx file systems, if a
  /// `FileSystemIds` value is provided for that file system. Otherwise, it
  /// returns descriptions of all file systems owned by your AWS account in the
  /// AWS Region of the endpoint that you're calling.
  ///
  /// When retrieving all file system descriptions, you can optionally specify
  /// the `MaxResults` parameter to limit the number of descriptions in a
  /// response. If more file system descriptions remain, Amazon FSx returns a
  /// `NextToken` value in the response. In this case, send a later request with
  /// the `NextToken` request parameter set to the value of `NextToken` from the
  /// last response.
  ///
  /// This action is used in an iterative process to retrieve a list of your
  /// file system descriptions. `DescribeFileSystems` is called first without a
  /// `NextToken`value. Then the action continues to be called with the
  /// `NextToken` parameter set to the value of the last `NextToken` value until
  /// a response has no `NextToken`.
  ///
  /// When using this action, keep the following in mind:
  ///
  /// *   The implementation might return fewer than `MaxResults` file system
  /// descriptions while still including a `NextToken` value.
  ///
  /// *   The order of file systems returned in the response of one
  /// `DescribeFileSystems` call and the order of file systems returned across
  /// the responses of a multicall iteration is unspecified.
  ///
  /// [fileSystemIds]: (Optional) IDs of the file systems whose descriptions you
  /// want to retrieve (String).
  ///
  /// [maxResults]: (Optional) Maximum number of file systems to return in the
  /// response (integer). This parameter value must be greater than 0. The
  /// number of items that Amazon FSx returns is the minimum of the `MaxResults`
  /// parameter specified in the request and the service's internal maximum
  /// number of items per page.
  ///
  /// [nextToken]: (Optional) Opaque pagination token returned from a previous
  /// `DescribeFileSystems` operation (String). If a token present, the action
  /// continues the list from where the returning call left off.
  Future<DescribeFileSystemsResponse> describeFileSystems(
      {List<String> fileSystemIds, int maxResults, String nextToken}) async {
    var response_ = await _client.send('DescribeFileSystems', {
      if (fileSystemIds != null) 'FileSystemIds': fileSystemIds,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return DescribeFileSystemsResponse.fromJson(response_);
  }

  /// Lists tags for an Amazon FSx file systems and backups in the case of
  /// Amazon FSx for Windows File Server.
  ///
  /// When retrieving all tags, you can optionally specify the `MaxResults`
  /// parameter to limit the number of tags in a response. If more tags remain,
  /// Amazon FSx returns a `NextToken` value in the response. In this case, send
  /// a later request with the `NextToken` request parameter set to the value of
  /// `NextToken` from the last response.
  ///
  /// This action is used in an iterative process to retrieve a list of your
  /// tags. `ListTagsForResource` is called first without a `NextToken`value.
  /// Then the action continues to be called with the `NextToken` parameter set
  /// to the value of the last `NextToken` value until a response has no
  /// `NextToken`.
  ///
  /// When using this action, keep the following in mind:
  ///
  /// *   The implementation might return fewer than `MaxResults` file system
  /// descriptions while still including a `NextToken` value.
  ///
  /// *   The order of tags returned in the response of one
  /// `ListTagsForResource` call and the order of tags returned across the
  /// responses of a multi-call iteration is unspecified.
  ///
  /// [resourceArn]: The ARN of the Amazon FSx resource that will have its tags
  /// listed.
  ///
  /// [maxResults]: (Optional) Maximum number of tags to return in the response
  /// (integer). This parameter value must be greater than 0. The number of
  /// items that Amazon FSx returns is the minimum of the `MaxResults` parameter
  /// specified in the request and the service's internal maximum number of
  /// items per page.
  ///
  /// [nextToken]: (Optional) Opaque pagination token returned from a previous
  /// `ListTagsForResource` operation (String). If a token present, the action
  /// continues the list from where the returning call left off.
  Future<ListTagsForResourceResponse> listTagsForResource(String resourceArn,
      {int maxResults, String nextToken}) async {
    var response_ = await _client.send('ListTagsForResource', {
      'ResourceARN': resourceArn,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListTagsForResourceResponse.fromJson(response_);
  }

  /// Tags an Amazon FSx resource.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the Amazon FSx resource
  /// that you want to tag.
  ///
  /// [tags]: A list of tags for the resource. If a tag with a given key already
  /// exists, the value is replaced by the one specified in this parameter.
  Future<TagResourceResponse> tagResource(
      {@required String resourceArn, @required List<Tag> tags}) async {
    var response_ = await _client.send('TagResource', {
      'ResourceARN': resourceArn,
      'Tags': tags,
    });
    return TagResourceResponse.fromJson(response_);
  }

  /// This action removes a tag from an Amazon FSx resource.
  ///
  /// [resourceArn]: The ARN of the Amazon FSx resource to untag.
  ///
  /// [tagKeys]: A list of keys of tags on the resource to untag. In case the
  /// tag key doesn't exist, the call will still succeed to be idempotent.
  Future<UntagResourceResponse> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {
    var response_ = await _client.send('UntagResource', {
      'ResourceARN': resourceArn,
      'TagKeys': tagKeys,
    });
    return UntagResourceResponse.fromJson(response_);
  }

  /// Updates a file system configuration.
  ///
  /// [clientRequestToken]: (Optional) A string of up to 64 ASCII characters
  /// that Amazon FSx uses to ensure idempotent updates. This string is
  /// automatically filled on your behalf when you use the AWS Command Line
  /// Interface (AWS CLI) or an AWS SDK.
  ///
  /// [windowsConfiguration]: The configuration update for this Microsoft
  /// Windows file system. The only supported options are for backup and
  /// maintenance and for self-managed Active Directory configuration.
  Future<UpdateFileSystemResponse> updateFileSystem(String fileSystemId,
      {String clientRequestToken,
      UpdateFileSystemWindowsConfiguration windowsConfiguration,
      UpdateFileSystemLustreConfiguration lustreConfiguration}) async {
    var response_ = await _client.send('UpdateFileSystem', {
      'FileSystemId': fileSystemId,
      if (clientRequestToken != null) 'ClientRequestToken': clientRequestToken,
      if (windowsConfiguration != null)
        'WindowsConfiguration': windowsConfiguration,
      if (lustreConfiguration != null)
        'LustreConfiguration': lustreConfiguration,
    });
    return UpdateFileSystemResponse.fromJson(response_);
  }
}

/// The Microsoft AD attributes of the Amazon FSx for Windows File Server file
/// system.
class ActiveDirectoryBackupAttributes {
  /// The fully qualified domain name of the self-managed AD directory.
  final String domainName;

  /// The ID of the AWS Managed Microsoft Active Directory instance to which the
  /// file system is joined.
  final String activeDirectoryId;

  ActiveDirectoryBackupAttributes({
    this.domainName,
    this.activeDirectoryId,
  });
  static ActiveDirectoryBackupAttributes fromJson(Map<String, dynamic> json) =>
      ActiveDirectoryBackupAttributes(
        domainName: json.containsKey('DomainName')
            ? json['DomainName'] as String
            : null,
        activeDirectoryId: json.containsKey('ActiveDirectoryId')
            ? json['ActiveDirectoryId'] as String
            : null,
      );
}

/// A backup of an Amazon FSx for Windows File Server file system. You can
/// create a new file system from a backup to protect against data loss.
class Backup {
  /// The ID of the backup.
  final String backupId;

  /// The lifecycle status of the backup.
  final String lifecycle;

  /// Details explaining any failures that occur when creating a backup.
  final BackupFailureDetails failureDetails;

  /// The type of the backup.
  final String type;

  final int progressPercent;

  /// The time when a particular backup was created.
  final DateTime creationTime;

  /// The ID of the AWS Key Management Service (AWS KMS) key used to encrypt
  /// this backup's data.
  final String kmsKeyId;

  /// The Amazon Resource Name (ARN) for the backup resource.
  final String resourceArn;

  /// Tags associated with a particular file system.
  final List<Tag> tags;

  /// Metadata of the file system associated with the backup. This metadata is
  /// persisted even if the file system is deleted.
  final FileSystem fileSystem;

  /// The configuration of the self-managed Microsoft Active Directory (AD) to
  /// which the Windows File Server instance is joined.
  final ActiveDirectoryBackupAttributes directoryInformation;

  Backup({
    @required this.backupId,
    @required this.lifecycle,
    this.failureDetails,
    @required this.type,
    this.progressPercent,
    @required this.creationTime,
    this.kmsKeyId,
    this.resourceArn,
    this.tags,
    @required this.fileSystem,
    this.directoryInformation,
  });
  static Backup fromJson(Map<String, dynamic> json) => Backup(
        backupId: json['BackupId'] as String,
        lifecycle: json['Lifecycle'] as String,
        failureDetails: json.containsKey('FailureDetails')
            ? BackupFailureDetails.fromJson(json['FailureDetails'])
            : null,
        type: json['Type'] as String,
        progressPercent: json.containsKey('ProgressPercent')
            ? json['ProgressPercent'] as int
            : null,
        creationTime: DateTime.parse(json['CreationTime']),
        kmsKeyId:
            json.containsKey('KmsKeyId') ? json['KmsKeyId'] as String : null,
        resourceArn: json.containsKey('ResourceARN')
            ? json['ResourceARN'] as String
            : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as List).map((e) => Tag.fromJson(e)).toList()
            : null,
        fileSystem: FileSystem.fromJson(json['FileSystem']),
        directoryInformation: json.containsKey('DirectoryInformation')
            ? ActiveDirectoryBackupAttributes.fromJson(
                json['DirectoryInformation'])
            : null,
      );
}

/// If backup creation fails, this structure contains the details of that
/// failure.
class BackupFailureDetails {
  /// A message describing the backup creation failure.
  final String message;

  BackupFailureDetails({
    this.message,
  });
  static BackupFailureDetails fromJson(Map<String, dynamic> json) =>
      BackupFailureDetails(
        message: json.containsKey('Message') ? json['Message'] as String : null,
      );
}

/// The response object for the `CreateBackup` operation.
class CreateBackupResponse {
  /// A description of the backup.
  final Backup backup;

  CreateBackupResponse({
    this.backup,
  });
  static CreateBackupResponse fromJson(Map<String, dynamic> json) =>
      CreateBackupResponse(
        backup:
            json.containsKey('Backup') ? Backup.fromJson(json['Backup']) : null,
      );
}

/// The response object for the `CreateFileSystemFromBackup` operation.
class CreateFileSystemFromBackupResponse {
  /// A description of the file system.
  final FileSystem fileSystem;

  CreateFileSystemFromBackupResponse({
    this.fileSystem,
  });
  static CreateFileSystemFromBackupResponse fromJson(
          Map<String, dynamic> json) =>
      CreateFileSystemFromBackupResponse(
        fileSystem: json.containsKey('FileSystem')
            ? FileSystem.fromJson(json['FileSystem'])
            : null,
      );
}

/// The Lustre configuration for the file system being created. This value is
/// required if `FileSystemType` is set to `LUSTRE`.
class CreateFileSystemLustreConfiguration {
  /// The preferred time to perform weekly maintenance, in the UTC time zone.
  final String weeklyMaintenanceStartTime;

  /// (Optional) The path to the Amazon S3 bucket (including the optional
  /// prefix) that you're using as the data repository for your Amazon FSx for
  /// Lustre file system. The root of your FSx for Lustre file system will be
  /// mapped to the root of the Amazon S3 bucket you select. An example is
  /// `s3://import-bucket/optional-prefix`. If you specify a prefix after the
  /// Amazon S3 bucket name, only object keys with that prefix are loaded into
  /// the file system.
  final String importPath;

  /// (Optional) The path in Amazon S3 where the root of your Amazon FSx file
  /// system is exported. The path must use the same Amazon S3 bucket as
  /// specified in ImportPath. You can provide an optional prefix to which new
  /// and changed data is to be exported from your Amazon FSx for Lustre file
  /// system. If an `ExportPath` value is not provided, Amazon FSx sets a
  /// default export path, `s3://import-bucket/FSxLustre[creation-timestamp]`.
  /// The timestamp is in UTC format, for example
  /// `s3://import-bucket/FSxLustre20181105T222312Z`.
  ///
  /// The Amazon S3 export bucket must be the same as the import bucket
  /// specified by `ImportPath`. If you only specify a bucket name, such as
  /// `s3://import-bucket`, you get a 1:1 mapping of file system objects to S3
  /// bucket objects. This mapping means that the input data in S3 is
  /// overwritten on export. If you provide a custom prefix in the export path,
  /// such as `s3://import-bucket/[custom-optional-prefix]`, Amazon FSx exports
  /// the contents of your file system to that export prefix in the Amazon S3
  /// bucket.
  final String exportPath;

  /// (Optional) For files imported from a data repository, this value
  /// determines the stripe count and maximum amount of data per file (in MiB)
  /// stored on a single physical disk. The maximum number of disks that a
  /// single file can be striped across is limited by the total number of disks
  /// that make up the file system.
  ///
  /// The chunk size default is 1,024 MiB (1 GiB) and can go as high as 512,000
  /// MiB (500 GiB). Amazon S3 objects have a maximum size of 5 TB.
  final int importedFileChunkSize;

  CreateFileSystemLustreConfiguration({
    this.weeklyMaintenanceStartTime,
    this.importPath,
    this.exportPath,
    this.importedFileChunkSize,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The response object returned after the file system is created.
class CreateFileSystemResponse {
  /// The configuration of the file system that was created.
  final FileSystem fileSystem;

  CreateFileSystemResponse({
    this.fileSystem,
  });
  static CreateFileSystemResponse fromJson(Map<String, dynamic> json) =>
      CreateFileSystemResponse(
        fileSystem: json.containsKey('FileSystem')
            ? FileSystem.fromJson(json['FileSystem'])
            : null,
      );
}

/// The configuration object for the Microsoft Windows file system used in
/// `CreateFileSystem` and `CreateFileSystemFromBackup` operations.
class CreateFileSystemWindowsConfiguration {
  /// The ID for an existing AWS Managed Microsoft Active Directory (AD)
  /// instance that the file system should join when it's created.
  final String activeDirectoryId;

  final SelfManagedActiveDirectoryConfiguration
      selfManagedActiveDirectoryConfiguration;

  /// The throughput of an Amazon FSx file system, measured in megabytes per
  /// second, in 2 to the _n_th increments, between 2^3 (8) and 2^11 (2048).
  final int throughputCapacity;

  /// The preferred start time to perform weekly maintenance, formatted d:HH:MM
  /// in the UTC time zone.
  final String weeklyMaintenanceStartTime;

  /// The preferred time to take daily automatic backups, formatted HH:MM in the
  /// UTC time zone.
  final String dailyAutomaticBackupStartTime;

  /// The number of days to retain automatic backups. The default is to retain
  /// backups for 7 days. Setting this value to 0 disables the creation of
  /// automatic backups. The maximum retention period for backups is 35 days.
  final int automaticBackupRetentionDays;

  /// A boolean flag indicating whether tags for the file system should be
  /// copied to backups. This value defaults to false. If it's set to true, all
  /// tags for the file system are copied to all automatic and user-initiated
  /// backups where the user doesn't specify tags. If this value is true, and
  /// you specify one or more tags, only the specified tags are copied to
  /// backups.
  final bool copyTagsToBackups;

  CreateFileSystemWindowsConfiguration({
    this.activeDirectoryId,
    this.selfManagedActiveDirectoryConfiguration,
    @required this.throughputCapacity,
    this.weeklyMaintenanceStartTime,
    this.dailyAutomaticBackupStartTime,
    this.automaticBackupRetentionDays,
    this.copyTagsToBackups,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The data repository configuration object for Lustre file systems returned in
/// the response of the `CreateFileSystem` operation.
class DataRepositoryConfiguration {
  /// The import path to the Amazon S3 bucket (and optional prefix) that you're
  /// using as the data repository for your FSx for Lustre file system, for
  /// example `s3://import-bucket/optional-prefix`. If a prefix is specified
  /// after the Amazon S3 bucket name, only object keys with that prefix are
  /// loaded into the file system.
  final String importPath;

  /// The export path to the Amazon S3 bucket (and prefix) that you are using to
  /// store new and changed Lustre file system files in S3.
  final String exportPath;

  /// For files imported from a data repository, this value determines the
  /// stripe count and maximum amount of data per file (in MiB) stored on a
  /// single physical disk. The maximum number of disks that a single file can
  /// be striped across is limited by the total number of disks that make up the
  /// file system.
  ///
  /// The default chunk size is 1,024 MiB (1 GiB) and can go as high as 512,000
  /// MiB (500 GiB). Amazon S3 objects have a maximum size of 5 TB.
  final int importedFileChunkSize;

  DataRepositoryConfiguration({
    this.importPath,
    this.exportPath,
    this.importedFileChunkSize,
  });
  static DataRepositoryConfiguration fromJson(Map<String, dynamic> json) =>
      DataRepositoryConfiguration(
        importPath: json.containsKey('ImportPath')
            ? json['ImportPath'] as String
            : null,
        exportPath: json.containsKey('ExportPath')
            ? json['ExportPath'] as String
            : null,
        importedFileChunkSize: json.containsKey('ImportedFileChunkSize')
            ? json['ImportedFileChunkSize'] as int
            : null,
      );
}

/// The response object for `DeleteBackup` operation.
class DeleteBackupResponse {
  /// The ID of the backup deleted.
  final String backupId;

  /// The lifecycle of the backup. Should be `DELETED`.
  final String lifecycle;

  DeleteBackupResponse({
    this.backupId,
    this.lifecycle,
  });
  static DeleteBackupResponse fromJson(Map<String, dynamic> json) =>
      DeleteBackupResponse(
        backupId:
            json.containsKey('BackupId') ? json['BackupId'] as String : null,
        lifecycle:
            json.containsKey('Lifecycle') ? json['Lifecycle'] as String : null,
      );
}

/// The response object for the `DeleteFileSystem` operation.
class DeleteFileSystemResponse {
  /// The ID of the file system being deleted.
  final String fileSystemId;

  /// The file system lifecycle for the deletion request. Should be `DELETING`.
  final String lifecycle;

  final DeleteFileSystemWindowsResponse windowsResponse;

  DeleteFileSystemResponse({
    this.fileSystemId,
    this.lifecycle,
    this.windowsResponse,
  });
  static DeleteFileSystemResponse fromJson(Map<String, dynamic> json) =>
      DeleteFileSystemResponse(
        fileSystemId: json.containsKey('FileSystemId')
            ? json['FileSystemId'] as String
            : null,
        lifecycle:
            json.containsKey('Lifecycle') ? json['Lifecycle'] as String : null,
        windowsResponse: json.containsKey('WindowsResponse')
            ? DeleteFileSystemWindowsResponse.fromJson(json['WindowsResponse'])
            : null,
      );
}

/// The configuration object for the Microsoft Windows file system used in the
/// `DeleteFileSystem` operation.
class DeleteFileSystemWindowsConfiguration {
  /// By default, Amazon FSx for Windows takes a final backup on your behalf
  /// when the `DeleteFileSystem` operation is invoked. Doing this helps protect
  /// you from data loss, and we highly recommend taking the final backup. If
  /// you want to skip this backup, use this flag to do so.
  final bool skipFinalBackup;

  /// A set of tags for your final backup.
  final List<Tag> finalBackupTags;

  DeleteFileSystemWindowsConfiguration({
    this.skipFinalBackup,
    this.finalBackupTags,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The response object for the Microsoft Windows file system used in the
/// `DeleteFileSystem` operation.
class DeleteFileSystemWindowsResponse {
  /// The ID of the final backup for this file system.
  final String finalBackupId;

  /// The set of tags applied to the final backup.
  final List<Tag> finalBackupTags;

  DeleteFileSystemWindowsResponse({
    this.finalBackupId,
    this.finalBackupTags,
  });
  static DeleteFileSystemWindowsResponse fromJson(Map<String, dynamic> json) =>
      DeleteFileSystemWindowsResponse(
        finalBackupId: json.containsKey('FinalBackupId')
            ? json['FinalBackupId'] as String
            : null,
        finalBackupTags: json.containsKey('FinalBackupTags')
            ? (json['FinalBackupTags'] as List)
                .map((e) => Tag.fromJson(e))
                .toList()
            : null,
      );
}

/// Response object for `DescribeBackups` operation.
class DescribeBackupsResponse {
  /// Any array of backups.
  final List<Backup> backups;

  /// This is present if there are more backups than returned in the response
  /// (String). You can use the `NextToken` value in the later request to fetch
  /// the backups.
  final String nextToken;

  DescribeBackupsResponse({
    this.backups,
    this.nextToken,
  });
  static DescribeBackupsResponse fromJson(Map<String, dynamic> json) =>
      DescribeBackupsResponse(
        backups: json.containsKey('Backups')
            ? (json['Backups'] as List).map((e) => Backup.fromJson(e)).toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// The response object for `DescribeFileSystems` operation.
class DescribeFileSystemsResponse {
  /// An array of file system descriptions.
  final List<FileSystem> fileSystems;

  /// Present if there are more file systems than returned in the response
  /// (String). You can use the `NextToken` value in the later request to fetch
  /// the descriptions.
  final String nextToken;

  DescribeFileSystemsResponse({
    this.fileSystems,
    this.nextToken,
  });
  static DescribeFileSystemsResponse fromJson(Map<String, dynamic> json) =>
      DescribeFileSystemsResponse(
        fileSystems: json.containsKey('FileSystems')
            ? (json['FileSystems'] as List)
                .map((e) => FileSystem.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// A description of a specific Amazon FSx file system.
class FileSystem {
  /// The AWS account that created the file system. If the file system was
  /// created by an AWS Identity and Access Management (IAM) user, the AWS
  /// account to which the IAM user belongs is the owner.
  final String ownerId;

  /// The time that the file system was created, in seconds (since
  /// 1970-01-01T00:00:00Z), also known as Unix time.
  final DateTime creationTime;

  /// The system-generated, unique 17-digit ID of the file system.
  final String fileSystemId;

  /// The type of Amazon FSx file system, either `LUSTRE` or `WINDOWS`.
  final String fileSystemType;

  /// The lifecycle status of the file system:
  ///
  /// *    `AVAILABLE` indicates that the file system is reachable and available
  /// for use.
  ///
  /// *    `CREATING` indicates that Amazon FSx is in the process of creating
  /// the new file system.
  ///
  /// *    `DELETING` indicates that Amazon FSx is in the process of deleting
  /// the file system.
  ///
  /// *    `FAILED` indicates that Amazon FSx was not able to create the file
  /// system.
  ///
  /// *    `MISCONFIGURED` indicates that the file system is in a failed but
  /// recoverable state.
  ///
  /// *    `UPDATING` indicates that the file system is undergoing a customer
  /// initiated update.
  final String lifecycle;

  final FileSystemFailureDetails failureDetails;

  /// The storage capacity of the file system in gigabytes (GB).
  final int storageCapacity;

  /// The ID of the primary VPC for the file system.
  final String vpcId;

  /// The ID of the subnet to contain the endpoint for the file system. One and
  /// only one is supported. The file system is launched in the Availability
  /// Zone associated with this subnet.
  final List<String> subnetIds;

  /// The IDs of the elastic network interface from which a specific file system
  /// is accessible. The elastic network interface is automatically created in
  /// the same VPC that the Amazon FSx file system was created in. For more
  /// information, see
  /// [Elastic Network Interfaces](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-eni.html)
  /// in the _Amazon EC2 User Guide._
  ///
  /// For an Amazon FSx for Windows File Server file system, you can have one
  /// network interface ID. For an Amazon FSx for Lustre file system, you can
  /// have more than one.
  final List<String> networkInterfaceIds;

  /// The DNS name for the file system.
  final String dnsName;

  /// The ID of the AWS Key Management Service (AWS KMS) key used to encrypt the
  /// file system's data for an Amazon FSx for Windows File Server file system.
  final String kmsKeyId;

  /// The Amazon Resource Name (ARN) for the file system resource.
  final String resourceArn;

  /// The tags to associate with the file system. For more information, see
  /// [Tagging Your Amazon EC2 Resources](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html)
  /// in the _Amazon EC2 User Guide_.
  final List<Tag> tags;

  /// The configuration for this Microsoft Windows file system.
  final WindowsFileSystemConfiguration windowsConfiguration;

  final LustreFileSystemConfiguration lustreConfiguration;

  FileSystem({
    this.ownerId,
    this.creationTime,
    this.fileSystemId,
    this.fileSystemType,
    this.lifecycle,
    this.failureDetails,
    this.storageCapacity,
    this.vpcId,
    this.subnetIds,
    this.networkInterfaceIds,
    this.dnsName,
    this.kmsKeyId,
    this.resourceArn,
    this.tags,
    this.windowsConfiguration,
    this.lustreConfiguration,
  });
  static FileSystem fromJson(Map<String, dynamic> json) => FileSystem(
        ownerId: json.containsKey('OwnerId') ? json['OwnerId'] as String : null,
        creationTime: json.containsKey('CreationTime')
            ? DateTime.parse(json['CreationTime'])
            : null,
        fileSystemId: json.containsKey('FileSystemId')
            ? json['FileSystemId'] as String
            : null,
        fileSystemType: json.containsKey('FileSystemType')
            ? json['FileSystemType'] as String
            : null,
        lifecycle:
            json.containsKey('Lifecycle') ? json['Lifecycle'] as String : null,
        failureDetails: json.containsKey('FailureDetails')
            ? FileSystemFailureDetails.fromJson(json['FailureDetails'])
            : null,
        storageCapacity: json.containsKey('StorageCapacity')
            ? json['StorageCapacity'] as int
            : null,
        vpcId: json.containsKey('VpcId') ? json['VpcId'] as String : null,
        subnetIds: json.containsKey('SubnetIds')
            ? (json['SubnetIds'] as List).map((e) => e as String).toList()
            : null,
        networkInterfaceIds: json.containsKey('NetworkInterfaceIds')
            ? (json['NetworkInterfaceIds'] as List)
                .map((e) => e as String)
                .toList()
            : null,
        dnsName: json.containsKey('DNSName') ? json['DNSName'] as String : null,
        kmsKeyId:
            json.containsKey('KmsKeyId') ? json['KmsKeyId'] as String : null,
        resourceArn: json.containsKey('ResourceARN')
            ? json['ResourceARN'] as String
            : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as List).map((e) => Tag.fromJson(e)).toList()
            : null,
        windowsConfiguration: json.containsKey('WindowsConfiguration')
            ? WindowsFileSystemConfiguration.fromJson(
                json['WindowsConfiguration'])
            : null,
        lustreConfiguration: json.containsKey('LustreConfiguration')
            ? LustreFileSystemConfiguration.fromJson(
                json['LustreConfiguration'])
            : null,
      );
}

/// A structure providing details of any failures that occur when creating the
/// file system has failed.
class FileSystemFailureDetails {
  /// A message describing any failures that occurred during file system
  /// creation.
  final String message;

  FileSystemFailureDetails({
    this.message,
  });
  static FileSystemFailureDetails fromJson(Map<String, dynamic> json) =>
      FileSystemFailureDetails(
        message: json.containsKey('Message') ? json['Message'] as String : null,
      );
}

/// A filter used to restrict the results of describe calls. You can use
/// multiple filters to return results that meet all applied filter
/// requirements.
class Filter {
  /// The name for this filter.
  final String name;

  /// The values of the filter. These are all the values for any of the applied
  /// filters.
  final List<String> values;

  Filter({
    this.name,
    this.values,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The response object for `ListTagsForResource` operation.
class ListTagsForResourceResponse {
  /// A list of tags on the resource.
  final List<Tag> tags;

  /// This is present if there are more tags than returned in the response
  /// (String). You can use the `NextToken` value in the later request to fetch
  /// the tags.
  final String nextToken;

  ListTagsForResourceResponse({
    this.tags,
    this.nextToken,
  });
  static ListTagsForResourceResponse fromJson(Map<String, dynamic> json) =>
      ListTagsForResourceResponse(
        tags: json.containsKey('Tags')
            ? (json['Tags'] as List).map((e) => Tag.fromJson(e)).toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// The configuration for the Amazon FSx for Lustre file system.
class LustreFileSystemConfiguration {
  /// The UTC time that you want to begin your weekly maintenance window.
  final String weeklyMaintenanceStartTime;

  final DataRepositoryConfiguration dataRepositoryConfiguration;

  LustreFileSystemConfiguration({
    this.weeklyMaintenanceStartTime,
    this.dataRepositoryConfiguration,
  });
  static LustreFileSystemConfiguration fromJson(Map<String, dynamic> json) =>
      LustreFileSystemConfiguration(
        weeklyMaintenanceStartTime:
            json.containsKey('WeeklyMaintenanceStartTime')
                ? json['WeeklyMaintenanceStartTime'] as String
                : null,
        dataRepositoryConfiguration:
            json.containsKey('DataRepositoryConfiguration')
                ? DataRepositoryConfiguration.fromJson(
                    json['DataRepositoryConfiguration'])
                : null,
      );
}

/// The configuration of the self-managed Microsoft Active Directory (AD)
/// directory to which the Windows File Server instance is joined.
class SelfManagedActiveDirectoryAttributes {
  /// The fully qualified domain name of the self-managed AD directory.
  final String domainName;

  /// The fully qualified distinguished name of the organizational unit within
  /// the self-managed AD directory to which the Windows File Server instance is
  /// joined.
  final String organizationalUnitDistinguishedName;

  /// The name of the domain group whose members have administrative privileges
  /// for the FSx file system.
  final String fileSystemAdministratorsGroup;

  /// The user name for the service account on your self-managed AD domain that
  /// FSx uses to join to your AD domain.
  final String userName;

  /// A list of up to two IP addresses of DNS servers or domain controllers in
  /// the self-managed AD directory.
  final List<String> dnsIps;

  SelfManagedActiveDirectoryAttributes({
    this.domainName,
    this.organizationalUnitDistinguishedName,
    this.fileSystemAdministratorsGroup,
    this.userName,
    this.dnsIps,
  });
  static SelfManagedActiveDirectoryAttributes fromJson(
          Map<String, dynamic> json) =>
      SelfManagedActiveDirectoryAttributes(
        domainName: json.containsKey('DomainName')
            ? json['DomainName'] as String
            : null,
        organizationalUnitDistinguishedName:
            json.containsKey('OrganizationalUnitDistinguishedName')
                ? json['OrganizationalUnitDistinguishedName'] as String
                : null,
        fileSystemAdministratorsGroup:
            json.containsKey('FileSystemAdministratorsGroup')
                ? json['FileSystemAdministratorsGroup'] as String
                : null,
        userName:
            json.containsKey('UserName') ? json['UserName'] as String : null,
        dnsIps: json.containsKey('DnsIps')
            ? (json['DnsIps'] as List).map((e) => e as String).toList()
            : null,
      );
}

/// The configuration that Amazon FSx uses to join the Windows File Server
/// instance to your self-managed (including on-premises) Microsoft Active
/// Directory (AD) directory.
class SelfManagedActiveDirectoryConfiguration {
  /// The fully qualified domain name of the self-managed AD directory, such as
  /// `corp.example.com`.
  final String domainName;

  /// (Optional) The fully qualified distinguished name of the organizational
  /// unit within your self-managed AD directory that the Windows File Server
  /// instance will join. Amazon FSx only accepts OU as the direct parent of the
  /// file system. An example is `OU=FSx,DC=yourdomain,DC=corp,DC=com`. To learn
  /// more, see [RFC 2253](https://tools.ietf.org/html/rfc2253). If none is
  /// provided, the FSx file system is created in the default location of your
  /// self-managed AD directory.
  ///
  ///
  ///
  /// Only Organizational Unit (OU) objects can be the direct parent of the file
  /// system that you're creating.
  final String organizationalUnitDistinguishedName;

  /// (Optional) The name of the domain group whose members are granted
  /// administrative privileges for the file system. Administrative privileges
  /// include taking ownership of files and folders, and setting audit controls
  /// (audit ACLs) on files and folders. The group that you specify must already
  /// exist in your domain. If you don't provide one, your AD domain's Domain
  /// Admins group is used.
  final String fileSystemAdministratorsGroup;

  /// The user name for the service account on your self-managed AD domain that
  /// Amazon FSx will use to join to your AD domain. This account must have the
  /// permission to join computers to the domain in the organizational unit
  /// provided in `OrganizationalUnitDistinguishedName`, or in the default
  /// location of your AD domain.
  final String userName;

  /// The password for the service account on your self-managed AD domain that
  /// Amazon FSx will use to join to your AD domain.
  final String password;

  /// A list of up to two IP addresses of DNS servers or domain controllers in
  /// the self-managed AD directory. The IP addresses need to be either in the
  /// same VPC CIDR range as the one in which your Amazon FSx file system is
  /// being created, or in the private IP version 4 (Iv4) address ranges, as
  /// specified in [RFC 1918](http://www.faqs.org/rfcs/rfc1918.html):
  ///
  /// *   10.0.0.0 - 10.255.255.255 (10/8 prefix)
  ///
  /// *   172.16.0.0 - 172.31.255.255 (172.16/12 prefix)
  ///
  /// *   192.168.0.0 - 192.168.255.255 (192.168/16 prefix)
  final List<String> dnsIps;

  SelfManagedActiveDirectoryConfiguration({
    @required this.domainName,
    this.organizationalUnitDistinguishedName,
    this.fileSystemAdministratorsGroup,
    @required this.userName,
    @required this.password,
    @required this.dnsIps,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The configuration that Amazon FSx uses to join the Windows File Server
/// instance to the self-managed Microsoft Active Directory (AD) directory.
class SelfManagedActiveDirectoryConfigurationUpdates {
  /// The user name for the service account on your self-managed AD domain that
  /// Amazon FSx will use to join to your AD domain. This account must have the
  /// permission to join computers to the domain in the organizational unit
  /// provided in `OrganizationalUnitDistinguishedName`.
  final String userName;

  /// The password for the service account on your self-managed AD domain that
  /// Amazon FSx will use to join to your AD domain.
  final String password;

  /// A list of up to two IP addresses of DNS servers or domain controllers in
  /// the self-managed AD directory.
  final List<String> dnsIps;

  SelfManagedActiveDirectoryConfigurationUpdates({
    this.userName,
    this.password,
    this.dnsIps,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies a key-value pair for a resource tag.
class Tag {
  /// A value that specifies the `TagKey`, the name of the tag. Tag keys must be
  /// unique for the resource to which they are attached.
  final String key;

  /// A value that specifies the `TagValue`, the value assigned to the
  /// corresponding tag key. Tag values can be null and don't have to be unique
  /// in a tag set. For example, you can have a key-value pair in a tag set of
  /// `finances : April` and also of `payroll : April`.
  final String value;

  Tag({
    this.key,
    this.value,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag(
        key: json.containsKey('Key') ? json['Key'] as String : null,
        value: json.containsKey('Value') ? json['Value'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The response object for the `TagResource` operation.
class TagResourceResponse {
  TagResourceResponse();
  static TagResourceResponse fromJson(Map<String, dynamic> json) =>
      TagResourceResponse();
}

/// The response object for `UntagResource` action.
class UntagResourceResponse {
  UntagResourceResponse();
  static UntagResourceResponse fromJson(Map<String, dynamic> json) =>
      UntagResourceResponse();
}

/// The configuration object for Amazon FSx for Lustre file systems used in the
/// `UpdateFileSystem` operation.
class UpdateFileSystemLustreConfiguration {
  /// The preferred time to perform weekly maintenance, in the UTC time zone.
  final String weeklyMaintenanceStartTime;

  UpdateFileSystemLustreConfiguration({
    this.weeklyMaintenanceStartTime,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The response object for the `UpdateFileSystem` operation.
class UpdateFileSystemResponse {
  /// A description of the file system that was updated.
  final FileSystem fileSystem;

  UpdateFileSystemResponse({
    this.fileSystem,
  });
  static UpdateFileSystemResponse fromJson(Map<String, dynamic> json) =>
      UpdateFileSystemResponse(
        fileSystem: json.containsKey('FileSystem')
            ? FileSystem.fromJson(json['FileSystem'])
            : null,
      );
}

/// Updates the Microsoft Windows configuration for an existing Amazon FSx for
/// Windows File Server file system. Amazon FSx overwrites existing properties
/// with non-null values provided in the request. If you don't specify a
/// non-null value for a property, that property is not updated.
class UpdateFileSystemWindowsConfiguration {
  /// The preferred time to perform weekly maintenance, in the UTC time zone.
  final String weeklyMaintenanceStartTime;

  /// The preferred time to take daily automatic backups, in the UTC time zone.
  final String dailyAutomaticBackupStartTime;

  /// The number of days to retain automatic backups. Setting this to 0 disables
  /// automatic backups. You can retain automatic backups for a maximum of 35
  /// days.
  final int automaticBackupRetentionDays;

  /// The configuration Amazon FSx uses to join the Windows File Server instance
  /// to the self-managed Microsoft AD directory.
  final SelfManagedActiveDirectoryConfigurationUpdates
      selfManagedActiveDirectoryConfiguration;

  UpdateFileSystemWindowsConfiguration({
    this.weeklyMaintenanceStartTime,
    this.dailyAutomaticBackupStartTime,
    this.automaticBackupRetentionDays,
    this.selfManagedActiveDirectoryConfiguration,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The configuration for this Microsoft Windows file system.
class WindowsFileSystemConfiguration {
  /// The ID for an existing Microsoft Active Directory instance that the file
  /// system should join when it's created.
  final String activeDirectoryId;

  final SelfManagedActiveDirectoryAttributes
      selfManagedActiveDirectoryConfiguration;

  /// The throughput of an Amazon FSx file system, measured in megabytes per
  /// second.
  final int throughputCapacity;

  /// The list of maintenance operations in progress for this file system.
  final List<String> maintenanceOperationsInProgress;

  /// The preferred time to perform weekly maintenance, in the UTC time zone.
  final String weeklyMaintenanceStartTime;

  /// The preferred time to take daily automatic backups, in the UTC time zone.
  final String dailyAutomaticBackupStartTime;

  /// The number of days to retain automatic backups. Setting this to 0 disables
  /// automatic backups. You can retain automatic backups for a maximum of 35
  /// days.
  final int automaticBackupRetentionDays;

  /// A boolean flag indicating whether tags on the file system should be copied
  /// to backups. This value defaults to false. If it's set to true, all tags on
  /// the file system are copied to all automatic backups and any user-initiated
  /// backups where the user doesn't specify any tags. If this value is true,
  /// and you specify one or more tags, only the specified tags are copied to
  /// backups.
  final bool copyTagsToBackups;

  WindowsFileSystemConfiguration({
    this.activeDirectoryId,
    this.selfManagedActiveDirectoryConfiguration,
    this.throughputCapacity,
    this.maintenanceOperationsInProgress,
    this.weeklyMaintenanceStartTime,
    this.dailyAutomaticBackupStartTime,
    this.automaticBackupRetentionDays,
    this.copyTagsToBackups,
  });
  static WindowsFileSystemConfiguration fromJson(Map<String, dynamic> json) =>
      WindowsFileSystemConfiguration(
        activeDirectoryId: json.containsKey('ActiveDirectoryId')
            ? json['ActiveDirectoryId'] as String
            : null,
        selfManagedActiveDirectoryConfiguration:
            json.containsKey('SelfManagedActiveDirectoryConfiguration')
                ? SelfManagedActiveDirectoryAttributes.fromJson(
                    json['SelfManagedActiveDirectoryConfiguration'])
                : null,
        throughputCapacity: json.containsKey('ThroughputCapacity')
            ? json['ThroughputCapacity'] as int
            : null,
        maintenanceOperationsInProgress:
            json.containsKey('MaintenanceOperationsInProgress')
                ? (json['MaintenanceOperationsInProgress'] as List)
                    .map((e) => e as String)
                    .toList()
                : null,
        weeklyMaintenanceStartTime:
            json.containsKey('WeeklyMaintenanceStartTime')
                ? json['WeeklyMaintenanceStartTime'] as String
                : null,
        dailyAutomaticBackupStartTime:
            json.containsKey('DailyAutomaticBackupStartTime')
                ? json['DailyAutomaticBackupStartTime'] as String
                : null,
        automaticBackupRetentionDays:
            json.containsKey('AutomaticBackupRetentionDays')
                ? json['AutomaticBackupRetentionDays'] as int
                : null,
        copyTagsToBackups: json.containsKey('CopyTagsToBackups')
            ? json['CopyTagsToBackups'] as bool
            : null,
      );
}
