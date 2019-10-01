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
  ///
  /// [layerName]: The name or Amazon Resource Name (ARN) of the layer.
  ///
  /// [versionNumber]: The version number.
  ///
  /// [statementId]: An identifier that distinguishes the policy from others on
  /// the same layer version.
  ///
  /// [action]: The API action that grants access to the layer. For example,
  /// `lambda:GetLayerVersion`.
  ///
  /// [principal]: An account ID, or `*` to grant permission to all AWS
  /// accounts.
  ///
  /// [organizationId]: With the principal set to `*`, grant permission to all
  /// accounts in the specified organization.
  ///
  /// [revisionId]: Only update the policy if the revision ID matches the ID
  /// specified. Use this option to avoid modifying a policy that has changed
  /// since you last read it.
  Future<AddLayerVersionPermissionResponse> addLayerVersionPermission(
      {@required String layerName,
      @required BigInt versionNumber,
      @required String statementId,
      @required String action,
      @required String principal,
      String organizationId,
      String revisionId}) async {
    return AddLayerVersionPermissionResponse.fromJson({});
  }

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
  ///
  /// [functionName]: The name of the Lambda function, version, or alias.
  ///
  ///  **Name formats**
  ///
  /// *    **Function name** \- `my-function` (name-only), `my-function:v1`
  /// (with alias).
  ///
  /// *    **Function ARN** \-
  /// `arn:aws:lambda:us-west-2:123456789012:function:my-function`.
  ///
  /// *    **Partial ARN** \- `123456789012:function:my-function`.
  ///
  ///
  /// You can append a version number or alias to any of the formats. The length
  /// constraint applies only to the full ARN. If you specify only the function
  /// name, it is limited to 64 characters in length.
  ///
  /// [statementId]: A statement identifier that differentiates the statement
  /// from others in the same policy.
  ///
  /// [action]: The action that the principal can use on the function. For
  /// example, `lambda:InvokeFunction` or `lambda:GetFunction`.
  ///
  /// [principal]: The AWS service or account that invokes the function. If you
  /// specify a service, use `SourceArn` or `SourceAccount` to limit who can
  /// invoke the function through that service.
  ///
  /// [sourceArn]: For AWS services, the ARN of the AWS resource that invokes
  /// the function. For example, an Amazon S3 bucket or Amazon SNS topic.
  ///
  /// [sourceAccount]: For AWS services, the ID of the account that owns the
  /// resource. Use this instead of `SourceArn` to grant permission to resources
  /// that are owned by another account (for example, all of an account's Amazon
  /// S3 buckets). Or use it together with `SourceArn` to ensure that the
  /// resource is owned by the specified account. For example, an Amazon S3
  /// bucket could be deleted by its owner and recreated by another account.
  ///
  /// [eventSourceToken]: For Alexa Smart Home functions, a token that must be
  /// supplied by the invoker.
  ///
  /// [qualifier]: Specify a version or alias to add permissions to a published
  /// version of the function.
  ///
  /// [revisionId]: Only update the policy if the revision ID matches the ID
  /// that's specified. Use this option to avoid modifying a policy that has
  /// changed since you last read it.
  Future<AddPermissionResponse> addPermission(
      {@required String functionName,
      @required String statementId,
      @required String action,
      @required String principal,
      String sourceArn,
      String sourceAccount,
      String eventSourceToken,
      String qualifier,
      String revisionId}) async {
    return AddPermissionResponse.fromJson({});
  }

  /// Creates an
  /// [alias](https://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html)
  /// for a Lambda function version. Use aliases to provide clients with a
  /// function identifier that you can update to invoke a different version.
  ///
  /// You can also map an alias to split invocation requests between two
  /// versions. Use the `RoutingConfig` parameter to specify a second version
  /// and the percentage of invocation requests that it receives.
  ///
  /// [functionName]: The name of the Lambda function.
  ///
  ///  **Name formats**
  ///
  /// *    **Function name** \- `MyFunction`.
  ///
  /// *    **Function ARN** \-
  /// `arn:aws:lambda:us-west-2:123456789012:function:MyFunction`.
  ///
  /// *    **Partial ARN** \- `123456789012:function:MyFunction`.
  ///
  ///
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  ///
  /// [name]: The name of the alias.
  ///
  /// [functionVersion]: The function version that the alias invokes.
  ///
  /// [description]: A description of the alias.
  ///
  /// [routingConfig]: The [routing
  /// configuration](https://docs.aws.amazon.com/lambda/latest/dg/lambda-traffic-shifting-using-aliases.html)
  /// of the alias.
  Future<AliasConfiguration> createAlias(
      {@required String functionName,
      @required String name,
      @required String functionVersion,
      String description,
      AliasRoutingConfiguration routingConfig}) async {
    return AliasConfiguration.fromJson({});
  }

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
  ///
  /// [eventSourceArn]: The Amazon Resource Name (ARN) of the event source.
  ///
  /// *    **Amazon Kinesis** \- The ARN of the data stream or a stream
  /// consumer.
  ///
  /// *    **Amazon DynamoDB Streams** \- The ARN of the stream.
  ///
  /// *    **Amazon Simple Queue Service** \- The ARN of the queue.
  ///
  /// [functionName]: The name of the Lambda function.
  ///
  ///  **Name formats**
  ///
  /// *    **Function name** \- `MyFunction`.
  ///
  /// *    **Function ARN** \-
  /// `arn:aws:lambda:us-west-2:123456789012:function:MyFunction`.
  ///
  /// *    **Version or Alias ARN** \-
  /// `arn:aws:lambda:us-west-2:123456789012:function:MyFunction:PROD`.
  ///
  /// *    **Partial ARN** \- `123456789012:function:MyFunction`.
  ///
  ///
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it's limited to 64 characters in length.
  ///
  /// [enabled]: Disables the event source mapping to pause polling and
  /// invocation.
  ///
  /// [batchSize]: The maximum number of items to retrieve in a single batch.
  ///
  /// *    **Amazon Kinesis** \- Default 100. Max 10,000.
  ///
  /// *    **Amazon DynamoDB Streams** \- Default 100. Max 1,000.
  ///
  /// *    **Amazon Simple Queue Service** \- Default 10. Max 10.
  ///
  /// [startingPosition]: The position in a stream from which to start reading.
  /// Required for Amazon Kinesis and Amazon DynamoDB Streams sources.
  /// `AT_TIMESTAMP` is only supported for Amazon Kinesis streams.
  ///
  /// [startingPositionTimestamp]: With `StartingPosition` set to
  /// `AT_TIMESTAMP`, the time from which to start reading.
  Future<EventSourceMappingConfiguration> createEventSourceMapping(
      {@required String eventSourceArn,
      @required String functionName,
      bool enabled,
      int batchSize,
      int maximumBatchingWindowInSeconds,
      String startingPosition,
      DateTime startingPositionTimestamp}) async {
    return EventSourceMappingConfiguration.fromJson({});
  }

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
  ///
  /// [functionName]: The name of the Lambda function.
  ///
  ///  **Name formats**
  ///
  /// *    **Function name** \- `my-function`.
  ///
  /// *    **Function ARN** \-
  /// `arn:aws:lambda:us-west-2:123456789012:function:my-function`.
  ///
  /// *    **Partial ARN** \- `123456789012:function:my-function`.
  ///
  ///
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  ///
  /// [runtime]: The identifier of the function's
  /// [runtime](https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html).
  ///
  /// [role]: The Amazon Resource Name (ARN) of the function's execution role.
  ///
  /// [handler]: The name of the method within your code that Lambda calls to
  /// execute your function. The format includes the file name. It can also
  /// include namespaces and other qualifiers, depending on the runtime. For
  /// more information, see [Programming
  /// Model](https://docs.aws.amazon.com/lambda/latest/dg/programming-model-v2.html).
  ///
  /// [code]: The code for the function.
  ///
  /// [description]: A description of the function.
  ///
  /// [timeout]: The amount of time that Lambda allows a function to run before
  /// stopping it. The default is 3 seconds. The maximum allowed value is 900
  /// seconds.
  ///
  /// [memorySize]: The amount of memory that your function has access to.
  /// Increasing the function's memory also increases its CPU allocation. The
  /// default value is 128 MB. The value must be a multiple of 64 MB.
  ///
  /// [publish]: Set to true to publish the first version of the function during
  /// creation.
  ///
  /// [vpcConfig]: For network connectivity to AWS resources in a VPC, specify a
  /// list of security groups and subnets in the VPC. When you connect a
  /// function to a VPC, it can only access resources and the internet through
  /// that VPC. For more information, see [VPC
  /// Settings](https://docs.aws.amazon.com/lambda/latest/dg/vpc.html).
  ///
  /// [deadLetterConfig]: A dead letter queue configuration that specifies the
  /// queue or topic where Lambda sends asynchronous events when they fail
  /// processing. For more information, see [Dead Letter
  /// Queues](https://docs.aws.amazon.com/lambda/latest/dg/dlq.html).
  ///
  /// [environment]: Environment variables that are accessible from function
  /// code during execution.
  ///
  /// [kmsKeyArn]: The ARN of the AWS Key Management Service (AWS KMS) key
  /// that's used to encrypt your function's environment variables. If it's not
  /// provided, AWS Lambda uses a default service key.
  ///
  /// [tracingConfig]: Set `Mode` to `Active` to sample and trace a subset of
  /// incoming requests with AWS X-Ray.
  ///
  /// [tags]: A list of
  /// [tags](https://docs.aws.amazon.com/lambda/latest/dg/tagging.html) to apply
  /// to the function.
  ///
  /// [layers]: A list of [function
  /// layers](https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html)
  /// to add to the function's execution environment. Specify each layer by its
  /// ARN, including the version.
  Future<FunctionConfiguration> createFunction(
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
      List<String> layers}) async {
    return FunctionConfiguration.fromJson({});
  }

  /// Deletes a Lambda function
  /// [alias](https://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html).
  ///
  /// [functionName]: The name of the Lambda function.
  ///
  ///  **Name formats**
  ///
  /// *    **Function name** \- `MyFunction`.
  ///
  /// *    **Function ARN** \-
  /// `arn:aws:lambda:us-west-2:123456789012:function:MyFunction`.
  ///
  /// *    **Partial ARN** \- `123456789012:function:MyFunction`.
  ///
  ///
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  ///
  /// [name]: The name of the alias.
  Future<void> deleteAlias(
      {@required String functionName, @required String name}) async {}

  /// Deletes an [event source
  /// mapping](https://docs.aws.amazon.com/lambda/latest/dg/intro-invocation-modes.html).
  /// You can get the identifier of a mapping from the output of
  /// ListEventSourceMappings.
  ///
  /// [uuid]: The identifier of the event source mapping.
  Future<EventSourceMappingConfiguration> deleteEventSourceMapping(
      String uuid) async {
    return EventSourceMappingConfiguration.fromJson({});
  }

  /// Deletes a Lambda function. To delete a specific function version, use the
  /// `Qualifier` parameter. Otherwise, all versions and aliases are deleted.
  ///
  /// To delete Lambda event source mappings that invoke a function, use
  /// DeleteEventSourceMapping. For AWS services and resources that invoke your
  /// function directly, delete the trigger in the service where you originally
  /// configured it.
  ///
  /// [functionName]: The name of the Lambda function or version.
  ///
  ///  **Name formats**
  ///
  /// *    **Function name** \- `my-function` (name-only), `my-function:1` (with
  /// version).
  ///
  /// *    **Function ARN** \-
  /// `arn:aws:lambda:us-west-2:123456789012:function:my-function`.
  ///
  /// *    **Partial ARN** \- `123456789012:function:my-function`.
  ///
  ///
  /// You can append a version number or alias to any of the formats. The length
  /// constraint applies only to the full ARN. If you specify only the function
  /// name, it is limited to 64 characters in length.
  ///
  /// [qualifier]: Specify a version to delete. You can't delete a version
  /// that's referenced by an alias.
  Future<void> deleteFunction(String functionName, {String qualifier}) async {}

  /// Removes a concurrent execution limit from a function.
  ///
  /// [functionName]: The name of the Lambda function.
  ///
  ///  **Name formats**
  ///
  /// *    **Function name** \- `my-function`.
  ///
  /// *    **Function ARN** \-
  /// `arn:aws:lambda:us-west-2:123456789012:function:my-function`.
  ///
  /// *    **Partial ARN** \- `123456789012:function:my-function`.
  ///
  ///
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  Future<void> deleteFunctionConcurrency(String functionName) async {}

  /// Deletes a version of an [AWS Lambda
  /// layer](https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html).
  /// Deleted versions can no longer be viewed or added to functions. To avoid
  /// breaking functions, a copy of the version remains in Lambda until no
  /// functions refer to it.
  ///
  /// [layerName]: The name or Amazon Resource Name (ARN) of the layer.
  ///
  /// [versionNumber]: The version number.
  Future<void> deleteLayerVersion(
      {@required String layerName, @required BigInt versionNumber}) async {}

  /// Retrieves details about your account's
  /// [limits](https://docs.aws.amazon.com/lambda/latest/dg/limits.html) and
  /// usage in an AWS Region.
  Future<GetAccountSettingsResponse> getAccountSettings() async {
    return GetAccountSettingsResponse.fromJson({});
  }

  /// Returns details about a Lambda function
  /// [alias](https://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html).
  ///
  /// [functionName]: The name of the Lambda function.
  ///
  ///  **Name formats**
  ///
  /// *    **Function name** \- `MyFunction`.
  ///
  /// *    **Function ARN** \-
  /// `arn:aws:lambda:us-west-2:123456789012:function:MyFunction`.
  ///
  /// *    **Partial ARN** \- `123456789012:function:MyFunction`.
  ///
  ///
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  ///
  /// [name]: The name of the alias.
  Future<AliasConfiguration> getAlias(
      {@required String functionName, @required String name}) async {
    return AliasConfiguration.fromJson({});
  }

  /// Returns details about an event source mapping. You can get the identifier
  /// of a mapping from the output of ListEventSourceMappings.
  ///
  /// [uuid]: The identifier of the event source mapping.
  Future<EventSourceMappingConfiguration> getEventSourceMapping(
      String uuid) async {
    return EventSourceMappingConfiguration.fromJson({});
  }

  /// Returns information about the function or function version, with a link to
  /// download the deployment package that's valid for 10 minutes. If you
  /// specify a function version, only details that are specific to that version
  /// are returned.
  ///
  /// [functionName]: The name of the Lambda function, version, or alias.
  ///
  ///  **Name formats**
  ///
  /// *    **Function name** \- `my-function` (name-only), `my-function:v1`
  /// (with alias).
  ///
  /// *    **Function ARN** \-
  /// `arn:aws:lambda:us-west-2:123456789012:function:my-function`.
  ///
  /// *    **Partial ARN** \- `123456789012:function:my-function`.
  ///
  ///
  /// You can append a version number or alias to any of the formats. The length
  /// constraint applies only to the full ARN. If you specify only the function
  /// name, it is limited to 64 characters in length.
  ///
  /// [qualifier]: Specify a version or alias to get details about a published
  /// version of the function.
  Future<GetFunctionResponse> getFunction(String functionName,
      {String qualifier}) async {
    return GetFunctionResponse.fromJson({});
  }

  /// Returns the version-specific settings of a Lambda function or version. The
  /// output includes only options that can vary between versions of a function.
  /// To modify these settings, use UpdateFunctionConfiguration.
  ///
  /// To get all of a function's details, including function-level settings, use
  /// GetFunction.
  ///
  /// [functionName]: The name of the Lambda function, version, or alias.
  ///
  ///  **Name formats**
  ///
  /// *    **Function name** \- `my-function` (name-only), `my-function:v1`
  /// (with alias).
  ///
  /// *    **Function ARN** \-
  /// `arn:aws:lambda:us-west-2:123456789012:function:my-function`.
  ///
  /// *    **Partial ARN** \- `123456789012:function:my-function`.
  ///
  ///
  /// You can append a version number or alias to any of the formats. The length
  /// constraint applies only to the full ARN. If you specify only the function
  /// name, it is limited to 64 characters in length.
  ///
  /// [qualifier]: Specify a version or alias to get details about a published
  /// version of the function.
  Future<FunctionConfiguration> getFunctionConfiguration(String functionName,
      {String qualifier}) async {
    return FunctionConfiguration.fromJson({});
  }

  /// Returns information about a version of an [AWS Lambda
  /// layer](https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html),
  /// with a link to download the layer archive that's valid for 10 minutes.
  ///
  /// [layerName]: The name or Amazon Resource Name (ARN) of the layer.
  ///
  /// [versionNumber]: The version number.
  Future<GetLayerVersionResponse> getLayerVersion(
      {@required String layerName, @required BigInt versionNumber}) async {
    return GetLayerVersionResponse.fromJson({});
  }

  /// Returns information about a version of an [AWS Lambda
  /// layer](https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html),
  /// with a link to download the layer archive that's valid for 10 minutes.
  ///
  /// [arn]: The ARN of the layer version.
  Future<GetLayerVersionResponse> getLayerVersionByArn(String arn) async {
    return GetLayerVersionResponse.fromJson({});
  }

  /// Returns the permission policy for a version of an [AWS Lambda
  /// layer](https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html).
  /// For more information, see AddLayerVersionPermission.
  ///
  /// [layerName]: The name or Amazon Resource Name (ARN) of the layer.
  ///
  /// [versionNumber]: The version number.
  Future<GetLayerVersionPolicyResponse> getLayerVersionPolicy(
      {@required String layerName, @required BigInt versionNumber}) async {
    return GetLayerVersionPolicyResponse.fromJson({});
  }

  /// Returns the [resource-based IAM
  /// policy](https://docs.aws.amazon.com/lambda/latest/dg/access-control-resource-based.html)
  /// for a function, version, or alias.
  ///
  /// [functionName]: The name of the Lambda function, version, or alias.
  ///
  ///  **Name formats**
  ///
  /// *    **Function name** \- `my-function` (name-only), `my-function:v1`
  /// (with alias).
  ///
  /// *    **Function ARN** \-
  /// `arn:aws:lambda:us-west-2:123456789012:function:my-function`.
  ///
  /// *    **Partial ARN** \- `123456789012:function:my-function`.
  ///
  ///
  /// You can append a version number or alias to any of the formats. The length
  /// constraint applies only to the full ARN. If you specify only the function
  /// name, it is limited to 64 characters in length.
  ///
  /// [qualifier]: Specify a version or alias to get the policy for that
  /// resource.
  Future<GetPolicyResponse> getPolicy(String functionName,
      {String qualifier}) async {
    return GetPolicyResponse.fromJson({});
  }

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
  ///
  /// [functionName]: The name of the Lambda function, version, or alias.
  ///
  ///  **Name formats**
  ///
  /// *    **Function name** \- `my-function` (name-only), `my-function:v1`
  /// (with alias).
  ///
  /// *    **Function ARN** \-
  /// `arn:aws:lambda:us-west-2:123456789012:function:my-function`.
  ///
  /// *    **Partial ARN** \- `123456789012:function:my-function`.
  ///
  ///
  /// You can append a version number or alias to any of the formats. The length
  /// constraint applies only to the full ARN. If you specify only the function
  /// name, it is limited to 64 characters in length.
  ///
  /// [invocationType]: Choose from the following options.
  ///
  /// *    `RequestResponse` (default) - Invoke the function synchronously. Keep
  /// the connection open until the function returns a response or times out.
  /// The API response includes the function response and additional data.
  ///
  /// *    `Event` \- Invoke the function asynchronously. Send events that fail
  /// multiple times to the function's dead-letter queue (if it's configured).
  /// The API response only includes a status code.
  ///
  /// *    `DryRun` \- Validate parameter values and verify that the user or
  /// role has permission to invoke the function.
  ///
  /// [logType]: Set to `Tail` to include the execution log in the response.
  ///
  /// [clientContext]: Up to 3583 bytes of base64-encoded data about the
  /// invoking client to pass to the function in the context object.
  ///
  /// [payload]: The JSON that you want to provide to your Lambda function as
  /// input.
  ///
  /// [qualifier]: Specify a version or alias to invoke a published version of
  /// the function.
  Future<InvocationResponse> invoke(String functionName,
      {String invocationType,
      String logType,
      String clientContext,
      Uint8List payload,
      String qualifier}) async {
    return InvocationResponse.fromJson({});
  }

  /// For asynchronous function invocation, use Invoke.
  ///
  /// Invokes a function asynchronously.
  ///
  /// [functionName]: The name of the Lambda function.
  ///
  ///  **Name formats**
  ///
  /// *    **Function name** \- `my-function`.
  ///
  /// *    **Function ARN** \-
  /// `arn:aws:lambda:us-west-2:123456789012:function:my-function`.
  ///
  /// *    **Partial ARN** \- `123456789012:function:my-function`.
  ///
  ///
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  ///
  /// [invokeArgs]: The JSON that you want to provide to your Lambda function as
  /// input.
  Future<InvokeAsyncResponse> invokeAsync(
      {@required String functionName, @required Uint8List invokeArgs}) async {
    return InvokeAsyncResponse.fromJson({});
  }

  /// Returns a list of
  /// [aliases](https://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html)
  /// for a Lambda function.
  ///
  /// [functionName]: The name of the Lambda function.
  ///
  ///  **Name formats**
  ///
  /// *    **Function name** \- `MyFunction`.
  ///
  /// *    **Function ARN** \-
  /// `arn:aws:lambda:us-west-2:123456789012:function:MyFunction`.
  ///
  /// *    **Partial ARN** \- `123456789012:function:MyFunction`.
  ///
  ///
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  ///
  /// [functionVersion]: Specify a function version to only list aliases that
  /// invoke that version.
  ///
  /// [marker]: Specify the pagination token that's returned by a previous
  /// request to retrieve the next page of results.
  ///
  /// [maxItems]: Limit the number of aliases returned.
  Future<ListAliasesResponse> listAliases(String functionName,
      {String functionVersion, String marker, int maxItems}) async {
    return ListAliasesResponse.fromJson({});
  }

  /// Lists event source mappings. Specify an `EventSourceArn` to only show
  /// event source mappings for a single event source.
  ///
  /// [eventSourceArn]: The Amazon Resource Name (ARN) of the event source.
  ///
  /// *    **Amazon Kinesis** \- The ARN of the data stream or a stream
  /// consumer.
  ///
  /// *    **Amazon DynamoDB Streams** \- The ARN of the stream.
  ///
  /// *    **Amazon Simple Queue Service** \- The ARN of the queue.
  ///
  /// [functionName]: The name of the Lambda function.
  ///
  ///  **Name formats**
  ///
  /// *    **Function name** \- `MyFunction`.
  ///
  /// *    **Function ARN** \-
  /// `arn:aws:lambda:us-west-2:123456789012:function:MyFunction`.
  ///
  /// *    **Version or Alias ARN** \-
  /// `arn:aws:lambda:us-west-2:123456789012:function:MyFunction:PROD`.
  ///
  /// *    **Partial ARN** \- `123456789012:function:MyFunction`.
  ///
  ///
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it's limited to 64 characters in length.
  ///
  /// [marker]: A pagination token returned by a previous call.
  ///
  /// [maxItems]: The maximum number of event source mappings to return.
  Future<ListEventSourceMappingsResponse> listEventSourceMappings(
      {String eventSourceArn,
      String functionName,
      String marker,
      int maxItems}) async {
    return ListEventSourceMappingsResponse.fromJson({});
  }

  /// Returns a list of Lambda functions, with the version-specific
  /// configuration of each.
  ///
  /// Set `FunctionVersion` to `ALL` to include all published versions of each
  /// function in addition to the unpublished version. To get more information
  /// about a function or version, use GetFunction.
  ///
  /// [masterRegion]: For Lambda@Edge functions, the AWS Region of the master
  /// function. For example, `us-east-2` or `ALL`. If specified, you must set
  /// `FunctionVersion` to `ALL`.
  ///
  /// [functionVersion]: Set to `ALL` to include entries for all published
  /// versions of each function.
  ///
  /// [marker]: Specify the pagination token that's returned by a previous
  /// request to retrieve the next page of results.
  ///
  /// [maxItems]: Specify a value between 1 and 50 to limit the number of
  /// functions in the response.
  Future<ListFunctionsResponse> listFunctions(
      {String masterRegion,
      String functionVersion,
      String marker,
      int maxItems}) async {
    return ListFunctionsResponse.fromJson({});
  }

  /// Lists the versions of an [AWS Lambda
  /// layer](https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html).
  /// Versions that have been deleted aren't listed. Specify a [runtime
  /// identifier](https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html)
  /// to list only versions that indicate that they're compatible with that
  /// runtime.
  ///
  /// [compatibleRuntime]: A runtime identifier. For example, `go1.x`.
  ///
  /// [layerName]: The name or Amazon Resource Name (ARN) of the layer.
  ///
  /// [marker]: A pagination token returned by a previous call.
  ///
  /// [maxItems]: The maximum number of versions to return.
  Future<ListLayerVersionsResponse> listLayerVersions(String layerName,
      {String compatibleRuntime, String marker, int maxItems}) async {
    return ListLayerVersionsResponse.fromJson({});
  }

  /// Lists [AWS Lambda
  /// layers](https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html)
  /// and shows information about the latest version of each. Specify a [runtime
  /// identifier](https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html)
  /// to list only layers that indicate that they're compatible with that
  /// runtime.
  ///
  /// [compatibleRuntime]: A runtime identifier. For example, `go1.x`.
  ///
  /// [marker]: A pagination token returned by a previous call.
  ///
  /// [maxItems]: The maximum number of layers to return.
  Future<ListLayersResponse> listLayers(
      {String compatibleRuntime, String marker, int maxItems}) async {
    return ListLayersResponse.fromJson({});
  }

  /// Returns a function's
  /// [tags](https://docs.aws.amazon.com/lambda/latest/dg/tagging.html). You can
  /// also view tags with GetFunction.
  ///
  /// [resource]: The function's Amazon Resource Name (ARN).
  Future<ListTagsResponse> listTags(String resource) async {
    return ListTagsResponse.fromJson({});
  }

  /// Returns a list of
  /// [versions](https://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html),
  /// with the version-specific configuration of each.
  ///
  /// [functionName]: The name of the Lambda function.
  ///
  ///  **Name formats**
  ///
  /// *    **Function name** \- `MyFunction`.
  ///
  /// *    **Function ARN** \-
  /// `arn:aws:lambda:us-west-2:123456789012:function:MyFunction`.
  ///
  /// *    **Partial ARN** \- `123456789012:function:MyFunction`.
  ///
  ///
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  ///
  /// [marker]: Specify the pagination token that's returned by a previous
  /// request to retrieve the next page of results.
  ///
  /// [maxItems]: Limit the number of versions that are returned.
  Future<ListVersionsByFunctionResponse> listVersionsByFunction(
      String functionName,
      {String marker,
      int maxItems}) async {
    return ListVersionsByFunctionResponse.fromJson({});
  }

  /// Creates an [AWS Lambda
  /// layer](https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html)
  /// from a ZIP archive. Each time you call `PublishLayerVersion` with the same
  /// version name, a new version is created.
  ///
  /// Add layers to your function with CreateFunction or
  /// UpdateFunctionConfiguration.
  ///
  /// [layerName]: The name or Amazon Resource Name (ARN) of the layer.
  ///
  /// [description]: The description of the version.
  ///
  /// [content]: The function layer archive.
  ///
  /// [compatibleRuntimes]: A list of compatible [function
  /// runtimes](https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html).
  /// Used for filtering with ListLayers and ListLayerVersions.
  ///
  /// [licenseInfo]: The layer's software license. It can be any of the
  /// following:
  ///
  /// *   An [SPDX license identifier](https://spdx.org/licenses/). For example,
  /// `MIT`.
  ///
  /// *   The URL of a license hosted on the internet. For example,
  /// `https://opensource.org/licenses/MIT`.
  ///
  /// *   The full text of the license.
  Future<PublishLayerVersionResponse> publishLayerVersion(
      {@required String layerName,
      String description,
      @required LayerVersionContentInput content,
      List<String> compatibleRuntimes,
      String licenseInfo}) async {
    return PublishLayerVersionResponse.fromJson({});
  }

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
  ///
  /// [functionName]: The name of the Lambda function.
  ///
  ///  **Name formats**
  ///
  /// *    **Function name** \- `MyFunction`.
  ///
  /// *    **Function ARN** \-
  /// `arn:aws:lambda:us-west-2:123456789012:function:MyFunction`.
  ///
  /// *    **Partial ARN** \- `123456789012:function:MyFunction`.
  ///
  ///
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  ///
  /// [codeSha256]: Only publish a version if the hash value matches the value
  /// that's specified. Use this option to avoid publishing a version if the
  /// function code has changed since you last updated it. You can get the hash
  /// for the version that you uploaded from the output of UpdateFunctionCode.
  ///
  /// [description]: A description for the version to override the description
  /// in the function configuration.
  ///
  /// [revisionId]: Only update the function if the revision ID matches the ID
  /// that's specified. Use this option to avoid publishing a version if the
  /// function configuration has changed since you last updated it.
  Future<FunctionConfiguration> publishVersion(String functionName,
      {String codeSha256, String description, String revisionId}) async {
    return FunctionConfiguration.fromJson({});
  }

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
  ///
  /// [functionName]: The name of the Lambda function.
  ///
  ///  **Name formats**
  ///
  /// *    **Function name** \- `my-function`.
  ///
  /// *    **Function ARN** \-
  /// `arn:aws:lambda:us-west-2:123456789012:function:my-function`.
  ///
  /// *    **Partial ARN** \- `123456789012:function:my-function`.
  ///
  ///
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  ///
  /// [reservedConcurrentExecutions]: The number of simultaneous executions to
  /// reserve for the function.
  Future<Concurrency> putFunctionConcurrency(
      {@required String functionName,
      @required int reservedConcurrentExecutions}) async {
    return Concurrency.fromJson({});
  }

  /// Removes a statement from the permissions policy for a version of an [AWS
  /// Lambda
  /// layer](https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html).
  /// For more information, see AddLayerVersionPermission.
  ///
  /// [layerName]: The name or Amazon Resource Name (ARN) of the layer.
  ///
  /// [versionNumber]: The version number.
  ///
  /// [statementId]: The identifier that was specified when the statement was
  /// added.
  ///
  /// [revisionId]: Only update the policy if the revision ID matches the ID
  /// specified. Use this option to avoid modifying a policy that has changed
  /// since you last read it.
  Future<void> removeLayerVersionPermission(
      {@required String layerName,
      @required BigInt versionNumber,
      @required String statementId,
      String revisionId}) async {}

  /// Revokes function-use permission from an AWS service or another account.
  /// You can get the ID of the statement from the output of GetPolicy.
  ///
  /// [functionName]: The name of the Lambda function, version, or alias.
  ///
  ///  **Name formats**
  ///
  /// *    **Function name** \- `my-function` (name-only), `my-function:v1`
  /// (with alias).
  ///
  /// *    **Function ARN** \-
  /// `arn:aws:lambda:us-west-2:123456789012:function:my-function`.
  ///
  /// *    **Partial ARN** \- `123456789012:function:my-function`.
  ///
  ///
  /// You can append a version number or alias to any of the formats. The length
  /// constraint applies only to the full ARN. If you specify only the function
  /// name, it is limited to 64 characters in length.
  ///
  /// [statementId]: Statement ID of the permission to remove.
  ///
  /// [qualifier]: Specify a version or alias to remove permissions from a
  /// published version of the function.
  ///
  /// [revisionId]: Only update the policy if the revision ID matches the ID
  /// that's specified. Use this option to avoid modifying a policy that has
  /// changed since you last read it.
  Future<void> removePermission(
      {@required String functionName,
      @required String statementId,
      String qualifier,
      String revisionId}) async {}

  /// Adds [tags](https://docs.aws.amazon.com/lambda/latest/dg/tagging.html) to
  /// a function.
  ///
  /// [resource]: The function's Amazon Resource Name (ARN).
  ///
  /// [tags]: A list of tags to apply to the function.
  Future<void> tagResource(
      {@required String resource, @required Map<String, String> tags}) async {}

  /// Removes [tags](https://docs.aws.amazon.com/lambda/latest/dg/tagging.html)
  /// from a function.
  ///
  /// [resource]: The function's Amazon Resource Name (ARN).
  ///
  /// [tagKeys]: A list of tag keys to remove from the function.
  Future<void> untagResource(
      {@required String resource, @required List<String> tagKeys}) async {}

  /// Updates the configuration of a Lambda function
  /// [alias](https://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html).
  ///
  /// [functionName]: The name of the Lambda function.
  ///
  ///  **Name formats**
  ///
  /// *    **Function name** \- `MyFunction`.
  ///
  /// *    **Function ARN** \-
  /// `arn:aws:lambda:us-west-2:123456789012:function:MyFunction`.
  ///
  /// *    **Partial ARN** \- `123456789012:function:MyFunction`.
  ///
  ///
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  ///
  /// [name]: The name of the alias.
  ///
  /// [functionVersion]: The function version that the alias invokes.
  ///
  /// [description]: A description of the alias.
  ///
  /// [routingConfig]: The [routing
  /// configuration](https://docs.aws.amazon.com/lambda/latest/dg/lambda-traffic-shifting-using-aliases.html)
  /// of the alias.
  ///
  /// [revisionId]: Only update the alias if the revision ID matches the ID
  /// that's specified. Use this option to avoid modifying an alias that has
  /// changed since you last read it.
  Future<AliasConfiguration> updateAlias(
      {@required String functionName,
      @required String name,
      String functionVersion,
      String description,
      AliasRoutingConfiguration routingConfig,
      String revisionId}) async {
    return AliasConfiguration.fromJson({});
  }

  /// Updates an event source mapping. You can change the function that AWS
  /// Lambda invokes, or pause invocation and resume later from the same
  /// location.
  ///
  /// [uuid]: The identifier of the event source mapping.
  ///
  /// [functionName]: The name of the Lambda function.
  ///
  ///  **Name formats**
  ///
  /// *    **Function name** \- `MyFunction`.
  ///
  /// *    **Function ARN** \-
  /// `arn:aws:lambda:us-west-2:123456789012:function:MyFunction`.
  ///
  /// *    **Version or Alias ARN** \-
  /// `arn:aws:lambda:us-west-2:123456789012:function:MyFunction:PROD`.
  ///
  /// *    **Partial ARN** \- `123456789012:function:MyFunction`.
  ///
  ///
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it's limited to 64 characters in length.
  ///
  /// [enabled]: Disables the event source mapping to pause polling and
  /// invocation.
  ///
  /// [batchSize]: The maximum number of items to retrieve in a single batch.
  ///
  /// *    **Amazon Kinesis** \- Default 100. Max 10,000.
  ///
  /// *    **Amazon DynamoDB Streams** \- Default 100. Max 1,000.
  ///
  /// *    **Amazon Simple Queue Service** \- Default 10. Max 10.
  Future<EventSourceMappingConfiguration> updateEventSourceMapping(String uuid,
      {String functionName,
      bool enabled,
      int batchSize,
      int maximumBatchingWindowInSeconds}) async {
    return EventSourceMappingConfiguration.fromJson({});
  }

  /// Updates a Lambda function's code.
  ///
  /// The function's code is locked when you publish a version. You can't modify
  /// the code of a published version, only the unpublished version.
  ///
  /// [functionName]: The name of the Lambda function.
  ///
  ///  **Name formats**
  ///
  /// *    **Function name** \- `my-function`.
  ///
  /// *    **Function ARN** \-
  /// `arn:aws:lambda:us-west-2:123456789012:function:my-function`.
  ///
  /// *    **Partial ARN** \- `123456789012:function:my-function`.
  ///
  ///
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  ///
  /// [zipFile]: The base64-encoded contents of the deployment package. AWS SDK
  /// and AWS CLI clients handle the encoding for you.
  ///
  /// [s3Bucket]: An Amazon S3 bucket in the same AWS Region as your function.
  /// The bucket can be in a different AWS account.
  ///
  /// [s3Key]: The Amazon S3 key of the deployment package.
  ///
  /// [s3ObjectVersion]: For versioned objects, the version of the deployment
  /// package object to use.
  ///
  /// [publish]: Set to true to publish a new version of the function after
  /// updating the code. This has the same effect as calling PublishVersion
  /// separately.
  ///
  /// [dryRun]: Set to true to validate the request parameters and access
  /// permissions without modifying the function code.
  ///
  /// [revisionId]: Only update the function if the revision ID matches the ID
  /// that's specified. Use this option to avoid modifying a function that has
  /// changed since you last read it.
  Future<FunctionConfiguration> updateFunctionCode(String functionName,
      {Uint8List zipFile,
      String s3Bucket,
      String s3Key,
      String s3ObjectVersion,
      bool publish,
      bool dryRun,
      String revisionId}) async {
    return FunctionConfiguration.fromJson({});
  }

  /// Modify the version-specific settings of a Lambda function.
  ///
  /// These settings can vary between versions of a function and are locked when
  /// you publish a version. You can't modify the configuration of a published
  /// version, only the unpublished version.
  ///
  /// To configure function concurrency, use PutFunctionConcurrency. To grant
  /// invoke permissions to an account or AWS service, use AddPermission.
  ///
  /// [functionName]: The name of the Lambda function.
  ///
  ///  **Name formats**
  ///
  /// *    **Function name** \- `my-function`.
  ///
  /// *    **Function ARN** \-
  /// `arn:aws:lambda:us-west-2:123456789012:function:my-function`.
  ///
  /// *    **Partial ARN** \- `123456789012:function:my-function`.
  ///
  ///
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  ///
  /// [role]: The Amazon Resource Name (ARN) of the function's execution role.
  ///
  /// [handler]: The name of the method within your code that Lambda calls to
  /// execute your function. The format includes the file name. It can also
  /// include namespaces and other qualifiers, depending on the runtime. For
  /// more information, see [Programming
  /// Model](https://docs.aws.amazon.com/lambda/latest/dg/programming-model-v2.html).
  ///
  /// [description]: A description of the function.
  ///
  /// [timeout]: The amount of time that Lambda allows a function to run before
  /// stopping it. The default is 3 seconds. The maximum allowed value is 900
  /// seconds.
  ///
  /// [memorySize]: The amount of memory that your function has access to.
  /// Increasing the function's memory also increases its CPU allocation. The
  /// default value is 128 MB. The value must be a multiple of 64 MB.
  ///
  /// [vpcConfig]: For network connectivity to AWS resources in a VPC, specify a
  /// list of security groups and subnets in the VPC. When you connect a
  /// function to a VPC, it can only access resources and the internet through
  /// that VPC. For more information, see [VPC
  /// Settings](https://docs.aws.amazon.com/lambda/latest/dg/vpc.html).
  ///
  /// [environment]: Environment variables that are accessible from function
  /// code during execution.
  ///
  /// [runtime]: The identifier of the function's
  /// [runtime](https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html).
  ///
  /// [deadLetterConfig]: A dead letter queue configuration that specifies the
  /// queue or topic where Lambda sends asynchronous events when they fail
  /// processing. For more information, see [Dead Letter
  /// Queues](https://docs.aws.amazon.com/lambda/latest/dg/dlq.html).
  ///
  /// [kmsKeyArn]: The ARN of the AWS Key Management Service (AWS KMS) key
  /// that's used to encrypt your function's environment variables. If it's not
  /// provided, AWS Lambda uses a default service key.
  ///
  /// [tracingConfig]: Set `Mode` to `Active` to sample and trace a subset of
  /// incoming requests with AWS X-Ray.
  ///
  /// [revisionId]: Only update the function if the revision ID matches the ID
  /// that's specified. Use this option to avoid modifying a function that has
  /// changed since you last read it.
  ///
  /// [layers]: A list of [function
  /// layers](https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html)
  /// to add to the function's execution environment. Specify each layer by its
  /// ARN, including the version.
  Future<FunctionConfiguration> updateFunctionConfiguration(String functionName,
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
      List<String> layers}) async {
    return FunctionConfiguration.fromJson({});
  }
}

