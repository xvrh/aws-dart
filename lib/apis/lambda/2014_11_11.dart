import 'package:meta/meta.dart';
import 'dart:typed_data';

/// AWS Lambda
///
/// **Overview**
///
/// This is the AWS Lambda API Reference. The AWS Lambda Developer Guide
/// provides additional information. For the service overview, go to [What is
/// AWS Lambda](http://docs.aws.amazon.com/lambda/latest/dg/welcome.html), and
/// for information about how the service works, go to [AWS LambdaL How it
/// Works](http://docs.aws.amazon.com/lambda/latest/dg/lambda-introduction.html)
/// in the AWS Lambda Developer Guide.
class LambdaApi {
  /// Identifies a stream as an event source for an AWS Lambda function. It can
  /// be either an Amazon Kinesis stream or a Amazon DynamoDB stream. AWS Lambda
  /// invokes the specified function when records are posted to the stream.
  ///
  /// This is the pull model, where AWS Lambda invokes the function. For more
  /// information, go to [AWS Lambda: How it
  /// Works](http://docs.aws.amazon.com/lambda/latest/dg/lambda-introduction.html)
  /// in the AWS Lambda Developer Guide.
  ///
  /// This association between an Amazon Kinesis stream and an AWS Lambda
  /// function is called the event source mapping. You provide the configuration
  /// information (for example, which stream to read from and which AWS Lambda
  /// function to invoke) for the event source mapping in the request body.
  ///
  ///  Each event source, such as a Kinesis stream, can only be associated with
  /// one AWS Lambda function. If you call AddEventSource for an event source
  /// that is already mapped to another AWS Lambda function, the existing
  /// mapping is updated to call the new function instead of the old one.
  ///
  /// This operation requires permission for the `iam:PassRole` action for the
  /// IAM role. It also requires permission for the `lambda:AddEventSource`
  /// action.
  ///
  /// [eventSource]: The Amazon Resource Name (ARN) of the Amazon Kinesis stream
  /// that is the event source. Any record added to this stream causes AWS
  /// Lambda to invoke your Lambda function. AWS Lambda POSTs the Amazon Kinesis
  /// event, containing records, to your Lambda function as JSON.
  ///
  /// [functionName]: The Lambda function to invoke when AWS Lambda detects an
  /// event on the stream.
  ///
  /// [role]: The ARN of the IAM role (invocation role) that AWS Lambda can
  /// assume to read from the stream and invoke the function.
  ///
  /// [batchSize]: The largest number of records that AWS Lambda will give to
  /// your function in a single event. The default is 100 records.
  ///
  /// [parameters]: A map (key-value pairs) defining the configuration for AWS
  /// Lambda to use when reading the event source. Currently, AWS Lambda
  /// supports only the `InitialPositionInStream` key. The valid values are:
  /// "TRIM\_HORIZON" and "LATEST". The default value is "TRIM\_HORIZON". For
  /// more information, go to
  /// [ShardIteratorType](http://docs.aws.amazon.com/kinesis/latest/APIReference/API_GetShardIterator.html#Kinesis-GetShardIterator-request-ShardIteratorType)
  /// in the Amazon Kinesis Service API Reference.
  Future<EventSourceConfiguration> addEventSource(
      {@required String eventSource,
      @required String functionName,
      @required String role,
      int batchSize,
      Map<String, String> parameters}) async {
    return EventSourceConfiguration.fromJson({});
  }

  /// Deletes the specified Lambda function code and configuration.
  ///
  /// This operation requires permission for the `lambda:DeleteFunction` action.
  ///
  /// [functionName]: The Lambda function to delete.
  Future<void> deleteFunction(String functionName) async {}

  /// Returns configuration information for the specified event source mapping
  /// (see AddEventSource).
  ///
  /// This operation requires permission for the `lambda:GetEventSource` action.
  ///
  /// [uuid]: The AWS Lambda assigned ID of the event source mapping.
  Future<EventSourceConfiguration> getEventSource(String uuid) async {
    return EventSourceConfiguration.fromJson({});
  }

