import 'package:meta/meta.dart';

/// Amazon Kinesis Analytics
///
///  **Overview**
///
///  This documentation is for version 1 of the Amazon Kinesis Data Analytics
/// API, which only supports SQL applications. Version 2 of the API supports SQL
/// and Java applications. For more information about version 2, see
/// [Amazon Kinesis Data Analytics API V2 Documentation](/kinesisanalytics/latest/apiv2/Welcome.html).
///
///
/// This is the _Amazon Kinesis Analytics v1 API Reference_. The Amazon Kinesis
/// Analytics Developer Guide provides additional information.
class KinesisAnalyticsApi {
  /// This documentation is for version 1 of the Amazon Kinesis Data Analytics
  /// API, which only supports SQL applications. Version 2 of the API supports
  /// SQL and Java applications. For more information about version 2, see
  /// [Amazon Kinesis Data Analytics API V2 Documentation](/kinesisanalytics/latest/apiv2/Welcome.html).
  ///
  ///
  /// Adds a CloudWatch log stream to monitor application configuration errors.
  /// For more information about using CloudWatch log streams with Amazon
  /// Kinesis Analytics applications, see
  /// [Working with Amazon CloudWatch Logs](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/cloudwatch-logs.html).
  ///
  /// [applicationName]: The Kinesis Analytics application name.
  ///
  /// [currentApplicationVersionId]: The version ID of the Kinesis Analytics
  /// application.
  ///
  /// [cloudWatchLoggingOption]: Provides the CloudWatch log stream Amazon
  /// Resource Name (ARN) and the IAM role ARN. Note: To write application
  /// messages to CloudWatch, the IAM role that is used must have the
  /// `PutLogEvents` policy action enabled.
  Future<AddApplicationCloudWatchLoggingOptionResponse>
      addApplicationCloudWatchLoggingOption(
          {@required String applicationName,
          @required BigInt currentApplicationVersionId,
          @required CloudWatchLoggingOption cloudWatchLoggingOption}) async {
    return AddApplicationCloudWatchLoggingOptionResponse.fromJson({});
  }

  /// This documentation is for version 1 of the Amazon Kinesis Data Analytics
  /// API, which only supports SQL applications. Version 2 of the API supports
  /// SQL and Java applications. For more information about version 2, see
  /// [Amazon Kinesis Data Analytics API V2 Documentation](/kinesisanalytics/latest/apiv2/Welcome.html).
  ///
  ///
  ///  Adds a streaming source to your Amazon Kinesis application. For
  /// conceptual information, see
  /// [Configuring Application Input](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-input.html).
  ///
  /// You can add a streaming source either when you create an application or
  /// you can use this operation to add a streaming source after you create an
  /// application. For more information, see
  /// [CreateApplication](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_CreateApplication.html).
  ///
  /// Any configuration update, including adding a streaming source using this
  /// operation, results in a new version of the application. You can use the
  /// [DescribeApplication](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html)
  /// operation to find the current application version.
  ///
  /// This operation requires permissions to perform the
  /// `kinesisanalytics:AddApplicationInput` action.
  ///
  /// [applicationName]: Name of your existing Amazon Kinesis Analytics
  /// application to which you want to add the streaming source.
  ///
  /// [currentApplicationVersionId]: Current version of your Amazon Kinesis
  /// Analytics application. You can use the
  /// [DescribeApplication](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html)
  /// operation to find the current application version.
  ///
  /// [input]: The
  /// [Input](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_Input.html)
  /// to add.
  Future<AddApplicationInputResponse> addApplicationInput(
      {@required String applicationName,
      @required BigInt currentApplicationVersionId,
      @required Input input}) async {
    return AddApplicationInputResponse.fromJson({});
  }

