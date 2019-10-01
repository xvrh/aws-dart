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
  ///
  /// [channelName]: The name of the channel where the messages are sent.
  ///
  /// [messages]: The list of messages to be sent. Each message has format: '{
  /// "messageId": "string", "payload": "string"}'.
  ///
  /// Note that the field names of message payloads (data) that you send to AWS
  /// IoT Analytics:
  ///
  /// *   Must contain only alphanumeric characters and undescores (_); no other
  /// special characters are allowed.
  ///
  /// *   Must begin with an alphabetic character or single underscore (_).
  ///
  /// *   Cannot contain hyphens (-).
  ///
  /// *   In regular expression terms:
  /// "^[A-Za-z_]([A-Za-z0-9]*|[A-Za-z0-9][A-Za-z0-9_]*)$".
  ///
  /// *   Cannot be greater than 255 characters.
  ///
  /// *   Are case-insensitive. (Fields named "foo" and "FOO" in the same
  /// payload are considered duplicates.)
  ///
  ///
  /// For example, {"temp_01": 29} or {"_temp_01": 29} are valid, but
  /// {"temp-01": 29}, {"01_temp": 29} or {"__temp_01": 29} are invalid in
  /// message payloads.
  Future<BatchPutMessageResponse> batchPutMessage(
      {@required String channelName, @required List<Message> messages}) async {
    return BatchPutMessageResponse.fromJson({});
  }

  /// Cancels the reprocessing of data through the pipeline.
  ///
  /// [pipelineName]: The name of pipeline for which data reprocessing is
  /// canceled.
  ///
  /// [reprocessingId]: The ID of the reprocessing task (returned by
  /// "StartPipelineReprocessing").
  Future<CancelPipelineReprocessingResponse> cancelPipelineReprocessing(
      {@required String pipelineName, @required String reprocessingId}) async {
    return CancelPipelineReprocessingResponse.fromJson({});
  }

  /// Creates a channel. A channel collects data from an MQTT topic and archives
  /// the raw, unprocessed messages before publishing the data to a pipeline.
  ///
  /// [channelName]: The name of the channel.
  ///
  /// [channelStorage]: Where channel data is stored.
  ///
  /// [retentionPeriod]: How long, in days, message data is kept for the
  /// channel.
  ///
  /// [tags]: Metadata which can be used to manage the channel.
  Future<CreateChannelResponse> createChannel(String channelName,
      {ChannelStorage channelStorage,
      RetentionPeriod retentionPeriod,
      List<Tag> tags}) async {
    return CreateChannelResponse.fromJson({});
  }

  /// Creates a data set. A data set stores data retrieved from a data store by
  /// applying a "queryAction" (a SQL query) or a "containerAction" (executing a
  /// containerized application). This operation creates the skeleton of a data
  /// set. The data set can be populated manually by calling
  /// "CreateDatasetContent" or automatically according to a "trigger" you
  /// specify.
  ///
  /// [datasetName]: The name of the data set.
  ///
  /// [actions]: A list of actions that create the data set contents.
  ///
  /// [triggers]: A list of triggers. A trigger causes data set contents to be
  /// populated at a specified time interval or when another data set's contents
  /// are created. The list of triggers can be empty or contain up to five
  /// **DataSetTrigger** objects.
  ///
  /// [contentDeliveryRules]: When data set contents are created they are
  /// delivered to destinations specified here.
  ///
  /// [retentionPeriod]: [Optional] How long, in days, versions of data set
  /// contents are kept for the data set. If not specified or set to null,
  /// versions of data set contents are retained for at most 90 days. The number
  /// of versions of data set contents retained is determined by the
  /// `versioningConfiguration` parameter. (For more information, see
  /// https://docs.aws.amazon.com/iotanalytics/latest/userguide/getting-started.html#aws-iot-analytics-dataset-versions)
  ///
  /// [versioningConfiguration]: [Optional] How many versions of data set
  /// contents are kept. If not specified or set to null, only the latest
  /// version plus the latest succeeded version (if they are different) are kept
  /// for the time period specified by the "retentionPeriod" parameter. (For
  /// more information, see
  /// https://docs.aws.amazon.com/iotanalytics/latest/userguide/getting-started.html#aws-iot-analytics-dataset-versions)
  ///
  /// [tags]: Metadata which can be used to manage the data set.
  Future<CreateDatasetResponse> createDataset(
      {@required String datasetName,
      @required List<DatasetAction> actions,
      List<DatasetTrigger> triggers,
      List<DatasetContentDeliveryRule> contentDeliveryRules,
      RetentionPeriod retentionPeriod,
      VersioningConfiguration versioningConfiguration,
      List<Tag> tags}) async {
    return CreateDatasetResponse.fromJson({});
  }

  /// Creates the content of a data set by applying a "queryAction" (a SQL
  /// query) or a "containerAction" (executing a containerized application).
  ///
  /// [datasetName]: The name of the data set.
  Future<CreateDatasetContentResponse> createDatasetContent(
      String datasetName) async {
    return CreateDatasetContentResponse.fromJson({});
  }

  /// Creates a data store, which is a repository for messages.
  ///
  /// [datastoreName]: The name of the data store.
  ///
  /// [datastoreStorage]: Where data store data is stored.
  ///
  /// [retentionPeriod]: How long, in days, message data is kept for the data
  /// store.
  ///
  /// [tags]: Metadata which can be used to manage the data store.
  Future<CreateDatastoreResponse> createDatastore(String datastoreName,
      {DatastoreStorage datastoreStorage,
      RetentionPeriod retentionPeriod,
      List<Tag> tags}) async {
    return CreateDatastoreResponse.fromJson({});
  }

  /// Creates a pipeline. A pipeline consumes messages from one or more channels
  /// and allows you to process the messages before storing them in a data
  /// store. You must specify both a `channel` and a `datastore` activity and,
  /// optionally, as many as 23 additional activities in the
  /// `pipelineActivities` array.
  ///
  /// [pipelineName]: The name of the pipeline.
  ///
  /// [pipelineActivities]: A list of "PipelineActivity" objects. Activities
  /// perform transformations on your messages, such as removing, renaming or
  /// adding message attributes; filtering messages based on attribute values;
  /// invoking your Lambda functions on messages for advanced processing; or
  /// performing mathematical transformations to normalize device data.
  ///
  /// The list can be 2-25 **PipelineActivity** objects and must contain both a
  /// `channel` and a `datastore` activity. Each entry in the list must contain
  /// only one activity, for example:
  ///
  ///  `pipelineActivities =
  /// [ { "channel": { ... } }, { "lambda": { ... } }, ... ]`
  ///
  /// [tags]: Metadata which can be used to manage the pipeline.
  Future<CreatePipelineResponse> createPipeline(
      {@required String pipelineName,
      @required List<PipelineActivity> pipelineActivities,
      List<Tag> tags}) async {
    return CreatePipelineResponse.fromJson({});
  }

  /// Deletes the specified channel.
  ///
  /// [channelName]: The name of the channel to delete.
  Future<void> deleteChannel(String channelName) async {}

  /// Deletes the specified data set.
  ///
  /// You do not have to delete the content of the data set before you perform
  /// this operation.
  ///
  /// [datasetName]: The name of the data set to delete.
  Future<void> deleteDataset(String datasetName) async {}

  /// Deletes the content of the specified data set.
  ///
  /// [datasetName]: The name of the data set whose content is deleted.
  ///
  /// [versionId]: The version of the data set whose content is deleted. You can
  /// also use the strings "$LATEST" or "$LATEST_SUCCEEDED" to delete the latest
  /// or latest successfully completed data set. If not specified,
  /// "$LATEST_SUCCEEDED" is the default.
  Future<void> deleteDatasetContent(String datasetName,
      {String versionId}) async {}

  /// Deletes the specified data store.
  ///
  /// [datastoreName]: The name of the data store to delete.
  Future<void> deleteDatastore(String datastoreName) async {}

  /// Deletes the specified pipeline.
  ///
  /// [pipelineName]: The name of the pipeline to delete.
  Future<void> deletePipeline(String pipelineName) async {}

  /// Retrieves information about a channel.
  ///
  /// [channelName]: The name of the channel whose information is retrieved.
  ///
  /// [includeStatistics]: If true, additional statistical information about the
  /// channel is included in the response.
  Future<DescribeChannelResponse> describeChannel(String channelName,
      {bool includeStatistics}) async {
    return DescribeChannelResponse.fromJson({});
  }

  /// Retrieves information about a data set.
  ///
  /// [datasetName]: The name of the data set whose information is retrieved.
  Future<DescribeDatasetResponse> describeDataset(String datasetName) async {
    return DescribeDatasetResponse.fromJson({});
  }

  /// Retrieves information about a data store.
  ///
  /// [datastoreName]: The name of the data store
  ///
  /// [includeStatistics]: If true, additional statistical information about the
  /// datastore is included in the response.
  Future<DescribeDatastoreResponse> describeDatastore(String datastoreName,
      {bool includeStatistics}) async {
    return DescribeDatastoreResponse.fromJson({});
  }

  /// Retrieves the current settings of the AWS IoT Analytics logging options.
  Future<DescribeLoggingOptionsResponse> describeLoggingOptions() async {
    return DescribeLoggingOptionsResponse.fromJson({});
  }

  /// Retrieves information about a pipeline.
  ///
  /// [pipelineName]: The name of the pipeline whose information is retrieved.
  Future<DescribePipelineResponse> describePipeline(String pipelineName) async {
    return DescribePipelineResponse.fromJson({});
  }

  /// Retrieves the contents of a data set as pre-signed URIs.
  ///
  /// [datasetName]: The name of the data set whose contents are retrieved.
  ///
  /// [versionId]: The version of the data set whose contents are retrieved. You
  /// can also use the strings "$LATEST" or "$LATEST_SUCCEEDED" to retrieve the
  /// contents of the latest or latest successfully completed data set. If not
  /// specified, "$LATEST_SUCCEEDED" is the default.
  Future<GetDatasetContentResponse> getDatasetContent(String datasetName,
      {String versionId}) async {
    return GetDatasetContentResponse.fromJson({});
  }

  /// Retrieves a list of channels.
  ///
  /// [nextToken]: The token for the next set of results.
  ///
  /// [maxResults]: The maximum number of results to return in this request.
  ///
  /// The default value is 100.
  Future<ListChannelsResponse> listChannels(
      {String nextToken, int maxResults}) async {
    return ListChannelsResponse.fromJson({});
  }

  /// Lists information about data set contents that have been created.
  ///
  /// [datasetName]: The name of the data set whose contents information you
  /// want to list.
  ///
  /// [nextToken]: The token for the next set of results.
  ///
  /// [maxResults]: The maximum number of results to return in this request.
  ///
  /// [scheduledOnOrAfter]: A filter to limit results to those data set contents
  /// whose creation is scheduled on or after the given time. See the field
  /// `triggers.schedule` in the CreateDataset request. (timestamp)
  ///
  /// [scheduledBefore]: A filter to limit results to those data set contents
  /// whose creation is scheduled before the given time. See the field
  /// `triggers.schedule` in the CreateDataset request. (timestamp)
  Future<ListDatasetContentsResponse> listDatasetContents(String datasetName,
      {String nextToken,
      int maxResults,
      DateTime scheduledOnOrAfter,
      DateTime scheduledBefore}) async {
    return ListDatasetContentsResponse.fromJson({});
  }

  /// Retrieves information about data sets.
  ///
  /// [nextToken]: The token for the next set of results.
  ///
  /// [maxResults]: The maximum number of results to return in this request.
  ///
  /// The default value is 100.
  Future<ListDatasetsResponse> listDatasets(
      {String nextToken, int maxResults}) async {
    return ListDatasetsResponse.fromJson({});
  }

  /// Retrieves a list of data stores.
  ///
  /// [nextToken]: The token for the next set of results.
  ///
  /// [maxResults]: The maximum number of results to return in this request.
  ///
  /// The default value is 100.
  Future<ListDatastoresResponse> listDatastores(
      {String nextToken, int maxResults}) async {
    return ListDatastoresResponse.fromJson({});
  }

  /// Retrieves a list of pipelines.
  ///
  /// [nextToken]: The token for the next set of results.
  ///
  /// [maxResults]: The maximum number of results to return in this request.
  ///
  /// The default value is 100.
  Future<ListPipelinesResponse> listPipelines(
      {String nextToken, int maxResults}) async {
    return ListPipelinesResponse.fromJson({});
  }

  /// Lists the tags (metadata) which you have assigned to the resource.
  ///
  /// [resourceArn]: The ARN of the resource whose tags you want to list.
  Future<ListTagsForResourceResponse> listTagsForResource(
      String resourceArn) async {
    return ListTagsForResourceResponse.fromJson({});
  }

  /// Sets or updates the AWS IoT Analytics logging options.
  ///
  /// Note that if you update the value of any `loggingOptions` field, it takes
  /// up to one minute for the change to take effect. Also, if you change the
  /// policy attached to the role you specified in the roleArn field (for
  /// example, to correct an invalid policy) it takes up to 5 minutes for that
  /// change to take effect.
  ///
  /// [loggingOptions]: The new values of the AWS IoT Analytics logging options.
  Future<void> putLoggingOptions(LoggingOptions loggingOptions) async {}

  /// Simulates the results of running a pipeline activity on a message payload.
  ///
  /// [pipelineActivity]: The pipeline activity that is run. This must not be a
  /// 'channel' activity or a 'datastore' activity because these activities are
  /// used in a pipeline only to load the original message and to store the
  /// (possibly) transformed message. If a 'lambda' activity is specified, only
  /// short-running Lambda functions (those with a timeout of less than 30
  /// seconds or less) can be used.
  ///
  /// [payloads]: The sample message payloads on which the pipeline activity is
  /// run.
  Future<RunPipelineActivityResponse> runPipelineActivity(
      {@required PipelineActivity pipelineActivity,
      @required List<Uint8List> payloads}) async {
    return RunPipelineActivityResponse.fromJson({});
  }

  /// Retrieves a sample of messages from the specified channel ingested during
  /// the specified timeframe. Up to 10 messages can be retrieved.
  ///
  /// [channelName]: The name of the channel whose message samples are
  /// retrieved.
  ///
  /// [maxMessages]: The number of sample messages to be retrieved. The limit is
  /// 10, the default is also 10.
  ///
  /// [startTime]: The start of the time window from which sample messages are
  /// retrieved.
  ///
  /// [endTime]: The end of the time window from which sample messages are
  /// retrieved.
  Future<SampleChannelDataResponse> sampleChannelData(String channelName,
      {int maxMessages, DateTime startTime, DateTime endTime}) async {
    return SampleChannelDataResponse.fromJson({});
  }

  /// Starts the reprocessing of raw message data through the pipeline.
  ///
  /// [pipelineName]: The name of the pipeline on which to start reprocessing.
  ///
  /// [startTime]: The start time (inclusive) of raw message data that is
  /// reprocessed.
  ///
  /// [endTime]: The end time (exclusive) of raw message data that is
  /// reprocessed.
  Future<StartPipelineReprocessingResponse> startPipelineReprocessing(
      String pipelineName,
      {DateTime startTime,
      DateTime endTime}) async {
    return StartPipelineReprocessingResponse.fromJson({});
  }

  /// Adds to or modifies the tags of the given resource. Tags are metadata
  /// which can be used to manage a resource.
  ///
  /// [resourceArn]: The ARN of the resource whose tags you want to modify.
  ///
  /// [tags]: The new or modified tags for the resource.
  Future<TagResourceResponse> tagResource(
      {@required String resourceArn, @required List<Tag> tags}) async {
    return TagResourceResponse.fromJson({});
  }

  /// Removes the given tags (metadata) from the resource.
  ///
  /// [resourceArn]: The ARN of the resource whose tags you want to remove.
  ///
  /// [tagKeys]: The keys of those tags which you want to remove.
  Future<UntagResourceResponse> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {
    return UntagResourceResponse.fromJson({});
  }

  /// Updates the settings of a channel.
  ///
  /// [channelName]: The name of the channel to be updated.
  ///
  /// [channelStorage]: Where channel data is stored.
  ///
  /// [retentionPeriod]: How long, in days, message data is kept for the
  /// channel.
  Future<void> updateChannel(String channelName,
      {ChannelStorage channelStorage, RetentionPeriod retentionPeriod}) async {}

  /// Updates the settings of a data set.
  ///
  /// [datasetName]: The name of the data set to update.
  ///
  /// [actions]: A list of "DatasetAction" objects.
  ///
  /// [triggers]: A list of "DatasetTrigger" objects. The list can be empty or
  /// can contain up to five **DataSetTrigger** objects.
  ///
  /// [contentDeliveryRules]: When data set contents are created they are
  /// delivered to destinations specified here.
  ///
  /// [retentionPeriod]: How long, in days, data set contents are kept for the
  /// data set.
  ///
  /// [versioningConfiguration]: [Optional] How many versions of data set
  /// contents are kept. If not specified or set to null, only the latest
  /// version plus the latest succeeded version (if they are different) are kept
  /// for the time period specified by the "retentionPeriod" parameter. (For
  /// more information, see
  /// https://docs.aws.amazon.com/iotanalytics/latest/userguide/getting-started.html#aws-iot-analytics-dataset-versions)
  Future<void> updateDataset(
      {@required String datasetName,
      @required List<DatasetAction> actions,
      List<DatasetTrigger> triggers,
      List<DatasetContentDeliveryRule> contentDeliveryRules,
      RetentionPeriod retentionPeriod,
      VersioningConfiguration versioningConfiguration}) async {}

  /// Updates the settings of a data store.
  ///
  /// [datastoreName]: The name of the data store to be updated.
  ///
  /// [retentionPeriod]: How long, in days, message data is kept for the data
  /// store.
  ///
  /// [datastoreStorage]: Where data store data is stored.
  Future<void> updateDatastore(String datastoreName,
      {RetentionPeriod retentionPeriod,
      DatastoreStorage datastoreStorage}) async {}

  /// Updates the settings of a pipeline. You must specify both a `channel` and
  /// a `datastore` activity and, optionally, as many as 23 additional
  /// activities in the `pipelineActivities` array.
  ///
  /// [pipelineName]: The name of the pipeline to update.
  ///
  /// [pipelineActivities]: A list of "PipelineActivity" objects. Activities
  /// perform transformations on your messages, such as removing, renaming or
  /// adding message attributes; filtering messages based on attribute values;
  /// invoking your Lambda functions on messages for advanced processing; or
  /// performing mathematical transformations to normalize device data.
  ///
  /// The list can be 2-25 **PipelineActivity** objects and must contain both a
  /// `channel` and a `datastore` activity. Each entry in the list must contain
  /// only one activity, for example:
  ///
  ///  `pipelineActivities =
  /// [ { "channel": { ... } }, { "lambda": { ... } }, ... ]`
  Future<void> updatePipeline(
      {@required String pipelineName,
      @required List<PipelineActivity> pipelineActivities}) async {}
}

