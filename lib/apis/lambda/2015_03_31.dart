import 'package:meta/meta.dart';
import 'dart:typed_data';

/// AWS Lambda
///
///  **Overview**
///
/// This is the _AWS Lambda API Reference_. The AWS Lambda Developer Guide
/// provides additional information. For the service overview, see [What is AWS
/// Lambda](https://docs.aws.amazon.com/lambda/latest/dg/welcome.html), and for
/// information about how the service works, see [AWS Lambda: How it
/// Works](https://docs.aws.amazon.com/lambda/latest/dg/lambda-introduction.html)
/// in the **AWS Lambda Developer Guide**.
class LambdaApi {
  /// Adds permissions to the resource-based policy of a version of an [AWS
  /// Lambda
  /// layer](https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html).
  /// Use this action to grant layer usage permission to other accounts. You can
  /// grant permission to a single account, all AWS accounts, or all accounts in
  /// an organization.
  ///
  /// To revoke permission, call RemoveLayerVersionPermission with the statement
  /// ID that you specified when you added it.
  Future<void> addLayerVersionPermission(
      {@required String layerName,
      @required BigInt versionNumber,
      @required String statementId,
      @required String action,
      @required String principal,
      String organizationId,
      String revisionId}) async {}

  /// Grants an AWS service or another account permission to use a function. You
  /// can apply the policy at the function level, or specify a qualifier to
  /// restrict access to a single version or alias. If you use a qualifier, the
  /// invoker must use the full Amazon Resource Name (ARN) of that version or
  /// alias to invoke the function.
  ///
  /// To grant permission to another account, specify the account ID as the
  /// `Principal`. For AWS services, the principal is a domain-style identifier
  /// defined by the service, like `s3.amazonaws.com` or `sns.amazonaws.com`.
  /// For AWS services, you can also specify the ARN or owning account of the
  /// associated resource as the `SourceArn` or `SourceAccount`. If you grant
  /// permission to a service principal without specifying the source, other
  /// accounts could potentially configure resources in their account to invoke
  /// your Lambda function.
  ///
  /// This action adds a statement to a resource-based permission policy for the
  /// function. For more information about function policies, see [Lambda
  /// Function
  /// Policies](https://docs.aws.amazon.com/lambda/latest/dg/access-control-resource-based.html).
  Future<void> addPermission(
      {@required String functionName,
      @required String statementId,
      @required String action,
      @required String principal,
      String sourceArn,
      String sourceAccount,
      String eventSourceToken,
      String qualifier,
      String revisionId}) async {}

  /// Creates an
  /// [alias](https://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html)
  /// for a Lambda function version. Use aliases to provide clients with a
  /// function identifier that you can update to invoke a different version.
  ///
  /// You can also map an alias to split invocation requests between two
  /// versions. Use the `RoutingConfig` parameter to specify a second version
  /// and the percentage of invocation requests that it receives.
  Future<void> createAlias(
      {@required String functionName,
      @required String name,
      @required String functionVersion,
      String description,
      AliasRoutingConfiguration routingConfig}) async {}

  /// Creates a mapping between an event source and an AWS Lambda function.
  /// Lambda reads items from the event source and triggers the function.
  ///
  /// For details about each event source type, see the following topics.
  ///
  /// *    [Using AWS Lambda with Amazon
  /// Kinesis](https://docs.aws.amazon.com/lambda/latest/dg/with-kinesis.html)
  ///
  /// *    [Using AWS Lambda with Amazon
  /// SQS](https://docs.aws.amazon.com/lambda/latest/dg/with-sqs.html)
  ///
  /// *    [Using AWS Lambda with Amazon
  /// DynamoDB](https://docs.aws.amazon.com/lambda/latest/dg/with-ddb.html)
  Future<void> createEventSourceMapping(
      {@required String eventSourceArn,
      @required String functionName,
      bool enabled,
      int batchSize,
      int maximumBatchingWindowInSeconds,
      String startingPosition,
      DateTime startingPositionTimestamp}) async {}

