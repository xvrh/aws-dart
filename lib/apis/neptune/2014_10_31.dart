import 'package:meta/meta.dart';

/// Amazon Neptune
///
/// Amazon Neptune is a fast, reliable, fully-managed graph database service
/// that makes it easy to build and run applications that work with highly
/// connected datasets. The core of Amazon Neptune is a purpose-built,
/// high-performance graph database engine optimized for storing billions of
/// relationships and querying the graph with milliseconds latency. Amazon
/// Neptune supports popular graph models Property Graph and W3C's RDF, and
/// their respective query languages Apache TinkerPop Gremlin and SPARQL,
/// allowing you to easily build queries that efficiently navigate highly
/// connected datasets. Neptune powers graph use cases such as recommendation
/// engines, fraud detection, knowledge graphs, drug discovery, and network
/// security.
///
/// This interface reference for Amazon Neptune contains documentation for a
/// programming or command line interface you can use to manage Amazon Neptune.
/// Note that Amazon Neptune is asynchronous, which means that some interfaces
/// might require techniques such as polling or callback functions to determine
/// when a command has been applied. In this reference, the parameter
/// descriptions indicate whether a command is applied immediately, on the next
/// instance reboot, or during the maintenance window. The reference structure
/// is as follows, and we list following some related topics from the user
/// guide.
class NeptuneApi {
  final _client;
  NeptuneApi(client)
      : _client = client.configured('Neptune', serializer: 'query');

  /// Associates an Identity and Access Management (IAM) role from an Neptune DB
  /// cluster.
  ///
  /// [dbClusterIdentifier]: The name of the DB cluster to associate the IAM
  /// role with.
  ///
  /// [roleArn]: The Amazon Resource Name (ARN) of the IAM role to associate
  /// with the Neptune DB cluster, for example
  /// `arn:aws:iam::123456789012:role/NeptuneAccessRole`.
  Future<void> addRoleToDBCluster(
      {@required String dbClusterIdentifier, @required String roleArn}) async {
    await _client.send('AddRoleToDBCluster', {
      'DBClusterIdentifier': dbClusterIdentifier,
      'RoleArn': roleArn,
    });
  }

  /// Adds a source identifier to an existing event notification subscription.
  ///
  /// [subscriptionName]: The name of the event notification subscription you
  /// want to add a source identifier to.
  ///
  /// [sourceIdentifier]: The identifier of the event source to be added.
  ///
  /// Constraints:
  ///
  /// *   If the source type is a DB instance, then a `DBInstanceIdentifier`
  /// must be supplied.
  ///
  /// *   If the source type is a DB security group, a `DBSecurityGroupName`
  /// must be supplied.
  ///
  /// *   If the source type is a DB parameter group, a `DBParameterGroupName`
  /// must be supplied.
  ///
  /// *   If the source type is a DB snapshot, a `DBSnapshotIdentifier` must be
  /// supplied.
  Future<AddSourceIdentifierToSubscriptionResult>
      addSourceIdentifierToSubscription(
          {@required String subscriptionName,
          @required String sourceIdentifier}) async {
    var response_ = await _client.send('AddSourceIdentifierToSubscription', {
      'SubscriptionName': subscriptionName,
      'SourceIdentifier': sourceIdentifier,
    });
    return AddSourceIdentifierToSubscriptionResult.fromJson(response_);
  }

  /// Adds metadata tags to an Amazon Neptune resource. These tags can also be
  /// used with cost allocation reporting to track cost associated with Amazon
  /// Neptune resources, or used in a Condition statement in an IAM policy for
  /// Amazon Neptune.
  ///
  /// [resourceName]: The Amazon Neptune resource that the tags are added to.
  /// This value is an Amazon Resource Name (ARN). For information about
  /// creating an ARN, see
  /// [Constructing an Amazon Resource Name (ARN)](https://docs.aws.amazon.com/neptune/latest/UserGuide/tagging.ARN.html#tagging.ARN.Constructing).
  ///
  /// [tags]: The tags to be assigned to the Amazon Neptune resource.
  Future<void> addTagsToResource(
      {@required String resourceName, @required List<Tag> tags}) async {
    await _client.send('AddTagsToResource', {
      'ResourceName': resourceName,
      'Tags': tags,
    });
  }

  /// Applies a pending maintenance action to a resource (for example, to a DB
  /// instance).
  ///
  /// [resourceIdentifier]: The Amazon Resource Name (ARN) of the resource that
  /// the pending maintenance action applies to. For information about creating
  /// an ARN, see
  /// [Constructing an Amazon Resource Name (ARN)](https://docs.aws.amazon.com/neptune/latest/UserGuide/tagging.ARN.html#tagging.ARN.Constructing).
  ///
  /// [applyAction]: The pending maintenance action to apply to this resource.
  ///
  /// Valid values: `system-update`, `db-upgrade`
  ///
  /// [optInType]: A value that specifies the type of opt-in request, or undoes
  /// an opt-in request. An opt-in request of type `immediate` can't be undone.
  ///
  /// Valid values:
  ///
  /// *    `immediate` - Apply the maintenance action immediately.
  ///
  /// *    `next-maintenance` - Apply the maintenance action during the next
  /// maintenance window for the resource.
  ///
  /// *    `undo-opt-in` - Cancel any existing `next-maintenance` opt-in
  /// requests.
  Future<ApplyPendingMaintenanceActionResult> applyPendingMaintenanceAction(
      {@required String resourceIdentifier,
      @required String applyAction,
      @required String optInType}) async {
    var response_ = await _client.send('ApplyPendingMaintenanceAction', {
      'ResourceIdentifier': resourceIdentifier,
      'ApplyAction': applyAction,
      'OptInType': optInType,
    });
    return ApplyPendingMaintenanceActionResult.fromJson(response_);
  }

  /// Copies the specified DB cluster parameter group.
  ///
  /// [sourceDBClusterParameterGroupIdentifier]: The identifier or Amazon
  /// Resource Name (ARN) for the source DB cluster parameter group. For
  /// information about creating an ARN, see
  /// [Constructing an Amazon Resource Name (ARN)](https://docs.aws.amazon.com/neptune/latest/UserGuide/tagging.ARN.html#tagging.ARN.Constructing).
  ///
  /// Constraints:
  ///
  /// *   Must specify a valid DB cluster parameter group.
  ///
  /// *   If the source DB cluster parameter group is in the same AWS Region as
  /// the copy, specify a valid DB parameter group identifier, for example
  /// `my-db-cluster-param-group`, or a valid ARN.
  ///
  /// *   If the source DB parameter group is in a different AWS Region than the
  /// copy, specify a valid DB cluster parameter group ARN, for example
  /// `arn:aws:rds:us-east-1:123456789012:cluster-pg:custom-cluster-group1`.
  ///
  /// [targetDBClusterParameterGroupIdentifier]: The identifier for the copied
  /// DB cluster parameter group.
  ///
  /// Constraints:
  ///
  /// *   Cannot be null, empty, or blank
  ///
  /// *   Must contain from 1 to 255 letters, numbers, or hyphens
  ///
  /// *   First character must be a letter
  ///
  /// *   Cannot end with a hyphen or contain two consecutive hyphens
  ///
  ///
  /// Example: `my-cluster-param-group1`
  ///
  /// [targetDBClusterParameterGroupDescription]: A description for the copied
  /// DB cluster parameter group.
  ///
  /// [tags]: The tags to be assigned to the copied DB cluster parameter group.
  Future<CopyDBClusterParameterGroupResult> copyDBClusterParameterGroup(
      {@required String sourceDBClusterParameterGroupIdentifier,
      @required String targetDBClusterParameterGroupIdentifier,
      @required String targetDBClusterParameterGroupDescription,
      List<Tag> tags}) async {
    var response_ = await _client.send('CopyDBClusterParameterGroup', {
      'SourceDBClusterParameterGroupIdentifier':
          sourceDBClusterParameterGroupIdentifier,
      'TargetDBClusterParameterGroupIdentifier':
          targetDBClusterParameterGroupIdentifier,
      'TargetDBClusterParameterGroupDescription':
          targetDBClusterParameterGroupDescription,
      if (tags != null) 'Tags': tags,
    });
    return CopyDBClusterParameterGroupResult.fromJson(response_);
  }

  /// Copies a snapshot of a DB cluster.
  ///
  /// To copy a DB cluster snapshot from a shared manual DB cluster snapshot,
  /// `SourceDBClusterSnapshotIdentifier` must be the Amazon Resource Name (ARN)
  /// of the shared DB cluster snapshot.
  ///
  /// You can't copy from one AWS Region to another.
  ///
  /// [sourceDBClusterSnapshotIdentifier]: The identifier of the DB cluster
  /// snapshot to copy. This parameter is not case-sensitive.
  ///
  /// You can't copy from one AWS Region to another.
  ///
  /// Constraints:
  ///
  /// *   Must specify a valid system snapshot in the "available" state.
  ///
  /// *   Specify a valid DB snapshot identifier.
  ///
  ///
  /// Example: `my-cluster-snapshot1`
  ///
  /// [targetDBClusterSnapshotIdentifier]: The identifier of the new DB cluster
  /// snapshot to create from the source DB cluster snapshot. This parameter is
  /// not case-sensitive.
  ///
  /// Constraints:
  ///
  /// *   Must contain from 1 to 63 letters, numbers, or hyphens.
  ///
  /// *   First character must be a letter.
  ///
  /// *   Cannot end with a hyphen or contain two consecutive hyphens.
  ///
  ///
  /// Example: `my-cluster-snapshot2`
  ///
  /// [kmsKeyId]: The AWS AWS KMS key ID for an encrypted DB cluster snapshot.
  /// The KMS key ID is the Amazon Resource Name (ARN), KMS key identifier, or
  /// the KMS key alias for the KMS encryption key.
  ///
  /// If you copy an unencrypted DB cluster snapshot and specify a value for the
  /// `KmsKeyId` parameter, Amazon Neptune encrypts the target DB cluster
  /// snapshot using the specified KMS encryption key.
  ///
  /// If you copy an encrypted DB cluster snapshot from your AWS account, you
  /// can specify a value for `KmsKeyId` to encrypt the copy with a new KMS
  /// encryption key. If you don't specify a value for `KmsKeyId`, then the copy
  /// of the DB cluster snapshot is encrypted with the same KMS key as the
  /// source DB cluster snapshot.
  ///
  /// If you copy an encrypted DB cluster snapshot that is shared from another
  /// AWS account, then you must specify a value for `KmsKeyId`.
  ///
  ///  KMS encryption keys are specific to the AWS Region that they are created
  /// in, and you can't use encryption keys from one AWS Region in another AWS
  /// Region.
  ///
  /// [preSignedUrl]: Not currently supported.
  ///
  /// [copyTags]: True to copy all tags from the source DB cluster snapshot to
  /// the target DB cluster snapshot, and otherwise false. The default is false.
  ///
  /// [tags]: The tags to assign to the new DB cluster snapshot copy.
  Future<CopyDBClusterSnapshotResult> copyDBClusterSnapshot(
      {@required String sourceDBClusterSnapshotIdentifier,
      @required String targetDBClusterSnapshotIdentifier,
      String kmsKeyId,
      String preSignedUrl,
      bool copyTags,
      List<Tag> tags}) async {
    var response_ = await _client.send('CopyDBClusterSnapshot', {
      'SourceDBClusterSnapshotIdentifier': sourceDBClusterSnapshotIdentifier,
      'TargetDBClusterSnapshotIdentifier': targetDBClusterSnapshotIdentifier,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (preSignedUrl != null) 'PreSignedUrl': preSignedUrl,
      if (copyTags != null) 'CopyTags': copyTags,
      if (tags != null) 'Tags': tags,
    });
    return CopyDBClusterSnapshotResult.fromJson(response_);
  }

  /// Copies the specified DB parameter group.
  ///
  /// [sourceDBParameterGroupIdentifier]: The identifier or ARN for the source
  /// DB parameter group. For information about creating an ARN, see
  /// [Constructing an Amazon Resource Name (ARN)](https://docs.aws.amazon.com/neptune/latest/UserGuide/tagging.ARN.html#tagging.ARN.Constructing).
  ///
  /// Constraints:
  ///
  /// *   Must specify a valid DB parameter group.
  ///
  /// *   Must specify a valid DB parameter group identifier, for example
  /// `my-db-param-group`, or a valid ARN.
  ///
  /// [targetDBParameterGroupIdentifier]: The identifier for the copied DB
  /// parameter group.
  ///
  /// Constraints:
  ///
  /// *   Cannot be null, empty, or blank.
  ///
  /// *   Must contain from 1 to 255 letters, numbers, or hyphens.
  ///
  /// *   First character must be a letter.
  ///
  /// *   Cannot end with a hyphen or contain two consecutive hyphens.
  ///
  ///
  /// Example: `my-db-parameter-group`
  ///
  /// [targetDBParameterGroupDescription]: A description for the copied DB
  /// parameter group.
  ///
  /// [tags]: The tags to be assigned to the copied DB parameter group.
  Future<CopyDBParameterGroupResult> copyDBParameterGroup(
      {@required String sourceDBParameterGroupIdentifier,
      @required String targetDBParameterGroupIdentifier,
      @required String targetDBParameterGroupDescription,
      List<Tag> tags}) async {
    var response_ = await _client.send('CopyDBParameterGroup', {
      'SourceDBParameterGroupIdentifier': sourceDBParameterGroupIdentifier,
      'TargetDBParameterGroupIdentifier': targetDBParameterGroupIdentifier,
      'TargetDBParameterGroupDescription': targetDBParameterGroupDescription,
      if (tags != null) 'Tags': tags,
    });
    return CopyDBParameterGroupResult.fromJson(response_);
  }

  /// Creates a new Amazon Neptune DB cluster.
  ///
  /// You can use the `ReplicationSourceIdentifier` parameter to create the DB
  /// cluster as a Read Replica of another DB cluster or Amazon Neptune DB
  /// instance.
  ///
  /// [availabilityZones]: A list of EC2 Availability Zones that instances in
  /// the DB cluster can be created in.
  ///
  /// [backupRetentionPeriod]: The number of days for which automated backups
  /// are retained. You must specify a minimum value of 1.
  ///
  /// Default: 1
  ///
  /// Constraints:
  ///
  /// *   Must be a value from 1 to 35
  ///
  /// [characterSetName]: A value that indicates that the DB cluster should be
  /// associated with the specified CharacterSet.
  ///
  /// [databaseName]: The name for your database of up to 64 alpha-numeric
  /// characters. If you do not provide a name, Amazon Neptune will not create a
  /// database in the DB cluster you are creating.
  ///
  /// [dbClusterIdentifier]: The DB cluster identifier. This parameter is stored
  /// as a lowercase string.
  ///
  /// Constraints:
  ///
  /// *   Must contain from 1 to 63 letters, numbers, or hyphens.
  ///
  /// *   First character must be a letter.
  ///
  /// *   Cannot end with a hyphen or contain two consecutive hyphens.
  ///
  ///
  /// Example: `my-cluster1`
  ///
  /// [dbClusterParameterGroupName]:  The name of the DB cluster parameter group
  /// to associate with this DB cluster. If this argument is omitted, the
  /// default is used.
  ///
  /// Constraints:
  ///
  /// *   If supplied, must match the name of an existing
  /// DBClusterParameterGroup.
  ///
  /// [vpcSecurityGroupIds]: A list of EC2 VPC security groups to associate with
  /// this DB cluster.
  ///
  /// [dbSubnetGroupName]: A DB subnet group to associate with this DB cluster.
  ///
  /// Constraints: Must match the name of an existing DBSubnetGroup. Must not be
  /// default.
  ///
  /// Example: `mySubnetgroup`
  ///
  /// [engine]: The name of the database engine to be used for this DB cluster.
  ///
  /// Valid Values: `neptune`
  ///
  /// [engineVersion]: The version number of the database engine to use.
  ///
  /// Example: `1.0.1`
  ///
  /// [port]: The port number on which the instances in the DB cluster accept
  /// connections.
  ///
  ///  Default: `8182`
  ///
  /// [masterUsername]: The name of the master user for the DB cluster.
  ///
  /// Constraints:
  ///
  /// *   Must be 1 to 16 letters or numbers.
  ///
  /// *   First character must be a letter.
  ///
  /// *   Cannot be a reserved word for the chosen database engine.
  ///
  /// [masterUserPassword]: The password for the master database user. This
  /// password can contain any printable ASCII character except "/", """, or
  /// "@".
  ///
  /// Constraints: Must contain from 8 to 41 characters.
  ///
  /// [optionGroupName]: A value that indicates that the DB cluster should be
  /// associated with the specified option group.
  ///
  /// Permanent options can't be removed from an option group. The option group
  /// can't be removed from a DB cluster once it is associated with a DB
  /// cluster.
  ///
  /// [preferredBackupWindow]: The daily time range during which automated
  /// backups are created if automated backups are enabled using the
  /// `BackupRetentionPeriod` parameter.
  ///
  /// The default is a 30-minute window selected at random from an 8-hour block
  /// of time for each AWS Region. To see the time blocks available, see
  /// [Adjusting the Preferred Maintenance Window](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/AdjustingTheMaintenanceWindow.html)
  /// in the _Amazon Neptune User Guide._
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
  /// of time for each AWS Region, occurring on a random day of the week. To see
  /// the time blocks available, see
  /// [Adjusting the Preferred Maintenance Window](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/AdjustingTheMaintenanceWindow.html)
  /// in the _Amazon Neptune User Guide._
  ///
  /// Valid Days: Mon, Tue, Wed, Thu, Fri, Sat, Sun.
  ///
  /// Constraints: Minimum 30-minute window.
  ///
  /// [replicationSourceIdentifier]: The Amazon Resource Name (ARN) of the
  /// source DB instance or DB cluster if this DB cluster is created as a Read
  /// Replica.
  ///
  /// [tags]: The tags to assign to the new DB cluster.
  ///
  /// [storageEncrypted]: Specifies whether the DB cluster is encrypted.
  ///
  /// [kmsKeyId]: The AWS KMS key identifier for an encrypted DB cluster.
  ///
  /// The KMS key identifier is the Amazon Resource Name (ARN) for the KMS
  /// encryption key. If you are creating a DB cluster with the same AWS account
  /// that owns the KMS encryption key used to encrypt the new DB cluster, then
  /// you can use the KMS key alias instead of the ARN for the KMS encryption
  /// key.
  ///
  /// If an encryption key is not specified in `KmsKeyId`:
  ///
  /// *   If `ReplicationSourceIdentifier` identifies an encrypted source, then
  /// Amazon Neptune will use the encryption key used to encrypt the source.
  /// Otherwise, Amazon Neptune will use your default encryption key.
  ///
  /// *   If the `StorageEncrypted` parameter is true and
  /// `ReplicationSourceIdentifier` is not specified, then Amazon Neptune will
  /// use your default encryption key.
  ///
  ///
  /// AWS KMS creates the default encryption key for your AWS account. Your AWS
  /// account has a different default encryption key for each AWS Region.
  ///
  /// If you create a Read Replica of an encrypted DB cluster in another AWS
  /// Region, you must set `KmsKeyId` to a KMS key ID that is valid in the
  /// destination AWS Region. This key is used to encrypt the Read Replica in
  /// that AWS Region.
  ///
  /// [preSignedUrl]: This parameter is not currently supported.
  ///
  /// [enableIamDatabaseAuthentication]: True to enable mapping of AWS Identity
  /// and Access Management (IAM) accounts to database accounts, and otherwise
  /// false.
  ///
  /// Default: `false`
  ///
  /// [enableCloudwatchLogsExports]: The list of log types that need to be
  /// enabled for exporting to CloudWatch Logs.
  Future<CreateDBClusterResult> createDBCluster(
      {List<String> availabilityZones,
      int backupRetentionPeriod,
      String characterSetName,
      String databaseName,
      @required String dbClusterIdentifier,
      String dbClusterParameterGroupName,
      List<String> vpcSecurityGroupIds,
      String dbSubnetGroupName,
      @required String engine,
      String engineVersion,
      int port,
      String masterUsername,
      String masterUserPassword,
      String optionGroupName,
      String preferredBackupWindow,
      String preferredMaintenanceWindow,
      String replicationSourceIdentifier,
      List<Tag> tags,
      bool storageEncrypted,
      String kmsKeyId,
      String preSignedUrl,
      bool enableIamDatabaseAuthentication,
      List<String> enableCloudwatchLogsExports}) async {
    var response_ = await _client.send('CreateDBCluster', {
      if (availabilityZones != null) 'AvailabilityZones': availabilityZones,
      if (backupRetentionPeriod != null)
        'BackupRetentionPeriod': backupRetentionPeriod,
      if (characterSetName != null) 'CharacterSetName': characterSetName,
      if (databaseName != null) 'DatabaseName': databaseName,
      'DBClusterIdentifier': dbClusterIdentifier,
      if (dbClusterParameterGroupName != null)
        'DBClusterParameterGroupName': dbClusterParameterGroupName,
      if (vpcSecurityGroupIds != null)
        'VpcSecurityGroupIds': vpcSecurityGroupIds,
      if (dbSubnetGroupName != null) 'DBSubnetGroupName': dbSubnetGroupName,
      'Engine': engine,
      if (engineVersion != null) 'EngineVersion': engineVersion,
      if (port != null) 'Port': port,
      if (masterUsername != null) 'MasterUsername': masterUsername,
      if (masterUserPassword != null) 'MasterUserPassword': masterUserPassword,
      if (optionGroupName != null) 'OptionGroupName': optionGroupName,
      if (preferredBackupWindow != null)
        'PreferredBackupWindow': preferredBackupWindow,
      if (preferredMaintenanceWindow != null)
        'PreferredMaintenanceWindow': preferredMaintenanceWindow,
      if (replicationSourceIdentifier != null)
        'ReplicationSourceIdentifier': replicationSourceIdentifier,
      if (tags != null) 'Tags': tags,
      if (storageEncrypted != null) 'StorageEncrypted': storageEncrypted,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (preSignedUrl != null) 'PreSignedUrl': preSignedUrl,
      if (enableIamDatabaseAuthentication != null)
        'EnableIAMDatabaseAuthentication': enableIamDatabaseAuthentication,
      if (enableCloudwatchLogsExports != null)
        'EnableCloudwatchLogsExports': enableCloudwatchLogsExports,
    });
    return CreateDBClusterResult.fromJson(response_);
  }

