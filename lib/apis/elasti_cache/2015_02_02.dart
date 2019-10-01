import 'package:meta/meta.dart';

/// Amazon ElastiCache
///
/// Amazon ElastiCache is a web service that makes it easier to set up, operate,
/// and scale a distributed cache in the cloud.
///
/// With ElastiCache, customers get all of the benefits of a high-performance,
/// in-memory cache with less of the administrative burden involved in launching
/// and managing a distributed cache. The service makes setup, scaling, and
/// cluster failure handling much simpler than in a self-managed cache
/// deployment.
///
/// In addition, through integration with Amazon CloudWatch, customers get
/// enhanced visibility into the key performance statistics associated with
/// their cache and can receive alarms if a part of their cache runs hot.
class ElastiCacheApi {
  /// Adds up to 50 cost allocation tags to the named resource. A cost
  /// allocation tag is a key-value pair where the key and value are
  /// case-sensitive. You can use cost allocation tags to categorize and track
  /// your AWS costs.
  ///
  ///  When you apply tags to your ElastiCache resources, AWS generates a cost
  /// allocation report as a comma-separated value (CSV) file with your usage
  /// and costs aggregated by your tags. You can apply tags that represent
  /// business categories (such as cost centers, application names, or owners)
  /// to organize your costs across multiple services. For more information, see
  /// [Using Cost Allocation Tags in Amazon ElastiCache](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Tagging.html)
  /// in the _ElastiCache User Guide_.
  ///
  /// [resourceName]: The Amazon Resource Name (ARN) of the resource to which
  /// the tags are to be added, for example
  /// `arn:aws:elasticache:us-west-2:0123456789:cluster:myCluster` or
  /// `arn:aws:elasticache:us-west-2:0123456789:snapshot:mySnapshot`.
  /// ElastiCache resources are _cluster_ and _snapshot_.
  ///
  /// For more information about ARNs, see
  /// [Amazon Resource Names (ARNs) and AWS Service Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html).
  ///
  /// [tags]: A list of cost allocation tags to be added to this resource. A tag
  /// is a key-value pair. A tag key must be accompanied by a tag value.
  Future<TagListMessage> addTagsToResource(
      {@required String resourceName, @required List<Tag> tags}) async {
    return TagListMessage.fromJson({});
  }

  /// Allows network ingress to a cache security group. Applications using
  /// ElastiCache must be running on Amazon EC2, and Amazon EC2 security groups
  /// are used as the authorization mechanism.
  ///
  ///
  ///
  /// You cannot authorize ingress from an Amazon EC2 security group in one
  /// region to an ElastiCache cluster in another region.
  ///
  /// [cacheSecurityGroupName]: The cache security group that allows network
  /// ingress.
  ///
  /// [ec2SecurityGroupName]: The Amazon EC2 security group to be authorized for
  /// ingress to the cache security group.
  ///
  /// [ec2SecurityGroupOwnerId]: The AWS account number of the Amazon EC2
  /// security group owner. Note that this is not the same thing as an AWS
  /// access key ID - you must provide a valid AWS account number for this
  /// parameter.
  Future<AuthorizeCacheSecurityGroupIngressResult>
      authorizeCacheSecurityGroupIngress(
          {@required String cacheSecurityGroupName,
          @required String ec2SecurityGroupName,
          @required String ec2SecurityGroupOwnerId}) async {
    return AuthorizeCacheSecurityGroupIngressResult.fromJson({});
  }

  /// Apply the service update. For more information on service updates and
  /// applying them, see
  /// [Applying Service Updates](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/applying-updates.html).
  ///
  /// [replicationGroupIds]: The replication group IDs
  ///
  /// [serviceUpdateName]: The unique ID of the service update
  Future<UpdateActionResultsMessage> batchApplyUpdateAction(
      {@required List<String> replicationGroupIds,
      @required String serviceUpdateName}) async {
    return UpdateActionResultsMessage.fromJson({});
  }

  /// Stop the service update. For more information on service updates and
  /// stopping them, see
  /// [Stopping Service Updates](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/stopping-self-service-updates.html).
  ///
  /// [replicationGroupIds]: The replication group IDs
  ///
  /// [serviceUpdateName]: The unique ID of the service update
  Future<UpdateActionResultsMessage> batchStopUpdateAction(
      {@required List<String> replicationGroupIds,
      @required String serviceUpdateName}) async {
    return UpdateActionResultsMessage.fromJson({});
  }

  /// Makes a copy of an existing snapshot.
  ///
  ///  This operation is valid for Redis only.  Users or groups that have
  /// permissions to use the `CopySnapshot` operation can create their own
  /// Amazon S3 buckets and copy snapshots to it. To control access to your
  /// snapshots, use an IAM policy to control who has the ability to use the
  /// `CopySnapshot` operation. For more information about using IAM to control
  /// the use of ElastiCache operations, see
  /// [Exporting Snapshots](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-exporting.html)
  /// and
  /// [Authentication & Access Control](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/IAM.html).
  ///
  ///
  /// You could receive the following error messages.
  ///
  ///  **Error Messages**
  ///
  /// *    **Error Message:** The S3 bucket %s is outside of the region.
  ///
  ///      **Solution:** Create an Amazon S3 bucket in the same region as your
  /// snapshot. For more information, see
  /// [Step 1: Create an Amazon S3 Bucket](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-exporting.html#backups-exporting-create-s3-bucket)
  /// in the ElastiCache User Guide.
  ///
  /// *    **Error Message:** The S3 bucket %s does not exist.
  ///
  ///      **Solution:** Create an Amazon S3 bucket in the same region as your
  /// snapshot. For more information, see
  /// [Step 1: Create an Amazon S3 Bucket](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-exporting.html#backups-exporting-create-s3-bucket)
  /// in the ElastiCache User Guide.
  ///
  /// *    **Error Message:** The S3 bucket %s is not owned by the authenticated
  /// user.
  ///
  ///      **Solution:** Create an Amazon S3 bucket in the same region as your
  /// snapshot. For more information, see
  /// [Step 1: Create an Amazon S3 Bucket](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-exporting.html#backups-exporting-create-s3-bucket)
  /// in the ElastiCache User Guide.
  ///
  /// *    **Error Message:** The authenticated user does not have sufficient
  /// permissions to perform the desired activity.
  ///
  ///      **Solution:** Contact your system administrator to get the needed
  /// permissions.
  ///
  /// *    **Error Message:** The S3 bucket %s already contains an object with
  /// key %s.
  ///
  ///      **Solution:** Give the `TargetSnapshotName` a new and unique value.
  /// If exporting a snapshot, you could alternatively create a new Amazon S3
  /// bucket and use this same value for `TargetSnapshotName`.
  ///
  /// *    **Error Message:**  ElastiCache has not been granted READ permissions
  /// %s on the S3 Bucket.
  ///
  ///      **Solution:** Add List and Read permissions on the bucket. For more
  /// information, see
  /// [Step 2: Grant ElastiCache Access to Your Amazon S3 Bucket](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-exporting.html#backups-exporting-grant-access)
  /// in the ElastiCache User Guide.
  ///
  /// *    **Error Message:**  ElastiCache has not been granted WRITE
  /// permissions %s on the S3 Bucket.
  ///
  ///      **Solution:** Add Upload/Delete permissions on the bucket. For more
  /// information, see
  /// [Step 2: Grant ElastiCache Access to Your Amazon S3 Bucket](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-exporting.html#backups-exporting-grant-access)
  /// in the ElastiCache User Guide.
  ///
  /// *    **Error Message:**  ElastiCache has not been granted READ_ACP
  /// permissions %s on the S3 Bucket.
  ///
  ///      **Solution:** Add View Permissions on the bucket. For more
  /// information, see
  /// [Step 2: Grant ElastiCache Access to Your Amazon S3 Bucket](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-exporting.html#backups-exporting-grant-access)
  /// in the ElastiCache User Guide.
  ///
  /// [sourceSnapshotName]: The name of an existing snapshot from which to make
  /// a copy.
  ///
  /// [targetSnapshotName]: A name for the snapshot copy. ElastiCache does not
  /// permit overwriting a snapshot, therefore this name must be unique within
  /// its context - ElastiCache or an Amazon S3 bucket if exporting.
  ///
  /// [targetBucket]: The Amazon S3 bucket to which the snapshot is exported.
  /// This parameter is used only when exporting a snapshot for external access.
  ///
  /// When using this parameter to export a snapshot, be sure Amazon ElastiCache
  /// has the needed permissions to this S3 bucket. For more information, see
  /// [Step 2: Grant ElastiCache Access to Your Amazon S3 Bucket](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-exporting.html#backups-exporting-grant-access)
  /// in the _Amazon ElastiCache User Guide_.
  ///
  /// For more information, see
  /// [Exporting a Snapshot](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Snapshots.Exporting.html)
  /// in the _Amazon ElastiCache User Guide_.
  ///
  /// [kmsKeyId]: The ID of the KMS key used to encrypt the target snapshot.
  Future<CopySnapshotResult> copySnapshot(
      {@required String sourceSnapshotName,
      @required String targetSnapshotName,
      String targetBucket,
      String kmsKeyId}) async {
    return CopySnapshotResult.fromJson({});
  }

  /// Creates a cluster. All nodes in the cluster run the same
  /// protocol-compliant cache engine software, either Memcached or Redis.
  ///
  /// This operation is not supported for Redis (cluster mode enabled) clusters.
  ///
  /// [cacheClusterId]: The node group (shard) identifier. This parameter is
  /// stored as a lowercase string.
  ///
  ///  **Constraints:**
  ///
  /// *   A name must contain from 1 to 50 alphanumeric characters or hyphens.
  ///
  /// *   The first character must be a letter.
  ///
  /// *   A name cannot end with a hyphen or contain two consecutive hyphens.
  ///
  /// [replicationGroupId]: The ID of the replication group to which this
  /// cluster should belong. If this parameter is specified, the cluster is
  /// added to the specified replication group as a read replica; otherwise, the
  /// cluster is a standalone primary that is not part of any replication group.
  ///
  /// If the specified replication group is Multi-AZ enabled and the
  /// Availability Zone is not specified, the cluster is created in Availability
  /// Zones that provide the best spread of read replicas across Availability
  /// Zones.
  ///
  ///
  ///
  /// This parameter is only valid if the `Engine` parameter is `redis`.
  ///
  /// [azMode]: Specifies whether the nodes in this Memcached cluster are
  /// created in a single Availability Zone or created across multiple
  /// Availability Zones in the cluster's region.
  ///
  /// This parameter is only supported for Memcached clusters.
  ///
  /// If the `AZMode` and `PreferredAvailabilityZones` are not specified,
  /// ElastiCache assumes `single-az` mode.
  ///
  /// [preferredAvailabilityZone]: The EC2 Availability Zone in which the
  /// cluster is created.
  ///
  /// All nodes belonging to this Memcached cluster are placed in the preferred
  /// Availability Zone. If you want to create your nodes across multiple
  /// Availability Zones, use `PreferredAvailabilityZones`.
  ///
  /// Default: System chosen Availability Zone.
  ///
  /// [preferredAvailabilityZones]: A list of the Availability Zones in which
  /// cache nodes are created. The order of the zones in the list is not
  /// important.
  ///
  /// This option is only supported on Memcached.
  ///
  ///  If you are creating your cluster in an Amazon VPC (recommended) you can
  /// only locate nodes in Availability Zones that are associated with the
  /// subnets in the selected subnet group.
  ///
  /// The number of Availability Zones listed must equal the value of
  /// `NumCacheNodes`.
  ///
  /// If you want all the nodes in the same Availability Zone, use
  /// `PreferredAvailabilityZone` instead, or repeat the Availability Zone
  /// multiple times in the list.
  ///
  /// Default: System chosen Availability Zones.
  ///
  /// [numCacheNodes]: The initial number of cache nodes that the cluster has.
  ///
  /// For clusters running Redis, this value must be 1. For clusters running
  /// Memcached, this value must be between 1 and 20.
  ///
  /// If you need more than 20 nodes for your Memcached cluster, please fill out
  /// the ElastiCache Limit Increase Request form at
  /// [http://aws.amazon.com/contact-us/elasticache-node-limit-request/](http://aws.amazon.com/contact-us/elasticache-node-limit-request/).
  ///
  /// [cacheNodeType]: The compute and memory capacity of the nodes in the node
  /// group (shard).
  ///
  /// The following node types are supported by ElastiCache. Generally speaking,
  /// the current generation types provide more memory and computational power
  /// at lower cost when compared to their equivalent previous generation
  /// counterparts.
  ///
  /// *   General purpose:
  ///
  ///     *   Current generation:
  ///
  ///          **M5 node types:** `cache.m5.large`, `cache.m5.xlarge`,
  /// `cache.m5.2xlarge`, `cache.m5.4xlarge`, `cache.m5.12xlarge`,
  /// `cache.m5.24xlarge`
  ///
  ///          **M4 node types:** `cache.m4.large`, `cache.m4.xlarge`,
  /// `cache.m4.2xlarge`, `cache.m4.4xlarge`, `cache.m4.10xlarge`
  ///
  ///          **T2 node types:** `cache.t2.micro`, `cache.t2.small`,
  /// `cache.t2.medium`
  ///
  ///     *   Previous generation: (not recommended)
  ///
  ///          **T1 node types:** `cache.t1.micro`
  ///
  ///          **M1 node types:** `cache.m1.small`, `cache.m1.medium`,
  /// `cache.m1.large`, `cache.m1.xlarge`
  ///
  ///          **M3 node types:** `cache.m3.medium`, `cache.m3.large`,
  /// `cache.m3.xlarge`, `cache.m3.2xlarge`
  ///
  ///
  /// *   Compute optimized:
  ///
  ///     *   Previous generation: (not recommended)
  ///
  ///          **C1 node types:** `cache.c1.xlarge`
  ///
  ///
  /// *   Memory optimized:
  ///
  ///     *   Current generation:
  ///
  ///          **R5 node types:** `cache.r5.large`, `cache.r5.xlarge`,
  /// `cache.r5.2xlarge`, `cache.r5.4xlarge`, `cache.r5.12xlarge`,
  /// `cache.r5.24xlarge`
  ///
  ///          **R4 node types:** `cache.r4.large`, `cache.r4.xlarge`,
  /// `cache.r4.2xlarge`, `cache.r4.4xlarge`, `cache.r4.8xlarge`,
  /// `cache.r4.16xlarge`
  ///
  ///     *   Previous generation: (not recommended)
  ///
  ///          **M2 node types:** `cache.m2.xlarge`, `cache.m2.2xlarge`,
  /// `cache.m2.4xlarge`
  ///
  ///          **R3 node types:** `cache.r3.large`, `cache.r3.xlarge`,
  /// `cache.r3.2xlarge`, `cache.r3.4xlarge`, `cache.r3.8xlarge`
  ///
  ///
  ///
  ///  **Additional node type info**
  ///
  /// *   All current generation instance types are created in Amazon VPC by
  /// default.
  ///
  /// *   Redis append-only files (AOF) are not supported for T1 or T2
  /// instances.
  ///
  /// *   Redis Multi-AZ with automatic failover is not supported on T1
  /// instances.
  ///
  /// *   Redis configuration variables `appendonly` and `appendfsync` are not
  /// supported on Redis version 2.8.22 and later.
  ///
  /// [engine]: The name of the cache engine to be used for this cluster.
  ///
  /// Valid values for this parameter are: `memcached` | `redis`
  ///
  /// [engineVersion]: The version number of the cache engine to be used for
  /// this cluster. To view the supported cache engine versions, use the
  /// DescribeCacheEngineVersions operation.
  ///
  ///  **Important:** You can upgrade to a newer engine version (see
  /// [Selecting a Cache Engine and Version](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/SelectEngine.html#VersionManagement)),
  /// but you cannot downgrade to an earlier engine version. If you want to use
  /// an earlier engine version, you must delete the existing cluster or
  /// replication group and create it anew with the earlier engine version.
  ///
  /// [cacheParameterGroupName]: The name of the parameter group to associate
  /// with this cluster. If this argument is omitted, the default parameter
  /// group for the specified engine is used. You cannot use any parameter group
  /// which has `cluster-enabled='yes'` when creating a cluster.
  ///
  /// [cacheSubnetGroupName]: The name of the subnet group to be used for the
  /// cluster.
  ///
  /// Use this parameter only when you are creating a cluster in an Amazon
  /// Virtual Private Cloud (Amazon VPC).
  ///
  ///
  ///
  /// If you're going to launch your cluster in an Amazon VPC, you need to
  /// create a subnet group before you start creating a cluster. For more
  /// information, see
  /// [Subnets and Subnet Groups](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/SubnetGroups.html).
  ///
  /// [cacheSecurityGroupNames]: A list of security group names to associate
  /// with this cluster.
  ///
  /// Use this parameter only when you are creating a cluster outside of an
  /// Amazon Virtual Private Cloud (Amazon VPC).
  ///
  /// [securityGroupIds]: One or more VPC security groups associated with the
  /// cluster.
  ///
  /// Use this parameter only when you are creating a cluster in an Amazon
  /// Virtual Private Cloud (Amazon VPC).
  ///
  /// [tags]: A list of cost allocation tags to be added to this resource.
  ///
  /// [snapshotArns]: A single-element string list containing an Amazon Resource
  /// Name (ARN) that uniquely identifies a Redis RDB snapshot file stored in
  /// Amazon S3. The snapshot file is used to populate the node group (shard).
  /// The Amazon S3 object name in the ARN cannot contain any commas.
  ///
  ///  This parameter is only valid if the `Engine` parameter is `redis`.
  ///
  /// Example of an Amazon S3 ARN: `arn:aws:s3:::my_bucket/snapshot1.rdb`
  ///
  /// [snapshotName]: The name of a Redis snapshot from which to restore data
  /// into the new node group (shard). The snapshot status changes to
  /// `restoring` while the new node group (shard) is being created.
  ///
  ///
  ///
  /// This parameter is only valid if the `Engine` parameter is `redis`.
  ///
  /// [preferredMaintenanceWindow]: Specifies the weekly time range during which
  /// maintenance on the cluster is performed. It is specified as a range in the
  /// format ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance
  /// window is a 60 minute period. Valid values for `ddd` are:
  ///
  /// Specifies the weekly time range during which maintenance on the cluster is
  /// performed. It is specified as a range in the format
  /// ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance window is
  /// a 60 minute period.
  ///
  /// Valid values for `ddd` are:
  ///
  /// *    `sun`
  ///
  /// *    `mon`
  ///
  /// *    `tue`
  ///
  /// *    `wed`
  ///
  /// *    `thu`
  ///
  /// *    `fri`
  ///
  /// *    `sat`
  ///
  ///
  /// Example: `sun:23:00-mon:01:30`
  ///
  /// [port]: The port number on which each of the cache nodes accepts
  /// connections.
  ///
  /// [notificationTopicArn]: The Amazon Resource Name (ARN) of the Amazon
  /// Simple Notification Service (SNS) topic to which notifications are sent.
  ///
  ///
  ///
  /// The Amazon SNS topic owner must be the same as the cluster owner.
  ///
  /// [autoMinorVersionUpgrade]: This parameter is currently disabled.
  ///
  /// [snapshotRetentionLimit]: The number of days for which ElastiCache retains
  /// automatic snapshots before deleting them. For example, if you set
  /// `SnapshotRetentionLimit` to 5, a snapshot taken today is retained for 5
  /// days before being deleted.
  ///
  ///  This parameter is only valid if the `Engine` parameter is `redis`.
  ///
  /// Default: 0 (i.e., automatic backups are disabled for this cache cluster).
  ///
  /// [snapshotWindow]: The daily time range (in UTC) during which ElastiCache
  /// begins taking a daily snapshot of your node group (shard).
  ///
  /// Example: `05:00-09:00`
  ///
  /// If you do not specify this parameter, ElastiCache automatically chooses an
  /// appropriate time range.
  ///
  ///
  ///
  /// This parameter is only valid if the `Engine` parameter is `redis`.
  ///
  /// [authToken]:  **Reserved parameter.** The password used to access a
  /// password protected server.
  ///
  /// Password constraints:
  ///
  /// *   Must be only printable ASCII characters.
  ///
  /// *   Must be at least 16 characters and no more than 128 characters in
  /// length.
  ///
  /// *   Cannot contain any of the following characters: '/', '"', or '@'.
  ///
  ///
  /// For more information, see [AUTH password](http://redis.io/commands/AUTH)
  /// at http://redis.io/commands/AUTH.
  Future<CreateCacheClusterResult> createCacheCluster(String cacheClusterId,
      {String replicationGroupId,
      String azMode,
      String preferredAvailabilityZone,
      List<String> preferredAvailabilityZones,
      int numCacheNodes,
      String cacheNodeType,
      String engine,
      String engineVersion,
      String cacheParameterGroupName,
      String cacheSubnetGroupName,
      List<String> cacheSecurityGroupNames,
      List<String> securityGroupIds,
      List<Tag> tags,
      List<String> snapshotArns,
      String snapshotName,
      String preferredMaintenanceWindow,
      int port,
      String notificationTopicArn,
      bool autoMinorVersionUpgrade,
      int snapshotRetentionLimit,
      String snapshotWindow,
      String authToken}) async {
    return CreateCacheClusterResult.fromJson({});
  }

  /// Creates a new Amazon ElastiCache cache parameter group. An ElastiCache
  /// cache parameter group is a collection of parameters and their values that
  /// are applied to all of the nodes in any cluster or replication group using
  /// the CacheParameterGroup.
  ///
  /// A newly created CacheParameterGroup is an exact duplicate of the default
  /// parameter group for the CacheParameterGroupFamily. To customize the newly
  /// created CacheParameterGroup you can change the values of specific
  /// parameters. For more information, see:
  ///
  /// *
  /// [ModifyCacheParameterGroup](https://docs.aws.amazon.com/AmazonElastiCache/latest/APIReference/API_ModifyCacheParameterGroup.html)
  /// in the ElastiCache API Reference.
  ///
  /// *
  /// [Parameters and Parameter Groups](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/ParameterGroups.html)
  /// in the ElastiCache User Guide.
  ///
  /// [cacheParameterGroupName]: A user-specified name for the cache parameter
  /// group.
  ///
  /// [cacheParameterGroupFamily]: The name of the cache parameter group family
  /// that the cache parameter group can be used with.
  ///
  /// Valid values are: `memcached1.4` | `memcached1.5` | `redis2.6` |
  /// `redis2.8` | `redis3.2` | `redis4.0` | `redis5.0` |
  ///
  /// [description]: A user-specified description for the cache parameter group.
  Future<CreateCacheParameterGroupResult> createCacheParameterGroup(
      {@required String cacheParameterGroupName,
      @required String cacheParameterGroupFamily,
      @required String description}) async {
    return CreateCacheParameterGroupResult.fromJson({});
  }

