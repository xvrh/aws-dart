import 'package:meta/meta.dart';

/// Amazon Athena is an interactive query service that lets you use standard SQL
/// to analyze data directly in Amazon S3. You can point Athena at your data in
/// Amazon S3 and run ad-hoc queries and get results in seconds. Athena is
/// serverless, so there is no infrastructure to set up or manage. You pay only
/// for the queries you run. Athena scales automatically—executing queries in
/// parallel—so results are fast, even with large datasets and complex queries.
/// For more information, see
/// [What is Amazon Athena](http://docs.aws.amazon.com/athena/latest/ug/what-is.html)
/// in the _Amazon Athena User Guide_.
///
/// If you connect to Athena using the JDBC driver, use version 1.1.0 of the
/// driver or later with the Amazon Athena API. Earlier version drivers do not
/// support the API. For more information and to download the driver, see
/// [Accessing Amazon Athena with JDBC](https://docs.aws.amazon.com/athena/latest/ug/connect-with-jdbc.html).
///
/// For code samples using the AWS SDK for Java, see
/// [Examples and Code Samples](https://docs.aws.amazon.com/athena/latest/ug/code-samples.html)
/// in the _Amazon Athena User Guide_.
class AthenaApi {
  final _client;
  AthenaApi(client) : _client = client.configured('Athena', serializer: 'json');

  /// Returns the details of a single named query or a list of up to 50 queries,
  /// which you provide as an array of query ID strings. Requires you to have
  /// access to the workgroup in which the queries were saved. Use
  /// ListNamedQueriesInput to get the list of named query IDs in the specified
  /// workgroup. If information could not be retrieved for a submitted query ID,
  /// information about the query ID submitted is listed under
  /// UnprocessedNamedQueryId. Named queries differ from executed queries. Use
  /// BatchGetQueryExecutionInput to get details about each unique query
  /// execution, and ListQueryExecutionsInput to get a list of query execution
  /// IDs.
  ///
  /// [namedQueryIds]: An array of query IDs.
  Future<BatchGetNamedQueryOutput> batchGetNamedQuery(
      List<String> namedQueryIds) async {
    var response_ = await _client.send('BatchGetNamedQuery', {
      'NamedQueryIds': namedQueryIds,
    });
    return BatchGetNamedQueryOutput.fromJson(response_);
  }

  /// Returns the details of a single query execution or a list of up to 50
  /// query executions, which you provide as an array of query execution ID
  /// strings. Requires you to have access to the workgroup in which the queries
  /// ran. To get a list of query execution IDs, use
  /// ListQueryExecutionsInput$WorkGroup. Query executions differ from named
  /// (saved) queries. Use BatchGetNamedQueryInput to get details about named
  /// queries.
  ///
  /// [queryExecutionIds]: An array of query execution IDs.
  Future<BatchGetQueryExecutionOutput> batchGetQueryExecution(
      List<String> queryExecutionIds) async {
    var response_ = await _client.send('BatchGetQueryExecution', {
      'QueryExecutionIds': queryExecutionIds,
    });
    return BatchGetQueryExecutionOutput.fromJson(response_);
  }

  /// Creates a named query in the specified workgroup. Requires that you have
  /// access to the workgroup.
  ///
  /// For code samples using the AWS SDK for Java, see
  /// [Examples and Code Samples](http://docs.aws.amazon.com/athena/latest/ug/code-samples.html)
  /// in the _Amazon Athena User Guide_.
  ///
  /// [name]: The query name.
  ///
  /// [description]: The query description.
  ///
  /// [database]: The database to which the query belongs.
  ///
  /// [queryString]: The contents of the query with all query statements.
  ///
  /// [clientRequestToken]: A unique case-sensitive string used to ensure the
  /// request to create the query is idempotent (executes only once). If another
  /// `CreateNamedQuery` request is received, the same response is returned and
  /// another query is not created. If a parameter has changed, for example, the
  /// `QueryString`, an error is returned.
  ///
  ///
  ///
  /// This token is listed as not required because AWS SDKs (for example the AWS
  /// SDK for Java) auto-generate the token for users. If you are not using the
  /// AWS SDK or the AWS CLI, you must provide this token or the action will
  /// fail.
  ///
  /// [workGroup]: The name of the workgroup in which the named query is being
  /// created.
  Future<CreateNamedQueryOutput> createNamedQuery(
      {@required String name,
      String description,
      @required String database,
      @required String queryString,
      String clientRequestToken,
      String workGroup}) async {
    var response_ = await _client.send('CreateNamedQuery', {
      'Name': name,
      if (description != null) 'Description': description,
      'Database': database,
      'QueryString': queryString,
      if (clientRequestToken != null) 'ClientRequestToken': clientRequestToken,
      if (workGroup != null) 'WorkGroup': workGroup,
    });
    return CreateNamedQueryOutput.fromJson(response_);
  }

  /// Creates a workgroup with the specified name.
  ///
  /// [name]: The workgroup name.
  ///
  /// [configuration]: The configuration for the workgroup, which includes the
  /// location in Amazon S3 where query results are stored, the encryption
  /// configuration, if any, used for encrypting query results, whether the
  /// Amazon CloudWatch Metrics are enabled for the workgroup, the limit for the
  /// amount of bytes scanned (cutoff) per query, if it is specified, and
  /// whether workgroup's settings (specified with
  /// EnforceWorkGroupConfiguration) in the WorkGroupConfiguration override
  /// client-side settings. See
  /// WorkGroupConfiguration$EnforceWorkGroupConfiguration.
  ///
  /// [description]: The workgroup description.
  ///
  /// [tags]: One or more tags, separated by commas, that you want to attach to
  /// the workgroup as you create it.
  Future<CreateWorkGroupOutput> createWorkGroup(String name,
      {WorkGroupConfiguration configuration,
      String description,
      List<Tag> tags}) async {
    var response_ = await _client.send('CreateWorkGroup', {
      'Name': name,
      if (configuration != null) 'Configuration': configuration,
      if (description != null) 'Description': description,
      if (tags != null) 'Tags': tags,
    });
    return CreateWorkGroupOutput.fromJson(response_);
  }

  /// Deletes the named query if you have access to the workgroup in which the
  /// query was saved.
  ///
  /// For code samples using the AWS SDK for Java, see
  /// [Examples and Code Samples](http://docs.aws.amazon.com/athena/latest/ug/code-samples.html)
  /// in the _Amazon Athena User Guide_.
  ///
  /// [namedQueryId]: The unique ID of the query to delete.
  Future<DeleteNamedQueryOutput> deleteNamedQuery(String namedQueryId) async {
    var response_ = await _client.send('DeleteNamedQuery', {
      'NamedQueryId': namedQueryId,
    });
    return DeleteNamedQueryOutput.fromJson(response_);
  }

