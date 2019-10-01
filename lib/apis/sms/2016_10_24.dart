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
  ///
  /// [name]: Name of the new application.
  ///
  /// [description]: Description of the new application
  ///
  /// [roleName]: Name of service role in customer's account to be used by AWS
  /// SMS.
  ///
  /// [clientToken]: A unique, case-sensitive identifier you provide to ensure
  /// idempotency of application creation.
  ///
  /// [serverGroups]: List of server groups to include in the application.
  ///
  /// [tags]: List of tags to be associated with the application.
  Future<CreateAppResponse> createApp(
      {String name,
      String description,
      String roleName,
      String clientToken,
      List<ServerGroup> serverGroups,
      List<Tag> tags}) async {
    return CreateAppResponse.fromJson({});
  }

  /// Creates a replication job. The replication job schedules periodic
  /// replication runs to replicate your server to AWS. Each replication run
  /// creates an Amazon Machine Image (AMI).
  ///
  /// [serverId]: The identifier of the server.
  ///
  /// [seedReplicationTime]: The seed replication time.
  ///
  /// [frequency]: The time between consecutive replication runs, in hours.
  ///
  /// [runOnce]:
  ///
  /// [licenseType]: The license type to be used for the AMI created by a
  /// successful replication run.
  ///
  /// [roleName]: The name of the IAM role to be used by the AWS SMS.
  ///
  /// [description]: The description of the replication job.
  ///
  /// [numberOfRecentAmisToKeep]: The maximum number of SMS-created AMIs to
  /// retain. The oldest will be deleted once the maximum number is reached and
  /// a new AMI is created.
  ///
  /// [encrypted]: When _true_, the replication job produces encrypted AMIs. See
  /// also `KmsKeyId` below.
  ///
  /// [kmsKeyId]: KMS key ID for replication jobs that produce encrypted AMIs.
  /// Can be any of the following:
  ///
  /// *   KMS key ID
  ///
  /// *   KMS key alias
  ///
  /// *   ARN referring to KMS key ID
  ///
  /// *   ARN referring to KMS key alias
  ///
  ///
  ///  If encrypted is _true_ but a KMS key id is not specified, the customer's
  /// default KMS key for EBS is used.
  Future<CreateReplicationJobResponse> createReplicationJob(
      {@required String serverId,
      @required DateTime seedReplicationTime,
      int frequency,
      bool runOnce,
      String licenseType,
      String roleName,
      String description,
      int numberOfRecentAmisToKeep,
      bool encrypted,
      String kmsKeyId}) async {
    return CreateReplicationJobResponse.fromJson({});
  }

  /// Deletes an existing application. Optionally deletes the launched stack
  /// associated with the application and all AWS SMS replication jobs for
  /// servers in the application.
  ///
  /// [appId]: ID of the application to delete.
  ///
  /// [forceStopAppReplication]: While deleting the application, stop all
  /// replication jobs corresponding to the servers in the application.
  ///
  /// [forceTerminateApp]: While deleting the application, terminate the stack
  /// corresponding to the application.
  Future<DeleteAppResponse> deleteApp(
      {String appId,
      bool forceStopAppReplication,
      bool forceTerminateApp}) async {
    return DeleteAppResponse.fromJson({});
  }

  /// Deletes existing launch configuration for an application.
  ///
  /// [appId]: ID of the application associated with the launch configuration.
  Future<DeleteAppLaunchConfigurationResponse> deleteAppLaunchConfiguration(
      {String appId}) async {
    return DeleteAppLaunchConfigurationResponse.fromJson({});
  }

  /// Deletes existing replication configuration for an application.
  ///
  /// [appId]: ID of the application associated with the replication
  /// configuration.
  Future<DeleteAppReplicationConfigurationResponse>
      deleteAppReplicationConfiguration({String appId}) async {
    return DeleteAppReplicationConfigurationResponse.fromJson({});
  }

  /// Deletes the specified replication job.
  ///
  /// After you delete a replication job, there are no further replication runs.
  /// AWS deletes the contents of the Amazon S3 bucket used to store AWS SMS
  /// artifacts. The AMIs created by the replication runs are not deleted.
  ///
  /// [replicationJobId]: The identifier of the replication job.
  Future<DeleteReplicationJobResponse> deleteReplicationJob(
      String replicationJobId) async {
    return DeleteReplicationJobResponse.fromJson({});
  }

  /// Deletes all servers from your server catalog.
  Future<DeleteServerCatalogResponse> deleteServerCatalog() async {
    return DeleteServerCatalogResponse.fromJson({});
  }

  /// Disassociates the specified connector from AWS SMS.
  ///
  /// After you disassociate a connector, it is no longer available to support
  /// replication jobs.
  ///
  /// [connectorId]: The identifier of the connector.
  Future<DisassociateConnectorResponse> disassociateConnector(
      String connectorId) async {
    return DisassociateConnectorResponse.fromJson({});
  }

  /// Generates a target change set for a currently launched stack and writes it
  /// to an Amazon S3 object in the customer’s Amazon S3 bucket.
  ///
  /// [appId]: ID of the application associated with the change set.
  ///
  /// [changesetFormat]: Format for the change set.
  Future<GenerateChangeSetResponse> generateChangeSet(
      {String appId, String changesetFormat}) async {
    return GenerateChangeSetResponse.fromJson({});
  }

  /// Generates an Amazon CloudFormation template based on the current launch
  /// configuration and writes it to an Amazon S3 object in the customer’s
  /// Amazon S3 bucket.
  ///
  /// [appId]: ID of the application associated with the Amazon CloudFormation
  /// template.
  ///
  /// [templateFormat]: Format for generating the Amazon CloudFormation
  /// template.
  Future<GenerateTemplateResponse> generateTemplate(
      {String appId, String templateFormat}) async {
    return GenerateTemplateResponse.fromJson({});
  }

  /// Retrieve information about an application.
  ///
  /// [appId]: ID of the application whose information is being retrieved.
  Future<GetAppResponse> getApp({String appId}) async {
    return GetAppResponse.fromJson({});
  }

  /// Retrieves the application launch configuration associated with an
  /// application.
  ///
  /// [appId]: ID of the application launch configuration.
  Future<GetAppLaunchConfigurationResponse> getAppLaunchConfiguration(
      {String appId}) async {
    return GetAppLaunchConfigurationResponse.fromJson({});
  }

  /// Retrieves an application replication configuration associatd with an
  /// application.
  ///
  /// [appId]: ID of the application associated with the replication
  /// configuration.
  Future<GetAppReplicationConfigurationResponse> getAppReplicationConfiguration(
      {String appId}) async {
    return GetAppReplicationConfigurationResponse.fromJson({});
  }

  /// Describes the connectors registered with the AWS SMS.
  ///
  /// [nextToken]: The token for the next set of results.
  ///
  /// [maxResults]: The maximum number of results to return in a single call.
  /// The default value is 50. To retrieve the remaining results, make another
  /// call with the returned `NextToken` value.
  Future<GetConnectorsResponse> getConnectors(
      {String nextToken, int maxResults}) async {
    return GetConnectorsResponse.fromJson({});
  }

  /// Describes the specified replication job or all of your replication jobs.
  ///
  /// [replicationJobId]: The identifier of the replication job.
  ///
  /// [nextToken]: The token for the next set of results.
  ///
  /// [maxResults]: The maximum number of results to return in a single call.
  /// The default value is 50. To retrieve the remaining results, make another
  /// call with the returned `NextToken` value.
  Future<GetReplicationJobsResponse> getReplicationJobs(
      {String replicationJobId, String nextToken, int maxResults}) async {
    return GetReplicationJobsResponse.fromJson({});
  }

  /// Describes the replication runs for the specified replication job.
  ///
  /// [replicationJobId]: The identifier of the replication job.
  ///
  /// [nextToken]: The token for the next set of results.
  ///
  /// [maxResults]: The maximum number of results to return in a single call.
  /// The default value is 50. To retrieve the remaining results, make another
  /// call with the returned `NextToken` value.
  Future<GetReplicationRunsResponse> getReplicationRuns(String replicationJobId,
      {String nextToken, int maxResults}) async {
    return GetReplicationRunsResponse.fromJson({});
  }

  /// Describes the servers in your server catalog.
  ///
  /// Before you can describe your servers, you must import them using
  /// ImportServerCatalog.
  ///
  /// [nextToken]: The token for the next set of results.
  ///
  /// [maxResults]: The maximum number of results to return in a single call.
  /// The default value is 50. To retrieve the remaining results, make another
  /// call with the returned `NextToken` value.
  ///
  /// [vmServerAddressList]: List of `VmServerAddress` objects
  Future<GetServersResponse> getServers(
      {String nextToken,
      int maxResults,
      List<VmServerAddress> vmServerAddressList}) async {
    return GetServersResponse.fromJson({});
  }

  /// Gathers a complete list of on-premises servers. Connectors must be
  /// installed and monitoring all servers that you want to import.
  ///
  /// This call returns immediately, but might take additional time to retrieve
  /// all the servers.
  Future<ImportServerCatalogResponse> importServerCatalog() async {
    return ImportServerCatalogResponse.fromJson({});
  }

  /// Launches an application stack.
  ///
  /// [appId]: ID of the application to launch.
  Future<LaunchAppResponse> launchApp({String appId}) async {
    return LaunchAppResponse.fromJson({});
  }

  /// Returns a list of summaries for all applications.
  ///
  /// [appIds]:
  ///
  /// [nextToken]: The token for the next set of results.
  ///
  /// [maxResults]: The maximum number of results to return in a single call.
  /// The default value is 50. To retrieve the remaining results, make another
  /// call with the returned `NextToken` value.
  Future<ListAppsResponse> listApps(
      {List<String> appIds, String nextToken, int maxResults}) async {
    return ListAppsResponse.fromJson({});
  }

  /// Creates a launch configuration for an application.
  ///
  /// [appId]: ID of the application associated with the launch configuration.
  ///
  /// [roleName]: Name of service role in the customer's account that Amazon
  /// CloudFormation uses to launch the application.
  ///
  /// [serverGroupLaunchConfigurations]: Launch configurations for server groups
  /// in the application.
  Future<PutAppLaunchConfigurationResponse> putAppLaunchConfiguration(
      {String appId,
      String roleName,
      List<ServerGroupLaunchConfiguration>
          serverGroupLaunchConfigurations}) async {
    return PutAppLaunchConfigurationResponse.fromJson({});
  }

  /// Creates or updates a replication configuration for an application.
  ///
  /// [appId]: ID of the application tassociated with the replication
  /// configuration.
  ///
  /// [serverGroupReplicationConfigurations]: Replication configurations for
  /// server groups in the application.
  Future<PutAppReplicationConfigurationResponse> putAppReplicationConfiguration(
      {String appId,
      List<ServerGroupReplicationConfiguration>
          serverGroupReplicationConfigurations}) async {
    return PutAppReplicationConfigurationResponse.fromJson({});
  }

  /// Starts replicating an application.
  ///
  /// [appId]: ID of the application to replicate.
  Future<StartAppReplicationResponse> startAppReplication(
      {String appId}) async {
    return StartAppReplicationResponse.fromJson({});
  }

  /// Starts an on-demand replication run for the specified replication job.
  /// This replication run starts immediately. This replication run is in
  /// addition to the ones already scheduled.
  ///
  /// There is a limit on the number of on-demand replications runs you can
  /// request in a 24-hour period.
  ///
  /// [replicationJobId]: The identifier of the replication job.
  ///
  /// [description]: The description of the replication run.
  Future<StartOnDemandReplicationRunResponse> startOnDemandReplicationRun(
      String replicationJobId,
      {String description}) async {
    return StartOnDemandReplicationRunResponse.fromJson({});
  }

  /// Stops replicating an application.
  ///
  /// [appId]: ID of the application to stop replicating.
  Future<StopAppReplicationResponse> stopAppReplication({String appId}) async {
    return StopAppReplicationResponse.fromJson({});
  }

  /// Terminates the stack for an application.
  ///
  /// [appId]: ID of the application to terminate.
  Future<TerminateAppResponse> terminateApp({String appId}) async {
    return TerminateAppResponse.fromJson({});
  }

  /// Updates an application.
  ///
  /// [appId]: ID of the application to update.
  ///
  /// [name]: New name of the application.
  ///
  /// [description]: New description of the application.
  ///
  /// [roleName]: Name of the service role in the customer's account used by AWS
  /// SMS.
  ///
  /// [serverGroups]: List of server groups in the application to update.
  ///
  /// [tags]: List of tags to associate with the application.
  Future<UpdateAppResponse> updateApp(
      {String appId,
      String name,
      String description,
      String roleName,
      List<ServerGroup> serverGroups,
      List<Tag> tags}) async {
    return UpdateAppResponse.fromJson({});
  }

  /// Updates the specified settings for the specified replication job.
  ///
  /// [replicationJobId]: The identifier of the replication job.
  ///
  /// [frequency]: The time between consecutive replication runs, in hours.
  ///
  /// [nextReplicationRunStartTime]: The start time of the next replication run.
  ///
  /// [licenseType]: The license type to be used for the AMI created by a
  /// successful replication run.
  ///
  /// [roleName]: The name of the IAM role to be used by AWS SMS.
  ///
  /// [description]: The description of the replication job.
  ///
  /// [numberOfRecentAmisToKeep]: The maximum number of SMS-created AMIs to
  /// retain. The oldest will be deleted once the maximum number is reached and
  /// a new AMI is created.
  ///
  /// [encrypted]: When true, the replication job produces encrypted AMIs . See
  /// also `KmsKeyId` below.
  ///
  /// [kmsKeyId]: KMS key ID for replication jobs that produce encrypted AMIs.
  /// Can be any of the following:
  ///
  /// *   KMS key ID
  ///
  /// *   KMS key alias
  ///
  /// *   ARN referring to KMS key ID
  ///
  /// *   ARN referring to KMS key alias
  ///
  ///
  ///  If encrypted is _true_ but a KMS key id is not specified, the customer's
  /// default KMS key for EBS is used.
  Future<UpdateReplicationJobResponse> updateReplicationJob(
      String replicationJobId,
      {int frequency,
      DateTime nextReplicationRunStartTime,
      String licenseType,
      String roleName,
      String description,
      int numberOfRecentAmisToKeep,
      bool encrypted,
      String kmsKeyId}) async {
    return UpdateReplicationJobResponse.fromJson({});
  }
}

