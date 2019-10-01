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
/// *    [AWS Storage Gateway Required Request
/// Headers](https://docs.aws.amazon.com/storagegateway/latest/userguide/AWSStorageGatewayAPI.html#AWSStorageGatewayHTTPRequestsHeaders):
/// Describes the required headers that you must send with every POST request to
/// AWS Storage Gateway.
///
/// *    [Signing
/// Requests](https://docs.aws.amazon.com/storagegateway/latest/userguide/AWSStorageGatewayAPI.html#AWSStorageGatewaySigningRequests):
/// AWS Storage Gateway requires that you authenticate every request you send;
/// this topic describes how sign such a request.
///
/// *    [Error
/// Responses](https://docs.aws.amazon.com/storagegateway/latest/userguide/AWSStorageGatewayAPI.html#APIErrorResponses):
/// Provides reference information about AWS Storage Gateway errors.
///
/// *    [Operations in AWS Storage
/// Gateway](https://docs.aws.amazon.com/storagegateway/latest/APIReference/API_Operations.html):
/// Contains detailed descriptions of all AWS Storage Gateway operations, their
/// request parameters, response elements, possible errors, and examples of
/// requests and responses.
///
/// *    [AWS Storage Gateway Regions and
/// Endpoints:](http://docs.aws.amazon.com/general/latest/gr/rande.html#sg_region)
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
/// test your systems with the new format. For more information, see [Longer EC2
/// and EBS Resource IDs](https://aws.amazon.com/ec2/faqs/#longer-ids).
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
/// For more information, see [Announcement: Heads-up – Longer AWS Storage
/// Gateway volume and snapshot IDs coming in
/// 2016](https://forums.aws.amazon.com/ann.jspa?annID=3557).
class StorageGatewayApi {
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
  Future<void> activateGateway(
      {@required String activationKey,
      @required String gatewayName,
      @required String gatewayTimezone,
      @required String gatewayRegion,
      String gatewayType,
      String tapeDriveType,
      String mediumChangerType,
      List<Tag> tags}) async {}

  /// Configures one or more gateway local disks as cache for a gateway. This
  /// operation is only supported in the cached volume, tape and file gateway
  /// type (see [Storage Gateway
  /// Concepts](https://docs.aws.amazon.com/storagegateway/latest/userguide/StorageGatewayConcepts.html)).
  ///
  /// In the request, you specify the gateway Amazon Resource Name (ARN) to
  /// which you want to add cache, and one or more disk IDs that you want to
  /// configure as cache.
  Future<void> addCache(
      {@required String gatewayArn, @required List<String> diskIds}) async {}

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
  Future<void> addTagsToResource(
      {@required String resourceArn, @required List<Tag> tags}) async {}

  /// Configures one or more gateway local disks as upload buffer for a
  /// specified gateway. This operation is supported for the stored volume,
  /// cached volume and tape gateway types.
  ///
  /// In the request, you specify the gateway Amazon Resource Name (ARN) to
  /// which you want to add upload buffer, and one or more disk IDs that you
  /// want to configure as upload buffer.
  Future<void> addUploadBuffer(
      {@required String gatewayArn, @required List<String> diskIds}) async {}

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
  Future<void> addWorkingStorage(
      {@required String gatewayArn, @required List<String> diskIds}) async {}

  /// Assigns a tape to a tape pool for archiving. The tape assigned to a pool
  /// is archived in the S3 storage class that is associated with the pool. When
  /// you use your backup application to eject the tape, the tape is archived
  /// directly into the S3 storage class (Glacier or Deep Archive) that
  /// corresponds to the pool.
  ///
  /// Valid values: "GLACIER", "DEEP_ARCHIVE"
  Future<void> assignTapePool(
      {@required String tapeArn, @required String poolId}) async {}

  /// Connects a volume to an iSCSI connection and then attaches the volume to
  /// the specified gateway. Detaching and attaching a volume enables you to
  /// recover your data from one gateway to a different gateway without creating
  /// a snapshot. It also makes it easier to move your volumes from an
  /// on-premises gateway to a gateway hosted on an Amazon EC2 instance.
  Future<void> attachVolume(
      {@required String gatewayArn,
      String targetName,
      @required String volumeArn,
      @required String networkInterfaceId,
      String diskId}) async {}

