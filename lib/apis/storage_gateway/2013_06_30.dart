import 'package:meta/meta.dart';

/// AWS Storage Gateway Service
///
/// AWS Storage Gateway is the service that connects an on-premises software
/// appliance with cloud-based storage to provide seamless and secure
/// integration between an organization's on-premises IT environment and the AWS
/// storage infrastructure. The service enables you to securely upload data to
/// the AWS cloud for cost effective backup and rapid disaster recovery.
///
/// Use the following links to get started using the _AWS Storage Gateway
/// Service API Reference_:
///
/// *
/// [AWS Storage Gateway Required Request Headers](https://docs.aws.amazon.com/storagegateway/latest/userguide/AWSStorageGatewayAPI.html#AWSStorageGatewayHTTPRequestsHeaders):
/// Describes the required headers that you must send with every POST request to
/// AWS Storage Gateway.
///
/// *
/// [Signing Requests](https://docs.aws.amazon.com/storagegateway/latest/userguide/AWSStorageGatewayAPI.html#AWSStorageGatewaySigningRequests):
/// AWS Storage Gateway requires that you authenticate every request you send;
/// this topic describes how sign such a request.
///
/// *
/// [Error Responses](https://docs.aws.amazon.com/storagegateway/latest/userguide/AWSStorageGatewayAPI.html#APIErrorResponses):
/// Provides reference information about AWS Storage Gateway errors.
///
/// *
/// [Operations in AWS Storage Gateway](https://docs.aws.amazon.com/storagegateway/latest/APIReference/API_Operations.html):
/// Contains detailed descriptions of all AWS Storage Gateway operations, their
/// request parameters, response elements, possible errors, and examples of
/// requests and responses.
///
/// *
/// [AWS Storage Gateway Regions and Endpoints:](http://docs.aws.amazon.com/general/latest/gr/rande.html#sg_region)
/// Provides a list of each AWS Region and the endpoints available for use with
/// AWS Storage Gateway.
///
///
///  AWS Storage Gateway resource IDs are in uppercase. When you use these
/// resource IDs with the Amazon EC2 API, EC2 expects resource IDs in lowercase.
/// You must change your resource ID to lowercase to use it with the EC2 API.
/// For example, in Storage Gateway the ID for a volume might be
/// `vol-AA22BB012345DAF670`. When you use this ID with the EC2 API, you must
/// change it to `vol-aa22bb012345daf670`. Otherwise, the EC2 API might not
/// behave as expected.
///
/// IDs for Storage Gateway volumes and Amazon EBS snapshots created from
/// gateway volumes are changing to a longer format. Starting in December 2016,
/// all new volumes and snapshots will be created with a 17-character string.
/// Starting in April 2016, you will be able to use these longer IDs so you can
/// test your systems with the new format. For more information, see
/// [Longer EC2 and EBS Resource IDs](https://aws.amazon.com/ec2/faqs/#longer-ids).
///
///  For example, a volume Amazon Resource Name (ARN) with the longer volume ID
/// format looks like the following:
///
///
/// `arn:aws:storagegateway:us-west-2:111122223333:gateway/sgw-12A3456B/volume/vol-1122AABBCCDDEEFFG`.
///
/// A snapshot ID with the longer ID format looks like the following:
/// `snap-78e226633445566ee`.
///
/// For more information, see
/// [Announcement: Heads-up – Longer AWS Storage Gateway volume and snapshot IDs coming in 2016](https://forums.aws.amazon.com/ann.jspa?annID=3557).
class StorageGatewayApi {
  final _client;
  StorageGatewayApi(client)
      : _client = client.configured('Storage Gateway', serializer: 'json');

  /// Activates the gateway you previously deployed on your host. In the
  /// activation process, you specify information such as the AWS Region that
  /// you want to use for storing snapshots or tapes, the time zone for
  /// scheduled snapshots the gateway snapshot schedule window, an activation
  /// key, and a name for your gateway. The activation process also associates
  /// your gateway with your account; for more information, see
  /// UpdateGatewayInformation.
  ///
  ///
  ///
  /// You must turn on the gateway VM before you can activate your gateway.
  ///
  /// [activationKey]: Your gateway activation key. You can obtain the
  /// activation key by sending an HTTP GET request with redirects enabled to
  /// the gateway IP address (port 80). The redirect URL returned in the
  /// response provides you the activation key for your gateway in the query
  /// string parameter `activationKey`. It may also include other
  /// activation-related parameters, however, these are merely defaults -- the
  /// arguments you pass to the `ActivateGateway` API call determine the actual
  /// configuration of your gateway.
  ///
  /// For more information, see
  /// https://docs.aws.amazon.com/storagegateway/latest/userguide/get-activation-key.html
  /// in the Storage Gateway User Guide.
  ///
  /// [gatewayName]: The name you configured for your gateway.
  ///
  /// [gatewayTimezone]: A value that indicates the time zone you want to set
  /// for the gateway. The time zone is of the format "GMT-hr:mm" or
  /// "GMT+hr:mm". For example, GMT-4:00 indicates the time is 4 hours behind
  /// GMT. GMT+2:00 indicates the time is 2 hours ahead of GMT. The time zone is
  /// used, for example, for scheduling snapshots and your gateway's maintenance
  /// schedule.
  ///
  /// [gatewayRegion]: A value that indicates the AWS Region where you want to
  /// store your data. The gateway AWS Region specified must be the same AWS
  /// Region as the AWS Region in your `Host` header in the request. For more
  /// information about available AWS Regions and endpoints for AWS Storage
  /// Gateway, see
  /// [Regions and Endpoints](https://docs.aws.amazon.com/general/latest/gr/rande.html#sg_region)
  /// in the _Amazon Web Services Glossary_.
  ///
  ///  Valid Values: See
  /// [AWS Storage Gateway Regions and Endpoints](https://docs.aws.amazon.com/general/latest/gr/rande.html#sg_region)
  /// in the AWS General Reference.
  ///
  /// [gatewayType]: A value that defines the type of gateway to activate. The
  /// type specified is critical to all later functions of the gateway and
  /// cannot be changed after activation. The default value is `CACHED`.
  ///
  ///  Valid Values: "STORED", "CACHED", "VTL", "FILE_S3"
  ///
  /// [tapeDriveType]: The value that indicates the type of tape drive to use
  /// for tape gateway. This field is optional.
  ///
  ///  Valid Values: "IBM-ULT3580-TD5"
  ///
  /// [mediumChangerType]: The value that indicates the type of medium changer
  /// to use for tape gateway. This field is optional.
  ///
  ///  Valid Values: "STK-L700", "AWS-Gateway-VTL"
  ///
  /// [tags]: A list of up to 50 tags that you can assign to the gateway. Each
  /// tag is a key-value pair.
  ///
  ///
  ///
  /// Valid characters for key and value are letters, spaces, and numbers that
  /// can be represented in UTF-8 format, and the following special characters:
  /// + - = . _ : / @. The maximum length of a tag's key is 128 characters, and
  /// the maximum length for a tag's value is 256 characters.
  Future<ActivateGatewayOutput> activateGateway(
      {@required String activationKey,
      @required String gatewayName,
      @required String gatewayTimezone,
      @required String gatewayRegion,
      String gatewayType,
      String tapeDriveType,
      String mediumChangerType,
      List<Tag> tags}) async {
    var response_ = await _client.send('ActivateGateway', {
      'ActivationKey': activationKey,
      'GatewayName': gatewayName,
      'GatewayTimezone': gatewayTimezone,
      'GatewayRegion': gatewayRegion,
      if (gatewayType != null) 'GatewayType': gatewayType,
      if (tapeDriveType != null) 'TapeDriveType': tapeDriveType,
      if (mediumChangerType != null) 'MediumChangerType': mediumChangerType,
      if (tags != null) 'Tags': tags,
    });
    return ActivateGatewayOutput.fromJson(response_);
  }

  /// Configures one or more gateway local disks as cache for a gateway. This
  /// operation is only supported in the cached volume, tape and file gateway
  /// type (see
  /// [Storage Gateway Concepts](https://docs.aws.amazon.com/storagegateway/latest/userguide/StorageGatewayConcepts.html)).
  ///
  /// In the request, you specify the gateway Amazon Resource Name (ARN) to
  /// which you want to add cache, and one or more disk IDs that you want to
  /// configure as cache.
  ///
  /// [diskIds]: An array of strings that identify disks that are to be
  /// configured as working storage. Each string have a minimum length of 1 and
  /// maximum length of 300. You can get the disk IDs from the ListLocalDisks
  /// API.
  Future<AddCacheOutput> addCache(
      {@required String gatewayArn, @required List<String> diskIds}) async {
    var response_ = await _client.send('AddCache', {
      'GatewayARN': gatewayArn,
      'DiskIds': diskIds,
    });
    return AddCacheOutput.fromJson(response_);
  }

  /// Adds one or more tags to the specified resource. You use tags to add
  /// metadata to resources, which you can use to categorize these resources.
  /// For example, you can categorize resources by purpose, owner, environment,
  /// or team. Each tag consists of a key and a value, which you define. You can
  /// add tags to the following AWS Storage Gateway resources:
  ///
  /// *   Storage gateways of all types
  ///
  /// *   Storage volumes
  ///
  /// *   Virtual tapes
  ///
  /// *   NFS and SMB file shares
  ///
  ///
  /// You can create a maximum of 50 tags for each resource. Virtual tapes and
  /// storage volumes that are recovered to a new gateway maintain their tags.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the resource you want to
  /// add tags to.
  ///
  /// [tags]: The key-value pair that represents the tag you want to add to the
  /// resource. The value can be an empty string.
  ///
  ///
  ///
  /// Valid characters for key and value are letters, spaces, and numbers
  /// representable in UTF-8 format, and the following special characters: + - =
  /// . _ : / @. The maximum length of a tag's key is 128 characters, and the
  /// maximum length for a tag's value is 256.
  Future<AddTagsToResourceOutput> addTagsToResource(
      {@required String resourceArn, @required List<Tag> tags}) async {
    var response_ = await _client.send('AddTagsToResource', {
      'ResourceARN': resourceArn,
      'Tags': tags,
    });
    return AddTagsToResourceOutput.fromJson(response_);
  }

  /// Configures one or more gateway local disks as upload buffer for a
  /// specified gateway. This operation is supported for the stored volume,
  /// cached volume and tape gateway types.
  ///
  /// In the request, you specify the gateway Amazon Resource Name (ARN) to
  /// which you want to add upload buffer, and one or more disk IDs that you
  /// want to configure as upload buffer.
  ///
  /// [diskIds]: An array of strings that identify disks that are to be
  /// configured as working storage. Each string have a minimum length of 1 and
  /// maximum length of 300. You can get the disk IDs from the ListLocalDisks
  /// API.
  Future<AddUploadBufferOutput> addUploadBuffer(
      {@required String gatewayArn, @required List<String> diskIds}) async {
    var response_ = await _client.send('AddUploadBuffer', {
      'GatewayARN': gatewayArn,
      'DiskIds': diskIds,
    });
    return AddUploadBufferOutput.fromJson(response_);
  }

  /// Configures one or more gateway local disks as working storage for a
  /// gateway. This operation is only supported in the stored volume gateway
  /// type. This operation is deprecated in cached volume API version 20120630.
  /// Use AddUploadBuffer instead.
  ///
  ///  Working storage is also referred to as upload buffer. You can also use
  /// the AddUploadBuffer operation to add upload buffer to a stored volume
  /// gateway.
  ///
  /// In the request, you specify the gateway Amazon Resource Name (ARN) to
  /// which you want to add working storage, and one or more disk IDs that you
  /// want to configure as working storage.
  ///
  /// [diskIds]: An array of strings that identify disks that are to be
  /// configured as working storage. Each string have a minimum length of 1 and
  /// maximum length of 300. You can get the disk IDs from the ListLocalDisks
  /// API.
  Future<AddWorkingStorageOutput> addWorkingStorage(
      {@required String gatewayArn, @required List<String> diskIds}) async {
    var response_ = await _client.send('AddWorkingStorage', {
      'GatewayARN': gatewayArn,
      'DiskIds': diskIds,
    });
    return AddWorkingStorageOutput.fromJson(response_);
  }

  /// Assigns a tape to a tape pool for archiving. The tape assigned to a pool
  /// is archived in the S3 storage class that is associated with the pool. When
  /// you use your backup application to eject the tape, the tape is archived
  /// directly into the S3 storage class (Glacier or Deep Archive) that
  /// corresponds to the pool.
  ///
  /// Valid values: "GLACIER", "DEEP_ARCHIVE"
  ///
  /// [tapeArn]: The unique Amazon Resource Name (ARN) of the virtual tape that
  /// you want to add to the tape pool.
  ///
  /// [poolId]: The ID of the pool that you want to add your tape to for
  /// archiving. The tape in this pool is archived in the S3 storage class that
  /// is associated with the pool. When you use your backup application to eject
  /// the tape, the tape is archived directly into the storage class (Glacier or
  /// Deep Archive) that corresponds to the pool.
  ///
  /// Valid values: "GLACIER", "DEEP_ARCHIVE"
  Future<AssignTapePoolOutput> assignTapePool(
      {@required String tapeArn, @required String poolId}) async {
    var response_ = await _client.send('AssignTapePool', {
      'TapeARN': tapeArn,
      'PoolId': poolId,
    });
    return AssignTapePoolOutput.fromJson(response_);
  }

  /// Connects a volume to an iSCSI connection and then attaches the volume to
  /// the specified gateway. Detaching and attaching a volume enables you to
  /// recover your data from one gateway to a different gateway without creating
  /// a snapshot. It also makes it easier to move your volumes from an
  /// on-premises gateway to a gateway hosted on an Amazon EC2 instance.
  ///
  /// [gatewayArn]: The Amazon Resource Name (ARN) of the gateway that you want
  /// to attach the volume to.
  ///
  /// [targetName]: The name of the iSCSI target used by an initiator to connect
  /// to a volume and used as a suffix for the target ARN. For example,
  /// specifying `TargetName` as _myvolume_ results in the target ARN of
  /// `arn:aws:storagegateway:us-east-2:111122223333:gateway/sgw-12A3456B/target/iqn.1997-05.com.amazon:myvolume`.
  /// The target name must be unique across all volumes on a gateway.
  ///
  /// If you don't specify a value, Storage Gateway uses the value that was
  /// previously used for this volume as the new target name.
  ///
  /// [volumeArn]: The Amazon Resource Name (ARN) of the volume to attach to the
  /// specified gateway.
  ///
  /// [networkInterfaceId]: The network interface of the gateway on which to
  /// expose the iSCSI target. Only IPv4 addresses are accepted. Use
  /// DescribeGatewayInformation to get a list of the network interfaces
  /// available on a gateway.
  ///
  ///  Valid Values: A valid IP address.
  ///
  /// [diskId]: The unique device ID or other distinguishing data that
  /// identifies the local disk used to create the volume. This value is only
  /// required when you are attaching a stored volume.
  Future<AttachVolumeOutput> attachVolume(
      {@required String gatewayArn,
      String targetName,
      @required String volumeArn,
      @required String networkInterfaceId,
      String diskId}) async {
    var response_ = await _client.send('AttachVolume', {
      'GatewayARN': gatewayArn,
      if (targetName != null) 'TargetName': targetName,
      'VolumeARN': volumeArn,
      'NetworkInterfaceId': networkInterfaceId,
      if (diskId != null) 'DiskId': diskId,
    });
    return AttachVolumeOutput.fromJson(response_);
  }

  /// Cancels archiving of a virtual tape to the virtual tape shelf (VTS) after
  /// the archiving process is initiated. This operation is only supported in
  /// the tape gateway type.
  ///
  /// [tapeArn]: The Amazon Resource Name (ARN) of the virtual tape you want to
  /// cancel archiving for.
  Future<CancelArchivalOutput> cancelArchival(
      {@required String gatewayArn, @required String tapeArn}) async {
    var response_ = await _client.send('CancelArchival', {
      'GatewayARN': gatewayArn,
      'TapeARN': tapeArn,
    });
    return CancelArchivalOutput.fromJson(response_);
  }

  /// Cancels retrieval of a virtual tape from the virtual tape shelf (VTS) to a
  /// gateway after the retrieval process is initiated. The virtual tape is
  /// returned to the VTS. This operation is only supported in the tape gateway
  /// type.
  ///
  /// [tapeArn]: The Amazon Resource Name (ARN) of the virtual tape you want to
  /// cancel retrieval for.
  Future<CancelRetrievalOutput> cancelRetrieval(
      {@required String gatewayArn, @required String tapeArn}) async {
    var response_ = await _client.send('CancelRetrieval', {
      'GatewayARN': gatewayArn,
      'TapeARN': tapeArn,
    });
    return CancelRetrievalOutput.fromJson(response_);
  }

  /// Creates a cached volume on a specified cached volume gateway. This
  /// operation is only supported in the cached volume gateway type.
  ///
  ///  Cache storage must be allocated to the gateway before you can create a
  /// cached volume. Use the AddCache operation to add cache storage to a
  /// gateway.
  ///
  /// In the request, you must specify the gateway, size of the volume in bytes,
  /// the iSCSI target name, an IP address on which to expose the target, and a
  /// unique client token. In response, the gateway creates the volume and
  /// returns information about it. This information includes the volume Amazon
  /// Resource Name (ARN), its size, and the iSCSI target ARN that initiators
  /// can use to connect to the volume target.
  ///
  /// Optionally, you can provide the ARN for an existing volume as the
  /// `SourceVolumeARN` for this cached volume, which creates an exact copy of
  /// the existing volume’s latest recovery point. The `VolumeSizeInBytes` value
  /// must be equal to or larger than the size of the copied volume, in bytes.
  ///
  /// [volumeSizeInBytes]: The size of the volume in bytes.
  ///
  /// [snapshotId]: The snapshot ID (e.g. "snap-1122aabb") of the snapshot to
  /// restore as the new cached volume. Specify this field if you want to create
  /// the iSCSI storage volume from a snapshot otherwise do not include this
  /// field. To list snapshots for your account use
  /// [DescribeSnapshots](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/ApiReference-query-DescribeSnapshots.html)
  /// in the _Amazon Elastic Compute Cloud API Reference_.
  ///
  /// [targetName]: The name of the iSCSI target used by an initiator to connect
  /// to a volume and used as a suffix for the target ARN. For example,
  /// specifying `TargetName` as _myvolume_ results in the target ARN of
  /// `arn:aws:storagegateway:us-east-2:111122223333:gateway/sgw-12A3456B/target/iqn.1997-05.com.amazon:myvolume`.
  /// The target name must be unique across all volumes on a gateway.
  ///
  /// If you don't specify a value, Storage Gateway uses the value that was
  /// previously used for this volume as the new target name.
  ///
  /// [sourceVolumeArn]: The ARN for an existing volume. Specifying this ARN
  /// makes the new volume into an exact copy of the specified existing volume's
  /// latest recovery point. The `VolumeSizeInBytes` value for this new volume
  /// must be equal to or larger than the size of the existing volume, in bytes.
  ///
  /// [networkInterfaceId]: The network interface of the gateway on which to
  /// expose the iSCSI target. Only IPv4 addresses are accepted. Use
  /// DescribeGatewayInformation to get a list of the network interfaces
  /// available on a gateway.
  ///
  ///  Valid Values: A valid IP address.
  ///
  /// [clientToken]: A unique identifier that you use to retry a request. If you
  /// retry a request, use the same `ClientToken` you specified in the initial
  /// request.
  ///
  /// [kmsEncrypted]: True to use Amazon S3 server side encryption with your own
  /// AWS KMS key, or false to use a key managed by Amazon S3. Optional.
  ///
  /// [kmsKey]: The Amazon Resource Name (ARN) of the AWS KMS key used for
  /// Amazon S3 server side encryption. This value can only be set when
  /// KMSEncrypted is true. Optional.
  ///
  /// [tags]: A list of up to 50 tags that you can assign to a cached volume.
  /// Each tag is a key-value pair.
  ///
  ///
  ///
  /// Valid characters for key and value are letters, spaces, and numbers that
  /// you can represent in UTF-8 format, and the following special characters: +
  /// - = . _ : / @. The maximum length of a tag's key is 128 characters, and
  /// the maximum length for a tag's value is 256 characters.
  Future<CreateCachediScsiVolumeOutput> createCachediScsiVolume(
      {@required String gatewayArn,
      @required BigInt volumeSizeInBytes,
      String snapshotId,
      @required String targetName,
      String sourceVolumeArn,
      @required String networkInterfaceId,
      @required String clientToken,
      bool kmsEncrypted,
      String kmsKey,
      List<Tag> tags}) async {
    var response_ = await _client.send('CreateCachediSCSIVolume', {
      'GatewayARN': gatewayArn,
      'VolumeSizeInBytes': volumeSizeInBytes,
      if (snapshotId != null) 'SnapshotId': snapshotId,
      'TargetName': targetName,
      if (sourceVolumeArn != null) 'SourceVolumeARN': sourceVolumeArn,
      'NetworkInterfaceId': networkInterfaceId,
      'ClientToken': clientToken,
      if (kmsEncrypted != null) 'KMSEncrypted': kmsEncrypted,
      if (kmsKey != null) 'KMSKey': kmsKey,
      if (tags != null) 'Tags': tags,
    });
    return CreateCachediScsiVolumeOutput.fromJson(response_);
  }

  /// Creates a Network File System (NFS) file share on an existing file
  /// gateway. In Storage Gateway, a file share is a file system mount point
  /// backed by Amazon S3 cloud storage. Storage Gateway exposes file shares
  /// using a NFS interface. This operation is only supported for file gateways.
  ///
  ///
  ///
  /// File gateway requires AWS Security Token Service (AWS STS) to be activated
  /// to enable you create a file share. Make sure AWS STS is activated in the
  /// AWS Region you are creating your file gateway in. If AWS STS is not
  /// activated in the AWS Region, activate it. For information about how to
  /// activate AWS STS, see Activating and Deactivating AWS STS in an AWS Region
  /// in the AWS Identity and Access Management User Guide.
  ///
  /// File gateway does not support creating hard or symbolic links on a file
  /// share.
  ///
  /// [clientToken]: A unique string value that you supply that is used by file
  /// gateway to ensure idempotent file share creation.
  ///
  /// [nfsFileShareDefaults]: File share default values. Optional.
  ///
  /// [gatewayArn]: The Amazon Resource Name (ARN) of the file gateway on which
  /// you want to create a file share.
  ///
  /// [kmsEncrypted]: True to use Amazon S3 server side encryption with your own
  /// AWS KMS key, or false to use a key managed by Amazon S3. Optional.
  ///
  /// [kmsKey]: The Amazon Resource Name (ARN) AWS KMS key used for Amazon S3
  /// server side encryption. This value can only be set when KMSEncrypted is
  /// true. Optional.
  ///
  /// [role]: The ARN of the AWS Identity and Access Management (IAM) role that
  /// a file gateway assumes when it accesses the underlying storage.
  ///
  /// [locationArn]: The ARN of the backed storage used for storing file data.
  ///
  /// [defaultStorageClass]: The default storage class for objects put into an
  /// Amazon S3 bucket by the file gateway. Possible values are `S3_STANDARD`,
  /// `S3_STANDARD_IA`, or `S3_ONEZONE_IA`. If this field is not populated, the
  /// default value `S3_STANDARD` is used. Optional.
  ///
  /// [objectAcl]: A value that sets the access control list permission for
  /// objects in the S3 bucket that a file gateway puts objects into. The
  /// default value is "private".
  ///
  /// [clientList]: The list of clients that are allowed to access the file
  /// gateway. The list must contain either valid IP addresses or valid CIDR
  /// blocks.
  ///
  /// [squash]: A value that maps a user to anonymous user. Valid options are
  /// the following:
  ///
  /// *    `RootSquash` - Only root is mapped to anonymous user.
  ///
  /// *    `NoSquash` - No one is mapped to anonymous user
  ///
  /// *    `AllSquash` - Everyone is mapped to anonymous user.
  ///
  /// [readOnly]: A value that sets the write status of a file share. This value
  /// is true if the write status is read-only, and otherwise false.
  ///
  /// [guessMimeTypeEnabled]: A value that enables guessing of the MIME type for
  /// uploaded objects based on file extensions. Set this value to true to
  /// enable MIME type guessing, and otherwise to false. The default value is
  /// true.
  ///
  /// [requesterPays]: A value that sets who pays the cost of the request and
  /// the cost associated with data download from the S3 bucket. If this value
  /// is set to true, the requester pays the costs. Otherwise the S3 bucket
  /// owner pays. However, the S3 bucket owner always pays the cost of storing
  /// data.
  ///
  ///   `RequesterPays` is a configuration for the S3 bucket that backs the file
  /// share, so make sure that the configuration on the file share is the same
  /// as the S3 bucket configuration.
  ///
  /// [tags]: A list of up to 50 tags that can be assigned to the NFS file
  /// share. Each tag is a key-value pair.
  ///
  ///
  ///
  /// Valid characters for key and value are letters, spaces, and numbers
  /// representable in UTF-8 format, and the following special characters: + - =
  /// . _ : / @. The maximum length of a tag's key is 128 characters, and the
  /// maximum length for a tag's value is 256.
  Future<CreateNfsFileShareOutput> createNfsFileShare(
      {@required String clientToken,
      NfsFileShareDefaults nfsFileShareDefaults,
      @required String gatewayArn,
      bool kmsEncrypted,
      String kmsKey,
      @required String role,
      @required String locationArn,
      String defaultStorageClass,
      String objectAcl,
      List<String> clientList,
      String squash,
      bool readOnly,
      bool guessMimeTypeEnabled,
      bool requesterPays,
      List<Tag> tags}) async {
    var response_ = await _client.send('CreateNFSFileShare', {
      'ClientToken': clientToken,
      if (nfsFileShareDefaults != null)
        'NFSFileShareDefaults': nfsFileShareDefaults,
      'GatewayARN': gatewayArn,
      if (kmsEncrypted != null) 'KMSEncrypted': kmsEncrypted,
      if (kmsKey != null) 'KMSKey': kmsKey,
      'Role': role,
      'LocationARN': locationArn,
      if (defaultStorageClass != null)
        'DefaultStorageClass': defaultStorageClass,
      if (objectAcl != null) 'ObjectACL': objectAcl,
      if (clientList != null) 'ClientList': clientList,
      if (squash != null) 'Squash': squash,
      if (readOnly != null) 'ReadOnly': readOnly,
      if (guessMimeTypeEnabled != null)
        'GuessMIMETypeEnabled': guessMimeTypeEnabled,
      if (requesterPays != null) 'RequesterPays': requesterPays,
      if (tags != null) 'Tags': tags,
    });
    return CreateNfsFileShareOutput.fromJson(response_);
  }

