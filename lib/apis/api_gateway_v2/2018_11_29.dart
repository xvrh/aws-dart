import 'package:meta/meta.dart';

/// Amazon API Gateway V2
class ApiGatewayV2Api {
  final _client;
  ApiGatewayV2Api(client)
      : _client = client.configured('ApiGatewayV2', serializer: 'rest-json');

  /// Creates an Api resource.
  ///
  /// [apiKeySelectionExpression]: An API key selection expression. See
  /// [API Key Selection Expressions](https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-websocket-api-selection-expressions.html#apigateway-websocket-api-apikey-selection-expressions).
  ///
  /// [description]: The description of the API.
  ///
  /// [disableSchemaValidation]: Avoid validating models when creating a
  /// deployment.
  ///
  /// [name]: The name of the API.
  ///
  /// [protocolType]: The API protocol: Currently only WEBSOCKET is supported.
  ///
  /// [routeSelectionExpression]: The route selection expression for the API.
  ///
  /// [version]: A version identifier for the API.
  ///
  /// [tags]: The key-value map of strings. The valid character set is
  /// [a-zA-Z+-=._:/]. The tag key can be up to 128 characters and must not
  /// start with aws:. The tag value can be up to 256 characters..
  Future<CreateApiResponse> createApi(
      {String apiKeySelectionExpression,
      String description,
      bool disableSchemaValidation,
      @required String name,
      @required String protocolType,
      @required String routeSelectionExpression,
      String version,
      Map<String, String> tags}) async {
    var response_ = await _client.send('CreateApi', {
      if (apiKeySelectionExpression != null)
        'ApiKeySelectionExpression': apiKeySelectionExpression,
      if (description != null) 'Description': description,
      if (disableSchemaValidation != null)
        'DisableSchemaValidation': disableSchemaValidation,
      'Name': name,
      'ProtocolType': protocolType,
      'RouteSelectionExpression': routeSelectionExpression,
      if (version != null) 'Version': version,
      if (tags != null) 'Tags': tags,
    });
    return CreateApiResponse.fromJson(response_);
  }

  /// Creates an API mapping.
  ///
  /// [apiId]: The API identifier.
  ///
  /// [domainName]: The domain name.
  ///
  /// [stage]: The API stage.
  Future<CreateApiMappingResponse> createApiMapping(
      {@required String apiId,
      String apiMappingKey,
      @required String domainName,
      @required String stage}) async {
    var response_ = await _client.send('CreateApiMapping', {
      'ApiId': apiId,
      if (apiMappingKey != null) 'ApiMappingKey': apiMappingKey,
      'DomainName': domainName,
      'Stage': stage,
    });
    return CreateApiMappingResponse.fromJson(response_);
  }

  /// Creates an Authorizer for an API.
  ///
  /// [apiId]: The API identifier.
  ///
  /// [authorizerCredentialsArn]: Specifies the required credentials as an IAM
  /// role for API Gateway to invoke the authorizer. To specify an IAM role for
  /// API Gateway to assume, use the role's Amazon Resource Name (ARN). To use
  /// resource-based permissions on the Lambda function, specify null.
  ///
  /// [authorizerResultTtlInSeconds]: The time to live (TTL), in seconds, of
  /// cached authorizer results. If it equals 0, authorization caching is
  /// disabled. If it is greater than 0, API Gateway will cache authorizer
  /// responses. If this field is not set, the default value is 300. The maximum
  /// value is 3600, or 1 hour.
  ///
  /// [authorizerType]: The authorizer type. Currently the only valid value is
  /// REQUEST, for a Lambda function using incoming request parameters.
  ///
  /// [authorizerUri]: The authorizer's Uniform Resource Identifier (URI). For
  /// REQUEST authorizers, this must be a well-formed Lambda function URI, for
  /// example,
  /// arn:aws:apigateway:us-west-2:lambda:path/2015-03-31/functions/arn:aws:lambda:us-west-2:{account_id}:function:{lambda_function_name}/invocations.
  /// In general, the URI has this form:
  /// arn:aws:apigateway:{region}:lambda:path/{service_api} , where {region} is
  /// the same as the region hosting the Lambda function, path indicates that
  /// the remaining substring in the URI should be treated as the path to the
  /// resource, including the initial /. For Lambda functions, this is usually
  /// of the form /2015-03-31/functions/[FunctionARN]/invocations.
  ///
  /// [identitySource]: The identity source for which authorization is
  /// requested.
  ///
  /// For the REQUEST authorizer, this is required when authorization caching is
  /// enabled. The value is a comma-separated string of one or more mapping
  /// expressions of the specified request parameters. For example, if an Auth
  /// header and a Name query string parameters are defined as identity sources,
  /// this value is method.request.header.Auth, method.request.querystring.Name.
  /// These parameters will be used to derive the authorization caching key and
  /// to perform runtime validation of the REQUEST authorizer by verifying all
  /// of the identity-related request parameters are present, not null, and
  /// non-empty. Only when this is true does the authorizer invoke the
  /// authorizer Lambda function, otherwise, it returns a 401 Unauthorized
  /// response without calling the Lambda function. The valid value is a string
  /// of comma-separated mapping expressions of the specified request
  /// parameters. When the authorization caching is not enabled, this property
  /// is optional.
  ///
  /// [identityValidationExpression]: The validation expression does not apply
  /// to the REQUEST authorizer.
  ///
  /// [name]: The name of the authorizer.
  ///
  /// [providerArns]: For REQUEST authorizer, this is not defined.
  Future<CreateAuthorizerResponse> createAuthorizer(
      {@required String apiId,
      String authorizerCredentialsArn,
      int authorizerResultTtlInSeconds,
      @required String authorizerType,
      @required String authorizerUri,
      @required List<String> identitySource,
      String identityValidationExpression,
      @required String name,
      List<String> providerArns}) async {
    var response_ = await _client.send('CreateAuthorizer', {
      'ApiId': apiId,
      if (authorizerCredentialsArn != null)
        'AuthorizerCredentialsArn': authorizerCredentialsArn,
      if (authorizerResultTtlInSeconds != null)
        'AuthorizerResultTtlInSeconds': authorizerResultTtlInSeconds,
      'AuthorizerType': authorizerType,
      'AuthorizerUri': authorizerUri,
      'IdentitySource': identitySource,
      if (identityValidationExpression != null)
        'IdentityValidationExpression': identityValidationExpression,
      'Name': name,
      if (providerArns != null) 'ProviderArns': providerArns,
    });
    return CreateAuthorizerResponse.fromJson(response_);
  }

  /// Creates a Deployment for an API.
  ///
  /// [apiId]: The API identifier.
  ///
  /// [description]: The description for the deployment resource.
  ///
  /// [stageName]: The name of the Stage resource for the Deployment resource to
  /// create.
  Future<CreateDeploymentResponse> createDeployment(String apiId,
      {String description, String stageName}) async {
    var response_ = await _client.send('CreateDeployment', {
      'ApiId': apiId,
      if (description != null) 'Description': description,
      if (stageName != null) 'StageName': stageName,
    });
    return CreateDeploymentResponse.fromJson(response_);
  }

  /// Creates a domain name.
  ///
  /// [domainName]: The domain name.
  ///
  /// [domainNameConfigurations]: The domain name configurations.
  ///
  /// [tags]: The key-value map of strings. The valid character set is
  /// [a-zA-Z+-=._:/]. The tag key can be up to 128 characters and must not
  /// start with aws:. The tag value can be up to 256 characters..
  Future<CreateDomainNameResponse> createDomainName(String domainName,
      {List<DomainNameConfiguration> domainNameConfigurations,
      Map<String, String> tags}) async {
    var response_ = await _client.send('CreateDomainName', {
      'DomainName': domainName,
      if (domainNameConfigurations != null)
        'DomainNameConfigurations': domainNameConfigurations,
      if (tags != null) 'Tags': tags,
    });
    return CreateDomainNameResponse.fromJson(response_);
  }

  /// Creates an Integration.
  ///
  /// [apiId]: The API identifier.
  ///
  /// [connectionId]: The connection ID.
  ///
  /// [connectionType]: The type of the network connection to the integration
  /// endpoint. Currently the only valid value is INTERNET, for connections
  /// through the public routable internet.
  ///
  /// [contentHandlingStrategy]: Specifies how to handle response payload
  /// content type conversions. Supported values are CONVERT_TO_BINARY and
  /// CONVERT_TO_TEXT, with the following behaviors:
  ///
  ///  CONVERT_TO_BINARY: Converts a response payload from a Base64-encoded
  /// string to the corresponding binary blob.
  ///
  ///  CONVERT_TO_TEXT: Converts a response payload from a binary blob to a
  /// Base64-encoded string.
  ///
  /// If this property is not defined, the response payload will be passed
  /// through from the integration response to the route response or method
  /// response without modification.
  ///
  /// [credentialsArn]: Specifies the credentials required for the integration,
  /// if any. For AWS integrations, three options are available. To specify an
  /// IAM Role for API Gateway to assume, use the role's Amazon Resource Name
  /// (ARN). To require that the caller's identity be passed through from the
  /// request, specify the string arn:aws:iam::*:user/*. To use resource-based
  /// permissions on supported AWS services, specify null.
  ///
  /// [description]: The description of the integration.
  ///
  /// [integrationMethod]: Specifies the integration's HTTP method type.
  ///
  /// [integrationType]: The integration type of an integration. One of the
  /// following:
  ///
  ///  AWS: for integrating the route or method request with an AWS service
  /// action, including the Lambda function-invoking action. With the Lambda
  /// function-invoking action, this is referred to as the Lambda custom
  /// integration. With any other AWS service action, this is known as AWS
  /// integration.
  ///
  ///  AWS_PROXY: for integrating the route or method request with the Lambda
  /// function-invoking action with the client request passed through as-is.
  /// This integration is also referred to as Lambda proxy integration.
  ///
  ///  HTTP: for integrating the route or method request with an HTTP endpoint.
  /// This integration is also referred to as HTTP custom integration.
  ///
  ///  HTTP_PROXY: for integrating route or method request with an HTTP
  /// endpoint, with the client request passed through as-is. This is also
  /// referred to as HTTP proxy integration.
  ///
  ///  MOCK: for integrating the route or method request with API Gateway as a
  /// "loopback" endpoint without invoking any backend.
  ///
  /// [integrationUri]: For a Lambda proxy integration, this is the URI of the
  /// Lambda function.
  ///
  /// [passthroughBehavior]: Specifies the pass-through behavior for incoming
  /// requests based on the Content-Type header in the request, and the
  /// available mapping templates specified as the requestTemplates property on
  /// the Integration resource. There are three valid values: WHEN_NO_MATCH,
  /// WHEN_NO_TEMPLATES, and NEVER.
  ///
  ///  WHEN_NO_MATCH passes the request body for unmapped content types through
  /// to the integration backend without transformation.
  ///
  ///  NEVER rejects unmapped content types with an HTTP 415 Unsupported Media
  /// Type response.
  ///
  ///  WHEN_NO_TEMPLATES allows pass-through when the integration has no content
  /// types mapped to templates. However, if there is at least one content type
  /// defined, unmapped content types will be rejected with the same HTTP 415
  /// Unsupported Media Type response.
  ///
  /// [requestParameters]: A key-value map specifying request parameters that
  /// are passed from the method request to the backend. The key is an
  /// integration request parameter name and the associated value is a method
  /// request parameter value or static value that must be enclosed within
  /// single quotes and pre-encoded as required by the backend. The method
  /// request parameter value must match the pattern of
  /// method.request.{location}.{name} , where {location} is querystring, path,
  /// or header; and {name} must be a valid and unique method request parameter
  /// name.
  ///
  /// [requestTemplates]: Represents a map of Velocity templates that are
  /// applied on the request payload based on the value of the Content-Type
  /// header sent by the client. The content type value is the key in this map,
  /// and the template (as a String) is the value.
  ///
  /// [templateSelectionExpression]: The template selection expression for the
  /// integration.
  ///
  /// [timeoutInMillis]: Custom timeout between 50 and 29,000 milliseconds. The
  /// default value is 29,000 milliseconds or 29 seconds.
  Future<CreateIntegrationResponse> createIntegration(
      {@required String apiId,
      String connectionId,
      String connectionType,
      String contentHandlingStrategy,
      String credentialsArn,
      String description,
      String integrationMethod,
      @required String integrationType,
      String integrationUri,
      String passthroughBehavior,
      Map<String, String> requestParameters,
      Map<String, String> requestTemplates,
      String templateSelectionExpression,
      int timeoutInMillis}) async {
    var response_ = await _client.send('CreateIntegration', {
      'ApiId': apiId,
      if (connectionId != null) 'ConnectionId': connectionId,
      if (connectionType != null) 'ConnectionType': connectionType,
      if (contentHandlingStrategy != null)
        'ContentHandlingStrategy': contentHandlingStrategy,
      if (credentialsArn != null) 'CredentialsArn': credentialsArn,
      if (description != null) 'Description': description,
      if (integrationMethod != null) 'IntegrationMethod': integrationMethod,
      'IntegrationType': integrationType,
      if (integrationUri != null) 'IntegrationUri': integrationUri,
      if (passthroughBehavior != null)
        'PassthroughBehavior': passthroughBehavior,
      if (requestParameters != null) 'RequestParameters': requestParameters,
      if (requestTemplates != null) 'RequestTemplates': requestTemplates,
      if (templateSelectionExpression != null)
        'TemplateSelectionExpression': templateSelectionExpression,
      if (timeoutInMillis != null) 'TimeoutInMillis': timeoutInMillis,
    });
    return CreateIntegrationResponse.fromJson(response_);
  }

  /// Creates an IntegrationResponses.
  ///
  /// [apiId]: The API identifier.
  ///
  /// [contentHandlingStrategy]: Specifies how to handle response payload
  /// content type conversions. Supported values are CONVERT_TO_BINARY and
  /// CONVERT_TO_TEXT, with the following behaviors:
  ///
  ///  CONVERT_TO_BINARY: Converts a response payload from a Base64-encoded
  /// string to the corresponding binary blob.
  ///
  ///  CONVERT_TO_TEXT: Converts a response payload from a binary blob to a
  /// Base64-encoded string.
  ///
  /// If this property is not defined, the response payload will be passed
  /// through from the integration response to the route response or method
  /// response without modification.
  ///
  /// [integrationId]: The integration ID.
  ///
  /// [integrationResponseKey]: The integration response key.
  ///
  /// [responseParameters]: A key-value map specifying response parameters that
  /// are passed to the method response from the backend. The key is a method
  /// response header parameter name and the mapped value is an integration
  /// response header value, a static value enclosed within a pair of single
  /// quotes, or a JSON expression from the integration response body. The
  /// mapping key must match the pattern of method.response.header.{name}, where
  /// {name} is a valid and unique header name. The mapped non-static value must
  /// match the pattern of integration.response.header.{name} or
  /// integration.response.body.{JSON-expression}, where {name} is a valid and
  /// unique response header name and {JSON-expression} is a valid JSON
  /// expression without the $ prefix.
  ///
  /// [responseTemplates]: The collection of response templates for the
  /// integration response as a string-to-string map of key-value pairs.
  /// Response templates are represented as a key/value map, with a content-type
  /// as the key and a template as the value.
  ///
  /// [templateSelectionExpression]: The template selection expression for the
  /// integration response.
  Future<CreateIntegrationResponseResponse> createIntegrationResponse(
      {@required String apiId,
      String contentHandlingStrategy,
      @required String integrationId,
      @required String integrationResponseKey,
      Map<String, String> responseParameters,
      Map<String, String> responseTemplates,
      String templateSelectionExpression}) async {
    var response_ = await _client.send('CreateIntegrationResponse', {
      'ApiId': apiId,
      if (contentHandlingStrategy != null)
        'ContentHandlingStrategy': contentHandlingStrategy,
      'IntegrationId': integrationId,
      'IntegrationResponseKey': integrationResponseKey,
      if (responseParameters != null) 'ResponseParameters': responseParameters,
      if (responseTemplates != null) 'ResponseTemplates': responseTemplates,
      if (templateSelectionExpression != null)
        'TemplateSelectionExpression': templateSelectionExpression,
    });
    return CreateIntegrationResponseResponse.fromJson(response_);
  }

  /// Creates a Model for an API.
  ///
  /// [apiId]: The API identifier.
  ///
  /// [contentType]: The content-type for the model, for example,
  /// "application/json".
  ///
  /// [description]: The description of the model.
  ///
  /// [name]: The name of the model. Must be alphanumeric.
  ///
  /// [schema]: The schema for the model. For application/json models, this
  /// should be JSON schema draft 4 model.
  Future<CreateModelResponse> createModel(
      {@required String apiId,
      String contentType,
      String description,
      @required String name,
      @required String schema}) async {
    var response_ = await _client.send('CreateModel', {
      'ApiId': apiId,
      if (contentType != null) 'ContentType': contentType,
      if (description != null) 'Description': description,
      'Name': name,
      'Schema': schema,
    });
    return CreateModelResponse.fromJson(response_);
  }

  /// Creates a Route for an API.
  ///
  /// [apiId]: The API identifier.
  ///
  /// [apiKeyRequired]: Specifies whether an API key is required for the route.
  ///
  /// [authorizationScopes]: The authorization scopes supported by this route.
  ///
  /// [authorizationType]: The authorization type for the route. Valid values
  /// are NONE for open access, AWS_IAM for using AWS IAM permissions, and
  /// CUSTOM for using a Lambda authorizer.
  ///
  /// [authorizerId]: The identifier of the Authorizer resource to be associated
  /// with this route, if the authorizationType is CUSTOM . The authorizer
  /// identifier is generated by API Gateway when you created the authorizer.
  ///
  /// [modelSelectionExpression]: The model selection expression for the route.
  ///
  /// [operationName]: The operation name for the route.
  ///
  /// [requestModels]: The request models for the route.
  ///
  /// [requestParameters]: The request parameters for the route.
  ///
  /// [routeKey]: The route key for the route.
  ///
  /// [routeResponseSelectionExpression]: The route response selection
  /// expression for the route.
  ///
  /// [target]: The target for the route.
  Future<CreateRouteResponse> createRoute(
      {@required String apiId,
      bool apiKeyRequired,
      List<String> authorizationScopes,
      String authorizationType,
      String authorizerId,
      String modelSelectionExpression,
      String operationName,
      Map<String, String> requestModels,
      Map<String, ParameterConstraints> requestParameters,
      @required String routeKey,
      String routeResponseSelectionExpression,
      String target}) async {
    var response_ = await _client.send('CreateRoute', {
      'ApiId': apiId,
      if (apiKeyRequired != null) 'ApiKeyRequired': apiKeyRequired,
      if (authorizationScopes != null)
        'AuthorizationScopes': authorizationScopes,
      if (authorizationType != null) 'AuthorizationType': authorizationType,
      if (authorizerId != null) 'AuthorizerId': authorizerId,
      if (modelSelectionExpression != null)
        'ModelSelectionExpression': modelSelectionExpression,
      if (operationName != null) 'OperationName': operationName,
      if (requestModels != null) 'RequestModels': requestModels,
      if (requestParameters != null) 'RequestParameters': requestParameters,
      'RouteKey': routeKey,
      if (routeResponseSelectionExpression != null)
        'RouteResponseSelectionExpression': routeResponseSelectionExpression,
      if (target != null) 'Target': target,
    });
    return CreateRouteResponse.fromJson(response_);
  }

  /// Creates a RouteResponse for a Route.
  ///
  /// [apiId]: The API identifier.
  ///
  /// [modelSelectionExpression]: The model selection expression for the route
  /// response.
  ///
  /// [responseModels]: The response models for the route response.
  ///
  /// [responseParameters]: The route response parameters.
  ///
  /// [routeId]: The route ID.
  ///
  /// [routeResponseKey]: The route response key.
  Future<CreateRouteResponseResponse> createRouteResponse(
      {@required String apiId,
      String modelSelectionExpression,
      Map<String, String> responseModels,
      Map<String, ParameterConstraints> responseParameters,
      @required String routeId,
      @required String routeResponseKey}) async {
    var response_ = await _client.send('CreateRouteResponse', {
      'ApiId': apiId,
      if (modelSelectionExpression != null)
        'ModelSelectionExpression': modelSelectionExpression,
      if (responseModels != null) 'ResponseModels': responseModels,
      if (responseParameters != null) 'ResponseParameters': responseParameters,
      'RouteId': routeId,
      'RouteResponseKey': routeResponseKey,
    });
    return CreateRouteResponseResponse.fromJson(response_);
  }

  /// Creates a Stage for an API.
  ///
  /// [accessLogSettings]: Settings for logging access in this stage.
  ///
  /// [apiId]: The API identifier.
  ///
  /// [clientCertificateId]: The identifier of a client certificate for a Stage.
  ///
  /// [defaultRouteSettings]: The default route settings for the stage.
  ///
  /// [deploymentId]: The deployment identifier of the API stage.
  ///
  /// [description]: The description for the API stage.
  ///
  /// [routeSettings]: Route settings for the stage.
  ///
  /// [stageName]: The name of the stage.
  ///
  /// [stageVariables]: A map that defines the stage variables for a Stage.
  /// Variable names can have alphanumeric and underscore characters, and the
  /// values must match [A-Za-z0-9-._~:/?#&=,]+.
  ///
  /// [tags]: The key-value map of strings. The valid character set is
  /// [a-zA-Z+-=._:/]. The tag key can be up to 128 characters and must not
  /// start with aws:. The tag value can be up to 256 characters..
  Future<CreateStageResponse> createStage(
      {AccessLogSettings accessLogSettings,
      @required String apiId,
      String clientCertificateId,
      RouteSettings defaultRouteSettings,
      String deploymentId,
      String description,
      Map<String, RouteSettings> routeSettings,
      @required String stageName,
      Map<String, String> stageVariables,
      Map<String, String> tags}) async {
    var response_ = await _client.send('CreateStage', {
      if (accessLogSettings != null) 'AccessLogSettings': accessLogSettings,
      'ApiId': apiId,
      if (clientCertificateId != null)
        'ClientCertificateId': clientCertificateId,
      if (defaultRouteSettings != null)
        'DefaultRouteSettings': defaultRouteSettings,
      if (deploymentId != null) 'DeploymentId': deploymentId,
      if (description != null) 'Description': description,
      if (routeSettings != null) 'RouteSettings': routeSettings,
      'StageName': stageName,
      if (stageVariables != null) 'StageVariables': stageVariables,
      if (tags != null) 'Tags': tags,
    });
    return CreateStageResponse.fromJson(response_);
  }

  /// Deletes an Api resource.
  ///
  /// [apiId]: The API identifier.
  Future<void> deleteApi(String apiId) async {
    await _client.send('DeleteApi', {
      'ApiId': apiId,
    });
  }