class AccountLimit {
  /// The amount of storage space that you can use for all deployment packages
  /// and layer archives.
  final BigInt totalCodeSize;

  /// The maximum size of your function's code and layers when they're
  /// extracted.
  final BigInt codeSizeUnzipped;

  /// The maximum size of a deployment package when it's uploaded directly to
  /// AWS Lambda. Use Amazon S3 for larger files.
  final BigInt codeSizeZipped;

  /// The maximum number of simultaneous function executions.
  final int concurrentExecutions;

  /// The maximum number of simultaneous function executions, minus the capacity
  /// that's reserved for individual functions with PutFunctionConcurrency.
  final int unreservedConcurrentExecutions;

  AccountLimit({
    this.totalCodeSize,
    this.codeSizeUnzipped,
    this.codeSizeZipped,
    this.concurrentExecutions,
    this.unreservedConcurrentExecutions,
  });
  static AccountLimit fromJson(Map<String, dynamic> json) => AccountLimit();
}

class AccountUsage {
  /// The amount of storage space, in bytes, that's being used by deployment
  /// packages and layer archives.
  final BigInt totalCodeSize;

  /// The number of Lambda functions.
  final BigInt functionCount;

  AccountUsage({
    this.totalCodeSize,
    this.functionCount,
  });
  static AccountUsage fromJson(Map<String, dynamic> json) => AccountUsage();
}

