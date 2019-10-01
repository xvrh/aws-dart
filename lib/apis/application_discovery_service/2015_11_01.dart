import 'package:meta/meta.dart';

/// AWS Application Discovery Service
///
/// AWS Application Discovery Service helps you plan application migration
/// projects by automatically identifying servers, virtual machines (VMs),
/// software, and software dependencies running in your on-premises data
/// centers. Application Discovery Service also collects application performance
/// data, which can help you assess the outcome of your migration. The data
/// collected by Application Discovery Service is securely retained in an
/// AWS-hosted and managed database in the cloud. You can export the data as a
/// CSV or XML file into your preferred visualization tool or cloud-migration
/// solution to plan your migration. For more information, see
/// [AWS Application Discovery Service FAQ](http://aws.amazon.com/application-discovery/faqs/).
///
/// Application Discovery Service offers two modes of operation:
///
/// *    **Agentless discovery** mode is recommended for environments that use
/// VMware vCenter Server. This mode doesn't require you to install an agent on
/// each host. Agentless discovery gathers server information regardless of the
/// operating systems, which minimizes the time required for initial on-premises
/// infrastructure assessment. Agentless discovery doesn't collect information
/// about software and software dependencies. It also doesn't work in non-VMware
/// environments.
///
/// *    **Agent-based discovery** mode collects a richer set of data than
/// agentless discovery by using the AWS Application Discovery Agent, which you
/// install on one or more hosts in your data center. The agent captures
/// infrastructure and application information, including an inventory of
/// installed software applications, system and process performance, resource
/// utilization, and network dependencies between workloads. The information
/// collected by agents is secured at rest and in transit to the Application
/// Discovery Service database in the cloud.
///
///
/// We recommend that you use agent-based discovery for non-VMware environments
/// and to collect information about software and software dependencies. You can
/// also run agent-based and agentless discovery simultaneously. Use agentless
/// discovery to quickly complete the initial infrastructure assessment and then
/// install agents on select hosts.
///
/// Application Discovery Service integrates with application discovery
/// solutions from AWS Partner Network (APN) partners. Third-party application
/// discovery tools can query Application Discovery Service and write to the
/// Application Discovery Service database using a public API. You can then
/// import the data into either a visualization tool or cloud-migration
/// solution.
///
///  Application Discovery Service doesn't gather sensitive information. All
/// data is handled according to the
/// [AWS Privacy Policy](http://aws.amazon.com/privacy/). You can operate
/// Application Discovery Service offline to inspect collected data before it is
/// shared with the service.
///
/// This API reference provides descriptions, syntax, and usage examples for
/// each of the actions and data types for Application Discovery Service. The
/// topic for each action shows the API request parameters and the response.
/// Alternatively, you can use one of the AWS SDKs to access an API that is
/// tailored to the programming language or platform that you're using. For more
/// information, see [AWS SDKs](http://aws.amazon.com/tools/#SDKs).
///
/// This guide is intended for use with the
/// [_AWS Application Discovery Service User Guide_](http://docs.aws.amazon.com/application-discovery/latest/userguide/)
/// .
class ApplicationDiscoveryServiceApi {
  /// Associates one or more configuration items with an application.
  ///
  /// [applicationConfigurationId]: The configuration ID of an application with
  /// which items are to be associated.
  ///
  /// [configurationIds]: The ID of each configuration item to be associated
  /// with an application.
  Future<AssociateConfigurationItemsToApplicationResponse>
      associateConfigurationItemsToApplication(
          {@required String applicationConfigurationId,
          @required List<String> configurationIds}) async {
    return AssociateConfigurationItemsToApplicationResponse.fromJson({});
  }

  /// Deletes one or more import tasks, each identified by their import ID. Each
  /// import task has a number of records that can identify servers or
  /// applications.
  ///
  /// AWS Application Discovery Service has built-in matching logic that will
  /// identify when discovered servers match existing entries that you've
  /// previously discovered, the information for the already-existing discovered
  /// server is updated. When you delete an import task that contains records
  /// that were used to match, the information in those matched records that
  /// comes from the deleted records will also be deleted.
  ///
  /// [importTaskIds]: The IDs for the import tasks that you want to delete.
  Future<BatchDeleteImportDataResponse> batchDeleteImportData(
      List<String> importTaskIds) async {
    return BatchDeleteImportDataResponse.fromJson({});
  }

  /// Creates an application with the given name and description.
  ///
  /// [name]: Name of the application to be created.
  ///
  /// [description]: Description of the application to be created.
  Future<CreateApplicationResponse> createApplication(String name,
      {String description}) async {
    return CreateApplicationResponse.fromJson({});
  }

  /// Creates one or more tags for configuration items. Tags are metadata that
  /// help you categorize IT assets. This API accepts a list of multiple
  /// configuration items.
  ///
  /// [configurationIds]: A list of configuration items that you want to tag.
  ///
  /// [tags]: Tags that you want to associate with one or more configuration
  /// items. Specify the tags that you want to create in a _key_-_value_ format.
  /// For example:
  ///
  ///  `{"key": "serverType", "value": "webServer"}`
  Future<CreateTagsResponse> createTags(
      {@required List<String> configurationIds,
      @required List<Tag> tags}) async {
    return CreateTagsResponse.fromJson({});
  }

  /// Deletes a list of applications and their associations with configuration
  /// items.
  ///
  /// [configurationIds]: Configuration ID of an application to be deleted.
  Future<DeleteApplicationsResponse> deleteApplications(
      List<String> configurationIds) async {
    return DeleteApplicationsResponse.fromJson({});
  }

  /// Deletes the association between configuration items and one or more tags.
  /// This API accepts a list of multiple configuration items.
  ///
  /// [configurationIds]: A list of configuration items with tags that you want
  /// to delete.
  ///
  /// [tags]: Tags that you want to delete from one or more configuration items.
  /// Specify the tags that you want to delete in a _key_-_value_ format. For
  /// example:
  ///
  ///  `{"key": "serverType", "value": "webServer"}`
  Future<DeleteTagsResponse> deleteTags(List<String> configurationIds,
      {List<Tag> tags}) async {
    return DeleteTagsResponse.fromJson({});
  }