  /// Creates a new DB cluster parameter group.
  ///
  /// Parameters in a DB cluster parameter group apply to all of the instances
  /// in a DB cluster.
  ///
  ///  A DB cluster parameter group is initially created with the default
  /// parameters for the database engine used by instances in the DB cluster. To
  /// provide custom values for any of the parameters, you must modify the group
  /// after creating it using ModifyDBClusterParameterGroup. Once you've created
  /// a DB cluster parameter group, you need to associate it with your DB
  /// cluster using ModifyDBCluster. When you associate a new DB cluster
  /// parameter group with a running DB cluster, you need to reboot the DB
  /// instances in the DB cluster without failover for the new DB cluster
  /// parameter group and associated settings to take effect.
  ///
  ///
  ///
  /// After you create a DB cluster parameter group, you should wait at least 5
  /// minutes before creating your first DB cluster that uses that DB cluster
  /// parameter group as the default parameter group. This allows Amazon Neptune
  /// to fully complete the create action before the DB cluster parameter group
  /// is used as the default for a new DB cluster. This is especially important
  /// for parameters that are critical when creating the default database for a
  /// DB cluster, such as the character set for the default database defined by
  /// the `character_set_database` parameter. You can use the _Parameter Groups_
  /// option of the
  /// [Amazon Neptune console](https://console.aws.amazon.com/rds/) or the
  /// DescribeDBClusterParameters command to verify that your DB cluster
  /// parameter group has been created or modified.
  ///
  /// [dbClusterParameterGroupName]: The name of the DB cluster parameter group.
  ///
  /// Constraints:
  ///
  /// *   Must match the name of an existing DBClusterParameterGroup.
  ///
  ///
  ///
  ///
  /// This value is stored as a lowercase string.
  ///
  /// [dbParameterGroupFamily]: The DB cluster parameter group family name. A DB
  /// cluster parameter group can be associated with one and only one DB cluster
  /// parameter group family, and can be applied only to a DB cluster running a
  /// database engine and engine version compatible with that DB cluster
  /// parameter group family.
  ///
  /// [description]: The description for the DB cluster parameter group.
  ///
  /// [tags]: The tags to be assigned to the new DB cluster parameter group.
  Future<CreateDBClusterParameterGroupResult> createDBClusterParameterGroup(
      {@required String dbClusterParameterGroupName,
      @required String dbParameterGroupFamily,
      @required String description,
      List<Tag> tags}) async {
    var response_ = await _client.send('CreateDBClusterParameterGroup', {
      'DBClusterParameterGroupName': dbClusterParameterGroupName,
      'DBParameterGroupFamily': dbParameterGroupFamily,
      'Description': description,
      if (tags != null) 'Tags': tags,
    });
    return CreateDBClusterParameterGroupResult.fromJson(response_);
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
  /// *   First character must be a letter.
  ///
  /// *   Cannot end with a hyphen or contain two consecutive hyphens.
  ///
  ///
  /// Example: `my-cluster1-snapshot1`
  ///
  /// [dbClusterIdentifier]: The identifier of the DB cluster to create a
  /// snapshot for. This parameter is not case-sensitive.
  ///
  /// Constraints:
  ///
  /// *   Must match the identifier of an existing DBCluster.
  ///
  ///
  /// Example: `my-cluster1`
  ///
  /// [tags]: The tags to be assigned to the DB cluster snapshot.
  Future<CreateDBClusterSnapshotResult> createDBClusterSnapshot(
      {@required String dbClusterSnapshotIdentifier,
      @required String dbClusterIdentifier,
      List<Tag> tags}) async {
    var response_ = await _client.send('CreateDBClusterSnapshot', {
      'DBClusterSnapshotIdentifier': dbClusterSnapshotIdentifier,
      'DBClusterIdentifier': dbClusterIdentifier,
      if (tags != null) 'Tags': tags,
    });
    return CreateDBClusterSnapshotResult.fromJson(response_);
  }

  /// Creates a new DB instance.
  ///
  /// [dbName]: Not supported.
  ///
  /// [dbInstanceIdentifier]: The DB instance identifier. This parameter is
  /// stored as a lowercase string.
  ///
  /// Constraints:
  ///
  /// *   Must contain from 1 to 63 letters, numbers, or hyphens.
  ///
  /// *   First character must be a letter.
  ///
  /// *   Cannot end with a hyphen or contain two consecutive hyphens.
  ///
  ///
  /// Example: `mydbinstance`
  ///
  /// [allocatedStorage]: The amount of storage (in gibibytes) to allocate for
  /// the DB instance.
  ///
  /// Type: Integer
  ///
  /// Not applicable. Neptune cluster volumes automatically grow as the amount
  /// of data in your database increases, though you are only charged for the
  /// space that you use in a Neptune cluster volume.
  ///
  /// [dbInstanceClass]: The compute and memory capacity of the DB instance, for
  /// example, `db.m4.large`. Not all DB instance classes are available in all
  /// AWS Regions.
  ///
  /// [engine]: The name of the database engine to be used for this instance.
  ///
  /// Valid Values: `neptune`
  ///
  /// [masterUsername]: The name for the master user. Not used.
  ///
  /// [masterUserPassword]: The password for the master user. The password can
  /// include any printable ASCII character except "/", """, or "@".
  ///
  ///  Not used.
  ///
  /// [dbSecurityGroups]: A list of DB security groups to associate with this DB
  /// instance.
  ///
  /// Default: The default DB security group for the database engine.
  ///
  /// [vpcSecurityGroupIds]: A list of EC2 VPC security groups to associate with
  /// this DB instance.
  ///
  /// Not applicable. The associated list of EC2 VPC security groups is managed
  /// by the DB cluster. For more information, see CreateDBCluster.
  ///
  /// Default: The default EC2 VPC security group for the DB subnet group's VPC.
  ///
  /// [availabilityZone]:  The EC2 Availability Zone that the DB instance is
  /// created in
  ///
  /// Default: A random, system-chosen Availability Zone in the endpoint's AWS
  /// Region.
  ///
  ///  Example: `us-east-1d`
  ///
  ///  Constraint: The AvailabilityZone parameter can't be specified if the
  /// MultiAZ parameter is set to `true`. The specified Availability Zone must
  /// be in the same AWS Region as the current endpoint.
  ///
  /// [dbSubnetGroupName]: A DB subnet group to associate with this DB instance.
  ///
  /// If there is no DB subnet group, then it is a non-VPC DB instance.
  ///
  /// [preferredMaintenanceWindow]: The time range each week during which system
  /// maintenance can occur, in Universal Coordinated Time (UTC).
  ///
  ///  Format: `ddd:hh24:mi-ddd:hh24:mi`
  ///
  /// The default is a 30-minute window selected at random from an 8-hour block
  /// of time for each AWS Region, occurring on a random day of the week.
  ///
  /// Valid Days: Mon, Tue, Wed, Thu, Fri, Sat, Sun.
  ///
  /// Constraints: Minimum 30-minute window.
  ///
  /// [dbParameterGroupName]: The name of the DB parameter group to associate
  /// with this DB instance. If this argument is omitted, the default
  /// DBParameterGroup for the specified engine is used.
  ///
  /// Constraints:
  ///
  /// *   Must be 1 to 255 letters, numbers, or hyphens.
  ///
  /// *   First character must be a letter
  ///
  /// *   Cannot end with a hyphen or contain two consecutive hyphens
  ///
  /// [backupRetentionPeriod]: The number of days for which automated backups
  /// are retained.
  ///
  /// Not applicable. The retention period for automated backups is managed by
  /// the DB cluster. For more information, see CreateDBCluster.
  ///
  /// Default: 1
  ///
  /// Constraints:
  ///
  /// *   Must be a value from 0 to 35
  ///
  /// *   Cannot be set to 0 if the DB instance is a source to Read Replicas
  ///
  /// [preferredBackupWindow]:  The daily time range during which automated
  /// backups are created.
  ///
  /// Not applicable. The daily time range for creating automated backups is
  /// managed by the DB cluster. For more information, see CreateDBCluster.
  ///
  /// [port]: The port number on which the database accepts connections.
  ///
  /// Not applicable. The port is managed by the DB cluster. For more
  /// information, see CreateDBCluster.
  ///
  ///  Default: `8182`
  ///
  /// Type: Integer
  ///
  /// [multiAZ]: Specifies if the DB instance is a Multi-AZ deployment. You
  /// can't set the AvailabilityZone parameter if the MultiAZ parameter is set
  /// to true.
  ///
  /// [engineVersion]: The version number of the database engine to use.
  ///
  /// [autoMinorVersionUpgrade]: Indicates that minor engine upgrades are
  /// applied automatically to the DB instance during the maintenance window.
  ///
  /// Default: `true`
  ///
  /// [licenseModel]: License model information for this DB instance.
  ///
  ///  Valid values: `license-included` | `bring-your-own-license` |
  /// `general-public-license`
  ///
  /// [iops]: The amount of Provisioned IOPS (input/output operations per
  /// second) to be initially allocated for the DB instance.
  ///
  /// [optionGroupName]: Indicates that the DB instance should be associated
  /// with the specified option group.
  ///
  /// Permanent options, such as the TDE option for Oracle Advanced Security
  /// TDE, can't be removed from an option group, and that option group can't be
  /// removed from a DB instance once it is associated with a DB instance
  ///
  /// [characterSetName]: Indicates that the DB instance should be associated
  /// with the specified CharacterSet.
  ///
  /// Not applicable. The character set is managed by the DB cluster. For more
  /// information, see CreateDBCluster.
  ///
  /// [publiclyAccessible]: This flag should no longer be used.
  ///
  /// [tags]: The tags to assign to the new instance.
  ///
  /// [dbClusterIdentifier]: The identifier of the DB cluster that the instance
  /// will belong to.
  ///
  /// For information on creating a DB cluster, see CreateDBCluster.
  ///
  /// Type: String
  ///
  /// [storageType]: Specifies the storage type to be associated with the DB
  /// instance.
  ///
  /// Not applicable. Storage is managed by the DB Cluster.
  ///
  /// [tdeCredentialArn]: The ARN from the key store with which to associate the
  /// instance for TDE encryption.
  ///
  /// [tdeCredentialPassword]: The password for the given ARN from the key store
  /// in order to access the device.
  ///
  /// [storageEncrypted]: Specifies whether the DB instance is encrypted.
  ///
  /// Not applicable. The encryption for DB instances is managed by the DB
  /// cluster. For more information, see CreateDBCluster.
  ///
  /// Default: false
  ///
  /// [kmsKeyId]: The AWS KMS key identifier for an encrypted DB instance.
  ///
  /// The KMS key identifier is the Amazon Resource Name (ARN) for the KMS
  /// encryption key. If you are creating a DB instance with the same AWS
  /// account that owns the KMS encryption key used to encrypt the new DB
  /// instance, then you can use the KMS key alias instead of the ARN for the KM
  /// encryption key.
  ///
  /// Not applicable. The KMS key identifier is managed by the DB cluster. For
  /// more information, see CreateDBCluster.
  ///
  /// If the `StorageEncrypted` parameter is true, and you do not specify a
  /// value for the `KmsKeyId` parameter, then Amazon Neptune will use your
  /// default encryption key. AWS KMS creates the default encryption key for
  /// your AWS account. Your AWS account has a different default encryption key
  /// for each AWS Region.
  ///
  /// [domain]: Specify the Active Directory Domain to create the instance in.
  ///
  /// [copyTagsToSnapshot]: True to copy all tags from the DB instance to
  /// snapshots of the DB instance, and otherwise false. The default is false.
  ///
  /// [monitoringInterval]: The interval, in seconds, between points when
  /// Enhanced Monitoring metrics are collected for the DB instance. To disable
  /// collecting Enhanced Monitoring metrics, specify 0. The default is 0.
  ///
  /// If `MonitoringRoleArn` is specified, then you must also set
  /// `MonitoringInterval` to a value other than 0.
  ///
  /// Valid Values: `0, 1, 5, 10, 15, 30, 60`
  ///
  /// [monitoringRoleArn]: The ARN for the IAM role that permits Neptune to send
  /// enhanced monitoring metrics to Amazon CloudWatch Logs. For example,
  /// `arn:aws:iam:123456789012:role/emaccess`.
  ///
  /// If `MonitoringInterval` is set to a value other than 0, then you must
  /// supply a `MonitoringRoleArn` value.
  ///
  /// [domainIamRoleName]: Specify the name of the IAM role to be used when
  /// making API calls to the Directory Service.
  ///
  /// [promotionTier]: A value that specifies the order in which an Read Replica
  /// is promoted to the primary instance after a failure of the existing
  /// primary instance.
  ///
  /// Default: 1
  ///
  /// Valid Values: 0 - 15
  ///
  /// [timezone]: The time zone of the DB instance.
  ///
  /// [enableIamDatabaseAuthentication]: True to enable AWS Identity and Access
  /// Management (IAM) authentication for Neptune.
  ///
  /// Default: `false`
  ///
  /// [enablePerformanceInsights]: True to enable Performance Insights for the
  /// DB instance, and otherwise false.
  ///
  /// [performanceInsightsKmsKeyId]: The AWS KMS key identifier for encryption
  /// of Performance Insights data. The KMS key ID is the Amazon Resource Name
  /// (ARN), KMS key identifier, or the KMS key alias for the KMS encryption
  /// key.
  ///
  /// [enableCloudwatchLogsExports]: The list of log types that need to be
  /// enabled for exporting to CloudWatch Logs.
  Future<CreateDBInstanceResult> createDBInstance(
      {String dbName,
      @required String dbInstanceIdentifier,
      int allocatedStorage,
      @required String dbInstanceClass,
      @required String engine,
      String masterUsername,
      String masterUserPassword,
      List<String> dbSecurityGroups,
      List<String> vpcSecurityGroupIds,
      String availabilityZone,
      String dbSubnetGroupName,
      String preferredMaintenanceWindow,
      String dbParameterGroupName,
      int backupRetentionPeriod,
      String preferredBackupWindow,
      int port,
      bool multiAZ,
      String engineVersion,
      bool autoMinorVersionUpgrade,
      String licenseModel,
      int iops,
      String optionGroupName,
      String characterSetName,
      bool publiclyAccessible,
      List<Tag> tags,
      String dbClusterIdentifier,
      String storageType,
      String tdeCredentialArn,
      String tdeCredentialPassword,
      bool storageEncrypted,
      String kmsKeyId,
      String domain,
      bool copyTagsToSnapshot,
      int monitoringInterval,
      String monitoringRoleArn,
      String domainIamRoleName,
      int promotionTier,
      String timezone,
      bool enableIamDatabaseAuthentication,
      bool enablePerformanceInsights,
      String performanceInsightsKmsKeyId,
      List<String> enableCloudwatchLogsExports}) async {
    var response_ = await _client.send('CreateDBInstance', {
      if (dbName != null) 'DBName': dbName,
      'DBInstanceIdentifier': dbInstanceIdentifier,
      if (allocatedStorage != null) 'AllocatedStorage': allocatedStorage,
      'DBInstanceClass': dbInstanceClass,
      'Engine': engine,
      if (masterUsername != null) 'MasterUsername': masterUsername,
      if (masterUserPassword != null) 'MasterUserPassword': masterUserPassword,
      if (dbSecurityGroups != null) 'DBSecurityGroups': dbSecurityGroups,
      if (vpcSecurityGroupIds != null)
        'VpcSecurityGroupIds': vpcSecurityGroupIds,
      if (availabilityZone != null) 'AvailabilityZone': availabilityZone,
      if (dbSubnetGroupName != null) 'DBSubnetGroupName': dbSubnetGroupName,
      if (preferredMaintenanceWindow != null)
        'PreferredMaintenanceWindow': preferredMaintenanceWindow,
      if (dbParameterGroupName != null)
        'DBParameterGroupName': dbParameterGroupName,
      if (backupRetentionPeriod != null)
        'BackupRetentionPeriod': backupRetentionPeriod,
      if (preferredBackupWindow != null)
        'PreferredBackupWindow': preferredBackupWindow,
      if (port != null) 'Port': port,
      if (multiAZ != null) 'MultiAZ': multiAZ,
      if (engineVersion != null) 'EngineVersion': engineVersion,
      if (autoMinorVersionUpgrade != null)
        'AutoMinorVersionUpgrade': autoMinorVersionUpgrade,
      if (licenseModel != null) 'LicenseModel': licenseModel,
      if (iops != null) 'Iops': iops,
      if (optionGroupName != null) 'OptionGroupName': optionGroupName,
      if (characterSetName != null) 'CharacterSetName': characterSetName,
      if (publiclyAccessible != null) 'PubliclyAccessible': publiclyAccessible,
      if (tags != null) 'Tags': tags,
      if (dbClusterIdentifier != null)
        'DBClusterIdentifier': dbClusterIdentifier,
      if (storageType != null) 'StorageType': storageType,
      if (tdeCredentialArn != null) 'TdeCredentialArn': tdeCredentialArn,
      if (tdeCredentialPassword != null)
        'TdeCredentialPassword': tdeCredentialPassword,
      if (storageEncrypted != null) 'StorageEncrypted': storageEncrypted,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (domain != null) 'Domain': domain,
      if (copyTagsToSnapshot != null) 'CopyTagsToSnapshot': copyTagsToSnapshot,
      if (monitoringInterval != null) 'MonitoringInterval': monitoringInterval,
      if (monitoringRoleArn != null) 'MonitoringRoleArn': monitoringRoleArn,
      if (domainIamRoleName != null) 'DomainIAMRoleName': domainIamRoleName,
      if (promotionTier != null) 'PromotionTier': promotionTier,
      if (timezone != null) 'Timezone': timezone,
      if (enableIamDatabaseAuthentication != null)
        'EnableIAMDatabaseAuthentication': enableIamDatabaseAuthentication,
      if (enablePerformanceInsights != null)
        'EnablePerformanceInsights': enablePerformanceInsights,
      if (performanceInsightsKmsKeyId != null)
        'PerformanceInsightsKMSKeyId': performanceInsightsKmsKeyId,
      if (enableCloudwatchLogsExports != null)
        'EnableCloudwatchLogsExports': enableCloudwatchLogsExports,
    });
    return CreateDBInstanceResult.fromJson(response_);
  }

  /// Creates a new DB parameter group.
  ///
  /// A DB parameter group is initially created with the default parameters for
  /// the database engine used by the DB instance. To provide custom values for
  /// any of the parameters, you must modify the group after creating it using
  /// _ModifyDBParameterGroup_. Once you've created a DB parameter group, you
  /// need to associate it with your DB instance using _ModifyDBInstance_. When
  /// you associate a new DB parameter group with a running DB instance, you
  /// need to reboot the DB instance without failover for the new DB parameter
  /// group and associated settings to take effect.
  ///
  ///
  ///
  /// After you create a DB parameter group, you should wait at least 5 minutes
  /// before creating your first DB instance that uses that DB parameter group
  /// as the default parameter group. This allows Amazon Neptune to fully
  /// complete the create action before the parameter group is used as the
  /// default for a new DB instance. This is especially important for parameters
  /// that are critical when creating the default database for a DB instance,
  /// such as the character set for the default database defined by the
  /// `character_set_database` parameter. You can use the _Parameter Groups_
  /// option of the Amazon Neptune console or the _DescribeDBParameters_ command
  /// to verify that your DB parameter group has been created or modified.
  ///
  /// [dbParameterGroupName]: The name of the DB parameter group.
  ///
  /// Constraints:
  ///
  /// *   Must be 1 to 255 letters, numbers, or hyphens.
  ///
  /// *   First character must be a letter
  ///
  /// *   Cannot end with a hyphen or contain two consecutive hyphens
  ///
  ///
  ///
  ///
  /// This value is stored as a lowercase string.
  ///
  /// [dbParameterGroupFamily]: The DB parameter group family name. A DB
  /// parameter group can be associated with one and only one DB parameter group
  /// family, and can be applied only to a DB instance running a database engine
  /// and engine version compatible with that DB parameter group family.
  ///
  /// [description]: The description for the DB parameter group.
  ///
  /// [tags]: The tags to be assigned to the new DB parameter group.
  Future<CreateDBParameterGroupResult> createDBParameterGroup(
      {@required String dbParameterGroupName,
      @required String dbParameterGroupFamily,
      @required String description,
      List<Tag> tags}) async {
    var response_ = await _client.send('CreateDBParameterGroup', {
      'DBParameterGroupName': dbParameterGroupName,
      'DBParameterGroupFamily': dbParameterGroupFamily,
      'Description': description,
      if (tags != null) 'Tags': tags,
    });
    return CreateDBParameterGroupResult.fromJson(response_);
  }

  /// Creates a new DB subnet group. DB subnet groups must contain at least one
  /// subnet in at least two AZs in the AWS Region.
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
  /// [subnetIds]: The EC2 Subnet IDs for the DB subnet group.
  ///
  /// [tags]: The tags to be assigned to the new DB subnet group.
  Future<CreateDBSubnetGroupResult> createDBSubnetGroup(
      {@required String dbSubnetGroupName,
      @required String dbSubnetGroupDescription,
      @required List<String> subnetIds,
      List<Tag> tags}) async {
    var response_ = await _client.send('CreateDBSubnetGroup', {
      'DBSubnetGroupName': dbSubnetGroupName,
      'DBSubnetGroupDescription': dbSubnetGroupDescription,
      'SubnetIds': subnetIds,
      if (tags != null) 'Tags': tags,
    });
    return CreateDBSubnetGroupResult.fromJson(response_);
  }

  /// Creates an event notification subscription. This action requires a topic
  /// ARN (Amazon Resource Name) created by either the Neptune console, the SNS
  /// console, or the SNS API. To obtain an ARN with SNS, you must create a
  /// topic in Amazon SNS and subscribe to the topic. The ARN is displayed in
  /// the SNS console.
  ///
  /// You can specify the type of source (SourceType) you want to be notified
  /// of, provide a list of Neptune sources (SourceIds) that triggers the
  /// events, and provide a list of event categories (EventCategories) for
  /// events you want to be notified of. For example, you can specify SourceType
  /// = db-instance, SourceIds = mydbinstance1, mydbinstance2 and
  /// EventCategories = Availability, Backup.
  ///
  /// If you specify both the SourceType and SourceIds, such as SourceType =
  /// db-instance and SourceIdentifier = myDBInstance1, you are notified of all
  /// the db-instance events for the specified source. If you specify a
  /// SourceType but do not specify a SourceIdentifier, you receive notice of
  /// the events for that source type for all your Neptune sources. If you do
  /// not specify either the SourceType nor the SourceIdentifier, you are
  /// notified of events generated from all Neptune sources belonging to your
  /// customer account.
  ///
  /// [subscriptionName]: The name of the subscription.
  ///
  /// Constraints: The name must be less than 255 characters.
  ///
  /// [snsTopicArn]: The Amazon Resource Name (ARN) of the SNS topic created for
  /// event notification. The ARN is created by Amazon SNS when you create a
  /// topic and subscribe to it.
  ///
  /// [sourceType]: The type of source that is generating the events. For
  /// example, if you want to be notified of events generated by a DB instance,
  /// you would set this parameter to db-instance. if this value is not
  /// specified, all events are returned.
  ///
  /// Valid values: `db-instance` | `db-cluster` | `db-parameter-group` |
  /// `db-security-group` | `db-snapshot` | `db-cluster-snapshot`
  ///
  /// [eventCategories]:  A list of event categories for a SourceType that you
  /// want to subscribe to. You can see a list of the categories for a given
  /// SourceType by using the **DescribeEventCategories** action.
  ///
  /// [sourceIds]: The list of identifiers of the event sources for which events
  /// are returned. If not specified, then all sources are included in the
  /// response. An identifier must begin with a letter and must contain only
  /// ASCII letters, digits, and hyphens; it can't end with a hyphen or contain
  /// two consecutive hyphens.
  ///
  /// Constraints:
  ///
  /// *   If SourceIds are supplied, SourceType must also be provided.
  ///
  /// *   If the source type is a DB instance, then a `DBInstanceIdentifier`
  /// must be supplied.
  ///
  /// *   If the source type is a DB security group, a `DBSecurityGroupName`
  /// must be supplied.
  ///
  /// *   If the source type is a DB parameter group, a `DBParameterGroupName`
  /// must be supplied.
  ///
  /// *   If the source type is a DB snapshot, a `DBSnapshotIdentifier` must be
  /// supplied.
  ///
  /// [enabled]:  A Boolean value; set to **true** to activate the subscription,
  /// set to **false** to create the subscription but not active it.
  ///
  /// [tags]: The tags to be applied to the new event subscription.
  Future<CreateEventSubscriptionResult> createEventSubscription(
      {@required String subscriptionName,
      @required String snsTopicArn,
      String sourceType,
      List<String> eventCategories,
      List<String> sourceIds,
      bool enabled,
      List<Tag> tags}) async {
    var response_ = await _client.send('CreateEventSubscription', {
      'SubscriptionName': subscriptionName,
      'SnsTopicArn': snsTopicArn,
      if (sourceType != null) 'SourceType': sourceType,
      if (eventCategories != null) 'EventCategories': eventCategories,
      if (sourceIds != null) 'SourceIds': sourceIds,
      if (enabled != null) 'Enabled': enabled,
      if (tags != null) 'Tags': tags,
    });
    return CreateEventSubscriptionResult.fromJson(response_);
  }

  /// The DeleteDBCluster action deletes a previously provisioned DB cluster.
  /// When you delete a DB cluster, all automated backups for that DB cluster
  /// are deleted and can't be recovered. Manual DB cluster snapshots of the
  /// specified DB cluster are not deleted.
  ///
  /// [dbClusterIdentifier]: The DB cluster identifier for the DB cluster to be
  /// deleted. This parameter isn't case-sensitive.
  ///
  /// Constraints:
  ///
  /// *   Must match an existing DBClusterIdentifier.
  ///
  /// [skipFinalSnapshot]:  Determines whether a final DB cluster snapshot is
  /// created before the DB cluster is deleted. If `true` is specified, no DB
  /// cluster snapshot is created. If `false` is specified, a DB cluster
  /// snapshot is created before the DB cluster is deleted.
  ///
  ///  You must specify a `FinalDBSnapshotIdentifier` parameter if
  /// `SkipFinalSnapshot` is `false`.
  ///
  /// Default: `false`
  ///
  /// [finalDBSnapshotIdentifier]:  The DB cluster snapshot identifier of the
  /// new DB cluster snapshot created when `SkipFinalSnapshot` is set to
  /// `false`.
  ///
  ///   Specifying this parameter and also setting the `SkipFinalShapshot`
  /// parameter to true results in an error.
  ///
  /// Constraints:
  ///
  /// *   Must be 1 to 255 letters, numbers, or hyphens.
  ///
  /// *   First character must be a letter
  ///
  /// *   Cannot end with a hyphen or contain two consecutive hyphens
  Future<DeleteDBClusterResult> deleteDBCluster(String dbClusterIdentifier,
      {bool skipFinalSnapshot, String finalDBSnapshotIdentifier}) async {
    var response_ = await _client.send('DeleteDBCluster', {
      'DBClusterIdentifier': dbClusterIdentifier,
      if (skipFinalSnapshot != null) 'SkipFinalSnapshot': skipFinalSnapshot,
      if (finalDBSnapshotIdentifier != null)
        'FinalDBSnapshotIdentifier': finalDBSnapshotIdentifier,
    });
    return DeleteDBClusterResult.fromJson(response_);
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
      String dbClusterParameterGroupName) async {
    await _client.send('DeleteDBClusterParameterGroup', {
      'DBClusterParameterGroupName': dbClusterParameterGroupName,
    });
  }

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
    var response_ = await _client.send('DeleteDBClusterSnapshot', {
      'DBClusterSnapshotIdentifier': dbClusterSnapshotIdentifier,
    });
    return DeleteDBClusterSnapshotResult.fromJson(response_);
  }

  /// The DeleteDBInstance action deletes a previously provisioned DB instance.
  /// When you delete a DB instance, all automated backups for that instance are
  /// deleted and can't be recovered. Manual DB snapshots of the DB instance to
  /// be deleted by `DeleteDBInstance` are not deleted.
  ///
  ///  If you request a final DB snapshot the status of the Amazon Neptune DB
  /// instance is `deleting` until the DB snapshot is created. The API action
  /// `DescribeDBInstance` is used to monitor the status of this operation. The
  /// action can't be canceled or reverted once submitted.
  ///
  /// Note that when a DB instance is in a failure state and has a status of
  /// `failed`, `incompatible-restore`, or `incompatible-network`, you can only
  /// delete it when the `SkipFinalSnapshot` parameter is set to `true`.
  ///
  /// You can't delete a DB instance if it is the only instance in the DB
  /// cluster.
  ///
  /// [dbInstanceIdentifier]: The DB instance identifier for the DB instance to
  /// be deleted. This parameter isn't case-sensitive.
  ///
  /// Constraints:
  ///
  /// *   Must match the name of an existing DB instance.
  ///
  /// [skipFinalSnapshot]:  Determines whether a final DB snapshot is created
  /// before the DB instance is deleted. If `true` is specified, no DBSnapshot
  /// is created. If `false` is specified, a DB snapshot is created before the
  /// DB instance is deleted.
  ///
  /// Note that when a DB instance is in a failure state and has a status of
  /// 'failed', 'incompatible-restore', or 'incompatible-network', it can only
  /// be deleted when the SkipFinalSnapshot parameter is set to "true".
  ///
  /// Specify `true` when deleting a Read Replica.
  ///
  ///  The FinalDBSnapshotIdentifier parameter must be specified if
  /// SkipFinalSnapshot is `false`.
  ///
  /// Default: `false`
  ///
  /// [finalDBSnapshotIdentifier]:  The DBSnapshotIdentifier of the new
  /// DBSnapshot created when SkipFinalSnapshot is set to `false`.
  ///
  ///  Specifying this parameter and also setting the SkipFinalShapshot
  /// parameter to true results in an error.
  ///
  /// Constraints:
  ///
  /// *   Must be 1 to 255 letters or numbers.
  ///
  /// *   First character must be a letter
  ///
  /// *   Cannot end with a hyphen or contain two consecutive hyphens
  ///
  /// *   Cannot be specified when deleting a Read Replica.
  Future<DeleteDBInstanceResult> deleteDBInstance(String dbInstanceIdentifier,
      {bool skipFinalSnapshot, String finalDBSnapshotIdentifier}) async {
    var response_ = await _client.send('DeleteDBInstance', {
      'DBInstanceIdentifier': dbInstanceIdentifier,
      if (skipFinalSnapshot != null) 'SkipFinalSnapshot': skipFinalSnapshot,
      if (finalDBSnapshotIdentifier != null)
        'FinalDBSnapshotIdentifier': finalDBSnapshotIdentifier,
    });
    return DeleteDBInstanceResult.fromJson(response_);
  }

