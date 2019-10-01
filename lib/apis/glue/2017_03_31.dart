import 'package:meta/meta.dart';

/// AWS Glue
///
/// Defines the public endpoint for the AWS Glue service.
class GlueApi {
  /// Creates one or more partitions in a batch operation.
  Future<void> batchCreatePartition(
      {String catalogId,
      @required String databaseName,
      @required String tableName,
      @required List<PartitionInput> partitionInputList}) async {}

  /// Deletes a list of connection definitions from the Data Catalog.
  Future<void> batchDeleteConnection(List<String> connectionNameList,
      {String catalogId}) async {}

  /// Deletes one or more partitions in a batch operation.
  Future<void> batchDeletePartition(
      {String catalogId,
      @required String databaseName,
      @required String tableName,
      @required List<PartitionValueList> partitionsToDelete}) async {}

  /// Deletes multiple tables at once.
  ///
  ///
  ///
  /// After completing this operation, you no longer have access to the table
  /// versions and partitions that belong to the deleted table. AWS Glue deletes
  /// these "orphaned" resources asynchronously in a timely manner, at the
  /// discretion of the service.
  ///
  /// To ensure the immediate deletion of all related resources, before calling
  /// `BatchDeleteTable`, use `DeleteTableVersion` or `BatchDeleteTableVersion`,
  /// and `DeletePartition` or `BatchDeletePartition`, to delete any resources
  /// that belong to the table.
  Future<void> batchDeleteTable(
      {String catalogId,
      @required String databaseName,
      @required List<String> tablesToDelete}) async {}

  /// Deletes a specified batch of versions of a table.
  Future<void> batchDeleteTableVersion(
      {String catalogId,
      @required String databaseName,
      @required String tableName,
      @required List<String> versionIds}) async {}

  /// Returns a list of resource metadata for a given list of crawler names.
  /// After calling the `ListCrawlers` operation, you can call this operation to
  /// access the data to which you have been granted permissions. This operation
  /// supports all IAM permissions, including permission conditions that uses
  /// tags.
  Future<void> batchGetCrawlers(List<String> crawlerNames) async {}

  /// Returns a list of resource metadata for a given list of development
  /// endpoint names. After calling the `ListDevEndpoints` operation, you can
  /// call this operation to access the data to which you have been granted
  /// permissions. This operation supports all IAM permissions, including
  /// permission conditions that uses tags.
  Future<void> batchGetDevEndpoints(List<String> devEndpointNames) async {}

  /// Returns a list of resource metadata for a given list of job names. After
  /// calling the `ListJobs` operation, you can call this operation to access
  /// the data to which you have been granted permissions. This operation
  /// supports all IAM permissions, including permission conditions that uses
  /// tags.
  Future<void> batchGetJobs(List<String> jobNames) async {}

  /// Retrieves partitions in a batch request.
  Future<void> batchGetPartition(
      {String catalogId,
      @required String databaseName,
      @required String tableName,
      @required List<PartitionValueList> partitionsToGet}) async {}

  /// Returns a list of resource metadata for a given list of trigger names.
  /// After calling the `ListTriggers` operation, you can call this operation to
  /// access the data to which you have been granted permissions. This operation
  /// supports all IAM permissions, including permission conditions that uses
  /// tags.
  Future<void> batchGetTriggers(List<String> triggerNames) async {}

  /// Returns a list of resource metadata for a given list of workflow names.
  /// After calling the `ListWorkflows` operation, you can call this operation
  /// to access the data to which you have been granted permissions. This
  /// operation supports all IAM permissions, including permission conditions
  /// that uses tags.
  Future<void> batchGetWorkflows(List<String> names,
      {bool includeGraph}) async {}

  /// Stops one or more job runs for a specified job definition.
  Future<void> batchStopJobRun(
      {@required String jobName, @required List<String> jobRunIds}) async {}

  /// Cancels (stops) a task run. Machine learning task runs are asynchronous
  /// tasks that AWS Glue runs on your behalf as part of various machine
  /// learning workflows. You can cancel a machine learning task run at any time
  /// by calling `CancelMLTaskRun` with a task run's parent transform's
  /// `TransformID` and the task run's `TaskRunId`.
  Future<void> cancelMLTaskRun(
      {@required String transformId, @required String taskRunId}) async {}

  /// Creates a classifier in the user's account. This can be a
  /// `GrokClassifier`, an `XMLClassifier`, a `JsonClassifier`, or a
  /// `CsvClassifier`, depending on which field of the request is present.
  Future<void> createClassifier(
      {CreateGrokClassifierRequest grokClassifier,
      CreateXmlClassifierRequest xmlClassifier,
      CreateJsonClassifierRequest jsonClassifier,
      CreateCsvClassifierRequest csvClassifier}) async {}

  /// Creates a connection definition in the Data Catalog.
  Future<void> createConnection(ConnectionInput connectionInput,
      {String catalogId}) async {}

  /// Creates a new crawler with specified targets, role, configuration, and
  /// optional schedule. At least one crawl target must be specified, in the
  /// `s3Targets` field, the `jdbcTargets` field, or the `DynamoDBTargets`
  /// field.
  Future<void> createCrawler(
      {@required String name,
      @required String role,
      String databaseName,
      String description,
      @required CrawlerTargets targets,
      String schedule,
      List<String> classifiers,
      String tablePrefix,
      SchemaChangePolicy schemaChangePolicy,
      String configuration,
      String crawlerSecurityConfiguration,
      Map<String, String> tags}) async {}

