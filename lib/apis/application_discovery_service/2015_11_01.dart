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
/// solution to plan your migration. For more information, see [AWS Application
/// Discovery Service FAQ](http://aws.amazon.com/application-discovery/faqs/).
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
/// data is handled according to the [AWS Privacy
/// Policy](http://aws.amazon.com/privacy/). You can operate Application
/// Discovery Service offline to inspect collected data before it is shared with
/// the service.
///
/// This API reference provides descriptions, syntax, and usage examples for
/// each of the actions and data types for Application Discovery Service. The
/// topic for each action shows the API request parameters and the response.
/// Alternatively, you can use one of the AWS SDKs to access an API that is
/// tailored to the programming language or platform that you're using. For more
/// information, see [AWS SDKs](http://aws.amazon.com/tools/#SDKs).
///
/// This guide is intended for use with the  [_AWS Application Discovery Service
/// User
/// Guide_](http://docs.aws.amazon.com/application-discovery/latest/userguide/)
/// .
class ApplicationDiscoveryServiceApi {
  /// Associates one or more configuration items with an application.
  Future<void> associateConfigurationItemsToApplication(
      {@required String applicationConfigurationId,
      @required List<String> configurationIds}) async {}

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
  Future<void> batchDeleteImportData(List<String> importTaskIds) async {}

  /// Creates an application with the given name and description.
  Future<void> createApplication(String name, {String description}) async {}

  /// Creates one or more tags for configuration items. Tags are metadata that
  /// help you categorize IT assets. This API accepts a list of multiple
  /// configuration items.
  Future<void> createTags(
      {@required List<String> configurationIds,
      @required List<Tag> tags}) async {}

  /// Deletes a list of applications and their associations with configuration
  /// items.
  Future<void> deleteApplications(List<String> configurationIds) async {}

  /// Deletes the association between configuration items and one or more tags.
  /// This API accepts a list of multiple configuration items.
  Future<void> deleteTags(List<String> configurationIds,
      {List<Tag> tags}) async {}

  /// Lists agents or connectors as specified by ID or other filters. All
  /// agents/connectors associated with your user account can be listed if you
  /// call `DescribeAgents` as is without passing any parameters.
  Future<void> describeAgents(
      {List<String> agentIds,
      List<Filter> filters,
      int maxResults,
      String nextToken}) async {}

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
  /// For a complete list of outputs for each asset type, see [Using the
  /// DescribeConfigurations
  /// Action](http://docs.aws.amazon.com/application-discovery/latest/APIReference/discovery-api-queries.html#DescribeConfigurations).
  Future<void> describeConfigurations(List<String> configurationIds) async {}

  /// Lists exports as specified by ID. All continuous exports associated with
  /// your user account can be listed if you call `DescribeContinuousExports` as
  /// is without passing any parameters.
  Future<void> describeContinuousExports(
      {List<String> exportIds, int maxResults, String nextToken}) async {}

  ///  `DescribeExportConfigurations` is deprecated. Use
  /// [DescribeImportTasks](https://docs.aws.amazon.com/application-discovery/latest/APIReference/API_DescribeExportTasks.html),
  /// instead.
  Future<void> describeExportConfigurations(
      {List<String> exportIds, int maxResults, String nextToken}) async {}

  /// Retrieve status of one or more export tasks. You can retrieve the status
  /// of up to 100 export tasks.
  Future<void> describeExportTasks(
      {List<String> exportIds,
      List<ExportFilter> filters,
      int maxResults,
      String nextToken}) async {}

  /// Returns an array of import tasks for your account, including status
  /// information, times, IDs, the Amazon S3 Object URL for the import file, and
  /// more.
  Future<void> describeImportTasks(
      {List<ImportTaskFilter> filters,
      int maxResults,
      String nextToken}) async {}

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
  Future<void> describeTags(
      {List<TagFilter> filters, int maxResults, String nextToken}) async {}

  /// Disassociates one or more configuration items from an application.
  Future<void> disassociateConfigurationItemsFromApplication(
      {@required String applicationConfigurationId,
      @required List<String> configurationIds}) async {}

