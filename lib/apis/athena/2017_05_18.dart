import 'package:meta/meta.dart';

/// Amazon Athena is an interactive query service that lets you use standard SQL
/// to analyze data directly in Amazon S3. You can point Athena at your data in
/// Amazon S3 and run ad-hoc queries and get results in seconds. Athena is
/// serverless, so there is no infrastructure to set up or manage. You pay only
/// for the queries you run. Athena scales automatically—executing queries in
/// parallel—so results are fast, even with large datasets and complex queries.
/// For more information, see [What is Amazon
/// Athena](http://docs.aws.amazon.com/athena/latest/ug/what-is.html) in the
/// _Amazon Athena User Guide_.
///
/// If you connect to Athena using the JDBC driver, use version 1.1.0 of the
/// driver or later with the Amazon Athena API. Earlier version drivers do not
/// support the API. For more information and to download the driver, see
/// [Accessing Amazon Athena with
/// JDBC](https://docs.aws.amazon.com/athena/latest/ug/connect-with-jdbc.html).
///
/// For code samples using the AWS SDK for Java, see [Examples and Code
/// Samples](https://docs.aws.amazon.com/athena/latest/ug/code-samples.html) in
/// the _Amazon Athena User Guide_.
class AthenaApi {
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
  Future<void> batchGetNamedQuery(List<String> namedQueryIds) async {}

  /// Returns the details of a single query execution or a list of up to 50
  /// query executions, which you provide as an array of query execution ID
  /// strings. Requires you to have access to the workgroup in which the queries
  /// ran. To get a list of query execution IDs, use
  /// ListQueryExecutionsInput$WorkGroup. Query executions differ from named
  /// (saved) queries. Use BatchGetNamedQueryInput to get details about named
  /// queries.
  Future<void> batchGetQueryExecution(List<String> queryExecutionIds) async {}

  /// Creates a named query in the specified workgroup. Requires that you have
  /// access to the workgroup.
  ///
  /// For code samples using the AWS SDK for Java, see [Examples and Code
  /// Samples](http://docs.aws.amazon.com/athena/latest/ug/code-samples.html) in
  /// the _Amazon Athena User Guide_.
  Future<void> createNamedQuery(
      {@required String name,
      String description,
      @required String database,
      @required String queryString,
      String clientRequestToken,
      String workGroup}) async {}

  /// Creates a workgroup with the specified name.
  Future<void> createWorkGroup(String name,
      {WorkGroupConfiguration configuration,
      String description,
      List<Tag> tags}) async {}

  /// Deletes the named query if you have access to the workgroup in which the
  /// query was saved.
  ///
  /// For code samples using the AWS SDK for Java, see [Examples and Code
  /// Samples](http://docs.aws.amazon.com/athena/latest/ug/code-samples.html) in
  /// the _Amazon Athena User Guide_.
  Future<void> deleteNamedQuery(String namedQueryId) async {}

  /// Deletes the workgroup with the specified name. The primary workgroup
  /// cannot be deleted.
  Future<void> deleteWorkGroup(String workGroup,
      {bool recursiveDeleteOption}) async {}

  /// Returns information about a single query. Requires that you have access to
  /// the workgroup in which the query was saved.
  Future<void> getNamedQuery(String namedQueryId) async {}

  /// Returns information about a single execution of a query if you have access
  /// to the workgroup in which the query ran. Each time a query executes,
  /// information about the query execution is saved with a unique ID.
  Future<void> getQueryExecution(String queryExecutionId) async {}

  /// Returns the results of a single query execution specified by
  /// `QueryExecutionId` if you have access to the workgroup in which the query
  /// ran. This request does not execute the query but returns results. Use
  /// StartQueryExecution to run a query.
  Future<void> getQueryResults(String queryExecutionId,
      {String nextToken, int maxResults}) async {}

  /// Returns information about the workgroup with the specified name.
  Future<void> getWorkGroup(String workGroup) async {}

  /// Provides a list of available query IDs only for queries saved in the
  /// specified workgroup. Requires that you have access to the workgroup.
  ///
  /// For code samples using the AWS SDK for Java, see [Examples and Code
  /// Samples](http://docs.aws.amazon.com/athena/latest/ug/code-samples.html) in
  /// the _Amazon Athena User Guide_.
  Future<void> listNamedQueries(
      {String nextToken, int maxResults, String workGroup}) async {}