/// An activity that adds other attributes based on existing attributes in the
/// message.
class AddAttributesActivity {
  /// The name of the 'addAttributes' activity.
  final String name;

  /// A list of 1-50 "AttributeNameMapping" objects that map an existing
  /// attribute to a new attribute.
  ///
  ///
  ///
  /// The existing attributes remain in the message, so if you want to remove
  /// the originals, use "RemoveAttributeActivity".
  final Map<String, String> attributes;

  /// The next activity in the pipeline.
  final String next;

  AddAttributesActivity({
    @required this.name,
    @required this.attributes,
    this.next,
  });
  static AddAttributesActivity fromJson(Map<String, dynamic> json) =>
      AddAttributesActivity();
}

/// Contains informations about errors.
class BatchPutMessageErrorEntry {
  /// The ID of the message that caused the error. (See the value corresponding
  /// to the "messageId" key in the message object.)
  final String messageId;

  /// The code associated with the error.
  final String errorCode;

  /// The message associated with the error.
  final String errorMessage;

  BatchPutMessageErrorEntry({
    this.messageId,
    this.errorCode,
    this.errorMessage,
  });
  static BatchPutMessageErrorEntry fromJson(Map<String, dynamic> json) =>
      BatchPutMessageErrorEntry();
}

class BatchPutMessageResponse {
  /// A list of any errors encountered when sending the messages to the channel.
  final List<BatchPutMessageErrorEntry> batchPutMessageErrorEntries;