  /// Lists agents or connectors as specified by ID or other filters. All
  /// agents/connectors associated with your user account can be listed if you
  /// call `DescribeAgents` as is without passing any parameters.
  ///
  /// [agentIds]: The agent or the Connector IDs for which you want information.
  /// If you specify no IDs, the system returns information about all
  /// agents/Connectors associated with your AWS user account.
  ///
  /// [filters]: You can filter the request using various logical operators and
  /// a _key_-_value_ format. For example:
  ///
  ///  `{"key": "collectionStatus", "value": "STARTED"}`
  ///
  /// [maxResults]: The total number of agents/Connectors to return in a single
  /// page of output. The maximum value is 100.
  ///
  /// [nextToken]: Token to retrieve the next set of results. For example, if
  /// you previously specified 100 IDs for `DescribeAgentsRequest$agentIds` but
  /// set `DescribeAgentsRequest$maxResults` to 10, you received a set of 10
  /// results along with a token. Use that token in this query to get the next
  /// set of 10.
  Future<DescribeAgentsResponse> describeAgents(
      {List<String> agentIds,
      List<Filter> filters,
      int maxResults,
      String nextToken}) async {
    return DescribeAgentsResponse.fromJson({});
  }

  /// Retrieves attributes for a list of configuration item IDs.
  ///
  ///
  ///
  /// All of the supplied IDs must be for the same asset type from one of the
  /// following:
  ///
  /// *   server
  ///
  /// *   application
  ///
  /// *   process
  ///
  /// *   connection
  ///
  ///
  /// Output fields are specific to the asset type specified. For example, the
  /// output for a _server_ configuration item includes a list of attributes
  /// about the server, such as host name, operating system, number of network
  /// cards, etc.
  ///
  /// For a complete list of outputs for each asset type, see
  /// [Using the DescribeConfigurations Action](http://docs.aws.amazon.com/application-discovery/latest/APIReference/discovery-api-queries.html#DescribeConfigurations).
  ///
  /// [configurationIds]: One or more configuration IDs.
  Future<DescribeConfigurationsResponse> describeConfigurations(
      List<String> configurationIds) async {
    return DescribeConfigurationsResponse.fromJson({});
  }

  /// Lists exports as specified by ID. All continuous exports associated with
  /// your user account can be listed if you call `DescribeContinuousExports` as
  /// is without passing any parameters.
  ///
  /// [exportIds]: The unique IDs assigned to the exports.
  ///
  /// [maxResults]: A number between 1 and 100 specifying the maximum number of
  /// continuous export descriptions returned.
  ///
  /// [nextToken]: The token from the previous call to `DescribeExportTasks`.
  Future<DescribeContinuousExportsResponse> describeContinuousExports(
      {List<String> exportIds, int maxResults, String nextToken}) async {
    return DescribeContinuousExportsResponse.fromJson({});
  }

  ///  `DescribeExportConfigurations` is deprecated. Use
  /// [DescribeImportTasks](https://docs.aws.amazon.com/application-discovery/latest/APIReference/API_DescribeExportTasks.html),
  /// instead.
  ///
  /// [exportIds]: A list of continuous export ids to search for.
  ///
  /// [maxResults]: A number between 1 and 100 specifying the maximum number of
  /// continuous export descriptions returned.
  ///
  /// [nextToken]: The token from the previous call to describe-export-tasks.
  Future<DescribeExportConfigurationsResponse> describeExportConfigurations(
      {List<String> exportIds, int maxResults, String nextToken}) async {
    return DescribeExportConfigurationsResponse.fromJson({});
  }

  /// Retrieve status of one or more export tasks. You can retrieve the status
  /// of up to 100 export tasks.
  ///
  /// [exportIds]: One or more unique identifiers used to query the status of an
  /// export request.
  ///
  /// [filters]: One or more filters.
  ///
  /// *    `AgentId` - ID of the agent whose collected data will be exported
  ///
  /// [maxResults]: The maximum number of volume results returned by
  /// `DescribeExportTasks` in paginated output. When this parameter is used,
  /// `DescribeExportTasks` only returns `maxResults` results in a single page
  /// along with a `nextToken` response element.
  ///
  /// [nextToken]: The `nextToken` value returned from a previous paginated
  /// `DescribeExportTasks` request where `maxResults` was used and the results
  /// exceeded the value of that parameter. Pagination continues from the end of
  /// the previous results that returned the `nextToken` value. This value is
  /// null when there are no more results to return.
  Future<DescribeExportTasksResponse> describeExportTasks(
      {List<String> exportIds,
      List<ExportFilter> filters,
      int maxResults,
      String nextToken}) async {
    return DescribeExportTasksResponse.fromJson({});
  }

  /// Returns an array of import tasks for your account, including status
  /// information, times, IDs, the Amazon S3 Object URL for the import file, and
  /// more.
  ///
  /// [filters]: An array of name-value pairs that you provide to filter the
  /// results for the `DescribeImportTask` request to a specific subset of
  /// results. Currently, wildcard values aren't supported for filters.
  ///
  /// [maxResults]: The maximum number of results that you want this request to
  /// return, up to 100.
  ///
  /// [nextToken]: The token to request a specific page of results.
  Future<DescribeImportTasksResponse> describeImportTasks(
      {List<ImportTaskFilter> filters,
      int maxResults,
      String nextToken}) async {
    return DescribeImportTasksResponse.fromJson({});
  }

  /// Retrieves a list of configuration items that have tags as specified by the
  /// key-value pairs, name and value, passed to the optional parameter
  /// `filters`.
  ///
  /// There are three valid tag filter names:
  ///
  /// *   tagKey
  ///
  /// *   tagValue
  ///
  /// *   configurationId
  ///
  ///
  /// Also, all configuration items associated with your user account that have
  /// tags can be listed if you call `DescribeTags` as is without passing any
  /// parameters.
  ///
  /// [filters]: You can filter the list using a _key_-_value_ format. You can
  /// separate these items by using logical operators. Allowed filters include
  /// `tagKey`, `tagValue`, and `configurationId`.
  ///
  /// [maxResults]: The total number of items to return in a single page of
  /// output. The maximum value is 100.
  ///
  /// [nextToken]: A token to start the list. Use this token to get the next set
  /// of results.
  Future<DescribeTagsResponse> describeTags(
      {List<TagFilter> filters, int maxResults, String nextToken}) async {
    return DescribeTagsResponse.fromJson({});
  }

  /// Disassociates one or more configuration items from an application.
  ///
  /// [applicationConfigurationId]: Configuration ID of an application from
  /// which each item is disassociated.
  ///
  /// [configurationIds]: Configuration ID of each item to be disassociated from
  /// an application.
  Future<DisassociateConfigurationItemsFromApplicationResponse>
      disassociateConfigurationItemsFromApplication(
          {@required String applicationConfigurationId,
          @required List<String> configurationIds}) async {
    return DisassociateConfigurationItemsFromApplicationResponse.fromJson({});
  }