  /// Creates a Server Message Block (SMB) file share on an existing file
  /// gateway. In Storage Gateway, a file share is a file system mount point
  /// backed by Amazon S3 cloud storage. Storage Gateway expose file shares
  /// using a SMB interface. This operation is only supported for file gateways.
  ///
  ///
  ///
  /// File gateways require AWS Security Token Service (AWS STS) to be activated
  /// to enable you to create a file share. Make sure that AWS STS is activated
  /// in the AWS Region you are creating your file gateway in. If AWS STS is not
  /// activated in this AWS Region, activate it. For information about how to
  /// activate AWS STS, see
  /// [Activating and Deactivating AWS STS in an AWS Region](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_enable-regions.html)
  /// in the _AWS Identity and Access Management User Guide._
  ///
  /// File gateways don't support creating hard or symbolic links on a file
  /// share.
  ///
  /// [clientToken]: A unique string value that you supply that is used by file
  /// gateway to ensure idempotent file share creation.
  ///
  /// [gatewayArn]: The Amazon Resource Name (ARN) of the file gateway on which
  /// you want to create a file share.
  ///
  /// [kmsEncrypted]: True to use Amazon S3 server side encryption with your own
  /// AWS KMS key, or false to use a key managed by Amazon S3. Optional.
  ///
  /// [kmsKey]: The Amazon Resource Name (ARN) of the AWS KMS key used for
  /// Amazon S3 server side encryption. This value can only be set when
  /// KMSEncrypted is true. Optional.
  ///
  /// [role]: The ARN of the AWS Identity and Access Management (IAM) role that
  /// a file gateway assumes when it accesses the underlying storage.
  ///
  /// [locationArn]: The ARN of the backed storage used for storing file data.
  ///
  /// [defaultStorageClass]: The default storage class for objects put into an
  /// Amazon S3 bucket by the file gateway. Possible values are `S3_STANDARD`,
  /// `S3_STANDARD_IA`, or `S3_ONEZONE_IA`. If this field is not populated, the
  /// default value `S3_STANDARD` is used. Optional.
  ///
  /// [objectAcl]: A value that sets the access control list permission for
  /// objects in the S3 bucket that a file gateway puts objects into. The
  /// default value is "private".
  ///
  /// [readOnly]: A value that sets the write status of a file share. This value
  /// is true if the write status is read-only, and otherwise false.
  ///
  /// [guessMimeTypeEnabled]: A value that enables guessing of the MIME type for
  /// uploaded objects based on file extensions. Set this value to true to
  /// enable MIME type guessing, and otherwise to false. The default value is
  /// true.
  ///
  /// [requesterPays]: A value that sets who pays the cost of the request and
  /// the cost associated with data download from the S3 bucket. If this value
  /// is set to true, the requester pays the costs. Otherwise the S3 bucket
  /// owner pays. However, the S3 bucket owner always pays the cost of storing
  /// data.
  ///
  ///   `RequesterPays` is a configuration for the S3 bucket that backs the file
  /// share, so make sure that the configuration on the file share is the same
  /// as the S3 bucket configuration.
  ///
  /// [smbaclEnabled]: Set this value to "true to enable ACL (access control
  /// list) on the SMB file share. Set it to "false" to map file and directory
  /// permissions to the POSIX permissions.
  ///
  /// For more information, see
  /// https://docs.aws.amazon.com/storagegateway/latest/userguide/smb-acl.html
  /// in the Storage Gateway User Guide.
  ///
  /// [adminUserList]: A list of users in the Active Directory that will be
  /// granted administrator privileges on the file share. These users can do all
  /// file operations as the super-user.
  ///
  ///
  ///
  /// Use this option very carefully, because any user in this list can do
  /// anything they like on the file share, regardless of file permissions.
  ///
  /// [validUserList]: A list of users or groups in the Active Directory that
  /// are allowed to access the file share. A group must be prefixed with the @
  /// character. For example `@group1`. Can only be set if Authentication is set
  /// to `ActiveDirectory`.
  ///
  /// [invalidUserList]: A list of users or groups in the Active Directory that
  /// are not allowed to access the file share. A group must be prefixed with
  /// the @ character. For example `@group1`. Can only be set if Authentication
  /// is set to `ActiveDirectory`.
  ///
  /// [authentication]: The authentication method that users use to access the
  /// file share.
  ///
  /// Valid values are `ActiveDirectory` or `GuestAccess`. The default is
  /// `ActiveDirectory`.
  ///
  /// [tags]: A list of up to 50 tags that can be assigned to the NFS file
  /// share. Each tag is a key-value pair.
  ///
  ///
  ///
  /// Valid characters for key and value are letters, spaces, and numbers
  /// representable in UTF-8 format, and the following special characters: + - =
  /// . _ : / @. The maximum length of a tag's key is 128 characters, and the
  /// maximum length for a tag's value is 256.
  Future<CreateSmbFileShareOutput> createSmbFileShare(
      {@required String clientToken,
      @required String gatewayArn,
      bool kmsEncrypted,
      String kmsKey,
      @required String role,
      @required String locationArn,
      String defaultStorageClass,
      String objectAcl,
      bool readOnly,
      bool guessMimeTypeEnabled,
      bool requesterPays,
      bool smbaclEnabled,
      List<String> adminUserList,
      List<String> validUserList,
      List<String> invalidUserList,
      String authentication,
      List<Tag> tags}) async {
    var response_ = await _client.send('CreateSMBFileShare', {
      'ClientToken': clientToken,
      'GatewayARN': gatewayArn,
      if (kmsEncrypted != null) 'KMSEncrypted': kmsEncrypted,
      if (kmsKey != null) 'KMSKey': kmsKey,
      'Role': role,
      'LocationARN': locationArn,
      if (defaultStorageClass != null)
        'DefaultStorageClass': defaultStorageClass,
      if (objectAcl != null) 'ObjectACL': objectAcl,
      if (readOnly != null) 'ReadOnly': readOnly,
      if (guessMimeTypeEnabled != null)
        'GuessMIMETypeEnabled': guessMimeTypeEnabled,
      if (requesterPays != null) 'RequesterPays': requesterPays,
      if (smbaclEnabled != null) 'SMBACLEnabled': smbaclEnabled,
      if (adminUserList != null) 'AdminUserList': adminUserList,
      if (validUserList != null) 'ValidUserList': validUserList,
      if (invalidUserList != null) 'InvalidUserList': invalidUserList,
      if (authentication != null) 'Authentication': authentication,
      if (tags != null) 'Tags': tags,
    });
    return CreateSmbFileShareOutput.fromJson(response_);
  }

  /// Initiates a snapshot of a volume.
  ///
  /// AWS Storage Gateway provides the ability to back up point-in-time
  /// snapshots of your data to Amazon Simple Storage (S3) for durable off-site
  /// recovery, as well as import the data to an Amazon Elastic Block Store
  /// (EBS) volume in Amazon Elastic Compute Cloud (EC2). You can take snapshots
  /// of your gateway volume on a scheduled or ad hoc basis. This API enables
  /// you to take ad-hoc snapshot. For more information, see
  /// [Editing a Snapshot Schedule](https://docs.aws.amazon.com/storagegateway/latest/userguide/managing-volumes.html#SchedulingSnapshot).
  ///
  /// In the CreateSnapshot request you identify the volume by providing its
  /// Amazon Resource Name (ARN). You must also provide description for the
  /// snapshot. When AWS Storage Gateway takes the snapshot of specified volume,
  /// the snapshot and description appears in the AWS Storage Gateway Console.
  /// In response, AWS Storage Gateway returns you a snapshot ID. You can use
  /// this snapshot ID to check the snapshot progress or later use it when you
  /// want to create a volume from a snapshot. This operation is only supported
  /// in stored and cached volume gateway type.
  ///
  ///  To list or delete a snapshot, you must use the Amazon EC2 API. For more
  /// information, see DescribeSnapshots or DeleteSnapshot in the
  /// [EC2 API reference](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_Operations.html).
  ///
  ///
  /// Volume and snapshot IDs are changing to a longer length ID format. For
  /// more information, see the important note on the
  /// [Welcome](https://docs.aws.amazon.com/storagegateway/latest/APIReference/Welcome.html)
  /// page.
  ///
  /// [volumeArn]: The Amazon Resource Name (ARN) of the volume. Use the
  /// ListVolumes operation to return a list of gateway volumes.
  ///
  /// [snapshotDescription]: Textual description of the snapshot that appears in
  /// the Amazon EC2 console, Elastic Block Store snapshots panel in the
  /// **Description** field, and in the AWS Storage Gateway snapshot **Details**
  /// pane, **Description** field
  ///
  /// [tags]: A list of up to 50 tags that can be assigned to a snapshot. Each
  /// tag is a key-value pair.
  ///
  ///
  ///
  /// Valid characters for key and value are letters, spaces, and numbers
  /// representable in UTF-8 format, and the following special characters: + - =
  /// . _ : / @. The maximum length of a tag's key is 128 characters, and the
  /// maximum length for a tag's value is 256.
  Future<CreateSnapshotOutput> createSnapshot(
      {@required String volumeArn,
      @required String snapshotDescription,
      List<Tag> tags}) async {
    var response_ = await _client.send('CreateSnapshot', {
      'VolumeARN': volumeArn,
      'SnapshotDescription': snapshotDescription,
      if (tags != null) 'Tags': tags,
    });
    return CreateSnapshotOutput.fromJson(response_);
  }

  /// Initiates a snapshot of a gateway from a volume recovery point. This
  /// operation is only supported in the cached volume gateway type.
  ///
  /// A volume recovery point is a point in time at which all data of the volume
  /// is consistent and from which you can create a snapshot. To get a list of
  /// volume recovery point for cached volume gateway, use
  /// ListVolumeRecoveryPoints.
  ///
  /// In the `CreateSnapshotFromVolumeRecoveryPoint` request, you identify the
  /// volume by providing its Amazon Resource Name (ARN). You must also provide
  /// a description for the snapshot. When the gateway takes a snapshot of the
  /// specified volume, the snapshot and its description appear in the AWS
  /// Storage Gateway console. In response, the gateway returns you a snapshot
  /// ID. You can use this snapshot ID to check the snapshot progress or later
  /// use it when you want to create a volume from a snapshot.
  ///
  ///
  ///
  /// To list or delete a snapshot, you must use the Amazon EC2 API. For more
  /// information, in _Amazon Elastic Compute Cloud API Reference_.
  ///
  /// [volumeArn]: The Amazon Resource Name (ARN) of the iSCSI volume target.
  /// Use the DescribeStorediSCSIVolumes operation to return to retrieve the
  /// TargetARN for specified VolumeARN.
  ///
  /// [snapshotDescription]: Textual description of the snapshot that appears in
  /// the Amazon EC2 console, Elastic Block Store snapshots panel in the
  /// **Description** field, and in the AWS Storage Gateway snapshot **Details**
  /// pane, **Description** field
  ///
  /// [tags]: A list of up to 50 tags that can be assigned to a snapshot. Each
  /// tag is a key-value pair.
  ///
  ///
  ///
  /// Valid characters for key and value are letters, spaces, and numbers
  /// representable in UTF-8 format, and the following special characters: + - =
  /// . _ : / @. The maximum length of a tag's key is 128 characters, and the
  /// maximum length for a tag's value is 256.
  Future<CreateSnapshotFromVolumeRecoveryPointOutput>
      createSnapshotFromVolumeRecoveryPoint(
          {@required String volumeArn,
          @required String snapshotDescription,
          List<Tag> tags}) async {
    var response_ =
        await _client.send('CreateSnapshotFromVolumeRecoveryPoint', {
      'VolumeARN': volumeArn,
      'SnapshotDescription': snapshotDescription,
      if (tags != null) 'Tags': tags,
    });
    return CreateSnapshotFromVolumeRecoveryPointOutput.fromJson(response_);
  }

  /// Creates a volume on a specified gateway. This operation is only supported
  /// in the stored volume gateway type.
  ///
  /// The size of the volume to create is inferred from the disk size. You can
  /// choose to preserve existing data on the disk, create volume from an
  /// existing snapshot, or create an empty volume. If you choose to create an
  /// empty gateway volume, then any existing data on the disk is erased.
  ///
  /// In the request you must specify the gateway and the disk information on
  /// which you are creating the volume. In response, the gateway creates the
  /// volume and returns volume information such as the volume Amazon Resource
  /// Name (ARN), its size, and the iSCSI target ARN that initiators can use to
  /// connect to the volume target.
  ///
  /// [diskId]: The unique identifier for the gateway local disk that is
  /// configured as a stored volume. Use
  /// [ListLocalDisks](https://docs.aws.amazon.com/storagegateway/latest/userguide/API_ListLocalDisks.html)
  /// to list disk IDs for a gateway.
  ///
  /// [snapshotId]: The snapshot ID (e.g. "snap-1122aabb") of the snapshot to
  /// restore as the new stored volume. Specify this field if you want to create
  /// the iSCSI storage volume from a snapshot otherwise do not include this
  /// field. To list snapshots for your account use
  /// [DescribeSnapshots](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/ApiReference-query-DescribeSnapshots.html)
  /// in the _Amazon Elastic Compute Cloud API Reference_.
  ///
  /// [preserveExistingData]: Specify this field as true if you want to preserve
  /// the data on the local disk. Otherwise, specifying this field as false
  /// creates an empty volume.
  ///
  ///  Valid Values: true, false
  ///
  /// [targetName]: The name of the iSCSI target used by an initiator to connect
  /// to a volume and used as a suffix for the target ARN. For example,
  /// specifying `TargetName` as _myvolume_ results in the target ARN of
  /// `arn:aws:storagegateway:us-east-2:111122223333:gateway/sgw-12A3456B/target/iqn.1997-05.com.amazon:myvolume`.
  /// The target name must be unique across all volumes on a gateway.
  ///
  /// If you don't specify a value, Storage Gateway uses the value that was
  /// previously used for this volume as the new target name.
  ///
  /// [networkInterfaceId]: The network interface of the gateway on which to
  /// expose the iSCSI target. Only IPv4 addresses are accepted. Use
  /// DescribeGatewayInformation to get a list of the network interfaces
  /// available on a gateway.
  ///
  ///  Valid Values: A valid IP address.
  ///
  /// [kmsEncrypted]: True to use Amazon S3 server side encryption with your own
  /// AWS KMS key, or false to use a key managed by Amazon S3. Optional.
  ///
  /// [kmsKey]: The Amazon Resource Name (ARN) of the KMS key used for Amazon S3
  /// server side encryption. This value can only be set when KMSEncrypted is
  /// true. Optional.
  ///
  /// [tags]: A list of up to 50 tags that can be assigned to a stored volume.
  /// Each tag is a key-value pair.
  ///
  ///
  ///
  /// Valid characters for key and value are letters, spaces, and numbers
  /// representable in UTF-8 format, and the following special characters: + - =
  /// . _ : / @. The maximum length of a tag's key is 128 characters, and the
  /// maximum length for a tag's value is 256.
  Future<CreateStorediScsiVolumeOutput> createStorediScsiVolume(
      {@required String gatewayArn,
      @required String diskId,
      String snapshotId,
      @required bool preserveExistingData,
      @required String targetName,
      @required String networkInterfaceId,
      bool kmsEncrypted,
      String kmsKey,
      List<Tag> tags}) async {
    var response_ = await _client.send('CreateStorediSCSIVolume', {
      'GatewayARN': gatewayArn,
      'DiskId': diskId,
      if (snapshotId != null) 'SnapshotId': snapshotId,
      'PreserveExistingData': preserveExistingData,
      'TargetName': targetName,
      'NetworkInterfaceId': networkInterfaceId,
      if (kmsEncrypted != null) 'KMSEncrypted': kmsEncrypted,
      if (kmsKey != null) 'KMSKey': kmsKey,
      if (tags != null) 'Tags': tags,
    });
    return CreateStorediScsiVolumeOutput.fromJson(response_);
  }

  /// Creates a virtual tape by using your own barcode. You write data to the
  /// virtual tape and then archive the tape. A barcode is unique and can not be
  /// reused if it has already been used on a tape . This applies to barcodes
  /// used on deleted tapes. This operation is only supported in the tape
  /// gateway type.
  ///
  ///
  ///
  /// Cache storage must be allocated to the gateway before you can create a
  /// virtual tape. Use the AddCache operation to add cache storage to a
  /// gateway.
  ///
  /// [gatewayArn]: The unique Amazon Resource Name (ARN) that represents the
  /// gateway to associate the virtual tape with. Use the ListGateways operation
  /// to return a list of gateways for your account and AWS Region.
  ///
  /// [tapeSizeInBytes]: The size, in bytes, of the virtual tape that you want
  /// to create.
  ///
  ///
  ///
  /// The size must be aligned by gigabyte (1024*1024*1024 byte).
  ///
  /// [tapeBarcode]: The barcode that you want to assign to the tape.
  ///
  ///
  ///
  /// Barcodes cannot be reused. This includes barcodes used for tapes that have
  /// been deleted.
  ///
  /// [kmsEncrypted]: True to use Amazon S3 server side encryption with your own
  /// AWS KMS key, or false to use a key managed by Amazon S3. Optional.
  ///
  /// [kmsKey]: The Amazon Resource Name (ARN) of the AWS KMS Key used for
  /// Amazon S3 server side encryption. This value can only be set when
  /// KMSEncrypted is true. Optional.
  ///
  /// [poolId]: The ID of the pool that you want to add your tape to for
  /// archiving. The tape in this pool is archived in the S3 storage class that
  /// is associated with the pool. When you use your backup application to eject
  /// the tape, the tape is archived directly into the storage class (Glacier or
  /// Deep Archive) that corresponds to the pool.
  ///
  /// Valid values: "GLACIER", "DEEP_ARCHIVE"
  ///
  /// [tags]: A list of up to 50 tags that can be assigned to a virtual tape
  /// that has a barcode. Each tag is a key-value pair.
  ///
  ///
  ///
  /// Valid characters for key and value are letters, spaces, and numbers
  /// representable in UTF-8 format, and the following special characters: + - =
  /// . _ : / @. The maximum length of a tag's key is 128 characters, and the
  /// maximum length for a tag's value is 256.
  Future<CreateTapeWithBarcodeOutput> createTapeWithBarcode(
      {@required String gatewayArn,
      @required BigInt tapeSizeInBytes,
      @required String tapeBarcode,
      bool kmsEncrypted,
      String kmsKey,
      String poolId,
      List<Tag> tags}) async {
    var response_ = await _client.send('CreateTapeWithBarcode', {
      'GatewayARN': gatewayArn,
      'TapeSizeInBytes': tapeSizeInBytes,
      'TapeBarcode': tapeBarcode,
      if (kmsEncrypted != null) 'KMSEncrypted': kmsEncrypted,
      if (kmsKey != null) 'KMSKey': kmsKey,
      if (poolId != null) 'PoolId': poolId,
      if (tags != null) 'Tags': tags,
    });
    return CreateTapeWithBarcodeOutput.fromJson(response_);
  }

  /// Creates one or more virtual tapes. You write data to the virtual tapes and
  /// then archive the tapes. This operation is only supported in the tape
  /// gateway type.
  ///
  ///
  ///
  /// Cache storage must be allocated to the gateway before you can create
  /// virtual tapes. Use the AddCache operation to add cache storage to a
  /// gateway.
  ///
  /// [gatewayArn]: The unique Amazon Resource Name (ARN) that represents the
  /// gateway to associate the virtual tapes with. Use the ListGateways
  /// operation to return a list of gateways for your account and AWS Region.
  ///
  /// [tapeSizeInBytes]: The size, in bytes, of the virtual tapes that you want
  /// to create.
  ///
  ///
  ///
  /// The size must be aligned by gigabyte (1024*1024*1024 byte).
  ///
  /// [clientToken]: A unique identifier that you use to retry a request. If you
  /// retry a request, use the same `ClientToken` you specified in the initial
  /// request.
  ///
  ///
  ///
  /// Using the same `ClientToken` prevents creating the tape multiple times.
  ///
  /// [numTapesToCreate]: The number of virtual tapes that you want to create.
  ///
  /// [tapeBarcodePrefix]: A prefix that you append to the barcode of the
  /// virtual tape you are creating. This prefix makes the barcode unique.
  ///
  ///
  ///
  /// The prefix must be 1 to 4 characters in length and must be one of the
  /// uppercase letters from A to Z.
  ///
  /// [kmsEncrypted]: True to use Amazon S3 server side encryption with your own
  /// AWS KMS key, or false to use a key managed by Amazon S3. Optional.
  ///
  /// [kmsKey]: The Amazon Resource Name (ARN) of the AWS KMS key used for
  /// Amazon S3 server side encryption. This value can only be set when
  /// KMSEncrypted is true. Optional.
  ///
  /// [poolId]: The ID of the pool that you want to add your tape to for
  /// archiving. The tape in this pool is archived in the S3 storage class that
  /// is associated with the pool. When you use your backup application to eject
  /// the tape, the tape is archived directly into the storage class (Glacier or
  /// Deep Archive) that corresponds to the pool.
  ///
  /// Valid values: "GLACIER", "DEEP_ARCHIVE"
  ///
  /// [tags]: A list of up to 50 tags that can be assigned to a virtual tape.
  /// Each tag is a key-value pair.
  ///
  ///
  ///
  /// Valid characters for key and value are letters, spaces, and numbers
  /// representable in UTF-8 format, and the following special characters: + - =
  /// . _ : / @. The maximum length of a tag's key is 128 characters, and the
  /// maximum length for a tag's value is 256.
  Future<CreateTapesOutput> createTapes(
      {@required String gatewayArn,
      @required BigInt tapeSizeInBytes,
      @required String clientToken,
      @required int numTapesToCreate,
      @required String tapeBarcodePrefix,
      bool kmsEncrypted,
      String kmsKey,
      String poolId,
      List<Tag> tags}) async {
    var response_ = await _client.send('CreateTapes', {
      'GatewayARN': gatewayArn,
      'TapeSizeInBytes': tapeSizeInBytes,
      'ClientToken': clientToken,
      'NumTapesToCreate': numTapesToCreate,
      'TapeBarcodePrefix': tapeBarcodePrefix,
      if (kmsEncrypted != null) 'KMSEncrypted': kmsEncrypted,
      if (kmsKey != null) 'KMSKey': kmsKey,
      if (poolId != null) 'PoolId': poolId,
      if (tags != null) 'Tags': tags,
    });
    return CreateTapesOutput.fromJson(response_);
  }

  /// Deletes the bandwidth rate limits of a gateway. You can delete either the
  /// upload and download bandwidth rate limit, or you can delete both. If you
  /// delete only one of the limits, the other limit remains unchanged. To
  /// specify which gateway to work with, use the Amazon Resource Name (ARN) of
  /// the gateway in your request.
  ///
  /// [bandwidthType]: One of the BandwidthType values that indicates the
  /// gateway bandwidth rate limit to delete.
  ///
  /// Valid Values: `Upload`, `Download`, `All`.
  Future<DeleteBandwidthRateLimitOutput> deleteBandwidthRateLimit(
      {@required String gatewayArn, @required String bandwidthType}) async {
    var response_ = await _client.send('DeleteBandwidthRateLimit', {
      'GatewayARN': gatewayArn,
      'BandwidthType': bandwidthType,
    });
    return DeleteBandwidthRateLimitOutput.fromJson(response_);
  }

  /// Deletes Challenge-Handshake Authentication Protocol (CHAP) credentials for
  /// a specified iSCSI target and initiator pair.
  ///
  /// [targetArn]: The Amazon Resource Name (ARN) of the iSCSI volume target.
  /// Use the DescribeStorediSCSIVolumes operation to return to retrieve the
  /// TargetARN for specified VolumeARN.
  ///
  /// [initiatorName]: The iSCSI initiator that connects to the target.
  Future<DeleteChapCredentialsOutput> deleteChapCredentials(
      {@required String targetArn, @required String initiatorName}) async {
    var response_ = await _client.send('DeleteChapCredentials', {
      'TargetARN': targetArn,
      'InitiatorName': initiatorName,
    });
    return DeleteChapCredentialsOutput.fromJson(response_);
  }

  /// Deletes a file share from a file gateway. This operation is only supported
  /// for file gateways.
  ///
  /// [fileShareArn]: The Amazon Resource Name (ARN) of the file share to be
  /// deleted.
  ///
  /// [forceDelete]: If this value is set to true, the operation deletes a file
  /// share immediately and aborts all data uploads to AWS. Otherwise, the file
  /// share is not deleted until all data is uploaded to AWS. This process
  /// aborts the data upload process, and the file share enters the
  /// FORCE_DELETING status.
  Future<DeleteFileShareOutput> deleteFileShare(String fileShareArn,
      {bool forceDelete}) async {
    var response_ = await _client.send('DeleteFileShare', {
      'FileShareARN': fileShareArn,
      if (forceDelete != null) 'ForceDelete': forceDelete,
    });
    return DeleteFileShareOutput.fromJson(response_);
  }

  /// Deletes a gateway. To specify which gateway to delete, use the Amazon
  /// Resource Name (ARN) of the gateway in your request. The operation deletes
  /// the gateway; however, it does not delete the gateway virtual machine (VM)
  /// from your host computer.
  ///
  /// After you delete a gateway, you cannot reactivate it. Completed snapshots
  /// of the gateway volumes are not deleted upon deleting the gateway, however,
  /// pending snapshots will not complete. After you delete a gateway, your next
  /// step is to remove it from your environment.
  ///
  ///
  ///
  /// You no longer pay software charges after the gateway is deleted; however,
  /// your existing Amazon EBS snapshots persist and you will continue to be
  /// billed for these snapshots. You can choose to remove all remaining Amazon
  /// EBS snapshots by canceling your Amazon EC2 subscription.  If you prefer
  /// not to cancel your Amazon EC2 subscription, you can delete your snapshots
  /// using the Amazon EC2 console. For more information, see the
  /// [AWS Storage Gateway Detail Page](http://aws.amazon.com/storagegateway).
  Future<DeleteGatewayOutput> deleteGateway(String gatewayArn) async {
    var response_ = await _client.send('DeleteGateway', {
      'GatewayARN': gatewayArn,
    });
    return DeleteGatewayOutput.fromJson(response_);
  }

  /// Deletes a snapshot of a volume.
  ///
  /// You can take snapshots of your gateway volumes on a scheduled or ad hoc
  /// basis. This API action enables you to delete a snapshot schedule for a
  /// volume. For more information, see
  /// [Working with Snapshots](https://docs.aws.amazon.com/storagegateway/latest/userguide/WorkingWithSnapshots.html).
  /// In the `DeleteSnapshotSchedule` request, you identify the volume by
  /// providing its Amazon Resource Name (ARN). This operation is only supported
  /// in stored and cached volume gateway types.
  ///
  ///
  ///
  /// To list or delete a snapshot, you must use the Amazon EC2 API. in _Amazon
  /// Elastic Compute Cloud API Reference_.
  ///
  /// [volumeArn]: The volume which snapshot schedule to delete.
  Future<DeleteSnapshotScheduleOutput> deleteSnapshotSchedule(
      String volumeArn) async {
    var response_ = await _client.send('DeleteSnapshotSchedule', {
      'VolumeARN': volumeArn,
    });
    return DeleteSnapshotScheduleOutput.fromJson(response_);
  }

  /// Deletes the specified virtual tape. This operation is only supported in
  /// the tape gateway type.
  ///
  /// [gatewayArn]: The unique Amazon Resource Name (ARN) of the gateway that
  /// the virtual tape to delete is associated with. Use the ListGateways
  /// operation to return a list of gateways for your account and AWS Region.
  ///
  /// [tapeArn]: The Amazon Resource Name (ARN) of the virtual tape to delete.
  Future<DeleteTapeOutput> deleteTape(
      {@required String gatewayArn, @required String tapeArn}) async {
    var response_ = await _client.send('DeleteTape', {
      'GatewayARN': gatewayArn,
      'TapeARN': tapeArn,
    });
    return DeleteTapeOutput.fromJson(response_);
  }

