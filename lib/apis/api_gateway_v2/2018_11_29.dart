import 'package:meta/meta.dart';

/// Amazon API Gateway V2
class ApiGatewayV2Api {
  /// Creates an Api resource.
  Future<void> createApi(
      {String apiKeySelectionExpression,
      String description,
      bool disableSchemaValidation,
      @required String name,
      @required String protocolType,
      @required String routeSelectionExpression,
      String version,
      Map<String, String> tags}) async {}

  /// Creates an API mapping.
  Future<void> createApiMapping(
      {@required String apiId,
      String apiMappingKey,
      @required String domainName,
      @required String stage}) async {}

  /// Creates an Authorizer for an API.
  Future<void> createAuthorizer(
      {@required String apiId,
      String authorizerCredentialsArn,
      int authorizerResultTtlInSeconds,
      @required String authorizerType,
      @required String authorizerUri,
      @required List<String> identitySource,
      String identityValidationExpression,
      @required String name,
      List<String> providerArns}) async {}

  /// Creates a Deployment for an API.
  Future<void> createDeployment(String apiId,
      {String description, String stageName}) async {}

  /// Creates a domain name.
  Future<void> createDomainName(String domainName,
      {List<DomainNameConfiguration> domainNameConfigurations,
      Map<String, String> tags}) async {}

