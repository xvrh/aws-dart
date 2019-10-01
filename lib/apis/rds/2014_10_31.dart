import 'package:meta/meta.dart';

/// Amazon Relational Database Service
///
/// Amazon Relational Database Service (Amazon RDS) is a web service that makes
/// it easier to set up, operate, and scale a relational database in the cloud.
/// It provides cost-efficient, resizable capacity for an industry-standard
/// relational database and manages common database administration tasks,
/// freeing up developers to focus on what makes their applications and
/// businesses unique.
///
/// Amazon RDS gives you access to the capabilities of a MySQL, MariaDB,
/// PostgreSQL, Microsoft SQL Server, Oracle, or Amazon Aurora database server.
/// These capabilities mean that the code, applications, and tools you already
/// use today with your existing databases work with Amazon RDS without
/// modification. Amazon RDS automatically backs up your database and maintains
/// the database software that powers your DB instance. Amazon RDS is flexible:
/// you can scale your DB instance's compute resources and storage capacity to
/// meet your application's demand. As with all Amazon Web Services, there are
/// no up-front investments, and you pay only for the resources you use.
///
/// This interface reference for Amazon RDS contains documentation for a
/// programming or command line interface you can use to manage Amazon RDS. Note
/// that Amazon RDS is asynchronous, which means that some interfaces might
/// require techniques such as polling or callback functions to determine when a
/// command has been applied. In this reference, the parameter descriptions
/// indicate whether a command is applied immediately, on the next instance
/// reboot, or during the maintenance window. The reference structure is as
/// follows, and we list following some related topics from the user guide.
///
///  **Amazon RDS API Reference**
///
/// *   For the alphabetical list of API actions, see [API
/// Actions](https://docs.aws.amazon.com/AmazonRDS/latest/APIReference/API_Operations.html).
///
/// *   For the alphabetical list of data types, see [Data
/// Types](https://docs.aws.amazon.com/AmazonRDS/latest/APIReference/API_Types.html).
///
/// *   For a list of common query parameters, see [Common
/// Parameters](https://docs.aws.amazon.com/AmazonRDS/latest/APIReference/CommonParameters.html).
///
/// *   For descriptions of the error codes, see [Common
/// Errors](https://docs.aws.amazon.com/AmazonRDS/latest/APIReference/CommonErrors.html).
///
///
///  **Amazon RDS User Guide**
///
/// *   For a summary of the Amazon RDS interfaces, see [Available RDS
/// Interfaces](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Welcome.html#Welcome.Interfaces).
///
/// *   For more information about how to use the Query API, see [Using the
/// Query
/// API](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Using_the_Query_API.html).
class RdsApi {
  /// Associates an Identity and Access Management (IAM) role from an Amazon
  /// Aurora DB cluster. For more information, see [Authorizing Amazon Aurora
  /// MySQL to Access Other AWS Services on Your
  /// Behalf](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraMySQL.Integrating.Authorizing.html)
  /// in the _Amazon Aurora User Guide_.
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
  Future<void> addRoleToDBCluster(
      {@required String dbClusterIdentifier,
      @required String roleArn,
      String featureName}) async {}

  /// Associates an AWS Identity and Access Management (IAM) role with a DB
  /// instance.
  ///
  ///
  ///
  /// To add a role to a DB instance, the status of the DB instance must be
  /// `available`.
  Future<void> addRoleToDBInstance(
      {@required String dbInstanceIdentifier,
      @required String roleArn,
      @required String featureName}) async {}

  /// Adds a source identifier to an existing RDS event notification
  /// subscription.
  Future<void> addSourceIdentifierToSubscription(
      {@required String subscriptionName,
      @required String sourceIdentifier}) async {}

  /// Adds metadata tags to an Amazon RDS resource. These tags can also be used
  /// with cost allocation reporting to track cost associated with Amazon RDS
  /// resources, or used in a Condition statement in an IAM policy for Amazon
  /// RDS.
  ///
  /// For an overview on tagging Amazon RDS resources, see [Tagging Amazon RDS
  /// Resources](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Overview.Tagging.html).
  Future<void> addTagsToResource(
      {@required String resourceName, @required List<Tag> tags}) async {}

  /// Applies a pending maintenance action to a resource (for example, to a DB
  /// instance).
  Future<void> applyPendingMaintenanceAction(
      {@required String resourceIdentifier,
      @required String applyAction,
      @required String optInType}) async {}

  /// Enables ingress to a DBSecurityGroup using one of two forms of
  /// authorization. First, EC2 or VPC security groups can be added to the
  /// DBSecurityGroup if the application using the database is running on EC2 or
  /// VPC instances. Second, IP ranges are available if the application
  /// accessing your database is running on the Internet. Required parameters
  /// for this API are one of CIDR range, EC2SecurityGroupId for VPC, or
  /// (EC2SecurityGroupOwnerId and either EC2SecurityGroupName or
  /// EC2SecurityGroupId for non-VPC).
  ///
  ///  You can't authorize ingress from an EC2 security group in one AWS Region
  /// to an Amazon RDS DB instance in another. You can't authorize ingress from
  /// a VPC security group in one VPC to an Amazon RDS DB instance in another.
  ///
  /// For an overview of CIDR ranges, go to the [Wikipedia
  /// Tutorial](http://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing).
  Future<void> authorizeDBSecurityGroupIngress(String dbSecurityGroupName,
      {String cidrip,
      String ec2SecurityGroupName,
      String ec2SecurityGroupId,
      String ec2SecurityGroupOwnerId}) async {}

  /// Backtracks a DB cluster to a specific time, without creating a new DB
  /// cluster.
  ///
  /// For more information on backtracking, see  [Backtracking an Aurora DB
  /// Cluster](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraMySQL.Managing.Backtrack.html)
  /// in the _Amazon Aurora User Guide._
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
  Future<void> backtrackDBCluster(
      {@required String dbClusterIdentifier,
      @required DateTime backtrackTo,
      bool force,
      bool useEarliestTimeOnPointInTimeUnavailable}) async {}

  /// Copies the specified DB cluster parameter group.
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
  Future<void> copyDBClusterParameterGroup(
      {@required String sourceDBClusterParameterGroupIdentifier,
      @required String targetDBClusterParameterGroupIdentifier,
      @required String targetDBClusterParameterGroupDescription,
      List<Tag> tags}) async {}

  /// Copies a snapshot of a DB cluster.
  ///
  /// To copy a DB cluster snapshot from a shared manual DB cluster snapshot,
  /// `SourceDBClusterSnapshotIdentifier` must be the Amazon Resource Name (ARN)
  /// of the shared DB cluster snapshot.
  ///
  /// You can copy an encrypted DB cluster snapshot from another AWS Region. In
  /// that case, the AWS Region where you call the `CopyDBClusterSnapshot`
  /// action is the destination AWS Region for the encrypted DB cluster snapshot
  /// to be copied to. To copy an encrypted DB cluster snapshot from another AWS
  /// Region, you must provide the following values:
  ///
  /// *    `KmsKeyId` \- The AWS Key Management System (AWS KMS) key identifier
  /// for the key to use to encrypt the copy of the DB cluster snapshot in the
  /// destination AWS Region.
  ///
  /// *    `PreSignedUrl` \- A URL that contains a Signature Version 4 signed
  /// request for the `CopyDBClusterSnapshot` action to be called in the source
  /// AWS Region where the DB cluster snapshot is copied from. The pre-signed
  /// URL must be a valid request for the `CopyDBClusterSnapshot` API action
  /// that can be executed in the source AWS Region that contains the encrypted
  /// DB cluster snapshot to be copied.
  ///
  ///     The pre-signed URL request must contain the following parameter
  /// values:
  ///
  ///     *    `KmsKeyId` \- The KMS key identifier for the key to use to
  /// encrypt the copy of the DB cluster snapshot in the destination AWS Region.
  /// This is the same identifier for both the `CopyDBClusterSnapshot` action
  /// that is called in the destination AWS Region, and the action contained in
  /// the pre-signed URL.
  ///
  ///     *    `DestinationRegion` \- The name of the AWS Region that the DB
  /// cluster snapshot will be created in.
  ///
  ///     *    `SourceDBClusterSnapshotIdentifier` \- The DB cluster snapshot
  /// identifier for the encrypted DB cluster snapshot to be copied. This
  /// identifier must be in the Amazon Resource Name (ARN) format for the source
  /// AWS Region. For example, if you are copying an encrypted DB cluster
  /// snapshot from the us-west-2 AWS Region, then your
  /// `SourceDBClusterSnapshotIdentifier` looks like the following example:
  /// `arn:aws:rds:us-west-2:123456789012:cluster-snapshot:aurora-cluster1-snapshot-20161115`.
  ///
  ///
  ///     To learn how to generate a Signature Version 4 signed request, see
  /// [Authenticating Requests: Using Query Parameters (AWS Signature Version
  /// 4)](https://docs.aws.amazon.com/AmazonS3/latest/API/sigv4-query-string-auth.html)
  /// and  [Signature Version 4 Signing
  /// Process](https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html).
  ///
  /// *    `TargetDBClusterSnapshotIdentifier` \- The identifier for the new
  /// copy of the DB cluster snapshot in the destination AWS Region.
  ///
  /// *    `SourceDBClusterSnapshotIdentifier` \- The DB cluster snapshot
  /// identifier for the encrypted DB cluster snapshot to be copied. This
  /// identifier must be in the ARN format for the source AWS Region and is the
  /// same value as the `SourceDBClusterSnapshotIdentifier` in the pre-signed
  /// URL.
  ///
  ///
  /// To cancel the copy operation once it is in progress, delete the target DB
  /// cluster snapshot identified by `TargetDBClusterSnapshotIdentifier` while
  /// that DB cluster snapshot is in "copying" status.
  ///
  /// For more information on copying encrypted DB cluster snapshots from one
  /// AWS Region to another, see  [Copying a
  /// Snapshot](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_CopySnapshot.html)
  /// in the _Amazon Aurora User Guide._
  ///
  /// For more information on Amazon Aurora, see  [What Is Amazon
  /// Aurora?](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html)
  /// in the _Amazon Aurora User Guide._
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
  Future<void> copyDBClusterSnapshot(
      {@required String sourceDBClusterSnapshotIdentifier,
      @required String targetDBClusterSnapshotIdentifier,
      String kmsKeyId,
      String preSignedUrl,
      bool copyTags,
      List<Tag> tags,
      String sourceRegion}) async {}

