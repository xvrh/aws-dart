import 'package:meta/meta.dart';

/// Amazon Elastic File System
///
/// Amazon Elastic File System (Amazon EFS) provides simple, scalable file
/// storage for use with Amazon EC2 instances in the AWS Cloud. With Amazon EFS,
/// storage capacity is elastic, growing and shrinking automatically as you add
/// and remove files, so your applications have the storage they need, when they
/// need it. For more information, see the
/// [User Guide](https://docs.aws.amazon.com/efs/latest/ug/api-reference.html).
class EfsApi {
  final _client;
  EfsApi(client) : _client = client.configured('EFS', serializer: 'rest-json');

  /// Creates a new, empty file system. The operation requires a creation token
  /// in the request that Amazon EFS uses to ensure idempotent creation (calling
  /// the operation with same creation token has no effect). If a file system
  /// does not currently exist that is owned by the caller's AWS account with
  /// the specified creation token, this operation does the following:
  ///
  /// *   Creates a new, empty file system. The file system will have an Amazon
  /// EFS assigned ID, and an initial lifecycle state `creating`.
  ///
  /// *   Returns with the description of the created file system.
  ///
  ///
  /// Otherwise, this operation returns a `FileSystemAlreadyExists` error with
  /// the ID of the existing file system.
  ///
  ///  For basic use cases, you can use a randomly generated UUID for the
  /// creation token.
  ///
  ///  The idempotent operation allows you to retry a `CreateFileSystem` call
  /// without risk of creating an extra file system. This can happen when an
  /// initial call fails in a way that leaves it uncertain whether or not a file
  /// system was actually created. An example might be that a transport level
  /// timeout occurred or your connection was reset. As long as you use the same
  /// creation token, if the initial call had succeeded in creating a file
  /// system, the client can learn of its existence from the
  /// `FileSystemAlreadyExists` error.
  ///
  ///  The `CreateFileSystem` call returns while the file system's lifecycle
  /// state is still `creating`. You can check the file system creation status
  /// by calling the DescribeFileSystems operation, which among other things
  /// returns the file system state.
  ///
  /// This operation also takes an optional `PerformanceMode` parameter that you
  /// choose for your file system. We recommend `generalPurpose` performance
  /// mode for most file systems. File systems using the `maxIO` performance
  /// mode can scale to higher levels of aggregate throughput and operations per
  /// second with a tradeoff of slightly higher latencies for most file
  /// operations. The performance mode can't be changed after the file system
  /// has been created. For more information, see
  /// [Amazon EFS: Performance Modes](https://docs.aws.amazon.com/efs/latest/ug/performance.html#performancemodes.html).
  ///
  /// After the file system is fully created, Amazon EFS sets its lifecycle
  /// state to `available`, at which point you can create one or more mount
  /// targets for the file system in your VPC. For more information, see
  /// CreateMountTarget. You mount your Amazon EFS file system on an EC2
  /// instances in your VPC by using the mount target. For more information, see
  /// [Amazon EFS: How it Works](https://docs.aws.amazon.com/efs/latest/ug/how-it-works.html).
  ///
  ///  This operation requires permissions for the
  /// `elasticfilesystem:CreateFileSystem` action.
  ///
  /// [creationToken]: A string of up to 64 ASCII characters. Amazon EFS uses
  /// this to ensure idempotent creation.
  ///
  /// [performanceMode]: The performance mode of the file system. We recommend
  /// `generalPurpose` performance mode for most file systems. File systems
  /// using the `maxIO` performance mode can scale to higher levels of aggregate
  /// throughput and operations per second with a tradeoff of slightly higher
  /// latencies for most file operations. The performance mode can't be changed
  /// after the file system has been created.
  ///
  /// [encrypted]: A Boolean value that, if true, creates an encrypted file
  /// system. When creating an encrypted file system, you have the option of
  /// specifying CreateFileSystemRequest$KmsKeyId for an existing AWS Key
  /// Management Service (AWS KMS) customer master key (CMK). If you don't
  /// specify a CMK, then the default CMK for Amazon EFS,
  /// `/aws/elasticfilesystem`, is used to protect the encrypted file system.
  ///
  /// [kmsKeyId]: The ID of the AWS KMS CMK to be used to protect the encrypted
  /// file system. This parameter is only required if you want to use a
  /// nondefault CMK. If this parameter is not specified, the default CMK for
  /// Amazon EFS is used. This ID can be in one of the following formats:
  ///
  /// *   Key ID - A unique identifier of the key, for example
  /// `1234abcd-12ab-34cd-56ef-1234567890ab`.
  ///
  /// *   ARN - An Amazon Resource Name (ARN) for the key, for example
  /// `arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab`.
  ///
  /// *   Key alias - A previously created display name for a key, for example
  /// `alias/projectKey1`.
  ///
  /// *   Key alias ARN - An ARN for a key alias, for example
  /// `arn:aws:kms:us-west-2:444455556666:alias/projectKey1`.
  ///
  ///
  /// If `KmsKeyId` is specified, the CreateFileSystemRequest$Encrypted
  /// parameter must be set to true.
  ///
  /// [throughputMode]: The throughput mode for the file system to be created.
  /// There are two throughput modes to choose from for your file system:
  /// `bursting` and `provisioned`. If you set `ThroughputMode` to
  /// `provisioned`, you must also set a value for
  /// `ProvisionedThroughPutInMibps`. You can decrease your file system's
  /// throughput in Provisioned Throughput mode or change between the throughput
  /// modes as long as it’s been more than 24 hours since the last decrease or
  /// throughput mode change. For more, see
  /// [Specifying Throughput with Provisioned Mode](https://docs.aws.amazon.com/efs/latest/ug/performance.html#provisioned-throughput)
  /// in the _Amazon EFS User Guide._
  ///
  /// [provisionedThroughputInMibps]: The throughput, measured in MiB/s, that
  /// you want to provision for a file system that you're creating. Valid values
  /// are 1-1024. Required if `ThroughputMode` is set to `provisioned`. The
  /// upper limit for throughput is 1024 MiB/s. You can get this limit increased
  /// by contacting AWS Support. For more information, see
  /// [Amazon EFS Limits That You Can Increase](https://docs.aws.amazon.com/efs/latest/ug/limits.html#soft-limits)
  /// in the _Amazon EFS User Guide._
  ///
  /// [tags]: A value that specifies to create one or more tags associated with
  /// the file system. Each tag is a user-defined key-value pair. Name your file
  /// system on creation by including a `"Key":"Name","Value":"{value}"`
  /// key-value pair.
  Future<FileSystemDescription> createFileSystem(String creationToken,
      {String performanceMode,
      bool encrypted,
      String kmsKeyId,
      String throughputMode,
      double provisionedThroughputInMibps,
      List<Tag> tags}) async {
    var response_ = await _client.send('CreateFileSystem', {
      'CreationToken': creationToken,
      if (performanceMode != null) 'PerformanceMode': performanceMode,
      if (encrypted != null) 'Encrypted': encrypted,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (throughputMode != null) 'ThroughputMode': throughputMode,
      if (provisionedThroughputInMibps != null)
        'ProvisionedThroughputInMibps': provisionedThroughputInMibps,
      if (tags != null) 'Tags': tags,
    });
    return FileSystemDescription.fromJson(response_);
  }