  BatchPutMessageResponse({
    this.batchPutMessageErrorEntries,
  });
  static BatchPutMessageResponse fromJson(Map<String, dynamic> json) =>
      BatchPutMessageResponse();
}

class CancelPipelineReprocessingResponse {
  CancelPipelineReprocessingResponse();
  static CancelPipelineReprocessingResponse fromJson(
          Map<String, dynamic> json) =>
      CancelPipelineReprocessingResponse();
}

/// A collection of data from an MQTT topic. Channels archive the raw,
/// unprocessed messages before publishing the data to a pipeline.
class Channel {
  /// The name of the channel.
  final String name;

  /// Where channel data is stored.
  final ChannelStorage storage;

  /// The ARN of the channel.
  final String arn;

  /// The status of the channel.
  final String status;

  /// How long, in days, message data is kept for the channel.
  final RetentionPeriod retentionPeriod;

  /// When the channel was created.
  final DateTime creationTime;

  /// When the channel was last updated.
  final DateTime lastUpdateTime;

  Channel({
    this.name,
    this.storage,
    this.arn,
    this.status,
    this.retentionPeriod,
    this.creationTime,
    this.lastUpdateTime,
  });
  static Channel fromJson(Map<String, dynamic> json) => Channel();
}

/// The activity that determines the source of the messages to be processed.
class ChannelActivity {
  /// The name of the 'channel' activity.
  final String name;

  /// The name of the channel from which the messages are processed.
  final String channelName;

  /// The next activity in the pipeline.
  final String next;

  ChannelActivity({
    @required this.name,
    @required this.channelName,
    this.next,
  });
  static ChannelActivity fromJson(Map<String, dynamic> json) =>
      ChannelActivity();
}

/// Statistics information about the channel.
class ChannelStatistics {
  /// The estimated size of the channel.
  final EstimatedResourceSize size;

  ChannelStatistics({
    this.size,
  });
  static ChannelStatistics fromJson(Map<String, dynamic> json) =>
      ChannelStatistics();
}

/// Where channel data is stored.
class ChannelStorage {
  /// Use this to store channel data in an S3 bucket managed by the AWS IoT
  /// Analytics service.
  final ServiceManagedChannelS3Storage serviceManagedS3;

  /// Use this to store channel data in an S3 bucket that you manage.
  final CustomerManagedChannelS3Storage customerManagedS3;

  ChannelStorage({
    this.serviceManagedS3,
    this.customerManagedS3,
  });
  static ChannelStorage fromJson(Map<String, dynamic> json) => ChannelStorage();
}

/// Where channel data is stored.
class ChannelStorageSummary {
  /// Used to store channel data in an S3 bucket managed by the AWS IoT
  /// Analytics service.
  final ServiceManagedChannelS3StorageSummary serviceManagedS3;

  /// Used to store channel data in an S3 bucket that you manage.
  final CustomerManagedChannelS3StorageSummary customerManagedS3;

  ChannelStorageSummary({
    this.serviceManagedS3,
    this.customerManagedS3,
  });
  static ChannelStorageSummary fromJson(Map<String, dynamic> json) =>
      ChannelStorageSummary();
}

/// A summary of information about a channel.
class ChannelSummary {
  /// The name of the channel.
  final String channelName;

  /// Where channel data is stored.
  final ChannelStorageSummary channelStorage;

  /// The status of the channel.
  final String status;

  /// When the channel was created.
  final DateTime creationTime;

  /// The last time the channel was updated.
  final DateTime lastUpdateTime;

  ChannelSummary({
    this.channelName,
    this.channelStorage,
    this.status,
    this.creationTime,
    this.lastUpdateTime,
  });
  static ChannelSummary fromJson(Map<String, dynamic> json) => ChannelSummary();
}

/// Information needed to run the "containerAction" to produce data set
/// contents.
class ContainerDatasetAction {
  /// The ARN of the Docker container stored in your account. The Docker
  /// container contains an application and needed support libraries and is used
  /// to generate data set contents.
  final String image;