  /// Deprecated. Use `StartExportTask` instead.
  ///
  /// Exports all discovered configuration data to an Amazon S3 bucket or an
  /// application that enables you to view and evaluate the data. Data includes
  /// tags and tag associations, processes, connections, servers, and system
  /// performance. This API returns an export ID that you can query using the
  /// _DescribeExportConfigurations_ API. The system imposes a limit of two
  /// configuration exports in six hours.
  Future<ExportConfigurationsResponse> exportConfigurations() async {
    return ExportConfigurationsResponse.fromJson({});
  }

  /// Retrieves a short summary of discovered assets.
  ///
  /// This API operation takes no request parameters and is called as is at the
  /// command prompt as shown in the example.
  Future<GetDiscoverySummaryResponse> getDiscoverySummary() async {
    return GetDiscoverySummaryResponse.fromJson({});
  }

  /// Retrieves a list of configuration items as specified by the value passed
  /// to the required paramater `configurationType`. Optional filtering may be
  /// applied to refine search results.
  ///
  /// [configurationType]: A valid configuration identified by Application
  /// Discovery Service.
  ///
  /// [filters]: You can filter the request using various logical operators and
  /// a _key_-_value_ format. For example:
  ///
  ///  `{"key": "serverType", "value": "webServer"}`
  ///
  /// For a complete list of filter options and guidance about using them with
  /// this action, see
  /// [Querying Discovered Configuration Items](http://docs.aws.amazon.com/application-discovery/latest/APIReference/discovery-api-queries.html#ListConfigurations).
  ///
  /// [maxResults]: The total number of items to return. The maximum value is
  /// 100.
  ///
  /// [nextToken]: Token to retrieve the next set of results. For example, if a
  /// previous call to ListConfigurations returned 100 items, but you set
  /// `ListConfigurationsRequest$maxResults` to 10, you received a set of 10
  /// results along with a token. Use that token in this query to get the next
  /// set of 10.
  ///
  /// [orderBy]: Certain filter criteria return output that can be sorted in
  /// ascending or descending order. For a list of output characteristics for
  /// each filter, see
  /// [Using the ListConfigurations Action](http://docs.aws.amazon.com/application-discovery/latest/APIReference/discovery-api-queries.html#ListConfigurations).
  Future<ListConfigurationsResponse> listConfigurations(
      String configurationType,
      {List<Filter> filters,
      int maxResults,
      String nextToken,
      List<OrderByElement> orderBy}) async {
    return ListConfigurationsResponse.fromJson({});
  }

  /// Retrieves a list of servers that are one network hop away from a specified
  /// server.
  ///
  /// [configurationId]: Configuration ID of the server for which neighbors are
  /// being listed.
  ///
  /// [portInformationNeeded]: Flag to indicate if port and protocol information
  /// is needed as part of the response.
  ///
  /// [neighborConfigurationIds]: List of configuration IDs to test for
  /// one-hop-away.
  ///
  /// [maxResults]: Maximum number of results to return in a single page of
  /// output.
  ///
  /// [nextToken]: Token to retrieve the next set of results. For example, if
  /// you previously specified 100 IDs for
  /// `ListServerNeighborsRequest$neighborConfigurationIds` but set
  /// `ListServerNeighborsRequest$maxResults` to 10, you received a set of 10
  /// results along with a token. Use that token in this query to get the next
  /// set of 10.
  Future<ListServerNeighborsResponse> listServerNeighbors(
      String configurationId,
      {bool portInformationNeeded,
      List<String> neighborConfigurationIds,
      int maxResults,
      String nextToken}) async {
    return ListServerNeighborsResponse.fromJson({});
  }

  /// Start the continuous flow of agent's discovered data into Amazon Athena.
  Future<StartContinuousExportResponse> startContinuousExport() async {
    return StartContinuousExportResponse.fromJson({});
  }

  /// Instructs the specified agents or connectors to start collecting data.
  ///
  /// [agentIds]: The IDs of the agents or connectors from which to start
  /// collecting data. If you send a request to an agent/connector ID that you
  /// do not have permission to contact, according to your AWS account, the
  /// service does not throw an exception. Instead, it returns the error in the
  /// _Description_ field. If you send a request to multiple agents/connectors
  /// and you do not have permission to contact some of those agents/connectors,
  /// the system does not throw an exception. Instead, the system shows `Failed`
  /// in the _Description_ field.
  Future<StartDataCollectionByAgentIdsResponse> startDataCollectionByAgentIds(
      List<String> agentIds) async {
    return StartDataCollectionByAgentIdsResponse.fromJson({});
  }

  ///  Begins the export of discovered data to an S3 bucket.
  ///
  ///  If you specify `agentIds` in a filter, the task exports up to 72 hours of
  /// detailed data collected by the identified Application Discovery Agent,
  /// including network, process, and performance details. A time range for
  /// exported agent data may be set by using `startTime` and `endTime`. Export
  /// of detailed agent data is limited to five concurrently running exports.
  ///
  ///  If you do not include an `agentIds` filter, summary data is exported that
  /// includes both AWS Agentless Discovery Connector data and summary data from
  /// AWS Discovery Agents. Export of summary data is limited to two exports per
  /// day.
  ///
  /// [exportDataFormat]: The file format for the returned export data. Default
  /// value is `CSV`. **Note:** _The_ `GRAPHML` _option has been deprecated._
  ///
  /// [filters]: If a filter is present, it selects the single `agentId` of the
  /// Application Discovery Agent for which data is exported. The `agentId` can
  /// be found in the results of the `DescribeAgents` API or CLI. If no filter
  /// is present, `startTime` and `endTime` are ignored and exported data
  /// includes both Agentless Discovery Connector data and summary data from
  /// Application Discovery agents.
  ///
  /// [startTime]: The start timestamp for exported data from the single
  /// Application Discovery Agent selected in the filters. If no value is
  /// specified, data is exported starting from the first data collected by the
  /// agent.
  ///
  /// [endTime]: The end timestamp for exported data from the single Application
  /// Discovery Agent selected in the filters. If no value is specified,
  /// exported data includes the most recent data collected by the agent.
  Future<StartExportTaskResponse> startExportTask(
      {List<String> exportDataFormat,
      List<ExportFilter> filters,
      DateTime startTime,
      DateTime endTime}) async {
    return StartExportTaskResponse.fromJson({});
  }

