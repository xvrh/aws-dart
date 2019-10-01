import 'package:meta/meta.dart';
import 'dart:typed_data';

/// AWS AppSync provides API actions for creating and interacting with data
/// sources using GraphQL from your application.
class AppSyncApi {
  final _client;
  AppSyncApi(client)
      : _client = client.configured('AppSync', serializer: 'rest-json');

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
    var response_ = await _client.send('CreateApiKey', {
      'apiId': apiId,
      if (description != null) 'description': description,
      if (expires != null) 'expires': expires,
    });
    return CreateApiKeyResponse.fromJson(response_);
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
    var response_ = await _client.send('CreateDataSource', {
      'apiId': apiId,
      'name': name,
      if (description != null) 'description': description,
      'type': type,
      if (serviceRoleArn != null) 'serviceRoleArn': serviceRoleArn,
      if (dynamodbConfig != null) 'dynamodbConfig': dynamodbConfig,
      if (lambdaConfig != null) 'lambdaConfig': lambdaConfig,
      if (elasticsearchConfig != null)
        'elasticsearchConfig': elasticsearchConfig,
      if (httpConfig != null) 'httpConfig': httpConfig,
      if (relationalDatabaseConfig != null)
        'relationalDatabaseConfig': relationalDatabaseConfig,
    });
    return CreateDataSourceResponse.fromJson(response_);
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
    var response_ = await _client.send('CreateFunction', {
      'apiId': apiId,
      'name': name,
      if (description != null) 'description': description,
      'dataSourceName': dataSourceName,
      'requestMappingTemplate': requestMappingTemplate,
      if (responseMappingTemplate != null)
        'responseMappingTemplate': responseMappingTemplate,
      'functionVersion': functionVersion,
    });
    return CreateFunctionResponse.fromJson(response_);
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
    var response_ = await _client.send('CreateGraphqlApi', {
      'name': name,
      if (logConfig != null) 'logConfig': logConfig,
      'authenticationType': authenticationType,
      if (userPoolConfig != null) 'userPoolConfig': userPoolConfig,
      if (openIDConnectConfig != null)
        'openIDConnectConfig': openIDConnectConfig,
      if (tags != null) 'tags': tags,
      if (additionalAuthenticationProviders != null)
        'additionalAuthenticationProviders': additionalAuthenticationProviders,
    });
    return CreateGraphqlApiResponse.fromJson(response_);
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
    var response_ = await _client.send('CreateResolver', {
      'apiId': apiId,
      'typeName': typeName,
      'fieldName': fieldName,
      if (dataSourceName != null) 'dataSourceName': dataSourceName,
      'requestMappingTemplate': requestMappingTemplate,
      if (responseMappingTemplate != null)
        'responseMappingTemplate': responseMappingTemplate,
      if (kind != null) 'kind': kind,
      if (pipelineConfig != null) 'pipelineConfig': pipelineConfig,
    });
    return CreateResolverResponse.fromJson(response_);
  }

  /// Creates a `Type` object.
  ///
  /// [apiId]: The API ID.
  ///
  /// [definition]: The type definition, in GraphQL Schema Definition Language
  /// (SDL) format.
  ///
  /// For more information, see the
  /// [GraphQL SDL documentation](http://graphql.org/learn/schema/).
  ///
  /// [format]: The type format: SDL or JSON.
  Future<CreateTypeResponse> createType(
      {@required String apiId,
      @required String definition,
      @required String format}) async {
    var response_ = await _client.send('CreateType', {
      'apiId': apiId,
      'definition': definition,
      'format': format,
    });
    return CreateTypeResponse.fromJson(response_);
  }

  /// Deletes an API key.
  ///
  /// [apiId]: The API ID.
  ///
  /// [id]: The ID for the API key.
  Future<DeleteApiKeyResponse> deleteApiKey(
      {@required String apiId, @required String id}) async {
    var response_ = await _client.send('DeleteApiKey', {
      'apiId': apiId,
      'id': id,
    });
    return DeleteApiKeyResponse.fromJson(response_);
  }

  /// Deletes a `DataSource` object.
  ///
  /// [apiId]: The API ID.
  ///
  /// [name]: The name of the data source.
  Future<DeleteDataSourceResponse> deleteDataSource(
      {@required String apiId, @required String name}) async {
    var response_ = await _client.send('DeleteDataSource', {
      'apiId': apiId,
      'name': name,
    });
    return DeleteDataSourceResponse.fromJson(response_);
  }

  /// Deletes a `Function`.
  ///
  /// [apiId]: The GraphQL API ID.
  ///
  /// [functionId]: The `Function` ID.
  Future<DeleteFunctionResponse> deleteFunction(
      {@required String apiId, @required String functionId}) async {
    var response_ = await _client.send('DeleteFunction', {
      'apiId': apiId,
      'functionId': functionId,
    });
    return DeleteFunctionResponse.fromJson(response_);
  }

  /// Deletes a `GraphqlApi` object.
  ///
  /// [apiId]: The API ID.
  Future<DeleteGraphqlApiResponse> deleteGraphqlApi(String apiId) async {
    var response_ = await _client.send('DeleteGraphqlApi', {
      'apiId': apiId,
    });
    return DeleteGraphqlApiResponse.fromJson(response_);
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
    var response_ = await _client.send('DeleteResolver', {
      'apiId': apiId,
      'typeName': typeName,
      'fieldName': fieldName,
    });
    return DeleteResolverResponse.fromJson(response_);
  }

  /// Deletes a `Type` object.
  ///
  /// [apiId]: The API ID.
  ///
  /// [typeName]: The type name.
  Future<DeleteTypeResponse> deleteType(
      {@required String apiId, @required String typeName}) async {
    var response_ = await _client.send('DeleteType', {
      'apiId': apiId,
      'typeName': typeName,
    });
    return DeleteTypeResponse.fromJson(response_);
  }

  /// Retrieves a `DataSource` object.
  ///
  /// [apiId]: The API ID.
  ///
  /// [name]: The name of the data source.
  Future<GetDataSourceResponse> getDataSource(
      {@required String apiId, @required String name}) async {
    var response_ = await _client.send('GetDataSource', {
      'apiId': apiId,
      'name': name,
    });
    return GetDataSourceResponse.fromJson(response_);
  }

  /// Get a `Function`.
  ///
  /// [apiId]: The GraphQL API ID.
  ///
  /// [functionId]: The `Function` ID.
  Future<GetFunctionResponse> getFunction(
      {@required String apiId, @required String functionId}) async {
    var response_ = await _client.send('GetFunction', {
      'apiId': apiId,
      'functionId': functionId,
    });
    return GetFunctionResponse.fromJson(response_);
  }

  /// Retrieves a `GraphqlApi` object.
  ///
  /// [apiId]: The API ID for the GraphQL API.
  Future<GetGraphqlApiResponse> getGraphqlApi(String apiId) async {
    var response_ = await _client.send('GetGraphqlApi', {
      'apiId': apiId,
    });
    return GetGraphqlApiResponse.fromJson(response_);
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
    var response_ = await _client.send('GetIntrospectionSchema', {
      'apiId': apiId,
      'format': format,
      if (includeDirectives != null) 'includeDirectives': includeDirectives,
    });
    return GetIntrospectionSchemaResponse.fromJson(response_);
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
    var response_ = await _client.send('GetResolver', {
      'apiId': apiId,
      'typeName': typeName,
      'fieldName': fieldName,
    });
    return GetResolverResponse.fromJson(response_);
  }

  /// Retrieves the current status of a schema creation operation.
  ///
  /// [apiId]: The API ID.
  Future<GetSchemaCreationStatusResponse> getSchemaCreationStatus(
      String apiId) async {
    var response_ = await _client.send('GetSchemaCreationStatus', {
      'apiId': apiId,
    });
    return GetSchemaCreationStatusResponse.fromJson(response_);
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
    var response_ = await _client.send('GetType', {
      'apiId': apiId,
      'typeName': typeName,
      'format': format,
    });
    return GetTypeResponse.fromJson(response_);
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
    var response_ = await _client.send('ListApiKeys', {
      'apiId': apiId,
      if (nextToken != null) 'nextToken': nextToken,
      if (maxResults != null) 'maxResults': maxResults,
    });
    return ListApiKeysResponse.fromJson(response_);
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
    var response_ = await _client.send('ListDataSources', {
      'apiId': apiId,
      if (nextToken != null) 'nextToken': nextToken,
      if (maxResults != null) 'maxResults': maxResults,
    });
    return ListDataSourcesResponse.fromJson(response_);
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
    var response_ = await _client.send('ListFunctions', {
      'apiId': apiId,
      if (nextToken != null) 'nextToken': nextToken,
      if (maxResults != null) 'maxResults': maxResults,
    });
    return ListFunctionsResponse.fromJson(response_);
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
    var response_ = await _client.send('ListGraphqlApis', {
      if (nextToken != null) 'nextToken': nextToken,
      if (maxResults != null) 'maxResults': maxResults,
    });
    return ListGraphqlApisResponse.fromJson(response_);
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
    var response_ = await _client.send('ListResolvers', {
      'apiId': apiId,
      'typeName': typeName,
      if (nextToken != null) 'nextToken': nextToken,
      if (maxResults != null) 'maxResults': maxResults,
    });
    return ListResolversResponse.fromJson(response_);
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
    var response_ = await _client.send('ListResolversByFunction', {
      'apiId': apiId,
      'functionId': functionId,
      if (nextToken != null) 'nextToken': nextToken,
      if (maxResults != null) 'maxResults': maxResults,
    });
    return ListResolversByFunctionResponse.fromJson(response_);
  }

  /// Lists the tags for a resource.
  ///
  /// [resourceArn]: The `GraphqlApi` ARN.
  Future<ListTagsForResourceResponse> listTagsForResource(
      String resourceArn) async {
    var response_ = await _client.send('ListTagsForResource', {
      'resourceArn': resourceArn,
    });
    return ListTagsForResourceResponse.fromJson(response_);
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
    var response_ = await _client.send('ListTypes', {
      'apiId': apiId,
      'format': format,
      if (nextToken != null) 'nextToken': nextToken,
      if (maxResults != null) 'maxResults': maxResults,
    });
    return ListTypesResponse.fromJson(response_);
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
    var response_ = await _client.send('StartSchemaCreation', {
      'apiId': apiId,
      'definition': definition,
    });
    return StartSchemaCreationResponse.fromJson(response_);
  }

  /// Tags a resource with user-supplied tags.
  ///
  /// [resourceArn]: The `GraphqlApi` ARN.
  ///
  /// [tags]: A `TagMap` object.
  Future<TagResourceResponse> tagResource(
      {@required String resourceArn,
      @required Map<String, String> tags}) async {
    var response_ = await _client.send('TagResource', {
      'resourceArn': resourceArn,
      'tags': tags,
    });
    return TagResourceResponse.fromJson(response_);
  }

  /// Untags a resource.
  ///
  /// [resourceArn]: The `GraphqlApi` ARN.
  ///
  /// [tagKeys]: A list of `TagKey` objects.
  Future<UntagResourceResponse> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {
    var response_ = await _client.send('UntagResource', {
      'resourceArn': resourceArn,
      'tagKeys': tagKeys,
    });
    return UntagResourceResponse.fromJson(response_);
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
    var response_ = await _client.send('UpdateApiKey', {
      'apiId': apiId,
      'id': id,
      if (description != null) 'description': description,
      if (expires != null) 'expires': expires,
    });
    return UpdateApiKeyResponse.fromJson(response_);
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
    var response_ = await _client.send('UpdateDataSource', {
      'apiId': apiId,
      'name': name,
      if (description != null) 'description': description,
      'type': type,
      if (serviceRoleArn != null) 'serviceRoleArn': serviceRoleArn,
      if (dynamodbConfig != null) 'dynamodbConfig': dynamodbConfig,
      if (lambdaConfig != null) 'lambdaConfig': lambdaConfig,
      if (elasticsearchConfig != null)
        'elasticsearchConfig': elasticsearchConfig,
      if (httpConfig != null) 'httpConfig': httpConfig,
      if (relationalDatabaseConfig != null)
        'relationalDatabaseConfig': relationalDatabaseConfig,
    });
    return UpdateDataSourceResponse.fromJson(response_);
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
    var response_ = await _client.send('UpdateFunction', {
      'apiId': apiId,
      'name': name,
      if (description != null) 'description': description,
      'functionId': functionId,
      'dataSourceName': dataSourceName,
      'requestMappingTemplate': requestMappingTemplate,
      if (responseMappingTemplate != null)
        'responseMappingTemplate': responseMappingTemplate,
      'functionVersion': functionVersion,
    });
    return UpdateFunctionResponse.fromJson(response_);
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
    var response_ = await _client.send('UpdateGraphqlApi', {
      'apiId': apiId,
      'name': name,
      if (logConfig != null) 'logConfig': logConfig,
      if (authenticationType != null) 'authenticationType': authenticationType,
      if (userPoolConfig != null) 'userPoolConfig': userPoolConfig,
      if (openIDConnectConfig != null)
        'openIDConnectConfig': openIDConnectConfig,
      if (additionalAuthenticationProviders != null)
        'additionalAuthenticationProviders': additionalAuthenticationProviders,
    });
    return UpdateGraphqlApiResponse.fromJson(response_);
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
    var response_ = await _client.send('UpdateResolver', {
      'apiId': apiId,
      'typeName': typeName,
      'fieldName': fieldName,
      if (dataSourceName != null) 'dataSourceName': dataSourceName,
      'requestMappingTemplate': requestMappingTemplate,
      if (responseMappingTemplate != null)
        'responseMappingTemplate': responseMappingTemplate,
      if (kind != null) 'kind': kind,
      if (pipelineConfig != null) 'pipelineConfig': pipelineConfig,
    });
    return UpdateResolverResponse.fromJson(response_);
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
    var response_ = await _client.send('UpdateType', {
      'apiId': apiId,
      'typeName': typeName,
      if (definition != null) 'definition': definition,
      'format': format,
    });
    return UpdateTypeResponse.fromJson(response_);
  }
}