class AddLayerVersionPermissionResponse {
  /// The permission statement.
  final String statement;

  /// A unique identifier for the current revision of the policy.
  final String revisionId;

  AddLayerVersionPermissionResponse({
    this.statement,
    this.revisionId,
  });
  static AddLayerVersionPermissionResponse fromJson(
          Map<String, dynamic> json) =>
      AddLayerVersionPermissionResponse();
}

class AddPermissionResponse {
  /// The permission statement that's added to the function policy.
  final String statement;

  AddPermissionResponse({
    this.statement,
  });
  static AddPermissionResponse fromJson(Map<String, dynamic> json) =>
      AddPermissionResponse();
}

class AliasConfiguration {
  /// The Amazon Resource Name (ARN) of the alias.
  final String aliasArn;

  /// The name of the alias.
  final String name;

  /// The function version that the alias invokes.
  final String functionVersion;

  /// A description of the alias.
  final String description;

  /// The [routing
  /// configuration](https://docs.aws.amazon.com/lambda/latest/dg/lambda-traffic-shifting-using-aliases.html)
  /// of the alias.
  final AliasRoutingConfiguration routingConfig;

  /// A unique identifier that changes when you update the alias.
  final String revisionId;

  AliasConfiguration({
    this.aliasArn,
    this.name,
    this.functionVersion,
    this.description,
    this.routingConfig,
    this.revisionId,
  });
  static AliasConfiguration fromJson(Map<String, dynamic> json) =>
      AliasConfiguration();
}

