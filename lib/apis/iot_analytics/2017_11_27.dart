import 'package:meta/meta.dart';
import 'dart:typed_data';

/// AWS IoT Analytics allows you to collect large amounts of device data,
/// process messages, and store them. You can then query the data and run
/// sophisticated analytics on it. AWS IoT Analytics enables advanced data
/// exploration through integration with Jupyter Notebooks and data
/// visualization through integration with Amazon QuickSight.
///
/// Traditional analytics and business intelligence tools are designed to
/// process structured data. IoT data often comes from devices that record noisy
/// processes (such as temperature, motion, or sound). As a result the data from
/// these devices can have significant gaps, corrupted messages, and false
/// readings that must be cleaned up before analysis can occur. Also, IoT data
/// is often only meaningful in the context of other data from external sources.
///
/// AWS IoT Analytics automates the steps required to analyze data from IoT
/// devices. AWS IoT Analytics filters, transforms, and enriches IoT data before
/// storing it in a time-series data store for analysis. You can set up the
/// service to collect only the data you need from your devices, apply
/// mathematical transforms to process the data, and enrich the data with
/// device-specific metadata such as device type and location before storing it.
/// Then, you can analyze your data by running queries using the built-in SQL
/// query engine, or perform more complex analytics and machine learning
/// inference. AWS IoT Analytics includes pre-built models for common IoT use
/// cases so you can answer questions like which devices are about to fail or
/// which customers are at risk of abandoning their wearable devices.
class IotAnalyticsApi {
  /// Sends messages to a channel.
  Future<void> batchPutMessage(
      {@required String channelName, @required List<Message> messages}) async {}

  /// Cancels the reprocessing of data through the pipeline.
  Future<void> cancelPipelineReprocessing(
      {@required String pipelineName, @required String reprocessingId}) async {}

  /// Creates a channel. A channel collects data from an MQTT topic and archives
  /// the raw, unprocessed messages before publishing the data to a pipeline.
  Future<void> createChannel(String channelName,
      {ChannelStorage channelStorage,
      RetentionPeriod retentionPeriod,
      List<Tag> tags}) async {}

  /// Creates a data set. A data set stores data retrieved from a data store by
  /// applying a "queryAction" (a SQL query) or a "containerAction" (executing a
  /// containerized application). This operation creates the skeleton of a data
  /// set. The data set can be populated manually by calling
  /// "CreateDatasetContent" or automatically according to a "trigger" you
  /// specify.
  Future<void> createDataset(
      {@required String datasetName,
      @required List<DatasetAction> actions,
      List<DatasetTrigger> triggers,
      List<DatasetContentDeliveryRule> contentDeliveryRules,
      RetentionPeriod retentionPeriod,
      VersioningConfiguration versioningConfiguration,
      List<Tag> tags}) async {}

  /// Creates the content of a data set by applying a "queryAction" (a SQL
  /// query) or a "containerAction" (executing a containerized application).
  Future<void> createDatasetContent(String datasetName) async {}

  /// Creates a data store, which is a repository for messages.
  Future<void> createDatastore(String datastoreName,
      {DatastoreStorage datastoreStorage,
      RetentionPeriod retentionPeriod,
      List<Tag> tags}) async {}

  /// Creates a pipeline. A pipeline consumes messages from one or more channels
  /// and allows you to process the messages before storing them in a data
  /// store. You must specify both a `channel` and a `datastore` activity and,
  /// optionally, as many as 23 additional activities in the
  /// `pipelineActivities` array.
  Future<void> createPipeline(
      {@required String pipelineName,
      @required List<PipelineActivity> pipelineActivities,
      List<Tag> tags}) async {}

  /// Deletes the specified channel.
  Future<void> deleteChannel(String channelName) async {}

  /// Deletes the specified data set.
  ///
  /// You do not have to delete the content of the data set before you perform
  /// this operation.
  Future<void> deleteDataset(String datasetName) async {}

  /// Deletes the content of the specified data set.
  Future<void> deleteDatasetContent(String datasetName,
      {String versionId}) async {}

  /// Deletes the specified data store.
  Future<void> deleteDatastore(String datastoreName) async {}

  /// Deletes the specified pipeline.
  Future<void> deletePipeline(String pipelineName) async {}

  /// Retrieves information about a channel.
  Future<void> describeChannel(String channelName,
      {bool includeStatistics}) async {}

  /// Retrieves information about a data set.
  Future<void> describeDataset(String datasetName) async {}

  /// Retrieves information about a data store.
  Future<void> describeDatastore(String datastoreName,
      {bool includeStatistics}) async {}

  /// Retrieves the current settings of the AWS IoT Analytics logging options.
  Future<void> describeLoggingOptions() async {}

  /// Retrieves information about a pipeline.
  Future<void> describePipeline(String pipelineName) async {}

  /// Retrieves the contents of a data set as pre-signed URIs.
  Future<void> getDatasetContent(String datasetName,
      {String versionId}) async {}

  /// Retrieves a list of channels.
  Future<void> listChannels({String nextToken, int maxResults}) async {}

  /// Lists information about data set contents that have been created.
  Future<void> listDatasetContents(String datasetName,
      {String nextToken,
      int maxResults,
      DateTime scheduledOnOrAfter,
      DateTime scheduledBefore}) async {}

  /// Retrieves information about data sets.
  Future<void> listDatasets({String nextToken, int maxResults}) async {}

  /// Retrieves a list of data stores.
  Future<void> listDatastores({String nextToken, int maxResults}) async {}

  /// Retrieves a list of pipelines.
  Future<void> listPipelines({String nextToken, int maxResults}) async {}

