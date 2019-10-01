import 'package:meta/meta.dart';

/// Amazon Redshift
///
///  **Overview**
///
/// This is an interface reference for Amazon Redshift. It contains
/// documentation for one of the programming or command line interfaces you can
/// use to manage Amazon Redshift clusters. Note that Amazon Redshift is
/// asynchronous, which means that some interfaces may require techniques, such
/// as polling or asynchronous callback handlers, to determine when a command
/// has been applied. In this reference, the parameter descriptions indicate
/// whether a change is applied immediately, on the next instance reboot, or
/// during the next maintenance window. For a summary of the Amazon Redshift
/// cluster management interfaces, go to
/// [Using the Amazon Redshift Management Interfaces](https://docs.aws.amazon.com/redshift/latest/mgmt/using-aws-sdk.html).
///
/// Amazon Redshift manages all the work of setting up, operating, and scaling a
/// data warehouse: provisioning capacity, monitoring and backing up the
/// cluster, and applying patches and upgrades to the Amazon Redshift engine.
/// You can focus on using your data to acquire new insights for your business
/// and customers.
///
/// If you are a first-time user of Amazon Redshift, we recommend that you begin
/// by reading the
/// [Amazon Redshift Getting Started Guide](https://docs.aws.amazon.com/redshift/latest/gsg/getting-started.html).
///
/// If you are a database developer, the
/// [Amazon Redshift Database Developer Guide](https://docs.aws.amazon.com/redshift/latest/dg/welcome.html)
/// explains how to design, build, query, and maintain the databases that make
/// up your data warehouse.
class RedshiftApi {
  /// Exchanges a DC1 Reserved Node for a DC2 Reserved Node with no changes to
  /// the configuration (term, payment type, or number of nodes) and no
  /// additional costs.
  ///
  /// [reservedNodeId]: A string representing the node identifier of the DC1
  /// Reserved Node to be exchanged.
  ///
  /// [targetReservedNodeOfferingId]: The unique identifier of the DC2 Reserved
  /// Node offering to be used for the exchange. You can obtain the value for
  /// the parameter by calling GetReservedNodeExchangeOfferings
  Future<AcceptReservedNodeExchangeOutputMessage> acceptReservedNodeExchange(
      {@required String reservedNodeId,
      @required String targetReservedNodeOfferingId}) async {
    return AcceptReservedNodeExchangeOutputMessage.fromJson({});
  }

  /// Adds an inbound (ingress) rule to an Amazon Redshift security group.
  /// Depending on whether the application accessing your cluster is running on
  /// the Internet or an Amazon EC2 instance, you can authorize inbound access
  /// to either a Classless Interdomain Routing (CIDR)/Internet Protocol (IP)
  /// range or to an Amazon EC2 security group. You can add as many as 20
  /// ingress rules to an Amazon Redshift security group.
  ///
  /// If you authorize access to an Amazon EC2 security group, specify
  /// _EC2SecurityGroupName_ and _EC2SecurityGroupOwnerId_. The Amazon EC2
  /// security group and Amazon Redshift cluster must be in the same AWS Region.
  ///
  /// If you authorize access to a CIDR/IP address range, specify _CIDRIP_. For
  /// an overview of CIDR blocks, see the Wikipedia article on
  /// [Classless Inter-Domain Routing](http://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing).
  ///
  /// You must also associate the security group with a cluster so that clients
  /// running on these IP addresses or the EC2 instance are authorized to
  /// connect to the cluster. For information about managing security groups, go
  /// to
  /// [Working with Security Groups](https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-security-groups.html)
  /// in the _Amazon Redshift Cluster Management Guide_.
  ///
  /// [clusterSecurityGroupName]: The name of the security group to which the
  /// ingress rule is added.
  ///
  /// [cidrip]: The IP range to be added the Amazon Redshift security group.
  ///
  /// [ec2SecurityGroupName]: The EC2 security group to be added the Amazon
  /// Redshift security group.
  ///
  /// [ec2SecurityGroupOwnerId]: The AWS account number of the owner of the
  /// security group specified by the _EC2SecurityGroupName_ parameter. The AWS
  /// Access Key ID is not an acceptable value.
  ///
  /// Example: `111122223333`
  Future<AuthorizeClusterSecurityGroupIngressResult>
      authorizeClusterSecurityGroupIngress(String clusterSecurityGroupName,
          {String cidrip,
          String ec2SecurityGroupName,
          String ec2SecurityGroupOwnerId}) async {
    return AuthorizeClusterSecurityGroupIngressResult.fromJson({});
  }

  /// Authorizes the specified AWS customer account to restore the specified
  /// snapshot.
  ///
  ///  For more information about working with snapshots, go to
  /// [Amazon Redshift Snapshots](https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-snapshots.html)
  /// in the _Amazon Redshift Cluster Management Guide_.
  ///
  /// [snapshotIdentifier]: The identifier of the snapshot the account is
  /// authorized to restore.
  ///
  /// [snapshotClusterIdentifier]: The identifier of the cluster the snapshot
  /// was created from. This parameter is required if your IAM user has a policy
  /// containing a snapshot resource element that specifies anything other than
  /// * for the cluster name.
  ///
  /// [accountWithRestoreAccess]: The identifier of the AWS customer account
  /// authorized to restore the specified snapshot.
  ///
  /// To share a snapshot with AWS support, specify amazon-redshift-support.
  Future<AuthorizeSnapshotAccessResult> authorizeSnapshotAccess(
      {@required String snapshotIdentifier,
      String snapshotClusterIdentifier,
      @required String accountWithRestoreAccess}) async {
    return AuthorizeSnapshotAccessResult.fromJson({});
  }

  /// Deletes a set of cluster snapshots.
  ///
  /// [identifiers]: A list of identifiers for the snapshots that you want to
  /// delete.
  Future<BatchDeleteClusterSnapshotsResult> batchDeleteClusterSnapshots(
      List<DeleteClusterSnapshotMessage> identifiers) async {
    return BatchDeleteClusterSnapshotsResult.fromJson({});
  }

  /// Modifies the settings for a list of snapshots.
  ///
  /// [snapshotIdentifierList]: A list of snapshot identifiers you want to
  /// modify.
  ///
  /// [manualSnapshotRetentionPeriod]: The number of days that a manual snapshot
  /// is retained. If you specify the value -1, the manual snapshot is retained
  /// indefinitely.
  ///
  /// The number must be either -1 or an integer between 1 and 3,653.
  ///
  /// If you decrease the manual snapshot retention period from its current
  /// value, existing manual snapshots that fall outside of the new retention
  /// period will return an error. If you want to suppress the errors and delete
  /// the snapshots, use the force option.
  ///
  /// [force]: A boolean value indicating whether to override an exception if
  /// the retention period has passed.
  Future<BatchModifyClusterSnapshotsOutputMessage> batchModifyClusterSnapshots(
      List<String> snapshotIdentifierList,
      {int manualSnapshotRetentionPeriod,
      bool force}) async {
    return BatchModifyClusterSnapshotsOutputMessage.fromJson({});
  }

  /// Cancels a resize operation.
  ///
  /// [clusterIdentifier]: The unique identifier for the cluster that you want
  /// to cancel a resize operation for.
  Future<ResizeProgressMessage> cancelResize(String clusterIdentifier) async {
    return ResizeProgressMessage.fromJson({});
  }

  /// Copies the specified automated cluster snapshot to a new manual cluster
  /// snapshot. The source must be an automated snapshot and it must be in the
  /// available state.
  ///
  /// When you delete a cluster, Amazon Redshift deletes any automated snapshots
  /// of the cluster. Also, when the retention period of the snapshot expires,
  /// Amazon Redshift automatically deletes it. If you want to keep an automated
  /// snapshot for a longer period, you can make a manual copy of the snapshot.
  /// Manual snapshots are retained until you delete them.
  ///
  ///  For more information about working with snapshots, go to
  /// [Amazon Redshift Snapshots](https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-snapshots.html)
  /// in the _Amazon Redshift Cluster Management Guide_.
  ///
  /// [sourceSnapshotIdentifier]: The identifier for the source snapshot.
  ///
  /// Constraints:
  ///
  /// *   Must be the identifier for a valid automated snapshot whose state is
  /// `available`.
  ///
  /// [sourceSnapshotClusterIdentifier]: The identifier of the cluster the
  /// source snapshot was created from. This parameter is required if your IAM
  /// user has a policy containing a snapshot resource element that specifies
  /// anything other than * for the cluster name.
  ///
  /// Constraints:
  ///
  /// *   Must be the identifier for a valid cluster.
  ///
  /// [targetSnapshotIdentifier]: The identifier given to the new manual
  /// snapshot.
  ///
  /// Constraints:
  ///
  /// *   Cannot be null, empty, or blank.
  ///
  /// *   Must contain from 1 to 255 alphanumeric characters or hyphens.
  ///
  /// *   First character must be a letter.
  ///
  /// *   Cannot end with a hyphen or contain two consecutive hyphens.
  ///
  /// *   Must be unique for the AWS account that is making the request.
  ///
  /// [manualSnapshotRetentionPeriod]: The number of days that a manual snapshot
  /// is retained. If the value is -1, the manual snapshot is retained
  /// indefinitely.
  ///
  /// The value must be either -1 or an integer between 1 and 3,653.
  ///
  /// The default value is -1.
  Future<CopyClusterSnapshotResult> copyClusterSnapshot(
      {@required String sourceSnapshotIdentifier,
      String sourceSnapshotClusterIdentifier,
      @required String targetSnapshotIdentifier,
      int manualSnapshotRetentionPeriod}) async {
    return CopyClusterSnapshotResult.fromJson({});
  }

  /// Creates a new cluster.
  ///
  /// To create a cluster in Virtual Private Cloud (VPC), you must provide a
  /// cluster subnet group name. The cluster subnet group identifies the subnets
  /// of your VPC that Amazon Redshift uses when creating the cluster. For more
  /// information about managing clusters, go to
  /// [Amazon Redshift Clusters](https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html)
  /// in the _Amazon Redshift Cluster Management Guide_.
  ///
  /// [dbName]: The name of the first database to be created when the cluster is
  /// created.
  ///
  /// To create additional databases after the cluster is created, connect to
  /// the cluster with a SQL client and use SQL commands to create a database.
  /// For more information, go to
  /// [Create a Database](https://docs.aws.amazon.com/redshift/latest/dg/t_creating_database.html)
  /// in the Amazon Redshift Database Developer Guide.
  ///
  /// Default: `dev`
  ///
  /// Constraints:
  ///
  /// *   Must contain 1 to 64 alphanumeric characters.
  ///
  /// *   Must contain only lowercase letters.
  ///
  /// *   Cannot be a word that is reserved by the service. A list of reserved
  /// words can be found in
  /// [Reserved Words](https://docs.aws.amazon.com/redshift/latest/dg/r_pg_keywords.html)
  /// in the Amazon Redshift Database Developer Guide.
  ///
  /// [clusterIdentifier]: A unique identifier for the cluster. You use this
  /// identifier to refer to the cluster for any subsequent cluster operations
  /// such as deleting or modifying. The identifier also appears in the Amazon
  /// Redshift console.
  ///
  /// Constraints:
  ///
  /// *   Must contain from 1 to 63 alphanumeric characters or hyphens.
  ///
  /// *   Alphabetic characters must be lowercase.
  ///
  /// *   First character must be a letter.
  ///
  /// *   Cannot end with a hyphen or contain two consecutive hyphens.
  ///
  /// *   Must be unique for all clusters within an AWS account.
  ///
  ///
  /// Example: `myexamplecluster`
  ///
  /// [clusterType]: The type of the cluster. When cluster type is specified as
  ///
  /// *    `single-node`, the **NumberOfNodes** parameter is not required.
  ///
  /// *    `multi-node`, the **NumberOfNodes** parameter is required.
  ///
  ///
  /// Valid Values: `multi-node` | `single-node`
  ///
  /// Default: `multi-node`
  ///
  /// [nodeType]: The node type to be provisioned for the cluster. For
  /// information about node types, go to
  /// [Working with Clusters](https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html#how-many-nodes)
  /// in the _Amazon Redshift Cluster Management Guide_.
  ///
  /// Valid Values: `ds2.xlarge` | `ds2.8xlarge` | `ds2.xlarge` | `ds2.8xlarge`
  /// | `dc1.large` | `dc1.8xlarge` | `dc2.large` | `dc2.8xlarge`
  ///
  /// [masterUsername]: The user name associated with the master user account
  /// for the cluster that is being created.
  ///
  /// Constraints:
  ///
  /// *   Must be 1 - 128 alphanumeric characters. The user name can't be
  /// `PUBLIC`.
  ///
  /// *   First character must be a letter.
  ///
  /// *   Cannot be a reserved word. A list of reserved words can be found in
  /// [Reserved Words](https://docs.aws.amazon.com/redshift/latest/dg/r_pg_keywords.html)
  /// in the Amazon Redshift Database Developer Guide.
  ///
  /// [masterUserPassword]: The password associated with the master user account
  /// for the cluster that is being created.
  ///
  /// Constraints:
  ///
  /// *   Must be between 8 and 64 characters in length.
  ///
  /// *   Must contain at least one uppercase letter.
  ///
  /// *   Must contain at least one lowercase letter.
  ///
  /// *   Must contain one number.
  ///
  /// *   Can be any printable ASCII character (ASCII code 33 to 126) except '
  /// (single quote), " (double quote), , /, @, or space.
  ///
  /// [clusterSecurityGroups]: A list of security groups to be associated with
  /// this cluster.
  ///
  /// Default: The default cluster security group for Amazon Redshift.
  ///
  /// [vpcSecurityGroupIds]: A list of Virtual Private Cloud (VPC) security
  /// groups to be associated with the cluster.
  ///
  /// Default: The default VPC security group is associated with the cluster.
  ///
  /// [clusterSubnetGroupName]: The name of a cluster subnet group to be
  /// associated with this cluster.
  ///
  /// If this parameter is not provided the resulting cluster will be deployed
  /// outside virtual private cloud (VPC).
  ///
  /// [availabilityZone]: The EC2 Availability Zone (AZ) in which you want
  /// Amazon Redshift to provision the cluster. For example, if you have several
  /// EC2 instances running in a specific Availability Zone, then you might want
  /// the cluster to be provisioned in the same zone in order to decrease
  /// network latency.
  ///
  /// Default: A random, system-chosen Availability Zone in the region that is
  /// specified by the endpoint.
  ///
  /// Example: `us-east-1d`
  ///
  /// Constraint: The specified Availability Zone must be in the same region as
  /// the current endpoint.
  ///
  /// [preferredMaintenanceWindow]: The weekly time range (in UTC) during which
  /// automated cluster maintenance can occur.
  ///
  ///  Format: `ddd:hh24:mi-ddd:hh24:mi`
  ///
  ///  Default: A 30-minute window selected at random from an 8-hour block of
  /// time per region, occurring on a random day of the week. For more
  /// information about the time blocks for each region, see
  /// [Maintenance Windows](https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html#rs-maintenance-windows)
  /// in Amazon Redshift Cluster Management Guide.
  ///
  /// Valid Days: Mon | Tue | Wed | Thu | Fri | Sat | Sun
  ///
  /// Constraints: Minimum 30-minute window.
  ///
  /// [clusterParameterGroupName]: The name of the parameter group to be
  /// associated with this cluster.
  ///
  /// Default: The default Amazon Redshift cluster parameter group. For
  /// information about the default parameter group, go to
  /// [Working with Amazon Redshift Parameter Groups](https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-parameter-groups.html)
  ///
  /// Constraints:
  ///
  /// *   Must be 1 to 255 alphanumeric characters or hyphens.
  ///
  /// *   First character must be a letter.
  ///
  /// *   Cannot end with a hyphen or contain two consecutive hyphens.
  ///
  /// [automatedSnapshotRetentionPeriod]: The number of days that automated
  /// snapshots are retained. If the value is 0, automated snapshots are
  /// disabled. Even if automated snapshots are disabled, you can still create
  /// manual snapshots when you want with CreateClusterSnapshot.
  ///
  /// Default: `1`
  ///
  /// Constraints: Must be a value from 0 to 35.
  ///
  /// [manualSnapshotRetentionPeriod]: The default number of days to retain a
  /// manual snapshot. If the value is -1, the snapshot is retained
  /// indefinitely. This setting doesn't change the retention period of existing
  /// snapshots.
  ///
  /// The value must be either -1 or an integer between 1 and 3,653.
  ///
  /// [port]: The port number on which the cluster accepts incoming connections.
  ///
  /// The cluster is accessible only via the JDBC and ODBC connection strings.
  /// Part of the connection string requires the port on which the cluster will
  /// listen for incoming connections.
  ///
  /// Default: `5439`
  ///
  /// Valid Values: `1150-65535`
  ///
  /// [clusterVersion]: The version of the Amazon Redshift engine software that
  /// you want to deploy on the cluster.
  ///
  /// The version selected runs on all the nodes in the cluster.
  ///
  /// Constraints: Only version 1.0 is currently available.
  ///
  /// Example: `1.0`
  ///
  /// [allowVersionUpgrade]: If `true`, major version upgrades can be applied
  /// during the maintenance window to the Amazon Redshift engine that is
  /// running on the cluster.
  ///
  /// When a new major version of the Amazon Redshift engine is released, you
  /// can request that the service automatically apply upgrades during the
  /// maintenance window to the Amazon Redshift engine that is running on your
  /// cluster.
  ///
  /// Default: `true`
  ///
  /// [numberOfNodes]: The number of compute nodes in the cluster. This
  /// parameter is required when the **ClusterType** parameter is specified as
  /// `multi-node`.
  ///
  /// For information about determining how many nodes you need, go to
  /// [Working with Clusters](https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html#how-many-nodes)
  /// in the _Amazon Redshift Cluster Management Guide_.
  ///
  /// If you don't specify this parameter, you get a single-node cluster. When
  /// requesting a multi-node cluster, you must specify the number of nodes that
  /// you want in the cluster.
  ///
  /// Default: `1`
  ///
  /// Constraints: Value must be at least 1 and no more than 100.
  ///
  /// [publiclyAccessible]: If `true`, the cluster can be accessed from a public
  /// network.
  ///
  /// [encrypted]: If `true`, the data in the cluster is encrypted at rest.
  ///
  /// Default: false
  ///
  /// [hsmClientCertificateIdentifier]: Specifies the name of the HSM client
  /// certificate the Amazon Redshift cluster uses to retrieve the data
  /// encryption keys stored in an HSM.
  ///
  /// [hsmConfigurationIdentifier]: Specifies the name of the HSM configuration
  /// that contains the information the Amazon Redshift cluster can use to
  /// retrieve and store keys in an HSM.
  ///
  /// [elasticIp]: The Elastic IP (EIP) address for the cluster.
  ///
  /// Constraints: The cluster must be provisioned in EC2-VPC and
  /// publicly-accessible through an Internet gateway. For more information
  /// about provisioning clusters in EC2-VPC, go to
  /// [Supported Platforms to Launch Your Cluster](https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html#cluster-platforms)
  /// in the Amazon Redshift Cluster Management Guide.
  ///
  /// [tags]: A list of tag instances.
  ///
  /// [kmsKeyId]: The AWS Key Management Service (KMS) key ID of the encryption
  /// key that you want to use to encrypt data in the cluster.
  ///
  /// [enhancedVpcRouting]: An option that specifies whether to create the
  /// cluster with enhanced VPC routing enabled. To create a cluster that uses
  /// enhanced VPC routing, the cluster must be in a VPC. For more information,
  /// see
  /// [Enhanced VPC Routing](https://docs.aws.amazon.com/redshift/latest/mgmt/enhanced-vpc-routing.html)
  /// in the Amazon Redshift Cluster Management Guide.
  ///
  /// If this option is `true`, enhanced VPC routing is enabled.
  ///
  /// Default: false
  ///
  /// [additionalInfo]: Reserved.
  ///
  /// [iamRoles]: A list of AWS Identity and Access Management (IAM) roles that
  /// can be used by the cluster to access other AWS services. You must supply
  /// the IAM roles in their Amazon Resource Name (ARN) format. You can supply
  /// up to 10 IAM roles in a single request.
  ///
  /// A cluster can have up to 10 IAM roles associated with it at any time.
  ///
  /// [maintenanceTrackName]: An optional parameter for the name of the
  /// maintenance track for the cluster. If you don't provide a maintenance
  /// track name, the cluster is assigned to the `current` track.
  ///
  /// [snapshotScheduleIdentifier]: A unique identifier for the snapshot
  /// schedule.
  Future<CreateClusterResult> createCluster(
      {String dbName,
      @required String clusterIdentifier,
      String clusterType,
      @required String nodeType,
      @required String masterUsername,
      @required String masterUserPassword,
      List<String> clusterSecurityGroups,
      List<String> vpcSecurityGroupIds,
      String clusterSubnetGroupName,
      String availabilityZone,
      String preferredMaintenanceWindow,
      String clusterParameterGroupName,
      int automatedSnapshotRetentionPeriod,
      int manualSnapshotRetentionPeriod,
      int port,
      String clusterVersion,
      bool allowVersionUpgrade,
      int numberOfNodes,
      bool publiclyAccessible,
      bool encrypted,
      String hsmClientCertificateIdentifier,
      String hsmConfigurationIdentifier,
      String elasticIp,
      List<Tag> tags,
      String kmsKeyId,
      bool enhancedVpcRouting,
      String additionalInfo,
      List<String> iamRoles,
      String maintenanceTrackName,
      String snapshotScheduleIdentifier}) async {
    return CreateClusterResult.fromJson({});
  }

  /// Creates an Amazon Redshift parameter group.
  ///
  /// Creating parameter groups is independent of creating clusters. You can
  /// associate a cluster with a parameter group when you create the cluster.
  /// You can also associate an existing cluster with a parameter group after
  /// the cluster is created by using ModifyCluster.
  ///
  /// Parameters in the parameter group define specific behavior that applies to
  /// the databases you create on the cluster. For more information about
  /// parameters and parameter groups, go to
  /// [Amazon Redshift Parameter Groups](https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-parameter-groups.html)
  /// in the _Amazon Redshift Cluster Management Guide_.
  ///
  /// [parameterGroupName]: The name of the cluster parameter group.
  ///
  /// Constraints:
  ///
  /// *   Must be 1 to 255 alphanumeric characters or hyphens
  ///
  /// *   First character must be a letter.
  ///
  /// *   Cannot end with a hyphen or contain two consecutive hyphens.
  ///
  /// *   Must be unique withing your AWS account.
  ///
  ///
  ///
  ///
  /// This value is stored as a lower-case string.
  ///
  /// [parameterGroupFamily]: The Amazon Redshift engine version to which the
  /// cluster parameter group applies. The cluster engine version determines the
  /// set of parameters.
  ///
  /// To get a list of valid parameter group family names, you can call
  /// DescribeClusterParameterGroups. By default, Amazon Redshift returns a list
  /// of all the parameter groups that are owned by your AWS account, including
  /// the default parameter groups for each Amazon Redshift engine version. The
  /// parameter group family names associated with the default parameter groups
  /// provide you the valid values. For example, a valid family name is
  /// "redshift-1.0".
  ///
  /// [description]: A description of the parameter group.
  ///
  /// [tags]: A list of tag instances.
  Future<CreateClusterParameterGroupResult> createClusterParameterGroup(
      {@required String parameterGroupName,
      @required String parameterGroupFamily,
      @required String description,
      List<Tag> tags}) async {
    return CreateClusterParameterGroupResult.fromJson({});
  }

  /// Creates a new Amazon Redshift security group. You use security groups to
  /// control access to non-VPC clusters.
  ///
  ///  For information about managing security groups, go to
  /// [Amazon Redshift Cluster Security Groups](https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-security-groups.html)
  /// in the _Amazon Redshift Cluster Management Guide_.
  ///
  /// [clusterSecurityGroupName]: The name for the security group. Amazon
  /// Redshift stores the value as a lowercase string.
  ///
  /// Constraints:
  ///
  /// *   Must contain no more than 255 alphanumeric characters or hyphens.
  ///
  /// *   Must not be "Default".
  ///
  /// *   Must be unique for all security groups that are created by your AWS
  /// account.
  ///
  ///
  /// Example: `examplesecuritygroup`
  ///
  /// [description]: A description for the security group.
  ///
  /// [tags]: A list of tag instances.
  Future<CreateClusterSecurityGroupResult> createClusterSecurityGroup(
      {@required String clusterSecurityGroupName,
      @required String description,
      List<Tag> tags}) async {
    return CreateClusterSecurityGroupResult.fromJson({});
  }

  /// Creates a manual snapshot of the specified cluster. The cluster must be in
  /// the `available` state.
  ///
  ///  For more information about working with snapshots, go to
  /// [Amazon Redshift Snapshots](https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-snapshots.html)
  /// in the _Amazon Redshift Cluster Management Guide_.
  ///
  /// [snapshotIdentifier]: A unique identifier for the snapshot that you are
  /// requesting. This identifier must be unique for all snapshots within the
  /// AWS account.
  ///
  /// Constraints:
  ///
  /// *   Cannot be null, empty, or blank
  ///
  /// *   Must contain from 1 to 255 alphanumeric characters or hyphens
  ///
  /// *   First character must be a letter
  ///
  /// *   Cannot end with a hyphen or contain two consecutive hyphens
  ///
  ///
  /// Example: `my-snapshot-id`
  ///
  /// [clusterIdentifier]: The cluster identifier for which you want a snapshot.
  ///
  /// [manualSnapshotRetentionPeriod]: The number of days that a manual snapshot
  /// is retained. If the value is -1, the manual snapshot is retained
  /// indefinitely.
  ///
  /// The value must be either -1 or an integer between 1 and 3,653.
  ///
  /// The default value is -1.
  ///
  /// [tags]: A list of tag instances.
  Future<CreateClusterSnapshotResult> createClusterSnapshot(
      {@required String snapshotIdentifier,
      @required String clusterIdentifier,
      int manualSnapshotRetentionPeriod,
      List<Tag> tags}) async {
    return CreateClusterSnapshotResult.fromJson({});
  }

  /// Creates a new Amazon Redshift subnet group. You must provide a list of one
  /// or more subnets in your existing Amazon Virtual Private Cloud (Amazon VPC)
  /// when creating Amazon Redshift subnet group.
  ///
  ///  For information about subnet groups, go to
  /// [Amazon Redshift Cluster Subnet Groups](https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-cluster-subnet-groups.html)
  /// in the _Amazon Redshift Cluster Management Guide_.
  ///
  /// [clusterSubnetGroupName]: The name for the subnet group. Amazon Redshift
  /// stores the value as a lowercase string.
  ///
  /// Constraints:
  ///
  /// *   Must contain no more than 255 alphanumeric characters or hyphens.
  ///
  /// *   Must not be "Default".
  ///
  /// *   Must be unique for all subnet groups that are created by your AWS
  /// account.
  ///
  ///
  /// Example: `examplesubnetgroup`
  ///
  /// [description]: A description for the subnet group.
  ///
  /// [subnetIds]: An array of VPC subnet IDs. A maximum of 20 subnets can be
  /// modified in a single request.
  ///
  /// [tags]: A list of tag instances.
  Future<CreateClusterSubnetGroupResult> createClusterSubnetGroup(
      {@required String clusterSubnetGroupName,
      @required String description,
      @required List<String> subnetIds,
      List<Tag> tags}) async {
    return CreateClusterSubnetGroupResult.fromJson({});
  }