  /// Creates a new database in a Data Catalog.
  Future<void> createDatabase(DatabaseInput databaseInput,
      {String catalogId}) async {}

  /// Creates a new development endpoint.
  Future<void> createDevEndpoint(
      {@required String endpointName,
      @required String roleArn,
      List<String> securityGroupIds,
      String subnetId,
      String publicKey,
      List<String> publicKeys,
      int numberOfNodes,
      String workerType,
      int numberOfWorkers,
      String extraPythonLibsS3Path,
      String extraJarsS3Path,
      String securityConfiguration,
      Map<String, String> tags,
      Map<String, String> arguments}) async {}

  /// Creates a new job definition.
  Future<void> createJob(
      {@required String name,
      String description,
      String logUri,
      @required String role,
      ExecutionProperty executionProperty,
      @required JobCommand command,
      Map<String, String> defaultArguments,
      ConnectionsList connections,
      int maxRetries,
      int allocatedCapacity,
      int timeout,
      double maxCapacity,
      String securityConfiguration,
      Map<String, String> tags,
      NotificationProperty notificationProperty,
      String glueVersion,
      int numberOfWorkers,
      String workerType}) async {}

  /// Creates an AWS Glue machine learning transform. This operation creates the
  /// transform and all the necessary parameters to train it.
  ///
  /// Call this operation as the first step in the process of using a machine
  /// learning transform (such as the `FindMatches` transform) for deduplicating
  /// data. You can provide an optional `Description`, in addition to the
  /// parameters that you want to use for your algorithm.
  ///
  /// You must also specify certain parameters for the tasks that AWS Glue runs
  /// on your behalf as part of learning from your data and creating a
  /// high-quality machine learning transform. These parameters include `Role`,
  /// and optionally, `AllocatedCapacity`, `Timeout`, and `MaxRetries`. For more
  /// information, see
  /// [Jobs](https://docs.aws.amazon.com/glue/latest/dg/aws-glue-api-jobs-job.html).
  Future<void> createMLTransform(
      {@required String name,
      String description,
      @required List<GlueTable> inputRecordTables,
      @required TransformParameters parameters,
      @required String role,
      double maxCapacity,
      String workerType,
      int numberOfWorkers,
      int timeout,
      int maxRetries}) async {}

  /// Creates a new partition.
  Future<void> createPartition(
      {String catalogId,
      @required String databaseName,
      @required String tableName,
      @required PartitionInput partitionInput}) async {}

  /// Transforms a directed acyclic graph (DAG) into code.
  Future<void> createScript(
      {List<CodeGenNode> dagNodes,
      List<CodeGenEdge> dagEdges,
      String language}) async {}

  /// Creates a new security configuration. A security configuration is a set of
  /// security properties that can be used by AWS Glue. You can use a security
  /// configuration to encrypt data at rest. For information about using
  /// security configurations in AWS Glue, see [Encrypting Data Written by
  /// Crawlers, Jobs, and Development
  /// Endpoints](https://docs.aws.amazon.com/glue/latest/dg/encryption-security-configuration.html).
  Future<void> createSecurityConfiguration(
      {@required String name,
      @required EncryptionConfiguration encryptionConfiguration}) async {}

  /// Creates a new table definition in the Data Catalog.
  Future<void> createTable(
      {String catalogId,
      @required String databaseName,
      @required TableInput tableInput}) async {}

  /// Creates a new trigger.
  Future<void> createTrigger(
      {@required String name,
      String workflowName,
      @required String type,
      String schedule,
      Predicate predicate,
      @required List<Action> actions,
      String description,
      bool startOnCreation,
      Map<String, String> tags}) async {}

  /// Creates a new function definition in the Data Catalog.
  Future<void> createUserDefinedFunction(
      {String catalogId,
      @required String databaseName,
      @required UserDefinedFunctionInput functionInput}) async {}

  /// Creates a new workflow.
  Future<void> createWorkflow(String name,
      {String description,
      Map<String, String> defaultRunProperties,
      Map<String, String> tags}) async {}

  /// Removes a classifier from the Data Catalog.
  Future<void> deleteClassifier(String name) async {}

  /// Deletes a connection from the Data Catalog.
  Future<void> deleteConnection(String connectionName,
      {String catalogId}) async {}

  /// Removes a specified crawler from the AWS Glue Data Catalog, unless the
  /// crawler state is `RUNNING`.
  Future<void> deleteCrawler(String name) async {}

  /// Removes a specified database from a Data Catalog.
  ///
  ///
  ///
  /// After completing this operation, you no longer have access to the tables
  /// (and all table versions and partitions that might belong to the tables)
  /// and the user-defined functions in the deleted database. AWS Glue deletes
  /// these "orphaned" resources asynchronously in a timely manner, at the
  /// discretion of the service.
  ///
  /// To ensure the immediate deletion of all related resources, before calling
  /// `DeleteDatabase`, use `DeleteTableVersion` or `BatchDeleteTableVersion`,
  /// `DeletePartition` or `BatchDeletePartition`, `DeleteUserDefinedFunction`,
  /// and `DeleteTable` or `BatchDeleteTable`, to delete any resources that
  /// belong to the database.
  Future<void> deleteDatabase(String name, {String catalogId}) async {}

