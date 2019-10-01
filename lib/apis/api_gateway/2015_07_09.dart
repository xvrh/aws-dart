import 'package:meta/meta.dart';
import 'dart:typed_data';

/// Amazon API Gateway
///
/// Amazon API Gateway helps developers deliver robust, secure, and scalable
/// mobile and web application back ends. API Gateway allows developers to
/// securely connect mobile and web applications to APIs that run on AWS Lambda,
/// Amazon EC2, or other publicly addressable web services that are hosted
/// outside of AWS.
class ApiGatewayApi {
  /// Create an ApiKey resource.
  ///
  /// [AWS CLI](https://docs.aws.amazon.com/cli/latest/reference/apigateway/create-api-key.html)
  ///
  /// [name]: The name of the ApiKey.
  ///
  /// [description]: The description of the ApiKey.
  ///
  /// [enabled]: Specifies whether the ApiKey can be used by callers.
  ///
  /// [generateDistinctId]: Specifies whether (`true`) or not (`false`) the key
  /// identifier is distinct from the created API key value.
  ///
  /// [value]: Specifies a value of the API key.
  ///
  /// [stageKeys]: DEPRECATED FOR USAGE PLANS - Specifies stages associated with
  /// the API key.
  ///
  /// [customerId]: An AWS Marketplace customer identifier , when integrating
  /// with the AWS SaaS Marketplace.
  ///
  /// [tags]: The key-value map of strings. The valid character set is
  /// [a-zA-Z+-=._:/]. The tag key can be up to 128 characters and must not
  /// start with `aws:`. The tag value can be up to 256 characters.
  Future<ApiKey> createApiKey(
      {String name,
      String description,
      bool enabled,
      bool generateDistinctId,
      String value,
      List<StageKey> stageKeys,
      String customerId,
      Map<String, String> tags}) async {
    return ApiKey.fromJson({});
  }

  /// Adds a new Authorizer resource to an existing RestApi resource.
  ///
  /// [AWS CLI](https://docs.aws.amazon.com/cli/latest/reference/apigateway/create-authorizer.html)
  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [name]: *required* The name of the authorizer.
  ///
  /// [type]: *required* The authorizer type. Valid values are `TOKEN` for a
  /// Lambda function using a single authorization token submitted in a custom
  /// header, `REQUEST` for a Lambda function using incoming request parameters,
  /// and `COGNITO_USER_POOLS` for using an Amazon Cognito user pool.
  ///
  /// [providerARNs]: A list of the Amazon Cognito user pool ARNs for the
  /// `COGNITO_USER_POOLS` authorizer. Each element is of this format:
  /// `arn:aws:cognito-idp:{region}:{account_id}:userpool/{user_pool_id}`. For a
  /// `TOKEN` or `REQUEST` authorizer, this is not defined.
  ///
  /// [authType]: Optional customer-defined field, used in OpenAPI imports and
  /// exports without functional impact.
  ///
  /// [authorizerUri]: Specifies the authorizer's Uniform Resource Identifier
  /// (URI). For `TOKEN` or `REQUEST` authorizers, this must be a well-formed
  /// Lambda function URI, for example,
  /// `arn:aws:apigateway:us-west-2:lambda:path/2015-03-31/functions/arn:aws:lambda:us-west-2:{account_id}:function:{lambda_function_name}/invocations`.
  /// In general, the URI has this form
  /// `arn:aws:apigateway:{region}:lambda:path/{service_api}`, where `{region}`
  /// is the same as the region hosting the Lambda function, `path` indicates
  /// that the remaining substring in the URI should be treated as the path to
  /// the resource, including the initial `/`. For Lambda functions, this is
  /// usually of the form `/2015-03-31/functions/[FunctionARN]/invocations`.
  ///
  /// [authorizerCredentials]: Specifies the required credentials as an IAM role
  /// for API Gateway to invoke the authorizer. To specify an IAM role for API
  /// Gateway to assume, use the role's Amazon Resource Name (ARN). To use
  /// resource-based permissions on the Lambda function, specify null.
  ///
  /// [identitySource]: The identity source for which authorization is
  /// requested.
  ///
  /// *   For a `TOKEN` or `COGNITO_USER_POOLS` authorizer, this is required and
  /// specifies the request header mapping expression for the custom header
  /// holding the authorization token submitted by the client. For example, if
  /// the token header name is `Auth`, the header mapping expression is
  /// `method.request.header.Auth`.
  /// *   For the `REQUEST` authorizer, this is required when authorization
  /// caching is enabled. The value is a comma-separated string of one or more
  /// mapping expressions of the specified request parameters. For example, if
  /// an `Auth` header, a `Name` query string parameter are defined as identity
  /// sources, this value is `method.request.header.Auth,
  /// method.request.querystring.Name`. These parameters will be used to derive
  /// the authorization caching key and to perform runtime validation of the
  /// `REQUEST` authorizer by verifying all of the identity-related request
  /// parameters are present, not null and non-empty. Only when this is true
  /// does the authorizer invoke the authorizer Lambda function, otherwise, it
  /// returns a 401 Unauthorized response without calling the Lambda function.
  /// The valid value is a string of comma-separated mapping expressions of the
  /// specified request parameters. When the authorization caching is not
  /// enabled, this property is optional.
  ///
  /// [identityValidationExpression]: A validation expression for the incoming
  /// identity token. For `TOKEN` authorizers, this value is a regular
  /// expression. For `COGNITO_USER_POOLS` authorizers, API Gateway will match
  /// the `aud` field of the incoming token from the client against the
  /// specified regular expression. It will invoke the authorizer's Lambda
  /// function when there is a match. Otherwise, it will return a 401
  /// Unauthorized response without calling the Lambda function. The validation
  /// expression does not apply to the `REQUEST` authorizer.
  ///
  /// [authorizerResultTtlInSeconds]: The TTL in seconds of cached authorizer
  /// results. If it equals 0, authorization caching is disabled. If it is
  /// greater than 0, API Gateway will cache authorizer responses. If this field
  /// is not set, the default value is 300. The maximum value is 3600, or 1
  /// hour.
  Future<Authorizer> createAuthorizer(
      {@required String restApiId,
      @required String name,
      @required String type,
      List<String> providerARNs,
      String authType,
      String authorizerUri,
      String authorizerCredentials,
      String identitySource,
      String identityValidationExpression,
      int authorizerResultTtlInSeconds}) async {
    return Authorizer.fromJson({});
  }

  /// Creates a new BasePathMapping resource.
  ///
  /// [domainName]: *required* The domain name of the BasePathMapping resource
  /// to create.
  ///
  /// [basePath]: The base path name that callers of the API must provide as
  /// part of the URL after the domain name. This value must be unique for all
  /// of the mappings across a single API. Specify '(none)' if you do not want
  /// callers to specify a base path name after the domain name.
  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [stage]: The name of the API's stage that you want to use for this
  /// mapping. Specify '(none)' if you do not want callers to explicitly specify
  /// the stage name after any base path name.
  Future<BasePathMapping> createBasePathMapping(
      {@required String domainName,
      String basePath,
      @required String restApiId,
      String stage}) async {
    return BasePathMapping.fromJson({});
  }

  /// Creates a Deployment resource, which makes a specified RestApi callable
  /// over the internet.
  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [stageName]: The name of the Stage resource for the Deployment resource to
  /// create.
  ///
  /// [stageDescription]: The description of the Stage resource for the
  /// Deployment resource to create.
  ///
  /// [description]: The description for the Deployment resource to create.
  ///
  /// [cacheClusterEnabled]: Enables a cache cluster for the Stage resource
  /// specified in the input.
  ///
  /// [cacheClusterSize]: Specifies the cache cluster size for the Stage
  /// resource specified in the input, if a cache cluster is enabled.
  ///
  /// [variables]: A map that defines the stage variables for the Stage resource
  /// that is associated with the new deployment. Variable names can have
  /// alphanumeric and underscore characters, and the values must match
  /// `[A-Za-z0-9-._~:/?#&=,]+`.
  ///
  /// [canarySettings]: The input configuration for the canary deployment when
  /// the deployment is a canary release deployment.
  ///
  /// [tracingEnabled]: Specifies whether active tracing with X-ray is enabled
  /// for the Stage.
  Future<Deployment> createDeployment(String restApiId,
      {String stageName,
      String stageDescription,
      String description,
      bool cacheClusterEnabled,
      String cacheClusterSize,
      Map<String, String> variables,
      DeploymentCanarySettings canarySettings,
      bool tracingEnabled}) async {
    return Deployment.fromJson({});
  }

  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [location]: *required* The location of the targeted API entity of the
  /// to-be-created documentation part.
  ///
  /// [properties]: *required* The new documentation content map of the targeted
  /// API entity. Enclosed key-value pairs are API-specific, but only
  /// OpenAPI-compliant key-value pairs can be exported and, hence, published.
  Future<DocumentationPart> createDocumentationPart(
      {@required String restApiId,
      @required DocumentationPartLocation location,
      @required String properties}) async {
    return DocumentationPart.fromJson({});
  }

  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [documentationVersion]: *required* The version identifier of the new
  /// snapshot.
  ///
  /// [stageName]: The stage name to be associated with the new documentation
  /// snapshot.
  ///
  /// [description]: A description about the new documentation snapshot.
  Future<DocumentationVersion> createDocumentationVersion(
      {@required String restApiId,
      @required String documentationVersion,
      String stageName,
      String description}) async {
    return DocumentationVersion.fromJson({});
  }

  /// Creates a new domain name.
  ///
  /// [domainName]: *required* The name of the DomainName resource.
  ///
  /// [certificateName]: The user-friendly name of the certificate that will be
  /// used by edge-optimized endpoint for this domain name.
  ///
  /// [certificateBody]: [Deprecated] The body of the server certificate that
  /// will be used by edge-optimized endpoint for this domain name provided by
  /// your certificate authority.
  ///
  /// [certificatePrivateKey]: [Deprecated] Your edge-optimized endpoint's
  /// domain name certificate's private key.
  ///
  /// [certificateChain]: [Deprecated] The intermediate certificates and
  /// optionally the root certificate, one after the other without any blank
  /// lines, used by an edge-optimized endpoint for this domain name. If you
  /// include the root certificate, your certificate chain must start with
  /// intermediate certificates and end with the root certificate. Use the
  /// intermediate certificates that were provided by your certificate
  /// authority. Do not include any intermediaries that are not in the chain of
  /// trust path.
  ///
  /// [certificateArn]: The reference to an AWS-managed certificate that will be
  /// used by edge-optimized endpoint for this domain name. AWS Certificate
  /// Manager is the only supported source.
  ///
  /// [regionalCertificateName]: The user-friendly name of the certificate that
  /// will be used by regional endpoint for this domain name.
  ///
  /// [regionalCertificateArn]: The reference to an AWS-managed certificate that
  /// will be used by regional endpoint for this domain name. AWS Certificate
  /// Manager is the only supported source.
  ///
  /// [endpointConfiguration]: The endpoint configuration of this DomainName
  /// showing the endpoint types of the domain name.
  ///
  /// [tags]: The key-value map of strings. The valid character set is
  /// [a-zA-Z+-=._:/]. The tag key can be up to 128 characters and must not
  /// start with `aws:`. The tag value can be up to 256 characters.
  ///
  /// [securityPolicy]: The Transport Layer Security (TLS) version + cipher
  /// suite for this DomainName. The valid values are `TLS_1_0` and `TLS_1_2`.
  Future<DomainName> createDomainName(String domainName,
      {String certificateName,
      String certificateBody,
      String certificatePrivateKey,
      String certificateChain,
      String certificateArn,
      String regionalCertificateName,
      String regionalCertificateArn,
      EndpointConfiguration endpointConfiguration,
      Map<String, String> tags,
      String securityPolicy}) async {
    return DomainName.fromJson({});
  }

  /// Adds a new Model resource to an existing RestApi resource.
  ///
  /// [restApiId]: *required* The RestApi identifier under which the Model will
  /// be created.
  ///
  /// [name]: *required* The name of the model. Must be alphanumeric.
  ///
  /// [description]: The description of the model.
  ///
  /// [schema]: The schema for the model. For `application/json` models, this
  /// should be
  /// [JSON schema draft 4](https://tools.ietf.org/html/draft-zyp-json-schema-04)
  /// model.
  ///
  /// [contentType]: *required* The content-type for the model.
  Future<Model> createModel(
      {@required String restApiId,
      @required String name,
      String description,
      String schema,
      @required String contentType}) async {
    return Model.fromJson({});
  }

  /// Creates a ReqeustValidator of a given RestApi.
  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [name]: The name of the to-be-created RequestValidator.
  ///
  /// [validateRequestBody]: A Boolean flag to indicate whether to validate
  /// request body according to the configured model schema for the method
  /// (`true`) or not (`false`).
  ///
  /// [validateRequestParameters]: A Boolean flag to indicate whether to
  /// validate request parameters, `true`, or not `false`.
  Future<RequestValidator> createRequestValidator(String restApiId,
      {String name,
      bool validateRequestBody,
      bool validateRequestParameters}) async {
    return RequestValidator.fromJson({});
  }

  /// Creates a Resource resource.
  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [parentId]: *required* The parent resource's identifier.
  ///
  /// [pathPart]: The last path segment for this resource.
  Future<Resource> createResource(
      {@required String restApiId,
      @required String parentId,
      @required String pathPart}) async {
    return Resource.fromJson({});
  }

  /// Creates a new RestApi resource.
  ///
  /// [name]: *required* The name of the RestApi.
  ///
  /// [description]: The description of the RestApi.
  ///
  /// [version]: A version identifier for the API.
  ///
  /// [cloneFrom]: The ID of the RestApi that you want to clone from.
  ///
  /// [binaryMediaTypes]: The list of binary media types supported by the
  /// RestApi. By default, the RestApi supports only UTF-8-encoded text
  /// payloads.
  ///
  /// [minimumCompressionSize]: A nullable integer that is used to enable
  /// compression (with non-negative between 0 and 10485760 (10M) bytes,
  /// inclusive) or disable compression (with a null value) on an API. When
  /// compression is enabled, compression or decompression is not applied on the
  /// payload if the payload size is smaller than this value. Setting it to zero
  /// allows compression for any payload size.
  ///
  /// [apiKeySource]: The source of the API key for metering requests according
  /// to a usage plan. Valid values are:
  ///
  /// *   `HEADER` to read the API key from the `X-API-Key` header of a request.
  /// *   `AUTHORIZER` to read the API key from the `UsageIdentifierKey` from a
  /// custom authorizer.
  ///
  /// [endpointConfiguration]: The endpoint configuration of this RestApi
  /// showing the endpoint types of the API.
  ///
  /// [policy]: A stringified JSON policy document that applies to this RestApi
  /// regardless of the caller and Method configuration.
  ///
  /// [tags]: The key-value map of strings. The valid character set is
  /// [a-zA-Z+-=._:/]. The tag key can be up to 128 characters and must not
  /// start with `aws:`. The tag value can be up to 256 characters.
  Future<RestApi> createRestApi(String name,
      {String description,
      String version,
      String cloneFrom,
      List<String> binaryMediaTypes,
      int minimumCompressionSize,
      String apiKeySource,
      EndpointConfiguration endpointConfiguration,
      String policy,
      Map<String, String> tags}) async {
    return RestApi.fromJson({});
  }

  /// Creates a new Stage resource that references a pre-existing Deployment for
  /// the API.
  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [stageName]: *required* The name for the Stage resource. Stage names can
  /// only contain alphanumeric characters, hyphens, and underscores. Maximum
  /// length is 128 characters.
  ///
  /// [deploymentId]: *required* The identifier of the Deployment resource for
  /// the Stage resource.
  ///
  /// [description]: The description of the Stage resource.
  ///
  /// [cacheClusterEnabled]: Whether cache clustering is enabled for the stage.
  ///
  /// [cacheClusterSize]: The stage's cache cluster size.
  ///
  /// [variables]: A map that defines the stage variables for the new Stage
  /// resource. Variable names can have alphanumeric and underscore characters,
  /// and the values must match `[A-Za-z0-9-._~:/?#&=,]+`.
  ///
  /// [documentationVersion]: The version of the associated API documentation.
  ///
  /// [canarySettings]: The canary deployment settings of this stage.
  ///
  /// [tracingEnabled]: Specifies whether active tracing with X-ray is enabled
  /// for the Stage.
  ///
  /// [tags]: The key-value map of strings. The valid character set is
  /// [a-zA-Z+-=._:/]. The tag key can be up to 128 characters and must not
  /// start with `aws:`. The tag value can be up to 256 characters.
  Future<Stage> createStage(
      {@required String restApiId,
      @required String stageName,
      @required String deploymentId,
      String description,
      bool cacheClusterEnabled,
      String cacheClusterSize,
      Map<String, String> variables,
      String documentationVersion,
      CanarySettings canarySettings,
      bool tracingEnabled,
      Map<String, String> tags}) async {
    return Stage.fromJson({});
  }

  /// Creates a usage plan with the throttle and quota limits, as well as the
  /// associated API stages, specified in the payload.
  ///
  /// [name]: *required* The name of the usage plan.
  ///
  /// [description]: The description of the usage plan.
  ///
  /// [apiStages]: The associated API stages of the usage plan.
  ///
  /// [throttle]: The throttling limits of the usage plan.
  ///
  /// [quota]: The quota of the usage plan.
  ///
  /// [tags]: The key-value map of strings. The valid character set is
  /// [a-zA-Z+-=._:/]. The tag key can be up to 128 characters and must not
  /// start with `aws:`. The tag value can be up to 256 characters.
  Future<UsagePlan> createUsagePlan(String name,
      {String description,
      List<ApiStage> apiStages,
      ThrottleSettings throttle,
      QuotaSettings quota,
      Map<String, String> tags}) async {
    return UsagePlan.fromJson({});
  }

  /// Creates a usage plan key for adding an existing API key to a usage plan.
  ///
  /// [usagePlanId]: *required* The Id of the UsagePlan resource representing
  /// the usage plan containing the to-be-created UsagePlanKey resource
  /// representing a plan customer.
  ///
  /// [keyId]: *required* The identifier of a UsagePlanKey resource for a plan
  /// customer.
  ///
  /// [keyType]: *required* The type of a UsagePlanKey resource for a plan
  /// customer.
  Future<UsagePlanKey> createUsagePlanKey(
      {@required String usagePlanId,
      @required String keyId,
      @required String keyType}) async {
    return UsagePlanKey.fromJson({});
  }

  /// Creates a VPC link, under the caller's account in a selected region, in an
  /// asynchronous operation that typically takes 2-4 minutes to complete and
  /// become operational. The caller must have permissions to create and update
  /// VPC Endpoint services.
  ///
  /// [name]: *required* The name used to label and identify the VPC link.
  ///
  /// [description]: The description of the VPC link.
  ///
  /// [targetArns]: *required* The ARNs of network load balancers of the VPC
  /// targeted by the VPC link. The network load balancers must be owned by the
  /// same AWS account of the API owner.
  ///
  /// [tags]: The key-value map of strings. The valid character set is
  /// [a-zA-Z+-=._:/]. The tag key can be up to 128 characters and must not
  /// start with `aws:`. The tag value can be up to 256 characters.
  Future<VpcLink> createVpcLink(
      {@required String name,
      String description,
      @required List<String> targetArns,
      Map<String, String> tags}) async {
    return VpcLink.fromJson({});
  }

  /// Deletes the ApiKey resource.
  ///
  /// [apiKey]: *required* The identifier of the ApiKey resource to be deleted.
  Future<void> deleteApiKey(String apiKey) async {}

  /// Deletes an existing Authorizer resource.
  ///
  /// [AWS CLI](https://docs.aws.amazon.com/cli/latest/reference/apigateway/delete-authorizer.html)
  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [authorizerId]: *required* The identifier of the Authorizer resource.
  Future<void> deleteAuthorizer(
      {@required String restApiId, @required String authorizerId}) async {}

  /// Deletes the BasePathMapping resource.
  ///
  /// [domainName]: *required* The domain name of the BasePathMapping resource
  /// to delete.
  ///
  /// [basePath]: *required* The base path name of the BasePathMapping resource
  /// to delete.
  ///
  /// To specify an empty base path, set this parameter to `'(none)'`.
  Future<void> deleteBasePathMapping(
      {@required String domainName, @required String basePath}) async {}

  /// Deletes the ClientCertificate resource.
  ///
  /// [clientCertificateId]: *required* The identifier of the ClientCertificate
  /// resource to be deleted.
  Future<void> deleteClientCertificate(String clientCertificateId) async {}

  /// Deletes a Deployment resource. Deleting a deployment will only succeed if
  /// there are no Stage resources associated with it.
  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [deploymentId]: *required* The identifier of the Deployment resource to
  /// delete.
  Future<void> deleteDeployment(
      {@required String restApiId, @required String deploymentId}) async {}

  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [documentationPartId]: *required* The identifier of the to-be-deleted
  /// documentation part.
  Future<void> deleteDocumentationPart(
      {@required String restApiId,
      @required String documentationPartId}) async {}

  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [documentationVersion]: *required* The version identifier of a
  /// to-be-deleted documentation snapshot.
  Future<void> deleteDocumentationVersion(
      {@required String restApiId,
      @required String documentationVersion}) async {}

  /// Deletes the DomainName resource.
  ///
  /// [domainName]: *required* The name of the DomainName resource to be
  /// deleted.
  Future<void> deleteDomainName(String domainName) async {}

  /// Clears any customization of a GatewayResponse of a specified response type
  /// on the given RestApi and resets it with the default settings.
  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [responseType]: *required*
  ///
  /// The response type of the associated GatewayResponse. Valid values are
  ///
  /// *   ACCESS_DENIED
  /// *   API_CONFIGURATION_ERROR
  /// *   AUTHORIZER_FAILURE
  /// *    AUTHORIZER_CONFIGURATION_ERROR
  /// *   BAD_REQUEST_PARAMETERS
  /// *   BAD_REQUEST_BODY
  /// *   DEFAULT_4XX
  /// *   DEFAULT_5XX
  /// *   EXPIRED_TOKEN
  /// *   INVALID_SIGNATURE
  /// *   INTEGRATION_FAILURE
  /// *   INTEGRATION_TIMEOUT
  /// *   INVALID_API_KEY
  /// *   MISSING_AUTHENTICATION_TOKEN
  /// *    QUOTA_EXCEEDED
  /// *   REQUEST_TOO_LARGE
  /// *   RESOURCE_NOT_FOUND
  /// *   THROTTLED
  /// *   UNAUTHORIZED
  /// *   UNSUPPORTED_MEDIA_TYPE
  Future<void> deleteGatewayResponse(
      {@required String restApiId, @required String responseType}) async {}

  /// Represents a delete integration.
  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [resourceId]: *required* Specifies a delete integration request's resource
  /// identifier.
  ///
  /// [httpMethod]: *required* Specifies a delete integration request's HTTP
  /// method.
  Future<void> deleteIntegration(
      {@required String restApiId,
      @required String resourceId,
      @required String httpMethod}) async {}

  /// Represents a delete integration response.
  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [resourceId]: *required* Specifies a delete integration response request's
  /// resource identifier.
  ///
  /// [httpMethod]: *required* Specifies a delete integration response request's
  /// HTTP method.
  ///
  /// [statusCode]: *required* Specifies a delete integration response request's
  /// status code.
  Future<void> deleteIntegrationResponse(
      {@required String restApiId,
      @required String resourceId,
      @required String httpMethod,
      @required String statusCode}) async {}

  /// Deletes an existing Method resource.
  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [resourceId]: *required* The Resource identifier for the Method resource.
  ///
  /// [httpMethod]: *required* The HTTP verb of the Method resource.
  Future<void> deleteMethod(
      {@required String restApiId,
      @required String resourceId,
      @required String httpMethod}) async {}

  /// Deletes an existing MethodResponse resource.
  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [resourceId]: *required* The Resource identifier for the MethodResponse
  /// resource.
  ///
  /// [httpMethod]: *required* The HTTP verb of the Method resource.
  ///
  /// [statusCode]: *required* The status code identifier for the MethodResponse
  /// resource.
  Future<void> deleteMethodResponse(
      {@required String restApiId,
      @required String resourceId,
      @required String httpMethod,
      @required String statusCode}) async {}

  /// Deletes a model.
  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [modelName]: *required* The name of the model to delete.
  Future<void> deleteModel(
      {@required String restApiId, @required String modelName}) async {}