  /// Creates an Amazon Redshift event notification subscription. This action
  /// requires an ARN (Amazon Resource Name) of an Amazon SNS topic created by
  /// either the Amazon Redshift console, the Amazon SNS console, or the Amazon
  /// SNS API. To obtain an ARN with Amazon SNS, you must create a topic in
  /// Amazon SNS and subscribe to the topic. The ARN is displayed in the SNS
  /// console.
  ///
  /// You can specify the source type, and lists of Amazon Redshift source IDs,
  /// event categories, and event severities. Notifications will be sent for all
  /// events you want that match those criteria. For example, you can specify
  /// source type = cluster, source ID = my-cluster-1 and mycluster2, event
  /// categories = Availability, Backup, and severity = ERROR. The subscription
  /// will only send notifications for those ERROR events in the Availability
  /// and Backup categories for the specified clusters.
  ///
  /// If you specify both the source type and source IDs, such as source type =
  /// cluster and source identifier = my-cluster-1, notifications will be sent
  /// for all the cluster events for my-cluster-1. If you specify a source type
  /// but do not specify a source identifier, you will receive notice of the
  /// events for the objects of that type in your AWS account. If you do not
  /// specify either the SourceType nor the SourceIdentifier, you will be
  /// notified of events generated from all Amazon Redshift sources belonging to
  /// your AWS account. You must specify a source type if you specify a source
  /// ID.
  ///
  /// [subscriptionName]: The name of the event subscription to be created.
  ///
  /// Constraints:
  ///
  /// *   Cannot be null, empty, or blank.
  ///
  /// *   Must contain from 1 to 255 alphanumeric characters or hyphens.
  ///
  /// *   First character must be a letter.
  ///
  /// *   Cannot end with a hyphen or contain two consecutive hyphens.
  ///
  /// [snsTopicArn]: The Amazon Resource Name (ARN) of the Amazon SNS topic used
  /// to transmit the event notifications. The ARN is created by Amazon SNS when
  /// you create a topic and subscribe to it.
  ///
  /// [sourceType]: The type of source that will be generating the events. For
  /// example, if you want to be notified of events generated by a cluster, you
  /// would set this parameter to cluster. If this value is not specified,
  /// events are returned for all Amazon Redshift objects in your AWS account.
  /// You must specify a source type in order to specify source IDs.
  ///
  /// Valid values: cluster, cluster-parameter-group, cluster-security-group,
  /// and cluster-snapshot.
  ///
  /// [sourceIds]: A list of one or more identifiers of Amazon Redshift source
  /// objects. All of the objects must be of the same type as was specified in
  /// the source type parameter. The event subscription will return only events
  /// generated by the specified objects. If not specified, then events are
  /// returned for all objects within the source type specified.
  ///
  /// Example: my-cluster-1, my-cluster-2
  ///
  /// Example: my-snapshot-20131010
  ///
  /// [eventCategories]: Specifies the Amazon Redshift event categories to be
  /// published by the event notification subscription.
  ///
  /// Values: configuration, management, monitoring, security
  ///
  /// [severity]: Specifies the Amazon Redshift event severity to be published
  /// by the event notification subscription.
  ///
  /// Values: ERROR, INFO
  ///
  /// [enabled]: A boolean value; set to `true` to activate the subscription,
  /// and set to `false` to create the subscription but not activate it.
  ///
  /// [tags]: A list of tag instances.
  Future<CreateEventSubscriptionResult> createEventSubscription(
      {@required String subscriptionName,
      @required String snsTopicArn,
      String sourceType,
      List<String> sourceIds,
      List<String> eventCategories,
      String severity,
      bool enabled,
      List<Tag> tags}) async {
    return CreateEventSubscriptionResult.fromJson({});
  }

  /// Creates an HSM client certificate that an Amazon Redshift cluster will use
  /// to connect to the client's HSM in order to store and retrieve the keys
  /// used to encrypt the cluster databases.
  ///
  /// The command returns a public key, which you must store in the HSM. In
  /// addition to creating the HSM certificate, you must create an Amazon
  /// Redshift HSM configuration that provides a cluster the information needed
  /// to store and use encryption keys in the HSM. For more information, go to
  /// [Hardware Security Modules](https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-HSM.html)
  /// in the Amazon Redshift Cluster Management Guide.
  ///
  /// [hsmClientCertificateIdentifier]: The identifier to be assigned to the new
  /// HSM client certificate that the cluster will use to connect to the HSM to
  /// use the database encryption keys.
  ///
  /// [tags]: A list of tag instances.
  Future<CreateHsmClientCertificateResult> createHsmClientCertificate(
      String hsmClientCertificateIdentifier,
      {List<Tag> tags}) async {
    return CreateHsmClientCertificateResult.fromJson({});
  }

  /// Creates an HSM configuration that contains the information required by an
  /// Amazon Redshift cluster to store and use database encryption keys in a
  /// Hardware Security Module (HSM). After creating the HSM configuration, you
  /// can specify it as a parameter when creating a cluster. The cluster will
  /// then store its encryption keys in the HSM.
  ///
  /// In addition to creating an HSM configuration, you must also create an HSM
  /// client certificate. For more information, go to
  /// [Hardware Security Modules](https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-HSM.html)
  /// in the Amazon Redshift Cluster Management Guide.
  ///
  /// [hsmConfigurationIdentifier]: The identifier to be assigned to the new
  /// Amazon Redshift HSM configuration.
  ///
  /// [description]: A text description of the HSM configuration to be created.
  ///
  /// [hsmIpAddress]: The IP address that the Amazon Redshift cluster must use
  /// to access the HSM.
  ///
  /// [hsmPartitionName]: The name of the partition in the HSM where the Amazon
  /// Redshift clusters will store their database encryption keys.
  ///
  /// [hsmPartitionPassword]: The password required to access the HSM partition.
  ///
  /// [hsmServerPublicCertificate]: The HSMs public certificate file. When using
  /// Cloud HSM, the file name is server.pem.
  ///
  /// [tags]: A list of tag instances.
  Future<CreateHsmConfigurationResult> createHsmConfiguration(
      {@required String hsmConfigurationIdentifier,
      @required String description,
      @required String hsmIpAddress,
      @required String hsmPartitionName,
      @required String hsmPartitionPassword,
      @required String hsmServerPublicCertificate,
      List<Tag> tags}) async {
    return CreateHsmConfigurationResult.fromJson({});
  }

  /// Creates a snapshot copy grant that permits Amazon Redshift to use a
  /// customer master key (CMK) from AWS Key Management Service (AWS KMS) to
  /// encrypt copied snapshots in a destination region.
  ///
  ///  For more information about managing snapshot copy grants, go to
  /// [Amazon Redshift Database Encryption](https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-db-encryption.html)
  /// in the _Amazon Redshift Cluster Management Guide_.
  ///
  /// [snapshotCopyGrantName]: The name of the snapshot copy grant. This name
  /// must be unique in the region for the AWS account.
  ///
  /// Constraints:
  ///
  /// *   Must contain from 1 to 63 alphanumeric characters or hyphens.
  ///
  /// *   Alphabetic characters must be lowercase.
  ///
  /// *   First character must be a letter.
  ///
  /// *   Cannot end with a hyphen or contain two consecutive hyphens.
  ///
  /// *   Must be unique for all clusters within an AWS account.
  ///
  /// [kmsKeyId]: The unique identifier of the customer master key (CMK) to
  /// which to grant Amazon Redshift permission. If no key is specified, the
  /// default key is used.
  ///
  /// [tags]: A list of tag instances.
  Future<CreateSnapshotCopyGrantResult> createSnapshotCopyGrant(
      String snapshotCopyGrantName,
      {String kmsKeyId,
      List<Tag> tags}) async {
    return CreateSnapshotCopyGrantResult.fromJson({});
  }

  /// Creates a new snapshot schedule.
  ///
  /// [scheduleDefinitions]: The definition of the snapshot schedule. The
  /// definition is made up of schedule expressions, for example "cron(30 12 *)"
  /// or "rate(12 hours)".
  ///
  /// [scheduleIdentifier]: A unique identifier for a snapshot schedule. Only
  /// alphanumeric characters are allowed for the identifier.
  ///
  /// [scheduleDescription]: The description of the snapshot schedule.
  ///
  /// [tags]: An optional set of tags you can use to search for the schedule.
  ///
  /// [dryRun]:
  ///
  /// [nextInvocations]:
  Future<SnapshotSchedule> createSnapshotSchedule(
      {List<String> scheduleDefinitions,
      String scheduleIdentifier,
      String scheduleDescription,
      List<Tag> tags,
      bool dryRun,
      int nextInvocations}) async {
    return SnapshotSchedule.fromJson({});
  }

  /// Adds one or more tags to a specified resource.
  ///
  /// A resource can have up to 50 tags. If you try to create more than 50 tags
  /// for a resource, you will receive an error and the attempt will fail.
  ///
  /// If you specify a key that already exists for the resource, the value for
  /// that key will be updated with the new value.
  ///
  /// [resourceName]: The Amazon Resource Name (ARN) to which you want to add
  /// the tag or tags. For example,
  /// `arn:aws:redshift:us-east-1:123456789:cluster:t1`.
  ///
  /// [tags]: One or more name/value pairs to add as tags to the specified
  /// resource. Each tag name is passed in with the parameter `Key` and the
  /// corresponding value is passed in with the parameter `Value`. The `Key` and
  /// `Value` parameters are separated by a comma (,). Separate multiple tags
  /// with a space. For example, `--tags "Key"="owner","Value"="admin"
  /// "Key"="environment","Value"="test" "Key"="version","Value"="1.0"`.
  Future<void> createTags(
      {@required String resourceName, @required List<Tag> tags}) async {}

  /// Deletes a previously provisioned cluster. A successful response from the
  /// web service indicates that the request was received correctly. Use
  /// DescribeClusters to monitor the status of the deletion. The delete
  /// operation cannot be canceled or reverted once submitted. For more
  /// information about managing clusters, go to
  /// [Amazon Redshift Clusters](https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html)
  /// in the _Amazon Redshift Cluster Management Guide_.
  ///
  /// If you want to shut down the cluster and retain it for future use, set
  /// _SkipFinalClusterSnapshot_ to `false` and specify a name for
  /// _FinalClusterSnapshotIdentifier_. You can later restore this snapshot to
  /// resume using the cluster. If a final cluster snapshot is requested, the
  /// status of the cluster will be "final-snapshot" while the snapshot is being
  /// taken, then it's "deleting" once Amazon Redshift begins deleting the
  /// cluster.
  ///
  ///  For more information about managing clusters, go to
  /// [Amazon Redshift Clusters](https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html)
  /// in the _Amazon Redshift Cluster Management Guide_.
  ///
  /// [clusterIdentifier]: The identifier of the cluster to be deleted.
  ///
  /// Constraints:
  ///
  /// *   Must contain lowercase characters.
  ///
  /// *   Must contain from 1 to 63 alphanumeric characters or hyphens.
  ///
  /// *   First character must be a letter.
  ///
  /// *   Cannot end with a hyphen or contain two consecutive hyphens.
  ///
  /// [skipFinalClusterSnapshot]: Determines whether a final snapshot of the
  /// cluster is created before Amazon Redshift deletes the cluster. If `true`,
  /// a final cluster snapshot is not created. If `false`, a final cluster
  /// snapshot is created before the cluster is deleted.
  ///
  ///  The _FinalClusterSnapshotIdentifier_ parameter must be specified if
  /// _SkipFinalClusterSnapshot_ is `false`.
  ///
  /// Default: `false`
  ///
  /// [finalClusterSnapshotIdentifier]: The identifier of the final snapshot
  /// that is to be created immediately before deleting the cluster. If this
  /// parameter is provided, _SkipFinalClusterSnapshot_ must be `false`.
  ///
  /// Constraints:
  ///
  /// *   Must be 1 to 255 alphanumeric characters.
  ///
  /// *   First character must be a letter.
  ///
  /// *   Cannot end with a hyphen or contain two consecutive hyphens.
  ///
  /// [finalClusterSnapshotRetentionPeriod]: The number of days that a manual
  /// snapshot is retained. If the value is -1, the manual snapshot is retained
  /// indefinitely.
  ///
  /// The value must be either -1 or an integer between 1 and 3,653.
  ///
  /// The default value is -1.
  Future<DeleteClusterResult> deleteCluster(String clusterIdentifier,
      {bool skipFinalClusterSnapshot,
      String finalClusterSnapshotIdentifier,
      int finalClusterSnapshotRetentionPeriod}) async {
    return DeleteClusterResult.fromJson({});
  }

  /// Deletes a specified Amazon Redshift parameter group.
  ///
  ///
  ///
  /// You cannot delete a parameter group if it is associated with a cluster.
  ///
  /// [parameterGroupName]: The name of the parameter group to be deleted.
  ///
  /// Constraints:
  ///
  /// *   Must be the name of an existing cluster parameter group.
  ///
  /// *   Cannot delete a default cluster parameter group.
  Future<void> deleteClusterParameterGroup(String parameterGroupName) async {}

  /// Deletes an Amazon Redshift security group.
  ///
  ///  You cannot delete a security group that is associated with any clusters.
  /// You cannot delete the default security group.
  ///
  ///  For information about managing security groups, go to
  /// [Amazon Redshift Cluster Security Groups](https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-security-groups.html)
  /// in the _Amazon Redshift Cluster Management Guide_.
  ///
  /// [clusterSecurityGroupName]: The name of the cluster security group to be
  /// deleted.
  Future<void> deleteClusterSecurityGroup(
      String clusterSecurityGroupName) async {}

  /// Deletes the specified manual snapshot. The snapshot must be in the
  /// `available` state, with no other users authorized to access the snapshot.
  ///
  /// Unlike automated snapshots, manual snapshots are retained even after you
  /// delete your cluster. Amazon Redshift does not delete your manual
  /// snapshots. You must delete manual snapshot explicitly to avoid getting
  /// charged. If other accounts are authorized to access the snapshot, you must
  /// revoke all of the authorizations before you can delete the snapshot.
  ///
  /// [snapshotIdentifier]: The unique identifier of the manual snapshot to be
  /// deleted.
  ///
  /// Constraints: Must be the name of an existing snapshot that is in the
  /// `available`, `failed`, or `cancelled` state.
  ///
  /// [snapshotClusterIdentifier]: The unique identifier of the cluster the
  /// snapshot was created from. This parameter is required if your IAM user has
  /// a policy containing a snapshot resource element that specifies anything
  /// other than * for the cluster name.
  ///
  /// Constraints: Must be the name of valid cluster.
  Future<DeleteClusterSnapshotResult> deleteClusterSnapshot(
      String snapshotIdentifier,
      {String snapshotClusterIdentifier}) async {
    return DeleteClusterSnapshotResult.fromJson({});
  }

  /// Deletes the specified cluster subnet group.
  ///
  /// [clusterSubnetGroupName]: The name of the cluster subnet group name to be
  /// deleted.
  Future<void> deleteClusterSubnetGroup(String clusterSubnetGroupName) async {}

  /// Deletes an Amazon Redshift event notification subscription.
  ///
  /// [subscriptionName]: The name of the Amazon Redshift event notification
  /// subscription to be deleted.
  Future<void> deleteEventSubscription(String subscriptionName) async {}

  /// Deletes the specified HSM client certificate.
  ///
  /// [hsmClientCertificateIdentifier]: The identifier of the HSM client
  /// certificate to be deleted.
  Future<void> deleteHsmClientCertificate(
      String hsmClientCertificateIdentifier) async {}

  /// Deletes the specified Amazon Redshift HSM configuration.
  ///
  /// [hsmConfigurationIdentifier]: The identifier of the Amazon Redshift HSM
  /// configuration to be deleted.
  Future<void> deleteHsmConfiguration(
      String hsmConfigurationIdentifier) async {}

  /// Deletes the specified snapshot copy grant.
  ///
  /// [snapshotCopyGrantName]: The name of the snapshot copy grant to delete.
  Future<void> deleteSnapshotCopyGrant(String snapshotCopyGrantName) async {}

  /// Deletes a snapshot schedule.
  ///
  /// [scheduleIdentifier]: A unique identifier of the snapshot schedule to
  /// delete.
  Future<void> deleteSnapshotSchedule(String scheduleIdentifier) async {}

  /// Deletes a tag or tags from a resource. You must provide the ARN of the
  /// resource from which you want to delete the tag or tags.
  ///
  /// [resourceName]: The Amazon Resource Name (ARN) from which you want to
  /// remove the tag or tags. For example,
  /// `arn:aws:redshift:us-east-1:123456789:cluster:t1`.
  ///
  /// [tagKeys]: The tag key that you want to delete.
  Future<void> deleteTags(
      {@required String resourceName, @required List<String> tagKeys}) async {}

  /// Returns a list of attributes attached to an account
  ///
  /// [attributeNames]: A list of attribute names.
  Future<AccountAttributeList> describeAccountAttributes(
      {List<String> attributeNames}) async {
    return AccountAttributeList.fromJson({});
  }

  /// Returns an array of `ClusterDbRevision` objects.
  ///
  /// [clusterIdentifier]: A unique identifier for a cluster whose
  /// `ClusterDbRevisions` you are requesting. This parameter is case sensitive.
  /// All clusters defined for an account are returned by default.
  ///
  /// [maxRecords]: The maximum number of response records to return in each
  /// call. If the number of remaining response records exceeds the specified
  /// MaxRecords value, a value is returned in the `marker` field of the
  /// response. You can retrieve the next set of response records by providing
  /// the returned `marker` value in the `marker` parameter and retrying the
  /// request.
  ///
  /// Default: 100
  ///
  /// Constraints: minimum 20, maximum 100.
  ///
  /// [marker]: An optional parameter that specifies the starting point for
  /// returning a set of response records. When the results of a
  /// `DescribeClusterDbRevisions` request exceed the value specified in
  /// `MaxRecords`, Amazon Redshift returns a value in the `marker` field of the
  /// response. You can retrieve the next set of response records by providing
  /// the returned `marker` value in the `marker` parameter and retrying the
  /// request.
  ///
  /// Constraints: You can specify either the `ClusterIdentifier` parameter, or
  /// the `marker` parameter, but not both.
  Future<ClusterDbRevisionsMessage> describeClusterDbRevisions(
      {String clusterIdentifier, int maxRecords, String marker}) async {
    return ClusterDbRevisionsMessage.fromJson({});
  }

  /// Returns a list of Amazon Redshift parameter groups, including parameter
  /// groups you created and the default parameter group. For each parameter
  /// group, the response includes the parameter group name, description, and
  /// parameter group family name. You can optionally specify a name to retrieve
  /// the description of a specific parameter group.
  ///
  ///  For more information about parameters and parameter groups, go to
  /// [Amazon Redshift Parameter Groups](https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-parameter-groups.html)
  /// in the _Amazon Redshift Cluster Management Guide_.
  ///
  /// If you specify both tag keys and tag values in the same request, Amazon
  /// Redshift returns all parameter groups that match any combination of the
  /// specified keys and values. For example, if you have `owner` and
  /// `environment` for tag keys, and `admin` and `test` for tag values, all
  /// parameter groups that have any combination of those values are returned.
  ///
  /// If both tag keys and values are omitted from the request, parameter groups
  /// are returned regardless of whether they have tag keys or values associated
  /// with them.
  ///
  /// [parameterGroupName]: The name of a specific parameter group for which to
  /// return details. By default, details about all parameter groups and the
  /// default parameter group are returned.
  ///
  /// [maxRecords]: The maximum number of response records to return in each
  /// call. If the number of remaining response records exceeds the specified
  /// `MaxRecords` value, a value is returned in a `marker` field of the
  /// response. You can retrieve the next set of records by retrying the command
  /// with the returned marker value.
  ///
  /// Default: `100`
  ///
  /// Constraints: minimum 20, maximum 100.
  ///
  /// [marker]: An optional parameter that specifies the starting point to
  /// return a set of response records. When the results of a
  /// DescribeClusterParameterGroups request exceed the value specified in
  /// `MaxRecords`, AWS returns a value in the `Marker` field of the response.
  /// You can retrieve the next set of response records by providing the
  /// returned marker value in the `Marker` parameter and retrying the request.
  ///
  /// [tagKeys]: A tag key or keys for which you want to return all matching
  /// cluster parameter groups that are associated with the specified key or
  /// keys. For example, suppose that you have parameter groups that are tagged
  /// with keys called `owner` and `environment`. If you specify both of these
  /// tag keys in the request, Amazon Redshift returns a response with the
  /// parameter groups that have either or both of these tag keys associated
  /// with them.
  ///
  /// [tagValues]: A tag value or values for which you want to return all
  /// matching cluster parameter groups that are associated with the specified
  /// tag value or values. For example, suppose that you have parameter groups
  /// that are tagged with values called `admin` and `test`. If you specify both
  /// of these tag values in the request, Amazon Redshift returns a response
  /// with the parameter groups that have either or both of these tag values
  /// associated with them.
  Future<ClusterParameterGroupsMessage> describeClusterParameterGroups(
      {String parameterGroupName,
      int maxRecords,
      String marker,
      List<String> tagKeys,
      List<String> tagValues}) async {
    return ClusterParameterGroupsMessage.fromJson({});
  }

  /// Returns a detailed list of parameters contained within the specified
  /// Amazon Redshift parameter group. For each parameter the response includes
  /// information such as parameter name, description, data type, value, whether
  /// the parameter value is modifiable, and so on.
  ///
  /// You can specify _source_ filter to retrieve parameters of only specific
  /// type. For example, to retrieve parameters that were modified by a user
  /// action such as from ModifyClusterParameterGroup, you can specify _source_
  /// equal to _user_.
  ///
  ///  For more information about parameters and parameter groups, go to
  /// [Amazon Redshift Parameter Groups](https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-parameter-groups.html)
  /// in the _Amazon Redshift Cluster Management Guide_.
  ///
  /// [parameterGroupName]: The name of a cluster parameter group for which to
  /// return details.
  ///
  /// [source]: The parameter types to return. Specify `user` to show parameters
  /// that are different form the default. Similarly, specify `engine-default`
  /// to show parameters that are the same as the default parameter group.
  ///
  /// Default: All parameter types returned.
  ///
  /// Valid Values: `user` | `engine-default`
  ///
  /// [maxRecords]: The maximum number of response records to return in each
  /// call. If the number of remaining response records exceeds the specified
  /// `MaxRecords` value, a value is returned in a `marker` field of the
  /// response. You can retrieve the next set of records by retrying the command
  /// with the returned marker value.
  ///
  /// Default: `100`
  ///
  /// Constraints: minimum 20, maximum 100.
  ///
  /// [marker]: An optional parameter that specifies the starting point to
  /// return a set of response records. When the results of a
  /// DescribeClusterParameters request exceed the value specified in
  /// `MaxRecords`, AWS returns a value in the `Marker` field of the response.
  /// You can retrieve the next set of response records by providing the
  /// returned marker value in the `Marker` parameter and retrying the request.
  Future<ClusterParameterGroupDetails> describeClusterParameters(
      String parameterGroupName,
      {String source,
      int maxRecords,
      String marker}) async {
    return ClusterParameterGroupDetails.fromJson({});
  }

  /// Returns information about Amazon Redshift security groups. If the name of
  /// a security group is specified, the response will contain only information
  /// about only that security group.
  ///
  ///  For information about managing security groups, go to
  /// [Amazon Redshift Cluster Security Groups](https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-security-groups.html)
  /// in the _Amazon Redshift Cluster Management Guide_.
  ///
  /// If you specify both tag keys and tag values in the same request, Amazon
  /// Redshift returns all security groups that match any combination of the
  /// specified keys and values. For example, if you have `owner` and
  /// `environment` for tag keys, and `admin` and `test` for tag values, all
  /// security groups that have any combination of those values are returned.
  ///
  /// If both tag keys and values are omitted from the request, security groups
  /// are returned regardless of whether they have tag keys or values associated
  /// with them.
  ///
  /// [clusterSecurityGroupName]: The name of a cluster security group for which
  /// you are requesting details. You can specify either the **Marker**
  /// parameter or a **ClusterSecurityGroupName** parameter, but not both.
  ///
  ///  Example: `securitygroup1`
  ///
  /// [maxRecords]: The maximum number of response records to return in each
  /// call. If the number of remaining response records exceeds the specified
  /// `MaxRecords` value, a value is returned in a `marker` field of the
  /// response. You can retrieve the next set of records by retrying the command
  /// with the returned marker value.
  ///
  /// Default: `100`
  ///
  /// Constraints: minimum 20, maximum 100.
  ///
  /// [marker]: An optional parameter that specifies the starting point to
  /// return a set of response records. When the results of a
  /// DescribeClusterSecurityGroups request exceed the value specified in
  /// `MaxRecords`, AWS returns a value in the `Marker` field of the response.
  /// You can retrieve the next set of response records by providing the
  /// returned marker value in the `Marker` parameter and retrying the request.
  ///
  /// Constraints: You can specify either the **ClusterSecurityGroupName**
  /// parameter or the **Marker** parameter, but not both.
  ///
  /// [tagKeys]: A tag key or keys for which you want to return all matching
  /// cluster security groups that are associated with the specified key or
  /// keys. For example, suppose that you have security groups that are tagged
  /// with keys called `owner` and `environment`. If you specify both of these
  /// tag keys in the request, Amazon Redshift returns a response with the
  /// security groups that have either or both of these tag keys associated with
  /// them.
  ///
  /// [tagValues]: A tag value or values for which you want to return all
  /// matching cluster security groups that are associated with the specified
  /// tag value or values. For example, suppose that you have security groups
  /// that are tagged with values called `admin` and `test`. If you specify both
  /// of these tag values in the request, Amazon Redshift returns a response
  /// with the security groups that have either or both of these tag values
  /// associated with them.
  Future<ClusterSecurityGroupMessage> describeClusterSecurityGroups(
      {String clusterSecurityGroupName,
      int maxRecords,
      String marker,
      List<String> tagKeys,
      List<String> tagValues}) async {
    return ClusterSecurityGroupMessage.fromJson({});
  }

  /// Returns one or more snapshot objects, which contain metadata about your
  /// cluster snapshots. By default, this operation returns information about
  /// all snapshots of all clusters that are owned by you AWS customer account.
  /// No information is returned for snapshots owned by inactive AWS customer
  /// accounts.
  ///
  /// If you specify both tag keys and tag values in the same request, Amazon
  /// Redshift returns all snapshots that match any combination of the specified
  /// keys and values. For example, if you have `owner` and `environment` for
  /// tag keys, and `admin` and `test` for tag values, all snapshots that have
  /// any combination of those values are returned. Only snapshots that you own
  /// are returned in the response; shared snapshots are not returned with the
  /// tag key and tag value request parameters.
  ///
  /// If both tag keys and values are omitted from the request, snapshots are
  /// returned regardless of whether they have tag keys or values associated
  /// with them.
  ///
  /// [clusterIdentifier]: The identifier of the cluster which generated the
  /// requested snapshots.
  ///
  /// [snapshotIdentifier]: The snapshot identifier of the snapshot about which
  /// to return information.
  ///
  /// [snapshotType]: The type of snapshots for which you are requesting
  /// information. By default, snapshots of all types are returned.
  ///
  /// Valid Values: `automated` | `manual`
  ///
  /// [startTime]: A value that requests only snapshots created at or after the
  /// specified time. The time value is specified in ISO 8601 format. For more
  /// information about ISO 8601, go to the
  /// [ISO8601 Wikipedia page.](http://en.wikipedia.org/wiki/ISO_8601)
  ///
  /// Example: `2012-07-16T18:00:00Z`
  ///
  /// [endTime]: A time value that requests only snapshots created at or before
  /// the specified time. The time value is specified in ISO 8601 format. For
  /// more information about ISO 8601, go to the
  /// [ISO8601 Wikipedia page.](http://en.wikipedia.org/wiki/ISO_8601)
  ///
  /// Example: `2012-07-16T18:00:00Z`
  ///
  /// [maxRecords]: The maximum number of response records to return in each
  /// call. If the number of remaining response records exceeds the specified
  /// `MaxRecords` value, a value is returned in a `marker` field of the
  /// response. You can retrieve the next set of records by retrying the command
  /// with the returned marker value.
  ///
  /// Default: `100`
  ///
  /// Constraints: minimum 20, maximum 100.
  ///
  /// [marker]: An optional parameter that specifies the starting point to
  /// return a set of response records. When the results of a
  /// DescribeClusterSnapshots request exceed the value specified in
  /// `MaxRecords`, AWS returns a value in the `Marker` field of the response.
  /// You can retrieve the next set of response records by providing the
  /// returned marker value in the `Marker` parameter and retrying the request.
  ///
  /// [ownerAccount]: The AWS customer account used to create or copy the
  /// snapshot. Use this field to filter the results to snapshots owned by a
  /// particular account. To describe snapshots you own, either specify your AWS
  /// customer account, or do not specify the parameter.
  ///
  /// [tagKeys]: A tag key or keys for which you want to return all matching
  /// cluster snapshots that are associated with the specified key or keys. For
  /// example, suppose that you have snapshots that are tagged with keys called
  /// `owner` and `environment`. If you specify both of these tag keys in the
  /// request, Amazon Redshift returns a response with the snapshots that have
  /// either or both of these tag keys associated with them.
  ///
  /// [tagValues]: A tag value or values for which you want to return all
  /// matching cluster snapshots that are associated with the specified tag
  /// value or values. For example, suppose that you have snapshots that are
  /// tagged with values called `admin` and `test`. If you specify both of these
  /// tag values in the request, Amazon Redshift returns a response with the
  /// snapshots that have either or both of these tag values associated with
  /// them.
  ///
  /// [clusterExists]: A value that indicates whether to return snapshots only
  /// for an existing cluster. You can perform table-level restore only by using
  /// a snapshot of an existing cluster, that is, a cluster that has not been
  /// deleted. Values for this parameter work as follows:
  ///
  /// *   If `ClusterExists` is set to `true`, `ClusterIdentifier` is required.
  ///
  /// *   If `ClusterExists` is set to `false` and `ClusterIdentifier` isn't
  /// specified, all snapshots associated with deleted clusters (orphaned
  /// snapshots) are returned.
  ///
  /// *   If `ClusterExists` is set to `false` and `ClusterIdentifier` is
  /// specified for a deleted cluster, snapshots associated with that cluster
  /// are returned.
  ///
  /// *   If `ClusterExists` is set to `false` and `ClusterIdentifier` is
  /// specified for an existing cluster, no snapshots are returned.
  ///
  /// [sortingEntities]:
  Future<SnapshotMessage> describeClusterSnapshots(
      {String clusterIdentifier,
      String snapshotIdentifier,
      String snapshotType,
      DateTime startTime,
      DateTime endTime,
      int maxRecords,
      String marker,
      String ownerAccount,
      List<String> tagKeys,
      List<String> tagValues,
      bool clusterExists,
      List<SnapshotSortingEntity> sortingEntities}) async {
    return SnapshotMessage.fromJson({});
  }

