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
  /// [Using Cost Allocation Tags in Amazon
  /// ElastiCache](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Tagging.html)
  /// in the _ElastiCache User Guide_.
  Future<void> addTagsToResource(
      {@required String resourceName, @required List<Tag> tags}) async {}

  /// Allows network ingress to a cache security group. Applications using
  /// ElastiCache must be running on Amazon EC2, and Amazon EC2 security groups
  /// are used as the authorization mechanism.
  ///
  ///
  ///
  /// You cannot authorize ingress from an Amazon EC2 security group in one
  /// region to an ElastiCache cluster in another region.
  Future<void> authorizeCacheSecurityGroupIngress(
      {@required String cacheSecurityGroupName,
      @required String ec2SecurityGroupName,
      @required String ec2SecurityGroupOwnerId}) async {}

  /// Apply the service update. For more information on service updates and
  /// applying them, see [Applying Service
  /// Updates](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/applying-updates.html).
  Future<void> batchApplyUpdateAction(
      {@required List<String> replicationGroupIds,
      @required String serviceUpdateName}) async {}

  /// Stop the service update. For more information on service updates and
  /// stopping them, see [Stopping Service
  /// Updates](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/stopping-self-service-updates.html).
  Future<void> batchStopUpdateAction(
      {@required List<String> replicationGroupIds,
      @required String serviceUpdateName}) async {}

  /// Makes a copy of an existing snapshot.
  ///
  ///  This operation is valid for Redis only.  Users or groups that have
  /// permissions to use the `CopySnapshot` operation can create their own
  /// Amazon S3 buckets and copy snapshots to it. To control access to your
  /// snapshots, use an IAM policy to control who has the ability to use the
  /// `CopySnapshot` operation. For more information about using IAM to control
  /// the use of ElastiCache operations, see [Exporting
  /// Snapshots](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-exporting.html)
  /// and [Authentication & Access
  /// Control](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/IAM.html).
  ///
  ///
  /// You could receive the following error messages.
  ///
  ///  **Error Messages**
  ///
  /// *    **Error Message:** The S3 bucket %s is outside of the region.
  ///
  ///      **Solution:** Create an Amazon S3 bucket in the same region as your
  /// snapshot. For more information, see [Step 1: Create an Amazon S3
  /// Bucket](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-exporting.html#backups-exporting-create-s3-bucket)
  /// in the ElastiCache User Guide.
  ///
  /// *    **Error Message:** The S3 bucket %s does not exist.
  ///
  ///      **Solution:** Create an Amazon S3 bucket in the same region as your
  /// snapshot. For more information, see [Step 1: Create an Amazon S3
  /// Bucket](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-exporting.html#backups-exporting-create-s3-bucket)
  /// in the ElastiCache User Guide.
  ///
  /// *    **Error Message:** The S3 bucket %s is not owned by the authenticated
  /// user.
  ///
  ///      **Solution:** Create an Amazon S3 bucket in the same region as your
  /// snapshot. For more information, see [Step 1: Create an Amazon S3
  /// Bucket](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-exporting.html#backups-exporting-create-s3-bucket)
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
  /// information, see [Step 2: Grant ElastiCache Access to Your Amazon S3
  /// Bucket](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-exporting.html#backups-exporting-grant-access)
  /// in the ElastiCache User Guide.
  ///
  /// *    **Error Message:**  ElastiCache has not been granted WRITE
  /// permissions %s on the S3 Bucket.
  ///
  ///      **Solution:** Add Upload/Delete permissions on the bucket. For more
  /// information, see [Step 2: Grant ElastiCache Access to Your Amazon S3
  /// Bucket](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-exporting.html#backups-exporting-grant-access)
  /// in the ElastiCache User Guide.
  ///
  /// *    **Error Message:**  ElastiCache has not been granted READ_ACP
  /// permissions %s on the S3 Bucket.
  ///
  ///      **Solution:** Add View Permissions on the bucket. For more
  /// information, see [Step 2: Grant ElastiCache Access to Your Amazon S3
  /// Bucket](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-exporting.html#backups-exporting-grant-access)
  /// in the ElastiCache User Guide.
  Future<void> copySnapshot(
      {@required String sourceSnapshotName,
      @required String targetSnapshotName,
      String targetBucket,
      String kmsKeyId}) async {}

  /// Creates a cluster. All nodes in the cluster run the same
  /// protocol-compliant cache engine software, either Memcached or Redis.
  ///
  /// This operation is not supported for Redis (cluster mode enabled) clusters.
  Future<void> createCacheCluster(String cacheClusterId,
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
      String authToken}) async {}

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
  /// *    [Parameters and Parameter
  /// Groups](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/ParameterGroups.html)
  /// in the ElastiCache User Guide.
  Future<void> createCacheParameterGroup(
      {@required String cacheParameterGroupName,
      @required String cacheParameterGroupFamily,
      @required String description}) async {}

  /// Creates a new cache security group. Use a cache security group to control
  /// access to one or more clusters.
  ///
  /// Cache security groups are only used when you are creating a cluster
  /// outside of an Amazon Virtual Private Cloud (Amazon VPC). If you are
  /// creating a cluster inside of a VPC, use a cache subnet group instead. For
  /// more information, see
  /// [CreateCacheSubnetGroup](https://docs.aws.amazon.com/AmazonElastiCache/latest/APIReference/API_CreateCacheSubnetGroup.html).
  Future<void> createCacheSecurityGroup(
      {@required String cacheSecurityGroupName,
      @required String description}) async {}

  /// Creates a new cache subnet group.
  ///
  /// Use this parameter only when you are creating a cluster in an Amazon
  /// Virtual Private Cloud (Amazon VPC).
  Future<void> createCacheSubnetGroup(
      {@required String cacheSubnetGroupName,
      @required String cacheSubnetGroupDescription,
      @required List<String> subnetIds}) async {}

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
  /// more information, see [Restoring From a Backup with Cluster
  /// Resizing](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-restoring.html)
  /// in the _ElastiCache User Guide_.
  ///
  ///
  ///
  /// This operation is valid for Redis only.
  Future<void> createReplicationGroup(
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
      String kmsKeyId}) async {}

  /// Creates a copy of an entire cluster or replication group at a specific
  /// moment in time.
  ///
  ///
  ///
  /// This operation is valid for Redis only.
  Future<void> createSnapshot(String snapshotName,
      {String replicationGroupId,
      String cacheClusterId,
      String kmsKeyId}) async {}

  /// Dynamically decreases the number of replics in a Redis (cluster mode
  /// disabled) replication group or the number of replica nodes in one or more
  /// node groups (shards) of a Redis (cluster mode enabled) replication group.
  /// This operation is performed with no cluster down time.
  Future<void> decreaseReplicaCount(
      {@required String replicationGroupId,
      int newReplicaCount,
      List<ConfigureShard> replicaConfiguration,
      List<String> replicasToRemove,
      @required bool applyImmediately}) async {}

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
  Future<void> deleteCacheCluster(String cacheClusterId,
      {String finalSnapshotIdentifier}) async {}

  /// Deletes the specified cache parameter group. You cannot delete a cache
  /// parameter group if it is associated with any cache clusters.
  Future<void> deleteCacheParameterGroup(
      String cacheParameterGroupName) async {}

  /// Deletes a cache security group.
  ///
  ///
  ///
  /// You cannot delete a cache security group if it is associated with any
  /// clusters.
  Future<void> deleteCacheSecurityGroup(String cacheSecurityGroupName) async {}

  /// Deletes a cache subnet group.
  ///
  ///
  ///
  /// You cannot delete a cache subnet group if it is associated with any
  /// clusters.
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
  Future<void> deleteReplicationGroup(String replicationGroupId,
      {bool retainPrimaryCluster, String finalSnapshotIdentifier}) async {}

  /// Deletes an existing snapshot. When you receive a successful response from
  /// this operation, ElastiCache immediately begins deleting the snapshot; you
  /// cannot cancel or revert this operation.
  ///
  ///
  ///
  /// This operation is valid for Redis only.
  Future<void> deleteSnapshot(String snapshotName) async {}

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
  Future<void> describeCacheClusters(
      {String cacheClusterId,
      int maxRecords,
      String marker,
      bool showCacheNodeInfo,
      bool showCacheClustersNotInReplicationGroups}) async {}

  /// Returns a list of the available cache engines and their versions.
  Future<void> describeCacheEngineVersions(
      {String engine,
      String engineVersion,
      String cacheParameterGroupFamily,
      int maxRecords,
      String marker,
      bool defaultOnly}) async {}

  /// Returns a list of cache parameter group descriptions. If a cache parameter
  /// group name is specified, the list contains only the descriptions for that
  /// group.
  Future<void> describeCacheParameterGroups(
      {String cacheParameterGroupName, int maxRecords, String marker}) async {}

  /// Returns the detailed parameter list for a particular cache parameter
  /// group.
  Future<void> describeCacheParameters(String cacheParameterGroupName,
      {String source, int maxRecords, String marker}) async {}

  /// Returns a list of cache security group descriptions. If a cache security
  /// group name is specified, the list contains only the description of that
  /// group. This applicable only when you have ElastiCache in Classic setup
  Future<void> describeCacheSecurityGroups(
      {String cacheSecurityGroupName, int maxRecords, String marker}) async {}

  /// Returns a list of cache subnet group descriptions. If a subnet group name
  /// is specified, the list contains only the description of that group. This
  /// is applicable only when you have ElastiCache in VPC setup. All ElastiCache
  /// clusters now launch in VPC by default.
  Future<void> describeCacheSubnetGroups(
      {String cacheSubnetGroupName, int maxRecords, String marker}) async {}

  /// Returns the default engine and system parameter information for the
  /// specified cache engine.
  Future<void> describeEngineDefaultParameters(String cacheParameterGroupFamily,
      {int maxRecords, String marker}) async {}

  /// Returns events related to clusters, cache security groups, and cache
  /// parameter groups. You can obtain events specific to a particular cluster,
  /// cache security group, or cache parameter group by providing the name as a
  /// parameter.
  ///
  /// By default, only the events occurring within the last hour are returned;
  /// however, you can retrieve up to 14 days' worth of events if necessary.
  Future<void> describeEvents(
      {String sourceIdentifier,
      String sourceType,
      DateTime startTime,
      DateTime endTime,
      int duration,
      int maxRecords,
      String marker}) async {}

  /// Returns information about a particular replication group. If no identifier
  /// is specified, `DescribeReplicationGroups` returns information about all
  /// replication groups.
  ///
  ///
  ///
  /// This operation is valid for Redis only.
  Future<void> describeReplicationGroups(
      {String replicationGroupId, int maxRecords, String marker}) async {}

  /// Returns information about reserved cache nodes for this account, or about
  /// a specified reserved cache node.
  Future<void> describeReservedCacheNodes(
      {String reservedCacheNodeId,
      String reservedCacheNodesOfferingId,
      String cacheNodeType,
      String duration,
      String productDescription,
      String offeringType,
      int maxRecords,
      String marker}) async {}

  /// Lists available reserved cache node offerings.
  Future<void> describeReservedCacheNodesOfferings(
      {String reservedCacheNodesOfferingId,
      String cacheNodeType,
      String duration,
      String productDescription,
      String offeringType,
      int maxRecords,
      String marker}) async {}

  /// Returns details of the service updates
  Future<void> describeServiceUpdates(
      {String serviceUpdateName,
      List<String> serviceUpdateStatus,
      int maxRecords,
      String marker}) async {}

  /// Returns information about cluster or replication group snapshots. By
  /// default, `DescribeSnapshots` lists all of your snapshots; it can
  /// optionally describe a single snapshot, or just the snapshots associated
  /// with a particular cache cluster.
  ///
  ///
  ///
  /// This operation is valid for Redis only.
  Future<void> describeSnapshots(
      {String replicationGroupId,
      String cacheClusterId,
      String snapshotName,
      String snapshotSource,
      String marker,
      int maxRecords,
      bool showNodeGroupConfig}) async {}

  /// Returns details of the update actions
  Future<void> describeUpdateActions(
      {String serviceUpdateName,
      List<String> replicationGroupIds,
      List<String> serviceUpdateStatus,
      TimeRangeFilter serviceUpdateTimeRange,
      List<String> updateActionStatus,
      bool showNodeLevelUpdateStatus,
      int maxRecords,
      String marker}) async {}

  /// Dynamically increases the number of replics in a Redis (cluster mode
  /// disabled) replication group or the number of replica nodes in one or more
  /// node groups (shards) of a Redis (cluster mode enabled) replication group.
  /// This operation is performed with no cluster down time.
  Future<void> increaseReplicaCount(
      {@required String replicationGroupId,
      int newReplicaCount,
      List<ConfigureShard> replicaConfiguration,
      @required bool applyImmediately}) async {}

  /// Lists all available node types that you can scale your Redis cluster's or
  /// replication group's current node type.
  ///
  /// When you use the `ModifyCacheCluster` or `ModifyReplicationGroup`
  /// operations to scale your cluster or replication group, the value of the
  /// `CacheNodeType` parameter must be one of the node types returned by this
  /// operation.
  Future<void> listAllowedNodeTypeModifications(
      {String cacheClusterId, String replicationGroupId}) async {}

  /// Lists all cost allocation tags currently on the named resource. A `cost
  /// allocation tag` is a key-value pair where the key is case-sensitive and
  /// the value is optional. You can use cost allocation tags to categorize and
  /// track your AWS costs.
  ///
  /// If the cluster is not in the _available_ state, `ListTagsForResource`
  /// returns an error.
  ///
  /// You can have a maximum of 50 cost allocation tags on an ElastiCache
  /// resource. For more information, see [Monitoring Costs with
  /// Tags](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Tagging.html).
  Future<void> listTagsForResource(String resourceName) async {}

  /// Modifies the settings for a cluster. You can use this operation to change
  /// one or more cluster configuration parameters by specifying the parameters
  /// and the new values.
  Future<void> modifyCacheCluster(String cacheClusterId,
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
      String cacheNodeType}) async {}

  /// Modifies the parameters of a cache parameter group. You can modify up to
  /// 20 parameters in a single request by submitting a list parameter name and
  /// value pairs.
  Future<void> modifyCacheParameterGroup(
      {@required String cacheParameterGroupName,
      @required List<ParameterNameValue> parameterNameValues}) async {}

  /// Modifies an existing cache subnet group.
  Future<void> modifyCacheSubnetGroup(String cacheSubnetGroupName,
      {String cacheSubnetGroupDescription, List<String> subnetIds}) async {}

  /// Modifies the settings for a replication group.
  ///
  /// For Redis (cluster mode enabled) clusters, this operation cannot be used
  /// to change a cluster's node type or engine version. For more information,
  /// see:
  ///
  /// *    [Scaling for Amazon ElastiCache for Redis (cluster mode
  /// enabled)](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/scaling-redis-cluster-mode-enabled.html)
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
  Future<void> modifyReplicationGroup(String replicationGroupId,
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
      String nodeGroupId}) async {}

  /// Modifies a replication group's shards (node groups) by allowing you to add
  /// shards, remove shards, or rebalance the keyspaces among exisiting shards.
  Future<void> modifyReplicationGroupShardConfiguration(
      {@required String replicationGroupId,
      @required int nodeGroupCount,
      @required bool applyImmediately,
      List<ReshardingConfiguration> reshardingConfiguration,
      List<String> nodeGroupsToRemove,
      List<String> nodeGroupsToRetain}) async {}

  /// Allows you to purchase a reserved cache node offering.
  Future<void> purchaseReservedCacheNodesOffering(
      String reservedCacheNodesOfferingId,
      {String reservedCacheNodeId,
      int cacheNodeCount}) async {}

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
  /// enabled) cluster reboot for the changes to be applied, see [Rebooting a
  /// Cluster](http://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Clusters.Rebooting.html)
  /// for an alternate process.
  Future<void> rebootCacheCluster(
      {@required String cacheClusterId,
      @required List<String> cacheNodeIdsToReboot}) async {}

  /// Removes the tags identified by the `TagKeys` list from the named resource.
  Future<void> removeTagsFromResource(
      {@required String resourceName, @required List<String> tagKeys}) async {}

  /// Modifies the parameters of a cache parameter group to the engine or system
  /// default value. You can reset specific parameters by submitting a list of
  /// parameter names. To reset the entire cache parameter group, specify the
  /// `ResetAllParameters` and `CacheParameterGroupName` parameters.
  Future<void> resetCacheParameterGroup(String cacheParameterGroupName,
      {bool resetAllParameters,
      List<ParameterNameValue> parameterNameValues}) async {}

  /// Revokes ingress from a cache security group. Use this operation to
  /// disallow access from an Amazon EC2 security group that had been previously
  /// authorized.
  Future<void> revokeCacheSecurityGroupIngress(
      {@required String cacheSecurityGroupName,
      @required String ec2SecurityGroupName,
      @required String ec2SecurityGroupOwnerId}) async {}

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
  ///     *    [Viewing ElastiCache
  /// Events](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/ECEvents.Viewing.html)
  /// in the _ElastiCache User Guide_
  ///
  ///     *
  /// [DescribeEvents](https://docs.aws.amazon.com/AmazonElastiCache/latest/APIReference/API_DescribeEvents.html)
  /// in the ElastiCache API Reference
  ///
  ///
  ///
  /// Also see, [Testing Multi-AZ with Automatic
  /// Failover](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/AutoFailover.html#auto-failover-test)
  /// in the _ElastiCache User Guide_.
  Future<void> testFailover(
      {@required String replicationGroupId,
      @required String nodeGroupId}) async {}
}