  /// Deletes a RequestValidator of a given RestApi.
  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [requestValidatorId]: *required* The identifier of the RequestValidator to
  /// be deleted.
  Future<void> deleteRequestValidator(
      {@required String restApiId,
      @required String requestValidatorId}) async {}

  /// Deletes a Resource resource.
  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [resourceId]: *required* The identifier of the Resource resource.
  Future<void> deleteResource(
      {@required String restApiId, @required String resourceId}) async {}

  /// Deletes the specified API.
  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  Future<void> deleteRestApi(String restApiId) async {}

  /// Deletes a Stage resource.
  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [stageName]: *required* The name of the Stage resource to delete.
  Future<void> deleteStage(
      {@required String restApiId, @required String stageName}) async {}

  /// Deletes a usage plan of a given plan Id.
  ///
  /// [usagePlanId]: *required* The Id of the to-be-deleted usage plan.
  Future<void> deleteUsagePlan(String usagePlanId) async {}

  /// Deletes a usage plan key and remove the underlying API key from the
  /// associated usage plan.
  ///
  /// [usagePlanId]: *required* The Id of the UsagePlan resource representing
  /// the usage plan containing the to-be-deleted UsagePlanKey resource
  /// representing a plan customer.
  ///
  /// [keyId]: *required* The Id of the UsagePlanKey resource to be deleted.
  Future<void> deleteUsagePlanKey(
      {@required String usagePlanId, @required String keyId}) async {}

  /// Deletes an existing VpcLink of a specified identifier.
  ///
  /// [vpcLinkId]: *required* The identifier of the VpcLink. It is used in an
  /// Integration to reference this VpcLink.
  Future<void> deleteVpcLink(String vpcLinkId) async {}

  /// Flushes all authorizer cache entries on a stage.
  ///
  /// [restApiId]: The string identifier of the associated RestApi.
  ///
  /// [stageName]: The name of the stage to flush.
  Future<void> flushStageAuthorizersCache(
      {@required String restApiId, @required String stageName}) async {}

  /// Flushes a stage's cache.
  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [stageName]: *required* The name of the stage to flush its cache.
  Future<void> flushStageCache(
      {@required String restApiId, @required String stageName}) async {}

  /// Generates a ClientCertificate resource.
  ///
  /// [description]: The description of the ClientCertificate.
  ///
  /// [tags]: The key-value map of strings. The valid character set is
  /// [a-zA-Z+-=._:/]. The tag key can be up to 128 characters and must not
  /// start with `aws:`. The tag value can be up to 256 characters.
  Future<ClientCertificate> generateClientCertificate(
      {String description, Map<String, String> tags}) async {
    return ClientCertificate.fromJson({});
  }

  /// Gets information about the current Account resource.
  Future<Account> getAccount() async {
    return Account.fromJson({});
  }

  /// Gets information about the current ApiKey resource.
  ///
  /// [apiKey]: *required* The identifier of the ApiKey resource.
  ///
  /// [includeValue]: A boolean flag to specify whether (`true`) or not
  /// (`false`) the result contains the key value.
  Future<ApiKey> getApiKey(String apiKey, {bool includeValue}) async {
    return ApiKey.fromJson({});
  }

  /// Gets information about the current ApiKeys resource.
  ///
  /// [position]: The current pagination position in the paged result set.
  ///
  /// [limit]: The maximum number of returned results per page. The default
  /// value is 25 and the maximum value is 500.
  ///
  /// [nameQuery]: The name of queried API keys.
  ///
  /// [customerId]: The identifier of a customer in AWS Marketplace or an
  /// external system, such as a developer portal.
  ///
  /// [includeValues]: A boolean flag to specify whether (`true`) or not
  /// (`false`) the result contains key values.
  Future<ApiKeys> getApiKeys(
      {String position,
      int limit,
      String nameQuery,
      String customerId,
      bool includeValues}) async {
    return ApiKeys.fromJson({});
  }

  /// Describe an existing Authorizer resource.
  ///
  /// [AWS CLI](https://docs.aws.amazon.com/cli/latest/reference/apigateway/get-authorizer.html)
  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [authorizerId]: *required* The identifier of the Authorizer resource.
  Future<Authorizer> getAuthorizer(
      {@required String restApiId, @required String authorizerId}) async {
    return Authorizer.fromJson({});
  }

  /// Describe an existing Authorizers resource.
  ///
  /// [AWS CLI](https://docs.aws.amazon.com/cli/latest/reference/apigateway/get-authorizers.html)
  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [position]: The current pagination position in the paged result set.
  ///
  /// [limit]: The maximum number of returned results per page. The default
  /// value is 25 and the maximum value is 500.
  Future<Authorizers> getAuthorizers(String restApiId,
      {String position, int limit}) async {
    return Authorizers.fromJson({});
  }

  /// Describe a BasePathMapping resource.
  ///
  /// [domainName]: *required* The domain name of the BasePathMapping resource
  /// to be described.
  ///
  /// [basePath]: *required* The base path name that callers of the API must
  /// provide as part of the URL after the domain name. This value must be
  /// unique for all of the mappings across a single API. Specify '(none)' if
  /// you do not want callers to specify any base path name after the domain
  /// name.
  Future<BasePathMapping> getBasePathMapping(
      {@required String domainName, @required String basePath}) async {
    return BasePathMapping.fromJson({});
  }

  /// Represents a collection of BasePathMapping resources.
  ///
  /// [domainName]: *required* The domain name of a BasePathMapping resource.
  ///
  /// [position]: The current pagination position in the paged result set.
  ///
  /// [limit]: The maximum number of returned results per page. The default
  /// value is 25 and the maximum value is 500.
  Future<BasePathMappings> getBasePathMappings(String domainName,
      {String position, int limit}) async {
    return BasePathMappings.fromJson({});
  }

  /// Gets information about the current ClientCertificate resource.
  ///
  /// [clientCertificateId]: *required* The identifier of the ClientCertificate
  /// resource to be described.
  Future<ClientCertificate> getClientCertificate(
      String clientCertificateId) async {
    return ClientCertificate.fromJson({});
  }

  /// Gets a collection of ClientCertificate resources.
  ///
  /// [position]: The current pagination position in the paged result set.
  ///
  /// [limit]: The maximum number of returned results per page. The default
  /// value is 25 and the maximum value is 500.
  Future<ClientCertificates> getClientCertificates(
      {String position, int limit}) async {
    return ClientCertificates.fromJson({});
  }

  /// Gets information about a Deployment resource.
  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [deploymentId]: *required* The identifier of the Deployment resource to
  /// get information about.
  ///
  /// [embed]: A query parameter to retrieve the specified embedded resources of
  /// the returned Deployment resource in the response. In a REST API call, this
  /// `embed` parameter value is a list of comma-separated strings, as in `GET
  /// /restapis/{restapi_id}/deployments/{deployment_id}?embed=var1,var2`. The
  /// SDK and other platform-dependent libraries might use a different format
  /// for the list. Currently, this request supports only retrieval of the
  /// embedded API summary this way. Hence, the parameter value must be a
  /// single-valued list containing only the `"apisummary"` string. For example,
  /// `GET /restapis/{restapi_id}/deployments/{deployment_id}?embed=apisummary`.
  Future<Deployment> getDeployment(
      {@required String restApiId,
      @required String deploymentId,
      List<String> embed}) async {
    return Deployment.fromJson({});
  }

  /// Gets information about a Deployments collection.
  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [position]: The current pagination position in the paged result set.
  ///
  /// [limit]: The maximum number of returned results per page. The default
  /// value is 25 and the maximum value is 500.
  Future<Deployments> getDeployments(String restApiId,
      {String position, int limit}) async {
    return Deployments.fromJson({});
  }

  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [documentationPartId]: *required* The string identifier of the associated
  /// RestApi.
  Future<DocumentationPart> getDocumentationPart(
      {@required String restApiId,
      @required String documentationPartId}) async {
    return DocumentationPart.fromJson({});
  }

  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [type]: The type of API entities of the to-be-retrieved documentation
  /// parts.
  ///
  /// [nameQuery]: The name of API entities of the to-be-retrieved documentation
  /// parts.
  ///
  /// [path]: The path of API entities of the to-be-retrieved documentation
  /// parts.
  ///
  /// [position]: The current pagination position in the paged result set.
  ///
  /// [limit]: The maximum number of returned results per page. The default
  /// value is 25 and the maximum value is 500.
  ///
  /// [locationStatus]: The status of the API documentation parts to retrieve.
  /// Valid values are `DOCUMENTED` for retrieving DocumentationPart resources
  /// with content and `UNDOCUMENTED` for DocumentationPart resources without
  /// content.
  Future<DocumentationParts> getDocumentationParts(String restApiId,
      {String type,
      String nameQuery,
      String path,
      String position,
      int limit,
      String locationStatus}) async {
    return DocumentationParts.fromJson({});
  }

  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [documentationVersion]: *required* The version identifier of the
  /// to-be-retrieved documentation snapshot.
  Future<DocumentationVersion> getDocumentationVersion(
      {@required String restApiId,
      @required String documentationVersion}) async {
    return DocumentationVersion.fromJson({});
  }

  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [position]: The current pagination position in the paged result set.
  ///
  /// [limit]: The maximum number of returned results per page. The default
  /// value is 25 and the maximum value is 500.
  Future<DocumentationVersions> getDocumentationVersions(String restApiId,
      {String position, int limit}) async {
    return DocumentationVersions.fromJson({});
  }

  /// Represents a domain name that is contained in a simpler, more intuitive
  /// URL that can be called.
  ///
  /// [domainName]: *required* The name of the DomainName resource.
  Future<DomainName> getDomainName(String domainName) async {
    return DomainName.fromJson({});
  }

  /// Represents a collection of DomainName resources.
  ///
  /// [position]: The current pagination position in the paged result set.
  ///
  /// [limit]: The maximum number of returned results per page. The default
  /// value is 25 and the maximum value is 500.
  Future<DomainNames> getDomainNames({String position, int limit}) async {
    return DomainNames.fromJson({});
  }

  /// Exports a deployed version of a RestApi in a specified format.
  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [stageName]: *required* The name of the Stage that will be exported.
  ///
  /// [exportType]: *required* The type of export. Acceptable values are 'oas30'
  /// for OpenAPI 3.0.x and 'swagger' for Swagger/OpenAPI 2.0.
  ///
  /// [parameters]: A key-value map of query string parameters that specify
  /// properties of the export, depending on the requested `exportType`. For
  /// `exportType` `oas30` and `swagger`, any combination of the following
  /// parameters are supported: `extensions='integrations'` or
  /// `extensions='apigateway'` will export the API with
  /// x-amazon-apigateway-integration extensions. `extensions='authorizers'`
  /// will export the API with x-amazon-apigateway-authorizer extensions.
  /// `postman` will export the API with Postman extensions, allowing for import
  /// to the Postman tool
  ///
  /// [accepts]: The content-type of the export, for example `application/json`.
  /// Currently `application/json` and `application/yaml` are supported for
  /// `exportType` of`oas30` and `swagger`. This should be specified in the
  /// `Accept` header for direct API requests.
  Future<ExportResponse> getExport(
      {@required String restApiId,
      @required String stageName,
      @required String exportType,
      Map<String, String> parameters,
      String accepts}) async {
    return ExportResponse.fromJson({});
  }

  /// Gets a GatewayResponse of a specified response type on the given RestApi.
  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [responseType]: *required*
  ///
  /// The response type of the associated GatewayResponse. Valid values are
  ///
  /// *   ACCESS_DENIED
  /// *   API_CONFIGURATION_ERROR
  /// *   AUTHORIZER_FAILURE
  /// *    AUTHORIZER_CONFIGURATION_ERROR
  /// *   BAD_REQUEST_PARAMETERS
  /// *   BAD_REQUEST_BODY
  /// *   DEFAULT_4XX
  /// *   DEFAULT_5XX
  /// *   EXPIRED_TOKEN
  /// *   INVALID_SIGNATURE
  /// *   INTEGRATION_FAILURE
  /// *   INTEGRATION_TIMEOUT
  /// *   INVALID_API_KEY
  /// *   MISSING_AUTHENTICATION_TOKEN
  /// *    QUOTA_EXCEEDED
  /// *   REQUEST_TOO_LARGE
  /// *   RESOURCE_NOT_FOUND
  /// *   THROTTLED
  /// *   UNAUTHORIZED
  /// *   UNSUPPORTED_MEDIA_TYPE
  Future<GatewayResponse> getGatewayResponse(
      {@required String restApiId, @required String responseType}) async {
    return GatewayResponse.fromJson({});
  }

  /// Gets the GatewayResponses collection on the given RestApi. If an API
  /// developer has not added any definitions for gateway responses, the result
  /// will be the API Gateway-generated default GatewayResponses collection for
  /// the supported response types.
  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [position]: The current pagination position in the paged result set. The
  /// GatewayResponse collection does not support pagination and the position
  /// does not apply here.
  ///
  /// [limit]: The maximum number of returned results per page. The default
  /// value is 25 and the maximum value is 500. The GatewayResponses collection
  /// does not support pagination and the limit does not apply here.
  Future<GatewayResponses> getGatewayResponses(String restApiId,
      {String position, int limit}) async {
    return GatewayResponses.fromJson({});
  }

  /// Get the integration settings.
  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [resourceId]: *required* Specifies a get integration request's resource
  /// identifier
  ///
  /// [httpMethod]: *required* Specifies a get integration request's HTTP
  /// method.
  Future<Integration> getIntegration(
      {@required String restApiId,
      @required String resourceId,
      @required String httpMethod}) async {
    return Integration.fromJson({});
  }

  /// Represents a get integration response.
  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [resourceId]: *required* Specifies a get integration response request's
  /// resource identifier.
  ///
  /// [httpMethod]: *required* Specifies a get integration response request's
  /// HTTP method.
  ///
  /// [statusCode]: *required* Specifies a get integration response request's
  /// status code.
  Future<IntegrationResponse> getIntegrationResponse(
      {@required String restApiId,
      @required String resourceId,
      @required String httpMethod,
      @required String statusCode}) async {
    return IntegrationResponse.fromJson({});
  }

  /// Describe an existing Method resource.
  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [resourceId]: *required* The Resource identifier for the Method resource.
  ///
  /// [httpMethod]: *required* Specifies the method request's HTTP method type.
  Future<Method> getMethod(
      {@required String restApiId,
      @required String resourceId,
      @required String httpMethod}) async {
    return Method.fromJson({});
  }

  /// Describes a MethodResponse resource.
  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [resourceId]: *required* The Resource identifier for the MethodResponse
  /// resource.
  ///
  /// [httpMethod]: *required* The HTTP verb of the Method resource.
  ///
  /// [statusCode]: *required* The status code for the MethodResponse resource.
  Future<MethodResponse> getMethodResponse(
      {@required String restApiId,
      @required String resourceId,
      @required String httpMethod,
      @required String statusCode}) async {
    return MethodResponse.fromJson({});
  }

  /// Describes an existing model defined for a RestApi resource.
  ///
  /// [restApiId]: *required* The RestApi identifier under which the Model
  /// exists.
  ///
  /// [modelName]: *required* The name of the model as an identifier.
  ///
  /// [flatten]: A query parameter of a Boolean value to resolve (`true`) all
  /// external model references and returns a flattened model schema or not
  /// (`false`) The default is `false`.
  Future<Model> getModel(
      {@required String restApiId,
      @required String modelName,
      bool flatten}) async {
    return Model.fromJson({});
  }

  /// Generates a sample mapping template that can be used to transform a
  /// payload into the structure of a model.
  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [modelName]: *required* The name of the model for which to generate a
  /// template.
  Future<Template> getModelTemplate(
      {@required String restApiId, @required String modelName}) async {
    return Template.fromJson({});
  }

  /// Describes existing Models defined for a RestApi resource.
  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [position]: The current pagination position in the paged result set.
  ///
  /// [limit]: The maximum number of returned results per page. The default
  /// value is 25 and the maximum value is 500.
  Future<Models> getModels(String restApiId,
      {String position, int limit}) async {
    return Models.fromJson({});
  }

  /// Gets a RequestValidator of a given RestApi.
  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [requestValidatorId]: *required* The identifier of the RequestValidator to
  /// be retrieved.
  Future<RequestValidator> getRequestValidator(
      {@required String restApiId, @required String requestValidatorId}) async {
    return RequestValidator.fromJson({});
  }

  /// Gets the RequestValidators collection of a given RestApi.
  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [position]: The current pagination position in the paged result set.
  ///
  /// [limit]: The maximum number of returned results per page. The default
  /// value is 25 and the maximum value is 500.
  Future<RequestValidators> getRequestValidators(String restApiId,
      {String position, int limit}) async {
    return RequestValidators.fromJson({});
  }

  /// Lists information about a resource.
  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [resourceId]: *required* The identifier for the Resource resource.
  ///
  /// [embed]: A query parameter to retrieve the specified resources embedded in
  /// the returned Resource representation in the response. This `embed`
  /// parameter value is a list of comma-separated strings. Currently, the
  /// request supports only retrieval of the embedded Method resources this way.
  /// The query parameter value must be a single-valued list and contain the
  /// `"methods"` string. For example, `GET
  /// /restapis/{restapi_id}/resources/{resource_id}?embed=methods`.
  Future<Resource> getResource(
      {@required String restApiId,
      @required String resourceId,
      List<String> embed}) async {
    return Resource.fromJson({});
  }

  /// Lists information about a collection of Resource resources.
  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [position]: The current pagination position in the paged result set.
  ///
  /// [limit]: The maximum number of returned results per page. The default
  /// value is 25 and the maximum value is 500.
  ///
  /// [embed]: A query parameter used to retrieve the specified resources
  /// embedded in the returned Resources resource in the response. This `embed`
  /// parameter value is a list of comma-separated strings. Currently, the
  /// request supports only retrieval of the embedded Method resources this way.
  /// The query parameter value must be a single-valued list and contain the
  /// `"methods"` string. For example, `GET
  /// /restapis/{restapi_id}/resources?embed=methods`.
  Future<Resources> getResources(String restApiId,
      {String position, int limit, List<String> embed}) async {
    return Resources.fromJson({});
  }

  /// Lists the RestApi resource in the collection.
  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  Future<RestApi> getRestApi(String restApiId) async {
    return RestApi.fromJson({});
  }

  /// Lists the RestApis resources for your collection.
  ///
  /// [position]: The current pagination position in the paged result set.
  ///
  /// [limit]: The maximum number of returned results per page. The default
  /// value is 25 and the maximum value is 500.
  Future<RestApis> getRestApis({String position, int limit}) async {
    return RestApis.fromJson({});
  }

  /// Generates a client SDK for a RestApi and Stage.
  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [stageName]: *required* The name of the Stage that the SDK will use.
  ///
  /// [sdkType]: *required* The language for the generated SDK. Currently
  /// `java`, `javascript`, `android`, `objectivec` (for iOS), `swift` (for
  /// iOS), and `ruby` are supported.
  ///
  /// [parameters]: A string-to-string key-value map of query parameters
  /// `sdkType`-dependent properties of the SDK. For `sdkType` of `objectivec`
  /// or `swift`, a parameter named `classPrefix` is required. For `sdkType` of
  /// `android`, parameters named `groupId`, `artifactId`, `artifactVersion`,
  /// and `invokerPackage` are required. For `sdkType` of `java`, parameters
  /// named `serviceName` and `javaPackageName` are required.
  Future<SdkResponse> getSdk(
      {@required String restApiId,
      @required String stageName,
      @required String sdkType,
      Map<String, String> parameters}) async {
    return SdkResponse.fromJson({});
  }

  ///
  /// [id]: *required* The identifier of the queried SdkType instance.
  Future<SdkType> getSdkType(String id) async {
    return SdkType.fromJson({});
  }

  ///
  /// [position]: The current pagination position in the paged result set.
  ///
  /// [limit]: The maximum number of returned results per page. The default
  /// value is 25 and the maximum value is 500.
  Future<SdkTypes> getSdkTypes({String position, int limit}) async {
    return SdkTypes.fromJson({});
  }

  /// Gets information about a Stage resource.
  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [stageName]: *required* The name of the Stage resource to get information
  /// about.
  Future<Stage> getStage(
      {@required String restApiId, @required String stageName}) async {
    return Stage.fromJson({});
  }

  /// Gets information about one or more Stage resources.
  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [deploymentId]: The stages' deployment identifiers.
  Future<Stages> getStages(String restApiId, {String deploymentId}) async {
    return Stages.fromJson({});
  }

  /// Gets the Tags collection for a given resource.
  ///
  /// [resourceArn]: *required* The ARN of a resource that can be tagged. The
  /// resource ARN must be URL-encoded.
  ///
  /// [position]: (Not currently supported) The current pagination position in
  /// the paged result set.
  ///
  /// [limit]: (Not currently supported) The maximum number of returned results
  /// per page. The default value is 25 and the maximum value is 500.
  Future<Tags> getTags(String resourceArn, {String position, int limit}) async {
    return Tags.fromJson({});
  }

  /// Gets the usage data of a usage plan in a specified time interval.
  ///
  /// [usagePlanId]: *required* The Id of the usage plan associated with the
  /// usage data.
  ///
  /// [keyId]: The Id of the API key associated with the resultant usage data.
  ///
  /// [startDate]: *required* The starting date (e.g., 2016-01-01) of the usage
  /// data.
  ///
  /// [endDate]: *required* The ending date (e.g., 2016-12-31) of the usage
  /// data.
  ///
  /// [position]: The current pagination position in the paged result set.
  ///
  /// [limit]: The maximum number of returned results per page. The default
  /// value is 25 and the maximum value is 500.
  Future<Usage> getUsage(
      {@required String usagePlanId,
      String keyId,
      @required String startDate,
      @required String endDate,
      String position,
      int limit}) async {
    return Usage.fromJson({});
  }

  /// Gets a usage plan of a given plan identifier.
  ///
  /// [usagePlanId]: *required* The identifier of the UsagePlan resource to be
  /// retrieved.
  Future<UsagePlan> getUsagePlan(String usagePlanId) async {
    return UsagePlan.fromJson({});
  }

  /// Gets a usage plan key of a given key identifier.
  ///
  /// [usagePlanId]: *required* The Id of the UsagePlan resource representing
  /// the usage plan containing the to-be-retrieved UsagePlanKey resource
  /// representing a plan customer.
  ///
  /// [keyId]: *required* The key Id of the to-be-retrieved UsagePlanKey
  /// resource representing a plan customer.
  Future<UsagePlanKey> getUsagePlanKey(
      {@required String usagePlanId, @required String keyId}) async {
    return UsagePlanKey.fromJson({});
  }

  /// Gets all the usage plan keys representing the API keys added to a
  /// specified usage plan.
  ///
  /// [usagePlanId]: *required* The Id of the UsagePlan resource representing
  /// the usage plan containing the to-be-retrieved UsagePlanKey resource
  /// representing a plan customer.
  ///
  /// [position]: The current pagination position in the paged result set.
  ///
  /// [limit]: The maximum number of returned results per page. The default
  /// value is 25 and the maximum value is 500.
  ///
  /// [nameQuery]: A query parameter specifying the name of the to-be-returned
  /// usage plan keys.
  Future<UsagePlanKeys> getUsagePlanKeys(String usagePlanId,
      {String position, int limit, String nameQuery}) async {
    return UsagePlanKeys.fromJson({});
  }

  /// Gets all the usage plans of the caller's account.
  ///
  /// [position]: The current pagination position in the paged result set.
  ///
  /// [keyId]: The identifier of the API key associated with the usage plans.
  ///
  /// [limit]: The maximum number of returned results per page. The default
  /// value is 25 and the maximum value is 500.
  Future<UsagePlans> getUsagePlans(
      {String position, String keyId, int limit}) async {
    return UsagePlans.fromJson({});
  }

  /// Gets a specified VPC link under the caller's account in a region.
  ///
  /// [vpcLinkId]: *required* The identifier of the VpcLink. It is used in an
  /// Integration to reference this VpcLink.
  Future<VpcLink> getVpcLink(String vpcLinkId) async {
    return VpcLink.fromJson({});
  }

  /// Gets the VpcLinks collection under the caller's account in a selected
  /// region.
  ///
  /// [position]: The current pagination position in the paged result set.
  ///
  /// [limit]: The maximum number of returned results per page. The default
  /// value is 25 and the maximum value is 500.
  Future<VpcLinks> getVpcLinks({String position, int limit}) async {
    return VpcLinks.fromJson({});
  }

