import 'package:meta/meta.dart';
import 'dart:typed_data';

/// AWS Lambda
///
/// **Overview**
///
/// This is the AWS Lambda API Reference. The AWS Lambda Developer Guide
/// provides additional information. For the service overview, go to
/// [What is AWS Lambda](http://docs.aws.amazon.com/lambda/latest/dg/welcome.html),
/// and for information about how the service works, go to
/// [AWS LambdaL How it Works](http://docs.aws.amazon.com/lambda/latest/dg/lambda-introduction.html)
/// in the AWS Lambda Developer Guide.
class LambdaApi {
  final _client;
  LambdaApi(client)
      : _client = client.configured('Lambda', serializer: 'rest-json');

  /// Identifies a stream as an event source for an AWS Lambda function. It can
  /// be either an Amazon Kinesis stream or a Amazon DynamoDB stream. AWS Lambda
  /// invokes the specified function when records are posted to the stream.
  ///
  /// This is the pull model, where AWS Lambda invokes the function. For more
  /// information, go to
  /// [AWS Lambda: How it Works](http://docs.aws.amazon.com/lambda/latest/dg/lambda-introduction.html)
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
  /// "TRIM_HORIZON" and "LATEST". The default value is "TRIM_HORIZON". For more
  /// information, go to
  /// [ShardIteratorType](http://docs.aws.amazon.com/kinesis/latest/APIReference/API_GetShardIterator.html#Kinesis-GetShardIterator-request-ShardIteratorType)
  /// in the Amazon Kinesis Service API Reference.
  Future<EventSourceConfiguration> addEventSource(
      {@required String eventSource,
      @required String functionName,
      @required String role,
      int batchSize,
      Map<String, String> parameters}) async {
    var response_ = await _client.send('AddEventSource', {
      'EventSource': eventSource,
      'FunctionName': functionName,
      'Role': role,
      if (batchSize != null) 'BatchSize': batchSize,
      if (parameters != null) 'Parameters': parameters,
    });
    return EventSourceConfiguration.fromJson(response_);
  }

  /// Deletes the specified Lambda function code and configuration.
  ///
  /// This operation requires permission for the `lambda:DeleteFunction` action.
  ///
  /// [functionName]: The Lambda function to delete.
  Future<void> deleteFunction(String functionName) async {
    await _client.send('DeleteFunction', {
      'FunctionName': functionName,
    });
  }

  /// Returns configuration information for the specified event source mapping
  /// (see AddEventSource).
  ///
  /// This operation requires permission for the `lambda:GetEventSource` action.
  ///
  /// [uuid]: The AWS Lambda assigned ID of the event source mapping.
  Future<EventSourceConfiguration> getEventSource(String uuid) async {
    var response_ = await _client.send('GetEventSource', {
      'UUID': uuid,
    });
    return EventSourceConfiguration.fromJson(response_);
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
    var response_ = await _client.send('GetFunction', {
      'FunctionName': functionName,
    });
    return GetFunctionResponse.fromJson(response_);
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
    var response_ = await _client.send('GetFunctionConfiguration', {
      'FunctionName': functionName,
    });
    return FunctionConfiguration.fromJson(response_);
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
    var response_ = await _client.send('InvokeAsync', {
      'FunctionName': functionName,
      'InvokeArgs': invokeArgs,
    });
    return InvokeAsyncResponse.fromJson(response_);
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
    var response_ = await _client.send('ListEventSources', {
      if (eventSourceArn != null) 'EventSourceArn': eventSourceArn,
      if (functionName != null) 'FunctionName': functionName,
      if (marker != null) 'Marker': marker,
      if (maxItems != null) 'MaxItems': maxItems,
    });
    return ListEventSourcesResponse.fromJson(response_);
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
    var response_ = await _client.send('ListFunctions', {
      if (marker != null) 'Marker': marker,
      if (maxItems != null) 'MaxItems': maxItems,
    });
    return ListFunctionsResponse.fromJson(response_);
  }

  /// Removes an event source mapping. This means AWS Lambda will no longer
  /// invoke the function for events in the associated source.
  ///
  /// This operation requires permission for the `lambda:RemoveEventSource`
  /// action.
  ///
  /// [uuid]: The event source mapping ID.
  Future<void> removeEventSource(String uuid) async {
    await _client.send('RemoveEventSource', {
      'UUID': uuid,
    });
  }

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
    var response_ = await _client.send('UpdateFunctionConfiguration', {
      'FunctionName': functionName,
      if (role != null) 'Role': role,
      if (handler != null) 'Handler': handler,
      if (description != null) 'Description': description,
      if (timeout != null) 'Timeout': timeout,
      if (memorySize != null) 'MemorySize': memorySize,
    });
    return FunctionConfiguration.fromJson(response_);
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
  /// information about creating a .zip file, go to
  /// [AWS LambdaL How it Works](http://docs.aws.amazon.com/lambda/latest/dg/walkthrough-custom-events.html)
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
    var response_ = await _client.send('UploadFunction', {
      'FunctionName': functionName,
      'FunctionZip': functionZip,
      'Runtime': runtime,
      'Role': role,
      'Handler': handler,
      'Mode': mode,
      if (description != null) 'Description': description,
      if (timeout != null) 'Timeout': timeout,
      if (memorySize != null) 'MemorySize': memorySize,
    });
    return FunctionConfiguration.fromJson(response_);
  }
}

