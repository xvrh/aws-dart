import 'package:meta/meta.dart';
import 'dart:typed_data';

/// AWS AppSync provides API actions for creating and interacting with data
/// sources using GraphQL from your application.
class AppSyncApi {
  /// Creates a unique key that you can distribute to clients who are executing
  /// your API.
  ///
  /// [apiId]: The ID for your GraphQL API.
  ///
  /// [description]: A description of the purpose of the API key.
  ///
  /// [expires]: The time from creation time after which the API key expires.
  /// The date is represented as seconds since the epoch, rounded down to the
  /// nearest hour. The default value for this parameter is 7 days from creation
  /// time. For more information, see .
  Future<CreateApiKeyResponse> createApiKey(String apiId,
      {String description, BigInt expires}) async {
    return CreateApiKeyResponse.fromJson({});
  }

  /// Creates a `DataSource` object.
  ///
  /// [apiId]: The API ID for the GraphQL API for the `DataSource`.
  ///
  /// [name]: A user-supplied name for the `DataSource`.
  ///
  /// [description]: A description of the `DataSource`.
  ///
  /// [type]: The type of the `DataSource`.
  ///
  /// [serviceRoleArn]: The AWS IAM service role ARN for the data source. The
  /// system assumes this role when accessing the data source.
  ///
  /// [dynamodbConfig]: Amazon DynamoDB settings.
  ///
  /// [lambdaConfig]: AWS Lambda settings.
  ///
  /// [elasticsearchConfig]: Amazon Elasticsearch Service settings.
  ///
  /// [httpConfig]: HTTP endpoint settings.
  ///
  /// [relationalDatabaseConfig]: Relational database settings.
  Future<CreateDataSourceResponse> createDataSource(
      {@required String apiId,
      @required String name,
      String description,
      @required String type,
      String serviceRoleArn,
      DynamodbDataSourceConfig dynamodbConfig,
      LambdaDataSourceConfig lambdaConfig,
      ElasticsearchDataSourceConfig elasticsearchConfig,
      HttpDataSourceConfig httpConfig,
      RelationalDatabaseDataSourceConfig relationalDatabaseConfig}) async {
    return CreateDataSourceResponse.fromJson({});
  }

  /// Creates a `Function` object.
  ///
  /// A function is a reusable entity. Multiple functions can be used to compose
  /// the resolver logic.
  ///
  /// [apiId]: The GraphQL API ID.
  ///
  /// [name]: The `Function` name. The function name does not have to be unique.
  ///
  /// [description]: The `Function` description.
  ///
  /// [dataSourceName]: The `Function` `DataSource` name.
  ///
  /// [requestMappingTemplate]: The `Function` request mapping template.
  /// Functions support only the 2018-05-29 version of the request mapping
  /// template.
  ///
  /// [responseMappingTemplate]: The `Function` response mapping template.
  ///
  /// [functionVersion]: The `version` of the request mapping template.
  /// Currently the supported value is 2018-05-29.
  Future<CreateFunctionResponse> createFunction(
      {@required String apiId,
      @required String name,
      String description,
      @required String dataSourceName,
      @required String requestMappingTemplate,
      String responseMappingTemplate,
      @required String functionVersion}) async {
    return CreateFunctionResponse.fromJson({});
  }

  /// Creates a `GraphqlApi` object.
  ///
  /// [name]: A user-supplied name for the `GraphqlApi`.
  ///
  /// [logConfig]: The Amazon CloudWatch Logs configuration.
  ///
  /// [authenticationType]: The authentication type: API key, AWS IAM, OIDC, or
  /// Amazon Cognito user pools.
  ///
  /// [userPoolConfig]: The Amazon Cognito user pool configuration.
  ///
  /// [openIDConnectConfig]: The OpenID Connect configuration.
  ///
  /// [tags]: A `TagMap` object.
  ///
  /// [additionalAuthenticationProviders]: A list of additional authentication
  /// providers for the `GraphqlApi` API.
  Future<CreateGraphqlApiResponse> createGraphqlApi(
      {@required String name,
      LogConfig logConfig,
      @required String authenticationType,
      UserPoolConfig userPoolConfig,
      OpenIDConnectConfig openIDConnectConfig,
      Map<String, String> tags,
      List<AdditionalAuthenticationProvider>
          additionalAuthenticationProviders}) async {
    return CreateGraphqlApiResponse.fromJson({});
  }

  /// Creates a `Resolver` object.
  ///
  /// A resolver converts incoming requests into a format that a data source can
  /// understand and converts the data source's responses into GraphQL.
  ///
  /// [apiId]: The ID for the GraphQL API for which the resolver is being
  /// created.
  ///
  /// [typeName]: The name of the `Type`.
  ///
  /// [fieldName]: The name of the field to attach the resolver to.
  ///
  /// [dataSourceName]: The name of the data source for which the resolver is
  /// being created.
  ///
  /// [requestMappingTemplate]: The mapping template to be used for requests.
  ///
  /// A resolver uses a request mapping template to convert a GraphQL expression
  /// into a format that a data source can understand. Mapping templates are
  /// written in Apache Velocity Template Language (VTL).
  ///
  /// [responseMappingTemplate]: The mapping template to be used for responses
  /// from the data source.
  ///
  /// [kind]: The resolver type.
  ///
  /// *    **UNIT**: A UNIT resolver type. A UNIT resolver is the default
  /// resolver type. A UNIT resolver enables you to execute a GraphQL query
  /// against a single data source.
  ///
  /// *    **PIPELINE**: A PIPELINE resolver type. A PIPELINE resolver enables
  /// you to execute a series of `Function` in a serial manner. You can use a
  /// pipeline resolver to execute a GraphQL query against multiple data
  /// sources.
  ///
  /// [pipelineConfig]: The `PipelineConfig`.
  Future<CreateResolverResponse> createResolver(
      {@required String apiId,
      @required String typeName,
      @required String fieldName,
      String dataSourceName,
      @required String requestMappingTemplate,
      String responseMappingTemplate,
      String kind,
      PipelineConfig pipelineConfig}) async {
    return CreateResolverResponse.fromJson({});
  }