  /// Import API keys from an external source, such as a CSV-formatted file.
  ///
  /// [body]: The payload of the POST request to import API keys. For the
  /// payload format, see
  /// [API Key File Format](https://docs.aws.amazon.com/apigateway/latest/developerguide/api-key-file-format.html).
  ///
  /// [format]: A query parameter to specify the input format to imported API
  /// keys. Currently, only the `csv` format is supported.
  ///
  /// [failOnWarnings]: A query parameter to indicate whether to rollback ApiKey
  /// importation (`true`) or not (`false`) when error is encountered.
  Future<ApiKeyIds> importApiKeys(
      {@required Uint8List body,
      @required String format,
      bool failOnWarnings}) async {
    return ApiKeyIds.fromJson({});
  }

  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [mode]: A query parameter to indicate whether to overwrite (`OVERWRITE`)
  /// any existing DocumentationParts definition or to merge (`MERGE`) the new
  /// definition into the existing one. The default value is `MERGE`.
  ///
  /// [failOnWarnings]: A query parameter to specify whether to rollback the
  /// documentation importation (`true`) or not (`false`) when a warning is
  /// encountered. The default value is `false`.
  ///
  /// [body]: *required* Raw byte array representing the to-be-imported
  /// documentation parts. To import from an OpenAPI file, this is a JSON
  /// object.
  Future<DocumentationPartIds> importDocumentationParts(
      {@required String restApiId,
      String mode,
      bool failOnWarnings,
      @required Uint8List body}) async {
    return DocumentationPartIds.fromJson({});
  }

  /// A feature of the API Gateway control service for creating a new API from
  /// an external API definition file.
  ///
  /// [failOnWarnings]: A query parameter to indicate whether to rollback the
  /// API creation (`true`) or not (`false`) when a warning is encountered. The
  /// default value is `false`.
  ///
  /// [parameters]: A key-value map of context-specific query string parameters
  /// specifying the behavior of different API importing operations. The
  /// following shows operation-specific parameters and their supported values.
  ///
  ///  To exclude DocumentationParts from the import, set `parameters` as
  /// `ignore=documentation`.
  ///
  ///  To configure the endpoint type, set `parameters` as
  /// `endpointConfigurationTypes=EDGE`, `endpointConfigurationTypes=REGIONAL`,
  /// or `endpointConfigurationTypes=PRIVATE`. The default endpoint type is
  /// `EDGE`.
  ///
  ///  To handle imported `basepath`, set `parameters` as `basepath=ignore`,
  /// `basepath=prepend` or `basepath=split`.
  ///
  /// For example, the AWS CLI command to exclude documentation from the
  /// imported API is:
  ///
  ///     aws apigateway import-rest-api --parameters ignore=documentation
  /// --body 'file:///path/to/imported-api-body.json'
  ///
  /// The AWS CLI command to set the regional endpoint on the imported API is:
  ///
  ///     aws apigateway import-rest-api --parameters
  /// endpointConfigurationTypes=REGIONAL --body
  /// 'file:///path/to/imported-api-body.json'
  ///
  /// [body]: *required* The POST request body containing external API
  /// definitions. Currently, only OpenAPI definition JSON/YAML files are
  /// supported. The maximum size of the API definition file is 2MB.
  Future<RestApi> importRestApi(Uint8List body,
      {bool failOnWarnings, Map<String, String> parameters}) async {
    return RestApi.fromJson({});
  }

  /// Creates a customization of a GatewayResponse of a specified response type
  /// and status code on the given RestApi.
  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [responseType]: *required*
  ///
  /// The response type of the associated GatewayResponse. Valid values are
  ///
  /// *   ACCESS_DENIED
  /// *   API_CONFIGURATION_ERROR
  /// *   AUTHORIZER_FAILURE
  /// *    AUTHORIZER_CONFIGURATION_ERROR
  /// *   BAD_REQUEST_PARAMETERS
  /// *   BAD_REQUEST_BODY
  /// *   DEFAULT_4XX
  /// *   DEFAULT_5XX
  /// *   EXPIRED_TOKEN
  /// *   INVALID_SIGNATURE
  /// *   INTEGRATION_FAILURE
  /// *   INTEGRATION_TIMEOUT
  /// *   INVALID_API_KEY
  /// *   MISSING_AUTHENTICATION_TOKEN
  /// *    QUOTA_EXCEEDED
  /// *   REQUEST_TOO_LARGE
  /// *   RESOURCE_NOT_FOUND
  /// *   THROTTLED
  /// *   UNAUTHORIZED
  /// *   UNSUPPORTED_MEDIA_TYPE
  ///
  /// [statusCode]: The HTTP status code of the GatewayResponse.
  ///
  /// [responseParameters]: Response parameters (paths, query strings and
  /// headers) of the GatewayResponse as a string-to-string map of key-value
  /// pairs.
  ///
  /// [responseTemplates]: Response templates of the GatewayResponse as a
  /// string-to-string map of key-value pairs.
  Future<GatewayResponse> putGatewayResponse(
      {@required String restApiId,
      @required String responseType,
      String statusCode,
      Map<String, String> responseParameters,
      Map<String, String> responseTemplates}) async {
    return GatewayResponse.fromJson({});
  }

  /// Sets up a method's integration.
  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [resourceId]: *required* Specifies a put integration request's resource
  /// ID.
  ///
  /// [httpMethod]: *required* Specifies a put integration request's HTTP
  /// method.
  ///
  /// [type]: *required* Specifies a put integration input's type.
  ///
  /// [integrationHttpMethod]: Specifies a put integration HTTP method. When the
  /// integration type is HTTP or AWS, this field is required.
  ///
  /// [uri]: Specifies Uniform Resource Identifier (URI) of the integration
  /// endpoint.
  ///
  /// *    For `HTTP` or `HTTP_PROXY` integrations, the URI must be a fully
  /// formed, encoded HTTP(S) URL according to the
  /// [RFC-3986 specification](https://en.wikipedia.org/wiki/Uniform_Resource_Identifier),
  /// for either standard integration, where `connectionType` is not `VPC_LINK`,
  /// or private integration, where `connectionType` is `VPC_LINK`. For a
  /// private HTTP integration, the URI is not used for routing.
  ///
  /// *    For `AWS` or `AWS_PROXY` integrations, the URI is of the form
  /// `arn:aws:apigateway:{region}:{subdomain.service|service}:path|action/{service_api}`.
  /// Here, `{Region}` is the API Gateway region (e.g., `us-east-1`);
  /// `{service}` is the name of the integrated AWS service (e.g., `s3`); and
  /// `{subdomain}` is a designated subdomain supported by certain AWS service
  /// for fast host-name lookup. `action` can be used for an AWS service
  /// action-based API, using an `Action={name}&{p1}={v1}&p2={v2}...` query
  /// string. The ensuing `{service_api}` refers to a supported action `{name}`
  /// plus any required input parameters. Alternatively, `path` can be used for
  /// an AWS service path-based API. The ensuing `service_api` refers to the
  /// path to an AWS service resource, including the region of the integrated
  /// AWS service, if applicable. For example, for integration with the S3 API
  /// of
  /// `[GetObject](https://docs.aws.amazon.com/AmazonS3/latest/API/RESTObjectGET.html)`,
  /// the `uri` can be either
  /// `arn:aws:apigateway:us-west-2:s3:action/GetObject&Bucket={bucket}&Key={key}`
  /// or `arn:aws:apigateway:us-west-2:s3:path/{bucket}/{key}`
  ///
  /// [connectionType]: The type of the network connection to the integration
  /// endpoint. The valid value is `INTERNET` for connections through the public
  /// routable internet or `VPC_LINK` for private connections between API
  /// Gateway and a network load balancer in a VPC. The default value is
  /// `INTERNET`.
  ///
  /// [connectionId]: The
  /// ([`id`](https://docs.aws.amazon.com/apigateway/api-reference/resource/vpc-link/#id))
  /// of the VpcLink used for the integration when `connectionType=VPC_LINK` and
  /// undefined, otherwise.
  ///
  /// [credentials]: Specifies whether credentials are required for a put
  /// integration.
  ///
  /// [requestParameters]: A key-value map specifying request parameters that
  /// are passed from the method request to the back end. The key is an
  /// integration request parameter name and the associated value is a method
  /// request parameter value or static value that must be enclosed within
  /// single quotes and pre-encoded as required by the back end. The method
  /// request parameter value must match the pattern of
  /// `method.request.{location}.{name}`, where `location` is `querystring`,
  /// `path`, or `header` and `name` must be a valid and unique method request
  /// parameter name.
  ///
  /// [requestTemplates]: Represents a map of Velocity templates that are
  /// applied on the request payload based on the value of the Content-Type
  /// header sent by the client. The content type value is the key in this map,
  /// and the template (as a String) is the value.
  ///
  /// [passthroughBehavior]: Specifies the pass-through behavior for incoming
  /// requests based on the Content-Type header in the request, and the
  /// available mapping templates specified as the `requestTemplates` property
  /// on the Integration resource. There are three valid values:
  /// `WHEN_NO_MATCH`, `WHEN_NO_TEMPLATES`, and `NEVER`.
  ///
  /// *   `WHEN_NO_MATCH` passes the request body for unmapped content types
  /// through to the integration back end without transformation.
  ///
  /// *   `NEVER` rejects unmapped content types with an HTTP 415 'Unsupported
  /// Media Type' response.
  ///
  /// *   `WHEN_NO_TEMPLATES` allows pass-through when the integration has NO
  /// content types mapped to templates. However if there is at least one
  /// content type defined, unmapped content types will be rejected with the
  /// same 415 response.
  ///
  /// [cacheNamespace]: A list of request parameters whose values are to be
  /// cached.
  ///
  /// [cacheKeyParameters]: An API-specific tag group of related cached
  /// parameters.
  ///
  /// [contentHandling]: Specifies how to handle request payload content type
  /// conversions. Supported values are `CONVERT_TO_BINARY` and
  /// `CONVERT_TO_TEXT`, with the following behaviors:
  ///
  /// *   `CONVERT_TO_BINARY`: Converts a request payload from a Base64-encoded
  /// string to the corresponding binary blob.
  ///
  /// *   `CONVERT_TO_TEXT`: Converts a request payload from a binary blob to a
  /// Base64-encoded string.
  ///
  ///
  /// If this property is not defined, the request payload will be passed
  /// through from the method request to integration request without
  /// modification, provided that the `passthroughBehavior` is configured to
  /// support payload pass-through.
  ///
  /// [timeoutInMillis]: Custom timeout between 50 and 29,000 milliseconds. The
  /// default value is 29,000 milliseconds or 29 seconds.
  Future<Integration> putIntegration(
      {@required String restApiId,
      @required String resourceId,
      @required String httpMethod,
      @required String type,
      String integrationHttpMethod,
      String uri,
      String connectionType,
      String connectionId,
      String credentials,
      Map<String, String> requestParameters,
      Map<String, String> requestTemplates,
      String passthroughBehavior,
      String cacheNamespace,
      List<String> cacheKeyParameters,
      String contentHandling,
      int timeoutInMillis}) async {
    return Integration.fromJson({});
  }

  /// Represents a put integration.
  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [resourceId]: *required* Specifies a put integration response request's
  /// resource identifier.
  ///
  /// [httpMethod]: *required* Specifies a put integration response request's
  /// HTTP method.
  ///
  /// [statusCode]: *required* Specifies the status code that is used to map the
  /// integration response to an existing MethodResponse.
  ///
  /// [selectionPattern]: Specifies the selection pattern of a put integration
  /// response.
  ///
  /// [responseParameters]: A key-value map specifying response parameters that
  /// are passed to the method response from the back end. The key is a method
  /// response header parameter name and the mapped value is an integration
  /// response header value, a static value enclosed within a pair of single
  /// quotes, or a JSON expression from the integration response body. The
  /// mapping key must match the pattern of `method.response.header.{name}`,
  /// where `name` is a valid and unique header name. The mapped non-static
  /// value must match the pattern of `integration.response.header.{name}` or
  /// `integration.response.body.{JSON-expression}`, where `name` must be a
  /// valid and unique response header name and `JSON-expression` a valid JSON
  /// expression without the `$` prefix.
  ///
  /// [responseTemplates]: Specifies a put integration response's templates.
  ///
  /// [contentHandling]: Specifies how to handle response payload content type
  /// conversions. Supported values are `CONVERT_TO_BINARY` and
  /// `CONVERT_TO_TEXT`, with the following behaviors:
  ///
  /// *   `CONVERT_TO_BINARY`: Converts a response payload from a Base64-encoded
  /// string to the corresponding binary blob.
  ///
  /// *   `CONVERT_TO_TEXT`: Converts a response payload from a binary blob to a
  /// Base64-encoded string.
  ///
  ///
  /// If this property is not defined, the response payload will be passed
  /// through from the integration response to the method response without
  /// modification.
  Future<IntegrationResponse> putIntegrationResponse(
      {@required String restApiId,
      @required String resourceId,
      @required String httpMethod,
      @required String statusCode,
      String selectionPattern,
      Map<String, String> responseParameters,
      Map<String, String> responseTemplates,
      String contentHandling}) async {
    return IntegrationResponse.fromJson({});
  }

  /// Add a method to an existing Resource resource.
  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [resourceId]: *required* The Resource identifier for the new Method
  /// resource.
  ///
  /// [httpMethod]: *required* Specifies the method request's HTTP method type.
  ///
  /// [authorizationType]: *required* The method's authorization type. Valid
  /// values are `NONE` for open access, `AWS_IAM` for using AWS IAM
  /// permissions, `CUSTOM` for using a custom authorizer, or
  /// `COGNITO_USER_POOLS` for using a Cognito user pool.
  ///
  /// [authorizerId]: Specifies the identifier of an Authorizer to use on this
  /// Method, if the type is CUSTOM or COGNITO_USER_POOLS. The authorizer
  /// identifier is generated by API Gateway when you created the authorizer.
  ///
  /// [apiKeyRequired]: Specifies whether the method required a valid ApiKey.
  ///
  /// [operationName]: A human-friendly operation identifier for the method. For
  /// example, you can assign the `operationName` of `ListPets` for the `GET
  /// /pets` method in the `PetStore` example.
  ///
  /// [requestParameters]: A key-value map defining required or optional method
  /// request parameters that can be accepted by API Gateway. A key defines a
  /// method request parameter name matching the pattern of
  /// `method.request.{location}.{name}`, where `location` is `querystring`,
  /// `path`, or `header` and `name` is a valid and unique parameter name. The
  /// value associated with the key is a Boolean flag indicating whether the
  /// parameter is required (`true`) or optional (`false`). The method request
  /// parameter names defined here are available in Integration to be mapped to
  /// integration request parameters or body-mapping templates.
  ///
  /// [requestModels]: Specifies the Model resources used for the request's
  /// content type. Request models are represented as a key/value map, with a
  /// content type as the key and a Model name as the value.
  ///
  /// [requestValidatorId]: The identifier of a RequestValidator for validating
  /// the method request.
  ///
  /// [authorizationScopes]: A list of authorization scopes configured on the
  /// method. The scopes are used with a `COGNITO_USER_POOLS` authorizer to
  /// authorize the method invocation. The authorization works by matching the
  /// method scopes against the scopes parsed from the access token in the
  /// incoming request. The method invocation is authorized if any method scopes
  /// matches a claimed scope in the access token. Otherwise, the invocation is
  /// not authorized. When the method scope is configured, the client must
  /// provide an access token instead of an identity token for authorization
  /// purposes.
  Future<Method> putMethod(
      {@required String restApiId,
      @required String resourceId,
      @required String httpMethod,
      @required String authorizationType,
      String authorizerId,
      bool apiKeyRequired,
      String operationName,
      Map<String, bool> requestParameters,
      Map<String, String> requestModels,
      String requestValidatorId,
      List<String> authorizationScopes}) async {
    return Method.fromJson({});
  }

  /// Adds a MethodResponse to an existing Method resource.
  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [resourceId]: *required* The Resource identifier for the Method resource.
  ///
  /// [httpMethod]: *required* The HTTP verb of the Method resource.
  ///
  /// [statusCode]: *required* The method response's status code.
  ///
  /// [responseParameters]: A key-value map specifying required or optional
  /// response parameters that API Gateway can send back to the caller. A key
  /// defines a method response header name and the associated value is a
  /// Boolean flag indicating whether the method response parameter is required
  /// or not. The method response header names must match the pattern of
  /// `method.response.header.{name}`, where `name` is a valid and unique header
  /// name. The response parameter names defined here are available in the
  /// integration response to be mapped from an integration response header
  /// expressed in `integration.response.header.{name}`, a static value enclosed
  /// within a pair of single quotes (e.g., `'application/json'`), or a JSON
  /// expression from the back-end response payload in the form of
  /// `integration.response.body.{JSON-expression}`, where `JSON-expression` is
  /// a valid JSON expression without the `$` prefix.)
  ///
  /// [responseModels]: Specifies the Model resources used for the response's
  /// content type. Response models are represented as a key/value map, with a
  /// content type as the key and a Model name as the value.
  Future<MethodResponse> putMethodResponse(
      {@required String restApiId,
      @required String resourceId,
      @required String httpMethod,
      @required String statusCode,
      Map<String, bool> responseParameters,
      Map<String, String> responseModels}) async {
    return MethodResponse.fromJson({});
  }

  /// A feature of the API Gateway control service for updating an existing API
  /// with an input of external API definitions. The update can take the form of
  /// merging the supplied definition into the existing API or overwriting the
  /// existing API.
  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [mode]: The `mode` query parameter to specify the update mode. Valid
  /// values are "merge" and "overwrite". By default, the update mode is
  /// "merge".
  ///
  /// [failOnWarnings]: A query parameter to indicate whether to rollback the
  /// API update (`true`) or not (`false`) when a warning is encountered. The
  /// default value is `false`.
  ///
  /// [parameters]: Custom header parameters as part of the request. For
  /// example, to exclude DocumentationParts from an imported API, set
  /// `ignore=documentation` as a `parameters` value, as in the AWS CLI command
  /// of `aws apigateway import-rest-api --parameters ignore=documentation
  /// --body 'file:///path/to/imported-api-body.json'`.
  ///
  /// [body]: *required* The PUT request body containing external API
  /// definitions. Currently, only OpenAPI definition JSON/YAML files are
  /// supported. The maximum size of the API definition file is 2MB.
  Future<RestApi> putRestApi(
      {@required String restApiId,
      String mode,
      bool failOnWarnings,
      Map<String, String> parameters,
      @required Uint8List body}) async {
    return RestApi.fromJson({});
  }

  /// Adds or updates a tag on a given resource.
  ///
  /// [resourceArn]: *required* The ARN of a resource that can be tagged. The
  /// resource ARN must be URL-encoded.
  ///
  /// [tags]: *required* The key-value map of strings. The valid character set
  /// is [a-zA-Z+-=._:/]. The tag key can be up to 128 characters and must not
  /// start with `aws:`. The tag value can be up to 256 characters.
  Future<void> tagResource(
      {@required String resourceArn,
      @required Map<String, String> tags}) async {}

  /// Simulate the execution of an Authorizer in your RestApi with headers,
  /// parameters, and an incoming request body.
  ///
  ///
  /// [Use Lambda Function as Authorizer](https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-use-lambda-authorizer.html)
  /// [Use Cognito User Pool as Authorizer](https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-integrate-with-cognito.html)
  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [authorizerId]: *required* Specifies a test invoke authorizer request's
  /// Authorizer ID.
  ///
  /// [headers]: *required* A key-value map of headers to simulate an incoming
  /// invocation request. This is where the incoming authorization token, or
  /// identity source, should be specified.
  ///
  /// [multiValueHeaders]: [Optional] The headers as a map from string to list
  /// of values to simulate an incoming invocation request. This is where the
  /// incoming authorization token, or identity source, may be specified.
  ///
  /// [pathWithQueryString]: [Optional] The URI path, including query string, of
  /// the simulated invocation request. Use this to specify path parameters and
  /// query string parameters.
  ///
  /// [body]: [Optional] The simulated request body of an incoming invocation
  /// request.
  ///
  /// [stageVariables]: A key-value map of stage variables to simulate an
  /// invocation on a deployed Stage.
  ///
  /// [additionalContext]: [Optional] A key-value map of additional context
  /// variables.
  Future<TestInvokeAuthorizerResponse> testInvokeAuthorizer(
      {@required String restApiId,
      @required String authorizerId,
      Map<String, String> headers,
      Map<String, List<String>> multiValueHeaders,
      String pathWithQueryString,
      String body,
      Map<String, String> stageVariables,
      Map<String, String> additionalContext}) async {
    return TestInvokeAuthorizerResponse.fromJson({});
  }

  /// Simulate the execution of a Method in your RestApi with headers,
  /// parameters, and an incoming request body.
  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [resourceId]: *required* Specifies a test invoke method request's resource
  /// ID.
  ///
  /// [httpMethod]: *required* Specifies a test invoke method request's HTTP
  /// method.
  ///
  /// [pathWithQueryString]: The URI path, including query string, of the
  /// simulated invocation request. Use this to specify path parameters and
  /// query string parameters.
  ///
  /// [body]: The simulated request body of an incoming invocation request.
  ///
  /// [headers]: A key-value map of headers to simulate an incoming invocation
  /// request.
  ///
  /// [multiValueHeaders]: The headers as a map from string to list of values to
  /// simulate an incoming invocation request.
  ///
  /// [clientCertificateId]: A ClientCertificate identifier to use in the test
  /// invocation. API Gateway will use the certificate when making the HTTPS
  /// request to the defined back-end endpoint.
  ///
  /// [stageVariables]: A key-value map of stage variables to simulate an
  /// invocation on a deployed Stage.
  Future<TestInvokeMethodResponse> testInvokeMethod(
      {@required String restApiId,
      @required String resourceId,
      @required String httpMethod,
      String pathWithQueryString,
      String body,
      Map<String, String> headers,
      Map<String, List<String>> multiValueHeaders,
      String clientCertificateId,
      Map<String, String> stageVariables}) async {
    return TestInvokeMethodResponse.fromJson({});
  }

  /// Removes a tag from a given resource.
  ///
  /// [resourceArn]: *required* The ARN of a resource that can be tagged. The
  /// resource ARN must be URL-encoded.
  ///
  /// [tagKeys]: *required* The Tag keys to delete.
  Future<void> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {}

  /// Changes information about the current Account resource.
  ///
  /// [patchOperations]: A list of update operations to be applied to the
  /// specified resource and in the order specified in this list.
  Future<Account> updateAccount({List<PatchOperation> patchOperations}) async {
    return Account.fromJson({});
  }

  /// Changes information about an ApiKey resource.
  ///
  /// [apiKey]: *required* The identifier of the ApiKey resource to be updated.
  ///
  /// [patchOperations]: A list of update operations to be applied to the
  /// specified resource and in the order specified in this list.
  Future<ApiKey> updateApiKey(String apiKey,
      {List<PatchOperation> patchOperations}) async {
    return ApiKey.fromJson({});
  }

  /// Updates an existing Authorizer resource.
  ///
  /// [AWS CLI](https://docs.aws.amazon.com/cli/latest/reference/apigateway/update-authorizer.html)
  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [authorizerId]: *required* The identifier of the Authorizer resource.
  ///
  /// [patchOperations]: A list of update operations to be applied to the
  /// specified resource and in the order specified in this list.
  Future<Authorizer> updateAuthorizer(
      {@required String restApiId,
      @required String authorizerId,
      List<PatchOperation> patchOperations}) async {
    return Authorizer.fromJson({});
  }

  /// Changes information about the BasePathMapping resource.
  ///
  /// [domainName]: *required* The domain name of the BasePathMapping resource
  /// to change.
  ///
  /// [basePath]: *required* The base path of the BasePathMapping resource to
  /// change.
  ///
  /// To specify an empty base path, set this parameter to `'(none)'`.
  ///
  /// [patchOperations]: A list of update operations to be applied to the
  /// specified resource and in the order specified in this list.
  Future<BasePathMapping> updateBasePathMapping(
      {@required String domainName,
      @required String basePath,
      List<PatchOperation> patchOperations}) async {
    return BasePathMapping.fromJson({});
  }

  /// Changes information about an ClientCertificate resource.
  ///
  /// [clientCertificateId]: *required* The identifier of the ClientCertificate
  /// resource to be updated.
  ///
  /// [patchOperations]: A list of update operations to be applied to the
  /// specified resource and in the order specified in this list.
  Future<ClientCertificate> updateClientCertificate(String clientCertificateId,
      {List<PatchOperation> patchOperations}) async {
    return ClientCertificate.fromJson({});
  }