class AliasRoutingConfiguration {
  /// The name of the second alias, and the percentage of traffic that's routed
  /// to it.
  final Map<String, double> additionalVersionWeights;

  AliasRoutingConfiguration({
    this.additionalVersionWeights,
  });
  static AliasRoutingConfiguration fromJson(Map<String, dynamic> json) =>
      AliasRoutingConfiguration();
}

class Concurrency {
  /// The number of concurrent executions that are reserved for this function.
  /// For more information, see [Managing
  /// Concurrency](https://docs.aws.amazon.com/lambda/latest/dg/concurrent-executions.html).
  final int reservedConcurrentExecutions;

  Concurrency({
    this.reservedConcurrentExecutions,
  });
  static Concurrency fromJson(Map<String, dynamic> json) => Concurrency();
}

class DeadLetterConfig {
  /// The Amazon Resource Name (ARN) of an Amazon SQS queue or Amazon SNS topic.
  final String targetArn;

  DeadLetterConfig({
    this.targetArn,
  });
  static DeadLetterConfig fromJson(Map<String, dynamic> json) =>
      DeadLetterConfig();
}

class Environment {
  /// Environment variable key-value pairs.
  final Map<String, String> variables;

  Environment({
    this.variables,
  });
}

class EnvironmentError {
  /// The error code.
  final String errorCode;

