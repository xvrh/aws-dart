import 'package:meta/meta.dart';
import 'dart:typed_data';

/// AWS AppSync provides API actions for creating and interacting with data
/// sources using GraphQL from your application.
class AppSyncApi {
  /// Creates a unique key that you can distribute to clients who are executing
  /// your API.
  Future<void> createApiKey(String apiId,
      {String description, BigInt expires}) async {}

  /// Creates a `DataSource` object.
  Future<void> createDataSource(
      {@required String apiId,
      @required String name,
      String description,
      @required String type,
      String serviceRoleArn,
      DynamodbDataSourceConfig dynamodbConfig,
      LambdaDataSourceConfig lambdaConfig,
      ElasticsearchDataSourceConfig elasticsearchConfig,
      HttpDataSourceConfig httpConfig,
      RelationalDatabaseDataSourceConfig relationalDatabaseConfig}) async {}

  /// Creates a `Function` object.
  ///
  /// A function is a reusable entity. Multiple functions can be used to compose
  /// the resolver logic.
  Future<void> createFunction(
      {@required String apiId,
      @required String name,
      String description,
      @required String dataSourceName,
      @required String requestMappingTemplate,
      String responseMappingTemplate,
      @required String functionVersion}) async {}

  /// Creates a `GraphqlApi` object.
  Future<void> createGraphqlApi(
      {@required String name,
      LogConfig logConfig,
      @required String authenticationType,
      UserPoolConfig userPoolConfig,
      OpenIDConnectConfig openIDConnectConfig,
      Map<String, String> tags,
      List<AdditionalAuthenticationProvider>
          additionalAuthenticationProviders}) async {}

  /// Creates a `Resolver` object.
  ///
  /// A resolver converts incoming requests into a format that a data source can
  /// understand and converts the data source's responses into GraphQL.
  Future<void> createResolver(
      {@required String apiId,
      @required String typeName,
      @required String fieldName,
      String dataSourceName,
      @required String requestMappingTemplate,
      String responseMappingTemplate,
      String kind,
      PipelineConfig pipelineConfig}) async {}

  /// Creates a `Type` object.
  Future<void> createType(
      {@required String apiId,
      @required String definition,
      @required String format}) async {}

  /// Deletes an API key.
  Future<void> deleteApiKey(
      {@required String apiId, @required String id}) async {}

  /// Deletes a `DataSource` object.
  Future<void> deleteDataSource(
      {@required String apiId, @required String name}) async {}

  /// Deletes a `Function`.
  Future<void> deleteFunction(
      {@required String apiId, @required String functionId}) async {}

  /// Deletes a `GraphqlApi` object.
  Future<void> deleteGraphqlApi(String apiId) async {}

  /// Deletes a `Resolver` object.
  Future<void> deleteResolver(
      {@required String apiId,
      @required String typeName,
      @required String fieldName}) async {}

  /// Deletes a `Type` object.
  Future<void> deleteType(
      {@required String apiId, @required String typeName}) async {}

  /// Retrieves a `DataSource` object.
  Future<void> getDataSource(
      {@required String apiId, @required String name}) async {}

  /// Get a `Function`.
  Future<void> getFunction(
      {@required String apiId, @required String functionId}) async {}

  /// Retrieves a `GraphqlApi` object.
  Future<void> getGraphqlApi(String apiId) async {}

  /// Retrieves the introspection schema for a GraphQL API.
  Future<void> getIntrospectionSchema(
      {@required String apiId,
      @required String format,
      bool includeDirectives}) async {}

  /// Retrieves a `Resolver` object.
  Future<void> getResolver(
      {@required String apiId,
      @required String typeName,
      @required String fieldName}) async {}

  /// Retrieves the current status of a schema creation operation.
  Future<void> getSchemaCreationStatus(String apiId) async {}

  /// Retrieves a `Type` object.
  Future<void> getType(
      {@required String apiId,
      @required String typeName,
      @required String format}) async {}

  /// Lists the API keys for a given API.
  ///
  ///
  ///
  /// API keys are deleted automatically sometime after they expire. However,
  /// they may still be included in the response until they have actually been
  /// deleted. You can safely call `DeleteApiKey` to manually delete a key
  /// before it's automatically deleted.
  Future<void> listApiKeys(String apiId,
      {String nextToken, int maxResults}) async {}

  /// Lists the data sources for a given API.
  Future<void> listDataSources(String apiId,
      {String nextToken, int maxResults}) async {}

  /// List multiple functions.
  Future<void> listFunctions(String apiId,
      {String nextToken, int maxResults}) async {}

  /// Lists your GraphQL APIs.
  Future<void> listGraphqlApis({String nextToken, int maxResults}) async {}

