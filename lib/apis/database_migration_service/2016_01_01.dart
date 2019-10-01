import 'package:meta/meta.dart';
import 'dart:typed_data';

/// AWS Database Migration Service
///
/// AWS Database Migration Service (AWS DMS) can migrate your data to and from
/// the most widely used commercial and open-source databases such as Oracle,
/// PostgreSQL, Microsoft SQL Server, Amazon Redshift, MariaDB, Amazon Aurora,
/// MySQL, and SAP Adaptive Server Enterprise (ASE). The service supports
/// homogeneous migrations such as Oracle to Oracle, as well as heterogeneous
/// migrations between different database platforms, such as Oracle to MySQL or
/// SQL Server to PostgreSQL.
///
/// For more information about AWS DMS, see
/// [What Is AWS Database Migration Service?](https://docs.aws.amazon.com/dms/latest/userguide/Welcome.html)
/// in the _AWS Database Migration User Guide._
class DatabaseMigrationServiceApi {
  final _client;
  DatabaseMigrationServiceApi(client)
      : _client =
            client.configured('Database Migration Service', serializer: 'json');

  /// Adds metadata tags to an AWS DMS resource, including replication instance,
  /// endpoint, security group, and migration task. These tags can also be used
  /// with cost allocation reporting to track cost associated with DMS
  /// resources, or used in a Condition statement in an IAM policy for DMS.
  ///
  /// [resourceArn]: Identifies the AWS DMS resource to which tags should be
  /// added. The value for this parameter is an Amazon Resource Name (ARN).
  ///
  /// For AWS DMS, you can tag a replication instance, an endpoint, or a
  /// replication task.
  ///
  /// [tags]: One or more tags to be assigned to the resource.
  Future<AddTagsToResourceResponse> addTagsToResource(
      {@required String resourceArn, @required List<Tag> tags}) async {
    var response_ = await _client.send('AddTagsToResource', {
      'ResourceArn': resourceArn,
      'Tags': tags,
    });
    return AddTagsToResourceResponse.fromJson(response_);
  }

  /// Applies a pending maintenance action to a resource (for example, to a
  /// replication instance).
  ///
  /// [replicationInstanceArn]: The Amazon Resource Name (ARN) of the AWS DMS
  /// resource that the pending maintenance action applies to.
  ///
  /// [applyAction]: The pending maintenance action to apply to this resource.
  ///
  /// [optInType]: A value that specifies the type of opt-in request, or undoes
  /// an opt-in request. You can't undo an opt-in request of type `immediate`.
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
  Future<ApplyPendingMaintenanceActionResponse> applyPendingMaintenanceAction(
      {@required String replicationInstanceArn,
      @required String applyAction,
      @required String optInType}) async {
    var response_ = await _client.send('ApplyPendingMaintenanceAction', {
      'ReplicationInstanceArn': replicationInstanceArn,
      'ApplyAction': applyAction,
      'OptInType': optInType,
    });
    return ApplyPendingMaintenanceActionResponse.fromJson(response_);
  }

  /// Creates an endpoint using the provided settings.
  ///
  /// [endpointIdentifier]: The database endpoint identifier. Identifiers must
  /// begin with a letter; must contain only ASCII letters, digits, and hyphens;
  /// and must not end with a hyphen or contain two consecutive hyphens.
  ///
  /// [endpointType]: The type of endpoint. Valid values are `source` and
  /// `target`.
  ///
  /// [engineName]: The type of engine for the endpoint. Valid values, depending
  /// on the `EndpointType` value, include `mysql`, `oracle`, `postgres`,
  /// `mariadb`, `aurora`, `aurora-postgresql`, `redshift`, `s3`, `db2`,
  /// `azuredb`, `sybase`, `dynamodb`, `mongodb`, and `sqlserver`.
  ///
  /// [username]: The user name to be used to log in to the endpoint database.
  ///
  /// [password]: The password to be used to log in to the endpoint database.
  ///
  /// [serverName]: The name of the server where the endpoint database resides.
  ///
  /// [port]: The port used by the endpoint database.
  ///
  /// [databaseName]: The name of the endpoint database.
  ///
  /// [extraConnectionAttributes]: Additional attributes associated with the
  /// connection. Each attribute is specified as a name-value pair associated by
  /// an equal sign (=). Multiple attributes are separated by a semicolon (;)
  /// with no additional white space. For information on the attributes
  /// available for connecting your source or target endpoint, see
  /// [Working with AWS DMS Endpoints](https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Endpoints.html)
  /// in the _AWS Database Migration Service User Guide._
  ///
  /// [kmsKeyId]: An AWS KMS key identifier that is used to encrypt the
  /// connection parameters for the endpoint.
  ///
  /// If you don't specify a value for the `KmsKeyId` parameter, then AWS DMS
  /// uses your default encryption key.
  ///
  /// AWS KMS creates the default encryption key for your AWS account. Your AWS
  /// account has a different default encryption key for each AWS Region.
  ///
  /// [tags]: One or more tags to be assigned to the endpoint.
  ///
  /// [certificateArn]: The Amazon Resource Name (ARN) for the certificate.
  ///
  /// [sslMode]: The Secure Sockets Layer (SSL) mode to use for the SSL
  /// connection. The default is `none`
  ///
  /// [serviceAccessRoleArn]:  The Amazon Resource Name (ARN) for the service
  /// access role that you want to use to create the endpoint.
  ///
  /// [externalTableDefinition]: The external table definition.
  ///
  /// [dynamoDbSettings]: Settings in JSON format for the target Amazon DynamoDB
  /// endpoint. For more information about the available settings, see
  /// [Using Object Mapping to Migrate Data to DynamoDB](https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.DynamoDB.html)
  /// in the _AWS Database Migration Service User Guide._
  ///
  /// [s3Settings]: Settings in JSON format for the target Amazon S3 endpoint.
  /// For more information about the available settings, see
  /// [Extra Connection Attributes When Using Amazon S3 as a Target for AWS DMS](https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.S3.html#CHAP_Target.S3.Configuring)
  /// in the _AWS Database Migration Service User Guide._
  ///
  /// [dmsTransferSettings]: The settings in JSON format for the DMS transfer
  /// type of source endpoint.
  ///
  /// Possible attributes include the following:
  ///
  /// *    `serviceAccessRoleArn` - The IAM role that has permission to access
  /// the Amazon S3 bucket.
  ///
  /// *    `bucketName` - The name of the S3 bucket to use.
  ///
  /// *    `compressionType` - An optional parameter to use GZIP to compress the
  /// target files. To use GZIP, set this value to `NONE` (the default). To keep
  /// the files uncompressed, don't use this value.
  ///
  ///
  /// Shorthand syntax for these attributes is as follows:
  /// `ServiceAccessRoleArn=string,BucketName=string,CompressionType=string`
  ///
  /// JSON syntax for these attributes is as follows: `{ "ServiceAccessRoleArn":
  /// "string", "BucketName": "string", "CompressionType": "none"|"gzip" }`
  ///
  /// [mongoDbSettings]: Settings in JSON format for the source MongoDB
  /// endpoint. For more information about the available settings, see the
  /// configuration properties section in
  /// [Using MongoDB as a Target for AWS Database Migration Service](https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Source.MongoDB.html)
  /// in the _AWS Database Migration Service User Guide._
  ///
  /// [kinesisSettings]: Settings in JSON format for the target Amazon Kinesis
  /// Data Streams endpoint. For more information about the available settings,
  /// see
  /// [Using Object Mapping to Migrate Data to a Kinesis Data Stream](https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.Kinesis.html#CHAP_Target.Kinesis.ObjectMapping)
  /// in the _AWS Database Migration User Guide._
  ///
  /// [elasticsearchSettings]: Settings in JSON format for the target
  /// Elasticsearch endpoint. For more information about the available settings,
  /// see
  /// [Extra Connection Attributes When Using Elasticsearch as a Target for AWS DMS](https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.Elasticsearch.html#CHAP_Target.Elasticsearch.Configuration)
  /// in the _AWS Database Migration User Guide._
  Future<CreateEndpointResponse> createEndpoint(
      {@required String endpointIdentifier,
      @required String endpointType,
      @required String engineName,
      String username,
      String password,
      String serverName,
      int port,
      String databaseName,
      String extraConnectionAttributes,
      String kmsKeyId,
      List<Tag> tags,
      String certificateArn,
      String sslMode,
      String serviceAccessRoleArn,
      String externalTableDefinition,
      DynamoDbSettings dynamoDbSettings,
      S3Settings s3Settings,
      DmsTransferSettings dmsTransferSettings,
      MongoDbSettings mongoDbSettings,
      KinesisSettings kinesisSettings,
      ElasticsearchSettings elasticsearchSettings,
      RedshiftSettings redshiftSettings}) async {
    var response_ = await _client.send('CreateEndpoint', {
      'EndpointIdentifier': endpointIdentifier,
      'EndpointType': endpointType,
      'EngineName': engineName,
      if (username != null) 'Username': username,
      if (password != null) 'Password': password,
      if (serverName != null) 'ServerName': serverName,
      if (port != null) 'Port': port,
      if (databaseName != null) 'DatabaseName': databaseName,
      if (extraConnectionAttributes != null)
        'ExtraConnectionAttributes': extraConnectionAttributes,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (tags != null) 'Tags': tags,
      if (certificateArn != null) 'CertificateArn': certificateArn,
      if (sslMode != null) 'SslMode': sslMode,
      if (serviceAccessRoleArn != null)
        'ServiceAccessRoleArn': serviceAccessRoleArn,
      if (externalTableDefinition != null)
        'ExternalTableDefinition': externalTableDefinition,
      if (dynamoDbSettings != null) 'DynamoDbSettings': dynamoDbSettings,
      if (s3Settings != null) 'S3Settings': s3Settings,
      if (dmsTransferSettings != null)
        'DmsTransferSettings': dmsTransferSettings,
      if (mongoDbSettings != null) 'MongoDbSettings': mongoDbSettings,
      if (kinesisSettings != null) 'KinesisSettings': kinesisSettings,
      if (elasticsearchSettings != null)
        'ElasticsearchSettings': elasticsearchSettings,
      if (redshiftSettings != null) 'RedshiftSettings': redshiftSettings,
    });
    return CreateEndpointResponse.fromJson(response_);
  }

  ///  Creates an AWS DMS event notification subscription.
  ///
  /// You can specify the type of source (`SourceType`) you want to be notified
  /// of, provide a list of AWS DMS source IDs (`SourceIds`) that triggers the
  /// events, and provide a list of event categories (`EventCategories`) for
  /// events you want to be notified of. If you specify both the `SourceType`
  /// and `SourceIds`, such as `SourceType = replication-instance` and
  /// `SourceIdentifier = my-replinstance`, you will be notified of all the
  /// replication instance events for the specified source. If you specify a
  /// `SourceType` but don't specify a `SourceIdentifier`, you receive notice of
  /// the events for that source type for all your AWS DMS sources. If you don't
  /// specify either `SourceType` nor `SourceIdentifier`, you will be notified
  /// of events generated from all AWS DMS sources belonging to your customer
  /// account.
  ///
  /// For more information about AWS DMS events, see
  /// [Working with Events and Notifications](https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Events.html)
  /// in the _AWS Database Migration Service User Guide._
  ///
  /// [subscriptionName]: The name of the AWS DMS event notification
  /// subscription. This name must be less than 255 characters.
  ///
  /// [snsTopicArn]:  The Amazon Resource Name (ARN) of the Amazon SNS topic
  /// created for event notification. The ARN is created by Amazon SNS when you
  /// create a topic and subscribe to it.
  ///
  /// [sourceType]:  The type of AWS DMS resource that generates the events. For
  /// example, if you want to be notified of events generated by a replication
  /// instance, you set this parameter to `replication-instance`. If this value
  /// is not specified, all events are returned.
  ///
  /// Valid values: `replication-instance` | `replication-task`
  ///
  /// [eventCategories]: A list of event categories for a source type that you
  /// want to subscribe to. For more information, see
  /// [Working with Events and Notifications](https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Events.html)
  /// in the _AWS Database Migration Service User Guide._
  ///
  /// [sourceIds]: A list of identifiers for which AWS DMS provides notification
  /// events.
  ///
  /// If you don't specify a value, notifications are provided for all sources.
  ///
  /// If you specify multiple values, they must be of the same type. For
  /// example, if you specify a database instance ID, then all of the other
  /// values must be database instance IDs.
  ///
  /// [enabled]:  A Boolean value; set to `true` to activate the subscription,
  /// or set to `false` to create the subscription but not activate it.
  ///
  /// [tags]: One or more tags to be assigned to the event subscription.
  Future<CreateEventSubscriptionResponse> createEventSubscription(
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
    return CreateEventSubscriptionResponse.fromJson(response_);
  }

  /// Creates the replication instance using the specified parameters.
  ///
  /// [replicationInstanceIdentifier]: The replication instance identifier. This
  /// parameter is stored as a lowercase string.
  ///
  /// Constraints:
  ///
  /// *   Must contain from 1 to 63 alphanumeric characters or hyphens.
  ///
  /// *   First character must be a letter.
  ///
  /// *   Cannot end with a hyphen or contain two consecutive hyphens.
  ///
  ///
  /// Example: `myrepinstance`
  ///
  /// [allocatedStorage]: The amount of storage (in gigabytes) to be initially
  /// allocated for the replication instance.
  ///
  /// [replicationInstanceClass]: The compute and memory capacity of the
  /// replication instance as specified by the replication instance class.
  ///
  ///  Valid Values: `dms.t2.micro | dms.t2.small | dms.t2.medium | dms.t2.large
  /// | dms.c4.large | dms.c4.xlarge | dms.c4.2xlarge | dms.c4.4xlarge`
  ///
  /// [vpcSecurityGroupIds]:  Specifies the VPC security group to be used with
  /// the replication instance. The VPC security group must work with the VPC
  /// containing the replication instance.
  ///
  /// [availabilityZone]: The AWS Availability Zone where the replication
  /// instance will be created. The default value is a random, system-chosen
  /// Availability Zone in the endpoint's AWS Region, for example: `us-east-1d`
  ///
  /// [replicationSubnetGroupIdentifier]: A subnet group to associate with the
  /// replication instance.
  ///
  /// [preferredMaintenanceWindow]: The weekly time range during which system
  /// maintenance can occur, in Universal Coordinated Time (UTC).
  ///
  ///  Format: `ddd:hh24:mi-ddd:hh24:mi`
  ///
  /// Default: A 30-minute window selected at random from an 8-hour block of
  /// time per AWS Region, occurring on a random day of the week.
  ///
  /// Valid Days: Mon, Tue, Wed, Thu, Fri, Sat, Sun
  ///
  /// Constraints: Minimum 30-minute window.
  ///
  /// [multiAZ]:  Specifies whether the replication instance is a Multi-AZ
  /// deployment. You cannot set the `AvailabilityZone` parameter if the
  /// Multi-AZ parameter is set to `true`.
  ///
  /// [engineVersion]: The engine version number of the replication instance.
  ///
  /// [autoMinorVersionUpgrade]: Indicates whether minor engine upgrades will be
  /// applied automatically to the replication instance during the maintenance
  /// window. This parameter defaults to `true`.
  ///
  /// Default: `true`
  ///
  /// [tags]: One or more tags to be assigned to the replication instance.
  ///
  /// [kmsKeyId]: An AWS KMS key identifier that is used to encrypt the data on
  /// the replication instance.
  ///
  /// If you don't specify a value for the `KmsKeyId` parameter, then AWS DMS
  /// uses your default encryption key.
  ///
  /// AWS KMS creates the default encryption key for your AWS account. Your AWS
  /// account has a different default encryption key for each AWS Region.
  ///
  /// [publiclyAccessible]:  Specifies the accessibility options for the
  /// replication instance. A value of `true` represents an instance with a
  /// public IP address. A value of `false` represents an instance with a
  /// private IP address. The default value is `true`.
  ///
  /// [dnsNameServers]: A list of DNS name servers supported for the replication
  /// instance.
  Future<CreateReplicationInstanceResponse> createReplicationInstance(
      {@required String replicationInstanceIdentifier,
      int allocatedStorage,
      @required String replicationInstanceClass,
      List<String> vpcSecurityGroupIds,
      String availabilityZone,
      String replicationSubnetGroupIdentifier,
      String preferredMaintenanceWindow,
      bool multiAZ,
      String engineVersion,
      bool autoMinorVersionUpgrade,
      List<Tag> tags,
      String kmsKeyId,
      bool publiclyAccessible,
      String dnsNameServers}) async {
    var response_ = await _client.send('CreateReplicationInstance', {
      'ReplicationInstanceIdentifier': replicationInstanceIdentifier,
      if (allocatedStorage != null) 'AllocatedStorage': allocatedStorage,
      'ReplicationInstanceClass': replicationInstanceClass,
      if (vpcSecurityGroupIds != null)
        'VpcSecurityGroupIds': vpcSecurityGroupIds,
      if (availabilityZone != null) 'AvailabilityZone': availabilityZone,
      if (replicationSubnetGroupIdentifier != null)
        'ReplicationSubnetGroupIdentifier': replicationSubnetGroupIdentifier,
      if (preferredMaintenanceWindow != null)
        'PreferredMaintenanceWindow': preferredMaintenanceWindow,
      if (multiAZ != null) 'MultiAZ': multiAZ,
      if (engineVersion != null) 'EngineVersion': engineVersion,
      if (autoMinorVersionUpgrade != null)
        'AutoMinorVersionUpgrade': autoMinorVersionUpgrade,
      if (tags != null) 'Tags': tags,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (publiclyAccessible != null) 'PubliclyAccessible': publiclyAccessible,
      if (dnsNameServers != null) 'DnsNameServers': dnsNameServers,
    });
    return CreateReplicationInstanceResponse.fromJson(response_);
  }

  /// Creates a replication subnet group given a list of the subnet IDs in a
  /// VPC.
  ///
  /// [replicationSubnetGroupIdentifier]: The name for the replication subnet
  /// group. This value is stored as a lowercase string.
  ///
  /// Constraints: Must contain no more than 255 alphanumeric characters,
  /// periods, spaces, underscores, or hyphens. Must not be "default".
  ///
  /// Example: `mySubnetgroup`
  ///
  /// [replicationSubnetGroupDescription]: The description for the subnet group.
  ///
  /// [subnetIds]: One or more subnet IDs to be assigned to the subnet group.
  ///
  /// [tags]: One or more tags to be assigned to the subnet group.
  Future<CreateReplicationSubnetGroupResponse> createReplicationSubnetGroup(
      {@required String replicationSubnetGroupIdentifier,
      @required String replicationSubnetGroupDescription,
      @required List<String> subnetIds,
      List<Tag> tags}) async {
    var response_ = await _client.send('CreateReplicationSubnetGroup', {
      'ReplicationSubnetGroupIdentifier': replicationSubnetGroupIdentifier,
      'ReplicationSubnetGroupDescription': replicationSubnetGroupDescription,
      'SubnetIds': subnetIds,
      if (tags != null) 'Tags': tags,
    });
    return CreateReplicationSubnetGroupResponse.fromJson(response_);
  }