  /// Starts an import task, which allows you to import details of your
  /// on-premises environment directly into AWS without having to use the
  /// Application Discovery Service (ADS) tools such as the Discovery Connector
  /// or Discovery Agent. This gives you the option to perform migration
  /// assessment and planning directly from your imported data, including the
  /// ability to group your devices as applications and track their migration
  /// status.
  ///
  /// To start an import request, do this:
  ///
  /// 1.  Download the specially formatted comma separated value (CSV) import
  /// template, which you can find here:
  /// [https://s3-us-west-2.amazonaws.com/templates-7cffcf56-bd96-4b1c-b45b-a5b42f282e46/import_template.csv](https://s3-us-west-2.amazonaws.com/templates-7cffcf56-bd96-4b1c-b45b-a5b42f282e46/import_template.csv).
  ///
  /// 2.  Fill out the template with your server and application data.
  ///
  /// 3.  Upload your import file to an Amazon S3 bucket, and make a note of
  /// it's Object URL. Your import file must be in the CSV format.
  ///
  /// 4.  Use the console or the `StartImportTask` command with the AWS CLI or
  /// one of the AWS SDKs to import the records from your file.
  ///
  ///
  /// For more information, including step-by-step procedures, see
  /// [Migration Hub Import](https://docs.aws.amazon.com/application-discovery/latest/userguide/discovery-import.html)
  /// in the _AWS Application Discovery Service User Guide_.
  ///
  ///
  ///
  /// There are limits to the number of import tasks you can create (and delete)
  /// in an AWS account. For more information, see
  /// [AWS Application Discovery Service Limits](https://docs.aws.amazon.com/application-discovery/latest/userguide/ads_service_limits.html)
  /// in the _AWS Application Discovery Service User Guide_.
  ///
  /// [clientRequestToken]: Optional. A unique token that you can provide to
  /// prevent the same import request from occurring more than once. If you
  /// don't provide a token, a token is automatically generated.
  ///
  /// Sending more than one `StartImportTask` request with the same client
  /// request token will return information about the original import task with
  /// that client request token.
  ///
  /// [name]: A descriptive name for this request. You can use this name to
  /// filter future requests related to this import task, such as identifying
  /// applications and servers that were included in this import task. We
  /// recommend that you use a meaningful name for each import task.
  ///
  /// [importUrl]: The URL for your import file that you've uploaded to Amazon
  /// S3.
  ///
  ///
  ///
  /// If you're using the AWS CLI, this URL is structured as follows:
  /// `s3://BucketName/ImportFileName.CSV`
  Future<StartImportTaskResponse> startImportTask(
      {String clientRequestToken,
      @required String name,
      @required String importUrl}) async {
    return StartImportTaskResponse.fromJson({});
  }

  /// Stop the continuous flow of agent's discovered data into Amazon Athena.
  ///
  /// [exportId]: The unique ID assigned to this export.
  Future<StopContinuousExportResponse> stopContinuousExport(
      String exportId) async {
    return StopContinuousExportResponse.fromJson({});
  }

  /// Instructs the specified agents or connectors to stop collecting data.
  ///
  /// [agentIds]: The IDs of the agents or connectors from which to stop
  /// collecting data.
  Future<StopDataCollectionByAgentIdsResponse> stopDataCollectionByAgentIds(
      List<String> agentIds) async {
    return StopDataCollectionByAgentIdsResponse.fromJson({});
  }

  /// Updates metadata about an application.
  ///
  /// [configurationId]: Configuration ID of the application to be updated.
  ///
  /// [name]: New name of the application to be updated.
  ///
  /// [description]: New description of the application to be updated.
  Future<UpdateApplicationResponse> updateApplication(String configurationId,
      {String name, String description}) async {
    return UpdateApplicationResponse.fromJson({});
  }
}

/// Information about agents or connectors that were instructed to start
/// collecting data. Information includes the agent/connector ID, a description
/// of the operation, and whether the agent/connector configuration was updated.
class AgentConfigurationStatus {
  /// The agent/connector ID.
  final String agentId;

  /// Information about the status of the `StartDataCollection` and
  /// `StopDataCollection` operations. The system has recorded the data
  /// collection operation. The agent/connector receives this command the next
  /// time it polls for a new command.
  final bool operationSucceeded;

  /// A description of the operation performed.
  final String description;

  AgentConfigurationStatus({
    this.agentId,
    this.operationSucceeded,
    this.description,
  });
  static AgentConfigurationStatus fromJson(Map<String, dynamic> json) =>
      AgentConfigurationStatus();
}

/// Information about agents or connectors associated with the user’s AWS
/// account. Information includes agent or connector IDs, IP addresses, media
/// access control (MAC) addresses, agent or connector health, hostname where
/// the agent or connector resides, and agent version for each agent.
class AgentInfo {
  /// The agent or connector ID.
  final String agentId;

  /// The name of the host where the agent or connector resides. The host can be
  /// a server or virtual machine.
  final String hostName;

  /// Network details about the host where the agent or connector resides.
  final List<AgentNetworkInfo> agentNetworkInfoList;

  /// The ID of the connector.
  final String connectorId;

  /// The agent or connector version.
  final String version;

  /// The health of the agent or connector.
  final String health;

  /// Time since agent or connector health was reported.
  final String lastHealthPingTime;

  /// Status of the collection process for an agent or connector.
  final String collectionStatus;

  /// Type of agent.
  final String agentType;

  /// Agent's first registration timestamp in UTC.
  final String registeredTime;

  AgentInfo({
    this.agentId,
    this.hostName,
    this.agentNetworkInfoList,
    this.connectorId,
    this.version,
    this.health,
    this.lastHealthPingTime,
    this.collectionStatus,
    this.agentType,
    this.registeredTime,
  });
  static AgentInfo fromJson(Map<String, dynamic> json) => AgentInfo();
}

/// Network details about the host where the agent/connector resides.
class AgentNetworkInfo {
  /// The IP address for the host where the agent/connector resides.
  final String ipAddress;

  /// The MAC address for the host where the agent/connector resides.
  final String macAddress;

  AgentNetworkInfo({
    this.ipAddress,
    this.macAddress,
  });
  static AgentNetworkInfo fromJson(Map<String, dynamic> json) =>
      AgentNetworkInfo();
}

class AssociateConfigurationItemsToApplicationResponse {
  AssociateConfigurationItemsToApplicationResponse();
  static AssociateConfigurationItemsToApplicationResponse fromJson(
          Map<String, dynamic> json) =>
      AssociateConfigurationItemsToApplicationResponse();
}

/// Error messages returned for each import task that you deleted as a response
/// for this command.
class BatchDeleteImportDataError {
  /// The unique import ID associated with the error that occurred.
  final String importTaskId;

  /// The type of error that occurred for a specific import task.
  final String errorCode;

  /// The description of the error that occurred for a specific import task.
  final String errorDescription;

  BatchDeleteImportDataError({
    this.importTaskId,
    this.errorCode,
    this.errorDescription,
  });
  static BatchDeleteImportDataError fromJson(Map<String, dynamic> json) =>
      BatchDeleteImportDataError();
}