  /// Creates a Lambda function. To create a function, you need a [deployment
  /// package](https://docs.aws.amazon.com/lambda/latest/dg/deployment-package-v2.html)
  /// and an [execution
  /// role](https://docs.aws.amazon.com/lambda/latest/dg/intro-permission-model.html#lambda-intro-execution-role).
  /// The deployment package contains your function code. The execution role
  /// grants the function permission to use AWS services, such as Amazon
  /// CloudWatch Logs for log streaming and AWS X-Ray for request tracing.
  ///
  /// A function has an unpublished version, and can have published versions and
  /// aliases. The unpublished version changes when you update your function's
  /// code and configuration. A published version is a snapshot of your function
  /// code and configuration that can't be changed. An alias is a named resource
  /// that maps to a version, and can be changed to map to a different version.
  /// Use the `Publish` parameter to create version `1` of your function from
  /// its initial configuration.
  ///
  /// The other parameters let you configure version-specific and function-level
  /// settings. You can modify version-specific settings later with
  /// UpdateFunctionConfiguration. Function-level settings apply to both the
  /// unpublished and published versions of the function, and include tags
  /// (TagResource) and per-function concurrency limits
  /// (PutFunctionConcurrency).
  ///
  /// If another account or an AWS service invokes your function, use
  /// AddPermission to grant permission by creating a resource-based IAM policy.
  /// You can grant permissions at the function level, on a version, or on an
  /// alias.
  ///
  /// To invoke your function directly, use Invoke. To invoke your function in
  /// response to events in other AWS services, create an event source mapping
  /// (CreateEventSourceMapping), or configure a function trigger in the other
  /// service. For more information, see [Invoking
  /// Functions](https://docs.aws.amazon.com/lambda/latest/dg/invoking-lambda-functions.html).
  Future<void> createFunction(
      {@required String functionName,
      @required String runtime,
      @required String role,
      @required String handler,
      @required FunctionCode code,
      String description,
      int timeout,
      int memorySize,
      bool publish,
      VpcConfig vpcConfig,
      DeadLetterConfig deadLetterConfig,
      Environment environment,
      String kmsKeyArn,
      TracingConfig tracingConfig,
      Map<String, String> tags,
      List<String> layers}) async {}

  /// Deletes a Lambda function
  /// [alias](https://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html).
  Future<void> deleteAlias(
      {@required String functionName, @required String name}) async {}

  /// Deletes an [event source
  /// mapping](https://docs.aws.amazon.com/lambda/latest/dg/intro-invocation-modes.html).
  /// You can get the identifier of a mapping from the output of
  /// ListEventSourceMappings.
  Future<void> deleteEventSourceMapping(String uuid) async {}

  /// Deletes a Lambda function. To delete a specific function version, use the
  /// `Qualifier` parameter. Otherwise, all versions and aliases are deleted.
  ///
  /// To delete Lambda event source mappings that invoke a function, use
  /// DeleteEventSourceMapping. For AWS services and resources that invoke your
  /// function directly, delete the trigger in the service where you originally
  /// configured it.
  Future<void> deleteFunction(String functionName, {String qualifier}) async {}

  /// Removes a concurrent execution limit from a function.
  Future<void> deleteFunctionConcurrency(String functionName) async {}

  /// Deletes a version of an [AWS Lambda
  /// layer](https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html).
  /// Deleted versions can no longer be viewed or added to functions. To avoid
  /// breaking functions, a copy of the version remains in Lambda until no
  /// functions refer to it.
  Future<void> deleteLayerVersion(
      {@required String layerName, @required BigInt versionNumber}) async {}

  /// Retrieves details about your account's
  /// [limits](https://docs.aws.amazon.com/lambda/latest/dg/limits.html) and
  /// usage in an AWS Region.
  Future<void> getAccountSettings() async {}

  /// Returns details about a Lambda function
  /// [alias](https://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html).
  Future<void> getAlias(
      {@required String functionName, @required String name}) async {}