  /// The ARN of the role which gives permission to the system to access needed
  /// resources in order to run the "containerAction". This includes, at
  /// minimum, permission to retrieve the data set contents which are the input
  /// to the containerized application.
  final String executionRoleArn;

  /// Configuration of the resource which executes the "containerAction".
  final ResourceConfiguration resourceConfiguration;

  /// The values of variables used within the context of the execution of the
  /// containerized application (basically, parameters passed to the
  /// application). Each variable must have a name and a value given by one of
  /// "stringValue", "datasetContentVersionValue", or "outputFileUriValue".
  final List<Variable> variables;

  ContainerDatasetAction({
    @required this.image,
    @required this.executionRoleArn,
    @required this.resourceConfiguration,
    this.variables,
  });
  static ContainerDatasetAction fromJson(Map<String, dynamic> json) =>
      ContainerDatasetAction();
}

class CreateChannelResponse {
  /// The name of the channel.
  final String channelName;

  /// The ARN of the channel.
  final String channelArn;

  /// How long, in days, message data is kept for the channel.
  final RetentionPeriod retentionPeriod;

  CreateChannelResponse({
    this.channelName,
    this.channelArn,
    this.retentionPeriod,
  });
  static CreateChannelResponse fromJson(Map<String, dynamic> json) =>
      CreateChannelResponse();
}

class CreateDatasetContentResponse {
  /// The version ID of the data set contents which are being created.
  final String versionId;

  CreateDatasetContentResponse({
    this.versionId,
  });
  static CreateDatasetContentResponse fromJson(Map<String, dynamic> json) =>
      CreateDatasetContentResponse();
}

class CreateDatasetResponse {
  /// The name of the data set.
  final String datasetName;

  /// The ARN of the data set.
  final String datasetArn;

  /// How long, in days, data set contents are kept for the data set.
  final RetentionPeriod retentionPeriod;

  CreateDatasetResponse({
    this.datasetName,
    this.datasetArn,
    this.retentionPeriod,
  });
  static CreateDatasetResponse fromJson(Map<String, dynamic> json) =>
      CreateDatasetResponse();
}

class CreateDatastoreResponse {
  /// The name of the data store.
  final String datastoreName;

  /// The ARN of the data store.
  final String datastoreArn;

  /// How long, in days, message data is kept for the data store.
  final RetentionPeriod retentionPeriod;

  CreateDatastoreResponse({
    this.datastoreName,
    this.datastoreArn,
    this.retentionPeriod,
  });
  static CreateDatastoreResponse fromJson(Map<String, dynamic> json) =>
      CreateDatastoreResponse();
}

class CreatePipelineResponse {
  /// The name of the pipeline.
  final String pipelineName;

  /// The ARN of the pipeline.
  final String pipelineArn;

  CreatePipelineResponse({
    this.pipelineName,
    this.pipelineArn,
  });
  static CreatePipelineResponse fromJson(Map<String, dynamic> json) =>
      CreatePipelineResponse();
}

/// Use this to store channel data in an S3 bucket that you manage.
class CustomerManagedChannelS3Storage {
  /// The name of the Amazon S3 bucket in which channel data is stored.
  final String bucket;

  /// The prefix used to create the keys of the channel data objects. Each
  /// object in an Amazon S3 bucket has a key that is its unique identifier
  /// within the bucket (each object in a bucket has exactly one key).
  final String keyPrefix;

  /// The ARN of the role which grants AWS IoT Analytics permission to interact
  /// with your Amazon S3 resources.
  final String roleArn;

  CustomerManagedChannelS3Storage({
    @required this.bucket,
    this.keyPrefix,
    @required this.roleArn,
  });
  static CustomerManagedChannelS3Storage fromJson(Map<String, dynamic> json) =>
      CustomerManagedChannelS3Storage();
}

/// Used to store channel data in an S3 bucket that you manage.
class CustomerManagedChannelS3StorageSummary {
  /// The name of the Amazon S3 bucket in which channel data is stored.
  final String bucket;

  /// The prefix used to create the keys of the channel data objects. Each
  /// object in an Amazon S3 bucket has a key that is its unique identifier
  /// within the bucket (each object in a bucket has exactly one key).
  final String keyPrefix;

  /// The ARN of the role which grants AWS IoT Analytics permission to interact
  /// with your Amazon S3 resources.
  final String roleArn;

  CustomerManagedChannelS3StorageSummary({
    this.bucket,
    this.keyPrefix,
    this.roleArn,
  });
  static CustomerManagedChannelS3StorageSummary fromJson(
          Map<String, dynamic> json) =>
      CustomerManagedChannelS3StorageSummary();
}

/// Use this to store data store data in an S3 bucket that you manage.
class CustomerManagedDatastoreS3Storage {
  /// The name of the Amazon S3 bucket in which data store data is stored.
  final String bucket;

  /// The prefix used to create the keys of the data store data objects. Each
  /// object in an Amazon S3 bucket has a key that is its unique identifier
  /// within the bucket (each object in a bucket has exactly one key).
  final String keyPrefix;

  /// The ARN of the role which grants AWS IoT Analytics permission to interact
  /// with your Amazon S3 resources.
  final String roleArn;

  CustomerManagedDatastoreS3Storage({
    @required this.bucket,
    this.keyPrefix,
    @required this.roleArn,
  });
  static CustomerManagedDatastoreS3Storage fromJson(
          Map<String, dynamic> json) =>
      CustomerManagedDatastoreS3Storage();
}

/// Used to store data store data in an S3 bucket that you manage.
class CustomerManagedDatastoreS3StorageSummary {
  /// The name of the Amazon S3 bucket in which data store data is stored.
  final String bucket;

  /// The prefix used to create the keys of the data store data objects. Each
  /// object in an Amazon S3 bucket has a key that is its unique identifier
  /// within the bucket (each object in a bucket has exactly one key).
  final String keyPrefix;

  /// The ARN of the role which grants AWS IoT Analytics permission to interact
  /// with your Amazon S3 resources.
  final String roleArn;

  CustomerManagedDatastoreS3StorageSummary({
    this.bucket,
    this.keyPrefix,
    this.roleArn,
  });
  static CustomerManagedDatastoreS3StorageSummary fromJson(
          Map<String, dynamic> json) =>
      CustomerManagedDatastoreS3StorageSummary();
}

/// Information about a data set.
class Dataset {
  /// The name of the data set.
  final String name;

  /// The ARN of the data set.
  final String arn;

  /// The "DatasetAction" objects that automatically create the data set
  /// contents.
  final List<DatasetAction> actions;

  /// The "DatasetTrigger" objects that specify when the data set is
  /// automatically updated.
  final List<DatasetTrigger> triggers;

  /// When data set contents are created they are delivered to destinations
  /// specified here.
  final List<DatasetContentDeliveryRule> contentDeliveryRules;

  /// The status of the data set.
  final String status;

  /// When the data set was created.
  final DateTime creationTime;

  /// The last time the data set was updated.
  final DateTime lastUpdateTime;

  /// [Optional] How long, in days, message data is kept for the data set.
  final RetentionPeriod retentionPeriod;

  /// [Optional] How many versions of data set contents are kept. If not
  /// specified or set to null, only the latest version plus the latest
  /// succeeded version (if they are different) are kept for the time period
  /// specified by the "retentionPeriod" parameter. (For more information, see
  /// https://docs.aws.amazon.com/iotanalytics/latest/userguide/getting-started.html#aws-iot-analytics-dataset-versions)
  final VersioningConfiguration versioningConfiguration;

  Dataset({
    this.name,
    this.arn,
    this.actions,
    this.triggers,
    this.contentDeliveryRules,
    this.status,
    this.creationTime,
    this.lastUpdateTime,
    this.retentionPeriod,
    this.versioningConfiguration,
  });
  static Dataset fromJson(Map<String, dynamic> json) => Dataset();
}

/// A "DatasetAction" object that specifies how data set contents are
/// automatically created.
class DatasetAction {
  /// The name of the data set action by which data set contents are
  /// automatically created.
  final String actionName;

  /// An "SqlQueryDatasetAction" object that uses an SQL query to automatically
  /// create data set contents.
  final SqlQueryDatasetAction queryAction;

  /// Information which allows the system to run a containerized application in
  /// order to create the data set contents. The application must be in a Docker
  /// container along with any needed support libraries.
  final ContainerDatasetAction containerAction;