  /// Copies the specified DB parameter group.
  Future<void> copyDBParameterGroup(
      {@required String sourceDBParameterGroupIdentifier,
      @required String targetDBParameterGroupIdentifier,
      @required String targetDBParameterGroupDescription,
      List<Tag> tags}) async {}

  /// Copies the specified DB snapshot. The source DB snapshot must be in the
  /// "available" state.
  ///
  /// You can copy a snapshot from one AWS Region to another. In that case, the
  /// AWS Region where you call the `CopyDBSnapshot` action is the destination
  /// AWS Region for the DB snapshot copy.
  ///
  /// For more information about copying snapshots, see [Copying a DB
  /// Snapshot](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_CopyDBSnapshot.html)
  /// in the _Amazon RDS User Guide._
  Future<void> copyDBSnapshot(
      {@required String sourceDBSnapshotIdentifier,
      @required String targetDBSnapshotIdentifier,
      String kmsKeyId,
      List<Tag> tags,
      bool copyTags,
      String preSignedUrl,
      String optionGroupName,
      String sourceRegion}) async {}

  /// Copies the specified option group.
  Future<void> copyOptionGroup(
      {@required String sourceOptionGroupIdentifier,
      @required String targetOptionGroupIdentifier,
      @required String targetOptionGroupDescription,
      List<Tag> tags}) async {}