  /// Creates a mount target for a file system. You can then mount the file
  /// system on EC2 instances by using the mount target.
  ///
  /// You can create one mount target in each Availability Zone in your VPC. All
  /// EC2 instances in a VPC within a given Availability Zone share a single
  /// mount target for a given file system. If you have multiple subnets in an
  /// Availability Zone, you create a mount target in one of the subnets. EC2
  /// instances do not need to be in the same subnet as the mount target in
  /// order to access their file system. For more information, see
  /// [Amazon EFS: How it Works](https://docs.aws.amazon.com/efs/latest/ug/how-it-works.html).
  ///
  /// In the request, you also specify a file system ID for which you are
  /// creating the mount target and the file system's lifecycle state must be
  /// `available`. For more information, see DescribeFileSystems.
  ///
  /// In the request, you also provide a subnet ID, which determines the
  /// following:
  ///
  /// *   VPC in which Amazon EFS creates the mount target
  ///
  /// *   Availability Zone in which Amazon EFS creates the mount target
  ///
  /// *   IP address range from which Amazon EFS selects the IP address of the
  /// mount target (if you don't specify an IP address in the request)
  ///
  ///
  /// After creating the mount target, Amazon EFS returns a response that
  /// includes, a `MountTargetId` and an `IpAddress`. You use this IP address
  /// when mounting the file system in an EC2 instance. You can also use the
  /// mount target's DNS name when mounting the file system. The EC2 instance on
  /// which you mount the file system by using the mount target can resolve the
  /// mount target's DNS name to its IP address. For more information, see
  /// [How it Works: Implementation Overview](https://docs.aws.amazon.com/efs/latest/ug/how-it-works.html#how-it-works-implementation).
  ///
  /// Note that you can create mount targets for a file system in only one VPC,
  /// and there can be only one mount target per Availability Zone. That is, if
  /// the file system already has one or more mount targets created for it, the
  /// subnet specified in the request to add another mount target must meet the
  /// following requirements:
  ///
  /// *   Must belong to the same VPC as the subnets of the existing mount
  /// targets
  ///
  /// *   Must not be in the same Availability Zone as any of the subnets of the
  /// existing mount targets
  ///
  ///
  /// If the request satisfies the requirements, Amazon EFS does the following:
  ///
  /// *   Creates a new mount target in the specified subnet.
  ///
  /// *   Also creates a new network interface in the subnet as follows:
  ///
  ///     *   If the request provides an `IpAddress`, Amazon EFS assigns that IP
  /// address to the network interface. Otherwise, Amazon EFS assigns a free
  /// address in the subnet (in the same way that the Amazon EC2
  /// `CreateNetworkInterface` call does when a request does not specify a
  /// primary private IP address).
  ///
  ///     *   If the request provides `SecurityGroups`, this network interface
  /// is associated with those security groups. Otherwise, it belongs to the
  /// default security group for the subnet's VPC.
  ///
  ///     *   Assigns the description `Mount target _fsmt-id_ for file system
  /// _fs-id_`  where  `_fsmt-id_`  is the mount target ID, and  `_fs-id_`  is
  /// the `FileSystemId`.
  ///
  ///     *   Sets the `requesterManaged` property of the network interface to
  /// `true`, and the `requesterId` value to `EFS`.
  ///
  ///
  ///     Each Amazon EFS mount target has one corresponding requester-managed
  /// EC2 network interface. After the network interface is created, Amazon EFS
  /// sets the `NetworkInterfaceId` field in the mount target's description to
  /// the network interface ID, and the `IpAddress` field to its address. If
  /// network interface creation fails, the entire `CreateMountTarget` operation
  /// fails.
  ///
  ///
  ///  The `CreateMountTarget` call returns only after creating the network
  /// interface, but while the mount target state is still `creating`, you can
  /// check the mount target creation status by calling the DescribeMountTargets
  /// operation, which among other things returns the mount target state.
  ///
  /// We recommend that you create a mount target in each of the Availability
  /// Zones. There are cost considerations for using a file system in an
  /// Availability Zone through a mount target created in another Availability
  /// Zone. For more information, see [Amazon EFS](http://aws.amazon.com/efs/).
  /// In addition, by always using a mount target local to the instance's
  /// Availability Zone, you eliminate a partial failure scenario. If the
  /// Availability Zone in which your mount target is created goes down, then
  /// you can't access your file system through that mount target.
  ///
  /// This operation requires permissions for the following action on the file
  /// system:
  ///
  /// *    `elasticfilesystem:CreateMountTarget`
  ///
  ///
  /// This operation also requires permissions for the following Amazon EC2
  /// actions:
  ///
  /// *    `ec2:DescribeSubnets`
  ///
  /// *    `ec2:DescribeNetworkInterfaces`
  ///
  /// *    `ec2:CreateNetworkInterface`
  ///
  /// [fileSystemId]: The ID of the file system for which to create the mount
  /// target.
  ///
  /// [subnetId]: The ID of the subnet to add the mount target in.
  ///
  /// [ipAddress]: Valid IPv4 address within the address range of the specified
  /// subnet.
  ///
  /// [securityGroups]: Up to five VPC security group IDs, of the form
  /// `sg-xxxxxxxx`. These must be for the same VPC as subnet specified.
  Future<MountTargetDescription> createMountTarget(
      {@required String fileSystemId,
      @required String subnetId,
      String ipAddress,
      List<String> securityGroups}) async {
    var response_ = await _client.send('CreateMountTarget', {
      'FileSystemId': fileSystemId,
      'SubnetId': subnetId,
      if (ipAddress != null) 'IpAddress': ipAddress,
      if (securityGroups != null) 'SecurityGroups': securityGroups,
    });
    return MountTargetDescription.fromJson(response_);
  }

