import 'package:meta/meta.dart';
import 'dart:typed_data';

/// Amazon Kinesis Data Analytics is a fully managed service that you can use to
/// process and analyze streaming data using SQL or Java. The service enables
/// you to quickly author and run SQL or Java code against streaming sources to
/// perform time series analytics, feed real-time dashboards, and create
/// real-time metrics.
class KinesisAnalyticsV2Api {
  final _client;
  KinesisAnalyticsV2Api(client)
      : _client = client.configured('Kinesis Analytics V2', serializer: 'json');

  /// Adds an Amazon CloudWatch log stream to monitor application configuration
  /// errors.
  ///
  /// [applicationName]: The Kinesis Data Analytics application name.
  ///
  /// [currentApplicationVersionId]: The version ID of the Kinesis Data
  /// Analytics application. You can retrieve the application version ID using
  /// DescribeApplication.
  ///
  /// [cloudWatchLoggingOption]: Provides the Amazon CloudWatch log stream
  /// Amazon Resource Name (ARN).
  Future<AddApplicationCloudWatchLoggingOptionResponse>
      addApplicationCloudWatchLoggingOption(
          {@required String applicationName,
          @required BigInt currentApplicationVersionId,
          @required CloudWatchLoggingOption cloudWatchLoggingOption}) async {
    var response_ =
        await _client.send('AddApplicationCloudWatchLoggingOption', {
      'ApplicationName': applicationName,
      'CurrentApplicationVersionId': currentApplicationVersionId,
      'CloudWatchLoggingOption': cloudWatchLoggingOption,
    });
    return AddApplicationCloudWatchLoggingOptionResponse.fromJson(response_);
  }

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
  ///
  /// [applicationName]: The name of your existing application to which you want
  /// to add the streaming source.
  ///
  /// [currentApplicationVersionId]: The current version of your application.
  /// You can use the DescribeApplication operation to find the current
  /// application version.
  ///
  /// [input]: The Input to add.
  Future<AddApplicationInputResponse> addApplicationInput(
      {@required String applicationName,
      @required BigInt currentApplicationVersionId,
      @required Input input}) async {
    var response_ = await _client.send('AddApplicationInput', {
      'ApplicationName': applicationName,
      'CurrentApplicationVersionId': currentApplicationVersionId,
      'Input': input,
    });
    return AddApplicationInputResponse.fromJson(response_);
  }

  /// Adds an InputProcessingConfiguration to an SQL-based Kinesis Data
  /// Analytics application. An input processor pre-processes records on the
  /// input stream before the application's SQL code executes. Currently, the
  /// only input processor available is
  /// [AWS Lambda](https://aws.amazon.com/documentation/lambda/).
  ///
  /// [applicationName]: The name of the application to which you want to add
  /// the input processing configuration.
  ///
  /// [currentApplicationVersionId]: The version of the application to which you
  /// want to add the input processing configuration. You can use the
  /// DescribeApplication operation to get the current application version. If
  /// the version specified is not the current version, the
  /// `ConcurrentModificationException` is returned.
  ///
  /// [inputId]: The ID of the input configuration to add the input processing
  /// configuration to. You can get a list of the input IDs for an application
  /// using the DescribeApplication operation.
  ///
  /// [inputProcessingConfiguration]: The InputProcessingConfiguration to add to
  /// the application.
  Future<AddApplicationInputProcessingConfigurationResponse>
      addApplicationInputProcessingConfiguration(
          {@required
              String applicationName,
          @required
              BigInt currentApplicationVersionId,
          @required
              String inputId,
          @required
              InputProcessingConfiguration
                  inputProcessingConfiguration}) async {
    var response_ =
        await _client.send('AddApplicationInputProcessingConfiguration', {
      'ApplicationName': applicationName,
      'CurrentApplicationVersionId': currentApplicationVersionId,
      'InputId': inputId,
      'InputProcessingConfiguration': inputProcessingConfiguration,
    });
    return AddApplicationInputProcessingConfigurationResponse.fromJson(
        response_);
  }

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
  ///
  /// [applicationName]: The name of the application to which you want to add
  /// the output configuration.
  ///
  /// [currentApplicationVersionId]: The version of the application to which you
  /// want to add the output configuration. You can use the DescribeApplication
  /// operation to get the current application version. If the version specified
  /// is not the current version, the `ConcurrentModificationException` is
  /// returned.
  ///
  /// [output]: An array of objects, each describing one output configuration.
  /// In the output configuration, you specify the name of an in-application
  /// stream, a destination (that is, a Kinesis data stream, a Kinesis Data
  /// Firehose delivery stream, or an AWS Lambda function), and record the
  /// formation to use when writing to the destination.
  Future<AddApplicationOutputResponse> addApplicationOutput(
      {@required String applicationName,
      @required BigInt currentApplicationVersionId,
      @required Output output}) async {
    var response_ = await _client.send('AddApplicationOutput', {
      'ApplicationName': applicationName,
      'CurrentApplicationVersionId': currentApplicationVersionId,
      'Output': output,
    });
    return AddApplicationOutputResponse.fromJson(response_);
  }

  /// Adds a reference data source to an existing SQL-based Amazon Kinesis Data
  /// Analytics application.
  ///
  /// Kinesis Data Analytics reads reference data (that is, an Amazon S3 object)
  /// and creates an in-application table within your application. In the
  /// request, you provide the source (S3 bucket name and object key name), name
  /// of the in-application table to create, and the necessary mapping
  /// information that describes how data in an Amazon S3 object maps to columns
  /// in the resulting in-application table.
  ///
  /// [applicationName]: The name of an existing application.
  ///
  /// [currentApplicationVersionId]: The version of the application for which
  /// you are adding the reference data source. You can use the
  /// DescribeApplication operation to get the current application version. If
  /// the version specified is not the current version, the
  /// `ConcurrentModificationException` is returned.
  ///
  /// [referenceDataSource]: The reference data source can be an object in your
  /// Amazon S3 bucket. Kinesis Data Analytics reads the object and copies the
  /// data into the in-application table that is created. You provide an S3
  /// bucket, object key name, and the resulting in-application table that is
  /// created.
  Future<AddApplicationReferenceDataSourceResponse>
      addApplicationReferenceDataSource(
          {@required String applicationName,
          @required BigInt currentApplicationVersionId,
          @required ReferenceDataSource referenceDataSource}) async {
    var response_ = await _client.send('AddApplicationReferenceDataSource', {
      'ApplicationName': applicationName,
      'CurrentApplicationVersionId': currentApplicationVersionId,
      'ReferenceDataSource': referenceDataSource,
    });
    return AddApplicationReferenceDataSourceResponse.fromJson(response_);
  }

  /// Creates an Amazon Kinesis Data Analytics application. For information
  /// about creating a Kinesis Data Analytics application, see
  /// [Creating an Application](https://docs.aws.amazon.com/kinesisanalytics/latest/java/getting-started.html).
  ///
  /// [applicationName]: The name of your application (for example,
  /// `sample-app`).
  ///
  /// [applicationDescription]: A summary description of the application.
  ///
  /// [runtimeEnvironment]: The runtime environment for the application
  /// (`SQL-1.0` or `FLINK-1_6`).
  ///
  /// [serviceExecutionRole]: The IAM role used by the application to access
  /// Kinesis data streams, Kinesis Data Firehose delivery streams, Amazon S3
  /// objects, and other external resources.
  ///
  /// [applicationConfiguration]: Use this parameter to configure the
  /// application.
  ///
  /// [cloudWatchLoggingOptions]: Use this parameter to configure an Amazon
  /// CloudWatch log stream to monitor application configuration errors.
  ///
  /// [tags]: A list of one or more tags to assign to the application. A tag is
  /// a key-value pair that identifies an application. Note that the maximum
  /// number of application tags includes system tags. The maximum number of
  /// user-defined application tags is 50. For more information, see
  /// [Using Cost Allocation Tags](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html)
  /// in the _AWS Billing and Cost Management Guide_.
  Future<CreateApplicationResponse> createApplication(
      {@required String applicationName,
      String applicationDescription,
      @required String runtimeEnvironment,
      @required String serviceExecutionRole,
      ApplicationConfiguration applicationConfiguration,
      List<CloudWatchLoggingOption> cloudWatchLoggingOptions,
      List<Tag> tags}) async {
    var response_ = await _client.send('CreateApplication', {
      'ApplicationName': applicationName,
      if (applicationDescription != null)
        'ApplicationDescription': applicationDescription,
      'RuntimeEnvironment': runtimeEnvironment,
      'ServiceExecutionRole': serviceExecutionRole,
      if (applicationConfiguration != null)
        'ApplicationConfiguration': applicationConfiguration,
      if (cloudWatchLoggingOptions != null)
        'CloudWatchLoggingOptions': cloudWatchLoggingOptions,
      if (tags != null) 'Tags': tags,
    });
    return CreateApplicationResponse.fromJson(response_);
  }

  /// Creates a snapshot of the application's state data.
  ///
  /// [applicationName]: The name of an existing application
  ///
  /// [snapshotName]: An identifier for the application snapshot.
  Future<CreateApplicationSnapshotResponse> createApplicationSnapshot(
      {@required String applicationName, @required String snapshotName}) async {
    var response_ = await _client.send('CreateApplicationSnapshot', {
      'ApplicationName': applicationName,
      'SnapshotName': snapshotName,
    });
    return CreateApplicationSnapshotResponse.fromJson(response_);
  }

  /// Deletes the specified application. Kinesis Data Analytics halts
  /// application execution and deletes the application.
  ///
  /// [applicationName]: The name of the application to delete.
  ///
  /// [createTimestamp]: Use the `DescribeApplication` operation to get this
  /// value.
  Future<DeleteApplicationResponse> deleteApplication(
      {@required String applicationName,
      @required DateTime createTimestamp}) async {
    var response_ = await _client.send('DeleteApplication', {
      'ApplicationName': applicationName,
      'CreateTimestamp': createTimestamp,
    });
    return DeleteApplicationResponse.fromJson(response_);
  }

  /// Deletes an Amazon CloudWatch log stream from an Amazon Kinesis Data
  /// Analytics application.
  ///
  /// [applicationName]: The application name.
  ///
  /// [currentApplicationVersionId]: The version ID of the application. You can
  /// retrieve the application version ID using DescribeApplication.
  ///
  /// [cloudWatchLoggingOptionId]: The `CloudWatchLoggingOptionId` of the Amazon
  /// CloudWatch logging option to delete. You can get the
  /// `CloudWatchLoggingOptionId` by using the DescribeApplication operation.
  Future<DeleteApplicationCloudWatchLoggingOptionResponse>
      deleteApplicationCloudWatchLoggingOption(
          {@required String applicationName,
          @required BigInt currentApplicationVersionId,
          @required String cloudWatchLoggingOptionId}) async {
    var response_ =
        await _client.send('DeleteApplicationCloudWatchLoggingOption', {
      'ApplicationName': applicationName,
      'CurrentApplicationVersionId': currentApplicationVersionId,
      'CloudWatchLoggingOptionId': cloudWatchLoggingOptionId,
    });
    return DeleteApplicationCloudWatchLoggingOptionResponse.fromJson(response_);
  }

  /// Deletes an InputProcessingConfiguration from an input.
  ///
  /// [applicationName]: The name of the application.
  ///
  /// [currentApplicationVersionId]: The application version. You can use the
  /// DescribeApplication operation to get the current application version. If
  /// the version specified is not the current version, the
  /// `ConcurrentModificationException` is returned.
  ///
  /// [inputId]: The ID of the input configuration from which to delete the
  /// input processing configuration. You can get a list of the input IDs for an
  /// application by using the DescribeApplication operation.
  Future<DeleteApplicationInputProcessingConfigurationResponse>
      deleteApplicationInputProcessingConfiguration(
          {@required String applicationName,
          @required BigInt currentApplicationVersionId,
          @required String inputId}) async {
    var response_ =
        await _client.send('DeleteApplicationInputProcessingConfiguration', {
      'ApplicationName': applicationName,
      'CurrentApplicationVersionId': currentApplicationVersionId,
      'InputId': inputId,
    });
    return DeleteApplicationInputProcessingConfigurationResponse.fromJson(
        response_);
  }

  /// Deletes the output destination configuration from your SQL-based Amazon
  /// Kinesis Data Analytics application's configuration. Kinesis Data Analytics
  /// will no longer write data from the corresponding in-application stream to
  /// the external output destination.
  ///
  /// [applicationName]: The application name.
  ///
  /// [currentApplicationVersionId]: The application version. You can use the
  /// DescribeApplication operation to get the current application version. If
  /// the version specified is not the current version, the
  /// `ConcurrentModificationException` is returned.
  ///
  /// [outputId]: The ID of the configuration to delete. Each output
  /// configuration that is added to the application (either when the
  /// application is created or later) using the AddApplicationOutput operation
  /// has a unique ID. You need to provide the ID to uniquely identify the
  /// output configuration that you want to delete from the application
  /// configuration. You can use the DescribeApplication operation to get the
  /// specific `OutputId`.
  Future<DeleteApplicationOutputResponse> deleteApplicationOutput(
      {@required String applicationName,
      @required BigInt currentApplicationVersionId,
      @required String outputId}) async {
    var response_ = await _client.send('DeleteApplicationOutput', {
      'ApplicationName': applicationName,
      'CurrentApplicationVersionId': currentApplicationVersionId,
      'OutputId': outputId,
    });
    return DeleteApplicationOutputResponse.fromJson(response_);
  }

  /// Deletes a reference data source configuration from the specified SQL-based
  /// Amazon Kinesis Data Analytics application's configuration.
  ///
  /// If the application is running, Kinesis Data Analytics immediately removes
  /// the in-application table that you created using the
  /// AddApplicationReferenceDataSource operation.
  ///
  /// [applicationName]: The name of an existing application.
  ///
  /// [currentApplicationVersionId]: The current application version. You can
  /// use the DescribeApplication operation to get the current application
  /// version. If the version specified is not the current version, the
  /// `ConcurrentModificationException` is returned.
  ///
  /// [referenceId]: The ID of the reference data source. When you add a
  /// reference data source to your application using the
  /// AddApplicationReferenceDataSource, Kinesis Data Analytics assigns an ID.
  /// You can use the DescribeApplication operation to get the reference ID.
  Future<DeleteApplicationReferenceDataSourceResponse>
      deleteApplicationReferenceDataSource(
          {@required String applicationName,
          @required BigInt currentApplicationVersionId,
          @required String referenceId}) async {
    var response_ = await _client.send('DeleteApplicationReferenceDataSource', {
      'ApplicationName': applicationName,
      'CurrentApplicationVersionId': currentApplicationVersionId,
      'ReferenceId': referenceId,
    });
    return DeleteApplicationReferenceDataSourceResponse.fromJson(response_);
  }

  /// Deletes a snapshot of application state.
  ///
  /// [applicationName]: The name of an existing application.
  ///
  /// [snapshotName]: The identifier for the snapshot delete.
  ///
  /// [snapshotCreationTimestamp]: The creation timestamp of the application
  /// snapshot to delete. You can retrieve this value using or .
  Future<DeleteApplicationSnapshotResponse> deleteApplicationSnapshot(
      {@required String applicationName,
      @required String snapshotName,
      @required DateTime snapshotCreationTimestamp}) async {
    var response_ = await _client.send('DeleteApplicationSnapshot', {
      'ApplicationName': applicationName,
      'SnapshotName': snapshotName,
      'SnapshotCreationTimestamp': snapshotCreationTimestamp,
    });
    return DeleteApplicationSnapshotResponse.fromJson(response_);
  }