  /// Creates a new cache security group. Use a cache security group to control
  /// access to one or more clusters.
  ///
  /// Cache security groups are only used when you are creating a cluster
  /// outside of an Amazon Virtual Private Cloud (Amazon VPC). If you are
  /// creating a cluster inside of a VPC, use a cache subnet group instead. For
  /// more information, see
  /// [CreateCacheSubnetGroup](https://docs.aws.amazon.com/AmazonElastiCache/latest/APIReference/API_CreateCacheSubnetGroup.html).
  ///
  /// [cacheSecurityGroupName]: A name for the cache security group. This value
  /// is stored as a lowercase string.
  ///
  /// Constraints: Must contain no more than 255 alphanumeric characters. Cannot
  /// be the word "Default".
  ///
  /// Example: `mysecuritygroup`
  ///
  /// [description]: A description for the cache security group.
  Future<CreateCacheSecurityGroupResult> createCacheSecurityGroup(
      {@required String cacheSecurityGroupName,
      @required String description}) async {
    return CreateCacheSecurityGroupResult.fromJson({});
  }

  /// Creates a new cache subnet group.
  ///
  /// Use this parameter only when you are creating a cluster in an Amazon
  /// Virtual Private Cloud (Amazon VPC).
  ///
  /// [cacheSubnetGroupName]: A name for the cache subnet group. This value is
  /// stored as a lowercase string.
  ///
  /// Constraints: Must contain no more than 255 alphanumeric characters or
  /// hyphens.
  ///
  /// Example: `mysubnetgroup`
  ///
  /// [cacheSubnetGroupDescription]: A description for the cache subnet group.
  ///
  /// [subnetIds]: A list of VPC subnet IDs for the cache subnet group.
  Future<CreateCacheSubnetGroupResult> createCacheSubnetGroup(
      {@required String cacheSubnetGroupName,
      @required String cacheSubnetGroupDescription,
      @required List<String> subnetIds}) async {
    return CreateCacheSubnetGroupResult.fromJson({});
  }

  /// Creates a Redis (cluster mode disabled) or a Redis (cluster mode enabled)
  /// replication group.
  ///
  /// A Redis (cluster mode disabled) replication group is a collection of
  /// clusters, where one of the clusters is a read/write primary and the others
  /// are read-only replicas. Writes to the primary are asynchronously
  /// propagated to the replicas.
  ///
  /// A Redis (cluster mode enabled) replication group is a collection of 1 to
  /// 90 node groups (shards). Each node group (shard) has one read/write
  /// primary node and up to 5 read-only replica nodes. Writes to the primary
  /// are asynchronously propagated to the replicas. Redis (cluster mode
  /// enabled) replication groups partition the data across node groups
  /// (shards).
  ///
  /// When a Redis (cluster mode disabled) replication group has been
  /// successfully created, you can add one or more read replicas to it, up to a
  /// total of 5 read replicas. You cannot alter a Redis (cluster mode enabled)
  /// replication group after it has been created. However, if you need to
  /// increase or decrease the number of node groups (console: shards), you can
  /// avail yourself of ElastiCache for Redis' enhanced backup and restore. For
  /// more information, see
  /// [Restoring From a Backup with Cluster Resizing](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-restoring.html)
  /// in the _ElastiCache User Guide_.
  ///
  ///
  ///
  /// This operation is valid for Redis only.
  ///
  /// [replicationGroupId]: The replication group identifier. This parameter is
  /// stored as a lowercase string.
  ///
  /// Constraints:
  ///
  /// *   A name must contain from 1 to 40 alphanumeric characters or hyphens.
  ///
  /// *   The first character must be a letter.
  ///
  /// *   A name cannot end with a hyphen or contain two consecutive hyphens.
  ///
  /// [replicationGroupDescription]: A user-created description for the
  /// replication group.
  ///
  /// [primaryClusterId]: The identifier of the cluster that serves as the
  /// primary for this replication group. This cluster must already exist and
  /// have a status of `available`.
  ///
  /// This parameter is not required if `NumCacheClusters`, `NumNodeGroups`, or
  /// `ReplicasPerNodeGroup` is specified.
  ///
  /// [automaticFailoverEnabled]: Specifies whether a read-only replica is
  /// automatically promoted to read/write primary if the existing primary
  /// fails.
  ///
  /// If `true`, Multi-AZ is enabled for this replication group. If `false`,
  /// Multi-AZ is disabled for this replication group.
  ///
  ///  `AutomaticFailoverEnabled` must be enabled for Redis (cluster mode
  /// enabled) replication groups.
  ///
  /// Default: false
  ///
  /// Amazon ElastiCache for Redis does not support Multi-AZ with automatic
  /// failover on:
  ///
  /// *   Redis versions earlier than 2.8.6.
  ///
  /// *   Redis (cluster mode disabled): T1 node types.
  ///
  /// *   Redis (cluster mode enabled): T1 node types.
  ///
  /// [numCacheClusters]: The number of clusters this replication group
  /// initially has.
  ///
  /// This parameter is not used if there is more than one node group (shard).
  /// You should use `ReplicasPerNodeGroup` instead.
  ///
  /// If `AutomaticFailoverEnabled` is `true`, the value of this parameter must
  /// be at least 2. If `AutomaticFailoverEnabled` is `false` you can omit this
  /// parameter (it will default to 1), or you can explicitly set it to a value
  /// between 2 and 6.
  ///
  /// The maximum permitted value for `NumCacheClusters` is 6 (1 primary plus 5
  /// replicas).
  ///
  /// [preferredCacheClusteraZs]: A list of EC2 Availability Zones in which the
  /// replication group's clusters are created. The order of the Availability
  /// Zones in the list is the order in which clusters are allocated. The
  /// primary cluster is created in the first AZ in the list.
  ///
  /// This parameter is not used if there is more than one node group (shard).
  /// You should use `NodeGroupConfiguration` instead.
  ///
  ///  If you are creating your replication group in an Amazon VPC
  /// (recommended), you can only locate clusters in Availability Zones
  /// associated with the subnets in the selected subnet group.
  ///
  /// The number of Availability Zones listed must equal the value of
  /// `NumCacheClusters`.
  ///
  /// Default: system chosen Availability Zones.
  ///
  /// [numNodeGroups]: An optional parameter that specifies the number of node
  /// groups (shards) for this Redis (cluster mode enabled) replication group.
  /// For Redis (cluster mode disabled) either omit this parameter or set it to
  /// 1.
  ///
  /// Default: 1
  ///
  /// [replicasPerNodeGroup]: An optional parameter that specifies the number of
  /// replica nodes in each node group (shard). Valid values are 0 to 5.
  ///
  /// [nodeGroupConfiguration]: A list of node group (shard) configuration
  /// options. Each node group (shard) configuration has the following members:
  /// `PrimaryAvailabilityZone`, `ReplicaAvailabilityZones`, `ReplicaCount`, and
  /// `Slots`.
  ///
  /// If you're creating a Redis (cluster mode disabled) or a Redis (cluster
  /// mode enabled) replication group, you can use this parameter to
  /// individually configure each node group (shard), or you can omit this
  /// parameter. However, when seeding a Redis (cluster mode enabled) cluster
  /// from a S3 rdb file, you must configure each node group (shard) using this
  /// parameter because you must specify the slots for each node group.
  ///
  /// [cacheNodeType]: The compute and memory capacity of the nodes in the node
  /// group (shard).
  ///
  /// The following node types are supported by ElastiCache. Generally speaking,
  /// the current generation types provide more memory and computational power
  /// at lower cost when compared to their equivalent previous generation
  /// counterparts.
  ///
  /// *   General purpose:
  ///
  ///     *   Current generation:
  ///
  ///          **M5 node types:** `cache.m5.large`, `cache.m5.xlarge`,
  /// `cache.m5.2xlarge`, `cache.m5.4xlarge`, `cache.m5.12xlarge`,
  /// `cache.m5.24xlarge`
  ///
  ///          **M4 node types:** `cache.m4.large`, `cache.m4.xlarge`,
  /// `cache.m4.2xlarge`, `cache.m4.4xlarge`, `cache.m4.10xlarge`
  ///
  ///          **T2 node types:** `cache.t2.micro`, `cache.t2.small`,
  /// `cache.t2.medium`
  ///
  ///     *   Previous generation: (not recommended)
  ///
  ///          **T1 node types:** `cache.t1.micro`
  ///
  ///          **M1 node types:** `cache.m1.small`, `cache.m1.medium`,
  /// `cache.m1.large`, `cache.m1.xlarge`
  ///
  ///          **M3 node types:** `cache.m3.medium`, `cache.m3.large`,
  /// `cache.m3.xlarge`, `cache.m3.2xlarge`
  ///
  ///
  /// *   Compute optimized:
  ///
  ///     *   Previous generation: (not recommended)
  ///
  ///          **C1 node types:** `cache.c1.xlarge`
  ///
  ///
  /// *   Memory optimized:
  ///
  ///     *   Current generation:
  ///
  ///          **R5 node types:** `cache.r5.large`, `cache.r5.xlarge`,
  /// `cache.r5.2xlarge`, `cache.r5.4xlarge`, `cache.r5.12xlarge`,
  /// `cache.r5.24xlarge`
  ///
  ///          **R4 node types:** `cache.r4.large`, `cache.r4.xlarge`,
  /// `cache.r4.2xlarge`, `cache.r4.4xlarge`, `cache.r4.8xlarge`,
  /// `cache.r4.16xlarge`
  ///
  ///     *   Previous generation: (not recommended)
  ///
  ///          **M2 node types:** `cache.m2.xlarge`, `cache.m2.2xlarge`,
  /// `cache.m2.4xlarge`
  ///
  ///          **R3 node types:** `cache.r3.large`, `cache.r3.xlarge`,
  /// `cache.r3.2xlarge`, `cache.r3.4xlarge`, `cache.r3.8xlarge`
  ///
  ///
  ///
  ///  **Additional node type info**
  ///
  /// *   All current generation instance types are created in Amazon VPC by
  /// default.
  ///
  /// *   Redis append-only files (AOF) are not supported for T1 or T2
  /// instances.
  ///
  /// *   Redis Multi-AZ with automatic failover is not supported on T1
  /// instances.
  ///
  /// *   Redis configuration variables `appendonly` and `appendfsync` are not
  /// supported on Redis version 2.8.22 and later.
  ///
  /// [engine]: The name of the cache engine to be used for the clusters in this
  /// replication group.
  ///
  /// [engineVersion]: The version number of the cache engine to be used for the
  /// clusters in this replication group. To view the supported cache engine
  /// versions, use the `DescribeCacheEngineVersions` operation.
  ///
  ///  **Important:** You can upgrade to a newer engine version (see
  /// [Selecting a Cache Engine and Version](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/SelectEngine.html#VersionManagement))
  /// in the _ElastiCache User Guide_, but you cannot downgrade to an earlier
  /// engine version. If you want to use an earlier engine version, you must
  /// delete the existing cluster or replication group and create it anew with
  /// the earlier engine version.
  ///
  /// [cacheParameterGroupName]: The name of the parameter group to associate
  /// with this replication group. If this argument is omitted, the default
  /// cache parameter group for the specified engine is used.
  ///
  ///  If you are restoring to an engine version that is different than the
  /// original, you must specify the default version of that version. For
  /// example, `CacheParameterGroupName=default.redis4.0`.
  ///
  /// If you are running Redis version 3.2.4 or later, only one node group
  /// (shard), and want to use a default parameter group, we recommend that you
  /// specify the parameter group by name.
  ///
  /// *   To create a Redis (cluster mode disabled) replication group, use
  /// `CacheParameterGroupName=default.redis3.2`.
  ///
  /// *   To create a Redis (cluster mode enabled) replication group, use
  /// `CacheParameterGroupName=default.redis3.2.cluster.on`.
  ///
  /// [cacheSubnetGroupName]: The name of the cache subnet group to be used for
  /// the replication group.
  ///
  ///
  ///
  /// If you're going to launch your cluster in an Amazon VPC, you need to
  /// create a subnet group before you start creating a cluster. For more
  /// information, see
  /// [Subnets and Subnet Groups](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/SubnetGroups.html).
  ///
  /// [cacheSecurityGroupNames]: A list of cache security group names to
  /// associate with this replication group.
  ///
  /// [securityGroupIds]: One or more Amazon VPC security groups associated with
  /// this replication group.
  ///
  /// Use this parameter only when you are creating a replication group in an
  /// Amazon Virtual Private Cloud (Amazon VPC).
  ///
  /// [tags]: A list of cost allocation tags to be added to this resource. Tags
  /// are comma-separated key,value pairs (e.g. Key=`myKey`, Value=`myKeyValue`.
  /// You can include multiple tags as shown following: Key=`myKey`,
  /// Value=`myKeyValue` Key=`mySecondKey`, Value=`mySecondKeyValue`.
  ///
  /// [snapshotArns]: A list of Amazon Resource Names (ARN) that uniquely
  /// identify the Redis RDB snapshot files stored in Amazon S3. The snapshot
  /// files are used to populate the new replication group. The Amazon S3 object
  /// name in the ARN cannot contain any commas. The new replication group will
  /// have the number of node groups (console: shards) specified by the
  /// parameter _NumNodeGroups_ or the number of node groups configured by
  /// _NodeGroupConfiguration_ regardless of the number of ARNs specified here.
  ///
  /// Example of an Amazon S3 ARN: `arn:aws:s3:::my_bucket/snapshot1.rdb`
  ///
  /// [snapshotName]: The name of a snapshot from which to restore data into the
  /// new replication group. The snapshot status changes to `restoring` while
  /// the new replication group is being created.
  ///
  /// [preferredMaintenanceWindow]: Specifies the weekly time range during which
  /// maintenance on the cluster is performed. It is specified as a range in the
  /// format ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance
  /// window is a 60 minute period. Valid values for `ddd` are:
  ///
  /// Specifies the weekly time range during which maintenance on the cluster is
  /// performed. It is specified as a range in the format
  /// ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance window is
  /// a 60 minute period.
  ///
  /// Valid values for `ddd` are:
  ///
  /// *    `sun`
  ///
  /// *    `mon`
  ///
  /// *    `tue`
  ///
  /// *    `wed`
  ///
  /// *    `thu`
  ///
  /// *    `fri`
  ///
  /// *    `sat`
  ///
  ///
  /// Example: `sun:23:00-mon:01:30`
  ///
  /// [port]: The port number on which each member of the replication group
  /// accepts connections.
  ///
  /// [notificationTopicArn]: The Amazon Resource Name (ARN) of the Amazon
  /// Simple Notification Service (SNS) topic to which notifications are sent.
  ///
  ///
  ///
  /// The Amazon SNS topic owner must be the same as the cluster owner.
  ///
  /// [autoMinorVersionUpgrade]: This parameter is currently disabled.
  ///
  /// [snapshotRetentionLimit]: The number of days for which ElastiCache retains
  /// automatic snapshots before deleting them. For example, if you set
  /// `SnapshotRetentionLimit` to 5, a snapshot that was taken today is retained
  /// for 5 days before being deleted.
  ///
  /// Default: 0 (i.e., automatic backups are disabled for this cluster).
  ///
  /// [snapshotWindow]: The daily time range (in UTC) during which ElastiCache
  /// begins taking a daily snapshot of your node group (shard).
  ///
  /// Example: `05:00-09:00`
  ///
  /// If you do not specify this parameter, ElastiCache automatically chooses an
  /// appropriate time range.
  ///
  /// [authToken]:  **Reserved parameter.** The password used to access a
  /// password protected server.
  ///
  ///  `AuthToken` can be specified only on replication groups where
  /// `TransitEncryptionEnabled` is `true`.
  ///
  ///  For HIPAA compliance, you must specify `TransitEncryptionEnabled` as
  /// `true`, an `AuthToken`, and a `CacheSubnetGroup`.
  ///
  /// Password constraints:
  ///
  /// *   Must be only printable ASCII characters.
  ///
  /// *   Must be at least 16 characters and no more than 128 characters in
  /// length.
  ///
  /// *   Cannot contain any of the following characters: '/', '"', or '@'.
  ///
  ///
  /// For more information, see [AUTH password](http://redis.io/commands/AUTH)
  /// at http://redis.io/commands/AUTH.
  ///
  /// [transitEncryptionEnabled]: A flag that enables in-transit encryption when
  /// set to `true`.
  ///
  /// You cannot modify the value of `TransitEncryptionEnabled` after the
  /// cluster is created. To enable in-transit encryption on a cluster you must
  /// set `TransitEncryptionEnabled` to `true` when you create a cluster.
  ///
  /// This parameter is valid only if the `Engine` parameter is `redis`, the
  /// `EngineVersion` parameter is `3.2.6`, `4.x` or later, and the cluster is
  /// being created in an Amazon VPC.
  ///
  /// If you enable in-transit encryption, you must also specify a value for
  /// `CacheSubnetGroup`.
  ///
  ///  **Required:** Only available when creating a replication group in an
  /// Amazon VPC using redis version `3.2.6`, `4.x` or later.
  ///
  /// Default: `false`
  ///
  ///
  ///
  /// For HIPAA compliance, you must specify `TransitEncryptionEnabled` as
  /// `true`, an `AuthToken`, and a `CacheSubnetGroup`.
  ///
  /// [atRestEncryptionEnabled]: A flag that enables encryption at rest when set
  /// to `true`.
  ///
  /// You cannot modify the value of `AtRestEncryptionEnabled` after the
  /// replication group is created. To enable encryption at rest on a
  /// replication group you must set `AtRestEncryptionEnabled` to `true` when
  /// you create the replication group.
  ///
  ///  **Required:** Only available when creating a replication group in an
  /// Amazon VPC using redis version `3.2.6`, `4.x` or later.
  ///
  /// Default: `false`
  ///
  /// [kmsKeyId]: The ID of the KMS key used to encrypt the disk on the cluster.
  Future<CreateReplicationGroupResult> createReplicationGroup(
      {@required String replicationGroupId,
      @required String replicationGroupDescription,
      String primaryClusterId,
      bool automaticFailoverEnabled,
      int numCacheClusters,
      List<String> preferredCacheClusteraZs,
      int numNodeGroups,
      int replicasPerNodeGroup,
      List<NodeGroupConfiguration> nodeGroupConfiguration,
      String cacheNodeType,
      String engine,
      String engineVersion,
      String cacheParameterGroupName,
      String cacheSubnetGroupName,
      List<String> cacheSecurityGroupNames,
      List<String> securityGroupIds,
      List<Tag> tags,
      List<String> snapshotArns,
      String snapshotName,
      String preferredMaintenanceWindow,
      int port,
      String notificationTopicArn,
      bool autoMinorVersionUpgrade,
      int snapshotRetentionLimit,
      String snapshotWindow,
      String authToken,
      bool transitEncryptionEnabled,
      bool atRestEncryptionEnabled,
      String kmsKeyId}) async {
    return CreateReplicationGroupResult.fromJson({});
  }

  /// Creates a copy of an entire cluster or replication group at a specific
  /// moment in time.
  ///
  ///
  ///
  /// This operation is valid for Redis only.
  ///
  /// [replicationGroupId]: The identifier of an existing replication group. The
  /// snapshot is created from this replication group.
  ///
  /// [cacheClusterId]: The identifier of an existing cluster. The snapshot is
  /// created from this cluster.
  ///
  /// [snapshotName]: A name for the snapshot being created.
  ///
  /// [kmsKeyId]: The ID of the KMS key used to encrypt the snapshot.
  Future<CreateSnapshotResult> createSnapshot(String snapshotName,
      {String replicationGroupId,
      String cacheClusterId,
      String kmsKeyId}) async {
    return CreateSnapshotResult.fromJson({});
  }

  /// Dynamically decreases the number of replics in a Redis (cluster mode
  /// disabled) replication group or the number of replica nodes in one or more
  /// node groups (shards) of a Redis (cluster mode enabled) replication group.
  /// This operation is performed with no cluster down time.
  ///
  /// [replicationGroupId]: The id of the replication group from which you want
  /// to remove replica nodes.
  ///
  /// [newReplicaCount]: The number of read replica nodes you want at the
  /// completion of this operation. For Redis (cluster mode disabled)
  /// replication groups, this is the number of replica nodes in the replication
  /// group. For Redis (cluster mode enabled) replication groups, this is the
  /// number of replica nodes in each of the replication group's node groups.
  ///
  /// The minimum number of replicas in a shard or replication group is:
  ///
  /// *   Redis (cluster mode disabled)
  ///
  ///     *   If Multi-AZ with Automatic Failover is enabled: 1
  ///
  ///     *   If Multi-AZ with Automatic Failover is not enabled: 0
  ///
  ///
  /// *   Redis (cluster mode enabled): 0 (though you will not be able to
  /// failover to a replica if your primary node fails)
  ///
  /// [replicaConfiguration]: A list of `ConfigureShard` objects that can be
  /// used to configure each shard in a Redis (cluster mode enabled) replication
  /// group. The `ConfigureShard` has three members: `NewReplicaCount`,
  /// `NodeGroupId`, and `PreferredAvailabilityZones`.
  ///
  /// [replicasToRemove]: A list of the node ids to remove from the replication
  /// group or node group (shard).
  ///
  /// [applyImmediately]: If `True`, the number of replica nodes is decreased
  /// immediately. `ApplyImmediately=False` is not currently supported.
  Future<DecreaseReplicaCountResult> decreaseReplicaCount(
      {@required String replicationGroupId,
      int newReplicaCount,
      List<ConfigureShard> replicaConfiguration,
      List<String> replicasToRemove,
      @required bool applyImmediately}) async {
    return DecreaseReplicaCountResult.fromJson({});
  }

  /// Deletes a previously provisioned cluster. `DeleteCacheCluster` deletes all
  /// associated cache nodes, node endpoints and the cluster itself. When you
  /// receive a successful response from this operation, Amazon ElastiCache
  /// immediately begins deleting the cluster; you cannot cancel or revert this
  /// operation.
  ///
  /// This operation is not valid for:
  ///
  /// *   Redis (cluster mode enabled) clusters
  ///
  /// *   A cluster that is the last read replica of a replication group
  ///
  /// *   A node group (shard) that has Multi-AZ mode enabled
  ///
  /// *   A cluster from a Redis (cluster mode enabled) replication group
  ///
  /// *   A cluster that is not in the `available` state
  ///
  /// [cacheClusterId]: The cluster identifier for the cluster to be deleted.
  /// This parameter is not case sensitive.
  ///
  /// [finalSnapshotIdentifier]: The user-supplied name of a final cluster
  /// snapshot. This is the unique name that identifies the snapshot.
  /// ElastiCache creates the snapshot, and then deletes the cluster immediately
  /// afterward.
  Future<DeleteCacheClusterResult> deleteCacheCluster(String cacheClusterId,
      {String finalSnapshotIdentifier}) async {
    return DeleteCacheClusterResult.fromJson({});
  }

  /// Deletes the specified cache parameter group. You cannot delete a cache
  /// parameter group if it is associated with any cache clusters.
  ///
  /// [cacheParameterGroupName]: The name of the cache parameter group to
  /// delete.
  ///
  ///
  ///
  /// The specified cache security group must not be associated with any
  /// clusters.
  Future<void> deleteCacheParameterGroup(
      String cacheParameterGroupName) async {}

  /// Deletes a cache security group.
  ///
  ///
  ///
  /// You cannot delete a cache security group if it is associated with any
  /// clusters.
  ///
  /// [cacheSecurityGroupName]: The name of the cache security group to delete.
  ///
  ///
  ///
  /// You cannot delete the default security group.
  Future<void> deleteCacheSecurityGroup(String cacheSecurityGroupName) async {}