class AppSummary {
  /// Unique ID of the application.
  final String appId;

  /// Name of the application.
  final String name;

  /// Description of the application.
  final String description;

  /// Status of the application.
  final String status;

  /// A message related to the status of the application
  final String statusMessage;

  /// Replication status of the application.
  final String replicationStatus;

  /// A message related to the replication status of the application.
  final String replicationStatusMessage;

  /// Timestamp of the application's most recent successful replication.
  final DateTime latestReplicationTime;

  /// Launch status of the application.
  final String launchStatus;

  /// A message related to the launch status of the application.
  final String launchStatusMessage;

  /// Details about the latest launch of the application.
  final LaunchDetails launchDetails;

  /// Time of creation of this application.
  final DateTime creationTime;

  /// Timestamp of the application's creation.
  final DateTime lastModified;

  /// Name of the service role in the customer's account used by AWS SMS.
  final String roleName;

  /// Number of server groups present in the application.
  final int totalServerGroups;

  /// Number of servers present in the application.
  final int totalServers;

  AppSummary({
    this.appId,
    this.name,
    this.description,
    this.status,
    this.statusMessage,
    this.replicationStatus,
    this.replicationStatusMessage,
    this.latestReplicationTime,
    this.launchStatus,
    this.launchStatusMessage,
    this.launchDetails,
    this.creationTime,
    this.lastModified,
    this.roleName,
    this.totalServerGroups,
    this.totalServers,
  });
  static AppSummary fromJson(Map<String, dynamic> json) => AppSummary();
}