  /// Returns information about a specific Amazon Kinesis Data Analytics
  /// application.
  ///
  /// If you want to retrieve a list of all applications in your account, use
  /// the ListApplications operation.
  ///
  /// [applicationName]: The name of the application.
  ///
  /// [includeAdditionalDetails]: Displays verbose information about a Kinesis
  /// Data Analytics application, including the application's job plan.
  Future<DescribeApplicationResponse> describeApplication(
      String applicationName,
      {bool includeAdditionalDetails}) async {
    var response_ = await _client.send('DescribeApplication', {
      'ApplicationName': applicationName,
      if (includeAdditionalDetails != null)
        'IncludeAdditionalDetails': includeAdditionalDetails,
    });
    return DescribeApplicationResponse.fromJson(response_);
  }

  /// Returns information about a snapshot of application state data.
  ///
  /// [applicationName]: The name of an existing application.
  ///
  /// [snapshotName]: The identifier of an application snapshot. You can
  /// retrieve this value using .
  Future<DescribeApplicationSnapshotResponse> describeApplicationSnapshot(
      {@required String applicationName, @required String snapshotName}) async {
    var response_ = await _client.send('DescribeApplicationSnapshot', {
      'ApplicationName': applicationName,
      'SnapshotName': snapshotName,
    });
    return DescribeApplicationSnapshotResponse.fromJson(response_);
  }

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
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the streaming source.
  ///
  /// [serviceExecutionRole]: The ARN of the role that is used to access the
  /// streaming source.
  ///
  /// [inputStartingPositionConfiguration]: The point at which you want Kinesis
  /// Data Analytics to start reading records from the specified streaming
  /// source discovery purposes.
  ///
  /// [s3Configuration]: Specify this parameter to discover a schema from data
  /// in an Amazon S3 object.
  ///
  /// [inputProcessingConfiguration]: The InputProcessingConfiguration to use to
  /// preprocess the records before discovering the schema of the records.
  Future<DiscoverInputSchemaResponse> discoverInputSchema(
      String serviceExecutionRole,
      {String resourceArn,
      InputStartingPositionConfiguration inputStartingPositionConfiguration,
      S3Configuration s3Configuration,
      InputProcessingConfiguration inputProcessingConfiguration}) async {
    var response_ = await _client.send('DiscoverInputSchema', {
      if (resourceArn != null) 'ResourceARN': resourceArn,
      'ServiceExecutionRole': serviceExecutionRole,
      if (inputStartingPositionConfiguration != null)
        'InputStartingPositionConfiguration':
            inputStartingPositionConfiguration,
      if (s3Configuration != null) 'S3Configuration': s3Configuration,
      if (inputProcessingConfiguration != null)
        'InputProcessingConfiguration': inputProcessingConfiguration,
    });
    return DiscoverInputSchemaResponse.fromJson(response_);
  }