  /// Changes information about a Deployment resource.
  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [deploymentId]: The replacement identifier for the Deployment resource to
  /// change information about.
  ///
  /// [patchOperations]: A list of update operations to be applied to the
  /// specified resource and in the order specified in this list.
  Future<Deployment> updateDeployment(
      {@required String restApiId,
      @required String deploymentId,
      List<PatchOperation> patchOperations}) async {
    return Deployment.fromJson({});
  }

  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [documentationPartId]: *required* The identifier of the to-be-updated
  /// documentation part.
  ///
  /// [patchOperations]: A list of update operations to be applied to the
  /// specified resource and in the order specified in this list.
  Future<DocumentationPart> updateDocumentationPart(
      {@required String restApiId,
      @required String documentationPartId,
      List<PatchOperation> patchOperations}) async {
    return DocumentationPart.fromJson({});
  }

  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi..
  ///
  /// [documentationVersion]: *required* The version identifier of the
  /// to-be-updated documentation version.
  ///
  /// [patchOperations]: A list of update operations to be applied to the
  /// specified resource and in the order specified in this list.
  Future<DocumentationVersion> updateDocumentationVersion(
      {@required String restApiId,
      @required String documentationVersion,
      List<PatchOperation> patchOperations}) async {
    return DocumentationVersion.fromJson({});
  }

  /// Changes information about the DomainName resource.
  ///
  /// [domainName]: *required* The name of the DomainName resource to be
  /// changed.
  ///
  /// [patchOperations]: A list of update operations to be applied to the
  /// specified resource and in the order specified in this list.
  Future<DomainName> updateDomainName(String domainName,
      {List<PatchOperation> patchOperations}) async {
    return DomainName.fromJson({});
  }

  /// Updates a GatewayResponse of a specified response type on the given
  /// RestApi.
  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [responseType]: *required*
  ///
  /// The response type of the associated GatewayResponse. Valid values are
  ///
  /// *   ACCESS_DENIED
  /// *   API_CONFIGURATION_ERROR
  /// *   AUTHORIZER_FAILURE
  /// *    AUTHORIZER_CONFIGURATION_ERROR
  /// *   BAD_REQUEST_PARAMETERS
  /// *   BAD_REQUEST_BODY
  /// *   DEFAULT_4XX
  /// *   DEFAULT_5XX
  /// *   EXPIRED_TOKEN
  /// *   INVALID_SIGNATURE
  /// *   INTEGRATION_FAILURE
  /// *   INTEGRATION_TIMEOUT
  /// *   INVALID_API_KEY
  /// *   MISSING_AUTHENTICATION_TOKEN
  /// *    QUOTA_EXCEEDED
  /// *   REQUEST_TOO_LARGE
  /// *   RESOURCE_NOT_FOUND
  /// *   THROTTLED
  /// *   UNAUTHORIZED
  /// *   UNSUPPORTED_MEDIA_TYPE
  ///
  /// [patchOperations]: A list of update operations to be applied to the
  /// specified resource and in the order specified in this list.
  Future<GatewayResponse> updateGatewayResponse(
      {@required String restApiId,
      @required String responseType,
      List<PatchOperation> patchOperations}) async {
    return GatewayResponse.fromJson({});
  }

  /// Represents an update integration.
  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [resourceId]: *required* Represents an update integration request's
  /// resource identifier.
  ///
  /// [httpMethod]: *required* Represents an update integration request's HTTP
  /// method.
  ///
  /// [patchOperations]: A list of update operations to be applied to the
  /// specified resource and in the order specified in this list.
  Future<Integration> updateIntegration(
      {@required String restApiId,
      @required String resourceId,
      @required String httpMethod,
      List<PatchOperation> patchOperations}) async {
    return Integration.fromJson({});
  }

  /// Represents an update integration response.
  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [resourceId]: *required* Specifies an update integration response
  /// request's resource identifier.
  ///
  /// [httpMethod]: *required* Specifies an update integration response
  /// request's HTTP method.
  ///
  /// [statusCode]: *required* Specifies an update integration response
  /// request's status code.
  ///
  /// [patchOperations]: A list of update operations to be applied to the
  /// specified resource and in the order specified in this list.
  Future<IntegrationResponse> updateIntegrationResponse(
      {@required String restApiId,
      @required String resourceId,
      @required String httpMethod,
      @required String statusCode,
      List<PatchOperation> patchOperations}) async {
    return IntegrationResponse.fromJson({});
  }

  /// Updates an existing Method resource.
  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [resourceId]: *required* The Resource identifier for the Method resource.
  ///
  /// [httpMethod]: *required* The HTTP verb of the Method resource.
  ///
  /// [patchOperations]: A list of update operations to be applied to the
  /// specified resource and in the order specified in this list.
  Future<Method> updateMethod(
      {@required String restApiId,
      @required String resourceId,
      @required String httpMethod,
      List<PatchOperation> patchOperations}) async {
    return Method.fromJson({});
  }

  /// Updates an existing MethodResponse resource.
  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [resourceId]: *required* The Resource identifier for the MethodResponse
  /// resource.
  ///
  /// [httpMethod]: *required* The HTTP verb of the Method resource.
  ///
  /// [statusCode]: *required* The status code for the MethodResponse resource.
  ///
  /// [patchOperations]: A list of update operations to be applied to the
  /// specified resource and in the order specified in this list.
  Future<MethodResponse> updateMethodResponse(
      {@required String restApiId,
      @required String resourceId,
      @required String httpMethod,
      @required String statusCode,
      List<PatchOperation> patchOperations}) async {
    return MethodResponse.fromJson({});
  }

  /// Changes information about a model.
  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [modelName]: *required* The name of the model to update.
  ///
  /// [patchOperations]: A list of update operations to be applied to the
  /// specified resource and in the order specified in this list.
  Future<Model> updateModel(
      {@required String restApiId,
      @required String modelName,
      List<PatchOperation> patchOperations}) async {
    return Model.fromJson({});
  }

  /// Updates a RequestValidator of a given RestApi.
  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [requestValidatorId]: *required* The identifier of RequestValidator to be
  /// updated.
  ///
  /// [patchOperations]: A list of update operations to be applied to the
  /// specified resource and in the order specified in this list.
  Future<RequestValidator> updateRequestValidator(
      {@required String restApiId,
      @required String requestValidatorId,
      List<PatchOperation> patchOperations}) async {
    return RequestValidator.fromJson({});
  }

  /// Changes information about a Resource resource.
  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [resourceId]: *required* The identifier of the Resource resource.
  ///
  /// [patchOperations]: A list of update operations to be applied to the
  /// specified resource and in the order specified in this list.
  Future<Resource> updateResource(
      {@required String restApiId,
      @required String resourceId,
      List<PatchOperation> patchOperations}) async {
    return Resource.fromJson({});
  }

  /// Changes information about the specified API.
  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [patchOperations]: A list of update operations to be applied to the
  /// specified resource and in the order specified in this list.
  Future<RestApi> updateRestApi(String restApiId,
      {List<PatchOperation> patchOperations}) async {
    return RestApi.fromJson({});
  }

  /// Changes information about a Stage resource.
  ///
  /// [restApiId]: *required* The string identifier of the associated RestApi.
  ///
  /// [stageName]: *required* The name of the Stage resource to change
  /// information about.
  ///
  /// [patchOperations]: A list of update operations to be applied to the
  /// specified resource and in the order specified in this list.
  Future<Stage> updateStage(
      {@required String restApiId,
      @required String stageName,
      List<PatchOperation> patchOperations}) async {
    return Stage.fromJson({});
  }

  /// Grants a temporary extension to the remaining quota of a usage plan
  /// associated with a specified API key.
  ///
  /// [usagePlanId]: *required* The Id of the usage plan associated with the
  /// usage data.
  ///
  /// [keyId]: *required* The identifier of the API key associated with the
  /// usage plan in which a temporary extension is granted to the remaining
  /// quota.
  ///
  /// [patchOperations]: A list of update operations to be applied to the
  /// specified resource and in the order specified in this list.
  Future<Usage> updateUsage(
      {@required String usagePlanId,
      @required String keyId,
      List<PatchOperation> patchOperations}) async {
    return Usage.fromJson({});
  }

  /// Updates a usage plan of a given plan Id.
  ///
  /// [usagePlanId]: *required* The Id of the to-be-updated usage plan.
  ///
  /// [patchOperations]: A list of update operations to be applied to the
  /// specified resource and in the order specified in this list.
  Future<UsagePlan> updateUsagePlan(String usagePlanId,
      {List<PatchOperation> patchOperations}) async {
    return UsagePlan.fromJson({});
  }

  /// Updates an existing VpcLink of a specified identifier.
  ///
  /// [vpcLinkId]: *required* The identifier of the VpcLink. It is used in an
  /// Integration to reference this VpcLink.
  ///
  /// [patchOperations]: A list of update operations to be applied to the
  /// specified resource and in the order specified in this list.
  Future<VpcLink> updateVpcLink(String vpcLinkId,
      {List<PatchOperation> patchOperations}) async {
    return VpcLink.fromJson({});
  }
}

/// Access log settings, including the access log format and access log
/// destination ARN.
class AccessLogSettings {
  /// A single line format of the access logs of data, as specified by selected
  /// [$context variables](https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-mapping-template-reference.html#context-variable-reference).
  /// The format must include at least `$context.requestId`.
  final String format;

  /// The ARN of the CloudWatch Logs log group to receive access logs.
  final String destinationArn;

  AccessLogSettings({
    this.format,
    this.destinationArn,
  });
  static AccessLogSettings fromJson(Map<String, dynamic> json) =>
      AccessLogSettings();
}

/// Represents an AWS account that is associated with API Gateway.
///
/// To view the account info, call `GET` on this resource.
///
/// #### Error Codes
///
/// The following exception may be thrown when the request fails.
///
/// *   UnauthorizedException
/// *   NotFoundException
/// *   TooManyRequestsException
///
/// For detailed error code information, including the corresponding HTTP Status
/// Codes, see
/// [API Gateway Error Codes](https://docs.aws.amazon.com/apigateway/api-reference/handling-errors/#api-error-codes)
///
/// #### Example: Get the information about an account.
///
/// ##### Request
///
///     GET /account HTTP/1.1 Content-Type: application/json Host:
/// apigateway.us-east-1.amazonaws.com X-Amz-Date: 20160531T184618Z
/// Authorization: AWS4-HMAC-SHA256
/// Credential={access_key_ID}/us-east-1/apigateway/aws4_request,
/// SignedHeaders=content-type;host;x-amz-date, Signature={sig4_hash}
///
/// ##### Response
///
/// The successful response returns a `200 OK` status code and a payload similar
/// to the following:
///
///     { "_links": { "curies": { "href":
/// "https://docs.aws.amazon.com/apigateway/latest/developerguide/account-apigateway-{rel}.html",
/// "name": "account", "templated": true }, "self": { "href": "/account" },
/// "account:update": { "href": "/account" } }, "cloudwatchRoleArn":
/// "arn:aws:iam::123456789012:role/apigAwsProxyRole", "throttleSettings": {
/// "rateLimit": 500, "burstLimit": 1000 } }
///
/// In addition to making the REST API call directly, you can use the AWS CLI
/// and an AWS SDK to access this resource.
///
///
/// [API Gateway Limits](https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-limits.html)
/// [Developer Guide](https://docs.aws.amazon.com/apigateway/latest/developerguide/welcome.html),
/// [AWS CLI](https://docs.aws.amazon.com/cli/latest/reference/apigateway/get-account.html)
class Account {
  /// The ARN of an Amazon CloudWatch role for the current Account.
  final String cloudwatchRoleArn;

  /// Specifies the API request limits configured for the current Account.
  final ThrottleSettings throttleSettings;

  /// A list of features supported for the account. When usage plans are
  /// enabled, the features list will include an entry of `"UsagePlans"`.
  final List<String> features;

  /// The version of the API keys used for the account.
  final String apiKeyVersion;

  Account({
    this.cloudwatchRoleArn,
    this.throttleSettings,
    this.features,
    this.apiKeyVersion,
  });
  static Account fromJson(Map<String, dynamic> json) => Account();
}

/// A resource that can be distributed to callers for executing Method resources
/// that require an API key. API keys can be mapped to any Stage on any RestApi,
/// which indicates that the callers with the API key can make requests to that
/// stage.
///
///
/// [Use API Keys](https://docs.aws.amazon.com/apigateway/latest/developerguide/how-to-api-keys.html)
class ApiKey {
  /// The identifier of the API Key.
  final String id;

  /// The value of the API Key.
  final String value;

  /// The name of the API Key.
  final String name;

  /// An AWS Marketplace customer identifier , when integrating with the AWS
  /// SaaS Marketplace.
  final String customerId;

  /// The description of the API Key.
  final String description;

  /// Specifies whether the API Key can be used by callers.
  final bool enabled;

  /// The timestamp when the API Key was created.
  final DateTime createdDate;

  /// The timestamp when the API Key was last updated.
  final DateTime lastUpdatedDate;

  /// A list of Stage resources that are associated with the ApiKey resource.
  final List<String> stageKeys;

  /// The collection of tags. Each tag element is associated with a given
  /// resource.
  final Map<String, String> tags;

  ApiKey({
    this.id,
    this.value,
    this.name,
    this.customerId,
    this.description,
    this.enabled,
    this.createdDate,
    this.lastUpdatedDate,
    this.stageKeys,
    this.tags,
  });
  static ApiKey fromJson(Map<String, dynamic> json) => ApiKey();
}

/// The identifier of an ApiKey used in a UsagePlan.
class ApiKeyIds {
  /// A list of all the ApiKey identifiers.
  final List<String> ids;

  /// A list of warning messages.
  final List<String> warnings;

  ApiKeyIds({
    this.ids,
    this.warnings,
  });
  static ApiKeyIds fromJson(Map<String, dynamic> json) => ApiKeyIds();
}

/// Represents a collection of API keys as represented by an ApiKeys resource.
///
///
/// [Use API Keys](https://docs.aws.amazon.com/apigateway/latest/developerguide/how-to-api-keys.html)
class ApiKeys {
  /// A list of warning messages logged during the import of API keys when the
  /// `failOnWarnings` option is set to true.
  final List<String> warnings;

  final String position;

  /// The current page of elements from this collection.
  final List<ApiKey> items;

  ApiKeys({
    this.warnings,
    this.position,
    this.items,
  });
  static ApiKeys fromJson(Map<String, dynamic> json) => ApiKeys();
}

/// API stage name of the associated API stage in a usage plan.
class ApiStage {
  /// API Id of the associated API stage in a usage plan.
  final String apiId;

  /// API stage name of the associated API stage in a usage plan.
  final String stage;

  /// Map containing method level throttling information for API stage in a
  /// usage plan.
  final Map<String, ThrottleSettings> throttle;

  ApiStage({
    this.apiId,
    this.stage,
    this.throttle,
  });
  static ApiStage fromJson(Map<String, dynamic> json) => ApiStage();
}

/// Represents an authorization layer for methods. If enabled on a method, API
/// Gateway will activate the authorizer when a client calls the method.
///
///
/// [Use Lambda Function as Authorizer](https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-use-lambda-authorizer.html)
/// [Use Cognito User Pool as Authorizer](https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-integrate-with-cognito.html)
class Authorizer {
  /// The identifier for the authorizer resource.
  final String id;

  /// *required* The name of the authorizer.
  final String name;

  /// The authorizer type. Valid values are `TOKEN` for a Lambda function using
  /// a single authorization token submitted in a custom header, `REQUEST` for a
  /// Lambda function using incoming request parameters, and
  /// `COGNITO_USER_POOLS` for using an Amazon Cognito user pool.
  final String type;

  /// A list of the Amazon Cognito user pool ARNs for the `COGNITO_USER_POOLS`
  /// authorizer. Each element is of this format:
  /// `arn:aws:cognito-idp:{region}:{account_id}:userpool/{user_pool_id}`. For a
  /// `TOKEN` or `REQUEST` authorizer, this is not defined.
  final List<String> providerARNs;

  /// Optional customer-defined field, used in OpenAPI imports and exports
  /// without functional impact.
  final String authType;

  /// Specifies the authorizer's Uniform Resource Identifier (URI). For `TOKEN`
  /// or `REQUEST` authorizers, this must be a well-formed Lambda function URI,
  /// for example,
  /// `arn:aws:apigateway:us-west-2:lambda:path/2015-03-31/functions/arn:aws:lambda:us-west-2:{account_id}:function:{lambda_function_name}/invocations`.
  /// In general, the URI has this form
  /// `arn:aws:apigateway:{region}:lambda:path/{service_api}`, where `{region}`
  /// is the same as the region hosting the Lambda function, `path` indicates
  /// that the remaining substring in the URI should be treated as the path to
  /// the resource, including the initial `/`. For Lambda functions, this is
  /// usually of the form `/2015-03-31/functions/[FunctionARN]/invocations`.
  final String authorizerUri;

  /// Specifies the required credentials as an IAM role for API Gateway to
  /// invoke the authorizer. To specify an IAM role for API Gateway to assume,
  /// use the role's Amazon Resource Name (ARN). To use resource-based
  /// permissions on the Lambda function, specify null.
  final String authorizerCredentials;

  /// The identity source for which authorization is requested.
  ///
  /// *   For a `TOKEN` or `COGNITO_USER_POOLS` authorizer, this is required and
  /// specifies the request header mapping expression for the custom header
  /// holding the authorization token submitted by the client. For example, if
  /// the token header name is `Auth`, the header mapping expression is
  /// `method.request.header.Auth`.
  /// *   For the `REQUEST` authorizer, this is required when authorization
  /// caching is enabled. The value is a comma-separated string of one or more
  /// mapping expressions of the specified request parameters. For example, if
  /// an `Auth` header, a `Name` query string parameter are defined as identity
  /// sources, this value is `method.request.header.Auth,
  /// method.request.querystring.Name`. These parameters will be used to derive
  /// the authorization caching key and to perform runtime validation of the
  /// `REQUEST` authorizer by verifying all of the identity-related request
  /// parameters are present, not null and non-empty. Only when this is true
  /// does the authorizer invoke the authorizer Lambda function, otherwise, it
  /// returns a 401 Unauthorized response without calling the Lambda function.
  /// The valid value is a string of comma-separated mapping expressions of the
  /// specified request parameters. When the authorization caching is not
  /// enabled, this property is optional.
  final String identitySource;

  /// A validation expression for the incoming identity token. For `TOKEN`
  /// authorizers, this value is a regular expression. For `COGNITO_USER_POOLS`
  /// authorizers, API Gateway will match the `aud` field of the incoming token
  /// from the client against the specified regular expression. It will invoke
  /// the authorizer's Lambda function when there is a match. Otherwise, it will
  /// return a 401 Unauthorized response without calling the Lambda function.
  /// The validation expression does not apply to the `REQUEST` authorizer.
  final String identityValidationExpression;

  /// The TTL in seconds of cached authorizer results. If it equals 0,
  /// authorization caching is disabled. If it is greater than 0, API Gateway
  /// will cache authorizer responses. If this field is not set, the default
  /// value is 300. The maximum value is 3600, or 1 hour.
  final int authorizerResultTtlInSeconds;

  Authorizer({
    this.id,
    this.name,
    this.type,
    this.providerARNs,
    this.authType,
    this.authorizerUri,
    this.authorizerCredentials,
    this.identitySource,
    this.identityValidationExpression,
    this.authorizerResultTtlInSeconds,
  });
  static Authorizer fromJson(Map<String, dynamic> json) => Authorizer();
}

/// Represents a collection of Authorizer resources.
///
///
/// [Use Lambda Function as Authorizer](https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-use-lambda-authorizer.html)
/// [Use Cognito User Pool as Authorizer](https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-integrate-with-cognito.html)
class Authorizers {
  final String position;

  /// The current page of elements from this collection.
  final List<Authorizer> items;

  Authorizers({
    this.position,
    this.items,
  });
  static Authorizers fromJson(Map<String, dynamic> json) => Authorizers();
}

/// Represents the base path that callers of the API must provide as part of the
/// URL after the domain name.
///
/// A custom domain name plus a `BasePathMapping` specification identifies a
/// deployed RestApi in a given stage of the owner Account.
///
///
/// [Use Custom Domain Names](https://docs.aws.amazon.com/apigateway/latest/developerguide/how-to-custom-domains.html)
class BasePathMapping {
  /// The base path name that callers of the API must provide as part of the URL
  /// after the domain name.
  final String basePath;

  /// The string identifier of the associated RestApi.
  final String restApiId;

  /// The name of the associated stage.
  final String stage;

  BasePathMapping({
    this.basePath,
    this.restApiId,
    this.stage,
  });
  static BasePathMapping fromJson(Map<String, dynamic> json) =>
      BasePathMapping();
}

/// Represents a collection of BasePathMapping resources.
///
///
/// [Use Custom Domain Names](https://docs.aws.amazon.com/apigateway/latest/developerguide/how-to-custom-domains.html)
class BasePathMappings {
  final String position;

  /// The current page of elements from this collection.
  final List<BasePathMapping> items;

  BasePathMappings({
    this.position,
    this.items,
  });
  static BasePathMappings fromJson(Map<String, dynamic> json) =>
      BasePathMappings();
}

/// Configuration settings of a canary deployment.
class CanarySettings {
  /// The percent (0-100) of traffic diverted to a canary deployment.
  final double percentTraffic;

  /// The ID of the canary deployment.
  final String deploymentId;

  /// Stage variables overridden for a canary release deployment, including new
  /// stage variables introduced in the canary. These stage variables are
  /// represented as a string-to-string map between stage variable names and
  /// their values.
  final Map<String, String> stageVariableOverrides;

  /// A Boolean flag to indicate whether the canary deployment uses the stage
  /// cache or not.
  final bool useStageCache;

  CanarySettings({
    this.percentTraffic,
    this.deploymentId,
    this.stageVariableOverrides,
    this.useStageCache,
  });
  static CanarySettings fromJson(Map<String, dynamic> json) => CanarySettings();
}

/// Represents a client certificate used to configure client-side SSL
/// authentication while sending requests to the integration endpoint.
///
/// Client certificates are used to authenticate an API by the backend server.
/// To authenticate an API client (or user), use IAM roles and policies, a
/// custom Authorizer or an Amazon Cognito user pool.
///
///
/// [Use Client-Side Certificate](https://docs.aws.amazon.com/apigateway/latest/developerguide/getting-started-client-side-ssl-authentication.html)
class ClientCertificate {
  /// The identifier of the client certificate.
  final String clientCertificateId;

  /// The description of the client certificate.
  final String description;

  /// The PEM-encoded public key of the client certificate, which can be used to
  /// configure certificate authentication in the integration endpoint .
  final String pemEncodedCertificate;

  /// The timestamp when the client certificate was created.
  final DateTime createdDate;

  /// The timestamp when the client certificate will expire.
  final DateTime expirationDate;

  /// The collection of tags. Each tag element is associated with a given
  /// resource.
  final Map<String, String> tags;

  ClientCertificate({
    this.clientCertificateId,
    this.description,
    this.pemEncodedCertificate,
    this.createdDate,
    this.expirationDate,
    this.tags,
  });
  static ClientCertificate fromJson(Map<String, dynamic> json) =>
      ClientCertificate();
}

/// Represents a collection of ClientCertificate resources.
///
///
/// [Use Client-Side Certificate](https://docs.aws.amazon.com/apigateway/latest/developerguide/getting-started-client-side-ssl-authentication.html)
class ClientCertificates {
  final String position;

  /// The current page of elements from this collection.
  final List<ClientCertificate> items;

  ClientCertificates({
    this.position,
    this.items,
  });
  static ClientCertificates fromJson(Map<String, dynamic> json) =>
      ClientCertificates();
}

/// An immutable representation of a RestApi resource that can be called by
/// users using Stages. A deployment must be associated with a Stage for it to
/// be callable over the Internet.
///
/// To create a deployment, call `POST` on the Deployments resource of a
/// RestApi. To view, update, or delete a deployment, call `GET`, `PATCH`, or
/// `DELETE` on the specified deployment resource
/// (`/restapis/{restapi_id}/deployments/{deployment_id}`).
///
/// RestApi, Deployments, Stage,
/// [AWS CLI](https://docs.aws.amazon.com/cli/latest/reference/apigateway/get-deployment.html),
/// [AWS SDKs](https://aws.amazon.com/tools/)
class Deployment {
  /// The identifier for the deployment resource.
  final String id;