  /// Creates a replication task using the specified parameters.
  ///
  /// [replicationTaskIdentifier]: An identifier for the replication task.
  ///
  /// Constraints:
  ///
  /// *   Must contain from 1 to 255 alphanumeric characters or hyphens.
  ///
  /// *   First character must be a letter.
  ///
  /// *   Cannot end with a hyphen or contain two consecutive hyphens.
  ///
  /// [sourceEndpointArn]: An Amazon Resource Name (ARN) that uniquely
  /// identifies the source endpoint.
  ///
  /// [targetEndpointArn]: An Amazon Resource Name (ARN) that uniquely
  /// identifies the target endpoint.
  ///
  /// [replicationInstanceArn]: The Amazon Resource Name (ARN) of a replication
  /// instance.
  ///
  /// [migrationType]: The migration type. Valid values: `full-load` | `cdc` |
  /// `full-load-and-cdc`
  ///
  /// [tableMappings]: The table mappings for the task, in JSON format. For more
  /// information, see
  /// [Table Mapping](https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Tasks.CustomizingTasks.TableMapping.html)
  /// in the _AWS Database Migration User Guide._
  ///
  /// [replicationTaskSettings]: Overall settings for the task, in JSON format.
  /// For more information, see
  /// [Task Settings](https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Tasks.CustomizingTasks.TaskSettings.html)
  /// in the _AWS Database Migration User Guide._
  ///
  /// [cdcStartTime]: Indicates the start time for a change data capture (CDC)
  /// operation. Use either CdcStartTime or CdcStartPosition to specify when you
  /// want a CDC operation to start. Specifying both values results in an error.
  ///
  /// Timestamp Example: --cdc-start-time “2018-03-08T12:12:12”
  ///
  /// [cdcStartPosition]: Indicates when you want a change data capture (CDC)
  /// operation to start. Use either CdcStartPosition or CdcStartTime to specify
  /// when you want a CDC operation to start. Specifying both values results in
  /// an error.
  ///
  ///  The value can be in date, checkpoint, or LSN/SCN format.
  ///
  /// Date Example: --cdc-start-position “2018-03-08T12:12:12”
  ///
  /// Checkpoint Example: --cdc-start-position
  /// "checkpoint:V1#27#mysql-bin-changelog.157832:1975:-1:2002:677883278264080:mysql-bin-changelog.157832:1876#0#0#*#0#93"
  ///
  /// LSN Example: --cdc-start-position “mysql-bin-changelog.000024:373”
  ///
  /// [cdcStopPosition]: Indicates when you want a change data capture (CDC)
  /// operation to stop. The value can be either server time or commit time.
  ///
  /// Server time example: --cdc-stop-position “server_time:3018-02-09T12:12:12”
  ///
  /// Commit time example: --cdc-stop-position “commit_time: 3018-02-09T12:12:12
  /// “
  ///
  /// [tags]: One or more tags to be assigned to the replication task.
  Future<CreateReplicationTaskResponse> createReplicationTask(
      {@required String replicationTaskIdentifier,
      @required String sourceEndpointArn,
      @required String targetEndpointArn,
      @required String replicationInstanceArn,
      @required String migrationType,
      @required String tableMappings,
      String replicationTaskSettings,
      DateTime cdcStartTime,
      String cdcStartPosition,
      String cdcStopPosition,
      List<Tag> tags}) async {
    var response_ = await _client.send('CreateReplicationTask', {
      'ReplicationTaskIdentifier': replicationTaskIdentifier,
      'SourceEndpointArn': sourceEndpointArn,
      'TargetEndpointArn': targetEndpointArn,
      'ReplicationInstanceArn': replicationInstanceArn,
      'MigrationType': migrationType,
      'TableMappings': tableMappings,
      if (replicationTaskSettings != null)
        'ReplicationTaskSettings': replicationTaskSettings,
      if (cdcStartTime != null) 'CdcStartTime': cdcStartTime,
      if (cdcStartPosition != null) 'CdcStartPosition': cdcStartPosition,
      if (cdcStopPosition != null) 'CdcStopPosition': cdcStopPosition,
      if (tags != null) 'Tags': tags,
    });
    return CreateReplicationTaskResponse.fromJson(response_);
  }

  /// Deletes the specified certificate.
  ///
  /// [certificateArn]: The Amazon Resource Name (ARN) of the deleted
  /// certificate.
  Future<DeleteCertificateResponse> deleteCertificate(
      String certificateArn) async {
    var response_ = await _client.send('DeleteCertificate', {
      'CertificateArn': certificateArn,
    });
    return DeleteCertificateResponse.fromJson(response_);
  }

  /// Deletes the specified endpoint.
  ///
  ///  All tasks associated with the endpoint must be deleted before you can
  /// delete the endpoint.
  ///
  /// [endpointArn]: The Amazon Resource Name (ARN) string that uniquely
  /// identifies the endpoint.
  Future<DeleteEndpointResponse> deleteEndpoint(String endpointArn) async {
    var response_ = await _client.send('DeleteEndpoint', {
      'EndpointArn': endpointArn,
    });
    return DeleteEndpointResponse.fromJson(response_);
  }

  ///  Deletes an AWS DMS event subscription.
  ///
  /// [subscriptionName]: The name of the DMS event notification subscription to
  /// be deleted.
  Future<DeleteEventSubscriptionResponse> deleteEventSubscription(
      String subscriptionName) async {
    var response_ = await _client.send('DeleteEventSubscription', {
      'SubscriptionName': subscriptionName,
    });
    return DeleteEventSubscriptionResponse.fromJson(response_);
  }

  /// Deletes the specified replication instance.
  ///
  ///  You must delete any migration tasks that are associated with the
  /// replication instance before you can delete it.
  ///
  /// [replicationInstanceArn]: The Amazon Resource Name (ARN) of the
  /// replication instance to be deleted.
  Future<DeleteReplicationInstanceResponse> deleteReplicationInstance(
      String replicationInstanceArn) async {
    var response_ = await _client.send('DeleteReplicationInstance', {
      'ReplicationInstanceArn': replicationInstanceArn,
    });
    return DeleteReplicationInstanceResponse.fromJson(response_);
  }

  /// Deletes a subnet group.
  ///
  /// [replicationSubnetGroupIdentifier]: The subnet group name of the
  /// replication instance.
  Future<DeleteReplicationSubnetGroupResponse> deleteReplicationSubnetGroup(
      String replicationSubnetGroupIdentifier) async {
    var response_ = await _client.send('DeleteReplicationSubnetGroup', {
      'ReplicationSubnetGroupIdentifier': replicationSubnetGroupIdentifier,
    });
    return DeleteReplicationSubnetGroupResponse.fromJson(response_);
  }

  /// Deletes the specified replication task.
  ///
  /// [replicationTaskArn]: The Amazon Resource Name (ARN) of the replication
  /// task to be deleted.
  Future<DeleteReplicationTaskResponse> deleteReplicationTask(
      String replicationTaskArn) async {
    var response_ = await _client.send('DeleteReplicationTask', {
      'ReplicationTaskArn': replicationTaskArn,
    });
    return DeleteReplicationTaskResponse.fromJson(response_);
  }

  /// Lists all of the AWS DMS attributes for a customer account. These
  /// attributes include AWS DMS quotas for the account and a unique account
  /// identifier in a particular DMS region. DMS quotas include a list of
  /// resource quotas supported by the account, such as the number of
  /// replication instances allowed. The description for each resource quota,
  /// includes the quota name, current usage toward that quota, and the quota's
  /// maximum value. DMS uses the unique account identifier to name each
  /// artifact used by DMS in the given region.
  ///
  /// This command does not take any parameters.
  Future<DescribeAccountAttributesResponse> describeAccountAttributes() async {
    var response_ = await _client.send('DescribeAccountAttributes', {});
    return DescribeAccountAttributesResponse.fromJson(response_);
  }

  /// Provides a description of the certificate.
  ///
  /// [filters]: Filters applied to the certificate described in the form of
  /// key-value pairs.
  ///
  /// [maxRecords]:  The maximum number of records to include in the response.
  /// If more records exist than the specified `MaxRecords` value, a pagination
  /// token called a marker is included in the response so that the remaining
  /// results can be retrieved.
  ///
  /// Default: 10
  ///
  /// [marker]:  An optional pagination token provided by a previous request. If
  /// this parameter is specified, the response includes only records beyond the
  /// marker, up to the vlue specified by `MaxRecords`.
  Future<DescribeCertificatesResponse> describeCertificates(
      {List<Filter> filters, int maxRecords, String marker}) async {
    var response_ = await _client.send('DescribeCertificates', {
      if (filters != null) 'Filters': filters,
      if (maxRecords != null) 'MaxRecords': maxRecords,
      if (marker != null) 'Marker': marker,
    });
    return DescribeCertificatesResponse.fromJson(response_);
  }

  /// Describes the status of the connections that have been made between the
  /// replication instance and an endpoint. Connections are created when you
  /// test an endpoint.
  ///
  /// [filters]: The filters applied to the connection.
  ///
  /// Valid filter names: endpoint-arn | replication-instance-arn
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
  /// [marker]:  An optional pagination token provided by a previous request. If
  /// this parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords`.
  Future<DescribeConnectionsResponse> describeConnections(
      {List<Filter> filters, int maxRecords, String marker}) async {
    var response_ = await _client.send('DescribeConnections', {
      if (filters != null) 'Filters': filters,
      if (maxRecords != null) 'MaxRecords': maxRecords,
      if (marker != null) 'Marker': marker,
    });
    return DescribeConnectionsResponse.fromJson(response_);
  }

  /// Returns information about the type of endpoints available.
  ///
  /// [filters]: Filters applied to the describe action.
  ///
  /// Valid filter names: engine-name | endpoint-type
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
  /// [marker]:  An optional pagination token provided by a previous request. If
  /// this parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords`.
  Future<DescribeEndpointTypesResponse> describeEndpointTypes(
      {List<Filter> filters, int maxRecords, String marker}) async {
    var response_ = await _client.send('DescribeEndpointTypes', {
      if (filters != null) 'Filters': filters,
      if (maxRecords != null) 'MaxRecords': maxRecords,
      if (marker != null) 'Marker': marker,
    });
    return DescribeEndpointTypesResponse.fromJson(response_);
  }

  /// Returns information about the endpoints for your account in the current
  /// region.
  ///
  /// [filters]: Filters applied to the describe action.
  ///
  /// Valid filter names: endpoint-arn | endpoint-type | endpoint-id |
  /// engine-name
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
  /// [marker]:  An optional pagination token provided by a previous request. If
  /// this parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords`.
  Future<DescribeEndpointsResponse> describeEndpoints(
      {List<Filter> filters, int maxRecords, String marker}) async {
    var response_ = await _client.send('DescribeEndpoints', {
      if (filters != null) 'Filters': filters,
      if (maxRecords != null) 'MaxRecords': maxRecords,
      if (marker != null) 'Marker': marker,
    });
    return DescribeEndpointsResponse.fromJson(response_);
  }

  /// Lists categories for all event source types, or, if specified, for a
  /// specified source type. You can see a list of the event categories and
  /// source types in
  /// [Working with Events and Notifications](https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Events.html)
  /// in the _AWS Database Migration Service User Guide._
  ///
  /// [sourceType]:  The type of AWS DMS resource that generates events.
  ///
  /// Valid values: replication-instance | replication-task
  ///
  /// [filters]: Filters applied to the action.
  Future<DescribeEventCategoriesResponse> describeEventCategories(
      {String sourceType, List<Filter> filters}) async {
    var response_ = await _client.send('DescribeEventCategories', {
      if (sourceType != null) 'SourceType': sourceType,
      if (filters != null) 'Filters': filters,
    });
    return DescribeEventCategoriesResponse.fromJson(response_);
  }

  /// Lists all the event subscriptions for a customer account. The description
  /// of a subscription includes `SubscriptionName`, `SNSTopicARN`,
  /// `CustomerID`, `SourceType`, `SourceID`, `CreationTime`, and `Status`.
  ///
  /// If you specify `SubscriptionName`, this action lists the description for
  /// that subscription.
  ///
  /// [subscriptionName]: The name of the AWS DMS event subscription to be
  /// described.
  ///
  /// [filters]: Filters applied to the action.
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
  /// [marker]:  An optional pagination token provided by a previous request. If
  /// this parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords`.
  Future<DescribeEventSubscriptionsResponse> describeEventSubscriptions(
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
    return DescribeEventSubscriptionsResponse.fromJson(response_);
  }

  ///  Lists events for a given source identifier and source type. You can also
  /// specify a start and end time. For more information on AWS DMS events, see
  /// [Working with Events and Notifications](https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Events.html)
  /// in the _AWS Database Migration User Guide._
  ///
  /// [sourceIdentifier]:  The identifier of an event source.
  ///
  /// [sourceType]: The type of AWS DMS resource that generates events.
  ///
  /// Valid values: replication-instance | replication-task
  ///
  /// [startTime]: The start time for the events to be listed.
  ///
  /// [endTime]: The end time for the events to be listed.
  ///
  /// [duration]: The duration of the events to be listed.
  ///
  /// [eventCategories]: A list of event categories for the source type that
  /// you've chosen.
  ///
  /// [filters]: Filters applied to the action.
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
  /// [marker]:  An optional pagination token provided by a previous request. If
  /// this parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords`.
  Future<DescribeEventsResponse> describeEvents(
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
    return DescribeEventsResponse.fromJson(response_);
  }

  /// Returns information about the replication instance types that can be
  /// created in the specified region.
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
  /// [marker]:  An optional pagination token provided by a previous request. If
  /// this parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords`.
  Future<DescribeOrderableReplicationInstancesResponse>
      describeOrderableReplicationInstances(
          {int maxRecords, String marker}) async {
    var response_ =
        await _client.send('DescribeOrderableReplicationInstances', {
      if (maxRecords != null) 'MaxRecords': maxRecords,
      if (marker != null) 'Marker': marker,
    });
    return DescribeOrderableReplicationInstancesResponse.fromJson(response_);
  }

  /// For internal use only
  ///
  /// [replicationInstanceArn]: The Amazon Resource Name (ARN) of the
  /// replication instance.
  ///
  /// [filters]:
  ///
  /// [marker]:  An optional pagination token provided by a previous request. If
  /// this parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords`.
  ///
  /// [maxRecords]:  The maximum number of records to include in the response.
  /// If more records exist than the specified `MaxRecords` value, a pagination
  /// token called a marker is included in the response so that the remaining
  /// results can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 100.
  Future<DescribePendingMaintenanceActionsResponse>
      describePendingMaintenanceActions(
          {String replicationInstanceArn,
          List<Filter> filters,
          String marker,
          int maxRecords}) async {
    var response_ = await _client.send('DescribePendingMaintenanceActions', {
      if (replicationInstanceArn != null)
        'ReplicationInstanceArn': replicationInstanceArn,
      if (filters != null) 'Filters': filters,
      if (marker != null) 'Marker': marker,
      if (maxRecords != null) 'MaxRecords': maxRecords,
    });
    return DescribePendingMaintenanceActionsResponse.fromJson(response_);
  }

  /// Returns the status of the RefreshSchemas operation.
  ///
  /// [endpointArn]: The Amazon Resource Name (ARN) string that uniquely
  /// identifies the endpoint.
  Future<DescribeRefreshSchemasStatusResponse> describeRefreshSchemasStatus(
      String endpointArn) async {
    var response_ = await _client.send('DescribeRefreshSchemasStatus', {
      'EndpointArn': endpointArn,
    });
    return DescribeRefreshSchemasStatusResponse.fromJson(response_);
  }

  /// Returns information about the task logs for the specified task.
  ///
  /// [replicationInstanceArn]: The Amazon Resource Name (ARN) of the
  /// replication instance.
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
  /// [marker]:  An optional pagination token provided by a previous request. If
  /// this parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords`.
  Future<DescribeReplicationInstanceTaskLogsResponse>
      describeReplicationInstanceTaskLogs(String replicationInstanceArn,
          {int maxRecords, String marker}) async {
    var response_ = await _client.send('DescribeReplicationInstanceTaskLogs', {
      'ReplicationInstanceArn': replicationInstanceArn,
      if (maxRecords != null) 'MaxRecords': maxRecords,
      if (marker != null) 'Marker': marker,
    });
    return DescribeReplicationInstanceTaskLogsResponse.fromJson(response_);
  }

  /// Returns information about replication instances for your account in the
  /// current region.
  ///
  /// [filters]: Filters applied to the describe action.
  ///
  /// Valid filter names: replication-instance-arn | replication-instance-id |
  /// replication-instance-class | engine-version
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
  /// [marker]:  An optional pagination token provided by a previous request. If
  /// this parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords`.
  Future<DescribeReplicationInstancesResponse> describeReplicationInstances(
      {List<Filter> filters, int maxRecords, String marker}) async {
    var response_ = await _client.send('DescribeReplicationInstances', {
      if (filters != null) 'Filters': filters,
      if (maxRecords != null) 'MaxRecords': maxRecords,
      if (marker != null) 'Marker': marker,
    });
    return DescribeReplicationInstancesResponse.fromJson(response_);
  }

  /// Returns information about the replication subnet groups.
  ///
  /// [filters]: Filters applied to the describe action.
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
  /// [marker]:  An optional pagination token provided by a previous request. If
  /// this parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords`.
  Future<DescribeReplicationSubnetGroupsResponse>
      describeReplicationSubnetGroups(
          {List<Filter> filters, int maxRecords, String marker}) async {
    var response_ = await _client.send('DescribeReplicationSubnetGroups', {
      if (filters != null) 'Filters': filters,
      if (maxRecords != null) 'MaxRecords': maxRecords,
      if (marker != null) 'Marker': marker,
    });
    return DescribeReplicationSubnetGroupsResponse.fromJson(response_);
  }

  /// Returns the task assessment results from Amazon S3. This action always
  /// returns the latest results.
  ///
  /// [replicationTaskArn]: - The Amazon Resource Name (ARN) string that
  /// uniquely identifies the task. When this input parameter is specified the
  /// API will return only one result and ignore the values of the max-records
  /// and marker parameters.
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
  /// [marker]:  An optional pagination token provided by a previous request. If
  /// this parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords`.
  Future<DescribeReplicationTaskAssessmentResultsResponse>
      describeReplicationTaskAssessmentResults(
          {String replicationTaskArn, int maxRecords, String marker}) async {
    var response_ =
        await _client.send('DescribeReplicationTaskAssessmentResults', {
      if (replicationTaskArn != null) 'ReplicationTaskArn': replicationTaskArn,
      if (maxRecords != null) 'MaxRecords': maxRecords,
      if (marker != null) 'Marker': marker,
    });
    return DescribeReplicationTaskAssessmentResultsResponse.fromJson(response_);
  }

  /// Returns information about replication tasks for your account in the
  /// current region.
  ///
  /// [filters]: Filters applied to the describe action.
  ///
  /// Valid filter names: replication-task-arn | replication-task-id |
  /// migration-type | endpoint-arn | replication-instance-arn
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
  /// [marker]:  An optional pagination token provided by a previous request. If
  /// this parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords`.
  ///
  /// [withoutSettings]: An option to set to avoid returning information about
  /// settings. Use this to reduce overhead when setting information is too
  /// large. To use this option, choose `true`; otherwise, choose `false` (the
  /// default).
  Future<DescribeReplicationTasksResponse> describeReplicationTasks(
      {List<Filter> filters,
      int maxRecords,
      String marker,
      bool withoutSettings}) async {
    var response_ = await _client.send('DescribeReplicationTasks', {
      if (filters != null) 'Filters': filters,
      if (maxRecords != null) 'MaxRecords': maxRecords,
      if (marker != null) 'Marker': marker,
      if (withoutSettings != null) 'WithoutSettings': withoutSettings,
    });
    return DescribeReplicationTasksResponse.fromJson(response_);
  }

  /// Returns information about the schema for the specified endpoint.
  ///
  /// [endpointArn]: The Amazon Resource Name (ARN) string that uniquely
  /// identifies the endpoint.
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
  /// [marker]:  An optional pagination token provided by a previous request. If
  /// this parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords`.
  Future<DescribeSchemasResponse> describeSchemas(String endpointArn,
      {int maxRecords, String marker}) async {
    var response_ = await _client.send('DescribeSchemas', {
      'EndpointArn': endpointArn,
      if (maxRecords != null) 'MaxRecords': maxRecords,
      if (marker != null) 'Marker': marker,
    });
    return DescribeSchemasResponse.fromJson(response_);
  }

  /// Returns table statistics on the database migration task, including table
  /// name, rows inserted, rows updated, and rows deleted.
  ///
  /// Note that the "last updated" column the DMS console only indicates the
  /// time that AWS DMS last updated the table statistics record for a table. It
  /// does not indicate the time of the last update to the table.
  ///
  /// [replicationTaskArn]: The Amazon Resource Name (ARN) of the replication
  /// task.
  ///
  /// [maxRecords]:  The maximum number of records to include in the response.
  /// If more records exist than the specified `MaxRecords` value, a pagination
  /// token called a marker is included in the response so that the remaining
  /// results can be retrieved.
  ///
  /// Default: 100
  ///
  /// Constraints: Minimum 20, maximum 500.
  ///
  /// [marker]:  An optional pagination token provided by a previous request. If
  /// this parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords`.
  ///
  /// [filters]: Filters applied to the describe table statistics action.
  ///
  /// Valid filter names: schema-name | table-name | table-state
  ///
  /// A combination of filters creates an AND condition where each record
  /// matches all specified filters.
  Future<DescribeTableStatisticsResponse> describeTableStatistics(
      String replicationTaskArn,
      {int maxRecords,
      String marker,
      List<Filter> filters}) async {
    var response_ = await _client.send('DescribeTableStatistics', {
      'ReplicationTaskArn': replicationTaskArn,
      if (maxRecords != null) 'MaxRecords': maxRecords,
      if (marker != null) 'Marker': marker,
      if (filters != null) 'Filters': filters,
    });
    return DescribeTableStatisticsResponse.fromJson(response_);
  }

  /// Uploads the specified certificate.
  ///
  /// [certificateIdentifier]: A customer-assigned name for the certificate.
  /// Identifiers must begin with a letter; must contain only ASCII letters,
  /// digits, and hyphens; and must not end with a hyphen or contain two
  /// consecutive hyphens.
  ///
  /// [certificatePem]: The contents of a `.pem` file, which contains an X.509
  /// certificate.
  ///
  /// [certificateWallet]: The location of an imported Oracle Wallet certificate
  /// for use with SSL.
  ///
  /// [tags]: The tags associated with the certificate.
  Future<ImportCertificateResponse> importCertificate(
      String certificateIdentifier,
      {String certificatePem,
      Uint8List certificateWallet,
      List<Tag> tags}) async {
    var response_ = await _client.send('ImportCertificate', {
      'CertificateIdentifier': certificateIdentifier,
      if (certificatePem != null) 'CertificatePem': certificatePem,
      if (certificateWallet != null) 'CertificateWallet': certificateWallet,
      if (tags != null) 'Tags': tags,
    });
    return ImportCertificateResponse.fromJson(response_);
  }