  /// Returns one or more cluster subnet group objects, which contain metadata
  /// about your cluster subnet groups. By default, this operation returns
  /// information about all cluster subnet groups that are defined in you AWS
  /// account.
  ///
  /// If you specify both tag keys and tag values in the same request, Amazon
  /// Redshift returns all subnet groups that match any combination of the
  /// specified keys and values. For example, if you have `owner` and
  /// `environment` for tag keys, and `admin` and `test` for tag values, all
  /// subnet groups that have any combination of those values are returned.
  ///
  /// If both tag keys and values are omitted from the request, subnet groups
  /// are returned regardless of whether they have tag keys or values associated
  /// with them.
  ///
  /// [clusterSubnetGroupName]: The name of the cluster subnet group for which
  /// information is requested.
  ///
  /// [maxRecords]: The maximum number of response records to return in each
  /// call. If the number of remaining response records exceeds the specified
  /// `MaxRecords` value, a value is returned in a `marker` field of the
  /// response. You can retrieve the next set of records by retrying the command
  /// with the returned marker value.
  ///
  /// Default: `100`
  ///
  /// Constraints: minimum 20, maximum 100.
  ///
  /// [marker]: An optional parameter that specifies the starting point to
  /// return a set of response records. When the results of a
  /// DescribeClusterSubnetGroups request exceed the value specified in
  /// `MaxRecords`, AWS returns a value in the `Marker` field of the response.
  /// You can retrieve the next set of response records by providing the
  /// returned marker value in the `Marker` parameter and retrying the request.
  ///
  /// [tagKeys]: A tag key or keys for which you want to return all matching
  /// cluster subnet groups that are associated with the specified key or keys.
  /// For example, suppose that you have subnet groups that are tagged with keys
  /// called `owner` and `environment`. If you specify both of these tag keys in
  /// the request, Amazon Redshift returns a response with the subnet groups
  /// that have either or both of these tag keys associated with them.
  ///
  /// [tagValues]: A tag value or values for which you want to return all
  /// matching cluster subnet groups that are associated with the specified tag
  /// value or values. For example, suppose that you have subnet groups that are
  /// tagged with values called `admin` and `test`. If you specify both of these
  /// tag values in the request, Amazon Redshift returns a response with the
  /// subnet groups that have either or both of these tag values associated with
  /// them.
  Future<ClusterSubnetGroupMessage> describeClusterSubnetGroups(
      {String clusterSubnetGroupName,
      int maxRecords,
      String marker,
      List<String> tagKeys,
      List<String> tagValues}) async {
    return ClusterSubnetGroupMessage.fromJson({});
  }

  /// Returns a list of all the available maintenance tracks.
  ///
  /// [maintenanceTrackName]: The name of the maintenance track.
  ///
  /// [maxRecords]: An integer value for the maximum number of maintenance
  /// tracks to return.
  ///
  /// [marker]: An optional parameter that specifies the starting point to
  /// return a set of response records. When the results of a
  /// `DescribeClusterTracks` request exceed the value specified in
  /// `MaxRecords`, Amazon Redshift returns a value in the `Marker` field of the
  /// response. You can retrieve the next set of response records by providing
  /// the returned marker value in the `Marker` parameter and retrying the
  /// request.
  Future<TrackListMessage> describeClusterTracks(
      {String maintenanceTrackName, int maxRecords, String marker}) async {
    return TrackListMessage.fromJson({});
  }

  /// Returns descriptions of the available Amazon Redshift cluster versions.
  /// You can call this operation even before creating any clusters to learn
  /// more about the Amazon Redshift versions. For more information about
  /// managing clusters, go to
  /// [Amazon Redshift Clusters](https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html)
  /// in the _Amazon Redshift Cluster Management Guide_.
  ///
  /// [clusterVersion]: The specific cluster version to return.
  ///
  /// Example: `1.0`
  ///
  /// [clusterParameterGroupFamily]: The name of a specific cluster parameter
  /// group family to return details for.
  ///
  /// Constraints:
  ///
  /// *   Must be 1 to 255 alphanumeric characters
  ///
  /// *   First character must be a letter
  ///
  /// *   Cannot end with a hyphen or contain two consecutive hyphens
  ///
  /// [maxRecords]: The maximum number of response records to return in each
  /// call. If the number of remaining response records exceeds the specified
  /// `MaxRecords` value, a value is returned in a `marker` field of the
  /// response. You can retrieve the next set of records by retrying the command
  /// with the returned marker value.
  ///
  /// Default: `100`
  ///
  /// Constraints: minimum 20, maximum 100.
  ///
  /// [marker]: An optional parameter that specifies the starting point to
  /// return a set of response records. When the results of a
  /// DescribeClusterVersions request exceed the value specified in
  /// `MaxRecords`, AWS returns a value in the `Marker` field of the response.
  /// You can retrieve the next set of response records by providing the
  /// returned marker value in the `Marker` parameter and retrying the request.
  Future<ClusterVersionsMessage> describeClusterVersions(
      {String clusterVersion,
      String clusterParameterGroupFamily,
      int maxRecords,
      String marker}) async {
    return ClusterVersionsMessage.fromJson({});
  }

  /// Returns properties of provisioned clusters including general cluster
  /// properties, cluster database properties, maintenance and backup
  /// properties, and security and access properties. This operation supports
  /// pagination. For more information about managing clusters, go to
  /// [Amazon Redshift Clusters](https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html)
  /// in the _Amazon Redshift Cluster Management Guide_.
  ///
  /// If you specify both tag keys and tag values in the same request, Amazon
  /// Redshift returns all clusters that match any combination of the specified
  /// keys and values. For example, if you have `owner` and `environment` for
  /// tag keys, and `admin` and `test` for tag values, all clusters that have
  /// any combination of those values are returned.
  ///
  /// If both tag keys and values are omitted from the request, clusters are
  /// returned regardless of whether they have tag keys or values associated
  /// with them.
  ///
  /// [clusterIdentifier]: The unique identifier of a cluster whose properties
  /// you are requesting. This parameter is case sensitive.
  ///
  /// The default is that all clusters defined for an account are returned.
  ///
  /// [maxRecords]: The maximum number of response records to return in each
  /// call. If the number of remaining response records exceeds the specified
  /// `MaxRecords` value, a value is returned in a `marker` field of the
  /// response. You can retrieve the next set of records by retrying the command
  /// with the returned marker value.
  ///
  /// Default: `100`
  ///
  /// Constraints: minimum 20, maximum 100.
  ///
  /// [marker]: An optional parameter that specifies the starting point to
  /// return a set of response records. When the results of a DescribeClusters
  /// request exceed the value specified in `MaxRecords`, AWS returns a value in
  /// the `Marker` field of the response. You can retrieve the next set of
  /// response records by providing the returned marker value in the `Marker`
  /// parameter and retrying the request.
  ///
  /// Constraints: You can specify either the **ClusterIdentifier** parameter or
  /// the **Marker** parameter, but not both.
  ///
  /// [tagKeys]: A tag key or keys for which you want to return all matching
  /// clusters that are associated with the specified key or keys. For example,
  /// suppose that you have clusters that are tagged with keys called `owner`
  /// and `environment`. If you specify both of these tag keys in the request,
  /// Amazon Redshift returns a response with the clusters that have either or
  /// both of these tag keys associated with them.
  ///
  /// [tagValues]: A tag value or values for which you want to return all
  /// matching clusters that are associated with the specified tag value or
  /// values. For example, suppose that you have clusters that are tagged with
  /// values called `admin` and `test`. If you specify both of these tag values
  /// in the request, Amazon Redshift returns a response with the clusters that
  /// have either or both of these tag values associated with them.
  Future<ClustersMessage> describeClusters(
      {String clusterIdentifier,
      int maxRecords,
      String marker,
      List<String> tagKeys,
      List<String> tagValues}) async {
    return ClustersMessage.fromJson({});
  }

  /// Returns a list of parameter settings for the specified parameter group
  /// family.
  ///
  ///  For more information about parameters and parameter groups, go to
  /// [Amazon Redshift Parameter Groups](https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-parameter-groups.html)
  /// in the _Amazon Redshift Cluster Management Guide_.
  ///
  /// [parameterGroupFamily]: The name of the cluster parameter group family.
  ///
  /// [maxRecords]: The maximum number of response records to return in each
  /// call. If the number of remaining response records exceeds the specified
  /// `MaxRecords` value, a value is returned in a `marker` field of the
  /// response. You can retrieve the next set of records by retrying the command
  /// with the returned marker value.
  ///
  /// Default: `100`
  ///
  /// Constraints: minimum 20, maximum 100.
  ///
  /// [marker]: An optional parameter that specifies the starting point to
  /// return a set of response records. When the results of a
  /// DescribeDefaultClusterParameters request exceed the value specified in
  /// `MaxRecords`, AWS returns a value in the `Marker` field of the response.
  /// You can retrieve the next set of response records by providing the
  /// returned marker value in the `Marker` parameter and retrying the request.
  Future<DescribeDefaultClusterParametersResult>
      describeDefaultClusterParameters(String parameterGroupFamily,
          {int maxRecords, String marker}) async {
    return DescribeDefaultClusterParametersResult.fromJson({});
  }

  /// Displays a list of event categories for all event source types, or for a
  /// specified source type. For a list of the event categories and source
  /// types, go to
  /// [Amazon Redshift Event Notifications](https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-event-notifications.html).
  ///
  /// [sourceType]: The source type, such as cluster or parameter group, to
  /// which the described event categories apply.
  ///
  /// Valid values: cluster, cluster-snapshot, cluster-parameter-group, and
  /// cluster-security-group.
  Future<EventCategoriesMessage> describeEventCategories(
      {String sourceType}) async {
    return EventCategoriesMessage.fromJson({});
  }

  /// Lists descriptions of all the Amazon Redshift event notification
  /// subscriptions for a customer account. If you specify a subscription name,
  /// lists the description for that subscription.
  ///
  /// If you specify both tag keys and tag values in the same request, Amazon
  /// Redshift returns all event notification subscriptions that match any
  /// combination of the specified keys and values. For example, if you have
  /// `owner` and `environment` for tag keys, and `admin` and `test` for tag
  /// values, all subscriptions that have any combination of those values are
  /// returned.
  ///
  /// If both tag keys and values are omitted from the request, subscriptions
  /// are returned regardless of whether they have tag keys or values associated
  /// with them.
  ///
  /// [subscriptionName]: The name of the Amazon Redshift event notification
  /// subscription to be described.
  ///
  /// [maxRecords]: The maximum number of response records to return in each
  /// call. If the number of remaining response records exceeds the specified
  /// `MaxRecords` value, a value is returned in a `marker` field of the
  /// response. You can retrieve the next set of records by retrying the command
  /// with the returned marker value.
  ///
  /// Default: `100`
  ///
  /// Constraints: minimum 20, maximum 100.
  ///
  /// [marker]: An optional parameter that specifies the starting point to
  /// return a set of response records. When the results of a
  /// DescribeEventSubscriptions request exceed the value specified in
  /// `MaxRecords`, AWS returns a value in the `Marker` field of the response.
  /// You can retrieve the next set of response records by providing the
  /// returned marker value in the `Marker` parameter and retrying the request.
  ///
  /// [tagKeys]: A tag key or keys for which you want to return all matching
  /// event notification subscriptions that are associated with the specified
  /// key or keys. For example, suppose that you have subscriptions that are
  /// tagged with keys called `owner` and `environment`. If you specify both of
  /// these tag keys in the request, Amazon Redshift returns a response with the
  /// subscriptions that have either or both of these tag keys associated with
  /// them.
  ///
  /// [tagValues]: A tag value or values for which you want to return all
  /// matching event notification subscriptions that are associated with the
  /// specified tag value or values. For example, suppose that you have
  /// subscriptions that are tagged with values called `admin` and `test`. If
  /// you specify both of these tag values in the request, Amazon Redshift
  /// returns a response with the subscriptions that have either or both of
  /// these tag values associated with them.
  Future<EventSubscriptionsMessage> describeEventSubscriptions(
      {String subscriptionName,
      int maxRecords,
      String marker,
      List<String> tagKeys,
      List<String> tagValues}) async {
    return EventSubscriptionsMessage.fromJson({});
  }

  /// Returns events related to clusters, security groups, snapshots, and
  /// parameter groups for the past 14 days. Events specific to a particular
  /// cluster, security group, snapshot or parameter group can be obtained by
  /// providing the name as a parameter. By default, the past hour of events are
  /// returned.
  ///
  /// [sourceIdentifier]: The identifier of the event source for which events
  /// will be returned. If this parameter is not specified, then all sources are
  /// included in the response.
  ///
  /// Constraints:
  ///
  /// If _SourceIdentifier_ is supplied, _SourceType_ must also be provided.
  ///
  /// *   Specify a cluster identifier when _SourceType_ is `cluster`.
  ///
  /// *   Specify a cluster security group name when _SourceType_ is
  /// `cluster-security-group`.
  ///
  /// *   Specify a cluster parameter group name when _SourceType_ is
  /// `cluster-parameter-group`.
  ///
  /// *   Specify a cluster snapshot identifier when _SourceType_ is
  /// `cluster-snapshot`.
  ///
  /// [sourceType]: The event source to retrieve events for. If no value is
  /// specified, all events are returned.
  ///
  /// Constraints:
  ///
  /// If _SourceType_ is supplied, _SourceIdentifier_ must also be provided.
  ///
  /// *   Specify `cluster` when _SourceIdentifier_ is a cluster identifier.
  ///
  /// *   Specify `cluster-security-group` when _SourceIdentifier_ is a cluster
  /// security group name.
  ///
  /// *   Specify `cluster-parameter-group` when _SourceIdentifier_ is a cluster
  /// parameter group name.
  ///
  /// *   Specify `cluster-snapshot` when _SourceIdentifier_ is a cluster
  /// snapshot identifier.
  ///
  /// [startTime]: The beginning of the time interval to retrieve events for,
  /// specified in ISO 8601 format. For more information about ISO 8601, go to
  /// the [ISO8601 Wikipedia page.](http://en.wikipedia.org/wiki/ISO_8601)
  ///
  /// Example: `2009-07-08T18:00Z`
  ///
  /// [endTime]: The end of the time interval for which to retrieve events,
  /// specified in ISO 8601 format. For more information about ISO 8601, go to
  /// the [ISO8601 Wikipedia page.](http://en.wikipedia.org/wiki/ISO_8601)
  ///
  /// Example: `2009-07-08T18:00Z`
  ///
  /// [duration]: The number of minutes prior to the time of the request for
  /// which to retrieve events. For example, if the request is sent at 18:00 and
  /// you specify a duration of 60, then only events which have occurred after
  /// 17:00 will be returned.
  ///
  /// Default: `60`
  ///
  /// [maxRecords]: The maximum number of response records to return in each
  /// call. If the number of remaining response records exceeds the specified
  /// `MaxRecords` value, a value is returned in a `marker` field of the
  /// response. You can retrieve the next set of records by retrying the command
  /// with the returned marker value.
  ///
  /// Default: `100`
  ///
  /// Constraints: minimum 20, maximum 100.
  ///
  /// [marker]: An optional parameter that specifies the starting point to
  /// return a set of response records. When the results of a DescribeEvents
  /// request exceed the value specified in `MaxRecords`, AWS returns a value in
  /// the `Marker` field of the response. You can retrieve the next set of
  /// response records by providing the returned marker value in the `Marker`
  /// parameter and retrying the request.
  Future<EventsMessage> describeEvents(
      {String sourceIdentifier,
      String sourceType,
      DateTime startTime,
      DateTime endTime,
      int duration,
      int maxRecords,
      String marker}) async {
    return EventsMessage.fromJson({});
  }

  /// Returns information about the specified HSM client certificate. If no
  /// certificate ID is specified, returns information about all the HSM
  /// certificates owned by your AWS customer account.
  ///
  /// If you specify both tag keys and tag values in the same request, Amazon
  /// Redshift returns all HSM client certificates that match any combination of
  /// the specified keys and values. For example, if you have `owner` and
  /// `environment` for tag keys, and `admin` and `test` for tag values, all HSM
  /// client certificates that have any combination of those values are
  /// returned.
  ///
  /// If both tag keys and values are omitted from the request, HSM client
  /// certificates are returned regardless of whether they have tag keys or
  /// values associated with them.
  ///
  /// [hsmClientCertificateIdentifier]: The identifier of a specific HSM client
  /// certificate for which you want information. If no identifier is specified,
  /// information is returned for all HSM client certificates owned by your AWS
  /// customer account.
  ///
  /// [maxRecords]: The maximum number of response records to return in each
  /// call. If the number of remaining response records exceeds the specified
  /// `MaxRecords` value, a value is returned in a `marker` field of the
  /// response. You can retrieve the next set of records by retrying the command
  /// with the returned marker value.
  ///
  /// Default: `100`
  ///
  /// Constraints: minimum 20, maximum 100.
  ///
  /// [marker]: An optional parameter that specifies the starting point to
  /// return a set of response records. When the results of a
  /// DescribeHsmClientCertificates request exceed the value specified in
  /// `MaxRecords`, AWS returns a value in the `Marker` field of the response.
  /// You can retrieve the next set of response records by providing the
  /// returned marker value in the `Marker` parameter and retrying the request.
  ///
  /// [tagKeys]: A tag key or keys for which you want to return all matching HSM
  /// client certificates that are associated with the specified key or keys.
  /// For example, suppose that you have HSM client certificates that are tagged
  /// with keys called `owner` and `environment`. If you specify both of these
  /// tag keys in the request, Amazon Redshift returns a response with the HSM
  /// client certificates that have either or both of these tag keys associated
  /// with them.
  ///
  /// [tagValues]: A tag value or values for which you want to return all
  /// matching HSM client certificates that are associated with the specified
  /// tag value or values. For example, suppose that you have HSM client
  /// certificates that are tagged with values called `admin` and `test`. If you
  /// specify both of these tag values in the request, Amazon Redshift returns a
  /// response with the HSM client certificates that have either or both of
  /// these tag values associated with them.
  Future<HsmClientCertificateMessage> describeHsmClientCertificates(
      {String hsmClientCertificateIdentifier,
      int maxRecords,
      String marker,
      List<String> tagKeys,
      List<String> tagValues}) async {
    return HsmClientCertificateMessage.fromJson({});
  }

  /// Returns information about the specified Amazon Redshift HSM configuration.
  /// If no configuration ID is specified, returns information about all the HSM
  /// configurations owned by your AWS customer account.
  ///
  /// If you specify both tag keys and tag values in the same request, Amazon
  /// Redshift returns all HSM connections that match any combination of the
  /// specified keys and values. For example, if you have `owner` and
  /// `environment` for tag keys, and `admin` and `test` for tag values, all HSM
  /// connections that have any combination of those values are returned.
  ///
  /// If both tag keys and values are omitted from the request, HSM connections
  /// are returned regardless of whether they have tag keys or values associated
  /// with them.
  ///
  /// [hsmConfigurationIdentifier]: The identifier of a specific Amazon Redshift
  /// HSM configuration to be described. If no identifier is specified,
  /// information is returned for all HSM configurations owned by your AWS
  /// customer account.
  ///
  /// [maxRecords]: The maximum number of response records to return in each
  /// call. If the number of remaining response records exceeds the specified
  /// `MaxRecords` value, a value is returned in a `marker` field of the
  /// response. You can retrieve the next set of records by retrying the command
  /// with the returned marker value.
  ///
  /// Default: `100`
  ///
  /// Constraints: minimum 20, maximum 100.
  ///
  /// [marker]: An optional parameter that specifies the starting point to
  /// return a set of response records. When the results of a
  /// DescribeHsmConfigurations request exceed the value specified in
  /// `MaxRecords`, AWS returns a value in the `Marker` field of the response.
  /// You can retrieve the next set of response records by providing the
  /// returned marker value in the `Marker` parameter and retrying the request.
  ///
  /// [tagKeys]: A tag key or keys for which you want to return all matching HSM
  /// configurations that are associated with the specified key or keys. For
  /// example, suppose that you have HSM configurations that are tagged with
  /// keys called `owner` and `environment`. If you specify both of these tag
  /// keys in the request, Amazon Redshift returns a response with the HSM
  /// configurations that have either or both of these tag keys associated with
  /// them.
  ///
  /// [tagValues]: A tag value or values for which you want to return all
  /// matching HSM configurations that are associated with the specified tag
  /// value or values. For example, suppose that you have HSM configurations
  /// that are tagged with values called `admin` and `test`. If you specify both
  /// of these tag values in the request, Amazon Redshift returns a response
  /// with the HSM configurations that have either or both of these tag values
  /// associated with them.
  Future<HsmConfigurationMessage> describeHsmConfigurations(
      {String hsmConfigurationIdentifier,
      int maxRecords,
      String marker,
      List<String> tagKeys,
      List<String> tagValues}) async {
    return HsmConfigurationMessage.fromJson({});
  }

  /// Describes whether information, such as queries and connection attempts, is
  /// being logged for the specified Amazon Redshift cluster.
  ///
  /// [clusterIdentifier]: The identifier of the cluster from which to get the
  /// logging status.
  ///
  /// Example: `examplecluster`
  Future<LoggingStatus> describeLoggingStatus(String clusterIdentifier) async {
    return LoggingStatus.fromJson({});
  }

  /// Returns a list of orderable cluster options. Before you create a new
  /// cluster you can use this operation to find what options are available,
  /// such as the EC2 Availability Zones (AZ) in the specific AWS Region that
  /// you can specify, and the node types you can request. The node types differ
  /// by available storage, memory, CPU and price. With the cost involved you
  /// might want to obtain a list of cluster options in the specific region and
  /// specify values when creating a cluster. For more information about
  /// managing clusters, go to
  /// [Amazon Redshift Clusters](https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html)
  /// in the _Amazon Redshift Cluster Management Guide_.
  ///
  /// [clusterVersion]: The version filter value. Specify this parameter to show
  /// only the available offerings matching the specified version.
  ///
  /// Default: All versions.
  ///
  /// Constraints: Must be one of the version returned from
  /// DescribeClusterVersions.
  ///
  /// [nodeType]: The node type filter value. Specify this parameter to show
  /// only the available offerings matching the specified node type.
  ///
  /// [maxRecords]: The maximum number of response records to return in each
  /// call. If the number of remaining response records exceeds the specified
  /// `MaxRecords` value, a value is returned in a `marker` field of the
  /// response. You can retrieve the next set of records by retrying the command
  /// with the returned marker value.
  ///
  /// Default: `100`
  ///
  /// Constraints: minimum 20, maximum 100.
  ///
  /// [marker]: An optional parameter that specifies the starting point to
  /// return a set of response records. When the results of a
  /// DescribeOrderableClusterOptions request exceed the value specified in
  /// `MaxRecords`, AWS returns a value in the `Marker` field of the response.
  /// You can retrieve the next set of response records by providing the
  /// returned marker value in the `Marker` parameter and retrying the request.
  Future<OrderableClusterOptionsMessage> describeOrderableClusterOptions(
      {String clusterVersion,
      String nodeType,
      int maxRecords,
      String marker}) async {
    return OrderableClusterOptionsMessage.fromJson({});
  }

  /// Returns a list of the available reserved node offerings by Amazon Redshift
  /// with their descriptions including the node type, the fixed and recurring
  /// costs of reserving the node and duration the node will be reserved for
  /// you. These descriptions help you determine which reserve node offering you
  /// want to purchase. You then use the unique offering ID in you call to
  /// PurchaseReservedNodeOffering to reserve one or more nodes for your Amazon
  /// Redshift cluster.
  ///
  ///  For more information about reserved node offerings, go to
  /// [Purchasing Reserved Nodes](https://docs.aws.amazon.com/redshift/latest/mgmt/purchase-reserved-node-instance.html)
  /// in the _Amazon Redshift Cluster Management Guide_.
  ///
  /// [reservedNodeOfferingId]: The unique identifier for the offering.
  ///
  /// [maxRecords]: The maximum number of response records to return in each
  /// call. If the number of remaining response records exceeds the specified
  /// `MaxRecords` value, a value is returned in a `marker` field of the
  /// response. You can retrieve the next set of records by retrying the command
  /// with the returned marker value.
  ///
  /// Default: `100`
  ///
  /// Constraints: minimum 20, maximum 100.
  ///
  /// [marker]: An optional parameter that specifies the starting point to
  /// return a set of response records. When the results of a
  /// DescribeReservedNodeOfferings request exceed the value specified in
  /// `MaxRecords`, AWS returns a value in the `Marker` field of the response.
  /// You can retrieve the next set of response records by providing the
  /// returned marker value in the `Marker` parameter and retrying the request.
  Future<ReservedNodeOfferingsMessage> describeReservedNodeOfferings(
      {String reservedNodeOfferingId, int maxRecords, String marker}) async {
    return ReservedNodeOfferingsMessage.fromJson({});
  }

  /// Returns the descriptions of the reserved nodes.
  ///
  /// [reservedNodeId]: Identifier for the node reservation.
  ///
  /// [maxRecords]: The maximum number of response records to return in each
  /// call. If the number of remaining response records exceeds the specified
  /// `MaxRecords` value, a value is returned in a `marker` field of the
  /// response. You can retrieve the next set of records by retrying the command
  /// with the returned marker value.
  ///
  /// Default: `100`
  ///
  /// Constraints: minimum 20, maximum 100.
  ///
  /// [marker]: An optional parameter that specifies the starting point to
  /// return a set of response records. When the results of a
  /// DescribeReservedNodes request exceed the value specified in `MaxRecords`,
  /// AWS returns a value in the `Marker` field of the response. You can
  /// retrieve the next set of response records by providing the returned marker
  /// value in the `Marker` parameter and retrying the request.
  Future<ReservedNodesMessage> describeReservedNodes(
      {String reservedNodeId, int maxRecords, String marker}) async {
    return ReservedNodesMessage.fromJson({});
  }

  /// Returns information about the last resize operation for the specified
  /// cluster. If no resize operation has ever been initiated for the specified
  /// cluster, a `HTTP 404` error is returned. If a resize operation was
  /// initiated and completed, the status of the resize remains as `SUCCEEDED`
  /// until the next resize.
  ///
  /// A resize operation can be requested using ModifyCluster and specifying a
  /// different number or type of nodes for the cluster.
  ///
  /// [clusterIdentifier]: The unique identifier of a cluster whose resize
  /// progress you are requesting. This parameter is case-sensitive.
  ///
  /// By default, resize operations for all clusters defined for an AWS account
  /// are returned.
  Future<ResizeProgressMessage> describeResize(String clusterIdentifier) async {
    return ResizeProgressMessage.fromJson({});
  }

  /// Returns a list of snapshot copy grants owned by the AWS account in the
  /// destination region.
  ///
  ///  For more information about managing snapshot copy grants, go to
  /// [Amazon Redshift Database Encryption](https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-db-encryption.html)
  /// in the _Amazon Redshift Cluster Management Guide_.
  ///
  /// [snapshotCopyGrantName]: The name of the snapshot copy grant.
  ///
  /// [maxRecords]: The maximum number of response records to return in each
  /// call. If the number of remaining response records exceeds the specified
  /// `MaxRecords` value, a value is returned in a `marker` field of the
  /// response. You can retrieve the next set of records by retrying the command
  /// with the returned marker value.
  ///
  /// Default: `100`
  ///
  /// Constraints: minimum 20, maximum 100.
  ///
  /// [marker]: An optional parameter that specifies the starting point to
  /// return a set of response records. When the results of a
  /// `DescribeSnapshotCopyGrant` request exceed the value specified in
  /// `MaxRecords`, AWS returns a value in the `Marker` field of the response.
  /// You can retrieve the next set of response records by providing the
  /// returned marker value in the `Marker` parameter and retrying the request.
  ///
  /// Constraints: You can specify either the **SnapshotCopyGrantName**
  /// parameter or the **Marker** parameter, but not both.
  ///
  /// [tagKeys]: A tag key or keys for which you want to return all matching
  /// resources that are associated with the specified key or keys. For example,
  /// suppose that you have resources tagged with keys called `owner` and
  /// `environment`. If you specify both of these tag keys in the request,
  /// Amazon Redshift returns a response with all resources that have either or
  /// both of these tag keys associated with them.
  ///
  /// [tagValues]: A tag value or values for which you want to return all
  /// matching resources that are associated with the specified value or values.
  /// For example, suppose that you have resources tagged with values called
  /// `admin` and `test`. If you specify both of these tag values in the
  /// request, Amazon Redshift returns a response with all resources that have
  /// either or both of these tag values associated with them.
  Future<SnapshotCopyGrantMessage> describeSnapshotCopyGrants(
      {String snapshotCopyGrantName,
      int maxRecords,
      String marker,
      List<String> tagKeys,
      List<String> tagValues}) async {
    return SnapshotCopyGrantMessage.fromJson({});
  }