  /// This documentation is for version 1 of the Amazon Kinesis Data Analytics
  /// API, which only supports SQL applications. Version 2 of the API supports
  /// SQL and Java applications. For more information about version 2, see
  /// [Amazon Kinesis Data Analytics API V2 Documentation](/kinesisanalytics/latest/apiv2/Welcome.html).
  ///
  ///
  /// Adds an
  /// [InputProcessingConfiguration](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_InputProcessingConfiguration.html)
  /// to an application. An input processor preprocesses records on the input
  /// stream before the application's SQL code executes. Currently, the only
  /// input processor available is
  /// [AWS Lambda](https://docs.aws.amazon.com/lambda/).
  ///
  /// [applicationName]: Name of the application to which you want to add the
  /// input processing configuration.
  ///
  /// [currentApplicationVersionId]: Version of the application to which you
  /// want to add the input processing configuration. You can use the
  /// [DescribeApplication](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html)
  /// operation to get the current application version. If the version specified
  /// is not the current version, the `ConcurrentModificationException` is
  /// returned.
  ///
  /// [inputId]: The ID of the input configuration to add the input processing
  /// configuration to. You can get a list of the input IDs for an application
  /// using the
  /// [DescribeApplication](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html)
  /// operation.
  ///
  /// [inputProcessingConfiguration]: The
  /// [InputProcessingConfiguration](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_InputProcessingConfiguration.html)
  /// to add to the application.
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
    return AddApplicationInputProcessingConfigurationResponse.fromJson({});
  }

  /// This documentation is for version 1 of the Amazon Kinesis Data Analytics
  /// API, which only supports SQL applications. Version 2 of the API supports
  /// SQL and Java applications. For more information about version 2, see
  /// [Amazon Kinesis Data Analytics API V2 Documentation](/kinesisanalytics/latest/apiv2/Welcome.html).
  ///
  ///
  /// Adds an external destination to your Amazon Kinesis Analytics application.
  ///
  /// If you want Amazon Kinesis Analytics to deliver data from an
  /// in-application stream within your application to an external destination
  /// (such as an Amazon Kinesis stream, an Amazon Kinesis Firehose delivery
  /// stream, or an AWS Lambda function), you add the relevant configuration to
  /// your application using this operation. You can configure one or more
  /// outputs for your application. Each output configuration maps an
  /// in-application stream and an external destination.
  ///
  ///  You can use one of the output configurations to deliver data from your
  /// in-application error stream to an external destination so that you can
  /// analyze the errors. For more information, see
  /// [Understanding Application Output (Destination)](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-output.html).
  ///
  ///  Any configuration update, including adding a streaming source using this
  /// operation, results in a new version of the application. You can use the
  /// [DescribeApplication](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html)
  /// operation to find the current application version.
  ///
  /// For the limits on the number of application inputs and outputs you can
  /// configure, see
  /// [Limits](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/limits.html).
  ///
  /// This operation requires permissions to perform the
  /// `kinesisanalytics:AddApplicationOutput` action.
  ///
  /// [applicationName]: Name of the application to which you want to add the
  /// output configuration.
  ///
  /// [currentApplicationVersionId]: Version of the application to which you
  /// want to add the output configuration. You can use the
  /// [DescribeApplication](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html)
  /// operation to get the current application version. If the version specified
  /// is not the current version, the `ConcurrentModificationException` is
  /// returned.
  ///
  /// [output]: An array of objects, each describing one output configuration.
  /// In the output configuration, you specify the name of an in-application
  /// stream, a destination (that is, an Amazon Kinesis stream, an Amazon
  /// Kinesis Firehose delivery stream, or an AWS Lambda function), and record
  /// the formation to use when writing to the destination.
  Future<AddApplicationOutputResponse> addApplicationOutput(
      {@required String applicationName,
      @required BigInt currentApplicationVersionId,
      @required Output output}) async {
    return AddApplicationOutputResponse.fromJson({});
  }

  /// This documentation is for version 1 of the Amazon Kinesis Data Analytics
  /// API, which only supports SQL applications. Version 2 of the API supports
  /// SQL and Java applications. For more information about version 2, see
  /// [Amazon Kinesis Data Analytics API V2 Documentation](/kinesisanalytics/latest/apiv2/Welcome.html).
  ///
  ///
  /// Adds a reference data source to an existing application.
  ///
  /// Amazon Kinesis Analytics reads reference data (that is, an Amazon S3
  /// object) and creates an in-application table within your application. In
  /// the request, you provide the source (S3 bucket name and object key name),
  /// name of the in-application table to create, and the necessary mapping
  /// information that describes how data in Amazon S3 object maps to columns in
  /// the resulting in-application table.
  ///
  ///  For conceptual information, see
  /// [Configuring Application Input](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-input.html).
  /// For the limits on data sources you can add to your application, see
  /// [Limits](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/limits.html).
  ///
  ///  This operation requires permissions to perform the
  /// `kinesisanalytics:AddApplicationOutput` action.
  ///
  /// [applicationName]: Name of an existing application.
  ///
  /// [currentApplicationVersionId]: Version of the application for which you
  /// are adding the reference data source. You can use the
  /// [DescribeApplication](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html)
  /// operation to get the current application version. If the version specified
  /// is not the current version, the `ConcurrentModificationException` is
  /// returned.
  ///
  /// [referenceDataSource]: The reference data source can be an object in your
  /// Amazon S3 bucket. Amazon Kinesis Analytics reads the object and copies the
  /// data into the in-application table that is created. You provide an S3
  /// bucket, object key name, and the resulting in-application table that is
  /// created. You must also provide an IAM role with the necessary permissions
  /// that Amazon Kinesis Analytics can assume to read the object from your S3
  /// bucket on your behalf.
  Future<AddApplicationReferenceDataSourceResponse>
      addApplicationReferenceDataSource(
          {@required String applicationName,
          @required BigInt currentApplicationVersionId,
          @required ReferenceDataSource referenceDataSource}) async {
    return AddApplicationReferenceDataSourceResponse.fromJson({});
  }

  /// This documentation is for version 1 of the Amazon Kinesis Data Analytics
  /// API, which only supports SQL applications. Version 2 of the API supports
  /// SQL and Java applications. For more information about version 2, see
  /// [Amazon Kinesis Data Analytics API V2 Documentation](/kinesisanalytics/latest/apiv2/Welcome.html).
  ///
  ///
  ///  Creates an Amazon Kinesis Analytics application. You can configure each
  /// application with one streaming source as input, application code to
  /// process the input, and up to three destinations where you want Amazon
  /// Kinesis Analytics to write the output data from your application. For an
  /// overview, see
  /// [How it Works](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works.html).
  ///
  /// In the input configuration, you map the streaming source to an
  /// in-application stream, which you can think of as a constantly updating
  /// table. In the mapping, you must provide a schema for the in-application
  /// stream and map each data column in the in-application stream to a data
  /// element in the streaming source.
  ///
  /// Your application code is one or more SQL statements that read input data,
  /// transform it, and generate output. Your application code can create one or
  /// more SQL artifacts like SQL streams or pumps.
  ///
  /// In the output configuration, you can configure the application to write
  /// data from in-application streams created in your applications to up to
  /// three destinations.
  ///
  ///  To read data from your source stream or write data to destination
  /// streams, Amazon Kinesis Analytics needs your permissions. You grant these
  /// permissions by creating IAM roles. This operation requires permissions to
  /// perform the `kinesisanalytics:CreateApplication` action.
  ///
  ///  For introductory exercises to create an Amazon Kinesis Analytics
  /// application, see
  /// [Getting Started](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/getting-started.html).
  ///
  /// [applicationName]: Name of your Amazon Kinesis Analytics application (for
  /// example, `sample-app`).
  ///
  /// [applicationDescription]: Summary description of the application.
  ///
  /// [inputs]: Use this parameter to configure the application input.
  ///
  /// You can configure your application to receive input from a single
  /// streaming source. In this configuration, you map this streaming source to
  /// an in-application stream that is created. Your application code can then
  /// query the in-application stream like a table (you can think of it as a
  /// constantly updating table).
  ///
  /// For the streaming source, you provide its Amazon Resource Name (ARN) and
  /// format of data on the stream (for example, JSON, CSV, etc.). You also must
  /// provide an IAM role that Amazon Kinesis Analytics can assume to read this
  /// stream on your behalf.
  ///
  /// To create the in-application stream, you need to specify a schema to
  /// transform your data into a schematized version used in SQL. In the schema,
  /// you provide the necessary mapping of the data elements in the streaming
  /// source to record columns in the in-app stream.
  ///
  /// [outputs]: You can configure application output to write data from any of
  /// the in-application streams to up to three destinations.
  ///
  /// These destinations can be Amazon Kinesis streams, Amazon Kinesis Firehose
  /// delivery streams, AWS Lambda destinations, or any combination of the
  /// three.
  ///
  /// In the configuration, you specify the in-application stream name, the
  /// destination stream or Lambda function Amazon Resource Name (ARN), and the
  /// format to use when writing data. You must also provide an IAM role that
  /// Amazon Kinesis Analytics can assume to write to the destination stream or
  /// Lambda function on your behalf.
  ///
  /// In the output configuration, you also provide the output stream or Lambda
  /// function ARN. For stream destinations, you provide the format of data in
  /// the stream (for example, JSON, CSV). You also must provide an IAM role
  /// that Amazon Kinesis Analytics can assume to write to the stream or Lambda
  /// function on your behalf.
  ///
  /// [cloudWatchLoggingOptions]: Use this parameter to configure a CloudWatch
  /// log stream to monitor application configuration errors. For more
  /// information, see
  /// [Working with Amazon CloudWatch Logs](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/cloudwatch-logs.html).
  ///
  /// [applicationCode]: One or more SQL statements that read input data,
  /// transform it, and generate output. For example, you can write a SQL
  /// statement that reads data from one in-application stream, generates a
  /// running average of the number of advertisement clicks by vendor, and
  /// insert resulting rows in another in-application stream using pumps. For
  /// more information about the typical pattern, see
  /// [Application Code](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-app-code.html).
  ///
  /// You can provide such series of SQL statements, where output of one
  /// statement can be used as the input for the next statement. You store
  /// intermediate results by creating in-application streams and pumps.
  ///
  /// Note that the application code must create the streams with names
  /// specified in the `Outputs`. For example, if your `Outputs` defines output
  /// streams named `ExampleOutputStream1` and `ExampleOutputStream2`, then your
  /// application code must create these streams.
  ///
  /// [tags]: A list of one or more tags to assign to the application. A tag is
  /// a key-value pair that identifies an application. Note that the maximum
  /// number of application tags includes system tags. The maximum number of
  /// user-defined application tags is 50. For more information, see
  /// [Using Tagging](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-tagging.html).
  Future<CreateApplicationResponse> createApplication(String applicationName,
      {String applicationDescription,
      List<Input> inputs,
      List<Output> outputs,
      List<CloudWatchLoggingOption> cloudWatchLoggingOptions,
      String applicationCode,
      List<Tag> tags}) async {
    return CreateApplicationResponse.fromJson({});
  }

  /// This documentation is for version 1 of the Amazon Kinesis Data Analytics
  /// API, which only supports SQL applications. Version 2 of the API supports
  /// SQL and Java applications. For more information about version 2, see
  /// [Amazon Kinesis Data Analytics API V2 Documentation](/kinesisanalytics/latest/apiv2/Welcome.html).
  ///
  ///
  /// Deletes the specified application. Amazon Kinesis Analytics halts
  /// application execution and deletes the application, including any
  /// application artifacts (such as in-application streams, reference table,
  /// and application code).
  ///
  /// This operation requires permissions to perform the
  /// `kinesisanalytics:DeleteApplication` action.
  ///
  /// [applicationName]: Name of the Amazon Kinesis Analytics application to
  /// delete.
  ///
  /// [createTimestamp]:  You can use the `DescribeApplication` operation to get
  /// this value.
  Future<DeleteApplicationResponse> deleteApplication(
      {@required String applicationName,
      @required DateTime createTimestamp}) async {
    return DeleteApplicationResponse.fromJson({});
  }

  /// This documentation is for version 1 of the Amazon Kinesis Data Analytics
  /// API, which only supports SQL applications. Version 2 of the API supports
  /// SQL and Java applications. For more information about version 2, see
  /// [Amazon Kinesis Data Analytics API V2 Documentation](/kinesisanalytics/latest/apiv2/Welcome.html).
  ///
  ///
  /// Deletes a CloudWatch log stream from an application. For more information
  /// about using CloudWatch log streams with Amazon Kinesis Analytics
  /// applications, see
  /// [Working with Amazon CloudWatch Logs](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/cloudwatch-logs.html).
  ///
  /// [applicationName]: The Kinesis Analytics application name.
  ///
  /// [currentApplicationVersionId]: The version ID of the Kinesis Analytics
  /// application.
  ///
  /// [cloudWatchLoggingOptionId]: The `CloudWatchLoggingOptionId` of the
  /// CloudWatch logging option to delete. You can get the
  /// `CloudWatchLoggingOptionId` by using the
  /// [DescribeApplication](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html)
  /// operation.
  Future<DeleteApplicationCloudWatchLoggingOptionResponse>
      deleteApplicationCloudWatchLoggingOption(
          {@required String applicationName,
          @required BigInt currentApplicationVersionId,
          @required String cloudWatchLoggingOptionId}) async {
    return DeleteApplicationCloudWatchLoggingOptionResponse.fromJson({});
  }

  /// This documentation is for version 1 of the Amazon Kinesis Data Analytics
  /// API, which only supports SQL applications. Version 2 of the API supports
  /// SQL and Java applications. For more information about version 2, see
  /// [Amazon Kinesis Data Analytics API V2 Documentation](/kinesisanalytics/latest/apiv2/Welcome.html).
  ///
  ///
  /// Deletes an
  /// [InputProcessingConfiguration](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_InputProcessingConfiguration.html)
  /// from an input.
  ///
  /// [applicationName]: The Kinesis Analytics application name.
  ///
  /// [currentApplicationVersionId]: The version ID of the Kinesis Analytics
  /// application.
  ///
  /// [inputId]: The ID of the input configuration from which to delete the
  /// input processing configuration. You can get a list of the input IDs for an
  /// application by using the
  /// [DescribeApplication](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html)
  /// operation.
  Future<DeleteApplicationInputProcessingConfigurationResponse>
      deleteApplicationInputProcessingConfiguration(
          {@required String applicationName,
          @required BigInt currentApplicationVersionId,
          @required String inputId}) async {
    return DeleteApplicationInputProcessingConfigurationResponse.fromJson({});
  }

  /// This documentation is for version 1 of the Amazon Kinesis Data Analytics
  /// API, which only supports SQL applications. Version 2 of the API supports
  /// SQL and Java applications. For more information about version 2, see
  /// [Amazon Kinesis Data Analytics API V2 Documentation](/kinesisanalytics/latest/apiv2/Welcome.html).
  ///
  ///
  /// Deletes output destination configuration from your application
  /// configuration. Amazon Kinesis Analytics will no longer write data from the
  /// corresponding in-application stream to the external output destination.
  ///
  /// This operation requires permissions to perform the
  /// `kinesisanalytics:DeleteApplicationOutput` action.
  ///
  /// [applicationName]: Amazon Kinesis Analytics application name.
  ///
  /// [currentApplicationVersionId]: Amazon Kinesis Analytics application
  /// version. You can use the
  /// [DescribeApplication](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html)
  /// operation to get the current application version. If the version specified
  /// is not the current version, the `ConcurrentModificationException` is
  /// returned.
  ///
  /// [outputId]: The ID of the configuration to delete. Each output
  /// configuration that is added to the application, either when the
  /// application is created or later using the
  /// [AddApplicationOutput](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_AddApplicationOutput.html)
  /// operation, has a unique ID. You need to provide the ID to uniquely
  /// identify the output configuration that you want to delete from the
  /// application configuration. You can use the
  /// [DescribeApplication](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html)
  /// operation to get the specific `OutputId`.
  Future<DeleteApplicationOutputResponse> deleteApplicationOutput(
      {@required String applicationName,
      @required BigInt currentApplicationVersionId,
      @required String outputId}) async {
    return DeleteApplicationOutputResponse.fromJson({});
  }

  /// This documentation is for version 1 of the Amazon Kinesis Data Analytics
  /// API, which only supports SQL applications. Version 2 of the API supports
  /// SQL and Java applications. For more information about version 2, see
  /// [Amazon Kinesis Data Analytics API V2 Documentation](/kinesisanalytics/latest/apiv2/Welcome.html).
  ///
  ///
  /// Deletes a reference data source configuration from the specified
  /// application configuration.
  ///
  /// If the application is running, Amazon Kinesis Analytics immediately
  /// removes the in-application table that you created using the
  /// [AddApplicationReferenceDataSource](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_AddApplicationReferenceDataSource.html)
  /// operation.
  ///
  /// This operation requires permissions to perform the
  /// `kinesisanalytics.DeleteApplicationReferenceDataSource` action.
  ///
  /// [applicationName]: Name of an existing application.
  ///
  /// [currentApplicationVersionId]: Version of the application. You can use the
  /// [DescribeApplication](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html)
  /// operation to get the current application version. If the version specified
  /// is not the current version, the `ConcurrentModificationException` is
  /// returned.
  ///
  /// [referenceId]: ID of the reference data source. When you add a reference
  /// data source to your application using the
  /// [AddApplicationReferenceDataSource](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_AddApplicationReferenceDataSource.html),
  /// Amazon Kinesis Analytics assigns an ID. You can use the
  /// [DescribeApplication](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html)
  /// operation to get the reference ID.
  Future<DeleteApplicationReferenceDataSourceResponse>
      deleteApplicationReferenceDataSource(
          {@required String applicationName,
          @required BigInt currentApplicationVersionId,
          @required String referenceId}) async {
    return DeleteApplicationReferenceDataSourceResponse.fromJson({});
  }

  /// This documentation is for version 1 of the Amazon Kinesis Data Analytics
  /// API, which only supports SQL applications. Version 2 of the API supports
  /// SQL and Java applications. For more information about version 2, see
  /// [Amazon Kinesis Data Analytics API V2 Documentation](/kinesisanalytics/latest/apiv2/Welcome.html).
  ///
  ///
  /// Returns information about a specific Amazon Kinesis Analytics application.
  ///
  /// If you want to retrieve a list of all applications in your account, use
  /// the
  /// [ListApplications](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_ListApplications.html)
  /// operation.
  ///
  /// This operation requires permissions to perform the
  /// `kinesisanalytics:DescribeApplication` action. You can use
  /// `DescribeApplication` to get the current application versionId, which you
  /// need to call other operations such as `Update`.
  ///
  /// [applicationName]: Name of the application.
  Future<DescribeApplicationResponse> describeApplication(
      String applicationName) async {
    return DescribeApplicationResponse.fromJson({});
  }

  /// This documentation is for version 1 of the Amazon Kinesis Data Analytics
  /// API, which only supports SQL applications. Version 2 of the API supports
  /// SQL and Java applications. For more information about version 2, see
  /// [Amazon Kinesis Data Analytics API V2 Documentation](/kinesisanalytics/latest/apiv2/Welcome.html).
  ///
  ///
  /// Infers a schema by evaluating sample records on the specified streaming
  /// source (Amazon Kinesis stream or Amazon Kinesis Firehose delivery stream)
  /// or S3 object. In the response, the operation returns the inferred schema
  /// and also the sample records that the operation used to infer the schema.
  ///
  ///  You can use the inferred schema when configuring a streaming source for
  /// your application. For conceptual information, see
  /// [Configuring Application Input](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-input.html).
  /// Note that when you create an application using the Amazon Kinesis
  /// Analytics console, the console uses this operation to infer a schema and
  /// show it in the console user interface.
  ///
  ///  This operation requires permissions to perform the
  /// `kinesisanalytics:DiscoverInputSchema` action.
  ///
  /// [resourceArn]: Amazon Resource Name (ARN) of the streaming source.
  ///
  /// [roleArn]: ARN of the IAM role that Amazon Kinesis Analytics can assume to
  /// access the stream on your behalf.
  ///
  /// [inputStartingPositionConfiguration]: Point at which you want Amazon
  /// Kinesis Analytics to start reading records from the specified streaming
  /// source discovery purposes.
  ///
  /// [s3Configuration]: Specify this parameter to discover a schema from data
  /// in an Amazon S3 object.
  ///
  /// [inputProcessingConfiguration]: The
  /// [InputProcessingConfiguration](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_InputProcessingConfiguration.html)
  /// to use to preprocess the records before discovering the schema of the
  /// records.
  Future<DiscoverInputSchemaResponse> discoverInputSchema(
      {String resourceArn,
      String roleArn,
      InputStartingPositionConfiguration inputStartingPositionConfiguration,
      S3Configuration s3Configuration,
      InputProcessingConfiguration inputProcessingConfiguration}) async {
    return DiscoverInputSchemaResponse.fromJson({});
  }

  /// This documentation is for version 1 of the Amazon Kinesis Data Analytics
  /// API, which only supports SQL applications. Version 2 of the API supports
  /// SQL and Java applications. For more information about version 2, see
  /// [Amazon Kinesis Data Analytics API V2 Documentation](/kinesisanalytics/latest/apiv2/Welcome.html).
  ///
  ///
  /// Returns a list of Amazon Kinesis Analytics applications in your account.
  /// For each application, the response includes the application name, Amazon
  /// Resource Name (ARN), and status. If the response returns the
  /// `HasMoreApplications` value as true, you can send another request by
  /// adding the `ExclusiveStartApplicationName` in the request body, and set
  /// the value of this to the last application name from the previous response.
  ///
  /// If you want detailed information about a specific application, use
  /// [DescribeApplication](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html).
  ///
  /// This operation requires permissions to perform the
  /// `kinesisanalytics:ListApplications` action.
  ///
  /// [limit]: Maximum number of applications to list.
  ///
  /// [exclusiveStartApplicationName]: Name of the application to start the list
  /// with. When using pagination to retrieve the list, you don't need to
  /// specify this parameter in the first request. However, in subsequent
  /// requests, you add the last application name from the previous response to
  /// get the next page of applications.
  Future<ListApplicationsResponse> listApplications(
      {int limit, String exclusiveStartApplicationName}) async {
    return ListApplicationsResponse.fromJson({});
  }

  /// Retrieves the list of key-value tags assigned to the application. For more
  /// information, see
  /// [Using Tagging](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-tagging.html).
  ///
  /// [resourceArn]: The ARN of the application for which to retrieve tags.
  Future<ListTagsForResourceResponse> listTagsForResource(
      String resourceArn) async {
    return ListTagsForResourceResponse.fromJson({});
  }

  /// This documentation is for version 1 of the Amazon Kinesis Data Analytics
  /// API, which only supports SQL applications. Version 2 of the API supports
  /// SQL and Java applications. For more information about version 2, see
  /// [Amazon Kinesis Data Analytics API V2 Documentation](/kinesisanalytics/latest/apiv2/Welcome.html).
  ///
  ///
  /// Starts the specified Amazon Kinesis Analytics application. After creating
  /// an application, you must exclusively call this operation to start your
  /// application.
  ///
  /// After the application starts, it begins consuming the input data,
  /// processes it, and writes the output to the configured destination.
  ///
  ///  The application status must be `READY` for you to start an application.
  /// You can get the application status in the console or using the
  /// [DescribeApplication](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html)
  /// operation.
  ///
  /// After you start the application, you can stop the application from
  /// processing the input by calling the
  /// [StopApplication](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_StopApplication.html)
  /// operation.
  ///
  /// This operation requires permissions to perform the
  /// `kinesisanalytics:StartApplication` action.
  ///
  /// [applicationName]: Name of the application.
  ///
  /// [inputConfigurations]: Identifies the specific input, by ID, that the
  /// application starts consuming. Amazon Kinesis Analytics starts reading the
  /// streaming source associated with the input. You can also specify where in
  /// the streaming source you want Amazon Kinesis Analytics to start reading.
  Future<StartApplicationResponse> startApplication(
      {@required String applicationName,
      @required List<InputConfiguration> inputConfigurations}) async {
    return StartApplicationResponse.fromJson({});
  }

  /// This documentation is for version 1 of the Amazon Kinesis Data Analytics
  /// API, which only supports SQL applications. Version 2 of the API supports
  /// SQL and Java applications. For more information about version 2, see
  /// [Amazon Kinesis Data Analytics API V2 Documentation](/kinesisanalytics/latest/apiv2/Welcome.html).
  ///
  ///
  /// Stops the application from processing input data. You can stop an
  /// application only if it is in the running state. You can use the
  /// [DescribeApplication](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html)
  /// operation to find the application state. After the application is stopped,
  /// Amazon Kinesis Analytics stops reading data from the input, the
  /// application stops processing data, and there is no output written to the
  /// destination.
  ///
  /// This operation requires permissions to perform the
  /// `kinesisanalytics:StopApplication` action.
  ///
  /// [applicationName]: Name of the running application to stop.
  Future<StopApplicationResponse> stopApplication(
      String applicationName) async {
    return StopApplicationResponse.fromJson({});
  }

  /// Adds one or more key-value tags to a Kinesis Analytics application. Note
  /// that the maximum number of application tags includes system tags. The
  /// maximum number of user-defined application tags is 50. For more
  /// information, see
  /// [Using Tagging](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-tagging.html).
  ///
  /// [resourceArn]: The ARN of the application to assign the tags.
  ///
  /// [tags]: The key-value tags to assign to the application.
  Future<TagResourceResponse> tagResource(
      {@required String resourceArn, @required List<Tag> tags}) async {
    return TagResourceResponse.fromJson({});
  }

  /// Removes one or more tags from a Kinesis Analytics application. For more
  /// information, see
  /// [Using Tagging](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-tagging.html).
  ///
  /// [resourceArn]: The ARN of the Kinesis Analytics application from which to
  /// remove the tags.
  ///
  /// [tagKeys]: A list of keys of tags to remove from the specified
  /// application.
  Future<UntagResourceResponse> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {
    return UntagResourceResponse.fromJson({});
  }

  /// This documentation is for version 1 of the Amazon Kinesis Data Analytics
  /// API, which only supports SQL applications. Version 2 of the API supports
  /// SQL and Java applications. For more information about version 2, see
  /// [Amazon Kinesis Data Analytics API V2 Documentation](/kinesisanalytics/latest/apiv2/Welcome.html).
  ///
  ///
  /// Updates an existing Amazon Kinesis Analytics application. Using this API,
  /// you can update application code, input configuration, and output
  /// configuration.
  ///
  /// Note that Amazon Kinesis Analytics updates the
  /// `CurrentApplicationVersionId` each time you update your application.
  ///
  /// This operation requires permission for the
  /// `kinesisanalytics:UpdateApplication` action.
  ///
  /// [applicationName]: Name of the Amazon Kinesis Analytics application to
  /// update.
  ///
  /// [currentApplicationVersionId]: The current application version ID. You can
  /// use the
  /// [DescribeApplication](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html)
  /// operation to get this value.
  ///
  /// [applicationUpdate]: Describes application updates.
  Future<UpdateApplicationResponse> updateApplication(
      {@required String applicationName,
      @required BigInt currentApplicationVersionId,
      @required ApplicationUpdate applicationUpdate}) async {
    return UpdateApplicationResponse.fromJson({});
  }
}