  /// Lists all tags for an AWS DMS resource.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) string that uniquely
  /// identifies the AWS DMS resource.
  Future<ListTagsForResourceResponse> listTagsForResource(
      String resourceArn) async {
    var response_ = await _client.send('ListTagsForResource', {
      'ResourceArn': resourceArn,
    });
    return ListTagsForResourceResponse.fromJson(response_);
  }

  /// Modifies the specified endpoint.
  ///
  /// [endpointArn]: The Amazon Resource Name (ARN) string that uniquely
  /// identifies the endpoint.
  ///
  /// [endpointIdentifier]: The database endpoint identifier. Identifiers must
  /// begin with a letter; must contain only ASCII letters, digits, and hyphens;
  /// and must not end with a hyphen or contain two consecutive hyphens.
  ///
  /// [endpointType]: The type of endpoint. Valid values are `source` and
  /// `target`.
  ///
  /// [engineName]: The type of engine for the endpoint. Valid values, depending
  /// on the EndpointType, include mysql, oracle, postgres, mariadb, aurora,
  /// aurora-postgresql, redshift, s3, db2, azuredb, sybase, dynamodb, mongodb,
  /// and sqlserver.
  ///
  /// [username]: The user name to be used to login to the endpoint database.
  ///
  /// [password]: The password to be used to login to the endpoint database.
  ///
  /// [serverName]: The name of the server where the endpoint database resides.
  ///
  /// [port]: The port used by the endpoint database.
  ///
  /// [databaseName]: The name of the endpoint database.
  ///
  /// [extraConnectionAttributes]: Additional attributes associated with the
  /// connection. To reset this parameter, pass the empty string ("") as an
  /// argument.
  ///
  /// [certificateArn]: The Amazon Resource Name (ARN) of the certificate used
  /// for SSL connection.
  ///
  /// [sslMode]: The SSL mode used to connect to the endpoint. The default value
  /// is `none`.
  ///
  /// [serviceAccessRoleArn]:  The Amazon Resource Name (ARN) for the service
  /// access role you want to use to modify the endpoint.
  ///
  /// [externalTableDefinition]: The external table definition.
  ///
  /// [dynamoDbSettings]: Settings in JSON format for the target Amazon DynamoDB
  /// endpoint. For more information about the available settings, see
  /// [Using Object Mapping to Migrate Data to DynamoDB](https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.DynamoDB.html)
  /// in the _AWS Database Migration Service User Guide._
  ///
  /// [s3Settings]: Settings in JSON format for the target Amazon S3 endpoint.
  /// For more information about the available settings, see
  /// [Extra Connection Attributes When Using Amazon S3 as a Target for AWS DMS](https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.S3.html#CHAP_Target.S3.Configuring)
  /// in the _AWS Database Migration Service User Guide._
  ///
  /// [dmsTransferSettings]: The settings in JSON format for the DMS transfer
  /// type of source endpoint.
  ///
  /// Attributes include the following:
  ///
  /// *   serviceAccessRoleArn - The IAM role that has permission to access the
  /// Amazon S3 bucket.
  ///
  /// *   BucketName - The name of the S3 bucket to use.
  ///
  /// *   compressionType - An optional parameter to use GZIP to compress the
  /// target files. Set to NONE (the default) or do not use to leave the files
  /// uncompressed.
  ///
  ///
  /// Shorthand syntax: ServiceAccessRoleArn=string
  /// ,BucketName=string,CompressionType=string
  ///
  /// JSON syntax:
  ///
  ///  { "ServiceAccessRoleArn": "string", "BucketName": "string",
  /// "CompressionType": "none"|"gzip" }
  ///
  /// [mongoDbSettings]: Settings in JSON format for the source MongoDB
  /// endpoint. For more information about the available settings, see the
  /// configuration properties section in
  /// [Using MongoDB as a Target for AWS Database Migration Service](https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Source.MongoDB.html)
  /// in the _AWS Database Migration Service User Guide._
  ///
  /// [kinesisSettings]: Settings in JSON format for the target Amazon Kinesis
  /// Data Streams endpoint. For more information about the available settings,
  /// see
  /// [Using Object Mapping to Migrate Data to a Kinesis Data Stream](https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.Kinesis.html#CHAP_Target.Kinesis.ObjectMapping)
  /// in the _AWS Database Migration User Guide._
  ///
  /// [elasticsearchSettings]: Settings in JSON format for the target
  /// Elasticsearch endpoint. For more information about the available settings,
  /// see
  /// [Extra Connection Attributes When Using Elasticsearch as a Target for AWS DMS](https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.Elasticsearch.html#CHAP_Target.Elasticsearch.Configuration)
  /// in the _AWS Database Migration User Guide._
  Future<ModifyEndpointResponse> modifyEndpoint(String endpointArn,
      {String endpointIdentifier,
      String endpointType,
      String engineName,
      String username,
      String password,
      String serverName,
      int port,
      String databaseName,
      String extraConnectionAttributes,
      String certificateArn,
      String sslMode,
      String serviceAccessRoleArn,
      String externalTableDefinition,
      DynamoDbSettings dynamoDbSettings,
      S3Settings s3Settings,
      DmsTransferSettings dmsTransferSettings,
      MongoDbSettings mongoDbSettings,
      KinesisSettings kinesisSettings,
      ElasticsearchSettings elasticsearchSettings,
      RedshiftSettings redshiftSettings}) async {
    var response_ = await _client.send('ModifyEndpoint', {
      'EndpointArn': endpointArn,
      if (endpointIdentifier != null) 'EndpointIdentifier': endpointIdentifier,
      if (endpointType != null) 'EndpointType': endpointType,
      if (engineName != null) 'EngineName': engineName,
      if (username != null) 'Username': username,
      if (password != null) 'Password': password,
      if (serverName != null) 'ServerName': serverName,
      if (port != null) 'Port': port,
      if (databaseName != null) 'DatabaseName': databaseName,
      if (extraConnectionAttributes != null)
        'ExtraConnectionAttributes': extraConnectionAttributes,
      if (certificateArn != null) 'CertificateArn': certificateArn,
      if (sslMode != null) 'SslMode': sslMode,
      if (serviceAccessRoleArn != null)
        'ServiceAccessRoleArn': serviceAccessRoleArn,
      if (externalTableDefinition != null)
        'ExternalTableDefinition': externalTableDefinition,
      if (dynamoDbSettings != null) 'DynamoDbSettings': dynamoDbSettings,
      if (s3Settings != null) 'S3Settings': s3Settings,
      if (dmsTransferSettings != null)
        'DmsTransferSettings': dmsTransferSettings,
      if (mongoDbSettings != null) 'MongoDbSettings': mongoDbSettings,
      if (kinesisSettings != null) 'KinesisSettings': kinesisSettings,
      if (elasticsearchSettings != null)
        'ElasticsearchSettings': elasticsearchSettings,
      if (redshiftSettings != null) 'RedshiftSettings': redshiftSettings,
    });
    return ModifyEndpointResponse.fromJson(response_);
  }

  /// Modifies an existing AWS DMS event notification subscription.
  ///
  /// [subscriptionName]: The name of the AWS DMS event notification
  /// subscription to be modified.
  ///
  /// [snsTopicArn]:  The Amazon Resource Name (ARN) of the Amazon SNS topic
  /// created for event notification. The ARN is created by Amazon SNS when you
  /// create a topic and subscribe to it.
  ///
  /// [sourceType]:  The type of AWS DMS resource that generates the events you
  /// want to subscribe to.
  ///
  /// Valid values: replication-instance | replication-task
  ///
  /// [eventCategories]:  A list of event categories for a source type that you
  /// want to subscribe to. Use the `DescribeEventCategories` action to see a
  /// list of event categories.
  ///
  /// [enabled]:  A Boolean value; set to **true** to activate the subscription.
  Future<ModifyEventSubscriptionResponse> modifyEventSubscription(
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
    return ModifyEventSubscriptionResponse.fromJson(response_);
  }

  /// Modifies the replication instance to apply new settings. You can change
  /// one or more parameters by specifying these parameters and the new values
  /// in the request.
  ///
  /// Some settings are applied during the maintenance window.
  ///
  /// [replicationInstanceArn]: The Amazon Resource Name (ARN) of the
  /// replication instance.
  ///
  /// [allocatedStorage]: The amount of storage (in gigabytes) to be allocated
  /// for the replication instance.
  ///
  /// [applyImmediately]: Indicates whether the changes should be applied
  /// immediately or during the next maintenance window.
  ///
  /// [replicationInstanceClass]: The compute and memory capacity of the
  /// replication instance.
  ///
  ///  Valid Values: `dms.t2.micro | dms.t2.small | dms.t2.medium | dms.t2.large
  /// | dms.c4.large | dms.c4.xlarge | dms.c4.2xlarge | dms.c4.4xlarge`
  ///
  /// [vpcSecurityGroupIds]:  Specifies the VPC security group to be used with
  /// the replication instance. The VPC security group must work with the VPC
  /// containing the replication instance.
  ///
  /// [preferredMaintenanceWindow]: The weekly time range (in UTC) during which
  /// system maintenance can occur, which might result in an outage. Changing
  /// this parameter does not result in an outage, except in the following
  /// situation, and the change is asynchronously applied as soon as possible.
  /// If moving this window to the current time, there must be at least 30
  /// minutes between the current time and end of the window to ensure pending
  /// changes are applied.
  ///
  /// Default: Uses existing setting
  ///
  /// Format: ddd:hh24:mi-ddd:hh24:mi
  ///
  /// Valid Days: Mon | Tue | Wed | Thu | Fri | Sat | Sun
  ///
  /// Constraints: Must be at least 30 minutes
  ///
  /// [multiAZ]:  Specifies whether the replication instance is a Multi-AZ
  /// deployment. You cannot set the `AvailabilityZone` parameter if the
  /// Multi-AZ parameter is set to `true`.
  ///
  /// [engineVersion]: The engine version number of the replication instance.
  ///
  /// [allowMajorVersionUpgrade]: Indicates that major version upgrades are
  /// allowed. Changing this parameter does not result in an outage, and the
  /// change is asynchronously applied as soon as possible.
  ///
  /// This parameter must be set to `true` when specifying a value for the
  /// `EngineVersion` parameter that is a different major version than the
  /// replication instance's current version.
  ///
  /// [autoMinorVersionUpgrade]:  Indicates that minor version upgrades will be
  /// applied automatically to the replication instance during the maintenance
  /// window. Changing this parameter does not result in an outage except in the
  /// following case and the change is asynchronously applied as soon as
  /// possible. An outage will result if this parameter is set to `true` during
  /// the maintenance window, and a newer minor version is available, and AWS
  /// DMS has enabled auto patching for that engine version.
  ///
  /// [replicationInstanceIdentifier]: The replication instance identifier. This
  /// parameter is stored as a lowercase string.
  Future<ModifyReplicationInstanceResponse> modifyReplicationInstance(
      String replicationInstanceArn,
      {int allocatedStorage,
      bool applyImmediately,
      String replicationInstanceClass,
      List<String> vpcSecurityGroupIds,
      String preferredMaintenanceWindow,
      bool multiAZ,
      String engineVersion,
      bool allowMajorVersionUpgrade,
      bool autoMinorVersionUpgrade,
      String replicationInstanceIdentifier}) async {
    var response_ = await _client.send('ModifyReplicationInstance', {
      'ReplicationInstanceArn': replicationInstanceArn,
      if (allocatedStorage != null) 'AllocatedStorage': allocatedStorage,
      if (applyImmediately != null) 'ApplyImmediately': applyImmediately,
      if (replicationInstanceClass != null)
        'ReplicationInstanceClass': replicationInstanceClass,
      if (vpcSecurityGroupIds != null)
        'VpcSecurityGroupIds': vpcSecurityGroupIds,
      if (preferredMaintenanceWindow != null)
        'PreferredMaintenanceWindow': preferredMaintenanceWindow,
      if (multiAZ != null) 'MultiAZ': multiAZ,
      if (engineVersion != null) 'EngineVersion': engineVersion,
      if (allowMajorVersionUpgrade != null)
        'AllowMajorVersionUpgrade': allowMajorVersionUpgrade,
      if (autoMinorVersionUpgrade != null)
        'AutoMinorVersionUpgrade': autoMinorVersionUpgrade,
      if (replicationInstanceIdentifier != null)
        'ReplicationInstanceIdentifier': replicationInstanceIdentifier,
    });
    return ModifyReplicationInstanceResponse.fromJson(response_);
  }

  /// Modifies the settings for the specified replication subnet group.
  ///
  /// [replicationSubnetGroupIdentifier]: The name of the replication instance
  /// subnet group.
  ///
  /// [replicationSubnetGroupDescription]: A description for the replication
  /// instance subnet group.
  ///
  /// [subnetIds]: A list of subnet IDs.
  Future<ModifyReplicationSubnetGroupResponse> modifyReplicationSubnetGroup(
      {@required String replicationSubnetGroupIdentifier,
      String replicationSubnetGroupDescription,
      @required List<String> subnetIds}) async {
    var response_ = await _client.send('ModifyReplicationSubnetGroup', {
      'ReplicationSubnetGroupIdentifier': replicationSubnetGroupIdentifier,
      if (replicationSubnetGroupDescription != null)
        'ReplicationSubnetGroupDescription': replicationSubnetGroupDescription,
      'SubnetIds': subnetIds,
    });
    return ModifyReplicationSubnetGroupResponse.fromJson(response_);
  }

  /// Modifies the specified replication task.
  ///
  /// You can't modify the task endpoints. The task must be stopped before you
  /// can modify it.
  ///
  /// For more information about AWS DMS tasks, see
  /// [Working with Migration Tasks](https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Tasks.html)
  /// in the _AWS Database Migration Service User Guide_.
  ///
  /// [replicationTaskArn]: The Amazon Resource Name (ARN) of the replication
  /// task.
  ///
  /// [replicationTaskIdentifier]: The replication task identifier.
  ///
  /// Constraints:
  ///
  /// *   Must contain from 1 to 255 alphanumeric characters or hyphens.
  ///
  /// *   First character must be a letter.
  ///
  /// *   Cannot end with a hyphen or contain two consecutive hyphens.
  ///
  /// [migrationType]: The migration type. Valid values: `full-load` | `cdc` |
  /// `full-load-and-cdc`
  ///
  /// [tableMappings]: When using the AWS CLI or boto3, provide the path of the
  /// JSON file that contains the table mappings. Precede the path with
  /// `file://`. When working with the DMS API, provide the JSON as the
  /// parameter value, for example: `--table-mappings file://mappingfile.json`
  ///
  /// [replicationTaskSettings]: JSON file that contains settings for the task,
  /// such as target metadata settings.
  ///
  /// [cdcStartTime]: Indicates the start time for a change data capture (CDC)
  /// operation. Use either CdcStartTime or CdcStartPosition to specify when you
  /// want a CDC operation to start. Specifying both values results in an error.
  ///
  /// Timestamp Example: --cdc-start-time “2018-03-08T12:12:12”
  ///
  /// [cdcStartPosition]: Indicates when you want a change data capture (CDC)
  /// operation to start. Use either CdcStartPosition or CdcStartTime to specify
  /// when you want a CDC operation to start. Specifying both values results in
  /// an error.
  ///
  ///  The value can be in date, checkpoint, or LSN/SCN format.
  ///
  /// Date Example: --cdc-start-position “2018-03-08T12:12:12”
  ///
  /// Checkpoint Example: --cdc-start-position
  /// "checkpoint:V1#27#mysql-bin-changelog.157832:1975:-1:2002:677883278264080:mysql-bin-changelog.157832:1876#0#0#*#0#93"
  ///
  /// LSN Example: --cdc-start-position “mysql-bin-changelog.000024:373”
  ///
  /// [cdcStopPosition]: Indicates when you want a change data capture (CDC)
  /// operation to stop. The value can be either server time or commit time.
  ///
  /// Server time example: --cdc-stop-position “server_time:3018-02-09T12:12:12”
  ///
  /// Commit time example: --cdc-stop-position “commit_time: 3018-02-09T12:12:12
  /// “
  Future<ModifyReplicationTaskResponse> modifyReplicationTask(
      String replicationTaskArn,
      {String replicationTaskIdentifier,
      String migrationType,
      String tableMappings,
      String replicationTaskSettings,
      DateTime cdcStartTime,
      String cdcStartPosition,
      String cdcStopPosition}) async {
    var response_ = await _client.send('ModifyReplicationTask', {
      'ReplicationTaskArn': replicationTaskArn,
      if (replicationTaskIdentifier != null)
        'ReplicationTaskIdentifier': replicationTaskIdentifier,
      if (migrationType != null) 'MigrationType': migrationType,
      if (tableMappings != null) 'TableMappings': tableMappings,
      if (replicationTaskSettings != null)
        'ReplicationTaskSettings': replicationTaskSettings,
      if (cdcStartTime != null) 'CdcStartTime': cdcStartTime,
      if (cdcStartPosition != null) 'CdcStartPosition': cdcStartPosition,
      if (cdcStopPosition != null) 'CdcStopPosition': cdcStopPosition,
    });
    return ModifyReplicationTaskResponse.fromJson(response_);
  }

  /// Reboots a replication instance. Rebooting results in a momentary outage,
  /// until the replication instance becomes available again.
  ///
  /// [replicationInstanceArn]: The Amazon Resource Name (ARN) of the
  /// replication instance.
  ///
  /// [forceFailover]: If this parameter is `true`, the reboot is conducted
  /// through a Multi-AZ failover. (If the instance isn't configured for
  /// Multi-AZ, then you can't specify `true`.)
  Future<RebootReplicationInstanceResponse> rebootReplicationInstance(
      String replicationInstanceArn,
      {bool forceFailover}) async {
    var response_ = await _client.send('RebootReplicationInstance', {
      'ReplicationInstanceArn': replicationInstanceArn,
      if (forceFailover != null) 'ForceFailover': forceFailover,
    });
    return RebootReplicationInstanceResponse.fromJson(response_);
  }

  /// Populates the schema for the specified endpoint. This is an asynchronous
  /// operation and can take several minutes. You can check the status of this
  /// operation by calling the DescribeRefreshSchemasStatus operation.
  ///
  /// [endpointArn]: The Amazon Resource Name (ARN) string that uniquely
  /// identifies the endpoint.
  ///
  /// [replicationInstanceArn]: The Amazon Resource Name (ARN) of the
  /// replication instance.
  Future<RefreshSchemasResponse> refreshSchemas(
      {@required String endpointArn,
      @required String replicationInstanceArn}) async {
    var response_ = await _client.send('RefreshSchemas', {
      'EndpointArn': endpointArn,
      'ReplicationInstanceArn': replicationInstanceArn,
    });
    return RefreshSchemasResponse.fromJson(response_);
  }

  /// Reloads the target database table with the source data.
  ///
  /// [replicationTaskArn]: The Amazon Resource Name (ARN) of the replication
  /// task.
  ///
  /// [tablesToReload]: The name and schema of the table to be reloaded.
  ///
  /// [reloadOption]: Options for reload. Specify `data-reload` to reload the
  /// data and re-validate it if validation is enabled. Specify `validate-only`
  /// to re-validate the table. This option applies only when validation is
  /// enabled for the task.
  ///
  /// Valid values: data-reload, validate-only
  ///
  /// Default value is data-reload.
  Future<ReloadTablesResponse> reloadTables(
      {@required String replicationTaskArn,
      @required List<TableToReload> tablesToReload,
      String reloadOption}) async {
    var response_ = await _client.send('ReloadTables', {
      'ReplicationTaskArn': replicationTaskArn,
      'TablesToReload': tablesToReload,
      if (reloadOption != null) 'ReloadOption': reloadOption,
    });
    return ReloadTablesResponse.fromJson(response_);
  }

  /// Removes metadata tags from a DMS resource.
  ///
  /// [resourceArn]: An AWS DMS resource from which you want to remove tag(s).
  /// The value for this parameter is an Amazon Resource Name (ARN).
  ///
  /// [tagKeys]: The tag key (name) of the tag to be removed.
  Future<RemoveTagsFromResourceResponse> removeTagsFromResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {
    var response_ = await _client.send('RemoveTagsFromResource', {
      'ResourceArn': resourceArn,
      'TagKeys': tagKeys,
    });
    return RemoveTagsFromResourceResponse.fromJson(response_);
  }