  /// Returns the configuration information of the Lambda function and a
  /// presigned URL link to the .zip file you uploaded with UploadFunction so
  /// you can download the .zip file. Note that the URL is valid for up to 10
  /// minutes. The configuration information is the same information you
  /// provided as parameters when uploading the function.
  ///
  /// This operation requires permission for the `lambda:GetFunction` action.
  ///
  /// [functionName]: The Lambda function name.
  Future<GetFunctionResponse> getFunction(String functionName) async {
    return GetFunctionResponse.fromJson({});
  }

  /// Returns the configuration information of the Lambda function. This the
  /// same information you provided as parameters when uploading the function by
  /// using UploadFunction.
  ///
  /// This operation requires permission for the
  /// `lambda:GetFunctionConfiguration` operation.
  ///
  /// [functionName]: The name of the Lambda function for which you want to
  /// retrieve the configuration information.
  Future<FunctionConfiguration> getFunctionConfiguration(
      String functionName) async {
    return FunctionConfiguration.fromJson({});
  }

  /// Submits an invocation request to AWS Lambda. Upon receiving the request,
  /// Lambda executes the specified function asynchronously. To see the logs
  /// generated by the Lambda function execution, see the CloudWatch logs
  /// console.
  ///
  /// This operation requires permission for the `lambda:InvokeAsync` action.
  ///
  /// [functionName]: The Lambda function name.
  ///
  /// [invokeArgs]: JSON that you want to provide to your Lambda function as
  /// input.
  Future<InvokeAsyncResponse> invokeAsync(
      {@required String functionName, @required Uint8List invokeArgs}) async {
    return InvokeAsyncResponse.fromJson({});
  }

  /// Returns a list of event source mappings you created using the
  /// `AddEventSource` (see AddEventSource), where you identify a stream as
  /// event source. This list does not include Amazon S3 event sources.
  ///
  /// For each mapping, the API returns configuration information. You can
  /// optionally specify filters to retrieve specific event source mappings.
  ///
  /// This operation requires permission for the `lambda:ListEventSources`
  /// action.
  ///
  /// [eventSourceArn]: The Amazon Resource Name (ARN) of the Amazon Kinesis
  /// stream.
  ///
  /// [functionName]: The name of the AWS Lambda function.
  ///
  /// [marker]: Optional string. An opaque pagination token returned from a
  /// previous `ListEventSources` operation. If present, specifies to continue
  /// the list from where the returning call left off.
  ///
  /// [maxItems]: Optional integer. Specifies the maximum number of event
  /// sources to return in response. This value must be greater than 0.
  Future<ListEventSourcesResponse> listEventSources(
      {String eventSourceArn,
      String functionName,
      String marker,
      int maxItems}) async {
    return ListEventSourcesResponse.fromJson({});
  }

  /// Returns a list of your Lambda functions. For each function, the response
  /// includes the function configuration information. You must use GetFunction
  /// to retrieve the code for your function.
  ///
  /// This operation requires permission for the `lambda:ListFunctions` action.
  ///
  /// [marker]: Optional string. An opaque pagination token returned from a
  /// previous `ListFunctions` operation. If present, indicates where to
  /// continue the listing.
  ///
  /// [maxItems]: Optional integer. Specifies the maximum number of AWS Lambda
  /// functions to return in response. This parameter value must be greater than
  /// 0.
  Future<ListFunctionsResponse> listFunctions(
      {String marker, int maxItems}) async {
    return ListFunctionsResponse.fromJson({});
  }

  /// Removes an event source mapping. This means AWS Lambda will no longer
  /// invoke the function for events in the associated source.
  ///
  /// This operation requires permission for the `lambda:RemoveEventSource`
  /// action.
  ///
  /// [uuid]: The event source mapping ID.
  Future<void> removeEventSource(String uuid) async {}