  /// The description for the deployment resource.
  final String description;

  /// The date and time that the deployment resource was created.
  final DateTime createdDate;

  /// A summary of the RestApi at the date and time that the deployment resource
  /// was created.
  final Map<String, Map<String, MethodSnapshot>> apiSummary;

  Deployment({
    this.id,
    this.description,
    this.createdDate,
    this.apiSummary,
  });
  static Deployment fromJson(Map<String, dynamic> json) => Deployment();
}

/// The input configuration for a canary deployment.
class DeploymentCanarySettings {
  /// The percentage (0.0-100.0) of traffic routed to the canary deployment.
  final double percentTraffic;

  /// A stage variable overrides used for the canary release deployment. They
  /// can override existing stage variables or add new stage variables for the
  /// canary release deployment. These stage variables are represented as a
  /// string-to-string map between stage variable names and their values.
  final Map<String, String> stageVariableOverrides;

  /// A Boolean flag to indicate whether the canary release deployment uses the
  /// stage cache or not.
  final bool useStageCache;

  DeploymentCanarySettings({
    this.percentTraffic,
    this.stageVariableOverrides,
    this.useStageCache,
  });
}

/// Represents a collection resource that contains zero or more references to
/// your existing deployments, and links that guide you on how to interact with
/// your collection. The collection offers a paginated view of the contained
/// deployments.
///
/// To create a new deployment of a RestApi, make a `POST` request against this
/// resource. To view, update, or delete an existing deployment, make a `GET`,
/// `PATCH`, or `DELETE` request, respectively, on a specified Deployment
/// resource.
///
///
/// [Deploying an API](https://docs.aws.amazon.com/apigateway/latest/developerguide/how-to-deploy-api.html),
/// [AWS CLI](https://docs.aws.amazon.com/cli/latest/reference/apigateway/get-deployment.html),
/// [AWS SDKs](https://aws.amazon.com/tools/)
class Deployments {
  final String position;

  /// The current page of elements from this collection.
  final List<Deployment> items;

  Deployments({
    this.position,
    this.items,
  });
  static Deployments fromJson(Map<String, dynamic> json) => Deployments();
}

/// A documentation part for a targeted API entity.
///
/// A documentation part consists of a content map (`properties`) and a target
/// (`location`). The target specifies an API entity to which the documentation
/// content applies. The supported API entity types are `API`, `AUTHORIZER`,
/// `MODEL`, `RESOURCE`, `METHOD`, `PATH_PARAMETER`, `QUERY_PARAMETER`,
/// `REQUEST_HEADER`, `REQUEST_BODY`, `RESPONSE`, `RESPONSE_HEADER`, and
/// `RESPONSE_BODY`. Valid `location` fields depend on the API entity type. All
/// valid fields are not required.
///
/// The content map is a JSON string of API-specific key-value pairs. Although
/// an API can use any shape for the content map, only the OpenAPI-compliant
/// documentation fields will be injected into the associated API entity
/// definition in the exported OpenAPI definition file.
///
///
/// [Documenting an API](https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-documenting-api.html),
/// DocumentationParts
class DocumentationPart {
  /// The DocumentationPart identifier, generated by API Gateway when the
  /// `DocumentationPart` is created.
  final String id;

  /// The location of the API entity to which the documentation applies. Valid
  /// fields depend on the targeted API entity type. All the valid location
  /// fields are not required. If not explicitly specified, a valid location
  /// field is treated as a wildcard and associated documentation content may be
  /// inherited by matching entities, unless overridden.
  final DocumentationPartLocation location;

  /// A content map of API-specific key-value pairs describing the targeted API
  /// entity. The map must be encoded as a JSON string, e.g., `"{ "description":
  /// "The API does ..." }"`. Only OpenAPI-compliant documentation-related
  /// fields from the properties map are exported and, hence, published as part
  /// of the API entity definitions, while the original documentation parts are
  /// exported in a OpenAPI extension of `x-amazon-apigateway-documentation`.
  final String properties;

  DocumentationPart({
    this.id,
    this.location,
    this.properties,
  });
  static DocumentationPart fromJson(Map<String, dynamic> json) =>
      DocumentationPart();
}

/// A collection of the imported DocumentationPart identifiers.
///
/// This is used to return the result when documentation parts in an external
/// (e.g., OpenAPI) file are imported into API Gateway
///
///
/// [Documenting an API](https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-documenting-api.html),
/// [documentationpart:import](https://docs.aws.amazon.com/apigateway/api-reference/link-relation/documentationpart-import/),
/// DocumentationPart
class DocumentationPartIds {
  /// A list of the returned documentation part identifiers.
  final List<String> ids;

  /// A list of warning messages reported during import of documentation parts.
  final List<String> warnings;

  DocumentationPartIds({
    this.ids,
    this.warnings,
  });
  static DocumentationPartIds fromJson(Map<String, dynamic> json) =>
      DocumentationPartIds();
}

/// Specifies the target API entity to which the documentation applies.
class DocumentationPartLocation {
  /// *required* The type of API entity to which the documentation content
  /// applies. Valid values are `API`, `AUTHORIZER`, `MODEL`, `RESOURCE`,
  /// `METHOD`, `PATH_PARAMETER`, `QUERY_PARAMETER`, `REQUEST_HEADER`,
  /// `REQUEST_BODY`, `RESPONSE`, `RESPONSE_HEADER`, and `RESPONSE_BODY`.
  /// Content inheritance does not apply to any entity of the `API`,
  /// `AUTHORIZER`, `METHOD`, `MODEL`, `REQUEST_BODY`, or `RESOURCE` type.
  final String type;

  /// The URL path of the target. It is a valid field for the API entity types
  /// of `RESOURCE`, `METHOD`, `PATH_PARAMETER`, `QUERY_PARAMETER`,
  /// `REQUEST_HEADER`, `REQUEST_BODY`, `RESPONSE`, `RESPONSE_HEADER`, and
  /// `RESPONSE_BODY`. The default value is `/` for the root resource. When an
  /// applicable child entity inherits the content of another entity of the same
  /// type with more general specifications of the other `location` attributes,
  /// the child entity's `path` attribute must match that of the parent entity
  /// as a prefix.
  final String path;

  /// The HTTP verb of a method. It is a valid field for the API entity types of
  /// `METHOD`, `PATH_PARAMETER`, `QUERY_PARAMETER`, `REQUEST_HEADER`,
  /// `REQUEST_BODY`, `RESPONSE`, `RESPONSE_HEADER`, and `RESPONSE_BODY`. The
  /// default value is `*` for any method. When an applicable child entity
  /// inherits the content of an entity of the same type with more general
  /// specifications of the other `location` attributes, the child entity's
  /// `method` attribute must match that of the parent entity exactly.
  final String method;

  /// The HTTP status code of a response. It is a valid field for the API entity
  /// types of `RESPONSE`, `RESPONSE_HEADER`, and `RESPONSE_BODY`. The default
  /// value is `*` for any status code. When an applicable child entity inherits
  /// the content of an entity of the same type with more general specifications
  /// of the other `location` attributes, the child entity's `statusCode`
  /// attribute must match that of the parent entity exactly.
  final String statusCode;

  /// The name of the targeted API entity. It is a valid and required field for
  /// the API entity types of `AUTHORIZER`, `MODEL`, `PATH_PARAMETER`,
  /// `QUERY_PARAMETER`, `REQUEST_HEADER`, `REQUEST_BODY` and `RESPONSE_HEADER`.
  /// It is an invalid field for any other entity type.
  final String name;

  DocumentationPartLocation({
    @required this.type,
    this.path,
    this.method,
    this.statusCode,
    this.name,
  });
  static DocumentationPartLocation fromJson(Map<String, dynamic> json) =>
      DocumentationPartLocation();
}

/// The collection of documentation parts of an API.
///
///
/// [Documenting an API](https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-documenting-api.html),
/// DocumentationPart
class DocumentationParts {
  final String position;

  /// The current page of elements from this collection.
  final List<DocumentationPart> items;

  DocumentationParts({
    this.position,
    this.items,
  });
  static DocumentationParts fromJson(Map<String, dynamic> json) =>
      DocumentationParts();
}

/// A snapshot of the documentation of an API.
///
/// Publishing API documentation involves creating a documentation version
/// associated with an API stage and exporting the versioned documentation to an
/// external (e.g., OpenAPI) file.
///
///
/// [Documenting an API](https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-documenting-api.html),
/// DocumentationPart, DocumentationVersions
class DocumentationVersion {
  /// The version identifier of the API documentation snapshot.
  final String version;

  /// The date when the API documentation snapshot is created.
  final DateTime createdDate;

  /// The description of the API documentation snapshot.
  final String description;

  DocumentationVersion({
    this.version,
    this.createdDate,
    this.description,
  });
  static DocumentationVersion fromJson(Map<String, dynamic> json) =>
      DocumentationVersion();
}

/// The collection of documentation snapshots of an API.
///
/// Use the DocumentationVersions to manage documentation snapshots associated
/// with various API stages.
///
///
/// [Documenting an API](https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-documenting-api.html),
/// DocumentationPart, DocumentationVersion
class DocumentationVersions {
  final String position;

  /// The current page of elements from this collection.
  final List<DocumentationVersion> items;

  DocumentationVersions({
    this.position,
    this.items,
  });
  static DocumentationVersions fromJson(Map<String, dynamic> json) =>
      DocumentationVersions();
}

/// Represents a custom domain name as a user-friendly host name of an API
/// (RestApi).
///
/// When you deploy an API, API Gateway creates a default host name for the API.
/// This default API host name is of the
/// `{restapi-id}.execute-api.{region}.amazonaws.com` format. With the default
/// host name, you can access the API's root resource with the URL of
/// `https://{restapi-id}.execute-api.{region}.amazonaws.com/{stage}/`. When you
/// set up a custom domain name of `apis.example.com` for this API, you can then
/// access the same resource using the URL of the
/// `https://apis.examples.com/myApi`, where `myApi` is the base path mapping
/// (BasePathMapping) of your API under the custom domain name.
///
///
/// [Set a Custom Host Name for an API](https://docs.aws.amazon.com/apigateway/latest/developerguide/how-to-custom-domains.html)
class DomainName {
  /// The custom domain name as an API host name, for example,
  /// `my-api.example.com`.
  final String domainName;

  /// The name of the certificate that will be used by edge-optimized endpoint
  /// for this domain name.
  final String certificateName;

  /// The reference to an AWS-managed certificate that will be used by
  /// edge-optimized endpoint for this domain name. AWS Certificate Manager is
  /// the only supported source.
  final String certificateArn;

  /// The timestamp when the certificate that was used by edge-optimized
  /// endpoint for this domain name was uploaded.
  final DateTime certificateUploadDate;

  /// The domain name associated with the regional endpoint for this custom
  /// domain name. You set up this association by adding a DNS record that
  /// points the custom domain name to this regional domain name. The regional
  /// domain name is returned by API Gateway when you create a regional
  /// endpoint.
  final String regionalDomainName;

  /// The region-specific Amazon Route 53 Hosted Zone ID of the regional
  /// endpoint. For more information, see
  /// [Set up a Regional Custom Domain Name](https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-regional-api-custom-domain-create.html)
  /// and
  /// [AWS Regions and Endpoints for API Gateway](https://docs.aws.amazon.com/general/latest/gr/rande.html#apigateway_region).
  final String regionalHostedZoneId;

  /// The name of the certificate that will be used for validating the regional
  /// domain name.
  final String regionalCertificateName;

  /// The reference to an AWS-managed certificate that will be used for
  /// validating the regional domain name. AWS Certificate Manager is the only
  /// supported source.
  final String regionalCertificateArn;

  /// The domain name of the Amazon CloudFront distribution associated with this
  /// custom domain name for an edge-optimized endpoint. You set up this
  /// association when adding a DNS record pointing the custom domain name to
  /// this distribution name. For more information about CloudFront
  /// distributions, see the
  /// [Amazon CloudFront documentation](https://aws.amazon.com/documentation/cloudfront/).
  final String distributionDomainName;

  /// The region-agnostic Amazon Route 53 Hosted Zone ID of the edge-optimized
  /// endpoint. The valid value is `Z2FDTNDATAQYW2` for all the regions. For
  /// more information, see
  /// [Set up a Regional Custom Domain Name](https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-regional-api-custom-domain-create.html)
  /// and
  /// [AWS Regions and Endpoints for API Gateway](https://docs.aws.amazon.com/general/latest/gr/rande.html#apigateway_region).
  final String distributionHostedZoneId;

  /// The endpoint configuration of this DomainName showing the endpoint types
  /// of the domain name.
  final EndpointConfiguration endpointConfiguration;

  /// The status of the DomainName migration. The valid values are `AVAILABLE`
  /// and `UPDATING`. If the status is `UPDATING`, the domain cannot be modified
  /// further until the existing operation is complete. If it is `AVAILABLE`,
  /// the domain can be updated.
  final String domainNameStatus;

  /// An optional text message containing detailed information about status of
  /// the DomainName migration.
  final String domainNameStatusMessage;

  /// The Transport Layer Security (TLS) version + cipher suite for this
  /// DomainName. The valid values are `TLS_1_0` and `TLS_1_2`.
  final String securityPolicy;

  /// The collection of tags. Each tag element is associated with a given
  /// resource.
  final Map<String, String> tags;

  DomainName({
    this.domainName,
    this.certificateName,
    this.certificateArn,
    this.certificateUploadDate,
    this.regionalDomainName,
    this.regionalHostedZoneId,
    this.regionalCertificateName,
    this.regionalCertificateArn,
    this.distributionDomainName,
    this.distributionHostedZoneId,
    this.endpointConfiguration,
    this.domainNameStatus,
    this.domainNameStatusMessage,
    this.securityPolicy,
    this.tags,
  });
  static DomainName fromJson(Map<String, dynamic> json) => DomainName();
}

/// Represents a collection of DomainName resources.
///
///
/// [Use Client-Side Certificate](https://docs.aws.amazon.com/apigateway/latest/developerguide/how-to-custom-domains.html)
class DomainNames {
  final String position;

  /// The current page of elements from this collection.
  final List<DomainName> items;

  DomainNames({
    this.position,
    this.items,
  });
  static DomainNames fromJson(Map<String, dynamic> json) => DomainNames();
}

/// The endpoint configuration to indicate the types of endpoints an API
/// (RestApi) or its custom domain name (DomainName) has.
class EndpointConfiguration {
  /// A list of endpoint types of an API (RestApi) or its custom domain name
  /// (DomainName). For an edge-optimized API and its custom domain name, the
  /// endpoint type is `"EDGE"`. For a regional API and its custom domain name,
  /// the endpoint type is `REGIONAL`. For a private API, the endpoint type is
  /// `PRIVATE`.
  final List<String> types;

  EndpointConfiguration({
    this.types,
  });
  static EndpointConfiguration fromJson(Map<String, dynamic> json) =>
      EndpointConfiguration();
}

/// The binary blob response to GetExport, which contains the generated SDK.
class ExportResponse {
  /// The content-type header value in the HTTP response. This will correspond
  /// to a valid 'accept' type in the request.
  final String contentType;

  /// The content-disposition header value in the HTTP response.
  final String contentDisposition;

  /// The binary blob response to GetExport, which contains the export.
  final Uint8List body;

  ExportResponse({
    this.contentType,
    this.contentDisposition,
    this.body,
  });
  static ExportResponse fromJson(Map<String, dynamic> json) => ExportResponse();
}

/// A gateway response of a given response type and status code, with optional
/// response parameters and mapping templates.
///
///  For more information about valid gateway response types, see
/// [Gateway Response Types Supported by API Gateway](https://docs.aws.amazon.com/apigateway/latest/developerguide/supported-gateway-response-types.html)
///
/// #### Example: Get a Gateway Response of a given response type
///
/// ##### Request
///
/// This example shows how to get a gateway response of the
/// `MISSING_AUTHENTICATION_TOKEN` type.
///
///     GET /restapis/o81lxisefl/gatewayresponses/MISSING_AUTHENTICATION_TOKEN
/// HTTP/1.1 Host: beta-apigateway.us-east-1.amazonaws.com Content-Type:
/// application/json X-Amz-Date: 20170503T202516Z Authorization:
/// AWS4-HMAC-SHA256
/// Credential={access-key-id}/20170503/us-east-1/apigateway/aws4_request,
/// SignedHeaders=content-type;host;x-amz-date,
/// Signature=1b52460e3159c1a26cff29093855d50ea141c1c5b937528fecaf60f51129697a
/// Cache-Control: no-cache Postman-Token: 3b2a1ce9-c848-2e26-2e2f-9c2caefbed45
///
/// The response type is specified as a URL path.
///
/// ##### Response
///
/// The successful operation returns the `200 OK` status code and a payload
/// similar to the following:
///
///     { "_links": { "curies": { "href":
/// "http://docs.aws.amazon.com/apigateway/latest/developerguide/restapi-gatewayresponse-{rel}.html",
/// "name": "gatewayresponse", "templated": true }, "self": { "href":
/// "/restapis/o81lxisefl/gatewayresponses/MISSING_AUTHENTICATION_TOKEN" },
/// "gatewayresponse:delete": { "href":
/// "/restapis/o81lxisefl/gatewayresponses/MISSING_AUTHENTICATION_TOKEN" },
/// "gatewayresponse:put": { "href":
/// "/restapis/o81lxisefl/gatewayresponses/{response_type}", "templated": true
/// }, "gatewayresponse:update": { "href":
/// "/restapis/o81lxisefl/gatewayresponses/MISSING_AUTHENTICATION_TOKEN" } },
/// "defaultResponse": false, "responseParameters": {
/// "gatewayresponse.header.x-request-path": "method.request.path.petId",
/// "gatewayresponse.header.Access-Control-Allow-Origin": "'a.b.c'",
/// "gatewayresponse.header.x-request-query": "method.request.querystring.q",
/// "gatewayresponse.header.x-request-header": "method.request.header.Accept" },
/// "responseTemplates": { "application/json": "{n "message":
/// $context.error.messageString,n "type": "$context.error.responseType",n
/// "stage": "$context.stage",n "resourcePath": "$context.resourcePath",n
/// "stageVariables.a": "$stageVariables.a",n "statusCode": "'404'"n}" },
/// "responseType": "MISSING_AUTHENTICATION_TOKEN", "statusCode": "404" }
///
///
/// [Customize Gateway Responses](https://docs.aws.amazon.com/apigateway/latest/developerguide/customize-gateway-responses.html)
class GatewayResponse {
  /// The response type of the associated GatewayResponse. Valid values are
  ///
  /// *   ACCESS_DENIED
  /// *   API_CONFIGURATION_ERROR
  /// *   AUTHORIZER_FAILURE
  /// *    AUTHORIZER_CONFIGURATION_ERROR
  /// *   BAD_REQUEST_PARAMETERS
  /// *   BAD_REQUEST_BODY
  /// *   DEFAULT_4XX
  /// *   DEFAULT_5XX
  /// *   EXPIRED_TOKEN
  /// *   INVALID_SIGNATURE
  /// *   INTEGRATION_FAILURE
  /// *   INTEGRATION_TIMEOUT
  /// *   INVALID_API_KEY
  /// *   MISSING_AUTHENTICATION_TOKEN
  /// *    QUOTA_EXCEEDED
  /// *   REQUEST_TOO_LARGE
  /// *   RESOURCE_NOT_FOUND
  /// *   THROTTLED
  /// *   UNAUTHORIZED
  /// *   UNSUPPORTED_MEDIA_TYPE
  final String responseType;

  /// The HTTP status code for this GatewayResponse.
  final String statusCode;

  /// Response parameters (paths, query strings and headers) of the
  /// GatewayResponse as a string-to-string map of key-value pairs.
  final Map<String, String> responseParameters;

  /// Response templates of the GatewayResponse as a string-to-string map of
  /// key-value pairs.
  final Map<String, String> responseTemplates;

  /// A Boolean flag to indicate whether this GatewayResponse is the default
  /// gateway response (`true`) or not (`false`). A default gateway response is
  /// one generated by API Gateway without any customization by an API
  /// developer.
  final bool defaultResponse;

  GatewayResponse({
    this.responseType,
    this.statusCode,
    this.responseParameters,
    this.responseTemplates,
    this.defaultResponse,
  });
  static GatewayResponse fromJson(Map<String, dynamic> json) =>
      GatewayResponse();
}