  /// Creates a new Amazon Aurora DB cluster.
  ///
  /// You can use the `ReplicationSourceIdentifier` parameter to create the DB
  /// cluster as a Read Replica of another DB cluster or Amazon RDS MySQL DB
  /// instance. For cross-region replication where the DB cluster identified by
  /// `ReplicationSourceIdentifier` is encrypted, you must also specify the
  /// `PreSignedUrl` parameter.
  ///
  /// For more information on Amazon Aurora, see  [What Is Amazon
  /// Aurora?](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html)
  /// in the _Amazon Aurora User Guide._
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
  Future<void> createDBCluster(
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
      BigInt backtrackWindow,
      List<String> enableCloudwatchLogsExports,
      String engineMode,
      ScalingConfiguration scalingConfiguration,
      bool deletionProtection,
      String globalClusterIdentifier,
      bool enableHttpEndpoint,
      bool copyTagsToSnapshot,
      String sourceRegion}) async {}

  /// Creates a new custom endpoint and associates it with an Amazon Aurora DB
  /// cluster.
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
  Future<void> createDBClusterEndpoint(
      {@required String dbClusterIdentifier,
      @required String dbClusterEndpointIdentifier,
      @required String endpointType,
      List<String> staticMembers,
      List<String> excludedMembers}) async {}

  /// Creates a new DB cluster parameter group.
  ///
  /// Parameters in a DB cluster parameter group apply to all of the instances
  /// in a DB cluster.
  ///
  ///  A DB cluster parameter group is initially created with the default
  /// parameters for the database engine used by instances in the DB cluster. To
  /// provide custom values for any of the parameters, you must modify the group
  /// after creating it using `ModifyDBClusterParameterGroup`. Once you've
  /// created a DB cluster parameter group, you need to associate it with your
  /// DB cluster using `ModifyDBCluster`. When you associate a new DB cluster
  /// parameter group with a running DB cluster, you need to reboot the DB
  /// instances in the DB cluster without failover for the new DB cluster
  /// parameter group and associated settings to take effect.
  ///
  ///  After you create a DB cluster parameter group, you should wait at least 5
  /// minutes before creating your first DB cluster that uses that DB cluster
  /// parameter group as the default parameter group. This allows Amazon RDS to
  /// fully complete the create action before the DB cluster parameter group is
  /// used as the default for a new DB cluster. This is especially important for
  /// parameters that are critical when creating the default database for a DB
  /// cluster, such as the character set for the default database defined by the
  /// `character\_set\_database` parameter. You can use the _Parameter Groups_
  /// option of the [Amazon RDS console](https://console.aws.amazon.com/rds/) or
  /// the `DescribeDBClusterParameters` action to verify that your DB cluster
  /// parameter group has been created or modified.
  ///
  /// For more information on Amazon Aurora, see  [What Is Amazon
  /// Aurora?](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html)
  /// in the _Amazon Aurora User Guide._
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
  Future<void> createDBClusterParameterGroup(
      {@required String dbClusterParameterGroupName,
      @required String dbParameterGroupFamily,
      @required String description,
      List<Tag> tags}) async {}

  /// Creates a snapshot of a DB cluster. For more information on Amazon Aurora,
  /// see  [What Is Amazon
  /// Aurora?](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html)
  /// in the _Amazon Aurora User Guide._
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
  Future<void> createDBClusterSnapshot(
      {@required String dbClusterSnapshotIdentifier,
      @required String dbClusterIdentifier,
      List<Tag> tags}) async {}

  /// Creates a new DB instance.
  Future<void> createDBInstance(
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
      int performanceInsightsRetentionPeriod,
      List<String> enableCloudwatchLogsExports,
      List<ProcessorFeature> processorFeatures,
      bool deletionProtection,
      int maxAllocatedStorage}) async {}

  /// Creates a new DB instance that acts as a Read Replica for an existing
  /// source DB instance. You can create a Read Replica for a DB instance
  /// running MySQL, MariaDB, Oracle, or PostgreSQL. For more information, see
  /// [Working with Read
  /// Replicas](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_ReadRepl.html)
  /// in the _Amazon RDS User Guide_.
  ///
  /// Amazon Aurora doesn't support this action. You must call the
  /// `CreateDBInstance` action to create a DB instance for an Aurora DB
  /// cluster.
  ///
  /// All Read Replica DB instances are created with backups disabled. All other
  /// DB instance attributes (including DB security groups and DB parameter
  /// groups) are inherited from the source DB instance, except as specified
  /// following.
  ///
  ///
  ///
  /// Your source DB instance must have backup retention enabled.
  Future<void> createDBInstanceReadReplica(
      {@required String dbInstanceIdentifier,
      @required String sourceDBInstanceIdentifier,
      String dbInstanceClass,
      String availabilityZone,
      int port,
      bool multiAZ,
      bool autoMinorVersionUpgrade,
      int iops,
      String optionGroupName,
      String dbParameterGroupName,
      bool publiclyAccessible,
      List<Tag> tags,
      String dbSubnetGroupName,
      List<String> vpcSecurityGroupIds,
      String storageType,
      bool copyTagsToSnapshot,
      int monitoringInterval,
      String monitoringRoleArn,
      String kmsKeyId,
      String preSignedUrl,
      bool enableIamDatabaseAuthentication,
      bool enablePerformanceInsights,
      String performanceInsightsKmsKeyId,
      int performanceInsightsRetentionPeriod,
      List<String> enableCloudwatchLogsExports,
      List<ProcessorFeature> processorFeatures,
      bool useDefaultProcessorFeatures,
      bool deletionProtection,
      String sourceRegion}) async {}

  /// Creates a new DB parameter group.
  ///
  ///  A DB parameter group is initially created with the default parameters for
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
  /// as the default parameter group. This allows Amazon RDS to fully complete
  /// the create action before the parameter group is used as the default for a
  /// new DB instance. This is especially important for parameters that are
  /// critical when creating the default database for a DB instance, such as the
  /// character set for the default database defined by the
  /// `character\_set\_database` parameter. You can use the _Parameter Groups_
  /// option of the [Amazon RDS console](https://console.aws.amazon.com/rds/) or
  /// the _DescribeDBParameters_ command to verify that your DB parameter group
  /// has been created or modified.
  Future<void> createDBParameterGroup(
      {@required String dbParameterGroupName,
      @required String dbParameterGroupFamily,
      @required String description,
      List<Tag> tags}) async {}

  /// Creates a new DB security group. DB security groups control access to a DB
  /// instance.
  ///
  ///
  ///
  /// A DB security group controls access to EC2-Classic DB instances that are
  /// not in a VPC.
  Future<void> createDBSecurityGroup(
      {@required String dbSecurityGroupName,
      @required String dbSecurityGroupDescription,
      List<Tag> tags}) async {}

  /// Creates a DBSnapshot. The source DBInstance must be in "available" state.
  Future<void> createDBSnapshot(
      {@required String dbSnapshotIdentifier,
      @required String dbInstanceIdentifier,
      List<Tag> tags}) async {}

  /// Creates a new DB subnet group. DB subnet groups must contain at least one
  /// subnet in at least two AZs in the AWS Region.
  Future<void> createDBSubnetGroup(
      {@required String dbSubnetGroupName,
      @required String dbSubnetGroupDescription,
      @required List<String> subnetIds,
      List<Tag> tags}) async {}

  /// Creates an RDS event notification subscription. This action requires a
  /// topic ARN (Amazon Resource Name) created by either the RDS console, the
  /// SNS console, or the SNS API. To obtain an ARN with SNS, you must create a
  /// topic in Amazon SNS and subscribe to the topic. The ARN is displayed in
  /// the SNS console.
  ///
  /// You can specify the type of source (SourceType) you want to be notified
  /// of, provide a list of RDS sources (SourceIds) that triggers the events,
  /// and provide a list of event categories (EventCategories) for events you
  /// want to be notified of. For example, you can specify SourceType =
  /// db-instance, SourceIds = mydbinstance1, mydbinstance2 and EventCategories
  /// = Availability, Backup.
  ///
  /// If you specify both the SourceType and SourceIds, such as SourceType =
  /// db-instance and SourceIdentifier = myDBInstance1, you are notified of all
  /// the db-instance events for the specified source. If you specify a
  /// SourceType but do not specify a SourceIdentifier, you receive notice of
  /// the events for that source type for all your RDS sources. If you do not
  /// specify either the SourceType nor the SourceIdentifier, you are notified
  /// of events generated from all RDS sources belonging to your customer
  /// account.
  Future<void> createEventSubscription(
      {@required String subscriptionName,
      @required String snsTopicArn,
      String sourceType,
      List<String> eventCategories,
      List<String> sourceIds,
      bool enabled,
      List<Tag> tags}) async {}

  ///  Creates an Aurora global database spread across multiple regions. The
  /// global database contains a single primary cluster with read-write
  /// capability, and a read-only secondary cluster that receives data from the
  /// primary cluster through high-speed replication performed by the Aurora
  /// storage subsystem.
  ///
  ///  You can create a global database that is initially empty, and then add a
  /// primary cluster and a secondary cluster to it. Or you can specify an
  /// existing Aurora cluster during the create operation, and this cluster
  /// becomes the primary cluster of the global database.
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
  Future<void> createGlobalCluster(
      {String globalClusterIdentifier,
      String sourceDBClusterIdentifier,
      String engine,
      String engineVersion,
      bool deletionProtection,
      String databaseName,
      bool storageEncrypted}) async {}

  /// Creates a new option group. You can create up to 20 option groups.
  Future<void> createOptionGroup(
      {@required String optionGroupName,
      @required String engineName,
      @required String majorEngineVersion,
      @required String optionGroupDescription,
      List<Tag> tags}) async {}

  /// The DeleteDBCluster action deletes a previously provisioned DB cluster.
  /// When you delete a DB cluster, all automated backups for that DB cluster
  /// are deleted and can't be recovered. Manual DB cluster snapshots of the
  /// specified DB cluster are not deleted.
  ///
  /// For more information on Amazon Aurora, see  [What Is Amazon
  /// Aurora?](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html)
  /// in the _Amazon Aurora User Guide._
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
  Future<void> deleteDBCluster(String dbClusterIdentifier,
      {bool skipFinalSnapshot, String finalDBSnapshotIdentifier}) async {}

  /// Deletes a custom endpoint and removes it from an Amazon Aurora DB cluster.
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
  Future<void> deleteDBClusterEndpoint(
      String dbClusterEndpointIdentifier) async {}

  /// Deletes a specified DB cluster parameter group. The DB cluster parameter
  /// group to be deleted can't be associated with any DB clusters.
  ///
  /// For more information on Amazon Aurora, see  [What Is Amazon
  /// Aurora?](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html)
  /// in the _Amazon Aurora User Guide._
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
  Future<void> deleteDBClusterParameterGroup(
      String dbClusterParameterGroupName) async {}

  /// Deletes a DB cluster snapshot. If the snapshot is being copied, the copy
  /// operation is terminated.
  ///
  ///  The DB cluster snapshot must be in the `available` state to be deleted.
  ///
  /// For more information on Amazon Aurora, see  [What Is Amazon
  /// Aurora?](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html)
  /// in the _Amazon Aurora User Guide._
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
  Future<void> deleteDBClusterSnapshot(
      String dbClusterSnapshotIdentifier) async {}

  /// The DeleteDBInstance action deletes a previously provisioned DB instance.
  /// When you delete a DB instance, all automated backups for that instance are
  /// deleted and can't be recovered. Manual DB snapshots of the DB instance to
  /// be deleted by `DeleteDBInstance` are not deleted.
  ///
  ///  If you request a final DB snapshot the status of the Amazon RDS DB
  /// instance is `deleting` until the DB snapshot is created. The API action
  /// `DescribeDBInstance` is used to monitor the status of this operation. The
  /// action can't be canceled or reverted once submitted.
  ///
  /// Note that when a DB instance is in a failure state and has a status of
  /// `failed`, `incompatible-restore`, or `incompatible-network`, you can only
  /// delete it when you skip creation of the final snapshot with the
  /// `SkipFinalSnapshot` parameter.
  ///
  /// If the specified DB instance is part of an Amazon Aurora DB cluster, you
  /// can't delete the DB instance if both of the following conditions are true:
  ///
  /// *   The DB cluster is a Read Replica of another Amazon Aurora DB cluster.
  ///
  /// *   The DB instance is the only instance in the DB cluster.
  ///
  ///
  /// To delete a DB instance in this case, first call the
  /// `PromoteReadReplicaDBCluster` API action to promote the DB cluster so it's
  /// no longer a Read Replica. After the promotion completes, then call the
  /// `DeleteDBInstance` API action to delete the final instance in the DB
  /// cluster.
  Future<void> deleteDBInstance(String dbInstanceIdentifier,
      {bool skipFinalSnapshot,
      String finalDBSnapshotIdentifier,
      bool deleteAutomatedBackups}) async {}

  /// Deletes automated backups based on the source instance's `DbiResourceId`
  /// value or the restorable instance's resource ID.
  Future<void> deleteDBInstanceAutomatedBackup(String dbiResourceId) async {}

  /// Deletes a specified DB parameter group. The DB parameter group to be
  /// deleted can't be associated with any DB instances.
  Future<void> deleteDBParameterGroup(String dbParameterGroupName) async {}

  /// Deletes a DB security group.
  ///
  ///
  ///
  /// The specified DB security group must not be associated with any DB
  /// instances.
  Future<void> deleteDBSecurityGroup(String dbSecurityGroupName) async {}

  /// Deletes a DB snapshot. If the snapshot is being copied, the copy operation
  /// is terminated.
  ///
  ///
  ///
  /// The DB snapshot must be in the `available` state to be deleted.
  Future<void> deleteDBSnapshot(String dbSnapshotIdentifier) async {}

  /// Deletes a DB subnet group.
  ///
  ///
  ///
  /// The specified database subnet group must not be associated with any DB
  /// instances.
  Future<void> deleteDBSubnetGroup(String dbSubnetGroupName) async {}

  /// Deletes an RDS event notification subscription.
  Future<void> deleteEventSubscription(String subscriptionName) async {}

  ///  Deletes a global database cluster. The primary and secondary clusters
  /// must already be detached or destroyed first.
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
  Future<void> deleteGlobalCluster(String globalClusterIdentifier) async {}

  /// Deletes an existing option group.
  Future<void> deleteOptionGroup(String optionGroupName) async {}

  /// Lists all of the attributes for a customer account. The attributes include
  /// Amazon RDS quotas for the account, such as the number of DB instances
  /// allowed. The description for a quota includes the quota name, current
  /// usage toward that quota, and the quota's maximum value.
  ///
  /// This command doesn't take any parameters.
  Future<void> describeAccountAttributes() async {}

  /// Lists the set of CA certificates provided by Amazon RDS for this AWS
  /// account.
  Future<void> describeCertificates(
      {String certificateIdentifier,
      List<Filter> filters,
      int maxRecords,
      String marker}) async {}

  /// Returns information about backtracks for a DB cluster.
  ///
  /// For more information on Amazon Aurora, see  [What Is Amazon
  /// Aurora?](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html)
  /// in the _Amazon Aurora User Guide._
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
  Future<void> describeDBClusterBacktracks(String dbClusterIdentifier,
      {String backtrackIdentifier,
      List<Filter> filters,
      int maxRecords,
      String marker}) async {}

  /// Returns information about endpoints for an Amazon Aurora DB cluster.
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
  Future<void> describeDBClusterEndpoints(
      {String dbClusterIdentifier,
      String dbClusterEndpointIdentifier,
      List<Filter> filters,
      int maxRecords,
      String marker}) async {}

  ///  Returns a list of `DBClusterParameterGroup` descriptions. If a
  /// `DBClusterParameterGroupName` parameter is specified, the list will
  /// contain only the description of the specified DB cluster parameter group.
  ///
  /// For more information on Amazon Aurora, see  [What Is Amazon
  /// Aurora?](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html)
  /// in the _Amazon Aurora User Guide._
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
  Future<void> describeDBClusterParameterGroups(
      {String dbClusterParameterGroupName,
      List<Filter> filters,
      int maxRecords,
      String marker}) async {}

  /// Returns the detailed parameter list for a particular DB cluster parameter
  /// group.
  ///
  /// For more information on Amazon Aurora, see  [What Is Amazon
  /// Aurora?](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html)
  /// in the _Amazon Aurora User Guide._
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
  Future<void> describeDBClusterParameters(String dbClusterParameterGroupName,
      {String source,
      List<Filter> filters,
      int maxRecords,
      String marker}) async {}

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
  /// private, use the `ModifyDBClusterSnapshotAttribute` API action.
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
  Future<void> describeDBClusterSnapshotAttributes(
      String dbClusterSnapshotIdentifier) async {}

  /// Returns information about DB cluster snapshots. This API action supports
  /// pagination.
  ///
  /// For more information on Amazon Aurora, see  [What Is Amazon
  /// Aurora?](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html)
  /// in the _Amazon Aurora User Guide._
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
  Future<void> describeDBClusterSnapshots(
      {String dbClusterIdentifier,
      String dbClusterSnapshotIdentifier,
      String snapshotType,
      List<Filter> filters,
      int maxRecords,
      String marker,
      bool includeShared,
      bool includePublic}) async {}

  /// Returns information about provisioned Aurora DB clusters. This API
  /// supports pagination.
  ///
  /// For more information on Amazon Aurora, see  [What Is Amazon
  /// Aurora?](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html)
  /// in the _Amazon Aurora User Guide._
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
  Future<void> describeDBClusters(
      {String dbClusterIdentifier,
      List<Filter> filters,
      int maxRecords,
      String marker,
      bool includeShared}) async {}

  /// Returns a list of the available DB engines.
  Future<void> describeDBEngineVersions(
      {String engine,
      String engineVersion,
      String dbParameterGroupFamily,
      List<Filter> filters,
      int maxRecords,
      String marker,
      bool defaultOnly,
      bool listSupportedCharacterSets,
      bool listSupportedTimezones,
      bool includeAll}) async {}

  /// Displays backups for both current and deleted instances. For example, use
  /// this operation to find details about automated backups for previously
  /// deleted instances. Current instances with retention periods greater than
  /// zero (0) are returned for both the `DescribeDBInstanceAutomatedBackups`
  /// and `DescribeDBInstances` operations.
  ///
  /// All parameters are optional.
  Future<void> describeDBInstanceAutomatedBackups(
      {String dbiResourceId,
      String dbInstanceIdentifier,
      List<Filter> filters,
      int maxRecords,
      String marker}) async {}

  /// Returns information about provisioned RDS instances. This API supports
  /// pagination.
  Future<void> describeDBInstances(
      {String dbInstanceIdentifier,
      List<Filter> filters,
      int maxRecords,
      String marker}) async {}

  /// Returns a list of DB log files for the DB instance.
  Future<void> describeDBLogFiles(String dbInstanceIdentifier,
      {String filenameContains,
      BigInt fileLastWritten,
      BigInt fileSize,
      List<Filter> filters,
      int maxRecords,
      String marker}) async {}

  ///  Returns a list of `DBParameterGroup` descriptions. If a
  /// `DBParameterGroupName` is specified, the list will contain only the
  /// description of the specified DB parameter group.
  Future<void> describeDBParameterGroups(
      {String dbParameterGroupName,
      List<Filter> filters,
      int maxRecords,
      String marker}) async {}

  /// Returns the detailed parameter list for a particular DB parameter group.
  Future<void> describeDBParameters(String dbParameterGroupName,
      {String source,
      List<Filter> filters,
      int maxRecords,
      String marker}) async {}

  ///  Returns a list of `DBSecurityGroup` descriptions. If a
  /// `DBSecurityGroupName` is specified, the list will contain only the
  /// descriptions of the specified DB security group.
  Future<void> describeDBSecurityGroups(
      {String dbSecurityGroupName,
      List<Filter> filters,
      int maxRecords,
      String marker}) async {}

  /// Returns a list of DB snapshot attribute names and values for a manual DB
  /// snapshot.
  ///
  /// When sharing snapshots with other AWS accounts,
  /// `DescribeDBSnapshotAttributes` returns the `restore` attribute and a list
  /// of IDs for the AWS accounts that are authorized to copy or restore the
  /// manual DB snapshot. If `all` is included in the list of values for the
  /// `restore` attribute, then the manual DB snapshot is public and can be
  /// copied or restored by all AWS accounts.
  ///
  /// To add or remove access for an AWS account to copy or restore a manual DB
  /// snapshot, or to make the manual DB snapshot public or private, use the
  /// `ModifyDBSnapshotAttribute` API action.
  Future<void> describeDBSnapshotAttributes(
      String dbSnapshotIdentifier) async {}

  /// Returns information about DB snapshots. This API action supports
  /// pagination.
  Future<void> describeDBSnapshots(
      {String dbInstanceIdentifier,
      String dbSnapshotIdentifier,
      String snapshotType,
      List<Filter> filters,
      int maxRecords,
      String marker,
      bool includeShared,
      bool includePublic,
      String dbiResourceId}) async {}

  /// Returns a list of DBSubnetGroup descriptions. If a DBSubnetGroupName is
  /// specified, the list will contain only the descriptions of the specified
  /// DBSubnetGroup.
  ///
  /// For an overview of CIDR ranges, go to the [Wikipedia
  /// Tutorial](http://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing).
  Future<void> describeDBSubnetGroups(
      {String dbSubnetGroupName,
      List<Filter> filters,
      int maxRecords,
      String marker}) async {}

  /// Returns the default engine and system parameter information for the
  /// cluster database engine.
  ///
  /// For more information on Amazon Aurora, see  [What Is Amazon
  /// Aurora?](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html)
  /// in the _Amazon Aurora User Guide._
  Future<void> describeEngineDefaultClusterParameters(
      String dbParameterGroupFamily,
      {List<Filter> filters,
      int maxRecords,
      String marker}) async {}

  /// Returns the default engine and system parameter information for the
  /// specified database engine.
  Future<void> describeEngineDefaultParameters(String dbParameterGroupFamily,
      {List<Filter> filters, int maxRecords, String marker}) async {}

  /// Displays a list of categories for all event source types, or, if
  /// specified, for a specified source type. You can see a list of the event
  /// categories and source types in the
  /// [Events](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Events.html)
  /// topic in the _Amazon RDS User Guide._
  Future<void> describeEventCategories(
      {String sourceType, List<Filter> filters}) async {}

  /// Lists all the subscription descriptions for a customer account. The
  /// description for a subscription includes SubscriptionName, SNSTopicARN,
  /// CustomerID, SourceType, SourceID, CreationTime, and Status.
  ///
  /// If you specify a SubscriptionName, lists the description for that
  /// subscription.
  Future<void> describeEventSubscriptions(
      {String subscriptionName,
      List<Filter> filters,
      int maxRecords,
      String marker}) async {}

  /// Returns events related to DB instances, DB security groups, DB snapshots,
  /// and DB parameter groups for the past 14 days. Events specific to a
  /// particular DB instance, DB security group, database snapshot, or DB
  /// parameter group can be obtained by providing the name as a parameter. By
  /// default, the past hour of events are returned.
  Future<void> describeEvents(
      {String sourceIdentifier,
      String sourceType,
      DateTime startTime,
      DateTime endTime,
      int duration,
      List<String> eventCategories,
      List<Filter> filters,
      int maxRecords,
      String marker}) async {}

  ///  Returns information about Aurora global database clusters. This API
  /// supports pagination.
  ///
  ///  For more information on Amazon Aurora, see  [What Is Amazon
  /// Aurora?](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html)
  /// in the _Amazon Aurora User Guide._
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
  Future<void> describeGlobalClusters(
      {String globalClusterIdentifier,
      List<Filter> filters,
      int maxRecords,
      String marker}) async {}

  /// Describes all available options.
  Future<void> describeOptionGroupOptions(String engineName,
      {String majorEngineVersion,
      List<Filter> filters,
      int maxRecords,
      String marker}) async {}

  /// Describes the available option groups.
  Future<void> describeOptionGroups(
      {String optionGroupName,
      List<Filter> filters,
      String marker,
      int maxRecords,
      String engineName,
      String majorEngineVersion}) async {}

  /// Returns a list of orderable DB instance options for the specified engine.
  Future<void> describeOrderableDBInstanceOptions(String engine,
      {String engineVersion,
      String dbInstanceClass,
      String licenseModel,
      bool vpc,
      List<Filter> filters,
      int maxRecords,
      String marker}) async {}

  /// Returns a list of resources (for example, DB instances) that have at least
  /// one pending maintenance action.
  Future<void> describePendingMaintenanceActions(
      {String resourceIdentifier,
      List<Filter> filters,
      String marker,
      int maxRecords}) async {}

  /// Returns information about reserved DB instances for this account, or about
  /// a specified reserved DB instance.
  Future<void> describeReservedDBInstances(
      {String reservedDBInstanceId,
      String reservedDBInstancesOfferingId,
      String dbInstanceClass,
      String duration,
      String productDescription,
      String offeringType,
      bool multiAZ,
      List<Filter> filters,
      int maxRecords,
      String marker}) async {}

  /// Lists available reserved DB instance offerings.
  Future<void> describeReservedDBInstancesOfferings(
      {String reservedDBInstancesOfferingId,
      String dbInstanceClass,
      String duration,
      String productDescription,
      String offeringType,
      bool multiAZ,
      List<Filter> filters,
      int maxRecords,
      String marker}) async {}

  /// Returns a list of the source AWS Regions where the current AWS Region can
  /// create a Read Replica or copy a DB snapshot from. This API action supports
  /// pagination.
  Future<void> describeSourceRegions(
      {String regionName,
      int maxRecords,
      String marker,
      List<Filter> filters}) async {}

  /// You can call `DescribeValidDBInstanceModifications` to learn what
  /// modifications you can make to your DB instance. You can use this
  /// information when you call `ModifyDBInstance`.
  Future<void> describeValidDBInstanceModifications(
      String dbInstanceIdentifier) async {}

  /// Downloads all or a portion of the specified log file, up to 1 MB in size.
  Future<void> downloadDBLogFilePortion(
      {@required String dbInstanceIdentifier,
      @required String logFileName,
      String marker,
      int numberOfLines}) async {}

  /// Forces a failover for a DB cluster.
  ///
  /// A failover for a DB cluster promotes one of the Aurora Replicas (read-only
  /// instances) in the DB cluster to be the primary instance (the cluster
  /// writer).
  ///
  /// Amazon Aurora will automatically fail over to an Aurora Replica, if one
  /// exists, when the primary instance fails. You can force a failover when you
  /// want to simulate a failure of a primary instance for testing. Because each
  /// instance in a DB cluster has its own endpoint address, you will need to
  /// clean up and re-establish any existing connections that use those endpoint
  /// addresses when the failover is complete.
  ///
  /// For more information on Amazon Aurora, see  [What Is Amazon
  /// Aurora?](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html)
  /// in the _Amazon Aurora User Guide._
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
  Future<void> failoverDBCluster(String dbClusterIdentifier,
      {String targetDBInstanceIdentifier}) async {}

  /// Lists all tags on an Amazon RDS resource.
  ///
  /// For an overview on tagging an Amazon RDS resource, see [Tagging Amazon RDS
  /// Resources](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Overview.Tagging.html)
  /// in the _Amazon RDS User Guide_.
  Future<void> listTagsForResource(String resourceName,
      {List<Filter> filters}) async {}

  /// Set the capacity of an Aurora Serverless DB cluster to a specific value.
  ///
  /// Aurora Serverless scales seamlessly based on the workload on the DB
  /// cluster. In some cases, the capacity might not scale fast enough to meet a
  /// sudden change in workload, such as a large number of new transactions.
  /// Call `ModifyCurrentDBClusterCapacity` to set the capacity explicitly.
  ///
  /// After this call sets the DB cluster capacity, Aurora Serverless can
  /// automatically scale the DB cluster based on the cooldown period for
  /// scaling up and the cooldown period for scaling down.
  ///
  /// For more information about Aurora Serverless, see [Using Amazon Aurora
  /// Serverless](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-serverless.html)
  /// in the _Amazon Aurora User Guide_.
  ///
  ///  If you call `ModifyCurrentDBClusterCapacity` with the default
  /// `TimeoutAction`, connections that prevent Aurora Serverless from finding a
  /// scaling point might be dropped. For more information about scaling points,
  /// see  [Autoscaling for Aurora
  /// Serverless](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-serverless.how-it-works.html#aurora-serverless.how-it-works.auto-scaling)
  /// in the _Amazon Aurora User Guide_.
  ///
  /// This action only applies to Aurora DB clusters.
  Future<void> modifyCurrentDBClusterCapacity(String dbClusterIdentifier,
      {int capacity, int secondsBeforeTimeout, String timeoutAction}) async {}

  /// Modify a setting for an Amazon Aurora DB cluster. You can change one or
  /// more database configuration parameters by specifying these parameters and
  /// the new values in the request. For more information on Amazon Aurora, see
  /// [What Is Amazon
  /// Aurora?](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html)
  /// in the _Amazon Aurora User Guide._
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
  Future<void> modifyDBCluster(String dbClusterIdentifier,
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
      BigInt backtrackWindow,
      CloudwatchLogsExportConfiguration cloudwatchLogsExportConfiguration,
      String engineVersion,
      bool allowMajorVersionUpgrade,
      String dbInstanceParameterGroupName,
      ScalingConfiguration scalingConfiguration,
      bool deletionProtection,
      bool enableHttpEndpoint,
      bool copyTagsToSnapshot}) async {}

  /// Modifies the properties of an endpoint in an Amazon Aurora DB cluster.
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
  Future<void> modifyDBClusterEndpoint(String dbClusterEndpointIdentifier,
      {String endpointType,
      List<String> staticMembers,
      List<String> excludedMembers}) async {}

  ///  Modifies the parameters of a DB cluster parameter group. To modify more
  /// than one parameter, submit a list of the following: `ParameterName`,
  /// `ParameterValue`, and `ApplyMethod`. A maximum of 20 parameters can be
  /// modified in a single request.
  ///
  /// For more information on Amazon Aurora, see  [What Is Amazon
  /// Aurora?](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html)
  /// in the _Amazon Aurora User Guide._
  ///
  ///  Changes to dynamic parameters are applied immediately. Changes to static
  /// parameters require a reboot without failover to the DB cluster associated
  /// with the parameter group before the change can take effect.  After you
  /// create a DB cluster parameter group, you should wait at least 5 minutes
  /// before creating your first DB cluster that uses that DB cluster parameter
  /// group as the default parameter group. This allows Amazon RDS to fully
  /// complete the create action before the parameter group is used as the
  /// default for a new DB cluster. This is especially important for parameters
  /// that are critical when creating the default database for a DB cluster,
  /// such as the character set for the default database defined by the
  /// `character\_set\_database` parameter. You can use the _Parameter Groups_
  /// option of the [Amazon RDS console](https://console.aws.amazon.com/rds/) or
  /// the `DescribeDBClusterParameters` action to verify that your DB cluster
  /// parameter group has been created or modified.
  ///
  /// This action only applies to Aurora DB clusters.
  Future<void> modifyDBClusterParameterGroup(
      {@required String dbClusterParameterGroupName,
      @required List<Parameter> parameters}) async {}

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
  /// private, use the `DescribeDBClusterSnapshotAttributes` API action.
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
  Future<void> modifyDBClusterSnapshotAttribute(
      {@required String dbClusterSnapshotIdentifier,
      @required String attributeName,
      List<String> valuesToAdd,
      List<String> valuesToRemove}) async {}

  /// Modifies settings for a DB instance. You can change one or more database
  /// configuration parameters by specifying these parameters and the new values
  /// in the request. To learn what modifications you can make to your DB
  /// instance, call `DescribeValidDBInstanceModifications` before you call
  /// `ModifyDBInstance`.
  Future<void> modifyDBInstance(String dbInstanceIdentifier,
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
      int performanceInsightsRetentionPeriod,
      CloudwatchLogsExportConfiguration cloudwatchLogsExportConfiguration,
      List<ProcessorFeature> processorFeatures,
      bool useDefaultProcessorFeatures,
      bool deletionProtection,
      int maxAllocatedStorage}) async {}

  ///  Modifies the parameters of a DB parameter group. To modify more than one
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
  /// as the default parameter group. This allows Amazon RDS to fully complete
  /// the modify action before the parameter group is used as the default for a
  /// new DB instance. This is especially important for parameters that are
  /// critical when creating the default database for a DB instance, such as the
  /// character set for the default database defined by the
  /// `character\_set\_database` parameter. You can use the _Parameter Groups_
  /// option of the [Amazon RDS console](https://console.aws.amazon.com/rds/) or
  /// the _DescribeDBParameters_ command to verify that your DB parameter group
  /// has been created or modified.
  Future<void> modifyDBParameterGroup(
      {@required String dbParameterGroupName,
      @required List<Parameter> parameters}) async {}

  /// Updates a manual DB snapshot, which can be encrypted or not encrypted,
  /// with a new engine version.
  ///
  /// Amazon RDS supports upgrading DB snapshots for MySQL and Oracle.
  Future<void> modifyDBSnapshot(String dbSnapshotIdentifier,
      {String engineVersion, String optionGroupName}) async {}

  /// Adds an attribute and values to, or removes an attribute and values from,
  /// a manual DB snapshot.
  ///
  /// To share a manual DB snapshot with other AWS accounts, specify `restore`
  /// as the `AttributeName` and use the `ValuesToAdd` parameter to add a list
  /// of IDs of the AWS accounts that are authorized to restore the manual DB
  /// snapshot. Uses the value `all` to make the manual DB snapshot public,
  /// which means it can be copied or restored by all AWS accounts. Do not add
  /// the `all` value for any manual DB snapshots that contain private
  /// information that you don't want available to all AWS accounts. If the
  /// manual DB snapshot is encrypted, it can be shared, but only by specifying
  /// a list of authorized AWS account IDs for the `ValuesToAdd` parameter. You
  /// can't use `all` as a value for that parameter in this case.
  ///
  /// To view which AWS accounts have access to copy or restore a manual DB
  /// snapshot, or whether a manual DB snapshot public or private, use the
  /// `DescribeDBSnapshotAttributes` API action.
  Future<void> modifyDBSnapshotAttribute(
      {@required String dbSnapshotIdentifier,
      @required String attributeName,
      List<String> valuesToAdd,
      List<String> valuesToRemove}) async {}

  /// Modifies an existing DB subnet group. DB subnet groups must contain at
  /// least one subnet in at least two AZs in the AWS Region.
  Future<void> modifyDBSubnetGroup(
      {@required String dbSubnetGroupName,
      String dbSubnetGroupDescription,
      @required List<String> subnetIds}) async {}

  /// Modifies an existing RDS event notification subscription. Note that you
  /// can't modify the source identifiers using this call; to change source
  /// identifiers for a subscription, use the
  /// `AddSourceIdentifierToSubscription` and
  /// `RemoveSourceIdentifierFromSubscription` calls.
  ///
  /// You can see a list of the event categories for a given SourceType in the
  /// [Events](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Events.html)
  /// topic in the _Amazon RDS User Guide_ or by using the
  /// **DescribeEventCategories** action.
  Future<void> modifyEventSubscription(String subscriptionName,
      {String snsTopicArn,
      String sourceType,
      List<String> eventCategories,
      bool enabled}) async {}

  ///  Modify a setting for an Amazon Aurora global cluster. You can change one
  /// or more database configuration parameters by specifying these parameters
  /// and the new values in the request. For more information on Amazon Aurora,
  /// see  [What Is Amazon
  /// Aurora?](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html)
  /// in the _Amazon Aurora User Guide._
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
  Future<void> modifyGlobalCluster(
      {String globalClusterIdentifier,
      String newGlobalClusterIdentifier,
      bool deletionProtection}) async {}

  /// Modifies an existing option group.
  Future<void> modifyOptionGroup(String optionGroupName,
      {List<OptionConfiguration> optionsToInclude,
      List<String> optionsToRemove,
      bool applyImmediately}) async {}

  /// Promotes a Read Replica DB instance to a standalone DB instance.
  ///
  ///
  ///
  /// *   Backup duration is a function of the amount of changes to the database
  /// since the previous backup. If you plan to promote a Read Replica to a
  /// standalone instance, we recommend that you enable backups and complete at
  /// least one backup prior to promotion. In addition, a Read Replica cannot be
  /// promoted to a standalone instance when it is in the `backing-up` status.
  /// If you have enabled backups on your Read Replica, configure the automated
  /// backup window so that daily backups do not interfere with Read Replica
  /// promotion.
  ///
  /// *   This command doesn't apply to Aurora MySQL and Aurora PostgreSQL.
  Future<void> promoteReadReplica(String dbInstanceIdentifier,
      {int backupRetentionPeriod, String preferredBackupWindow}) async {}

  /// Promotes a Read Replica DB cluster to a standalone DB cluster.
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
  Future<void> promoteReadReplicaDBCluster(String dbClusterIdentifier) async {}

  /// Purchases a reserved DB instance offering.
  Future<void> purchaseReservedDBInstancesOffering(
      String reservedDBInstancesOfferingId,
      {String reservedDBInstanceId,
      int dbInstanceCount,
      List<Tag> tags}) async {}

  /// You might need to reboot your DB instance, usually for maintenance
  /// reasons. For example, if you make certain modifications, or if you change
  /// the DB parameter group associated with the DB instance, you must reboot
  /// the instance for the changes to take effect.
  ///
  /// Rebooting a DB instance restarts the database engine service. Rebooting a
  /// DB instance results in a momentary outage, during which the DB instance
  /// status is set to rebooting.
  ///
  /// For more information about rebooting, see [Rebooting a DB
  /// Instance](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_RebootInstance.html)
  /// in the _Amazon RDS User Guide._
  Future<void> rebootDBInstance(String dbInstanceIdentifier,
      {bool forceFailover}) async {}

  ///  Detaches an Aurora secondary cluster from an Aurora global database
  /// cluster. The cluster becomes a standalone cluster with read-write
  /// capability instead of being read-only and receiving data from a primary
  /// cluster in a different region.
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
  Future<void> removeFromGlobalCluster(
      {String globalClusterIdentifier, String dbClusterIdentifier}) async {}

  /// Disassociates an AWS Identity and Access Management (IAM) role from an
  /// Amazon Aurora DB cluster. For more information, see [Authorizing Amazon
  /// Aurora MySQL to Access Other AWS Services on Your
  /// Behalf](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraMySQL.Integrating.Authorizing.html)
  ///  in the _Amazon Aurora User Guide_.
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
  Future<void> removeRoleFromDBCluster(
      {@required String dbClusterIdentifier,
      @required String roleArn,
      String featureName}) async {}

  /// Disassociates an AWS Identity and Access Management (IAM) role from a DB
  /// instance.
  Future<void> removeRoleFromDBInstance(
      {@required String dbInstanceIdentifier,
      @required String roleArn,
      @required String featureName}) async {}

  /// Removes a source identifier from an existing RDS event notification
  /// subscription.
  Future<void> removeSourceIdentifierFromSubscription(
      {@required String subscriptionName,
      @required String sourceIdentifier}) async {}

  /// Removes metadata tags from an Amazon RDS resource.
  ///
  /// For an overview on tagging an Amazon RDS resource, see [Tagging Amazon RDS
  /// Resources](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Overview.Tagging.html)
  /// in the _Amazon RDS User Guide._
  Future<void> removeTagsFromResource(
      {@required String resourceName, @required List<String> tagKeys}) async {}

  ///  Modifies the parameters of a DB cluster parameter group to the default
  /// value. To reset specific parameters submit a list of the following:
  /// `ParameterName` and `ApplyMethod`. To reset the entire DB cluster
  /// parameter group, specify the `DBClusterParameterGroupName` and
  /// `ResetAllParameters` parameters.
  ///
  ///  When resetting the entire group, dynamic parameters are updated
  /// immediately and static parameters are set to `pending-reboot` to take
  /// effect on the next DB instance restart or `RebootDBInstance` request. You
  /// must call `RebootDBInstance` for every DB instance in your DB cluster that
  /// you want the updated static parameter to apply to.
  ///
  /// For more information on Amazon Aurora, see  [What Is Amazon
  /// Aurora?](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html)
  /// in the _Amazon Aurora User Guide._
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
  Future<void> resetDBClusterParameterGroup(String dbClusterParameterGroupName,
      {bool resetAllParameters, List<Parameter> parameters}) async {}

  /// Modifies the parameters of a DB parameter group to the engine/system
  /// default value. To reset specific parameters, provide a list of the
  /// following: `ParameterName` and `ApplyMethod`. To reset the entire DB
  /// parameter group, specify the `DBParameterGroup` name and
  /// `ResetAllParameters` parameters. When resetting the entire group, dynamic
  /// parameters are updated immediately and static parameters are set to
  /// `pending-reboot` to take effect on the next DB instance restart or
  /// `RebootDBInstance` request.
  Future<void> resetDBParameterGroup(String dbParameterGroupName,
      {bool resetAllParameters, List<Parameter> parameters}) async {}

  /// Creates an Amazon Aurora DB cluster from data stored in an Amazon S3
  /// bucket. Amazon RDS must be authorized to access the Amazon S3 bucket and
  /// the data must be created using the Percona XtraBackup utility as described
  /// in  [Migrating Data to an Amazon Aurora MySQL DB
  /// Cluster](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraMySQL.Migrating.html)
  /// in the _Amazon Aurora User Guide_.
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
  Future<void> restoreDBClusterFromS3(
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
      @required String masterUsername,
      @required String masterUserPassword,
      String optionGroupName,
      String preferredBackupWindow,
      String preferredMaintenanceWindow,
      List<Tag> tags,
      bool storageEncrypted,
      String kmsKeyId,
      bool enableIamDatabaseAuthentication,
      @required String sourceEngine,
      @required String sourceEngineVersion,
      @required String s3BucketName,
      String s3Prefix,
      @required String s3IngestionRoleArn,
      BigInt backtrackWindow,
      List<String> enableCloudwatchLogsExports,
      bool deletionProtection,
      bool copyTagsToSnapshot}) async {}

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
  /// For more information on Amazon Aurora, see  [What Is Amazon
  /// Aurora?](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html)
  /// in the _Amazon Aurora User Guide._
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
  Future<void> restoreDBClusterFromSnapshot(
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
      BigInt backtrackWindow,
      List<String> enableCloudwatchLogsExports,
      String engineMode,
      ScalingConfiguration scalingConfiguration,
      String dbClusterParameterGroupName,
      bool deletionProtection,
      bool copyTagsToSnapshot}) async {}

  /// Restores a DB cluster to an arbitrary point in time. Users can restore to
  /// any point in time before `LatestRestorableTime` for up to
  /// `BackupRetentionPeriod` days. The target DB cluster is created from the
  /// source DB cluster with the same configuration as the original DB cluster,
  /// except that the new DB cluster is created with the default DB security
  /// group.
  ///
  ///  This action only restores the DB cluster, not the DB instances for that
  /// DB cluster. You must invoke the `CreateDBInstance` action to create DB
  /// instances for the restored DB cluster, specifying the identifier of the
  /// restored DB cluster in `DBClusterIdentifier`. You can create DB instances
  /// only after the `RestoreDBClusterToPointInTime` action has completed and
  /// the DB cluster is available.
  ///
  /// For more information on Amazon Aurora, see  [What Is Amazon
  /// Aurora?](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html)
  /// in the _Amazon Aurora User Guide._
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
  Future<void> restoreDBClusterToPointInTime(
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
      BigInt backtrackWindow,
      List<String> enableCloudwatchLogsExports,
      String dbClusterParameterGroupName,
      bool deletionProtection,
      bool copyTagsToSnapshot}) async {}

  /// Creates a new DB instance from a DB snapshot. The target database is
  /// created from the source database restore point with the most of original
  /// configuration with the default security group and the default DB parameter
  /// group. By default, the new DB instance is created as a single-AZ
  /// deployment except when the instance is a SQL Server instance that has an
  /// option group that is associated with mirroring; in this case, the instance
  /// becomes a mirrored AZ deployment and not a single-AZ deployment.
  ///
  /// If your intent is to replace your original DB instance with the new,
  /// restored DB instance, then rename your original DB instance before you
  /// call the RestoreDBInstanceFromDBSnapshot action. RDS doesn't allow two DB
  /// instances with the same name. Once you have renamed your original DB
  /// instance with a different identifier, then you can pass the original name
  /// of the DB instance as the DBInstanceIdentifier in the call to the
  /// RestoreDBInstanceFromDBSnapshot action. The result is that you will
  /// replace the original DB instance with the DB instance created from the
  /// snapshot.
  ///
  /// If you are restoring from a shared manual DB snapshot, the
  /// `DBSnapshotIdentifier` must be the ARN of the shared DB snapshot.
  ///
  ///
  ///
  /// This command doesn't apply to Aurora MySQL and Aurora PostgreSQL. For
  /// Aurora, use `RestoreDBClusterFromSnapshot`.
  Future<void> restoreDBInstanceFromDBSnapshot(
      {@required String dbInstanceIdentifier,
      @required String dbSnapshotIdentifier,
      String dbInstanceClass,
      int port,
      String availabilityZone,
      String dbSubnetGroupName,
      bool multiAZ,
      bool publiclyAccessible,
      bool autoMinorVersionUpgrade,
      String licenseModel,
      String dbName,
      String engine,
      int iops,
      String optionGroupName,
      List<Tag> tags,
      String storageType,
      String tdeCredentialArn,
      String tdeCredentialPassword,
      List<String> vpcSecurityGroupIds,
      String domain,
      bool copyTagsToSnapshot,
      String domainIamRoleName,
      bool enableIamDatabaseAuthentication,
      List<String> enableCloudwatchLogsExports,
      List<ProcessorFeature> processorFeatures,
      bool useDefaultProcessorFeatures,
      String dbParameterGroupName,
      bool deletionProtection}) async {}

  /// Amazon Relational Database Service (Amazon RDS) supports importing MySQL
  /// databases by using backup files. You can create a backup of your
  /// on-premises database, store it on Amazon Simple Storage Service (Amazon
  /// S3), and then restore the backup file onto a new Amazon RDS DB instance
  /// running MySQL. For more information, see [Importing Data into an Amazon
  /// RDS MySQL DB
  /// Instance](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/MySQL.Procedural.Importing.html)
  /// in the _Amazon RDS User Guide._
  Future<void> restoreDBInstanceFromS3(
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
      bool publiclyAccessible,
      List<Tag> tags,
      String storageType,
      bool storageEncrypted,
      String kmsKeyId,
      bool copyTagsToSnapshot,
      int monitoringInterval,
      String monitoringRoleArn,
      bool enableIamDatabaseAuthentication,
      @required String sourceEngine,
      @required String sourceEngineVersion,
      @required String s3BucketName,
      String s3Prefix,
      @required String s3IngestionRoleArn,
      bool enablePerformanceInsights,
      String performanceInsightsKmsKeyId,
      int performanceInsightsRetentionPeriod,
      List<String> enableCloudwatchLogsExports,
      List<ProcessorFeature> processorFeatures,
      bool useDefaultProcessorFeatures,
      bool deletionProtection}) async {}

  /// Restores a DB instance to an arbitrary point in time. You can restore to
  /// any point in time before the time identified by the LatestRestorableTime
  /// property. You can restore to a point up to the number of days specified by
  /// the BackupRetentionPeriod property.
  ///
  /// The target database is created with most of the original configuration,
  /// but in a system-selected Availability Zone, with the default security
  /// group, the default subnet group, and the default DB parameter group. By
  /// default, the new DB instance is created as a single-AZ deployment except
  /// when the instance is a SQL Server instance that has an option group that
  /// is associated with mirroring; in this case, the instance becomes a
  /// mirrored deployment and not a single-AZ deployment.
  ///
  ///
  ///
  /// This command doesn't apply to Aurora MySQL and Aurora PostgreSQL. For
  /// Aurora, use `RestoreDBClusterToPointInTime`.
  Future<void> restoreDBInstanceToPointInTime(String targetDBInstanceIdentifier,
      {String sourceDBInstanceIdentifier,
      DateTime restoreTime,
      bool useLatestRestorableTime,
      String dbInstanceClass,
      int port,
      String availabilityZone,
      String dbSubnetGroupName,
      bool multiAZ,
      bool publiclyAccessible,
      bool autoMinorVersionUpgrade,
      String licenseModel,
      String dbName,
      String engine,
      int iops,
      String optionGroupName,
      bool copyTagsToSnapshot,
      List<Tag> tags,
      String storageType,
      String tdeCredentialArn,
      String tdeCredentialPassword,
      List<String> vpcSecurityGroupIds,
      String domain,
      String domainIamRoleName,
      bool enableIamDatabaseAuthentication,
      List<String> enableCloudwatchLogsExports,
      List<ProcessorFeature> processorFeatures,
      bool useDefaultProcessorFeatures,
      String dbParameterGroupName,
      bool deletionProtection,
      String sourceDbiResourceId}) async {}

  /// Revokes ingress from a DBSecurityGroup for previously authorized IP ranges
  /// or EC2 or VPC Security Groups. Required parameters for this API are one of
  /// CIDRIP, EC2SecurityGroupId for VPC, or (EC2SecurityGroupOwnerId and either
  /// EC2SecurityGroupName or EC2SecurityGroupId).
  Future<void> revokeDBSecurityGroupIngress(String dbSecurityGroupName,
      {String cidrip,
      String ec2SecurityGroupName,
      String ec2SecurityGroupId,
      String ec2SecurityGroupOwnerId}) async {}

  /// Starts a database activity stream to monitor activity on the database. For
  /// more information, see [Database Activity
  /// Streams](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/DBActivityStreams.html)
  /// in the _Amazon Aurora User Guide_.
  Future<void> startActivityStream(
      {@required String resourceArn,
      @required String mode,
      @required String kmsKeyId,
      bool applyImmediately}) async {}

  /// Starts an Amazon Aurora DB cluster that was stopped using the AWS console,
  /// the stop-db-cluster AWS CLI command, or the StopDBCluster action.
  ///
  /// For more information, see  [Stopping and Starting an Aurora
  /// Cluster](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-cluster-stop-start.html)
  /// in the _Amazon Aurora User Guide._
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
  Future<void> startDBCluster(String dbClusterIdentifier) async {}

  ///  Starts an Amazon RDS DB instance that was stopped using the AWS console,
  /// the stop-db-instance AWS CLI command, or the StopDBInstance action.
  ///
  /// For more information, see  [Starting an Amazon RDS DB instance That Was
  /// Previously
  /// Stopped](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_StartInstance.html)
  /// in the _Amazon RDS User Guide._
  ///
  ///   This command doesn't apply to Aurora MySQL and Aurora PostgreSQL. For
  /// Aurora DB clusters, use `StartDBCluster` instead.
  Future<void> startDBInstance(String dbInstanceIdentifier) async {}

  /// Stops a database activity stream that was started using the AWS console,
  /// the `start-activity-stream` AWS CLI command, or the `StartActivityStream`
  /// action.
  ///
  /// For more information, see [Database Activity
  /// Streams](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/DBActivityStreams.html)
  /// in the _Amazon Aurora User Guide_.
  Future<void> stopActivityStream(String resourceArn,
      {bool applyImmediately}) async {}

  ///  Stops an Amazon Aurora DB cluster. When you stop a DB cluster, Aurora
  /// retains the DB cluster's metadata, including its endpoints and DB
  /// parameter groups. Aurora also retains the transaction logs so you can do a
  /// point-in-time restore if necessary.
  ///
  /// For more information, see  [Stopping and Starting an Aurora
  /// Cluster](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-cluster-stop-start.html)
  /// in the _Amazon Aurora User Guide._
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
  Future<void> stopDBCluster(String dbClusterIdentifier) async {}

  ///  Stops an Amazon RDS DB instance. When you stop a DB instance, Amazon RDS
  /// retains the DB instance's metadata, including its endpoint, DB parameter
  /// group, and option group membership. Amazon RDS also retains the
  /// transaction logs so you can do a point-in-time restore if necessary.
  ///
  /// For more information, see  [Stopping an Amazon RDS DB Instance
  /// Temporarily](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_StopInstance.html)
  /// in the _Amazon RDS User Guide._
  ///
  ///   This command doesn't apply to Aurora MySQL and Aurora PostgreSQL. For
  /// Aurora clusters, use `StopDBCluster` instead.
  Future<void> stopDBInstance(String dbInstanceIdentifier,
      {String dbSnapshotIdentifier}) async {}
}