  /// Deletes an API mapping.
  ///
  /// [apiMappingId]: The API mapping identifier.
  ///
  /// [domainName]: The domain name.
  Future<void> deleteApiMapping(
      {@required String apiMappingId, @required String domainName}) async {
    await _client.send('DeleteApiMapping', {
      'ApiMappingId': apiMappingId,
      'DomainName': domainName,
    });
  }

  /// Deletes an Authorizer.
  ///
  /// [apiId]: The API identifier.
  ///
  /// [authorizerId]: The authorizer identifier.
  Future<void> deleteAuthorizer(
      {@required String apiId, @required String authorizerId}) async {
    await _client.send('DeleteAuthorizer', {
      'ApiId': apiId,
      'AuthorizerId': authorizerId,
    });
  }

  /// Deletes a Deployment.
  ///
  /// [apiId]: The API identifier.
  ///
  /// [deploymentId]: The deployment ID.
  Future<void> deleteDeployment(
      {@required String apiId, @required String deploymentId}) async {
    await _client.send('DeleteDeployment', {
      'ApiId': apiId,
      'DeploymentId': deploymentId,
    });
  }

  /// Deletes a domain name.
  ///
  /// [domainName]: The domain name.
  Future<void> deleteDomainName(String domainName) async {
    await _client.send('DeleteDomainName', {
      'DomainName': domainName,
    });
  }

  /// Deletes an Integration.
  ///
  /// [apiId]: The API identifier.
  ///
  /// [integrationId]: The integration ID.
  Future<void> deleteIntegration(
      {@required String apiId, @required String integrationId}) async {
    await _client.send('DeleteIntegration', {
      'ApiId': apiId,
      'IntegrationId': integrationId,
    });
  }

  /// Deletes an IntegrationResponses.
  ///
  /// [apiId]: The API identifier.
  ///
  /// [integrationId]: The integration ID.
  ///
  /// [integrationResponseId]: The integration response ID.
  Future<void> deleteIntegrationResponse(
      {@required String apiId,
      @required String integrationId,
      @required String integrationResponseId}) async {
    await _client.send('DeleteIntegrationResponse', {
      'ApiId': apiId,
      'IntegrationId': integrationId,
      'IntegrationResponseId': integrationResponseId,
    });
  }

  /// Deletes a Model.
  ///
  /// [apiId]: The API identifier.
  ///
  /// [modelId]: The model ID.
  Future<void> deleteModel(
      {@required String apiId, @required String modelId}) async {
    await _client.send('DeleteModel', {
      'ApiId': apiId,
      'ModelId': modelId,
    });
  }

  /// Deletes a Route.
  ///
  /// [apiId]: The API identifier.
  ///
  /// [routeId]: The route ID.
  Future<void> deleteRoute(
      {@required String apiId, @required String routeId}) async {
    await _client.send('DeleteRoute', {
      'ApiId': apiId,
      'RouteId': routeId,
    });
  }

  /// Deletes a RouteResponse.
  ///
  /// [apiId]: The API identifier.
  ///
  /// [routeId]: The route ID.
  ///
  /// [routeResponseId]: The route response ID.
  Future<void> deleteRouteResponse(
      {@required String apiId,
      @required String routeId,
      @required String routeResponseId}) async {
    await _client.send('DeleteRouteResponse', {
      'ApiId': apiId,
      'RouteId': routeId,
      'RouteResponseId': routeResponseId,
    });
  }

  /// Deletes a Stage.
  ///
  /// [apiId]: The API identifier.
  ///
  /// [stageName]: The stage name.
  Future<void> deleteStage(
      {@required String apiId, @required String stageName}) async {
    await _client.send('DeleteStage', {
      'ApiId': apiId,
      'StageName': stageName,
    });
  }

  /// Gets an Api resource.
  ///
  /// [apiId]: The API identifier.
  Future<GetApiResponse> getApi(String apiId) async {
    var response_ = await _client.send('GetApi', {
      'ApiId': apiId,
    });
    return GetApiResponse.fromJson(response_);
  }

  /// The API mapping.
  ///
  /// [apiMappingId]: The API mapping identifier.
  ///
  /// [domainName]: The domain name.
  Future<GetApiMappingResponse> getApiMapping(
      {@required String apiMappingId, @required String domainName}) async {
    var response_ = await _client.send('GetApiMapping', {
      'ApiMappingId': apiMappingId,
      'DomainName': domainName,
    });
    return GetApiMappingResponse.fromJson(response_);
  }