  /// Provides a list of available query execution IDs for the queries in the
  /// specified workgroup. Requires you to have access to the workgroup in which
  /// the queries ran.
  ///
  /// For code samples using the AWS SDK for Java, see [Examples and Code
  /// Samples](http://docs.aws.amazon.com/athena/latest/ug/code-samples.html) in
  /// the _Amazon Athena User Guide_.
  Future<void> listQueryExecutions(
      {String nextToken, int maxResults, String workGroup}) async {}

  /// Lists the tags associated with this workgroup.
  Future<void> listTagsForResource(String resourceArn,
      {String nextToken, int maxResults}) async {}

  /// Lists available workgroups for the account.
  Future<void> listWorkGroups({String nextToken, int maxResults}) async {}

  /// Runs the SQL query statements contained in the `Query`. Requires you to
  /// have access to the workgroup in which the query ran.
  ///
  /// For code samples using the AWS SDK for Java, see [Examples and Code
  /// Samples](http://docs.aws.amazon.com/athena/latest/ug/code-samples.html) in
  /// the _Amazon Athena User Guide_.
  Future<void> startQueryExecution(String queryString,
      {String clientRequestToken,
      QueryExecutionContext queryExecutionContext,
      ResultConfiguration resultConfiguration,
      String workGroup}) async {}

  /// Stops a query execution. Requires you to have access to the workgroup in
  /// which the query ran.
  ///
  /// For code samples using the AWS SDK for Java, see [Examples and Code
  /// Samples](http://docs.aws.amazon.com/athena/latest/ug/code-samples.html) in
  /// the _Amazon Athena User Guide_.
  Future<void> stopQueryExecution(String queryExecutionId) async {}

  /// Adds one or more tags to the resource, such as a workgroup. A tag is a
  /// label that you assign to an AWS Athena resource (a workgroup). Each tag
  /// consists of a key and an optional value, both of which you define. Tags
  /// enable you to categorize resources (workgroups) in Athena, for example, by
  /// purpose, owner, or environment. Use a consistent set of tag keys to make
  /// it easier to search and filter workgroups in your account. For best
  /// practices, see [AWS Tagging
  /// Strategies](https://aws.amazon.com/answers/account-management/aws-tagging-strategies/).
  /// The key length is from 1 (minimum) to 128 (maximum) Unicode characters in
  /// UTF-8. The tag value length is from 0 (minimum) to 256 (maximum) Unicode
  /// characters in UTF-8. You can use letters and numbers representable in
  /// UTF-8, and the following characters: + - = . _ : / @. Tag keys and values
  /// are case-sensitive. Tag keys must be unique per resource. If you specify
  /// more than one, separate them by commas.
  Future<void> tagResource(
      {@required String resourceArn, @required List<Tag> tags}) async {}

  /// Removes one or more tags from the workgroup resource. Takes as an input a
  /// list of TagKey Strings separated by commas, and removes their tags at the
  /// same time.
  Future<void> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {}

  /// Updates the workgroup with the specified name. The workgroup's name cannot
  /// be changed.
  Future<void> updateWorkGroup(String workGroup,
      {String description,
      WorkGroupConfigurationUpdates configurationUpdates,
      String state}) async {}
}

class BatchGetNamedQueryOutput {}

class BatchGetQueryExecutionOutput {}

class ColumnInfo {}

class CreateNamedQueryOutput {}

class CreateWorkGroupOutput {}

class Datum {}

class DeleteNamedQueryOutput {}

class DeleteWorkGroupOutput {}

class EncryptionConfiguration {}

class GetNamedQueryOutput {}

class GetQueryExecutionOutput {}

class GetQueryResultsOutput {}

class GetWorkGroupOutput {}

class ListNamedQueriesOutput {}

class ListQueryExecutionsOutput {}

class ListTagsForResourceOutput {}

class ListWorkGroupsOutput {}

class NamedQuery {}

class QueryExecution {}

class QueryExecutionContext {}

class QueryExecutionStatistics {}

class QueryExecutionStatus {}

class ResultConfiguration {}

class ResultConfigurationUpdates {}

class ResultSet {}

class ResultSetMetadata {}

class Row {}

class StartQueryExecutionOutput {}

class StopQueryExecutionOutput {}

class Tag {}

class TagResourceOutput {}

class UnprocessedNamedQueryId {}

class UnprocessedQueryExecutionId {}

class UntagResourceOutput {}

class UpdateWorkGroupOutput {}

class WorkGroup {}

class WorkGroupConfiguration {}

class WorkGroupConfigurationUpdates {}

class WorkGroupSummary {}