  /// Creates an Integration.
  Future<void> createIntegration(
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
      int timeoutInMillis}) async {}

  /// Creates an IntegrationResponses.
  Future<void> createIntegrationResponse(
      {@required String apiId,
      String contentHandlingStrategy,
      @required String integrationId,
      @required String integrationResponseKey,
      Map<String, String> responseParameters,
      Map<String, String> responseTemplates,
      String templateSelectionExpression}) async {}

  /// Creates a Model for an API.
  Future<void> createModel(
      {@required String apiId,
      String contentType,
      String description,
      @required String name,
      @required String schema}) async {}

  /// Creates a Route for an API.
  Future<void> createRoute(
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
      String target}) async {}

  /// Creates a RouteResponse for a Route.
  Future<void> createRouteResponse(
      {@required String apiId,
      String modelSelectionExpression,
      Map<String, String> responseModels,
      Map<String, ParameterConstraints> responseParameters,
      @required String routeId,
      @required String routeResponseKey}) async {}

  /// Creates a Stage for an API.
  Future<void> createStage(
      {AccessLogSettings accessLogSettings,
      @required String apiId,
      String clientCertificateId,
      RouteSettings defaultRouteSettings,
      String deploymentId,
      String description,
      Map<String, RouteSettings> routeSettings,
      @required String stageName,
      Map<String, String> stageVariables,
      Map<String, String> tags}) async {}

  /// Deletes an Api resource.
  Future<void> deleteApi(String apiId) async {}

  /// Deletes an API mapping.
  Future<void> deleteApiMapping(
      {@required String apiMappingId, @required String domainName}) async {}

  /// Deletes an Authorizer.
  Future<void> deleteAuthorizer(
      {@required String apiId, @required String authorizerId}) async {}

  /// Deletes a Deployment.
  Future<void> deleteDeployment(
      {@required String apiId, @required String deploymentId}) async {}

  /// Deletes a domain name.
  Future<void> deleteDomainName(String domainName) async {}

  /// Deletes an Integration.
  Future<void> deleteIntegration(
      {@required String apiId, @required String integrationId}) async {}

  /// Deletes an IntegrationResponses.
  Future<void> deleteIntegrationResponse(
      {@required String apiId,
      @required String integrationId,
      @required String integrationResponseId}) async {}

  /// Deletes a Model.
  Future<void> deleteModel(
      {@required String apiId, @required String modelId}) async {}

  /// Deletes a Route.
  Future<void> deleteRoute(
      {@required String apiId, @required String routeId}) async {}

  /// Deletes a RouteResponse.
  Future<void> deleteRouteResponse(
      {@required String apiId,
      @required String routeId,
      @required String routeResponseId}) async {}

  /// Deletes a Stage.
  Future<void> deleteStage(
      {@required String apiId, @required String stageName}) async {}

  /// Gets an Api resource.
  Future<void> getApi(String apiId) async {}

  /// The API mapping.
  Future<void> getApiMapping(
      {@required String apiMappingId, @required String domainName}) async {}

  /// The API mappings.
  Future<void> getApiMappings(String domainName,
      {String maxResults, String nextToken}) async {}

  /// Gets a collection of Api resources.
  Future<void> getApis({String maxResults, String nextToken}) async {}

  /// Gets an Authorizer.
  Future<void> getAuthorizer(
      {@required String apiId, @required String authorizerId}) async {}

  /// Gets the Authorizers for an API.
  Future<void> getAuthorizers(String apiId,
      {String maxResults, String nextToken}) async {}

  /// Gets a Deployment.
  Future<void> getDeployment(
      {@required String apiId, @required String deploymentId}) async {}

  /// Gets the Deployments for an API.
  Future<void> getDeployments(String apiId,
      {String maxResults, String nextToken}) async {}

  /// Gets a domain name.
  Future<void> getDomainName(String domainName) async {}

  /// Gets the domain names for an AWS account.
  Future<void> getDomainNames({String maxResults, String nextToken}) async {}

  /// Gets an Integration.
  Future<void> getIntegration(
      {@required String apiId, @required String integrationId}) async {}

  /// Gets an IntegrationResponses.
  Future<void> getIntegrationResponse(
      {@required String apiId,
      @required String integrationId,
      @required String integrationResponseId}) async {}

  /// Gets the IntegrationResponses for an Integration.
  Future<void> getIntegrationResponses(
      {@required String apiId,
      @required String integrationId,
      String maxResults,
      String nextToken}) async {}

  /// Gets the Integrations for an API.
  Future<void> getIntegrations(String apiId,
      {String maxResults, String nextToken}) async {}

  /// Gets a Model.
  Future<void> getModel(
      {@required String apiId, @required String modelId}) async {}

  /// Gets a model template.
  Future<void> getModelTemplate(
      {@required String apiId, @required String modelId}) async {}

  /// Gets the Models for an API.
  Future<void> getModels(String apiId,
      {String maxResults, String nextToken}) async {}

  /// Gets a Route.
  Future<void> getRoute(
      {@required String apiId, @required String routeId}) async {}

  /// Gets a RouteResponse.
  Future<void> getRouteResponse(
      {@required String apiId,
      @required String routeId,
      @required String routeResponseId}) async {}

  /// Gets the RouteResponses for a Route.
  Future<void> getRouteResponses(
      {@required String apiId,
      String maxResults,
      String nextToken,
      @required String routeId}) async {}

  /// Gets the Routes for an API.
  Future<void> getRoutes(String apiId,
      {String maxResults, String nextToken}) async {}

  /// Gets a Stage.
  Future<void> getStage(
      {@required String apiId, @required String stageName}) async {}

  /// Gets the Stages for an API.
  Future<void> getStages(String apiId,
      {String maxResults, String nextToken}) async {}

  /// Gets the Tags for an API.
  Future<void> getTags(String resourceArn) async {}

  /// Tag an APIGW resource
  Future<void> tagResource(String resourceArn,
      {Map<String, String> tags}) async {}

  /// Untag an APIGW resource
  Future<void> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {}

  /// Updates an Api resource.
  Future<void> updateApi(String apiId,
      {String apiKeySelectionExpression,
      String description,
      bool disableSchemaValidation,
      String name,
      String routeSelectionExpression,
      String version}) async {}

  /// The API mapping.
  Future<void> updateApiMapping(
      {@required String apiId,
      @required String apiMappingId,
      String apiMappingKey,
      @required String domainName,
      String stage}) async {}

  /// Updates an Authorizer.
  Future<void> updateAuthorizer(
      {@required String apiId,
      String authorizerCredentialsArn,
      @required String authorizerId,
      int authorizerResultTtlInSeconds,
      String authorizerType,
      String authorizerUri,
      List<String> identitySource,
      String identityValidationExpression,
      String name,
      List<String> providerArns}) async {}

  /// Updates a Deployment.
  Future<void> updateDeployment(
      {@required String apiId,
      @required String deploymentId,
      String description}) async {}

  /// Updates a domain name.
  Future<void> updateDomainName(String domainName,
      {List<DomainNameConfiguration> domainNameConfigurations}) async {}

  /// Updates an Integration.
  Future<void> updateIntegration(
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
      int timeoutInMillis}) async {}

  /// Updates an IntegrationResponses.
  Future<void> updateIntegrationResponse(
      {@required String apiId,
      String contentHandlingStrategy,
      @required String integrationId,
      @required String integrationResponseId,
      String integrationResponseKey,
      Map<String, String> responseParameters,
      Map<String, String> responseTemplates,
      String templateSelectionExpression}) async {}

  /// Updates a Model.
  Future<void> updateModel(
      {@required String apiId,
      String contentType,
      String description,
      @required String modelId,
      String name,
      String schema}) async {}

  /// Updates a Route.
  Future<void> updateRoute(
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
      String target}) async {}

  /// Updates a RouteResponse.
  Future<void> updateRouteResponse(
      {@required String apiId,
      String modelSelectionExpression,
      Map<String, String> responseModels,
      Map<String, ParameterConstraints> responseParameters,
      @required String routeId,
      @required String routeResponseId,
      String routeResponseKey}) async {}

  /// Updates a Stage.
  Future<void> updateStage(
      {AccessLogSettings accessLogSettings,
      @required String apiId,
      String clientCertificateId,
      RouteSettings defaultRouteSettings,
      String deploymentId,
      String description,
      Map<String, RouteSettings> routeSettings,
      @required String stageName,
      Map<String, String> stageVariables}) async {}
}