class Connector {
  /// The identifier of the connector.
  final String connectorId;

  /// The connector version.
  final String version;

  /// The status of the connector.
  final String status;

  /// The capabilities of the connector.
  final List<String> capabilityList;

  /// The name of the VM manager.
  final String vmManagerName;

  /// The VM management product.
  final String vmManagerType;

  /// The identifier of the VM manager.
  final String vmManagerId;

  /// The IP address of the connector.
  final String ipAddress;

  /// The MAC address of the connector.
  final String macAddress;

  /// The time the connector was associated.
  final DateTime associatedOn;

  Connector({
    this.connectorId,
    this.version,
    this.status,
    this.capabilityList,
    this.vmManagerName,
    this.vmManagerType,
    this.vmManagerId,
    this.ipAddress,
    this.macAddress,
    this.associatedOn,
  });
  static Connector fromJson(Map<String, dynamic> json) => Connector();
}

class CreateAppResponse {
  /// Summary description of the application.
  final AppSummary appSummary;

  /// List of server groups included in the application.
  final List<ServerGroup> serverGroups;

  /// List of taags associated with the application.
  final List<Tag> tags;

  CreateAppResponse({
    this.appSummary,
    this.serverGroups,
    this.tags,
  });
  static CreateAppResponse fromJson(Map<String, dynamic> json) =>
      CreateAppResponse();
}