  /// Deletes a cache subnet group.
  ///
  ///
  ///
  /// You cannot delete a cache subnet group if it is associated with any
  /// clusters.
  ///
  /// [cacheSubnetGroupName]: The name of the cache subnet group to delete.
  ///
  /// Constraints: Must contain no more than 255 alphanumeric characters or
  /// hyphens.
  Future<void> deleteCacheSubnetGroup(String cacheSubnetGroupName) async {}

  /// Deletes an existing replication group. By default, this operation deletes
  /// the entire replication group, including the primary/primaries and all of
  /// the read replicas. If the replication group has only one primary, you can
  /// optionally delete only the read replicas, while retaining the primary by
  /// setting `RetainPrimaryCluster=true`.
  ///
  /// When you receive a successful response from this operation, Amazon
  /// ElastiCache immediately begins deleting the selected resources; you cannot
  /// cancel or revert this operation.
  ///
  ///
  ///
  /// This operation is valid for Redis only.
  ///
  /// [replicationGroupId]: The identifier for the cluster to be deleted. This
  /// parameter is not case sensitive.
  ///
  /// [retainPrimaryCluster]: If set to `true`, all of the read replicas are
  /// deleted, but the primary node is retained.
  ///
  /// [finalSnapshotIdentifier]: The name of a final node group (shard)
  /// snapshot. ElastiCache creates the snapshot from the primary node in the
  /// cluster, rather than one of the replicas; this is to ensure that it
  /// captures the freshest data. After the final snapshot is taken, the
  /// replication group is immediately deleted.
  Future<DeleteReplicationGroupResult> deleteReplicationGroup(
      String replicationGroupId,
      {bool retainPrimaryCluster,
      String finalSnapshotIdentifier}) async {
    return DeleteReplicationGroupResult.fromJson({});
  }

  /// Deletes an existing snapshot. When you receive a successful response from
  /// this operation, ElastiCache immediately begins deleting the snapshot; you
  /// cannot cancel or revert this operation.
  ///
  ///
  ///
  /// This operation is valid for Redis only.
  ///
  /// [snapshotName]: The name of the snapshot to be deleted.
  Future<DeleteSnapshotResult> deleteSnapshot(String snapshotName) async {
    return DeleteSnapshotResult.fromJson({});
  }

  /// Returns information about all provisioned clusters if no cluster
  /// identifier is specified, or about a specific cache cluster if a cluster
  /// identifier is supplied.
  ///
  /// By default, abbreviated information about the clusters is returned. You
  /// can use the optional _ShowCacheNodeInfo_ flag to retrieve detailed
  /// information about the cache nodes associated with the clusters. These
  /// details include the DNS address and port for the cache node endpoint.
  ///
  /// If the cluster is in the _creating_ state, only cluster-level information
  /// is displayed until all of the nodes are successfully provisioned.
  ///
  /// If the cluster is in the _deleting_ state, only cluster-level information
  /// is displayed.
  ///
  /// If cache nodes are currently being added to the cluster, node endpoint
  /// information and creation time for the additional nodes are not displayed
  /// until they are completely provisioned. When the cluster state is
  /// _available_, the cluster is ready for use.
  ///
  /// If cache nodes are currently being removed from the cluster, no endpoint
  /// information for the removed nodes is displayed.
  ///
  /// [cacheClusterId]: The user-supplied cluster identifier. If this parameter
  /// is specified, only information about that specific cluster is returned.
  /// This parameter isn't case sensitive.
  ///
  /// [maxRecords]: The maximum number of records to include in the response. If
  /// more records exist than the specified `MaxRecords` value, a marker is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: minimum 20; maximum 100.
  ///
  /// [marker]: An optional marker returned from a prior request. Use this
  /// marker for pagination of results from this operation. If this parameter is
  /// specified, the response includes only records beyond the marker, up to the
  /// value specified by `MaxRecords`.
  ///
  /// [showCacheNodeInfo]: An optional flag that can be included in the
  /// `DescribeCacheCluster` request to retrieve information about the
  /// individual cache nodes.
  ///
  /// [showCacheClustersNotInReplicationGroups]: An optional flag that can be
  /// included in the `DescribeCacheCluster` request to show only nodes
  /// (API/CLI: clusters) that are not members of a replication group. In
  /// practice, this mean Memcached and single node Redis clusters.
  Future<CacheClusterMessage> describeCacheClusters(
      {String cacheClusterId,
      int maxRecords,
      String marker,
      bool showCacheNodeInfo,
      bool showCacheClustersNotInReplicationGroups}) async {
    return CacheClusterMessage.fromJson({});
  }

  /// Returns a list of the available cache engines and their versions.
  ///
  /// [engine]: The cache engine to return. Valid values: `memcached` | `redis`
  ///
  /// [engineVersion]: The cache engine version to return.
  ///
  /// Example: `1.4.14`
  ///
  /// [cacheParameterGroupFamily]: The name of a specific cache parameter group
  /// family to return details for.
  ///
  /// Valid values are: `memcached1.4` | `memcached1.5` | `redis2.6` |
  /// `redis2.8` | `redis3.2` | `redis4.0` | `redis5.0` |
  ///
  /// Constraints:
  ///
  /// *   Must be 1 to 255 alphanumeric characters
  ///
  /// *   First character must be a letter
  ///
  /// *   Cannot end with a hyphen or contain two consecutive hyphens
  ///
  /// [maxRecords]: The maximum number of records to include in the response. If
  /// more records exist than the specified `MaxRecords` value, a marker is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: minimum 20; maximum 100.
  ///
  /// [marker]: An optional marker returned from a prior request. Use this
  /// marker for pagination of results from this operation. If this parameter is
  /// specified, the response includes only records beyond the marker, up to the
  /// value specified by `MaxRecords`.
  ///
  /// [defaultOnly]: If `true`, specifies that only the default version of the
  /// specified engine or engine and major version combination is to be
  /// returned.
  Future<CacheEngineVersionMessage> describeCacheEngineVersions(
      {String engine,
      String engineVersion,
      String cacheParameterGroupFamily,
      int maxRecords,
      String marker,
      bool defaultOnly}) async {
    return CacheEngineVersionMessage.fromJson({});
  }

  /// Returns a list of cache parameter group descriptions. If a cache parameter
  /// group name is specified, the list contains only the descriptions for that
  /// group.
  ///
  /// [cacheParameterGroupName]: The name of a specific cache parameter group to
  /// return details for.
  ///
  /// [maxRecords]: The maximum number of records to include in the response. If
  /// more records exist than the specified `MaxRecords` value, a marker is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: minimum 20; maximum 100.
  ///
  /// [marker]: An optional marker returned from a prior request. Use this
  /// marker for pagination of results from this operation. If this parameter is
  /// specified, the response includes only records beyond the marker, up to the
  /// value specified by `MaxRecords`.
  Future<CacheParameterGroupsMessage> describeCacheParameterGroups(
      {String cacheParameterGroupName, int maxRecords, String marker}) async {
    return CacheParameterGroupsMessage.fromJson({});
  }

  /// Returns the detailed parameter list for a particular cache parameter
  /// group.
  ///
  /// [cacheParameterGroupName]: The name of a specific cache parameter group to
  /// return details for.
  ///
  /// [source]: The parameter types to return.
  ///
  /// Valid values: `user` | `system` | `engine-default`
  ///
  /// [maxRecords]: The maximum number of records to include in the response. If
  /// more records exist than the specified `MaxRecords` value, a marker is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: minimum 20; maximum 100.
  ///
  /// [marker]: An optional marker returned from a prior request. Use this
  /// marker for pagination of results from this operation. If this parameter is
  /// specified, the response includes only records beyond the marker, up to the
  /// value specified by `MaxRecords`.
  Future<CacheParameterGroupDetails> describeCacheParameters(
      String cacheParameterGroupName,
      {String source,
      int maxRecords,
      String marker}) async {
    return CacheParameterGroupDetails.fromJson({});
  }

  /// Returns a list of cache security group descriptions. If a cache security
  /// group name is specified, the list contains only the description of that
  /// group. This applicable only when you have ElastiCache in Classic setup
  ///
  /// [cacheSecurityGroupName]: The name of the cache security group to return
  /// details for.
  ///
  /// [maxRecords]: The maximum number of records to include in the response. If
  /// more records exist than the specified `MaxRecords` value, a marker is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: minimum 20; maximum 100.
  ///
  /// [marker]: An optional marker returned from a prior request. Use this
  /// marker for pagination of results from this operation. If this parameter is
  /// specified, the response includes only records beyond the marker, up to the
  /// value specified by `MaxRecords`.
  Future<CacheSecurityGroupMessage> describeCacheSecurityGroups(
      {String cacheSecurityGroupName, int maxRecords, String marker}) async {
    return CacheSecurityGroupMessage.fromJson({});
  }

  /// Returns a list of cache subnet group descriptions. If a subnet group name
  /// is specified, the list contains only the description of that group. This
  /// is applicable only when you have ElastiCache in VPC setup. All ElastiCache
  /// clusters now launch in VPC by default.
  ///
  /// [cacheSubnetGroupName]: The name of the cache subnet group to return
  /// details for.
  ///
  /// [maxRecords]: The maximum number of records to include in the response. If
  /// more records exist than the specified `MaxRecords` value, a marker is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: minimum 20; maximum 100.
  ///
  /// [marker]: An optional marker returned from a prior request. Use this
  /// marker for pagination of results from this operation. If this parameter is
  /// specified, the response includes only records beyond the marker, up to the
  /// value specified by `MaxRecords`.
  Future<CacheSubnetGroupMessage> describeCacheSubnetGroups(
      {String cacheSubnetGroupName, int maxRecords, String marker}) async {
    return CacheSubnetGroupMessage.fromJson({});
  }

  /// Returns the default engine and system parameter information for the
  /// specified cache engine.
  ///
  /// [cacheParameterGroupFamily]: The name of the cache parameter group family.
  ///
  /// Valid values are: `memcached1.4` | `memcached1.5` | `redis2.6` |
  /// `redis2.8` | `redis3.2` | `redis4.0` | `redis5.0` |
  ///
  /// [maxRecords]: The maximum number of records to include in the response. If
  /// more records exist than the specified `MaxRecords` value, a marker is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: minimum 20; maximum 100.
  ///
  /// [marker]: An optional marker returned from a prior request. Use this
  /// marker for pagination of results from this operation. If this parameter is
  /// specified, the response includes only records beyond the marker, up to the
  /// value specified by `MaxRecords`.
  Future<DescribeEngineDefaultParametersResult> describeEngineDefaultParameters(
      String cacheParameterGroupFamily,
      {int maxRecords,
      String marker}) async {
    return DescribeEngineDefaultParametersResult.fromJson({});
  }

  /// Returns events related to clusters, cache security groups, and cache
  /// parameter groups. You can obtain events specific to a particular cluster,
  /// cache security group, or cache parameter group by providing the name as a
  /// parameter.
  ///
  /// By default, only the events occurring within the last hour are returned;
  /// however, you can retrieve up to 14 days' worth of events if necessary.
  ///
  /// [sourceIdentifier]: The identifier of the event source for which events
  /// are returned. If not specified, all sources are included in the response.
  ///
  /// [sourceType]: The event source to retrieve events for. If no value is
  /// specified, all events are returned.
  ///
  /// [startTime]: The beginning of the time interval to retrieve events for,
  /// specified in ISO 8601 format.
  ///
  ///  **Example:** 2017-03-30T07:03:49.555Z
  ///
  /// [endTime]: The end of the time interval for which to retrieve events,
  /// specified in ISO 8601 format.
  ///
  ///  **Example:** 2017-03-30T07:03:49.555Z
  ///
  /// [duration]: The number of minutes worth of events to retrieve.
  ///
  /// [maxRecords]: The maximum number of records to include in the response. If
  /// more records exist than the specified `MaxRecords` value, a marker is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: minimum 20; maximum 100.
  ///
  /// [marker]: An optional marker returned from a prior request. Use this
  /// marker for pagination of results from this operation. If this parameter is
  /// specified, the response includes only records beyond the marker, up to the
  /// value specified by `MaxRecords`.
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

  /// Returns information about a particular replication group. If no identifier
  /// is specified, `DescribeReplicationGroups` returns information about all
  /// replication groups.
  ///
  ///
  ///
  /// This operation is valid for Redis only.
  ///
  /// [replicationGroupId]: The identifier for the replication group to be
  /// described. This parameter is not case sensitive.
  ///
  /// If you do not specify this parameter, information about all replication
  /// groups is returned.
  ///
  /// [maxRecords]: The maximum number of records to include in the response. If
  /// more records exist than the specified `MaxRecords` value, a marker is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: minimum 20; maximum 100.
  ///
  /// [marker]: An optional marker returned from a prior request. Use this
  /// marker for pagination of results from this operation. If this parameter is
  /// specified, the response includes only records beyond the marker, up to the
  /// value specified by `MaxRecords`.
  Future<ReplicationGroupMessage> describeReplicationGroups(
      {String replicationGroupId, int maxRecords, String marker}) async {
    return ReplicationGroupMessage.fromJson({});
  }

  /// Returns information about reserved cache nodes for this account, or about
  /// a specified reserved cache node.
  ///
  /// [reservedCacheNodeId]: The reserved cache node identifier filter value.
  /// Use this parameter to show only the reservation that matches the specified
  /// reservation ID.
  ///
  /// [reservedCacheNodesOfferingId]: The offering identifier filter value. Use
  /// this parameter to show only purchased reservations matching the specified
  /// offering identifier.
  ///
  /// [cacheNodeType]: The cache node type filter value. Use this parameter to
  /// show only those reservations matching the specified cache node type.
  ///
  /// The following node types are supported by ElastiCache. Generally speaking,
  /// the current generation types provide more memory and computational power
  /// at lower cost when compared to their equivalent previous generation
  /// counterparts.
  ///
  /// *   General purpose:
  ///
  ///     *   Current generation:
  ///
  ///          **M5 node types:** `cache.m5.large`, `cache.m5.xlarge`,
  /// `cache.m5.2xlarge`, `cache.m5.4xlarge`, `cache.m5.12xlarge`,
  /// `cache.m5.24xlarge`
  ///
  ///          **M4 node types:** `cache.m4.large`, `cache.m4.xlarge`,
  /// `cache.m4.2xlarge`, `cache.m4.4xlarge`, `cache.m4.10xlarge`
  ///
  ///          **T2 node types:** `cache.t2.micro`, `cache.t2.small`,
  /// `cache.t2.medium`
  ///
  ///     *   Previous generation: (not recommended)
  ///
  ///          **T1 node types:** `cache.t1.micro`
  ///
  ///          **M1 node types:** `cache.m1.small`, `cache.m1.medium`,
  /// `cache.m1.large`, `cache.m1.xlarge`
  ///
  ///          **M3 node types:** `cache.m3.medium`, `cache.m3.large`,
  /// `cache.m3.xlarge`, `cache.m3.2xlarge`
  ///
  ///
  /// *   Compute optimized:
  ///
  ///     *   Previous generation: (not recommended)
  ///
  ///          **C1 node types:** `cache.c1.xlarge`
  ///
  ///
  /// *   Memory optimized:
  ///
  ///     *   Current generation:
  ///
  ///          **R5 node types:** `cache.r5.large`, `cache.r5.xlarge`,
  /// `cache.r5.2xlarge`, `cache.r5.4xlarge`, `cache.r5.12xlarge`,
  /// `cache.r5.24xlarge`
  ///
  ///          **R4 node types:** `cache.r4.large`, `cache.r4.xlarge`,
  /// `cache.r4.2xlarge`, `cache.r4.4xlarge`, `cache.r4.8xlarge`,
  /// `cache.r4.16xlarge`
  ///
  ///     *   Previous generation: (not recommended)
  ///
  ///          **M2 node types:** `cache.m2.xlarge`, `cache.m2.2xlarge`,
  /// `cache.m2.4xlarge`
  ///
  ///          **R3 node types:** `cache.r3.large`, `cache.r3.xlarge`,
  /// `cache.r3.2xlarge`, `cache.r3.4xlarge`, `cache.r3.8xlarge`
  ///
  ///
  ///
  ///  **Additional node type info**
  ///
  /// *   All current generation instance types are created in Amazon VPC by
  /// default.
  ///
  /// *   Redis append-only files (AOF) are not supported for T1 or T2
  /// instances.
  ///
  /// *   Redis Multi-AZ with automatic failover is not supported on T1
  /// instances.
  ///
  /// *   Redis configuration variables `appendonly` and `appendfsync` are not
  /// supported on Redis version 2.8.22 and later.
  ///
  /// [duration]: The duration filter value, specified in years or seconds. Use
  /// this parameter to show only reservations for this duration.
  ///
  /// Valid Values: `1 | 3 | 31536000 | 94608000`
  ///
  /// [productDescription]: The product description filter value. Use this
  /// parameter to show only those reservations matching the specified product
  /// description.
  ///
  /// [offeringType]: The offering type filter value. Use this parameter to show
  /// only the available offerings matching the specified offering type.
  ///
  /// Valid values: `"Light Utilization"|"Medium Utilization"|"Heavy
  /// Utilization"`
  ///
  /// [maxRecords]: The maximum number of records to include in the response. If
  /// more records exist than the specified `MaxRecords` value, a marker is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: minimum 20; maximum 100.
  ///
  /// [marker]: An optional marker returned from a prior request. Use this
  /// marker for pagination of results from this operation. If this parameter is
  /// specified, the response includes only records beyond the marker, up to the
  /// value specified by `MaxRecords`.
  Future<ReservedCacheNodeMessage> describeReservedCacheNodes(
      {String reservedCacheNodeId,
      String reservedCacheNodesOfferingId,
      String cacheNodeType,
      String duration,
      String productDescription,
      String offeringType,
      int maxRecords,
      String marker}) async {
    return ReservedCacheNodeMessage.fromJson({});
  }

  /// Lists available reserved cache node offerings.
  ///
  /// [reservedCacheNodesOfferingId]: The offering identifier filter value. Use
  /// this parameter to show only the available offering that matches the
  /// specified reservation identifier.
  ///
  /// Example: `438012d3-4052-4cc7-b2e3-8d3372e0e706`
  ///
  /// [cacheNodeType]: The cache node type filter value. Use this parameter to
  /// show only the available offerings matching the specified cache node type.
  ///
  /// The following node types are supported by ElastiCache. Generally speaking,
  /// the current generation types provide more memory and computational power
  /// at lower cost when compared to their equivalent previous generation
  /// counterparts.
  ///
  /// *   General purpose:
  ///
  ///     *   Current generation:
  ///
  ///          **M5 node types:** `cache.m5.large`, `cache.m5.xlarge`,
  /// `cache.m5.2xlarge`, `cache.m5.4xlarge`, `cache.m5.12xlarge`,
  /// `cache.m5.24xlarge`
  ///
  ///          **M4 node types:** `cache.m4.large`, `cache.m4.xlarge`,
  /// `cache.m4.2xlarge`, `cache.m4.4xlarge`, `cache.m4.10xlarge`
  ///
  ///          **T2 node types:** `cache.t2.micro`, `cache.t2.small`,
  /// `cache.t2.medium`
  ///
  ///     *   Previous generation: (not recommended)
  ///
  ///          **T1 node types:** `cache.t1.micro`
  ///
  ///          **M1 node types:** `cache.m1.small`, `cache.m1.medium`,
  /// `cache.m1.large`, `cache.m1.xlarge`
  ///
  ///          **M3 node types:** `cache.m3.medium`, `cache.m3.large`,
  /// `cache.m3.xlarge`, `cache.m3.2xlarge`
  ///
  ///
  /// *   Compute optimized:
  ///
  ///     *   Previous generation: (not recommended)
  ///
  ///          **C1 node types:** `cache.c1.xlarge`
  ///
  ///
  /// *   Memory optimized:
  ///
  ///     *   Current generation:
  ///
  ///          **R5 node types:** `cache.r5.large`, `cache.r5.xlarge`,
  /// `cache.r5.2xlarge`, `cache.r5.4xlarge`, `cache.r5.12xlarge`,
  /// `cache.r5.24xlarge`
  ///
  ///          **R4 node types:** `cache.r4.large`, `cache.r4.xlarge`,
  /// `cache.r4.2xlarge`, `cache.r4.4xlarge`, `cache.r4.8xlarge`,
  /// `cache.r4.16xlarge`
  ///
  ///     *   Previous generation: (not recommended)
  ///
  ///          **M2 node types:** `cache.m2.xlarge`, `cache.m2.2xlarge`,
  /// `cache.m2.4xlarge`
  ///
  ///          **R3 node types:** `cache.r3.large`, `cache.r3.xlarge`,
  /// `cache.r3.2xlarge`, `cache.r3.4xlarge`, `cache.r3.8xlarge`
  ///
  ///
  ///
  ///  **Additional node type info**
  ///
  /// *   All current generation instance types are created in Amazon VPC by
  /// default.
  ///
  /// *   Redis append-only files (AOF) are not supported for T1 or T2
  /// instances.
  ///
  /// *   Redis Multi-AZ with automatic failover is not supported on T1
  /// instances.
  ///
  /// *   Redis configuration variables `appendonly` and `appendfsync` are not
  /// supported on Redis version 2.8.22 and later.
  ///
  /// [duration]: Duration filter value, specified in years or seconds. Use this
  /// parameter to show only reservations for a given duration.
  ///
  /// Valid Values: `1 | 3 | 31536000 | 94608000`
  ///
  /// [productDescription]: The product description filter value. Use this
  /// parameter to show only the available offerings matching the specified
  /// product description.
  ///
  /// [offeringType]: The offering type filter value. Use this parameter to show
  /// only the available offerings matching the specified offering type.
  ///
  /// Valid Values: `"Light Utilization"|"Medium Utilization"|"Heavy
  /// Utilization"`
  ///
  /// [maxRecords]: The maximum number of records to include in the response. If
  /// more records exist than the specified `MaxRecords` value, a marker is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: minimum 20; maximum 100.
  ///
  /// [marker]: An optional marker returned from a prior request. Use this
  /// marker for pagination of results from this operation. If this parameter is
  /// specified, the response includes only records beyond the marker, up to the
  /// value specified by `MaxRecords`.
  Future<ReservedCacheNodesOfferingMessage> describeReservedCacheNodesOfferings(
      {String reservedCacheNodesOfferingId,
      String cacheNodeType,
      String duration,
      String productDescription,
      String offeringType,
      int maxRecords,
      String marker}) async {
    return ReservedCacheNodesOfferingMessage.fromJson({});
  }

  /// Returns details of the service updates
  ///
  /// [serviceUpdateName]: The unique ID of the service update
  ///
  /// [serviceUpdateStatus]: The status of the service update
  ///
  /// [maxRecords]: The maximum number of records to include in the response
  ///
  /// [marker]: An optional marker returned from a prior request. Use this
  /// marker for pagination of results from this operation. If this parameter is
  /// specified, the response includes only records beyond the marker, up to the
  /// value specified by `MaxRecords`.
  Future<ServiceUpdatesMessage> describeServiceUpdates(
      {String serviceUpdateName,
      List<String> serviceUpdateStatus,
      int maxRecords,
      String marker}) async {
    return ServiceUpdatesMessage.fromJson({});
  }