/// The collection of the GatewayResponse instances of a RestApi as a
/// `responseType`-to-GatewayResponse object map of key-value pairs. As such,
/// pagination is not supported for querying this collection.
///
///  For more information about valid gateway response types, see
/// [Gateway Response Types Supported by API Gateway](https://docs.aws.amazon.com/apigateway/latest/developerguide/supported-gateway-response-types.html)
///
/// #### Example: Get the collection of gateway responses of an API
///
/// ##### Request
///
/// This example request shows how to retrieve the GatewayResponses collection
/// from an API.
///
///     GET /restapis/o81lxisefl/gatewayresponses HTTP/1.1 Host:
/// beta-apigateway.us-east-1.amazonaws.com Content-Type: application/json
/// X-Amz-Date: 20170503T220604Z Authorization: AWS4-HMAC-SHA256
/// Credential={access-key-id}/20170503/us-east-1/apigateway/aws4_request,
/// SignedHeaders=content-type;host;x-amz-date,
/// Signature=59b42fe54a76a5de8adf2c67baa6d39206f8e9ad49a1d77ccc6a5da3103a398a
/// Cache-Control: no-cache Postman-Token: 5637af27-dc29-fc5c-9dfe-0645d52cb515
///
/// ##### Response
///
/// The successful operation returns the `200 OK` status code and a payload
/// similar to the following:
///
///     { "_links": { "curies": { "href":
/// "http://docs.aws.amazon.com/apigateway/latest/developerguide/restapi-gatewayresponse-{rel}.html",
/// "name": "gatewayresponse", "templated": true }, "self": { "href":
/// "/restapis/o81lxisefl/gatewayresponses" }, "first": { "href":
/// "/restapis/o81lxisefl/gatewayresponses" }, "gatewayresponse:by-type": {
/// "href": "/restapis/o81lxisefl/gatewayresponses/{response_type}",
/// "templated": true }, "item":
/// [ { "href": "/restapis/o81lxisefl/gatewayresponses/INTEGRATION_FAILURE" }, { "href": "/restapis/o81lxisefl/gatewayresponses/RESOURCE_NOT_FOUND" }, { "href": "/restapis/o81lxisefl/gatewayresponses/REQUEST_TOO_LARGE" }, { "href": "/restapis/o81lxisefl/gatewayresponses/THROTTLED" }, { "href": "/restapis/o81lxisefl/gatewayresponses/UNSUPPORTED_MEDIA_TYPE" }, { "href": "/restapis/o81lxisefl/gatewayresponses/AUTHORIZER_CONFIGURATION_ERROR" }, { "href": "/restapis/o81lxisefl/gatewayresponses/DEFAULT_5XX" }, { "href": "/restapis/o81lxisefl/gatewayresponses/DEFAULT_4XX" }, { "href": "/restapis/o81lxisefl/gatewayresponses/BAD_REQUEST_PARAMETERS" }, { "href": "/restapis/o81lxisefl/gatewayresponses/BAD_REQUEST_BODY" }, { "href": "/restapis/o81lxisefl/gatewayresponses/EXPIRED_TOKEN" }, { "href": "/restapis/o81lxisefl/gatewayresponses/ACCESS_DENIED" }, { "href": "/restapis/o81lxisefl/gatewayresponses/INVALID_API_KEY" }, { "href": "/restapis/o81lxisefl/gatewayresponses/UNAUTHORIZED" }, { "href": "/restapis/o81lxisefl/gatewayresponses/API_CONFIGURATION_ERROR" }, { "href": "/restapis/o81lxisefl/gatewayresponses/QUOTA_EXCEEDED" }, { "href": "/restapis/o81lxisefl/gatewayresponses/INTEGRATION_TIMEOUT" }, { "href": "/restapis/o81lxisefl/gatewayresponses/MISSING_AUTHENTICATION_TOKEN" }, { "href": "/restapis/o81lxisefl/gatewayresponses/INVALID_SIGNATURE" }, { "href": "/restapis/o81lxisefl/gatewayresponses/AUTHORIZER_FAILURE" } ]
/// }, "_embedded": { "item":
/// [ { "_links": { "self": { "href": "/restapis/o81lxisefl/gatewayresponses/INTEGRATION_FAILURE" }, "gatewayresponse:put": { "href": "/restapis/o81lxisefl/gatewayresponses/{response_type}", "templated": true }, "gatewayresponse:update": { "href": "/restapis/o81lxisefl/gatewayresponses/INTEGRATION_FAILURE" } }, "defaultResponse": true, "responseParameters": {}, "responseTemplates": { "application/json": "{"message":$context.error.messageString}" }, "responseType": "INTEGRATION_FAILURE", "statusCode": "504" }, { "_links": { "self": { "href": "/restapis/o81lxisefl/gatewayresponses/RESOURCE_NOT_FOUND" }, "gatewayresponse:put": { "href": "/restapis/o81lxisefl/gatewayresponses/{response_type}", "templated": true }, "gatewayresponse:update": { "href": "/restapis/o81lxisefl/gatewayresponses/RESOURCE_NOT_FOUND" } }, "defaultResponse": true, "responseParameters": {}, "responseTemplates": { "application/json": "{"message":$context.error.messageString}" }, "responseType": "RESOURCE_NOT_FOUND", "statusCode": "404" }, { "_links": { "self": { "href": "/restapis/o81lxisefl/gatewayresponses/REQUEST_TOO_LARGE" }, "gatewayresponse:put": { "href": "/restapis/o81lxisefl/gatewayresponses/{response_type}", "templated": true }, "gatewayresponse:update": { "href": "/restapis/o81lxisefl/gatewayresponses/REQUEST_TOO_LARGE" } }, "defaultResponse": true, "responseParameters": {}, "responseTemplates": { "application/json": "{"message":$context.error.messageString}" }, "responseType": "REQUEST_TOO_LARGE", "statusCode": "413" }, { "_links": { "self": { "href": "/restapis/o81lxisefl/gatewayresponses/THROTTLED" }, "gatewayresponse:put": { "href": "/restapis/o81lxisefl/gatewayresponses/{response_type}", "templated": true }, "gatewayresponse:update": { "href": "/restapis/o81lxisefl/gatewayresponses/THROTTLED" } }, "defaultResponse": true, "responseParameters": {}, "responseTemplates": { "application/json": "{"message":$context.error.messageString}" }, "responseType": "THROTTLED", "statusCode": "429" }, { "_links": { "self": { "href": "/restapis/o81lxisefl/gatewayresponses/UNSUPPORTED_MEDIA_TYPE" }, "gatewayresponse:put": { "href": "/restapis/o81lxisefl/gatewayresponses/{response_type}", "templated": true }, "gatewayresponse:update": { "href": "/restapis/o81lxisefl/gatewayresponses/UNSUPPORTED_MEDIA_TYPE" } }, "defaultResponse": true, "responseParameters": {}, "responseTemplates": { "application/json": "{"message":$context.error.messageString}" }, "responseType": "UNSUPPORTED_MEDIA_TYPE", "statusCode": "415" }, { "_links": { "self": { "href": "/restapis/o81lxisefl/gatewayresponses/AUTHORIZER_CONFIGURATION_ERROR" }, "gatewayresponse:put": { "href": "/restapis/o81lxisefl/gatewayresponses/{response_type}", "templated": true }, "gatewayresponse:update": { "href": "/restapis/o81lxisefl/gatewayresponses/AUTHORIZER_CONFIGURATION_ERROR" } }, "defaultResponse": true, "responseParameters": {}, "responseTemplates": { "application/json": "{"message":$context.error.messageString}" }, "responseType": "AUTHORIZER_CONFIGURATION_ERROR", "statusCode": "500" }, { "_links": { "self": { "href": "/restapis/o81lxisefl/gatewayresponses/DEFAULT_5XX" }, "gatewayresponse:put": { "href": "/restapis/o81lxisefl/gatewayresponses/{response_type}", "templated": true }, "gatewayresponse:update": { "href": "/restapis/o81lxisefl/gatewayresponses/DEFAULT_5XX" } }, "defaultResponse": true, "responseParameters": {}, "responseTemplates": { "application/json": "{"message":$context.error.messageString}" }, "responseType": "DEFAULT_5XX" }, { "_links": { "self": { "href": "/restapis/o81lxisefl/gatewayresponses/DEFAULT_4XX" }, "gatewayresponse:put": { "href": "/restapis/o81lxisefl/gatewayresponses/{response_type}", "templated": true }, "gatewayresponse:update": { "href": "/restapis/o81lxisefl/gatewayresponses/DEFAULT_4XX" } }, "defaultResponse": true, "responseParameters": {}, "responseTemplates": { "application/json": "{"message":$context.error.messageString}" }, "responseType": "DEFAULT_4XX" }, { "_links": { "self": { "href": "/restapis/o81lxisefl/gatewayresponses/BAD_REQUEST_PARAMETERS" }, "gatewayresponse:put": { "href": "/restapis/o81lxisefl/gatewayresponses/{response_type}", "templated": true }, "gatewayresponse:update": { "href": "/restapis/o81lxisefl/gatewayresponses/BAD_REQUEST_PARAMETERS" } }, "defaultResponse": true, "responseParameters": {}, "responseTemplates": { "application/json": "{"message":$context.error.messageString}" }, "responseType": "BAD_REQUEST_PARAMETERS", "statusCode": "400" }, { "_links": { "self": { "href": "/restapis/o81lxisefl/gatewayresponses/BAD_REQUEST_BODY" }, "gatewayresponse:put": { "href": "/restapis/o81lxisefl/gatewayresponses/{response_type}", "templated": true }, "gatewayresponse:update": { "href": "/restapis/o81lxisefl/gatewayresponses/BAD_REQUEST_BODY" } }, "defaultResponse": true, "responseParameters": {}, "responseTemplates": { "application/json": "{"message":$context.error.messageString}" }, "responseType": "BAD_REQUEST_BODY", "statusCode": "400" }, { "_links": { "self": { "href": "/restapis/o81lxisefl/gatewayresponses/EXPIRED_TOKEN" }, "gatewayresponse:put": { "href": "/restapis/o81lxisefl/gatewayresponses/{response_type}", "templated": true }, "gatewayresponse:update": { "href": "/restapis/o81lxisefl/gatewayresponses/EXPIRED_TOKEN" } }, "defaultResponse": true, "responseParameters": {}, "responseTemplates": { "application/json": "{"message":$context.error.messageString}" }, "responseType": "EXPIRED_TOKEN", "statusCode": "403" }, { "_links": { "self": { "href": "/restapis/o81lxisefl/gatewayresponses/ACCESS_DENIED" }, "gatewayresponse:put": { "href": "/restapis/o81lxisefl/gatewayresponses/{response_type}", "templated": true }, "gatewayresponse:update": { "href": "/restapis/o81lxisefl/gatewayresponses/ACCESS_DENIED" } }, "defaultResponse": true, "responseParameters": {}, "responseTemplates": { "application/json": "{"message":$context.error.messageString}" }, "responseType": "ACCESS_DENIED", "statusCode": "403" }, { "_links": { "self": { "href": "/restapis/o81lxisefl/gatewayresponses/INVALID_API_KEY" }, "gatewayresponse:put": { "href": "/restapis/o81lxisefl/gatewayresponses/{response_type}", "templated": true }, "gatewayresponse:update": { "href": "/restapis/o81lxisefl/gatewayresponses/INVALID_API_KEY" } }, "defaultResponse": true, "responseParameters": {}, "responseTemplates": { "application/json": "{"message":$context.error.messageString}" }, "responseType": "INVALID_API_KEY", "statusCode": "403" }, { "_links": { "self": { "href": "/restapis/o81lxisefl/gatewayresponses/UNAUTHORIZED" }, "gatewayresponse:put": { "href": "/restapis/o81lxisefl/gatewayresponses/{response_type}", "templated": true }, "gatewayresponse:update": { "href": "/restapis/o81lxisefl/gatewayresponses/UNAUTHORIZED" } }, "defaultResponse": true, "responseParameters": {}, "responseTemplates": { "application/json": "{"message":$context.error.messageString}" }, "responseType": "UNAUTHORIZED", "statusCode": "401" }, { "_links": { "self": { "href": "/restapis/o81lxisefl/gatewayresponses/API_CONFIGURATION_ERROR" }, "gatewayresponse:put": { "href": "/restapis/o81lxisefl/gatewayresponses/{response_type}", "templated": true }, "gatewayresponse:update": { "href": "/restapis/o81lxisefl/gatewayresponses/API_CONFIGURATION_ERROR" } }, "defaultResponse": true, "responseParameters": {}, "responseTemplates": { "application/json": "{"message":$context.error.messageString}" }, "responseType": "API_CONFIGURATION_ERROR", "statusCode": "500" }, { "_links": { "self": { "href": "/restapis/o81lxisefl/gatewayresponses/QUOTA_EXCEEDED" }, "gatewayresponse:put": { "href": "/restapis/o81lxisefl/gatewayresponses/{response_type}", "templated": true }, "gatewayresponse:update": { "href": "/restapis/o81lxisefl/gatewayresponses/QUOTA_EXCEEDED" } }, "defaultResponse": true, "responseParameters": {}, "responseTemplates": { "application/json": "{"message":$context.error.messageString}" }, "responseType": "QUOTA_EXCEEDED", "statusCode": "429" }, { "_links": { "self": { "href": "/restapis/o81lxisefl/gatewayresponses/INTEGRATION_TIMEOUT" }, "gatewayresponse:put": { "href": "/restapis/o81lxisefl/gatewayresponses/{response_type}", "templated": true }, "gatewayresponse:update": { "href": "/restapis/o81lxisefl/gatewayresponses/INTEGRATION_TIMEOUT" } }, "defaultResponse": true, "responseParameters": {}, "responseTemplates": { "application/json": "{"message":$context.error.messageString}" }, "responseType": "INTEGRATION_TIMEOUT", "statusCode": "504" }, { "_links": { "self": { "href": "/restapis/o81lxisefl/gatewayresponses/MISSING_AUTHENTICATION_TOKEN" }, "gatewayresponse:put": { "href": "/restapis/o81lxisefl/gatewayresponses/{response_type}", "templated": true }, "gatewayresponse:update": { "href": "/restapis/o81lxisefl/gatewayresponses/MISSING_AUTHENTICATION_TOKEN" } }, "defaultResponse": true, "responseParameters": {}, "responseTemplates": { "application/json": "{"message":$context.error.messageString}" }, "responseType": "MISSING_AUTHENTICATION_TOKEN", "statusCode": "403" }, { "_links": { "self": { "href": "/restapis/o81lxisefl/gatewayresponses/INVALID_SIGNATURE" }, "gatewayresponse:put": { "href": "/restapis/o81lxisefl/gatewayresponses/{response_type}", "templated": true }, "gatewayresponse:update": { "href": "/restapis/o81lxisefl/gatewayresponses/INVALID_SIGNATURE" } }, "defaultResponse": true, "responseParameters": {}, "responseTemplates": { "application/json": "{"message":$context.error.messageString}" }, "responseType": "INVALID_SIGNATURE", "statusCode": "403" }, { "_links": { "self": { "href": "/restapis/o81lxisefl/gatewayresponses/AUTHORIZER_FAILURE" }, "gatewayresponse:put": { "href": "/restapis/o81lxisefl/gatewayresponses/{response_type}", "templated": true }, "gatewayresponse:update": { "href": "/restapis/o81lxisefl/gatewayresponses/AUTHORIZER_FAILURE" } }, "defaultResponse": true, "responseParameters": {}, "responseTemplates": { "application/json": "{"message":$context.error.messageString}" }, "responseType": "AUTHORIZER_FAILURE", "statusCode": "500" } ]
/// } }
///
///
/// [Customize Gateway Responses](https://docs.aws.amazon.com/apigateway/latest/developerguide/customize-gateway-responses.html)
class GatewayResponses {
  final String position;

  /// Returns the entire collection, because of no pagination support.
  final List<GatewayResponse> items;

  GatewayResponses({
    this.position,
    this.items,
  });
  static GatewayResponses fromJson(Map<String, dynamic> json) =>
      GatewayResponses();
}

/// Represents an HTTP, HTTP_PROXY, AWS, AWS_PROXY, or Mock integration.
///
/// In the API Gateway console, the built-in Lambda integration is an AWS
/// integration.
///
///
/// [Creating an API](https://docs.aws.amazon.com/apigateway/latest/developerguide/how-to-create-api.html)
class Integration {
  /// Specifies an API method integration type. The valid value is one of the
  /// following:
  ///
  /// *   `AWS`: for integrating the API method request with an AWS service
  /// action, including the Lambda function-invoking action. With the Lambda
  /// function-invoking action, this is referred to as the Lambda custom
  /// integration. With any other AWS service action, this is known as AWS
  /// integration.
  /// *   `AWS_PROXY`: for integrating the API method request with the Lambda
  /// function-invoking action with the client request passed through as-is.
  /// This integration is also referred to as the Lambda proxy integration.
  /// *   `HTTP`: for integrating the API method request with an HTTP endpoint,
  /// including a private HTTP endpoint within a VPC. This integration is also
  /// referred to as the HTTP custom integration.
  /// *   `HTTP_PROXY`: for integrating the API method request with an HTTP
  /// endpoint, including a private HTTP endpoint within a VPC, with the client
  /// request passed through as-is. This is also referred to as the HTTP proxy
  /// integration.
  /// *   `MOCK`: for integrating the API method request with API Gateway as a
  /// "loop-back" endpoint without invoking any backend.
  ///
  /// For the HTTP and HTTP proxy integrations, each integration can specify a
  /// protocol (`http/https`), port and path. Standard 80 and 443 ports are
  /// supported as well as custom ports above 1024. An HTTP or HTTP proxy
  /// integration with a `connectionType` of `VPC_LINK` is referred to as a
  /// private integration and uses a VpcLink to connect API Gateway to a network
  /// load balancer of a VPC.
  final String type;

  /// Specifies the integration's HTTP method type.
  final String httpMethod;

  /// Specifies Uniform Resource Identifier (URI) of the integration endpoint.
  ///
  /// *    For `HTTP` or `HTTP_PROXY` integrations, the URI must be a fully
  /// formed, encoded HTTP(S) URL according to the
  /// [RFC-3986 specification](https://en.wikipedia.org/wiki/Uniform_Resource_Identifier),
  /// for either standard integration, where `connectionType` is not `VPC_LINK`,
  /// or private integration, where `connectionType` is `VPC_LINK`. For a
  /// private HTTP integration, the URI is not used for routing.
  ///
  /// *    For `AWS` or `AWS_PROXY` integrations, the URI is of the form
  /// `arn:aws:apigateway:{region}:{subdomain.service|service}:path|action/{service_api}`.
  /// Here, `{Region}` is the API Gateway region (e.g., `us-east-1`);
  /// `{service}` is the name of the integrated AWS service (e.g., `s3`); and
  /// `{subdomain}` is a designated subdomain supported by certain AWS service
  /// for fast host-name lookup. `action` can be used for an AWS service
  /// action-based API, using an `Action={name}&{p1}={v1}&p2={v2}...` query
  /// string. The ensuing `{service_api}` refers to a supported action `{name}`
  /// plus any required input parameters. Alternatively, `path` can be used for
  /// an AWS service path-based API. The ensuing `service_api` refers to the
  /// path to an AWS service resource, including the region of the integrated
  /// AWS service, if applicable. For example, for integration with the S3 API
  /// of
  /// `[GetObject](https://docs.aws.amazon.com/AmazonS3/latest/API/RESTObjectGET.html)`,
  /// the `uri` can be either
  /// `arn:aws:apigateway:us-west-2:s3:action/GetObject&Bucket={bucket}&Key={key}`
  /// or `arn:aws:apigateway:us-west-2:s3:path/{bucket}/{key}`
  final String uri;

  /// The type of the network connection to the integration endpoint. The valid
  /// value is `INTERNET` for connections through the public routable internet
  /// or `VPC_LINK` for private connections between API Gateway and a network
  /// load balancer in a VPC. The default value is `INTERNET`.
  final String connectionType;

  /// The
  /// ([`id`](https://docs.aws.amazon.com/apigateway/api-reference/resource/vpc-link/#id))
  /// of the VpcLink used for the integration when `connectionType=VPC_LINK` and
  /// undefined, otherwise.
  final String connectionId;

  /// Specifies the credentials required for the integration, if any. For AWS
  /// integrations, three options are available. To specify an IAM Role for API
  /// Gateway to assume, use the role's Amazon Resource Name (ARN). To require
  /// that the caller's identity be passed through from the request, specify the
  /// string `arn:aws:iam::*:user/*`. To use resource-based permissions on
  /// supported AWS services, specify null.
  final String credentials;

  /// A key-value map specifying request parameters that are passed from the
  /// method request to the back end. The key is an integration request
  /// parameter name and the associated value is a method request parameter
  /// value or static value that must be enclosed within single quotes and
  /// pre-encoded as required by the back end. The method request parameter
  /// value must match the pattern of `method.request.{location}.{name}`, where
  /// `location` is `querystring`, `path`, or `header` and `name` must be a
  /// valid and unique method request parameter name.
  final Map<String, String> requestParameters;

  /// Represents a map of Velocity templates that are applied on the request
  /// payload based on the value of the Content-Type header sent by the client.
  /// The content type value is the key in this map, and the template (as a
  /// String) is the value.
  final Map<String, String> requestTemplates;

  ///  Specifies how the method request body of an unmapped content type will be
  /// passed through the integration request to the back end without
  /// transformation. A content type is unmapped if no mapping template is
  /// defined in the integration or the content type does not match any of the
  /// mapped content types, as specified in `requestTemplates`. The valid value
  /// is one of the following:
  ///
  /// *    `WHEN_NO_MATCH`: passes the method request body through the
  /// integration request to the back end without transformation when the method
  /// request content type does not match any content type associated with the
  /// mapping templates defined in the integration request.
  /// *    `WHEN_NO_TEMPLATES`: passes the method request body through the
  /// integration request to the back end without transformation when no mapping
  /// template is defined in the integration request. If a template is defined
  /// when this option is selected, the method request of an unmapped
  /// content-type will be rejected with an HTTP `415 Unsupported Media Type`
  /// response.
  /// *    `NEVER`: rejects the method request with an HTTP `415 Unsupported
  /// Media Type` response when either the method request content type does not
  /// match any content type associated with the mapping templates defined in
  /// the integration request or no mapping template is defined in the
  /// integration request.
  final String passthroughBehavior;

  /// Specifies how to handle request payload content type conversions.
  /// Supported values are `CONVERT_TO_BINARY` and `CONVERT_TO_TEXT`, with the
  /// following behaviors:
  ///
  /// *   `CONVERT_TO_BINARY`: Converts a request payload from a Base64-encoded
  /// string to the corresponding binary blob.
  ///
  /// *   `CONVERT_TO_TEXT`: Converts a request payload from a binary blob to a
  /// Base64-encoded string.
  ///
  ///
  /// If this property is not defined, the request payload will be passed
  /// through from the method request to integration request without
  /// modification, provided that the `passthroughBehavior` is configured to
  /// support payload pass-through.
  final String contentHandling;

  /// Custom timeout between 50 and 29,000 milliseconds. The default value is
  /// 29,000 milliseconds or 29 seconds.
  final int timeoutInMillis;

  /// An API-specific tag group of related cached parameters. To be valid values
  /// for `cacheKeyParameters`, these parameters must also be specified for
  /// Method `requestParameters`.
  final String cacheNamespace;

  /// A list of request parameters whose values API Gateway caches. To be valid
  /// values for `cacheKeyParameters`, these parameters must also be specified
  /// for Method `requestParameters`.
  final List<String> cacheKeyParameters;

  /// Specifies the integration's responses.
  ///
  /// #### Example: Get integration responses of a method
  ///
  /// ##### Request
  ///
  ///     GET
  /// /restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/integration/responses/200
  /// HTTP/1.1 Content-Type: application/json Host:
  /// apigateway.us-east-1.amazonaws.com X-Amz-Date: 20160607T191449Z
  /// Authorization: AWS4-HMAC-SHA256
  /// Credential={access_key_ID}/20160607/us-east-1/apigateway/aws4_request,
  /// SignedHeaders=content-type;host;x-amz-date, Signature={sig4_hash}
  ///
  /// ##### Response
  ///
  /// The successful response returns `200 OK` status and a payload as follows:
  ///
  ///     { "_links": { "curies": { "href":
  /// "https://docs.aws.amazon.com/apigateway/latest/developerguide/restapi-integration-response-{rel}.html",
  /// "name": "integrationresponse", "templated": true }, "self": { "href":
  /// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/integration/responses/200",
  /// "title": "200" }, "integrationresponse:delete": { "href":
  /// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/integration/responses/200"
  /// }, "integrationresponse:update": { "href":
  /// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/integration/responses/200"
  /// } }, "responseParameters": { "method.response.header.Content-Type":
  /// "'application/xml'" }, "responseTemplates": { "application/json":
  /// "$util.urlDecode("%3CkinesisStreams%3E#foreach($stream in
  /// $input.path('$.StreamNames'))%3Cstream%3E%3Cname%3E$stream%3C/name%3E%3C/stream%3E#end%3C/kinesisStreams%3E")n"
  /// }, "statusCode": "200" }
  ///
  ///
  /// [Creating an API](https://docs.aws.amazon.com/apigateway/latest/developerguide/how-to-create-api.html)
  final Map<String, IntegrationResponse> integrationResponses;

  Integration({
    this.type,
    this.httpMethod,
    this.uri,
    this.connectionType,
    this.connectionId,
    this.credentials,
    this.requestParameters,
    this.requestTemplates,
    this.passthroughBehavior,
    this.contentHandling,
    this.timeoutInMillis,
    this.cacheNamespace,
    this.cacheKeyParameters,
    this.integrationResponses,
  });
  static Integration fromJson(Map<String, dynamic> json) => Integration();
}

/// Represents an integration response. The status code must map to an existing
/// MethodResponse, and parameters and templates can be used to transform the
/// back-end response.
///
///
/// [Creating an API](https://docs.aws.amazon.com/apigateway/latest/developerguide/how-to-create-api.html)
class IntegrationResponse {
  /// Specifies the status code that is used to map the integration response to
  /// an existing MethodResponse.
  final String statusCode;

  /// Specifies the regular expression (regex) pattern used to choose an
  /// integration response based on the response from the back end. For example,
  /// if the success response returns nothing and the error response returns
  /// some string, you could use the `.+` regex to match error response.
  /// However, make sure that the error response does not contain any newline
  /// (`n`) character in such cases. If the back end is an AWS Lambda function,
  /// the AWS Lambda function error header is matched. For all other HTTP and
  /// AWS back ends, the HTTP status code is matched.
  final String selectionPattern;

  /// A key-value map specifying response parameters that are passed to the
  /// method response from the back end. The key is a method response header
  /// parameter name and the mapped value is an integration response header
  /// value, a static value enclosed within a pair of single quotes, or a JSON
  /// expression from the integration response body. The mapping key must match
  /// the pattern of `method.response.header.{name}`, where `name` is a valid
  /// and unique header name. The mapped non-static value must match the pattern
  /// of `integration.response.header.{name}` or
  /// `integration.response.body.{JSON-expression}`, where `name` is a valid and
  /// unique response header name and `JSON-expression` is a valid JSON
  /// expression without the `$` prefix.
  final Map<String, String> responseParameters;

  /// Specifies the templates used to transform the integration response body.
  /// Response templates are represented as a key/value map, with a content-type
  /// as the key and a template as the value.
  final Map<String, String> responseTemplates;

  /// Specifies how to handle response payload content type conversions.
  /// Supported values are `CONVERT_TO_BINARY` and `CONVERT_TO_TEXT`, with the
  /// following behaviors:
  ///
  /// *   `CONVERT_TO_BINARY`: Converts a response payload from a Base64-encoded
  /// string to the corresponding binary blob.
  ///
  /// *   `CONVERT_TO_TEXT`: Converts a response payload from a binary blob to a
  /// Base64-encoded string.
  ///
  ///
  /// If this property is not defined, the response payload will be passed
  /// through from the integration response to the method response without
  /// modification.
  final String contentHandling;

  IntegrationResponse({
    this.statusCode,
    this.selectionPattern,
    this.responseParameters,
    this.responseTemplates,
    this.contentHandling,
  });
  static IntegrationResponse fromJson(Map<String, dynamic> json) =>
      IntegrationResponse();
}

