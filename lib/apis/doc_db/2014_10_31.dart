import 'package:meta/meta.dart';

/// Amazon DocumentDB API documentation
class DocDBApi {
  /// Adds metadata tags to an Amazon DocumentDB resource. You can use these
  /// tags with cost allocation reporting to track costs that are associated
  /// with Amazon DocumentDB resources. or in a `Condition` statement in an AWS
  /// Identity and Access Management (IAM) policy for Amazon DocumentDB.
  ///
  /// [resourceName]: The Amazon DocumentDB resource that the tags are added to.
  /// This value is an Amazon Resource Name (ARN).
  ///
  /// [tags]: The tags to be assigned to the Amazon DocumentDB resource.
  Future<void> addTagsToResource(
      {@required String resourceName, @required List<Tag> tags}) async {}

  /// Applies a pending maintenance action to a resource (for example, to a DB
  /// instance).
  ///
  /// [resourceIdentifier]: The Amazon Resource Name (ARN) of the resource that
  /// the pending maintenance action applies to.
  ///
  /// [applyAction]: The pending maintenance action to apply to this resource.
  ///
  /// Valid values: `system-update`, `db-upgrade`
  ///
  /// [optInType]: A value that specifies the type of opt-in request or undoes
  /// an opt-in request. An opt-in request of type `immediate` can't be undone.
  ///
  /// Valid values:
  ///
  /// *    `immediate` \- Apply the maintenance action immediately.
  ///
  /// *    `next-maintenance` \- Apply the maintenance action during the next
  /// maintenance window for the resource.
  ///
  /// *    `undo-opt-in` \- Cancel any existing `next-maintenance` opt-in
  /// requests.
  Future<ApplyPendingMaintenanceActionResult> applyPendingMaintenanceAction(
      {@required String resourceIdentifier,
      @required String applyAction,
      @required String optInType}) async {
    return ApplyPendingMaintenanceActionResult.fromJson({});
  }

  /// Copies the specified DB cluster parameter group.
  ///
  /// [sourceDBClusterParameterGroupIdentifier]: The identifier or Amazon
  /// Resource Name (ARN) for the source DB cluster parameter group.
  ///
  /// Constraints:
  ///
  /// *   Must specify a valid DB cluster parameter group.
  ///
  /// *   If the source DB cluster parameter group is in the same AWS Region as
  /// the copy, specify a valid DB parameter group identifier; for example,
  /// `my-db-cluster-param-group`, or a valid ARN.
  ///
  /// *   If the source DB parameter group is in a different AWS Region than the
  /// copy, specify a valid DB cluster parameter group ARN; for example,
  /// `arn:aws:rds:us-east-1:123456789012:cluster-pg:custom-cluster-group1`.
  ///
  /// [targetDBClusterParameterGroupIdentifier]: The identifier for the copied
  /// DB cluster parameter group.
  ///
  /// Constraints:
  ///
  /// *   Cannot be null, empty, or blank.
  ///
  /// *   Must contain from 1 to 255 letters, numbers, or hyphens.
  ///
  /// *   The first character must be a letter.
  ///
  /// *   Cannot end with a hyphen or contain two consecutive hyphens.
  ///
  ///
  /// Example: `my-cluster-param-group1`
  ///
  /// [targetDBClusterParameterGroupDescription]: A description for the copied
  /// DB cluster parameter group.
  ///
  /// [tags]: The tags that are to be assigned to the parameter group.
  Future<CopyDBClusterParameterGroupResult> copyDBClusterParameterGroup(
      {@required String sourceDBClusterParameterGroupIdentifier,
      @required String targetDBClusterParameterGroupIdentifier,
      @required String targetDBClusterParameterGroupDescription,
      List<Tag> tags}) async {
    return CopyDBClusterParameterGroupResult.fromJson({});
  }

  /// Copies a snapshot of a DB cluster.
  ///
  /// To copy a DB cluster snapshot from a shared manual DB cluster snapshot,
  /// `SourceDBClusterSnapshotIdentifier` must be the Amazon Resource Name (ARN)
  /// of the shared DB cluster snapshot.
  ///
  /// To cancel the copy operation after it is in progress, delete the target DB
  /// cluster snapshot identified by `TargetDBClusterSnapshotIdentifier` while
  /// that DB cluster snapshot is in the _copying_ status.
  ///
  /// [sourceDBClusterSnapshotIdentifier]: The identifier of the DB cluster
  /// snapshot to copy. This parameter is not case sensitive.
  ///
  /// You can't copy an encrypted, shared DB cluster snapshot from one AWS
  /// Region to another.
  ///
  /// Constraints:
  ///
  /// *   Must specify a valid system snapshot in the "available" state.
  ///
  /// *   If the source snapshot is in the same AWS Region as the copy, specify
  /// a valid DB snapshot identifier.
  ///
  /// *   If the source snapshot is in a different AWS Region than the copy,
  /// specify a valid DB cluster snapshot ARN.
  ///
  ///
  /// Example: `my-cluster-snapshot1`
  ///
  /// [targetDBClusterSnapshotIdentifier]: The identifier of the new DB cluster
  /// snapshot to create from the source DB cluster snapshot. This parameter is
  /// not case sensitive.
  ///
  /// Constraints:
  ///
  /// *   Must contain from 1 to 63 letters, numbers, or hyphens.
  ///
  /// *   The first character must be a letter.
  ///
  /// *   Cannot end with a hyphen or contain two consecutive hyphens.
  ///
  ///
  /// Example: `my-cluster-snapshot2`
  ///
  /// [kmsKeyId]: The AWS KMS key ID for an encrypted DB cluster snapshot. The
  /// AWS KMS key ID is the Amazon Resource Name (ARN), AWS KMS key identifier,
  /// or the AWS KMS key alias for the AWS KMS encryption key.
  ///
  /// If you copy an encrypted DB cluster snapshot from your AWS account, you
  /// can specify a value for `KmsKeyId` to encrypt the copy with a new AWS KMS
  /// encryption key. If you don't specify a value for `KmsKeyId`, then the copy
  /// of the DB cluster snapshot is encrypted with the same AWS KMS key as the
  /// source DB cluster snapshot.
  ///
  /// If you copy an encrypted DB cluster snapshot that is shared from another
  /// AWS account, then you must specify a value for `KmsKeyId`.
  ///
  /// To copy an encrypted DB cluster snapshot to another AWS Region, set
  /// `KmsKeyId` to the AWS KMS key ID that you want to use to encrypt the copy
  /// of the DB cluster snapshot in the destination Region. AWS KMS encryption
  /// keys are specific to the AWS Region that they are created in, and you
  /// can't use encryption keys from one Region in another Region.
  ///
  /// If you copy an unencrypted DB cluster snapshot and specify a value for the
  /// `KmsKeyId` parameter, an error is returned.
  ///
  /// [preSignedUrl]: The URL that contains a Signature Version 4 signed request
  /// for the `CopyDBClusterSnapshot` API action in the AWS Region that contains
  /// the source DB cluster snapshot to copy. You must use the `PreSignedUrl`
  /// parameter when copying an encrypted DB cluster snapshot from another AWS
  /// Region.
  ///
  /// The presigned URL must be a valid request for the `CopyDBSClusterSnapshot`
  /// API action that can be executed in the source AWS Region that contains the
  /// encrypted DB cluster snapshot to be copied. The presigned URL request must
  /// contain the following parameter values:
  ///
  /// *    `KmsKeyId` \- The AWS KMS key identifier for the key to use to
  /// encrypt the copy of the DB cluster snapshot in the destination AWS Region.
  /// This is the same identifier for both the `CopyDBClusterSnapshot` action
  /// that is called in the destination AWS Region, and the action contained in
  /// the presigned URL.
  ///
  /// *    `DestinationRegion` \- The name of the AWS Region that the DB cluster
  /// snapshot will be created in.
  ///
  /// *    `SourceDBClusterSnapshotIdentifier` \- The DB cluster snapshot
  /// identifier for the encrypted DB cluster snapshot to be copied. This
  /// identifier must be in the Amazon Resource Name (ARN) format for the source
  /// AWS Region. For example, if you are copying an encrypted DB cluster
  /// snapshot from the us-west-2 AWS Region, then your
  /// `SourceDBClusterSnapshotIdentifier` looks like the following example:
  /// `arn:aws:rds:us-west-2:123456789012:cluster-snapshot:my-cluster-snapshot-20161115`.
  ///
  /// [copyTags]: Set to `true` to copy all tags from the source DB cluster
  /// snapshot to the target DB cluster snapshot, and otherwise `false`. The
  /// default is `false`.
  ///
  /// [tags]: The tags to be assigned to the DB cluster snapshot.
  Future<CopyDBClusterSnapshotResult> copyDBClusterSnapshot(
      {@required String sourceDBClusterSnapshotIdentifier,
      @required String targetDBClusterSnapshotIdentifier,
      String kmsKeyId,
      String preSignedUrl,
      bool copyTags,
      List<Tag> tags}) async {
    return CopyDBClusterSnapshotResult.fromJson({});
  }

  /// Creates a new Amazon DocumentDB DB cluster.
  ///
  /// [availabilityZones]: A list of Amazon EC2 Availability Zones that
  /// instances in the DB cluster can be created in.
  ///
  /// [backupRetentionPeriod]: The number of days for which automated backups
  /// are retained. You must specify a minimum value of 1.
  ///
  /// Default: 1
  ///
  /// Constraints:
  ///
  /// *   Must be a value from 1 to 35.
  ///
  /// [dbClusterIdentifier]: The DB cluster identifier. This parameter is stored
  /// as a lowercase string.
  ///
  /// Constraints:
  ///
  /// *   Must contain from 1 to 63 letters, numbers, or hyphens.
  ///
  /// *   The first character must be a letter.
  ///
  /// *   Cannot end with a hyphen or contain two consecutive hyphens.
  ///
  ///
  /// Example: `my-cluster`
  ///
  /// [dbClusterParameterGroupName]:  The name of the DB cluster parameter group
  /// to associate with this DB cluster.
  ///
  /// [vpcSecurityGroupIds]: A list of EC2 VPC security groups to associate with
  /// this DB cluster.
  ///
  /// [dbSubnetGroupName]: A DB subnet group to associate with this DB cluster.
  ///
  /// Constraints: Must match the name of an existing `DBSubnetGroup`. Must not
  /// be default.
  ///
  /// Example: `mySubnetgroup`
  ///
  /// [engine]: The name of the database engine to be used for this DB cluster.
  ///
  /// Valid values: `docdb`
  ///
  /// [engineVersion]: The version number of the database engine to use.
  ///
  /// [port]: The port number on which the instances in the DB cluster accept
  /// connections.
  ///
  /// [masterUsername]: The name of the master user for the DB cluster.
  ///
  /// Constraints:
  ///
  /// *   Must be from 1 to 16 letters or numbers.
  ///
  /// *   The first character must be a letter.
  ///
  /// *   Cannot be a reserved word for the chosen database engine.
  ///
  /// [masterUserPassword]: The password for the master database user. This
  /// password can contain any printable ASCII character except forward slash
  /// (/), double quote ("), or the "at" symbol (@).
  ///
  /// Constraints: Must contain from 8 to 41 characters.
  ///
  /// [preferredBackupWindow]: The daily time range during which automated
  /// backups are created if automated backups are enabled using the
  /// `BackupRetentionPeriod` parameter.
  ///
  /// The default is a 30-minute window selected at random from an 8-hour block
  /// of time for each AWS Region.
  ///
  /// Constraints:
  ///
  /// *   Must be in the format `hh24:mi-hh24:mi`.
  ///
  /// *   Must be in Universal Coordinated Time (UTC).
  ///
  /// *   Must not conflict with the preferred maintenance window.
  ///
  /// *   Must be at least 30 minutes.
  ///
  /// [preferredMaintenanceWindow]: The weekly time range during which system
  /// maintenance can occur, in Universal Coordinated Time (UTC).
  ///
  /// Format: `ddd:hh24:mi-ddd:hh24:mi`
  ///
  /// The default is a 30-minute window selected at random from an 8-hour block
  /// of time for each AWS Region, occurring on a random day of the week.
  ///
  /// Valid days: Mon, Tue, Wed, Thu, Fri, Sat, Sun
  ///
  /// Constraints: Minimum 30-minute window.
  ///
  /// [tags]: The tags to be assigned to the DB cluster.
  ///
  /// [storageEncrypted]: Specifies whether the DB cluster is encrypted.
  ///
  /// [kmsKeyId]: The AWS KMS key identifier for an encrypted DB cluster.
  ///
  /// The AWS KMS key identifier is the Amazon Resource Name (ARN) for the AWS
  /// KMS encryption key. If you are creating a DB cluster using the same AWS
  /// account that owns the AWS KMS encryption key that is used to encrypt the
  /// new DB cluster, you can use the AWS KMS key alias instead of the ARN for
  /// the AWS KMS encryption key.
  ///
  /// If an encryption key is not specified in `KmsKeyId`:
  ///
  /// *   If `ReplicationSourceIdentifier` identifies an encrypted source, then
  /// Amazon DocumentDB uses the encryption key that is used to encrypt the
  /// source. Otherwise, Amazon DocumentDB uses your default encryption key.
  ///
  /// *   If the `StorageEncrypted` parameter is `true` and
  /// `ReplicationSourceIdentifier` is not specified, Amazon DocumentDB uses
  /// your default encryption key.
  ///
  ///
  /// AWS KMS creates the default encryption key for your AWS account. Your AWS
  /// account has a different default encryption key for each AWS Region.
  ///
  /// If you create a replica of an encrypted DB cluster in another AWS Region,
  /// you must set `KmsKeyId` to a KMS key ID that is valid in the destination
  /// AWS Region. This key is used to encrypt the replica in that AWS Region.
  ///
  /// [enableCloudwatchLogsExports]: A list of log types that need to be enabled
  /// for exporting to Amazon CloudWatch Logs.
  ///
  /// [deletionProtection]: Specifies whether this cluster can be deleted. If
  /// `DeletionProtection` is enabled, the cluster cannot be deleted unless it
  /// is modified and `DeletionProtection` is disabled. `DeletionProtection`
  /// protects clusters from being accidentally deleted.
  Future<CreateDBClusterResult> createDBCluster(
      {List<String> availabilityZones,
      int backupRetentionPeriod,
      @required String dbClusterIdentifier,
      String dbClusterParameterGroupName,
      List<String> vpcSecurityGroupIds,
      String dbSubnetGroupName,
      @required String engine,
      String engineVersion,
      int port,
      @required String masterUsername,
      @required String masterUserPassword,
      String preferredBackupWindow,
      String preferredMaintenanceWindow,
      List<Tag> tags,
      bool storageEncrypted,
      String kmsKeyId,
      List<String> enableCloudwatchLogsExports,
      bool deletionProtection}) async {
    return CreateDBClusterResult.fromJson({});
  }

