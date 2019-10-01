import 'package:meta/meta.dart';

/// Amazon DocumentDB API documentation
class DocDBApi {
  /// Adds metadata tags to an Amazon DocumentDB resource. You can use these
  /// tags with cost allocation reporting to track costs that are associated
  /// with Amazon DocumentDB resources. or in a `Condition` statement in an AWS
  /// Identity and Access Management (IAM) policy for Amazon DocumentDB.
  Future<void> addTagsToResource(
      {@required String resourceName, @required List<Tag> tags}) async {}

  /// Applies a pending maintenance action to a resource (for example, to a DB
  /// instance).
  Future<void> applyPendingMaintenanceAction(
      {@required String resourceIdentifier,
      @required String applyAction,
      @required String optInType}) async {}

  /// Copies the specified DB cluster parameter group.
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
  /// To cancel the copy operation after it is in progress, delete the target DB
  /// cluster snapshot identified by `TargetDBClusterSnapshotIdentifier` while
  /// that DB cluster snapshot is in the _copying_ status.
  Future<void> copyDBClusterSnapshot(
      {@required String sourceDBClusterSnapshotIdentifier,
      @required String targetDBClusterSnapshotIdentifier,
      String kmsKeyId,
      String preSignedUrl,
      bool copyTags,
      List<Tag> tags}) async {}