  /// Starts the replication task.
  ///
  /// For more information about AWS DMS tasks, see
  /// [Working with Migration Tasks](https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Tasks.html)
  ///  in the _AWS Database Migration Service User Guide._
  ///
  /// [replicationTaskArn]: The Amazon Resource Name (ARN) of the replication
  /// task to be started.
  ///
  /// [startReplicationTaskType]: The type of replication task.
  ///
  /// [cdcStartTime]: Indicates the start time for a change data capture (CDC)
  /// operation. Use either CdcStartTime or CdcStartPosition to specify when you
  /// want a CDC operation to start. Specifying both values results in an error.
  ///
  /// Timestamp Example: --cdc-start-time “2018-03-08T12:12:12”
  ///
  /// [cdcStartPosition]: Indicates when you want a change data capture (CDC)
  /// operation to start. Use either CdcStartPosition or CdcStartTime to specify
  /// when you want a CDC operation to start. Specifying both values results in
  /// an error.
  ///
  ///  The value can be in date, checkpoint, or LSN/SCN format.
  ///
  /// Date Example: --cdc-start-position “2018-03-08T12:12:12”
  ///
  /// Checkpoint Example: --cdc-start-position
  /// "checkpoint:V1#27#mysql-bin-changelog.157832:1975:-1:2002:677883278264080:mysql-bin-changelog.157832:1876#0#0#*#0#93"
  ///
  /// LSN Example: --cdc-start-position “mysql-bin-changelog.000024:373”
  ///
  /// [cdcStopPosition]: Indicates when you want a change data capture (CDC)
  /// operation to stop. The value can be either server time or commit time.
  ///
  /// Server time example: --cdc-stop-position “server_time:3018-02-09T12:12:12”
  ///
  /// Commit time example: --cdc-stop-position “commit_time: 3018-02-09T12:12:12
  /// “
  Future<StartReplicationTaskResponse> startReplicationTask(
      {@required String replicationTaskArn,
      @required String startReplicationTaskType,
      DateTime cdcStartTime,
      String cdcStartPosition,
      String cdcStopPosition}) async {
    var response_ = await _client.send('StartReplicationTask', {
      'ReplicationTaskArn': replicationTaskArn,
      'StartReplicationTaskType': startReplicationTaskType,
      if (cdcStartTime != null) 'CdcStartTime': cdcStartTime,
      if (cdcStartPosition != null) 'CdcStartPosition': cdcStartPosition,
      if (cdcStopPosition != null) 'CdcStopPosition': cdcStopPosition,
    });
    return StartReplicationTaskResponse.fromJson(response_);
  }

  ///  Starts the replication task assessment for unsupported data types in the
  /// source database.
  ///
  /// [replicationTaskArn]:  The Amazon Resource Name (ARN) of the replication
  /// task.
  Future<StartReplicationTaskAssessmentResponse> startReplicationTaskAssessment(
      String replicationTaskArn) async {
    var response_ = await _client.send('StartReplicationTaskAssessment', {
      'ReplicationTaskArn': replicationTaskArn,
    });
    return StartReplicationTaskAssessmentResponse.fromJson(response_);
  }

  /// Stops the replication task.
  ///
  /// [replicationTaskArn]: The Amazon Resource Name(ARN) of the replication
  /// task to be stopped.
  Future<StopReplicationTaskResponse> stopReplicationTask(
      String replicationTaskArn) async {
    var response_ = await _client.send('StopReplicationTask', {
      'ReplicationTaskArn': replicationTaskArn,
    });
    return StopReplicationTaskResponse.fromJson(response_);
  }

  /// Tests the connection between the replication instance and the endpoint.
  ///
  /// [replicationInstanceArn]: The Amazon Resource Name (ARN) of the
  /// replication instance.
  ///
  /// [endpointArn]: The Amazon Resource Name (ARN) string that uniquely
  /// identifies the endpoint.
  Future<TestConnectionResponse> testConnection(
      {@required String replicationInstanceArn,
      @required String endpointArn}) async {
    var response_ = await _client.send('TestConnection', {
      'ReplicationInstanceArn': replicationInstanceArn,
      'EndpointArn': endpointArn,
    });
    return TestConnectionResponse.fromJson(response_);
  }
}

/// Describes a quota for an AWS account, for example, the number of replication
/// instances allowed.
class AccountQuota {
  /// The name of the AWS DMS quota for this AWS account.
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
  static AccountQuota fromJson(Map<String, dynamic> json) => AccountQuota(
        accountQuotaName: json.containsKey('AccountQuotaName')
            ? json['AccountQuotaName'] as String
            : null,
        used: json.containsKey('Used') ? BigInt.from(json['Used']) : null,
        max: json.containsKey('Max') ? BigInt.from(json['Max']) : null,
      );
}

class AddTagsToResourceResponse {
  AddTagsToResourceResponse();
  static AddTagsToResourceResponse fromJson(Map<String, dynamic> json) =>
      AddTagsToResourceResponse();
}

class ApplyPendingMaintenanceActionResponse {
  /// The AWS DMS resource that the pending maintenance action will be applied
  /// to.
  final ResourcePendingMaintenanceActions resourcePendingMaintenanceActions;

  ApplyPendingMaintenanceActionResponse({
    this.resourcePendingMaintenanceActions,
  });
  static ApplyPendingMaintenanceActionResponse fromJson(
          Map<String, dynamic> json) =>
      ApplyPendingMaintenanceActionResponse(
        resourcePendingMaintenanceActions:
            json.containsKey('ResourcePendingMaintenanceActions')
                ? ResourcePendingMaintenanceActions.fromJson(
                    json['ResourcePendingMaintenanceActions'])
                : null,
      );
}

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

/// The SSL certificate that can be used to encrypt connections between the
/// endpoints and the replication instance.
class Certificate {
  /// A customer-assigned name for the certificate. Identifiers must begin with
  /// a letter; must contain only ASCII letters, digits, and hyphens; and must
  /// not end with a hyphen or contain two consecutive hyphens.
  final String certificateIdentifier;

  /// The date that the certificate was created.
  final DateTime certificateCreationDate;

  /// The contents of a `.pem` file, which contains an X.509 certificate.
  final String certificatePem;

  /// The location of an imported Oracle Wallet certificate for use with SSL.
  final Uint8List certificateWallet;

  /// The Amazon Resource Name (ARN) for the certificate.
  final String certificateArn;

  /// The owner of the certificate.
  final String certificateOwner;

  /// The beginning date that the certificate is valid.
  final DateTime validFromDate;

  /// The final date that the certificate is valid.
  final DateTime validToDate;

  /// The signing algorithm for the certificate.
  final String signingAlgorithm;

  /// The key length of the cryptographic algorithm being used.
  final int keyLength;

  Certificate({
    this.certificateIdentifier,
    this.certificateCreationDate,
    this.certificatePem,
    this.certificateWallet,
    this.certificateArn,
    this.certificateOwner,
    this.validFromDate,
    this.validToDate,
    this.signingAlgorithm,
    this.keyLength,
  });
  static Certificate fromJson(Map<String, dynamic> json) => Certificate(
        certificateIdentifier: json.containsKey('CertificateIdentifier')
            ? json['CertificateIdentifier'] as String
            : null,
        certificateCreationDate: json.containsKey('CertificateCreationDate')
            ? DateTime.parse(json['CertificateCreationDate'])
            : null,
        certificatePem: json.containsKey('CertificatePem')
            ? json['CertificatePem'] as String
            : null,
        certificateWallet: json.containsKey('CertificateWallet')
            ? Uint8List(json['CertificateWallet'])
            : null,
        certificateArn: json.containsKey('CertificateArn')
            ? json['CertificateArn'] as String
            : null,
        certificateOwner: json.containsKey('CertificateOwner')
            ? json['CertificateOwner'] as String
            : null,
        validFromDate: json.containsKey('ValidFromDate')
            ? DateTime.parse(json['ValidFromDate'])
            : null,
        validToDate: json.containsKey('ValidToDate')
            ? DateTime.parse(json['ValidToDate'])
            : null,
        signingAlgorithm: json.containsKey('SigningAlgorithm')
            ? json['SigningAlgorithm'] as String
            : null,
        keyLength:
            json.containsKey('KeyLength') ? json['KeyLength'] as int : null,
      );
}

class Connection {
  /// The Amazon Resource Name (ARN) of the replication instance.
  final String replicationInstanceArn;

  /// The Amazon Resource Name (ARN) string that uniquely identifies the
  /// endpoint.
  final String endpointArn;

  /// The connection status.
  final String status;

  /// The error message when the connection last failed.
  final String lastFailureMessage;

  /// The identifier of the endpoint. Identifiers must begin with a letter; must
  /// contain only ASCII letters, digits, and hyphens; and must not end with a
  /// hyphen or contain two consecutive hyphens.
  final String endpointIdentifier;

  /// The replication instance identifier. This parameter is stored as a
  /// lowercase string.
  final String replicationInstanceIdentifier;

  Connection({
    this.replicationInstanceArn,
    this.endpointArn,
    this.status,
    this.lastFailureMessage,
    this.endpointIdentifier,
    this.replicationInstanceIdentifier,
  });
  static Connection fromJson(Map<String, dynamic> json) => Connection(
        replicationInstanceArn: json.containsKey('ReplicationInstanceArn')
            ? json['ReplicationInstanceArn'] as String
            : null,
        endpointArn: json.containsKey('EndpointArn')
            ? json['EndpointArn'] as String
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        lastFailureMessage: json.containsKey('LastFailureMessage')
            ? json['LastFailureMessage'] as String
            : null,
        endpointIdentifier: json.containsKey('EndpointIdentifier')
            ? json['EndpointIdentifier'] as String
            : null,
        replicationInstanceIdentifier:
            json.containsKey('ReplicationInstanceIdentifier')
                ? json['ReplicationInstanceIdentifier'] as String
                : null,
      );
}

class CreateEndpointResponse {
  /// The endpoint that was created.
  final Endpoint endpoint;

  CreateEndpointResponse({
    this.endpoint,
  });
  static CreateEndpointResponse fromJson(Map<String, dynamic> json) =>
      CreateEndpointResponse(
        endpoint: json.containsKey('Endpoint')
            ? Endpoint.fromJson(json['Endpoint'])
            : null,
      );
}

class CreateEventSubscriptionResponse {
  /// The event subscription that was created.
  final EventSubscription eventSubscription;

  CreateEventSubscriptionResponse({
    this.eventSubscription,
  });
  static CreateEventSubscriptionResponse fromJson(Map<String, dynamic> json) =>
      CreateEventSubscriptionResponse(
        eventSubscription: json.containsKey('EventSubscription')
            ? EventSubscription.fromJson(json['EventSubscription'])
            : null,
      );
}

class CreateReplicationInstanceResponse {
  /// The replication instance that was created.
  final ReplicationInstance replicationInstance;

  CreateReplicationInstanceResponse({
    this.replicationInstance,
  });
  static CreateReplicationInstanceResponse fromJson(
          Map<String, dynamic> json) =>
      CreateReplicationInstanceResponse(
        replicationInstance: json.containsKey('ReplicationInstance')
            ? ReplicationInstance.fromJson(json['ReplicationInstance'])
            : null,
      );
}

class CreateReplicationSubnetGroupResponse {
  /// The replication subnet group that was created.
  final ReplicationSubnetGroup replicationSubnetGroup;

  CreateReplicationSubnetGroupResponse({
    this.replicationSubnetGroup,
  });
  static CreateReplicationSubnetGroupResponse fromJson(
          Map<String, dynamic> json) =>
      CreateReplicationSubnetGroupResponse(
        replicationSubnetGroup: json.containsKey('ReplicationSubnetGroup')
            ? ReplicationSubnetGroup.fromJson(json['ReplicationSubnetGroup'])
            : null,
      );
}

class CreateReplicationTaskResponse {
  /// The replication task that was created.
  final ReplicationTask replicationTask;

  CreateReplicationTaskResponse({
    this.replicationTask,
  });
  static CreateReplicationTaskResponse fromJson(Map<String, dynamic> json) =>
      CreateReplicationTaskResponse(
        replicationTask: json.containsKey('ReplicationTask')
            ? ReplicationTask.fromJson(json['ReplicationTask'])
            : null,
      );
}

class DeleteCertificateResponse {
  /// The Secure Sockets Layer (SSL) certificate.
  final Certificate certificate;

  DeleteCertificateResponse({
    this.certificate,
  });
  static DeleteCertificateResponse fromJson(Map<String, dynamic> json) =>
      DeleteCertificateResponse(
        certificate: json.containsKey('Certificate')
            ? Certificate.fromJson(json['Certificate'])
            : null,
      );
}

class DeleteEndpointResponse {
  /// The endpoint that was deleted.
  final Endpoint endpoint;

  DeleteEndpointResponse({
    this.endpoint,
  });
  static DeleteEndpointResponse fromJson(Map<String, dynamic> json) =>
      DeleteEndpointResponse(
        endpoint: json.containsKey('Endpoint')
            ? Endpoint.fromJson(json['Endpoint'])
            : null,
      );
}

class DeleteEventSubscriptionResponse {
  /// The event subscription that was deleted.
  final EventSubscription eventSubscription;

  DeleteEventSubscriptionResponse({
    this.eventSubscription,
  });
  static DeleteEventSubscriptionResponse fromJson(Map<String, dynamic> json) =>
      DeleteEventSubscriptionResponse(
        eventSubscription: json.containsKey('EventSubscription')
            ? EventSubscription.fromJson(json['EventSubscription'])
            : null,
      );
}

class DeleteReplicationInstanceResponse {
  /// The replication instance that was deleted.
  final ReplicationInstance replicationInstance;

  DeleteReplicationInstanceResponse({
    this.replicationInstance,
  });
  static DeleteReplicationInstanceResponse fromJson(
          Map<String, dynamic> json) =>
      DeleteReplicationInstanceResponse(
        replicationInstance: json.containsKey('ReplicationInstance')
            ? ReplicationInstance.fromJson(json['ReplicationInstance'])
            : null,
      );
}

class DeleteReplicationSubnetGroupResponse {
  DeleteReplicationSubnetGroupResponse();
  static DeleteReplicationSubnetGroupResponse fromJson(
          Map<String, dynamic> json) =>
      DeleteReplicationSubnetGroupResponse();
}

class DeleteReplicationTaskResponse {
  /// The deleted replication task.
  final ReplicationTask replicationTask;

  DeleteReplicationTaskResponse({
    this.replicationTask,
  });
  static DeleteReplicationTaskResponse fromJson(Map<String, dynamic> json) =>
      DeleteReplicationTaskResponse(
        replicationTask: json.containsKey('ReplicationTask')
            ? ReplicationTask.fromJson(json['ReplicationTask'])
            : null,
      );
}

class DescribeAccountAttributesResponse {
  /// Account quota information.
  final List<AccountQuota> accountQuotas;

  /// A unique AWS DMS identifier for an account in a particular AWS Region. The
  /// value of this identifier has the following format: `c99999999999`. DMS
  /// uses this identifier to name artifacts. For example, DMS uses this
  /// identifier to name the default Amazon S3 bucket for storing task
  /// assessment reports in a given AWS Region. The format of this S3 bucket
  /// name is the following: `dms-_AccountNumber_-_UniqueAccountIdentifier_.`
  /// Here is an example name for this default S3 bucket:
  /// `dms-111122223333-c44445555666`.
  ///
  ///
  ///
  /// AWS DMS supports `UniqueAccountIdentifier` in versions 3.1.4 and later.
  final String uniqueAccountIdentifier;

  DescribeAccountAttributesResponse({
    this.accountQuotas,
    this.uniqueAccountIdentifier,
  });
  static DescribeAccountAttributesResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeAccountAttributesResponse(
        accountQuotas: json.containsKey('AccountQuotas')
            ? (json['AccountQuotas'] as List)
                .map((e) => AccountQuota.fromJson(e))
                .toList()
            : null,
        uniqueAccountIdentifier: json.containsKey('UniqueAccountIdentifier')
            ? json['UniqueAccountIdentifier'] as String
            : null,
      );
}

class DescribeCertificatesResponse {
  /// The pagination token.
  final String marker;

  /// The Secure Sockets Layer (SSL) certificates associated with the
  /// replication instance.
  final List<Certificate> certificates;

  DescribeCertificatesResponse({
    this.marker,
    this.certificates,
  });
  static DescribeCertificatesResponse fromJson(Map<String, dynamic> json) =>
      DescribeCertificatesResponse(
        marker: json.containsKey('Marker') ? json['Marker'] as String : null,
        certificates: json.containsKey('Certificates')
            ? (json['Certificates'] as List)
                .map((e) => Certificate.fromJson(e))
                .toList()
            : null,
      );
}

class DescribeConnectionsResponse {
  ///  An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords`.
  final String marker;

  /// A description of the connections.
  final List<Connection> connections;

  DescribeConnectionsResponse({
    this.marker,
    this.connections,
  });
  static DescribeConnectionsResponse fromJson(Map<String, dynamic> json) =>
      DescribeConnectionsResponse(
        marker: json.containsKey('Marker') ? json['Marker'] as String : null,
        connections: json.containsKey('Connections')
            ? (json['Connections'] as List)
                .map((e) => Connection.fromJson(e))
                .toList()
            : null,
      );
}

class DescribeEndpointTypesResponse {
  ///  An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords`.
  final String marker;

  /// The types of endpoints that are supported.
  final List<SupportedEndpointType> supportedEndpointTypes;

  DescribeEndpointTypesResponse({
    this.marker,
    this.supportedEndpointTypes,
  });
  static DescribeEndpointTypesResponse fromJson(Map<String, dynamic> json) =>
      DescribeEndpointTypesResponse(
        marker: json.containsKey('Marker') ? json['Marker'] as String : null,
        supportedEndpointTypes: json.containsKey('SupportedEndpointTypes')
            ? (json['SupportedEndpointTypes'] as List)
                .map((e) => SupportedEndpointType.fromJson(e))
                .toList()
            : null,
      );
}

class DescribeEndpointsResponse {
  ///  An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords`.
  final String marker;

  /// Endpoint description.
  final List<Endpoint> endpoints;

  DescribeEndpointsResponse({
    this.marker,
    this.endpoints,
  });
  static DescribeEndpointsResponse fromJson(Map<String, dynamic> json) =>
      DescribeEndpointsResponse(
        marker: json.containsKey('Marker') ? json['Marker'] as String : null,
        endpoints: json.containsKey('Endpoints')
            ? (json['Endpoints'] as List)
                .map((e) => Endpoint.fromJson(e))
                .toList()
            : null,
      );
}

class DescribeEventCategoriesResponse {
  /// A list of event categories.
  final List<EventCategoryGroup> eventCategoryGroupList;

  DescribeEventCategoriesResponse({
    this.eventCategoryGroupList,
  });
  static DescribeEventCategoriesResponse fromJson(Map<String, dynamic> json) =>
      DescribeEventCategoriesResponse(
        eventCategoryGroupList: json.containsKey('EventCategoryGroupList')
            ? (json['EventCategoryGroupList'] as List)
                .map((e) => EventCategoryGroup.fromJson(e))
                .toList()
            : null,
      );
}

class DescribeEventSubscriptionsResponse {
  ///  An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords`.
  final String marker;

  /// A list of event subscriptions.
  final List<EventSubscription> eventSubscriptionsList;

  DescribeEventSubscriptionsResponse({
    this.marker,
    this.eventSubscriptionsList,
  });
  static DescribeEventSubscriptionsResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeEventSubscriptionsResponse(
        marker: json.containsKey('Marker') ? json['Marker'] as String : null,
        eventSubscriptionsList: json.containsKey('EventSubscriptionsList')
            ? (json['EventSubscriptionsList'] as List)
                .map((e) => EventSubscription.fromJson(e))
                .toList()
            : null,
      );
}

class DescribeEventsResponse {
  ///  An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords`.
  final String marker;

  /// The events described.
  final List<Event> events;

  DescribeEventsResponse({
    this.marker,
    this.events,
  });
  static DescribeEventsResponse fromJson(Map<String, dynamic> json) =>
      DescribeEventsResponse(
        marker: json.containsKey('Marker') ? json['Marker'] as String : null,
        events: json.containsKey('Events')
            ? (json['Events'] as List).map((e) => Event.fromJson(e)).toList()
            : null,
      );
}

class DescribeOrderableReplicationInstancesResponse {
  /// The order-able replication instances available.
  final List<OrderableReplicationInstance> orderableReplicationInstances;

  ///  An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords`.
  final String marker;

  DescribeOrderableReplicationInstancesResponse({
    this.orderableReplicationInstances,
    this.marker,
  });
  static DescribeOrderableReplicationInstancesResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeOrderableReplicationInstancesResponse(
        orderableReplicationInstances:
            json.containsKey('OrderableReplicationInstances')
                ? (json['OrderableReplicationInstances'] as List)
                    .map((e) => OrderableReplicationInstance.fromJson(e))
                    .toList()
                : null,
        marker: json.containsKey('Marker') ? json['Marker'] as String : null,
      );
}