  /// Creates a new DB cluster parameter group.
  ///
  /// Parameters in a DB cluster parameter group apply to all of the instances
  /// in a DB cluster.
  ///
  /// A DB cluster parameter group is initially created with the default
  /// parameters for the database engine used by instances in the DB cluster. To
  /// provide custom values for any of the parameters, you must modify the group
  /// after you create it. After you create a DB cluster parameter group, you
  /// must associate it with your DB cluster. For the new DB cluster parameter
  /// group and associated settings to take effect, you must then reboot the DB
  /// instances in the DB cluster without failover.
  ///
  ///
  ///
  /// After you create a DB cluster parameter group, you should wait at least 5
  /// minutes before creating your first DB cluster that uses that DB cluster
  /// parameter group as the default parameter group. This allows Amazon
  /// DocumentDB to fully complete the create action before the DB cluster
  /// parameter group is used as the default for a new DB cluster. This step is
  /// especially important for parameters that are critical when creating the
  /// default database for a DB cluster, such as the character set for the
  /// default database defined by the `character\_set\_database` parameter.
  ///
  /// [dbClusterParameterGroupName]: The name of the DB cluster parameter group.
  ///
  /// Constraints:
  ///
  /// *   Must match the name of an existing `DBClusterParameterGroup`.
  ///
  ///
  ///
  ///
  /// This value is stored as a lowercase string.
  ///
  /// [dbParameterGroupFamily]: The DB cluster parameter group family name.
  ///
  /// [description]: The description for the DB cluster parameter group.
  ///
  /// [tags]: The tags to be assigned to the DB cluster parameter group.
  Future<CreateDBClusterParameterGroupResult> createDBClusterParameterGroup(
      {@required String dbClusterParameterGroupName,
      @required String dbParameterGroupFamily,
      @required String description,
      List<Tag> tags}) async {
    return CreateDBClusterParameterGroupResult.fromJson({});
  }

  /// Creates a snapshot of a DB cluster.
  ///
  /// [dbClusterSnapshotIdentifier]: The identifier of the DB cluster snapshot.
  /// This parameter is stored as a lowercase string.
  ///
  /// Constraints:
  ///
  /// *   Must contain from 1 to 63 letters, numbers, or hyphens.
  ///
  /// *   The first character must be a letter.
  ///
  /// *   Cannot end with a hyphen or contain two consecutive hyphens.
  ///
  ///
  /// Example: `my-cluster-snapshot1`
  ///
  /// [dbClusterIdentifier]: The identifier of the DB cluster to create a
  /// snapshot for. This parameter is not case sensitive.
  ///
  /// Constraints:
  ///
  /// *   Must match the identifier of an existing `DBCluster`.
  ///
  ///
  /// Example: `my-cluster`
  ///
  /// [tags]: The tags to be assigned to the DB cluster snapshot.
  Future<CreateDBClusterSnapshotResult> createDBClusterSnapshot(
      {@required String dbClusterSnapshotIdentifier,
      @required String dbClusterIdentifier,
      List<Tag> tags}) async {
    return CreateDBClusterSnapshotResult.fromJson({});
  }

  /// Creates a new DB instance.
  ///
  /// [dbInstanceIdentifier]: The DB instance identifier. This parameter is
  /// stored as a lowercase string.
  ///
  /// Constraints:
  ///
  /// *   Must contain from 1 to 63 letters, numbers, or hyphens.
  ///
  /// *   The first character must be a letter.
  ///
  /// *   Cannot end with a hyphen or contain two consecutive hyphens.
  ///
  ///
  /// Example: `mydbinstance`
  ///
  /// [dbInstanceClass]: The compute and memory capacity of the DB instance; for
  /// example, `db.r5.large`.
  ///
  /// [engine]: The name of the database engine to be used for this instance.
  ///
  /// Valid value: `docdb`
  ///
  /// [availabilityZone]:  The Amazon EC2 Availability Zone that the DB instance
  /// is created in.
  ///
  /// Default: A random, system-chosen Availability Zone in the endpoint's AWS
  /// Region.
  ///
  ///  Example: `us-east-1d`
  ///
  ///  Constraint: The `AvailabilityZone` parameter can't be specified if the
  /// `MultiAZ` parameter is set to `true`. The specified Availability Zone must
  /// be in the same AWS Region as the current endpoint.
  ///
  /// [preferredMaintenanceWindow]: The time range each week during which system
  /// maintenance can occur, in Universal Coordinated Time (UTC).
  ///
  ///  Format: `ddd:hh24:mi-ddd:hh24:mi`
  ///
  /// The default is a 30-minute window selected at random from an 8-hour block
  /// of time for each AWS Region, occurring on a random day of the week.
  ///
  /// Valid days: Mon, Tue, Wed, Thu, Fri, Sat, Sun
  ///
  /// Constraints: Minimum 30-minute window.
  ///
  /// [autoMinorVersionUpgrade]: Indicates that minor engine upgrades are
  /// applied automatically to the DB instance during the maintenance window.
  ///
  /// Default: `true`
  ///
  /// [tags]: The tags to be assigned to the DB instance.
  ///
  /// [dbClusterIdentifier]: The identifier of the DB cluster that the instance
  /// will belong to.
  ///
  /// [promotionTier]: A value that specifies the order in which an Amazon
  /// DocumentDB replica is promoted to the primary instance after a failure of
  /// the existing primary instance.
  ///
  /// Default: 1
  ///
  /// Valid values: 0-15
  Future<CreateDBInstanceResult> createDBInstance(
      {@required String dbInstanceIdentifier,
      @required String dbInstanceClass,
      @required String engine,
      String availabilityZone,
      String preferredMaintenanceWindow,
      bool autoMinorVersionUpgrade,
      List<Tag> tags,
      @required String dbClusterIdentifier,
      int promotionTier}) async {
    return CreateDBInstanceResult.fromJson({});
  }

  /// Creates a new DB subnet group. DB subnet groups must contain at least one
  /// subnet in at least two Availability Zones in the AWS Region.
  ///
  /// [dbSubnetGroupName]: The name for the DB subnet group. This value is
  /// stored as a lowercase string.
  ///
  /// Constraints: Must contain no more than 255 letters, numbers, periods,
  /// underscores, spaces, or hyphens. Must not be default.
  ///
  /// Example: `mySubnetgroup`
  ///
  /// [dbSubnetGroupDescription]: The description for the DB subnet group.
  ///
  /// [subnetIds]: The Amazon EC2 subnet IDs for the DB subnet group.
  ///
  /// [tags]: The tags to be assigned to the DB subnet group.
  Future<CreateDBSubnetGroupResult> createDBSubnetGroup(
      {@required String dbSubnetGroupName,
      @required String dbSubnetGroupDescription,
      @required List<String> subnetIds,
      List<Tag> tags}) async {
    return CreateDBSubnetGroupResult.fromJson({});
  }

  /// Deletes a previously provisioned DB cluster. When you delete a DB cluster,
  /// all automated backups for that DB cluster are deleted and can't be
  /// recovered. Manual DB cluster snapshots of the specified DB cluster are not
  /// deleted.
  ///
  /// [dbClusterIdentifier]: The DB cluster identifier for the DB cluster to be
  /// deleted. This parameter isn't case sensitive.
  ///
  /// Constraints:
  ///
  /// *   Must match an existing `DBClusterIdentifier`.
  ///
  /// [skipFinalSnapshot]:  Determines whether a final DB cluster snapshot is
  /// created before the DB cluster is deleted. If `true` is specified, no DB
  /// cluster snapshot is created. If `false` is specified, a DB cluster
  /// snapshot is created before the DB cluster is deleted.
  ///
  ///  If `SkipFinalSnapshot` is `false`, you must specify a
  /// `FinalDBSnapshotIdentifier` parameter.
  ///
  /// Default: `false`
  ///
  /// [finalDBSnapshotIdentifier]:  The DB cluster snapshot identifier of the
  /// new DB cluster snapshot created when `SkipFinalSnapshot` is set to
  /// `false`.
  ///
  ///   Specifying this parameter and also setting the `SkipFinalShapshot`
  /// parameter to `true` results in an error.
  ///
  /// Constraints:
  ///
  /// *   Must be from 1 to 255 letters, numbers, or hyphens.
  ///
  /// *   The first character must be a letter.
  ///
  /// *   Cannot end with a hyphen or contain two consecutive hyphens.
  Future<DeleteDBClusterResult> deleteDBCluster(String dbClusterIdentifier,
      {bool skipFinalSnapshot, String finalDBSnapshotIdentifier}) async {
    return DeleteDBClusterResult.fromJson({});
  }

  /// Deletes a specified DB cluster parameter group. The DB cluster parameter
  /// group to be deleted can't be associated with any DB clusters.
  ///
  /// [dbClusterParameterGroupName]: The name of the DB cluster parameter group.
  ///
  /// Constraints:
  ///
  /// *   Must be the name of an existing DB cluster parameter group.
  ///
  /// *   You can't delete a default DB cluster parameter group.
  ///
  /// *   Cannot be associated with any DB clusters.
  Future<void> deleteDBClusterParameterGroup(
      String dbClusterParameterGroupName) async {}

  /// Deletes a DB cluster snapshot. If the snapshot is being copied, the copy
  /// operation is terminated.
  ///
  ///
  ///
  /// The DB cluster snapshot must be in the `available` state to be deleted.
  ///
  /// [dbClusterSnapshotIdentifier]: The identifier of the DB cluster snapshot
  /// to delete.
  ///
  /// Constraints: Must be the name of an existing DB cluster snapshot in the
  /// `available` state.
  Future<DeleteDBClusterSnapshotResult> deleteDBClusterSnapshot(
      String dbClusterSnapshotIdentifier) async {
    return DeleteDBClusterSnapshotResult.fromJson({});
  }

  /// Deletes a previously provisioned DB instance.
  ///
  /// [dbInstanceIdentifier]: The DB instance identifier for the DB instance to
  /// be deleted. This parameter isn't case sensitive.
  ///
  /// Constraints:
  ///
  /// *   Must match the name of an existing DB instance.
  Future<DeleteDBInstanceResult> deleteDBInstance(
      String dbInstanceIdentifier) async {
    return DeleteDBInstanceResult.fromJson({});
  }

  /// Deletes a DB subnet group.
  ///
  ///
  ///
  /// The specified database subnet group must not be associated with any DB
  /// instances.
  ///
  /// [dbSubnetGroupName]: The name of the database subnet group to delete.
  ///
  ///  You can't delete the default subnet group.
  ///
  /// Constraints:
  ///
  /// Must match the name of an existing `DBSubnetGroup`. Must not be default.
  ///
  /// Example: `mySubnetgroup`
  Future<void> deleteDBSubnetGroup(String dbSubnetGroupName) async {}

  /// Returns a list of `DBClusterParameterGroup` descriptions. If a
  /// `DBClusterParameterGroupName` parameter is specified, the list contains
  /// only the description of the specified DB cluster parameter group.
  ///
  /// [dbClusterParameterGroupName]: The name of a specific DB cluster parameter
  /// group to return details for.
  ///
  /// Constraints:
  ///
  /// *   If provided, must match the name of an existing
  /// `DBClusterParameterGroup`.
  ///
  /// [filters]: This parameter is not currently supported.
  ///
  /// [maxRecords]:  The maximum number of records to include in the response.
  /// If more records exist than the specified `MaxRecords` value, a pagination
  /// token (marker) is included in the response so that the remaining results
  /// can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  ///
  /// [marker]: An optional pagination token provided by a previous request. If
  /// this parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords`.
  Future<DBClusterParameterGroupsMessage> describeDBClusterParameterGroups(
      {String dbClusterParameterGroupName,
      List<Filter> filters,
      int maxRecords,
      String marker}) async {
    return DBClusterParameterGroupsMessage.fromJson({});
  }

  /// Returns the detailed parameter list for a particular DB cluster parameter
  /// group.
  ///
  /// [dbClusterParameterGroupName]: The name of a specific DB cluster parameter
  /// group to return parameter details for.
  ///
  /// Constraints:
  ///
  /// *   If provided, must match the name of an existing
  /// `DBClusterParameterGroup`.
  ///
  /// [source]:  A value that indicates to return only parameters for a specific
  /// source. Parameter sources can be `engine`, `service`, or `customer`.
  ///
  /// [filters]: This parameter is not currently supported.
  ///
  /// [maxRecords]:  The maximum number of records to include in the response.
  /// If more records exist than the specified `MaxRecords` value, a pagination
  /// token (marker) is included in the response so that the remaining results
  /// can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  ///
  /// [marker]: An optional pagination token provided by a previous request. If
  /// this parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords`.
  Future<DBClusterParameterGroupDetails> describeDBClusterParameters(
      String dbClusterParameterGroupName,
      {String source,
      List<Filter> filters,
      int maxRecords,
      String marker}) async {
    return DBClusterParameterGroupDetails.fromJson({});
  }

  /// Returns a list of DB cluster snapshot attribute names and values for a
  /// manual DB cluster snapshot.
  ///
  /// When you share snapshots with other AWS accounts,
  /// `DescribeDBClusterSnapshotAttributes` returns the `restore` attribute and
  /// a list of IDs for the AWS accounts that are authorized to copy or restore
  /// the manual DB cluster snapshot. If `all` is included in the list of values
  /// for the `restore` attribute, then the manual DB cluster snapshot is public
  /// and can be copied or restored by all AWS accounts.
  ///
  /// [dbClusterSnapshotIdentifier]: The identifier for the DB cluster snapshot
  /// to describe the attributes for.
  Future<DescribeDBClusterSnapshotAttributesResult>
      describeDBClusterSnapshotAttributes(
          String dbClusterSnapshotIdentifier) async {
    return DescribeDBClusterSnapshotAttributesResult.fromJson({});
  }