  /// Creates or overwrites tags associated with a file system. Each tag is a
  /// key-value pair. If a tag key specified in the request already exists on
  /// the file system, this operation overwrites its value with the value
  /// provided in the request. If you add the `Name` tag to your file system,
  /// Amazon EFS returns it in the response to the DescribeFileSystems
  /// operation.
  ///
  /// This operation requires permission for the `elasticfilesystem:CreateTags`
  /// action.
  ///
  /// [fileSystemId]: The ID of the file system whose tags you want to modify
  /// (String). This operation modifies the tags only, not the file system.
  ///
  /// [tags]: An array of `Tag` objects to add. Each `Tag` object is a key-value
  /// pair.
  Future<void> createTags(
      {@required String fileSystemId, @required List<Tag> tags}) async {
    await _client.send('CreateTags', {
      'FileSystemId': fileSystemId,
      'Tags': tags,
    });
  }

  /// Deletes a file system, permanently severing access to its contents. Upon
  /// return, the file system no longer exists and you can't access any contents
  /// of the deleted file system.
  ///
  ///  You can't delete a file system that is in use. That is, if the file
  /// system has any mount targets, you must first delete them. For more
  /// information, see DescribeMountTargets and DeleteMountTarget.
  ///
  ///  The `DeleteFileSystem` call returns while the file system state is still
  /// `deleting`. You can check the file system deletion status by calling the
  /// DescribeFileSystems operation, which returns a list of file systems in
  /// your account. If you pass file system ID or creation token for the deleted
  /// file system, the DescribeFileSystems returns a `404 FileSystemNotFound`
  /// error.
  ///
  /// This operation requires permissions for the
  /// `elasticfilesystem:DeleteFileSystem` action.
  ///
  /// [fileSystemId]: The ID of the file system you want to delete.
  Future<void> deleteFileSystem(String fileSystemId) async {
    await _client.send('DeleteFileSystem', {
      'FileSystemId': fileSystemId,
    });
  }

  /// Deletes the specified mount target.
  ///
  /// This operation forcibly breaks any mounts of the file system by using the
  /// mount target that is being deleted, which might disrupt instances or
  /// applications using those mounts. To avoid applications getting cut off
  /// abruptly, you might consider unmounting any mounts of the mount target, if
  /// feasible. The operation also deletes the associated network interface.
  /// Uncommitted writes might be lost, but breaking a mount target using this
  /// operation does not corrupt the file system itself. The file system you
  /// created remains. You can mount an EC2 instance in your VPC by using
  /// another mount target.
  ///
  /// This operation requires permissions for the following action on the file
  /// system:
  ///
  /// *    `elasticfilesystem:DeleteMountTarget`
  ///
  ///
  ///  The `DeleteMountTarget` call returns while the mount target state is
  /// still `deleting`. You can check the mount target deletion by calling the
  /// DescribeMountTargets operation, which returns a list of mount target
  /// descriptions for the given file system.
  ///
  /// The operation also requires permissions for the following Amazon EC2
  /// action on the mount target's network interface:
  ///
  /// *    `ec2:DeleteNetworkInterface`
  ///
  /// [mountTargetId]: The ID of the mount target to delete (String).
  Future<void> deleteMountTarget(String mountTargetId) async {
    await _client.send('DeleteMountTarget', {
      'MountTargetId': mountTargetId,
    });
  }