  /// Updates the configuration parameters for the specified Lambda function by
  /// using the values provided in the request. You provide only the parameters
  /// you want to change. This operation must only be used on an existing Lambda
  /// function and cannot be used to update the function's code.
  ///
  /// This operation requires permission for the
  /// `lambda:UpdateFunctionConfiguration` action.
  ///
  /// [functionName]: The name of the Lambda function.
  ///
  /// [role]: The Amazon Resource Name (ARN) of the IAM role that Lambda will
  /// assume when it executes your function.
  ///
  /// [handler]: The function that Lambda calls to begin executing your
  /// function. For Node.js, it is the _module-name.export_ value in your
  /// function.
  ///
  /// [description]: A short user-defined function description. Lambda does not
  /// use this value. Assign a meaningful description as you see fit.
  ///
  /// [timeout]: The function execution time at which Lambda should terminate
  /// the function. Because the execution time has cost implications, we
  /// recommend you set this value based on your expected execution time. The
  /// default is 3 seconds.
  ///
  /// [memorySize]: The amount of memory, in MB, your Lambda function is given.
  /// Lambda uses this memory size to infer the amount of CPU allocated to your
  /// function. Your function use-case determines your CPU and memory
  /// requirements. For example, a database operation might need less memory
  /// compared to an image processing function. The default value is 128 MB. The
  /// value must be a multiple of 64 MB.
  Future<FunctionConfiguration> updateFunctionConfiguration(String functionName,
      {String role,
      String handler,
      String description,
      int timeout,
      int memorySize}) async {
    return FunctionConfiguration.fromJson({});
  }

  /// Creates a new Lambda function or updates an existing function. The
  /// function metadata is created from the request parameters, and the code for
  /// the function is provided by a .zip file in the request body. If the
  /// function name already exists, the existing Lambda function is updated with
  /// the new code and metadata.
  ///
  /// This operation requires permission for the `lambda:UploadFunction` action.
  ///
  /// [functionName]: The name you want to assign to the function you are
  /// uploading. The function names appear in the console and are returned in
  /// the ListFunctions API. Function names are used to specify functions to
  /// other AWS Lambda APIs, such as InvokeAsync.
  ///
  /// [functionZip]: A .zip file containing your packaged source code. For more
  /// information about creating a .zip file, go to [AWS LambdaL How it
  /// Works](http://docs.aws.amazon.com/lambda/latest/dg/walkthrough-custom-events.html)
  /// in the AWS Lambda Developer Guide.
  ///
  /// [runtime]: The runtime environment for the Lambda function you are
  /// uploading. Currently, Lambda supports only "nodejs" as the runtime.
  ///
  /// [role]: The Amazon Resource Name (ARN) of the IAM role that Lambda assumes
  /// when it executes your function to access any other Amazon Web Services
  /// (AWS) resources.
  ///
  /// [handler]: The function that Lambda calls to begin execution. For Node.js,
  /// it is the _module-name_._export_ value in your function.
  ///
  /// [mode]: How the Lambda function will be invoked. Lambda supports only the
  /// "event" mode.
  ///
  /// [description]: A short, user-defined function description. Lambda does not
  /// use this value. Assign a meaningful description as you see fit.
  ///
  /// [timeout]: The function execution time at which Lambda should terminate
  /// the function. Because the execution time has cost implications, we
  /// recommend you set this value based on your expected execution time. The
  /// default is 3 seconds.
  ///
  /// [memorySize]: The amount of memory, in MB, your Lambda function is given.
  /// Lambda uses this memory size to infer the amount of CPU allocated to your
  /// function. Your function use-case determines your CPU and memory
  /// requirements. For example, database operation might need less memory
  /// compared to image processing function. The default value is 128 MB. The
  /// value must be a multiple of 64 MB.
  Future<FunctionConfiguration> uploadFunction(
      {@required String functionName,
      @required Uint8List functionZip,
      @required String runtime,
      @required String role,
      @required String handler,
      @required String mode,
      String description,
      int timeout,
      int memorySize}) async {
    return FunctionConfiguration.fromJson({});
  }
}

class EventSourceConfiguration {
  /// The AWS Lambda assigned opaque identifier for the mapping.
  final String uuid;

  /// The largest number of records that AWS Lambda will POST in the invocation
  /// request to your function.
  final int batchSize;

  /// The Amazon Resource Name (ARN) of the Amazon Kinesis stream that is the
  /// source of events.
  final String eventSource;

  /// The Lambda function to invoke when AWS Lambda detects an event on the
  /// stream.
  final String functionName;

  /// The map (key-value pairs) defining the configuration for AWS Lambda to use
  /// when reading the event source.
  final Map<String, String> parameters;

  /// The ARN of the IAM role (invocation role) that AWS Lambda can assume to
  /// read from the stream and invoke the function.
  final String role;