///  Represents a client-facing interface by which the client calls the API to
/// access back-end resources. A **Method** resource is integrated with an
/// Integration resource. Both consist of a request and one or more responses.
/// The method request takes the client input that is passed to the back end
/// through the integration request. A method response returns the output from
/// the back end to the client through an integration response. A method request
/// is embodied in a **Method** resource, whereas an integration request is
/// embodied in an Integration resource. On the other hand, a method response is
/// represented by a MethodResponse resource, whereas an integration response is
/// represented by an IntegrationResponse resource.
///
/// #### Example: Retrive the GET method on a specified resource
///
/// ##### Request
///
/// The following example request retrieves the information about the GET method
/// on an API resource (`3kzxbg5sa2`) of an API (`fugvjdxtri`).
///
///     GET /restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET HTTP/1.1
/// Content-Type: application/json Host: apigateway.us-east-1.amazonaws.com
/// X-Amz-Date: 20160603T210259Z Authorization: AWS4-HMAC-SHA256
/// Credential={access_key_ID}/20160603/us-east-1/apigateway/aws4_request,
/// SignedHeaders=content-type;host;x-amz-date, Signature={sig4_hash}
///
/// ##### Response
///
/// The successful response returns a `200 OK` status code and a payload similar
/// to the following:
///
///     { "_links": { "curies":
/// [ { "href": "https://docs.aws.amazon.com/apigateway/latest/developerguide/restapi-integration-{rel}.html", "name": "integration", "templated": true }, { "href": "https://docs.aws.amazon.com/apigateway/latest/developerguide/restapi-integration-response-{rel}.html", "name": "integrationresponse", "templated": true }, { "href": "https://docs.aws.amazon.com/apigateway/latest/developerguide/restapi-method-{rel}.html", "name": "method", "templated": true }, { "href": "https://docs.aws.amazon.com/apigateway/latest/developerguide/restapi-method-response-{rel}.html", "name": "methodresponse", "templated": true } ],
/// "self": { "href": "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET",
/// "name": "GET", "title": "GET" }, "integration:put": { "href":
/// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/integration" },
/// "method:delete": { "href":
/// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET" },
/// "method:integration": { "href":
/// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/integration" },
/// "method:responses": { "href":
/// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/responses/200",
/// "name": "200", "title": "200" }, "method:update": { "href":
/// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET" },
/// "methodresponse:put": { "href":
/// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/responses/{status_code}",
/// "templated": true } }, "apiKeyRequired": true, "authorizationType": "NONE",
/// "httpMethod": "GET", "_embedded": { "method:integration": { "_links": {
/// "self": { "href":
/// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/integration" },
/// "integration:delete": { "href":
/// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/integration" },
/// "integration:responses": { "href":
/// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/integration/responses/200",
/// "name": "200", "title": "200" }, "integration:update": { "href":
/// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/integration" },
/// "integrationresponse:put": { "href":
/// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/integration/responses/{status_code}",
/// "templated": true } }, "cacheKeyParameters": [], "cacheNamespace":
/// "3kzxbg5sa2", "credentials":
/// "arn:aws:iam::123456789012:role/apigAwsProxyRole", "httpMethod": "POST",
/// "passthroughBehavior": "WHEN_NO_MATCH", "requestParameters": {
/// "integration.request.header.Content-Type": "'application/x-amz-json-1.1'" },
/// "requestTemplates": { "application/json": "{n}" }, "type": "AWS", "uri":
/// "arn:aws:apigateway:us-east-1:kinesis:action/ListStreams", "_embedded": {
/// "integration:responses": { "_links": { "self": { "href":
/// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/integration/responses/200",
/// "name": "200", "title": "200" }, "integrationresponse:delete": { "href":
/// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/integration/responses/200"
/// }, "integrationresponse:update": { "href":
/// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/integration/responses/200"
/// } }, "responseParameters": { "method.response.header.Content-Type":
/// "'application/xml'" }, "responseTemplates": { "application/json":
/// "$util.urlDecode("%3CkinesisStreams%3E%23foreach(%24stream%20in%20%24input.path(%27%24.StreamNames%27))%3Cstream%3E%3Cname%3E%24stream%3C%2Fname%3E%3C%2Fstream%3E%23end%3C%2FkinesisStreams%3E")"
/// }, "statusCode": "200" } } }, "method:responses": { "_links": { "self": {
/// "href":
/// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/responses/200",
/// "name": "200", "title": "200" }, "methodresponse:delete": { "href":
/// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/responses/200" },
/// "methodresponse:update": { "href":
/// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/responses/200" } },
/// "responseModels": { "application/json": "Empty" }, "responseParameters": {
/// "method.response.header.Content-Type": false }, "statusCode": "200" } } }
///
/// In the example above, the response template for the `200 OK` response maps
/// the JSON output from the `ListStreams` action in the back end to an XML
/// output. The mapping template is URL-encoded as
/// `%3CkinesisStreams%3E%23foreach(%24stream%20in%20%24input.path(%27%24.StreamNames%27))%3Cstream%3E%3Cname%3E%24stream%3C%2Fname%3E%3C%2Fstream%3E%23end%3C%2FkinesisStreams%3E`
/// and the output is decoded using the
/// [$util.urlDecode()](https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-mapping-template-reference.html#util-templat-reference)
/// helper function.
///
///  MethodResponse, Integration, IntegrationResponse, Resource,
/// [Set up an API's method](https://docs.aws.amazon.com/apigateway/latest/developerguide/how-to-method-settings.html)
class Method {
  /// The method's HTTP verb.
  final String httpMethod;

  /// The method's authorization type. Valid values are `NONE` for open access,
  /// `AWS_IAM` for using AWS IAM permissions, `CUSTOM` for using a custom
  /// authorizer, or `COGNITO_USER_POOLS` for using a Cognito user pool.
  final String authorizationType;

  /// The identifier of an Authorizer to use on this method. The
  /// `authorizationType` must be `CUSTOM`.
  final String authorizerId;

  /// A boolean flag specifying whether a valid ApiKey is required to invoke
  /// this method.
  final bool apiKeyRequired;

  /// The identifier of a RequestValidator for request validation.
  final String requestValidatorId;

  /// A human-friendly operation identifier for the method. For example, you can
  /// assign the `operationName` of `ListPets` for the `GET /pets` method in the
  /// `PetStore` example.
  final String operationName;

  /// A key-value map defining required or optional method request parameters
  /// that can be accepted by API Gateway. A key is a method request parameter
  /// name matching the pattern of `method.request.{location}.{name}`, where
  /// `location` is `querystring`, `path`, or `header` and `name` is a valid and
  /// unique parameter name. The value associated with the key is a Boolean flag
  /// indicating whether the parameter is required (`true`) or optional
  /// (`false`). The method request parameter names defined here are available
  /// in Integration to be mapped to integration request parameters or
  /// templates.
  final Map<String, bool> requestParameters;

  /// A key-value map specifying data schemas, represented by Model resources,
  /// (as the mapped value) of the request payloads of given content types (as
  /// the mapping key).
  final Map<String, String> requestModels;

  /// Gets a method response associated with a given HTTP status code.
  ///
  /// The collection of method responses are encapsulated in a key-value map,
  /// where the key is a response's HTTP status code and the value is a
  /// MethodResponse resource that specifies the response returned to the caller
  /// from the back end through the integration response.
  ///
  /// #### Example: Get a 200 OK response of a GET method
  ///
  /// ##### Request
  ///
  ///     GET /restapis/uojnr9hd57/resources/0cjtch/methods/GET/responses/200
  /// HTTP/1.1 Content-Type: application/json Host:
  /// apigateway.us-east-1.amazonaws.com Content-Length: 117 X-Amz-Date:
  /// 20160613T215008Z Authorization: AWS4-HMAC-SHA256
  /// Credential={access_key_ID}/20160613/us-east-1/apigateway/aws4_request,
  /// SignedHeaders=content-type;host;x-amz-date, Signature={sig4_hash}
  ///
  /// ##### Response
  ///
  /// The successful response returns a `200 OK` status code and a payload
  /// similar to the following:
  ///
  ///     { "_links": { "curies": { "href":
  /// "https://docs.aws.amazon.com/apigateway/latest/developerguide/restapi-method-response-{rel}.html",
  /// "name": "methodresponse", "templated": true }, "self": { "href":
  /// "/restapis/uojnr9hd57/resources/0cjtch/methods/GET/responses/200",
  /// "title": "200" }, "methodresponse:delete": { "href":
  /// "/restapis/uojnr9hd57/resources/0cjtch/methods/GET/responses/200" },
  /// "methodresponse:update": { "href":
  /// "/restapis/uojnr9hd57/resources/0cjtch/methods/GET/responses/200" } },
  /// "responseModels": { "application/json": "Empty" }, "responseParameters": {
  /// "method.response.header.operator": false,
  /// "method.response.header.operand_2": false,
  /// "method.response.header.operand_1": false }, "statusCode": "200" }
  ///
  ///
  /// [AWS CLI](https://docs.aws.amazon.com/cli/latest/reference/apigateway/get-method-response.html)
  final Map<String, MethodResponse> methodResponses;

  /// Gets the method's integration responsible for passing the client-submitted
  /// request to the back end and performing necessary transformations to make
  /// the request compliant with the back end.
  ///
  /// #### Example:
  ///
  /// ##### Request
  ///
  ///     GET /restapis/uojnr9hd57/resources/0cjtch/methods/GET/integration
  /// HTTP/1.1 Content-Type: application/json Host:
  /// apigateway.us-east-1.amazonaws.com Content-Length: 117 X-Amz-Date:
  /// 20160613T213210Z Authorization: AWS4-HMAC-SHA256
  /// Credential={access_key_ID}/20160613/us-east-1/apigateway/aws4_request,
  /// SignedHeaders=content-type;host;x-amz-date, Signature={sig4_hash}
  ///
  /// ##### Response
  ///
  /// The successful response returns a `200 OK` status code and a payload
  /// similar to the following:
  ///
  ///     { "_links": { "curies":
  /// [ { "href": "https://docs.aws.amazon.com/apigateway/latest/developerguide/restapi-integration-{rel}.html", "name": "integration", "templated": true }, { "href": "https://docs.aws.amazon.com/apigateway/latest/developerguide/restapi-integration-response-{rel}.html", "name": "integrationresponse", "templated": true } ],
  /// "self": { "href":
  /// "/restapis/uojnr9hd57/resources/0cjtch/methods/GET/integration" },
  /// "integration:delete": { "href":
  /// "/restapis/uojnr9hd57/resources/0cjtch/methods/GET/integration" },
  /// "integration:responses": { "href":
  /// "/restapis/uojnr9hd57/resources/0cjtch/methods/GET/integration/responses/200",
  /// "name": "200", "title": "200" }, "integration:update": { "href":
  /// "/restapis/uojnr9hd57/resources/0cjtch/methods/GET/integration" },
  /// "integrationresponse:put": { "href":
  /// "/restapis/uojnr9hd57/resources/0cjtch/methods/GET/integration/responses/{status_code}",
  /// "templated": true } }, "cacheKeyParameters": [], "cacheNamespace":
  /// "0cjtch", "credentials":
  /// "arn:aws:iam::123456789012:role/apigAwsProxyRole", "httpMethod": "POST",
  /// "passthroughBehavior": "WHEN_NO_MATCH", "requestTemplates": {
  /// "application/json": "{n "a": "$input.params('operand1')",n "b":
  /// "$input.params('operand2')", n "op": "$input.params('operator')" n}" },
  /// "type": "AWS", "uri":
  /// "arn:aws:apigateway:us-west-2:lambda:path//2015-03-31/functions/arn:aws:lambda:us-west-2:123456789012:function:Calc/invocations",
  /// "_embedded": { "integration:responses": { "_links": { "self": { "href":
  /// "/restapis/uojnr9hd57/resources/0cjtch/methods/GET/integration/responses/200",
  /// "name": "200", "title": "200" }, "integrationresponse:delete": { "href":
  /// "/restapis/uojnr9hd57/resources/0cjtch/methods/GET/integration/responses/200"
  /// }, "integrationresponse:update": { "href":
  /// "/restapis/uojnr9hd57/resources/0cjtch/methods/GET/integration/responses/200"
  /// } }, "responseParameters": { "method.response.header.operator":
  /// "integration.response.body.op", "method.response.header.operand_2":
  /// "integration.response.body.b", "method.response.header.operand_1":
  /// "integration.response.body.a" }, "responseTemplates": {
  /// "application/json": "#set($res = $input.path('$'))n{n "result": "$res.a,
  /// $res.b, $res.op => $res.c",n "a" : "$res.a",n "b" : "$res.b",n "op" :
  /// "$res.op",n "c" : "$res.c"n}" }, "selectionPattern": "", "statusCode":
  /// "200" } } }
  ///
  ///
  /// [AWS CLI](https://docs.aws.amazon.com/cli/latest/reference/apigateway/get-integration.html)
  final Integration methodIntegration;

  /// A list of authorization scopes configured on the method. The scopes are
  /// used with a `COGNITO_USER_POOLS` authorizer to authorize the method
  /// invocation. The authorization works by matching the method scopes against
  /// the scopes parsed from the access token in the incoming request. The
  /// method invocation is authorized if any method scopes matches a claimed
  /// scope in the access token. Otherwise, the invocation is not authorized.
  /// When the method scope is configured, the client must provide an access
  /// token instead of an identity token for authorization purposes.
  final List<String> authorizationScopes;

  Method({
    this.httpMethod,
    this.authorizationType,
    this.authorizerId,
    this.apiKeyRequired,
    this.requestValidatorId,
    this.operationName,
    this.requestParameters,
    this.requestModels,
    this.methodResponses,
    this.methodIntegration,
    this.authorizationScopes,
  });
  static Method fromJson(Map<String, dynamic> json) => Method();
}

/// Represents a method response of a given HTTP status code returned to the
/// client. The method response is passed from the back end through the
/// associated integration response that can be transformed using a mapping
/// template.
///
/// #### Example: A **MethodResponse** instance of an API
///
/// ##### Request
///
/// The example request retrieves a **MethodResponse** of the 200 status code.
///
///     GET /restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/responses/200
/// HTTP/1.1 Content-Type: application/json Host:
/// apigateway.us-east-1.amazonaws.com X-Amz-Date: 20160603T222952Z
/// Authorization: AWS4-HMAC-SHA256
/// Credential={access_key_ID}/20160603/us-east-1/apigateway/aws4_request,
/// SignedHeaders=content-type;host;x-amz-date, Signature={sig4_hash}
///
/// ##### Response
///
/// The successful response returns `200 OK` status and a payload as follows:
///
///     { "_links": { "curies": { "href":
/// "https://docs.aws.amazon.com/apigateway/latest/developerguide/restapi-method-response-{rel}.html",
/// "name": "methodresponse", "templated": true }, "self": { "href":
/// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/responses/200",
/// "title": "200" }, "methodresponse:delete": { "href":
/// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/responses/200" },
/// "methodresponse:update": { "href":
/// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/responses/200" } },
/// "responseModels": { "application/json": "Empty" }, "responseParameters": {
/// "method.response.header.Content-Type": false }, "statusCode": "200" }
///
///  Method, IntegrationResponse, Integration
/// [Creating an API](https://docs.aws.amazon.com/apigateway/latest/developerguide/how-to-create-api.html)
class MethodResponse {
  /// The method response's status code.
  final String statusCode;

  /// A key-value map specifying required or optional response parameters that
  /// API Gateway can send back to the caller. A key defines a method response
  /// header and the value specifies whether the associated method response
  /// header is required or not. The expression of the key must match the
  /// pattern `method.response.header.{name}`, where `name` is a valid and
  /// unique header name. API Gateway passes certain integration response data
  /// to the method response headers specified here according to the mapping you
  /// prescribe in the API's IntegrationResponse. The integration response data
  /// that can be mapped include an integration response header expressed in
  /// `integration.response.header.{name}`, a static value enclosed within a
  /// pair of single quotes (e.g., `'application/json'`), or a JSON expression
  /// from the back-end response payload in the form of
  /// `integration.response.body.{JSON-expression}`, where `JSON-expression` is
  /// a valid JSON expression without the `$` prefix.)
  final Map<String, bool> responseParameters;

  /// Specifies the Model resources used for the response's content-type.
  /// Response models are represented as a key/value map, with a content-type as
  /// the key and a Model name as the value.
  final Map<String, String> responseModels;

  MethodResponse({
    this.statusCode,
    this.responseParameters,
    this.responseModels,
  });
  static MethodResponse fromJson(Map<String, dynamic> json) => MethodResponse();
}

/// Specifies the method setting properties.
class MethodSetting {
  /// Specifies whether Amazon CloudWatch metrics are enabled for this method.
  /// The PATCH path for this setting is
  /// `/{method_setting_key}/metrics/enabled`, and the value is a Boolean.
  final bool metricsEnabled;

  /// Specifies the logging level for this method, which affects the log entries
  /// pushed to Amazon CloudWatch Logs. The PATCH path for this setting is
  /// `/{method_setting_key}/logging/loglevel`, and the available levels are
  /// `OFF`, `ERROR`, and `INFO`.
  final String loggingLevel;

  /// Specifies whether data trace logging is enabled for this method, which
  /// affects the log entries pushed to Amazon CloudWatch Logs. The PATCH path
  /// for this setting is `/{method_setting_key}/logging/dataTrace`, and the
  /// value is a Boolean.
  final bool dataTraceEnabled;

  /// Specifies the throttling burst limit. The PATCH path for this setting is
  /// `/{method_setting_key}/throttling/burstLimit`, and the value is an
  /// integer.
  final int throttlingBurstLimit;

  /// Specifies the throttling rate limit. The PATCH path for this setting is
  /// `/{method_setting_key}/throttling/rateLimit`, and the value is a double.
  final double throttlingRateLimit;

  /// Specifies whether responses should be cached and returned for requests. A
  /// cache cluster must be enabled on the stage for responses to be cached. The
  /// PATCH path for this setting is `/{method_setting_key}/caching/enabled`,
  /// and the value is a Boolean.
  final bool cachingEnabled;

  /// Specifies the time to live (TTL), in seconds, for cached responses. The
  /// higher the TTL, the longer the response will be cached. The PATCH path for
  /// this setting is `/{method_setting_key}/caching/ttlInSeconds`, and the
  /// value is an integer.
  final int cacheTtlInSeconds;

  /// Specifies whether the cached responses are encrypted. The PATCH path for
  /// this setting is `/{method_setting_key}/caching/dataEncrypted`, and the
  /// value is a Boolean.
  final bool cacheDataEncrypted;

  /// Specifies whether authorization is required for a cache invalidation
  /// request. The PATCH path for this setting is
  /// `/{method_setting_key}/caching/requireAuthorizationForCacheControl`, and
  /// the value is a Boolean.
  final bool requireAuthorizationForCacheControl;

  /// Specifies how to handle unauthorized requests for cache invalidation. The
  /// PATCH path for this setting is
  /// `/{method_setting_key}/caching/unauthorizedCacheControlHeaderStrategy`,
  /// and the available values are `FAIL_WITH_403`,
  /// `SUCCEED_WITH_RESPONSE_HEADER`, `SUCCEED_WITHOUT_RESPONSE_HEADER`.
  final String unauthorizedCacheControlHeaderStrategy;

  MethodSetting({
    this.metricsEnabled,
    this.loggingLevel,
    this.dataTraceEnabled,
    this.throttlingBurstLimit,
    this.throttlingRateLimit,
    this.cachingEnabled,
    this.cacheTtlInSeconds,
    this.cacheDataEncrypted,
    this.requireAuthorizationForCacheControl,
    this.unauthorizedCacheControlHeaderStrategy,
  });
  static MethodSetting fromJson(Map<String, dynamic> json) => MethodSetting();
}

/// Represents a summary of a Method resource, given a particular date and time.
class MethodSnapshot {
  /// The method's authorization type. Valid values are `NONE` for open access,
  /// `AWS_IAM` for using AWS IAM permissions, `CUSTOM` for using a custom
  /// authorizer, or `COGNITO_USER_POOLS` for using a Cognito user pool.
  final String authorizationType;

  /// Specifies whether the method requires a valid ApiKey.
  final bool apiKeyRequired;

  MethodSnapshot({
    this.authorizationType,
    this.apiKeyRequired,
  });
  static MethodSnapshot fromJson(Map<String, dynamic> json) => MethodSnapshot();
}

/// Represents the data structure of a method's request or response payload.
///
/// A request model defines the data structure of the client-supplied request
/// payload. A response model defines the data structure of the response payload
/// returned by the back end. Although not required, models are useful for
/// mapping payloads between the front end and back end.
///
/// A model is used for generating an API's SDK, validating the input request
/// body, and creating a skeletal mapping template.
///
///  Method, MethodResponse,
/// [Models and Mappings](https://docs.aws.amazon.com/apigateway/latest/developerguide/models-mappings.html)
class Model {
  /// The identifier for the model resource.
  final String id;

  /// The name of the model. Must be an alphanumeric string.
  final String name;

  /// The description of the model.
  final String description;

  /// The schema for the model. For `application/json` models, this should be
  /// [JSON schema draft 4](https://tools.ietf.org/html/draft-zyp-json-schema-04)
  /// model. Do not include "*/" characters in the description of any properties
  /// because such "*/" characters may be interpreted as the closing marker for
  /// comments in some languages, such as Java or JavaScript, causing the
  /// installation of your API's SDK generated by API Gateway to fail.
  final String schema;

  /// The content-type for the model.
  final String contentType;

  Model({
    this.id,
    this.name,
    this.description,
    this.schema,
    this.contentType,
  });
  static Model fromJson(Map<String, dynamic> json) => Model();
}

/// Represents a collection of Model resources.
///
///  Method, MethodResponse,
/// [Models and Mappings](https://docs.aws.amazon.com/apigateway/latest/developerguide/models-mappings.html)
class Models {
  final String position;

  /// The current page of elements from this collection.
  final List<Model> items;

  Models({
    this.position,
    this.items,
  });
  static Models fromJson(Map<String, dynamic> json) => Models();
}

/// A single patch operation to apply to the specified resource. Please refer to
/// http://tools.ietf.org/html/rfc6902#section-4 for an explanation of how each
/// operation is used.
class PatchOperation {
  ///  An update operation to be performed with this PATCH request. The valid
  /// value can be `add`, `remove`, `replace` or `copy`. Not all valid
  /// operations are supported for a given resource. Support of the operations
  /// depends on specific operational contexts. Attempts to apply an unsupported
  /// operation on a resource will return an error message.
  final String op;

  /// The `op` operation's target, as identified by a
  /// [JSON Pointer](https://tools.ietf.org/html/draft-ietf-appsawg-json-pointer-08)
  /// value that references a location within the targeted resource. For
  /// example, if the target resource has an updateable property of
  /// `{"name":"value"}`, the path for this property is `/name`. If the `name`
  /// property value is a JSON object (e.g., `{"name": {"child/name":
  /// "child-value"}}`), the path for the `child/name` property will be
  /// `/name/child~1name`. Any slash ("/") character appearing in path names
  /// must be escaped with "~1", as shown in the example above. Each `op`
  /// operation can have only one `path` associated with it.
  final String path;

  /// The new target value of the update operation. It is applicable for the
  /// `add` or `replace` operation. When using AWS CLI to update a property of a
  /// JSON value, enclose the JSON object with a pair of single quotes in a
  /// Linux shell, e.g., '{"a": ...}'. In a Windows shell, see
  /// [Using JSON for Parameters](https://docs.aws.amazon.com/cli/latest/userguide/cli-using-param.html#cli-using-param-json).
  final String value;

  /// The `copy` update operation's source as identified by a `JSON-Pointer`
  /// value referencing the location within the targeted resource to copy the
  /// value from. For example, to promote a canary deployment, you copy the
  /// canary deployment ID to the affiliated deployment ID by calling a PATCH
  /// request on a Stage resource with `"op":"copy"`,
  /// `"from":"/canarySettings/deploymentId"` and `"path":"/deploymentId"`.
  final String from;

  PatchOperation({
    this.op,
    this.path,
    this.value,
    this.from,
  });
}

/// Quotas configured for a usage plan.
class QuotaSettings {
  /// The maximum number of requests that can be made in a given time period.
  final int limit;

  /// The number of requests subtracted from the given limit in the initial time
  /// period.
  final int offset;

  /// The time period in which the limit applies. Valid values are "DAY", "WEEK"
  /// or "MONTH".
  final String period;

  QuotaSettings({
    this.limit,
    this.offset,
    this.period,
  });
  static QuotaSettings fromJson(Map<String, dynamic> json) => QuotaSettings();
}