class AddApplicationCloudWatchLoggingOptionResponse {
  AddApplicationCloudWatchLoggingOptionResponse();
  static AddApplicationCloudWatchLoggingOptionResponse fromJson(
          Map<String, dynamic> json) =>
      AddApplicationCloudWatchLoggingOptionResponse();
}

class AddApplicationInputProcessingConfigurationResponse {
  AddApplicationInputProcessingConfigurationResponse();
  static AddApplicationInputProcessingConfigurationResponse fromJson(
          Map<String, dynamic> json) =>
      AddApplicationInputProcessingConfigurationResponse();
}

class AddApplicationInputResponse {
  AddApplicationInputResponse();
  static AddApplicationInputResponse fromJson(Map<String, dynamic> json) =>
      AddApplicationInputResponse();
}

class AddApplicationOutputResponse {
  AddApplicationOutputResponse();
  static AddApplicationOutputResponse fromJson(Map<String, dynamic> json) =>
      AddApplicationOutputResponse();
}

class AddApplicationReferenceDataSourceResponse {
  AddApplicationReferenceDataSourceResponse();
  static AddApplicationReferenceDataSourceResponse fromJson(
          Map<String, dynamic> json) =>
      AddApplicationReferenceDataSourceResponse();
}

/// This documentation is for version 1 of the Amazon Kinesis Data Analytics
/// API, which only supports SQL applications. Version 2 of the API supports SQL
/// and Java applications. For more information about version 2, see
/// [Amazon Kinesis Data Analytics API V2 Documentation](/kinesisanalytics/latest/apiv2/Welcome.html).
///
///
/// Provides a description of the application, including the application Amazon
/// Resource Name (ARN), status, latest version, and input and output
/// configuration.
class ApplicationDetail {
  /// Name of the application.
  final String applicationName;