  /// Returns information about DB cluster snapshots. This API operation
  /// supports pagination.
  ///
  /// [dbClusterIdentifier]: The ID of the DB cluster to retrieve the list of DB
  /// cluster snapshots for. This parameter can't be used with the
  /// `DBClusterSnapshotIdentifier` parameter. This parameter is not case
  /// sensitive.
  ///
  /// Constraints:
  ///
  /// *   If provided, must match the identifier of an existing `DBCluster`.
  ///
  /// [dbClusterSnapshotIdentifier]: A specific DB cluster snapshot identifier
  /// to describe. This parameter can't be used with the `DBClusterIdentifier`
  /// parameter. This value is stored as a lowercase string.
  ///
  /// Constraints:
  ///
  /// *   If provided, must match the identifier of an existing
  /// `DBClusterSnapshot`.
  ///
  /// *   If this identifier is for an automated snapshot, the `SnapshotType`
  /// parameter must also be specified.
  ///
  /// [snapshotType]: The type of DB cluster snapshots to be returned. You can
  /// specify one of the following values:
  ///
  /// *    `automated` \- Return all DB cluster snapshots that Amazon DocumentDB
  /// has automatically created for your AWS account.
  ///
  /// *    `manual` \- Return all DB cluster snapshots that you have manually
  /// created for your AWS account.
  ///
  /// *    `shared` \- Return all manual DB cluster snapshots that have been
  /// shared to your AWS account.
  ///
  /// *    `public` \- Return all DB cluster snapshots that have been marked as
  /// public.
  ///
  ///
  /// If you don't specify a `SnapshotType` value, then both automated and
  /// manual DB cluster snapshots are returned. You can include shared DB
  /// cluster snapshots with these results by setting the `IncludeShared`
  /// parameter to `true`. You can include public DB cluster snapshots with
  /// these results by setting the `IncludePublic` parameter to `true`.
  ///
  /// The `IncludeShared` and `IncludePublic` parameters don't apply for
  /// `SnapshotType` values of `manual` or `automated`. The `IncludePublic`
  /// parameter doesn't apply when `SnapshotType` is set to `shared`. The
  /// `IncludeShared` parameter doesn't apply when `SnapshotType` is set to
  /// `public`.
  ///
  /// [filters]: This parameter is not currently supported.
  ///
  /// [maxRecords]:  The maximum number of records to include in the response.
  /// If more records exist than the specified `MaxRecords` value, a pagination
  /// token (marker) is included in the response so that the remaining results
  /// can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  ///
  /// [marker]: An optional pagination token provided by a previous request. If
  /// this parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords`.
  ///
  /// [includeShared]: Set to `true` to include shared manual DB cluster
  /// snapshots from other AWS accounts that this AWS account has been given
  /// permission to copy or restore, and otherwise `false`. The default is
  /// `false`.
  ///
  /// [includePublic]: Set to `true` to include manual DB cluster snapshots that
  /// are public and can be copied or restored by any AWS account, and otherwise
  /// `false`. The default is `false`.
  Future<DBClusterSnapshotMessage> describeDBClusterSnapshots(
      {String dbClusterIdentifier,
      String dbClusterSnapshotIdentifier,
      String snapshotType,
      List<Filter> filters,
      int maxRecords,
      String marker,
      bool includeShared,
      bool includePublic}) async {
    return DBClusterSnapshotMessage.fromJson({});
  }

  /// Returns information about provisioned Amazon DocumentDB DB clusters. This
  /// API operation supports pagination.
  ///
  /// [dbClusterIdentifier]: The user-provided DB cluster identifier. If this
  /// parameter is specified, information from only the specific DB cluster is
  /// returned. This parameter isn't case sensitive.
  ///
  /// Constraints:
  ///
  /// *   If provided, must match an existing `DBClusterIdentifier`.
  ///
  /// [filters]: A filter that specifies one or more DB clusters to describe.
  ///
  /// Supported filters:
  ///
  /// *    `db-cluster-id` \- Accepts DB cluster identifiers and DB cluster
  /// Amazon Resource Names (ARNs). The results list only includes information
  /// about the DB clusters identified by these ARNs.
  ///
  /// [maxRecords]:  The maximum number of records to include in the response.
  /// If more records exist than the specified `MaxRecords` value, a pagination
  /// token (marker) is included in the response so that the remaining results
  /// can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  ///
  /// [marker]: An optional pagination token provided by a previous request. If
  /// this parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords`.
  Future<DBClusterMessage> describeDBClusters(
      {String dbClusterIdentifier,
      List<Filter> filters,
      int maxRecords,
      String marker}) async {
    return DBClusterMessage.fromJson({});
  }

  /// Returns a list of the available DB engines.
  ///
  /// [engine]: The database engine to return.
  ///
  /// [engineVersion]: The database engine version to return.
  ///
  /// Example: `5.1.49`
  ///
  /// [dbParameterGroupFamily]: The name of a specific DB parameter group family
  /// to return details for.
  ///
  /// Constraints:
  ///
  /// *   If provided, must match an existing `DBParameterGroupFamily`.
  ///
  /// [filters]: This parameter is not currently supported.
  ///
  /// [maxRecords]:  The maximum number of records to include in the response.
  /// If more records exist than the specified `MaxRecords` value, a pagination
  /// token (marker) is included in the response so that the remaining results
  /// can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  ///
  /// [marker]: An optional pagination token provided by a previous request. If
  /// this parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords`.
  ///
  /// [defaultOnly]: Indicates that only the default version of the specified
  /// engine or engine and major version combination is returned.
  ///
  /// [listSupportedCharacterSets]: If this parameter is specified and the
  /// requested engine supports the `CharacterSetName` parameter for
  /// `CreateDBInstance`, the response includes a list of supported character
  /// sets for each engine version.
  ///
  /// [listSupportedTimezones]: If this parameter is specified and the requested
  /// engine supports the `TimeZone` parameter for `CreateDBInstance`, the
  /// response includes a list of supported time zones for each engine version.
  Future<DBEngineVersionMessage> describeDBEngineVersions(
      {String engine,
      String engineVersion,
      String dbParameterGroupFamily,
      List<Filter> filters,
      int maxRecords,
      String marker,
      bool defaultOnly,
      bool listSupportedCharacterSets,
      bool listSupportedTimezones}) async {
    return DBEngineVersionMessage.fromJson({});
  }

  /// Returns information about provisioned Amazon DocumentDB instances. This
  /// API supports pagination.
  ///
  /// [dbInstanceIdentifier]: The user-provided instance identifier. If this
  /// parameter is specified, information from only the specific DB instance is
  /// returned. This parameter isn't case sensitive.
  ///
  /// Constraints:
  ///
  /// *   If provided, must match the identifier of an existing `DBInstance`.
  ///
  /// [filters]: A filter that specifies one or more DB instances to describe.
  ///
  /// Supported filters:
  ///
  /// *    `db-cluster-id` \- Accepts DB cluster identifiers and DB cluster
  /// Amazon Resource Names (ARNs). The results list includes only the
  /// information about the DB instances that are associated with the DB
  /// clusters that are identified by these ARNs.
  ///
  /// *    `db-instance-id` \- Accepts DB instance identifiers and DB instance
  /// ARNs. The results list includes only the information about the DB
  /// instances that are identified by these ARNs.
  ///
  /// [maxRecords]:  The maximum number of records to include in the response.
  /// If more records exist than the specified `MaxRecords` value, a pagination
  /// token (marker) is included in the response so that the remaining results
  /// can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  ///
  /// [marker]: An optional pagination token provided by a previous request. If
  /// this parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords`.
  Future<DBInstanceMessage> describeDBInstances(
      {String dbInstanceIdentifier,
      List<Filter> filters,
      int maxRecords,
      String marker}) async {
    return DBInstanceMessage.fromJson({});
  }

  /// Returns a list of `DBSubnetGroup` descriptions. If a `DBSubnetGroupName`
  /// is specified, the list will contain only the descriptions of the specified
  /// `DBSubnetGroup`.
  ///
  /// [dbSubnetGroupName]: The name of the DB subnet group to return details
  /// for.
  ///
  /// [filters]: This parameter is not currently supported.
  ///
  /// [maxRecords]:  The maximum number of records to include in the response.
  /// If more records exist than the specified `MaxRecords` value, a pagination
  /// token (marker) is included in the response so that the remaining results
  /// can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  ///
  /// [marker]: An optional pagination token provided by a previous request. If
  /// this parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords`.
  Future<DBSubnetGroupMessage> describeDBSubnetGroups(
      {String dbSubnetGroupName,
      List<Filter> filters,
      int maxRecords,
      String marker}) async {
    return DBSubnetGroupMessage.fromJson({});
  }

  /// Returns the default engine and system parameter information for the
  /// cluster database engine.
  ///
  /// [dbParameterGroupFamily]: The name of the DB cluster parameter group
  /// family to return the engine parameter information for.
  ///
  /// [filters]: This parameter is not currently supported.
  ///
  /// [maxRecords]:  The maximum number of records to include in the response.
  /// If more records exist than the specified `MaxRecords` value, a pagination
  /// token (marker) is included in the response so that the remaining results
  /// can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  ///
  /// [marker]: An optional pagination token provided by a previous request. If
  /// this parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords`.
  Future<DescribeEngineDefaultClusterParametersResult>
      describeEngineDefaultClusterParameters(String dbParameterGroupFamily,
          {List<Filter> filters, int maxRecords, String marker}) async {
    return DescribeEngineDefaultClusterParametersResult.fromJson({});
  }

  /// Displays a list of categories for all event source types, or, if
  /// specified, for a specified source type.
  ///
  /// [sourceType]: The type of source that is generating the events.
  ///
  /// Valid values: `db-instance`, `db-parameter-group`, `db-security-group`,
  /// `db-snapshot`
  ///
  /// [filters]: This parameter is not currently supported.
  Future<EventCategoriesMessage> describeEventCategories(
      {String sourceType, List<Filter> filters}) async {
    return EventCategoriesMessage.fromJson({});
  }

  /// Returns events related to DB instances, DB security groups, DB snapshots,
  /// and DB parameter groups for the past 14 days. You can obtain events
  /// specific to a particular DB instance, DB security group, DB snapshot, or
  /// DB parameter group by providing the name as a parameter. By default, the
  /// events of the past hour are returned.
  ///
  /// [sourceIdentifier]: The identifier of the event source for which events
  /// are returned. If not specified, then all sources are included in the
  /// response.
  ///
  /// Constraints:
  ///
  /// *   If `SourceIdentifier` is provided, `SourceType` must also be provided.
  ///
  /// *   If the source type is `DBInstance`, a `DBInstanceIdentifier` must be
  /// provided.
  ///
  /// *   If the source type is `DBSecurityGroup`, a `DBSecurityGroupName` must
  /// be provided.
  ///
  /// *   If the source type is `DBParameterGroup`, a `DBParameterGroupName`
  /// must be provided.
  ///
  /// *   If the source type is `DBSnapshot`, a `DBSnapshotIdentifier` must be
  /// provided.
  ///
  /// *   Cannot end with a hyphen or contain two consecutive hyphens.
  ///
  /// [sourceType]: The event source to retrieve events for. If no value is
  /// specified, all events are returned.
  ///
  /// [startTime]:  The beginning of the time interval to retrieve events for,
  /// specified in ISO 8601 format.
  ///
  /// Example: 2009-07-08T18:00Z
  ///
  /// [endTime]:  The end of the time interval for which to retrieve events,
  /// specified in ISO 8601 format.
  ///
  /// Example: 2009-07-08T18:00Z
  ///
  /// [duration]: The number of minutes to retrieve events for.
  ///
  /// Default: 60
  ///
  /// [eventCategories]: A list of event categories that trigger notifications
  /// for an event notification subscription.
  ///
  /// [filters]: This parameter is not currently supported.
  ///
  /// [maxRecords]:  The maximum number of records to include in the response.
  /// If more records exist than the specified `MaxRecords` value, a pagination
  /// token (marker) is included in the response so that the remaining results
  /// can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  ///
  /// [marker]: An optional pagination token provided by a previous request. If
  /// this parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords`.
  Future<EventsMessage> describeEvents(
      {String sourceIdentifier,
      String sourceType,
      DateTime startTime,
      DateTime endTime,
      int duration,
      List<String> eventCategories,
      List<Filter> filters,
      int maxRecords,
      String marker}) async {
    return EventsMessage.fromJson({});
  }

  /// Returns a list of orderable DB instance options for the specified engine.
  ///
  /// [engine]: The name of the engine to retrieve DB instance options for.
  ///
  /// [engineVersion]: The engine version filter value. Specify this parameter
  /// to show only the available offerings that match the specified engine
  /// version.
  ///
  /// [dbInstanceClass]: The DB instance class filter value. Specify this
  /// parameter to show only the available offerings that match the specified DB
  /// instance class.
  ///
  /// [licenseModel]: The license model filter value. Specify this parameter to
  /// show only the available offerings that match the specified license model.
  ///
  /// [vpc]: The virtual private cloud (VPC) filter value. Specify this
  /// parameter to show only the available VPC or non-VPC offerings.
  ///
  /// [filters]: This parameter is not currently supported.
  ///
  /// [maxRecords]:  The maximum number of records to include in the response.
  /// If more records exist than the specified `MaxRecords` value, a pagination
  /// token (marker) is included in the response so that the remaining results
  /// can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  ///
  /// [marker]: An optional pagination token provided by a previous request. If
  /// this parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords`.
  Future<OrderableDBInstanceOptionsMessage> describeOrderableDBInstanceOptions(
      String engine,
      {String engineVersion,
      String dbInstanceClass,
      String licenseModel,
      bool vpc,
      List<Filter> filters,
      int maxRecords,
      String marker}) async {
    return OrderableDBInstanceOptionsMessage.fromJson({});
  }