  /// Creates a `Type` object.
  ///
  /// [apiId]: The API ID.
  ///
  /// [definition]: The type definition, in GraphQL Schema Definition Language
  /// (SDL) format.
  ///
  /// For more information, see the [GraphQL SDL
  /// documentation](http://graphql.org/learn/schema/).
  ///
  /// [format]: The type format: SDL or JSON.
  Future<CreateTypeResponse> createType(
      {@required String apiId,
      @required String definition,
      @required String format}) async {
    return CreateTypeResponse.fromJson({});
  }

  /// Deletes an API key.
  ///
  /// [apiId]: The API ID.
  ///
  /// [id]: The ID for the API key.
  Future<DeleteApiKeyResponse> deleteApiKey(
      {@required String apiId, @required String id}) async {
    return DeleteApiKeyResponse.fromJson({});
  }

  /// Deletes a `DataSource` object.
  ///
  /// [apiId]: The API ID.
  ///
  /// [name]: The name of the data source.
  Future<DeleteDataSourceResponse> deleteDataSource(
      {@required String apiId, @required String name}) async {
    return DeleteDataSourceResponse.fromJson({});
  }

  /// Deletes a `Function`.
  ///
  /// [apiId]: The GraphQL API ID.
  ///
  /// [functionId]: The `Function` ID.
  Future<DeleteFunctionResponse> deleteFunction(
      {@required String apiId, @required String functionId}) async {
    return DeleteFunctionResponse.fromJson({});
  }

  /// Deletes a `GraphqlApi` object.
  ///
  /// [apiId]: The API ID.
  Future<DeleteGraphqlApiResponse> deleteGraphqlApi(String apiId) async {
    return DeleteGraphqlApiResponse.fromJson({});
  }

  /// Deletes a `Resolver` object.
  ///
  /// [apiId]: The API ID.
  ///
  /// [typeName]: The name of the resolver type.
  ///
  /// [fieldName]: The resolver field name.
  Future<DeleteResolverResponse> deleteResolver(
      {@required String apiId,
      @required String typeName,
      @required String fieldName}) async {
    return DeleteResolverResponse.fromJson({});
  }

  /// Deletes a `Type` object.
  ///
  /// [apiId]: The API ID.
  ///
  /// [typeName]: The type name.
  Future<DeleteTypeResponse> deleteType(
      {@required String apiId, @required String typeName}) async {
    return DeleteTypeResponse.fromJson({});
  }

  /// Retrieves a `DataSource` object.
  ///
  /// [apiId]: The API ID.
  ///
  /// [name]: The name of the data source.
  Future<GetDataSourceResponse> getDataSource(
      {@required String apiId, @required String name}) async {
    return GetDataSourceResponse.fromJson({});
  }

  /// Get a `Function`.
  ///
  /// [apiId]: The GraphQL API ID.
  ///
  /// [functionId]: The `Function` ID.
  Future<GetFunctionResponse> getFunction(
      {@required String apiId, @required String functionId}) async {
    return GetFunctionResponse.fromJson({});
  }

  /// Retrieves a `GraphqlApi` object.
  ///
  /// [apiId]: The API ID for the GraphQL API.
  Future<GetGraphqlApiResponse> getGraphqlApi(String apiId) async {
    return GetGraphqlApiResponse.fromJson({});
  }

  /// Retrieves the introspection schema for a GraphQL API.
  ///
  /// [apiId]: The API ID.
  ///
  /// [format]: The schema format: SDL or JSON.
  ///
  /// [includeDirectives]: A flag that specifies whether the schema
  /// introspection should contain directives.
  Future<GetIntrospectionSchemaResponse> getIntrospectionSchema(
      {@required String apiId,
      @required String format,
      bool includeDirectives}) async {
    return GetIntrospectionSchemaResponse.fromJson({});
  }

  /// Retrieves a `Resolver` object.
  ///
  /// [apiId]: The API ID.
  ///
  /// [typeName]: The resolver type name.
  ///
  /// [fieldName]: The resolver field name.
  Future<GetResolverResponse> getResolver(
      {@required String apiId,
      @required String typeName,
      @required String fieldName}) async {
    return GetResolverResponse.fromJson({});
  }

  /// Retrieves the current status of a schema creation operation.
  ///
  /// [apiId]: The API ID.
  Future<GetSchemaCreationStatusResponse> getSchemaCreationStatus(
      String apiId) async {
    return GetSchemaCreationStatusResponse.fromJson({});
  }

  /// Retrieves a `Type` object.
  ///
  /// [apiId]: The API ID.
  ///
  /// [typeName]: The type name.
  ///
  /// [format]: The type format: SDL or JSON.
  Future<GetTypeResponse> getType(
      {@required String apiId,
      @required String typeName,
      @required String format}) async {
    return GetTypeResponse.fromJson({});
  }

  /// Lists the API keys for a given API.
  ///
  ///
  ///
  /// API keys are deleted automatically sometime after they expire. However,
  /// they may still be included in the response until they have actually been
  /// deleted. You can safely call `DeleteApiKey` to manually delete a key
  /// before it's automatically deleted.
  ///
  /// [apiId]: The API ID.
  ///
  /// [nextToken]: An identifier that was returned from the previous call to
  /// this operation, which can be used to return the next set of items in the
  /// list.
  ///
  /// [maxResults]: The maximum number of results you want the request to
  /// return.
  Future<ListApiKeysResponse> listApiKeys(String apiId,
      {String nextToken, int maxResults}) async {
    return ListApiKeysResponse.fromJson({});
  }