class AllowedNodeTypeModificationsMessage {}

class AuthorizeCacheSecurityGroupIngressResult {}

class AvailabilityZone {}

class CacheCluster {}

class CacheClusterMessage {}

class CacheEngineVersion {}

class CacheEngineVersionMessage {}

class CacheNode {}

class CacheNodeTypeSpecificParameter {}

class CacheNodeTypeSpecificValue {}

class CacheParameterGroup {}

class CacheParameterGroupDetails {}

class CacheParameterGroupNameMessage {}

class CacheParameterGroupStatus {}

class CacheParameterGroupsMessage {}

class CacheSecurityGroup {}

class CacheSecurityGroupMembership {}

class CacheSecurityGroupMessage {}

class CacheSubnetGroup {}

class CacheSubnetGroupMessage {}

class ConfigureShard {}

class CopySnapshotResult {}

class CreateCacheClusterResult {}

class CreateCacheParameterGroupResult {}

class CreateCacheSecurityGroupResult {}

class CreateCacheSubnetGroupResult {}

class CreateReplicationGroupResult {}

class CreateSnapshotResult {}

class DecreaseReplicaCountResult {}

class DeleteCacheClusterResult {}

class DeleteReplicationGroupResult {}

class DeleteSnapshotResult {}

class DescribeEngineDefaultParametersResult {}