  /// Returns a list of snapshot schedules.
  ///
  /// [clusterIdentifier]: The unique identifier for the cluster whose snapshot
  /// schedules you want to view.
  ///
  /// [scheduleIdentifier]: A unique identifier for a snapshot schedule.
  ///
  /// [tagKeys]: The key value for a snapshot schedule tag.
  ///
  /// [tagValues]: The value corresponding to the key of the snapshot schedule
  /// tag.
  ///
  /// [marker]: A value that indicates the starting point for the next set of
  /// response records in a subsequent request. If a value is returned in a
  /// response, you can retrieve the next set of records by providing this
  /// returned marker value in the `marker` parameter and retrying the command.
  /// If the `marker` field is empty, all response records have been retrieved
  /// for the request.
  ///
  /// [maxRecords]: The maximum number or response records to return in each
  /// call. If the number of remaining response records exceeds the specified
  /// `MaxRecords` value, a value is returned in a `marker` field of the
  /// response. You can retrieve the next set of records by retrying the command
  /// with the returned `marker` value.
  Future<DescribeSnapshotSchedulesOutputMessage> describeSnapshotSchedules(
      {String clusterIdentifier,
      String scheduleIdentifier,
      List<String> tagKeys,
      List<String> tagValues,
      String marker,
      int maxRecords}) async {
    return DescribeSnapshotSchedulesOutputMessage.fromJson({});
  }

  /// Returns the total amount of snapshot usage and provisioned storage in
  /// megabytes.
  Future<CustomerStorageMessage> describeStorage() async {
    return CustomerStorageMessage.fromJson({});
  }

  /// Lists the status of one or more table restore requests made using the
  /// RestoreTableFromClusterSnapshot API action. If you don't specify a value
  /// for the `TableRestoreRequestId` parameter, then
  /// `DescribeTableRestoreStatus` returns the status of all table restore
  /// requests ordered by the date and time of the request in ascending order.
  /// Otherwise `DescribeTableRestoreStatus` returns the status of the table
  /// specified by `TableRestoreRequestId`.
  ///
  /// [clusterIdentifier]: The Amazon Redshift cluster that the table is being
  /// restored to.
  ///
  /// [tableRestoreRequestId]: The identifier of the table restore request to
  /// return status for. If you don't specify a `TableRestoreRequestId` value,
  /// then `DescribeTableRestoreStatus` returns the status of all in-progress
  /// table restore requests.
  ///
  /// [maxRecords]: The maximum number of records to include in the response. If
  /// more records exist than the specified `MaxRecords` value, a pagination
  /// token called a marker is included in the response so that the remaining
  /// results can be retrieved.
  ///
  /// [marker]: An optional pagination token provided by a previous
  /// `DescribeTableRestoreStatus` request. If this parameter is specified, the
  /// response includes only records beyond the marker, up to the value
  /// specified by the `MaxRecords` parameter.
  Future<TableRestoreStatusMessage> describeTableRestoreStatus(
      {String clusterIdentifier,
      String tableRestoreRequestId,
      int maxRecords,
      String marker}) async {
    return TableRestoreStatusMessage.fromJson({});
  }

  /// Returns a list of tags. You can return tags from a specific resource by
  /// specifying an ARN, or you can return all tags for a given type of
  /// resource, such as clusters, snapshots, and so on.
  ///
  /// The following are limitations for `DescribeTags`:
  ///
  /// *   You cannot specify an ARN and a resource-type value together in the
  /// same request.
  ///
  /// *   You cannot use the `MaxRecords` and `Marker` parameters together with
  /// the ARN parameter.
  ///
  /// *   The `MaxRecords` parameter can be a range from 10 to 50 results to
  /// return in a request.
  ///
  ///
  /// If you specify both tag keys and tag values in the same request, Amazon
  /// Redshift returns all resources that match any combination of the specified
  /// keys and values. For example, if you have `owner` and `environment` for
  /// tag keys, and `admin` and `test` for tag values, all resources that have
  /// any combination of those values are returned.
  ///
  /// If both tag keys and values are omitted from the request, resources are
  /// returned regardless of whether they have tag keys or values associated
  /// with them.
  ///
  /// [resourceName]: The Amazon Resource Name (ARN) for which you want to
  /// describe the tag or tags. For example,
  /// `arn:aws:redshift:us-east-1:123456789:cluster:t1`.
  ///
  /// [resourceType]: The type of resource with which you want to view tags.
  /// Valid resource types are:
  ///
  /// *   Cluster
  ///
  /// *   CIDR/IP
  ///
  /// *   EC2 security group
  ///
  /// *   Snapshot
  ///
  /// *   Cluster security group
  ///
  /// *   Subnet group
  ///
  /// *   HSM connection
  ///
  /// *   HSM certificate
  ///
  /// *   Parameter group
  ///
  /// *   Snapshot copy grant
  ///
  ///
  /// For more information about Amazon Redshift resource types and constructing
  /// ARNs, go to
  /// [Specifying Policy Elements: Actions, Effects, Resources, and Principals](https://docs.aws.amazon.com/redshift/latest/mgmt/redshift-iam-access-control-overview.html#redshift-iam-access-control-specify-actions)
  /// in the Amazon Redshift Cluster Management Guide.
  ///
  /// [maxRecords]: The maximum number or response records to return in each
  /// call. If the number of remaining response records exceeds the specified
  /// `MaxRecords` value, a value is returned in a `marker` field of the
  /// response. You can retrieve the next set of records by retrying the command
  /// with the returned `marker` value.
  ///
  /// [marker]: A value that indicates the starting point for the next set of
  /// response records in a subsequent request. If a value is returned in a
  /// response, you can retrieve the next set of records by providing this
  /// returned marker value in the `marker` parameter and retrying the command.
  /// If the `marker` field is empty, all response records have been retrieved
  /// for the request.
  ///
  /// [tagKeys]: A tag key or keys for which you want to return all matching
  /// resources that are associated with the specified key or keys. For example,
  /// suppose that you have resources tagged with keys called `owner` and
  /// `environment`. If you specify both of these tag keys in the request,
  /// Amazon Redshift returns a response with all resources that have either or
  /// both of these tag keys associated with them.
  ///
  /// [tagValues]: A tag value or values for which you want to return all
  /// matching resources that are associated with the specified value or values.
  /// For example, suppose that you have resources tagged with values called
  /// `admin` and `test`. If you specify both of these tag values in the
  /// request, Amazon Redshift returns a response with all resources that have
  /// either or both of these tag values associated with them.
  Future<TaggedResourceListMessage> describeTags(
      {String resourceName,
      String resourceType,
      int maxRecords,
      String marker,
      List<String> tagKeys,
      List<String> tagValues}) async {
    return TaggedResourceListMessage.fromJson({});
  }

  /// Stops logging information, such as queries and connection attempts, for
  /// the specified Amazon Redshift cluster.
  ///
  /// [clusterIdentifier]: The identifier of the cluster on which logging is to
  /// be stopped.
  ///
  /// Example: `examplecluster`
  Future<LoggingStatus> disableLogging(String clusterIdentifier) async {
    return LoggingStatus.fromJson({});
  }

  /// Disables the automatic copying of snapshots from one region to another
  /// region for a specified cluster.
  ///
  /// If your cluster and its snapshots are encrypted using a customer master
  /// key (CMK) from AWS KMS, use DeleteSnapshotCopyGrant to delete the grant
  /// that grants Amazon Redshift permission to the CMK in the destination
  /// region.
  ///
  /// [clusterIdentifier]: The unique identifier of the source cluster that you
  /// want to disable copying of snapshots to a destination region.
  ///
  /// Constraints: Must be the valid name of an existing cluster that has
  /// cross-region snapshot copy enabled.
  Future<DisableSnapshotCopyResult> disableSnapshotCopy(
      String clusterIdentifier) async {
    return DisableSnapshotCopyResult.fromJson({});
  }

  /// Starts logging information, such as queries and connection attempts, for
  /// the specified Amazon Redshift cluster.
  ///
  /// [clusterIdentifier]: The identifier of the cluster on which logging is to
  /// be started.
  ///
  /// Example: `examplecluster`
  ///
  /// [bucketName]: The name of an existing S3 bucket where the log files are to
  /// be stored.
  ///
  /// Constraints:
  ///
  /// *   Must be in the same region as the cluster
  ///
  /// *   The cluster must have read bucket and put object permissions
  ///
  /// [s3KeyPrefix]: The prefix applied to the log file names.
  ///
  /// Constraints:
  ///
  /// *   Cannot exceed 512 characters
  ///
  /// *   Cannot contain spaces( ), double quotes ("), single quotes ('), a
  /// backslash (), or control characters. The hexadecimal codes for invalid
  /// characters are:
  ///
  ///     *   x00 to x20
  ///
  ///     *   x22
  ///
  ///     *   x27
  ///
  ///     *   x5c
  ///
  ///     *   x7f or larger
  Future<LoggingStatus> enableLogging(
      {@required String clusterIdentifier,
      @required String bucketName,
      String s3KeyPrefix}) async {
    return LoggingStatus.fromJson({});
  }

  /// Enables the automatic copy of snapshots from one region to another region
  /// for a specified cluster.
  ///
  /// [clusterIdentifier]: The unique identifier of the source cluster to copy
  /// snapshots from.
  ///
  /// Constraints: Must be the valid name of an existing cluster that does not
  /// already have cross-region snapshot copy enabled.
  ///
  /// [destinationRegion]: The destination AWS Region that you want to copy
  /// snapshots to.
  ///
  /// Constraints: Must be the name of a valid AWS Region. For more information,
  /// see
  /// [Regions and Endpoints](https://docs.aws.amazon.com/general/latest/gr/rande.html#redshift_region)
  /// in the Amazon Web Services General Reference.
  ///
  /// [retentionPeriod]: The number of days to retain automated snapshots in the
  /// destination region after they are copied from the source region.
  ///
  /// Default: 7.
  ///
  /// Constraints: Must be at least 1 and no more than 35.
  ///
  /// [snapshotCopyGrantName]: The name of the snapshot copy grant to use when
  /// snapshots of an AWS KMS-encrypted cluster are copied to the destination
  /// region.
  ///
  /// [manualSnapshotRetentionPeriod]: The number of days to retain newly copied
  /// snapshots in the destination AWS Region after they are copied from the
  /// source AWS Region. If the value is -1, the manual snapshot is retained
  /// indefinitely.
  ///
  /// The value must be either -1 or an integer between 1 and 3,653.
  Future<EnableSnapshotCopyResult> enableSnapshotCopy(
      {@required String clusterIdentifier,
      @required String destinationRegion,
      int retentionPeriod,
      String snapshotCopyGrantName,
      int manualSnapshotRetentionPeriod}) async {
    return EnableSnapshotCopyResult.fromJson({});
  }

  /// Returns a database user name and temporary password with temporary
  /// authorization to log on to an Amazon Redshift database. The action returns
  /// the database user name prefixed with `IAM:` if `AutoCreate` is `False` or
  /// `IAMA:` if `AutoCreate` is `True`. You can optionally specify one or more
  /// database user groups that the user will join at log on. By default, the
  /// temporary credentials expire in 900 seconds. You can optionally specify a
  /// duration between 900 seconds (15 minutes) and 3600 seconds (60 minutes).
  /// For more information, see
  /// [Using IAM Authentication to Generate Database User Credentials](https://docs.aws.amazon.com/redshift/latest/mgmt/generating-user-credentials.html)
  /// in the Amazon Redshift Cluster Management Guide.
  ///
  /// The AWS Identity and Access Management (IAM)user or role that executes
  /// GetClusterCredentials must have an IAM policy attached that allows access
  /// to all necessary actions and resources. For more information about
  /// permissions, see
  /// [Resource Policies for GetClusterCredentials](https://docs.aws.amazon.com/redshift/latest/mgmt/redshift-iam-access-control-identity-based.html#redshift-policy-resources.getclustercredentials-resources)
  /// in the Amazon Redshift Cluster Management Guide.
  ///
  /// If the `DbGroups` parameter is specified, the IAM policy must allow the
  /// `redshift:JoinGroup` action with access to the listed `dbgroups`.
  ///
  /// In addition, if the `AutoCreate` parameter is set to `True`, then the
  /// policy must include the `redshift:CreateClusterUser` privilege.
  ///
  /// If the `DbName` parameter is specified, the IAM policy must allow access
  /// to the resource `dbname` for the specified database name.
  ///
  /// [dbUser]: The name of a database user. If a user name matching `DbUser`
  /// exists in the database, the temporary user credentials have the same
  /// permissions as the existing user. If `DbUser` doesn't exist in the
  /// database and `Autocreate` is `True`, a new user is created using the value
  /// for `DbUser` with PUBLIC permissions. If a database user matching the
  /// value for `DbUser` doesn't exist and `Autocreate` is `False`, then the
  /// command succeeds but the connection attempt will fail because the user
  /// doesn't exist in the database.
  ///
  /// For more information, see
  /// [CREATE USER](https://docs.aws.amazon.com/redshift/latest/dg/r_CREATE_USER.html)
  /// in the Amazon Redshift Database Developer Guide.
  ///
  /// Constraints:
  ///
  /// *   Must be 1 to 64 alphanumeric characters or hyphens. The user name
  /// can't be `PUBLIC`.
  ///
  /// *   Must contain only lowercase letters, numbers, underscore, plus sign,
  /// period (dot), at symbol (@), or hyphen.
  ///
  /// *   First character must be a letter.
  ///
  /// *   Must not contain a colon ( : ) or slash ( / ).
  ///
  /// *   Cannot be a reserved word. A list of reserved words can be found in
  /// [Reserved Words](http://docs.aws.amazon.com/redshift/latest/dg/r_pg_keywords.html)
  /// in the Amazon Redshift Database Developer Guide.
  ///
  /// [dbName]: The name of a database that `DbUser` is authorized to log on to.
  /// If `DbName` is not specified, `DbUser` can log on to any existing
  /// database.
  ///
  /// Constraints:
  ///
  /// *   Must be 1 to 64 alphanumeric characters or hyphens
  ///
  /// *   Must contain only lowercase letters, numbers, underscore, plus sign,
  /// period (dot), at symbol (@), or hyphen.
  ///
  /// *   First character must be a letter.
  ///
  /// *   Must not contain a colon ( : ) or slash ( / ).
  ///
  /// *   Cannot be a reserved word. A list of reserved words can be found in
  /// [Reserved Words](http://docs.aws.amazon.com/redshift/latest/dg/r_pg_keywords.html)
  /// in the Amazon Redshift Database Developer Guide.
  ///
  /// [clusterIdentifier]: The unique identifier of the cluster that contains
  /// the database for which your are requesting credentials. This parameter is
  /// case sensitive.
  ///
  /// [durationSeconds]: The number of seconds until the returned temporary
  /// password expires.
  ///
  /// Constraint: minimum 900, maximum 3600.
  ///
  /// Default: 900
  ///
  /// [autoCreate]: Create a database user with the name specified for the user
  /// named in `DbUser` if one does not exist.
  ///
  /// [dbGroups]: A list of the names of existing database groups that the user
  /// named in `DbUser` will join for the current session, in addition to any
  /// group memberships for an existing user. If not specified, a new user is
  /// added only to PUBLIC.
  ///
  /// Database group name constraints
  ///
  /// *   Must be 1 to 64 alphanumeric characters or hyphens
  ///
  /// *   Must contain only lowercase letters, numbers, underscore, plus sign,
  /// period (dot), at symbol (@), or hyphen.
  ///
  /// *   First character must be a letter.
  ///
  /// *   Must not contain a colon ( : ) or slash ( / ).
  ///
  /// *   Cannot be a reserved word. A list of reserved words can be found in
  /// [Reserved Words](http://docs.aws.amazon.com/redshift/latest/dg/r_pg_keywords.html)
  /// in the Amazon Redshift Database Developer Guide.
  Future<ClusterCredentials> getClusterCredentials(
      {@required String dbUser,
      String dbName,
      @required String clusterIdentifier,
      int durationSeconds,
      bool autoCreate,
      List<String> dbGroups}) async {
    return ClusterCredentials.fromJson({});
  }

  /// Returns an array of DC2 ReservedNodeOfferings that matches the payment
  /// type, term, and usage price of the given DC1 reserved node.
  ///
  /// [reservedNodeId]: A string representing the node identifier for the DC1
  /// Reserved Node to be exchanged.
  ///
  /// [maxRecords]: An integer setting the maximum number of
  /// ReservedNodeOfferings to retrieve.
  ///
  /// [marker]: A value that indicates the starting point for the next set of
  /// ReservedNodeOfferings.
  Future<GetReservedNodeExchangeOfferingsOutputMessage>
      getReservedNodeExchangeOfferings(String reservedNodeId,
          {int maxRecords, String marker}) async {
    return GetReservedNodeExchangeOfferingsOutputMessage.fromJson({});
  }

  /// Modifies the settings for a cluster. For example, you can add another
  /// security or parameter group, update the preferred maintenance window, or
  /// change the master user password. Resetting a cluster password or modifying
  /// the security groups associated with a cluster do not need a reboot.
  /// However, modifying a parameter group requires a reboot for parameters to
  /// take effect. For more information about managing clusters, go to
  /// [Amazon Redshift Clusters](https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html)
  /// in the _Amazon Redshift Cluster Management Guide_.
  ///
  /// You can also change node type and the number of nodes to scale up or down
  /// the cluster. When resizing a cluster, you must specify both the number of
  /// nodes and the node type even if one of the parameters does not change.
  ///
  /// [clusterIdentifier]: The unique identifier of the cluster to be modified.
  ///
  /// Example: `examplecluster`
  ///
  /// [clusterType]: The new cluster type.
  ///
  /// When you submit your cluster resize request, your existing cluster goes
  /// into a read-only mode. After Amazon Redshift provisions a new cluster
  /// based on your resize requirements, there will be outage for a period while
  /// the old cluster is deleted and your connection is switched to the new
  /// cluster. You can use DescribeResize to track the progress of the resize
  /// request.
  ///
  /// Valid Values:  `multi-node | single-node`
  ///
  /// [nodeType]: The new node type of the cluster. If you specify a new node
  /// type, you must also specify the number of nodes parameter.
  ///
  /// When you submit your request to resize a cluster, Amazon Redshift sets
  /// access permissions for the cluster to read-only. After Amazon Redshift
  /// provisions a new cluster according to your resize requirements, there will
  /// be a temporary outage while the old cluster is deleted and your connection
  /// is switched to the new cluster. When the new connection is complete, the
  /// original access permissions for the cluster are restored. You can use
  /// DescribeResize to track the progress of the resize request.
  ///
  /// Valid Values: `ds2.xlarge` | `ds2.8xlarge` | `dc1.large` | `dc1.8xlarge` |
  /// `dc2.large` | `dc2.8xlarge`
  ///
  /// [numberOfNodes]: The new number of nodes of the cluster. If you specify a
  /// new number of nodes, you must also specify the node type parameter.
  ///
  /// When you submit your request to resize a cluster, Amazon Redshift sets
  /// access permissions for the cluster to read-only. After Amazon Redshift
  /// provisions a new cluster according to your resize requirements, there will
  /// be a temporary outage while the old cluster is deleted and your connection
  /// is switched to the new cluster. When the new connection is complete, the
  /// original access permissions for the cluster are restored. You can use
  /// DescribeResize to track the progress of the resize request.
  ///
  /// Valid Values: Integer greater than `0`.
  ///
  /// [clusterSecurityGroups]: A list of cluster security groups to be
  /// authorized on this cluster. This change is asynchronously applied as soon
  /// as possible.
  ///
  /// Security groups currently associated with the cluster, and not in the list
  /// of groups to apply, will be revoked from the cluster.
  ///
  /// Constraints:
  ///
  /// *   Must be 1 to 255 alphanumeric characters or hyphens
  ///
  /// *   First character must be a letter
  ///
  /// *   Cannot end with a hyphen or contain two consecutive hyphens
  ///
  /// [vpcSecurityGroupIds]: A list of virtual private cloud (VPC) security
  /// groups to be associated with the cluster. This change is asynchronously
  /// applied as soon as possible.
  ///
  /// [masterUserPassword]: The new password for the cluster master user. This
  /// change is asynchronously applied as soon as possible. Between the time of
  /// the request and the completion of the request, the `MasterUserPassword`
  /// element exists in the `PendingModifiedValues` element of the operation
  /// response.
  ///
  ///  Operations never return the password, so this operation provides a way to
  /// regain access to the master user account for a cluster if the password is
  /// lost.
  ///
  /// Default: Uses existing setting.
  ///
  /// Constraints:
  ///
  /// *   Must be between 8 and 64 characters in length.
  ///
  /// *   Must contain at least one uppercase letter.
  ///
  /// *   Must contain at least one lowercase letter.
  ///
  /// *   Must contain one number.
  ///
  /// *   Can be any printable ASCII character (ASCII code 33 to 126) except '
  /// (single quote), " (double quote), , /, @, or space.
  ///
  /// [clusterParameterGroupName]: The name of the cluster parameter group to
  /// apply to this cluster. This change is applied only after the cluster is
  /// rebooted. To reboot a cluster use RebootCluster.
  ///
  /// Default: Uses existing setting.
  ///
  /// Constraints: The cluster parameter group must be in the same parameter
  /// group family that matches the cluster version.
  ///
  /// [automatedSnapshotRetentionPeriod]: The number of days that automated
  /// snapshots are retained. If the value is 0, automated snapshots are
  /// disabled. Even if automated snapshots are disabled, you can still create
  /// manual snapshots when you want with CreateClusterSnapshot.
  ///
  /// If you decrease the automated snapshot retention period from its current
  /// value, existing automated snapshots that fall outside of the new retention
  /// period will be immediately deleted.
  ///
  /// Default: Uses existing setting.
  ///
  /// Constraints: Must be a value from 0 to 35.
  ///
  /// [manualSnapshotRetentionPeriod]: The default for number of days that a
  /// newly created manual snapshot is retained. If the value is -1, the manual
  /// snapshot is retained indefinitely. This value doesn't retroactively change
  /// the retention periods of existing manual snapshots.
  ///
  /// The value must be either -1 or an integer between 1 and 3,653.
  ///
  /// The default value is -1.
  ///
  /// [preferredMaintenanceWindow]: The weekly time range (in UTC) during which
  /// system maintenance can occur, if necessary. If system maintenance is
  /// necessary during the window, it may result in an outage.
  ///
  /// This maintenance window change is made immediately. If the new maintenance
  /// window indicates the current time, there must be at least 120 minutes
  /// between the current time and end of the window in order to ensure that
  /// pending changes are applied.
  ///
  /// Default: Uses existing setting.
  ///
  /// Format: ddd:hh24:mi-ddd:hh24:mi, for example `wed:07:30-wed:08:00`.
  ///
  /// Valid Days: Mon | Tue | Wed | Thu | Fri | Sat | Sun
  ///
  /// Constraints: Must be at least 30 minutes.
  ///
  /// [clusterVersion]: The new version number of the Amazon Redshift engine to
  /// upgrade to.
  ///
  /// For major version upgrades, if a non-default cluster parameter group is
  /// currently in use, a new cluster parameter group in the cluster parameter
  /// group family for the new version must be specified. The new cluster
  /// parameter group can be the default for that cluster parameter group
  /// family. For more information about parameters and parameter groups, go to
  /// [Amazon Redshift Parameter Groups](https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-parameter-groups.html)
  /// in the _Amazon Redshift Cluster Management Guide_.
  ///
  /// Example: `1.0`
  ///
  /// [allowVersionUpgrade]: If `true`, major version upgrades will be applied
  /// automatically to the cluster during the maintenance window.
  ///
  /// Default: `false`
  ///
  /// [hsmClientCertificateIdentifier]: Specifies the name of the HSM client
  /// certificate the Amazon Redshift cluster uses to retrieve the data
  /// encryption keys stored in an HSM.
  ///
  /// [hsmConfigurationIdentifier]: Specifies the name of the HSM configuration
  /// that contains the information the Amazon Redshift cluster can use to
  /// retrieve and store keys in an HSM.
  ///
  /// [newClusterIdentifier]: The new identifier for the cluster.
  ///
  /// Constraints:
  ///
  /// *   Must contain from 1 to 63 alphanumeric characters or hyphens.
  ///
  /// *   Alphabetic characters must be lowercase.
  ///
  /// *   First character must be a letter.
  ///
  /// *   Cannot end with a hyphen or contain two consecutive hyphens.
  ///
  /// *   Must be unique for all clusters within an AWS account.
  ///
  ///
  /// Example: `examplecluster`
  ///
  /// [publiclyAccessible]: If `true`, the cluster can be accessed from a public
  /// network. Only clusters in VPCs can be set to be publicly available.
  ///
  /// [elasticIp]: The Elastic IP (EIP) address for the cluster.
  ///
  /// Constraints: The cluster must be provisioned in EC2-VPC and
  /// publicly-accessible through an Internet gateway. For more information
  /// about provisioning clusters in EC2-VPC, go to
  /// [Supported Platforms to Launch Your Cluster](https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html#cluster-platforms)
  /// in the Amazon Redshift Cluster Management Guide.
  ///
  /// [enhancedVpcRouting]: An option that specifies whether to create the
  /// cluster with enhanced VPC routing enabled. To create a cluster that uses
  /// enhanced VPC routing, the cluster must be in a VPC. For more information,
  /// see
  /// [Enhanced VPC Routing](https://docs.aws.amazon.com/redshift/latest/mgmt/enhanced-vpc-routing.html)
  /// in the Amazon Redshift Cluster Management Guide.
  ///
  /// If this option is `true`, enhanced VPC routing is enabled.
  ///
  /// Default: false
  ///
  /// [maintenanceTrackName]: The name for the maintenance track that you want
  /// to assign for the cluster. This name change is asynchronous. The new track
  /// name stays in the `PendingModifiedValues` for the cluster until the next
  /// maintenance window. When the maintenance track changes, the cluster is
  /// switched to the latest cluster release available for the maintenance
  /// track. At this point, the maintenance track name is applied.
  ///
  /// [encrypted]: Indicates whether the cluster is encrypted. If the cluster is
  /// encrypted and you provide a value for the `KmsKeyId` parameter, we will
  /// encrypt the cluster with the provided `KmsKeyId`. If you don't provide a
  /// `KmsKeyId`, we will encrypt with the default key. In the China region we
  /// will use legacy encryption if you specify that the cluster is encrypted.
  ///
  /// [kmsKeyId]: The AWS Key Management Service (KMS) key ID of the encryption
  /// key that you want to use to encrypt data in the cluster.
  Future<ModifyClusterResult> modifyCluster(String clusterIdentifier,
      {String clusterType,
      String nodeType,
      int numberOfNodes,
      List<String> clusterSecurityGroups,
      List<String> vpcSecurityGroupIds,
      String masterUserPassword,
      String clusterParameterGroupName,
      int automatedSnapshotRetentionPeriod,
      int manualSnapshotRetentionPeriod,
      String preferredMaintenanceWindow,
      String clusterVersion,
      bool allowVersionUpgrade,
      String hsmClientCertificateIdentifier,
      String hsmConfigurationIdentifier,
      String newClusterIdentifier,
      bool publiclyAccessible,
      String elasticIp,
      bool enhancedVpcRouting,
      String maintenanceTrackName,
      bool encrypted,
      String kmsKeyId}) async {
    return ModifyClusterResult.fromJson({});
  }

  /// Modifies the database revision of a cluster. The database revision is a
  /// unique revision of the database running in a cluster.
  ///
  /// [clusterIdentifier]: The unique identifier of a cluster whose database
  /// revision you want to modify.
  ///
  /// Example: `examplecluster`
  ///
  /// [revisionTarget]: The identifier of the database revision. You can
  /// retrieve this value from the response to the DescribeClusterDbRevisions
  /// request.
  Future<ModifyClusterDbRevisionResult> modifyClusterDbRevision(
      {@required String clusterIdentifier,
      @required String revisionTarget}) async {
    return ModifyClusterDbRevisionResult.fromJson({});
  }

  /// Modifies the list of AWS Identity and Access Management (IAM) roles that
  /// can be used by the cluster to access other AWS services.
  ///
  /// A cluster can have up to 10 IAM roles associated at any time.
  ///
  /// [clusterIdentifier]: The unique identifier of the cluster for which you
  /// want to associate or disassociate IAM roles.
  ///
  /// [addIamRoles]: Zero or more IAM roles to associate with the cluster. The
  /// roles must be in their Amazon Resource Name (ARN) format. You can
  /// associate up to 10 IAM roles with a single cluster in a single request.
  ///
  /// [removeIamRoles]: Zero or more IAM roles in ARN format to disassociate
  /// from the cluster. You can disassociate up to 10 IAM roles from a single
  /// cluster in a single request.
  Future<ModifyClusterIamRolesResult> modifyClusterIamRoles(
      String clusterIdentifier,
      {List<String> addIamRoles,
      List<String> removeIamRoles}) async {
    return ModifyClusterIamRolesResult.fromJson({});
  }