  /// Cancels archiving of a virtual tape to the virtual tape shelf (VTS) after
  /// the archiving process is initiated. This operation is only supported in
  /// the tape gateway type.
  Future<void> cancelArchival(
      {@required String gatewayArn, @required String tapeArn}) async {}

  /// Cancels retrieval of a virtual tape from the virtual tape shelf (VTS) to a
  /// gateway after the retrieval process is initiated. The virtual tape is
  /// returned to the VTS. This operation is only supported in the tape gateway
  /// type.
  Future<void> cancelRetrieval(
      {@required String gatewayArn, @required String tapeArn}) async {}

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
  Future<void> createCachediScsiVolume(
      {@required String gatewayArn,
      @required BigInt volumeSizeInBytes,
      String snapshotId,
      @required String targetName,
      String sourceVolumeArn,
      @required String networkInterfaceId,
      @required String clientToken,
      bool kmsEncrypted,
      String kmsKey,
      List<Tag> tags}) async {}

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
  Future<void> createNfsFileShare(
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
      List<Tag> tags}) async {}

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
  /// activate AWS STS, see [Activating and Deactivating AWS STS in an AWS
  /// Region](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_enable-regions.html)
  /// in the _AWS Identity and Access Management User Guide._
  ///
  /// File gateways don't support creating hard or symbolic links on a file
  /// share.
  Future<void> createSmbFileShare(
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
      List<Tag> tags}) async {}

  /// Initiates a snapshot of a volume.
  ///
  /// AWS Storage Gateway provides the ability to back up point-in-time
  /// snapshots of your data to Amazon Simple Storage (S3) for durable off-site
  /// recovery, as well as import the data to an Amazon Elastic Block Store
  /// (EBS) volume in Amazon Elastic Compute Cloud (EC2). You can take snapshots
  /// of your gateway volume on a scheduled or ad hoc basis. This API enables
  /// you to take ad-hoc snapshot. For more information, see [Editing a Snapshot
  /// Schedule](https://docs.aws.amazon.com/storagegateway/latest/userguide/managing-volumes.html#SchedulingSnapshot).
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
  /// information, see DescribeSnapshots or DeleteSnapshot in the [EC2 API
  /// reference](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_Operations.html).
  ///
  ///
  /// Volume and snapshot IDs are changing to a longer length ID format. For
  /// more information, see the important note on the
  /// [Welcome](https://docs.aws.amazon.com/storagegateway/latest/APIReference/Welcome.html)
  /// page.
  Future<void> createSnapshot(
      {@required String volumeArn,
      @required String snapshotDescription,
      List<Tag> tags}) async {}

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
  Future<void> createSnapshotFromVolumeRecoveryPoint(
      {@required String volumeArn,
      @required String snapshotDescription,
      List<Tag> tags}) async {}

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
  Future<void> createStorediScsiVolume(
      {@required String gatewayArn,
      @required String diskId,
      String snapshotId,
      @required bool preserveExistingData,
      @required String targetName,
      @required String networkInterfaceId,
      bool kmsEncrypted,
      String kmsKey,
      List<Tag> tags}) async {}

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
  Future<void> createTapeWithBarcode(
      {@required String gatewayArn,
      @required BigInt tapeSizeInBytes,
      @required String tapeBarcode,
      bool kmsEncrypted,
      String kmsKey,
      String poolId,
      List<Tag> tags}) async {}

  /// Creates one or more virtual tapes. You write data to the virtual tapes and
  /// then archive the tapes. This operation is only supported in the tape
  /// gateway type.
  ///
  ///
  ///
  /// Cache storage must be allocated to the gateway before you can create
  /// virtual tapes. Use the AddCache operation to add cache storage to a
  /// gateway.
  Future<void> createTapes(
      {@required String gatewayArn,
      @required BigInt tapeSizeInBytes,
      @required String clientToken,
      @required int numTapesToCreate,
      @required String tapeBarcodePrefix,
      bool kmsEncrypted,
      String kmsKey,
      String poolId,
      List<Tag> tags}) async {}

  /// Deletes the bandwidth rate limits of a gateway. You can delete either the
  /// upload and download bandwidth rate limit, or you can delete both. If you
  /// delete only one of the limits, the other limit remains unchanged. To
  /// specify which gateway to work with, use the Amazon Resource Name (ARN) of
  /// the gateway in your request.
  Future<void> deleteBandwidthRateLimit(
      {@required String gatewayArn, @required String bandwidthType}) async {}

  /// Deletes Challenge-Handshake Authentication Protocol (CHAP) credentials for
  /// a specified iSCSI target and initiator pair.
  Future<void> deleteChapCredentials(
      {@required String targetArn, @required String initiatorName}) async {}

  /// Deletes a file share from a file gateway. This operation is only supported
  /// for file gateways.
  Future<void> deleteFileShare(String fileShareArn, {bool forceDelete}) async {}

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
  /// billed for these snapshots. You can choose to remove all remaining Amazon
  /// EBS snapshots by canceling your Amazon EC2 subscription.  If you prefer
  /// not to cancel your Amazon EC2 subscription, you can delete your snapshots
  /// using the Amazon EC2 console. For more information, see the  [AWS Storage
  /// Gateway Detail Page](http://aws.amazon.com/storagegateway).
  Future<void> deleteGateway(String gatewayArn) async {}

  /// Deletes a snapshot of a volume.
  ///
  /// You can take snapshots of your gateway volumes on a scheduled or ad hoc
  /// basis. This API action enables you to delete a snapshot schedule for a
  /// volume. For more information, see [Working with
  /// Snapshots](https://docs.aws.amazon.com/storagegateway/latest/userguide/WorkingWithSnapshots.html).
  /// In the `DeleteSnapshotSchedule` request, you identify the volume by
  /// providing its Amazon Resource Name (ARN). This operation is only supported
  /// in stored and cached volume gateway types.
  ///
  ///
  ///
  /// To list or delete a snapshot, you must use the Amazon EC2 API. in _Amazon
  /// Elastic Compute Cloud API Reference_.
  Future<void> deleteSnapshotSchedule(String volumeArn) async {}

  /// Deletes the specified virtual tape. This operation is only supported in
  /// the tape gateway type.
  Future<void> deleteTape(
      {@required String gatewayArn, @required String tapeArn}) async {}

  /// Deletes the specified virtual tape from the virtual tape shelf (VTS). This
  /// operation is only supported in the tape gateway type.
  Future<void> deleteTapeArchive(String tapeArn) async {}

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
  Future<void> deleteVolume(String volumeArn) async {}

  /// Returns the bandwidth rate limits of a gateway. By default, these limits
  /// are not set, which means no bandwidth rate limiting is in effect.
  ///
  /// This operation only returns a value for a bandwidth rate limit only if the
  /// limit is set. If no limits are set for the gateway, then this operation
  /// returns only the gateway ARN in the response body. To specify which
  /// gateway to describe, use the Amazon Resource Name (ARN) of the gateway in
  /// your request.
  Future<void> describeBandwidthRateLimit(String gatewayArn) async {}

  /// Returns information about the cache of a gateway. This operation is only
  /// supported in the cached volume, tape and file gateway types.
  ///
  /// The response includes disk IDs that are configured as cache, and it
  /// includes the amount of cache allocated and used.
  Future<void> describeCache(String gatewayArn) async {}

  /// Returns a description of the gateway volumes specified in the request.
  /// This operation is only supported in the cached volume gateway types.
  ///
  /// The list of gateway volumes in the request must be from one gateway. In
  /// the response Amazon Storage Gateway returns volume information sorted by
  /// volume Amazon Resource Name (ARN).
  Future<void> describeCachediScsiVolumes(List<String> volumeARNs) async {}

  /// Returns an array of Challenge-Handshake Authentication Protocol (CHAP)
  /// credentials information for a specified iSCSI target, one for each
  /// target-initiator pair.
  Future<void> describeChapCredentials(String targetArn) async {}

  /// Returns metadata about a gateway such as its name, network interfaces,
  /// configured time zone, and the state (whether the gateway is running or
  /// not). To specify which gateway to describe, use the Amazon Resource Name
  /// (ARN) of the gateway in your request.
  Future<void> describeGatewayInformation(String gatewayArn) async {}

  /// Returns your gateway's weekly maintenance start time including the day and
  /// time of the week. Note that values are in terms of the gateway's time
  /// zone.
  Future<void> describeMaintenanceStartTime(String gatewayArn) async {}

  /// Gets a description for one or more Network File System (NFS) file shares
  /// from a file gateway. This operation is only supported for file gateways.
  Future<void> describeNfsFileShares(List<String> fileShareArnList) async {}

  /// Gets a description for one or more Server Message Block (SMB) file shares
  /// from a file gateway. This operation is only supported for file gateways.
  Future<void> describeSmbFileShares(List<String> fileShareArnList) async {}

  /// Gets a description of a Server Message Block (SMB) file share settings
  /// from a file gateway. This operation is only supported for file gateways.
  Future<void> describeSmbSettings(String gatewayArn) async {}

  /// Describes the snapshot schedule for the specified gateway volume. The
  /// snapshot schedule information includes intervals at which snapshots are
  /// automatically initiated on the volume. This operation is only supported in
  /// the cached volume and stored volume types.
  Future<void> describeSnapshotSchedule(String volumeArn) async {}

  /// Returns the description of the gateway volumes specified in the request.
  /// The list of gateway volumes in the request must be from one gateway. In
  /// the response Amazon Storage Gateway returns volume information sorted by
  /// volume ARNs. This operation is only supported in stored volume gateway
  /// type.
  Future<void> describeStorediScsiVolumes(List<String> volumeARNs) async {}

  /// Returns a description of specified virtual tapes in the virtual tape shelf
  /// (VTS). This operation is only supported in the tape gateway type.
  ///
  /// If a specific `TapeARN` is not specified, AWS Storage Gateway returns a
  /// description of all virtual tapes found in the VTS associated with your
  /// account.
  Future<void> describeTapeArchives(
      {List<String> tapeARNs, String marker, int limit}) async {}

  /// Returns a list of virtual tape recovery points that are available for the
  /// specified tape gateway.
  ///
  /// A recovery point is a point-in-time view of a virtual tape at which all
  /// the data on the virtual tape is consistent. If your gateway crashes,
  /// virtual tapes that have recovery points can be recovered to a new gateway.
  /// This operation is only supported in the tape gateway type.
  Future<void> describeTapeRecoveryPoints(String gatewayArn,
      {String marker, int limit}) async {}

  /// Returns a description of the specified Amazon Resource Name (ARN) of
  /// virtual tapes. If a `TapeARN` is not specified, returns a description of
  /// all virtual tapes associated with the specified gateway. This operation is
  /// only supported in the tape gateway type.
  Future<void> describeTapes(String gatewayArn,
      {List<String> tapeARNs, String marker, int limit}) async {}

  /// Returns information about the upload buffer of a gateway. This operation
  /// is supported for the stored volume, cached volume and tape gateway types.
  ///
  /// The response includes disk IDs that are configured as upload buffer space,
  /// and it includes the amount of upload buffer space allocated and used.
  Future<void> describeUploadBuffer(String gatewayArn) async {}

  /// Returns a description of virtual tape library (VTL) devices for the
  /// specified tape gateway. In the response, AWS Storage Gateway returns VTL
  /// device information.
  ///
  /// This operation is only supported in the tape gateway type.
  Future<void> describeVtlDevices(String gatewayArn,
      {List<String> vtlDeviceARNs, String marker, int limit}) async {}

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
  Future<void> describeWorkingStorage(String gatewayArn) async {}

  /// Disconnects a volume from an iSCSI connection and then detaches the volume
  /// from the specified gateway. Detaching and attaching a volume enables you
  /// to recover your data from one gateway to a different gateway without
  /// creating a snapshot. It also makes it easier to move your volumes from an
  /// on-premises gateway to a gateway hosted on an Amazon EC2 instance.
  Future<void> detachVolume(String volumeArn, {bool forceDetach}) async {}

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
  Future<void> disableGateway(String gatewayArn) async {}

  /// Adds a file gateway to an Active Directory domain. This operation is only
  /// supported for file gateways that support the SMB file protocol.
  Future<void> joinDomain(
      {@required String gatewayArn,
      @required String domainName,
      String organizationalUnit,
      List<String> domainControllers,
      @required String userName,
      @required String password}) async {}

  /// Gets a list of the file shares for a specific file gateway, or the list of
  /// file shares that belong to the calling user account. This operation is
  /// only supported for file gateways.
  Future<void> listFileShares(
      {String gatewayArn, int limit, String marker}) async {}

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
  Future<void> listGateways({String marker, int limit}) async {}

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
  Future<void> listLocalDisks(String gatewayArn) async {}

  /// Lists the tags that have been added to the specified resource. This
  /// operation is only supported in the cached volume, stored volume and tape
  /// gateway type.
  Future<void> listTagsForResource(String resourceArn,
      {String marker, int limit}) async {}

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
  Future<void> listTapes(
      {List<String> tapeARNs, String marker, int limit}) async {}

  /// Lists iSCSI initiators that are connected to a volume. You can use this
  /// operation to determine whether a volume is being used or not. This
  /// operation is only supported in the cached volume and stored volume gateway
  /// types.
  Future<void> listVolumeInitiators(String volumeArn) async {}

  /// Lists the recovery points for a specified gateway. This operation is only
  /// supported in the cached volume gateway type.
  ///
  /// Each cache volume has one recovery point. A volume recovery point is a
  /// point in time at which all data of the volume is consistent and from which
  /// you can create a snapshot or clone a new cached volume from a source
  /// volume. To create a snapshot from a volume recovery point use the
  /// CreateSnapshotFromVolumeRecoveryPoint operation.
  Future<void> listVolumeRecoveryPoints(String gatewayArn) async {}

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
  Future<void> listVolumes(
      {String gatewayArn, String marker, int limit}) async {}

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
  Future<void> notifyWhenUploaded(String fileShareArn) async {}

  /// Refreshes the cache for the specified file share. This operation finds
  /// objects in the Amazon S3 bucket that were added, removed or replaced since
  /// the gateway last listed the bucket's contents and cached the results. This
  /// operation is only supported in the file gateway type. You can subscribe to
  /// be notified through an Amazon CloudWatch event when your RefreshCache
  /// operation completes. For more information, see [Getting Notified About
  /// File
  /// Operations](https://docs.aws.amazon.com/storagegateway/latest/userguide/monitoring-file-gateway.html#get-notification).
  ///
  /// When this API is called, it only initiates the refresh operation. When the
  /// API call completes and returns a success code, it doesn't necessarily mean
  /// that the file refresh has completed. You should use the refresh-complete
  /// notification to determine that the operation has completed before you
  /// check for new files on the gateway file share. You can subscribe to be
  /// notified through an CloudWatch event when your `RefreshCache` operation
  /// completes.
  Future<void> refreshCache(String fileShareArn,
      {List<String> folderList, bool recursive}) async {}

  /// Removes one or more tags from the specified resource. This operation is
  /// only supported in the cached volume, stored volume and tape gateway types.
  Future<void> removeTagsFromResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {}

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
  Future<void> resetCache(String gatewayArn) async {}

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
  Future<void> retrieveTapeArchive(
      {@required String tapeArn, @required String gatewayArn}) async {}

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
  Future<void> retrieveTapeRecoveryPoint(
      {@required String tapeArn, @required String gatewayArn}) async {}

  /// Sets the password for your VM local console. When you log in to the local
  /// console for the first time, you log in to the VM with the default
  /// credentials. We recommend that you set a new password. You don't need to
  /// know the default password to set a new password.
  Future<void> setLocalConsolePassword(
      {@required String gatewayArn,
      @required String localConsolePassword}) async {}

  /// Sets the password for the guest user `smbguest`. The `smbguest` user is
  /// the user when the authentication method for the file share is set to
  /// `GuestAccess`.
  Future<void> setSmbGuestPassword(
      {@required String gatewayArn, @required String password}) async {}

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
  Future<void> shutdownGateway(String gatewayArn) async {}

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
  Future<void> startGateway(String gatewayArn) async {}

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
  Future<void> updateBandwidthRateLimit(String gatewayArn,
      {BigInt averageUploadRateLimitInBitsPerSec,
      BigInt averageDownloadRateLimitInBitsPerSec}) async {}

  /// Updates the Challenge-Handshake Authentication Protocol (CHAP) credentials
  /// for a specified iSCSI target. By default, a gateway does not have CHAP
  /// enabled; however, for added security, you might use it.
  ///
  ///
  ///
  /// When you update CHAP credentials, all existing connections on the target
  /// are closed and initiators must reconnect with the new credentials.
  Future<void> updateChapCredentials(
      {@required String targetArn,
      @required String secretToAuthenticateInitiator,
      @required String initiatorName,
      String secretToAuthenticateTarget}) async {}

  /// Updates a gateway's metadata, which includes the gateway's name and time
  /// zone. To specify which gateway to update, use the Amazon Resource Name
  /// (ARN) of the gateway in your request.
  ///
  ///
  ///
  /// For Gateways activated after September 2, 2015, the gateway's ARN contains
  /// the gateway ID rather than the gateway name. However, changing the name of
  /// the gateway has no effect on the gateway's ARN.
  Future<void> updateGatewayInformation(String gatewayArn,
      {String gatewayName,
      String gatewayTimezone,
      String cloudWatchLogGroupArn}) async {}

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
  /// iSCSI Initiator timeouts for Windows and Linux, see [Customizing Your
  /// Windows iSCSI
  /// Settings](https://docs.aws.amazon.com/storagegateway/latest/userguide/ConfiguringiSCSIClientInitiatorWindowsClient.html#CustomizeWindowsiSCSISettings)
  /// and [Customizing Your Linux iSCSI
  /// Settings](https://docs.aws.amazon.com/storagegateway/latest/userguide/ConfiguringiSCSIClientInitiatorRedHatClient.html#CustomizeLinuxiSCSISettings),
  /// respectively.
  Future<void> updateGatewaySoftwareNow(String gatewayArn) async {}

  /// Updates a gateway's weekly maintenance start time information, including
  /// day and time of the week. The maintenance time is the time in your
  /// gateway's time zone.
  Future<void> updateMaintenanceStartTime(
      {@required String gatewayArn,
      @required int hourOfDay,
      @required int minuteOfHour,
      int dayOfWeek,
      int dayOfMonth}) async {}

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
  Future<void> updateNfsFileShare(String fileShareArn,
      {bool kmsEncrypted,
      String kmsKey,
      NfsFileShareDefaults nfsFileShareDefaults,
      String defaultStorageClass,
      String objectAcl,
      List<String> clientList,
      String squash,
      bool readOnly,
      bool guessMimeTypeEnabled,
      bool requesterPays}) async {}

  /// Updates a Server Message Block (SMB) file share.
  ///
  ///  To leave a file share field unchanged, set the corresponding input field
  /// to null. This operation is only supported for file gateways.
  ///
  /// File gateways require AWS Security Token Service (AWS STS) to be activated
  /// to enable you to create a file share. Make sure that AWS STS is activated
  /// in the AWS Region you are creating your file gateway in. If AWS STS is not
  /// activated in this AWS Region, activate it. For information about how to
  /// activate AWS STS, see [Activating and Deactivating AWS STS in an AWS
  /// Region](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_enable-regions.html)
  /// in the _AWS Identity and Access Management User Guide._
  ///
  /// File gateways don't support creating hard or symbolic links on a file
  /// share.
  Future<void> updateSmbFileShare(String fileShareArn,
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
      List<String> invalidUserList}) async {}

  /// Updates the SMB security strategy on a file gateway. This action is only
  /// supported in file gateways.
  ///
  ///
  ///
  /// This API is called Security level in the User Guide.
  ///
  /// A higher security level can affect performance of the gateway.
  Future<void> updateSmbSecurityStrategy(
      {@required String gatewayArn,
      @required String smbSecurityStrategy}) async {}

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
  Future<void> updateSnapshotSchedule(
      {@required String volumeArn,
      @required int startAt,
      @required int recurrenceInHours,
      String description,
      List<Tag> tags}) async {}

  /// Updates the type of medium changer in a tape gateway. When you activate a
  /// tape gateway, you select a medium changer type for the tape gateway. This
  /// operation enables you to select a different type of medium changer after a
  /// tape gateway is activated. This operation is only supported in the tape
  /// gateway type.
  Future<void> updateVtlDeviceType(
      {@required String vtlDeviceArn, @required String deviceType}) async {}
}