  /// Deletes the specified tags from a file system. If the `DeleteTags` request
  /// includes a tag key that doesn't exist, Amazon EFS ignores it and doesn't
  /// cause an error. For more information about tags and related restrictions,
  /// see
  /// [Tag Restrictions](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html)
  /// in the _AWS Billing and Cost Management User Guide_.
  ///
  /// This operation requires permissions for the `elasticfilesystem:DeleteTags`
  /// action.
  ///
  /// [fileSystemId]: The ID of the file system whose tags you want to delete
  /// (String).
  ///
  /// [tagKeys]: A list of tag keys to delete.
  Future<void> deleteTags(
      {@required String fileSystemId, @required List<String> tagKeys}) async {
    await _client.send('DeleteTags', {
      'FileSystemId': fileSystemId,
      'TagKeys': tagKeys,
    });
  }

  /// Returns the description of a specific Amazon EFS file system if either the
  /// file system `CreationToken` or the `FileSystemId` is provided. Otherwise,
  /// it returns descriptions of all file systems owned by the caller's AWS
  /// account in the AWS Region of the endpoint that you're calling.
  ///
  /// When retrieving all file system descriptions, you can optionally specify
  /// the `MaxItems` parameter to limit the number of descriptions in a
  /// response. Currently, this number is automatically set to 10. If more file
  /// system descriptions remain, Amazon EFS returns a `NextMarker`, an opaque
  /// token, in the response. In this case, you should send a subsequent request
  /// with the `Marker` request parameter set to the value of `NextMarker`.
  ///
  /// To retrieve a list of your file system descriptions, this operation is
  /// used in an iterative process, where `DescribeFileSystems` is called first
  /// without the `Marker` and then the operation continues to call it with the
  /// `Marker` parameter set to the value of the `NextMarker` from the previous
  /// response until the response has no `NextMarker`.
  ///
  ///  The order of file systems returned in the response of one
  /// `DescribeFileSystems` call and the order of file systems returned across
  /// the responses of a multi-call iteration is unspecified.
  ///
  ///  This operation requires permissions for the
  /// `elasticfilesystem:DescribeFileSystems` action.
  ///
  /// [maxItems]: (Optional) Specifies the maximum number of file systems to
  /// return in the response (integer). Currently, this number is automatically
  /// set to 10, and other values are ignored. The response is paginated at 10
  /// per page if you have more than 10 file systems.
  ///
  /// [marker]: (Optional) Opaque pagination token returned from a previous
  /// `DescribeFileSystems` operation (String). If present, specifies to
  /// continue the list from where the returning call had left off.
  ///
  /// [creationToken]: (Optional) Restricts the list to the file system with
  /// this creation token (String). You specify a creation token when you create
  /// an Amazon EFS file system.
  ///
  /// [fileSystemId]: (Optional) ID of the file system whose description you
  /// want to retrieve (String).
  Future<DescribeFileSystemsResponse> describeFileSystems(
      {int maxItems,
      String marker,
      String creationToken,
      String fileSystemId}) async {
    var response_ = await _client.send('DescribeFileSystems', {
      if (maxItems != null) 'MaxItems': maxItems,
      if (marker != null) 'Marker': marker,
      if (creationToken != null) 'CreationToken': creationToken,
      if (fileSystemId != null) 'FileSystemId': fileSystemId,
    });
    return DescribeFileSystemsResponse.fromJson(response_);
  }

  /// Returns the current `LifecycleConfiguration` object for the specified
  /// Amazon EFS file system. EFS lifecycle management uses the
  /// `LifecycleConfiguration` object to identify which files to move to the EFS
  /// Infrequent Access (IA) storage class. For a file system without a
  /// `LifecycleConfiguration` object, the call returns an empty array in the
  /// response.
  ///
  /// This operation requires permissions for the
  /// `elasticfilesystem:DescribeLifecycleConfiguration` operation.
  ///
  /// [fileSystemId]: The ID of the file system whose `LifecycleConfiguration`
  /// object you want to retrieve (String).
  Future<LifecycleConfigurationDescription> describeLifecycleConfiguration(
      String fileSystemId) async {
    var response_ = await _client.send('DescribeLifecycleConfiguration', {
      'FileSystemId': fileSystemId,
    });
    return LifecycleConfigurationDescription.fromJson(response_);
  }