  /// Description of the application.
  final String applicationDescription;

  /// ARN of the application.
  final String applicationArn;

  /// Status of the application.
  final String applicationStatus;

  /// Time stamp when the application version was created.
  final DateTime createTimestamp;

  /// Time stamp when the application was last updated.
  final DateTime lastUpdateTimestamp;

  /// Describes the application input configuration. For more information, see
  /// [Configuring Application Input](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-input.html).
  final List<InputDescription> inputDescriptions;

  /// Describes the application output configuration. For more information, see
  /// [Configuring Application Output](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-output.html).
  final List<OutputDescription> outputDescriptions;

  /// Describes reference data sources configured for the application. For more
  /// information, see
  /// [Configuring Application Input](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-input.html).
  final List<ReferenceDataSourceDescription> referenceDataSourceDescriptions;

  /// Describes the CloudWatch log streams that are configured to receive
  /// application messages. For more information about using CloudWatch log
  /// streams with Amazon Kinesis Analytics applications, see
  /// [Working with Amazon CloudWatch Logs](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/cloudwatch-logs.html).
  final List<CloudWatchLoggingOptionDescription>
      cloudWatchLoggingOptionDescriptions;

  /// Returns the application code that you provided to perform data analysis on
  /// any of the in-application streams in your application.
  final String applicationCode;

  /// Provides the current application version.
  final BigInt applicationVersionId;

  ApplicationDetail({
    @required this.applicationName,
    this.applicationDescription,
    @required this.applicationArn,
    @required this.applicationStatus,
    this.createTimestamp,
    this.lastUpdateTimestamp,
    this.inputDescriptions,
    this.outputDescriptions,
    this.referenceDataSourceDescriptions,
    this.cloudWatchLoggingOptionDescriptions,
    this.applicationCode,
    @required this.applicationVersionId,
  });
  static ApplicationDetail fromJson(Map<String, dynamic> json) =>
      ApplicationDetail();
}

/// This documentation is for version 1 of the Amazon Kinesis Data Analytics
/// API, which only supports SQL applications. Version 2 of the API supports SQL
/// and Java applications. For more information about version 2, see
/// [Amazon Kinesis Data Analytics API V2 Documentation](/kinesisanalytics/latest/apiv2/Welcome.html).
///
///
/// Provides application summary information, including the application Amazon
/// Resource Name (ARN), name, and status.
class ApplicationSummary {
  /// Name of the application.
  final String applicationName;

  /// ARN of the application.
  final String applicationArn;

  /// Status of the application.
  final String applicationStatus;

  ApplicationSummary({
    @required this.applicationName,
    @required this.applicationArn,
    @required this.applicationStatus,
  });
  static ApplicationSummary fromJson(Map<String, dynamic> json) =>
      ApplicationSummary();
}

/// Describes updates to apply to an existing Amazon Kinesis Analytics
/// application.
class ApplicationUpdate {
  /// Describes application input configuration updates.
  final List<InputUpdate> inputUpdates;

  /// Describes application code updates.
  final String applicationCodeUpdate;

  /// Describes application output configuration updates.
  final List<OutputUpdate> outputUpdates;

  /// Describes application reference data source updates.
  final List<ReferenceDataSourceUpdate> referenceDataSourceUpdates;

  /// Describes application CloudWatch logging option updates.
  final List<CloudWatchLoggingOptionUpdate> cloudWatchLoggingOptionUpdates;

  ApplicationUpdate({
    this.inputUpdates,
    this.applicationCodeUpdate,
    this.outputUpdates,
    this.referenceDataSourceUpdates,
    this.cloudWatchLoggingOptionUpdates,
  });
}

/// Provides additional mapping information when the record format uses
/// delimiters, such as CSV. For example, the following sample records use CSV
/// format, where the records use the _'n'_ as the row delimiter and a comma
/// (",") as the column delimiter:
///
///  `"name1", "address1"`
///
///  `"name2", "address2"`
class CsvMappingParameters {
  /// Row delimiter. For example, in a CSV format, _'n'_ is the typical row
  /// delimiter.
  final String recordRowDelimiter;

  /// Column delimiter. For example, in a CSV format, a comma (",") is the
  /// typical column delimiter.
  final String recordColumnDelimiter;

  CsvMappingParameters({
    @required this.recordRowDelimiter,
    @required this.recordColumnDelimiter,
  });
  static CsvMappingParameters fromJson(Map<String, dynamic> json) =>
      CsvMappingParameters();
}

/// Provides a description of CloudWatch logging options, including the log
/// stream Amazon Resource Name (ARN) and the role ARN.
class CloudWatchLoggingOption {
  /// ARN of the CloudWatch log to receive application messages.
  final String logStreamArn;