  /// Deletes the specified virtual tape from the virtual tape shelf (VTS). This
  /// operation is only supported in the tape gateway type.
  ///
  /// [tapeArn]: The Amazon Resource Name (ARN) of the virtual tape to delete
  /// from the virtual tape shelf (VTS).
  Future<DeleteTapeArchiveOutput> deleteTapeArchive(String tapeArn) async {
    var response_ = await _client.send('DeleteTapeArchive', {
      'TapeARN': tapeArn,
    });
    return DeleteTapeArchiveOutput.fromJson(response_);
  }

  /// Deletes the specified storage volume that you previously created using the
  /// CreateCachediSCSIVolume or CreateStorediSCSIVolume API. This operation is
  /// only supported in the cached volume and stored volume types. For stored
  /// volume gateways, the local disk that was configured as the storage volume
  /// is not deleted. You can reuse the local disk to create another storage
  /// volume.
  ///
  /// Before you delete a volume, make sure there are no iSCSI connections to
  /// the volume you are deleting. You should also make sure there is no
  /// snapshot in progress. You can use the Amazon Elastic Compute Cloud (Amazon
  /// EC2) API to query snapshots on the volume you are deleting and check the
  /// snapshot status. For more information, go to
  /// [DescribeSnapshots](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/ApiReference-query-DescribeSnapshots.html)
  /// in the _Amazon Elastic Compute Cloud API Reference_.
  ///
  /// In the request, you must provide the Amazon Resource Name (ARN) of the
  /// storage volume you want to delete.
  ///
  /// [volumeArn]: The Amazon Resource Name (ARN) of the volume. Use the
  /// ListVolumes operation to return a list of gateway volumes.
  Future<DeleteVolumeOutput> deleteVolume(String volumeArn) async {
    var response_ = await _client.send('DeleteVolume', {
      'VolumeARN': volumeArn,
    });
    return DeleteVolumeOutput.fromJson(response_);
  }

  /// Returns the bandwidth rate limits of a gateway. By default, these limits
  /// are not set, which means no bandwidth rate limiting is in effect.
  ///
  /// This operation only returns a value for a bandwidth rate limit only if the
  /// limit is set. If no limits are set for the gateway, then this operation
  /// returns only the gateway ARN in the response body. To specify which
  /// gateway to describe, use the Amazon Resource Name (ARN) of the gateway in
  /// your request.
  Future<DescribeBandwidthRateLimitOutput> describeBandwidthRateLimit(
      String gatewayArn) async {
    var response_ = await _client.send('DescribeBandwidthRateLimit', {
      'GatewayARN': gatewayArn,
    });
    return DescribeBandwidthRateLimitOutput.fromJson(response_);
  }

  /// Returns information about the cache of a gateway. This operation is only
  /// supported in the cached volume, tape and file gateway types.
  ///
  /// The response includes disk IDs that are configured as cache, and it
  /// includes the amount of cache allocated and used.
  Future<DescribeCacheOutput> describeCache(String gatewayArn) async {
    var response_ = await _client.send('DescribeCache', {
      'GatewayARN': gatewayArn,
    });
    return DescribeCacheOutput.fromJson(response_);
  }

  /// Returns a description of the gateway volumes specified in the request.
  /// This operation is only supported in the cached volume gateway types.
  ///
  /// The list of gateway volumes in the request must be from one gateway. In
  /// the response Amazon Storage Gateway returns volume information sorted by
  /// volume Amazon Resource Name (ARN).
  ///
  /// [volumeARNs]: An array of strings where each string represents the Amazon
  /// Resource Name (ARN) of a cached volume. All of the specified cached
  /// volumes must from the same gateway. Use ListVolumes to get volume ARNs for
  /// a gateway.
  Future<DescribeCachediScsiVolumesOutput> describeCachediScsiVolumes(
      List<String> volumeARNs) async {
    var response_ = await _client.send('DescribeCachediSCSIVolumes', {
      'VolumeARNs': volumeARNs,
    });
    return DescribeCachediScsiVolumesOutput.fromJson(response_);
  }

  /// Returns an array of Challenge-Handshake Authentication Protocol (CHAP)
  /// credentials information for a specified iSCSI target, one for each
  /// target-initiator pair.
  ///
  /// [targetArn]: The Amazon Resource Name (ARN) of the iSCSI volume target.
  /// Use the DescribeStorediSCSIVolumes operation to return to retrieve the
  /// TargetARN for specified VolumeARN.
  Future<DescribeChapCredentialsOutput> describeChapCredentials(
      String targetArn) async {
    var response_ = await _client.send('DescribeChapCredentials', {
      'TargetARN': targetArn,
    });
    return DescribeChapCredentialsOutput.fromJson(response_);
  }

  /// Returns metadata about a gateway such as its name, network interfaces,
  /// configured time zone, and the state (whether the gateway is running or
  /// not). To specify which gateway to describe, use the Amazon Resource Name
  /// (ARN) of the gateway in your request.
  Future<DescribeGatewayInformationOutput> describeGatewayInformation(
      String gatewayArn) async {
    var response_ = await _client.send('DescribeGatewayInformation', {
      'GatewayARN': gatewayArn,
    });
    return DescribeGatewayInformationOutput.fromJson(response_);
  }

  /// Returns your gateway's weekly maintenance start time including the day and
  /// time of the week. Note that values are in terms of the gateway's time
  /// zone.
  Future<DescribeMaintenanceStartTimeOutput> describeMaintenanceStartTime(
      String gatewayArn) async {
    var response_ = await _client.send('DescribeMaintenanceStartTime', {
      'GatewayARN': gatewayArn,
    });
    return DescribeMaintenanceStartTimeOutput.fromJson(response_);
  }

  /// Gets a description for one or more Network File System (NFS) file shares
  /// from a file gateway. This operation is only supported for file gateways.
  ///
  /// [fileShareArnList]: An array containing the Amazon Resource Name (ARN) of
  /// each file share to be described.
  Future<DescribeNfsFileSharesOutput> describeNfsFileShares(
      List<String> fileShareArnList) async {
    var response_ = await _client.send('DescribeNFSFileShares', {
      'FileShareARNList': fileShareArnList,
    });
    return DescribeNfsFileSharesOutput.fromJson(response_);
  }

  /// Gets a description for one or more Server Message Block (SMB) file shares
  /// from a file gateway. This operation is only supported for file gateways.
  ///
  /// [fileShareArnList]: An array containing the Amazon Resource Name (ARN) of
  /// each file share to be described.
  Future<DescribeSmbFileSharesOutput> describeSmbFileShares(
      List<String> fileShareArnList) async {
    var response_ = await _client.send('DescribeSMBFileShares', {
      'FileShareARNList': fileShareArnList,
    });
    return DescribeSmbFileSharesOutput.fromJson(response_);
  }

  /// Gets a description of a Server Message Block (SMB) file share settings
  /// from a file gateway. This operation is only supported for file gateways.
  Future<DescribeSmbSettingsOutput> describeSmbSettings(
      String gatewayArn) async {
    var response_ = await _client.send('DescribeSMBSettings', {
      'GatewayARN': gatewayArn,
    });
    return DescribeSmbSettingsOutput.fromJson(response_);
  }

  /// Describes the snapshot schedule for the specified gateway volume. The
  /// snapshot schedule information includes intervals at which snapshots are
  /// automatically initiated on the volume. This operation is only supported in
  /// the cached volume and stored volume types.
  ///
  /// [volumeArn]: The Amazon Resource Name (ARN) of the volume. Use the
  /// ListVolumes operation to return a list of gateway volumes.
  Future<DescribeSnapshotScheduleOutput> describeSnapshotSchedule(
      String volumeArn) async {
    var response_ = await _client.send('DescribeSnapshotSchedule', {
      'VolumeARN': volumeArn,
    });
    return DescribeSnapshotScheduleOutput.fromJson(response_);
  }

  /// Returns the description of the gateway volumes specified in the request.
  /// The list of gateway volumes in the request must be from one gateway. In
  /// the response Amazon Storage Gateway returns volume information sorted by
  /// volume ARNs. This operation is only supported in stored volume gateway
  /// type.
  ///
  /// [volumeARNs]: An array of strings where each string represents the Amazon
  /// Resource Name (ARN) of a stored volume. All of the specified stored
  /// volumes must from the same gateway. Use ListVolumes to get volume ARNs for
  /// a gateway.
  Future<DescribeStorediScsiVolumesOutput> describeStorediScsiVolumes(
      List<String> volumeARNs) async {
    var response_ = await _client.send('DescribeStorediSCSIVolumes', {
      'VolumeARNs': volumeARNs,
    });
    return DescribeStorediScsiVolumesOutput.fromJson(response_);
  }

  /// Returns a description of specified virtual tapes in the virtual tape shelf
  /// (VTS). This operation is only supported in the tape gateway type.
  ///
  /// If a specific `TapeARN` is not specified, AWS Storage Gateway returns a
  /// description of all virtual tapes found in the VTS associated with your
  /// account.
  ///
  /// [tapeARNs]: Specifies one or more unique Amazon Resource Names (ARNs) that
  /// represent the virtual tapes you want to describe.
  ///
  /// [marker]: An opaque string that indicates the position at which to begin
  /// describing virtual tapes.
  ///
  /// [limit]: Specifies that the number of virtual tapes descried be limited to
  /// the specified number.
  Future<DescribeTapeArchivesOutput> describeTapeArchives(
      {List<String> tapeARNs, String marker, int limit}) async {
    var response_ = await _client.send('DescribeTapeArchives', {
      if (tapeARNs != null) 'TapeARNs': tapeARNs,
      if (marker != null) 'Marker': marker,
      if (limit != null) 'Limit': limit,
    });
    return DescribeTapeArchivesOutput.fromJson(response_);
  }

  /// Returns a list of virtual tape recovery points that are available for the
  /// specified tape gateway.
  ///
  /// A recovery point is a point-in-time view of a virtual tape at which all
  /// the data on the virtual tape is consistent. If your gateway crashes,
  /// virtual tapes that have recovery points can be recovered to a new gateway.
  /// This operation is only supported in the tape gateway type.
  ///
  /// [marker]: An opaque string that indicates the position at which to begin
  /// describing the virtual tape recovery points.
  ///
  /// [limit]: Specifies that the number of virtual tape recovery points that
  /// are described be limited to the specified number.
  Future<DescribeTapeRecoveryPointsOutput> describeTapeRecoveryPoints(
      String gatewayArn,
      {String marker,
      int limit}) async {
    var response_ = await _client.send('DescribeTapeRecoveryPoints', {
      'GatewayARN': gatewayArn,
      if (marker != null) 'Marker': marker,
      if (limit != null) 'Limit': limit,
    });
    return DescribeTapeRecoveryPointsOutput.fromJson(response_);
  }

  /// Returns a description of the specified Amazon Resource Name (ARN) of
  /// virtual tapes. If a `TapeARN` is not specified, returns a description of
  /// all virtual tapes associated with the specified gateway. This operation is
  /// only supported in the tape gateway type.
  ///
  /// [tapeARNs]: Specifies one or more unique Amazon Resource Names (ARNs) that
  /// represent the virtual tapes you want to describe. If this parameter is not
  /// specified, Tape gateway returns a description of all virtual tapes
  /// associated with the specified gateway.
  ///
  /// [marker]: A marker value, obtained in a previous call to `DescribeTapes`.
  /// This marker indicates which page of results to retrieve.
  ///
  /// If not specified, the first page of results is retrieved.
  ///
  /// [limit]: Specifies that the number of virtual tapes described be limited
  /// to the specified number.
  ///
  ///
  ///
  /// Amazon Web Services may impose its own limit, if this field is not set.
  Future<DescribeTapesOutput> describeTapes(String gatewayArn,
      {List<String> tapeARNs, String marker, int limit}) async {
    var response_ = await _client.send('DescribeTapes', {
      'GatewayARN': gatewayArn,
      if (tapeARNs != null) 'TapeARNs': tapeARNs,
      if (marker != null) 'Marker': marker,
      if (limit != null) 'Limit': limit,
    });
    return DescribeTapesOutput.fromJson(response_);
  }

  /// Returns information about the upload buffer of a gateway. This operation
  /// is supported for the stored volume, cached volume and tape gateway types.
  ///
  /// The response includes disk IDs that are configured as upload buffer space,
  /// and it includes the amount of upload buffer space allocated and used.
  Future<DescribeUploadBufferOutput> describeUploadBuffer(
      String gatewayArn) async {
    var response_ = await _client.send('DescribeUploadBuffer', {
      'GatewayARN': gatewayArn,
    });
    return DescribeUploadBufferOutput.fromJson(response_);
  }

  /// Returns a description of virtual tape library (VTL) devices for the
  /// specified tape gateway. In the response, AWS Storage Gateway returns VTL
  /// device information.
  ///
  /// This operation is only supported in the tape gateway type.
  ///
  /// [vtlDeviceARNs]: An array of strings, where each string represents the
  /// Amazon Resource Name (ARN) of a VTL device.
  ///
  ///
  ///
  /// All of the specified VTL devices must be from the same gateway. If no VTL
  /// devices are specified, the result will contain all devices on the
  /// specified gateway.
  ///
  /// [marker]: An opaque string that indicates the position at which to begin
  /// describing the VTL devices.
  ///
  /// [limit]: Specifies that the number of VTL devices described be limited to
  /// the specified number.
  Future<DescribeVtlDevicesOutput> describeVtlDevices(String gatewayArn,
      {List<String> vtlDeviceARNs, String marker, int limit}) async {
    var response_ = await _client.send('DescribeVTLDevices', {
      'GatewayARN': gatewayArn,
      if (vtlDeviceARNs != null) 'VTLDeviceARNs': vtlDeviceARNs,
      if (marker != null) 'Marker': marker,
      if (limit != null) 'Limit': limit,
    });
    return DescribeVtlDevicesOutput.fromJson(response_);
  }

  /// Returns information about the working storage of a gateway. This operation
  /// is only supported in the stored volumes gateway type. This operation is
  /// deprecated in cached volumes API version (20120630). Use
  /// DescribeUploadBuffer instead.
  ///
  ///  Working storage is also referred to as upload buffer. You can also use
  /// the DescribeUploadBuffer operation to add upload buffer to a stored volume
  /// gateway.
  ///
  /// The response includes disk IDs that are configured as working storage, and
  /// it includes the amount of working storage allocated and used.
  Future<DescribeWorkingStorageOutput> describeWorkingStorage(
      String gatewayArn) async {
    var response_ = await _client.send('DescribeWorkingStorage', {
      'GatewayARN': gatewayArn,
    });
    return DescribeWorkingStorageOutput.fromJson(response_);
  }

  /// Disconnects a volume from an iSCSI connection and then detaches the volume
  /// from the specified gateway. Detaching and attaching a volume enables you
  /// to recover your data from one gateway to a different gateway without
  /// creating a snapshot. It also makes it easier to move your volumes from an
  /// on-premises gateway to a gateway hosted on an Amazon EC2 instance.
  ///
  /// [volumeArn]: The Amazon Resource Name (ARN) of the volume to detach from
  /// the gateway.
  ///
  /// [forceDetach]: Set to `true` to forcibly remove the iSCSI connection of
  /// the target volume and detach the volume. The default is `false`. If this
  /// value is set to `false`, you must manually disconnect the iSCSI connection
  /// from the target volume.
  Future<DetachVolumeOutput> detachVolume(String volumeArn,
      {bool forceDetach}) async {
    var response_ = await _client.send('DetachVolume', {
      'VolumeARN': volumeArn,
      if (forceDetach != null) 'ForceDetach': forceDetach,
    });
    return DetachVolumeOutput.fromJson(response_);
  }

  /// Disables a tape gateway when the gateway is no longer functioning. For
  /// example, if your gateway VM is damaged, you can disable the gateway so you
  /// can recover virtual tapes.
  ///
  /// Use this operation for a tape gateway that is not reachable or not
  /// functioning. This operation is only supported in the tape gateway type.
  ///
  ///
  ///
  /// Once a gateway is disabled it cannot be enabled.
  Future<DisableGatewayOutput> disableGateway(String gatewayArn) async {
    var response_ = await _client.send('DisableGateway', {
      'GatewayARN': gatewayArn,
    });
    return DisableGatewayOutput.fromJson(response_);
  }

  /// Adds a file gateway to an Active Directory domain. This operation is only
  /// supported for file gateways that support the SMB file protocol.
  ///
  /// [gatewayArn]: The Amazon Resource Name (ARN) of the gateway. Use the
  /// `ListGateways` operation to return a list of gateways for your account and
  /// AWS Region.
  ///
  /// [domainName]: The name of the domain that you want the gateway to join.
  ///
  /// [organizationalUnit]: The organizational unit (OU) is a container in an
  /// Active Directory that can hold users, groups, computers, and other OUs and
  /// this parameter specifies the OU that the gateway will join within the AD
  /// domain.
  ///
  /// [domainControllers]: List of IPv4 addresses, NetBIOS names, or host names
  /// of your domain server. If you need to specify the port number include it
  /// after the colon (“:”). For example, `mydc.mydomain.com:389`.
  ///
  /// [userName]: Sets the user name of user who has permission to add the
  /// gateway to the Active Directory domain.
  ///
  /// [password]: Sets the password of the user who has permission to add the
  /// gateway to the Active Directory domain.
  Future<JoinDomainOutput> joinDomain(
      {@required String gatewayArn,
      @required String domainName,
      String organizationalUnit,
      List<String> domainControllers,
      @required String userName,
      @required String password}) async {
    var response_ = await _client.send('JoinDomain', {
      'GatewayARN': gatewayArn,
      'DomainName': domainName,
      if (organizationalUnit != null) 'OrganizationalUnit': organizationalUnit,
      if (domainControllers != null) 'DomainControllers': domainControllers,
      'UserName': userName,
      'Password': password,
    });
    return JoinDomainOutput.fromJson(response_);
  }

  /// Gets a list of the file shares for a specific file gateway, or the list of
  /// file shares that belong to the calling user account. This operation is
  /// only supported for file gateways.
  ///
  /// [gatewayArn]: The Amazon resource Name (ARN) of the gateway whose file
  /// shares you want to list. If this field is not present, all file shares
  /// under your account are listed.
  ///
  /// [limit]: The maximum number of file shares to return in the response. The
  /// value must be an integer with a value greater than zero. Optional.
  ///
  /// [marker]: Opaque pagination token returned from a previous ListFileShares
  /// operation. If present, `Marker` specifies where to continue the list from
  /// after a previous call to ListFileShares. Optional.
  Future<ListFileSharesOutput> listFileShares(
      {String gatewayArn, int limit, String marker}) async {
    var response_ = await _client.send('ListFileShares', {
      if (gatewayArn != null) 'GatewayARN': gatewayArn,
      if (limit != null) 'Limit': limit,
      if (marker != null) 'Marker': marker,
    });
    return ListFileSharesOutput.fromJson(response_);
  }

  /// Lists gateways owned by an AWS account in an AWS Region specified in the
  /// request. The returned list is ordered by gateway Amazon Resource Name
  /// (ARN).
  ///
  /// By default, the operation returns a maximum of 100 gateways. This
  /// operation supports pagination that allows you to optionally reduce the
  /// number of gateways returned in a response.
  ///
  /// If you have more gateways than are returned in a response (that is, the
  /// response returns only a truncated list of your gateways), the response
  /// contains a marker that you can specify in your next request to fetch the
  /// next page of gateways.
  ///
  /// [marker]: An opaque string that indicates the position at which to begin
  /// the returned list of gateways.
  ///
  /// [limit]: Specifies that the list of gateways returned be limited to the
  /// specified number of items.
  Future<ListGatewaysOutput> listGateways({String marker, int limit}) async {
    var response_ = await _client.send('ListGateways', {
      if (marker != null) 'Marker': marker,
      if (limit != null) 'Limit': limit,
    });
    return ListGatewaysOutput.fromJson(response_);
  }

  /// Returns a list of the gateway's local disks. To specify which gateway to
  /// describe, you use the Amazon Resource Name (ARN) of the gateway in the
  /// body of the request.
  ///
  /// The request returns a list of all disks, specifying which are configured
  /// as working storage, cache storage, or stored volume or not configured at
  /// all. The response includes a `DiskStatus` field. This field can have a
  /// value of present (the disk is available to use), missing (the disk is no
  /// longer connected to the gateway), or mismatch (the disk node is occupied
  /// by a disk that has incorrect metadata or the disk content is corrupted).
  Future<ListLocalDisksOutput> listLocalDisks(String gatewayArn) async {
    var response_ = await _client.send('ListLocalDisks', {
      'GatewayARN': gatewayArn,
    });
    return ListLocalDisksOutput.fromJson(response_);
  }

  /// Lists the tags that have been added to the specified resource. This
  /// operation is only supported in the cached volume, stored volume and tape
  /// gateway type.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the resource for which
  /// you want to list tags.
  ///
  /// [marker]: An opaque string that indicates the position at which to begin
  /// returning the list of tags.
  ///
  /// [limit]: Specifies that the list of tags returned be limited to the
  /// specified number of items.
  Future<ListTagsForResourceOutput> listTagsForResource(String resourceArn,
      {String marker, int limit}) async {
    var response_ = await _client.send('ListTagsForResource', {
      'ResourceARN': resourceArn,
      if (marker != null) 'Marker': marker,
      if (limit != null) 'Limit': limit,
    });
    return ListTagsForResourceOutput.fromJson(response_);
  }

  /// Lists virtual tapes in your virtual tape library (VTL) and your virtual
  /// tape shelf (VTS). You specify the tapes to list by specifying one or more
  /// tape Amazon Resource Names (ARNs). If you don't specify a tape ARN, the
  /// operation lists all virtual tapes in both your VTL and VTS.
  ///
  /// This operation supports pagination. By default, the operation returns a
  /// maximum of up to 100 tapes. You can optionally specify the `Limit`
  /// parameter in the body to limit the number of tapes in the response. If the
  /// number of tapes returned in the response is truncated, the response
  /// includes a `Marker` element that you can use in your subsequent request to
  /// retrieve the next set of tapes. This operation is only supported in the
  /// tape gateway type.
  ///
  /// [marker]: A string that indicates the position at which to begin the
  /// returned list of tapes.
  ///
  /// [limit]: An optional number limit for the tapes in the list returned by
  /// this call.
  Future<ListTapesOutput> listTapes(
      {List<String> tapeARNs, String marker, int limit}) async {
    var response_ = await _client.send('ListTapes', {
      if (tapeARNs != null) 'TapeARNs': tapeARNs,
      if (marker != null) 'Marker': marker,
      if (limit != null) 'Limit': limit,
    });
    return ListTapesOutput.fromJson(response_);
  }

  /// Lists iSCSI initiators that are connected to a volume. You can use this
  /// operation to determine whether a volume is being used or not. This
  /// operation is only supported in the cached volume and stored volume gateway
  /// types.
  ///
  /// [volumeArn]: The Amazon Resource Name (ARN) of the volume. Use the
  /// ListVolumes operation to return a list of gateway volumes for the gateway.
  Future<ListVolumeInitiatorsOutput> listVolumeInitiators(
      String volumeArn) async {
    var response_ = await _client.send('ListVolumeInitiators', {
      'VolumeARN': volumeArn,
    });
    return ListVolumeInitiatorsOutput.fromJson(response_);
  }

  /// Lists the recovery points for a specified gateway. This operation is only
  /// supported in the cached volume gateway type.
  ///
  /// Each cache volume has one recovery point. A volume recovery point is a
  /// point in time at which all data of the volume is consistent and from which
  /// you can create a snapshot or clone a new cached volume from a source
  /// volume. To create a snapshot from a volume recovery point use the
  /// CreateSnapshotFromVolumeRecoveryPoint operation.
  Future<ListVolumeRecoveryPointsOutput> listVolumeRecoveryPoints(
      String gatewayArn) async {
    var response_ = await _client.send('ListVolumeRecoveryPoints', {
      'GatewayARN': gatewayArn,
    });
    return ListVolumeRecoveryPointsOutput.fromJson(response_);
  }

  /// Lists the iSCSI stored volumes of a gateway. Results are sorted by volume
  /// ARN. The response includes only the volume ARNs. If you want additional
  /// volume information, use the DescribeStorediSCSIVolumes or the
  /// DescribeCachediSCSIVolumes API.
  ///
  /// The operation supports pagination. By default, the operation returns a
  /// maximum of up to 100 volumes. You can optionally specify the `Limit` field
  /// in the body to limit the number of volumes in the response. If the number
  /// of volumes returned in the response is truncated, the response includes a
  /// Marker field. You can use this Marker value in your subsequent request to
  /// retrieve the next set of volumes. This operation is only supported in the
  /// cached volume and stored volume gateway types.
  ///
  /// [marker]: A string that indicates the position at which to begin the
  /// returned list of volumes. Obtain the marker from the response of a
  /// previous List iSCSI Volumes request.
  ///
  /// [limit]: Specifies that the list of volumes returned be limited to the
  /// specified number of items.
  Future<ListVolumesOutput> listVolumes(
      {String gatewayArn, String marker, int limit}) async {
    var response_ = await _client.send('ListVolumes', {
      if (gatewayArn != null) 'GatewayARN': gatewayArn,
      if (marker != null) 'Marker': marker,
      if (limit != null) 'Limit': limit,
    });
    return ListVolumesOutput.fromJson(response_);
  }

  /// Sends you notification through CloudWatch Events when all files written to
  /// your file share have been uploaded to Amazon S3.
  ///
  /// AWS Storage Gateway can send a notification through Amazon CloudWatch
  /// Events when all files written to your file share up to that point in time
  /// have been uploaded to Amazon S3. These files include files written to the
  /// file share up to the time that you make a request for notification. When
  /// the upload is done, Storage Gateway sends you notification through an
  /// Amazon CloudWatch Event. You can configure CloudWatch Events to send the
  /// notification through event targets such as Amazon SNS or AWS Lambda
  /// function. This operation is only supported for file gateways.
  ///
  /// For more information, see Getting File Upload Notification in the Storage
  /// Gateway User Guide
  /// (https://docs.aws.amazon.com/storagegateway/latest/userguide/monitoring-file-gateway.html#get-upload-notification).
  Future<NotifyWhenUploadedOutput> notifyWhenUploaded(
      String fileShareArn) async {
    var response_ = await _client.send('NotifyWhenUploaded', {
      'FileShareARN': fileShareArn,
    });
    return NotifyWhenUploadedOutput.fromJson(response_);
  }

  /// Refreshes the cache for the specified file share. This operation finds
  /// objects in the Amazon S3 bucket that were added, removed or replaced since
  /// the gateway last listed the bucket's contents and cached the results. This
  /// operation is only supported in the file gateway type. You can subscribe to
  /// be notified through an Amazon CloudWatch event when your RefreshCache
  /// operation completes. For more information, see
  /// [Getting Notified About File Operations](https://docs.aws.amazon.com/storagegateway/latest/userguide/monitoring-file-gateway.html#get-notification).
  ///
  /// When this API is called, it only initiates the refresh operation. When the
  /// API call completes and returns a success code, it doesn't necessarily mean
  /// that the file refresh has completed. You should use the refresh-complete
  /// notification to determine that the operation has completed before you
  /// check for new files on the gateway file share. You can subscribe to be
  /// notified through an CloudWatch event when your `RefreshCache` operation
  /// completes.
  ///
  /// [fileShareArn]: The Amazon Resource Name (ARN) of the file share you want
  /// to refresh.
  ///
  /// [folderList]: A comma-separated list of the paths of folders to refresh in
  /// the cache. The default is [`"/"`]. The default refreshes objects and
  /// folders at the root of the Amazon S3 bucket. If `Recursive` is set to
  /// "true", the entire S3 bucket that the file share has access to is
  /// refreshed.
  ///
  /// [recursive]: A value that specifies whether to recursively refresh folders
  /// in the cache. The refresh includes folders that were in the cache the last
  /// time the gateway listed the folder's contents. If this value set to
  /// "true", each folder that is listed in `FolderList` is recursively updated.
  /// Otherwise, subfolders listed in `FolderList` are not refreshed. Only
  /// objects that are in folders listed directly under `FolderList` are found
  /// and used for the update. The default is "true".
  Future<RefreshCacheOutput> refreshCache(String fileShareArn,
      {List<String> folderList, bool recursive}) async {
    var response_ = await _client.send('RefreshCache', {
      'FileShareARN': fileShareArn,
      if (folderList != null) 'FolderList': folderList,
      if (recursive != null) 'Recursive': recursive,
    });
    return RefreshCacheOutput.fromJson(response_);
  }

