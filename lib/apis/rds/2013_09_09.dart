import 'package:meta/meta.dart';

class RdsApi {
  Future<AddSourceIdentifierToSubscriptionResult>
      addSourceIdentifierToSubscription(
          {@required String subscriptionName,
          @required String sourceIdentifier}) async {
    return AddSourceIdentifierToSubscriptionResult.fromJson({});
  }

  Future<void> addTagsToResource(
      {@required String resourceName, @required List<Tag> tags}) async {}

  Future<AuthorizeDBSecurityGroupIngressResult> authorizeDBSecurityGroupIngress(
      String dbSecurityGroupName,
      {String cidrip,
      String ec2SecurityGroupName,
      String ec2SecurityGroupId,
      String ec2SecurityGroupOwnerId}) async {
    return AuthorizeDBSecurityGroupIngressResult.fromJson({});
  }

  Future<CopyDBSnapshotResult> copyDBSnapshot(
      {@required String sourceDBSnapshotIdentifier,
      @required String targetDBSnapshotIdentifier,
      List<Tag> tags}) async {
    return CopyDBSnapshotResult.fromJson({});
  }

  Future<CreateDBInstanceResult> createDBInstance(
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
      bool publiclyAccessible,
      List<Tag> tags}) async {
    return CreateDBInstanceResult.fromJson({});
  }

  Future<CreateDBInstanceReadReplicaResult> createDBInstanceReadReplica(
      {@required String dbInstanceIdentifier,
      @required String sourceDBInstanceIdentifier,
      String dbInstanceClass,
      String availabilityZone,
      int port,
      bool autoMinorVersionUpgrade,
      int iops,
      String optionGroupName,
      bool publiclyAccessible,
      List<Tag> tags,
      String dbSubnetGroupName}) async {
    return CreateDBInstanceReadReplicaResult.fromJson({});
  }

  Future<CreateDBParameterGroupResult> createDBParameterGroup(
      {@required String dbParameterGroupName,
      @required String dbParameterGroupFamily,
      @required String description,
      List<Tag> tags}) async {
    return CreateDBParameterGroupResult.fromJson({});
  }

  Future<CreateDBSecurityGroupResult> createDBSecurityGroup(
      {@required String dbSecurityGroupName,
      @required String dbSecurityGroupDescription,
      List<Tag> tags}) async {
    return CreateDBSecurityGroupResult.fromJson({});
  }

  Future<CreateDBSnapshotResult> createDBSnapshot(
      {@required String dbSnapshotIdentifier,
      @required String dbInstanceIdentifier,
      List<Tag> tags}) async {
    return CreateDBSnapshotResult.fromJson({});
  }

  Future<CreateDBSubnetGroupResult> createDBSubnetGroup(
      {@required String dbSubnetGroupName,
      @required String dbSubnetGroupDescription,
      @required List<String> subnetIds,
      List<Tag> tags}) async {
    return CreateDBSubnetGroupResult.fromJson({});
  }

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

  Future<CreateOptionGroupResult> createOptionGroup(
      {@required String optionGroupName,
      @required String engineName,
      @required String majorEngineVersion,
      @required String optionGroupDescription,
      List<Tag> tags}) async {
    return CreateOptionGroupResult.fromJson({});
  }

  Future<DeleteDBInstanceResult> deleteDBInstance(String dbInstanceIdentifier,
      {bool skipFinalSnapshot, String finalDBSnapshotIdentifier}) async {
    return DeleteDBInstanceResult.fromJson({});
  }

  Future<void> deleteDBParameterGroup(String dbParameterGroupName) async {}

  Future<void> deleteDBSecurityGroup(String dbSecurityGroupName) async {}

  Future<DeleteDBSnapshotResult> deleteDBSnapshot(
      String dbSnapshotIdentifier) async {
    return DeleteDBSnapshotResult.fromJson({});
  }

  Future<void> deleteDBSubnetGroup(String dbSubnetGroupName) async {}

  Future<DeleteEventSubscriptionResult> deleteEventSubscription(
      String subscriptionName) async {
    return DeleteEventSubscriptionResult.fromJson({});
  }

  Future<void> deleteOptionGroup(String optionGroupName) async {}

  Future<DBEngineVersionMessage> describeDBEngineVersions(
      {String engine,
      String engineVersion,
      String dbParameterGroupFamily,
      List<Filter> filters,
      int maxRecords,
      String marker,
      bool defaultOnly,
      bool listSupportedCharacterSets}) async {
    return DBEngineVersionMessage.fromJson({});
  }

  Future<DBInstanceMessage> describeDBInstances(
      {String dbInstanceIdentifier,
      List<Filter> filters,
      int maxRecords,
      String marker}) async {
    return DBInstanceMessage.fromJson({});
  }

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

  Future<DBParameterGroupsMessage> describeDBParameterGroups(
      {String dbParameterGroupName,
      List<Filter> filters,
      int maxRecords,
      String marker}) async {
    return DBParameterGroupsMessage.fromJson({});
  }

  Future<DBParameterGroupDetails> describeDBParameters(
      String dbParameterGroupName,
      {String source,
      List<Filter> filters,
      int maxRecords,
      String marker}) async {
    return DBParameterGroupDetails.fromJson({});
  }

  Future<DBSecurityGroupMessage> describeDBSecurityGroups(
      {String dbSecurityGroupName,
      List<Filter> filters,
      int maxRecords,
      String marker}) async {
    return DBSecurityGroupMessage.fromJson({});
  }

  Future<DBSnapshotMessage> describeDBSnapshots(
      {String dbInstanceIdentifier,
      String dbSnapshotIdentifier,
      String snapshotType,
      List<Filter> filters,
      int maxRecords,
      String marker}) async {
    return DBSnapshotMessage.fromJson({});
  }

  Future<DBSubnetGroupMessage> describeDBSubnetGroups(
      {String dbSubnetGroupName,
      List<Filter> filters,
      int maxRecords,
      String marker}) async {
    return DBSubnetGroupMessage.fromJson({});
  }

  Future<DescribeEngineDefaultParametersResult> describeEngineDefaultParameters(
      String dbParameterGroupFamily,
      {List<Filter> filters,
      int maxRecords,
      String marker}) async {
    return DescribeEngineDefaultParametersResult.fromJson({});
  }

  Future<EventCategoriesMessage> describeEventCategories(
      {String sourceType, List<Filter> filters}) async {
    return EventCategoriesMessage.fromJson({});
  }

  Future<EventSubscriptionsMessage> describeEventSubscriptions(
      {String subscriptionName,
      List<Filter> filters,
      int maxRecords,
      String marker}) async {
    return EventSubscriptionsMessage.fromJson({});
  }

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

  Future<OptionGroupOptionsMessage> describeOptionGroupOptions(
      String engineName,
      {String majorEngineVersion,
      List<Filter> filters,
      int maxRecords,
      String marker}) async {
    return OptionGroupOptionsMessage.fromJson({});
  }

  Future<OptionGroups> describeOptionGroups(
      {String optionGroupName,
      List<Filter> filters,
      String marker,
      int maxRecords,
      String engineName,
      String majorEngineVersion}) async {
    return OptionGroups.fromJson({});
  }

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

  Future<DownloadDBLogFilePortionDetails> downloadDBLogFilePortion(
      {@required String dbInstanceIdentifier,
      @required String logFileName,
      String marker,
      int numberOfLines}) async {
    return DownloadDBLogFilePortionDetails.fromJson({});
  }

  Future<TagListMessage> listTagsForResource(String resourceName,
      {List<Filter> filters}) async {
    return TagListMessage.fromJson({});
  }

  Future<ModifyDBInstanceResult> modifyDBInstance(String dbInstanceIdentifier,
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
      String newDBInstanceIdentifier}) async {
    return ModifyDBInstanceResult.fromJson({});
  }

  Future<DBParameterGroupNameMessage> modifyDBParameterGroup(
      {@required String dbParameterGroupName,
      @required List<Parameter> parameters}) async {
    return DBParameterGroupNameMessage.fromJson({});
  }

  Future<ModifyDBSubnetGroupResult> modifyDBSubnetGroup(
      {@required String dbSubnetGroupName,
      String dbSubnetGroupDescription,
      @required List<String> subnetIds}) async {
    return ModifyDBSubnetGroupResult.fromJson({});
  }

  Future<ModifyEventSubscriptionResult> modifyEventSubscription(
      String subscriptionName,
      {String snsTopicArn,
      String sourceType,
      List<String> eventCategories,
      bool enabled}) async {
    return ModifyEventSubscriptionResult.fromJson({});
  }

  Future<ModifyOptionGroupResult> modifyOptionGroup(String optionGroupName,
      {List<OptionConfiguration> optionsToInclude,
      List<String> optionsToRemove,
      bool applyImmediately}) async {
    return ModifyOptionGroupResult.fromJson({});
  }

  Future<PromoteReadReplicaResult> promoteReadReplica(
      String dbInstanceIdentifier,
      {int backupRetentionPeriod,
      String preferredBackupWindow}) async {
    return PromoteReadReplicaResult.fromJson({});
  }

  Future<PurchaseReservedDBInstancesOfferingResult>
      purchaseReservedDBInstancesOffering(String reservedDBInstancesOfferingId,
          {String reservedDBInstanceId,
          int dbInstanceCount,
          List<Tag> tags}) async {
    return PurchaseReservedDBInstancesOfferingResult.fromJson({});
  }

  Future<RebootDBInstanceResult> rebootDBInstance(String dbInstanceIdentifier,
      {bool forceFailover}) async {
    return RebootDBInstanceResult.fromJson({});
  }

  Future<RemoveSourceIdentifierFromSubscriptionResult>
      removeSourceIdentifierFromSubscription(
          {@required String subscriptionName,
          @required String sourceIdentifier}) async {
    return RemoveSourceIdentifierFromSubscriptionResult.fromJson({});
  }

  Future<void> removeTagsFromResource(
      {@required String resourceName, @required List<String> tagKeys}) async {}

  Future<DBParameterGroupNameMessage> resetDBParameterGroup(
      String dbParameterGroupName,
      {bool resetAllParameters,
      List<Parameter> parameters}) async {
    return DBParameterGroupNameMessage.fromJson({});
  }

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
      List<Tag> tags}) async {
    return RestoreDBInstanceFromDBSnapshotResult.fromJson({});
  }

  Future<RestoreDBInstanceToPointInTimeResult> restoreDBInstanceToPointInTime(
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
      String optionGroupName,
      List<Tag> tags}) async {
    return RestoreDBInstanceToPointInTimeResult.fromJson({});
  }

  Future<RevokeDBSecurityGroupIngressResult> revokeDBSecurityGroupIngress(
      String dbSecurityGroupName,
      {String cidrip,
      String ec2SecurityGroupName,
      String ec2SecurityGroupId,
      String ec2SecurityGroupOwnerId}) async {
    return RevokeDBSecurityGroupIngressResult.fromJson({});
  }
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