  /// Deprecated. Use `StartExportTask` instead.
  ///
  /// Exports all discovered configuration data to an Amazon S3 bucket or an
  /// application that enables you to view and evaluate the data. Data includes
  /// tags and tag associations, processes, connections, servers, and system
  /// performance. This API returns an export ID that you can query using the
  /// _DescribeExportConfigurations_ API. The system imposes a limit of two
  /// configuration exports in six hours.
  Future<void> exportConfigurations() async {}

  /// Retrieves a short summary of discovered assets.
  ///
  /// This API operation takes no request parameters and is called as is at the
  /// command prompt as shown in the example.
  Future<void> getDiscoverySummary() async {}

  /// Retrieves a list of configuration items as specified by the value passed
  /// to the required paramater `configurationType`. Optional filtering may be
  /// applied to refine search results.
  Future<void> listConfigurations(String configurationType,
      {List<Filter> filters,
      int maxResults,
      String nextToken,
      List<OrderByElement> orderBy}) async {}

  /// Retrieves a list of servers that are one network hop away from a specified
  /// server.
  Future<void> listServerNeighbors(String configurationId,
      {bool portInformationNeeded,
      List<String> neighborConfigurationIds,
      int maxResults,
      String nextToken}) async {}

  /// Start the continuous flow of agent's discovered data into Amazon Athena.
  Future<void> startContinuousExport() async {}

  /// Instructs the specified agents or connectors to start collecting data.
  Future<void> startDataCollectionByAgentIds(List<String> agentIds) async {}

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
  Future<void> startExportTask(
      {List<String> exportDataFormat,
      List<ExportFilter> filters,
      DateTime startTime,
      DateTime endTime}) async {}

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
  /// For more information, including step-by-step procedures, see [Migration
  /// Hub
  /// Import](https://docs.aws.amazon.com/application-discovery/latest/userguide/discovery-import.html)
  /// in the _AWS Application Discovery Service User Guide_.
  ///
  ///
  ///
  /// There are limits to the number of import tasks you can create (and delete)
  /// in an AWS account. For more information, see [AWS Application Discovery
  /// Service
  /// Limits](https://docs.aws.amazon.com/application-discovery/latest/userguide/ads_service_limits.html)
  /// in the _AWS Application Discovery Service User Guide_.
  Future<void> startImportTask(
      {String clientRequestToken,
      @required String name,
      @required String importUrl}) async {}

  /// Stop the continuous flow of agent's discovered data into Amazon Athena.
  Future<void> stopContinuousExport(String exportId) async {}

  /// Instructs the specified agents or connectors to stop collecting data.
  Future<void> stopDataCollectionByAgentIds(List<String> agentIds) async {}

  /// Updates metadata about an application.
  Future<void> updateApplication(String configurationId,
      {String name, String description}) async {}
}

class AgentConfigurationStatus {}

class AgentInfo {}

class AgentNetworkInfo {}

class AssociateConfigurationItemsToApplicationResponse {}

class BatchDeleteImportDataError {}

class BatchDeleteImportDataResponse {}

class ConfigurationTag {}

class ContinuousExportDescription {}

class CreateApplicationResponse {}

class CreateTagsResponse {}

class CustomerAgentInfo {}

class CustomerConnectorInfo {}

class DeleteApplicationsResponse {}

class DeleteTagsResponse {}

class DescribeAgentsResponse {}

class DescribeConfigurationsResponse {}

class DescribeContinuousExportsResponse {}

class DescribeExportConfigurationsResponse {}

class DescribeExportTasksResponse {}

class DescribeImportTasksResponse {}

class DescribeTagsResponse {}

class DisassociateConfigurationItemsFromApplicationResponse {}

class ExportConfigurationsResponse {}

class ExportFilter {}

class ExportInfo {}

class Filter {}

class GetDiscoverySummaryResponse {}

class ImportTask {}

class ImportTaskFilter {}

class ListConfigurationsResponse {}

class ListServerNeighborsResponse {}

class NeighborConnectionDetail {}

class OrderByElement {}

class StartContinuousExportResponse {}

class StartDataCollectionByAgentIdsResponse {}

class StartExportTaskResponse {}

class StartImportTaskResponse {}

class StopContinuousExportResponse {}

class StopDataCollectionByAgentIdsResponse {}

class Tag {}

class TagFilter {}

class UpdateApplicationResponse {}