  /// Removes one or more tags from the specified resource. This operation is
  /// only supported in the cached volume, stored volume and tape gateway types.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the resource you want to
  /// remove the tags from.
  ///
  /// [tagKeys]: The keys of the tags you want to remove from the specified
  /// resource. A tag is composed of a key/value pair.
  Future<RemoveTagsFromResourceOutput> removeTagsFromResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {
    var response_ = await _client.send('RemoveTagsFromResource', {
      'ResourceARN': resourceArn,
      'TagKeys': tagKeys,
    });
    return RemoveTagsFromResourceOutput.fromJson(response_);
  }

  /// Resets all cache disks that have encountered a error and makes the disks
  /// available for reconfiguration as cache storage. If your cache disk
  /// encounters a error, the gateway prevents read and write operations on
  /// virtual tapes in the gateway. For example, an error can occur when a disk
  /// is corrupted or removed from the gateway. When a cache is reset, the
  /// gateway loses its cache storage. At this point you can reconfigure the
  /// disks as cache disks. This operation is only supported in the cached
  /// volume and tape types.
  ///
  ///
  ///
  /// If the cache disk you are resetting contains data that has not been
  /// uploaded to Amazon S3 yet, that data can be lost. After you reset cache
  /// disks, there will be no configured cache disks left in the gateway, so you
  /// must configure at least one new cache disk for your gateway to function
  /// properly.
  Future<ResetCacheOutput> resetCache(String gatewayArn) async {
    var response_ = await _client.send('ResetCache', {
      'GatewayARN': gatewayArn,
    });
    return ResetCacheOutput.fromJson(response_);
  }

  /// Retrieves an archived virtual tape from the virtual tape shelf (VTS) to a
  /// tape gateway. Virtual tapes archived in the VTS are not associated with
  /// any gateway. However after a tape is retrieved, it is associated with a
  /// gateway, even though it is also listed in the VTS, that is, archive. This
  /// operation is only supported in the tape gateway type.
  ///
  /// Once a tape is successfully retrieved to a gateway, it cannot be retrieved
  /// again to another gateway. You must archive the tape again before you can
  /// retrieve it to another gateway. This operation is only supported in the
  /// tape gateway type.
  ///
  /// [tapeArn]: The Amazon Resource Name (ARN) of the virtual tape you want to
  /// retrieve from the virtual tape shelf (VTS).
  ///
  /// [gatewayArn]: The Amazon Resource Name (ARN) of the gateway you want to
  /// retrieve the virtual tape to. Use the ListGateways operation to return a
  /// list of gateways for your account and AWS Region.
  ///
  /// You retrieve archived virtual tapes to only one gateway and the gateway
  /// must be a tape gateway.
  Future<RetrieveTapeArchiveOutput> retrieveTapeArchive(
      {@required String tapeArn, @required String gatewayArn}) async {
    var response_ = await _client.send('RetrieveTapeArchive', {
      'TapeARN': tapeArn,
      'GatewayARN': gatewayArn,
    });
    return RetrieveTapeArchiveOutput.fromJson(response_);
  }

  /// Retrieves the recovery point for the specified virtual tape. This
  /// operation is only supported in the tape gateway type.
  ///
  /// A recovery point is a point in time view of a virtual tape at which all
  /// the data on the tape is consistent. If your gateway crashes, virtual tapes
  /// that have recovery points can be recovered to a new gateway.
  ///
  ///
  ///
  /// The virtual tape can be retrieved to only one gateway. The retrieved tape
  /// is read-only. The virtual tape can be retrieved to only a tape gateway.
  /// There is no charge for retrieving recovery points.
  ///
  /// [tapeArn]: The Amazon Resource Name (ARN) of the virtual tape for which
  /// you want to retrieve the recovery point.
  Future<RetrieveTapeRecoveryPointOutput> retrieveTapeRecoveryPoint(
      {@required String tapeArn, @required String gatewayArn}) async {
    var response_ = await _client.send('RetrieveTapeRecoveryPoint', {
      'TapeARN': tapeArn,
      'GatewayARN': gatewayArn,
    });
    return RetrieveTapeRecoveryPointOutput.fromJson(response_);
  }

  /// Sets the password for your VM local console. When you log in to the local
  /// console for the first time, you log in to the VM with the default
  /// credentials. We recommend that you set a new password. You don't need to
  /// know the default password to set a new password.
  ///
  /// [localConsolePassword]: The password you want to set for your VM local
  /// console.
  Future<SetLocalConsolePasswordOutput> setLocalConsolePassword(
      {@required String gatewayArn,
      @required String localConsolePassword}) async {
    var response_ = await _client.send('SetLocalConsolePassword', {
      'GatewayARN': gatewayArn,
      'LocalConsolePassword': localConsolePassword,
    });
    return SetLocalConsolePasswordOutput.fromJson(response_);
  }

  /// Sets the password for the guest user `smbguest`. The `smbguest` user is
  /// the user when the authentication method for the file share is set to
  /// `GuestAccess`.
  ///
  /// [gatewayArn]: The Amazon Resource Name (ARN) of the file gateway the SMB
  /// file share is associated with.
  ///
  /// [password]: The password that you want to set for your SMB Server.
  Future<SetSmbGuestPasswordOutput> setSmbGuestPassword(
      {@required String gatewayArn, @required String password}) async {
    var response_ = await _client.send('SetSMBGuestPassword', {
      'GatewayARN': gatewayArn,
      'Password': password,
    });
    return SetSmbGuestPasswordOutput.fromJson(response_);
  }

  /// Shuts down a gateway. To specify which gateway to shut down, use the
  /// Amazon Resource Name (ARN) of the gateway in the body of your request.
  ///
  /// The operation shuts down the gateway service component running in the
  /// gateway's virtual machine (VM) and not the host VM.
  ///
  ///  If you want to shut down the VM, it is recommended that you first shut
  /// down the gateway component in the VM to avoid unpredictable conditions.
  ///
  /// After the gateway is shutdown, you cannot call any other API except
  /// StartGateway, DescribeGatewayInformation, and ListGateways. For more
  /// information, see ActivateGateway. Your applications cannot read from or
  /// write to the gateway's storage volumes, and there are no snapshots taken.
  ///
  ///  When you make a shutdown request, you will get a `200 OK` success
  /// response immediately. However, it might take some time for the gateway to
  /// shut down. You can call the DescribeGatewayInformation API to check the
  /// status. For more information, see ActivateGateway.
  ///
  /// If do not intend to use the gateway again, you must delete the gateway
  /// (using DeleteGateway) to no longer pay software charges associated with
  /// the gateway.
  Future<ShutdownGatewayOutput> shutdownGateway(String gatewayArn) async {
    var response_ = await _client.send('ShutdownGateway', {
      'GatewayARN': gatewayArn,
    });
    return ShutdownGatewayOutput.fromJson(response_);
  }

  /// Starts a gateway that you previously shut down (see ShutdownGateway).
  /// After the gateway starts, you can then make other API calls, your
  /// applications can read from or write to the gateway's storage volumes and
  /// you will be able to take snapshot backups.
  ///
  ///  When you make a request, you will get a 200 OK success response
  /// immediately. However, it might take some time for the gateway to be ready.
  /// You should call DescribeGatewayInformation and check the status before
  /// making any additional API calls. For more information, see
  /// ActivateGateway.
  ///
  /// To specify which gateway to start, use the Amazon Resource Name (ARN) of
  /// the gateway in your request.
  Future<StartGatewayOutput> startGateway(String gatewayArn) async {
    var response_ = await _client.send('StartGateway', {
      'GatewayARN': gatewayArn,
    });
    return StartGatewayOutput.fromJson(response_);
  }

  /// Updates the bandwidth rate limits of a gateway. You can update both the
  /// upload and download bandwidth rate limit or specify only one of the two.
  /// If you don't set a bandwidth rate limit, the existing rate limit remains.
  ///
  /// By default, a gateway's bandwidth rate limits are not set. If you don't
  /// set any limit, the gateway does not have any limitations on its bandwidth
  /// usage and could potentially use the maximum available bandwidth.
  ///
  /// To specify which gateway to update, use the Amazon Resource Name (ARN) of
  /// the gateway in your request.
  ///
  /// [averageUploadRateLimitInBitsPerSec]: The average upload bandwidth rate
  /// limit in bits per second.
  ///
  /// [averageDownloadRateLimitInBitsPerSec]: The average download bandwidth
  /// rate limit in bits per second.
  Future<UpdateBandwidthRateLimitOutput> updateBandwidthRateLimit(
      String gatewayArn,
      {BigInt averageUploadRateLimitInBitsPerSec,
      BigInt averageDownloadRateLimitInBitsPerSec}) async {
    var response_ = await _client.send('UpdateBandwidthRateLimit', {
      'GatewayARN': gatewayArn,
      if (averageUploadRateLimitInBitsPerSec != null)
        'AverageUploadRateLimitInBitsPerSec':
            averageUploadRateLimitInBitsPerSec,
      if (averageDownloadRateLimitInBitsPerSec != null)
        'AverageDownloadRateLimitInBitsPerSec':
            averageDownloadRateLimitInBitsPerSec,
    });
    return UpdateBandwidthRateLimitOutput.fromJson(response_);
  }

  /// Updates the Challenge-Handshake Authentication Protocol (CHAP) credentials
  /// for a specified iSCSI target. By default, a gateway does not have CHAP
  /// enabled; however, for added security, you might use it.
  ///
  ///
  ///
  /// When you update CHAP credentials, all existing connections on the target
  /// are closed and initiators must reconnect with the new credentials.
  ///
  /// [targetArn]: The Amazon Resource Name (ARN) of the iSCSI volume target.
  /// Use the DescribeStorediSCSIVolumes operation to return the TargetARN for
  /// specified VolumeARN.
  ///
  /// [secretToAuthenticateInitiator]: The secret key that the initiator (for
  /// example, the Windows client) must provide to participate in mutual CHAP
  /// with the target.
  ///
  ///
  ///
  /// The secret key must be between 12 and 16 bytes when encoded in UTF-8.
  ///
  /// [initiatorName]: The iSCSI initiator that connects to the target.
  ///
  /// [secretToAuthenticateTarget]: The secret key that the target must provide
  /// to participate in mutual CHAP with the initiator (e.g. Windows client).
  ///
  /// Byte constraints: Minimum bytes of 12. Maximum bytes of 16.
  ///
  ///
  ///
  /// The secret key must be between 12 and 16 bytes when encoded in UTF-8.
  Future<UpdateChapCredentialsOutput> updateChapCredentials(
      {@required String targetArn,
      @required String secretToAuthenticateInitiator,
      @required String initiatorName,
      String secretToAuthenticateTarget}) async {
    var response_ = await _client.send('UpdateChapCredentials', {
      'TargetARN': targetArn,
      'SecretToAuthenticateInitiator': secretToAuthenticateInitiator,
      'InitiatorName': initiatorName,
      if (secretToAuthenticateTarget != null)
        'SecretToAuthenticateTarget': secretToAuthenticateTarget,
    });
    return UpdateChapCredentialsOutput.fromJson(response_);
  }

  /// Updates a gateway's metadata, which includes the gateway's name and time
  /// zone. To specify which gateway to update, use the Amazon Resource Name
  /// (ARN) of the gateway in your request.
  ///
  ///
  ///
  /// For Gateways activated after September 2, 2015, the gateway's ARN contains
  /// the gateway ID rather than the gateway name. However, changing the name of
  /// the gateway has no effect on the gateway's ARN.
  ///
  /// [gatewayTimezone]: A value that indicates the time zone of the gateway.
  ///
  /// [cloudWatchLogGroupArn]: The Amazon Resource Name (ARN) of the Amazon
  /// CloudWatch log group that you want to use to monitor and log events in the
  /// gateway.
  ///
  /// For more information, see
  /// [What Is Amazon CloudWatch Logs?](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/WhatIsCloudWatchLogs.html).
  Future<UpdateGatewayInformationOutput> updateGatewayInformation(
      String gatewayArn,
      {String gatewayName,
      String gatewayTimezone,
      String cloudWatchLogGroupArn}) async {
    var response_ = await _client.send('UpdateGatewayInformation', {
      'GatewayARN': gatewayArn,
      if (gatewayName != null) 'GatewayName': gatewayName,
      if (gatewayTimezone != null) 'GatewayTimezone': gatewayTimezone,
      if (cloudWatchLogGroupArn != null)
        'CloudWatchLogGroupARN': cloudWatchLogGroupArn,
    });
    return UpdateGatewayInformationOutput.fromJson(response_);
  }

  /// Updates the gateway virtual machine (VM) software. The request immediately
  /// triggers the software update.
  ///
  ///  When you make this request, you get a `200 OK` success response
  /// immediately. However, it might take some time for the update to complete.
  /// You can call DescribeGatewayInformation to verify the gateway is in the
  /// `STATE_RUNNING` state.
  ///
  /// A software update forces a system restart of your gateway. You can
  /// minimize the chance of any disruption to your applications by increasing
  /// your iSCSI Initiators' timeouts. For more information about increasing
  /// iSCSI Initiator timeouts for Windows and Linux, see
  /// [Customizing Your Windows iSCSI Settings](https://docs.aws.amazon.com/storagegateway/latest/userguide/ConfiguringiSCSIClientInitiatorWindowsClient.html#CustomizeWindowsiSCSISettings)
  /// and
  /// [Customizing Your Linux iSCSI Settings](https://docs.aws.amazon.com/storagegateway/latest/userguide/ConfiguringiSCSIClientInitiatorRedHatClient.html#CustomizeLinuxiSCSISettings),
  /// respectively.
  Future<UpdateGatewaySoftwareNowOutput> updateGatewaySoftwareNow(
      String gatewayArn) async {
    var response_ = await _client.send('UpdateGatewaySoftwareNow', {
      'GatewayARN': gatewayArn,
    });
    return UpdateGatewaySoftwareNowOutput.fromJson(response_);
  }

  /// Updates a gateway's weekly maintenance start time information, including
  /// day and time of the week. The maintenance time is the time in your
  /// gateway's time zone.
  ///
  /// [hourOfDay]: The hour component of the maintenance start time represented
  /// as _hh_, where _hh_ is the hour (00 to 23). The hour of the day is in the
  /// time zone of the gateway.
  ///
  /// [minuteOfHour]: The minute component of the maintenance start time
  /// represented as _mm_, where _mm_ is the minute (00 to 59). The minute of
  /// the hour is in the time zone of the gateway.
  ///
  /// [dayOfWeek]: The day of the week component of the maintenance start time
  /// week represented as an ordinal number from 0 to 6, where 0 represents
  /// Sunday and 6 Saturday.
  ///
  /// [dayOfMonth]: The day of the month component of the maintenance start time
  /// represented as an ordinal number from 1 to 28, where 1 represents the
  /// first day of the month and 28 represents the last day of the month.
  ///
  ///
  ///
  /// This value is only available for tape and volume gateways.
  Future<UpdateMaintenanceStartTimeOutput> updateMaintenanceStartTime(
      {@required String gatewayArn,
      @required int hourOfDay,
      @required int minuteOfHour,
      int dayOfWeek,
      int dayOfMonth}) async {
    var response_ = await _client.send('UpdateMaintenanceStartTime', {
      'GatewayARN': gatewayArn,
      'HourOfDay': hourOfDay,
      'MinuteOfHour': minuteOfHour,
      if (dayOfWeek != null) 'DayOfWeek': dayOfWeek,
      if (dayOfMonth != null) 'DayOfMonth': dayOfMonth,
    });
    return UpdateMaintenanceStartTimeOutput.fromJson(response_);
  }

  /// Updates a Network File System (NFS) file share. This operation is only
  /// supported in the file gateway type.
  ///
  ///  To leave a file share field unchanged, set the corresponding input field
  /// to null.
  ///
  /// Updates the following file share setting:
  ///
  /// *   Default storage class for your S3 bucket
  ///
  /// *   Metadata defaults for your S3 bucket
  ///
  /// *   Allowed NFS clients for your file share
  ///
  /// *   Squash settings
  ///
  /// *   Write status of your file share
  ///
  ///
  ///
  ///
  /// To leave a file share field unchanged, set the corresponding input field
  /// to null. This operation is only supported in file gateways.
  ///
  /// [fileShareArn]: The Amazon Resource Name (ARN) of the file share to be
  /// updated.
  ///
  /// [kmsEncrypted]: True to use Amazon S3 server side encryption with your own
  /// AWS KMS key, or false to use a key managed by Amazon S3. Optional.
  ///
  /// [kmsKey]: The Amazon Resource Name (ARN) of the AWS KMS key used for
  /// Amazon S3 server side encryption. This value can only be set when
  /// KMSEncrypted is true. Optional.
  ///
  /// [nfsFileShareDefaults]: The default values for the file share. Optional.
  ///
  /// [defaultStorageClass]: The default storage class for objects put into an
  /// Amazon S3 bucket by the file gateway. Possible values are `S3_STANDARD`,
  /// `S3_STANDARD_IA`, or `S3_ONEZONE_IA`. If this field is not populated, the
  /// default value `S3_STANDARD` is used. Optional.
  ///
  /// [objectAcl]: A value that sets the access control list permission for
  /// objects in the S3 bucket that a file gateway puts objects into. The
  /// default value is "private".
  ///
  /// [clientList]: The list of clients that are allowed to access the file
  /// gateway. The list must contain either valid IP addresses or valid CIDR
  /// blocks.
  ///
  /// [squash]: The user mapped to anonymous user. Valid options are the
  /// following:
  ///
  /// *    `RootSquash` - Only root is mapped to anonymous user.
  ///
  /// *    `NoSquash` - No one is mapped to anonymous user
  ///
  /// *    `AllSquash` - Everyone is mapped to anonymous user.
  ///
  /// [readOnly]: A value that sets the write status of a file share. This value
  /// is true if the write status is read-only, and otherwise false.
  ///
  /// [guessMimeTypeEnabled]: A value that enables guessing of the MIME type for
  /// uploaded objects based on file extensions. Set this value to true to
  /// enable MIME type guessing, and otherwise to false. The default value is
  /// true.
  ///
  /// [requesterPays]: A value that sets who pays the cost of the request and
  /// the cost associated with data download from the S3 bucket. If this value
  /// is set to true, the requester pays the costs. Otherwise the S3 bucket
  /// owner pays. However, the S3 bucket owner always pays the cost of storing
  /// data.
  ///
  ///   `RequesterPays` is a configuration for the S3 bucket that backs the file
  /// share, so make sure that the configuration on the file share is the same
  /// as the S3 bucket configuration.
  Future<UpdateNfsFileShareOutput> updateNfsFileShare(String fileShareArn,
      {bool kmsEncrypted,
      String kmsKey,
      NfsFileShareDefaults nfsFileShareDefaults,
      String defaultStorageClass,
      String objectAcl,
      List<String> clientList,
      String squash,
      bool readOnly,
      bool guessMimeTypeEnabled,
      bool requesterPays}) async {
    var response_ = await _client.send('UpdateNFSFileShare', {
      'FileShareARN': fileShareArn,
      if (kmsEncrypted != null) 'KMSEncrypted': kmsEncrypted,
      if (kmsKey != null) 'KMSKey': kmsKey,
      if (nfsFileShareDefaults != null)
        'NFSFileShareDefaults': nfsFileShareDefaults,
      if (defaultStorageClass != null)
        'DefaultStorageClass': defaultStorageClass,
      if (objectAcl != null) 'ObjectACL': objectAcl,
      if (clientList != null) 'ClientList': clientList,
      if (squash != null) 'Squash': squash,
      if (readOnly != null) 'ReadOnly': readOnly,
      if (guessMimeTypeEnabled != null)
        'GuessMIMETypeEnabled': guessMimeTypeEnabled,
      if (requesterPays != null) 'RequesterPays': requesterPays,
    });
    return UpdateNfsFileShareOutput.fromJson(response_);
  }

  /// Updates a Server Message Block (SMB) file share.
  ///
  ///  To leave a file share field unchanged, set the corresponding input field
  /// to null. This operation is only supported for file gateways.
  ///
  /// File gateways require AWS Security Token Service (AWS STS) to be activated
  /// to enable you to create a file share. Make sure that AWS STS is activated
  /// in the AWS Region you are creating your file gateway in. If AWS STS is not
  /// activated in this AWS Region, activate it. For information about how to
  /// activate AWS STS, see
  /// [Activating and Deactivating AWS STS in an AWS Region](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_enable-regions.html)
  /// in the _AWS Identity and Access Management User Guide._
  ///
  /// File gateways don't support creating hard or symbolic links on a file
  /// share.
  ///
  /// [fileShareArn]: The Amazon Resource Name (ARN) of the SMB file share that
  /// you want to update.
  ///
  /// [kmsEncrypted]: True to use Amazon S3 server side encryption with your own
  /// AWS KMS key, or false to use a key managed by Amazon S3. Optional.
  ///
  /// [kmsKey]: The Amazon Resource Name (ARN) of the AWS KMS key used for
  /// Amazon S3 server side encryption. This value can only be set when
  /// KMSEncrypted is true. Optional.
  ///
  /// [defaultStorageClass]: The default storage class for objects put into an
  /// Amazon S3 bucket by the file gateway. Possible values are `S3_STANDARD`,
  /// `S3_STANDARD_IA`, or `S3_ONEZONE_IA`. If this field is not populated, the
  /// default value `S3_STANDARD` is used. Optional.
  ///
  /// [objectAcl]: A value that sets the access control list permission for
  /// objects in the S3 bucket that a file gateway puts objects into. The
  /// default value is "private".
  ///
  /// [readOnly]: A value that sets the write status of a file share. This value
  /// is true if the write status is read-only, and otherwise false.
  ///
  /// [guessMimeTypeEnabled]: A value that enables guessing of the MIME type for
  /// uploaded objects based on file extensions. Set this value to true to
  /// enable MIME type guessing, and otherwise to false. The default value is
  /// true.
  ///
  /// [requesterPays]: A value that sets who pays the cost of the request and
  /// the cost associated with data download from the S3 bucket. If this value
  /// is set to true, the requester pays the costs. Otherwise the S3 bucket
  /// owner pays. However, the S3 bucket owner always pays the cost of storing
  /// data.
  ///
  ///   `RequesterPays` is a configuration for the S3 bucket that backs the file
  /// share, so make sure that the configuration on the file share is the same
  /// as the S3 bucket configuration.
  ///
  /// [smbaclEnabled]: Set this value to "true to enable ACL (access control
  /// list) on the SMB file share. Set it to "false" to map file and directory
  /// permissions to the POSIX permissions.
  ///
  /// For more information, see
  /// https://docs.aws.amazon.com/storagegateway/latest/userguide/smb-acl.htmlin
  /// the Storage Gateway User Guide.
  ///
  /// [adminUserList]: A list of users in the Active Directory that have
  /// administrator rights to the file share. A group must be prefixed with the
  /// @ character. For example `@group1`. Can only be set if Authentication is
  /// set to `ActiveDirectory`.
  ///
  /// [validUserList]: A list of users or groups in the Active Directory that
  /// are allowed to access the file share. A group must be prefixed with the @
  /// character. For example `@group1`. Can only be set if Authentication is set
  /// to `ActiveDirectory`.
  ///
  /// [invalidUserList]: A list of users or groups in the Active Directory that
  /// are not allowed to access the file share. A group must be prefixed with
  /// the @ character. For example `@group1`. Can only be set if Authentication
  /// is set to `ActiveDirectory`.
  Future<UpdateSmbFileShareOutput> updateSmbFileShare(String fileShareArn,
      {bool kmsEncrypted,
      String kmsKey,
      String defaultStorageClass,
      String objectAcl,
      bool readOnly,
      bool guessMimeTypeEnabled,
      bool requesterPays,
      bool smbaclEnabled,
      List<String> adminUserList,
      List<String> validUserList,
      List<String> invalidUserList}) async {
    var response_ = await _client.send('UpdateSMBFileShare', {
      'FileShareARN': fileShareArn,
      if (kmsEncrypted != null) 'KMSEncrypted': kmsEncrypted,
      if (kmsKey != null) 'KMSKey': kmsKey,
      if (defaultStorageClass != null)
        'DefaultStorageClass': defaultStorageClass,
      if (objectAcl != null) 'ObjectACL': objectAcl,
      if (readOnly != null) 'ReadOnly': readOnly,
      if (guessMimeTypeEnabled != null)
        'GuessMIMETypeEnabled': guessMimeTypeEnabled,
      if (requesterPays != null) 'RequesterPays': requesterPays,
      if (smbaclEnabled != null) 'SMBACLEnabled': smbaclEnabled,
      if (adminUserList != null) 'AdminUserList': adminUserList,
      if (validUserList != null) 'ValidUserList': validUserList,
      if (invalidUserList != null) 'InvalidUserList': invalidUserList,
    });
    return UpdateSmbFileShareOutput.fromJson(response_);
  }

  /// Updates the SMB security strategy on a file gateway. This action is only
  /// supported in file gateways.
  ///
  ///
  ///
  /// This API is called Security level in the User Guide.
  ///
  /// A higher security level can affect performance of the gateway.
  ///
  /// [smbSecurityStrategy]: Specifies the type of security strategy.
  ///
  /// ClientSpecified: if you use this option, requests are established based on
  /// what is negotiated by the client. This option is recommended when you want
  /// to maximize compatibility across different clients in your environment.
  ///
  /// MandatorySigning: if you use this option, file gateway only allows
  /// connections from SMBv2 or SMBv3 clients that have signing enabled. This
  /// option works with SMB clients on Microsoft Windows Vista, Windows Server
  /// 2008 or newer.
  ///
  /// MandatoryEncryption: if you use this option, file gateway only allows
  /// connections from SMBv3 clients that have encryption enabled. This option
  /// is highly recommended for environments that handle sensitive data. This
  /// option works with SMB clients on Microsoft Windows 8, Windows Server 2012
  /// or newer.
  Future<UpdateSmbSecurityStrategyOutput> updateSmbSecurityStrategy(
      {@required String gatewayArn,
      @required String smbSecurityStrategy}) async {
    var response_ = await _client.send('UpdateSMBSecurityStrategy', {
      'GatewayARN': gatewayArn,
      'SMBSecurityStrategy': smbSecurityStrategy,
    });
    return UpdateSmbSecurityStrategyOutput.fromJson(response_);
  }