class DescribePendingMaintenanceActionsResponse {
  /// The pending maintenance action.
  final List<ResourcePendingMaintenanceActions> pendingMaintenanceActions;

  ///  An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords`.
  final String marker;

  DescribePendingMaintenanceActionsResponse({
    this.pendingMaintenanceActions,
    this.marker,
  });
  static DescribePendingMaintenanceActionsResponse fromJson(
          Map<String, dynamic> json) =>
      DescribePendingMaintenanceActionsResponse(
        pendingMaintenanceActions: json.containsKey('PendingMaintenanceActions')
            ? (json['PendingMaintenanceActions'] as List)
                .map((e) => ResourcePendingMaintenanceActions.fromJson(e))
                .toList()
            : null,
        marker: json.containsKey('Marker') ? json['Marker'] as String : null,
      );
}

class DescribeRefreshSchemasStatusResponse {
  /// The status of the schema.
  final RefreshSchemasStatus refreshSchemasStatus;

  DescribeRefreshSchemasStatusResponse({
    this.refreshSchemasStatus,
  });
  static DescribeRefreshSchemasStatusResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeRefreshSchemasStatusResponse(
        refreshSchemasStatus: json.containsKey('RefreshSchemasStatus')
            ? RefreshSchemasStatus.fromJson(json['RefreshSchemasStatus'])
            : null,
      );
}

class DescribeReplicationInstanceTaskLogsResponse {
  /// The Amazon Resource Name (ARN) of the replication instance.
  final String replicationInstanceArn;

  /// An array of replication task log metadata. Each member of the array
  /// contains the replication task name, ARN, and task log size (in bytes).
  final List<ReplicationInstanceTaskLog> replicationInstanceTaskLogs;

  ///  An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords`.
  final String marker;

  DescribeReplicationInstanceTaskLogsResponse({
    this.replicationInstanceArn,
    this.replicationInstanceTaskLogs,
    this.marker,
  });
  static DescribeReplicationInstanceTaskLogsResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeReplicationInstanceTaskLogsResponse(
        replicationInstanceArn: json.containsKey('ReplicationInstanceArn')
            ? json['ReplicationInstanceArn'] as String
            : null,
        replicationInstanceTaskLogs:
            json.containsKey('ReplicationInstanceTaskLogs')
                ? (json['ReplicationInstanceTaskLogs'] as List)
                    .map((e) => ReplicationInstanceTaskLog.fromJson(e))
                    .toList()
                : null,
        marker: json.containsKey('Marker') ? json['Marker'] as String : null,
      );
}

class DescribeReplicationInstancesResponse {
  ///  An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords`.
  final String marker;

  /// The replication instances described.
  final List<ReplicationInstance> replicationInstances;

  DescribeReplicationInstancesResponse({
    this.marker,
    this.replicationInstances,
  });
  static DescribeReplicationInstancesResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeReplicationInstancesResponse(
        marker: json.containsKey('Marker') ? json['Marker'] as String : null,
        replicationInstances: json.containsKey('ReplicationInstances')
            ? (json['ReplicationInstances'] as List)
                .map((e) => ReplicationInstance.fromJson(e))
                .toList()
            : null,
      );
}

class DescribeReplicationSubnetGroupsResponse {
  ///  An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords`.
  final String marker;

  /// A description of the replication subnet groups.
  final List<ReplicationSubnetGroup> replicationSubnetGroups;

  DescribeReplicationSubnetGroupsResponse({
    this.marker,
    this.replicationSubnetGroups,
  });
  static DescribeReplicationSubnetGroupsResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeReplicationSubnetGroupsResponse(
        marker: json.containsKey('Marker') ? json['Marker'] as String : null,
        replicationSubnetGroups: json.containsKey('ReplicationSubnetGroups')
            ? (json['ReplicationSubnetGroups'] as List)
                .map((e) => ReplicationSubnetGroup.fromJson(e))
                .toList()
            : null,
      );
}

class DescribeReplicationTaskAssessmentResultsResponse {
  ///  An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords`.
  final String marker;

  /// - The Amazon S3 bucket where the task assessment report is located.
  final String bucketName;

  ///  The task assessment report.
  final List<ReplicationTaskAssessmentResult> replicationTaskAssessmentResults;

  DescribeReplicationTaskAssessmentResultsResponse({
    this.marker,
    this.bucketName,
    this.replicationTaskAssessmentResults,
  });
  static DescribeReplicationTaskAssessmentResultsResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeReplicationTaskAssessmentResultsResponse(
        marker: json.containsKey('Marker') ? json['Marker'] as String : null,
        bucketName: json.containsKey('BucketName')
            ? json['BucketName'] as String
            : null,
        replicationTaskAssessmentResults:
            json.containsKey('ReplicationTaskAssessmentResults')
                ? (json['ReplicationTaskAssessmentResults'] as List)
                    .map((e) => ReplicationTaskAssessmentResult.fromJson(e))
                    .toList()
                : null,
      );
}

class DescribeReplicationTasksResponse {
  ///  An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords`.
  final String marker;

  /// A description of the replication tasks.
  final List<ReplicationTask> replicationTasks;

  DescribeReplicationTasksResponse({
    this.marker,
    this.replicationTasks,
  });
  static DescribeReplicationTasksResponse fromJson(Map<String, dynamic> json) =>
      DescribeReplicationTasksResponse(
        marker: json.containsKey('Marker') ? json['Marker'] as String : null,
        replicationTasks: json.containsKey('ReplicationTasks')
            ? (json['ReplicationTasks'] as List)
                .map((e) => ReplicationTask.fromJson(e))
                .toList()
            : null,
      );
}

class DescribeSchemasResponse {
  ///  An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords`.
  final String marker;

  /// The described schema.
  final List<String> schemas;

  DescribeSchemasResponse({
    this.marker,
    this.schemas,
  });
  static DescribeSchemasResponse fromJson(Map<String, dynamic> json) =>
      DescribeSchemasResponse(
        marker: json.containsKey('Marker') ? json['Marker'] as String : null,
        schemas: json.containsKey('Schemas')
            ? (json['Schemas'] as List).map((e) => e as String).toList()
            : null,
      );
}

class DescribeTableStatisticsResponse {
  /// The Amazon Resource Name (ARN) of the replication task.
  final String replicationTaskArn;

  /// The table statistics.
  final List<TableStatistics> tableStatistics;

  ///  An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// marker, up to the value specified by `MaxRecords`.
  final String marker;

  DescribeTableStatisticsResponse({
    this.replicationTaskArn,
    this.tableStatistics,
    this.marker,
  });
  static DescribeTableStatisticsResponse fromJson(Map<String, dynamic> json) =>
      DescribeTableStatisticsResponse(
        replicationTaskArn: json.containsKey('ReplicationTaskArn')
            ? json['ReplicationTaskArn'] as String
            : null,
        tableStatistics: json.containsKey('TableStatistics')
            ? (json['TableStatistics'] as List)
                .map((e) => TableStatistics.fromJson(e))
                .toList()
            : null,
        marker: json.containsKey('Marker') ? json['Marker'] as String : null,
      );
}

///  The settings in JSON format for the DMS Transfer type source endpoint.
class DmsTransferSettings {
  ///  The IAM role that has permission to access the Amazon S3 bucket.
  final String serviceAccessRoleArn;

  ///  The name of the S3 bucket to use.
  final String bucketName;

