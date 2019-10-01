import 'package:meta/meta.dart';

class RdsApi {
  Future<void> addSourceIdentifierToSubscription(
      {@required String subscriptionName,
      @required String sourceIdentifier}) async {}

  Future<void> addTagsToResource(
      {@required String resourceName, @required List<Tag> tags}) async {}

  Future<void> authorizeDBSecurityGroupIngress(String dbSecurityGroupName,
      {String cidrip,
      String ec2SecurityGroupName,
      String ec2SecurityGroupId,
      String ec2SecurityGroupOwnerId}) async {}

  Future<void> copyDBSnapshot(
      {@required String sourceDBSnapshotIdentifier,
      @required String targetDBSnapshotIdentifier}) async {}

  Future<void> createDBInstance(
      {String dbName,
      @required String dbInstanceIdentifier,
      @required int allocatedStorage,
      @required String dbInstanceClass,
      @required String engine,
      @required String masterUsername,
      @required String masterUserPassword,
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
      bool publiclyAccessible}) async {}

  Future<void> createDBInstanceReadReplica(
      {@required String dbInstanceIdentifier,
      @required String sourceDBInstanceIdentifier,
      String dbInstanceClass,
      String availabilityZone,
      int port,
      bool autoMinorVersionUpgrade,
      int iops,
      String optionGroupName,
      bool publiclyAccessible}) async {}

  Future<void> createDBParameterGroup(
      {@required String dbParameterGroupName,
      @required String dbParameterGroupFamily,
      @required String description}) async {}

  Future<void> createDBSecurityGroup(
      {@required String dbSecurityGroupName,
      @required String dbSecurityGroupDescription}) async {}

  Future<void> createDBSnapshot(
      {@required String dbSnapshotIdentifier,
      @required String dbInstanceIdentifier}) async {}

  Future<void> createDBSubnetGroup(
      {@required String dbSubnetGroupName,
      @required String dbSubnetGroupDescription,
      @required List<String> subnetIds}) async {}

  Future<void> createEventSubscription(
      {@required String subscriptionName,
      @required String snsTopicArn,
      String sourceType,
      List<String> eventCategories,
      List<String> sourceIds,
      bool enabled}) async {}

  Future<void> createOptionGroup(
      {@required String optionGroupName,
      @required String engineName,
      @required String majorEngineVersion,
      @required String optionGroupDescription}) async {}

  Future<void> deleteDBInstance(String dbInstanceIdentifier,
      {bool skipFinalSnapshot, String finalDBSnapshotIdentifier}) async {}

  Future<void> deleteDBParameterGroup(String dbParameterGroupName) async {}

  Future<void> deleteDBSecurityGroup(String dbSecurityGroupName) async {}

  Future<void> deleteDBSnapshot(String dbSnapshotIdentifier) async {}

  Future<void> deleteDBSubnetGroup(String dbSubnetGroupName) async {}

  Future<void> deleteEventSubscription(String subscriptionName) async {}

  Future<void> deleteOptionGroup(String optionGroupName) async {}

  Future<void> describeDBEngineVersions(
      {String engine,
      String engineVersion,
      String dbParameterGroupFamily,
      int maxRecords,
      String marker,
      bool defaultOnly,
      bool listSupportedCharacterSets}) async {}

  Future<void> describeDBInstances(
      {String dbInstanceIdentifier, int maxRecords, String marker}) async {}

  Future<void> describeDBParameterGroups(
      {String dbParameterGroupName, int maxRecords, String marker}) async {}

  Future<void> describeDBParameters(String dbParameterGroupName,
      {String source, int maxRecords, String marker}) async {}

  Future<void> describeDBSecurityGroups(
      {String dbSecurityGroupName, int maxRecords, String marker}) async {}

  Future<void> describeDBSnapshots(
      {String dbInstanceIdentifier,
      String dbSnapshotIdentifier,
      String snapshotType,
      int maxRecords,
      String marker}) async {}

  Future<void> describeDBSubnetGroups(
      {String dbSubnetGroupName, int maxRecords, String marker}) async {}

  Future<void> describeEngineDefaultParameters(String dbParameterGroupFamily,
      {int maxRecords, String marker}) async {}

  Future<void> describeEventCategories({String sourceType}) async {}

  Future<void> describeEventSubscriptions(
      {String subscriptionName, int maxRecords, String marker}) async {}

  Future<void> describeEvents(
      {String sourceIdentifier,
      String sourceType,
      DateTime startTime,
      DateTime endTime,
      int duration,
      List<String> eventCategories,
      int maxRecords,
      String marker}) async {}

  Future<void> describeOptionGroupOptions(String engineName,
      {String majorEngineVersion, int maxRecords, String marker}) async {}

  Future<void> describeOptionGroups(
      {String optionGroupName,
      String marker,
      int maxRecords,
      String engineName,
      String majorEngineVersion}) async {}

  Future<void> describeOrderableDBInstanceOptions(String engine,
      {String engineVersion,
      String dbInstanceClass,
      String licenseModel,
      bool vpc,
      int maxRecords,
      String marker}) async {}

  Future<void> describeReservedDBInstances(
      {String reservedDBInstanceId,
      String reservedDBInstancesOfferingId,
      String dbInstanceClass,
      String duration,
      String productDescription,
      String offeringType,
      bool multiAZ,
      int maxRecords,
      String marker}) async {}