  /// Lists the tags (metadata) which you have assigned to the resource.
  Future<void> listTagsForResource(String resourceArn) async {}

  /// Sets or updates the AWS IoT Analytics logging options.
  ///
  /// Note that if you update the value of any `loggingOptions` field, it takes
  /// up to one minute for the change to take effect. Also, if you change the
  /// policy attached to the role you specified in the roleArn field (for
  /// example, to correct an invalid policy) it takes up to 5 minutes for that
  /// change to take effect.
  Future<void> putLoggingOptions(LoggingOptions loggingOptions) async {}

  /// Simulates the results of running a pipeline activity on a message payload.
  Future<void> runPipelineActivity(
      {@required PipelineActivity pipelineActivity,
      @required List<Uint8List> payloads}) async {}

  /// Retrieves a sample of messages from the specified channel ingested during
  /// the specified timeframe. Up to 10 messages can be retrieved.
  Future<void> sampleChannelData(String channelName,
      {int maxMessages, DateTime startTime, DateTime endTime}) async {}

  /// Starts the reprocessing of raw message data through the pipeline.
  Future<void> startPipelineReprocessing(String pipelineName,
      {DateTime startTime, DateTime endTime}) async {}

  /// Adds to or modifies the tags of the given resource. Tags are metadata
  /// which can be used to manage a resource.
  Future<void> tagResource(
      {@required String resourceArn, @required List<Tag> tags}) async {}

  /// Removes the given tags (metadata) from the resource.
  Future<void> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {}

  /// Updates the settings of a channel.
  Future<void> updateChannel(String channelName,
      {ChannelStorage channelStorage, RetentionPeriod retentionPeriod}) async {}

  /// Updates the settings of a data set.
  Future<void> updateDataset(
      {@required String datasetName,
      @required List<DatasetAction> actions,
      List<DatasetTrigger> triggers,
      List<DatasetContentDeliveryRule> contentDeliveryRules,
      RetentionPeriod retentionPeriod,
      VersioningConfiguration versioningConfiguration}) async {}

  /// Updates the settings of a data store.
  Future<void> updateDatastore(String datastoreName,
      {RetentionPeriod retentionPeriod,
      DatastoreStorage datastoreStorage}) async {}

  /// Updates the settings of a pipeline. You must specify both a `channel` and
  /// a `datastore` activity and, optionally, as many as 23 additional
  /// activities in the `pipelineActivities` array.
  Future<void> updatePipeline(
      {@required String pipelineName,
      @required List<PipelineActivity> pipelineActivities}) async {}
}

class AddAttributesActivity {}

class BatchPutMessageErrorEntry {}

class BatchPutMessageResponse {}

class CancelPipelineReprocessingResponse {}

class Channel {}

class ChannelActivity {}

class ChannelStatistics {}

class ChannelStorage {}

class ChannelStorageSummary {}

class ChannelSummary {}

class ContainerDatasetAction {}

class CreateChannelResponse {}

class CreateDatasetContentResponse {}

class CreateDatasetResponse {}

class CreateDatastoreResponse {}

class CreatePipelineResponse {}

class CustomerManagedChannelS3Storage {}

class CustomerManagedChannelS3StorageSummary {}

class CustomerManagedDatastoreS3Storage {}

class CustomerManagedDatastoreS3StorageSummary {}

class Dataset {}

class DatasetAction {}

class DatasetActionSummary {}

class DatasetContentDeliveryDestination {}

class DatasetContentDeliveryRule {}

class DatasetContentStatus {}

class DatasetContentSummary {}

class DatasetContentVersionValue {}

class DatasetEntry {}

class DatasetSummary {}

class DatasetTrigger {}

class Datastore {}

class DatastoreActivity {}

class DatastoreStatistics {}

class DatastoreStorage {}

class DatastoreStorageSummary {}

class DatastoreSummary {}

class DeltaTime {}

class DescribeChannelResponse {}

class DescribeDatasetResponse {}

class DescribeDatastoreResponse {}

class DescribeLoggingOptionsResponse {}

class DescribePipelineResponse {}

class DeviceRegistryEnrichActivity {}

class DeviceShadowEnrichActivity {}

class EstimatedResourceSize {}

class FilterActivity {}

class GetDatasetContentResponse {}

class GlueConfiguration {}

class IotEventsDestinationConfiguration {}

class LambdaActivity {}

class ListChannelsResponse {}

class ListDatasetContentsResponse {}

class ListDatasetsResponse {}

class ListDatastoresResponse {}

class ListPipelinesResponse {}

class ListTagsForResourceResponse {}

class LoggingOptions {}

class MathActivity {}

class Message {}

class OutputFileUriValue {}

class Pipeline {}

class PipelineActivity {}

class PipelineSummary {}

class QueryFilter {}

class RemoveAttributesActivity {}

class ReprocessingSummary {}

class ResourceConfiguration {}

class RetentionPeriod {}

class RunPipelineActivityResponse {}

class S3DestinationConfiguration {}

class SampleChannelDataResponse {}

class Schedule {}

class SelectAttributesActivity {}

class ServiceManagedChannelS3Storage {}

class ServiceManagedChannelS3StorageSummary {}

class ServiceManagedDatastoreS3Storage {}

class ServiceManagedDatastoreS3StorageSummary {}

class SqlQueryDatasetAction {}

class StartPipelineReprocessingResponse {}

class Tag {}

class TagResourceResponse {}

class TriggeringDataset {}

class UntagResourceResponse {}

class Variable {}

class VersioningConfiguration {}