  /// Returns the security groups currently in effect for a mount target. This
  /// operation requires that the network interface of the mount target has been
  /// created and the lifecycle state of the mount target is not `deleted`.
  ///
  /// This operation requires permissions for the following actions:
  ///
  /// *    `elasticfilesystem:DescribeMountTargetSecurityGroups` action on the
  /// mount target's file system.
  ///
  /// *    `ec2:DescribeNetworkInterfaceAttribute` action on the mount target's
  /// network interface.
  ///
  /// [mountTargetId]: The ID of the mount target whose security groups you want
  /// to retrieve.
  Future<DescribeMountTargetSecurityGroupsResponse>
      describeMountTargetSecurityGroups(String mountTargetId) async {
    var response_ = await _client.send('DescribeMountTargetSecurityGroups', {
      'MountTargetId': mountTargetId,
    });
    return DescribeMountTargetSecurityGroupsResponse.fromJson(response_);
  }

  /// Returns the descriptions of all the current mount targets, or a specific
  /// mount target, for a file system. When requesting all of the current mount
  /// targets, the order of mount targets returned in the response is
  /// unspecified.
  ///
  /// This operation requires permissions for the
  /// `elasticfilesystem:DescribeMountTargets` action, on either the file system
  /// ID that you specify in `FileSystemId`, or on the file system of the mount
  /// target that you specify in `MountTargetId`.
  ///
  /// [maxItems]: (Optional) Maximum number of mount targets to return in the
  /// response. Currently, this number is automatically set to 10, and other
  /// values are ignored. The response is paginated at 10 per page if you have
  /// more than 10 mount targets.
  ///
  /// [marker]: (Optional) Opaque pagination token returned from a previous
  /// `DescribeMountTargets` operation (String). If present, it specifies to
  /// continue the list from where the previous returning call left off.
  ///
  /// [fileSystemId]: (Optional) ID of the file system whose mount targets you
  /// want to list (String). It must be included in your request if
  /// `MountTargetId` is not included.
  ///
  /// [mountTargetId]: (Optional) ID of the mount target that you want to have
  /// described (String). It must be included in your request if `FileSystemId`
  /// is not included.
  Future<DescribeMountTargetsResponse> describeMountTargets(
      {int maxItems,
      String marker,
      String fileSystemId,
      String mountTargetId}) async {
    var response_ = await _client.send('DescribeMountTargets', {
      if (maxItems != null) 'MaxItems': maxItems,
      if (marker != null) 'Marker': marker,
      if (fileSystemId != null) 'FileSystemId': fileSystemId,
      if (mountTargetId != null) 'MountTargetId': mountTargetId,
    });
    return DescribeMountTargetsResponse.fromJson(response_);
  }

  /// Returns the tags associated with a file system. The order of tags returned
  /// in the response of one `DescribeTags` call and the order of tags returned
  /// across the responses of a multiple-call iteration (when using pagination)
  /// is unspecified.
  ///
  ///  This operation requires permissions for the
  /// `elasticfilesystem:DescribeTags` action.
  ///
  /// [maxItems]: (Optional) The maximum number of file system tags to return in
  /// the response. Currently, this number is automatically set to 10, and other
  /// values are ignored. The response is paginated at 10 per page if you have
  /// more than 10 tags.
  ///
  /// [marker]: (Optional) An opaque pagination token returned from a previous
  /// `DescribeTags` operation (String). If present, it specifies to continue
  /// the list from where the previous call left off.
  ///
  /// [fileSystemId]: The ID of the file system whose tag set you want to
  /// retrieve.
  Future<DescribeTagsResponse> describeTags(String fileSystemId,
      {int maxItems, String marker}) async {
    var response_ = await _client.send('DescribeTags', {
      if (maxItems != null) 'MaxItems': maxItems,
      if (marker != null) 'Marker': marker,
      'FileSystemId': fileSystemId,
    });
    return DescribeTagsResponse.fromJson(response_);
  }

  /// Modifies the set of security groups in effect for a mount target.
  ///
  /// When you create a mount target, Amazon EFS also creates a new network
  /// interface. For more information, see CreateMountTarget. This operation
  /// replaces the security groups in effect for the network interface
  /// associated with a mount target, with the `SecurityGroups` provided in the
  /// request. This operation requires that the network interface of the mount
  /// target has been created and the lifecycle state of the mount target is not
  /// `deleted`.
  ///
  /// The operation requires permissions for the following actions:
  ///
  /// *    `elasticfilesystem:ModifyMountTargetSecurityGroups` action on the
  /// mount target's file system.
  ///
  /// *    `ec2:ModifyNetworkInterfaceAttribute` action on the mount target's
  /// network interface.
  ///
  /// [mountTargetId]: The ID of the mount target whose security groups you want
  /// to modify.
  ///
  /// [securityGroups]: An array of up to five VPC security group IDs.
  Future<void> modifyMountTargetSecurityGroups(String mountTargetId,
      {List<String> securityGroups}) async {
    await _client.send('ModifyMountTargetSecurityGroups', {
      'MountTargetId': mountTargetId,
      if (securityGroups != null) 'SecurityGroups': securityGroups,
    });
  }