  /// Returns information about cluster or replication group snapshots. By
  /// default, `DescribeSnapshots` lists all of your snapshots; it can
  /// optionally describe a single snapshot, or just the snapshots associated
  /// with a particular cache cluster.
  ///
  ///
  ///
  /// This operation is valid for Redis only.
  ///
  /// [replicationGroupId]: A user-supplied replication group identifier. If
  /// this parameter is specified, only snapshots associated with that specific
  /// replication group are described.
  ///
  /// [cacheClusterId]: A user-supplied cluster identifier. If this parameter is
  /// specified, only snapshots associated with that specific cluster are
  /// described.
  ///
  /// [snapshotName]: A user-supplied name of the snapshot. If this parameter is
  /// specified, only this snapshot are described.
  ///
  /// [snapshotSource]: If set to `system`, the output shows snapshots that were
  /// automatically created by ElastiCache. If set to `user` the output shows
  /// snapshots that were manually created. If omitted, the output shows both
  /// automatically and manually created snapshots.
  ///
  /// [marker]: An optional marker returned from a prior request. Use this
  /// marker for pagination of results from this operation. If this parameter is
  /// specified, the response includes only records beyond the marker, up to the
  /// value specified by `MaxRecords`.
  ///
  /// [maxRecords]: The maximum number of records to include in the response. If
  /// more records exist than the specified `MaxRecords` value, a marker is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// Default: 50
  ///
  /// Constraints: minimum 20; maximum 50.
  ///
  /// [showNodeGroupConfig]: A Boolean value which if true, the node group
  /// (shard) configuration is included in the snapshot description.
  Future<DescribeSnapshotsListMessage> describeSnapshots(
      {String replicationGroupId,
      String cacheClusterId,
      String snapshotName,
      String snapshotSource,
      String marker,
      int maxRecords,
      bool showNodeGroupConfig}) async {
    return DescribeSnapshotsListMessage.fromJson({});
  }

  /// Returns details of the update actions
  ///
  /// [serviceUpdateName]: The unique ID of the service update
  ///
  /// [replicationGroupIds]: The replication group IDs
  ///
  /// [serviceUpdateStatus]: The status of the service update
  ///
  /// [serviceUpdateTimeRange]: The range of time specified to search for
  /// service updates that are in available status
  ///
  /// [updateActionStatus]: The status of the update action.
  ///
  /// [showNodeLevelUpdateStatus]: Dictates whether to include node level update
  /// status in the response
  ///
  /// [maxRecords]: The maximum number of records to include in the response
  ///
  /// [marker]: An optional marker returned from a prior request. Use this
  /// marker for pagination of results from this operation. If this parameter is
  /// specified, the response includes only records beyond the marker, up to the
  /// value specified by `MaxRecords`.
  Future<UpdateActionsMessage> describeUpdateActions(
      {String serviceUpdateName,
      List<String> replicationGroupIds,
      List<String> serviceUpdateStatus,
      TimeRangeFilter serviceUpdateTimeRange,
      List<String> updateActionStatus,
      bool showNodeLevelUpdateStatus,
      int maxRecords,
      String marker}) async {
    return UpdateActionsMessage.fromJson({});
  }

  /// Dynamically increases the number of replics in a Redis (cluster mode
  /// disabled) replication group or the number of replica nodes in one or more
  /// node groups (shards) of a Redis (cluster mode enabled) replication group.
  /// This operation is performed with no cluster down time.
  ///
  /// [replicationGroupId]: The id of the replication group to which you want to
  /// add replica nodes.
  ///
  /// [newReplicaCount]: The number of read replica nodes you want at the
  /// completion of this operation. For Redis (cluster mode disabled)
  /// replication groups, this is the number of replica nodes in the replication
  /// group. For Redis (cluster mode enabled) replication groups, this is the
  /// number of replica nodes in each of the replication group's node groups.
  ///
  /// [replicaConfiguration]: A list of `ConfigureShard` objects that can be
  /// used to configure each shard in a Redis (cluster mode enabled) replication
  /// group. The `ConfigureShard` has three members: `NewReplicaCount`,
  /// `NodeGroupId`, and `PreferredAvailabilityZones`.
  ///
  /// [applyImmediately]: If `True`, the number of replica nodes is increased
  /// immediately. `ApplyImmediately=False` is not currently supported.
  Future<IncreaseReplicaCountResult> increaseReplicaCount(
      {@required String replicationGroupId,
      int newReplicaCount,
      List<ConfigureShard> replicaConfiguration,
      @required bool applyImmediately}) async {
    return IncreaseReplicaCountResult.fromJson({});
  }

  /// Lists all available node types that you can scale your Redis cluster's or
  /// replication group's current node type.
  ///
  /// When you use the `ModifyCacheCluster` or `ModifyReplicationGroup`
  /// operations to scale your cluster or replication group, the value of the
  /// `CacheNodeType` parameter must be one of the node types returned by this
  /// operation.
  ///
  /// [cacheClusterId]: The name of the cluster you want to scale up to a larger
  /// node instanced type. ElastiCache uses the cluster id to identify the
  /// current node type of this cluster and from that to create a list of node
  /// types you can scale up to.
  ///
  ///
  ///
  /// You must provide a value for either the `CacheClusterId` or the
  /// `ReplicationGroupId`.
  ///
  /// [replicationGroupId]: The name of the replication group want to scale up
  /// to a larger node type. ElastiCache uses the replication group id to
  /// identify the current node type being used by this replication group, and
  /// from that to create a list of node types you can scale up to.
  ///
  ///
  ///
  /// You must provide a value for either the `CacheClusterId` or the
  /// `ReplicationGroupId`.
  Future<AllowedNodeTypeModificationsMessage> listAllowedNodeTypeModifications(
      {String cacheClusterId, String replicationGroupId}) async {
    return AllowedNodeTypeModificationsMessage.fromJson({});
  }

  /// Lists all cost allocation tags currently on the named resource. A `cost
  /// allocation tag` is a key-value pair where the key is case-sensitive and
  /// the value is optional. You can use cost allocation tags to categorize and
  /// track your AWS costs.
  ///
  /// If the cluster is not in the _available_ state, `ListTagsForResource`
  /// returns an error.
  ///
  /// You can have a maximum of 50 cost allocation tags on an ElastiCache
  /// resource. For more information, see
  /// [Monitoring Costs with Tags](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Tagging.html).
  ///
  /// [resourceName]: The Amazon Resource Name (ARN) of the resource for which
  /// you want the list of tags, for example
  /// `arn:aws:elasticache:us-west-2:0123456789:cluster:myCluster` or
  /// `arn:aws:elasticache:us-west-2:0123456789:snapshot:mySnapshot`.
  ///
  /// For more information about ARNs, see
  /// [Amazon Resource Names (ARNs) and AWS Service Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html).
  Future<TagListMessage> listTagsForResource(String resourceName) async {
    return TagListMessage.fromJson({});
  }

  /// Modifies the settings for a cluster. You can use this operation to change
  /// one or more cluster configuration parameters by specifying the parameters
  /// and the new values.
  ///
  /// [cacheClusterId]: The cluster identifier. This value is stored as a
  /// lowercase string.
  ///
  /// [numCacheNodes]: The number of cache nodes that the cluster should have.
  /// If the value for `NumCacheNodes` is greater than the sum of the number of
  /// current cache nodes and the number of cache nodes pending creation (which
  /// may be zero), more nodes are added. If the value is less than the number
  /// of existing cache nodes, nodes are removed. If the value is equal to the
  /// number of current cache nodes, any pending add or remove requests are
  /// canceled.
  ///
  /// If you are removing cache nodes, you must use the `CacheNodeIdsToRemove`
  /// parameter to provide the IDs of the specific cache nodes to remove.
  ///
  /// For clusters running Redis, this value must be 1. For clusters running
  /// Memcached, this value must be between 1 and 20.
  ///
  ///
  ///
  /// Adding or removing Memcached cache nodes can be applied immediately or as
  /// a pending operation (see `ApplyImmediately`).
  ///
  /// A pending operation to modify the number of cache nodes in a cluster
  /// during its maintenance window, whether by adding or removing nodes in
  /// accordance with the scale out architecture, is not queued. The customer's
  /// latest request to add or remove nodes to the cluster overrides any
  /// previous pending operations to modify the number of cache nodes in the
  /// cluster. For example, a request to remove 2 nodes would override a
  /// previous pending operation to remove 3 nodes. Similarly, a request to add
  /// 2 nodes would override a previous pending operation to remove 3 nodes and
  /// vice versa. As Memcached cache nodes may now be provisioned in different
  /// Availability Zones with flexible cache node placement, a request to add
  /// nodes does not automatically override a previous pending operation to add
  /// nodes. The customer can modify the previous pending operation to add more
  /// nodes or explicitly cancel the pending request and retry the new request.
  /// To cancel pending operations to modify the number of cache nodes in a
  /// cluster, use the `ModifyCacheCluster` request and set `NumCacheNodes`
  /// equal to the number of cache nodes currently in the cluster.
  ///
  /// [cacheNodeIdsToRemove]: A list of cache node IDs to be removed. A node ID
  /// is a numeric identifier (0001, 0002, etc.). This parameter is only valid
  /// when `NumCacheNodes` is less than the existing number of cache nodes. The
  /// number of cache node IDs supplied in this parameter must match the
  /// difference between the existing number of cache nodes in the cluster or
  /// pending cache nodes, whichever is greater, and the value of
  /// `NumCacheNodes` in the request.
  ///
  /// For example: If you have 3 active cache nodes, 7 pending cache nodes, and
  /// the number of cache nodes in this `ModifyCacheCluster` call is 5, you must
  /// list 2 (7 - 5) cache node IDs to remove.
  ///
  /// [azMode]: Specifies whether the new nodes in this Memcached cluster are
  /// all created in a single Availability Zone or created across multiple
  /// Availability Zones.
  ///
  /// Valid values: `single-az` | `cross-az`.
  ///
  /// This option is only supported for Memcached clusters.
  ///
  ///
  ///
  /// You cannot specify `single-az` if the Memcached cluster already has cache
  /// nodes in different Availability Zones. If `cross-az` is specified,
  /// existing Memcached nodes remain in their current Availability Zone.
  ///
  /// Only newly created nodes are located in different Availability Zones. For
  /// instructions on how to move existing Memcached nodes to different
  /// Availability Zones, see the **Availability Zone Considerations** section
  /// of
  /// [Cache Node Considerations for Memcached](https://docs.aws.amazon.com/AmazonElastiCache/latest/mem-ug/CacheNodes.SupportedTypes.html).
  ///
  /// [newAvailabilityZones]: The list of Availability Zones where the new
  /// Memcached cache nodes are created.
  ///
  /// This parameter is only valid when `NumCacheNodes` in the request is
  /// greater than the sum of the number of active cache nodes and the number of
  /// cache nodes pending creation (which may be zero). The number of
  /// Availability Zones supplied in this list must match the cache nodes being
  /// added in this request.
  ///
  /// This option is only supported on Memcached clusters.
  ///
  /// Scenarios:
  ///
  /// *    **Scenario 1:** You have 3 active nodes and wish to add 2 nodes.
  /// Specify `NumCacheNodes=5` (3 + 2) and optionally specify two Availability
  /// Zones for the two new nodes.
  ///
  /// *    **Scenario 2:** You have 3 active nodes and 2 nodes pending creation
  /// (from the scenario 1 call) and want to add 1 more node. Specify
  /// `NumCacheNodes=6` ((3 + 2) + 1) and optionally specify an Availability
  /// Zone for the new node.
  ///
  /// *    **Scenario 3:** You want to cancel all pending operations. Specify
  /// `NumCacheNodes=3` to cancel all pending operations.
  ///
  ///
  /// The Availability Zone placement of nodes pending creation cannot be
  /// modified. If you wish to cancel any nodes pending creation, add 0 nodes by
  /// setting `NumCacheNodes` to the number of current nodes.
  ///
  /// If `cross-az` is specified, existing Memcached nodes remain in their
  /// current Availability Zone. Only newly created nodes can be located in
  /// different Availability Zones. For guidance on how to move existing
  /// Memcached nodes to different Availability Zones, see the **Availability
  /// Zone Considerations** section of
  /// [Cache Node Considerations for Memcached](https://docs.aws.amazon.com/AmazonElastiCache/latest/mem-ug/CacheNodes.SupportedTypes.html).
  ///
  ///  **Impact of new add/remove requests upon pending requests**
  ///
  /// *   Scenario-1
  ///
  ///     *   Pending Action: Delete
  ///
  ///     *   New Request: Delete
  ///
  ///     *   Result: The new delete, pending or immediate, replaces the pending
  /// delete.
  ///
  ///
  /// *   Scenario-2
  ///
  ///     *   Pending Action: Delete
  ///
  ///     *   New Request: Create
  ///
  ///     *   Result: The new create, pending or immediate, replaces the pending
  /// delete.
  ///
  ///
  /// *   Scenario-3
  ///
  ///     *   Pending Action: Create
  ///
  ///     *   New Request: Delete
  ///
  ///     *   Result: The new delete, pending or immediate, replaces the pending
  /// create.
  ///
  ///
  /// *   Scenario-4
  ///
  ///     *   Pending Action: Create
  ///
  ///     *   New Request: Create
  ///
  ///     *   Result: The new create is added to the pending create.
  ///
  ///           **Important:** If the new create request is **Apply Immediately
  /// - Yes**, all creates are performed immediately. If the new create request
  /// is **Apply Immediately - No**, all creates are pending.
  ///
  /// [cacheSecurityGroupNames]: A list of cache security group names to
  /// authorize on this cluster. This change is asynchronously applied as soon
  /// as possible.
  ///
  /// You can use this parameter only with clusters that are created outside of
  /// an Amazon Virtual Private Cloud (Amazon VPC).
  ///
  /// Constraints: Must contain no more than 255 alphanumeric characters. Must
  /// not be "Default".
  ///
  /// [securityGroupIds]: Specifies the VPC Security Groups associated with the
  /// cluster.
  ///
  /// This parameter can be used only with clusters that are created in an
  /// Amazon Virtual Private Cloud (Amazon VPC).
  ///
  /// [preferredMaintenanceWindow]: Specifies the weekly time range during which
  /// maintenance on the cluster is performed. It is specified as a range in the
  /// format ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance
  /// window is a 60 minute period.
  ///
  /// Valid values for `ddd` are:
  ///
  /// *    `sun`
  ///
  /// *    `mon`
  ///
  /// *    `tue`
  ///
  /// *    `wed`
  ///
  /// *    `thu`
  ///
  /// *    `fri`
  ///
  /// *    `sat`
  ///
  ///
  /// Example: `sun:23:00-mon:01:30`
  ///
  /// [notificationTopicArn]: The Amazon Resource Name (ARN) of the Amazon SNS
  /// topic to which notifications are sent.
  ///
  ///
  ///
  /// The Amazon SNS topic owner must be same as the cluster owner.
  ///
  /// [cacheParameterGroupName]: The name of the cache parameter group to apply
  /// to this cluster. This change is asynchronously applied as soon as possible
  /// for parameters when the `ApplyImmediately` parameter is specified as
  /// `true` for this request.
  ///
  /// [notificationTopicStatus]: The status of the Amazon SNS notification
  /// topic. Notifications are sent only if the status is `active`.
  ///
  /// Valid values: `active` | `inactive`
  ///
  /// [applyImmediately]: If `true`, this parameter causes the modifications in
  /// this request and any pending modifications to be applied, asynchronously
  /// and as soon as possible, regardless of the `PreferredMaintenanceWindow`
  /// setting for the cluster.
  ///
  /// If `false`, changes to the cluster are applied on the next maintenance
  /// reboot, or the next failure reboot, whichever occurs first.
  ///
  ///  If you perform a `ModifyCacheCluster` before a pending modification is
  /// applied, the pending modification is replaced by the newer modification.
  ///
  /// Valid values: `true` | `false`
  ///
  /// Default: `false`
  ///
  /// [engineVersion]: The upgraded version of the cache engine to be run on the
  /// cache nodes.
  ///
  ///  **Important:** You can upgrade to a newer engine version (see
  /// [Selecting a Cache Engine and Version](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/SelectEngine.html#VersionManagement)),
  /// but you cannot downgrade to an earlier engine version. If you want to use
  /// an earlier engine version, you must delete the existing cluster and create
  /// it anew with the earlier engine version.
  ///
  /// [autoMinorVersionUpgrade]: This parameter is currently disabled.
  ///
  /// [snapshotRetentionLimit]: The number of days for which ElastiCache retains
  /// automatic cluster snapshots before deleting them. For example, if you set
  /// `SnapshotRetentionLimit` to 5, a snapshot that was taken today is retained
  /// for 5 days before being deleted.
  ///
  ///
  ///
  /// If the value of `SnapshotRetentionLimit` is set to zero (0), backups are
  /// turned off.
  ///
  /// [snapshotWindow]: The daily time range (in UTC) during which ElastiCache
  /// begins taking a daily snapshot of your cluster.
  ///
  /// [cacheNodeType]: A valid cache node type that you want to scale this
  /// cluster up to.
  Future<ModifyCacheClusterResult> modifyCacheCluster(String cacheClusterId,
      {int numCacheNodes,
      List<String> cacheNodeIdsToRemove,
      String azMode,
      List<String> newAvailabilityZones,
      List<String> cacheSecurityGroupNames,
      List<String> securityGroupIds,
      String preferredMaintenanceWindow,
      String notificationTopicArn,
      String cacheParameterGroupName,
      String notificationTopicStatus,
      bool applyImmediately,
      String engineVersion,
      bool autoMinorVersionUpgrade,
      int snapshotRetentionLimit,
      String snapshotWindow,
      String cacheNodeType}) async {
    return ModifyCacheClusterResult.fromJson({});
  }

  /// Modifies the parameters of a cache parameter group. You can modify up to
  /// 20 parameters in a single request by submitting a list parameter name and
  /// value pairs.
  ///
  /// [cacheParameterGroupName]: The name of the cache parameter group to
  /// modify.
  ///
  /// [parameterNameValues]: An array of parameter names and values for the
  /// parameter update. You must supply at least one parameter name and value;
  /// subsequent arguments are optional. A maximum of 20 parameters may be
  /// modified per request.
  Future<CacheParameterGroupNameMessage> modifyCacheParameterGroup(
      {@required String cacheParameterGroupName,
      @required List<ParameterNameValue> parameterNameValues}) async {
    return CacheParameterGroupNameMessage.fromJson({});
  }

  /// Modifies an existing cache subnet group.
  ///
  /// [cacheSubnetGroupName]: The name for the cache subnet group. This value is
  /// stored as a lowercase string.
  ///
  /// Constraints: Must contain no more than 255 alphanumeric characters or
  /// hyphens.
  ///
  /// Example: `mysubnetgroup`
  ///
  /// [cacheSubnetGroupDescription]: A description of the cache subnet group.
  ///
  /// [subnetIds]: The EC2 subnet IDs for the cache subnet group.
  Future<ModifyCacheSubnetGroupResult> modifyCacheSubnetGroup(
      String cacheSubnetGroupName,
      {String cacheSubnetGroupDescription,
      List<String> subnetIds}) async {
    return ModifyCacheSubnetGroupResult.fromJson({});
  }

  /// Modifies the settings for a replication group.
  ///
  /// For Redis (cluster mode enabled) clusters, this operation cannot be used
  /// to change a cluster's node type or engine version. For more information,
  /// see:
  ///
  /// *
  /// [Scaling for Amazon ElastiCache for Redis (cluster mode enabled)](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/scaling-redis-cluster-mode-enabled.html)
  /// in the ElastiCache User Guide
  ///
  /// *
  /// [ModifyReplicationGroupShardConfiguration](https://docs.aws.amazon.com/AmazonElastiCache/latest/APIReference/API_ModifyReplicationGroupShardConfiguration.html)
  /// in the ElastiCache API Reference
  ///
  ///
  ///
  ///
  /// This operation is valid for Redis only.
  ///
  /// [replicationGroupId]: The identifier of the replication group to modify.
  ///
  /// [replicationGroupDescription]: A description for the replication group.
  /// Maximum length is 255 characters.
  ///
  /// [primaryClusterId]: For replication groups with a single primary, if this
  /// parameter is specified, ElastiCache promotes the specified cluster in the
  /// specified replication group to the primary role. The nodes of all other
  /// clusters in the replication group are read replicas.
  ///
  /// [snapshottingClusterId]: The cluster ID that is used as the daily snapshot
  /// source for the replication group. This parameter cannot be set for Redis
  /// (cluster mode enabled) replication groups.
  ///
  /// [automaticFailoverEnabled]: Determines whether a read replica is
  /// automatically promoted to read/write primary if the existing primary
  /// encounters a failure.
  ///
  /// Valid values: `true` | `false`
  ///
  /// Amazon ElastiCache for Redis does not support Multi-AZ with automatic
  /// failover on:
  ///
  /// *   Redis versions earlier than 2.8.6.
  ///
  /// *   Redis (cluster mode disabled): T1 node types.
  ///
  /// *   Redis (cluster mode enabled): T1 node types.
  ///
  /// [cacheSecurityGroupNames]: A list of cache security group names to
  /// authorize for the clusters in this replication group. This change is
  /// asynchronously applied as soon as possible.
  ///
  /// This parameter can be used only with replication group containing clusters
  /// running outside of an Amazon Virtual Private Cloud (Amazon VPC).
  ///
  /// Constraints: Must contain no more than 255 alphanumeric characters. Must
  /// not be `Default`.
  ///
  /// [securityGroupIds]: Specifies the VPC Security Groups associated with the
  /// clusters in the replication group.
  ///
  /// This parameter can be used only with replication group containing clusters
  /// running in an Amazon Virtual Private Cloud (Amazon VPC).
  ///
  /// [preferredMaintenanceWindow]: Specifies the weekly time range during which
  /// maintenance on the cluster is performed. It is specified as a range in the
  /// format ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance
  /// window is a 60 minute period.
  ///
  /// Valid values for `ddd` are:
  ///
  /// *    `sun`
  ///
  /// *    `mon`
  ///
  /// *    `tue`
  ///
  /// *    `wed`
  ///
  /// *    `thu`
  ///
  /// *    `fri`
  ///
  /// *    `sat`
  ///
  ///
  /// Example: `sun:23:00-mon:01:30`
  ///
  /// [notificationTopicArn]: The Amazon Resource Name (ARN) of the Amazon SNS
  /// topic to which notifications are sent.
  ///
  ///
  ///
  /// The Amazon SNS topic owner must be same as the replication group owner.
  ///
  /// [cacheParameterGroupName]: The name of the cache parameter group to apply
  /// to all of the clusters in this replication group. This change is
  /// asynchronously applied as soon as possible for parameters when the
  /// `ApplyImmediately` parameter is specified as `true` for this request.
  ///
  /// [notificationTopicStatus]: The status of the Amazon SNS notification topic
  /// for the replication group. Notifications are sent only if the status is
  /// `active`.
  ///
  /// Valid values: `active` | `inactive`
  ///
  /// [applyImmediately]: If `true`, this parameter causes the modifications in
  /// this request and any pending modifications to be applied, asynchronously
  /// and as soon as possible, regardless of the `PreferredMaintenanceWindow`
  /// setting for the replication group.
  ///
  /// If `false`, changes to the nodes in the replication group are applied on
  /// the next maintenance reboot, or the next failure reboot, whichever occurs
  /// first.
  ///
  /// Valid values: `true` | `false`
  ///
  /// Default: `false`
  ///
  /// [engineVersion]: The upgraded version of the cache engine to be run on the
  /// clusters in the replication group.
  ///
  ///  **Important:** You can upgrade to a newer engine version (see
  /// [Selecting a Cache Engine and Version](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/SelectEngine.html#VersionManagement)),
  /// but you cannot downgrade to an earlier engine version. If you want to use
  /// an earlier engine version, you must delete the existing replication group
  /// and create it anew with the earlier engine version.
  ///
  /// [autoMinorVersionUpgrade]: This parameter is currently disabled.
  ///
  /// [snapshotRetentionLimit]: The number of days for which ElastiCache retains
  /// automatic node group (shard) snapshots before deleting them. For example,
  /// if you set `SnapshotRetentionLimit` to 5, a snapshot that was taken today
  /// is retained for 5 days before being deleted.
  ///
  ///  **Important** If the value of SnapshotRetentionLimit is set to zero (0),
  /// backups are turned off.
  ///
  /// [snapshotWindow]: The daily time range (in UTC) during which ElastiCache
  /// begins taking a daily snapshot of the node group (shard) specified by
  /// `SnapshottingClusterId`.
  ///
  /// Example: `05:00-09:00`
  ///
  /// If you do not specify this parameter, ElastiCache automatically chooses an
  /// appropriate time range.
  ///
  /// [cacheNodeType]: A valid cache node type that you want to scale this
  /// replication group to.
  ///
  /// [nodeGroupId]: Deprecated. This parameter is not used.
  Future<ModifyReplicationGroupResult> modifyReplicationGroup(
      String replicationGroupId,
      {String replicationGroupDescription,
      String primaryClusterId,
      String snapshottingClusterId,
      bool automaticFailoverEnabled,
      List<String> cacheSecurityGroupNames,
      List<String> securityGroupIds,
      String preferredMaintenanceWindow,
      String notificationTopicArn,
      String cacheParameterGroupName,
      String notificationTopicStatus,
      bool applyImmediately,
      String engineVersion,
      bool autoMinorVersionUpgrade,
      int snapshotRetentionLimit,
      String snapshotWindow,
      String cacheNodeType,
      String nodeGroupId}) async {
    return ModifyReplicationGroupResult.fromJson({});
  }