/// A set of validation rules for incoming Method requests.
///
/// In OpenAPI, a RequestValidator of an API is defined by the
/// [x-amazon-apigateway-request-validators.requestValidator](https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-swagger-extensions.html#api-gateway-swagger-extensions-request-validators.requestValidator.html)
/// object. It the referenced using the
/// [x-amazon-apigateway-request-validator](https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-swagger-extensions.html#api-gateway-swagger-extensions-request-validator)
/// property.
///
/// [Enable Basic Request Validation in API Gateway](https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-method-request-validation.html)
class RequestValidator {
  /// The identifier of this RequestValidator.
  final String id;

  /// The name of this RequestValidator
  final String name;

  /// A Boolean flag to indicate whether to validate a request body according to
  /// the configured Model schema.
  final bool validateRequestBody;

  /// A Boolean flag to indicate whether to validate request parameters (`true`)
  /// or not (`false`).
  final bool validateRequestParameters;

  RequestValidator({
    this.id,
    this.name,
    this.validateRequestBody,
    this.validateRequestParameters,
  });
  static RequestValidator fromJson(Map<String, dynamic> json) =>
      RequestValidator();
}

/// A collection of RequestValidator resources of a given RestApi.
///
/// In OpenAPI, the RequestValidators of an API is defined by the
/// [x-amazon-apigateway-request-validators](https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-swagger-extensions.html#api-gateway-swagger-extensions-request-validators.html)
/// extension.
///
/// [Enable Basic Request Validation in API Gateway](https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-method-request-validation.html)
class RequestValidators {
  final String position;

  /// The current page of elements from this collection.
  final List<RequestValidator> items;

  RequestValidators({
    this.position,
    this.items,
  });
  static RequestValidators fromJson(Map<String, dynamic> json) =>
      RequestValidators();
}

/// Represents an API resource.
///
///
/// [Create an API](https://docs.aws.amazon.com/apigateway/latest/developerguide/how-to-create-api.html)
class Resource {
  /// The resource's identifier.
  final String id;

  /// The parent resource's identifier.
  final String parentId;

  /// The last path segment for this resource.
  final String pathPart;

  /// The full path for this resource.
  final String path;

  /// Gets an API resource's method of a given HTTP verb.
  ///
  /// The resource methods are a map of methods indexed by methods' HTTP verbs
  /// enabled on the resource. This method map is included in the `200 OK`
  /// response of the `GET /restapis/{restapi_id}/resources/{resource_id}` or
  /// `GET /restapis/{restapi_id}/resources/{resource_id}?embed=methods`
  /// request.
  ///
  /// #### Example: Get the GET method of an API resource
  ///
  /// ##### Request
  ///
  ///     GET /restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET HTTP/1.1
  /// Content-Type: application/json Host: apigateway.us-east-1.amazonaws.com
  /// X-Amz-Date: 20170223T031827Z Authorization: AWS4-HMAC-SHA256
  /// Credential={access_key_ID}/20170223/us-east-1/apigateway/aws4_request,
  /// SignedHeaders=content-type;host;x-amz-date, Signature={sig4_hash}
  ///
  /// ##### Response
  ///
  ///     { "_links": { "curies":
  /// [ { "href": "https://docs.aws.amazon.com/apigateway/latest/developerguide/restapi-integration-{rel}.html", "name": "integration", "templated": true }, { "href": "https://docs.aws.amazon.com/apigateway/latest/developerguide/restapi-integration-response-{rel}.html", "name": "integrationresponse", "templated": true }, { "href": "https://docs.aws.amazon.com/apigateway/latest/developerguide/restapi-method-{rel}.html", "name": "method", "templated": true }, { "href": "https://docs.aws.amazon.com/apigateway/latest/developerguide/restapi-method-response-{rel}.html", "name": "methodresponse", "templated": true } ],
  /// "self": { "href": "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET",
  /// "name": "GET", "title": "GET" }, "integration:put": { "href":
  /// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/integration" },
  /// "method:delete": { "href":
  /// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET" },
  /// "method:integration": { "href":
  /// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/integration" },
  /// "method:responses": { "href":
  /// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/responses/200",
  /// "name": "200", "title": "200" }, "method:update": { "href":
  /// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET" },
  /// "methodresponse:put": { "href":
  /// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/responses/{status_code}",
  /// "templated": true } }, "apiKeyRequired": false, "authorizationType":
  /// "NONE", "httpMethod": "GET", "_embedded": { "method:integration": {
  /// "_links": { "self": { "href":
  /// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/integration" },
  /// "integration:delete": { "href":
  /// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/integration" },
  /// "integration:responses": { "href":
  /// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/integration/responses/200",
  /// "name": "200", "title": "200" }, "integration:update": { "href":
  /// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/integration" },
  /// "integrationresponse:put": { "href":
  /// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/integration/responses/{status_code}",
  /// "templated": true } }, "cacheKeyParameters": [], "cacheNamespace":
  /// "3kzxbg5sa2", "credentials":
  /// "arn:aws:iam::123456789012:role/apigAwsProxyRole", "httpMethod": "POST",
  /// "passthroughBehavior": "WHEN_NO_MATCH", "requestParameters": {
  /// "integration.request.header.Content-Type": "'application/x-amz-json-1.1'"
  /// }, "requestTemplates": { "application/json": "{n}" }, "type": "AWS",
  /// "uri": "arn:aws:apigateway:us-east-1:kinesis:action/ListStreams",
  /// "_embedded": { "integration:responses": { "_links": { "self": { "href":
  /// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/integration/responses/200",
  /// "name": "200", "title": "200" }, "integrationresponse:delete": { "href":
  /// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/integration/responses/200"
  /// }, "integrationresponse:update": { "href":
  /// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/integration/responses/200"
  /// } }, "responseParameters": { "method.response.header.Content-Type":
  /// "'application/xml'" }, "responseTemplates": { "application/json":
  /// "$util.urlDecode("%3CkinesisStreams%3E#foreach($stream in
  /// $input.path('$.StreamNames'))%3Cstream%3E%3Cname%3E$stream%3C/name%3E%3C/stream%3E#end%3C/kinesisStreams%3E")n"
  /// }, "statusCode": "200" } } }, "method:responses": { "_links": { "self": {
  /// "href":
  /// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/responses/200",
  /// "name": "200", "title": "200" }, "methodresponse:delete": { "href":
  /// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/responses/200" },
  /// "methodresponse:update": { "href":
  /// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/responses/200" } },
  /// "responseModels": { "application/json": "Empty" }, "responseParameters": {
  /// "method.response.header.Content-Type": false }, "statusCode": "200" } } }
  ///
  /// If the `OPTIONS` is enabled on the resource, you can follow the example
  /// here to get that method. Just replace the `GET` of the last path segment
  /// in the request URL with `OPTIONS`.
  final Map<String, Method> resourceMethods;

  Resource({
    this.id,
    this.parentId,
    this.pathPart,
    this.path,
    this.resourceMethods,
  });
  static Resource fromJson(Map<String, dynamic> json) => Resource();
}

/// Represents a collection of Resource resources.
///
///
/// [Create an API](https://docs.aws.amazon.com/apigateway/latest/developerguide/how-to-create-api.html)
class Resources {
  final String position;

  /// The current page of elements from this collection.
  final List<Resource> items;

  Resources({
    this.position,
    this.items,
  });
  static Resources fromJson(Map<String, dynamic> json) => Resources();
}

/// Represents a REST API.
///
///
/// [Create an API](https://docs.aws.amazon.com/apigateway/latest/developerguide/how-to-create-api.html)
class RestApi {
  /// The API's identifier. This identifier is unique across all of your APIs in
  /// API Gateway.
  final String id;

  /// The API's name.
  final String name;

  /// The API's description.
  final String description;

  /// The timestamp when the API was created.
  final DateTime createdDate;

  /// A version identifier for the API.
  final String version;

  /// The warning messages reported when `failonwarnings` is turned on during
  /// API import.
  final List<String> warnings;

  /// The list of binary media types supported by the RestApi. By default, the
  /// RestApi supports only UTF-8-encoded text payloads.
  final List<String> binaryMediaTypes;

  /// A nullable integer that is used to enable compression (with non-negative
  /// between 0 and 10485760 (10M) bytes, inclusive) or disable compression
  /// (with a null value) on an API. When compression is enabled, compression or
  /// decompression is not applied on the payload if the payload size is smaller
  /// than this value. Setting it to zero allows compression for any payload
  /// size.
  final int minimumCompressionSize;

  /// The source of the API key for metering requests according to a usage plan.
  /// Valid values are:
  ///
  /// *   `HEADER` to read the API key from the `X-API-Key` header of a request.
  /// *   `AUTHORIZER` to read the API key from the `UsageIdentifierKey` from a
  /// custom authorizer.
  final String apiKeySource;

  /// The endpoint configuration of this RestApi showing the endpoint types of
  /// the API.
  final EndpointConfiguration endpointConfiguration;

  /// A stringified JSON policy document that applies to this RestApi regardless
  /// of the caller and Method configuration.
  final String policy;

  /// The collection of tags. Each tag element is associated with a given
  /// resource.
  final Map<String, String> tags;

  RestApi({
    this.id,
    this.name,
    this.description,
    this.createdDate,
    this.version,
    this.warnings,
    this.binaryMediaTypes,
    this.minimumCompressionSize,
    this.apiKeySource,
    this.endpointConfiguration,
    this.policy,
    this.tags,
  });
  static RestApi fromJson(Map<String, dynamic> json) => RestApi();
}

/// Contains references to your APIs and links that guide you in how to interact
/// with your collection. A collection offers a paginated view of your APIs.
///
///
/// [Create an API](https://docs.aws.amazon.com/apigateway/latest/developerguide/how-to-create-api.html)
class RestApis {
  final String position;

  /// The current page of elements from this collection.
  final List<RestApi> items;

  RestApis({
    this.position,
    this.items,
  });
  static RestApis fromJson(Map<String, dynamic> json) => RestApis();
}

/// A configuration property of an SDK type.
class SdkConfigurationProperty {
  /// The name of a an SdkType configuration property.
  final String name;

  /// The user-friendly name of an SdkType configuration property.
  final String friendlyName;

  /// The description of an SdkType configuration property.
  final String description;

  /// A boolean flag of an SdkType configuration property to indicate if the
  /// associated SDK configuration property is required (`true`) or not
  /// (`false`).
  final bool isRequired;

  /// The default value of an SdkType configuration property.
  final String defaultValue;

  SdkConfigurationProperty({
    this.name,
    this.friendlyName,
    this.description,
    this.isRequired,
    this.defaultValue,
  });
  static SdkConfigurationProperty fromJson(Map<String, dynamic> json) =>
      SdkConfigurationProperty();
}

/// The binary blob response to GetSdk, which contains the generated SDK.
class SdkResponse {
  /// The content-type header value in the HTTP response.
  final String contentType;

  /// The content-disposition header value in the HTTP response.
  final String contentDisposition;

  /// The binary blob response to GetSdk, which contains the generated SDK.
  final Uint8List body;

  SdkResponse({
    this.contentType,
    this.contentDisposition,
    this.body,
  });
  static SdkResponse fromJson(Map<String, dynamic> json) => SdkResponse();
}

/// A type of SDK that API Gateway can generate.
class SdkType {
  /// The identifier of an SdkType instance.
  final String id;

  /// The user-friendly name of an SdkType instance.
  final String friendlyName;

  /// The description of an SdkType.
  final String description;

  /// A list of configuration properties of an SdkType.
  final List<SdkConfigurationProperty> configurationProperties;

  SdkType({
    this.id,
    this.friendlyName,
    this.description,
    this.configurationProperties,
  });
  static SdkType fromJson(Map<String, dynamic> json) => SdkType();
}

/// The collection of SdkType instances.
class SdkTypes {
  final String position;

  /// The current page of elements from this collection.
  final List<SdkType> items;

  SdkTypes({
    this.position,
    this.items,
  });
  static SdkTypes fromJson(Map<String, dynamic> json) => SdkTypes();
}

/// Represents a unique identifier for a version of a deployed RestApi that is
/// callable by users.
///
///
/// [Deploy an API](https://docs.aws.amazon.com/apigateway/latest/developerguide/how-to-deploy-api.html)
class Stage {
  /// The identifier of the Deployment that the stage points to.
  final String deploymentId;

  /// The identifier of a client certificate for an API stage.
  final String clientCertificateId;

  /// The name of the stage is the first path segment in the Uniform Resource
  /// Identifier (URI) of a call to API Gateway. Stage names can only contain
  /// alphanumeric characters, hyphens, and underscores. Maximum length is 128
  /// characters.
  final String stageName;

  /// The stage's description.
  final String description;

  /// Specifies whether a cache cluster is enabled for the stage.
  final bool cacheClusterEnabled;

  /// The size of the cache cluster for the stage, if enabled.
  final String cacheClusterSize;

  /// The status of the cache cluster for the stage, if enabled.
  final String cacheClusterStatus;

  /// A map that defines the method settings for a Stage resource. Keys
  /// (designated as `/{method_setting_key` below) are method paths defined as
  /// `{resource_path}/{http_method}` for an individual method override, or
  /// `/*/*` for overriding all methods in the stage.
  final Map<String, MethodSetting> methodSettings;

  /// A map that defines the stage variables for a Stage resource. Variable
  /// names can have alphanumeric and underscore characters, and the values must
  /// match `[A-Za-z0-9-._~:/?#&=,]+`.
  final Map<String, String> variables;

  /// The version of the associated API documentation.
  final String documentationVersion;

  /// Settings for logging access in this stage.
  final AccessLogSettings accessLogSettings;

  /// Settings for the canary deployment in this stage.
  final CanarySettings canarySettings;

  /// Specifies whether active tracing with X-ray is enabled for the Stage.
  final bool tracingEnabled;

  /// The ARN of the WebAcl associated with the Stage.
  final String webAclArn;

  /// The collection of tags. Each tag element is associated with a given
  /// resource.
  final Map<String, String> tags;

  /// The timestamp when the stage was created.
  final DateTime createdDate;

  /// The timestamp when the stage last updated.
  final DateTime lastUpdatedDate;

  Stage({
    this.deploymentId,
    this.clientCertificateId,
    this.stageName,
    this.description,
    this.cacheClusterEnabled,
    this.cacheClusterSize,
    this.cacheClusterStatus,
    this.methodSettings,
    this.variables,
    this.documentationVersion,
    this.accessLogSettings,
    this.canarySettings,
    this.tracingEnabled,
    this.webAclArn,
    this.tags,
    this.createdDate,
    this.lastUpdatedDate,
  });
  static Stage fromJson(Map<String, dynamic> json) => Stage();
}

/// A reference to a unique stage identified in the format
/// `{restApiId}/{stage}`.
class StageKey {
  /// The string identifier of the associated RestApi.
  final String restApiId;

  /// The stage name associated with the stage key.
  final String stageName;

  StageKey({
    this.restApiId,
    this.stageName,
  });
}

/// A list of Stage resources that are associated with the ApiKey resource.
///
/// [Deploying API in Stages](https://docs.aws.amazon.com/apigateway/latest/developerguide/stages.html)
class Stages {
  /// The current page of elements from this collection.
  final List<Stage> item;

  Stages({
    this.item,
  });
  static Stages fromJson(Map<String, dynamic> json) => Stages();
}

/// The collection of tags. Each tag element is associated with a given
/// resource.
class Tags {
  /// The collection of tags. Each tag element is associated with a given
  /// resource.
  final Map<String, String> tags;

  Tags({
    this.tags,
  });
  static Tags fromJson(Map<String, dynamic> json) => Tags();
}

/// Represents a mapping template used to transform a payload.
///
///
/// [Mapping Templates](https://docs.aws.amazon.com/apigateway/latest/developerguide/models-mappings.html#models-mappings-mappings)
class Template {
  /// The Apache
  /// [Velocity Template Language (VTL)](https://velocity.apache.org/engine/devel/vtl-reference-guide.html)
  /// template content used for the template resource.
  final String value;

  Template({
    this.value,
  });
  static Template fromJson(Map<String, dynamic> json) => Template();
}

/// Represents the response of the test invoke request for a custom Authorizer
class TestInvokeAuthorizerResponse {
  /// The HTTP status code that the client would have received. Value is 0 if
  /// the authorizer succeeded.
  final int clientStatus;

  /// The API Gateway execution log for the test authorizer request.
  final String log;

  /// The execution latency of the test authorizer request.
  final BigInt latency;

  /// The principal identity returned by the Authorizer
  final String principalId;

  /// The JSON policy document returned by the Authorizer
  final String policy;

  final Map<String, List<String>> authorization;

  /// The
  /// [open identity claims](https://openid.net/specs/openid-connect-core-1_0.html#StandardClaims),
  /// with any supported custom attributes, returned from the Cognito Your User
  /// Pool configured for the API.
  final Map<String, String> claims;

  TestInvokeAuthorizerResponse({
    this.clientStatus,
    this.log,
    this.latency,
    this.principalId,
    this.policy,
    this.authorization,
    this.claims,
  });
  static TestInvokeAuthorizerResponse fromJson(Map<String, dynamic> json) =>
      TestInvokeAuthorizerResponse();
}

/// Represents the response of the test invoke request in the HTTP method.
///
///
/// [Test API using the API Gateway console](https://docs.aws.amazon.com/apigateway/latest/developerguide/how-to-test-method.html#how-to-test-method-console)
class TestInvokeMethodResponse {
  /// The HTTP status code.
  final int status;

  /// The body of the HTTP response.
  final String body;

  /// The headers of the HTTP response.
  final Map<String, String> headers;

  /// The headers of the HTTP response as a map from string to list of values.
  final Map<String, List<String>> multiValueHeaders;

  /// The API Gateway execution log for the test invoke request.
  final String log;

  /// The execution latency of the test invoke request.
  final BigInt latency;

  TestInvokeMethodResponse({
    this.status,
    this.body,
    this.headers,
    this.multiValueHeaders,
    this.log,
    this.latency,
  });
  static TestInvokeMethodResponse fromJson(Map<String, dynamic> json) =>
      TestInvokeMethodResponse();
}

///  The API request rate limits.
class ThrottleSettings {
  /// The API request burst limit, the maximum rate limit over a time ranging
  /// from one to a few seconds, depending upon whether the underlying token
  /// bucket is at its full capacity.
  final int burstLimit;

  /// The API request steady-state rate limit.
  final double rateLimit;

  ThrottleSettings({
    this.burstLimit,
    this.rateLimit,
  });
  static ThrottleSettings fromJson(Map<String, dynamic> json) =>
      ThrottleSettings();
}

/// Represents the usage data of a usage plan.
///
///
/// [Create and Use Usage Plans](https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-api-usage-plans.html),
/// [Manage Usage in a Usage Plan](https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-create-usage-plans-with-console.html#api-gateway-usage-plan-manage-usage)
class Usage {
  /// The plan Id associated with this usage data.
  final String usagePlanId;

  /// The starting date of the usage data.
  final String startDate;

  /// The ending date of the usage data.
  final String endDate;

  final String position;

  /// The usage data, as daily logs of used and remaining quotas, over the
  /// specified time interval indexed over the API keys in a usage plan. For
  /// example, `{..., "values" : { "{api_key}" : [ [0, 100], [10, 90],
  /// [100, 10]]}`, where `{api_key}` stands for an API key value and the daily
  /// log entry is of the format `[used quota, remaining quota]`.
  final Map<String, List<List<BigInt>>> items;

  Usage({
    this.usagePlanId,
    this.startDate,
    this.endDate,
    this.position,
    this.items,
  });
  static Usage fromJson(Map<String, dynamic> json) => Usage();
}

/// Represents a usage plan than can specify who can assess associated API
/// stages with specified request limits and quotas.
///
/// In a usage plan, you associate an API by specifying the API's Id and a stage
/// name of the specified API. You add plan customers by adding API keys to the
/// plan.
///
///
/// [Create and Use Usage Plans](https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-api-usage-plans.html)
class UsagePlan {
  /// The identifier of a UsagePlan resource.
  final String id;

  /// The name of a usage plan.
  final String name;

  /// The description of a usage plan.
  final String description;

  /// The associated API stages of a usage plan.
  final List<ApiStage> apiStages;

  /// The request throttle limits of a usage plan.
  final ThrottleSettings throttle;

  /// The maximum number of permitted requests per a given unit time interval.
  final QuotaSettings quota;

  /// The AWS Markeplace product identifier to associate with the usage plan as
  /// a SaaS product on AWS Marketplace.
  final String productCode;

  /// The collection of tags. Each tag element is associated with a given
  /// resource.
  final Map<String, String> tags;

  UsagePlan({
    this.id,
    this.name,
    this.description,
    this.apiStages,
    this.throttle,
    this.quota,
    this.productCode,
    this.tags,
  });
  static UsagePlan fromJson(Map<String, dynamic> json) => UsagePlan();
}

/// Represents a usage plan key to identify a plan customer.
///
/// To associate an API stage with a selected API key in a usage plan, you must
/// create a UsagePlanKey resource to represent the selected ApiKey.
///
/// "
///
///
/// [Create and Use Usage Plans](https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-api-usage-plans.html)
class UsagePlanKey {
  /// The Id of a usage plan key.
  final String id;

  /// The type of a usage plan key. Currently, the valid key type is `API_KEY`.
  final String type;

  /// The value of a usage plan key.
  final String value;

  /// The name of a usage plan key.
  final String name;

  UsagePlanKey({
    this.id,
    this.type,
    this.value,
    this.name,
  });
  static UsagePlanKey fromJson(Map<String, dynamic> json) => UsagePlanKey();
}

/// Represents the collection of usage plan keys added to usage plans for the
/// associated API keys and, possibly, other types of keys.
///
///
/// [Create and Use Usage Plans](https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-api-usage-plans.html)
class UsagePlanKeys {
  final String position;

  /// The current page of elements from this collection.
  final List<UsagePlanKey> items;

  UsagePlanKeys({
    this.position,
    this.items,
  });
  static UsagePlanKeys fromJson(Map<String, dynamic> json) => UsagePlanKeys();
}

/// Represents a collection of usage plans for an AWS account.
///
///
/// [Create and Use Usage Plans](https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-api-usage-plans.html)
class UsagePlans {
  final String position;

  /// The current page of elements from this collection.
  final List<UsagePlan> items;

  UsagePlans({
    this.position,
    this.items,
  });
  static UsagePlans fromJson(Map<String, dynamic> json) => UsagePlans();
}

/// A API Gateway VPC link for a RestApi to access resources in an Amazon
/// Virtual Private Cloud (VPC).
///
/// To enable access to a resource in an Amazon Virtual Private Cloud through
/// Amazon API Gateway, you, as an API developer, create a VpcLink resource
/// targeted for one or more network load balancers of the VPC and then
/// integrate an API method with a private integration that uses the VpcLink.
/// The private integration has an integration type of `HTTP` or `HTTP_PROXY`
/// and has a connection type of `VPC_LINK`. The integration uses the
/// `connectionId` property to identify the VpcLink used.
class VpcLink {
  /// The identifier of the VpcLink. It is used in an Integration to reference
  /// this VpcLink.
  final String id;

  /// The name used to label and identify the VPC link.
  final String name;

  /// The description of the VPC link.
  final String description;

  /// The ARNs of network load balancers of the VPC targeted by the VPC link.
  /// The network load balancers must be owned by the same AWS account of the
  /// API owner.
  final List<String> targetArns;

  /// The status of the VPC link. The valid values are `AVAILABLE`, `PENDING`,
  /// `DELETING`, or `FAILED`. Deploying an API will wait if the status is
  /// `PENDING` and will fail if the status is `DELETING`.
  final String status;

  /// A description about the VPC link status.
  final String statusMessage;

  /// The collection of tags. Each tag element is associated with a given
  /// resource.
  final Map<String, String> tags;

  VpcLink({
    this.id,
    this.name,
    this.description,
    this.targetArns,
    this.status,
    this.statusMessage,
    this.tags,
  });
  static VpcLink fromJson(Map<String, dynamic> json) => VpcLink();
}

/// The collection of VPC links under the caller's account in a region.
///
///
/// [Getting Started with Private Integrations](https://docs.aws.amazon.com/apigateway/latest/developerguide/getting-started-with-private-integration.html),
/// [Set up Private Integrations](https://docs.aws.amazon.com/apigateway/latest/developerguide/set-up-private-integration.html)
class VpcLinks {
  final String position;

  /// The current page of elements from this collection.
  final List<VpcLink> items;

  VpcLinks({
    this.position,
    this.items,
  });
  static VpcLinks fromJson(Map<String, dynamic> json) => VpcLinks();
}