  /// Deletes a specified DBParameterGroup. The DBParameterGroup to be deleted
  /// can't be associated with any DB instances.
  ///
  /// [dbParameterGroupName]: The name of the DB parameter group.
  ///
  /// Constraints:
  ///
  /// *   Must be the name of an existing DB parameter group
  ///
  /// *   You can't delete a default DB parameter group
  ///
  /// *   Cannot be associated with any DB instances
  Future<void> deleteDBParameterGroup(String dbParameterGroupName) async {
    await _client.send('DeleteDBParameterGroup', {
      'DBParameterGroupName': dbParameterGroupName,
    });
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
  /// Constraints: Must match the name of an existing DBSubnetGroup. Must not be
  /// default.
  ///
  /// Example: `mySubnetgroup`
  Future<void> deleteDBSubnetGroup(String dbSubnetGroupName) async {
    await _client.send('DeleteDBSubnetGroup', {
      'DBSubnetGroupName': dbSubnetGroupName,
    });
  }

  /// Deletes an event notification subscription.
  ///
  /// [subscriptionName]: The name of the event notification subscription you
  /// want to delete.
  Future<DeleteEventSubscriptionResult> deleteEventSubscription(
      String subscriptionName) async {
    var response_ = await _client.send('DeleteEventSubscription', {
      'SubscriptionName': subscriptionName,
    });
    return DeleteEventSubscriptionResult.fromJson(response_);
  }

  ///  Returns a list of `DBClusterParameterGroup` descriptions. If a
  /// `DBClusterParameterGroupName` parameter is specified, the list will
  /// contain only the description of the specified DB cluster parameter group.
  ///
  /// [dbClusterParameterGroupName]: The name of a specific DB cluster parameter
  /// group to return details for.
  ///
  /// Constraints:
  ///
  /// *   If supplied, must match the name of an existing
  /// DBClusterParameterGroup.
  ///
  /// [filters]: This parameter is not currently supported.
  ///
  /// [maxRecords]:  The maximum number of records to include in the response.
  /// If more records exist than the specified `MaxRecords` value, a pagination
  /// token called a marker is included in the response so that the remaining
  /// results can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  ///
  /// [marker]:  An optional pagination token provided by a previous
  /// `DescribeDBClusterParameterGroups` request. If this parameter is
  /// specified, the response includes only records beyond the marker, up to the
  /// value specified by `MaxRecords`.
  Future<DBClusterParameterGroupsMessage> describeDBClusterParameterGroups(
      {String dbClusterParameterGroupName,
      List<Filter> filters,
      int maxRecords,
      String marker}) async {
    var response_ = await _client.send('DescribeDBClusterParameterGroups', {
      if (dbClusterParameterGroupName != null)
        'DBClusterParameterGroupName': dbClusterParameterGroupName,
      if (filters != null) 'Filters': filters,
      if (maxRecords != null) 'MaxRecords': maxRecords,
      if (marker != null) 'Marker': marker,
    });
    return DBClusterParameterGroupsMessage.fromJson(response_);
  }

  /// Returns the detailed parameter list for a particular DB cluster parameter
  /// group.
  ///
  /// [dbClusterParameterGroupName]: The name of a specific DB cluster parameter
  /// group to return parameter details for.
  ///
  /// Constraints:
  ///
  /// *   If supplied, must match the name of an existing
  /// DBClusterParameterGroup.
  ///
  /// [source]:  A value that indicates to return only parameters for a specific
  /// source. Parameter sources can be `engine`, `service`, or `customer`.
  ///
  /// [filters]: This parameter is not currently supported.
  ///
  /// [maxRecords]:  The maximum number of records to include in the response.
  /// If more records exist than the specified `MaxRecords` value, a pagination
  /// token called a marker is included in the response so that the remaining
  /// results can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  ///
  /// [marker]:  An optional pagination token provided by a previous
  /// `DescribeDBClusterParameters` request. If this parameter is specified, the
  /// response includes only records beyond the marker, up to the value
  /// specified by `MaxRecords`.
  Future<DBClusterParameterGroupDetails> describeDBClusterParameters(
      String dbClusterParameterGroupName,
      {String source,
      List<Filter> filters,
      int maxRecords,
      String marker}) async {
    var response_ = await _client.send('DescribeDBClusterParameters', {
      'DBClusterParameterGroupName': dbClusterParameterGroupName,
      if (source != null) 'Source': source,
      if (filters != null) 'Filters': filters,
      if (maxRecords != null) 'MaxRecords': maxRecords,
      if (marker != null) 'Marker': marker,
    });
    return DBClusterParameterGroupDetails.fromJson(response_);
  }

  /// Returns a list of DB cluster snapshot attribute names and values for a
  /// manual DB cluster snapshot.
  ///
  /// When sharing snapshots with other AWS accounts,
  /// `DescribeDBClusterSnapshotAttributes` returns the `restore` attribute and
  /// a list of IDs for the AWS accounts that are authorized to copy or restore
  /// the manual DB cluster snapshot. If `all` is included in the list of values
  /// for the `restore` attribute, then the manual DB cluster snapshot is public
  /// and can be copied or restored by all AWS accounts.
  ///
  /// To add or remove access for an AWS account to copy or restore a manual DB
  /// cluster snapshot, or to make the manual DB cluster snapshot public or
  /// private, use the ModifyDBClusterSnapshotAttribute API action.
  ///
  /// [dbClusterSnapshotIdentifier]: The identifier for the DB cluster snapshot
  /// to describe the attributes for.
  Future<DescribeDBClusterSnapshotAttributesResult>
      describeDBClusterSnapshotAttributes(
          String dbClusterSnapshotIdentifier) async {
    var response_ = await _client.send('DescribeDBClusterSnapshotAttributes', {
      'DBClusterSnapshotIdentifier': dbClusterSnapshotIdentifier,
    });
    return DescribeDBClusterSnapshotAttributesResult.fromJson(response_);
  }

  /// Returns information about DB cluster snapshots. This API action supports
  /// pagination.
  ///
  /// [dbClusterIdentifier]: The ID of the DB cluster to retrieve the list of DB
  /// cluster snapshots for. This parameter can't be used in conjunction with
  /// the `DBClusterSnapshotIdentifier` parameter. This parameter is not
  /// case-sensitive.
  ///
  /// Constraints:
  ///
  /// *   If supplied, must match the identifier of an existing DBCluster.
  ///
  /// [dbClusterSnapshotIdentifier]: A specific DB cluster snapshot identifier
  /// to describe. This parameter can't be used in conjunction with the
  /// `DBClusterIdentifier` parameter. This value is stored as a lowercase
  /// string.
  ///
  /// Constraints:
  ///
  /// *   If supplied, must match the identifier of an existing
  /// DBClusterSnapshot.
  ///
  /// *   If this identifier is for an automated snapshot, the `SnapshotType`
  /// parameter must also be specified.
  ///
  /// [snapshotType]: The type of DB cluster snapshots to be returned. You can
  /// specify one of the following values:
  ///
  /// *    `automated` - Return all DB cluster snapshots that have been
  /// automatically taken by Amazon Neptune for my AWS account.
  ///
  /// *    `manual` - Return all DB cluster snapshots that have been taken by my
  /// AWS account.
  ///
  /// *    `shared` - Return all manual DB cluster snapshots that have been
  /// shared to my AWS account.
  ///
  /// *    `public` - Return all DB cluster snapshots that have been marked as
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
  /// [maxRecords]: The maximum number of records to include in the response. If
  /// more records exist than the specified `MaxRecords` value, a pagination
  /// token called a marker is included in the response so that the remaining
  /// results can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  ///
  /// [marker]: An optional pagination token provided by a previous
  /// `DescribeDBClusterSnapshots` request. If this parameter is specified, the
  /// response includes only records beyond the marker, up to the value
  /// specified by `MaxRecords`.
  ///
  /// [includeShared]: True to include shared manual DB cluster snapshots from
  /// other AWS accounts that this AWS account has been given permission to copy
  /// or restore, and otherwise false. The default is `false`.
  ///
  /// You can give an AWS account permission to restore a manual DB cluster
  /// snapshot from another AWS account by the ModifyDBClusterSnapshotAttribute
  /// API action.
  ///
  /// [includePublic]: True to include manual DB cluster snapshots that are
  /// public and can be copied or restored by any AWS account, and otherwise
  /// false. The default is `false`. The default is false.
  ///
  /// You can share a manual DB cluster snapshot as public by using the
  /// ModifyDBClusterSnapshotAttribute API action.
  Future<DBClusterSnapshotMessage> describeDBClusterSnapshots(
      {String dbClusterIdentifier,
      String dbClusterSnapshotIdentifier,
      String snapshotType,
      List<Filter> filters,
      int maxRecords,
      String marker,
      bool includeShared,
      bool includePublic}) async {
    var response_ = await _client.send('DescribeDBClusterSnapshots', {
      if (dbClusterIdentifier != null)
        'DBClusterIdentifier': dbClusterIdentifier,
      if (dbClusterSnapshotIdentifier != null)
        'DBClusterSnapshotIdentifier': dbClusterSnapshotIdentifier,
      if (snapshotType != null) 'SnapshotType': snapshotType,
      if (filters != null) 'Filters': filters,
      if (maxRecords != null) 'MaxRecords': maxRecords,
      if (marker != null) 'Marker': marker,
      if (includeShared != null) 'IncludeShared': includeShared,
      if (includePublic != null) 'IncludePublic': includePublic,
    });
    return DBClusterSnapshotMessage.fromJson(response_);
  }

  /// Returns information about provisioned DB clusters. This API supports
  /// pagination.
  ///
  /// [dbClusterIdentifier]: The user-supplied DB cluster identifier. If this
  /// parameter is specified, information from only the specific DB cluster is
  /// returned. This parameter isn't case-sensitive.
  ///
  /// Constraints:
  ///
  /// *   If supplied, must match an existing DBClusterIdentifier.
  ///
  /// [filters]: A filter that specifies one or more DB clusters to describe.
  ///
  /// Supported filters:
  ///
  /// *    `db-cluster-id` - Accepts DB cluster identifiers and DB cluster
  /// Amazon Resource Names (ARNs). The results list will only include
  /// information about the DB clusters identified by these ARNs.
  ///
  /// [maxRecords]: The maximum number of records to include in the response. If
  /// more records exist than the specified `MaxRecords` value, a pagination
  /// token called a marker is included in the response so that the remaining
  /// results can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  ///
  /// [marker]: An optional pagination token provided by a previous
  /// DescribeDBClusters request. If this parameter is specified, the response
  /// includes only records beyond the marker, up to the value specified by
  /// `MaxRecords`.
  Future<DBClusterMessage> describeDBClusters(
      {String dbClusterIdentifier,
      List<Filter> filters,
      int maxRecords,
      String marker}) async {
    var response_ = await _client.send('DescribeDBClusters', {
      if (dbClusterIdentifier != null)
        'DBClusterIdentifier': dbClusterIdentifier,
      if (filters != null) 'Filters': filters,
      if (maxRecords != null) 'MaxRecords': maxRecords,
      if (marker != null) 'Marker': marker,
    });
    return DBClusterMessage.fromJson(response_);
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
  /// *   If supplied, must match an existing DBParameterGroupFamily.
  ///
  /// [filters]: Not currently supported.
  ///
  /// [maxRecords]:  The maximum number of records to include in the response.
  /// If more than the `MaxRecords` value is available, a pagination token
  /// called a marker is included in the response so that the following results
  /// can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  ///
  /// [marker]:  An optional pagination token provided by a previous request. If
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
    var response_ = await _client.send('DescribeDBEngineVersions', {
      if (engine != null) 'Engine': engine,
      if (engineVersion != null) 'EngineVersion': engineVersion,
      if (dbParameterGroupFamily != null)
        'DBParameterGroupFamily': dbParameterGroupFamily,
      if (filters != null) 'Filters': filters,
      if (maxRecords != null) 'MaxRecords': maxRecords,
      if (marker != null) 'Marker': marker,
      if (defaultOnly != null) 'DefaultOnly': defaultOnly,
      if (listSupportedCharacterSets != null)
        'ListSupportedCharacterSets': listSupportedCharacterSets,
      if (listSupportedTimezones != null)
        'ListSupportedTimezones': listSupportedTimezones,
    });
    return DBEngineVersionMessage.fromJson(response_);
  }

  /// Returns information about provisioned instances. This API supports
  /// pagination.
  ///
  /// [dbInstanceIdentifier]: The user-supplied instance identifier. If this
  /// parameter is specified, information from only the specific DB instance is
  /// returned. This parameter isn't case-sensitive.
  ///
  /// Constraints:
  ///
  /// *   If supplied, must match the identifier of an existing DBInstance.
  ///
  /// [filters]: A filter that specifies one or more DB instances to describe.
  ///
  /// Supported filters:
  ///
  /// *    `db-cluster-id` - Accepts DB cluster identifiers and DB cluster
  /// Amazon Resource Names (ARNs). The results list will only include
  /// information about the DB instances associated with the DB clusters
  /// identified by these ARNs.
  ///
  /// *    `db-instance-id` - Accepts DB instance identifiers and DB instance
  /// Amazon Resource Names (ARNs). The results list will only include
  /// information about the DB instances identified by these ARNs.
  ///
  /// [maxRecords]:  The maximum number of records to include in the response.
  /// If more records exist than the specified `MaxRecords` value, a pagination
  /// token called a marker is included in the response so that the remaining
  /// results can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  ///
  /// [marker]:  An optional pagination token provided by a previous
  /// `DescribeDBInstances` request. If this parameter is specified, the
  /// response includes only records beyond the marker, up to the value
  /// specified by `MaxRecords`.
  Future<DBInstanceMessage> describeDBInstances(
      {String dbInstanceIdentifier,
      List<Filter> filters,
      int maxRecords,
      String marker}) async {
    var response_ = await _client.send('DescribeDBInstances', {
      if (dbInstanceIdentifier != null)
        'DBInstanceIdentifier': dbInstanceIdentifier,
      if (filters != null) 'Filters': filters,
      if (maxRecords != null) 'MaxRecords': maxRecords,
      if (marker != null) 'Marker': marker,
    });
    return DBInstanceMessage.fromJson(response_);
  }

  /// Returns a list of `DBParameterGroup` descriptions. If a
  /// `DBParameterGroupName` is specified, the list will contain only the
  /// description of the specified DB parameter group.
  ///
  /// [dbParameterGroupName]: The name of a specific DB parameter group to
  /// return details for.
  ///
  /// Constraints:
  ///
  /// *   If supplied, must match the name of an existing
  /// DBClusterParameterGroup.
  ///
  /// [filters]: This parameter is not currently supported.
  ///
  /// [maxRecords]: The maximum number of records to include in the response. If
  /// more records exist than the specified `MaxRecords` value, a pagination
  /// token called a marker is included in the response so that the remaining
  /// results can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  ///
  /// [marker]: An optional pagination token provided by a previous
  /// `DescribeDBParameterGroups` request. If this parameter is specified, the
  /// response includes only records beyond the marker, up to the value
  /// specified by `MaxRecords`.
  Future<DBParameterGroupsMessage> describeDBParameterGroups(
      {String dbParameterGroupName,
      List<Filter> filters,
      int maxRecords,
      String marker}) async {
    var response_ = await _client.send('DescribeDBParameterGroups', {
      if (dbParameterGroupName != null)
        'DBParameterGroupName': dbParameterGroupName,
      if (filters != null) 'Filters': filters,
      if (maxRecords != null) 'MaxRecords': maxRecords,
      if (marker != null) 'Marker': marker,
    });
    return DBParameterGroupsMessage.fromJson(response_);
  }

  /// Returns the detailed parameter list for a particular DB parameter group.
  ///
  /// [dbParameterGroupName]: The name of a specific DB parameter group to
  /// return details for.
  ///
  /// Constraints:
  ///
  /// *   If supplied, must match the name of an existing DBParameterGroup.
  ///
  /// [source]: The parameter types to return.
  ///
  /// Default: All parameter types returned
  ///
  /// Valid Values: `user | system | engine-default`
  ///
  /// [filters]: This parameter is not currently supported.
  ///
  /// [maxRecords]: The maximum number of records to include in the response. If
  /// more records exist than the specified `MaxRecords` value, a pagination
  /// token called a marker is included in the response so that the remaining
  /// results can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  ///
  /// [marker]: An optional pagination token provided by a previous
  /// `DescribeDBParameters` request. If this parameter is specified, the
  /// response includes only records beyond the marker, up to the value
  /// specified by `MaxRecords`.
  Future<DBParameterGroupDetails> describeDBParameters(
      String dbParameterGroupName,
      {String source,
      List<Filter> filters,
      int maxRecords,
      String marker}) async {
    var response_ = await _client.send('DescribeDBParameters', {
      'DBParameterGroupName': dbParameterGroupName,
      if (source != null) 'Source': source,
      if (filters != null) 'Filters': filters,
      if (maxRecords != null) 'MaxRecords': maxRecords,
      if (marker != null) 'Marker': marker,
    });
    return DBParameterGroupDetails.fromJson(response_);
  }

  /// Returns a list of DBSubnetGroup descriptions. If a DBSubnetGroupName is
  /// specified, the list will contain only the descriptions of the specified
  /// DBSubnetGroup.
  ///
  /// For an overview of CIDR ranges, go to the
  /// [Wikipedia Tutorial](http://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing).
  ///
  /// [dbSubnetGroupName]: The name of the DB subnet group to return details
  /// for.
  ///
  /// [filters]: This parameter is not currently supported.
  ///
  /// [maxRecords]:  The maximum number of records to include in the response.
  /// If more records exist than the specified `MaxRecords` value, a pagination
  /// token called a marker is included in the response so that the remaining
  /// results can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  ///
  /// [marker]:  An optional pagination token provided by a previous
  /// DescribeDBSubnetGroups request. If this parameter is specified, the
  /// response includes only records beyond the marker, up to the value
  /// specified by `MaxRecords`.
  Future<DBSubnetGroupMessage> describeDBSubnetGroups(
      {String dbSubnetGroupName,
      List<Filter> filters,
      int maxRecords,
      String marker}) async {
    var response_ = await _client.send('DescribeDBSubnetGroups', {
      if (dbSubnetGroupName != null) 'DBSubnetGroupName': dbSubnetGroupName,
      if (filters != null) 'Filters': filters,
      if (maxRecords != null) 'MaxRecords': maxRecords,
      if (marker != null) 'Marker': marker,
    });
    return DBSubnetGroupMessage.fromJson(response_);
  }

  /// Returns the default engine and system parameter information for the
  /// cluster database engine.
  ///
  /// [dbParameterGroupFamily]: The name of the DB cluster parameter group
  /// family to return engine parameter information for.
  ///
  /// [filters]: This parameter is not currently supported.
  ///
  /// [maxRecords]:  The maximum number of records to include in the response.
  /// If more records exist than the specified `MaxRecords` value, a pagination
  /// token called a marker is included in the response so that the remaining
  /// results can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  ///
  /// [marker]:  An optional pagination token provided by a previous
  /// `DescribeEngineDefaultClusterParameters` request. If this parameter is
  /// specified, the response includes only records beyond the marker, up to the
  /// value specified by `MaxRecords`.
  Future<DescribeEngineDefaultClusterParametersResult>
      describeEngineDefaultClusterParameters(String dbParameterGroupFamily,
          {List<Filter> filters, int maxRecords, String marker}) async {
    var response_ =
        await _client.send('DescribeEngineDefaultClusterParameters', {
      'DBParameterGroupFamily': dbParameterGroupFamily,
      if (filters != null) 'Filters': filters,
      if (maxRecords != null) 'MaxRecords': maxRecords,
      if (marker != null) 'Marker': marker,
    });
    return DescribeEngineDefaultClusterParametersResult.fromJson(response_);
  }

  /// Returns the default engine and system parameter information for the
  /// specified database engine.
  ///
  /// [dbParameterGroupFamily]: The name of the DB parameter group family.
  ///
  /// [filters]: Not currently supported.
  ///
  /// [maxRecords]:  The maximum number of records to include in the response.
  /// If more records exist than the specified `MaxRecords` value, a pagination
  /// token called a marker is included in the response so that the remaining
  /// results can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  ///
  /// [marker]:  An optional pagination token provided by a previous
  /// `DescribeEngineDefaultParameters` request. If this parameter is specified,
  /// the response includes only records beyond the marker, up to the value
  /// specified by `MaxRecords`.
  Future<DescribeEngineDefaultParametersResult> describeEngineDefaultParameters(
      String dbParameterGroupFamily,
      {List<Filter> filters,
      int maxRecords,
      String marker}) async {
    var response_ = await _client.send('DescribeEngineDefaultParameters', {
      'DBParameterGroupFamily': dbParameterGroupFamily,
      if (filters != null) 'Filters': filters,
      if (maxRecords != null) 'MaxRecords': maxRecords,
      if (marker != null) 'Marker': marker,
    });
    return DescribeEngineDefaultParametersResult.fromJson(response_);
  }

  /// Displays a list of categories for all event source types, or, if
  /// specified, for a specified source type.
  ///
  /// [sourceType]: The type of source that is generating the events.
  ///
  /// Valid values: db-instance | db-parameter-group | db-security-group |
  /// db-snapshot
  ///
  /// [filters]: This parameter is not currently supported.
  Future<EventCategoriesMessage> describeEventCategories(
      {String sourceType, List<Filter> filters}) async {
    var response_ = await _client.send('DescribeEventCategories', {
      if (sourceType != null) 'SourceType': sourceType,
      if (filters != null) 'Filters': filters,
    });
    return EventCategoriesMessage.fromJson(response_);
  }

  /// Lists all the subscription descriptions for a customer account. The
  /// description for a subscription includes SubscriptionName, SNSTopicARN,
  /// CustomerID, SourceType, SourceID, CreationTime, and Status.
  ///
  /// If you specify a SubscriptionName, lists the description for that
  /// subscription.
  ///
  /// [subscriptionName]: The name of the event notification subscription you
  /// want to describe.
  ///
  /// [filters]: This parameter is not currently supported.
  ///
  /// [maxRecords]:  The maximum number of records to include in the response.
  /// If more records exist than the specified `MaxRecords` value, a pagination
  /// token called a marker is included in the response so that the remaining
  /// results can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  ///
  /// [marker]:  An optional pagination token provided by a previous
  /// DescribeOrderableDBInstanceOptions request. If this parameter is
  /// specified, the response includes only records beyond the marker, up to the
  /// value specified by `MaxRecords` .
  Future<EventSubscriptionsMessage> describeEventSubscriptions(
      {String subscriptionName,
      List<Filter> filters,
      int maxRecords,
      String marker}) async {
    var response_ = await _client.send('DescribeEventSubscriptions', {
      if (subscriptionName != null) 'SubscriptionName': subscriptionName,
      if (filters != null) 'Filters': filters,
      if (maxRecords != null) 'MaxRecords': maxRecords,
      if (marker != null) 'Marker': marker,
    });
    return EventSubscriptionsMessage.fromJson(response_);
  }

  /// Returns events related to DB instances, DB security groups, DB snapshots,
  /// and DB parameter groups for the past 14 days. Events specific to a
  /// particular DB instance, DB security group, database snapshot, or DB
  /// parameter group can be obtained by providing the name as a parameter. By
  /// default, the past hour of events are returned.
  ///
  /// [sourceIdentifier]: The identifier of the event source for which events
  /// are returned. If not specified, then all sources are included in the
  /// response.
  ///
  /// Constraints:
  ///
  /// *   If SourceIdentifier is supplied, SourceType must also be provided.
  ///
  /// *   If the source type is `DBInstance`, then a `DBInstanceIdentifier` must
  /// be supplied.
  ///
  /// *   If the source type is `DBSecurityGroup`, a `DBSecurityGroupName` must
  /// be supplied.
  ///
  /// *   If the source type is `DBParameterGroup`, a `DBParameterGroupName`
  /// must be supplied.
  ///
  /// *   If the source type is `DBSnapshot`, a `DBSnapshotIdentifier` must be
  /// supplied.
  ///
  /// *   Cannot end with a hyphen or contain two consecutive hyphens.
  ///
  /// [sourceType]: The event source to retrieve events for. If no value is
  /// specified, all events are returned.
  ///
  /// [startTime]:  The beginning of the time interval to retrieve events for,
  /// specified in ISO 8601 format. For more information about ISO 8601, go to
  /// the [ISO8601 Wikipedia page.](http://en.wikipedia.org/wiki/ISO_8601)
  ///
  /// Example: 2009-07-08T18:00Z
  ///
  /// [endTime]:  The end of the time interval for which to retrieve events,
  /// specified in ISO 8601 format. For more information about ISO 8601, go to
  /// the [ISO8601 Wikipedia page.](http://en.wikipedia.org/wiki/ISO_8601)
  ///
  /// Example: 2009-07-08T18:00Z
  ///
  /// [duration]: The number of minutes to retrieve events for.
  ///
  /// Default: 60
  ///
  /// [eventCategories]: A list of event categories that trigger notifications
  /// for a event notification subscription.
  ///
  /// [filters]: This parameter is not currently supported.
  ///
  /// [maxRecords]:  The maximum number of records to include in the response.
  /// If more records exist than the specified `MaxRecords` value, a pagination
  /// token called a marker is included in the response so that the remaining
  /// results can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  ///
  /// [marker]:  An optional pagination token provided by a previous
  /// DescribeEvents request. If this parameter is specified, the response
  /// includes only records beyond the marker, up to the value specified by
  /// `MaxRecords`.
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
    var response_ = await _client.send('DescribeEvents', {
      if (sourceIdentifier != null) 'SourceIdentifier': sourceIdentifier,
      if (sourceType != null) 'SourceType': sourceType,
      if (startTime != null) 'StartTime': startTime,
      if (endTime != null) 'EndTime': endTime,
      if (duration != null) 'Duration': duration,
      if (eventCategories != null) 'EventCategories': eventCategories,
      if (filters != null) 'Filters': filters,
      if (maxRecords != null) 'MaxRecords': maxRecords,
      if (marker != null) 'Marker': marker,
    });
    return EventsMessage.fromJson(response_);
  }

  /// Returns a list of orderable DB instance options for the specified engine.
  ///
  /// [engine]: The name of the engine to retrieve DB instance options for.
  ///
  /// [engineVersion]: The engine version filter value. Specify this parameter
  /// to show only the available offerings matching the specified engine
  /// version.
  ///
  /// [dbInstanceClass]: The DB instance class filter value. Specify this
  /// parameter to show only the available offerings matching the specified DB
  /// instance class.
  ///
  /// [licenseModel]: The license model filter value. Specify this parameter to
  /// show only the available offerings matching the specified license model.
  ///
  /// [vpc]: The VPC filter value. Specify this parameter to show only the
  /// available VPC or non-VPC offerings.
  ///
  /// [filters]: This parameter is not currently supported.
  ///
  /// [maxRecords]:  The maximum number of records to include in the response.
  /// If more records exist than the specified `MaxRecords` value, a pagination
  /// token called a marker is included in the response so that the remaining
  /// results can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  ///
  /// [marker]:  An optional pagination token provided by a previous
  /// DescribeOrderableDBInstanceOptions request. If this parameter is
  /// specified, the response includes only records beyond the marker, up to the
  /// value specified by `MaxRecords` .
  Future<OrderableDBInstanceOptionsMessage> describeOrderableDBInstanceOptions(
      String engine,
      {String engineVersion,
      String dbInstanceClass,
      String licenseModel,
      bool vpc,
      List<Filter> filters,
      int maxRecords,
      String marker}) async {
    var response_ = await _client.send('DescribeOrderableDBInstanceOptions', {
      'Engine': engine,
      if (engineVersion != null) 'EngineVersion': engineVersion,
      if (dbInstanceClass != null) 'DBInstanceClass': dbInstanceClass,
      if (licenseModel != null) 'LicenseModel': licenseModel,
      if (vpc != null) 'Vpc': vpc,
      if (filters != null) 'Filters': filters,
      if (maxRecords != null) 'MaxRecords': maxRecords,
      if (marker != null) 'Marker': marker,
    });
    return OrderableDBInstanceOptionsMessage.fromJson(response_);
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
  /// *    `db-cluster-id` - Accepts DB cluster identifiers and DB cluster
  /// Amazon Resource Names (ARNs). The results list will only include pending
  /// maintenance actions for the DB clusters identified by these ARNs.
  ///
  /// *    `db-instance-id` - Accepts DB instance identifiers and DB instance
  /// ARNs. The results list will only include pending maintenance actions for
  /// the DB instances identified by these ARNs.
  ///
  /// [marker]:  An optional pagination token provided by a previous
  /// `DescribePendingMaintenanceActions` request. If this parameter is
  /// specified, the response includes only records beyond the marker, up to a
  /// number of records specified by `MaxRecords`.
  ///
  /// [maxRecords]:  The maximum number of records to include in the response.
  /// If more records exist than the specified `MaxRecords` value, a pagination
  /// token called a marker is included in the response so that the remaining
  /// results can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  Future<PendingMaintenanceActionsMessage> describePendingMaintenanceActions(
      {String resourceIdentifier,
      List<Filter> filters,
      String marker,
      int maxRecords}) async {
    var response_ = await _client.send('DescribePendingMaintenanceActions', {
      if (resourceIdentifier != null) 'ResourceIdentifier': resourceIdentifier,
      if (filters != null) 'Filters': filters,
      if (marker != null) 'Marker': marker,
      if (maxRecords != null) 'MaxRecords': maxRecords,
    });
    return PendingMaintenanceActionsMessage.fromJson(response_);
  }

  /// You can call DescribeValidDBInstanceModifications to learn what
  /// modifications you can make to your DB instance. You can use this
  /// information when you call ModifyDBInstance.
  ///
  /// [dbInstanceIdentifier]: The customer identifier or the ARN of your DB
  /// instance.
  Future<DescribeValidDBInstanceModificationsResult>
      describeValidDBInstanceModifications(String dbInstanceIdentifier) async {
    var response_ = await _client.send('DescribeValidDBInstanceModifications', {
      'DBInstanceIdentifier': dbInstanceIdentifier,
    });
    return DescribeValidDBInstanceModificationsResult.fromJson(response_);
  }

  /// Forces a failover for a DB cluster.
  ///
  /// A failover for a DB cluster promotes one of the Read Replicas (read-only
  /// instances) in the DB cluster to be the primary instance (the cluster
  /// writer).
  ///
  /// Amazon Neptune will automatically fail over to a Read Replica, if one
  /// exists, when the primary instance fails. You can force a failover when you
  /// want to simulate a failure of a primary instance for testing. Because each
  /// instance in a DB cluster has its own endpoint address, you will need to
  /// clean up and re-establish any existing connections that use those endpoint
  /// addresses when the failover is complete.
  ///
  /// [dbClusterIdentifier]: A DB cluster identifier to force a failover for.
  /// This parameter is not case-sensitive.
  ///
  /// Constraints:
  ///
  /// *   Must match the identifier of an existing DBCluster.
  ///
  /// [targetDBInstanceIdentifier]: The name of the instance to promote to the
  /// primary instance.
  ///
  /// You must specify the instance identifier for an Read Replica in the DB
  /// cluster. For example, `mydbcluster-replica1`.
  Future<FailoverDBClusterResult> failoverDBCluster(
      {String dbClusterIdentifier, String targetDBInstanceIdentifier}) async {
    var response_ = await _client.send('FailoverDBCluster', {
      if (dbClusterIdentifier != null)
        'DBClusterIdentifier': dbClusterIdentifier,
      if (targetDBInstanceIdentifier != null)
        'TargetDBInstanceIdentifier': targetDBInstanceIdentifier,
    });
    return FailoverDBClusterResult.fromJson(response_);
  }

  /// Lists all tags on an Amazon Neptune resource.
  ///
  /// [resourceName]: The Amazon Neptune resource with tags to be listed. This
  /// value is an Amazon Resource Name (ARN). For information about creating an
  /// ARN, see
  /// [Constructing an Amazon Resource Name (ARN)](https://docs.aws.amazon.com/neptune/latest/UserGuide/tagging.ARN.html#tagging.ARN.Constructing).
  ///
  /// [filters]: This parameter is not currently supported.
  Future<TagListMessage> listTagsForResource(String resourceName,
      {List<Filter> filters}) async {
    var response_ = await _client.send('ListTagsForResource', {
      'ResourceName': resourceName,
      if (filters != null) 'Filters': filters,
    });
    return TagListMessage.fromJson(response_);
  }