  /// Lists information about the current application snapshots.
  ///
  /// [applicationName]: The name of an existing application.
  ///
  /// [limit]: The maximum number of application snapshots to list.
  ///
  /// [nextToken]: Use this parameter if you receive a `NextToken` response in a
  /// previous request that indicates that there is more output available. Set
  /// it to the value of the previous call's `NextToken` response to indicate
  /// where the output should continue from.
  Future<ListApplicationSnapshotsResponse> listApplicationSnapshots(
      String applicationName,
      {int limit,
      String nextToken}) async {
    var response_ = await _client.send('ListApplicationSnapshots', {
      'ApplicationName': applicationName,
      if (limit != null) 'Limit': limit,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListApplicationSnapshotsResponse.fromJson(response_);
  }

  /// Returns a list of Amazon Kinesis Data Analytics applications in your
  /// account. For each application, the response includes the application name,
  /// Amazon Resource Name (ARN), and status.
  ///
  /// If you want detailed information about a specific application, use
  /// DescribeApplication.
  ///
  /// [limit]: The maximum number of applications to list.
  ///
  /// [nextToken]: If a previous command returned a pagination token, pass it
  /// into this value to retrieve the next set of results. For more information
  /// about pagination, see
  /// [Using the AWS Command Line Interface's Pagination Options](https://docs.aws.amazon.com/cli/latest/userguide/pagination.html).
  Future<ListApplicationsResponse> listApplications(
      {int limit, String nextToken}) async {
    var response_ = await _client.send('ListApplications', {
      if (limit != null) 'Limit': limit,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListApplicationsResponse.fromJson(response_);
  }

  /// Retrieves the list of key-value tags assigned to the application.
  ///
  /// [resourceArn]: The ARN of the application for which to retrieve tags.
  Future<ListTagsForResourceResponse> listTagsForResource(
      String resourceArn) async {
    var response_ = await _client.send('ListTagsForResource', {
      'ResourceARN': resourceArn,
    });
    return ListTagsForResourceResponse.fromJson(response_);
  }

  /// Starts the specified Amazon Kinesis Data Analytics application. After
  /// creating an application, you must exclusively call this operation to start
  /// your application.
  ///
  /// [applicationName]: The name of the application.
  ///
  /// [runConfiguration]: Identifies the run configuration (start parameters) of
  /// a Kinesis Data Analytics application.
  Future<StartApplicationResponse> startApplication(
      {@required String applicationName,
      @required RunConfiguration runConfiguration}) async {
    var response_ = await _client.send('StartApplication', {
      'ApplicationName': applicationName,
      'RunConfiguration': runConfiguration,
    });
    return StartApplicationResponse.fromJson(response_);
  }

  /// Stops the application from processing data. You can stop an application
  /// only if it is in the running state. You can use the DescribeApplication
  /// operation to find the application state.
  ///
  /// [applicationName]: The name of the running application to stop.
  Future<StopApplicationResponse> stopApplication(
      String applicationName) async {
    var response_ = await _client.send('StopApplication', {
      'ApplicationName': applicationName,
    });
    return StopApplicationResponse.fromJson(response_);
  }

  /// Adds one or more key-value tags to a Kinesis Analytics application. Note
  /// that the maximum number of application tags includes system tags. The
  /// maximum number of user-defined application tags is 50.
  ///
  /// [resourceArn]: The ARN of the application to assign the tags.
  ///
  /// [tags]: The key-value tags to assign to the application.
  Future<TagResourceResponse> tagResource(
      {@required String resourceArn, @required List<Tag> tags}) async {
    var response_ = await _client.send('TagResource', {
      'ResourceARN': resourceArn,
      'Tags': tags,
    });
    return TagResourceResponse.fromJson(response_);
  }

  /// Removes one or more tags from a Kinesis Analytics application.
  ///
  /// [resourceArn]: The ARN of the Kinesis Analytics application from which to
  /// remove the tags.
  ///
  /// [tagKeys]: A list of keys of tags to remove from the specified
  /// application.
  Future<UntagResourceResponse> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {
    var response_ = await _client.send('UntagResource', {
      'ResourceARN': resourceArn,
      'TagKeys': tagKeys,
    });
    return UntagResourceResponse.fromJson(response_);
  }

  /// Updates an existing Amazon Kinesis Data Analytics application. Using this
  /// operation, you can update application code, input configuration, and
  /// output configuration.
  ///
  /// Kinesis Data Analytics updates the `ApplicationVersionId` each time you
  /// update your application.
  ///
  /// [applicationName]: The name of the application to update.
  ///
  /// [currentApplicationVersionId]: The current application version ID. You can
  /// retrieve the application version ID using DescribeApplication.
  ///
  /// [applicationConfigurationUpdate]: Describes application configuration
  /// updates.
  ///
  /// [serviceExecutionRoleUpdate]: Describes updates to the service execution
  /// role.
  ///
  /// [runConfigurationUpdate]: Describes updates to the application's starting
  /// parameters.
  ///
  /// [cloudWatchLoggingOptionUpdates]: Describes application Amazon CloudWatch
  /// logging option updates. You can only update existing CloudWatch logging
  /// options with this action. To add a new CloudWatch logging option, use
  /// AddApplicationCloudWatchLoggingOption.
  Future<UpdateApplicationResponse> updateApplication(
      {@required String applicationName,
      @required BigInt currentApplicationVersionId,
      ApplicationConfigurationUpdate applicationConfigurationUpdate,
      String serviceExecutionRoleUpdate,
      RunConfigurationUpdate runConfigurationUpdate,
      List<CloudWatchLoggingOptionUpdate>
          cloudWatchLoggingOptionUpdates}) async {
    var response_ = await _client.send('UpdateApplication', {
      'ApplicationName': applicationName,
      'CurrentApplicationVersionId': currentApplicationVersionId,
      if (applicationConfigurationUpdate != null)
        'ApplicationConfigurationUpdate': applicationConfigurationUpdate,
      if (serviceExecutionRoleUpdate != null)
        'ServiceExecutionRoleUpdate': serviceExecutionRoleUpdate,
      if (runConfigurationUpdate != null)
        'RunConfigurationUpdate': runConfigurationUpdate,
      if (cloudWatchLoggingOptionUpdates != null)
        'CloudWatchLoggingOptionUpdates': cloudWatchLoggingOptionUpdates,
    });
    return UpdateApplicationResponse.fromJson(response_);
  }
}

class AddApplicationCloudWatchLoggingOptionResponse {
  /// The application's ARN.
  final String applicationArn;

  /// The new version ID of the Kinesis Data Analytics application. Kinesis Data
  /// Analytics updates the `ApplicationVersionId` each time you change the
  /// CloudWatch logging options.
  final BigInt applicationVersionId;

  /// The descriptions of the current CloudWatch logging options for the Kinesis
  /// Data Analytics application.
  final List<CloudWatchLoggingOptionDescription>
      cloudWatchLoggingOptionDescriptions;

  AddApplicationCloudWatchLoggingOptionResponse({
    this.applicationArn,
    this.applicationVersionId,
    this.cloudWatchLoggingOptionDescriptions,
  });
  static AddApplicationCloudWatchLoggingOptionResponse fromJson(
          Map<String, dynamic> json) =>
      AddApplicationCloudWatchLoggingOptionResponse(
        applicationArn: json.containsKey('ApplicationARN')
            ? json['ApplicationARN'] as String
            : null,
        applicationVersionId: json.containsKey('ApplicationVersionId')
            ? BigInt.from(json['ApplicationVersionId'])
            : null,
        cloudWatchLoggingOptionDescriptions:
            json.containsKey('CloudWatchLoggingOptionDescriptions')
                ? (json['CloudWatchLoggingOptionDescriptions'] as List)
                    .map((e) => CloudWatchLoggingOptionDescription.fromJson(e))
                    .toList()
                : null,
      );
}

class AddApplicationInputProcessingConfigurationResponse {
  /// The Amazon Resource Name (ARN) of the application.
  final String applicationArn;

  /// Provides the current application version.
  final BigInt applicationVersionId;

  /// The input ID that is associated with the application input. This is the ID
  /// that Amazon Kinesis Data Analytics assigns to each input configuration
  /// that you add to your application.
  final String inputId;

  /// The description of the preprocessor that executes on records in this input
  /// before the application's code is run.
  final InputProcessingConfigurationDescription
      inputProcessingConfigurationDescription;

  AddApplicationInputProcessingConfigurationResponse({
    this.applicationArn,
    this.applicationVersionId,
    this.inputId,
    this.inputProcessingConfigurationDescription,
  });
  static AddApplicationInputProcessingConfigurationResponse fromJson(
          Map<String, dynamic> json) =>
      AddApplicationInputProcessingConfigurationResponse(
        applicationArn: json.containsKey('ApplicationARN')
            ? json['ApplicationARN'] as String
            : null,
        applicationVersionId: json.containsKey('ApplicationVersionId')
            ? BigInt.from(json['ApplicationVersionId'])
            : null,
        inputId: json.containsKey('InputId') ? json['InputId'] as String : null,
        inputProcessingConfigurationDescription:
            json.containsKey('InputProcessingConfigurationDescription')
                ? InputProcessingConfigurationDescription.fromJson(
                    json['InputProcessingConfigurationDescription'])
                : null,
      );
}

class AddApplicationInputResponse {
  /// The Amazon Resource Name (ARN) of the application.
  final String applicationArn;

  /// Provides the current application version.
  final BigInt applicationVersionId;

  /// Describes the application input configuration.
  final List<InputDescription> inputDescriptions;

  AddApplicationInputResponse({
    this.applicationArn,
    this.applicationVersionId,
    this.inputDescriptions,
  });
  static AddApplicationInputResponse fromJson(Map<String, dynamic> json) =>
      AddApplicationInputResponse(
        applicationArn: json.containsKey('ApplicationARN')
            ? json['ApplicationARN'] as String
            : null,
        applicationVersionId: json.containsKey('ApplicationVersionId')
            ? BigInt.from(json['ApplicationVersionId'])
            : null,
        inputDescriptions: json.containsKey('InputDescriptions')
            ? (json['InputDescriptions'] as List)
                .map((e) => InputDescription.fromJson(e))
                .toList()
            : null,
      );
}

class AddApplicationOutputResponse {
  /// The application Amazon Resource Name (ARN).
  final String applicationArn;

  /// The updated application version ID. Kinesis Data Analytics increments this
  /// ID when the application is updated.
  final BigInt applicationVersionId;

  /// Describes the application output configuration. For more information, see
  /// [Configuring Application Output](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-output.html).
  final List<OutputDescription> outputDescriptions;

  AddApplicationOutputResponse({
    this.applicationArn,
    this.applicationVersionId,
    this.outputDescriptions,
  });
  static AddApplicationOutputResponse fromJson(Map<String, dynamic> json) =>
      AddApplicationOutputResponse(
        applicationArn: json.containsKey('ApplicationARN')
            ? json['ApplicationARN'] as String
            : null,
        applicationVersionId: json.containsKey('ApplicationVersionId')
            ? BigInt.from(json['ApplicationVersionId'])
            : null,
        outputDescriptions: json.containsKey('OutputDescriptions')
            ? (json['OutputDescriptions'] as List)
                .map((e) => OutputDescription.fromJson(e))
                .toList()
            : null,
      );
}

class AddApplicationReferenceDataSourceResponse {
  /// The application Amazon Resource Name (ARN).
  final String applicationArn;

  /// The updated application version ID. Amazon Kinesis Data Analytics
  /// increments this ID when the application is updated.
  final BigInt applicationVersionId;

  /// Describes reference data sources configured for the application.
  final List<ReferenceDataSourceDescription> referenceDataSourceDescriptions;

  AddApplicationReferenceDataSourceResponse({
    this.applicationArn,
    this.applicationVersionId,
    this.referenceDataSourceDescriptions,
  });
  static AddApplicationReferenceDataSourceResponse fromJson(
          Map<String, dynamic> json) =>
      AddApplicationReferenceDataSourceResponse(
        applicationArn: json.containsKey('ApplicationARN')
            ? json['ApplicationARN'] as String
            : null,
        applicationVersionId: json.containsKey('ApplicationVersionId')
            ? BigInt.from(json['ApplicationVersionId'])
            : null,
        referenceDataSourceDescriptions:
            json.containsKey('ReferenceDataSourceDescriptions')
                ? (json['ReferenceDataSourceDescriptions'] as List)
                    .map((e) => ReferenceDataSourceDescription.fromJson(e))
                    .toList()
                : null,
      );
}

/// Describes code configuration for a Java-based Kinesis Data Analytics
/// application.
class ApplicationCodeConfiguration {
  /// The location and type of the application code.
  final CodeContent codeContent;

  /// Specifies whether the code content is in text or zip format.
  final String codeContentType;

  ApplicationCodeConfiguration({
    this.codeContent,
    @required this.codeContentType,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes code configuration for a Java-based Kinesis Data Analytics
/// application.
class ApplicationCodeConfigurationDescription {
  /// Specifies whether the code content is in text or zip format.
  final String codeContentType;

  /// Describes details about the location and format of the application code.
  final CodeContentDescription codeContentDescription;

  ApplicationCodeConfigurationDescription({
    @required this.codeContentType,
    this.codeContentDescription,
  });
  static ApplicationCodeConfigurationDescription fromJson(
          Map<String, dynamic> json) =>
      ApplicationCodeConfigurationDescription(
        codeContentType: json['CodeContentType'] as String,
        codeContentDescription: json.containsKey('CodeContentDescription')
            ? CodeContentDescription.fromJson(json['CodeContentDescription'])
            : null,
      );
}

/// Describes updates to a Java-based Amazon Kinesis Data Analytics application.
class ApplicationCodeConfigurationUpdate {
  /// Describes updates to the code content type.
  final String codeContentTypeUpdate;

  /// Describes updates to the code content of an application.
  final CodeContentUpdate codeContentUpdate;

  ApplicationCodeConfigurationUpdate({
    this.codeContentTypeUpdate,
    this.codeContentUpdate,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies the creation parameters for an Amazon Kinesis Data Analytics
/// application.
class ApplicationConfiguration {
  /// The creation and update parameters for an SQL-based Kinesis Data Analytics
  /// application.
  final SqlApplicationConfiguration sqlApplicationConfiguration;

  /// The creation and update parameters for a Java-based Kinesis Data Analytics
  /// application.
  final FlinkApplicationConfiguration flinkApplicationConfiguration;

  /// Describes execution properties for a Java-based Kinesis Data Analytics
  /// application.
  final EnvironmentProperties environmentProperties;

  /// The code location and type parameters for a Java-based Kinesis Data
  /// Analytics application.
  final ApplicationCodeConfiguration applicationCodeConfiguration;

  /// Describes whether snapshots are enabled for a Java-based Kinesis Data
  /// Analytics application.
  final ApplicationSnapshotConfiguration applicationSnapshotConfiguration;

  ApplicationConfiguration({
    this.sqlApplicationConfiguration,
    this.flinkApplicationConfiguration,
    this.environmentProperties,
    @required this.applicationCodeConfiguration,
    this.applicationSnapshotConfiguration,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes details about the application code and starting parameters for an
/// Amazon Kinesis Data Analytics application.
class ApplicationConfigurationDescription {
  /// The details about inputs, outputs, and reference data sources for an
  /// SQL-based Kinesis Data Analytics application.
  final SqlApplicationConfigurationDescription
      sqlApplicationConfigurationDescription;

  /// The details about the application code for a Java-based Kinesis Data
  /// Analytics application.
  final ApplicationCodeConfigurationDescription
      applicationCodeConfigurationDescription;

  /// The details about the starting properties for a Kinesis Data Analytics
  /// application.
  final RunConfigurationDescription runConfigurationDescription;

  /// The details about a Java-based Kinesis Data Analytics application.
  final FlinkApplicationConfigurationDescription
      flinkApplicationConfigurationDescription;

  /// Describes execution properties for a Java-based Kinesis Data Analytics
  /// application.
  final EnvironmentPropertyDescriptions environmentPropertyDescriptions;

  /// Describes whether snapshots are enabled for a Java-based Kinesis Data
  /// Analytics application.
  final ApplicationSnapshotConfigurationDescription
      applicationSnapshotConfigurationDescription;

  ApplicationConfigurationDescription({
    this.sqlApplicationConfigurationDescription,
    this.applicationCodeConfigurationDescription,
    this.runConfigurationDescription,
    this.flinkApplicationConfigurationDescription,
    this.environmentPropertyDescriptions,
    this.applicationSnapshotConfigurationDescription,
  });
  static ApplicationConfigurationDescription fromJson(
          Map<String, dynamic> json) =>
      ApplicationConfigurationDescription(
        sqlApplicationConfigurationDescription:
            json.containsKey('SqlApplicationConfigurationDescription')
                ? SqlApplicationConfigurationDescription.fromJson(
                    json['SqlApplicationConfigurationDescription'])
                : null,
        applicationCodeConfigurationDescription:
            json.containsKey('ApplicationCodeConfigurationDescription')
                ? ApplicationCodeConfigurationDescription.fromJson(
                    json['ApplicationCodeConfigurationDescription'])
                : null,
        runConfigurationDescription:
            json.containsKey('RunConfigurationDescription')
                ? RunConfigurationDescription.fromJson(
                    json['RunConfigurationDescription'])
                : null,
        flinkApplicationConfigurationDescription:
            json.containsKey('FlinkApplicationConfigurationDescription')
                ? FlinkApplicationConfigurationDescription.fromJson(
                    json['FlinkApplicationConfigurationDescription'])
                : null,
        environmentPropertyDescriptions:
            json.containsKey('EnvironmentPropertyDescriptions')
                ? EnvironmentPropertyDescriptions.fromJson(
                    json['EnvironmentPropertyDescriptions'])
                : null,
        applicationSnapshotConfigurationDescription:
            json.containsKey('ApplicationSnapshotConfigurationDescription')
                ? ApplicationSnapshotConfigurationDescription.fromJson(
                    json['ApplicationSnapshotConfigurationDescription'])
                : null,
      );
}

/// Describes updates to an application's configuration.
class ApplicationConfigurationUpdate {
  /// Describes updates to an SQL-based Kinesis Data Analytics application's
  /// configuration.
  final SqlApplicationConfigurationUpdate sqlApplicationConfigurationUpdate;

  /// Describes updates to a Java-based Kinesis Data Analytics application's
  /// code configuration.
  final ApplicationCodeConfigurationUpdate applicationCodeConfigurationUpdate;

  /// Describes updates to a Java-based Kinesis Data Analytics application's
  /// configuration.
  final FlinkApplicationConfigurationUpdate flinkApplicationConfigurationUpdate;

  /// Describes updates to the environment properties for a Java-based Kinesis
  /// Data Analytics application.
  final EnvironmentPropertyUpdates environmentPropertyUpdates;

  /// Describes whether snapshots are enabled for a Java-based Kinesis Data
  /// Analytics application.
  final ApplicationSnapshotConfigurationUpdate
      applicationSnapshotConfigurationUpdate;

  ApplicationConfigurationUpdate({
    this.sqlApplicationConfigurationUpdate,
    this.applicationCodeConfigurationUpdate,
    this.flinkApplicationConfigurationUpdate,
    this.environmentPropertyUpdates,
    this.applicationSnapshotConfigurationUpdate,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes the application, including the application Amazon Resource Name
/// (ARN), status, latest version, and input and output configurations.
class ApplicationDetail {
  /// The ARN of the application.
  final String applicationArn;

  /// The description of the application.
  final String applicationDescription;

  /// The name of the application.
  final String applicationName;

  /// The runtime environment for the application (`SQL-1.0` or `FLINK-1_6`).
  final String runtimeEnvironment;

  /// Specifies the IAM role that the application uses to access external
  /// resources.
  final String serviceExecutionRole;

  /// The status of the application.
  final String applicationStatus;

  /// Provides the current application version. Kinesis Data Analytics updates
  /// the `ApplicationVersionId` each time you update the application.
  final BigInt applicationVersionId;

  /// The current timestamp when the application was created.
  final DateTime createTimestamp;

  /// The current timestamp when the application was last updated.
  final DateTime lastUpdateTimestamp;

  /// Provides details about the application's SQL or Java code and starting
  /// parameters.
  final ApplicationConfigurationDescription applicationConfigurationDescription;

  /// Describes the application Amazon CloudWatch logging options.
  final List<CloudWatchLoggingOptionDescription>
      cloudWatchLoggingOptionDescriptions;

  ApplicationDetail({
    @required this.applicationArn,
    this.applicationDescription,
    @required this.applicationName,
    @required this.runtimeEnvironment,
    this.serviceExecutionRole,
    @required this.applicationStatus,
    @required this.applicationVersionId,
    this.createTimestamp,
    this.lastUpdateTimestamp,
    this.applicationConfigurationDescription,
    this.cloudWatchLoggingOptionDescriptions,
  });
  static ApplicationDetail fromJson(Map<String, dynamic> json) =>
      ApplicationDetail(
        applicationArn: json['ApplicationARN'] as String,
        applicationDescription: json.containsKey('ApplicationDescription')
            ? json['ApplicationDescription'] as String
            : null,
        applicationName: json['ApplicationName'] as String,
        runtimeEnvironment: json['RuntimeEnvironment'] as String,
        serviceExecutionRole: json.containsKey('ServiceExecutionRole')
            ? json['ServiceExecutionRole'] as String
            : null,
        applicationStatus: json['ApplicationStatus'] as String,
        applicationVersionId: BigInt.from(json['ApplicationVersionId']),
        createTimestamp: json.containsKey('CreateTimestamp')
            ? DateTime.parse(json['CreateTimestamp'])
            : null,
        lastUpdateTimestamp: json.containsKey('LastUpdateTimestamp')
            ? DateTime.parse(json['LastUpdateTimestamp'])
            : null,
        applicationConfigurationDescription:
            json.containsKey('ApplicationConfigurationDescription')
                ? ApplicationConfigurationDescription.fromJson(
                    json['ApplicationConfigurationDescription'])
                : null,
        cloudWatchLoggingOptionDescriptions:
            json.containsKey('CloudWatchLoggingOptionDescriptions')
                ? (json['CloudWatchLoggingOptionDescriptions'] as List)
                    .map((e) => CloudWatchLoggingOptionDescription.fromJson(e))
                    .toList()
                : null,
      );
}

/// Specifies the method and snapshot to use when restarting an application
/// using previously saved application state.
class ApplicationRestoreConfiguration {
  /// Specifies how the application should be restored.
  final String applicationRestoreType;

  /// The identifier of an existing snapshot of application state to use to
  /// restart an application. The application uses this value if
  /// `RESTORE_FROM_CUSTOM_SNAPSHOT` is specified for the
  /// `ApplicationRestoreType`.
  final String snapshotName;

  ApplicationRestoreConfiguration({
    @required this.applicationRestoreType,
    this.snapshotName,
  });
  static ApplicationRestoreConfiguration fromJson(Map<String, dynamic> json) =>
      ApplicationRestoreConfiguration(
        applicationRestoreType: json['ApplicationRestoreType'] as String,
        snapshotName: json.containsKey('SnapshotName')
            ? json['SnapshotName'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes whether snapshots are enabled for a Java-based Kinesis Data
/// Analytics application.
class ApplicationSnapshotConfiguration {
  /// Describes whether snapshots are enabled for a Java-based Kinesis Data
  /// Analytics application.
  final bool snapshotsEnabled;

  ApplicationSnapshotConfiguration({
    @required this.snapshotsEnabled,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes whether snapshots are enabled for a Java-based Kinesis Data
/// Analytics application.
class ApplicationSnapshotConfigurationDescription {
  /// Describes whether snapshots are enabled for a Java-based Kinesis Data
  /// Analytics application.
  final bool snapshotsEnabled;

  ApplicationSnapshotConfigurationDescription({
    @required this.snapshotsEnabled,
  });
  static ApplicationSnapshotConfigurationDescription fromJson(
          Map<String, dynamic> json) =>
      ApplicationSnapshotConfigurationDescription(
        snapshotsEnabled: json['SnapshotsEnabled'] as bool,
      );
}

/// Describes updates to whether snapshots are enabled for a Java-based Kinesis
/// Data Analytics application.
class ApplicationSnapshotConfigurationUpdate {
  /// Describes updates to whether snapshots are enabled for a Java-based
  /// Kinesis Data Analytics application.
  final bool snapshotsEnabledUpdate;

  ApplicationSnapshotConfigurationUpdate({
    @required this.snapshotsEnabledUpdate,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides application summary information, including the application Amazon
/// Resource Name (ARN), name, and status.
class ApplicationSummary {
  /// The name of the application.
  final String applicationName;

  /// The ARN of the application.
  final String applicationArn;

  /// The status of the application.
  final String applicationStatus;

  /// Provides the current application version.
  final BigInt applicationVersionId;

  /// The runtime environment for the application (`SQL-1.0` or `FLINK-1_6`).
  final String runtimeEnvironment;

  ApplicationSummary({
    @required this.applicationName,
    @required this.applicationArn,
    @required this.applicationStatus,
    @required this.applicationVersionId,
    @required this.runtimeEnvironment,
  });
  static ApplicationSummary fromJson(Map<String, dynamic> json) =>
      ApplicationSummary(
        applicationName: json['ApplicationName'] as String,
        applicationArn: json['ApplicationARN'] as String,
        applicationStatus: json['ApplicationStatus'] as String,
        applicationVersionId: BigInt.from(json['ApplicationVersionId']),
        runtimeEnvironment: json['RuntimeEnvironment'] as String,
      );
}

/// For an SQL-based application, provides additional mapping information when
/// the record format uses delimiters, such as CSV. For example, the following
/// sample records use CSV format, where the records use the _'n'_ as the row
/// delimiter and a comma (",") as the column delimiter:
///
///  `"name1", "address1"`
///
///  `"name2", "address2"`
class CsvMappingParameters {
  /// The row delimiter. For example, in a CSV format, _'n'_ is the typical row
  /// delimiter.
  final String recordRowDelimiter;

  /// The column delimiter. For example, in a CSV format, a comma (",") is the
  /// typical column delimiter.
  final String recordColumnDelimiter;

  CsvMappingParameters({
    @required this.recordRowDelimiter,
    @required this.recordColumnDelimiter,
  });
  static CsvMappingParameters fromJson(Map<String, dynamic> json) =>
      CsvMappingParameters(
        recordRowDelimiter: json['RecordRowDelimiter'] as String,
        recordColumnDelimiter: json['RecordColumnDelimiter'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes an application's checkpointing configuration. Checkpointing is the
/// process of persisting application state for fault tolerance. For more
/// information, see
/// [Checkpoints for Fault Tolerance](https://ci.apache.org/projects/flink/flink-docs-release-1.6/concepts/programming-model.html#checkpoints-for-fault-tolerance)
/// in the
/// [Apache Flink Documentation](https://ci.apache.org/projects/flink/flink-docs-release-1.6/).
class CheckpointConfiguration {
  /// Describes whether the application uses Amazon Kinesis Data Analytics'
  /// default checkpointing behavior.
  final String configurationType;

  /// Describes whether checkpointing is enabled for a Java-based Kinesis Data
  /// Analytics application.
  final bool checkpointingEnabled;

  /// Describes the interval in milliseconds between checkpoint operations.
  final BigInt checkpointInterval;

  /// Describes the minimum time in milliseconds after a checkpoint operation
  /// completes that a new checkpoint operation can start. If a checkpoint
  /// operation takes longer than the `CheckpointInterval`, the application
  /// otherwise performs continual checkpoint operations. For more information,
  /// see
  /// [Tuning Checkpointing](https://ci.apache.org/projects/flink/flink-docs-stable/ops/state/large_state_tuning.html#tuning-checkpointing)
  /// in the
  /// [Apache Flink Documentation](https://ci.apache.org/projects/flink/flink-docs-release-1.6/).
  final BigInt minPauseBetweenCheckpoints;

  CheckpointConfiguration({
    @required this.configurationType,
    this.checkpointingEnabled,
    this.checkpointInterval,
    this.minPauseBetweenCheckpoints,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes checkpointing parameters for a Java-based Amazon Kinesis Data
/// Analytics application.
class CheckpointConfigurationDescription {
  /// Describes whether the application uses the default checkpointing behavior
  /// in Kinesis Data Analytics.
  final String configurationType;

  /// Describes whether checkpointing is enabled for a Java-based Kinesis Data
  /// Analytics application.
  final bool checkpointingEnabled;

  /// Describes the interval in milliseconds between checkpoint operations.
  final BigInt checkpointInterval;

  /// Describes the minimum time in milliseconds after a checkpoint operation
  /// completes that a new checkpoint operation can start.
  final BigInt minPauseBetweenCheckpoints;

  CheckpointConfigurationDescription({
    this.configurationType,
    this.checkpointingEnabled,
    this.checkpointInterval,
    this.minPauseBetweenCheckpoints,
  });
  static CheckpointConfigurationDescription fromJson(
          Map<String, dynamic> json) =>
      CheckpointConfigurationDescription(
        configurationType: json.containsKey('ConfigurationType')
            ? json['ConfigurationType'] as String
            : null,
        checkpointingEnabled: json.containsKey('CheckpointingEnabled')
            ? json['CheckpointingEnabled'] as bool
            : null,
        checkpointInterval: json.containsKey('CheckpointInterval')
            ? BigInt.from(json['CheckpointInterval'])
            : null,
        minPauseBetweenCheckpoints:
            json.containsKey('MinPauseBetweenCheckpoints')
                ? BigInt.from(json['MinPauseBetweenCheckpoints'])
                : null,
      );
}

/// Describes updates to the checkpointing parameters for a Java-based Amazon
/// Kinesis Data Analytics application.
class CheckpointConfigurationUpdate {
  /// Describes updates to whether the application uses the default
  /// checkpointing behavior of Kinesis Data Analytics.
  final String configurationTypeUpdate;

  /// Describes updates to whether checkpointing is enabled for an application.
  final bool checkpointingEnabledUpdate;

  /// Describes updates to the interval in milliseconds between checkpoint
  /// operations.
  final BigInt checkpointIntervalUpdate;

  /// Describes updates to the minimum time in milliseconds after a checkpoint
  /// operation completes that a new checkpoint operation can start.
  final BigInt minPauseBetweenCheckpointsUpdate;

  CheckpointConfigurationUpdate({
    this.configurationTypeUpdate,
    this.checkpointingEnabledUpdate,
    this.checkpointIntervalUpdate,
    this.minPauseBetweenCheckpointsUpdate,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides a description of Amazon CloudWatch logging options, including the
/// log stream Amazon Resource Name (ARN).
class CloudWatchLoggingOption {
  /// The ARN of the CloudWatch log to receive application messages.
  final String logStreamArn;

  CloudWatchLoggingOption({
    @required this.logStreamArn,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes the Amazon CloudWatch logging option.
class CloudWatchLoggingOptionDescription {
  /// The ID of the CloudWatch logging option description.
  final String cloudWatchLoggingOptionId;

  /// The Amazon Resource Name (ARN) of the CloudWatch log to receive
  /// application messages.
  final String logStreamArn;

  /// The IAM ARN of the role to use to send application messages.
  ///
  ///
  ///
  /// Provided for backward compatibility. Applications created with the current
  /// API version have an application-level service execution role rather than a
  /// resource-level role.
  final String roleArn;

  CloudWatchLoggingOptionDescription({
    this.cloudWatchLoggingOptionId,
    @required this.logStreamArn,
    this.roleArn,
  });
  static CloudWatchLoggingOptionDescription fromJson(
          Map<String, dynamic> json) =>
      CloudWatchLoggingOptionDescription(
        cloudWatchLoggingOptionId: json.containsKey('CloudWatchLoggingOptionId')
            ? json['CloudWatchLoggingOptionId'] as String
            : null,
        logStreamArn: json['LogStreamARN'] as String,
        roleArn: json.containsKey('RoleARN') ? json['RoleARN'] as String : null,
      );
}

/// Describes the Amazon CloudWatch logging option updates.
class CloudWatchLoggingOptionUpdate {
  /// The ID of the CloudWatch logging option to update
  final String cloudWatchLoggingOptionId;

  /// The Amazon Resource Name (ARN) of the CloudWatch log to receive
  /// application messages.
  final String logStreamArnUpdate;

  CloudWatchLoggingOptionUpdate({
    @required this.cloudWatchLoggingOptionId,
    this.logStreamArnUpdate,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies either the application code, or the location of the application
/// code, for a Java-based Amazon Kinesis Data Analytics application.
class CodeContent {
  /// The text-format code for a Java-based Kinesis Data Analytics application.
  final String textContent;

  /// The zip-format code for a Java-based Kinesis Data Analytics application.
  final Uint8List zipFileContent;

  /// Information about the Amazon S3 bucket containing the application code.
  final S3ContentLocation s3ContentLocation;

  CodeContent({
    this.textContent,
    this.zipFileContent,
    this.s3ContentLocation,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes details about the application code for a Java-based Kinesis Data
/// Analytics application.
class CodeContentDescription {
  /// The text-format code
  final String textContent;

  /// The checksum that can be used to validate zip-format code.
  final String codeMd5;

  /// The size in bytes of the application code. Can be used to validate
  /// zip-format code.
  final BigInt codeSize;

  /// The S3 bucket Amazon Resource Name (ARN), file key, and object version of
  /// the application code stored in Amazon S3.
  final S3ApplicationCodeLocationDescription
      s3ApplicationCodeLocationDescription;

  CodeContentDescription({
    this.textContent,
    this.codeMd5,
    this.codeSize,
    this.s3ApplicationCodeLocationDescription,
  });
  static CodeContentDescription fromJson(Map<String, dynamic> json) =>
      CodeContentDescription(
        textContent: json.containsKey('TextContent')
            ? json['TextContent'] as String
            : null,
        codeMd5: json.containsKey('CodeMD5') ? json['CodeMD5'] as String : null,
        codeSize:
            json.containsKey('CodeSize') ? BigInt.from(json['CodeSize']) : null,
        s3ApplicationCodeLocationDescription:
            json.containsKey('S3ApplicationCodeLocationDescription')
                ? S3ApplicationCodeLocationDescription.fromJson(
                    json['S3ApplicationCodeLocationDescription'])
                : null,
      );
}

/// Describes an update to the code of a Java-based Kinesis Data Analytics
/// application.
class CodeContentUpdate {
  /// Describes an update to the text code for an application.
  final String textContentUpdate;

  /// Describes an update to the zipped code for an application.
  final Uint8List zipFileContentUpdate;

  /// Describes an update to the location of code for an application.
  final S3ContentLocationUpdate s3ContentLocationUpdate;

  CodeContentUpdate({
    this.textContentUpdate,
    this.zipFileContentUpdate,
    this.s3ContentLocationUpdate,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class CreateApplicationResponse {
  /// In response to your `CreateApplication` request, Kinesis Data Analytics
  /// returns a response with details of the application it created.
  final ApplicationDetail applicationDetail;

  CreateApplicationResponse({
    @required this.applicationDetail,
  });
  static CreateApplicationResponse fromJson(Map<String, dynamic> json) =>
      CreateApplicationResponse(
        applicationDetail:
            ApplicationDetail.fromJson(json['ApplicationDetail']),
      );
}

class CreateApplicationSnapshotResponse {
  CreateApplicationSnapshotResponse();
  static CreateApplicationSnapshotResponse fromJson(
          Map<String, dynamic> json) =>
      CreateApplicationSnapshotResponse();
}

class DeleteApplicationCloudWatchLoggingOptionResponse {
  /// The application's Amazon Resource Name (ARN).
  final String applicationArn;

  /// The version ID of the application. Kinesis Data Analytics updates the
  /// `ApplicationVersionId` each time you change the CloudWatch logging
  /// options.
  final BigInt applicationVersionId;

  /// The descriptions of the remaining CloudWatch logging options for the
  /// application.
  final List<CloudWatchLoggingOptionDescription>
      cloudWatchLoggingOptionDescriptions;

  DeleteApplicationCloudWatchLoggingOptionResponse({
    this.applicationArn,
    this.applicationVersionId,
    this.cloudWatchLoggingOptionDescriptions,
  });
  static DeleteApplicationCloudWatchLoggingOptionResponse fromJson(
          Map<String, dynamic> json) =>
      DeleteApplicationCloudWatchLoggingOptionResponse(
        applicationArn: json.containsKey('ApplicationARN')
            ? json['ApplicationARN'] as String
            : null,
        applicationVersionId: json.containsKey('ApplicationVersionId')
            ? BigInt.from(json['ApplicationVersionId'])
            : null,
        cloudWatchLoggingOptionDescriptions:
            json.containsKey('CloudWatchLoggingOptionDescriptions')
                ? (json['CloudWatchLoggingOptionDescriptions'] as List)
                    .map((e) => CloudWatchLoggingOptionDescription.fromJson(e))
                    .toList()
                : null,
      );
}

class DeleteApplicationInputProcessingConfigurationResponse {
  /// The Amazon Resource Name (ARN) of the application.
  final String applicationArn;

  /// The current application version ID.
  final BigInt applicationVersionId;

  DeleteApplicationInputProcessingConfigurationResponse({
    this.applicationArn,
    this.applicationVersionId,
  });
  static DeleteApplicationInputProcessingConfigurationResponse fromJson(
          Map<String, dynamic> json) =>
      DeleteApplicationInputProcessingConfigurationResponse(
        applicationArn: json.containsKey('ApplicationARN')
            ? json['ApplicationARN'] as String
            : null,
        applicationVersionId: json.containsKey('ApplicationVersionId')
            ? BigInt.from(json['ApplicationVersionId'])
            : null,
      );
}

class DeleteApplicationOutputResponse {
  /// The application Amazon Resource Name (ARN).
  final String applicationArn;

  /// The current application version ID.
  final BigInt applicationVersionId;

  DeleteApplicationOutputResponse({
    this.applicationArn,
    this.applicationVersionId,
  });
  static DeleteApplicationOutputResponse fromJson(Map<String, dynamic> json) =>
      DeleteApplicationOutputResponse(
        applicationArn: json.containsKey('ApplicationARN')
            ? json['ApplicationARN'] as String
            : null,
        applicationVersionId: json.containsKey('ApplicationVersionId')
            ? BigInt.from(json['ApplicationVersionId'])
            : null,
      );
}

class DeleteApplicationReferenceDataSourceResponse {
  /// The application Amazon Resource Name (ARN).
  final String applicationArn;

  /// The updated version ID of the application.
  final BigInt applicationVersionId;

  DeleteApplicationReferenceDataSourceResponse({
    this.applicationArn,
    this.applicationVersionId,
  });
  static DeleteApplicationReferenceDataSourceResponse fromJson(
          Map<String, dynamic> json) =>
      DeleteApplicationReferenceDataSourceResponse(
        applicationArn: json.containsKey('ApplicationARN')
            ? json['ApplicationARN'] as String
            : null,
        applicationVersionId: json.containsKey('ApplicationVersionId')
            ? BigInt.from(json['ApplicationVersionId'])
            : null,
      );
}

class DeleteApplicationResponse {
  DeleteApplicationResponse();
  static DeleteApplicationResponse fromJson(Map<String, dynamic> json) =>
      DeleteApplicationResponse();
}

class DeleteApplicationSnapshotResponse {
  DeleteApplicationSnapshotResponse();
  static DeleteApplicationSnapshotResponse fromJson(
          Map<String, dynamic> json) =>
      DeleteApplicationSnapshotResponse();
}

class DescribeApplicationResponse {
  /// Provides a description of the application, such as the application's
  /// Amazon Resource Name (ARN), status, and latest version.
  final ApplicationDetail applicationDetail;

  DescribeApplicationResponse({
    @required this.applicationDetail,
  });
  static DescribeApplicationResponse fromJson(Map<String, dynamic> json) =>
      DescribeApplicationResponse(
        applicationDetail:
            ApplicationDetail.fromJson(json['ApplicationDetail']),
      );
}

class DescribeApplicationSnapshotResponse {
  /// An object containing information about the application snapshot.
  final SnapshotDetails snapshotDetails;

  DescribeApplicationSnapshotResponse({
    @required this.snapshotDetails,
  });
  static DescribeApplicationSnapshotResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeApplicationSnapshotResponse(
        snapshotDetails: SnapshotDetails.fromJson(json['SnapshotDetails']),
      );
}

/// Describes the data format when records are written to the destination in an
/// SQL-based Amazon Kinesis Data Analytics application.
class DestinationSchema {
  /// Specifies the format of the records on the output stream.
  final String recordFormatType;

  DestinationSchema({
    @required this.recordFormatType,
  });
  static DestinationSchema fromJson(Map<String, dynamic> json) =>
      DestinationSchema(
        recordFormatType: json['RecordFormatType'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class DiscoverInputSchemaResponse {
  /// The schema inferred from the streaming source. It identifies the format of
  /// the data in the streaming source and how each data element maps to
  /// corresponding columns in the in-application stream that you can create.
  final SourceSchema inputSchema;

  /// An array of elements, where each element corresponds to a row in a stream
  /// record (a stream record can have more than one row).
  final List<List<String>> parsedInputRecords;

  /// The stream data that was modified by the processor specified in the
  /// `InputProcessingConfiguration` parameter.
  final List<String> processedInputRecords;

  /// The raw stream data that was sampled to infer the schema.
  final List<String> rawInputRecords;

  DiscoverInputSchemaResponse({
    this.inputSchema,
    this.parsedInputRecords,
    this.processedInputRecords,
    this.rawInputRecords,
  });
  static DiscoverInputSchemaResponse fromJson(Map<String, dynamic> json) =>
      DiscoverInputSchemaResponse(
        inputSchema: json.containsKey('InputSchema')
            ? SourceSchema.fromJson(json['InputSchema'])
            : null,
        parsedInputRecords: json.containsKey('ParsedInputRecords')
            ? (json['ParsedInputRecords'] as List)
                .map((e) => (e as List).map((e) => e as String).toList())
                .toList()
            : null,
        processedInputRecords: json.containsKey('ProcessedInputRecords')
            ? (json['ProcessedInputRecords'] as List)
                .map((e) => e as String)
                .toList()
            : null,
        rawInputRecords: json.containsKey('RawInputRecords')
            ? (json['RawInputRecords'] as List).map((e) => e as String).toList()
            : null,
      );
}

/// Describes execution properties for a Java-based Kinesis Data Analytics
/// application.
class EnvironmentProperties {
  /// Describes the execution property groups.
  final List<PropertyGroup> propertyGroups;

  EnvironmentProperties({
    @required this.propertyGroups,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes the execution properties for a Java-based Amazon Kinesis Data
/// Analytics application.
class EnvironmentPropertyDescriptions {
  /// Describes the execution property groups.
  final List<PropertyGroup> propertyGroupDescriptions;

  EnvironmentPropertyDescriptions({
    this.propertyGroupDescriptions,
  });
  static EnvironmentPropertyDescriptions fromJson(Map<String, dynamic> json) =>
      EnvironmentPropertyDescriptions(
        propertyGroupDescriptions: json.containsKey('PropertyGroupDescriptions')
            ? (json['PropertyGroupDescriptions'] as List)
                .map((e) => PropertyGroup.fromJson(e))
                .toList()
            : null,
      );
}

/// Describes updates to the execution property groups for a Java-based Amazon
/// Kinesis Data Analytics application.
class EnvironmentPropertyUpdates {
  /// Describes updates to the execution property groups.
  final List<PropertyGroup> propertyGroups;

  EnvironmentPropertyUpdates({
    @required this.propertyGroups,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes configuration parameters for a Java-based Amazon Kinesis Data
/// Analytics application.
class FlinkApplicationConfiguration {
  /// Describes an application's checkpointing configuration. Checkpointing is
  /// the process of persisting application state for fault tolerance. For more
  /// information, see
  /// [Checkpoints for Fault Tolerance](https://ci.apache.org/projects/flink/flink-docs-release-1.6/concepts/programming-model.html#checkpoints-for-fault-tolerance)
  /// in the
  /// [Apache Flink Documentation](https://ci.apache.org/projects/flink/flink-docs-release-1.6/).
  final CheckpointConfiguration checkpointConfiguration;

  /// Describes configuration parameters for Amazon CloudWatch logging for an
  /// application.
  final MonitoringConfiguration monitoringConfiguration;

  /// Describes parameters for how an application executes multiple tasks
  /// simultaneously.
  final ParallelismConfiguration parallelismConfiguration;

  FlinkApplicationConfiguration({
    this.checkpointConfiguration,
    this.monitoringConfiguration,
    this.parallelismConfiguration,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes configuration parameters for a Java-based Amazon Kinesis Data
/// Analytics application.
class FlinkApplicationConfigurationDescription {
  /// Describes an application's checkpointing configuration. Checkpointing is
  /// the process of persisting application state for fault tolerance.
  final CheckpointConfigurationDescription checkpointConfigurationDescription;

  /// Describes configuration parameters for Amazon CloudWatch logging for an
  /// application.
  final MonitoringConfigurationDescription monitoringConfigurationDescription;

  /// Describes parameters for how an application executes multiple tasks
  /// simultaneously.
  final ParallelismConfigurationDescription parallelismConfigurationDescription;

  /// The job plan for an application. For more information about the job plan,
  /// see
  /// [Jobs and Scheduling](https://ci.apache.org/projects/flink/flink-docs-stable/internals/job_scheduling.html)
  /// in the
  /// [Apache Flink Documentation](https://ci.apache.org/projects/flink/flink-docs-release-1.6/).
  /// To retrieve the job plan for the application, use the
  /// DescribeApplicationRequest$IncludeAdditionalDetails parameter of the
  /// DescribeApplication operation.
  final String jobPlanDescription;

  FlinkApplicationConfigurationDescription({
    this.checkpointConfigurationDescription,
    this.monitoringConfigurationDescription,
    this.parallelismConfigurationDescription,
    this.jobPlanDescription,
  });
  static FlinkApplicationConfigurationDescription fromJson(
          Map<String, dynamic> json) =>
      FlinkApplicationConfigurationDescription(
        checkpointConfigurationDescription:
            json.containsKey('CheckpointConfigurationDescription')
                ? CheckpointConfigurationDescription.fromJson(
                    json['CheckpointConfigurationDescription'])
                : null,
        monitoringConfigurationDescription:
            json.containsKey('MonitoringConfigurationDescription')
                ? MonitoringConfigurationDescription.fromJson(
                    json['MonitoringConfigurationDescription'])
                : null,
        parallelismConfigurationDescription:
            json.containsKey('ParallelismConfigurationDescription')
                ? ParallelismConfigurationDescription.fromJson(
                    json['ParallelismConfigurationDescription'])
                : null,
        jobPlanDescription: json.containsKey('JobPlanDescription')
            ? json['JobPlanDescription'] as String
            : null,
      );
}

/// Describes updates to the configuration parameters for a Java-based Amazon
/// Kinesis Data Analytics application.
class FlinkApplicationConfigurationUpdate {
  /// Describes updates to an application's checkpointing configuration.
  /// Checkpointing is the process of persisting application state for fault
  /// tolerance.
  final CheckpointConfigurationUpdate checkpointConfigurationUpdate;

  /// Describes updates to the configuration parameters for Amazon CloudWatch
  /// logging for an application.
  final MonitoringConfigurationUpdate monitoringConfigurationUpdate;

  /// Describes updates to the parameters for how an application executes
  /// multiple tasks simultaneously.
  final ParallelismConfigurationUpdate parallelismConfigurationUpdate;

  FlinkApplicationConfigurationUpdate({
    this.checkpointConfigurationUpdate,
    this.monitoringConfigurationUpdate,
    this.parallelismConfigurationUpdate,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// When you configure the application input for an SQL-based Amazon Kinesis
/// Data Analytics application, you specify the streaming source, the
/// in-application stream name that is created, and the mapping between the two.
class Input {
  /// The name prefix to use when creating an in-application stream. Suppose
  /// that you specify a prefix "`MyInApplicationStream`." Kinesis Data
  /// Analytics then creates one or more (as per the `InputParallelism` count
  /// you specified) in-application streams with the names
  /// "`MyInApplicationStream_001`," "`MyInApplicationStream_002`," and so on.
  final String namePrefix;

  /// The InputProcessingConfiguration for the input. An input processor
  /// transforms records as they are received from the stream, before the
  /// application's SQL code executes. Currently, the only input processing
  /// configuration available is InputLambdaProcessor.
  final InputProcessingConfiguration inputProcessingConfiguration;

  /// If the streaming source is an Amazon Kinesis data stream, identifies the
  /// stream's Amazon Resource Name (ARN).
  final KinesisStreamsInput kinesisStreamsInput;

  /// If the streaming source is an Amazon Kinesis Data Firehose delivery
  /// stream, identifies the delivery stream's ARN.
  final KinesisFirehoseInput kinesisFirehoseInput;

  /// Describes the number of in-application streams to create.
  final InputParallelism inputParallelism;

  /// Describes the format of the data in the streaming source, and how each
  /// data element maps to corresponding columns in the in-application stream
  /// that is being created.
  ///
  /// Also used to describe the format of the reference data source.
  final SourceSchema inputSchema;

  Input({
    @required this.namePrefix,
    this.inputProcessingConfiguration,
    this.kinesisStreamsInput,
    this.kinesisFirehoseInput,
    this.inputParallelism,
    @required this.inputSchema,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes the application input configuration for an SQL-based Amazon
/// Kinesis Data Analytics application.
class InputDescription {
  /// The input ID that is associated with the application input. This is the ID
  /// that Kinesis Data Analytics assigns to each input configuration that you
  /// add to your application.
  final String inputId;

  /// The in-application name prefix.
  final String namePrefix;

  /// Returns the in-application stream names that are mapped to the stream
  /// source.
  final List<String> inAppStreamNames;

  /// The description of the preprocessor that executes on records in this input
  /// before the application's code is run.
  final InputProcessingConfigurationDescription
      inputProcessingConfigurationDescription;

  /// If a Kinesis data stream is configured as a streaming source, provides the
  /// Kinesis data stream's Amazon Resource Name (ARN).
  final KinesisStreamsInputDescription kinesisStreamsInputDescription;

  /// If a Kinesis Data Firehose delivery stream is configured as a streaming
  /// source, provides the delivery stream's ARN.
  final KinesisFirehoseInputDescription kinesisFirehoseInputDescription;

  /// Describes the format of the data in the streaming source, and how each
  /// data element maps to corresponding columns in the in-application stream
  /// that is being created.
  final SourceSchema inputSchema;

  /// Describes the configured parallelism (number of in-application streams
  /// mapped to the streaming source).
  final InputParallelism inputParallelism;

  /// The point at which the application is configured to read from the input
  /// stream.
  final InputStartingPositionConfiguration inputStartingPositionConfiguration;

  InputDescription({
    this.inputId,
    this.namePrefix,
    this.inAppStreamNames,
    this.inputProcessingConfigurationDescription,
    this.kinesisStreamsInputDescription,
    this.kinesisFirehoseInputDescription,
    this.inputSchema,
    this.inputParallelism,
    this.inputStartingPositionConfiguration,
  });
  static InputDescription fromJson(Map<String, dynamic> json) =>
      InputDescription(
        inputId: json.containsKey('InputId') ? json['InputId'] as String : null,
        namePrefix: json.containsKey('NamePrefix')
            ? json['NamePrefix'] as String
            : null,
        inAppStreamNames: json.containsKey('InAppStreamNames')
            ? (json['InAppStreamNames'] as List)
                .map((e) => e as String)
                .toList()
            : null,
        inputProcessingConfigurationDescription:
            json.containsKey('InputProcessingConfigurationDescription')
                ? InputProcessingConfigurationDescription.fromJson(
                    json['InputProcessingConfigurationDescription'])
                : null,
        kinesisStreamsInputDescription:
            json.containsKey('KinesisStreamsInputDescription')
                ? KinesisStreamsInputDescription.fromJson(
                    json['KinesisStreamsInputDescription'])
                : null,
        kinesisFirehoseInputDescription:
            json.containsKey('KinesisFirehoseInputDescription')
                ? KinesisFirehoseInputDescription.fromJson(
                    json['KinesisFirehoseInputDescription'])
                : null,
        inputSchema: json.containsKey('InputSchema')
            ? SourceSchema.fromJson(json['InputSchema'])
            : null,
        inputParallelism: json.containsKey('InputParallelism')
            ? InputParallelism.fromJson(json['InputParallelism'])
            : null,
        inputStartingPositionConfiguration:
            json.containsKey('InputStartingPositionConfiguration')
                ? InputStartingPositionConfiguration.fromJson(
                    json['InputStartingPositionConfiguration'])
                : null,
      );
}

/// An object that contains the Amazon Resource Name (ARN) of the AWS Lambda
/// function that is used to preprocess records in the stream in an SQL-based
/// Amazon Kinesis Data Analytics application.
class InputLambdaProcessor {
  /// The ARN of the AWS Lambda function that operates on records in the stream.
  ///
  ///
  ///
  /// To specify an earlier version of the Lambda function than the latest,
  /// include the Lambda function version in the Lambda function ARN. For more
  /// information about Lambda ARNs, see
  /// [Example ARNs: AWS Lambda](/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-lambda)
  final String resourceArn;

  InputLambdaProcessor({
    @required this.resourceArn,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// For an SQL-based Amazon Kinesis Data Analytics application, an object that
/// contains the Amazon Resource Name (ARN) of the AWS Lambda function that is
/// used to preprocess records in the stream.
class InputLambdaProcessorDescription {
  /// The ARN of the AWS Lambda function that is used to preprocess the records
  /// in the stream.
  ///
  ///
  ///
  /// To specify an earlier version of the Lambda function than the latest,
  /// include the Lambda function version in the Lambda function ARN. For more
  /// information about Lambda ARNs, see
  /// [Example ARNs: AWS Lambda](/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-lambda)
  final String resourceArn;

  /// The ARN of the IAM role that is used to access the AWS Lambda function.
  ///
  ///
  ///
  /// Provided for backward compatibility. Applications that are created with
  /// the current API version have an application-level service execution role
  /// rather than a resource-level role.
  final String roleArn;

  InputLambdaProcessorDescription({
    @required this.resourceArn,
    this.roleArn,
  });
  static InputLambdaProcessorDescription fromJson(Map<String, dynamic> json) =>
      InputLambdaProcessorDescription(
        resourceArn: json['ResourceARN'] as String,
        roleArn: json.containsKey('RoleARN') ? json['RoleARN'] as String : null,
      );
}

/// For an SQL-based Amazon Kinesis Data Analytics application, represents an
/// update to the InputLambdaProcessor that is used to preprocess the records in
/// the stream.
class InputLambdaProcessorUpdate {
  /// The Amazon Resource Name (ARN) of the new AWS Lambda function that is used
  /// to preprocess the records in the stream.
  ///
  ///
  ///
  /// To specify an earlier version of the Lambda function than the latest,
  /// include the Lambda function version in the Lambda function ARN. For more
  /// information about Lambda ARNs, see
  /// [Example ARNs: AWS Lambda](/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-lambda)
  final String resourceArnUpdate;

  InputLambdaProcessorUpdate({
    @required this.resourceArnUpdate,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// For an SQL-based Amazon Kinesis Data Analytics application, describes the
/// number of in-application streams to create for a given streaming source.
class InputParallelism {
  /// The number of in-application streams to create.
  final int count;

  InputParallelism({
    this.count,
  });
  static InputParallelism fromJson(Map<String, dynamic> json) =>
      InputParallelism(
        count: json.containsKey('Count') ? json['Count'] as int : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// For an SQL-based Amazon Kinesis Data Analytics application, provides updates
/// to the parallelism count.
class InputParallelismUpdate {
  /// The number of in-application streams to create for the specified streaming
  /// source.
  final int countUpdate;

  InputParallelismUpdate({
    @required this.countUpdate,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// For an SQL-based Amazon Kinesis Data Analytics application, describes a
/// processor that is used to preprocess the records in the stream before being
/// processed by your application code. Currently, the only input processor
/// available is [AWS Lambda](https://aws.amazon.com/documentation/lambda/).
class InputProcessingConfiguration {
  /// The InputLambdaProcessor that is used to preprocess the records in the
  /// stream before being processed by your application code.
  final InputLambdaProcessor inputLambdaProcessor;

  InputProcessingConfiguration({
    @required this.inputLambdaProcessor,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// For an SQL-based Amazon Kinesis Data Analytics application, provides the
/// configuration information about an input processor. Currently, the only
/// input processor available is
/// [AWS Lambda](https://aws.amazon.com/documentation/lambda/).
class InputProcessingConfigurationDescription {
  /// Provides configuration information about the associated
  /// InputLambdaProcessorDescription
  final InputLambdaProcessorDescription inputLambdaProcessorDescription;

  InputProcessingConfigurationDescription({
    this.inputLambdaProcessorDescription,
  });
  static InputProcessingConfigurationDescription fromJson(
          Map<String, dynamic> json) =>
      InputProcessingConfigurationDescription(
        inputLambdaProcessorDescription:
            json.containsKey('InputLambdaProcessorDescription')
                ? InputLambdaProcessorDescription.fromJson(
                    json['InputLambdaProcessorDescription'])
                : null,
      );
}

/// For an SQL-based Amazon Kinesis Data Analytics application, describes
/// updates to an InputProcessingConfiguration.
class InputProcessingConfigurationUpdate {
  /// Provides update information for an InputLambdaProcessor.
  final InputLambdaProcessorUpdate inputLambdaProcessorUpdate;

  InputProcessingConfigurationUpdate({
    @required this.inputLambdaProcessorUpdate,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes updates for an SQL-based Amazon Kinesis Data Analytics
/// application's input schema.
class InputSchemaUpdate {
  /// Specifies the format of the records on the streaming source.
  final RecordFormat recordFormatUpdate;

  /// Specifies the encoding of the records in the streaming source; for
  /// example, UTF-8.
  final String recordEncodingUpdate;

  /// A list of `RecordColumn` objects. Each object describes the mapping of the
  /// streaming source element to the corresponding column in the in-application
  /// stream.
  final List<RecordColumn> recordColumnUpdates;

  InputSchemaUpdate({
    this.recordFormatUpdate,
    this.recordEncodingUpdate,
    this.recordColumnUpdates,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes the point at which the application reads from the streaming
/// source.
class InputStartingPositionConfiguration {
  /// The starting position on the stream.
  ///
  /// *    `NOW` - Start reading just after the most recent record in the
  /// stream, and start at the request timestamp that the customer issued.
  ///
  /// *    `TRIM_HORIZON` - Start reading at the last untrimmed record in the
  /// stream, which is the oldest record available in the stream. This option is
  /// not available for an Amazon Kinesis Data Firehose delivery stream.
  ///
  /// *    `LAST_STOPPED_POINT` - Resume reading from where the application last
  /// stopped reading.
  final String inputStartingPosition;

  InputStartingPositionConfiguration({
    this.inputStartingPosition,
  });
  static InputStartingPositionConfiguration fromJson(
          Map<String, dynamic> json) =>
      InputStartingPositionConfiguration(
        inputStartingPosition: json.containsKey('InputStartingPosition')
            ? json['InputStartingPosition'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// For an SQL-based Amazon Kinesis Data Analytics application, describes
/// updates to a specific input configuration (identified by the `InputId` of an
/// application).
class InputUpdate {
  /// The input ID of the application input to be updated.
  final String inputId;

  /// The name prefix for in-application streams that Kinesis Data Analytics
  /// creates for the specific streaming source.
  final String namePrefixUpdate;

  /// Describes updates to an InputProcessingConfiguration.
  final InputProcessingConfigurationUpdate inputProcessingConfigurationUpdate;

  /// If a Kinesis data stream is the streaming source to be updated, provides
  /// an updated stream Amazon Resource Name (ARN).
  final KinesisStreamsInputUpdate kinesisStreamsInputUpdate;

  /// If a Kinesis Data Firehose delivery stream is the streaming source to be
  /// updated, provides an updated stream ARN.
  final KinesisFirehoseInputUpdate kinesisFirehoseInputUpdate;

  /// Describes the data format on the streaming source, and how record elements
  /// on the streaming source map to columns of the in-application stream that
  /// is created.
  final InputSchemaUpdate inputSchemaUpdate;

  /// Describes the parallelism updates (the number of in-application streams
  /// Kinesis Data Analytics creates for the specific streaming source).
  final InputParallelismUpdate inputParallelismUpdate;

  InputUpdate({
    @required this.inputId,
    this.namePrefixUpdate,
    this.inputProcessingConfigurationUpdate,
    this.kinesisStreamsInputUpdate,
    this.kinesisFirehoseInputUpdate,
    this.inputSchemaUpdate,
    this.inputParallelismUpdate,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// For an SQL-based Amazon Kinesis Data Analytics application, provides
/// additional mapping information when JSON is the record format on the
/// streaming source.
class JsonMappingParameters {
  /// The path to the top-level parent that contains the records.
  final String recordRowPath;

  JsonMappingParameters({
    @required this.recordRowPath,
  });
  static JsonMappingParameters fromJson(Map<String, dynamic> json) =>
      JsonMappingParameters(
        recordRowPath: json['RecordRowPath'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// For an SQL-based Amazon Kinesis Data Analytics application, identifies a
/// Kinesis Data Firehose delivery stream as the streaming source. You provide
/// the delivery stream's Amazon Resource Name (ARN).
class KinesisFirehoseInput {
  /// The Amazon Resource Name (ARN) of the delivery stream.
  final String resourceArn;

  KinesisFirehoseInput({
    @required this.resourceArn,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes the Amazon Kinesis Data Firehose delivery stream that is
/// configured as the streaming source in the application input configuration.
class KinesisFirehoseInputDescription {
  /// The Amazon Resource Name (ARN) of the delivery stream.
  final String resourceArn;

  /// The ARN of the IAM role that Kinesis Data Analytics assumes to access the
  /// stream.
  ///
  ///
  ///
  /// Provided for backward compatibility. Applications that are created with
  /// the current API version have an application-level service execution role
  /// rather than a resource-level role.
  final String roleArn;

  KinesisFirehoseInputDescription({
    @required this.resourceArn,
    this.roleArn,
  });
  static KinesisFirehoseInputDescription fromJson(Map<String, dynamic> json) =>
      KinesisFirehoseInputDescription(
        resourceArn: json['ResourceARN'] as String,
        roleArn: json.containsKey('RoleARN') ? json['RoleARN'] as String : null,
      );
}

/// For an SQL-based Amazon Kinesis Data Analytics application, when updating
/// application input configuration, provides information about a Kinesis Data
/// Firehose delivery stream as the streaming source.
class KinesisFirehoseInputUpdate {
  /// The Amazon Resource Name (ARN) of the input delivery stream to read.
  final String resourceArnUpdate;

  KinesisFirehoseInputUpdate({
    @required this.resourceArnUpdate,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// For an SQL-based Amazon Kinesis Data Analytics application, when configuring
/// application output, identifies a Kinesis Data Firehose delivery stream as
/// the destination. You provide the stream Amazon Resource Name (ARN) of the
/// delivery stream.
class KinesisFirehoseOutput {
  /// The ARN of the destination delivery stream to write to.
  final String resourceArn;

  KinesisFirehoseOutput({
    @required this.resourceArn,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// For an SQL-based Amazon Kinesis Data Analytics application's output,
/// describes the Kinesis Data Firehose delivery stream that is configured as
/// its destination.
class KinesisFirehoseOutputDescription {
  /// The Amazon Resource Name (ARN) of the delivery stream.
  final String resourceArn;

  /// The ARN of the IAM role that Kinesis Data Analytics can assume to access
  /// the stream.
  ///
  ///
  ///
  /// Provided for backward compatibility. Applications that are created with
  /// the current API version have an application-level service execution role
  /// rather than a resource-level role.
  final String roleArn;

  KinesisFirehoseOutputDescription({
    @required this.resourceArn,
    this.roleArn,
  });
  static KinesisFirehoseOutputDescription fromJson(Map<String, dynamic> json) =>
      KinesisFirehoseOutputDescription(
        resourceArn: json['ResourceARN'] as String,
        roleArn: json.containsKey('RoleARN') ? json['RoleARN'] as String : null,
      );
}

/// For an SQL-based Amazon Kinesis Data Analytics application, when updating an
/// output configuration using the UpdateApplication operation, provides
/// information about a Kinesis Data Firehose delivery stream that is configured
/// as the destination.
class KinesisFirehoseOutputUpdate {
  /// The Amazon Resource Name (ARN) of the delivery stream to write to.
  final String resourceArnUpdate;

  KinesisFirehoseOutputUpdate({
    @required this.resourceArnUpdate,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

///  Identifies an Amazon Kinesis data stream as the streaming source. You
/// provide the stream's Amazon Resource Name (ARN).
class KinesisStreamsInput {
  /// The ARN of the input Kinesis data stream to read.
  final String resourceArn;

  KinesisStreamsInput({
    @required this.resourceArn,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// For an SQL-based Amazon Kinesis Data Analytics application, describes the
/// Kinesis data stream that is configured as the streaming source in the
/// application input configuration.
class KinesisStreamsInputDescription {
  /// The Amazon Resource Name (ARN) of the Kinesis data stream.
  final String resourceArn;

  /// The ARN of the IAM role that Kinesis Data Analytics can assume to access
  /// the stream.
  ///
  ///
  ///
  /// Provided for backward compatibility. Applications that are created with
  /// the current API version have an application-level service execution role
  /// rather than a resource-level role.
  final String roleArn;

  KinesisStreamsInputDescription({
    @required this.resourceArn,
    this.roleArn,
  });
  static KinesisStreamsInputDescription fromJson(Map<String, dynamic> json) =>
      KinesisStreamsInputDescription(
        resourceArn: json['ResourceARN'] as String,
        roleArn: json.containsKey('RoleARN') ? json['RoleARN'] as String : null,
      );
}

/// When you update the input configuration for an SQL-based Amazon Kinesis Data
/// Analytics application, provides information about an Amazon Kinesis stream
/// as the streaming source.
class KinesisStreamsInputUpdate {
  /// The Amazon Resource Name (ARN) of the input Kinesis data stream to read.
  final String resourceArnUpdate;

  KinesisStreamsInputUpdate({
    @required this.resourceArnUpdate,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// When you configure an SQL-based Amazon Kinesis Data Analytics application's
/// output, identifies a Kinesis data stream as the destination. You provide the
/// stream Amazon Resource Name (ARN).
class KinesisStreamsOutput {
  /// The ARN of the destination Kinesis data stream to write to.
  final String resourceArn;

  KinesisStreamsOutput({
    @required this.resourceArn,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// For an SQL-based Amazon Kinesis Data Analytics application's output,
/// describes the Kinesis data stream that is configured as its destination.
class KinesisStreamsOutputDescription {
  /// The Amazon Resource Name (ARN) of the Kinesis data stream.
  final String resourceArn;

  /// The ARN of the IAM role that Kinesis Data Analytics can assume to access
  /// the stream.
  ///
  ///
  ///
  /// Provided for backward compatibility. Applications that are created with
  /// the current API version have an application-level service execution role
  /// rather than a resource-level role.
  final String roleArn;

  KinesisStreamsOutputDescription({
    @required this.resourceArn,
    this.roleArn,
  });
  static KinesisStreamsOutputDescription fromJson(Map<String, dynamic> json) =>
      KinesisStreamsOutputDescription(
        resourceArn: json['ResourceARN'] as String,
        roleArn: json.containsKey('RoleARN') ? json['RoleARN'] as String : null,
      );
}

/// When you update an SQL-based Amazon Kinesis Data Analytics application's
/// output configuration using the UpdateApplication operation, provides
/// information about a Kinesis data stream that is configured as the
/// destination.
class KinesisStreamsOutputUpdate {
  /// The Amazon Resource Name (ARN) of the Kinesis data stream where you want
  /// to write the output.
  final String resourceArnUpdate;

  KinesisStreamsOutputUpdate({
    @required this.resourceArnUpdate,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// When you configure an SQL-based Amazon Kinesis Data Analytics application's
/// output, identifies an AWS Lambda function as the destination. You provide
/// the function Amazon Resource Name (ARN) of the Lambda function.
class LambdaOutput {
  /// The Amazon Resource Name (ARN) of the destination Lambda function to write
  /// to.
  ///
  ///
  ///
  /// To specify an earlier version of the Lambda function than the latest,
  /// include the Lambda function version in the Lambda function ARN. For more
  /// information about Lambda ARNs, see
  /// [Example ARNs: AWS Lambda](/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-lambda)
  final String resourceArn;

  LambdaOutput({
    @required this.resourceArn,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// For an SQL-based Amazon Kinesis Data Analytics application output, describes
/// the AWS Lambda function that is configured as its destination.
class LambdaOutputDescription {
  /// The Amazon Resource Name (ARN) of the destination Lambda function.
  final String resourceArn;

  /// The ARN of the IAM role that Kinesis Data Analytics can assume to write to
  /// the destination function.
  ///
  ///
  ///
  /// Provided for backward compatibility. Applications that are created with
  /// the current API version have an application-level service execution role
  /// rather than a resource-level role.
  final String roleArn;

  LambdaOutputDescription({
    @required this.resourceArn,
    this.roleArn,
  });
  static LambdaOutputDescription fromJson(Map<String, dynamic> json) =>
      LambdaOutputDescription(
        resourceArn: json['ResourceARN'] as String,
        roleArn: json.containsKey('RoleARN') ? json['RoleARN'] as String : null,
      );
}

/// When you update an SQL-based Amazon Kinesis Data Analytics application's
/// output configuration using the UpdateApplication operation, provides
/// information about an AWS Lambda function that is configured as the
/// destination.
class LambdaOutputUpdate {
  /// The Amazon Resource Name (ARN) of the destination AWS Lambda function.
  ///
  ///
  ///
  /// To specify an earlier version of the Lambda function than the latest,
  /// include the Lambda function version in the Lambda function ARN. For more
  /// information about Lambda ARNs, see
  /// [Example ARNs: AWS Lambda](/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-lambda)
  final String resourceArnUpdate;

  LambdaOutputUpdate({
    @required this.resourceArnUpdate,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class ListApplicationSnapshotsResponse {
  /// A collection of objects containing information about the application
  /// snapshots.
  final List<SnapshotDetails> snapshotSummaries;

  /// The token for the next set of results, or `null` if there are no
  /// additional results.
  final String nextToken;

  ListApplicationSnapshotsResponse({
    this.snapshotSummaries,
    this.nextToken,
  });
  static ListApplicationSnapshotsResponse fromJson(Map<String, dynamic> json) =>
      ListApplicationSnapshotsResponse(
        snapshotSummaries: json.containsKey('SnapshotSummaries')
            ? (json['SnapshotSummaries'] as List)
                .map((e) => SnapshotDetails.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListApplicationsResponse {
  /// A list of `ApplicationSummary` objects.
  final List<ApplicationSummary> applicationSummaries;

  /// The pagination token for the next set of results, or `null` if there are
  /// no additional results. Pass this token into a subsequent command to
  /// retrieve the next set of items For more information about pagination, see
  /// [Using the AWS Command Line Interface's Pagination Options](https://docs.aws.amazon.com/cli/latest/userguide/pagination.html).
  final String nextToken;

  ListApplicationsResponse({
    @required this.applicationSummaries,
    this.nextToken,
  });
  static ListApplicationsResponse fromJson(Map<String, dynamic> json) =>
      ListApplicationsResponse(
        applicationSummaries: (json['ApplicationSummaries'] as List)
            .map((e) => ApplicationSummary.fromJson(e))
            .toList(),
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListTagsForResourceResponse {
  /// The key-value tags assigned to the application.
  final List<Tag> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  static ListTagsForResourceResponse fromJson(Map<String, dynamic> json) =>
      ListTagsForResourceResponse(
        tags: json.containsKey('Tags')
            ? (json['Tags'] as List).map((e) => Tag.fromJson(e)).toList()
            : null,
      );
}

/// When you configure an SQL-based Amazon Kinesis Data Analytics application's
/// input at the time of creating or updating an application, provides
/// additional mapping information specific to the record format (such as JSON,
/// CSV, or record fields delimited by some delimiter) on the streaming source.
class MappingParameters {
  /// Provides additional mapping information when JSON is the record format on
  /// the streaming source.
  final JsonMappingParameters jsonMappingParameters;

  /// Provides additional mapping information when the record format uses
  /// delimiters (for example, CSV).
  final CsvMappingParameters csvMappingParameters;

  MappingParameters({
    this.jsonMappingParameters,
    this.csvMappingParameters,
  });
  static MappingParameters fromJson(Map<String, dynamic> json) =>
      MappingParameters(
        jsonMappingParameters: json.containsKey('JSONMappingParameters')
            ? JsonMappingParameters.fromJson(json['JSONMappingParameters'])
            : null,
        csvMappingParameters: json.containsKey('CSVMappingParameters')
            ? CsvMappingParameters.fromJson(json['CSVMappingParameters'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes configuration parameters for Amazon CloudWatch logging for a
/// Java-based Kinesis Data Analytics application. For more information about
/// CloudWatch logging, see
/// [Monitoring](https://docs.aws.amazon.com/kinesisanalytics/latest/java/monitoring-overview.html).
class MonitoringConfiguration {
  /// Describes whether to use the default CloudWatch logging configuration for
  /// an application.
  final String configurationType;

  /// Describes the granularity of the CloudWatch Logs for an application.
  final String metricsLevel;

  /// Describes the verbosity of the CloudWatch Logs for an application.
  final String logLevel;

  MonitoringConfiguration({
    @required this.configurationType,
    this.metricsLevel,
    this.logLevel,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes configuration parameters for CloudWatch logging for a Java-based
/// Kinesis Data Analytics application.
class MonitoringConfigurationDescription {
  /// Describes whether to use the default CloudWatch logging configuration for
  /// an application.
  final String configurationType;

  /// Describes the granularity of the CloudWatch Logs for an application.
  final String metricsLevel;

  /// Describes the verbosity of the CloudWatch Logs for an application.
  final String logLevel;

  MonitoringConfigurationDescription({
    this.configurationType,
    this.metricsLevel,
    this.logLevel,
  });
  static MonitoringConfigurationDescription fromJson(
          Map<String, dynamic> json) =>
      MonitoringConfigurationDescription(
        configurationType: json.containsKey('ConfigurationType')
            ? json['ConfigurationType'] as String
            : null,
        metricsLevel: json.containsKey('MetricsLevel')
            ? json['MetricsLevel'] as String
            : null,
        logLevel:
            json.containsKey('LogLevel') ? json['LogLevel'] as String : null,
      );
}

/// Describes updates to configuration parameters for Amazon CloudWatch logging
/// for a Java-based Kinesis Data Analytics application.
class MonitoringConfigurationUpdate {
  /// Describes updates to whether to use the default CloudWatch logging
  /// configuration for an application.
  final String configurationTypeUpdate;

  /// Describes updates to the granularity of the CloudWatch Logs for an
  /// application.
  final String metricsLevelUpdate;

  /// Describes updates to the verbosity of the CloudWatch Logs for an
  /// application.
  final String logLevelUpdate;

  MonitoringConfigurationUpdate({
    this.configurationTypeUpdate,
    this.metricsLevelUpdate,
    this.logLevelUpdate,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

///  Describes an SQL-based Amazon Kinesis Data Analytics application's output
/// configuration, in which you identify an in-application stream and a
/// destination where you want the in-application stream data to be written. The
/// destination can be a Kinesis data stream or a Kinesis Data Firehose delivery
/// stream.
class Output {
  /// The name of the in-application stream.
  final String name;

  /// Identifies an Amazon Kinesis data stream as the destination.
  final KinesisStreamsOutput kinesisStreamsOutput;

  /// Identifies an Amazon Kinesis Data Firehose delivery stream as the
  /// destination.
  final KinesisFirehoseOutput kinesisFirehoseOutput;

  /// Identifies an AWS Lambda function as the destination.
  final LambdaOutput lambdaOutput;

  /// Describes the data format when records are written to the destination.
  final DestinationSchema destinationSchema;

  Output({
    @required this.name,
    this.kinesisStreamsOutput,
    this.kinesisFirehoseOutput,
    this.lambdaOutput,
    @required this.destinationSchema,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// For an SQL-based Amazon Kinesis Data Analytics application, describes the
/// application output configuration, which includes the in-application stream
/// name and the destination where the stream data is written. The destination
/// can be a Kinesis data stream or a Kinesis Data Firehose delivery stream.
class OutputDescription {
  /// A unique identifier for the output configuration.
  final String outputId;

  /// The name of the in-application stream that is configured as output.
  final String name;

  /// Describes the Kinesis data stream that is configured as the destination
  /// where output is written.
  final KinesisStreamsOutputDescription kinesisStreamsOutputDescription;

  /// Describes the Kinesis Data Firehose delivery stream that is configured as
  /// the destination where output is written.
  final KinesisFirehoseOutputDescription kinesisFirehoseOutputDescription;

  /// Describes the Lambda function that is configured as the destination where
  /// output is written.
  final LambdaOutputDescription lambdaOutputDescription;

  /// The data format used for writing data to the destination.
  final DestinationSchema destinationSchema;

  OutputDescription({
    this.outputId,
    this.name,
    this.kinesisStreamsOutputDescription,
    this.kinesisFirehoseOutputDescription,
    this.lambdaOutputDescription,
    this.destinationSchema,
  });
  static OutputDescription fromJson(Map<String, dynamic> json) =>
      OutputDescription(
        outputId:
            json.containsKey('OutputId') ? json['OutputId'] as String : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        kinesisStreamsOutputDescription:
            json.containsKey('KinesisStreamsOutputDescription')
                ? KinesisStreamsOutputDescription.fromJson(
                    json['KinesisStreamsOutputDescription'])
                : null,
        kinesisFirehoseOutputDescription:
            json.containsKey('KinesisFirehoseOutputDescription')
                ? KinesisFirehoseOutputDescription.fromJson(
                    json['KinesisFirehoseOutputDescription'])
                : null,
        lambdaOutputDescription: json.containsKey('LambdaOutputDescription')
            ? LambdaOutputDescription.fromJson(json['LambdaOutputDescription'])
            : null,
        destinationSchema: json.containsKey('DestinationSchema')
            ? DestinationSchema.fromJson(json['DestinationSchema'])
            : null,
      );
}

///  For an SQL-based Amazon Kinesis Data Analytics application, describes
/// updates to the output configuration identified by the `OutputId`.
class OutputUpdate {
  /// Identifies the specific output configuration that you want to update.
  final String outputId;

  /// If you want to specify a different in-application stream for this output
  /// configuration, use this field to specify the new in-application stream
  /// name.
  final String nameUpdate;

  /// Describes a Kinesis data stream as the destination for the output.
  final KinesisStreamsOutputUpdate kinesisStreamsOutputUpdate;

  /// Describes a Kinesis Data Firehose delivery stream as the destination for
  /// the output.
  final KinesisFirehoseOutputUpdate kinesisFirehoseOutputUpdate;

  /// Describes an AWS Lambda function as the destination for the output.
  final LambdaOutputUpdate lambdaOutputUpdate;

  /// Describes the data format when records are written to the destination.
  final DestinationSchema destinationSchemaUpdate;

  OutputUpdate({
    @required this.outputId,
    this.nameUpdate,
    this.kinesisStreamsOutputUpdate,
    this.kinesisFirehoseOutputUpdate,
    this.lambdaOutputUpdate,
    this.destinationSchemaUpdate,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes parameters for how a Java-based Amazon Kinesis Data Analytics
/// application executes multiple tasks simultaneously. For more information
/// about parallelism, see
/// [Parallel Execution](https://ci.apache.org/projects/flink/flink-docs-stable/dev/parallel.html)
/// in the
/// [Apache Flink Documentation](https://ci.apache.org/projects/flink/flink-docs-release-1.6/).
class ParallelismConfiguration {
  /// Describes whether the application uses the default parallelism for the
  /// Kinesis Data Analytics service.
  final String configurationType;

  /// Describes the initial number of parallel tasks that a Java-based Kinesis
  /// Data Analytics application can perform. The Kinesis Data Analytics service
  /// can increase this number automatically if
  /// ParallelismConfiguration$AutoScalingEnabled is set to `true`.
  final int parallelism;

  /// Describes the number of parallel tasks that a Java-based Kinesis Data
  /// Analytics application can perform per Kinesis Processing Unit (KPU) used
  /// by the application. For more information about KPUs, see
  /// [Amazon Kinesis Data Analytics Pricing](http://aws.amazon.com/kinesis/data-analytics/pricing/).
  final int parallelismPerKpu;

  /// Describes whether the Kinesis Data Analytics service can increase the
  /// parallelism of the application in response to increased throughput.
  final bool autoScalingEnabled;

  ParallelismConfiguration({
    @required this.configurationType,
    this.parallelism,
    this.parallelismPerKpu,
    this.autoScalingEnabled,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes parameters for how a Java-based Kinesis Data Analytics application
/// executes multiple tasks simultaneously.
class ParallelismConfigurationDescription {
  /// Describes whether the application uses the default parallelism for the
  /// Kinesis Data Analytics service.
  final String configurationType;

  /// Describes the initial number of parallel tasks that a Java-based Kinesis
  /// Data Analytics application can perform.
  final int parallelism;

  /// Describes the number of parallel tasks that a Java-based Kinesis Data
  /// Analytics application can perform per Kinesis Processing Unit (KPU) used
  /// by the application.
  final int parallelismPerKpu;

  /// Describes the current number of parallel tasks that a Java-based Kinesis
  /// Data Analytics application can perform.
  final int currentParallelism;

  /// Describes whether the Kinesis Data Analytics service can increase the
  /// parallelism of the application in response to increased throughput.
  final bool autoScalingEnabled;

  ParallelismConfigurationDescription({
    this.configurationType,
    this.parallelism,
    this.parallelismPerKpu,
    this.currentParallelism,
    this.autoScalingEnabled,
  });
  static ParallelismConfigurationDescription fromJson(
          Map<String, dynamic> json) =>
      ParallelismConfigurationDescription(
        configurationType: json.containsKey('ConfigurationType')
            ? json['ConfigurationType'] as String
            : null,
        parallelism:
            json.containsKey('Parallelism') ? json['Parallelism'] as int : null,
        parallelismPerKpu: json.containsKey('ParallelismPerKPU')
            ? json['ParallelismPerKPU'] as int
            : null,
        currentParallelism: json.containsKey('CurrentParallelism')
            ? json['CurrentParallelism'] as int
            : null,
        autoScalingEnabled: json.containsKey('AutoScalingEnabled')
            ? json['AutoScalingEnabled'] as bool
            : null,
      );
}

/// Describes updates to parameters for how a Java-based Kinesis Data Analytics
/// application executes multiple tasks simultaneously.
class ParallelismConfigurationUpdate {
  /// Describes updates to whether the application uses the default parallelism
  /// for the Kinesis Data Analytics service, or if a custom parallelism is
  /// used.
  final String configurationTypeUpdate;

  /// Describes updates to the initial number of parallel tasks an application
  /// can perform.
  final int parallelismUpdate;

  /// Describes updates to the number of parallel tasks an application can
  /// perform per Kinesis Processing Unit (KPU) used by the application.
  final int parallelismPerKpuUpdate;

  /// Describes updates to whether the Kinesis Data Analytics service can
  /// increase the parallelism of the application in response to increased
  /// throughput.
  final bool autoScalingEnabledUpdate;

  ParallelismConfigurationUpdate({
    this.configurationTypeUpdate,
    this.parallelismUpdate,
    this.parallelismPerKpuUpdate,
    this.autoScalingEnabledUpdate,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Property key-value pairs passed into a Java-based Kinesis Data Analytics
/// application.
class PropertyGroup {
  /// Describes the key of an application execution property key-value pair.
  final String propertyGroupId;

  /// Describes the value of an application execution property key-value pair.
  final Map<String, String> propertyMap;

  PropertyGroup({
    @required this.propertyGroupId,
    @required this.propertyMap,
  });
  static PropertyGroup fromJson(Map<String, dynamic> json) => PropertyGroup(
        propertyGroupId: json['PropertyGroupId'] as String,
        propertyMap: (json['PropertyMap'] as Map)
            .map((k, v) => MapEntry(k as String, v as String)),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// For an SQL-based Amazon Kinesis Data Analytics application, describes the
/// mapping of each data element in the streaming source to the corresponding
/// column in the in-application stream.
///
/// Also used to describe the format of the reference data source.
class RecordColumn {
  /// The name of the column that is created in the in-application input stream
  /// or reference table.
  final String name;

  /// A reference to the data element in the streaming input or the reference
  /// data source.
  final String mapping;

  /// The type of column created in the in-application input stream or reference
  /// table.
  final String sqlType;

  RecordColumn({
    @required this.name,
    this.mapping,
    @required this.sqlType,
  });
  static RecordColumn fromJson(Map<String, dynamic> json) => RecordColumn(
        name: json['Name'] as String,
        mapping: json.containsKey('Mapping') ? json['Mapping'] as String : null,
        sqlType: json['SqlType'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

///  For an SQL-based Amazon Kinesis Data Analytics application, describes the
/// record format and relevant mapping information that should be applied to
/// schematize the records on the stream.
class RecordFormat {
  /// The type of record format.
  final String recordFormatType;

  /// When you configure application input at the time of creating or updating
  /// an application, provides additional mapping information specific to the
  /// record format (such as JSON, CSV, or record fields delimited by some
  /// delimiter) on the streaming source.
  final MappingParameters mappingParameters;

  RecordFormat({
    @required this.recordFormatType,
    this.mappingParameters,
  });
  static RecordFormat fromJson(Map<String, dynamic> json) => RecordFormat(
        recordFormatType: json['RecordFormatType'] as String,
        mappingParameters: json.containsKey('MappingParameters')
            ? MappingParameters.fromJson(json['MappingParameters'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// For an SQL-based Amazon Kinesis Data Analytics application, describes the
/// reference data source by providing the source information (Amazon S3 bucket
/// name and object key name), the resulting in-application table name that is
/// created, and the necessary schema to map the data elements in the Amazon S3
/// object to the in-application table.
class ReferenceDataSource {
  /// The name of the in-application table to create.
  final String tableName;

  /// Identifies the S3 bucket and object that contains the reference data. A
  /// Kinesis Data Analytics application loads reference data only once. If the
  /// data changes, you call the UpdateApplication operation to trigger
  /// reloading of data into your application.
  final S3ReferenceDataSource s3ReferenceDataSource;

  /// Describes the format of the data in the streaming source, and how each
  /// data element maps to corresponding columns created in the in-application
  /// stream.
  final SourceSchema referenceSchema;

  ReferenceDataSource({
    @required this.tableName,
    this.s3ReferenceDataSource,
    @required this.referenceSchema,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// For an SQL-based Amazon Kinesis Data Analytics application, describes the
/// reference data source configured for an application.
class ReferenceDataSourceDescription {
  /// The ID of the reference data source. This is the ID that Kinesis Data
  /// Analytics assigns when you add the reference data source to your
  /// application using the CreateApplication or UpdateApplication operation.
  final String referenceId;

  /// The in-application table name created by the specific reference data
  /// source configuration.
  final String tableName;

  /// Provides the Amazon S3 bucket name, the object key name that contains the
  /// reference data.
  final S3ReferenceDataSourceDescription s3ReferenceDataSourceDescription;

  /// Describes the format of the data in the streaming source, and how each
  /// data element maps to corresponding columns created in the in-application
  /// stream.
  final SourceSchema referenceSchema;

  ReferenceDataSourceDescription({
    @required this.referenceId,
    @required this.tableName,
    @required this.s3ReferenceDataSourceDescription,
    this.referenceSchema,
  });
  static ReferenceDataSourceDescription fromJson(Map<String, dynamic> json) =>
      ReferenceDataSourceDescription(
        referenceId: json['ReferenceId'] as String,
        tableName: json['TableName'] as String,
        s3ReferenceDataSourceDescription:
            S3ReferenceDataSourceDescription.fromJson(
                json['S3ReferenceDataSourceDescription']),
        referenceSchema: json.containsKey('ReferenceSchema')
            ? SourceSchema.fromJson(json['ReferenceSchema'])
            : null,
      );
}

/// When you update a reference data source configuration for a SQL-based Amazon
/// Kinesis Data Analytics application, this object provides all the updated
/// values (such as the source bucket name and object key name), the
/// in-application table name that is created, and updated mapping information
/// that maps the data in the Amazon S3 object to the in-application reference
/// table that is created.
class ReferenceDataSourceUpdate {
  /// The ID of the reference data source that is being updated. You can use the
  /// DescribeApplication operation to get this value.
  final String referenceId;

  /// The in-application table name that is created by this update.
  final String tableNameUpdate;

  /// Describes the S3 bucket name, object key name, and IAM role that Kinesis
  /// Data Analytics can assume to read the Amazon S3 object on your behalf and
  /// populate the in-application reference table.
  final S3ReferenceDataSourceUpdate s3ReferenceDataSourceUpdate;

  /// Describes the format of the data in the streaming source, and how each
  /// data element maps to corresponding columns created in the in-application
  /// stream.
  final SourceSchema referenceSchemaUpdate;

  ReferenceDataSourceUpdate({
    @required this.referenceId,
    this.tableNameUpdate,
    this.s3ReferenceDataSourceUpdate,
    this.referenceSchemaUpdate,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes the starting parameters for an Amazon Kinesis Data Analytics
/// application.
class RunConfiguration {
  /// Describes the starting parameters for an SQL-based Kinesis Data Analytics
  /// application.
  final List<SqlRunConfiguration> sqlRunConfigurations;

  /// Describes the restore behavior of a restarting application.
  final ApplicationRestoreConfiguration applicationRestoreConfiguration;

  RunConfiguration({
    this.sqlRunConfigurations,
    this.applicationRestoreConfiguration,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes the starting properties for a Kinesis Data Analytics application.
class RunConfigurationDescription {
  /// Describes the restore behavior of a restarting application.
  final ApplicationRestoreConfiguration
      applicationRestoreConfigurationDescription;

  RunConfigurationDescription({
    this.applicationRestoreConfigurationDescription,
  });
  static RunConfigurationDescription fromJson(Map<String, dynamic> json) =>
      RunConfigurationDescription(
        applicationRestoreConfigurationDescription:
            json.containsKey('ApplicationRestoreConfigurationDescription')
                ? ApplicationRestoreConfiguration.fromJson(
                    json['ApplicationRestoreConfigurationDescription'])
                : null,
      );
}

/// Describes the updates to the starting parameters for a Kinesis Data
/// Analytics application.
class RunConfigurationUpdate {
  /// Describes updates to the restore behavior of a restarting application.
  final ApplicationRestoreConfiguration applicationRestoreConfiguration;

  RunConfigurationUpdate({
    this.applicationRestoreConfiguration,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes the location of a Java-based Amazon Kinesis Data Analytics
/// application's code stored in an S3 bucket.
class S3ApplicationCodeLocationDescription {
  /// The Amazon Resource Name (ARN) for the S3 bucket containing the
  /// application code.
  final String bucketArn;

  /// The file key for the object containing the application code.
  final String fileKey;

  /// The version of the object containing the application code.
  final String objectVersion;

  S3ApplicationCodeLocationDescription({
    @required this.bucketArn,
    @required this.fileKey,
    this.objectVersion,
  });
  static S3ApplicationCodeLocationDescription fromJson(
          Map<String, dynamic> json) =>
      S3ApplicationCodeLocationDescription(
        bucketArn: json['BucketARN'] as String,
        fileKey: json['FileKey'] as String,
        objectVersion: json.containsKey('ObjectVersion')
            ? json['ObjectVersion'] as String
            : null,
      );
}

/// For an SQL-based Amazon Kinesis Data Analytics application, provides a
/// description of an Amazon S3 data source, including the Amazon Resource Name
/// (ARN) of the S3 bucket and the name of the Amazon S3 object that contains
/// the data.
class S3Configuration {
  /// The ARN of the S3 bucket that contains the data.
  final String bucketArn;

  /// The name of the object that contains the data.
  final String fileKey;

  S3Configuration({
    @required this.bucketArn,
    @required this.fileKey,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// For a Java-based Amazon Kinesis Data Analytics application, provides a
/// description of an Amazon S3 object, including the Amazon Resource Name (ARN)
/// of the S3 bucket, the name of the Amazon S3 object that contains the data,
/// and the version number of the Amazon S3 object that contains the data.
class S3ContentLocation {
  /// The Amazon Resource Name (ARN) for the S3 bucket containing the
  /// application code.
  final String bucketArn;

  /// The file key for the object containing the application code.
  final String fileKey;

  /// The version of the object containing the application code.
  final String objectVersion;

  S3ContentLocation({
    @required this.bucketArn,
    @required this.fileKey,
    this.objectVersion,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes an update for the Amazon S3 code content location for a Java-based
/// Amazon Kinesis Data Analytics application.
class S3ContentLocationUpdate {
  /// The new Amazon Resource Name (ARN) for the S3 bucket containing the
  /// application code.
  final String bucketArnUpdate;

  /// The new file key for the object containing the application code.
  final String fileKeyUpdate;

  /// The new version of the object containing the application code.
  final String objectVersionUpdate;

  S3ContentLocationUpdate({
    this.bucketArnUpdate,
    this.fileKeyUpdate,
    this.objectVersionUpdate,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// For an SQL-based Amazon Kinesis Data Analytics application, identifies the
/// Amazon S3 bucket and object that contains the reference data.
///
/// A Kinesis Data Analytics application loads reference data only once. If the
/// data changes, you call the UpdateApplication operation to trigger reloading
/// of data into your application.
class S3ReferenceDataSource {
  /// The Amazon Resource Name (ARN) of the S3 bucket.
  final String bucketArn;

  /// The object key name containing the reference data.
  final String fileKey;

  S3ReferenceDataSource({
    this.bucketArn,
    this.fileKey,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// For an SQL-based Amazon Kinesis Data Analytics application, provides the
/// bucket name and object key name that stores the reference data.
class S3ReferenceDataSourceDescription {
  /// The Amazon Resource Name (ARN) of the S3 bucket.
  final String bucketArn;

  /// Amazon S3 object key name.
  final String fileKey;

  /// The ARN of the IAM role that Kinesis Data Analytics can assume to read the
  /// Amazon S3 object on your behalf to populate the in-application reference
  /// table.
  ///
  ///
  ///
  /// Provided for backward compatibility. Applications that are created with
  /// the current API version have an application-level service execution role
  /// rather than a resource-level role.
  final String referenceRoleArn;

  S3ReferenceDataSourceDescription({
    @required this.bucketArn,
    @required this.fileKey,
    this.referenceRoleArn,
  });
  static S3ReferenceDataSourceDescription fromJson(Map<String, dynamic> json) =>
      S3ReferenceDataSourceDescription(
        bucketArn: json['BucketARN'] as String,
        fileKey: json['FileKey'] as String,
        referenceRoleArn: json.containsKey('ReferenceRoleARN')
            ? json['ReferenceRoleARN'] as String
            : null,
      );
}

/// For an SQL-based Amazon Kinesis Data Analytics application, describes the
/// Amazon S3 bucket name and object key name for an in-application reference
/// table.
class S3ReferenceDataSourceUpdate {
  /// The Amazon Resource Name (ARN) of the S3 bucket.
  final String bucketArnUpdate;

  /// The object key name.
  final String fileKeyUpdate;

  S3ReferenceDataSourceUpdate({
    this.bucketArnUpdate,
    this.fileKeyUpdate,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides details about a snapshot of application state.
class SnapshotDetails {
  /// The identifier for the application snapshot.
  final String snapshotName;

  /// The status of the application snapshot.
  final String snapshotStatus;

  /// The current application version ID when the snapshot was created.
  final BigInt applicationVersionId;

  /// The timestamp of the application snapshot.
  final DateTime snapshotCreationTimestamp;

  SnapshotDetails({
    @required this.snapshotName,
    @required this.snapshotStatus,
    @required this.applicationVersionId,
    this.snapshotCreationTimestamp,
  });
  static SnapshotDetails fromJson(Map<String, dynamic> json) => SnapshotDetails(
        snapshotName: json['SnapshotName'] as String,
        snapshotStatus: json['SnapshotStatus'] as String,
        applicationVersionId: BigInt.from(json['ApplicationVersionId']),
        snapshotCreationTimestamp: json.containsKey('SnapshotCreationTimestamp')
            ? DateTime.parse(json['SnapshotCreationTimestamp'])
            : null,
      );
}

/// For an SQL-based Amazon Kinesis Data Analytics application, describes the
/// format of the data in the streaming source, and how each data element maps
/// to corresponding columns created in the in-application stream.
class SourceSchema {
  /// Specifies the format of the records on the streaming source.
  final RecordFormat recordFormat;

  /// Specifies the encoding of the records in the streaming source. For
  /// example, UTF-8.
  final String recordEncoding;

  /// A list of `RecordColumn` objects.
  final List<RecordColumn> recordColumns;

  SourceSchema({
    @required this.recordFormat,
    this.recordEncoding,
    @required this.recordColumns,
  });
  static SourceSchema fromJson(Map<String, dynamic> json) => SourceSchema(
        recordFormat: RecordFormat.fromJson(json['RecordFormat']),
        recordEncoding: json.containsKey('RecordEncoding')
            ? json['RecordEncoding'] as String
            : null,
        recordColumns: (json['RecordColumns'] as List)
            .map((e) => RecordColumn.fromJson(e))
            .toList(),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes the inputs, outputs, and reference data sources for an SQL-based
/// Kinesis Data Analytics application.
class SqlApplicationConfiguration {
  /// The array of Input objects describing the input streams used by the
  /// application.
  final List<Input> inputs;

  /// The array of Output objects describing the destination streams used by the
  /// application.
  final List<Output> outputs;

  /// The array of ReferenceDataSource objects describing the reference data
  /// sources used by the application.
  final List<ReferenceDataSource> referenceDataSources;

  SqlApplicationConfiguration({
    this.inputs,
    this.outputs,
    this.referenceDataSources,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes the inputs, outputs, and reference data sources for an SQL-based
/// Kinesis Data Analytics application.
class SqlApplicationConfigurationDescription {
  /// The array of InputDescription objects describing the input streams used by
  /// the application.
  final List<InputDescription> inputDescriptions;

  /// The array of OutputDescription objects describing the destination streams
  /// used by the application.
  final List<OutputDescription> outputDescriptions;

  /// The array of ReferenceDataSourceDescription objects describing the
  /// reference data sources used by the application.
  final List<ReferenceDataSourceDescription> referenceDataSourceDescriptions;

  SqlApplicationConfigurationDescription({
    this.inputDescriptions,
    this.outputDescriptions,
    this.referenceDataSourceDescriptions,
  });
  static SqlApplicationConfigurationDescription fromJson(
          Map<String, dynamic> json) =>
      SqlApplicationConfigurationDescription(
        inputDescriptions: json.containsKey('InputDescriptions')
            ? (json['InputDescriptions'] as List)
                .map((e) => InputDescription.fromJson(e))
                .toList()
            : null,
        outputDescriptions: json.containsKey('OutputDescriptions')
            ? (json['OutputDescriptions'] as List)
                .map((e) => OutputDescription.fromJson(e))
                .toList()
            : null,
        referenceDataSourceDescriptions:
            json.containsKey('ReferenceDataSourceDescriptions')
                ? (json['ReferenceDataSourceDescriptions'] as List)
                    .map((e) => ReferenceDataSourceDescription.fromJson(e))
                    .toList()
                : null,
      );
}

/// Describes updates to the input streams, destination streams, and reference
/// data sources for an SQL-based Kinesis Data Analytics application.
class SqlApplicationConfigurationUpdate {
  /// The array of InputUpdate objects describing the new input streams used by
  /// the application.
  final List<InputUpdate> inputUpdates;

  /// The array of OutputUpdate objects describing the new destination streams
  /// used by the application.
  final List<OutputUpdate> outputUpdates;

  /// The array of ReferenceDataSourceUpdate objects describing the new
  /// reference data sources used by the application.
  final List<ReferenceDataSourceUpdate> referenceDataSourceUpdates;

  SqlApplicationConfigurationUpdate({
    this.inputUpdates,
    this.outputUpdates,
    this.referenceDataSourceUpdates,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes the starting parameters for an SQL-based Kinesis Data Analytics
/// application.
class SqlRunConfiguration {
  /// The input source ID. You can get this ID by calling the
  /// DescribeApplication operation.
  final String inputId;

  /// The point at which you want the application to start processing records
  /// from the streaming source.
  final InputStartingPositionConfiguration inputStartingPositionConfiguration;

  SqlRunConfiguration({
    @required this.inputId,
    @required this.inputStartingPositionConfiguration,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class StartApplicationResponse {
  StartApplicationResponse();
  static StartApplicationResponse fromJson(Map<String, dynamic> json) =>
      StartApplicationResponse();
}

class StopApplicationResponse {
  StopApplicationResponse();
  static StopApplicationResponse fromJson(Map<String, dynamic> json) =>
      StopApplicationResponse();
}

/// A key-value pair (the value is optional) that you can define and assign to
/// AWS resources. If you specify a tag that already exists, the tag value is
/// replaced with the value that you specify in the request. Note that the
/// maximum number of application tags includes system tags. The maximum number
/// of user-defined application tags is 50. For more information, see
/// [Using Cost Allocation Tags](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html)
/// in the _AWS Billing and Cost Management Guide_.
class Tag {
  /// The key of the key-value tag.
  final String key;

  /// The value of the key-value tag. The value is optional.
  final String value;

  Tag({
    @required this.key,
    this.value,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag(
        key: json['Key'] as String,
        value: json.containsKey('Value') ? json['Value'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class TagResourceResponse {
  TagResourceResponse();
  static TagResourceResponse fromJson(Map<String, dynamic> json) =>
      TagResourceResponse();
}

class UntagResourceResponse {
  UntagResourceResponse();
  static UntagResourceResponse fromJson(Map<String, dynamic> json) =>
      UntagResourceResponse();
}

class UpdateApplicationResponse {
  /// Describes application updates.
  final ApplicationDetail applicationDetail;

  UpdateApplicationResponse({
    @required this.applicationDetail,
  });
  static UpdateApplicationResponse fromJson(Map<String, dynamic> json) =>
      UpdateApplicationResponse(
        applicationDetail:
            ApplicationDetail.fromJson(json['ApplicationDetail']),
      );
}