class AccountAttributesMessage {}

class AccountQuota {}

class AddSourceIdentifierToSubscriptionResult {}

class ApplyPendingMaintenanceActionResult {}

class AuthorizeDBSecurityGroupIngressResult {}

class AvailabilityZone {}

class AvailableProcessorFeature {}

class Certificate {}

class CertificateMessage {}

class CharacterSet {}

class CloudwatchLogsExportConfiguration {}

class CopyDBClusterParameterGroupResult {}

class CopyDBClusterSnapshotResult {}

class CopyDBParameterGroupResult {}

class CopyDBSnapshotResult {}

class CopyOptionGroupResult {}

class CreateDBClusterParameterGroupResult {}

class CreateDBClusterResult {}

class CreateDBClusterSnapshotResult {}

class CreateDBInstanceReadReplicaResult {}

class CreateDBInstanceResult {}

class CreateDBParameterGroupResult {}

class CreateDBSecurityGroupResult {}

class CreateDBSnapshotResult {}

class CreateDBSubnetGroupResult {}

class CreateEventSubscriptionResult {}

class CreateGlobalClusterResult {}

class CreateOptionGroupResult {}

class DBCluster {}

class DBClusterBacktrack {}

class DBClusterBacktrackMessage {}

class DBClusterCapacityInfo {}