class ActivateGatewayOutput {}

class AddCacheOutput {}

class AddTagsToResourceOutput {}

class AddUploadBufferOutput {}

class AddWorkingStorageOutput {}

class AssignTapePoolOutput {}

class AttachVolumeOutput {}

class CachediScsiVolume {}

class CancelArchivalOutput {}

class CancelRetrievalOutput {}

class ChapInfo {}

class CreateCachediScsiVolumeOutput {}

class CreateNfsFileShareOutput {}

class CreateSmbFileShareOutput {}

class CreateSnapshotFromVolumeRecoveryPointOutput {}

class CreateSnapshotOutput {}

class CreateStorediScsiVolumeOutput {}

class CreateTapeWithBarcodeOutput {}

class CreateTapesOutput {}

class DeleteBandwidthRateLimitOutput {}

class DeleteChapCredentialsOutput {}

class DeleteFileShareOutput {}

class DeleteGatewayOutput {}

class DeleteSnapshotScheduleOutput {}

class DeleteTapeArchiveOutput {}

class DeleteTapeOutput {}

class DeleteVolumeOutput {}

class DescribeBandwidthRateLimitOutput {}

class DescribeCacheOutput {}

class DescribeCachediScsiVolumesOutput {}

class DescribeChapCredentialsOutput {}