  /// Modify a setting for a DB cluster. You can change one or more database
  /// configuration parameters by specifying these parameters and the new values
  /// in the request.
  ///
  /// [dbClusterIdentifier]: The DB cluster identifier for the cluster being
  /// modified. This parameter is not case-sensitive.
  ///
  /// Constraints:
  ///
  /// *   Must match the identifier of an existing DBCluster.
  ///
  /// [newDBClusterIdentifier]: The new DB cluster identifier for the DB cluster
  /// when renaming a DB cluster. This value is stored as a lowercase string.
  ///
  /// Constraints:
  ///
  /// *   Must contain from 1 to 63 letters, numbers, or hyphens
  ///
  /// *   The first character must be a letter
  ///
  /// *   Cannot end with a hyphen or contain two consecutive hyphens
  ///
  ///
  /// Example: `my-cluster2`
  ///
  /// [applyImmediately]: A value that specifies whether the modifications in
  /// this request and any pending modifications are asynchronously applied as
  /// soon as possible, regardless of the `PreferredMaintenanceWindow` setting
  /// for the DB cluster. If this parameter is set to `false`, changes to the DB
  /// cluster are applied during the next maintenance window.
  ///
  /// The `ApplyImmediately` parameter only affects the `NewDBClusterIdentifier`
  /// and `MasterUserPassword` values. If you set the `ApplyImmediately`
  /// parameter value to false, then changes to the `NewDBClusterIdentifier` and
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
  /// *   Must be a value from 1 to 35
  ///
  /// [dbClusterParameterGroupName]: The name of the DB cluster parameter group
  /// to use for the DB cluster.
  ///
  /// [vpcSecurityGroupIds]: A list of VPC security groups that the DB cluster
  /// will belong to.
  ///
  /// [port]: The port number on which the DB cluster accepts connections.
  ///
  /// Constraints: Value must be `1150-65535`
  ///
  /// Default: The same port as the original DB cluster.
  ///
  /// [masterUserPassword]: The new password for the master database user. This
  /// password can contain any printable ASCII character except "/", """, or
  /// "@".
  ///
  /// Constraints: Must contain from 8 to 41 characters.
  ///
  /// [optionGroupName]: A value that indicates that the DB cluster should be
  /// associated with the specified option group. Changing this parameter
  /// doesn't result in an outage except in the following case, and the change
  /// is applied during the next maintenance window unless the
  /// `ApplyImmediately` parameter is set to `true` for this request. If the
  /// parameter change results in an option group that enables OEM, this change
  /// can cause a brief (sub-second) period during which new connections are
  /// rejected but existing connections are not interrupted.
  ///
  /// Permanent options can't be removed from an option group. The option group
  /// can't be removed from a DB cluster once it is associated with a DB
  /// cluster.
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
  /// Valid Days: Mon, Tue, Wed, Thu, Fri, Sat, Sun.
  ///
  /// Constraints: Minimum 30-minute window.
  ///
  /// [enableIamDatabaseAuthentication]: True to enable mapping of AWS Identity
  /// and Access Management (IAM) accounts to database accounts, and otherwise
  /// false.
  ///
  /// Default: `false`
  ///
  /// [cloudwatchLogsExportConfiguration]: The configuration setting for the log
  /// types to be enabled for export to CloudWatch Logs for a specific DB
  /// cluster.
  ///
  /// [engineVersion]: The version number of the database engine to which you
  /// want to upgrade. Changing this parameter results in an outage. The change
  /// is applied during the next maintenance window unless the ApplyImmediately
  /// parameter is set to true.
  ///
  /// For a list of valid engine versions, see CreateDBInstance, or call
  /// DescribeDBEngineVersions.
  Future<ModifyDBClusterResult> modifyDBCluster(String dbClusterIdentifier,
      {String newDBClusterIdentifier,
      bool applyImmediately,
      int backupRetentionPeriod,
      String dbClusterParameterGroupName,
      List<String> vpcSecurityGroupIds,
      int port,
      String masterUserPassword,
      String optionGroupName,
      String preferredBackupWindow,
      String preferredMaintenanceWindow,
      bool enableIamDatabaseAuthentication,
      CloudwatchLogsExportConfiguration cloudwatchLogsExportConfiguration,
      String engineVersion}) async {
    var response_ = await _client.send('ModifyDBCluster', {
      'DBClusterIdentifier': dbClusterIdentifier,
      if (newDBClusterIdentifier != null)
        'NewDBClusterIdentifier': newDBClusterIdentifier,
      if (applyImmediately != null) 'ApplyImmediately': applyImmediately,
      if (backupRetentionPeriod != null)
        'BackupRetentionPeriod': backupRetentionPeriod,
      if (dbClusterParameterGroupName != null)
        'DBClusterParameterGroupName': dbClusterParameterGroupName,
      if (vpcSecurityGroupIds != null)
        'VpcSecurityGroupIds': vpcSecurityGroupIds,
      if (port != null) 'Port': port,
      if (masterUserPassword != null) 'MasterUserPassword': masterUserPassword,
      if (optionGroupName != null) 'OptionGroupName': optionGroupName,
      if (preferredBackupWindow != null)
        'PreferredBackupWindow': preferredBackupWindow,
      if (preferredMaintenanceWindow != null)
        'PreferredMaintenanceWindow': preferredMaintenanceWindow,
      if (enableIamDatabaseAuthentication != null)
        'EnableIAMDatabaseAuthentication': enableIamDatabaseAuthentication,
      if (cloudwatchLogsExportConfiguration != null)
        'CloudwatchLogsExportConfiguration': cloudwatchLogsExportConfiguration,
      if (engineVersion != null) 'EngineVersion': engineVersion,
    });
    return ModifyDBClusterResult.fromJson(response_);
  }

  ///  Modifies the parameters of a DB cluster parameter group. To modify more
  /// than one parameter, submit a list of the following: `ParameterName`,
  /// `ParameterValue`, and `ApplyMethod`. A maximum of 20 parameters can be
  /// modified in a single request.
  ///
  ///  Changes to dynamic parameters are applied immediately. Changes to static
  /// parameters require a reboot without failover to the DB cluster associated
  /// with the parameter group before the change can take effect.
  ///
  /// After you create a DB cluster parameter group, you should wait at least 5
  /// minutes before creating your first DB cluster that uses that DB cluster
  /// parameter group as the default parameter group. This allows Amazon Neptune
  /// to fully complete the create action before the parameter group is used as
  /// the default for a new DB cluster. This is especially important for
  /// parameters that are critical when creating the default database for a DB
  /// cluster, such as the character set for the default database defined by the
  /// `character_set_database` parameter. You can use the _Parameter Groups_
  /// option of the Amazon Neptune console or the DescribeDBClusterParameters
  /// command to verify that your DB cluster parameter group has been created or
  /// modified.
  ///
  /// [dbClusterParameterGroupName]: The name of the DB cluster parameter group
  /// to modify.
  ///
  /// [parameters]: A list of parameters in the DB cluster parameter group to
  /// modify.
  Future<DBClusterParameterGroupNameMessage> modifyDBClusterParameterGroup(
      {@required String dbClusterParameterGroupName,
      @required List<Parameter> parameters}) async {
    var response_ = await _client.send('ModifyDBClusterParameterGroup', {
      'DBClusterParameterGroupName': dbClusterParameterGroupName,
      'Parameters': parameters,
    });
    return DBClusterParameterGroupNameMessage.fromJson(response_);
  }

  /// Adds an attribute and values to, or removes an attribute and values from,
  /// a manual DB cluster snapshot.
  ///
  /// To share a manual DB cluster snapshot with other AWS accounts, specify
  /// `restore` as the `AttributeName` and use the `ValuesToAdd` parameter to
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
  /// To view which AWS accounts have access to copy or restore a manual DB
  /// cluster snapshot, or whether a manual DB cluster snapshot public or
  /// private, use the DescribeDBClusterSnapshotAttributes API action.
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
  /// snapshot, set this list to include one or more AWS account IDs, or `all`
  /// to make the manual DB cluster snapshot restorable by any AWS account. Do
  /// not add the `all` value for any manual DB cluster snapshots that contain
  /// private information that you don't want available to all AWS accounts.
  ///
  /// [valuesToRemove]: A list of DB cluster snapshot attributes to remove from
  /// the attribute specified by `AttributeName`.
  ///
  /// To remove authorization for other AWS accounts to copy or restore a manual
  /// DB cluster snapshot, set this list to include one or more AWS account
  /// identifiers, or `all` to remove authorization for any AWS account to copy
  /// or restore the DB cluster snapshot. If you specify `all`, an AWS account
  /// whose account ID is explicitly added to the `restore` attribute can still
  /// copy or restore a manual DB cluster snapshot.
  Future<ModifyDBClusterSnapshotAttributeResult>
      modifyDBClusterSnapshotAttribute(
          {@required String dbClusterSnapshotIdentifier,
          @required String attributeName,
          List<String> valuesToAdd,
          List<String> valuesToRemove}) async {
    var response_ = await _client.send('ModifyDBClusterSnapshotAttribute', {
      'DBClusterSnapshotIdentifier': dbClusterSnapshotIdentifier,
      'AttributeName': attributeName,
      if (valuesToAdd != null) 'ValuesToAdd': valuesToAdd,
      if (valuesToRemove != null) 'ValuesToRemove': valuesToRemove,
    });
    return ModifyDBClusterSnapshotAttributeResult.fromJson(response_);
  }

  /// Modifies settings for a DB instance. You can change one or more database
  /// configuration parameters by specifying these parameters and the new values
  /// in the request. To learn what modifications you can make to your DB
  /// instance, call DescribeValidDBInstanceModifications before you call
  /// ModifyDBInstance.
  ///
  /// [dbInstanceIdentifier]: The DB instance identifier. This value is stored
  /// as a lowercase string.
  ///
  /// Constraints:
  ///
  /// *   Must match the identifier of an existing DBInstance.
  ///
  /// [allocatedStorage]: The new amount of storage (in gibibytes) to allocate
  /// for the DB instance.
  ///
  /// Not applicable. Storage is managed by the DB Cluster.
  ///
  /// [dbInstanceClass]: The new compute and memory capacity of the DB instance,
  /// for example, `db.m4.large`. Not all DB instance classes are available in
  /// all AWS Regions.
  ///
  /// If you modify the DB instance class, an outage occurs during the change.
  /// The change is applied during the next maintenance window, unless
  /// `ApplyImmediately` is specified as `true` for this request.
  ///
  /// Default: Uses existing setting
  ///
  /// [dbSubnetGroupName]: The new DB subnet group for the DB instance. You can
  /// use this parameter to move your DB instance to a different VPC.
  ///
  /// Changing the subnet group causes an outage during the change. The change
  /// is applied during the next maintenance window, unless you specify `true`
  /// for the `ApplyImmediately` parameter.
  ///
  /// Constraints: If supplied, must match the name of an existing
  /// DBSubnetGroup.
  ///
  /// Example: `mySubnetGroup`
  ///
  /// [dbSecurityGroups]: A list of DB security groups to authorize on this DB
  /// instance. Changing this setting doesn't result in an outage and the change
  /// is asynchronously applied as soon as possible.
  ///
  /// Constraints:
  ///
  /// *   If supplied, must match existing DBSecurityGroups.
  ///
  /// [vpcSecurityGroupIds]: A list of EC2 VPC security groups to authorize on
  /// this DB instance. This change is asynchronously applied as soon as
  /// possible.
  ///
  /// Not applicable. The associated list of EC2 VPC security groups is managed
  /// by the DB cluster. For more information, see ModifyDBCluster.
  ///
  /// Constraints:
  ///
  /// *   If supplied, must match existing VpcSecurityGroupIds.
  ///
  /// [applyImmediately]: Specifies whether the modifications in this request
  /// and any pending modifications are asynchronously applied as soon as
  /// possible, regardless of the `PreferredMaintenanceWindow` setting for the
  /// DB instance.
  ///
  ///  If this parameter is set to `false`, changes to the DB instance are
  /// applied during the next maintenance window. Some parameter changes can
  /// cause an outage and are applied on the next call to RebootDBInstance, or
  /// the next failure reboot.
  ///
  /// Default: `false`
  ///
  /// [masterUserPassword]: Not applicable.
  ///
  /// [dbParameterGroupName]: The name of the DB parameter group to apply to the
  /// DB instance. Changing this setting doesn't result in an outage. The
  /// parameter group name itself is changed immediately, but the actual
  /// parameter changes are not applied until you reboot the instance without
  /// failover. The db instance will NOT be rebooted automatically and the
  /// parameter changes will NOT be applied during the next maintenance window.
  ///
  /// Default: Uses existing setting
  ///
  /// Constraints: The DB parameter group must be in the same DB parameter group
  /// family as this DB instance.
  ///
  /// [backupRetentionPeriod]: Not applicable. The retention period for
  /// automated backups is managed by the DB cluster. For more information, see
  /// ModifyDBCluster.
  ///
  /// Default: Uses existing setting
  ///
  /// [preferredBackupWindow]:  The daily time range during which automated
  /// backups are created if automated backups are enabled.
  ///
  /// Not applicable. The daily time range for creating automated backups is
  /// managed by the DB cluster. For more information, see ModifyDBCluster.
  ///
  /// Constraints:
  ///
  /// *   Must be in the format hh24:mi-hh24:mi
  ///
  /// *   Must be in Universal Time Coordinated (UTC)
  ///
  /// *   Must not conflict with the preferred maintenance window
  ///
  /// *   Must be at least 30 minutes
  ///
  /// [preferredMaintenanceWindow]: The weekly time range (in UTC) during which
  /// system maintenance can occur, which might result in an outage. Changing
  /// this parameter doesn't result in an outage, except in the following
  /// situation, and the change is asynchronously applied as soon as possible.
  /// If there are pending actions that cause a reboot, and the maintenance
  /// window is changed to include the current time, then changing this
  /// parameter will cause a reboot of the DB instance. If moving this window to
  /// the current time, there must be at least 30 minutes between the current
  /// time and end of the window to ensure pending changes are applied.
  ///
  /// Default: Uses existing setting
  ///
  /// Format: ddd:hh24:mi-ddd:hh24:mi
  ///
  /// Valid Days: Mon | Tue | Wed | Thu | Fri | Sat | Sun
  ///
  /// Constraints: Must be at least 30 minutes
  ///
  /// [multiAZ]: Specifies if the DB instance is a Multi-AZ deployment. Changing
  /// this parameter doesn't result in an outage and the change is applied
  /// during the next maintenance window unless the `ApplyImmediately` parameter
  /// is set to `true` for this request.
  ///
  /// [engineVersion]:  The version number of the database engine to upgrade to.
  /// Changing this parameter results in an outage and the change is applied
  /// during the next maintenance window unless the `ApplyImmediately` parameter
  /// is set to `true` for this request.
  ///
  /// For major version upgrades, if a nondefault DB parameter group is
  /// currently in use, a new DB parameter group in the DB parameter group
  /// family for the new engine version must be specified. The new DB parameter
  /// group can be the default for that DB parameter group family.
  ///
  /// [allowMajorVersionUpgrade]: Indicates that major version upgrades are
  /// allowed. Changing this parameter doesn't result in an outage and the
  /// change is asynchronously applied as soon as possible.
  ///
  /// Constraints: This parameter must be set to true when specifying a value
  /// for the EngineVersion parameter that is a different major version than the
  /// DB instance's current version.
  ///
  /// [autoMinorVersionUpgrade]:  Indicates that minor version upgrades are
  /// applied automatically to the DB instance during the maintenance window.
  /// Changing this parameter doesn't result in an outage except in the
  /// following case and the change is asynchronously applied as soon as
  /// possible. An outage will result if this parameter is set to `true` during
  /// the maintenance window, and a newer minor version is available, and
  /// Neptune has enabled auto patching for that engine version.
  ///
  /// [licenseModel]: Not supported.
  ///
  /// [iops]: The new Provisioned IOPS (I/O operations per second) value for the
  /// instance.
  ///
  /// Changing this setting doesn't result in an outage and the change is
  /// applied during the next maintenance window unless the `ApplyImmediately`
  /// parameter is set to `true` for this request.
  ///
  /// Default: Uses existing setting
  ///
  /// [optionGroupName]:  Indicates that the DB instance should be associated
  /// with the specified option group. Changing this parameter doesn't result in
  /// an outage except in the following case and the change is applied during
  /// the next maintenance window unless the `ApplyImmediately` parameter is set
  /// to `true` for this request. If the parameter change results in an option
  /// group that enables OEM, this change can cause a brief (sub-second) period
  /// during which new connections are rejected but existing connections are not
  /// interrupted.
  ///
  /// Permanent options, such as the TDE option for Oracle Advanced Security
  /// TDE, can't be removed from an option group, and that option group can't be
  /// removed from a DB instance once it is associated with a DB instance
  ///
  /// [newDBInstanceIdentifier]:  The new DB instance identifier for the DB
  /// instance when renaming a DB instance. When you change the DB instance
  /// identifier, an instance reboot will occur immediately if you set `Apply
  /// Immediately` to true, or will occur during the next maintenance window if
  /// `Apply Immediately` to false. This value is stored as a lowercase string.
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
  /// [storageType]: Not supported.
  ///
  /// [tdeCredentialArn]: The ARN from the key store with which to associate the
  /// instance for TDE encryption.
  ///
  /// [tdeCredentialPassword]: The password for the given ARN from the key store
  /// in order to access the device.
  ///
  /// [caCertificateIdentifier]: Indicates the certificate that needs to be
  /// associated with the instance.
  ///
  /// [domain]: Not supported.
  ///
  /// [copyTagsToSnapshot]: True to copy all tags from the DB instance to
  /// snapshots of the DB instance, and otherwise false. The default is false.
  ///
  /// [monitoringInterval]: The interval, in seconds, between points when
  /// Enhanced Monitoring metrics are collected for the DB instance. To disable
  /// collecting Enhanced Monitoring metrics, specify 0. The default is 0.
  ///
  /// If `MonitoringRoleArn` is specified, then you must also set
  /// `MonitoringInterval` to a value other than 0.
  ///
  /// Valid Values: `0, 1, 5, 10, 15, 30, 60`
  ///
  /// [dbPortNumber]: The port number on which the database accepts connections.
  ///
  /// The value of the `DBPortNumber` parameter must not match any of the port
  /// values specified for options in the option group for the DB instance.
  ///
  /// Your database will restart when you change the `DBPortNumber` value
  /// regardless of the value of the `ApplyImmediately` parameter.
  ///
  ///  Default: `8182`
  ///
  /// [publiclyAccessible]: This flag should no longer be used.
  ///
  /// [monitoringRoleArn]: The ARN for the IAM role that permits Neptune to send
  /// enhanced monitoring metrics to Amazon CloudWatch Logs. For example,
  /// `arn:aws:iam:123456789012:role/emaccess`.
  ///
  /// If `MonitoringInterval` is set to a value other than 0, then you must
  /// supply a `MonitoringRoleArn` value.
  ///
  /// [domainIamRoleName]: Not supported
  ///
  /// [promotionTier]: A value that specifies the order in which a Read Replica
  /// is promoted to the primary instance after a failure of the existing
  /// primary instance.
  ///
  /// Default: 1
  ///
  /// Valid Values: 0 - 15
  ///
  /// [enableIamDatabaseAuthentication]: True to enable mapping of AWS Identity
  /// and Access Management (IAM) accounts to database accounts, and otherwise
  /// false.
  ///
  /// You can enable IAM database authentication for the following database
  /// engines
  ///
  /// Not applicable. Mapping AWS IAM accounts to database accounts is managed
  /// by the DB cluster. For more information, see ModifyDBCluster.
  ///
  /// Default: `false`
  ///
  /// [enablePerformanceInsights]: Not supported.
  ///
  /// [performanceInsightsKmsKeyId]: Not supported.
  ///
  /// [cloudwatchLogsExportConfiguration]: The configuration setting for the log
  /// types to be enabled for export to CloudWatch Logs for a specific DB
  /// instance or DB cluster.
  Future<ModifyDBInstanceResult> modifyDBInstance(String dbInstanceIdentifier,
      {int allocatedStorage,
      String dbInstanceClass,
      String dbSubnetGroupName,
      List<String> dbSecurityGroups,
      List<String> vpcSecurityGroupIds,
      bool applyImmediately,
      String masterUserPassword,
      String dbParameterGroupName,
      int backupRetentionPeriod,
      String preferredBackupWindow,
      String preferredMaintenanceWindow,
      bool multiAZ,
      String engineVersion,
      bool allowMajorVersionUpgrade,
      bool autoMinorVersionUpgrade,
      String licenseModel,
      int iops,
      String optionGroupName,
      String newDBInstanceIdentifier,
      String storageType,
      String tdeCredentialArn,
      String tdeCredentialPassword,
      String caCertificateIdentifier,
      String domain,
      bool copyTagsToSnapshot,
      int monitoringInterval,
      int dbPortNumber,
      bool publiclyAccessible,
      String monitoringRoleArn,
      String domainIamRoleName,
      int promotionTier,
      bool enableIamDatabaseAuthentication,
      bool enablePerformanceInsights,
      String performanceInsightsKmsKeyId,
      CloudwatchLogsExportConfiguration
          cloudwatchLogsExportConfiguration}) async {
    var response_ = await _client.send('ModifyDBInstance', {
      'DBInstanceIdentifier': dbInstanceIdentifier,
      if (allocatedStorage != null) 'AllocatedStorage': allocatedStorage,
      if (dbInstanceClass != null) 'DBInstanceClass': dbInstanceClass,
      if (dbSubnetGroupName != null) 'DBSubnetGroupName': dbSubnetGroupName,
      if (dbSecurityGroups != null) 'DBSecurityGroups': dbSecurityGroups,
      if (vpcSecurityGroupIds != null)
        'VpcSecurityGroupIds': vpcSecurityGroupIds,
      if (applyImmediately != null) 'ApplyImmediately': applyImmediately,
      if (masterUserPassword != null) 'MasterUserPassword': masterUserPassword,
      if (dbParameterGroupName != null)
        'DBParameterGroupName': dbParameterGroupName,
      if (backupRetentionPeriod != null)
        'BackupRetentionPeriod': backupRetentionPeriod,
      if (preferredBackupWindow != null)
        'PreferredBackupWindow': preferredBackupWindow,
      if (preferredMaintenanceWindow != null)
        'PreferredMaintenanceWindow': preferredMaintenanceWindow,
      if (multiAZ != null) 'MultiAZ': multiAZ,
      if (engineVersion != null) 'EngineVersion': engineVersion,
      if (allowMajorVersionUpgrade != null)
        'AllowMajorVersionUpgrade': allowMajorVersionUpgrade,
      if (autoMinorVersionUpgrade != null)
        'AutoMinorVersionUpgrade': autoMinorVersionUpgrade,
      if (licenseModel != null) 'LicenseModel': licenseModel,
      if (iops != null) 'Iops': iops,
      if (optionGroupName != null) 'OptionGroupName': optionGroupName,
      if (newDBInstanceIdentifier != null)
        'NewDBInstanceIdentifier': newDBInstanceIdentifier,
      if (storageType != null) 'StorageType': storageType,
      if (tdeCredentialArn != null) 'TdeCredentialArn': tdeCredentialArn,
      if (tdeCredentialPassword != null)
        'TdeCredentialPassword': tdeCredentialPassword,
      if (caCertificateIdentifier != null)
        'CACertificateIdentifier': caCertificateIdentifier,
      if (domain != null) 'Domain': domain,
      if (copyTagsToSnapshot != null) 'CopyTagsToSnapshot': copyTagsToSnapshot,
      if (monitoringInterval != null) 'MonitoringInterval': monitoringInterval,
      if (dbPortNumber != null) 'DBPortNumber': dbPortNumber,
      if (publiclyAccessible != null) 'PubliclyAccessible': publiclyAccessible,
      if (monitoringRoleArn != null) 'MonitoringRoleArn': monitoringRoleArn,
      if (domainIamRoleName != null) 'DomainIAMRoleName': domainIamRoleName,
      if (promotionTier != null) 'PromotionTier': promotionTier,
      if (enableIamDatabaseAuthentication != null)
        'EnableIAMDatabaseAuthentication': enableIamDatabaseAuthentication,
      if (enablePerformanceInsights != null)
        'EnablePerformanceInsights': enablePerformanceInsights,
      if (performanceInsightsKmsKeyId != null)
        'PerformanceInsightsKMSKeyId': performanceInsightsKmsKeyId,
      if (cloudwatchLogsExportConfiguration != null)
        'CloudwatchLogsExportConfiguration': cloudwatchLogsExportConfiguration,
    });
    return ModifyDBInstanceResult.fromJson(response_);
  }

  /// Modifies the parameters of a DB parameter group. To modify more than one
  /// parameter, submit a list of the following: `ParameterName`,
  /// `ParameterValue`, and `ApplyMethod`. A maximum of 20 parameters can be
  /// modified in a single request.
  ///
  ///  Changes to dynamic parameters are applied immediately. Changes to static
  /// parameters require a reboot without failover to the DB instance associated
  /// with the parameter group before the change can take effect.
  ///
  /// After you modify a DB parameter group, you should wait at least 5 minutes
  /// before creating your first DB instance that uses that DB parameter group
  /// as the default parameter group. This allows Amazon Neptune to fully
  /// complete the modify action before the parameter group is used as the
  /// default for a new DB instance. This is especially important for parameters
  /// that are critical when creating the default database for a DB instance,
  /// such as the character set for the default database defined by the
  /// `character_set_database` parameter. You can use the _Parameter Groups_
  /// option of the Amazon Neptune console or the _DescribeDBParameters_ command
  /// to verify that your DB parameter group has been created or modified.
  ///
  /// [dbParameterGroupName]: The name of the DB parameter group.
  ///
  /// Constraints:
  ///
  /// *   If supplied, must match the name of an existing DBParameterGroup.
  ///
  /// [parameters]: An array of parameter names, values, and the apply method
  /// for the parameter update. At least one parameter name, value, and apply
  /// method must be supplied; subsequent arguments are optional. A maximum of
  /// 20 parameters can be modified in a single request.
  ///
  /// Valid Values (for the application method): `immediate | pending-reboot`
  ///
  ///
  ///
  /// You can use the immediate value with dynamic parameters only. You can use
  /// the pending-reboot value for both dynamic and static parameters, and
  /// changes are applied when you reboot the DB instance without failover.
  Future<DBParameterGroupNameMessage> modifyDBParameterGroup(
      {@required String dbParameterGroupName,
      @required List<Parameter> parameters}) async {
    var response_ = await _client.send('ModifyDBParameterGroup', {
      'DBParameterGroupName': dbParameterGroupName,
      'Parameters': parameters,
    });
    return DBParameterGroupNameMessage.fromJson(response_);
  }

  /// Modifies an existing DB subnet group. DB subnet groups must contain at
  /// least one subnet in at least two AZs in the AWS Region.
  ///
  /// [dbSubnetGroupName]: The name for the DB subnet group. This value is
  /// stored as a lowercase string. You can't modify the default subnet group.
  ///
  /// Constraints: Must match the name of an existing DBSubnetGroup. Must not be
  /// default.
  ///
  /// Example: `mySubnetgroup`
  ///
  /// [dbSubnetGroupDescription]: The description for the DB subnet group.
  ///
  /// [subnetIds]: The EC2 subnet IDs for the DB subnet group.
  Future<ModifyDBSubnetGroupResult> modifyDBSubnetGroup(
      {@required String dbSubnetGroupName,
      String dbSubnetGroupDescription,
      @required List<String> subnetIds}) async {
    var response_ = await _client.send('ModifyDBSubnetGroup', {
      'DBSubnetGroupName': dbSubnetGroupName,
      if (dbSubnetGroupDescription != null)
        'DBSubnetGroupDescription': dbSubnetGroupDescription,
      'SubnetIds': subnetIds,
    });
    return ModifyDBSubnetGroupResult.fromJson(response_);
  }

  /// Modifies an existing event notification subscription. Note that you can't
  /// modify the source identifiers using this call; to change source
  /// identifiers for a subscription, use the AddSourceIdentifierToSubscription
  /// and RemoveSourceIdentifierFromSubscription calls.
  ///
  /// You can see a list of the event categories for a given SourceType by using
  /// the **DescribeEventCategories** action.
  ///
  /// [subscriptionName]: The name of the event notification subscription.
  ///
  /// [snsTopicArn]: The Amazon Resource Name (ARN) of the SNS topic created for
  /// event notification. The ARN is created by Amazon SNS when you create a
  /// topic and subscribe to it.
  ///
  /// [sourceType]: The type of source that is generating the events. For
  /// example, if you want to be notified of events generated by a DB instance,
  /// you would set this parameter to db-instance. if this value is not
  /// specified, all events are returned.
  ///
  /// Valid values: db-instance | db-parameter-group | db-security-group |
  /// db-snapshot
  ///
  /// [eventCategories]:  A list of event categories for a SourceType that you
  /// want to subscribe to. You can see a list of the categories for a given
  /// SourceType by using the **DescribeEventCategories** action.
  ///
  /// [enabled]:  A Boolean value; set to **true** to activate the subscription.
  Future<ModifyEventSubscriptionResult> modifyEventSubscription(
      String subscriptionName,
      {String snsTopicArn,
      String sourceType,
      List<String> eventCategories,
      bool enabled}) async {
    var response_ = await _client.send('ModifyEventSubscription', {
      'SubscriptionName': subscriptionName,
      if (snsTopicArn != null) 'SnsTopicArn': snsTopicArn,
      if (sourceType != null) 'SourceType': sourceType,
      if (eventCategories != null) 'EventCategories': eventCategories,
      if (enabled != null) 'Enabled': enabled,
    });
    return ModifyEventSubscriptionResult.fromJson(response_);
  }

  /// Not supported.
  ///
  /// [dbClusterIdentifier]: Not supported.
  Future<PromoteReadReplicaDBClusterResult> promoteReadReplicaDBCluster(
      String dbClusterIdentifier) async {
    var response_ = await _client.send('PromoteReadReplicaDBCluster', {
      'DBClusterIdentifier': dbClusterIdentifier,
    });
    return PromoteReadReplicaDBClusterResult.fromJson(response_);
  }

  /// You might need to reboot your DB instance, usually for maintenance
  /// reasons. For example, if you make certain modifications, or if you change
  /// the DB parameter group associated with the DB instance, you must reboot
  /// the instance for the changes to take effect.
  ///
  /// Rebooting a DB instance restarts the database engine service. Rebooting a
  /// DB instance results in a momentary outage, during which the DB instance
  /// status is set to rebooting.
  ///
  /// [dbInstanceIdentifier]: The DB instance identifier. This parameter is
  /// stored as a lowercase string.
  ///
  /// Constraints:
  ///
  /// *   Must match the identifier of an existing DBInstance.
  ///
  /// [forceFailover]:  When `true`, the reboot is conducted through a MultiAZ
  /// failover.
  ///
  /// Constraint: You can't specify `true` if the instance is not configured for
  /// MultiAZ.
  Future<RebootDBInstanceResult> rebootDBInstance(String dbInstanceIdentifier,
      {bool forceFailover}) async {
    var response_ = await _client.send('RebootDBInstance', {
      'DBInstanceIdentifier': dbInstanceIdentifier,
      if (forceFailover != null) 'ForceFailover': forceFailover,
    });
    return RebootDBInstanceResult.fromJson(response_);
  }