  /// Enables lifecycle management by creating a new `LifecycleConfiguration`
  /// object. A `LifecycleConfiguration` object defines when files in an Amazon
  /// EFS file system are automatically transitioned to the lower-cost EFS
  /// Infrequent Access (IA) storage class. A `LifecycleConfiguration` applies
  /// to all files in a file system.
  ///
  /// Each Amazon EFS file system supports one lifecycle configuration, which
  /// applies to all files in the file system. If a `LifecycleConfiguration`
  /// object already exists for the specified file system, a
  /// `PutLifecycleConfiguration` call modifies the existing configuration. A
  /// `PutLifecycleConfiguration` call with an empty `LifecyclePolicies` array
  /// in the request body deletes any existing `LifecycleConfiguration` and
  /// disables lifecycle management.
  ///
  /// In the request, specify the following:
  ///
  /// *   The ID for the file system for which you are enabling, disabling, or
  /// modifying lifecycle management.
  ///
  /// *   A `LifecyclePolicies` array of `LifecyclePolicy` objects that define
  /// when files are moved to the IA storage class. The array can contain only
  /// one `LifecyclePolicy` item.
  ///
  ///
  /// This operation requires permissions for the
  /// `elasticfilesystem:PutLifecycleConfiguration` operation.
  ///
  /// To apply a `LifecycleConfiguration` object to an encrypted file system,
  /// you need the same AWS Key Management Service (AWS KMS) permissions as when
  /// you created the encrypted file system.
  ///
  /// [fileSystemId]: The ID of the file system for which you are creating the
  /// `LifecycleConfiguration` object (String).
  ///
  /// [lifecyclePolicies]: An array of `LifecyclePolicy` objects that define the
  /// file system's `LifecycleConfiguration` object. A `LifecycleConfiguration`
  /// object tells lifecycle management when to transition files from the
  /// Standard storage class to the Infrequent Access storage class.
  Future<LifecycleConfigurationDescription> putLifecycleConfiguration(
      {@required String fileSystemId,
      @required List<LifecyclePolicy> lifecyclePolicies}) async {
    var response_ = await _client.send('PutLifecycleConfiguration', {
      'FileSystemId': fileSystemId,
      'LifecyclePolicies': lifecyclePolicies,
    });
    return LifecycleConfigurationDescription.fromJson(response_);
  }

  /// Updates the throughput mode or the amount of provisioned throughput of an
  /// existing file system.
  ///
  /// [fileSystemId]: The ID of the file system that you want to update.
  ///
  /// [throughputMode]: (Optional) The throughput mode that you want your file
  /// system to use. If you're not updating your throughput mode, you don't need
  /// to provide this value in your request. If you are changing the
  /// `ThroughputMode` to `provisioned`, you must also set a value for
  /// `ProvisionedThroughputInMibps`.
  ///
  /// [provisionedThroughputInMibps]: (Optional) The amount of throughput, in
  /// MiB/s, that you want to provision for your file system. Valid values are
  /// 1-1024. Required if `ThroughputMode` is changed to `provisioned` on
  /// update. If you're not updating the amount of provisioned throughput for
  /// your file system, you don't need to provide this value in your request.
  Future<FileSystemDescription> updateFileSystem(String fileSystemId,
      {String throughputMode, double provisionedThroughputInMibps}) async {
    var response_ = await _client.send('UpdateFileSystem', {
      'FileSystemId': fileSystemId,
      if (throughputMode != null) 'ThroughputMode': throughputMode,
      if (provisionedThroughputInMibps != null)
        'ProvisionedThroughputInMibps': provisionedThroughputInMibps,
    });
    return FileSystemDescription.fromJson(response_);
  }
}

class DescribeFileSystemsResponse {
  /// Present if provided by caller in the request (String).
  final String marker;

  /// An array of file system descriptions.
  final List<FileSystemDescription> fileSystems;

  /// Present if there are more file systems than returned in the response
  /// (String). You can use the `NextMarker` in the subsequent request to fetch
  /// the descriptions.
  final String nextMarker;

  DescribeFileSystemsResponse({
    this.marker,
    this.fileSystems,
    this.nextMarker,
  });
  static DescribeFileSystemsResponse fromJson(Map<String, dynamic> json) =>
      DescribeFileSystemsResponse(
        marker: json.containsKey('Marker') ? json['Marker'] as String : null,
        fileSystems: json.containsKey('FileSystems')
            ? (json['FileSystems'] as List)
                .map((e) => FileSystemDescription.fromJson(e))
                .toList()
            : null,
        nextMarker: json.containsKey('NextMarker')
            ? json['NextMarker'] as String
            : null,
      );
}

class DescribeMountTargetSecurityGroupsResponse {
  /// An array of security groups.
  final List<String> securityGroups;

  DescribeMountTargetSecurityGroupsResponse({
    @required this.securityGroups,
  });
  static DescribeMountTargetSecurityGroupsResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeMountTargetSecurityGroupsResponse(
        securityGroups:
            (json['SecurityGroups'] as List).map((e) => e as String).toList(),
      );
}

class DescribeMountTargetsResponse {
  /// If the request included the `Marker`, the response returns that value in
  /// this field.
  final String marker;

  /// Returns the file system's mount targets as an array of
  /// `MountTargetDescription` objects.
  final List<MountTargetDescription> mountTargets;

  /// If a value is present, there are more mount targets to return. In a
  /// subsequent request, you can provide `Marker` in your request with this
  /// value to retrieve the next set of mount targets.
  final String nextMarker;

  DescribeMountTargetsResponse({
    this.marker,
    this.mountTargets,
    this.nextMarker,
  });
  static DescribeMountTargetsResponse fromJson(Map<String, dynamic> json) =>
      DescribeMountTargetsResponse(
        marker: json.containsKey('Marker') ? json['Marker'] as String : null,
        mountTargets: json.containsKey('MountTargets')
            ? (json['MountTargets'] as List)
                .map((e) => MountTargetDescription.fromJson(e))
                .toList()
            : null,
        nextMarker: json.containsKey('NextMarker')
            ? json['NextMarker'] as String
            : null,
      );
}