  DatasetAction({
    this.actionName,
    this.queryAction,
    this.containerAction,
  });
  static DatasetAction fromJson(Map<String, dynamic> json) => DatasetAction();
}

/// Information about the action which automatically creates the data set's
/// contents.
class DatasetActionSummary {
  /// The name of the action which automatically creates the data set's
  /// contents.
  final String actionName;

  /// The type of action by which the data set's contents are automatically
  /// created.
  final String actionType;

  DatasetActionSummary({
    this.actionName,
    this.actionType,
  });
  static DatasetActionSummary fromJson(Map<String, dynamic> json) =>
      DatasetActionSummary();
}

/// The destination to which data set contents are delivered.
class DatasetContentDeliveryDestination {
  /// Configuration information for delivery of data set contents to AWS IoT
  /// Events.
  final IotEventsDestinationConfiguration iotEventsDestinationConfiguration;

  /// Configuration information for delivery of data set contents to Amazon S3.
  final S3DestinationConfiguration s3DestinationConfiguration;

  DatasetContentDeliveryDestination({
    this.iotEventsDestinationConfiguration,
    this.s3DestinationConfiguration,
  });
  static DatasetContentDeliveryDestination fromJson(
          Map<String, dynamic> json) =>
      DatasetContentDeliveryDestination();
}

/// When data set contents are created they are delivered to destination
/// specified here.
class DatasetContentDeliveryRule {
  /// The name of the data set content delivery rules entry.
  final String entryName;

  /// The destination to which data set contents are delivered.
  final DatasetContentDeliveryDestination destination;

  DatasetContentDeliveryRule({
    this.entryName,
    @required this.destination,
  });
  static DatasetContentDeliveryRule fromJson(Map<String, dynamic> json) =>
      DatasetContentDeliveryRule();
}

/// The state of the data set contents and the reason they are in this state.
class DatasetContentStatus {
  /// The state of the data set contents. Can be one of "READY", "CREATING",
  /// "SUCCEEDED" or "FAILED".
  final String state;

  /// The reason the data set contents are in this state.
  final String reason;

  DatasetContentStatus({
    this.state,
    this.reason,
  });
  static DatasetContentStatus fromJson(Map<String, dynamic> json) =>
      DatasetContentStatus();
}

/// Summary information about data set contents.
class DatasetContentSummary {
  /// The version of the data set contents.
  final String version;

  /// The status of the data set contents.
  final DatasetContentStatus status;

  /// The actual time the creation of the data set contents was started.
  final DateTime creationTime;

  /// The time the creation of the data set contents was scheduled to start.
  final DateTime scheduleTime;

  DatasetContentSummary({
    this.version,
    this.status,
    this.creationTime,
    this.scheduleTime,
  });
  static DatasetContentSummary fromJson(Map<String, dynamic> json) =>
      DatasetContentSummary();
}

/// The data set whose latest contents are used as input to the notebook or
/// application.
class DatasetContentVersionValue {
  /// The name of the data set whose latest contents are used as input to the
  /// notebook or application.
  final String datasetName;

  DatasetContentVersionValue({
    @required this.datasetName,
  });
  static DatasetContentVersionValue fromJson(Map<String, dynamic> json) =>
      DatasetContentVersionValue();
}

/// The reference to a data set entry.
class DatasetEntry {
  /// The name of the data set item.
  final String entryName;

  /// The pre-signed URI of the data set item.
  final String dataUri;

  DatasetEntry({
    this.entryName,
    this.dataUri,
  });
  static DatasetEntry fromJson(Map<String, dynamic> json) => DatasetEntry();
}

/// A summary of information about a data set.
class DatasetSummary {
  /// The name of the data set.
  final String datasetName;

  /// The status of the data set.
  final String status;

  /// The time the data set was created.
  final DateTime creationTime;

  /// The last time the data set was updated.
  final DateTime lastUpdateTime;

  /// A list of triggers. A trigger causes data set content to be populated at a
  /// specified time interval or when another data set is populated. The list of
  /// triggers can be empty or contain up to five DataSetTrigger objects
  final List<DatasetTrigger> triggers;

  /// A list of "DataActionSummary" objects.
  final List<DatasetActionSummary> actions;

  DatasetSummary({
    this.datasetName,
    this.status,
    this.creationTime,
    this.lastUpdateTime,
    this.triggers,
    this.actions,
  });
  static DatasetSummary fromJson(Map<String, dynamic> json) => DatasetSummary();
}

/// The "DatasetTrigger" that specifies when the data set is automatically
/// updated.
class DatasetTrigger {
  /// The "Schedule" when the trigger is initiated.
  final Schedule schedule;

  /// The data set whose content creation triggers the creation of this data
  /// set's contents.
  final TriggeringDataset dataset;

  DatasetTrigger({
    this.schedule,
    this.dataset,
  });
  static DatasetTrigger fromJson(Map<String, dynamic> json) => DatasetTrigger();
}

/// Information about a data store.
class Datastore {
  /// The name of the data store.
  final String name;

  /// Where data store data is stored.
  final DatastoreStorage storage;

  /// The ARN of the data store.
  final String arn;

  /// The status of a data store:
  ///
  /// CREATING
  ///
  /// The data store is being created.
  ///
  /// ACTIVE
  ///
  /// The data store has been created and can be used.
  ///
  /// DELETING
  ///
  /// The data store is being deleted.
  final String status;

  /// How long, in days, message data is kept for the data store.
  final RetentionPeriod retentionPeriod;

  /// When the data store was created.
  final DateTime creationTime;

  /// The last time the data store was updated.
  final DateTime lastUpdateTime;

  Datastore({
    this.name,
    this.storage,
    this.arn,
    this.status,
    this.retentionPeriod,
    this.creationTime,
    this.lastUpdateTime,
  });
  static Datastore fromJson(Map<String, dynamic> json) => Datastore();
}

/// The 'datastore' activity that specifies where to store the processed data.
class DatastoreActivity {
  /// The name of the 'datastore' activity.
  final String name;

  /// The name of the data store where processed messages are stored.
  final String datastoreName;

  DatastoreActivity({
    @required this.name,
    @required this.datastoreName,
  });
  static DatastoreActivity fromJson(Map<String, dynamic> json) =>
      DatastoreActivity();
}

/// Statistical information about the data store.
class DatastoreStatistics {
  /// The estimated size of the data store.
  final EstimatedResourceSize size;

  DatastoreStatistics({
    this.size,
  });
  static DatastoreStatistics fromJson(Map<String, dynamic> json) =>
      DatastoreStatistics();
}

/// Where data store data is stored.
class DatastoreStorage {
  /// Use this to store data store data in an S3 bucket managed by the AWS IoT
  /// Analytics service.
  final ServiceManagedDatastoreS3Storage serviceManagedS3;

  /// Use this to store data store data in an S3 bucket that you manage.
  final CustomerManagedDatastoreS3Storage customerManagedS3;

  DatastoreStorage({
    this.serviceManagedS3,
    this.customerManagedS3,
  });
  static DatastoreStorage fromJson(Map<String, dynamic> json) =>
      DatastoreStorage();
}

/// Where data store data is stored.
class DatastoreStorageSummary {
  /// Used to store data store data in an S3 bucket managed by the AWS IoT
  /// Analytics service.
  final ServiceManagedDatastoreS3StorageSummary serviceManagedS3;

  /// Used to store data store data in an S3 bucket that you manage.
  final CustomerManagedDatastoreS3StorageSummary customerManagedS3;

  DatastoreStorageSummary({
    this.serviceManagedS3,
    this.customerManagedS3,
  });
  static DatastoreStorageSummary fromJson(Map<String, dynamic> json) =>
      DatastoreStorageSummary();
}

/// A summary of information about a data store.
class DatastoreSummary {
  /// The name of the data store.
  final String datastoreName;

  /// Where data store data is stored.
  final DatastoreStorageSummary datastoreStorage;

  /// The status of the data store.
  final String status;

  /// When the data store was created.
  final DateTime creationTime;

  /// The last time the data store was updated.
  final DateTime lastUpdateTime;