class AuthorizeDBSecurityGroupIngressResult {
  final DBSecurityGroup dbSecurityGroup;

  AuthorizeDBSecurityGroupIngressResult({
    this.dbSecurityGroup,
  });
  static AuthorizeDBSecurityGroupIngressResult fromJson(
          Map<String, dynamic> json) =>
      AuthorizeDBSecurityGroupIngressResult();
}

class AvailabilityZone {
  final String name;

  final bool provisionedIopsCapable;

  AvailabilityZone({
    this.name,
    this.provisionedIopsCapable,
  });
  static AvailabilityZone fromJson(Map<String, dynamic> json) =>
      AvailabilityZone();
}

class CharacterSet {
  final String characterSetName;

  final String characterSetDescription;

  CharacterSet({
    this.characterSetName,
    this.characterSetDescription,
  });
  static CharacterSet fromJson(Map<String, dynamic> json) => CharacterSet();
}

class CopyDBSnapshotResult {
  final DBSnapshot dbSnapshot;

  CopyDBSnapshotResult({
    this.dbSnapshot,
  });
  static CopyDBSnapshotResult fromJson(Map<String, dynamic> json) =>
      CopyDBSnapshotResult();
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

class CreateOptionGroupResult {
  final OptionGroup optionGroup;

  CreateOptionGroupResult({
    this.optionGroup,
  });
  static CreateOptionGroupResult fromJson(Map<String, dynamic> json) =>
      CreateOptionGroupResult();
}

class DBEngineVersion {
  final String engine;