  /// Deletes a specified development endpoint.
  Future<void> deleteDevEndpoint(String endpointName) async {}

  /// Deletes a specified job definition. If the job definition is not found, no
  /// exception is thrown.
  Future<void> deleteJob(String jobName) async {}

  /// Deletes an AWS Glue machine learning transform. Machine learning
  /// transforms are a special type of transform that use machine learning to
  /// learn the details of the transformation to be performed by learning from
  /// examples provided by humans. These transformations are then saved by AWS
  /// Glue. If you no longer need a transform, you can delete it by calling
  /// `DeleteMLTransforms`. However, any AWS Glue jobs that still reference the
  /// deleted transform will no longer succeed.
  Future<void> deleteMLTransform(String transformId) async {}

  /// Deletes a specified partition.
  Future<void> deletePartition(
      {String catalogId,
      @required String databaseName,
      @required String tableName,
      @required List<String> partitionValues}) async {}

  /// Deletes a specified policy.
  Future<void> deleteResourcePolicy({String policyHashCondition}) async {}

  /// Deletes a specified security configuration.
  Future<void> deleteSecurityConfiguration(String name) async {}

  /// Removes a table definition from the Data Catalog.
  ///
  ///
  ///
  /// After completing this operation, you no longer have access to the table
  /// versions and partitions that belong to the deleted table. AWS Glue deletes
  /// these "orphaned" resources asynchronously in a timely manner, at the
  /// discretion of the service.
  ///
  /// To ensure the immediate deletion of all related resources, before calling
  /// `DeleteTable`, use `DeleteTableVersion` or `BatchDeleteTableVersion`, and
  /// `DeletePartition` or `BatchDeletePartition`, to delete any resources that
  /// belong to the table.
  Future<void> deleteTable(
      {String catalogId,
      @required String databaseName,
      @required String name}) async {}

  /// Deletes a specified version of a table.
  Future<void> deleteTableVersion(
      {String catalogId,
      @required String databaseName,
      @required String tableName,
      @required String versionId}) async {}

  /// Deletes a specified trigger. If the trigger is not found, no exception is
  /// thrown.
  Future<void> deleteTrigger(String name) async {}

  /// Deletes an existing function definition from the Data Catalog.
  Future<void> deleteUserDefinedFunction(
      {String catalogId,
      @required String databaseName,
      @required String functionName}) async {}

  /// Deletes a workflow.
  Future<void> deleteWorkflow(String name) async {}

  /// Retrieves the status of a migration operation.
  Future<void> getCatalogImportStatus({String catalogId}) async {}

  /// Retrieve a classifier by name.
  Future<void> getClassifier(String name) async {}

  /// Lists all classifier objects in the Data Catalog.
  Future<void> getClassifiers({int maxResults, String nextToken}) async {}

  /// Retrieves a connection definition from the Data Catalog.
  Future<void> getConnection(String name,
      {String catalogId, bool hidePassword}) async {}

  /// Retrieves a list of connection definitions from the Data Catalog.
  Future<void> getConnections(
      {String catalogId,
      GetConnectionsFilter filter,
      bool hidePassword,
      String nextToken,
      int maxResults}) async {}

  /// Retrieves metadata for a specified crawler.
  Future<void> getCrawler(String name) async {}

  /// Retrieves metrics about specified crawlers.
  Future<void> getCrawlerMetrics(
      {List<String> crawlerNameList, int maxResults, String nextToken}) async {}

  /// Retrieves metadata for all crawlers defined in the customer account.
  Future<void> getCrawlers({int maxResults, String nextToken}) async {}

  /// Retrieves the security configuration for a specified catalog.
  Future<void> getDataCatalogEncryptionSettings({String catalogId}) async {}

  /// Retrieves the definition of a specified database.
  Future<void> getDatabase(String name, {String catalogId}) async {}

  /// Retrieves all databases defined in a given Data Catalog.
  Future<void> getDatabases(
      {String catalogId, String nextToken, int maxResults}) async {}

  /// Transforms a Python script into a directed acyclic graph (DAG).
  Future<void> getDataflowGraph({String pythonScript}) async {}

  /// Retrieves information about a specified development endpoint.
  ///
  ///
  ///
  /// When you create a development endpoint in a virtual private cloud (VPC),
  /// AWS Glue returns only a private IP address, and the public IP address
  /// field is not populated. When you create a non-VPC development endpoint,
  /// AWS Glue returns only a public IP address.
  Future<void> getDevEndpoint(String endpointName) async {}

  /// Retrieves all the development endpoints in this AWS account.
  ///
  ///
  ///
  /// When you create a development endpoint in a virtual private cloud (VPC),
  /// AWS Glue returns only a private IP address and the public IP address field
  /// is not populated. When you create a non-VPC development endpoint, AWS Glue
  /// returns only a public IP address.
  Future<void> getDevEndpoints({int maxResults, String nextToken}) async {}

  /// Retrieves an existing job definition.
  Future<void> getJob(String jobName) async {}

  /// Returns information on a job bookmark entry.
  Future<void> getJobBookmark(String jobName, {String runId}) async {}

  /// Retrieves the metadata for a given job run.
  Future<void> getJobRun(
      {@required String jobName,
      @required String runId,
      bool predecessorsIncluded}) async {}

  /// Retrieves metadata for all runs of a given job definition.
  Future<void> getJobRuns(String jobName,
      {String nextToken, int maxResults}) async {}