  DatastoreSummary({
    this.datastoreName,
    this.datastoreStorage,
    this.status,
    this.creationTime,
    this.lastUpdateTime,
  });
  static DatastoreSummary fromJson(Map<String, dynamic> json) =>
      DatastoreSummary();
}

/// Used to limit data to that which has arrived since the last execution of the
/// action.
class DeltaTime {
  /// The number of seconds of estimated "in flight" lag time of message data.
  /// When you create data set contents using message data from a specified time
  /// frame, some message data may still be "in flight" when processing begins,
  /// and so will not arrive in time to be processed. Use this field to make
  /// allowances for the "in flight" time of your message data, so that data not
  /// processed from a previous time frame will be included with the next time
  /// frame. Without this, missed message data would be excluded from processing
  /// during the next time frame as well, because its timestamp places it within
  /// the previous time frame.
  final int offsetSeconds;

  /// An expression by which the time of the message data may be determined.
  /// This may be the name of a timestamp field, or a SQL expression which is
  /// used to derive the time the message data was generated.
  final String timeExpression;

  DeltaTime({
    @required this.offsetSeconds,
    @required this.timeExpression,
  });
  static DeltaTime fromJson(Map<String, dynamic> json) => DeltaTime();
}

class DescribeChannelResponse {
  /// An object that contains information about the channel.
  final Channel channel;

  /// Statistics about the channel. Included if the 'includeStatistics'
  /// parameter is set to true in the request.
  final ChannelStatistics statistics;

  DescribeChannelResponse({
    this.channel,
    this.statistics,
  });
  static DescribeChannelResponse fromJson(Map<String, dynamic> json) =>
      DescribeChannelResponse();
}

class DescribeDatasetResponse {
  /// An object that contains information about the data set.
  final Dataset dataset;

  DescribeDatasetResponse({
    this.dataset,
  });
  static DescribeDatasetResponse fromJson(Map<String, dynamic> json) =>
      DescribeDatasetResponse();
}

class DescribeDatastoreResponse {
  /// Information about the data store.
  final Datastore datastore;

  /// Additional statistical information about the data store. Included if the
  /// 'includeStatistics' parameter is set to true in the request.
  final DatastoreStatistics statistics;

  DescribeDatastoreResponse({
    this.datastore,
    this.statistics,
  });
  static DescribeDatastoreResponse fromJson(Map<String, dynamic> json) =>
      DescribeDatastoreResponse();
}

class DescribeLoggingOptionsResponse {
  /// The current settings of the AWS IoT Analytics logging options.
  final LoggingOptions loggingOptions;

  DescribeLoggingOptionsResponse({
    this.loggingOptions,
  });
  static DescribeLoggingOptionsResponse fromJson(Map<String, dynamic> json) =>
      DescribeLoggingOptionsResponse();
}

class DescribePipelineResponse {
  /// A "Pipeline" object that contains information about the pipeline.
  final Pipeline pipeline;

  DescribePipelineResponse({
    this.pipeline,
  });
  static DescribePipelineResponse fromJson(Map<String, dynamic> json) =>
      DescribePipelineResponse();
}

/// An activity that adds data from the AWS IoT device registry to your message.
class DeviceRegistryEnrichActivity {
  /// The name of the 'deviceRegistryEnrich' activity.
  final String name;

  /// The name of the attribute that is added to the message.
  final String attribute;

  /// The name of the IoT device whose registry information is added to the
  /// message.
  final String thingName;

  /// The ARN of the role that allows access to the device's registry
  /// information.
  final String roleArn;

  /// The next activity in the pipeline.
  final String next;

  DeviceRegistryEnrichActivity({
    @required this.name,
    @required this.attribute,
    @required this.thingName,
    @required this.roleArn,
    this.next,
  });
  static DeviceRegistryEnrichActivity fromJson(Map<String, dynamic> json) =>
      DeviceRegistryEnrichActivity();
}

/// An activity that adds information from the AWS IoT Device Shadows service to
/// a message.
class DeviceShadowEnrichActivity {
  /// The name of the 'deviceShadowEnrich' activity.
  final String name;

  /// The name of the attribute that is added to the message.
  final String attribute;

  /// The name of the IoT device whose shadow information is added to the
  /// message.
  final String thingName;

  /// The ARN of the role that allows access to the device's shadow.
  final String roleArn;

  /// The next activity in the pipeline.
  final String next;

  DeviceShadowEnrichActivity({
    @required this.name,
    @required this.attribute,
    @required this.thingName,
    @required this.roleArn,
    this.next,
  });
  static DeviceShadowEnrichActivity fromJson(Map<String, dynamic> json) =>
      DeviceShadowEnrichActivity();
}

/// The estimated size of the resource.
class EstimatedResourceSize {
  /// The estimated size of the resource in bytes.
  final double estimatedSizeInBytes;

  /// The time when the estimate of the size of the resource was made.
  final DateTime estimatedOn;

  EstimatedResourceSize({
    this.estimatedSizeInBytes,
    this.estimatedOn,
  });
  static EstimatedResourceSize fromJson(Map<String, dynamic> json) =>
      EstimatedResourceSize();
}

/// An activity that filters a message based on its attributes.
class FilterActivity {
  /// The name of the 'filter' activity.
  final String name;

  /// An expression that looks like a SQL WHERE clause that must return a
  /// Boolean value.
  final String filter;

  /// The next activity in the pipeline.
  final String next;

  FilterActivity({
    @required this.name,
    @required this.filter,
    this.next,
  });
  static FilterActivity fromJson(Map<String, dynamic> json) => FilterActivity();
}

class GetDatasetContentResponse {
  /// A list of "DatasetEntry" objects.
  final List<DatasetEntry> entries;

  /// The time when the request was made.
  final DateTime timestamp;

  /// The status of the data set content.
  final DatasetContentStatus status;

  GetDatasetContentResponse({
    this.entries,
    this.timestamp,
    this.status,
  });
  static GetDatasetContentResponse fromJson(Map<String, dynamic> json) =>
      GetDatasetContentResponse();
}

/// Configuration information for coordination with the AWS Glue ETL (extract,
/// transform and load) service.
class GlueConfiguration {
  /// The name of the table in your AWS Glue Data Catalog which is used to
  /// perform the ETL (extract, transform and load) operations. (An AWS Glue
  /// Data Catalog table contains partitioned data and descriptions of data
  /// sources and targets.)
  final String tableName;

  /// The name of the database in your AWS Glue Data Catalog in which the table
  /// is located. (An AWS Glue Data Catalog database contains Glue Data tables.)
  final String databaseName;

  GlueConfiguration({
    @required this.tableName,
    @required this.databaseName,
  });
  static GlueConfiguration fromJson(Map<String, dynamic> json) =>
      GlueConfiguration();
}

/// Configuration information for delivery of data set contents to AWS IoT
/// Events.
class IotEventsDestinationConfiguration {
  /// The name of the AWS IoT Events input to which data set contents are
  /// delivered.
  final String inputName;

  /// The ARN of the role which grants AWS IoT Analytics permission to deliver
  /// data set contents to an AWS IoT Events input.
  final String roleArn;

  IotEventsDestinationConfiguration({
    @required this.inputName,
    @required this.roleArn,
  });
  static IotEventsDestinationConfiguration fromJson(
          Map<String, dynamic> json) =>
      IotEventsDestinationConfiguration();
}

/// An activity that runs a Lambda function to modify the message.
class LambdaActivity {
  /// The name of the 'lambda' activity.
  final String name;

  /// The name of the Lambda function that is run on the message.
  final String lambdaName;

  /// The number of messages passed to the Lambda function for processing.
  ///
  /// The AWS Lambda function must be able to process all of these messages
  /// within five minutes, which is the maximum timeout duration for Lambda
  /// functions.
  final int batchSize;

  /// The next activity in the pipeline.
  final String next;

  LambdaActivity({
    @required this.name,
    @required this.lambdaName,
    @required this.batchSize,
    this.next,
  });
  static LambdaActivity fromJson(Map<String, dynamic> json) => LambdaActivity();
}

class ListChannelsResponse {
  /// A list of "ChannelSummary" objects.
  final List<ChannelSummary> channelSummaries;

  /// The token to retrieve the next set of results, or `null` if there are no
  /// more results.
  final String nextToken;