  /// Returns details about an event source mapping. You can get the identifier
  /// of a mapping from the output of ListEventSourceMappings.
  Future<void> getEventSourceMapping(String uuid) async {}

  /// Returns information about the function or function version, with a link to
  /// download the deployment package that's valid for 10 minutes. If you
  /// specify a function version, only details that are specific to that version
  /// are returned.
  Future<void> getFunction(String functionName, {String qualifier}) async {}

  /// Returns the version-specific settings of a Lambda function or version. The
  /// output includes only options that can vary between versions of a function.
  /// To modify these settings, use UpdateFunctionConfiguration.
  ///
  /// To get all of a function's details, including function-level settings, use
  /// GetFunction.
  Future<void> getFunctionConfiguration(String functionName,
      {String qualifier}) async {}

  /// Returns information about a version of an [AWS Lambda
  /// layer](https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html),
  /// with a link to download the layer archive that's valid for 10 minutes.
  Future<void> getLayerVersion(
      {@required String layerName, @required BigInt versionNumber}) async {}

  /// Returns information about a version of an [AWS Lambda
  /// layer](https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html),
  /// with a link to download the layer archive that's valid for 10 minutes.
  Future<void> getLayerVersionByArn(String arn) async {}

  /// Returns the permission policy for a version of an [AWS Lambda
  /// layer](https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html).
  /// For more information, see AddLayerVersionPermission.
  Future<void> getLayerVersionPolicy(
      {@required String layerName, @required BigInt versionNumber}) async {}

  /// Returns the [resource-based IAM
  /// policy](https://docs.aws.amazon.com/lambda/latest/dg/access-control-resource-based.html)
  /// for a function, version, or alias.
  Future<void> getPolicy(String functionName, {String qualifier}) async {}

  /// Invokes a Lambda function. You can invoke a function synchronously (and
  /// wait for the response), or asynchronously. To invoke a function
  /// asynchronously, set `InvocationType` to `Event`.
  ///
  /// For synchronous invocation, details about the function response, including
  /// errors, are included in the response body and headers. For either
  /// invocation type, you can find more information in the [execution
  /// log](https://docs.aws.amazon.com/lambda/latest/dg/monitoring-functions.html)
  /// and [trace](https://docs.aws.amazon.com/lambda/latest/dg/dlq.html). To
  /// record function errors for asynchronous invocations, configure your
  /// function with a [dead letter
  /// queue](https://docs.aws.amazon.com/lambda/latest/dg/dlq.html).
  ///
  /// When an error occurs, your function may be invoked multiple times. Retry
  /// behavior varies by error type, client, event source, and invocation type.
  /// For example, if you invoke a function asynchronously and it returns an
  /// error, Lambda executes the function up to two more times. For more
  /// information, see [Retry
  /// Behavior](https://docs.aws.amazon.com/lambda/latest/dg/retries-on-errors.html).
  ///
  /// The status code in the API response doesn't reflect function errors. Error
  /// codes are reserved for errors that prevent your function from executing,
  /// such as permissions errors, [limit
  /// errors](https://docs.aws.amazon.com/lambda/latest/dg/limits.html), or
  /// issues with your function's code and configuration. For example, Lambda
  /// returns `TooManyRequestsException` if executing the function would cause
  /// you to exceed a concurrency limit at either the account level
  /// (`ConcurrentInvocationLimitExceeded`) or function level
  /// (`ReservedFunctionConcurrentInvocationLimitExceeded`).
  ///
  /// For functions with a long timeout, your client might be disconnected
  /// during synchronous invocation while it waits for a response. Configure
  /// your HTTP client, SDK, firewall, proxy, or operating system to allow for
  /// long connections with timeout or keep-alive settings.
  ///
  /// This operation requires permission for the `lambda:InvokeFunction` action.
  Future<void> invoke(String functionName,
      {String invocationType,
      String logType,
      String clientContext,
      Uint8List payload,
      String qualifier}) async {}

  /// For asynchronous function invocation, use Invoke.
  ///
  /// Invokes a function asynchronously.
  Future<void> invokeAsync(
      {@required String functionName, @required Uint8List invokeArgs}) async {}