  /// Lists the data sources for a given API.
  ///
  /// [apiId]: The API ID.
  ///
  /// [nextToken]: An identifier that was returned from the previous call to
  /// this operation, which can be used to return the next set of items in the
  /// list.
  ///
  /// [maxResults]: The maximum number of results you want the request to
  /// return.
  Future<ListDataSourcesResponse> listDataSources(String apiId,
      {String nextToken, int maxResults}) async {
    return ListDataSourcesResponse.fromJson({});
  }

  /// List multiple functions.
  ///
  /// [apiId]: The GraphQL API ID.
  ///
  /// [nextToken]: An identifier that was returned from the previous call to
  /// this operation, which can be used to return the next set of items in the
  /// list.
  ///
  /// [maxResults]: The maximum number of results you want the request to
  /// return.
  Future<ListFunctionsResponse> listFunctions(String apiId,
      {String nextToken, int maxResults}) async {
    return ListFunctionsResponse.fromJson({});
  }

  /// Lists your GraphQL APIs.
  ///
  /// [nextToken]: An identifier that was returned from the previous call to
  /// this operation, which can be used to return the next set of items in the
  /// list.
  ///
  /// [maxResults]: The maximum number of results you want the request to
  /// return.
  Future<ListGraphqlApisResponse> listGraphqlApis(
      {String nextToken, int maxResults}) async {
    return ListGraphqlApisResponse.fromJson({});
  }

  /// Lists the resolvers for a given API and type.
  ///
  /// [apiId]: The API ID.
  ///
  /// [typeName]: The type name.
  ///
  /// [nextToken]: An identifier that was returned from the previous call to
  /// this operation, which can be used to return the next set of items in the
  /// list.
  ///
  /// [maxResults]: The maximum number of results you want the request to
  /// return.
  Future<ListResolversResponse> listResolvers(
      {@required String apiId,
      @required String typeName,
      String nextToken,
      int maxResults}) async {
    return ListResolversResponse.fromJson({});
  }

  /// List the resolvers that are associated with a specific function.
  ///
  /// [apiId]: The API ID.
  ///
  /// [functionId]: The Function ID.
  ///
  /// [nextToken]: An identifier that was returned from the previous call to
  /// this operation, which you can use to return the next set of items in the
  /// list.
  ///
  /// [maxResults]: The maximum number of results you want the request to
  /// return.
  Future<ListResolversByFunctionResponse> listResolversByFunction(
      {@required String apiId,
      @required String functionId,
      String nextToken,
      int maxResults}) async {
    return ListResolversByFunctionResponse.fromJson({});
  }

  /// Lists the tags for a resource.
  ///
  /// [resourceArn]: The `GraphqlApi` ARN.
  Future<ListTagsForResourceResponse> listTagsForResource(
      String resourceArn) async {
    return ListTagsForResourceResponse.fromJson({});
  }

  /// Lists the types for a given API.
  ///
  /// [apiId]: The API ID.
  ///
  /// [format]: The type format: SDL or JSON.
  ///
  /// [nextToken]: An identifier that was returned from the previous call to
  /// this operation, which can be used to return the next set of items in the
  /// list.
  ///
  /// [maxResults]: The maximum number of results you want the request to
  /// return.
  Future<ListTypesResponse> listTypes(
      {@required String apiId,
      @required String format,
      String nextToken,
      int maxResults}) async {
    return ListTypesResponse.fromJson({});
  }

  /// Adds a new schema to your GraphQL API.
  ///
  /// This operation is asynchronous. Use to determine when it has completed.
  ///
  /// [apiId]: The API ID.
  ///
  /// [definition]: The schema definition, in GraphQL schema language format.
  Future<StartSchemaCreationResponse> startSchemaCreation(
      {@required String apiId, @required Uint8List definition}) async {
    return StartSchemaCreationResponse.fromJson({});
  }

  /// Tags a resource with user-supplied tags.
  ///
  /// [resourceArn]: The `GraphqlApi` ARN.
  ///
  /// [tags]: A `TagMap` object.
  Future<TagResourceResponse> tagResource(
      {@required String resourceArn,
      @required Map<String, String> tags}) async {
    return TagResourceResponse.fromJson({});
  }

  /// Untags a resource.
  ///
  /// [resourceArn]: The `GraphqlApi` ARN.
  ///
  /// [tagKeys]: A list of `TagKey` objects.
  Future<UntagResourceResponse> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {
    return UntagResourceResponse.fromJson({});
  }

  /// Updates an API key.
  ///
  /// [apiId]: The ID for the GraphQL API.
  ///
  /// [id]: The API key ID.
  ///
  /// [description]: A description of the purpose of the API key.
  ///
  /// [expires]: The time from update time after which the API key expires. The
  /// date is represented as seconds since the epoch. For more information, see
  /// .
  Future<UpdateApiKeyResponse> updateApiKey(
      {@required String apiId,
      @required String id,
      String description,
      BigInt expires}) async {
    return UpdateApiKeyResponse.fromJson({});
  }

  /// Updates a `DataSource` object.
  ///
  /// [apiId]: The API ID.
  ///
  /// [name]: The new name for the data source.
  ///
  /// [description]: The new description for the data source.
  ///
  /// [type]: The new data source type.
  ///
  /// [serviceRoleArn]: The new service role ARN for the data source.
  ///
  /// [dynamodbConfig]: The new Amazon DynamoDB configuration.
  ///
  /// [lambdaConfig]: The new AWS Lambda configuration.
  ///
  /// [elasticsearchConfig]: The new Elasticsearch Service configuration.
  ///
  /// [httpConfig]: The new HTTP endpoint configuration.
  ///
  /// [relationalDatabaseConfig]: The new relational database configuration.
  Future<UpdateDataSourceResponse> updateDataSource(
      {@required String apiId,
      @required String name,
      String description,
      @required String type,
      String serviceRoleArn,
      DynamodbDataSourceConfig dynamodbConfig,
      LambdaDataSourceConfig lambdaConfig,
      ElasticsearchDataSourceConfig elasticsearchConfig,
      HttpDataSourceConfig httpConfig,
      RelationalDatabaseDataSourceConfig relationalDatabaseConfig}) async {
    return UpdateDataSourceResponse.fromJson({});
  }

