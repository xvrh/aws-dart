import 'package:meta/meta.dart';

/// Amazon API Gateway V2
class ApiGatewayV2Api {
  /// Creates an Api resource.
  ///
  /// [apiKeySelectionExpression]: An API key selection expression. See [API Key
  /// Selection
  /// Expressions](https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-websocket-api-selection-expressions.html#apigateway-websocket-api-apikey-selection-expressions).
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
  /// \[a-zA-Z+-=._:/\]. The tag key can be up to 128 characters and must not
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
    return CreateApiResponse.fromJson({});
  }

  /// Creates an API mapping.
  ///
  /// [apiId]: The API identifier.
  ///
  /// [apiMappingKey]:
  ///
  /// [domainName]: The domain name.
  ///
  /// [stage]: The API stage.
  Future<CreateApiMappingResponse> createApiMapping(
      {@required String apiId,
      String apiMappingKey,
      @required String domainName,
      @required String stage}) async {
    return CreateApiMappingResponse.fromJson({});
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
  /// arn:aws:apigateway:us-west-2:lambda:path/2015-03-31/functions/arn:aws:lambda:us-west-2:{account\_id}:function:{lambda\_function\_name}/invocations.
  /// In general, the URI has this form:
  /// arn:aws:apigateway:{region}:lambda:path/{service\_api} , where {region} is
  /// the same as the region hosting the Lambda function, path indicates that
  /// the remaining substring in the URI should be treated as the path to the
  /// resource, including the initial /. For Lambda functions, this is usually
  /// of the form /2015-03-31/functions/\[FunctionARN\]/invocations.
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
    return CreateAuthorizerResponse.fromJson({});
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
    return CreateDeploymentResponse.fromJson({});
  }

  /// Creates a domain name.
  ///
  /// [domainName]: The domain name.
  ///
  /// [domainNameConfigurations]: The domain name configurations.
  ///
  /// [tags]: The key-value map of strings. The valid character set is
  /// \[a-zA-Z+-=._:/\]. The tag key can be up to 128 characters and must not
  /// start with aws:. The tag value can be up to 256 characters..
  Future<CreateDomainNameResponse> createDomainName(String domainName,
      {List<DomainNameConfiguration> domainNameConfigurations,
      Map<String, String> tags}) async {
    return CreateDomainNameResponse.fromJson({});
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
  /// content type conversions. Supported values are CONVERT\_TO\_BINARY and
  /// CONVERT\_TO\_TEXT, with the following behaviors:
  ///
  ///  CONVERT\_TO\_BINARY: Converts a response payload from a Base64-encoded
  /// string to the corresponding binary blob.
  ///
  ///  CONVERT\_TO\_TEXT: Converts a response payload from a binary blob to a
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
  /// the Integration resource. There are three valid values: WHEN\_NO\_MATCH,
  /// WHEN\_NO\_TEMPLATES, and NEVER.
  ///
  ///  WHEN\_NO\_MATCH passes the request body for unmapped content types
  /// through to the integration backend without transformation.
  ///
  ///  NEVER rejects unmapped content types with an HTTP 415 Unsupported Media
  /// Type response.
  ///
  ///  WHEN\_NO\_TEMPLATES allows pass-through when the integration has no
  /// content types mapped to templates. However, if there is at least one
  /// content type defined, unmapped content types will be rejected with the
  /// same HTTP 415 Unsupported Media Type response.
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
    return CreateIntegrationResponse.fromJson({});
  }

  /// Creates an IntegrationResponses.
  ///
  /// [apiId]: The API identifier.
  ///
  /// [contentHandlingStrategy]: Specifies how to handle response payload
  /// content type conversions. Supported values are CONVERT\_TO\_BINARY and
  /// CONVERT\_TO\_TEXT, with the following behaviors:
  ///
  ///  CONVERT\_TO\_BINARY: Converts a response payload from a Base64-encoded
  /// string to the corresponding binary blob.
  ///
  ///  CONVERT\_TO\_TEXT: Converts a response payload from a binary blob to a
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
    return CreateIntegrationResponseResponse.fromJson({});
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
    return CreateModelResponse.fromJson({});
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
    return CreateRouteResponse.fromJson({});
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
    return CreateRouteResponseResponse.fromJson({});
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
  /// values must match \[A-Za-z0-9-._~:/?#&=,\]+.
  ///
  /// [tags]: The key-value map of strings. The valid character set is
  /// \[a-zA-Z+-=._:/\]. The tag key can be up to 128 characters and must not
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
    return CreateStageResponse.fromJson({});
  }

  /// Deletes an Api resource.
  ///
  /// [apiId]: The API identifier.
  Future<void> deleteApi(String apiId) async {}

  /// Deletes an API mapping.
  ///
  /// [apiMappingId]: The API mapping identifier.
  ///
  /// [domainName]: The domain name.
  Future<void> deleteApiMapping(
      {@required String apiMappingId, @required String domainName}) async {}

  /// Deletes an Authorizer.
  ///
  /// [apiId]: The API identifier.
  ///
  /// [authorizerId]: The authorizer identifier.
  Future<void> deleteAuthorizer(
      {@required String apiId, @required String authorizerId}) async {}

  /// Deletes a Deployment.
  ///
  /// [apiId]: The API identifier.
  ///
  /// [deploymentId]: The deployment ID.
  Future<void> deleteDeployment(
      {@required String apiId, @required String deploymentId}) async {}

  /// Deletes a domain name.
  ///
  /// [domainName]: The domain name.
  Future<void> deleteDomainName(String domainName) async {}

  /// Deletes an Integration.
  ///
  /// [apiId]: The API identifier.
  ///
  /// [integrationId]: The integration ID.
  Future<void> deleteIntegration(
      {@required String apiId, @required String integrationId}) async {}

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
      @required String integrationResponseId}) async {}

  /// Deletes a Model.
  ///
  /// [apiId]: The API identifier.
  ///
  /// [modelId]: The model ID.
  Future<void> deleteModel(
      {@required String apiId, @required String modelId}) async {}

  /// Deletes a Route.
  ///
  /// [apiId]: The API identifier.
  ///
  /// [routeId]: The route ID.
  Future<void> deleteRoute(
      {@required String apiId, @required String routeId}) async {}

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
      @required String routeResponseId}) async {}

  /// Deletes a Stage.
  ///
  /// [apiId]: The API identifier.
  ///
  /// [stageName]: The stage name.
  Future<void> deleteStage(
      {@required String apiId, @required String stageName}) async {}

  /// Gets an Api resource.
  ///
  /// [apiId]: The API identifier.
  Future<GetApiResponse> getApi(String apiId) async {
    return GetApiResponse.fromJson({});
  }

  /// The API mapping.
  ///
  /// [apiMappingId]: The API mapping identifier.
  ///
  /// [domainName]: The domain name.
  Future<GetApiMappingResponse> getApiMapping(
      {@required String apiMappingId, @required String domainName}) async {
    return GetApiMappingResponse.fromJson({});
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
    return GetApiMappingsResponse.fromJson({});
  }

  /// Gets a collection of Api resources.
  ///
  /// [maxResults]: The maximum number of elements to be returned for this
  /// resource.
  ///
  /// [nextToken]: The next page of elements from this collection. Not valid for
  /// the last element of the collection.
  Future<GetApisResponse> getApis({String maxResults, String nextToken}) async {
    return GetApisResponse.fromJson({});
  }

  /// Gets an Authorizer.
  ///
  /// [apiId]: The API identifier.
  ///
  /// [authorizerId]: The authorizer identifier.
  Future<GetAuthorizerResponse> getAuthorizer(
      {@required String apiId, @required String authorizerId}) async {
    return GetAuthorizerResponse.fromJson({});
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
    return GetAuthorizersResponse.fromJson({});
  }

  /// Gets a Deployment.
  ///
  /// [apiId]: The API identifier.
  ///
  /// [deploymentId]: The deployment ID.
  Future<GetDeploymentResponse> getDeployment(
      {@required String apiId, @required String deploymentId}) async {
    return GetDeploymentResponse.fromJson({});
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
    return GetDeploymentsResponse.fromJson({});
  }

  /// Gets a domain name.
  ///
  /// [domainName]: The domain name.
  Future<GetDomainNameResponse> getDomainName(String domainName) async {
    return GetDomainNameResponse.fromJson({});
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
    return GetDomainNamesResponse.fromJson({});
  }

  /// Gets an Integration.
  ///
  /// [apiId]: The API identifier.
  ///
  /// [integrationId]: The integration ID.
  Future<GetIntegrationResponse> getIntegration(
      {@required String apiId, @required String integrationId}) async {
    return GetIntegrationResponse.fromJson({});
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
    return GetIntegrationResponseResponse.fromJson({});
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
    return GetIntegrationResponsesResponse.fromJson({});
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
    return GetIntegrationsResponse.fromJson({});
  }

  /// Gets a Model.
  ///
  /// [apiId]: The API identifier.
  ///
  /// [modelId]: The model ID.
  Future<GetModelResponse> getModel(
      {@required String apiId, @required String modelId}) async {
    return GetModelResponse.fromJson({});
  }

  /// Gets a model template.
  ///
  /// [apiId]: The API identifier.
  ///
  /// [modelId]: The model ID.
  Future<GetModelTemplateResponse> getModelTemplate(
      {@required String apiId, @required String modelId}) async {
    return GetModelTemplateResponse.fromJson({});
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
    return GetModelsResponse.fromJson({});
  }

  /// Gets a Route.
  ///
  /// [apiId]: The API identifier.
  ///
  /// [routeId]: The route ID.
  Future<GetRouteResponse> getRoute(
      {@required String apiId, @required String routeId}) async {
    return GetRouteResponse.fromJson({});
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
    return GetRouteResponseResponse.fromJson({});
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
    return GetRouteResponsesResponse.fromJson({});
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
    return GetRoutesResponse.fromJson({});
  }

  /// Gets a Stage.
  ///
  /// [apiId]: The API identifier.
  ///
  /// [stageName]: The stage name.
  Future<GetStageResponse> getStage(
      {@required String apiId, @required String stageName}) async {
    return GetStageResponse.fromJson({});
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
    return GetStagesResponse.fromJson({});
  }

  /// Gets the Tags for an API.
  Future<GetTagsResponse> getTags(String resourceArn) async {
    return GetTagsResponse.fromJson({});
  }

  /// Tag an APIGW resource
  ///
  /// [resourceArn]: AWS resource arn
  ///
  /// [tags]: The key-value map of strings. The valid character set is
  /// \[a-zA-Z+-=._:/\]. The tag key can be up to 128 characters and must not
  /// start with aws:. The tag value can be up to 256 characters..
  Future<TagResourceResponse> tagResource(String resourceArn,
      {Map<String, String> tags}) async {
    return TagResourceResponse.fromJson({});
  }

  /// Untag an APIGW resource
  ///
  /// [resourceArn]: AWS resource arn
  ///
  /// [tagKeys]: The Tag keys to delete
  Future<void> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {}

  /// Updates an Api resource.
  ///
  /// [apiId]: The API identifier.
  ///
  /// [apiKeySelectionExpression]: An API key selection expression. See [API Key
  /// Selection
  /// Expressions](https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-websocket-api-selection-expressions.html#apigateway-websocket-api-apikey-selection-expressions).
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
    return UpdateApiResponse.fromJson({});
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
    return UpdateApiMappingResponse.fromJson({});
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
  /// arn:aws:apigateway:us-west-2:lambda:path/2015-03-31/functions/arn:aws:lambda:us-west-2:{account\_id}:function:{lambda\_function\_name}/invocations.
  /// In general, the URI has this form:
  /// arn:aws:apigateway:{region}:lambda:path/{service\_api} , where {region} is
  /// the same as the region hosting the Lambda function, path indicates that
  /// the remaining substring in the URI should be treated as the path to the
  /// resource, including the initial /. For Lambda functions, this is usually
  /// of the form /2015-03-31/functions/\[FunctionARN\]/invocations.
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
    return UpdateAuthorizerResponse.fromJson({});
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
    return UpdateDeploymentResponse.fromJson({});
  }

  /// Updates a domain name.
  ///
  /// [domainName]: The domain name.
  ///
  /// [domainNameConfigurations]: The domain name configurations.
  Future<UpdateDomainNameResponse> updateDomainName(String domainName,
      {List<DomainNameConfiguration> domainNameConfigurations}) async {
    return UpdateDomainNameResponse.fromJson({});
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
  /// content type conversions. Supported values are CONVERT\_TO\_BINARY and
  /// CONVERT\_TO\_TEXT, with the following behaviors:
  ///
  ///  CONVERT\_TO\_BINARY: Converts a response payload from a Base64-encoded
  /// string to the corresponding binary blob.
  ///
  ///  CONVERT\_TO\_TEXT: Converts a response payload from a binary blob to a
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
  /// the Integration resource. There are three valid values: WHEN\_NO\_MATCH,
  /// WHEN\_NO\_TEMPLATES, and NEVER.
  ///
  ///  WHEN\_NO\_MATCH passes the request body for unmapped content types
  /// through to the integration backend without transformation.
  ///
  ///  NEVER rejects unmapped content types with an HTTP 415 Unsupported Media
  /// Type response.
  ///
  ///  WHEN\_NO\_TEMPLATES allows pass-through when the integration has no
  /// content types mapped to templates. However, if there is at least one
  /// content type defined, unmapped content types will be rejected with the
  /// same HTTP 415 Unsupported Media Type response.
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
    return UpdateIntegrationResponse.fromJson({});
  }

  /// Updates an IntegrationResponses.
  ///
  /// [apiId]: The API identifier.
  ///
  /// [contentHandlingStrategy]: Specifies how to handle response payload
  /// content type conversions. Supported values are CONVERT\_TO\_BINARY and
  /// CONVERT\_TO\_TEXT, with the following behaviors:
  ///
  ///  CONVERT\_TO\_BINARY: Converts a response payload from a Base64-encoded
  /// string to the corresponding binary blob.
  ///
  ///  CONVERT\_TO\_TEXT: Converts a response payload from a binary blob to a
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
    return UpdateIntegrationResponseResponse.fromJson({});
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
    return UpdateModelResponse.fromJson({});
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
    return UpdateRouteResponse.fromJson({});
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
    return UpdateRouteResponseResponse.fromJson({});
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
  /// values must match \[A-Za-z0-9-._~:/?#&=,\]+.
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
    return UpdateStageResponse.fromJson({});
  }
}

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
      AccessLogSettings();
}