class CreateReplicationJobResponse {
  /// The unique identifier of the replication job.
  final String replicationJobId;

  CreateReplicationJobResponse({
    this.replicationJobId,
  });
  static CreateReplicationJobResponse fromJson(Map<String, dynamic> json) =>
      CreateReplicationJobResponse();
}

class DeleteAppLaunchConfigurationResponse {
  DeleteAppLaunchConfigurationResponse();
  static DeleteAppLaunchConfigurationResponse fromJson(
          Map<String, dynamic> json) =>
      DeleteAppLaunchConfigurationResponse();
}

class DeleteAppReplicationConfigurationResponse {
  DeleteAppReplicationConfigurationResponse();
  static DeleteAppReplicationConfigurationResponse fromJson(
          Map<String, dynamic> json) =>
      DeleteAppReplicationConfigurationResponse();
}

class DeleteAppResponse {
  DeleteAppResponse();
  static DeleteAppResponse fromJson(Map<String, dynamic> json) =>
      DeleteAppResponse();
}

class DeleteReplicationJobResponse {
  DeleteReplicationJobResponse();
  static DeleteReplicationJobResponse fromJson(Map<String, dynamic> json) =>
      DeleteReplicationJobResponse();
}

class DeleteServerCatalogResponse {
  DeleteServerCatalogResponse();
  static DeleteServerCatalogResponse fromJson(Map<String, dynamic> json) =>
      DeleteServerCatalogResponse();
}