  /// Modifies a replication group's shards (node groups) by allowing you to add
  /// shards, remove shards, or rebalance the keyspaces among exisiting shards.
  ///
  /// [replicationGroupId]: The name of the Redis (cluster mode enabled) cluster
  /// (replication group) on which the shards are to be configured.
  ///
  /// [nodeGroupCount]: The number of node groups (shards) that results from the
  /// modification of the shard configuration.
  ///
  /// [applyImmediately]: Indicates that the shard reconfiguration process
  /// begins immediately. At present, the only permitted value for this
  /// parameter is `true`.
  ///
  /// Value: true
  ///
  /// [reshardingConfiguration]: Specifies the preferred availability zones for
  /// each node group in the cluster. If the value of `NodeGroupCount` is
  /// greater than the current number of node groups (shards), you can use this
  /// parameter to specify the preferred availability zones of the cluster's
  /// shards. If you omit this parameter ElastiCache selects availability zones
  /// for you.
  ///
  /// You can specify this parameter only if the value of `NodeGroupCount` is
  /// greater than the current number of node groups (shards).
  ///
  /// [nodeGroupsToRemove]: If the value of `NodeGroupCount` is less than the
  /// current number of node groups (shards), then either `NodeGroupsToRemove`
  /// or `NodeGroupsToRetain` is required. `NodeGroupsToRemove` is a list of
  /// `NodeGroupId`s to remove from the cluster.
  ///
  /// ElastiCache for Redis will attempt to remove all node groups listed by
  /// `NodeGroupsToRemove` from the cluster.
  ///
  /// [nodeGroupsToRetain]: If the value of `NodeGroupCount` is less than the
  /// current number of node groups (shards), then either `NodeGroupsToRemove`
  /// or `NodeGroupsToRetain` is required. `NodeGroupsToRetain` is a list of
  /// `NodeGroupId`s to retain in the cluster.
  ///
  /// ElastiCache for Redis will attempt to remove all node groups except those
  /// listed by `NodeGroupsToRetain` from the cluster.
  Future<ModifyReplicationGroupShardConfigurationResult>
      modifyReplicationGroupShardConfiguration(
          {@required String replicationGroupId,
          @required int nodeGroupCount,
          @required bool applyImmediately,
          List<ReshardingConfiguration> reshardingConfiguration,
          List<String> nodeGroupsToRemove,
          List<String> nodeGroupsToRetain}) async {
    return ModifyReplicationGroupShardConfigurationResult.fromJson({});
  }

  /// Allows you to purchase a reserved cache node offering.
  ///
  /// [reservedCacheNodesOfferingId]: The ID of the reserved cache node offering
  /// to purchase.
  ///
  /// Example: `438012d3-4052-4cc7-b2e3-8d3372e0e706`
  ///
  /// [reservedCacheNodeId]: A customer-specified identifier to track this
  /// reservation.
  ///
  ///  The Reserved Cache Node ID is an unique customer-specified identifier to
  /// track this reservation. If this parameter is not specified, ElastiCache
  /// automatically generates an identifier for the reservation.
  ///
  /// Example: myreservationID
  ///
  /// [cacheNodeCount]: The number of cache node instances to reserve.
  ///
  /// Default: `1`
  Future<PurchaseReservedCacheNodesOfferingResult>
      purchaseReservedCacheNodesOffering(String reservedCacheNodesOfferingId,
          {String reservedCacheNodeId, int cacheNodeCount}) async {
    return PurchaseReservedCacheNodesOfferingResult.fromJson({});
  }

  /// Reboots some, or all, of the cache nodes within a provisioned cluster.
  /// This operation applies any modified cache parameter groups to the cluster.
  /// The reboot operation takes place as soon as possible, and results in a
  /// momentary outage to the cluster. During the reboot, the cluster status is
  /// set to REBOOTING.
  ///
  /// The reboot causes the contents of the cache (for each cache node being
  /// rebooted) to be lost.
  ///
  /// When the reboot is complete, a cluster event is created.
  ///
  /// Rebooting a cluster is currently supported on Memcached and Redis (cluster
  /// mode disabled) clusters. Rebooting is not supported on Redis (cluster mode
  /// enabled) clusters.
  ///
  /// If you make changes to parameters that require a Redis (cluster mode
  /// enabled) cluster reboot for the changes to be applied, see
  /// [Rebooting a Cluster](http://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Clusters.Rebooting.html)
  /// for an alternate process.
  ///
  /// [cacheClusterId]: The cluster identifier. This parameter is stored as a
  /// lowercase string.
  ///
  /// [cacheNodeIdsToReboot]: A list of cache node IDs to reboot. A node ID is a
  /// numeric identifier (0001, 0002, etc.). To reboot an entire cluster,
  /// specify all of the cache node IDs.
  Future<RebootCacheClusterResult> rebootCacheCluster(
      {@required String cacheClusterId,
      @required List<String> cacheNodeIdsToReboot}) async {
    return RebootCacheClusterResult.fromJson({});
  }

  /// Removes the tags identified by the `TagKeys` list from the named resource.
  ///
  /// [resourceName]: The Amazon Resource Name (ARN) of the resource from which
  /// you want the tags removed, for example
  /// `arn:aws:elasticache:us-west-2:0123456789:cluster:myCluster` or
  /// `arn:aws:elasticache:us-west-2:0123456789:snapshot:mySnapshot`.
  ///
  /// For more information about ARNs, see
  /// [Amazon Resource Names (ARNs) and AWS Service Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html).
  ///
  /// [tagKeys]: A list of `TagKeys` identifying the tags you want removed from
  /// the named resource.
  Future<TagListMessage> removeTagsFromResource(
      {@required String resourceName, @required List<String> tagKeys}) async {
    return TagListMessage.fromJson({});
  }

  /// Modifies the parameters of a cache parameter group to the engine or system
  /// default value. You can reset specific parameters by submitting a list of
  /// parameter names. To reset the entire cache parameter group, specify the
  /// `ResetAllParameters` and `CacheParameterGroupName` parameters.
  ///
  /// [cacheParameterGroupName]: The name of the cache parameter group to reset.
  ///
  /// [resetAllParameters]: If `true`, all parameters in the cache parameter
  /// group are reset to their default values. If `false`, only the parameters
  /// listed by `ParameterNameValues` are reset to their default values.
  ///
  /// Valid values: `true` | `false`
  ///
  /// [parameterNameValues]: An array of parameter names to reset to their
  /// default values. If `ResetAllParameters` is `true`, do not use
  /// `ParameterNameValues`. If `ResetAllParameters` is `false`, you must
  /// specify the name of at least one parameter to reset.
  Future<CacheParameterGroupNameMessage> resetCacheParameterGroup(
      String cacheParameterGroupName,
      {bool resetAllParameters,
      List<ParameterNameValue> parameterNameValues}) async {
    return CacheParameterGroupNameMessage.fromJson({});
  }

  /// Revokes ingress from a cache security group. Use this operation to
  /// disallow access from an Amazon EC2 security group that had been previously
  /// authorized.
  ///
  /// [cacheSecurityGroupName]: The name of the cache security group to revoke
  /// ingress from.
  ///
  /// [ec2SecurityGroupName]: The name of the Amazon EC2 security group to
  /// revoke access from.
  ///
  /// [ec2SecurityGroupOwnerId]: The AWS account number of the Amazon EC2
  /// security group owner. Note that this is not the same thing as an AWS
  /// access key ID - you must provide a valid AWS account number for this
  /// parameter.
  Future<RevokeCacheSecurityGroupIngressResult> revokeCacheSecurityGroupIngress(
      {@required String cacheSecurityGroupName,
      @required String ec2SecurityGroupName,
      @required String ec2SecurityGroupOwnerId}) async {
    return RevokeCacheSecurityGroupIngressResult.fromJson({});
  }

  /// Represents the input of a `TestFailover` operation which test automatic
  /// failover on a specified node group (called shard in the console) in a
  /// replication group (called cluster in the console).
  ///
  ///  **Note the following**
  ///
  /// *   A customer can use this operation to test automatic failover on up to
  /// 5 shards (called node groups in the ElastiCache API and AWS CLI) in any
  /// rolling 24-hour period.
  ///
  /// *   If calling this operation on shards in different clusters (called
  /// replication groups in the API and CLI), the calls can be made
  /// concurrently.
  ///
  /// *   If calling this operation multiple times on different shards in the
  /// same Redis (cluster mode enabled) replication group, the first node
  /// replacement must complete before a subsequent call can be made.
  ///
  /// *   To determine whether the node replacement is complete you can check
  /// Events using the Amazon ElastiCache console, the AWS CLI, or the
  /// ElastiCache API. Look for the following automatic failover related events,
  /// listed here in order of occurrance:
  ///
  ///     1.  Replication group message: `Test Failover API called for node
  /// group <node-group-id>`
  ///
  ///     2.  Cache cluster message: `Failover from master node
  /// <primary-node-id> to replica node <node-id> completed`
  ///
  ///     3.  Replication group message: `Failover from master node
  /// <primary-node-id> to replica node <node-id> completed`
  ///
  ///     4.  Cache cluster message: `Recovering cache nodes <node-id>`
  ///
  ///     5.  Cache cluster message: `Finished recovery for cache nodes
  /// <node-id>`
  ///
  ///
  ///     For more information see:
  ///
  ///     *
  /// [Viewing ElastiCache Events](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/ECEvents.Viewing.html)
  /// in the _ElastiCache User Guide_
  ///
  ///     *
  /// [DescribeEvents](https://docs.aws.amazon.com/AmazonElastiCache/latest/APIReference/API_DescribeEvents.html)
  /// in the ElastiCache API Reference
  ///
  ///
  ///
  /// Also see,
  /// [Testing Multi-AZ with Automatic Failover](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/AutoFailover.html#auto-failover-test)
  /// in the _ElastiCache User Guide_.
  ///
  /// [replicationGroupId]: The name of the replication group (console: cluster)
  /// whose automatic failover is being tested by this operation.
  ///
  /// [nodeGroupId]: The name of the node group (called shard in the console) in
  /// this replication group on which automatic failover is to be tested. You
  /// may test automatic failover on up to 5 node groups in any rolling 24-hour
  /// period.
  Future<TestFailoverResult> testFailover(
      {@required String replicationGroupId,
      @required String nodeGroupId}) async {
    return TestFailoverResult.fromJson({});
  }
}

/// Represents the allowed node types you can use to modify your cluster or
/// replication group.
class AllowedNodeTypeModificationsMessage {
  /// A string list, each element of which specifies a cache node type which you
  /// can use to scale your cluster or replication group.
  ///
  /// When scaling up a Redis cluster or replication group using
  /// `ModifyCacheCluster` or `ModifyReplicationGroup`, use a value from this
  /// list for the `CacheNodeType` parameter.
  final List<String> scaleUpModifications;

  /// A string list, each element of which specifies a cache node type which you
  /// can use to scale your cluster or replication group.
  ///
  /// When scaling down on a Redis cluster or replication group using
  /// `ModifyCacheCluster` or `ModifyReplicationGroup`, use a value from this
  /// list for the `CacheNodeType` parameter.
  final List<String> scaleDownModifications;

  AllowedNodeTypeModificationsMessage({
    this.scaleUpModifications,
    this.scaleDownModifications,
  });
  static AllowedNodeTypeModificationsMessage fromJson(
          Map<String, dynamic> json) =>
      AllowedNodeTypeModificationsMessage();
}

class AuthorizeCacheSecurityGroupIngressResult {
  final CacheSecurityGroup cacheSecurityGroup;

  AuthorizeCacheSecurityGroupIngressResult({
    this.cacheSecurityGroup,
  });
  static AuthorizeCacheSecurityGroupIngressResult fromJson(
          Map<String, dynamic> json) =>
      AuthorizeCacheSecurityGroupIngressResult();
}

/// Describes an Availability Zone in which the cluster is launched.
class AvailabilityZone {
  /// The name of the Availability Zone.
  final String name;

  AvailabilityZone({
    this.name,
  });
  static AvailabilityZone fromJson(Map<String, dynamic> json) =>
      AvailabilityZone();
}

/// Contains all of the attributes of a specific cluster.
class CacheCluster {
  /// The user-supplied identifier of the cluster. This identifier is a unique
  /// key that identifies a cluster.
  final String cacheClusterId;

  /// Represents a Memcached cluster endpoint which, if Automatic Discovery is
  /// enabled on the cluster, can be used by an application to connect to any
  /// node in the cluster. The configuration endpoint will always have `.cfg` in
  /// it.
  ///
  /// Example: `mem-3.9dvc4r.cfg.usw2.cache.amazonaws.com:11211`
  final Endpoint configurationEndpoint;

  /// The URL of the web page where you can download the latest ElastiCache
  /// client library.
  final String clientDownloadLandingPage;

  /// The name of the compute and memory capacity node type for the cluster.
  ///
  /// The following node types are supported by ElastiCache. Generally speaking,
  /// the current generation types provide more memory and computational power
  /// at lower cost when compared to their equivalent previous generation
  /// counterparts.
  ///
  /// *   General purpose:
  ///
  ///     *   Current generation:
  ///
  ///          **M5 node types:** `cache.m5.large`, `cache.m5.xlarge`,
  /// `cache.m5.2xlarge`, `cache.m5.4xlarge`, `cache.m5.12xlarge`,
  /// `cache.m5.24xlarge`
  ///
  ///          **M4 node types:** `cache.m4.large`, `cache.m4.xlarge`,
  /// `cache.m4.2xlarge`, `cache.m4.4xlarge`, `cache.m4.10xlarge`
  ///
  ///          **T2 node types:** `cache.t2.micro`, `cache.t2.small`,
  /// `cache.t2.medium`
  ///
  ///     *   Previous generation: (not recommended)
  ///
  ///          **T1 node types:** `cache.t1.micro`
  ///
  ///          **M1 node types:** `cache.m1.small`, `cache.m1.medium`,
  /// `cache.m1.large`, `cache.m1.xlarge`
  ///
  ///          **M3 node types:** `cache.m3.medium`, `cache.m3.large`,
  /// `cache.m3.xlarge`, `cache.m3.2xlarge`
  ///
  ///
  /// *   Compute optimized:
  ///
  ///     *   Previous generation: (not recommended)
  ///
  ///          **C1 node types:** `cache.c1.xlarge`
  ///
  ///
  /// *   Memory optimized:
  ///
  ///     *   Current generation:
  ///
  ///          **R5 node types:** `cache.r5.large`, `cache.r5.xlarge`,
  /// `cache.r5.2xlarge`, `cache.r5.4xlarge`, `cache.r5.12xlarge`,
  /// `cache.r5.24xlarge`
  ///
  ///          **R4 node types:** `cache.r4.large`, `cache.r4.xlarge`,
  /// `cache.r4.2xlarge`, `cache.r4.4xlarge`, `cache.r4.8xlarge`,
  /// `cache.r4.16xlarge`
  ///
  ///     *   Previous generation: (not recommended)
  ///
  ///          **M2 node types:** `cache.m2.xlarge`, `cache.m2.2xlarge`,
  /// `cache.m2.4xlarge`
  ///
  ///          **R3 node types:** `cache.r3.large`, `cache.r3.xlarge`,
  /// `cache.r3.2xlarge`, `cache.r3.4xlarge`, `cache.r3.8xlarge`
  ///
  ///
  ///
  ///  **Additional node type info**
  ///
  /// *   All current generation instance types are created in Amazon VPC by
  /// default.
  ///
  /// *   Redis append-only files (AOF) are not supported for T1 or T2
  /// instances.
  ///
  /// *   Redis Multi-AZ with automatic failover is not supported on T1
  /// instances.
  ///
  /// *   Redis configuration variables `appendonly` and `appendfsync` are not
  /// supported on Redis version 2.8.22 and later.
  final String cacheNodeType;

  /// The name of the cache engine (`memcached` or `redis`) to be used for this
  /// cluster.
  final String engine;

  /// The version of the cache engine that is used in this cluster.
  final String engineVersion;

  /// The current state of this cluster, one of the following values:
  /// `available`, `creating`, `deleted`, `deleting`, `incompatible-network`,
  /// `modifying`, `rebooting cluster nodes`, `restore-failed`, or
  /// `snapshotting`.
  final String cacheClusterStatus;

  /// The number of cache nodes in the cluster.
  ///
  /// For clusters running Redis, this value must be 1. For clusters running
  /// Memcached, this value must be between 1 and 20.
  final int numCacheNodes;

  /// The name of the Availability Zone in which the cluster is located or
  /// "Multiple" if the cache nodes are located in different Availability Zones.
  final String preferredAvailabilityZone;

  /// The date and time when the cluster was created.
  final DateTime cacheClusterCreateTime;

  /// Specifies the weekly time range during which maintenance on the cluster is
  /// performed. It is specified as a range in the format
  /// ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance window is
  /// a 60 minute period.
  ///
  /// Valid values for `ddd` are:
  ///
  /// *    `sun`
  ///
  /// *    `mon`
  ///
  /// *    `tue`
  ///
  /// *    `wed`
  ///
  /// *    `thu`
  ///
  /// *    `fri`
  ///
  /// *    `sat`
  ///
  ///
  /// Example: `sun:23:00-mon:01:30`
  final String preferredMaintenanceWindow;

  final PendingModifiedValues pendingModifiedValues;

  /// Describes a notification topic and its status. Notification topics are
  /// used for publishing ElastiCache events to subscribers using Amazon Simple
  /// Notification Service (SNS).
  final NotificationConfiguration notificationConfiguration;

  /// A list of cache security group elements, composed of name and status
  /// sub-elements.
  final List<CacheSecurityGroupMembership> cacheSecurityGroups;

  /// Status of the cache parameter group.
  final CacheParameterGroupStatus cacheParameterGroup;

  /// The name of the cache subnet group associated with the cluster.
  final String cacheSubnetGroupName;

  /// A list of cache nodes that are members of the cluster.
  final List<CacheNode> cacheNodes;

  /// This parameter is currently disabled.
  final bool autoMinorVersionUpgrade;

  /// A list of VPC Security Groups associated with the cluster.
  final List<SecurityGroupMembership> securityGroups;

  /// The replication group to which this cluster belongs. If this field is
  /// empty, the cluster is not associated with any replication group.
  final String replicationGroupId;

  /// The number of days for which ElastiCache retains automatic cluster
  /// snapshots before deleting them. For example, if you set
  /// `SnapshotRetentionLimit` to 5, a snapshot that was taken today is retained
  /// for 5 days before being deleted.
  ///
  ///   If the value of SnapshotRetentionLimit is set to zero (0), backups are
  /// turned off.
  final int snapshotRetentionLimit;

  /// The daily time range (in UTC) during which ElastiCache begins taking a
  /// daily snapshot of your cluster.
  ///
  /// Example: `05:00-09:00`
  final String snapshotWindow;

  /// A flag that enables using an `AuthToken` (password) when issuing Redis
  /// commands.
  ///
  /// Default: `false`
  final bool authTokenEnabled;

  /// A flag that enables in-transit encryption when set to `true`.
  ///
  /// You cannot modify the value of `TransitEncryptionEnabled` after the
  /// cluster is created. To enable in-transit encryption on a cluster you must
  /// set `TransitEncryptionEnabled` to `true` when you create a cluster.
  ///
  ///  **Required:** Only available when creating a replication group in an
  /// Amazon VPC using redis version `3.2.6`, `4.x` or later.
  ///
  /// Default: `false`
  final bool transitEncryptionEnabled;

  /// A flag that enables encryption at-rest when set to `true`.
  ///
  /// You cannot modify the value of `AtRestEncryptionEnabled` after the cluster
  /// is created. To enable at-rest encryption on a cluster you must set
  /// `AtRestEncryptionEnabled` to `true` when you create a cluster.
  ///
  ///  **Required:** Only available when creating a replication group in an
  /// Amazon VPC using redis version `3.2.6`, `4.x` or later.
  ///
  /// Default: `false`
  final bool atRestEncryptionEnabled;

  CacheCluster({
    this.cacheClusterId,
    this.configurationEndpoint,
    this.clientDownloadLandingPage,
    this.cacheNodeType,
    this.engine,
    this.engineVersion,
    this.cacheClusterStatus,
    this.numCacheNodes,
    this.preferredAvailabilityZone,
    this.cacheClusterCreateTime,
    this.preferredMaintenanceWindow,
    this.pendingModifiedValues,
    this.notificationConfiguration,
    this.cacheSecurityGroups,
    this.cacheParameterGroup,
    this.cacheSubnetGroupName,
    this.cacheNodes,
    this.autoMinorVersionUpgrade,
    this.securityGroups,
    this.replicationGroupId,
    this.snapshotRetentionLimit,
    this.snapshotWindow,
    this.authTokenEnabled,
    this.transitEncryptionEnabled,
    this.atRestEncryptionEnabled,
  });
  static CacheCluster fromJson(Map<String, dynamic> json) => CacheCluster();
}