  /// Lists the resolvers for a given API and type.
  Future<void> listResolvers(
      {@required String apiId,
      @required String typeName,
      String nextToken,
      int maxResults}) async {}

  /// List the resolvers that are associated with a specific function.
  Future<void> listResolversByFunction(
      {@required String apiId,
      @required String functionId,
      String nextToken,
      int maxResults}) async {}

  /// Lists the tags for a resource.
  Future<void> listTagsForResource(String resourceArn) async {}

  /// Lists the types for a given API.
  Future<void> listTypes(
      {@required String apiId,
      @required String format,
      String nextToken,
      int maxResults}) async {}

  /// Adds a new schema to your GraphQL API.
  ///
  /// This operation is asynchronous. Use to determine when it has completed.
  Future<void> startSchemaCreation(
      {@required String apiId, @required Uint8List definition}) async {}

  /// Tags a resource with user-supplied tags.
  Future<void> tagResource(
      {@required String resourceArn,
      @required Map<String, String> tags}) async {}

  /// Untags a resource.
  Future<void> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {}

  /// Updates an API key.
  Future<void> updateApiKey(
      {@required String apiId,
      @required String id,
      String description,
      BigInt expires}) async {}

  /// Updates a `DataSource` object.
  Future<void> updateDataSource(
      {@required String apiId,
      @required String name,
      String description,
      @required String type,
      String serviceRoleArn,
      DynamodbDataSourceConfig dynamodbConfig,
      LambdaDataSourceConfig lambdaConfig,
      ElasticsearchDataSourceConfig elasticsearchConfig,
      HttpDataSourceConfig httpConfig,
      RelationalDatabaseDataSourceConfig relationalDatabaseConfig}) async {}

  /// Updates a `Function` object.
  Future<void> updateFunction(
      {@required String apiId,
      @required String name,
      String description,
      @required String functionId,
      @required String dataSourceName,
      @required String requestMappingTemplate,
      String responseMappingTemplate,
      @required String functionVersion}) async {}

  /// Updates a `GraphqlApi` object.
  Future<void> updateGraphqlApi(
      {@required String apiId,
      @required String name,
      LogConfig logConfig,
      String authenticationType,
      UserPoolConfig userPoolConfig,
      OpenIDConnectConfig openIDConnectConfig,
      List<AdditionalAuthenticationProvider>
          additionalAuthenticationProviders}) async {}

  /// Updates a `Resolver` object.
  Future<void> updateResolver(
      {@required String apiId,
      @required String typeName,
      @required String fieldName,
      String dataSourceName,
      @required String requestMappingTemplate,
      String responseMappingTemplate,
      String kind,
      PipelineConfig pipelineConfig}) async {}

  /// Updates a `Type` object.
  Future<void> updateType(
      {@required String apiId,
      @required String typeName,
      String definition,
      @required String format}) async {}
}

class AdditionalAuthenticationProvider {}

class ApiKey {}

class AuthorizationConfig {}

class AwsIamConfig {}

class CognitoUserPoolConfig {}

class CreateApiKeyResponse {}

class CreateDataSourceResponse {}

class CreateFunctionResponse {}

class CreateGraphqlApiResponse {}

class CreateResolverResponse {}

class CreateTypeResponse {}

class DataSource {}

class DeleteApiKeyResponse {}

class DeleteDataSourceResponse {}

class DeleteFunctionResponse {}

class DeleteGraphqlApiResponse {}

class DeleteResolverResponse {}

class DeleteTypeResponse {}

class DynamodbDataSourceConfig {}

class ElasticsearchDataSourceConfig {}

class FunctionConfiguration {}

class GetDataSourceResponse {}

class GetFunctionResponse {}

class GetGraphqlApiResponse {}

class GetIntrospectionSchemaResponse {}

class GetResolverResponse {}

class GetSchemaCreationStatusResponse {}

class GetTypeResponse {}

class GraphqlApi {}

class HttpDataSourceConfig {}

class LambdaDataSourceConfig {}

class ListApiKeysResponse {}

class ListDataSourcesResponse {}

class ListFunctionsResponse {}

class ListGraphqlApisResponse {}

class ListResolversByFunctionResponse {}

class ListResolversResponse {}

class ListTagsForResourceResponse {}

class ListTypesResponse {}

class LogConfig {}

class OpenIDConnectConfig {}

class PipelineConfig {}

class RdsHttpEndpointConfig {}

class RelationalDatabaseDataSourceConfig {}

class Resolver {}

class StartSchemaCreationResponse {}

class TagResourceResponse {}

class Type {}

class UntagResourceResponse {}

class UpdateApiKeyResponse {}

class UpdateDataSourceResponse {}

class UpdateFunctionResponse {}

class UpdateGraphqlApiResponse {}

class UpdateResolverResponse {}

class UpdateTypeResponse {}

class UserPoolConfig {}