  /// Updates a `Function` object.
  ///
  /// [apiId]: The GraphQL API ID.
  ///
  /// [name]: The `Function` name.
  ///
  /// [description]: The `Function` description.
  ///
  /// [functionId]: The function ID.
  ///
  /// [dataSourceName]: The `Function` `DataSource` name.
  ///
  /// [requestMappingTemplate]: The `Function` request mapping template.
  /// Functions support only the 2018-05-29 version of the request mapping
  /// template.
  ///
  /// [responseMappingTemplate]: The `Function` request mapping template.
  ///
  /// [functionVersion]: The `version` of the request mapping template.
  /// Currently the supported value is 2018-05-29.
  Future<UpdateFunctionResponse> updateFunction(
      {@required String apiId,
      @required String name,
      String description,
      @required String functionId,
      @required String dataSourceName,
      @required String requestMappingTemplate,
      String responseMappingTemplate,
      @required String functionVersion}) async {
    return UpdateFunctionResponse.fromJson({});
  }

  /// Updates a `GraphqlApi` object.
  ///
  /// [apiId]: The API ID.
  ///
  /// [name]: The new name for the `GraphqlApi` object.
  ///
  /// [logConfig]: The Amazon CloudWatch Logs configuration for the `GraphqlApi`
  /// object.
  ///
  /// [authenticationType]: The new authentication type for the `GraphqlApi`
  /// object.
  ///
  /// [userPoolConfig]: The new Amazon Cognito user pool configuration for the
  /// `GraphqlApi` object.
  ///
  /// [openIDConnectConfig]: The OpenID Connect configuration for the
  /// `GraphqlApi` object.
  ///
  /// [additionalAuthenticationProviders]: A list of additional authentication
  /// providers for the `GraphqlApi` API.
  Future<UpdateGraphqlApiResponse> updateGraphqlApi(
      {@required String apiId,
      @required String name,
      LogConfig logConfig,
      String authenticationType,
      UserPoolConfig userPoolConfig,
      OpenIDConnectConfig openIDConnectConfig,
      List<AdditionalAuthenticationProvider>
          additionalAuthenticationProviders}) async {
    return UpdateGraphqlApiResponse.fromJson({});
  }

  /// Updates a `Resolver` object.
  ///
  /// [apiId]: The API ID.
  ///
  /// [typeName]: The new type name.
  ///
  /// [fieldName]: The new field name.
  ///
  /// [dataSourceName]: The new data source name.
  ///
  /// [requestMappingTemplate]: The new request mapping template.
  ///
  /// [responseMappingTemplate]: The new response mapping template.
  ///
  /// [kind]: The resolver type.
  ///
  /// *    **UNIT**: A UNIT resolver type. A UNIT resolver is the default
  /// resolver type. A UNIT resolver enables you to execute a GraphQL query
  /// against a single data source.
  ///
  /// *    **PIPELINE**: A PIPELINE resolver type. A PIPELINE resolver enables
  /// you to execute a series of `Function` in a serial manner. You can use a
  /// pipeline resolver to execute a GraphQL query against multiple data
  /// sources.
  ///
  /// [pipelineConfig]: The `PipelineConfig`.
  Future<UpdateResolverResponse> updateResolver(
      {@required String apiId,
      @required String typeName,
      @required String fieldName,
      String dataSourceName,
      @required String requestMappingTemplate,
      String responseMappingTemplate,
      String kind,
      PipelineConfig pipelineConfig}) async {
    return UpdateResolverResponse.fromJson({});
  }

  /// Updates a `Type` object.
  ///
  /// [apiId]: The API ID.
  ///
  /// [typeName]: The new type name.
  ///
  /// [definition]: The new definition.
  ///
  /// [format]: The new type format: SDL or JSON.
  Future<UpdateTypeResponse> updateType(
      {@required String apiId,
      @required String typeName,
      String definition,
      @required String format}) async {
    return UpdateTypeResponse.fromJson({});
  }
}

class AdditionalAuthenticationProvider {
  /// The authentication type: API key, AWS IAM, OIDC, or Amazon Cognito user
  /// pools.
  final String authenticationType;

  /// The OpenID Connect configuration.
  final OpenIDConnectConfig openIDConnectConfig;

  /// The Amazon Cognito user pool configuration.
  final CognitoUserPoolConfig userPoolConfig;

  AdditionalAuthenticationProvider({
    this.authenticationType,
    this.openIDConnectConfig,
    this.userPoolConfig,
  });
  static AdditionalAuthenticationProvider fromJson(Map<String, dynamic> json) =>
      AdditionalAuthenticationProvider();
}

class ApiKey {
  /// The API key ID.
  final String id;

  /// A description of the purpose of the API key.
  final String description;

  /// The time after which the API key expires. The date is represented as
  /// seconds since the epoch, rounded down to the nearest hour.
  final BigInt expires;

  ApiKey({
    this.id,
    this.description,
    this.expires,
  });
  static ApiKey fromJson(Map<String, dynamic> json) => ApiKey();
}

class AuthorizationConfig {
  /// The authorization type required by the HTTP endpoint.
  ///
  /// *    **AWS_IAM**: The authorization type is Sigv4.
  final String authorizationType;

  /// The AWS IAM settings.
  final AwsIamConfig awsIamConfig;

  AuthorizationConfig({
    @required this.authorizationType,
    this.awsIamConfig,
  });
  static AuthorizationConfig fromJson(Map<String, dynamic> json) =>
      AuthorizationConfig();
}

class AwsIamConfig {
  /// The signing region for AWS IAM authorization.
  final String signingRegion;

  /// The signing service name for AWS IAM authorization.
  final String signingServiceName;