/// Describes mapping between an Amazon Kinesis stream and a Lambda function.
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
      EventSourceConfiguration(
        uuid: json.containsKey('UUID') ? json['UUID'] as String : null,
        batchSize:
            json.containsKey('BatchSize') ? json['BatchSize'] as int : null,
        eventSource: json.containsKey('EventSource')
            ? json['EventSource'] as String
            : null,
        functionName: json.containsKey('FunctionName')
            ? json['FunctionName'] as String
            : null,
        parameters: json.containsKey('Parameters')
            ? (json['Parameters'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        role: json.containsKey('Role') ? json['Role'] as String : null,
        lastModified: json.containsKey('LastModified')
            ? DateTime.parse(json['LastModified'])
            : null,
        isActive:
            json.containsKey('IsActive') ? json['IsActive'] as bool : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
      );
}

/// The object for the Lambda function location.
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
      FunctionCodeLocation(
        repositoryType: json.containsKey('RepositoryType')
            ? json['RepositoryType'] as String
            : null,
        location:
            json.containsKey('Location') ? json['Location'] as String : null,
      );
}

/// A complex type that describes function metadata.
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
      FunctionConfiguration(
        functionName: json.containsKey('FunctionName')
            ? json['FunctionName'] as String
            : null,
        functionArn: json.containsKey('FunctionARN')
            ? json['FunctionARN'] as String
            : null,
        configurationId: json.containsKey('ConfigurationId')
            ? json['ConfigurationId'] as String
            : null,
        runtime: json.containsKey('Runtime') ? json['Runtime'] as String : null,
        role: json.containsKey('Role') ? json['Role'] as String : null,
        handler: json.containsKey('Handler') ? json['Handler'] as String : null,
        mode: json.containsKey('Mode') ? json['Mode'] as String : null,
        codeSize:
            json.containsKey('CodeSize') ? BigInt.from(json['CodeSize']) : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        timeout: json.containsKey('Timeout') ? json['Timeout'] as int : null,
        memorySize:
            json.containsKey('MemorySize') ? json['MemorySize'] as int : null,
        lastModified: json.containsKey('LastModified')
            ? DateTime.parse(json['LastModified'])
            : null,
      );
}

/// This response contains the object for AWS Lambda function location (see
/// API_FunctionCodeLocation
class GetFunctionResponse {
  final FunctionConfiguration configuration;

  final FunctionCodeLocation code;

  GetFunctionResponse({
    this.configuration,
    this.code,
  });
  static GetFunctionResponse fromJson(Map<String, dynamic> json) =>
      GetFunctionResponse(
        configuration: json.containsKey('Configuration')
            ? FunctionConfiguration.fromJson(json['Configuration'])
            : null,
        code: json.containsKey('Code')
            ? FunctionCodeLocation.fromJson(json['Code'])
            : null,
      );
}

/// Upon success, it returns empty response. Otherwise, throws an exception.
class InvokeAsyncResponse {
  /// It will be 202 upon success.
  final int status;

  InvokeAsyncResponse({
    this.status,
  });
  static InvokeAsyncResponse fromJson(Map<String, dynamic> json) =>
      InvokeAsyncResponse(
        status: json.containsKey('Status') ? json['Status'] as int : null,
      );
}

/// Contains a list of event sources (see API_EventSourceConfiguration)
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
      ListEventSourcesResponse(
        nextMarker: json.containsKey('NextMarker')
            ? json['NextMarker'] as String
            : null,
        eventSources: json.containsKey('EventSources')
            ? (json['EventSources'] as List)
                .map((e) => EventSourceConfiguration.fromJson(e))
                .toList()
            : null,
      );
}

/// Contains a list of AWS Lambda function configurations (see
/// API_FunctionConfiguration.
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
      ListFunctionsResponse(
        nextMarker: json.containsKey('NextMarker')
            ? json['NextMarker'] as String
            : null,
        functions: json.containsKey('Functions')
            ? (json['Functions'] as List)
                .map((e) => FunctionConfiguration.fromJson(e))
                .toList()
            : null,
      );
}