class DescribeGatewayInformationOutput {}

class DescribeMaintenanceStartTimeOutput {}

class DescribeNfsFileSharesOutput {}

class DescribeSmbFileSharesOutput {}

class DescribeSmbSettingsOutput {}

class DescribeSnapshotScheduleOutput {}

class DescribeStorediScsiVolumesOutput {}

class DescribeTapeArchivesOutput {}

class DescribeTapeRecoveryPointsOutput {}

class DescribeTapesOutput {}

class DescribeUploadBufferOutput {}

class DescribeVtlDevicesOutput {}

class DescribeWorkingStorageOutput {}

class DetachVolumeOutput {}

class DeviceiScsiAttributes {}

class DisableGatewayOutput {}

class Disk {}

class FileShareInfo {}

class GatewayInfo {}

class JoinDomainOutput {}

class ListFileSharesOutput {}

class ListGatewaysOutput {}

class ListLocalDisksOutput {}

class ListTagsForResourceOutput {}

class ListTapesOutput {}

class ListVolumeInitiatorsOutput {}

class ListVolumeRecoveryPointsOutput {}

class ListVolumesOutput {}

class NfsFileShareDefaults {}

class NfsFileShareInfo {}

class NetworkInterface {}

class NotifyWhenUploadedOutput {}

class RefreshCacheOutput {}

class RemoveTagsFromResourceOutput {}

class ResetCacheOutput {}

class RetrieveTapeArchiveOutput {}

class RetrieveTapeRecoveryPointOutput {}

class SmbFileShareInfo {}

class SetLocalConsolePasswordOutput {}

class SetSmbGuestPasswordOutput {}

class ShutdownGatewayOutput {}

class StartGatewayOutput {}

class StorediScsiVolume {}

class Tag {}

class Tape {}

class TapeArchive {}

class TapeInfo {}

class TapeRecoveryPointInfo {}

class UpdateBandwidthRateLimitOutput {}

class UpdateChapCredentialsOutput {}

class UpdateGatewayInformationOutput {}

class UpdateGatewaySoftwareNowOutput {}

class UpdateMaintenanceStartTimeOutput {}

class UpdateNfsFileShareOutput {}

class UpdateSmbFileShareOutput {}

class UpdateSmbSecurityStrategyOutput {}

class UpdateSnapshotScheduleOutput {}

class UpdateVtlDeviceTypeOutput {}

class VtlDevice {}

class VolumeInfo {}

class VolumeRecoveryPointInfo {}

class VolumeiScsiAttributes {}
