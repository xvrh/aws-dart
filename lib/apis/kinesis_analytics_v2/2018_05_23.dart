import 'package:meta/meta.dart';

/// Amazon Kinesis Data Analytics is a fully managed service that you can use to
/// process and analyze streaming data using SQL or Java. The service enables
/// you to quickly author and run SQL or Java code against streaming sources to
/// perform time series analytics, feed real-time dashboards, and create
/// real-time metrics.
class KinesisAnalyticsV2Api {
  /// Adds an Amazon CloudWatch log stream to monitor application configuration
  /// errors.
  Future<void> addApplicationCloudWatchLoggingOption(
      {@required String applicationName,
      @required BigInt currentApplicationVersionId,
      @required CloudWatchLoggingOption cloudWatchLoggingOption}) async {}

  ///  Adds a streaming source to your SQL-based Amazon Kinesis Data Analytics
  /// application.
  ///
  /// You can add a streaming source when you create an application, or you can
  /// use this operation to add a streaming source after you create an
  /// application. For more information, see CreateApplication.
  ///
  /// Any configuration update, including adding a streaming source using this
  /// operation, results in a new version of the application. You can use the
  /// DescribeApplication operation to find the current application version.
  Future<void> addApplicationInput(
      {@required String applicationName,
      @required BigInt currentApplicationVersionId,
      @required Input input}) async {}

  /// Adds an InputProcessingConfiguration to an SQL-based Kinesis Data
  /// Analytics application. An input processor pre-processes records on the
  /// input stream before the application's SQL code executes. Currently, the
  /// only input processor available is [AWS
  /// Lambda](https://aws.amazon.com/documentation/lambda/).
  Future<void> addApplicationInputProcessingConfiguration(
      {@required
          String applicationName,
      @required
          BigInt currentApplicationVersionId,
      @required
          String inputId,
      @required
          InputProcessingConfiguration inputProcessingConfiguration}) async {}

  /// Adds an external destination to your SQL-based Amazon Kinesis Data
  /// Analytics application.
  ///
  /// If you want Kinesis Data Analytics to deliver data from an in-application
  /// stream within your application to an external destination (such as an
  /// Kinesis data stream, a Kinesis Data Firehose delivery stream, or an AWS
  /// Lambda function), you add the relevant configuration to your application
  /// using this operation. You can configure one or more outputs for your
  /// application. Each output configuration maps an in-application stream and
  /// an external destination.
  ///
  ///  You can use one of the output configurations to deliver data from your
  /// in-application error stream to an external destination so that you can
  /// analyze the errors.
  ///
  ///  Any configuration update, including adding a streaming source using this
  /// operation, results in a new version of the application. You can use the
  /// DescribeApplication operation to find the current application version.
  Future<void> addApplicationOutput(
      {@required String applicationName,
      @required BigInt currentApplicationVersionId,
      @required Output output}) async {}

  /// Adds a reference data source to an existing SQL-based Amazon Kinesis Data
  /// Analytics application.
  ///
  /// Kinesis Data Analytics reads reference data (that is, an Amazon S3 object)
  /// and creates an in-application table within your application. In the
  /// request, you provide the source (S3 bucket name and object key name), name
  /// of the in-application table to create, and the necessary mapping
  /// information that describes how data in an Amazon S3 object maps to columns
  /// in the resulting in-application table.
  Future<void> addApplicationReferenceDataSource(
      {@required String applicationName,
      @required BigInt currentApplicationVersionId,
      @required ReferenceDataSource referenceDataSource}) async {}

  /// Creates an Amazon Kinesis Data Analytics application. For information
  /// about creating a Kinesis Data Analytics application, see [Creating an
  /// Application](https://docs.aws.amazon.com/kinesisanalytics/latest/java/getting-started.html).
  Future<void> createApplication(
      {@required String applicationName,
      String applicationDescription,
      @required String runtimeEnvironment,
      @required String serviceExecutionRole,
      ApplicationConfiguration applicationConfiguration,
      List<CloudWatchLoggingOption> cloudWatchLoggingOptions,
      List<Tag> tags}) async {}

  /// Creates a snapshot of the application's state data.
  Future<void> createApplicationSnapshot(
      {@required String applicationName,
      @required String snapshotName}) async {}

  /// Deletes the specified application. Kinesis Data Analytics halts
  /// application execution and deletes the application.
  Future<void> deleteApplication(
      {@required String applicationName,
      @required DateTime createTimestamp}) async {}

  /// Deletes an Amazon CloudWatch log stream from an Amazon Kinesis Data
  /// Analytics application.
  Future<void> deleteApplicationCloudWatchLoggingOption(
      {@required String applicationName,
      @required BigInt currentApplicationVersionId,
      @required String cloudWatchLoggingOptionId}) async {}