  DmsTransferSettings({
    this.serviceAccessRoleArn,
    this.bucketName,
  });
  static DmsTransferSettings fromJson(Map<String, dynamic> json) =>
      DmsTransferSettings(
        serviceAccessRoleArn: json.containsKey('ServiceAccessRoleArn')
            ? json['ServiceAccessRoleArn'] as String
            : null,
        bucketName: json.containsKey('BucketName')
            ? json['BucketName'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class DynamoDbSettings {
  ///  The Amazon Resource Name (ARN) used by the service access IAM role.
  final String serviceAccessRoleArn;

  DynamoDbSettings({
    @required this.serviceAccessRoleArn,
  });
  static DynamoDbSettings fromJson(Map<String, dynamic> json) =>
      DynamoDbSettings(
        serviceAccessRoleArn: json['ServiceAccessRoleArn'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class ElasticsearchSettings {
  /// The Amazon Resource Name (ARN) used by service to access the IAM role.
  final String serviceAccessRoleArn;

  /// The endpoint for the Elasticsearch cluster.
  final String endpointUri;

  /// The maximum percentage of records that can fail to be written before a
  /// full load operation stops.
  final int fullLoadErrorPercentage;

  /// The maximum number of seconds that DMS retries failed API requests to the
  /// Elasticsearch cluster.
  final int errorRetryDuration;

  ElasticsearchSettings({
    @required this.serviceAccessRoleArn,
    @required this.endpointUri,
    this.fullLoadErrorPercentage,
    this.errorRetryDuration,
  });
  static ElasticsearchSettings fromJson(Map<String, dynamic> json) =>
      ElasticsearchSettings(
        serviceAccessRoleArn: json['ServiceAccessRoleArn'] as String,
        endpointUri: json['EndpointUri'] as String,
        fullLoadErrorPercentage: json.containsKey('FullLoadErrorPercentage')
            ? json['FullLoadErrorPercentage'] as int
            : null,
        errorRetryDuration: json.containsKey('ErrorRetryDuration')
            ? json['ErrorRetryDuration'] as int
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class Endpoint {
  /// The database endpoint identifier. Identifiers must begin with a letter;
  /// must contain only ASCII letters, digits, and hyphens; and must not end
  /// with a hyphen or contain two consecutive hyphens.
  final String endpointIdentifier;

  /// The type of endpoint. Valid values are `source` and `target`.
  final String endpointType;

  /// The database engine name. Valid values, depending on the EndpointType,
  /// include mysql, oracle, postgres, mariadb, aurora, aurora-postgresql,
  /// redshift, s3, db2, azuredb, sybase, dynamodb, mongodb, and sqlserver.
  final String engineName;

  /// The expanded name for the engine name. For example, if the `EngineName`
  /// parameter is "aurora," this value would be "Amazon Aurora MySQL."
  final String engineDisplayName;

  /// The user name used to connect to the endpoint.
  final String username;

  /// The name of the server at the endpoint.
  final String serverName;

  /// The port value used to access the endpoint.
  final int port;

  /// The name of the database at the endpoint.
  final String databaseName;

  /// Additional connection attributes used to connect to the endpoint.
  final String extraConnectionAttributes;

  /// The status of the endpoint.
  final String status;

  /// An AWS KMS key identifier that is used to encrypt the connection
  /// parameters for the endpoint.
  ///
  /// If you don't specify a value for the `KmsKeyId` parameter, then AWS DMS
  /// uses your default encryption key.
  ///
  /// AWS KMS creates the default encryption key for your AWS account. Your AWS
  /// account has a different default encryption key for each AWS Region.
  final String kmsKeyId;

  /// The Amazon Resource Name (ARN) string that uniquely identifies the
  /// endpoint.
  final String endpointArn;

  /// The Amazon Resource Name (ARN) used for SSL connection to the endpoint.
  final String certificateArn;

  /// The SSL mode used to connect to the endpoint. The default value is `none`.
  final String sslMode;

  /// The Amazon Resource Name (ARN) used by the service access IAM role.
  final String serviceAccessRoleArn;

  /// The external table definition.
  final String externalTableDefinition;

  ///  Value returned by a call to CreateEndpoint that can be used for
  /// cross-account validation. Use it on a subsequent call to CreateEndpoint to
  /// create the endpoint with a cross-account.
  final String externalId;

  /// The settings for the target DynamoDB database. For more information, see
  /// the `DynamoDBSettings` structure.
  final DynamoDbSettings dynamoDbSettings;

  /// The settings for the S3 target endpoint. For more information, see the
  /// `S3Settings` structure.
  final S3Settings s3Settings;

  /// The settings in JSON format for the DMS transfer type of source endpoint.
  ///
  /// Possible attributes include the following:
  ///
  /// *    `serviceAccessRoleArn` - The IAM role that has permission to access
  /// the Amazon S3 bucket.
  ///
  /// *    `bucketName` - The name of the S3 bucket to use.
  ///
  /// *    `compressionType` - An optional parameter to use GZIP to compress the
  /// target files. To use GZIP, set this value to `NONE` (the default). To keep
  /// the files uncompressed, don't use this value.
  ///
  ///
  /// Shorthand syntax for these attributes is as follows:
  /// `ServiceAccessRoleArn=string,BucketName=string,CompressionType=string`
  ///
  /// JSON syntax for these attributes is as follows: `{ "ServiceAccessRoleArn":
  /// "string", "BucketName": "string", "CompressionType": "none"|"gzip" }`
  final DmsTransferSettings dmsTransferSettings;

  /// The settings for the MongoDB source endpoint. For more information, see
  /// the `MongoDbSettings` structure.
  final MongoDbSettings mongoDbSettings;

  /// The settings for the Amazon Kinesis source endpoint. For more information,
  /// see the `KinesisSettings` structure.
  final KinesisSettings kinesisSettings;

  /// The settings for the Elasticsearch source endpoint. For more information,
  /// see the `ElasticsearchSettings` structure.
  final ElasticsearchSettings elasticsearchSettings;

  /// Settings for the Amazon Redshift endpoint.
  final RedshiftSettings redshiftSettings;

  Endpoint({
    this.endpointIdentifier,
    this.endpointType,
    this.engineName,
    this.engineDisplayName,
    this.username,
    this.serverName,
    this.port,
    this.databaseName,
    this.extraConnectionAttributes,
    this.status,
    this.kmsKeyId,
    this.endpointArn,
    this.certificateArn,
    this.sslMode,
    this.serviceAccessRoleArn,
    this.externalTableDefinition,
    this.externalId,
    this.dynamoDbSettings,
    this.s3Settings,
    this.dmsTransferSettings,
    this.mongoDbSettings,
    this.kinesisSettings,
    this.elasticsearchSettings,
    this.redshiftSettings,
  });
  static Endpoint fromJson(Map<String, dynamic> json) => Endpoint(
        endpointIdentifier: json.containsKey('EndpointIdentifier')
            ? json['EndpointIdentifier'] as String
            : null,
        endpointType: json.containsKey('EndpointType')
            ? json['EndpointType'] as String
            : null,
        engineName: json.containsKey('EngineName')
            ? json['EngineName'] as String
            : null,
        engineDisplayName: json.containsKey('EngineDisplayName')
            ? json['EngineDisplayName'] as String
            : null,
        username:
            json.containsKey('Username') ? json['Username'] as String : null,
        serverName: json.containsKey('ServerName')
            ? json['ServerName'] as String
            : null,
        port: json.containsKey('Port') ? json['Port'] as int : null,
        databaseName: json.containsKey('DatabaseName')
            ? json['DatabaseName'] as String
            : null,
        extraConnectionAttributes: json.containsKey('ExtraConnectionAttributes')
            ? json['ExtraConnectionAttributes'] as String
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        kmsKeyId:
            json.containsKey('KmsKeyId') ? json['KmsKeyId'] as String : null,
        endpointArn: json.containsKey('EndpointArn')
            ? json['EndpointArn'] as String
            : null,
        certificateArn: json.containsKey('CertificateArn')
            ? json['CertificateArn'] as String
            : null,
        sslMode: json.containsKey('SslMode') ? json['SslMode'] as String : null,
        serviceAccessRoleArn: json.containsKey('ServiceAccessRoleArn')
            ? json['ServiceAccessRoleArn'] as String
            : null,
        externalTableDefinition: json.containsKey('ExternalTableDefinition')
            ? json['ExternalTableDefinition'] as String
            : null,
        externalId: json.containsKey('ExternalId')
            ? json['ExternalId'] as String
            : null,
        dynamoDbSettings: json.containsKey('DynamoDbSettings')
            ? DynamoDbSettings.fromJson(json['DynamoDbSettings'])
            : null,
        s3Settings: json.containsKey('S3Settings')
            ? S3Settings.fromJson(json['S3Settings'])
            : null,
        dmsTransferSettings: json.containsKey('DmsTransferSettings')
            ? DmsTransferSettings.fromJson(json['DmsTransferSettings'])
            : null,
        mongoDbSettings: json.containsKey('MongoDbSettings')
            ? MongoDbSettings.fromJson(json['MongoDbSettings'])
            : null,
        kinesisSettings: json.containsKey('KinesisSettings')
            ? KinesisSettings.fromJson(json['KinesisSettings'])
            : null,
        elasticsearchSettings: json.containsKey('ElasticsearchSettings')
            ? ElasticsearchSettings.fromJson(json['ElasticsearchSettings'])
            : null,
        redshiftSettings: json.containsKey('RedshiftSettings')
            ? RedshiftSettings.fromJson(json['RedshiftSettings'])
            : null,
      );
}

class Event {
  ///  The identifier of an event source.
  final String sourceIdentifier;

  ///  The type of AWS DMS resource that generates events.
  ///
  /// Valid values: replication-instance | endpoint | replication-task
  final String sourceType;

  /// The event message.
  final String message;

  /// The event categories available for the specified source type.
  final List<String> eventCategories;

  /// The date of the event.
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

class EventCategoryGroup {
  ///  The type of AWS DMS resource that generates events.
  ///
  /// Valid values: replication-instance | replication-server | security-group |
  /// replication-task
  final String sourceType;

  ///  A list of event categories from a source type that you've chosen.
  final List<String> eventCategories;

  EventCategoryGroup({
    this.sourceType,
    this.eventCategories,
  });
  static EventCategoryGroup fromJson(Map<String, dynamic> json) =>
      EventCategoryGroup(
        sourceType: json.containsKey('SourceType')
            ? json['SourceType'] as String
            : null,
        eventCategories: json.containsKey('EventCategories')
            ? (json['EventCategories'] as List).map((e) => e as String).toList()
            : null,
      );
}

class EventSubscription {
  /// The AWS customer account associated with the AWS DMS event notification
  /// subscription.
  final String customerAwsId;

  /// The AWS DMS event notification subscription Id.
  final String custSubscriptionId;

  /// The topic ARN of the AWS DMS event notification subscription.
  final String snsTopicArn;

  /// The status of the AWS DMS event notification subscription.
  ///
  /// Constraints:
  ///
  /// Can be one of the following: creating | modifying | deleting | active |
  /// no-permission | topic-not-exist
  ///
  /// The status "no-permission" indicates that AWS DMS no longer has permission
  /// to post to the SNS topic. The status "topic-not-exist" indicates that the
  /// topic was deleted after the subscription was created.
  final String status;

  /// The time the RDS event notification subscription was created.
  final String subscriptionCreationTime;

  ///  The type of AWS DMS resource that generates events.
  ///
  /// Valid values: replication-instance | replication-server | security-group |
  /// replication-task
  final String sourceType;

  /// A list of source Ids for the event subscription.
  final List<String> sourceIdsList;

  /// A lists of event categories.
  final List<String> eventCategoriesList;

  /// Boolean value that indicates if the event subscription is enabled.
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

class Filter {
  /// The name of the filter.
  final String name;

  /// The filter value.
  final List<String> values;

  Filter({
    @required this.name,
    @required this.values,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class ImportCertificateResponse {
  /// The certificate to be uploaded.
  final Certificate certificate;

  ImportCertificateResponse({
    this.certificate,
  });
  static ImportCertificateResponse fromJson(Map<String, dynamic> json) =>
      ImportCertificateResponse(
        certificate: json.containsKey('Certificate')
            ? Certificate.fromJson(json['Certificate'])
            : null,
      );
}

class KinesisSettings {
  /// The Amazon Resource Name (ARN) for the Amazon Kinesis Data Streams
  /// endpoint.
  final String streamArn;

  /// The output format for the records created on the endpoint. The message
  /// format is `JSON`.
  final String messageFormat;

  /// The Amazon Resource Name (ARN) for the IAM role that DMS uses to write to
  /// the Amazon Kinesis data stream.
  final String serviceAccessRoleArn;

  KinesisSettings({
    this.streamArn,
    this.messageFormat,
    this.serviceAccessRoleArn,
  });
  static KinesisSettings fromJson(Map<String, dynamic> json) => KinesisSettings(
        streamArn:
            json.containsKey('StreamArn') ? json['StreamArn'] as String : null,
        messageFormat: json.containsKey('MessageFormat')
            ? json['MessageFormat'] as String
            : null,
        serviceAccessRoleArn: json.containsKey('ServiceAccessRoleArn')
            ? json['ServiceAccessRoleArn'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class ListTagsForResourceResponse {
  /// A list of tags for the resource.
  final List<Tag> tagList;

  ListTagsForResourceResponse({
    this.tagList,
  });
  static ListTagsForResourceResponse fromJson(Map<String, dynamic> json) =>
      ListTagsForResourceResponse(
        tagList: json.containsKey('TagList')
            ? (json['TagList'] as List).map((e) => Tag.fromJson(e)).toList()
            : null,
      );
}

class ModifyEndpointResponse {
  /// The modified endpoint.
  final Endpoint endpoint;

  ModifyEndpointResponse({
    this.endpoint,
  });
  static ModifyEndpointResponse fromJson(Map<String, dynamic> json) =>
      ModifyEndpointResponse(
        endpoint: json.containsKey('Endpoint')
            ? Endpoint.fromJson(json['Endpoint'])
            : null,
      );
}

class ModifyEventSubscriptionResponse {
  /// The modified event subscription.
  final EventSubscription eventSubscription;

  ModifyEventSubscriptionResponse({
    this.eventSubscription,
  });
  static ModifyEventSubscriptionResponse fromJson(Map<String, dynamic> json) =>
      ModifyEventSubscriptionResponse(
        eventSubscription: json.containsKey('EventSubscription')
            ? EventSubscription.fromJson(json['EventSubscription'])
            : null,
      );
}

class ModifyReplicationInstanceResponse {
  /// The modified replication instance.
  final ReplicationInstance replicationInstance;

  ModifyReplicationInstanceResponse({
    this.replicationInstance,
  });
  static ModifyReplicationInstanceResponse fromJson(
          Map<String, dynamic> json) =>
      ModifyReplicationInstanceResponse(
        replicationInstance: json.containsKey('ReplicationInstance')
            ? ReplicationInstance.fromJson(json['ReplicationInstance'])
            : null,
      );
}

class ModifyReplicationSubnetGroupResponse {
  /// The modified replication subnet group.
  final ReplicationSubnetGroup replicationSubnetGroup;

  ModifyReplicationSubnetGroupResponse({
    this.replicationSubnetGroup,
  });
  static ModifyReplicationSubnetGroupResponse fromJson(
          Map<String, dynamic> json) =>
      ModifyReplicationSubnetGroupResponse(
        replicationSubnetGroup: json.containsKey('ReplicationSubnetGroup')
            ? ReplicationSubnetGroup.fromJson(json['ReplicationSubnetGroup'])
            : null,
      );
}

class ModifyReplicationTaskResponse {
  /// The replication task that was modified.
  final ReplicationTask replicationTask;

  ModifyReplicationTaskResponse({
    this.replicationTask,
  });
  static ModifyReplicationTaskResponse fromJson(Map<String, dynamic> json) =>
      ModifyReplicationTaskResponse(
        replicationTask: json.containsKey('ReplicationTask')
            ? ReplicationTask.fromJson(json['ReplicationTask'])
            : null,
      );
}

class MongoDbSettings {
  /// The user name you use to access the MongoDB source endpoint.
  final String username;

  ///  The password for the user account you use to access the MongoDB source
  /// endpoint.
  final String password;

  ///  The name of the server on the MongoDB source endpoint.
  final String serverName;

  ///  The port value for the MongoDB source endpoint.
  final int port;

  ///  The database name on the MongoDB source endpoint.
  final String databaseName;

  ///  The authentication type you use to access the MongoDB source endpoint.
  ///
  /// Valid values: NO, PASSWORD
  ///
  /// When NO is selected, user name and password parameters are not used and
  /// can be empty.
  final String authType;

  ///  The authentication mechanism you use to access the MongoDB source
  /// endpoint.
  ///
  /// Valid values: DEFAULT, MONGODB_CR, SCRAM_SHA_1
  ///
  /// DEFAULT – For MongoDB version 2.x, use MONGODB_CR. For MongoDB version
  /// 3.x, use SCRAM_SHA_1. This attribute is not used when authType=No.
  final String authMechanism;

  ///  Specifies either document or table mode.
  ///
  /// Valid values: NONE, ONE
  ///
  /// Default value is NONE. Specify NONE to use document mode. Specify ONE to
  /// use table mode.
  final String nestingLevel;

  ///  Specifies the document ID. Use this attribute when `NestingLevel` is set
  /// to NONE.
  ///
  /// Default value is false.
  final String extractDocId;

  ///  Indicates the number of documents to preview to determine the document
  /// organization. Use this attribute when `NestingLevel` is set to ONE.
  ///
  /// Must be a positive value greater than 0. Default value is 1000.
  final String docsToInvestigate;

  ///  The MongoDB database name. This attribute is not used when `authType=NO`.
  ///
  /// The default is admin.
  final String authSource;

  /// The AWS KMS key identifier that is used to encrypt the content on the
  /// replication instance. If you don't specify a value for the `KmsKeyId`
  /// parameter, then AWS DMS uses your default encryption key. AWS KMS creates
  /// the default encryption key for your AWS account. Your AWS account has a
  /// different default encryption key for each AWS Region.
  final String kmsKeyId;

  MongoDbSettings({
    this.username,
    this.password,
    this.serverName,
    this.port,
    this.databaseName,
    this.authType,
    this.authMechanism,
    this.nestingLevel,
    this.extractDocId,
    this.docsToInvestigate,
    this.authSource,
    this.kmsKeyId,
  });
  static MongoDbSettings fromJson(Map<String, dynamic> json) => MongoDbSettings(
        username:
            json.containsKey('Username') ? json['Username'] as String : null,
        password:
            json.containsKey('Password') ? json['Password'] as String : null,
        serverName: json.containsKey('ServerName')
            ? json['ServerName'] as String
            : null,
        port: json.containsKey('Port') ? json['Port'] as int : null,
        databaseName: json.containsKey('DatabaseName')
            ? json['DatabaseName'] as String
            : null,
        authType:
            json.containsKey('AuthType') ? json['AuthType'] as String : null,
        authMechanism: json.containsKey('AuthMechanism')
            ? json['AuthMechanism'] as String
            : null,
        nestingLevel: json.containsKey('NestingLevel')
            ? json['NestingLevel'] as String
            : null,
        extractDocId: json.containsKey('ExtractDocId')
            ? json['ExtractDocId'] as String
            : null,
        docsToInvestigate: json.containsKey('DocsToInvestigate')
            ? json['DocsToInvestigate'] as String
            : null,
        authSource: json.containsKey('AuthSource')
            ? json['AuthSource'] as String
            : null,
        kmsKeyId:
            json.containsKey('KmsKeyId') ? json['KmsKeyId'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class OrderableReplicationInstance {
  /// The version of the replication engine.
  final String engineVersion;

  /// The compute and memory capacity of the replication instance.
  ///
  ///  Valid Values: `dms.t2.micro | dms.t2.small | dms.t2.medium | dms.t2.large
  /// | dms.c4.large | dms.c4.xlarge | dms.c4.2xlarge | dms.c4.4xlarge`
  final String replicationInstanceClass;

  /// The type of storage used by the replication instance.
  final String storageType;

  /// The minimum amount of storage (in gigabytes) that can be allocated for the
  /// replication instance.
  final int minAllocatedStorage;

  /// The minimum amount of storage (in gigabytes) that can be allocated for the
  /// replication instance.
  final int maxAllocatedStorage;

  /// The default amount of storage (in gigabytes) that is allocated for the
  /// replication instance.
  final int defaultAllocatedStorage;

  /// The amount of storage (in gigabytes) that is allocated for the replication
  /// instance.
  final int includedAllocatedStorage;

  /// List of Availability Zones for this replication instance.
  final List<String> availabilityZones;

  /// The value returned when the specified `EngineVersion` of the replication
  /// instance is in Beta or test mode. This indicates some features might not
  /// work as expected.
  ///
  ///
  ///
  /// AWS DMS supports `ReleaseStatus` in versions 3.1.4 and later.
  final String releaseStatus;

  OrderableReplicationInstance({
    this.engineVersion,
    this.replicationInstanceClass,
    this.storageType,
    this.minAllocatedStorage,
    this.maxAllocatedStorage,
    this.defaultAllocatedStorage,
    this.includedAllocatedStorage,
    this.availabilityZones,
    this.releaseStatus,
  });
  static OrderableReplicationInstance fromJson(Map<String, dynamic> json) =>
      OrderableReplicationInstance(
        engineVersion: json.containsKey('EngineVersion')
            ? json['EngineVersion'] as String
            : null,
        replicationInstanceClass: json.containsKey('ReplicationInstanceClass')
            ? json['ReplicationInstanceClass'] as String
            : null,
        storageType: json.containsKey('StorageType')
            ? json['StorageType'] as String
            : null,
        minAllocatedStorage: json.containsKey('MinAllocatedStorage')
            ? json['MinAllocatedStorage'] as int
            : null,
        maxAllocatedStorage: json.containsKey('MaxAllocatedStorage')
            ? json['MaxAllocatedStorage'] as int
            : null,
        defaultAllocatedStorage: json.containsKey('DefaultAllocatedStorage')
            ? json['DefaultAllocatedStorage'] as int
            : null,
        includedAllocatedStorage: json.containsKey('IncludedAllocatedStorage')
            ? json['IncludedAllocatedStorage'] as int
            : null,
        availabilityZones: json.containsKey('AvailabilityZones')
            ? (json['AvailabilityZones'] as List)
                .map((e) => e as String)
                .toList()
            : null,
        releaseStatus: json.containsKey('ReleaseStatus')
            ? json['ReleaseStatus'] as String
            : null,
      );
}

class PendingMaintenanceAction {
  /// The type of pending maintenance action that is available for the resource.
  final String action;

  /// The date of the maintenance window when the action will be applied. The
  /// maintenance action will be applied to the resource during its first
  /// maintenance window after this date. If this date is specified, any
  /// `next-maintenance` opt-in requests are ignored.
  final DateTime autoAppliedAfterDate;

  /// The date when the maintenance action will be automatically applied. The
  /// maintenance action will be applied to the resource on this date regardless
  /// of the maintenance window for the resource. If this date is specified, any
  /// `immediate` opt-in requests are ignored.
  final DateTime forcedApplyDate;

  /// Indicates the type of opt-in request that has been received for the
  /// resource.
  final String optInStatus;

  /// The effective date when the pending maintenance action will be applied to
  /// the resource. This date takes into account opt-in requests received from
  /// the `ApplyPendingMaintenanceAction` API, the `AutoAppliedAfterDate`, and
  /// the `ForcedApplyDate`. This value is blank if an opt-in request has not
  /// been received and nothing has been specified as `AutoAppliedAfterDate` or
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

class RebootReplicationInstanceResponse {
  /// The replication instance that is being rebooted.
  final ReplicationInstance replicationInstance;

  RebootReplicationInstanceResponse({
    this.replicationInstance,
  });
  static RebootReplicationInstanceResponse fromJson(
          Map<String, dynamic> json) =>
      RebootReplicationInstanceResponse(
        replicationInstance: json.containsKey('ReplicationInstance')
            ? ReplicationInstance.fromJson(json['ReplicationInstance'])
            : null,
      );
}

class RedshiftSettings {
  /// A value that indicates to allow any date format, including invalid formats
  /// such as 00/00/00 00:00:00, to be loaded without generating an error. You
  /// can choose `true` or `false` (the default).
  ///
  /// This parameter applies only to TIMESTAMP and DATE columns. Always use
  /// ACCEPTANYDATE with the DATEFORMAT parameter. If the date format for the
  /// data doesn't match the DATEFORMAT specification, Amazon Redshift inserts a
  /// NULL value into that field.
  final bool acceptAnyDate;

  /// Code to run after connecting. This parameter should contain the code
  /// itself, not the name of a file containing the code.
  final String afterConnectScript;

  /// The location where the comma-separated value (.csv) files are stored
  /// before being uploaded to the S3 bucket.
  final String bucketFolder;

  /// The name of the S3 bucket you want to use
  final String bucketName;

  /// A value that sets the amount of time to wait (in milliseconds) before
  /// timing out, beginning from when you initially establish a connection.
  final int connectionTimeout;

  /// The name of the Amazon Redshift data warehouse (service) that you are
  /// working with.
  final String databaseName;

  /// The date format that you are using. Valid values are `auto`
  /// (case-sensitive), your date format string enclosed in quotes, or NULL. If
  /// this parameter is left unset (NULL), it defaults to a format of
  /// 'YYYY-MM-DD'. Using `auto` recognizes most strings, even some that aren't
  /// supported when you use a date format string.
  ///
  /// If your date and time values use formats different from each other, set
  /// this to `auto`.
  final String dateFormat;

  /// A value that specifies whether AWS DMS should migrate empty CHAR and
  /// VARCHAR fields as NULL. A value of `true` sets empty CHAR and VARCHAR
  /// fields to null. The default is `false`.
  final bool emptyAsNull;

  /// The type of server-side encryption that you want to use for your data.
  /// This encryption type is part of the endpoint settings or the extra
  /// connections attributes for Amazon S3. You can choose either `SSE_S3` (the
  /// default) or `SSE_KMS`. To use `SSE_S3`, create an AWS Identity and Access
  /// Management (IAM) role with a policy that allows `"arn:aws:s3:::*"` to use
  /// the following actions: `"s3:PutObject", "s3:ListBucket"`
  final String encryptionMode;

  /// The number of threads used to upload a single file. This parameter accepts
  /// a value from 1 through 64. It defaults to 10.
  final int fileTransferUploadStreams;

  /// The amount of time to wait (in milliseconds) before timing out, beginning
  /// from when you begin loading.
  final int loadTimeout;

  /// The maximum size (in KB) of any .csv file used to transfer data to Amazon
  /// Redshift. This accepts a value from 1 through 1,048,576. It defaults to
  /// 32,768 KB (32 MB).
  final int maxFileSize;

  /// The password for the user named in the `username` property.
  final String password;

  /// The port number for Amazon Redshift. The default value is 5439.
  final int port;

  /// A value that specifies to remove surrounding quotation marks from strings
  /// in the incoming data. All characters within the quotation marks, including
  /// delimiters, are retained. Choose `true` to remove quotation marks. The
  /// default is `false`.
  final bool removeQuotes;

  /// A list of characters that you want to replace. Use with `ReplaceChars`.
  final String replaceInvalidChars;

  /// A value that specifies to replaces the invalid characters specified in
  /// `ReplaceInvalidChars`, substituting the specified characters instead. The
  /// default is `"?"`.
  final String replaceChars;

  /// The name of the Amazon Redshift cluster you are using.
  final String serverName;

  /// The Amazon Resource Name (ARN) of the IAM role that has access to the
  /// Amazon Redshift service.
  final String serviceAccessRoleArn;

  /// The AWS KMS key ID. If you are using `SSE_KMS` for the `EncryptionMode`,
  /// provide this key ID. The key that you use needs an attached policy that
  /// enables IAM user permissions and allows use of the key.
  final String serverSideEncryptionKmsKeyId;

  /// The time format that you want to use. Valid values are `auto`
  /// (case-sensitive), `'timeformat_string'`, `'epochsecs'`, or
  /// `'epochmillisecs'`. It defaults to 10. Using `auto` recognizes most
  /// strings, even some that aren't supported when you use a time format
  /// string.
  ///
  /// If your date and time values use formats different from each other, set
  /// this parameter to `auto`.
  final String timeFormat;

  /// A value that specifies to remove the trailing white space characters from
  /// a VARCHAR string. This parameter applies only to columns with a VARCHAR
  /// data type. Choose `true` to remove unneeded white space. The default is
  /// `false`.
  final bool trimBlanks;

  /// A value that specifies to truncate data in columns to the appropriate
  /// number of characters, so that the data fits in the column. This parameter
  /// applies only to columns with a VARCHAR or CHAR data type, and rows with a
  /// size of 4 MB or less. Choose `true` to truncate data. The default is
  /// `false`.
  final bool truncateColumns;

  /// An Amazon Redshift user name for a registered user.
  final String username;

  /// The size of the write buffer to use in rows. Valid values range from 1
  /// through 2,048. The default is 1,024. Use this setting to tune performance.
  final int writeBufferSize;

  RedshiftSettings({
    this.acceptAnyDate,
    this.afterConnectScript,
    this.bucketFolder,
    this.bucketName,
    this.connectionTimeout,
    this.databaseName,
    this.dateFormat,
    this.emptyAsNull,
    this.encryptionMode,
    this.fileTransferUploadStreams,
    this.loadTimeout,
    this.maxFileSize,
    this.password,
    this.port,
    this.removeQuotes,
    this.replaceInvalidChars,
    this.replaceChars,
    this.serverName,
    this.serviceAccessRoleArn,
    this.serverSideEncryptionKmsKeyId,
    this.timeFormat,
    this.trimBlanks,
    this.truncateColumns,
    this.username,
    this.writeBufferSize,
  });
  static RedshiftSettings fromJson(Map<String, dynamic> json) =>
      RedshiftSettings(
        acceptAnyDate: json.containsKey('AcceptAnyDate')
            ? json['AcceptAnyDate'] as bool
            : null,
        afterConnectScript: json.containsKey('AfterConnectScript')
            ? json['AfterConnectScript'] as String
            : null,
        bucketFolder: json.containsKey('BucketFolder')
            ? json['BucketFolder'] as String
            : null,
        bucketName: json.containsKey('BucketName')
            ? json['BucketName'] as String
            : null,
        connectionTimeout: json.containsKey('ConnectionTimeout')
            ? json['ConnectionTimeout'] as int
            : null,
        databaseName: json.containsKey('DatabaseName')
            ? json['DatabaseName'] as String
            : null,
        dateFormat: json.containsKey('DateFormat')
            ? json['DateFormat'] as String
            : null,
        emptyAsNull: json.containsKey('EmptyAsNull')
            ? json['EmptyAsNull'] as bool
            : null,
        encryptionMode: json.containsKey('EncryptionMode')
            ? json['EncryptionMode'] as String
            : null,
        fileTransferUploadStreams: json.containsKey('FileTransferUploadStreams')
            ? json['FileTransferUploadStreams'] as int
            : null,
        loadTimeout:
            json.containsKey('LoadTimeout') ? json['LoadTimeout'] as int : null,
        maxFileSize:
            json.containsKey('MaxFileSize') ? json['MaxFileSize'] as int : null,
        password:
            json.containsKey('Password') ? json['Password'] as String : null,
        port: json.containsKey('Port') ? json['Port'] as int : null,
        removeQuotes: json.containsKey('RemoveQuotes')
            ? json['RemoveQuotes'] as bool
            : null,
        replaceInvalidChars: json.containsKey('ReplaceInvalidChars')
            ? json['ReplaceInvalidChars'] as String
            : null,
        replaceChars: json.containsKey('ReplaceChars')
            ? json['ReplaceChars'] as String
            : null,
        serverName: json.containsKey('ServerName')
            ? json['ServerName'] as String
            : null,
        serviceAccessRoleArn: json.containsKey('ServiceAccessRoleArn')
            ? json['ServiceAccessRoleArn'] as String
            : null,
        serverSideEncryptionKmsKeyId:
            json.containsKey('ServerSideEncryptionKmsKeyId')
                ? json['ServerSideEncryptionKmsKeyId'] as String
                : null,
        timeFormat: json.containsKey('TimeFormat')
            ? json['TimeFormat'] as String
            : null,
        trimBlanks:
            json.containsKey('TrimBlanks') ? json['TrimBlanks'] as bool : null,
        truncateColumns: json.containsKey('TruncateColumns')
            ? json['TruncateColumns'] as bool
            : null,
        username:
            json.containsKey('Username') ? json['Username'] as String : null,
        writeBufferSize: json.containsKey('WriteBufferSize')
            ? json['WriteBufferSize'] as int
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class RefreshSchemasResponse {
  /// The status of the refreshed schema.
  final RefreshSchemasStatus refreshSchemasStatus;

  RefreshSchemasResponse({
    this.refreshSchemasStatus,
  });
  static RefreshSchemasResponse fromJson(Map<String, dynamic> json) =>
      RefreshSchemasResponse(
        refreshSchemasStatus: json.containsKey('RefreshSchemasStatus')
            ? RefreshSchemasStatus.fromJson(json['RefreshSchemasStatus'])
            : null,
      );
}

class RefreshSchemasStatus {
  /// The Amazon Resource Name (ARN) string that uniquely identifies the
  /// endpoint.
  final String endpointArn;

  /// The Amazon Resource Name (ARN) of the replication instance.
  final String replicationInstanceArn;

  /// The status of the schema.
  final String status;

  /// The date the schema was last refreshed.
  final DateTime lastRefreshDate;

  /// The last failure message for the schema.
  final String lastFailureMessage;

  RefreshSchemasStatus({
    this.endpointArn,
    this.replicationInstanceArn,
    this.status,
    this.lastRefreshDate,
    this.lastFailureMessage,
  });
  static RefreshSchemasStatus fromJson(Map<String, dynamic> json) =>
      RefreshSchemasStatus(
        endpointArn: json.containsKey('EndpointArn')
            ? json['EndpointArn'] as String
            : null,
        replicationInstanceArn: json.containsKey('ReplicationInstanceArn')
            ? json['ReplicationInstanceArn'] as String
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        lastRefreshDate: json.containsKey('LastRefreshDate')
            ? DateTime.parse(json['LastRefreshDate'])
            : null,
        lastFailureMessage: json.containsKey('LastFailureMessage')
            ? json['LastFailureMessage'] as String
            : null,
      );
}

class ReloadTablesResponse {
  /// The Amazon Resource Name (ARN) of the replication task.
  final String replicationTaskArn;

  ReloadTablesResponse({
    this.replicationTaskArn,
  });
  static ReloadTablesResponse fromJson(Map<String, dynamic> json) =>
      ReloadTablesResponse(
        replicationTaskArn: json.containsKey('ReplicationTaskArn')
            ? json['ReplicationTaskArn'] as String
            : null,
      );
}

class RemoveTagsFromResourceResponse {
  RemoveTagsFromResourceResponse();
  static RemoveTagsFromResourceResponse fromJson(Map<String, dynamic> json) =>
      RemoveTagsFromResourceResponse();
}

class ReplicationInstance {
  /// The replication instance identifier. This parameter is stored as a
  /// lowercase string.
  ///
  /// Constraints:
  ///
  /// *   Must contain from 1 to 63 alphanumeric characters or hyphens.
  ///
  /// *   First character must be a letter.
  ///
  /// *   Cannot end with a hyphen or contain two consecutive hyphens.
  ///
  ///
  /// Example: `myrepinstance`
  final String replicationInstanceIdentifier;

  /// The compute and memory capacity of the replication instance.
  ///
  ///  Valid Values: `dms.t2.micro | dms.t2.small | dms.t2.medium | dms.t2.large
  /// | dms.c4.large | dms.c4.xlarge | dms.c4.2xlarge | dms.c4.4xlarge`
  final String replicationInstanceClass;

  /// The status of the replication instance.
  final String replicationInstanceStatus;

  /// The amount of storage (in gigabytes) that is allocated for the replication
  /// instance.
  final int allocatedStorage;

  /// The time the replication instance was created.
  final DateTime instanceCreateTime;

  /// The VPC security group for the instance.
  final List<VpcSecurityGroupMembership> vpcSecurityGroups;

  /// The Availability Zone for the instance.
  final String availabilityZone;

  /// The subnet group for the replication instance.
  final ReplicationSubnetGroup replicationSubnetGroup;

  /// The maintenance window times for the replication instance.
  final String preferredMaintenanceWindow;

  /// The pending modification values.
  final ReplicationPendingModifiedValues pendingModifiedValues;

  ///  Specifies whether the replication instance is a Multi-AZ deployment. You
  /// cannot set the `AvailabilityZone` parameter if the Multi-AZ parameter is
  /// set to `true`.
  final bool multiAZ;

  /// The engine version number of the replication instance.
  final String engineVersion;

  /// Boolean value indicating if minor version upgrades will be automatically
  /// applied to the instance.
  final bool autoMinorVersionUpgrade;

  /// An AWS KMS key identifier that is used to encrypt the data on the
  /// replication instance.
  ///
  /// If you don't specify a value for the `KmsKeyId` parameter, then AWS DMS
  /// uses your default encryption key.
  ///
  /// AWS KMS creates the default encryption key for your AWS account. Your AWS
  /// account has a different default encryption key for each AWS Region.
  final String kmsKeyId;

  /// The Amazon Resource Name (ARN) of the replication instance.
  final String replicationInstanceArn;

  /// The public IP address of the replication instance.
  final String replicationInstancePublicIpAddress;

  /// The private IP address of the replication instance.
  final String replicationInstancePrivateIpAddress;

  /// One or more public IP addresses for the replication instance.
  final List<String> replicationInstancePublicIpAddresses;

  /// One or more private IP addresses for the replication instance.
  final List<String> replicationInstancePrivateIpAddresses;

  ///  Specifies the accessibility options for the replication instance. A value
  /// of `true` represents an instance with a public IP address. A value of
  /// `false` represents an instance with a private IP address. The default
  /// value is `true`.
  final bool publiclyAccessible;

  /// The availability zone of the standby replication instance in a Multi-AZ
  /// deployment.
  final String secondaryAvailabilityZone;

  ///  The expiration date of the free replication instance that is part of the
  /// Free DMS program.
  final DateTime freeUntil;

  /// The DNS name servers for the replication instance.
  final String dnsNameServers;

  ReplicationInstance({
    this.replicationInstanceIdentifier,
    this.replicationInstanceClass,
    this.replicationInstanceStatus,
    this.allocatedStorage,
    this.instanceCreateTime,
    this.vpcSecurityGroups,
    this.availabilityZone,
    this.replicationSubnetGroup,
    this.preferredMaintenanceWindow,
    this.pendingModifiedValues,
    this.multiAZ,
    this.engineVersion,
    this.autoMinorVersionUpgrade,
    this.kmsKeyId,
    this.replicationInstanceArn,
    this.replicationInstancePublicIpAddress,
    this.replicationInstancePrivateIpAddress,
    this.replicationInstancePublicIpAddresses,
    this.replicationInstancePrivateIpAddresses,
    this.publiclyAccessible,
    this.secondaryAvailabilityZone,
    this.freeUntil,
    this.dnsNameServers,
  });
  static ReplicationInstance fromJson(Map<String, dynamic> json) =>
      ReplicationInstance(
        replicationInstanceIdentifier:
            json.containsKey('ReplicationInstanceIdentifier')
                ? json['ReplicationInstanceIdentifier'] as String
                : null,
        replicationInstanceClass: json.containsKey('ReplicationInstanceClass')
            ? json['ReplicationInstanceClass'] as String
            : null,
        replicationInstanceStatus: json.containsKey('ReplicationInstanceStatus')
            ? json['ReplicationInstanceStatus'] as String
            : null,
        allocatedStorage: json.containsKey('AllocatedStorage')
            ? json['AllocatedStorage'] as int
            : null,
        instanceCreateTime: json.containsKey('InstanceCreateTime')
            ? DateTime.parse(json['InstanceCreateTime'])
            : null,
        vpcSecurityGroups: json.containsKey('VpcSecurityGroups')
            ? (json['VpcSecurityGroups'] as List)
                .map((e) => VpcSecurityGroupMembership.fromJson(e))
                .toList()
            : null,
        availabilityZone: json.containsKey('AvailabilityZone')
            ? json['AvailabilityZone'] as String
            : null,
        replicationSubnetGroup: json.containsKey('ReplicationSubnetGroup')
            ? ReplicationSubnetGroup.fromJson(json['ReplicationSubnetGroup'])
            : null,
        preferredMaintenanceWindow:
            json.containsKey('PreferredMaintenanceWindow')
                ? json['PreferredMaintenanceWindow'] as String
                : null,
        pendingModifiedValues: json.containsKey('PendingModifiedValues')
            ? ReplicationPendingModifiedValues.fromJson(
                json['PendingModifiedValues'])
            : null,
        multiAZ: json.containsKey('MultiAZ') ? json['MultiAZ'] as bool : null,
        engineVersion: json.containsKey('EngineVersion')
            ? json['EngineVersion'] as String
            : null,
        autoMinorVersionUpgrade: json.containsKey('AutoMinorVersionUpgrade')
            ? json['AutoMinorVersionUpgrade'] as bool
            : null,
        kmsKeyId:
            json.containsKey('KmsKeyId') ? json['KmsKeyId'] as String : null,
        replicationInstanceArn: json.containsKey('ReplicationInstanceArn')
            ? json['ReplicationInstanceArn'] as String
            : null,
        replicationInstancePublicIpAddress:
            json.containsKey('ReplicationInstancePublicIpAddress')
                ? json['ReplicationInstancePublicIpAddress'] as String
                : null,
        replicationInstancePrivateIpAddress:
            json.containsKey('ReplicationInstancePrivateIpAddress')
                ? json['ReplicationInstancePrivateIpAddress'] as String
                : null,
        replicationInstancePublicIpAddresses:
            json.containsKey('ReplicationInstancePublicIpAddresses')
                ? (json['ReplicationInstancePublicIpAddresses'] as List)
                    .map((e) => e as String)
                    .toList()
                : null,
        replicationInstancePrivateIpAddresses:
            json.containsKey('ReplicationInstancePrivateIpAddresses')
                ? (json['ReplicationInstancePrivateIpAddresses'] as List)
                    .map((e) => e as String)
                    .toList()
                : null,
        publiclyAccessible: json.containsKey('PubliclyAccessible')
            ? json['PubliclyAccessible'] as bool
            : null,
        secondaryAvailabilityZone: json.containsKey('SecondaryAvailabilityZone')
            ? json['SecondaryAvailabilityZone'] as String
            : null,
        freeUntil: json.containsKey('FreeUntil')
            ? DateTime.parse(json['FreeUntil'])
            : null,
        dnsNameServers: json.containsKey('DnsNameServers')
            ? json['DnsNameServers'] as String
            : null,
      );
}

/// Contains metadata for a replication instance task log.
class ReplicationInstanceTaskLog {
  /// The name of the replication task.
  final String replicationTaskName;

  /// The Amazon Resource Name (ARN) of the replication task.
  final String replicationTaskArn;

  /// The size, in bytes, of the replication task log.
  final BigInt replicationInstanceTaskLogSize;

  ReplicationInstanceTaskLog({
    this.replicationTaskName,
    this.replicationTaskArn,
    this.replicationInstanceTaskLogSize,
  });
  static ReplicationInstanceTaskLog fromJson(Map<String, dynamic> json) =>
      ReplicationInstanceTaskLog(
        replicationTaskName: json.containsKey('ReplicationTaskName')
            ? json['ReplicationTaskName'] as String
            : null,
        replicationTaskArn: json.containsKey('ReplicationTaskArn')
            ? json['ReplicationTaskArn'] as String
            : null,
        replicationInstanceTaskLogSize:
            json.containsKey('ReplicationInstanceTaskLogSize')
                ? BigInt.from(json['ReplicationInstanceTaskLogSize'])
                : null,
      );
}

class ReplicationPendingModifiedValues {
  /// The compute and memory capacity of the replication instance.
  ///
  ///  Valid Values: `dms.t2.micro | dms.t2.small | dms.t2.medium | dms.t2.large
  /// | dms.c4.large | dms.c4.xlarge | dms.c4.2xlarge | dms.c4.4xlarge`
  final String replicationInstanceClass;

  /// The amount of storage (in gigabytes) that is allocated for the replication
  /// instance.
  final int allocatedStorage;

  ///  Specifies whether the replication instance is a Multi-AZ deployment. You
  /// cannot set the `AvailabilityZone` parameter if the Multi-AZ parameter is
  /// set to `true`.
  final bool multiAZ;

  /// The engine version number of the replication instance.
  final String engineVersion;

  ReplicationPendingModifiedValues({
    this.replicationInstanceClass,
    this.allocatedStorage,
    this.multiAZ,
    this.engineVersion,
  });
  static ReplicationPendingModifiedValues fromJson(Map<String, dynamic> json) =>
      ReplicationPendingModifiedValues(
        replicationInstanceClass: json.containsKey('ReplicationInstanceClass')
            ? json['ReplicationInstanceClass'] as String
            : null,
        allocatedStorage: json.containsKey('AllocatedStorage')
            ? json['AllocatedStorage'] as int
            : null,
        multiAZ: json.containsKey('MultiAZ') ? json['MultiAZ'] as bool : null,
        engineVersion: json.containsKey('EngineVersion')
            ? json['EngineVersion'] as String
            : null,
      );
}

class ReplicationSubnetGroup {
  /// The identifier of the replication instance subnet group.
  final String replicationSubnetGroupIdentifier;

  /// A description for the replication subnet group.
  final String replicationSubnetGroupDescription;

  /// The ID of the VPC.
  final String vpcId;

  /// The status of the subnet group.
  final String subnetGroupStatus;

  /// The subnets that are in the subnet group.
  final List<Subnet> subnets;

  ReplicationSubnetGroup({
    this.replicationSubnetGroupIdentifier,
    this.replicationSubnetGroupDescription,
    this.vpcId,
    this.subnetGroupStatus,
    this.subnets,
  });
  static ReplicationSubnetGroup fromJson(Map<String, dynamic> json) =>
      ReplicationSubnetGroup(
        replicationSubnetGroupIdentifier:
            json.containsKey('ReplicationSubnetGroupIdentifier')
                ? json['ReplicationSubnetGroupIdentifier'] as String
                : null,
        replicationSubnetGroupDescription:
            json.containsKey('ReplicationSubnetGroupDescription')
                ? json['ReplicationSubnetGroupDescription'] as String
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

class ReplicationTask {
  /// The user-assigned replication task identifier or name.
  ///
  /// Constraints:
  ///
  /// *   Must contain from 1 to 255 alphanumeric characters or hyphens.
  ///
  /// *   First character must be a letter.
  ///
  /// *   Cannot end with a hyphen or contain two consecutive hyphens.
  final String replicationTaskIdentifier;

  /// The Amazon Resource Name (ARN) string that uniquely identifies the
  /// endpoint.
  final String sourceEndpointArn;

  /// The Amazon Resource Name (ARN) string that uniquely identifies the
  /// endpoint.
  final String targetEndpointArn;

  /// The Amazon Resource Name (ARN) of the replication instance.
  final String replicationInstanceArn;

  /// The type of migration.
  final String migrationType;

  /// Table mappings specified in the task.
  final String tableMappings;

  /// The settings for the replication task.
  final String replicationTaskSettings;

  /// The status of the replication task.
  final String status;

  /// The last error (failure) message generated for the replication instance.
  final String lastFailureMessage;

  /// The reason the replication task was stopped.
  final String stopReason;

  /// The date the replication task was created.
  final DateTime replicationTaskCreationDate;

  /// The date the replication task is scheduled to start.
  final DateTime replicationTaskStartDate;

  /// Indicates when you want a change data capture (CDC) operation to start.
  /// Use either `CdcStartPosition` or `CdcStartTime` to specify when you want
  /// the CDC operation to start. Specifying both values results in an error.
  ///
  /// The value can be in date, checkpoint, or LSN/SCN format.
  ///
  /// Date Example: --cdc-start-position “2018-03-08T12:12:12”
  ///
  /// Checkpoint Example: --cdc-start-position
  /// "checkpoint:V1#27#mysql-bin-changelog.157832:1975:-1:2002:677883278264080:mysql-bin-changelog.157832:1876#0#0#*#0#93"
  ///
  /// LSN Example: --cdc-start-position “mysql-bin-changelog.000024:373”
  final String cdcStartPosition;

  /// Indicates when you want a change data capture (CDC) operation to stop. The
  /// value can be either server time or commit time.
  ///
  /// Server time example: --cdc-stop-position “server_time:3018-02-09T12:12:12”
  ///
  /// Commit time example: --cdc-stop-position “commit_time: 3018-02-09T12:12:12
  /// “
  final String cdcStopPosition;

  /// Indicates the last checkpoint that occurred during a change data capture
  /// (CDC) operation. You can provide this value to the `CdcStartPosition`
  /// parameter to start a CDC operation that begins at that checkpoint.
  final String recoveryCheckpoint;

  /// The Amazon Resource Name (ARN) of the replication task.
  final String replicationTaskArn;

  /// The statistics for the task, including elapsed time, tables loaded, and
  /// table errors.
  final ReplicationTaskStats replicationTaskStats;

  ReplicationTask({
    this.replicationTaskIdentifier,
    this.sourceEndpointArn,
    this.targetEndpointArn,
    this.replicationInstanceArn,
    this.migrationType,
    this.tableMappings,
    this.replicationTaskSettings,
    this.status,
    this.lastFailureMessage,
    this.stopReason,
    this.replicationTaskCreationDate,
    this.replicationTaskStartDate,
    this.cdcStartPosition,
    this.cdcStopPosition,
    this.recoveryCheckpoint,
    this.replicationTaskArn,
    this.replicationTaskStats,
  });
  static ReplicationTask fromJson(Map<String, dynamic> json) => ReplicationTask(
        replicationTaskIdentifier: json.containsKey('ReplicationTaskIdentifier')
            ? json['ReplicationTaskIdentifier'] as String
            : null,
        sourceEndpointArn: json.containsKey('SourceEndpointArn')
            ? json['SourceEndpointArn'] as String
            : null,
        targetEndpointArn: json.containsKey('TargetEndpointArn')
            ? json['TargetEndpointArn'] as String
            : null,
        replicationInstanceArn: json.containsKey('ReplicationInstanceArn')
            ? json['ReplicationInstanceArn'] as String
            : null,
        migrationType: json.containsKey('MigrationType')
            ? json['MigrationType'] as String
            : null,
        tableMappings: json.containsKey('TableMappings')
            ? json['TableMappings'] as String
            : null,
        replicationTaskSettings: json.containsKey('ReplicationTaskSettings')
            ? json['ReplicationTaskSettings'] as String
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        lastFailureMessage: json.containsKey('LastFailureMessage')
            ? json['LastFailureMessage'] as String
            : null,
        stopReason: json.containsKey('StopReason')
            ? json['StopReason'] as String
            : null,
        replicationTaskCreationDate:
            json.containsKey('ReplicationTaskCreationDate')
                ? DateTime.parse(json['ReplicationTaskCreationDate'])
                : null,
        replicationTaskStartDate: json.containsKey('ReplicationTaskStartDate')
            ? DateTime.parse(json['ReplicationTaskStartDate'])
            : null,
        cdcStartPosition: json.containsKey('CdcStartPosition')
            ? json['CdcStartPosition'] as String
            : null,
        cdcStopPosition: json.containsKey('CdcStopPosition')
            ? json['CdcStopPosition'] as String
            : null,
        recoveryCheckpoint: json.containsKey('RecoveryCheckpoint')
            ? json['RecoveryCheckpoint'] as String
            : null,
        replicationTaskArn: json.containsKey('ReplicationTaskArn')
            ? json['ReplicationTaskArn'] as String
            : null,
        replicationTaskStats: json.containsKey('ReplicationTaskStats')
            ? ReplicationTaskStats.fromJson(json['ReplicationTaskStats'])
            : null,
      );
}

///  The task assessment report in JSON format.
class ReplicationTaskAssessmentResult {
  ///  The replication task identifier of the task on which the task assessment
  /// was run.
  final String replicationTaskIdentifier;

  /// The Amazon Resource Name (ARN) of the replication task.
  final String replicationTaskArn;

  /// The date the task assessment was completed.
  final DateTime replicationTaskLastAssessmentDate;

  ///  The status of the task assessment.
  final String assessmentStatus;

  ///  The file containing the results of the task assessment.
  final String assessmentResultsFile;

  ///  The task assessment results in JSON format.
  final String assessmentResults;

  ///  The URL of the S3 object containing the task assessment results.
  final String s3ObjectUrl;

  ReplicationTaskAssessmentResult({
    this.replicationTaskIdentifier,
    this.replicationTaskArn,
    this.replicationTaskLastAssessmentDate,
    this.assessmentStatus,
    this.assessmentResultsFile,
    this.assessmentResults,
    this.s3ObjectUrl,
  });
  static ReplicationTaskAssessmentResult fromJson(Map<String, dynamic> json) =>
      ReplicationTaskAssessmentResult(
        replicationTaskIdentifier: json.containsKey('ReplicationTaskIdentifier')
            ? json['ReplicationTaskIdentifier'] as String
            : null,
        replicationTaskArn: json.containsKey('ReplicationTaskArn')
            ? json['ReplicationTaskArn'] as String
            : null,
        replicationTaskLastAssessmentDate:
            json.containsKey('ReplicationTaskLastAssessmentDate')
                ? DateTime.parse(json['ReplicationTaskLastAssessmentDate'])
                : null,
        assessmentStatus: json.containsKey('AssessmentStatus')
            ? json['AssessmentStatus'] as String
            : null,
        assessmentResultsFile: json.containsKey('AssessmentResultsFile')
            ? json['AssessmentResultsFile'] as String
            : null,
        assessmentResults: json.containsKey('AssessmentResults')
            ? json['AssessmentResults'] as String
            : null,
        s3ObjectUrl: json.containsKey('S3ObjectUrl')
            ? json['S3ObjectUrl'] as String
            : null,
      );
}

class ReplicationTaskStats {
  /// The percent complete for the full load migration task.
  final int fullLoadProgressPercent;

  /// The elapsed time of the task, in milliseconds.
  final BigInt elapsedTimeMillis;

  /// The number of tables loaded for this task.
  final int tablesLoaded;

  /// The number of tables currently loading for this task.
  final int tablesLoading;

  /// The number of tables queued for this task.
  final int tablesQueued;

  /// The number of errors that have occurred during this task.
  final int tablesErrored;

  ReplicationTaskStats({
    this.fullLoadProgressPercent,
    this.elapsedTimeMillis,
    this.tablesLoaded,
    this.tablesLoading,
    this.tablesQueued,
    this.tablesErrored,
  });
  static ReplicationTaskStats fromJson(Map<String, dynamic> json) =>
      ReplicationTaskStats(
        fullLoadProgressPercent: json.containsKey('FullLoadProgressPercent')
            ? json['FullLoadProgressPercent'] as int
            : null,
        elapsedTimeMillis: json.containsKey('ElapsedTimeMillis')
            ? BigInt.from(json['ElapsedTimeMillis'])
            : null,
        tablesLoaded: json.containsKey('TablesLoaded')
            ? json['TablesLoaded'] as int
            : null,
        tablesLoading: json.containsKey('TablesLoading')
            ? json['TablesLoading'] as int
            : null,
        tablesQueued: json.containsKey('TablesQueued')
            ? json['TablesQueued'] as int
            : null,
        tablesErrored: json.containsKey('TablesErrored')
            ? json['TablesErrored'] as int
            : null,
      );
}

class ResourcePendingMaintenanceActions {
  /// The Amazon Resource Name (ARN) of the DMS resource that the pending
  /// maintenance action applies to. For information about creating an ARN, see
  /// [Constructing an Amazon Resource Name (ARN) for AWS DMS](https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Introduction.AWS.ARN.html)
  /// in the DMS documentation.
  final String resourceIdentifier;

  /// Detailed information about the pending maintenance action.
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

/// Settings for exporting data to Amazon S3.
class S3Settings {
  ///  The Amazon Resource Name (ARN) used by the service access IAM role.
  final String serviceAccessRoleArn;

  ///  The external table definition.
  final String externalTableDefinition;

  ///  The delimiter used to separate rows in the source files. The default is a
  /// carriage return (`n`).
  final String csvRowDelimiter;

  ///  The delimiter used to separate columns in the source files. The default
  /// is a comma.
  final String csvDelimiter;

  ///  An optional parameter to set a folder name in the S3 bucket. If provided,
  /// tables are created in the path
  /// `_bucketFolder_/_schema_name_/_table_name_/`. If this parameter is not
  /// specified, then the path used is  `_schema_name_/_table_name_/`.
  final String bucketFolder;

  ///  The name of the S3 bucket.
  final String bucketName;

  ///  An optional parameter to use GZIP to compress the target files. Set to
  /// GZIP to compress the target files. Set to NONE (the default) or do not use
  /// to leave the files uncompressed. Applies to both .csv and .parquet file
  /// formats.
  final String compressionType;

  /// The type of server-side encryption that you want to use for your data.
  /// This encryption type is part of the endpoint settings or the extra
  /// connections attributes for Amazon S3. You can choose either `SSE_S3` (the
  /// default) or `SSE_KMS`. To use `SSE_S3`, you need an AWS Identity and
  /// Access Management (IAM) role with permission to allow
  /// `"arn:aws:s3:::dms-*"` to use the following actions:
  ///
  /// *    `s3:CreateBucket`
  ///
  /// *    `s3:ListBucket`
  ///
  /// *    `s3:DeleteBucket`
  ///
  /// *    `s3:GetBucketLocation`
  ///
  /// *    `s3:GetObject`
  ///
  /// *    `s3:PutObject`
  ///
  /// *    `s3:DeleteObject`
  ///
  /// *    `s3:GetObjectVersion`
  ///
  /// *    `s3:GetBucketPolicy`
  ///
  /// *    `s3:PutBucketPolicy`
  ///
  /// *    `s3:DeleteBucketPolicy`
  final String encryptionMode;

  /// If you are using `SSE_KMS` for the `EncryptionMode`, provide the AWS KMS
  /// key ID. The key that you use needs an attached policy that enables AWS
  /// Identity and Access Management (IAM) user permissions and allows use of
  /// the key.
  ///
  /// Here is a CLI example: `aws dms create-endpoint --endpoint-identifier
  /// _value_ --endpoint-type target --engine-name s3 --s3-settings
  /// ServiceAccessRoleArn=_value_,BucketFolder=_value_,BucketName=_value_,EncryptionMode=SSE_KMS,ServerSideEncryptionKmsKeyId=_value_`
  final String serverSideEncryptionKmsKeyId;

  /// The format of the data that you want to use for output. You can choose one
  /// of the following:
  ///
  /// *    `csv` : This is a row-based file format with comma-separated values
  /// (.csv).
  ///
  /// *    `parquet` : Apache Parquet (.parquet) is a columnar storage file
  /// format that features efficient compression and provides faster query
  /// response.
  final String dataFormat;

  /// The type of encoding you are using:
  ///
  /// *    `RLE_DICTIONARY` uses a combination of bit-packing and run-length
  /// encoding to store repeated values more efficiently. This is the default.
  ///
  /// *    `PLAIN` doesn't use encoding at all. Values are stored as they are.
  ///
  /// *    `PLAIN_DICTIONARY` builds a dictionary of the values encountered in a
  /// given column. The dictionary is stored in a dictionary page for each
  /// column chunk.
  final String encodingType;

  /// The maximum size of an encoded dictionary page of a column. If the
  /// dictionary page exceeds this, this column is stored using an encoding type
  /// of `PLAIN`. This parameter defaults to 1024 * 1024 bytes (1 MiB), the
  /// maximum size of a dictionary page before it reverts to `PLAIN` encoding.
  /// This size is used for .parquet file format only.
  final int dictPageSizeLimit;

  /// The number of rows in a row group. A smaller row group size provides
  /// faster reads. But as the number of row groups grows, the slower writes
  /// become. This parameter defaults to 10,000 rows. This number is used for
  /// .parquet file format only.
  ///
  /// If you choose a value larger than the maximum, `RowGroupLength` is set to
  /// the max row group length in bytes (64 * 1024 * 1024).
  final int rowGroupLength;

  /// The size of one data page in bytes. This parameter defaults to 1024 * 1024
  /// bytes (1 MiB). This number is used for .parquet file format only.
  final int dataPageSize;

  /// The version of the Apache Parquet format that you want to use:
  /// `parquet_1_0` (the default) or `parquet_2_0`.
  final String parquetVersion;

  /// A value that enables statistics for Parquet pages and row groups. Choose
  /// `true` to enable statistics, `false` to disable. Statistics include
  /// `NULL`, `DISTINCT`, `MAX`, and `MIN` values. This parameter defaults to
  /// `true`. This value is used for .parquet file format only.
  final bool enableStatistics;

  /// A value that enables a full load to write INSERT operations to the
  /// comma-separated value (.csv) output files only to indicate how the rows
  /// were added to the source database.
  ///
  ///  AWS DMS supports `IncludeOpForFullLoad` in versions 3.1.4 and later.
  ///
  /// For full load, records can only be inserted. By default (the `false`
  /// setting), no information is recorded in these output files for a full load
  /// to indicate that the rows were inserted at the source database. If
  /// `IncludeOpForFullLoad` is set to `true` or `y`, the INSERT is recorded as
  /// an I annotation in the first field of the .csv file. This allows the
  /// format of your target records from a full load to be consistent with the
  /// target records from a CDC load.
  ///
  ///
  ///
  /// This setting works together with `CdcInsertsOnly` for output to .csv files
  /// only. For more information about how these settings work together, see
  /// [Indicating Source DB Operations in Migrated S3 Data](https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.S3.html#CHAP_Target.S3.Configuring.InsertOps)
  /// in the _AWS Database Migration Service User Guide._.
  final bool includeOpForFullLoad;

  /// A value that enables a change data capture (CDC) load to write only INSERT
  /// operations to .csv or columnar storage (.parquet) output files. By default
  /// (the `false` setting), the first field in a .csv or .parquet record
  /// contains the letter I (INSERT), U (UPDATE), or D (DELETE). These values
  /// indicate whether the row was inserted, updated, or deleted at the source
  /// database for a CDC load to the target.
  ///
  /// If `cdcInsertsOnly` is set to `true` or `y`, only INSERTs from the source
  /// database are migrated to the .csv or .parquet file. For .csv format only,
  /// how these INSERTs are recorded depends on the value of
  /// `IncludeOpForFullLoad`. If `IncludeOpForFullLoad` is set to `true`, the
  /// first field of every CDC record is set to I to indicate the INSERT
  /// operation at the source. If `IncludeOpForFullLoad` is set to `false`,
  /// every CDC record is written without a first field to indicate the INSERT
  /// operation at the source. For more information about how these settings
  /// work together, see
  /// [Indicating Source DB Operations in Migrated S3 Data](https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.S3.html#CHAP_Target.S3.Configuring.InsertOps)
  /// in the _AWS Database Migration Service User Guide._.
  ///
  ///
  ///
  /// AWS DMS supports this interaction between `CdcInsertsOnly` and
  /// `IncludeOpForFullLoad` in versions 3.1.4 and later.
  final bool cdcInsertsOnly;

  /// A value that includes a timestamp column in the Amazon S3 target endpoint
  /// data. AWS DMS includes an additional column in the migrated data when you
  /// set `timestampColumnName` to a non-blank value.
  ///
  ///  AWS DMS supports `TimestampColumnName` in versions 3.1.4 and later.
  ///
  /// For a full load, each row of the timestamp column contains a timestamp for
  /// when the data was transferred from the source to the target by DMS. For a
  /// CDC load, each row of the timestamp column contains the timestamp for the
  /// commit of that row in the source database. The format for the timestamp
  /// column value is `yyyy-MM-dd HH:mm:ss.SSSSSS`. For CDC, the microsecond
  /// precision depends on the commit timestamp supported by DMS for the source
  /// database. When the `AddColumnName` setting is set to `true`, DMS also
  /// includes the name for the timestamp column that you set as the nonblank
  /// value of `timestampColumnName`.
  final String timestampColumnName;

  S3Settings({
    this.serviceAccessRoleArn,
    this.externalTableDefinition,
    this.csvRowDelimiter,
    this.csvDelimiter,
    this.bucketFolder,
    this.bucketName,
    this.compressionType,
    this.encryptionMode,
    this.serverSideEncryptionKmsKeyId,
    this.dataFormat,
    this.encodingType,
    this.dictPageSizeLimit,
    this.rowGroupLength,
    this.dataPageSize,
    this.parquetVersion,
    this.enableStatistics,
    this.includeOpForFullLoad,
    this.cdcInsertsOnly,
    this.timestampColumnName,
  });
  static S3Settings fromJson(Map<String, dynamic> json) => S3Settings(
        serviceAccessRoleArn: json.containsKey('ServiceAccessRoleArn')
            ? json['ServiceAccessRoleArn'] as String
            : null,
        externalTableDefinition: json.containsKey('ExternalTableDefinition')
            ? json['ExternalTableDefinition'] as String
            : null,
        csvRowDelimiter: json.containsKey('CsvRowDelimiter')
            ? json['CsvRowDelimiter'] as String
            : null,
        csvDelimiter: json.containsKey('CsvDelimiter')
            ? json['CsvDelimiter'] as String
            : null,
        bucketFolder: json.containsKey('BucketFolder')
            ? json['BucketFolder'] as String
            : null,
        bucketName: json.containsKey('BucketName')
            ? json['BucketName'] as String
            : null,
        compressionType: json.containsKey('CompressionType')
            ? json['CompressionType'] as String
            : null,
        encryptionMode: json.containsKey('EncryptionMode')
            ? json['EncryptionMode'] as String
            : null,
        serverSideEncryptionKmsKeyId:
            json.containsKey('ServerSideEncryptionKmsKeyId')
                ? json['ServerSideEncryptionKmsKeyId'] as String
                : null,
        dataFormat: json.containsKey('DataFormat')
            ? json['DataFormat'] as String
            : null,
        encodingType: json.containsKey('EncodingType')
            ? json['EncodingType'] as String
            : null,
        dictPageSizeLimit: json.containsKey('DictPageSizeLimit')
            ? json['DictPageSizeLimit'] as int
            : null,
        rowGroupLength: json.containsKey('RowGroupLength')
            ? json['RowGroupLength'] as int
            : null,
        dataPageSize: json.containsKey('DataPageSize')
            ? json['DataPageSize'] as int
            : null,
        parquetVersion: json.containsKey('ParquetVersion')
            ? json['ParquetVersion'] as String
            : null,
        enableStatistics: json.containsKey('EnableStatistics')
            ? json['EnableStatistics'] as bool
            : null,
        includeOpForFullLoad: json.containsKey('IncludeOpForFullLoad')
            ? json['IncludeOpForFullLoad'] as bool
            : null,
        cdcInsertsOnly: json.containsKey('CdcInsertsOnly')
            ? json['CdcInsertsOnly'] as bool
            : null,
        timestampColumnName: json.containsKey('TimestampColumnName')
            ? json['TimestampColumnName'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class StartReplicationTaskAssessmentResponse {
  ///  The assessed replication task.
  final ReplicationTask replicationTask;

  StartReplicationTaskAssessmentResponse({
    this.replicationTask,
  });
  static StartReplicationTaskAssessmentResponse fromJson(
          Map<String, dynamic> json) =>
      StartReplicationTaskAssessmentResponse(
        replicationTask: json.containsKey('ReplicationTask')
            ? ReplicationTask.fromJson(json['ReplicationTask'])
            : null,
      );
}

class StartReplicationTaskResponse {
  /// The replication task started.
  final ReplicationTask replicationTask;

  StartReplicationTaskResponse({
    this.replicationTask,
  });
  static StartReplicationTaskResponse fromJson(Map<String, dynamic> json) =>
      StartReplicationTaskResponse(
        replicationTask: json.containsKey('ReplicationTask')
            ? ReplicationTask.fromJson(json['ReplicationTask'])
            : null,
      );
}

class StopReplicationTaskResponse {
  /// The replication task stopped.
  final ReplicationTask replicationTask;

  StopReplicationTaskResponse({
    this.replicationTask,
  });
  static StopReplicationTaskResponse fromJson(Map<String, dynamic> json) =>
      StopReplicationTaskResponse(
        replicationTask: json.containsKey('ReplicationTask')
            ? ReplicationTask.fromJson(json['ReplicationTask'])
            : null,
      );
}

class Subnet {
  /// The subnet identifier.
  final String subnetIdentifier;

  /// The Availability Zone of the subnet.
  final AvailabilityZone subnetAvailabilityZone;

  /// The status of the subnet.
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

class SupportedEndpointType {
  /// The database engine name. Valid values, depending on the EndpointType,
  /// include mysql, oracle, postgres, mariadb, aurora, aurora-postgresql,
  /// redshift, s3, db2, azuredb, sybase, dynamodb, mongodb, and sqlserver.
  final String engineName;

  /// Indicates if Change Data Capture (CDC) is supported.
  final bool supportsCdc;

  /// The type of endpoint. Valid values are `source` and `target`.
  final String endpointType;

  /// The expanded name for the engine name. For example, if the `EngineName`
  /// parameter is "aurora," this value would be "Amazon Aurora MySQL."
  final String engineDisplayName;

  SupportedEndpointType({
    this.engineName,
    this.supportsCdc,
    this.endpointType,
    this.engineDisplayName,
  });
  static SupportedEndpointType fromJson(Map<String, dynamic> json) =>
      SupportedEndpointType(
        engineName: json.containsKey('EngineName')
            ? json['EngineName'] as String
            : null,
        supportsCdc: json.containsKey('SupportsCDC')
            ? json['SupportsCDC'] as bool
            : null,
        endpointType: json.containsKey('EndpointType')
            ? json['EndpointType'] as String
            : null,
        engineDisplayName: json.containsKey('EngineDisplayName')
            ? json['EngineDisplayName'] as String
            : null,
      );
}

class TableStatistics {
  /// The schema name.
  final String schemaName;

  /// The name of the table.
  final String tableName;

  /// The number of insert actions performed on a table.
  final BigInt inserts;

  /// The number of delete actions performed on a table.
  final BigInt deletes;

  /// The number of update actions performed on a table.
  final BigInt updates;

  /// The Data Definition Language (DDL) used to build and modify the structure
  /// of your tables.
  final BigInt ddls;

  /// The number of rows added during the Full Load operation.
  final BigInt fullLoadRows;

  /// The number of rows that failed conditional checks during the Full Load
  /// operation (valid only for DynamoDB as a target migrations).
  final BigInt fullLoadCondtnlChkFailedRows;

  /// The number of rows that failed to load during the Full Load operation
  /// (valid only for DynamoDB as a target migrations).
  final BigInt fullLoadErrorRows;

  /// The last time the table was updated.
  final DateTime lastUpdateTime;

  /// The state of the tables described.
  ///
  /// Valid states: Table does not exist | Before load | Full load | Table
  /// completed | Table cancelled | Table error | Table all | Table updates |
  /// Table is being reloaded
  final String tableState;

  /// The number of records that have yet to be validated.
  final BigInt validationPendingRecords;

  /// The number of records that failed validation.
  final BigInt validationFailedRecords;

  /// The number of records that could not be validated.
  final BigInt validationSuspendedRecords;

  /// The validation state of the table.
  ///
  /// The parameter can have the following values
  ///
  /// *   Not enabled—Validation is not enabled for the table in the migration
  /// task.
  ///
  /// *   Pending records—Some records in the table are waiting for validation.
  ///
  /// *   Mismatched records—Some records in the table do not match between the
  /// source and target.
  ///
  /// *   Suspended records—Some records in the table could not be validated.
  ///
  /// *   No primary key—The table could not be validated because it had no
  /// primary key.
  ///
  /// *   Table error—The table was not validated because it was in an error
  /// state and some data was not migrated.
  ///
  /// *   Validated—All rows in the table were validated. If the table is
  /// updated, the status can change from Validated.
  ///
  /// *   Error—The table could not be validated because of an unexpected error.
  final String validationState;

  /// Additional details about the state of validation.
  final String validationStateDetails;

  TableStatistics({
    this.schemaName,
    this.tableName,
    this.inserts,
    this.deletes,
    this.updates,
    this.ddls,
    this.fullLoadRows,
    this.fullLoadCondtnlChkFailedRows,
    this.fullLoadErrorRows,
    this.lastUpdateTime,
    this.tableState,
    this.validationPendingRecords,
    this.validationFailedRecords,
    this.validationSuspendedRecords,
    this.validationState,
    this.validationStateDetails,
  });
  static TableStatistics fromJson(Map<String, dynamic> json) => TableStatistics(
        schemaName: json.containsKey('SchemaName')
            ? json['SchemaName'] as String
            : null,
        tableName:
            json.containsKey('TableName') ? json['TableName'] as String : null,
        inserts:
            json.containsKey('Inserts') ? BigInt.from(json['Inserts']) : null,
        deletes:
            json.containsKey('Deletes') ? BigInt.from(json['Deletes']) : null,
        updates:
            json.containsKey('Updates') ? BigInt.from(json['Updates']) : null,
        ddls: json.containsKey('Ddls') ? BigInt.from(json['Ddls']) : null,
        fullLoadRows: json.containsKey('FullLoadRows')
            ? BigInt.from(json['FullLoadRows'])
            : null,
        fullLoadCondtnlChkFailedRows:
            json.containsKey('FullLoadCondtnlChkFailedRows')
                ? BigInt.from(json['FullLoadCondtnlChkFailedRows'])
                : null,
        fullLoadErrorRows: json.containsKey('FullLoadErrorRows')
            ? BigInt.from(json['FullLoadErrorRows'])
            : null,
        lastUpdateTime: json.containsKey('LastUpdateTime')
            ? DateTime.parse(json['LastUpdateTime'])
            : null,
        tableState: json.containsKey('TableState')
            ? json['TableState'] as String
            : null,
        validationPendingRecords: json.containsKey('ValidationPendingRecords')
            ? BigInt.from(json['ValidationPendingRecords'])
            : null,
        validationFailedRecords: json.containsKey('ValidationFailedRecords')
            ? BigInt.from(json['ValidationFailedRecords'])
            : null,
        validationSuspendedRecords:
            json.containsKey('ValidationSuspendedRecords')
                ? BigInt.from(json['ValidationSuspendedRecords'])
                : null,
        validationState: json.containsKey('ValidationState')
            ? json['ValidationState'] as String
            : null,
        validationStateDetails: json.containsKey('ValidationStateDetails')
            ? json['ValidationStateDetails'] as String
            : null,
      );
}

class TableToReload {
  /// The schema name of the table to be reloaded.
  final String schemaName;

  /// The table name of the table to be reloaded.
  final String tableName;

  TableToReload({
    this.schemaName,
    this.tableName,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class Tag {
  /// A key is the required name of the tag. The string value can be from 1 to
  /// 128 Unicode characters in length and cannot be prefixed with "aws:" or
  /// "dms:". The string can only contain only the set of Unicode letters,
  /// digits, white-space, '_', '.', '/', '=', '+', '-' (Java regex:
  /// "^([p{L}p{Z}p{N}_.:/=+-]*)$").
  final String key;

  /// A value is the optional value of the tag. The string value can be from 1
  /// to 256 Unicode characters in length and cannot be prefixed with "aws:" or
  /// "dms:". The string can only contain only the set of Unicode letters,
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

class TestConnectionResponse {
  /// The connection tested.
  final Connection connection;

  TestConnectionResponse({
    this.connection,
  });
  static TestConnectionResponse fromJson(Map<String, dynamic> json) =>
      TestConnectionResponse(
        connection: json.containsKey('Connection')
            ? Connection.fromJson(json['Connection'])
            : null,
      );
}

class VpcSecurityGroupMembership {
  /// The VPC security group Id.
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