  /// Modifies the maintenance settings of a cluster. For example, you can defer
  /// a maintenance window. You can also update or cancel a deferment.
  ///
  /// [clusterIdentifier]: A unique identifier for the cluster.
  ///
  /// [deferMaintenance]: A boolean indicating whether to enable the deferred
  /// maintenance window.
  ///
  /// [deferMaintenanceIdentifier]: A unique identifier for the deferred
  /// maintenance window.
  ///
  /// [deferMaintenanceStartTime]: A timestamp indicating the start time for the
  /// deferred maintenance window.
  ///
  /// [deferMaintenanceEndTime]: A timestamp indicating end time for the
  /// deferred maintenance window. If you specify an end time, you can't specify
  /// a duration.
  ///
  /// [deferMaintenanceDuration]: An integer indicating the duration of the
  /// maintenance window in days. If you specify a duration, you can't specify
  /// an end time. The duration must be 45 days or less.
  Future<ModifyClusterMaintenanceResult> modifyClusterMaintenance(
      String clusterIdentifier,
      {bool deferMaintenance,
      String deferMaintenanceIdentifier,
      DateTime deferMaintenanceStartTime,
      DateTime deferMaintenanceEndTime,
      int deferMaintenanceDuration}) async {
    return ModifyClusterMaintenanceResult.fromJson({});
  }

  /// Modifies the parameters of a parameter group.
  ///
  ///  For more information about parameters and parameter groups, go to
  /// [Amazon Redshift Parameter Groups](https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-parameter-groups.html)
  /// in the _Amazon Redshift Cluster Management Guide_.
  ///
  /// [parameterGroupName]: The name of the parameter group to be modified.
  ///
  /// [parameters]: An array of parameters to be modified. A maximum of 20
  /// parameters can be modified in a single request.
  ///
  /// For each parameter to be modified, you must supply at least the parameter
  /// name and parameter value; other name-value pairs of the parameter are
  /// optional.
  ///
  /// For the workload management (WLM) configuration, you must supply all the
  /// name-value pairs in the wlm_json_configuration parameter.
  Future<ClusterParameterGroupNameMessage> modifyClusterParameterGroup(
      {@required String parameterGroupName,
      @required List<Parameter> parameters}) async {
    return ClusterParameterGroupNameMessage.fromJson({});
  }

  /// Modifies the settings for a snapshot.
  ///
  /// [snapshotIdentifier]: The identifier of the snapshot whose setting you
  /// want to modify.
  ///
  /// [manualSnapshotRetentionPeriod]: The number of days that a manual snapshot
  /// is retained. If the value is -1, the manual snapshot is retained
  /// indefinitely.
  ///
  /// If the manual snapshot falls outside of the new retention period, you can
  /// specify the force option to immediately delete the snapshot.
  ///
  /// The value must be either -1 or an integer between 1 and 3,653.
  ///
  /// [force]: A Boolean option to override an exception if the retention period
  /// has already passed.
  Future<ModifyClusterSnapshotResult> modifyClusterSnapshot(
      String snapshotIdentifier,
      {int manualSnapshotRetentionPeriod,
      bool force}) async {
    return ModifyClusterSnapshotResult.fromJson({});
  }

  /// Modifies a snapshot schedule for a cluster.
  ///
  /// [clusterIdentifier]: A unique identifier for the cluster whose snapshot
  /// schedule you want to modify.
  ///
  /// [scheduleIdentifier]: A unique alphanumeric identifier for the schedule
  /// that you want to associate with the cluster.
  ///
  /// [disassociateSchedule]: A boolean to indicate whether to remove the
  /// assoiciation between the cluster and the schedule.
  Future<void> modifyClusterSnapshotSchedule(String clusterIdentifier,
      {String scheduleIdentifier, bool disassociateSchedule}) async {}

  /// Modifies a cluster subnet group to include the specified list of VPC
  /// subnets. The operation replaces the existing list of subnets with the new
  /// list of subnets.
  ///
  /// [clusterSubnetGroupName]: The name of the subnet group to be modified.
  ///
  /// [description]: A text description of the subnet group to be modified.
  ///
  /// [subnetIds]: An array of VPC subnet IDs. A maximum of 20 subnets can be
  /// modified in a single request.
  Future<ModifyClusterSubnetGroupResult> modifyClusterSubnetGroup(
      {@required String clusterSubnetGroupName,
      String description,
      @required List<String> subnetIds}) async {
    return ModifyClusterSubnetGroupResult.fromJson({});
  }

  /// Modifies an existing Amazon Redshift event notification subscription.
  ///
  /// [subscriptionName]: The name of the modified Amazon Redshift event
  /// notification subscription.
  ///
  /// [snsTopicArn]: The Amazon Resource Name (ARN) of the SNS topic to be used
  /// by the event notification subscription.
  ///
  /// [sourceType]: The type of source that will be generating the events. For
  /// example, if you want to be notified of events generated by a cluster, you
  /// would set this parameter to cluster. If this value is not specified,
  /// events are returned for all Amazon Redshift objects in your AWS account.
  /// You must specify a source type in order to specify source IDs.
  ///
  /// Valid values: cluster, cluster-parameter-group, cluster-security-group,
  /// and cluster-snapshot.
  ///
  /// [sourceIds]: A list of one or more identifiers of Amazon Redshift source
  /// objects. All of the objects must be of the same type as was specified in
  /// the source type parameter. The event subscription will return only events
  /// generated by the specified objects. If not specified, then events are
  /// returned for all objects within the source type specified.
  ///
  /// Example: my-cluster-1, my-cluster-2
  ///
  /// Example: my-snapshot-20131010
  ///
  /// [eventCategories]: Specifies the Amazon Redshift event categories to be
  /// published by the event notification subscription.
  ///
  /// Values: configuration, management, monitoring, security
  ///
  /// [severity]: Specifies the Amazon Redshift event severity to be published
  /// by the event notification subscription.
  ///
  /// Values: ERROR, INFO
  ///
  /// [enabled]: A Boolean value indicating if the subscription is enabled.
  /// `true` indicates the subscription is enabled
  Future<ModifyEventSubscriptionResult> modifyEventSubscription(
      String subscriptionName,
      {String snsTopicArn,
      String sourceType,
      List<String> sourceIds,
      List<String> eventCategories,
      String severity,
      bool enabled}) async {
    return ModifyEventSubscriptionResult.fromJson({});
  }

  /// Modifies the number of days to retain snapshots in the destination AWS
  /// Region after they are copied from the source AWS Region. By default, this
  /// operation only changes the retention period of copied automated snapshots.
  /// The retention periods for both new and existing copied automated snapshots
  /// are updated with the new retention period. You can set the manual option
  /// to change only the retention periods of copied manual snapshots. If you
  /// set this option, only newly copied manual snapshots have the new retention
  /// period.
  ///
  /// [clusterIdentifier]: The unique identifier of the cluster for which you
  /// want to change the retention period for either automated or manual
  /// snapshots that are copied to a destination AWS Region.
  ///
  /// Constraints: Must be the valid name of an existing cluster that has
  /// cross-region snapshot copy enabled.
  ///
  /// [retentionPeriod]: The number of days to retain automated snapshots in the
  /// destination AWS Region after they are copied from the source AWS Region.
  ///
  /// By default, this only changes the retention period of copied automated
  /// snapshots.
  ///
  /// If you decrease the retention period for automated snapshots that are
  /// copied to a destination AWS Region, Amazon Redshift deletes any existing
  /// automated snapshots that were copied to the destination AWS Region and
  /// that fall outside of the new retention period.
  ///
  /// Constraints: Must be at least 1 and no more than 35 for automated
  /// snapshots.
  ///
  /// If you specify the `manual` option, only newly copied manual snapshots
  /// will have the new retention period.
  ///
  /// If you specify the value of -1 newly copied manual snapshots are retained
  /// indefinitely.
  ///
  /// Constraints: The number of days must be either -1 or an integer between 1
  /// and 3,653 for manual snapshots.
  ///
  /// [manual]: Indicates whether to apply the snapshot retention period to
  /// newly copied manual snapshots instead of automated snapshots.
  Future<ModifySnapshotCopyRetentionPeriodResult>
      modifySnapshotCopyRetentionPeriod(
          {@required String clusterIdentifier,
          @required int retentionPeriod,
          bool manual}) async {
    return ModifySnapshotCopyRetentionPeriodResult.fromJson({});
  }

  /// Modifies a snapshot schedule. Any schedule associated with a cluster is
  /// modified asynchronously.
  ///
  /// [scheduleIdentifier]: A unique alphanumeric identifier of the schedule to
  /// modify.
  ///
  /// [scheduleDefinitions]: An updated list of schedule definitions. A schedule
  /// definition is made up of schedule expressions, for example, "cron(30 12
  /// *)" or "rate(12 hours)".
  Future<SnapshotSchedule> modifySnapshotSchedule(
      {@required String scheduleIdentifier,
      @required List<String> scheduleDefinitions}) async {
    return SnapshotSchedule.fromJson({});
  }

  /// Allows you to purchase reserved nodes. Amazon Redshift offers a predefined
  /// set of reserved node offerings. You can purchase one or more of the
  /// offerings. You can call the DescribeReservedNodeOfferings API to obtain
  /// the available reserved node offerings. You can call this API by providing
  /// a specific reserved node offering and the number of nodes you want to
  /// reserve.
  ///
  ///  For more information about reserved node offerings, go to
  /// [Purchasing Reserved Nodes](https://docs.aws.amazon.com/redshift/latest/mgmt/purchase-reserved-node-instance.html)
  /// in the _Amazon Redshift Cluster Management Guide_.
  ///
  /// [reservedNodeOfferingId]: The unique identifier of the reserved node
  /// offering you want to purchase.
  ///
  /// [nodeCount]: The number of reserved nodes that you want to purchase.
  ///
  /// Default: `1`
  Future<PurchaseReservedNodeOfferingResult> purchaseReservedNodeOffering(
      String reservedNodeOfferingId,
      {int nodeCount}) async {
    return PurchaseReservedNodeOfferingResult.fromJson({});
  }

  /// Reboots a cluster. This action is taken as soon as possible. It results in
  /// a momentary outage to the cluster, during which the cluster status is set
  /// to `rebooting`. A cluster event is created when the reboot is completed.
  /// Any pending cluster modifications (see ModifyCluster) are applied at this
  /// reboot. For more information about managing clusters, go to
  /// [Amazon Redshift Clusters](https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html)
  /// in the _Amazon Redshift Cluster Management Guide_.
  ///
  /// [clusterIdentifier]: The cluster identifier.
  Future<RebootClusterResult> rebootCluster(String clusterIdentifier) async {
    return RebootClusterResult.fromJson({});
  }

  /// Sets one or more parameters of the specified parameter group to their
  /// default values and sets the source values of the parameters to
  /// "engine-default". To reset the entire parameter group specify the
  /// _ResetAllParameters_ parameter. For parameter changes to take effect you
  /// must reboot any associated clusters.
  ///
  /// [parameterGroupName]: The name of the cluster parameter group to be reset.
  ///
  /// [resetAllParameters]: If `true`, all parameters in the specified parameter
  /// group will be reset to their default values.
  ///
  /// Default: `true`
  ///
  /// [parameters]: An array of names of parameters to be reset. If
  /// _ResetAllParameters_ option is not used, then at least one parameter name
  /// must be supplied.
  ///
  /// Constraints: A maximum of 20 parameters can be reset in a single request.
  Future<ClusterParameterGroupNameMessage> resetClusterParameterGroup(
      String parameterGroupName,
      {bool resetAllParameters,
      List<Parameter> parameters}) async {
    return ClusterParameterGroupNameMessage.fromJson({});
  }

  /// Changes the size of the cluster. You can change the cluster's type, or
  /// change the number or type of nodes. The default behavior is to use the
  /// elastic resize method. With an elastic resize, your cluster is available
  /// for read and write operations more quickly than with the classic resize
  /// method.
  ///
  /// Elastic resize operations have the following restrictions:
  ///
  /// *   You can only resize clusters of the following types:
  ///
  ///     *   dc2.large
  ///
  ///     *   dc2.8xlarge
  ///
  ///     *   ds2.xlarge
  ///
  ///     *   ds2.8xlarge
  ///
  ///
  /// *   The type of nodes that you add must match the node type for the
  /// cluster.
  ///
  /// [clusterIdentifier]: The unique identifier for the cluster to resize.
  ///
  /// [clusterType]: The new cluster type for the specified cluster.
  ///
  /// [nodeType]: The new node type for the nodes you are adding. If not
  /// specified, the cluster's current node type is used.
  ///
  /// [numberOfNodes]: The new number of nodes for the cluster.
  ///
  /// [classic]: A boolean value indicating whether the resize operation is
  /// using the classic resize process. If you don't provide this parameter or
  /// set the value to `false`, the resize type is elastic.
  Future<ResizeClusterResult> resizeCluster(
      {@required String clusterIdentifier,
      String clusterType,
      String nodeType,
      @required int numberOfNodes,
      bool classic}) async {
    return ResizeClusterResult.fromJson({});
  }

  /// Creates a new cluster from a snapshot. By default, Amazon Redshift creates
  /// the resulting cluster with the same configuration as the original cluster
  /// from which the snapshot was created, except that the new cluster is
  /// created with the default cluster security and parameter groups. After
  /// Amazon Redshift creates the cluster, you can use the ModifyCluster API to
  /// associate a different security group and different parameter group with
  /// the restored cluster. If you are using a DS node type, you can also choose
  /// to change to another DS node type of the same size during restore.
  ///
  /// If you restore a cluster into a VPC, you must provide a cluster subnet
  /// group where you want the cluster restored.
  ///
  ///  For more information about working with snapshots, go to
  /// [Amazon Redshift Snapshots](https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-snapshots.html)
  /// in the _Amazon Redshift Cluster Management Guide_.
  ///
  /// [clusterIdentifier]: The identifier of the cluster that will be created
  /// from restoring the snapshot.
  ///
  /// Constraints:
  ///
  /// *   Must contain from 1 to 63 alphanumeric characters or hyphens.
  ///
  /// *   Alphabetic characters must be lowercase.
  ///
  /// *   First character must be a letter.
  ///
  /// *   Cannot end with a hyphen or contain two consecutive hyphens.
  ///
  /// *   Must be unique for all clusters within an AWS account.
  ///
  /// [snapshotIdentifier]: The name of the snapshot from which to create the
  /// new cluster. This parameter isn't case sensitive.
  ///
  /// Example: `my-snapshot-id`
  ///
  /// [snapshotClusterIdentifier]: The name of the cluster the source snapshot
  /// was created from. This parameter is required if your IAM user has a policy
  /// containing a snapshot resource element that specifies anything other than
  /// * for the cluster name.
  ///
  /// [port]: The port number on which the cluster accepts connections.
  ///
  /// Default: The same port as the original cluster.
  ///
  /// Constraints: Must be between `1115` and `65535`.
  ///
  /// [availabilityZone]: The Amazon EC2 Availability Zone in which to restore
  /// the cluster.
  ///
  /// Default: A random, system-chosen Availability Zone.
  ///
  /// Example: `us-east-1a`
  ///
  /// [allowVersionUpgrade]: If `true`, major version upgrades can be applied
  /// during the maintenance window to the Amazon Redshift engine that is
  /// running on the cluster.
  ///
  /// Default: `true`
  ///
  /// [clusterSubnetGroupName]: The name of the subnet group where you want to
  /// cluster restored.
  ///
  /// A snapshot of cluster in VPC can be restored only in VPC. Therefore, you
  /// must provide subnet group name where you want the cluster restored.
  ///
  /// [publiclyAccessible]: If `true`, the cluster can be accessed from a public
  /// network.
  ///
  /// [ownerAccount]: The AWS customer account used to create or copy the
  /// snapshot. Required if you are restoring a snapshot you do not own,
  /// optional if you own the snapshot.
  ///
  /// [hsmClientCertificateIdentifier]: Specifies the name of the HSM client
  /// certificate the Amazon Redshift cluster uses to retrieve the data
  /// encryption keys stored in an HSM.
  ///
  /// [hsmConfigurationIdentifier]: Specifies the name of the HSM configuration
  /// that contains the information the Amazon Redshift cluster can use to
  /// retrieve and store keys in an HSM.
  ///
  /// [elasticIp]: The elastic IP (EIP) address for the cluster.
  ///
  /// [clusterParameterGroupName]: The name of the parameter group to be
  /// associated with this cluster.
  ///
  /// Default: The default Amazon Redshift cluster parameter group. For
  /// information about the default parameter group, go to
  /// [Working with Amazon Redshift Parameter Groups](https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-parameter-groups.html).
  ///
  /// Constraints:
  ///
  /// *   Must be 1 to 255 alphanumeric characters or hyphens.
  ///
  /// *   First character must be a letter.
  ///
  /// *   Cannot end with a hyphen or contain two consecutive hyphens.
  ///
  /// [clusterSecurityGroups]: A list of security groups to be associated with
  /// this cluster.
  ///
  /// Default: The default cluster security group for Amazon Redshift.
  ///
  /// Cluster security groups only apply to clusters outside of VPCs.
  ///
  /// [vpcSecurityGroupIds]: A list of Virtual Private Cloud (VPC) security
  /// groups to be associated with the cluster.
  ///
  /// Default: The default VPC security group is associated with the cluster.
  ///
  /// VPC security groups only apply to clusters in VPCs.
  ///
  /// [preferredMaintenanceWindow]: The weekly time range (in UTC) during which
  /// automated cluster maintenance can occur.
  ///
  ///  Format: `ddd:hh24:mi-ddd:hh24:mi`
  ///
  ///  Default: The value selected for the cluster from which the snapshot was
  /// taken. For more information about the time blocks for each region, see
  /// [Maintenance Windows](https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html#rs-maintenance-windows)
  /// in Amazon Redshift Cluster Management Guide.
  ///
  /// Valid Days: Mon | Tue | Wed | Thu | Fri | Sat | Sun
  ///
  /// Constraints: Minimum 30-minute window.
  ///
  /// [automatedSnapshotRetentionPeriod]: The number of days that automated
  /// snapshots are retained. If the value is 0, automated snapshots are
  /// disabled. Even if automated snapshots are disabled, you can still create
  /// manual snapshots when you want with CreateClusterSnapshot.
  ///
  /// Default: The value selected for the cluster from which the snapshot was
  /// taken.
  ///
  /// Constraints: Must be a value from 0 to 35.
  ///
  /// [manualSnapshotRetentionPeriod]: The default number of days to retain a
  /// manual snapshot. If the value is -1, the snapshot is retained
  /// indefinitely. This setting doesn't change the retention period of existing
  /// snapshots.
  ///
  /// The value must be either -1 or an integer between 1 and 3,653.
  ///
  /// [kmsKeyId]: The AWS Key Management Service (KMS) key ID of the encryption
  /// key that you want to use to encrypt data in the cluster that you restore
  /// from a shared snapshot.
  ///
  /// [nodeType]: The node type that the restored cluster will be provisioned
  /// with.
  ///
  /// Default: The node type of the cluster from which the snapshot was taken.
  /// You can modify this if you are using any DS node type. In that case, you
  /// can choose to restore into another DS node type of the same size. For
  /// example, you can restore ds1.8xlarge into ds2.8xlarge, or ds1.xlarge into
  /// ds2.xlarge. If you have a DC instance type, you must restore into that
  /// same instance type and size. In other words, you can only restore a
  /// dc1.large instance type into another dc1.large instance type or dc2.large
  /// instance type. You can't restore dc1.8xlarge to dc2.8xlarge. First restore
  /// to a dc1.8xlareg cluster, then resize to a dc2.8large cluster. For more
  /// information about node types, see
  /// [About Clusters and Nodes](https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html#rs-about-clusters-and-nodes)
  /// in the _Amazon Redshift Cluster Management Guide_.
  ///
  /// [enhancedVpcRouting]: An option that specifies whether to create the
  /// cluster with enhanced VPC routing enabled. To create a cluster that uses
  /// enhanced VPC routing, the cluster must be in a VPC. For more information,
  /// see
  /// [Enhanced VPC Routing](https://docs.aws.amazon.com/redshift/latest/mgmt/enhanced-vpc-routing.html)
  /// in the Amazon Redshift Cluster Management Guide.
  ///
  /// If this option is `true`, enhanced VPC routing is enabled.
  ///
  /// Default: false
  ///
  /// [additionalInfo]: Reserved.
  ///
  /// [iamRoles]: A list of AWS Identity and Access Management (IAM) roles that
  /// can be used by the cluster to access other AWS services. You must supply
  /// the IAM roles in their Amazon Resource Name (ARN) format. You can supply
  /// up to 10 IAM roles in a single request.
  ///
  /// A cluster can have up to 10 IAM roles associated at any time.
  ///
  /// [maintenanceTrackName]: The name of the maintenance track for the restored
  /// cluster. When you take a snapshot, the snapshot inherits the
  /// `MaintenanceTrack` value from the cluster. The snapshot might be on a
  /// different track than the cluster that was the source for the snapshot. For
  /// example, suppose that you take a snapshot of a cluster that is on the
  /// current track and then change the cluster to be on the trailing track. In
  /// this case, the snapshot and the source cluster are on different tracks.
  ///
  /// [snapshotScheduleIdentifier]: A unique identifier for the snapshot
  /// schedule.
  Future<RestoreFromClusterSnapshotResult> restoreFromClusterSnapshot(
      {@required String clusterIdentifier,
      @required String snapshotIdentifier,
      String snapshotClusterIdentifier,
      int port,
      String availabilityZone,
      bool allowVersionUpgrade,
      String clusterSubnetGroupName,
      bool publiclyAccessible,
      String ownerAccount,
      String hsmClientCertificateIdentifier,
      String hsmConfigurationIdentifier,
      String elasticIp,
      String clusterParameterGroupName,
      List<String> clusterSecurityGroups,
      List<String> vpcSecurityGroupIds,
      String preferredMaintenanceWindow,
      int automatedSnapshotRetentionPeriod,
      int manualSnapshotRetentionPeriod,
      String kmsKeyId,
      String nodeType,
      bool enhancedVpcRouting,
      String additionalInfo,
      List<String> iamRoles,
      String maintenanceTrackName,
      String snapshotScheduleIdentifier}) async {
    return RestoreFromClusterSnapshotResult.fromJson({});
  }

  /// Creates a new table from a table in an Amazon Redshift cluster snapshot.
  /// You must create the new table within the Amazon Redshift cluster that the
  /// snapshot was taken from.
  ///
  /// You cannot use `RestoreTableFromClusterSnapshot` to restore a table with
  /// the same name as an existing table in an Amazon Redshift cluster. That is,
  /// you cannot overwrite an existing table in a cluster with a restored table.
  /// If you want to replace your original table with a new, restored table,
  /// then rename or drop your original table before you call
  /// `RestoreTableFromClusterSnapshot`. When you have renamed your original
  /// table, then you can pass the original name of the table as the
  /// `NewTableName` parameter value in the call to
  /// `RestoreTableFromClusterSnapshot`. This way, you can replace the original
  /// table with the table created from the snapshot.
  ///
  /// [clusterIdentifier]: The identifier of the Amazon Redshift cluster to
  /// restore the table to.
  ///
  /// [snapshotIdentifier]: The identifier of the snapshot to restore the table
  /// from. This snapshot must have been created from the Amazon Redshift
  /// cluster specified by the `ClusterIdentifier` parameter.
  ///
  /// [sourceDatabaseName]: The name of the source database that contains the
  /// table to restore from.
  ///
  /// [sourceSchemaName]: The name of the source schema that contains the table
  /// to restore from. If you do not specify a `SourceSchemaName` value, the
  /// default is `public`.
  ///
  /// [sourceTableName]: The name of the source table to restore from.
  ///
  /// [targetDatabaseName]: The name of the database to restore the table to.
  ///
  /// [targetSchemaName]: The name of the schema to restore the table to.
  ///
  /// [newTableName]: The name of the table to create as a result of the current
  /// request.
  Future<RestoreTableFromClusterSnapshotResult> restoreTableFromClusterSnapshot(
      {@required String clusterIdentifier,
      @required String snapshotIdentifier,
      @required String sourceDatabaseName,
      String sourceSchemaName,
      @required String sourceTableName,
      String targetDatabaseName,
      String targetSchemaName,
      @required String newTableName}) async {
    return RestoreTableFromClusterSnapshotResult.fromJson({});
  }

  /// Revokes an ingress rule in an Amazon Redshift security group for a
  /// previously authorized IP range or Amazon EC2 security group. To add an
  /// ingress rule, see AuthorizeClusterSecurityGroupIngress. For information
  /// about managing security groups, go to
  /// [Amazon Redshift Cluster Security Groups](https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-security-groups.html)
  /// in the _Amazon Redshift Cluster Management Guide_.
  ///
  /// [clusterSecurityGroupName]: The name of the security Group from which to
  /// revoke the ingress rule.
  ///
  /// [cidrip]: The IP range for which to revoke access. This range must be a
  /// valid Classless Inter-Domain Routing (CIDR) block of IP addresses. If
  /// `CIDRIP` is specified, `EC2SecurityGroupName` and
  /// `EC2SecurityGroupOwnerId` cannot be provided.
  ///
  /// [ec2SecurityGroupName]: The name of the EC2 Security Group whose access is
  /// to be revoked. If `EC2SecurityGroupName` is specified,
  /// `EC2SecurityGroupOwnerId` must also be provided and `CIDRIP` cannot be
  /// provided.
  ///
  /// [ec2SecurityGroupOwnerId]: The AWS account number of the owner of the
  /// security group specified in the `EC2SecurityGroupName` parameter. The AWS
  /// access key ID is not an acceptable value. If `EC2SecurityGroupOwnerId` is
  /// specified, `EC2SecurityGroupName` must also be provided. and `CIDRIP`
  /// cannot be provided.
  ///
  /// Example: `111122223333`
  Future<RevokeClusterSecurityGroupIngressResult>
      revokeClusterSecurityGroupIngress(String clusterSecurityGroupName,
          {String cidrip,
          String ec2SecurityGroupName,
          String ec2SecurityGroupOwnerId}) async {
    return RevokeClusterSecurityGroupIngressResult.fromJson({});
  }

  /// Removes the ability of the specified AWS customer account to restore the
  /// specified snapshot. If the account is currently restoring the snapshot,
  /// the restore will run to completion.
  ///
  ///  For more information about working with snapshots, go to
  /// [Amazon Redshift Snapshots](https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-snapshots.html)
  /// in the _Amazon Redshift Cluster Management Guide_.
  ///
  /// [snapshotIdentifier]: The identifier of the snapshot that the account can
  /// no longer access.
  ///
  /// [snapshotClusterIdentifier]: The identifier of the cluster the snapshot
  /// was created from. This parameter is required if your IAM user has a policy
  /// containing a snapshot resource element that specifies anything other than
  /// * for the cluster name.
  ///
  /// [accountWithRestoreAccess]: The identifier of the AWS customer account
  /// that can no longer restore the specified snapshot.
  Future<RevokeSnapshotAccessResult> revokeSnapshotAccess(
      {@required String snapshotIdentifier,
      String snapshotClusterIdentifier,
      @required String accountWithRestoreAccess}) async {
    return RevokeSnapshotAccessResult.fromJson({});
  }

  /// Rotates the encryption keys for a cluster.
  ///
  /// [clusterIdentifier]: The unique identifier of the cluster that you want to
  /// rotate the encryption keys for.
  ///
  /// Constraints: Must be the name of valid cluster that has encryption
  /// enabled.
  Future<RotateEncryptionKeyResult> rotateEncryptionKey(
      String clusterIdentifier) async {
    return RotateEncryptionKeyResult.fromJson({});
  }
}

class AcceptReservedNodeExchangeOutputMessage {
  final ReservedNode exchangedReservedNode;

  AcceptReservedNodeExchangeOutputMessage({
    this.exchangedReservedNode,
  });
  static AcceptReservedNodeExchangeOutputMessage fromJson(
          Map<String, dynamic> json) =>
      AcceptReservedNodeExchangeOutputMessage();
}

/// A name value pair that describes an aspect of an account.
class AccountAttribute {
  /// The name of the attribute.
  final String attributeName;

  /// A list of attribute values.
  final List<AttributeValueTarget> attributeValues;

  AccountAttribute({
    this.attributeName,
    this.attributeValues,
  });
  static AccountAttribute fromJson(Map<String, dynamic> json) =>
      AccountAttribute();
}

class AccountAttributeList {
  /// A list of attributes assigned to an account.
  final List<AccountAttribute> accountAttributes;

  AccountAttributeList({
    this.accountAttributes,
  });
  static AccountAttributeList fromJson(Map<String, dynamic> json) =>
      AccountAttributeList();
}

/// Describes an AWS customer account authorized to restore a snapshot.
class AccountWithRestoreAccess {
  /// The identifier of an AWS customer account authorized to restore a
  /// snapshot.
  final String accountId;

  /// The identifier of an AWS support account authorized to restore a snapshot.
  /// For AWS support, the identifier is `amazon-redshift-support`.
  final String accountAlias;

  AccountWithRestoreAccess({
    this.accountId,
    this.accountAlias,
  });
  static AccountWithRestoreAccess fromJson(Map<String, dynamic> json) =>
      AccountWithRestoreAccess();
}