  /// Deletes an InputProcessingConfiguration from an input.
  Future<void> deleteApplicationInputProcessingConfiguration(
      {@required String applicationName,
      @required BigInt currentApplicationVersionId,
      @required String inputId}) async {}

  /// Deletes the output destination configuration from your SQL-based Amazon
  /// Kinesis Data Analytics application's configuration. Kinesis Data Analytics
  /// will no longer write data from the corresponding in-application stream to
  /// the external output destination.
  Future<void> deleteApplicationOutput(
      {@required String applicationName,
      @required BigInt currentApplicationVersionId,
      @required String outputId}) async {}

  /// Deletes a reference data source configuration from the specified SQL-based
  /// Amazon Kinesis Data Analytics application's configuration.
  ///
  /// If the application is running, Kinesis Data Analytics immediately removes
  /// the in-application table that you created using the
  /// AddApplicationReferenceDataSource operation.
  Future<void> deleteApplicationReferenceDataSource(
      {@required String applicationName,
      @required BigInt currentApplicationVersionId,
      @required String referenceId}) async {}

  /// Deletes a snapshot of application state.
  Future<void> deleteApplicationSnapshot(
      {@required String applicationName,
      @required String snapshotName,
      @required DateTime snapshotCreationTimestamp}) async {}

  /// Returns information about a specific Amazon Kinesis Data Analytics
  /// application.
  ///
  /// If you want to retrieve a list of all applications in your account, use
  /// the ListApplications operation.
  Future<void> describeApplication(String applicationName,
      {bool includeAdditionalDetails}) async {}

  /// Returns information about a snapshot of application state data.
  Future<void> describeApplicationSnapshot(
      {@required String applicationName,
      @required String snapshotName}) async {}

  /// Infers a schema for an SQL-based Amazon Kinesis Data Analytics application
  /// by evaluating sample records on the specified streaming source (Kinesis
  /// data stream or Kinesis Data Firehose delivery stream) or Amazon S3 object.
  /// In the response, the operation returns the inferred schema and also the
  /// sample records that the operation used to infer the schema.
  ///
  ///  You can use the inferred schema when configuring a streaming source for
  /// your application. When you create an application using the Kinesis Data
  /// Analytics console, the console uses this operation to infer a schema and
  /// show it in the console user interface.
  Future<void> discoverInputSchema(String serviceExecutionRole,
      {String resourceArn,
      InputStartingPositionConfiguration inputStartingPositionConfiguration,
      S3Configuration s3Configuration,
      InputProcessingConfiguration inputProcessingConfiguration}) async {}

  /// Lists information about the current application snapshots.
  Future<void> listApplicationSnapshots(String applicationName,
      {int limit, String nextToken}) async {}

  /// Returns a list of Amazon Kinesis Data Analytics applications in your
  /// account. For each application, the response includes the application name,
  /// Amazon Resource Name (ARN), and status.
  ///
  /// If you want detailed information about a specific application, use
  /// DescribeApplication.
  Future<void> listApplications({int limit, String nextToken}) async {}

  /// Retrieves the list of key-value tags assigned to the application.
  Future<void> listTagsForResource(String resourceArn) async {}

  /// Starts the specified Amazon Kinesis Data Analytics application. After
  /// creating an application, you must exclusively call this operation to start
  /// your application.
  Future<void> startApplication(
      {@required String applicationName,
      @required RunConfiguration runConfiguration}) async {}

  /// Stops the application from processing data. You can stop an application
  /// only if it is in the running state. You can use the DescribeApplication
  /// operation to find the application state.
  Future<void> stopApplication(String applicationName) async {}

  /// Adds one or more key-value tags to a Kinesis Analytics application. Note
  /// that the maximum number of application tags includes system tags. The
  /// maximum number of user-defined application tags is 50.
  Future<void> tagResource(
      {@required String resourceArn, @required List<Tag> tags}) async {}

  /// Removes one or more tags from a Kinesis Analytics application.
  Future<void> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {}

  /// Updates an existing Amazon Kinesis Data Analytics application. Using this
  /// operation, you can update application code, input configuration, and
  /// output configuration.
  ///
  /// Kinesis Data Analytics updates the `ApplicationVersionId` each time you
  /// update your application.
  Future<void> updateApplication(
      {@required String applicationName,
      @required BigInt currentApplicationVersionId,
      ApplicationConfigurationUpdate applicationConfigurationUpdate,
      String serviceExecutionRoleUpdate,
      RunConfigurationUpdate runConfigurationUpdate,
      List<CloudWatchLoggingOptionUpdate>
          cloudWatchLoggingOptionUpdates}) async {}
}