  /// Returns a list of
  /// [aliases](https://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html)
  /// for a Lambda function.
  Future<void> listAliases(String functionName,
      {String functionVersion, String marker, int maxItems}) async {}

  /// Lists event source mappings. Specify an `EventSourceArn` to only show
  /// event source mappings for a single event source.
  Future<void> listEventSourceMappings(
      {String eventSourceArn,
      String functionName,
      String marker,
      int maxItems}) async {}

  /// Returns a list of Lambda functions, with the version-specific
  /// configuration of each.
  ///
  /// Set `FunctionVersion` to `ALL` to include all published versions of each
  /// function in addition to the unpublished version. To get more information
  /// about a function or version, use GetFunction.
  Future<void> listFunctions(
      {String masterRegion,
      String functionVersion,
      String marker,
      int maxItems}) async {}

  /// Lists the versions of an [AWS Lambda
  /// layer](https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html).
  /// Versions that have been deleted aren't listed. Specify a [runtime
  /// identifier](https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html)
  /// to list only versions that indicate that they're compatible with that
  /// runtime.
  Future<void> listLayerVersions(String layerName,
      {String compatibleRuntime, String marker, int maxItems}) async {}

  /// Lists [AWS Lambda
  /// layers](https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html)
  /// and shows information about the latest version of each. Specify a [runtime
  /// identifier](https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html)
  /// to list only layers that indicate that they're compatible with that
  /// runtime.
  Future<void> listLayers(
      {String compatibleRuntime, String marker, int maxItems}) async {}

  /// Returns a function's
  /// [tags](https://docs.aws.amazon.com/lambda/latest/dg/tagging.html). You can
  /// also view tags with GetFunction.
  Future<void> listTags(String resource) async {}

  /// Returns a list of
  /// [versions](https://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html),
  /// with the version-specific configuration of each.
  Future<void> listVersionsByFunction(String functionName,
      {String marker, int maxItems}) async {}

  /// Creates an [AWS Lambda
  /// layer](https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html)
  /// from a ZIP archive. Each time you call `PublishLayerVersion` with the same
  /// version name, a new version is created.
  ///
  /// Add layers to your function with CreateFunction or
  /// UpdateFunctionConfiguration.
  Future<void> publishLayerVersion(
      {@required String layerName,
      String description,
      @required LayerVersionContentInput content,
      List<String> compatibleRuntimes,
      String licenseInfo}) async {}

  /// Creates a
  /// [version](https://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html)
  /// from the current code and configuration of a function. Use versions to
  /// create a snapshot of your function code and configuration that doesn't
  /// change.
  ///
  /// AWS Lambda doesn't publish a version if the function's configuration and
  /// code haven't changed since the last version. Use UpdateFunctionCode or
  /// UpdateFunctionConfiguration to update the function before publishing a
  /// version.
  ///
  /// Clients can invoke versions directly or with an alias. To create an alias,
  /// use CreateAlias.
  Future<void> publishVersion(String functionName,
      {String codeSha256, String description, String revisionId}) async {}

  /// Sets the maximum number of simultaneous executions for a function, and
  /// reserves capacity for that concurrency level.
  ///
  /// Concurrency settings apply to the function as a whole, including all
  /// published versions and the unpublished version. Reserving concurrency both
  /// ensures that your function has capacity to process the specified number of
  /// events simultaneously, and prevents it from scaling beyond that level. Use
  /// GetFunction to see the current setting for a function.
  ///
  /// Use GetAccountSettings to see your regional concurrency limit. You can
  /// reserve concurrency for as many functions as you like, as long as you
  /// leave at least 100 simultaneous executions unreserved for functions that
  /// aren't configured with a per-function limit. For more information, see
  /// [Managing
  /// Concurrency](https://docs.aws.amazon.com/lambda/latest/dg/concurrent-executions.html).
  Future<void> putFunctionConcurrency(
      {@required String functionName,
      @required int reservedConcurrentExecutions}) async {}