/// Describes an attribute value.
class AttributeValueTarget {
  /// The value of the attribute.
  final String attributeValue;

  AttributeValueTarget({
    this.attributeValue,
  });
  static AttributeValueTarget fromJson(Map<String, dynamic> json) =>
      AttributeValueTarget();
}

class AuthorizeClusterSecurityGroupIngressResult {
  final ClusterSecurityGroup clusterSecurityGroup;

  AuthorizeClusterSecurityGroupIngressResult({
    this.clusterSecurityGroup,
  });
  static AuthorizeClusterSecurityGroupIngressResult fromJson(
          Map<String, dynamic> json) =>
      AuthorizeClusterSecurityGroupIngressResult();
}

class AuthorizeSnapshotAccessResult {
  final Snapshot snapshot;

  AuthorizeSnapshotAccessResult({
    this.snapshot,
  });
  static AuthorizeSnapshotAccessResult fromJson(Map<String, dynamic> json) =>
      AuthorizeSnapshotAccessResult();
}

/// Describes an availability zone.
class AvailabilityZone {
  /// The name of the availability zone.
  final String name;

  final List<SupportedPlatform> supportedPlatforms;

  AvailabilityZone({
    this.name,
    this.supportedPlatforms,
  });
  static AvailabilityZone fromJson(Map<String, dynamic> json) =>
      AvailabilityZone();
}

class BatchDeleteClusterSnapshotsResult {
  /// A list of the snapshot identifiers that were deleted.
  final List<String> resources;

  /// A list of any errors returned.
  final List<SnapshotErrorMessage> errors;

  BatchDeleteClusterSnapshotsResult({
    this.resources,
    this.errors,
  });
  static BatchDeleteClusterSnapshotsResult fromJson(
          Map<String, dynamic> json) =>
      BatchDeleteClusterSnapshotsResult();
}

class BatchModifyClusterSnapshotsOutputMessage {
  /// A list of the snapshots that were modified.
  final List<String> resources;

  /// A list of any errors returned.
  final List<SnapshotErrorMessage> errors;

  BatchModifyClusterSnapshotsOutputMessage({
    this.resources,
    this.errors,
  });
  static BatchModifyClusterSnapshotsOutputMessage fromJson(
          Map<String, dynamic> json) =>
      BatchModifyClusterSnapshotsOutputMessage();
}

/// Describes a cluster.
class Cluster {
  /// The unique identifier of the cluster.
  final String clusterIdentifier;

  /// The node type for the nodes in the cluster.
  final String nodeType;

  ///  The current state of the cluster. Possible values are the following:
  ///
  /// *    `available`
  ///
  /// *    `available, prep-for-resize`
  ///
  /// *    `available, resize-cleanup`
  ///
  /// *    `cancelling-resize`
  ///
  /// *    `creating`
  ///
  /// *    `deleting`
  ///
  /// *    `final-snapshot`
  ///
  /// *    `hardware-failure`
  ///
  /// *    `incompatible-hsm`
  ///
  /// *    `incompatible-network`
  ///
  /// *    `incompatible-parameters`
  ///
  /// *    `incompatible-restore`
  ///
  /// *    `modifying`
  ///
  /// *    `rebooting`
  ///
  /// *    `renaming`
  ///
  /// *    `resizing`
  ///
  /// *    `rotating-keys`
  ///
  /// *    `storage-full`
  ///
  /// *    `updating-hsm`
  final String clusterStatus;

  /// The availability status of the cluster for queries. Possible values are
  /// the following:
  ///
  /// *   Available - The cluster is available for queries.
  ///
  /// *   Unavailable - The cluster is not available for queries.
  ///
  /// *   Maintenance - The cluster is intermittently available for queries due
  /// to maintenance activities.
  ///
  /// *   Modifying - The cluster is intermittently available for queries due to
  /// changes that modify the cluster.
  ///
  /// *   Failed - The cluster failed and is not available for queries.
  final String clusterAvailabilityStatus;

  /// The status of a modify operation, if any, initiated for the cluster.
  final String modifyStatus;

  /// The master user name for the cluster. This name is used to connect to the
  /// database that is specified in the **DBName** parameter.
  final String masterUsername;

  /// The name of the initial database that was created when the cluster was
  /// created. This same name is returned for the life of the cluster. If an
  /// initial database was not specified, a database named `dev`dev was created
  /// by default.
  final String dbName;

  /// The connection endpoint.
  final Endpoint endpoint;

  /// The date and time that the cluster was created.
  final DateTime clusterCreateTime;

  /// The number of days that automatic cluster snapshots are retained.
  final int automatedSnapshotRetentionPeriod;

  /// The default number of days to retain a manual snapshot. If the value is
  /// -1, the snapshot is retained indefinitely. This setting doesn't change the
  /// retention period of existing snapshots.
  ///
  /// The value must be either -1 or an integer between 1 and 3,653.
  final int manualSnapshotRetentionPeriod;

  /// A list of cluster security group that are associated with the cluster.
  /// Each security group is represented by an element that contains
  /// `ClusterSecurityGroup.Name` and `ClusterSecurityGroup.Status` subelements.
  ///
  /// Cluster security groups are used when the cluster is not created in an
  /// Amazon Virtual Private Cloud (VPC). Clusters that are created in a VPC use
  /// VPC security groups, which are listed by the **VpcSecurityGroups**
  /// parameter.
  final List<ClusterSecurityGroupMembership> clusterSecurityGroups;

  /// A list of Amazon Virtual Private Cloud (Amazon VPC) security groups that
  /// are associated with the cluster. This parameter is returned only if the
  /// cluster is in a VPC.
  final List<VpcSecurityGroupMembership> vpcSecurityGroups;

  /// The list of cluster parameter groups that are associated with this
  /// cluster. Each parameter group in the list is returned with its status.
  final List<ClusterParameterGroupStatus> clusterParameterGroups;

  /// The name of the subnet group that is associated with the cluster. This
  /// parameter is valid only when the cluster is in a VPC.
  final String clusterSubnetGroupName;

  /// The identifier of the VPC the cluster is in, if the cluster is in a VPC.
  final String vpcId;

  /// The name of the Availability Zone in which the cluster is located.
  final String availabilityZone;

  /// The weekly time range, in Universal Coordinated Time (UTC), during which
  /// system maintenance can occur.
  final String preferredMaintenanceWindow;

  /// A value that, if present, indicates that changes to the cluster are
  /// pending. Specific pending changes are identified by subelements.
  final PendingModifiedValues pendingModifiedValues;

  /// The version ID of the Amazon Redshift engine that is running on the
  /// cluster.
  final String clusterVersion;

  /// A boolean value that, if `true`, indicates that major version upgrades
  /// will be applied automatically to the cluster during the maintenance
  /// window.
  final bool allowVersionUpgrade;

  /// The number of compute nodes in the cluster.
  final int numberOfNodes;

  /// A boolean value that, if `true`, indicates that the cluster can be
  /// accessed from a public network.
  final bool publiclyAccessible;

  /// A boolean value that, if `true`, indicates that data in the cluster is
  /// encrypted at rest.
  final bool encrypted;

  /// A value that describes the status of a cluster restore action. This
  /// parameter returns null if the cluster was not created by restoring a
  /// snapshot.
  final RestoreStatus restoreStatus;

  final DataTransferProgress dataTransferProgress;

  /// A value that reports whether the Amazon Redshift cluster has finished
  /// applying any hardware security module (HSM) settings changes specified in
  /// a modify cluster command.
  ///
  /// Values: active, applying
  final HsmStatus hsmStatus;

  /// A value that returns the destination region and retention period that are
  /// configured for cross-region snapshot copy.
  final ClusterSnapshotCopyStatus clusterSnapshotCopyStatus;

  /// The public key for the cluster.
  final String clusterPublicKey;

  /// The nodes in the cluster.
  final List<ClusterNode> clusterNodes;

  /// The status of the elastic IP (EIP) address.
  final ElasticIpStatus elasticIpStatus;

  /// The specific revision number of the database in the cluster.
  final String clusterRevisionNumber;

  /// The list of tags for the cluster.
  final List<Tag> tags;

  /// The AWS Key Management Service (AWS KMS) key ID of the encryption key used
  /// to encrypt data in the cluster.
  final String kmsKeyId;

  /// An option that specifies whether to create the cluster with enhanced VPC
  /// routing enabled. To create a cluster that uses enhanced VPC routing, the
  /// cluster must be in a VPC. For more information, see
  /// [Enhanced VPC Routing](https://docs.aws.amazon.com/redshift/latest/mgmt/enhanced-vpc-routing.html)
  /// in the Amazon Redshift Cluster Management Guide.
  ///
  /// If this option is `true`, enhanced VPC routing is enabled.
  ///
  /// Default: false
  final bool enhancedVpcRouting;

  /// A list of AWS Identity and Access Management (IAM) roles that can be used
  /// by the cluster to access other AWS services.
  final List<ClusterIamRole> iamRoles;

  /// Cluster operations that are waiting to be started.
  final List<String> pendingActions;

  /// The name of the maintenance track for the cluster.
  final String maintenanceTrackName;

  /// The number of nodes that you can resize the cluster to with the elastic
  /// resize method.
  final String elasticResizeNumberOfNodeOptions;

  /// Describes a group of `DeferredMaintenanceWindow` objects.
  final List<DeferredMaintenanceWindow> deferredMaintenanceWindows;

  /// A unique identifier for the cluster snapshot schedule.
  final String snapshotScheduleIdentifier;

  /// The current state of the cluster snapshot schedule.
  final String snapshotScheduleState;

  /// The date and time when the next snapshot is expected to be taken for
  /// clusters with a valid snapshot schedule and backups enabled.
  final DateTime expectedNextSnapshotScheduleTime;

  ///  The status of next expected snapshot for clusters having a valid snapshot
  /// schedule and backups enabled. Possible values are the following:
  ///
  /// *   OnTrack - The next snapshot is expected to be taken on time.
  ///
  /// *   Pending - The next snapshot is pending to be taken.
  final String expectedNextSnapshotScheduleTimeStatus;

  /// Returns the following:
  ///
  /// *   AllowCancelResize: a boolean value indicating if the resize operation
  /// can be cancelled.
  ///
  /// *   ResizeType: Returns ClassicResize
  final ResizeInfo resizeInfo;

  Cluster({
    this.clusterIdentifier,
    this.nodeType,
    this.clusterStatus,
    this.clusterAvailabilityStatus,
    this.modifyStatus,
    this.masterUsername,
    this.dbName,
    this.endpoint,
    this.clusterCreateTime,
    this.automatedSnapshotRetentionPeriod,
    this.manualSnapshotRetentionPeriod,
    this.clusterSecurityGroups,
    this.vpcSecurityGroups,
    this.clusterParameterGroups,
    this.clusterSubnetGroupName,
    this.vpcId,
    this.availabilityZone,
    this.preferredMaintenanceWindow,
    this.pendingModifiedValues,
    this.clusterVersion,
    this.allowVersionUpgrade,
    this.numberOfNodes,
    this.publiclyAccessible,
    this.encrypted,
    this.restoreStatus,
    this.dataTransferProgress,
    this.hsmStatus,
    this.clusterSnapshotCopyStatus,
    this.clusterPublicKey,
    this.clusterNodes,
    this.elasticIpStatus,
    this.clusterRevisionNumber,
    this.tags,
    this.kmsKeyId,
    this.enhancedVpcRouting,
    this.iamRoles,
    this.pendingActions,
    this.maintenanceTrackName,
    this.elasticResizeNumberOfNodeOptions,
    this.deferredMaintenanceWindows,
    this.snapshotScheduleIdentifier,
    this.snapshotScheduleState,
    this.expectedNextSnapshotScheduleTime,
    this.expectedNextSnapshotScheduleTimeStatus,
    this.resizeInfo,
  });
  static Cluster fromJson(Map<String, dynamic> json) => Cluster();
}

class ClusterAssociatedToSchedule {
  final String clusterIdentifier;

  final String scheduleAssociationState;

  ClusterAssociatedToSchedule({
    this.clusterIdentifier,
    this.scheduleAssociationState,
  });
  static ClusterAssociatedToSchedule fromJson(Map<String, dynamic> json) =>
      ClusterAssociatedToSchedule();
}

/// Temporary credentials with authorization to log on to an Amazon Redshift
/// database.
class ClusterCredentials {
  /// A database user name that is authorized to log on to the database `DbName`
  /// using the password `DbPassword`. If the specified DbUser exists in the
  /// database, the new user name has the same database privileges as the the
  /// user named in DbUser. By default, the user is added to PUBLIC. If the
  /// `DbGroups` parameter is specifed, `DbUser` is added to the listed groups
  /// for any sessions created using these credentials.
  final String dbUser;

  /// A temporary password that authorizes the user name returned by `DbUser` to
  /// log on to the database `DbName`.
  final String dbPassword;

  /// The date and time the password in `DbPassword` expires.
  final DateTime expiration;

  ClusterCredentials({
    this.dbUser,
    this.dbPassword,
    this.expiration,
  });
  static ClusterCredentials fromJson(Map<String, dynamic> json) =>
      ClusterCredentials();
}

/// Describes a `ClusterDbRevision`.
class ClusterDbRevision {
  /// The unique identifier of the cluster.
  final String clusterIdentifier;

  /// A string representing the current cluster version.
  final String currentDatabaseRevision;

  /// The date on which the database revision was released.
  final DateTime databaseRevisionReleaseDate;

  /// A list of `RevisionTarget` objects, where each object describes the
  /// database revision that a cluster can be updated to.
  final List<RevisionTarget> revisionTargets;

  ClusterDbRevision({
    this.clusterIdentifier,
    this.currentDatabaseRevision,
    this.databaseRevisionReleaseDate,
    this.revisionTargets,
  });
  static ClusterDbRevision fromJson(Map<String, dynamic> json) =>
      ClusterDbRevision();
}

class ClusterDbRevisionsMessage {
  /// A string representing the starting point for the next set of revisions. If
  /// a value is returned in a response, you can retrieve the next set of
  /// revisions by providing the value in the `marker` parameter and retrying
  /// the command. If the `marker` field is empty, all revisions have already
  /// been returned.
  final String marker;

  /// A list of revisions.
  final List<ClusterDbRevision> clusterDbRevisions;

  ClusterDbRevisionsMessage({
    this.marker,
    this.clusterDbRevisions,
  });
  static ClusterDbRevisionsMessage fromJson(Map<String, dynamic> json) =>
      ClusterDbRevisionsMessage();
}

/// An AWS Identity and Access Management (IAM) role that can be used by the
/// associated Amazon Redshift cluster to access other AWS services.
class ClusterIamRole {
  /// The Amazon Resource Name (ARN) of the IAM role, for example,
  /// `arn:aws:iam::123456789012:role/RedshiftCopyUnload`.
  final String iamRoleArn;

  /// A value that describes the status of the IAM role's association with an
  /// Amazon Redshift cluster.
  ///
  /// The following are possible statuses and descriptions.
  ///
  /// *    `in-sync`: The role is available for use by the cluster.
  ///
  /// *    `adding`: The role is in the process of being associated with the
  /// cluster.
  ///
  /// *    `removing`: The role is in the process of being disassociated with
  /// the cluster.
  final String applyStatus;

  ClusterIamRole({
    this.iamRoleArn,
    this.applyStatus,
  });
  static ClusterIamRole fromJson(Map<String, dynamic> json) => ClusterIamRole();
}

/// The identifier of a node in a cluster.
class ClusterNode {
  /// Whether the node is a leader node or a compute node.
  final String nodeRole;

  /// The private IP address of a node within a cluster.
  final String privateIPAddress;

  /// The public IP address of a node within a cluster.
  final String publicIPAddress;

  ClusterNode({
    this.nodeRole,
    this.privateIPAddress,
    this.publicIPAddress,
  });
  static ClusterNode fromJson(Map<String, dynamic> json) => ClusterNode();
}

/// Describes a parameter group.
class ClusterParameterGroup {
  /// The name of the cluster parameter group.
  final String parameterGroupName;

  /// The name of the cluster parameter group family that this cluster parameter
  /// group is compatible with.
  final String parameterGroupFamily;

  /// The description of the parameter group.
  final String description;

  /// The list of tags for the cluster parameter group.
  final List<Tag> tags;

  ClusterParameterGroup({
    this.parameterGroupName,
    this.parameterGroupFamily,
    this.description,
    this.tags,
  });
  static ClusterParameterGroup fromJson(Map<String, dynamic> json) =>
      ClusterParameterGroup();
}

/// Contains the output from the DescribeClusterParameters action.
class ClusterParameterGroupDetails {
  /// A list of Parameter instances. Each instance lists the parameters of one
  /// cluster parameter group.
  final List<Parameter> parameters;

  /// A value that indicates the starting point for the next set of response
  /// records in a subsequent request. If a value is returned in a response, you
  /// can retrieve the next set of records by providing this returned marker
  /// value in the `Marker` parameter and retrying the command. If the `Marker`
  /// field is empty, all response records have been retrieved for the request.
  final String marker;

  ClusterParameterGroupDetails({
    this.parameters,
    this.marker,
  });
  static ClusterParameterGroupDetails fromJson(Map<String, dynamic> json) =>
      ClusterParameterGroupDetails();
}

class ClusterParameterGroupNameMessage {
  /// The name of the cluster parameter group.
  final String parameterGroupName;

  /// The status of the parameter group. For example, if you made a change to a
  /// parameter group name-value pair, then the change could be pending a reboot
  /// of an associated cluster.
  final String parameterGroupStatus;

  ClusterParameterGroupNameMessage({
    this.parameterGroupName,
    this.parameterGroupStatus,
  });
  static ClusterParameterGroupNameMessage fromJson(Map<String, dynamic> json) =>
      ClusterParameterGroupNameMessage();
}

/// Describes the status of a parameter group.
class ClusterParameterGroupStatus {
  /// The name of the cluster parameter group.
  final String parameterGroupName;

  /// The status of parameter updates.
  final String parameterApplyStatus;

  /// The list of parameter statuses.
  ///
  ///  For more information about parameters and parameter groups, go to
  /// [Amazon Redshift Parameter Groups](https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-parameter-groups.html)
  /// in the _Amazon Redshift Cluster Management Guide_.
  final List<ClusterParameterStatus> clusterParameterStatusList;

  ClusterParameterGroupStatus({
    this.parameterGroupName,
    this.parameterApplyStatus,
    this.clusterParameterStatusList,
  });
  static ClusterParameterGroupStatus fromJson(Map<String, dynamic> json) =>
      ClusterParameterGroupStatus();
}

/// Contains the output from the DescribeClusterParameterGroups action.
class ClusterParameterGroupsMessage {
  /// A value that indicates the starting point for the next set of response
  /// records in a subsequent request. If a value is returned in a response, you
  /// can retrieve the next set of records by providing this returned marker
  /// value in the `Marker` parameter and retrying the command. If the `Marker`
  /// field is empty, all response records have been retrieved for the request.
  final String marker;

  /// A list of ClusterParameterGroup instances. Each instance describes one
  /// cluster parameter group.
  final List<ClusterParameterGroup> parameterGroups;

  ClusterParameterGroupsMessage({
    this.marker,
    this.parameterGroups,
  });
  static ClusterParameterGroupsMessage fromJson(Map<String, dynamic> json) =>
      ClusterParameterGroupsMessage();
}

/// Describes the status of a parameter group.
class ClusterParameterStatus {
  /// The name of the parameter.
  final String parameterName;

  /// The status of the parameter that indicates whether the parameter is in
  /// sync with the database, waiting for a cluster reboot, or encountered an
  /// error when being applied.
  ///
  /// The following are possible statuses and descriptions.
  ///
  /// *    `in-sync`: The parameter value is in sync with the database.
  ///
  /// *    `pending-reboot`: The parameter value will be applied after the
  /// cluster reboots.
  ///
  /// *    `applying`: The parameter value is being applied to the database.
  ///
  /// *    `invalid-parameter`: Cannot apply the parameter value because it has
  /// an invalid value or syntax.
  ///
  /// *    `apply-deferred`: The parameter contains static property changes. The
  /// changes are deferred until the cluster reboots.
  ///
  /// *    `apply-error`: Cannot connect to the cluster. The parameter change
  /// will be applied after the cluster reboots.
  ///
  /// *    `unknown-error`: Cannot apply the parameter change right now. The
  /// change will be applied after the cluster reboots.
  final String parameterApplyStatus;

  /// The error that prevented the parameter from being applied to the database.
  final String parameterApplyErrorDescription;

  ClusterParameterStatus({
    this.parameterName,
    this.parameterApplyStatus,
    this.parameterApplyErrorDescription,
  });
  static ClusterParameterStatus fromJson(Map<String, dynamic> json) =>
      ClusterParameterStatus();
}

/// Describes a security group.
class ClusterSecurityGroup {
  /// The name of the cluster security group to which the operation was applied.
  final String clusterSecurityGroupName;

  /// A description of the security group.
  final String description;

  /// A list of EC2 security groups that are permitted to access clusters
  /// associated with this cluster security group.
  final List<Ec2SecurityGroup> ec2SecurityGroups;

  /// A list of IP ranges (CIDR blocks) that are permitted to access clusters
  /// associated with this cluster security group.
  final List<IPRange> ipRanges;

  /// The list of tags for the cluster security group.
  final List<Tag> tags;

  ClusterSecurityGroup({
    this.clusterSecurityGroupName,
    this.description,
    this.ec2SecurityGroups,
    this.ipRanges,
    this.tags,
  });
  static ClusterSecurityGroup fromJson(Map<String, dynamic> json) =>
      ClusterSecurityGroup();
}

/// Describes a cluster security group.
class ClusterSecurityGroupMembership {
  /// The name of the cluster security group.
  final String clusterSecurityGroupName;

  /// The status of the cluster security group.
  final String status;

  ClusterSecurityGroupMembership({
    this.clusterSecurityGroupName,
    this.status,
  });
  static ClusterSecurityGroupMembership fromJson(Map<String, dynamic> json) =>
      ClusterSecurityGroupMembership();
}

class ClusterSecurityGroupMessage {
  /// A value that indicates the starting point for the next set of response
  /// records in a subsequent request. If a value is returned in a response, you
  /// can retrieve the next set of records by providing this returned marker
  /// value in the `Marker` parameter and retrying the command. If the `Marker`
  /// field is empty, all response records have been retrieved for the request.
  final String marker;

  /// A list of ClusterSecurityGroup instances.
  final List<ClusterSecurityGroup> clusterSecurityGroups;

  ClusterSecurityGroupMessage({
    this.marker,
    this.clusterSecurityGroups,
  });
  static ClusterSecurityGroupMessage fromJson(Map<String, dynamic> json) =>
      ClusterSecurityGroupMessage();
}

/// Returns the destination region and retention period that are configured for
/// cross-region snapshot copy.
class ClusterSnapshotCopyStatus {
  /// The destination region that snapshots are automatically copied to when
  /// cross-region snapshot copy is enabled.
  final String destinationRegion;

  /// The number of days that automated snapshots are retained in the
  /// destination region after they are copied from a source region.
  final BigInt retentionPeriod;

  /// The number of days that automated snapshots are retained in the
  /// destination region after they are copied from a source region. If the
  /// value is -1, the manual snapshot is retained indefinitely.
  ///
  /// The value must be either -1 or an integer between 1 and 3,653.
  final int manualSnapshotRetentionPeriod;

  /// The name of the snapshot copy grant.
  final String snapshotCopyGrantName;

  ClusterSnapshotCopyStatus({
    this.destinationRegion,
    this.retentionPeriod,
    this.manualSnapshotRetentionPeriod,
    this.snapshotCopyGrantName,
  });
  static ClusterSnapshotCopyStatus fromJson(Map<String, dynamic> json) =>
      ClusterSnapshotCopyStatus();
}

/// Describes a subnet group.
class ClusterSubnetGroup {
  /// The name of the cluster subnet group.
  final String clusterSubnetGroupName;

  /// The description of the cluster subnet group.
  final String description;

  /// The VPC ID of the cluster subnet group.
  final String vpcId;

  /// The status of the cluster subnet group. Possible values are `Complete`,
  /// `Incomplete` and `Invalid`.
  final String subnetGroupStatus;

  /// A list of the VPC Subnet elements.
  final List<Subnet> subnets;

  /// The list of tags for the cluster subnet group.
  final List<Tag> tags;

  ClusterSubnetGroup({
    this.clusterSubnetGroupName,
    this.description,
    this.vpcId,
    this.subnetGroupStatus,
    this.subnets,
    this.tags,
  });
  static ClusterSubnetGroup fromJson(Map<String, dynamic> json) =>
      ClusterSubnetGroup();
}

/// Contains the output from the DescribeClusterSubnetGroups action.
class ClusterSubnetGroupMessage {
  /// A value that indicates the starting point for the next set of response
  /// records in a subsequent request. If a value is returned in a response, you
  /// can retrieve the next set of records by providing this returned marker
  /// value in the `Marker` parameter and retrying the command. If the `Marker`
  /// field is empty, all response records have been retrieved for the request.
  final String marker;

  /// A list of ClusterSubnetGroup instances.
  final List<ClusterSubnetGroup> clusterSubnetGroups;

  ClusterSubnetGroupMessage({
    this.marker,
    this.clusterSubnetGroups,
  });
  static ClusterSubnetGroupMessage fromJson(Map<String, dynamic> json) =>
      ClusterSubnetGroupMessage();
}

/// Describes a cluster version, including the parameter group family and
/// description of the version.
class ClusterVersion {
  /// The version number used by the cluster.
  final String clusterVersion;

  /// The name of the cluster parameter group family for the cluster.
  final String clusterParameterGroupFamily;

  /// The description of the cluster version.
  final String description;

  ClusterVersion({
    this.clusterVersion,
    this.clusterParameterGroupFamily,
    this.description,
  });
  static ClusterVersion fromJson(Map<String, dynamic> json) => ClusterVersion();
}

/// Contains the output from the DescribeClusterVersions action.
class ClusterVersionsMessage {
  /// A value that indicates the starting point for the next set of response
  /// records in a subsequent request. If a value is returned in a response, you
  /// can retrieve the next set of records by providing this returned marker
  /// value in the `Marker` parameter and retrying the command. If the `Marker`
  /// field is empty, all response records have been retrieved for the request.
  final String marker;

  /// A list of `Version` elements.
  final List<ClusterVersion> clusterVersions;

  ClusterVersionsMessage({
    this.marker,
    this.clusterVersions,
  });
  static ClusterVersionsMessage fromJson(Map<String, dynamic> json) =>
      ClusterVersionsMessage();
}

/// Contains the output from the DescribeClusters action.
class ClustersMessage {
  /// A value that indicates the starting point for the next set of response
  /// records in a subsequent request. If a value is returned in a response, you
  /// can retrieve the next set of records by providing this returned marker
  /// value in the `Marker` parameter and retrying the command. If the `Marker`
  /// field is empty, all response records have been retrieved for the request.
  final String marker;

  /// A list of `Cluster` objects, where each object describes one cluster.
  final List<Cluster> clusters;

  ClustersMessage({
    this.marker,
    this.clusters,
  });
  static ClustersMessage fromJson(Map<String, dynamic> json) =>
      ClustersMessage();
}

class CopyClusterSnapshotResult {
  final Snapshot snapshot;

  CopyClusterSnapshotResult({
    this.snapshot,
  });
  static CopyClusterSnapshotResult fromJson(Map<String, dynamic> json) =>
      CopyClusterSnapshotResult();
}

class CreateClusterParameterGroupResult {
  final ClusterParameterGroup clusterParameterGroup;

  CreateClusterParameterGroupResult({
    this.clusterParameterGroup,
  });
  static CreateClusterParameterGroupResult fromJson(
          Map<String, dynamic> json) =>
      CreateClusterParameterGroupResult();
}

class CreateClusterResult {
  final Cluster cluster;

  CreateClusterResult({
    this.cluster,
  });
  static CreateClusterResult fromJson(Map<String, dynamic> json) =>
      CreateClusterResult();
}

class CreateClusterSecurityGroupResult {
  final ClusterSecurityGroup clusterSecurityGroup;

  CreateClusterSecurityGroupResult({
    this.clusterSecurityGroup,
  });
  static CreateClusterSecurityGroupResult fromJson(Map<String, dynamic> json) =>
      CreateClusterSecurityGroupResult();
}

class CreateClusterSnapshotResult {
  final Snapshot snapshot;

  CreateClusterSnapshotResult({
    this.snapshot,
  });
  static CreateClusterSnapshotResult fromJson(Map<String, dynamic> json) =>
      CreateClusterSnapshotResult();
}

class CreateClusterSubnetGroupResult {
  final ClusterSubnetGroup clusterSubnetGroup;

  CreateClusterSubnetGroupResult({
    this.clusterSubnetGroup,
  });
  static CreateClusterSubnetGroupResult fromJson(Map<String, dynamic> json) =>
      CreateClusterSubnetGroupResult();
}

class CreateEventSubscriptionResult {
  final EventSubscription eventSubscription;