  final String engineVersion;

  final String dbParameterGroupFamily;

  final String dbEngineDescription;

  final String dbEngineVersionDescription;

  final CharacterSet defaultCharacterSet;

  final List<CharacterSet> supportedCharacterSets;

  DBEngineVersion({
    this.engine,
    this.engineVersion,
    this.dbParameterGroupFamily,
    this.dbEngineDescription,
    this.dbEngineVersionDescription,
    this.defaultCharacterSet,
    this.supportedCharacterSets,
  });
  static DBEngineVersion fromJson(Map<String, dynamic> json) =>
      DBEngineVersion();
}

class DBEngineVersionMessage {
  final String marker;

  final List<DBEngineVersion> dbEngineVersions;

  DBEngineVersionMessage({
    this.marker,
    this.dbEngineVersions,
  });
  static DBEngineVersionMessage fromJson(Map<String, dynamic> json) =>
      DBEngineVersionMessage();
}

class DBInstance {
  final String dbInstanceIdentifier;

  final String dbInstanceClass;

  final String engine;

  final String dbInstanceStatus;

  final String masterUsername;

  final String dbName;

  final Endpoint endpoint;

  final int allocatedStorage;

  final DateTime instanceCreateTime;

  final String preferredBackupWindow;

  final int backupRetentionPeriod;