  /// Retrieves all current job definitions.
  Future<void> getJobs({String nextToken, int maxResults}) async {}

  /// Gets details for a specific task run on a machine learning transform.
  /// Machine learning task runs are asynchronous tasks that AWS Glue runs on
  /// your behalf as part of various machine learning workflows. You can check
  /// the stats of any task run by calling `GetMLTaskRun` with the `TaskRunID`
  /// and its parent transform's `TransformID`.
  Future<void> getMLTaskRun(
      {@required String transformId, @required String taskRunId}) async {}

  /// Gets a list of runs for a machine learning transform. Machine learning
  /// task runs are asynchronous tasks that AWS Glue runs on your behalf as part
  /// of various machine learning workflows. You can get a sortable, filterable
  /// list of machine learning task runs by calling `GetMLTaskRuns` with their
  /// parent transform's `TransformID` and other optional parameters as
  /// documented in this section.
  ///
  /// This operation returns a list of historic runs and must be paginated.
  Future<void> getMLTaskRuns(String transformId,
      {String nextToken,
      int maxResults,
      TaskRunFilterCriteria filter,
      TaskRunSortCriteria sort}) async {}

  /// Gets an AWS Glue machine learning transform artifact and all its
  /// corresponding metadata. Machine learning transforms are a special type of
  /// transform that use machine learning to learn the details of the
  /// transformation to be performed by learning from examples provided by
  /// humans. These transformations are then saved by AWS Glue. You can retrieve
  /// their metadata by calling `GetMLTransform`.
  Future<void> getMLTransform(String transformId) async {}

  /// Gets a sortable, filterable list of existing AWS Glue machine learning
  /// transforms. Machine learning transforms are a special type of transform
  /// that use machine learning to learn the details of the transformation to be
  /// performed by learning from examples provided by humans. These
  /// transformations are then saved by AWS Glue, and you can retrieve their
  /// metadata by calling `GetMLTransforms`.
  Future<void> getMLTransforms(
      {String nextToken,
      int maxResults,
      TransformFilterCriteria filter,
      TransformSortCriteria sort}) async {}

  /// Creates mappings.
  Future<void> getMapping(CatalogEntry source,
      {List<CatalogEntry> sinks, Location location}) async {}

  /// Retrieves information about a specified partition.
  Future<void> getPartition(
      {String catalogId,
      @required String databaseName,
      @required String tableName,
      @required List<String> partitionValues}) async {}

  /// Retrieves information about the partitions in a table.
  Future<void> getPartitions(
      {String catalogId,
      @required String databaseName,
      @required String tableName,
      String expression,
      String nextToken,
      Segment segment,
      int maxResults}) async {}

  /// Gets code to perform a specified mapping.
  Future<void> getPlan(
      {@required List<MappingEntry> mapping,
      @required CatalogEntry source,
      List<CatalogEntry> sinks,
      Location location,
      String language}) async {}

  /// Retrieves a specified resource policy.
  Future<void> getResourcePolicy() async {}

  /// Retrieves a specified security configuration.
  Future<void> getSecurityConfiguration(String name) async {}

  /// Retrieves a list of all security configurations.
  Future<void> getSecurityConfigurations(
      {int maxResults, String nextToken}) async {}

  /// Retrieves the `Table` definition in a Data Catalog for a specified table.
  Future<void> getTable(
      {String catalogId,
      @required String databaseName,
      @required String name}) async {}

  /// Retrieves a specified version of a table.
  Future<void> getTableVersion(
      {String catalogId,
      @required String databaseName,
      @required String tableName,
      String versionId}) async {}

  /// Retrieves a list of strings that identify available versions of a
  /// specified table.
  Future<void> getTableVersions(
      {String catalogId,
      @required String databaseName,
      @required String tableName,
      String nextToken,
      int maxResults}) async {}

  /// Retrieves the definitions of some or all of the tables in a given
  /// `Database`.
  Future<void> getTables(String databaseName,
      {String catalogId,
      String expression,
      String nextToken,
      int maxResults}) async {}

  /// Retrieves a list of tags associated with a resource.
  Future<void> getTags(String resourceArn) async {}

  /// Retrieves the definition of a trigger.
  Future<void> getTrigger(String name) async {}

  /// Gets all the triggers associated with a job.
  Future<void> getTriggers(
      {String nextToken, String dependentJobName, int maxResults}) async {}

  /// Retrieves a specified function definition from the Data Catalog.
  Future<void> getUserDefinedFunction(
      {String catalogId,
      @required String databaseName,
      @required String functionName}) async {}

  /// Retrieves multiple function definitions from the Data Catalog.
  Future<void> getUserDefinedFunctions(
      {String catalogId,
      @required String databaseName,
      @required String pattern,
      String nextToken,
      int maxResults}) async {}

  /// Retrieves resource metadata for a workflow.
  Future<void> getWorkflow(String name, {bool includeGraph}) async {}

  /// Retrieves the metadata for a given workflow run.
  Future<void> getWorkflowRun(
      {@required String name,
      @required String runId,
      bool includeGraph}) async {}

  /// Retrieves the workflow run properties which were set during the run.
  Future<void> getWorkflowRunProperties(
      {@required String name, @required String runId}) async {}

  /// Retrieves metadata for all runs of a given workflow.
  Future<void> getWorkflowRuns(String name,
      {bool includeGraph, String nextToken, int maxResults}) async {}