  /// The error message.
  final String message;

  EnvironmentError({
    this.errorCode,
    this.message,
  });
  static EnvironmentError fromJson(Map<String, dynamic> json) =>
      EnvironmentError();
}

class EnvironmentResponse {
  /// Environment variable key-value pairs.
  final Map<String, String> variables;

  /// Error messages for environment variables that couldn't be applied.
  final EnvironmentError error;

  EnvironmentResponse({
    this.variables,
    this.error,
  });
  static EnvironmentResponse fromJson(Map<String, dynamic> json) =>
      EnvironmentResponse();
}

class EventSourceMappingConfiguration {
  /// The identifier of the event source mapping.
  final String uuid;

  /// The maximum number of items to retrieve in a single batch.
  final int batchSize;

  final int maximumBatchingWindowInSeconds;

  /// The Amazon Resource Name (ARN) of the event source.
  final String eventSourceArn;

  /// The ARN of the Lambda function.
  final String functionArn;

  /// The date that the event source mapping was last updated.
  final DateTime lastModified;

  /// The result of the last AWS Lambda invocation of your Lambda function.
  final String lastProcessingResult;

  /// The state of the event source mapping. It can be one of the following:
  /// `Creating`, `Enabling`, `Enabled`, `Disabling`, `Disabled`, `Updating`, or
  /// `Deleting`.
  final String state;