class BatchDeleteImportDataResponse {
  /// Error messages returned for each import task that you deleted as a
  /// response for this command.
  final List<BatchDeleteImportDataError> errors;

  BatchDeleteImportDataResponse({
    this.errors,
  });
  static BatchDeleteImportDataResponse fromJson(Map<String, dynamic> json) =>
      BatchDeleteImportDataResponse();
}

/// Tags for a configuration item. Tags are metadata that help you categorize IT
/// assets.
class ConfigurationTag {
  /// A type of IT asset to tag.
  final String configurationType;

  /// The configuration ID for the item to tag. You can specify a list of keys
  /// and values.
  final String configurationId;

  /// A type of tag on which to filter. For example, _serverType_.
  final String key;

  /// A value on which to filter. For example _key = serverType_ and _value =
  /// web server_.
  final String value;

  /// The time the configuration tag was created in Coordinated Universal Time
  /// (UTC).
  final DateTime timeOfCreation;

  ConfigurationTag({
    this.configurationType,
    this.configurationId,
    this.key,
    this.value,
    this.timeOfCreation,
  });
  static ConfigurationTag fromJson(Map<String, dynamic> json) =>
      ConfigurationTag();
}

/// A list of continuous export descriptions.
class ContinuousExportDescription {
  /// The unique ID assigned to this export.
  final String exportId;

  /// Describes the status of the export. Can be one of the following values:
  ///
  /// *   START_IN_PROGRESS - setting up resources to start continuous export.
  ///
  /// *   START_FAILED - an error occurred setting up continuous export. To
  /// recover, call start-continuous-export again.
  ///
  /// *   ACTIVE - data is being exported to the customer bucket.
  ///
  /// *   ERROR - an error occurred during export. To fix the issue, call
  /// stop-continuous-export and start-continuous-export.
  ///
  /// *   STOP_IN_PROGRESS - stopping the export.
  ///
  /// *   STOP_FAILED - an error occurred stopping the export. To recover, call
  /// stop-continuous-export again.
  ///
  /// *   INACTIVE - the continuous export has been stopped. Data is no longer
  /// being exported to the customer bucket.
  final String status;

  /// Contains information about any errors that have occurred. This data type
  /// can have the following values:
  ///
  /// *   ACCESS_DENIED - You don’t have permission to start Data Exploration in
  /// Amazon Athena. Contact your AWS administrator for help. For more
  /// information, see
  /// [Setting Up AWS Application Discovery Service](http://docs.aws.amazon.com/application-discovery/latest/userguide/setting-up.html)
  /// in the Application Discovery Service User Guide.
  ///
  /// *   DELIVERY_STREAM_LIMIT_FAILURE - You reached the limit for Amazon
  /// Kinesis Data Firehose delivery streams. Reduce the number of streams or
  /// request a limit increase and try again. For more information, see
  /// [Kinesis Data Streams Limits](http://docs.aws.amazon.com/streams/latest/dev/service-sizes-and-limits.html)
  /// in the Amazon Kinesis Data Streams Developer Guide.
  ///
  /// *   FIREHOSE_ROLE_MISSING - The Data Exploration feature is in an error
  /// state because your IAM User is missing the
  /// AWSApplicationDiscoveryServiceFirehose role. Turn on Data Exploration in
  /// Amazon Athena and try again. For more information, see
  /// [Step 3: Provide Application Discovery Service Access to Non-Administrator Users by Attaching Policies](http://docs.aws.amazon.com/application-discovery/latest/userguide/setting-up.html#setting-up-user-policy)
  /// in the Application Discovery Service User Guide.
  ///
  /// *   FIREHOSE_STREAM_DOES_NOT_EXIST - The Data Exploration feature is in an
  /// error state because your IAM User is missing one or more of the Kinesis
  /// data delivery streams.
  ///
  /// *   INTERNAL_FAILURE - The Data Exploration feature is in an error state
  /// because of an internal failure. Try again later. If this problem persists,
  /// contact AWS Support.
  ///
  /// *   S3_BUCKET_LIMIT_FAILURE - You reached the limit for Amazon S3 buckets.
  /// Reduce the number of Amazon S3 buckets or request a limit increase and try
  /// again. For more information, see
  /// [Bucket Restrictions and Limitations](http://docs.aws.amazon.com/AmazonS3/latest/dev/BucketRestrictions.html)
  /// in the Amazon Simple Storage Service Developer Guide.
  ///
  /// *   S3_NOT_SIGNED_UP - Your account is not signed up for the Amazon S3
  /// service. You must sign up before you can use Amazon S3. You can sign up at
  /// the following URL: [https://aws.amazon.com/s3](https://aws.amazon.com/s3).
  final String statusDetail;

  /// The name of the s3 bucket where the export data parquet files are stored.
  final String s3Bucket;

  /// The timestamp representing when the continuous export was started.
  final DateTime startTime;

  /// The timestamp that represents when this continuous export was stopped.
  final DateTime stopTime;

  /// The type of data collector used to gather this data (currently only
  /// offered for AGENT).
  final String dataSource;

  /// An object which describes how the data is stored.
  ///
  /// *    `databaseName` - the name of the Glue database used to store the
  /// schema.
  final Map<String, String> schemaStorageConfig;

  ContinuousExportDescription({
    this.exportId,
    this.status,
    this.statusDetail,
    this.s3Bucket,
    this.startTime,
    this.stopTime,
    this.dataSource,
    this.schemaStorageConfig,
  });
  static ContinuousExportDescription fromJson(Map<String, dynamic> json) =>
      ContinuousExportDescription();
}

class CreateApplicationResponse {
  /// Configuration ID of an application to be created.
  final String configurationId;

  CreateApplicationResponse({
    this.configurationId,
  });
  static CreateApplicationResponse fromJson(Map<String, dynamic> json) =>
      CreateApplicationResponse();
}

class CreateTagsResponse {
  CreateTagsResponse();
  static CreateTagsResponse fromJson(Map<String, dynamic> json) =>
      CreateTagsResponse();
}

/// Inventory data for installed discovery agents.
class CustomerAgentInfo {
  /// Number of active discovery agents.
  final int activeAgents;

  /// Number of healthy discovery agents
  final int healthyAgents;

  /// Number of blacklisted discovery agents.
  final int blackListedAgents;

  /// Number of discovery agents with status SHUTDOWN.
  final int shutdownAgents;

  /// Number of unhealthy discovery agents.
  final int unhealthyAgents;

  /// Total number of discovery agents.
  final int totalAgents;

  /// Number of unknown discovery agents.
  final int unknownAgents;