  /// Updates a snapshot schedule configured for a gateway volume. This
  /// operation is only supported in the cached volume and stored volume gateway
  /// types.
  ///
  /// The default snapshot schedule for volume is once every 24 hours, starting
  /// at the creation time of the volume. You can use this API to change the
  /// snapshot schedule configured for the volume.
  ///
  /// In the request you must identify the gateway volume whose snapshot
  /// schedule you want to update, and the schedule information, including when
  /// you want the snapshot to begin on a day and the frequency (in hours) of
  /// snapshots.
  ///
  /// [volumeArn]: The Amazon Resource Name (ARN) of the volume. Use the
  /// ListVolumes operation to return a list of gateway volumes.
  ///
  /// [startAt]: The hour of the day at which the snapshot schedule begins
  /// represented as _hh_, where _hh_ is the hour (0 to 23). The hour of the day
  /// is in the time zone of the gateway.
  ///
  /// [recurrenceInHours]: Frequency of snapshots. Specify the number of hours
  /// between snapshots.
  ///
  /// [description]: Optional description of the snapshot that overwrites the
  /// existing description.
  ///
  /// [tags]: A list of up to 50 tags that can be assigned to a snapshot. Each
  /// tag is a key-value pair.
  ///
  ///
  ///
  /// Valid characters for key and value are letters, spaces, and numbers
  /// representable in UTF-8 format, and the following special characters: + - =
  /// . _ : / @. The maximum length of a tag's key is 128 characters, and the
  /// maximum length for a tag's value is 256.
  Future<UpdateSnapshotScheduleOutput> updateSnapshotSchedule(
      {@required String volumeArn,
      @required int startAt,
      @required int recurrenceInHours,
      String description,
      List<Tag> tags}) async {
    var response_ = await _client.send('UpdateSnapshotSchedule', {
      'VolumeARN': volumeArn,
      'StartAt': startAt,
      'RecurrenceInHours': recurrenceInHours,
      if (description != null) 'Description': description,
      if (tags != null) 'Tags': tags,
    });
    return UpdateSnapshotScheduleOutput.fromJson(response_);
  }

  /// Updates the type of medium changer in a tape gateway. When you activate a
  /// tape gateway, you select a medium changer type for the tape gateway. This
  /// operation enables you to select a different type of medium changer after a
  /// tape gateway is activated. This operation is only supported in the tape
  /// gateway type.
  ///
  /// [vtlDeviceArn]: The Amazon Resource Name (ARN) of the medium changer you
  /// want to select.
  ///
  /// [deviceType]: The type of medium changer you want to select.
  ///
  ///  Valid Values: "STK-L700", "AWS-Gateway-VTL"
  Future<UpdateVtlDeviceTypeOutput> updateVtlDeviceType(
      {@required String vtlDeviceArn, @required String deviceType}) async {
    var response_ = await _client.send('UpdateVTLDeviceType', {
      'VTLDeviceARN': vtlDeviceArn,
      'DeviceType': deviceType,
    });
    return UpdateVtlDeviceTypeOutput.fromJson(response_);
  }
}

/// AWS Storage Gateway returns the Amazon Resource Name (ARN) of the activated
/// gateway. It is a string made of information such as your account, gateway
/// name, and AWS Region. This ARN is used to reference the gateway in other API
/// operations as well as resource-based authorization.
///
///
///
/// For gateways activated prior to September 02, 2015, the gateway ARN contains
/// the gateway name rather than the gateway ID. Changing the name of the
/// gateway has no effect on the gateway ARN.
class ActivateGatewayOutput {
  final String gatewayArn;

  ActivateGatewayOutput({
    this.gatewayArn,
  });
  static ActivateGatewayOutput fromJson(Map<String, dynamic> json) =>
      ActivateGatewayOutput(
        gatewayArn: json.containsKey('GatewayARN')
            ? json['GatewayARN'] as String
            : null,
      );
}

class AddCacheOutput {
  final String gatewayArn;

  AddCacheOutput({
    this.gatewayArn,
  });
  static AddCacheOutput fromJson(Map<String, dynamic> json) => AddCacheOutput(
        gatewayArn: json.containsKey('GatewayARN')
            ? json['GatewayARN'] as String
            : null,
      );
}

/// AddTagsToResourceOutput
class AddTagsToResourceOutput {
  /// The Amazon Resource Name (ARN) of the resource you want to add tags to.
  final String resourceArn;

  AddTagsToResourceOutput({
    this.resourceArn,
  });
  static AddTagsToResourceOutput fromJson(Map<String, dynamic> json) =>
      AddTagsToResourceOutput(
        resourceArn: json.containsKey('ResourceARN')
            ? json['ResourceARN'] as String
            : null,
      );
}

class AddUploadBufferOutput {
  final String gatewayArn;

  AddUploadBufferOutput({
    this.gatewayArn,
  });
  static AddUploadBufferOutput fromJson(Map<String, dynamic> json) =>
      AddUploadBufferOutput(
        gatewayArn: json.containsKey('GatewayARN')
            ? json['GatewayARN'] as String
            : null,
      );
}

/// A JSON object containing the of the gateway for which working storage was
/// configured.
class AddWorkingStorageOutput {
  final String gatewayArn;

  AddWorkingStorageOutput({
    this.gatewayArn,
  });
  static AddWorkingStorageOutput fromJson(Map<String, dynamic> json) =>
      AddWorkingStorageOutput(
        gatewayArn: json.containsKey('GatewayARN')
            ? json['GatewayARN'] as String
            : null,
      );
}

class AssignTapePoolOutput {
  /// The unique Amazon Resource Names (ARN) of the virtual tape that was added
  /// to the tape pool.
  final String tapeArn;

  AssignTapePoolOutput({
    this.tapeArn,
  });
  static AssignTapePoolOutput fromJson(Map<String, dynamic> json) =>
      AssignTapePoolOutput(
        tapeArn: json.containsKey('TapeARN') ? json['TapeARN'] as String : null,
      );
}

/// AttachVolumeOutput
class AttachVolumeOutput {
  /// The Amazon Resource Name (ARN) of the volume that was attached to the
  /// gateway.
  final String volumeArn;

  /// The Amazon Resource Name (ARN) of the volume target, which includes the
  /// iSCSI name for the initiator that was used to connect to the target.
  final String targetArn;

  AttachVolumeOutput({
    this.volumeArn,
    this.targetArn,
  });
  static AttachVolumeOutput fromJson(Map<String, dynamic> json) =>
      AttachVolumeOutput(
        volumeArn:
            json.containsKey('VolumeARN') ? json['VolumeARN'] as String : null,
        targetArn:
            json.containsKey('TargetARN') ? json['TargetARN'] as String : null,
      );
}

/// Describes an iSCSI cached volume.
class CachediScsiVolume {
  /// The Amazon Resource Name (ARN) of the storage volume.
  final String volumeArn;

  /// The unique identifier of the volume, e.g. vol-AE4B946D.
  final String volumeId;

  /// One of the VolumeType enumeration values that describes the type of the
  /// volume.
  final String volumeType;

  /// One of the VolumeStatus values that indicates the state of the storage
  /// volume.
  final String volumeStatus;

  /// A value that indicates whether a storage volume is attached to or detached
  /// from a gateway. For more information, see
  /// [Moving Your Volumes to a Different Gateway](https://docs.aws.amazon.com/storagegateway/latest/userguide/managing-volumes.html#attach-detach-volume).
  final String volumeAttachmentStatus;

  /// The size, in bytes, of the volume capacity.
  final BigInt volumeSizeInBytes;

  /// Represents the percentage complete if the volume is restoring or
  /// bootstrapping that represents the percent of data transferred. This field
  /// does not appear in the response if the cached volume is not restoring or
  /// bootstrapping.
  final double volumeProgress;

  /// If the cached volume was created from a snapshot, this field contains the
  /// snapshot ID used, e.g. snap-78e22663. Otherwise, this field is not
  /// included.
  final String sourceSnapshotId;

  /// An VolumeiSCSIAttributes object that represents a collection of iSCSI
  /// attributes for one stored volume.
  final VolumeiScsiAttributes volumeiScsiAttributes;

  /// The date the volume was created. Volumes created prior to March 28, 2017
  /// don’t have this time stamp.
  final DateTime createdDate;

  /// The size of the data stored on the volume in bytes. This value is
  /// calculated based on the number of blocks that are touched, instead of the
  /// actual amount of data written. This value can be useful for sequential
  /// write patterns but less accurate for random write patterns.
  /// `VolumeUsedInBytes` is different from the compressed size of the volume,
  /// which is the value that is used to calculate your bill.
  ///
  ///
  ///
  /// This value is not available for volumes created prior to May 13, 2015,
  /// until you store data on the volume.
  final BigInt volumeUsedInBytes;

  final String kmsKey;

  /// The name of the iSCSI target used by an initiator to connect to a volume
  /// and used as a suffix for the target ARN. For example, specifying
  /// `TargetName` as _myvolume_ results in the target ARN of
  /// `arn:aws:storagegateway:us-east-2:111122223333:gateway/sgw-12A3456B/target/iqn.1997-05.com.amazon:myvolume`.
  /// The target name must be unique across all volumes on a gateway.
  ///
  /// If you don't specify a value, Storage Gateway uses the value that was
  /// previously used for this volume as the new target name.
  final String targetName;

  CachediScsiVolume({
    this.volumeArn,
    this.volumeId,
    this.volumeType,
    this.volumeStatus,
    this.volumeAttachmentStatus,
    this.volumeSizeInBytes,
    this.volumeProgress,
    this.sourceSnapshotId,
    this.volumeiScsiAttributes,
    this.createdDate,
    this.volumeUsedInBytes,
    this.kmsKey,
    this.targetName,
  });
  static CachediScsiVolume fromJson(Map<String, dynamic> json) =>
      CachediScsiVolume(
        volumeArn:
            json.containsKey('VolumeARN') ? json['VolumeARN'] as String : null,
        volumeId:
            json.containsKey('VolumeId') ? json['VolumeId'] as String : null,
        volumeType: json.containsKey('VolumeType')
            ? json['VolumeType'] as String
            : null,
        volumeStatus: json.containsKey('VolumeStatus')
            ? json['VolumeStatus'] as String
            : null,
        volumeAttachmentStatus: json.containsKey('VolumeAttachmentStatus')
            ? json['VolumeAttachmentStatus'] as String
            : null,
        volumeSizeInBytes: json.containsKey('VolumeSizeInBytes')
            ? BigInt.from(json['VolumeSizeInBytes'])
            : null,
        volumeProgress: json.containsKey('VolumeProgress')
            ? json['VolumeProgress'] as double
            : null,
        sourceSnapshotId: json.containsKey('SourceSnapshotId')
            ? json['SourceSnapshotId'] as String
            : null,
        volumeiScsiAttributes: json.containsKey('VolumeiSCSIAttributes')
            ? VolumeiScsiAttributes.fromJson(json['VolumeiSCSIAttributes'])
            : null,
        createdDate: json.containsKey('CreatedDate')
            ? DateTime.parse(json['CreatedDate'])
            : null,
        volumeUsedInBytes: json.containsKey('VolumeUsedInBytes')
            ? BigInt.from(json['VolumeUsedInBytes'])
            : null,
        kmsKey: json.containsKey('KMSKey') ? json['KMSKey'] as String : null,
        targetName: json.containsKey('TargetName')
            ? json['TargetName'] as String
            : null,
      );
}

/// CancelArchivalOutput
class CancelArchivalOutput {
  /// The Amazon Resource Name (ARN) of the virtual tape for which archiving was
  /// canceled.
  final String tapeArn;

  CancelArchivalOutput({
    this.tapeArn,
  });
  static CancelArchivalOutput fromJson(Map<String, dynamic> json) =>
      CancelArchivalOutput(
        tapeArn: json.containsKey('TapeARN') ? json['TapeARN'] as String : null,
      );
}

/// CancelRetrievalOutput
class CancelRetrievalOutput {
  /// The Amazon Resource Name (ARN) of the virtual tape for which retrieval was
  /// canceled.
  final String tapeArn;

  CancelRetrievalOutput({
    this.tapeArn,
  });
  static CancelRetrievalOutput fromJson(Map<String, dynamic> json) =>
      CancelRetrievalOutput(
        tapeArn: json.containsKey('TapeARN') ? json['TapeARN'] as String : null,
      );
}

/// Describes Challenge-Handshake Authentication Protocol (CHAP) information
/// that supports authentication between your gateway and iSCSI initiators.
class ChapInfo {
  /// The Amazon Resource Name (ARN) of the volume.
  ///
  ///  Valid Values: 50 to 500 lowercase letters, numbers, periods (.), and
  /// hyphens (-).
  final String targetArn;

  /// The secret key that the initiator (for example, the Windows client) must
  /// provide to participate in mutual CHAP with the target.
  final String secretToAuthenticateInitiator;

  /// The iSCSI initiator that connects to the target.
  final String initiatorName;

  /// The secret key that the target must provide to participate in mutual CHAP
  /// with the initiator (e.g. Windows client).
  final String secretToAuthenticateTarget;

  ChapInfo({
    this.targetArn,
    this.secretToAuthenticateInitiator,
    this.initiatorName,
    this.secretToAuthenticateTarget,
  });
  static ChapInfo fromJson(Map<String, dynamic> json) => ChapInfo(
        targetArn:
            json.containsKey('TargetARN') ? json['TargetARN'] as String : null,
        secretToAuthenticateInitiator:
            json.containsKey('SecretToAuthenticateInitiator')
                ? json['SecretToAuthenticateInitiator'] as String
                : null,
        initiatorName: json.containsKey('InitiatorName')
            ? json['InitiatorName'] as String
            : null,
        secretToAuthenticateTarget:
            json.containsKey('SecretToAuthenticateTarget')
                ? json['SecretToAuthenticateTarget'] as String
                : null,
      );
}

class CreateCachediScsiVolumeOutput {
  /// The Amazon Resource Name (ARN) of the configured volume.
  final String volumeArn;

  /// The Amazon Resource Name (ARN) of the volume target, which includes the
  /// iSCSI name that initiators can use to connect to the target.
  final String targetArn;

  CreateCachediScsiVolumeOutput({
    this.volumeArn,
    this.targetArn,
  });
  static CreateCachediScsiVolumeOutput fromJson(Map<String, dynamic> json) =>
      CreateCachediScsiVolumeOutput(
        volumeArn:
            json.containsKey('VolumeARN') ? json['VolumeARN'] as String : null,
        targetArn:
            json.containsKey('TargetARN') ? json['TargetARN'] as String : null,
      );
}

/// CreateNFSFileShareOutput
class CreateNfsFileShareOutput {
  /// The Amazon Resource Name (ARN) of the newly created file share.
  final String fileShareArn;

  CreateNfsFileShareOutput({
    this.fileShareArn,
  });
  static CreateNfsFileShareOutput fromJson(Map<String, dynamic> json) =>
      CreateNfsFileShareOutput(
        fileShareArn: json.containsKey('FileShareARN')
            ? json['FileShareARN'] as String
            : null,
      );
}

/// CreateSMBFileShareOutput
class CreateSmbFileShareOutput {
  /// The Amazon Resource Name (ARN) of the newly created file share.
  final String fileShareArn;

  CreateSmbFileShareOutput({
    this.fileShareArn,
  });
  static CreateSmbFileShareOutput fromJson(Map<String, dynamic> json) =>
      CreateSmbFileShareOutput(
        fileShareArn: json.containsKey('FileShareARN')
            ? json['FileShareARN'] as String
            : null,
      );
}

class CreateSnapshotFromVolumeRecoveryPointOutput {
  /// The ID of the snapshot.
  final String snapshotId;

  /// The Amazon Resource Name (ARN) of the iSCSI volume target. Use the
  /// DescribeStorediSCSIVolumes operation to return to retrieve the TargetARN
  /// for specified VolumeARN.
  final String volumeArn;

  /// The time the volume was created from the recovery point.
  final String volumeRecoveryPointTime;

  CreateSnapshotFromVolumeRecoveryPointOutput({
    this.snapshotId,
    this.volumeArn,
    this.volumeRecoveryPointTime,
  });
  static CreateSnapshotFromVolumeRecoveryPointOutput fromJson(
          Map<String, dynamic> json) =>
      CreateSnapshotFromVolumeRecoveryPointOutput(
        snapshotId: json.containsKey('SnapshotId')
            ? json['SnapshotId'] as String
            : null,
        volumeArn:
            json.containsKey('VolumeARN') ? json['VolumeARN'] as String : null,
        volumeRecoveryPointTime: json.containsKey('VolumeRecoveryPointTime')
            ? json['VolumeRecoveryPointTime'] as String
            : null,
      );
}

/// A JSON object containing the following fields:
class CreateSnapshotOutput {
  /// The Amazon Resource Name (ARN) of the volume of which the snapshot was
  /// taken.
  final String volumeArn;

  /// The snapshot ID that is used to refer to the snapshot in future operations
  /// such as describing snapshots (Amazon Elastic Compute Cloud API
  /// `DescribeSnapshots`) or creating a volume from a snapshot
  /// (CreateStorediSCSIVolume).
  final String snapshotId;

  CreateSnapshotOutput({
    this.volumeArn,
    this.snapshotId,
  });
  static CreateSnapshotOutput fromJson(Map<String, dynamic> json) =>
      CreateSnapshotOutput(
        volumeArn:
            json.containsKey('VolumeARN') ? json['VolumeARN'] as String : null,
        snapshotId: json.containsKey('SnapshotId')
            ? json['SnapshotId'] as String
            : null,
      );
}

/// A JSON object containing the following fields:
class CreateStorediScsiVolumeOutput {
  /// The Amazon Resource Name (ARN) of the configured volume.
  final String volumeArn;

  /// The size of the volume in bytes.
  final BigInt volumeSizeInBytes;

  /// The Amazon Resource Name (ARN) of the volume target, which includes the
  /// iSCSI name that initiators can use to connect to the target.
  final String targetArn;

  CreateStorediScsiVolumeOutput({
    this.volumeArn,
    this.volumeSizeInBytes,
    this.targetArn,
  });
  static CreateStorediScsiVolumeOutput fromJson(Map<String, dynamic> json) =>
      CreateStorediScsiVolumeOutput(
        volumeArn:
            json.containsKey('VolumeARN') ? json['VolumeARN'] as String : null,
        volumeSizeInBytes: json.containsKey('VolumeSizeInBytes')
            ? BigInt.from(json['VolumeSizeInBytes'])
            : null,
        targetArn:
            json.containsKey('TargetARN') ? json['TargetARN'] as String : null,
      );
}

/// CreateTapeOutput
class CreateTapeWithBarcodeOutput {
  /// A unique Amazon Resource Name (ARN) that represents the virtual tape that
  /// was created.
  final String tapeArn;

  CreateTapeWithBarcodeOutput({
    this.tapeArn,
  });
  static CreateTapeWithBarcodeOutput fromJson(Map<String, dynamic> json) =>
      CreateTapeWithBarcodeOutput(
        tapeArn: json.containsKey('TapeARN') ? json['TapeARN'] as String : null,
      );
}

/// CreateTapeOutput
class CreateTapesOutput {
  /// A list of unique Amazon Resource Names (ARNs) that represents the virtual
  /// tapes that were created.
  final List<String> tapeARNs;

  CreateTapesOutput({
    this.tapeARNs,
  });
  static CreateTapesOutput fromJson(Map<String, dynamic> json) =>
      CreateTapesOutput(
        tapeARNs: json.containsKey('TapeARNs')
            ? (json['TapeARNs'] as List).map((e) => e as String).toList()
            : null,
      );
}

/// A JSON object containing the of the gateway whose bandwidth rate information
/// was deleted.
class DeleteBandwidthRateLimitOutput {
  final String gatewayArn;

  DeleteBandwidthRateLimitOutput({
    this.gatewayArn,
  });
  static DeleteBandwidthRateLimitOutput fromJson(Map<String, dynamic> json) =>
      DeleteBandwidthRateLimitOutput(
        gatewayArn: json.containsKey('GatewayARN')
            ? json['GatewayARN'] as String
            : null,
      );
}

/// A JSON object containing the following fields:
class DeleteChapCredentialsOutput {
  /// The Amazon Resource Name (ARN) of the target.
  final String targetArn;

  /// The iSCSI initiator that connects to the target.
  final String initiatorName;

  DeleteChapCredentialsOutput({
    this.targetArn,
    this.initiatorName,
  });
  static DeleteChapCredentialsOutput fromJson(Map<String, dynamic> json) =>
      DeleteChapCredentialsOutput(
        targetArn:
            json.containsKey('TargetARN') ? json['TargetARN'] as String : null,
        initiatorName: json.containsKey('InitiatorName')
            ? json['InitiatorName'] as String
            : null,
      );
}

/// DeleteFileShareOutput
class DeleteFileShareOutput {
  /// The Amazon Resource Name (ARN) of the deleted file share.
  final String fileShareArn;

  DeleteFileShareOutput({
    this.fileShareArn,
  });
  static DeleteFileShareOutput fromJson(Map<String, dynamic> json) =>
      DeleteFileShareOutput(
        fileShareArn: json.containsKey('FileShareARN')
            ? json['FileShareARN'] as String
            : null,
      );
}

/// A JSON object containing the ID of the deleted gateway.
class DeleteGatewayOutput {
  final String gatewayArn;

  DeleteGatewayOutput({
    this.gatewayArn,
  });
  static DeleteGatewayOutput fromJson(Map<String, dynamic> json) =>
      DeleteGatewayOutput(
        gatewayArn: json.containsKey('GatewayARN')
            ? json['GatewayARN'] as String
            : null,
      );
}

class DeleteSnapshotScheduleOutput {
  /// The volume which snapshot schedule was deleted.
  final String volumeArn;

  DeleteSnapshotScheduleOutput({
    this.volumeArn,
  });
  static DeleteSnapshotScheduleOutput fromJson(Map<String, dynamic> json) =>
      DeleteSnapshotScheduleOutput(
        volumeArn:
            json.containsKey('VolumeARN') ? json['VolumeARN'] as String : null,
      );
}

/// DeleteTapeArchiveOutput
class DeleteTapeArchiveOutput {
  /// The Amazon Resource Name (ARN) of the virtual tape that was deleted from
  /// the virtual tape shelf (VTS).
  final String tapeArn;

  DeleteTapeArchiveOutput({
    this.tapeArn,
  });
  static DeleteTapeArchiveOutput fromJson(Map<String, dynamic> json) =>
      DeleteTapeArchiveOutput(
        tapeArn: json.containsKey('TapeARN') ? json['TapeARN'] as String : null,
      );
}

/// DeleteTapeOutput
class DeleteTapeOutput {
  /// The Amazon Resource Name (ARN) of the deleted virtual tape.
  final String tapeArn;

  DeleteTapeOutput({
    this.tapeArn,
  });
  static DeleteTapeOutput fromJson(Map<String, dynamic> json) =>
      DeleteTapeOutput(
        tapeArn: json.containsKey('TapeARN') ? json['TapeARN'] as String : null,
      );
}

/// A JSON object containing the of the storage volume that was deleted
class DeleteVolumeOutput {
  /// The Amazon Resource Name (ARN) of the storage volume that was deleted. It
  /// is the same ARN you provided in the request.
  final String volumeArn;

  DeleteVolumeOutput({
    this.volumeArn,
  });
  static DeleteVolumeOutput fromJson(Map<String, dynamic> json) =>
      DeleteVolumeOutput(
        volumeArn:
            json.containsKey('VolumeARN') ? json['VolumeARN'] as String : null,
      );
}

/// A JSON object containing the following fields:
class DescribeBandwidthRateLimitOutput {
  final String gatewayArn;

  /// The average upload bandwidth rate limit in bits per second. This field
  /// does not appear in the response if the upload rate limit is not set.
  final BigInt averageUploadRateLimitInBitsPerSec;

  /// The average download bandwidth rate limit in bits per second. This field
  /// does not appear in the response if the download rate limit is not set.
  final BigInt averageDownloadRateLimitInBitsPerSec;

  DescribeBandwidthRateLimitOutput({
    this.gatewayArn,
    this.averageUploadRateLimitInBitsPerSec,
    this.averageDownloadRateLimitInBitsPerSec,
  });
  static DescribeBandwidthRateLimitOutput fromJson(Map<String, dynamic> json) =>
      DescribeBandwidthRateLimitOutput(
        gatewayArn: json.containsKey('GatewayARN')
            ? json['GatewayARN'] as String
            : null,
        averageUploadRateLimitInBitsPerSec:
            json.containsKey('AverageUploadRateLimitInBitsPerSec')
                ? BigInt.from(json['AverageUploadRateLimitInBitsPerSec'])
                : null,
        averageDownloadRateLimitInBitsPerSec:
            json.containsKey('AverageDownloadRateLimitInBitsPerSec')
                ? BigInt.from(json['AverageDownloadRateLimitInBitsPerSec'])
                : null,
      );
}

class DescribeCacheOutput {
  final String gatewayArn;

  /// An array of strings that identify disks that are to be configured as
  /// working storage. Each string have a minimum length of 1 and maximum length
  /// of 300. You can get the disk IDs from the ListLocalDisks API.
  final List<String> diskIds;

  /// The amount of cache in bytes allocated to the a gateway.
  final BigInt cacheAllocatedInBytes;

  /// Percent use of the gateway's cache storage. This metric applies only to
  /// the gateway-cached volume setup. The sample is taken at the end of the
  /// reporting period.
  final double cacheUsedPercentage;

  /// The file share's contribution to the overall percentage of the gateway's
  /// cache that has not been persisted to AWS. The sample is taken at the end
  /// of the reporting period.
  final double cacheDirtyPercentage;

  /// Percent of application read operations from the file shares that are
  /// served from cache. The sample is taken at the end of the reporting period.
  final double cacheHitPercentage;

  /// Percent of application read operations from the file shares that are not
  /// served from cache. The sample is taken at the end of the reporting period.
  final double cacheMissPercentage;

  DescribeCacheOutput({
    this.gatewayArn,
    this.diskIds,
    this.cacheAllocatedInBytes,
    this.cacheUsedPercentage,
    this.cacheDirtyPercentage,
    this.cacheHitPercentage,
    this.cacheMissPercentage,
  });
  static DescribeCacheOutput fromJson(Map<String, dynamic> json) =>
      DescribeCacheOutput(
        gatewayArn: json.containsKey('GatewayARN')
            ? json['GatewayARN'] as String
            : null,
        diskIds: json.containsKey('DiskIds')
            ? (json['DiskIds'] as List).map((e) => e as String).toList()
            : null,
        cacheAllocatedInBytes: json.containsKey('CacheAllocatedInBytes')
            ? BigInt.from(json['CacheAllocatedInBytes'])
            : null,
        cacheUsedPercentage: json.containsKey('CacheUsedPercentage')
            ? json['CacheUsedPercentage'] as double
            : null,
        cacheDirtyPercentage: json.containsKey('CacheDirtyPercentage')
            ? json['CacheDirtyPercentage'] as double
            : null,
        cacheHitPercentage: json.containsKey('CacheHitPercentage')
            ? json['CacheHitPercentage'] as double
            : null,
        cacheMissPercentage: json.containsKey('CacheMissPercentage')
            ? json['CacheMissPercentage'] as double
            : null,
      );
}

/// A JSON object containing the following fields:
class DescribeCachediScsiVolumesOutput {
  /// An array of objects where each object contains metadata about one cached
  /// volume.
  final List<CachediScsiVolume> cachediScsiVolumes;

  DescribeCachediScsiVolumesOutput({
    this.cachediScsiVolumes,
  });
  static DescribeCachediScsiVolumesOutput fromJson(Map<String, dynamic> json) =>
      DescribeCachediScsiVolumesOutput(
        cachediScsiVolumes: json.containsKey('CachediSCSIVolumes')
            ? (json['CachediSCSIVolumes'] as List)
                .map((e) => CachediScsiVolume.fromJson(e))
                .toList()
            : null,
      );
}