  /// Imports an existing Amazon Athena Data Catalog to AWS Glue
  Future<void> importCatalogToGlue({String catalogId}) async {}

  /// Retrieves the names of all crawler resources in this AWS account, or the
  /// resources with the specified tag. This operation allows you to see which
  /// resources are available in your account, and their names.
  ///
  /// This operation takes the optional `Tags` field, which you can use as a
  /// filter on the response so that tagged resources can be retrieved as a
  /// group. If you choose to use tags filtering, only resources with the tag
  /// are retrieved.
  Future<void> listCrawlers(
      {int maxResults, String nextToken, Map<String, String> tags}) async {}

  /// Retrieves the names of all `DevEndpoint` resources in this AWS account, or
  /// the resources with the specified tag. This operation allows you to see
  /// which resources are available in your account, and their names.
  ///
  /// This operation takes the optional `Tags` field, which you can use as a
  /// filter on the response so that tagged resources can be retrieved as a
  /// group. If you choose to use tags filtering, only resources with the tag
  /// are retrieved.
  Future<void> listDevEndpoints(
      {String nextToken, int maxResults, Map<String, String> tags}) async {}

  /// Retrieves the names of all job resources in this AWS account, or the
  /// resources with the specified tag. This operation allows you to see which
  /// resources are available in your account, and their names.
  ///
  /// This operation takes the optional `Tags` field, which you can use as a
  /// filter on the response so that tagged resources can be retrieved as a
  /// group. If you choose to use tags filtering, only resources with the tag
  /// are retrieved.
  Future<void> listJobs(
      {String nextToken, int maxResults, Map<String, String> tags}) async {}

  /// Retrieves the names of all trigger resources in this AWS account, or the
  /// resources with the specified tag. This operation allows you to see which
  /// resources are available in your account, and their names.
  ///
  /// This operation takes the optional `Tags` field, which you can use as a
  /// filter on the response so that tagged resources can be retrieved as a
  /// group. If you choose to use tags filtering, only resources with the tag
  /// are retrieved.
  Future<void> listTriggers(
      {String nextToken,
      String dependentJobName,
      int maxResults,
      Map<String, String> tags}) async {}

  /// Lists names of workflows created in the account.
  Future<void> listWorkflows({String nextToken, int maxResults}) async {}

  /// Sets the security configuration for a specified catalog. After the
  /// configuration has been set, the specified encryption is applied to every
  /// catalog write thereafter.
  Future<void> putDataCatalogEncryptionSettings(
      DataCatalogEncryptionSettings dataCatalogEncryptionSettings,
      {String catalogId}) async {}

  /// Sets the Data Catalog resource policy for access control.
  Future<void> putResourcePolicy(String policyInJson,
      {String policyHashCondition, String policyExistsCondition}) async {}

  /// Puts the specified workflow run properties for the given workflow run. If
  /// a property already exists for the specified run, then it overrides the
  /// value otherwise adds the property to existing properties.
  Future<void> putWorkflowRunProperties(
      {@required String name,
      @required String runId,
      @required Map<String, String> runProperties}) async {}

  /// Resets a bookmark entry.
  Future<void> resetJobBookmark(String jobName, {String runId}) async {}

  /// Searches a set of tables based on properties in the table metadata as well
  /// as on the parent database. You can search against text or filter
  /// conditions.
  ///
  /// You can only get tables that you have access to based on the security
  /// policies defined in Lake Formation. You need at least a read-only access
  /// to the table for it to be returned. If you do not have access to all the
  /// columns in the table, these columns will not be searched against when
  /// returning the list of tables back to you. If you have access to the
  /// columns but not the data in the columns, those columns and the associated
  /// metadata for those columns will be included in the search.
  Future<void> searchTables(
      {String catalogId,
      String nextToken,
      List<PropertyPredicate> filters,
      String searchText,
      List<SortCriterion> sortCriteria,
      int maxResults}) async {}

  /// Starts a crawl using the specified crawler, regardless of what is
  /// scheduled. If the crawler is already running, returns a
  /// [CrawlerRunningException](https://docs.aws.amazon.com/glue/latest/dg/aws-glue-api-exceptions.html#aws-glue-api-exceptions-CrawlerRunningException).
  Future<void> startCrawler(String name) async {}

  /// Changes the schedule state of the specified crawler to `SCHEDULED`, unless
  /// the crawler is already running or the schedule state is already
  /// `SCHEDULED`.
  Future<void> startCrawlerSchedule(String crawlerName) async {}

  /// Begins an asynchronous task to export all labeled data for a particular
  /// transform. This task is the only label-related API call that is not part
  /// of the typical active learning workflow. You typically use
  /// `StartExportLabelsTaskRun` when you want to work with all of your existing
  /// labels at the same time, such as when you want to remove or change labels
  /// that were previously submitted as truth. This API operation accepts the
  /// `TransformId` whose labels you want to export and an Amazon Simple Storage
  /// Service (Amazon S3) path to export the labels to. The operation returns a
  /// `TaskRunId`. You can check on the status of your task run by calling the
  /// `GetMLTaskRun` API.
  Future<void> startExportLabelsTaskRun(
      {@required String transformId, @required String outputS3Path}) async {}