class DisassociateConnectorResponse {
  DisassociateConnectorResponse();
  static DisassociateConnectorResponse fromJson(Map<String, dynamic> json) =>
      DisassociateConnectorResponse();
}

class GenerateChangeSetResponse {
  /// Location of the Amazon S3 object.
  final S3Location s3Location;

  GenerateChangeSetResponse({
    this.s3Location,
  });
  static GenerateChangeSetResponse fromJson(Map<String, dynamic> json) =>
      GenerateChangeSetResponse();
}

class GenerateTemplateResponse {
  /// Location of the Amazon S3 object.
  final S3Location s3Location;

  GenerateTemplateResponse({
    this.s3Location,
  });
  static GenerateTemplateResponse fromJson(Map<String, dynamic> json) =>
      GenerateTemplateResponse();
}

class GetAppLaunchConfigurationResponse {
  /// ID of the application associated with the launch configuration.
  final String appId;

  /// Name of the service role in the customer's account that Amazon
  /// CloudFormation uses to launch the application.
  final String roleName;

  /// List of launch configurations for server groups in this application.
  final List<ServerGroupLaunchConfiguration> serverGroupLaunchConfigurations;

  GetAppLaunchConfigurationResponse({
    this.appId,
    this.roleName,
    this.serverGroupLaunchConfigurations,
  });
  static GetAppLaunchConfigurationResponse fromJson(
          Map<String, dynamic> json) =>
      GetAppLaunchConfigurationResponse();
}

class GetAppReplicationConfigurationResponse {
  /// Replication configurations associated with server groups in this
  /// application.
  final List<ServerGroupReplicationConfiguration>
      serverGroupReplicationConfigurations;

  GetAppReplicationConfigurationResponse({
    this.serverGroupReplicationConfigurations,
  });
  static GetAppReplicationConfigurationResponse fromJson(
          Map<String, dynamic> json) =>
      GetAppReplicationConfigurationResponse();
}

class GetAppResponse {
  /// Information about the application.
  final AppSummary appSummary;

  /// List of server groups belonging to the application.
  final List<ServerGroup> serverGroups;

  /// List of tags associated with the application.
  final List<Tag> tags;

  GetAppResponse({
    this.appSummary,
    this.serverGroups,
    this.tags,
  });
  static GetAppResponse fromJson(Map<String, dynamic> json) => GetAppResponse();
}

class GetConnectorsResponse {
  /// Information about the registered connectors.
  final List<Connector> connectorList;

  /// The token required to retrieve the next set of results. This value is null
  /// when there are no more results to return.
  final String nextToken;

  GetConnectorsResponse({
    this.connectorList,
    this.nextToken,
  });
  static GetConnectorsResponse fromJson(Map<String, dynamic> json) =>
      GetConnectorsResponse();
}

class GetReplicationJobsResponse {
  /// Information about the replication jobs.
  final List<ReplicationJob> replicationJobList;

  /// The token required to retrieve the next set of results. This value is null
  /// when there are no more results to return.
  final String nextToken;

  GetReplicationJobsResponse({
    this.replicationJobList,
    this.nextToken,
  });
  static GetReplicationJobsResponse fromJson(Map<String, dynamic> json) =>
      GetReplicationJobsResponse();
}

class GetReplicationRunsResponse {
  /// Information about the replication job.
  final ReplicationJob replicationJob;

  /// Information about the replication runs.
  final List<ReplicationRun> replicationRunList;

  /// The token required to retrieve the next set of results. This value is null
  /// when there are no more results to return.
  final String nextToken;

  GetReplicationRunsResponse({
    this.replicationJob,
    this.replicationRunList,
    this.nextToken,
  });
  static GetReplicationRunsResponse fromJson(Map<String, dynamic> json) =>
      GetReplicationRunsResponse();
}

class GetServersResponse {
  /// The time when the server was last modified.
  final DateTime lastModifiedOn;

  /// The status of the server catalog.
  final String serverCatalogStatus;

  /// Information about the servers.
  final List<Server> serverList;

  /// The token required to retrieve the next set of results. This value is null
  /// when there are no more results to return.
  final String nextToken;

  GetServersResponse({
    this.lastModifiedOn,
    this.serverCatalogStatus,
    this.serverList,
    this.nextToken,
  });
  static GetServersResponse fromJson(Map<String, dynamic> json) =>
      GetServersResponse();
}