  /// IAM ARN of the role to use to send application messages. Note: To write
  /// application messages to CloudWatch, the IAM role that is used must have
  /// the `PutLogEvents` policy action enabled.
  final String roleArn;

  CloudWatchLoggingOption({
    @required this.logStreamArn,
    @required this.roleArn,
  });
}

/// Description of the CloudWatch logging option.
class CloudWatchLoggingOptionDescription {
  /// ID of the CloudWatch logging option description.
  final String cloudWatchLoggingOptionId;

  /// ARN of the CloudWatch log to receive application messages.
  final String logStreamArn;

  /// IAM ARN of the role to use to send application messages. Note: To write
  /// application messages to CloudWatch, the IAM role used must have the
  /// `PutLogEvents` policy action enabled.
  final String roleArn;

  CloudWatchLoggingOptionDescription({
    this.cloudWatchLoggingOptionId,
    @required this.logStreamArn,
    @required this.roleArn,
  });
  static CloudWatchLoggingOptionDescription fromJson(
          Map<String, dynamic> json) =>
      CloudWatchLoggingOptionDescription();
}

/// Describes CloudWatch logging option updates.
class CloudWatchLoggingOptionUpdate {
  /// ID of the CloudWatch logging option to update
  final String cloudWatchLoggingOptionId;

  /// ARN of the CloudWatch log to receive application messages.
  final String logStreamArnUpdate;

  /// IAM ARN of the role to use to send application messages. Note: To write
  /// application messages to CloudWatch, the IAM role used must have the
  /// `PutLogEvents` policy action enabled.
  final String roleArnUpdate;

  CloudWatchLoggingOptionUpdate({
    @required this.cloudWatchLoggingOptionId,
    this.logStreamArnUpdate,
    this.roleArnUpdate,
  });
}

/// TBD
class CreateApplicationResponse {
  /// In response to your `CreateApplication` request, Amazon Kinesis Analytics
  /// returns a response with a summary of the application it created, including
  /// the application Amazon Resource Name (ARN), name, and status.
  final ApplicationSummary applicationSummary;

  CreateApplicationResponse({
    @required this.applicationSummary,
  });
  static CreateApplicationResponse fromJson(Map<String, dynamic> json) =>
      CreateApplicationResponse();
}

class DeleteApplicationCloudWatchLoggingOptionResponse {
  DeleteApplicationCloudWatchLoggingOptionResponse();
  static DeleteApplicationCloudWatchLoggingOptionResponse fromJson(
          Map<String, dynamic> json) =>
      DeleteApplicationCloudWatchLoggingOptionResponse();
}

class DeleteApplicationInputProcessingConfigurationResponse {
  DeleteApplicationInputProcessingConfigurationResponse();
  static DeleteApplicationInputProcessingConfigurationResponse fromJson(
          Map<String, dynamic> json) =>
      DeleteApplicationInputProcessingConfigurationResponse();
}

class DeleteApplicationOutputResponse {
  DeleteApplicationOutputResponse();
  static DeleteApplicationOutputResponse fromJson(Map<String, dynamic> json) =>
      DeleteApplicationOutputResponse();
}

class DeleteApplicationReferenceDataSourceResponse {
  DeleteApplicationReferenceDataSourceResponse();
  static DeleteApplicationReferenceDataSourceResponse fromJson(
          Map<String, dynamic> json) =>
      DeleteApplicationReferenceDataSourceResponse();
}

class DeleteApplicationResponse {
  DeleteApplicationResponse();
  static DeleteApplicationResponse fromJson(Map<String, dynamic> json) =>
      DeleteApplicationResponse();
}

class DescribeApplicationResponse {
  /// Provides a description of the application, such as the application Amazon
  /// Resource Name (ARN), status, latest version, and input and output
  /// configuration details.
  final ApplicationDetail applicationDetail;

  DescribeApplicationResponse({
    @required this.applicationDetail,
  });
  static DescribeApplicationResponse fromJson(Map<String, dynamic> json) =>
      DescribeApplicationResponse();
}

/// Describes the data format when records are written to the destination. For
/// more information, see
/// [Configuring Application Output](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-output.html).
class DestinationSchema {
  /// Specifies the format of the records on the output stream.
  final String recordFormatType;

  DestinationSchema({
    @required this.recordFormatType,
  });
  static DestinationSchema fromJson(Map<String, dynamic> json) =>
      DestinationSchema();
}

class DiscoverInputSchemaResponse {
  /// Schema inferred from the streaming source. It identifies the format of the
  /// data in the streaming source and how each data element maps to
  /// corresponding columns in the in-application stream that you can create.
  final SourceSchema inputSchema;

  /// An array of elements, where each element corresponds to a row in a stream
  /// record (a stream record can have more than one row).
  final List<List<String>> parsedInputRecords;

  /// Stream data that was modified by the processor specified in the
  /// `InputProcessingConfiguration` parameter.
  final List<String> processedInputRecords;

  /// Raw stream data that was sampled to infer the schema.
  final List<String> rawInputRecords;

  DiscoverInputSchemaResponse({
    this.inputSchema,
    this.parsedInputRecords,
    this.processedInputRecords,
    this.rawInputRecords,
  });
  static DiscoverInputSchemaResponse fromJson(Map<String, dynamic> json) =>
      DiscoverInputSchemaResponse();
}

/// When you configure the application input, you specify the streaming source,
/// the in-application stream name that is created, and the mapping between the
/// two. For more information, see
/// [Configuring Application Input](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-input.html).
class Input {
  /// Name prefix to use when creating an in-application stream. Suppose that
  /// you specify a prefix "MyInApplicationStream." Amazon Kinesis Analytics
  /// then creates one or more (as per the `InputParallelism` count you
  /// specified) in-application streams with names "MyInApplicationStream_001,"
  /// "MyInApplicationStream_002," and so on.
  final String namePrefix;

  /// The
  /// [InputProcessingConfiguration](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_InputProcessingConfiguration.html)
  /// for the input. An input processor transforms records as they are received
  /// from the stream, before the application's SQL code executes. Currently,
  /// the only input processing configuration available is
  /// [InputLambdaProcessor](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_InputLambdaProcessor.html).
  final InputProcessingConfiguration inputProcessingConfiguration;

  /// If the streaming source is an Amazon Kinesis stream, identifies the
  /// stream's Amazon Resource Name (ARN) and an IAM role that enables Amazon
  /// Kinesis Analytics to access the stream on your behalf.
  ///
  /// Note: Either `KinesisStreamsInput` or `KinesisFirehoseInput` is required.
  final KinesisStreamsInput kinesisStreamsInput;

  /// If the streaming source is an Amazon Kinesis Firehose delivery stream,
  /// identifies the delivery stream's ARN and an IAM role that enables Amazon
  /// Kinesis Analytics to access the stream on your behalf.
  ///
  /// Note: Either `KinesisStreamsInput` or `KinesisFirehoseInput` is required.
  final KinesisFirehoseInput kinesisFirehoseInput;

  /// Describes the number of in-application streams to create.
  ///
  /// Data from your source is routed to these in-application input streams.
  ///
  ///  (see
  /// [Configuring Application Input](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-input.html).
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
}

/// When you start your application, you provide this configuration, which
/// identifies the input source and the point in the input source at which you
/// want the application to start processing records.
class InputConfiguration {
  /// Input source ID. You can get this ID by calling the
  /// [DescribeApplication](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html)
  /// operation.
  final String id;

  /// Point at which you want the application to start processing records from
  /// the streaming source.
  final InputStartingPositionConfiguration inputStartingPositionConfiguration;

  InputConfiguration({
    @required this.id,
    @required this.inputStartingPositionConfiguration,
  });
}

/// Describes the application input configuration. For more information, see
/// [Configuring Application Input](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-input.html).
class InputDescription {
  /// Input ID associated with the application input. This is the ID that Amazon
  /// Kinesis Analytics assigns to each input configuration you add to your
  /// application.
  final String inputId;

  /// In-application name prefix.
  final String namePrefix;

  /// Returns the in-application stream names that are mapped to the stream
  /// source.
  final List<String> inAppStreamNames;

  /// The description of the preprocessor that executes on records in this input
  /// before the application's code is run.
  final InputProcessingConfigurationDescription
      inputProcessingConfigurationDescription;

  /// If an Amazon Kinesis stream is configured as streaming source, provides
  /// Amazon Kinesis stream's Amazon Resource Name (ARN) and an IAM role that
  /// enables Amazon Kinesis Analytics to access the stream on your behalf.
  final KinesisStreamsInputDescription kinesisStreamsInputDescription;

  /// If an Amazon Kinesis Firehose delivery stream is configured as a streaming
  /// source, provides the delivery stream's ARN and an IAM role that enables
  /// Amazon Kinesis Analytics to access the stream on your behalf.
  final KinesisFirehoseInputDescription kinesisFirehoseInputDescription;

  /// Describes the format of the data in the streaming source, and how each
  /// data element maps to corresponding columns in the in-application stream
  /// that is being created.
  final SourceSchema inputSchema;

  /// Describes the configured parallelism (number of in-application streams
  /// mapped to the streaming source).
  final InputParallelism inputParallelism;

  /// Point at which the application is configured to read from the input
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
      InputDescription();
}