class DescribeTagsResponse {
  /// If the request included a `Marker`, the response returns that value in
  /// this field.
  final String marker;

  /// Returns tags associated with the file system as an array of `Tag` objects.
  final List<Tag> tags;

  /// If a value is present, there are more tags to return. In a subsequent
  /// request, you can provide the value of `NextMarker` as the value of the
  /// `Marker` parameter in your next request to retrieve the next set of tags.
  final String nextMarker;

  DescribeTagsResponse({
    this.marker,
    @required this.tags,
    this.nextMarker,
  });
  static DescribeTagsResponse fromJson(Map<String, dynamic> json) =>
      DescribeTagsResponse(
        marker: json.containsKey('Marker') ? json['Marker'] as String : null,
        tags: (json['Tags'] as List).map((e) => Tag.fromJson(e)).toList(),
        nextMarker: json.containsKey('NextMarker')
            ? json['NextMarker'] as String
            : null,
      );
}

/// A description of the file system.
class FileSystemDescription {
  /// The AWS account that created the file system. If the file system was
  /// created by an IAM user, the parent account to which the user belongs is
  /// the owner.
  final String ownerId;

  /// The opaque string specified in the request.
  final String creationToken;

  /// The ID of the file system, assigned by Amazon EFS.
  final String fileSystemId;

  /// The time that the file system was created, in seconds (since
  /// 1970-01-01T00:00:00Z).
  final DateTime creationTime;

  /// The lifecycle phase of the file system.
  final String lifeCycleState;

  /// You can add tags to a file system, including a `Name` tag. For more
  /// information, see CreateFileSystem. If the file system has a `Name` tag,
  /// Amazon EFS returns the value in this field.
  final String name;

  /// The current number of mount targets that the file system has. For more
  /// information, see CreateMountTarget.
  final int numberOfMountTargets;

  /// The latest known metered size (in bytes) of data stored in the file
  /// system, in its `Value` field, and the time at which that size was
  /// determined in its `Timestamp` field. The `Timestamp` value is the integer
  /// number of seconds since 1970-01-01T00:00:00Z. The `SizeInBytes` value
  /// doesn't represent the size of a consistent snapshot of the file system,
  /// but it is eventually consistent when there are no writes to the file
  /// system. That is, `SizeInBytes` represents actual size only if the file
  /// system is not modified for a period longer than a couple of hours.
  /// Otherwise, the value is not the exact size that the file system was at any
  /// point in time.
  final FileSystemSize sizeInBytes;

  /// The performance mode of the file system.
  final String performanceMode;

  /// A Boolean value that, if true, indicates that the file system is
  /// encrypted.
  final bool encrypted;

  /// The ID of an AWS Key Management Service (AWS KMS) customer master key
  /// (CMK) that was used to protect the encrypted file system.
  final String kmsKeyId;

  /// The throughput mode for a file system. There are two throughput modes to
  /// choose from for your file system: `bursting` and `provisioned`. If you set
  /// `ThroughputMode` to `provisioned`, you must also set a value for
  /// `ProvisionedThroughPutInMibps`. You can decrease your file system's
  /// throughput in Provisioned Throughput mode or change between the throughput
  /// modes as long as it’s been more than 24 hours since the last decrease or
  /// throughput mode change.
  final String throughputMode;

  /// The throughput, measured in MiB/s, that you want to provision for a file
  /// system. Valid values are 1-1024. Required if `ThroughputMode` is set to
  /// `provisioned`. The limit on throughput is 1024 MiB/s. You can get these
  /// limits increased by contacting AWS Support. For more information, see
  /// [Amazon EFS Limits That You Can Increase](https://docs.aws.amazon.com/efs/latest/ug/limits.html#soft-limits)
  /// in the _Amazon EFS User Guide._
  final double provisionedThroughputInMibps;

  /// The tags associated with the file system, presented as an array of `Tag`
  /// objects.
  final List<Tag> tags;

  FileSystemDescription({
    @required this.ownerId,
    @required this.creationToken,
    @required this.fileSystemId,
    @required this.creationTime,
    @required this.lifeCycleState,
    this.name,
    @required this.numberOfMountTargets,
    @required this.sizeInBytes,
    @required this.performanceMode,
    this.encrypted,
    this.kmsKeyId,
    this.throughputMode,
    this.provisionedThroughputInMibps,
    @required this.tags,
  });
  static FileSystemDescription fromJson(Map<String, dynamic> json) =>
      FileSystemDescription(
        ownerId: json['OwnerId'] as String,
        creationToken: json['CreationToken'] as String,
        fileSystemId: json['FileSystemId'] as String,
        creationTime: DateTime.parse(json['CreationTime']),
        lifeCycleState: json['LifeCycleState'] as String,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        numberOfMountTargets: json['NumberOfMountTargets'] as int,
        sizeInBytes: FileSystemSize.fromJson(json['SizeInBytes']),
        performanceMode: json['PerformanceMode'] as String,
        encrypted:
            json.containsKey('Encrypted') ? json['Encrypted'] as bool : null,
        kmsKeyId:
            json.containsKey('KmsKeyId') ? json['KmsKeyId'] as String : null,
        throughputMode: json.containsKey('ThroughputMode')
            ? json['ThroughputMode'] as String
            : null,
        provisionedThroughputInMibps:
            json.containsKey('ProvisionedThroughputInMibps')
                ? json['ProvisionedThroughputInMibps'] as double
                : null,
        tags: (json['Tags'] as List).map((e) => Tag.fromJson(e)).toList(),
      );
}