/// Represents the output of a `DescribeCacheClusters` operation.
class CacheClusterMessage {
  /// Provides an identifier to allow retrieval of paginated results.
  final String marker;

  /// A list of clusters. Each item in the list contains detailed information
  /// about one cluster.
  final List<CacheCluster> cacheClusters;

  CacheClusterMessage({
    this.marker,
    this.cacheClusters,
  });
  static CacheClusterMessage fromJson(Map<String, dynamic> json) =>
      CacheClusterMessage();
}

/// Provides all of the details about a particular cache engine version.
class CacheEngineVersion {
  /// The name of the cache engine.
  final String engine;

  /// The version number of the cache engine.
  final String engineVersion;

  /// The name of the cache parameter group family associated with this cache
  /// engine.
  ///
  /// Valid values are: `memcached1.4` | `memcached1.5` | `redis2.6` |
  /// `redis2.8` | `redis3.2` | `redis4.0` | `redis5.0` |
  final String cacheParameterGroupFamily;

  /// The description of the cache engine.
  final String cacheEngineDescription;

  /// The description of the cache engine version.
  final String cacheEngineVersionDescription;

  CacheEngineVersion({
    this.engine,
    this.engineVersion,
    this.cacheParameterGroupFamily,
    this.cacheEngineDescription,
    this.cacheEngineVersionDescription,
  });
  static CacheEngineVersion fromJson(Map<String, dynamic> json) =>
      CacheEngineVersion();
}

/// Represents the output of a DescribeCacheEngineVersions operation.
class CacheEngineVersionMessage {
  /// Provides an identifier to allow retrieval of paginated results.
  final String marker;

  /// A list of cache engine version details. Each element in the list contains
  /// detailed information about one cache engine version.
  final List<CacheEngineVersion> cacheEngineVersions;

  CacheEngineVersionMessage({
    this.marker,
    this.cacheEngineVersions,
  });
  static CacheEngineVersionMessage fromJson(Map<String, dynamic> json) =>
      CacheEngineVersionMessage();
}

/// Represents an individual cache node within a cluster. Each cache node runs
/// its own instance of the cluster's protocol-compliant caching software -
/// either Memcached or Redis.
///
/// The following node types are supported by ElastiCache. Generally speaking,
/// the current generation types provide more memory and computational power at
/// lower cost when compared to their equivalent previous generation
/// counterparts.
///
/// *   General purpose:
///
///     *   Current generation:
///
///          **M5 node types:** `cache.m5.large`, `cache.m5.xlarge`,
/// `cache.m5.2xlarge`, `cache.m5.4xlarge`, `cache.m5.12xlarge`,
/// `cache.m5.24xlarge`
///
///          **M4 node types:** `cache.m4.large`, `cache.m4.xlarge`,
/// `cache.m4.2xlarge`, `cache.m4.4xlarge`, `cache.m4.10xlarge`
///
///          **T2 node types:** `cache.t2.micro`, `cache.t2.small`,
/// `cache.t2.medium`
///
///     *   Previous generation: (not recommended)
///
///          **T1 node types:** `cache.t1.micro`
///
///          **M1 node types:** `cache.m1.small`, `cache.m1.medium`,
/// `cache.m1.large`, `cache.m1.xlarge`
///
///          **M3 node types:** `cache.m3.medium`, `cache.m3.large`,
/// `cache.m3.xlarge`, `cache.m3.2xlarge`
///
///
/// *   Compute optimized:
///
///     *   Previous generation: (not recommended)
///
///          **C1 node types:** `cache.c1.xlarge`
///
///
/// *   Memory optimized:
///
///     *   Current generation:
///
///          **R5 node types:** `cache.r5.large`, `cache.r5.xlarge`,
/// `cache.r5.2xlarge`, `cache.r5.4xlarge`, `cache.r5.12xlarge`,
/// `cache.r5.24xlarge`
///
///          **R4 node types:** `cache.r4.large`, `cache.r4.xlarge`,
/// `cache.r4.2xlarge`, `cache.r4.4xlarge`, `cache.r4.8xlarge`,
/// `cache.r4.16xlarge`
///
///     *   Previous generation: (not recommended)
///
///          **M2 node types:** `cache.m2.xlarge`, `cache.m2.2xlarge`,
/// `cache.m2.4xlarge`
///
///          **R3 node types:** `cache.r3.large`, `cache.r3.xlarge`,
/// `cache.r3.2xlarge`, `cache.r3.4xlarge`, `cache.r3.8xlarge`
///
///
///
///  **Additional node type info**
///
/// *   All current generation instance types are created in Amazon VPC by
/// default.
///
/// *   Redis append-only files (AOF) are not supported for T1 or T2 instances.
///
/// *   Redis Multi-AZ with automatic failover is not supported on T1 instances.
///
/// *   Redis configuration variables `appendonly` and `appendfsync` are not
/// supported on Redis version 2.8.22 and later.
class CacheNode {
  /// The cache node identifier. A node ID is a numeric identifier (0001, 0002,
  /// etc.). The combination of cluster ID and node ID uniquely identifies every
  /// cache node used in a customer's AWS account.
  final String cacheNodeId;

  /// The current state of this cache node.
  final String cacheNodeStatus;

  /// The date and time when the cache node was created.
  final DateTime cacheNodeCreateTime;

  /// The hostname for connecting to this cache node.
  final Endpoint endpoint;

  /// The status of the parameter group applied to this cache node.
  final String parameterGroupStatus;

  /// The ID of the primary node to which this read replica node is
  /// synchronized. If this field is empty, this node is not associated with a
  /// primary cluster.
  final String sourceCacheNodeId;

  /// The Availability Zone where this node was created and now resides.
  final String customerAvailabilityZone;

  CacheNode({
    this.cacheNodeId,
    this.cacheNodeStatus,
    this.cacheNodeCreateTime,
    this.endpoint,
    this.parameterGroupStatus,
    this.sourceCacheNodeId,
    this.customerAvailabilityZone,
  });
  static CacheNode fromJson(Map<String, dynamic> json) => CacheNode();
}

/// A parameter that has a different value for each cache node type it is
/// applied to. For example, in a Redis cluster, a `cache.m1.large` cache node
/// type would have a larger `maxmemory` value than a `cache.m1.small` type.
class CacheNodeTypeSpecificParameter {
  /// The name of the parameter.
  final String parameterName;

  /// A description of the parameter.
  final String description;

  /// The source of the parameter value.
  final String source;

  /// The valid data type for the parameter.
  final String dataType;

  /// The valid range of values for the parameter.
  final String allowedValues;

  /// Indicates whether (`true`) or not (`false`) the parameter can be modified.
  /// Some parameters have security or operational implications that prevent
  /// them from being changed.
  final bool isModifiable;

  /// The earliest cache engine version to which the parameter can apply.
  final String minimumEngineVersion;

  /// A list of cache node types and their corresponding values for this
  /// parameter.
  final List<CacheNodeTypeSpecificValue> cacheNodeTypeSpecificValues;

  /// Indicates whether a change to the parameter is applied immediately or
  /// requires a reboot for the change to be applied. You can force a reboot or
  /// wait until the next maintenance window's reboot. For more information, see
  /// [Rebooting a Cluster](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Clusters.Rebooting.html).
  final String changeType;

  CacheNodeTypeSpecificParameter({
    this.parameterName,
    this.description,
    this.source,
    this.dataType,
    this.allowedValues,
    this.isModifiable,
    this.minimumEngineVersion,
    this.cacheNodeTypeSpecificValues,
    this.changeType,
  });
  static CacheNodeTypeSpecificParameter fromJson(Map<String, dynamic> json) =>
      CacheNodeTypeSpecificParameter();
}

/// A value that applies only to a certain cache node type.
class CacheNodeTypeSpecificValue {
  /// The cache node type for which this value applies.
  final String cacheNodeType;

  /// The value for the cache node type.
  final String value;

  CacheNodeTypeSpecificValue({
    this.cacheNodeType,
    this.value,
  });
  static CacheNodeTypeSpecificValue fromJson(Map<String, dynamic> json) =>
      CacheNodeTypeSpecificValue();
}

/// Represents the output of a `CreateCacheParameterGroup` operation.
class CacheParameterGroup {
  /// The name of the cache parameter group.
  final String cacheParameterGroupName;

  /// The name of the cache parameter group family that this cache parameter
  /// group is compatible with.
  ///
  /// Valid values are: `memcached1.4` | `memcached1.5` | `redis2.6` |
  /// `redis2.8` | `redis3.2` | `redis4.0` | `redis5.0` |
  final String cacheParameterGroupFamily;

  /// The description for this cache parameter group.
  final String description;

  CacheParameterGroup({
    this.cacheParameterGroupName,
    this.cacheParameterGroupFamily,
    this.description,
  });
  static CacheParameterGroup fromJson(Map<String, dynamic> json) =>
      CacheParameterGroup();
}

/// Represents the output of a `DescribeCacheParameters` operation.
class CacheParameterGroupDetails {
  /// Provides an identifier to allow retrieval of paginated results.
  final String marker;

  /// A list of Parameter instances.
  final List<Parameter> parameters;

  /// A list of parameters specific to a particular cache node type. Each
  /// element in the list contains detailed information about one parameter.
  final List<CacheNodeTypeSpecificParameter> cacheNodeTypeSpecificParameters;

  CacheParameterGroupDetails({
    this.marker,
    this.parameters,
    this.cacheNodeTypeSpecificParameters,
  });
  static CacheParameterGroupDetails fromJson(Map<String, dynamic> json) =>
      CacheParameterGroupDetails();
}

/// Represents the output of one of the following operations:
///
/// *    `ModifyCacheParameterGroup`
///
/// *    `ResetCacheParameterGroup`
class CacheParameterGroupNameMessage {
  /// The name of the cache parameter group.
  final String cacheParameterGroupName;

  CacheParameterGroupNameMessage({
    this.cacheParameterGroupName,
  });
  static CacheParameterGroupNameMessage fromJson(Map<String, dynamic> json) =>
      CacheParameterGroupNameMessage();
}

/// Status of the cache parameter group.
class CacheParameterGroupStatus {
  /// The name of the cache parameter group.
  final String cacheParameterGroupName;

  /// The status of parameter updates.
  final String parameterApplyStatus;

  /// A list of the cache node IDs which need to be rebooted for parameter
  /// changes to be applied. A node ID is a numeric identifier (0001, 0002,
  /// etc.).
  final List<String> cacheNodeIdsToReboot;

  CacheParameterGroupStatus({
    this.cacheParameterGroupName,
    this.parameterApplyStatus,
    this.cacheNodeIdsToReboot,
  });
  static CacheParameterGroupStatus fromJson(Map<String, dynamic> json) =>
      CacheParameterGroupStatus();
}

/// Represents the output of a `DescribeCacheParameterGroups` operation.
class CacheParameterGroupsMessage {
  /// Provides an identifier to allow retrieval of paginated results.
  final String marker;

  /// A list of cache parameter groups. Each element in the list contains
  /// detailed information about one cache parameter group.
  final List<CacheParameterGroup> cacheParameterGroups;

  CacheParameterGroupsMessage({
    this.marker,
    this.cacheParameterGroups,
  });
  static CacheParameterGroupsMessage fromJson(Map<String, dynamic> json) =>
      CacheParameterGroupsMessage();
}

/// Represents the output of one of the following operations:
///
/// *    `AuthorizeCacheSecurityGroupIngress`
///
/// *    `CreateCacheSecurityGroup`
///
/// *    `RevokeCacheSecurityGroupIngress`
class CacheSecurityGroup {
  /// The AWS account ID of the cache security group owner.
  final String ownerId;

  /// The name of the cache security group.
  final String cacheSecurityGroupName;

  /// The description of the cache security group.
  final String description;

  /// A list of Amazon EC2 security groups that are associated with this cache
  /// security group.
  final List<Ec2SecurityGroup> ec2SecurityGroups;

  CacheSecurityGroup({
    this.ownerId,
    this.cacheSecurityGroupName,
    this.description,
    this.ec2SecurityGroups,
  });
  static CacheSecurityGroup fromJson(Map<String, dynamic> json) =>
      CacheSecurityGroup();
}

/// Represents a cluster's status within a particular cache security group.
class CacheSecurityGroupMembership {
  /// The name of the cache security group.
  final String cacheSecurityGroupName;

  /// The membership status in the cache security group. The status changes when
  /// a cache security group is modified, or when the cache security groups
  /// assigned to a cluster are modified.
  final String status;

  CacheSecurityGroupMembership({
    this.cacheSecurityGroupName,
    this.status,
  });
  static CacheSecurityGroupMembership fromJson(Map<String, dynamic> json) =>
      CacheSecurityGroupMembership();
}

/// Represents the output of a `DescribeCacheSecurityGroups` operation.
class CacheSecurityGroupMessage {
  /// Provides an identifier to allow retrieval of paginated results.
  final String marker;

  /// A list of cache security groups. Each element in the list contains
  /// detailed information about one group.
  final List<CacheSecurityGroup> cacheSecurityGroups;

  CacheSecurityGroupMessage({
    this.marker,
    this.cacheSecurityGroups,
  });
  static CacheSecurityGroupMessage fromJson(Map<String, dynamic> json) =>
      CacheSecurityGroupMessage();
}

/// Represents the output of one of the following operations:
///
/// *    `CreateCacheSubnetGroup`
///
/// *    `ModifyCacheSubnetGroup`
class CacheSubnetGroup {
  /// The name of the cache subnet group.
  final String cacheSubnetGroupName;

  /// The description of the cache subnet group.
  final String cacheSubnetGroupDescription;

  /// The Amazon Virtual Private Cloud identifier (VPC ID) of the cache subnet
  /// group.
  final String vpcId;

  /// A list of subnets associated with the cache subnet group.
  final List<Subnet> subnets;

  CacheSubnetGroup({
    this.cacheSubnetGroupName,
    this.cacheSubnetGroupDescription,
    this.vpcId,
    this.subnets,
  });
  static CacheSubnetGroup fromJson(Map<String, dynamic> json) =>
      CacheSubnetGroup();
}

/// Represents the output of a `DescribeCacheSubnetGroups` operation.
class CacheSubnetGroupMessage {
  /// Provides an identifier to allow retrieval of paginated results.
  final String marker;

  /// A list of cache subnet groups. Each element in the list contains detailed
  /// information about one group.
  final List<CacheSubnetGroup> cacheSubnetGroups;

  CacheSubnetGroupMessage({
    this.marker,
    this.cacheSubnetGroups,
  });
  static CacheSubnetGroupMessage fromJson(Map<String, dynamic> json) =>
      CacheSubnetGroupMessage();
}

/// Node group (shard) configuration options when adding or removing replicas.
/// Each node group (shard) configuration has the following members:
/// NodeGroupId, NewReplicaCount, and PreferredAvailabilityZones.
class ConfigureShard {
  /// The 4-digit id for the node group you are configuring. For Redis (cluster
  /// mode disabled) replication groups, the node group id is always 0001. To
  /// find a Redis (cluster mode enabled)'s node group's (shard's) id, see
  /// [Finding a Shard's Id](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/shard-find-id.html).
  final String nodeGroupId;

  /// The number of replicas you want in this node group at the end of this
  /// operation. The maximum value for `NewReplicaCount` is 5. The minimum value
  /// depends upon the type of Redis replication group you are working with.
  ///
  /// The minimum number of replicas in a shard or replication group is:
  ///
  /// *   Redis (cluster mode disabled)
  ///
  ///     *   If Multi-AZ with Automatic Failover is enabled: 1
  ///
  ///     *   If Multi-AZ with Automatic Failover is not enable: 0
  ///
  ///
  /// *   Redis (cluster mode enabled): 0 (though you will not be able to
  /// failover to a replica if your primary node fails)
  final int newReplicaCount;

  /// A list of `PreferredAvailabilityZone` strings that specify which
  /// availability zones the replication group's nodes are to be in. The nummber
  /// of `PreferredAvailabilityZone` values must equal the value of
  /// `NewReplicaCount` plus 1 to account for the primary node. If this member
  /// of `ReplicaConfiguration` is omitted, ElastiCache for Redis selects the
  /// availability zone for each of the replicas.
  final List<String> preferredAvailabilityZones;

  ConfigureShard({
    @required this.nodeGroupId,
    @required this.newReplicaCount,
    this.preferredAvailabilityZones,
  });
}

class CopySnapshotResult {
  final Snapshot snapshot;

  CopySnapshotResult({
    this.snapshot,
  });
  static CopySnapshotResult fromJson(Map<String, dynamic> json) =>
      CopySnapshotResult();
}

class CreateCacheClusterResult {
  final CacheCluster cacheCluster;

  CreateCacheClusterResult({
    this.cacheCluster,
  });
  static CreateCacheClusterResult fromJson(Map<String, dynamic> json) =>
      CreateCacheClusterResult();
}

class CreateCacheParameterGroupResult {
  final CacheParameterGroup cacheParameterGroup;

  CreateCacheParameterGroupResult({
    this.cacheParameterGroup,
  });
  static CreateCacheParameterGroupResult fromJson(Map<String, dynamic> json) =>
      CreateCacheParameterGroupResult();
}

class CreateCacheSecurityGroupResult {
  final CacheSecurityGroup cacheSecurityGroup;

  CreateCacheSecurityGroupResult({
    this.cacheSecurityGroup,
  });
  static CreateCacheSecurityGroupResult fromJson(Map<String, dynamic> json) =>
      CreateCacheSecurityGroupResult();
}

class CreateCacheSubnetGroupResult {
  final CacheSubnetGroup cacheSubnetGroup;

  CreateCacheSubnetGroupResult({
    this.cacheSubnetGroup,
  });
  static CreateCacheSubnetGroupResult fromJson(Map<String, dynamic> json) =>
      CreateCacheSubnetGroupResult();
}

class CreateReplicationGroupResult {
  final ReplicationGroup replicationGroup;

  CreateReplicationGroupResult({
    this.replicationGroup,
  });
  static CreateReplicationGroupResult fromJson(Map<String, dynamic> json) =>
      CreateReplicationGroupResult();
}

class CreateSnapshotResult {
  final Snapshot snapshot;

  CreateSnapshotResult({
    this.snapshot,
  });
  static CreateSnapshotResult fromJson(Map<String, dynamic> json) =>
      CreateSnapshotResult();
}

class DecreaseReplicaCountResult {
  final ReplicationGroup replicationGroup;

  DecreaseReplicaCountResult({
    this.replicationGroup,
  });
  static DecreaseReplicaCountResult fromJson(Map<String, dynamic> json) =>
      DecreaseReplicaCountResult();
}

class DeleteCacheClusterResult {
  final CacheCluster cacheCluster;

  DeleteCacheClusterResult({
    this.cacheCluster,
  });
  static DeleteCacheClusterResult fromJson(Map<String, dynamic> json) =>
      DeleteCacheClusterResult();
}

class DeleteReplicationGroupResult {
  final ReplicationGroup replicationGroup;

  DeleteReplicationGroupResult({
    this.replicationGroup,
  });
  static DeleteReplicationGroupResult fromJson(Map<String, dynamic> json) =>
      DeleteReplicationGroupResult();
}

class DeleteSnapshotResult {
  final Snapshot snapshot;

  DeleteSnapshotResult({
    this.snapshot,
  });
  static DeleteSnapshotResult fromJson(Map<String, dynamic> json) =>
      DeleteSnapshotResult();
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

/// Represents the output of a `DescribeSnapshots` operation.
class DescribeSnapshotsListMessage {
  /// An optional marker returned from a prior request. Use this marker for
  /// pagination of results from this operation. If this parameter is specified,
  /// the response includes only records beyond the marker, up to the value
  /// specified by `MaxRecords`.
  final String marker;

  /// A list of snapshots. Each item in the list contains detailed information
  /// about one snapshot.
  final List<Snapshot> snapshots;

  DescribeSnapshotsListMessage({
    this.marker,
    this.snapshots,
  });
  static DescribeSnapshotsListMessage fromJson(Map<String, dynamic> json) =>
      DescribeSnapshotsListMessage();
}

/// Provides ownership and status information for an Amazon EC2 security group.
class Ec2SecurityGroup {
  /// The status of the Amazon EC2 security group.
  final String status;

  /// The name of the Amazon EC2 security group.
  final String ec2SecurityGroupName;

  /// The AWS account ID of the Amazon EC2 security group owner.
  final String ec2SecurityGroupOwnerId;

  Ec2SecurityGroup({
    this.status,
    this.ec2SecurityGroupName,
    this.ec2SecurityGroupOwnerId,
  });
  static Ec2SecurityGroup fromJson(Map<String, dynamic> json) =>
      Ec2SecurityGroup();
}

/// Represents the information required for client programs to connect to a
/// cache node.
class Endpoint {
  /// The DNS hostname of the cache node.
  final String address;

  /// The port number that the cache engine is listening on.
  final int port;

  Endpoint({
    this.address,
    this.port,
  });
  static Endpoint fromJson(Map<String, dynamic> json) => Endpoint();
}

/// Represents the output of a `DescribeEngineDefaultParameters` operation.
class EngineDefaults {
  /// Specifies the name of the cache parameter group family to which the engine
  /// default parameters apply.
  ///
  /// Valid values are: `memcached1.4` | `memcached1.5` | `redis2.6` |
  /// `redis2.8` | `redis3.2` | `redis4.0` | `redis5.0` |
  final String cacheParameterGroupFamily;

  /// Provides an identifier to allow retrieval of paginated results.
  final String marker;

  /// Contains a list of engine default parameters.
  final List<Parameter> parameters;

  /// A list of parameters specific to a particular cache node type. Each
  /// element in the list contains detailed information about one parameter.
  final List<CacheNodeTypeSpecificParameter> cacheNodeTypeSpecificParameters;

  EngineDefaults({
    this.cacheParameterGroupFamily,
    this.marker,
    this.parameters,
    this.cacheNodeTypeSpecificParameters,
  });
  static EngineDefaults fromJson(Map<String, dynamic> json) => EngineDefaults();
}

/// Represents a single occurrence of something interesting within the system.
/// Some examples of events are creating a cluster, adding or removing a cache
/// node, or rebooting a node.
class Event {
  /// The identifier for the source of the event. For example, if the event
  /// occurred at the cluster level, the identifier would be the name of the
  /// cluster.
  final String sourceIdentifier;

  /// Specifies the origin of this event - a cluster, a parameter group, a
  /// security group, etc.
  final String sourceType;

  /// The text of the event.
  final String message;

  /// The date and time when the event occurred.
  final DateTime date;

  Event({
    this.sourceIdentifier,
    this.sourceType,
    this.message,
    this.date,
  });
  static Event fromJson(Map<String, dynamic> json) => Event();
}

/// Represents the output of a `DescribeEvents` operation.
class EventsMessage {
  /// Provides an identifier to allow retrieval of paginated results.
  final String marker;