  /// Disassociates an Identity and Access Management (IAM) role from a DB
  /// cluster.
  ///
  /// [dbClusterIdentifier]: The name of the DB cluster to disassociate the IAM
  /// role from.
  ///
  /// [roleArn]: The Amazon Resource Name (ARN) of the IAM role to disassociate
  /// from the DB cluster, for example
  /// `arn:aws:iam::123456789012:role/NeptuneAccessRole`.
  Future<void> removeRoleFromDBCluster(
      {@required String dbClusterIdentifier, @required String roleArn}) async {
    await _client.send('RemoveRoleFromDBCluster', {
      'DBClusterIdentifier': dbClusterIdentifier,
      'RoleArn': roleArn,
    });
  }

  /// Removes a source identifier from an existing event notification
  /// subscription.
  ///
  /// [subscriptionName]: The name of the event notification subscription you
  /// want to remove a source identifier from.
  ///
  /// [sourceIdentifier]:  The source identifier to be removed from the
  /// subscription, such as the **DB instance identifier** for a DB instance or
  /// the name of a security group.
  Future<RemoveSourceIdentifierFromSubscriptionResult>
      removeSourceIdentifierFromSubscription(
          {@required String subscriptionName,
          @required String sourceIdentifier}) async {
    var response_ =
        await _client.send('RemoveSourceIdentifierFromSubscription', {
      'SubscriptionName': subscriptionName,
      'SourceIdentifier': sourceIdentifier,
    });
    return RemoveSourceIdentifierFromSubscriptionResult.fromJson(response_);
  }

  /// Removes metadata tags from an Amazon Neptune resource.
  ///
  /// [resourceName]: The Amazon Neptune resource that the tags are removed
  /// from. This value is an Amazon Resource Name (ARN). For information about
  /// creating an ARN, see
  /// [Constructing an Amazon Resource Name (ARN)](https://docs.aws.amazon.com/neptune/latest/UserGuide/tagging.ARN.html#tagging.ARN.Constructing).
  ///
  /// [tagKeys]: The tag key (name) of the tag to be removed.
  Future<void> removeTagsFromResource(
      {@required String resourceName, @required List<String> tagKeys}) async {
    await _client.send('RemoveTagsFromResource', {
      'ResourceName': resourceName,
      'TagKeys': tagKeys,
    });
  }

  ///  Modifies the parameters of a DB cluster parameter group to the default
  /// value. To reset specific parameters submit a list of the following:
  /// `ParameterName` and `ApplyMethod`. To reset the entire DB cluster
  /// parameter group, specify the `DBClusterParameterGroupName` and
  /// `ResetAllParameters` parameters.
  ///
  ///  When resetting the entire group, dynamic parameters are updated
  /// immediately and static parameters are set to `pending-reboot` to take
  /// effect on the next DB instance restart or RebootDBInstance request. You
  /// must call RebootDBInstance for every DB instance in your DB cluster that
  /// you want the updated static parameter to apply to.
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
    var response_ = await _client.send('ResetDBClusterParameterGroup', {
      'DBClusterParameterGroupName': dbClusterParameterGroupName,
      if (resetAllParameters != null) 'ResetAllParameters': resetAllParameters,
      if (parameters != null) 'Parameters': parameters,
    });
    return DBClusterParameterGroupNameMessage.fromJson(response_);
  }

  /// Modifies the parameters of a DB parameter group to the engine/system
  /// default value. To reset specific parameters, provide a list of the
  /// following: `ParameterName` and `ApplyMethod`. To reset the entire DB
  /// parameter group, specify the `DBParameterGroup` name and
  /// `ResetAllParameters` parameters. When resetting the entire group, dynamic
  /// parameters are updated immediately and static parameters are set to
  /// `pending-reboot` to take effect on the next DB instance restart or
  /// `RebootDBInstance` request.
  ///
  /// [dbParameterGroupName]: The name of the DB parameter group.
  ///
  /// Constraints:
  ///
  /// *   Must match the name of an existing DBParameterGroup.
  ///
  /// [resetAllParameters]: Specifies whether (`true`) or not (`false`) to reset
  /// all parameters in the DB parameter group to default values.
  ///
  /// Default: `true`
  ///
  /// [parameters]: To reset the entire DB parameter group, specify the
  /// `DBParameterGroup` name and `ResetAllParameters` parameters. To reset
  /// specific parameters, provide a list of the following: `ParameterName` and
  /// `ApplyMethod`. A maximum of 20 parameters can be modified in a single
  /// request.
  ///
  /// Valid Values (for Apply method): `pending-reboot`
  Future<DBParameterGroupNameMessage> resetDBParameterGroup(
      String dbParameterGroupName,
      {bool resetAllParameters,
      List<Parameter> parameters}) async {
    var response_ = await _client.send('ResetDBParameterGroup', {
      'DBParameterGroupName': dbParameterGroupName,
      if (resetAllParameters != null) 'ResetAllParameters': resetAllParameters,
      if (parameters != null) 'Parameters': parameters,
    });
    return DBParameterGroupNameMessage.fromJson(response_);
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
  /// [availabilityZones]: Provides the list of EC2 Availability Zones that
  /// instances in the restored DB cluster can be created in.
  ///
  /// [dbClusterIdentifier]: The name of the DB cluster to create from the DB
  /// snapshot or DB cluster snapshot. This parameter isn't case-sensitive.
  ///
  /// Constraints:
  ///
  /// *   Must contain from 1 to 63 letters, numbers, or hyphens
  ///
  /// *   First character must be a letter
  ///
  /// *   Cannot end with a hyphen or contain two consecutive hyphens
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
  /// *   Must match the identifier of an existing Snapshot.
  ///
  /// [engine]: The database engine to use for the new DB cluster.
  ///
  /// Default: The same as source
  ///
  /// Constraint: Must be compatible with the engine of the source
  ///
  /// [engineVersion]: The version of the database engine to use for the new DB
  /// cluster.
  ///
  /// [port]: The port number on which the new DB cluster accepts connections.
  ///
  /// Constraints: Value must be `1150-65535`
  ///
  /// Default: The same port as the original DB cluster.
  ///
  /// [dbSubnetGroupName]: The name of the DB subnet group to use for the new DB
  /// cluster.
  ///
  /// Constraints: If supplied, must match the name of an existing
  /// DBSubnetGroup.
  ///
  /// Example: `mySubnetgroup`
  ///
  /// [databaseName]: Not supported.
  ///
  /// [optionGroupName]: The name of the option group to use for the restored DB
  /// cluster.
  ///
  /// [vpcSecurityGroupIds]: A list of VPC security groups that the new DB
  /// cluster will belong to.
  ///
  /// [tags]: The tags to be assigned to the restored DB cluster.
  ///
  /// [kmsKeyId]: The AWS KMS key identifier to use when restoring an encrypted
  /// DB cluster from a DB snapshot or DB cluster snapshot.
  ///
  /// The KMS key identifier is the Amazon Resource Name (ARN) for the KMS
  /// encryption key. If you are restoring a DB cluster with the same AWS
  /// account that owns the KMS encryption key used to encrypt the new DB
  /// cluster, then you can use the KMS key alias instead of the ARN for the KMS
  /// encryption key.
  ///
  /// If you do not specify a value for the `KmsKeyId` parameter, then the
  /// following will occur:
  ///
  /// *   If the DB snapshot or DB cluster snapshot in `SnapshotIdentifier` is
  /// encrypted, then the restored DB cluster is encrypted using the KMS key
  /// that was used to encrypt the DB snapshot or DB cluster snapshot.
  ///
  /// *   If the DB snapshot or DB cluster snapshot in `SnapshotIdentifier` is
  /// not encrypted, then the restored DB cluster is not encrypted.
  ///
  /// [enableIamDatabaseAuthentication]: True to enable mapping of AWS Identity
  /// and Access Management (IAM) accounts to database accounts, and otherwise
  /// false.
  ///
  /// Default: `false`
  ///
  /// [enableCloudwatchLogsExports]: The list of logs that the restored DB
  /// cluster is to export to Amazon CloudWatch Logs.
  ///
  /// [dbClusterParameterGroupName]: The name of the DB cluster parameter group
  /// to associate with the new DB cluster.
  ///
  /// Constraints:
  ///
  /// *   If supplied, must match the name of an existing
  /// DBClusterParameterGroup.
  Future<RestoreDBClusterFromSnapshotResult> restoreDBClusterFromSnapshot(
      {List<String> availabilityZones,
      @required String dbClusterIdentifier,
      @required String snapshotIdentifier,
      @required String engine,
      String engineVersion,
      int port,
      String dbSubnetGroupName,
      String databaseName,
      String optionGroupName,
      List<String> vpcSecurityGroupIds,
      List<Tag> tags,
      String kmsKeyId,
      bool enableIamDatabaseAuthentication,
      List<String> enableCloudwatchLogsExports,
      String dbClusterParameterGroupName}) async {
    var response_ = await _client.send('RestoreDBClusterFromSnapshot', {
      if (availabilityZones != null) 'AvailabilityZones': availabilityZones,
      'DBClusterIdentifier': dbClusterIdentifier,
      'SnapshotIdentifier': snapshotIdentifier,
      'Engine': engine,
      if (engineVersion != null) 'EngineVersion': engineVersion,
      if (port != null) 'Port': port,
      if (dbSubnetGroupName != null) 'DBSubnetGroupName': dbSubnetGroupName,
      if (databaseName != null) 'DatabaseName': databaseName,
      if (optionGroupName != null) 'OptionGroupName': optionGroupName,
      if (vpcSecurityGroupIds != null)
        'VpcSecurityGroupIds': vpcSecurityGroupIds,
      if (tags != null) 'Tags': tags,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (enableIamDatabaseAuthentication != null)
        'EnableIAMDatabaseAuthentication': enableIamDatabaseAuthentication,
      if (enableCloudwatchLogsExports != null)
        'EnableCloudwatchLogsExports': enableCloudwatchLogsExports,
      if (dbClusterParameterGroupName != null)
        'DBClusterParameterGroupName': dbClusterParameterGroupName,
    });
    return RestoreDBClusterFromSnapshotResult.fromJson(response_);
  }

  /// Restores a DB cluster to an arbitrary point in time. Users can restore to
  /// any point in time before `LatestRestorableTime` for up to
  /// `BackupRetentionPeriod` days. The target DB cluster is created from the
  /// source DB cluster with the same configuration as the original DB cluster,
  /// except that the new DB cluster is created with the default DB security
  /// group.
  ///
  ///
  ///
  /// This action only restores the DB cluster, not the DB instances for that DB
  /// cluster. You must invoke the CreateDBInstance action to create DB
  /// instances for the restored DB cluster, specifying the identifier of the
  /// restored DB cluster in `DBClusterIdentifier`. You can create DB instances
  /// only after the `RestoreDBClusterToPointInTime` action has completed and
  /// the DB cluster is available.
  ///
  /// [dbClusterIdentifier]: The name of the new DB cluster to be created.
  ///
  /// Constraints:
  ///
  /// *   Must contain from 1 to 63 letters, numbers, or hyphens
  ///
  /// *   First character must be a letter
  ///
  /// *   Cannot end with a hyphen or contain two consecutive hyphens
  ///
  /// [restoreType]: The type of restore to be performed. You can specify one of
  /// the following values:
  ///
  /// *    `full-copy` - The new DB cluster is restored as a full copy of the
  /// source DB cluster.
  ///
  /// *    `copy-on-write` - The new DB cluster is restored as a clone of the
  /// source DB cluster.
  ///
  ///
  /// If you don't specify a `RestoreType` value, then the new DB cluster is
  /// restored as a full copy of the source DB cluster.
  ///
  /// [sourceDBClusterIdentifier]: The identifier of the source DB cluster from
  /// which to restore.
  ///
  /// Constraints:
  ///
  /// *   Must match the identifier of an existing DBCluster.
  ///
  /// [restoreToTime]: The date and time to restore the DB cluster to.
  ///
  /// Valid Values: Value must be a time in Universal Coordinated Time (UTC)
  /// format
  ///
  /// Constraints:
  ///
  /// *   Must be before the latest restorable time for the DB instance
  ///
  /// *   Must be specified if `UseLatestRestorableTime` parameter is not
  /// provided
  ///
  /// *   Cannot be specified if `UseLatestRestorableTime` parameter is true
  ///
  /// *   Cannot be specified if `RestoreType` parameter is `copy-on-write`
  ///
  ///
  /// Example: `2015-03-07T23:45:00Z`
  ///
  /// [useLatestRestorableTime]: A value that is set to `true` to restore the DB
  /// cluster to the latest restorable backup time, and `false` otherwise.
  ///
  /// Default: `false`
  ///
  /// Constraints: Cannot be specified if `RestoreToTime` parameter is provided.
  ///
  /// [port]: The port number on which the new DB cluster accepts connections.
  ///
  /// Constraints: Value must be `1150-65535`
  ///
  /// Default: The same port as the original DB cluster.
  ///
  /// [dbSubnetGroupName]: The DB subnet group name to use for the new DB
  /// cluster.
  ///
  /// Constraints: If supplied, must match the name of an existing
  /// DBSubnetGroup.
  ///
  /// Example: `mySubnetgroup`
  ///
  /// [optionGroupName]: The name of the option group for the new DB cluster.
  ///
  /// [vpcSecurityGroupIds]: A list of VPC security groups that the new DB
  /// cluster belongs to.
  ///
  /// [tags]: The tags to be applied to the restored DB cluster.
  ///
  /// [kmsKeyId]: The AWS KMS key identifier to use when restoring an encrypted
  /// DB cluster from an encrypted DB cluster.
  ///
  /// The KMS key identifier is the Amazon Resource Name (ARN) for the KMS
  /// encryption key. If you are restoring a DB cluster with the same AWS
  /// account that owns the KMS encryption key used to encrypt the new DB
  /// cluster, then you can use the KMS key alias instead of the ARN for the KMS
  /// encryption key.
  ///
  /// You can restore to a new DB cluster and encrypt the new DB cluster with a
  /// KMS key that is different than the KMS key used to encrypt the source DB
  /// cluster. The new DB cluster is encrypted with the KMS key identified by
  /// the `KmsKeyId` parameter.
  ///
  /// If you do not specify a value for the `KmsKeyId` parameter, then the
  /// following will occur:
  ///
  /// *   If the DB cluster is encrypted, then the restored DB cluster is
  /// encrypted using the KMS key that was used to encrypt the source DB
  /// cluster.
  ///
  /// *   If the DB cluster is not encrypted, then the restored DB cluster is
  /// not encrypted.
  ///
  ///
  /// If `DBClusterIdentifier` refers to a DB cluster that is not encrypted,
  /// then the restore request is rejected.
  ///
  /// [enableIamDatabaseAuthentication]: True to enable mapping of AWS Identity
  /// and Access Management (IAM) accounts to database accounts, and otherwise
  /// false.
  ///
  /// Default: `false`
  ///
  /// [enableCloudwatchLogsExports]: The list of logs that the restored DB
  /// cluster is to export to CloudWatch Logs.
  ///
  /// [dbClusterParameterGroupName]: The name of the DB cluster parameter group
  /// to associate with the new DB cluster.
  ///
  /// Constraints:
  ///
  /// *   If supplied, must match the name of an existing
  /// DBClusterParameterGroup.
  Future<RestoreDBClusterToPointInTimeResult> restoreDBClusterToPointInTime(
      {@required String dbClusterIdentifier,
      String restoreType,
      @required String sourceDBClusterIdentifier,
      DateTime restoreToTime,
      bool useLatestRestorableTime,
      int port,
      String dbSubnetGroupName,
      String optionGroupName,
      List<String> vpcSecurityGroupIds,
      List<Tag> tags,
      String kmsKeyId,
      bool enableIamDatabaseAuthentication,
      List<String> enableCloudwatchLogsExports,
      String dbClusterParameterGroupName}) async {
    var response_ = await _client.send('RestoreDBClusterToPointInTime', {
      'DBClusterIdentifier': dbClusterIdentifier,
      if (restoreType != null) 'RestoreType': restoreType,
      'SourceDBClusterIdentifier': sourceDBClusterIdentifier,
      if (restoreToTime != null) 'RestoreToTime': restoreToTime,
      if (useLatestRestorableTime != null)
        'UseLatestRestorableTime': useLatestRestorableTime,
      if (port != null) 'Port': port,
      if (dbSubnetGroupName != null) 'DBSubnetGroupName': dbSubnetGroupName,
      if (optionGroupName != null) 'OptionGroupName': optionGroupName,
      if (vpcSecurityGroupIds != null)
        'VpcSecurityGroupIds': vpcSecurityGroupIds,
      if (tags != null) 'Tags': tags,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (enableIamDatabaseAuthentication != null)
        'EnableIAMDatabaseAuthentication': enableIamDatabaseAuthentication,
      if (enableCloudwatchLogsExports != null)
        'EnableCloudwatchLogsExports': enableCloudwatchLogsExports,
      if (dbClusterParameterGroupName != null)
        'DBClusterParameterGroupName': dbClusterParameterGroupName,
    });
    return RestoreDBClusterToPointInTimeResult.fromJson(response_);
  }
}

class AddSourceIdentifierToSubscriptionResult {
  final EventSubscription eventSubscription;

  AddSourceIdentifierToSubscriptionResult({
    this.eventSubscription,
  });
  static AddSourceIdentifierToSubscriptionResult fromJson(
          Map<String, dynamic> json) =>
      AddSourceIdentifierToSubscriptionResult(
        eventSubscription: json.containsKey('EventSubscription')
            ? EventSubscription.fromJson(json['EventSubscription'])
            : null,
      );
}

class ApplyPendingMaintenanceActionResult {
  final ResourcePendingMaintenanceActions resourcePendingMaintenanceActions;

  ApplyPendingMaintenanceActionResult({
    this.resourcePendingMaintenanceActions,
  });
  static ApplyPendingMaintenanceActionResult fromJson(
          Map<String, dynamic> json) =>
      ApplyPendingMaintenanceActionResult(
        resourcePendingMaintenanceActions:
            json.containsKey('ResourcePendingMaintenanceActions')
                ? ResourcePendingMaintenanceActions.fromJson(
                    json['ResourcePendingMaintenanceActions'])
                : null,
      );
}

/// Specifies an Availability Zone.
class AvailabilityZone {
  /// The name of the availability zone.
  final String name;

  AvailabilityZone({
    this.name,
  });
  static AvailabilityZone fromJson(Map<String, dynamic> json) =>
      AvailabilityZone(
        name: json.containsKey('Name') ? json['Name'] as String : null,
      );
}

/// Specifies a character set.
class CharacterSet {
  /// The name of the character set.
  final String characterSetName;

  /// The description of the character set.
  final String characterSetDescription;

  CharacterSet({
    this.characterSetName,
    this.characterSetDescription,
  });
  static CharacterSet fromJson(Map<String, dynamic> json) => CharacterSet(
        characterSetName: json.containsKey('CharacterSetName')
            ? json['CharacterSetName'] as String
            : null,
        characterSetDescription: json.containsKey('CharacterSetDescription')
            ? json['CharacterSetDescription'] as String
            : null,
      );
}

/// The configuration setting for the log types to be enabled for export to
/// CloudWatch Logs for a specific DB instance or DB cluster.
///
/// The `EnableLogTypes` and `DisableLogTypes` arrays determine which logs will
/// be exported (or not exported) to CloudWatch Logs.
class CloudwatchLogsExportConfiguration {
  /// The list of log types to enable.
  final List<String> enableLogTypes;

  /// The list of log types to disable.
  final List<String> disableLogTypes;