  final List<DBSecurityGroupMembership> dbSecurityGroups;

  final List<VpcSecurityGroupMembership> vpcSecurityGroups;

  final List<DBParameterGroupStatus> dbParameterGroups;

  final String availabilityZone;

  final DBSubnetGroup dbSubnetGroup;

  final String preferredMaintenanceWindow;

  final PendingModifiedValues pendingModifiedValues;

  final DateTime latestRestorableTime;

  final bool multiAZ;

  final String engineVersion;

  final bool autoMinorVersionUpgrade;

  final String readReplicaSourceDBInstanceIdentifier;

  final List<String> readReplicaDBInstanceIdentifiers;

  final String licenseModel;

  final int iops;

  final List<OptionGroupMembership> optionGroupMemberships;

  final String characterSetName;

  final String secondaryAvailabilityZone;

  final bool publiclyAccessible;

  final List<DBInstanceStatusInfo> statusInfos;

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
    this.licenseModel,
    this.iops,
    this.optionGroupMemberships,
    this.characterSetName,
    this.secondaryAvailabilityZone,
    this.publiclyAccessible,
    this.statusInfos,
  });
  static DBInstance fromJson(Map<String, dynamic> json) => DBInstance();
}

class DBInstanceMessage {
  final String marker;

  final List<DBInstance> dbInstances;

  DBInstanceMessage({
    this.marker,
    this.dbInstances,
  });
  static DBInstanceMessage fromJson(Map<String, dynamic> json) =>
      DBInstanceMessage();
}

class DBInstanceStatusInfo {
  final String statusType;

  final bool normal;

  final String status;

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

class DBParameterGroup {
  final String dbParameterGroupName;

  final String dbParameterGroupFamily;

  final String description;

  DBParameterGroup({
    this.dbParameterGroupName,
    this.dbParameterGroupFamily,
    this.description,
  });
  static DBParameterGroup fromJson(Map<String, dynamic> json) =>
      DBParameterGroup();
}

class DBParameterGroupDetails {
  final List<Parameter> parameters;

  final String marker;

  DBParameterGroupDetails({
    this.parameters,
    this.marker,
  });
  static DBParameterGroupDetails fromJson(Map<String, dynamic> json) =>
      DBParameterGroupDetails();
}

class DBParameterGroupNameMessage {
  final String dbParameterGroupName;

  DBParameterGroupNameMessage({
    this.dbParameterGroupName,
  });
  static DBParameterGroupNameMessage fromJson(Map<String, dynamic> json) =>
      DBParameterGroupNameMessage();
}

class DBParameterGroupStatus {
  final String dbParameterGroupName;

  final String parameterApplyStatus;

  DBParameterGroupStatus({
    this.dbParameterGroupName,
    this.parameterApplyStatus,
  });
  static DBParameterGroupStatus fromJson(Map<String, dynamic> json) =>
      DBParameterGroupStatus();
}

class DBParameterGroupsMessage {
  final String marker;

  final List<DBParameterGroup> dbParameterGroups;

