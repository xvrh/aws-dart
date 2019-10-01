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
  /// [AWS
  /// CLI](https://docs.aws.amazon.com/cli/latest/reference/apigateway/create-api-key.html)
  Future<void> createApiKey(
      {String name,
      String description,
      bool enabled,
      bool generateDistinctId,
      String value,
      List<StageKey> stageKeys,
      String customerId,
      Map<String, String> tags}) async {}

  /// Adds a new Authorizer resource to an existing RestApi resource.
  ///
  /// [AWS
  /// CLI](https://docs.aws.amazon.com/cli/latest/reference/apigateway/create-authorizer.html)
  Future<void> createAuthorizer(
      {@required String restApiId,
      @required String name,
      @required String type,
      List<String> providerARNs,
      String authType,
      String authorizerUri,
      String authorizerCredentials,
      String identitySource,
      String identityValidationExpression,
      int authorizerResultTtlInSeconds}) async {}

  /// Creates a new BasePathMapping resource.
  Future<void> createBasePathMapping(
      {@required String domainName,
      String basePath,
      @required String restApiId,
      String stage}) async {}

  /// Creates a Deployment resource, which makes a specified RestApi callable
  /// over the internet.
  Future<void> createDeployment(String restApiId,
      {String stageName,
      String stageDescription,
      String description,
      bool cacheClusterEnabled,
      String cacheClusterSize,
      Map<String, String> variables,
      DeploymentCanarySettings canarySettings,
      bool tracingEnabled}) async {}

  Future<void> createDocumentationPart(
      {@required String restApiId,
      @required DocumentationPartLocation location,
      @required String properties}) async {}

  Future<void> createDocumentationVersion(
      {@required String restApiId,
      @required String documentationVersion,
      String stageName,
      String description}) async {}

  /// Creates a new domain name.
  Future<void> createDomainName(String domainName,
      {String certificateName,
      String certificateBody,
      String certificatePrivateKey,
      String certificateChain,
      String certificateArn,
      String regionalCertificateName,
      String regionalCertificateArn,
      EndpointConfiguration endpointConfiguration,
      Map<String, String> tags,
      String securityPolicy}) async {}

  /// Adds a new Model resource to an existing RestApi resource.
  Future<void> createModel(
      {@required String restApiId,
      @required String name,
      String description,
      String schema,
      @required String contentType}) async {}

  /// Creates a ReqeustValidator of a given RestApi.
  Future<void> createRequestValidator(String restApiId,
      {String name,
      bool validateRequestBody,
      bool validateRequestParameters}) async {}

  /// Creates a Resource resource.
  Future<void> createResource(
      {@required String restApiId,
      @required String parentId,
      @required String pathPart}) async {}

  /// Creates a new RestApi resource.
  Future<void> createRestApi(String name,
      {String description,
      String version,
      String cloneFrom,
      List<String> binaryMediaTypes,
      int minimumCompressionSize,
      String apiKeySource,
      EndpointConfiguration endpointConfiguration,
      String policy,
      Map<String, String> tags}) async {}

  /// Creates a new Stage resource that references a pre-existing Deployment for
  /// the API.
  Future<void> createStage(
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
      Map<String, String> tags}) async {}

  /// Creates a usage plan with the throttle and quota limits, as well as the
  /// associated API stages, specified in the payload.
  Future<void> createUsagePlan(String name,
      {String description,
      List<ApiStage> apiStages,
      ThrottleSettings throttle,
      QuotaSettings quota,
      Map<String, String> tags}) async {}

  /// Creates a usage plan key for adding an existing API key to a usage plan.
  Future<void> createUsagePlanKey(
      {@required String usagePlanId,
      @required String keyId,
      @required String keyType}) async {}

  /// Creates a VPC link, under the caller's account in a selected region, in an
  /// asynchronous operation that typically takes 2-4 minutes to complete and
  /// become operational. The caller must have permissions to create and update
  /// VPC Endpoint services.
  Future<void> createVpcLink(
      {@required String name,
      String description,
      @required List<String> targetArns,
      Map<String, String> tags}) async {}

  /// Deletes the ApiKey resource.
  Future<void> deleteApiKey(String apiKey) async {}

  /// Deletes an existing Authorizer resource.
  ///
  /// [AWS
  /// CLI](https://docs.aws.amazon.com/cli/latest/reference/apigateway/delete-authorizer.html)
  Future<void> deleteAuthorizer(
      {@required String restApiId, @required String authorizerId}) async {}

  /// Deletes the BasePathMapping resource.
  Future<void> deleteBasePathMapping(
      {@required String domainName, @required String basePath}) async {}

  /// Deletes the ClientCertificate resource.
  Future<void> deleteClientCertificate(String clientCertificateId) async {}

  /// Deletes a Deployment resource. Deleting a deployment will only succeed if
  /// there are no Stage resources associated with it.
  Future<void> deleteDeployment(
      {@required String restApiId, @required String deploymentId}) async {}

  Future<void> deleteDocumentationPart(
      {@required String restApiId,
      @required String documentationPartId}) async {}

  Future<void> deleteDocumentationVersion(
      {@required String restApiId,
      @required String documentationVersion}) async {}

  /// Deletes the DomainName resource.
  Future<void> deleteDomainName(String domainName) async {}

  /// Clears any customization of a GatewayResponse of a specified response type
  /// on the given RestApi and resets it with the default settings.
  Future<void> deleteGatewayResponse(
      {@required String restApiId, @required String responseType}) async {}

  /// Represents a delete integration.
  Future<void> deleteIntegration(
      {@required String restApiId,
      @required String resourceId,
      @required String httpMethod}) async {}

  /// Represents a delete integration response.
  Future<void> deleteIntegrationResponse(
      {@required String restApiId,
      @required String resourceId,
      @required String httpMethod,
      @required String statusCode}) async {}

  /// Deletes an existing Method resource.
  Future<void> deleteMethod(
      {@required String restApiId,
      @required String resourceId,
      @required String httpMethod}) async {}

  /// Deletes an existing MethodResponse resource.
  Future<void> deleteMethodResponse(
      {@required String restApiId,
      @required String resourceId,
      @required String httpMethod,
      @required String statusCode}) async {}

  /// Deletes a model.
  Future<void> deleteModel(
      {@required String restApiId, @required String modelName}) async {}

  /// Deletes a RequestValidator of a given RestApi.
  Future<void> deleteRequestValidator(
      {@required String restApiId,
      @required String requestValidatorId}) async {}

  /// Deletes a Resource resource.
  Future<void> deleteResource(
      {@required String restApiId, @required String resourceId}) async {}

  /// Deletes the specified API.
  Future<void> deleteRestApi(String restApiId) async {}

  /// Deletes a Stage resource.
  Future<void> deleteStage(
      {@required String restApiId, @required String stageName}) async {}

  /// Deletes a usage plan of a given plan Id.
  Future<void> deleteUsagePlan(String usagePlanId) async {}

  /// Deletes a usage plan key and remove the underlying API key from the
  /// associated usage plan.
  Future<void> deleteUsagePlanKey(
      {@required String usagePlanId, @required String keyId}) async {}

  /// Deletes an existing VpcLink of a specified identifier.
  Future<void> deleteVpcLink(String vpcLinkId) async {}

  /// Flushes all authorizer cache entries on a stage.
  Future<void> flushStageAuthorizersCache(
      {@required String restApiId, @required String stageName}) async {}

  /// Flushes a stage's cache.
  Future<void> flushStageCache(
      {@required String restApiId, @required String stageName}) async {}

  /// Generates a ClientCertificate resource.
  Future<void> generateClientCertificate(
      {String description, Map<String, String> tags}) async {}

  /// Gets information about the current Account resource.
  Future<void> getAccount() async {}

  /// Gets information about the current ApiKey resource.
  Future<void> getApiKey(String apiKey, {bool includeValue}) async {}

  /// Gets information about the current ApiKeys resource.
  Future<void> getApiKeys(
      {String position,
      int limit,
      String nameQuery,
      String customerId,
      bool includeValues}) async {}

  /// Describe an existing Authorizer resource.
  ///
  /// [AWS
  /// CLI](https://docs.aws.amazon.com/cli/latest/reference/apigateway/get-authorizer.html)
  Future<void> getAuthorizer(
      {@required String restApiId, @required String authorizerId}) async {}

  /// Describe an existing Authorizers resource.
  ///
  /// [AWS
  /// CLI](https://docs.aws.amazon.com/cli/latest/reference/apigateway/get-authorizers.html)
  Future<void> getAuthorizers(String restApiId,
      {String position, int limit}) async {}

  /// Describe a BasePathMapping resource.
  Future<void> getBasePathMapping(
      {@required String domainName, @required String basePath}) async {}

  /// Represents a collection of BasePathMapping resources.
  Future<void> getBasePathMappings(String domainName,
      {String position, int limit}) async {}

  /// Gets information about the current ClientCertificate resource.
  Future<void> getClientCertificate(String clientCertificateId) async {}

  /// Gets a collection of ClientCertificate resources.
  Future<void> getClientCertificates({String position, int limit}) async {}

  /// Gets information about a Deployment resource.
  Future<void> getDeployment(
      {@required String restApiId,
      @required String deploymentId,
      List<String> embed}) async {}

  /// Gets information about a Deployments collection.
  Future<void> getDeployments(String restApiId,
      {String position, int limit}) async {}

  Future<void> getDocumentationPart(
      {@required String restApiId,
      @required String documentationPartId}) async {}

  Future<void> getDocumentationParts(String restApiId,
      {String type,
      String nameQuery,
      String path,
      String position,
      int limit,
      String locationStatus}) async {}

  Future<void> getDocumentationVersion(
      {@required String restApiId,
      @required String documentationVersion}) async {}

  Future<void> getDocumentationVersions(String restApiId,
      {String position, int limit}) async {}

  /// Represents a domain name that is contained in a simpler, more intuitive
  /// URL that can be called.
  Future<void> getDomainName(String domainName) async {}

  /// Represents a collection of DomainName resources.
  Future<void> getDomainNames({String position, int limit}) async {}

  /// Exports a deployed version of a RestApi in a specified format.
  Future<void> getExport(
      {@required String restApiId,
      @required String stageName,
      @required String exportType,
      Map<String, String> parameters,
      String accepts}) async {}

  /// Gets a GatewayResponse of a specified response type on the given RestApi.
  Future<void> getGatewayResponse(
      {@required String restApiId, @required String responseType}) async {}

  /// Gets the GatewayResponses collection on the given RestApi. If an API
  /// developer has not added any definitions for gateway responses, the result
  /// will be the API Gateway-generated default GatewayResponses collection for
  /// the supported response types.
  Future<void> getGatewayResponses(String restApiId,
      {String position, int limit}) async {}

  /// Get the integration settings.
  Future<void> getIntegration(
      {@required String restApiId,
      @required String resourceId,
      @required String httpMethod}) async {}

  /// Represents a get integration response.
  Future<void> getIntegrationResponse(
      {@required String restApiId,
      @required String resourceId,
      @required String httpMethod,
      @required String statusCode}) async {}

  /// Describe an existing Method resource.
  Future<void> getMethod(
      {@required String restApiId,
      @required String resourceId,
      @required String httpMethod}) async {}

  /// Describes a MethodResponse resource.
  Future<void> getMethodResponse(
      {@required String restApiId,
      @required String resourceId,
      @required String httpMethod,
      @required String statusCode}) async {}

  /// Describes an existing model defined for a RestApi resource.
  Future<void> getModel(
      {@required String restApiId,
      @required String modelName,
      bool flatten}) async {}

  /// Generates a sample mapping template that can be used to transform a
  /// payload into the structure of a model.
  Future<void> getModelTemplate(
      {@required String restApiId, @required String modelName}) async {}

  /// Describes existing Models defined for a RestApi resource.
  Future<void> getModels(String restApiId,
      {String position, int limit}) async {}

  /// Gets a RequestValidator of a given RestApi.
  Future<void> getRequestValidator(
      {@required String restApiId,
      @required String requestValidatorId}) async {}

  /// Gets the RequestValidators collection of a given RestApi.
  Future<void> getRequestValidators(String restApiId,
      {String position, int limit}) async {}

  /// Lists information about a resource.
  Future<void> getResource(
      {@required String restApiId,
      @required String resourceId,
      List<String> embed}) async {}

  /// Lists information about a collection of Resource resources.
  Future<void> getResources(String restApiId,
      {String position, int limit, List<String> embed}) async {}

  /// Lists the RestApi resource in the collection.
  Future<void> getRestApi(String restApiId) async {}

  /// Lists the RestApis resources for your collection.
  Future<void> getRestApis({String position, int limit}) async {}

  /// Generates a client SDK for a RestApi and Stage.
  Future<void> getSdk(
      {@required String restApiId,
      @required String stageName,
      @required String sdkType,
      Map<String, String> parameters}) async {}

  Future<void> getSdkType(String id) async {}

  Future<void> getSdkTypes({String position, int limit}) async {}

  /// Gets information about a Stage resource.
  Future<void> getStage(
      {@required String restApiId, @required String stageName}) async {}

  /// Gets information about one or more Stage resources.
  Future<void> getStages(String restApiId, {String deploymentId}) async {}

  /// Gets the Tags collection for a given resource.
  Future<void> getTags(String resourceArn,
      {String position, int limit}) async {}

  /// Gets the usage data of a usage plan in a specified time interval.
  Future<void> getUsage(
      {@required String usagePlanId,
      String keyId,
      @required String startDate,
      @required String endDate,
      String position,
      int limit}) async {}

  /// Gets a usage plan of a given plan identifier.
  Future<void> getUsagePlan(String usagePlanId) async {}

  /// Gets a usage plan key of a given key identifier.
  Future<void> getUsagePlanKey(
      {@required String usagePlanId, @required String keyId}) async {}

  /// Gets all the usage plan keys representing the API keys added to a
  /// specified usage plan.
  Future<void> getUsagePlanKeys(String usagePlanId,
      {String position, int limit, String nameQuery}) async {}

  /// Gets all the usage plans of the caller's account.
  Future<void> getUsagePlans(
      {String position, String keyId, int limit}) async {}

  /// Gets a specified VPC link under the caller's account in a region.
  Future<void> getVpcLink(String vpcLinkId) async {}

  /// Gets the VpcLinks collection under the caller's account in a selected
  /// region.
  Future<void> getVpcLinks({String position, int limit}) async {}

  /// Import API keys from an external source, such as a CSV-formatted file.
  Future<void> importApiKeys(
      {@required Uint8List body,
      @required String format,
      bool failOnWarnings}) async {}

  Future<void> importDocumentationParts(
      {@required String restApiId,
      String mode,
      bool failOnWarnings,
      @required Uint8List body}) async {}

  /// A feature of the API Gateway control service for creating a new API from
  /// an external API definition file.
  Future<void> importRestApi(Uint8List body,
      {bool failOnWarnings, Map<String, String> parameters}) async {}

  /// Creates a customization of a GatewayResponse of a specified response type
  /// and status code on the given RestApi.
  Future<void> putGatewayResponse(
      {@required String restApiId,
      @required String responseType,
      String statusCode,
      Map<String, String> responseParameters,
      Map<String, String> responseTemplates}) async {}

  /// Sets up a method's integration.
  Future<void> putIntegration(
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
      int timeoutInMillis}) async {}

  /// Represents a put integration.
  Future<void> putIntegrationResponse(
      {@required String restApiId,
      @required String resourceId,
      @required String httpMethod,
      @required String statusCode,
      String selectionPattern,
      Map<String, String> responseParameters,
      Map<String, String> responseTemplates,
      String contentHandling}) async {}

  /// Add a method to an existing Resource resource.
  Future<void> putMethod(
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
      List<String> authorizationScopes}) async {}

  /// Adds a MethodResponse to an existing Method resource.
  Future<void> putMethodResponse(
      {@required String restApiId,
      @required String resourceId,
      @required String httpMethod,
      @required String statusCode,
      Map<String, bool> responseParameters,
      Map<String, String> responseModels}) async {}

  /// A feature of the API Gateway control service for updating an existing API
  /// with an input of external API definitions. The update can take the form of
  /// merging the supplied definition into the existing API or overwriting the
  /// existing API.
  Future<void> putRestApi(
      {@required String restApiId,
      String mode,
      bool failOnWarnings,
      Map<String, String> parameters,
      @required Uint8List body}) async {}

  /// Adds or updates a tag on a given resource.
  Future<void> tagResource(
      {@required String resourceArn,
      @required Map<String, String> tags}) async {}

  /// Simulate the execution of an Authorizer in your RestApi with headers,
  /// parameters, and an incoming request body.
  ///
  ///  [Use Lambda Function as
  /// Authorizer](https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-use-lambda-authorizer.html)
  /// [Use Cognito User Pool as
  /// Authorizer](https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-integrate-with-cognito.html)
  Future<void> testInvokeAuthorizer(
      {@required String restApiId,
      @required String authorizerId,
      Map<String, String> headers,
      Map<String, List<String>> multiValueHeaders,
      String pathWithQueryString,
      String body,
      Map<String, String> stageVariables,
      Map<String, String> additionalContext}) async {}

  /// Simulate the execution of a Method in your RestApi with headers,
  /// parameters, and an incoming request body.
  Future<void> testInvokeMethod(
      {@required String restApiId,
      @required String resourceId,
      @required String httpMethod,
      String pathWithQueryString,
      String body,
      Map<String, String> headers,
      Map<String, List<String>> multiValueHeaders,
      String clientCertificateId,
      Map<String, String> stageVariables}) async {}

  /// Removes a tag from a given resource.
  Future<void> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {}

  /// Changes information about the current Account resource.
  Future<void> updateAccount({List<PatchOperation> patchOperations}) async {}

  /// Changes information about an ApiKey resource.
  Future<void> updateApiKey(String apiKey,
      {List<PatchOperation> patchOperations}) async {}

  /// Updates an existing Authorizer resource.
  ///
  /// [AWS
  /// CLI](https://docs.aws.amazon.com/cli/latest/reference/apigateway/update-authorizer.html)
  Future<void> updateAuthorizer(
      {@required String restApiId,
      @required String authorizerId,
      List<PatchOperation> patchOperations}) async {}

  /// Changes information about the BasePathMapping resource.
  Future<void> updateBasePathMapping(
      {@required String domainName,
      @required String basePath,
      List<PatchOperation> patchOperations}) async {}

  /// Changes information about an ClientCertificate resource.
  Future<void> updateClientCertificate(String clientCertificateId,
      {List<PatchOperation> patchOperations}) async {}

  /// Changes information about a Deployment resource.
  Future<void> updateDeployment(
      {@required String restApiId,
      @required String deploymentId,
      List<PatchOperation> patchOperations}) async {}

  Future<void> updateDocumentationPart(
      {@required String restApiId,
      @required String documentationPartId,
      List<PatchOperation> patchOperations}) async {}

  Future<void> updateDocumentationVersion(
      {@required String restApiId,
      @required String documentationVersion,
      List<PatchOperation> patchOperations}) async {}

  /// Changes information about the DomainName resource.
  Future<void> updateDomainName(String domainName,
      {List<PatchOperation> patchOperations}) async {}

  /// Updates a GatewayResponse of a specified response type on the given
  /// RestApi.
  Future<void> updateGatewayResponse(
      {@required String restApiId,
      @required String responseType,
      List<PatchOperation> patchOperations}) async {}

  /// Represents an update integration.
  Future<void> updateIntegration(
      {@required String restApiId,
      @required String resourceId,
      @required String httpMethod,
      List<PatchOperation> patchOperations}) async {}

  /// Represents an update integration response.
  Future<void> updateIntegrationResponse(
      {@required String restApiId,
      @required String resourceId,
      @required String httpMethod,
      @required String statusCode,
      List<PatchOperation> patchOperations}) async {}

  /// Updates an existing Method resource.
  Future<void> updateMethod(
      {@required String restApiId,
      @required String resourceId,
      @required String httpMethod,
      List<PatchOperation> patchOperations}) async {}

  /// Updates an existing MethodResponse resource.
  Future<void> updateMethodResponse(
      {@required String restApiId,
      @required String resourceId,
      @required String httpMethod,
      @required String statusCode,
      List<PatchOperation> patchOperations}) async {}

  /// Changes information about a model.
  Future<void> updateModel(
      {@required String restApiId,
      @required String modelName,
      List<PatchOperation> patchOperations}) async {}

  /// Updates a RequestValidator of a given RestApi.
  Future<void> updateRequestValidator(
      {@required String restApiId,
      @required String requestValidatorId,
      List<PatchOperation> patchOperations}) async {}

  /// Changes information about a Resource resource.
  Future<void> updateResource(
      {@required String restApiId,
      @required String resourceId,
      List<PatchOperation> patchOperations}) async {}

  /// Changes information about the specified API.
  Future<void> updateRestApi(String restApiId,
      {List<PatchOperation> patchOperations}) async {}

  /// Changes information about a Stage resource.
  Future<void> updateStage(
      {@required String restApiId,
      @required String stageName,
      List<PatchOperation> patchOperations}) async {}

  /// Grants a temporary extension to the remaining quota of a usage plan
  /// associated with a specified API key.
  Future<void> updateUsage(
      {@required String usagePlanId,
      @required String keyId,
      List<PatchOperation> patchOperations}) async {}

  /// Updates a usage plan of a given plan Id.
  Future<void> updateUsagePlan(String usagePlanId,
      {List<PatchOperation> patchOperations}) async {}

  /// Updates an existing VpcLink of a specified identifier.
  Future<void> updateVpcLink(String vpcLinkId,
      {List<PatchOperation> patchOperations}) async {}
}