  /// A list of events. Each element in the list contains detailed information
  /// about one event.
  final List<Event> events;

  EventsMessage({
    this.marker,
    this.events,
  });
  static EventsMessage fromJson(Map<String, dynamic> json) => EventsMessage();
}

class IncreaseReplicaCountResult {
  final ReplicationGroup replicationGroup;

  IncreaseReplicaCountResult({
    this.replicationGroup,
  });
  static IncreaseReplicaCountResult fromJson(Map<String, dynamic> json) =>
      IncreaseReplicaCountResult();
}

class ModifyCacheClusterResult {
  final CacheCluster cacheCluster;

  ModifyCacheClusterResult({
    this.cacheCluster,
  });
  static ModifyCacheClusterResult fromJson(Map<String, dynamic> json) =>
      ModifyCacheClusterResult();
}

class ModifyCacheSubnetGroupResult {
  final CacheSubnetGroup cacheSubnetGroup;

  ModifyCacheSubnetGroupResult({
    this.cacheSubnetGroup,
  });
  static ModifyCacheSubnetGroupResult fromJson(Map<String, dynamic> json) =>
      ModifyCacheSubnetGroupResult();
}

class ModifyReplicationGroupResult {
  final ReplicationGroup replicationGroup;

  ModifyReplicationGroupResult({
    this.replicationGroup,
  });
  static ModifyReplicationGroupResult fromJson(Map<String, dynamic> json) =>
      ModifyReplicationGroupResult();
}

class ModifyReplicationGroupShardConfigurationResult {
  final ReplicationGroup replicationGroup;

  ModifyReplicationGroupShardConfigurationResult({
    this.replicationGroup,
  });
  static ModifyReplicationGroupShardConfigurationResult fromJson(
          Map<String, dynamic> json) =>
      ModifyReplicationGroupShardConfigurationResult();
}

/// Represents a collection of cache nodes in a replication group. One node in
/// the node group is the read/write primary node. All the other nodes are
/// read-only Replica nodes.
class NodeGroup {
  /// The identifier for the node group (shard). A Redis (cluster mode disabled)
  /// replication group contains only 1 node group; therefore, the node group ID
  /// is 0001. A Redis (cluster mode enabled) replication group contains 1 to 90
  /// node groups numbered 0001 to 0090. Optionally, the user can provide the id
  /// for a node group.
  final String nodeGroupId;

  /// The current state of this replication group - `creating`, `available`,
  /// etc.
  final String status;

  /// The endpoint of the primary node in this node group (shard).
  final Endpoint primaryEndpoint;

  /// The endpoint of the replica nodes in this node group (shard).
  final Endpoint readerEndpoint;

  /// The keyspace for this node group (shard).
  final String slots;

  /// A list containing information about individual nodes within the node group
  /// (shard).
  final List<NodeGroupMember> nodeGroupMembers;

  NodeGroup({
    this.nodeGroupId,
    this.status,
    this.primaryEndpoint,
    this.readerEndpoint,
    this.slots,
    this.nodeGroupMembers,
  });
  static NodeGroup fromJson(Map<String, dynamic> json) => NodeGroup();
}

/// Node group (shard) configuration options. Each node group (shard)
/// configuration has the following: `Slots`, `PrimaryAvailabilityZone`,
/// `ReplicaAvailabilityZones`, `ReplicaCount`.
class NodeGroupConfiguration {
  /// Either the ElastiCache for Redis supplied 4-digit id or a user supplied id
  /// for the node group these configuration values apply to.
  final String nodeGroupId;

  /// A string that specifies the keyspace for a particular node group.
  /// Keyspaces range from 0 to 16,383. The string is in the format
  /// `startkey-endkey`.
  ///
  /// Example: `"0-3999"`
  final String slots;

  /// The number of read replica nodes in this node group (shard).
  final int replicaCount;

  /// The Availability Zone where the primary node of this node group (shard) is
  /// launched.
  final String primaryAvailabilityZone;

  /// A list of Availability Zones to be used for the read replicas. The number
  /// of Availability Zones in this list must match the value of `ReplicaCount`
  /// or `ReplicasPerNodeGroup` if not specified.
  final List<String> replicaAvailabilityZones;

  NodeGroupConfiguration({
    this.nodeGroupId,
    this.slots,
    this.replicaCount,
    this.primaryAvailabilityZone,
    this.replicaAvailabilityZones,
  });
  static NodeGroupConfiguration fromJson(Map<String, dynamic> json) =>
      NodeGroupConfiguration();
}

/// Represents a single node within a node group (shard).
class NodeGroupMember {
  /// The ID of the cluster to which the node belongs.
  final String cacheClusterId;

  /// The ID of the node within its cluster. A node ID is a numeric identifier
  /// (0001, 0002, etc.).
  final String cacheNodeId;

  /// The information required for client programs to connect to a node for read
  /// operations. The read endpoint is only applicable on Redis (cluster mode
  /// disabled) clusters.
  final Endpoint readEndpoint;

  /// The name of the Availability Zone in which the node is located.
  final String preferredAvailabilityZone;

  /// The role that is currently assigned to the node - `primary` or `replica`.
  /// This member is only applicable for Redis (cluster mode disabled)
  /// replication groups.
  final String currentRole;

  NodeGroupMember({
    this.cacheClusterId,
    this.cacheNodeId,
    this.readEndpoint,
    this.preferredAvailabilityZone,
    this.currentRole,
  });
  static NodeGroupMember fromJson(Map<String, dynamic> json) =>
      NodeGroupMember();
}

/// The status of the service update on the node group member
class NodeGroupMemberUpdateStatus {
  /// The cache cluster ID
  final String cacheClusterId;

  /// The node ID of the cache cluster
  final String cacheNodeId;

  /// The update status of the node
  final String nodeUpdateStatus;

  /// The deletion date of the node
  final DateTime nodeDeletionDate;

  /// The start date of the update for a node
  final DateTime nodeUpdateStartDate;

  /// The end date of the update for a node
  final DateTime nodeUpdateEndDate;

  /// Reflects whether the update was initiated by the customer or automatically
  /// applied
  final String nodeUpdateInitiatedBy;

  /// The date when the update is triggered
  final DateTime nodeUpdateInitiatedDate;

  /// The date when the NodeUpdateStatus was last modified
  final DateTime nodeUpdateStatusModifiedDate;

  NodeGroupMemberUpdateStatus({
    this.cacheClusterId,
    this.cacheNodeId,
    this.nodeUpdateStatus,
    this.nodeDeletionDate,
    this.nodeUpdateStartDate,
    this.nodeUpdateEndDate,
    this.nodeUpdateInitiatedBy,
    this.nodeUpdateInitiatedDate,
    this.nodeUpdateStatusModifiedDate,
  });
  static NodeGroupMemberUpdateStatus fromJson(Map<String, dynamic> json) =>
      NodeGroupMemberUpdateStatus();
}

/// The status of the service update on the node group
class NodeGroupUpdateStatus {
  /// The ID of the node group
  final String nodeGroupId;

  /// The status of the service update on the node group member
  final List<NodeGroupMemberUpdateStatus> nodeGroupMemberUpdateStatus;

  NodeGroupUpdateStatus({
    this.nodeGroupId,
    this.nodeGroupMemberUpdateStatus,
  });
  static NodeGroupUpdateStatus fromJson(Map<String, dynamic> json) =>
      NodeGroupUpdateStatus();
}

/// Represents an individual cache node in a snapshot of a cluster.
class NodeSnapshot {
  /// A unique identifier for the source cluster.
  final String cacheClusterId;

  /// A unique identifier for the source node group (shard).
  final String nodeGroupId;

  /// The cache node identifier for the node in the source cluster.
  final String cacheNodeId;

  /// The configuration for the source node group (shard).
  final NodeGroupConfiguration nodeGroupConfiguration;

  /// The size of the cache on the source cache node.
  final String cacheSize;

  /// The date and time when the cache node was created in the source cluster.
  final DateTime cacheNodeCreateTime;

  /// The date and time when the source node's metadata and cache data set was
  /// obtained for the snapshot.
  final DateTime snapshotCreateTime;

  NodeSnapshot({
    this.cacheClusterId,
    this.nodeGroupId,
    this.cacheNodeId,
    this.nodeGroupConfiguration,
    this.cacheSize,
    this.cacheNodeCreateTime,
    this.snapshotCreateTime,
  });
  static NodeSnapshot fromJson(Map<String, dynamic> json) => NodeSnapshot();
}

/// Describes a notification topic and its status. Notification topics are used
/// for publishing ElastiCache events to subscribers using Amazon Simple
/// Notification Service (SNS).
class NotificationConfiguration {
  /// The Amazon Resource Name (ARN) that identifies the topic.
  final String topicArn;

  /// The current state of the topic.
  final String topicStatus;

  NotificationConfiguration({
    this.topicArn,
    this.topicStatus,
  });
  static NotificationConfiguration fromJson(Map<String, dynamic> json) =>
      NotificationConfiguration();
}

/// Describes an individual setting that controls some aspect of ElastiCache
/// behavior.
class Parameter {
  /// The name of the parameter.
  final String parameterName;

  /// The value of the parameter.
  final String parameterValue;

  /// A description of the parameter.
  final String description;

  /// The source of the parameter.
  final String source;

  /// The valid data type for the parameter.
  final String dataType;

  /// The valid range of values for the parameter.
  final String allowedValues;

  /// Indicates whether (`true`) or not (`false`) the parameter can be modified.
  /// Some parameters have security or operational implications that prevent
  /// them from being changed.
  final bool isModifiable;

  /// The earliest cache engine version to which the parameter can apply.
  final String minimumEngineVersion;

  /// Indicates whether a change to the parameter is applied immediately or
  /// requires a reboot for the change to be applied. You can force a reboot or
  /// wait until the next maintenance window's reboot. For more information, see
  /// [Rebooting a Cluster](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Clusters.Rebooting.html).
  final String changeType;

  Parameter({
    this.parameterName,
    this.parameterValue,
    this.description,
    this.source,
    this.dataType,
    this.allowedValues,
    this.isModifiable,
    this.minimumEngineVersion,
    this.changeType,
  });
  static Parameter fromJson(Map<String, dynamic> json) => Parameter();
}

/// Describes a name-value pair that is used to update the value of a parameter.
class ParameterNameValue {
  /// The name of the parameter.
  final String parameterName;

  /// The value of the parameter.
  final String parameterValue;

  ParameterNameValue({
    this.parameterName,
    this.parameterValue,
  });
}

/// A group of settings that are applied to the cluster in the future, or that
/// are currently being applied.
class PendingModifiedValues {
  /// The new number of cache nodes for the cluster.
  ///
  /// For clusters running Redis, this value must be 1. For clusters running
  /// Memcached, this value must be between 1 and 20.
  final int numCacheNodes;

  /// A list of cache node IDs that are being removed (or will be removed) from
  /// the cluster. A node ID is a 4-digit numeric identifier (0001, 0002, etc.).
  final List<String> cacheNodeIdsToRemove;

  /// The new cache engine version that the cluster runs.
  final String engineVersion;

  /// The cache node type that this cluster or replication group is scaled to.
  final String cacheNodeType;

  PendingModifiedValues({
    this.numCacheNodes,
    this.cacheNodeIdsToRemove,
    this.engineVersion,
    this.cacheNodeType,
  });
  static PendingModifiedValues fromJson(Map<String, dynamic> json) =>
      PendingModifiedValues();
}

/// Update action that has been processed for the corresponding apply/stop
/// request
class ProcessedUpdateAction {
  /// The ID of the replication group
  final String replicationGroupId;

  /// The unique ID of the service update
  final String serviceUpdateName;

  /// The status of the update action on the Redis cluster
  final String updateActionStatus;

  ProcessedUpdateAction({
    this.replicationGroupId,
    this.serviceUpdateName,
    this.updateActionStatus,
  });
  static ProcessedUpdateAction fromJson(Map<String, dynamic> json) =>
      ProcessedUpdateAction();
}

class PurchaseReservedCacheNodesOfferingResult {
  final ReservedCacheNode reservedCacheNode;

  PurchaseReservedCacheNodesOfferingResult({
    this.reservedCacheNode,
  });
  static PurchaseReservedCacheNodesOfferingResult fromJson(
          Map<String, dynamic> json) =>
      PurchaseReservedCacheNodesOfferingResult();
}

class RebootCacheClusterResult {
  final CacheCluster cacheCluster;

  RebootCacheClusterResult({
    this.cacheCluster,
  });
  static RebootCacheClusterResult fromJson(Map<String, dynamic> json) =>
      RebootCacheClusterResult();
}

/// Contains the specific price and frequency of a recurring charges for a
/// reserved cache node, or for a reserved cache node offering.
class RecurringCharge {
  /// The monetary amount of the recurring charge.
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

/// Contains all of the attributes of a specific Redis replication group.
class ReplicationGroup {
  /// The identifier for the replication group.
  final String replicationGroupId;

  /// The user supplied description of the replication group.
  final String description;

  /// The current state of this replication group - `creating`, `available`,
  /// `modifying`, `deleting`, `create-failed`, `snapshotting`.
  final String status;

  /// A group of settings to be applied to the replication group, either
  /// immediately or during the next maintenance window.
  final ReplicationGroupPendingModifiedValues pendingModifiedValues;

  /// The names of all the cache clusters that are part of this replication
  /// group.
  final List<String> memberClusters;

  /// A list of node groups in this replication group. For Redis (cluster mode
  /// disabled) replication groups, this is a single-element list. For Redis
  /// (cluster mode enabled) replication groups, the list contains an entry for
  /// each node group (shard).
  final List<NodeGroup> nodeGroups;

  /// The cluster ID that is used as the daily snapshot source for the
  /// replication group.
  final String snapshottingClusterId;

  /// Indicates the status of Multi-AZ with automatic failover for this Redis
  /// replication group.
  ///
  /// Amazon ElastiCache for Redis does not support Multi-AZ with automatic
  /// failover on:
  ///
  /// *   Redis versions earlier than 2.8.6.
  ///
  /// *   Redis (cluster mode disabled): T1 node types.
  ///
  /// *   Redis (cluster mode enabled): T1 node types.
  final String automaticFailover;

  /// The configuration endpoint for this replication group. Use the
  /// configuration endpoint to connect to this replication group.
  final Endpoint configurationEndpoint;

  /// The number of days for which ElastiCache retains automatic cluster
  /// snapshots before deleting them. For example, if you set
  /// `SnapshotRetentionLimit` to 5, a snapshot that was taken today is retained
  /// for 5 days before being deleted.
  ///
  ///   If the value of `SnapshotRetentionLimit` is set to zero (0), backups are
  /// turned off.
  final int snapshotRetentionLimit;

  /// The daily time range (in UTC) during which ElastiCache begins taking a
  /// daily snapshot of your node group (shard).
  ///
  /// Example: `05:00-09:00`
  ///
  /// If you do not specify this parameter, ElastiCache automatically chooses an
  /// appropriate time range.
  ///
  ///
  ///
  /// This parameter is only valid if the `Engine` parameter is `redis`.
  final String snapshotWindow;

  /// A flag indicating whether or not this replication group is cluster
  /// enabled; i.e., whether its data can be partitioned across multiple shards
  /// (API/CLI: node groups).
  ///
  /// Valid values: `true` | `false`
  final bool clusterEnabled;

  /// The name of the compute and memory capacity node type for each node in the
  /// replication group.
  final String cacheNodeType;

  /// A flag that enables using an `AuthToken` (password) when issuing Redis
  /// commands.
  ///
  /// Default: `false`
  final bool authTokenEnabled;

  /// A flag that enables in-transit encryption when set to `true`.
  ///
  /// You cannot modify the value of `TransitEncryptionEnabled` after the
  /// cluster is created. To enable in-transit encryption on a cluster you must
  /// set `TransitEncryptionEnabled` to `true` when you create a cluster.
  ///
  ///  **Required:** Only available when creating a replication group in an
  /// Amazon VPC using redis version `3.2.6`, `4.x` or later.
  ///
  /// Default: `false`
  final bool transitEncryptionEnabled;

  /// A flag that enables encryption at-rest when set to `true`.
  ///
  /// You cannot modify the value of `AtRestEncryptionEnabled` after the cluster
  /// is created. To enable encryption at-rest on a cluster you must set
  /// `AtRestEncryptionEnabled` to `true` when you create a cluster.
  ///
  ///  **Required:** Only available when creating a replication group in an
  /// Amazon VPC using redis version `3.2.6`, `4.x` or later.
  ///
  /// Default: `false`
  final bool atRestEncryptionEnabled;

  /// The ID of the KMS key used to encrypt the disk in the cluster.
  final String kmsKeyId;

  ReplicationGroup({
    this.replicationGroupId,
    this.description,
    this.status,
    this.pendingModifiedValues,
    this.memberClusters,
    this.nodeGroups,
    this.snapshottingClusterId,
    this.automaticFailover,
    this.configurationEndpoint,
    this.snapshotRetentionLimit,
    this.snapshotWindow,
    this.clusterEnabled,
    this.cacheNodeType,
    this.authTokenEnabled,
    this.transitEncryptionEnabled,
    this.atRestEncryptionEnabled,
    this.kmsKeyId,
  });
  static ReplicationGroup fromJson(Map<String, dynamic> json) =>
      ReplicationGroup();
}

/// Represents the output of a `DescribeReplicationGroups` operation.
class ReplicationGroupMessage {
  /// Provides an identifier to allow retrieval of paginated results.
  final String marker;

  /// A list of replication groups. Each item in the list contains detailed
  /// information about one replication group.
  final List<ReplicationGroup> replicationGroups;

  ReplicationGroupMessage({
    this.marker,
    this.replicationGroups,
  });
  static ReplicationGroupMessage fromJson(Map<String, dynamic> json) =>
      ReplicationGroupMessage();
}

/// The settings to be applied to the Redis replication group, either
/// immediately or during the next maintenance window.
class ReplicationGroupPendingModifiedValues {
  /// The primary cluster ID that is applied immediately (if
  /// `--apply-immediately` was specified), or during the next maintenance
  /// window.
  final String primaryClusterId;

  /// Indicates the status of Multi-AZ with automatic failover for this Redis
  /// replication group.
  ///
  /// Amazon ElastiCache for Redis does not support Multi-AZ with automatic
  /// failover on:
  ///
  /// *   Redis versions earlier than 2.8.6.
  ///
  /// *   Redis (cluster mode disabled): T1 node types.
  ///
  /// *   Redis (cluster mode enabled): T1 node types.
  final String automaticFailoverStatus;

  /// The status of an online resharding operation.
  final ReshardingStatus resharding;

  ReplicationGroupPendingModifiedValues({
    this.primaryClusterId,
    this.automaticFailoverStatus,
    this.resharding,
  });
  static ReplicationGroupPendingModifiedValues fromJson(
          Map<String, dynamic> json) =>
      ReplicationGroupPendingModifiedValues();
}

/// Represents the output of a `PurchaseReservedCacheNodesOffering` operation.
class ReservedCacheNode {
  /// The unique identifier for the reservation.
  final String reservedCacheNodeId;

  /// The offering identifier.
  final String reservedCacheNodesOfferingId;

  /// The cache node type for the reserved cache nodes.
  ///
  /// The following node types are supported by ElastiCache. Generally speaking,
  /// the current generation types provide more memory and computational power
  /// at lower cost when compared to their equivalent previous generation
  /// counterparts.
  ///
  /// *   General purpose:
  ///
  ///     *   Current generation:
  ///
  ///          **M5 node types:** `cache.m5.large`, `cache.m5.xlarge`,
  /// `cache.m5.2xlarge`, `cache.m5.4xlarge`, `cache.m5.12xlarge`,
  /// `cache.m5.24xlarge`
  ///
  ///          **M4 node types:** `cache.m4.large`, `cache.m4.xlarge`,
  /// `cache.m4.2xlarge`, `cache.m4.4xlarge`, `cache.m4.10xlarge`
  ///
  ///          **T2 node types:** `cache.t2.micro`, `cache.t2.small`,
  /// `cache.t2.medium`
  ///
  ///     *   Previous generation: (not recommended)
  ///
  ///          **T1 node types:** `cache.t1.micro`
  ///
  ///          **M1 node types:** `cache.m1.small`, `cache.m1.medium`,
  /// `cache.m1.large`, `cache.m1.xlarge`
  ///
  ///          **M3 node types:** `cache.m3.medium`, `cache.m3.large`,
  /// `cache.m3.xlarge`, `cache.m3.2xlarge`
  ///
  ///
  /// *   Compute optimized:
  ///
  ///     *   Previous generation: (not recommended)
  ///
  ///          **C1 node types:** `cache.c1.xlarge`
  ///
  ///
  /// *   Memory optimized:
  ///
  ///     *   Current generation:
  ///
  ///          **R5 node types:** `cache.r5.large`, `cache.r5.xlarge`,
  /// `cache.r5.2xlarge`, `cache.r5.4xlarge`, `cache.r5.12xlarge`,
  /// `cache.r5.24xlarge`
  ///
  ///          **R4 node types:** `cache.r4.large`, `cache.r4.xlarge`,
  /// `cache.r4.2xlarge`, `cache.r4.4xlarge`, `cache.r4.8xlarge`,
  /// `cache.r4.16xlarge`
  ///
  ///     *   Previous generation: (not recommended)
  ///
  ///          **M2 node types:** `cache.m2.xlarge`, `cache.m2.2xlarge`,
  /// `cache.m2.4xlarge`
  ///
  ///          **R3 node types:** `cache.r3.large`, `cache.r3.xlarge`,
  /// `cache.r3.2xlarge`, `cache.r3.4xlarge`, `cache.r3.8xlarge`
  ///
  ///
  ///
  ///  **Additional node type info**
  ///
  /// *   All current generation instance types are created in Amazon VPC by
  /// default.
  ///
  /// *   Redis append-only files (AOF) are not supported for T1 or T2
  /// instances.
  ///
  /// *   Redis Multi-AZ with automatic failover is not supported on T1
  /// instances.
  ///
  /// *   Redis configuration variables `appendonly` and `appendfsync` are not
  /// supported on Redis version 2.8.22 and later.
  final String cacheNodeType;

  /// The time the reservation started.
  final DateTime startTime;

  /// The duration of the reservation in seconds.
  final int duration;

  /// The fixed price charged for this reserved cache node.
  final double fixedPrice;

  /// The hourly price charged for this reserved cache node.
  final double usagePrice;

  /// The number of cache nodes that have been reserved.
  final int cacheNodeCount;

  /// The description of the reserved cache node.
  final String productDescription;

  /// The offering type of this reserved cache node.
  final String offeringType;

  /// The state of the reserved cache node.
  final String state;

  /// The recurring price charged to run this reserved cache node.
  final List<RecurringCharge> recurringCharges;

  /// The Amazon Resource Name (ARN) of the reserved cache node.
  ///
  /// Example:
  /// `arn:aws:elasticache:us-east-1:123456789012:reserved-instance:ri-2017-03-27-08-33-25-582`
  final String reservationArn;

