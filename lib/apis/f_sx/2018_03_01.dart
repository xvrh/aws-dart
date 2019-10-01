import 'package:meta/meta.dart';

/// Amazon FSx is a fully managed service that makes it easy for storage and
/// application administrators to launch and use shared file storage.
class FSxApi {
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
  Future<void> createBackup(String fileSystemId,
      {String clientRequestToken, List<Tag> tags}) async {}

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
  Future<void> createFileSystem(
      {String clientRequestToken,
      @required String fileSystemType,
      @required int storageCapacity,
      @required List<String> subnetIds,
      List<String> securityGroupIds,
      List<Tag> tags,
      String kmsKeyId,
      CreateFileSystemWindowsConfiguration windowsConfiguration,
      CreateFileSystemLustreConfiguration lustreConfiguration}) async {}

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
  Future<void> createFileSystemFromBackup(
      {@required String backupId,
      String clientRequestToken,
      @required List<String> subnetIds,
      List<String> securityGroupIds,
      List<Tag> tags,
      CreateFileSystemWindowsConfiguration windowsConfiguration}) async {}

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
  Future<void> deleteBackup(String backupId,
      {String clientRequestToken}) async {}

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
  Future<void> deleteFileSystem(String fileSystemId,
      {String clientRequestToken,
      DeleteFileSystemWindowsConfiguration windowsConfiguration}) async {}

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
  Future<void> describeBackups(
      {List<String> backupIds,
      List<Filter> filters,
      int maxResults,
      String nextToken}) async {}

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
  Future<void> describeFileSystems(
      {List<String> fileSystemIds, int maxResults, String nextToken}) async {}

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
  Future<void> listTagsForResource(String resourceArn,
      {int maxResults, String nextToken}) async {}

  /// Tags an Amazon FSx resource.
  Future<void> tagResource(
      {@required String resourceArn, @required List<Tag> tags}) async {}

  /// This action removes a tag from an Amazon FSx resource.
  Future<void> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {}

  /// Updates a file system configuration.
  Future<void> updateFileSystem(String fileSystemId,
      {String clientRequestToken,
      UpdateFileSystemWindowsConfiguration windowsConfiguration,
      UpdateFileSystemLustreConfiguration lustreConfiguration}) async {}
}

class ActiveDirectoryBackupAttributes {}

class Backup {}

class BackupFailureDetails {}

class CreateBackupResponse {}

class CreateFileSystemFromBackupResponse {}

class CreateFileSystemLustreConfiguration {}

class CreateFileSystemResponse {}

class CreateFileSystemWindowsConfiguration {}

class DataRepositoryConfiguration {}

class DeleteBackupResponse {}

class DeleteFileSystemResponse {}

class DeleteFileSystemWindowsConfiguration {}

class DeleteFileSystemWindowsResponse {}

class DescribeBackupsResponse {}

class DescribeFileSystemsResponse {}

class FileSystem {}

class FileSystemFailureDetails {}

class Filter {}

class ListTagsForResourceResponse {}

class LustreFileSystemConfiguration {}

class SelfManagedActiveDirectoryAttributes {}

class SelfManagedActiveDirectoryConfiguration {}

class SelfManagedActiveDirectoryConfigurationUpdates {}

class Tag {}

class TagResourceResponse {}

class UntagResourceResponse {}

class UpdateFileSystemLustreConfiguration {}

class UpdateFileSystemResponse {}

class UpdateFileSystemWindowsConfiguration {}

class WindowsFileSystemConfiguration {}