  /// Creates a new Amazon DocumentDB DB cluster.
  Future<void> createDBCluster(
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
      bool deletionProtection}) async {}

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
  Future<void> createDBClusterParameterGroup(
      {@required String dbClusterParameterGroupName,
      @required String dbParameterGroupFamily,
      @required String description,
      List<Tag> tags}) async {}

  /// Creates a snapshot of a DB cluster.
  Future<void> createDBClusterSnapshot(
      {@required String dbClusterSnapshotIdentifier,
      @required String dbClusterIdentifier,
      List<Tag> tags}) async {}

  /// Creates a new DB instance.
  Future<void> createDBInstance(
      {@required String dbInstanceIdentifier,
      @required String dbInstanceClass,
      @required String engine,
      String availabilityZone,
      String preferredMaintenanceWindow,
      bool autoMinorVersionUpgrade,
      List<Tag> tags,
      @required String dbClusterIdentifier,
      int promotionTier}) async {}

  /// Creates a new DB subnet group. DB subnet groups must contain at least one
  /// subnet in at least two Availability Zones in the AWS Region.
  Future<void> createDBSubnetGroup(
      {@required String dbSubnetGroupName,
      @required String dbSubnetGroupDescription,
      @required List<String> subnetIds,
      List<Tag> tags}) async {}

  /// Deletes a previously provisioned DB cluster. When you delete a DB cluster,
  /// all automated backups for that DB cluster are deleted and can't be
  /// recovered. Manual DB cluster snapshots of the specified DB cluster are not
  /// deleted.
  Future<void> deleteDBCluster(String dbClusterIdentifier,
      {bool skipFinalSnapshot, String finalDBSnapshotIdentifier}) async {}

  /// Deletes a specified DB cluster parameter group. The DB cluster parameter
  /// group to be deleted can't be associated with any DB clusters.
  Future<void> deleteDBClusterParameterGroup(
      String dbClusterParameterGroupName) async {}

  /// Deletes a DB cluster snapshot. If the snapshot is being copied, the copy
  /// operation is terminated.
  ///
  ///
  ///
  /// The DB cluster snapshot must be in the `available` state to be deleted.
  Future<void> deleteDBClusterSnapshot(
      String dbClusterSnapshotIdentifier) async {}

  /// Deletes a previously provisioned DB instance.
  Future<void> deleteDBInstance(String dbInstanceIdentifier) async {}

  /// Deletes a DB subnet group.
  ///
  ///
  ///
  /// The specified database subnet group must not be associated with any DB
  /// instances.
  Future<void> deleteDBSubnetGroup(String dbSubnetGroupName) async {}

  /// Returns a list of `DBClusterParameterGroup` descriptions. If a
  /// `DBClusterParameterGroupName` parameter is specified, the list contains
  /// only the description of the specified DB cluster parameter group.
  Future<void> describeDBClusterParameterGroups(
      {String dbClusterParameterGroupName,
      List<Filter> filters,
      int maxRecords,
      String marker}) async {}

  /// Returns the detailed parameter list for a particular DB cluster parameter
  /// group.
  Future<void> describeDBClusterParameters(String dbClusterParameterGroupName,
      {String source,
      List<Filter> filters,
      int maxRecords,
      String marker}) async {}

  /// Returns a list of DB cluster snapshot attribute names and values for a
  /// manual DB cluster snapshot.
  ///
  /// When you share snapshots with other AWS accounts,
  /// `DescribeDBClusterSnapshotAttributes` returns the `restore` attribute and
  /// a list of IDs for the AWS accounts that are authorized to copy or restore
  /// the manual DB cluster snapshot. If `all` is included in the list of values
  /// for the `restore` attribute, then the manual DB cluster snapshot is public
  /// and can be copied or restored by all AWS accounts.
  Future<void> describeDBClusterSnapshotAttributes(
      String dbClusterSnapshotIdentifier) async {}

  /// Returns information about DB cluster snapshots. This API operation
  /// supports pagination.
  Future<void> describeDBClusterSnapshots(
      {String dbClusterIdentifier,
      String dbClusterSnapshotIdentifier,
      String snapshotType,
      List<Filter> filters,
      int maxRecords,
      String marker,
      bool includeShared,
      bool includePublic}) async {}

  /// Returns information about provisioned Amazon DocumentDB DB clusters. This
  /// API operation supports pagination.
  Future<void> describeDBClusters(
      {String dbClusterIdentifier,
      List<Filter> filters,
      int maxRecords,
      String marker}) async {}

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
      bool listSupportedTimezones}) async {}

  /// Returns information about provisioned Amazon DocumentDB instances. This
  /// API supports pagination.
  Future<void> describeDBInstances(
      {String dbInstanceIdentifier,
      List<Filter> filters,
      int maxRecords,
      String marker}) async {}

  /// Returns a list of `DBSubnetGroup` descriptions. If a `DBSubnetGroupName`
  /// is specified, the list will contain only the descriptions of the specified
  /// `DBSubnetGroup`.
  Future<void> describeDBSubnetGroups(
      {String dbSubnetGroupName,
      List<Filter> filters,
      int maxRecords,
      String marker}) async {}

  /// Returns the default engine and system parameter information for the
  /// cluster database engine.
  Future<void> describeEngineDefaultClusterParameters(
      String dbParameterGroupFamily,
      {List<Filter> filters,
      int maxRecords,
      String marker}) async {}

  /// Displays a list of categories for all event source types, or, if
  /// specified, for a specified source type.
  Future<void> describeEventCategories(
      {String sourceType, List<Filter> filters}) async {}

  /// Returns events related to DB instances, DB security groups, DB snapshots,
  /// and DB parameter groups for the past 14 days. You can obtain events
  /// specific to a particular DB instance, DB security group, DB snapshot, or
  /// DB parameter group by providing the name as a parameter. By default, the
  /// events of the past hour are returned.
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

  /// Forces a failover for a DB cluster.
  ///
  /// A failover for a DB cluster promotes one of the Amazon DocumentDB replicas
  /// (read-only instances) in the DB cluster to be the primary instance (the
  /// cluster writer).
  ///
  /// If the primary instance fails, Amazon DocumentDB automatically fails over
  /// to an Amazon DocumentDB replica, if one exists. You can force a failover
  /// when you want to simulate a failure of a primary instance for testing.
  Future<void> failoverDBCluster(
      {String dbClusterIdentifier, String targetDBInstanceIdentifier}) async {}

  /// Lists all tags on an Amazon DocumentDB resource.
  Future<void> listTagsForResource(String resourceName,
      {List<Filter> filters}) async {}

  /// Modifies a setting for an Amazon DocumentDB DB cluster. You can change one
  /// or more database configuration parameters by specifying these parameters
  /// and the new values in the request.
  Future<void> modifyDBCluster(String dbClusterIdentifier,
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
      bool deletionProtection}) async {}

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
  Future<void> modifyDBClusterParameterGroup(
      {@required String dbClusterParameterGroupName,
      @required List<Parameter> parameters}) async {}

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
  Future<void> modifyDBClusterSnapshotAttribute(
      {@required String dbClusterSnapshotIdentifier,
      @required String attributeName,
      List<String> valuesToAdd,
      List<String> valuesToRemove}) async {}

  /// Modifies settings for a DB instance. You can change one or more database
  /// configuration parameters by specifying these parameters and the new values
  /// in the request.
  Future<void> modifyDBInstance(String dbInstanceIdentifier,
      {String dbInstanceClass,
      bool applyImmediately,
      String preferredMaintenanceWindow,
      bool autoMinorVersionUpgrade,
      String newDBInstanceIdentifier,
      int promotionTier}) async {}

  /// Modifies an existing DB subnet group. DB subnet groups must contain at
  /// least one subnet in at least two Availability Zones in the AWS Region.
  Future<void> modifyDBSubnetGroup(
      {@required String dbSubnetGroupName,
      String dbSubnetGroupDescription,
      @required List<String> subnetIds}) async {}

  /// You might need to reboot your DB instance, usually for maintenance
  /// reasons. For example, if you make certain changes, or if you change the DB
  /// cluster parameter group that is associated with the DB instance, you must
  /// reboot the instance for the changes to take effect.
  ///
  /// Rebooting a DB instance restarts the database engine service. Rebooting a
  /// DB instance results in a momentary outage, during which the DB instance
  /// status is set to _rebooting_.
  Future<void> rebootDBInstance(String dbInstanceIdentifier,
      {bool forceFailover}) async {}

  /// Removes metadata tags from an Amazon DocumentDB resource.
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
  Future<void> resetDBClusterParameterGroup(String dbClusterParameterGroupName,
      {bool resetAllParameters, List<Parameter> parameters}) async {}

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
  Future<void> restoreDBClusterFromSnapshot(
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
      bool deletionProtection}) async {}

  /// Restores a DB cluster to an arbitrary point in time. Users can restore to
  /// any point in time before `LatestRestorableTime` for up to
  /// `BackupRetentionPeriod` days. The target DB cluster is created from the
  /// source DB cluster with the same configuration as the original DB cluster,
  /// except that the new DB cluster is created with the default DB security
  /// group.
  Future<void> restoreDBClusterToPointInTime(
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
      bool deletionProtection}) async {}

  /// Restarts the stopped cluster that is specified by `DBClusterIdentifier`.
  /// For more information, see [Stopping and Starting an Amazon DocumentDB
  /// Cluster](https://docs.aws.amazon.com/documentdb/latest/developerguide/db-cluster-stop-start.html).
  Future<void> startDBCluster(String dbClusterIdentifier) async {}

  /// Stops the running cluster that is specified by `DBClusterIdentifier`. The
  /// cluster must be in the _available_ state. For more information, see
  /// [Stopping and Starting an Amazon DocumentDB
  /// Cluster](https://docs.aws.amazon.com/documentdb/latest/developerguide/db-cluster-stop-start.html).
  Future<void> stopDBCluster(String dbClusterIdentifier) async {}
}