class AccessLogSettings {}

class Api {}

class ApiMapping {}

class Authorizer {}

class CreateApiMappingResponse {}

class CreateApiResponse {}

class CreateAuthorizerResponse {}

class CreateDeploymentResponse {}

class CreateDomainNameResponse {}

class CreateIntegrationResponse {}

class CreateIntegrationResponseResponse {}

class CreateModelResponse {}

class CreateRouteResponse {}

class CreateRouteResponseResponse {}

class CreateStageResponse {}

class Deployment {}

class DomainName {}

class DomainNameConfiguration {}

class GetApiMappingResponse {}

class GetApiMappingsResponse {}

class GetApiResponse {}

class GetApisResponse {}

class GetAuthorizerResponse {}

class GetAuthorizersResponse {}

class GetDeploymentResponse {}

class GetDeploymentsResponse {}

class GetDomainNameResponse {}

class GetDomainNamesResponse {}

class GetIntegrationResponse {}

class GetIntegrationResponseResponse {}

class GetIntegrationResponsesResponse {}

class GetIntegrationsResponse {}

class GetModelResponse {}

class GetModelTemplateResponse {}

class GetModelsResponse {}

class GetRouteResponse {}

class GetRouteResponseResponse {}

class GetRouteResponsesResponse {}

class GetRoutesResponse {}

class GetStageResponse {}

class GetStagesResponse {}

class Integration {}

class IntegrationResponse {}

class GetTagsResponse {}

class Model {}

class ParameterConstraints {}

class Route {}

class RouteResponse {}

class RouteSettings {}

class Stage {}

class TagResourceResponse {}

class UpdateApiMappingResponse {}

class UpdateApiResponse {}

class UpdateAuthorizerResponse {}

class UpdateDeploymentResponse {}

class UpdateDomainNameResponse {}

class UpdateIntegrationResponse {}

class UpdateIntegrationResponseResponse {}

class UpdateModelResponse {}

class UpdateRouteResponse {}

class UpdateRouteResponseResponse {}

class UpdateStageResponse {}