class DBClusterEndpoint {}

class DBClusterEndpointMessage {}

class DBClusterMember {}

class DBClusterMessage {}

class DBClusterOptionGroupStatus {}

class DBClusterParameterGroup {}

class DBClusterParameterGroupDetails {}

class DBClusterParameterGroupNameMessage {}

class DBClusterParameterGroupsMessage {}

class DBClusterRole {}

class DBClusterSnapshot {}

class DBClusterSnapshotAttribute {}

class DBClusterSnapshotAttributesResult {}

class DBClusterSnapshotMessage {}

class DBEngineVersion {}

class DBEngineVersionMessage {}

class DBInstance {}

class DBInstanceAutomatedBackup {}

class DBInstanceAutomatedBackupMessage {}

class DBInstanceMessage {}

class DBInstanceRole {}

class DBInstanceStatusInfo {}

class DBParameterGroup {}

class DBParameterGroupDetails {}

class DBParameterGroupNameMessage {}

class DBParameterGroupStatus {}

class DBParameterGroupsMessage {}

class DBSecurityGroup {}

class DBSecurityGroupMembership {}

class DBSecurityGroupMessage {}

class DBSnapshot {}

class DBSnapshotAttribute {}

class DBSnapshotAttributesResult {}

class DBSnapshotMessage {}