class DescribeSnapshotsListMessage {}

class Ec2SecurityGroup {}

class Endpoint {}

class EngineDefaults {}

class Event {}

class EventsMessage {}

class IncreaseReplicaCountResult {}

class ModifyCacheClusterResult {}

class ModifyCacheSubnetGroupResult {}

class ModifyReplicationGroupResult {}

class ModifyReplicationGroupShardConfigurationResult {}

class NodeGroup {}

class NodeGroupConfiguration {}

class NodeGroupMember {}

class NodeGroupMemberUpdateStatus {}

class NodeGroupUpdateStatus {}

class NodeSnapshot {}

class NotificationConfiguration {}

class Parameter {}

class ParameterNameValue {}

class PendingModifiedValues {}

class ProcessedUpdateAction {}

class PurchaseReservedCacheNodesOfferingResult {}

class RebootCacheClusterResult {}

class RecurringCharge {}

class ReplicationGroup {}

class ReplicationGroupMessage {}

class ReplicationGroupPendingModifiedValues {}

class ReservedCacheNode {}

class ReservedCacheNodeMessage {}

class ReservedCacheNodesOffering {}

class ReservedCacheNodesOfferingMessage {}

class ReshardingConfiguration {}

class ReshardingStatus {}

class RevokeCacheSecurityGroupIngressResult {}

class SecurityGroupMembership {}

class ServiceUpdate {}

class ServiceUpdatesMessage {}

class SlotMigration {}

class Snapshot {}

class Subnet {}

class Tag {}

class TagListMessage {}

class TestFailoverResult {}

class TimeRangeFilter {}

class UnprocessedUpdateAction {}

class UpdateAction {}

class UpdateActionResultsMessage {}

class UpdateActionsMessage {}