class ApplyPendingMaintenanceActionResult {}

class AvailabilityZone {}

class CloudwatchLogsExportConfiguration {}

class CopyDBClusterParameterGroupResult {}

class CopyDBClusterSnapshotResult {}

class CreateDBClusterParameterGroupResult {}

class CreateDBClusterResult {}

class CreateDBClusterSnapshotResult {}

class CreateDBInstanceResult {}

class CreateDBSubnetGroupResult {}

class DBCluster {}

class DBClusterMember {}

class DBClusterMessage {}

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

class DBInstanceMessage {}

class DBInstanceStatusInfo {}

class DBSubnetGroup {}

class DBSubnetGroupMessage {}

class DeleteDBClusterResult {}

class DeleteDBClusterSnapshotResult {}

class DeleteDBInstanceResult {}

class DescribeDBClusterSnapshotAttributesResult {}

class DescribeEngineDefaultClusterParametersResult {}

class Endpoint {}

class EngineDefaults {}

class Event {}

class EventCategoriesMap {}

class EventCategoriesMessage {}

class EventsMessage {}

class FailoverDBClusterResult {}

class Filter {}

class ModifyDBClusterResult {}

class ModifyDBClusterSnapshotAttributeResult {}

class ModifyDBInstanceResult {}

class ModifyDBSubnetGroupResult {}

class OrderableDBInstanceOption {}

class OrderableDBInstanceOptionsMessage {}

class Parameter {}

class PendingCloudwatchLogsExports {}

class PendingMaintenanceAction {}

class PendingMaintenanceActionsMessage {}

class PendingModifiedValues {}

class RebootDBInstanceResult {}

class ResourcePendingMaintenanceActions {}

class RestoreDBClusterFromSnapshotResult {}

class RestoreDBClusterToPointInTimeResult {}

class StartDBClusterResult {}

class StopDBClusterResult {}

class Subnet {}

class Tag {}

class TagListMessage {}

class UpgradeTarget {}

class VpcSecurityGroupMembership {}