  CustomerAgentInfo({
    @required this.activeAgents,
    @required this.healthyAgents,
    @required this.blackListedAgents,
    @required this.shutdownAgents,
    @required this.unhealthyAgents,
    @required this.totalAgents,
    @required this.unknownAgents,
  });
  static CustomerAgentInfo fromJson(Map<String, dynamic> json) =>
      CustomerAgentInfo();
}

/// Inventory data for installed discovery connectors.
class CustomerConnectorInfo {
  /// Number of active discovery connectors.
  final int activeConnectors;

  /// Number of healthy discovery connectors.
  final int healthyConnectors;

  /// Number of blacklisted discovery connectors.
  final int blackListedConnectors;

  /// Number of discovery connectors with status SHUTDOWN,
  final int shutdownConnectors;

  /// Number of unhealthy discovery connectors.
  final int unhealthyConnectors;

  /// Total number of discovery connectors.
  final int totalConnectors;

  /// Number of unknown discovery connectors.
  final int unknownConnectors;

  CustomerConnectorInfo({
    @required this.activeConnectors,
    @required this.healthyConnectors,
    @required this.blackListedConnectors,
    @required this.shutdownConnectors,
    @required this.unhealthyConnectors,
    @required this.totalConnectors,
    @required this.unknownConnectors,
  });
  static CustomerConnectorInfo fromJson(Map<String, dynamic> json) =>
      CustomerConnectorInfo();
}

class DeleteApplicationsResponse {
  DeleteApplicationsResponse();
  static DeleteApplicationsResponse fromJson(Map<String, dynamic> json) =>
      DeleteApplicationsResponse();
}

class DeleteTagsResponse {
  DeleteTagsResponse();
  static DeleteTagsResponse fromJson(Map<String, dynamic> json) =>
      DeleteTagsResponse();
}

class DescribeAgentsResponse {
  /// Lists agents or the Connector by ID or lists all agents/Connectors
  /// associated with your user account if you did not specify an
  /// agent/Connector ID. The output includes agent/Connector IDs, IP addresses,
  /// media access control (MAC) addresses, agent/Connector health, host name
  /// where the agent/Connector resides, and the version number of each
  /// agent/Connector.
  final List<AgentInfo> agentsInfo;

  /// Token to retrieve the next set of results. For example, if you specified
  /// 100 IDs for `DescribeAgentsRequest$agentIds` but set
  /// `DescribeAgentsRequest$maxResults` to 10, you received a set of 10 results
  /// along with this token. Use this token in the next query to retrieve the
  /// next set of 10.
  final String nextToken;

  DescribeAgentsResponse({
    this.agentsInfo,
    this.nextToken,
  });
  static DescribeAgentsResponse fromJson(Map<String, dynamic> json) =>
      DescribeAgentsResponse();
}

class DescribeConfigurationsResponse {
  /// A key in the response map. The value is an array of data.
  final List<Map<String, String>> configurations;

  DescribeConfigurationsResponse({
    this.configurations,
  });
  static DescribeConfigurationsResponse fromJson(Map<String, dynamic> json) =>
      DescribeConfigurationsResponse();
}

class DescribeContinuousExportsResponse {
  /// A list of continuous export descriptions.
  final List<ContinuousExportDescription> descriptions;

  /// The token from the previous call to `DescribeExportTasks`.
  final String nextToken;

  DescribeContinuousExportsResponse({
    this.descriptions,
    this.nextToken,
  });
  static DescribeContinuousExportsResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeContinuousExportsResponse();
}

class DescribeExportConfigurationsResponse {
  final List<ExportInfo> exportsInfo;

  /// The token from the previous call to describe-export-tasks.
  final String nextToken;

  DescribeExportConfigurationsResponse({
    this.exportsInfo,
    this.nextToken,
  });
  static DescribeExportConfigurationsResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeExportConfigurationsResponse();
}

class DescribeExportTasksResponse {
  /// Contains one or more sets of export request details. When the status of a
  /// request is `SUCCEEDED`, the response includes a URL for an Amazon S3
  /// bucket where you can view the data in a CSV file.
  final List<ExportInfo> exportsInfo;

  /// The `nextToken` value to include in a future `DescribeExportTasks`
  /// request. When the results of a `DescribeExportTasks` request exceed
  /// `maxResults`, this value can be used to retrieve the next page of results.
  /// This value is null when there are no more results to return.
  final String nextToken;

  DescribeExportTasksResponse({
    this.exportsInfo,
    this.nextToken,
  });
  static DescribeExportTasksResponse fromJson(Map<String, dynamic> json) =>
      DescribeExportTasksResponse();
}

class DescribeImportTasksResponse {
  /// The token to request the next page of results.
  final String nextToken;

  /// A returned array of import tasks that match any applied filters, up to the
  /// specified number of maximum results.
  final List<ImportTask> tasks;

  DescribeImportTasksResponse({
    this.nextToken,
    this.tasks,
  });
  static DescribeImportTasksResponse fromJson(Map<String, dynamic> json) =>
      DescribeImportTasksResponse();
}

class DescribeTagsResponse {
  /// Depending on the input, this is a list of configuration items tagged with
  /// a specific tag, or a list of tags for a specific configuration item.
  final List<ConfigurationTag> tags;

  /// The call returns a token. Use this token to get the next set of results.
  final String nextToken;

  DescribeTagsResponse({
    this.tags,
    this.nextToken,
  });
  static DescribeTagsResponse fromJson(Map<String, dynamic> json) =>
      DescribeTagsResponse();
}

class DisassociateConfigurationItemsFromApplicationResponse {
  DisassociateConfigurationItemsFromApplicationResponse();
  static DisassociateConfigurationItemsFromApplicationResponse fromJson(
          Map<String, dynamic> json) =>
      DisassociateConfigurationItemsFromApplicationResponse();
}

class ExportConfigurationsResponse {
  /// A unique identifier that you can use to query the export status.
  final String exportId;

  ExportConfigurationsResponse({
    this.exportId,
  });
  static ExportConfigurationsResponse fromJson(Map<String, dynamic> json) =>
      ExportConfigurationsResponse();
}

/// Used to select which agent's data is to be exported. A single agent ID may
/// be selected for export using the
/// [StartExportTask](http://docs.aws.amazon.com/application-discovery/latest/APIReference/API_StartExportTask.html)
/// action.
class ExportFilter {
  /// A single `ExportFilter` name. Supported filters: `agentId`.
  final String name;

  /// A single `agentId` for a Discovery Agent. An `agentId` can be found using
  /// the
  /// [DescribeAgents](http://docs.aws.amazon.com/application-discovery/latest/APIReference/API_DescribeExportTasks.html)
  /// action. Typically an ADS `agentId` is in the form `o-0123456789abcdef0`.
  final List<String> values;