  Future<void> describeReservedDBInstancesOfferings(
      {String reservedDBInstancesOfferingId,
      String dbInstanceClass,
      String duration,
      String productDescription,
      String offeringType,
      bool multiAZ,
      int maxRecords,
      String marker}) async {}

  Future<void> listTagsForResource(String resourceName) async {}

  Future<void> modifyDBInstance(String dbInstanceIdentifier,
      {int allocatedStorage,
      String dbInstanceClass,
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
      int iops,
      String optionGroupName,
      String newDBInstanceIdentifier}) async {}

  Future<void> modifyDBParameterGroup(
      {@required String dbParameterGroupName,
      @required List<Parameter> parameters}) async {}

  Future<void> modifyDBSubnetGroup(
      {@required String dbSubnetGroupName,
      String dbSubnetGroupDescription,
      @required List<String> subnetIds}) async {}

  Future<void> modifyEventSubscription(String subscriptionName,
      {String snsTopicArn,
      String sourceType,
      List<String> eventCategories,
      bool enabled}) async {}

  Future<void> modifyOptionGroup(String optionGroupName,
      {List<OptionConfiguration> optionsToInclude,
      List<String> optionsToRemove,
      bool applyImmediately}) async {}

  Future<void> promoteReadReplica(String dbInstanceIdentifier,
      {int backupRetentionPeriod, String preferredBackupWindow}) async {}

  Future<void> purchaseReservedDBInstancesOffering(
      String reservedDBInstancesOfferingId,
      {String reservedDBInstanceId,
      int dbInstanceCount}) async {}

  Future<void> rebootDBInstance(String dbInstanceIdentifier,
      {bool forceFailover}) async {}

  Future<void> removeSourceIdentifierFromSubscription(
      {@required String subscriptionName,
      @required String sourceIdentifier}) async {}

  Future<void> removeTagsFromResource(
      {@required String resourceName, @required List<String> tagKeys}) async {}

  Future<void> resetDBParameterGroup(String dbParameterGroupName,
      {bool resetAllParameters, List<Parameter> parameters}) async {}

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
      String optionGroupName}) async {}

  Future<void> restoreDBInstanceToPointInTime(
      {@required String sourceDBInstanceIdentifier,
      @required String targetDBInstanceIdentifier,
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
      String optionGroupName}) async {}

  Future<void> revokeDBSecurityGroupIngress(String dbSecurityGroupName,
      {String cidrip,
      String ec2SecurityGroupName,
      String ec2SecurityGroupId,
      String ec2SecurityGroupOwnerId}) async {}
}

class AddSourceIdentifierToSubscriptionResult {}

class AuthorizeDBSecurityGroupIngressResult {}

class AvailabilityZone {}

class CharacterSet {}

class CopyDBSnapshotResult {}

class CreateDBInstanceReadReplicaResult {}

class CreateDBInstanceResult {}

class CreateDBParameterGroupResult {}

class CreateDBSecurityGroupResult {}

class CreateDBSnapshotResult {}

class CreateDBSubnetGroupResult {}

class CreateEventSubscriptionResult {}

class CreateOptionGroupResult {}

class DBEngineVersion {}

class DBEngineVersionMessage {}

class DBInstance {}

class DBInstanceMessage {}

class DBParameterGroup {}

class DBParameterGroupDetails {}

class DBParameterGroupNameMessage {}

class DBParameterGroupStatus {}

class DBParameterGroupsMessage {}

class DBSecurityGroup {}

class DBSecurityGroupMembership {}

class DBSecurityGroupMessage {}

class DBSnapshot {}

class DBSnapshotMessage {}

class DBSubnetGroup {}

class DBSubnetGroupMessage {}

class DeleteDBInstanceResult {}

class DeleteDBSnapshotResult {}

class DeleteEventSubscriptionResult {}

class DescribeEngineDefaultParametersResult {}

class Ec2SecurityGroup {}

class Endpoint {}

class EngineDefaults {}

class Event {}

class EventCategoriesMap {}

class EventCategoriesMessage {}

class EventSubscription {}

class EventSubscriptionsMessage {}

class EventsMessage {}

class IPRange {}

class ModifyDBInstanceResult {}

class ModifyDBSubnetGroupResult {}

class ModifyEventSubscriptionResult {}

class ModifyOptionGroupResult {}

class Option {}

class OptionConfiguration {}

class OptionGroup {}

class OptionGroupMembership {}

class OptionGroupOption {}

class OptionGroupOptionsMessage {}

class OptionGroups {}

class OrderableDBInstanceOption {}

class OrderableDBInstanceOptionsMessage {}

class Parameter {}

class PendingModifiedValues {}

class PromoteReadReplicaResult {}

class PurchaseReservedDBInstancesOfferingResult {}

class RebootDBInstanceResult {}

class RecurringCharge {}

class RemoveSourceIdentifierFromSubscriptionResult {}

class ReservedDBInstance {}

class ReservedDBInstanceMessage {}

class ReservedDBInstancesOffering {}

class ReservedDBInstancesOfferingMessage {}

class RestoreDBInstanceFromDBSnapshotResult {}

class RestoreDBInstanceToPointInTimeResult {}

class RevokeDBSecurityGroupIngressResult {}

class Subnet {}

class Tag {}

class TagListMessage {}

class VpcSecurityGroupMembership {}