class Api {
  /// The URI of the API, of the form
  /// {api-id}.execute-api.{region}.amazonaws.com. The stage name is typically
  /// appended to this URI to form a complete path to a deployed API stage.
  final String apiEndpoint;

  /// The API ID.
  final String apiId;

  /// An API key selection expression. See [API Key Selection
  /// Expressions](https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-websocket-api-selection-expressions.html#apigateway-websocket-api-apikey-selection-expressions).
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

  /// The key-value map of strings. The valid character set is
  /// \[a-zA-Z+-=._:/\]. The tag key can be up to 128 characters and must not
  /// start with aws:. The tag value can be up to 256 characters..
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
  static Api fromJson(Map<String, dynamic> json) => Api();
}

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
  static ApiMapping fromJson(Map<String, dynamic> json) => ApiMapping();
}

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
  /// arn:aws:apigateway:us-west-2:lambda:path/2015-03-31/functions/arn:aws:lambda:us-west-2:{account\_id}:function:{lambda\_function\_name}/invocations.
  /// In general, the URI has this form:
  /// arn:aws:apigateway:{region}:lambda:path/{service\_api} , where {region} is
  /// the same as the region hosting the Lambda function, path indicates that
  /// the remaining substring in the URI should be treated as the path to the
  /// resource, including the initial /. For Lambda functions, this is usually
  /// of the form /2015-03-31/functions/\[FunctionARN\]/invocations.
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
  static Authorizer fromJson(Map<String, dynamic> json) => Authorizer();
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
      CreateApiMappingResponse();
}