class AccessLogSettings {}

class Account {}

class ApiKey {}

class ApiKeyIds {}

class ApiKeys {}

class ApiStage {}

class Authorizer {}

class Authorizers {}

class BasePathMapping {}

class BasePathMappings {}

class CanarySettings {}

class ClientCertificate {}

class ClientCertificates {}

class Deployment {}

class DeploymentCanarySettings {}

class Deployments {}

class DocumentationPart {}

class DocumentationPartIds {}

class DocumentationPartLocation {}

class DocumentationParts {}

class DocumentationVersion {}

class DocumentationVersions {}

class DomainName {}

class DomainNames {}

class EndpointConfiguration {}

class ExportResponse {}

class GatewayResponse {}

class GatewayResponses {}

class Integration {}

class IntegrationResponse {}

class Method {}

class MethodResponse {}

class MethodSetting {}

class MethodSnapshot {}

class Model {}

class Models {}

class PatchOperation {}

class QuotaSettings {}

class RequestValidator {}

class RequestValidators {}

class Resource {}

class Resources {}

class RestApi {}

class RestApis {}

class SdkConfigurationProperty {}

class SdkResponse {}

class SdkType {}

class SdkTypes {}

class Stage {}

class StageKey {}

class Stages {}

class Tags {}

class Template {}

class TestInvokeAuthorizerResponse {}

class TestInvokeMethodResponse {}

class ThrottleSettings {}

class Usage {}

class UsagePlan {}

class UsagePlanKey {}

class UsagePlanKeys {}

class UsagePlans {}

class VpcLink {}

class VpcLinks {}