/// A JSON object containing a .
class DescribeChapCredentialsOutput {
  /// An array of ChapInfo objects that represent CHAP credentials. Each object
  /// in the array contains CHAP credential information for one target-initiator
  /// pair. If no CHAP credentials are set, an empty array is returned. CHAP
  /// credential information is provided in a JSON object with the following
  /// fields:
  ///
  /// *    **InitiatorName**: The iSCSI initiator that connects to the target.
  ///
  /// *    **SecretToAuthenticateInitiator**: The secret key that the initiator
  /// (for example, the Windows client) must provide to participate in mutual
  /// CHAP with the target.
  ///
  /// *    **SecretToAuthenticateTarget**: The secret key that the target must
  /// provide to participate in mutual CHAP with the initiator (e.g. Windows
  /// client).
  ///
  /// *    **TargetARN**: The Amazon Resource Name (ARN) of the storage volume.
  final List<ChapInfo> chapCredentials;

  DescribeChapCredentialsOutput({
    this.chapCredentials,
  });
  static DescribeChapCredentialsOutput fromJson(Map<String, dynamic> json) =>
      DescribeChapCredentialsOutput(
        chapCredentials: json.containsKey('ChapCredentials')
            ? (json['ChapCredentials'] as List)
                .map((e) => ChapInfo.fromJson(e))
                .toList()
            : null,
      );
}

/// A JSON object containing the following fields:
class DescribeGatewayInformationOutput {
  final String gatewayArn;

  /// The unique identifier assigned to your gateway during activation. This ID
  /// becomes part of the gateway Amazon Resource Name (ARN), which you use as
  /// input for other operations.
  final String gatewayId;

  /// The name you configured for your gateway.
  final String gatewayName;

  /// A value that indicates the time zone configured for the gateway.
  final String gatewayTimezone;

  /// A value that indicates the operating state of the gateway.
  final String gatewayState;

  /// A NetworkInterface array that contains descriptions of the gateway network
  /// interfaces.
  final List<NetworkInterface> gatewayNetworkInterfaces;

  /// The type of the gateway.
  final String gatewayType;

  /// The date on which an update to the gateway is available. This date is in
  /// the time zone of the gateway. If the gateway is not available for an
  /// update this field is not returned in the response.
  final String nextUpdateAvailabilityDate;

  /// The date on which the last software update was applied to the gateway. If
  /// the gateway has never been updated, this field does not return a value in
  /// the response.
  final String lastSoftwareUpdate;

  /// The ID of the Amazon EC2 instance that was used to launch the gateway.
  final String ec2InstanceId;

  /// The AWS Region where the Amazon EC2 instance is located.
  final String ec2InstanceRegion;

  /// A list of up to 50 tags assigned to the gateway, sorted alphabetically by
  /// key name. Each tag is a key-value pair. For a gateway with more than 10
  /// tags assigned, you can view all tags using the `ListTagsForResource` API
  /// operation.
  final List<Tag> tags;

  /// The configuration settings for the virtual private cloud (VPC) endpoint
  /// for your gateway.
  final String vpcEndpoint;

  /// The Amazon Resource Name (ARN) of the Amazon CloudWatch log group that was
  /// used to monitor and log events in the gateway.
  final String cloudWatchLogGroupArn;

  DescribeGatewayInformationOutput({
    this.gatewayArn,
    this.gatewayId,
    this.gatewayName,
    this.gatewayTimezone,
    this.gatewayState,
    this.gatewayNetworkInterfaces,
    this.gatewayType,
    this.nextUpdateAvailabilityDate,
    this.lastSoftwareUpdate,
    this.ec2InstanceId,
    this.ec2InstanceRegion,
    this.tags,
    this.vpcEndpoint,
    this.cloudWatchLogGroupArn,
  });
  static DescribeGatewayInformationOutput fromJson(Map<String, dynamic> json) =>
      DescribeGatewayInformationOutput(
        gatewayArn: json.containsKey('GatewayARN')
            ? json['GatewayARN'] as String
            : null,
        gatewayId:
            json.containsKey('GatewayId') ? json['GatewayId'] as String : null,
        gatewayName: json.containsKey('GatewayName')
            ? json['GatewayName'] as String
            : null,
        gatewayTimezone: json.containsKey('GatewayTimezone')
            ? json['GatewayTimezone'] as String
            : null,
        gatewayState: json.containsKey('GatewayState')
            ? json['GatewayState'] as String
            : null,
        gatewayNetworkInterfaces: json.containsKey('GatewayNetworkInterfaces')
            ? (json['GatewayNetworkInterfaces'] as List)
                .map((e) => NetworkInterface.fromJson(e))
                .toList()
            : null,
        gatewayType: json.containsKey('GatewayType')
            ? json['GatewayType'] as String
            : null,
        nextUpdateAvailabilityDate:
            json.containsKey('NextUpdateAvailabilityDate')
                ? json['NextUpdateAvailabilityDate'] as String
                : null,
        lastSoftwareUpdate: json.containsKey('LastSoftwareUpdate')
            ? json['LastSoftwareUpdate'] as String
            : null,
        ec2InstanceId: json.containsKey('Ec2InstanceId')
            ? json['Ec2InstanceId'] as String
            : null,
        ec2InstanceRegion: json.containsKey('Ec2InstanceRegion')
            ? json['Ec2InstanceRegion'] as String
            : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as List).map((e) => Tag.fromJson(e)).toList()
            : null,
        vpcEndpoint: json.containsKey('VPCEndpoint')
            ? json['VPCEndpoint'] as String
            : null,
        cloudWatchLogGroupArn: json.containsKey('CloudWatchLogGroupARN')
            ? json['CloudWatchLogGroupARN'] as String
            : null,
      );
}

/// A JSON object containing the following fields:
///
/// *    DescribeMaintenanceStartTimeOutput$DayOfMonth
///
/// *    DescribeMaintenanceStartTimeOutput$DayOfWeek
///
/// *    DescribeMaintenanceStartTimeOutput$HourOfDay
///
/// *    DescribeMaintenanceStartTimeOutput$MinuteOfHour
///
/// *    DescribeMaintenanceStartTimeOutput$Timezone
class DescribeMaintenanceStartTimeOutput {
  final String gatewayArn;

  /// The hour component of the maintenance start time represented as _hh_,
  /// where _hh_ is the hour (0 to 23). The hour of the day is in the time zone
  /// of the gateway.
  final int hourOfDay;

  /// The minute component of the maintenance start time represented as _mm_,
  /// where _mm_ is the minute (0 to 59). The minute of the hour is in the time
  /// zone of the gateway.
  final int minuteOfHour;

  /// An ordinal number between 0 and 6 that represents the day of the week,
  /// where 0 represents Sunday and 6 represents Saturday. The day of week is in
  /// the time zone of the gateway.
  final int dayOfWeek;

  /// The day of the month component of the maintenance start time represented
  /// as an ordinal number from 1 to 28, where 1 represents the first day of the
  /// month and 28 represents the last day of the month.
  ///
  ///
  ///
  /// This value is only available for tape and volume gateways.
  final int dayOfMonth;

  /// A value that indicates the time zone that is set for the gateway. The
  /// start time and day of week specified should be in the time zone of the
  /// gateway.
  final String timezone;

  DescribeMaintenanceStartTimeOutput({
    this.gatewayArn,
    this.hourOfDay,
    this.minuteOfHour,
    this.dayOfWeek,
    this.dayOfMonth,
    this.timezone,
  });
  static DescribeMaintenanceStartTimeOutput fromJson(
          Map<String, dynamic> json) =>
      DescribeMaintenanceStartTimeOutput(
        gatewayArn: json.containsKey('GatewayARN')
            ? json['GatewayARN'] as String
            : null,
        hourOfDay:
            json.containsKey('HourOfDay') ? json['HourOfDay'] as int : null,
        minuteOfHour: json.containsKey('MinuteOfHour')
            ? json['MinuteOfHour'] as int
            : null,
        dayOfWeek:
            json.containsKey('DayOfWeek') ? json['DayOfWeek'] as int : null,
        dayOfMonth:
            json.containsKey('DayOfMonth') ? json['DayOfMonth'] as int : null,
        timezone:
            json.containsKey('Timezone') ? json['Timezone'] as String : null,
      );
}

/// DescribeNFSFileSharesOutput
class DescribeNfsFileSharesOutput {
  /// An array containing a description for each requested file share.
  final List<NfsFileShareInfo> nfsFileShareInfoList;

  DescribeNfsFileSharesOutput({
    this.nfsFileShareInfoList,
  });
  static DescribeNfsFileSharesOutput fromJson(Map<String, dynamic> json) =>
      DescribeNfsFileSharesOutput(
        nfsFileShareInfoList: json.containsKey('NFSFileShareInfoList')
            ? (json['NFSFileShareInfoList'] as List)
                .map((e) => NfsFileShareInfo.fromJson(e))
                .toList()
            : null,
      );
}

/// DescribeSMBFileSharesOutput
class DescribeSmbFileSharesOutput {
  /// An array containing a description for each requested file share.
  final List<SmbFileShareInfo> smbFileShareInfoList;

  DescribeSmbFileSharesOutput({
    this.smbFileShareInfoList,
  });
  static DescribeSmbFileSharesOutput fromJson(Map<String, dynamic> json) =>
      DescribeSmbFileSharesOutput(
        smbFileShareInfoList: json.containsKey('SMBFileShareInfoList')
            ? (json['SMBFileShareInfoList'] as List)
                .map((e) => SmbFileShareInfo.fromJson(e))
                .toList()
            : null,
      );
}

class DescribeSmbSettingsOutput {
  final String gatewayArn;

  /// The name of the domain that the gateway is joined to.
  final String domainName;

  /// This value is true if a password for the guest user “smbguest” is set, and
  /// otherwise false.
  final bool smbGuestPasswordSet;

  /// The type of security strategy that was specified for file gateway.
  ///
  /// ClientSpecified: if you use this option, requests are established based on
  /// what is negotiated by the client. This option is recommended when you want
  /// to maximize compatibility across different clients in your environment.
  ///
  /// MandatorySigning: if you use this option, file gateway only allows
  /// connections from SMBv2 or SMBv3 clients that have signing enabled. This
  /// option works with SMB clients on Microsoft Windows Vista, Windows Server
  /// 2008 or newer.
  ///
  /// MandatoryEncryption: if you use this option, file gateway only allows
  /// connections from SMBv3 clients that have encryption enabled. This option
  /// is highly recommended for environments that handle sensitive data. This
  /// option works with SMB clients on Microsoft Windows 8, Windows Server 2012
  /// or newer.
  final String smbSecurityStrategy;

  DescribeSmbSettingsOutput({
    this.gatewayArn,
    this.domainName,
    this.smbGuestPasswordSet,
    this.smbSecurityStrategy,
  });
  static DescribeSmbSettingsOutput fromJson(Map<String, dynamic> json) =>
      DescribeSmbSettingsOutput(
        gatewayArn: json.containsKey('GatewayARN')
            ? json['GatewayARN'] as String
            : null,
        domainName: json.containsKey('DomainName')
            ? json['DomainName'] as String
            : null,
        smbGuestPasswordSet: json.containsKey('SMBGuestPasswordSet')
            ? json['SMBGuestPasswordSet'] as bool
            : null,
        smbSecurityStrategy: json.containsKey('SMBSecurityStrategy')
            ? json['SMBSecurityStrategy'] as String
            : null,
      );
}

class DescribeSnapshotScheduleOutput {
  /// The Amazon Resource Name (ARN) of the volume that was specified in the
  /// request.
  final String volumeArn;

  /// The hour of the day at which the snapshot schedule begins represented as
  /// _hh_, where _hh_ is the hour (0 to 23). The hour of the day is in the time
  /// zone of the gateway.
  final int startAt;

  /// The number of hours between snapshots.
  final int recurrenceInHours;

  /// The snapshot description.
  final String description;

  /// A value that indicates the time zone of the gateway.
  final String timezone;

  /// A list of up to 50 tags assigned to the snapshot schedule, sorted
  /// alphabetically by key name. Each tag is a key-value pair. For a gateway
  /// with more than 10 tags assigned, you can view all tags using the
  /// `ListTagsForResource` API operation.
  final List<Tag> tags;

  DescribeSnapshotScheduleOutput({
    this.volumeArn,
    this.startAt,
    this.recurrenceInHours,
    this.description,
    this.timezone,
    this.tags,
  });
  static DescribeSnapshotScheduleOutput fromJson(Map<String, dynamic> json) =>
      DescribeSnapshotScheduleOutput(
        volumeArn:
            json.containsKey('VolumeARN') ? json['VolumeARN'] as String : null,
        startAt: json.containsKey('StartAt') ? json['StartAt'] as int : null,
        recurrenceInHours: json.containsKey('RecurrenceInHours')
            ? json['RecurrenceInHours'] as int
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        timezone:
            json.containsKey('Timezone') ? json['Timezone'] as String : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as List).map((e) => Tag.fromJson(e)).toList()
            : null,
      );
}

class DescribeStorediScsiVolumesOutput {
  /// Describes a single unit of output from DescribeStorediSCSIVolumes. The
  /// following fields are returned:
  ///
  /// *    **ChapEnabled**: Indicates whether mutual CHAP is enabled for the
  /// iSCSI target.
  ///
  /// *    **LunNumber**: The logical disk number.
  ///
  /// *    **NetworkInterfaceId**: The network interface ID of the stored volume
  /// that initiator use to map the stored volume as an iSCSI target.
  ///
  /// *    **NetworkInterfacePort**: The port used to communicate with iSCSI
  /// targets.
  ///
  /// *    **PreservedExistingData**: Indicates if when the stored volume was
  /// created, existing data on the underlying local disk was preserved.
  ///
  /// *    **SourceSnapshotId**: If the stored volume was created from a
  /// snapshot, this field contains the snapshot ID used, e.g. snap-1122aabb.
  /// Otherwise, this field is not included.
  ///
  /// *    **StorediSCSIVolumes**: An array of StorediSCSIVolume objects where
  /// each object contains metadata about one stored volume.
  ///
  /// *    **TargetARN**: The Amazon Resource Name (ARN) of the volume target.
  ///
  /// *    **VolumeARN**: The Amazon Resource Name (ARN) of the stored volume.
  ///
  /// *    **VolumeDiskId**: The disk ID of the local disk that was specified in
  /// the CreateStorediSCSIVolume operation.
  ///
  /// *    **VolumeId**: The unique identifier of the storage volume, e.g.
  /// vol-1122AABB.
  ///
  /// *    **VolumeiSCSIAttributes**: An VolumeiSCSIAttributes object that
  /// represents a collection of iSCSI attributes for one stored volume.
  ///
  /// *    **VolumeProgress**: Represents the percentage complete if the volume
  /// is restoring or bootstrapping that represents the percent of data
  /// transferred. This field does not appear in the response if the stored
  /// volume is not restoring or bootstrapping.
  ///
  /// *    **VolumeSizeInBytes**: The size of the volume in bytes.
  ///
  /// *    **VolumeStatus**: One of the `VolumeStatus` values that indicates the
  /// state of the volume.
  ///
  /// *    **VolumeType**: One of the enumeration values describing the type of
  /// the volume. Currently, on STORED volumes are supported.
  final List<StorediScsiVolume> storediScsiVolumes;

  DescribeStorediScsiVolumesOutput({
    this.storediScsiVolumes,
  });
  static DescribeStorediScsiVolumesOutput fromJson(Map<String, dynamic> json) =>
      DescribeStorediScsiVolumesOutput(
        storediScsiVolumes: json.containsKey('StorediSCSIVolumes')
            ? (json['StorediSCSIVolumes'] as List)
                .map((e) => StorediScsiVolume.fromJson(e))
                .toList()
            : null,
      );
}

/// DescribeTapeArchivesOutput
class DescribeTapeArchivesOutput {
  /// An array of virtual tape objects in the virtual tape shelf (VTS). The
  /// description includes of the Amazon Resource Name (ARN) of the virtual
  /// tapes. The information returned includes the Amazon Resource Names (ARNs)
  /// of the tapes, size of the tapes, status of the tapes, progress of the
  /// description and tape barcode.
  final List<TapeArchive> tapeArchives;

  /// An opaque string that indicates the position at which the virtual tapes
  /// that were fetched for description ended. Use this marker in your next
  /// request to fetch the next set of virtual tapes in the virtual tape shelf
  /// (VTS). If there are no more virtual tapes to describe, this field does not
  /// appear in the response.
  final String marker;

  DescribeTapeArchivesOutput({
    this.tapeArchives,
    this.marker,
  });
  static DescribeTapeArchivesOutput fromJson(Map<String, dynamic> json) =>
      DescribeTapeArchivesOutput(
        tapeArchives: json.containsKey('TapeArchives')
            ? (json['TapeArchives'] as List)
                .map((e) => TapeArchive.fromJson(e))
                .toList()
            : null,
        marker: json.containsKey('Marker') ? json['Marker'] as String : null,
      );
}

/// DescribeTapeRecoveryPointsOutput
class DescribeTapeRecoveryPointsOutput {
  final String gatewayArn;

  /// An array of TapeRecoveryPointInfos that are available for the specified
  /// gateway.
  final List<TapeRecoveryPointInfo> tapeRecoveryPointInfos;

  /// An opaque string that indicates the position at which the virtual tape
  /// recovery points that were listed for description ended.
  ///
  /// Use this marker in your next request to list the next set of virtual tape
  /// recovery points in the list. If there are no more recovery points to
  /// describe, this field does not appear in the response.
  final String marker;

  DescribeTapeRecoveryPointsOutput({
    this.gatewayArn,
    this.tapeRecoveryPointInfos,
    this.marker,
  });
  static DescribeTapeRecoveryPointsOutput fromJson(Map<String, dynamic> json) =>
      DescribeTapeRecoveryPointsOutput(
        gatewayArn: json.containsKey('GatewayARN')
            ? json['GatewayARN'] as String
            : null,
        tapeRecoveryPointInfos: json.containsKey('TapeRecoveryPointInfos')
            ? (json['TapeRecoveryPointInfos'] as List)
                .map((e) => TapeRecoveryPointInfo.fromJson(e))
                .toList()
            : null,
        marker: json.containsKey('Marker') ? json['Marker'] as String : null,
      );
}

/// DescribeTapesOutput
class DescribeTapesOutput {
  /// An array of virtual tape descriptions.
  final List<Tape> tapes;

  /// An opaque string which can be used as part of a subsequent DescribeTapes
  /// call to retrieve the next page of results.
  ///
  /// If a response does not contain a marker, then there are no more results to
  /// be retrieved.
  final String marker;

  DescribeTapesOutput({
    this.tapes,
    this.marker,
  });
  static DescribeTapesOutput fromJson(Map<String, dynamic> json) =>
      DescribeTapesOutput(
        tapes: json.containsKey('Tapes')
            ? (json['Tapes'] as List).map((e) => Tape.fromJson(e)).toList()
            : null,
        marker: json.containsKey('Marker') ? json['Marker'] as String : null,
      );
}

class DescribeUploadBufferOutput {
  final String gatewayArn;

  /// An array of the gateway's local disk IDs that are configured as working
  /// storage. Each local disk ID is specified as a string (minimum length of 1
  /// and maximum length of 300). If no local disks are configured as working
  /// storage, then the DiskIds array is empty.
  final List<String> diskIds;

  /// The total number of bytes being used in the gateway's upload buffer.
  final BigInt uploadBufferUsedInBytes;

  /// The total number of bytes allocated in the gateway's as upload buffer.
  final BigInt uploadBufferAllocatedInBytes;

  DescribeUploadBufferOutput({
    this.gatewayArn,
    this.diskIds,
    this.uploadBufferUsedInBytes,
    this.uploadBufferAllocatedInBytes,
  });
  static DescribeUploadBufferOutput fromJson(Map<String, dynamic> json) =>
      DescribeUploadBufferOutput(
        gatewayArn: json.containsKey('GatewayARN')
            ? json['GatewayARN'] as String
            : null,
        diskIds: json.containsKey('DiskIds')
            ? (json['DiskIds'] as List).map((e) => e as String).toList()
            : null,
        uploadBufferUsedInBytes: json.containsKey('UploadBufferUsedInBytes')
            ? BigInt.from(json['UploadBufferUsedInBytes'])
            : null,
        uploadBufferAllocatedInBytes:
            json.containsKey('UploadBufferAllocatedInBytes')
                ? BigInt.from(json['UploadBufferAllocatedInBytes'])
                : null,
      );
}

/// DescribeVTLDevicesOutput
class DescribeVtlDevicesOutput {
  final String gatewayArn;

  /// An array of VTL device objects composed of the Amazon Resource Name(ARN)
  /// of the VTL devices.
  final List<VtlDevice> vtlDevices;

  /// An opaque string that indicates the position at which the VTL devices that
  /// were fetched for description ended. Use the marker in your next request to
  /// fetch the next set of VTL devices in the list. If there are no more VTL
  /// devices to describe, this field does not appear in the response.
  final String marker;

  DescribeVtlDevicesOutput({
    this.gatewayArn,
    this.vtlDevices,
    this.marker,
  });
  static DescribeVtlDevicesOutput fromJson(Map<String, dynamic> json) =>
      DescribeVtlDevicesOutput(
        gatewayArn: json.containsKey('GatewayARN')
            ? json['GatewayARN'] as String
            : null,
        vtlDevices: json.containsKey('VTLDevices')
            ? (json['VTLDevices'] as List)
                .map((e) => VtlDevice.fromJson(e))
                .toList()
            : null,
        marker: json.containsKey('Marker') ? json['Marker'] as String : null,
      );
}

/// A JSON object containing the following fields:
class DescribeWorkingStorageOutput {
  final String gatewayArn;

  /// An array of the gateway's local disk IDs that are configured as working
  /// storage. Each local disk ID is specified as a string (minimum length of 1
  /// and maximum length of 300). If no local disks are configured as working
  /// storage, then the DiskIds array is empty.
  final List<String> diskIds;

  /// The total working storage in bytes in use by the gateway. If no working
  /// storage is configured for the gateway, this field returns 0.
  final BigInt workingStorageUsedInBytes;

  /// The total working storage in bytes allocated for the gateway. If no
  /// working storage is configured for the gateway, this field returns 0.
  final BigInt workingStorageAllocatedInBytes;

  DescribeWorkingStorageOutput({
    this.gatewayArn,
    this.diskIds,
    this.workingStorageUsedInBytes,
    this.workingStorageAllocatedInBytes,
  });
  static DescribeWorkingStorageOutput fromJson(Map<String, dynamic> json) =>
      DescribeWorkingStorageOutput(
        gatewayArn: json.containsKey('GatewayARN')
            ? json['GatewayARN'] as String
            : null,
        diskIds: json.containsKey('DiskIds')
            ? (json['DiskIds'] as List).map((e) => e as String).toList()
            : null,
        workingStorageUsedInBytes: json.containsKey('WorkingStorageUsedInBytes')
            ? BigInt.from(json['WorkingStorageUsedInBytes'])
            : null,
        workingStorageAllocatedInBytes:
            json.containsKey('WorkingStorageAllocatedInBytes')
                ? BigInt.from(json['WorkingStorageAllocatedInBytes'])
                : null,
      );
}

/// AttachVolumeOutput
class DetachVolumeOutput {
  /// The Amazon Resource Name (ARN) of the volume that was detached.
  final String volumeArn;

  DetachVolumeOutput({
    this.volumeArn,
  });
  static DetachVolumeOutput fromJson(Map<String, dynamic> json) =>
      DetachVolumeOutput(
        volumeArn:
            json.containsKey('VolumeARN') ? json['VolumeARN'] as String : null,
      );
}

/// Lists iSCSI information about a VTL device.
class DeviceiScsiAttributes {
  /// Specifies the unique Amazon Resource Name (ARN) that encodes the iSCSI
  /// qualified name(iqn) of a tape drive or media changer target.
  final String targetArn;

  /// The network interface identifier of the VTL device.
  final String networkInterfaceId;

  /// The port used to communicate with iSCSI VTL device targets.
  final int networkInterfacePort;

  /// Indicates whether mutual CHAP is enabled for the iSCSI target.
  final bool chapEnabled;

  DeviceiScsiAttributes({
    this.targetArn,
    this.networkInterfaceId,
    this.networkInterfacePort,
    this.chapEnabled,
  });
  static DeviceiScsiAttributes fromJson(Map<String, dynamic> json) =>
      DeviceiScsiAttributes(
        targetArn:
            json.containsKey('TargetARN') ? json['TargetARN'] as String : null,
        networkInterfaceId: json.containsKey('NetworkInterfaceId')
            ? json['NetworkInterfaceId'] as String
            : null,
        networkInterfacePort: json.containsKey('NetworkInterfacePort')
            ? json['NetworkInterfacePort'] as int
            : null,
        chapEnabled: json.containsKey('ChapEnabled')
            ? json['ChapEnabled'] as bool
            : null,
      );
}

/// DisableGatewayOutput
class DisableGatewayOutput {
  /// The unique Amazon Resource Name (ARN) of the disabled gateway.
  final String gatewayArn;

  DisableGatewayOutput({
    this.gatewayArn,
  });
  static DisableGatewayOutput fromJson(Map<String, dynamic> json) =>
      DisableGatewayOutput(
        gatewayArn: json.containsKey('GatewayARN')
            ? json['GatewayARN'] as String
            : null,
      );
}

/// Represents a gateway's local disk.
class Disk {
  /// The unique device ID or other distinguishing data that identifies a local
  /// disk.
  final String diskId;

  /// The path of a local disk in the gateway virtual machine (VM).
  final String diskPath;

  /// The device node of a local disk as assigned by the virtualization
  /// environment.
  final String diskNode;

  /// A value that represents the status of a local disk.
  final String diskStatus;

  /// The local disk size in bytes.
  final BigInt diskSizeInBytes;

  final String diskAllocationType;

  /// The iSCSI qualified name (IQN) that is defined for a disk. This field is
  /// not included in the response if the local disk is not defined as an iSCSI
  /// target. The format of this field is
  /// _targetIqn::LUNNumber::region-volumeId_.
  final String diskAllocationResource;

  final List<String> diskAttributeList;

  Disk({
    this.diskId,
    this.diskPath,
    this.diskNode,
    this.diskStatus,
    this.diskSizeInBytes,
    this.diskAllocationType,
    this.diskAllocationResource,
    this.diskAttributeList,
  });
  static Disk fromJson(Map<String, dynamic> json) => Disk(
        diskId: json.containsKey('DiskId') ? json['DiskId'] as String : null,
        diskPath:
            json.containsKey('DiskPath') ? json['DiskPath'] as String : null,
        diskNode:
            json.containsKey('DiskNode') ? json['DiskNode'] as String : null,
        diskStatus: json.containsKey('DiskStatus')
            ? json['DiskStatus'] as String
            : null,
        diskSizeInBytes: json.containsKey('DiskSizeInBytes')
            ? BigInt.from(json['DiskSizeInBytes'])
            : null,
        diskAllocationType: json.containsKey('DiskAllocationType')
            ? json['DiskAllocationType'] as String
            : null,
        diskAllocationResource: json.containsKey('DiskAllocationResource')
            ? json['DiskAllocationResource'] as String
            : null,
        diskAttributeList: json.containsKey('DiskAttributeList')
            ? (json['DiskAttributeList'] as List)
                .map((e) => e as String)
                .toList()
            : null,
      );
}

/// Describes a file share.
class FileShareInfo {
  final String fileShareType;

