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
  Future<void> addEventSource(
      {@required String eventSource,
      @required String functionName,
      @required String role,
      int batchSize,
      Map<String, String> parameters}) async {}

  /// Deletes the specified Lambda function code and configuration.
  ///
  /// This operation requires permission for the `lambda:DeleteFunction` action.
  Future<void> deleteFunction(String functionName) async {}

  /// Returns configuration information for the specified event source mapping
  /// (see AddEventSource).
  ///
  /// This operation requires permission for the `lambda:GetEventSource` action.
  Future<void> getEventSource(String uuid) async {}

  /// Returns the configuration information of the Lambda function and a
  /// presigned URL link to the .zip file you uploaded with UploadFunction so
  /// you can download the .zip file. Note that the URL is valid for up to 10
  /// minutes. The configuration information is the same information you
  /// provided as parameters when uploading the function.
  ///
  /// This operation requires permission for the `lambda:GetFunction` action.
  Future<void> getFunction(String functionName) async {}

  /// Returns the configuration information of the Lambda function. This the
  /// same information you provided as parameters when uploading the function by
  /// using UploadFunction.
  ///
  /// This operation requires permission for the
  /// `lambda:GetFunctionConfiguration` operation.
  Future<void> getFunctionConfiguration(String functionName) async {}

  /// Submits an invocation request to AWS Lambda. Upon receiving the request,
  /// Lambda executes the specified function asynchronously. To see the logs
  /// generated by the Lambda function execution, see the CloudWatch logs
  /// console.
  ///
  /// This operation requires permission for the `lambda:InvokeAsync` action.
  Future<void> invokeAsync(
      {@required String functionName, @required Uint8List invokeArgs}) async {}

  /// Returns a list of event source mappings you created using the
  /// `AddEventSource` (see AddEventSource), where you identify a stream as
  /// event source. This list does not include Amazon S3 event sources.
  ///
  /// For each mapping, the API returns configuration information. You can
  /// optionally specify filters to retrieve specific event source mappings.
  ///
  /// This operation requires permission for the `lambda:ListEventSources`
  /// action.
  Future<void> listEventSources(
      {String eventSourceArn,
      String functionName,
      String marker,
      int maxItems}) async {}

  /// Returns a list of your Lambda functions. For each function, the response
  /// includes the function configuration information. You must use GetFunction
  /// to retrieve the code for your function.
  ///
  /// This operation requires permission for the `lambda:ListFunctions` action.
  Future<void> listFunctions({String marker, int maxItems}) async {}

  /// Removes an event source mapping. This means AWS Lambda will no longer
  /// invoke the function for events in the associated source.
  ///
  /// This operation requires permission for the `lambda:RemoveEventSource`
  /// action.
  Future<void> removeEventSource(String uuid) async {}

  /// Updates the configuration parameters for the specified Lambda function by
  /// using the values provided in the request. You provide only the parameters
  /// you want to change. This operation must only be used on an existing Lambda
  /// function and cannot be used to update the function's code.
  ///
  /// This operation requires permission for the
  /// `lambda:UpdateFunctionConfiguration` action.
  Future<void> updateFunctionConfiguration(String functionName,
      {String role,
      String handler,
      String description,
      int timeout,
      int memorySize}) async {}

  /// Creates a new Lambda function or updates an existing function. The
  /// function metadata is created from the request parameters, and the code for
  /// the function is provided by a .zip file in the request body. If the
  /// function name already exists, the existing Lambda function is updated with
  /// the new code and metadata.
  ///
  /// This operation requires permission for the `lambda:UploadFunction` action.
  Future<void> uploadFunction(
      {@required String functionName,
      @required Uint8List functionZip,
      @required String runtime,
      @required String role,
      @required String handler,
      @required String mode,
      String description,
      int timeout,
      int memorySize}) async {}
}

class EventSourceConfiguration {}

class FunctionCodeLocation {}

class FunctionConfiguration {}

class GetFunctionResponse {}

class InvokeAsyncResponse {}

class ListEventSourcesResponse {}

class ListFunctionsResponse {}