class ImportServerCatalogResponse {
  ImportServerCatalogResponse();
  static ImportServerCatalogResponse fromJson(Map<String, dynamic> json) =>
      ImportServerCatalogResponse();
}

class LaunchAppResponse {
  LaunchAppResponse();
  static LaunchAppResponse fromJson(Map<String, dynamic> json) =>
      LaunchAppResponse();
}

class LaunchDetails {
  /// Latest time this application was launched successfully.
  final DateTime latestLaunchTime;

  /// Name of the latest stack launched for this application.
  final String stackName;

  /// Identifier of the latest stack launched for this application.
  final String stackId;

  LaunchDetails({
    this.latestLaunchTime,
    this.stackName,
    this.stackId,
  });
  static LaunchDetails fromJson(Map<String, dynamic> json) => LaunchDetails();
}

class ListAppsResponse {
  /// A list of application summaries.
  final List<AppSummary> apps;

  /// The token required to retrieve the next set of results. This value is null
  /// when there are no more results to return.
  final String nextToken;

  ListAppsResponse({
    this.apps,
    this.nextToken,
  });
  static ListAppsResponse fromJson(Map<String, dynamic> json) =>
      ListAppsResponse();
}

class PutAppLaunchConfigurationResponse {
  PutAppLaunchConfigurationResponse();
  static PutAppLaunchConfigurationResponse fromJson(
          Map<String, dynamic> json) =>
      PutAppLaunchConfigurationResponse();
}

class PutAppReplicationConfigurationResponse {
  PutAppReplicationConfigurationResponse();
  static PutAppReplicationConfigurationResponse fromJson(
          Map<String, dynamic> json) =>
      PutAppReplicationConfigurationResponse();
}

class ReplicationJob {
  /// The identifier of the replication job.
  final String replicationJobId;

  /// The identifier of the server.
  final String serverId;

  /// The type of server.
  final String serverType;

  /// Information about the VM server.
  final VmServer vmServer;

  /// The seed replication time.
  final DateTime seedReplicationTime;

  /// The time between consecutive replication runs, in hours.
  final int frequency;

  final bool runOnce;

  /// The start time of the next replication run.
  final DateTime nextReplicationRunStartTime;

  /// The license type to be used for the AMI created by a successful
  /// replication run.
  final String licenseType;

  /// The name of the IAM role to be used by the Server Migration Service.
  final String roleName;

  /// The ID of the latest Amazon Machine Image (AMI).
  final String latestAmiId;

  /// The state of the replication job.
  final String state;

  /// The description of the current status of the replication job.
  final String statusMessage;

  /// The description of the replication job.
  final String description;

  /// Number of recent AMIs to keep in the customer's account for a replication
  /// job. By default the value is set to zero, meaning that all AMIs are kept.
  final int numberOfRecentAmisToKeep;

  /// Whether the replication job should produce encrypted AMIs or not. See also
  /// `KmsKeyId` below.
  final bool encrypted;

  /// KMS key ID for replication jobs that produce encrypted AMIs. Can be any of
  /// the following:
  ///
  /// *   KMS key ID
  ///
  /// *   KMS key alias
  ///
  /// *   ARN referring to KMS key ID
  ///
  /// *   ARN referring to KMS key alias
  ///
  ///
  ///  If encrypted is _true_ but a KMS key id is not specified, the customer's
  /// default KMS key for EBS is used.
  final String kmsKeyId;

  /// Information about the replication runs.
  final List<ReplicationRun> replicationRunList;

  ReplicationJob({
    this.replicationJobId,
    this.serverId,
    this.serverType,
    this.vmServer,
    this.seedReplicationTime,
    this.frequency,
    this.runOnce,
    this.nextReplicationRunStartTime,
    this.licenseType,
    this.roleName,
    this.latestAmiId,
    this.state,
    this.statusMessage,
    this.description,
    this.numberOfRecentAmisToKeep,
    this.encrypted,
    this.kmsKeyId,
    this.replicationRunList,
  });
  static ReplicationJob fromJson(Map<String, dynamic> json) => ReplicationJob();
}

class ReplicationRun {
  /// The identifier of the replication run.
  final String replicationRunId;

  /// The state of the replication run.
  final String state;

  /// The type of replication run.
  final String type;

  /// Details of the current stage of the replication run.
  final ReplicationRunStageDetails stageDetails;

  /// The description of the current status of the replication job.
  final String statusMessage;

  /// The identifier of the Amazon Machine Image (AMI) from the replication run.
  final String amiId;

  /// The start time of the next replication run.
  final DateTime scheduledStartTime;

  /// The completion time of the last replication run.
  final DateTime completedTime;

  /// The description of the replication run.
  final String description;

  /// Whether the replication run should produce encrypted AMI or not. See also
  /// `KmsKeyId` below.
  final bool encrypted;

