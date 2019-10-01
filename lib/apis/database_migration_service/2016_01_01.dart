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
/// For more information about AWS DMS, see [What Is AWS Database Migration
/// Service?](https://docs.aws.amazon.com/dms/latest/userguide/Welcome.html) in
/// the _AWS Database Migration User Guide._
class DatabaseMigrationServiceApi {
  /// Adds metadata tags to an AWS DMS resource, including replication instance,
  /// endpoint, security group, and migration task. These tags can also be used
  /// with cost allocation reporting to track cost associated with DMS
  /// resources, or used in a Condition statement in an IAM policy for DMS.
  Future<void> addTagsToResource(
      {@required String resourceArn, @required List<Tag> tags}) async {}

  /// Applies a pending maintenance action to a resource (for example, to a
  /// replication instance).
  Future<void> applyPendingMaintenanceAction(
      {@required String replicationInstanceArn,
      @required String applyAction,
      @required String optInType}) async {}

  /// Creates an endpoint using the provided settings.
  Future<void> createEndpoint(
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
      RedshiftSettings redshiftSettings}) async {}

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
  /// For more information about AWS DMS events, see [Working with Events and
  /// Notifications](https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Events.html)
  /// in the _AWS Database Migration Service User Guide._
  Future<void> createEventSubscription(
      {@required String subscriptionName,
      @required String snsTopicArn,
      String sourceType,
      List<String> eventCategories,
      List<String> sourceIds,
      bool enabled,
      List<Tag> tags}) async {}

  /// Creates the replication instance using the specified parameters.
  Future<void> createReplicationInstance(
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
      String dnsNameServers}) async {}

  /// Creates a replication subnet group given a list of the subnet IDs in a
  /// VPC.
  Future<void> createReplicationSubnetGroup(
      {@required String replicationSubnetGroupIdentifier,
      @required String replicationSubnetGroupDescription,
      @required List<String> subnetIds,
      List<Tag> tags}) async {}

  /// Creates a replication task using the specified parameters.
  Future<void> createReplicationTask(
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
      List<Tag> tags}) async {}

  /// Deletes the specified certificate.
  Future<void> deleteCertificate(String certificateArn) async {}

  /// Deletes the specified endpoint.
  ///
  ///  All tasks associated with the endpoint must be deleted before you can
  /// delete the endpoint.
  Future<void> deleteEndpoint(String endpointArn) async {}

  ///  Deletes an AWS DMS event subscription.
  Future<void> deleteEventSubscription(String subscriptionName) async {}

  /// Deletes the specified replication instance.
  ///
  ///  You must delete any migration tasks that are associated with the
  /// replication instance before you can delete it.
  Future<void> deleteReplicationInstance(String replicationInstanceArn) async {}

  /// Deletes a subnet group.
  Future<void> deleteReplicationSubnetGroup(
      String replicationSubnetGroupIdentifier) async {}

  /// Deletes the specified replication task.
  Future<void> deleteReplicationTask(String replicationTaskArn) async {}

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
  Future<void> describeAccountAttributes() async {}

  /// Provides a description of the certificate.
  Future<void> describeCertificates(
      {List<Filter> filters, int maxRecords, String marker}) async {}

  /// Describes the status of the connections that have been made between the
  /// replication instance and an endpoint. Connections are created when you
  /// test an endpoint.
  Future<void> describeConnections(
      {List<Filter> filters, int maxRecords, String marker}) async {}

  /// Returns information about the type of endpoints available.
  Future<void> describeEndpointTypes(
      {List<Filter> filters, int maxRecords, String marker}) async {}

  /// Returns information about the endpoints for your account in the current
  /// region.
  Future<void> describeEndpoints(
      {List<Filter> filters, int maxRecords, String marker}) async {}

  /// Lists categories for all event source types, or, if specified, for a
  /// specified source type. You can see a list of the event categories and
  /// source types in [Working with Events and
  /// Notifications](https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Events.html)
  /// in the _AWS Database Migration Service User Guide._
  Future<void> describeEventCategories(
      {String sourceType, List<Filter> filters}) async {}

  /// Lists all the event subscriptions for a customer account. The description
  /// of a subscription includes `SubscriptionName`, `SNSTopicARN`,
  /// `CustomerID`, `SourceType`, `SourceID`, `CreationTime`, and `Status`.
  ///
  /// If you specify `SubscriptionName`, this action lists the description for
  /// that subscription.
  Future<void> describeEventSubscriptions(
      {String subscriptionName,
      List<Filter> filters,
      int maxRecords,
      String marker}) async {}

  ///  Lists events for a given source identifier and source type. You can also
  /// specify a start and end time. For more information on AWS DMS events, see
  /// [Working with Events and
  /// Notifications](https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Events.html)
  /// in the _AWS Database Migration User Guide._
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

  /// Returns information about the replication instance types that can be
  /// created in the specified region.
  Future<void> describeOrderableReplicationInstances(
      {int maxRecords, String marker}) async {}

  /// For internal use only
  Future<void> describePendingMaintenanceActions(
      {String replicationInstanceArn,
      List<Filter> filters,
      String marker,
      int maxRecords}) async {}

  /// Returns the status of the RefreshSchemas operation.
  Future<void> describeRefreshSchemasStatus(String endpointArn) async {}

  /// Returns information about the task logs for the specified task.
  Future<void> describeReplicationInstanceTaskLogs(
      String replicationInstanceArn,
      {int maxRecords,
      String marker}) async {}

  /// Returns information about replication instances for your account in the
  /// current region.
  Future<void> describeReplicationInstances(
      {List<Filter> filters, int maxRecords, String marker}) async {}

  /// Returns information about the replication subnet groups.
  Future<void> describeReplicationSubnetGroups(
      {List<Filter> filters, int maxRecords, String marker}) async {}

  /// Returns the task assessment results from Amazon S3. This action always
  /// returns the latest results.
  Future<void> describeReplicationTaskAssessmentResults(
      {String replicationTaskArn, int maxRecords, String marker}) async {}

  /// Returns information about replication tasks for your account in the
  /// current region.
  Future<void> describeReplicationTasks(
      {List<Filter> filters,
      int maxRecords,
      String marker,
      bool withoutSettings}) async {}

  /// Returns information about the schema for the specified endpoint.
  Future<void> describeSchemas(String endpointArn,
      {int maxRecords, String marker}) async {}

  /// Returns table statistics on the database migration task, including table
  /// name, rows inserted, rows updated, and rows deleted.
  ///
  /// Note that the "last updated" column the DMS console only indicates the
  /// time that AWS DMS last updated the table statistics record for a table. It
  /// does not indicate the time of the last update to the table.
  Future<void> describeTableStatistics(String replicationTaskArn,
      {int maxRecords, String marker, List<Filter> filters}) async {}

  /// Uploads the specified certificate.
  Future<void> importCertificate(String certificateIdentifier,
      {String certificatePem,
      Uint8List certificateWallet,
      List<Tag> tags}) async {}

  /// Lists all tags for an AWS DMS resource.
  Future<void> listTagsForResource(String resourceArn) async {}

  /// Modifies the specified endpoint.
  Future<void> modifyEndpoint(String endpointArn,
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
      RedshiftSettings redshiftSettings}) async {}

  /// Modifies an existing AWS DMS event notification subscription.
  Future<void> modifyEventSubscription(String subscriptionName,
      {String snsTopicArn,
      String sourceType,
      List<String> eventCategories,
      bool enabled}) async {}

  /// Modifies the replication instance to apply new settings. You can change
  /// one or more parameters by specifying these parameters and the new values
  /// in the request.
  ///
  /// Some settings are applied during the maintenance window.
  Future<void> modifyReplicationInstance(String replicationInstanceArn,
      {int allocatedStorage,
      bool applyImmediately,
      String replicationInstanceClass,
      List<String> vpcSecurityGroupIds,
      String preferredMaintenanceWindow,
      bool multiAZ,
      String engineVersion,
      bool allowMajorVersionUpgrade,
      bool autoMinorVersionUpgrade,
      String replicationInstanceIdentifier}) async {}

  /// Modifies the settings for the specified replication subnet group.
  Future<void> modifyReplicationSubnetGroup(
      {@required String replicationSubnetGroupIdentifier,
      String replicationSubnetGroupDescription,
      @required List<String> subnetIds}) async {}

  /// Modifies the specified replication task.
  ///
  /// You can't modify the task endpoints. The task must be stopped before you
  /// can modify it.
  ///
  /// For more information about AWS DMS tasks, see [Working with Migration
  /// Tasks](https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Tasks.html)
  /// in the _AWS Database Migration Service User Guide_.
  Future<void> modifyReplicationTask(String replicationTaskArn,
      {String replicationTaskIdentifier,
      String migrationType,
      String tableMappings,
      String replicationTaskSettings,
      DateTime cdcStartTime,
      String cdcStartPosition,
      String cdcStopPosition}) async {}

  /// Reboots a replication instance. Rebooting results in a momentary outage,
  /// until the replication instance becomes available again.
  Future<void> rebootReplicationInstance(String replicationInstanceArn,
      {bool forceFailover}) async {}

  /// Populates the schema for the specified endpoint. This is an asynchronous
  /// operation and can take several minutes. You can check the status of this
  /// operation by calling the DescribeRefreshSchemasStatus operation.
  Future<void> refreshSchemas(
      {@required String endpointArn,
      @required String replicationInstanceArn}) async {}

  /// Reloads the target database table with the source data.
  Future<void> reloadTables(
      {@required String replicationTaskArn,
      @required List<TableToReload> tablesToReload,
      String reloadOption}) async {}

  /// Removes metadata tags from a DMS resource.
  Future<void> removeTagsFromResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {}

  /// Starts the replication task.
  ///
  /// For more information about AWS DMS tasks, see [Working with Migration
  /// Tasks](https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Tasks.html)
  /// in the _AWS Database Migration Service User Guide._
  Future<void> startReplicationTask(
      {@required String replicationTaskArn,
      @required String startReplicationTaskType,
      DateTime cdcStartTime,
      String cdcStartPosition,
      String cdcStopPosition}) async {}

  ///  Starts the replication task assessment for unsupported data types in the
  /// source database.
  Future<void> startReplicationTaskAssessment(
      String replicationTaskArn) async {}

  /// Stops the replication task.
  Future<void> stopReplicationTask(String replicationTaskArn) async {}

  /// Tests the connection between the replication instance and the endpoint.
  Future<void> testConnection(
      {@required String replicationInstanceArn,
      @required String endpointArn}) async {}
}