  AwsIamConfig({
    this.signingRegion,
    this.signingServiceName,
  });
  static AwsIamConfig fromJson(Map<String, dynamic> json) => AwsIamConfig();
}

class CognitoUserPoolConfig {
  /// The user pool ID.
  final String userPoolId;

  /// The AWS Region in which the user pool was created.
  final String awsRegion;

  /// A regular expression for validating the incoming Amazon Cognito user pool
  /// app client ID.
  final String appIdClientRegex;

  CognitoUserPoolConfig({
    @required this.userPoolId,
    @required this.awsRegion,
    this.appIdClientRegex,
  });
  static CognitoUserPoolConfig fromJson(Map<String, dynamic> json) =>
      CognitoUserPoolConfig();
}

class CreateApiKeyResponse {
  /// The API key.
  final ApiKey apiKey;

  CreateApiKeyResponse({
    this.apiKey,
  });
  static CreateApiKeyResponse fromJson(Map<String, dynamic> json) =>
      CreateApiKeyResponse();
}

class CreateDataSourceResponse {
  /// The `DataSource` object.
  final DataSource dataSource;

  CreateDataSourceResponse({
    this.dataSource,
  });
  static CreateDataSourceResponse fromJson(Map<String, dynamic> json) =>
      CreateDataSourceResponse();
}

class CreateFunctionResponse {
  /// The `Function` object.
  final FunctionConfiguration functionConfiguration;

  CreateFunctionResponse({
    this.functionConfiguration,
  });
  static CreateFunctionResponse fromJson(Map<String, dynamic> json) =>
      CreateFunctionResponse();
}

class CreateGraphqlApiResponse {
  /// The `GraphqlApi`.
  final GraphqlApi graphqlApi;

  CreateGraphqlApiResponse({
    this.graphqlApi,
  });
  static CreateGraphqlApiResponse fromJson(Map<String, dynamic> json) =>
      CreateGraphqlApiResponse();
}

class CreateResolverResponse {
  /// The `Resolver` object.
  final Resolver resolver;

  CreateResolverResponse({
    this.resolver,
  });
  static CreateResolverResponse fromJson(Map<String, dynamic> json) =>
      CreateResolverResponse();
}

class CreateTypeResponse {
  /// The `Type` object.
  final Type type;

  CreateTypeResponse({
    this.type,
  });
  static CreateTypeResponse fromJson(Map<String, dynamic> json) =>
      CreateTypeResponse();
}

class DataSource {
  /// The data source ARN.
  final String dataSourceArn;

  /// The name of the data source.
  final String name;

  /// The description of the data source.
  final String description;

  /// The type of the data source.
  ///
  /// *    **AMAZON_DYNAMODB**: The data source is an Amazon DynamoDB table.
  ///
  /// *    **AMAZON_ELASTICSEARCH**: The data source is an Amazon Elasticsearch
  /// Service domain.
  ///
  /// *    **AWS_LAMBDA**: The data source is an AWS Lambda function.
  ///
  /// *    **NONE**: There is no data source. This type is used when you wish to
  /// invoke a GraphQL operation without connecting to a data source, such as
  /// performing data transformation with resolvers or triggering a subscription
  /// to be invoked from a mutation.
  ///
  /// *    **HTTP**: The data source is an HTTP endpoint.
  ///
  /// *    **RELATIONAL_DATABASE**: The data source is a relational database.
  final String type;

  /// The AWS IAM service role ARN for the data source. The system assumes this
  /// role when accessing the data source.
  final String serviceRoleArn;

  /// Amazon DynamoDB settings.
  final DynamodbDataSourceConfig dynamodbConfig;

  /// AWS Lambda settings.
  final LambdaDataSourceConfig lambdaConfig;

  /// Amazon Elasticsearch Service settings.
  final ElasticsearchDataSourceConfig elasticsearchConfig;

  /// HTTP endpoint settings.
  final HttpDataSourceConfig httpConfig;

  /// Relational database settings.
  final RelationalDatabaseDataSourceConfig relationalDatabaseConfig;

  DataSource({
    this.dataSourceArn,
    this.name,
    this.description,
    this.type,
    this.serviceRoleArn,
    this.dynamodbConfig,
    this.lambdaConfig,
    this.elasticsearchConfig,
    this.httpConfig,
    this.relationalDatabaseConfig,
  });
  static DataSource fromJson(Map<String, dynamic> json) => DataSource();
}

class DeleteApiKeyResponse {
  DeleteApiKeyResponse();
  static DeleteApiKeyResponse fromJson(Map<String, dynamic> json) =>
      DeleteApiKeyResponse();
}

class DeleteDataSourceResponse {
  DeleteDataSourceResponse();
  static DeleteDataSourceResponse fromJson(Map<String, dynamic> json) =>
      DeleteDataSourceResponse();
}

class DeleteFunctionResponse {
  DeleteFunctionResponse();
  static DeleteFunctionResponse fromJson(Map<String, dynamic> json) =>
      DeleteFunctionResponse();
}

class DeleteGraphqlApiResponse {
  DeleteGraphqlApiResponse();
  static DeleteGraphqlApiResponse fromJson(Map<String, dynamic> json) =>
      DeleteGraphqlApiResponse();
}

class DeleteResolverResponse {
  DeleteResolverResponse();
  static DeleteResolverResponse fromJson(Map<String, dynamic> json) =>
      DeleteResolverResponse();
}

class DeleteTypeResponse {
  DeleteTypeResponse();
  static DeleteTypeResponse fromJson(Map<String, dynamic> json) =>
      DeleteTypeResponse();
}

class DynamodbDataSourceConfig {
  /// The table name.
  final String tableName;

  /// The AWS Region.
  final String awsRegion;

  /// Set to TRUE to use Amazon Cognito credentials with this data source.
  final bool useCallerCredentials;

  DynamodbDataSourceConfig({
    @required this.tableName,
    @required this.awsRegion,
    this.useCallerCredentials,
  });
  static DynamodbDataSourceConfig fromJson(Map<String, dynamic> json) =>
      DynamodbDataSourceConfig();
}