class CreateApiResponse {
  /// The URI of the API, of the form
  /// {api-id}.execute-api.{region}.amazonaws.com. The stage name is typically
  /// appended to this URI to form a complete path to a deployed API stage.
  final String apiEndpoint;

  /// The API ID.
  final String apiId;

  /// An API key selection expression. See [API Key Selection
  /// Expressions](https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-websocket-api-selection-expressions.html#apigateway-websocket-api-apikey-selection-expressions).
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

  /// The key-value map of strings. The valid character set is
  /// \[a-zA-Z+-=._:/\]. The tag key can be up to 128 characters and must not
  /// start with aws:. The tag value can be up to 256 characters..
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
      CreateApiResponse();
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
  /// arn:aws:apigateway:us-west-2:lambda:path/2015-03-31/functions/arn:aws:lambda:us-west-2:{account\_id}:function:{lambda\_function\_name}/invocations.
  /// In general, the URI has this form:
  /// arn:aws:apigateway:{region}:lambda:path/{service\_api} , where {region} is
  /// the same as the region hosting the Lambda function, path indicates that
  /// the remaining substring in the URI should be treated as the path to the
  /// resource, including the initial /. For Lambda functions, this is usually
  /// of the form /2015-03-31/functions/\[FunctionARN\]/invocations.
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
      CreateAuthorizerResponse();
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
      CreateDeploymentResponse();
}