  /// Enables you to provide additional labels (examples of truth) to be used to
  /// teach the machine learning transform and improve its quality. This API
  /// operation is generally used as part of the active learning workflow that
  /// starts with the `StartMLLabelingSetGenerationTaskRun` call and that
  /// ultimately results in improving the quality of your machine learning
  /// transform.
  ///
  /// After the `StartMLLabelingSetGenerationTaskRun` finishes, AWS Glue machine
  /// learning will have generated a series of questions for humans to answer.
  /// (Answering these questions is often called 'labeling' in the machine
  /// learning workflows). In the case of the `FindMatches` transform, these
  /// questions are of the form, “What is the correct way to group these rows
  /// together into groups composed entirely of matching records?” After the
  /// labeling process is finished, users upload their answers/labels with a
  /// call to `StartImportLabelsTaskRun`. After `StartImportLabelsTaskRun`
  /// finishes, all future runs of the machine learning transform use the new
  /// and improved labels and perform a higher-quality transformation.
  ///
  /// By default, `StartMLLabelingSetGenerationTaskRun` continually learns from
  /// and combines all labels that you upload unless you set `Replace` to true.
  /// If you set `Replace` to true, `StartImportLabelsTaskRun` deletes and
  /// forgets all previously uploaded labels and learns only from the exact set
  /// that you upload. Replacing labels can be helpful if you realize that you
  /// previously uploaded incorrect labels, and you believe that they are having
  /// a negative effect on your transform quality.
  ///
  /// You can check on the status of your task run by calling the `GetMLTaskRun`
  /// operation.
  Future<void> startImportLabelsTaskRun(
      {@required String transformId,
      @required String inputS3Path,
      bool replaceAllLabels}) async {}

  /// Starts a job run using a job definition.
  Future<void> startJobRun(String jobName,
      {String jobRunId,
      Map<String, String> arguments,
      int allocatedCapacity,
      int timeout,
      double maxCapacity,
      String securityConfiguration,
      NotificationProperty notificationProperty,
      String workerType,
      int numberOfWorkers}) async {}

  /// Starts a task to estimate the quality of the transform.
  ///
  /// When you provide label sets as examples of truth, AWS Glue machine
  /// learning uses some of those examples to learn from them. The rest of the
  /// labels are used as a test to estimate quality.
  ///
  /// Returns a unique identifier for the run. You can call `GetMLTaskRun` to
  /// get more information about the stats of the `EvaluationTaskRun`.
  Future<void> startMLEvaluationTaskRun(String transformId) async {}

  /// Starts the active learning workflow for your machine learning transform to
  /// improve the transform's quality by generating label sets and adding
  /// labels.
  ///
  /// When the `StartMLLabelingSetGenerationTaskRun` finishes, AWS Glue will
  /// have generated a "labeling set" or a set of questions for humans to
  /// answer.
  ///
  /// In the case of the `FindMatches` transform, these questions are of the
  /// form, “What is the correct way to group these rows together into groups
  /// composed entirely of matching records?”
  ///
  /// After the labeling process is finished, you can upload your labels with a
  /// call to `StartImportLabelsTaskRun`. After `StartImportLabelsTaskRun`
  /// finishes, all future runs of the machine learning transform will use the
  /// new and improved labels and perform a higher-quality transformation.
  Future<void> startMLLabelingSetGenerationTaskRun(
      {@required String transformId, @required String outputS3Path}) async {}

  /// Starts an existing trigger. See [Triggering
  /// Jobs](https://docs.aws.amazon.com/glue/latest/dg/trigger-job.html) for
  /// information about how different types of trigger are started.
  Future<void> startTrigger(String name) async {}

  /// Starts a new run of the specified workflow.
  Future<void> startWorkflowRun(String name) async {}

  /// If the specified crawler is running, stops the crawl.
  Future<void> stopCrawler(String name) async {}

  /// Sets the schedule state of the specified crawler to `NOT_SCHEDULED`, but
  /// does not stop the crawler if it is already running.
  Future<void> stopCrawlerSchedule(String crawlerName) async {}

  /// Stops a specified trigger.
  Future<void> stopTrigger(String name) async {}

  /// Adds tags to a resource. A tag is a label you can assign to an AWS
  /// resource. In AWS Glue, you can tag only certain resources. For information
  /// about what resources you can tag, see [AWS Tags in AWS
  /// Glue](https://docs.aws.amazon.com/glue/latest/dg/monitor-tags.html).
  Future<void> tagResource(
      {@required String resourceArn,
      @required Map<String, String> tagsToAdd}) async {}

  /// Removes tags from a resource.
  Future<void> untagResource(
      {@required String resourceArn,
      @required List<String> tagsToRemove}) async {}

  /// Modifies an existing classifier (a `GrokClassifier`, an `XMLClassifier`, a
  /// `JsonClassifier`, or a `CsvClassifier`, depending on which field is
  /// present).
  Future<void> updateClassifier(
      {UpdateGrokClassifierRequest grokClassifier,
      UpdateXmlClassifierRequest xmlClassifier,
      UpdateJsonClassifierRequest jsonClassifier,
      UpdateCsvClassifierRequest csvClassifier}) async {}

  /// Updates a connection definition in the Data Catalog.
  Future<void> updateConnection(
      {String catalogId,
      @required String name,
      @required ConnectionInput connectionInput}) async {}

  /// Updates a crawler. If a crawler is running, you must stop it using
  /// `StopCrawler` before updating it.
  Future<void> updateCrawler(String name,
      {String role,
      String databaseName,
      String description,
      CrawlerTargets targets,
      String schedule,
      List<String> classifiers,
      String tablePrefix,
      SchemaChangePolicy schemaChangePolicy,
      String configuration,
      String crawlerSecurityConfiguration}) async {}