  ReservedCacheNode({
    this.reservedCacheNodeId,
    this.reservedCacheNodesOfferingId,
    this.cacheNodeType,
    this.startTime,
    this.duration,
    this.fixedPrice,
    this.usagePrice,
    this.cacheNodeCount,
    this.productDescription,
    this.offeringType,
    this.state,
    this.recurringCharges,
    this.reservationArn,
  });
  static ReservedCacheNode fromJson(Map<String, dynamic> json) =>
      ReservedCacheNode();
}

/// Represents the output of a `DescribeReservedCacheNodes` operation.
class ReservedCacheNodeMessage {
  /// Provides an identifier to allow retrieval of paginated results.
  final String marker;

  /// A list of reserved cache nodes. Each element in the list contains detailed
  /// information about one node.
  final List<ReservedCacheNode> reservedCacheNodes;

  ReservedCacheNodeMessage({
    this.marker,
    this.reservedCacheNodes,
  });
  static ReservedCacheNodeMessage fromJson(Map<String, dynamic> json) =>
      ReservedCacheNodeMessage();
}

/// Describes all of the attributes of a reserved cache node offering.
class ReservedCacheNodesOffering {
  /// A unique identifier for the reserved cache node offering.
  final String reservedCacheNodesOfferingId;

  /// The cache node type for the reserved cache node.
  ///
  /// The following node types are supported by ElastiCache. Generally speaking,
  /// the current generation types provide more memory and computational power
  /// at lower cost when compared to their equivalent previous generation
  /// counterparts.
  ///
  /// *   General purpose:
  ///
  ///     *   Current generation:
  ///
  ///          **M5 node types:** `cache.m5.large`, `cache.m5.xlarge`,
  /// `cache.m5.2xlarge`, `cache.m5.4xlarge`, `cache.m5.12xlarge`,
  /// `cache.m5.24xlarge`
  ///
  ///          **M4 node types:** `cache.m4.large`, `cache.m4.xlarge`,
  /// `cache.m4.2xlarge`, `cache.m4.4xlarge`, `cache.m4.10xlarge`
  ///
  ///          **T2 node types:** `cache.t2.micro`, `cache.t2.small`,
  /// `cache.t2.medium`
  ///
  ///     *   Previous generation: (not recommended)
  ///
  ///          **T1 node types:** `cache.t1.micro`
  ///
  ///          **M1 node types:** `cache.m1.small`, `cache.m1.medium`,
  /// `cache.m1.large`, `cache.m1.xlarge`
  ///
  ///          **M3 node types:** `cache.m3.medium`, `cache.m3.large`,
  /// `cache.m3.xlarge`, `cache.m3.2xlarge`
  ///
  ///
  /// *   Compute optimized:
  ///
  ///     *   Previous generation: (not recommended)
  ///
  ///          **C1 node types:** `cache.c1.xlarge`
  ///
  ///
  /// *   Memory optimized:
  ///
  ///     *   Current generation:
  ///
  ///          **R5 node types:** `cache.r5.large`, `cache.r5.xlarge`,
  /// `cache.r5.2xlarge`, `cache.r5.4xlarge`, `cache.r5.12xlarge`,
  /// `cache.r5.24xlarge`
  ///
  ///          **R4 node types:** `cache.r4.large`, `cache.r4.xlarge`,
  /// `cache.r4.2xlarge`, `cache.r4.4xlarge`, `cache.r4.8xlarge`,
  /// `cache.r4.16xlarge`
  ///
  ///     *   Previous generation: (not recommended)
  ///
  ///          **M2 node types:** `cache.m2.xlarge`, `cache.m2.2xlarge`,
  /// `cache.m2.4xlarge`
  ///
  ///          **R3 node types:** `cache.r3.large`, `cache.r3.xlarge`,
  /// `cache.r3.2xlarge`, `cache.r3.4xlarge`, `cache.r3.8xlarge`
  ///
  ///
  ///
  ///  **Additional node type info**
  ///
  /// *   All current generation instance types are created in Amazon VPC by
  /// default.
  ///
  /// *   Redis append-only files (AOF) are not supported for T1 or T2
  /// instances.
  ///
  /// *   Redis Multi-AZ with automatic failover is not supported on T1
  /// instances.
  ///
  /// *   Redis configuration variables `appendonly` and `appendfsync` are not
  /// supported on Redis version 2.8.22 and later.
  final String cacheNodeType;

  /// The duration of the offering. in seconds.
  final int duration;

  /// The fixed price charged for this offering.
  final double fixedPrice;

  /// The hourly price charged for this offering.
  final double usagePrice;

  /// The cache engine used by the offering.
  final String productDescription;

  /// The offering type.
  final String offeringType;

  /// The recurring price charged to run this reserved cache node.
  final List<RecurringCharge> recurringCharges;

  ReservedCacheNodesOffering({
    this.reservedCacheNodesOfferingId,
    this.cacheNodeType,
    this.duration,
    this.fixedPrice,
    this.usagePrice,
    this.productDescription,
    this.offeringType,
    this.recurringCharges,
  });
  static ReservedCacheNodesOffering fromJson(Map<String, dynamic> json) =>
      ReservedCacheNodesOffering();
}

/// Represents the output of a `DescribeReservedCacheNodesOfferings` operation.
class ReservedCacheNodesOfferingMessage {
  /// Provides an identifier to allow retrieval of paginated results.
  final String marker;

  /// A list of reserved cache node offerings. Each element in the list contains
  /// detailed information about one offering.
  final List<ReservedCacheNodesOffering> reservedCacheNodesOfferings;

  ReservedCacheNodesOfferingMessage({
    this.marker,
    this.reservedCacheNodesOfferings,
  });
  static ReservedCacheNodesOfferingMessage fromJson(
          Map<String, dynamic> json) =>
      ReservedCacheNodesOfferingMessage();
}

/// A list of `PreferredAvailabilityZones` objects that specifies the
/// configuration of a node group in the resharded cluster.
class ReshardingConfiguration {
  /// Either the ElastiCache for Redis supplied 4-digit id or a user supplied id
  /// for the node group these configuration values apply to.
  final String nodeGroupId;

  /// A list of preferred availability zones for the nodes in this cluster.
  final List<String> preferredAvailabilityZones;

  ReshardingConfiguration({
    this.nodeGroupId,
    this.preferredAvailabilityZones,
  });
}

/// The status of an online resharding operation.
class ReshardingStatus {
  /// Represents the progress of an online resharding operation.
  final SlotMigration slotMigration;

  ReshardingStatus({
    this.slotMigration,
  });
  static ReshardingStatus fromJson(Map<String, dynamic> json) =>
      ReshardingStatus();
}

class RevokeCacheSecurityGroupIngressResult {
  final CacheSecurityGroup cacheSecurityGroup;

  RevokeCacheSecurityGroupIngressResult({
    this.cacheSecurityGroup,
  });
  static RevokeCacheSecurityGroupIngressResult fromJson(
          Map<String, dynamic> json) =>
      RevokeCacheSecurityGroupIngressResult();
}

/// Represents a single cache security group and its status.
class SecurityGroupMembership {
  /// The identifier of the cache security group.
  final String securityGroupId;

  /// The status of the cache security group membership. The status changes
  /// whenever a cache security group is modified, or when the cache security
  /// groups assigned to a cluster are modified.
  final String status;

  SecurityGroupMembership({
    this.securityGroupId,
    this.status,
  });
  static SecurityGroupMembership fromJson(Map<String, dynamic> json) =>
      SecurityGroupMembership();
}

/// An update that you can apply to your Redis clusters.
class ServiceUpdate {
  /// The unique ID of the service update
  final String serviceUpdateName;

  /// The date when the service update is initially available
  final DateTime serviceUpdateReleaseDate;

  /// The date after which the service update is no longer available
  final DateTime serviceUpdateEndDate;

  /// The severity of the service update
  final String serviceUpdateSeverity;

  /// The recommendend date to apply the service update in order to ensure
  /// compliance. For information on compliance, see
  /// [Self-Service Security Updates for Compliance](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/elasticache-compliance.html#elasticache-compliance-self-service).
  final DateTime serviceUpdateRecommendedApplyByDate;

  /// The status of the service update
  final String serviceUpdateStatus;

  /// Provides details of the service update
  final String serviceUpdateDescription;

  /// Reflects the nature of the service update
  final String serviceUpdateType;

  /// The Redis engine to which the service update applies
  final String engine;

  /// The Redis engine version to which the service update applies
  final String engineVersion;

  /// Indicates whether the service update will be automatically applied once
  /// the recommended apply-by date has expired.
  final bool autoUpdateAfterRecommendedApplyByDate;

  /// The estimated length of time the service update will take
  final String estimatedUpdateTime;

  ServiceUpdate({
    this.serviceUpdateName,
    this.serviceUpdateReleaseDate,
    this.serviceUpdateEndDate,
    this.serviceUpdateSeverity,
    this.serviceUpdateRecommendedApplyByDate,
    this.serviceUpdateStatus,
    this.serviceUpdateDescription,
    this.serviceUpdateType,
    this.engine,
    this.engineVersion,
    this.autoUpdateAfterRecommendedApplyByDate,
    this.estimatedUpdateTime,
  });
  static ServiceUpdate fromJson(Map<String, dynamic> json) => ServiceUpdate();
}

class ServiceUpdatesMessage {
  /// An optional marker returned from a prior request. Use this marker for
  /// pagination of results from this operation. If this parameter is specified,
  /// the response includes only records beyond the marker, up to the value
  /// specified by `MaxRecords`.
  final String marker;

  /// A list of service updates
  final List<ServiceUpdate> serviceUpdates;

  ServiceUpdatesMessage({
    this.marker,
    this.serviceUpdates,
  });
  static ServiceUpdatesMessage fromJson(Map<String, dynamic> json) =>
      ServiceUpdatesMessage();
}

/// Represents the progress of an online resharding operation.
class SlotMigration {
  /// The percentage of the slot migration that is complete.
  final double progressPercentage;

  SlotMigration({
    this.progressPercentage,
  });
  static SlotMigration fromJson(Map<String, dynamic> json) => SlotMigration();
}

/// Represents a copy of an entire Redis cluster as of the time when the
/// snapshot was taken.
class Snapshot {
  /// The name of a snapshot. For an automatic snapshot, the name is
  /// system-generated. For a manual snapshot, this is the user-provided name.
  final String snapshotName;

  /// The unique identifier of the source replication group.
  final String replicationGroupId;

  /// A description of the source replication group.
  final String replicationGroupDescription;

  /// The user-supplied identifier of the source cluster.
  final String cacheClusterId;

  /// The status of the snapshot. Valid values: `creating` | `available` |
  /// `restoring` | `copying` | `deleting`.
  final String snapshotStatus;

  /// Indicates whether the snapshot is from an automatic backup (`automated`)
  /// or was created manually (`manual`).
  final String snapshotSource;

  /// The name of the compute and memory capacity node type for the source
  /// cluster.
  ///
  /// The following node types are supported by ElastiCache. Generally speaking,
  /// the current generation types provide more memory and computational power
  /// at lower cost when compared to their equivalent previous generation
  /// counterparts.
  ///
  /// *   General purpose:
  ///
  ///     *   Current generation:
  ///
  ///          **M5 node types:** `cache.m5.large`, `cache.m5.xlarge`,
  /// `cache.m5.2xlarge`, `cache.m5.4xlarge`, `cache.m5.12xlarge`,
  /// `cache.m5.24xlarge`
  ///
  ///          **M4 node types:** `cache.m4.large`, `cache.m4.xlarge`,
  /// `cache.m4.2xlarge`, `cache.m4.4xlarge`, `cache.m4.10xlarge`
  ///
  ///          **T2 node types:** `cache.t2.micro`, `cache.t2.small`,
  /// `cache.t2.medium`
  ///
  ///     *   Previous generation: (not recommended)
  ///
  ///          **T1 node types:** `cache.t1.micro`
  ///
  ///          **M1 node types:** `cache.m1.small`, `cache.m1.medium`,
  /// `cache.m1.large`, `cache.m1.xlarge`
  ///
  ///          **M3 node types:** `cache.m3.medium`, `cache.m3.large`,
  /// `cache.m3.xlarge`, `cache.m3.2xlarge`
  ///
  ///
  /// *   Compute optimized:
  ///
  ///     *   Previous generation: (not recommended)
  ///
  ///          **C1 node types:** `cache.c1.xlarge`
  ///
  ///
  /// *   Memory optimized:
  ///
  ///     *   Current generation:
  ///
  ///          **R5 node types:** `cache.r5.large`, `cache.r5.xlarge`,
  /// `cache.r5.2xlarge`, `cache.r5.4xlarge`, `cache.r5.12xlarge`,
  /// `cache.r5.24xlarge`
  ///
  ///          **R4 node types:** `cache.r4.large`, `cache.r4.xlarge`,
  /// `cache.r4.2xlarge`, `cache.r4.4xlarge`, `cache.r4.8xlarge`,
  /// `cache.r4.16xlarge`
  ///
  ///     *   Previous generation: (not recommended)
  ///
  ///          **M2 node types:** `cache.m2.xlarge`, `cache.m2.2xlarge`,
  /// `cache.m2.4xlarge`
  ///
  ///          **R3 node types:** `cache.r3.large`, `cache.r3.xlarge`,
  /// `cache.r3.2xlarge`, `cache.r3.4xlarge`, `cache.r3.8xlarge`
  ///
  ///
  ///
  ///  **Additional node type info**
  ///
  /// *   All current generation instance types are created in Amazon VPC by
  /// default.
  ///
  /// *   Redis append-only files (AOF) are not supported for T1 or T2
  /// instances.
  ///
  /// *   Redis Multi-AZ with automatic failover is not supported on T1
  /// instances.
  ///
  /// *   Redis configuration variables `appendonly` and `appendfsync` are not
  /// supported on Redis version 2.8.22 and later.
  final String cacheNodeType;

  /// The name of the cache engine (`memcached` or `redis`) used by the source
  /// cluster.
  final String engine;

  /// The version of the cache engine version that is used by the source
  /// cluster.
  final String engineVersion;

  /// The number of cache nodes in the source cluster.
  ///
  /// For clusters running Redis, this value must be 1. For clusters running
  /// Memcached, this value must be between 1 and 20.
  final int numCacheNodes;

  /// The name of the Availability Zone in which the source cluster is located.
  final String preferredAvailabilityZone;

  /// The date and time when the source cluster was created.
  final DateTime cacheClusterCreateTime;

  /// Specifies the weekly time range during which maintenance on the cluster is
  /// performed. It is specified as a range in the format
  /// ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance window is
  /// a 60 minute period.
  ///
  /// Valid values for `ddd` are:
  ///
  /// *    `sun`
  ///
  /// *    `mon`
  ///
  /// *    `tue`
  ///
  /// *    `wed`
  ///
  /// *    `thu`
  ///
  /// *    `fri`
  ///
  /// *    `sat`
  ///
  ///
  /// Example: `sun:23:00-mon:01:30`
  final String preferredMaintenanceWindow;

  /// The Amazon Resource Name (ARN) for the topic used by the source cluster
  /// for publishing notifications.
  final String topicArn;

  /// The port number used by each cache nodes in the source cluster.
  final int port;

  /// The cache parameter group that is associated with the source cluster.
  final String cacheParameterGroupName;

  /// The name of the cache subnet group associated with the source cluster.
  final String cacheSubnetGroupName;

  /// The Amazon Virtual Private Cloud identifier (VPC ID) of the cache subnet
  /// group for the source cluster.
  final String vpcId;

  /// This parameter is currently disabled.
  final bool autoMinorVersionUpgrade;

  /// For an automatic snapshot, the number of days for which ElastiCache
  /// retains the snapshot before deleting it.
  ///
  /// For manual snapshots, this field reflects the `SnapshotRetentionLimit` for
  /// the source cluster when the snapshot was created. This field is otherwise
  /// ignored: Manual snapshots do not expire, and can only be deleted using the
  /// `DeleteSnapshot` operation.
  ///
  ///  **Important** If the value of SnapshotRetentionLimit is set to zero (0),
  /// backups are turned off.
  final int snapshotRetentionLimit;

  /// The daily time range during which ElastiCache takes daily snapshots of the
  /// source cluster.
  final String snapshotWindow;

  /// The number of node groups (shards) in this snapshot. When restoring from a
  /// snapshot, the number of node groups (shards) in the snapshot and in the
  /// restored replication group must be the same.
  final int numNodeGroups;

  /// Indicates the status of Multi-AZ with automatic failover for the source
  /// Redis replication group.
  ///
  /// Amazon ElastiCache for Redis does not support Multi-AZ with automatic
  /// failover on:
  ///
  /// *   Redis versions earlier than 2.8.6.
  ///
  /// *   Redis (cluster mode disabled): T1 node types.
  ///
  /// *   Redis (cluster mode enabled): T1 node types.
  final String automaticFailover;

  /// A list of the cache nodes in the source cluster.
  final List<NodeSnapshot> nodeSnapshots;

  /// The ID of the KMS key used to encrypt the snapshot.
  final String kmsKeyId;

  Snapshot({
    this.snapshotName,
    this.replicationGroupId,
    this.replicationGroupDescription,
    this.cacheClusterId,
    this.snapshotStatus,
    this.snapshotSource,
    this.cacheNodeType,
    this.engine,
    this.engineVersion,
    this.numCacheNodes,
    this.preferredAvailabilityZone,
    this.cacheClusterCreateTime,
    this.preferredMaintenanceWindow,
    this.topicArn,
    this.port,
    this.cacheParameterGroupName,
    this.cacheSubnetGroupName,
    this.vpcId,
    this.autoMinorVersionUpgrade,
    this.snapshotRetentionLimit,
    this.snapshotWindow,
    this.numNodeGroups,
    this.automaticFailover,
    this.nodeSnapshots,
    this.kmsKeyId,
  });
  static Snapshot fromJson(Map<String, dynamic> json) => Snapshot();
}

/// Represents the subnet associated with a cluster. This parameter refers to
/// subnets defined in Amazon Virtual Private Cloud (Amazon VPC) and used with
/// ElastiCache.
class Subnet {
  /// The unique identifier for the subnet.
  final String subnetIdentifier;

  /// The Availability Zone associated with the subnet.
  final AvailabilityZone subnetAvailabilityZone;

  Subnet({
    this.subnetIdentifier,
    this.subnetAvailabilityZone,
  });
  static Subnet fromJson(Map<String, dynamic> json) => Subnet();
}

/// A cost allocation Tag that can be added to an ElastiCache cluster or
/// replication group. Tags are composed of a Key/Value pair. A tag with a null
/// Value is permitted.
class Tag {
  /// The key for the tag. May not be null.
  final String key;

  /// The tag's value. May be null.
  final String value;

  Tag({
    this.key,
    this.value,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag();
}

/// Represents the output from the `AddTagsToResource`, `ListTagsForResource`,
/// and `RemoveTagsFromResource` operations.
class TagListMessage {
  /// A list of cost allocation tags as key-value pairs.
  final List<Tag> tagList;

  TagListMessage({
    this.tagList,
  });
  static TagListMessage fromJson(Map<String, dynamic> json) => TagListMessage();
}

class TestFailoverResult {
  final ReplicationGroup replicationGroup;

  TestFailoverResult({
    this.replicationGroup,
  });
  static TestFailoverResult fromJson(Map<String, dynamic> json) =>
      TestFailoverResult();
}

/// Filters update actions from the service updates that are in available status
/// during the time range.
class TimeRangeFilter {
  /// The start time of the time range filter
  final DateTime startTime;

  /// The end time of the time range filter
  final DateTime endTime;

  TimeRangeFilter({
    this.startTime,
    this.endTime,
  });
}

/// Update action that has failed to be processed for the corresponding
/// apply/stop request
class UnprocessedUpdateAction {
  /// The replication group ID
  final String replicationGroupId;

  /// The unique ID of the service update
  final String serviceUpdateName;

  /// The error type for requests that are not processed
  final String errorType;

  /// The error message that describes the reason the request was not processed
  final String errorMessage;

  UnprocessedUpdateAction({
    this.replicationGroupId,
    this.serviceUpdateName,
    this.errorType,
    this.errorMessage,
  });
  static UnprocessedUpdateAction fromJson(Map<String, dynamic> json) =>
      UnprocessedUpdateAction();
}

/// The status of the service update for a specific replication group
class UpdateAction {
  /// The ID of the replication group
  final String replicationGroupId;

  /// The unique ID of the service update
  final String serviceUpdateName;

  /// The date the update is first available
  final DateTime serviceUpdateReleaseDate;

  /// The severity of the service update
  final String serviceUpdateSeverity;

  /// The status of the service update
  final String serviceUpdateStatus;

  /// The recommended date to apply the service update to ensure compliance. For
  /// information on compliance, see
  /// [Self-Service Security Updates for Compliance](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/elasticache-compliance.html#elasticache-compliance-self-service).
  final DateTime serviceUpdateRecommendedApplyByDate;

  /// Reflects the nature of the service update
  final String serviceUpdateType;

  /// The date that the service update is available to a replication group
  final DateTime updateActionAvailableDate;

  /// The status of the update action
  final String updateActionStatus;

  /// The progress of the service update on the replication group
  final String nodesUpdated;

  /// The date when the UpdateActionStatus was last modified
  final DateTime updateActionStatusModifiedDate;

  /// If yes, all nodes in the replication group have been updated by the
  /// recommended apply-by date. If no, at least one node in the replication
  /// group have not been updated by the recommended apply-by date. If N/A, the
  /// replication group was created after the recommended apply-by date.
  final String slaMet;

  /// The status of the service update on the node group
  final List<NodeGroupUpdateStatus> nodeGroupUpdateStatus;

  /// The estimated length of time for the update to complete
  final String estimatedUpdateTime;

  UpdateAction({
    this.replicationGroupId,
    this.serviceUpdateName,
    this.serviceUpdateReleaseDate,
    this.serviceUpdateSeverity,
    this.serviceUpdateStatus,
    this.serviceUpdateRecommendedApplyByDate,
    this.serviceUpdateType,
    this.updateActionAvailableDate,
    this.updateActionStatus,
    this.nodesUpdated,
    this.updateActionStatusModifiedDate,
    this.slaMet,
    this.nodeGroupUpdateStatus,
    this.estimatedUpdateTime,
  });
  static UpdateAction fromJson(Map<String, dynamic> json) => UpdateAction();
}

class UpdateActionResultsMessage {
  /// Update actions that have been processed successfully
  final List<ProcessedUpdateAction> processedUpdateActions;

  /// Update actions that haven't been processed successfully
  final List<UnprocessedUpdateAction> unprocessedUpdateActions;

  UpdateActionResultsMessage({
    this.processedUpdateActions,
    this.unprocessedUpdateActions,
  });
  static UpdateActionResultsMessage fromJson(Map<String, dynamic> json) =>
      UpdateActionResultsMessage();
}

class UpdateActionsMessage {
  /// An optional marker returned from a prior request. Use this marker for
  /// pagination of results from this operation. If this parameter is specified,
  /// the response includes only records beyond the marker, up to the value
  /// specified by `MaxRecords`.
  final String marker;

  /// Returns a list of update actions
  final List<UpdateAction> updateActions;

  UpdateActionsMessage({
    this.marker,
    this.updateActions,
  });
  static UpdateActionsMessage fromJson(Map<String, dynamic> json) =>
      UpdateActionsMessage();
}