class DBSubnetGroup {}

class DBSubnetGroupMessage {}

class DeleteDBClusterResult {}

class DeleteDBClusterSnapshotResult {}

class DeleteDBInstanceAutomatedBackupResult {}

class DeleteDBInstanceResult {}

class DeleteDBSnapshotResult {}

class DeleteEventSubscriptionResult {}

class DeleteGlobalClusterResult {}

class DescribeDBClusterSnapshotAttributesResult {}

class DescribeDBLogFilesDetails {}

class DescribeDBLogFilesResponse {}

class DescribeDBSnapshotAttributesResult {}

class DescribeEngineDefaultClusterParametersResult {}

class DescribeEngineDefaultParametersResult {}

class DescribeValidDBInstanceModificationsResult {}

class DomainMembership {}

class DoubleRange {}

class DownloadDBLogFilePortionDetails {}

class Ec2SecurityGroup {}

class Endpoint {}

class EngineDefaults {}

class Event {}

class EventCategoriesMap {}

class EventCategoriesMessage {}

class EventSubscription {}

class EventSubscriptionsMessage {}

class EventsMessage {}

class FailoverDBClusterResult {}

class Filter {}

class GlobalCluster {}

class GlobalClusterMember {}

class GlobalClustersMessage {}

class IPRange {}