  final String fileShareArn;

  final String fileShareId;

  final String fileShareStatus;

  final String gatewayArn;

  FileShareInfo({
    this.fileShareType,
    this.fileShareArn,
    this.fileShareId,
    this.fileShareStatus,
    this.gatewayArn,
  });
  static FileShareInfo fromJson(Map<String, dynamic> json) => FileShareInfo(
        fileShareType: json.containsKey('FileShareType')
            ? json['FileShareType'] as String
            : null,
        fileShareArn: json.containsKey('FileShareARN')
            ? json['FileShareARN'] as String
            : null,
        fileShareId: json.containsKey('FileShareId')
            ? json['FileShareId'] as String
            : null,
        fileShareStatus: json.containsKey('FileShareStatus')
            ? json['FileShareStatus'] as String
            : null,
        gatewayArn: json.containsKey('GatewayARN')
            ? json['GatewayARN'] as String
            : null,
      );
}

/// Describes a gateway object.
class GatewayInfo {
  /// The unique identifier assigned to your gateway during activation. This ID
  /// becomes part of the gateway Amazon Resource Name (ARN), which you use as
  /// input for other operations.
  final String gatewayId;

  /// The Amazon Resource Name (ARN) of the gateway. Use the ListGateways
  /// operation to return a list of gateways for your account and AWS Region.
  final String gatewayArn;

  /// The type of the gateway.
  final String gatewayType;

  /// The state of the gateway.
  ///
  /// Valid Values: DISABLED or ACTIVE
  final String gatewayOperationalState;

  /// The name of the gateway.
  final String gatewayName;

  /// The ID of the Amazon EC2 instance that was used to launch the gateway.
  final String ec2InstanceId;

  /// The AWS Region where the Amazon EC2 instance is located.
  final String ec2InstanceRegion;

  GatewayInfo({
    this.gatewayId,
    this.gatewayArn,
    this.gatewayType,
    this.gatewayOperationalState,
    this.gatewayName,
    this.ec2InstanceId,
    this.ec2InstanceRegion,
  });
  static GatewayInfo fromJson(Map<String, dynamic> json) => GatewayInfo(
        gatewayId:
            json.containsKey('GatewayId') ? json['GatewayId'] as String : null,
        gatewayArn: json.containsKey('GatewayARN')
            ? json['GatewayARN'] as String
            : null,
        gatewayType: json.containsKey('GatewayType')
            ? json['GatewayType'] as String
            : null,
        gatewayOperationalState: json.containsKey('GatewayOperationalState')
            ? json['GatewayOperationalState'] as String
            : null,
        gatewayName: json.containsKey('GatewayName')
            ? json['GatewayName'] as String
            : null,
        ec2InstanceId: json.containsKey('Ec2InstanceId')
            ? json['Ec2InstanceId'] as String
            : null,
        ec2InstanceRegion: json.containsKey('Ec2InstanceRegion')
            ? json['Ec2InstanceRegion'] as String
            : null,
      );
}

/// JoinDomainOutput
class JoinDomainOutput {
  /// The unique Amazon Resource Name (ARN) of the gateway that joined the
  /// domain.
  final String gatewayArn;

  JoinDomainOutput({
    this.gatewayArn,
  });
  static JoinDomainOutput fromJson(Map<String, dynamic> json) =>
      JoinDomainOutput(
        gatewayArn: json.containsKey('GatewayARN')
            ? json['GatewayARN'] as String
            : null,
      );
}

/// ListFileShareOutput
class ListFileSharesOutput {
  /// If the request includes `Marker`, the response returns that value in this
  /// field.
  final String marker;

  /// If a value is present, there are more file shares to return. In a
  /// subsequent request, use `NextMarker` as the value for `Marker` to retrieve
  /// the next set of file shares.
  final String nextMarker;

  /// An array of information about the file gateway's file shares.
  final List<FileShareInfo> fileShareInfoList;

  ListFileSharesOutput({
    this.marker,
    this.nextMarker,
    this.fileShareInfoList,
  });
  static ListFileSharesOutput fromJson(Map<String, dynamic> json) =>
      ListFileSharesOutput(
        marker: json.containsKey('Marker') ? json['Marker'] as String : null,
        nextMarker: json.containsKey('NextMarker')
            ? json['NextMarker'] as String
            : null,
        fileShareInfoList: json.containsKey('FileShareInfoList')
            ? (json['FileShareInfoList'] as List)
                .map((e) => FileShareInfo.fromJson(e))
                .toList()
            : null,
      );
}

class ListGatewaysOutput {
  /// An array of GatewayInfo objects.
  final List<GatewayInfo> gateways;

  /// Use the marker in your next request to fetch the next set of gateways in
  /// the list. If there are no more gateways to list, this field does not
  /// appear in the response.
  final String marker;

  ListGatewaysOutput({
    this.gateways,
    this.marker,
  });
  static ListGatewaysOutput fromJson(Map<String, dynamic> json) =>
      ListGatewaysOutput(
        gateways: json.containsKey('Gateways')
            ? (json['Gateways'] as List)
                .map((e) => GatewayInfo.fromJson(e))
                .toList()
            : null,
        marker: json.containsKey('Marker') ? json['Marker'] as String : null,
      );
}

class ListLocalDisksOutput {
  final String gatewayArn;

  /// A JSON object containing the following fields:
  ///
  /// *    ListLocalDisksOutput$Disks
  final List<Disk> disks;

  ListLocalDisksOutput({
    this.gatewayArn,
    this.disks,
  });
  static ListLocalDisksOutput fromJson(Map<String, dynamic> json) =>
      ListLocalDisksOutput(
        gatewayArn: json.containsKey('GatewayARN')
            ? json['GatewayARN'] as String
            : null,
        disks: json.containsKey('Disks')
            ? (json['Disks'] as List).map((e) => Disk.fromJson(e)).toList()
            : null,
      );
}

/// ListTagsForResourceOutput
class ListTagsForResourceOutput {
  /// he Amazon Resource Name (ARN) of the resource for which you want to list
  /// tags.
  final String resourceArn;

  /// An opaque string that indicates the position at which to stop returning
  /// the list of tags.
  final String marker;

  /// An array that contains the tags for the specified resource.
  final List<Tag> tags;

  ListTagsForResourceOutput({
    this.resourceArn,
    this.marker,
    this.tags,
  });
  static ListTagsForResourceOutput fromJson(Map<String, dynamic> json) =>
      ListTagsForResourceOutput(
        resourceArn: json.containsKey('ResourceARN')
            ? json['ResourceARN'] as String
            : null,
        marker: json.containsKey('Marker') ? json['Marker'] as String : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as List).map((e) => Tag.fromJson(e)).toList()
            : null,
      );
}

/// A JSON object containing the following fields:
///
/// *    ListTapesOutput$Marker
///
/// *    ListTapesOutput$VolumeInfos
class ListTapesOutput {
  final List<TapeInfo> tapeInfos;

  /// A string that indicates the position at which to begin returning the next
  /// list of tapes. Use the marker in your next request to continue pagination
  /// of tapes. If there are no more tapes to list, this element does not appear
  /// in the response body.
  final String marker;

  ListTapesOutput({
    this.tapeInfos,
    this.marker,
  });
  static ListTapesOutput fromJson(Map<String, dynamic> json) => ListTapesOutput(
        tapeInfos: json.containsKey('TapeInfos')
            ? (json['TapeInfos'] as List)
                .map((e) => TapeInfo.fromJson(e))
                .toList()
            : null,
        marker: json.containsKey('Marker') ? json['Marker'] as String : null,
      );
}

/// ListVolumeInitiatorsOutput
class ListVolumeInitiatorsOutput {
  /// The host names and port numbers of all iSCSI initiators that are connected
  /// to the gateway.
  final List<String> initiators;

  ListVolumeInitiatorsOutput({
    this.initiators,
  });
  static ListVolumeInitiatorsOutput fromJson(Map<String, dynamic> json) =>
      ListVolumeInitiatorsOutput(
        initiators: json.containsKey('Initiators')
            ? (json['Initiators'] as List).map((e) => e as String).toList()
            : null,
      );
}

class ListVolumeRecoveryPointsOutput {
  final String gatewayArn;

  /// An array of VolumeRecoveryPointInfo objects.
  final List<VolumeRecoveryPointInfo> volumeRecoveryPointInfos;

  ListVolumeRecoveryPointsOutput({
    this.gatewayArn,
    this.volumeRecoveryPointInfos,
  });
  static ListVolumeRecoveryPointsOutput fromJson(Map<String, dynamic> json) =>
      ListVolumeRecoveryPointsOutput(
        gatewayArn: json.containsKey('GatewayARN')
            ? json['GatewayARN'] as String
            : null,
        volumeRecoveryPointInfos: json.containsKey('VolumeRecoveryPointInfos')
            ? (json['VolumeRecoveryPointInfos'] as List)
                .map((e) => VolumeRecoveryPointInfo.fromJson(e))
                .toList()
            : null,
      );
}

/// A JSON object containing the following fields:
///
/// *    ListVolumesOutput$Marker
///
/// *    ListVolumesOutput$VolumeInfos
class ListVolumesOutput {
  final String gatewayArn;

  /// Use the marker in your next request to continue pagination of iSCSI
  /// volumes. If there are no more volumes to list, this field does not appear
  /// in the response body.
  final String marker;

  /// An array of VolumeInfo objects, where each object describes an iSCSI
  /// volume. If no volumes are defined for the gateway, then `VolumeInfos` is
  /// an empty array "[]".
  final List<VolumeInfo> volumeInfos;

  ListVolumesOutput({
    this.gatewayArn,
    this.marker,
    this.volumeInfos,
  });
  static ListVolumesOutput fromJson(Map<String, dynamic> json) =>
      ListVolumesOutput(
        gatewayArn: json.containsKey('GatewayARN')
            ? json['GatewayARN'] as String
            : null,
        marker: json.containsKey('Marker') ? json['Marker'] as String : null,
        volumeInfos: json.containsKey('VolumeInfos')
            ? (json['VolumeInfos'] as List)
                .map((e) => VolumeInfo.fromJson(e))
                .toList()
            : null,
      );
}

/// Describes Network File System (NFS) file share default values. Files and
/// folders stored as Amazon S3 objects in S3 buckets don't, by default, have
/// Unix file permissions assigned to them. Upon discovery in an S3 bucket by
/// Storage Gateway, the S3 objects that represent files and folders are
/// assigned these default Unix permissions. This operation is only supported
/// for file gateways.
class NfsFileShareDefaults {
  /// The Unix file mode in the form "nnnn". For example, "0666" represents the
  /// default file mode inside the file share. The default value is 0666.
  final String fileMode;

  /// The Unix directory mode in the form "nnnn". For example, "0666" represents
  /// the default access mode for all directories inside the file share. The
  /// default value is 0777.
  final String directoryMode;

  /// The default group ID for the file share (unless the files have another
  /// group ID specified). The default value is nfsnobody.
  final BigInt groupId;

  /// The default owner ID for files in the file share (unless the files have
  /// another owner ID specified). The default value is nfsnobody.
  final BigInt ownerId;

  NfsFileShareDefaults({
    this.fileMode,
    this.directoryMode,
    this.groupId,
    this.ownerId,
  });
  static NfsFileShareDefaults fromJson(Map<String, dynamic> json) =>
      NfsFileShareDefaults(
        fileMode:
            json.containsKey('FileMode') ? json['FileMode'] as String : null,
        directoryMode: json.containsKey('DirectoryMode')
            ? json['DirectoryMode'] as String
            : null,
        groupId:
            json.containsKey('GroupId') ? BigInt.from(json['GroupId']) : null,
        ownerId:
            json.containsKey('OwnerId') ? BigInt.from(json['OwnerId']) : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The Unix file permissions and ownership information assigned, by default, to
/// native S3 objects when file gateway discovers them in S3 buckets. This
/// operation is only supported in file gateways.
class NfsFileShareInfo {
  final NfsFileShareDefaults nfsFileShareDefaults;

  final String fileShareArn;

  final String fileShareId;

  final String fileShareStatus;

  final String gatewayArn;

  /// True to use Amazon S3 server side encryption with your own AWS KMS key, or
  /// false to use a key managed by Amazon S3. Optional.
  final bool kmsEncrypted;

  final String kmsKey;

  final String path;

  final String role;

  final String locationArn;

  /// The default storage class for objects put into an Amazon S3 bucket by the
  /// file gateway. Possible values are `S3_STANDARD`, `S3_STANDARD_IA`, or
  /// `S3_ONEZONE_IA`. If this field is not populated, the default value
  /// `S3_STANDARD` is used. Optional.
  final String defaultStorageClass;

  final String objectAcl;

  final List<String> clientList;

  final String squash;

  /// A value that sets the write status of a file share. This value is true if
  /// the write status is read-only, and otherwise false.
  final bool readOnly;

  /// A value that enables guessing of the MIME type for uploaded objects based
  /// on file extensions. Set this value to true to enable MIME type guessing,
  /// and otherwise to false. The default value is true.
  final bool guessMimeTypeEnabled;

  /// A value that sets who pays the cost of the request and the cost associated
  /// with data download from the S3 bucket. If this value is set to true, the
  /// requester pays the costs. Otherwise the S3 bucket owner pays. However, the
  /// S3 bucket owner always pays the cost of storing data.
  ///
  ///   `RequesterPays` is a configuration for the S3 bucket that backs the file
  /// share, so make sure that the configuration on the file share is the same
  /// as the S3 bucket configuration.
  final bool requesterPays;

  /// A list of up to 50 tags assigned to the NFS file share, sorted
  /// alphabetically by key name. Each tag is a key-value pair. For a gateway
  /// with more than 10 tags assigned, you can view all tags using the
  /// `ListTagsForResource` API operation.
  final List<Tag> tags;

  NfsFileShareInfo({
    this.nfsFileShareDefaults,
    this.fileShareArn,
    this.fileShareId,
    this.fileShareStatus,
    this.gatewayArn,
    this.kmsEncrypted,
    this.kmsKey,
    this.path,
    this.role,
    this.locationArn,
    this.defaultStorageClass,
    this.objectAcl,
    this.clientList,
    this.squash,
    this.readOnly,
    this.guessMimeTypeEnabled,
    this.requesterPays,
    this.tags,
  });
  static NfsFileShareInfo fromJson(Map<String, dynamic> json) =>
      NfsFileShareInfo(
        nfsFileShareDefaults: json.containsKey('NFSFileShareDefaults')
            ? NfsFileShareDefaults.fromJson(json['NFSFileShareDefaults'])
            : null,
        fileShareArn: json.containsKey('FileShareARN')
            ? json['FileShareARN'] as String
            : null,
        fileShareId: json.containsKey('FileShareId')
            ? json['FileShareId'] as String
            : null,
        fileShareStatus: json.containsKey('FileShareStatus')
            ? json['FileShareStatus'] as String
            : null,
        gatewayArn: json.containsKey('GatewayARN')
            ? json['GatewayARN'] as String
            : null,
        kmsEncrypted: json.containsKey('KMSEncrypted')
            ? json['KMSEncrypted'] as bool
            : null,
        kmsKey: json.containsKey('KMSKey') ? json['KMSKey'] as String : null,
        path: json.containsKey('Path') ? json['Path'] as String : null,
        role: json.containsKey('Role') ? json['Role'] as String : null,
        locationArn: json.containsKey('LocationARN')
            ? json['LocationARN'] as String
            : null,
        defaultStorageClass: json.containsKey('DefaultStorageClass')
            ? json['DefaultStorageClass'] as String
            : null,
        objectAcl:
            json.containsKey('ObjectACL') ? json['ObjectACL'] as String : null,
        clientList: json.containsKey('ClientList')
            ? (json['ClientList'] as List).map((e) => e as String).toList()
            : null,
        squash: json.containsKey('Squash') ? json['Squash'] as String : null,
        readOnly:
            json.containsKey('ReadOnly') ? json['ReadOnly'] as bool : null,
        guessMimeTypeEnabled: json.containsKey('GuessMIMETypeEnabled')
            ? json['GuessMIMETypeEnabled'] as bool
            : null,
        requesterPays: json.containsKey('RequesterPays')
            ? json['RequesterPays'] as bool
            : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as List).map((e) => Tag.fromJson(e)).toList()
            : null,
      );
}

/// Describes a gateway's network interface.
class NetworkInterface {
  /// The Internet Protocol version 4 (IPv4) address of the interface.
  final String ipv4Address;

  /// The Media Access Control (MAC) address of the interface.
  ///
  ///
  ///
  /// This is currently unsupported and will not be returned in output.
  final String macAddress;

  /// The Internet Protocol version 6 (IPv6) address of the interface.
  /// _Currently not supported_.
  final String ipv6Address;

  NetworkInterface({
    this.ipv4Address,
    this.macAddress,
    this.ipv6Address,
  });
  static NetworkInterface fromJson(Map<String, dynamic> json) =>
      NetworkInterface(
        ipv4Address: json.containsKey('Ipv4Address')
            ? json['Ipv4Address'] as String
            : null,
        macAddress: json.containsKey('MacAddress')
            ? json['MacAddress'] as String
            : null,
        ipv6Address: json.containsKey('Ipv6Address')
            ? json['Ipv6Address'] as String
            : null,
      );
}

class NotifyWhenUploadedOutput {
  final String fileShareArn;

  final String notificationId;

  NotifyWhenUploadedOutput({
    this.fileShareArn,
    this.notificationId,
  });
  static NotifyWhenUploadedOutput fromJson(Map<String, dynamic> json) =>
      NotifyWhenUploadedOutput(
        fileShareArn: json.containsKey('FileShareARN')
            ? json['FileShareARN'] as String
            : null,
        notificationId: json.containsKey('NotificationId')
            ? json['NotificationId'] as String
            : null,
      );
}

/// RefreshCacheOutput
class RefreshCacheOutput {
  final String fileShareArn;

  final String notificationId;

  RefreshCacheOutput({
    this.fileShareArn,
    this.notificationId,
  });
  static RefreshCacheOutput fromJson(Map<String, dynamic> json) =>
      RefreshCacheOutput(
        fileShareArn: json.containsKey('FileShareARN')
            ? json['FileShareARN'] as String
            : null,
        notificationId: json.containsKey('NotificationId')
            ? json['NotificationId'] as String
            : null,
      );
}

/// RemoveTagsFromResourceOutput
class RemoveTagsFromResourceOutput {
  /// The Amazon Resource Name (ARN) of the resource that the tags were removed
  /// from.
  final String resourceArn;

  RemoveTagsFromResourceOutput({
    this.resourceArn,
  });
  static RemoveTagsFromResourceOutput fromJson(Map<String, dynamic> json) =>
      RemoveTagsFromResourceOutput(
        resourceArn: json.containsKey('ResourceARN')
            ? json['ResourceARN'] as String
            : null,
      );
}

class ResetCacheOutput {
  final String gatewayArn;

  ResetCacheOutput({
    this.gatewayArn,
  });
  static ResetCacheOutput fromJson(Map<String, dynamic> json) =>
      ResetCacheOutput(
        gatewayArn: json.containsKey('GatewayARN')
            ? json['GatewayARN'] as String
            : null,
      );
}

/// RetrieveTapeArchiveOutput
class RetrieveTapeArchiveOutput {
  /// The Amazon Resource Name (ARN) of the retrieved virtual tape.
  final String tapeArn;

  RetrieveTapeArchiveOutput({
    this.tapeArn,
  });
  static RetrieveTapeArchiveOutput fromJson(Map<String, dynamic> json) =>
      RetrieveTapeArchiveOutput(
        tapeArn: json.containsKey('TapeARN') ? json['TapeARN'] as String : null,
      );
}

/// RetrieveTapeRecoveryPointOutput
class RetrieveTapeRecoveryPointOutput {
  /// The Amazon Resource Name (ARN) of the virtual tape for which the recovery
  /// point was retrieved.
  final String tapeArn;

  RetrieveTapeRecoveryPointOutput({
    this.tapeArn,
  });
  static RetrieveTapeRecoveryPointOutput fromJson(Map<String, dynamic> json) =>
      RetrieveTapeRecoveryPointOutput(
        tapeArn: json.containsKey('TapeARN') ? json['TapeARN'] as String : null,
      );
}

/// The Windows file permissions and ownership information assigned, by default,
/// to native S3 objects when file gateway discovers them in S3 buckets. This
/// operation is only supported for file gateways.
class SmbFileShareInfo {
  final String fileShareArn;

  final String fileShareId;

  final String fileShareStatus;

  final String gatewayArn;

  /// True to use Amazon S3 server-side encryption with your own AWS KMS key, or
  /// false to use a key managed by Amazon S3. Optional.
  final bool kmsEncrypted;

  final String kmsKey;

  /// The file share path used by the SMB client to identify the mount point.
  final String path;

  final String role;

  final String locationArn;

  /// The default storage class for objects put into an Amazon S3 bucket by the
  /// file gateway. Possible values are `S3_STANDARD`, `S3_STANDARD_IA`, or
  /// `S3_ONEZONE_IA`. If this field is not populated, the default value
  /// `S3_STANDARD` is used. Optional.
  final String defaultStorageClass;

  final String objectAcl;

  /// A value that sets the write status of a file share. This value is true if
  /// the write status is read-only, and otherwise false.
  final bool readOnly;

  /// A value that enables guessing of the MIME type for uploaded objects based
  /// on file extensions. Set this value to true to enable MIME type guessing,
  /// and otherwise to false. The default value is true.
  final bool guessMimeTypeEnabled;

  /// A value that sets who pays the cost of the request and the cost associated
  /// with data download from the S3 bucket. If this value is set to true, the
  /// requester pays the costs. Otherwise the S3 bucket owner pays. However, the
  /// S3 bucket owner always pays the cost of storing data.
  ///
  ///   `RequesterPays` is a configuration for the S3 bucket that backs the file
  /// share, so make sure that the configuration on the file share is the same
  /// as the S3 bucket configuration.
  final bool requesterPays;

  /// If this value is set to "true", indicates that ACL (access control list)
  /// is enabled on the SMB file share. If it is set to "false", it indicates
  /// that file and directory permissions are mapped to the POSIX permission.
  ///
  /// For more information, see
  /// https://docs.aws.amazon.com/storagegateway/latest/userguide/smb-acl.html
  /// in the Storage Gateway User Guide.
  final bool smbaclEnabled;

  /// A list of users or groups in the Active Directory that have administrator
  /// rights to the file share. A group must be prefixed with the @ character.
  /// For example `@group1`. Can only be set if Authentication is set to
  /// `ActiveDirectory`.
  final List<String> adminUserList;

  /// A list of users or groups in the Active Directory that are allowed to
  /// access the file share. A group must be prefixed with the @ character. For
  /// example `@group1`. Can only be set if Authentication is set to
  /// `ActiveDirectory`.
  final List<String> validUserList;

  /// A list of users or groups in the Active Directory that are not allowed to
  /// access the file share. A group must be prefixed with the @ character. For
  /// example `@group1`. Can only be set if Authentication is set to
  /// `ActiveDirectory`.
  final List<String> invalidUserList;

  final String authentication;

  /// A list of up to 50 tags assigned to the SMB file share, sorted
  /// alphabetically by key name. Each tag is a key-value pair. For a gateway
  /// with more than 10 tags assigned, you can view all tags using the
  /// `ListTagsForResource` API operation.
  final List<Tag> tags;

  SmbFileShareInfo({
    this.fileShareArn,
    this.fileShareId,
    this.fileShareStatus,
    this.gatewayArn,
    this.kmsEncrypted,
    this.kmsKey,
    this.path,
    this.role,
    this.locationArn,
    this.defaultStorageClass,
    this.objectAcl,
    this.readOnly,
    this.guessMimeTypeEnabled,
    this.requesterPays,
    this.smbaclEnabled,
    this.adminUserList,
    this.validUserList,
    this.invalidUserList,
    this.authentication,
    this.tags,
  });
  static SmbFileShareInfo fromJson(Map<String, dynamic> json) =>
      SmbFileShareInfo(
        fileShareArn: json.containsKey('FileShareARN')
            ? json['FileShareARN'] as String
            : null,
        fileShareId: json.containsKey('FileShareId')
            ? json['FileShareId'] as String
            : null,
        fileShareStatus: json.containsKey('FileShareStatus')
            ? json['FileShareStatus'] as String
            : null,
        gatewayArn: json.containsKey('GatewayARN')
            ? json['GatewayARN'] as String
            : null,
        kmsEncrypted: json.containsKey('KMSEncrypted')
            ? json['KMSEncrypted'] as bool
            : null,
        kmsKey: json.containsKey('KMSKey') ? json['KMSKey'] as String : null,
        path: json.containsKey('Path') ? json['Path'] as String : null,
        role: json.containsKey('Role') ? json['Role'] as String : null,
        locationArn: json.containsKey('LocationARN')
            ? json['LocationARN'] as String
            : null,
        defaultStorageClass: json.containsKey('DefaultStorageClass')
            ? json['DefaultStorageClass'] as String
            : null,
        objectAcl:
            json.containsKey('ObjectACL') ? json['ObjectACL'] as String : null,
        readOnly:
            json.containsKey('ReadOnly') ? json['ReadOnly'] as bool : null,
        guessMimeTypeEnabled: json.containsKey('GuessMIMETypeEnabled')
            ? json['GuessMIMETypeEnabled'] as bool
            : null,
        requesterPays: json.containsKey('RequesterPays')
            ? json['RequesterPays'] as bool
            : null,
        smbaclEnabled: json.containsKey('SMBACLEnabled')
            ? json['SMBACLEnabled'] as bool
            : null,
        adminUserList: json.containsKey('AdminUserList')
            ? (json['AdminUserList'] as List).map((e) => e as String).toList()
            : null,
        validUserList: json.containsKey('ValidUserList')
            ? (json['ValidUserList'] as List).map((e) => e as String).toList()
            : null,
        invalidUserList: json.containsKey('InvalidUserList')
            ? (json['InvalidUserList'] as List).map((e) => e as String).toList()
            : null,
        authentication: json.containsKey('Authentication')
            ? json['Authentication'] as String
            : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as List).map((e) => Tag.fromJson(e)).toList()
            : null,
      );
}

class SetLocalConsolePasswordOutput {
  final String gatewayArn;

  SetLocalConsolePasswordOutput({
    this.gatewayArn,
  });
  static SetLocalConsolePasswordOutput fromJson(Map<String, dynamic> json) =>
      SetLocalConsolePasswordOutput(
        gatewayArn: json.containsKey('GatewayARN')
            ? json['GatewayARN'] as String
            : null,
      );
}

class SetSmbGuestPasswordOutput {
  final String gatewayArn;

  SetSmbGuestPasswordOutput({
    this.gatewayArn,
  });
  static SetSmbGuestPasswordOutput fromJson(Map<String, dynamic> json) =>
      SetSmbGuestPasswordOutput(
        gatewayArn: json.containsKey('GatewayARN')
            ? json['GatewayARN'] as String
            : null,
      );
}

/// A JSON object containing the of the gateway that was shut down.
class ShutdownGatewayOutput {
  final String gatewayArn;

  ShutdownGatewayOutput({
    this.gatewayArn,
  });
  static ShutdownGatewayOutput fromJson(Map<String, dynamic> json) =>
      ShutdownGatewayOutput(
        gatewayArn: json.containsKey('GatewayARN')
            ? json['GatewayARN'] as String
            : null,
      );
}

/// A JSON object containing the of the gateway that was restarted.
class StartGatewayOutput {
  final String gatewayArn;