  /// Supported condition: `EQUALS`
  final String condition;

  ExportFilter({
    @required this.name,
    @required this.values,
    @required this.condition,
  });
}

/// Information regarding the export status of discovered data. The value is an
/// array of objects.
class ExportInfo {
  /// A unique identifier used to query an export.
  final String exportId;

  /// The status of the data export job.
  final String exportStatus;

  /// A status message provided for API callers.
  final String statusMessage;

  /// A URL for an Amazon S3 bucket where you can review the exported data. The
  /// URL is displayed only if the export succeeded.
  final String configurationsDownloadUrl;

  /// The time that the data export was initiated.
  final DateTime exportRequestTime;

  /// If true, the export of agent information exceeded the size limit for a
  /// single export and the exported data is incomplete for the requested time
  /// range. To address this, select a smaller time range for the export by
  /// using `startDate` and `endDate`.
  final bool isTruncated;

  /// The value of `startTime` parameter in the `StartExportTask` request. If no
  /// `startTime` was requested, this result does not appear in `ExportInfo`.
  final DateTime requestedStartTime;

  /// The `endTime` used in the `StartExportTask` request. If no `endTime` was
  /// requested, this result does not appear in `ExportInfo`.
  final DateTime requestedEndTime;

  ExportInfo({
    @required this.exportId,
    @required this.exportStatus,
    @required this.statusMessage,
    this.configurationsDownloadUrl,
    @required this.exportRequestTime,
    this.isTruncated,
    this.requestedStartTime,
    this.requestedEndTime,
  });
  static ExportInfo fromJson(Map<String, dynamic> json) => ExportInfo();
}

/// A filter that can use conditional operators.
///
/// For more information about filters, see
/// [Querying Discovered Configuration Items](http://docs.aws.amazon.com/application-discovery/latest/APIReference/discovery-api-queries.html).
class Filter {
  /// The name of the filter.
  final String name;

  /// A string value on which to filter. For example, if you choose the
  /// `destinationServer.osVersion` filter name, you could specify `Ubuntu` for
  /// the value.
  final List<String> values;

  /// A conditional operator. The following operators are valid: EQUALS,
  /// NOT_EQUALS, CONTAINS, NOT_CONTAINS. If you specify multiple filters, the
  /// system utilizes all filters as though concatenated by _AND_. If you
  /// specify multiple values for a particular filter, the system differentiates
  /// the values using _OR_. Calling either _DescribeConfigurations_ or
  /// _ListConfigurations_ returns attributes of matching configuration items.
  final String condition;

  Filter({
    @required this.name,
    @required this.values,
    @required this.condition,
  });
}

class GetDiscoverySummaryResponse {
  /// The number of servers discovered.
  final BigInt servers;

  /// The number of applications discovered.
  final BigInt applications;

  /// The number of servers mapped to applications.
  final BigInt serversMappedToApplications;

  /// The number of servers mapped to tags.
  final BigInt serversMappedtoTags;

  /// Details about discovered agents, including agent status and health.
  final CustomerAgentInfo agentSummary;

  /// Details about discovered connectors, including connector status and
  /// health.
  final CustomerConnectorInfo connectorSummary;

  GetDiscoverySummaryResponse({
    this.servers,
    this.applications,
    this.serversMappedToApplications,
    this.serversMappedtoTags,
    this.agentSummary,
    this.connectorSummary,
  });
  static GetDiscoverySummaryResponse fromJson(Map<String, dynamic> json) =>
      GetDiscoverySummaryResponse();
}

/// An array of information related to the import task request that includes
/// status information, times, IDs, the Amazon S3 Object URL for the import
/// file, and more.
class ImportTask {
  /// The unique ID for a specific import task. These IDs aren't globally
  /// unique, but they are unique within an AWS account.
  final String importTaskId;

  /// A unique token used to prevent the same import request from occurring more
  /// than once. If you didn't provide a token, a token was automatically
  /// generated when the import task request was sent.
  final String clientRequestToken;

  /// A descriptive name for an import task. You can use this name to filter
  /// future requests related to this import task, such as identifying
  /// applications and servers that were included in this import task. We
  /// recommend that you use a meaningful name for each import task.
  final String name;

  /// The URL for your import file that you've uploaded to Amazon S3.
  final String importUrl;

  /// The status of the import task. An import can have the status of
  /// `IMPORT_COMPLETE` and still have some records fail to import from the
  /// overall request. More information can be found in the downloadable archive
  /// defined in the `errorsAndFailedEntriesZip` field, or in the Migration Hub
  /// management console.
  final String status;

  /// The time that the import task request was made, presented in the Unix time
  /// stamp format.
  final DateTime importRequestTime;

  /// The time that the import task request finished, presented in the Unix time
  /// stamp format.
  final DateTime importCompletionTime;

  /// The time that the import task request was deleted, presented in the Unix
  /// time stamp format.
  final DateTime importDeletedTime;

  /// The total number of server records in the import file that were
  /// successfully imported.
  final int serverImportSuccess;

  /// The total number of server records in the import file that failed to be
  /// imported.
  final int serverImportFailure;

  /// The total number of application records in the import file that were
  /// successfully imported.
  final int applicationImportSuccess;

  /// The total number of application records in the import file that failed to
  /// be imported.
  final int applicationImportFailure;

  /// A link to a compressed archive folder (in the ZIP format) that contains an
  /// error log and a file of failed records. You can use these two files to
  /// quickly identify records that failed, why they failed, and correct those
  /// records. Afterward, you can upload the corrected file to your Amazon S3
  /// bucket and create another import task request.
  ///
  /// This field also includes authorization information so you can confirm the
  /// authenticity of the compressed archive before you download it.
  ///
  /// If some records failed to be imported we recommend that you correct the
  /// records in the failed entries file and then imports that failed entries
  /// file. This prevents you from having to correct and update the larger
  /// original file and attempt importing it again.
  final String errorsAndFailedEntriesZip;

  ImportTask({
    this.importTaskId,
    this.clientRequestToken,
    this.name,
    this.importUrl,
    this.status,
    this.importRequestTime,
    this.importCompletionTime,
    this.importDeletedTime,
    this.serverImportSuccess,
    this.serverImportFailure,
    this.applicationImportSuccess,
    this.applicationImportFailure,
    this.errorsAndFailedEntriesZip,
  });
  static ImportTask fromJson(Map<String, dynamic> json) => ImportTask();
}