  CloudwatchLogsExportConfiguration({
    this.enableLogTypes,
    this.disableLogTypes,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class CopyDBClusterParameterGroupResult {
  final DBClusterParameterGroup dbClusterParameterGroup;

  CopyDBClusterParameterGroupResult({
    this.dbClusterParameterGroup,
  });
  static CopyDBClusterParameterGroupResult fromJson(
          Map<String, dynamic> json) =>
      CopyDBClusterParameterGroupResult(
        dbClusterParameterGroup: json.containsKey('DBClusterParameterGroup')
            ? DBClusterParameterGroup.fromJson(json['DBClusterParameterGroup'])
            : null,
      );
}

class CopyDBClusterSnapshotResult {
  final DBClusterSnapshot dbClusterSnapshot;

  CopyDBClusterSnapshotResult({
    this.dbClusterSnapshot,
  });
  static CopyDBClusterSnapshotResult fromJson(Map<String, dynamic> json) =>
      CopyDBClusterSnapshotResult(
        dbClusterSnapshot: json.containsKey('DBClusterSnapshot')
            ? DBClusterSnapshot.fromJson(json['DBClusterSnapshot'])
            : null,
      );
}

class CopyDBParameterGroupResult {
  final DBParameterGroup dbParameterGroup;

  CopyDBParameterGroupResult({
    this.dbParameterGroup,
  });
  static CopyDBParameterGroupResult fromJson(Map<String, dynamic> json) =>
      CopyDBParameterGroupResult(
        dbParameterGroup: json.containsKey('DBParameterGroup')
            ? DBParameterGroup.fromJson(json['DBParameterGroup'])
            : null,
      );
}

class CreateDBClusterParameterGroupResult {
  final DBClusterParameterGroup dbClusterParameterGroup;

  CreateDBClusterParameterGroupResult({
    this.dbClusterParameterGroup,
  });
  static CreateDBClusterParameterGroupResult fromJson(
          Map<String, dynamic> json) =>
      CreateDBClusterParameterGroupResult(
        dbClusterParameterGroup: json.containsKey('DBClusterParameterGroup')
            ? DBClusterParameterGroup.fromJson(json['DBClusterParameterGroup'])
            : null,
      );
}

class CreateDBClusterResult {
  final DBCluster dbCluster;

  CreateDBClusterResult({
    this.dbCluster,
  });
  static CreateDBClusterResult fromJson(Map<String, dynamic> json) =>
      CreateDBClusterResult(
        dbCluster: json.containsKey('DBCluster')
            ? DBCluster.fromJson(json['DBCluster'])
            : null,
      );
}

class CreateDBClusterSnapshotResult {
  final DBClusterSnapshot dbClusterSnapshot;

  CreateDBClusterSnapshotResult({
    this.dbClusterSnapshot,
  });
  static CreateDBClusterSnapshotResult fromJson(Map<String, dynamic> json) =>
      CreateDBClusterSnapshotResult(
        dbClusterSnapshot: json.containsKey('DBClusterSnapshot')
            ? DBClusterSnapshot.fromJson(json['DBClusterSnapshot'])
            : null,
      );
}

class CreateDBInstanceResult {
  final DBInstance dbInstance;

  CreateDBInstanceResult({
    this.dbInstance,
  });
  static CreateDBInstanceResult fromJson(Map<String, dynamic> json) =>
      CreateDBInstanceResult(
        dbInstance: json.containsKey('DBInstance')
            ? DBInstance.fromJson(json['DBInstance'])
            : null,
      );
}

class CreateDBParameterGroupResult {
  final DBParameterGroup dbParameterGroup;

  CreateDBParameterGroupResult({
    this.dbParameterGroup,
  });
  static CreateDBParameterGroupResult fromJson(Map<String, dynamic> json) =>
      CreateDBParameterGroupResult(
        dbParameterGroup: json.containsKey('DBParameterGroup')
            ? DBParameterGroup.fromJson(json['DBParameterGroup'])
            : null,
      );
}

class CreateDBSubnetGroupResult {
  final DBSubnetGroup dbSubnetGroup;

  CreateDBSubnetGroupResult({
    this.dbSubnetGroup,
  });
  static CreateDBSubnetGroupResult fromJson(Map<String, dynamic> json) =>
      CreateDBSubnetGroupResult(
        dbSubnetGroup: json.containsKey('DBSubnetGroup')
            ? DBSubnetGroup.fromJson(json['DBSubnetGroup'])
            : null,
      );
}

class CreateEventSubscriptionResult {
  final EventSubscription eventSubscription;

  CreateEventSubscriptionResult({
    this.eventSubscription,
  });
  static CreateEventSubscriptionResult fromJson(Map<String, dynamic> json) =>
      CreateEventSubscriptionResult(
        eventSubscription: json.containsKey('EventSubscription')
            ? EventSubscription.fromJson(json['EventSubscription'])
            : null,
      );
}

/// Contains the details of an Amazon Neptune DB cluster.
///
/// This data type is used as a response element in the DescribeDBClusters
/// action.
class DBCluster {
  ///  `AllocatedStorage` always returns 1, because Neptune DB cluster storage
  /// size is not fixed, but instead automatically adjusts as needed.
  final int allocatedStorage;

  /// Provides the list of EC2 Availability Zones that instances in the DB
  /// cluster can be created in.
  final List<String> availabilityZones;

  /// Specifies the number of days for which automatic DB snapshots are
  /// retained.
  final int backupRetentionPeriod;

  /// If present, specifies the name of the character set that this cluster is
  /// associated with.
  final String characterSetName;

  /// Contains the name of the initial database of this DB cluster that was
  /// provided at create time, if one was specified when the DB cluster was
  /// created. This same name is returned for the life of the DB cluster.
  final String databaseName;

  /// Contains a user-supplied DB cluster identifier. This identifier is the
  /// unique key that identifies a DB cluster.
  final String dbClusterIdentifier;

  /// Specifies the name of the DB cluster parameter group for the DB cluster.
  final String dbClusterParameterGroup;

  /// Specifies information on the subnet group associated with the DB cluster,
  /// including the name, description, and subnets in the subnet group.
  final String dbSubnetGroup;

  /// Specifies the current state of this DB cluster.
  final String status;

  /// Specifies the progress of the operation as a percentage.
  final String percentProgress;

  /// Specifies the earliest time to which a database can be restored with
  /// point-in-time restore.
  final DateTime earliestRestorableTime;

  /// Specifies the connection endpoint for the primary instance of the DB
  /// cluster.
  final String endpoint;

  /// The reader endpoint for the DB cluster. The reader endpoint for a DB
  /// cluster load-balances connections across the Read Replicas that are
  /// available in a DB cluster. As clients request new connections to the
  /// reader endpoint, Neptune distributes the connection requests among the
  /// Read Replicas in the DB cluster. This functionality can help balance your
  /// read workload across multiple Read Replicas in your DB cluster.
  ///
  /// If a failover occurs, and the Read Replica that you are connected to is
  /// promoted to be the primary instance, your connection is dropped. To
  /// continue sending your read workload to other Read Replicas in the cluster,
  /// you can then reconnect to the reader endpoint.
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

  /// Contains the master username for the DB cluster.
  final String masterUsername;

  /// Provides the list of option group memberships for this DB cluster.
  final List<DBClusterOptionGroupStatus> dbClusterOptionGroupMemberships;

  /// Specifies the daily time range during which automated backups are created
  /// if automated backups are enabled, as determined by the
  /// `BackupRetentionPeriod`.
  final String preferredBackupWindow;

  /// Specifies the weekly time range during which system maintenance can occur,
  /// in Universal Coordinated Time (UTC).
  final String preferredMaintenanceWindow;

  /// Not supported by Neptune.
  final String replicationSourceIdentifier;

  /// Contains one or more identifiers of the Read Replicas associated with this
  /// DB cluster.
  final List<String> readReplicaIdentifiers;

  /// Provides the list of instances that make up the DB cluster.
  final List<DBClusterMember> dbClusterMembers;

  /// Provides a list of VPC security groups that the DB cluster belongs to.
  final List<VpcSecurityGroupMembership> vpcSecurityGroups;

  /// Specifies the ID that Amazon Route 53 assigns when you create a hosted
  /// zone.
  final String hostedZoneId;

  /// Specifies whether the DB cluster is encrypted.
  final bool storageEncrypted;

  /// If `StorageEncrypted` is true, the AWS KMS key identifier for the
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

  /// True if mapping of AWS Identity and Access Management (IAM) accounts to
  /// database accounts is enabled, and otherwise false.
  final bool iamDatabaseAuthenticationEnabled;

  /// Identifies the clone group to which the DB cluster is associated.
  final String cloneGroupId;

  /// Specifies the time when the DB cluster was created, in Universal
  /// Coordinated Time (UTC).
  final DateTime clusterCreateTime;

  /// A list of log types that this DB cluster is configured to export to
  /// CloudWatch Logs.
  final List<String> enabledCloudwatchLogsExports;

  DBCluster({
    this.allocatedStorage,
    this.availabilityZones,
    this.backupRetentionPeriod,
    this.characterSetName,
    this.databaseName,
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
    this.dbClusterOptionGroupMemberships,
    this.preferredBackupWindow,
    this.preferredMaintenanceWindow,
    this.replicationSourceIdentifier,
    this.readReplicaIdentifiers,
    this.dbClusterMembers,
    this.vpcSecurityGroups,
    this.hostedZoneId,
    this.storageEncrypted,
    this.kmsKeyId,
    this.dbClusterResourceId,
    this.dbClusterArn,
    this.associatedRoles,
    this.iamDatabaseAuthenticationEnabled,
    this.cloneGroupId,
    this.clusterCreateTime,
    this.enabledCloudwatchLogsExports,
  });
  static DBCluster fromJson(Map<String, dynamic> json) => DBCluster(
        allocatedStorage: json.containsKey('AllocatedStorage')
            ? json['AllocatedStorage'] as int
            : null,
        availabilityZones: json.containsKey('AvailabilityZones')
            ? (json['AvailabilityZones'] as List)
                .map((e) => e as String)
                .toList()
            : null,
        backupRetentionPeriod: json.containsKey('BackupRetentionPeriod')
            ? json['BackupRetentionPeriod'] as int
            : null,
        characterSetName: json.containsKey('CharacterSetName')
            ? json['CharacterSetName'] as String
            : null,
        databaseName: json.containsKey('DatabaseName')
            ? json['DatabaseName'] as String
            : null,
        dbClusterIdentifier: json.containsKey('DBClusterIdentifier')
            ? json['DBClusterIdentifier'] as String
            : null,
        dbClusterParameterGroup: json.containsKey('DBClusterParameterGroup')
            ? json['DBClusterParameterGroup'] as String
            : null,
        dbSubnetGroup: json.containsKey('DBSubnetGroup')
            ? json['DBSubnetGroup'] as String
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        percentProgress: json.containsKey('PercentProgress')
            ? json['PercentProgress'] as String
            : null,
        earliestRestorableTime: json.containsKey('EarliestRestorableTime')
            ? DateTime.parse(json['EarliestRestorableTime'])
            : null,
        endpoint:
            json.containsKey('Endpoint') ? json['Endpoint'] as String : null,
        readerEndpoint: json.containsKey('ReaderEndpoint')
            ? json['ReaderEndpoint'] as String
            : null,
        multiAZ: json.containsKey('MultiAZ') ? json['MultiAZ'] as bool : null,
        engine: json.containsKey('Engine') ? json['Engine'] as String : null,
        engineVersion: json.containsKey('EngineVersion')
            ? json['EngineVersion'] as String
            : null,
        latestRestorableTime: json.containsKey('LatestRestorableTime')
            ? DateTime.parse(json['LatestRestorableTime'])
            : null,
        port: json.containsKey('Port') ? json['Port'] as int : null,
        masterUsername: json.containsKey('MasterUsername')
            ? json['MasterUsername'] as String
            : null,
        dbClusterOptionGroupMemberships:
            json.containsKey('DBClusterOptionGroupMemberships')
                ? (json['DBClusterOptionGroupMemberships'] as List)
                    .map((e) => DBClusterOptionGroupStatus.fromJson(e))
                    .toList()
                : null,
        preferredBackupWindow: json.containsKey('PreferredBackupWindow')
            ? json['PreferredBackupWindow'] as String
            : null,
        preferredMaintenanceWindow:
            json.containsKey('PreferredMaintenanceWindow')
                ? json['PreferredMaintenanceWindow'] as String
                : null,
        replicationSourceIdentifier:
            json.containsKey('ReplicationSourceIdentifier')
                ? json['ReplicationSourceIdentifier'] as String
                : null,
        readReplicaIdentifiers: json.containsKey('ReadReplicaIdentifiers')
            ? (json['ReadReplicaIdentifiers'] as List)
                .map((e) => e as String)
                .toList()
            : null,
        dbClusterMembers: json.containsKey('DBClusterMembers')
            ? (json['DBClusterMembers'] as List)
                .map((e) => DBClusterMember.fromJson(e))
                .toList()
            : null,
        vpcSecurityGroups: json.containsKey('VpcSecurityGroups')
            ? (json['VpcSecurityGroups'] as List)
                .map((e) => VpcSecurityGroupMembership.fromJson(e))
                .toList()
            : null,
        hostedZoneId: json.containsKey('HostedZoneId')
            ? json['HostedZoneId'] as String
            : null,
        storageEncrypted: json.containsKey('StorageEncrypted')
            ? json['StorageEncrypted'] as bool
            : null,
        kmsKeyId:
            json.containsKey('KmsKeyId') ? json['KmsKeyId'] as String : null,
        dbClusterResourceId: json.containsKey('DbClusterResourceId')
            ? json['DbClusterResourceId'] as String
            : null,
        dbClusterArn: json.containsKey('DBClusterArn')
            ? json['DBClusterArn'] as String
            : null,
        associatedRoles: json.containsKey('AssociatedRoles')
            ? (json['AssociatedRoles'] as List)
                .map((e) => DBClusterRole.fromJson(e))
                .toList()
            : null,
        iamDatabaseAuthenticationEnabled:
            json.containsKey('IAMDatabaseAuthenticationEnabled')
                ? json['IAMDatabaseAuthenticationEnabled'] as bool
                : null,
        cloneGroupId: json.containsKey('CloneGroupId')
            ? json['CloneGroupId'] as String
            : null,
        clusterCreateTime: json.containsKey('ClusterCreateTime')
            ? DateTime.parse(json['ClusterCreateTime'])
            : null,
        enabledCloudwatchLogsExports:
            json.containsKey('EnabledCloudwatchLogsExports')
                ? (json['EnabledCloudwatchLogsExports'] as List)
                    .map((e) => e as String)
                    .toList()
                : null,
      );
}

/// Contains information about an instance that is part of a DB cluster.
class DBClusterMember {
  /// Specifies the instance identifier for this member of the DB cluster.
  final String dbInstanceIdentifier;

  /// Value that is `true` if the cluster member is the primary instance for the
  /// DB cluster and `false` otherwise.
  final bool isClusterWriter;

  /// Specifies the status of the DB cluster parameter group for this member of
  /// the DB cluster.
  final String dbClusterParameterGroupStatus;

  /// A value that specifies the order in which a Read Replica is promoted to
  /// the primary instance after a failure of the existing primary instance.
  final int promotionTier;

  DBClusterMember({
    this.dbInstanceIdentifier,
    this.isClusterWriter,
    this.dbClusterParameterGroupStatus,
    this.promotionTier,
  });
  static DBClusterMember fromJson(Map<String, dynamic> json) => DBClusterMember(
        dbInstanceIdentifier: json.containsKey('DBInstanceIdentifier')
            ? json['DBInstanceIdentifier'] as String
            : null,
        isClusterWriter: json.containsKey('IsClusterWriter')
            ? json['IsClusterWriter'] as bool
            : null,
        dbClusterParameterGroupStatus:
            json.containsKey('DBClusterParameterGroupStatus')
                ? json['DBClusterParameterGroupStatus'] as String
                : null,
        promotionTier: json.containsKey('PromotionTier')
            ? json['PromotionTier'] as int
            : null,
      );
}

class DBClusterMessage {
  /// A pagination token that can be used in a subsequent DescribeDBClusters
  /// request.
  final String marker;

  /// Contains a list of DB clusters for the user.
  final List<DBCluster> dbClusters;

  DBClusterMessage({
    this.marker,
    this.dbClusters,
  });
  static DBClusterMessage fromJson(Map<String, dynamic> json) =>
      DBClusterMessage(
        marker: json.containsKey('Marker') ? json['Marker'] as String : null,
        dbClusters: json.containsKey('DBClusters')
            ? (json['DBClusters'] as List)
                .map((e) => DBCluster.fromJson(e))
                .toList()
            : null,
      );
}

/// Contains status information for a DB cluster option group.
class DBClusterOptionGroupStatus {
  /// Specifies the name of the DB cluster option group.
  final String dbClusterOptionGroupName;

  /// Specifies the status of the DB cluster option group.
  final String status;

  DBClusterOptionGroupStatus({
    this.dbClusterOptionGroupName,
    this.status,
  });
  static DBClusterOptionGroupStatus fromJson(Map<String, dynamic> json) =>
      DBClusterOptionGroupStatus(
        dbClusterOptionGroupName: json.containsKey('DBClusterOptionGroupName')
            ? json['DBClusterOptionGroupName'] as String
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
      );
}

/// Contains the details of an Amazon Neptune DB cluster parameter group.
///
/// This data type is used as a response element in the
/// DescribeDBClusterParameterGroups action.
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
      DBClusterParameterGroup(
        dbClusterParameterGroupName:
            json.containsKey('DBClusterParameterGroupName')
                ? json['DBClusterParameterGroupName'] as String
                : null,
        dbParameterGroupFamily: json.containsKey('DBParameterGroupFamily')
            ? json['DBParameterGroupFamily'] as String
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        dbClusterParameterGroupArn:
            json.containsKey('DBClusterParameterGroupArn')
                ? json['DBClusterParameterGroupArn'] as String
                : null,
      );
}

class DBClusterParameterGroupDetails {
  /// Provides a list of parameters for the DB cluster parameter group.
  final List<Parameter> parameters;

  ///  An optional pagination token provided by a previous
  /// DescribeDBClusterParameters request. If this parameter is specified, the
  /// response includes only records beyond the marker, up to the value
  /// specified by `MaxRecords` .
  final String marker;

  DBClusterParameterGroupDetails({
    this.parameters,
    this.marker,
  });
  static DBClusterParameterGroupDetails fromJson(Map<String, dynamic> json) =>
      DBClusterParameterGroupDetails(
        parameters: json.containsKey('Parameters')
            ? (json['Parameters'] as List)
                .map((e) => Parameter.fromJson(e))
                .toList()
            : null,
        marker: json.containsKey('Marker') ? json['Marker'] as String : null,
      );
}

class DBClusterParameterGroupNameMessage {
  /// The name of the DB cluster parameter group.
  ///
  /// Constraints:
  ///
  /// *   Must be 1 to 255 letters or numbers.
  ///
  /// *   First character must be a letter
  ///
  /// *   Cannot end with a hyphen or contain two consecutive hyphens
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
      DBClusterParameterGroupNameMessage(
        dbClusterParameterGroupName:
            json.containsKey('DBClusterParameterGroupName')
                ? json['DBClusterParameterGroupName'] as String
                : null,
      );
}

class DBClusterParameterGroupsMessage {
  ///  An optional pagination token provided by a previous
  /// `DescribeDBClusterParameterGroups` request. If this parameter is
  /// specified, the response includes only records beyond the marker, up to the
  /// value specified by `MaxRecords`.
  final String marker;

  /// A list of DB cluster parameter groups.
  final List<DBClusterParameterGroup> dbClusterParameterGroups;

  DBClusterParameterGroupsMessage({
    this.marker,
    this.dbClusterParameterGroups,
  });
  static DBClusterParameterGroupsMessage fromJson(Map<String, dynamic> json) =>
      DBClusterParameterGroupsMessage(
        marker: json.containsKey('Marker') ? json['Marker'] as String : null,
        dbClusterParameterGroups: json.containsKey('DBClusterParameterGroups')
            ? (json['DBClusterParameterGroups'] as List)
                .map((e) => DBClusterParameterGroup.fromJson(e))
                .toList()
            : null,
      );
}

/// Describes an AWS Identity and Access Management (IAM) role that is
/// associated with a DB cluster.
class DBClusterRole {
  /// The Amazon Resource Name (ARN) of the IAM role that is associated with the
  /// DB cluster.
  final String roleArn;

  /// Describes the state of association between the IAM role and the DB
  /// cluster. The Status property returns one of the following values:
  ///
  /// *    `ACTIVE` - the IAM role ARN is associated with the DB cluster and can
  /// be used to access other AWS services on your behalf.
  ///
  /// *    `PENDING` - the IAM role ARN is being associated with the DB cluster.
  ///
  /// *    `INVALID` - the IAM role ARN is associated with the DB cluster, but
  /// the DB cluster is unable to assume the IAM role in order to access other
  /// AWS services on your behalf.
  final String status;

  DBClusterRole({
    this.roleArn,
    this.status,
  });
  static DBClusterRole fromJson(Map<String, dynamic> json) => DBClusterRole(
        roleArn: json.containsKey('RoleArn') ? json['RoleArn'] as String : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
      );
}

/// Contains the details for an Amazon Neptune DB cluster snapshot
///
/// This data type is used as a response element in the
/// DescribeDBClusterSnapshots action.
class DBClusterSnapshot {
  /// Provides the list of EC2 Availability Zones that instances in the DB
  /// cluster snapshot can be restored in.
  final List<String> availabilityZones;

  /// Specifies the identifier for the DB cluster snapshot.
  final String dbClusterSnapshotIdentifier;

  /// Specifies the DB cluster identifier of the DB cluster that this DB cluster
  /// snapshot was created from.
  final String dbClusterIdentifier;

  /// Provides the time when the snapshot was taken, in Universal Coordinated
  /// Time (UTC).
  final DateTime snapshotCreateTime;

  /// Specifies the name of the database engine.
  final String engine;

  /// Specifies the allocated storage size in gibibytes (GiB).
  final int allocatedStorage;

  /// Specifies the status of this DB cluster snapshot.
  final String status;

  /// Specifies the port that the DB cluster was listening on at the time of the
  /// snapshot.
  final int port;

  /// Provides the VPC ID associated with the DB cluster snapshot.
  final String vpcId;

  /// Specifies the time when the DB cluster was created, in Universal
  /// Coordinated Time (UTC).
  final DateTime clusterCreateTime;

  /// Provides the master username for the DB cluster snapshot.
  final String masterUsername;

  /// Provides the version of the database engine for this DB cluster snapshot.
  final String engineVersion;

  /// Provides the license model information for this DB cluster snapshot.
  final String licenseModel;

  /// Provides the type of the DB cluster snapshot.
  final String snapshotType;

  /// Specifies the percentage of the estimated data that has been transferred.
  final int percentProgress;

  /// Specifies whether the DB cluster snapshot is encrypted.
  final bool storageEncrypted;

  /// If `StorageEncrypted` is true, the AWS KMS key identifier for the
  /// encrypted DB cluster snapshot.
  final String kmsKeyId;

  /// The Amazon Resource Name (ARN) for the DB cluster snapshot.
  final String dbClusterSnapshotArn;

  /// If the DB cluster snapshot was copied from a source DB cluster snapshot,
  /// the Amazon Resource Name (ARN) for the source DB cluster snapshot,
  /// otherwise, a null value.
  final String sourceDBClusterSnapshotArn;

  /// True if mapping of AWS Identity and Access Management (IAM) accounts to
  /// database accounts is enabled, and otherwise false.
  final bool iamDatabaseAuthenticationEnabled;

  DBClusterSnapshot({
    this.availabilityZones,
    this.dbClusterSnapshotIdentifier,
    this.dbClusterIdentifier,
    this.snapshotCreateTime,
    this.engine,
    this.allocatedStorage,
    this.status,
    this.port,
    this.vpcId,
    this.clusterCreateTime,
    this.masterUsername,
    this.engineVersion,
    this.licenseModel,
    this.snapshotType,
    this.percentProgress,
    this.storageEncrypted,
    this.kmsKeyId,
    this.dbClusterSnapshotArn,
    this.sourceDBClusterSnapshotArn,
    this.iamDatabaseAuthenticationEnabled,
  });
  static DBClusterSnapshot fromJson(Map<String, dynamic> json) =>
      DBClusterSnapshot(
        availabilityZones: json.containsKey('AvailabilityZones')
            ? (json['AvailabilityZones'] as List)
                .map((e) => e as String)
                .toList()
            : null,
        dbClusterSnapshotIdentifier:
            json.containsKey('DBClusterSnapshotIdentifier')
                ? json['DBClusterSnapshotIdentifier'] as String
                : null,
        dbClusterIdentifier: json.containsKey('DBClusterIdentifier')
            ? json['DBClusterIdentifier'] as String
            : null,
        snapshotCreateTime: json.containsKey('SnapshotCreateTime')
            ? DateTime.parse(json['SnapshotCreateTime'])
            : null,
        engine: json.containsKey('Engine') ? json['Engine'] as String : null,
        allocatedStorage: json.containsKey('AllocatedStorage')
            ? json['AllocatedStorage'] as int
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        port: json.containsKey('Port') ? json['Port'] as int : null,
        vpcId: json.containsKey('VpcId') ? json['VpcId'] as String : null,
        clusterCreateTime: json.containsKey('ClusterCreateTime')
            ? DateTime.parse(json['ClusterCreateTime'])
            : null,
        masterUsername: json.containsKey('MasterUsername')
            ? json['MasterUsername'] as String
            : null,
        engineVersion: json.containsKey('EngineVersion')
            ? json['EngineVersion'] as String
            : null,
        licenseModel: json.containsKey('LicenseModel')
            ? json['LicenseModel'] as String
            : null,
        snapshotType: json.containsKey('SnapshotType')
            ? json['SnapshotType'] as String
            : null,
        percentProgress: json.containsKey('PercentProgress')
            ? json['PercentProgress'] as int
            : null,
        storageEncrypted: json.containsKey('StorageEncrypted')
            ? json['StorageEncrypted'] as bool
            : null,
        kmsKeyId:
            json.containsKey('KmsKeyId') ? json['KmsKeyId'] as String : null,
        dbClusterSnapshotArn: json.containsKey('DBClusterSnapshotArn')
            ? json['DBClusterSnapshotArn'] as String
            : null,
        sourceDBClusterSnapshotArn:
            json.containsKey('SourceDBClusterSnapshotArn')
                ? json['SourceDBClusterSnapshotArn'] as String
                : null,
        iamDatabaseAuthenticationEnabled:
            json.containsKey('IAMDatabaseAuthenticationEnabled')
                ? json['IAMDatabaseAuthenticationEnabled'] as bool
                : null,
      );
}

/// Contains the name and values of a manual DB cluster snapshot attribute.
///
/// Manual DB cluster snapshot attributes are used to authorize other AWS
/// accounts to restore a manual DB cluster snapshot. For more information, see
/// the ModifyDBClusterSnapshotAttribute API action.
class DBClusterSnapshotAttribute {
  /// The name of the manual DB cluster snapshot attribute.
  ///
  /// The attribute named `restore` refers to the list of AWS accounts that have
  /// permission to copy or restore the manual DB cluster snapshot. For more
  /// information, see the ModifyDBClusterSnapshotAttribute API action.
  final String attributeName;

  /// The value(s) for the manual DB cluster snapshot attribute.
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
      DBClusterSnapshotAttribute(
        attributeName: json.containsKey('AttributeName')
            ? json['AttributeName'] as String
            : null,
        attributeValues: json.containsKey('AttributeValues')
            ? (json['AttributeValues'] as List).map((e) => e as String).toList()
            : null,
      );
}

/// Contains the results of a successful call to the
/// DescribeDBClusterSnapshotAttributes API action.
///
/// Manual DB cluster snapshot attributes are used to authorize other AWS
/// accounts to copy or restore a manual DB cluster snapshot. For more
/// information, see the ModifyDBClusterSnapshotAttribute API action.
class DBClusterSnapshotAttributesResult {
  /// The identifier of the manual DB cluster snapshot that the attributes apply
  /// to.
  final String dbClusterSnapshotIdentifier;

  /// The list of attributes and values for the manual DB cluster snapshot.
  final List<DBClusterSnapshotAttribute> dbClusterSnapshotAttributes;

  DBClusterSnapshotAttributesResult({
    this.dbClusterSnapshotIdentifier,
    this.dbClusterSnapshotAttributes,
  });
  static DBClusterSnapshotAttributesResult fromJson(
          Map<String, dynamic> json) =>
      DBClusterSnapshotAttributesResult(
        dbClusterSnapshotIdentifier:
            json.containsKey('DBClusterSnapshotIdentifier')
                ? json['DBClusterSnapshotIdentifier'] as String
                : null,
        dbClusterSnapshotAttributes:
            json.containsKey('DBClusterSnapshotAttributes')
                ? (json['DBClusterSnapshotAttributes'] as List)
                    .map((e) => DBClusterSnapshotAttribute.fromJson(e))
                    .toList()
                : null,
      );
}

class DBClusterSnapshotMessage {
  ///  An optional pagination token provided by a previous
  /// DescribeDBClusterSnapshots request. If this parameter is specified, the
  /// response includes only records beyond the marker, up to the value
  /// specified by `MaxRecords`.
  final String marker;

  /// Provides a list of DB cluster snapshots for the user.
  final List<DBClusterSnapshot> dbClusterSnapshots;

  DBClusterSnapshotMessage({
    this.marker,
    this.dbClusterSnapshots,
  });
  static DBClusterSnapshotMessage fromJson(Map<String, dynamic> json) =>
      DBClusterSnapshotMessage(
        marker: json.containsKey('Marker') ? json['Marker'] as String : null,
        dbClusterSnapshots: json.containsKey('DBClusterSnapshots')
            ? (json['DBClusterSnapshots'] as List)
                .map((e) => DBClusterSnapshot.fromJson(e))
                .toList()
            : null,
      );
}

///  This data type is used as a response element in the action
/// DescribeDBEngineVersions.
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

  ///  The default character set for new instances of this engine version, if
  /// the `CharacterSetName` parameter of the CreateDBInstance API is not
  /// specified.
  final CharacterSet defaultCharacterSet;

  ///  A list of the character sets supported by this engine for the
  /// `CharacterSetName` parameter of the `CreateDBInstance` action.
  final List<CharacterSet> supportedCharacterSets;

  /// A list of engine versions that this database engine version can be
  /// upgraded to.
  final List<UpgradeTarget> validUpgradeTarget;

  /// A list of the time zones supported by this engine for the `Timezone`
  /// parameter of the `CreateDBInstance` action.
  final List<Timezone> supportedTimezones;

  /// The types of logs that the database engine has available for export to
  /// CloudWatch Logs.
  final List<String> exportableLogTypes;

  /// A value that indicates whether the engine version supports exporting the
  /// log types specified by ExportableLogTypes to CloudWatch Logs.
  final bool supportsLogExportsToCloudwatchLogs;

  /// Indicates whether the database engine version supports read replicas.
  final bool supportsReadReplica;

  DBEngineVersion({
    this.engine,
    this.engineVersion,
    this.dbParameterGroupFamily,
    this.dbEngineDescription,
    this.dbEngineVersionDescription,
    this.defaultCharacterSet,
    this.supportedCharacterSets,
    this.validUpgradeTarget,
    this.supportedTimezones,
    this.exportableLogTypes,
    this.supportsLogExportsToCloudwatchLogs,
    this.supportsReadReplica,
  });
  static DBEngineVersion fromJson(Map<String, dynamic> json) => DBEngineVersion(
        engine: json.containsKey('Engine') ? json['Engine'] as String : null,
        engineVersion: json.containsKey('EngineVersion')
            ? json['EngineVersion'] as String
            : null,
        dbParameterGroupFamily: json.containsKey('DBParameterGroupFamily')
            ? json['DBParameterGroupFamily'] as String
            : null,
        dbEngineDescription: json.containsKey('DBEngineDescription')
            ? json['DBEngineDescription'] as String
            : null,
        dbEngineVersionDescription:
            json.containsKey('DBEngineVersionDescription')
                ? json['DBEngineVersionDescription'] as String
                : null,
        defaultCharacterSet: json.containsKey('DefaultCharacterSet')
            ? CharacterSet.fromJson(json['DefaultCharacterSet'])
            : null,
        supportedCharacterSets: json.containsKey('SupportedCharacterSets')
            ? (json['SupportedCharacterSets'] as List)
                .map((e) => CharacterSet.fromJson(e))
                .toList()
            : null,
        validUpgradeTarget: json.containsKey('ValidUpgradeTarget')
            ? (json['ValidUpgradeTarget'] as List)
                .map((e) => UpgradeTarget.fromJson(e))
                .toList()
            : null,
        supportedTimezones: json.containsKey('SupportedTimezones')
            ? (json['SupportedTimezones'] as List)
                .map((e) => Timezone.fromJson(e))
                .toList()
            : null,
        exportableLogTypes: json.containsKey('ExportableLogTypes')
            ? (json['ExportableLogTypes'] as List)
                .map((e) => e as String)
                .toList()
            : null,
        supportsLogExportsToCloudwatchLogs:
            json.containsKey('SupportsLogExportsToCloudwatchLogs')
                ? json['SupportsLogExportsToCloudwatchLogs'] as bool
                : null,
        supportsReadReplica: json.containsKey('SupportsReadReplica')
            ? json['SupportsReadReplica'] as bool
            : null,
      );
}

class DBEngineVersionMessage {
  ///  An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords`.
  final String marker;

  ///  A list of `DBEngineVersion` elements.
  final List<DBEngineVersion> dbEngineVersions;

  DBEngineVersionMessage({
    this.marker,
    this.dbEngineVersions,
  });
  static DBEngineVersionMessage fromJson(Map<String, dynamic> json) =>
      DBEngineVersionMessage(
        marker: json.containsKey('Marker') ? json['Marker'] as String : null,
        dbEngineVersions: json.containsKey('DBEngineVersions')
            ? (json['DBEngineVersions'] as List)
                .map((e) => DBEngineVersion.fromJson(e))
                .toList()
            : null,
      );
}

/// Contains the details of an Amazon Neptune DB instance.
///
/// This data type is used as a response element in the DescribeDBInstances
/// action.
class DBInstance {
  /// Contains a user-supplied database identifier. This identifier is the
  /// unique key that identifies a DB instance.
  final String dbInstanceIdentifier;

  /// Contains the name of the compute and memory capacity class of the DB
  /// instance.
  final String dbInstanceClass;

  /// Provides the name of the database engine to be used for this DB instance.
  final String engine;

  /// Specifies the current state of this database.
  final String dbInstanceStatus;

  /// Contains the master username for the DB instance.
  final String masterUsername;

  /// The database name.
  final String dbName;

  /// Specifies the connection endpoint.
  final Endpoint endpoint;

  /// Specifies the allocated storage size specified in gibibytes.
  final int allocatedStorage;

  /// Provides the date and time the DB instance was created.
  final DateTime instanceCreateTime;

  ///  Specifies the daily time range during which automated backups are created
  /// if automated backups are enabled, as determined by the
  /// `BackupRetentionPeriod`.
  final String preferredBackupWindow;

  /// Specifies the number of days for which automatic DB snapshots are
  /// retained.
  final int backupRetentionPeriod;

  ///  Provides List of DB security group elements containing only
  /// `DBSecurityGroup.Name` and `DBSecurityGroup.Status` subelements.
  final List<DBSecurityGroupMembership> dbSecurityGroups;

  /// Provides a list of VPC security group elements that the DB instance
  /// belongs to.
  final List<VpcSecurityGroupMembership> vpcSecurityGroups;

  /// Provides the list of DB parameter groups applied to this DB instance.
  final List<DBParameterGroupStatus> dbParameterGroups;

  /// Specifies the name of the Availability Zone the DB instance is located in.
  final String availabilityZone;

  /// Specifies information on the subnet group associated with the DB instance,
  /// including the name, description, and subnets in the subnet group.
  final DBSubnetGroup dbSubnetGroup;

  /// Specifies the weekly time range during which system maintenance can occur,
  /// in Universal Coordinated Time (UTC).
  final String preferredMaintenanceWindow;

  /// Specifies that changes to the DB instance are pending. This element is
  /// only included when changes are pending. Specific changes are identified by
  /// subelements.
  final PendingModifiedValues pendingModifiedValues;

  /// Specifies the latest time to which a database can be restored with
  /// point-in-time restore.
  final DateTime latestRestorableTime;

  /// Specifies if the DB instance is a Multi-AZ deployment.
  final bool multiAZ;

  /// Indicates the database engine version.
  final String engineVersion;

  /// Indicates that minor version patches are applied automatically.
  final bool autoMinorVersionUpgrade;

  /// Contains the identifier of the source DB instance if this DB instance is a
  /// Read Replica.
  final String readReplicaSourceDBInstanceIdentifier;

  /// Contains one or more identifiers of the Read Replicas associated with this
  /// DB instance.
  final List<String> readReplicaDBInstanceIdentifiers;

  /// Contains one or more identifiers of DB clusters that are Read Replicas of
  /// this DB instance.
  final List<String> readReplicaDBClusterIdentifiers;

  /// License model information for this DB instance.
  final String licenseModel;

  /// Specifies the Provisioned IOPS (I/O operations per second) value.
  final int iops;

  /// Provides the list of option group memberships for this DB instance.
  final List<OptionGroupMembership> optionGroupMemberships;

  /// If present, specifies the name of the character set that this instance is
  /// associated with.
  final String characterSetName;

  /// If present, specifies the name of the secondary Availability Zone for a DB
  /// instance with multi-AZ support.
  final String secondaryAvailabilityZone;

  /// This flag should no longer be used.
  final bool publiclyAccessible;

  /// The status of a Read Replica. If the instance is not a Read Replica, this
  /// is blank.
  final List<DBInstanceStatusInfo> statusInfos;

  /// Specifies the storage type associated with DB instance.
  final String storageType;

  /// The ARN from the key store with which the instance is associated for TDE
  /// encryption.
  final String tdeCredentialArn;

  /// Specifies the port that the DB instance listens on. If the DB instance is
  /// part of a DB cluster, this can be a different port than the DB cluster
  /// port.
  final int dbInstancePort;

  /// If the DB instance is a member of a DB cluster, contains the name of the
  /// DB cluster that the DB instance is a member of.
  final String dbClusterIdentifier;

  /// Not supported: The encryption for DB instances is managed by the DB
  /// cluster.
  final bool storageEncrypted;

  ///  Not supported: The encryption for DB instances is managed by the DB
  /// cluster.
  final String kmsKeyId;

  /// The AWS Region-unique, immutable identifier for the DB instance. This
  /// identifier is found in AWS CloudTrail log entries whenever the AWS KMS key
  /// for the DB instance is accessed.
  final String dbiResourceId;