  ListChannelsResponse({
    this.channelSummaries,
    this.nextToken,
  });
  static ListChannelsResponse fromJson(Map<String, dynamic> json) =>
      ListChannelsResponse();
}

class ListDatasetContentsResponse {
  /// Summary information about data set contents that have been created.
  final List<DatasetContentSummary> datasetContentSummaries;

  /// The token to retrieve the next set of results, or `null` if there are no
  /// more results.
  final String nextToken;

  ListDatasetContentsResponse({
    this.datasetContentSummaries,
    this.nextToken,
  });
  static ListDatasetContentsResponse fromJson(Map<String, dynamic> json) =>
      ListDatasetContentsResponse();
}

class ListDatasetsResponse {
  /// A list of "DatasetSummary" objects.
  final List<DatasetSummary> datasetSummaries;

  /// The token to retrieve the next set of results, or `null` if there are no
  /// more results.
  final String nextToken;

  ListDatasetsResponse({
    this.datasetSummaries,
    this.nextToken,
  });
  static ListDatasetsResponse fromJson(Map<String, dynamic> json) =>
      ListDatasetsResponse();
}

class ListDatastoresResponse {
  /// A list of "DatastoreSummary" objects.
  final List<DatastoreSummary> datastoreSummaries;

  /// The token to retrieve the next set of results, or `null` if there are no
  /// more results.
  final String nextToken;

  ListDatastoresResponse({
    this.datastoreSummaries,
    this.nextToken,
  });
  static ListDatastoresResponse fromJson(Map<String, dynamic> json) =>
      ListDatastoresResponse();
}

class ListPipelinesResponse {
  /// A list of "PipelineSummary" objects.
  final List<PipelineSummary> pipelineSummaries;

  /// The token to retrieve the next set of results, or `null` if there are no
  /// more results.
  final String nextToken;

  ListPipelinesResponse({
    this.pipelineSummaries,
    this.nextToken,
  });
  static ListPipelinesResponse fromJson(Map<String, dynamic> json) =>
      ListPipelinesResponse();
}

class ListTagsForResourceResponse {
  /// The tags (metadata) which you have assigned to the resource.
  final List<Tag> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  static ListTagsForResourceResponse fromJson(Map<String, dynamic> json) =>
      ListTagsForResourceResponse();
}

/// Information about logging options.
class LoggingOptions {
  /// The ARN of the role that grants permission to AWS IoT Analytics to perform
  /// logging.
  final String roleArn;

  /// The logging level. Currently, only "ERROR" is supported.
  final String level;

  /// If true, logging is enabled for AWS IoT Analytics.
  final bool enabled;

  LoggingOptions({
    @required this.roleArn,
    @required this.level,
    @required this.enabled,
  });
  static LoggingOptions fromJson(Map<String, dynamic> json) => LoggingOptions();
}

/// An activity that computes an arithmetic expression using the message's
/// attributes.
class MathActivity {
  /// The name of the 'math' activity.
  final String name;

  /// The name of the attribute that contains the result of the math operation.
  final String attribute;

  /// An expression that uses one or more existing attributes and must return an
  /// integer value.
  final String math;

  /// The next activity in the pipeline.
  final String next;

  MathActivity({
    @required this.name,
    @required this.attribute,
    @required this.math,
    this.next,
  });
  static MathActivity fromJson(Map<String, dynamic> json) => MathActivity();
}

/// Information about a message.
class Message {
  /// The ID you wish to assign to the message. Each "messageId" must be unique
  /// within each batch sent.
  final String messageId;

  /// The payload of the message. This may be a JSON string or a Base64-encoded
  /// string representing binary data (in which case you must decode it by means
  /// of a pipeline activity).
  final Uint8List payload;

  Message({
    @required this.messageId,
    @required this.payload,
  });
}

/// The value of the variable as a structure that specifies an output file URI.
class OutputFileUriValue {
  /// The URI of the location where data set contents are stored, usually the
  /// URI of a file in an S3 bucket.
  final String fileName;

  OutputFileUriValue({
    @required this.fileName,
  });
  static OutputFileUriValue fromJson(Map<String, dynamic> json) =>
      OutputFileUriValue();
}

/// Contains information about a pipeline.
class Pipeline {
  /// The name of the pipeline.
  final String name;

  /// The ARN of the pipeline.
  final String arn;

  /// The activities that perform transformations on the messages.
  final List<PipelineActivity> activities;

  /// A summary of information about the pipeline reprocessing.
  final List<ReprocessingSummary> reprocessingSummaries;

  /// When the pipeline was created.
  final DateTime creationTime;

  /// The last time the pipeline was updated.
  final DateTime lastUpdateTime;

  Pipeline({
    this.name,
    this.arn,
    this.activities,
    this.reprocessingSummaries,
    this.creationTime,
    this.lastUpdateTime,
  });
  static Pipeline fromJson(Map<String, dynamic> json) => Pipeline();
}

/// An activity that performs a transformation on a message.
class PipelineActivity {
  /// Determines the source of the messages to be processed.
  final ChannelActivity channel;

  /// Runs a Lambda function to modify the message.
  final LambdaActivity lambda;

  /// Specifies where to store the processed message data.
  final DatastoreActivity datastore;

  /// Adds other attributes based on existing attributes in the message.
  final AddAttributesActivity addAttributes;

  /// Removes attributes from a message.
  final RemoveAttributesActivity removeAttributes;

  /// Creates a new message using only the specified attributes from the
  /// original message.
  final SelectAttributesActivity selectAttributes;

  /// Filters a message based on its attributes.
  final FilterActivity filter;

  /// Computes an arithmetic expression using the message's attributes and adds
  /// it to the message.
  final MathActivity math;

  /// Adds data from the AWS IoT device registry to your message.
  final DeviceRegistryEnrichActivity deviceRegistryEnrich;

  /// Adds information from the AWS IoT Device Shadows service to a message.
  final DeviceShadowEnrichActivity deviceShadowEnrich;

  PipelineActivity({
    this.channel,
    this.lambda,
    this.datastore,
    this.addAttributes,
    this.removeAttributes,
    this.selectAttributes,
    this.filter,
    this.math,
    this.deviceRegistryEnrich,
    this.deviceShadowEnrich,
  });
  static PipelineActivity fromJson(Map<String, dynamic> json) =>
      PipelineActivity();
}

/// A summary of information about a pipeline.
class PipelineSummary {
  /// The name of the pipeline.
  final String pipelineName;

  /// A summary of information about the pipeline reprocessing.
  final List<ReprocessingSummary> reprocessingSummaries;

  /// When the pipeline was created.
  final DateTime creationTime;

  /// When the pipeline was last updated.
  final DateTime lastUpdateTime;

  PipelineSummary({
    this.pipelineName,
    this.reprocessingSummaries,
    this.creationTime,
    this.lastUpdateTime,
  });
  static PipelineSummary fromJson(Map<String, dynamic> json) =>
      PipelineSummary();
}

/// Information which is used to filter message data, to segregate it according
/// to the time frame in which it arrives.
class QueryFilter {
  /// Used to limit data to that which has arrived since the last execution of
  /// the action.
  final DeltaTime deltaTime;

  QueryFilter({
    this.deltaTime,
  });
  static QueryFilter fromJson(Map<String, dynamic> json) => QueryFilter();
}

/// An activity that removes attributes from a message.
class RemoveAttributesActivity {
  /// The name of the 'removeAttributes' activity.
  final String name;

  /// A list of 1-50 attributes to remove from the message.
  final List<String> attributes;

  /// The next activity in the pipeline.
  final String next;

  RemoveAttributesActivity({
    @required this.name,
    @required this.attributes,
    this.next,
  });
  static RemoveAttributesActivity fromJson(Map<String, dynamic> json) =>
      RemoveAttributesActivity();
}

/// Information about pipeline reprocessing.
class ReprocessingSummary {
  /// The 'reprocessingId' returned by "StartPipelineReprocessing".
  final String id;

  /// The status of the pipeline reprocessing.
  final String status;

  /// The time the pipeline reprocessing was created.
  final DateTime creationTime;

  ReprocessingSummary({
    this.id,
    this.status,
    this.creationTime,
  });
  static ReprocessingSummary fromJson(Map<String, dynamic> json) =>
      ReprocessingSummary();
}