  DBParameterGroupsMessage({
    this.marker,
    this.dbParameterGroups,
  });
  static DBParameterGroupsMessage fromJson(Map<String, dynamic> json) =>
      DBParameterGroupsMessage();
}

class DBSecurityGroup {
  final String ownerId;

  final String dbSecurityGroupName;

  final String dbSecurityGroupDescription;

  final String vpcId;

  final List<Ec2SecurityGroup> ec2SecurityGroups;

  final List<IPRange> ipRanges;

  DBSecurityGroup({
    this.ownerId,
    this.dbSecurityGroupName,
    this.dbSecurityGroupDescription,
    this.vpcId,
    this.ec2SecurityGroups,
    this.ipRanges,
  });
  static DBSecurityGroup fromJson(Map<String, dynamic> json) =>
      DBSecurityGroup();
}

class DBSecurityGroupMembership {
  final String dbSecurityGroupName;

  final String status;

  DBSecurityGroupMembership({
    this.dbSecurityGroupName,
    this.status,
  });
  static DBSecurityGroupMembership fromJson(Map<String, dynamic> json) =>
      DBSecurityGroupMembership();
}

class DBSecurityGroupMessage {
  final String marker;

  final List<DBSecurityGroup> dbSecurityGroups;

  DBSecurityGroupMessage({
    this.marker,
    this.dbSecurityGroups,
  });
  static DBSecurityGroupMessage fromJson(Map<String, dynamic> json) =>
      DBSecurityGroupMessage();
}

class DBSnapshot {
  final String dbSnapshotIdentifier;

  final String dbInstanceIdentifier;

  final DateTime snapshotCreateTime;

  final String engine;

  final int allocatedStorage;

  final String status;

  final int port;

  final String availabilityZone;

  final String vpcId;

  final DateTime instanceCreateTime;

  final String masterUsername;

  final String engineVersion;

  final String licenseModel;

  final String snapshotType;

  final int iops;

  final String optionGroupName;

  final int percentProgress;

  final String sourceRegion;

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
  });
  static DBSnapshot fromJson(Map<String, dynamic> json) => DBSnapshot();
}

class DBSnapshotMessage {
  final String marker;

  final List<DBSnapshot> dbSnapshots;

  DBSnapshotMessage({
    this.marker,
    this.dbSnapshots,
  });
  static DBSnapshotMessage fromJson(Map<String, dynamic> json) =>
      DBSnapshotMessage();
}

class DBSubnetGroup {
  final String dbSubnetGroupName;

  final String dbSubnetGroupDescription;

  final String vpcId;

  final String subnetGroupStatus;

  final List<Subnet> subnets;

  DBSubnetGroup({
    this.dbSubnetGroupName,
    this.dbSubnetGroupDescription,
    this.vpcId,
    this.subnetGroupStatus,
    this.subnets,
  });
  static DBSubnetGroup fromJson(Map<String, dynamic> json) => DBSubnetGroup();
}

class DBSubnetGroupMessage {
  final String marker;

  final List<DBSubnetGroup> dbSubnetGroups;

  DBSubnetGroupMessage({
    this.marker,
    this.dbSubnetGroups,
  });
  static DBSubnetGroupMessage fromJson(Map<String, dynamic> json) =>
      DBSubnetGroupMessage();
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

class DescribeDBLogFilesDetails {
  final String logFileName;

  final BigInt lastWritten;

  final BigInt size;

  DescribeDBLogFilesDetails({
    this.logFileName,
    this.lastWritten,
    this.size,
  });
  static DescribeDBLogFilesDetails fromJson(Map<String, dynamic> json) =>
      DescribeDBLogFilesDetails();
}

class DescribeDBLogFilesResponse {
  final List<DescribeDBLogFilesDetails> describeDBLogFiles;

  final String marker;

  DescribeDBLogFilesResponse({
    this.describeDBLogFiles,
    this.marker,
  });
  static DescribeDBLogFilesResponse fromJson(Map<String, dynamic> json) =>
      DescribeDBLogFilesResponse();
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

class DownloadDBLogFilePortionDetails {
  final String logFileData;

  final String marker;

  final bool additionalDataPending;

  DownloadDBLogFilePortionDetails({
    this.logFileData,
    this.marker,
    this.additionalDataPending,
  });
  static DownloadDBLogFilePortionDetails fromJson(Map<String, dynamic> json) =>
      DownloadDBLogFilePortionDetails();
}

class Ec2SecurityGroup {
  final String status;

