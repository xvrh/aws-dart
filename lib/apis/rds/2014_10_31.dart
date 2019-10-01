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
/// *   For the alphabetical list of API actions, see
/// [API Actions](https://docs.aws.amazon.com/AmazonRDS/latest/APIReference/API_Operations.html).
///
/// *   For the alphabetical list of data types, see
/// [Data Types](https://docs.aws.amazon.com/AmazonRDS/latest/APIReference/API_Types.html).
///
/// *   For a list of common query parameters, see
/// [Common Parameters](https://docs.aws.amazon.com/AmazonRDS/latest/APIReference/CommonParameters.html).
///
/// *   For descriptions of the error codes, see
/// [Common Errors](https://docs.aws.amazon.com/AmazonRDS/latest/APIReference/CommonErrors.html).
///
///
///  **Amazon RDS User Guide**
///
/// *   For a summary of the Amazon RDS interfaces, see
/// [Available RDS Interfaces](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Welcome.html#Welcome.Interfaces).
///
/// *   For more information about how to use the Query API, see
/// [Using the Query API](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Using_the_Query_API.html).
class RdsApi {
  /// Associates an Identity and Access Management (IAM) role from an Amazon
  /// Aurora DB cluster. For more information, see
  /// [Authorizing Amazon Aurora MySQL to Access Other AWS Services on Your Behalf](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraMySQL.Integrating.Authorizing.html)
  /// in the _Amazon Aurora User Guide_.
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
  ///
  /// [dbClusterIdentifier]: The name of the DB cluster to associate the IAM
  /// role with.
  ///
  /// [roleArn]: The Amazon Resource Name (ARN) of the IAM role to associate
  /// with the Aurora DB cluster, for example
  /// `arn:aws:iam::123456789012:role/AuroraAccessRole`.
  ///
  /// [featureName]: The name of the feature for the DB cluster that the IAM
  /// role is to be associated with. For the list of supported feature names,
  /// see DBEngineVersion.
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
  ///
  /// [dbInstanceIdentifier]: The name of the DB instance to associate the IAM
  /// role with.
  ///
  /// [roleArn]: The Amazon Resource Name (ARN) of the IAM role to associate
  /// with the DB instance, for example
  /// `arn:aws:iam::123456789012:role/AccessRole`.
  ///
  /// [featureName]: The name of the feature for the DB instance that the IAM
  /// role is to be associated with. For the list of supported feature names,
  /// see `DBEngineVersion`.
  Future<void> addRoleToDBInstance(
      {@required String dbInstanceIdentifier,
      @required String roleArn,
      @required String featureName}) async {}

  /// Adds a source identifier to an existing RDS event notification
  /// subscription.
  ///
  /// [subscriptionName]: The name of the RDS event notification subscription
  /// you want to add a source identifier to.
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
    return AddSourceIdentifierToSubscriptionResult.fromJson({});
  }

  /// Adds metadata tags to an Amazon RDS resource. These tags can also be used
  /// with cost allocation reporting to track cost associated with Amazon RDS
  /// resources, or used in a Condition statement in an IAM policy for Amazon
  /// RDS.
  ///
  /// For an overview on tagging Amazon RDS resources, see
  /// [Tagging Amazon RDS Resources](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Overview.Tagging.html).
  ///
  /// [resourceName]: The Amazon RDS resource that the tags are added to. This
  /// value is an Amazon Resource Name (ARN). For information about creating an
  /// ARN, see
  /// [Constructing an RDS Amazon Resource Name (ARN)](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Tagging.ARN.html#USER_Tagging.ARN.Constructing).
  ///
  /// [tags]: The tags to be assigned to the Amazon RDS resource.
  Future<void> addTagsToResource(
      {@required String resourceName, @required List<Tag> tags}) async {}

  /// Applies a pending maintenance action to a resource (for example, to a DB
  /// instance).
  ///
  /// [resourceIdentifier]: The RDS Amazon Resource Name (ARN) of the resource
  /// that the pending maintenance action applies to. For information about
  /// creating an ARN, see
  /// [Constructing an RDS Amazon Resource Name (ARN)](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Tagging.ARN.html#USER_Tagging.ARN.Constructing).
  ///
  /// [applyAction]: The pending maintenance action to apply to this resource.
  ///
  /// Valid values: `system-update`, `db-upgrade`, `hardware-maintenance`
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
    return ApplyPendingMaintenanceActionResult.fromJson({});
  }

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
  /// For an overview of CIDR ranges, go to the
  /// [Wikipedia Tutorial](http://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing).
  ///
  /// [dbSecurityGroupName]: The name of the DB security group to add
  /// authorization to.
  ///
  /// [cidrip]: The IP range to authorize.
  ///
  /// [ec2SecurityGroupName]:  Name of the EC2 security group to authorize. For
  /// VPC DB security groups, `EC2SecurityGroupId` must be provided. Otherwise,
  /// `EC2SecurityGroupOwnerId` and either `EC2SecurityGroupName` or
  /// `EC2SecurityGroupId` must be provided.
  ///
  /// [ec2SecurityGroupId]:  Id of the EC2 security group to authorize. For VPC
  /// DB security groups, `EC2SecurityGroupId` must be provided. Otherwise,
  /// `EC2SecurityGroupOwnerId` and either `EC2SecurityGroupName` or
  /// `EC2SecurityGroupId` must be provided.
  ///
  /// [ec2SecurityGroupOwnerId]:  AWS account number of the owner of the EC2
  /// security group specified in the `EC2SecurityGroupName` parameter. The AWS
  /// Access Key ID is not an acceptable value. For VPC DB security groups,
  /// `EC2SecurityGroupId` must be provided. Otherwise,
  /// `EC2SecurityGroupOwnerId` and either `EC2SecurityGroupName` or
  /// `EC2SecurityGroupId` must be provided.
  Future<AuthorizeDBSecurityGroupIngressResult> authorizeDBSecurityGroupIngress(
      String dbSecurityGroupName,
      {String cidrip,
      String ec2SecurityGroupName,
      String ec2SecurityGroupId,
      String ec2SecurityGroupOwnerId}) async {
    return AuthorizeDBSecurityGroupIngressResult.fromJson({});
  }

  /// Backtracks a DB cluster to a specific time, without creating a new DB
  /// cluster.
  ///
  /// For more information on backtracking, see
  /// [Backtracking an Aurora DB Cluster](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraMySQL.Managing.Backtrack.html)
  /// in the _Amazon Aurora User Guide._
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
  ///
  /// [dbClusterIdentifier]: The DB cluster identifier of the DB cluster to be
  /// backtracked. This parameter is stored as a lowercase string.
  ///
  /// Constraints:
  ///
  /// *   Must contain from 1 to 63 alphanumeric characters or hyphens.
  ///
  /// *   First character must be a letter.
  ///
  /// *   Can't end with a hyphen or contain two consecutive hyphens.
  ///
  ///
  /// Example: `my-cluster1`
  ///
  /// [backtrackTo]: The timestamp of the time to backtrack the DB cluster to,
  /// specified in ISO 8601 format. For more information about ISO 8601, see the
  /// [ISO8601 Wikipedia page.](http://en.wikipedia.org/wiki/ISO_8601)
  ///
  ///  If the specified time is not a consistent time for the DB cluster, Aurora
  /// automatically chooses the nearest possible consistent time for the DB
  /// cluster.
  ///
  /// Constraints:
  ///
  /// *   Must contain a valid ISO 8601 timestamp.
  ///
  /// *   Can't contain a timestamp set in the future.
  ///
  ///
  /// Example: `2017-07-08T18:00Z`
  ///
  /// [force]: A value that indicates whether to force the DB cluster to
  /// backtrack when binary logging is enabled. Otherwise, an error occurs when
  /// binary logging is enabled.
  ///
  /// [useEarliestTimeOnPointInTimeUnavailable]: A value that indicates whether
  /// to backtrack the DB cluster to the earliest possible backtrack time when
  /// _BacktrackTo_ is set to a timestamp earlier than the earliest backtrack
  /// time. When this parameter is disabled and _BacktrackTo_ is set to a
  /// timestamp earlier than the earliest backtrack time, an error occurs.
  Future<DBClusterBacktrack> backtrackDBCluster(
      {@required String dbClusterIdentifier,
      @required DateTime backtrackTo,
      bool force,
      bool useEarliestTimeOnPointInTimeUnavailable}) async {
    return DBClusterBacktrack.fromJson({});
  }

  /// Copies the specified DB cluster parameter group.
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
  ///
  /// [sourceDBClusterParameterGroupIdentifier]: The identifier or Amazon
  /// Resource Name (ARN) for the source DB cluster parameter group. For
  /// information about creating an ARN, see
  /// [Constructing an ARN for Amazon RDS](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_Tagging.ARN.html#USER_Tagging.ARN.Constructing)
  /// in the _Amazon Aurora User Guide_.
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
  /// *   Can't be null, empty, or blank
  ///
  /// *   Must contain from 1 to 255 letters, numbers, or hyphens
  ///
  /// *   First character must be a letter
  ///
  /// *   Can't end with a hyphen or contain two consecutive hyphens
  ///
  ///
  /// Example: `my-cluster-param-group1`
  ///
  /// [targetDBClusterParameterGroupDescription]: A description for the copied
  /// DB cluster parameter group.
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
  /// You can copy an encrypted DB cluster snapshot from another AWS Region. In
  /// that case, the AWS Region where you call the `CopyDBClusterSnapshot`
  /// action is the destination AWS Region for the encrypted DB cluster snapshot
  /// to be copied to. To copy an encrypted DB cluster snapshot from another AWS
  /// Region, you must provide the following values:
  ///
  /// *    `KmsKeyId` - The AWS Key Management System (AWS KMS) key identifier
  /// for the key to use to encrypt the copy of the DB cluster snapshot in the
  /// destination AWS Region.
  ///
  /// *    `PreSignedUrl` - A URL that contains a Signature Version 4 signed
  /// request for the `CopyDBClusterSnapshot` action to be called in the source
  /// AWS Region where the DB cluster snapshot is copied from. The pre-signed
  /// URL must be a valid request for the `CopyDBClusterSnapshot` API action
  /// that can be executed in the source AWS Region that contains the encrypted
  /// DB cluster snapshot to be copied.
  ///
  ///     The pre-signed URL request must contain the following parameter
  /// values:
  ///
  ///     *    `KmsKeyId` - The KMS key identifier for the key to use to encrypt
  /// the copy of the DB cluster snapshot in the destination AWS Region. This is
  /// the same identifier for both the `CopyDBClusterSnapshot` action that is
  /// called in the destination AWS Region, and the action contained in the
  /// pre-signed URL.
  ///
  ///     *    `DestinationRegion` - The name of the AWS Region that the DB
  /// cluster snapshot will be created in.
  ///
  ///     *    `SourceDBClusterSnapshotIdentifier` - The DB cluster snapshot
  /// identifier for the encrypted DB cluster snapshot to be copied. This
  /// identifier must be in the Amazon Resource Name (ARN) format for the source
  /// AWS Region. For example, if you are copying an encrypted DB cluster
  /// snapshot from the us-west-2 AWS Region, then your
  /// `SourceDBClusterSnapshotIdentifier` looks like the following example:
  /// `arn:aws:rds:us-west-2:123456789012:cluster-snapshot:aurora-cluster1-snapshot-20161115`.
  ///
  ///
  ///     To learn how to generate a Signature Version 4 signed request, see
  /// [Authenticating Requests: Using Query Parameters (AWS Signature Version 4)](https://docs.aws.amazon.com/AmazonS3/latest/API/sigv4-query-string-auth.html)
  /// and
  /// [Signature Version 4 Signing Process](https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html).
  ///
  /// *    `TargetDBClusterSnapshotIdentifier` - The identifier for the new copy
  /// of the DB cluster snapshot in the destination AWS Region.
  ///
  /// *    `SourceDBClusterSnapshotIdentifier` - The DB cluster snapshot
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
  /// AWS Region to another, see
  /// [Copying a Snapshot](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_CopySnapshot.html)
  /// in the _Amazon Aurora User Guide._
  ///
  /// For more information on Amazon Aurora, see
  /// [What Is Amazon Aurora?](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html)
  /// in the _Amazon Aurora User Guide._
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
  ///
  /// [sourceDBClusterSnapshotIdentifier]: The identifier of the DB cluster
  /// snapshot to copy. This parameter is not case-sensitive.
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
  /// specify a valid DB cluster snapshot ARN. For more information, go to
  /// [Copying Snapshots Across AWS Regions](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_CopySnapshot.html#USER_CopySnapshot.AcrossRegions)
  /// in the _Amazon Aurora User Guide._
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
  /// *   Can't end with a hyphen or contain two consecutive hyphens.
  ///
  ///
  /// Example: `my-cluster-snapshot2`
  ///
  /// [kmsKeyId]: The AWS AWS KMS key ID for an encrypted DB cluster snapshot.
  /// The KMS key ID is the Amazon Resource Name (ARN), KMS key identifier, or
  /// the KMS key alias for the KMS encryption key.
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
  /// To copy an encrypted DB cluster snapshot to another AWS Region, you must
  /// set `KmsKeyId` to the KMS key ID you want to use to encrypt the copy of
  /// the DB cluster snapshot in the destination AWS Region. KMS encryption keys
  /// are specific to the AWS Region that they are created in, and you can't use
  /// encryption keys from one AWS Region in another AWS Region.
  ///
  /// If you copy an unencrypted DB cluster snapshot and specify a value for the
  /// `KmsKeyId` parameter, an error is returned.
  ///
  /// [preSignedUrl]: The URL that contains a Signature Version 4 signed request
  /// for the `CopyDBClusterSnapshot` API action in the AWS Region that contains
  /// the source DB cluster snapshot to copy. The `PreSignedUrl` parameter must
  /// be used when copying an encrypted DB cluster snapshot from another AWS
  /// Region.
  ///
  /// The pre-signed URL must be a valid request for the
  /// `CopyDBSClusterSnapshot` API action that can be executed in the source AWS
  /// Region that contains the encrypted DB cluster snapshot to be copied. The
  /// pre-signed URL request must contain the following parameter values:
  ///
  /// *    `KmsKeyId` - The AWS KMS key identifier for the key to use to encrypt
  /// the copy of the DB cluster snapshot in the destination AWS Region. This is
  /// the same identifier for both the `CopyDBClusterSnapshot` action that is
  /// called in the destination AWS Region, and the action contained in the
  /// pre-signed URL.
  ///
  /// *    `DestinationRegion` - The name of the AWS Region that the DB cluster
  /// snapshot will be created in.
  ///
  /// *    `SourceDBClusterSnapshotIdentifier` - The DB cluster snapshot
  /// identifier for the encrypted DB cluster snapshot to be copied. This
  /// identifier must be in the Amazon Resource Name (ARN) format for the source
  /// AWS Region. For example, if you are copying an encrypted DB cluster
  /// snapshot from the us-west-2 AWS Region, then your
  /// `SourceDBClusterSnapshotIdentifier` looks like the following example:
  /// `arn:aws:rds:us-west-2:123456789012:cluster-snapshot:aurora-cluster1-snapshot-20161115`.
  ///
  ///
  /// To learn how to generate a Signature Version 4 signed request, see
  /// [Authenticating Requests: Using Query Parameters (AWS Signature Version 4)](https://docs.aws.amazon.com/AmazonS3/latest/API/sigv4-query-string-auth.html)
  /// and
  /// [Signature Version 4 Signing Process](https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html).
  ///
  /// If you supply a value for this operation's `SourceRegion` parameter, a
  /// pre-signed URL will be calculated on your behalf.
  ///
  /// [copyTags]: A value that indicates whether to copy all tags from the
  /// source DB cluster snapshot to the target DB cluster snapshot. By default,
  /// tags are not copied.
  ///
  /// [sourceRegion]: The ID of the region that contains the snapshot to be
  /// copied.
  Future<CopyDBClusterSnapshotResult> copyDBClusterSnapshot(
      {@required String sourceDBClusterSnapshotIdentifier,
      @required String targetDBClusterSnapshotIdentifier,
      String kmsKeyId,
      String preSignedUrl,
      bool copyTags,
      List<Tag> tags,
      String sourceRegion}) async {
    return CopyDBClusterSnapshotResult.fromJson({});
  }

  /// Copies the specified DB parameter group.
  ///
  /// [sourceDBParameterGroupIdentifier]:  The identifier or ARN for the source
  /// DB parameter group. For information about creating an ARN, see
  /// [Constructing an ARN for Amazon RDS](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Tagging.ARN.html#USER_Tagging.ARN.Constructing)
  /// in the _Amazon RDS User Guide_.
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
  /// *   Can't be null, empty, or blank
  ///
  /// *   Must contain from 1 to 255 letters, numbers, or hyphens
  ///
  /// *   First character must be a letter
  ///
  /// *   Can't end with a hyphen or contain two consecutive hyphens
  ///
  ///
  /// Example: `my-db-parameter-group`
  ///
  /// [targetDBParameterGroupDescription]: A description for the copied DB
  /// parameter group.
  Future<CopyDBParameterGroupResult> copyDBParameterGroup(
      {@required String sourceDBParameterGroupIdentifier,
      @required String targetDBParameterGroupIdentifier,
      @required String targetDBParameterGroupDescription,
      List<Tag> tags}) async {
    return CopyDBParameterGroupResult.fromJson({});
  }

  /// Copies the specified DB snapshot. The source DB snapshot must be in the
  /// "available" state.
  ///
  /// You can copy a snapshot from one AWS Region to another. In that case, the
  /// AWS Region where you call the `CopyDBSnapshot` action is the destination
  /// AWS Region for the DB snapshot copy.
  ///
  /// For more information about copying snapshots, see
  /// [Copying a DB Snapshot](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_CopyDBSnapshot.html)
  /// in the _Amazon RDS User Guide._
  ///
  /// [sourceDBSnapshotIdentifier]: The identifier for the source DB snapshot.
  ///
  /// If the source snapshot is in the same AWS Region as the copy, specify a
  /// valid DB snapshot identifier. For example, you might specify
  /// `rds:mysql-instance1-snapshot-20130805`.
  ///
  /// If the source snapshot is in a different AWS Region than the copy, specify
  /// a valid DB snapshot ARN. For example, you might specify
  /// `arn:aws:rds:us-west-2:123456789012:snapshot:mysql-instance1-snapshot-20130805`.
  ///
  /// If you are copying from a shared manual DB snapshot, this parameter must
  /// be the Amazon Resource Name (ARN) of the shared DB snapshot.
  ///
  /// If you are copying an encrypted snapshot this parameter must be in the ARN
  /// format for the source AWS Region, and must match the
  /// `SourceDBSnapshotIdentifier` in the `PreSignedUrl` parameter.
  ///
  /// Constraints:
  ///
  /// *   Must specify a valid system snapshot in the "available" state.
  ///
  ///
  /// Example: `rds:mydb-2012-04-02-00-01`
  ///
  /// Example:
  /// `arn:aws:rds:us-west-2:123456789012:snapshot:mysql-instance1-snapshot-20130805`
  ///
  /// [targetDBSnapshotIdentifier]: The identifier for the copy of the snapshot.
  ///
  /// Constraints:
  ///
  /// *   Can't be null, empty, or blank
  ///
  /// *   Must contain from 1 to 255 letters, numbers, or hyphens
  ///
  /// *   First character must be a letter
  ///
  /// *   Can't end with a hyphen or contain two consecutive hyphens
  ///
  ///
  /// Example: `my-db-snapshot`
  ///
  /// [kmsKeyId]: The AWS KMS key ID for an encrypted DB snapshot. The KMS key
  /// ID is the Amazon Resource Name (ARN), KMS key identifier, or the KMS key
  /// alias for the KMS encryption key.
  ///
  /// If you copy an encrypted DB snapshot from your AWS account, you can
  /// specify a value for this parameter to encrypt the copy with a new KMS
  /// encryption key. If you don't specify a value for this parameter, then the
  /// copy of the DB snapshot is encrypted with the same KMS key as the source
  /// DB snapshot.
  ///
  /// If you copy an encrypted DB snapshot that is shared from another AWS
  /// account, then you must specify a value for this parameter.
  ///
  /// If you specify this parameter when you copy an unencrypted snapshot, the
  /// copy is encrypted.
  ///
  /// If you copy an encrypted snapshot to a different AWS Region, then you must
  /// specify a KMS key for the destination AWS Region. KMS encryption keys are
  /// specific to the AWS Region that they are created in, and you can't use
  /// encryption keys from one AWS Region in another AWS Region.
  ///
  /// [copyTags]: A value that indicates whether to copy all tags from the
  /// source DB snapshot to the target DB snapshot. By default, tags are not
  /// copied.
  ///
  /// [preSignedUrl]: The URL that contains a Signature Version 4 signed request
  /// for the `CopyDBSnapshot` API action in the source AWS Region that contains
  /// the source DB snapshot to copy.
  ///
  /// You must specify this parameter when you copy an encrypted DB snapshot
  /// from another AWS Region by using the Amazon RDS API. You can specify the
  /// `--source-region` option instead of this parameter when you copy an
  /// encrypted DB snapshot from another AWS Region by using the AWS CLI.
  ///
  /// The presigned URL must be a valid request for the `CopyDBSnapshot` API
  /// action that can be executed in the source AWS Region that contains the
  /// encrypted DB snapshot to be copied. The presigned URL request must contain
  /// the following parameter values:
  ///
  /// *    `DestinationRegion` - The AWS Region that the encrypted DB snapshot
  /// is copied to. This AWS Region is the same one where the `CopyDBSnapshot`
  /// action is called that contains this presigned URL.
  ///
  ///     For example, if you copy an encrypted DB snapshot from the us-west-2
  /// AWS Region to the us-east-1 AWS Region, then you call the `CopyDBSnapshot`
  /// action in the us-east-1 AWS Region and provide a presigned URL that
  /// contains a call to the `CopyDBSnapshot` action in the us-west-2 AWS
  /// Region. For this example, the `DestinationRegion` in the presigned URL
  /// must be set to the us-east-1 AWS Region.
  ///
  /// *    `KmsKeyId` - The AWS KMS key identifier for the key to use to encrypt
  /// the copy of the DB snapshot in the destination AWS Region. This is the
  /// same identifier for both the `CopyDBSnapshot` action that is called in the
  /// destination AWS Region, and the action contained in the presigned URL.
  ///
  /// *    `SourceDBSnapshotIdentifier` - The DB snapshot identifier for the
  /// encrypted snapshot to be copied. This identifier must be in the Amazon
  /// Resource Name (ARN) format for the source AWS Region. For example, if you
  /// are copying an encrypted DB snapshot from the us-west-2 AWS Region, then
  /// your `SourceDBSnapshotIdentifier` looks like the following example:
  /// `arn:aws:rds:us-west-2:123456789012:snapshot:mysql-instance1-snapshot-20161115`.
  ///
  ///
  /// To learn how to generate a Signature Version 4 signed request, see
  /// [Authenticating Requests: Using Query Parameters (AWS Signature Version 4)](https://docs.aws.amazon.com/AmazonS3/latest/API/sigv4-query-string-auth.html)
  /// and
  /// [Signature Version 4 Signing Process](https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html).
  ///
  /// If you supply a value for this operation's `SourceRegion` parameter, a
  /// pre-signed URL will be calculated on your behalf.
  ///
  /// [optionGroupName]: The name of an option group to associate with the copy
  /// of the snapshot.
  ///
  /// Specify this option if you are copying a snapshot from one AWS Region to
  /// another, and your DB instance uses a nondefault option group. If your
  /// source DB instance uses Transparent Data Encryption for Oracle or
  /// Microsoft SQL Server, you must specify this option when copying across AWS
  /// Regions. For more information, see
  /// [Option Group Considerations](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_CopySnapshot.html#USER_CopySnapshot.Options)
  /// in the _Amazon RDS User Guide._
  ///
  /// [sourceRegion]: The ID of the region that contains the snapshot to be
  /// copied.
  Future<CopyDBSnapshotResult> copyDBSnapshot(
      {@required String sourceDBSnapshotIdentifier,
      @required String targetDBSnapshotIdentifier,
      String kmsKeyId,
      List<Tag> tags,
      bool copyTags,
      String preSignedUrl,
      String optionGroupName,
      String sourceRegion}) async {
    return CopyDBSnapshotResult.fromJson({});
  }

  /// Copies the specified option group.
  ///
  /// [sourceOptionGroupIdentifier]: The identifier or ARN for the source option
  /// group. For information about creating an ARN, see
  /// [Constructing an ARN for Amazon RDS](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Tagging.ARN.html#USER_Tagging.ARN.Constructing)
  /// in the _Amazon RDS User Guide_.
  ///
  /// Constraints:
  ///
  /// *   Must specify a valid option group.
  ///
  /// *   If the source option group is in the same AWS Region as the copy,
  /// specify a valid option group identifier, for example `my-option-group`, or
  /// a valid ARN.
  ///
  /// *   If the source option group is in a different AWS Region than the copy,
  /// specify a valid option group ARN, for example
  /// `arn:aws:rds:us-west-2:123456789012:og:special-options`.
  ///
  /// [targetOptionGroupIdentifier]: The identifier for the copied option group.
  ///
  /// Constraints:
  ///
  /// *   Can't be null, empty, or blank
  ///
  /// *   Must contain from 1 to 255 letters, numbers, or hyphens
  ///
  /// *   First character must be a letter
  ///
  /// *   Can't end with a hyphen or contain two consecutive hyphens
  ///
  ///
  /// Example: `my-option-group`
  ///
  /// [targetOptionGroupDescription]: The description for the copied option
  /// group.
  Future<CopyOptionGroupResult> copyOptionGroup(
      {@required String sourceOptionGroupIdentifier,
      @required String targetOptionGroupIdentifier,
      @required String targetOptionGroupDescription,
      List<Tag> tags}) async {
    return CopyOptionGroupResult.fromJson({});
  }

  /// Creates a new Amazon Aurora DB cluster.
  ///
  /// You can use the `ReplicationSourceIdentifier` parameter to create the DB
  /// cluster as a Read Replica of another DB cluster or Amazon RDS MySQL DB
  /// instance. For cross-region replication where the DB cluster identified by
  /// `ReplicationSourceIdentifier` is encrypted, you must also specify the
  /// `PreSignedUrl` parameter.
  ///
  /// For more information on Amazon Aurora, see
  /// [What Is Amazon Aurora?](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html)
  /// in the _Amazon Aurora User Guide._
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
  ///
  /// [availabilityZones]: A list of Availability Zones (AZs) where instances in
  /// the DB cluster can be created. For information on AWS Regions and
  /// Availability Zones, see
  /// [Choosing the Regions and Availability Zones](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/Concepts.RegionsAndAvailabilityZones.html)
  /// in the _Amazon Aurora User Guide_.
  ///
  /// [backupRetentionPeriod]: The number of days for which automated backups
  /// are retained.
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
  /// characters. If you do not provide a name, Amazon RDS will not create a
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
  /// *   Can't end with a hyphen or contain two consecutive hyphens.
  ///
  ///
  /// Example: `my-cluster1`
  ///
  /// [dbClusterParameterGroupName]:  The name of the DB cluster parameter group
  /// to associate with this DB cluster. If this argument is omitted,
  /// `default.aurora5.6` is used.
  ///
  /// Constraints:
  ///
  /// *   If supplied, must match the name of an existing DB cluster parameter
  /// group.
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
  /// Valid Values: `aurora` (for MySQL 5.6-compatible Aurora), `aurora-mysql`
  /// (for MySQL 5.7-compatible Aurora), and `aurora-postgresql`
  ///
  /// [engineVersion]: The version number of the database engine to use.
  ///
  /// To list all of the available engine versions for `aurora` (for MySQL
  /// 5.6-compatible Aurora), use the following command:
  ///
  ///  `aws rds describe-db-engine-versions --engine aurora --query
  /// "DBEngineVersions[].EngineVersion"`
  ///
  /// To list all of the available engine versions for `aurora-mysql` (for MySQL
  /// 5.7-compatible Aurora), use the following command:
  ///
  ///  `aws rds describe-db-engine-versions --engine aurora-mysql --query
  /// "DBEngineVersions[].EngineVersion"`
  ///
  /// To list all of the available engine versions for `aurora-postgresql`, use
  /// the following command:
  ///
  ///  `aws rds describe-db-engine-versions --engine aurora-postgresql --query
  /// "DBEngineVersions[].EngineVersion"`
  ///
  ///  **Aurora MySQL**
  ///
  /// Example: `5.6.10a`, `5.6.mysql_aurora.1.19.2`, `5.7.12`,
  /// `5.7.mysql_aurora.2.04.5`
  ///
  ///  **Aurora PostgreSQL**
  ///
  /// Example: `9.6.3`, `10.7`
  ///
  /// [port]: The port number on which the instances in the DB cluster accept
  /// connections.
  ///
  ///  Default: `3306` if engine is set as aurora or `5432` if set to
  /// aurora-postgresql.
  ///
  /// [masterUsername]: The name of the master user for the DB cluster.
  ///
  /// Constraints:
  ///
  /// *   Must be 1 to 16 letters or numbers.
  ///
  /// *   First character must be a letter.
  ///
  /// *   Can't be a reserved word for the chosen database engine.
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
  /// [Adjusting the Preferred DB Cluster Maintenance Window](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_UpgradeDBInstance.Maintenance.html#AdjustingTheMaintenanceWindow.Aurora)
  /// in the _Amazon Aurora User Guide._
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
  /// [Adjusting the Preferred DB Cluster Maintenance Window](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_UpgradeDBInstance.Maintenance.html#AdjustingTheMaintenanceWindow.Aurora)
  /// in the _Amazon Aurora User Guide._
  ///
  /// Valid Days: Mon, Tue, Wed, Thu, Fri, Sat, Sun.
  ///
  /// Constraints: Minimum 30-minute window.
  ///
  /// [replicationSourceIdentifier]: The Amazon Resource Name (ARN) of the
  /// source DB instance or DB cluster if this DB cluster is created as a Read
  /// Replica.
  ///
  /// [tags]: Tags to assign to the DB cluster.
  ///
  /// [storageEncrypted]: A value that indicates whether the DB cluster is
  /// encrypted.
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
  /// Amazon RDS will use the encryption key used to encrypt the source.
  /// Otherwise, Amazon RDS will use your default encryption key.
  ///
  /// *   If the `StorageEncrypted` parameter is enabled and
  /// `ReplicationSourceIdentifier` is not specified, then Amazon RDS will use
  /// your default encryption key.
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
  /// [preSignedUrl]: A URL that contains a Signature Version 4 signed request
  /// for the `CreateDBCluster` action to be called in the source AWS Region
  /// where the DB cluster is replicated from. You only need to specify
  /// `PreSignedUrl` when you are performing cross-region replication from an
  /// encrypted DB cluster.
  ///
  /// The pre-signed URL must be a valid request for the `CreateDBCluster` API
  /// action that can be executed in the source AWS Region that contains the
  /// encrypted DB cluster to be copied.
  ///
  /// The pre-signed URL request must contain the following parameter values:
  ///
  /// *    `KmsKeyId` - The AWS KMS key identifier for the key to use to encrypt
  /// the copy of the DB cluster in the destination AWS Region. This should
  /// refer to the same KMS key for both the `CreateDBCluster` action that is
  /// called in the destination AWS Region, and the action contained in the
  /// pre-signed URL.
  ///
  /// *    `DestinationRegion` - The name of the AWS Region that Aurora Read
  /// Replica will be created in.
  ///
  /// *    `ReplicationSourceIdentifier` - The DB cluster identifier for the
  /// encrypted DB cluster to be copied. This identifier must be in the Amazon
  /// Resource Name (ARN) format for the source AWS Region. For example, if you
  /// are copying an encrypted DB cluster from the us-west-2 AWS Region, then
  /// your `ReplicationSourceIdentifier` would look like Example:
  /// `arn:aws:rds:us-west-2:123456789012:cluster:aurora-cluster1`.
  ///
  ///
  /// To learn how to generate a Signature Version 4 signed request, see
  /// [Authenticating Requests: Using Query Parameters (AWS Signature Version 4)](https://docs.aws.amazon.com/AmazonS3/latest/API/sigv4-query-string-auth.html)
  /// and
  /// [Signature Version 4 Signing Process](https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html).
  ///
  /// If you supply a value for this operation's `SourceRegion` parameter, a
  /// pre-signed URL will be calculated on your behalf.
  ///
  /// [enableIamDatabaseAuthentication]: A value that indicates whether to
  /// enable mapping of AWS Identity and Access Management (IAM) accounts to
  /// database accounts. By default, mapping is disabled.
  ///
  /// For more information, see
  /// [IAM Database Authentication](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/UsingWithRDS.IAMDBAuth.html)
  /// in the _Amazon Aurora User Guide._
  ///
  /// [backtrackWindow]: The target backtrack window, in seconds. To disable
  /// backtracking, set this value to 0.
  ///
  /// Default: 0
  ///
  /// Constraints:
  ///
  /// *   If specified, this value must be set to a number from 0 to 259,200 (72
  /// hours).
  ///
  /// [enableCloudwatchLogsExports]: The list of log types that need to be
  /// enabled for exporting to CloudWatch Logs. The values in the list depend on
  /// the DB engine being used. For more information, see
  /// [Publishing Database Logs to Amazon CloudWatch Logs](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_LogAccess.html#USER_LogAccess.Procedural.UploadtoCloudWatch)
  /// in the _Amazon Aurora User Guide_.
  ///
  /// [engineMode]: The DB engine mode of the DB cluster, either `provisioned`,
  /// `serverless`, `parallelquery`, `global`, or `multimaster`.
  ///
  /// [scalingConfiguration]: For DB clusters in `serverless` DB engine mode,
  /// the scaling properties of the DB cluster.
  ///
  /// [deletionProtection]: A value that indicates whether the DB cluster has
  /// deletion protection enabled. The database can't be deleted when deletion
  /// protection is enabled. By default, deletion protection is disabled.
  ///
  /// [globalClusterIdentifier]:  The global cluster ID of an Aurora cluster
  /// that becomes the primary cluster in the new global database cluster.
  ///
  /// [enableHttpEndpoint]: A value that indicates whether to enable the HTTP
  /// endpoint for an Aurora Serverless DB cluster. By default, the HTTP
  /// endpoint is disabled.
  ///
  /// When enabled, the HTTP endpoint provides a connectionless web service API
  /// for running SQL queries on the Aurora Serverless DB cluster. You can also
  /// query your database from inside the RDS console with the query editor.
  ///
  /// For more information, see
  /// [Using the Data API for Aurora Serverless](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/data-api.html)
  /// in the _Amazon Aurora User Guide_.
  ///
  /// [copyTagsToSnapshot]: A value that indicates whether to copy all tags from
  /// the DB cluster to snapshots of the DB cluster. The default is not to copy
  /// them.
  ///
  /// [sourceRegion]: The ID of the region that contains the source for the read
  /// replica.
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
      BigInt backtrackWindow,
      List<String> enableCloudwatchLogsExports,
      String engineMode,
      ScalingConfiguration scalingConfiguration,
      bool deletionProtection,
      String globalClusterIdentifier,
      bool enableHttpEndpoint,
      bool copyTagsToSnapshot,
      String sourceRegion}) async {
    return CreateDBClusterResult.fromJson({});
  }

  /// Creates a new custom endpoint and associates it with an Amazon Aurora DB
  /// cluster.
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
  ///
  /// [dbClusterIdentifier]: The DB cluster identifier of the DB cluster
  /// associated with the endpoint. This parameter is stored as a lowercase
  /// string.
  ///
  /// [dbClusterEndpointIdentifier]: The identifier to use for the new endpoint.
  /// This parameter is stored as a lowercase string.
  ///
  /// [endpointType]: The type of the endpoint. One of: `READER`, `WRITER`,
  /// `ANY`.
  ///
  /// [staticMembers]: List of DB instance identifiers that are part of the
  /// custom endpoint group.
  ///
  /// [excludedMembers]: List of DB instance identifiers that aren't part of the
  /// custom endpoint group. All other eligible instances are reachable through
  /// the custom endpoint. Only relevant if the list of static members is empty.
  Future<DBClusterEndpoint> createDBClusterEndpoint(
      {@required String dbClusterIdentifier,
      @required String dbClusterEndpointIdentifier,
      @required String endpointType,
      List<String> staticMembers,
      List<String> excludedMembers}) async {
    return DBClusterEndpoint.fromJson({});
  }

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
  /// `character_set_database` parameter. You can use the _Parameter Groups_
  /// option of the [Amazon RDS console](https://console.aws.amazon.com/rds/) or
  /// the `DescribeDBClusterParameters` action to verify that your DB cluster
  /// parameter group has been created or modified.
  ///
  /// For more information on Amazon Aurora, see
  /// [What Is Amazon Aurora?](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html)
  /// in the _Amazon Aurora User Guide._
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
  ///
  /// [dbClusterParameterGroupName]: The name of the DB cluster parameter group.
  ///
  /// Constraints:
  ///
  /// *   Must match the name of an existing DB cluster parameter group.
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
  ///  **Aurora MySQL**
  ///
  /// Example: `aurora5.6`, `aurora-mysql5.7`
  ///
  ///  **Aurora PostgreSQL**
  ///
  /// Example: `aurora-postgresql9.6`
  ///
  /// [description]: The description for the DB cluster parameter group.
  ///
  /// [tags]: Tags to assign to the DB cluster parameter group.
  Future<CreateDBClusterParameterGroupResult> createDBClusterParameterGroup(
      {@required String dbClusterParameterGroupName,
      @required String dbParameterGroupFamily,
      @required String description,
      List<Tag> tags}) async {
    return CreateDBClusterParameterGroupResult.fromJson({});
  }

  /// Creates a snapshot of a DB cluster. For more information on Amazon Aurora,
  /// see
  /// [What Is Amazon Aurora?](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html)
  /// in the _Amazon Aurora User Guide._
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
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
  /// *   Can't end with a hyphen or contain two consecutive hyphens.
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
    return CreateDBClusterSnapshotResult.fromJson({});
  }

  /// Creates a new DB instance.
  ///
  /// [dbName]: The meaning of this parameter differs according to the database
  /// engine you use.
  ///
  ///  **MySQL**
  ///
  /// The name of the database to create when the DB instance is created. If
  /// this parameter is not specified, no database is created in the DB
  /// instance.
  ///
  /// Constraints:
  ///
  /// *   Must contain 1 to 64 letters or numbers.
  ///
  /// *   Can't be a word reserved by the specified database engine
  ///
  ///
  ///  **MariaDB**
  ///
  /// The name of the database to create when the DB instance is created. If
  /// this parameter is not specified, no database is created in the DB
  /// instance.
  ///
  /// Constraints:
  ///
  /// *   Must contain 1 to 64 letters or numbers.
  ///
  /// *   Can't be a word reserved by the specified database engine
  ///
  ///
  ///  **PostgreSQL**
  ///
  /// The name of the database to create when the DB instance is created. If
  /// this parameter is not specified, the default "postgres" database is
  /// created in the DB instance.
  ///
  /// Constraints:
  ///
  /// *   Must contain 1 to 63 letters, numbers, or underscores.
  ///
  /// *   Must begin with a letter or an underscore. Subsequent characters can
  /// be letters, underscores, or digits (0-9).
  ///
  /// *   Can't be a word reserved by the specified database engine
  ///
  ///
  ///  **Oracle**
  ///
  /// The Oracle System ID (SID) of the created DB instance. If you specify
  /// `null`, the default value `ORCL` is used. You can't specify the string
  /// NULL, or any other reserved word, for `DBName`.
  ///
  /// Default: `ORCL`
  ///
  /// Constraints:
  ///
  /// *   Can't be longer than 8 characters
  ///
  ///
  ///  **SQL Server**
  ///
  /// Not applicable. Must be null.
  ///
  ///  **Amazon Aurora**
  ///
  /// The name of the database to create when the primary instance of the DB
  /// cluster is created. If this parameter is not specified, no database is
  /// created in the DB instance.
  ///
  /// Constraints:
  ///
  /// *   Must contain 1 to 64 letters or numbers.
  ///
  /// *   Can't be a word reserved by the specified database engine
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
  /// *   Can't end with a hyphen or contain two consecutive hyphens.
  ///
  ///
  /// Example: `mydbinstance`
  ///
  /// [allocatedStorage]: The amount of storage (in gibibytes) to allocate for
  /// the DB instance.
  ///
  /// Type: Integer
  ///
  ///  **Amazon Aurora**
  ///
  /// Not applicable. Aurora cluster volumes automatically grow as the amount of
  /// data in your database increases, though you are only charged for the space
  /// that you use in an Aurora cluster volume.
  ///
  ///  **MySQL**
  ///
  /// Constraints to the amount of storage for each storage type are the
  /// following:
  ///
  /// *   General Purpose (SSD) storage (gp2): Must be an integer from 20 to
  /// 65536.
  ///
  /// *   Provisioned IOPS storage (io1): Must be an integer from 100 to 65536.
  ///
  /// *   Magnetic storage (standard): Must be an integer from 5 to 3072.
  ///
  ///
  ///  **MariaDB**
  ///
  /// Constraints to the amount of storage for each storage type are the
  /// following:
  ///
  /// *   General Purpose (SSD) storage (gp2): Must be an integer from 20 to
  /// 65536.
  ///
  /// *   Provisioned IOPS storage (io1): Must be an integer from 100 to 65536.
  ///
  /// *   Magnetic storage (standard): Must be an integer from 5 to 3072.
  ///
  ///
  ///  **PostgreSQL**
  ///
  /// Constraints to the amount of storage for each storage type are the
  /// following:
  ///
  /// *   General Purpose (SSD) storage (gp2): Must be an integer from 20 to
  /// 65536.
  ///
  /// *   Provisioned IOPS storage (io1): Must be an integer from 100 to 65536.
  ///
  /// *   Magnetic storage (standard): Must be an integer from 5 to 3072.
  ///
  ///
  ///  **Oracle**
  ///
  /// Constraints to the amount of storage for each storage type are the
  /// following:
  ///
  /// *   General Purpose (SSD) storage (gp2): Must be an integer from 20 to
  /// 65536.
  ///
  /// *   Provisioned IOPS storage (io1): Must be an integer from 100 to 65536.
  ///
  /// *   Magnetic storage (standard): Must be an integer from 10 to 3072.
  ///
  ///
  ///  **SQL Server**
  ///
  /// Constraints to the amount of storage for each storage type are the
  /// following:
  ///
  /// *   General Purpose (SSD) storage (gp2):
  ///
  ///     *   Enterprise and Standard editions: Must be an integer from 200 to
  /// 16384.
  ///
  ///     *   Web and Express editions: Must be an integer from 20 to 16384.
  ///
  ///
  /// *   Provisioned IOPS storage (io1):
  ///
  ///     *   Enterprise and Standard editions: Must be an integer from 200 to
  /// 16384.
  ///
  ///     *   Web and Express editions: Must be an integer from 100 to 16384.
  ///
  ///
  /// *   Magnetic storage (standard):
  ///
  ///     *   Enterprise and Standard editions: Must be an integer from 200 to
  /// 1024.
  ///
  ///     *   Web and Express editions: Must be an integer from 20 to 1024.
  ///
  /// [dbInstanceClass]: The compute and memory capacity of the DB instance, for
  /// example, `db.m4.large`. Not all DB instance classes are available in all
  /// AWS Regions, or for all database engines. For the full list of DB instance
  /// classes, and availability for your engine, see
  /// [DB Instance Class](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.DBInstanceClass.html)
  /// in the _Amazon RDS User Guide._
  ///
  /// [engine]: The name of the database engine to be used for this instance.
  ///
  /// Not every database engine is available for every AWS Region.
  ///
  /// Valid Values:
  ///
  /// *    `aurora` (for MySQL 5.6-compatible Aurora)
  ///
  /// *    `aurora-mysql` (for MySQL 5.7-compatible Aurora)
  ///
  /// *    `aurora-postgresql`
  ///
  /// *    `mariadb`
  ///
  /// *    `mysql`
  ///
  /// *    `oracle-ee`
  ///
  /// *    `oracle-se2`
  ///
  /// *    `oracle-se1`
  ///
  /// *    `oracle-se`
  ///
  /// *    `postgres`
  ///
  /// *    `sqlserver-ee`
  ///
  /// *    `sqlserver-se`
  ///
  /// *    `sqlserver-ex`
  ///
  /// *    `sqlserver-web`
  ///
  /// [masterUsername]: The name for the master user.
  ///
  ///  **Amazon Aurora**
  ///
  /// Not applicable. The name for the master user is managed by the DB cluster.
  ///
  ///  **MariaDB**
  ///
  /// Constraints:
  ///
  /// *   Required for MariaDB.
  ///
  /// *   Must be 1 to 16 letters or numbers.
  ///
  /// *   Can't be a reserved word for the chosen database engine.
  ///
  ///
  ///  **Microsoft SQL Server**
  ///
  /// Constraints:
  ///
  /// *   Required for SQL Server.
  ///
  /// *   Must be 1 to 128 letters or numbers.
  ///
  /// *   The first character must be a letter.
  ///
  /// *   Can't be a reserved word for the chosen database engine.
  ///
  ///
  ///  **MySQL**
  ///
  /// Constraints:
  ///
  /// *   Required for MySQL.
  ///
  /// *   Must be 1 to 16 letters or numbers.
  ///
  /// *   First character must be a letter.
  ///
  /// *   Can't be a reserved word for the chosen database engine.
  ///
  ///
  ///  **Oracle**
  ///
  /// Constraints:
  ///
  /// *   Required for Oracle.
  ///
  /// *   Must be 1 to 30 letters or numbers.
  ///
  /// *   First character must be a letter.
  ///
  /// *   Can't be a reserved word for the chosen database engine.
  ///
  ///
  ///  **PostgreSQL**
  ///
  /// Constraints:
  ///
  /// *   Required for PostgreSQL.
  ///
  /// *   Must be 1 to 63 letters or numbers.
  ///
  /// *   First character must be a letter.
  ///
  /// *   Can't be a reserved word for the chosen database engine.
  ///
  /// [masterUserPassword]: The password for the master user. The password can
  /// include any printable ASCII character except "/", """, or "@".
  ///
  ///  **Amazon Aurora**
  ///
  /// Not applicable. The password for the master user is managed by the DB
  /// cluster.
  ///
  ///  **MariaDB**
  ///
  /// Constraints: Must contain from 8 to 41 characters.
  ///
  ///  **Microsoft SQL Server**
  ///
  /// Constraints: Must contain from 8 to 128 characters.
  ///
  ///  **MySQL**
  ///
  /// Constraints: Must contain from 8 to 41 characters.
  ///
  ///  **Oracle**
  ///
  /// Constraints: Must contain from 8 to 30 characters.
  ///
  ///  **PostgreSQL**
  ///
  /// Constraints: Must contain from 8 to 128 characters.
  ///
  /// [dbSecurityGroups]: A list of DB security groups to associate with this DB
  /// instance.
  ///
  /// Default: The default DB security group for the database engine.
  ///
  /// [vpcSecurityGroupIds]: A list of Amazon EC2 VPC security groups to
  /// associate with this DB instance.
  ///
  ///  **Amazon Aurora**
  ///
  /// Not applicable. The associated list of EC2 VPC security groups is managed
  /// by the DB cluster.
  ///
  /// Default: The default EC2 VPC security group for the DB subnet group's VPC.
  ///
  /// [availabilityZone]:  The Availability Zone (AZ) where the database will be
  /// created. For information on AWS Regions and Availability Zones, see
  /// [Regions and Availability Zones](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.RegionsAndAvailabilityZones.html).
  ///
  /// Default: A random, system-chosen Availability Zone in the endpoint's AWS
  /// Region.
  ///
  ///  Example: `us-east-1d`
  ///
  ///  Constraint: The `AvailabilityZone` parameter can't be specified if the DB
  /// instance is a Multi-AZ deployment. The specified Availability Zone must be
  /// in the same AWS Region as the current endpoint.
  ///
  /// [dbSubnetGroupName]: A DB subnet group to associate with this DB instance.
  ///
  /// If there is no DB subnet group, then it is a non-VPC DB instance.
  ///
  /// [preferredMaintenanceWindow]: The time range each week during which system
  /// maintenance can occur, in Universal Coordinated Time (UTC). For more
  /// information, see
  /// [Amazon RDS Maintenance Window](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_UpgradeDBInstance.Maintenance.html#Concepts.DBMaintenance).
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
  /// with this DB instance. If you do not specify a value for
  /// `DBParameterGroupName`, then the default `DBParameterGroup` for the
  /// specified DB engine is used.
  ///
  /// Constraints:
  ///
  /// *   Must be 1 to 255 letters, numbers, or hyphens.
  ///
  /// *   First character must be a letter
  ///
  /// *   Can't end with a hyphen or contain two consecutive hyphens
  ///
  /// [backupRetentionPeriod]: The number of days for which automated backups
  /// are retained. Setting this parameter to a positive number enables backups.
  /// Setting this parameter to 0 disables automated backups.
  ///
  ///  **Amazon Aurora**
  ///
  /// Not applicable. The retention period for automated backups is managed by
  /// the DB cluster.
  ///
  /// Default: 1
  ///
  /// Constraints:
  ///
  /// *   Must be a value from 0 to 35
  ///
  /// *   Can't be set to 0 if the DB instance is a source to Read Replicas
  ///
  /// [preferredBackupWindow]:  The daily time range during which automated
  /// backups are created if automated backups are enabled, using the
  /// `BackupRetentionPeriod` parameter. For more information, see
  /// [The Backup Window](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_WorkingWithAutomatedBackups.html#USER_WorkingWithAutomatedBackups.BackupWindow)
  /// in the _Amazon RDS User Guide_.
  ///
  ///  **Amazon Aurora**
  ///
  /// Not applicable. The daily time range for creating automated backups is
  /// managed by the DB cluster.
  ///
  ///  The default is a 30-minute window selected at random from an 8-hour block
  /// of time for each AWS Region. To see the time blocks available, see
  /// [Adjusting the Preferred DB Instance Maintenance Window](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_UpgradeDBInstance.Maintenance.html#AdjustingTheMaintenanceWindow)
  /// in the _Amazon RDS User Guide_.
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
  /// [port]: The port number on which the database accepts connections.
  ///
  ///  **MySQL**
  ///
  ///  Default: `3306`
  ///
  ///  Valid Values: `1150-65535`
  ///
  /// Type: Integer
  ///
  ///  **MariaDB**
  ///
  ///  Default: `3306`
  ///
  ///  Valid Values: `1150-65535`
  ///
  /// Type: Integer
  ///
  ///  **PostgreSQL**
  ///
  ///  Default: `5432`
  ///
  ///  Valid Values: `1150-65535`
  ///
  /// Type: Integer
  ///
  ///  **Oracle**
  ///
  ///  Default: `1521`
  ///
  ///  Valid Values: `1150-65535`
  ///
  ///  **SQL Server**
  ///
  ///  Default: `1433`
  ///
  ///  Valid Values: `1150-65535` except for `1434`, `3389`, `47001`, `49152`,
  /// and `49152` through `49156`.
  ///
  ///  **Amazon Aurora**
  ///
  ///  Default: `3306`
  ///
  ///  Valid Values: `1150-65535`
  ///
  /// Type: Integer
  ///
  /// [multiAZ]: A value that indicates whether the DB instance is a Multi-AZ
  /// deployment. You can't set the `AvailabilityZone` parameter if the DB
  /// instance is a Multi-AZ deployment.
  ///
  /// [engineVersion]: The version number of the database engine to use.
  ///
  /// For a list of valid engine versions, use the `DescribeDBEngineVersions`
  /// action.
  ///
  /// The following are the database engines and links to information about the
  /// major and minor versions that are available with Amazon RDS. Not every
  /// database engine is available for every AWS Region.
  ///
  ///  **Amazon Aurora**
  ///
  /// Not applicable. The version number of the database engine to be used by
  /// the DB instance is managed by the DB cluster.
  ///
  ///  **MariaDB**
  ///
  /// See
  /// [MariaDB on Amazon RDS Versions](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_MariaDB.html#MariaDB.Concepts.VersionMgmt)
  /// in the _Amazon RDS User Guide._
  ///
  ///  **Microsoft SQL Server**
  ///
  /// See
  /// [Version and Feature Support on Amazon RDS](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_SQLServer.html#SQLServer.Concepts.General.FeatureSupport)
  /// in the _Amazon RDS User Guide._
  ///
  ///  **MySQL**
  ///
  /// See
  /// [MySQL on Amazon RDS Versions](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_MySQL.html#MySQL.Concepts.VersionMgmt)
  /// in the _Amazon RDS User Guide._
  ///
  ///  **Oracle**
  ///
  /// See
  /// [Oracle Database Engine Release Notes](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Appendix.Oracle.PatchComposition.html)
  /// in the _Amazon RDS User Guide._
  ///
  ///  **PostgreSQL**
  ///
  /// See
  /// [Supported PostgreSQL Database Versions](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_PostgreSQL.html#PostgreSQL.Concepts.General.DBVersions)
  /// in the _Amazon RDS User Guide._
  ///
  /// [autoMinorVersionUpgrade]: A value that indicates whether minor engine
  /// upgrades are applied automatically to the DB instance during the
  /// maintenance window. By default, minor engine upgrades are applied
  /// automatically.
  ///
  /// [licenseModel]: License model information for this DB instance.
  ///
  ///  Valid values: `license-included` | `bring-your-own-license` |
  /// `general-public-license`
  ///
  /// [iops]: The amount of Provisioned IOPS (input/output operations per
  /// second) to be initially allocated for the DB instance. For information
  /// about valid Iops values, see
  /// [Amazon RDS Provisioned IOPS Storage to Improve Performance](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_Storage.html#USER_PIOPS)
  /// in the _Amazon RDS User Guide_.
  ///
  /// Constraints: Must be a multiple between 1 and 50 of the storage amount for
  /// the DB instance.
  ///
  /// [optionGroupName]: Indicates that the DB instance should be associated
  /// with the specified option group.
  ///
  /// Permanent options, such as the TDE option for Oracle Advanced Security
  /// TDE, can't be removed from an option group, and that option group can't be
  /// removed from a DB instance once it is associated with a DB instance
  ///
  /// [characterSetName]: For supported engines, indicates that the DB instance
  /// should be associated with the specified CharacterSet.
  ///
  ///  **Amazon Aurora**
  ///
  /// Not applicable. The character set is managed by the DB cluster. For more
  /// information, see `CreateDBCluster`.
  ///
  /// [publiclyAccessible]: A value that indicates whether the DB instance is
  /// publicly accessible. When the DB instance is publicly accessible, it is an
  /// Internet-facing instance with a publicly resolvable DNS name, which
  /// resolves to a public IP address. When the DB instance is not publicly
  /// accessible, it is an internal instance with a DNS name that resolves to a
  /// private IP address.
  ///
  /// Default: The default behavior varies depending on whether
  /// `DBSubnetGroupName` is specified.
  ///
  /// If `DBSubnetGroupName` is not specified, and `PubliclyAccessible` is not
  /// specified, the following applies:
  ///
  /// *   If the default VPC in the target region doesn’t have an Internet
  /// gateway attached to it, the DB instance is private.
  ///
  /// *   If the default VPC in the target region has an Internet gateway
  /// attached to it, the DB instance is public.
  ///
  ///
  /// If `DBSubnetGroupName` is specified, and `PubliclyAccessible` is not
  /// specified, the following applies:
  ///
  /// *   If the subnets are part of a VPC that doesn’t have an Internet gateway
  /// attached to it, the DB instance is private.
  ///
  /// *   If the subnets are part of a VPC that has an Internet gateway attached
  /// to it, the DB instance is public.
  ///
  /// [tags]: Tags to assign to the DB instance.
  ///
  /// [dbClusterIdentifier]: The identifier of the DB cluster that the instance
  /// will belong to.
  ///
  /// [storageType]: Specifies the storage type to be associated with the DB
  /// instance.
  ///
  ///  Valid values: `standard | gp2 | io1`
  ///
  ///  If you specify `io1`, you must also include a value for the `Iops`
  /// parameter.
  ///
  ///  Default: `io1` if the `Iops` parameter is specified, otherwise `gp2`
  ///
  /// [tdeCredentialArn]: The ARN from the key store with which to associate the
  /// instance for TDE encryption.
  ///
  /// [tdeCredentialPassword]: The password for the given ARN from the key store
  /// in order to access the device.
  ///
  /// [storageEncrypted]: A value that indicates whether the DB instance is
  /// encrypted. By default, it is not encrypted.
  ///
  ///  **Amazon Aurora**
  ///
  /// Not applicable. The encryption for DB instances is managed by the DB
  /// cluster.
  ///
  /// [kmsKeyId]: The AWS KMS key identifier for an encrypted DB instance.
  ///
  /// The KMS key identifier is the Amazon Resource Name (ARN) for the KMS
  /// encryption key. If you are creating a DB instance with the same AWS
  /// account that owns the KMS encryption key used to encrypt the new DB
  /// instance, then you can use the KMS key alias instead of the ARN for the KM
  /// encryption key.
  ///
  ///  **Amazon Aurora**
  ///
  /// Not applicable. The KMS key identifier is managed by the DB cluster. For
  /// more information, see `CreateDBCluster`.
  ///
  /// If `StorageEncrypted` is enabled, and you do not specify a value for the
  /// `KmsKeyId` parameter, then Amazon RDS will use your default encryption
  /// key. AWS KMS creates the default encryption key for your AWS account. Your
  /// AWS account has a different default encryption key for each AWS Region.
  ///
  /// [domain]: For an Amazon RDS DB instance that's running Microsoft SQL
  /// Server, this parameter specifies the Active Directory directory ID to
  /// create the instance in. Amazon RDS uses Windows Authentication to
  /// authenticate users that connect to the DB instance. For more information,
  /// see
  /// [Using Windows Authentication with an Amazon RDS DB Instance Running Microsoft SQL Server](https://docs.aws.amazon.com/AmazonRDS/latest/DeveloperGuide/USER_SQLServerWinAuth.html)
  /// in the _Amazon RDS User Guide_.
  ///
  /// [copyTagsToSnapshot]: A value that indicates whether to copy tags from the
  /// DB instance to snapshots of the DB instance. By default, tags are not
  /// copied.
  ///
  ///  **Amazon Aurora**
  ///
  /// Not applicable. Copying tags to snapshots is managed by the DB cluster.
  /// Setting this value for an Aurora DB instance has no effect on the DB
  /// cluster setting.
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
  /// [monitoringRoleArn]: The ARN for the IAM role that permits RDS to send
  /// enhanced monitoring metrics to Amazon CloudWatch Logs. For example,
  /// `arn:aws:iam:123456789012:role/emaccess`. For information on creating a
  /// monitoring role, go to
  /// [Setting Up and Enabling Enhanced Monitoring](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Monitoring.OS.html#USER_Monitoring.OS.Enabling)
  /// in the _Amazon RDS User Guide_.
  ///
  /// If `MonitoringInterval` is set to a value other than 0, then you must
  /// supply a `MonitoringRoleArn` value.
  ///
  /// [domainIamRoleName]: Specify the name of the IAM role to be used when
  /// making API calls to the Directory Service.
  ///
  /// [promotionTier]: A value that specifies the order in which an Aurora
  /// Replica is promoted to the primary instance after a failure of the
  /// existing primary instance. For more information, see
  /// [Fault Tolerance for an Aurora DB Cluster](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/Aurora.Managing.Backups.html#Aurora.Managing.FaultTolerance)
  /// in the _Amazon Aurora User Guide_.
  ///
  /// Default: 1
  ///
  /// Valid Values: 0 - 15
  ///
  /// [timezone]: The time zone of the DB instance. The time zone parameter is
  /// currently supported only by
  /// [Microsoft SQL Server](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_SQLServer.html#SQLServer.Concepts.General.TimeZone).
  ///
  /// [enableIamDatabaseAuthentication]: A value that indicates whether to
  /// enable mapping of AWS Identity and Access Management (IAM) accounts to
  /// database accounts. By default, mapping is disabled.
  ///
  /// You can enable IAM database authentication for the following database
  /// engines:
  ///
  ///  **Amazon Aurora**
  ///
  /// Not applicable. Mapping AWS IAM accounts to database accounts is managed
  /// by the DB cluster.
  ///
  ///  **MySQL**
  ///
  /// *   For MySQL 5.6, minor version 5.6.34 or higher
  ///
  /// *   For MySQL 5.7, minor version 5.7.16 or higher
  ///
  /// *   For MySQL 8.0, minor version 8.0.16 or higher
  ///
  ///
  ///  **PostgreSQL**
  ///
  /// *   For PostgreSQL 9.5, minor version 9.5.15 or higher
  ///
  /// *   For PostgreSQL 9.6, minor version 9.6.11 or higher
  ///
  /// *   PostgreSQL 10.6, 10.7, and 10.9
  ///
  ///
  /// For more information, see
  /// [IAM Database Authentication for MySQL and PostgreSQL](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/UsingWithRDS.IAMDBAuth.html)
  /// in the _Amazon RDS User Guide._
  ///
  /// [enablePerformanceInsights]: A value that indicates whether to enable
  /// Performance Insights for the DB instance.
  ///
  /// For more information, see
  /// [Using Amazon Performance Insights](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_PerfInsights.html)
  /// in the _Amazon Relational Database Service User Guide_.
  ///
  /// [performanceInsightsKmsKeyId]: The AWS KMS key identifier for encryption
  /// of Performance Insights data. The KMS key ID is the Amazon Resource Name
  /// (ARN), KMS key identifier, or the KMS key alias for the KMS encryption
  /// key.
  ///
  /// If you do not specify a value for `PerformanceInsightsKMSKeyId`, then
  /// Amazon RDS uses your default encryption key. AWS KMS creates the default
  /// encryption key for your AWS account. Your AWS account has a different
  /// default encryption key for each AWS Region.
  ///
  /// [performanceInsightsRetentionPeriod]: The amount of time, in days, to
  /// retain Performance Insights data. Valid values are 7 or 731 (2 years).
  ///
  /// [enableCloudwatchLogsExports]: The list of log types that need to be
  /// enabled for exporting to CloudWatch Logs. The values in the list depend on
  /// the DB engine being used. For more information, see
  /// [Publishing Database Logs to Amazon CloudWatch Logs](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_LogAccess.html#USER_LogAccess.Procedural.UploadtoCloudWatch)
  ///  in the _Amazon Relational Database Service User Guide_.
  ///
  /// [processorFeatures]: The number of CPU cores and the number of threads per
  /// core for the DB instance class of the DB instance.
  ///
  /// [deletionProtection]: A value that indicates whether the DB instance has
  /// deletion protection enabled. The database can't be deleted when deletion
  /// protection is enabled. By default, deletion protection is disabled. For
  /// more information, see
  /// [Deleting a DB Instance](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_DeleteInstance.html).
  ///
  /// [maxAllocatedStorage]: The upper limit to which Amazon RDS can
  /// automatically scale the storage of the DB instance.
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
      int performanceInsightsRetentionPeriod,
      List<String> enableCloudwatchLogsExports,
      List<ProcessorFeature> processorFeatures,
      bool deletionProtection,
      int maxAllocatedStorage}) async {
    return CreateDBInstanceResult.fromJson({});
  }

  /// Creates a new DB instance that acts as a Read Replica for an existing
  /// source DB instance. You can create a Read Replica for a DB instance
  /// running MySQL, MariaDB, Oracle, or PostgreSQL. For more information, see
  /// [Working with Read Replicas](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_ReadRepl.html)
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
  ///
  /// [dbInstanceIdentifier]: The DB instance identifier of the Read Replica.
  /// This identifier is the unique key that identifies a DB instance. This
  /// parameter is stored as a lowercase string.
  ///
  /// [sourceDBInstanceIdentifier]: The identifier of the DB instance that will
  /// act as the source for the Read Replica. Each DB instance can have up to
  /// five Read Replicas.
  ///
  /// Constraints:
  ///
  /// *   Must be the identifier of an existing MySQL, MariaDB, Oracle, or
  /// PostgreSQL DB instance.
  ///
  /// *   Can specify a DB instance that is a MySQL Read Replica only if the
  /// source is running MySQL 5.6 or later.
  ///
  /// *   For the limitations of Oracle Read Replicas, see
  /// [Read Replica Limitations with Oracle](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/oracle-read-replicas.html)
  /// in the _Amazon RDS User Guide_.
  ///
  /// *   Can specify a DB instance that is a PostgreSQL DB instance only if the
  /// source is running PostgreSQL 9.3.5 or later (9.4.7 and higher for
  /// cross-region replication).
  ///
  /// *   The specified DB instance must have automatic backups enabled, its
  /// backup retention period must be greater than 0.
  ///
  /// *   If the source DB instance is in the same AWS Region as the Read
  /// Replica, specify a valid DB instance identifier.
  ///
  /// *   If the source DB instance is in a different AWS Region than the Read
  /// Replica, specify a valid DB instance ARN. For more information, go to
  /// [Constructing an ARN for Amazon RDS](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Tagging.ARN.html#USER_Tagging.ARN.Constructing)
  /// in the _Amazon RDS User Guide_.
  ///
  /// [dbInstanceClass]: The compute and memory capacity of the Read Replica,
  /// for example, `db.m4.large`. Not all DB instance classes are available in
  /// all AWS Regions, or for all database engines. For the full list of DB
  /// instance classes, and availability for your engine, see
  /// [DB Instance Class](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.DBInstanceClass.html)
  /// in the _Amazon RDS User Guide._
  ///
  /// Default: Inherits from the source DB instance.
  ///
  /// [availabilityZone]: The Availability Zone (AZ) where the Read Replica will
  /// be created.
  ///
  /// Default: A random, system-chosen Availability Zone in the endpoint's AWS
  /// Region.
  ///
  ///  Example: `us-east-1d`
  ///
  /// [port]: The port number that the DB instance uses for connections.
  ///
  /// Default: Inherits from the source DB instance
  ///
  /// Valid Values: `1150-65535`
  ///
  /// [multiAZ]: A value that indicates whether the Read Replica is in a
  /// Multi-AZ deployment.
  ///
  /// You can create a Read Replica as a Multi-AZ DB instance. RDS creates a
  /// standby of your replica in another Availability Zone for failover support
  /// for the replica. Creating your Read Replica as a Multi-AZ DB instance is
  /// independent of whether the source database is a Multi-AZ DB instance.
  ///
  /// [autoMinorVersionUpgrade]: A value that indicates whether minor engine
  /// upgrades are applied automatically to the Read Replica during the
  /// maintenance window.
  ///
  /// Default: Inherits from the source DB instance
  ///
  /// [iops]: The amount of Provisioned IOPS (input/output operations per
  /// second) to be initially allocated for the DB instance.
  ///
  /// [optionGroupName]: The option group the DB instance is associated with. If
  /// omitted, the option group associated with the source instance is used.
  ///
  /// [dbParameterGroupName]: The name of the DB parameter group to associate
  /// with this DB instance.
  ///
  /// If you do not specify a value for `DBParameterGroupName`, then Amazon RDS
  /// uses the `DBParameterGroup` of source DB instance for a same region Read
  /// Replica, or the default `DBParameterGroup` for the specified DB engine for
  /// a cross region Read Replica.
  ///
  /// Constraints:
  ///
  /// *   Must be 1 to 255 letters, numbers, or hyphens.
  ///
  /// *   First character must be a letter
  ///
  /// *   Can't end with a hyphen or contain two consecutive hyphens
  ///
  /// [publiclyAccessible]: A value that indicates whether the DB instance is
  /// publicly accessible. When the DB instance is publicly accessible, it is an
  /// Internet-facing instance with a publicly resolvable DNS name, which
  /// resolves to a public IP address. When the DB instance is not publicly
  /// accessible, it is an internal instance with a DNS name that resolves to a
  /// private IP address. For more information, see CreateDBInstance.
  ///
  /// [dbSubnetGroupName]: Specifies a DB subnet group for the DB instance. The
  /// new DB instance is created in the VPC associated with the DB subnet group.
  /// If no DB subnet group is specified, then the new DB instance is not
  /// created in a VPC.
  ///
  /// Constraints:
  ///
  /// *   Can only be specified if the source DB instance identifier specifies a
  /// DB instance in another AWS Region.
  ///
  /// *   If supplied, must match the name of an existing DBSubnetGroup.
  ///
  /// *   The specified DB subnet group must be in the same AWS Region in which
  /// the operation is running.
  ///
  /// *   All Read Replicas in one AWS Region that are created from the same
  /// source DB instance must either:>
  ///
  ///     *   Specify DB subnet groups from the same VPC. All these Read
  /// Replicas are created in the same VPC.
  ///
  ///     *   Not specify a DB subnet group. All these Read Replicas are created
  /// outside of any VPC.
  ///
  ///
  ///
  /// Example: `mySubnetgroup`
  ///
  /// [vpcSecurityGroupIds]:  A list of EC2 VPC security groups to associate
  /// with the Read Replica.
  ///
  ///  Default: The default EC2 VPC security group for the DB subnet group's
  /// VPC.
  ///
  /// [storageType]: Specifies the storage type to be associated with the Read
  /// Replica.
  ///
  ///  Valid values: `standard | gp2 | io1`
  ///
  ///  If you specify `io1`, you must also include a value for the `Iops`
  /// parameter.
  ///
  ///  Default: `io1` if the `Iops` parameter is specified, otherwise `gp2`
  ///
  /// [copyTagsToSnapshot]: A value that indicates whether to copy all tags from
  /// the Read Replica to snapshots of the Read Replica. By default, tags are
  /// not copied.
  ///
  /// [monitoringInterval]: The interval, in seconds, between points when
  /// Enhanced Monitoring metrics are collected for the Read Replica. To disable
  /// collecting Enhanced Monitoring metrics, specify 0. The default is 0.
  ///
  /// If `MonitoringRoleArn` is specified, then you must also set
  /// `MonitoringInterval` to a value other than 0.
  ///
  /// Valid Values: `0, 1, 5, 10, 15, 30, 60`
  ///
  /// [monitoringRoleArn]: The ARN for the IAM role that permits RDS to send
  /// enhanced monitoring metrics to Amazon CloudWatch Logs. For example,
  /// `arn:aws:iam:123456789012:role/emaccess`. For information on creating a
  /// monitoring role, go to
  /// [To create an IAM role for Amazon RDS Enhanced Monitoring](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Monitoring.html#USER_Monitoring.OS.IAMRole)
  /// in the _Amazon RDS User Guide_.
  ///
  /// If `MonitoringInterval` is set to a value other than 0, then you must
  /// supply a `MonitoringRoleArn` value.
  ///
  /// [kmsKeyId]: The AWS KMS key ID for an encrypted Read Replica. The KMS key
  /// ID is the Amazon Resource Name (ARN), KMS key identifier, or the KMS key
  /// alias for the KMS encryption key.
  ///
  /// If you create an encrypted Read Replica in the same AWS Region as the
  /// source DB instance, then you do not have to specify a value for this
  /// parameter. The Read Replica is encrypted with the same KMS key as the
  /// source DB instance.
  ///
  /// If you create an encrypted Read Replica in a different AWS Region, then
  /// you must specify a KMS key for the destination AWS Region. KMS encryption
  /// keys are specific to the AWS Region that they are created in, and you
  /// can't use encryption keys from one AWS Region in another AWS Region.
  ///
  /// You can't create an encrypted Read Replica from an unencrypted DB
  /// instance.
  ///
  /// [preSignedUrl]: The URL that contains a Signature Version 4 signed request
  /// for the `CreateDBInstanceReadReplica` API action in the source AWS Region
  /// that contains the source DB instance.
  ///
  /// You must specify this parameter when you create an encrypted Read Replica
  /// from another AWS Region by using the Amazon RDS API. You can specify the
  /// `--source-region` option instead of this parameter when you create an
  /// encrypted Read Replica from another AWS Region by using the AWS CLI.
  ///
  /// The presigned URL must be a valid request for the
  /// `CreateDBInstanceReadReplica` API action that can be executed in the
  /// source AWS Region that contains the encrypted source DB instance. The
  /// presigned URL request must contain the following parameter values:
  ///
  /// *    `DestinationRegion` - The AWS Region that the encrypted Read Replica
  /// is created in. This AWS Region is the same one where the
  /// `CreateDBInstanceReadReplica` action is called that contains this
  /// presigned URL.
  ///
  ///     For example, if you create an encrypted DB instance in the us-west-1
  /// AWS Region, from a source DB instance in the us-east-2 AWS Region, then
  /// you call the `CreateDBInstanceReadReplica` action in the us-east-1 AWS
  /// Region and provide a presigned URL that contains a call to the
  /// `CreateDBInstanceReadReplica` action in the us-west-2 AWS Region. For this
  /// example, the `DestinationRegion` in the presigned URL must be set to the
  /// us-east-1 AWS Region.
  ///
  /// *    `KmsKeyId` - The AWS KMS key identifier for the key to use to encrypt
  /// the Read Replica in the destination AWS Region. This is the same
  /// identifier for both the `CreateDBInstanceReadReplica` action that is
  /// called in the destination AWS Region, and the action contained in the
  /// presigned URL.
  ///
  /// *    `SourceDBInstanceIdentifier` - The DB instance identifier for the
  /// encrypted DB instance to be replicated. This identifier must be in the
  /// Amazon Resource Name (ARN) format for the source AWS Region. For example,
  /// if you are creating an encrypted Read Replica from a DB instance in the
  /// us-west-2 AWS Region, then your `SourceDBInstanceIdentifier` looks like
  /// the following example:
  /// `arn:aws:rds:us-west-2:123456789012:instance:mysql-instance1-20161115`.
  ///
  ///
  /// To learn how to generate a Signature Version 4 signed request, see
  /// [Authenticating Requests: Using Query Parameters (AWS Signature Version 4)](https://docs.aws.amazon.com/AmazonS3/latest/API/sigv4-query-string-auth.html)
  /// and
  /// [Signature Version 4 Signing Process](https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html).
  ///
  /// If you supply a value for this operation's `SourceRegion` parameter, a
  /// pre-signed URL will be calculated on your behalf.
  ///
  /// [enableIamDatabaseAuthentication]: A value that indicates whether to
  /// enable mapping of AWS Identity and Access Management (IAM) accounts to
  /// database accounts. By default, mapping is disabled. For information about
  /// the supported DB engines, see CreateDBInstance.
  ///
  /// For more information about IAM database authentication, see
  /// [IAM Database Authentication for MySQL and PostgreSQL](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/UsingWithRDS.IAMDBAuth.html)
  /// in the _Amazon RDS User Guide._
  ///
  /// [enablePerformanceInsights]: A value that indicates whether to enable
  /// Performance Insights for the Read Replica.
  ///
  /// For more information, see
  /// [Using Amazon Performance Insights](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_PerfInsights.html)
  /// in the _Amazon RDS User Guide_.
  ///
  /// [performanceInsightsKmsKeyId]: The AWS KMS key identifier for encryption
  /// of Performance Insights data. The KMS key ID is the Amazon Resource Name
  /// (ARN), KMS key identifier, or the KMS key alias for the KMS encryption
  /// key.
  ///
  /// If you do not specify a value for `PerformanceInsightsKMSKeyId`, then
  /// Amazon RDS uses your default encryption key. AWS KMS creates the default
  /// encryption key for your AWS account. Your AWS account has a different
  /// default encryption key for each AWS Region.
  ///
  /// [performanceInsightsRetentionPeriod]: The amount of time, in days, to
  /// retain Performance Insights data. Valid values are 7 or 731 (2 years).
  ///
  /// [enableCloudwatchLogsExports]: The list of logs that the new DB instance
  /// is to export to CloudWatch Logs. The values in the list depend on the DB
  /// engine being used. For more information, see
  /// [Publishing Database Logs to Amazon CloudWatch Logs](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_LogAccess.html#USER_LogAccess.Procedural.UploadtoCloudWatch)
  ///  in the _Amazon RDS User Guide_.
  ///
  /// [processorFeatures]: The number of CPU cores and the number of threads per
  /// core for the DB instance class of the DB instance.
  ///
  /// [useDefaultProcessorFeatures]: A value that indicates whether the DB
  /// instance class of the DB instance uses its default processor features.
  ///
  /// [deletionProtection]: A value that indicates whether the DB instance has
  /// deletion protection enabled. The database can't be deleted when deletion
  /// protection is enabled. By default, deletion protection is disabled. For
  /// more information, see
  /// [Deleting a DB Instance](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_DeleteInstance.html).
  ///
  /// [sourceRegion]: The ID of the region that contains the source for the read
  /// replica.
  Future<CreateDBInstanceReadReplicaResult> createDBInstanceReadReplica(
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
      String sourceRegion}) async {
    return CreateDBInstanceReadReplicaResult.fromJson({});
  }

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
  /// `character_set_database` parameter. You can use the _Parameter Groups_
  /// option of the [Amazon RDS console](https://console.aws.amazon.com/rds/) or
  /// the _DescribeDBParameters_ command to verify that your DB parameter group
  /// has been created or modified.
  ///
  /// [dbParameterGroupName]: The name of the DB parameter group.
  ///
  /// Constraints:
  ///
  /// *   Must be 1 to 255 letters, numbers, or hyphens.
  ///
  /// *   First character must be a letter
  ///
  /// *   Can't end with a hyphen or contain two consecutive hyphens
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
  /// To list all of the available parameter group families, use the following
  /// command:
  ///
  ///  `aws rds describe-db-engine-versions --query
  /// "DBEngineVersions[].DBParameterGroupFamily"`
  ///
  ///
  ///
  /// The output contains duplicates.
  ///
  /// [description]: The description for the DB parameter group.
  ///
  /// [tags]: Tags to assign to the DB parameter group.
  Future<CreateDBParameterGroupResult> createDBParameterGroup(
      {@required String dbParameterGroupName,
      @required String dbParameterGroupFamily,
      @required String description,
      List<Tag> tags}) async {
    return CreateDBParameterGroupResult.fromJson({});
  }

  /// Creates a new DB security group. DB security groups control access to a DB
  /// instance.
  ///
  ///
  ///
  /// A DB security group controls access to EC2-Classic DB instances that are
  /// not in a VPC.
  ///
  /// [dbSecurityGroupName]: The name for the DB security group. This value is
  /// stored as a lowercase string.
  ///
  /// Constraints:
  ///
  /// *   Must be 1 to 255 letters, numbers, or hyphens.
  ///
  /// *   First character must be a letter
  ///
  /// *   Can't end with a hyphen or contain two consecutive hyphens
  ///
  /// *   Must not be "Default"
  ///
  ///
  /// Example: `mysecuritygroup`
  ///
  /// [dbSecurityGroupDescription]: The description for the DB security group.
  ///
  /// [tags]: Tags to assign to the DB security group.
  Future<CreateDBSecurityGroupResult> createDBSecurityGroup(
      {@required String dbSecurityGroupName,
      @required String dbSecurityGroupDescription,
      List<Tag> tags}) async {
    return CreateDBSecurityGroupResult.fromJson({});
  }

  /// Creates a DBSnapshot. The source DBInstance must be in "available" state.
  ///
  /// [dbSnapshotIdentifier]: The identifier for the DB snapshot.
  ///
  /// Constraints:
  ///
  /// *   Can't be null, empty, or blank
  ///
  /// *   Must contain from 1 to 255 letters, numbers, or hyphens
  ///
  /// *   First character must be a letter
  ///
  /// *   Can't end with a hyphen or contain two consecutive hyphens
  ///
  ///
  /// Example: `my-snapshot-id`
  ///
  /// [dbInstanceIdentifier]: The identifier of the DB instance that you want to
  /// create the snapshot of.
  ///
  /// Constraints:
  ///
  /// *   Must match the identifier of an existing DBInstance.
  Future<CreateDBSnapshotResult> createDBSnapshot(
      {@required String dbSnapshotIdentifier,
      @required String dbInstanceIdentifier,
      List<Tag> tags}) async {
    return CreateDBSnapshotResult.fromJson({});
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
  /// [tags]: Tags to assign to the DB subnet group.
  Future<CreateDBSubnetGroupResult> createDBSubnetGroup(
      {@required String dbSubnetGroupName,
      @required String dbSubnetGroupDescription,
      @required List<String> subnetIds,
      List<Tag> tags}) async {
    return CreateDBSubnetGroupResult.fromJson({});
  }

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
  /// SourceType in the
  /// [Events](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Events.html)
  /// topic in the _Amazon RDS User Guide_ or by using the
  /// **DescribeEventCategories** action.
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
  /// [enabled]:  A value that indicates whether to activate the subscription.
  /// If the event notification subscription is not activated, the subscription
  /// is created but not active.
  Future<CreateEventSubscriptionResult> createEventSubscription(
      {@required String subscriptionName,
      @required String snsTopicArn,
      String sourceType,
      List<String> eventCategories,
      List<String> sourceIds,
      bool enabled,
      List<Tag> tags}) async {
    return CreateEventSubscriptionResult.fromJson({});
  }

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
  ///
  /// [globalClusterIdentifier]: The cluster identifier of the new global
  /// database cluster.
  ///
  /// [sourceDBClusterIdentifier]:  The Amazon Resource Name (ARN) to use as the
  /// primary cluster of the global database. This parameter is optional.
  ///
  /// [engine]: Provides the name of the database engine to be used for this DB
  /// cluster.
  ///
  /// [engineVersion]: The engine version of the Aurora global database.
  ///
  /// [deletionProtection]:  The deletion protection setting for the new global
  /// database. The global database can't be deleted when deletion protection is
  /// enabled.
  ///
  /// [databaseName]:  The name for your database of up to 64 alpha-numeric
  /// characters. If you do not provide a name, Amazon Aurora will not create a
  /// database in the global database cluster you are creating.
  ///
  /// [storageEncrypted]:  The storage encryption setting for the new global
  /// database cluster.
  Future<CreateGlobalClusterResult> createGlobalCluster(
      {String globalClusterIdentifier,
      String sourceDBClusterIdentifier,
      String engine,
      String engineVersion,
      bool deletionProtection,
      String databaseName,
      bool storageEncrypted}) async {
    return CreateGlobalClusterResult.fromJson({});
  }

  /// Creates a new option group. You can create up to 20 option groups.
  ///
  /// [optionGroupName]: Specifies the name of the option group to be created.
  ///
  /// Constraints:
  ///
  /// *   Must be 1 to 255 letters, numbers, or hyphens
  ///
  /// *   First character must be a letter
  ///
  /// *   Can't end with a hyphen or contain two consecutive hyphens
  ///
  ///
  /// Example: `myoptiongroup`
  ///
  /// [engineName]: Specifies the name of the engine that this option group
  /// should be associated with.
  ///
  /// [majorEngineVersion]: Specifies the major version of the engine that this
  /// option group should be associated with.
  ///
  /// [optionGroupDescription]: The description of the option group.
  ///
  /// [tags]: Tags to assign to the option group.
  Future<CreateOptionGroupResult> createOptionGroup(
      {@required String optionGroupName,
      @required String engineName,
      @required String majorEngineVersion,
      @required String optionGroupDescription,
      List<Tag> tags}) async {
    return CreateOptionGroupResult.fromJson({});
  }

  /// The DeleteDBCluster action deletes a previously provisioned DB cluster.
  /// When you delete a DB cluster, all automated backups for that DB cluster
  /// are deleted and can't be recovered. Manual DB cluster snapshots of the
  /// specified DB cluster are not deleted.
  ///
  /// For more information on Amazon Aurora, see
  /// [What Is Amazon Aurora?](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html)
  /// in the _Amazon Aurora User Guide._
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
  ///
  /// [dbClusterIdentifier]: The DB cluster identifier for the DB cluster to be
  /// deleted. This parameter isn't case-sensitive.
  ///
  /// Constraints:
  ///
  /// *   Must match an existing DBClusterIdentifier.
  ///
  /// [skipFinalSnapshot]: A value that indicates whether to skip the creation
  /// of a final DB cluster snapshot before the DB cluster is deleted. If skip
  /// is specified, no DB cluster snapshot is created. If skip is not specified,
  /// a DB cluster snapshot is created before the DB cluster is deleted. By
  /// default, skip is not specified, and the DB cluster snapshot is created. By
  /// default, this parameter is disabled.
  ///
  ///
  ///
  /// You must specify a `FinalDBSnapshotIdentifier` parameter if
  /// `SkipFinalSnapshot` is disabled.
  ///
  /// [finalDBSnapshotIdentifier]:  The DB cluster snapshot identifier of the
  /// new DB cluster snapshot created when `SkipFinalSnapshot` is disabled.
  ///
  ///   Specifying this parameter and also skipping the creation of a final DB
  /// cluster snapshot with the `SkipFinalShapshot` parameter results in an
  /// error.
  ///
  /// Constraints:
  ///
  /// *   Must be 1 to 255 letters, numbers, or hyphens.
  ///
  /// *   First character must be a letter
  ///
  /// *   Can't end with a hyphen or contain two consecutive hyphens
  Future<DeleteDBClusterResult> deleteDBCluster(String dbClusterIdentifier,
      {bool skipFinalSnapshot, String finalDBSnapshotIdentifier}) async {
    return DeleteDBClusterResult.fromJson({});
  }

  /// Deletes a custom endpoint and removes it from an Amazon Aurora DB cluster.
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
  ///
  /// [dbClusterEndpointIdentifier]: The identifier associated with the custom
  /// endpoint. This parameter is stored as a lowercase string.
  Future<DBClusterEndpoint> deleteDBClusterEndpoint(
      String dbClusterEndpointIdentifier) async {
    return DBClusterEndpoint.fromJson({});
  }

  /// Deletes a specified DB cluster parameter group. The DB cluster parameter
  /// group to be deleted can't be associated with any DB clusters.
  ///
  /// For more information on Amazon Aurora, see
  /// [What Is Amazon Aurora?](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html)
  /// in the _Amazon Aurora User Guide._
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
  ///
  /// [dbClusterParameterGroupName]: The name of the DB cluster parameter group.
  ///
  /// Constraints:
  ///
  /// *   Must be the name of an existing DB cluster parameter group.
  ///
  /// *   You can't delete a default DB cluster parameter group.
  ///
  /// *   Can't be associated with any DB clusters.
  Future<void> deleteDBClusterParameterGroup(
      String dbClusterParameterGroupName) async {}

  /// Deletes a DB cluster snapshot. If the snapshot is being copied, the copy
  /// operation is terminated.
  ///
  ///  The DB cluster snapshot must be in the `available` state to be deleted.
  ///
  /// For more information on Amazon Aurora, see
  /// [What Is Amazon Aurora?](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html)
  /// in the _Amazon Aurora User Guide._
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
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
  ///
  /// [dbInstanceIdentifier]: The DB instance identifier for the DB instance to
  /// be deleted. This parameter isn't case-sensitive.
  ///
  /// Constraints:
  ///
  /// *   Must match the name of an existing DB instance.
  ///
  /// [skipFinalSnapshot]: A value that indicates whether to skip the creation
  /// of a final DB snapshot before the DB instance is deleted. If skip is
  /// specified, no DB snapshot is created. If skip is not specified, a DB
  /// snapshot is created before the DB instance is deleted. By default, skip is
  /// not specified, and the DB snapshot is created.
  ///
  /// Note that when a DB instance is in a failure state and has a status of
  /// 'failed', 'incompatible-restore', or 'incompatible-network', it can only
  /// be deleted when skip is specified.
  ///
  /// Specify skip when deleting a Read Replica.
  ///
  ///
  ///
  /// The FinalDBSnapshotIdentifier parameter must be specified if skip is not
  /// specified.
  ///
  /// [finalDBSnapshotIdentifier]:  The `DBSnapshotIdentifier` of the new
  /// `DBSnapshot` created when the `SkipFinalSnapshot` parameter is disabled.
  ///
  ///  Specifying this parameter and also specifying to skip final DB snapshot
  /// creation in SkipFinalShapshot results in an error.
  ///
  /// Constraints:
  ///
  /// *   Must be 1 to 255 letters or numbers.
  ///
  /// *   First character must be a letter.
  ///
  /// *   Can't end with a hyphen or contain two consecutive hyphens.
  ///
  /// *   Can't be specified when deleting a Read Replica.
  ///
  /// [deleteAutomatedBackups]: A value that indicates whether to remove
  /// automated backups immediately after the DB instance is deleted. This
  /// parameter isn't case-sensitive. The default is to remove automated backups
  /// immediately after the DB instance is deleted.
  Future<DeleteDBInstanceResult> deleteDBInstance(String dbInstanceIdentifier,
      {bool skipFinalSnapshot,
      String finalDBSnapshotIdentifier,
      bool deleteAutomatedBackups}) async {
    return DeleteDBInstanceResult.fromJson({});
  }

  /// Deletes automated backups based on the source instance's `DbiResourceId`
  /// value or the restorable instance's resource ID.
  ///
  /// [dbiResourceId]: The identifier for the source DB instance, which can't be
  /// changed and which is unique to an AWS Region.
  Future<DeleteDBInstanceAutomatedBackupResult> deleteDBInstanceAutomatedBackup(
      String dbiResourceId) async {
    return DeleteDBInstanceAutomatedBackupResult.fromJson({});
  }

  /// Deletes a specified DB parameter group. The DB parameter group to be
  /// deleted can't be associated with any DB instances.
  ///
  /// [dbParameterGroupName]: The name of the DB parameter group.
  ///
  /// Constraints:
  ///
  /// *   Must be the name of an existing DB parameter group
  ///
  /// *   You can't delete a default DB parameter group
  ///
  /// *   Can't be associated with any DB instances
  Future<void> deleteDBParameterGroup(String dbParameterGroupName) async {}

  /// Deletes a DB security group.
  ///
  ///
  ///
  /// The specified DB security group must not be associated with any DB
  /// instances.
  ///
  /// [dbSecurityGroupName]: The name of the DB security group to delete.
  ///
  ///  You can't delete the default DB security group.
  ///
  /// Constraints:
  ///
  /// *   Must be 1 to 255 letters, numbers, or hyphens.
  ///
  /// *   First character must be a letter
  ///
  /// *   Can't end with a hyphen or contain two consecutive hyphens
  ///
  /// *   Must not be "Default"
  Future<void> deleteDBSecurityGroup(String dbSecurityGroupName) async {}

  /// Deletes a DB snapshot. If the snapshot is being copied, the copy operation
  /// is terminated.
  ///
  ///
  ///
  /// The DB snapshot must be in the `available` state to be deleted.
  ///
  /// [dbSnapshotIdentifier]: The DB snapshot identifier.
  ///
  /// Constraints: Must be the name of an existing DB snapshot in the
  /// `available` state.
  Future<DeleteDBSnapshotResult> deleteDBSnapshot(
      String dbSnapshotIdentifier) async {
    return DeleteDBSnapshotResult.fromJson({});
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
  Future<void> deleteDBSubnetGroup(String dbSubnetGroupName) async {}

  /// Deletes an RDS event notification subscription.
  ///
  /// [subscriptionName]: The name of the RDS event notification subscription
  /// you want to delete.
  Future<DeleteEventSubscriptionResult> deleteEventSubscription(
      String subscriptionName) async {
    return DeleteEventSubscriptionResult.fromJson({});
  }

  ///  Deletes a global database cluster. The primary and secondary clusters
  /// must already be detached or destroyed first.
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
  ///
  /// [globalClusterIdentifier]:  The cluster identifier of the global database
  /// cluster being deleted.
  Future<DeleteGlobalClusterResult> deleteGlobalCluster(
      String globalClusterIdentifier) async {
    return DeleteGlobalClusterResult.fromJson({});
  }

  /// Deletes an existing option group.
  ///
  /// [optionGroupName]: The name of the option group to be deleted.
  ///
  ///
  ///
  /// You can't delete default option groups.
  Future<void> deleteOptionGroup(String optionGroupName) async {}

  /// Lists all of the attributes for a customer account. The attributes include
  /// Amazon RDS quotas for the account, such as the number of DB instances
  /// allowed. The description for a quota includes the quota name, current
  /// usage toward that quota, and the quota's maximum value.
  ///
  /// This command doesn't take any parameters.
  Future<AccountAttributesMessage> describeAccountAttributes() async {
    return AccountAttributesMessage.fromJson({});
  }

  /// Lists the set of CA certificates provided by Amazon RDS for this AWS
  /// account.
  ///
  /// [certificateIdentifier]: The user-supplied certificate identifier. If this
  /// parameter is specified, information for only the identified certificate is
  /// returned. This parameter isn't case-sensitive.
  ///
  /// Constraints:
  ///
  /// *   Must match an existing CertificateIdentifier.
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
  /// `DescribeCertificates` request. If this parameter is specified, the
  /// response includes only records beyond the marker, up to the value
  /// specified by `MaxRecords`.
  Future<CertificateMessage> describeCertificates(
      {String certificateIdentifier,
      List<Filter> filters,
      int maxRecords,
      String marker}) async {
    return CertificateMessage.fromJson({});
  }

  /// Returns information about backtracks for a DB cluster.
  ///
  /// For more information on Amazon Aurora, see
  /// [What Is Amazon Aurora?](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html)
  /// in the _Amazon Aurora User Guide._
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
  ///
  /// [dbClusterIdentifier]: The DB cluster identifier of the DB cluster to be
  /// described. This parameter is stored as a lowercase string.
  ///
  /// Constraints:
  ///
  /// *   Must contain from 1 to 63 alphanumeric characters or hyphens.
  ///
  /// *   First character must be a letter.
  ///
  /// *   Can't end with a hyphen or contain two consecutive hyphens.
  ///
  ///
  /// Example: `my-cluster1`
  ///
  /// [backtrackIdentifier]: If specified, this value is the backtrack
  /// identifier of the backtrack to be described.
  ///
  /// Constraints:
  ///
  /// *   Must contain a valid universally unique identifier (UUID). For more
  /// information about UUIDs, see
  /// [A Universally Unique Identifier (UUID) URN Namespace](http://www.ietf.org/rfc/rfc4122.txt).
  ///
  ///
  /// Example: `123e4567-e89b-12d3-a456-426655440000`
  ///
  /// [filters]: A filter that specifies one or more DB clusters to describe.
  /// Supported filters include the following:
  ///
  /// *    `db-cluster-backtrack-id` - Accepts backtrack identifiers. The
  /// results list includes information about only the backtracks identified by
  /// these identifiers.
  ///
  /// *    `db-cluster-backtrack-status` - Accepts any of the following
  /// backtrack status values:
  ///
  ///     *    `applying`
  ///
  ///     *    `completed`
  ///
  ///     *    `failed`
  ///
  ///     *    `pending`
  ///
  ///
  ///     The results list includes information about only the backtracks
  /// identified by these values.
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
  /// [marker]:  An optional pagination token provided by a previous
  /// `DescribeDBClusterBacktracks` request. If this parameter is specified, the
  /// response includes only records beyond the marker, up to the value
  /// specified by `MaxRecords`.
  Future<DBClusterBacktrackMessage> describeDBClusterBacktracks(
      String dbClusterIdentifier,
      {String backtrackIdentifier,
      List<Filter> filters,
      int maxRecords,
      String marker}) async {
    return DBClusterBacktrackMessage.fromJson({});
  }

  /// Returns information about endpoints for an Amazon Aurora DB cluster.
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
  ///
  /// [dbClusterIdentifier]: The DB cluster identifier of the DB cluster
  /// associated with the endpoint. This parameter is stored as a lowercase
  /// string.
  ///
  /// [dbClusterEndpointIdentifier]: The identifier of the endpoint to describe.
  /// This parameter is stored as a lowercase string.
  ///
  /// [filters]: A set of name-value pairs that define which endpoints to
  /// include in the output. The filters are specified as name-value pairs, in
  /// the format
  /// `Name=_endpoint_type_,Values=_endpoint_type1_,_endpoint_type2_,...`.
  /// `Name` can be one of: `db-cluster-endpoint-type`,
  /// `db-cluster-endpoint-custom-type`, `db-cluster-endpoint-id`,
  /// `db-cluster-endpoint-status`. `Values` for the  `db-cluster-endpoint-type`
  /// filter can be one or more of: `reader`, `writer`, `custom`. `Values` for
  /// the `db-cluster-endpoint-custom-type` filter can be one or more of:
  /// `reader`, `any`. `Values` for the `db-cluster-endpoint-status` filter can
  /// be one or more of: `available`, `creating`, `deleting`, `modifying`.
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
  /// [marker]:  An optional pagination token provided by a previous
  /// `DescribeDBClusterEndpoints` request. If this parameter is specified, the
  /// response includes only records beyond the marker, up to the value
  /// specified by `MaxRecords`.
  Future<DBClusterEndpointMessage> describeDBClusterEndpoints(
      {String dbClusterIdentifier,
      String dbClusterEndpointIdentifier,
      List<Filter> filters,
      int maxRecords,
      String marker}) async {
    return DBClusterEndpointMessage.fromJson({});
  }

  ///  Returns a list of `DBClusterParameterGroup` descriptions. If a
  /// `DBClusterParameterGroupName` parameter is specified, the list will
  /// contain only the description of the specified DB cluster parameter group.
  ///
  /// For more information on Amazon Aurora, see
  /// [What Is Amazon Aurora?](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html)
  /// in the _Amazon Aurora User Guide._
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
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
    return DBClusterParameterGroupsMessage.fromJson({});
  }

  /// Returns the detailed parameter list for a particular DB cluster parameter
  /// group.
  ///
  /// For more information on Amazon Aurora, see
  /// [What Is Amazon Aurora?](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html)
  /// in the _Amazon Aurora User Guide._
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
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
    return DBClusterParameterGroupDetails.fromJson({});
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
  /// private, use the `ModifyDBClusterSnapshotAttribute` API action.
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
  ///
  /// [dbClusterSnapshotIdentifier]: The identifier for the DB cluster snapshot
  /// to describe the attributes for.
  Future<DescribeDBClusterSnapshotAttributesResult>
      describeDBClusterSnapshotAttributes(
          String dbClusterSnapshotIdentifier) async {
    return DescribeDBClusterSnapshotAttributesResult.fromJson({});
  }

  /// Returns information about DB cluster snapshots. This API action supports
  /// pagination.
  ///
  /// For more information on Amazon Aurora, see
  /// [What Is Amazon Aurora?](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html)
  /// in the _Amazon Aurora User Guide._
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
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
  /// automatically taken by Amazon RDS for my AWS account.
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
  /// cluster snapshots with these results by enabling the `IncludeShared`
  /// parameter. You can include public DB cluster snapshots with these results
  /// by enabling the `IncludePublic` parameter.
  ///
  /// The `IncludeShared` and `IncludePublic` parameters don't apply for
  /// `SnapshotType` values of `manual` or `automated`. The `IncludePublic`
  /// parameter doesn't apply when `SnapshotType` is set to `shared`. The
  /// `IncludeShared` parameter doesn't apply when `SnapshotType` is set to
  /// `public`.
  ///
  /// [filters]: A filter that specifies one or more DB cluster snapshots to
  /// describe.
  ///
  /// Supported filters:
  ///
  /// *    `db-cluster-id` - Accepts DB cluster identifiers and DB cluster
  /// Amazon Resource Names (ARNs).
  ///
  /// *    `db-cluster-snapshot-id` - Accepts DB cluster snapshot identifiers.
  ///
  /// *    `snapshot-type` - Accepts types of DB cluster snapshots.
  ///
  /// *    `engine` - Accepts names of database engines.
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
  /// [includeShared]: A value that indicates whether to include shared manual
  /// DB cluster snapshots from other AWS accounts that this AWS account has
  /// been given permission to copy or restore. By default, these snapshots are
  /// not included.
  ///
  /// You can give an AWS account permission to restore a manual DB cluster
  /// snapshot from another AWS account by the
  /// `ModifyDBClusterSnapshotAttribute` API action.
  ///
  /// [includePublic]: A value that indicates whether to include manual DB
  /// cluster snapshots that are public and can be copied or restored by any AWS
  /// account. By default, the public snapshots are not included.
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
    return DBClusterSnapshotMessage.fromJson({});
  }

  /// Returns information about provisioned Aurora DB clusters. This API
  /// supports pagination.
  ///
  /// For more information on Amazon Aurora, see
  /// [What Is Amazon Aurora?](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html)
  /// in the _Amazon Aurora User Guide._
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
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
  /// `DescribeDBClusters` request. If this parameter is specified, the response
  /// includes only records beyond the marker, up to the value specified by
  /// `MaxRecords`.
  ///
  /// [includeShared]: Optional Boolean parameter that specifies whether the
  /// output includes information about clusters shared from other AWS accounts.
  Future<DBClusterMessage> describeDBClusters(
      {String dbClusterIdentifier,
      List<Filter> filters,
      int maxRecords,
      String marker,
      bool includeShared}) async {
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
  /// *   If supplied, must match an existing DBParameterGroupFamily.
  ///
  /// [filters]: This parameter is not currently supported.
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
  /// [defaultOnly]: A value that indicates whether only the default version of
  /// the specified engine or engine and major version combination is returned.
  ///
  /// [listSupportedCharacterSets]: A value that indicates whether to list the
  /// supported character sets for each engine version.
  ///
  /// If this parameter is enabled and the requested engine supports the
  /// `CharacterSetName` parameter for `CreateDBInstance`, the response includes
  /// a list of supported character sets for each engine version.
  ///
  /// [listSupportedTimezones]: A value that indicates whether to list the
  /// supported time zones for each engine version.
  ///
  /// If this parameter is enabled and the requested engine supports the
  /// `TimeZone` parameter for `CreateDBInstance`, the response includes a list
  /// of supported time zones for each engine version.
  ///
  /// [includeAll]: A value that indicates whether to include engine versions
  /// that aren't available in the list. The default is to list only available
  /// engine versions.
  Future<DBEngineVersionMessage> describeDBEngineVersions(
      {String engine,
      String engineVersion,
      String dbParameterGroupFamily,
      List<Filter> filters,
      int maxRecords,
      String marker,
      bool defaultOnly,
      bool listSupportedCharacterSets,
      bool listSupportedTimezones,
      bool includeAll}) async {
    return DBEngineVersionMessage.fromJson({});
  }

  /// Displays backups for both current and deleted instances. For example, use
  /// this operation to find details about automated backups for previously
  /// deleted instances. Current instances with retention periods greater than
  /// zero (0) are returned for both the `DescribeDBInstanceAutomatedBackups`
  /// and `DescribeDBInstances` operations.
  ///
  /// All parameters are optional.
  ///
  /// [dbiResourceId]: The resource ID of the DB instance that is the source of
  /// the automated backup. This parameter isn't case-sensitive.
  ///
  /// [dbInstanceIdentifier]: (Optional) The user-supplied instance identifier.
  /// If this parameter is specified, it must match the identifier of an
  /// existing DB instance. It returns information from the specific DB
  /// instance' automated backup. This parameter isn't case-sensitive.
  ///
  /// [filters]: A filter that specifies which resources to return based on
  /// status.
  ///
  /// Supported filters are the following:
  ///
  /// *    `status`
  ///
  ///     *    `active` - automated backups for current instances
  ///
  ///     *    `retained` - automated backups for deleted instances
  ///
  ///     *    `creating` - automated backups that are waiting for the first
  /// automated snapshot to be available
  ///
  ///
  /// *    `db-instance-id` - Accepts DB instance identifiers and Amazon
  /// Resource Names (ARNs) for DB instances. The results list includes only
  /// information about the DB instance automated backupss identified by these
  /// ARNs.
  ///
  /// *    `dbi-resource-id` - Accepts DB instance resource identifiers and DB
  /// Amazon Resource Names (ARNs) for DB instances. The results list includes
  /// only information about the DB instance resources identified by these ARNs.
  ///
  ///
  /// Returns all resources by default. The status for each resource is
  /// specified in the response.
  ///
  /// [maxRecords]: The maximum number of records to include in the response. If
  /// more records exist than the specified `MaxRecords` value, a pagination
  /// token called a marker is included in the response so that the remaining
  /// results can be retrieved.
  ///
  /// [marker]: The pagination token provided in the previous request. If this
  /// parameter is specified the response includes only records beyond the
  /// marker, up to `MaxRecords`.
  Future<DBInstanceAutomatedBackupMessage> describeDBInstanceAutomatedBackups(
      {String dbiResourceId,
      String dbInstanceIdentifier,
      List<Filter> filters,
      int maxRecords,
      String marker}) async {
    return DBInstanceAutomatedBackupMessage.fromJson({});
  }

  /// Returns information about provisioned RDS instances. This API supports
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
  /// *    `dbi-resource-id` - Accepts DB instance resource identifiers. The
  /// results list will only include information about the DB instances
  /// identified by these resource identifiers.
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
    return DBInstanceMessage.fromJson({});
  }

  /// Returns a list of DB log files for the DB instance.
  ///
  /// [dbInstanceIdentifier]: The customer-assigned name of the DB instance that
  /// contains the log files you want to list.
  ///
  /// Constraints:
  ///
  /// *   Must match the identifier of an existing DBInstance.
  ///
  /// [filenameContains]: Filters the available log files for log file names
  /// that contain the specified string.
  ///
  /// [fileLastWritten]: Filters the available log files for files written since
  /// the specified date, in POSIX timestamp format with milliseconds.
  ///
  /// [fileSize]: Filters the available log files for files larger than the
  /// specified size.
  ///
  /// [filters]: This parameter is not currently supported.
  ///
  /// [maxRecords]: The maximum number of records to include in the response. If
  /// more records exist than the specified MaxRecords value, a pagination token
  /// called a marker is included in the response so that the remaining results
  /// can be retrieved.
  ///
  /// [marker]: The pagination token provided in the previous request. If this
  /// parameter is specified the response includes only records beyond the
  /// marker, up to MaxRecords.
  Future<DescribeDBLogFilesResponse> describeDBLogFiles(
      String dbInstanceIdentifier,
      {String filenameContains,
      BigInt fileLastWritten,
      BigInt fileSize,
      List<Filter> filters,
      int maxRecords,
      String marker}) async {
    return DescribeDBLogFilesResponse.fromJson({});
  }

  ///  Returns a list of `DBParameterGroup` descriptions. If a
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
  /// `DescribeDBParameterGroups` request. If this parameter is specified, the
  /// response includes only records beyond the marker, up to the value
  /// specified by `MaxRecords`.
  Future<DBParameterGroupsMessage> describeDBParameterGroups(
      {String dbParameterGroupName,
      List<Filter> filters,
      int maxRecords,
      String marker}) async {
    return DBParameterGroupsMessage.fromJson({});
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
  /// `DescribeDBParameters` request. If this parameter is specified, the
  /// response includes only records beyond the marker, up to the value
  /// specified by `MaxRecords`.
  Future<DBParameterGroupDetails> describeDBParameters(
      String dbParameterGroupName,
      {String source,
      List<Filter> filters,
      int maxRecords,
      String marker}) async {
    return DBParameterGroupDetails.fromJson({});
  }

  ///  Returns a list of `DBSecurityGroup` descriptions. If a
  /// `DBSecurityGroupName` is specified, the list will contain only the
  /// descriptions of the specified DB security group.
  ///
  /// [dbSecurityGroupName]: The name of the DB security group to return details
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
  /// `DescribeDBSecurityGroups` request. If this parameter is specified, the
  /// response includes only records beyond the marker, up to the value
  /// specified by `MaxRecords`.
  Future<DBSecurityGroupMessage> describeDBSecurityGroups(
      {String dbSecurityGroupName,
      List<Filter> filters,
      int maxRecords,
      String marker}) async {
    return DBSecurityGroupMessage.fromJson({});
  }

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
  ///
  /// [dbSnapshotIdentifier]: The identifier for the DB snapshot to describe the
  /// attributes for.
  Future<DescribeDBSnapshotAttributesResult> describeDBSnapshotAttributes(
      String dbSnapshotIdentifier) async {
    return DescribeDBSnapshotAttributesResult.fromJson({});
  }

  /// Returns information about DB snapshots. This API action supports
  /// pagination.
  ///
  /// [dbInstanceIdentifier]: The ID of the DB instance to retrieve the list of
  /// DB snapshots for. This parameter can't be used in conjunction with
  /// `DBSnapshotIdentifier`. This parameter is not case-sensitive.
  ///
  /// Constraints:
  ///
  /// *   If supplied, must match the identifier of an existing DBInstance.
  ///
  /// [dbSnapshotIdentifier]:  A specific DB snapshot identifier to describe.
  /// This parameter can't be used in conjunction with `DBInstanceIdentifier`.
  /// This value is stored as a lowercase string.
  ///
  /// Constraints:
  ///
  /// *   If supplied, must match the identifier of an existing DBSnapshot.
  ///
  /// *   If this identifier is for an automated snapshot, the `SnapshotType`
  /// parameter must also be specified.
  ///
  /// [snapshotType]: The type of snapshots to be returned. You can specify one
  /// of the following values:
  ///
  /// *    `automated` - Return all DB snapshots that have been automatically
  /// taken by Amazon RDS for my AWS account.
  ///
  /// *    `manual` - Return all DB snapshots that have been taken by my AWS
  /// account.
  ///
  /// *    `shared` - Return all manual DB snapshots that have been shared to my
  /// AWS account.
  ///
  /// *    `public` - Return all DB snapshots that have been marked as public.
  ///
  /// *    `awsbackup` - Return the DB snapshots managed by the AWS Backup
  /// service.
  ///
  ///     For information about AWS Backup, see the
  /// [_AWS Backup Developer Guide._](https://docs.aws.amazon.com/aws-backup/latest/devguide/whatisbackup.html)
  ///
  ///
  ///     The `awsbackup` type does not apply to Aurora.
  ///
  ///
  /// If you don't specify a `SnapshotType` value, then both automated and
  /// manual snapshots are returned. Shared and public DB snapshots are not
  /// included in the returned results by default. You can include shared
  /// snapshots with these results by enabling the `IncludeShared` parameter.
  /// You can include public snapshots with these results by enabling the
  /// `IncludePublic` parameter.
  ///
  /// The `IncludeShared` and `IncludePublic` parameters don't apply for
  /// `SnapshotType` values of `manual` or `automated`. The `IncludePublic`
  /// parameter doesn't apply when `SnapshotType` is set to `shared`. The
  /// `IncludeShared` parameter doesn't apply when `SnapshotType` is set to
  /// `public`.
  ///
  /// [filters]: A filter that specifies one or more DB snapshots to describe.
  ///
  /// Supported filters:
  ///
  /// *    `db-instance-id` - Accepts DB instance identifiers and DB instance
  /// Amazon Resource Names (ARNs).
  ///
  /// *    `db-snapshot-id` - Accepts DB snapshot identifiers.
  ///
  /// *    `dbi-resource-id` - Accepts identifiers of source DB instances.
  ///
  /// *    `snapshot-type` - Accepts types of DB snapshots.
  ///
  /// *    `engine` - Accepts names of database engines.
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
  /// `DescribeDBSnapshots` request. If this parameter is specified, the
  /// response includes only records beyond the marker, up to the value
  /// specified by `MaxRecords`.
  ///
  /// [includeShared]: A value that indicates whether to include shared manual
  /// DB cluster snapshots from other AWS accounts that this AWS account has
  /// been given permission to copy or restore. By default, these snapshots are
  /// not included.
  ///
  /// You can give an AWS account permission to restore a manual DB snapshot
  /// from another AWS account by using the `ModifyDBSnapshotAttribute` API
  /// action.
  ///
  /// [includePublic]: A value that indicates whether to include manual DB
  /// cluster snapshots that are public and can be copied or restored by any AWS
  /// account. By default, the public snapshots are not included.
  ///
  /// You can share a manual DB snapshot as public by using the
  /// ModifyDBSnapshotAttribute API.
  ///
  /// [dbiResourceId]: A specific DB resource ID to describe.
  Future<DBSnapshotMessage> describeDBSnapshots(
      {String dbInstanceIdentifier,
      String dbSnapshotIdentifier,
      String snapshotType,
      List<Filter> filters,
      int maxRecords,
      String marker,
      bool includeShared,
      bool includePublic,
      String dbiResourceId}) async {
    return DBSnapshotMessage.fromJson({});
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
    return DBSubnetGroupMessage.fromJson({});
  }

  /// Returns the default engine and system parameter information for the
  /// cluster database engine.
  ///
  /// For more information on Amazon Aurora, see
  /// [What Is Amazon Aurora?](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html)
  /// in the _Amazon Aurora User Guide._
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
    return DescribeEngineDefaultClusterParametersResult.fromJson({});
  }

  /// Returns the default engine and system parameter information for the
  /// specified database engine.
  ///
  /// [dbParameterGroupFamily]: The name of the DB parameter group family.
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
  /// `DescribeEngineDefaultParameters` request. If this parameter is specified,
  /// the response includes only records beyond the marker, up to the value
  /// specified by `MaxRecords`.
  Future<DescribeEngineDefaultParametersResult> describeEngineDefaultParameters(
      String dbParameterGroupFamily,
      {List<Filter> filters,
      int maxRecords,
      String marker}) async {
    return DescribeEngineDefaultParametersResult.fromJson({});
  }

  /// Displays a list of categories for all event source types, or, if
  /// specified, for a specified source type. You can see a list of the event
  /// categories and source types in the
  /// [Events](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Events.html)
  /// topic in the _Amazon RDS User Guide._
  ///
  /// [sourceType]: The type of source that is generating the events.
  ///
  /// Valid values: db-instance | db-parameter-group | db-security-group |
  /// db-snapshot
  ///
  /// [filters]: This parameter is not currently supported.
  Future<EventCategoriesMessage> describeEventCategories(
      {String sourceType, List<Filter> filters}) async {
    return EventCategoriesMessage.fromJson({});
  }

  /// Lists all the subscription descriptions for a customer account. The
  /// description for a subscription includes SubscriptionName, SNSTopicARN,
  /// CustomerID, SourceType, SourceID, CreationTime, and Status.
  ///
  /// If you specify a SubscriptionName, lists the description for that
  /// subscription.
  ///
  /// [subscriptionName]: The name of the RDS event notification subscription
  /// you want to describe.
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
    return EventSubscriptionsMessage.fromJson({});
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
  /// *   Can't end with a hyphen or contain two consecutive hyphens.
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
    return EventsMessage.fromJson({});
  }

  ///  Returns information about Aurora global database clusters. This API
  /// supports pagination.
  ///
  ///  For more information on Amazon Aurora, see
  /// [What Is Amazon Aurora?](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html)
  /// in the _Amazon Aurora User Guide._
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
  ///
  /// [globalClusterIdentifier]:  The user-supplied DB cluster identifier. If
  /// this parameter is specified, information from only the specific DB cluster
  /// is returned. This parameter isn't case-sensitive.
  ///
  /// Constraints:
  ///
  /// *   If supplied, must match an existing DBClusterIdentifier.
  ///
  /// [filters]: A filter that specifies one or more global DB clusters to
  /// describe.
  ///
  /// Supported filters:
  ///
  /// *    `db-cluster-id` - Accepts DB cluster identifiers and DB cluster
  /// Amazon Resource Names (ARNs). The results list will only include
  /// information about the DB clusters identified by these ARNs.
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
  /// `DescribeGlobalClusters` request. If this parameter is specified, the
  /// response includes only records beyond the marker, up to the value
  /// specified by `MaxRecords`.
  Future<GlobalClustersMessage> describeGlobalClusters(
      {String globalClusterIdentifier,
      List<Filter> filters,
      int maxRecords,
      String marker}) async {
    return GlobalClustersMessage.fromJson({});
  }

  /// Describes all available options.
  ///
  /// [engineName]: A required parameter. Options available for the given engine
  /// name are described.
  ///
  /// [majorEngineVersion]: If specified, filters the results to include only
  /// options for the specified major engine version.
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
  /// [marker]: An optional pagination token provided by a previous request. If
  /// this parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords`.
  Future<OptionGroupOptionsMessage> describeOptionGroupOptions(
      String engineName,
      {String majorEngineVersion,
      List<Filter> filters,
      int maxRecords,
      String marker}) async {
    return OptionGroupOptionsMessage.fromJson({});
  }

  /// Describes the available option groups.
  ///
  /// [optionGroupName]: The name of the option group to describe. Can't be
  /// supplied together with EngineName or MajorEngineVersion.
  ///
  /// [filters]: This parameter is not currently supported.
  ///
  /// [marker]:  An optional pagination token provided by a previous
  /// DescribeOptionGroups request. If this parameter is specified, the response
  /// includes only records beyond the marker, up to the value specified by
  /// `MaxRecords`.
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
  /// [engineName]: Filters the list of option groups to only include groups
  /// associated with a specific database engine.
  ///
  /// [majorEngineVersion]: Filters the list of option groups to only include
  /// groups associated with a specific database engine version. If specified,
  /// then EngineName must also be specified.
  Future<OptionGroups> describeOptionGroups(
      {String optionGroupName,
      List<Filter> filters,
      String marker,
      int maxRecords,
      String engineName,
      String majorEngineVersion}) async {
    return OptionGroups.fromJson({});
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
  /// [vpc]: A value that indicates whether to show only VPC or non-VPC
  /// offerings.
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
    return PendingMaintenanceActionsMessage.fromJson({});
  }

  /// Returns information about reserved DB instances for this account, or about
  /// a specified reserved DB instance.
  ///
  /// [reservedDBInstanceId]: The reserved DB instance identifier filter value.
  /// Specify this parameter to show only the reservation that matches the
  /// specified reservation ID.
  ///
  /// [reservedDBInstancesOfferingId]: The offering identifier filter value.
  /// Specify this parameter to show only purchased reservations matching the
  /// specified offering identifier.
  ///
  /// [dbInstanceClass]: The DB instance class filter value. Specify this
  /// parameter to show only those reservations matching the specified DB
  /// instances class.
  ///
  /// [duration]: The duration filter value, specified in years or seconds.
  /// Specify this parameter to show only reservations for this duration.
  ///
  /// Valid Values: `1 | 3 | 31536000 | 94608000`
  ///
  /// [productDescription]: The product description filter value. Specify this
  /// parameter to show only those reservations matching the specified product
  /// description.
  ///
  /// [offeringType]: The offering type filter value. Specify this parameter to
  /// show only the available offerings matching the specified offering type.
  ///
  /// Valid Values: `"Partial Upfront" | "All Upfront" | "No Upfront"`
  ///
  /// [multiAZ]: A value that indicates whether to show only those reservations
  /// that support Multi-AZ.
  ///
  /// [filters]: This parameter is not currently supported.
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
  Future<ReservedDBInstanceMessage> describeReservedDBInstances(
      {String reservedDBInstanceId,
      String reservedDBInstancesOfferingId,
      String dbInstanceClass,
      String duration,
      String productDescription,
      String offeringType,
      bool multiAZ,
      List<Filter> filters,
      int maxRecords,
      String marker}) async {
    return ReservedDBInstanceMessage.fromJson({});
  }

  /// Lists available reserved DB instance offerings.
  ///
  /// [reservedDBInstancesOfferingId]: The offering identifier filter value.
  /// Specify this parameter to show only the available offering that matches
  /// the specified reservation identifier.
  ///
  /// Example: `438012d3-4052-4cc7-b2e3-8d3372e0e706`
  ///
  /// [dbInstanceClass]: The DB instance class filter value. Specify this
  /// parameter to show only the available offerings matching the specified DB
  /// instance class.
  ///
  /// [duration]: Duration filter value, specified in years or seconds. Specify
  /// this parameter to show only reservations for this duration.
  ///
  /// Valid Values: `1 | 3 | 31536000 | 94608000`
  ///
  /// [productDescription]: Product description filter value. Specify this
  /// parameter to show only the available offerings that contain the specified
  /// product description.
  ///
  ///
  ///
  /// The results show offerings that partially match the filter value.
  ///
  /// [offeringType]: The offering type filter value. Specify this parameter to
  /// show only the available offerings matching the specified offering type.
  ///
  /// Valid Values: `"Partial Upfront" | "All Upfront" | "No Upfront"`
  ///
  /// [multiAZ]: A value that indicates whether to show only those reservations
  /// that support Multi-AZ.
  ///
  /// [filters]: This parameter is not currently supported.
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
  Future<ReservedDBInstancesOfferingMessage>
      describeReservedDBInstancesOfferings(
          {String reservedDBInstancesOfferingId,
          String dbInstanceClass,
          String duration,
          String productDescription,
          String offeringType,
          bool multiAZ,
          List<Filter> filters,
          int maxRecords,
          String marker}) async {
    return ReservedDBInstancesOfferingMessage.fromJson({});
  }

  /// Returns a list of the source AWS Regions where the current AWS Region can
  /// create a Read Replica or copy a DB snapshot from. This API action supports
  /// pagination.
  ///
  /// [regionName]: The source AWS Region name. For example, `us-east-1`.
  ///
  /// Constraints:
  ///
  /// *   Must specify a valid AWS Region name.
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
  /// `DescribeSourceRegions` request. If this parameter is specified, the
  /// response includes only records beyond the marker, up to the value
  /// specified by `MaxRecords`.
  ///
  /// [filters]: This parameter is not currently supported.
  Future<SourceRegionMessage> describeSourceRegions(
      {String regionName,
      int maxRecords,
      String marker,
      List<Filter> filters}) async {
    return SourceRegionMessage.fromJson({});
  }

  /// You can call `DescribeValidDBInstanceModifications` to learn what
  /// modifications you can make to your DB instance. You can use this
  /// information when you call `ModifyDBInstance`.
  ///
  /// [dbInstanceIdentifier]: The customer identifier or the ARN of your DB
  /// instance.
  Future<DescribeValidDBInstanceModificationsResult>
      describeValidDBInstanceModifications(String dbInstanceIdentifier) async {
    return DescribeValidDBInstanceModificationsResult.fromJson({});
  }

  /// Downloads all or a portion of the specified log file, up to 1 MB in size.
  ///
  /// [dbInstanceIdentifier]: The customer-assigned name of the DB instance that
  /// contains the log files you want to list.
  ///
  /// Constraints:
  ///
  /// *   Must match the identifier of an existing DBInstance.
  ///
  /// [logFileName]: The name of the log file to be downloaded.
  ///
  /// [marker]: The pagination token provided in the previous request or "0". If
  /// the Marker parameter is specified the response includes only records
  /// beyond the marker until the end of the file or up to NumberOfLines.
  ///
  /// [numberOfLines]: The number of lines to download. If the number of lines
  /// specified results in a file over 1 MB in size, the file is truncated at 1
  /// MB in size.
  ///
  /// If the NumberOfLines parameter is specified, then the block of lines
  /// returned can be from the beginning or the end of the log file, depending
  /// on the value of the Marker parameter.
  ///
  /// *   If neither Marker or NumberOfLines are specified, the entire log file
  /// is returned up to a maximum of 10000 lines, starting with the most recent
  /// log entries first.
  ///
  /// *   If NumberOfLines is specified and Marker is not specified, then the
  /// most recent lines from the end of the log file are returned.
  ///
  /// *   If Marker is specified as "0", then the specified number of lines from
  /// the beginning of the log file are returned.
  ///
  /// *   You can download the log file in blocks of lines by specifying the
  /// size of the block using the NumberOfLines parameter, and by specifying a
  /// value of "0" for the Marker parameter in your first request. Include the
  /// Marker value returned in the response as the Marker value for the next
  /// request, continuing until the AdditionalDataPending response element
  /// returns false.
  Future<DownloadDBLogFilePortionDetails> downloadDBLogFilePortion(
      {@required String dbInstanceIdentifier,
      @required String logFileName,
      String marker,
      int numberOfLines}) async {
    return DownloadDBLogFilePortionDetails.fromJson({});
  }

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
  /// For more information on Amazon Aurora, see
  /// [What Is Amazon Aurora?](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html)
  /// in the _Amazon Aurora User Guide._
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
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
  /// You must specify the instance identifier for an Aurora Replica in the DB
  /// cluster. For example, `mydbcluster-replica1`.
  Future<FailoverDBClusterResult> failoverDBCluster(String dbClusterIdentifier,
      {String targetDBInstanceIdentifier}) async {
    return FailoverDBClusterResult.fromJson({});
  }

  /// Lists all tags on an Amazon RDS resource.
  ///
  /// For an overview on tagging an Amazon RDS resource, see
  /// [Tagging Amazon RDS Resources](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Overview.Tagging.html)
  /// in the _Amazon RDS User Guide_.
  ///
  /// [resourceName]: The Amazon RDS resource with tags to be listed. This value
  /// is an Amazon Resource Name (ARN). For information about creating an ARN,
  /// see
  /// [Constructing an ARN for Amazon RDS](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Tagging.ARN.html#USER_Tagging.ARN.Constructing)
  /// in the _Amazon RDS User Guide_.
  ///
  /// [filters]: This parameter is not currently supported.
  Future<TagListMessage> listTagsForResource(String resourceName,
      {List<Filter> filters}) async {
    return TagListMessage.fromJson({});
  }

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
  /// For more information about Aurora Serverless, see
  /// [Using Amazon Aurora Serverless](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-serverless.html)
  /// in the _Amazon Aurora User Guide_.
  ///
  ///  If you call `ModifyCurrentDBClusterCapacity` with the default
  /// `TimeoutAction`, connections that prevent Aurora Serverless from finding a
  /// scaling point might be dropped. For more information about scaling points,
  /// see
  /// [Autoscaling for Aurora Serverless](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-serverless.how-it-works.html#aurora-serverless.how-it-works.auto-scaling)
  /// in the _Amazon Aurora User Guide_.
  ///
  /// This action only applies to Aurora DB clusters.
  ///
  /// [dbClusterIdentifier]: The DB cluster identifier for the cluster being
  /// modified. This parameter is not case-sensitive.
  ///
  /// Constraints:
  ///
  /// *   Must match the identifier of an existing DB cluster.
  ///
  /// [capacity]: The DB cluster capacity.
  ///
  /// When you change the capacity of a paused Aurora Serverless DB cluster, it
  /// automatically resumes.
  ///
  /// Constraints:
  ///
  /// *   Value must be `1`, `2`, `4`, `8`, `16`, `32`, `64`, `128`, or `256`.
  ///
  /// [secondsBeforeTimeout]: The amount of time, in seconds, that Aurora
  /// Serverless tries to find a scaling point to perform seamless scaling
  /// before enforcing the timeout action. The default is 300.
  ///
  /// *   Value must be from 10 through 600.
  ///
  /// [timeoutAction]: The action to take when the timeout is reached, either
  /// `ForceApplyCapacityChange` or `RollbackCapacityChange`.
  ///
  ///  `ForceApplyCapacityChange`, the default, sets the capacity to the
  /// specified value as soon as possible.
  ///
  ///  `RollbackCapacityChange` ignores the capacity change if a scaling point
  /// is not found in the timeout period.
  Future<DBClusterCapacityInfo> modifyCurrentDBClusterCapacity(
      String dbClusterIdentifier,
      {int capacity,
      int secondsBeforeTimeout,
      String timeoutAction}) async {
    return DBClusterCapacityInfo.fromJson({});
  }

  /// Modify a setting for an Amazon Aurora DB cluster. You can change one or
  /// more database configuration parameters by specifying these parameters and
  /// the new values in the request. For more information on Amazon Aurora, see
  /// [What Is Amazon Aurora?](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html)
  /// in the _Amazon Aurora User Guide._
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
  ///
  /// [dbClusterIdentifier]: The DB cluster identifier for the cluster being
  /// modified. This parameter is not case-sensitive.
  ///
  /// Constraints: This identifier must match the identifier of an existing DB
  /// cluster.
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
  /// *   Can't end with a hyphen or contain two consecutive hyphens
  ///
  ///
  /// Example: `my-cluster2`
  ///
  /// [applyImmediately]: A value that indicates whether the modifications in
  /// this request and any pending modifications are asynchronously applied as
  /// soon as possible, regardless of the `PreferredMaintenanceWindow` setting
  /// for the DB cluster. If this parameter is disabled, changes to the DB
  /// cluster are applied during the next maintenance window.
  ///
  /// The `ApplyImmediately` parameter only affects the
  /// `EnableIAMDatabaseAuthentication`, `MasterUserPassword`, and
  /// `NewDBClusterIdentifier` values. If the `ApplyImmediately` parameter is
  /// disabled, then changes to the `EnableIAMDatabaseAuthentication`,
  /// `MasterUserPassword`, and `NewDBClusterIdentifier` values are applied
  /// during the next maintenance window. All other changes are applied
  /// immediately, regardless of the value of the `ApplyImmediately` parameter.
  ///
  /// By default, this parameter is disabled.
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
  /// `ApplyImmediately` is enabled for this request. If the parameter change
  /// results in an option group that enables OEM, this change can cause a brief
  /// (sub-second) period during which new connections are rejected but existing
  /// connections are not interrupted.
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
  /// of time for each AWS Region. To see the time blocks available, see
  /// [Adjusting the Preferred DB Cluster Maintenance Window](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_UpgradeDBInstance.Maintenance.html#AdjustingTheMaintenanceWindow.Aurora)
  /// in the _Amazon Aurora User Guide._
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
  /// [Adjusting the Preferred DB Cluster Maintenance Window](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_UpgradeDBInstance.Maintenance.html#AdjustingTheMaintenanceWindow.Aurora)
  /// in the _Amazon Aurora User Guide._
  ///
  /// Valid Days: Mon, Tue, Wed, Thu, Fri, Sat, Sun.
  ///
  /// Constraints: Minimum 30-minute window.
  ///
  /// [enableIamDatabaseAuthentication]: A value that indicates whether to
  /// enable mapping of AWS Identity and Access Management (IAM) accounts to
  /// database accounts. By default, mapping is disabled.
  ///
  /// For more information, see
  /// [IAM Database Authentication](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/UsingWithRDS.IAMDBAuth.html)
  /// in the _Amazon Aurora User Guide._
  ///
  /// [backtrackWindow]: The target backtrack window, in seconds. To disable
  /// backtracking, set this value to 0.
  ///
  /// Default: 0
  ///
  /// Constraints:
  ///
  /// *   If specified, this value must be set to a number from 0 to 259,200 (72
  /// hours).
  ///
  /// [cloudwatchLogsExportConfiguration]: The configuration setting for the log
  /// types to be enabled for export to CloudWatch Logs for a specific DB
  /// cluster.
  ///
  /// [engineVersion]: The version number of the database engine to which you
  /// want to upgrade. Changing this parameter results in an outage. The change
  /// is applied during the next maintenance window unless `ApplyImmediately` is
  /// enabled.
  ///
  /// To list all of the available engine versions for `aurora` (for MySQL
  /// 5.6-compatible Aurora), use the following command:
  ///
  ///  `aws rds describe-db-engine-versions --engine aurora --query
  /// "DBEngineVersions[].EngineVersion"`
  ///
  /// To list all of the available engine versions for `aurora-mysql` (for MySQL
  /// 5.7-compatible Aurora), use the following command:
  ///
  ///  `aws rds describe-db-engine-versions --engine aurora-mysql --query
  /// "DBEngineVersions[].EngineVersion"`
  ///
  /// To list all of the available engine versions for `aurora-postgresql`, use
  /// the following command:
  ///
  ///  `aws rds describe-db-engine-versions --engine aurora-postgresql --query
  /// "DBEngineVersions[].EngineVersion"`
  ///
  /// [allowMajorVersionUpgrade]: A value that indicates whether major version
  /// upgrades are allowed.
  ///
  /// Constraints: You must allow major version upgrades when specifying a value
  /// for the `EngineVersion` parameter that is a different major version than
  /// the DB cluster's current version.
  ///
  /// [dbInstanceParameterGroupName]: The name of the DB parameter group to
  /// apply to all instances of the DB cluster.
  ///
  ///  When you apply a parameter group using the `DBInstanceParameterGroupName`
  /// parameter, the DB cluster isn't rebooted automatically. Also, parameter
  /// changes aren't applied during the next maintenance window but instead are
  /// applied immediately.
  ///
  /// Default: The existing name setting
  ///
  /// Constraints:
  ///
  /// *   The DB parameter group must be in the same DB parameter group family
  /// as this DB cluster.
  ///
  /// *   The `DBInstanceParameterGroupName` parameter is only valid in
  /// combination with the `AllowMajorVersionUpgrade` parameter.
  ///
  /// [scalingConfiguration]: The scaling properties of the DB cluster. You can
  /// only modify scaling properties for DB clusters in `serverless` DB engine
  /// mode.
  ///
  /// [deletionProtection]: A value that indicates whether the DB cluster has
  /// deletion protection enabled. The database can't be deleted when deletion
  /// protection is enabled. By default, deletion protection is disabled.
  ///
  /// [enableHttpEndpoint]: A value that indicates whether to enable the HTTP
  /// endpoint for an Aurora Serverless DB cluster. By default, the HTTP
  /// endpoint is disabled.
  ///
  /// When enabled, the HTTP endpoint provides a connectionless web service API
  /// for running SQL queries on the Aurora Serverless DB cluster. You can also
  /// query your database from inside the RDS console with the query editor.
  ///
  /// For more information, see
  /// [Using the Data API for Aurora Serverless](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/data-api.html)
  /// in the _Amazon Aurora User Guide_.
  ///
  /// [copyTagsToSnapshot]: A value that indicates whether to copy all tags from
  /// the DB cluster to snapshots of the DB cluster. The default is not to copy
  /// them.
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
      BigInt backtrackWindow,
      CloudwatchLogsExportConfiguration cloudwatchLogsExportConfiguration,
      String engineVersion,
      bool allowMajorVersionUpgrade,
      String dbInstanceParameterGroupName,
      ScalingConfiguration scalingConfiguration,
      bool deletionProtection,
      bool enableHttpEndpoint,
      bool copyTagsToSnapshot}) async {
    return ModifyDBClusterResult.fromJson({});
  }

  /// Modifies the properties of an endpoint in an Amazon Aurora DB cluster.
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
  ///
  /// [dbClusterEndpointIdentifier]: The identifier of the endpoint to modify.
  /// This parameter is stored as a lowercase string.
  ///
  /// [endpointType]: The type of the endpoint. One of: `READER`, `WRITER`,
  /// `ANY`.
  ///
  /// [staticMembers]: List of DB instance identifiers that are part of the
  /// custom endpoint group.
  ///
  /// [excludedMembers]: List of DB instance identifiers that aren't part of the
  /// custom endpoint group. All other eligible instances are reachable through
  /// the custom endpoint. Only relevant if the list of static members is empty.
  Future<DBClusterEndpoint> modifyDBClusterEndpoint(
      String dbClusterEndpointIdentifier,
      {String endpointType,
      List<String> staticMembers,
      List<String> excludedMembers}) async {
    return DBClusterEndpoint.fromJson({});
  }

  ///  Modifies the parameters of a DB cluster parameter group. To modify more
  /// than one parameter, submit a list of the following: `ParameterName`,
  /// `ParameterValue`, and `ApplyMethod`. A maximum of 20 parameters can be
  /// modified in a single request.
  ///
  /// For more information on Amazon Aurora, see
  /// [What Is Amazon Aurora?](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html)
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
  /// `character_set_database` parameter. You can use the _Parameter Groups_
  /// option of the [Amazon RDS console](https://console.aws.amazon.com/rds/) or
  /// the `DescribeDBClusterParameters` action to verify that your DB cluster
  /// parameter group has been created or modified.
  ///
  /// This action only applies to Aurora DB clusters.
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
    return ModifyDBClusterSnapshotAttributeResult.fromJson({});
  }

  /// Modifies settings for a DB instance. You can change one or more database
  /// configuration parameters by specifying these parameters and the new values
  /// in the request. To learn what modifications you can make to your DB
  /// instance, call `DescribeValidDBInstanceModifications` before you call
  /// `ModifyDBInstance`.
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
  /// For MariaDB, MySQL, Oracle, and PostgreSQL, the value supplied must be at
  /// least 10% greater than the current value. Values that are not at least 10%
  /// greater than the existing value are rounded up so that they are 10%
  /// greater than the current value.
  ///
  /// For the valid values for allocated storage for each engine, see
  /// `CreateDBInstance`.
  ///
  /// [dbInstanceClass]: The new compute and memory capacity of the DB instance,
  /// for example, `db.m4.large`. Not all DB instance classes are available in
  /// all AWS Regions, or for all database engines. For the full list of DB
  /// instance classes, and availability for your engine, see
  /// [DB Instance Class](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.DBInstanceClass.html)
  /// in the _Amazon RDS User Guide._
  ///
  /// If you modify the DB instance class, an outage occurs during the change.
  /// The change is applied during the next maintenance window, unless
  /// `ApplyImmediately` is enabled for this request.
  ///
  /// Default: Uses existing setting
  ///
  /// [dbSubnetGroupName]: The new DB subnet group for the DB instance. You can
  /// use this parameter to move your DB instance to a different VPC. If your DB
  /// instance is not in a VPC, you can also use this parameter to move your DB
  /// instance into a VPC. For more information, see
  /// [Updating the VPC for a DB Instance](http://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_VPC.WorkingWithRDSInstanceinaVPC.html#USER_VPC.Non-VPC2VPC)
  /// in the _Amazon RDS User Guide._
  ///
  /// Changing the subnet group causes an outage during the change. The change
  /// is applied during the next maintenance window, unless you enable
  /// `ApplyImmediately`.
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
  ///  **Amazon Aurora**
  ///
  /// Not applicable. The associated list of EC2 VPC security groups is managed
  /// by the DB cluster. For more information, see `ModifyDBCluster`.
  ///
  /// Constraints:
  ///
  /// *   If supplied, must match existing VpcSecurityGroupIds.
  ///
  /// [applyImmediately]: A value that indicates whether the modifications in
  /// this request and any pending modifications are asynchronously applied as
  /// soon as possible, regardless of the `PreferredMaintenanceWindow` setting
  /// for the DB instance. By default, this parameter is disabled.
  ///
  ///  If this parameter is disabled, changes to the DB instance are applied
  /// during the next maintenance window. Some parameter changes can cause an
  /// outage and are applied on the next call to RebootDBInstance, or the next
  /// failure reboot. Review the table of parameters in
  /// [Modifying a DB Instance](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Overview.DBInstance.Modifying.html)
  /// in the _Amazon RDS User Guide._ to see the impact of enabling or disabling
  /// `ApplyImmediately` for each modified parameter and to determine when the
  /// changes are applied.
  ///
  /// [masterUserPassword]: The new password for the master user. The password
  /// can include any printable ASCII character except "/", """, or "@".
  ///
  ///  Changing this parameter doesn't result in an outage and the change is
  /// asynchronously applied as soon as possible. Between the time of the
  /// request and the completion of the request, the `MasterUserPassword`
  /// element exists in the `PendingModifiedValues` element of the operation
  /// response.
  ///
  ///  **Amazon Aurora**
  ///
  /// Not applicable. The password for the master user is managed by the DB
  /// cluster. For more information, see `ModifyDBCluster`.
  ///
  /// Default: Uses existing setting
  ///
  ///  **MariaDB**
  ///
  /// Constraints: Must contain from 8 to 41 characters.
  ///
  ///  **Microsoft SQL Server**
  ///
  /// Constraints: Must contain from 8 to 128 characters.
  ///
  ///  **MySQL**
  ///
  /// Constraints: Must contain from 8 to 41 characters.
  ///
  ///  **Oracle**
  ///
  /// Constraints: Must contain from 8 to 30 characters.
  ///
  ///  **PostgreSQL**
  ///
  /// Constraints: Must contain from 8 to 128 characters.
  ///
  ///
  ///
  /// Amazon RDS API actions never return the password, so this action provides
  /// a way to regain access to a primary instance user if the password is lost.
  /// This includes restoring privileges that might have been accidentally
  /// revoked.
  ///
  /// [dbParameterGroupName]: The name of the DB parameter group to apply to the
  /// DB instance. Changing this setting doesn't result in an outage. The
  /// parameter group name itself is changed immediately, but the actual
  /// parameter changes are not applied until you reboot the instance without
  /// failover. In this case, the DB instance isn't rebooted automatically and
  /// the parameter changes isn't applied during the next maintenance window.
  ///
  /// Default: Uses existing setting
  ///
  /// Constraints: The DB parameter group must be in the same DB parameter group
  /// family as this DB instance.
  ///
  /// [backupRetentionPeriod]: The number of days to retain automated backups.
  /// Setting this parameter to a positive number enables backups. Setting this
  /// parameter to 0 disables automated backups.
  ///
  /// Changing this parameter can result in an outage if you change from 0 to a
  /// non-zero value or from a non-zero value to 0. These changes are applied
  /// during the next maintenance window unless the `ApplyImmediately` parameter
  /// is enabled for this request. If you change the parameter from one non-zero
  /// value to another non-zero value, the change is asynchronously applied as
  /// soon as possible.
  ///
  ///  **Amazon Aurora**
  ///
  /// Not applicable. The retention period for automated backups is managed by
  /// the DB cluster. For more information, see `ModifyDBCluster`.
  ///
  /// Default: Uses existing setting
  ///
  /// Constraints:
  ///
  /// *   Must be a value from 0 to 35
  ///
  /// *   Can be specified for a MySQL Read Replica only if the source is
  /// running MySQL 5.6 or later
  ///
  /// *   Can be specified for a PostgreSQL Read Replica only if the source is
  /// running PostgreSQL 9.3.5
  ///
  /// *   Can't be set to 0 if the DB instance is a source to Read Replicas
  ///
  /// [preferredBackupWindow]:  The daily time range during which automated
  /// backups are created if automated backups are enabled, as determined by the
  /// `BackupRetentionPeriod` parameter. Changing this parameter doesn't result
  /// in an outage and the change is asynchronously applied as soon as possible.
  ///
  ///  **Amazon Aurora**
  ///
  /// Not applicable. The daily time range for creating automated backups is
  /// managed by the DB cluster. For more information, see `ModifyDBCluster`.
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
  /// [multiAZ]: A value that indicates whether the DB instance is a Multi-AZ
  /// deployment. Changing this parameter doesn't result in an outage and the
  /// change is applied during the next maintenance window unless the
  /// `ApplyImmediately` parameter is enabled for this request.
  ///
  /// [engineVersion]:  The version number of the database engine to upgrade to.
  /// Changing this parameter results in an outage and the change is applied
  /// during the next maintenance window unless the `ApplyImmediately` parameter
  /// is eanbled for this request.
  ///
  /// For major version upgrades, if a nondefault DB parameter group is
  /// currently in use, a new DB parameter group in the DB parameter group
  /// family for the new engine version must be specified. The new DB parameter
  /// group can be the default for that DB parameter group family.
  ///
  /// For information about valid engine versions, see `CreateDBInstance`, or
  /// call `DescribeDBEngineVersions`.
  ///
  /// [allowMajorVersionUpgrade]: A value that indicates whether major version
  /// upgrades are allowed. Changing this parameter doesn't result in an outage
  /// and the change is asynchronously applied as soon as possible.
  ///
  /// Constraints: Major version upgrades must be allowed when specifying a
  /// value for the EngineVersion parameter that is a different major version
  /// than the DB instance's current version.
  ///
  /// [autoMinorVersionUpgrade]:  A value that indicates whether minor version
  /// upgrades are applied automatically to the DB instance during the
  /// maintenance window. Changing this parameter doesn't result in an outage
  /// except in the following case and the change is asynchronously applied as
  /// soon as possible. An outage results if this parameter is enabled during
  /// the maintenance window, and a newer minor version is available, and RDS
  /// has enabled auto patching for that engine version.
  ///
  /// [licenseModel]: The license model for the DB instance.
  ///
  /// Valid values: `license-included` | `bring-your-own-license` |
  /// `general-public-license`
  ///
  /// [iops]: The new Provisioned IOPS (I/O operations per second) value for the
  /// RDS instance.
  ///
  /// Changing this setting doesn't result in an outage and the change is
  /// applied during the next maintenance window unless the `ApplyImmediately`
  /// parameter is enabled for this request. If you are migrating from
  /// Provisioned IOPS to standard storage, set this value to 0. The DB instance
  /// will require a reboot for the change in storage type to take effect.
  ///
  /// If you choose to migrate your DB instance from using standard storage to
  /// using Provisioned IOPS, or from using Provisioned IOPS to using standard
  /// storage, the process can take time. The duration of the migration depends
  /// on several factors such as database load, storage size, storage type
  /// (standard or Provisioned IOPS), amount of IOPS provisioned (if any), and
  /// the number of prior scale storage operations. Typical migration times are
  /// under 24 hours, but the process can take up to several days in some cases.
  /// During the migration, the DB instance is available for use, but might
  /// experience performance degradation. While the migration takes place,
  /// nightly backups for the instance are suspended. No other Amazon RDS
  /// operations can take place for the instance, including modifying the
  /// instance, rebooting the instance, deleting the instance, creating a Read
  /// Replica for the instance, and creating a DB snapshot of the instance.
  ///
  /// Constraints: For MariaDB, MySQL, Oracle, and PostgreSQL, the value
  /// supplied must be at least 10% greater than the current value. Values that
  /// are not at least 10% greater than the existing value are rounded up so
  /// that they are 10% greater than the current value.
  ///
  /// Default: Uses existing setting
  ///
  /// [optionGroupName]:  Indicates that the DB instance should be associated
  /// with the specified option group. Changing this parameter doesn't result in
  /// an outage except in the following case and the change is applied during
  /// the next maintenance window unless the `ApplyImmediately` parameter is
  /// enabled for this request. If the parameter change results in an option
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
  /// identifier, an instance reboot occurs immediately if you enable
  /// `ApplyImmediately`, or will occur during the next maintenance window if
  /// you disable Apply Immediately. This value is stored as a lowercase string.
  ///
  /// Constraints:
  ///
  /// *   Must contain from 1 to 63 letters, numbers, or hyphens.
  ///
  /// *   The first character must be a letter.
  ///
  /// *   Can't end with a hyphen or contain two consecutive hyphens.
  ///
  ///
  /// Example: `mydbinstance`
  ///
  /// [storageType]: Specifies the storage type to be associated with the DB
  /// instance.
  ///
  /// If you specify Provisioned IOPS (`io1`), you must also include a value for
  /// the `Iops` parameter.
  ///
  /// If you choose to migrate your DB instance from using standard storage to
  /// using Provisioned IOPS, or from using Provisioned IOPS to using standard
  /// storage, the process can take time. The duration of the migration depends
  /// on several factors such as database load, storage size, storage type
  /// (standard or Provisioned IOPS), amount of IOPS provisioned (if any), and
  /// the number of prior scale storage operations. Typical migration times are
  /// under 24 hours, but the process can take up to several days in some cases.
  /// During the migration, the DB instance is available for use, but might
  /// experience performance degradation. While the migration takes place,
  /// nightly backups for the instance are suspended. No other Amazon RDS
  /// operations can take place for the instance, including modifying the
  /// instance, rebooting the instance, deleting the instance, creating a Read
  /// Replica for the instance, and creating a DB snapshot of the instance.
  ///
  ///  Valid values: `standard | gp2 | io1`
  ///
  /// Default: `io1` if the `Iops` parameter is specified, otherwise `gp2`
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
  /// [domain]: The Active Directory Domain to move the instance to. Specify
  /// `none` to remove the instance from its current domain. The domain must be
  /// created prior to this operation. Currently only a Microsoft SQL Server
  /// instance can be created in a Active Directory Domain.
  ///
  /// [copyTagsToSnapshot]: A value that indicates whether to copy all tags from
  /// the DB instance to snapshots of the DB instance. By default, tags are not
  /// copied.
  ///
  ///  **Amazon Aurora**
  ///
  /// Not applicable. Copying tags to snapshots is managed by the DB cluster.
  /// Setting this value for an Aurora DB instance has no effect on the DB
  /// cluster setting. For more information, see `ModifyDBCluster`.
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
  ///  **MySQL**
  ///
  ///  Default: `3306`
  ///
  ///  Valid Values: `1150-65535`
  ///
  ///  **MariaDB**
  ///
  ///  Default: `3306`
  ///
  ///  Valid Values: `1150-65535`
  ///
  ///  **PostgreSQL**
  ///
  ///  Default: `5432`
  ///
  ///  Valid Values: `1150-65535`
  ///
  /// Type: Integer
  ///
  ///  **Oracle**
  ///
  ///  Default: `1521`
  ///
  ///  Valid Values: `1150-65535`
  ///
  ///  **SQL Server**
  ///
  ///  Default: `1433`
  ///
  ///  Valid Values: `1150-65535` except for `1434`, `3389`, `47001`, `49152`,
  /// and `49152` through `49156`.
  ///
  ///  **Amazon Aurora**
  ///
  ///  Default: `3306`
  ///
  ///  Valid Values: `1150-65535`
  ///
  /// [publiclyAccessible]: A value that indicates whether the DB instance is
  /// publicly accessible. When the DB instance is publicly accessible, it is an
  /// Internet-facing instance with a publicly resolvable DNS name, which
  /// resolves to a public IP address. When the DB instance is not publicly
  /// accessible, it is an internal instance with a DNS name that resolves to a
  /// private IP address.
  ///
  ///  `PubliclyAccessible` only applies to DB instances in a VPC. The DB
  /// instance must be part of a public subnet and `PubliclyAccessible` must be
  /// enabled for it to be publicly accessible.
  ///
  /// Changes to the `PubliclyAccessible` parameter are applied immediately
  /// regardless of the value of the `ApplyImmediately` parameter.
  ///
  /// [monitoringRoleArn]: The ARN for the IAM role that permits RDS to send
  /// enhanced monitoring metrics to Amazon CloudWatch Logs. For example,
  /// `arn:aws:iam:123456789012:role/emaccess`. For information on creating a
  /// monitoring role, go to
  /// [To create an IAM role for Amazon RDS Enhanced Monitoring](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Monitoring.html#USER_Monitoring.OS.IAMRole)
  /// in the _Amazon RDS User Guide._
  ///
  /// If `MonitoringInterval` is set to a value other than 0, then you must
  /// supply a `MonitoringRoleArn` value.
  ///
  /// [domainIamRoleName]: The name of the IAM role to use when making API calls
  /// to the Directory Service.
  ///
  /// [promotionTier]: A value that specifies the order in which an Aurora
  /// Replica is promoted to the primary instance after a failure of the
  /// existing primary instance. For more information, see
  /// [Fault Tolerance for an Aurora DB Cluster](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/Aurora.Managing.Backups.html#Aurora.Managing.FaultTolerance)
  /// in the _Amazon Aurora User Guide_.
  ///
  /// Default: 1
  ///
  /// Valid Values: 0 - 15
  ///
  /// [enableIamDatabaseAuthentication]: A value that indicates whether to
  /// enable mapping of AWS Identity and Access Management (IAM) accounts to
  /// database accounts. By default, mapping is disabled. For information about
  /// the supported DB engines, see CreateDBInstance.
  ///
  /// For more information about IAM database authentication, see
  /// [IAM Database Authentication for MySQL and PostgreSQL](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/UsingWithRDS.IAMDBAuth.html)
  /// in the _Amazon RDS User Guide._
  ///
  /// [enablePerformanceInsights]: A value that indicates whether to enable
  /// Performance Insights for the DB instance.
  ///
  /// For more information, see
  /// [Using Amazon Performance Insights](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_PerfInsights.html)
  /// in the _Amazon Relational Database Service User Guide_.
  ///
  /// [performanceInsightsKmsKeyId]: The AWS KMS key identifier for encryption
  /// of Performance Insights data. The KMS key ID is the Amazon Resource Name
  /// (ARN), KMS key identifier, or the KMS key alias for the KMS encryption
  /// key.
  ///
  /// If you do not specify a value for `PerformanceInsightsKMSKeyId`, then
  /// Amazon RDS uses your default encryption key. AWS KMS creates the default
  /// encryption key for your AWS account. Your AWS account has a different
  /// default encryption key for each AWS Region.
  ///
  /// [performanceInsightsRetentionPeriod]: The amount of time, in days, to
  /// retain Performance Insights data. Valid values are 7 or 731 (2 years).
  ///
  /// [cloudwatchLogsExportConfiguration]: The configuration setting for the log
  /// types to be enabled for export to CloudWatch Logs for a specific DB
  /// instance.
  ///
  /// A change to the `CloudwatchLogsExportConfiguration` parameter is always
  /// applied to the DB instance immediately. Therefore, the `ApplyImmediately`
  /// parameter has no effect.
  ///
  /// [processorFeatures]: The number of CPU cores and the number of threads per
  /// core for the DB instance class of the DB instance.
  ///
  /// [useDefaultProcessorFeatures]: A value that indicates whether the DB
  /// instance class of the DB instance uses its default processor features.
  ///
  /// [deletionProtection]: A value that indicates whether the DB instance has
  /// deletion protection enabled. The database can't be deleted when deletion
  /// protection is enabled. By default, deletion protection is disabled. For
  /// more information, see
  /// [Deleting a DB Instance](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_DeleteInstance.html).
  ///
  /// [maxAllocatedStorage]: The upper limit to which Amazon RDS can
  /// automatically scale the storage of the DB instance.
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
      int performanceInsightsRetentionPeriod,
      CloudwatchLogsExportConfiguration cloudwatchLogsExportConfiguration,
      List<ProcessorFeature> processorFeatures,
      bool useDefaultProcessorFeatures,
      bool deletionProtection,
      int maxAllocatedStorage}) async {
    return ModifyDBInstanceResult.fromJson({});
  }

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
  /// `character_set_database` parameter. You can use the _Parameter Groups_
  /// option of the [Amazon RDS console](https://console.aws.amazon.com/rds/) or
  /// the _DescribeDBParameters_ command to verify that your DB parameter group
  /// has been created or modified.
  ///
  /// [dbParameterGroupName]: The name of the DB parameter group.
  ///
  /// Constraints:
  ///
  /// *   If supplied, must match the name of an existing `DBParameterGroup`.
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
    return DBParameterGroupNameMessage.fromJson({});
  }

  /// Updates a manual DB snapshot, which can be encrypted or not encrypted,
  /// with a new engine version.
  ///
  /// Amazon RDS supports upgrading DB snapshots for MySQL and Oracle.
  ///
  /// [dbSnapshotIdentifier]: The identifier of the DB snapshot to modify.
  ///
  /// [engineVersion]: The engine version to upgrade the DB snapshot to.
  ///
  /// The following are the database engines and engine versions that are
  /// available when you upgrade a DB snapshot.
  ///
  ///  **MySQL**
  ///
  /// *    `5.5.46` (supported for 5.1 DB snapshots)
  ///
  ///
  ///  **Oracle**
  ///
  /// *    `12.1.0.2.v8` (supported for 12.1.0.1 DB snapshots)
  ///
  /// *    `11.2.0.4.v12` (supported for 11.2.0.2 DB snapshots)
  ///
  /// *    `11.2.0.4.v11` (supported for 11.2.0.3 DB snapshots)
  ///
  /// [optionGroupName]: The option group to identify with the upgraded DB
  /// snapshot.
  ///
  /// You can specify this parameter when you upgrade an Oracle DB snapshot. The
  /// same option group considerations apply when upgrading a DB snapshot as
  /// when upgrading a DB instance. For more information, see
  /// [Option Group Considerations](http://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_UpgradeDBInstance.Oracle.html#USER_UpgradeDBInstance.Oracle.OGPG.OG)
  /// in the _Amazon RDS User Guide._
  Future<ModifyDBSnapshotResult> modifyDBSnapshot(String dbSnapshotIdentifier,
      {String engineVersion, String optionGroupName}) async {
    return ModifyDBSnapshotResult.fromJson({});
  }

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
  ///
  /// [dbSnapshotIdentifier]: The identifier for the DB snapshot to modify the
  /// attributes for.
  ///
  /// [attributeName]: The name of the DB snapshot attribute to modify.
  ///
  /// To manage authorization for other AWS accounts to copy or restore a manual
  /// DB snapshot, set this value to `restore`.
  ///
  /// [valuesToAdd]: A list of DB snapshot attributes to add to the attribute
  /// specified by `AttributeName`.
  ///
  /// To authorize other AWS accounts to copy or restore a manual snapshot, set
  /// this list to include one or more AWS account IDs, or `all` to make the
  /// manual DB snapshot restorable by any AWS account. Do not add the `all`
  /// value for any manual DB snapshots that contain private information that
  /// you don't want available to all AWS accounts.
  ///
  /// [valuesToRemove]: A list of DB snapshot attributes to remove from the
  /// attribute specified by `AttributeName`.
  ///
  /// To remove authorization for other AWS accounts to copy or restore a manual
  /// snapshot, set this list to include one or more AWS account identifiers, or
  /// `all` to remove authorization for any AWS account to copy or restore the
  /// DB snapshot. If you specify `all`, an AWS account whose account ID is
  /// explicitly added to the `restore` attribute can still copy or restore the
  /// manual DB snapshot.
  Future<ModifyDBSnapshotAttributeResult> modifyDBSnapshotAttribute(
      {@required String dbSnapshotIdentifier,
      @required String attributeName,
      List<String> valuesToAdd,
      List<String> valuesToRemove}) async {
    return ModifyDBSnapshotAttributeResult.fromJson({});
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
    return ModifyDBSubnetGroupResult.fromJson({});
  }

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
  ///
  /// [subscriptionName]: The name of the RDS event notification subscription.
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
  /// SourceType in the
  /// [Events](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Events.html)
  /// topic in the _Amazon RDS User Guide_ or by using the
  /// **DescribeEventCategories** action.
  ///
  /// [enabled]:  A value that indicates whether to activate the subscription.
  Future<ModifyEventSubscriptionResult> modifyEventSubscription(
      String subscriptionName,
      {String snsTopicArn,
      String sourceType,
      List<String> eventCategories,
      bool enabled}) async {
    return ModifyEventSubscriptionResult.fromJson({});
  }

  ///  Modify a setting for an Amazon Aurora global cluster. You can change one
  /// or more database configuration parameters by specifying these parameters
  /// and the new values in the request. For more information on Amazon Aurora,
  /// see
  /// [What Is Amazon Aurora?](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html)
  /// in the _Amazon Aurora User Guide._
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
  ///
  /// [globalClusterIdentifier]:  The DB cluster identifier for the global
  /// cluster being modified. This parameter is not case-sensitive.
  ///
  /// Constraints:
  ///
  /// *   Must match the identifier of an existing global database cluster.
  ///
  /// [newGlobalClusterIdentifier]:  The new cluster identifier for the global
  /// database cluster when modifying a global database cluster. This value is
  /// stored as a lowercase string.
  ///
  /// Constraints:
  ///
  /// *   Must contain from 1 to 63 letters, numbers, or hyphens
  ///
  /// *   The first character must be a letter
  ///
  /// *   Can't end with a hyphen or contain two consecutive hyphens
  ///
  ///
  /// Example: `my-cluster2`
  ///
  /// [deletionProtection]:  Indicates if the global database cluster has
  /// deletion protection enabled. The global database cluster can't be deleted
  /// when deletion protection is enabled.
  Future<ModifyGlobalClusterResult> modifyGlobalCluster(
      {String globalClusterIdentifier,
      String newGlobalClusterIdentifier,
      bool deletionProtection}) async {
    return ModifyGlobalClusterResult.fromJson({});
  }

  /// Modifies an existing option group.
  ///
  /// [optionGroupName]: The name of the option group to be modified.
  ///
  /// Permanent options, such as the TDE option for Oracle Advanced Security
  /// TDE, can't be removed from an option group, and that option group can't be
  /// removed from a DB instance once it is associated with a DB instance
  ///
  /// [optionsToInclude]: Options in this list are added to the option group or,
  /// if already present, the specified configuration is used to update the
  /// existing configuration.
  ///
  /// [optionsToRemove]: Options in this list are removed from the option group.
  ///
  /// [applyImmediately]: A value that indicates whether to apply the change
  /// immediately or during the next maintenance window for each instance
  /// associated with the option group.
  Future<ModifyOptionGroupResult> modifyOptionGroup(String optionGroupName,
      {List<OptionConfiguration> optionsToInclude,
      List<String> optionsToRemove,
      bool applyImmediately}) async {
    return ModifyOptionGroupResult.fromJson({});
  }

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
  ///
  /// [dbInstanceIdentifier]: The DB instance identifier. This value is stored
  /// as a lowercase string.
  ///
  /// Constraints:
  ///
  /// *   Must match the identifier of an existing Read Replica DB instance.
  ///
  ///
  /// Example: `mydbinstance`
  ///
  /// [backupRetentionPeriod]: The number of days for which automated backups
  /// are retained. Setting this parameter to a positive number enables backups.
  /// Setting this parameter to 0 disables automated backups.
  ///
  /// Default: 1
  ///
  /// Constraints:
  ///
  /// *   Must be a value from 0 to 35.
  ///
  /// *   Can't be set to 0 if the DB instance is a source to Read Replicas.
  ///
  /// [preferredBackupWindow]:  The daily time range during which automated
  /// backups are created if automated backups are enabled, using the
  /// `BackupRetentionPeriod` parameter.
  ///
  ///  The default is a 30-minute window selected at random from an 8-hour block
  /// of time for each AWS Region. To see the time blocks available, see
  /// [Adjusting the Preferred Maintenance Window](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/AdjustingTheMaintenanceWindow.html)
  /// in the _Amazon RDS User Guide._
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
  Future<PromoteReadReplicaResult> promoteReadReplica(
      String dbInstanceIdentifier,
      {int backupRetentionPeriod,
      String preferredBackupWindow}) async {
    return PromoteReadReplicaResult.fromJson({});
  }

  /// Promotes a Read Replica DB cluster to a standalone DB cluster.
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
  ///
  /// [dbClusterIdentifier]: The identifier of the DB cluster Read Replica to
  /// promote. This parameter is not case-sensitive.
  ///
  /// Constraints:
  ///
  /// *   Must match the identifier of an existing DBCluster Read Replica.
  ///
  ///
  /// Example: `my-cluster-replica1`
  Future<PromoteReadReplicaDBClusterResult> promoteReadReplicaDBCluster(
      String dbClusterIdentifier) async {
    return PromoteReadReplicaDBClusterResult.fromJson({});
  }

  /// Purchases a reserved DB instance offering.
  ///
  /// [reservedDBInstancesOfferingId]: The ID of the Reserved DB instance
  /// offering to purchase.
  ///
  /// Example: 438012d3-4052-4cc7-b2e3-8d3372e0e706
  ///
  /// [reservedDBInstanceId]: Customer-specified identifier to track this
  /// reservation.
  ///
  /// Example: myreservationID
  ///
  /// [dbInstanceCount]: The number of instances to reserve.
  ///
  /// Default: `1`
  Future<PurchaseReservedDBInstancesOfferingResult>
      purchaseReservedDBInstancesOffering(String reservedDBInstancesOfferingId,
          {String reservedDBInstanceId,
          int dbInstanceCount,
          List<Tag> tags}) async {
    return PurchaseReservedDBInstancesOfferingResult.fromJson({});
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
  /// For more information about rebooting, see
  /// [Rebooting a DB Instance](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_RebootInstance.html)
  /// in the _Amazon RDS User Guide._
  ///
  /// [dbInstanceIdentifier]: The DB instance identifier. This parameter is
  /// stored as a lowercase string.
  ///
  /// Constraints:
  ///
  /// *   Must match the identifier of an existing DBInstance.
  ///
  /// [forceFailover]:  A value that indicates whether the reboot is conducted
  /// through a Multi-AZ failover.
  ///
  /// Constraint: You can't enable force failover if the instance is not
  /// configured for Multi-AZ.
  Future<RebootDBInstanceResult> rebootDBInstance(String dbInstanceIdentifier,
      {bool forceFailover}) async {
    return RebootDBInstanceResult.fromJson({});
  }

  ///  Detaches an Aurora secondary cluster from an Aurora global database
  /// cluster. The cluster becomes a standalone cluster with read-write
  /// capability instead of being read-only and receiving data from a primary
  /// cluster in a different region.
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
  ///
  /// [globalClusterIdentifier]:  The cluster identifier to detach from the
  /// Aurora global database cluster.
  ///
  /// [dbClusterIdentifier]:  The Amazon Resource Name (ARN) identifying the
  /// cluster that was detached from the Aurora global database cluster.
  Future<RemoveFromGlobalClusterResult> removeFromGlobalCluster(
      {String globalClusterIdentifier, String dbClusterIdentifier}) async {
    return RemoveFromGlobalClusterResult.fromJson({});
  }

  /// Disassociates an AWS Identity and Access Management (IAM) role from an
  /// Amazon Aurora DB cluster. For more information, see
  /// [Authorizing Amazon Aurora MySQL to Access Other AWS Services on Your Behalf](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraMySQL.Integrating.Authorizing.html)
  ///  in the _Amazon Aurora User Guide_.
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
  ///
  /// [dbClusterIdentifier]: The name of the DB cluster to disassociate the IAM
  /// role from.
  ///
  /// [roleArn]: The Amazon Resource Name (ARN) of the IAM role to disassociate
  /// from the Aurora DB cluster, for example
  /// `arn:aws:iam::123456789012:role/AuroraAccessRole`.
  ///
  /// [featureName]: The name of the feature for the DB cluster that the IAM
  /// role is to be disassociated from. For the list of supported feature names,
  /// see DBEngineVersion.
  Future<void> removeRoleFromDBCluster(
      {@required String dbClusterIdentifier,
      @required String roleArn,
      String featureName}) async {}

  /// Disassociates an AWS Identity and Access Management (IAM) role from a DB
  /// instance.
  ///
  /// [dbInstanceIdentifier]: The name of the DB instance to disassociate the
  /// IAM role from.
  ///
  /// [roleArn]: The Amazon Resource Name (ARN) of the IAM role to disassociate
  /// from the DB instance, for example
  /// `arn:aws:iam::123456789012:role/AccessRole`.
  ///
  /// [featureName]: The name of the feature for the DB instance that the IAM
  /// role is to be disassociated from. For the list of supported feature names,
  /// see `DBEngineVersion`.
  Future<void> removeRoleFromDBInstance(
      {@required String dbInstanceIdentifier,
      @required String roleArn,
      @required String featureName}) async {}

  /// Removes a source identifier from an existing RDS event notification
  /// subscription.
  ///
  /// [subscriptionName]: The name of the RDS event notification subscription
  /// you want to remove a source identifier from.
  ///
  /// [sourceIdentifier]:  The source identifier to be removed from the
  /// subscription, such as the **DB instance identifier** for a DB instance or
  /// the name of a security group.
  Future<RemoveSourceIdentifierFromSubscriptionResult>
      removeSourceIdentifierFromSubscription(
          {@required String subscriptionName,
          @required String sourceIdentifier}) async {
    return RemoveSourceIdentifierFromSubscriptionResult.fromJson({});
  }

  /// Removes metadata tags from an Amazon RDS resource.
  ///
  /// For an overview on tagging an Amazon RDS resource, see
  /// [Tagging Amazon RDS Resources](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Overview.Tagging.html)
  /// in the _Amazon RDS User Guide._
  ///
  /// [resourceName]: The Amazon RDS resource that the tags are removed from.
  /// This value is an Amazon Resource Name (ARN). For information about
  /// creating an ARN, see
  /// [Constructing an ARN for Amazon RDS](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Tagging.ARN.html#USER_Tagging.ARN.Constructing)
  /// in the _Amazon RDS User Guide._
  ///
  /// [tagKeys]: The tag key (name) of the tag to be removed.
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
  /// For more information on Amazon Aurora, see
  /// [What Is Amazon Aurora?](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html)
  /// in the _Amazon Aurora User Guide._
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
  ///
  /// [dbClusterParameterGroupName]: The name of the DB cluster parameter group
  /// to reset.
  ///
  /// [resetAllParameters]: A value that indicates whether to reset all
  /// parameters in the DB cluster parameter group to their default values. You
  /// can't use this parameter if there is a list of parameter names specified
  /// for the `Parameters` parameter.
  ///
  /// [parameters]: A list of parameter names in the DB cluster parameter group
  /// to reset to the default values. You can't use this parameter if the
  /// `ResetAllParameters` parameter is enabled.
  Future<DBClusterParameterGroupNameMessage> resetDBClusterParameterGroup(
      String dbClusterParameterGroupName,
      {bool resetAllParameters,
      List<Parameter> parameters}) async {
    return DBClusterParameterGroupNameMessage.fromJson({});
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
  /// *   Must match the name of an existing `DBParameterGroup`.
  ///
  /// [resetAllParameters]:  A value that indicates whether to reset all
  /// parameters in the DB parameter group to default values. By default, all
  /// parameters in the DB parameter group are reset to default values.
  ///
  /// [parameters]: To reset the entire DB parameter group, specify the
  /// `DBParameterGroup` name and `ResetAllParameters` parameters. To reset
  /// specific parameters, provide a list of the following: `ParameterName` and
  /// `ApplyMethod`. A maximum of 20 parameters can be modified in a single
  /// request.
  ///
  ///  **MySQL**
  ///
  /// Valid Values (for Apply method): `immediate` | `pending-reboot`
  ///
  /// You can use the immediate value with dynamic parameters only. You can use
  /// the `pending-reboot` value for both dynamic and static parameters, and
  /// changes are applied when DB instance reboots.
  ///
  ///  **MariaDB**
  ///
  /// Valid Values (for Apply method): `immediate` | `pending-reboot`
  ///
  /// You can use the immediate value with dynamic parameters only. You can use
  /// the `pending-reboot` value for both dynamic and static parameters, and
  /// changes are applied when DB instance reboots.
  ///
  ///  **Oracle**
  ///
  /// Valid Values (for Apply method): `pending-reboot`
  Future<DBParameterGroupNameMessage> resetDBParameterGroup(
      String dbParameterGroupName,
      {bool resetAllParameters,
      List<Parameter> parameters}) async {
    return DBParameterGroupNameMessage.fromJson({});
  }

  /// Creates an Amazon Aurora DB cluster from data stored in an Amazon S3
  /// bucket. Amazon RDS must be authorized to access the Amazon S3 bucket and
  /// the data must be created using the Percona XtraBackup utility as described
  /// in
  /// [Migrating Data to an Amazon Aurora MySQL DB Cluster](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraMySQL.Migrating.html)
  /// in the _Amazon Aurora User Guide_.
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
  ///
  /// [availabilityZones]: A list of Availability Zones (AZs) where instances in
  /// the restored DB cluster can be created.
  ///
  /// [backupRetentionPeriod]: The number of days for which automated backups of
  /// the restored DB cluster are retained. You must specify a minimum value of
  /// 1.
  ///
  /// Default: 1
  ///
  /// Constraints:
  ///
  /// *   Must be a value from 1 to 35
  ///
  /// [characterSetName]: A value that indicates that the restored DB cluster
  /// should be associated with the specified CharacterSet.
  ///
  /// [databaseName]: The database name for the restored DB cluster.
  ///
  /// [dbClusterIdentifier]: The name of the DB cluster to create from the
  /// source data in the Amazon S3 bucket. This parameter is isn't
  /// case-sensitive.
  ///
  /// Constraints:
  ///
  /// *   Must contain from 1 to 63 letters, numbers, or hyphens.
  ///
  /// *   First character must be a letter.
  ///
  /// *   Can't end with a hyphen or contain two consecutive hyphens.
  ///
  ///
  /// Example: `my-cluster1`
  ///
  /// [dbClusterParameterGroupName]: The name of the DB cluster parameter group
  /// to associate with the restored DB cluster. If this argument is omitted,
  /// `default.aurora5.6` is used.
  ///
  /// Constraints:
  ///
  /// *   If supplied, must match the name of an existing
  /// DBClusterParameterGroup.
  ///
  /// [vpcSecurityGroupIds]: A list of EC2 VPC security groups to associate with
  /// the restored DB cluster.
  ///
  /// [dbSubnetGroupName]: A DB subnet group to associate with the restored DB
  /// cluster.
  ///
  /// Constraints: If supplied, must match the name of an existing
  /// DBSubnetGroup.
  ///
  /// Example: `mySubnetgroup`
  ///
  /// [engine]: The name of the database engine to be used for the restored DB
  /// cluster.
  ///
  /// Valid Values: `aurora`, `aurora-postgresql`
  ///
  /// [engineVersion]: The version number of the database engine to use.
  ///
  /// To list all of the available engine versions for `aurora` (for MySQL
  /// 5.6-compatible Aurora), use the following command:
  ///
  ///  `aws rds describe-db-engine-versions --engine aurora --query
  /// "DBEngineVersions[].EngineVersion"`
  ///
  /// To list all of the available engine versions for `aurora-mysql` (for MySQL
  /// 5.7-compatible Aurora), use the following command:
  ///
  ///  `aws rds describe-db-engine-versions --engine aurora-mysql --query
  /// "DBEngineVersions[].EngineVersion"`
  ///
  /// To list all of the available engine versions for `aurora-postgresql`, use
  /// the following command:
  ///
  ///  `aws rds describe-db-engine-versions --engine aurora-postgresql --query
  /// "DBEngineVersions[].EngineVersion"`
  ///
  ///  **Aurora MySQL**
  ///
  /// Example: `5.6.10a`, `5.6.mysql_aurora.1.19.2`, `5.7.12`,
  /// `5.7.mysql_aurora.2.04.5`
  ///
  ///  **Aurora PostgreSQL**
  ///
  /// Example: `9.6.3`, `10.7`
  ///
  /// [port]: The port number on which the instances in the restored DB cluster
  /// accept connections.
  ///
  ///  Default: `3306`
  ///
  /// [masterUsername]: The name of the master user for the restored DB cluster.
  ///
  /// Constraints:
  ///
  /// *   Must be 1 to 16 letters or numbers.
  ///
  /// *   First character must be a letter.
  ///
  /// *   Can't be a reserved word for the chosen database engine.
  ///
  /// [masterUserPassword]: The password for the master database user. This
  /// password can contain any printable ASCII character except "/", """, or
  /// "@".
  ///
  /// Constraints: Must contain from 8 to 41 characters.
  ///
  /// [optionGroupName]: A value that indicates that the restored DB cluster
  /// should be associated with the specified option group.
  ///
  /// Permanent options can't be removed from an option group. An option group
  /// can't be removed from a DB cluster once it is associated with a DB
  /// cluster.
  ///
  /// [preferredBackupWindow]: The daily time range during which automated
  /// backups are created if automated backups are enabled using the
  /// `BackupRetentionPeriod` parameter.
  ///
  /// The default is a 30-minute window selected at random from an 8-hour block
  /// of time for each AWS Region. To see the time blocks available, see
  /// [Adjusting the Preferred Maintenance Window](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_UpgradeDBInstance.Maintenance.html#AdjustingTheMaintenanceWindow.Aurora)
  /// in the _Amazon Aurora User Guide._
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
  /// [Adjusting the Preferred Maintenance Window](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_UpgradeDBInstance.Maintenance.html#AdjustingTheMaintenanceWindow.Aurora)
  /// in the _Amazon Aurora User Guide._
  ///
  /// Valid Days: Mon, Tue, Wed, Thu, Fri, Sat, Sun.
  ///
  /// Constraints: Minimum 30-minute window.
  ///
  /// [storageEncrypted]: A value that indicates whether the restored DB cluster
  /// is encrypted.
  ///
  /// [kmsKeyId]: The AWS KMS key identifier for an encrypted DB cluster.
  ///
  /// The KMS key identifier is the Amazon Resource Name (ARN) for the KMS
  /// encryption key. If you are creating a DB cluster with the same AWS account
  /// that owns the KMS encryption key used to encrypt the new DB cluster, then
  /// you can use the KMS key alias instead of the ARN for the KM encryption
  /// key.
  ///
  /// If the StorageEncrypted parameter is enabled, and you do not specify a
  /// value for the `KmsKeyId` parameter, then Amazon RDS will use your default
  /// encryption key. AWS KMS creates the default encryption key for your AWS
  /// account. Your AWS account has a different default encryption key for each
  /// AWS Region.
  ///
  /// [enableIamDatabaseAuthentication]: A value that indicates whether to
  /// enable mapping of AWS Identity and Access Management (IAM) accounts to
  /// database accounts. By default, mapping is disabled.
  ///
  /// For more information, see
  /// [IAM Database Authentication](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/UsingWithRDS.IAMDBAuth.html)
  /// in the _Amazon Aurora User Guide._
  ///
  /// [sourceEngine]: The identifier for the database engine that was backed up
  /// to create the files stored in the Amazon S3 bucket.
  ///
  /// Valid values: `mysql`
  ///
  /// [sourceEngineVersion]: The version of the database that the backup files
  /// were created from.
  ///
  /// MySQL version 5.5 and 5.6 are supported.
  ///
  /// Example: `5.6.22`
  ///
  /// [s3BucketName]: The name of the Amazon S3 bucket that contains the data
  /// used to create the Amazon Aurora DB cluster.
  ///
  /// [s3Prefix]: The prefix for all of the file names that contain the data
  /// used to create the Amazon Aurora DB cluster. If you do not specify a
  /// **SourceS3Prefix** value, then the Amazon Aurora DB cluster is created by
  /// using all of the files in the Amazon S3 bucket.
  ///
  /// [s3IngestionRoleArn]: The Amazon Resource Name (ARN) of the AWS Identity
  /// and Access Management (IAM) role that authorizes Amazon RDS to access the
  /// Amazon S3 bucket on your behalf.
  ///
  /// [backtrackWindow]: The target backtrack window, in seconds. To disable
  /// backtracking, set this value to 0.
  ///
  /// Default: 0
  ///
  /// Constraints:
  ///
  /// *   If specified, this value must be set to a number from 0 to 259,200 (72
  /// hours).
  ///
  /// [enableCloudwatchLogsExports]: The list of logs that the restored DB
  /// cluster is to export to CloudWatch Logs. The values in the list depend on
  /// the DB engine being used. For more information, see
  /// [Publishing Database Logs to Amazon CloudWatch Logs](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_LogAccess.html#USER_LogAccess.Procedural.UploadtoCloudWatch)
  /// in the _Amazon Aurora User Guide_.
  ///
  /// [deletionProtection]: A value that indicates whether the DB cluster has
  /// deletion protection enabled. The database can't be deleted when deletion
  /// protection is enabled. By default, deletion protection is disabled.
  ///
  /// [copyTagsToSnapshot]: A value that indicates whether to copy all tags from
  /// the restored DB cluster to snapshots of the restored DB cluster. The
  /// default is not to copy them.
  Future<RestoreDBClusterFromS3Result> restoreDBClusterFromS3(
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
      bool copyTagsToSnapshot}) async {
    return RestoreDBClusterFromS3Result.fromJson({});
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
  /// For more information on Amazon Aurora, see
  /// [What Is Amazon Aurora?](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html)
  /// in the _Amazon Aurora User Guide._
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
  ///
  /// [availabilityZones]: Provides the list of Availability Zones (AZs) where
  /// instances in the restored DB cluster can be created.
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
  /// *   Can't end with a hyphen or contain two consecutive hyphens
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
  /// To list all of the available engine versions for `aurora` (for MySQL
  /// 5.6-compatible Aurora), use the following command:
  ///
  ///  `aws rds describe-db-engine-versions --engine aurora --query
  /// "DBEngineVersions[].EngineVersion"`
  ///
  /// To list all of the available engine versions for `aurora-mysql` (for MySQL
  /// 5.7-compatible Aurora), use the following command:
  ///
  ///  `aws rds describe-db-engine-versions --engine aurora-mysql --query
  /// "DBEngineVersions[].EngineVersion"`
  ///
  /// To list all of the available engine versions for `aurora-postgresql`, use
  /// the following command:
  ///
  ///  `aws rds describe-db-engine-versions --engine aurora-postgresql --query
  /// "DBEngineVersions[].EngineVersion"`
  ///
  ///  **Aurora MySQL**
  ///
  /// Example: `5.6.10a`, `5.6.mysql_aurora.1.19.2`, `5.7.12`,
  /// `5.7.mysql_aurora.2.04.5`
  ///
  ///  **Aurora PostgreSQL**
  ///
  /// Example: `9.6.3`, `10.7`
  ///
  /// [port]: The port number on which the new DB cluster accepts connections.
  ///
  /// Constraints: This value must be `1150-65535`
  ///
  /// Default: The same port as the original DB cluster.
  ///
  /// [dbSubnetGroupName]: The name of the DB subnet group to use for the new DB
  /// cluster.
  ///
  /// Constraints: If supplied, must match the name of an existing DB subnet
  /// group.
  ///
  /// Example: `mySubnetgroup`
  ///
  /// [databaseName]: The database name for the restored DB cluster.
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
  /// If you don't specify a value for the `KmsKeyId` parameter, then the
  /// following occurs:
  ///
  /// *   If the DB snapshot or DB cluster snapshot in `SnapshotIdentifier` is
  /// encrypted, then the restored DB cluster is encrypted using the KMS key
  /// that was used to encrypt the DB snapshot or DB cluster snapshot.
  ///
  /// *   If the DB snapshot or DB cluster snapshot in `SnapshotIdentifier` is
  /// not encrypted, then the restored DB cluster is not encrypted.
  ///
  /// [enableIamDatabaseAuthentication]: A value that indicates whether to
  /// enable mapping of AWS Identity and Access Management (IAM) accounts to
  /// database accounts. By default, mapping is disabled.
  ///
  /// For more information, see
  /// [IAM Database Authentication](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/UsingWithRDS.IAMDBAuth.html)
  /// in the _Amazon Aurora User Guide._
  ///
  /// [backtrackWindow]: The target backtrack window, in seconds. To disable
  /// backtracking, set this value to 0.
  ///
  /// Default: 0
  ///
  /// Constraints:
  ///
  /// *   If specified, this value must be set to a number from 0 to 259,200 (72
  /// hours).
  ///
  /// [enableCloudwatchLogsExports]: The list of logs that the restored DB
  /// cluster is to export to Amazon CloudWatch Logs. The values in the list
  /// depend on the DB engine being used. For more information, see
  /// [Publishing Database Logs to Amazon CloudWatch Logs](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_LogAccess.html#USER_LogAccess.Procedural.UploadtoCloudWatch)
  ///  in the _Amazon Aurora User Guide_.
  ///
  /// [engineMode]: The DB engine mode of the DB cluster, either `provisioned`,
  /// `serverless`, `parallelquery`, `global`, or `multimaster`.
  ///
  /// [scalingConfiguration]: For DB clusters in `serverless` DB engine mode,
  /// the scaling properties of the DB cluster.
  ///
  /// [dbClusterParameterGroupName]: The name of the DB cluster parameter group
  /// to associate with this DB cluster. If this argument is omitted, the
  /// default DB cluster parameter group for the specified engine is used.
  ///
  /// Constraints:
  ///
  /// *   If supplied, must match the name of an existing default DB cluster
  /// parameter group.
  ///
  /// *   Must be 1 to 255 letters, numbers, or hyphens.
  ///
  /// *   First character must be a letter.
  ///
  /// *   Can't end with a hyphen or contain two consecutive hyphens.
  ///
  /// [deletionProtection]: A value that indicates whether the DB cluster has
  /// deletion protection enabled. The database can't be deleted when deletion
  /// protection is enabled. By default, deletion protection is disabled.
  ///
  /// [copyTagsToSnapshot]: A value that indicates whether to copy all tags from
  /// the restored DB cluster to snapshots of the restored DB cluster. The
  /// default is not to copy them.
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
      BigInt backtrackWindow,
      List<String> enableCloudwatchLogsExports,
      String engineMode,
      ScalingConfiguration scalingConfiguration,
      String dbClusterParameterGroupName,
      bool deletionProtection,
      bool copyTagsToSnapshot}) async {
    return RestoreDBClusterFromSnapshotResult.fromJson({});
  }

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
  /// For more information on Amazon Aurora, see
  /// [What Is Amazon Aurora?](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html)
  /// in the _Amazon Aurora User Guide._
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
  ///
  /// [dbClusterIdentifier]: The name of the new DB cluster to be created.
  ///
  /// Constraints:
  ///
  /// *   Must contain from 1 to 63 letters, numbers, or hyphens
  ///
  /// *   First character must be a letter
  ///
  /// *   Can't end with a hyphen or contain two consecutive hyphens
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
  /// Constraints: You can't specify `copy-on-write` if the engine version of
  /// the source DB cluster is earlier than 1.11.
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
  /// *   Can't be specified if the `UseLatestRestorableTime` parameter is
  /// enabled
  ///
  /// *   Can't be specified if the `RestoreType` parameter is `copy-on-write`
  ///
  ///
  /// Example: `2015-03-07T23:45:00Z`
  ///
  /// [useLatestRestorableTime]: A value that indicates whether to restore the
  /// DB cluster to the latest restorable backup time. By default, the DB
  /// cluster is not restored to the latest restorable backup time.
  ///
  /// Constraints: Can't be specified if `RestoreToTime` parameter is provided.
  ///
  /// [port]: The port number on which the new DB cluster accepts connections.
  ///
  /// Constraints: A value from `1150-65535`.
  ///
  /// Default: The default port for the engine.
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
  /// If you don't specify a value for the `KmsKeyId` parameter, then the
  /// following occurs:
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
  /// [enableIamDatabaseAuthentication]: A value that indicates whether to
  /// enable mapping of AWS Identity and Access Management (IAM) accounts to
  /// database accounts. By default, mapping is disabled.
  ///
  /// For more information, see
  /// [IAM Database Authentication](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/UsingWithRDS.IAMDBAuth.html)
  /// in the _Amazon Aurora User Guide._
  ///
  /// [backtrackWindow]: The target backtrack window, in seconds. To disable
  /// backtracking, set this value to 0.
  ///
  /// Default: 0
  ///
  /// Constraints:
  ///
  /// *   If specified, this value must be set to a number from 0 to 259,200 (72
  /// hours).
  ///
  /// [enableCloudwatchLogsExports]: The list of logs that the restored DB
  /// cluster is to export to CloudWatch Logs. The values in the list depend on
  /// the DB engine being used. For more information, see
  /// [Publishing Database Logs to Amazon CloudWatch Logs](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_LogAccess.html#USER_LogAccess.Procedural.UploadtoCloudWatch)
  /// in the _Amazon Aurora User Guide_.
  ///
  /// [dbClusterParameterGroupName]: The name of the DB cluster parameter group
  /// to associate with this DB cluster. If this argument is omitted, the
  /// default DB cluster parameter group for the specified engine is used.
  ///
  /// Constraints:
  ///
  /// *   If supplied, must match the name of an existing DB cluster parameter
  /// group.
  ///
  /// *   Must be 1 to 255 letters, numbers, or hyphens.
  ///
  /// *   First character must be a letter.
  ///
  /// *   Can't end with a hyphen or contain two consecutive hyphens.
  ///
  /// [deletionProtection]: A value that indicates whether the DB cluster has
  /// deletion protection enabled. The database can't be deleted when deletion
  /// protection is enabled. By default, deletion protection is disabled.
  ///
  /// [copyTagsToSnapshot]: A value that indicates whether to copy all tags from
  /// the restored DB cluster to snapshots of the restored DB cluster. The
  /// default is not to copy them.
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
      BigInt backtrackWindow,
      List<String> enableCloudwatchLogsExports,
      String dbClusterParameterGroupName,
      bool deletionProtection,
      bool copyTagsToSnapshot}) async {
    return RestoreDBClusterToPointInTimeResult.fromJson({});
  }

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
  ///
  /// [dbInstanceIdentifier]: Name of the DB instance to create from the DB
  /// snapshot. This parameter isn't case-sensitive.
  ///
  /// Constraints:
  ///
  /// *   Must contain from 1 to 63 numbers, letters, or hyphens
  ///
  /// *   First character must be a letter
  ///
  /// *   Can't end with a hyphen or contain two consecutive hyphens
  ///
  ///
  /// Example: `my-snapshot-id`
  ///
  /// [dbSnapshotIdentifier]: The identifier for the DB snapshot to restore
  /// from.
  ///
  /// Constraints:
  ///
  /// *   Must match the identifier of an existing DBSnapshot.
  ///
  /// *   If you are restoring from a shared manual DB snapshot, the
  /// `DBSnapshotIdentifier` must be the ARN of the shared DB snapshot.
  ///
  /// [dbInstanceClass]: The compute and memory capacity of the Amazon RDS DB
  /// instance, for example, `db.m4.large`. Not all DB instance classes are
  /// available in all AWS Regions, or for all database engines. For the full
  /// list of DB instance classes, and availability for your engine, see
  /// [DB Instance Class](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.DBInstanceClass.html)
  /// in the _Amazon RDS User Guide._
  ///
  /// Default: The same DBInstanceClass as the original DB instance.
  ///
  /// [port]: The port number on which the database accepts connections.
  ///
  /// Default: The same port as the original DB instance
  ///
  /// Constraints: Value must be `1150-65535`
  ///
  /// [availabilityZone]: The Availability Zone (AZ) where the DB instance will
  /// be created.
  ///
  /// Default: A random, system-chosen Availability Zone.
  ///
  /// Constraint: You can't specify the `AvailabilityZone` parameter if the DB
  /// instance is a Multi-AZ deployment.
  ///
  /// Example: `us-east-1a`
  ///
  /// [dbSubnetGroupName]: The DB subnet group name to use for the new instance.
  ///
  /// Constraints: If supplied, must match the name of an existing
  /// DBSubnetGroup.
  ///
  /// Example: `mySubnetgroup`
  ///
  /// [multiAZ]: A value that indicates whether the DB instance is a Multi-AZ
  /// deployment.
  ///
  /// Constraint: You can't specify the `AvailabilityZone` parameter if the DB
  /// instance is a Multi-AZ deployment.
  ///
  /// [publiclyAccessible]: A value that indicates whether the DB instance is
  /// publicly accessible. When the DB instance is publicly accessible, it is an
  /// Internet-facing instance with a publicly resolvable DNS name, which
  /// resolves to a public IP address. When the DB instance is not publicly
  /// accessible, it is an internal instance with a DNS name that resolves to a
  /// private IP address. For more information, see CreateDBInstance.
  ///
  /// [autoMinorVersionUpgrade]: A value that indicates whether minor version
  /// upgrades are applied automatically to the DB instance during the
  /// maintenance window.
  ///
  /// [licenseModel]: License model information for the restored DB instance.
  ///
  /// Default: Same as source.
  ///
  ///  Valid values: `license-included` | `bring-your-own-license` |
  /// `general-public-license`
  ///
  /// [dbName]: The database name for the restored DB instance.
  ///
  ///
  ///
  /// This parameter doesn't apply to the MySQL, PostgreSQL, or MariaDB engines.
  ///
  /// [engine]: The database engine to use for the new instance.
  ///
  /// Default: The same as source
  ///
  /// Constraint: Must be compatible with the engine of the source. For example,
  /// you can restore a MariaDB 10.1 DB instance from a MySQL 5.6 snapshot.
  ///
  /// Valid Values:
  ///
  /// *    `mariadb`
  ///
  /// *    `mysql`
  ///
  /// *    `oracle-ee`
  ///
  /// *    `oracle-se2`
  ///
  /// *    `oracle-se1`
  ///
  /// *    `oracle-se`
  ///
  /// *    `postgres`
  ///
  /// *    `sqlserver-ee`
  ///
  /// *    `sqlserver-se`
  ///
  /// *    `sqlserver-ex`
  ///
  /// *    `sqlserver-web`
  ///
  /// [iops]: Specifies the amount of provisioned IOPS for the DB instance,
  /// expressed in I/O operations per second. If this parameter is not
  /// specified, the IOPS value is taken from the backup. If this parameter is
  /// set to 0, the new instance is converted to a non-PIOPS instance. The
  /// conversion takes additional time, though your DB instance is available for
  /// connections before the conversion starts.
  ///
  /// The provisioned IOPS value must follow the requirements for your database
  /// engine. For more information, see
  /// [Amazon RDS Provisioned IOPS Storage to Improve Performance](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_Storage.html#USER_PIOPS)
  /// in the _Amazon RDS User Guide._
  ///
  /// Constraints: Must be an integer greater than 1000.
  ///
  /// [optionGroupName]: The name of the option group to be used for the
  /// restored DB instance.
  ///
  /// Permanent options, such as the TDE option for Oracle Advanced Security
  /// TDE, can't be removed from an option group, and that option group can't be
  /// removed from a DB instance once it is associated with a DB instance
  ///
  /// [storageType]: Specifies the storage type to be associated with the DB
  /// instance.
  ///
  ///  Valid values: `standard | gp2 | io1`
  ///
  ///  If you specify `io1`, you must also include a value for the `Iops`
  /// parameter.
  ///
  ///  Default: `io1` if the `Iops` parameter is specified, otherwise `gp2`
  ///
  /// [tdeCredentialArn]: The ARN from the key store with which to associate the
  /// instance for TDE encryption.
  ///
  /// [tdeCredentialPassword]: The password for the given ARN from the key store
  /// in order to access the device.
  ///
  /// [vpcSecurityGroupIds]:  A list of EC2 VPC security groups to associate
  /// with this DB instance.
  ///
  ///  Default: The default EC2 VPC security group for the DB subnet group's
  /// VPC.
  ///
  /// [domain]: Specify the Active Directory Domain to restore the instance in.
  ///
  /// [copyTagsToSnapshot]: A value that indicates whether to copy all tags from
  /// the restored DB instance to snapshots of the DB instance. By default, tags
  /// are not copied.
  ///
  /// [domainIamRoleName]: Specify the name of the IAM role to be used when
  /// making API calls to the Directory Service.
  ///
  /// [enableIamDatabaseAuthentication]: A value that indicates whether to
  /// enable mapping of AWS Identity and Access Management (IAM) accounts to
  /// database accounts. By default, mapping is disabled. For information about
  /// the supported DB engines, see CreateDBInstance.
  ///
  /// For more information about IAM database authentication, see
  /// [IAM Database Authentication for MySQL and PostgreSQL](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/UsingWithRDS.IAMDBAuth.html)
  /// in the _Amazon RDS User Guide._
  ///
  /// [enableCloudwatchLogsExports]: The list of logs that the restored DB
  /// instance is to export to CloudWatch Logs. The values in the list depend on
  /// the DB engine being used. For more information, see
  /// [Publishing Database Logs to Amazon CloudWatch Logs](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_LogAccess.html#USER_LogAccess.Procedural.UploadtoCloudWatch)
  /// in the _Amazon Aurora User Guide_.
  ///
  /// [processorFeatures]: The number of CPU cores and the number of threads per
  /// core for the DB instance class of the DB instance.
  ///
  /// [useDefaultProcessorFeatures]: A value that indicates whether the DB
  /// instance class of the DB instance uses its default processor features.
  ///
  /// [dbParameterGroupName]: The name of the DB parameter group to associate
  /// with this DB instance.
  ///
  /// If you do not specify a value for `DBParameterGroupName`, then the default
  /// `DBParameterGroup` for the specified DB engine is used.
  ///
  /// Constraints:
  ///
  /// *   If supplied, must match the name of an existing DBParameterGroup.
  ///
  /// *   Must be 1 to 255 letters, numbers, or hyphens.
  ///
  /// *   First character must be a letter.
  ///
  /// *   Can't end with a hyphen or contain two consecutive hyphens.
  ///
  /// [deletionProtection]: A value that indicates whether the DB instance has
  /// deletion protection enabled. The database can't be deleted when deletion
  /// protection is enabled. By default, deletion protection is disabled. For
  /// more information, see
  /// [Deleting a DB Instance](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_DeleteInstance.html).
  Future<RestoreDBInstanceFromDBSnapshotResult> restoreDBInstanceFromDBSnapshot(
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
      bool deletionProtection}) async {
    return RestoreDBInstanceFromDBSnapshotResult.fromJson({});
  }

  /// Amazon Relational Database Service (Amazon RDS) supports importing MySQL
  /// databases by using backup files. You can create a backup of your
  /// on-premises database, store it on Amazon Simple Storage Service (Amazon
  /// S3), and then restore the backup file onto a new Amazon RDS DB instance
  /// running MySQL. For more information, see
  /// [Importing Data into an Amazon RDS MySQL DB Instance](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/MySQL.Procedural.Importing.html)
  /// in the _Amazon RDS User Guide._
  ///
  /// [dbName]: The name of the database to create when the DB instance is
  /// created. Follow the naming rules specified in `CreateDBInstance`.
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
  /// *   Can't end with a hyphen or contain two consecutive hyphens.
  ///
  ///
  /// Example: `mydbinstance`
  ///
  /// [allocatedStorage]: The amount of storage (in gigabytes) to allocate
  /// initially for the DB instance. Follow the allocation rules specified in
  /// `CreateDBInstance`.
  ///
  ///
  ///
  /// Be sure to allocate enough memory for your new DB instance so that the
  /// restore operation can succeed. You can also allocate additional memory for
  /// future growth.
  ///
  /// [dbInstanceClass]: The compute and memory capacity of the DB instance, for
  /// example, `db.m4.large`. Not all DB instance classes are available in all
  /// AWS Regions, or for all database engines. For the full list of DB instance
  /// classes, and availability for your engine, see
  /// [DB Instance Class](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.DBInstanceClass.html)
  /// in the _Amazon RDS User Guide._
  ///
  /// Importing from Amazon S3 is not supported on the db.t2.micro DB instance
  /// class.
  ///
  /// [engine]: The name of the database engine to be used for this instance.
  ///
  /// Valid Values: `mysql`
  ///
  /// [masterUsername]: The name for the master user.
  ///
  /// Constraints:
  ///
  /// *   Must be 1 to 16 letters or numbers.
  ///
  /// *   First character must be a letter.
  ///
  /// *   Can't be a reserved word for the chosen database engine.
  ///
  /// [masterUserPassword]: The password for the master user. The password can
  /// include any printable ASCII character except "/", """, or "@".
  ///
  /// Constraints: Must contain from 8 to 41 characters.
  ///
  /// [dbSecurityGroups]: A list of DB security groups to associate with this DB
  /// instance.
  ///
  /// Default: The default DB security group for the database engine.
  ///
  /// [vpcSecurityGroupIds]: A list of VPC security groups to associate with
  /// this DB instance.
  ///
  /// [availabilityZone]: The Availability Zone that the DB instance is created
  /// in. For information about AWS Regions and Availability Zones, see
  /// [Regions and Availability Zones](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.RegionsAndAvailabilityZones.html)
  /// in the _Amazon RDS User Guide._
  ///
  /// Default: A random, system-chosen Availability Zone in the endpoint's AWS
  /// Region.
  ///
  ///  Example: `us-east-1d`
  ///
  /// Constraint: The `AvailabilityZone` parameter can't be specified if the DB
  /// instance is a Multi-AZ deployment. The specified Availability Zone must be
  /// in the same AWS Region as the current endpoint.
  ///
  /// [dbSubnetGroupName]: A DB subnet group to associate with this DB instance.
  ///
  /// [preferredMaintenanceWindow]: The time range each week during which system
  /// maintenance can occur, in Universal Coordinated Time (UTC). For more
  /// information, see
  /// [Amazon RDS Maintenance Window](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_UpgradeDBInstance.Maintenance.html#Concepts.DBMaintenance)
  /// in the _Amazon RDS User Guide._
  ///
  /// Constraints:
  ///
  /// *   Must be in the format `ddd:hh24:mi-ddd:hh24:mi`.
  ///
  /// *   Valid Days: Mon, Tue, Wed, Thu, Fri, Sat, Sun.
  ///
  /// *   Must be in Universal Coordinated Time (UTC).
  ///
  /// *   Must not conflict with the preferred backup window.
  ///
  /// *   Must be at least 30 minutes.
  ///
  /// [dbParameterGroupName]: The name of the DB parameter group to associate
  /// with this DB instance.
  ///
  /// If you do not specify a value for `DBParameterGroupName`, then the default
  /// `DBParameterGroup` for the specified DB engine is used.
  ///
  /// [backupRetentionPeriod]: The number of days for which automated backups
  /// are retained. Setting this parameter to a positive number enables backups.
  /// For more information, see `CreateDBInstance`.
  ///
  /// [preferredBackupWindow]: The time range each day during which automated
  /// backups are created if automated backups are enabled. For more
  /// information, see
  /// [The Backup Window](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_WorkingWithAutomatedBackups.html#USER_WorkingWithAutomatedBackups.BackupWindow)
  /// in the _Amazon RDS User Guide._
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
  /// [port]: The port number on which the database accepts connections.
  ///
  /// Type: Integer
  ///
  /// Valid Values: `1150`-`65535`
  ///
  /// Default: `3306`
  ///
  /// [multiAZ]: A value that indicates whether the DB instance is a Multi-AZ
  /// deployment. If the DB instance is a Multi-AZ deployment, you can't set the
  /// `AvailabilityZone` parameter.
  ///
  /// [engineVersion]: The version number of the database engine to use. Choose
  /// the latest minor version of your database engine. For information about
  /// engine versions, see `CreateDBInstance`, or call
  /// `DescribeDBEngineVersions`.
  ///
  /// [autoMinorVersionUpgrade]: A value that indicates whether minor engine
  /// upgrades are applied automatically to the DB instance during the
  /// maintenance window. By default, minor engine upgrades are not applied
  /// automatically.
  ///
  /// [licenseModel]: The license model for this DB instance. Use
  /// `general-public-license`.
  ///
  /// [iops]: The amount of Provisioned IOPS (input/output operations per
  /// second) to allocate initially for the DB instance. For information about
  /// valid Iops values, see
  /// [Amazon RDS Provisioned IOPS Storage to Improve Performance](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_Storage.html#USER_PIOPS)
  /// in the _Amazon RDS User Guide._
  ///
  /// [optionGroupName]: The name of the option group to associate with this DB
  /// instance. If this argument is omitted, the default option group for the
  /// specified engine is used.
  ///
  /// [publiclyAccessible]: A value that indicates whether the DB instance is
  /// publicly accessible. When the DB instance is publicly accessible, it is an
  /// Internet-facing instance with a publicly resolvable DNS name, which
  /// resolves to a public IP address. When the DB instance is not publicly
  /// accessible, it is an internal instance with a DNS name that resolves to a
  /// private IP address. For more information, see CreateDBInstance.
  ///
  /// [tags]: A list of tags to associate with this DB instance. For more
  /// information, see
  /// [Tagging Amazon RDS Resources](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Tagging.html)
  /// in the _Amazon RDS User Guide._
  ///
  /// [storageType]: Specifies the storage type to be associated with the DB
  /// instance.
  ///
  /// Valid values: `standard` | `gp2` | `io1`
  ///
  /// If you specify `io1`, you must also include a value for the `Iops`
  /// parameter.
  ///
  /// Default: `io1` if the `Iops` parameter is specified; otherwise `gp2`
  ///
  /// [storageEncrypted]: A value that indicates whether the new DB instance is
  /// encrypted or not.
  ///
  /// [kmsKeyId]: The AWS KMS key identifier for an encrypted DB instance.
  ///
  /// The KMS key identifier is the Amazon Resource Name (ARN) for the KMS
  /// encryption key. If you are creating a DB instance with the same AWS
  /// account that owns the KMS encryption key used to encrypt the new DB
  /// instance, then you can use the KMS key alias instead of the ARN for the KM
  /// encryption key.
  ///
  /// If the `StorageEncrypted` parameter is enabled, and you do not specify a
  /// value for the `KmsKeyId` parameter, then Amazon RDS will use your default
  /// encryption key. AWS KMS creates the default encryption key for your AWS
  /// account. Your AWS account has a different default encryption key for each
  /// AWS Region.
  ///
  /// [copyTagsToSnapshot]: A value that indicates whether to copy all tags from
  /// the DB instance to snapshots of the DB instance. By default, tags are not
  /// copied.
  ///
  /// [monitoringInterval]: The interval, in seconds, between points when
  /// Enhanced Monitoring metrics are collected for the DB instance. To disable
  /// collecting Enhanced Monitoring metrics, specify 0.
  ///
  /// If `MonitoringRoleArn` is specified, then you must also set
  /// `MonitoringInterval` to a value other than 0.
  ///
  /// Valid Values: 0, 1, 5, 10, 15, 30, 60
  ///
  /// Default: `0`
  ///
  /// [monitoringRoleArn]: The ARN for the IAM role that permits RDS to send
  /// enhanced monitoring metrics to Amazon CloudWatch Logs. For example,
  /// `arn:aws:iam:123456789012:role/emaccess`. For information on creating a
  /// monitoring role, see
  /// [Setting Up and Enabling Enhanced Monitoring](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Monitoring.OS.html#USER_Monitoring.OS.Enabling)
  /// in the _Amazon RDS User Guide._
  ///
  /// If `MonitoringInterval` is set to a value other than 0, then you must
  /// supply a `MonitoringRoleArn` value.
  ///
  /// [enableIamDatabaseAuthentication]: A value that indicates whether to
  /// enable mapping of AWS Identity and Access Management (IAM) accounts to
  /// database accounts. By default, mapping is disabled. For information about
  /// the supported DB engines, see CreateDBInstance.
  ///
  /// For more information about IAM database authentication, see
  /// [IAM Database Authentication for MySQL and PostgreSQL](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/UsingWithRDS.IAMDBAuth.html)
  /// in the _Amazon RDS User Guide._
  ///
  /// [sourceEngine]: The name of the engine of your source database.
  ///
  /// Valid Values: `mysql`
  ///
  /// [sourceEngineVersion]: The engine version of your source database.
  ///
  /// Valid Values: `5.6`
  ///
  /// [s3BucketName]: The name of your Amazon S3 bucket that contains your
  /// database backup file.
  ///
  /// [s3Prefix]: The prefix of your Amazon S3 bucket.
  ///
  /// [s3IngestionRoleArn]: An AWS Identity and Access Management (IAM) role to
  /// allow Amazon RDS to access your Amazon S3 bucket.
  ///
  /// [enablePerformanceInsights]: A value that indicates whether to enable
  /// Performance Insights for the DB instance.
  ///
  /// For more information, see
  /// [Using Amazon Performance Insights](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_PerfInsights.html)
  /// in the _Amazon Relational Database Service User Guide_.
  ///
  /// [performanceInsightsKmsKeyId]: The AWS KMS key identifier for encryption
  /// of Performance Insights data. The KMS key ID is the Amazon Resource Name
  /// (ARN), the KMS key identifier, or the KMS key alias for the KMS encryption
  /// key.
  ///
  /// If you do not specify a value for `PerformanceInsightsKMSKeyId`, then
  /// Amazon RDS uses your default encryption key. AWS KMS creates the default
  /// encryption key for your AWS account. Your AWS account has a different
  /// default encryption key for each AWS Region.
  ///
  /// [performanceInsightsRetentionPeriod]: The amount of time, in days, to
  /// retain Performance Insights data. Valid values are 7 or 731 (2 years).
  ///
  /// [enableCloudwatchLogsExports]: The list of logs that the restored DB
  /// instance is to export to CloudWatch Logs. The values in the list depend on
  /// the DB engine being used. For more information, see
  /// [Publishing Database Logs to Amazon CloudWatch Logs](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_LogAccess.html#USER_LogAccess.Procedural.UploadtoCloudWatch)
  /// in the _Amazon RDS User Guide_.
  ///
  /// [processorFeatures]: The number of CPU cores and the number of threads per
  /// core for the DB instance class of the DB instance.
  ///
  /// [useDefaultProcessorFeatures]: A value that indicates whether the DB
  /// instance class of the DB instance uses its default processor features.
  ///
  /// [deletionProtection]: A value that indicates whether the DB instance has
  /// deletion protection enabled. The database can't be deleted when deletion
  /// protection is enabled. By default, deletion protection is disabled. For
  /// more information, see
  /// [Deleting a DB Instance](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_DeleteInstance.html).
  Future<RestoreDBInstanceFromS3Result> restoreDBInstanceFromS3(
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
      bool deletionProtection}) async {
    return RestoreDBInstanceFromS3Result.fromJson({});
  }

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
  ///
  /// [sourceDBInstanceIdentifier]: The identifier of the source DB instance
  /// from which to restore.
  ///
  /// Constraints:
  ///
  /// *   Must match the identifier of an existing DB instance.
  ///
  /// [targetDBInstanceIdentifier]: The name of the new DB instance to be
  /// created.
  ///
  /// Constraints:
  ///
  /// *   Must contain from 1 to 63 letters, numbers, or hyphens
  ///
  /// *   First character must be a letter
  ///
  /// *   Can't end with a hyphen or contain two consecutive hyphens
  ///
  /// [restoreTime]: The date and time to restore from.
  ///
  /// Valid Values: Value must be a time in Universal Coordinated Time (UTC)
  /// format
  ///
  /// Constraints:
  ///
  /// *   Must be before the latest restorable time for the DB instance
  ///
  /// *   Can't be specified if the `UseLatestRestorableTime` parameter is
  /// enabled
  ///
  ///
  /// Example: `2009-09-07T23:45:00Z`
  ///
  /// [useLatestRestorableTime]:  A value that indicates whether the DB instance
  /// is restored from the latest backup time. By default, the DB instance is
  /// not restored from the latest backup time.
  ///
  /// Constraints: Can't be specified if the `RestoreTime` parameter is
  /// provided.
  ///
  /// [dbInstanceClass]: The compute and memory capacity of the Amazon RDS DB
  /// instance, for example, `db.m4.large`. Not all DB instance classes are
  /// available in all AWS Regions, or for all database engines. For the full
  /// list of DB instance classes, and availability for your engine, see
  /// [DB Instance Class](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.DBInstanceClass.html)
  /// in the _Amazon RDS User Guide._
  ///
  /// Default: The same DBInstanceClass as the original DB instance.
  ///
  /// [port]: The port number on which the database accepts connections.
  ///
  /// Constraints: Value must be `1150-65535`
  ///
  /// Default: The same port as the original DB instance.
  ///
  /// [availabilityZone]: The Availability Zone (AZ) where the DB instance will
  /// be created.
  ///
  /// Default: A random, system-chosen Availability Zone.
  ///
  /// Constraint: You can't specify the `AvailabilityZone` parameter if the DB
  /// instance is a Multi-AZ deployment.
  ///
  /// Example: `us-east-1a`
  ///
  /// [dbSubnetGroupName]: The DB subnet group name to use for the new instance.
  ///
  /// Constraints: If supplied, must match the name of an existing
  /// DBSubnetGroup.
  ///
  /// Example: `mySubnetgroup`
  ///
  /// [multiAZ]: A value that indicates whether the DB instance is a Multi-AZ
  /// deployment.
  ///
  /// Constraint: You can't specify the `AvailabilityZone` parameter if the DB
  /// instance is a Multi-AZ deployment.
  ///
  /// [publiclyAccessible]: A value that indicates whether the DB instance is
  /// publicly accessible. When the DB instance is publicly accessible, it is an
  /// Internet-facing instance with a publicly resolvable DNS name, which
  /// resolves to a public IP address. When the DB instance is not publicly
  /// accessible, it is an internal instance with a DNS name that resolves to a
  /// private IP address. For more information, see CreateDBInstance.
  ///
  /// [autoMinorVersionUpgrade]: A value that indicates whether minor version
  /// upgrades are applied automatically to the DB instance during the
  /// maintenance window.
  ///
  /// [licenseModel]: License model information for the restored DB instance.
  ///
  /// Default: Same as source.
  ///
  ///  Valid values: `license-included` | `bring-your-own-license` |
  /// `general-public-license`
  ///
  /// [dbName]: The database name for the restored DB instance.
  ///
  ///
  ///
  /// This parameter is not used for the MySQL or MariaDB engines.
  ///
  /// [engine]: The database engine to use for the new instance.
  ///
  /// Default: The same as source
  ///
  /// Constraint: Must be compatible with the engine of the source
  ///
  /// Valid Values:
  ///
  /// *    `mariadb`
  ///
  /// *    `mysql`
  ///
  /// *    `oracle-ee`
  ///
  /// *    `oracle-se2`
  ///
  /// *    `oracle-se1`
  ///
  /// *    `oracle-se`
  ///
  /// *    `postgres`
  ///
  /// *    `sqlserver-ee`
  ///
  /// *    `sqlserver-se`
  ///
  /// *    `sqlserver-ex`
  ///
  /// *    `sqlserver-web`
  ///
  /// [iops]: The amount of Provisioned IOPS (input/output operations per
  /// second) to be initially allocated for the DB instance.
  ///
  /// Constraints: Must be an integer greater than 1000.
  ///
  ///  **SQL Server**
  ///
  /// Setting the IOPS value for the SQL Server database engine is not
  /// supported.
  ///
  /// [optionGroupName]: The name of the option group to be used for the
  /// restored DB instance.
  ///
  /// Permanent options, such as the TDE option for Oracle Advanced Security
  /// TDE, can't be removed from an option group, and that option group can't be
  /// removed from a DB instance once it is associated with a DB instance
  ///
  /// [copyTagsToSnapshot]: A value that indicates whether to copy all tags from
  /// the restored DB instance to snapshots of the DB instance. By default, tags
  /// are not copied.
  ///
  /// [storageType]: Specifies the storage type to be associated with the DB
  /// instance.
  ///
  ///  Valid values: `standard | gp2 | io1`
  ///
  ///  If you specify `io1`, you must also include a value for the `Iops`
  /// parameter.
  ///
  ///  Default: `io1` if the `Iops` parameter is specified, otherwise `gp2`
  ///
  /// [tdeCredentialArn]: The ARN from the key store with which to associate the
  /// instance for TDE encryption.
  ///
  /// [tdeCredentialPassword]: The password for the given ARN from the key store
  /// in order to access the device.
  ///
  /// [vpcSecurityGroupIds]:  A list of EC2 VPC security groups to associate
  /// with this DB instance.
  ///
  ///  Default: The default EC2 VPC security group for the DB subnet group's
  /// VPC.
  ///
  /// [domain]: Specify the Active Directory Domain to restore the instance in.
  ///
  /// [domainIamRoleName]: Specify the name of the IAM role to be used when
  /// making API calls to the Directory Service.
  ///
  /// [enableIamDatabaseAuthentication]: A value that indicates whether to
  /// enable mapping of AWS Identity and Access Management (IAM) accounts to
  /// database accounts. By default, mapping is disabled. For information about
  /// the supported DB engines, see CreateDBInstance.
  ///
  /// For more information about IAM database authentication, see
  /// [IAM Database Authentication for MySQL and PostgreSQL](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/UsingWithRDS.IAMDBAuth.html)
  /// in the _Amazon RDS User Guide._
  ///
  /// [enableCloudwatchLogsExports]: The list of logs that the restored DB
  /// instance is to export to CloudWatch Logs. The values in the list depend on
  /// the DB engine being used. For more information, see
  /// [Publishing Database Logs to Amazon CloudWatch Logs](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_LogAccess.html#USER_LogAccess.Procedural.UploadtoCloudWatch)
  /// in the _Amazon RDS User Guide_.
  ///
  /// [processorFeatures]: The number of CPU cores and the number of threads per
  /// core for the DB instance class of the DB instance.
  ///
  /// [useDefaultProcessorFeatures]: A value that indicates whether the DB
  /// instance class of the DB instance uses its default processor features.
  ///
  /// [dbParameterGroupName]: The name of the DB parameter group to associate
  /// with this DB instance.
  ///
  /// If you do not specify a value for `DBParameterGroupName`, then the default
  /// `DBParameterGroup` for the specified DB engine is used.
  ///
  /// Constraints:
  ///
  /// *   If supplied, must match the name of an existing DBParameterGroup.
  ///
  /// *   Must be 1 to 255 letters, numbers, or hyphens.
  ///
  /// *   First character must be a letter.
  ///
  /// *   Can't end with a hyphen or contain two consecutive hyphens.
  ///
  /// [deletionProtection]: A value that indicates whether the DB instance has
  /// deletion protection enabled. The database can't be deleted when deletion
  /// protection is enabled. By default, deletion protection is disabled. For
  /// more information, see
  /// [Deleting a DB Instance](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_DeleteInstance.html).
  ///
  /// [sourceDbiResourceId]: The resource ID of the source DB instance from
  /// which to restore.
  Future<RestoreDBInstanceToPointInTimeResult> restoreDBInstanceToPointInTime(
      String targetDBInstanceIdentifier,
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
      String sourceDbiResourceId}) async {
    return RestoreDBInstanceToPointInTimeResult.fromJson({});
  }

  /// Revokes ingress from a DBSecurityGroup for previously authorized IP ranges
  /// or EC2 or VPC Security Groups. Required parameters for this API are one of
  /// CIDRIP, EC2SecurityGroupId for VPC, or (EC2SecurityGroupOwnerId and either
  /// EC2SecurityGroupName or EC2SecurityGroupId).
  ///
  /// [dbSecurityGroupName]: The name of the DB security group to revoke ingress
  /// from.
  ///
  /// [cidrip]:  The IP range to revoke access from. Must be a valid CIDR range.
  /// If `CIDRIP` is specified, `EC2SecurityGroupName`, `EC2SecurityGroupId` and
  /// `EC2SecurityGroupOwnerId` can't be provided.
  ///
  /// [ec2SecurityGroupName]:  The name of the EC2 security group to revoke
  /// access from. For VPC DB security groups, `EC2SecurityGroupId` must be
  /// provided. Otherwise, EC2SecurityGroupOwnerId and either
  /// `EC2SecurityGroupName` or `EC2SecurityGroupId` must be provided.
  ///
  /// [ec2SecurityGroupId]:  The id of the EC2 security group to revoke access
  /// from. For VPC DB security groups, `EC2SecurityGroupId` must be provided.
  /// Otherwise, EC2SecurityGroupOwnerId and either `EC2SecurityGroupName` or
  /// `EC2SecurityGroupId` must be provided.
  ///
  /// [ec2SecurityGroupOwnerId]:  The AWS Account Number of the owner of the EC2
  /// security group specified in the `EC2SecurityGroupName` parameter. The AWS
  /// Access Key ID is not an acceptable value. For VPC DB security groups,
  /// `EC2SecurityGroupId` must be provided. Otherwise, EC2SecurityGroupOwnerId
  /// and either `EC2SecurityGroupName` or `EC2SecurityGroupId` must be
  /// provided.
  Future<RevokeDBSecurityGroupIngressResult> revokeDBSecurityGroupIngress(
      String dbSecurityGroupName,
      {String cidrip,
      String ec2SecurityGroupName,
      String ec2SecurityGroupId,
      String ec2SecurityGroupOwnerId}) async {
    return RevokeDBSecurityGroupIngressResult.fromJson({});
  }

  /// Starts a database activity stream to monitor activity on the database. For
  /// more information, see
  /// [Database Activity Streams](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/DBActivityStreams.html)
  /// in the _Amazon Aurora User Guide_.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the DB cluster, for
  /// example `arn:aws:rds:us-east-1:12345667890:cluster:das-cluster`.
  ///
  /// [mode]: Specifies the mode of the database activity stream. Database
  /// events such as a change or access generate an activity stream event. The
  /// database session can handle these events either synchronously or
  /// asynchronously.
  ///
  /// [kmsKeyId]: The AWS KMS key identifier for encrypting messages in the
  /// database activity stream. The key identifier can be either a key ID, a key
  /// ARN, or a key alias.
  ///
  /// [applyImmediately]: Specifies whether or not the database activity stream
  /// is to start as soon as possible, regardless of the maintenance window for
  /// the database.
  Future<StartActivityStreamResponse> startActivityStream(
      {@required String resourceArn,
      @required String mode,
      @required String kmsKeyId,
      bool applyImmediately}) async {
    return StartActivityStreamResponse.fromJson({});
  }

  /// Starts an Amazon Aurora DB cluster that was stopped using the AWS console,
  /// the stop-db-cluster AWS CLI command, or the StopDBCluster action.
  ///
  /// For more information, see
  /// [Stopping and Starting an Aurora Cluster](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-cluster-stop-start.html)
  /// in the _Amazon Aurora User Guide._
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
  ///
  /// [dbClusterIdentifier]: The DB cluster identifier of the Amazon Aurora DB
  /// cluster to be started. This parameter is stored as a lowercase string.
  Future<StartDBClusterResult> startDBCluster(
      String dbClusterIdentifier) async {
    return StartDBClusterResult.fromJson({});
  }

  ///  Starts an Amazon RDS DB instance that was stopped using the AWS console,
  /// the stop-db-instance AWS CLI command, or the StopDBInstance action.
  ///
  /// For more information, see
  /// [Starting an Amazon RDS DB instance That Was Previously Stopped](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_StartInstance.html)
  /// in the _Amazon RDS User Guide._
  ///
  ///   This command doesn't apply to Aurora MySQL and Aurora PostgreSQL. For
  /// Aurora DB clusters, use `StartDBCluster` instead.
  ///
  /// [dbInstanceIdentifier]:  The user-supplied instance identifier.
  Future<StartDBInstanceResult> startDBInstance(
      String dbInstanceIdentifier) async {
    return StartDBInstanceResult.fromJson({});
  }

  /// Stops a database activity stream that was started using the AWS console,
  /// the `start-activity-stream` AWS CLI command, or the `StartActivityStream`
  /// action.
  ///
  /// For more information, see
  /// [Database Activity Streams](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/DBActivityStreams.html)
  /// in the _Amazon Aurora User Guide_.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the DB cluster for the
  /// database activity stream. For example,
  /// `arn:aws:rds:us-east-1:12345667890:cluster:das-cluster`.
  ///
  /// [applyImmediately]: Specifies whether or not the database activity stream
  /// is to stop as soon as possible, regardless of the maintenance window for
  /// the database.
  Future<StopActivityStreamResponse> stopActivityStream(String resourceArn,
      {bool applyImmediately}) async {
    return StopActivityStreamResponse.fromJson({});
  }

  ///  Stops an Amazon Aurora DB cluster. When you stop a DB cluster, Aurora
  /// retains the DB cluster's metadata, including its endpoints and DB
  /// parameter groups. Aurora also retains the transaction logs so you can do a
  /// point-in-time restore if necessary.
  ///
  /// For more information, see
  /// [Stopping and Starting an Aurora Cluster](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-cluster-stop-start.html)
  /// in the _Amazon Aurora User Guide._
  ///
  ///
  ///
  /// This action only applies to Aurora DB clusters.
  ///
  /// [dbClusterIdentifier]: The DB cluster identifier of the Amazon Aurora DB
  /// cluster to be stopped. This parameter is stored as a lowercase string.
  Future<StopDBClusterResult> stopDBCluster(String dbClusterIdentifier) async {
    return StopDBClusterResult.fromJson({});
  }

  ///  Stops an Amazon RDS DB instance. When you stop a DB instance, Amazon RDS
  /// retains the DB instance's metadata, including its endpoint, DB parameter
  /// group, and option group membership. Amazon RDS also retains the
  /// transaction logs so you can do a point-in-time restore if necessary.
  ///
  /// For more information, see
  /// [Stopping an Amazon RDS DB Instance Temporarily](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_StopInstance.html)
  /// in the _Amazon RDS User Guide._
  ///
  ///   This command doesn't apply to Aurora MySQL and Aurora PostgreSQL. For
  /// Aurora clusters, use `StopDBCluster` instead.
  ///
  /// [dbInstanceIdentifier]:  The user-supplied instance identifier.
  ///
  /// [dbSnapshotIdentifier]:  The user-supplied instance identifier of the DB
  /// Snapshot created immediately before the DB instance is stopped.
  Future<StopDBInstanceResult> stopDBInstance(String dbInstanceIdentifier,
      {String dbSnapshotIdentifier}) async {
    return StopDBInstanceResult.fromJson({});
  }
}

/// Data returned by the **DescribeAccountAttributes** action.
class AccountAttributesMessage {
  /// A list of `AccountQuota` objects. Within this list, each quota has a name,
  /// a count of usage toward the quota maximum, and a maximum value for the
  /// quota.
  final List<AccountQuota> accountQuotas;

  AccountAttributesMessage({
    this.accountQuotas,
  });
  static AccountAttributesMessage fromJson(Map<String, dynamic> json) =>
      AccountAttributesMessage();
}

/// Describes a quota for an AWS account.
///
/// The following are account quotas:
///
/// *    `AllocatedStorage` - The total allocated storage per account, in GiB.
/// The used value is the total allocated storage in the account, in GiB.
///
/// *    `AuthorizationsPerDBSecurityGroup` - The number of ingress rules per DB
/// security group. The used value is the highest number of ingress rules in a
/// DB security group in the account. Other DB security groups in the account
/// might have a lower number of ingress rules.
///
/// *    `CustomEndpointsPerDBCluster` - The number of custom endpoints per DB
/// cluster. The used value is the highest number of custom endpoints in a DB
/// clusters in the account. Other DB clusters in the account might have a lower
/// number of custom endpoints.
///
/// *    `DBClusterParameterGroups` - The number of DB cluster parameter groups
/// per account, excluding default parameter groups. The used value is the count
/// of nondefault DB cluster parameter groups in the account.
///
/// *    `DBClusterRoles` - The number of associated AWS Identity and Access
/// Management (IAM) roles per DB cluster. The used value is the highest number
/// of associated IAM roles for a DB cluster in the account. Other DB clusters
/// in the account might have a lower number of associated IAM roles.
///
/// *    `DBClusters` - The number of DB clusters per account. The used value is
/// the count of DB clusters in the account.
///
/// *    `DBInstanceRoles` - The number of associated IAM roles per DB instance.
/// The used value is the highest number of associated IAM roles for a DB
/// instance in the account. Other DB instances in the account might have a
/// lower number of associated IAM roles.
///
/// *    `DBInstances` - The number of DB instances per account. The used value
/// is the count of the DB instances in the account.
///
/// *    `DBParameterGroups` - The number of DB parameter groups per account,
/// excluding default parameter groups. The used value is the count of
/// nondefault DB parameter groups in the account.
///
/// *    `DBSecurityGroups` - The number of DB security groups (not VPC security
/// groups) per account, excluding the default security group. The used value is
/// the count of nondefault DB security groups in the account.
///
/// *    `DBSubnetGroups` - The number of DB subnet groups per account. The used
/// value is the count of the DB subnet groups in the account.
///
/// *    `EventSubscriptions` - The number of event subscriptions per account.
/// The used value is the count of the event subscriptions in the account.
///
/// *    `ManualSnapshots` - The number of manual DB snapshots per account. The
/// used value is the count of the manual DB snapshots in the account.
///
/// *    `OptionGroups` - The number of DB option groups per account, excluding
/// default option groups. The used value is the count of nondefault DB option
/// groups in the account.
///
/// *    `ReadReplicasPerMaster` - The number of Read Replicas per DB instance.
/// The used value is the highest number of Read Replicas for a DB instance in
/// the account. Other DB instances in the account might have a lower number of
/// Read Replicas.
///
/// *    `ReservedDBInstances` - The number of reserved DB instances per
/// account. The used value is the count of the active reserved DB instances in
/// the account.
///
/// *    `SubnetsPerDBSubnetGroup` - The number of subnets per DB subnet group.
/// The used value is highest number of subnets for a DB subnet group in the
/// account. Other DB subnet groups in the account might have a lower number of
/// subnets.
///
///
/// For more information, see
/// [Limits](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_Limits.html)
/// in the _Amazon RDS User Guide_ and
/// [Limits](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_Limits.html)
/// in the _Amazon Aurora User Guide_.
class AccountQuota {
  /// The name of the Amazon RDS quota for this AWS account.
  final String accountQuotaName;

  /// The amount currently used toward the quota maximum.
  final BigInt used;

  /// The maximum allowed value for the quota.
  final BigInt max;

  AccountQuota({
    this.accountQuotaName,
    this.used,
    this.max,
  });
  static AccountQuota fromJson(Map<String, dynamic> json) => AccountQuota();
}

class AddSourceIdentifierToSubscriptionResult {
  final EventSubscription eventSubscription;

  AddSourceIdentifierToSubscriptionResult({
    this.eventSubscription,
  });
  static AddSourceIdentifierToSubscriptionResult fromJson(
          Map<String, dynamic> json) =>
      AddSourceIdentifierToSubscriptionResult();
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

class AuthorizeDBSecurityGroupIngressResult {
  final DBSecurityGroup dbSecurityGroup;

  AuthorizeDBSecurityGroupIngressResult({
    this.dbSecurityGroup,
  });
  static AuthorizeDBSecurityGroupIngressResult fromJson(
          Map<String, dynamic> json) =>
      AuthorizeDBSecurityGroupIngressResult();
}

/// Contains Availability Zone information.
///
///  This data type is used as an element in the `OrderableDBInstanceOption`
/// data type.
class AvailabilityZone {
  /// The name of the Availability Zone.
  final String name;

  AvailabilityZone({
    this.name,
  });
  static AvailabilityZone fromJson(Map<String, dynamic> json) =>
      AvailabilityZone();
}

/// Contains the available processor feature information for the DB instance
/// class of a DB instance.
///
/// For more information, see
/// [Configuring the Processor of the DB Instance Class](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.DBInstanceClass.html#USER_ConfigureProcessor)
/// in the _Amazon RDS User Guide._
class AvailableProcessorFeature {
  /// The name of the processor feature. Valid names are `coreCount` and
  /// `threadsPerCore`.
  final String name;

  /// The default value for the processor feature of the DB instance class.
  final String defaultValue;

  /// The allowed values for the processor feature of the DB instance class.
  final String allowedValues;

  AvailableProcessorFeature({
    this.name,
    this.defaultValue,
    this.allowedValues,
  });
  static AvailableProcessorFeature fromJson(Map<String, dynamic> json) =>
      AvailableProcessorFeature();
}

/// A CA certificate for an AWS account.
class Certificate {
  /// The unique key that identifies a certificate.
  final String certificateIdentifier;

  /// The type of the certificate.
  final String certificateType;

  /// The thumbprint of the certificate.
  final String thumbprint;

  /// The starting date from which the certificate is valid.
  final DateTime validFrom;

  /// The final date that the certificate continues to be valid.
  final DateTime validTill;

  /// The Amazon Resource Name (ARN) for the certificate.
  final String certificateArn;

  Certificate({
    this.certificateIdentifier,
    this.certificateType,
    this.thumbprint,
    this.validFrom,
    this.validTill,
    this.certificateArn,
  });
  static Certificate fromJson(Map<String, dynamic> json) => Certificate();
}

/// Data returned by the **DescribeCertificates** action.
class CertificateMessage {
  /// The list of `Certificate` objects for the AWS account.
  final List<Certificate> certificates;

  ///  An optional pagination token provided by a previous
  /// `DescribeCertificates` request. If this parameter is specified, the
  /// response includes only records beyond the marker, up to the value
  /// specified by `MaxRecords` .
  final String marker;

  CertificateMessage({
    this.certificates,
    this.marker,
  });
  static CertificateMessage fromJson(Map<String, dynamic> json) =>
      CertificateMessage();
}

///  This data type is used as a response element in the action
/// `DescribeDBEngineVersions`.
class CharacterSet {
  /// The name of the character set.
  final String characterSetName;

  /// The description of the character set.
  final String characterSetDescription;

  CharacterSet({
    this.characterSetName,
    this.characterSetDescription,
  });
  static CharacterSet fromJson(Map<String, dynamic> json) => CharacterSet();
}

/// The configuration setting for the log types to be enabled for export to
/// CloudWatch Logs for a specific DB instance or DB cluster.
///
/// The `EnableLogTypes` and `DisableLogTypes` arrays determine which logs will
/// be exported (or not exported) to CloudWatch Logs. The values within these
/// arrays depend on the DB engine being used. For more information, see
/// [Publishing Database Logs to Amazon CloudWatch Logs](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_LogAccess.html#USER_LogAccess.Procedural.UploadtoCloudWatch)
///  in the _Amazon RDS User Guide_.
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

class CopyDBParameterGroupResult {
  final DBParameterGroup dbParameterGroup;

  CopyDBParameterGroupResult({
    this.dbParameterGroup,
  });
  static CopyDBParameterGroupResult fromJson(Map<String, dynamic> json) =>
      CopyDBParameterGroupResult();
}

class CopyDBSnapshotResult {
  final DBSnapshot dbSnapshot;

  CopyDBSnapshotResult({
    this.dbSnapshot,
  });
  static CopyDBSnapshotResult fromJson(Map<String, dynamic> json) =>
      CopyDBSnapshotResult();
}

class CopyOptionGroupResult {
  final OptionGroup optionGroup;

  CopyOptionGroupResult({
    this.optionGroup,
  });
  static CopyOptionGroupResult fromJson(Map<String, dynamic> json) =>
      CopyOptionGroupResult();
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

class CreateDBInstanceReadReplicaResult {
  final DBInstance dbInstance;

  CreateDBInstanceReadReplicaResult({
    this.dbInstance,
  });
  static CreateDBInstanceReadReplicaResult fromJson(
          Map<String, dynamic> json) =>
      CreateDBInstanceReadReplicaResult();
}

class CreateDBInstanceResult {
  final DBInstance dbInstance;

  CreateDBInstanceResult({
    this.dbInstance,
  });
  static CreateDBInstanceResult fromJson(Map<String, dynamic> json) =>
      CreateDBInstanceResult();
}

class CreateDBParameterGroupResult {
  final DBParameterGroup dbParameterGroup;

  CreateDBParameterGroupResult({
    this.dbParameterGroup,
  });
  static CreateDBParameterGroupResult fromJson(Map<String, dynamic> json) =>
      CreateDBParameterGroupResult();
}

class CreateDBSecurityGroupResult {
  final DBSecurityGroup dbSecurityGroup;

  CreateDBSecurityGroupResult({
    this.dbSecurityGroup,
  });
  static CreateDBSecurityGroupResult fromJson(Map<String, dynamic> json) =>
      CreateDBSecurityGroupResult();
}

class CreateDBSnapshotResult {
  final DBSnapshot dbSnapshot;

  CreateDBSnapshotResult({
    this.dbSnapshot,
  });
  static CreateDBSnapshotResult fromJson(Map<String, dynamic> json) =>
      CreateDBSnapshotResult();
}

class CreateDBSubnetGroupResult {
  final DBSubnetGroup dbSubnetGroup;

  CreateDBSubnetGroupResult({
    this.dbSubnetGroup,
  });
  static CreateDBSubnetGroupResult fromJson(Map<String, dynamic> json) =>
      CreateDBSubnetGroupResult();
}

class CreateEventSubscriptionResult {
  final EventSubscription eventSubscription;

  CreateEventSubscriptionResult({
    this.eventSubscription,
  });
  static CreateEventSubscriptionResult fromJson(Map<String, dynamic> json) =>
      CreateEventSubscriptionResult();
}

class CreateGlobalClusterResult {
  final GlobalCluster globalCluster;

  CreateGlobalClusterResult({
    this.globalCluster,
  });
  static CreateGlobalClusterResult fromJson(Map<String, dynamic> json) =>
      CreateGlobalClusterResult();
}

class CreateOptionGroupResult {
  final OptionGroup optionGroup;

  CreateOptionGroupResult({
    this.optionGroup,
  });
  static CreateOptionGroupResult fromJson(Map<String, dynamic> json) =>
      CreateOptionGroupResult();
}

/// Contains the details of an Amazon Aurora DB cluster.
///
/// This data type is used as a response element in the `DescribeDBClusters`,
/// `StopDBCluster`, and `StartDBCluster` actions.
class DBCluster {
  /// For all database engines except Amazon Aurora, `AllocatedStorage`
  /// specifies the allocated storage size in gibibytes (GiB). For Aurora,
  /// `AllocatedStorage` always returns 1, because Aurora DB cluster storage
  /// size is not fixed, but instead automatically adjusts as needed.
  final int allocatedStorage;

  /// Provides the list of Availability Zones (AZs) where instances in the DB
  /// cluster can be created.
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

  /// The earliest time to which a database can be restored with point-in-time
  /// restore.
  final DateTime earliestRestorableTime;

  /// Specifies the connection endpoint for the primary instance of the DB
  /// cluster.
  final String endpoint;

  /// The reader endpoint for the DB cluster. The reader endpoint for a DB
  /// cluster load-balances connections across the Aurora Replicas that are
  /// available in a DB cluster. As clients request new connections to the
  /// reader endpoint, Aurora distributes the connection requests among the
  /// Aurora Replicas in the DB cluster. This functionality can help balance
  /// your read workload across multiple Aurora Replicas in your DB cluster.
  ///
  /// If a failover occurs, and the Aurora Replica that you are connected to is
  /// promoted to be the primary instance, your connection is dropped. To
  /// continue sending your read workload to other Aurora Replicas in the
  /// cluster, you can then reconnect to the reader endpoint.
  final String readerEndpoint;

  /// Identifies all custom endpoints associated with the cluster.
  final List<String> customEndpoints;

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

  /// Contains the identifier of the source DB cluster if this DB cluster is a
  /// Read Replica.
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

  /// If `StorageEncrypted` is enabled, the AWS KMS key identifier for the
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

  /// A value that indicates whether the mapping of AWS Identity and Access
  /// Management (IAM) accounts to database accounts is enabled.
  final bool iamDatabaseAuthenticationEnabled;

  /// Identifies the clone group to which the DB cluster is associated.
  final String cloneGroupId;

  /// Specifies the time when the DB cluster was created, in Universal
  /// Coordinated Time (UTC).
  final DateTime clusterCreateTime;

  /// The earliest time to which a DB cluster can be backtracked.
  final DateTime earliestBacktrackTime;

  /// The target backtrack window, in seconds. If this value is set to 0,
  /// backtracking is disabled for the DB cluster. Otherwise, backtracking is
  /// enabled.
  final BigInt backtrackWindow;

  /// The number of change records stored for Backtrack.
  final BigInt backtrackConsumedChangeRecords;

  /// A list of log types that this DB cluster is configured to export to
  /// CloudWatch Logs.
  ///
  /// Log types vary by DB engine. For information about the log types for each
  /// DB engine, see
  /// [Amazon RDS Database Log Files](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_LogAccess.html)
  /// in the _Amazon Aurora User Guide._
  final List<String> enabledCloudwatchLogsExports;

  /// The current capacity of an Aurora Serverless DB cluster. The capacity is 0
  /// (zero) when the cluster is paused.
  ///
  /// For more information about Aurora Serverless, see
  /// [Using Amazon Aurora Serverless](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-serverless.html)
  /// in the _Amazon Aurora User Guide_.
  final int capacity;

  /// The DB engine mode of the DB cluster, either `provisioned`, `serverless`,
  /// `parallelquery`, `global`, or `multimaster`.
  final String engineMode;

  final ScalingConfigurationInfo scalingConfigurationInfo;

  /// Indicates if the DB cluster has deletion protection enabled. The database
  /// can't be deleted when deletion protection is enabled.
  final bool deletionProtection;

  /// A value that indicates whether the HTTP endpoint for an Aurora Serverless
  /// DB cluster is enabled.
  ///
  /// When enabled, the HTTP endpoint provides a connectionless web service API
  /// for running SQL queries on the Aurora Serverless DB cluster. You can also
  /// query your database from inside the RDS console with the query editor.
  ///
  /// For more information, see
  /// [Using the Data API for Aurora Serverless](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/data-api.html)
  /// in the _Amazon Aurora User Guide_.
  final bool httpEndpointEnabled;

  /// The mode of the database activity stream. Database events such as a change
  /// or access generate an activity stream event. The database session can
  /// handle these events either synchronously or asynchronously.
  final String activityStreamMode;

  /// The status of the database activity stream.
  final String activityStreamStatus;

  /// The AWS KMS key identifier used for encrypting messages in the database
  /// activity stream.
  final String activityStreamKmsKeyId;

  /// The name of the Amazon Kinesis data stream used for the database activity
  /// stream.
  final String activityStreamKinesisStreamName;

  /// Specifies whether tags are copied from the DB cluster to snapshots of the
  /// DB cluster.
  final bool copyTagsToSnapshot;

  /// Specifies whether the DB cluster is a clone of a DB cluster owned by a
  /// different AWS account.
  final bool crossAccountClone;

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
    this.customEndpoints,
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
    this.earliestBacktrackTime,
    this.backtrackWindow,
    this.backtrackConsumedChangeRecords,
    this.enabledCloudwatchLogsExports,
    this.capacity,
    this.engineMode,
    this.scalingConfigurationInfo,
    this.deletionProtection,
    this.httpEndpointEnabled,
    this.activityStreamMode,
    this.activityStreamStatus,
    this.activityStreamKmsKeyId,
    this.activityStreamKinesisStreamName,
    this.copyTagsToSnapshot,
    this.crossAccountClone,
  });
  static DBCluster fromJson(Map<String, dynamic> json) => DBCluster();
}

/// This data type is used as a response element in the
/// `DescribeDBClusterBacktracks` action.
class DBClusterBacktrack {
  /// Contains a user-supplied DB cluster identifier. This identifier is the
  /// unique key that identifies a DB cluster.
  final String dbClusterIdentifier;

  /// Contains the backtrack identifier.
  final String backtrackIdentifier;

  /// The timestamp of the time to which the DB cluster was backtracked.
  final DateTime backtrackTo;

  /// The timestamp of the time from which the DB cluster was backtracked.
  final DateTime backtrackedFrom;

  /// The timestamp of the time at which the backtrack was requested.
  final DateTime backtrackRequestCreationTime;

  /// The status of the backtrack. This property returns one of the following
  /// values:
  ///
  /// *    `applying` - The backtrack is currently being applied to or rolled
  /// back from the DB cluster.
  ///
  /// *    `completed` - The backtrack has successfully been applied to or
  /// rolled back from the DB cluster.
  ///
  /// *    `failed` - An error occurred while the backtrack was applied to or
  /// rolled back from the DB cluster.
  ///
  /// *    `pending` - The backtrack is currently pending application to or
  /// rollback from the DB cluster.
  final String status;

  DBClusterBacktrack({
    this.dbClusterIdentifier,
    this.backtrackIdentifier,
    this.backtrackTo,
    this.backtrackedFrom,
    this.backtrackRequestCreationTime,
    this.status,
  });
  static DBClusterBacktrack fromJson(Map<String, dynamic> json) =>
      DBClusterBacktrack();
}

/// Contains the result of a successful invocation of the
/// `DescribeDBClusterBacktracks` action.
class DBClusterBacktrackMessage {
  /// A pagination token that can be used in a subsequent
  /// `DescribeDBClusterBacktracks` request.
  final String marker;

  /// Contains a list of backtracks for the user.
  final List<DBClusterBacktrack> dbClusterBacktracks;

  DBClusterBacktrackMessage({
    this.marker,
    this.dbClusterBacktracks,
  });
  static DBClusterBacktrackMessage fromJson(Map<String, dynamic> json) =>
      DBClusterBacktrackMessage();
}

class DBClusterCapacityInfo {
  /// A user-supplied DB cluster identifier. This identifier is the unique key
  /// that identifies a DB cluster.
  final String dbClusterIdentifier;

  /// A value that specifies the capacity that the DB cluster scales to next.
  final int pendingCapacity;

  /// The current capacity of the DB cluster.
  final int currentCapacity;

  /// The number of seconds before a call to `ModifyCurrentDBClusterCapacity`
  /// times out.
  final int secondsBeforeTimeout;

  /// The timeout action of a call to `ModifyCurrentDBClusterCapacity`, either
  /// `ForceApplyCapacityChange` or `RollbackCapacityChange`.
  final String timeoutAction;

  DBClusterCapacityInfo({
    this.dbClusterIdentifier,
    this.pendingCapacity,
    this.currentCapacity,
    this.secondsBeforeTimeout,
    this.timeoutAction,
  });
  static DBClusterCapacityInfo fromJson(Map<String, dynamic> json) =>
      DBClusterCapacityInfo();
}

/// This data type represents the information you need to connect to an Amazon
/// Aurora DB cluster. This data type is used as a response element in the
/// following actions:
///
/// *    `CreateDBClusterEndpoint`
///
/// *    `DescribeDBClusterEndpoints`
///
/// *    `ModifyDBClusterEndpoint`
///
/// *    `DeleteDBClusterEndpoint`
///
///
/// For the data structure that represents Amazon RDS DB instance endpoints, see
/// `Endpoint`.
class DBClusterEndpoint {
  /// The identifier associated with the endpoint. This parameter is stored as a
  /// lowercase string.
  final String dbClusterEndpointIdentifier;

  /// The DB cluster identifier of the DB cluster associated with the endpoint.
  /// This parameter is stored as a lowercase string.
  final String dbClusterIdentifier;

  /// A unique system-generated identifier for an endpoint. It remains the same
  /// for the whole life of the endpoint.
  final String dbClusterEndpointResourceIdentifier;

  /// The DNS address of the endpoint.
  final String endpoint;

  /// The current status of the endpoint. One of: `creating`, `available`,
  /// `deleting`, `modifying`.
  final String status;

  /// The type of the endpoint. One of: `READER`, `WRITER`, `CUSTOM`.
  final String endpointType;

  /// The type associated with a custom endpoint. One of: `READER`, `WRITER`,
  /// `ANY`.
  final String customEndpointType;

  /// List of DB instance identifiers that are part of the custom endpoint
  /// group.
  final List<String> staticMembers;

  /// List of DB instance identifiers that aren't part of the custom endpoint
  /// group. All other eligible instances are reachable through the custom
  /// endpoint. Only relevant if the list of static members is empty.
  final List<String> excludedMembers;

  /// The Amazon Resource Name (ARN) for the endpoint.
  final String dbClusterEndpointArn;

  DBClusterEndpoint({
    this.dbClusterEndpointIdentifier,
    this.dbClusterIdentifier,
    this.dbClusterEndpointResourceIdentifier,
    this.endpoint,
    this.status,
    this.endpointType,
    this.customEndpointType,
    this.staticMembers,
    this.excludedMembers,
    this.dbClusterEndpointArn,
  });
  static DBClusterEndpoint fromJson(Map<String, dynamic> json) =>
      DBClusterEndpoint();
}

class DBClusterEndpointMessage {
  ///  An optional pagination token provided by a previous
  /// `DescribeDBClusterEndpoints` request. If this parameter is specified, the
  /// response includes only records beyond the marker, up to the value
  /// specified by `MaxRecords`.
  final String marker;

  /// Contains the details of the endpoints associated with the cluster and
  /// matching any filter conditions.
  final List<DBClusterEndpoint> dbClusterEndpoints;

  DBClusterEndpointMessage({
    this.marker,
    this.dbClusterEndpoints,
  });
  static DBClusterEndpointMessage fromJson(Map<String, dynamic> json) =>
      DBClusterEndpointMessage();
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

  /// A value that specifies the order in which an Aurora Replica is promoted to
  /// the primary instance after a failure of the existing primary instance. For
  /// more information, see
  /// [Fault Tolerance for an Aurora DB Cluster](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/Aurora.Managing.Backups.html#Aurora.Managing.FaultTolerance)
  /// in the _Amazon Aurora User Guide_.
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

/// Contains the result of a successful invocation of the `DescribeDBClusters`
/// action.
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
      DBClusterMessage();
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
      DBClusterOptionGroupStatus();
}

/// Contains the details of an Amazon RDS DB cluster parameter group.
///
/// This data type is used as a response element in the
/// `DescribeDBClusterParameterGroups` action.
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

/// Provides details about a DB cluster parameter group including the parameters
/// in the DB cluster parameter group.
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
      DBClusterParameterGroupDetails();
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
  /// *   Can't end with a hyphen or contain two consecutive hyphens
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
      DBClusterParameterGroupsMessage();
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

  /// The name of the feature associated with the AWS Identity and Access
  /// Management (IAM) role. For the list of supported feature names, see
  /// DBEngineVersion.
  final String featureName;

  DBClusterRole({
    this.roleArn,
    this.status,
    this.featureName,
  });
  static DBClusterRole fromJson(Map<String, dynamic> json) => DBClusterRole();
}

/// Contains the details for an Amazon RDS DB cluster snapshot
///
/// This data type is used as a response element in the
/// `DescribeDBClusterSnapshots` action.
class DBClusterSnapshot {
  /// Provides the list of Availability Zones (AZs) where instances in the DB
  /// cluster snapshot can be restored.
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
      DBClusterSnapshot();
}

/// Contains the name and values of a manual DB cluster snapshot attribute.
///
/// Manual DB cluster snapshot attributes are used to authorize other AWS
/// accounts to restore a manual DB cluster snapshot. For more information, see
/// the `ModifyDBClusterSnapshotAttribute` API action.
class DBClusterSnapshotAttribute {
  /// The name of the manual DB cluster snapshot attribute.
  ///
  /// The attribute named `restore` refers to the list of AWS accounts that have
  /// permission to copy or restore the manual DB cluster snapshot. For more
  /// information, see the `ModifyDBClusterSnapshotAttribute` API action.
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
      DBClusterSnapshotAttribute();
}

/// Contains the results of a successful call to the
/// `DescribeDBClusterSnapshotAttributes` API action.
///
/// Manual DB cluster snapshot attributes are used to authorize other AWS
/// accounts to copy or restore a manual DB cluster snapshot. For more
/// information, see the `ModifyDBClusterSnapshotAttribute` API action.
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
      DBClusterSnapshotAttributesResult();
}

///  Provides a list of DB cluster snapshots for the user as the result of a
/// call to the `DescribeDBClusterSnapshots` action.
class DBClusterSnapshotMessage {
  ///  An optional pagination token provided by a previous
  /// `DescribeDBClusterSnapshots` request. If this parameter is specified, the
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
      DBClusterSnapshotMessage();
}

///  This data type is used as a response element in the action
/// `DescribeDBEngineVersions`.
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

  /// Indicates whether the database engine version supports Read Replicas.
  final bool supportsReadReplica;

  /// A list of the supported DB engine modes.
  final List<String> supportedEngineModes;

  ///  A list of features supported by the DB engine. Supported feature names
  /// include the following.
  ///
  /// *   s3Import
  final List<String> supportedFeatureNames;

  /// The status of the DB engine version, either `available` or `deprecated`.
  final String status;

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
    this.supportedEngineModes,
    this.supportedFeatureNames,
    this.status,
  });
  static DBEngineVersion fromJson(Map<String, dynamic> json) =>
      DBEngineVersion();
}

///  Contains the result of a successful invocation of the
/// `DescribeDBEngineVersions` action.
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
      DBEngineVersionMessage();
}

/// Contains the details of an Amazon RDS DB instance.
///
/// This data type is used as a response element in the `DescribeDBInstances`
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

  /// The meaning of this parameter differs according to the database engine you
  /// use.
  ///
  ///  **MySQL, MariaDB, SQL Server, PostgreSQL**
  ///
  /// Contains the name of the initial database of this instance that was
  /// provided at create time, if one was specified when the DB instance was
  /// created. This same name is returned for the life of the DB instance.
  ///
  /// Type: String
  ///
  ///  **Oracle**
  ///
  /// Contains the Oracle System ID (SID) of the created DB instance. Not shown
  /// when the returned parameters do not apply to an Oracle DB instance.
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

  ///  A list of DB security group elements containing `DBSecurityGroup.Name`
  /// and `DBSecurityGroup.Status` subelements.
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

  /// Contains one or more identifiers of Aurora DB clusters to which the RDS DB
  /// instance is replicated as a Read Replica. For example, when you create an
  /// Aurora Read Replica of an RDS MySQL DB instance, the Aurora MySQL DB
  /// cluster for the Aurora Read Replica is shown. This output does not contain
  /// information about cross region Aurora Read Replicas.
  ///
  ///
  ///
  /// Currently, each RDS DB instance can have only one Aurora Read Replica.
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

  /// Specifies the accessibility options for the DB instance. A value of true
  /// specifies an Internet-facing instance with a publicly resolvable DNS name,
  /// which resolves to a public IP address. A value of false specifies an
  /// internal instance with a DNS name that resolves to a private IP address.
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

  /// Specifies whether the DB instance is encrypted.
  final bool storageEncrypted;

  ///  If `StorageEncrypted` is true, the AWS KMS key identifier for the
  /// encrypted DB instance.
  final String kmsKeyId;

  /// The AWS Region-unique, immutable identifier for the DB instance. This
  /// identifier is found in AWS CloudTrail log entries whenever the AWS KMS key
  /// for the DB instance is accessed.
  final String dbiResourceId;

  /// The identifier of the CA certificate for this DB instance.
  final String caCertificateIdentifier;

  /// The Active Directory Domain membership records associated with the DB
  /// instance.
  final List<DomainMembership> domainMemberships;

  /// Specifies whether tags are copied from the DB instance to snapshots of the
  /// DB instance.
  ///
  ///  **Amazon Aurora**
  ///
  /// Not applicable. Copying tags to snapshots is managed by the DB cluster.
  /// Setting this value for an Aurora DB instance has no effect on the DB
  /// cluster setting. For more information, see `DBCluster`.
  final bool copyTagsToSnapshot;

  /// The interval, in seconds, between points when Enhanced Monitoring metrics
  /// are collected for the DB instance.
  final int monitoringInterval;

  /// The Amazon Resource Name (ARN) of the Amazon CloudWatch Logs log stream
  /// that receives the Enhanced Monitoring metrics data for the DB instance.
  final String enhancedMonitoringResourceArn;

  /// The ARN for the IAM role that permits RDS to send Enhanced Monitoring
  /// metrics to Amazon CloudWatch Logs.
  final String monitoringRoleArn;

  /// A value that specifies the order in which an Aurora Replica is promoted to
  /// the primary instance after a failure of the existing primary instance. For
  /// more information, see
  /// [Fault Tolerance for an Aurora DB Cluster](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/Aurora.Managing.Backups.html#Aurora.Managing.FaultTolerance)
  /// in the _Amazon Aurora User Guide_.
  final int promotionTier;

  /// The Amazon Resource Name (ARN) for the DB instance.
  final String dbInstanceArn;

  /// The time zone of the DB instance. In most cases, the `Timezone` element is
  /// empty. `Timezone` content appears only for Microsoft SQL Server DB
  /// instances that were created with a time zone specified.
  final String timezone;

  /// True if mapping of AWS Identity and Access Management (IAM) accounts to
  /// database accounts is enabled, and otherwise false.
  ///
  /// IAM database authentication can be enabled for the following database
  /// engines
  ///
  /// *   For MySQL 5.6, minor version 5.6.34 or higher
  ///
  /// *   For MySQL 5.7, minor version 5.7.16 or higher
  ///
  /// *   Aurora 5.6 or higher. To enable IAM database authentication for
  /// Aurora, see DBCluster Type.
  final bool iamDatabaseAuthenticationEnabled;

  /// True if Performance Insights is enabled for the DB instance, and otherwise
  /// false.
  final bool performanceInsightsEnabled;

  /// The AWS KMS key identifier for encryption of Performance Insights data.
  /// The KMS key ID is the Amazon Resource Name (ARN), KMS key identifier, or
  /// the KMS key alias for the KMS encryption key.
  final String performanceInsightsKmsKeyId;

  /// The amount of time, in days, to retain Performance Insights data. Valid
  /// values are 7 or 731 (2 years).
  final int performanceInsightsRetentionPeriod;

  /// A list of log types that this DB instance is configured to export to
  /// CloudWatch Logs.
  ///
  /// Log types vary by DB engine. For information about the log types for each
  /// DB engine, see
  /// [Amazon RDS Database Log Files](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_LogAccess.html)
  /// in the _Amazon RDS User Guide._
  final List<String> enabledCloudwatchLogsExports;

  /// The number of CPU cores and the number of threads per core for the DB
  /// instance class of the DB instance.
  final List<ProcessorFeature> processorFeatures;

  /// Indicates if the DB instance has deletion protection enabled. The database
  /// can't be deleted when deletion protection is enabled. For more
  /// information, see
  /// [Deleting a DB Instance](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_DeleteInstance.html).
  final bool deletionProtection;

  ///  The AWS Identity and Access Management (IAM) roles associated with the DB
  /// instance.
  final List<DBInstanceRole> associatedRoles;

  /// Specifies the listener connection endpoint for SQL Server Always On.
  final Endpoint listenerEndpoint;

  /// The upper limit to which Amazon RDS can automatically scale the storage of
  /// the DB instance.
  final int maxAllocatedStorage;

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
    this.performanceInsightsRetentionPeriod,
    this.enabledCloudwatchLogsExports,
    this.processorFeatures,
    this.deletionProtection,
    this.associatedRoles,
    this.listenerEndpoint,
    this.maxAllocatedStorage,
  });
  static DBInstance fromJson(Map<String, dynamic> json) => DBInstance();
}

/// An automated backup of a DB instance. It it consists of system backups,
/// transaction logs, and the database instance properties that existed at the
/// time you deleted the source instance.
class DBInstanceAutomatedBackup {
  /// The Amazon Resource Name (ARN) for the automated backup.
  final String dbInstanceArn;

  /// The identifier for the source DB instance, which can't be changed and
  /// which is unique to an AWS Region.
  final String dbiResourceId;

  /// The AWS Region associated with the automated backup.
  final String region;

  /// The customer id of the instance that is/was associated with the automated
  /// backup.
  final String dbInstanceIdentifier;

  /// Earliest and latest time an instance can be restored to.
  final RestoreWindow restoreWindow;

  /// Specifies the allocated storage size in gibibytes (GiB).
  final int allocatedStorage;

  /// Provides a list of status information for an automated backup:
  ///
  /// *    `active` - automated backups for current instances
  ///
  /// *    `retained` - automated backups for deleted instances
  ///
  /// *    `creating` - automated backups that are waiting for the first
  /// automated snapshot to be available.
  final String status;

  /// The port number that the automated backup used for connections.
  ///
  /// Default: Inherits from the source DB instance
  ///
  /// Valid Values: `1150-65535`
  final int port;

  /// The Availability Zone that the automated backup was created in. For
  /// information on AWS Regions and Availability Zones, see
  /// [Regions and Availability Zones](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.RegionsAndAvailabilityZones.html).
  final String availabilityZone;

  /// Provides the VPC ID associated with the DB instance
  final String vpcId;

  /// Provides the date and time that the DB instance was created.
  final DateTime instanceCreateTime;

  /// The license model of an automated backup.
  final String masterUsername;

  /// The name of the database engine for this automated backup.
  final String engine;

  /// The version of the database engine for the automated backup.
  final String engineVersion;

  /// License model information for the automated backup.
  final String licenseModel;

  /// The IOPS (I/O operations per second) value for the automated backup.
  final int iops;

  /// The option group the automated backup is associated with. If omitted, the
  /// default option group for the engine specified is used.
  final String optionGroupName;

  /// The ARN from the key store with which the automated backup is associated
  /// for TDE encryption.
  final String tdeCredentialArn;

  /// Specifies whether the automated backup is encrypted.
  final bool encrypted;

  /// Specifies the storage type associated with the automated backup.
  final String storageType;

  /// The AWS KMS key ID for an automated backup. The KMS key ID is the Amazon
  /// Resource Name (ARN), KMS key identifier, or the KMS key alias for the KMS
  /// encryption key.
  final String kmsKeyId;

  /// The time zone of the automated backup. In most cases, the `Timezone`
  /// element is empty. `Timezone` content appears only for Microsoft SQL Server
  /// DB instances that were created with a time zone specified.
  final String timezone;

  /// True if mapping of AWS Identity and Access Management (IAM) accounts to
  /// database accounts is enabled, and otherwise false.
  final bool iamDatabaseAuthenticationEnabled;

  DBInstanceAutomatedBackup({
    this.dbInstanceArn,
    this.dbiResourceId,
    this.region,
    this.dbInstanceIdentifier,
    this.restoreWindow,
    this.allocatedStorage,
    this.status,
    this.port,
    this.availabilityZone,
    this.vpcId,
    this.instanceCreateTime,
    this.masterUsername,
    this.engine,
    this.engineVersion,
    this.licenseModel,
    this.iops,
    this.optionGroupName,
    this.tdeCredentialArn,
    this.encrypted,
    this.storageType,
    this.kmsKeyId,
    this.timezone,
    this.iamDatabaseAuthenticationEnabled,
  });
  static DBInstanceAutomatedBackup fromJson(Map<String, dynamic> json) =>
      DBInstanceAutomatedBackup();
}

///  Contains the result of a successful invocation of the
/// `DescribeDBInstanceAutomatedBackups` action.
class DBInstanceAutomatedBackupMessage {
  ///  An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords` .
  final String marker;

  ///  A list of `DBInstanceAutomatedBackup` instances.
  final List<DBInstanceAutomatedBackup> dbInstanceAutomatedBackups;

  DBInstanceAutomatedBackupMessage({
    this.marker,
    this.dbInstanceAutomatedBackups,
  });
  static DBInstanceAutomatedBackupMessage fromJson(Map<String, dynamic> json) =>
      DBInstanceAutomatedBackupMessage();
}

///  Contains the result of a successful invocation of the `DescribeDBInstances`
/// action.
class DBInstanceMessage {
  ///  An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords` .
  final String marker;

  ///  A list of `DBInstance` instances.
  final List<DBInstance> dbInstances;

  DBInstanceMessage({
    this.marker,
    this.dbInstances,
  });
  static DBInstanceMessage fromJson(Map<String, dynamic> json) =>
      DBInstanceMessage();
}

/// Describes an AWS Identity and Access Management (IAM) role that is
/// associated with a DB instance.
class DBInstanceRole {
  /// The Amazon Resource Name (ARN) of the IAM role that is associated with the
  /// DB instance.
  final String roleArn;

  /// The name of the feature associated with the AWS Identity and Access
  /// Management (IAM) role. For the list of supported feature names, see
  /// `DBEngineVersion`.
  final String featureName;

  /// Describes the state of association between the IAM role and the DB
  /// instance. The Status property returns one of the following values:
  ///
  /// *    `ACTIVE` - the IAM role ARN is associated with the DB instance and
  /// can be used to access other AWS services on your behalf.
  ///
  /// *    `PENDING` - the IAM role ARN is being associated with the DB
  /// instance.
  ///
  /// *    `INVALID` - the IAM role ARN is associated with the DB instance, but
  /// the DB instance is unable to assume the IAM role in order to access other
  /// AWS services on your behalf.
  final String status;

  DBInstanceRole({
    this.roleArn,
    this.featureName,
    this.status,
  });
  static DBInstanceRole fromJson(Map<String, dynamic> json) => DBInstanceRole();
}

/// Provides a list of status information for a DB instance.
class DBInstanceStatusInfo {
  /// This value is currently "read replication."
  final String statusType;

  /// Boolean value that is true if the instance is operating normally, or false
  /// if the instance is in an error state.
  final bool normal;

  /// Status of the DB instance. For a StatusType of Read Replica, the values
  /// can be replicating, replication stop point set, replication stop point
  /// reached, error, stopped, or terminated.
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

/// Contains the details of an Amazon RDS DB parameter group.
///
/// This data type is used as a response element in the
/// `DescribeDBParameterGroups` action.
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
      DBParameterGroup();
}

///  Contains the result of a successful invocation of the
/// `DescribeDBParameters` action.
class DBParameterGroupDetails {
  ///  A list of `Parameter` values.
  final List<Parameter> parameters;

  ///  An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords`.
  final String marker;

  DBParameterGroupDetails({
    this.parameters,
    this.marker,
  });
  static DBParameterGroupDetails fromJson(Map<String, dynamic> json) =>
      DBParameterGroupDetails();
}

///  Contains the result of a successful invocation of the
/// `ModifyDBParameterGroup` or `ResetDBParameterGroup` action.
class DBParameterGroupNameMessage {
  /// Provides the name of the DB parameter group.
  final String dbParameterGroupName;

  DBParameterGroupNameMessage({
    this.dbParameterGroupName,
  });
  static DBParameterGroupNameMessage fromJson(Map<String, dynamic> json) =>
      DBParameterGroupNameMessage();
}

/// The status of the DB parameter group.
///
/// This data type is used as a response element in the following actions:
///
/// *    `CreateDBInstance`
///
/// *    `CreateDBInstanceReadReplica`
///
/// *    `DeleteDBInstance`
///
/// *    `ModifyDBInstance`
///
/// *    `RebootDBInstance`
///
/// *    `RestoreDBInstanceFromDBSnapshot`
class DBParameterGroupStatus {
  /// The name of the DB parameter group.
  final String dbParameterGroupName;

  /// The status of parameter updates.
  final String parameterApplyStatus;

  DBParameterGroupStatus({
    this.dbParameterGroupName,
    this.parameterApplyStatus,
  });
  static DBParameterGroupStatus fromJson(Map<String, dynamic> json) =>
      DBParameterGroupStatus();
}

///  Contains the result of a successful invocation of the
/// `DescribeDBParameterGroups` action.
class DBParameterGroupsMessage {
  ///  An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords`.
  final String marker;

  ///  A list of `DBParameterGroup` instances.
  final List<DBParameterGroup> dbParameterGroups;

  DBParameterGroupsMessage({
    this.marker,
    this.dbParameterGroups,
  });
  static DBParameterGroupsMessage fromJson(Map<String, dynamic> json) =>
      DBParameterGroupsMessage();
}

/// Contains the details for an Amazon RDS DB security group.
///
/// This data type is used as a response element in the
/// `DescribeDBSecurityGroups` action.
class DBSecurityGroup {
  /// Provides the AWS ID of the owner of a specific DB security group.
  final String ownerId;

  /// Specifies the name of the DB security group.
  final String dbSecurityGroupName;

  /// Provides the description of the DB security group.
  final String dbSecurityGroupDescription;

  /// Provides the VpcId of the DB security group.
  final String vpcId;

  ///  Contains a list of `EC2SecurityGroup` elements.
  final List<Ec2SecurityGroup> ec2SecurityGroups;

  ///  Contains a list of `IPRange` elements.
  final List<IPRange> ipRanges;

  /// The Amazon Resource Name (ARN) for the DB security group.
  final String dbSecurityGroupArn;

  DBSecurityGroup({
    this.ownerId,
    this.dbSecurityGroupName,
    this.dbSecurityGroupDescription,
    this.vpcId,
    this.ec2SecurityGroups,
    this.ipRanges,
    this.dbSecurityGroupArn,
  });
  static DBSecurityGroup fromJson(Map<String, dynamic> json) =>
      DBSecurityGroup();
}

/// This data type is used as a response element in the following actions:
///
/// *    `ModifyDBInstance`
///
/// *    `RebootDBInstance`
///
/// *    `RestoreDBInstanceFromDBSnapshot`
///
/// *    `RestoreDBInstanceToPointInTime`
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
      DBSecurityGroupMembership();
}

///  Contains the result of a successful invocation of the
/// `DescribeDBSecurityGroups` action.
class DBSecurityGroupMessage {
  ///  An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords`.
  final String marker;

  ///  A list of `DBSecurityGroup` instances.
  final List<DBSecurityGroup> dbSecurityGroups;

  DBSecurityGroupMessage({
    this.marker,
    this.dbSecurityGroups,
  });
  static DBSecurityGroupMessage fromJson(Map<String, dynamic> json) =>
      DBSecurityGroupMessage();
}

/// Contains the details of an Amazon RDS DB snapshot.
///
/// This data type is used as a response element in the `DescribeDBSnapshots`
/// action.
class DBSnapshot {
  /// Specifies the identifier for the DB snapshot.
  final String dbSnapshotIdentifier;

  /// Specifies the DB instance identifier of the DB instance this DB snapshot
  /// was created from.
  final String dbInstanceIdentifier;

  /// Provides the time when the snapshot was taken, in Universal Coordinated
  /// Time (UTC).
  final DateTime snapshotCreateTime;

  /// Specifies the name of the database engine.
  final String engine;

  /// Specifies the allocated storage size in gibibytes (GiB).
  final int allocatedStorage;

  /// Specifies the status of this DB snapshot.
  final String status;

  /// Specifies the port that the database engine was listening on at the time
  /// of the snapshot.
  final int port;

  /// Specifies the name of the Availability Zone the DB instance was located in
  /// at the time of the DB snapshot.
  final String availabilityZone;

  /// Provides the VPC ID associated with the DB snapshot.
  final String vpcId;

  /// Specifies the time when the snapshot was taken, in Universal Coordinated
  /// Time (UTC).
  final DateTime instanceCreateTime;

  /// Provides the master username for the DB snapshot.
  final String masterUsername;

  /// Specifies the version of the database engine.
  final String engineVersion;

  /// License model information for the restored DB instance.
  final String licenseModel;

  /// Provides the type of the DB snapshot.
  final String snapshotType;

  /// Specifies the Provisioned IOPS (I/O operations per second) value of the DB
  /// instance at the time of the snapshot.
  final int iops;

  /// Provides the option group name for the DB snapshot.
  final String optionGroupName;

  /// The percentage of the estimated data that has been transferred.
  final int percentProgress;

  /// The AWS Region that the DB snapshot was created in or copied from.
  final String sourceRegion;

  /// The DB snapshot Amazon Resource Name (ARN) that the DB snapshot was copied
  /// from. It only has value in case of cross-customer or cross-region copy.
  final String sourceDBSnapshotIdentifier;

  /// Specifies the storage type associated with DB snapshot.
  final String storageType;

  /// The ARN from the key store with which to associate the instance for TDE
  /// encryption.
  final String tdeCredentialArn;

  /// Specifies whether the DB snapshot is encrypted.
  final bool encrypted;

  ///  If `Encrypted` is true, the AWS KMS key identifier for the encrypted DB
  /// snapshot.
  final String kmsKeyId;

  /// The Amazon Resource Name (ARN) for the DB snapshot.
  final String dbSnapshotArn;

  /// The time zone of the DB snapshot. In most cases, the `Timezone` element is
  /// empty. `Timezone` content appears only for snapshots taken from Microsoft
  /// SQL Server DB instances that were created with a time zone specified.
  final String timezone;

  /// True if mapping of AWS Identity and Access Management (IAM) accounts to
  /// database accounts is enabled, and otherwise false.
  final bool iamDatabaseAuthenticationEnabled;

  /// The number of CPU cores and the number of threads per core for the DB
  /// instance class of the DB instance when the DB snapshot was created.
  final List<ProcessorFeature> processorFeatures;

  /// The identifier for the source DB instance, which can't be changed and
  /// which is unique to an AWS Region.
  final String dbiResourceId;

  DBSnapshot({
    this.dbSnapshotIdentifier,
    this.dbInstanceIdentifier,
    this.snapshotCreateTime,
    this.engine,
    this.allocatedStorage,
    this.status,
    this.port,
    this.availabilityZone,
    this.vpcId,
    this.instanceCreateTime,
    this.masterUsername,
    this.engineVersion,
    this.licenseModel,
    this.snapshotType,
    this.iops,
    this.optionGroupName,
    this.percentProgress,
    this.sourceRegion,
    this.sourceDBSnapshotIdentifier,
    this.storageType,
    this.tdeCredentialArn,
    this.encrypted,
    this.kmsKeyId,
    this.dbSnapshotArn,
    this.timezone,
    this.iamDatabaseAuthenticationEnabled,
    this.processorFeatures,
    this.dbiResourceId,
  });
  static DBSnapshot fromJson(Map<String, dynamic> json) => DBSnapshot();
}

/// Contains the name and values of a manual DB snapshot attribute
///
/// Manual DB snapshot attributes are used to authorize other AWS accounts to
/// restore a manual DB snapshot. For more information, see the
/// `ModifyDBSnapshotAttribute` API.
class DBSnapshotAttribute {
  /// The name of the manual DB snapshot attribute.
  ///
  /// The attribute named `restore` refers to the list of AWS accounts that have
  /// permission to copy or restore the manual DB cluster snapshot. For more
  /// information, see the `ModifyDBSnapshotAttribute` API action.
  final String attributeName;

  /// The value or values for the manual DB snapshot attribute.
  ///
  /// If the `AttributeName` field is set to `restore`, then this element
  /// returns a list of IDs of the AWS accounts that are authorized to copy or
  /// restore the manual DB snapshot. If a value of `all` is in the list, then
  /// the manual DB snapshot is public and available for any AWS account to copy
  /// or restore.
  final List<String> attributeValues;

  DBSnapshotAttribute({
    this.attributeName,
    this.attributeValues,
  });
  static DBSnapshotAttribute fromJson(Map<String, dynamic> json) =>
      DBSnapshotAttribute();
}

/// Contains the results of a successful call to the
/// `DescribeDBSnapshotAttributes` API action.
///
/// Manual DB snapshot attributes are used to authorize other AWS accounts to
/// copy or restore a manual DB snapshot. For more information, see the
/// `ModifyDBSnapshotAttribute` API action.
class DBSnapshotAttributesResult {
  /// The identifier of the manual DB snapshot that the attributes apply to.
  final String dbSnapshotIdentifier;

  /// The list of attributes and values for the manual DB snapshot.
  final List<DBSnapshotAttribute> dbSnapshotAttributes;

  DBSnapshotAttributesResult({
    this.dbSnapshotIdentifier,
    this.dbSnapshotAttributes,
  });
  static DBSnapshotAttributesResult fromJson(Map<String, dynamic> json) =>
      DBSnapshotAttributesResult();
}

///  Contains the result of a successful invocation of the `DescribeDBSnapshots`
/// action.
class DBSnapshotMessage {
  ///  An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords`.
  final String marker;

  ///  A list of `DBSnapshot` instances.
  final List<DBSnapshot> dbSnapshots;

  DBSnapshotMessage({
    this.marker,
    this.dbSnapshots,
  });
  static DBSnapshotMessage fromJson(Map<String, dynamic> json) =>
      DBSnapshotMessage();
}

/// Contains the details of an Amazon RDS DB subnet group.
///
/// This data type is used as a response element in the `DescribeDBSubnetGroups`
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

  ///  Contains a list of `Subnet` elements.
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
  static DBSubnetGroup fromJson(Map<String, dynamic> json) => DBSubnetGroup();
}

///  Contains the result of a successful invocation of the
/// `DescribeDBSubnetGroups` action.
class DBSubnetGroupMessage {
  ///  An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords`.
  final String marker;

  ///  A list of `DBSubnetGroup` instances.
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

class DeleteDBInstanceAutomatedBackupResult {
  final DBInstanceAutomatedBackup dbInstanceAutomatedBackup;

  DeleteDBInstanceAutomatedBackupResult({
    this.dbInstanceAutomatedBackup,
  });
  static DeleteDBInstanceAutomatedBackupResult fromJson(
          Map<String, dynamic> json) =>
      DeleteDBInstanceAutomatedBackupResult();
}

class DeleteDBInstanceResult {
  final DBInstance dbInstance;

  DeleteDBInstanceResult({
    this.dbInstance,
  });
  static DeleteDBInstanceResult fromJson(Map<String, dynamic> json) =>
      DeleteDBInstanceResult();
}

class DeleteDBSnapshotResult {
  final DBSnapshot dbSnapshot;

  DeleteDBSnapshotResult({
    this.dbSnapshot,
  });
  static DeleteDBSnapshotResult fromJson(Map<String, dynamic> json) =>
      DeleteDBSnapshotResult();
}

class DeleteEventSubscriptionResult {
  final EventSubscription eventSubscription;

  DeleteEventSubscriptionResult({
    this.eventSubscription,
  });
  static DeleteEventSubscriptionResult fromJson(Map<String, dynamic> json) =>
      DeleteEventSubscriptionResult();
}

class DeleteGlobalClusterResult {
  final GlobalCluster globalCluster;

  DeleteGlobalClusterResult({
    this.globalCluster,
  });
  static DeleteGlobalClusterResult fromJson(Map<String, dynamic> json) =>
      DeleteGlobalClusterResult();
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

/// This data type is used as a response element to `DescribeDBLogFiles`.
class DescribeDBLogFilesDetails {
  /// The name of the log file for the specified DB instance.
  final String logFileName;

  /// A POSIX timestamp when the last log entry was written.
  final BigInt lastWritten;

  /// The size, in bytes, of the log file for the specified DB instance.
  final BigInt size;

  DescribeDBLogFilesDetails({
    this.logFileName,
    this.lastWritten,
    this.size,
  });
  static DescribeDBLogFilesDetails fromJson(Map<String, dynamic> json) =>
      DescribeDBLogFilesDetails();
}

///  The response from a call to `DescribeDBLogFiles`.
class DescribeDBLogFilesResponse {
  /// The DB log files returned.
  final List<DescribeDBLogFilesDetails> describeDBLogFiles;

  /// A pagination token that can be used in a subsequent DescribeDBLogFiles
  /// request.
  final String marker;

  DescribeDBLogFilesResponse({
    this.describeDBLogFiles,
    this.marker,
  });
  static DescribeDBLogFilesResponse fromJson(Map<String, dynamic> json) =>
      DescribeDBLogFilesResponse();
}

class DescribeDBSnapshotAttributesResult {
  final DBSnapshotAttributesResult dbSnapshotAttributesResult;

  DescribeDBSnapshotAttributesResult({
    this.dbSnapshotAttributesResult,
  });
  static DescribeDBSnapshotAttributesResult fromJson(
          Map<String, dynamic> json) =>
      DescribeDBSnapshotAttributesResult();
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

class DescribeEngineDefaultParametersResult {
  final EngineDefaults engineDefaults;

  DescribeEngineDefaultParametersResult({
    this.engineDefaults,
  });
  static DescribeEngineDefaultParametersResult fromJson(
          Map<String, dynamic> json) =>
      DescribeEngineDefaultParametersResult();
}

class DescribeValidDBInstanceModificationsResult {
  final ValidDBInstanceModificationsMessage validDBInstanceModificationsMessage;

  DescribeValidDBInstanceModificationsResult({
    this.validDBInstanceModificationsMessage,
  });
  static DescribeValidDBInstanceModificationsResult fromJson(
          Map<String, dynamic> json) =>
      DescribeValidDBInstanceModificationsResult();
}

/// An Active Directory Domain membership record associated with the DB
/// instance.
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
      DomainMembership();
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
  static DoubleRange fromJson(Map<String, dynamic> json) => DoubleRange();
}

/// This data type is used as a response element to `DownloadDBLogFilePortion`.
class DownloadDBLogFilePortionDetails {
  /// Entries from the specified log file.
  final String logFileData;

  /// A pagination token that can be used in a subsequent
  /// DownloadDBLogFilePortion request.
  final String marker;

  /// Boolean value that if true, indicates there is more data to be downloaded.
  final bool additionalDataPending;

  DownloadDBLogFilePortionDetails({
    this.logFileData,
    this.marker,
    this.additionalDataPending,
  });
  static DownloadDBLogFilePortionDetails fromJson(Map<String, dynamic> json) =>
      DownloadDBLogFilePortionDetails();
}

/// This data type is used as a response element in the following actions:
///
/// *    `AuthorizeDBSecurityGroupIngress`
///
/// *    `DescribeDBSecurityGroups`
///
/// *    `RevokeDBSecurityGroupIngress`
class Ec2SecurityGroup {
  /// Provides the status of the EC2 security group. Status can be
  /// "authorizing", "authorized", "revoking", and "revoked".
  final String status;

  /// Specifies the name of the EC2 security group.
  final String ec2SecurityGroupName;

  /// Specifies the id of the EC2 security group.
  final String ec2SecurityGroupId;

  ///  Specifies the AWS ID of the owner of the EC2 security group specified in
  /// the `EC2SecurityGroupName` field.
  final String ec2SecurityGroupOwnerId;

  Ec2SecurityGroup({
    this.status,
    this.ec2SecurityGroupName,
    this.ec2SecurityGroupId,
    this.ec2SecurityGroupOwnerId,
  });
  static Ec2SecurityGroup fromJson(Map<String, dynamic> json) =>
      Ec2SecurityGroup();
}

/// This data type represents the information you need to connect to an Amazon
/// RDS DB instance. This data type is used as a response element in the
/// following actions:
///
/// *    `CreateDBInstance`
///
/// *    `DescribeDBInstances`
///
/// *    `DeleteDBInstance`
///
///
/// For the data structure that represents Amazon Aurora DB cluster endpoints,
/// see `DBClusterEndpoint`.
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

///  Contains the result of a successful invocation of the
/// `DescribeEngineDefaultParameters` action.
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
  static EngineDefaults fromJson(Map<String, dynamic> json) => EngineDefaults();
}

///  This data type is used as a response element in the `DescribeEvents`
/// action.
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

/// Contains the results of a successful invocation of the
/// `DescribeEventCategories` action.
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
      EventCategoriesMap();
}

/// Data returned from the **DescribeEventCategories** action.
class EventCategoriesMessage {
  /// A list of EventCategoriesMap data types.
  final List<EventCategoriesMap> eventCategoriesMapList;

  EventCategoriesMessage({
    this.eventCategoriesMapList,
  });
  static EventCategoriesMessage fromJson(Map<String, dynamic> json) =>
      EventCategoriesMessage();
}

/// Contains the results of a successful invocation of the
/// `DescribeEventSubscriptions` action.
class EventSubscription {
  /// The AWS customer account associated with the RDS event notification
  /// subscription.
  final String customerAwsId;

  /// The RDS event notification subscription Id.
  final String custSubscriptionId;

  /// The topic ARN of the RDS event notification subscription.
  final String snsTopicArn;

  /// The status of the RDS event notification subscription.
  ///
  /// Constraints:
  ///
  /// Can be one of the following: creating | modifying | deleting | active |
  /// no-permission | topic-not-exist
  ///
  /// The status "no-permission" indicates that RDS no longer has permission to
  /// post to the SNS topic. The status "topic-not-exist" indicates that the
  /// topic was deleted after the subscription was created.
  final String status;

  /// The time the RDS event notification subscription was created.
  final String subscriptionCreationTime;

  /// The source type for the RDS event notification subscription.
  final String sourceType;

  /// A list of source IDs for the RDS event notification subscription.
  final List<String> sourceIdsList;

  /// A list of event categories for the RDS event notification subscription.
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
      EventSubscription();
}

/// Data returned by the **DescribeEventSubscriptions** action.
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
      EventSubscriptionsMessage();
}

///  Contains the result of a successful invocation of the `DescribeEvents`
/// action.
class EventsMessage {
  ///  An optional pagination token provided by a previous Events request. If
  /// this parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords` .
  final String marker;

  ///  A list of `Event` instances.
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

/// A filter name and value pair that is used to return a more specific list of
/// results from a describe operation. Filters can be used to match a set of
/// resources by specific criteria, such as IDs. The filters supported by a
/// describe operation are documented with the describe operation.
///
///  Currently, wildcards are not supported in filters.
///
/// The following actions can be filtered:
///
/// *    `DescribeDBClusterBacktracks`
///
/// *    `DescribeDBClusterEndpoints`
///
/// *    `DescribeDBClusters`
///
/// *    `DescribeDBInstances`
///
/// *    `DescribePendingMaintenanceActions`
class Filter {
  /// The name of the filter. Filter names are case-sensitive.
  final String name;

  /// One or more filter values. Filter values are case-sensitive.
  final List<String> values;

  Filter({
    @required this.name,
    @required this.values,
  });
}

/// A data type representing an Aurora global database.
class GlobalCluster {
  ///  Contains a user-supplied global database cluster identifier. This
  /// identifier is the unique key that identifies a global database cluster.
  final String globalClusterIdentifier;

  ///  The AWS Region-unique, immutable identifier for the global database
  /// cluster. This identifier is found in AWS CloudTrail log entries whenever
  /// the AWS KMS key for the DB cluster is accessed.
  final String globalClusterResourceId;

  /// The Amazon Resource Name (ARN) for the global database cluster.
  final String globalClusterArn;

  /// Specifies the current state of this global database cluster.
  final String status;

  ///  The Aurora database engine used by the global database cluster.
  final String engine;

  /// Indicates the database engine version.
  final String engineVersion;

  ///  The default database name within the new global database cluster.
  final String databaseName;

  ///  The storage encryption setting for the global database cluster.
  final bool storageEncrypted;

  ///  The deletion protection setting for the new global database cluster.
  final bool deletionProtection;

  ///  The list of cluster IDs for secondary clusters within the global database
  /// cluster. Currently limited to 1 item.
  final List<GlobalClusterMember> globalClusterMembers;

  GlobalCluster({
    this.globalClusterIdentifier,
    this.globalClusterResourceId,
    this.globalClusterArn,
    this.status,
    this.engine,
    this.engineVersion,
    this.databaseName,
    this.storageEncrypted,
    this.deletionProtection,
    this.globalClusterMembers,
  });
  static GlobalCluster fromJson(Map<String, dynamic> json) => GlobalCluster();
}

///  A data structure with information about any primary and secondary clusters
/// associated with an Aurora global database.
class GlobalClusterMember {
  ///  The Amazon Resource Name (ARN) for each Aurora cluster.
  final String dbClusterArn;

  ///  The Amazon Resource Name (ARN) for each read-only secondary cluster
  /// associated with the Aurora global database.
  final List<String> readers;

  ///  Specifies whether the Aurora cluster is the primary cluster (that is, has
  /// read-write capability) for the Aurora global database with which it is
  /// associated.
  final bool isWriter;

  GlobalClusterMember({
    this.dbClusterArn,
    this.readers,
    this.isWriter,
  });
  static GlobalClusterMember fromJson(Map<String, dynamic> json) =>
      GlobalClusterMember();
}

class GlobalClustersMessage {
  ///  An optional pagination token provided by a previous
  /// `DescribeGlobalClusters` request. If this parameter is specified, the
  /// response includes only records beyond the marker, up to the value
  /// specified by `MaxRecords`.
  final String marker;

  ///  The list of global clusters returned by this request.
  final List<GlobalCluster> globalClusters;

  GlobalClustersMessage({
    this.marker,
    this.globalClusters,
  });
  static GlobalClustersMessage fromJson(Map<String, dynamic> json) =>
      GlobalClustersMessage();
}

///  This data type is used as a response element in the
/// `DescribeDBSecurityGroups` action.
class IPRange {
  /// Specifies the status of the IP range. Status can be "authorizing",
  /// "authorized", "revoking", and "revoked".
  final String status;

  /// Specifies the IP range.
  final String cidrip;

  IPRange({
    this.status,
    this.cidrip,
  });
  static IPRange fromJson(Map<String, dynamic> json) => IPRange();
}

/// The minimum DB engine version required for each corresponding allowed value
/// for an option setting.
class MinimumEngineVersionPerAllowedValue {
  /// The allowed value for an option setting.
  final String allowedValue;

  /// The minimum DB engine version required for the allowed value.
  final String minimumEngineVersion;

  MinimumEngineVersionPerAllowedValue({
    this.allowedValue,
    this.minimumEngineVersion,
  });
  static MinimumEngineVersionPerAllowedValue fromJson(
          Map<String, dynamic> json) =>
      MinimumEngineVersionPerAllowedValue();
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

class ModifyDBSnapshotAttributeResult {
  final DBSnapshotAttributesResult dbSnapshotAttributesResult;

  ModifyDBSnapshotAttributeResult({
    this.dbSnapshotAttributesResult,
  });
  static ModifyDBSnapshotAttributeResult fromJson(Map<String, dynamic> json) =>
      ModifyDBSnapshotAttributeResult();
}

class ModifyDBSnapshotResult {
  final DBSnapshot dbSnapshot;

  ModifyDBSnapshotResult({
    this.dbSnapshot,
  });
  static ModifyDBSnapshotResult fromJson(Map<String, dynamic> json) =>
      ModifyDBSnapshotResult();
}

class ModifyDBSubnetGroupResult {
  final DBSubnetGroup dbSubnetGroup;

  ModifyDBSubnetGroupResult({
    this.dbSubnetGroup,
  });
  static ModifyDBSubnetGroupResult fromJson(Map<String, dynamic> json) =>
      ModifyDBSubnetGroupResult();
}

class ModifyEventSubscriptionResult {
  final EventSubscription eventSubscription;

  ModifyEventSubscriptionResult({
    this.eventSubscription,
  });
  static ModifyEventSubscriptionResult fromJson(Map<String, dynamic> json) =>
      ModifyEventSubscriptionResult();
}

class ModifyGlobalClusterResult {
  final GlobalCluster globalCluster;

  ModifyGlobalClusterResult({
    this.globalCluster,
  });
  static ModifyGlobalClusterResult fromJson(Map<String, dynamic> json) =>
      ModifyGlobalClusterResult();
}

class ModifyOptionGroupResult {
  final OptionGroup optionGroup;

  ModifyOptionGroupResult({
    this.optionGroup,
  });
  static ModifyOptionGroupResult fromJson(Map<String, dynamic> json) =>
      ModifyOptionGroupResult();
}

/// Option details.
class Option {
  /// The name of the option.
  final String optionName;

  /// The description of the option.
  final String optionDescription;

  /// Indicate if this option is persistent.
  final bool persistent;

  /// Indicate if this option is permanent.
  final bool permanent;

  /// If required, the port configured for this option to use.
  final int port;

  /// The version of the option.
  final String optionVersion;

  /// The option settings for this option.
  final List<OptionSetting> optionSettings;

  /// If the option requires access to a port, then this DB security group
  /// allows access to the port.
  final List<DBSecurityGroupMembership> dbSecurityGroupMemberships;

  /// If the option requires access to a port, then this VPC security group
  /// allows access to the port.
  final List<VpcSecurityGroupMembership> vpcSecurityGroupMemberships;

  Option({
    this.optionName,
    this.optionDescription,
    this.persistent,
    this.permanent,
    this.port,
    this.optionVersion,
    this.optionSettings,
    this.dbSecurityGroupMemberships,
    this.vpcSecurityGroupMemberships,
  });
  static Option fromJson(Map<String, dynamic> json) => Option();
}

/// A list of all available options
class OptionConfiguration {
  /// The configuration of options to include in a group.
  final String optionName;

  /// The optional port for the option.
  final int port;

  /// The version for the option.
  final String optionVersion;

  /// A list of DBSecurityGroupMembership name strings used for this option.
  final List<String> dbSecurityGroupMemberships;

  /// A list of VpcSecurityGroupMembership name strings used for this option.
  final List<String> vpcSecurityGroupMemberships;

  /// The option settings to include in an option group.
  final List<OptionSetting> optionSettings;

  OptionConfiguration({
    @required this.optionName,
    this.port,
    this.optionVersion,
    this.dbSecurityGroupMemberships,
    this.vpcSecurityGroupMemberships,
    this.optionSettings,
  });
}

class OptionGroup {
  /// Specifies the name of the option group.
  final String optionGroupName;

  /// Provides a description of the option group.
  final String optionGroupDescription;

  /// Indicates the name of the engine that this option group can be applied to.
  final String engineName;

  /// Indicates the major engine version associated with this option group.
  final String majorEngineVersion;

  /// Indicates what options are available in the option group.
  final List<Option> options;

  /// Indicates whether this option group can be applied to both VPC and non-VPC
  /// instances. The value `true` indicates the option group can be applied to
  /// both VPC and non-VPC instances.
  final bool allowsVpcAndNonVpcInstanceMemberships;

  /// If **AllowsVpcAndNonVpcInstanceMemberships** is `false`, this field is
  /// blank. If **AllowsVpcAndNonVpcInstanceMemberships** is `true` and this
  /// field is blank, then this option group can be applied to both VPC and
  /// non-VPC instances. If this field contains a value, then this option group
  /// can only be applied to instances that are in the VPC indicated by this
  /// field.
  final String vpcId;

  /// The Amazon Resource Name (ARN) for the option group.
  final String optionGroupArn;

  OptionGroup({
    this.optionGroupName,
    this.optionGroupDescription,
    this.engineName,
    this.majorEngineVersion,
    this.options,
    this.allowsVpcAndNonVpcInstanceMemberships,
    this.vpcId,
    this.optionGroupArn,
  });
  static OptionGroup fromJson(Map<String, dynamic> json) => OptionGroup();
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
      OptionGroupMembership();
}

/// Available option.
class OptionGroupOption {
  /// The name of the option.
  final String name;

  /// The description of the option.
  final String description;

  /// The name of the engine that this option can be applied to.
  final String engineName;

  /// Indicates the major engine version that the option is available for.
  final String majorEngineVersion;

  /// The minimum required engine version for the option to be applied.
  final String minimumRequiredMinorEngineVersion;

  /// Specifies whether the option requires a port.
  final bool portRequired;

  /// If the option requires a port, specifies the default port for the option.
  final int defaultPort;

  /// The options that are prerequisites for this option.
  final List<String> optionsDependedOn;

  /// The options that conflict with this option.
  final List<String> optionsConflictsWith;

  /// Persistent options can't be removed from an option group while DB
  /// instances are associated with the option group. If you disassociate all DB
  /// instances from the option group, your can remove the persistent option
  /// from the option group.
  final bool persistent;

  /// Permanent options can never be removed from an option group. An option
  /// group containing a permanent option can't be removed from a DB instance.
  final bool permanent;

  /// If true, you must enable the Auto Minor Version Upgrade setting for your
  /// DB instance before you can use this option. You can enable Auto Minor
  /// Version Upgrade when you first create your DB instance, or by modifying
  /// your DB instance later.
  final bool requiresAutoMinorEngineVersionUpgrade;

  /// If true, you can only use this option with a DB instance that is in a VPC.
  final bool vpcOnly;

  /// If true, you can change the option to an earlier version of the option.
  /// This only applies to options that have different versions available.
  final bool supportsOptionVersionDowngrade;

  /// The option settings that are available (and the default value) for each
  /// option in an option group.
  final List<OptionGroupOptionSetting> optionGroupOptionSettings;

  /// The versions that are available for the option.
  final List<OptionVersion> optionGroupOptionVersions;

  OptionGroupOption({
    this.name,
    this.description,
    this.engineName,
    this.majorEngineVersion,
    this.minimumRequiredMinorEngineVersion,
    this.portRequired,
    this.defaultPort,
    this.optionsDependedOn,
    this.optionsConflictsWith,
    this.persistent,
    this.permanent,
    this.requiresAutoMinorEngineVersionUpgrade,
    this.vpcOnly,
    this.supportsOptionVersionDowngrade,
    this.optionGroupOptionSettings,
    this.optionGroupOptionVersions,
  });
  static OptionGroupOption fromJson(Map<String, dynamic> json) =>
      OptionGroupOption();
}

/// Option group option settings are used to display settings available for each
/// option with their default values and other information. These values are
/// used with the DescribeOptionGroupOptions action.
class OptionGroupOptionSetting {
  /// The name of the option group option.
  final String settingName;

  /// The description of the option group option.
  final String settingDescription;

  /// The default value for the option group option.
  final String defaultValue;

  /// The DB engine specific parameter type for the option group option.
  final String applyType;

  /// Indicates the acceptable values for the option group option.
  final String allowedValues;

  /// Boolean value where true indicates that this option group option can be
  /// changed from the default value.
  final bool isModifiable;

  /// Boolean value where true indicates that a value must be specified for this
  /// option setting of the option group option.
  final bool isRequired;

  /// The minimum DB engine version required for the corresponding allowed value
  /// for this option setting.
  final List<MinimumEngineVersionPerAllowedValue>
      minimumEngineVersionPerAllowedValue;

  OptionGroupOptionSetting({
    this.settingName,
    this.settingDescription,
    this.defaultValue,
    this.applyType,
    this.allowedValues,
    this.isModifiable,
    this.isRequired,
    this.minimumEngineVersionPerAllowedValue,
  });
  static OptionGroupOptionSetting fromJson(Map<String, dynamic> json) =>
      OptionGroupOptionSetting();
}

class OptionGroupOptionsMessage {
  final List<OptionGroupOption> optionGroupOptions;

  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords`.
  final String marker;

  OptionGroupOptionsMessage({
    this.optionGroupOptions,
    this.marker,
  });
  static OptionGroupOptionsMessage fromJson(Map<String, dynamic> json) =>
      OptionGroupOptionsMessage();
}

/// List of option groups.
class OptionGroups {
  /// List of option groups.
  final List<OptionGroup> optionGroupsList;

  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords`.
  final String marker;

  OptionGroups({
    this.optionGroupsList,
    this.marker,
  });
  static OptionGroups fromJson(Map<String, dynamic> json) => OptionGroups();
}

/// Option settings are the actual settings being applied or configured for that
/// option. It is used when you modify an option group or describe option
/// groups. For example, the NATIVE_NETWORK_ENCRYPTION option has a setting
/// called SQLNET.ENCRYPTION_SERVER that can have several different values.
class OptionSetting {
  /// The name of the option that has settings that you can set.
  final String name;

  /// The current value of the option setting.
  final String value;

  /// The default value of the option setting.
  final String defaultValue;

  /// The description of the option setting.
  final String description;

  /// The DB engine specific parameter type.
  final String applyType;

  /// The data type of the option setting.
  final String dataType;

  /// The allowed values of the option setting.
  final String allowedValues;

  /// A Boolean value that, when true, indicates the option setting can be
  /// modified from the default.
  final bool isModifiable;

  /// Indicates if the option setting is part of a collection.
  final bool isCollection;

  OptionSetting({
    this.name,
    this.value,
    this.defaultValue,
    this.description,
    this.applyType,
    this.dataType,
    this.allowedValues,
    this.isModifiable,
    this.isCollection,
  });
  static OptionSetting fromJson(Map<String, dynamic> json) => OptionSetting();
}

/// The version for an option. Option group option versions are returned by the
/// `DescribeOptionGroupOptions` action.
class OptionVersion {
  /// The version of the option.
  final String version;

  /// True if the version is the default version of the option, and otherwise
  /// false.
  final bool isDefault;

  OptionVersion({
    this.version,
    this.isDefault,
  });
  static OptionVersion fromJson(Map<String, dynamic> json) => OptionVersion();
}

/// Contains a list of available options for a DB instance.
///
///  This data type is used as a response element in the
/// `DescribeOrderableDBInstanceOptions` action.
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

  /// A list of the available processor features for the DB instance class of a
  /// DB instance.
  final List<AvailableProcessorFeature> availableProcessorFeatures;

  /// A list of the supported DB engine modes.
  final List<String> supportedEngineModes;

  /// Whether or not Amazon RDS can automatically scale storage for DB instances
  /// that use the specified instance class.
  final bool supportsStorageAutoscaling;

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
    this.availableProcessorFeatures,
    this.supportedEngineModes,
    this.supportsStorageAutoscaling,
  });
  static OrderableDBInstanceOption fromJson(Map<String, dynamic> json) =>
      OrderableDBInstanceOption();
}

///  Contains the result of a successful invocation of the
/// `DescribeOrderableDBInstanceOptions` action.
class OrderableDBInstanceOptionsMessage {
  /// An `OrderableDBInstanceOption` structure containing information about
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
      OrderableDBInstanceOptionsMessage();
}

///  This data type is used as a request parameter in the
/// `ModifyDBParameterGroup` and `ResetDBParameterGroup` actions.
///
/// This data type is used as a response element in the
/// `DescribeEngineDefaultParameters` and `DescribeDBParameters` actions.
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

  /// The valid DB engine modes.
  final List<String> supportedEngineModes;

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
    this.supportedEngineModes,
  });
  static Parameter fromJson(Map<String, dynamic> json) => Parameter();
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
      PendingCloudwatchLogsExports();
}

/// Provides information about a pending maintenance action for a resource.
class PendingMaintenanceAction {
  /// The type of pending maintenance action that is available for the resource.
  /// Valid actions are `system-update`, `db-upgrade`, and
  /// `hardware-maintenance`.
  final String action;

  /// The date of the maintenance window when the action is applied. The
  /// maintenance action is applied to the resource during its first maintenance
  /// window after this date.
  final DateTime autoAppliedAfterDate;

  /// The date when the maintenance action is automatically applied. The
  /// maintenance action is applied to the resource on this date regardless of
  /// the maintenance window for the resource.
  final DateTime forcedApplyDate;

  /// Indicates the type of opt-in request that has been received for the
  /// resource.
  final String optInStatus;

  /// The effective date when the pending maintenance action is applied to the
  /// resource. This date takes into account opt-in requests received from the
  /// `ApplyPendingMaintenanceAction` API, the `AutoAppliedAfterDate`, and the
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
      PendingMaintenanceAction();
}

/// Data returned from the **DescribePendingMaintenanceActions** action.
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
      PendingMaintenanceActionsMessage();
}

///  This data type is used as a response element in the `ModifyDBInstance`
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

  final PendingCloudwatchLogsExports pendingCloudwatchLogsExports;

  /// The number of CPU cores and the number of threads per core for the DB
  /// instance class of the DB instance.
  final List<ProcessorFeature> processorFeatures;

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
    this.processorFeatures,
  });
  static PendingModifiedValues fromJson(Map<String, dynamic> json) =>
      PendingModifiedValues();
}

/// Contains the processor features of a DB instance class.
///
/// To specify the number of CPU cores, use the `coreCount` feature name for the
/// `Name` parameter. To specify the number of threads per core, use the
/// `threadsPerCore` feature name for the `Name` parameter.
///
/// You can set the processor features of the DB instance class for a DB
/// instance when you call one of the following actions:
///
/// *    `CreateDBInstance`
///
/// *    `ModifyDBInstance`
///
/// *    `RestoreDBInstanceFromDBSnapshot`
///
/// *    `RestoreDBInstanceFromS3`
///
/// *    `RestoreDBInstanceToPointInTime`
///
///
/// You can view the valid processor values for a particular instance class by
/// calling the `DescribeOrderableDBInstanceOptions` action and specifying the
/// instance class for the `DBInstanceClass` parameter.
///
/// In addition, you can use the following actions for DB instance class
/// processor information:
///
/// *    `DescribeDBInstances`
///
/// *    `DescribeDBSnapshots`
///
/// *    `DescribeValidDBInstanceModifications`
///
///
/// For more information, see
/// [Configuring the Processor of the DB Instance Class](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.DBInstanceClass.html#USER_ConfigureProcessor)
/// in the _Amazon RDS User Guide._
class ProcessorFeature {
  /// The name of the processor feature. Valid names are `coreCount` and
  /// `threadsPerCore`.
  final String name;

  /// The value of a processor feature name.
  final String value;

  ProcessorFeature({
    this.name,
    this.value,
  });
  static ProcessorFeature fromJson(Map<String, dynamic> json) =>
      ProcessorFeature();
}

class PromoteReadReplicaDBClusterResult {
  final DBCluster dbCluster;

  PromoteReadReplicaDBClusterResult({
    this.dbCluster,
  });
  static PromoteReadReplicaDBClusterResult fromJson(
          Map<String, dynamic> json) =>
      PromoteReadReplicaDBClusterResult();
}

class PromoteReadReplicaResult {
  final DBInstance dbInstance;

  PromoteReadReplicaResult({
    this.dbInstance,
  });
  static PromoteReadReplicaResult fromJson(Map<String, dynamic> json) =>
      PromoteReadReplicaResult();
}

class PurchaseReservedDBInstancesOfferingResult {
  final ReservedDBInstance reservedDBInstance;

  PurchaseReservedDBInstancesOfferingResult({
    this.reservedDBInstance,
  });
  static PurchaseReservedDBInstancesOfferingResult fromJson(
          Map<String, dynamic> json) =>
      PurchaseReservedDBInstancesOfferingResult();
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
  static Range fromJson(Map<String, dynamic> json) => Range();
}

class RebootDBInstanceResult {
  final DBInstance dbInstance;

  RebootDBInstanceResult({
    this.dbInstance,
  });
  static RebootDBInstanceResult fromJson(Map<String, dynamic> json) =>
      RebootDBInstanceResult();
}

///  This data type is used as a response element in the
/// `DescribeReservedDBInstances` and `DescribeReservedDBInstancesOfferings`
/// actions.
class RecurringCharge {
  /// The amount of the recurring charge.
  final double recurringChargeAmount;

  /// The frequency of the recurring charge.
  final String recurringChargeFrequency;

  RecurringCharge({
    this.recurringChargeAmount,
    this.recurringChargeFrequency,
  });
  static RecurringCharge fromJson(Map<String, dynamic> json) =>
      RecurringCharge();
}

class RemoveFromGlobalClusterResult {
  final GlobalCluster globalCluster;

  RemoveFromGlobalClusterResult({
    this.globalCluster,
  });
  static RemoveFromGlobalClusterResult fromJson(Map<String, dynamic> json) =>
      RemoveFromGlobalClusterResult();
}

class RemoveSourceIdentifierFromSubscriptionResult {
  final EventSubscription eventSubscription;

  RemoveSourceIdentifierFromSubscriptionResult({
    this.eventSubscription,
  });
  static RemoveSourceIdentifierFromSubscriptionResult fromJson(
          Map<String, dynamic> json) =>
      RemoveSourceIdentifierFromSubscriptionResult();
}

///  This data type is used as a response element in the
/// `DescribeReservedDBInstances` and `PurchaseReservedDBInstancesOffering`
/// actions.
class ReservedDBInstance {
  /// The unique identifier for the reservation.
  final String reservedDBInstanceId;

  /// The offering identifier.
  final String reservedDBInstancesOfferingId;

  /// The DB instance class for the reserved DB instance.
  final String dbInstanceClass;

  /// The time the reservation started.
  final DateTime startTime;

  /// The duration of the reservation in seconds.
  final int duration;

  /// The fixed price charged for this reserved DB instance.
  final double fixedPrice;

  /// The hourly price charged for this reserved DB instance.
  final double usagePrice;

  /// The currency code for the reserved DB instance.
  final String currencyCode;

  /// The number of reserved DB instances.
  final int dbInstanceCount;

  /// The description of the reserved DB instance.
  final String productDescription;

  /// The offering type of this reserved DB instance.
  final String offeringType;

  /// Indicates if the reservation applies to Multi-AZ deployments.
  final bool multiAZ;

  /// The state of the reserved DB instance.
  final String state;

  /// The recurring price charged to run this reserved DB instance.
  final List<RecurringCharge> recurringCharges;

  /// The Amazon Resource Name (ARN) for the reserved DB instance.
  final String reservedDBInstanceArn;

  ReservedDBInstance({
    this.reservedDBInstanceId,
    this.reservedDBInstancesOfferingId,
    this.dbInstanceClass,
    this.startTime,
    this.duration,
    this.fixedPrice,
    this.usagePrice,
    this.currencyCode,
    this.dbInstanceCount,
    this.productDescription,
    this.offeringType,
    this.multiAZ,
    this.state,
    this.recurringCharges,
    this.reservedDBInstanceArn,
  });
  static ReservedDBInstance fromJson(Map<String, dynamic> json) =>
      ReservedDBInstance();
}

///  Contains the result of a successful invocation of the
/// `DescribeReservedDBInstances` action.
class ReservedDBInstanceMessage {
  ///  An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords`.
  final String marker;

  /// A list of reserved DB instances.
  final List<ReservedDBInstance> reservedDBInstances;

  ReservedDBInstanceMessage({
    this.marker,
    this.reservedDBInstances,
  });
  static ReservedDBInstanceMessage fromJson(Map<String, dynamic> json) =>
      ReservedDBInstanceMessage();
}

///  This data type is used as a response element in the
/// `DescribeReservedDBInstancesOfferings` action.
class ReservedDBInstancesOffering {
  /// The offering identifier.
  final String reservedDBInstancesOfferingId;

  /// The DB instance class for the reserved DB instance.
  final String dbInstanceClass;

  /// The duration of the offering in seconds.
  final int duration;

  /// The fixed price charged for this offering.
  final double fixedPrice;

  /// The hourly price charged for this offering.
  final double usagePrice;

  /// The currency code for the reserved DB instance offering.
  final String currencyCode;

  /// The database engine used by the offering.
  final String productDescription;

  /// The offering type.
  final String offeringType;

  /// Indicates if the offering applies to Multi-AZ deployments.
  final bool multiAZ;

  /// The recurring price charged to run this reserved DB instance.
  final List<RecurringCharge> recurringCharges;

  ReservedDBInstancesOffering({
    this.reservedDBInstancesOfferingId,
    this.dbInstanceClass,
    this.duration,
    this.fixedPrice,
    this.usagePrice,
    this.currencyCode,
    this.productDescription,
    this.offeringType,
    this.multiAZ,
    this.recurringCharges,
  });
  static ReservedDBInstancesOffering fromJson(Map<String, dynamic> json) =>
      ReservedDBInstancesOffering();
}

///  Contains the result of a successful invocation of the
/// `DescribeReservedDBInstancesOfferings` action.
class ReservedDBInstancesOfferingMessage {
  ///  An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords`.
  final String marker;

  /// A list of reserved DB instance offerings.
  final List<ReservedDBInstancesOffering> reservedDBInstancesOfferings;

  ReservedDBInstancesOfferingMessage({
    this.marker,
    this.reservedDBInstancesOfferings,
  });
  static ReservedDBInstancesOfferingMessage fromJson(
          Map<String, dynamic> json) =>
      ReservedDBInstancesOfferingMessage();
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
      ResourcePendingMaintenanceActions();
}

class RestoreDBClusterFromS3Result {
  final DBCluster dbCluster;

  RestoreDBClusterFromS3Result({
    this.dbCluster,
  });
  static RestoreDBClusterFromS3Result fromJson(Map<String, dynamic> json) =>
      RestoreDBClusterFromS3Result();
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

class RestoreDBInstanceFromDBSnapshotResult {
  final DBInstance dbInstance;

  RestoreDBInstanceFromDBSnapshotResult({
    this.dbInstance,
  });
  static RestoreDBInstanceFromDBSnapshotResult fromJson(
          Map<String, dynamic> json) =>
      RestoreDBInstanceFromDBSnapshotResult();
}

class RestoreDBInstanceFromS3Result {
  final DBInstance dbInstance;

  RestoreDBInstanceFromS3Result({
    this.dbInstance,
  });
  static RestoreDBInstanceFromS3Result fromJson(Map<String, dynamic> json) =>
      RestoreDBInstanceFromS3Result();
}

class RestoreDBInstanceToPointInTimeResult {
  final DBInstance dbInstance;

  RestoreDBInstanceToPointInTimeResult({
    this.dbInstance,
  });
  static RestoreDBInstanceToPointInTimeResult fromJson(
          Map<String, dynamic> json) =>
      RestoreDBInstanceToPointInTimeResult();
}

/// Earliest and latest time an instance can be restored to:
class RestoreWindow {
  /// The earliest time you can restore an instance to.
  final DateTime earliestTime;

  /// The latest time you can restore an instance to.
  final DateTime latestTime;

  RestoreWindow({
    this.earliestTime,
    this.latestTime,
  });
  static RestoreWindow fromJson(Map<String, dynamic> json) => RestoreWindow();
}

class RevokeDBSecurityGroupIngressResult {
  final DBSecurityGroup dbSecurityGroup;

  RevokeDBSecurityGroupIngressResult({
    this.dbSecurityGroup,
  });
  static RevokeDBSecurityGroupIngressResult fromJson(
          Map<String, dynamic> json) =>
      RevokeDBSecurityGroupIngressResult();
}

/// Contains the scaling configuration of an Aurora Serverless DB cluster.
///
/// For more information, see
/// [Using Amazon Aurora Serverless](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-serverless.html)
/// in the _Amazon Aurora User Guide_.
class ScalingConfiguration {
  /// The minimum capacity for an Aurora DB cluster in `serverless` DB engine
  /// mode.
  ///
  /// Valid capacity values are `1`, `2`, `4`, `8`, `16`, `32`, `64`, `128`, and
  /// `256`.
  ///
  /// The minimum capacity must be less than or equal to the maximum capacity.
  final int minCapacity;

  /// The maximum capacity for an Aurora DB cluster in `serverless` DB engine
  /// mode.
  ///
  /// Valid capacity values are `1`, `2`, `4`, `8`, `16`, `32`, `64`, `128`, and
  /// `256`.
  ///
  /// The maximum capacity must be greater than or equal to the minimum
  /// capacity.
  final int maxCapacity;

  /// A value that indicates whether to allow or disallow automatic pause for an
  /// Aurora DB cluster in `serverless` DB engine mode. A DB cluster can be
  /// paused only when it's idle (it has no connections).
  ///
  ///
  ///
  /// If a DB cluster is paused for more than seven days, the DB cluster might
  /// be backed up with a snapshot. In this case, the DB cluster is restored
  /// when there is a request to connect to it.
  final bool autoPause;

  /// The time, in seconds, before an Aurora DB cluster in `serverless` mode is
  /// paused.
  final int secondsUntilAutoPause;

  /// The action to take when the timeout is reached, either
  /// `ForceApplyCapacityChange` or `RollbackCapacityChange`.
  ///
  ///  `ForceApplyCapacityChange` sets the capacity to the specified value as
  /// soon as possible.
  ///
  ///  `RollbackCapacityChange`, the default, ignores the capacity change if a
  /// scaling point is not found in the timeout period.
  ///
  ///  If you specify `ForceApplyCapacityChange`, connections that prevent
  /// Aurora Serverless from finding a scaling point might be dropped.
  ///
  /// For more information, see
  /// [Autoscaling for Aurora Serverless](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-serverless.how-it-works.html#aurora-serverless.how-it-works.auto-scaling)
  /// in the _Amazon Aurora User Guide_.
  final String timeoutAction;

  ScalingConfiguration({
    this.minCapacity,
    this.maxCapacity,
    this.autoPause,
    this.secondsUntilAutoPause,
    this.timeoutAction,
  });
}

/// Shows the scaling configuration for an Aurora DB cluster in `serverless` DB
/// engine mode.
///
/// For more information, see
/// [Using Amazon Aurora Serverless](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-serverless.html)
/// in the _Amazon Aurora User Guide_.
class ScalingConfigurationInfo {
  /// The maximum capacity for the Aurora DB cluster in `serverless` DB engine
  /// mode.
  final int minCapacity;

  /// The maximum capacity for an Aurora DB cluster in `serverless` DB engine
  /// mode.
  final int maxCapacity;

  /// A value that indicates whether automatic pause is allowed for the Aurora
  /// DB cluster in `serverless` DB engine mode.
  ///
  /// When the value is set to false for an Aurora Serverless DB cluster, the DB
  /// cluster automatically resumes.
  final bool autoPause;

  /// The remaining amount of time, in seconds, before the Aurora DB cluster in
  /// `serverless` mode is paused. A DB cluster can be paused only when it's
  /// idle (it has no connections).
  final int secondsUntilAutoPause;

  /// The timeout action of a call to `ModifyCurrentDBClusterCapacity`, either
  /// `ForceApplyCapacityChange` or `RollbackCapacityChange`.
  final String timeoutAction;

  ScalingConfigurationInfo({
    this.minCapacity,
    this.maxCapacity,
    this.autoPause,
    this.secondsUntilAutoPause,
    this.timeoutAction,
  });
  static ScalingConfigurationInfo fromJson(Map<String, dynamic> json) =>
      ScalingConfigurationInfo();
}

/// Contains an AWS Region name as the result of a successful call to the
/// `DescribeSourceRegions` action.
class SourceRegion {
  /// The name of the source AWS Region.
  final String regionName;

  /// The endpoint for the source AWS Region endpoint.
  final String endpoint;

  /// The status of the source AWS Region.
  final String status;

  SourceRegion({
    this.regionName,
    this.endpoint,
    this.status,
  });
  static SourceRegion fromJson(Map<String, dynamic> json) => SourceRegion();
}

/// Contains the result of a successful invocation of the
/// `DescribeSourceRegions` action.
class SourceRegionMessage {
  ///  An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords`.
  final String marker;

  /// A list of SourceRegion instances that contains each source AWS Region that
  /// the current AWS Region can get a Read Replica or a DB snapshot from.
  final List<SourceRegion> sourceRegions;

  SourceRegionMessage({
    this.marker,
    this.sourceRegions,
  });
  static SourceRegionMessage fromJson(Map<String, dynamic> json) =>
      SourceRegionMessage();
}

class StartActivityStreamResponse {
  /// The AWS KMS key identifier for encryption of messages in the database
  /// activity stream.
  final String kmsKeyId;

  /// The name of the Amazon Kinesis data stream to be used for the database
  /// activity stream.
  final String kinesisStreamName;

  /// The status of the database activity stream.
  final String status;

  /// The mode of the database activity stream.
  final String mode;

  /// Indicates whether or not the database activity stream will start as soon
  /// as possible, regardless of the maintenance window for the database.
  final bool applyImmediately;

  StartActivityStreamResponse({
    this.kmsKeyId,
    this.kinesisStreamName,
    this.status,
    this.mode,
    this.applyImmediately,
  });
  static StartActivityStreamResponse fromJson(Map<String, dynamic> json) =>
      StartActivityStreamResponse();
}

class StartDBClusterResult {
  final DBCluster dbCluster;

  StartDBClusterResult({
    this.dbCluster,
  });
  static StartDBClusterResult fromJson(Map<String, dynamic> json) =>
      StartDBClusterResult();
}

class StartDBInstanceResult {
  final DBInstance dbInstance;

  StartDBInstanceResult({
    this.dbInstance,
  });
  static StartDBInstanceResult fromJson(Map<String, dynamic> json) =>
      StartDBInstanceResult();
}

class StopActivityStreamResponse {
  /// The AWS KMS key identifier used for encrypting messages in the database
  /// activity stream.
  final String kmsKeyId;

  /// The name of the Amazon Kinesis data stream used for the database activity
  /// stream.
  final String kinesisStreamName;

  /// The status of the database activity stream.
  final String status;

  StopActivityStreamResponse({
    this.kmsKeyId,
    this.kinesisStreamName,
    this.status,
  });
  static StopActivityStreamResponse fromJson(Map<String, dynamic> json) =>
      StopActivityStreamResponse();
}

class StopDBClusterResult {
  final DBCluster dbCluster;

  StopDBClusterResult({
    this.dbCluster,
  });
  static StopDBClusterResult fromJson(Map<String, dynamic> json) =>
      StopDBClusterResult();
}

class StopDBInstanceResult {
  final DBInstance dbInstance;

  StopDBInstanceResult({
    this.dbInstance,
  });
  static StopDBInstanceResult fromJson(Map<String, dynamic> json) =>
      StopDBInstanceResult();
}

///  This data type is used as a response element in the
/// `DescribeDBSubnetGroups` action.
class Subnet {
  /// Specifies the identifier of the subnet.
  final String subnetIdentifier;

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

/// Metadata assigned to an Amazon RDS resource consisting of a key-value pair.
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
  static Tag fromJson(Map<String, dynamic> json) => Tag();
}

class TagListMessage {
  /// List of tags returned by the ListTagsForResource operation.
  final List<Tag> tagList;

  TagListMessage({
    this.tagList,
  });
  static TagListMessage fromJson(Map<String, dynamic> json) => TagListMessage();
}

/// A time zone associated with a `DBInstance` or a `DBSnapshot`. This data type
/// is an element in the response to the `DescribeDBInstances`, the
/// `DescribeDBSnapshots`, and the `DescribeDBEngineVersions` actions.
class Timezone {
  /// The name of the time zone.
  final String timezoneName;

  Timezone({
    this.timezoneName,
  });
  static Timezone fromJson(Map<String, dynamic> json) => Timezone();
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
  /// DB instances that have `AutoMinorVersionUpgrade` set to true.
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

/// Information about valid modifications that you can make to your DB instance.
/// Contains the result of a successful call to the
/// `DescribeValidDBInstanceModifications` action. You can use this information
/// when you call `ModifyDBInstance`.
class ValidDBInstanceModificationsMessage {
  /// Valid storage options for your DB instance.
  final List<ValidStorageOptions> storage;

  /// Valid processor features for your DB instance.
  final List<AvailableProcessorFeature> validProcessorFeatures;

  ValidDBInstanceModificationsMessage({
    this.storage,
    this.validProcessorFeatures,
  });
  static ValidDBInstanceModificationsMessage fromJson(
          Map<String, dynamic> json) =>
      ValidDBInstanceModificationsMessage();
}

/// Information about valid modifications that you can make to your DB instance.
/// Contains the result of a successful call to the
/// `DescribeValidDBInstanceModifications` action.
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

  /// Whether or not Amazon RDS can automatically scale storage for DB instances
  /// that use the new instance class.
  final bool supportsStorageAutoscaling;

  ValidStorageOptions({
    this.storageType,
    this.storageSize,
    this.provisionedIops,
    this.iopsToStorageRatio,
    this.supportsStorageAutoscaling,
  });
  static ValidStorageOptions fromJson(Map<String, dynamic> json) =>
      ValidStorageOptions();
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
      VpcSecurityGroupMembership();
}