/// The configuration of the resource used to execute the "containerAction".
class ResourceConfiguration {
  /// The type of the compute resource used to execute the "containerAction".
  /// Possible values are: ACU_1 (vCPU=4, memory=16GiB) or ACU_2 (vCPU=8,
  /// memory=32GiB).
  final String computeType;

  /// The size (in GB) of the persistent storage available to the resource
  /// instance used to execute the "containerAction" (min: 1, max: 50).
  final int volumeSizeInGB;

  ResourceConfiguration({
    @required this.computeType,
    @required this.volumeSizeInGB,
  });
  static ResourceConfiguration fromJson(Map<String, dynamic> json) =>
      ResourceConfiguration();
}

/// How long, in days, message data is kept.
class RetentionPeriod {
  /// If true, message data is kept indefinitely.
  final bool unlimited;

  /// The number of days that message data is kept. The "unlimited" parameter
  /// must be false.
  final int numberOfDays;

  RetentionPeriod({
    this.unlimited,
    this.numberOfDays,
  });
  static RetentionPeriod fromJson(Map<String, dynamic> json) =>
      RetentionPeriod();
}

class RunPipelineActivityResponse {
  /// The enriched or transformed sample message payloads as base64-encoded
  /// strings. (The results of running the pipeline activity on each input
  /// sample message payload, encoded in base64.)
  final List<Uint8List> payloads;

  /// In case the pipeline activity fails, the log message that is generated.
  final String logResult;

  RunPipelineActivityResponse({
    this.payloads,
    this.logResult,
  });
  static RunPipelineActivityResponse fromJson(Map<String, dynamic> json) =>
      RunPipelineActivityResponse();
}

/// Configuration information for delivery of data set contents to Amazon S3.
class S3DestinationConfiguration {
  /// The name of the Amazon S3 bucket to which data set contents are delivered.
  final String bucket;

  /// The key of the data set contents object. Each object in an Amazon S3
  /// bucket has a key that is its unique identifier within the bucket (each
  /// object in a bucket has exactly one key).
  final String key;

  /// Configuration information for coordination with the AWS Glue ETL (extract,
  /// transform and load) service.
  final GlueConfiguration glueConfiguration;

  /// The ARN of the role which grants AWS IoT Analytics permission to interact
  /// with your Amazon S3 and AWS Glue resources.
  final String roleArn;

  S3DestinationConfiguration({
    @required this.bucket,
    @required this.key,
    this.glueConfiguration,
    @required this.roleArn,
  });
  static S3DestinationConfiguration fromJson(Map<String, dynamic> json) =>
      S3DestinationConfiguration();
}

class SampleChannelDataResponse {
  /// The list of message samples. Each sample message is returned as a
  /// base64-encoded string.
  final List<Uint8List> payloads;

  SampleChannelDataResponse({
    this.payloads,
  });
  static SampleChannelDataResponse fromJson(Map<String, dynamic> json) =>
      SampleChannelDataResponse();
}

/// The schedule for when to trigger an update.
class Schedule {
  /// The expression that defines when to trigger an update. For more
  /// information, see
  /// [Schedule Expressions for Rules](https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/ScheduledEvents.html)
  /// in the Amazon CloudWatch Events User Guide.
  final String expression;

  Schedule({
    this.expression,
  });
  static Schedule fromJson(Map<String, dynamic> json) => Schedule();
}

/// Creates a new message using only the specified attributes from the original
/// message.
class SelectAttributesActivity {
  /// The name of the 'selectAttributes' activity.
  final String name;

  /// A list of the attributes to select from the message.
  final List<String> attributes;

  /// The next activity in the pipeline.
  final String next;

  SelectAttributesActivity({
    @required this.name,
    @required this.attributes,
    this.next,
  });
  static SelectAttributesActivity fromJson(Map<String, dynamic> json) =>
      SelectAttributesActivity();
}

/// Use this to store channel data in an S3 bucket managed by the AWS IoT
/// Analytics service.
class ServiceManagedChannelS3Storage {
  ServiceManagedChannelS3Storage();
  static ServiceManagedChannelS3Storage fromJson(Map<String, dynamic> json) =>
      ServiceManagedChannelS3Storage();
}

/// Used to store channel data in an S3 bucket managed by the AWS IoT Analytics
/// service.
class ServiceManagedChannelS3StorageSummary {
  ServiceManagedChannelS3StorageSummary();
  static ServiceManagedChannelS3StorageSummary fromJson(
          Map<String, dynamic> json) =>
      ServiceManagedChannelS3StorageSummary();
}

/// Use this to store data store data in an S3 bucket managed by the AWS IoT
/// Analytics service.
class ServiceManagedDatastoreS3Storage {
  ServiceManagedDatastoreS3Storage();
  static ServiceManagedDatastoreS3Storage fromJson(Map<String, dynamic> json) =>
      ServiceManagedDatastoreS3Storage();
}

/// Used to store data store data in an S3 bucket managed by the AWS IoT
/// Analytics service.
class ServiceManagedDatastoreS3StorageSummary {
  ServiceManagedDatastoreS3StorageSummary();
  static ServiceManagedDatastoreS3StorageSummary fromJson(
          Map<String, dynamic> json) =>
      ServiceManagedDatastoreS3StorageSummary();
}

/// The SQL query to modify the message.
class SqlQueryDatasetAction {
  /// A SQL query string.
  final String sqlQuery;

  /// Pre-filters applied to message data.
  final List<QueryFilter> filters;

  SqlQueryDatasetAction({
    @required this.sqlQuery,
    this.filters,
  });
  static SqlQueryDatasetAction fromJson(Map<String, dynamic> json) =>
      SqlQueryDatasetAction();
}

class StartPipelineReprocessingResponse {
  /// The ID of the pipeline reprocessing activity that was started.
  final String reprocessingId;

  StartPipelineReprocessingResponse({
    this.reprocessingId,
  });
  static StartPipelineReprocessingResponse fromJson(
          Map<String, dynamic> json) =>
      StartPipelineReprocessingResponse();
}

/// A set of key/value pairs which are used to manage the resource.
class Tag {
  /// The tag's key.
  final String key;

  /// The tag's value.
  final String value;

  Tag({
    @required this.key,
    @required this.value,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag();
}

class TagResourceResponse {
  TagResourceResponse();
  static TagResourceResponse fromJson(Map<String, dynamic> json) =>
      TagResourceResponse();
}

/// Information about the data set whose content generation triggers the new
/// data set content generation.
class TriggeringDataset {
  /// The name of the data set whose content generation triggers the new data
  /// set content generation.
  final String name;

  TriggeringDataset({
    @required this.name,
  });
  static TriggeringDataset fromJson(Map<String, dynamic> json) =>
      TriggeringDataset();
}

class UntagResourceResponse {
  UntagResourceResponse();
  static UntagResourceResponse fromJson(Map<String, dynamic> json) =>
      UntagResourceResponse();
}

/// An instance of a variable to be passed to the "containerAction" execution.
/// Each variable must have a name and a value given by one of "stringValue",
/// "datasetContentVersionValue", or "outputFileUriValue".
class Variable {
  /// The name of the variable.
  final String name;

  /// The value of the variable as a string.
  final String stringValue;

  /// The value of the variable as a double (numeric).
  final double doubleValue;

  /// The value of the variable as a structure that specifies a data set content
  /// version.
  final DatasetContentVersionValue datasetContentVersionValue;

  /// The value of the variable as a structure that specifies an output file
  /// URI.
  final OutputFileUriValue outputFileUriValue;

  Variable({
    @required this.name,
    this.stringValue,
    this.doubleValue,
    this.datasetContentVersionValue,
    this.outputFileUriValue,
  });
  static Variable fromJson(Map<String, dynamic> json) => Variable();
}

/// Information about the versioning of data set contents.
class VersioningConfiguration {
  /// If true, unlimited versions of data set contents will be kept.
  final bool unlimited;

  /// How many versions of data set contents will be kept. The "unlimited"
  /// parameter must be false.
  final int maxVersions;

  VersioningConfiguration({
    this.unlimited,
    this.maxVersions,
  });
  static VersioningConfiguration fromJson(Map<String, dynamic> json) =>
      VersioningConfiguration();
}