  StartGatewayOutput({
    this.gatewayArn,
  });
  static StartGatewayOutput fromJson(Map<String, dynamic> json) =>
      StartGatewayOutput(
        gatewayArn: json.containsKey('GatewayARN')
            ? json['GatewayARN'] as String
            : null,
      );
}

/// Describes an iSCSI stored volume.
class StorediScsiVolume {
  /// The Amazon Resource Name (ARN) of the storage volume.
  final String volumeArn;

  /// The unique identifier of the volume, e.g. vol-AE4B946D.
  final String volumeId;

  /// One of the VolumeType enumeration values describing the type of the
  /// volume.
  final String volumeType;

  /// One of the VolumeStatus values that indicates the state of the storage
  /// volume.
  final String volumeStatus;

  /// A value that indicates whether a storage volume is attached to, detached
  /// from, or is in the process of detaching from a gateway. For more
  /// information, see
  /// [Moving Your Volumes to a Different Gateway](https://docs.aws.amazon.com/storagegateway/latest/userguide/managing-volumes.html#attach-detach-volume).
  final String volumeAttachmentStatus;

  /// The size of the volume in bytes.
  final BigInt volumeSizeInBytes;

  /// Represents the percentage complete if the volume is restoring or
  /// bootstrapping that represents the percent of data transferred. This field
  /// does not appear in the response if the stored volume is not restoring or
  /// bootstrapping.
  final double volumeProgress;

  /// The ID of the local disk that was specified in the CreateStorediSCSIVolume
  /// operation.
  final String volumeDiskId;

  /// If the stored volume was created from a snapshot, this field contains the
  /// snapshot ID used, e.g. snap-78e22663. Otherwise, this field is not
  /// included.
  final String sourceSnapshotId;

  /// Indicates if when the stored volume was created, existing data on the
  /// underlying local disk was preserved.
  ///
  ///  Valid Values: true, false
  final bool preservedExistingData;

  /// An VolumeiSCSIAttributes object that represents a collection of iSCSI
  /// attributes for one stored volume.
  final VolumeiScsiAttributes volumeiScsiAttributes;

  /// The date the volume was created. Volumes created prior to March 28, 2017
  /// don’t have this time stamp.
  final DateTime createdDate;

  /// The size of the data stored on the volume in bytes. This value is
  /// calculated based on the number of blocks that are touched, instead of the
  /// actual amount of data written. This value can be useful for sequential
  /// write patterns but less accurate for random write patterns.
  /// `VolumeUsedInBytes` is different from the compressed size of the volume,
  /// which is the value that is used to calculate your bill.
  ///
  ///
  ///
  /// This value is not available for volumes created prior to May 13, 2015,
  /// until you store data on the volume.
  final BigInt volumeUsedInBytes;

  final String kmsKey;

  /// The name of the iSCSI target used by an initiator to connect to a volume
  /// and used as a suffix for the target ARN. For example, specifying
  /// `TargetName` as _myvolume_ results in the target ARN of
  /// `arn:aws:storagegateway:us-east-2:111122223333:gateway/sgw-12A3456B/target/iqn.1997-05.com.amazon:myvolume`.
  /// The target name must be unique across all volumes on a gateway.
  ///
  /// If you don't specify a value, Storage Gateway uses the value that was
  /// previously used for this volume as the new target name.
  final String targetName;

  StorediScsiVolume({
    this.volumeArn,
    this.volumeId,
    this.volumeType,
    this.volumeStatus,
    this.volumeAttachmentStatus,
    this.volumeSizeInBytes,
    this.volumeProgress,
    this.volumeDiskId,
    this.sourceSnapshotId,
    this.preservedExistingData,
    this.volumeiScsiAttributes,
    this.createdDate,
    this.volumeUsedInBytes,
    this.kmsKey,
    this.targetName,
  });
  static StorediScsiVolume fromJson(Map<String, dynamic> json) =>
      StorediScsiVolume(
        volumeArn:
            json.containsKey('VolumeARN') ? json['VolumeARN'] as String : null,
        volumeId:
            json.containsKey('VolumeId') ? json['VolumeId'] as String : null,
        volumeType: json.containsKey('VolumeType')
            ? json['VolumeType'] as String
            : null,
        volumeStatus: json.containsKey('VolumeStatus')
            ? json['VolumeStatus'] as String
            : null,
        volumeAttachmentStatus: json.containsKey('VolumeAttachmentStatus')
            ? json['VolumeAttachmentStatus'] as String
            : null,
        volumeSizeInBytes: json.containsKey('VolumeSizeInBytes')
            ? BigInt.from(json['VolumeSizeInBytes'])
            : null,
        volumeProgress: json.containsKey('VolumeProgress')
            ? json['VolumeProgress'] as double
            : null,
        volumeDiskId: json.containsKey('VolumeDiskId')
            ? json['VolumeDiskId'] as String
            : null,
        sourceSnapshotId: json.containsKey('SourceSnapshotId')
            ? json['SourceSnapshotId'] as String
            : null,
        preservedExistingData: json.containsKey('PreservedExistingData')
            ? json['PreservedExistingData'] as bool
            : null,
        volumeiScsiAttributes: json.containsKey('VolumeiSCSIAttributes')
            ? VolumeiScsiAttributes.fromJson(json['VolumeiSCSIAttributes'])
            : null,
        createdDate: json.containsKey('CreatedDate')
            ? DateTime.parse(json['CreatedDate'])
            : null,
        volumeUsedInBytes: json.containsKey('VolumeUsedInBytes')
            ? BigInt.from(json['VolumeUsedInBytes'])
            : null,
        kmsKey: json.containsKey('KMSKey') ? json['KMSKey'] as String : null,
        targetName: json.containsKey('TargetName')
            ? json['TargetName'] as String
            : null,
      );
}

/// A key-value pair that helps you manage, filter, and search for your
/// resource. Allowed characters: letters, white space, and numbers,
/// representable in UTF-8, and the following characters: + - = . _ : /
class Tag {
  /// Tag key (String). The key can't start with aws:.
  final String key;

  /// Value of the tag key.
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

/// Describes a virtual tape object.
class Tape {
  /// The Amazon Resource Name (ARN) of the virtual tape.
  final String tapeArn;

  /// The barcode that identifies a specific virtual tape.
  final String tapeBarcode;

  /// The date the virtual tape was created.
  final DateTime tapeCreatedDate;

  /// The size, in bytes, of the virtual tape capacity.
  final BigInt tapeSizeInBytes;

  /// The current state of the virtual tape.
  final String tapeStatus;

  /// The virtual tape library (VTL) device that the virtual tape is associated
  /// with.
  final String vtlDevice;

  /// For archiving virtual tapes, indicates how much data remains to be
  /// uploaded before archiving is complete.
  ///
  /// Range: 0 (not started) to 100 (complete).
  final double progress;

  /// The size, in bytes, of data stored on the virtual tape.
  ///
  ///
  ///
  /// This value is not available for tapes created prior to May 13, 2015.
  final BigInt tapeUsedInBytes;

  final String kmsKey;

  /// The ID of the pool that contains tapes that will be archived. The tapes in
  /// this pool are archived in the S3 storage class that is associated with the
  /// pool. When you use your backup application to eject the tape, the tape is
  /// archived directly into the storage class (Glacier or Deep Archive) that
  /// corresponds to the pool.
  ///
  /// Valid values: "GLACIER", "DEEP_ARCHIVE"
  final String poolId;

  Tape({
    this.tapeArn,
    this.tapeBarcode,
    this.tapeCreatedDate,
    this.tapeSizeInBytes,
    this.tapeStatus,
    this.vtlDevice,
    this.progress,
    this.tapeUsedInBytes,
    this.kmsKey,
    this.poolId,
  });
  static Tape fromJson(Map<String, dynamic> json) => Tape(
        tapeArn: json.containsKey('TapeARN') ? json['TapeARN'] as String : null,
        tapeBarcode: json.containsKey('TapeBarcode')
            ? json['TapeBarcode'] as String
            : null,
        tapeCreatedDate: json.containsKey('TapeCreatedDate')
            ? DateTime.parse(json['TapeCreatedDate'])
            : null,
        tapeSizeInBytes: json.containsKey('TapeSizeInBytes')
            ? BigInt.from(json['TapeSizeInBytes'])
            : null,
        tapeStatus: json.containsKey('TapeStatus')
            ? json['TapeStatus'] as String
            : null,
        vtlDevice:
            json.containsKey('VTLDevice') ? json['VTLDevice'] as String : null,
        progress:
            json.containsKey('Progress') ? json['Progress'] as double : null,
        tapeUsedInBytes: json.containsKey('TapeUsedInBytes')
            ? BigInt.from(json['TapeUsedInBytes'])
            : null,
        kmsKey: json.containsKey('KMSKey') ? json['KMSKey'] as String : null,
        poolId: json.containsKey('PoolId') ? json['PoolId'] as String : null,
      );
}

/// Represents a virtual tape that is archived in the virtual tape shelf (VTS).
class TapeArchive {
  /// The Amazon Resource Name (ARN) of an archived virtual tape.
  final String tapeArn;

  /// The barcode that identifies the archived virtual tape.
  final String tapeBarcode;

  /// The date the virtual tape was created.
  final DateTime tapeCreatedDate;

  /// The size, in bytes, of the archived virtual tape.
  final BigInt tapeSizeInBytes;

  /// The time that the archiving of the virtual tape was completed.
  ///
  /// The default time stamp format is in the ISO8601 extended
  /// YYYY-MM-DD'T'HH:MM:SS'Z' format.
  final DateTime completionTime;

  /// The Amazon Resource Name (ARN) of the tape gateway that the virtual tape
  /// is being retrieved to.
  ///
  /// The virtual tape is retrieved from the virtual tape shelf (VTS).
  final String retrievedTo;

  /// The current state of the archived virtual tape.
  final String tapeStatus;

  /// The size, in bytes, of data stored on the virtual tape.
  ///
  ///
  ///
  /// This value is not available for tapes created prior to May 13, 2015.
  final BigInt tapeUsedInBytes;

  final String kmsKey;

  /// The ID of the pool that was used to archive the tape. The tapes in this
  /// pool are archived in the S3 storage class that is associated with the
  /// pool.
  ///
  /// Valid values: "GLACIER", "DEEP_ARCHIVE"
  final String poolId;

  TapeArchive({
    this.tapeArn,
    this.tapeBarcode,
    this.tapeCreatedDate,
    this.tapeSizeInBytes,
    this.completionTime,
    this.retrievedTo,
    this.tapeStatus,
    this.tapeUsedInBytes,
    this.kmsKey,
    this.poolId,
  });
  static TapeArchive fromJson(Map<String, dynamic> json) => TapeArchive(
        tapeArn: json.containsKey('TapeARN') ? json['TapeARN'] as String : null,
        tapeBarcode: json.containsKey('TapeBarcode')
            ? json['TapeBarcode'] as String
            : null,
        tapeCreatedDate: json.containsKey('TapeCreatedDate')
            ? DateTime.parse(json['TapeCreatedDate'])
            : null,
        tapeSizeInBytes: json.containsKey('TapeSizeInBytes')
            ? BigInt.from(json['TapeSizeInBytes'])
            : null,
        completionTime: json.containsKey('CompletionTime')
            ? DateTime.parse(json['CompletionTime'])
            : null,
        retrievedTo: json.containsKey('RetrievedTo')
            ? json['RetrievedTo'] as String
            : null,
        tapeStatus: json.containsKey('TapeStatus')
            ? json['TapeStatus'] as String
            : null,
        tapeUsedInBytes: json.containsKey('TapeUsedInBytes')
            ? BigInt.from(json['TapeUsedInBytes'])
            : null,
        kmsKey: json.containsKey('KMSKey') ? json['KMSKey'] as String : null,
        poolId: json.containsKey('PoolId') ? json['PoolId'] as String : null,
      );
}

/// Describes a virtual tape.
class TapeInfo {
  /// The Amazon Resource Name (ARN) of a virtual tape.
  final String tapeArn;

  /// The barcode that identifies a specific virtual tape.
  final String tapeBarcode;

  /// The size, in bytes, of a virtual tape.
  final BigInt tapeSizeInBytes;

  /// The status of the tape.
  final String tapeStatus;

  /// The Amazon Resource Name (ARN) of the gateway. Use the ListGateways
  /// operation to return a list of gateways for your account and AWS Region.
  final String gatewayArn;

  /// The ID of the pool that you want to add your tape to for archiving. The
  /// tape in this pool is archived in the S3 storage class that is associated
  /// with the pool. When you use your backup application to eject the tape, the
  /// tape is archived directly into the storage class (Glacier or Deep Archive)
  /// that corresponds to the pool.
  ///
  /// Valid values: "GLACIER", "DEEP_ARCHIVE"
  final String poolId;

  TapeInfo({
    this.tapeArn,
    this.tapeBarcode,
    this.tapeSizeInBytes,
    this.tapeStatus,
    this.gatewayArn,
    this.poolId,
  });
  static TapeInfo fromJson(Map<String, dynamic> json) => TapeInfo(
        tapeArn: json.containsKey('TapeARN') ? json['TapeARN'] as String : null,
        tapeBarcode: json.containsKey('TapeBarcode')
            ? json['TapeBarcode'] as String
            : null,
        tapeSizeInBytes: json.containsKey('TapeSizeInBytes')
            ? BigInt.from(json['TapeSizeInBytes'])
            : null,
        tapeStatus: json.containsKey('TapeStatus')
            ? json['TapeStatus'] as String
            : null,
        gatewayArn: json.containsKey('GatewayARN')
            ? json['GatewayARN'] as String
            : null,
        poolId: json.containsKey('PoolId') ? json['PoolId'] as String : null,
      );
}

/// Describes a recovery point.
class TapeRecoveryPointInfo {
  /// The Amazon Resource Name (ARN) of the virtual tape.
  final String tapeArn;

  /// The time when the point-in-time view of the virtual tape was replicated
  /// for later recovery.
  ///
  /// The default time stamp format of the tape recovery point time is in the
  /// ISO8601 extended YYYY-MM-DD'T'HH:MM:SS'Z' format.
  final DateTime tapeRecoveryPointTime;

  /// The size, in bytes, of the virtual tapes to recover.
  final BigInt tapeSizeInBytes;

  /// The status of the virtual tapes.
  final String tapeStatus;

  TapeRecoveryPointInfo({
    this.tapeArn,
    this.tapeRecoveryPointTime,
    this.tapeSizeInBytes,
    this.tapeStatus,
  });
  static TapeRecoveryPointInfo fromJson(Map<String, dynamic> json) =>
      TapeRecoveryPointInfo(
        tapeArn: json.containsKey('TapeARN') ? json['TapeARN'] as String : null,
        tapeRecoveryPointTime: json.containsKey('TapeRecoveryPointTime')
            ? DateTime.parse(json['TapeRecoveryPointTime'])
            : null,
        tapeSizeInBytes: json.containsKey('TapeSizeInBytes')
            ? BigInt.from(json['TapeSizeInBytes'])
            : null,
        tapeStatus: json.containsKey('TapeStatus')
            ? json['TapeStatus'] as String
            : null,
      );
}

/// A JSON object containing the of the gateway whose throttle information was
/// updated.
class UpdateBandwidthRateLimitOutput {
  final String gatewayArn;

  UpdateBandwidthRateLimitOutput({
    this.gatewayArn,
  });
  static UpdateBandwidthRateLimitOutput fromJson(Map<String, dynamic> json) =>
      UpdateBandwidthRateLimitOutput(
        gatewayArn: json.containsKey('GatewayARN')
            ? json['GatewayARN'] as String
            : null,
      );
}

/// A JSON object containing the following fields:
class UpdateChapCredentialsOutput {
  /// The Amazon Resource Name (ARN) of the target. This is the same target
  /// specified in the request.
  final String targetArn;

  /// The iSCSI initiator that connects to the target. This is the same
  /// initiator name specified in the request.
  final String initiatorName;

  UpdateChapCredentialsOutput({
    this.targetArn,
    this.initiatorName,
  });
  static UpdateChapCredentialsOutput fromJson(Map<String, dynamic> json) =>
      UpdateChapCredentialsOutput(
        targetArn:
            json.containsKey('TargetARN') ? json['TargetARN'] as String : null,
        initiatorName: json.containsKey('InitiatorName')
            ? json['InitiatorName'] as String
            : null,
      );
}

/// A JSON object containing the ARN of the gateway that was updated.
class UpdateGatewayInformationOutput {
  final String gatewayArn;

  /// The name you configured for your gateway.
  final String gatewayName;

  UpdateGatewayInformationOutput({
    this.gatewayArn,
    this.gatewayName,
  });
  static UpdateGatewayInformationOutput fromJson(Map<String, dynamic> json) =>
      UpdateGatewayInformationOutput(
        gatewayArn: json.containsKey('GatewayARN')
            ? json['GatewayARN'] as String
            : null,
        gatewayName: json.containsKey('GatewayName')
            ? json['GatewayName'] as String
            : null,
      );
}

/// A JSON object containing the of the gateway that was updated.
class UpdateGatewaySoftwareNowOutput {
  final String gatewayArn;

  UpdateGatewaySoftwareNowOutput({
    this.gatewayArn,
  });
  static UpdateGatewaySoftwareNowOutput fromJson(Map<String, dynamic> json) =>
      UpdateGatewaySoftwareNowOutput(
        gatewayArn: json.containsKey('GatewayARN')
            ? json['GatewayARN'] as String
            : null,
      );
}

/// A JSON object containing the of the gateway whose maintenance start time is
/// updated.
class UpdateMaintenanceStartTimeOutput {
  final String gatewayArn;

  UpdateMaintenanceStartTimeOutput({
    this.gatewayArn,
  });
  static UpdateMaintenanceStartTimeOutput fromJson(Map<String, dynamic> json) =>
      UpdateMaintenanceStartTimeOutput(
        gatewayArn: json.containsKey('GatewayARN')
            ? json['GatewayARN'] as String
            : null,
      );
}

/// UpdateNFSFileShareOutput
class UpdateNfsFileShareOutput {
  /// The Amazon Resource Name (ARN) of the updated file share.
  final String fileShareArn;

  UpdateNfsFileShareOutput({
    this.fileShareArn,
  });
  static UpdateNfsFileShareOutput fromJson(Map<String, dynamic> json) =>
      UpdateNfsFileShareOutput(
        fileShareArn: json.containsKey('FileShareARN')
            ? json['FileShareARN'] as String
            : null,
      );
}

/// UpdateSMBFileShareOutput
class UpdateSmbFileShareOutput {
  /// The Amazon Resource Name (ARN) of the updated SMB file share.
  final String fileShareArn;

  UpdateSmbFileShareOutput({
    this.fileShareArn,
  });
  static UpdateSmbFileShareOutput fromJson(Map<String, dynamic> json) =>
      UpdateSmbFileShareOutput(
        fileShareArn: json.containsKey('FileShareARN')
            ? json['FileShareARN'] as String
            : null,
      );
}

class UpdateSmbSecurityStrategyOutput {
  final String gatewayArn;

  UpdateSmbSecurityStrategyOutput({
    this.gatewayArn,
  });
  static UpdateSmbSecurityStrategyOutput fromJson(Map<String, dynamic> json) =>
      UpdateSmbSecurityStrategyOutput(
        gatewayArn: json.containsKey('GatewayARN')
            ? json['GatewayARN'] as String
            : null,
      );
}

/// A JSON object containing the of the updated storage volume.
class UpdateSnapshotScheduleOutput {
  /// The Amazon Resource Name (ARN) of the volume. Use the ListVolumes
  /// operation to return a list of gateway volumes.
  final String volumeArn;

  UpdateSnapshotScheduleOutput({
    this.volumeArn,
  });
  static UpdateSnapshotScheduleOutput fromJson(Map<String, dynamic> json) =>
      UpdateSnapshotScheduleOutput(
        volumeArn:
            json.containsKey('VolumeARN') ? json['VolumeARN'] as String : null,
      );
}

/// UpdateVTLDeviceTypeOutput
class UpdateVtlDeviceTypeOutput {
  /// The Amazon Resource Name (ARN) of the medium changer you have selected.
  final String vtlDeviceArn;

  UpdateVtlDeviceTypeOutput({
    this.vtlDeviceArn,
  });
  static UpdateVtlDeviceTypeOutput fromJson(Map<String, dynamic> json) =>
      UpdateVtlDeviceTypeOutput(
        vtlDeviceArn: json.containsKey('VTLDeviceARN')
            ? json['VTLDeviceARN'] as String
            : null,
      );
}

/// Represents a device object associated with a tape gateway.
class VtlDevice {
  /// Specifies the unique Amazon Resource Name (ARN) of the device (tape drive
  /// or media changer).
  final String vtlDeviceArn;

  /// Specifies the type of device that the VTL device emulates.
  final String vtlDeviceType;

  /// Specifies the vendor of the device that the VTL device object emulates.
  final String vtlDeviceVendor;

  /// Specifies the model number of device that the VTL device emulates.
  final String vtlDeviceProductIdentifier;

  /// A list of iSCSI information about a VTL device.
  final DeviceiScsiAttributes deviceiScsiAttributes;

  VtlDevice({
    this.vtlDeviceArn,
    this.vtlDeviceType,
    this.vtlDeviceVendor,
    this.vtlDeviceProductIdentifier,
    this.deviceiScsiAttributes,
  });
  static VtlDevice fromJson(Map<String, dynamic> json) => VtlDevice(
        vtlDeviceArn: json.containsKey('VTLDeviceARN')
            ? json['VTLDeviceARN'] as String
            : null,
        vtlDeviceType: json.containsKey('VTLDeviceType')
            ? json['VTLDeviceType'] as String
            : null,
        vtlDeviceVendor: json.containsKey('VTLDeviceVendor')
            ? json['VTLDeviceVendor'] as String
            : null,
        vtlDeviceProductIdentifier:
            json.containsKey('VTLDeviceProductIdentifier')
                ? json['VTLDeviceProductIdentifier'] as String
                : null,
        deviceiScsiAttributes: json.containsKey('DeviceiSCSIAttributes')
            ? DeviceiScsiAttributes.fromJson(json['DeviceiSCSIAttributes'])
            : null,
      );
}

/// Describes a storage volume object.
class VolumeInfo {
  /// The Amazon Resource Name (ARN) for the storage volume. For example, the
  /// following is a valid ARN:
  ///
  ///
  /// `arn:aws:storagegateway:us-east-2:111122223333:gateway/sgw-12A3456B/volume/vol-1122AABB`
  ///
  ///  Valid Values: 50 to 500 lowercase letters, numbers, periods (.), and
  /// hyphens (-).
  final String volumeArn;

  /// The unique identifier assigned to the volume. This ID becomes part of the
  /// volume Amazon Resource Name (ARN), which you use as input for other
  /// operations.
  ///
  ///  Valid Values: 50 to 500 lowercase letters, numbers, periods (.), and
  /// hyphens (-).
  final String volumeId;

  final String gatewayArn;

  /// The unique identifier assigned to your gateway during activation. This ID
  /// becomes part of the gateway Amazon Resource Name (ARN), which you use as
  /// input for other operations.
  ///
  ///  Valid Values: 50 to 500 lowercase letters, numbers, periods (.), and
  /// hyphens (-).
  final String gatewayId;

  /// One of the VolumeType enumeration values describing the type of the
  /// volume.
  final String volumeType;

  /// The size of the volume in bytes.
  ///
  /// Valid Values: 50 to 500 lowercase letters, numbers, periods (.), and
  /// hyphens (-).
  final BigInt volumeSizeInBytes;

  /// One of the VolumeStatus values that indicates the state of the storage
  /// volume.
  final String volumeAttachmentStatus;

  VolumeInfo({
    this.volumeArn,
    this.volumeId,
    this.gatewayArn,
    this.gatewayId,
    this.volumeType,
    this.volumeSizeInBytes,
    this.volumeAttachmentStatus,
  });
  static VolumeInfo fromJson(Map<String, dynamic> json) => VolumeInfo(
        volumeArn:
            json.containsKey('VolumeARN') ? json['VolumeARN'] as String : null,
        volumeId:
            json.containsKey('VolumeId') ? json['VolumeId'] as String : null,
        gatewayArn: json.containsKey('GatewayARN')
            ? json['GatewayARN'] as String
            : null,
        gatewayId:
            json.containsKey('GatewayId') ? json['GatewayId'] as String : null,
        volumeType: json.containsKey('VolumeType')
            ? json['VolumeType'] as String
            : null,
        volumeSizeInBytes: json.containsKey('VolumeSizeInBytes')
            ? BigInt.from(json['VolumeSizeInBytes'])
            : null,
        volumeAttachmentStatus: json.containsKey('VolumeAttachmentStatus')
            ? json['VolumeAttachmentStatus'] as String
            : null,
      );
}

/// Describes a storage volume recovery point object.
class VolumeRecoveryPointInfo {
  /// The Amazon Resource Name (ARN) of the volume target.
  final String volumeArn;

  /// The size of the volume in bytes.
  final BigInt volumeSizeInBytes;

  /// The size of the data stored on the volume in bytes.
  ///
  ///
  ///
  /// This value is not available for volumes created prior to May 13, 2015,
  /// until you store data on the volume.
  final BigInt volumeUsageInBytes;

  /// The time the recovery point was taken.
  final String volumeRecoveryPointTime;

  VolumeRecoveryPointInfo({
    this.volumeArn,
    this.volumeSizeInBytes,
    this.volumeUsageInBytes,
    this.volumeRecoveryPointTime,
  });
  static VolumeRecoveryPointInfo fromJson(Map<String, dynamic> json) =>
      VolumeRecoveryPointInfo(
        volumeArn:
            json.containsKey('VolumeARN') ? json['VolumeARN'] as String : null,
        volumeSizeInBytes: json.containsKey('VolumeSizeInBytes')
            ? BigInt.from(json['VolumeSizeInBytes'])
            : null,
        volumeUsageInBytes: json.containsKey('VolumeUsageInBytes')
            ? BigInt.from(json['VolumeUsageInBytes'])
            : null,
        volumeRecoveryPointTime: json.containsKey('VolumeRecoveryPointTime')
            ? json['VolumeRecoveryPointTime'] as String
            : null,
      );
}

/// Lists iSCSI information about a volume.
class VolumeiScsiAttributes {
  /// The Amazon Resource Name (ARN) of the volume target.
  final String targetArn;

  /// The network interface identifier.
  final String networkInterfaceId;

  /// The port used to communicate with iSCSI targets.
  final int networkInterfacePort;

  /// The logical disk number.
  final int lunNumber;

  /// Indicates whether mutual CHAP is enabled for the iSCSI target.
  final bool chapEnabled;

  VolumeiScsiAttributes({
    this.targetArn,
    this.networkInterfaceId,
    this.networkInterfacePort,
    this.lunNumber,
    this.chapEnabled,
  });
  static VolumeiScsiAttributes fromJson(Map<String, dynamic> json) =>
      VolumeiScsiAttributes(
        targetArn:
            json.containsKey('TargetARN') ? json['TargetARN'] as String : null,
        networkInterfaceId: json.containsKey('NetworkInterfaceId')
            ? json['NetworkInterfaceId'] as String
            : null,
        networkInterfacePort: json.containsKey('NetworkInterfacePort')
            ? json['NetworkInterfacePort'] as int
            : null,
        lunNumber:
            json.containsKey('LunNumber') ? json['LunNumber'] as int : null,
        chapEnabled: json.containsKey('ChapEnabled')
            ? json['ChapEnabled'] as bool
            : null,
      );
}