class CreateDomainNameResponse {
  /// The API mapping selection expression.
  final String apiMappingSelectionExpression;

  /// The name of the DomainName resource.
  final String domainName;

  /// The domain name configurations.
  final List<DomainNameConfiguration> domainNameConfigurations;

  /// The key-value map of strings. The valid character set is
  /// \[a-zA-Z+-=._:/\]. The tag key can be up to 128 characters and must not
  /// start with aws:. The tag value can be up to 256 characters..
  final Map<String, String> tags;

  CreateDomainNameResponse({
    this.apiMappingSelectionExpression,
    this.domainName,
    this.domainNameConfigurations,
    this.tags,
  });
  static CreateDomainNameResponse fromJson(Map<String, dynamic> json) =>
      CreateDomainNameResponse();
}

class CreateIntegrationResponse {
  /// The connection ID.
  final String connectionId;

  /// The type of the network connection to the integration endpoint. Currently
  /// the only valid value is INTERNET, for connections through the public
  /// routable internet.
  final String connectionType;

  /// Specifies how to handle response payload content type conversions.
  /// Supported values are CONVERT\_TO\_BINARY and CONVERT\_TO\_TEXT, with the
  /// following behaviors:
  ///
  ///  CONVERT\_TO\_BINARY: Converts a response payload from a Base64-encoded
  /// string to the corresponding binary blob.
  ///
  ///  CONVERT\_TO\_TEXT: Converts a response payload from a binary blob to a
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
  /// [Integration Response Selection
  /// Expressions](https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-websocket-api-selection-expressions.html#apigateway-websocket-api-integration-response-selection-expressions).
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
  /// There are three valid values: WHEN\_NO\_MATCH, WHEN\_NO\_TEMPLATES, and
  /// NEVER.
  ///
  ///  WHEN\_NO\_MATCH passes the request body for unmapped content types
  /// through to the integration backend without transformation.
  ///
  ///  NEVER rejects unmapped content types with an HTTP 415 Unsupported Media
  /// Type response.
  ///
  ///  WHEN\_NO\_TEMPLATES allows pass-through when the integration has no
  /// content types mapped to templates. However, if there is at least one
  /// content type defined, unmapped content types will be rejected with the
  /// same HTTP 415 Unsupported Media Type response.
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
      CreateIntegrationResponse();
}