/// The latest known metered size (in bytes) of data stored in the file system,
/// in its `Value` field, and the time at which that size was determined in its
/// `Timestamp` field. The value doesn't represent the size of a consistent
/// snapshot of the file system, but it is eventually consistent when there are
/// no writes to the file system. That is, the value represents the actual size
/// only if the file system is not modified for a period longer than a couple of
/// hours. Otherwise, the value is not necessarily the exact size the file
/// system was at any instant in time.
class FileSystemSize {
  /// The latest known metered size (in bytes) of data stored in the file
  /// system.
  final BigInt value;

  /// The time at which the size of data, returned in the `Value` field, was
  /// determined. The value is the integer number of seconds since
  /// 1970-01-01T00:00:00Z.
  final DateTime timestamp;

  /// The latest known metered size (in bytes) of data stored in the Infrequent
  /// Access storage class.
  final BigInt valueInIA;

  /// The latest known metered size (in bytes) of data stored in the Standard
  /// storage class.
  final BigInt valueInStandard;

  FileSystemSize({
    @required this.value,
    this.timestamp,
    this.valueInIA,
    this.valueInStandard,
  });
  static FileSystemSize fromJson(Map<String, dynamic> json) => FileSystemSize(
        value: BigInt.from(json['Value']),
        timestamp: json.containsKey('Timestamp')
            ? DateTime.parse(json['Timestamp'])
            : null,
        valueInIA: json.containsKey('ValueInIA')
            ? BigInt.from(json['ValueInIA'])
            : null,
        valueInStandard: json.containsKey('ValueInStandard')
            ? BigInt.from(json['ValueInStandard'])
            : null,
      );
}

class LifecycleConfigurationDescription {
  /// An array of lifecycle management policies. Currently, EFS supports a
  /// maximum of one policy per file system.
  final List<LifecyclePolicy> lifecyclePolicies;

  LifecycleConfigurationDescription({
    this.lifecyclePolicies,
  });
  static LifecycleConfigurationDescription fromJson(
          Map<String, dynamic> json) =>
      LifecycleConfigurationDescription(
        lifecyclePolicies: json.containsKey('LifecyclePolicies')
            ? (json['LifecyclePolicies'] as List)
                .map((e) => LifecyclePolicy.fromJson(e))
                .toList()
            : null,
      );
}

/// Describes a policy used by EFS lifecycle management to transition files to
/// the Infrequent Access (IA) storage class.
class LifecyclePolicy {
  ///  A value that describes the period of time that a file is not accessed,
  /// after which it transitions to the IA storage class. Metadata operations
  /// such as listing the contents of a directory don't count as file access
  /// events.
  final String transitionToIA;

  LifecyclePolicy({
    this.transitionToIA,
  });
  static LifecyclePolicy fromJson(Map<String, dynamic> json) => LifecyclePolicy(
        transitionToIA: json.containsKey('TransitionToIA')
            ? json['TransitionToIA'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides a description of a mount target.
class MountTargetDescription {
  /// AWS account ID that owns the resource.
  final String ownerId;

  /// System-assigned mount target ID.
  final String mountTargetId;

  /// The ID of the file system for which the mount target is intended.
  final String fileSystemId;

  /// The ID of the mount target's subnet.
  final String subnetId;

  /// Lifecycle state of the mount target.
  final String lifeCycleState;

  /// Address at which the file system can be mounted by using the mount target.
  final String ipAddress;

  /// The ID of the network interface that Amazon EFS created when it created
  /// the mount target.
  final String networkInterfaceId;

  MountTargetDescription({
    this.ownerId,
    @required this.mountTargetId,
    @required this.fileSystemId,
    @required this.subnetId,
    @required this.lifeCycleState,
    this.ipAddress,
    this.networkInterfaceId,
  });
  static MountTargetDescription fromJson(Map<String, dynamic> json) =>
      MountTargetDescription(
        ownerId: json.containsKey('OwnerId') ? json['OwnerId'] as String : null,
        mountTargetId: json['MountTargetId'] as String,
        fileSystemId: json['FileSystemId'] as String,
        subnetId: json['SubnetId'] as String,
        lifeCycleState: json['LifeCycleState'] as String,
        ipAddress:
            json.containsKey('IpAddress') ? json['IpAddress'] as String : null,
        networkInterfaceId: json.containsKey('NetworkInterfaceId')
            ? json['NetworkInterfaceId'] as String
            : null,
      );
}

/// A tag is a key-value pair. Allowed characters are letters, white space, and
/// numbers that can be represented in UTF-8, and the following characters: `+ -
/// = . _ : /`
class Tag {
  /// The tag key (String). The key can't start with `aws:`.
  final String key;

  /// The value of the tag key.
  final String value;

  Tag({
    @required this.key,
    @required this.value,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag(
        key: json['Key'] as String,
        value: json['Value'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}