/// A name-values pair of elements you can use to filter the results when
/// querying your import tasks. Currently, wildcards are not supported for
/// filters.
///
///
///
/// When filtering by import status, all other filter values are ignored.
class ImportTaskFilter {
  /// The name, status, or import task ID for a specific import task.
  final String name;

  /// An array of strings that you can provide to match against a specific name,
  /// status, or import task ID to filter the results for your import task
  /// queries.
  final List<String> values;

  ImportTaskFilter({
    this.name,
    this.values,
  });
}

class ListConfigurationsResponse {
  /// Returns configuration details, including the configuration ID, attribute
  /// names, and attribute values.
  final List<Map<String, String>> configurations;

  /// Token to retrieve the next set of results. For example, if your call to
  /// ListConfigurations returned 100 items, but you set
  /// `ListConfigurationsRequest$maxResults` to 10, you received a set of 10
  /// results along with this token. Use this token in the next query to
  /// retrieve the next set of 10.
  final String nextToken;

  ListConfigurationsResponse({
    this.configurations,
    this.nextToken,
  });
  static ListConfigurationsResponse fromJson(Map<String, dynamic> json) =>
      ListConfigurationsResponse();
}

class ListServerNeighborsResponse {
  /// List of distinct servers that are one hop away from the given server.
  final List<NeighborConnectionDetail> neighbors;

  /// Token to retrieve the next set of results. For example, if you specified
  /// 100 IDs for `ListServerNeighborsRequest$neighborConfigurationIds` but set
  /// `ListServerNeighborsRequest$maxResults` to 10, you received a set of 10
  /// results along with this token. Use this token in the next query to
  /// retrieve the next set of 10.
  final String nextToken;

  /// Count of distinct servers that are one hop away from the given server.
  final BigInt knownDependencyCount;

  ListServerNeighborsResponse({
    @required this.neighbors,
    this.nextToken,
    this.knownDependencyCount,
  });
  static ListServerNeighborsResponse fromJson(Map<String, dynamic> json) =>
      ListServerNeighborsResponse();
}

/// Details about neighboring servers.
class NeighborConnectionDetail {
  /// The ID of the server that opened the network connection.
  final String sourceServerId;

  /// The ID of the server that accepted the network connection.
  final String destinationServerId;

  /// The destination network port for the connection.
  final int destinationPort;

  /// The network protocol used for the connection.
  final String transportProtocol;

  /// The number of open network connections with the neighboring server.
  final BigInt connectionsCount;

  NeighborConnectionDetail({
    @required this.sourceServerId,
    @required this.destinationServerId,
    this.destinationPort,
    this.transportProtocol,
    @required this.connectionsCount,
  });
  static NeighborConnectionDetail fromJson(Map<String, dynamic> json) =>
      NeighborConnectionDetail();
}

/// A field and direction for ordered output.
class OrderByElement {
  /// The field on which to order.
  final String fieldName;

  /// Ordering direction.
  final String sortOrder;

  OrderByElement({
    @required this.fieldName,
    this.sortOrder,
  });
}

class StartContinuousExportResponse {
  /// The unique ID assigned to this export.
  final String exportId;

  /// The name of the s3 bucket where the export data parquet files are stored.
  final String s3Bucket;

  /// The timestamp representing when the continuous export was started.
  final DateTime startTime;

  /// The type of data collector used to gather this data (currently only
  /// offered for AGENT).
  final String dataSource;

  /// A dictionary which describes how the data is stored.
  ///
  /// *    `databaseName` - the name of the Glue database used to store the
  /// schema.
  final Map<String, String> schemaStorageConfig;

  StartContinuousExportResponse({
    this.exportId,
    this.s3Bucket,
    this.startTime,
    this.dataSource,
    this.schemaStorageConfig,
  });
  static StartContinuousExportResponse fromJson(Map<String, dynamic> json) =>
      StartContinuousExportResponse();
}

class StartDataCollectionByAgentIdsResponse {
  /// Information about agents or the connector that were instructed to start
  /// collecting data. Information includes the agent/connector ID, a
  /// description of the operation performed, and whether the agent/connector
  /// configuration was updated.
  final List<AgentConfigurationStatus> agentsConfigurationStatus;

  StartDataCollectionByAgentIdsResponse({
    this.agentsConfigurationStatus,
  });
  static StartDataCollectionByAgentIdsResponse fromJson(
          Map<String, dynamic> json) =>
      StartDataCollectionByAgentIdsResponse();
}

class StartExportTaskResponse {
  /// A unique identifier used to query the status of an export request.
  final String exportId;

  StartExportTaskResponse({
    this.exportId,
  });
  static StartExportTaskResponse fromJson(Map<String, dynamic> json) =>
      StartExportTaskResponse();
}

class StartImportTaskResponse {
  /// An array of information related to the import task request including
  /// status information, times, IDs, the Amazon S3 Object URL for the import
  /// file, and more.
  final ImportTask task;

  StartImportTaskResponse({
    this.task,
  });
  static StartImportTaskResponse fromJson(Map<String, dynamic> json) =>
      StartImportTaskResponse();
}

class StopContinuousExportResponse {
  /// Timestamp that represents when this continuous export started collecting
  /// data.
  final DateTime startTime;

  /// Timestamp that represents when this continuous export was stopped.
  final DateTime stopTime;

  StopContinuousExportResponse({
    this.startTime,
    this.stopTime,
  });
  static StopContinuousExportResponse fromJson(Map<String, dynamic> json) =>
      StopContinuousExportResponse();
}

class StopDataCollectionByAgentIdsResponse {
  /// Information about the agents or connector that were instructed to stop
  /// collecting data. Information includes the agent/connector ID, a
  /// description of the operation performed, and whether the agent/connector
  /// configuration was updated.
  final List<AgentConfigurationStatus> agentsConfigurationStatus;

  StopDataCollectionByAgentIdsResponse({
    this.agentsConfigurationStatus,
  });
  static StopDataCollectionByAgentIdsResponse fromJson(
          Map<String, dynamic> json) =>
      StopDataCollectionByAgentIdsResponse();
}

/// Metadata that help you categorize IT assets.
class Tag {
  /// The type of tag on which to filter.
  final String key;

  /// A value for a tag key on which to filter.
  final String value;

  Tag({
    @required this.key,
    @required this.value,
  });
}

/// The tag filter. Valid names are: `tagKey`, `tagValue`, `configurationId`.
class TagFilter {
  /// A name of the tag filter.
  final String name;

  /// Values for the tag filter.
  final List<String> values;

  TagFilter({
    @required this.name,
    @required this.values,
  });
}

class UpdateApplicationResponse {
  UpdateApplicationResponse();
  static UpdateApplicationResponse fromJson(Map<String, dynamic> json) =>
      UpdateApplicationResponse();
}