class CreateIntegrationResponseResponse {
  /// Specifies how to handle response payload content type conversions.
  /// Supported values are CONVERT\_TO\_BINARY and CONVERT\_TO\_TEXT, with the
  /// following behaviors:
  ///
  ///  CONVERT\_TO\_BINARY: Converts a response payload from a Base64-encoded
  /// string to the corresponding binary blob.
  ///
  ///  CONVERT\_TO\_TEXT: Converts a response payload from a binary blob to a
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
      CreateIntegrationResponseResponse();
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
      CreateModelResponse();
}

class CreateRouteResponse {
  /// Specifies whether an API key is required for this route.
  final bool apiKeyRequired;

  /// A list of authorization scopes configured on a route. The scopes are used
  /// with a COGNITO\_USER\_POOLS authorizer to authorize the method invocation.
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
      CreateRouteResponse();
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
      CreateRouteResponseResponse();
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
  /// match \[A-Za-z0-9-._~:/?#&=,\]+.
  final Map<String, String> stageVariables;

  /// The key-value map of strings. The valid character set is
  /// \[a-zA-Z+-=._:/\]. The tag key can be up to 128 characters and must not
  /// start with aws:. The tag value can be up to 256 characters..
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
      CreateStageResponse();
}

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
  static Deployment fromJson(Map<String, dynamic> json) => Deployment();
}

class DomainName {
  /// The API mapping selection expression.
  final String apiMappingSelectionExpression;

  /// The name of the DomainName resource.
  final String domainName;

  /// The domain name configurations.
  final List<DomainNameConfiguration> domainNameConfigurations;

  /// The key-value map of strings. The valid character set is
  /// \[a-zA-Z+-=._:/\]. The tag key can be up to 128 characters and must not
  /// start with aws:. The tag value can be up to 256 characters..
  final Map<String, String> tags;

  DomainName({
    this.apiMappingSelectionExpression,
    @required this.domainName,
    this.domainNameConfigurations,
    this.tags,
  });
  static DomainName fromJson(Map<String, dynamic> json) => DomainName();
}

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
  /// domain name. The valid values are TLS\_1\_0 and TLS\_1\_2.
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
      DomainNameConfiguration();
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
      GetApiMappingResponse();
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
      GetApiMappingsResponse();
}

class GetApiResponse {
  /// The URI of the API, of the form
  /// {api-id}.execute-api.{region}.amazonaws.com. The stage name is typically
  /// appended to this URI to form a complete path to a deployed API stage.
  final String apiEndpoint;

  /// The API ID.
  final String apiId;

  /// An API key selection expression. See [API Key Selection
  /// Expressions](https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-websocket-api-selection-expressions.html#apigateway-websocket-api-apikey-selection-expressions).
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