  /// Removes a statement from the permissions policy for a version of an [AWS
  /// Lambda
  /// layer](https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html).
  /// For more information, see AddLayerVersionPermission.
  Future<void> removeLayerVersionPermission(
      {@required String layerName,
      @required BigInt versionNumber,
      @required String statementId,
      String revisionId}) async {}

  /// Revokes function-use permission from an AWS service or another account.
  /// You can get the ID of the statement from the output of GetPolicy.
  Future<void> removePermission(
      {@required String functionName,
      @required String statementId,
      String qualifier,
      String revisionId}) async {}

  /// Adds [tags](https://docs.aws.amazon.com/lambda/latest/dg/tagging.html) to
  /// a function.
  Future<void> tagResource(
      {@required String resource, @required Map<String, String> tags}) async {}

  /// Removes [tags](https://docs.aws.amazon.com/lambda/latest/dg/tagging.html)
  /// from a function.
  Future<void> untagResource(
      {@required String resource, @required List<String> tagKeys}) async {}

  /// Updates the configuration of a Lambda function
  /// [alias](https://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html).
  Future<void> updateAlias(
      {@required String functionName,
      @required String name,
      String functionVersion,
      String description,
      AliasRoutingConfiguration routingConfig,
      String revisionId}) async {}

  /// Updates an event source mapping. You can change the function that AWS
  /// Lambda invokes, or pause invocation and resume later from the same
  /// location.
  Future<void> updateEventSourceMapping(String uuid,
      {String functionName,
      bool enabled,
      int batchSize,
      int maximumBatchingWindowInSeconds}) async {}

  /// Updates a Lambda function's code.
  ///
  /// The function's code is locked when you publish a version. You can't modify
  /// the code of a published version, only the unpublished version.
  Future<void> updateFunctionCode(String functionName,
      {Uint8List zipFile,
      String s3Bucket,
      String s3Key,
      String s3ObjectVersion,
      bool publish,
      bool dryRun,
      String revisionId}) async {}

  /// Modify the version-specific settings of a Lambda function.
  ///
  /// These settings can vary between versions of a function and are locked when
  /// you publish a version. You can't modify the configuration of a published
  /// version, only the unpublished version.
  ///
  /// To configure function concurrency, use PutFunctionConcurrency. To grant
  /// invoke permissions to an account or AWS service, use AddPermission.
  Future<void> updateFunctionConfiguration(String functionName,
      {String role,
      String handler,
      String description,
      int timeout,
      int memorySize,
      VpcConfig vpcConfig,
      Environment environment,
      String runtime,
      DeadLetterConfig deadLetterConfig,
      String kmsKeyArn,
      TracingConfig tracingConfig,
      String revisionId,
      List<String> layers}) async {}
}

class AccountLimit {}

class AccountUsage {}

class AddLayerVersionPermissionResponse {}

class AddPermissionResponse {}

class AliasConfiguration {}

class AliasRoutingConfiguration {}

class Concurrency {}

class DeadLetterConfig {}

class Environment {}

class EnvironmentError {}

class EnvironmentResponse {}

class EventSourceMappingConfiguration {}

class FunctionCode {}

class FunctionCodeLocation {}

class FunctionConfiguration {}

class GetAccountSettingsResponse {}

class GetFunctionResponse {}

class GetLayerVersionPolicyResponse {}

class GetLayerVersionResponse {}

class GetPolicyResponse {}

class InvocationResponse {}

class InvokeAsyncResponse {}

class Layer {}

class LayerVersionContentInput {}

class LayerVersionContentOutput {}

class LayerVersionsListItem {}

class LayersListItem {}

class ListAliasesResponse {}

class ListEventSourceMappingsResponse {}

class ListFunctionsResponse {}

class ListLayerVersionsResponse {}

class ListLayersResponse {}

class ListTagsResponse {}

class ListVersionsByFunctionResponse {}

class PublishLayerVersionResponse {}

class TracingConfig {}

class TracingConfigResponse {}

class VpcConfig {}

class VpcConfigResponse {}