/// An object that contains the Amazon Resource Name (ARN) of the
/// [AWS Lambda](https://docs.aws.amazon.com/lambda/) function that is used to
/// preprocess records in the stream, and the ARN of the IAM role that is used
/// to access the AWS Lambda function.
class InputLambdaProcessor {
  /// The ARN of the [AWS Lambda](https://docs.aws.amazon.com/lambda/) function
  /// that operates on records in the stream.
  ///
  ///
  ///
  /// To specify an earlier version of the Lambda function than the latest,
  /// include the Lambda function version in the Lambda function ARN. For more
  /// information about Lambda ARNs, see
  /// [Example ARNs: AWS Lambda](/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-lambda)
  final String resourceArn;

  /// The ARN of the IAM role that is used to access the AWS Lambda function.
  final String roleArn;

  InputLambdaProcessor({
    @required this.resourceArn,
    @required this.roleArn,
  });
}

/// An object that contains the Amazon Resource Name (ARN) of the
/// [AWS Lambda](https://docs.aws.amazon.com/lambda/) function that is used to
/// preprocess records in the stream, and the ARN of the IAM role that is used
/// to access the AWS Lambda expression.
class InputLambdaProcessorDescription {
  /// The ARN of the [AWS Lambda](https://docs.aws.amazon.com/lambda/) function
  /// that is used to preprocess the records in the stream.
  final String resourceArn;

  /// The ARN of the IAM role that is used to access the AWS Lambda function.
  final String roleArn;

  InputLambdaProcessorDescription({
    this.resourceArn,
    this.roleArn,
  });
  static InputLambdaProcessorDescription fromJson(Map<String, dynamic> json) =>
      InputLambdaProcessorDescription();
}

/// Represents an update to the
/// [InputLambdaProcessor](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_InputLambdaProcessor.html)
/// that is used to preprocess the records in the stream.
class InputLambdaProcessorUpdate {
  /// The Amazon Resource Name (ARN) of the new
  /// [AWS Lambda](https://docs.aws.amazon.com/lambda/) function that is used to
  /// preprocess the records in the stream.
  ///
  ///
  ///
  /// To specify an earlier version of the Lambda function than the latest,
  /// include the Lambda function version in the Lambda function ARN. For more
  /// information about Lambda ARNs, see
  /// [Example ARNs: AWS Lambda](/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-lambda)
  final String resourceArnUpdate;

  /// The ARN of the new IAM role that is used to access the AWS Lambda
  /// function.
  final String roleArnUpdate;

  InputLambdaProcessorUpdate({
    this.resourceArnUpdate,
    this.roleArnUpdate,
  });
}

/// Describes the number of in-application streams to create for a given
/// streaming source. For information about parallelism, see
/// [Configuring Application Input](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-input.html).
class InputParallelism {
  /// Number of in-application streams to create. For more information, see
  /// [Limits](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/limits.html).
  final int count;

  InputParallelism({
    this.count,
  });
  static InputParallelism fromJson(Map<String, dynamic> json) =>
      InputParallelism();
}

/// Provides updates to the parallelism count.
class InputParallelismUpdate {
  /// Number of in-application streams to create for the specified streaming
  /// source.
  final int countUpdate;

  InputParallelismUpdate({
    this.countUpdate,
  });
}

/// Provides a description of a processor that is used to preprocess the records
/// in the stream before being processed by your application code. Currently,
/// the only input processor available is
/// [AWS Lambda](https://docs.aws.amazon.com/lambda/).
class InputProcessingConfiguration {
  /// The
  /// [InputLambdaProcessor](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_InputLambdaProcessor.html)
  /// that is used to preprocess the records in the stream before being
  /// processed by your application code.
  final InputLambdaProcessor inputLambdaProcessor;

  InputProcessingConfiguration({
    @required this.inputLambdaProcessor,
  });
}

/// Provides configuration information about an input processor. Currently, the
/// only input processor available is
/// [AWS Lambda](https://docs.aws.amazon.com/lambda/).
class InputProcessingConfigurationDescription {
  /// Provides configuration information about the associated
  /// [InputLambdaProcessorDescription](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_InputLambdaProcessorDescription.html).
  final InputLambdaProcessorDescription inputLambdaProcessorDescription;

  InputProcessingConfigurationDescription({
    this.inputLambdaProcessorDescription,
  });
  static InputProcessingConfigurationDescription fromJson(
          Map<String, dynamic> json) =>
      InputProcessingConfigurationDescription();
}

/// Describes updates to an
/// [InputProcessingConfiguration](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_InputProcessingConfiguration.html).
class InputProcessingConfigurationUpdate {
  /// Provides update information for an
  /// [InputLambdaProcessor](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_InputLambdaProcessor.html).
  final InputLambdaProcessorUpdate inputLambdaProcessorUpdate;

  InputProcessingConfigurationUpdate({
    @required this.inputLambdaProcessorUpdate,
  });
}

/// Describes updates for the application's input schema.
class InputSchemaUpdate {
  /// Specifies the format of the records on the streaming source.
  final RecordFormat recordFormatUpdate;

  /// Specifies the encoding of the records in the streaming source. For
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
}

/// Describes the point at which the application reads from the streaming
/// source.
class InputStartingPositionConfiguration {
  /// The starting position on the stream.
  ///
  /// *    `NOW` - Start reading just after the most recent record in the
  /// stream, start at the request time stamp that the customer issued.
  ///
  /// *    `TRIM_HORIZON` - Start reading at the last untrimmed record in the
  /// stream, which is the oldest record available in the stream. This option is
  /// not available for an Amazon Kinesis Firehose delivery stream.
  ///
  /// *    `LAST_STOPPED_POINT` - Resume reading from where the application last
  /// stopped reading.
  final String inputStartingPosition;

  InputStartingPositionConfiguration({
    this.inputStartingPosition,
  });
  static InputStartingPositionConfiguration fromJson(
          Map<String, dynamic> json) =>
      InputStartingPositionConfiguration();
}

/// Describes updates to a specific input configuration (identified by the
/// `InputId` of an application).
class InputUpdate {
  /// Input ID of the application input to be updated.
  final String inputId;

  /// Name prefix for in-application streams that Amazon Kinesis Analytics
  /// creates for the specific streaming source.
  final String namePrefixUpdate;

  /// Describes updates for an input processing configuration.
  final InputProcessingConfigurationUpdate inputProcessingConfigurationUpdate;

  /// If an Amazon Kinesis stream is the streaming source to be updated,
  /// provides an updated stream Amazon Resource Name (ARN) and IAM role ARN.
  final KinesisStreamsInputUpdate kinesisStreamsInputUpdate;

  /// If an Amazon Kinesis Firehose delivery stream is the streaming source to
  /// be updated, provides an updated stream ARN and IAM role ARN.
  final KinesisFirehoseInputUpdate kinesisFirehoseInputUpdate;

  /// Describes the data format on the streaming source, and how record elements
  /// on the streaming source map to columns of the in-application stream that
  /// is created.
  final InputSchemaUpdate inputSchemaUpdate;

  /// Describes the parallelism updates (the number in-application streams
  /// Amazon Kinesis Analytics creates for the specific streaming source).
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
}

/// Provides additional mapping information when JSON is the record format on
/// the streaming source.
class JsonMappingParameters {
  /// Path to the top-level parent that contains the records.
  final String recordRowPath;

  JsonMappingParameters({
    @required this.recordRowPath,
  });
  static JsonMappingParameters fromJson(Map<String, dynamic> json) =>
      JsonMappingParameters();
}

///  Identifies an Amazon Kinesis Firehose delivery stream as the streaming
/// source. You provide the delivery stream's Amazon Resource Name (ARN) and an
/// IAM role ARN that enables Amazon Kinesis Analytics to access the stream on
/// your behalf.
class KinesisFirehoseInput {
  /// ARN of the input delivery stream.
  final String resourceArn;

  /// ARN of the IAM role that Amazon Kinesis Analytics can assume to access the
  /// stream on your behalf. You need to make sure that the role has the
  /// necessary permissions to access the stream.
  final String roleArn;

  KinesisFirehoseInput({
    @required this.resourceArn,
    @required this.roleArn,
  });
}

///  Describes the Amazon Kinesis Firehose delivery stream that is configured as
/// the streaming source in the application input configuration.
class KinesisFirehoseInputDescription {
  /// Amazon Resource Name (ARN) of the Amazon Kinesis Firehose delivery stream.
  final String resourceArn;

  /// ARN of the IAM role that Amazon Kinesis Analytics assumes to access the
  /// stream.
  final String roleArn;

  KinesisFirehoseInputDescription({
    this.resourceArn,
    this.roleArn,
  });
  static KinesisFirehoseInputDescription fromJson(Map<String, dynamic> json) =>
      KinesisFirehoseInputDescription();
}

/// When updating application input configuration, provides information about an
/// Amazon Kinesis Firehose delivery stream as the streaming source.
class KinesisFirehoseInputUpdate {
  /// Amazon Resource Name (ARN) of the input Amazon Kinesis Firehose delivery
  /// stream to read.
  final String resourceArnUpdate;

  /// ARN of the IAM role that Amazon Kinesis Analytics can assume to access the
  /// stream on your behalf. You need to grant the necessary permissions to this
  /// role.
  final String roleArnUpdate;

  KinesisFirehoseInputUpdate({
    this.resourceArnUpdate,
    this.roleArnUpdate,
  });
}

/// When configuring application output, identifies an Amazon Kinesis Firehose
/// delivery stream as the destination. You provide the stream Amazon Resource
/// Name (ARN) and an IAM role that enables Amazon Kinesis Analytics to write to
/// the stream on your behalf.
class KinesisFirehoseOutput {
  /// ARN of the destination Amazon Kinesis Firehose delivery stream to write
  /// to.
  final String resourceArn;