  /// The cause of the last state change, either `User initiated` or `Lambda
  /// initiated`.
  final String stateTransitionReason;

  EventSourceMappingConfiguration({
    this.uuid,
    this.batchSize,
    this.maximumBatchingWindowInSeconds,
    this.eventSourceArn,
    this.functionArn,
    this.lastModified,
    this.lastProcessingResult,
    this.state,
    this.stateTransitionReason,
  });
  static EventSourceMappingConfiguration fromJson(Map<String, dynamic> json) =>
      EventSourceMappingConfiguration();
}

class FunctionCode {
  /// The base64-encoded contents of the deployment package. AWS SDK and AWS CLI
  /// clients handle the encoding for you.
  final Uint8List zipFile;

  /// An Amazon S3 bucket in the same AWS Region as your function. The bucket
  /// can be in a different AWS account.
  final String s3Bucket;

  /// The Amazon S3 key of the deployment package.
  final String s3Key;

  /// For versioned objects, the version of the deployment package object to
  /// use.
  final String s3ObjectVersion;

  FunctionCode({
    this.zipFile,
    this.s3Bucket,
    this.s3Key,
    this.s3ObjectVersion,
  });
}

class FunctionCodeLocation {
  /// The service that's hosting the file.
  final String repositoryType;

  /// A presigned URL that you can use to download the deployment package.
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