  /// Returns a list of resources (for example, DB instances) that have at least
  /// one pending maintenance action.
  ///
  /// [resourceIdentifier]: The ARN of a resource to return pending maintenance
  /// actions for.
  ///
  /// [filters]: A filter that specifies one or more resources to return pending
  /// maintenance actions for.
  ///
  /// Supported filters:
  ///
  /// *    `db-cluster-id` \- Accepts DB cluster identifiers and DB cluster
  /// Amazon Resource Names (ARNs). The results list includes only pending
  /// maintenance actions for the DB clusters identified by these ARNs.
  ///
  /// *    `db-instance-id` \- Accepts DB instance identifiers and DB instance
  /// ARNs. The results list includes only pending maintenance actions for the
  /// DB instances identified by these ARNs.
  ///
  /// [marker]: An optional pagination token provided by a previous request. If
  /// this parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords`.
  ///
  /// [maxRecords]:  The maximum number of records to include in the response.
  /// If more records exist than the specified `MaxRecords` value, a pagination
  /// token (marker) is included in the response so that the remaining results
  /// can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  Future<PendingMaintenanceActionsMessage> describePendingMaintenanceActions(
      {String resourceIdentifier,
      List<Filter> filters,
      String marker,
      int maxRecords}) async {
    return PendingMaintenanceActionsMessage.fromJson({});
  }

  /// Forces a failover for a DB cluster.
  ///
  /// A failover for a DB cluster promotes one of the Amazon DocumentDB replicas
  /// (read-only instances) in the DB cluster to be the primary instance (the
  /// cluster writer).
  ///
  /// If the primary instance fails, Amazon DocumentDB automatically fails over
  /// to an Amazon DocumentDB replica, if one exists. You can force a failover
  /// when you want to simulate a failure of a primary instance for testing.
  ///
  /// [dbClusterIdentifier]: A DB cluster identifier to force a failover for.
  /// This parameter is not case sensitive.
  ///
  /// Constraints:
  ///
  /// *   Must match the identifier of an existing `DBCluster`.
  ///
  /// [targetDBInstanceIdentifier]: The name of the instance to promote to the
  /// primary instance.
  ///
  /// You must specify the instance identifier for an Amazon DocumentDB replica
  /// in the DB cluster. For example, `mydbcluster-replica1`.
  Future<FailoverDBClusterResult> failoverDBCluster(
      {String dbClusterIdentifier, String targetDBInstanceIdentifier}) async {
    return FailoverDBClusterResult.fromJson({});
  }

  /// Lists all tags on an Amazon DocumentDB resource.
  ///
  /// [resourceName]: The Amazon DocumentDB resource with tags to be listed.
  /// This value is an Amazon Resource Name (ARN).
  ///
  /// [filters]: This parameter is not currently supported.
  Future<TagListMessage> listTagsForResource(String resourceName,
      {List<Filter> filters}) async {
    return TagListMessage.fromJson({});
  }

  /// Modifies a setting for an Amazon DocumentDB DB cluster. You can change one
  /// or more database configuration parameters by specifying these parameters
  /// and the new values in the request.
  ///
  /// [dbClusterIdentifier]: The DB cluster identifier for the cluster that is
  /// being modified. This parameter is not case sensitive.
  ///
  /// Constraints:
  ///
  /// *   Must match the identifier of an existing `DBCluster`.
  ///
  /// [newDBClusterIdentifier]: The new DB cluster identifier for the DB cluster
  /// when renaming a DB cluster. This value is stored as a lowercase string.
  ///
  /// Constraints:
  ///
  /// *   Must contain from 1 to 63 letters, numbers, or hyphens.
  ///
  /// *   The first character must be a letter.
  ///
  /// *   Cannot end with a hyphen or contain two consecutive hyphens.
  ///
  ///
  /// Example: `my-cluster2`
  ///
  /// [applyImmediately]: A value that specifies whether the changes in this
  /// request and any pending changes are asynchronously applied as soon as
  /// possible, regardless of the `PreferredMaintenanceWindow` setting for the
  /// DB cluster. If this parameter is set to `false`, changes to the DB cluster
  /// are applied during the next maintenance window.
  ///
  /// The `ApplyImmediately` parameter affects only the `NewDBClusterIdentifier`
  /// and `MasterUserPassword` values. If you set this parameter value to
  /// `false`, the changes to the `NewDBClusterIdentifier` and
  /// `MasterUserPassword` values are applied during the next maintenance
  /// window. All other changes are applied immediately, regardless of the value
  /// of the `ApplyImmediately` parameter.
  ///
  /// Default: `false`
  ///
  /// [backupRetentionPeriod]: The number of days for which automated backups
  /// are retained. You must specify a minimum value of 1.
  ///
  /// Default: 1
  ///
  /// Constraints:
  ///
  /// *   Must be a value from 1 to 35.
  ///
  /// [dbClusterParameterGroupName]: The name of the DB cluster parameter group
  /// to use for the DB cluster.
  ///
  /// [vpcSecurityGroupIds]: A list of virtual private cloud (VPC) security
  /// groups that the DB cluster will belong to.
  ///
  /// [port]: The port number on which the DB cluster accepts connections.
  ///
  /// Constraints: Must be a value from `1150` to `65535`.
  ///
  /// Default: The same port as the original DB cluster.
  ///
  /// [masterUserPassword]: The password for the master database user. This
  /// password can contain any printable ASCII character except forward slash
  /// (/), double quote ("), or the "at" symbol (@).
  ///
  /// Constraints: Must contain from 8 to 41 characters.
  ///
  /// [preferredBackupWindow]: The daily time range during which automated
  /// backups are created if automated backups are enabled, using the
  /// `BackupRetentionPeriod` parameter.
  ///
  /// The default is a 30-minute window selected at random from an 8-hour block
  /// of time for each AWS Region.
  ///
  /// Constraints:
  ///
  /// *   Must be in the format `hh24:mi-hh24:mi`.
  ///
  /// *   Must be in Universal Coordinated Time (UTC).
  ///
  /// *   Must not conflict with the preferred maintenance window.
  ///
  /// *   Must be at least 30 minutes.
  ///
  /// [preferredMaintenanceWindow]: The weekly time range during which system
  /// maintenance can occur, in Universal Coordinated Time (UTC).
  ///
  /// Format: `ddd:hh24:mi-ddd:hh24:mi`
  ///
  /// The default is a 30-minute window selected at random from an 8-hour block
  /// of time for each AWS Region, occurring on a random day of the week.
  ///
  /// Valid days: Mon, Tue, Wed, Thu, Fri, Sat, Sun
  ///
  /// Constraints: Minimum 30-minute window.
  ///
  /// [cloudwatchLogsExportConfiguration]: The configuration setting for the log
  /// types to be enabled for export to Amazon CloudWatch Logs for a specific DB
  /// instance or DB cluster. The `EnableLogTypes` and `DisableLogTypes` arrays
  /// determine which logs are exported (or not exported) to CloudWatch Logs.
  ///
  /// [engineVersion]: The version number of the database engine to which you
  /// want to upgrade. Changing this parameter results in an outage. The change
  /// is applied during the next maintenance window unless the
  /// `ApplyImmediately` parameter is set to `true`.
  ///
  /// [deletionProtection]: Specifies whether this cluster can be deleted. If
  /// `DeletionProtection` is enabled, the cluster cannot be deleted unless it
  /// is modified and `DeletionProtection` is disabled. `DeletionProtection`
  /// protects clusters from being accidentally deleted.
  Future<ModifyDBClusterResult> modifyDBCluster(String dbClusterIdentifier,
      {String newDBClusterIdentifier,
      bool applyImmediately,
      int backupRetentionPeriod,
      String dbClusterParameterGroupName,
      List<String> vpcSecurityGroupIds,
      int port,
      String masterUserPassword,
      String preferredBackupWindow,
      String preferredMaintenanceWindow,
      CloudwatchLogsExportConfiguration cloudwatchLogsExportConfiguration,
      String engineVersion,
      bool deletionProtection}) async {
    return ModifyDBClusterResult.fromJson({});
  }

  ///  Modifies the parameters of a DB cluster parameter group. To modify more
  /// than one parameter, submit a list of the following: `ParameterName`,
  /// `ParameterValue`, and `ApplyMethod`. A maximum of 20 parameters can be
  /// modified in a single request.
  ///
  ///  Changes to dynamic parameters are applied immediately. Changes to static
  /// parameters require a reboot or maintenance window before the change can
  /// take effect.
  ///
  /// After you create a DB cluster parameter group, you should wait at least 5
  /// minutes before creating your first DB cluster that uses that DB cluster
  /// parameter group as the default parameter group. This allows Amazon
  /// DocumentDB to fully complete the create action before the parameter group
  /// is used as the default for a new DB cluster. This step is especially
  /// important for parameters that are critical when creating the default
  /// database for a DB cluster, such as the character set for the default
  /// database defined by the `character\_set\_database` parameter.
  ///
  /// [dbClusterParameterGroupName]: The name of the DB cluster parameter group
  /// to modify.
  ///
  /// [parameters]: A list of parameters in the DB cluster parameter group to
  /// modify.
  Future<DBClusterParameterGroupNameMessage> modifyDBClusterParameterGroup(
      {@required String dbClusterParameterGroupName,
      @required List<Parameter> parameters}) async {
    return DBClusterParameterGroupNameMessage.fromJson({});
  }

  /// Adds an attribute and values to, or removes an attribute and values from,
  /// a manual DB cluster snapshot.
  ///
  /// To share a manual DB cluster snapshot with other AWS accounts, specify
  /// `restore` as the `AttributeName`, and use the `ValuesToAdd` parameter to
  /// add a list of IDs of the AWS accounts that are authorized to restore the
  /// manual DB cluster snapshot. Use the value `all` to make the manual DB
  /// cluster snapshot public, which means that it can be copied or restored by
  /// all AWS accounts. Do not add the `all` value for any manual DB cluster
  /// snapshots that contain private information that you don't want available
  /// to all AWS accounts. If a manual DB cluster snapshot is encrypted, it can
  /// be shared, but only by specifying a list of authorized AWS account IDs for
  /// the `ValuesToAdd` parameter. You can't use `all` as a value for that
  /// parameter in this case.
  ///
  /// [dbClusterSnapshotIdentifier]: The identifier for the DB cluster snapshot
  /// to modify the attributes for.
  ///
  /// [attributeName]: The name of the DB cluster snapshot attribute to modify.
  ///
  /// To manage authorization for other AWS accounts to copy or restore a manual
  /// DB cluster snapshot, set this value to `restore`.
  ///
  /// [valuesToAdd]: A list of DB cluster snapshot attributes to add to the
  /// attribute specified by `AttributeName`.
  ///
  /// To authorize other AWS accounts to copy or restore a manual DB cluster
  /// snapshot, set this list to include one or more AWS account IDs. To make
  /// the manual DB cluster snapshot restorable by any AWS account, set it to
  /// `all`. Do not add the `all` value for any manual DB cluster snapshots that
  /// contain private information that you don't want to be available to all AWS
  /// accounts.
  ///
  /// [valuesToRemove]: A list of DB cluster snapshot attributes to remove from
  /// the attribute specified by `AttributeName`.
  ///
  /// To remove authorization for other AWS accounts to copy or restore a manual
  /// DB cluster snapshot, set this list to include one or more AWS account
  /// identifiers. To remove authorization for any AWS account to copy or
  /// restore the DB cluster snapshot, set it to `all` . If you specify `all`,
  /// an AWS account whose account ID is explicitly added to the `restore`
  /// attribute can still copy or restore a manual DB cluster snapshot.
  Future<ModifyDBClusterSnapshotAttributeResult>
      modifyDBClusterSnapshotAttribute(
          {@required String dbClusterSnapshotIdentifier,
          @required String attributeName,
          List<String> valuesToAdd,
          List<String> valuesToRemove}) async {
    return ModifyDBClusterSnapshotAttributeResult.fromJson({});
  }

  /// Modifies settings for a DB instance. You can change one or more database
  /// configuration parameters by specifying these parameters and the new values
  /// in the request.
  ///
  /// [dbInstanceIdentifier]: The DB instance identifier. This value is stored
  /// as a lowercase string.
  ///
  /// Constraints:
  ///
  /// *   Must match the identifier of an existing `DBInstance`.
  ///
  /// [dbInstanceClass]: The new compute and memory capacity of the DB instance;
  /// for example, `db.r5.large`. Not all DB instance classes are available in
  /// all AWS Regions.
  ///
  /// If you modify the DB instance class, an outage occurs during the change.
  /// The change is applied during the next maintenance window, unless
  /// `ApplyImmediately` is specified as `true` for this request.
  ///
  /// Default: Uses existing setting.
  ///
  /// [applyImmediately]: Specifies whether the modifications in this request
  /// and any pending modifications are asynchronously applied as soon as
  /// possible, regardless of the `PreferredMaintenanceWindow` setting for the
  /// DB instance.
  ///
  ///  If this parameter is set to `false`, changes to the DB instance are
  /// applied during the next maintenance window. Some parameter changes can
  /// cause an outage and are applied on the next reboot.
  ///
  /// Default: `false`
  ///
  /// [preferredMaintenanceWindow]: The weekly time range (in UTC) during which
  /// system maintenance can occur, which might result in an outage. Changing
  /// this parameter doesn't result in an outage except in the following
  /// situation, and the change is asynchronously applied as soon as possible.
  /// If there are pending actions that cause a reboot, and the maintenance
  /// window is changed to include the current time, changing this parameter
  /// causes a reboot of the DB instance. If you are moving this window to the
  /// current time, there must be at least 30 minutes between the current time
  /// and end of the window to ensure that pending changes are applied.
  ///
  /// Default: Uses existing setting.
  ///
  /// Format: `ddd:hh24:mi-ddd:hh24:mi`
  ///
  /// Valid days: Mon, Tue, Wed, Thu, Fri, Sat, Sun
  ///
  /// Constraints: Must be at least 30 minutes.
  ///
  /// [autoMinorVersionUpgrade]: Indicates that minor version upgrades are
  /// applied automatically to the DB instance during the maintenance window.
  /// Changing this parameter doesn't result in an outage except in the
  /// following case, and the change is asynchronously applied as soon as
  /// possible. An outage results if this parameter is set to `true` during the
  /// maintenance window, and a newer minor version is available, and Amazon
  /// DocumentDB has enabled automatic patching for that engine version.
  ///
  /// [newDBInstanceIdentifier]:  The new DB instance identifier for the DB
  /// instance when renaming a DB instance. When you change the DB instance
  /// identifier, an instance reboot occurs immediately if you set `Apply
  /// Immediately` to `true`. It occurs during the next maintenance window if
  /// you set `Apply Immediately` to `false`. This value is stored as a
  /// lowercase string.
  ///
  /// Constraints:
  ///
  /// *   Must contain from 1 to 63 letters, numbers, or hyphens.
  ///
  /// *   The first character must be a letter.
  ///
  /// *   Cannot end with a hyphen or contain two consecutive hyphens.
  ///
  ///
  /// Example: `mydbinstance`
  ///
  /// [promotionTier]: A value that specifies the order in which an Amazon
  /// DocumentDB replica is promoted to the primary instance after a failure of
  /// the existing primary instance.
  ///
  /// Default: 1
  ///
  /// Valid values: 0-15
  Future<ModifyDBInstanceResult> modifyDBInstance(String dbInstanceIdentifier,
      {String dbInstanceClass,
      bool applyImmediately,
      String preferredMaintenanceWindow,
      bool autoMinorVersionUpgrade,
      String newDBInstanceIdentifier,
      int promotionTier}) async {
    return ModifyDBInstanceResult.fromJson({});
  }

  /// Modifies an existing DB subnet group. DB subnet groups must contain at
  /// least one subnet in at least two Availability Zones in the AWS Region.
  ///
  /// [dbSubnetGroupName]: The name for the DB subnet group. This value is
  /// stored as a lowercase string. You can't modify the default subnet group.
  ///
  /// Constraints: Must match the name of an existing `DBSubnetGroup`. Must not
  /// be default.
  ///
  /// Example: `mySubnetgroup`
  ///
  /// [dbSubnetGroupDescription]: The description for the DB subnet group.
  ///
  /// [subnetIds]: The Amazon EC2 subnet IDs for the DB subnet group.
  Future<ModifyDBSubnetGroupResult> modifyDBSubnetGroup(
      {@required String dbSubnetGroupName,
      String dbSubnetGroupDescription,
      @required List<String> subnetIds}) async {
    return ModifyDBSubnetGroupResult.fromJson({});
  }

  /// You might need to reboot your DB instance, usually for maintenance
  /// reasons. For example, if you make certain changes, or if you change the DB
  /// cluster parameter group that is associated with the DB instance, you must
  /// reboot the instance for the changes to take effect.
  ///
  /// Rebooting a DB instance restarts the database engine service. Rebooting a
  /// DB instance results in a momentary outage, during which the DB instance
  /// status is set to _rebooting_.
  ///
  /// [dbInstanceIdentifier]: The DB instance identifier. This parameter is
  /// stored as a lowercase string.
  ///
  /// Constraints:
  ///
  /// *   Must match the identifier of an existing `DBInstance`.
  ///
  /// [forceFailover]:  When `true`, the reboot is conducted through a Multi-AZ
  /// failover.
  ///
  /// Constraint: You can't specify `true` if the instance is not configured for
  /// Multi-AZ.
  Future<RebootDBInstanceResult> rebootDBInstance(String dbInstanceIdentifier,
      {bool forceFailover}) async {
    return RebootDBInstanceResult.fromJson({});
  }

  /// Removes metadata tags from an Amazon DocumentDB resource.
  ///
  /// [resourceName]: The Amazon DocumentDB resource that the tags are removed
  /// from. This value is an Amazon Resource Name (ARN).
  ///
  /// [tagKeys]: The tag key (name) of the tag to be removed.
  Future<void> removeTagsFromResource(
      {@required String resourceName, @required List<String> tagKeys}) async {}

  ///  Modifies the parameters of a DB cluster parameter group to the default
  /// value. To reset specific parameters, submit a list of the following:
  /// `ParameterName` and `ApplyMethod`. To reset the entire DB cluster
  /// parameter group, specify the `DBClusterParameterGroupName` and
  /// `ResetAllParameters` parameters.
  ///
  ///  When you reset the entire group, dynamic parameters are updated
  /// immediately and static parameters are set to `pending-reboot` to take
  /// effect on the next DB instance reboot.
  ///
  /// [dbClusterParameterGroupName]: The name of the DB cluster parameter group
  /// to reset.
  ///
  /// [resetAllParameters]: A value that is set to `true` to reset all
  /// parameters in the DB cluster parameter group to their default values, and
  /// `false` otherwise. You can't use this parameter if there is a list of
  /// parameter names specified for the `Parameters` parameter.
  ///
  /// [parameters]: A list of parameter names in the DB cluster parameter group
  /// to reset to the default values. You can't use this parameter if the
  /// `ResetAllParameters` parameter is set to `true`.
  Future<DBClusterParameterGroupNameMessage> resetDBClusterParameterGroup(
      String dbClusterParameterGroupName,
      {bool resetAllParameters,
      List<Parameter> parameters}) async {
    return DBClusterParameterGroupNameMessage.fromJson({});
  }

  /// Creates a new DB cluster from a DB snapshot or DB cluster snapshot.
  ///
  /// If a DB snapshot is specified, the target DB cluster is created from the
  /// source DB snapshot with a default configuration and default security
  /// group.
  ///
  /// If a DB cluster snapshot is specified, the target DB cluster is created
  /// from the source DB cluster restore point with the same configuration as
  /// the original source DB cluster, except that the new DB cluster is created
  /// with the default security group.
  ///
  /// [availabilityZones]: Provides the list of Amazon EC2 Availability Zones
  /// that instances in the restored DB cluster can be created in.
  ///
  /// [dbClusterIdentifier]: The name of the DB cluster to create from the DB
  /// snapshot or DB cluster snapshot. This parameter isn't case sensitive.
  ///
  /// Constraints:
  ///
  /// *   Must contain from 1 to 63 letters, numbers, or hyphens.
  ///
  /// *   The first character must be a letter.
  ///
  /// *   Cannot end with a hyphen or contain two consecutive hyphens.
  ///
  ///
  /// Example: `my-snapshot-id`
  ///
  /// [snapshotIdentifier]: The identifier for the DB snapshot or DB cluster
  /// snapshot to restore from.
  ///
  /// You can use either the name or the Amazon Resource Name (ARN) to specify a
  /// DB cluster snapshot. However, you can use only the ARN to specify a DB
  /// snapshot.
  ///
  /// Constraints:
  ///
  /// *   Must match the identifier of an existing snapshot.
  ///
  /// [engine]: The database engine to use for the new DB cluster.
  ///
  /// Default: The same as source.
  ///
  /// Constraint: Must be compatible with the engine of the source.
  ///
  /// [engineVersion]: The version of the database engine to use for the new DB
  /// cluster.
  ///
  /// [port]: The port number on which the new DB cluster accepts connections.
  ///
  /// Constraints: Must be a value from `1150` to `65535`.
  ///
  /// Default: The same port as the original DB cluster.
  ///
  /// [dbSubnetGroupName]: The name of the DB subnet group to use for the new DB
  /// cluster.
  ///
  /// Constraints: If provided, must match the name of an existing
  /// `DBSubnetGroup`.
  ///
  /// Example: `mySubnetgroup`
  ///
  /// [vpcSecurityGroupIds]: A list of virtual private cloud (VPC) security
  /// groups that the new DB cluster will belong to.
  ///
  /// [tags]: The tags to be assigned to the restored DB cluster.
  ///
  /// [kmsKeyId]: The AWS KMS key identifier to use when restoring an encrypted
  /// DB cluster from a DB snapshot or DB cluster snapshot.
  ///
  /// The AWS KMS key identifier is the Amazon Resource Name (ARN) for the AWS
  /// KMS encryption key. If you are restoring a DB cluster with the same AWS
  /// account that owns the AWS KMS encryption key used to encrypt the new DB
  /// cluster, then you can use the AWS KMS key alias instead of the ARN for the
  /// AWS KMS encryption key.
  ///
  /// If you do not specify a value for the `KmsKeyId` parameter, then the
  /// following occurs:
  ///
  /// *   If the DB snapshot or DB cluster snapshot in `SnapshotIdentifier` is
  /// encrypted, then the restored DB cluster is encrypted using the AWS KMS key
  /// that was used to encrypt the DB snapshot or the DB cluster snapshot.
  ///
  /// *   If the DB snapshot or the DB cluster snapshot in `SnapshotIdentifier`
  /// is not encrypted, then the restored DB cluster is not encrypted.
  ///
  /// [enableCloudwatchLogsExports]: A list of log types that must be enabled
  /// for exporting to Amazon CloudWatch Logs.
  ///
  /// [deletionProtection]: Specifies whether this cluster can be deleted. If
  /// `DeletionProtection` is enabled, the cluster cannot be deleted unless it
  /// is modified and `DeletionProtection` is disabled. `DeletionProtection`
  /// protects clusters from being accidentally deleted.
  Future<RestoreDBClusterFromSnapshotResult> restoreDBClusterFromSnapshot(
      {List<String> availabilityZones,
      @required String dbClusterIdentifier,
      @required String snapshotIdentifier,
      @required String engine,
      String engineVersion,
      int port,
      String dbSubnetGroupName,
      List<String> vpcSecurityGroupIds,
      List<Tag> tags,
      String kmsKeyId,
      List<String> enableCloudwatchLogsExports,
      bool deletionProtection}) async {
    return RestoreDBClusterFromSnapshotResult.fromJson({});
  }

  /// Restores a DB cluster to an arbitrary point in time. Users can restore to
  /// any point in time before `LatestRestorableTime` for up to
  /// `BackupRetentionPeriod` days. The target DB cluster is created from the
  /// source DB cluster with the same configuration as the original DB cluster,
  /// except that the new DB cluster is created with the default DB security
  /// group.
  ///
  /// [dbClusterIdentifier]: The name of the new DB cluster to be created.
  ///
  /// Constraints:
  ///
  /// *   Must contain from 1 to 63 letters, numbers, or hyphens.
  ///
  /// *   The first character must be a letter.
  ///
  /// *   Cannot end with a hyphen or contain two consecutive hyphens.
  ///
  /// [sourceDBClusterIdentifier]: The identifier of the source DB cluster from
  /// which to restore.
  ///
  /// Constraints:
  ///
  /// *   Must match the identifier of an existing `DBCluster`.
  ///
  /// [restoreToTime]: The date and time to restore the DB cluster to.
  ///
  /// Valid values: A time in Universal Coordinated Time (UTC) format.
  ///
  /// Constraints:
  ///
  /// *   Must be before the latest restorable time for the DB instance.
  ///
  /// *   Must be specified if the `UseLatestRestorableTime` parameter is not
  /// provided.
  ///
  /// *   Cannot be specified if the `UseLatestRestorableTime` parameter is
  /// `true`.
  ///
  /// *   Cannot be specified if the `RestoreType` parameter is `copy-on-write`.
  ///
  ///
  /// Example: `2015-03-07T23:45:00Z`
  ///
  /// [useLatestRestorableTime]: A value that is set to `true` to restore the DB
  /// cluster to the latest restorable backup time, and `false` otherwise.
  ///
  /// Default: `false`
  ///
  /// Constraints: Cannot be specified if the `RestoreToTime` parameter is
  /// provided.
  ///
  /// [port]: The port number on which the new DB cluster accepts connections.
  ///
  /// Constraints: Must be a value from `1150` to `65535`.
  ///
  /// Default: The default port for the engine.
  ///
  /// [dbSubnetGroupName]: The DB subnet group name to use for the new DB
  /// cluster.
  ///
  /// Constraints: If provided, must match the name of an existing
  /// `DBSubnetGroup`.
  ///
  /// Example: `mySubnetgroup`
  ///
  /// [vpcSecurityGroupIds]: A list of VPC security groups that the new DB
  /// cluster belongs to.
  ///
  /// [tags]: The tags to be assigned to the restored DB cluster.
  ///
  /// [kmsKeyId]: The AWS KMS key identifier to use when restoring an encrypted
  /// DB cluster from an encrypted DB cluster.
  ///
  /// The AWS KMS key identifier is the Amazon Resource Name (ARN) for the AWS
  /// KMS encryption key. If you are restoring a DB cluster with the same AWS
  /// account that owns the AWS KMS encryption key used to encrypt the new DB
  /// cluster, then you can use the AWS KMS key alias instead of the ARN for the
  /// AWS KMS encryption key.
  ///
  /// You can restore to a new DB cluster and encrypt the new DB cluster with an
  /// AWS KMS key that is different from the AWS KMS key used to encrypt the
  /// source DB cluster. The new DB cluster is encrypted with the AWS KMS key
  /// identified by the `KmsKeyId` parameter.
  ///
  /// If you do not specify a value for the `KmsKeyId` parameter, then the
  /// following occurs:
  ///
  /// *   If the DB cluster is encrypted, then the restored DB cluster is
  /// encrypted using the AWS KMS key that was used to encrypt the source DB
  /// cluster.
  ///
  /// *   If the DB cluster is not encrypted, then the restored DB cluster is
  /// not encrypted.
  ///
  ///
  /// If `DBClusterIdentifier` refers to a DB cluster that is not encrypted,
  /// then the restore request is rejected.
  ///
  /// [enableCloudwatchLogsExports]: A list of log types that must be enabled
  /// for exporting to Amazon CloudWatch Logs.
  ///
  /// [deletionProtection]: Specifies whether this cluster can be deleted. If
  /// `DeletionProtection` is enabled, the cluster cannot be deleted unless it
  /// is modified and `DeletionProtection` is disabled. `DeletionProtection`
  /// protects clusters from being accidentally deleted.
  Future<RestoreDBClusterToPointInTimeResult> restoreDBClusterToPointInTime(
      {@required String dbClusterIdentifier,
      @required String sourceDBClusterIdentifier,
      DateTime restoreToTime,
      bool useLatestRestorableTime,
      int port,
      String dbSubnetGroupName,
      List<String> vpcSecurityGroupIds,
      List<Tag> tags,
      String kmsKeyId,
      List<String> enableCloudwatchLogsExports,
      bool deletionProtection}) async {
    return RestoreDBClusterToPointInTimeResult.fromJson({});
  }

  /// Restarts the stopped cluster that is specified by `DBClusterIdentifier`.
  /// For more information, see [Stopping and Starting an Amazon DocumentDB
  /// Cluster](https://docs.aws.amazon.com/documentdb/latest/developerguide/db-cluster-stop-start.html).
  ///
  /// [dbClusterIdentifier]: The identifier of the cluster to restart. Example:
  /// `docdb-2019-05-28-15-24-52`
  Future<StartDBClusterResult> startDBCluster(
      String dbClusterIdentifier) async {
    return StartDBClusterResult.fromJson({});
  }

  /// Stops the running cluster that is specified by `DBClusterIdentifier`. The
  /// cluster must be in the _available_ state. For more information, see
  /// [Stopping and Starting an Amazon DocumentDB
  /// Cluster](https://docs.aws.amazon.com/documentdb/latest/developerguide/db-cluster-stop-start.html).
  ///
  /// [dbClusterIdentifier]: The identifier of the cluster to stop. Example:
  /// `docdb-2019-05-28-15-24-52`
  Future<StopDBClusterResult> stopDBCluster(String dbClusterIdentifier) async {
    return StopDBClusterResult.fromJson({});
  }
}