  CreateEventSubscriptionResult({
    this.eventSubscription,
  });
  static CreateEventSubscriptionResult fromJson(Map<String, dynamic> json) =>
      CreateEventSubscriptionResult();
}

class CreateHsmClientCertificateResult {
  final HsmClientCertificate hsmClientCertificate;

  CreateHsmClientCertificateResult({
    this.hsmClientCertificate,
  });
  static CreateHsmClientCertificateResult fromJson(Map<String, dynamic> json) =>
      CreateHsmClientCertificateResult();
}

class CreateHsmConfigurationResult {
  final HsmConfiguration hsmConfiguration;

  CreateHsmConfigurationResult({
    this.hsmConfiguration,
  });
  static CreateHsmConfigurationResult fromJson(Map<String, dynamic> json) =>
      CreateHsmConfigurationResult();
}

class CreateSnapshotCopyGrantResult {
  final SnapshotCopyGrant snapshotCopyGrant;

  CreateSnapshotCopyGrantResult({
    this.snapshotCopyGrant,
  });
  static CreateSnapshotCopyGrantResult fromJson(Map<String, dynamic> json) =>
      CreateSnapshotCopyGrantResult();
}

class CustomerStorageMessage {
  /// The total amount of storage currently used for snapshots.
  final double totalBackupSizeInMegaBytes;

  /// The total amount of storage currently provisioned.
  final double totalProvisionedStorageInMegaBytes;

  CustomerStorageMessage({
    this.totalBackupSizeInMegaBytes,
    this.totalProvisionedStorageInMegaBytes,
  });
  static CustomerStorageMessage fromJson(Map<String, dynamic> json) =>
      CustomerStorageMessage();
}

/// Describes the status of a cluster while it is in the process of resizing
/// with an incremental resize.
class DataTransferProgress {
  /// Describes the status of the cluster. While the transfer is in progress the
  /// status is `transferringdata`.
  final String status;

  /// Describes the data transfer rate in MB's per second.
  final double currentRateInMegaBytesPerSecond;

  /// Describes the total amount of data to be transfered in megabytes.
  final BigInt totalDataInMegaBytes;

  /// Describes the total amount of data that has been transfered in MB's.
  final BigInt dataTransferredInMegaBytes;

  /// Describes the estimated number of seconds remaining to complete the
  /// transfer.
  final BigInt estimatedTimeToCompletionInSeconds;

  /// Describes the number of seconds that have elapsed during the data
  /// transfer.
  final BigInt elapsedTimeInSeconds;

  DataTransferProgress({
    this.status,
    this.currentRateInMegaBytesPerSecond,
    this.totalDataInMegaBytes,
    this.dataTransferredInMegaBytes,
    this.estimatedTimeToCompletionInSeconds,
    this.elapsedTimeInSeconds,
  });
  static DataTransferProgress fromJson(Map<String, dynamic> json) =>
      DataTransferProgress();
}

/// Describes the default cluster parameters for a parameter group family.
class DefaultClusterParameters {
  /// The name of the cluster parameter group family to which the engine default
  /// parameters apply.
  final String parameterGroupFamily;

  /// A value that indicates the starting point for the next set of response
  /// records in a subsequent request. If a value is returned in a response, you
  /// can retrieve the next set of records by providing this returned marker
  /// value in the `Marker` parameter and retrying the command. If the `Marker`
  /// field is empty, all response records have been retrieved for the request.
  final String marker;

  /// The list of cluster default parameters.
  final List<Parameter> parameters;

  DefaultClusterParameters({
    this.parameterGroupFamily,
    this.marker,
    this.parameters,
  });
  static DefaultClusterParameters fromJson(Map<String, dynamic> json) =>
      DefaultClusterParameters();
}

/// Describes a deferred maintenance window
class DeferredMaintenanceWindow {
  /// A unique identifier for the maintenance window.
  final String deferMaintenanceIdentifier;

  ///  A timestamp for the beginning of the time period when we defer
  /// maintenance.
  final DateTime deferMaintenanceStartTime;

  ///  A timestamp for the end of the time period when we defer maintenance.
  final DateTime deferMaintenanceEndTime;

  DeferredMaintenanceWindow({
    this.deferMaintenanceIdentifier,
    this.deferMaintenanceStartTime,
    this.deferMaintenanceEndTime,
  });
  static DeferredMaintenanceWindow fromJson(Map<String, dynamic> json) =>
      DeferredMaintenanceWindow();
}

class DeleteClusterResult {
  final Cluster cluster;

  DeleteClusterResult({
    this.cluster,
  });
  static DeleteClusterResult fromJson(Map<String, dynamic> json) =>
      DeleteClusterResult();
}

class DeleteClusterSnapshotMessage {
  /// The unique identifier of the manual snapshot to be deleted.
  ///
  /// Constraints: Must be the name of an existing snapshot that is in the
  /// `available`, `failed`, or `cancelled` state.
  final String snapshotIdentifier;

  /// The unique identifier of the cluster the snapshot was created from. This
  /// parameter is required if your IAM user has a policy containing a snapshot
  /// resource element that specifies anything other than * for the cluster
  /// name.
  ///
  /// Constraints: Must be the name of valid cluster.
  final String snapshotClusterIdentifier;

  DeleteClusterSnapshotMessage({
    @required this.snapshotIdentifier,
    this.snapshotClusterIdentifier,
  });
}

class DeleteClusterSnapshotResult {
  final Snapshot snapshot;

  DeleteClusterSnapshotResult({
    this.snapshot,
  });
  static DeleteClusterSnapshotResult fromJson(Map<String, dynamic> json) =>
      DeleteClusterSnapshotResult();
}

class DescribeDefaultClusterParametersResult {
  final DefaultClusterParameters defaultClusterParameters;

  DescribeDefaultClusterParametersResult({
    this.defaultClusterParameters,
  });
  static DescribeDefaultClusterParametersResult fromJson(
          Map<String, dynamic> json) =>
      DescribeDefaultClusterParametersResult();
}

class DescribeSnapshotSchedulesOutputMessage {
  /// A list of SnapshotSchedules.
  final List<SnapshotSchedule> snapshotSchedules;

  /// A value that indicates the starting point for the next set of response
  /// records in a subsequent request. If a value is returned in a response, you
  /// can retrieve the next set of records by providing this returned marker
  /// value in the `marker` parameter and retrying the command. If the `marker`
  /// field is empty, all response records have been retrieved for the request.
  final String marker;

  DescribeSnapshotSchedulesOutputMessage({
    this.snapshotSchedules,
    this.marker,
  });
  static DescribeSnapshotSchedulesOutputMessage fromJson(
          Map<String, dynamic> json) =>
      DescribeSnapshotSchedulesOutputMessage();
}

class DisableSnapshotCopyResult {
  final Cluster cluster;

  DisableSnapshotCopyResult({
    this.cluster,
  });
  static DisableSnapshotCopyResult fromJson(Map<String, dynamic> json) =>
      DisableSnapshotCopyResult();
}

/// Describes an Amazon EC2 security group.
class Ec2SecurityGroup {
  /// The status of the EC2 security group.
  final String status;

  /// The name of the EC2 Security Group.
  final String ec2SecurityGroupName;

  /// The AWS ID of the owner of the EC2 security group specified in the
  /// `EC2SecurityGroupName` field.
  final String ec2SecurityGroupOwnerId;

  /// The list of tags for the EC2 security group.
  final List<Tag> tags;

  Ec2SecurityGroup({
    this.status,
    this.ec2SecurityGroupName,
    this.ec2SecurityGroupOwnerId,
    this.tags,
  });
  static Ec2SecurityGroup fromJson(Map<String, dynamic> json) =>
      Ec2SecurityGroup();
}

/// Describes the status of the elastic IP (EIP) address.
class ElasticIpStatus {
  /// The elastic IP (EIP) address for the cluster.
  final String elasticIp;

  /// The status of the elastic IP (EIP) address.
  final String status;

  ElasticIpStatus({
    this.elasticIp,
    this.status,
  });
  static ElasticIpStatus fromJson(Map<String, dynamic> json) =>
      ElasticIpStatus();
}

class EnableSnapshotCopyResult {
  final Cluster cluster;

  EnableSnapshotCopyResult({
    this.cluster,
  });
  static EnableSnapshotCopyResult fromJson(Map<String, dynamic> json) =>
      EnableSnapshotCopyResult();
}

/// Describes a connection endpoint.
class Endpoint {
  /// The DNS address of the Cluster.
  final String address;

  /// The port that the database engine is listening on.
  final int port;

  Endpoint({
    this.address,
    this.port,
  });
  static Endpoint fromJson(Map<String, dynamic> json) => Endpoint();
}

/// Describes an event.
class Event {
  /// The identifier for the source of the event.
  final String sourceIdentifier;

  /// The source type for this event.
  final String sourceType;

  /// The text of this event.
  final String message;

  /// A list of the event categories.
  ///
  /// Values: Configuration, Management, Monitoring, Security
  final List<String> eventCategories;

  /// The severity of the event.
  ///
  /// Values: ERROR, INFO
  final String severity;

  /// The date and time of the event.
  final DateTime date;

  /// The identifier of the event.
  final String eventId;

  Event({
    this.sourceIdentifier,
    this.sourceType,
    this.message,
    this.eventCategories,
    this.severity,
    this.date,
    this.eventId,
  });
  static Event fromJson(Map<String, dynamic> json) => Event();
}

/// Describes event categories.
class EventCategoriesMap {
  /// The source type, such as cluster or cluster-snapshot, that the returned
  /// categories belong to.
  final String sourceType;

  /// The events in the event category.
  final List<EventInfoMap> events;

  EventCategoriesMap({
    this.sourceType,
    this.events,
  });
  static EventCategoriesMap fromJson(Map<String, dynamic> json) =>
      EventCategoriesMap();
}

class EventCategoriesMessage {
  /// A list of event categories descriptions.
  final List<EventCategoriesMap> eventCategoriesMapList;

  EventCategoriesMessage({
    this.eventCategoriesMapList,
  });
  static EventCategoriesMessage fromJson(Map<String, dynamic> json) =>
      EventCategoriesMessage();
}

/// Describes event information.
class EventInfoMap {
  /// The identifier of an Amazon Redshift event.
  final String eventId;

  /// The category of an Amazon Redshift event.
  final List<String> eventCategories;

  /// The description of an Amazon Redshift event.
  final String eventDescription;

  /// The severity of the event.
  ///
  /// Values: ERROR, INFO
  final String severity;

  EventInfoMap({
    this.eventId,
    this.eventCategories,
    this.eventDescription,
    this.severity,
  });
  static EventInfoMap fromJson(Map<String, dynamic> json) => EventInfoMap();
}

/// Describes event subscriptions.
class EventSubscription {
  /// The AWS customer account associated with the Amazon Redshift event
  /// notification subscription.
  final String customerAwsId;

  /// The name of the Amazon Redshift event notification subscription.
  final String custSubscriptionId;

  /// The Amazon Resource Name (ARN) of the Amazon SNS topic used by the event
  /// notification subscription.
  final String snsTopicArn;

  /// The status of the Amazon Redshift event notification subscription.
  ///
  /// Constraints:
  ///
  /// *   Can be one of the following: active | no-permission | topic-not-exist
  ///
  /// *   The status "no-permission" indicates that Amazon Redshift no longer
  /// has permission to post to the Amazon SNS topic. The status
  /// "topic-not-exist" indicates that the topic was deleted after the
  /// subscription was created.
  final String status;

  /// The date and time the Amazon Redshift event notification subscription was
  /// created.
  final DateTime subscriptionCreationTime;

  /// The source type of the events returned the Amazon Redshift event
  /// notification, such as cluster, or cluster-snapshot.
  final String sourceType;

  /// A list of the sources that publish events to the Amazon Redshift event
  /// notification subscription.
  final List<String> sourceIdsList;

  /// The list of Amazon Redshift event categories specified in the event
  /// notification subscription.
  ///
  /// Values: Configuration, Management, Monitoring, Security
  final List<String> eventCategoriesList;

  /// The event severity specified in the Amazon Redshift event notification
  /// subscription.
  ///
  /// Values: ERROR, INFO
  final String severity;

  /// A boolean value indicating whether the subscription is enabled; `true`
  /// indicates that the subscription is enabled.
  final bool enabled;

  /// The list of tags for the event subscription.
  final List<Tag> tags;

  EventSubscription({
    this.customerAwsId,
    this.custSubscriptionId,
    this.snsTopicArn,
    this.status,
    this.subscriptionCreationTime,
    this.sourceType,
    this.sourceIdsList,
    this.eventCategoriesList,
    this.severity,
    this.enabled,
    this.tags,
  });
  static EventSubscription fromJson(Map<String, dynamic> json) =>
      EventSubscription();
}

class EventSubscriptionsMessage {
  /// A value that indicates the starting point for the next set of response
  /// records in a subsequent request. If a value is returned in a response, you
  /// can retrieve the next set of records by providing this returned marker
  /// value in the `Marker` parameter and retrying the command. If the `Marker`
  /// field is empty, all response records have been retrieved for the request.
  final String marker;

  /// A list of event subscriptions.
  final List<EventSubscription> eventSubscriptionsList;

  EventSubscriptionsMessage({
    this.marker,
    this.eventSubscriptionsList,
  });
  static EventSubscriptionsMessage fromJson(Map<String, dynamic> json) =>
      EventSubscriptionsMessage();
}

class EventsMessage {
  /// A value that indicates the starting point for the next set of response
  /// records in a subsequent request. If a value is returned in a response, you
  /// can retrieve the next set of records by providing this returned marker
  /// value in the `Marker` parameter and retrying the command. If the `Marker`
  /// field is empty, all response records have been retrieved for the request.
  final String marker;

  /// A list of `Event` instances.
  final List<Event> events;

  EventsMessage({
    this.marker,
    this.events,
  });
  static EventsMessage fromJson(Map<String, dynamic> json) => EventsMessage();
}

class GetReservedNodeExchangeOfferingsOutputMessage {
  /// An optional parameter that specifies the starting point for returning a
  /// set of response records. When the results of a
  /// `GetReservedNodeExchangeOfferings` request exceed the value specified in
  /// MaxRecords, Amazon Redshift returns a value in the marker field of the
  /// response. You can retrieve the next set of response records by providing
  /// the returned marker value in the marker parameter and retrying the
  /// request.
  final String marker;

  /// Returns an array of ReservedNodeOffering objects.
  final List<ReservedNodeOffering> reservedNodeOfferings;

  GetReservedNodeExchangeOfferingsOutputMessage({
    this.marker,
    this.reservedNodeOfferings,
  });
  static GetReservedNodeExchangeOfferingsOutputMessage fromJson(
          Map<String, dynamic> json) =>
      GetReservedNodeExchangeOfferingsOutputMessage();
}

/// Returns information about an HSM client certificate. The certificate is
/// stored in a secure Hardware Storage Module (HSM), and used by the Amazon
/// Redshift cluster to encrypt data files.
class HsmClientCertificate {
  /// The identifier of the HSM client certificate.
  final String hsmClientCertificateIdentifier;

  /// The public key that the Amazon Redshift cluster will use to connect to the
  /// HSM. You must register the public key in the HSM.
  final String hsmClientCertificatePublicKey;

  /// The list of tags for the HSM client certificate.
  final List<Tag> tags;

  HsmClientCertificate({
    this.hsmClientCertificateIdentifier,
    this.hsmClientCertificatePublicKey,
    this.tags,
  });
  static HsmClientCertificate fromJson(Map<String, dynamic> json) =>
      HsmClientCertificate();
}

class HsmClientCertificateMessage {
  /// A value that indicates the starting point for the next set of response
  /// records in a subsequent request. If a value is returned in a response, you
  /// can retrieve the next set of records by providing this returned marker
  /// value in the `Marker` parameter and retrying the command. If the `Marker`
  /// field is empty, all response records have been retrieved for the request.
  final String marker;

  /// A list of the identifiers for one or more HSM client certificates used by
  /// Amazon Redshift clusters to store and retrieve database encryption keys in
  /// an HSM.
  final List<HsmClientCertificate> hsmClientCertificates;

  HsmClientCertificateMessage({
    this.marker,
    this.hsmClientCertificates,
  });
  static HsmClientCertificateMessage fromJson(Map<String, dynamic> json) =>
      HsmClientCertificateMessage();
}

/// Returns information about an HSM configuration, which is an object that
/// describes to Amazon Redshift clusters the information they require to
/// connect to an HSM where they can store database encryption keys.
class HsmConfiguration {
  /// The name of the Amazon Redshift HSM configuration.
  final String hsmConfigurationIdentifier;

  /// A text description of the HSM configuration.
  final String description;

  /// The IP address that the Amazon Redshift cluster must use to access the
  /// HSM.
  final String hsmIpAddress;

  /// The name of the partition in the HSM where the Amazon Redshift clusters
  /// will store their database encryption keys.
  final String hsmPartitionName;

  /// The list of tags for the HSM configuration.
  final List<Tag> tags;

  HsmConfiguration({
    this.hsmConfigurationIdentifier,
    this.description,
    this.hsmIpAddress,
    this.hsmPartitionName,
    this.tags,
  });
  static HsmConfiguration fromJson(Map<String, dynamic> json) =>
      HsmConfiguration();
}

class HsmConfigurationMessage {
  /// A value that indicates the starting point for the next set of response
  /// records in a subsequent request. If a value is returned in a response, you
  /// can retrieve the next set of records by providing this returned marker
  /// value in the `Marker` parameter and retrying the command. If the `Marker`
  /// field is empty, all response records have been retrieved for the request.
  final String marker;

  /// A list of `HsmConfiguration` objects.
  final List<HsmConfiguration> hsmConfigurations;

  HsmConfigurationMessage({
    this.marker,
    this.hsmConfigurations,
  });
  static HsmConfigurationMessage fromJson(Map<String, dynamic> json) =>
      HsmConfigurationMessage();
}

/// Describes the status of changes to HSM settings.
class HsmStatus {
  /// Specifies the name of the HSM client certificate the Amazon Redshift
  /// cluster uses to retrieve the data encryption keys stored in an HSM.
  final String hsmClientCertificateIdentifier;

  /// Specifies the name of the HSM configuration that contains the information
  /// the Amazon Redshift cluster can use to retrieve and store keys in an HSM.
  final String hsmConfigurationIdentifier;

  /// Reports whether the Amazon Redshift cluster has finished applying any HSM
  /// settings changes specified in a modify cluster command.
  ///
  /// Values: active, applying
  final String status;

  HsmStatus({
    this.hsmClientCertificateIdentifier,
    this.hsmConfigurationIdentifier,
    this.status,
  });
  static HsmStatus fromJson(Map<String, dynamic> json) => HsmStatus();
}

/// Describes an IP range used in a security group.
class IPRange {
  /// The status of the IP range, for example, "authorized".
  final String status;

  /// The IP range in Classless Inter-Domain Routing (CIDR) notation.
  final String cidrip;

  /// The list of tags for the IP range.
  final List<Tag> tags;

  IPRange({
    this.status,
    this.cidrip,
    this.tags,
  });
  static IPRange fromJson(Map<String, dynamic> json) => IPRange();
}

/// Describes the status of logging for a cluster.
class LoggingStatus {
  ///  `true` if logging is on, `false` if logging is off.
  final bool loggingEnabled;

  /// The name of the S3 bucket where the log files are stored.
  final String bucketName;

  /// The prefix applied to the log file names.
  final String s3KeyPrefix;

  /// The last time that logs were delivered.
  final DateTime lastSuccessfulDeliveryTime;

  /// The last time when logs failed to be delivered.
  final DateTime lastFailureTime;

  /// The message indicating that logs failed to be delivered.
  final String lastFailureMessage;

  LoggingStatus({
    this.loggingEnabled,
    this.bucketName,
    this.s3KeyPrefix,
    this.lastSuccessfulDeliveryTime,
    this.lastFailureTime,
    this.lastFailureMessage,
  });
  static LoggingStatus fromJson(Map<String, dynamic> json) => LoggingStatus();
}

/// Defines a maintenance track that determines which Amazon Redshift version to
/// apply during a maintenance window. If the value for `MaintenanceTrack` is
/// `current`, the cluster is updated to the most recently certified maintenance
/// release. If the value is `trailing`, the cluster is updated to the
/// previously certified maintenance release.
class MaintenanceTrack {
  /// The name of the maintenance track. Possible values are `current` and
  /// `trailing`.
  final String maintenanceTrackName;

  /// The version number for the cluster release.
  final String databaseVersion;

  /// An array of UpdateTarget objects to update with the maintenance track.
  final List<UpdateTarget> updateTargets;

  MaintenanceTrack({
    this.maintenanceTrackName,
    this.databaseVersion,
    this.updateTargets,
  });
  static MaintenanceTrack fromJson(Map<String, dynamic> json) =>
      MaintenanceTrack();
}

class ModifyClusterDbRevisionResult {
  final Cluster cluster;

  ModifyClusterDbRevisionResult({
    this.cluster,
  });
  static ModifyClusterDbRevisionResult fromJson(Map<String, dynamic> json) =>
      ModifyClusterDbRevisionResult();
}

class ModifyClusterIamRolesResult {
  final Cluster cluster;

  ModifyClusterIamRolesResult({
    this.cluster,
  });
  static ModifyClusterIamRolesResult fromJson(Map<String, dynamic> json) =>
      ModifyClusterIamRolesResult();
}

class ModifyClusterMaintenanceResult {
  final Cluster cluster;

  ModifyClusterMaintenanceResult({
    this.cluster,
  });
  static ModifyClusterMaintenanceResult fromJson(Map<String, dynamic> json) =>
      ModifyClusterMaintenanceResult();
}

class ModifyClusterResult {
  final Cluster cluster;

  ModifyClusterResult({
    this.cluster,
  });
  static ModifyClusterResult fromJson(Map<String, dynamic> json) =>
      ModifyClusterResult();
}

class ModifyClusterSnapshotResult {
  final Snapshot snapshot;

  ModifyClusterSnapshotResult({
    this.snapshot,
  });
  static ModifyClusterSnapshotResult fromJson(Map<String, dynamic> json) =>
      ModifyClusterSnapshotResult();
}

class ModifyClusterSubnetGroupResult {
  final ClusterSubnetGroup clusterSubnetGroup;

  ModifyClusterSubnetGroupResult({
    this.clusterSubnetGroup,
  });
  static ModifyClusterSubnetGroupResult fromJson(Map<String, dynamic> json) =>
      ModifyClusterSubnetGroupResult();
}

class ModifyEventSubscriptionResult {
  final EventSubscription eventSubscription;

  ModifyEventSubscriptionResult({
    this.eventSubscription,
  });
  static ModifyEventSubscriptionResult fromJson(Map<String, dynamic> json) =>
      ModifyEventSubscriptionResult();
}

class ModifySnapshotCopyRetentionPeriodResult {
  final Cluster cluster;

  ModifySnapshotCopyRetentionPeriodResult({
    this.cluster,
  });
  static ModifySnapshotCopyRetentionPeriodResult fromJson(
          Map<String, dynamic> json) =>
      ModifySnapshotCopyRetentionPeriodResult();
}

/// Describes an orderable cluster option.
class OrderableClusterOption {
  /// The version of the orderable cluster.
  final String clusterVersion;

  /// The cluster type, for example `multi-node`.
  final String clusterType;

  /// The node type for the orderable cluster.
  final String nodeType;

  /// A list of availability zones for the orderable cluster.
  final List<AvailabilityZone> availabilityZones;

  OrderableClusterOption({
    this.clusterVersion,
    this.clusterType,
    this.nodeType,
    this.availabilityZones,
  });
  static OrderableClusterOption fromJson(Map<String, dynamic> json) =>
      OrderableClusterOption();
}

/// Contains the output from the DescribeOrderableClusterOptions action.
class OrderableClusterOptionsMessage {
  /// An `OrderableClusterOption` structure containing information about
  /// orderable options for the cluster.
  final List<OrderableClusterOption> orderableClusterOptions;

  /// A value that indicates the starting point for the next set of response
  /// records in a subsequent request. If a value is returned in a response, you
  /// can retrieve the next set of records by providing this returned marker
  /// value in the `Marker` parameter and retrying the command. If the `Marker`
  /// field is empty, all response records have been retrieved for the request.
  final String marker;

  OrderableClusterOptionsMessage({
    this.orderableClusterOptions,
    this.marker,
  });
  static OrderableClusterOptionsMessage fromJson(Map<String, dynamic> json) =>
      OrderableClusterOptionsMessage();
}

/// Describes a parameter in a cluster parameter group.
class Parameter {
  /// The name of the parameter.
  final String parameterName;

  /// The value of the parameter.
  final String parameterValue;

  /// A description of the parameter.
  final String description;

  /// The source of the parameter value, such as "engine-default" or "user".
  final String source;

  /// The data type of the parameter.
  final String dataType;

  /// The valid range of values for the parameter.
  final String allowedValues;

  /// Specifies how to apply the WLM configuration parameter. Some properties
  /// can be applied dynamically, while other properties require that any
  /// associated clusters be rebooted for the configuration changes to be
  /// applied. For more information about parameters and parameter groups, go to
  /// [Amazon Redshift Parameter Groups](https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-parameter-groups.html)
  /// in the _Amazon Redshift Cluster Management Guide_.
  final String applyType;

  /// If `true`, the parameter can be modified. Some parameters have security or
  /// operational implications that prevent them from being changed.
  final bool isModifiable;

  /// The earliest engine version to which the parameter can apply.
  final String minimumEngineVersion;

  Parameter({
    this.parameterName,
    this.parameterValue,
    this.description,
    this.source,
    this.dataType,
    this.allowedValues,
    this.applyType,
    this.isModifiable,
    this.minimumEngineVersion,
  });
  static Parameter fromJson(Map<String, dynamic> json) => Parameter();
}

/// Describes cluster attributes that are in a pending state. A change to one or
/// more the attributes was requested and is in progress or will be applied.
class PendingModifiedValues {
  /// The pending or in-progress change of the master user password for the
  /// cluster.
  final String masterUserPassword;

  /// The pending or in-progress change of the cluster's node type.
  final String nodeType;

  /// The pending or in-progress change of the number of nodes in the cluster.
  final int numberOfNodes;

  /// The pending or in-progress change of the cluster type.
  final String clusterType;

  /// The pending or in-progress change of the service version.
  final String clusterVersion;

  /// The pending or in-progress change of the automated snapshot retention
  /// period.
  final int automatedSnapshotRetentionPeriod;

  /// The pending or in-progress change of the new identifier for the cluster.
  final String clusterIdentifier;

  /// The pending or in-progress change of the ability to connect to the cluster
  /// from the public network.
  final bool publiclyAccessible;

  /// An option that specifies whether to create the cluster with enhanced VPC
  /// routing enabled. To create a cluster that uses enhanced VPC routing, the
  /// cluster must be in a VPC. For more information, see
  /// [Enhanced VPC Routing](https://docs.aws.amazon.com/redshift/latest/mgmt/enhanced-vpc-routing.html)
  /// in the Amazon Redshift Cluster Management Guide.
  ///
  /// If this option is `true`, enhanced VPC routing is enabled.
  ///
  /// Default: false
  final bool enhancedVpcRouting;

  /// The name of the maintenance track that the cluster will change to during
  /// the next maintenance window.
  final String maintenanceTrackName;

  /// The encryption type for a cluster. Possible values are: KMS and None. For
  /// the China region the possible values are None, and Legacy.
  final String encryptionType;

  PendingModifiedValues({
    this.masterUserPassword,
    this.nodeType,
    this.numberOfNodes,
    this.clusterType,
    this.clusterVersion,
    this.automatedSnapshotRetentionPeriod,
    this.clusterIdentifier,
    this.publiclyAccessible,
    this.enhancedVpcRouting,
    this.maintenanceTrackName,
    this.encryptionType,
  });
  static PendingModifiedValues fromJson(Map<String, dynamic> json) =>
      PendingModifiedValues();
}

class PurchaseReservedNodeOfferingResult {
  final ReservedNode reservedNode;

  PurchaseReservedNodeOfferingResult({
    this.reservedNode,
  });
  static PurchaseReservedNodeOfferingResult fromJson(
          Map<String, dynamic> json) =>
      PurchaseReservedNodeOfferingResult();
}

class RebootClusterResult {
  final Cluster cluster;

  RebootClusterResult({
    this.cluster,
  });
  static RebootClusterResult fromJson(Map<String, dynamic> json) =>
      RebootClusterResult();
}

/// Describes a recurring charge.
class RecurringCharge {
  /// The amount charged per the period of time specified by the recurring
  /// charge frequency.
  final double recurringChargeAmount;

  /// The frequency at which the recurring charge amount is applied.
  final String recurringChargeFrequency;

  RecurringCharge({
    this.recurringChargeAmount,
    this.recurringChargeFrequency,
  });
  static RecurringCharge fromJson(Map<String, dynamic> json) =>
      RecurringCharge();
}

/// Describes a reserved node. You can call the DescribeReservedNodeOfferings
/// API to obtain the available reserved node offerings.
class ReservedNode {
  /// The unique identifier for the reservation.
  final String reservedNodeId;