  /// The function's Amazon Resource Name (ARN).
  final String functionArn;

  /// The runtime environment for the Lambda function.
  final String runtime;

  /// The function's execution role.
  final String role;

  /// The function that Lambda calls to begin executing your function.
  final String handler;

  /// The size of the function's deployment package, in bytes.
  final BigInt codeSize;

  /// The function's description.
  final String description;

  /// The amount of time that Lambda allows a function to run before stopping
  /// it.
  final int timeout;

  /// The memory that's allocated to the function.
  final int memorySize;

  /// The date and time that the function was last updated, in [ISO-8601
  /// format](https://www.w3.org/TR/NOTE-datetime) (YYYY-MM-DDThh:mm:ss.sTZD).
  final String lastModified;

  /// The SHA256 hash of the function's deployment package.
  final String codeSha256;

  /// The version of the Lambda function.
  final String version;

  /// The function's networking configuration.
  final VpcConfigResponse vpcConfig;

  /// The function's dead letter queue.
  final DeadLetterConfig deadLetterConfig;

  /// The function's environment variables.
  final EnvironmentResponse environment;

  /// The KMS key that's used to encrypt the function's environment variables.
  /// This key is only returned if you've configured a customer-managed CMK.
  final String kmsKeyArn;

  /// The function's AWS X-Ray tracing configuration.
  final TracingConfigResponse tracingConfig;

  /// For Lambda@Edge functions, the ARN of the master function.
  final String masterArn;

  /// The latest updated revision of the function or alias.
  final String revisionId;

  /// The function's
  /// [layers](https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html).
  final List<Layer> layers;

  FunctionConfiguration({
    this.functionName,
    this.functionArn,
    this.runtime,
    this.role,
    this.handler,
    this.codeSize,
    this.description,
    this.timeout,
    this.memorySize,
    this.lastModified,
    this.codeSha256,
    this.version,
    this.vpcConfig,
    this.deadLetterConfig,
    this.environment,
    this.kmsKeyArn,
    this.tracingConfig,
    this.masterArn,
    this.revisionId,
    this.layers,
  });
  static FunctionConfiguration fromJson(Map<String, dynamic> json) =>
      FunctionConfiguration();
}

class GetAccountSettingsResponse {
  /// Limits that are related to concurrency and code storage.
  final AccountLimit accountLimit;

  /// The number of functions and amount of storage in use.
  final AccountUsage accountUsage;

  GetAccountSettingsResponse({
    this.accountLimit,
    this.accountUsage,
  });
  static GetAccountSettingsResponse fromJson(Map<String, dynamic> json) =>
      GetAccountSettingsResponse();
}

class GetFunctionResponse {
  /// The configuration of the function or version.
  final FunctionConfiguration configuration;

  /// The deployment package of the function or version.
  final FunctionCodeLocation code;

  /// The function's
  /// [tags](https://docs.aws.amazon.com/lambda/latest/dg/tagging.html).
  final Map<String, String> tags;

  /// The function's [reserved
  /// concurrency](https://docs.aws.amazon.com/lambda/latest/dg/concurrent-executions.html).
  final Concurrency concurrency;

  GetFunctionResponse({
    this.configuration,
    this.code,
    this.tags,
    this.concurrency,
  });
  static GetFunctionResponse fromJson(Map<String, dynamic> json) =>
      GetFunctionResponse();
}

class GetLayerVersionPolicyResponse {
  /// The policy document.
  final String policy;

  /// A unique identifier for the current revision of the policy.
  final String revisionId;

  GetLayerVersionPolicyResponse({
    this.policy,
    this.revisionId,
  });
  static GetLayerVersionPolicyResponse fromJson(Map<String, dynamic> json) =>
      GetLayerVersionPolicyResponse();
}

class GetLayerVersionResponse {
  /// Details about the layer version.
  final LayerVersionContentOutput content;

  /// The ARN of the layer.
  final String layerArn;

  /// The ARN of the layer version.
  final String layerVersionArn;

  /// The description of the version.
  final String description;

  /// The date that the layer version was created, in [ISO-8601
  /// format](https://www.w3.org/TR/NOTE-datetime) (YYYY-MM-DDThh:mm:ss.sTZD).
  final String createdDate;

  /// The version number.
  final BigInt version;

  /// The layer's compatible runtimes.
  final List<String> compatibleRuntimes;

  /// The layer's software license.
  final String licenseInfo;

  GetLayerVersionResponse({
    this.content,
    this.layerArn,
    this.layerVersionArn,
    this.description,
    this.createdDate,
    this.version,
    this.compatibleRuntimes,
    this.licenseInfo,
  });
  static GetLayerVersionResponse fromJson(Map<String, dynamic> json) =>
      GetLayerVersionResponse();
}

class GetPolicyResponse {
  /// The resource-based policy.
  final String policy;

  /// A unique identifier for the current revision of the policy.
  final String revisionId;

  GetPolicyResponse({
    this.policy,
    this.revisionId,
  });
  static GetPolicyResponse fromJson(Map<String, dynamic> json) =>
      GetPolicyResponse();
}

class InvocationResponse {
  /// The HTTP status code is in the 200 range for a successful request. For the
  /// `RequestResponse` invocation type, this status code is 200. For the
  /// `Event` invocation type, this status code is 202. For the `DryRun`
  /// invocation type, the status code is 204.
  final int statusCode;

  /// If present, indicates that an error occurred during function execution.
  /// Details about the error are included in the response payload.
  ///
  /// *    `Handled` \- The runtime caught an error thrown by the function and
  /// formatted it into a JSON document.
  ///
  /// *    `Unhandled` \- The runtime didn't handle the error. For example, the
  /// function ran out of memory or timed out.
  final String functionError;

  /// The last 4 KB of the execution log, which is base64 encoded.
  final String logResult;

  /// The response from the function, or an error object.
  final Uint8List payload;