  final String ec2SecurityGroupName;

  final String ec2SecurityGroupId;

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

class Endpoint {
  final String address;

  final int port;

  Endpoint({
    this.address,
    this.port,
  });
  static Endpoint fromJson(Map<String, dynamic> json) => Endpoint();
}

class EngineDefaults {
  final String dbParameterGroupFamily;

  final String marker;

  final List<Parameter> parameters;

  EngineDefaults({
    this.dbParameterGroupFamily,
    this.marker,
    this.parameters,
  });
  static EngineDefaults fromJson(Map<String, dynamic> json) => EngineDefaults();
}

class Event {
  final String sourceIdentifier;

  final String sourceType;

  final String message;

  final List<String> eventCategories;

  final DateTime date;

  Event({
    this.sourceIdentifier,
    this.sourceType,
    this.message,
    this.eventCategories,
    this.date,
  });
  static Event fromJson(Map<String, dynamic> json) => Event();
}

class EventCategoriesMap {
  final String sourceType;

  final List<String> eventCategories;

  EventCategoriesMap({
    this.sourceType,
    this.eventCategories,
  });
  static EventCategoriesMap fromJson(Map<String, dynamic> json) =>
      EventCategoriesMap();
}

class EventCategoriesMessage {
  final List<EventCategoriesMap> eventCategoriesMapList;

  EventCategoriesMessage({
    this.eventCategoriesMapList,
  });
  static EventCategoriesMessage fromJson(Map<String, dynamic> json) =>
      EventCategoriesMessage();
}

class EventSubscription {
  final String customerAwsId;

  final String custSubscriptionId;

  final String snsTopicArn;

  final String status;

  final String subscriptionCreationTime;

  final String sourceType;

  final List<String> sourceIdsList;

  final List<String> eventCategoriesList;

  final bool enabled;

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
  });
  static EventSubscription fromJson(Map<String, dynamic> json) =>
      EventSubscription();
}

class EventSubscriptionsMessage {
  final String marker;

  final List<EventSubscription> eventSubscriptionsList;

  EventSubscriptionsMessage({
    this.marker,
    this.eventSubscriptionsList,
  });
  static EventSubscriptionsMessage fromJson(Map<String, dynamic> json) =>
      EventSubscriptionsMessage();
}

class EventsMessage {
  final String marker;

  final List<Event> events;

  EventsMessage({
    this.marker,
    this.events,
  });
  static EventsMessage fromJson(Map<String, dynamic> json) => EventsMessage();
}

class Filter {
  final String name;

  final List<String> values;

  Filter({
    @required this.name,
    @required this.values,
  });
}

class IPRange {
  final String status;

  final String cidrip;

  IPRange({
    this.status,
    this.cidrip,
  });
  static IPRange fromJson(Map<String, dynamic> json) => IPRange();
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

class ModifyEventSubscriptionResult {
  final EventSubscription eventSubscription;

  ModifyEventSubscriptionResult({
    this.eventSubscription,
  });
  static ModifyEventSubscriptionResult fromJson(Map<String, dynamic> json) =>
      ModifyEventSubscriptionResult();
}

class ModifyOptionGroupResult {
  final OptionGroup optionGroup;

  ModifyOptionGroupResult({
    this.optionGroup,
  });
  static ModifyOptionGroupResult fromJson(Map<String, dynamic> json) =>
      ModifyOptionGroupResult();
}

class Option {
  final String optionName;

  final String optionDescription;

  final bool persistent;

  final bool permanent;

  final int port;

  final List<OptionSetting> optionSettings;

  final List<DBSecurityGroupMembership> dbSecurityGroupMemberships;

  final List<VpcSecurityGroupMembership> vpcSecurityGroupMemberships;

  Option({
    this.optionName,
    this.optionDescription,
    this.persistent,
    this.permanent,
    this.port,
    this.optionSettings,
    this.dbSecurityGroupMemberships,
    this.vpcSecurityGroupMemberships,
  });
  static Option fromJson(Map<String, dynamic> json) => Option();
}

class OptionConfiguration {
  final String optionName;

  final int port;

  final List<String> dbSecurityGroupMemberships;