class MinimumEngineVersionPerAllowedValue {}

class ModifyDBClusterResult {}

class ModifyDBClusterSnapshotAttributeResult {}

class ModifyDBInstanceResult {}

class ModifyDBSnapshotAttributeResult {}

class ModifyDBSnapshotResult {}

class ModifyDBSubnetGroupResult {}

class ModifyEventSubscriptionResult {}

class ModifyGlobalClusterResult {}

class ModifyOptionGroupResult {}

class Option {}

class OptionConfiguration {}

class OptionGroup {}

class OptionGroupMembership {}

class OptionGroupOption {}

class OptionGroupOptionSetting {}

class OptionGroupOptionsMessage {}

class OptionGroups {}

class OptionSetting {}

class OptionVersion {}

class OrderableDBInstanceOption {}

class OrderableDBInstanceOptionsMessage {}

class Parameter {}

class PendingCloudwatchLogsExports {}

class PendingMaintenanceAction {}

class PendingMaintenanceActionsMessage {}

class PendingModifiedValues {}

class ProcessorFeature {}

class PromoteReadReplicaDBClusterResult {}

class PromoteReadReplicaResult {}

class PurchaseReservedDBInstancesOfferingResult {}

class Range {}

class RebootDBInstanceResult {}

class RecurringCharge {}