class ApplyPendingMaintenanceActionResult {
  final ResourcePendingMaintenanceActions resourcePendingMaintenanceActions;

  ApplyPendingMaintenanceActionResult({
    this.resourcePendingMaintenanceActions,
  });
  static ApplyPendingMaintenanceActionResult fromJson(
          Map<String, dynamic> json) =>
      ApplyPendingMaintenanceActionResult();
}

class AvailabilityZone {
  /// The name of the Availability Zone.
  final String name;

  AvailabilityZone({
    this.name,
  });
  static AvailabilityZone fromJson(Map<String, dynamic> json) =>
      AvailabilityZone();
}

class CloudwatchLogsExportConfiguration {
  /// The list of log types to enable.
  final List<String> enableLogTypes;

  /// The list of log types to disable.
  final List<String> disableLogTypes;

  CloudwatchLogsExportConfiguration({
    this.enableLogTypes,
    this.disableLogTypes,
  });
}

class CopyDBClusterParameterGroupResult {
  final DBClusterParameterGroup dbClusterParameterGroup;

  CopyDBClusterParameterGroupResult({
    this.dbClusterParameterGroup,
  });
  static CopyDBClusterParameterGroupResult fromJson(
          Map<String, dynamic> json) =>
      CopyDBClusterParameterGroupResult();
}