  final List<String> vpcSecurityGroupMemberships;

  final List<OptionSetting> optionSettings;

  OptionConfiguration({
    @required this.optionName,
    this.port,
    this.dbSecurityGroupMemberships,
    this.vpcSecurityGroupMemberships,
    this.optionSettings,
  });
}

class OptionGroup {
  final String optionGroupName;

  final String optionGroupDescription;

  final String engineName;

  final String majorEngineVersion;

  final List<Option> options;

  final bool allowsVpcAndNonVpcInstanceMemberships;

  final String vpcId;

  OptionGroup({
    this.optionGroupName,
    this.optionGroupDescription,
    this.engineName,
    this.majorEngineVersion,
    this.options,
    this.allowsVpcAndNonVpcInstanceMemberships,
    this.vpcId,
  });
  static OptionGroup fromJson(Map<String, dynamic> json) => OptionGroup();
}

class OptionGroupMembership {
  final String optionGroupName;

  final String status;

  OptionGroupMembership({
    this.optionGroupName,
    this.status,
  });
  static OptionGroupMembership fromJson(Map<String, dynamic> json) =>
      OptionGroupMembership();
}

class OptionGroupOption {
  final String name;

  final String description;

  final String engineName;

  final String majorEngineVersion;

  final String minimumRequiredMinorEngineVersion;

  final bool portRequired;

  final int defaultPort;

  final List<String> optionsDependedOn;

  final bool persistent;

  final bool permanent;

  final List<OptionGroupOptionSetting> optionGroupOptionSettings;

  OptionGroupOption({
    this.name,
    this.description,
    this.engineName,
    this.majorEngineVersion,
    this.minimumRequiredMinorEngineVersion,
    this.portRequired,
    this.defaultPort,
    this.optionsDependedOn,
    this.persistent,
    this.permanent,
    this.optionGroupOptionSettings,
  });
  static OptionGroupOption fromJson(Map<String, dynamic> json) =>
      OptionGroupOption();
}

class OptionGroupOptionSetting {
  final String settingName;

  final String settingDescription;

  final String defaultValue;

  final String applyType;

  final String allowedValues;

  final bool isModifiable;

  OptionGroupOptionSetting({
    this.settingName,
    this.settingDescription,
    this.defaultValue,
    this.applyType,
    this.allowedValues,
    this.isModifiable,
  });
  static OptionGroupOptionSetting fromJson(Map<String, dynamic> json) =>
      OptionGroupOptionSetting();
}

class OptionGroupOptionsMessage {
  final List<OptionGroupOption> optionGroupOptions;

  final String marker;

  OptionGroupOptionsMessage({
    this.optionGroupOptions,
    this.marker,
  });
  static OptionGroupOptionsMessage fromJson(Map<String, dynamic> json) =>
      OptionGroupOptionsMessage();
}

class OptionGroups {
  final List<OptionGroup> optionGroupsList;

  final String marker;

  OptionGroups({
    this.optionGroupsList,
    this.marker,
  });
  static OptionGroups fromJson(Map<String, dynamic> json) => OptionGroups();
}

class OptionSetting {
  final String name;

  final String value;

  final String defaultValue;

  final String description;

  final String applyType;

  final String dataType;

  final String allowedValues;

  final bool isModifiable;

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

class OrderableDBInstanceOption {
  final String engine;

  final String engineVersion;

  final String dbInstanceClass;

  final String licenseModel;

  final List<AvailabilityZone> availabilityZones;

  final bool multiAZCapable;

  final bool readReplicaCapable;

  final bool vpc;

  OrderableDBInstanceOption({
    this.engine,
    this.engineVersion,
    this.dbInstanceClass,
    this.licenseModel,
    this.availabilityZones,
    this.multiAZCapable,
    this.readReplicaCapable,
    this.vpc,
  });
  static OrderableDBInstanceOption fromJson(Map<String, dynamic> json) =>
      OrderableDBInstanceOption();
}

class OrderableDBInstanceOptionsMessage {
  final List<OrderableDBInstanceOption> orderableDBInstanceOptions;

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
  final String parameterName;

  final String parameterValue;

  final String description;

  final String source;

  final String applyType;

  final String dataType;

  final String allowedValues;

  final bool isModifiable;