  /// Deletes the workgroup with the specified name. The primary workgroup
  /// cannot be deleted.
  ///
  /// [workGroup]: The unique name of the workgroup to delete.
  ///
  /// [recursiveDeleteOption]: The option to delete the workgroup and its
  /// contents even if the workgroup contains any named queries.
  Future<DeleteWorkGroupOutput> deleteWorkGroup(String workGroup,
      {bool recursiveDeleteOption}) async {
    var response_ = await _client.send('DeleteWorkGroup', {
      'WorkGroup': workGroup,
      if (recursiveDeleteOption != null)
        'RecursiveDeleteOption': recursiveDeleteOption,
    });
    return DeleteWorkGroupOutput.fromJson(response_);
  }

  /// Returns information about a single query. Requires that you have access to
  /// the workgroup in which the query was saved.
  ///
  /// [namedQueryId]: The unique ID of the query. Use ListNamedQueries to get
  /// query IDs.
  Future<GetNamedQueryOutput> getNamedQuery(String namedQueryId) async {
    var response_ = await _client.send('GetNamedQuery', {
      'NamedQueryId': namedQueryId,
    });
    return GetNamedQueryOutput.fromJson(response_);
  }

  /// Returns information about a single execution of a query if you have access
  /// to the workgroup in which the query ran. Each time a query executes,
  /// information about the query execution is saved with a unique ID.
  ///
  /// [queryExecutionId]: The unique ID of the query execution.
  Future<GetQueryExecutionOutput> getQueryExecution(
      String queryExecutionId) async {
    var response_ = await _client.send('GetQueryExecution', {
      'QueryExecutionId': queryExecutionId,
    });
    return GetQueryExecutionOutput.fromJson(response_);
  }

