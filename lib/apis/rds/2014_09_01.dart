import 'package:meta/meta.dart';

class RdsApi {
  final _client;
  RdsApi(client) : _client = client.configured('RDS', serializer: 'query');

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

  Future<void> addTagsToResource(
      {@required String resourceName, @required List<Tag> tags}) async {
    await _client.send('AddTagsToResource', {
      'ResourceName': resourceName,
      'Tags': tags,
    });
  }

  Future<AuthorizeDBSecurityGroupIngressResult> authorizeDBSecurityGroupIngress(
      String dbSecurityGroupName,
      {String cidrip,
      String ec2SecurityGroupName,
      String ec2SecurityGroupId,
      String ec2SecurityGroupOwnerId}) async {
    var response_ = await _client.send('AuthorizeDBSecurityGroupIngress', {
      'DBSecurityGroupName': dbSecurityGroupName,
      if (cidrip != null) 'CIDRIP': cidrip,
      if (ec2SecurityGroupName != null)
        'EC2SecurityGroupName': ec2SecurityGroupName,
      if (ec2SecurityGroupId != null) 'EC2SecurityGroupId': ec2SecurityGroupId,
      if (ec2SecurityGroupOwnerId != null)
        'EC2SecurityGroupOwnerId': ec2SecurityGroupOwnerId,
    });
    return AuthorizeDBSecurityGroupIngressResult.fromJson(response_);
  }

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

  Future<CopyDBSnapshotResult> copyDBSnapshot(
      {@required String sourceDBSnapshotIdentifier,
      @required String targetDBSnapshotIdentifier,
      List<Tag> tags}) async {
    var response_ = await _client.send('CopyDBSnapshot', {
      'SourceDBSnapshotIdentifier': sourceDBSnapshotIdentifier,
      'TargetDBSnapshotIdentifier': targetDBSnapshotIdentifier,
      if (tags != null) 'Tags': tags,
    });
    return CopyDBSnapshotResult.fromJson(response_);
  }