  /// The UTC time string indicating the last time the event mapping was
  /// updated.
  final DateTime lastModified;

  /// Indicates whether the event source mapping is currently honored. Events
  /// are only processes if IsActive is true.
  final bool isActive;

  /// The description of the health of the event source mapping. Valid values
  /// are: "PENDING", "OK", and "PROBLEM:_message_". Initially this staus is
  /// "PENDING". When AWS Lambda begins processing events, it changes the status
  /// to "OK".
  final String status;

  EventSourceConfiguration({
    this.uuid,
    this.batchSize,
    this.eventSource,
    this.functionName,
    this.parameters,
    this.role,
    this.lastModified,
    this.isActive,
    this.status,
  });
  static EventSourceConfiguration fromJson(Map<String, dynamic> json) =>
      EventSourceConfiguration();
}

class FunctionCodeLocation {
  /// The repository from which you can download the function.
  final String repositoryType;

  /// The presigned URL you can use to download the function's .zip file that
  /// you previously uploaded. The URL is valid for up to 10 minutes.
  final String location;

  FunctionCodeLocation({
    this.repositoryType,
    this.location,
  });
  static FunctionCodeLocation fromJson(Map<String, dynamic> json) =>
      FunctionCodeLocation();
}

class FunctionConfiguration {
  /// The name of the function.
  final String functionName;

  /// The Amazon Resource Name (ARN) assigned to the function.
  final String functionArn;

  /// A Lambda-assigned unique identifier for the current function code and
  /// related configuration.
  final String configurationId;

  /// The runtime environment for the Lambda function.
  final String runtime;

  /// The Amazon Resource Name (ARN) of the IAM role that Lambda assumes when it
  /// executes your function to access any other Amazon Web Services (AWS)
  /// resources.
  final String role;

  /// The function Lambda calls to begin executing your function.
  final String handler;

  /// The type of the Lambda function you uploaded.
  final String mode;

  /// The size, in bytes, of the function .zip file you uploaded.
  final BigInt codeSize;

  /// The user-provided description.
  final String description;

  /// The function execution time at which Lambda should terminate the function.
  /// Because the execution time has cost implications, we recommend you set
  /// this value based on your expected execution time. The default is 3
  /// seconds.
  final int timeout;

  /// The memory size, in MB, you configured for the function. Must be a
  /// multiple of 64 MB.
  final int memorySize;

  /// The timestamp of the last time you updated the function.
  final DateTime lastModified;

  FunctionConfiguration({
    this.functionName,
    this.functionArn,
    this.configurationId,
    this.runtime,
    this.role,
    this.handler,
    this.mode,
    this.codeSize,
    this.description,
    this.timeout,
    this.memorySize,
    this.lastModified,
  });
  static FunctionConfiguration fromJson(Map<String, dynamic> json) =>
      FunctionConfiguration();
}

class GetFunctionResponse {
  final FunctionConfiguration configuration;

  final FunctionCodeLocation code;

  GetFunctionResponse({
    this.configuration,
    this.code,
  });
  static GetFunctionResponse fromJson(Map<String, dynamic> json) =>
      GetFunctionResponse();
}

class InvokeAsyncResponse {
  /// It will be 202 upon success.
  final int status;

  InvokeAsyncResponse({
    this.status,
  });
  static InvokeAsyncResponse fromJson(Map<String, dynamic> json) =>
      InvokeAsyncResponse();
}

class ListEventSourcesResponse {
  /// A string, present if there are more event source mappings.
  final String nextMarker;

  /// An arrary of `EventSourceConfiguration` objects.
  final List<EventSourceConfiguration> eventSources;

  ListEventSourcesResponse({
    this.nextMarker,
    this.eventSources,
  });
  static ListEventSourcesResponse fromJson(Map<String, dynamic> json) =>
      ListEventSourcesResponse();
}

class ListFunctionsResponse {
  /// A string, present if there are more functions.
  final String nextMarker;

  /// A list of Lambda functions.
  final List<FunctionConfiguration> functions;

  ListFunctionsResponse({
    this.nextMarker,
    this.functions,
  });
  static ListFunctionsResponse fromJson(Map<String, dynamic> json) =>
      ListFunctionsResponse();
}