  /// Returns the results of a single query execution specified by
  /// `QueryExecutionId` if you have access to the workgroup in which the query
  /// ran. This request does not execute the query but returns results. Use
  /// StartQueryExecution to run a query.
  ///
  /// [queryExecutionId]: The unique ID of the query execution.
  ///
  /// [nextToken]: The token that specifies where to start pagination if a
  /// previous request was truncated.
  ///
  /// [maxResults]: The maximum number of results (rows) to return in this
  /// request.
  Future<GetQueryResultsOutput> getQueryResults(String queryExecutionId,
      {String nextToken, int maxResults}) async {
    var response_ = await _client.send('GetQueryResults', {
      'QueryExecutionId': queryExecutionId,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return GetQueryResultsOutput.fromJson(response_);
  }

  /// Returns information about the workgroup with the specified name.
  ///
  /// [workGroup]: The name of the workgroup.
  Future<GetWorkGroupOutput> getWorkGroup(String workGroup) async {
    var response_ = await _client.send('GetWorkGroup', {
      'WorkGroup': workGroup,
    });
    return GetWorkGroupOutput.fromJson(response_);
  }

  /// Provides a list of available query IDs only for queries saved in the
  /// specified workgroup. Requires that you have access to the workgroup.
  ///
  /// For code samples using the AWS SDK for Java, see
  /// [Examples and Code Samples](http://docs.aws.amazon.com/athena/latest/ug/code-samples.html)
  /// in the _Amazon Athena User Guide_.
  ///
  /// [nextToken]: The token that specifies where to start pagination if a
  /// previous request was truncated.
  ///
  /// [maxResults]: The maximum number of queries to return in this request.
  ///
  /// [workGroup]: The name of the workgroup from which the named queries are
  /// being returned.
  Future<ListNamedQueriesOutput> listNamedQueries(
      {String nextToken, int maxResults, String workGroup}) async {
    var response_ = await _client.send('ListNamedQueries', {
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
      if (workGroup != null) 'WorkGroup': workGroup,
    });
    return ListNamedQueriesOutput.fromJson(response_);
  }

  /// Provides a list of available query execution IDs for the queries in the
  /// specified workgroup. Requires you to have access to the workgroup in which
  /// the queries ran.
  ///
  /// For code samples using the AWS SDK for Java, see
  /// [Examples and Code Samples](http://docs.aws.amazon.com/athena/latest/ug/code-samples.html)
  /// in the _Amazon Athena User Guide_.
  ///
  /// [nextToken]: The token that specifies where to start pagination if a
  /// previous request was truncated.
  ///
  /// [maxResults]: The maximum number of query executions to return in this
  /// request.
  ///
  /// [workGroup]: The name of the workgroup from which queries are being
  /// returned.
  Future<ListQueryExecutionsOutput> listQueryExecutions(
      {String nextToken, int maxResults, String workGroup}) async {
    var response_ = await _client.send('ListQueryExecutions', {
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
      if (workGroup != null) 'WorkGroup': workGroup,
    });
    return ListQueryExecutionsOutput.fromJson(response_);
  }

  /// Lists the tags associated with this workgroup.
  ///
  /// [resourceArn]: Lists the tags for the workgroup resource with the
  /// specified ARN.
  ///
  /// [nextToken]: The token for the next set of results, or null if there are
  /// no additional results for this request, where the request lists the tags
  /// for the workgroup resource with the specified ARN.
  ///
  /// [maxResults]: The maximum number of results to be returned per request
  /// that lists the tags for the workgroup resource.
  Future<ListTagsForResourceOutput> listTagsForResource(String resourceArn,
      {String nextToken, int maxResults}) async {
    var response_ = await _client.send('ListTagsForResource', {
      'ResourceARN': resourceArn,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return ListTagsForResourceOutput.fromJson(response_);
  }

  /// Lists available workgroups for the account.
  ///
  /// [nextToken]: A token to be used by the next request if this request is
  /// truncated.
  ///
  /// [maxResults]: The maximum number of workgroups to return in this request.
  Future<ListWorkGroupsOutput> listWorkGroups(
      {String nextToken, int maxResults}) async {
    var response_ = await _client.send('ListWorkGroups', {
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return ListWorkGroupsOutput.fromJson(response_);
  }

  /// Runs the SQL query statements contained in the `Query`. Requires you to
  /// have access to the workgroup in which the query ran.
  ///
  /// For code samples using the AWS SDK for Java, see
  /// [Examples and Code Samples](http://docs.aws.amazon.com/athena/latest/ug/code-samples.html)
  /// in the _Amazon Athena User Guide_.
  ///
  /// [queryString]: The SQL query statements to be executed.
  ///
  /// [clientRequestToken]: A unique case-sensitive string used to ensure the
  /// request to create the query is idempotent (executes only once). If another
  /// `StartQueryExecution` request is received, the same response is returned
  /// and another query is not created. If a parameter has changed, for example,
  /// the `QueryString`, an error is returned.
  ///
  ///
  ///
  /// This token is listed as not required because AWS SDKs (for example the AWS
  /// SDK for Java) auto-generate the token for users. If you are not using the
  /// AWS SDK or the AWS CLI, you must provide this token or the action will
  /// fail.
  ///
  /// [queryExecutionContext]: The database within which the query executes.
  ///
  /// [resultConfiguration]: Specifies information about where and how to save
  /// the results of the query execution. If the query runs in a workgroup, then
  /// workgroup's settings may override query settings. This affects the query
  /// results location. The workgroup settings override is specified in
  /// EnforceWorkGroupConfiguration (true/false) in the WorkGroupConfiguration.
  /// See WorkGroupConfiguration$EnforceWorkGroupConfiguration.
  ///
  /// [workGroup]: The name of the workgroup in which the query is being
  /// started.
  Future<StartQueryExecutionOutput> startQueryExecution(String queryString,
      {String clientRequestToken,
      QueryExecutionContext queryExecutionContext,
      ResultConfiguration resultConfiguration,
      String workGroup}) async {
    var response_ = await _client.send('StartQueryExecution', {
      'QueryString': queryString,
      if (clientRequestToken != null) 'ClientRequestToken': clientRequestToken,
      if (queryExecutionContext != null)
        'QueryExecutionContext': queryExecutionContext,
      if (resultConfiguration != null)
        'ResultConfiguration': resultConfiguration,
      if (workGroup != null) 'WorkGroup': workGroup,
    });
    return StartQueryExecutionOutput.fromJson(response_);
  }

  /// Stops a query execution. Requires you to have access to the workgroup in
  /// which the query ran.
  ///
  /// For code samples using the AWS SDK for Java, see
  /// [Examples and Code Samples](http://docs.aws.amazon.com/athena/latest/ug/code-samples.html)
  /// in the _Amazon Athena User Guide_.
  ///
  /// [queryExecutionId]: The unique ID of the query execution to stop.
  Future<StopQueryExecutionOutput> stopQueryExecution(
      String queryExecutionId) async {
    var response_ = await _client.send('StopQueryExecution', {
      'QueryExecutionId': queryExecutionId,
    });
    return StopQueryExecutionOutput.fromJson(response_);
  }

  /// Adds one or more tags to the resource, such as a workgroup. A tag is a
  /// label that you assign to an AWS Athena resource (a workgroup). Each tag
  /// consists of a key and an optional value, both of which you define. Tags
  /// enable you to categorize resources (workgroups) in Athena, for example, by
  /// purpose, owner, or environment. Use a consistent set of tag keys to make
  /// it easier to search and filter workgroups in your account. For best
  /// practices, see
  /// [AWS Tagging Strategies](https://aws.amazon.com/answers/account-management/aws-tagging-strategies/).
  /// The key length is from 1 (minimum) to 128 (maximum) Unicode characters in
  /// UTF-8. The tag value length is from 0 (minimum) to 256 (maximum) Unicode
  /// characters in UTF-8. You can use letters and numbers representable in
  /// UTF-8, and the following characters: + - = . _ : / @. Tag keys and values
  /// are case-sensitive. Tag keys must be unique per resource. If you specify
  /// more than one, separate them by commas.
  ///
  /// [resourceArn]: Requests that one or more tags are added to the resource
  /// (such as a workgroup) for the specified ARN.
  ///
  /// [tags]: One or more tags, separated by commas, to be added to the
  /// resource, such as a workgroup.
  Future<TagResourceOutput> tagResource(
      {@required String resourceArn, @required List<Tag> tags}) async {
    var response_ = await _client.send('TagResource', {
      'ResourceARN': resourceArn,
      'Tags': tags,
    });
    return TagResourceOutput.fromJson(response_);
  }

  /// Removes one or more tags from the workgroup resource. Takes as an input a
  /// list of TagKey Strings separated by commas, and removes their tags at the
  /// same time.
  ///
  /// [resourceArn]: Removes one or more tags from the workgroup resource for
  /// the specified ARN.
  ///
  /// [tagKeys]: Removes the tags associated with one or more tag keys from the
  /// workgroup resource.
  Future<UntagResourceOutput> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {
    var response_ = await _client.send('UntagResource', {
      'ResourceARN': resourceArn,
      'TagKeys': tagKeys,
    });
    return UntagResourceOutput.fromJson(response_);
  }

  /// Updates the workgroup with the specified name. The workgroup's name cannot
  /// be changed.
  ///
  /// [workGroup]: The specified workgroup that will be updated.
  ///
  /// [description]: The workgroup description.
  ///
  /// [configurationUpdates]: The workgroup configuration that will be updated
  /// for the given workgroup.
  ///
  /// [state]: The workgroup state that will be updated for the given workgroup.
  Future<UpdateWorkGroupOutput> updateWorkGroup(String workGroup,
      {String description,
      WorkGroupConfigurationUpdates configurationUpdates,
      String state}) async {
    var response_ = await _client.send('UpdateWorkGroup', {
      'WorkGroup': workGroup,
      if (description != null) 'Description': description,
      if (configurationUpdates != null)
        'ConfigurationUpdates': configurationUpdates,
      if (state != null) 'State': state,
    });
    return UpdateWorkGroupOutput.fromJson(response_);
  }
}

class BatchGetNamedQueryOutput {
  /// Information about the named query IDs submitted.
  final List<NamedQuery> namedQueries;

  /// Information about provided query IDs.
  final List<UnprocessedNamedQueryId> unprocessedNamedQueryIds;

  BatchGetNamedQueryOutput({
    this.namedQueries,
    this.unprocessedNamedQueryIds,
  });
  static BatchGetNamedQueryOutput fromJson(Map<String, dynamic> json) =>
      BatchGetNamedQueryOutput(
        namedQueries: json.containsKey('NamedQueries')
            ? (json['NamedQueries'] as List)
                .map((e) => NamedQuery.fromJson(e))
                .toList()
            : null,
        unprocessedNamedQueryIds: json.containsKey('UnprocessedNamedQueryIds')
            ? (json['UnprocessedNamedQueryIds'] as List)
                .map((e) => UnprocessedNamedQueryId.fromJson(e))
                .toList()
            : null,
      );
}

class BatchGetQueryExecutionOutput {
  /// Information about a query execution.
  final List<QueryExecution> queryExecutions;

  /// Information about the query executions that failed to run.
  final List<UnprocessedQueryExecutionId> unprocessedQueryExecutionIds;

  BatchGetQueryExecutionOutput({
    this.queryExecutions,
    this.unprocessedQueryExecutionIds,
  });
  static BatchGetQueryExecutionOutput fromJson(Map<String, dynamic> json) =>
      BatchGetQueryExecutionOutput(
        queryExecutions: json.containsKey('QueryExecutions')
            ? (json['QueryExecutions'] as List)
                .map((e) => QueryExecution.fromJson(e))
                .toList()
            : null,
        unprocessedQueryExecutionIds:
            json.containsKey('UnprocessedQueryExecutionIds')
                ? (json['UnprocessedQueryExecutionIds'] as List)
                    .map((e) => UnprocessedQueryExecutionId.fromJson(e))
                    .toList()
                : null,
      );
}

/// Information about the columns in a query execution result.
class ColumnInfo {
  /// The catalog to which the query results belong.
  final String catalogName;

  /// The schema name (database name) to which the query results belong.
  final String schemaName;

  /// The table name for the query results.
  final String tableName;

  /// The name of the column.
  final String name;

  /// A column label.
  final String label;

  /// The data type of the column.
  final String type;

  /// For `DECIMAL` data types, specifies the total number of digits, up to 38.
  /// For performance reasons, we recommend up to 18 digits.
  final int precision;

  /// For `DECIMAL` data types, specifies the total number of digits in the
  /// fractional part of the value. Defaults to 0.
  final int scale;

  /// Indicates the column's nullable status.
  final String nullable;

  /// Indicates whether values in the column are case-sensitive.
  final bool caseSensitive;

  ColumnInfo({
    this.catalogName,
    this.schemaName,
    this.tableName,
    @required this.name,
    this.label,
    @required this.type,
    this.precision,
    this.scale,
    this.nullable,
    this.caseSensitive,
  });
  static ColumnInfo fromJson(Map<String, dynamic> json) => ColumnInfo(
        catalogName: json.containsKey('CatalogName')
            ? json['CatalogName'] as String
            : null,
        schemaName: json.containsKey('SchemaName')
            ? json['SchemaName'] as String
            : null,
        tableName:
            json.containsKey('TableName') ? json['TableName'] as String : null,
        name: json['Name'] as String,
        label: json.containsKey('Label') ? json['Label'] as String : null,
        type: json['Type'] as String,
        precision:
            json.containsKey('Precision') ? json['Precision'] as int : null,
        scale: json.containsKey('Scale') ? json['Scale'] as int : null,
        nullable:
            json.containsKey('Nullable') ? json['Nullable'] as String : null,
        caseSensitive: json.containsKey('CaseSensitive')
            ? json['CaseSensitive'] as bool
            : null,
      );
}

class CreateNamedQueryOutput {
  /// The unique ID of the query.
  final String namedQueryId;

  CreateNamedQueryOutput({
    this.namedQueryId,
  });
  static CreateNamedQueryOutput fromJson(Map<String, dynamic> json) =>
      CreateNamedQueryOutput(
        namedQueryId: json.containsKey('NamedQueryId')
            ? json['NamedQueryId'] as String
            : null,
      );
}

class CreateWorkGroupOutput {
  CreateWorkGroupOutput();
  static CreateWorkGroupOutput fromJson(Map<String, dynamic> json) =>
      CreateWorkGroupOutput();
}

/// A piece of data (a field in the table).
class Datum {
  /// The value of the datum.
  final String varCharValue;

  Datum({
    this.varCharValue,
  });
  static Datum fromJson(Map<String, dynamic> json) => Datum(
        varCharValue: json.containsKey('VarCharValue')
            ? json['VarCharValue'] as String
            : null,
      );
}

class DeleteNamedQueryOutput {
  DeleteNamedQueryOutput();
  static DeleteNamedQueryOutput fromJson(Map<String, dynamic> json) =>
      DeleteNamedQueryOutput();
}

class DeleteWorkGroupOutput {
  DeleteWorkGroupOutput();
  static DeleteWorkGroupOutput fromJson(Map<String, dynamic> json) =>
      DeleteWorkGroupOutput();
}

/// If query results are encrypted in Amazon S3, indicates the encryption option
/// used (for example, `SSE-KMS` or `CSE-KMS`) and key information.
class EncryptionConfiguration {
  /// Indicates whether Amazon S3 server-side encryption with Amazon S3-managed
  /// keys (`SSE-S3`), server-side encryption with KMS-managed keys (`SSE-KMS`),
  /// or client-side encryption with KMS-managed keys (CSE-KMS) is used.
  ///
  /// If a query runs in a workgroup and the workgroup overrides client-side
  /// settings, then the workgroup's setting for encryption is used. It
  /// specifies whether query results must be encrypted, for all queries that
  /// run in this workgroup.
  final String encryptionOption;

  /// For `SSE-KMS` and `CSE-KMS`, this is the KMS key ARN or ID.
  final String kmsKey;

  EncryptionConfiguration({
    @required this.encryptionOption,
    this.kmsKey,
  });
  static EncryptionConfiguration fromJson(Map<String, dynamic> json) =>
      EncryptionConfiguration(
        encryptionOption: json['EncryptionOption'] as String,
        kmsKey: json.containsKey('KmsKey') ? json['KmsKey'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class GetNamedQueryOutput {
  /// Information about the query.
  final NamedQuery namedQuery;

  GetNamedQueryOutput({
    this.namedQuery,
  });
  static GetNamedQueryOutput fromJson(Map<String, dynamic> json) =>
      GetNamedQueryOutput(
        namedQuery: json.containsKey('NamedQuery')
            ? NamedQuery.fromJson(json['NamedQuery'])
            : null,
      );
}

class GetQueryExecutionOutput {
  /// Information about the query execution.
  final QueryExecution queryExecution;

  GetQueryExecutionOutput({
    this.queryExecution,
  });
  static GetQueryExecutionOutput fromJson(Map<String, dynamic> json) =>
      GetQueryExecutionOutput(
        queryExecution: json.containsKey('QueryExecution')
            ? QueryExecution.fromJson(json['QueryExecution'])
            : null,
      );
}

class GetQueryResultsOutput {
  /// The number of rows inserted with a CREATE TABLE AS SELECT statement.
  final BigInt updateCount;

  /// The results of the query execution.
  final ResultSet resultSet;

  /// A token to be used by the next request if this request is truncated.
  final String nextToken;

  GetQueryResultsOutput({
    this.updateCount,
    this.resultSet,
    this.nextToken,
  });
  static GetQueryResultsOutput fromJson(Map<String, dynamic> json) =>
      GetQueryResultsOutput(
        updateCount: json.containsKey('UpdateCount')
            ? BigInt.from(json['UpdateCount'])
            : null,
        resultSet: json.containsKey('ResultSet')
            ? ResultSet.fromJson(json['ResultSet'])
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class GetWorkGroupOutput {
  /// Information about the workgroup.
  final WorkGroup workGroup;

  GetWorkGroupOutput({
    this.workGroup,
  });
  static GetWorkGroupOutput fromJson(Map<String, dynamic> json) =>
      GetWorkGroupOutput(
        workGroup: json.containsKey('WorkGroup')
            ? WorkGroup.fromJson(json['WorkGroup'])
            : null,
      );
}

class ListNamedQueriesOutput {
  /// The list of unique query IDs.
  final List<String> namedQueryIds;

  /// A token to be used by the next request if this request is truncated.
  final String nextToken;

  ListNamedQueriesOutput({
    this.namedQueryIds,
    this.nextToken,
  });
  static ListNamedQueriesOutput fromJson(Map<String, dynamic> json) =>
      ListNamedQueriesOutput(
        namedQueryIds: json.containsKey('NamedQueryIds')
            ? (json['NamedQueryIds'] as List).map((e) => e as String).toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListQueryExecutionsOutput {
  /// The unique IDs of each query execution as an array of strings.
  final List<String> queryExecutionIds;

  /// A token to be used by the next request if this request is truncated.
  final String nextToken;

  ListQueryExecutionsOutput({
    this.queryExecutionIds,
    this.nextToken,
  });
  static ListQueryExecutionsOutput fromJson(Map<String, dynamic> json) =>
      ListQueryExecutionsOutput(
        queryExecutionIds: json.containsKey('QueryExecutionIds')
            ? (json['QueryExecutionIds'] as List)
                .map((e) => e as String)
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListTagsForResourceOutput {
  /// The list of tags associated with this workgroup.
  final List<Tag> tags;

  /// A token to be used by the next request if this request is truncated.
  final String nextToken;

  ListTagsForResourceOutput({
    this.tags,
    this.nextToken,
  });
  static ListTagsForResourceOutput fromJson(Map<String, dynamic> json) =>
      ListTagsForResourceOutput(
        tags: json.containsKey('Tags')
            ? (json['Tags'] as List).map((e) => Tag.fromJson(e)).toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListWorkGroupsOutput {
  /// The list of workgroups, including their names, descriptions, creation
  /// times, and states.
  final List<WorkGroupSummary> workGroups;

  /// A token to be used by the next request if this request is truncated.
  final String nextToken;

  ListWorkGroupsOutput({
    this.workGroups,
    this.nextToken,
  });
  static ListWorkGroupsOutput fromJson(Map<String, dynamic> json) =>
      ListWorkGroupsOutput(
        workGroups: json.containsKey('WorkGroups')
            ? (json['WorkGroups'] as List)
                .map((e) => WorkGroupSummary.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// A query, where `QueryString` is the list of SQL query statements that
/// comprise the query.
class NamedQuery {
  /// The query name.
  final String name;

  /// The query description.
  final String description;

  /// The database to which the query belongs.
  final String database;

  /// The SQL query statements that comprise the query.
  final String queryString;

  /// The unique identifier of the query.
  final String namedQueryId;

  /// The name of the workgroup that contains the named query.
  final String workGroup;

  NamedQuery({
    @required this.name,
    this.description,
    @required this.database,
    @required this.queryString,
    this.namedQueryId,
    this.workGroup,
  });
  static NamedQuery fromJson(Map<String, dynamic> json) => NamedQuery(
        name: json['Name'] as String,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        database: json['Database'] as String,
        queryString: json['QueryString'] as String,
        namedQueryId: json.containsKey('NamedQueryId')
            ? json['NamedQueryId'] as String
            : null,
        workGroup:
            json.containsKey('WorkGroup') ? json['WorkGroup'] as String : null,
      );
}

/// Information about a single instance of a query execution.
class QueryExecution {
  /// The unique identifier for each query execution.
  final String queryExecutionId;

  /// The SQL query statements which the query execution ran.
  final String query;

  /// The type of query statement that was run. `DDL` indicates DDL query
  /// statements. `DML` indicates DML (Data Manipulation Language) query
  /// statements, such as `CREATE TABLE AS SELECT`. `UTILITY` indicates query
  /// statements other than DDL and DML, such as `SHOW CREATE TABLE`, or
  /// `DESCRIBE <table>`.
  final String statementType;

  /// The location in Amazon S3 where query results were stored and the
  /// encryption option, if any, used for query results. These are known as
  /// "client-side settings". If workgroup settings override client-side
  /// settings, then the query uses the location for the query results and the
  /// encryption configuration that are specified for the workgroup.
  final ResultConfiguration resultConfiguration;

  /// The database in which the query execution occurred.
  final QueryExecutionContext queryExecutionContext;

  /// The completion date, current state, submission time, and state change
  /// reason (if applicable) for the query execution.
  final QueryExecutionStatus status;

  /// The amount of data scanned during the query execution and the amount of
  /// time that it took to execute, and the type of statement that was run.
  final QueryExecutionStatistics statistics;

  /// The name of the workgroup in which the query ran.
  final String workGroup;

  QueryExecution({
    this.queryExecutionId,
    this.query,
    this.statementType,
    this.resultConfiguration,
    this.queryExecutionContext,
    this.status,
    this.statistics,
    this.workGroup,
  });
  static QueryExecution fromJson(Map<String, dynamic> json) => QueryExecution(
        queryExecutionId: json.containsKey('QueryExecutionId')
            ? json['QueryExecutionId'] as String
            : null,
        query: json.containsKey('Query') ? json['Query'] as String : null,
        statementType: json.containsKey('StatementType')
            ? json['StatementType'] as String
            : null,
        resultConfiguration: json.containsKey('ResultConfiguration')
            ? ResultConfiguration.fromJson(json['ResultConfiguration'])
            : null,
        queryExecutionContext: json.containsKey('QueryExecutionContext')
            ? QueryExecutionContext.fromJson(json['QueryExecutionContext'])
            : null,
        status: json.containsKey('Status')
            ? QueryExecutionStatus.fromJson(json['Status'])
            : null,
        statistics: json.containsKey('Statistics')
            ? QueryExecutionStatistics.fromJson(json['Statistics'])
            : null,
        workGroup:
            json.containsKey('WorkGroup') ? json['WorkGroup'] as String : null,
      );
}

/// The database in which the query execution occurs.
class QueryExecutionContext {
  /// The name of the database.
  final String database;

  QueryExecutionContext({
    this.database,
  });
  static QueryExecutionContext fromJson(Map<String, dynamic> json) =>
      QueryExecutionContext(
        database:
            json.containsKey('Database') ? json['Database'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The amount of data scanned during the query execution and the amount of time
/// that it took to execute, and the type of statement that was run.
class QueryExecutionStatistics {
  /// The number of milliseconds that the query took to execute.
  final BigInt engineExecutionTimeInMillis;

  /// The number of bytes in the data that was queried.
  final BigInt dataScannedInBytes;

  QueryExecutionStatistics({
    this.engineExecutionTimeInMillis,
    this.dataScannedInBytes,
  });
  static QueryExecutionStatistics fromJson(Map<String, dynamic> json) =>
      QueryExecutionStatistics(
        engineExecutionTimeInMillis:
            json.containsKey('EngineExecutionTimeInMillis')
                ? BigInt.from(json['EngineExecutionTimeInMillis'])
                : null,
        dataScannedInBytes: json.containsKey('DataScannedInBytes')
            ? BigInt.from(json['DataScannedInBytes'])
            : null,
      );
}

/// The completion date, current state, submission time, and state change reason
/// (if applicable) for the query execution.
class QueryExecutionStatus {
  /// The state of query execution. `QUEUED` state is listed but is not used by
  /// Athena and is reserved for future use. `RUNNING` indicates that the query
  /// has been submitted to the service, and Athena will execute the query as
  /// soon as resources are available. `SUCCEEDED` indicates that the query
  /// completed without errors. `FAILED` indicates that the query experienced an
  /// error and did not complete processing. `CANCELLED` indicates that a user
  /// input interrupted query execution.
  final String state;

  /// Further detail about the status of the query.
  final String stateChangeReason;

  /// The date and time that the query was submitted.
  final DateTime submissionDateTime;

  /// The date and time that the query completed.
  final DateTime completionDateTime;

  QueryExecutionStatus({
    this.state,
    this.stateChangeReason,
    this.submissionDateTime,
    this.completionDateTime,
  });
  static QueryExecutionStatus fromJson(Map<String, dynamic> json) =>
      QueryExecutionStatus(
        state: json.containsKey('State') ? json['State'] as String : null,
        stateChangeReason: json.containsKey('StateChangeReason')
            ? json['StateChangeReason'] as String
            : null,
        submissionDateTime: json.containsKey('SubmissionDateTime')
            ? DateTime.parse(json['SubmissionDateTime'])
            : null,
        completionDateTime: json.containsKey('CompletionDateTime')
            ? DateTime.parse(json['CompletionDateTime'])
            : null,
      );
}

/// The location in Amazon S3 where query results are stored and the encryption
/// option, if any, used for query results. These are known as "client-side
/// settings". If workgroup settings override client-side settings, then the
/// query uses the workgroup settings.
class ResultConfiguration {
  /// The location in Amazon S3 where your query results are stored, such as
  /// `s3://path/to/query/bucket/`. To run the query, you must specify the query
  /// results location using one of the ways: either for individual queries
  /// using either this setting (client-side), or in the workgroup, using
  /// WorkGroupConfiguration. If none of them is set, Athena issues an error
  /// that no output location is provided. For more information, see
  /// [Query Results](https://docs.aws.amazon.com/athena/latest/ug/querying.html).
  /// If workgroup settings override client-side settings, then the query uses
  /// the settings specified for the workgroup. See
  /// WorkGroupConfiguration$EnforceWorkGroupConfiguration.
  final String outputLocation;

  /// If query results are encrypted in Amazon S3, indicates the encryption
  /// option used (for example, `SSE-KMS` or `CSE-KMS`) and key information.
  /// This is a client-side setting. If workgroup settings override client-side
  /// settings, then the query uses the encryption configuration that is
  /// specified for the workgroup, and also uses the location for storing query
  /// results specified in the workgroup. See
  /// WorkGroupConfiguration$EnforceWorkGroupConfiguration and
  /// [Workgroup Settings Override Client-Side Settings](https://docs.aws.amazon.com/athena/latest/ug/workgroups-settings-override.html).
  final EncryptionConfiguration encryptionConfiguration;

  ResultConfiguration({
    this.outputLocation,
    this.encryptionConfiguration,
  });
  static ResultConfiguration fromJson(Map<String, dynamic> json) =>
      ResultConfiguration(
        outputLocation: json.containsKey('OutputLocation')
            ? json['OutputLocation'] as String
            : null,
        encryptionConfiguration: json.containsKey('EncryptionConfiguration')
            ? EncryptionConfiguration.fromJson(json['EncryptionConfiguration'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The information about the updates in the query results, such as output
/// location and encryption configuration for the query results.
class ResultConfigurationUpdates {
  /// The location in Amazon S3 where your query results are stored, such as
  /// `s3://path/to/query/bucket/`. For more information, see
  /// [Query Results](https://docs.aws.amazon.com/athena/latest/ug/querying.html)
  /// If workgroup settings override client-side settings, then the query uses
  /// the location for the query results and the encryption configuration that
  /// are specified for the workgroup. The "workgroup settings override" is
  /// specified in EnforceWorkGroupConfiguration (true/false) in the
  /// WorkGroupConfiguration. See
  /// WorkGroupConfiguration$EnforceWorkGroupConfiguration.
  final String outputLocation;

  /// If set to "true", indicates that the previously-specified query results
  /// location (also known as a client-side setting) for queries in this
  /// workgroup should be ignored and set to null. If set to "false" or not set,
  /// and a value is present in the OutputLocation in ResultConfigurationUpdates
  /// (the client-side setting), the OutputLocation in the workgroup's
  /// ResultConfiguration will be updated with the new value. For more
  /// information, see
  /// [Workgroup Settings Override Client-Side Settings](https://docs.aws.amazon.com/athena/latest/ug/workgroups-settings-override.html).
  final bool removeOutputLocation;

  /// The encryption configuration for the query results.
  final EncryptionConfiguration encryptionConfiguration;

  /// If set to "true", indicates that the previously-specified encryption
  /// configuration (also known as the client-side setting) for queries in this
  /// workgroup should be ignored and set to null. If set to "false" or not set,
  /// and a value is present in the EncryptionConfiguration in
  /// ResultConfigurationUpdates (the client-side setting), the
  /// EncryptionConfiguration in the workgroup's ResultConfiguration will be
  /// updated with the new value. For more information, see
  /// [Workgroup Settings Override Client-Side Settings](https://docs.aws.amazon.com/athena/latest/ug/workgroups-settings-override.html).
  final bool removeEncryptionConfiguration;

  ResultConfigurationUpdates({
    this.outputLocation,
    this.removeOutputLocation,
    this.encryptionConfiguration,
    this.removeEncryptionConfiguration,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The metadata and rows that comprise a query result set. The metadata
/// describes the column structure and data types.
class ResultSet {
  /// The rows in the table.
  final List<Row> rows;

  /// The metadata that describes the column structure and data types of a table
  /// of query results.
  final ResultSetMetadata resultSetMetadata;

  ResultSet({
    this.rows,
    this.resultSetMetadata,
  });
  static ResultSet fromJson(Map<String, dynamic> json) => ResultSet(
        rows: json.containsKey('Rows')
            ? (json['Rows'] as List).map((e) => Row.fromJson(e)).toList()
            : null,
        resultSetMetadata: json.containsKey('ResultSetMetadata')
            ? ResultSetMetadata.fromJson(json['ResultSetMetadata'])
            : null,
      );
}

/// The metadata that describes the column structure and data types of a table
/// of query results.
class ResultSetMetadata {
  /// Information about the columns returned in a query result metadata.
  final List<ColumnInfo> columnInfo;

  ResultSetMetadata({
    this.columnInfo,
  });
  static ResultSetMetadata fromJson(Map<String, dynamic> json) =>
      ResultSetMetadata(
        columnInfo: json.containsKey('ColumnInfo')
            ? (json['ColumnInfo'] as List)
                .map((e) => ColumnInfo.fromJson(e))
                .toList()
            : null,
      );
}

/// The rows that comprise a query result table.
class Row {
  /// The data that populates a row in a query result table.
  final List<Datum> data;

  Row({
    this.data,
  });
  static Row fromJson(Map<String, dynamic> json) => Row(
        data: json.containsKey('Data')
            ? (json['Data'] as List).map((e) => Datum.fromJson(e)).toList()
            : null,
      );
}

class StartQueryExecutionOutput {
  /// The unique ID of the query that ran as a result of this request.
  final String queryExecutionId;

  StartQueryExecutionOutput({
    this.queryExecutionId,
  });
  static StartQueryExecutionOutput fromJson(Map<String, dynamic> json) =>
      StartQueryExecutionOutput(
        queryExecutionId: json.containsKey('QueryExecutionId')
            ? json['QueryExecutionId'] as String
            : null,
      );
}

class StopQueryExecutionOutput {
  StopQueryExecutionOutput();
  static StopQueryExecutionOutput fromJson(Map<String, dynamic> json) =>
      StopQueryExecutionOutput();
}

/// A tag that you can add to a resource. A tag is a label that you assign to an
/// AWS Athena resource (a workgroup). Each tag consists of a key and an
/// optional value, both of which you define. Tags enable you to categorize
/// workgroups in Athena, for example, by purpose, owner, or environment. Use a
/// consistent set of tag keys to make it easier to search and filter workgroups
/// in your account. The maximum tag key length is 128 Unicode characters in
/// UTF-8. The maximum tag value length is 256 Unicode characters in UTF-8. You
/// can use letters and numbers representable in UTF-8, and the following
/// characters: + - = . _ : / @. Tag keys and values are case-sensitive. Tag
/// keys must be unique per resource.
class Tag {
  /// A tag key. The tag key length is from 1 to 128 Unicode characters in
  /// UTF-8. You can use letters and numbers representable in UTF-8, and the
  /// following characters: + - = . _ : / @. Tag keys are case-sensitive and
  /// must be unique per resource.
  final String key;

  /// A tag value. The tag value length is from 0 to 256 Unicode characters in
  /// UTF-8. You can use letters and numbers representable in UTF-8, and the
  /// following characters: + - = . _ : / @. Tag values are case-sensitive.
  final String value;

  Tag({
    this.key,
    this.value,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag(
        key: json.containsKey('Key') ? json['Key'] as String : null,
        value: json.containsKey('Value') ? json['Value'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class TagResourceOutput {
  TagResourceOutput();
  static TagResourceOutput fromJson(Map<String, dynamic> json) =>
      TagResourceOutput();
}

/// Information about a named query ID that could not be processed.
class UnprocessedNamedQueryId {
  /// The unique identifier of the named query.
  final String namedQueryId;

  /// The error code returned when the processing request for the named query
  /// failed, if applicable.
  final String errorCode;

  /// The error message returned when the processing request for the named query
  /// failed, if applicable.
  final String errorMessage;

  UnprocessedNamedQueryId({
    this.namedQueryId,
    this.errorCode,
    this.errorMessage,
  });
  static UnprocessedNamedQueryId fromJson(Map<String, dynamic> json) =>
      UnprocessedNamedQueryId(
        namedQueryId: json.containsKey('NamedQueryId')
            ? json['NamedQueryId'] as String
            : null,
        errorCode:
            json.containsKey('ErrorCode') ? json['ErrorCode'] as String : null,
        errorMessage: json.containsKey('ErrorMessage')
            ? json['ErrorMessage'] as String
            : null,
      );
}

/// Describes a query execution that failed to process.
class UnprocessedQueryExecutionId {
  /// The unique identifier of the query execution.
  final String queryExecutionId;

  /// The error code returned when the query execution failed to process, if
  /// applicable.
  final String errorCode;

  /// The error message returned when the query execution failed to process, if
  /// applicable.
  final String errorMessage;

  UnprocessedQueryExecutionId({
    this.queryExecutionId,
    this.errorCode,
    this.errorMessage,
  });
  static UnprocessedQueryExecutionId fromJson(Map<String, dynamic> json) =>
      UnprocessedQueryExecutionId(
        queryExecutionId: json.containsKey('QueryExecutionId')
            ? json['QueryExecutionId'] as String
            : null,
        errorCode:
            json.containsKey('ErrorCode') ? json['ErrorCode'] as String : null,
        errorMessage: json.containsKey('ErrorMessage')
            ? json['ErrorMessage'] as String
            : null,
      );
}

class UntagResourceOutput {
  UntagResourceOutput();
  static UntagResourceOutput fromJson(Map<String, dynamic> json) =>
      UntagResourceOutput();
}

class UpdateWorkGroupOutput {
  UpdateWorkGroupOutput();
  static UpdateWorkGroupOutput fromJson(Map<String, dynamic> json) =>
      UpdateWorkGroupOutput();
}

/// A workgroup, which contains a name, description, creation time, state, and
/// other configuration, listed under WorkGroup$Configuration. Each workgroup
/// enables you to isolate queries for you or your group of users from other
/// queries in the same account, to configure the query results location and the
/// encryption configuration (known as workgroup settings), to enable sending
/// query metrics to Amazon CloudWatch, and to establish per-query data usage
/// control limits for all queries in a workgroup. The workgroup settings
/// override is specified in EnforceWorkGroupConfiguration (true/false) in the
/// WorkGroupConfiguration. See
/// WorkGroupConfiguration$EnforceWorkGroupConfiguration.
class WorkGroup {
  /// The workgroup name.
  final String name;

  /// The state of the workgroup: ENABLED or DISABLED.
  final String state;

  /// The configuration of the workgroup, which includes the location in Amazon
  /// S3 where query results are stored, the encryption configuration, if any,
  /// used for query results; whether the Amazon CloudWatch Metrics are enabled
  /// for the workgroup; whether workgroup settings override client-side
  /// settings; and the data usage limits for the amount of data scanned per
  /// query or per workgroup. The workgroup settings override is specified in
  /// EnforceWorkGroupConfiguration (true/false) in the WorkGroupConfiguration.
  /// See WorkGroupConfiguration$EnforceWorkGroupConfiguration.
  final WorkGroupConfiguration configuration;

  /// The workgroup description.
  final String description;

  /// The date and time the workgroup was created.
  final DateTime creationTime;

  WorkGroup({
    @required this.name,
    this.state,
    this.configuration,
    this.description,
    this.creationTime,
  });
  static WorkGroup fromJson(Map<String, dynamic> json) => WorkGroup(
        name: json['Name'] as String,
        state: json.containsKey('State') ? json['State'] as String : null,
        configuration: json.containsKey('Configuration')
            ? WorkGroupConfiguration.fromJson(json['Configuration'])
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        creationTime: json.containsKey('CreationTime')
            ? DateTime.parse(json['CreationTime'])
            : null,
      );
}

/// The configuration of the workgroup, which includes the location in Amazon S3
/// where query results are stored, the encryption option, if any, used for
/// query results, whether the Amazon CloudWatch Metrics are enabled for the
/// workgroup and whether workgroup settings override query settings, and the
/// data usage limits for the amount of data scanned per query or per workgroup.
/// The workgroup settings override is specified in
/// EnforceWorkGroupConfiguration (true/false) in the WorkGroupConfiguration.
/// See WorkGroupConfiguration$EnforceWorkGroupConfiguration.
class WorkGroupConfiguration {
  /// The configuration for the workgroup, which includes the location in Amazon
  /// S3 where query results are stored and the encryption option, if any, used
  /// for query results. To run the query, you must specify the query results
  /// location using one of the ways: either in the workgroup using this
  /// setting, or for individual queries (client-side), using
  /// ResultConfiguration$OutputLocation. If none of them is set, Athena issues
  /// an error that no output location is provided. For more information, see
  /// [Query Results](https://docs.aws.amazon.com/athena/latest/ug/querying.html).
  final ResultConfiguration resultConfiguration;

  /// If set to "true", the settings for the workgroup override client-side
  /// settings. If set to "false", client-side settings are used. For more
  /// information, see
  /// [Workgroup Settings Override Client-Side Settings](https://docs.aws.amazon.com/athena/latest/ug/workgroups-settings-override.html).
  final bool enforceWorkGroupConfiguration;

  /// Indicates that the Amazon CloudWatch metrics are enabled for the
  /// workgroup.
  final bool publishCloudWatchMetricsEnabled;

  /// The upper data usage limit (cutoff) for the amount of bytes a single query
  /// in a workgroup is allowed to scan.
  final BigInt bytesScannedCutoffPerQuery;

  /// If set to `true`, allows members assigned to a workgroup to reference
  /// Amazon S3 Requester Pays buckets in queries. If set to `false`, workgroup
  /// members cannot query data from Requester Pays buckets, and queries that
  /// retrieve data from Requester Pays buckets cause an error. The default is
  /// `false`. For more information about Requester Pays buckets, see
  /// [Requester Pays Buckets](https://docs.aws.amazon.com/AmazonS3/latest/dev/RequesterPaysBuckets.html)
  /// in the _Amazon Simple Storage Service Developer Guide_.
  final bool requesterPaysEnabled;

  WorkGroupConfiguration({
    this.resultConfiguration,
    this.enforceWorkGroupConfiguration,
    this.publishCloudWatchMetricsEnabled,
    this.bytesScannedCutoffPerQuery,
    this.requesterPaysEnabled,
  });
  static WorkGroupConfiguration fromJson(Map<String, dynamic> json) =>
      WorkGroupConfiguration(
        resultConfiguration: json.containsKey('ResultConfiguration')
            ? ResultConfiguration.fromJson(json['ResultConfiguration'])
            : null,
        enforceWorkGroupConfiguration:
            json.containsKey('EnforceWorkGroupConfiguration')
                ? json['EnforceWorkGroupConfiguration'] as bool
                : null,
        publishCloudWatchMetricsEnabled:
            json.containsKey('PublishCloudWatchMetricsEnabled')
                ? json['PublishCloudWatchMetricsEnabled'] as bool
                : null,
        bytesScannedCutoffPerQuery:
            json.containsKey('BytesScannedCutoffPerQuery')
                ? BigInt.from(json['BytesScannedCutoffPerQuery'])
                : null,
        requesterPaysEnabled: json.containsKey('RequesterPaysEnabled')
            ? json['RequesterPaysEnabled'] as bool
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The configuration information that will be updated for this workgroup, which
/// includes the location in Amazon S3 where query results are stored, the
/// encryption option, if any, used for query results, whether the Amazon
/// CloudWatch Metrics are enabled for the workgroup, whether the workgroup
/// settings override the client-side settings, and the data usage limit for the
/// amount of bytes scanned per query, if it is specified.
class WorkGroupConfigurationUpdates {
  /// If set to "true", the settings for the workgroup override client-side
  /// settings. If set to "false" client-side settings are used. For more
  /// information, see
  /// [Workgroup Settings Override Client-Side Settings](https://docs.aws.amazon.com/athena/latest/ug/workgroups-settings-override.html).
  final bool enforceWorkGroupConfiguration;

  /// The result configuration information about the queries in this workgroup
  /// that will be updated. Includes the updated results location and an updated
  /// option for encrypting query results.
  final ResultConfigurationUpdates resultConfigurationUpdates;

  /// Indicates whether this workgroup enables publishing metrics to Amazon
  /// CloudWatch.
  final bool publishCloudWatchMetricsEnabled;

  /// The upper limit (cutoff) for the amount of bytes a single query in a
  /// workgroup is allowed to scan.
  final BigInt bytesScannedCutoffPerQuery;

  /// Indicates that the data usage control limit per query is removed.
  /// WorkGroupConfiguration$BytesScannedCutoffPerQuery
  final bool removeBytesScannedCutoffPerQuery;

  /// If set to `true`, allows members assigned to a workgroup to specify Amazon
  /// S3 Requester Pays buckets in queries. If set to `false`, workgroup members
  /// cannot query data from Requester Pays buckets, and queries that retrieve
  /// data from Requester Pays buckets cause an error. The default is `false`.
  /// For more information about Requester Pays buckets, see
  /// [Requester Pays Buckets](https://docs.aws.amazon.com/AmazonS3/latest/dev/RequesterPaysBuckets.html)
  /// in the _Amazon Simple Storage Service Developer Guide_.
  final bool requesterPaysEnabled;

  WorkGroupConfigurationUpdates({
    this.enforceWorkGroupConfiguration,
    this.resultConfigurationUpdates,
    this.publishCloudWatchMetricsEnabled,
    this.bytesScannedCutoffPerQuery,
    this.removeBytesScannedCutoffPerQuery,
    this.requesterPaysEnabled,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The summary information for the workgroup, which includes its name, state,
/// description, and the date and time it was created.
class WorkGroupSummary {
  /// The name of the workgroup.
  final String name;

  /// The state of the workgroup.
  final String state;

  /// The workgroup description.
  final String description;

  /// The workgroup creation date and time.
  final DateTime creationTime;

  WorkGroupSummary({
    this.name,
    this.state,
    this.description,
    this.creationTime,
  });
  static WorkGroupSummary fromJson(Map<String, dynamic> json) =>
      WorkGroupSummary(
        name: json.containsKey('Name') ? json['Name'] as String : null,
        state: json.containsKey('State') ? json['State'] as String : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        creationTime: json.containsKey('CreationTime')
            ? DateTime.parse(json['CreationTime'])
            : null,
      );
}