  /// The key-value map of strings. The valid character set is
  /// \[a-zA-Z+-=._:/\]. The tag key can be up to 128 characters and must not
  /// start with aws:. The tag value can be up to 256 characters..
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
  static GetApiResponse fromJson(Map<String, dynamic> json) => GetApiResponse();
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
  static GetApisResponse fromJson(Map<String, dynamic> json) =>
      GetApisResponse();
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
  /// arn:aws:apigateway:us-west-2:lambda:path/2015-03-31/functions/arn:aws:lambda:us-west-2:{account\_id}:function:{lambda\_function\_name}/invocations.
  /// In general, the URI has this form:
  /// arn:aws:apigateway:{region}:lambda:path/{service\_api} , where {region} is
  /// the same as the region hosting the Lambda function, path indicates that
  /// the remaining substring in the URI should be treated as the path to the
  /// resource, including the initial /. For Lambda functions, this is usually
  /// of the form /2015-03-31/functions/\[FunctionARN\]/invocations.
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
      GetAuthorizerResponse();
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
      GetAuthorizersResponse();
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
      GetDeploymentResponse();
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
      GetDeploymentsResponse();
}

class GetDomainNameResponse {
  /// The API mapping selection expression.
  final String apiMappingSelectionExpression;

  /// The name of the DomainName resource.
  final String domainName;

  /// The domain name configurations.
  final List<DomainNameConfiguration> domainNameConfigurations;

  /// The key-value map of strings. The valid character set is
  /// \[a-zA-Z+-=._:/\]. The tag key can be up to 128 characters and must not
  /// start with aws:. The tag value can be up to 256 characters..
  final Map<String, String> tags;

  GetDomainNameResponse({
    this.apiMappingSelectionExpression,
    this.domainName,
    this.domainNameConfigurations,
    this.tags,
  });
  static GetDomainNameResponse fromJson(Map<String, dynamic> json) =>
      GetDomainNameResponse();
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
      GetDomainNamesResponse();
}

class GetIntegrationResponse {
  /// The connection ID.
  final String connectionId;

  /// The type of the network connection to the integration endpoint. Currently
  /// the only valid value is INTERNET, for connections through the public
  /// routable internet.
  final String connectionType;

  /// Specifies how to handle response payload content type conversions.
  /// Supported values are CONVERT\_TO\_BINARY and CONVERT\_TO\_TEXT, with the
  /// following behaviors:
  ///
  ///  CONVERT\_TO\_BINARY: Converts a response payload from a Base64-encoded
  /// string to the corresponding binary blob.
  ///
  ///  CONVERT\_TO\_TEXT: Converts a response payload from a binary blob to a
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
  /// [Integration Response Selection
  /// Expressions](https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-websocket-api-selection-expressions.html#apigateway-websocket-api-integration-response-selection-expressions).
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
  /// There are three valid values: WHEN\_NO\_MATCH, WHEN\_NO\_TEMPLATES, and
  /// NEVER.
  ///
  ///  WHEN\_NO\_MATCH passes the request body for unmapped content types
  /// through to the integration backend without transformation.
  ///
  ///  NEVER rejects unmapped content types with an HTTP 415 Unsupported Media
  /// Type response.
  ///
  ///  WHEN\_NO\_TEMPLATES allows pass-through when the integration has no
  /// content types mapped to templates. However, if there is at least one
  /// content type defined, unmapped content types will be rejected with the
  /// same HTTP 415 Unsupported Media Type response.
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
      GetIntegrationResponse();
}

class GetIntegrationResponseResponse {
  /// Specifies how to handle response payload content type conversions.
  /// Supported values are CONVERT\_TO\_BINARY and CONVERT\_TO\_TEXT, with the
  /// following behaviors:
  ///
  ///  CONVERT\_TO\_BINARY: Converts a response payload from a Base64-encoded
  /// string to the corresponding binary blob.
  ///
  ///  CONVERT\_TO\_TEXT: Converts a response payload from a binary blob to a
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
      GetIntegrationResponseResponse();
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
      GetIntegrationResponsesResponse();
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
      GetIntegrationsResponse();
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
      GetModelResponse();
}

class GetModelTemplateResponse {
  /// The template value.
  final String value;

  GetModelTemplateResponse({
    this.value,
  });
  static GetModelTemplateResponse fromJson(Map<String, dynamic> json) =>
      GetModelTemplateResponse();
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
      GetModelsResponse();
}

class GetRouteResponse {
  /// Specifies whether an API key is required for this route.
  final bool apiKeyRequired;