class CopyDBClusterSnapshotResult {
  final DBClusterSnapshot dbClusterSnapshot;

  CopyDBClusterSnapshotResult({
    this.dbClusterSnapshot,
  });
  static CopyDBClusterSnapshotResult fromJson(Map<String, dynamic> json) =>
      CopyDBClusterSnapshotResult();
}

class CreateDBClusterParameterGroupResult {
  final DBClusterParameterGroup dbClusterParameterGroup;

  CreateDBClusterParameterGroupResult({
    this.dbClusterParameterGroup,
  });
  static CreateDBClusterParameterGroupResult fromJson(
          Map<String, dynamic> json) =>
      CreateDBClusterParameterGroupResult();
}

class CreateDBClusterResult {
  final DBCluster dbCluster;

  CreateDBClusterResult({
    this.dbCluster,
  });
  static CreateDBClusterResult fromJson(Map<String, dynamic> json) =>
      CreateDBClusterResult();
}

class CreateDBClusterSnapshotResult {
  final DBClusterSnapshot dbClusterSnapshot;

  CreateDBClusterSnapshotResult({
    this.dbClusterSnapshot,
  });
  static CreateDBClusterSnapshotResult fromJson(Map<String, dynamic> json) =>
      CreateDBClusterSnapshotResult();
}

class CreateDBInstanceResult {
  final DBInstance dbInstance;

  CreateDBInstanceResult({
    this.dbInstance,
  });
  static CreateDBInstanceResult fromJson(Map<String, dynamic> json) =>
      CreateDBInstanceResult();
}

class CreateDBSubnetGroupResult {
  final DBSubnetGroup dbSubnetGroup;

  CreateDBSubnetGroupResult({
    this.dbSubnetGroup,
  });
  static CreateDBSubnetGroupResult fromJson(Map<String, dynamic> json) =>
      CreateDBSubnetGroupResult();
}

class DBCluster {
  /// Provides the list of Amazon EC2 Availability Zones that instances in the
  /// DB cluster can be created in.
  final List<String> availabilityZones;

  /// Specifies the number of days for which automatic DB snapshots are
  /// retained.
  final int backupRetentionPeriod;

  /// Contains a user-supplied DB cluster identifier. This identifier is the
  /// unique key that identifies a DB cluster.
  final String dbClusterIdentifier;

  /// Specifies the name of the DB cluster parameter group for the DB cluster.
  final String dbClusterParameterGroup;

  /// Specifies information on the subnet group that is associated with the DB
  /// cluster, including the name, description, and subnets in the subnet group.
  final String dbSubnetGroup;

  /// Specifies the current state of this DB cluster.
  final String status;

  /// Specifies the progress of the operation as a percentage.
  final String percentProgress;

  /// The earliest time to which a database can be restored with point-in-time
  /// restore.
  final DateTime earliestRestorableTime;

  /// Specifies the connection endpoint for the primary instance of the DB
  /// cluster.
  final String endpoint;

  /// The reader endpoint for the DB cluster. The reader endpoint for a DB
  /// cluster load balances connections across the Amazon DocumentDB replicas
  /// that are available in a DB cluster. As clients request new connections to
  /// the reader endpoint, Amazon DocumentDB distributes the connection requests
  /// among the Amazon DocumentDB replicas in the DB cluster. This functionality
  /// can help balance your read workload across multiple Amazon DocumentDB
  /// replicas in your DB cluster.
  ///
  /// If a failover occurs, and the Amazon DocumentDB replica that you are
  /// connected to is promoted to be the primary instance, your connection is
  /// dropped. To continue sending your read workload to other Amazon DocumentDB
  /// replicas in the cluster, you can then reconnect to the reader endpoint.
  final String readerEndpoint;

  /// Specifies whether the DB cluster has instances in multiple Availability
  /// Zones.
  final bool multiAZ;

  /// Provides the name of the database engine to be used for this DB cluster.
  final String engine;

  /// Indicates the database engine version.
  final String engineVersion;

  /// Specifies the latest time to which a database can be restored with
  /// point-in-time restore.
  final DateTime latestRestorableTime;

  /// Specifies the port that the database engine is listening on.
  final int port;

  /// Contains the master user name for the DB cluster.
  final String masterUsername;

  /// Specifies the daily time range during which automated backups are created
  /// if automated backups are enabled, as determined by the
  /// `BackupRetentionPeriod`.
  final String preferredBackupWindow;

  /// Specifies the weekly time range during which system maintenance can occur,
  /// in Universal Coordinated Time (UTC).
  final String preferredMaintenanceWindow;

  /// Provides the list of instances that make up the DB cluster.
  final List<DBClusterMember> dbClusterMembers;

  /// Provides a list of virtual private cloud (VPC) security groups that the DB
  /// cluster belongs to.
  final List<VpcSecurityGroupMembership> vpcSecurityGroups;

  /// Specifies the ID that Amazon Route 53 assigns when you create a hosted
  /// zone.
  final String hostedZoneId;

  /// Specifies whether the DB cluster is encrypted.
  final bool storageEncrypted;

  /// If `StorageEncrypted` is `true`, the AWS KMS key identifier for the
  /// encrypted DB cluster.
  final String kmsKeyId;

  /// The AWS Region-unique, immutable identifier for the DB cluster. This
  /// identifier is found in AWS CloudTrail log entries whenever the AWS KMS key
  /// for the DB cluster is accessed.
  final String dbClusterResourceId;

  /// The Amazon Resource Name (ARN) for the DB cluster.
  final String dbClusterArn;

  /// Provides a list of the AWS Identity and Access Management (IAM) roles that
  /// are associated with the DB cluster. IAM roles that are associated with a
  /// DB cluster grant permission for the DB cluster to access other AWS
  /// services on your behalf.
  final List<DBClusterRole> associatedRoles;

  /// Specifies the time when the DB cluster was created, in Universal
  /// Coordinated Time (UTC).
  final DateTime clusterCreateTime;

  /// A list of log types that this DB cluster is configured to export to Amazon
  /// CloudWatch Logs.
  final List<String> enabledCloudwatchLogsExports;

  /// Specifies whether this cluster can be deleted. If `DeletionProtection` is
  /// enabled, the cluster cannot be deleted unless it is modified and
  /// `DeletionProtection` is disabled. `DeletionProtection` protects clusters
  /// from being accidentally deleted.
  final bool deletionProtection;

  DBCluster({
    this.availabilityZones,
    this.backupRetentionPeriod,
    this.dbClusterIdentifier,
    this.dbClusterParameterGroup,
    this.dbSubnetGroup,
    this.status,
    this.percentProgress,
    this.earliestRestorableTime,
    this.endpoint,
    this.readerEndpoint,
    this.multiAZ,
    this.engine,
    this.engineVersion,
    this.latestRestorableTime,
    this.port,
    this.masterUsername,
    this.preferredBackupWindow,
    this.preferredMaintenanceWindow,
    this.dbClusterMembers,
    this.vpcSecurityGroups,
    this.hostedZoneId,
    this.storageEncrypted,
    this.kmsKeyId,
    this.dbClusterResourceId,
    this.dbClusterArn,
    this.associatedRoles,
    this.clusterCreateTime,
    this.enabledCloudwatchLogsExports,
    this.deletionProtection,
  });
  static DBCluster fromJson(Map<String, dynamic> json) => DBCluster();
}

class DBClusterMember {
  /// Specifies the instance identifier for this member of the DB cluster.
  final String dbInstanceIdentifier;

  /// A value that is `true` if the cluster member is the primary instance for
  /// the DB cluster and `false` otherwise.
  final bool isClusterWriter;

  /// Specifies the status of the DB cluster parameter group for this member of
  /// the DB cluster.
  final String dbClusterParameterGroupStatus;

  /// A value that specifies the order in which an Amazon DocumentDB replica is
  /// promoted to the primary instance after a failure of the existing primary
  /// instance.
  final int promotionTier;

  DBClusterMember({
    this.dbInstanceIdentifier,
    this.isClusterWriter,
    this.dbClusterParameterGroupStatus,
    this.promotionTier,
  });
  static DBClusterMember fromJson(Map<String, dynamic> json) =>
      DBClusterMember();
}

class DBClusterMessage {
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords`.
  final String marker;

  /// A list of DB clusters.
  final List<DBCluster> dbClusters;

  DBClusterMessage({
    this.marker,
    this.dbClusters,
  });
  static DBClusterMessage fromJson(Map<String, dynamic> json) =>
      DBClusterMessage();
}

class DBClusterParameterGroup {
  /// Provides the name of the DB cluster parameter group.
  final String dbClusterParameterGroupName;

  /// Provides the name of the DB parameter group family that this DB cluster
  /// parameter group is compatible with.
  final String dbParameterGroupFamily;

  /// Provides the customer-specified description for this DB cluster parameter
  /// group.
  final String description;

  /// The Amazon Resource Name (ARN) for the DB cluster parameter group.
  final String dbClusterParameterGroupArn;

  DBClusterParameterGroup({
    this.dbClusterParameterGroupName,
    this.dbParameterGroupFamily,
    this.description,
    this.dbClusterParameterGroupArn,
  });
  static DBClusterParameterGroup fromJson(Map<String, dynamic> json) =>
      DBClusterParameterGroup();
}

class DBClusterParameterGroupDetails {
  /// Provides a list of parameters for the DB cluster parameter group.
  final List<Parameter> parameters;

  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords`.
  final String marker;

  DBClusterParameterGroupDetails({
    this.parameters,
    this.marker,
  });
  static DBClusterParameterGroupDetails fromJson(Map<String, dynamic> json) =>
      DBClusterParameterGroupDetails();
}

class DBClusterParameterGroupNameMessage {
  /// The name of a DB cluster parameter group.
  ///
  /// Constraints:
  ///
  /// *   Must be from 1 to 255 letters or numbers.
  ///
  /// *   The first character must be a letter.
  ///
  /// *   Cannot end with a hyphen or contain two consecutive hyphens.
  ///
  ///
  ///
  ///
  /// This value is stored as a lowercase string.
  final String dbClusterParameterGroupName;

  DBClusterParameterGroupNameMessage({
    this.dbClusterParameterGroupName,
  });
  static DBClusterParameterGroupNameMessage fromJson(
          Map<String, dynamic> json) =>
      DBClusterParameterGroupNameMessage();
}