/// Describes an additional authentication provider.
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
      AdditionalAuthenticationProvider(
        authenticationType: json.containsKey('authenticationType')
            ? json['authenticationType'] as String
            : null,
        openIDConnectConfig: json.containsKey('openIDConnectConfig')
            ? OpenIDConnectConfig.fromJson(json['openIDConnectConfig'])
            : null,
        userPoolConfig: json.containsKey('userPoolConfig')
            ? CognitoUserPoolConfig.fromJson(json['userPoolConfig'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes an API key.
///
/// Customers invoke AWS AppSync GraphQL API operations with API keys as an
/// identity mechanism. There are two key versions:
///
///  **da1**: This version was introduced at launch in November 2017. These keys
/// always expire after 7 days. Key expiration is managed by Amazon DynamoDB
/// TTL. The keys ceased to be valid after February 21, 2018 and should not be
/// used after that date.
///
/// *    `ListApiKeys` returns the expiration time in milliseconds.
///
/// *    `CreateApiKey` returns the expiration time in milliseconds.
///
/// *    `UpdateApiKey` is not available for this key version.
///
/// *    `DeleteApiKey` deletes the item from the table.
///
/// *   Expiration is stored in Amazon DynamoDB as milliseconds. This results in
/// a bug where keys are not automatically deleted because DynamoDB expects the
/// TTL to be stored in seconds. As a one-time action, we will delete these keys
/// from the table after February 21, 2018.
///
///
///  **da2**: This version was introduced in February 2018 when AppSync added
/// support to extend key expiration.
///
/// *    `ListApiKeys` returns the expiration time in seconds.
///
/// *    `CreateApiKey` returns the expiration time in seconds and accepts a
/// user-provided expiration time in seconds.
///
/// *    `UpdateApiKey` returns the expiration time in seconds and accepts a
/// user-provided expiration time in seconds. Key expiration can only be updated
/// while the key has not expired.
///
/// *    `DeleteApiKey` deletes the item from the table.
///
/// *   Expiration is stored in Amazon DynamoDB as seconds.
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
  static ApiKey fromJson(Map<String, dynamic> json) => ApiKey(
        id: json.containsKey('id') ? json['id'] as String : null,
        description: json.containsKey('description')
            ? json['description'] as String
            : null,
        expires:
            json.containsKey('expires') ? BigInt.from(json['expires']) : null,
      );
}

/// The authorization config in case the HTTP endpoint requires authorization.
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
      AuthorizationConfig(
        authorizationType: json['authorizationType'] as String,
        awsIamConfig: json.containsKey('awsIamConfig')
            ? AwsIamConfig.fromJson(json['awsIamConfig'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The AWS IAM configuration.
class AwsIamConfig {
  /// The signing region for AWS IAM authorization.
  final String signingRegion;

  /// The signing service name for AWS IAM authorization.
  final String signingServiceName;

  AwsIamConfig({
    this.signingRegion,
    this.signingServiceName,
  });
  static AwsIamConfig fromJson(Map<String, dynamic> json) => AwsIamConfig(
        signingRegion: json.containsKey('signingRegion')
            ? json['signingRegion'] as String
            : null,
        signingServiceName: json.containsKey('signingServiceName')
            ? json['signingServiceName'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes an Amazon Cognito user pool configuration.
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
      CognitoUserPoolConfig(
        userPoolId: json['userPoolId'] as String,
        awsRegion: json['awsRegion'] as String,
        appIdClientRegex: json.containsKey('appIdClientRegex')
            ? json['appIdClientRegex'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class CreateApiKeyResponse {
  /// The API key.
  final ApiKey apiKey;

  CreateApiKeyResponse({
    this.apiKey,
  });
  static CreateApiKeyResponse fromJson(Map<String, dynamic> json) =>
      CreateApiKeyResponse(
        apiKey:
            json.containsKey('apiKey') ? ApiKey.fromJson(json['apiKey']) : null,
      );
}

class CreateDataSourceResponse {
  /// The `DataSource` object.
  final DataSource dataSource;

  CreateDataSourceResponse({
    this.dataSource,
  });
  static CreateDataSourceResponse fromJson(Map<String, dynamic> json) =>
      CreateDataSourceResponse(
        dataSource: json.containsKey('dataSource')
            ? DataSource.fromJson(json['dataSource'])
            : null,
      );
}

class CreateFunctionResponse {
  /// The `Function` object.
  final FunctionConfiguration functionConfiguration;

  CreateFunctionResponse({
    this.functionConfiguration,
  });
  static CreateFunctionResponse fromJson(Map<String, dynamic> json) =>
      CreateFunctionResponse(
        functionConfiguration: json.containsKey('functionConfiguration')
            ? FunctionConfiguration.fromJson(json['functionConfiguration'])
            : null,
      );
}

class CreateGraphqlApiResponse {
  /// The `GraphqlApi`.
  final GraphqlApi graphqlApi;

  CreateGraphqlApiResponse({
    this.graphqlApi,
  });
  static CreateGraphqlApiResponse fromJson(Map<String, dynamic> json) =>
      CreateGraphqlApiResponse(
        graphqlApi: json.containsKey('graphqlApi')
            ? GraphqlApi.fromJson(json['graphqlApi'])
            : null,
      );
}

class CreateResolverResponse {
  /// The `Resolver` object.
  final Resolver resolver;

  CreateResolverResponse({
    this.resolver,
  });
  static CreateResolverResponse fromJson(Map<String, dynamic> json) =>
      CreateResolverResponse(
        resolver: json.containsKey('resolver')
            ? Resolver.fromJson(json['resolver'])
            : null,
      );
}

class CreateTypeResponse {
  /// The `Type` object.
  final Type type;

  CreateTypeResponse({
    this.type,
  });
  static CreateTypeResponse fromJson(Map<String, dynamic> json) =>
      CreateTypeResponse(
        type: json.containsKey('type') ? Type.fromJson(json['type']) : null,
      );
}

/// Describes a data source.
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
  static DataSource fromJson(Map<String, dynamic> json) => DataSource(
        dataSourceArn: json.containsKey('dataSourceArn')
            ? json['dataSourceArn'] as String
            : null,
        name: json.containsKey('name') ? json['name'] as String : null,
        description: json.containsKey('description')
            ? json['description'] as String
            : null,
        type: json.containsKey('type') ? json['type'] as String : null,
        serviceRoleArn: json.containsKey('serviceRoleArn')
            ? json['serviceRoleArn'] as String
            : null,
        dynamodbConfig: json.containsKey('dynamodbConfig')
            ? DynamodbDataSourceConfig.fromJson(json['dynamodbConfig'])
            : null,
        lambdaConfig: json.containsKey('lambdaConfig')
            ? LambdaDataSourceConfig.fromJson(json['lambdaConfig'])
            : null,
        elasticsearchConfig: json.containsKey('elasticsearchConfig')
            ? ElasticsearchDataSourceConfig.fromJson(
                json['elasticsearchConfig'])
            : null,
        httpConfig: json.containsKey('httpConfig')
            ? HttpDataSourceConfig.fromJson(json['httpConfig'])
            : null,
        relationalDatabaseConfig: json.containsKey('relationalDatabaseConfig')
            ? RelationalDatabaseDataSourceConfig.fromJson(
                json['relationalDatabaseConfig'])
            : null,
      );
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

/// Describes an Amazon DynamoDB data source configuration.
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
      DynamodbDataSourceConfig(
        tableName: json['tableName'] as String,
        awsRegion: json['awsRegion'] as String,
        useCallerCredentials: json.containsKey('useCallerCredentials')
            ? json['useCallerCredentials'] as bool
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes an Elasticsearch data source configuration.
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
      ElasticsearchDataSourceConfig(
        endpoint: json['endpoint'] as String,
        awsRegion: json['awsRegion'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A function is a reusable entity. Multiple functions can be used to compose
/// the resolver logic.
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
      FunctionConfiguration(
        functionId: json.containsKey('functionId')
            ? json['functionId'] as String
            : null,
        functionArn: json.containsKey('functionArn')
            ? json['functionArn'] as String
            : null,
        name: json.containsKey('name') ? json['name'] as String : null,
        description: json.containsKey('description')
            ? json['description'] as String
            : null,
        dataSourceName: json.containsKey('dataSourceName')
            ? json['dataSourceName'] as String
            : null,
        requestMappingTemplate: json.containsKey('requestMappingTemplate')
            ? json['requestMappingTemplate'] as String
            : null,
        responseMappingTemplate: json.containsKey('responseMappingTemplate')
            ? json['responseMappingTemplate'] as String
            : null,
        functionVersion: json.containsKey('functionVersion')
            ? json['functionVersion'] as String
            : null,
      );
}

class GetDataSourceResponse {
  /// The `DataSource` object.
  final DataSource dataSource;

  GetDataSourceResponse({
    this.dataSource,
  });
  static GetDataSourceResponse fromJson(Map<String, dynamic> json) =>
      GetDataSourceResponse(
        dataSource: json.containsKey('dataSource')
            ? DataSource.fromJson(json['dataSource'])
            : null,
      );
}

class GetFunctionResponse {
  /// The `Function` object.
  final FunctionConfiguration functionConfiguration;

  GetFunctionResponse({
    this.functionConfiguration,
  });
  static GetFunctionResponse fromJson(Map<String, dynamic> json) =>
      GetFunctionResponse(
        functionConfiguration: json.containsKey('functionConfiguration')
            ? FunctionConfiguration.fromJson(json['functionConfiguration'])
            : null,
      );
}

class GetGraphqlApiResponse {
  /// The `GraphqlApi` object.
  final GraphqlApi graphqlApi;

  GetGraphqlApiResponse({
    this.graphqlApi,
  });
  static GetGraphqlApiResponse fromJson(Map<String, dynamic> json) =>
      GetGraphqlApiResponse(
        graphqlApi: json.containsKey('graphqlApi')
            ? GraphqlApi.fromJson(json['graphqlApi'])
            : null,
      );
}

class GetIntrospectionSchemaResponse {
  /// The schema, in GraphQL Schema Definition Language (SDL) format.
  ///
  /// For more information, see the
  /// [GraphQL SDL documentation](http://graphql.org/learn/schema/).
  final Uint8List schema;

  GetIntrospectionSchemaResponse({
    this.schema,
  });
  static GetIntrospectionSchemaResponse fromJson(Map<String, dynamic> json) =>
      GetIntrospectionSchemaResponse(
        schema: json.containsKey('schema') ? Uint8List(json['schema']) : null,
      );
}

class GetResolverResponse {
  /// The `Resolver` object.
  final Resolver resolver;

  GetResolverResponse({
    this.resolver,
  });
  static GetResolverResponse fromJson(Map<String, dynamic> json) =>
      GetResolverResponse(
        resolver: json.containsKey('resolver')
            ? Resolver.fromJson(json['resolver'])
            : null,
      );
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
      GetSchemaCreationStatusResponse(
        status: json.containsKey('status') ? json['status'] as String : null,
        details: json.containsKey('details') ? json['details'] as String : null,
      );
}

class GetTypeResponse {
  /// The `Type` object.
  final Type type;

  GetTypeResponse({
    this.type,
  });
  static GetTypeResponse fromJson(Map<String, dynamic> json) => GetTypeResponse(
        type: json.containsKey('type') ? Type.fromJson(json['type']) : null,
      );
}

/// Describes a GraphQL API.
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
  static GraphqlApi fromJson(Map<String, dynamic> json) => GraphqlApi(
        name: json.containsKey('name') ? json['name'] as String : null,
        apiId: json.containsKey('apiId') ? json['apiId'] as String : null,
        authenticationType: json.containsKey('authenticationType')
            ? json['authenticationType'] as String
            : null,
        logConfig: json.containsKey('logConfig')
            ? LogConfig.fromJson(json['logConfig'])
            : null,
        userPoolConfig: json.containsKey('userPoolConfig')
            ? UserPoolConfig.fromJson(json['userPoolConfig'])
            : null,
        openIDConnectConfig: json.containsKey('openIDConnectConfig')
            ? OpenIDConnectConfig.fromJson(json['openIDConnectConfig'])
            : null,
        arn: json.containsKey('arn') ? json['arn'] as String : null,
        uris: json.containsKey('uris')
            ? (json['uris'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        tags: json.containsKey('tags')
            ? (json['tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        additionalAuthenticationProviders:
            json.containsKey('additionalAuthenticationProviders')
                ? (json['additionalAuthenticationProviders'] as List)
                    .map((e) => AdditionalAuthenticationProvider.fromJson(e))
                    .toList()
                : null,
      );
}

/// Describes an HTTP data source configuration.
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
      HttpDataSourceConfig(
        endpoint:
            json.containsKey('endpoint') ? json['endpoint'] as String : null,
        authorizationConfig: json.containsKey('authorizationConfig')
            ? AuthorizationConfig.fromJson(json['authorizationConfig'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes an AWS Lambda data source configuration.
class LambdaDataSourceConfig {
  /// The ARN for the Lambda function.
  final String lambdaFunctionArn;

  LambdaDataSourceConfig({
    @required this.lambdaFunctionArn,
  });
  static LambdaDataSourceConfig fromJson(Map<String, dynamic> json) =>
      LambdaDataSourceConfig(
        lambdaFunctionArn: json['lambdaFunctionArn'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
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
      ListApiKeysResponse(
        apiKeys: json.containsKey('apiKeys')
            ? (json['apiKeys'] as List).map((e) => ApiKey.fromJson(e)).toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
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
      ListDataSourcesResponse(
        dataSources: json.containsKey('dataSources')
            ? (json['dataSources'] as List)
                .map((e) => DataSource.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
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
      ListFunctionsResponse(
        functions: json.containsKey('functions')
            ? (json['functions'] as List)
                .map((e) => FunctionConfiguration.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
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
      ListGraphqlApisResponse(
        graphqlApis: json.containsKey('graphqlApis')
            ? (json['graphqlApis'] as List)
                .map((e) => GraphqlApi.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
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
      ListResolversByFunctionResponse(
        resolvers: json.containsKey('resolvers')
            ? (json['resolvers'] as List)
                .map((e) => Resolver.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
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
      ListResolversResponse(
        resolvers: json.containsKey('resolvers')
            ? (json['resolvers'] as List)
                .map((e) => Resolver.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

class ListTagsForResourceResponse {
  /// A `TagMap` object.
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  static ListTagsForResourceResponse fromJson(Map<String, dynamic> json) =>
      ListTagsForResourceResponse(
        tags: json.containsKey('tags')
            ? (json['tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
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
      ListTypesResponse(
        types: json.containsKey('types')
            ? (json['types'] as List).map((e) => Type.fromJson(e)).toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

/// The CloudWatch Logs configuration.
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
  static LogConfig fromJson(Map<String, dynamic> json) => LogConfig(
        fieldLogLevel: json['fieldLogLevel'] as String,
        cloudWatchLogsRoleArn: json['cloudWatchLogsRoleArn'] as String,
        excludeVerboseContent: json.containsKey('excludeVerboseContent')
            ? json['excludeVerboseContent'] as bool
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes an OpenID Connect configuration.
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
      OpenIDConnectConfig(
        issuer: json['issuer'] as String,
        clientId:
            json.containsKey('clientId') ? json['clientId'] as String : null,
        iatTtl: json.containsKey('iatTTL') ? BigInt.from(json['iatTTL']) : null,
        authTtl:
            json.containsKey('authTTL') ? BigInt.from(json['authTTL']) : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The pipeline configuration for a resolver of kind `PIPELINE`.
class PipelineConfig {
  /// A list of `Function` objects.
  final List<String> functions;

  PipelineConfig({
    this.functions,
  });
  static PipelineConfig fromJson(Map<String, dynamic> json) => PipelineConfig(
        functions: json.containsKey('functions')
            ? (json['functions'] as List).map((e) => e as String).toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The Amazon RDS HTTP endpoint configuration.
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
      RdsHttpEndpointConfig(
        awsRegion:
            json.containsKey('awsRegion') ? json['awsRegion'] as String : null,
        dbClusterIdentifier: json.containsKey('dbClusterIdentifier')
            ? json['dbClusterIdentifier'] as String
            : null,
        databaseName: json.containsKey('databaseName')
            ? json['databaseName'] as String
            : null,
        schema: json.containsKey('schema') ? json['schema'] as String : null,
        awsSecretStoreArn: json.containsKey('awsSecretStoreArn')
            ? json['awsSecretStoreArn'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes a relational database data source configuration.
class RelationalDatabaseDataSourceConfig {
  /// Source type for the relational database.
  ///
  /// *    **RDS_HTTP_ENDPOINT**: The relational database source type is an
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
      RelationalDatabaseDataSourceConfig(
        relationalDatabaseSourceType:
            json.containsKey('relationalDatabaseSourceType')
                ? json['relationalDatabaseSourceType'] as String
                : null,
        rdsHttpEndpointConfig: json.containsKey('rdsHttpEndpointConfig')
            ? RdsHttpEndpointConfig.fromJson(json['rdsHttpEndpointConfig'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes a resolver.
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
  static Resolver fromJson(Map<String, dynamic> json) => Resolver(
        typeName:
            json.containsKey('typeName') ? json['typeName'] as String : null,
        fieldName:
            json.containsKey('fieldName') ? json['fieldName'] as String : null,
        dataSourceName: json.containsKey('dataSourceName')
            ? json['dataSourceName'] as String
            : null,
        resolverArn: json.containsKey('resolverArn')
            ? json['resolverArn'] as String
            : null,
        requestMappingTemplate: json.containsKey('requestMappingTemplate')
            ? json['requestMappingTemplate'] as String
            : null,
        responseMappingTemplate: json.containsKey('responseMappingTemplate')
            ? json['responseMappingTemplate'] as String
            : null,
        kind: json.containsKey('kind') ? json['kind'] as String : null,
        pipelineConfig: json.containsKey('pipelineConfig')
            ? PipelineConfig.fromJson(json['pipelineConfig'])
            : null,
      );
}

class StartSchemaCreationResponse {
  /// The current state of the schema (PROCESSING, FAILED, SUCCESS, or
  /// NOT_APPLICABLE). When the schema is in the ACTIVE state, you can add data.
  final String status;

  StartSchemaCreationResponse({
    this.status,
  });
  static StartSchemaCreationResponse fromJson(Map<String, dynamic> json) =>
      StartSchemaCreationResponse(
        status: json.containsKey('status') ? json['status'] as String : null,
      );
}

class TagResourceResponse {
  TagResourceResponse();
  static TagResourceResponse fromJson(Map<String, dynamic> json) =>
      TagResourceResponse();
}

/// Describes a type.
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
  static Type fromJson(Map<String, dynamic> json) => Type(
        name: json.containsKey('name') ? json['name'] as String : null,
        description: json.containsKey('description')
            ? json['description'] as String
            : null,
        arn: json.containsKey('arn') ? json['arn'] as String : null,
        definition: json.containsKey('definition')
            ? json['definition'] as String
            : null,
        format: json.containsKey('format') ? json['format'] as String : null,
      );
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
      UpdateApiKeyResponse(
        apiKey:
            json.containsKey('apiKey') ? ApiKey.fromJson(json['apiKey']) : null,
      );
}

class UpdateDataSourceResponse {
  /// The updated `DataSource` object.
  final DataSource dataSource;

  UpdateDataSourceResponse({
    this.dataSource,
  });
  static UpdateDataSourceResponse fromJson(Map<String, dynamic> json) =>
      UpdateDataSourceResponse(
        dataSource: json.containsKey('dataSource')
            ? DataSource.fromJson(json['dataSource'])
            : null,
      );
}

class UpdateFunctionResponse {
  /// The `Function` object.
  final FunctionConfiguration functionConfiguration;

  UpdateFunctionResponse({
    this.functionConfiguration,
  });
  static UpdateFunctionResponse fromJson(Map<String, dynamic> json) =>
      UpdateFunctionResponse(
        functionConfiguration: json.containsKey('functionConfiguration')
            ? FunctionConfiguration.fromJson(json['functionConfiguration'])
            : null,
      );
}

class UpdateGraphqlApiResponse {
  /// The updated `GraphqlApi` object.
  final GraphqlApi graphqlApi;

  UpdateGraphqlApiResponse({
    this.graphqlApi,
  });
  static UpdateGraphqlApiResponse fromJson(Map<String, dynamic> json) =>
      UpdateGraphqlApiResponse(
        graphqlApi: json.containsKey('graphqlApi')
            ? GraphqlApi.fromJson(json['graphqlApi'])
            : null,
      );
}

class UpdateResolverResponse {
  /// The updated `Resolver` object.
  final Resolver resolver;

  UpdateResolverResponse({
    this.resolver,
  });
  static UpdateResolverResponse fromJson(Map<String, dynamic> json) =>
      UpdateResolverResponse(
        resolver: json.containsKey('resolver')
            ? Resolver.fromJson(json['resolver'])
            : null,
      );
}

class UpdateTypeResponse {
  /// The updated `Type` object.
  final Type type;

  UpdateTypeResponse({
    this.type,
  });
  static UpdateTypeResponse fromJson(Map<String, dynamic> json) =>
      UpdateTypeResponse(
        type: json.containsKey('type') ? Type.fromJson(json['type']) : null,
      );
}

/// Describes an Amazon Cognito user pool configuration.
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
  static UserPoolConfig fromJson(Map<String, dynamic> json) => UserPoolConfig(
        userPoolId: json['userPoolId'] as String,
        awsRegion: json['awsRegion'] as String,
        defaultAction: json['defaultAction'] as String,
        appIdClientRegex: json.containsKey('appIdClientRegex')
            ? json['appIdClientRegex'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}