  /// ARN of the IAM role that Amazon Kinesis Analytics can assume to write to
  /// the destination stream on your behalf. You need to grant the necessary
  /// permissions to this role.
  final String roleArn;

  KinesisFirehoseOutput({
    @required this.resourceArn,
    @required this.roleArn,
  });
}

///  For an application output, describes the Amazon Kinesis Firehose delivery
/// stream configured as its destination.
class KinesisFirehoseOutputDescription {
  /// Amazon Resource Name (ARN) of the Amazon Kinesis Firehose delivery stream.
  final String resourceArn;

  /// ARN of the IAM role that Amazon Kinesis Analytics can assume to access the
  /// stream.
  final String roleArn;

  KinesisFirehoseOutputDescription({
    this.resourceArn,
    this.roleArn,
  });
  static KinesisFirehoseOutputDescription fromJson(Map<String, dynamic> json) =>
      KinesisFirehoseOutputDescription();
}

///  When updating an output configuration using the
/// [UpdateApplication](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_UpdateApplication.html)
/// operation, provides information about an Amazon Kinesis Firehose delivery
/// stream configured as the destination.
class KinesisFirehoseOutputUpdate {
  /// Amazon Resource Name (ARN) of the Amazon Kinesis Firehose delivery stream
  /// to write to.
  final String resourceArnUpdate;

  /// ARN of the IAM role that Amazon Kinesis Analytics can assume to access the
  /// stream on your behalf. You need to grant the necessary permissions to this
  /// role.
  final String roleArnUpdate;

  KinesisFirehoseOutputUpdate({
    this.resourceArnUpdate,
    this.roleArnUpdate,
  });
}

///  Identifies an Amazon Kinesis stream as the streaming source. You provide
/// the stream's Amazon Resource Name (ARN) and an IAM role ARN that enables
/// Amazon Kinesis Analytics to access the stream on your behalf.
class KinesisStreamsInput {
  /// ARN of the input Amazon Kinesis stream to read.
  final String resourceArn;

  /// ARN of the IAM role that Amazon Kinesis Analytics can assume to access the
  /// stream on your behalf. You need to grant the necessary permissions to this
  /// role.
  final String roleArn;

  KinesisStreamsInput({
    @required this.resourceArn,
    @required this.roleArn,
  });
}

///  Describes the Amazon Kinesis stream that is configured as the streaming
/// source in the application input configuration.
class KinesisStreamsInputDescription {
  /// Amazon Resource Name (ARN) of the Amazon Kinesis stream.
  final String resourceArn;

  /// ARN of the IAM role that Amazon Kinesis Analytics can assume to access the
  /// stream.
  final String roleArn;

  KinesisStreamsInputDescription({
    this.resourceArn,
    this.roleArn,
  });
  static KinesisStreamsInputDescription fromJson(Map<String, dynamic> json) =>
      KinesisStreamsInputDescription();
}

/// When updating application input configuration, provides information about an
/// Amazon Kinesis stream as the streaming source.
class KinesisStreamsInputUpdate {
  /// Amazon Resource Name (ARN) of the input Amazon Kinesis stream to read.
  final String resourceArnUpdate;

  /// ARN of the IAM role that Amazon Kinesis Analytics can assume to access the
  /// stream on your behalf. You need to grant the necessary permissions to this
  /// role.
  final String roleArnUpdate;

  KinesisStreamsInputUpdate({
    this.resourceArnUpdate,
    this.roleArnUpdate,
  });
}

/// When configuring application output, identifies an Amazon Kinesis stream as
/// the destination. You provide the stream Amazon Resource Name (ARN) and also
/// an IAM role ARN that Amazon Kinesis Analytics can use to write to the stream
/// on your behalf.
class KinesisStreamsOutput {
  /// ARN of the destination Amazon Kinesis stream to write to.
  final String resourceArn;

  /// ARN of the IAM role that Amazon Kinesis Analytics can assume to write to
  /// the destination stream on your behalf. You need to grant the necessary
  /// permissions to this role.
  final String roleArn;

  KinesisStreamsOutput({
    @required this.resourceArn,
    @required this.roleArn,
  });
}

///  For an application output, describes the Amazon Kinesis stream configured
/// as its destination.
class KinesisStreamsOutputDescription {
  /// Amazon Resource Name (ARN) of the Amazon Kinesis stream.
  final String resourceArn;

  /// ARN of the IAM role that Amazon Kinesis Analytics can assume to access the
  /// stream.
  final String roleArn;

  KinesisStreamsOutputDescription({
    this.resourceArn,
    this.roleArn,
  });
  static KinesisStreamsOutputDescription fromJson(Map<String, dynamic> json) =>
      KinesisStreamsOutputDescription();
}

///  When updating an output configuration using the
/// [UpdateApplication](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_UpdateApplication.html)
/// operation, provides information about an Amazon Kinesis stream configured as
/// the destination.
class KinesisStreamsOutputUpdate {
  /// Amazon Resource Name (ARN) of the Amazon Kinesis stream where you want to
  /// write the output.
  final String resourceArnUpdate;

  /// ARN of the IAM role that Amazon Kinesis Analytics can assume to access the
  /// stream on your behalf. You need to grant the necessary permissions to this
  /// role.
  final String roleArnUpdate;

  KinesisStreamsOutputUpdate({
    this.resourceArnUpdate,
    this.roleArnUpdate,
  });
}

/// When configuring application output, identifies an AWS Lambda function as
/// the destination. You provide the function Amazon Resource Name (ARN) and
/// also an IAM role ARN that Amazon Kinesis Analytics can use to write to the
/// function on your behalf.
class LambdaOutput {
  /// Amazon Resource Name (ARN) of the destination Lambda function to write to.
  ///
  ///
  ///
  /// To specify an earlier version of the Lambda function than the latest,
  /// include the Lambda function version in the Lambda function ARN. For more
  /// information about Lambda ARNs, see
  /// [Example ARNs: AWS Lambda](/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-lambda)
  final String resourceArn;

  /// ARN of the IAM role that Amazon Kinesis Analytics can assume to write to
  /// the destination function on your behalf. You need to grant the necessary
  /// permissions to this role.
  final String roleArn;

  LambdaOutput({
    @required this.resourceArn,
    @required this.roleArn,
  });
}

/// For an application output, describes the AWS Lambda function configured as
/// its destination.
class LambdaOutputDescription {
  /// Amazon Resource Name (ARN) of the destination Lambda function.
  final String resourceArn;

  /// ARN of the IAM role that Amazon Kinesis Analytics can assume to write to
  /// the destination function.
  final String roleArn;

  LambdaOutputDescription({
    this.resourceArn,
    this.roleArn,
  });
  static LambdaOutputDescription fromJson(Map<String, dynamic> json) =>
      LambdaOutputDescription();
}

/// When updating an output configuration using the
/// [UpdateApplication](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_UpdateApplication.html)
/// operation, provides information about an AWS Lambda function configured as
/// the destination.
class LambdaOutputUpdate {
  /// Amazon Resource Name (ARN) of the destination Lambda function.
  ///
  ///
  ///
  /// To specify an earlier version of the Lambda function than the latest,
  /// include the Lambda function version in the Lambda function ARN. For more
  /// information about Lambda ARNs, see
  /// [Example ARNs: AWS Lambda](/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-lambda)
  final String resourceArnUpdate;

  /// ARN of the IAM role that Amazon Kinesis Analytics can assume to write to
  /// the destination function on your behalf. You need to grant the necessary
  /// permissions to this role.
  final String roleArnUpdate;

  LambdaOutputUpdate({
    this.resourceArnUpdate,
    this.roleArnUpdate,
  });
}

class ListApplicationsResponse {
  /// List of `ApplicationSummary` objects.
  final List<ApplicationSummary> applicationSummaries;

  /// Returns true if there are more applications to retrieve.
  final bool hasMoreApplications;

  ListApplicationsResponse({
    @required this.applicationSummaries,
    @required this.hasMoreApplications,
  });
  static ListApplicationsResponse fromJson(Map<String, dynamic> json) =>
      ListApplicationsResponse();
}

class ListTagsForResourceResponse {
  /// The key-value tags assigned to the application.
  final List<Tag> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  static ListTagsForResourceResponse fromJson(Map<String, dynamic> json) =>
      ListTagsForResourceResponse();
}

/// When configuring application input at the time of creating or updating an
/// application, provides additional mapping information specific to the record
/// format (such as JSON, CSV, or record fields delimited by some delimiter) on
/// the streaming source.
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
      MappingParameters();
}

///  Describes application output configuration in which you identify an
/// in-application stream and a destination where you want the in-application
/// stream data to be written. The destination can be an Amazon Kinesis stream
/// or an Amazon Kinesis Firehose delivery stream.
///
/// For limits on how many destinations an application can write and other
/// limitations, see
/// [Limits](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/limits.html).
class Output {
  /// Name of the in-application stream.
  final String name;

  /// Identifies an Amazon Kinesis stream as the destination.
  final KinesisStreamsOutput kinesisStreamsOutput;

  /// Identifies an Amazon Kinesis Firehose delivery stream as the destination.
  final KinesisFirehoseOutput kinesisFirehoseOutput;

  /// Identifies an AWS Lambda function as the destination.
  final LambdaOutput lambdaOutput;