class ElasticsearchDataSourceConfig {
  /// The endpoint.
  final String endpoint;

  /// The AWS Region.
  final String awsRegion;

  ElasticsearchDataSourceConfig({
    @required this.endpoint,
    @required this.awsRegion,
  });
  static ElasticsearchDataSourceConfig fromJson(Map<String, dynamic> json) =>
      ElasticsearchDataSourceConfig();
}

class FunctionConfiguration {
  /// A unique ID representing the `Function` object.
  final String functionId;

  /// The ARN of the `Function` object.
  final String functionArn;

  /// The name of the `Function` object.
  final String name;

  /// The `Function` description.
  final String description;

  /// The name of the `DataSource`.
  final String dataSourceName;

  /// The `Function` request mapping template. Functions support only the
  /// 2018-05-29 version of the request mapping template.
  final String requestMappingTemplate;

  /// The `Function` response mapping template.
  final String responseMappingTemplate;

  /// The version of the request mapping template. Currently only the 2018-05-29
  /// version of the template is supported.
  final String functionVersion;

  FunctionConfiguration({
    this.functionId,
    this.functionArn,
    this.name,
    this.description,
    this.dataSourceName,
    this.requestMappingTemplate,
    this.responseMappingTemplate,
    this.functionVersion,
  });
  static FunctionConfiguration fromJson(Map<String, dynamic> json) =>
      FunctionConfiguration();
}

class GetDataSourceResponse {
  /// The `DataSource` object.
  final DataSource dataSource;

  GetDataSourceResponse({
    this.dataSource,
  });
  static GetDataSourceResponse fromJson(Map<String, dynamic> json) =>
      GetDataSourceResponse();
}

class GetFunctionResponse {
  /// The `Function` object.
  final FunctionConfiguration functionConfiguration;

  GetFunctionResponse({
    this.functionConfiguration,
  });
  static GetFunctionResponse fromJson(Map<String, dynamic> json) =>
      GetFunctionResponse();
}

class GetGraphqlApiResponse {
  /// The `GraphqlApi` object.
  final GraphqlApi graphqlApi;

  GetGraphqlApiResponse({
    this.graphqlApi,
  });
  static GetGraphqlApiResponse fromJson(Map<String, dynamic> json) =>
      GetGraphqlApiResponse();
}

class GetIntrospectionSchemaResponse {
  /// The schema, in GraphQL Schema Definition Language (SDL) format.
  ///
  /// For more information, see the [GraphQL SDL
  /// documentation](http://graphql.org/learn/schema/).
  final Uint8List schema;

  GetIntrospectionSchemaResponse({
    this.schema,
  });
  static GetIntrospectionSchemaResponse fromJson(Map<String, dynamic> json) =>
      GetIntrospectionSchemaResponse();
}

class GetResolverResponse {
  /// The `Resolver` object.
  final Resolver resolver;

  GetResolverResponse({
    this.resolver,
  });
  static GetResolverResponse fromJson(Map<String, dynamic> json) =>
      GetResolverResponse();
}

class GetSchemaCreationStatusResponse {
  /// The current state of the schema (PROCESSING, FAILED, SUCCESS, or
  /// NOT_APPLICABLE). When the schema is in the ACTIVE state, you can add data.
  final String status;

  /// Detailed information about the status of the schema creation operation.
  final String details;

  GetSchemaCreationStatusResponse({
    this.status,
    this.details,
  });
  static GetSchemaCreationStatusResponse fromJson(Map<String, dynamic> json) =>
      GetSchemaCreationStatusResponse();
}

class GetTypeResponse {
  /// The `Type` object.
  final Type type;

  GetTypeResponse({
    this.type,
  });
  static GetTypeResponse fromJson(Map<String, dynamic> json) =>
      GetTypeResponse();
}

class GraphqlApi {
  /// The API name.
  final String name;

  /// The API ID.
  final String apiId;

  /// The authentication type.
  final String authenticationType;

  /// The Amazon CloudWatch Logs configuration.
  final LogConfig logConfig;

  /// The Amazon Cognito user pool configuration.
  final UserPoolConfig userPoolConfig;

  /// The OpenID Connect configuration.
  final OpenIDConnectConfig openIDConnectConfig;

  /// The ARN.
  final String arn;

  /// The URIs.
  final Map<String, String> uris;

  /// The tags.
  final Map<String, String> tags;

  /// A list of additional authentication providers for the `GraphqlApi` API.
  final List<AdditionalAuthenticationProvider>
      additionalAuthenticationProviders;

  GraphqlApi({
    this.name,
    this.apiId,
    this.authenticationType,
    this.logConfig,
    this.userPoolConfig,
    this.openIDConnectConfig,
    this.arn,
    this.uris,
    this.tags,
    this.additionalAuthenticationProviders,
  });
  static GraphqlApi fromJson(Map<String, dynamic> json) => GraphqlApi();
}

class HttpDataSourceConfig {
  /// The HTTP URL endpoint. You can either specify the domain name or IP, and
  /// port combination, and the URL scheme must be HTTP or HTTPS. If the port is
  /// not specified, AWS AppSync uses the default port 80 for the HTTP endpoint
  /// and port 443 for HTTPS endpoints.
  final String endpoint;

  /// The authorization config in case the HTTP endpoint requires authorization.
  final AuthorizationConfig authorizationConfig;

  HttpDataSourceConfig({
    this.endpoint,
    this.authorizationConfig,
  });
  static HttpDataSourceConfig fromJson(Map<String, dynamic> json) =>
      HttpDataSourceConfig();
}

class LambdaDataSourceConfig {
  /// The ARN for the Lambda function.
  final String lambdaFunctionArn;

  LambdaDataSourceConfig({
    @required this.lambdaFunctionArn,
  });
  static LambdaDataSourceConfig fromJson(Map<String, dynamic> json) =>
      LambdaDataSourceConfig();
}