  /// Updates the schedule of a crawler using a `cron` expression.
  Future<void> updateCrawlerSchedule(String crawlerName,
      {String schedule}) async {}

  /// Updates an existing database definition in a Data Catalog.
  Future<void> updateDatabase(
      {String catalogId,
      @required String name,
      @required DatabaseInput databaseInput}) async {}

  /// Updates a specified development endpoint.
  Future<void> updateDevEndpoint(String endpointName,
      {String publicKey,
      List<String> addPublicKeys,
      List<String> deletePublicKeys,
      DevEndpointCustomLibraries customLibraries,
      bool updateEtlLibraries,
      List<String> deleteArguments,
      Map<String, String> addArguments}) async {}

  /// Updates an existing job definition.
  Future<void> updateJob(
      {@required String jobName, @required JobUpdate jobUpdate}) async {}

  /// Updates an existing machine learning transform. Call this operation to
  /// tune the algorithm parameters to achieve better results.
  ///
  /// After calling this operation, you can call the `StartMLEvaluationTaskRun`
  /// operation to assess how well your new parameters achieved your goals (such
  /// as improving the quality of your machine learning transform, or making it
  /// more cost-effective).
  Future<void> updateMLTransform(String transformId,
      {String name,
      String description,
      TransformParameters parameters,
      String role,
      double maxCapacity,
      String workerType,
      int numberOfWorkers,
      int timeout,
      int maxRetries}) async {}

  /// Updates a partition.
  Future<void> updatePartition(
      {String catalogId,
      @required String databaseName,
      @required String tableName,
      @required List<String> partitionValueList,
      @required PartitionInput partitionInput}) async {}

  /// Updates a metadata table in the Data Catalog.
  Future<void> updateTable(
      {String catalogId,
      @required String databaseName,
      @required TableInput tableInput,
      bool skipArchive}) async {}

  /// Updates a trigger definition.
  Future<void> updateTrigger(
      {@required String name, @required TriggerUpdate triggerUpdate}) async {}

  /// Updates an existing function definition in the Data Catalog.
  Future<void> updateUserDefinedFunction(
      {String catalogId,
      @required String databaseName,
      @required String functionName,
      @required UserDefinedFunctionInput functionInput}) async {}

  /// Updates an existing workflow.
  Future<void> updateWorkflow(String name,
      {String description, Map<String, String> defaultRunProperties}) async {}
}

class Action {}

class BatchCreatePartitionResponse {}

class BatchDeleteConnectionResponse {}

class BatchDeletePartitionResponse {}

class BatchDeleteTableResponse {}

class BatchDeleteTableVersionResponse {}

class BatchGetCrawlersResponse {}

class BatchGetDevEndpointsResponse {}

class BatchGetJobsResponse {}

class BatchGetPartitionResponse {}

class BatchGetTriggersResponse {}

class BatchGetWorkflowsResponse {}

class BatchStopJobRunError {}

class BatchStopJobRunResponse {}

class BatchStopJobRunSuccessfulSubmission {}

class CancelMLTaskRunResponse {}

class CatalogEntry {}

class CatalogImportStatus {}

class CatalogTarget {}

class Classifier {}

class CloudWatchEncryption {}

class CodeGenEdge {}

class CodeGenNode {}

class CodeGenNodeArg {}

class Column {}

class Condition {}

class ConfusionMatrix {}

class Connection {}

class ConnectionInput {}

class ConnectionPasswordEncryption {}

class ConnectionsList {}

class Crawl {}

class Crawler {}

class CrawlerMetrics {}

class CrawlerNodeDetails {}

class CrawlerTargets {}

class CreateClassifierResponse {}

class CreateConnectionResponse {}

class CreateCrawlerResponse {}

class CreateCsvClassifierRequest {}

class CreateDatabaseResponse {}

class CreateDevEndpointResponse {}

class CreateGrokClassifierRequest {}

class CreateJobResponse {}

class CreateJsonClassifierRequest {}

class CreateMLTransformResponse {}

class CreatePartitionResponse {}

class CreateScriptResponse {}

class CreateSecurityConfigurationResponse {}

class CreateTableResponse {}

class CreateTriggerResponse {}

class CreateUserDefinedFunctionResponse {}

class CreateWorkflowResponse {}

class CreateXmlClassifierRequest {}

class CsvClassifier {}

class DataCatalogEncryptionSettings {}

class DataLakePrincipal {}

class Database {}

class DatabaseInput {}

class DeleteClassifierResponse {}

class DeleteConnectionResponse {}

class DeleteCrawlerResponse {}

class DeleteDatabaseResponse {}

class DeleteDevEndpointResponse {}

class DeleteJobResponse {}

class DeleteMLTransformResponse {}

class DeletePartitionResponse {}

class DeleteResourcePolicyResponse {}

class DeleteSecurityConfigurationResponse {}

class DeleteTableResponse {}

class DeleteTableVersionResponse {}

class DeleteTriggerResponse {}

class DeleteUserDefinedFunctionResponse {}

class DeleteWorkflowResponse {}

class DevEndpoint {}

class DevEndpointCustomLibraries {}

class DynamoDBTarget {}

class Edge {}

class EncryptionAtRest {}