  /// The identifier for the reserved node offering.
  final String reservedNodeOfferingId;

  /// The node type of the reserved node.
  final String nodeType;

  /// The time the reservation started. You purchase a reserved node offering
  /// for a duration. This is the start time of that duration.
  final DateTime startTime;

  /// The duration of the node reservation in seconds.
  final int duration;

  /// The fixed cost Amazon Redshift charges you for this reserved node.
  final double fixedPrice;

  /// The hourly rate Amazon Redshift charges you for this reserved node.
  final double usagePrice;

  /// The currency code for the reserved cluster.
  final String currencyCode;

  /// The number of reserved compute nodes.
  final int nodeCount;

  /// The state of the reserved compute node.
  ///
  /// Possible Values:
  ///
  /// *   pending-payment-This reserved node has recently been purchased, and
  /// the sale has been approved, but payment has not yet been confirmed.
  ///
  /// *   active-This reserved node is owned by the caller and is available for
  /// use.
  ///
  /// *   payment-failed-Payment failed for the purchase attempt.
  ///
  /// *   retired-The reserved node is no longer available.
  ///
  /// *   exchanging-The owner is exchanging the reserved node for another
  /// reserved node.
  final String state;

  /// The anticipated utilization of the reserved node, as defined in the
  /// reserved node offering.
  final String offeringType;

  /// The recurring charges for the reserved node.
  final List<RecurringCharge> recurringCharges;

  final String reservedNodeOfferingType;

  ReservedNode({
    this.reservedNodeId,
    this.reservedNodeOfferingId,
    this.nodeType,
    this.startTime,
    this.duration,
    this.fixedPrice,
    this.usagePrice,
    this.currencyCode,
    this.nodeCount,
    this.state,
    this.offeringType,
    this.recurringCharges,
    this.reservedNodeOfferingType,
  });
  static ReservedNode fromJson(Map<String, dynamic> json) => ReservedNode();
}

/// Describes a reserved node offering.
class ReservedNodeOffering {
  /// The offering identifier.
  final String reservedNodeOfferingId;

  /// The node type offered by the reserved node offering.
  final String nodeType;

  /// The duration, in seconds, for which the offering will reserve the node.
  final int duration;

  /// The upfront fixed charge you will pay to purchase the specific reserved
  /// node offering.
  final double fixedPrice;

  /// The rate you are charged for each hour the cluster that is using the
  /// offering is running.
  final double usagePrice;

  /// The currency code for the compute nodes offering.
  final String currencyCode;

  /// The anticipated utilization of the reserved node, as defined in the
  /// reserved node offering.
  final String offeringType;

  /// The charge to your account regardless of whether you are creating any
  /// clusters using the node offering. Recurring charges are only in effect for
  /// heavy-utilization reserved nodes.
  final List<RecurringCharge> recurringCharges;

  final String reservedNodeOfferingType;

  ReservedNodeOffering({
    this.reservedNodeOfferingId,
    this.nodeType,
    this.duration,
    this.fixedPrice,
    this.usagePrice,
    this.currencyCode,
    this.offeringType,
    this.recurringCharges,
    this.reservedNodeOfferingType,
  });
  static ReservedNodeOffering fromJson(Map<String, dynamic> json) =>
      ReservedNodeOffering();
}

class ReservedNodeOfferingsMessage {
  /// A value that indicates the starting point for the next set of response
  /// records in a subsequent request. If a value is returned in a response, you
  /// can retrieve the next set of records by providing this returned marker
  /// value in the `Marker` parameter and retrying the command. If the `Marker`
  /// field is empty, all response records have been retrieved for the request.
  final String marker;

  /// A list of `ReservedNodeOffering` objects.
  final List<ReservedNodeOffering> reservedNodeOfferings;

  ReservedNodeOfferingsMessage({
    this.marker,
    this.reservedNodeOfferings,
  });
  static ReservedNodeOfferingsMessage fromJson(Map<String, dynamic> json) =>
      ReservedNodeOfferingsMessage();
}

class ReservedNodesMessage {
  /// A value that indicates the starting point for the next set of response
  /// records in a subsequent request. If a value is returned in a response, you
  /// can retrieve the next set of records by providing this returned marker
  /// value in the `Marker` parameter and retrying the command. If the `Marker`
  /// field is empty, all response records have been retrieved for the request.
  final String marker;

  /// The list of `ReservedNode` objects.
  final List<ReservedNode> reservedNodes;

  ReservedNodesMessage({
    this.marker,
    this.reservedNodes,
  });
  static ReservedNodesMessage fromJson(Map<String, dynamic> json) =>
      ReservedNodesMessage();
}

class ResizeClusterResult {
  final Cluster cluster;

  ResizeClusterResult({
    this.cluster,
  });
  static ResizeClusterResult fromJson(Map<String, dynamic> json) =>
      ResizeClusterResult();
}

/// Describes a resize operation.
class ResizeInfo {
  /// Returns the value `ClassicResize`.
  final String resizeType;

  /// A boolean value indicating if the resize operation can be cancelled.
  final bool allowCancelResize;

  ResizeInfo({
    this.resizeType,
    this.allowCancelResize,
  });
  static ResizeInfo fromJson(Map<String, dynamic> json) => ResizeInfo();
}

/// Describes the result of a cluster resize operation.
class ResizeProgressMessage {
  /// The node type that the cluster will have after the resize operation is
  /// complete.
  final String targetNodeType;

  /// The number of nodes that the cluster will have after the resize operation
  /// is complete.
  final int targetNumberOfNodes;

  /// The cluster type after the resize operation is complete.
  ///
  /// Valid Values: `multi-node` | `single-node`
  final String targetClusterType;

  /// The status of the resize operation.
  ///
  /// Valid Values: `NONE` | `IN_PROGRESS` | `FAILED` | `SUCCEEDED` |
  /// `CANCELLING`
  final String status;

  /// The names of tables that have been completely imported .
  ///
  /// Valid Values: List of table names.
  final List<String> importTablesCompleted;

  /// The names of tables that are being currently imported.
  ///
  /// Valid Values: List of table names.
  final List<String> importTablesInProgress;

  /// The names of tables that have not been yet imported.
  ///
  /// Valid Values: List of table names
  final List<String> importTablesNotStarted;

  /// The average rate of the resize operation over the last few minutes,
  /// measured in megabytes per second. After the resize operation completes,
  /// this value shows the average rate of the entire resize operation.
  final double avgResizeRateInMegaBytesPerSecond;

  /// The estimated total amount of data, in megabytes, on the cluster before
  /// the resize operation began.
  final BigInt totalResizeDataInMegaBytes;

  /// While the resize operation is in progress, this value shows the current
  /// amount of data, in megabytes, that has been processed so far. When the
  /// resize operation is complete, this value shows the total amount of data,
  /// in megabytes, on the cluster, which may be more or less than
  /// TotalResizeDataInMegaBytes (the estimated total amount of data before
  /// resize).
  final BigInt progressInMegaBytes;

  /// The amount of seconds that have elapsed since the resize operation began.
  /// After the resize operation completes, this value shows the total actual
  /// time, in seconds, for the resize operation.
  final BigInt elapsedTimeInSeconds;

  /// The estimated time remaining, in seconds, until the resize operation is
  /// complete. This value is calculated based on the average resize rate and
  /// the estimated amount of data remaining to be processed. Once the resize
  /// operation is complete, this value will be 0.
  final BigInt estimatedTimeToCompletionInSeconds;

  /// An enum with possible values of `ClassicResize` and `ElasticResize`. These
  /// values describe the type of resize operation being performed.
  final String resizeType;

  /// An optional string to provide additional details about the resize action.
  final String message;

  /// The type of encryption for the cluster after the resize is complete.
  ///
  /// Possible values are `KMS` and `None`. In the China region possible values
  /// are: `Legacy` and `None`.
  final String targetEncryptionType;

  /// The percent of data transferred from source cluster to target cluster.
  final double dataTransferProgressPercent;

  ResizeProgressMessage({
    this.targetNodeType,
    this.targetNumberOfNodes,
    this.targetClusterType,
    this.status,
    this.importTablesCompleted,
    this.importTablesInProgress,
    this.importTablesNotStarted,
    this.avgResizeRateInMegaBytesPerSecond,
    this.totalResizeDataInMegaBytes,
    this.progressInMegaBytes,
    this.elapsedTimeInSeconds,
    this.estimatedTimeToCompletionInSeconds,
    this.resizeType,
    this.message,
    this.targetEncryptionType,
    this.dataTransferProgressPercent,
  });
  static ResizeProgressMessage fromJson(Map<String, dynamic> json) =>
      ResizeProgressMessage();
}

class RestoreFromClusterSnapshotResult {
  final Cluster cluster;

  RestoreFromClusterSnapshotResult({
    this.cluster,
  });
  static RestoreFromClusterSnapshotResult fromJson(Map<String, dynamic> json) =>
      RestoreFromClusterSnapshotResult();
}

/// Describes the status of a cluster restore action. Returns null if the
/// cluster was not created by restoring a snapshot.
class RestoreStatus {
  /// The status of the restore action. Returns starting, restoring, completed,
  /// or failed.
  final String status;

  /// The number of megabytes per second being transferred from the backup
  /// storage. Returns the average rate for a completed backup.
  final double currentRestoreRateInMegaBytesPerSecond;

  /// The size of the set of snapshot data used to restore the cluster.
  final BigInt snapshotSizeInMegaBytes;

  /// The number of megabytes that have been transferred from snapshot storage.
  final BigInt progressInMegaBytes;

  /// The amount of time an in-progress restore has been running, or the amount
  /// of time it took a completed restore to finish.
  final BigInt elapsedTimeInSeconds;

  /// The estimate of the time remaining before the restore will complete.
  /// Returns 0 for a completed restore.
  final BigInt estimatedTimeToCompletionInSeconds;

  RestoreStatus({
    this.status,
    this.currentRestoreRateInMegaBytesPerSecond,
    this.snapshotSizeInMegaBytes,
    this.progressInMegaBytes,
    this.elapsedTimeInSeconds,
    this.estimatedTimeToCompletionInSeconds,
  });
  static RestoreStatus fromJson(Map<String, dynamic> json) => RestoreStatus();
}

class RestoreTableFromClusterSnapshotResult {
  final TableRestoreStatus tableRestoreStatus;

  RestoreTableFromClusterSnapshotResult({
    this.tableRestoreStatus,
  });
  static RestoreTableFromClusterSnapshotResult fromJson(
          Map<String, dynamic> json) =>
      RestoreTableFromClusterSnapshotResult();
}

/// Describes a `RevisionTarget`.
class RevisionTarget {
  /// A unique string that identifies the version to update the cluster to. You
  /// can use this value in ModifyClusterDbRevision.
  final String databaseRevision;

  /// A string that describes the changes and features that will be applied to
  /// the cluster when it is updated to the corresponding ClusterDbRevision.
  final String description;

  /// The date on which the database revision was released.
  final DateTime databaseRevisionReleaseDate;

  RevisionTarget({
    this.databaseRevision,
    this.description,
    this.databaseRevisionReleaseDate,
  });
  static RevisionTarget fromJson(Map<String, dynamic> json) => RevisionTarget();
}

class RevokeClusterSecurityGroupIngressResult {
  final ClusterSecurityGroup clusterSecurityGroup;

  RevokeClusterSecurityGroupIngressResult({
    this.clusterSecurityGroup,
  });
  static RevokeClusterSecurityGroupIngressResult fromJson(
          Map<String, dynamic> json) =>
      RevokeClusterSecurityGroupIngressResult();
}

class RevokeSnapshotAccessResult {
  final Snapshot snapshot;

  RevokeSnapshotAccessResult({
    this.snapshot,
  });
  static RevokeSnapshotAccessResult fromJson(Map<String, dynamic> json) =>
      RevokeSnapshotAccessResult();
}

class RotateEncryptionKeyResult {
  final Cluster cluster;

  RotateEncryptionKeyResult({
    this.cluster,
  });
  static RotateEncryptionKeyResult fromJson(Map<String, dynamic> json) =>
      RotateEncryptionKeyResult();
}

/// Describes a snapshot.
class Snapshot {
  /// The snapshot identifier that is provided in the request.
  final String snapshotIdentifier;

  /// The identifier of the cluster for which the snapshot was taken.
  final String clusterIdentifier;

  /// The time (in UTC format) when Amazon Redshift began the snapshot. A
  /// snapshot contains a copy of the cluster data as of this exact time.
  final DateTime snapshotCreateTime;

  /// The snapshot status. The value of the status depends on the API operation
  /// used:
  ///
  /// *    CreateClusterSnapshot and CopyClusterSnapshot returns status as
  /// "creating".
  ///
  /// *    DescribeClusterSnapshots returns status as "creating", "available",
  /// "final snapshot", or "failed".
  ///
  /// *    DeleteClusterSnapshot returns status as "deleted".
  final String status;

  /// The port that the cluster is listening on.
  final int port;

  /// The Availability Zone in which the cluster was created.
  final String availabilityZone;

  /// The time (UTC) when the cluster was originally created.
  final DateTime clusterCreateTime;

  /// The master user name for the cluster.
  final String masterUsername;

  /// The version ID of the Amazon Redshift engine that is running on the
  /// cluster.
  final String clusterVersion;

  /// The snapshot type. Snapshots created using CreateClusterSnapshot and
  /// CopyClusterSnapshot are of type "manual".
  final String snapshotType;

  /// The node type of the nodes in the cluster.
  final String nodeType;

  /// The number of nodes in the cluster.
  final int numberOfNodes;

  /// The name of the database that was created when the cluster was created.
  final String dbName;

  /// The VPC identifier of the cluster if the snapshot is from a cluster in a
  /// VPC. Otherwise, this field is not in the output.
  final String vpcId;

  /// If `true`, the data in the snapshot is encrypted at rest.
  final bool encrypted;

  /// The AWS Key Management Service (KMS) key ID of the encryption key that was
  /// used to encrypt data in the cluster from which the snapshot was taken.
  final String kmsKeyId;

  /// A boolean that indicates whether the snapshot data is encrypted using the
  /// HSM keys of the source cluster. `true` indicates that the data is
  /// encrypted using HSM keys.
  final bool encryptedWithHsm;

  /// A list of the AWS customer accounts authorized to restore the snapshot.
  /// Returns `null` if no accounts are authorized. Visible only to the snapshot
  /// owner.
  final List<AccountWithRestoreAccess> accountsWithRestoreAccess;

  /// For manual snapshots, the AWS customer account used to create or copy the
  /// snapshot. For automatic snapshots, the owner of the cluster. The owner can
  /// perform all snapshot actions, such as sharing a manual snapshot.
  final String ownerAccount;

  /// The size of the complete set of backup data that would be used to restore
  /// the cluster.
  final double totalBackupSizeInMegaBytes;

  /// The size of the incremental backup.
  final double actualIncrementalBackupSizeInMegaBytes;

  /// The number of megabytes that have been transferred to the snapshot backup.
  final double backupProgressInMegaBytes;

  /// The number of megabytes per second being transferred to the snapshot
  /// backup. Returns `0` for a completed backup.
  final double currentBackupRateInMegaBytesPerSecond;

  /// The estimate of the time remaining before the snapshot backup will
  /// complete. Returns `0` for a completed backup.
  final BigInt estimatedSecondsToCompletion;

  /// The amount of time an in-progress snapshot backup has been running, or the
  /// amount of time it took a completed backup to finish.
  final BigInt elapsedTimeInSeconds;

  /// The source region from which the snapshot was copied.
  final String sourceRegion;

  /// The list of tags for the cluster snapshot.
  final List<Tag> tags;

  /// The list of node types that this cluster snapshot is able to restore into.
  final List<String> restorableNodeTypes;

  /// An option that specifies whether to create the cluster with enhanced VPC
  /// routing enabled. To create a cluster that uses enhanced VPC routing, the
  /// cluster must be in a VPC. For more information, see
  /// [Enhanced VPC Routing](https://docs.aws.amazon.com/redshift/latest/mgmt/enhanced-vpc-routing.html)
  /// in the Amazon Redshift Cluster Management Guide.
  ///
  /// If this option is `true`, enhanced VPC routing is enabled.
  ///
  /// Default: false
  final bool enhancedVpcRouting;

  /// The name of the maintenance track for the snapshot.
  final String maintenanceTrackName;

  /// The number of days that a manual snapshot is retained. If the value is -1,
  /// the manual snapshot is retained indefinitely.
  ///
  /// The value must be either -1 or an integer between 1 and 3,653.
  final int manualSnapshotRetentionPeriod;

  /// The number of days until a manual snapshot will pass its retention period.
  final int manualSnapshotRemainingDays;

  /// A timestamp representing the start of the retention period for the
  /// snapshot.
  final DateTime snapshotRetentionStartTime;

  Snapshot({
    this.snapshotIdentifier,
    this.clusterIdentifier,
    this.snapshotCreateTime,
    this.status,
    this.port,
    this.availabilityZone,
    this.clusterCreateTime,
    this.masterUsername,
    this.clusterVersion,
    this.snapshotType,
    this.nodeType,
    this.numberOfNodes,
    this.dbName,
    this.vpcId,
    this.encrypted,
    this.kmsKeyId,
    this.encryptedWithHsm,
    this.accountsWithRestoreAccess,
    this.ownerAccount,
    this.totalBackupSizeInMegaBytes,
    this.actualIncrementalBackupSizeInMegaBytes,
    this.backupProgressInMegaBytes,
    this.currentBackupRateInMegaBytesPerSecond,
    this.estimatedSecondsToCompletion,
    this.elapsedTimeInSeconds,
    this.sourceRegion,
    this.tags,
    this.restorableNodeTypes,
    this.enhancedVpcRouting,
    this.maintenanceTrackName,
    this.manualSnapshotRetentionPeriod,
    this.manualSnapshotRemainingDays,
    this.snapshotRetentionStartTime,
  });
  static Snapshot fromJson(Map<String, dynamic> json) => Snapshot();
}

/// The snapshot copy grant that grants Amazon Redshift permission to encrypt
/// copied snapshots with the specified customer master key (CMK) from AWS KMS
/// in the destination region.
///
///  For more information about managing snapshot copy grants, go to
/// [Amazon Redshift Database Encryption](https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-db-encryption.html)
/// in the _Amazon Redshift Cluster Management Guide_.
class SnapshotCopyGrant {
  /// The name of the snapshot copy grant.
  final String snapshotCopyGrantName;

  /// The unique identifier of the customer master key (CMK) in AWS KMS to which
  /// Amazon Redshift is granted permission.
  final String kmsKeyId;

  /// A list of tag instances.
  final List<Tag> tags;

  SnapshotCopyGrant({
    this.snapshotCopyGrantName,
    this.kmsKeyId,
    this.tags,
  });
  static SnapshotCopyGrant fromJson(Map<String, dynamic> json) =>
      SnapshotCopyGrant();
}

class SnapshotCopyGrantMessage {
  /// An optional parameter that specifies the starting point to return a set of
  /// response records. When the results of a `DescribeSnapshotCopyGrant`
  /// request exceed the value specified in `MaxRecords`, AWS returns a value in
  /// the `Marker` field of the response. You can retrieve the next set of
  /// response records by providing the returned marker value in the `Marker`
  /// parameter and retrying the request.
  ///
  /// Constraints: You can specify either the **SnapshotCopyGrantName**
  /// parameter or the **Marker** parameter, but not both.
  final String marker;

  /// The list of `SnapshotCopyGrant` objects.
  final List<SnapshotCopyGrant> snapshotCopyGrants;

  SnapshotCopyGrantMessage({
    this.marker,
    this.snapshotCopyGrants,
  });
  static SnapshotCopyGrantMessage fromJson(Map<String, dynamic> json) =>
      SnapshotCopyGrantMessage();
}

/// Describes the errors returned by a snapshot.
class SnapshotErrorMessage {
  /// A unique identifier for the snapshot returning the error.
  final String snapshotIdentifier;

  /// A unique identifier for the cluster.
  final String snapshotClusterIdentifier;

  /// The failure code for the error.
  final String failureCode;

  /// The text message describing the error.
  final String failureReason;

  SnapshotErrorMessage({
    this.snapshotIdentifier,
    this.snapshotClusterIdentifier,
    this.failureCode,
    this.failureReason,
  });
  static SnapshotErrorMessage fromJson(Map<String, dynamic> json) =>
      SnapshotErrorMessage();
}

/// Contains the output from the DescribeClusterSnapshots action.
class SnapshotMessage {
  /// A value that indicates the starting point for the next set of response
  /// records in a subsequent request. If a value is returned in a response, you
  /// can retrieve the next set of records by providing this returned marker
  /// value in the `Marker` parameter and retrying the command. If the `Marker`
  /// field is empty, all response records have been retrieved for the request.
  final String marker;

  /// A list of Snapshot instances.
  final List<Snapshot> snapshots;

  SnapshotMessage({
    this.marker,
    this.snapshots,
  });
  static SnapshotMessage fromJson(Map<String, dynamic> json) =>
      SnapshotMessage();
}

/// Describes a snapshot schedule. You can set a regular interval for creating
/// snapshots of a cluster. You can also schedule snapshots for specific dates.
class SnapshotSchedule {
  /// A list of ScheduleDefinitions.
  final List<String> scheduleDefinitions;

  /// A unique identifier for the schedule.
  final String scheduleIdentifier;

  /// The description of the schedule.
  final String scheduleDescription;

  /// An optional set of tags describing the schedule.
  final List<Tag> tags;

  final List<DateTime> nextInvocations;

  /// The number of clusters associated with the schedule.
  final int associatedClusterCount;

  /// A list of clusters associated with the schedule. A maximum of 100 clusters
  /// is returned.
  final List<ClusterAssociatedToSchedule> associatedClusters;

  SnapshotSchedule({
    this.scheduleDefinitions,
    this.scheduleIdentifier,
    this.scheduleDescription,
    this.tags,
    this.nextInvocations,
    this.associatedClusterCount,
    this.associatedClusters,
  });
  static SnapshotSchedule fromJson(Map<String, dynamic> json) =>
      SnapshotSchedule();
}

/// Describes a sorting entity
class SnapshotSortingEntity {
  /// The category for sorting the snapshots.
  final String attribute;

  /// The order for listing the attributes.
  final String sortOrder;

  SnapshotSortingEntity({
    @required this.attribute,
    this.sortOrder,
  });
}

/// Describes a subnet.
class Subnet {
  /// The identifier of the subnet.
  final String subnetIdentifier;

  final AvailabilityZone subnetAvailabilityZone;

  /// The status of the subnet.
  final String subnetStatus;

  Subnet({
    this.subnetIdentifier,
    this.subnetAvailabilityZone,
    this.subnetStatus,
  });
  static Subnet fromJson(Map<String, dynamic> json) => Subnet();
}

/// Describes the operations that are allowed on a maintenance track.
class SupportedOperation {
  /// A list of the supported operations.
  final String operationName;

  SupportedOperation({
    this.operationName,
  });
  static SupportedOperation fromJson(Map<String, dynamic> json) =>
      SupportedOperation();
}

/// A list of supported platforms for orderable clusters.
class SupportedPlatform {
  final String name;

  SupportedPlatform({
    this.name,
  });
  static SupportedPlatform fromJson(Map<String, dynamic> json) =>
      SupportedPlatform();
}

/// Describes the status of a RestoreTableFromClusterSnapshot operation.
class TableRestoreStatus {
  /// The unique identifier for the table restore request.
  final String tableRestoreRequestId;

  /// A value that describes the current state of the table restore request.
  ///
  /// Valid Values: `SUCCEEDED`, `FAILED`, `CANCELED`, `PENDING`, `IN_PROGRESS`
  final String status;

  /// A description of the status of the table restore request. Status values
  /// include `SUCCEEDED`, `FAILED`, `CANCELED`, `PENDING`, `IN_PROGRESS`.
  final String message;

  /// The time that the table restore request was made, in Universal Coordinated
  /// Time (UTC).
  final DateTime requestTime;

  /// The amount of data restored to the new table so far, in megabytes (MB).
  final BigInt progressInMegaBytes;

  /// The total amount of data to restore to the new table, in megabytes (MB).
  final BigInt totalDataInMegaBytes;

  /// The identifier of the Amazon Redshift cluster that the table is being
  /// restored to.
  final String clusterIdentifier;

  /// The identifier of the snapshot that the table is being restored from.
  final String snapshotIdentifier;

  /// The name of the source database that contains the table being restored.
  final String sourceDatabaseName;

  /// The name of the source schema that contains the table being restored.
  final String sourceSchemaName;

  /// The name of the source table being restored.
  final String sourceTableName;

  /// The name of the database to restore the table to.
  final String targetDatabaseName;

  /// The name of the schema to restore the table to.
  final String targetSchemaName;

  /// The name of the table to create as a result of the table restore request.
  final String newTableName;

  TableRestoreStatus({
    this.tableRestoreRequestId,
    this.status,
    this.message,
    this.requestTime,
    this.progressInMegaBytes,
    this.totalDataInMegaBytes,
    this.clusterIdentifier,
    this.snapshotIdentifier,
    this.sourceDatabaseName,
    this.sourceSchemaName,
    this.sourceTableName,
    this.targetDatabaseName,
    this.targetSchemaName,
    this.newTableName,
  });
  static TableRestoreStatus fromJson(Map<String, dynamic> json) =>
      TableRestoreStatus();
}

class TableRestoreStatusMessage {
  /// A list of status details for one or more table restore requests.
  final List<TableRestoreStatus> tableRestoreStatusDetails;

  /// A pagination token that can be used in a subsequent
  /// DescribeTableRestoreStatus request.
  final String marker;

  TableRestoreStatusMessage({
    this.tableRestoreStatusDetails,
    this.marker,
  });
  static TableRestoreStatusMessage fromJson(Map<String, dynamic> json) =>
      TableRestoreStatusMessage();
}

/// A tag consisting of a name/value pair for a resource.
class Tag {
  /// The key, or name, for the resource tag.
  final String key;

  /// The value for the resource tag.
  final String value;

  Tag({
    this.key,
    this.value,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag();
}

/// A tag and its associated resource.
class TaggedResource {
  /// The tag for the resource.
  final Tag tag;

  /// The Amazon Resource Name (ARN) with which the tag is associated, for
  /// example: `arn:aws:redshift:us-east-1:123456789:cluster:t1`.
  final String resourceName;

  /// The type of resource with which the tag is associated. Valid resource
  /// types are:
  ///
  /// *   Cluster
  ///
  /// *   CIDR/IP
  ///
  /// *   EC2 security group
  ///
  /// *   Snapshot
  ///
  /// *   Cluster security group
  ///
  /// *   Subnet group
  ///
  /// *   HSM connection
  ///
  /// *   HSM certificate
  ///
  /// *   Parameter group
  ///
  ///
  /// For more information about Amazon Redshift resource types and constructing
  /// ARNs, go to
  /// [Constructing an Amazon Redshift Amazon Resource Name (ARN)](https://docs.aws.amazon.com/redshift/latest/mgmt/redshift-iam-access-control-overview.html#redshift-iam-access-control-specify-actions)
  /// in the Amazon Redshift Cluster Management Guide.
  final String resourceType;

  TaggedResource({
    this.tag,
    this.resourceName,
    this.resourceType,
  });
  static TaggedResource fromJson(Map<String, dynamic> json) => TaggedResource();
}

class TaggedResourceListMessage {
  /// A list of tags with their associated resources.
  final List<TaggedResource> taggedResources;

  /// A value that indicates the starting point for the next set of response
  /// records in a subsequent request. If a value is returned in a response, you
  /// can retrieve the next set of records by providing this returned marker
  /// value in the `Marker` parameter and retrying the command. If the `Marker`
  /// field is empty, all response records have been retrieved for the request.
  final String marker;

  TaggedResourceListMessage({
    this.taggedResources,
    this.marker,
  });
  static TaggedResourceListMessage fromJson(Map<String, dynamic> json) =>
      TaggedResourceListMessage();
}

class TrackListMessage {
  /// A list of maintenance tracks output by the `DescribeClusterTracks`
  /// operation.
  final List<MaintenanceTrack> maintenanceTracks;

  /// The starting point to return a set of response tracklist records. You can
  /// retrieve the next set of response records by providing the returned marker
  /// value in the `Marker` parameter and retrying the request.
  final String marker;

  TrackListMessage({
    this.maintenanceTracks,
    this.marker,
  });
  static TrackListMessage fromJson(Map<String, dynamic> json) =>
      TrackListMessage();
}

/// A maintenance track that you can switch the current track to.
class UpdateTarget {
  /// The name of the new maintenance track.
  final String maintenanceTrackName;

  /// The cluster version for the new maintenance track.
  final String databaseVersion;

  /// A list of operations supported by the maintenance track.
  final List<SupportedOperation> supportedOperations;

  UpdateTarget({
    this.maintenanceTrackName,
    this.databaseVersion,
    this.supportedOperations,
  });
  static UpdateTarget fromJson(Map<String, dynamic> json) => UpdateTarget();
}

/// Describes the members of a VPC security group.
class VpcSecurityGroupMembership {
  /// The identifier of the VPC security group.
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