  /// The identifier of the CA certificate for this DB instance.
  final String caCertificateIdentifier;

  /// Not supported
  final List<DomainMembership> domainMemberships;

  /// Specifies whether tags are copied from the DB instance to snapshots of the
  /// DB instance.
  final bool copyTagsToSnapshot;

  /// The interval, in seconds, between points when Enhanced Monitoring metrics
  /// are collected for the DB instance.
  final int monitoringInterval;

  /// The Amazon Resource Name (ARN) of the Amazon CloudWatch Logs log stream
  /// that receives the Enhanced Monitoring metrics data for the DB instance.
  final String enhancedMonitoringResourceArn;

  /// The ARN for the IAM role that permits Neptune to send Enhanced Monitoring
  /// metrics to Amazon CloudWatch Logs.
  final String monitoringRoleArn;

  /// A value that specifies the order in which a Read Replica is promoted to
  /// the primary instance after a failure of the existing primary instance.
  final int promotionTier;

  /// The Amazon Resource Name (ARN) for the DB instance.
  final String dbInstanceArn;

  /// Not supported.
  final String timezone;

  /// True if AWS Identity and Access Management (IAM) authentication is
  /// enabled, and otherwise false.
  final bool iamDatabaseAuthenticationEnabled;

  /// True if Performance Insights is enabled for the DB instance, and otherwise
  /// false.
  final bool performanceInsightsEnabled;

  /// The AWS KMS key identifier for encryption of Performance Insights data.
  /// The KMS key ID is the Amazon Resource Name (ARN), KMS key identifier, or
  /// the KMS key alias for the KMS encryption key.
  final String performanceInsightsKmsKeyId;

  /// A list of log types that this DB instance is configured to export to
  /// CloudWatch Logs.
  final List<String> enabledCloudwatchLogsExports;

  DBInstance({
    this.dbInstanceIdentifier,
    this.dbInstanceClass,
    this.engine,
    this.dbInstanceStatus,
    this.masterUsername,
    this.dbName,
    this.endpoint,
    this.allocatedStorage,
    this.instanceCreateTime,
    this.preferredBackupWindow,
    this.backupRetentionPeriod,
    this.dbSecurityGroups,
    this.vpcSecurityGroups,
    this.dbParameterGroups,
    this.availabilityZone,
    this.dbSubnetGroup,
    this.preferredMaintenanceWindow,
    this.pendingModifiedValues,
    this.latestRestorableTime,
    this.multiAZ,
    this.engineVersion,
    this.autoMinorVersionUpgrade,
    this.readReplicaSourceDBInstanceIdentifier,
    this.readReplicaDBInstanceIdentifiers,
    this.readReplicaDBClusterIdentifiers,
    this.licenseModel,
    this.iops,
    this.optionGroupMemberships,
    this.characterSetName,
    this.secondaryAvailabilityZone,
    this.publiclyAccessible,
    this.statusInfos,
    this.storageType,
    this.tdeCredentialArn,
    this.dbInstancePort,
    this.dbClusterIdentifier,
    this.storageEncrypted,
    this.kmsKeyId,
    this.dbiResourceId,
    this.caCertificateIdentifier,
    this.domainMemberships,
    this.copyTagsToSnapshot,
    this.monitoringInterval,
    this.enhancedMonitoringResourceArn,
    this.monitoringRoleArn,
    this.promotionTier,
    this.dbInstanceArn,
    this.timezone,
    this.iamDatabaseAuthenticationEnabled,
    this.performanceInsightsEnabled,
    this.performanceInsightsKmsKeyId,
    this.enabledCloudwatchLogsExports,
  });
  static DBInstance fromJson(Map<String, dynamic> json) => DBInstance(
        dbInstanceIdentifier: json.containsKey('DBInstanceIdentifier')
            ? json['DBInstanceIdentifier'] as String
            : null,
        dbInstanceClass: json.containsKey('DBInstanceClass')
            ? json['DBInstanceClass'] as String
            : null,
        engine: json.containsKey('Engine') ? json['Engine'] as String : null,
        dbInstanceStatus: json.containsKey('DBInstanceStatus')
            ? json['DBInstanceStatus'] as String
            : null,
        masterUsername: json.containsKey('MasterUsername')
            ? json['MasterUsername'] as String
            : null,
        dbName: json.containsKey('DBName') ? json['DBName'] as String : null,
        endpoint: json.containsKey('Endpoint')
            ? Endpoint.fromJson(json['Endpoint'])
            : null,
        allocatedStorage: json.containsKey('AllocatedStorage')
            ? json['AllocatedStorage'] as int
            : null,
        instanceCreateTime: json.containsKey('InstanceCreateTime')
            ? DateTime.parse(json['InstanceCreateTime'])
            : null,
        preferredBackupWindow: json.containsKey('PreferredBackupWindow')
            ? json['PreferredBackupWindow'] as String
            : null,
        backupRetentionPeriod: json.containsKey('BackupRetentionPeriod')
            ? json['BackupRetentionPeriod'] as int
            : null,
        dbSecurityGroups: json.containsKey('DBSecurityGroups')
            ? (json['DBSecurityGroups'] as List)
                .map((e) => DBSecurityGroupMembership.fromJson(e))
                .toList()
            : null,
        vpcSecurityGroups: json.containsKey('VpcSecurityGroups')
            ? (json['VpcSecurityGroups'] as List)
                .map((e) => VpcSecurityGroupMembership.fromJson(e))
                .toList()
            : null,
        dbParameterGroups: json.containsKey('DBParameterGroups')
            ? (json['DBParameterGroups'] as List)
                .map((e) => DBParameterGroupStatus.fromJson(e))
                .toList()
            : null,
        availabilityZone: json.containsKey('AvailabilityZone')
            ? json['AvailabilityZone'] as String
            : null,
        dbSubnetGroup: json.containsKey('DBSubnetGroup')
            ? DBSubnetGroup.fromJson(json['DBSubnetGroup'])
            : null,
        preferredMaintenanceWindow:
            json.containsKey('PreferredMaintenanceWindow')
                ? json['PreferredMaintenanceWindow'] as String
                : null,
        pendingModifiedValues: json.containsKey('PendingModifiedValues')
            ? PendingModifiedValues.fromJson(json['PendingModifiedValues'])
            : null,
        latestRestorableTime: json.containsKey('LatestRestorableTime')
            ? DateTime.parse(json['LatestRestorableTime'])
            : null,
        multiAZ: json.containsKey('MultiAZ') ? json['MultiAZ'] as bool : null,
        engineVersion: json.containsKey('EngineVersion')
            ? json['EngineVersion'] as String
            : null,
        autoMinorVersionUpgrade: json.containsKey('AutoMinorVersionUpgrade')
            ? json['AutoMinorVersionUpgrade'] as bool
            : null,
        readReplicaSourceDBInstanceIdentifier:
            json.containsKey('ReadReplicaSourceDBInstanceIdentifier')
                ? json['ReadReplicaSourceDBInstanceIdentifier'] as String
                : null,
        readReplicaDBInstanceIdentifiers:
            json.containsKey('ReadReplicaDBInstanceIdentifiers')
                ? (json['ReadReplicaDBInstanceIdentifiers'] as List)
                    .map((e) => e as String)
                    .toList()
                : null,
        readReplicaDBClusterIdentifiers:
            json.containsKey('ReadReplicaDBClusterIdentifiers')
                ? (json['ReadReplicaDBClusterIdentifiers'] as List)
                    .map((e) => e as String)
                    .toList()
                : null,
        licenseModel: json.containsKey('LicenseModel')
            ? json['LicenseModel'] as String
            : null,
        iops: json.containsKey('Iops') ? json['Iops'] as int : null,
        optionGroupMemberships: json.containsKey('OptionGroupMemberships')
            ? (json['OptionGroupMemberships'] as List)
                .map((e) => OptionGroupMembership.fromJson(e))
                .toList()
            : null,
        characterSetName: json.containsKey('CharacterSetName')
            ? json['CharacterSetName'] as String
            : null,
        secondaryAvailabilityZone: json.containsKey('SecondaryAvailabilityZone')
            ? json['SecondaryAvailabilityZone'] as String
            : null,
        publiclyAccessible: json.containsKey('PubliclyAccessible')
            ? json['PubliclyAccessible'] as bool
            : null,
        statusInfos: json.containsKey('StatusInfos')
            ? (json['StatusInfos'] as List)
                .map((e) => DBInstanceStatusInfo.fromJson(e))
                .toList()
            : null,
        storageType: json.containsKey('StorageType')
            ? json['StorageType'] as String
            : null,
        tdeCredentialArn: json.containsKey('TdeCredentialArn')
            ? json['TdeCredentialArn'] as String
            : null,
        dbInstancePort: json.containsKey('DbInstancePort')
            ? json['DbInstancePort'] as int
            : null,
        dbClusterIdentifier: json.containsKey('DBClusterIdentifier')
            ? json['DBClusterIdentifier'] as String
            : null,
        storageEncrypted: json.containsKey('StorageEncrypted')
            ? json['StorageEncrypted'] as bool
            : null,
        kmsKeyId:
            json.containsKey('KmsKeyId') ? json['KmsKeyId'] as String : null,
        dbiResourceId: json.containsKey('DbiResourceId')
            ? json['DbiResourceId'] as String
            : null,
        caCertificateIdentifier: json.containsKey('CACertificateIdentifier')
            ? json['CACertificateIdentifier'] as String
            : null,
        domainMemberships: json.containsKey('DomainMemberships')
            ? (json['DomainMemberships'] as List)
                .map((e) => DomainMembership.fromJson(e))
                .toList()
            : null,
        copyTagsToSnapshot: json.containsKey('CopyTagsToSnapshot')
            ? json['CopyTagsToSnapshot'] as bool
            : null,
        monitoringInterval: json.containsKey('MonitoringInterval')
            ? json['MonitoringInterval'] as int
            : null,
        enhancedMonitoringResourceArn:
            json.containsKey('EnhancedMonitoringResourceArn')
                ? json['EnhancedMonitoringResourceArn'] as String
                : null,
        monitoringRoleArn: json.containsKey('MonitoringRoleArn')
            ? json['MonitoringRoleArn'] as String
            : null,
        promotionTier: json.containsKey('PromotionTier')
            ? json['PromotionTier'] as int
            : null,
        dbInstanceArn: json.containsKey('DBInstanceArn')
            ? json['DBInstanceArn'] as String
            : null,
        timezone:
            json.containsKey('Timezone') ? json['Timezone'] as String : null,
        iamDatabaseAuthenticationEnabled:
            json.containsKey('IAMDatabaseAuthenticationEnabled')
                ? json['IAMDatabaseAuthenticationEnabled'] as bool
                : null,
        performanceInsightsEnabled:
            json.containsKey('PerformanceInsightsEnabled')
                ? json['PerformanceInsightsEnabled'] as bool
                : null,
        performanceInsightsKmsKeyId:
            json.containsKey('PerformanceInsightsKMSKeyId')
                ? json['PerformanceInsightsKMSKeyId'] as String
                : null,
        enabledCloudwatchLogsExports:
            json.containsKey('EnabledCloudwatchLogsExports')
                ? (json['EnabledCloudwatchLogsExports'] as List)
                    .map((e) => e as String)
                    .toList()
                : null,
      );
}

class DBInstanceMessage {
  ///  An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords` .
  final String marker;

  ///  A list of DBInstance instances.
  final List<DBInstance> dbInstances;

  DBInstanceMessage({
    this.marker,
    this.dbInstances,
  });
  static DBInstanceMessage fromJson(Map<String, dynamic> json) =>
      DBInstanceMessage(
        marker: json.containsKey('Marker') ? json['Marker'] as String : null,
        dbInstances: json.containsKey('DBInstances')
            ? (json['DBInstances'] as List)
                .map((e) => DBInstance.fromJson(e))
                .toList()
            : null,
      );
}

/// Provides a list of status information for a DB instance.
class DBInstanceStatusInfo {
  /// This value is currently "read replication."
  final String statusType;

  /// Boolean value that is true if the instance is operating normally, or false
  /// if the instance is in an error state.
  final bool normal;

  /// Status of the DB instance. For a StatusType of read replica, the values
  /// can be replicating, error, stopped, or terminated.
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
      DBInstanceStatusInfo(
        statusType: json.containsKey('StatusType')
            ? json['StatusType'] as String
            : null,
        normal: json.containsKey('Normal') ? json['Normal'] as bool : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        message: json.containsKey('Message') ? json['Message'] as String : null,
      );
}

/// Contains the details of an Amazon Neptune DB parameter group.
///
/// This data type is used as a response element in the
/// DescribeDBParameterGroups action.
class DBParameterGroup {
  /// Provides the name of the DB parameter group.
  final String dbParameterGroupName;

  /// Provides the name of the DB parameter group family that this DB parameter
  /// group is compatible with.
  final String dbParameterGroupFamily;

  /// Provides the customer-specified description for this DB parameter group.
  final String description;

  /// The Amazon Resource Name (ARN) for the DB parameter group.
  final String dbParameterGroupArn;

  DBParameterGroup({
    this.dbParameterGroupName,
    this.dbParameterGroupFamily,
    this.description,
    this.dbParameterGroupArn,
  });
  static DBParameterGroup fromJson(Map<String, dynamic> json) =>
      DBParameterGroup(
        dbParameterGroupName: json.containsKey('DBParameterGroupName')
            ? json['DBParameterGroupName'] as String
            : null,
        dbParameterGroupFamily: json.containsKey('DBParameterGroupFamily')
            ? json['DBParameterGroupFamily'] as String
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        dbParameterGroupArn: json.containsKey('DBParameterGroupArn')
            ? json['DBParameterGroupArn'] as String
            : null,
      );
}

class DBParameterGroupDetails {
  /// A list of Parameter values.
  final List<Parameter> parameters;

  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords`.
  final String marker;

  DBParameterGroupDetails({
    this.parameters,
    this.marker,
  });
  static DBParameterGroupDetails fromJson(Map<String, dynamic> json) =>
      DBParameterGroupDetails(
        parameters: json.containsKey('Parameters')
            ? (json['Parameters'] as List)
                .map((e) => Parameter.fromJson(e))
                .toList()
            : null,
        marker: json.containsKey('Marker') ? json['Marker'] as String : null,
      );
}

class DBParameterGroupNameMessage {
  /// Provides the name of the DB parameter group.
  final String dbParameterGroupName;

  DBParameterGroupNameMessage({
    this.dbParameterGroupName,
  });
  static DBParameterGroupNameMessage fromJson(Map<String, dynamic> json) =>
      DBParameterGroupNameMessage(
        dbParameterGroupName: json.containsKey('DBParameterGroupName')
            ? json['DBParameterGroupName'] as String
            : null,
      );
}

/// The status of the DB parameter group.
///
/// This data type is used as a response element in the following actions:
///
/// *    CreateDBInstance
///
/// *    DeleteDBInstance
///
/// *    ModifyDBInstance
///
/// *    RebootDBInstance
class DBParameterGroupStatus {
  /// The name of the DP parameter group.
  final String dbParameterGroupName;

  /// The status of parameter updates.
  final String parameterApplyStatus;

  DBParameterGroupStatus({
    this.dbParameterGroupName,
    this.parameterApplyStatus,
  });
  static DBParameterGroupStatus fromJson(Map<String, dynamic> json) =>
      DBParameterGroupStatus(
        dbParameterGroupName: json.containsKey('DBParameterGroupName')
            ? json['DBParameterGroupName'] as String
            : null,
        parameterApplyStatus: json.containsKey('ParameterApplyStatus')
            ? json['ParameterApplyStatus'] as String
            : null,
      );
}

class DBParameterGroupsMessage {
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords`.
  final String marker;

  /// A list of DBParameterGroup instances.
  final List<DBParameterGroup> dbParameterGroups;

  DBParameterGroupsMessage({
    this.marker,
    this.dbParameterGroups,
  });
  static DBParameterGroupsMessage fromJson(Map<String, dynamic> json) =>
      DBParameterGroupsMessage(
        marker: json.containsKey('Marker') ? json['Marker'] as String : null,
        dbParameterGroups: json.containsKey('DBParameterGroups')
            ? (json['DBParameterGroups'] as List)
                .map((e) => DBParameterGroup.fromJson(e))
                .toList()
            : null,
      );
}

/// Specifies membership in a designated DB security group.
class DBSecurityGroupMembership {
  /// The name of the DB security group.
  final String dbSecurityGroupName;

  /// The status of the DB security group.
  final String status;

  DBSecurityGroupMembership({
    this.dbSecurityGroupName,
    this.status,
  });
  static DBSecurityGroupMembership fromJson(Map<String, dynamic> json) =>
      DBSecurityGroupMembership(
        dbSecurityGroupName: json.containsKey('DBSecurityGroupName')
            ? json['DBSecurityGroupName'] as String
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
      );
}

/// Contains the details of an Amazon Neptune DB subnet group.
///
/// This data type is used as a response element in the DescribeDBSubnetGroups
/// action.
class DBSubnetGroup {
  /// The name of the DB subnet group.
  final String dbSubnetGroupName;

  /// Provides the description of the DB subnet group.
  final String dbSubnetGroupDescription;

  /// Provides the VpcId of the DB subnet group.
  final String vpcId;

  /// Provides the status of the DB subnet group.
  final String subnetGroupStatus;

  ///  Contains a list of Subnet elements.
  final List<Subnet> subnets;

  /// The Amazon Resource Name (ARN) for the DB subnet group.
  final String dbSubnetGroupArn;

  DBSubnetGroup({
    this.dbSubnetGroupName,
    this.dbSubnetGroupDescription,
    this.vpcId,
    this.subnetGroupStatus,
    this.subnets,
    this.dbSubnetGroupArn,
  });
  static DBSubnetGroup fromJson(Map<String, dynamic> json) => DBSubnetGroup(
        dbSubnetGroupName: json.containsKey('DBSubnetGroupName')
            ? json['DBSubnetGroupName'] as String
            : null,
        dbSubnetGroupDescription: json.containsKey('DBSubnetGroupDescription')
            ? json['DBSubnetGroupDescription'] as String
            : null,
        vpcId: json.containsKey('VpcId') ? json['VpcId'] as String : null,
        subnetGroupStatus: json.containsKey('SubnetGroupStatus')
            ? json['SubnetGroupStatus'] as String
            : null,
        subnets: json.containsKey('Subnets')
            ? (json['Subnets'] as List).map((e) => Subnet.fromJson(e)).toList()
            : null,
        dbSubnetGroupArn: json.containsKey('DBSubnetGroupArn')
            ? json['DBSubnetGroupArn'] as String
            : null,
      );
}

class DBSubnetGroupMessage {
  ///  An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords`.
  final String marker;

  ///  A list of DBSubnetGroup instances.
  final List<DBSubnetGroup> dbSubnetGroups;

  DBSubnetGroupMessage({
    this.marker,
    this.dbSubnetGroups,
  });
  static DBSubnetGroupMessage fromJson(Map<String, dynamic> json) =>
      DBSubnetGroupMessage(
        marker: json.containsKey('Marker') ? json['Marker'] as String : null,
        dbSubnetGroups: json.containsKey('DBSubnetGroups')
            ? (json['DBSubnetGroups'] as List)
                .map((e) => DBSubnetGroup.fromJson(e))
                .toList()
            : null,
      );
}

class DeleteDBClusterResult {
  final DBCluster dbCluster;

  DeleteDBClusterResult({
    this.dbCluster,
  });
  static DeleteDBClusterResult fromJson(Map<String, dynamic> json) =>
      DeleteDBClusterResult(
        dbCluster: json.containsKey('DBCluster')
            ? DBCluster.fromJson(json['DBCluster'])
            : null,
      );
}

class DeleteDBClusterSnapshotResult {
  final DBClusterSnapshot dbClusterSnapshot;

  DeleteDBClusterSnapshotResult({
    this.dbClusterSnapshot,
  });
  static DeleteDBClusterSnapshotResult fromJson(Map<String, dynamic> json) =>
      DeleteDBClusterSnapshotResult(
        dbClusterSnapshot: json.containsKey('DBClusterSnapshot')
            ? DBClusterSnapshot.fromJson(json['DBClusterSnapshot'])
            : null,
      );
}

class DeleteDBInstanceResult {
  final DBInstance dbInstance;

  DeleteDBInstanceResult({
    this.dbInstance,
  });
  static DeleteDBInstanceResult fromJson(Map<String, dynamic> json) =>
      DeleteDBInstanceResult(
        dbInstance: json.containsKey('DBInstance')
            ? DBInstance.fromJson(json['DBInstance'])
            : null,
      );
}

class DeleteEventSubscriptionResult {
  final EventSubscription eventSubscription;

  DeleteEventSubscriptionResult({
    this.eventSubscription,
  });
  static DeleteEventSubscriptionResult fromJson(Map<String, dynamic> json) =>
      DeleteEventSubscriptionResult(
        eventSubscription: json.containsKey('EventSubscription')
            ? EventSubscription.fromJson(json['EventSubscription'])
            : null,
      );
}

class DescribeDBClusterSnapshotAttributesResult {
  final DBClusterSnapshotAttributesResult dbClusterSnapshotAttributesResult;

  DescribeDBClusterSnapshotAttributesResult({
    this.dbClusterSnapshotAttributesResult,
  });
  static DescribeDBClusterSnapshotAttributesResult fromJson(
          Map<String, dynamic> json) =>
      DescribeDBClusterSnapshotAttributesResult(
        dbClusterSnapshotAttributesResult:
            json.containsKey('DBClusterSnapshotAttributesResult')
                ? DBClusterSnapshotAttributesResult.fromJson(
                    json['DBClusterSnapshotAttributesResult'])
                : null,
      );
}

class DescribeEngineDefaultClusterParametersResult {
  final EngineDefaults engineDefaults;

  DescribeEngineDefaultClusterParametersResult({
    this.engineDefaults,
  });
  static DescribeEngineDefaultClusterParametersResult fromJson(
          Map<String, dynamic> json) =>
      DescribeEngineDefaultClusterParametersResult(
        engineDefaults: json.containsKey('EngineDefaults')
            ? EngineDefaults.fromJson(json['EngineDefaults'])
            : null,
      );
}

class DescribeEngineDefaultParametersResult {
  final EngineDefaults engineDefaults;

  DescribeEngineDefaultParametersResult({
    this.engineDefaults,
  });
  static DescribeEngineDefaultParametersResult fromJson(
          Map<String, dynamic> json) =>
      DescribeEngineDefaultParametersResult(
        engineDefaults: json.containsKey('EngineDefaults')
            ? EngineDefaults.fromJson(json['EngineDefaults'])
            : null,
      );
}

class DescribeValidDBInstanceModificationsResult {
  final ValidDBInstanceModificationsMessage validDBInstanceModificationsMessage;

  DescribeValidDBInstanceModificationsResult({
    this.validDBInstanceModificationsMessage,
  });
  static DescribeValidDBInstanceModificationsResult fromJson(
          Map<String, dynamic> json) =>
      DescribeValidDBInstanceModificationsResult(
        validDBInstanceModificationsMessage:
            json.containsKey('ValidDBInstanceModificationsMessage')
                ? ValidDBInstanceModificationsMessage.fromJson(
                    json['ValidDBInstanceModificationsMessage'])
                : null,
      );
}

/// An Active Directory Domain membership record associated with a DB instance.
class DomainMembership {
  /// The identifier of the Active Directory Domain.
  final String domain;

  /// The status of the DB instance's Active Directory Domain membership, such
  /// as joined, pending-join, failed etc).
  final String status;

  /// The fully qualified domain name of the Active Directory Domain.
  final String fqdn;

  /// The name of the IAM role to be used when making API calls to the Directory
  /// Service.
  final String iamRoleName;

  DomainMembership({
    this.domain,
    this.status,
    this.fqdn,
    this.iamRoleName,
  });
  static DomainMembership fromJson(Map<String, dynamic> json) =>
      DomainMembership(
        domain: json.containsKey('Domain') ? json['Domain'] as String : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        fqdn: json.containsKey('FQDN') ? json['FQDN'] as String : null,
        iamRoleName: json.containsKey('IAMRoleName')
            ? json['IAMRoleName'] as String
            : null,
      );
}

/// A range of double values.
class DoubleRange {
  /// The minimum value in the range.
  final double from;

  /// The maximum value in the range.
  final double to;

  DoubleRange({
    this.from,
    this.to,
  });
  static DoubleRange fromJson(Map<String, dynamic> json) => DoubleRange(
        from: json.containsKey('From') ? json['From'] as double : null,
        to: json.containsKey('To') ? json['To'] as double : null,
      );
}

/// Specifies a connection endpoint.
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
  static Endpoint fromJson(Map<String, dynamic> json) => Endpoint(
        address: json.containsKey('Address') ? json['Address'] as String : null,
        port: json.containsKey('Port') ? json['Port'] as int : null,
        hostedZoneId: json.containsKey('HostedZoneId')
            ? json['HostedZoneId'] as String
            : null,
      );
}

///  Contains the result of a successful invocation of the
/// DescribeEngineDefaultParameters action.
class EngineDefaults {
  /// Specifies the name of the DB parameter group family that the engine
  /// default parameters apply to.
  final String dbParameterGroupFamily;

  ///  An optional pagination token provided by a previous EngineDefaults
  /// request. If this parameter is specified, the response includes only
  /// records beyond the marker, up to the value specified by `MaxRecords` .
  final String marker;

  /// Contains a list of engine default parameters.
  final List<Parameter> parameters;

  EngineDefaults({
    this.dbParameterGroupFamily,
    this.marker,
    this.parameters,
  });
  static EngineDefaults fromJson(Map<String, dynamic> json) => EngineDefaults(
        dbParameterGroupFamily: json.containsKey('DBParameterGroupFamily')
            ? json['DBParameterGroupFamily'] as String
            : null,
        marker: json.containsKey('Marker') ? json['Marker'] as String : null,
        parameters: json.containsKey('Parameters')
            ? (json['Parameters'] as List)
                .map((e) => Parameter.fromJson(e))
                .toList()
            : null,
      );
}

///  This data type is used as a response element in the DescribeEvents action.
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
  static Event fromJson(Map<String, dynamic> json) => Event(
        sourceIdentifier: json.containsKey('SourceIdentifier')
            ? json['SourceIdentifier'] as String
            : null,
        sourceType: json.containsKey('SourceType')
            ? json['SourceType'] as String
            : null,
        message: json.containsKey('Message') ? json['Message'] as String : null,
        eventCategories: json.containsKey('EventCategories')
            ? (json['EventCategories'] as List).map((e) => e as String).toList()
            : null,
        date: json.containsKey('Date') ? DateTime.parse(json['Date']) : null,
        sourceArn:
            json.containsKey('SourceArn') ? json['SourceArn'] as String : null,
      );
}

/// Contains the results of a successful invocation of the
/// DescribeEventCategories action.
class EventCategoriesMap {
  /// The source type that the returned categories belong to
  final String sourceType;

  /// The event categories for the specified source type
  final List<String> eventCategories;

  EventCategoriesMap({
    this.sourceType,
    this.eventCategories,
  });
  static EventCategoriesMap fromJson(Map<String, dynamic> json) =>
      EventCategoriesMap(
        sourceType: json.containsKey('SourceType')
            ? json['SourceType'] as String
            : null,
        eventCategories: json.containsKey('EventCategories')
            ? (json['EventCategories'] as List).map((e) => e as String).toList()
            : null,
      );
}

class EventCategoriesMessage {
  /// A list of EventCategoriesMap data types.
  final List<EventCategoriesMap> eventCategoriesMapList;

  EventCategoriesMessage({
    this.eventCategoriesMapList,
  });
  static EventCategoriesMessage fromJson(Map<String, dynamic> json) =>
      EventCategoriesMessage(
        eventCategoriesMapList: json.containsKey('EventCategoriesMapList')
            ? (json['EventCategoriesMapList'] as List)
                .map((e) => EventCategoriesMap.fromJson(e))
                .toList()
            : null,
      );
}

/// Contains the results of a successful invocation of the
/// DescribeEventSubscriptions action.
class EventSubscription {
  /// The AWS customer account associated with the event notification
  /// subscription.
  final String customerAwsId;

  /// The event notification subscription Id.
  final String custSubscriptionId;

  /// The topic ARN of the event notification subscription.
  final String snsTopicArn;

  /// The status of the event notification subscription.
  ///
  /// Constraints:
  ///
  /// Can be one of the following: creating | modifying | deleting | active |
  /// no-permission | topic-not-exist
  ///
  /// The status "no-permission" indicates that Neptune no longer has permission
  /// to post to the SNS topic. The status "topic-not-exist" indicates that the
  /// topic was deleted after the subscription was created.
  final String status;

  /// The time the event notification subscription was created.
  final String subscriptionCreationTime;

  /// The source type for the event notification subscription.
  final String sourceType;

  /// A list of source IDs for the event notification subscription.
  final List<String> sourceIdsList;

  /// A list of event categories for the event notification subscription.
  final List<String> eventCategoriesList;

  /// A Boolean value indicating if the subscription is enabled. True indicates
  /// the subscription is enabled.
  final bool enabled;