  /// The API mappings.
  ///
  /// [domainName]: The domain name.
  ///
  /// [maxResults]: The maximum number of elements to be returned for this
  /// resource.
  ///
  /// [nextToken]: The next page of elements from this collection. Not valid for
  /// the last element of the collection.
  Future<GetApiMappingsResponse> getApiMappings(String domainName,
      {String maxResults, String nextToken}) async {
    var response_ = await _client.send('GetApiMappings', {
      'DomainName': domainName,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return GetApiMappingsResponse.fromJson(response_);
  }

  /// Gets a collection of Api resources.
  ///
  /// [maxResults]: The maximum number of elements to be returned for this
  /// resource.
  ///
  /// [nextToken]: The next page of elements from this collection. Not valid for
  /// the last element of the collection.
  Future<GetApisResponse> getApis({String maxResults, String nextToken}) async {
    var response_ = await _client.send('GetApis', {
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return GetApisResponse.fromJson(response_);
  }

  /// Gets an Authorizer.
  ///
  /// [apiId]: The API identifier.
  ///
  /// [authorizerId]: The authorizer identifier.
  Future<GetAuthorizerResponse> getAuthorizer(
      {@required String apiId, @required String authorizerId}) async {
    var response_ = await _client.send('GetAuthorizer', {
      'ApiId': apiId,
      'AuthorizerId': authorizerId,
    });
    return GetAuthorizerResponse.fromJson(response_);
  }

  /// Gets the Authorizers for an API.
  ///
  /// [apiId]: The API identifier.
  ///
  /// [maxResults]: The maximum number of elements to be returned for this
  /// resource.
  ///
  /// [nextToken]: The next page of elements from this collection. Not valid for
  /// the last element of the collection.
  Future<GetAuthorizersResponse> getAuthorizers(String apiId,
      {String maxResults, String nextToken}) async {
    var response_ = await _client.send('GetAuthorizers', {
      'ApiId': apiId,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return GetAuthorizersResponse.fromJson(response_);
  }

  /// Gets a Deployment.
  ///
  /// [apiId]: The API identifier.
  ///
  /// [deploymentId]: The deployment ID.
  Future<GetDeploymentResponse> getDeployment(
      {@required String apiId, @required String deploymentId}) async {
    var response_ = await _client.send('GetDeployment', {
      'ApiId': apiId,
      'DeploymentId': deploymentId,
    });
    return GetDeploymentResponse.fromJson(response_);
  }

  /// Gets the Deployments for an API.
  ///
  /// [apiId]: The API identifier.
  ///
  /// [maxResults]: The maximum number of elements to be returned for this
  /// resource.
  ///
  /// [nextToken]: The next page of elements from this collection. Not valid for
  /// the last element of the collection.
  Future<GetDeploymentsResponse> getDeployments(String apiId,
      {String maxResults, String nextToken}) async {
    var response_ = await _client.send('GetDeployments', {
      'ApiId': apiId,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return GetDeploymentsResponse.fromJson(response_);
  }

  /// Gets a domain name.
  ///
  /// [domainName]: The domain name.
  Future<GetDomainNameResponse> getDomainName(String domainName) async {
    var response_ = await _client.send('GetDomainName', {
      'DomainName': domainName,
    });
    return GetDomainNameResponse.fromJson(response_);
  }

  /// Gets the domain names for an AWS account.
  ///
  /// [maxResults]: The maximum number of elements to be returned for this
  /// resource.
  ///
  /// [nextToken]: The next page of elements from this collection. Not valid for
  /// the last element of the collection.
  Future<GetDomainNamesResponse> getDomainNames(
      {String maxResults, String nextToken}) async {
    var response_ = await _client.send('GetDomainNames', {
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return GetDomainNamesResponse.fromJson(response_);
  }

  /// Gets an Integration.
  ///
  /// [apiId]: The API identifier.
  ///
  /// [integrationId]: The integration ID.
  Future<GetIntegrationResponse> getIntegration(
      {@required String apiId, @required String integrationId}) async {
    var response_ = await _client.send('GetIntegration', {
      'ApiId': apiId,
      'IntegrationId': integrationId,
    });
    return GetIntegrationResponse.fromJson(response_);
  }

  /// Gets an IntegrationResponses.
  ///
  /// [apiId]: The API identifier.
  ///
  /// [integrationId]: The integration ID.
  ///
  /// [integrationResponseId]: The integration response ID.
  Future<GetIntegrationResponseResponse> getIntegrationResponse(
      {@required String apiId,
      @required String integrationId,
      @required String integrationResponseId}) async {
    var response_ = await _client.send('GetIntegrationResponse', {
      'ApiId': apiId,
      'IntegrationId': integrationId,
      'IntegrationResponseId': integrationResponseId,
    });
    return GetIntegrationResponseResponse.fromJson(response_);
  }

  /// Gets the IntegrationResponses for an Integration.
  ///
  /// [apiId]: The API identifier.
  ///
  /// [integrationId]: The integration ID.
  ///
  /// [maxResults]: The maximum number of elements to be returned for this
  /// resource.
  ///
  /// [nextToken]: The next page of elements from this collection. Not valid for
  /// the last element of the collection.
  Future<GetIntegrationResponsesResponse> getIntegrationResponses(
      {@required String apiId,
      @required String integrationId,
      String maxResults,
      String nextToken}) async {
    var response_ = await _client.send('GetIntegrationResponses', {
      'ApiId': apiId,
      'IntegrationId': integrationId,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return GetIntegrationResponsesResponse.fromJson(response_);
  }

  /// Gets the Integrations for an API.
  ///
  /// [apiId]: The API identifier.
  ///
  /// [maxResults]: The maximum number of elements to be returned for this
  /// resource.
  ///
  /// [nextToken]: The next page of elements from this collection. Not valid for
  /// the last element of the collection.
  Future<GetIntegrationsResponse> getIntegrations(String apiId,
      {String maxResults, String nextToken}) async {
    var response_ = await _client.send('GetIntegrations', {
      'ApiId': apiId,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return GetIntegrationsResponse.fromJson(response_);
  }

  /// Gets a Model.
  ///
  /// [apiId]: The API identifier.
  ///
  /// [modelId]: The model ID.
  Future<GetModelResponse> getModel(
      {@required String apiId, @required String modelId}) async {
    var response_ = await _client.send('GetModel', {
      'ApiId': apiId,
      'ModelId': modelId,
    });
    return GetModelResponse.fromJson(response_);
  }

  /// Gets a model template.
  ///
  /// [apiId]: The API identifier.
  ///
  /// [modelId]: The model ID.
  Future<GetModelTemplateResponse> getModelTemplate(
      {@required String apiId, @required String modelId}) async {
    var response_ = await _client.send('GetModelTemplate', {
      'ApiId': apiId,
      'ModelId': modelId,
    });
    return GetModelTemplateResponse.fromJson(response_);
  }

  /// Gets the Models for an API.
  ///
  /// [apiId]: The API identifier.
  ///
  /// [maxResults]: The maximum number of elements to be returned for this
  /// resource.
  ///
  /// [nextToken]: The next page of elements from this collection. Not valid for
  /// the last element of the collection.
  Future<GetModelsResponse> getModels(String apiId,
      {String maxResults, String nextToken}) async {
    var response_ = await _client.send('GetModels', {
      'ApiId': apiId,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return GetModelsResponse.fromJson(response_);
  }

  /// Gets a Route.
  ///
  /// [apiId]: The API identifier.
  ///
  /// [routeId]: The route ID.
  Future<GetRouteResponse> getRoute(
      {@required String apiId, @required String routeId}) async {
    var response_ = await _client.send('GetRoute', {
      'ApiId': apiId,
      'RouteId': routeId,
    });
    return GetRouteResponse.fromJson(response_);
  }

  /// Gets a RouteResponse.
  ///
  /// [apiId]: The API identifier.
  ///
  /// [routeId]: The route ID.
  ///
  /// [routeResponseId]: The route response ID.
  Future<GetRouteResponseResponse> getRouteResponse(
      {@required String apiId,
      @required String routeId,
      @required String routeResponseId}) async {
    var response_ = await _client.send('GetRouteResponse', {
      'ApiId': apiId,
      'RouteId': routeId,
      'RouteResponseId': routeResponseId,
    });
    return GetRouteResponseResponse.fromJson(response_);
  }

  /// Gets the RouteResponses for a Route.
  ///
  /// [apiId]: The API identifier.
  ///
  /// [maxResults]: The maximum number of elements to be returned for this
  /// resource.
  ///
  /// [nextToken]: The next page of elements from this collection. Not valid for
  /// the last element of the collection.
  ///
  /// [routeId]: The route ID.
  Future<GetRouteResponsesResponse> getRouteResponses(
      {@required String apiId,
      String maxResults,
      String nextToken,
      @required String routeId}) async {
    var response_ = await _client.send('GetRouteResponses', {
      'ApiId': apiId,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      'RouteId': routeId,
    });
    return GetRouteResponsesResponse.fromJson(response_);
  }

  /// Gets the Routes for an API.
  ///
  /// [apiId]: The API identifier.
  ///
  /// [maxResults]: The maximum number of elements to be returned for this
  /// resource.
  ///
  /// [nextToken]: The next page of elements from this collection. Not valid for
  /// the last element of the collection.
  Future<GetRoutesResponse> getRoutes(String apiId,
      {String maxResults, String nextToken}) async {
    var response_ = await _client.send('GetRoutes', {
      'ApiId': apiId,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return GetRoutesResponse.fromJson(response_);
  }

  /// Gets a Stage.
  ///
  /// [apiId]: The API identifier.
  ///
  /// [stageName]: The stage name.
  Future<GetStageResponse> getStage(
      {@required String apiId, @required String stageName}) async {
    var response_ = await _client.send('GetStage', {
      'ApiId': apiId,
      'StageName': stageName,
    });
    return GetStageResponse.fromJson(response_);
  }

  /// Gets the Stages for an API.
  ///
  /// [apiId]: The API identifier.
  ///
  /// [maxResults]: The maximum number of elements to be returned for this
  /// resource.
  ///
  /// [nextToken]: The next page of elements from this collection. Not valid for
  /// the last element of the collection.
  Future<GetStagesResponse> getStages(String apiId,
      {String maxResults, String nextToken}) async {
    var response_ = await _client.send('GetStages', {
      'ApiId': apiId,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return GetStagesResponse.fromJson(response_);
  }

  /// Gets the Tags for an API.
  Future<GetTagsResponse> getTags(String resourceArn) async {
    var response_ = await _client.send('GetTags', {
      'ResourceArn': resourceArn,
    });
    return GetTagsResponse.fromJson(response_);
  }

  /// Tag an APIGW resource
  ///
  /// [resourceArn]: AWS resource arn
  ///
  /// [tags]: The key-value map of strings. The valid character set is
  /// [a-zA-Z+-=._:/]. The tag key can be up to 128 characters and must not
  /// start with aws:. The tag value can be up to 256 characters..
  Future<TagResourceResponse> tagResource(String resourceArn,
      {Map<String, String> tags}) async {
    var response_ = await _client.send('TagResource', {
      'ResourceArn': resourceArn,
      if (tags != null) 'Tags': tags,
    });
    return TagResourceResponse.fromJson(response_);
  }

  /// Untag an APIGW resource
  ///
  /// [resourceArn]: AWS resource arn
  ///
  /// [tagKeys]: The Tag keys to delete
  Future<void> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {
    await _client.send('UntagResource', {
      'ResourceArn': resourceArn,
      'TagKeys': tagKeys,
    });
  }

  /// Updates an Api resource.
  ///
  /// [apiId]: The API identifier.
  ///
  /// [apiKeySelectionExpression]: An API key selection expression. See
  /// [API Key Selection Expressions](https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-websocket-api-selection-expressions.html#apigateway-websocket-api-apikey-selection-expressions).
  ///
  /// [description]: The description of the API.
  ///
  /// [disableSchemaValidation]: Avoid validating models when creating a
  /// deployment.
  ///
  /// [name]: The name of the API.
  ///
  /// [routeSelectionExpression]: The route selection expression for the API.
  ///
  /// [version]: A version identifier for the API.
  Future<UpdateApiResponse> updateApi(String apiId,
      {String apiKeySelectionExpression,
      String description,
      bool disableSchemaValidation,
      String name,
      String routeSelectionExpression,
      String version}) async {
    var response_ = await _client.send('UpdateApi', {
      'ApiId': apiId,
      if (apiKeySelectionExpression != null)
        'ApiKeySelectionExpression': apiKeySelectionExpression,
      if (description != null) 'Description': description,
      if (disableSchemaValidation != null)
        'DisableSchemaValidation': disableSchemaValidation,
      if (name != null) 'Name': name,
      if (routeSelectionExpression != null)
        'RouteSelectionExpression': routeSelectionExpression,
      if (version != null) 'Version': version,
    });
    return UpdateApiResponse.fromJson(response_);
  }

  /// The API mapping.
  ///
  /// [apiId]: The API identifier.
  ///
  /// [apiMappingId]: The API mapping identifier.
  ///
  /// [apiMappingKey]: The API mapping key.
  ///
  /// [domainName]: The domain name.
  ///
  /// [stage]: The API stage.
  Future<UpdateApiMappingResponse> updateApiMapping(
      {@required String apiId,
      @required String apiMappingId,
      String apiMappingKey,
      @required String domainName,
      String stage}) async {
    var response_ = await _client.send('UpdateApiMapping', {
      'ApiId': apiId,
      'ApiMappingId': apiMappingId,
      if (apiMappingKey != null) 'ApiMappingKey': apiMappingKey,
      'DomainName': domainName,
      if (stage != null) 'Stage': stage,
    });
    return UpdateApiMappingResponse.fromJson(response_);
  }

  /// Updates an Authorizer.
  ///
  /// [apiId]: The API identifier.
  ///
  /// [authorizerCredentialsArn]: Specifies the required credentials as an IAM
  /// role for API Gateway to invoke the authorizer. To specify an IAM role for
  /// API Gateway to assume, use the role's Amazon Resource Name (ARN). To use
  /// resource-based permissions on the Lambda function, specify null.
  ///
  /// [authorizerId]: The authorizer identifier.
  ///
  /// [authorizerResultTtlInSeconds]: The time to live (TTL), in seconds, of
  /// cached authorizer results. If it is zero, authorization caching is
  /// disabled. If it is greater than zero, API Gateway will cache authorizer
  /// responses. If this field is not set, the default value is 300. The maximum
  /// value is 3600, or 1 hour.
  ///
  /// [authorizerType]: The authorizer type. Currently the only valid value is
  /// REQUEST, for a Lambda function using incoming request parameters.
  ///
  /// [authorizerUri]: The authorizer's Uniform Resource Identifier (URI). For
  /// REQUEST authorizers, this must be a well-formed Lambda function URI, for
  /// example,
  /// arn:aws:apigateway:us-west-2:lambda:path/2015-03-31/functions/arn:aws:lambda:us-west-2:{account_id}:function:{lambda_function_name}/invocations.
  /// In general, the URI has this form:
  /// arn:aws:apigateway:{region}:lambda:path/{service_api} , where {region} is
  /// the same as the region hosting the Lambda function, path indicates that
  /// the remaining substring in the URI should be treated as the path to the
  /// resource, including the initial /. For Lambda functions, this is usually
  /// of the form /2015-03-31/functions/[FunctionARN]/invocations.
  ///
  /// [identitySource]: The identity source for which authorization is
  /// requested.
  ///
  /// For the REQUEST authorizer, this is required when authorization caching is
  /// enabled. The value is a comma-separated string of one or more mapping
  /// expressions of the specified request parameters. For example, if an Auth
  /// header, a Name query string parameter are defined as identity sources,
  /// this value is $method.request.header.Auth,
  /// $method.request.querystring.Name. These parameters will be used to derive
  /// the authorization caching key and to perform runtime validation of the
  /// REQUEST authorizer by verifying all of the identity-related request
  /// parameters are present, not null and non-empty. Only when this is true
  /// does the authorizer invoke the authorizer Lambda function, otherwise, it
  /// returns a 401 Unauthorized response without calling the Lambda function.
  /// The valid value is a string of comma-separated mapping expressions of the
  /// specified request parameters. When the authorization caching is not
  /// enabled, this property is optional.
  ///
  /// [identityValidationExpression]: The validation expression does not apply
  /// to the REQUEST authorizer.
  ///
  /// [name]: The name of the authorizer.
  ///
  /// [providerArns]: For REQUEST authorizer, this is not defined.
  Future<UpdateAuthorizerResponse> updateAuthorizer(
      {@required String apiId,
      String authorizerCredentialsArn,
      @required String authorizerId,
      int authorizerResultTtlInSeconds,
      String authorizerType,
      String authorizerUri,
      List<String> identitySource,
      String identityValidationExpression,
      String name,
      List<String> providerArns}) async {
    var response_ = await _client.send('UpdateAuthorizer', {
      'ApiId': apiId,
      if (authorizerCredentialsArn != null)
        'AuthorizerCredentialsArn': authorizerCredentialsArn,
      'AuthorizerId': authorizerId,
      if (authorizerResultTtlInSeconds != null)
        'AuthorizerResultTtlInSeconds': authorizerResultTtlInSeconds,
      if (authorizerType != null) 'AuthorizerType': authorizerType,
      if (authorizerUri != null) 'AuthorizerUri': authorizerUri,
      if (identitySource != null) 'IdentitySource': identitySource,
      if (identityValidationExpression != null)
        'IdentityValidationExpression': identityValidationExpression,
      if (name != null) 'Name': name,
      if (providerArns != null) 'ProviderArns': providerArns,
    });
    return UpdateAuthorizerResponse.fromJson(response_);
  }

  /// Updates a Deployment.
  ///
  /// [apiId]: The API identifier.
  ///
  /// [deploymentId]: The deployment ID.
  ///
  /// [description]: The description for the deployment resource.
  Future<UpdateDeploymentResponse> updateDeployment(
      {@required String apiId,
      @required String deploymentId,
      String description}) async {
    var response_ = await _client.send('UpdateDeployment', {
      'ApiId': apiId,
      'DeploymentId': deploymentId,
      if (description != null) 'Description': description,
    });
    return UpdateDeploymentResponse.fromJson(response_);
  }

  /// Updates a domain name.
  ///
  /// [domainName]: The domain name.
  ///
  /// [domainNameConfigurations]: The domain name configurations.
  Future<UpdateDomainNameResponse> updateDomainName(String domainName,
      {List<DomainNameConfiguration> domainNameConfigurations}) async {
    var response_ = await _client.send('UpdateDomainName', {
      'DomainName': domainName,
      if (domainNameConfigurations != null)
        'DomainNameConfigurations': domainNameConfigurations,
    });
    return UpdateDomainNameResponse.fromJson(response_);
  }

  /// Updates an Integration.
  ///
  /// [apiId]: The API identifier.
  ///
  /// [connectionId]: The connection ID.
  ///
  /// [connectionType]: The type of the network connection to the integration
  /// endpoint. Currently the only valid value is INTERNET, for connections
  /// through the public routable internet.
  ///
  /// [contentHandlingStrategy]: Specifies how to handle response payload
  /// content type conversions. Supported values are CONVERT_TO_BINARY and
  /// CONVERT_TO_TEXT, with the following behaviors:
  ///
  ///  CONVERT_TO_BINARY: Converts a response payload from a Base64-encoded
  /// string to the corresponding binary blob.
  ///
  ///  CONVERT_TO_TEXT: Converts a response payload from a binary blob to a
  /// Base64-encoded string.
  ///
  /// If this property is not defined, the response payload will be passed
  /// through from the integration response to the route response or method
  /// response without modification.
  ///
  /// [credentialsArn]: Specifies the credentials required for the integration,
  /// if any. For AWS integrations, three options are available. To specify an
  /// IAM Role for API Gateway to assume, use the role's Amazon Resource Name
  /// (ARN). To require that the caller's identity be passed through from the
  /// request, specify the string arn:aws:iam::*:user/*. To use resource-based
  /// permissions on supported AWS services, specify null.
  ///
  /// [description]: The description of the integration
  ///
  /// [integrationId]: The integration ID.
  ///
  /// [integrationMethod]: Specifies the integration's HTTP method type.
  ///
  /// [integrationType]: The integration type of an integration. One of the
  /// following:
  ///
  ///  AWS: for integrating the route or method request with an AWS service
  /// action, including the Lambda function-invoking action. With the Lambda
  /// function-invoking action, this is referred to as the Lambda custom
  /// integration. With any other AWS service action, this is known as AWS
  /// integration.
  ///
  ///  AWS_PROXY: for integrating the route or method request with the Lambda
  /// function-invoking action with the client request passed through as-is.
  /// This integration is also referred to as Lambda proxy integration.
  ///
  ///  HTTP: for integrating the route or method request with an HTTP endpoint.
  /// This integration is also referred to as the HTTP custom integration.
  ///
  ///  HTTP_PROXY: for integrating route or method request with an HTTP
  /// endpoint, with the client request passed through as-is. This is also
  /// referred to as HTTP proxy integration.
  ///
  ///  MOCK: for integrating the route or method request with API Gateway as a
  /// "loopback" endpoint without invoking any backend.
  ///
  /// [integrationUri]: For a Lambda proxy integration, this is the URI of the
  /// Lambda function.
  ///
  /// [passthroughBehavior]: Specifies the pass-through behavior for incoming
  /// requests based on the Content-Type header in the request, and the
  /// available mapping templates specified as the requestTemplates property on
  /// the Integration resource. There are three valid values: WHEN_NO_MATCH,
  /// WHEN_NO_TEMPLATES, and NEVER.
  ///
  ///  WHEN_NO_MATCH passes the request body for unmapped content types through
  /// to the integration backend without transformation.
  ///
  ///  NEVER rejects unmapped content types with an HTTP 415 Unsupported Media
  /// Type response.
  ///
  ///  WHEN_NO_TEMPLATES allows pass-through when the integration has no content
  /// types mapped to templates. However, if there is at least one content type
  /// defined, unmapped content types will be rejected with the same HTTP 415
  /// Unsupported Media Type response.
  ///
  /// [requestParameters]: A key-value map specifying request parameters that
  /// are passed from the method request to the backend. The key is an
  /// integration request parameter name and the associated value is a method
  /// request parameter value or static value that must be enclosed within
  /// single quotes and pre-encoded as required by the backend. The method
  /// request parameter value must match the pattern of
  /// method.request.{location}.{name} , where {location} is querystring, path,
  /// or header; and {name} must be a valid and unique method request parameter
  /// name.
  ///
  /// [requestTemplates]: Represents a map of Velocity templates that are
  /// applied on the request payload based on the value of the Content-Type
  /// header sent by the client. The content type value is the key in this map,
  /// and the template (as a String) is the value.
  ///
  /// [templateSelectionExpression]: The template selection expression for the
  /// integration.
  ///
  /// [timeoutInMillis]: Custom timeout between 50 and 29,000 milliseconds. The
  /// default value is 29,000 milliseconds or 29 seconds.
  Future<UpdateIntegrationResponse> updateIntegration(
      {@required String apiId,
      String connectionId,
      String connectionType,
      String contentHandlingStrategy,
      String credentialsArn,
      String description,
      @required String integrationId,
      String integrationMethod,
      String integrationType,
      String integrationUri,
      String passthroughBehavior,
      Map<String, String> requestParameters,
      Map<String, String> requestTemplates,
      String templateSelectionExpression,
      int timeoutInMillis}) async {
    var response_ = await _client.send('UpdateIntegration', {
      'ApiId': apiId,
      if (connectionId != null) 'ConnectionId': connectionId,
      if (connectionType != null) 'ConnectionType': connectionType,
      if (contentHandlingStrategy != null)
        'ContentHandlingStrategy': contentHandlingStrategy,
      if (credentialsArn != null) 'CredentialsArn': credentialsArn,
      if (description != null) 'Description': description,
      'IntegrationId': integrationId,
      if (integrationMethod != null) 'IntegrationMethod': integrationMethod,
      if (integrationType != null) 'IntegrationType': integrationType,
      if (integrationUri != null) 'IntegrationUri': integrationUri,
      if (passthroughBehavior != null)
        'PassthroughBehavior': passthroughBehavior,
      if (requestParameters != null) 'RequestParameters': requestParameters,
      if (requestTemplates != null) 'RequestTemplates': requestTemplates,
      if (templateSelectionExpression != null)
        'TemplateSelectionExpression': templateSelectionExpression,
      if (timeoutInMillis != null) 'TimeoutInMillis': timeoutInMillis,
    });
    return UpdateIntegrationResponse.fromJson(response_);
  }

  /// Updates an IntegrationResponses.
  ///
  /// [apiId]: The API identifier.
  ///
  /// [contentHandlingStrategy]: Specifies how to handle response payload
  /// content type conversions. Supported values are CONVERT_TO_BINARY and
  /// CONVERT_TO_TEXT, with the following behaviors:
  ///
  ///  CONVERT_TO_BINARY: Converts a response payload from a Base64-encoded
  /// string to the corresponding binary blob.
  ///
  ///  CONVERT_TO_TEXT: Converts a response payload from a binary blob to a
  /// Base64-encoded string.
  ///
  /// If this property is not defined, the response payload will be passed
  /// through from the integration response to the route response or method
  /// response without modification.
  ///
  /// [integrationId]: The integration ID.
  ///
  /// [integrationResponseId]: The integration response ID.
  ///
  /// [integrationResponseKey]: The integration response key.
  ///
  /// [responseParameters]: A key-value map specifying response parameters that
  /// are passed to the method response from the backend. The key is a method
  /// response header parameter name and the mapped value is an integration
  /// response header value, a static value enclosed within a pair of single
  /// quotes, or a JSON expression from the integration response body. The
  /// mapping key must match the pattern of method.response.header.{name} ,
  /// where name is a valid and unique header name. The mapped non-static value
  /// must match the pattern of integration.response.header.{name} or
  /// integration.response.body.{JSON-expression} , where {name} is a valid and
  /// unique response header name and {JSON-expression} is a valid JSON
  /// expression without the $ prefix.
  ///
  /// [responseTemplates]: The collection of response templates for the
  /// integration response as a string-to-string map of key-value pairs.
  /// Response templates are represented as a key/value map, with a content-type
  /// as the key and a template as the value.
  ///
  /// [templateSelectionExpression]: The template selection expression for the
  /// integration response.
  Future<UpdateIntegrationResponseResponse> updateIntegrationResponse(
      {@required String apiId,
      String contentHandlingStrategy,
      @required String integrationId,
      @required String integrationResponseId,
      String integrationResponseKey,
      Map<String, String> responseParameters,
      Map<String, String> responseTemplates,
      String templateSelectionExpression}) async {
    var response_ = await _client.send('UpdateIntegrationResponse', {
      'ApiId': apiId,
      if (contentHandlingStrategy != null)
        'ContentHandlingStrategy': contentHandlingStrategy,
      'IntegrationId': integrationId,
      'IntegrationResponseId': integrationResponseId,
      if (integrationResponseKey != null)
        'IntegrationResponseKey': integrationResponseKey,
      if (responseParameters != null) 'ResponseParameters': responseParameters,
      if (responseTemplates != null) 'ResponseTemplates': responseTemplates,
      if (templateSelectionExpression != null)
        'TemplateSelectionExpression': templateSelectionExpression,
    });
    return UpdateIntegrationResponseResponse.fromJson(response_);
  }

  /// Updates a Model.
  ///
  /// [apiId]: The API identifier.
  ///
  /// [contentType]: The content-type for the model, for example,
  /// "application/json".
  ///
  /// [description]: The description of the model.
  ///
  /// [modelId]: The model ID.
  ///
  /// [name]: The name of the model.
  ///
  /// [schema]: The schema for the model. For application/json models, this
  /// should be JSON schema draft 4 model.
  Future<UpdateModelResponse> updateModel(
      {@required String apiId,
      String contentType,
      String description,
      @required String modelId,
      String name,
      String schema}) async {
    var response_ = await _client.send('UpdateModel', {
      'ApiId': apiId,
      if (contentType != null) 'ContentType': contentType,
      if (description != null) 'Description': description,
      'ModelId': modelId,
      if (name != null) 'Name': name,
      if (schema != null) 'Schema': schema,
    });
    return UpdateModelResponse.fromJson(response_);
  }

  /// Updates a Route.
  ///
  /// [apiId]: The API identifier.
  ///
  /// [apiKeyRequired]: Specifies whether an API key is required for the route.
  ///
  /// [authorizationScopes]: The authorization scopes supported by this route.
  ///
  /// [authorizationType]: The authorization type for the route. Valid values
  /// are NONE for open access, AWS_IAM for using AWS IAM permissions, and
  /// CUSTOM for using a Lambda authorizer.
  ///
  /// [authorizerId]: The identifier of the Authorizer resource to be associated
  /// with this route, if the authorizationType is CUSTOM . The authorizer
  /// identifier is generated by API Gateway when you created the authorizer.
  ///
  /// [modelSelectionExpression]: The model selection expression for the route.
  ///
  /// [operationName]: The operation name for the route.
  ///
  /// [requestModels]: The request models for the route.
  ///
  /// [requestParameters]: The request parameters for the route.
  ///
  /// [routeId]: The route ID.
  ///
  /// [routeKey]: The route key for the route.
  ///
  /// [routeResponseSelectionExpression]: The route response selection
  /// expression for the route.
  ///
  /// [target]: The target for the route.
  Future<UpdateRouteResponse> updateRoute(
      {@required String apiId,
      bool apiKeyRequired,
      List<String> authorizationScopes,
      String authorizationType,
      String authorizerId,
      String modelSelectionExpression,
      String operationName,
      Map<String, String> requestModels,
      Map<String, ParameterConstraints> requestParameters,
      @required String routeId,
      String routeKey,
      String routeResponseSelectionExpression,
      String target}) async {
    var response_ = await _client.send('UpdateRoute', {
      'ApiId': apiId,
      if (apiKeyRequired != null) 'ApiKeyRequired': apiKeyRequired,
      if (authorizationScopes != null)
        'AuthorizationScopes': authorizationScopes,
      if (authorizationType != null) 'AuthorizationType': authorizationType,
      if (authorizerId != null) 'AuthorizerId': authorizerId,
      if (modelSelectionExpression != null)
        'ModelSelectionExpression': modelSelectionExpression,
      if (operationName != null) 'OperationName': operationName,
      if (requestModels != null) 'RequestModels': requestModels,
      if (requestParameters != null) 'RequestParameters': requestParameters,
      'RouteId': routeId,
      if (routeKey != null) 'RouteKey': routeKey,
      if (routeResponseSelectionExpression != null)
        'RouteResponseSelectionExpression': routeResponseSelectionExpression,
      if (target != null) 'Target': target,
    });
    return UpdateRouteResponse.fromJson(response_);
  }

  /// Updates a RouteResponse.
  ///
  /// [apiId]: The API identifier.
  ///
  /// [modelSelectionExpression]: The model selection expression for the route
  /// response.
  ///
  /// [responseModels]: The response models for the route response.
  ///
  /// [responseParameters]: The route response parameters.
  ///
  /// [routeId]: The route ID.
  ///
  /// [routeResponseId]: The route response ID.
  ///
  /// [routeResponseKey]: The route response key.
  Future<UpdateRouteResponseResponse> updateRouteResponse(
      {@required String apiId,
      String modelSelectionExpression,
      Map<String, String> responseModels,
      Map<String, ParameterConstraints> responseParameters,
      @required String routeId,
      @required String routeResponseId,
      String routeResponseKey}) async {
    var response_ = await _client.send('UpdateRouteResponse', {
      'ApiId': apiId,
      if (modelSelectionExpression != null)
        'ModelSelectionExpression': modelSelectionExpression,
      if (responseModels != null) 'ResponseModels': responseModels,
      if (responseParameters != null) 'ResponseParameters': responseParameters,
      'RouteId': routeId,
      'RouteResponseId': routeResponseId,
      if (routeResponseKey != null) 'RouteResponseKey': routeResponseKey,
    });
    return UpdateRouteResponseResponse.fromJson(response_);
  }

  /// Updates a Stage.
  ///
  /// [accessLogSettings]: Settings for logging access in this stage.
  ///
  /// [apiId]: The API identifier.
  ///
  /// [clientCertificateId]: The identifier of a client certificate for a Stage.
  ///
  /// [defaultRouteSettings]: The default route settings for the stage.
  ///
  /// [deploymentId]: The deployment identifier for the API stage.
  ///
  /// [description]: The description for the API stage.
  ///
  /// [routeSettings]: Route settings for the stage.
  ///
  /// [stageName]: The stage name.
  ///
  /// [stageVariables]: A map that defines the stage variables for a Stage.
  /// Variable names can have alphanumeric and underscore characters, and the
  /// values must match [A-Za-z0-9-._~:/?#&=,]+.
  Future<UpdateStageResponse> updateStage(
      {AccessLogSettings accessLogSettings,
      @required String apiId,
      String clientCertificateId,
      RouteSettings defaultRouteSettings,
      String deploymentId,
      String description,
      Map<String, RouteSettings> routeSettings,
      @required String stageName,
      Map<String, String> stageVariables}) async {
    var response_ = await _client.send('UpdateStage', {
      if (accessLogSettings != null) 'AccessLogSettings': accessLogSettings,
      'ApiId': apiId,
      if (clientCertificateId != null)
        'ClientCertificateId': clientCertificateId,
      if (defaultRouteSettings != null)
        'DefaultRouteSettings': defaultRouteSettings,
      if (deploymentId != null) 'DeploymentId': deploymentId,
      if (description != null) 'Description': description,
      if (routeSettings != null) 'RouteSettings': routeSettings,
      'StageName': stageName,
      if (stageVariables != null) 'StageVariables': stageVariables,
    });
    return UpdateStageResponse.fromJson(response_);
  }
}

/// Settings for logging access in a stage.
class AccessLogSettings {
  /// The ARN of the CloudWatch Logs log group to receive access logs.
  final String destinationArn;

  /// A single line format of the access logs of data, as specified by selected
  /// $context variables. The format must include at least $context.requestId.
  final String format;

  AccessLogSettings({
    this.destinationArn,
    this.format,
  });
  static AccessLogSettings fromJson(Map<String, dynamic> json) =>
      AccessLogSettings(
        destinationArn: json.containsKey('DestinationArn')
            ? json['DestinationArn'] as String
            : null,
        format: json.containsKey('Format') ? json['Format'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Represents an API.
class Api {
  /// The URI of the API, of the form
  /// {api-id}.execute-api.{region}.amazonaws.com. The stage name is typically
  /// appended to this URI to form a complete path to a deployed API stage.
  final String apiEndpoint;

  /// The API ID.
  final String apiId;

  /// An API key selection expression. See
  /// [API Key Selection Expressions](https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-websocket-api-selection-expressions.html#apigateway-websocket-api-apikey-selection-expressions).
  final String apiKeySelectionExpression;

  /// The timestamp when the API was created.
  final DateTime createdDate;

  /// The description of the API.
  final String description;

  /// Avoid validating models when creating a deployment.
  final bool disableSchemaValidation;

  /// The name of the API.
  final String name;

  /// The API protocol: Currently only WEBSOCKET is supported.
  final String protocolType;

  /// The route selection expression for the API.
  final String routeSelectionExpression;

  /// A version identifier for the API.
  final String version;

  /// The warning messages reported when failonwarnings is turned on during API
  /// import.
  final List<String> warnings;

  /// The key-value map of strings. The valid character set is [a-zA-Z+-=._:/].
  /// The tag key can be up to 128 characters and must not start with aws:. The
  /// tag value can be up to 256 characters..
  final Map<String, String> tags;

  Api({
    this.apiEndpoint,
    this.apiId,
    this.apiKeySelectionExpression,
    this.createdDate,
    this.description,
    this.disableSchemaValidation,
    @required this.name,
    @required this.protocolType,
    @required this.routeSelectionExpression,
    this.version,
    this.warnings,
    this.tags,
  });
  static Api fromJson(Map<String, dynamic> json) => Api(
        apiEndpoint: json.containsKey('ApiEndpoint')
            ? json['ApiEndpoint'] as String
            : null,
        apiId: json.containsKey('ApiId') ? json['ApiId'] as String : null,
        apiKeySelectionExpression: json.containsKey('ApiKeySelectionExpression')
            ? json['ApiKeySelectionExpression'] as String
            : null,
        createdDate: json.containsKey('CreatedDate')
            ? DateTime.parse(json['CreatedDate'])
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        disableSchemaValidation: json.containsKey('DisableSchemaValidation')
            ? json['DisableSchemaValidation'] as bool
            : null,
        name: json['Name'] as String,
        protocolType: json['ProtocolType'] as String,
        routeSelectionExpression: json['RouteSelectionExpression'] as String,
        version: json.containsKey('Version') ? json['Version'] as String : null,
        warnings: json.containsKey('Warnings')
            ? (json['Warnings'] as List).map((e) => e as String).toList()
            : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

/// Represents an API mapping.
class ApiMapping {
  /// The API identifier.
  final String apiId;

  /// The API mapping identifier.
  final String apiMappingId;

  /// The API mapping key.
  final String apiMappingKey;

  /// The API stage.
  final String stage;

  ApiMapping({
    @required this.apiId,
    this.apiMappingId,
    this.apiMappingKey,
    @required this.stage,
  });
  static ApiMapping fromJson(Map<String, dynamic> json) => ApiMapping(
        apiId: json['ApiId'] as String,
        apiMappingId: json.containsKey('ApiMappingId')
            ? json['ApiMappingId'] as String
            : null,
        apiMappingKey: json.containsKey('ApiMappingKey')
            ? json['ApiMappingKey'] as String
            : null,
        stage: json['Stage'] as String,
      );
}

/// Represents an authorizer.
class Authorizer {
  /// Specifies the required credentials as an IAM role for API Gateway to
  /// invoke the authorizer. To specify an IAM role for API Gateway to assume,
  /// use the role's Amazon Resource Name (ARN). To use resource-based
  /// permissions on the Lambda function, specify null.
  final String authorizerCredentialsArn;

  /// The authorizer identifier.
  final String authorizerId;

  /// The time to live (TTL), in seconds, of cached authorizer results. If it
  /// equals 0, authorization caching is disabled. If it is greater than 0, API
  /// Gateway will cache authorizer responses. If this field is not set, the
  /// default value is 300. The maximum value is 3600, or 1 hour.
  final int authorizerResultTtlInSeconds;

  /// The authorizer type. Currently the only valid value is REQUEST, for a
  /// Lambda function using incoming request parameters.
  final String authorizerType;

  /// The authorizer's Uniform Resource Identifier (URI). ForREQUEST
  /// authorizers, this must be a well-formed Lambda function URI, for example,
  /// arn:aws:apigateway:us-west-2:lambda:path/2015-03-31/functions/arn:aws:lambda:us-west-2:{account_id}:function:{lambda_function_name}/invocations.
  /// In general, the URI has this form:
  /// arn:aws:apigateway:{region}:lambda:path/{service_api} , where {region} is
  /// the same as the region hosting the Lambda function, path indicates that
  /// the remaining substring in the URI should be treated as the path to the
  /// resource, including the initial /. For Lambda functions, this is usually
  /// of the form /2015-03-31/functions/[FunctionARN]/invocations.
  final String authorizerUri;

  /// The identity source for which authorization is requested.
  ///
  /// For the REQUEST authorizer, this is required when authorization caching is
  /// enabled. The value is a comma-separated string of one or more mapping
  /// expressions of the specified request parameters. For example, if an Auth
  /// header and a Name query string parameters are defined as identity sources,
  /// this value is method.request.header.Auth, method.request.querystring.Name.
  /// These parameters will be used to derive the authorization caching key and
  /// to perform runtime validation of the REQUEST authorizer by verifying all
  /// of the identity-related request parameters are present, not null, and
  /// non-empty. Only when this is true does the authorizer invoke the
  /// authorizer Lambda function, otherwise, it returns a 401 Unauthorized
  /// response without calling the Lambda function. The valid value is a string
  /// of comma-separated mapping expressions of the specified request
  /// parameters. When the authorization caching is not enabled, this property
  /// is optional.
  final List<String> identitySource;

  /// The validation expression does not apply to the REQUEST authorizer.
  final String identityValidationExpression;

  /// The name of the authorizer.
  final String name;

  /// For REQUEST authorizer, this is not defined.
  final List<String> providerArns;

  Authorizer({
    this.authorizerCredentialsArn,
    this.authorizerId,
    this.authorizerResultTtlInSeconds,
    this.authorizerType,
    this.authorizerUri,
    this.identitySource,
    this.identityValidationExpression,
    @required this.name,
    this.providerArns,
  });
  static Authorizer fromJson(Map<String, dynamic> json) => Authorizer(
        authorizerCredentialsArn: json.containsKey('AuthorizerCredentialsArn')
            ? json['AuthorizerCredentialsArn'] as String
            : null,
        authorizerId: json.containsKey('AuthorizerId')
            ? json['AuthorizerId'] as String
            : null,
        authorizerResultTtlInSeconds:
            json.containsKey('AuthorizerResultTtlInSeconds')
                ? json['AuthorizerResultTtlInSeconds'] as int
                : null,
        authorizerType: json.containsKey('AuthorizerType')
            ? json['AuthorizerType'] as String
            : null,
        authorizerUri: json.containsKey('AuthorizerUri')
            ? json['AuthorizerUri'] as String
            : null,
        identitySource: json.containsKey('IdentitySource')
            ? (json['IdentitySource'] as List).map((e) => e as String).toList()
            : null,
        identityValidationExpression:
            json.containsKey('IdentityValidationExpression')
                ? json['IdentityValidationExpression'] as String
                : null,
        name: json['Name'] as String,
        providerArns: json.containsKey('ProviderArns')
            ? (json['ProviderArns'] as List).map((e) => e as String).toList()
            : null,
      );
}

class CreateApiMappingResponse {
  /// The API identifier.
  final String apiId;

  /// The API mapping identifier.
  final String apiMappingId;

  /// The API mapping key.
  final String apiMappingKey;

  /// The API stage.
  final String stage;

  CreateApiMappingResponse({
    this.apiId,
    this.apiMappingId,
    this.apiMappingKey,
    this.stage,
  });
  static CreateApiMappingResponse fromJson(Map<String, dynamic> json) =>
      CreateApiMappingResponse(
        apiId: json.containsKey('ApiId') ? json['ApiId'] as String : null,
        apiMappingId: json.containsKey('ApiMappingId')
            ? json['ApiMappingId'] as String
            : null,
        apiMappingKey: json.containsKey('ApiMappingKey')
            ? json['ApiMappingKey'] as String
            : null,
        stage: json.containsKey('Stage') ? json['Stage'] as String : null,
      );
}

class CreateApiResponse {
  /// The URI of the API, of the form
  /// {api-id}.execute-api.{region}.amazonaws.com. The stage name is typically
  /// appended to this URI to form a complete path to a deployed API stage.
  final String apiEndpoint;

  /// The API ID.
  final String apiId;

  /// An API key selection expression. See
  /// [API Key Selection Expressions](https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-websocket-api-selection-expressions.html#apigateway-websocket-api-apikey-selection-expressions).
  final String apiKeySelectionExpression;

  /// The timestamp when the API was created.
  final DateTime createdDate;

  /// The description of the API.
  final String description;

  /// Avoid validating models when creating a deployment.
  final bool disableSchemaValidation;

  /// The name of the API.
  final String name;

  /// The API protocol: Currently only WEBSOCKET is supported.
  final String protocolType;

  /// The route selection expression for the API.
  final String routeSelectionExpression;

  /// A version identifier for the API.
  final String version;

  /// The warning messages reported when failonwarnings is turned on during API
  /// import.
  final List<String> warnings;

  /// The key-value map of strings. The valid character set is [a-zA-Z+-=._:/].
  /// The tag key can be up to 128 characters and must not start with aws:. The
  /// tag value can be up to 256 characters..
  final Map<String, String> tags;

  CreateApiResponse({
    this.apiEndpoint,
    this.apiId,
    this.apiKeySelectionExpression,
    this.createdDate,
    this.description,
    this.disableSchemaValidation,
    this.name,
    this.protocolType,
    this.routeSelectionExpression,
    this.version,
    this.warnings,
    this.tags,
  });
  static CreateApiResponse fromJson(Map<String, dynamic> json) =>
      CreateApiResponse(
        apiEndpoint: json.containsKey('ApiEndpoint')
            ? json['ApiEndpoint'] as String
            : null,
        apiId: json.containsKey('ApiId') ? json['ApiId'] as String : null,
        apiKeySelectionExpression: json.containsKey('ApiKeySelectionExpression')
            ? json['ApiKeySelectionExpression'] as String
            : null,
        createdDate: json.containsKey('CreatedDate')
            ? DateTime.parse(json['CreatedDate'])
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        disableSchemaValidation: json.containsKey('DisableSchemaValidation')
            ? json['DisableSchemaValidation'] as bool
            : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        protocolType: json.containsKey('ProtocolType')
            ? json['ProtocolType'] as String
            : null,
        routeSelectionExpression: json.containsKey('RouteSelectionExpression')
            ? json['RouteSelectionExpression'] as String
            : null,
        version: json.containsKey('Version') ? json['Version'] as String : null,
        warnings: json.containsKey('Warnings')
            ? (json['Warnings'] as List).map((e) => e as String).toList()
            : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

class CreateAuthorizerResponse {
  /// Specifies the required credentials as an IAM role for API Gateway to
  /// invoke the authorizer. To specify an IAM role for API Gateway to assume,
  /// use the role's Amazon Resource Name (ARN). To use resource-based
  /// permissions on the Lambda function, specify null.
  final String authorizerCredentialsArn;

  /// The authorizer identifier.
  final String authorizerId;

  /// The time to live (TTL), in seconds, of cached authorizer results. If it
  /// equals 0, authorization caching is disabled. If it is greater than 0, API
  /// Gateway will cache authorizer responses. If this field is not set, the
  /// default value is 300. The maximum value is 3600, or 1 hour.
  final int authorizerResultTtlInSeconds;

  /// The authorizer type. Currently the only valid value is REQUEST, for a
  /// Lambda function using incoming request parameters.
  final String authorizerType;

  /// The authorizer's Uniform Resource Identifier (URI). ForREQUEST
  /// authorizers, this must be a well-formed Lambda function URI, for example,
  /// arn:aws:apigateway:us-west-2:lambda:path/2015-03-31/functions/arn:aws:lambda:us-west-2:{account_id}:function:{lambda_function_name}/invocations.
  /// In general, the URI has this form:
  /// arn:aws:apigateway:{region}:lambda:path/{service_api} , where {region} is
  /// the same as the region hosting the Lambda function, path indicates that
  /// the remaining substring in the URI should be treated as the path to the
  /// resource, including the initial /. For Lambda functions, this is usually
  /// of the form /2015-03-31/functions/[FunctionARN]/invocations.
  final String authorizerUri;

  /// The identity source for which authorization is requested.
  ///
  /// For the REQUEST authorizer, this is required when authorization caching is
  /// enabled. The value is a comma-separated string of one or more mapping
  /// expressions of the specified request parameters. For example, if an Auth
  /// header and a Name query string parameters are defined as identity sources,
  /// this value is method.request.header.Auth, method.request.querystring.Name.
  /// These parameters will be used to derive the authorization caching key and
  /// to perform runtime validation of the REQUEST authorizer by verifying all
  /// of the identity-related request parameters are present, not null, and
  /// non-empty. Only when this is true does the authorizer invoke the
  /// authorizer Lambda function, otherwise, it returns a 401 Unauthorized
  /// response without calling the Lambda function. The valid value is a string
  /// of comma-separated mapping expressions of the specified request
  /// parameters. When the authorization caching is not enabled, this property
  /// is optional.
  final List<String> identitySource;

  /// The validation expression does not apply to the REQUEST authorizer.
  final String identityValidationExpression;

  /// The name of the authorizer.
  final String name;

  /// For REQUEST authorizer, this is not defined.
  final List<String> providerArns;

  CreateAuthorizerResponse({
    this.authorizerCredentialsArn,
    this.authorizerId,
    this.authorizerResultTtlInSeconds,
    this.authorizerType,
    this.authorizerUri,
    this.identitySource,
    this.identityValidationExpression,
    this.name,
    this.providerArns,
  });
  static CreateAuthorizerResponse fromJson(Map<String, dynamic> json) =>
      CreateAuthorizerResponse(
        authorizerCredentialsArn: json.containsKey('AuthorizerCredentialsArn')
            ? json['AuthorizerCredentialsArn'] as String
            : null,
        authorizerId: json.containsKey('AuthorizerId')
            ? json['AuthorizerId'] as String
            : null,
        authorizerResultTtlInSeconds:
            json.containsKey('AuthorizerResultTtlInSeconds')
                ? json['AuthorizerResultTtlInSeconds'] as int
                : null,
        authorizerType: json.containsKey('AuthorizerType')
            ? json['AuthorizerType'] as String
            : null,
        authorizerUri: json.containsKey('AuthorizerUri')
            ? json['AuthorizerUri'] as String
            : null,
        identitySource: json.containsKey('IdentitySource')
            ? (json['IdentitySource'] as List).map((e) => e as String).toList()
            : null,
        identityValidationExpression:
            json.containsKey('IdentityValidationExpression')
                ? json['IdentityValidationExpression'] as String
                : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        providerArns: json.containsKey('ProviderArns')
            ? (json['ProviderArns'] as List).map((e) => e as String).toList()
            : null,
      );
}

class CreateDeploymentResponse {
  /// The date and time when the Deployment resource was created.
  final DateTime createdDate;

  /// The identifier for the deployment.
  final String deploymentId;

  /// The status of the deployment: PENDING, FAILED, or SUCCEEDED.
  final String deploymentStatus;

  /// May contain additional feedback on the status of an API deployment.
  final String deploymentStatusMessage;

  /// The description for the deployment.
  final String description;

  CreateDeploymentResponse({
    this.createdDate,
    this.deploymentId,
    this.deploymentStatus,
    this.deploymentStatusMessage,
    this.description,
  });
  static CreateDeploymentResponse fromJson(Map<String, dynamic> json) =>
      CreateDeploymentResponse(
        createdDate: json.containsKey('CreatedDate')
            ? DateTime.parse(json['CreatedDate'])
            : null,
        deploymentId: json.containsKey('DeploymentId')
            ? json['DeploymentId'] as String
            : null,
        deploymentStatus: json.containsKey('DeploymentStatus')
            ? json['DeploymentStatus'] as String
            : null,
        deploymentStatusMessage: json.containsKey('DeploymentStatusMessage')
            ? json['DeploymentStatusMessage'] as String
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
      );
}

class CreateDomainNameResponse {
  /// The API mapping selection expression.
  final String apiMappingSelectionExpression;

  /// The name of the DomainName resource.
  final String domainName;

  /// The domain name configurations.
  final List<DomainNameConfiguration> domainNameConfigurations;

  /// The key-value map of strings. The valid character set is [a-zA-Z+-=._:/].
  /// The tag key can be up to 128 characters and must not start with aws:. The
  /// tag value can be up to 256 characters..
  final Map<String, String> tags;

  CreateDomainNameResponse({
    this.apiMappingSelectionExpression,
    this.domainName,
    this.domainNameConfigurations,
    this.tags,
  });
  static CreateDomainNameResponse fromJson(Map<String, dynamic> json) =>
      CreateDomainNameResponse(
        apiMappingSelectionExpression:
            json.containsKey('ApiMappingSelectionExpression')
                ? json['ApiMappingSelectionExpression'] as String
                : null,
        domainName: json.containsKey('DomainName')
            ? json['DomainName'] as String
            : null,
        domainNameConfigurations: json.containsKey('DomainNameConfigurations')
            ? (json['DomainNameConfigurations'] as List)
                .map((e) => DomainNameConfiguration.fromJson(e))
                .toList()
            : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

class CreateIntegrationResponse {
  /// The connection ID.
  final String connectionId;

  /// The type of the network connection to the integration endpoint. Currently
  /// the only valid value is INTERNET, for connections through the public
  /// routable internet.
  final String connectionType;

  /// Specifies how to handle response payload content type conversions.
  /// Supported values are CONVERT_TO_BINARY and CONVERT_TO_TEXT, with the
  /// following behaviors:
  ///
  ///  CONVERT_TO_BINARY: Converts a response payload from a Base64-encoded
  /// string to the corresponding binary blob.
  ///
  ///  CONVERT_TO_TEXT: Converts a response payload from a binary blob to a
  /// Base64-encoded string.
  ///
  /// If this property is not defined, the response payload will be passed
  /// through from the integration response to the route response or method
  /// response without modification.
  final String contentHandlingStrategy;

  /// Specifies the credentials required for the integration, if any. For AWS
  /// integrations, three options are available. To specify an IAM Role for API
  /// Gateway to assume, use the role's Amazon Resource Name (ARN). To require
  /// that the caller's identity be passed through from the request, specify the
  /// string arn:aws:iam::*:user/*. To use resource-based permissions on
  /// supported AWS services, specify null.
  final String credentialsArn;

  /// Represents the description of an integration.
  final String description;

  /// Represents the identifier of an integration.
  final String integrationId;

  /// Specifies the integration's HTTP method type.
  final String integrationMethod;

  /// The integration response selection expression for the integration. See
  /// [Integration Response Selection Expressions](https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-websocket-api-selection-expressions.html#apigateway-websocket-api-integration-response-selection-expressions).
  final String integrationResponseSelectionExpression;

  /// The integration type of an integration. One of the following:
  ///
  ///  AWS: for integrating the route or method request with an AWS service
  /// action, including the Lambda function-invoking action. With the Lambda
  /// function-invoking action, this is referred to as the Lambda custom
  /// integration. With any other AWS service action, this is known as AWS
  /// integration.
  ///
  ///  AWS_PROXY: for integrating the route or method request with the Lambda
  /// function-invoking action with the client request passed through as-is.
  /// This integration is also referred to as Lambda proxy integration.
  ///
  ///  HTTP: for integrating the route or method request with an HTTP endpoint.
  /// This integration is also referred to as the HTTP custom integration.
  ///
  ///  HTTP_PROXY: for integrating route or method request with an HTTP
  /// endpoint, with the client request passed through as-is. This is also
  /// referred to as HTTP proxy integration.
  ///
  ///  MOCK: for integrating the route or method request with API Gateway as a
  /// "loopback" endpoint without invoking any backend.
  final String integrationType;

  /// For a Lambda proxy integration, this is the URI of the Lambda function.
  final String integrationUri;

  /// Specifies the pass-through behavior for incoming requests based on the
  /// Content-Type header in the request, and the available mapping templates
  /// specified as the requestTemplates property on the Integration resource.
  /// There are three valid values: WHEN_NO_MATCH, WHEN_NO_TEMPLATES, and NEVER.
  ///
  ///  WHEN_NO_MATCH passes the request body for unmapped content types through
  /// to the integration backend without transformation.
  ///
  ///  NEVER rejects unmapped content types with an HTTP 415 Unsupported Media
  /// Type response.
  ///
  ///  WHEN_NO_TEMPLATES allows pass-through when the integration has no content
  /// types mapped to templates. However, if there is at least one content type
  /// defined, unmapped content types will be rejected with the same HTTP 415
  /// Unsupported Media Type response.
  final String passthroughBehavior;

  /// A key-value map specifying request parameters that are passed from the
  /// method request to the backend. The key is an integration request parameter
  /// name and the associated value is a method request parameter value or
  /// static value that must be enclosed within single quotes and pre-encoded as
  /// required by the backend. The method request parameter value must match the
  /// pattern of method.request.{location}.{name} , where {location} is
  /// querystring, path, or header; and {name} must be a valid and unique method
  /// request parameter name.
  final Map<String, String> requestParameters;

  /// Represents a map of Velocity templates that are applied on the request
  /// payload based on the value of the Content-Type header sent by the client.
  /// The content type value is the key in this map, and the template (as a
  /// String) is the value.
  final Map<String, String> requestTemplates;

  /// The template selection expression for the integration.
  final String templateSelectionExpression;

  /// Custom timeout between 50 and 29,000 milliseconds. The default value is
  /// 29,000 milliseconds or 29 seconds.
  final int timeoutInMillis;

  CreateIntegrationResponse({
    this.connectionId,
    this.connectionType,
    this.contentHandlingStrategy,
    this.credentialsArn,
    this.description,
    this.integrationId,
    this.integrationMethod,
    this.integrationResponseSelectionExpression,
    this.integrationType,
    this.integrationUri,
    this.passthroughBehavior,
    this.requestParameters,
    this.requestTemplates,
    this.templateSelectionExpression,
    this.timeoutInMillis,
  });
  static CreateIntegrationResponse fromJson(Map<String, dynamic> json) =>
      CreateIntegrationResponse(
        connectionId: json.containsKey('ConnectionId')
            ? json['ConnectionId'] as String
            : null,
        connectionType: json.containsKey('ConnectionType')
            ? json['ConnectionType'] as String
            : null,
        contentHandlingStrategy: json.containsKey('ContentHandlingStrategy')
            ? json['ContentHandlingStrategy'] as String
            : null,
        credentialsArn: json.containsKey('CredentialsArn')
            ? json['CredentialsArn'] as String
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        integrationId: json.containsKey('IntegrationId')
            ? json['IntegrationId'] as String
            : null,
        integrationMethod: json.containsKey('IntegrationMethod')
            ? json['IntegrationMethod'] as String
            : null,
        integrationResponseSelectionExpression:
            json.containsKey('IntegrationResponseSelectionExpression')
                ? json['IntegrationResponseSelectionExpression'] as String
                : null,
        integrationType: json.containsKey('IntegrationType')
            ? json['IntegrationType'] as String
            : null,
        integrationUri: json.containsKey('IntegrationUri')
            ? json['IntegrationUri'] as String
            : null,
        passthroughBehavior: json.containsKey('PassthroughBehavior')
            ? json['PassthroughBehavior'] as String
            : null,
        requestParameters: json.containsKey('RequestParameters')
            ? (json['RequestParameters'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        requestTemplates: json.containsKey('RequestTemplates')
            ? (json['RequestTemplates'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        templateSelectionExpression:
            json.containsKey('TemplateSelectionExpression')
                ? json['TemplateSelectionExpression'] as String
                : null,
        timeoutInMillis: json.containsKey('TimeoutInMillis')
            ? json['TimeoutInMillis'] as int
            : null,
      );
}

class CreateIntegrationResponseResponse {
  /// Specifies how to handle response payload content type conversions.
  /// Supported values are CONVERT_TO_BINARY and CONVERT_TO_TEXT, with the
  /// following behaviors:
  ///
  ///  CONVERT_TO_BINARY: Converts a response payload from a Base64-encoded
  /// string to the corresponding binary blob.
  ///
  ///  CONVERT_TO_TEXT: Converts a response payload from a binary blob to a
  /// Base64-encoded string.
  ///
  /// If this property is not defined, the response payload will be passed
  /// through from the integration response to the route response or method
  /// response without modification.
  final String contentHandlingStrategy;

  /// The integration response ID.
  final String integrationResponseId;

  /// The integration response key.
  final String integrationResponseKey;

  /// A key-value map specifying response parameters that are passed to the
  /// method response from the backend. The key is a method response header
  /// parameter name and the mapped value is an integration response header
  /// value, a static value enclosed within a pair of single quotes, or a JSON
  /// expression from the integration response body. The mapping key must match
  /// the pattern of method.response.header.{name}, where name is a valid and
  /// unique header name. The mapped non-static value must match the pattern of
  /// integration.response.header.{name} or
  /// integration.response.body.{JSON-expression}, where name is a valid and
  /// unique response header name and JSON-expression is a valid JSON expression
  /// without the $ prefix.
  final Map<String, String> responseParameters;

  /// The collection of response templates for the integration response as a
  /// string-to-string map of key-value pairs. Response templates are
  /// represented as a key/value map, with a content-type as the key and a
  /// template as the value.
  final Map<String, String> responseTemplates;

  /// The template selection expressions for the integration response.
  final String templateSelectionExpression;

  CreateIntegrationResponseResponse({
    this.contentHandlingStrategy,
    this.integrationResponseId,
    this.integrationResponseKey,
    this.responseParameters,
    this.responseTemplates,
    this.templateSelectionExpression,
  });
  static CreateIntegrationResponseResponse fromJson(
          Map<String, dynamic> json) =>
      CreateIntegrationResponseResponse(
        contentHandlingStrategy: json.containsKey('ContentHandlingStrategy')
            ? json['ContentHandlingStrategy'] as String
            : null,
        integrationResponseId: json.containsKey('IntegrationResponseId')
            ? json['IntegrationResponseId'] as String
            : null,
        integrationResponseKey: json.containsKey('IntegrationResponseKey')
            ? json['IntegrationResponseKey'] as String
            : null,
        responseParameters: json.containsKey('ResponseParameters')
            ? (json['ResponseParameters'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        responseTemplates: json.containsKey('ResponseTemplates')
            ? (json['ResponseTemplates'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        templateSelectionExpression:
            json.containsKey('TemplateSelectionExpression')
                ? json['TemplateSelectionExpression'] as String
                : null,
      );
}

class CreateModelResponse {
  /// The content-type for the model, for example, "application/json".
  final String contentType;

  /// The description of the model.
  final String description;

  /// The model identifier.
  final String modelId;

  /// The name of the model. Must be alphanumeric.
  final String name;

  /// The schema for the model. For application/json models, this should be JSON
  /// schema draft 4 model.
  final String schema;

  CreateModelResponse({
    this.contentType,
    this.description,
    this.modelId,
    this.name,
    this.schema,
  });
  static CreateModelResponse fromJson(Map<String, dynamic> json) =>
      CreateModelResponse(
        contentType: json.containsKey('ContentType')
            ? json['ContentType'] as String
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        modelId: json.containsKey('ModelId') ? json['ModelId'] as String : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        schema: json.containsKey('Schema') ? json['Schema'] as String : null,
      );
}

class CreateRouteResponse {
  /// Specifies whether an API key is required for this route.
  final bool apiKeyRequired;

  /// A list of authorization scopes configured on a route. The scopes are used
  /// with a COGNITO_USER_POOLS authorizer to authorize the method invocation.
  /// The authorization works by matching the route scopes against the scopes
  /// parsed from the access token in the incoming request. The method
  /// invocation is authorized if any route scope matches a claimed scope in the
  /// access token. Otherwise, the invocation is not authorized. When the route
  /// scope is configured, the client must provide an access token instead of an
  /// identity token for authorization purposes.
  final List<String> authorizationScopes;

  /// The authorization type for the route. Valid values are NONE for open
  /// access, AWS_IAM for using AWS IAM permissions, and CUSTOM for using a
  /// Lambda authorizer
  final String authorizationType;

  /// The identifier of the Authorizer resource to be associated with this
  /// route, if the authorizationType is CUSTOM . The authorizer identifier is
  /// generated by API Gateway when you created the authorizer.
  final String authorizerId;

  /// The model selection expression for the route.
  final String modelSelectionExpression;

  /// The operation name for the route.
  final String operationName;

  /// The request models for the route.
  final Map<String, String> requestModels;

  /// The request parameters for the route.
  final Map<String, ParameterConstraints> requestParameters;

  /// The route ID.
  final String routeId;

  /// The route key for the route.
  final String routeKey;

  /// The route response selection expression for the route.
  final String routeResponseSelectionExpression;

  /// The target for the route.
  final String target;

  CreateRouteResponse({
    this.apiKeyRequired,
    this.authorizationScopes,
    this.authorizationType,
    this.authorizerId,
    this.modelSelectionExpression,
    this.operationName,
    this.requestModels,
    this.requestParameters,
    this.routeId,
    this.routeKey,
    this.routeResponseSelectionExpression,
    this.target,
  });
  static CreateRouteResponse fromJson(Map<String, dynamic> json) =>
      CreateRouteResponse(
        apiKeyRequired: json.containsKey('ApiKeyRequired')
            ? json['ApiKeyRequired'] as bool
            : null,
        authorizationScopes: json.containsKey('AuthorizationScopes')
            ? (json['AuthorizationScopes'] as List)
                .map((e) => e as String)
                .toList()
            : null,
        authorizationType: json.containsKey('AuthorizationType')
            ? json['AuthorizationType'] as String
            : null,
        authorizerId: json.containsKey('AuthorizerId')
            ? json['AuthorizerId'] as String
            : null,
        modelSelectionExpression: json.containsKey('ModelSelectionExpression')
            ? json['ModelSelectionExpression'] as String
            : null,
        operationName: json.containsKey('OperationName')
            ? json['OperationName'] as String
            : null,
        requestModels: json.containsKey('RequestModels')
            ? (json['RequestModels'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        requestParameters: json.containsKey('RequestParameters')
            ? (json['RequestParameters'] as Map).map((k, v) =>
                MapEntry(k as String, ParameterConstraints.fromJson(v)))
            : null,
        routeId: json.containsKey('RouteId') ? json['RouteId'] as String : null,
        routeKey:
            json.containsKey('RouteKey') ? json['RouteKey'] as String : null,
        routeResponseSelectionExpression:
            json.containsKey('RouteResponseSelectionExpression')
                ? json['RouteResponseSelectionExpression'] as String
                : null,
        target: json.containsKey('Target') ? json['Target'] as String : null,
      );
}

class CreateRouteResponseResponse {
  /// Represents the model selection expression of a route response.
  final String modelSelectionExpression;

  /// Represents the response models of a route response.
  final Map<String, String> responseModels;

  /// Represents the response parameters of a route response.
  final Map<String, ParameterConstraints> responseParameters;

  /// Represents the identifier of a route response.
  final String routeResponseId;

  /// Represents the route response key of a route response.
  final String routeResponseKey;

  CreateRouteResponseResponse({
    this.modelSelectionExpression,
    this.responseModels,
    this.responseParameters,
    this.routeResponseId,
    this.routeResponseKey,
  });
  static CreateRouteResponseResponse fromJson(Map<String, dynamic> json) =>
      CreateRouteResponseResponse(
        modelSelectionExpression: json.containsKey('ModelSelectionExpression')
            ? json['ModelSelectionExpression'] as String
            : null,
        responseModels: json.containsKey('ResponseModels')
            ? (json['ResponseModels'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        responseParameters: json.containsKey('ResponseParameters')
            ? (json['ResponseParameters'] as Map).map((k, v) =>
                MapEntry(k as String, ParameterConstraints.fromJson(v)))
            : null,
        routeResponseId: json.containsKey('RouteResponseId')
            ? json['RouteResponseId'] as String
            : null,
        routeResponseKey: json.containsKey('RouteResponseKey')
            ? json['RouteResponseKey'] as String
            : null,
      );
}

class CreateStageResponse {
  /// Settings for logging access in this stage.
  final AccessLogSettings accessLogSettings;

  /// The identifier of a client certificate for a Stage.
  final String clientCertificateId;

  /// The timestamp when the stage was created.
  final DateTime createdDate;

  /// Default route settings for the stage.
  final RouteSettings defaultRouteSettings;

  /// The identifier of the Deployment that the Stage is associated with.
  final String deploymentId;

  /// The description of the stage.
  final String description;

  /// The timestamp when the stage was last updated.
  final DateTime lastUpdatedDate;

  /// Route settings for the stage.
  final Map<String, RouteSettings> routeSettings;

  /// The name of the stage.
  final String stageName;

  /// A map that defines the stage variables for a stage resource. Variable
  /// names can have alphanumeric and underscore characters, and the values must
  /// match [A-Za-z0-9-._~:/?#&=,]+.
  final Map<String, String> stageVariables;

  /// The key-value map of strings. The valid character set is [a-zA-Z+-=._:/].
  /// The tag key can be up to 128 characters and must not start with aws:. The
  /// tag value can be up to 256 characters..
  final Map<String, String> tags;

  CreateStageResponse({
    this.accessLogSettings,
    this.clientCertificateId,
    this.createdDate,
    this.defaultRouteSettings,
    this.deploymentId,
    this.description,
    this.lastUpdatedDate,
    this.routeSettings,
    this.stageName,
    this.stageVariables,
    this.tags,
  });
  static CreateStageResponse fromJson(Map<String, dynamic> json) =>
      CreateStageResponse(
        accessLogSettings: json.containsKey('AccessLogSettings')
            ? AccessLogSettings.fromJson(json['AccessLogSettings'])
            : null,
        clientCertificateId: json.containsKey('ClientCertificateId')
            ? json['ClientCertificateId'] as String
            : null,
        createdDate: json.containsKey('CreatedDate')
            ? DateTime.parse(json['CreatedDate'])
            : null,
        defaultRouteSettings: json.containsKey('DefaultRouteSettings')
            ? RouteSettings.fromJson(json['DefaultRouteSettings'])
            : null,
        deploymentId: json.containsKey('DeploymentId')
            ? json['DeploymentId'] as String
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        lastUpdatedDate: json.containsKey('LastUpdatedDate')
            ? DateTime.parse(json['LastUpdatedDate'])
            : null,
        routeSettings: json.containsKey('RouteSettings')
            ? (json['RouteSettings'] as Map)
                .map((k, v) => MapEntry(k as String, RouteSettings.fromJson(v)))
            : null,
        stageName:
            json.containsKey('StageName') ? json['StageName'] as String : null,
        stageVariables: json.containsKey('StageVariables')
            ? (json['StageVariables'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

/// An immutable representation of an API that can be called by users. A
/// Deployment must be associated with a Stage for it to be callable over the
/// internet.
class Deployment {
  /// The date and time when the Deployment resource was created.
  final DateTime createdDate;

  /// The identifier for the deployment.
  final String deploymentId;

  /// The status of the deployment: PENDING, FAILED, or SUCCEEDED.
  final String deploymentStatus;

  /// May contain additional feedback on the status of an API deployment.
  final String deploymentStatusMessage;

  /// The description for the deployment.
  final String description;

  Deployment({
    this.createdDate,
    this.deploymentId,
    this.deploymentStatus,
    this.deploymentStatusMessage,
    this.description,
  });
  static Deployment fromJson(Map<String, dynamic> json) => Deployment(
        createdDate: json.containsKey('CreatedDate')
            ? DateTime.parse(json['CreatedDate'])
            : null,
        deploymentId: json.containsKey('DeploymentId')
            ? json['DeploymentId'] as String
            : null,
        deploymentStatus: json.containsKey('DeploymentStatus')
            ? json['DeploymentStatus'] as String
            : null,
        deploymentStatusMessage: json.containsKey('DeploymentStatusMessage')
            ? json['DeploymentStatusMessage'] as String
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
      );
}

/// Represents a domain name.
class DomainName {
  /// The API mapping selection expression.
  final String apiMappingSelectionExpression;

  /// The name of the DomainName resource.
  final String domainName;

  /// The domain name configurations.
  final List<DomainNameConfiguration> domainNameConfigurations;

  /// The key-value map of strings. The valid character set is [a-zA-Z+-=._:/].
  /// The tag key can be up to 128 characters and must not start with aws:. The
  /// tag value can be up to 256 characters..
  final Map<String, String> tags;

  DomainName({
    this.apiMappingSelectionExpression,
    @required this.domainName,
    this.domainNameConfigurations,
    this.tags,
  });
  static DomainName fromJson(Map<String, dynamic> json) => DomainName(
        apiMappingSelectionExpression:
            json.containsKey('ApiMappingSelectionExpression')
                ? json['ApiMappingSelectionExpression'] as String
                : null,
        domainName: json['DomainName'] as String,
        domainNameConfigurations: json.containsKey('DomainNameConfigurations')
            ? (json['DomainNameConfigurations'] as List)
                .map((e) => DomainNameConfiguration.fromJson(e))
                .toList()
            : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

/// The domain name configuration.
class DomainNameConfiguration {
  /// A domain name for the WebSocket API.
  final String apiGatewayDomainName;

  /// An AWS-managed certificate that will be used by the edge-optimized
  /// endpoint for this domain name. AWS Certificate Manager is the only
  /// supported source.
  final String certificateArn;

  /// The user-friendly name of the certificate that will be used by the
  /// edge-optimized endpoint for this domain name.
  final String certificateName;

  /// The timestamp when the certificate that was used by edge-optimized
  /// endpoint for this domain name was uploaded.
  final DateTime certificateUploadDate;

  /// The endpoint type.
  final String endpointType;

  /// The Amazon Route 53 Hosted Zone ID of the endpoint.
  final String hostedZoneId;

  /// The Transport Layer Security (TLS) version of the security policy for this
  /// domain name. The valid values are TLS_1_0 and TLS_1_2.
  final String securityPolicy;

  /// The status of the domain name migration. The valid values are AVAILABLE
  /// and UPDATING. If the status is UPDATING, the domain cannot be modified
  /// further until the existing operation is complete. If it is AVAILABLE, the
  /// domain can be updated.
  final String domainNameStatus;

  /// An optional text message containing detailed information about status of
  /// the domain name migration.
  final String domainNameStatusMessage;

  DomainNameConfiguration({
    this.apiGatewayDomainName,
    this.certificateArn,
    this.certificateName,
    this.certificateUploadDate,
    this.endpointType,
    this.hostedZoneId,
    this.securityPolicy,
    this.domainNameStatus,
    this.domainNameStatusMessage,
  });
  static DomainNameConfiguration fromJson(Map<String, dynamic> json) =>
      DomainNameConfiguration(
        apiGatewayDomainName: json.containsKey('ApiGatewayDomainName')
            ? json['ApiGatewayDomainName'] as String
            : null,
        certificateArn: json.containsKey('CertificateArn')
            ? json['CertificateArn'] as String
            : null,
        certificateName: json.containsKey('CertificateName')
            ? json['CertificateName'] as String
            : null,
        certificateUploadDate: json.containsKey('CertificateUploadDate')
            ? DateTime.parse(json['CertificateUploadDate'])
            : null,
        endpointType: json.containsKey('EndpointType')
            ? json['EndpointType'] as String
            : null,
        hostedZoneId: json.containsKey('HostedZoneId')
            ? json['HostedZoneId'] as String
            : null,
        securityPolicy: json.containsKey('SecurityPolicy')
            ? json['SecurityPolicy'] as String
            : null,
        domainNameStatus: json.containsKey('DomainNameStatus')
            ? json['DomainNameStatus'] as String
            : null,
        domainNameStatusMessage: json.containsKey('DomainNameStatusMessage')
            ? json['DomainNameStatusMessage'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class GetApiMappingResponse {
  /// The API identifier.
  final String apiId;

  /// The API mapping identifier.
  final String apiMappingId;

  /// The API mapping key.
  final String apiMappingKey;

  /// The API stage.
  final String stage;

  GetApiMappingResponse({
    this.apiId,
    this.apiMappingId,
    this.apiMappingKey,
    this.stage,
  });
  static GetApiMappingResponse fromJson(Map<String, dynamic> json) =>
      GetApiMappingResponse(
        apiId: json.containsKey('ApiId') ? json['ApiId'] as String : null,
        apiMappingId: json.containsKey('ApiMappingId')
            ? json['ApiMappingId'] as String
            : null,
        apiMappingKey: json.containsKey('ApiMappingKey')
            ? json['ApiMappingKey'] as String
            : null,
        stage: json.containsKey('Stage') ? json['Stage'] as String : null,
      );
}

class GetApiMappingsResponse {
  /// The elements from this collection.
  final List<ApiMapping> items;

  /// The next page of elements from this collection. Not valid for the last
  /// element of the collection.
  final String nextToken;

  GetApiMappingsResponse({
    this.items,
    this.nextToken,
  });
  static GetApiMappingsResponse fromJson(Map<String, dynamic> json) =>
      GetApiMappingsResponse(
        items: json.containsKey('Items')
            ? (json['Items'] as List)
                .map((e) => ApiMapping.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class GetApiResponse {
  /// The URI of the API, of the form
  /// {api-id}.execute-api.{region}.amazonaws.com. The stage name is typically
  /// appended to this URI to form a complete path to a deployed API stage.
  final String apiEndpoint;

  /// The API ID.
  final String apiId;

  /// An API key selection expression. See
  /// [API Key Selection Expressions](https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-websocket-api-selection-expressions.html#apigateway-websocket-api-apikey-selection-expressions).
  final String apiKeySelectionExpression;

  /// The timestamp when the API was created.
  final DateTime createdDate;

  /// The description of the API.
  final String description;

  /// Avoid validating models when creating a deployment.
  final bool disableSchemaValidation;

  /// The name of the API.
  final String name;

  /// The API protocol: Currently only WEBSOCKET is supported.
  final String protocolType;

  /// The route selection expression for the API.
  final String routeSelectionExpression;

  /// A version identifier for the API.
  final String version;

  /// The warning messages reported when failonwarnings is turned on during API
  /// import.
  final List<String> warnings;

  /// The key-value map of strings. The valid character set is [a-zA-Z+-=._:/].
  /// The tag key can be up to 128 characters and must not start with aws:. The
  /// tag value can be up to 256 characters..
  final Map<String, String> tags;

  GetApiResponse({
    this.apiEndpoint,
    this.apiId,
    this.apiKeySelectionExpression,
    this.createdDate,
    this.description,
    this.disableSchemaValidation,
    this.name,
    this.protocolType,
    this.routeSelectionExpression,
    this.version,
    this.warnings,
    this.tags,
  });
  static GetApiResponse fromJson(Map<String, dynamic> json) => GetApiResponse(
        apiEndpoint: json.containsKey('ApiEndpoint')
            ? json['ApiEndpoint'] as String
            : null,
        apiId: json.containsKey('ApiId') ? json['ApiId'] as String : null,
        apiKeySelectionExpression: json.containsKey('ApiKeySelectionExpression')
            ? json['ApiKeySelectionExpression'] as String
            : null,
        createdDate: json.containsKey('CreatedDate')
            ? DateTime.parse(json['CreatedDate'])
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        disableSchemaValidation: json.containsKey('DisableSchemaValidation')
            ? json['DisableSchemaValidation'] as bool
            : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        protocolType: json.containsKey('ProtocolType')
            ? json['ProtocolType'] as String
            : null,
        routeSelectionExpression: json.containsKey('RouteSelectionExpression')
            ? json['RouteSelectionExpression'] as String
            : null,
        version: json.containsKey('Version') ? json['Version'] as String : null,
        warnings: json.containsKey('Warnings')
            ? (json['Warnings'] as List).map((e) => e as String).toList()
            : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

class GetApisResponse {
  /// The elements from this collection.
  final List<Api> items;

  /// The next page of elements from this collection. Not valid for the last
  /// element of the collection.
  final String nextToken;

  GetApisResponse({
    this.items,
    this.nextToken,
  });
  static GetApisResponse fromJson(Map<String, dynamic> json) => GetApisResponse(
        items: json.containsKey('Items')
            ? (json['Items'] as List).map((e) => Api.fromJson(e)).toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class GetAuthorizerResponse {
  /// Specifies the required credentials as an IAM role for API Gateway to
  /// invoke the authorizer. To specify an IAM role for API Gateway to assume,
  /// use the role's Amazon Resource Name (ARN). To use resource-based
  /// permissions on the Lambda function, specify null.
  final String authorizerCredentialsArn;

  /// The authorizer identifier.
  final String authorizerId;

  /// The time to live (TTL), in seconds, of cached authorizer results. If it
  /// equals 0, authorization caching is disabled. If it is greater than 0, API
  /// Gateway will cache authorizer responses. If this field is not set, the
  /// default value is 300. The maximum value is 3600, or 1 hour.
  final int authorizerResultTtlInSeconds;

  /// The authorizer type. Currently the only valid value is REQUEST, for a
  /// Lambda function using incoming request parameters.
  final String authorizerType;

  /// The authorizer's Uniform Resource Identifier (URI). ForREQUEST
  /// authorizers, this must be a well-formed Lambda function URI, for example,
  /// arn:aws:apigateway:us-west-2:lambda:path/2015-03-31/functions/arn:aws:lambda:us-west-2:{account_id}:function:{lambda_function_name}/invocations.
  /// In general, the URI has this form:
  /// arn:aws:apigateway:{region}:lambda:path/{service_api} , where {region} is
  /// the same as the region hosting the Lambda function, path indicates that
  /// the remaining substring in the URI should be treated as the path to the
  /// resource, including the initial /. For Lambda functions, this is usually
  /// of the form /2015-03-31/functions/[FunctionARN]/invocations.
  final String authorizerUri;

  /// The identity source for which authorization is requested.
  ///
  /// For the REQUEST authorizer, this is required when authorization caching is
  /// enabled. The value is a comma-separated string of one or more mapping
  /// expressions of the specified request parameters. For example, if an Auth
  /// header and a Name query string parameters are defined as identity sources,
  /// this value is method.request.header.Auth, method.request.querystring.Name.
  /// These parameters will be used to derive the authorization caching key and
  /// to perform runtime validation of the REQUEST authorizer by verifying all
  /// of the identity-related request parameters are present, not null, and
  /// non-empty. Only when this is true does the authorizer invoke the
  /// authorizer Lambda function, otherwise, it returns a 401 Unauthorized
  /// response without calling the Lambda function. The valid value is a string
  /// of comma-separated mapping expressions of the specified request
  /// parameters. When the authorization caching is not enabled, this property
  /// is optional.
  final List<String> identitySource;

  /// The validation expression does not apply to the REQUEST authorizer.
  final String identityValidationExpression;

  /// The name of the authorizer.
  final String name;

  /// For REQUEST authorizer, this is not defined.
  final List<String> providerArns;

  GetAuthorizerResponse({
    this.authorizerCredentialsArn,
    this.authorizerId,
    this.authorizerResultTtlInSeconds,
    this.authorizerType,
    this.authorizerUri,
    this.identitySource,
    this.identityValidationExpression,
    this.name,
    this.providerArns,
  });
  static GetAuthorizerResponse fromJson(Map<String, dynamic> json) =>
      GetAuthorizerResponse(
        authorizerCredentialsArn: json.containsKey('AuthorizerCredentialsArn')
            ? json['AuthorizerCredentialsArn'] as String
            : null,
        authorizerId: json.containsKey('AuthorizerId')
            ? json['AuthorizerId'] as String
            : null,
        authorizerResultTtlInSeconds:
            json.containsKey('AuthorizerResultTtlInSeconds')
                ? json['AuthorizerResultTtlInSeconds'] as int
                : null,
        authorizerType: json.containsKey('AuthorizerType')
            ? json['AuthorizerType'] as String
            : null,
        authorizerUri: json.containsKey('AuthorizerUri')
            ? json['AuthorizerUri'] as String
            : null,
        identitySource: json.containsKey('IdentitySource')
            ? (json['IdentitySource'] as List).map((e) => e as String).toList()
            : null,
        identityValidationExpression:
            json.containsKey('IdentityValidationExpression')
                ? json['IdentityValidationExpression'] as String
                : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        providerArns: json.containsKey('ProviderArns')
            ? (json['ProviderArns'] as List).map((e) => e as String).toList()
            : null,
      );
}

class GetAuthorizersResponse {
  /// The elements from this collection.
  final List<Authorizer> items;

  /// The next page of elements from this collection. Not valid for the last
  /// element of the collection.
  final String nextToken;

  GetAuthorizersResponse({
    this.items,
    this.nextToken,
  });
  static GetAuthorizersResponse fromJson(Map<String, dynamic> json) =>
      GetAuthorizersResponse(
        items: json.containsKey('Items')
            ? (json['Items'] as List)
                .map((e) => Authorizer.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class GetDeploymentResponse {
  /// The date and time when the Deployment resource was created.
  final DateTime createdDate;

  /// The identifier for the deployment.
  final String deploymentId;

  /// The status of the deployment: PENDING, FAILED, or SUCCEEDED.
  final String deploymentStatus;

  /// May contain additional feedback on the status of an API deployment.
  final String deploymentStatusMessage;

  /// The description for the deployment.
  final String description;

  GetDeploymentResponse({
    this.createdDate,
    this.deploymentId,
    this.deploymentStatus,
    this.deploymentStatusMessage,
    this.description,
  });
  static GetDeploymentResponse fromJson(Map<String, dynamic> json) =>
      GetDeploymentResponse(
        createdDate: json.containsKey('CreatedDate')
            ? DateTime.parse(json['CreatedDate'])
            : null,
        deploymentId: json.containsKey('DeploymentId')
            ? json['DeploymentId'] as String
            : null,
        deploymentStatus: json.containsKey('DeploymentStatus')
            ? json['DeploymentStatus'] as String
            : null,
        deploymentStatusMessage: json.containsKey('DeploymentStatusMessage')
            ? json['DeploymentStatusMessage'] as String
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
      );
}

class GetDeploymentsResponse {
  /// The elements from this collection.
  final List<Deployment> items;

  /// The next page of elements from this collection. Not valid for the last
  /// element of the collection.
  final String nextToken;

  GetDeploymentsResponse({
    this.items,
    this.nextToken,
  });
  static GetDeploymentsResponse fromJson(Map<String, dynamic> json) =>
      GetDeploymentsResponse(
        items: json.containsKey('Items')
            ? (json['Items'] as List)
                .map((e) => Deployment.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class GetDomainNameResponse {
  /// The API mapping selection expression.
  final String apiMappingSelectionExpression;

  /// The name of the DomainName resource.
  final String domainName;

  /// The domain name configurations.
  final List<DomainNameConfiguration> domainNameConfigurations;

  /// The key-value map of strings. The valid character set is [a-zA-Z+-=._:/].
  /// The tag key can be up to 128 characters and must not start with aws:. The
  /// tag value can be up to 256 characters..
  final Map<String, String> tags;

  GetDomainNameResponse({
    this.apiMappingSelectionExpression,
    this.domainName,
    this.domainNameConfigurations,
    this.tags,
  });
  static GetDomainNameResponse fromJson(Map<String, dynamic> json) =>
      GetDomainNameResponse(
        apiMappingSelectionExpression:
            json.containsKey('ApiMappingSelectionExpression')
                ? json['ApiMappingSelectionExpression'] as String
                : null,
        domainName: json.containsKey('DomainName')
            ? json['DomainName'] as String
            : null,
        domainNameConfigurations: json.containsKey('DomainNameConfigurations')
            ? (json['DomainNameConfigurations'] as List)
                .map((e) => DomainNameConfiguration.fromJson(e))
                .toList()
            : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

class GetDomainNamesResponse {
  /// The elements from this collection.
  final List<DomainName> items;

  /// The next page of elements from this collection. Not valid for the last
  /// element of the collection.
  final String nextToken;

  GetDomainNamesResponse({
    this.items,
    this.nextToken,
  });
  static GetDomainNamesResponse fromJson(Map<String, dynamic> json) =>
      GetDomainNamesResponse(
        items: json.containsKey('Items')
            ? (json['Items'] as List)
                .map((e) => DomainName.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class GetIntegrationResponse {
  /// The connection ID.
  final String connectionId;

  /// The type of the network connection to the integration endpoint. Currently
  /// the only valid value is INTERNET, for connections through the public
  /// routable internet.
  final String connectionType;

  /// Specifies how to handle response payload content type conversions.
  /// Supported values are CONVERT_TO_BINARY and CONVERT_TO_TEXT, with the
  /// following behaviors:
  ///
  ///  CONVERT_TO_BINARY: Converts a response payload from a Base64-encoded
  /// string to the corresponding binary blob.
  ///
  ///  CONVERT_TO_TEXT: Converts a response payload from a binary blob to a
  /// Base64-encoded string.
  ///
  /// If this property is not defined, the response payload will be passed
  /// through from the integration response to the route response or method
  /// response without modification.
  final String contentHandlingStrategy;

  /// Specifies the credentials required for the integration, if any. For AWS
  /// integrations, three options are available. To specify an IAM Role for API
  /// Gateway to assume, use the role's Amazon Resource Name (ARN). To require
  /// that the caller's identity be passed through from the request, specify the
  /// string arn:aws:iam::*:user/*. To use resource-based permissions on
  /// supported AWS services, specify null.
  final String credentialsArn;

  /// Represents the description of an integration.
  final String description;

  /// Represents the identifier of an integration.
  final String integrationId;

  /// Specifies the integration's HTTP method type.
  final String integrationMethod;

  /// The integration response selection expression for the integration. See
  /// [Integration Response Selection Expressions](https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-websocket-api-selection-expressions.html#apigateway-websocket-api-integration-response-selection-expressions).
  final String integrationResponseSelectionExpression;

  /// The integration type of an integration. One of the following:
  ///
  ///  AWS: for integrating the route or method request with an AWS service
  /// action, including the Lambda function-invoking action. With the Lambda
  /// function-invoking action, this is referred to as the Lambda custom
  /// integration. With any other AWS service action, this is known as AWS
  /// integration.
  ///
  ///  AWS_PROXY: for integrating the route or method request with the Lambda
  /// function-invoking action with the client request passed through as-is.
  /// This integration is also referred to as Lambda proxy integration.
  ///
  ///  HTTP: for integrating the route or method request with an HTTP endpoint.
  /// This integration is also referred to as the HTTP custom integration.
  ///
  ///  HTTP_PROXY: for integrating route or method request with an HTTP
  /// endpoint, with the client request passed through as-is. This is also
  /// referred to as HTTP proxy integration.
  ///
  ///  MOCK: for integrating the route or method request with API Gateway as a
  /// "loopback" endpoint without invoking any backend.
  final String integrationType;

  /// For a Lambda proxy integration, this is the URI of the Lambda function.
  final String integrationUri;

  /// Specifies the pass-through behavior for incoming requests based on the
  /// Content-Type header in the request, and the available mapping templates
  /// specified as the requestTemplates property on the Integration resource.
  /// There are three valid values: WHEN_NO_MATCH, WHEN_NO_TEMPLATES, and NEVER.
  ///
  ///  WHEN_NO_MATCH passes the request body for unmapped content types through
  /// to the integration backend without transformation.
  ///
  ///  NEVER rejects unmapped content types with an HTTP 415 Unsupported Media
  /// Type response.
  ///
  ///  WHEN_NO_TEMPLATES allows pass-through when the integration has no content
  /// types mapped to templates. However, if there is at least one content type
  /// defined, unmapped content types will be rejected with the same HTTP 415
  /// Unsupported Media Type response.
  final String passthroughBehavior;

  /// A key-value map specifying request parameters that are passed from the
  /// method request to the backend. The key is an integration request parameter
  /// name and the associated value is a method request parameter value or
  /// static value that must be enclosed within single quotes and pre-encoded as
  /// required by the backend. The method request parameter value must match the
  /// pattern of method.request.{location}.{name} , where {location} is
  /// querystring, path, or header; and {name} must be a valid and unique method
  /// request parameter name.
  final Map<String, String> requestParameters;

  /// Represents a map of Velocity templates that are applied on the request
  /// payload based on the value of the Content-Type header sent by the client.
  /// The content type value is the key in this map, and the template (as a
  /// String) is the value.
  final Map<String, String> requestTemplates;

  /// The template selection expression for the integration.
  final String templateSelectionExpression;

  /// Custom timeout between 50 and 29,000 milliseconds. The default value is
  /// 29,000 milliseconds or 29 seconds.
  final int timeoutInMillis;

  GetIntegrationResponse({
    this.connectionId,
    this.connectionType,
    this.contentHandlingStrategy,
    this.credentialsArn,
    this.description,
    this.integrationId,
    this.integrationMethod,
    this.integrationResponseSelectionExpression,
    this.integrationType,
    this.integrationUri,
    this.passthroughBehavior,
    this.requestParameters,
    this.requestTemplates,
    this.templateSelectionExpression,
    this.timeoutInMillis,
  });
  static GetIntegrationResponse fromJson(Map<String, dynamic> json) =>
      GetIntegrationResponse(
        connectionId: json.containsKey('ConnectionId')
            ? json['ConnectionId'] as String
            : null,
        connectionType: json.containsKey('ConnectionType')
            ? json['ConnectionType'] as String
            : null,
        contentHandlingStrategy: json.containsKey('ContentHandlingStrategy')
            ? json['ContentHandlingStrategy'] as String
            : null,
        credentialsArn: json.containsKey('CredentialsArn')
            ? json['CredentialsArn'] as String
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        integrationId: json.containsKey('IntegrationId')
            ? json['IntegrationId'] as String
            : null,
        integrationMethod: json.containsKey('IntegrationMethod')
            ? json['IntegrationMethod'] as String
            : null,
        integrationResponseSelectionExpression:
            json.containsKey('IntegrationResponseSelectionExpression')
                ? json['IntegrationResponseSelectionExpression'] as String
                : null,
        integrationType: json.containsKey('IntegrationType')
            ? json['IntegrationType'] as String
            : null,
        integrationUri: json.containsKey('IntegrationUri')
            ? json['IntegrationUri'] as String
            : null,
        passthroughBehavior: json.containsKey('PassthroughBehavior')
            ? json['PassthroughBehavior'] as String
            : null,
        requestParameters: json.containsKey('RequestParameters')
            ? (json['RequestParameters'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        requestTemplates: json.containsKey('RequestTemplates')
            ? (json['RequestTemplates'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        templateSelectionExpression:
            json.containsKey('TemplateSelectionExpression')
                ? json['TemplateSelectionExpression'] as String
                : null,
        timeoutInMillis: json.containsKey('TimeoutInMillis')
            ? json['TimeoutInMillis'] as int
            : null,
      );
}

class GetIntegrationResponseResponse {
  /// Specifies how to handle response payload content type conversions.
  /// Supported values are CONVERT_TO_BINARY and CONVERT_TO_TEXT, with the
  /// following behaviors:
  ///
  ///  CONVERT_TO_BINARY: Converts a response payload from a Base64-encoded
  /// string to the corresponding binary blob.
  ///
  ///  CONVERT_TO_TEXT: Converts a response payload from a binary blob to a
  /// Base64-encoded string.
  ///
  /// If this property is not defined, the response payload will be passed
  /// through from the integration response to the route response or method
  /// response without modification.
  final String contentHandlingStrategy;

  /// The integration response ID.
  final String integrationResponseId;

  /// The integration response key.
  final String integrationResponseKey;

  /// A key-value map specifying response parameters that are passed to the
  /// method response from the backend. The key is a method response header
  /// parameter name and the mapped value is an integration response header
  /// value, a static value enclosed within a pair of single quotes, or a JSON
  /// expression from the integration response body. The mapping key must match
  /// the pattern of method.response.header.{name}, where name is a valid and
  /// unique header name. The mapped non-static value must match the pattern of
  /// integration.response.header.{name} or
  /// integration.response.body.{JSON-expression}, where name is a valid and
  /// unique response header name and JSON-expression is a valid JSON expression
  /// without the $ prefix.
  final Map<String, String> responseParameters;

  /// The collection of response templates for the integration response as a
  /// string-to-string map of key-value pairs. Response templates are
  /// represented as a key/value map, with a content-type as the key and a
  /// template as the value.
  final Map<String, String> responseTemplates;

  /// The template selection expressions for the integration response.
  final String templateSelectionExpression;

  GetIntegrationResponseResponse({
    this.contentHandlingStrategy,
    this.integrationResponseId,
    this.integrationResponseKey,
    this.responseParameters,
    this.responseTemplates,
    this.templateSelectionExpression,
  });
  static GetIntegrationResponseResponse fromJson(Map<String, dynamic> json) =>
      GetIntegrationResponseResponse(
        contentHandlingStrategy: json.containsKey('ContentHandlingStrategy')
            ? json['ContentHandlingStrategy'] as String
            : null,
        integrationResponseId: json.containsKey('IntegrationResponseId')
            ? json['IntegrationResponseId'] as String
            : null,
        integrationResponseKey: json.containsKey('IntegrationResponseKey')
            ? json['IntegrationResponseKey'] as String
            : null,
        responseParameters: json.containsKey('ResponseParameters')
            ? (json['ResponseParameters'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        responseTemplates: json.containsKey('ResponseTemplates')
            ? (json['ResponseTemplates'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        templateSelectionExpression:
            json.containsKey('TemplateSelectionExpression')
                ? json['TemplateSelectionExpression'] as String
                : null,
      );
}

class GetIntegrationResponsesResponse {
  /// The elements from this collection.
  final List<IntegrationResponse> items;

  /// The next page of elements from this collection. Not valid for the last
  /// element of the collection.
  final String nextToken;

  GetIntegrationResponsesResponse({
    this.items,
    this.nextToken,
  });
  static GetIntegrationResponsesResponse fromJson(Map<String, dynamic> json) =>
      GetIntegrationResponsesResponse(
        items: json.containsKey('Items')
            ? (json['Items'] as List)
                .map((e) => IntegrationResponse.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class GetIntegrationsResponse {
  /// The elements from this collection.
  final List<Integration> items;

  /// The next page of elements from this collection. Not valid for the last
  /// element of the collection.
  final String nextToken;

  GetIntegrationsResponse({
    this.items,
    this.nextToken,
  });
  static GetIntegrationsResponse fromJson(Map<String, dynamic> json) =>
      GetIntegrationsResponse(
        items: json.containsKey('Items')
            ? (json['Items'] as List)
                .map((e) => Integration.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class GetModelResponse {
  /// The content-type for the model, for example, "application/json".
  final String contentType;

  /// The description of the model.
  final String description;

  /// The model identifier.
  final String modelId;

  /// The name of the model. Must be alphanumeric.
  final String name;

  /// The schema for the model. For application/json models, this should be JSON
  /// schema draft 4 model.
  final String schema;

  GetModelResponse({
    this.contentType,
    this.description,
    this.modelId,
    this.name,
    this.schema,
  });
  static GetModelResponse fromJson(Map<String, dynamic> json) =>
      GetModelResponse(
        contentType: json.containsKey('ContentType')
            ? json['ContentType'] as String
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        modelId: json.containsKey('ModelId') ? json['ModelId'] as String : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        schema: json.containsKey('Schema') ? json['Schema'] as String : null,
      );
}

class GetModelTemplateResponse {
  /// The template value.
  final String value;

  GetModelTemplateResponse({
    this.value,
  });
  static GetModelTemplateResponse fromJson(Map<String, dynamic> json) =>
      GetModelTemplateResponse(
        value: json.containsKey('Value') ? json['Value'] as String : null,
      );
}

class GetModelsResponse {
  /// The elements from this collection.
  final List<Model> items;

  /// The next page of elements from this collection. Not valid for the last
  /// element of the collection.
  final String nextToken;

  GetModelsResponse({
    this.items,
    this.nextToken,
  });
  static GetModelsResponse fromJson(Map<String, dynamic> json) =>
      GetModelsResponse(
        items: json.containsKey('Items')
            ? (json['Items'] as List).map((e) => Model.fromJson(e)).toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class GetRouteResponse {
  /// Specifies whether an API key is required for this route.
  final bool apiKeyRequired;

  /// A list of authorization scopes configured on a route. The scopes are used
  /// with a COGNITO_USER_POOLS authorizer to authorize the method invocation.
  /// The authorization works by matching the route scopes against the scopes
  /// parsed from the access token in the incoming request. The method
  /// invocation is authorized if any route scope matches a claimed scope in the
  /// access token. Otherwise, the invocation is not authorized. When the route
  /// scope is configured, the client must provide an access token instead of an
  /// identity token for authorization purposes.
  final List<String> authorizationScopes;

  /// The authorization type for the route. Valid values are NONE for open
  /// access, AWS_IAM for using AWS IAM permissions, and CUSTOM for using a
  /// Lambda authorizer
  final String authorizationType;

  /// The identifier of the Authorizer resource to be associated with this
  /// route, if the authorizationType is CUSTOM . The authorizer identifier is
  /// generated by API Gateway when you created the authorizer.
  final String authorizerId;

  /// The model selection expression for the route.
  final String modelSelectionExpression;

  /// The operation name for the route.
  final String operationName;

  /// The request models for the route.
  final Map<String, String> requestModels;

  /// The request parameters for the route.
  final Map<String, ParameterConstraints> requestParameters;

  /// The route ID.
  final String routeId;

  /// The route key for the route.
  final String routeKey;

  /// The route response selection expression for the route.
  final String routeResponseSelectionExpression;

  /// The target for the route.
  final String target;

  GetRouteResponse({
    this.apiKeyRequired,
    this.authorizationScopes,
    this.authorizationType,
    this.authorizerId,
    this.modelSelectionExpression,
    this.operationName,
    this.requestModels,
    this.requestParameters,
    this.routeId,
    this.routeKey,
    this.routeResponseSelectionExpression,
    this.target,
  });
  static GetRouteResponse fromJson(Map<String, dynamic> json) =>
      GetRouteResponse(
        apiKeyRequired: json.containsKey('ApiKeyRequired')
            ? json['ApiKeyRequired'] as bool
            : null,
        authorizationScopes: json.containsKey('AuthorizationScopes')
            ? (json['AuthorizationScopes'] as List)
                .map((e) => e as String)
                .toList()
            : null,
        authorizationType: json.containsKey('AuthorizationType')
            ? json['AuthorizationType'] as String
            : null,
        authorizerId: json.containsKey('AuthorizerId')
            ? json['AuthorizerId'] as String
            : null,
        modelSelectionExpression: json.containsKey('ModelSelectionExpression')
            ? json['ModelSelectionExpression'] as String
            : null,
        operationName: json.containsKey('OperationName')
            ? json['OperationName'] as String
            : null,
        requestModels: json.containsKey('RequestModels')
            ? (json['RequestModels'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        requestParameters: json.containsKey('RequestParameters')
            ? (json['RequestParameters'] as Map).map((k, v) =>
                MapEntry(k as String, ParameterConstraints.fromJson(v)))
            : null,
        routeId: json.containsKey('RouteId') ? json['RouteId'] as String : null,
        routeKey:
            json.containsKey('RouteKey') ? json['RouteKey'] as String : null,
        routeResponseSelectionExpression:
            json.containsKey('RouteResponseSelectionExpression')
                ? json['RouteResponseSelectionExpression'] as String
                : null,
        target: json.containsKey('Target') ? json['Target'] as String : null,
      );
}

class GetRouteResponseResponse {
  /// Represents the model selection expression of a route response.
  final String modelSelectionExpression;

  /// Represents the response models of a route response.
  final Map<String, String> responseModels;

  /// Represents the response parameters of a route response.
  final Map<String, ParameterConstraints> responseParameters;

  /// Represents the identifier of a route response.
  final String routeResponseId;

  /// Represents the route response key of a route response.
  final String routeResponseKey;

  GetRouteResponseResponse({
    this.modelSelectionExpression,
    this.responseModels,
    this.responseParameters,
    this.routeResponseId,
    this.routeResponseKey,
  });
  static GetRouteResponseResponse fromJson(Map<String, dynamic> json) =>
      GetRouteResponseResponse(
        modelSelectionExpression: json.containsKey('ModelSelectionExpression')
            ? json['ModelSelectionExpression'] as String
            : null,
        responseModels: json.containsKey('ResponseModels')
            ? (json['ResponseModels'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        responseParameters: json.containsKey('ResponseParameters')
            ? (json['ResponseParameters'] as Map).map((k, v) =>
                MapEntry(k as String, ParameterConstraints.fromJson(v)))
            : null,
        routeResponseId: json.containsKey('RouteResponseId')
            ? json['RouteResponseId'] as String
            : null,
        routeResponseKey: json.containsKey('RouteResponseKey')
            ? json['RouteResponseKey'] as String
            : null,
      );
}

class GetRouteResponsesResponse {
  /// The elements from this collection.
  final List<RouteResponse> items;

  /// The next page of elements from this collection. Not valid for the last
  /// element of the collection.
  final String nextToken;

  GetRouteResponsesResponse({
    this.items,
    this.nextToken,
  });
  static GetRouteResponsesResponse fromJson(Map<String, dynamic> json) =>
      GetRouteResponsesResponse(
        items: json.containsKey('Items')
            ? (json['Items'] as List)
                .map((e) => RouteResponse.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class GetRoutesResponse {
  /// The elements from this collection.
  final List<Route> items;

  /// The next page of elements from this collection. Not valid for the last
  /// element of the collection.
  final String nextToken;

  GetRoutesResponse({
    this.items,
    this.nextToken,
  });
  static GetRoutesResponse fromJson(Map<String, dynamic> json) =>
      GetRoutesResponse(
        items: json.containsKey('Items')
            ? (json['Items'] as List).map((e) => Route.fromJson(e)).toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class GetStageResponse {
  /// Settings for logging access in this stage.
  final AccessLogSettings accessLogSettings;

  /// The identifier of a client certificate for a Stage.
  final String clientCertificateId;

  /// The timestamp when the stage was created.
  final DateTime createdDate;

  /// Default route settings for the stage.
  final RouteSettings defaultRouteSettings;

  /// The identifier of the Deployment that the Stage is associated with.
  final String deploymentId;

  /// The description of the stage.
  final String description;

  /// The timestamp when the stage was last updated.
  final DateTime lastUpdatedDate;

  /// Route settings for the stage.
  final Map<String, RouteSettings> routeSettings;

  /// The name of the stage.
  final String stageName;

  /// A map that defines the stage variables for a stage resource. Variable
  /// names can have alphanumeric and underscore characters, and the values must
  /// match [A-Za-z0-9-._~:/?#&=,]+.
  final Map<String, String> stageVariables;

  /// The key-value map of strings. The valid character set is [a-zA-Z+-=._:/].
  /// The tag key can be up to 128 characters and must not start with aws:. The
  /// tag value can be up to 256 characters..
  final Map<String, String> tags;

  GetStageResponse({
    this.accessLogSettings,
    this.clientCertificateId,
    this.createdDate,
    this.defaultRouteSettings,
    this.deploymentId,
    this.description,
    this.lastUpdatedDate,
    this.routeSettings,
    this.stageName,
    this.stageVariables,
    this.tags,
  });
  static GetStageResponse fromJson(Map<String, dynamic> json) =>
      GetStageResponse(
        accessLogSettings: json.containsKey('AccessLogSettings')
            ? AccessLogSettings.fromJson(json['AccessLogSettings'])
            : null,
        clientCertificateId: json.containsKey('ClientCertificateId')
            ? json['ClientCertificateId'] as String
            : null,
        createdDate: json.containsKey('CreatedDate')
            ? DateTime.parse(json['CreatedDate'])
            : null,
        defaultRouteSettings: json.containsKey('DefaultRouteSettings')
            ? RouteSettings.fromJson(json['DefaultRouteSettings'])
            : null,
        deploymentId: json.containsKey('DeploymentId')
            ? json['DeploymentId'] as String
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        lastUpdatedDate: json.containsKey('LastUpdatedDate')
            ? DateTime.parse(json['LastUpdatedDate'])
            : null,
        routeSettings: json.containsKey('RouteSettings')
            ? (json['RouteSettings'] as Map)
                .map((k, v) => MapEntry(k as String, RouteSettings.fromJson(v)))
            : null,
        stageName:
            json.containsKey('StageName') ? json['StageName'] as String : null,
        stageVariables: json.containsKey('StageVariables')
            ? (json['StageVariables'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

class GetStagesResponse {
  /// The elements from this collection.
  final List<Stage> items;

  /// The next page of elements from this collection. Not valid for the last
  /// element of the collection.
  final String nextToken;

  GetStagesResponse({
    this.items,
    this.nextToken,
  });
  static GetStagesResponse fromJson(Map<String, dynamic> json) =>
      GetStagesResponse(
        items: json.containsKey('Items')
            ? (json['Items'] as List).map((e) => Stage.fromJson(e)).toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// Represents an integration.
class Integration {
  /// The connection ID.
  final String connectionId;

  /// The type of the network connection to the integration endpoint. Currently
  /// the only valid value is INTERNET, for connections through the public
  /// routable internet.
  final String connectionType;

  /// Specifies how to handle response payload content type conversions.
  /// Supported values are CONVERT_TO_BINARY and CONVERT_TO_TEXT, with the
  /// following behaviors:
  ///
  ///  CONVERT_TO_BINARY: Converts a response payload from a Base64-encoded
  /// string to the corresponding binary blob.
  ///
  ///  CONVERT_TO_TEXT: Converts a response payload from a binary blob to a
  /// Base64-encoded string.
  ///
  /// If this property is not defined, the response payload will be passed
  /// through from the integration response to the route response or method
  /// response without modification.
  final String contentHandlingStrategy;

  /// Specifies the credentials required for the integration, if any. For AWS
  /// integrations, three options are available. To specify an IAM Role for API
  /// Gateway to assume, use the role's Amazon Resource Name (ARN). To require
  /// that the caller's identity be passed through from the request, specify the
  /// string arn:aws:iam::*:user/*. To use resource-based permissions on
  /// supported AWS services, specify null.
  final String credentialsArn;

  /// Represents the description of an integration.
  final String description;

  /// Represents the identifier of an integration.
  final String integrationId;

  /// Specifies the integration's HTTP method type.
  final String integrationMethod;

  /// The integration response selection expression for the integration. See
  /// [Integration Response Selection Expressions](https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-websocket-api-selection-expressions.html#apigateway-websocket-api-integration-response-selection-expressions).
  final String integrationResponseSelectionExpression;

  /// The integration type of an integration. One of the following:
  ///
  ///  AWS: for integrating the route or method request with an AWS service
  /// action, including the Lambda function-invoking action. With the Lambda
  /// function-invoking action, this is referred to as the Lambda custom
  /// integration. With any other AWS service action, this is known as AWS
  /// integration.
  ///
  ///  AWS_PROXY: for integrating the route or method request with the Lambda
  /// function-invoking action with the client request passed through as-is.
  /// This integration is also referred to as Lambda proxy integration.
  ///
  ///  HTTP: for integrating the route or method request with an HTTP endpoint.
  /// This integration is also referred to as the HTTP custom integration.
  ///
  ///  HTTP_PROXY: for integrating route or method request with an HTTP
  /// endpoint, with the client request passed through as-is. This is also
  /// referred to as HTTP proxy integration.
  ///
  ///  MOCK: for integrating the route or method request with API Gateway as a
  /// "loopback" endpoint without invoking any backend.
  final String integrationType;

  /// For a Lambda proxy integration, this is the URI of the Lambda function.
  final String integrationUri;

  /// Specifies the pass-through behavior for incoming requests based on the
  /// Content-Type header in the request, and the available mapping templates
  /// specified as the requestTemplates property on the Integration resource.
  /// There are three valid values: WHEN_NO_MATCH, WHEN_NO_TEMPLATES, and NEVER.
  ///
  ///  WHEN_NO_MATCH passes the request body for unmapped content types through
  /// to the integration backend without transformation.
  ///
  ///  NEVER rejects unmapped content types with an HTTP 415 Unsupported Media
  /// Type response.
  ///
  ///  WHEN_NO_TEMPLATES allows pass-through when the integration has no content
  /// types mapped to templates. However, if there is at least one content type
  /// defined, unmapped content types will be rejected with the same HTTP 415
  /// Unsupported Media Type response.
  final String passthroughBehavior;

  /// A key-value map specifying request parameters that are passed from the
  /// method request to the backend. The key is an integration request parameter
  /// name and the associated value is a method request parameter value or
  /// static value that must be enclosed within single quotes and pre-encoded as
  /// required by the backend. The method request parameter value must match the
  /// pattern of method.request.{location}.{name} , where {location} is
  /// querystring, path, or header; and {name} must be a valid and unique method
  /// request parameter name.
  final Map<String, String> requestParameters;

  /// Represents a map of Velocity templates that are applied on the request
  /// payload based on the value of the Content-Type header sent by the client.
  /// The content type value is the key in this map, and the template (as a
  /// String) is the value.
  final Map<String, String> requestTemplates;

  /// The template selection expression for the integration.
  final String templateSelectionExpression;

  /// Custom timeout between 50 and 29,000 milliseconds. The default value is
  /// 29,000 milliseconds or 29 seconds.
  final int timeoutInMillis;

  Integration({
    this.connectionId,
    this.connectionType,
    this.contentHandlingStrategy,
    this.credentialsArn,
    this.description,
    this.integrationId,
    this.integrationMethod,
    this.integrationResponseSelectionExpression,
    this.integrationType,
    this.integrationUri,
    this.passthroughBehavior,
    this.requestParameters,
    this.requestTemplates,
    this.templateSelectionExpression,
    this.timeoutInMillis,
  });
  static Integration fromJson(Map<String, dynamic> json) => Integration(
        connectionId: json.containsKey('ConnectionId')
            ? json['ConnectionId'] as String
            : null,
        connectionType: json.containsKey('ConnectionType')
            ? json['ConnectionType'] as String
            : null,
        contentHandlingStrategy: json.containsKey('ContentHandlingStrategy')
            ? json['ContentHandlingStrategy'] as String
            : null,
        credentialsArn: json.containsKey('CredentialsArn')
            ? json['CredentialsArn'] as String
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        integrationId: json.containsKey('IntegrationId')
            ? json['IntegrationId'] as String
            : null,
        integrationMethod: json.containsKey('IntegrationMethod')
            ? json['IntegrationMethod'] as String
            : null,
        integrationResponseSelectionExpression:
            json.containsKey('IntegrationResponseSelectionExpression')
                ? json['IntegrationResponseSelectionExpression'] as String
                : null,
        integrationType: json.containsKey('IntegrationType')
            ? json['IntegrationType'] as String
            : null,
        integrationUri: json.containsKey('IntegrationUri')
            ? json['IntegrationUri'] as String
            : null,
        passthroughBehavior: json.containsKey('PassthroughBehavior')
            ? json['PassthroughBehavior'] as String
            : null,
        requestParameters: json.containsKey('RequestParameters')
            ? (json['RequestParameters'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        requestTemplates: json.containsKey('RequestTemplates')
            ? (json['RequestTemplates'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        templateSelectionExpression:
            json.containsKey('TemplateSelectionExpression')
                ? json['TemplateSelectionExpression'] as String
                : null,
        timeoutInMillis: json.containsKey('TimeoutInMillis')
            ? json['TimeoutInMillis'] as int
            : null,
      );
}

/// Represents an integration response.
class IntegrationResponse {
  /// Specifies how to handle response payload content type conversions.
  /// Supported values are CONVERT_TO_BINARY and CONVERT_TO_TEXT, with the
  /// following behaviors:
  ///
  ///  CONVERT_TO_BINARY: Converts a response payload from a Base64-encoded
  /// string to the corresponding binary blob.
  ///
  ///  CONVERT_TO_TEXT: Converts a response payload from a binary blob to a
  /// Base64-encoded string.
  ///
  /// If this property is not defined, the response payload will be passed
  /// through from the integration response to the route response or method
  /// response without modification.
  final String contentHandlingStrategy;

  /// The integration response ID.
  final String integrationResponseId;

  /// The integration response key.
  final String integrationResponseKey;

  /// A key-value map specifying response parameters that are passed to the
  /// method response from the backend. The key is a method response header
  /// parameter name and the mapped value is an integration response header
  /// value, a static value enclosed within a pair of single quotes, or a JSON
  /// expression from the integration response body. The mapping key must match
  /// the pattern of method.response.header.{name}, where name is a valid and
  /// unique header name. The mapped non-static value must match the pattern of
  /// integration.response.header.{name} or
  /// integration.response.body.{JSON-expression}, where name is a valid and
  /// unique response header name and JSON-expression is a valid JSON expression
  /// without the $ prefix.
  final Map<String, String> responseParameters;

  /// The collection of response templates for the integration response as a
  /// string-to-string map of key-value pairs. Response templates are
  /// represented as a key/value map, with a content-type as the key and a
  /// template as the value.
  final Map<String, String> responseTemplates;

  /// The template selection expressions for the integration response.
  final String templateSelectionExpression;

  IntegrationResponse({
    this.contentHandlingStrategy,
    this.integrationResponseId,
    @required this.integrationResponseKey,
    this.responseParameters,
    this.responseTemplates,
    this.templateSelectionExpression,
  });
  static IntegrationResponse fromJson(Map<String, dynamic> json) =>
      IntegrationResponse(
        contentHandlingStrategy: json.containsKey('ContentHandlingStrategy')
            ? json['ContentHandlingStrategy'] as String
            : null,
        integrationResponseId: json.containsKey('IntegrationResponseId')
            ? json['IntegrationResponseId'] as String
            : null,
        integrationResponseKey: json['IntegrationResponseKey'] as String,
        responseParameters: json.containsKey('ResponseParameters')
            ? (json['ResponseParameters'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        responseTemplates: json.containsKey('ResponseTemplates')
            ? (json['ResponseTemplates'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        templateSelectionExpression:
            json.containsKey('TemplateSelectionExpression')
                ? json['TemplateSelectionExpression'] as String
                : null,
      );
}

class GetTagsResponse {
  final Map<String, String> tags;

  GetTagsResponse({
    this.tags,
  });
  static GetTagsResponse fromJson(Map<String, dynamic> json) => GetTagsResponse(
        tags: json.containsKey('Tags')
            ? (json['Tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

/// Represents a data model for an API. See
/// [Create Models and Mapping Templates for Request and Response Mappings](https://docs.aws.amazon.com/apigateway/latest/developerguide/models-mappings.html).
class Model {
  /// The content-type for the model, for example, "application/json".
  final String contentType;

  /// The description of the model.
  final String description;

  /// The model identifier.
  final String modelId;

  /// The name of the model. Must be alphanumeric.
  final String name;

  /// The schema for the model. For application/json models, this should be JSON
  /// schema draft 4 model.
  final String schema;

  Model({
    this.contentType,
    this.description,
    this.modelId,
    @required this.name,
    this.schema,
  });
  static Model fromJson(Map<String, dynamic> json) => Model(
        contentType: json.containsKey('ContentType')
            ? json['ContentType'] as String
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        modelId: json.containsKey('ModelId') ? json['ModelId'] as String : null,
        name: json['Name'] as String,
        schema: json.containsKey('Schema') ? json['Schema'] as String : null,
      );
}

/// Validation constraints imposed on parameters of a request (path, query
/// string, headers).
class ParameterConstraints {
  /// Whether or not the parameter is required.
  final bool isRequired;

  ParameterConstraints({
    this.isRequired,
  });
  static ParameterConstraints fromJson(Map<String, dynamic> json) =>
      ParameterConstraints(
        isRequired:
            json.containsKey('Required') ? json['Required'] as bool : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Represents a route.
class Route {
  /// Specifies whether an API key is required for this route.
  final bool apiKeyRequired;

  /// A list of authorization scopes configured on a route. The scopes are used
  /// with a COGNITO_USER_POOLS authorizer to authorize the method invocation.
  /// The authorization works by matching the route scopes against the scopes
  /// parsed from the access token in the incoming request. The method
  /// invocation is authorized if any route scope matches a claimed scope in the
  /// access token. Otherwise, the invocation is not authorized. When the route
  /// scope is configured, the client must provide an access token instead of an
  /// identity token for authorization purposes.
  final List<String> authorizationScopes;

  /// The authorization type for the route. Valid values are NONE for open
  /// access, AWS_IAM for using AWS IAM permissions, and CUSTOM for using a
  /// Lambda authorizer
  final String authorizationType;

  /// The identifier of the Authorizer resource to be associated with this
  /// route, if the authorizationType is CUSTOM . The authorizer identifier is
  /// generated by API Gateway when you created the authorizer.
  final String authorizerId;

  /// The model selection expression for the route.
  final String modelSelectionExpression;

  /// The operation name for the route.
  final String operationName;

  /// The request models for the route.
  final Map<String, String> requestModels;

  /// The request parameters for the route.
  final Map<String, ParameterConstraints> requestParameters;

  /// The route ID.
  final String routeId;

  /// The route key for the route.
  final String routeKey;

  /// The route response selection expression for the route.
  final String routeResponseSelectionExpression;

  /// The target for the route.
  final String target;

  Route({
    this.apiKeyRequired,
    this.authorizationScopes,
    this.authorizationType,
    this.authorizerId,
    this.modelSelectionExpression,
    this.operationName,
    this.requestModels,
    this.requestParameters,
    this.routeId,
    @required this.routeKey,
    this.routeResponseSelectionExpression,
    this.target,
  });
  static Route fromJson(Map<String, dynamic> json) => Route(
        apiKeyRequired: json.containsKey('ApiKeyRequired')
            ? json['ApiKeyRequired'] as bool
            : null,
        authorizationScopes: json.containsKey('AuthorizationScopes')
            ? (json['AuthorizationScopes'] as List)
                .map((e) => e as String)
                .toList()
            : null,
        authorizationType: json.containsKey('AuthorizationType')
            ? json['AuthorizationType'] as String
            : null,
        authorizerId: json.containsKey('AuthorizerId')
            ? json['AuthorizerId'] as String
            : null,
        modelSelectionExpression: json.containsKey('ModelSelectionExpression')
            ? json['ModelSelectionExpression'] as String
            : null,
        operationName: json.containsKey('OperationName')
            ? json['OperationName'] as String
            : null,
        requestModels: json.containsKey('RequestModels')
            ? (json['RequestModels'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        requestParameters: json.containsKey('RequestParameters')
            ? (json['RequestParameters'] as Map).map((k, v) =>
                MapEntry(k as String, ParameterConstraints.fromJson(v)))
            : null,
        routeId: json.containsKey('RouteId') ? json['RouteId'] as String : null,
        routeKey: json['RouteKey'] as String,
        routeResponseSelectionExpression:
            json.containsKey('RouteResponseSelectionExpression')
                ? json['RouteResponseSelectionExpression'] as String
                : null,
        target: json.containsKey('Target') ? json['Target'] as String : null,
      );
}

/// Represents a route response.
class RouteResponse {
  /// Represents the model selection expression of a route response.
  final String modelSelectionExpression;

  /// Represents the response models of a route response.
  final Map<String, String> responseModels;

  /// Represents the response parameters of a route response.
  final Map<String, ParameterConstraints> responseParameters;

  /// Represents the identifier of a route response.
  final String routeResponseId;

  /// Represents the route response key of a route response.
  final String routeResponseKey;

  RouteResponse({
    this.modelSelectionExpression,
    this.responseModels,
    this.responseParameters,
    this.routeResponseId,
    @required this.routeResponseKey,
  });
  static RouteResponse fromJson(Map<String, dynamic> json) => RouteResponse(
        modelSelectionExpression: json.containsKey('ModelSelectionExpression')
            ? json['ModelSelectionExpression'] as String
            : null,
        responseModels: json.containsKey('ResponseModels')
            ? (json['ResponseModels'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        responseParameters: json.containsKey('ResponseParameters')
            ? (json['ResponseParameters'] as Map).map((k, v) =>
                MapEntry(k as String, ParameterConstraints.fromJson(v)))
            : null,
        routeResponseId: json.containsKey('RouteResponseId')
            ? json['RouteResponseId'] as String
            : null,
        routeResponseKey: json['RouteResponseKey'] as String,
      );
}

/// Represents a collection of route settings.
class RouteSettings {
  /// Specifies whether (true) or not (false) data trace logging is enabled for
  /// this route. This property affects the log entries pushed to Amazon
  /// CloudWatch Logs.
  final bool dataTraceEnabled;

  /// Specifies whether detailed metrics are enabled.
  final bool detailedMetricsEnabled;

  /// Specifies the logging level for this route: DEBUG, INFO, or WARN. This
  /// property affects the log entries pushed to Amazon CloudWatch Logs.
  final String loggingLevel;

  /// Specifies the throttling burst limit.
  final int throttlingBurstLimit;

  /// Specifies the throttling rate limit.
  final double throttlingRateLimit;

  RouteSettings({
    this.dataTraceEnabled,
    this.detailedMetricsEnabled,
    this.loggingLevel,
    this.throttlingBurstLimit,
    this.throttlingRateLimit,
  });
  static RouteSettings fromJson(Map<String, dynamic> json) => RouteSettings(
        dataTraceEnabled: json.containsKey('DataTraceEnabled')
            ? json['DataTraceEnabled'] as bool
            : null,
        detailedMetricsEnabled: json.containsKey('DetailedMetricsEnabled')
            ? json['DetailedMetricsEnabled'] as bool
            : null,
        loggingLevel: json.containsKey('LoggingLevel')
            ? json['LoggingLevel'] as String
            : null,
        throttlingBurstLimit: json.containsKey('ThrottlingBurstLimit')
            ? json['ThrottlingBurstLimit'] as int
            : null,
        throttlingRateLimit: json.containsKey('ThrottlingRateLimit')
            ? json['ThrottlingRateLimit'] as double
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Represents an API stage.
class Stage {
  /// Settings for logging access in this stage.
  final AccessLogSettings accessLogSettings;

  /// The identifier of a client certificate for a Stage.
  final String clientCertificateId;

  /// The timestamp when the stage was created.
  final DateTime createdDate;

  /// Default route settings for the stage.
  final RouteSettings defaultRouteSettings;

  /// The identifier of the Deployment that the Stage is associated with.
  final String deploymentId;

  /// The description of the stage.
  final String description;

  /// The timestamp when the stage was last updated.
  final DateTime lastUpdatedDate;

  /// Route settings for the stage.
  final Map<String, RouteSettings> routeSettings;

  /// The name of the stage.
  final String stageName;

  /// A map that defines the stage variables for a stage resource. Variable
  /// names can have alphanumeric and underscore characters, and the values must
  /// match [A-Za-z0-9-._~:/?#&=,]+.
  final Map<String, String> stageVariables;

  /// The key-value map of strings. The valid character set is [a-zA-Z+-=._:/].
  /// The tag key can be up to 128 characters and must not start with aws:. The
  /// tag value can be up to 256 characters..
  final Map<String, String> tags;

  Stage({
    this.accessLogSettings,
    this.clientCertificateId,
    this.createdDate,
    this.defaultRouteSettings,
    this.deploymentId,
    this.description,
    this.lastUpdatedDate,
    this.routeSettings,
    @required this.stageName,
    this.stageVariables,
    this.tags,
  });
  static Stage fromJson(Map<String, dynamic> json) => Stage(
        accessLogSettings: json.containsKey('AccessLogSettings')
            ? AccessLogSettings.fromJson(json['AccessLogSettings'])
            : null,
        clientCertificateId: json.containsKey('ClientCertificateId')
            ? json['ClientCertificateId'] as String
            : null,
        createdDate: json.containsKey('CreatedDate')
            ? DateTime.parse(json['CreatedDate'])
            : null,
        defaultRouteSettings: json.containsKey('DefaultRouteSettings')
            ? RouteSettings.fromJson(json['DefaultRouteSettings'])
            : null,
        deploymentId: json.containsKey('DeploymentId')
            ? json['DeploymentId'] as String
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        lastUpdatedDate: json.containsKey('LastUpdatedDate')
            ? DateTime.parse(json['LastUpdatedDate'])
            : null,
        routeSettings: json.containsKey('RouteSettings')
            ? (json['RouteSettings'] as Map)
                .map((k, v) => MapEntry(k as String, RouteSettings.fromJson(v)))
            : null,
        stageName: json['StageName'] as String,
        stageVariables: json.containsKey('StageVariables')
            ? (json['StageVariables'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

class TagResourceResponse {
  TagResourceResponse();
  static TagResourceResponse fromJson(Map<String, dynamic> json) =>
      TagResourceResponse();
}

class UpdateApiMappingResponse {
  /// The API identifier.
  final String apiId;

  /// The API mapping identifier.
  final String apiMappingId;

  /// The API mapping key.
  final String apiMappingKey;

  /// The API stage.
  final String stage;

  UpdateApiMappingResponse({
    this.apiId,
    this.apiMappingId,
    this.apiMappingKey,
    this.stage,
  });
  static UpdateApiMappingResponse fromJson(Map<String, dynamic> json) =>
      UpdateApiMappingResponse(
        apiId: json.containsKey('ApiId') ? json['ApiId'] as String : null,
        apiMappingId: json.containsKey('ApiMappingId')
            ? json['ApiMappingId'] as String
            : null,
        apiMappingKey: json.containsKey('ApiMappingKey')
            ? json['ApiMappingKey'] as String
            : null,
        stage: json.containsKey('Stage') ? json['Stage'] as String : null,
      );
}

class UpdateApiResponse {
  /// The URI of the API, of the form
  /// {api-id}.execute-api.{region}.amazonaws.com. The stage name is typically
  /// appended to this URI to form a complete path to a deployed API stage.
  final String apiEndpoint;

  /// The API ID.
  final String apiId;

  /// An API key selection expression. See
  /// [API Key Selection Expressions](https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-websocket-api-selection-expressions.html#apigateway-websocket-api-apikey-selection-expressions).
  final String apiKeySelectionExpression;

  /// The timestamp when the API was created.
  final DateTime createdDate;

  /// The description of the API.
  final String description;

  /// Avoid validating models when creating a deployment.
  final bool disableSchemaValidation;

  /// The name of the API.
  final String name;

  /// The API protocol: Currently only WEBSOCKET is supported.
  final String protocolType;

  /// The route selection expression for the API.
  final String routeSelectionExpression;

  /// A version identifier for the API.
  final String version;

  /// The warning messages reported when failonwarnings is turned on during API
  /// import.
  final List<String> warnings;

  /// The key-value map of strings. The valid character set is [a-zA-Z+-=._:/].
  /// The tag key can be up to 128 characters and must not start with aws:. The
  /// tag value can be up to 256 characters..
  final Map<String, String> tags;

  UpdateApiResponse({
    this.apiEndpoint,
    this.apiId,
    this.apiKeySelectionExpression,
    this.createdDate,
    this.description,
    this.disableSchemaValidation,
    this.name,
    this.protocolType,
    this.routeSelectionExpression,
    this.version,
    this.warnings,
    this.tags,
  });
  static UpdateApiResponse fromJson(Map<String, dynamic> json) =>
      UpdateApiResponse(
        apiEndpoint: json.containsKey('ApiEndpoint')
            ? json['ApiEndpoint'] as String
            : null,
        apiId: json.containsKey('ApiId') ? json['ApiId'] as String : null,
        apiKeySelectionExpression: json.containsKey('ApiKeySelectionExpression')
            ? json['ApiKeySelectionExpression'] as String
            : null,
        createdDate: json.containsKey('CreatedDate')
            ? DateTime.parse(json['CreatedDate'])
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        disableSchemaValidation: json.containsKey('DisableSchemaValidation')
            ? json['DisableSchemaValidation'] as bool
            : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        protocolType: json.containsKey('ProtocolType')
            ? json['ProtocolType'] as String
            : null,
        routeSelectionExpression: json.containsKey('RouteSelectionExpression')
            ? json['RouteSelectionExpression'] as String
            : null,
        version: json.containsKey('Version') ? json['Version'] as String : null,
        warnings: json.containsKey('Warnings')
            ? (json['Warnings'] as List).map((e) => e as String).toList()
            : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

class UpdateAuthorizerResponse {
  /// Specifies the required credentials as an IAM role for API Gateway to
  /// invoke the authorizer. To specify an IAM role for API Gateway to assume,
  /// use the role's Amazon Resource Name (ARN). To use resource-based
  /// permissions on the Lambda function, specify null.
  final String authorizerCredentialsArn;

  /// The authorizer identifier.
  final String authorizerId;

  /// The time to live (TTL), in seconds, of cached authorizer results. If it
  /// equals 0, authorization caching is disabled. If it is greater than 0, API
  /// Gateway will cache authorizer responses. If this field is not set, the
  /// default value is 300. The maximum value is 3600, or 1 hour.
  final int authorizerResultTtlInSeconds;

  /// The authorizer type. Currently the only valid value is REQUEST, for a
  /// Lambda function using incoming request parameters.
  final String authorizerType;

  /// The authorizer's Uniform Resource Identifier (URI). ForREQUEST
  /// authorizers, this must be a well-formed Lambda function URI, for example,
  /// arn:aws:apigateway:us-west-2:lambda:path/2015-03-31/functions/arn:aws:lambda:us-west-2:{account_id}:function:{lambda_function_name}/invocations.
  /// In general, the URI has this form:
  /// arn:aws:apigateway:{region}:lambda:path/{service_api} , where {region} is
  /// the same as the region hosting the Lambda function, path indicates that
  /// the remaining substring in the URI should be treated as the path to the
  /// resource, including the initial /. For Lambda functions, this is usually
  /// of the form /2015-03-31/functions/[FunctionARN]/invocations.
  final String authorizerUri;

  /// The identity source for which authorization is requested.
  ///
  /// For the REQUEST authorizer, this is required when authorization caching is
  /// enabled. The value is a comma-separated string of one or more mapping
  /// expressions of the specified request parameters. For example, if an Auth
  /// header and a Name query string parameters are defined as identity sources,
  /// this value is method.request.header.Auth, method.request.querystring.Name.
  /// These parameters will be used to derive the authorization caching key and
  /// to perform runtime validation of the REQUEST authorizer by verifying all
  /// of the identity-related request parameters are present, not null, and
  /// non-empty. Only when this is true does the authorizer invoke the
  /// authorizer Lambda function, otherwise, it returns a 401 Unauthorized
  /// response without calling the Lambda function. The valid value is a string
  /// of comma-separated mapping expressions of the specified request
  /// parameters. When the authorization caching is not enabled, this property
  /// is optional.
  final List<String> identitySource;

  /// The validation expression does not apply to the REQUEST authorizer.
  final String identityValidationExpression;

  /// The name of the authorizer.
  final String name;

  /// For REQUEST authorizer, this is not defined.
  final List<String> providerArns;

  UpdateAuthorizerResponse({
    this.authorizerCredentialsArn,
    this.authorizerId,
    this.authorizerResultTtlInSeconds,
    this.authorizerType,
    this.authorizerUri,
    this.identitySource,
    this.identityValidationExpression,
    this.name,
    this.providerArns,
  });
  static UpdateAuthorizerResponse fromJson(Map<String, dynamic> json) =>
      UpdateAuthorizerResponse(
        authorizerCredentialsArn: json.containsKey('AuthorizerCredentialsArn')
            ? json['AuthorizerCredentialsArn'] as String
            : null,
        authorizerId: json.containsKey('AuthorizerId')
            ? json['AuthorizerId'] as String
            : null,
        authorizerResultTtlInSeconds:
            json.containsKey('AuthorizerResultTtlInSeconds')
                ? json['AuthorizerResultTtlInSeconds'] as int
                : null,
        authorizerType: json.containsKey('AuthorizerType')
            ? json['AuthorizerType'] as String
            : null,
        authorizerUri: json.containsKey('AuthorizerUri')
            ? json['AuthorizerUri'] as String
            : null,
        identitySource: json.containsKey('IdentitySource')
            ? (json['IdentitySource'] as List).map((e) => e as String).toList()
            : null,
        identityValidationExpression:
            json.containsKey('IdentityValidationExpression')
                ? json['IdentityValidationExpression'] as String
                : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        providerArns: json.containsKey('ProviderArns')
            ? (json['ProviderArns'] as List).map((e) => e as String).toList()
            : null,
      );
}

class UpdateDeploymentResponse {
  /// The date and time when the Deployment resource was created.
  final DateTime createdDate;

  /// The identifier for the deployment.
  final String deploymentId;

  /// The status of the deployment: PENDING, FAILED, or SUCCEEDED.
  final String deploymentStatus;

  /// May contain additional feedback on the status of an API deployment.
  final String deploymentStatusMessage;

  /// The description for the deployment.
  final String description;

  UpdateDeploymentResponse({
    this.createdDate,
    this.deploymentId,
    this.deploymentStatus,
    this.deploymentStatusMessage,
    this.description,
  });
  static UpdateDeploymentResponse fromJson(Map<String, dynamic> json) =>
      UpdateDeploymentResponse(
        createdDate: json.containsKey('CreatedDate')
            ? DateTime.parse(json['CreatedDate'])
            : null,
        deploymentId: json.containsKey('DeploymentId')
            ? json['DeploymentId'] as String
            : null,
        deploymentStatus: json.containsKey('DeploymentStatus')
            ? json['DeploymentStatus'] as String
            : null,
        deploymentStatusMessage: json.containsKey('DeploymentStatusMessage')
            ? json['DeploymentStatusMessage'] as String
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
      );
}

class UpdateDomainNameResponse {
  /// The API mapping selection expression.
  final String apiMappingSelectionExpression;

  /// The name of the DomainName resource.
  final String domainName;

  /// The domain name configurations.
  final List<DomainNameConfiguration> domainNameConfigurations;

  /// The key-value map of strings. The valid character set is [a-zA-Z+-=._:/].
  /// The tag key can be up to 128 characters and must not start with aws:. The
  /// tag value can be up to 256 characters..
  final Map<String, String> tags;

  UpdateDomainNameResponse({
    this.apiMappingSelectionExpression,
    this.domainName,
    this.domainNameConfigurations,
    this.tags,
  });
  static UpdateDomainNameResponse fromJson(Map<String, dynamic> json) =>
      UpdateDomainNameResponse(
        apiMappingSelectionExpression:
            json.containsKey('ApiMappingSelectionExpression')
                ? json['ApiMappingSelectionExpression'] as String
                : null,
        domainName: json.containsKey('DomainName')
            ? json['DomainName'] as String
            : null,
        domainNameConfigurations: json.containsKey('DomainNameConfigurations')
            ? (json['DomainNameConfigurations'] as List)
                .map((e) => DomainNameConfiguration.fromJson(e))
                .toList()
            : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

class UpdateIntegrationResponse {
  /// The connection ID.
  final String connectionId;

  /// The type of the network connection to the integration endpoint. Currently
  /// the only valid value is INTERNET, for connections through the public
  /// routable internet.
  final String connectionType;

  /// Specifies how to handle response payload content type conversions.
  /// Supported values are CONVERT_TO_BINARY and CONVERT_TO_TEXT, with the
  /// following behaviors:
  ///
  ///  CONVERT_TO_BINARY: Converts a response payload from a Base64-encoded
  /// string to the corresponding binary blob.
  ///
  ///  CONVERT_TO_TEXT: Converts a response payload from a binary blob to a
  /// Base64-encoded string.
  ///
  /// If this property is not defined, the response payload will be passed
  /// through from the integration response to the route response or method
  /// response without modification.
  final String contentHandlingStrategy;

  /// Specifies the credentials required for the integration, if any. For AWS
  /// integrations, three options are available. To specify an IAM Role for API
  /// Gateway to assume, use the role's Amazon Resource Name (ARN). To require
  /// that the caller's identity be passed through from the request, specify the
  /// string arn:aws:iam::*:user/*. To use resource-based permissions on
  /// supported AWS services, specify null.
  final String credentialsArn;

  /// Represents the description of an integration.
  final String description;

  /// Represents the identifier of an integration.
  final String integrationId;

  /// Specifies the integration's HTTP method type.
  final String integrationMethod;

  /// The integration response selection expression for the integration. See
  /// [Integration Response Selection Expressions](https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-websocket-api-selection-expressions.html#apigateway-websocket-api-integration-response-selection-expressions).
  final String integrationResponseSelectionExpression;

  /// The integration type of an integration. One of the following:
  ///
  ///  AWS: for integrating the route or method request with an AWS service
  /// action, including the Lambda function-invoking action. With the Lambda
  /// function-invoking action, this is referred to as the Lambda custom
  /// integration. With any other AWS service action, this is known as AWS
  /// integration.
  ///
  ///  AWS_PROXY: for integrating the route or method request with the Lambda
  /// function-invoking action with the client request passed through as-is.
  /// This integration is also referred to as Lambda proxy integration.
  ///
  ///  HTTP: for integrating the route or method request with an HTTP endpoint.
  /// This integration is also referred to as the HTTP custom integration.
  ///
  ///  HTTP_PROXY: for integrating route or method request with an HTTP
  /// endpoint, with the client request passed through as-is. This is also
  /// referred to as HTTP proxy integration.
  ///
  ///  MOCK: for integrating the route or method request with API Gateway as a
  /// "loopback" endpoint without invoking any backend.
  final String integrationType;

  /// For a Lambda proxy integration, this is the URI of the Lambda function.
  final String integrationUri;

  /// Specifies the pass-through behavior for incoming requests based on the
  /// Content-Type header in the request, and the available mapping templates
  /// specified as the requestTemplates property on the Integration resource.
  /// There are three valid values: WHEN_NO_MATCH, WHEN_NO_TEMPLATES, and NEVER.
  ///
  ///  WHEN_NO_MATCH passes the request body for unmapped content types through
  /// to the integration backend without transformation.
  ///
  ///  NEVER rejects unmapped content types with an HTTP 415 Unsupported Media
  /// Type response.
  ///
  ///  WHEN_NO_TEMPLATES allows pass-through when the integration has no content
  /// types mapped to templates. However, if there is at least one content type
  /// defined, unmapped content types will be rejected with the same HTTP 415
  /// Unsupported Media Type response.
  final String passthroughBehavior;

  /// A key-value map specifying request parameters that are passed from the
  /// method request to the backend. The key is an integration request parameter
  /// name and the associated value is a method request parameter value or
  /// static value that must be enclosed within single quotes and pre-encoded as
  /// required by the backend. The method request parameter value must match the
  /// pattern of method.request.{location}.{name} , where {location} is
  /// querystring, path, or header; and {name} must be a valid and unique method
  /// request parameter name.
  final Map<String, String> requestParameters;

  /// Represents a map of Velocity templates that are applied on the request
  /// payload based on the value of the Content-Type header sent by the client.
  /// The content type value is the key in this map, and the template (as a
  /// String) is the value.
  final Map<String, String> requestTemplates;

  /// The template selection expression for the integration.
  final String templateSelectionExpression;

  /// Custom timeout between 50 and 29,000 milliseconds. The default value is
  /// 29,000 milliseconds or 29 seconds.
  final int timeoutInMillis;

  UpdateIntegrationResponse({
    this.connectionId,
    this.connectionType,
    this.contentHandlingStrategy,
    this.credentialsArn,
    this.description,
    this.integrationId,
    this.integrationMethod,
    this.integrationResponseSelectionExpression,
    this.integrationType,
    this.integrationUri,
    this.passthroughBehavior,
    this.requestParameters,
    this.requestTemplates,
    this.templateSelectionExpression,
    this.timeoutInMillis,
  });
  static UpdateIntegrationResponse fromJson(Map<String, dynamic> json) =>
      UpdateIntegrationResponse(
        connectionId: json.containsKey('ConnectionId')
            ? json['ConnectionId'] as String
            : null,
        connectionType: json.containsKey('ConnectionType')
            ? json['ConnectionType'] as String
            : null,
        contentHandlingStrategy: json.containsKey('ContentHandlingStrategy')
            ? json['ContentHandlingStrategy'] as String
            : null,
        credentialsArn: json.containsKey('CredentialsArn')
            ? json['CredentialsArn'] as String
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        integrationId: json.containsKey('IntegrationId')
            ? json['IntegrationId'] as String
            : null,
        integrationMethod: json.containsKey('IntegrationMethod')
            ? json['IntegrationMethod'] as String
            : null,
        integrationResponseSelectionExpression:
            json.containsKey('IntegrationResponseSelectionExpression')
                ? json['IntegrationResponseSelectionExpression'] as String
                : null,
        integrationType: json.containsKey('IntegrationType')
            ? json['IntegrationType'] as String
            : null,
        integrationUri: json.containsKey('IntegrationUri')
            ? json['IntegrationUri'] as String
            : null,
        passthroughBehavior: json.containsKey('PassthroughBehavior')
            ? json['PassthroughBehavior'] as String
            : null,
        requestParameters: json.containsKey('RequestParameters')
            ? (json['RequestParameters'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        requestTemplates: json.containsKey('RequestTemplates')
            ? (json['RequestTemplates'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        templateSelectionExpression:
            json.containsKey('TemplateSelectionExpression')
                ? json['TemplateSelectionExpression'] as String
                : null,
        timeoutInMillis: json.containsKey('TimeoutInMillis')
            ? json['TimeoutInMillis'] as int
            : null,
      );
}

class UpdateIntegrationResponseResponse {
  /// Specifies how to handle response payload content type conversions.
  /// Supported values are CONVERT_TO_BINARY and CONVERT_TO_TEXT, with the
  /// following behaviors:
  ///
  ///  CONVERT_TO_BINARY: Converts a response payload from a Base64-encoded
  /// string to the corresponding binary blob.
  ///
  ///  CONVERT_TO_TEXT: Converts a response payload from a binary blob to a
  /// Base64-encoded string.
  ///
  /// If this property is not defined, the response payload will be passed
  /// through from the integration response to the route response or method
  /// response without modification.
  final String contentHandlingStrategy;

  /// The integration response ID.
  final String integrationResponseId;

  /// The integration response key.
  final String integrationResponseKey;

  /// A key-value map specifying response parameters that are passed to the
  /// method response from the backend. The key is a method response header
  /// parameter name and the mapped value is an integration response header
  /// value, a static value enclosed within a pair of single quotes, or a JSON
  /// expression from the integration response body. The mapping key must match
  /// the pattern of method.response.header.{name}, where name is a valid and
  /// unique header name. The mapped non-static value must match the pattern of
  /// integration.response.header.{name} or
  /// integration.response.body.{JSON-expression}, where name is a valid and
  /// unique response header name and JSON-expression is a valid JSON expression
  /// without the $ prefix.
  final Map<String, String> responseParameters;

  /// The collection of response templates for the integration response as a
  /// string-to-string map of key-value pairs. Response templates are
  /// represented as a key/value map, with a content-type as the key and a
  /// template as the value.
  final Map<String, String> responseTemplates;

  /// The template selection expressions for the integration response.
  final String templateSelectionExpression;

  UpdateIntegrationResponseResponse({
    this.contentHandlingStrategy,
    this.integrationResponseId,
    this.integrationResponseKey,
    this.responseParameters,
    this.responseTemplates,
    this.templateSelectionExpression,
  });
  static UpdateIntegrationResponseResponse fromJson(
          Map<String, dynamic> json) =>
      UpdateIntegrationResponseResponse(
        contentHandlingStrategy: json.containsKey('ContentHandlingStrategy')
            ? json['ContentHandlingStrategy'] as String
            : null,
        integrationResponseId: json.containsKey('IntegrationResponseId')
            ? json['IntegrationResponseId'] as String
            : null,
        integrationResponseKey: json.containsKey('IntegrationResponseKey')
            ? json['IntegrationResponseKey'] as String
            : null,
        responseParameters: json.containsKey('ResponseParameters')
            ? (json['ResponseParameters'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        responseTemplates: json.containsKey('ResponseTemplates')
            ? (json['ResponseTemplates'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        templateSelectionExpression:
            json.containsKey('TemplateSelectionExpression')
                ? json['TemplateSelectionExpression'] as String
                : null,
      );
}

class UpdateModelResponse {
  /// The content-type for the model, for example, "application/json".
  final String contentType;

  /// The description of the model.
  final String description;

  /// The model identifier.
  final String modelId;

  /// The name of the model. Must be alphanumeric.
  final String name;

  /// The schema for the model. For application/json models, this should be JSON
  /// schema draft 4 model.
  final String schema;

  UpdateModelResponse({
    this.contentType,
    this.description,
    this.modelId,
    this.name,
    this.schema,
  });
  static UpdateModelResponse fromJson(Map<String, dynamic> json) =>
      UpdateModelResponse(
        contentType: json.containsKey('ContentType')
            ? json['ContentType'] as String
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        modelId: json.containsKey('ModelId') ? json['ModelId'] as String : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        schema: json.containsKey('Schema') ? json['Schema'] as String : null,
      );
}

class UpdateRouteResponse {
  /// Specifies whether an API key is required for this route.
  final bool apiKeyRequired;

  /// A list of authorization scopes configured on a route. The scopes are used
  /// with a COGNITO_USER_POOLS authorizer to authorize the method invocation.
  /// The authorization works by matching the route scopes against the scopes
  /// parsed from the access token in the incoming request. The method
  /// invocation is authorized if any route scope matches a claimed scope in the
  /// access token. Otherwise, the invocation is not authorized. When the route
  /// scope is configured, the client must provide an access token instead of an
  /// identity token for authorization purposes.
  final List<String> authorizationScopes;

  /// The authorization type for the route. Valid values are NONE for open
  /// access, AWS_IAM for using AWS IAM permissions, and CUSTOM for using a
  /// Lambda authorizer
  final String authorizationType;

  /// The identifier of the Authorizer resource to be associated with this
  /// route, if the authorizationType is CUSTOM . The authorizer identifier is
  /// generated by API Gateway when you created the authorizer.
  final String authorizerId;

  /// The model selection expression for the route.
  final String modelSelectionExpression;

  /// The operation name for the route.
  final String operationName;

  /// The request models for the route.
  final Map<String, String> requestModels;

  /// The request parameters for the route.
  final Map<String, ParameterConstraints> requestParameters;

  /// The route ID.
  final String routeId;

  /// The route key for the route.
  final String routeKey;

  /// The route response selection expression for the route.
  final String routeResponseSelectionExpression;

  /// The target for the route.
  final String target;

  UpdateRouteResponse({
    this.apiKeyRequired,
    this.authorizationScopes,
    this.authorizationType,
    this.authorizerId,
    this.modelSelectionExpression,
    this.operationName,
    this.requestModels,
    this.requestParameters,
    this.routeId,
    this.routeKey,
    this.routeResponseSelectionExpression,
    this.target,
  });
  static UpdateRouteResponse fromJson(Map<String, dynamic> json) =>
      UpdateRouteResponse(
        apiKeyRequired: json.containsKey('ApiKeyRequired')
            ? json['ApiKeyRequired'] as bool
            : null,
        authorizationScopes: json.containsKey('AuthorizationScopes')
            ? (json['AuthorizationScopes'] as List)
                .map((e) => e as String)
                .toList()
            : null,
        authorizationType: json.containsKey('AuthorizationType')
            ? json['AuthorizationType'] as String
            : null,
        authorizerId: json.containsKey('AuthorizerId')
            ? json['AuthorizerId'] as String
            : null,
        modelSelectionExpression: json.containsKey('ModelSelectionExpression')
            ? json['ModelSelectionExpression'] as String
            : null,
        operationName: json.containsKey('OperationName')
            ? json['OperationName'] as String
            : null,
        requestModels: json.containsKey('RequestModels')
            ? (json['RequestModels'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        requestParameters: json.containsKey('RequestParameters')
            ? (json['RequestParameters'] as Map).map((k, v) =>
                MapEntry(k as String, ParameterConstraints.fromJson(v)))
            : null,
        routeId: json.containsKey('RouteId') ? json['RouteId'] as String : null,
        routeKey:
            json.containsKey('RouteKey') ? json['RouteKey'] as String : null,
        routeResponseSelectionExpression:
            json.containsKey('RouteResponseSelectionExpression')
                ? json['RouteResponseSelectionExpression'] as String
                : null,
        target: json.containsKey('Target') ? json['Target'] as String : null,
      );
}

class UpdateRouteResponseResponse {
  /// Represents the model selection expression of a route response.
  final String modelSelectionExpression;

  /// Represents the response models of a route response.
  final Map<String, String> responseModels;

  /// Represents the response parameters of a route response.
  final Map<String, ParameterConstraints> responseParameters;

  /// Represents the identifier of a route response.
  final String routeResponseId;

  /// Represents the route response key of a route response.
  final String routeResponseKey;

  UpdateRouteResponseResponse({
    this.modelSelectionExpression,
    this.responseModels,
    this.responseParameters,
    this.routeResponseId,
    this.routeResponseKey,
  });
  static UpdateRouteResponseResponse fromJson(Map<String, dynamic> json) =>
      UpdateRouteResponseResponse(
        modelSelectionExpression: json.containsKey('ModelSelectionExpression')
            ? json['ModelSelectionExpression'] as String
            : null,
        responseModels: json.containsKey('ResponseModels')
            ? (json['ResponseModels'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        responseParameters: json.containsKey('ResponseParameters')
            ? (json['ResponseParameters'] as Map).map((k, v) =>
                MapEntry(k as String, ParameterConstraints.fromJson(v)))
            : null,
        routeResponseId: json.containsKey('RouteResponseId')
            ? json['RouteResponseId'] as String
            : null,
        routeResponseKey: json.containsKey('RouteResponseKey')
            ? json['RouteResponseKey'] as String
            : null,
      );
}

class UpdateStageResponse {
  /// Settings for logging access in this stage.
  final AccessLogSettings accessLogSettings;

  /// The identifier of a client certificate for a Stage.
  final String clientCertificateId;

  /// The timestamp when the stage was created.
  final DateTime createdDate;

  /// Default route settings for the stage.
  final RouteSettings defaultRouteSettings;

  /// The identifier of the Deployment that the Stage is associated with.
  final String deploymentId;

  /// The description of the stage.
  final String description;

  /// The timestamp when the stage was last updated.
  final DateTime lastUpdatedDate;

  /// Route settings for the stage.
  final Map<String, RouteSettings> routeSettings;

  /// The name of the stage.
  final String stageName;

  /// A map that defines the stage variables for a stage resource. Variable
  /// names can have alphanumeric and underscore characters, and the values must
  /// match [A-Za-z0-9-._~:/?#&=,]+.
  final Map<String, String> stageVariables;

  /// The key-value map of strings. The valid character set is [a-zA-Z+-=._:/].
  /// The tag key can be up to 128 characters and must not start with aws:. The
  /// tag value can be up to 256 characters..
  final Map<String, String> tags;

  UpdateStageResponse({
    this.accessLogSettings,
    this.clientCertificateId,
    this.createdDate,
    this.defaultRouteSettings,
    this.deploymentId,
    this.description,
    this.lastUpdatedDate,
    this.routeSettings,
    this.stageName,
    this.stageVariables,
    this.tags,
  });
  static UpdateStageResponse fromJson(Map<String, dynamic> json) =>
      UpdateStageResponse(
        accessLogSettings: json.containsKey('AccessLogSettings')
            ? AccessLogSettings.fromJson(json['AccessLogSettings'])
            : null,
        clientCertificateId: json.containsKey('ClientCertificateId')
            ? json['ClientCertificateId'] as String
            : null,
        createdDate: json.containsKey('CreatedDate')
            ? DateTime.parse(json['CreatedDate'])
            : null,
        defaultRouteSettings: json.containsKey('DefaultRouteSettings')
            ? RouteSettings.fromJson(json['DefaultRouteSettings'])
            : null,
        deploymentId: json.containsKey('DeploymentId')
            ? json['DeploymentId'] as String
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        lastUpdatedDate: json.containsKey('LastUpdatedDate')
            ? DateTime.parse(json['LastUpdatedDate'])
            : null,
        routeSettings: json.containsKey('RouteSettings')
            ? (json['RouteSettings'] as Map)
                .map((k, v) => MapEntry(k as String, RouteSettings.fromJson(v)))
            : null,
        stageName:
            json.containsKey('StageName') ? json['StageName'] as String : null,
        stageVariables: json.containsKey('StageVariables')
            ? (json['StageVariables'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}