  /// A list of authorization scopes configured on a route. The scopes are used
  /// with a COGNITO\_USER\_POOLS authorizer to authorize the method invocation.
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
      GetRouteResponse();
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
      GetRouteResponseResponse();
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
      GetRouteResponsesResponse();
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
      GetRoutesResponse();
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
  /// match \[A-Za-z0-9-._~:/?#&=,\]+.
  final Map<String, String> stageVariables;

  /// The key-value map of strings. The valid character set is
  /// \[a-zA-Z+-=._:/\]. The tag key can be up to 128 characters and must not
  /// start with aws:. The tag value can be up to 256 characters..
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
      GetStageResponse();
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
      GetStagesResponse();
}

class Integration {
  /// The connection ID.
  final String connectionId;

  /// The type of the network connection to the integration endpoint. Currently
  /// the only valid value is INTERNET, for connections through the public
  /// routable internet.
  final String connectionType;

  /// Specifies how to handle response payload content type conversions.
  /// Supported values are CONVERT\_TO\_BINARY and CONVERT\_TO\_TEXT, with the
  /// following behaviors:
  ///
  ///  CONVERT\_TO\_BINARY: Converts a response payload from a Base64-encoded
  /// string to the corresponding binary blob.
  ///
  ///  CONVERT\_TO\_TEXT: Converts a response payload from a binary blob to a
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
  /// [Integration Response Selection
  /// Expressions](https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-websocket-api-selection-expressions.html#apigateway-websocket-api-integration-response-selection-expressions).
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
  /// There are three valid values: WHEN\_NO\_MATCH, WHEN\_NO\_TEMPLATES, and
  /// NEVER.
  ///
  ///  WHEN\_NO\_MATCH passes the request body for unmapped content types
  /// through to the integration backend without transformation.
  ///
  ///  NEVER rejects unmapped content types with an HTTP 415 Unsupported Media
  /// Type response.
  ///
  ///  WHEN\_NO\_TEMPLATES allows pass-through when the integration has no
  /// content types mapped to templates. However, if there is at least one
  /// content type defined, unmapped content types will be rejected with the
  /// same HTTP 415 Unsupported Media Type response.
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
  static Integration fromJson(Map<String, dynamic> json) => Integration();
}

class IntegrationResponse {
  /// Specifies how to handle response payload content type conversions.
  /// Supported values are CONVERT\_TO\_BINARY and CONVERT\_TO\_TEXT, with the
  /// following behaviors:
  ///
  ///  CONVERT\_TO\_BINARY: Converts a response payload from a Base64-encoded
  /// string to the corresponding binary blob.
  ///
  ///  CONVERT\_TO\_TEXT: Converts a response payload from a binary blob to a
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
      IntegrationResponse();
}

class GetTagsResponse {
  final Map<String, String> tags;

  GetTagsResponse({
    this.tags,
  });
  static GetTagsResponse fromJson(Map<String, dynamic> json) =>
      GetTagsResponse();
}

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
  static Model fromJson(Map<String, dynamic> json) => Model();
}

class ParameterConstraints {
  /// Whether or not the parameter is required.
  final bool isRequired;

  ParameterConstraints({
    this.isRequired,
  });
  static ParameterConstraints fromJson(Map<String, dynamic> json) =>
      ParameterConstraints();
}

class Route {
  /// Specifies whether an API key is required for this route.
  final bool apiKeyRequired;

  /// A list of authorization scopes configured on a route. The scopes are used
  /// with a COGNITO\_USER\_POOLS authorizer to authorize the method invocation.
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
  static Route fromJson(Map<String, dynamic> json) => Route();
}

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
  static RouteResponse fromJson(Map<String, dynamic> json) => RouteResponse();
}

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
  static RouteSettings fromJson(Map<String, dynamic> json) => RouteSettings();
}

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
  /// match \[A-Za-z0-9-._~:/?#&=,\]+.
  final Map<String, String> stageVariables;

  /// The key-value map of strings. The valid character set is
  /// \[a-zA-Z+-=._:/\]. The tag key can be up to 128 characters and must not
  /// start with aws:. The tag value can be up to 256 characters..
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
  static Stage fromJson(Map<String, dynamic> json) => Stage();
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
      UpdateApiMappingResponse();
}

class UpdateApiResponse {
  /// The URI of the API, of the form
  /// {api-id}.execute-api.{region}.amazonaws.com. The stage name is typically
  /// appended to this URI to form a complete path to a deployed API stage.
  final String apiEndpoint;

  /// The API ID.
  final String apiId;

  /// An API key selection expression. See [API Key Selection
  /// Expressions](https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-websocket-api-selection-expressions.html#apigateway-websocket-api-apikey-selection-expressions).
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