class ListApiKeysResponse {
  /// The `ApiKey` objects.
  final List<ApiKey> apiKeys;

  /// An identifier to be passed in the next request to this operation to return
  /// the next set of items in the list.
  final String nextToken;

  ListApiKeysResponse({
    this.apiKeys,
    this.nextToken,
  });
  static ListApiKeysResponse fromJson(Map<String, dynamic> json) =>
      ListApiKeysResponse();
}

class ListDataSourcesResponse {
  /// The `DataSource` objects.
  final List<DataSource> dataSources;

  /// An identifier to be passed in the next request to this operation to return
  /// the next set of items in the list.
  final String nextToken;

  ListDataSourcesResponse({
    this.dataSources,
    this.nextToken,
  });
  static ListDataSourcesResponse fromJson(Map<String, dynamic> json) =>
      ListDataSourcesResponse();
}

class ListFunctionsResponse {
  /// A list of `Function` objects.
  final List<FunctionConfiguration> functions;

  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  final String nextToken;

  ListFunctionsResponse({
    this.functions,
    this.nextToken,
  });
  static ListFunctionsResponse fromJson(Map<String, dynamic> json) =>
      ListFunctionsResponse();
}

class ListGraphqlApisResponse {
  /// The `GraphqlApi` objects.
  final List<GraphqlApi> graphqlApis;

  /// An identifier to be passed in the next request to this operation to return
  /// the next set of items in the list.
  final String nextToken;

  ListGraphqlApisResponse({
    this.graphqlApis,
    this.nextToken,
  });
  static ListGraphqlApisResponse fromJson(Map<String, dynamic> json) =>
      ListGraphqlApisResponse();
}

class ListResolversByFunctionResponse {
  /// The list of resolvers.
  final List<Resolver> resolvers;

  /// An identifier that can be used to return the next set of items in the
  /// list.
  final String nextToken;

  ListResolversByFunctionResponse({
    this.resolvers,
    this.nextToken,
  });
  static ListResolversByFunctionResponse fromJson(Map<String, dynamic> json) =>
      ListResolversByFunctionResponse();
}

class ListResolversResponse {
  /// The `Resolver` objects.
  final List<Resolver> resolvers;

  /// An identifier to be passed in the next request to this operation to return
  /// the next set of items in the list.
  final String nextToken;

  ListResolversResponse({
    this.resolvers,
    this.nextToken,
  });
  static ListResolversResponse fromJson(Map<String, dynamic> json) =>
      ListResolversResponse();
}

class ListTagsForResourceResponse {
  /// A `TagMap` object.
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  static ListTagsForResourceResponse fromJson(Map<String, dynamic> json) =>
      ListTagsForResourceResponse();
}

class ListTypesResponse {
  /// The `Type` objects.
  final List<Type> types;

  /// An identifier to be passed in the next request to this operation to return
  /// the next set of items in the list.
  final String nextToken;

  ListTypesResponse({
    this.types,
    this.nextToken,
  });
  static ListTypesResponse fromJson(Map<String, dynamic> json) =>
      ListTypesResponse();
}

class LogConfig {
  /// The field logging level. Values can be NONE, ERROR, or ALL.
  ///
  /// *    **NONE**: No field-level logs are captured.
  ///
  /// *    **ERROR**: Logs the following information only for the fields that
  /// are in error:
  ///
  ///     *   The error section in the server response.
  ///
  ///     *   Field-level errors.
  ///
  ///     *   The generated request/response functions that got resolved for
  /// error fields.
  ///
  ///
  /// *    **ALL**: The following information is logged for all fields in the
  /// query:
  ///
  ///     *   Field-level tracing information.
  ///
  ///     *   The generated request/response functions that got resolved for
  /// each field.
  final String fieldLogLevel;

  /// The service role that AWS AppSync will assume to publish to Amazon
  /// CloudWatch logs in your account.
  final String cloudWatchLogsRoleArn;

  /// Set to TRUE to exclude sections that contain information such as headers,
  /// context, and evaluated mapping templates, regardless of logging level.
  final bool excludeVerboseContent;

  LogConfig({
    @required this.fieldLogLevel,
    @required this.cloudWatchLogsRoleArn,
    this.excludeVerboseContent,
  });
  static LogConfig fromJson(Map<String, dynamic> json) => LogConfig();
}

class OpenIDConnectConfig {
  /// The issuer for the OpenID Connect configuration. The issuer returned by
  /// discovery must exactly match the value of `iss` in the ID token.
  final String issuer;

  /// The client identifier of the Relying party at the OpenID identity
  /// provider. This identifier is typically obtained when the Relying party is
  /// registered with the OpenID identity provider. You can specify a regular
  /// expression so the AWS AppSync can validate against multiple client
  /// identifiers at a time.
  final String clientId;

  /// The number of milliseconds a token is valid after being issued to a user.
  final BigInt iatTtl;

  /// The number of milliseconds a token is valid after being authenticated.
  final BigInt authTtl;

  OpenIDConnectConfig({
    @required this.issuer,
    this.clientId,
    this.iatTtl,
    this.authTtl,
  });
  static OpenIDConnectConfig fromJson(Map<String, dynamic> json) =>
      OpenIDConnectConfig();
}

class PipelineConfig {
  /// A list of `Function` objects.
  final List<String> functions;

  PipelineConfig({
    this.functions,
  });
  static PipelineConfig fromJson(Map<String, dynamic> json) => PipelineConfig();
}

class RdsHttpEndpointConfig {
  /// AWS Region for RDS HTTP endpoint.
  final String awsRegion;

  /// Amazon RDS cluster identifier.
  final String dbClusterIdentifier;

  /// Logical database name.
  final String databaseName;

  /// Logical schema name.
  final String schema;

  /// AWS secret store ARN for database credentials.
  final String awsSecretStoreArn;