  /// KMS key ID for replication jobs that produce encrypted AMIs. Can be any of
  /// the following:
  ///
  /// *   KMS key ID
  ///
  /// *   KMS key alias
  ///
  /// *   ARN referring to KMS key ID
  ///
  /// *   ARN referring to KMS key alias
  ///
  ///
  ///  If encrypted is _true_ but a KMS key id is not specified, the customer's
  /// default KMS key for EBS is used.
  final String kmsKeyId;

  ReplicationRun({
    this.replicationRunId,
    this.state,
    this.type,
    this.stageDetails,
    this.statusMessage,
    this.amiId,
    this.scheduledStartTime,
    this.completedTime,
    this.description,
    this.encrypted,
    this.kmsKeyId,
  });
  static ReplicationRun fromJson(Map<String, dynamic> json) => ReplicationRun();
}

class ReplicationRunStageDetails {
  /// String describing the current stage of a replication run.
  final String stage;

  /// String describing the progress of the current stage of a replication run.
  final String stageProgress;

  ReplicationRunStageDetails({
    this.stage,
    this.stageProgress,
  });
  static ReplicationRunStageDetails fromJson(Map<String, dynamic> json) =>
      ReplicationRunStageDetails();
}

class S3Location {
  /// Amazon S3 bucket name.
  final String bucket;

  /// Amazon S3 bucket key.
  final String key;

  S3Location({
    this.bucket,
    this.key,
  });
  static S3Location fromJson(Map<String, dynamic> json) => S3Location();
}

class Server {
  /// The identifier of the server.
  final String serverId;

  /// The type of server.
  final String serverType;

  /// Information about the VM server.
  final VmServer vmServer;

  /// The identifier of the replication job.
  final String replicationJobId;

  /// Indicates whether the replication job is deleted or failed.
  final bool replicationJobTerminated;

  Server({
    this.serverId,
    this.serverType,
    this.vmServer,
    this.replicationJobId,
    this.replicationJobTerminated,
  });
  static Server fromJson(Map<String, dynamic> json) => Server();
}

class ServerGroup {
  /// Identifier of a server group.
  final String serverGroupId;

  /// Name of a server group.
  final String name;

  /// List of servers belonging to a server group.
  final List<Server> serverList;

  ServerGroup({
    this.serverGroupId,
    this.name,
    this.serverList,
  });
  static ServerGroup fromJson(Map<String, dynamic> json) => ServerGroup();
}

class ServerGroupLaunchConfiguration {
  /// Identifier of the server group the launch configuration is associated
  /// with.
  final String serverGroupId;

  /// Launch order of servers in the server group.
  final int launchOrder;

  /// Launch configuration for servers in the server group.
  final List<ServerLaunchConfiguration> serverLaunchConfigurations;

  ServerGroupLaunchConfiguration({
    this.serverGroupId,
    this.launchOrder,
    this.serverLaunchConfigurations,
  });
  static ServerGroupLaunchConfiguration fromJson(Map<String, dynamic> json) =>
      ServerGroupLaunchConfiguration();
}

class ServerGroupReplicationConfiguration {
  /// Identifier of the server group this replication configuration is
  /// associated with.
  final String serverGroupId;

  /// Replication configuration for servers in the server group.
  final List<ServerReplicationConfiguration> serverReplicationConfigurations;

  ServerGroupReplicationConfiguration({
    this.serverGroupId,
    this.serverReplicationConfigurations,
  });
  static ServerGroupReplicationConfiguration fromJson(
          Map<String, dynamic> json) =>
      ServerGroupReplicationConfiguration();
}

class ServerLaunchConfiguration {
  /// Identifier of the server the launch configuration is associated with.
  final Server server;

  /// Logical ID of the server in the Amazon CloudFormation template.
  final String logicalId;

  /// Identifier of the VPC the server should be launched into.
  final String vpc;

  /// Identifier of the subnet the server should be launched into.
  final String subnet;

  /// Identifier of the security group that applies to the launched server.
  final String securityGroup;

  /// Name of the EC2 SSH Key to be used for connecting to the launched server.
  final String ec2KeyName;

  /// Location of the user-data script to be executed when launching the server.
  final UserData userData;

  /// Instance type to be used for launching the server.
  final String instanceType;

  /// If true, a publicly accessible IP address is created when launching the
  /// server.
  final bool associatePublicIpAddress;

  ServerLaunchConfiguration({
    this.server,
    this.logicalId,
    this.vpc,
    this.subnet,
    this.securityGroup,
    this.ec2KeyName,
    this.userData,
    this.instanceType,
    this.associatePublicIpAddress,
  });
  static ServerLaunchConfiguration fromJson(Map<String, dynamic> json) =>
      ServerLaunchConfiguration();
}

