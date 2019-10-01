import 'package:meta/meta.dart';

/// AAWS Sever Migration Service
///
/// This is the _AWS Sever Migration Service API Reference_. It provides
/// descriptions, syntax, and usage examples for each of the actions and data
/// types for the AWS Sever Migration Service (AWS SMS). The topic for each
/// action shows the Query API request parameters and the XML response. You can
/// also view the XML request elements in the WSDL.
///
/// Alternatively, you can use one of the AWS SDKs to access an API that's
/// tailored to the programming language or platform that you're using. For more
/// information, see [AWS SDKs](http://aws.amazon.com/tools/#SDKs).
///
/// To learn more about the Server Migration Service, see the following
/// resources:
///
/// *    [AWS Sever Migration Service product
/// page](https://aws.amazon.com/server-migration-service/)
///
/// *    [AWS Sever Migration Service User
/// Guide](https://docs.aws.amazon.com/server-migration-service/latest/userguide/server-migration.html)
class SmsApi {
  /// Creates an application. An application consists of one or more server
  /// groups. Each server group contain one or more servers.
  Future<void> createApp(
      {String name,
      String description,
      String roleName,
      String clientToken,
      List<ServerGroup> serverGroups,
      List<Tag> tags}) async {}

  /// Creates a replication job. The replication job schedules periodic
  /// replication runs to replicate your server to AWS. Each replication run
  /// creates an Amazon Machine Image (AMI).
  Future<void> createReplicationJob(
      {@required String serverId,
      @required DateTime seedReplicationTime,
      int frequency,
      bool runOnce,
      String licenseType,
      String roleName,
      String description,
      int numberOfRecentAmisToKeep,
      bool encrypted,
      String kmsKeyId}) async {}

  /// Deletes an existing application. Optionally deletes the launched stack
  /// associated with the application and all AWS SMS replication jobs for
  /// servers in the application.
  Future<void> deleteApp(
      {String appId,
      bool forceStopAppReplication,
      bool forceTerminateApp}) async {}

  /// Deletes existing launch configuration for an application.
  Future<void> deleteAppLaunchConfiguration({String appId}) async {}

  /// Deletes existing replication configuration for an application.
  Future<void> deleteAppReplicationConfiguration({String appId}) async {}

  /// Deletes the specified replication job.
  ///
  /// After you delete a replication job, there are no further replication runs.
  /// AWS deletes the contents of the Amazon S3 bucket used to store AWS SMS
  /// artifacts. The AMIs created by the replication runs are not deleted.
  Future<void> deleteReplicationJob(String replicationJobId) async {}

  /// Deletes all servers from your server catalog.
  Future<void> deleteServerCatalog() async {}

  /// Disassociates the specified connector from AWS SMS.
  ///
  /// After you disassociate a connector, it is no longer available to support
  /// replication jobs.
  Future<void> disassociateConnector(String connectorId) async {}

  /// Generates a target change set for a currently launched stack and writes it
  /// to an Amazon S3 object in the customer’s Amazon S3 bucket.
  Future<void> generateChangeSet(
      {String appId, String changesetFormat}) async {}

  /// Generates an Amazon CloudFormation template based on the current launch
  /// configuration and writes it to an Amazon S3 object in the customer’s
  /// Amazon S3 bucket.
  Future<void> generateTemplate({String appId, String templateFormat}) async {}

  /// Retrieve information about an application.
  Future<void> getApp({String appId}) async {}

  /// Retrieves the application launch configuration associated with an
  /// application.
  Future<void> getAppLaunchConfiguration({String appId}) async {}

  /// Retrieves an application replication configuration associatd with an
  /// application.
  Future<void> getAppReplicationConfiguration({String appId}) async {}

  /// Describes the connectors registered with the AWS SMS.
  Future<void> getConnectors({String nextToken, int maxResults}) async {}

  /// Describes the specified replication job or all of your replication jobs.
  Future<void> getReplicationJobs(
      {String replicationJobId, String nextToken, int maxResults}) async {}

  /// Describes the replication runs for the specified replication job.
  Future<void> getReplicationRuns(String replicationJobId,
      {String nextToken, int maxResults}) async {}