  Future<CopyOptionGroupResult> copyOptionGroup(
      {@required String sourceOptionGroupIdentifier,
      @required String targetOptionGroupIdentifier,
      @required String targetOptionGroupDescription,
      List<Tag> tags}) async {
    var response_ = await _client.send('CopyOptionGroup', {
      'SourceOptionGroupIdentifier': sourceOptionGroupIdentifier,
      'TargetOptionGroupIdentifier': targetOptionGroupIdentifier,
      'TargetOptionGroupDescription': targetOptionGroupDescription,
      if (tags != null) 'Tags': tags,
    });
    return CopyOptionGroupResult.fromJson(response_);
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
      List<Tag> tags,
      String storageType,
      String tdeCredentialArn,
      String tdeCredentialPassword}) async {
    var response_ = await _client.send('CreateDBInstance', {
      if (dbName != null) 'DBName': dbName,
      'DBInstanceIdentifier': dbInstanceIdentifier,
      'AllocatedStorage': allocatedStorage,
      'DBInstanceClass': dbInstanceClass,
      'Engine': engine,
      'MasterUsername': masterUsername,
      'MasterUserPassword': masterUserPassword,
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
      if (storageType != null) 'StorageType': storageType,
      if (tdeCredentialArn != null) 'TdeCredentialArn': tdeCredentialArn,
      if (tdeCredentialPassword != null)
        'TdeCredentialPassword': tdeCredentialPassword,
    });
    return CreateDBInstanceResult.fromJson(response_);
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
      String dbSubnetGroupName,
      String storageType}) async {
    var response_ = await _client.send('CreateDBInstanceReadReplica', {
      'DBInstanceIdentifier': dbInstanceIdentifier,
      'SourceDBInstanceIdentifier': sourceDBInstanceIdentifier,
      if (dbInstanceClass != null) 'DBInstanceClass': dbInstanceClass,
      if (availabilityZone != null) 'AvailabilityZone': availabilityZone,
      if (port != null) 'Port': port,
      if (autoMinorVersionUpgrade != null)
        'AutoMinorVersionUpgrade': autoMinorVersionUpgrade,
      if (iops != null) 'Iops': iops,
      if (optionGroupName != null) 'OptionGroupName': optionGroupName,
      if (publiclyAccessible != null) 'PubliclyAccessible': publiclyAccessible,
      if (tags != null) 'Tags': tags,
      if (dbSubnetGroupName != null) 'DBSubnetGroupName': dbSubnetGroupName,
      if (storageType != null) 'StorageType': storageType,
    });
    return CreateDBInstanceReadReplicaResult.fromJson(response_);
  }

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

  Future<CreateDBSecurityGroupResult> createDBSecurityGroup(
      {@required String dbSecurityGroupName,
      @required String dbSecurityGroupDescription,
      List<Tag> tags}) async {
    var response_ = await _client.send('CreateDBSecurityGroup', {
      'DBSecurityGroupName': dbSecurityGroupName,
      'DBSecurityGroupDescription': dbSecurityGroupDescription,
      if (tags != null) 'Tags': tags,
    });
    return CreateDBSecurityGroupResult.fromJson(response_);
  }

  Future<CreateDBSnapshotResult> createDBSnapshot(
      {@required String dbSnapshotIdentifier,
      @required String dbInstanceIdentifier,
      List<Tag> tags}) async {
    var response_ = await _client.send('CreateDBSnapshot', {
      'DBSnapshotIdentifier': dbSnapshotIdentifier,
      'DBInstanceIdentifier': dbInstanceIdentifier,
      if (tags != null) 'Tags': tags,
    });
    return CreateDBSnapshotResult.fromJson(response_);
  }

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

  Future<CreateOptionGroupResult> createOptionGroup(
      {@required String optionGroupName,
      @required String engineName,
      @required String majorEngineVersion,
      @required String optionGroupDescription,
      List<Tag> tags}) async {
    var response_ = await _client.send('CreateOptionGroup', {
      'OptionGroupName': optionGroupName,
      'EngineName': engineName,
      'MajorEngineVersion': majorEngineVersion,
      'OptionGroupDescription': optionGroupDescription,
      if (tags != null) 'Tags': tags,
    });
    return CreateOptionGroupResult.fromJson(response_);
  }

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

  Future<void> deleteDBParameterGroup(String dbParameterGroupName) async {
    await _client.send('DeleteDBParameterGroup', {
      'DBParameterGroupName': dbParameterGroupName,
    });
  }

  Future<void> deleteDBSecurityGroup(String dbSecurityGroupName) async {
    await _client.send('DeleteDBSecurityGroup', {
      'DBSecurityGroupName': dbSecurityGroupName,
    });
  }

  Future<DeleteDBSnapshotResult> deleteDBSnapshot(
      String dbSnapshotIdentifier) async {
    var response_ = await _client.send('DeleteDBSnapshot', {
      'DBSnapshotIdentifier': dbSnapshotIdentifier,
    });
    return DeleteDBSnapshotResult.fromJson(response_);
  }

  Future<void> deleteDBSubnetGroup(String dbSubnetGroupName) async {
    await _client.send('DeleteDBSubnetGroup', {
      'DBSubnetGroupName': dbSubnetGroupName,
    });
  }

  Future<DeleteEventSubscriptionResult> deleteEventSubscription(
      String subscriptionName) async {
    var response_ = await _client.send('DeleteEventSubscription', {
      'SubscriptionName': subscriptionName,
    });
    return DeleteEventSubscriptionResult.fromJson(response_);
  }

  Future<void> deleteOptionGroup(String optionGroupName) async {
    await _client.send('DeleteOptionGroup', {
      'OptionGroupName': optionGroupName,
    });
  }

  Future<DBEngineVersionMessage> describeDBEngineVersions(
      {String engine,
      String engineVersion,
      String dbParameterGroupFamily,
      List<Filter> filters,
      int maxRecords,
      String marker,
      bool defaultOnly,
      bool listSupportedCharacterSets}) async {
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
    });
    return DBEngineVersionMessage.fromJson(response_);
  }

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

  Future<DescribeDBLogFilesResponse> describeDBLogFiles(
      String dbInstanceIdentifier,
      {String filenameContains,
      BigInt fileLastWritten,
      BigInt fileSize,
      List<Filter> filters,
      int maxRecords,
      String marker}) async {
    var response_ = await _client.send('DescribeDBLogFiles', {
      'DBInstanceIdentifier': dbInstanceIdentifier,
      if (filenameContains != null) 'FilenameContains': filenameContains,
      if (fileLastWritten != null) 'FileLastWritten': fileLastWritten,
      if (fileSize != null) 'FileSize': fileSize,
      if (filters != null) 'Filters': filters,
      if (maxRecords != null) 'MaxRecords': maxRecords,
      if (marker != null) 'Marker': marker,
    });
    return DescribeDBLogFilesResponse.fromJson(response_);
  }

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

  Future<DBSecurityGroupMessage> describeDBSecurityGroups(
      {String dbSecurityGroupName,
      List<Filter> filters,
      int maxRecords,
      String marker}) async {
    var response_ = await _client.send('DescribeDBSecurityGroups', {
      if (dbSecurityGroupName != null)
        'DBSecurityGroupName': dbSecurityGroupName,
      if (filters != null) 'Filters': filters,
      if (maxRecords != null) 'MaxRecords': maxRecords,
      if (marker != null) 'Marker': marker,
    });
    return DBSecurityGroupMessage.fromJson(response_);
  }

  Future<DBSnapshotMessage> describeDBSnapshots(
      {String dbInstanceIdentifier,
      String dbSnapshotIdentifier,
      String snapshotType,
      List<Filter> filters,
      int maxRecords,
      String marker}) async {
    var response_ = await _client.send('DescribeDBSnapshots', {
      if (dbInstanceIdentifier != null)
        'DBInstanceIdentifier': dbInstanceIdentifier,
      if (dbSnapshotIdentifier != null)
        'DBSnapshotIdentifier': dbSnapshotIdentifier,
      if (snapshotType != null) 'SnapshotType': snapshotType,
      if (filters != null) 'Filters': filters,
      if (maxRecords != null) 'MaxRecords': maxRecords,
      if (marker != null) 'Marker': marker,
    });
    return DBSnapshotMessage.fromJson(response_);
  }

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

  Future<EventCategoriesMessage> describeEventCategories(
      {String sourceType, List<Filter> filters}) async {
    var response_ = await _client.send('DescribeEventCategories', {
      if (sourceType != null) 'SourceType': sourceType,
      if (filters != null) 'Filters': filters,
    });
    return EventCategoriesMessage.fromJson(response_);
  }

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

  Future<OptionGroupOptionsMessage> describeOptionGroupOptions(
      String engineName,
      {String majorEngineVersion,
      List<Filter> filters,
      int maxRecords,
      String marker}) async {
    var response_ = await _client.send('DescribeOptionGroupOptions', {
      'EngineName': engineName,
      if (majorEngineVersion != null) 'MajorEngineVersion': majorEngineVersion,
      if (filters != null) 'Filters': filters,
      if (maxRecords != null) 'MaxRecords': maxRecords,
      if (marker != null) 'Marker': marker,
    });
    return OptionGroupOptionsMessage.fromJson(response_);
  }

  Future<OptionGroups> describeOptionGroups(
      {String optionGroupName,
      List<Filter> filters,
      String marker,
      int maxRecords,
      String engineName,
      String majorEngineVersion}) async {
    var response_ = await _client.send('DescribeOptionGroups', {
      if (optionGroupName != null) 'OptionGroupName': optionGroupName,
      if (filters != null) 'Filters': filters,
      if (marker != null) 'Marker': marker,
      if (maxRecords != null) 'MaxRecords': maxRecords,
      if (engineName != null) 'EngineName': engineName,
      if (majorEngineVersion != null) 'MajorEngineVersion': majorEngineVersion,
    });
    return OptionGroups.fromJson(response_);
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
    var response_ = await _client.send('DescribeReservedDBInstances', {
      if (reservedDBInstanceId != null)
        'ReservedDBInstanceId': reservedDBInstanceId,
      if (reservedDBInstancesOfferingId != null)
        'ReservedDBInstancesOfferingId': reservedDBInstancesOfferingId,
      if (dbInstanceClass != null) 'DBInstanceClass': dbInstanceClass,
      if (duration != null) 'Duration': duration,
      if (productDescription != null) 'ProductDescription': productDescription,
      if (offeringType != null) 'OfferingType': offeringType,
      if (multiAZ != null) 'MultiAZ': multiAZ,
      if (filters != null) 'Filters': filters,
      if (maxRecords != null) 'MaxRecords': maxRecords,
      if (marker != null) 'Marker': marker,
    });
    return ReservedDBInstanceMessage.fromJson(response_);
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
    var response_ = await _client.send('DescribeReservedDBInstancesOfferings', {
      if (reservedDBInstancesOfferingId != null)
        'ReservedDBInstancesOfferingId': reservedDBInstancesOfferingId,
      if (dbInstanceClass != null) 'DBInstanceClass': dbInstanceClass,
      if (duration != null) 'Duration': duration,
      if (productDescription != null) 'ProductDescription': productDescription,
      if (offeringType != null) 'OfferingType': offeringType,
      if (multiAZ != null) 'MultiAZ': multiAZ,
      if (filters != null) 'Filters': filters,
      if (maxRecords != null) 'MaxRecords': maxRecords,
      if (marker != null) 'Marker': marker,
    });
    return ReservedDBInstancesOfferingMessage.fromJson(response_);
  }

  Future<DownloadDBLogFilePortionDetails> downloadDBLogFilePortion(
      {@required String dbInstanceIdentifier,
      @required String logFileName,
      String marker,
      int numberOfLines}) async {
    var response_ = await _client.send('DownloadDBLogFilePortion', {
      'DBInstanceIdentifier': dbInstanceIdentifier,
      'LogFileName': logFileName,
      if (marker != null) 'Marker': marker,
      if (numberOfLines != null) 'NumberOfLines': numberOfLines,
    });
    return DownloadDBLogFilePortionDetails.fromJson(response_);
  }

  Future<TagListMessage> listTagsForResource(String resourceName,
      {List<Filter> filters}) async {
    var response_ = await _client.send('ListTagsForResource', {
      'ResourceName': resourceName,
      if (filters != null) 'Filters': filters,
    });
    return TagListMessage.fromJson(response_);
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
      String newDBInstanceIdentifier,
      String storageType,
      String tdeCredentialArn,
      String tdeCredentialPassword}) async {
    var response_ = await _client.send('ModifyDBInstance', {
      'DBInstanceIdentifier': dbInstanceIdentifier,
      if (allocatedStorage != null) 'AllocatedStorage': allocatedStorage,
      if (dbInstanceClass != null) 'DBInstanceClass': dbInstanceClass,
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
      if (iops != null) 'Iops': iops,
      if (optionGroupName != null) 'OptionGroupName': optionGroupName,
      if (newDBInstanceIdentifier != null)
        'NewDBInstanceIdentifier': newDBInstanceIdentifier,
      if (storageType != null) 'StorageType': storageType,
      if (tdeCredentialArn != null) 'TdeCredentialArn': tdeCredentialArn,
      if (tdeCredentialPassword != null)
        'TdeCredentialPassword': tdeCredentialPassword,
    });
    return ModifyDBInstanceResult.fromJson(response_);
  }

  Future<DBParameterGroupNameMessage> modifyDBParameterGroup(
      {@required String dbParameterGroupName,
      @required List<Parameter> parameters}) async {
    var response_ = await _client.send('ModifyDBParameterGroup', {
      'DBParameterGroupName': dbParameterGroupName,
      'Parameters': parameters,
    });
    return DBParameterGroupNameMessage.fromJson(response_);
  }

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

  Future<ModifyOptionGroupResult> modifyOptionGroup(String optionGroupName,
      {List<OptionConfiguration> optionsToInclude,
      List<String> optionsToRemove,
      bool applyImmediately}) async {
    var response_ = await _client.send('ModifyOptionGroup', {
      'OptionGroupName': optionGroupName,
      if (optionsToInclude != null) 'OptionsToInclude': optionsToInclude,
      if (optionsToRemove != null) 'OptionsToRemove': optionsToRemove,
      if (applyImmediately != null) 'ApplyImmediately': applyImmediately,
    });
    return ModifyOptionGroupResult.fromJson(response_);
  }

  Future<PromoteReadReplicaResult> promoteReadReplica(
      String dbInstanceIdentifier,
      {int backupRetentionPeriod,
      String preferredBackupWindow}) async {
    var response_ = await _client.send('PromoteReadReplica', {
      'DBInstanceIdentifier': dbInstanceIdentifier,
      if (backupRetentionPeriod != null)
        'BackupRetentionPeriod': backupRetentionPeriod,
      if (preferredBackupWindow != null)
        'PreferredBackupWindow': preferredBackupWindow,
    });
    return PromoteReadReplicaResult.fromJson(response_);
  }

  Future<PurchaseReservedDBInstancesOfferingResult>
      purchaseReservedDBInstancesOffering(String reservedDBInstancesOfferingId,
          {String reservedDBInstanceId,
          int dbInstanceCount,
          List<Tag> tags}) async {
    var response_ = await _client.send('PurchaseReservedDBInstancesOffering', {
      'ReservedDBInstancesOfferingId': reservedDBInstancesOfferingId,
      if (reservedDBInstanceId != null)
        'ReservedDBInstanceId': reservedDBInstanceId,
      if (dbInstanceCount != null) 'DBInstanceCount': dbInstanceCount,
      if (tags != null) 'Tags': tags,
    });
    return PurchaseReservedDBInstancesOfferingResult.fromJson(response_);
  }

  Future<RebootDBInstanceResult> rebootDBInstance(String dbInstanceIdentifier,
      {bool forceFailover}) async {
    var response_ = await _client.send('RebootDBInstance', {
      'DBInstanceIdentifier': dbInstanceIdentifier,
      if (forceFailover != null) 'ForceFailover': forceFailover,
    });
    return RebootDBInstanceResult.fromJson(response_);
  }

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

  Future<void> removeTagsFromResource(
      {@required String resourceName, @required List<String> tagKeys}) async {
    await _client.send('RemoveTagsFromResource', {
      'ResourceName': resourceName,
      'TagKeys': tagKeys,
    });
  }

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
      String tdeCredentialPassword}) async {
    var response_ = await _client.send('RestoreDBInstanceFromDBSnapshot', {
      'DBInstanceIdentifier': dbInstanceIdentifier,
      'DBSnapshotIdentifier': dbSnapshotIdentifier,
      if (dbInstanceClass != null) 'DBInstanceClass': dbInstanceClass,
      if (port != null) 'Port': port,
      if (availabilityZone != null) 'AvailabilityZone': availabilityZone,
      if (dbSubnetGroupName != null) 'DBSubnetGroupName': dbSubnetGroupName,
      if (multiAZ != null) 'MultiAZ': multiAZ,
      if (publiclyAccessible != null) 'PubliclyAccessible': publiclyAccessible,
      if (autoMinorVersionUpgrade != null)
        'AutoMinorVersionUpgrade': autoMinorVersionUpgrade,
      if (licenseModel != null) 'LicenseModel': licenseModel,
      if (dbName != null) 'DBName': dbName,
      if (engine != null) 'Engine': engine,
      if (iops != null) 'Iops': iops,
      if (optionGroupName != null) 'OptionGroupName': optionGroupName,
      if (tags != null) 'Tags': tags,
      if (storageType != null) 'StorageType': storageType,
      if (tdeCredentialArn != null) 'TdeCredentialArn': tdeCredentialArn,
      if (tdeCredentialPassword != null)
        'TdeCredentialPassword': tdeCredentialPassword,
    });
    return RestoreDBInstanceFromDBSnapshotResult.fromJson(response_);
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
      List<Tag> tags,
      String storageType,
      String tdeCredentialArn,
      String tdeCredentialPassword}) async {
    var response_ = await _client.send('RestoreDBInstanceToPointInTime', {
      'SourceDBInstanceIdentifier': sourceDBInstanceIdentifier,
      'TargetDBInstanceIdentifier': targetDBInstanceIdentifier,
      if (restoreTime != null) 'RestoreTime': restoreTime,
      if (useLatestRestorableTime != null)
        'UseLatestRestorableTime': useLatestRestorableTime,
      if (dbInstanceClass != null) 'DBInstanceClass': dbInstanceClass,
      if (port != null) 'Port': port,
      if (availabilityZone != null) 'AvailabilityZone': availabilityZone,
      if (dbSubnetGroupName != null) 'DBSubnetGroupName': dbSubnetGroupName,
      if (multiAZ != null) 'MultiAZ': multiAZ,
      if (publiclyAccessible != null) 'PubliclyAccessible': publiclyAccessible,
      if (autoMinorVersionUpgrade != null)
        'AutoMinorVersionUpgrade': autoMinorVersionUpgrade,
      if (licenseModel != null) 'LicenseModel': licenseModel,
      if (dbName != null) 'DBName': dbName,
      if (engine != null) 'Engine': engine,
      if (iops != null) 'Iops': iops,
      if (optionGroupName != null) 'OptionGroupName': optionGroupName,
      if (tags != null) 'Tags': tags,
      if (storageType != null) 'StorageType': storageType,
      if (tdeCredentialArn != null) 'TdeCredentialArn': tdeCredentialArn,
      if (tdeCredentialPassword != null)
        'TdeCredentialPassword': tdeCredentialPassword,
    });
    return RestoreDBInstanceToPointInTimeResult.fromJson(response_);
  }

  Future<RevokeDBSecurityGroupIngressResult> revokeDBSecurityGroupIngress(
      String dbSecurityGroupName,
      {String cidrip,
      String ec2SecurityGroupName,
      String ec2SecurityGroupId,
      String ec2SecurityGroupOwnerId}) async {
    var response_ = await _client.send('RevokeDBSecurityGroupIngress', {
      'DBSecurityGroupName': dbSecurityGroupName,
      if (cidrip != null) 'CIDRIP': cidrip,
      if (ec2SecurityGroupName != null)
        'EC2SecurityGroupName': ec2SecurityGroupName,
      if (ec2SecurityGroupId != null) 'EC2SecurityGroupId': ec2SecurityGroupId,
      if (ec2SecurityGroupOwnerId != null)
        'EC2SecurityGroupOwnerId': ec2SecurityGroupOwnerId,
    });
    return RevokeDBSecurityGroupIngressResult.fromJson(response_);
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

class AuthorizeDBSecurityGroupIngressResult {
  final DBSecurityGroup dbSecurityGroup;

  AuthorizeDBSecurityGroupIngressResult({
    this.dbSecurityGroup,
  });
  static AuthorizeDBSecurityGroupIngressResult fromJson(
          Map<String, dynamic> json) =>
      AuthorizeDBSecurityGroupIngressResult(
        dbSecurityGroup: json.containsKey('DBSecurityGroup')
            ? DBSecurityGroup.fromJson(json['DBSecurityGroup'])
            : null,
      );
}

class AvailabilityZone {
  final String name;

  AvailabilityZone({
    this.name,
  });
  static AvailabilityZone fromJson(Map<String, dynamic> json) =>
      AvailabilityZone(
        name: json.containsKey('Name') ? json['Name'] as String : null,
      );
}

class CharacterSet {
  final String characterSetName;

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

class CopyDBSnapshotResult {
  final DBSnapshot dbSnapshot;

  CopyDBSnapshotResult({
    this.dbSnapshot,
  });
  static CopyDBSnapshotResult fromJson(Map<String, dynamic> json) =>
      CopyDBSnapshotResult(
        dbSnapshot: json.containsKey('DBSnapshot')
            ? DBSnapshot.fromJson(json['DBSnapshot'])
            : null,
      );
}

class CopyOptionGroupResult {
  final OptionGroup optionGroup;

  CopyOptionGroupResult({
    this.optionGroup,
  });
  static CopyOptionGroupResult fromJson(Map<String, dynamic> json) =>
      CopyOptionGroupResult(
        optionGroup: json.containsKey('OptionGroup')
            ? OptionGroup.fromJson(json['OptionGroup'])
            : null,
      );
}

class CreateDBInstanceReadReplicaResult {
  final DBInstance dbInstance;

  CreateDBInstanceReadReplicaResult({
    this.dbInstance,
  });
  static CreateDBInstanceReadReplicaResult fromJson(
          Map<String, dynamic> json) =>
      CreateDBInstanceReadReplicaResult(
        dbInstance: json.containsKey('DBInstance')
            ? DBInstance.fromJson(json['DBInstance'])
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

class CreateDBSecurityGroupResult {
  final DBSecurityGroup dbSecurityGroup;

  CreateDBSecurityGroupResult({
    this.dbSecurityGroup,
  });
  static CreateDBSecurityGroupResult fromJson(Map<String, dynamic> json) =>
      CreateDBSecurityGroupResult(
        dbSecurityGroup: json.containsKey('DBSecurityGroup')
            ? DBSecurityGroup.fromJson(json['DBSecurityGroup'])
            : null,
      );
}

class CreateDBSnapshotResult {
  final DBSnapshot dbSnapshot;

  CreateDBSnapshotResult({
    this.dbSnapshot,
  });
  static CreateDBSnapshotResult fromJson(Map<String, dynamic> json) =>
      CreateDBSnapshotResult(
        dbSnapshot: json.containsKey('DBSnapshot')
            ? DBSnapshot.fromJson(json['DBSnapshot'])
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

class CreateOptionGroupResult {
  final OptionGroup optionGroup;

  CreateOptionGroupResult({
    this.optionGroup,
  });
  static CreateOptionGroupResult fromJson(Map<String, dynamic> json) =>
      CreateOptionGroupResult(
        optionGroup: json.containsKey('OptionGroup')
            ? OptionGroup.fromJson(json['OptionGroup'])
            : null,
      );
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
      );
}

class DBEngineVersionMessage {
  final String marker;

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

  final String storageType;

  final String tdeCredentialArn;

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
    this.storageType,
    this.tdeCredentialArn,
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
      );
}

class DBInstanceMessage {
  final String marker;

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
      DBInstanceStatusInfo(
        statusType: json.containsKey('StatusType')
            ? json['StatusType'] as String
            : null,
        normal: json.containsKey('Normal') ? json['Normal'] as bool : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        message: json.containsKey('Message') ? json['Message'] as String : null,
      );
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
      );
}

class DBParameterGroupDetails {
  final List<Parameter> parameters;

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

class DBParameterGroupStatus {
  final String dbParameterGroupName;

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
  final String marker;

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
  static DBSecurityGroup fromJson(Map<String, dynamic> json) => DBSecurityGroup(
        ownerId: json.containsKey('OwnerId') ? json['OwnerId'] as String : null,
        dbSecurityGroupName: json.containsKey('DBSecurityGroupName')
            ? json['DBSecurityGroupName'] as String
            : null,
        dbSecurityGroupDescription:
            json.containsKey('DBSecurityGroupDescription')
                ? json['DBSecurityGroupDescription'] as String
                : null,
        vpcId: json.containsKey('VpcId') ? json['VpcId'] as String : null,
        ec2SecurityGroups: json.containsKey('EC2SecurityGroups')
            ? (json['EC2SecurityGroups'] as List)
                .map((e) => Ec2SecurityGroup.fromJson(e))
                .toList()
            : null,
        ipRanges: json.containsKey('IPRanges')
            ? (json['IPRanges'] as List)
                .map((e) => IPRange.fromJson(e))
                .toList()
            : null,
      );
}

class DBSecurityGroupMembership {
  final String dbSecurityGroupName;

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

class DBSecurityGroupMessage {
  final String marker;

  final List<DBSecurityGroup> dbSecurityGroups;

  DBSecurityGroupMessage({
    this.marker,
    this.dbSecurityGroups,
  });
  static DBSecurityGroupMessage fromJson(Map<String, dynamic> json) =>
      DBSecurityGroupMessage(
        marker: json.containsKey('Marker') ? json['Marker'] as String : null,
        dbSecurityGroups: json.containsKey('DBSecurityGroups')
            ? (json['DBSecurityGroups'] as List)
                .map((e) => DBSecurityGroup.fromJson(e))
                .toList()
            : null,
      );
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

  final String storageType;

  final String tdeCredentialArn;

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
    this.storageType,
    this.tdeCredentialArn,
  });
  static DBSnapshot fromJson(Map<String, dynamic> json) => DBSnapshot(
        dbSnapshotIdentifier: json.containsKey('DBSnapshotIdentifier')
            ? json['DBSnapshotIdentifier'] as String
            : null,
        dbInstanceIdentifier: json.containsKey('DBInstanceIdentifier')
            ? json['DBInstanceIdentifier'] as String
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
        availabilityZone: json.containsKey('AvailabilityZone')
            ? json['AvailabilityZone'] as String
            : null,
        vpcId: json.containsKey('VpcId') ? json['VpcId'] as String : null,
        instanceCreateTime: json.containsKey('InstanceCreateTime')
            ? DateTime.parse(json['InstanceCreateTime'])
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
        iops: json.containsKey('Iops') ? json['Iops'] as int : null,
        optionGroupName: json.containsKey('OptionGroupName')
            ? json['OptionGroupName'] as String
            : null,
        percentProgress: json.containsKey('PercentProgress')
            ? json['PercentProgress'] as int
            : null,
        sourceRegion: json.containsKey('SourceRegion')
            ? json['SourceRegion'] as String
            : null,
        storageType: json.containsKey('StorageType')
            ? json['StorageType'] as String
            : null,
        tdeCredentialArn: json.containsKey('TdeCredentialArn')
            ? json['TdeCredentialArn'] as String
            : null,
      );
}

class DBSnapshotMessage {
  final String marker;

  final List<DBSnapshot> dbSnapshots;

  DBSnapshotMessage({
    this.marker,
    this.dbSnapshots,
  });
  static DBSnapshotMessage fromJson(Map<String, dynamic> json) =>
      DBSnapshotMessage(
        marker: json.containsKey('Marker') ? json['Marker'] as String : null,
        dbSnapshots: json.containsKey('DBSnapshots')
            ? (json['DBSnapshots'] as List)
                .map((e) => DBSnapshot.fromJson(e))
                .toList()
            : null,
      );
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
      );
}

class DBSubnetGroupMessage {
  final String marker;

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

class DeleteDBSnapshotResult {
  final DBSnapshot dbSnapshot;

  DeleteDBSnapshotResult({
    this.dbSnapshot,
  });
  static DeleteDBSnapshotResult fromJson(Map<String, dynamic> json) =>
      DeleteDBSnapshotResult(
        dbSnapshot: json.containsKey('DBSnapshot')
            ? DBSnapshot.fromJson(json['DBSnapshot'])
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
      DescribeDBLogFilesDetails(
        logFileName: json.containsKey('LogFileName')
            ? json['LogFileName'] as String
            : null,
        lastWritten: json.containsKey('LastWritten')
            ? BigInt.from(json['LastWritten'])
            : null,
        size: json.containsKey('Size') ? BigInt.from(json['Size']) : null,
      );
}

class DescribeDBLogFilesResponse {
  final List<DescribeDBLogFilesDetails> describeDBLogFiles;

  final String marker;

  DescribeDBLogFilesResponse({
    this.describeDBLogFiles,
    this.marker,
  });
  static DescribeDBLogFilesResponse fromJson(Map<String, dynamic> json) =>
      DescribeDBLogFilesResponse(
        describeDBLogFiles: json.containsKey('DescribeDBLogFiles')
            ? (json['DescribeDBLogFiles'] as List)
                .map((e) => DescribeDBLogFilesDetails.fromJson(e))
                .toList()
            : null,
        marker: json.containsKey('Marker') ? json['Marker'] as String : null,
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
      DownloadDBLogFilePortionDetails(
        logFileData: json.containsKey('LogFileData')
            ? json['LogFileData'] as String
            : null,
        marker: json.containsKey('Marker') ? json['Marker'] as String : null,
        additionalDataPending: json.containsKey('AdditionalDataPending')
            ? json['AdditionalDataPending'] as bool
            : null,
      );
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
      Ec2SecurityGroup(
        status: json.containsKey('Status') ? json['Status'] as String : null,
        ec2SecurityGroupName: json.containsKey('EC2SecurityGroupName')
            ? json['EC2SecurityGroupName'] as String
            : null,
        ec2SecurityGroupId: json.containsKey('EC2SecurityGroupId')
            ? json['EC2SecurityGroupId'] as String
            : null,
        ec2SecurityGroupOwnerId: json.containsKey('EC2SecurityGroupOwnerId')
            ? json['EC2SecurityGroupOwnerId'] as String
            : null,
      );
}

class Endpoint {
  final String address;

  final int port;

  Endpoint({
    this.address,
    this.port,
  });
  static Endpoint fromJson(Map<String, dynamic> json) => Endpoint(
        address: json.containsKey('Address') ? json['Address'] as String : null,
        port: json.containsKey('Port') ? json['Port'] as int : null,
      );
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
      );
}

class EventCategoriesMap {
  final String sourceType;

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
      );
}

class EventSubscriptionsMessage {
  final String marker;

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
  final String marker;

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

class Filter {
  final String name;

  final List<String> values;

  Filter({
    @required this.name,
    @required this.values,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class IPRange {
  final String status;

  final String cidrip;

  IPRange({
    this.status,
    this.cidrip,
  });
  static IPRange fromJson(Map<String, dynamic> json) => IPRange(
        status: json.containsKey('Status') ? json['Status'] as String : null,
        cidrip: json.containsKey('CIDRIP') ? json['CIDRIP'] as String : null,
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

class ModifyOptionGroupResult {
  final OptionGroup optionGroup;

  ModifyOptionGroupResult({
    this.optionGroup,
  });
  static ModifyOptionGroupResult fromJson(Map<String, dynamic> json) =>
      ModifyOptionGroupResult(
        optionGroup: json.containsKey('OptionGroup')
            ? OptionGroup.fromJson(json['OptionGroup'])
            : null,
      );
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
  static Option fromJson(Map<String, dynamic> json) => Option(
        optionName: json.containsKey('OptionName')
            ? json['OptionName'] as String
            : null,
        optionDescription: json.containsKey('OptionDescription')
            ? json['OptionDescription'] as String
            : null,
        persistent:
            json.containsKey('Persistent') ? json['Persistent'] as bool : null,
        permanent:
            json.containsKey('Permanent') ? json['Permanent'] as bool : null,
        port: json.containsKey('Port') ? json['Port'] as int : null,
        optionSettings: json.containsKey('OptionSettings')
            ? (json['OptionSettings'] as List)
                .map((e) => OptionSetting.fromJson(e))
                .toList()
            : null,
        dbSecurityGroupMemberships:
            json.containsKey('DBSecurityGroupMemberships')
                ? (json['DBSecurityGroupMemberships'] as List)
                    .map((e) => DBSecurityGroupMembership.fromJson(e))
                    .toList()
                : null,
        vpcSecurityGroupMemberships:
            json.containsKey('VpcSecurityGroupMemberships')
                ? (json['VpcSecurityGroupMemberships'] as List)
                    .map((e) => VpcSecurityGroupMembership.fromJson(e))
                    .toList()
                : null,
      );
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
  Map<String, dynamic> toJson() => <String, dynamic>{};
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
  static OptionGroup fromJson(Map<String, dynamic> json) => OptionGroup(
        optionGroupName: json.containsKey('OptionGroupName')
            ? json['OptionGroupName'] as String
            : null,
        optionGroupDescription: json.containsKey('OptionGroupDescription')
            ? json['OptionGroupDescription'] as String
            : null,
        engineName: json.containsKey('EngineName')
            ? json['EngineName'] as String
            : null,
        majorEngineVersion: json.containsKey('MajorEngineVersion')
            ? json['MajorEngineVersion'] as String
            : null,
        options: json.containsKey('Options')
            ? (json['Options'] as List).map((e) => Option.fromJson(e)).toList()
            : null,
        allowsVpcAndNonVpcInstanceMemberships:
            json.containsKey('AllowsVpcAndNonVpcInstanceMemberships')
                ? json['AllowsVpcAndNonVpcInstanceMemberships'] as bool
                : null,
        vpcId: json.containsKey('VpcId') ? json['VpcId'] as String : null,
      );
}

class OptionGroupMembership {
  final String optionGroupName;

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
      OptionGroupOption(
        name: json.containsKey('Name') ? json['Name'] as String : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        engineName: json.containsKey('EngineName')
            ? json['EngineName'] as String
            : null,
        majorEngineVersion: json.containsKey('MajorEngineVersion')
            ? json['MajorEngineVersion'] as String
            : null,
        minimumRequiredMinorEngineVersion:
            json.containsKey('MinimumRequiredMinorEngineVersion')
                ? json['MinimumRequiredMinorEngineVersion'] as String
                : null,
        portRequired: json.containsKey('PortRequired')
            ? json['PortRequired'] as bool
            : null,
        defaultPort:
            json.containsKey('DefaultPort') ? json['DefaultPort'] as int : null,
        optionsDependedOn: json.containsKey('OptionsDependedOn')
            ? (json['OptionsDependedOn'] as List)
                .map((e) => e as String)
                .toList()
            : null,
        persistent:
            json.containsKey('Persistent') ? json['Persistent'] as bool : null,
        permanent:
            json.containsKey('Permanent') ? json['Permanent'] as bool : null,
        optionGroupOptionSettings: json.containsKey('OptionGroupOptionSettings')
            ? (json['OptionGroupOptionSettings'] as List)
                .map((e) => OptionGroupOptionSetting.fromJson(e))
                .toList()
            : null,
      );
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
      OptionGroupOptionSetting(
        settingName: json.containsKey('SettingName')
            ? json['SettingName'] as String
            : null,
        settingDescription: json.containsKey('SettingDescription')
            ? json['SettingDescription'] as String
            : null,
        defaultValue: json.containsKey('DefaultValue')
            ? json['DefaultValue'] as String
            : null,
        applyType:
            json.containsKey('ApplyType') ? json['ApplyType'] as String : null,
        allowedValues: json.containsKey('AllowedValues')
            ? json['AllowedValues'] as String
            : null,
        isModifiable: json.containsKey('IsModifiable')
            ? json['IsModifiable'] as bool
            : null,
      );
}

class OptionGroupOptionsMessage {
  final List<OptionGroupOption> optionGroupOptions;

  final String marker;

  OptionGroupOptionsMessage({
    this.optionGroupOptions,
    this.marker,
  });
  static OptionGroupOptionsMessage fromJson(Map<String, dynamic> json) =>
      OptionGroupOptionsMessage(
        optionGroupOptions: json.containsKey('OptionGroupOptions')
            ? (json['OptionGroupOptions'] as List)
                .map((e) => OptionGroupOption.fromJson(e))
                .toList()
            : null,
        marker: json.containsKey('Marker') ? json['Marker'] as String : null,
      );
}

class OptionGroups {
  final List<OptionGroup> optionGroupsList;

  final String marker;

  OptionGroups({
    this.optionGroupsList,
    this.marker,
  });
  static OptionGroups fromJson(Map<String, dynamic> json) => OptionGroups(
        optionGroupsList: json.containsKey('OptionGroupsList')
            ? (json['OptionGroupsList'] as List)
                .map((e) => OptionGroup.fromJson(e))
                .toList()
            : null,
        marker: json.containsKey('Marker') ? json['Marker'] as String : null,
      );
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
  static OptionSetting fromJson(Map<String, dynamic> json) => OptionSetting(
        name: json.containsKey('Name') ? json['Name'] as String : null,
        value: json.containsKey('Value') ? json['Value'] as String : null,
        defaultValue: json.containsKey('DefaultValue')
            ? json['DefaultValue'] as String
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
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
        isCollection: json.containsKey('IsCollection')
            ? json['IsCollection'] as bool
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
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

  final String storageType;

  final bool supportsIops;

  OrderableDBInstanceOption({
    this.engine,
    this.engineVersion,
    this.dbInstanceClass,
    this.licenseModel,
    this.availabilityZones,
    this.multiAZCapable,
    this.readReplicaCapable,
    this.vpc,
    this.storageType,
    this.supportsIops,
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
        storageType: json.containsKey('StorageType')
            ? json['StorageType'] as String
            : null,
        supportsIops: json.containsKey('SupportsIops')
            ? json['SupportsIops'] as bool
            : null,
      );
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

  final String storageType;

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
    this.storageType,
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
        iops: json.containsKey('Iops') ? json['Iops'] as int : null,
        dbInstanceIdentifier: json.containsKey('DBInstanceIdentifier')
            ? json['DBInstanceIdentifier'] as String
            : null,
        storageType: json.containsKey('StorageType')
            ? json['StorageType'] as String
            : null,
      );
}

class PromoteReadReplicaResult {
  final DBInstance dbInstance;

  PromoteReadReplicaResult({
    this.dbInstance,
  });
  static PromoteReadReplicaResult fromJson(Map<String, dynamic> json) =>
      PromoteReadReplicaResult(
        dbInstance: json.containsKey('DBInstance')
            ? DBInstance.fromJson(json['DBInstance'])
            : null,
      );
}

class PurchaseReservedDBInstancesOfferingResult {
  final ReservedDBInstance reservedDBInstance;

  PurchaseReservedDBInstancesOfferingResult({
    this.reservedDBInstance,
  });
  static PurchaseReservedDBInstancesOfferingResult fromJson(
          Map<String, dynamic> json) =>
      PurchaseReservedDBInstancesOfferingResult(
        reservedDBInstance: json.containsKey('ReservedDBInstance')
            ? ReservedDBInstance.fromJson(json['ReservedDBInstance'])
            : null,
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

class RecurringCharge {
  final double recurringChargeAmount;

  final String recurringChargeFrequency;

  RecurringCharge({
    this.recurringChargeAmount,
    this.recurringChargeFrequency,
  });
  static RecurringCharge fromJson(Map<String, dynamic> json) => RecurringCharge(
        recurringChargeAmount: json.containsKey('RecurringChargeAmount')
            ? json['RecurringChargeAmount'] as double
            : null,
        recurringChargeFrequency: json.containsKey('RecurringChargeFrequency')
            ? json['RecurringChargeFrequency'] as String
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
      ReservedDBInstance(
        reservedDBInstanceId: json.containsKey('ReservedDBInstanceId')
            ? json['ReservedDBInstanceId'] as String
            : null,
        reservedDBInstancesOfferingId:
            json.containsKey('ReservedDBInstancesOfferingId')
                ? json['ReservedDBInstancesOfferingId'] as String
                : null,
        dbInstanceClass: json.containsKey('DBInstanceClass')
            ? json['DBInstanceClass'] as String
            : null,
        startTime: json.containsKey('StartTime')
            ? DateTime.parse(json['StartTime'])
            : null,
        duration: json.containsKey('Duration') ? json['Duration'] as int : null,
        fixedPrice: json.containsKey('FixedPrice')
            ? json['FixedPrice'] as double
            : null,
        usagePrice: json.containsKey('UsagePrice')
            ? json['UsagePrice'] as double
            : null,
        currencyCode: json.containsKey('CurrencyCode')
            ? json['CurrencyCode'] as String
            : null,
        dbInstanceCount: json.containsKey('DBInstanceCount')
            ? json['DBInstanceCount'] as int
            : null,
        productDescription: json.containsKey('ProductDescription')
            ? json['ProductDescription'] as String
            : null,
        offeringType: json.containsKey('OfferingType')
            ? json['OfferingType'] as String
            : null,
        multiAZ: json.containsKey('MultiAZ') ? json['MultiAZ'] as bool : null,
        state: json.containsKey('State') ? json['State'] as String : null,
        recurringCharges: json.containsKey('RecurringCharges')
            ? (json['RecurringCharges'] as List)
                .map((e) => RecurringCharge.fromJson(e))
                .toList()
            : null,
      );
}

class ReservedDBInstanceMessage {
  final String marker;

  final List<ReservedDBInstance> reservedDBInstances;

  ReservedDBInstanceMessage({
    this.marker,
    this.reservedDBInstances,
  });
  static ReservedDBInstanceMessage fromJson(Map<String, dynamic> json) =>
      ReservedDBInstanceMessage(
        marker: json.containsKey('Marker') ? json['Marker'] as String : null,
        reservedDBInstances: json.containsKey('ReservedDBInstances')
            ? (json['ReservedDBInstances'] as List)
                .map((e) => ReservedDBInstance.fromJson(e))
                .toList()
            : null,
      );
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
      ReservedDBInstancesOffering(
        reservedDBInstancesOfferingId:
            json.containsKey('ReservedDBInstancesOfferingId')
                ? json['ReservedDBInstancesOfferingId'] as String
                : null,
        dbInstanceClass: json.containsKey('DBInstanceClass')
            ? json['DBInstanceClass'] as String
            : null,
        duration: json.containsKey('Duration') ? json['Duration'] as int : null,
        fixedPrice: json.containsKey('FixedPrice')
            ? json['FixedPrice'] as double
            : null,
        usagePrice: json.containsKey('UsagePrice')
            ? json['UsagePrice'] as double
            : null,
        currencyCode: json.containsKey('CurrencyCode')
            ? json['CurrencyCode'] as String
            : null,
        productDescription: json.containsKey('ProductDescription')
            ? json['ProductDescription'] as String
            : null,
        offeringType: json.containsKey('OfferingType')
            ? json['OfferingType'] as String
            : null,
        multiAZ: json.containsKey('MultiAZ') ? json['MultiAZ'] as bool : null,
        recurringCharges: json.containsKey('RecurringCharges')
            ? (json['RecurringCharges'] as List)
                .map((e) => RecurringCharge.fromJson(e))
                .toList()
            : null,
      );
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
      ReservedDBInstancesOfferingMessage(
        marker: json.containsKey('Marker') ? json['Marker'] as String : null,
        reservedDBInstancesOfferings:
            json.containsKey('ReservedDBInstancesOfferings')
                ? (json['ReservedDBInstancesOfferings'] as List)
                    .map((e) => ReservedDBInstancesOffering.fromJson(e))
                    .toList()
                : null,
      );
}

class RestoreDBInstanceFromDBSnapshotResult {
  final DBInstance dbInstance;

  RestoreDBInstanceFromDBSnapshotResult({
    this.dbInstance,
  });
  static RestoreDBInstanceFromDBSnapshotResult fromJson(
          Map<String, dynamic> json) =>
      RestoreDBInstanceFromDBSnapshotResult(
        dbInstance: json.containsKey('DBInstance')
            ? DBInstance.fromJson(json['DBInstance'])
            : null,
      );
}

class RestoreDBInstanceToPointInTimeResult {
  final DBInstance dbInstance;

  RestoreDBInstanceToPointInTimeResult({
    this.dbInstance,
  });
  static RestoreDBInstanceToPointInTimeResult fromJson(
          Map<String, dynamic> json) =>
      RestoreDBInstanceToPointInTimeResult(
        dbInstance: json.containsKey('DBInstance')
            ? DBInstance.fromJson(json['DBInstance'])
            : null,
      );
}

class RevokeDBSecurityGroupIngressResult {
  final DBSecurityGroup dbSecurityGroup;

  RevokeDBSecurityGroupIngressResult({
    this.dbSecurityGroup,
  });
  static RevokeDBSecurityGroupIngressResult fromJson(
          Map<String, dynamic> json) =>
      RevokeDBSecurityGroupIngressResult(
        dbSecurityGroup: json.containsKey('DBSecurityGroup')
            ? DBSecurityGroup.fromJson(json['DBSecurityGroup'])
            : null,
      );
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

class Tag {
  final String key;

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

class VpcSecurityGroupMembership {
  final String vpcSecurityGroupId;

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