  /// The version of the function that executed. When you invoke a function with
  /// an alias, this indicates which version the alias resolved to.
  final String executedVersion;

  InvocationResponse({
    this.statusCode,
    this.functionError,
    this.logResult,
    this.payload,
    this.executedVersion,
  });
  static InvocationResponse fromJson(Map<String, dynamic> json) =>
      InvocationResponse();
}

class InvokeAsyncResponse {
  /// The status code.
  final int status;

  InvokeAsyncResponse({
    this.status,
  });
  static InvokeAsyncResponse fromJson(Map<String, dynamic> json) =>
      InvokeAsyncResponse();
}

class Layer {
  /// The Amazon Resource Name (ARN) of the function layer.
  final String arn;

  /// The size of the layer archive in bytes.
  final BigInt codeSize;

  Layer({
    this.arn,
    this.codeSize,
  });
  static Layer fromJson(Map<String, dynamic> json) => Layer();
}

class LayerVersionContentInput {
  /// The Amazon S3 bucket of the layer archive.
  final String s3Bucket;

  /// The Amazon S3 key of the layer archive.
  final String s3Key;

  /// For versioned objects, the version of the layer archive object to use.
  final String s3ObjectVersion;

  /// The base64-encoded contents of the layer archive. AWS SDK and AWS CLI
  /// clients handle the encoding for you.
  final Uint8List zipFile;

  LayerVersionContentInput({
    this.s3Bucket,
    this.s3Key,
    this.s3ObjectVersion,
    this.zipFile,
  });
}

class LayerVersionContentOutput {
  /// A link to the layer archive in Amazon S3 that is valid for 10 minutes.
  final String location;

  /// The SHA-256 hash of the layer archive.
  final String codeSha256;

  /// The size of the layer archive in bytes.
  final BigInt codeSize;

  LayerVersionContentOutput({
    this.location,
    this.codeSha256,
    this.codeSize,
  });
  static LayerVersionContentOutput fromJson(Map<String, dynamic> json) =>
      LayerVersionContentOutput();
}

class LayerVersionsListItem {
  /// The ARN of the layer version.
  final String layerVersionArn;

  /// The version number.
  final BigInt version;

  /// The description of the version.
  final String description;

  /// The date that the version was created, in ISO 8601 format. For example,
  /// `2018-11-27T15:10:45.123+0000`.
  final String createdDate;

  /// The layer's compatible runtimes.
  final List<String> compatibleRuntimes;

  /// The layer's open-source license.
  final String licenseInfo;

  LayerVersionsListItem({
    this.layerVersionArn,
    this.version,
    this.description,
    this.createdDate,
    this.compatibleRuntimes,
    this.licenseInfo,
  });
  static LayerVersionsListItem fromJson(Map<String, dynamic> json) =>
      LayerVersionsListItem();
}

class LayersListItem {
  /// The name of the layer.
  final String layerName;

  /// The Amazon Resource Name (ARN) of the function layer.
  final String layerArn;

  /// The newest version of the layer.
  final LayerVersionsListItem latestMatchingVersion;

  LayersListItem({
    this.layerName,
    this.layerArn,
    this.latestMatchingVersion,
  });
  static LayersListItem fromJson(Map<String, dynamic> json) => LayersListItem();
}

class ListAliasesResponse {
  /// The pagination token that's included if more results are available.
  final String nextMarker;

  /// A list of aliases.
  final List<AliasConfiguration> aliases;

  ListAliasesResponse({
    this.nextMarker,
    this.aliases,
  });
  static ListAliasesResponse fromJson(Map<String, dynamic> json) =>
      ListAliasesResponse();
}

class ListEventSourceMappingsResponse {
  /// A pagination token that's returned when the response doesn't contain all
  /// event source mappings.
  final String nextMarker;

  /// A list of event source mappings.
  final List<EventSourceMappingConfiguration> eventSourceMappings;

  ListEventSourceMappingsResponse({
    this.nextMarker,
    this.eventSourceMappings,
  });
  static ListEventSourceMappingsResponse fromJson(Map<String, dynamic> json) =>
      ListEventSourceMappingsResponse();
}

class ListFunctionsResponse {
  /// The pagination token that's included if more results are available.
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

class ListLayerVersionsResponse {
  /// A pagination token returned when the response doesn't contain all
  /// versions.
  final String nextMarker;

  /// A list of versions.
  final List<LayerVersionsListItem> layerVersions;

  ListLayerVersionsResponse({
    this.nextMarker,
    this.layerVersions,
  });
  static ListLayerVersionsResponse fromJson(Map<String, dynamic> json) =>
      ListLayerVersionsResponse();
}

class ListLayersResponse {
  /// A pagination token returned when the response doesn't contain all layers.
  final String nextMarker;

  /// A list of function layers.
  final List<LayersListItem> layers;

  ListLayersResponse({
    this.nextMarker,
    this.layers,
  });
  static ListLayersResponse fromJson(Map<String, dynamic> json) =>
      ListLayersResponse();
}

class ListTagsResponse {
  /// The function's tags.
  final Map<String, String> tags;

  ListTagsResponse({
    this.tags,
  });
  static ListTagsResponse fromJson(Map<String, dynamic> json) =>
      ListTagsResponse();
}

class ListVersionsByFunctionResponse {
  /// The pagination token that's included if more results are available.
  final String nextMarker;

  /// A list of Lambda function versions.
  final List<FunctionConfiguration> versions;

  ListVersionsByFunctionResponse({
    this.nextMarker,
    this.versions,
  });
  static ListVersionsByFunctionResponse fromJson(Map<String, dynamic> json) =>
      ListVersionsByFunctionResponse();
}

class PublishLayerVersionResponse {
  /// Details about the layer version.
  final LayerVersionContentOutput content;

  /// The ARN of the layer.
  final String layerArn;

  /// The ARN of the layer version.
  final String layerVersionArn;

  /// The description of the version.
  final String description;

  /// The date that the layer version was created, in [ISO-8601
  /// format](https://www.w3.org/TR/NOTE-datetime) (YYYY-MM-DDThh:mm:ss.sTZD).
  final String createdDate;

  /// The version number.
  final BigInt version;

  /// The layer's compatible runtimes.
  final List<String> compatibleRuntimes;

  /// The layer's software license.
  final String licenseInfo;

  PublishLayerVersionResponse({
    this.content,
    this.layerArn,
    this.layerVersionArn,
    this.description,
    this.createdDate,
    this.version,
    this.compatibleRuntimes,
    this.licenseInfo,
  });
  static PublishLayerVersionResponse fromJson(Map<String, dynamic> json) =>
      PublishLayerVersionResponse();
}

class TracingConfig {
  /// The tracing mode.
  final String mode;

  TracingConfig({
    this.mode,
  });
}

class TracingConfigResponse {
  /// The tracing mode.
  final String mode;

  TracingConfigResponse({
    this.mode,
  });
  static TracingConfigResponse fromJson(Map<String, dynamic> json) =>
      TracingConfigResponse();
}

class VpcConfig {
  /// A list of VPC subnet IDs.
  final List<String> subnetIds;

  /// A list of VPC security groups IDs.
  final List<String> securityGroupIds;

  VpcConfig({
    this.subnetIds,
    this.securityGroupIds,
  });
}

class VpcConfigResponse {
  /// A list of VPC subnet IDs.
  final List<String> subnetIds;

  /// A list of VPC security groups IDs.
  final List<String> securityGroupIds;

  /// The ID of the VPC.
  final String vpcId;

  VpcConfigResponse({
    this.subnetIds,
    this.securityGroupIds,
    this.vpcId,
  });
  static VpcConfigResponse fromJson(Map<String, dynamic> json) =>
      VpcConfigResponse();
}