class EncryptionConfiguration {}

class ErrorDetail {}

class EvaluationMetrics {}

class ExecutionProperty {}

class ExportLabelsTaskRunProperties {}

class FindMatchesMetrics {}

class FindMatchesParameters {}

class FindMatchesTaskRunProperties {}

class GetCatalogImportStatusResponse {}

class GetClassifierResponse {}

class GetClassifiersResponse {}

class GetConnectionResponse {}

class GetConnectionsFilter {}

class GetConnectionsResponse {}

class GetCrawlerMetricsResponse {}

class GetCrawlerResponse {}

class GetCrawlersResponse {}

class GetDataCatalogEncryptionSettingsResponse {}

class GetDatabaseResponse {}

class GetDatabasesResponse {}

class GetDataflowGraphResponse {}

class GetDevEndpointResponse {}

class GetDevEndpointsResponse {}

class GetJobBookmarkResponse {}

class GetJobResponse {}

class GetJobRunResponse {}

class GetJobRunsResponse {}

class GetJobsResponse {}

class GetMLTaskRunResponse {}

class GetMLTaskRunsResponse {}

class GetMLTransformResponse {}

class GetMLTransformsResponse {}

class GetMappingResponse {}

class GetPartitionResponse {}

class GetPartitionsResponse {}

class GetPlanResponse {}

class GetResourcePolicyResponse {}

class GetSecurityConfigurationResponse {}

class GetSecurityConfigurationsResponse {}

class GetTableResponse {}

class GetTableVersionResponse {}

class GetTableVersionsResponse {}

class GetTablesResponse {}

class GetTagsResponse {}

class GetTriggerResponse {}

class GetTriggersResponse {}

class GetUserDefinedFunctionResponse {}

class GetUserDefinedFunctionsResponse {}

class GetWorkflowResponse {}

class GetWorkflowRunPropertiesResponse {}

class GetWorkflowRunResponse {}

class GetWorkflowRunsResponse {}

class GlueTable {}

class GrokClassifier {}

class ImportCatalogToGlueResponse {}

class ImportLabelsTaskRunProperties {}

class JdbcTarget {}

class Job {}

class JobBookmarkEntry {}

class JobBookmarksEncryption {}

class JobCommand {}

class JobNodeDetails {}

class JobRun {}

class JobUpdate {}

class JsonClassifier {}

class LabelingSetGenerationTaskRunProperties {}

class LastCrawlInfo {}

class ListCrawlersResponse {}

class ListDevEndpointsResponse {}

class ListJobsResponse {}

class ListTriggersResponse {}

class ListWorkflowsResponse {}

class Location {}

class MLTransform {}

class MappingEntry {}

class Node {}

class NotificationProperty {}

class Order {}

class Partition {}

class PartitionError {}

class PartitionInput {}

class PartitionValueList {}

class PhysicalConnectionRequirements {}

class Predecessor {}

class Predicate {}

class PrincipalPermissions {}

class PropertyPredicate {}

class PutDataCatalogEncryptionSettingsResponse {}

class PutResourcePolicyResponse {}

class PutWorkflowRunPropertiesResponse {}

class ResetJobBookmarkResponse {}

class ResourceUri {}

class S3Encryption {}

class S3Target {}

class Schedule {}

class SchemaChangePolicy {}

class SchemaColumn {}

class SearchTablesResponse {}

class SecurityConfiguration {}

class Segment {}

class SerDeInfo {}

class SkewedInfo {}

class SortCriterion {}

class StartCrawlerResponse {}

class StartCrawlerScheduleResponse {}

class StartExportLabelsTaskRunResponse {}

class StartImportLabelsTaskRunResponse {}

class StartJobRunResponse {}

class StartMLEvaluationTaskRunResponse {}

class StartMLLabelingSetGenerationTaskRunResponse {}

class StartTriggerResponse {}

class StartWorkflowRunResponse {}

class StopCrawlerResponse {}

class StopCrawlerScheduleResponse {}

class StopTriggerResponse {}

class StorageDescriptor {}

class Table {}

class TableError {}

class TableInput {}

class TableVersion {}

class TableVersionError {}

class TagResourceResponse {}

class TaskRun {}

class TaskRunFilterCriteria {}

class TaskRunProperties {}

class TaskRunSortCriteria {}

class TransformFilterCriteria {}

class TransformParameters {}

class TransformSortCriteria {}

class Trigger {}

class TriggerNodeDetails {}

class TriggerUpdate {}

class UntagResourceResponse {}

class UpdateClassifierResponse {}

class UpdateConnectionResponse {}

class UpdateCrawlerResponse {}

class UpdateCrawlerScheduleResponse {}

class UpdateCsvClassifierRequest {}

class UpdateDatabaseResponse {}

class UpdateDevEndpointResponse {}

class UpdateGrokClassifierRequest {}

class UpdateJobResponse {}

class UpdateJsonClassifierRequest {}

class UpdateMLTransformResponse {}

class UpdatePartitionResponse {}

class UpdateTableResponse {}

class UpdateTriggerResponse {}

class UpdateUserDefinedFunctionResponse {}

class UpdateWorkflowResponse {}

class UpdateXmlClassifierRequest {}

class UserDefinedFunction {}

class UserDefinedFunctionInput {}

class Workflow {}

class WorkflowGraph {}

class WorkflowRun {}

class WorkflowRunStatistics {}

class XmlClassifier {}