class AccountQuota {}

class AddTagsToResourceResponse {}

class ApplyPendingMaintenanceActionResponse {}

class AvailabilityZone {}

class Certificate {}

class Connection {}

class CreateEndpointResponse {}

class CreateEventSubscriptionResponse {}

class CreateReplicationInstanceResponse {}

class CreateReplicationSubnetGroupResponse {}

class CreateReplicationTaskResponse {}

class DeleteCertificateResponse {}

class DeleteEndpointResponse {}

class DeleteEventSubscriptionResponse {}

class DeleteReplicationInstanceResponse {}

class DeleteReplicationSubnetGroupResponse {}

class DeleteReplicationTaskResponse {}

class DescribeAccountAttributesResponse {}

class DescribeCertificatesResponse {}

class DescribeConnectionsResponse {}

class DescribeEndpointTypesResponse {}

class DescribeEndpointsResponse {}

class DescribeEventCategoriesResponse {}

class DescribeEventSubscriptionsResponse {}

class DescribeEventsResponse {}

class DescribeOrderableReplicationInstancesResponse {}

class DescribePendingMaintenanceActionsResponse {}

class DescribeRefreshSchemasStatusResponse {}

class DescribeReplicationInstanceTaskLogsResponse {}

class DescribeReplicationInstancesResponse {}