class AddApplicationCloudWatchLoggingOptionResponse {}

class AddApplicationInputProcessingConfigurationResponse {}

class AddApplicationInputResponse {}

class AddApplicationOutputResponse {}

class AddApplicationReferenceDataSourceResponse {}

class ApplicationCodeConfiguration {}

class ApplicationCodeConfigurationDescription {}

class ApplicationCodeConfigurationUpdate {}

class ApplicationConfiguration {}

class ApplicationConfigurationDescription {}

class ApplicationConfigurationUpdate {}

class ApplicationDetail {}

class ApplicationRestoreConfiguration {}

class ApplicationSnapshotConfiguration {}

class ApplicationSnapshotConfigurationDescription {}

class ApplicationSnapshotConfigurationUpdate {}

class ApplicationSummary {}

class CsvMappingParameters {}

class CheckpointConfiguration {}

class CheckpointConfigurationDescription {}

class CheckpointConfigurationUpdate {}

class CloudWatchLoggingOption {}

class CloudWatchLoggingOptionDescription {}

class CloudWatchLoggingOptionUpdate {}

class CodeContent {}

class CodeContentDescription {}

class CodeContentUpdate {}

class CreateApplicationResponse {}

class CreateApplicationSnapshotResponse {}

class DeleteApplicationCloudWatchLoggingOptionResponse {}

class DeleteApplicationInputProcessingConfigurationResponse {}

class DeleteApplicationOutputResponse {}

class DeleteApplicationReferenceDataSourceResponse {}

class DeleteApplicationResponse {}

class DeleteApplicationSnapshotResponse {}

class DescribeApplicationResponse {}

class DescribeApplicationSnapshotResponse {}

class DestinationSchema {}

class DiscoverInputSchemaResponse {}

class EnvironmentProperties {}

class EnvironmentPropertyDescriptions {}

class EnvironmentPropertyUpdates {}

class FlinkApplicationConfiguration {}

class FlinkApplicationConfigurationDescription {}

class FlinkApplicationConfigurationUpdate {}

class Input {}

class InputDescription {}

class InputLambdaProcessor {}

class InputLambdaProcessorDescription {}

class InputLambdaProcessorUpdate {}

class InputParallelism {}

class InputParallelismUpdate {}

class InputProcessingConfiguration {}

class InputProcessingConfigurationDescription {}

class InputProcessingConfigurationUpdate {}

class InputSchemaUpdate {}

class InputStartingPositionConfiguration {}

class InputUpdate {}

class JsonMappingParameters {}

class KinesisFirehoseInput {}

class KinesisFirehoseInputDescription {}

class KinesisFirehoseInputUpdate {}

class KinesisFirehoseOutput {}

class KinesisFirehoseOutputDescription {}

class KinesisFirehoseOutputUpdate {}

class KinesisStreamsInput {}

class KinesisStreamsInputDescription {}

class KinesisStreamsInputUpdate {}

class KinesisStreamsOutput {}

class KinesisStreamsOutputDescription {}

class KinesisStreamsOutputUpdate {}

class LambdaOutput {}

class LambdaOutputDescription {}

class LambdaOutputUpdate {}

class ListApplicationSnapshotsResponse {}

class ListApplicationsResponse {}

class ListTagsForResourceResponse {}

class MappingParameters {}

class MonitoringConfiguration {}

class MonitoringConfigurationDescription {}

class MonitoringConfigurationUpdate {}

class Output {}

class OutputDescription {}

class OutputUpdate {}

class ParallelismConfiguration {}

class ParallelismConfigurationDescription {}

class ParallelismConfigurationUpdate {}

class PropertyGroup {}

class RecordColumn {}

class RecordFormat {}

class ReferenceDataSource {}

class ReferenceDataSourceDescription {}

class ReferenceDataSourceUpdate {}

class RunConfiguration {}

class RunConfigurationDescription {}

class RunConfigurationUpdate {}

class S3ApplicationCodeLocationDescription {}

class S3Configuration {}

class S3ContentLocation {}

class S3ContentLocationUpdate {}

class S3ReferenceDataSource {}

class S3ReferenceDataSourceDescription {}

class S3ReferenceDataSourceUpdate {}

class SnapshotDetails {}

class SourceSchema {}

class SqlApplicationConfiguration {}

class SqlApplicationConfigurationDescription {}

class SqlApplicationConfigurationUpdate {}

class SqlRunConfiguration {}

class StartApplicationResponse {}

class StopApplicationResponse {}

class Tag {}

class TagResourceResponse {}

class UntagResourceResponse {}

class UpdateApplicationResponse {}