class RemoveFromGlobalClusterResult {}

class RemoveSourceIdentifierFromSubscriptionResult {}

class ReservedDBInstance {}

class ReservedDBInstanceMessage {}

class ReservedDBInstancesOffering {}

class ReservedDBInstancesOfferingMessage {}

class ResourcePendingMaintenanceActions {}

class RestoreDBClusterFromS3Result {}

class RestoreDBClusterFromSnapshotResult {}

class RestoreDBClusterToPointInTimeResult {}

class RestoreDBInstanceFromDBSnapshotResult {}

class RestoreDBInstanceFromS3Result {}

class RestoreDBInstanceToPointInTimeResult {}

class RestoreWindow {}

class RevokeDBSecurityGroupIngressResult {}

class ScalingConfiguration {}

class ScalingConfigurationInfo {}

class SourceRegion {}

class SourceRegionMessage {}

class StartActivityStreamResponse {}

class StartDBClusterResult {}

class StartDBInstanceResult {}

class StopActivityStreamResponse {}

class StopDBClusterResult {}

class StopDBInstanceResult {}

class Subnet {}

class Tag {}

class TagListMessage {}

class Timezone {}

class UpgradeTarget {}

class ValidDBInstanceModificationsMessage {}

class ValidStorageOptions {}

class VpcSecurityGroupMembership {}