  /// Describes the servers in your server catalog.
  ///
  /// Before you can describe your servers, you must import them using
  /// ImportServerCatalog.
  Future<void> getServers(
      {String nextToken,
      int maxResults,
      List<VmServerAddress> vmServerAddressList}) async {}

  /// Gathers a complete list of on-premises servers. Connectors must be
  /// installed and monitoring all servers that you want to import.
  ///
  /// This call returns immediately, but might take additional time to retrieve
  /// all the servers.
  Future<void> importServerCatalog() async {}

  /// Launches an application stack.
  Future<void> launchApp({String appId}) async {}

  /// Returns a list of summaries for all applications.
  Future<void> listApps(
      {List<String> appIds, String nextToken, int maxResults}) async {}

  /// Creates a launch configuration for an application.
  Future<void> putAppLaunchConfiguration(
      {String appId,
      String roleName,
      List<ServerGroupLaunchConfiguration>
          serverGroupLaunchConfigurations}) async {}

  /// Creates or updates a replication configuration for an application.
  Future<void> putAppReplicationConfiguration(
      {String appId,
      List<ServerGroupReplicationConfiguration>
          serverGroupReplicationConfigurations}) async {}

  /// Starts replicating an application.
  Future<void> startAppReplication({String appId}) async {}

  /// Starts an on-demand replication run for the specified replication job.
  /// This replication run starts immediately. This replication run is in
  /// addition to the ones already scheduled.
  ///
  /// There is a limit on the number of on-demand replications runs you can
  /// request in a 24-hour period.
  Future<void> startOnDemandReplicationRun(String replicationJobId,
      {String description}) async {}

  /// Stops replicating an application.
  Future<void> stopAppReplication({String appId}) async {}

  /// Terminates the stack for an application.
  Future<void> terminateApp({String appId}) async {}

  /// Updates an application.
  Future<void> updateApp(
      {String appId,
      String name,
      String description,
      String roleName,
      List<ServerGroup> serverGroups,
      List<Tag> tags}) async {}

  /// Updates the specified settings for the specified replication job.
  Future<void> updateReplicationJob(String replicationJobId,
      {int frequency,
      DateTime nextReplicationRunStartTime,
      String licenseType,
      String roleName,
      String description,
      int numberOfRecentAmisToKeep,
      bool encrypted,
      String kmsKeyId}) async {}
}

class AppSummary {}

class Connector {}

class CreateAppResponse {}

class CreateReplicationJobResponse {}

class DeleteAppLaunchConfigurationResponse {}

class DeleteAppReplicationConfigurationResponse {}

class DeleteAppResponse {}

class DeleteReplicationJobResponse {}

class DeleteServerCatalogResponse {}

class DisassociateConnectorResponse {}

class GenerateChangeSetResponse {}

class GenerateTemplateResponse {}

class GetAppLaunchConfigurationResponse {}

class GetAppReplicationConfigurationResponse {}

class GetAppResponse {}

class GetConnectorsResponse {}

class GetReplicationJobsResponse {}

class GetReplicationRunsResponse {}

class GetServersResponse {}

class ImportServerCatalogResponse {}

class LaunchAppResponse {}

class LaunchDetails {}

class ListAppsResponse {}

class PutAppLaunchConfigurationResponse {}

class PutAppReplicationConfigurationResponse {}

class ReplicationJob {}

class ReplicationRun {}

class ReplicationRunStageDetails {}

class S3Location {}

class Server {}

class ServerGroup {}

class ServerGroupLaunchConfiguration {}

class ServerGroupReplicationConfiguration {}

class ServerLaunchConfiguration {}

class ServerReplicationConfiguration {}

class ServerReplicationParameters {}

class StartAppReplicationResponse {}

class StartOnDemandReplicationRunResponse {}

class StopAppReplicationResponse {}

class Tag {}

class TerminateAppResponse {}

class UpdateAppResponse {}

class UpdateReplicationJobResponse {}

class UserData {}

class VmServer {}

class VmServerAddress {}