  RdsHttpEndpointConfig({
    this.awsRegion,
    this.dbClusterIdentifier,
    this.databaseName,
    this.schema,
    this.awsSecretStoreArn,
  });
  static RdsHttpEndpointConfig fromJson(Map<String, dynamic> json) =>
      RdsHttpEndpointConfig();
}

class RelationalDatabaseDataSourceConfig {
  /// Source type for the relational database.
  ///
  /// *    **RDS\_HTTP\_ENDPOINT**: The relational database source type is an
  /// Amazon RDS HTTP endpoint.
  final String relationalDatabaseSourceType;

  /// Amazon RDS HTTP endpoint settings.
  final RdsHttpEndpointConfig rdsHttpEndpointConfig;

  RelationalDatabaseDataSourceConfig({
    this.relationalDatabaseSourceType,
    this.rdsHttpEndpointConfig,
  });
  static RelationalDatabaseDataSourceConfig fromJson(
          Map<String, dynamic> json) =>
      RelationalDatabaseDataSourceConfig();
}

class Resolver {
  /// The resolver type name.
  final String typeName;

  /// The resolver field name.
  final String fieldName;

  /// The resolver data source name.
  final String dataSourceName;

  /// The resolver ARN.
  final String resolverArn;

  /// The request mapping template.
  final String requestMappingTemplate;

  /// The response mapping template.
  final String responseMappingTemplate;

  /// The resolver type.
  ///
  /// *    **UNIT**: A UNIT resolver type. A UNIT resolver is the default
  /// resolver type. A UNIT resolver enables you to execute a GraphQL query
  /// against a single data source.
  ///
  /// *    **PIPELINE**: A PIPELINE resolver type. A PIPELINE resolver enables
  /// you to execute a series of `Function` in a serial manner. You can use a
  /// pipeline resolver to execute a GraphQL query against multiple data
  /// sources.
  final String kind;

  /// The `PipelineConfig`.
  final PipelineConfig pipelineConfig;

  Resolver({
    this.typeName,
    this.fieldName,
    this.dataSourceName,
    this.resolverArn,
    this.requestMappingTemplate,
    this.responseMappingTemplate,
    this.kind,
    this.pipelineConfig,
  });
  static Resolver fromJson(Map<String, dynamic> json) => Resolver();
}

class StartSchemaCreationResponse {
  /// The current state of the schema (PROCESSING, FAILED, SUCCESS, or
  /// NOT_APPLICABLE). When the schema is in the ACTIVE state, you can add data.
  final String status;

  StartSchemaCreationResponse({
    this.status,
  });
  static StartSchemaCreationResponse fromJson(Map<String, dynamic> json) =>
      StartSchemaCreationResponse();
}

class TagResourceResponse {
  TagResourceResponse();
  static TagResourceResponse fromJson(Map<String, dynamic> json) =>
      TagResourceResponse();
}

class Type {
  /// The type name.
  final String name;

  /// The type description.
  final String description;

  /// The type ARN.
  final String arn;

  /// The type definition.
  final String definition;

  /// The type format: SDL or JSON.
  final String format;

  Type({
    this.name,
    this.description,
    this.arn,
    this.definition,
    this.format,
  });
  static Type fromJson(Map<String, dynamic> json) => Type();
}

class UntagResourceResponse {
  UntagResourceResponse();
  static UntagResourceResponse fromJson(Map<String, dynamic> json) =>
      UntagResourceResponse();
}

class UpdateApiKeyResponse {
  /// The API key.
  final ApiKey apiKey;

  UpdateApiKeyResponse({
    this.apiKey,
  });
  static UpdateApiKeyResponse fromJson(Map<String, dynamic> json) =>
      UpdateApiKeyResponse();
}

class UpdateDataSourceResponse {
  /// The updated `DataSource` object.
  final DataSource dataSource;

  UpdateDataSourceResponse({
    this.dataSource,
  });
  static UpdateDataSourceResponse fromJson(Map<String, dynamic> json) =>
      UpdateDataSourceResponse();
}

class UpdateFunctionResponse {
  /// The `Function` object.
  final FunctionConfiguration functionConfiguration;

  UpdateFunctionResponse({
    this.functionConfiguration,
  });
  static UpdateFunctionResponse fromJson(Map<String, dynamic> json) =>
      UpdateFunctionResponse();
}

class UpdateGraphqlApiResponse {
  /// The updated `GraphqlApi` object.
  final GraphqlApi graphqlApi;

  UpdateGraphqlApiResponse({
    this.graphqlApi,
  });
  static UpdateGraphqlApiResponse fromJson(Map<String, dynamic> json) =>
      UpdateGraphqlApiResponse();
}

class UpdateResolverResponse {
  /// The updated `Resolver` object.
  final Resolver resolver;

  UpdateResolverResponse({
    this.resolver,
  });
  static UpdateResolverResponse fromJson(Map<String, dynamic> json) =>
      UpdateResolverResponse();
}

class UpdateTypeResponse {
  /// The updated `Type` object.
  final Type type;

  UpdateTypeResponse({
    this.type,
  });
  static UpdateTypeResponse fromJson(Map<String, dynamic> json) =>
      UpdateTypeResponse();
}

class UserPoolConfig {
  /// The user pool ID.
  final String userPoolId;

  /// The AWS Region in which the user pool was created.
  final String awsRegion;

  /// The action that you want your GraphQL API to take when a request that uses
  /// Amazon Cognito user pool authentication doesn't match the Amazon Cognito
  /// user pool configuration.
  final String defaultAction;

  /// A regular expression for validating the incoming Amazon Cognito user pool
  /// app client ID.
  final String appIdClientRegex;

  UserPoolConfig({
    @required this.userPoolId,
    @required this.awsRegion,
    @required this.defaultAction,
    this.appIdClientRegex,
  });
  static UserPoolConfig fromJson(Map<String, dynamic> json) => UserPoolConfig();
}