class DBClusterParameterGroupsMessage {
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords`.
  final String marker;

  /// A list of DB cluster parameter groups.
  final List<DBClusterParameterGroup> dbClusterParameterGroups;

  DBClusterParameterGroupsMessage({
    this.marker,
    this.dbClusterParameterGroups,
  });
  static DBClusterParameterGroupsMessage fromJson(Map<String, dynamic> json) =>
      DBClusterParameterGroupsMessage();
}

class DBClusterRole {
  /// The Amazon Resource Name (ARN) of the IAM role that is associated with the
  /// DB cluster.
  final String roleArn;

  /// Describes the state of association between the IAM role and the DB
  /// cluster. The `Status` property returns one of the following values:
  ///
  /// *    `ACTIVE` \- The IAM role ARN is associated with the DB cluster and
  /// can be used to access other AWS services on your behalf.
  ///
  /// *    `PENDING` \- The IAM role ARN is being associated with the DB
  /// cluster.
  ///
  /// *    `INVALID` \- The IAM role ARN is associated with the DB cluster, but
  /// the DB cluster cannot assume the IAM role to access other AWS services on
  /// your behalf.
  final String status;

  DBClusterRole({
    this.roleArn,
    this.status,
  });
  static DBClusterRole fromJson(Map<String, dynamic> json) => DBClusterRole();
}

class DBClusterSnapshot {
  /// Provides the list of Amazon EC2 Availability Zones that instances in the
  /// DB cluster snapshot can be restored in.
  final List<String> availabilityZones;

  /// Specifies the identifier for the DB cluster snapshot.
  final String dbClusterSnapshotIdentifier;

  /// Specifies the DB cluster identifier of the DB cluster that this DB cluster
  /// snapshot was created from.
  final String dbClusterIdentifier;

  /// Provides the time when the snapshot was taken, in UTC.
  final DateTime snapshotCreateTime;

  /// Specifies the name of the database engine.
  final String engine;

  /// Specifies the status of this DB cluster snapshot.
  final String status;

  /// Specifies the port that the DB cluster was listening on at the time of the
  /// snapshot.
  final int port;

  /// Provides the virtual private cloud (VPC) ID that is associated with the DB
  /// cluster snapshot.
  final String vpcId;

  /// Specifies the time when the DB cluster was created, in Universal
  /// Coordinated Time (UTC).
  final DateTime clusterCreateTime;

  /// Provides the master user name for the DB cluster snapshot.
  final String masterUsername;

  /// Provides the version of the database engine for this DB cluster snapshot.
  final String engineVersion;

  /// Provides the type of the DB cluster snapshot.
  final String snapshotType;

  /// Specifies the percentage of the estimated data that has been transferred.
  final int percentProgress;

  /// Specifies whether the DB cluster snapshot is encrypted.
  final bool storageEncrypted;

  /// If `StorageEncrypted` is `true`, the AWS KMS key identifier for the
  /// encrypted DB cluster snapshot.
  final String kmsKeyId;

  /// The Amazon Resource Name (ARN) for the DB cluster snapshot.
  final String dbClusterSnapshotArn;

  /// If the DB cluster snapshot was copied from a source DB cluster snapshot,
  /// the ARN for the source DB cluster snapshot; otherwise, a null value.
  final String sourceDBClusterSnapshotArn;

  DBClusterSnapshot({
    this.availabilityZones,
    this.dbClusterSnapshotIdentifier,
    this.dbClusterIdentifier,
    this.snapshotCreateTime,
    this.engine,
    this.status,
    this.port,
    this.vpcId,
    this.clusterCreateTime,
    this.masterUsername,
    this.engineVersion,
    this.snapshotType,
    this.percentProgress,
    this.storageEncrypted,
    this.kmsKeyId,
    this.dbClusterSnapshotArn,
    this.sourceDBClusterSnapshotArn,
  });
  static DBClusterSnapshot fromJson(Map<String, dynamic> json) =>
      DBClusterSnapshot();
}

class DBClusterSnapshotAttribute {
  /// The name of the manual DB cluster snapshot attribute.
  ///
  /// The attribute named `restore` refers to the list of AWS accounts that have
  /// permission to copy or restore the manual DB cluster snapshot.
  final String attributeName;

  /// The values for the manual DB cluster snapshot attribute.
  ///
  /// If the `AttributeName` field is set to `restore`, then this element
  /// returns a list of IDs of the AWS accounts that are authorized to copy or
  /// restore the manual DB cluster snapshot. If a value of `all` is in the
  /// list, then the manual DB cluster snapshot is public and available for any
  /// AWS account to copy or restore.
  final List<String> attributeValues;

  DBClusterSnapshotAttribute({
    this.attributeName,
    this.attributeValues,
  });
  static DBClusterSnapshotAttribute fromJson(Map<String, dynamic> json) =>
      DBClusterSnapshotAttribute();
}

class DBClusterSnapshotAttributesResult {
  /// The identifier of the DB cluster snapshot that the attributes apply to.
  final String dbClusterSnapshotIdentifier;

  /// The list of attributes and values for the DB cluster snapshot.
  final List<DBClusterSnapshotAttribute> dbClusterSnapshotAttributes;

  DBClusterSnapshotAttributesResult({
    this.dbClusterSnapshotIdentifier,
    this.dbClusterSnapshotAttributes,
  });
  static DBClusterSnapshotAttributesResult fromJson(
          Map<String, dynamic> json) =>
      DBClusterSnapshotAttributesResult();
}

class DBClusterSnapshotMessage {
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords`.
  final String marker;

  /// Provides a list of DB cluster snapshots.
  final List<DBClusterSnapshot> dbClusterSnapshots;

  DBClusterSnapshotMessage({
    this.marker,
    this.dbClusterSnapshots,
  });
  static DBClusterSnapshotMessage fromJson(Map<String, dynamic> json) =>
      DBClusterSnapshotMessage();
}

class DBEngineVersion {
  /// The name of the database engine.
  final String engine;

  /// The version number of the database engine.
  final String engineVersion;

  /// The name of the DB parameter group family for the database engine.
  final String dbParameterGroupFamily;

  /// The description of the database engine.
  final String dbEngineDescription;

  /// The description of the database engine version.
  final String dbEngineVersionDescription;

  /// A list of engine versions that this database engine version can be
  /// upgraded to.
  final List<UpgradeTarget> validUpgradeTarget;

  /// The types of logs that the database engine has available for export to
  /// Amazon CloudWatch Logs.
  final List<String> exportableLogTypes;

  /// A value that indicates whether the engine version supports exporting the
  /// log types specified by `ExportableLogTypes` to CloudWatch Logs.
  final bool supportsLogExportsToCloudwatchLogs;

  DBEngineVersion({
    this.engine,
    this.engineVersion,
    this.dbParameterGroupFamily,
    this.dbEngineDescription,
    this.dbEngineVersionDescription,
    this.validUpgradeTarget,
    this.exportableLogTypes,
    this.supportsLogExportsToCloudwatchLogs,
  });
  static DBEngineVersion fromJson(Map<String, dynamic> json) =>
      DBEngineVersion();
}

class DBEngineVersionMessage {
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords`.
  final String marker;

  /// Detailed information about one or more DB engine versions.
  final List<DBEngineVersion> dbEngineVersions;

  DBEngineVersionMessage({
    this.marker,
    this.dbEngineVersions,
  });
  static DBEngineVersionMessage fromJson(Map<String, dynamic> json) =>
      DBEngineVersionMessage();
}

class DBInstance {
  /// Contains a user-provided database identifier. This identifier is the
  /// unique key that identifies a DB instance.
  final String dbInstanceIdentifier;

  /// Contains the name of the compute and memory capacity class of the DB
  /// instance.
  final String dbInstanceClass;

  /// Provides the name of the database engine to be used for this DB instance.
  final String engine;

  /// Specifies the current state of this database.
  final String dbInstanceStatus;

  /// Specifies the connection endpoint.
  final Endpoint endpoint;

  /// Provides the date and time that the DB instance was created.
  final DateTime instanceCreateTime;

  ///  Specifies the daily time range during which automated backups are created
  /// if automated backups are enabled, as determined by the
  /// `BackupRetentionPeriod`.
  final String preferredBackupWindow;

  /// Specifies the number of days for which automatic DB snapshots are
  /// retained.
  final int backupRetentionPeriod;

  /// Provides a list of VPC security group elements that the DB instance
  /// belongs to.
  final List<VpcSecurityGroupMembership> vpcSecurityGroups;

  /// Specifies the name of the Availability Zone that the DB instance is
  /// located in.
  final String availabilityZone;

  /// Specifies information on the subnet group that is associated with the DB
  /// instance, including the name, description, and subnets in the subnet
  /// group.
  final DBSubnetGroup dbSubnetGroup;

  /// Specifies the weekly time range during which system maintenance can occur,
  /// in Universal Coordinated Time (UTC).
  final String preferredMaintenanceWindow;

  /// Specifies that changes to the DB instance are pending. This element is
  /// included only when changes are pending. Specific changes are identified by
  /// subelements.
  final PendingModifiedValues pendingModifiedValues;

  /// Specifies the latest time to which a database can be restored with
  /// point-in-time restore.
  final DateTime latestRestorableTime;

  /// Indicates the database engine version.
  final String engineVersion;

  /// Indicates that minor version patches are applied automatically.
  final bool autoMinorVersionUpgrade;

  /// Specifies the availability options for the DB instance. A value of `true`
  /// specifies an internet-facing instance with a publicly resolvable DNS name,
  /// which resolves to a public IP address. A value of `false` specifies an
  /// internal instance with a DNS name that resolves to a private IP address.
  final bool publiclyAccessible;

  /// The status of a read replica. If the instance is not a read replica, this
  /// is blank.
  final List<DBInstanceStatusInfo> statusInfos;

  /// Contains the name of the DB cluster that the DB instance is a member of if
  /// the DB instance is a member of a DB cluster.
  final String dbClusterIdentifier;

  /// Specifies whether the DB instance is encrypted.
  final bool storageEncrypted;

  ///  If `StorageEncrypted` is `true`, the AWS KMS key identifier for the
  /// encrypted DB instance.
  final String kmsKeyId;

  /// The AWS Region-unique, immutable identifier for the DB instance. This
  /// identifier is found in AWS CloudTrail log entries whenever the AWS KMS key
  /// for the DB instance is accessed.
  final String dbiResourceId;

  /// A value that specifies the order in which an Amazon DocumentDB replica is
  /// promoted to the primary instance after a failure of the existing primary
  /// instance.
  final int promotionTier;

  /// The Amazon Resource Name (ARN) for the DB instance.
  final String dbInstanceArn;

  /// A list of log types that this DB instance is configured to export to
  /// Amazon CloudWatch Logs.
  final List<String> enabledCloudwatchLogsExports;

  DBInstance({
    this.dbInstanceIdentifier,
    this.dbInstanceClass,
    this.engine,
    this.dbInstanceStatus,
    this.endpoint,
    this.instanceCreateTime,
    this.preferredBackupWindow,
    this.backupRetentionPeriod,
    this.vpcSecurityGroups,
    this.availabilityZone,
    this.dbSubnetGroup,
    this.preferredMaintenanceWindow,
    this.pendingModifiedValues,
    this.latestRestorableTime,
    this.engineVersion,
    this.autoMinorVersionUpgrade,
    this.publiclyAccessible,
    this.statusInfos,
    this.dbClusterIdentifier,
    this.storageEncrypted,
    this.kmsKeyId,
    this.dbiResourceId,
    this.promotionTier,
    this.dbInstanceArn,
    this.enabledCloudwatchLogsExports,
  });
  static DBInstance fromJson(Map<String, dynamic> json) => DBInstance();
}

class DBInstanceMessage {
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords`.
  final String marker;

  /// Detailed information about one or more DB instances.
  final List<DBInstance> dbInstances;

  DBInstanceMessage({
    this.marker,
    this.dbInstances,
  });
  static DBInstanceMessage fromJson(Map<String, dynamic> json) =>
      DBInstanceMessage();
}

class DBInstanceStatusInfo {
  /// This value is currently "`read replication`."
  final String statusType;

  /// A Boolean value that is `true` if the instance is operating normally, or
  /// `false` if the instance is in an error state.
  final bool normal;

  /// Status of the DB instance. For a `StatusType` of read replica, the values
  /// can be `replicating`, error, `stopped`, or `terminated`.
  final String status;

  /// Details of the error if there is an error for the instance. If the
  /// instance is not in an error state, this value is blank.
  final String message;

  DBInstanceStatusInfo({
    this.statusType,
    this.normal,
    this.status,
    this.message,
  });
  static DBInstanceStatusInfo fromJson(Map<String, dynamic> json) =>
      DBInstanceStatusInfo();
}

class DBSubnetGroup {
  /// The name of the DB subnet group.
  final String dbSubnetGroupName;

  /// Provides the description of the DB subnet group.
  final String dbSubnetGroupDescription;

  /// Provides the virtual private cloud (VPC) ID of the DB subnet group.
  final String vpcId;

  /// Provides the status of the DB subnet group.
  final String subnetGroupStatus;

  /// Detailed information about one or more subnets within a DB subnet group.
  final List<Subnet> subnets;

  /// The Amazon Resource Identifier (ARN) for the DB subnet group.
  final String dbSubnetGroupArn;

  DBSubnetGroup({
    this.dbSubnetGroupName,
    this.dbSubnetGroupDescription,
    this.vpcId,
    this.subnetGroupStatus,
    this.subnets,
    this.dbSubnetGroupArn,
  });
  static DBSubnetGroup fromJson(Map<String, dynamic> json) => DBSubnetGroup();
}

class DBSubnetGroupMessage {
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords`.
  final String marker;

  /// Detailed information about one or more DB subnet groups.
  final List<DBSubnetGroup> dbSubnetGroups;

  DBSubnetGroupMessage({
    this.marker,
    this.dbSubnetGroups,
  });
  static DBSubnetGroupMessage fromJson(Map<String, dynamic> json) =>
      DBSubnetGroupMessage();
}

class DeleteDBClusterResult {
  final DBCluster dbCluster;

  DeleteDBClusterResult({
    this.dbCluster,
  });
  static DeleteDBClusterResult fromJson(Map<String, dynamic> json) =>
      DeleteDBClusterResult();
}

class DeleteDBClusterSnapshotResult {
  final DBClusterSnapshot dbClusterSnapshot;

  DeleteDBClusterSnapshotResult({
    this.dbClusterSnapshot,
  });
  static DeleteDBClusterSnapshotResult fromJson(Map<String, dynamic> json) =>
      DeleteDBClusterSnapshotResult();
}

class DeleteDBInstanceResult {
  final DBInstance dbInstance;

  DeleteDBInstanceResult({
    this.dbInstance,
  });
  static DeleteDBInstanceResult fromJson(Map<String, dynamic> json) =>
      DeleteDBInstanceResult();
}

class DescribeDBClusterSnapshotAttributesResult {
  final DBClusterSnapshotAttributesResult dbClusterSnapshotAttributesResult;

  DescribeDBClusterSnapshotAttributesResult({
    this.dbClusterSnapshotAttributesResult,
  });
  static DescribeDBClusterSnapshotAttributesResult fromJson(
          Map<String, dynamic> json) =>
      DescribeDBClusterSnapshotAttributesResult();
}

class DescribeEngineDefaultClusterParametersResult {
  final EngineDefaults engineDefaults;

  DescribeEngineDefaultClusterParametersResult({
    this.engineDefaults,
  });
  static DescribeEngineDefaultClusterParametersResult fromJson(
          Map<String, dynamic> json) =>
      DescribeEngineDefaultClusterParametersResult();
}

class Endpoint {
  /// Specifies the DNS address of the DB instance.
  final String address;

  /// Specifies the port that the database engine is listening on.
  final int port;

  /// Specifies the ID that Amazon Route 53 assigns when you create a hosted
  /// zone.
  final String hostedZoneId;

  Endpoint({
    this.address,
    this.port,
    this.hostedZoneId,
  });
  static Endpoint fromJson(Map<String, dynamic> json) => Endpoint();
}

class EngineDefaults {
  /// The name of the DB cluster parameter group family to return the engine
  /// parameter information for.
  final String dbParameterGroupFamily;

  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords`.
  final String marker;

  /// The parameters of a particular DB cluster parameter group family.
  final List<Parameter> parameters;

  EngineDefaults({
    this.dbParameterGroupFamily,
    this.marker,
    this.parameters,
  });
  static EngineDefaults fromJson(Map<String, dynamic> json) => EngineDefaults();
}

class Event {
  /// Provides the identifier for the source of the event.
  final String sourceIdentifier;

  /// Specifies the source type for this event.
  final String sourceType;

  /// Provides the text of this event.
  final String message;

  /// Specifies the category for the event.
  final List<String> eventCategories;

  /// Specifies the date and time of the event.
  final DateTime date;

  /// The Amazon Resource Name (ARN) for the event.
  final String sourceArn;