class ServerReplicationConfiguration {
  /// Identifier of the server this replication configuration is associated
  /// with.
  final Server server;

  /// Parameters for replicating the server.
  final ServerReplicationParameters serverReplicationParameters;

  ServerReplicationConfiguration({
    this.server,
    this.serverReplicationParameters,
  });
  static ServerReplicationConfiguration fromJson(Map<String, dynamic> json) =>
      ServerReplicationConfiguration();
}

class ServerReplicationParameters {
  /// Seed time for creating a replication job for the server.
  final DateTime seedTime;

  /// Frequency of creating replication jobs for the server.
  final int frequency;

  final bool runOnce;

  /// License type for creating a replication job for the server.
  final String licenseType;

  /// Number of recent AMIs to keep when creating a replication job for this
  /// server.
  final int numberOfRecentAmisToKeep;

  /// When true, the replication job produces encrypted AMIs. See also
  /// `KmsKeyId` below.
  final bool encrypted;

  /// KMS key ID for replication jobs that produce encrypted AMIs. Can be any of
  /// the following:
  ///
  /// *   KMS key ID
  ///
  /// *   KMS key alias
  ///
  /// *   ARN referring to KMS key ID
  ///
  /// *   ARN referring to KMS key alias
  ///
  ///
  ///  If encrypted is _true_ but a KMS key id is not specified, the customer's
  /// default KMS key for EBS is used.
  final String kmsKeyId;

  ServerReplicationParameters({
    this.seedTime,
    this.frequency,
    this.runOnce,
    this.licenseType,
    this.numberOfRecentAmisToKeep,
    this.encrypted,
    this.kmsKeyId,
  });
  static ServerReplicationParameters fromJson(Map<String, dynamic> json) =>
      ServerReplicationParameters();
}

class StartAppReplicationResponse {
  StartAppReplicationResponse();
  static StartAppReplicationResponse fromJson(Map<String, dynamic> json) =>
      StartAppReplicationResponse();
}

class StartOnDemandReplicationRunResponse {
  /// The identifier of the replication run.
  final String replicationRunId;

  StartOnDemandReplicationRunResponse({
    this.replicationRunId,
  });
  static StartOnDemandReplicationRunResponse fromJson(
          Map<String, dynamic> json) =>
      StartOnDemandReplicationRunResponse();
}

class StopAppReplicationResponse {
  StopAppReplicationResponse();
  static StopAppReplicationResponse fromJson(Map<String, dynamic> json) =>
      StopAppReplicationResponse();
}

class Tag {
  /// Tag key.
  final String key;

  /// Tag value.
  final String value;

  Tag({
    this.key,
    this.value,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag();
}

class TerminateAppResponse {
  TerminateAppResponse();
  static TerminateAppResponse fromJson(Map<String, dynamic> json) =>
      TerminateAppResponse();
}

class UpdateAppResponse {
  /// Summary description of the application.
  final AppSummary appSummary;

  /// List of updated server groups in the application.
  final List<ServerGroup> serverGroups;

  /// List of tags associated with the application.
  final List<Tag> tags;

  UpdateAppResponse({
    this.appSummary,
    this.serverGroups,
    this.tags,
  });
  static UpdateAppResponse fromJson(Map<String, dynamic> json) =>
      UpdateAppResponse();
}

class UpdateReplicationJobResponse {
  UpdateReplicationJobResponse();
  static UpdateReplicationJobResponse fromJson(Map<String, dynamic> json) =>
      UpdateReplicationJobResponse();
}

class UserData {
  /// Amazon S3 location of the user-data script.
  final S3Location s3Location;

  UserData({
    this.s3Location,
  });
  static UserData fromJson(Map<String, dynamic> json) => UserData();
}

class VmServer {
  /// Information about the VM server location.
  final VmServerAddress vmServerAddress;

  /// The name of the VM.
  final String vmName;

  /// The name of the VM manager.
  final String vmManagerName;

  /// The type of VM management product.
  final String vmManagerType;

  /// The VM folder path in the vCenter Server virtual machine inventory tree.
  final String vmPath;

  VmServer({
    this.vmServerAddress,
    this.vmName,
    this.vmManagerName,
    this.vmManagerType,
    this.vmPath,
  });
  static VmServer fromJson(Map<String, dynamic> json) => VmServer();
}

class VmServerAddress {
  /// The identifier of the VM manager.
  final String vmManagerId;

  /// The identifier of the VM.
  final String vmId;

  VmServerAddress({
    this.vmManagerId,
    this.vmId,
  });
  static VmServerAddress fromJson(Map<String, dynamic> json) =>
      VmServerAddress();
}