class DescribeReplicationSubnetGroupsResponse {}

class DescribeReplicationTaskAssessmentResultsResponse {}

class DescribeReplicationTasksResponse {}

class DescribeSchemasResponse {}

class DescribeTableStatisticsResponse {}

class DmsTransferSettings {}

class DynamoDbSettings {}

class ElasticsearchSettings {}

class Endpoint {}

class Event {}

class EventCategoryGroup {}

class EventSubscription {}

class Filter {}

class ImportCertificateResponse {}

class KinesisSettings {}

class ListTagsForResourceResponse {}

class ModifyEndpointResponse {}

class ModifyEventSubscriptionResponse {}

class ModifyReplicationInstanceResponse {}

class ModifyReplicationSubnetGroupResponse {}

class ModifyReplicationTaskResponse {}

class MongoDbSettings {}

class OrderableReplicationInstance {}

class PendingMaintenanceAction {}

class RebootReplicationInstanceResponse {}

class RedshiftSettings {}

class RefreshSchemasResponse {}

class RefreshSchemasStatus {}

class ReloadTablesResponse {}

class RemoveTagsFromResourceResponse {}

class ReplicationInstance {}

class ReplicationInstanceTaskLog {}

class ReplicationPendingModifiedValues {}

class ReplicationSubnetGroup {}

class ReplicationTask {}

class ReplicationTaskAssessmentResult {}

class ReplicationTaskStats {}

class ResourcePendingMaintenanceActions {}

class S3Settings {}

class StartReplicationTaskAssessmentResponse {}

class StartReplicationTaskResponse {}

class StopReplicationTaskResponse {}

class Subnet {}

class SupportedEndpointType {}

class TableStatistics {}

class TableToReload {}

class Tag {}

class TestConnectionResponse {}

class VpcSecurityGroupMembership {}