  /// The key-value map of strings. The valid character set is
  /// \[a-zA-Z+-=._:/\]. The tag key can be up to 128 characters and must not
  /// start with aws:. The tag value can be up to 256 characters..
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
      UpdateApiResponse();
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
  /// arn:aws:apigateway:us-west-2:lambda:path/2015-03-31/functions/arn:aws:lambda:us-west-2:{account\_id}:function:{lambda\_function\_name}/invocations.
  /// In general, the URI has this form:
  /// arn:aws:apigateway:{region}:lambda:path/{service\_api} , where {region} is
  /// the same as the region hosting the Lambda function, path indicates that
  /// the remaining substring in the URI should be treated as the path to the
  /// resource, including the initial /. For Lambda functions, this is usually
  /// of the form /2015-03-31/functions/\[FunctionARN\]/invocations.
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
      UpdateAuthorizerResponse();
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
      UpdateDeploymentResponse();
}

class UpdateDomainNameResponse {
  /// The API mapping selection expression.
  final String apiMappingSelectionExpression;

  /// The name of the DomainName resource.
  final String domainName;

  /// The domain name configurations.
  final List<DomainNameConfiguration> domainNameConfigurations;

  /// The key-value map of strings. The valid character set is
  /// \[a-zA-Z+-=._:/\]. The tag key can be up to 128 characters and must not
  /// start with aws:. The tag value can be up to 256 characters..
  final Map<String, String> tags;

  UpdateDomainNameResponse({
    this.apiMappingSelectionExpression,
    this.domainName,
    this.domainNameConfigurations,
    this.tags,
  });
  static UpdateDomainNameResponse fromJson(Map<String, dynamic> json) =>
      UpdateDomainNameResponse();
}

class UpdateIntegrationResponse {
  /// The connection ID.
  final String connectionId;

  /// The type of the network connection to the integration endpoint. Currently
  /// the only valid value is INTERNET, for connections through the public
  /// routable internet.
  final String connectionType;

  /// Specifies how to handle response payload content type conversions.
  /// Supported values are CONVERT\_TO\_BINARY and CONVERT\_TO\_TEXT, with the
  /// following behaviors:
  ///
  ///  CONVERT\_TO\_BINARY: Converts a response payload from a Base64-encoded
  /// string to the corresponding binary blob.
  ///
  ///  CONVERT\_TO\_TEXT: Converts a response payload from a binary blob to a
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
  /// [Integration Response Selection
  /// Expressions](https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-websocket-api-selection-expressions.html#apigateway-websocket-api-integration-response-selection-expressions).
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
  /// There are three valid values: WHEN\_NO\_MATCH, WHEN\_NO\_TEMPLATES, and
  /// NEVER.
  ///
  ///  WHEN\_NO\_MATCH passes the request body for unmapped content types
  /// through to the integration backend without transformation.
  ///
  ///  NEVER rejects unmapped content types with an HTTP 415 Unsupported Media
  /// Type response.
  ///
  ///  WHEN\_NO\_TEMPLATES allows pass-through when the integration has no
  /// content types mapped to templates. However, if there is at least one
  /// content type defined, unmapped content types will be rejected with the
  /// same HTTP 415 Unsupported Media Type response.
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
      UpdateIntegrationResponse();
}

class UpdateIntegrationResponseResponse {
  /// Specifies how to handle response payload content type conversions.
  /// Supported values are CONVERT\_TO\_BINARY and CONVERT\_TO\_TEXT, with the
  /// following behaviors:
  ///
  ///  CONVERT\_TO\_BINARY: Converts a response payload from a Base64-encoded
  /// string to the corresponding binary blob.
  ///
  ///  CONVERT\_TO\_TEXT: Converts a response payload from a binary blob to a
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
      UpdateIntegrationResponseResponse();
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
      UpdateModelResponse();
}

class UpdateRouteResponse {
  /// Specifies whether an API key is required for this route.
  final bool apiKeyRequired;

  /// A list of authorization scopes configured on a route. The scopes are used
  /// with a COGNITO\_USER\_POOLS authorizer to authorize the method invocation.
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
      UpdateRouteResponse();
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
      UpdateRouteResponseResponse();
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
  /// match \[A-Za-z0-9-._~:/?#&=,\]+.
  final Map<String, String> stageVariables;

  /// The key-value map of strings. The valid character set is
  /// \[a-zA-Z+-=._:/\]. The tag key can be up to 128 characters and must not
  /// start with aws:. The tag value can be up to 256 characters..
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
      UpdateStageResponse();
}