  /// The Amazon Resource Name (ARN) for the event subscription.
  final String eventSubscriptionArn;

  EventSubscription({
    this.customerAwsId,
    this.custSubscriptionId,
    this.snsTopicArn,
    this.status,
    this.subscriptionCreationTime,
    this.sourceType,
    this.sourceIdsList,
    this.eventCategoriesList,
    this.enabled,
    this.eventSubscriptionArn,
  });
  static EventSubscription fromJson(Map<String, dynamic> json) =>
      EventSubscription(
        customerAwsId: json.containsKey('CustomerAwsId')
            ? json['CustomerAwsId'] as String
            : null,
        custSubscriptionId: json.containsKey('CustSubscriptionId')
            ? json['CustSubscriptionId'] as String
            : null,
        snsTopicArn: json.containsKey('SnsTopicArn')
            ? json['SnsTopicArn'] as String
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        subscriptionCreationTime: json.containsKey('SubscriptionCreationTime')
            ? json['SubscriptionCreationTime'] as String
            : null,
        sourceType: json.containsKey('SourceType')
            ? json['SourceType'] as String
            : null,
        sourceIdsList: json.containsKey('SourceIdsList')
            ? (json['SourceIdsList'] as List).map((e) => e as String).toList()
            : null,
        eventCategoriesList: json.containsKey('EventCategoriesList')
            ? (json['EventCategoriesList'] as List)
                .map((e) => e as String)
                .toList()
            : null,
        enabled: json.containsKey('Enabled') ? json['Enabled'] as bool : null,
        eventSubscriptionArn: json.containsKey('EventSubscriptionArn')
            ? json['EventSubscriptionArn'] as String
            : null,
      );
}

class EventSubscriptionsMessage {
  ///  An optional pagination token provided by a previous
  /// DescribeOrderableDBInstanceOptions request. If this parameter is
  /// specified, the response includes only records beyond the marker, up to the
  /// value specified by `MaxRecords`.
  final String marker;

  /// A list of EventSubscriptions data types.
  final List<EventSubscription> eventSubscriptionsList;

  EventSubscriptionsMessage({
    this.marker,
    this.eventSubscriptionsList,
  });
  static EventSubscriptionsMessage fromJson(Map<String, dynamic> json) =>
      EventSubscriptionsMessage(
        marker: json.containsKey('Marker') ? json['Marker'] as String : null,
        eventSubscriptionsList: json.containsKey('EventSubscriptionsList')
            ? (json['EventSubscriptionsList'] as List)
                .map((e) => EventSubscription.fromJson(e))
                .toList()
            : null,
      );
}

class EventsMessage {
  ///  An optional pagination token provided by a previous Events request. If
  /// this parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords` .
  final String marker;

  ///  A list of Event instances.
  final List<Event> events;

  EventsMessage({
    this.marker,
    this.events,
  });
  static EventsMessage fromJson(Map<String, dynamic> json) => EventsMessage(
        marker: json.containsKey('Marker') ? json['Marker'] as String : null,
        events: json.containsKey('Events')
            ? (json['Events'] as List).map((e) => Event.fromJson(e)).toList()
            : null,
      );
}

class FailoverDBClusterResult {
  final DBCluster dbCluster;

  FailoverDBClusterResult({
    this.dbCluster,
  });
  static FailoverDBClusterResult fromJson(Map<String, dynamic> json) =>
      FailoverDBClusterResult(
        dbCluster: json.containsKey('DBCluster')
            ? DBCluster.fromJson(json['DBCluster'])
            : null,
      );
}

/// This type is not currently supported.
class Filter {
  /// This parameter is not currently supported.
  final String name;

  /// This parameter is not currently supported.
  final List<String> values;

  Filter({
    @required this.name,
    @required this.values,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class ModifyDBClusterResult {
  final DBCluster dbCluster;

  ModifyDBClusterResult({
    this.dbCluster,
  });
  static ModifyDBClusterResult fromJson(Map<String, dynamic> json) =>
      ModifyDBClusterResult(
        dbCluster: json.containsKey('DBCluster')
            ? DBCluster.fromJson(json['DBCluster'])
            : null,
      );
}

class ModifyDBClusterSnapshotAttributeResult {
  final DBClusterSnapshotAttributesResult dbClusterSnapshotAttributesResult;

  ModifyDBClusterSnapshotAttributeResult({
    this.dbClusterSnapshotAttributesResult,
  });
  static ModifyDBClusterSnapshotAttributeResult fromJson(
          Map<String, dynamic> json) =>
      ModifyDBClusterSnapshotAttributeResult(
        dbClusterSnapshotAttributesResult:
            json.containsKey('DBClusterSnapshotAttributesResult')
                ? DBClusterSnapshotAttributesResult.fromJson(
                    json['DBClusterSnapshotAttributesResult'])
                : null,
      );
}

class ModifyDBInstanceResult {
  final DBInstance dbInstance;

  ModifyDBInstanceResult({
    this.dbInstance,
  });
  static ModifyDBInstanceResult fromJson(Map<String, dynamic> json) =>
      ModifyDBInstanceResult(
        dbInstance: json.containsKey('DBInstance')
            ? DBInstance.fromJson(json['DBInstance'])
            : null,
      );
}

class ModifyDBSubnetGroupResult {
  final DBSubnetGroup dbSubnetGroup;

  ModifyDBSubnetGroupResult({
    this.dbSubnetGroup,
  });
  static ModifyDBSubnetGroupResult fromJson(Map<String, dynamic> json) =>
      ModifyDBSubnetGroupResult(
        dbSubnetGroup: json.containsKey('DBSubnetGroup')
            ? DBSubnetGroup.fromJson(json['DBSubnetGroup'])
            : null,
      );
}

class ModifyEventSubscriptionResult {
  final EventSubscription eventSubscription;

  ModifyEventSubscriptionResult({
    this.eventSubscription,
  });
  static ModifyEventSubscriptionResult fromJson(Map<String, dynamic> json) =>
      ModifyEventSubscriptionResult(
        eventSubscription: json.containsKey('EventSubscription')
            ? EventSubscription.fromJson(json['EventSubscription'])
            : null,
      );
}

/// Provides information on the option groups the DB instance is a member of.
class OptionGroupMembership {
  /// The name of the option group that the instance belongs to.
  final String optionGroupName;

  /// The status of the DB instance's option group membership. Valid values are:
  /// `in-sync`, `pending-apply`, `pending-removal`,
  /// `pending-maintenance-apply`, `pending-maintenance-removal`, `applying`,
  /// `removing`, and `failed`.
  final String status;

  OptionGroupMembership({
    this.optionGroupName,
    this.status,
  });
  static OptionGroupMembership fromJson(Map<String, dynamic> json) =>
      OptionGroupMembership(
        optionGroupName: json.containsKey('OptionGroupName')
            ? json['OptionGroupName'] as String
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
      );
}

/// Contains a list of available options for a DB instance.
///
///  This data type is used as a response element in the
/// DescribeOrderableDBInstanceOptions action.
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

  /// Indicates whether a DB instance is Multi-AZ capable.
  final bool multiAZCapable;

  /// Indicates whether a DB instance can have a Read Replica.
  final bool readReplicaCapable;

  /// Indicates whether a DB instance is in a VPC.
  final bool vpc;

  /// Indicates whether a DB instance supports encrypted storage.
  final bool supportsStorageEncryption;

  /// Indicates the storage type for a DB instance.
  final String storageType;

  /// Indicates whether a DB instance supports provisioned IOPS.
  final bool supportsIops;

  /// Indicates whether a DB instance supports Enhanced Monitoring at intervals
  /// from 1 to 60 seconds.
  final bool supportsEnhancedMonitoring;

  /// Indicates whether a DB instance supports IAM database authentication.
  final bool supportsIamDatabaseAuthentication;

  /// True if a DB instance supports Performance Insights, otherwise false.
  final bool supportsPerformanceInsights;

  /// Minimum storage size for a DB instance.
  final int minStorageSize;

  /// Maximum storage size for a DB instance.
  final int maxStorageSize;

  /// Minimum total provisioned IOPS for a DB instance.
  final int minIopsPerDbInstance;

  /// Maximum total provisioned IOPS for a DB instance.
  final int maxIopsPerDbInstance;

  /// Minimum provisioned IOPS per GiB for a DB instance.
  final double minIopsPerGib;

  /// Maximum provisioned IOPS per GiB for a DB instance.
  final double maxIopsPerGib;

  OrderableDBInstanceOption({
    this.engine,
    this.engineVersion,
    this.dbInstanceClass,
    this.licenseModel,
    this.availabilityZones,
    this.multiAZCapable,
    this.readReplicaCapable,
    this.vpc,
    this.supportsStorageEncryption,
    this.storageType,
    this.supportsIops,
    this.supportsEnhancedMonitoring,
    this.supportsIamDatabaseAuthentication,
    this.supportsPerformanceInsights,
    this.minStorageSize,
    this.maxStorageSize,
    this.minIopsPerDbInstance,
    this.maxIopsPerDbInstance,
    this.minIopsPerGib,
    this.maxIopsPerGib,
  });
  static OrderableDBInstanceOption fromJson(Map<String, dynamic> json) =>
      OrderableDBInstanceOption(
        engine: json.containsKey('Engine') ? json['Engine'] as String : null,
        engineVersion: json.containsKey('EngineVersion')
            ? json['EngineVersion'] as String
            : null,
        dbInstanceClass: json.containsKey('DBInstanceClass')
            ? json['DBInstanceClass'] as String
            : null,
        licenseModel: json.containsKey('LicenseModel')
            ? json['LicenseModel'] as String
            : null,
        availabilityZones: json.containsKey('AvailabilityZones')
            ? (json['AvailabilityZones'] as List)
                .map((e) => AvailabilityZone.fromJson(e))
                .toList()
            : null,
        multiAZCapable: json.containsKey('MultiAZCapable')
            ? json['MultiAZCapable'] as bool
            : null,
        readReplicaCapable: json.containsKey('ReadReplicaCapable')
            ? json['ReadReplicaCapable'] as bool
            : null,
        vpc: json.containsKey('Vpc') ? json['Vpc'] as bool : null,
        supportsStorageEncryption: json.containsKey('SupportsStorageEncryption')
            ? json['SupportsStorageEncryption'] as bool
            : null,
        storageType: json.containsKey('StorageType')
            ? json['StorageType'] as String
            : null,
        supportsIops: json.containsKey('SupportsIops')
            ? json['SupportsIops'] as bool
            : null,
        supportsEnhancedMonitoring:
            json.containsKey('SupportsEnhancedMonitoring')
                ? json['SupportsEnhancedMonitoring'] as bool
                : null,
        supportsIamDatabaseAuthentication:
            json.containsKey('SupportsIAMDatabaseAuthentication')
                ? json['SupportsIAMDatabaseAuthentication'] as bool
                : null,
        supportsPerformanceInsights:
            json.containsKey('SupportsPerformanceInsights')
                ? json['SupportsPerformanceInsights'] as bool
                : null,
        minStorageSize: json.containsKey('MinStorageSize')
            ? json['MinStorageSize'] as int
            : null,
        maxStorageSize: json.containsKey('MaxStorageSize')
            ? json['MaxStorageSize'] as int
            : null,
        minIopsPerDbInstance: json.containsKey('MinIopsPerDbInstance')
            ? json['MinIopsPerDbInstance'] as int
            : null,
        maxIopsPerDbInstance: json.containsKey('MaxIopsPerDbInstance')
            ? json['MaxIopsPerDbInstance'] as int
            : null,
        minIopsPerGib: json.containsKey('MinIopsPerGib')
            ? json['MinIopsPerGib'] as double
            : null,
        maxIopsPerGib: json.containsKey('MaxIopsPerGib')
            ? json['MaxIopsPerGib'] as double
            : null,
      );
}

class OrderableDBInstanceOptionsMessage {
  /// An OrderableDBInstanceOption structure containing information about
  /// orderable options for the DB instance.
  final List<OrderableDBInstanceOption> orderableDBInstanceOptions;

  ///  An optional pagination token provided by a previous
  /// OrderableDBInstanceOptions request. If this parameter is specified, the
  /// response includes only records beyond the marker, up to the value
  /// specified by `MaxRecords` .
  final String marker;

  OrderableDBInstanceOptionsMessage({
    this.orderableDBInstanceOptions,
    this.marker,
  });
  static OrderableDBInstanceOptionsMessage fromJson(
          Map<String, dynamic> json) =>
      OrderableDBInstanceOptionsMessage(
        orderableDBInstanceOptions:
            json.containsKey('OrderableDBInstanceOptions')
                ? (json['OrderableDBInstanceOptions'] as List)
                    .map((e) => OrderableDBInstanceOption.fromJson(e))
                    .toList()
                : null,
        marker: json.containsKey('Marker') ? json['Marker'] as String : null,
      );
}

/// Specifies a parameter.
class Parameter {
  /// Specifies the name of the parameter.
  final String parameterName;

  /// Specifies the value of the parameter.
  final String parameterValue;

  /// Provides a description of the parameter.
  final String description;

  /// Indicates the source of the parameter value.
  final String source;

  /// Specifies the engine specific parameters type.
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
  static Parameter fromJson(Map<String, dynamic> json) => Parameter(
        parameterName: json.containsKey('ParameterName')
            ? json['ParameterName'] as String
            : null,
        parameterValue: json.containsKey('ParameterValue')
            ? json['ParameterValue'] as String
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        source: json.containsKey('Source') ? json['Source'] as String : null,
        applyType:
            json.containsKey('ApplyType') ? json['ApplyType'] as String : null,
        dataType:
            json.containsKey('DataType') ? json['DataType'] as String : null,
        allowedValues: json.containsKey('AllowedValues')
            ? json['AllowedValues'] as String
            : null,
        isModifiable: json.containsKey('IsModifiable')
            ? json['IsModifiable'] as bool
            : null,
        minimumEngineVersion: json.containsKey('MinimumEngineVersion')
            ? json['MinimumEngineVersion'] as String
            : null,
        applyMethod: json.containsKey('ApplyMethod')
            ? json['ApplyMethod'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A list of the log types whose configuration is still pending. In other
/// words, these log types are in the process of being activated or deactivated.
class PendingCloudwatchLogsExports {
  /// Log types that are in the process of being deactivated. After they are
  /// deactivated, these log types aren't exported to CloudWatch Logs.
  final List<String> logTypesToEnable;

  /// Log types that are in the process of being enabled. After they are
  /// enabled, these log types are exported to CloudWatch Logs.
  final List<String> logTypesToDisable;

  PendingCloudwatchLogsExports({
    this.logTypesToEnable,
    this.logTypesToDisable,
  });
  static PendingCloudwatchLogsExports fromJson(Map<String, dynamic> json) =>
      PendingCloudwatchLogsExports(
        logTypesToEnable: json.containsKey('LogTypesToEnable')
            ? (json['LogTypesToEnable'] as List)
                .map((e) => e as String)
                .toList()
            : null,
        logTypesToDisable: json.containsKey('LogTypesToDisable')
            ? (json['LogTypesToDisable'] as List)
                .map((e) => e as String)
                .toList()
            : null,
      );
}

/// Provides information about a pending maintenance action for a resource.
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
  /// resource. This date takes into account opt-in requests received from the
  /// ApplyPendingMaintenanceAction API, the `AutoAppliedAfterDate`, and the
  /// `ForcedApplyDate`. This value is blank if an opt-in request has not been
  /// received and nothing has been specified as `AutoAppliedAfterDate` or
  /// `ForcedApplyDate`.
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
      PendingMaintenanceAction(
        action: json.containsKey('Action') ? json['Action'] as String : null,
        autoAppliedAfterDate: json.containsKey('AutoAppliedAfterDate')
            ? DateTime.parse(json['AutoAppliedAfterDate'])
            : null,
        forcedApplyDate: json.containsKey('ForcedApplyDate')
            ? DateTime.parse(json['ForcedApplyDate'])
            : null,
        optInStatus: json.containsKey('OptInStatus')
            ? json['OptInStatus'] as String
            : null,
        currentApplyDate: json.containsKey('CurrentApplyDate')
            ? DateTime.parse(json['CurrentApplyDate'])
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
      );
}

class PendingMaintenanceActionsMessage {
  /// A list of the pending maintenance actions for the resource.
  final List<ResourcePendingMaintenanceActions> pendingMaintenanceActions;

  ///  An optional pagination token provided by a previous
  /// `DescribePendingMaintenanceActions` request. If this parameter is
  /// specified, the response includes only records beyond the marker, up to a
  /// number of records specified by `MaxRecords`.
  final String marker;

  PendingMaintenanceActionsMessage({
    this.pendingMaintenanceActions,
    this.marker,
  });
  static PendingMaintenanceActionsMessage fromJson(Map<String, dynamic> json) =>
      PendingMaintenanceActionsMessage(
        pendingMaintenanceActions: json.containsKey('PendingMaintenanceActions')
            ? (json['PendingMaintenanceActions'] as List)
                .map((e) => ResourcePendingMaintenanceActions.fromJson(e))
                .toList()
            : null,
        marker: json.containsKey('Marker') ? json['Marker'] as String : null,
      );
}

///  This data type is used as a response element in the ModifyDBInstance
/// action.
class PendingModifiedValues {
  ///  Contains the new `DBInstanceClass` for the DB instance that will be
  /// applied or is currently being applied.
  final String dbInstanceClass;

  ///  Contains the new `AllocatedStorage` size for the DB instance that will be
  /// applied or is currently being applied.
  final int allocatedStorage;

  /// Contains the pending or currently-in-progress change of the master
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
  /// Valid values: `license-included` | `bring-your-own-license` |
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

  /// Specifies the identifier of the CA certificate for the DB instance.
  final String caCertificateIdentifier;

  /// The new DB subnet group for the DB instance.
  final String dbSubnetGroupName;

  /// Specifies the CloudWatch logs to be exported.
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
      PendingModifiedValues(
        dbInstanceClass: json.containsKey('DBInstanceClass')
            ? json['DBInstanceClass'] as String
            : null,
        allocatedStorage: json.containsKey('AllocatedStorage')
            ? json['AllocatedStorage'] as int
            : null,
        masterUserPassword: json.containsKey('MasterUserPassword')
            ? json['MasterUserPassword'] as String
            : null,
        port: json.containsKey('Port') ? json['Port'] as int : null,
        backupRetentionPeriod: json.containsKey('BackupRetentionPeriod')
            ? json['BackupRetentionPeriod'] as int
            : null,
        multiAZ: json.containsKey('MultiAZ') ? json['MultiAZ'] as bool : null,
        engineVersion: json.containsKey('EngineVersion')
            ? json['EngineVersion'] as String
            : null,
        licenseModel: json.containsKey('LicenseModel')
            ? json['LicenseModel'] as String
            : null,
        iops: json.containsKey('Iops') ? json['Iops'] as int : null,
        dbInstanceIdentifier: json.containsKey('DBInstanceIdentifier')
            ? json['DBInstanceIdentifier'] as String
            : null,
        storageType: json.containsKey('StorageType')
            ? json['StorageType'] as String
            : null,
        caCertificateIdentifier: json.containsKey('CACertificateIdentifier')
            ? json['CACertificateIdentifier'] as String
            : null,
        dbSubnetGroupName: json.containsKey('DBSubnetGroupName')
            ? json['DBSubnetGroupName'] as String
            : null,
        pendingCloudwatchLogsExports:
            json.containsKey('PendingCloudwatchLogsExports')
                ? PendingCloudwatchLogsExports.fromJson(
                    json['PendingCloudwatchLogsExports'])
                : null,
      );
}

class PromoteReadReplicaDBClusterResult {
  final DBCluster dbCluster;

  PromoteReadReplicaDBClusterResult({
    this.dbCluster,
  });
  static PromoteReadReplicaDBClusterResult fromJson(
          Map<String, dynamic> json) =>
      PromoteReadReplicaDBClusterResult(
        dbCluster: json.containsKey('DBCluster')
            ? DBCluster.fromJson(json['DBCluster'])
            : null,
      );
}

/// A range of integer values.
class Range {
  /// The minimum value in the range.
  final int from;

  /// The maximum value in the range.
  final int to;

  /// The step value for the range. For example, if you have a range of 5,000 to
  /// 10,000, with a step value of 1,000, the valid values start at 5,000 and
  /// step up by 1,000. Even though 7,500 is within the range, it isn't a valid
  /// value for the range. The valid values are 5,000, 6,000, 7,000, 8,000...
  final int step;

  Range({
    this.from,
    this.to,
    this.step,
  });
  static Range fromJson(Map<String, dynamic> json) => Range(
        from: json.containsKey('From') ? json['From'] as int : null,
        to: json.containsKey('To') ? json['To'] as int : null,
        step: json.containsKey('Step') ? json['Step'] as int : null,
      );
}

class RebootDBInstanceResult {
  final DBInstance dbInstance;

  RebootDBInstanceResult({
    this.dbInstance,
  });
  static RebootDBInstanceResult fromJson(Map<String, dynamic> json) =>
      RebootDBInstanceResult(
        dbInstance: json.containsKey('DBInstance')
            ? DBInstance.fromJson(json['DBInstance'])
            : null,
      );
}

class RemoveSourceIdentifierFromSubscriptionResult {
  final EventSubscription eventSubscription;

  RemoveSourceIdentifierFromSubscriptionResult({
    this.eventSubscription,
  });
  static RemoveSourceIdentifierFromSubscriptionResult fromJson(
          Map<String, dynamic> json) =>
      RemoveSourceIdentifierFromSubscriptionResult(
        eventSubscription: json.containsKey('EventSubscription')
            ? EventSubscription.fromJson(json['EventSubscription'])
            : null,
      );
}

/// Describes the pending maintenance actions for a resource.
class ResourcePendingMaintenanceActions {
  /// The ARN of the resource that has pending maintenance actions.
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
      ResourcePendingMaintenanceActions(
        resourceIdentifier: json.containsKey('ResourceIdentifier')
            ? json['ResourceIdentifier'] as String
            : null,
        pendingMaintenanceActionDetails:
            json.containsKey('PendingMaintenanceActionDetails')
                ? (json['PendingMaintenanceActionDetails'] as List)
                    .map((e) => PendingMaintenanceAction.fromJson(e))
                    .toList()
                : null,
      );
}

class RestoreDBClusterFromSnapshotResult {
  final DBCluster dbCluster;

  RestoreDBClusterFromSnapshotResult({
    this.dbCluster,
  });
  static RestoreDBClusterFromSnapshotResult fromJson(
          Map<String, dynamic> json) =>
      RestoreDBClusterFromSnapshotResult(
        dbCluster: json.containsKey('DBCluster')
            ? DBCluster.fromJson(json['DBCluster'])
            : null,
      );
}

class RestoreDBClusterToPointInTimeResult {
  final DBCluster dbCluster;

  RestoreDBClusterToPointInTimeResult({
    this.dbCluster,
  });
  static RestoreDBClusterToPointInTimeResult fromJson(
          Map<String, dynamic> json) =>
      RestoreDBClusterToPointInTimeResult(
        dbCluster: json.containsKey('DBCluster')
            ? DBCluster.fromJson(json['DBCluster'])
            : null,
      );
}

/// Specifies a subnet.
///
///  This data type is used as a response element in the DescribeDBSubnetGroups
/// action.
class Subnet {
  /// Specifies the identifier of the subnet.
  final String subnetIdentifier;

  /// Specifies the EC2 Availability Zone that the subnet is in.
  final AvailabilityZone subnetAvailabilityZone;

  /// Specifies the status of the subnet.
  final String subnetStatus;

  Subnet({
    this.subnetIdentifier,
    this.subnetAvailabilityZone,
    this.subnetStatus,
  });
  static Subnet fromJson(Map<String, dynamic> json) => Subnet(
        subnetIdentifier: json.containsKey('SubnetIdentifier')
            ? json['SubnetIdentifier'] as String
            : null,
        subnetAvailabilityZone: json.containsKey('SubnetAvailabilityZone')
            ? AvailabilityZone.fromJson(json['SubnetAvailabilityZone'])
            : null,
        subnetStatus: json.containsKey('SubnetStatus')
            ? json['SubnetStatus'] as String
            : null,
      );
}

/// Metadata assigned to an Amazon Neptune resource consisting of a key-value
/// pair.
class Tag {
  /// A key is the required name of the tag. The string value can be from 1 to
  /// 128 Unicode characters in length and can't be prefixed with "aws:" or
  /// "rds:". The string can only contain only the set of Unicode letters,
  /// digits, white-space, '_', '.', '/', '=', '+', '-' (Java regex:
  /// "^([p{L}p{Z}p{N}_.:/=+-]*)$").
  final String key;

  /// A value is the optional value of the tag. The string value can be from 1
  /// to 256 Unicode characters in length and can't be prefixed with "aws:" or
  /// "rds:". The string can only contain only the set of Unicode letters,
  /// digits, white-space, '_', '.', '/', '=', '+', '-' (Java regex:
  /// "^([p{L}p{Z}p{N}_.:/=+-]*)$").
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

class TagListMessage {
  /// List of tags returned by the ListTagsForResource operation.
  final List<Tag> tagList;

  TagListMessage({
    this.tagList,
  });
  static TagListMessage fromJson(Map<String, dynamic> json) => TagListMessage(
        tagList: json.containsKey('TagList')
            ? (json['TagList'] as List).map((e) => Tag.fromJson(e)).toList()
            : null,
      );
}

/// A time zone associated with a DBInstance.
class Timezone {
  /// The name of the time zone.
  final String timezoneName;

  Timezone({
    this.timezoneName,
  });
  static Timezone fromJson(Map<String, dynamic> json) => Timezone(
        timezoneName: json.containsKey('TimezoneName')
            ? json['TimezoneName'] as String
            : null,
      );
}

/// The version of the database engine that a DB instance can be upgraded to.
class UpgradeTarget {
  /// The name of the upgrade target database engine.
  final String engine;

  /// The version number of the upgrade target database engine.
  final String engineVersion;

  /// The version of the database engine that a DB instance can be upgraded to.
  final String description;

  /// A value that indicates whether the target version is applied to any source
  /// DB instances that have AutoMinorVersionUpgrade set to true.
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
  static UpgradeTarget fromJson(Map<String, dynamic> json) => UpgradeTarget(
        engine: json.containsKey('Engine') ? json['Engine'] as String : null,
        engineVersion: json.containsKey('EngineVersion')
            ? json['EngineVersion'] as String
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        autoUpgrade: json.containsKey('AutoUpgrade')
            ? json['AutoUpgrade'] as bool
            : null,
        isMajorVersionUpgrade: json.containsKey('IsMajorVersionUpgrade')
            ? json['IsMajorVersionUpgrade'] as bool
            : null,
      );
}

/// Information about valid modifications that you can make to your DB instance.
/// Contains the result of a successful call to the
/// DescribeValidDBInstanceModifications action. You can use this information
/// when you call ModifyDBInstance.
class ValidDBInstanceModificationsMessage {
  /// Valid storage options for your DB instance.
  final List<ValidStorageOptions> storage;

  ValidDBInstanceModificationsMessage({
    this.storage,
  });
  static ValidDBInstanceModificationsMessage fromJson(
          Map<String, dynamic> json) =>
      ValidDBInstanceModificationsMessage(
        storage: json.containsKey('Storage')
            ? (json['Storage'] as List)
                .map((e) => ValidStorageOptions.fromJson(e))
                .toList()
            : null,
      );
}

/// Information about valid modifications that you can make to your DB instance.
///
/// Contains the result of a successful call to the
/// DescribeValidDBInstanceModifications action.
class ValidStorageOptions {
  /// The valid storage types for your DB instance. For example, gp2, io1.
  final String storageType;

  /// The valid range of storage in gibibytes. For example, 100 to 16384.
  final List<Range> storageSize;

  /// The valid range of provisioned IOPS. For example, 1000-20000.
  final List<Range> provisionedIops;

  /// The valid range of Provisioned IOPS to gibibytes of storage multiplier.
  /// For example, 3-10, which means that provisioned IOPS can be between 3 and
  /// 10 times storage.
  final List<DoubleRange> iopsToStorageRatio;

  ValidStorageOptions({
    this.storageType,
    this.storageSize,
    this.provisionedIops,
    this.iopsToStorageRatio,
  });
  static ValidStorageOptions fromJson(Map<String, dynamic> json) =>
      ValidStorageOptions(
        storageType: json.containsKey('StorageType')
            ? json['StorageType'] as String
            : null,
        storageSize: json.containsKey('StorageSize')
            ? (json['StorageSize'] as List)
                .map((e) => Range.fromJson(e))
                .toList()
            : null,
        provisionedIops: json.containsKey('ProvisionedIops')
            ? (json['ProvisionedIops'] as List)
                .map((e) => Range.fromJson(e))
                .toList()
            : null,
        iopsToStorageRatio: json.containsKey('IopsToStorageRatio')
            ? (json['IopsToStorageRatio'] as List)
                .map((e) => DoubleRange.fromJson(e))
                .toList()
            : null,
      );
}

/// This data type is used as a response element for queries on VPC security
/// group membership.
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
      VpcSecurityGroupMembership(
        vpcSecurityGroupId: json.containsKey('VpcSecurityGroupId')
            ? json['VpcSecurityGroupId'] as String
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
      );
}