  Event({
    this.sourceIdentifier,
    this.sourceType,
    this.message,
    this.eventCategories,
    this.date,
    this.sourceArn,
  });
  static Event fromJson(Map<String, dynamic> json) => Event();
}

class EventCategoriesMap {
  /// The source type that the returned categories belong to.
  final String sourceType;

  /// The event categories for the specified source type.
  final List<String> eventCategories;

  EventCategoriesMap({
    this.sourceType,
    this.eventCategories,
  });
  static EventCategoriesMap fromJson(Map<String, dynamic> json) =>
      EventCategoriesMap();
}

class EventCategoriesMessage {
  /// A list of event category maps.
  final List<EventCategoriesMap> eventCategoriesMapList;

  EventCategoriesMessage({
    this.eventCategoriesMapList,
  });
  static EventCategoriesMessage fromJson(Map<String, dynamic> json) =>
      EventCategoriesMessage();
}

class EventsMessage {
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords`.
  final String marker;

  /// Detailed information about one or more events.
  final List<Event> events;

  EventsMessage({
    this.marker,
    this.events,
  });
  static EventsMessage fromJson(Map<String, dynamic> json) => EventsMessage();
}

class FailoverDBClusterResult {
  final DBCluster dbCluster;

  FailoverDBClusterResult({
    this.dbCluster,
  });
  static FailoverDBClusterResult fromJson(Map<String, dynamic> json) =>
      FailoverDBClusterResult();
}

class Filter {
  /// The name of the filter. Filter names are case sensitive.
  final String name;

  /// One or more filter values. Filter values are case sensitive.
  final List<String> values;

  Filter({
    @required this.name,
    @required this.values,
  });
}

class ModifyDBClusterResult {
  final DBCluster dbCluster;

  ModifyDBClusterResult({
    this.dbCluster,
  });
  static ModifyDBClusterResult fromJson(Map<String, dynamic> json) =>
      ModifyDBClusterResult();
}

class ModifyDBClusterSnapshotAttributeResult {
  final DBClusterSnapshotAttributesResult dbClusterSnapshotAttributesResult;

  ModifyDBClusterSnapshotAttributeResult({
    this.dbClusterSnapshotAttributesResult,
  });
  static ModifyDBClusterSnapshotAttributeResult fromJson(
          Map<String, dynamic> json) =>
      ModifyDBClusterSnapshotAttributeResult();
}

class ModifyDBInstanceResult {
  final DBInstance dbInstance;

  ModifyDBInstanceResult({
    this.dbInstance,
  });
  static ModifyDBInstanceResult fromJson(Map<String, dynamic> json) =>
      ModifyDBInstanceResult();
}

class ModifyDBSubnetGroupResult {
  final DBSubnetGroup dbSubnetGroup;

  ModifyDBSubnetGroupResult({
    this.dbSubnetGroup,
  });
  static ModifyDBSubnetGroupResult fromJson(Map<String, dynamic> json) =>
      ModifyDBSubnetGroupResult();
}

class OrderableDBInstanceOption {
  /// The engine type of a DB instance.
  final String engine;

  /// The engine version of a DB instance.
  final String engineVersion;

  /// The DB instance class for a DB instance.
  final String dbInstanceClass;

  /// The license model for a DB instance.
  final String licenseModel;

  /// A list of Availability Zones for a DB instance.
  final List<AvailabilityZone> availabilityZones;

  /// Indicates whether a DB instance is in a virtual private cloud (VPC).
  final bool vpc;

  OrderableDBInstanceOption({
    this.engine,
    this.engineVersion,
    this.dbInstanceClass,
    this.licenseModel,
    this.availabilityZones,
    this.vpc,
  });
  static OrderableDBInstanceOption fromJson(Map<String, dynamic> json) =>
      OrderableDBInstanceOption();
}

class OrderableDBInstanceOptionsMessage {
  /// The options that are available for a particular orderable DB instance.
  final List<OrderableDBInstanceOption> orderableDBInstanceOptions;

  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords`.
  final String marker;

  OrderableDBInstanceOptionsMessage({
    this.orderableDBInstanceOptions,
    this.marker,
  });
  static OrderableDBInstanceOptionsMessage fromJson(
          Map<String, dynamic> json) =>
      OrderableDBInstanceOptionsMessage();
}

class Parameter {
  /// Specifies the name of the parameter.
  final String parameterName;

  /// Specifies the value of the parameter.
  final String parameterValue;

  /// Provides a description of the parameter.
  final String description;

  /// Indicates the source of the parameter value.
  final String source;

  /// Specifies the engine-specific parameters type.
  final String applyType;

  /// Specifies the valid data type for the parameter.
  final String dataType;

  /// Specifies the valid range of values for the parameter.
  final String allowedValues;

  ///  Indicates whether (`true`) or not (`false`) the parameter can be
  /// modified. Some parameters have security or operational implications that
  /// prevent them from being changed.
  final bool isModifiable;

  /// The earliest engine version to which the parameter can apply.
  final String minimumEngineVersion;

  /// Indicates when to apply parameter updates.
  final String applyMethod;

  Parameter({
    this.parameterName,
    this.parameterValue,
    this.description,
    this.source,
    this.applyType,
    this.dataType,
    this.allowedValues,
    this.isModifiable,
    this.minimumEngineVersion,
    this.applyMethod,
  });
  static Parameter fromJson(Map<String, dynamic> json) => Parameter();
}

class PendingCloudwatchLogsExports {
  /// Log types that are in the process of being deactivated. After they are
  /// deactivated, these log types aren't exported to CloudWatch Logs.
  final List<String> logTypesToEnable;

  /// Log types that are in the process of being enabled. After they are
  /// enabled, these log types are exported to Amazon CloudWatch Logs.
  final List<String> logTypesToDisable;

  PendingCloudwatchLogsExports({
    this.logTypesToEnable,
    this.logTypesToDisable,
  });
  static PendingCloudwatchLogsExports fromJson(Map<String, dynamic> json) =>
      PendingCloudwatchLogsExports();
}

class PendingMaintenanceAction {
  /// The type of pending maintenance action that is available for the resource.
  final String action;

  /// The date of the maintenance window when the action is applied. The
  /// maintenance action is applied to the resource during its first maintenance
  /// window after this date. If this date is specified, any `next-maintenance`
  /// opt-in requests are ignored.
  final DateTime autoAppliedAfterDate;

  /// The date when the maintenance action is automatically applied. The
  /// maintenance action is applied to the resource on this date regardless of
  /// the maintenance window for the resource. If this date is specified, any
  /// `immediate` opt-in requests are ignored.
  final DateTime forcedApplyDate;

  /// Indicates the type of opt-in request that has been received for the
  /// resource.
  final String optInStatus;

  /// The effective date when the pending maintenance action is applied to the
  /// resource.
  final DateTime currentApplyDate;

  /// A description providing more detail about the maintenance action.
  final String description;

  PendingMaintenanceAction({
    this.action,
    this.autoAppliedAfterDate,
    this.forcedApplyDate,
    this.optInStatus,
    this.currentApplyDate,
    this.description,
  });
  static PendingMaintenanceAction fromJson(Map<String, dynamic> json) =>
      PendingMaintenanceAction();
}

class PendingMaintenanceActionsMessage {
  /// The maintenance actions to be applied.
  final List<ResourcePendingMaintenanceActions> pendingMaintenanceActions;

  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords`.
  final String marker;

  PendingMaintenanceActionsMessage({
    this.pendingMaintenanceActions,
    this.marker,
  });
  static PendingMaintenanceActionsMessage fromJson(Map<String, dynamic> json) =>
      PendingMaintenanceActionsMessage();
}

class PendingModifiedValues {
  ///  Contains the new `DBInstanceClass` for the DB instance that will be
  /// applied or is currently being applied.
  final String dbInstanceClass;

  ///  Contains the new `AllocatedStorage` size for the DB instance that will be
  /// applied or is currently being applied.
  final int allocatedStorage;

  /// Contains the pending or currently in-progress change of the master
  /// credentials for the DB instance.
  final String masterUserPassword;

  /// Specifies the pending port for the DB instance.
  final int port;

  /// Specifies the pending number of days for which automated backups are
  /// retained.
  final int backupRetentionPeriod;

  /// Indicates that the Single-AZ DB instance is to change to a Multi-AZ
  /// deployment.
  final bool multiAZ;

  /// Indicates the database engine version.
  final String engineVersion;

  /// The license model for the DB instance.
  ///
  /// Valid values: `license-included`, `bring-your-own-license`,
  /// `general-public-license`
  final String licenseModel;

  /// Specifies the new Provisioned IOPS value for the DB instance that will be
  /// applied or is currently being applied.
  final int iops;

  ///  Contains the new `DBInstanceIdentifier` for the DB instance that will be
  /// applied or is currently being applied.
  final String dbInstanceIdentifier;

  /// Specifies the storage type to be associated with the DB instance.
  final String storageType;

  /// Specifies the identifier of the certificate authority (CA) certificate for
  /// the DB instance.
  final String caCertificateIdentifier;

  /// The new DB subnet group for the DB instance.
  final String dbSubnetGroupName;

  /// A list of the log types whose configuration is still pending. These log
  /// types are in the process of being activated or deactivated.
  final PendingCloudwatchLogsExports pendingCloudwatchLogsExports;

  PendingModifiedValues({
    this.dbInstanceClass,
    this.allocatedStorage,
    this.masterUserPassword,
    this.port,
    this.backupRetentionPeriod,
    this.multiAZ,
    this.engineVersion,
    this.licenseModel,
    this.iops,
    this.dbInstanceIdentifier,
    this.storageType,
    this.caCertificateIdentifier,
    this.dbSubnetGroupName,
    this.pendingCloudwatchLogsExports,
  });
  static PendingModifiedValues fromJson(Map<String, dynamic> json) =>
      PendingModifiedValues();
}

class RebootDBInstanceResult {
  final DBInstance dbInstance;

  RebootDBInstanceResult({
    this.dbInstance,
  });
  static RebootDBInstanceResult fromJson(Map<String, dynamic> json) =>
      RebootDBInstanceResult();
}

class ResourcePendingMaintenanceActions {
  /// The Amazon Resource Name (ARN) of the resource that has pending
  /// maintenance actions.
  final String resourceIdentifier;

  /// A list that provides details about the pending maintenance actions for the
  /// resource.
  final List<PendingMaintenanceAction> pendingMaintenanceActionDetails;

  ResourcePendingMaintenanceActions({
    this.resourceIdentifier,
    this.pendingMaintenanceActionDetails,
  });
  static ResourcePendingMaintenanceActions fromJson(
          Map<String, dynamic> json) =>
      ResourcePendingMaintenanceActions();
}

class RestoreDBClusterFromSnapshotResult {
  final DBCluster dbCluster;

  RestoreDBClusterFromSnapshotResult({
    this.dbCluster,
  });
  static RestoreDBClusterFromSnapshotResult fromJson(
          Map<String, dynamic> json) =>
      RestoreDBClusterFromSnapshotResult();
}

class RestoreDBClusterToPointInTimeResult {
  final DBCluster dbCluster;

  RestoreDBClusterToPointInTimeResult({
    this.dbCluster,
  });
  static RestoreDBClusterToPointInTimeResult fromJson(
          Map<String, dynamic> json) =>
      RestoreDBClusterToPointInTimeResult();
}

class StartDBClusterResult {
  final DBCluster dbCluster;

  StartDBClusterResult({
    this.dbCluster,
  });
  static StartDBClusterResult fromJson(Map<String, dynamic> json) =>
      StartDBClusterResult();
}

class StopDBClusterResult {
  final DBCluster dbCluster;

  StopDBClusterResult({
    this.dbCluster,
  });
  static StopDBClusterResult fromJson(Map<String, dynamic> json) =>
      StopDBClusterResult();
}

class Subnet {
  /// Specifies the identifier of the subnet.
  final String subnetIdentifier;

  /// Specifies the Availability Zone for the subnet.
  final AvailabilityZone subnetAvailabilityZone;

  /// Specifies the status of the subnet.
  final String subnetStatus;

  Subnet({
    this.subnetIdentifier,
    this.subnetAvailabilityZone,
    this.subnetStatus,
  });
  static Subnet fromJson(Map<String, dynamic> json) => Subnet();
}

class Tag {
  /// The required name of the tag. The string value can be from 1 to 128
  /// Unicode characters in length and can't be prefixed with "aws:" or "rds:".
  /// The string can contain only the set of Unicode letters, digits, white
  /// space, '_', '.', '/', '=', '+', '-' (Java regex:
  /// "^(\[\\\p{L}\\\p{Z}\\\p{N}_.:/=+\\\-\]*)$").
  final String key;

  /// The optional value of the tag. The string value can be from 1 to 256
  /// Unicode characters in length and can't be prefixed with "aws:" or "rds:".
  /// The string can contain only the set of Unicode letters, digits, white
  /// space, '_', '.', '/', '=', '+', '-' (Java regex:
  /// "^(\[\\\p{L}\\\p{Z}\\\p{N}_.:/=+\\\-\]*)$").
  final String value;

  Tag({
    this.key,
    this.value,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag();
}

class TagListMessage {
  /// A list of one or more tags.
  final List<Tag> tagList;

  TagListMessage({
    this.tagList,
  });
  static TagListMessage fromJson(Map<String, dynamic> json) => TagListMessage();
}

class UpgradeTarget {
  /// The name of the upgrade target database engine.
  final String engine;

  /// The version number of the upgrade target database engine.
  final String engineVersion;

  /// The version of the database engine that a DB instance can be upgraded to.
  final String description;

  /// A value that indicates whether the target version is applied to any source
  /// DB instances that have `AutoMinorVersionUpgrade` set to `true`.
  final bool autoUpgrade;

  /// A value that indicates whether a database engine is upgraded to a major
  /// version.
  final bool isMajorVersionUpgrade;

  UpgradeTarget({
    this.engine,
    this.engineVersion,
    this.description,
    this.autoUpgrade,
    this.isMajorVersionUpgrade,
  });
  static UpgradeTarget fromJson(Map<String, dynamic> json) => UpgradeTarget();
}

class VpcSecurityGroupMembership {
  /// The name of the VPC security group.
  final String vpcSecurityGroupId;

  /// The status of the VPC security group.
  final String status;

  VpcSecurityGroupMembership({
    this.vpcSecurityGroupId,
    this.status,
  });
  static VpcSecurityGroupMembership fromJson(Map<String, dynamic> json) =>
      VpcSecurityGroupMembership();
}