  final String minimumEngineVersion;

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

class PendingModifiedValues {
  final String dbInstanceClass;

  final int allocatedStorage;

  final String masterUserPassword;

  final int port;

  final int backupRetentionPeriod;

  final bool multiAZ;

  final String engineVersion;

  final int iops;

  final String dbInstanceIdentifier;

  PendingModifiedValues({
    this.dbInstanceClass,
    this.allocatedStorage,
    this.masterUserPassword,
    this.port,
    this.backupRetentionPeriod,
    this.multiAZ,
    this.engineVersion,
    this.iops,
    this.dbInstanceIdentifier,
  });
  static PendingModifiedValues fromJson(Map<String, dynamic> json) =>
      PendingModifiedValues();
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

class RebootDBInstanceResult {
  final DBInstance dbInstance;

  RebootDBInstanceResult({
    this.dbInstance,
  });
  static RebootDBInstanceResult fromJson(Map<String, dynamic> json) =>
      RebootDBInstanceResult();
}

class RecurringCharge {
  final double recurringChargeAmount;

  final String recurringChargeFrequency;

  RecurringCharge({
    this.recurringChargeAmount,
    this.recurringChargeFrequency,
  });
  static RecurringCharge fromJson(Map<String, dynamic> json) =>
      RecurringCharge();
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

class ReservedDBInstance {
  final String reservedDBInstanceId;

  final String reservedDBInstancesOfferingId;

  final String dbInstanceClass;

  final DateTime startTime;

  final int duration;

  final double fixedPrice;

  final double usagePrice;

  final String currencyCode;

  final int dbInstanceCount;

  final String productDescription;

  final String offeringType;

  final bool multiAZ;

  final String state;

  final List<RecurringCharge> recurringCharges;

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
  });
  static ReservedDBInstance fromJson(Map<String, dynamic> json) =>
      ReservedDBInstance();
}

class ReservedDBInstanceMessage {
  final String marker;

  final List<ReservedDBInstance> reservedDBInstances;

  ReservedDBInstanceMessage({
    this.marker,
    this.reservedDBInstances,
  });
  static ReservedDBInstanceMessage fromJson(Map<String, dynamic> json) =>
      ReservedDBInstanceMessage();
}

class ReservedDBInstancesOffering {
  final String reservedDBInstancesOfferingId;

  final String dbInstanceClass;

  final int duration;

  final double fixedPrice;

  final double usagePrice;

  final String currencyCode;

  final String productDescription;

  final String offeringType;

  final bool multiAZ;

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

class ReservedDBInstancesOfferingMessage {
  final String marker;

  final List<ReservedDBInstancesOffering> reservedDBInstancesOfferings;

  ReservedDBInstancesOfferingMessage({
    this.marker,
    this.reservedDBInstancesOfferings,
  });
  static ReservedDBInstancesOfferingMessage fromJson(
          Map<String, dynamic> json) =>
      ReservedDBInstancesOfferingMessage();
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

class RestoreDBInstanceToPointInTimeResult {
  final DBInstance dbInstance;

  RestoreDBInstanceToPointInTimeResult({
    this.dbInstance,
  });
  static RestoreDBInstanceToPointInTimeResult fromJson(
          Map<String, dynamic> json) =>
      RestoreDBInstanceToPointInTimeResult();
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

class Subnet {
  final String subnetIdentifier;

  final AvailabilityZone subnetAvailabilityZone;

  final String subnetStatus;

  Subnet({
    this.subnetIdentifier,
    this.subnetAvailabilityZone,
    this.subnetStatus,
  });
  static Subnet fromJson(Map<String, dynamic> json) => Subnet();
}

class Tag {
  final String key;

  final String value;

  Tag({
    this.key,
    this.value,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag();
}

class TagListMessage {
  final List<Tag> tagList;

  TagListMessage({
    this.tagList,
  });
  static TagListMessage fromJson(Map<String, dynamic> json) => TagListMessage();
}

class VpcSecurityGroupMembership {
  final String vpcSecurityGroupId;

  final String status;

  VpcSecurityGroupMembership({
    this.vpcSecurityGroupId,
    this.status,
  });
  static VpcSecurityGroupMembership fromJson(Map<String, dynamic> json) =>
      VpcSecurityGroupMembership();
}