  /// Describes the data format when records are written to the destination. For
  /// more information, see
  /// [Configuring Application Output](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-output.html).
  final DestinationSchema destinationSchema;

  Output({
    @required this.name,
    this.kinesisStreamsOutput,
    this.kinesisFirehoseOutput,
    this.lambdaOutput,
    @required this.destinationSchema,
  });
}

/// Describes the application output configuration, which includes the
/// in-application stream name and the destination where the stream data is
/// written. The destination can be an Amazon Kinesis stream or an Amazon
/// Kinesis Firehose delivery stream.
class OutputDescription {
  /// A unique identifier for the output configuration.
  final String outputId;

  /// Name of the in-application stream configured as output.
  final String name;

  /// Describes Amazon Kinesis stream configured as the destination where output
  /// is written.
  final KinesisStreamsOutputDescription kinesisStreamsOutputDescription;

  /// Describes the Amazon Kinesis Firehose delivery stream configured as the
  /// destination where output is written.
  final KinesisFirehoseOutputDescription kinesisFirehoseOutputDescription;

  /// Describes the AWS Lambda function configured as the destination where
  /// output is written.
  final LambdaOutputDescription lambdaOutputDescription;

  /// Data format used for writing data to the destination.
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
      OutputDescription();
}

///  Describes updates to the output configuration identified by the `OutputId`.
class OutputUpdate {
  /// Identifies the specific output configuration that you want to update.
  final String outputId;

  /// If you want to specify a different in-application stream for this output
  /// configuration, use this field to specify the new in-application stream
  /// name.
  final String nameUpdate;

  /// Describes an Amazon Kinesis stream as the destination for the output.
  final KinesisStreamsOutputUpdate kinesisStreamsOutputUpdate;

  /// Describes an Amazon Kinesis Firehose delivery stream as the destination
  /// for the output.
  final KinesisFirehoseOutputUpdate kinesisFirehoseOutputUpdate;

  /// Describes an AWS Lambda function as the destination for the output.
  final LambdaOutputUpdate lambdaOutputUpdate;

  /// Describes the data format when records are written to the destination. For
  /// more information, see
  /// [Configuring Application Output](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-output.html).
  final DestinationSchema destinationSchemaUpdate;

  OutputUpdate({
    @required this.outputId,
    this.nameUpdate,
    this.kinesisStreamsOutputUpdate,
    this.kinesisFirehoseOutputUpdate,
    this.lambdaOutputUpdate,
    this.destinationSchemaUpdate,
  });
}

/// Describes the mapping of each data element in the streaming source to the
/// corresponding column in the in-application stream.
///
/// Also used to describe the format of the reference data source.
class RecordColumn {
  /// Name of the column created in the in-application input stream or reference
  /// table.
  final String name;

  /// Reference to the data element in the streaming input or the reference data
  /// source. This element is required if the
  /// [RecordFormatType](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_RecordFormat.html#analytics-Type-RecordFormat-RecordFormatTypel)
  /// is `JSON`.
  final String mapping;

  /// Type of column created in the in-application input stream or reference
  /// table.
  final String sqlType;

  RecordColumn({
    @required this.name,
    this.mapping,
    @required this.sqlType,
  });
  static RecordColumn fromJson(Map<String, dynamic> json) => RecordColumn();
}

///  Describes the record format and relevant mapping information that should be
/// applied to schematize the records on the stream.
class RecordFormat {
  /// The type of record format.
  final String recordFormatType;

  /// When configuring application input at the time of creating or updating an
  /// application, provides additional mapping information specific to the
  /// record format (such as JSON, CSV, or record fields delimited by some
  /// delimiter) on the streaming source.
  final MappingParameters mappingParameters;

  RecordFormat({
    @required this.recordFormatType,
    this.mappingParameters,
  });
  static RecordFormat fromJson(Map<String, dynamic> json) => RecordFormat();
}

/// Describes the reference data source by providing the source information (S3
/// bucket name and object key name), the resulting in-application table name
/// that is created, and the necessary schema to map the data elements in the
/// Amazon S3 object to the in-application table.
class ReferenceDataSource {
  /// Name of the in-application table to create.
  final String tableName;

  /// Identifies the S3 bucket and object that contains the reference data. Also
  /// identifies the IAM role Amazon Kinesis Analytics can assume to read this
  /// object on your behalf. An Amazon Kinesis Analytics application loads
  /// reference data only once. If the data changes, you call the
  /// `UpdateApplication` operation to trigger reloading of data into your
  /// application.
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
}

/// Describes the reference data source configured for an application.
class ReferenceDataSourceDescription {
  /// ID of the reference data source. This is the ID that Amazon Kinesis
  /// Analytics assigns when you add the reference data source to your
  /// application using the
  /// [AddApplicationReferenceDataSource](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_AddApplicationReferenceDataSource.html)
  /// operation.
  final String referenceId;

  /// The in-application table name created by the specific reference data
  /// source configuration.
  final String tableName;

  /// Provides the S3 bucket name, the object key name that contains the
  /// reference data. It also provides the Amazon Resource Name (ARN) of the IAM
  /// role that Amazon Kinesis Analytics can assume to read the Amazon S3 object
  /// and populate the in-application reference table.
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
      ReferenceDataSourceDescription();
}

/// When you update a reference data source configuration for an application,
/// this object provides all the updated values (such as the source bucket name
/// and object key name), the in-application table name that is created, and
/// updated mapping information that maps the data in the Amazon S3 object to
/// the in-application reference table that is created.
class ReferenceDataSourceUpdate {
  /// ID of the reference data source being updated. You can use the
  /// [DescribeApplication](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html)
  /// operation to get this value.
  final String referenceId;

  /// In-application table name that is created by this update.
  final String tableNameUpdate;

  /// Describes the S3 bucket name, object key name, and IAM role that Amazon
  /// Kinesis Analytics can assume to read the Amazon S3 object on your behalf
  /// and populate the in-application reference table.
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
}

/// Provides a description of an Amazon S3 data source, including the Amazon
/// Resource Name (ARN) of the S3 bucket, the ARN of the IAM role that is used
/// to access the bucket, and the name of the Amazon S3 object that contains the
/// data.
class S3Configuration {
  /// IAM ARN of the role used to access the data.
  final String roleArn;

  /// ARN of the S3 bucket that contains the data.
  final String bucketArn;

  /// The name of the object that contains the data.
  final String fileKey;

  S3Configuration({
    @required this.roleArn,
    @required this.bucketArn,
    @required this.fileKey,
  });
}

/// Identifies the S3 bucket and object that contains the reference data. Also
/// identifies the IAM role Amazon Kinesis Analytics can assume to read this
/// object on your behalf.
///
/// An Amazon Kinesis Analytics application loads reference data only once. If
/// the data changes, you call the
/// [UpdateApplication](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_UpdateApplication.html)
/// operation to trigger reloading of data into your application.
class S3ReferenceDataSource {
  /// Amazon Resource Name (ARN) of the S3 bucket.
  final String bucketArn;

  /// Object key name containing reference data.
  final String fileKey;

  /// ARN of the IAM role that the service can assume to read data on your
  /// behalf. This role must have permission for the `s3:GetObject` action on
  /// the object and trust policy that allows Amazon Kinesis Analytics service
  /// principal to assume this role.
  final String referenceRoleArn;

  S3ReferenceDataSource({
    @required this.bucketArn,
    @required this.fileKey,
    @required this.referenceRoleArn,
  });
}

/// Provides the bucket name and object key name that stores the reference data.
class S3ReferenceDataSourceDescription {
  /// Amazon Resource Name (ARN) of the S3 bucket.
  final String bucketArn;

  /// Amazon S3 object key name.
  final String fileKey;

  /// ARN of the IAM role that Amazon Kinesis Analytics can assume to read the
  /// Amazon S3 object on your behalf to populate the in-application reference
  /// table.
  final String referenceRoleArn;

  S3ReferenceDataSourceDescription({
    @required this.bucketArn,
    @required this.fileKey,
    @required this.referenceRoleArn,
  });
  static S3ReferenceDataSourceDescription fromJson(Map<String, dynamic> json) =>
      S3ReferenceDataSourceDescription();
}

/// Describes the S3 bucket name, object key name, and IAM role that Amazon
/// Kinesis Analytics can assume to read the Amazon S3 object on your behalf and
/// populate the in-application reference table.
class S3ReferenceDataSourceUpdate {
  /// Amazon Resource Name (ARN) of the S3 bucket.
  final String bucketArnUpdate;

  /// Object key name.
  final String fileKeyUpdate;

  /// ARN of the IAM role that Amazon Kinesis Analytics can assume to read the
  /// Amazon S3 object and populate the in-application.
  final String referenceRoleArnUpdate;

  S3ReferenceDataSourceUpdate({
    this.bucketArnUpdate,
    this.fileKeyUpdate,
    this.referenceRoleArnUpdate,
  });
}

/// Describes the format of the data in the streaming source, and how each data
/// element maps to corresponding columns created in the in-application stream.
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
  static SourceSchema fromJson(Map<String, dynamic> json) => SourceSchema();
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
/// [Using Tagging](https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-tagging.html).
class Tag {
  /// The key of the key-value tag.
  final String key;

  /// The value of the key-value tag. The value is optional.
  final String value;

  Tag({
    @required this.key,
    this.value,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag();
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
  UpdateApplicationResponse();
  static UpdateApplicationResponse fromJson(Map<String, dynamic> json) =>
      UpdateApplicationResponse();
}
