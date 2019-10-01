import 'package:meta/meta.dart';

/// AWS Glue
///
/// Defines the public endpoint for the AWS Glue service.
class GlueApi {
  /// Creates one or more partitions in a batch operation.
  ///
  /// [catalogId]: The ID of the catalog in which the partition is to be
  /// created. Currently, this should be the AWS account ID.
  ///
  /// [databaseName]: The name of the metadata database in which the partition
  /// is to be created.
  ///
  /// [tableName]: The name of the metadata table in which the partition is to
  /// be created.
  ///
  /// [partitionInputList]: A list of `PartitionInput` structures that define
  /// the partitions to be created.
  Future<BatchCreatePartitionResponse> batchCreatePartition(
      {String catalogId,
      @required String databaseName,
      @required String tableName,
      @required List<PartitionInput> partitionInputList}) async {
    return BatchCreatePartitionResponse.fromJson({});
  }

  /// Deletes a list of connection definitions from the Data Catalog.
  ///
  /// [catalogId]: The ID of the Data Catalog in which the connections reside.
  /// If none is provided, the AWS account ID is used by default.
  ///
  /// [connectionNameList]: A list of names of the connections to delete.
  Future<BatchDeleteConnectionResponse> batchDeleteConnection(
      List<String> connectionNameList,
      {String catalogId}) async {
    return BatchDeleteConnectionResponse.fromJson({});
  }

  /// Deletes one or more partitions in a batch operation.
  ///
  /// [catalogId]: The ID of the Data Catalog where the partition to be deleted
  /// resides. If none is provided, the AWS account ID is used by default.
  ///
  /// [databaseName]: The name of the catalog database in which the table in
  /// question resides.
  ///
  /// [tableName]: The name of the table that contains the partitions to be
  /// deleted.
  ///
  /// [partitionsToDelete]: A list of `PartitionInput` structures that define
  /// the partitions to be deleted.
  Future<BatchDeletePartitionResponse> batchDeletePartition(
      {String catalogId,
      @required String databaseName,
      @required String tableName,
      @required List<PartitionValueList> partitionsToDelete}) async {
    return BatchDeletePartitionResponse.fromJson({});
  }

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
  ///
  /// [catalogId]: The ID of the Data Catalog where the table resides. If none
  /// is provided, the AWS account ID is used by default.
  ///
  /// [databaseName]: The name of the catalog database in which the tables to
  /// delete reside. For Hive compatibility, this name is entirely lowercase.
  ///
  /// [tablesToDelete]: A list of the table to delete.
  Future<BatchDeleteTableResponse> batchDeleteTable(
      {String catalogId,
      @required String databaseName,
      @required List<String> tablesToDelete}) async {
    return BatchDeleteTableResponse.fromJson({});
  }

  /// Deletes a specified batch of versions of a table.
  ///
  /// [catalogId]: The ID of the Data Catalog where the tables reside. If none
  /// is provided, the AWS account ID is used by default.
  ///
  /// [databaseName]: The database in the catalog in which the table resides.
  /// For Hive compatibility, this name is entirely lowercase.
  ///
  /// [tableName]: The name of the table. For Hive compatibility, this name is
  /// entirely lowercase.
  ///
  /// [versionIds]: A list of the IDs of versions to be deleted. A `VersionId`
  /// is a string representation of an integer. Each version is incremented by
  /// 1.
  Future<BatchDeleteTableVersionResponse> batchDeleteTableVersion(
      {String catalogId,
      @required String databaseName,
      @required String tableName,
      @required List<String> versionIds}) async {
    return BatchDeleteTableVersionResponse.fromJson({});
  }

  /// Returns a list of resource metadata for a given list of crawler names.
  /// After calling the `ListCrawlers` operation, you can call this operation to
  /// access the data to which you have been granted permissions. This operation
  /// supports all IAM permissions, including permission conditions that uses
  /// tags.
  ///
  /// [crawlerNames]: A list of crawler names, which might be the names returned
  /// from the `ListCrawlers` operation.
  Future<BatchGetCrawlersResponse> batchGetCrawlers(
      List<String> crawlerNames) async {
    return BatchGetCrawlersResponse.fromJson({});
  }

  /// Returns a list of resource metadata for a given list of development
  /// endpoint names. After calling the `ListDevEndpoints` operation, you can
  /// call this operation to access the data to which you have been granted
  /// permissions. This operation supports all IAM permissions, including
  /// permission conditions that uses tags.
  ///
  /// [devEndpointNames]: The list of `DevEndpoint` names, which might be the
  /// names returned from the `ListDevEndpoint` operation.
  Future<BatchGetDevEndpointsResponse> batchGetDevEndpoints(
      List<String> devEndpointNames) async {
    return BatchGetDevEndpointsResponse.fromJson({});
  }

  /// Returns a list of resource metadata for a given list of job names. After
  /// calling the `ListJobs` operation, you can call this operation to access
  /// the data to which you have been granted permissions. This operation
  /// supports all IAM permissions, including permission conditions that uses
  /// tags.
  ///
  /// [jobNames]: A list of job names, which might be the names returned from
  /// the `ListJobs` operation.
  Future<BatchGetJobsResponse> batchGetJobs(List<String> jobNames) async {
    return BatchGetJobsResponse.fromJson({});
  }

  /// Retrieves partitions in a batch request.
  ///
  /// [catalogId]: The ID of the Data Catalog where the partitions in question
  /// reside. If none is supplied, the AWS account ID is used by default.
  ///
  /// [databaseName]: The name of the catalog database where the partitions
  /// reside.
  ///
  /// [tableName]: The name of the partitions' table.
  ///
  /// [partitionsToGet]: A list of partition values identifying the partitions
  /// to retrieve.
  Future<BatchGetPartitionResponse> batchGetPartition(
      {String catalogId,
      @required String databaseName,
      @required String tableName,
      @required List<PartitionValueList> partitionsToGet}) async {
    return BatchGetPartitionResponse.fromJson({});
  }

  /// Returns a list of resource metadata for a given list of trigger names.
  /// After calling the `ListTriggers` operation, you can call this operation to
  /// access the data to which you have been granted permissions. This operation
  /// supports all IAM permissions, including permission conditions that uses
  /// tags.
  ///
  /// [triggerNames]: A list of trigger names, which may be the names returned
  /// from the `ListTriggers` operation.
  Future<BatchGetTriggersResponse> batchGetTriggers(
      List<String> triggerNames) async {
    return BatchGetTriggersResponse.fromJson({});
  }

  /// Returns a list of resource metadata for a given list of workflow names.
  /// After calling the `ListWorkflows` operation, you can call this operation
  /// to access the data to which you have been granted permissions. This
  /// operation supports all IAM permissions, including permission conditions
  /// that uses tags.
  ///
  /// [names]: A list of workflow names, which may be the names returned from
  /// the `ListWorkflows` operation.
  ///
  /// [includeGraph]: Specifies whether to include a graph when returning the
  /// workflow resource metadata.
  Future<BatchGetWorkflowsResponse> batchGetWorkflows(List<String> names,
      {bool includeGraph}) async {
    return BatchGetWorkflowsResponse.fromJson({});
  }

  /// Stops one or more job runs for a specified job definition.
  ///
  /// [jobName]: The name of the job definition for which to stop job runs.
  ///
  /// [jobRunIds]: A list of the `JobRunIds` that should be stopped for that job
  /// definition.
  Future<BatchStopJobRunResponse> batchStopJobRun(
      {@required String jobName, @required List<String> jobRunIds}) async {
    return BatchStopJobRunResponse.fromJson({});
  }

  /// Cancels (stops) a task run. Machine learning task runs are asynchronous
  /// tasks that AWS Glue runs on your behalf as part of various machine
  /// learning workflows. You can cancel a machine learning task run at any time
  /// by calling `CancelMLTaskRun` with a task run's parent transform's
  /// `TransformID` and the task run's `TaskRunId`.
  ///
  /// [transformId]: The unique identifier of the machine learning transform.
  ///
  /// [taskRunId]: A unique identifier for the task run.
  Future<CancelMLTaskRunResponse> cancelMLTaskRun(
      {@required String transformId, @required String taskRunId}) async {
    return CancelMLTaskRunResponse.fromJson({});
  }

  /// Creates a classifier in the user's account. This can be a
  /// `GrokClassifier`, an `XMLClassifier`, a `JsonClassifier`, or a
  /// `CsvClassifier`, depending on which field of the request is present.
  ///
  /// [grokClassifier]: A `GrokClassifier` object specifying the classifier to
  /// create.
  ///
  /// [xmlClassifier]: An `XMLClassifier` object specifying the classifier to
  /// create.
  ///
  /// [jsonClassifier]: A `JsonClassifier` object specifying the classifier to
  /// create.
  ///
  /// [csvClassifier]: A `CsvClassifier` object specifying the classifier to
  /// create.
  Future<CreateClassifierResponse> createClassifier(
      {CreateGrokClassifierRequest grokClassifier,
      CreateXmlClassifierRequest xmlClassifier,
      CreateJsonClassifierRequest jsonClassifier,
      CreateCsvClassifierRequest csvClassifier}) async {
    return CreateClassifierResponse.fromJson({});
  }

  /// Creates a connection definition in the Data Catalog.
  ///
  /// [catalogId]: The ID of the Data Catalog in which to create the connection.
  /// If none is provided, the AWS account ID is used by default.
  ///
  /// [connectionInput]: A `ConnectionInput` object defining the connection to
  /// create.
  Future<CreateConnectionResponse> createConnection(
      ConnectionInput connectionInput,
      {String catalogId}) async {
    return CreateConnectionResponse.fromJson({});
  }

  /// Creates a new crawler with specified targets, role, configuration, and
  /// optional schedule. At least one crawl target must be specified, in the
  /// `s3Targets` field, the `jdbcTargets` field, or the `DynamoDBTargets`
  /// field.
  ///
  /// [name]: Name of the new crawler.
  ///
  /// [role]: The IAM role or Amazon Resource Name (ARN) of an IAM role used by
  /// the new crawler to access customer resources.
  ///
  /// [databaseName]: The AWS Glue database where results are written, such as:
  /// `arn:aws:daylight:us-east-1::database/sometable/*`.
  ///
  /// [description]: A description of the new crawler.
  ///
  /// [targets]: A list of collection of targets to crawl.
  ///
  /// [schedule]: A `cron` expression used to specify the schedule. For more
  /// information, see [Time-Based Schedules for Jobs and
  /// Crawlers](http://docs.aws.amazon.com/glue/latest/dg/monitor-data-warehouse-schedule.html).
  /// For example, to run something every day at 12:15 UTC, specify `cron(15 12
  /// * * ? *)`.
  ///
  /// [classifiers]: A list of custom classifiers that the user has registered.
  /// By default, all built-in classifiers are included in a crawl, but these
  /// custom classifiers always override the default classifiers for a given
  /// classification.
  ///
  /// [tablePrefix]: The table prefix used for catalog tables that are created.
  ///
  /// [schemaChangePolicy]: The policy for the crawler's update and deletion
  /// behavior.
  ///
  /// [configuration]: The crawler configuration information. This versioned
  /// JSON string allows users to specify aspects of a crawler's behavior. For
  /// more information, see [Configuring a
  /// Crawler](http://docs.aws.amazon.com/glue/latest/dg/crawler-configuration.html).
  ///
  /// [crawlerSecurityConfiguration]: The name of the `SecurityConfiguration`
  /// structure to be used by this crawler.
  ///
  /// [tags]: The tags to use with this crawler request. You can use tags to
  /// limit access to the crawler. For more information, see [AWS Tags in AWS
  /// Glue](http://docs.aws.amazon.com/glue/latest/dg/monitor-tags.html).
  Future<CreateCrawlerResponse> createCrawler(
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
      Map<String, String> tags}) async {
    return CreateCrawlerResponse.fromJson({});
  }

  /// Creates a new database in a Data Catalog.
  ///
  /// [catalogId]: The ID of the Data Catalog in which to create the database.
  /// If none is provided, the AWS account ID is used by default.
  ///
  /// [databaseInput]: The metadata for the database.
  Future<CreateDatabaseResponse> createDatabase(DatabaseInput databaseInput,
      {String catalogId}) async {
    return CreateDatabaseResponse.fromJson({});
  }

  /// Creates a new development endpoint.
  ///
  /// [endpointName]: The name to be assigned to the new `DevEndpoint`.
  ///
  /// [roleArn]: The IAM role for the `DevEndpoint`.
  ///
  /// [securityGroupIds]: Security group IDs for the security groups to be used
  /// by the new `DevEndpoint`.
  ///
  /// [subnetId]: The subnet ID for the new `DevEndpoint` to use.
  ///
  /// [publicKey]: The public key to be used by this `DevEndpoint` for
  /// authentication. This attribute is provided for backward compatibility
  /// because the recommended attribute to use is public keys.
  ///
  /// [publicKeys]: A list of public keys to be used by the development
  /// endpoints for authentication. The use of this attribute is preferred over
  /// a single public key because the public keys allow you to have a different
  /// private key per client.
  ///
  ///
  ///
  /// If you previously created an endpoint with a public key, you must remove
  /// that key to be able to set a list of public keys. Call the
  /// `UpdateDevEndpoint` API with the public key content in the
  /// `deletePublicKeys` attribute, and the list of new keys in the
  /// `addPublicKeys` attribute.
  ///
  /// [numberOfNodes]: The number of AWS Glue Data Processing Units (DPUs) to
  /// allocate to this `DevEndpoint`.
  ///
  /// [workerType]: The type of predefined worker that is allocated to the
  /// development endpoint. Accepts a value of Standard, G.1X, or G.2X.
  ///
  /// *   For the `Standard` worker type, each worker provides 4 vCPU, 16 GB of
  /// memory and a 50GB disk, and 2 executors per worker.
  ///
  /// *   For the `G.1X` worker type, each worker maps to 1 DPU (4 vCPU, 16 GB
  /// of memory, 64 GB disk), and provides 1 executor per worker. We recommend
  /// this worker type for memory-intensive jobs.
  ///
  /// *   For the `G.2X` worker type, each worker maps to 2 DPU (8 vCPU, 32 GB
  /// of memory, 128 GB disk), and provides 1 executor per worker. We recommend
  /// this worker type for memory-intensive jobs.
  ///
  ///
  /// Known issue: when a development endpoint is created with the `G.2X`
  /// `WorkerType` configuration, the Spark drivers for the development endpoint
  /// will run on 4 vCPU, 16 GB of memory, and a 64 GB disk.
  ///
  /// [numberOfWorkers]: The number of workers of a defined `workerType` that
  /// are allocated to the development endpoint.
  ///
  /// The maximum number of workers you can define are 299 for `G.1X`, and 149
  /// for `G.2X`.
  ///
  /// [extraPythonLibsS3Path]: The paths to one or more Python libraries in an
  /// Amazon S3 bucket that should be loaded in your `DevEndpoint`. Multiple
  /// values must be complete paths separated by a comma.
  ///
  ///
  ///
  /// You can only use pure Python libraries with a `DevEndpoint`. Libraries
  /// that rely on C extensions, such as the [pandas](http://pandas.pydata.org/)
  /// Python data analysis library, are not yet supported.
  ///
  /// [extraJarsS3Path]: The path to one or more Java `.jar` files in an S3
  /// bucket that should be loaded in your `DevEndpoint`.
  ///
  /// [securityConfiguration]: The name of the `SecurityConfiguration` structure
  /// to be used with this `DevEndpoint`.
  ///
  /// [tags]: The tags to use with this DevEndpoint. You may use tags to limit
  /// access to the DevEndpoint. For more information about tags in AWS Glue,
  /// see [AWS Tags in AWS
  /// Glue](https://docs.aws.amazon.com/glue/latest/dg/monitor-tags.html) in the
  /// developer guide.
  ///
  /// [arguments]: A map of arguments used to configure the `DevEndpoint`.
  Future<CreateDevEndpointResponse> createDevEndpoint(
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
      Map<String, String> arguments}) async {
    return CreateDevEndpointResponse.fromJson({});
  }

  /// Creates a new job definition.
  ///
  /// [name]: The name you assign to this job definition. It must be unique in
  /// your account.
  ///
  /// [description]: Description of the job being defined.
  ///
  /// [logUri]: This field is reserved for future use.
  ///
  /// [role]: The name or Amazon Resource Name (ARN) of the IAM role associated
  /// with this job.
  ///
  /// [executionProperty]: An `ExecutionProperty` specifying the maximum number
  /// of concurrent runs allowed for this job.
  ///
  /// [command]: The `JobCommand` that executes this job.
  ///
  /// [defaultArguments]: The default arguments for this job.
  ///
  /// You can specify arguments here that your own job-execution script
  /// consumes, as well as arguments that AWS Glue itself consumes.
  ///
  /// For information about how to specify and consume your own Job arguments,
  /// see the [Calling AWS Glue APIs in
  /// Python](https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-python-calling.html)
  /// topic in the developer guide.
  ///
  /// For information about the key-value pairs that AWS Glue consumes to set up
  /// your job, see the [Special Parameters Used by AWS
  /// Glue](https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-etl-glue-arguments.html)
  /// topic in the developer guide.
  ///
  /// [connections]: The connections used for this job.
  ///
  /// [maxRetries]: The maximum number of times to retry this job if it fails.
  ///
  /// [allocatedCapacity]: This parameter is deprecated. Use `MaxCapacity`
  /// instead.
  ///
  /// The number of AWS Glue data processing units (DPUs) to allocate to this
  /// Job. You can allocate from 2 to 100 DPUs; the default is 10. A DPU is a
  /// relative measure of processing power that consists of 4 vCPUs of compute
  /// capacity and 16 GB of memory. For more information, see the [AWS Glue
  /// pricing page](https://aws.amazon.com/glue/pricing/).
  ///
  /// [timeout]: The job timeout in minutes. This is the maximum time that a job
  /// run can consume resources before it is terminated and enters `TIMEOUT`
  /// status. The default is 2,880 minutes (48 hours).
  ///
  /// [maxCapacity]: The number of AWS Glue data processing units (DPUs) that
  /// can be allocated when this job runs. A DPU is a relative measure of
  /// processing power that consists of 4 vCPUs of compute capacity and 16 GB of
  /// memory. For more information, see the [AWS Glue pricing
  /// page](https://aws.amazon.com/glue/pricing/).
  ///
  /// Do not set `Max Capacity` if using `WorkerType` and `NumberOfWorkers`.
  ///
  /// The value that can be allocated for `MaxCapacity` depends on whether you
  /// are running a Python shell job or an Apache Spark ETL job:
  ///
  /// *   When you specify a Python shell job (`JobCommand.Name`="pythonshell"),
  /// you can allocate either 0.0625 or 1 DPU. The default is 0.0625 DPU.
  ///
  /// *   When you specify an Apache Spark ETL job
  /// (`JobCommand.Name`="glueetl"), you can allocate from 2 to 100 DPUs. The
  /// default is 10 DPUs. This job type cannot have a fractional DPU allocation.
  ///
  /// [securityConfiguration]: The name of the `SecurityConfiguration` structure
  /// to be used with this job.
  ///
  /// [tags]: The tags to use with this job. You may use tags to limit access to
  /// the job. For more information about tags in AWS Glue, see [AWS Tags in AWS
  /// Glue](https://docs.aws.amazon.com/glue/latest/dg/monitor-tags.html) in the
  /// developer guide.
  ///
  /// [notificationProperty]: Specifies configuration properties of a job
  /// notification.
  ///
  /// [glueVersion]: Glue version determines the versions of Apache Spark and
  /// Python that AWS Glue supports. The Python version indicates the version
  /// supported for jobs of type Spark.
  ///
  /// For more information about the available AWS Glue versions and
  /// corresponding Spark and Python versions, see [Glue
  /// version](https://docs.aws.amazon.com/glue/latest/dg/add-job.html) in the
  /// developer guide.
  ///
  /// Jobs that are created without specifying a Glue version default to Glue
  /// 0.9.
  ///
  /// [numberOfWorkers]: The number of workers of a defined `workerType` that
  /// are allocated when a job runs.
  ///
  /// The maximum number of workers you can define are 299 for `G.1X`, and 149
  /// for `G.2X`.
  ///
  /// [workerType]: The type of predefined worker that is allocated when a job
  /// runs. Accepts a value of Standard, G.1X, or G.2X.
  ///
  /// *   For the `Standard` worker type, each worker provides 4 vCPU, 16 GB of
  /// memory and a 50GB disk, and 2 executors per worker.
  ///
  /// *   For the `G.1X` worker type, each worker maps to 1 DPU (4 vCPU, 16 GB
  /// of memory, 64 GB disk), and provides 1 executor per worker. We recommend
  /// this worker type for memory-intensive jobs.
  ///
  /// *   For the `G.2X` worker type, each worker maps to 2 DPU (8 vCPU, 32 GB
  /// of memory, 128 GB disk), and provides 1 executor per worker. We recommend
  /// this worker type for memory-intensive jobs.
  Future<CreateJobResponse> createJob(
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
      String workerType}) async {
    return CreateJobResponse.fromJson({});
  }

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
  ///
  /// [name]: The unique name that you give the transform when you create it.
  ///
  /// [description]: A description of the machine learning transform that is
  /// being defined. The default is an empty string.
  ///
  /// [inputRecordTables]: A list of AWS Glue table definitions used by the
  /// transform.
  ///
  /// [parameters]: The algorithmic parameters that are specific to the
  /// transform type used. Conditionally dependent on the transform type.
  ///
  /// [role]: The name or Amazon Resource Name (ARN) of the IAM role with the
  /// required permissions. Ensure that this role has permission to your Amazon
  /// Simple Storage Service (Amazon S3) sources, targets, temporary directory,
  /// scripts, and any libraries that are used by the task run for this
  /// transform.
  ///
  /// [maxCapacity]: The number of AWS Glue data processing units (DPUs) that
  /// are allocated to task runs for this transform. You can allocate from 2 to
  /// 100 DPUs; the default is 10. A DPU is a relative measure of processing
  /// power that consists of 4 vCPUs of compute capacity and 16 GB of memory.
  /// For more information, see the [AWS Glue pricing
  /// page](https://aws.amazon.com/glue/pricing/).
  ///
  /// When the `WorkerType` field is set to a value other than `Standard`, the
  /// `MaxCapacity` field is set automatically and becomes read-only.
  ///
  /// [workerType]: The type of predefined worker that is allocated when this
  /// task runs. Accepts a value of Standard, G.1X, or G.2X.
  ///
  /// *   For the `Standard` worker type, each worker provides 4 vCPU, 16 GB of
  /// memory and a 50GB disk, and 2 executors per worker.
  ///
  /// *   For the `G.1X` worker type, each worker provides 4 vCPU, 16 GB of
  /// memory and a 64GB disk, and 1 executor per worker.
  ///
  /// *   For the `G.2X` worker type, each worker provides 8 vCPU, 32 GB of
  /// memory and a 128GB disk, and 1 executor per worker.
  ///
  /// [numberOfWorkers]: The number of workers of a defined `workerType` that
  /// are allocated when this task runs.
  ///
  /// [timeout]: The timeout of the task run for this transform in minutes. This
  /// is the maximum time that a task run for this transform can consume
  /// resources before it is terminated and enters `TIMEOUT` status. The default
  /// is 2,880 minutes (48 hours).
  ///
  /// [maxRetries]: The maximum number of times to retry a task for this
  /// transform after a task run fails.
  Future<CreateMLTransformResponse> createMLTransform(
      {@required String name,
      String description,
      @required List<GlueTable> inputRecordTables,
      @required TransformParameters parameters,
      @required String role,
      double maxCapacity,
      String workerType,
      int numberOfWorkers,
      int timeout,
      int maxRetries}) async {
    return CreateMLTransformResponse.fromJson({});
  }

  /// Creates a new partition.
  ///
  /// [catalogId]: The AWS account ID of the catalog in which the partition is
  /// to be created.
  ///
  /// [databaseName]: The name of the metadata database in which the partition
  /// is to be created.
  ///
  /// [tableName]: The name of the metadata table in which the partition is to
  /// be created.
  ///
  /// [partitionInput]: A `PartitionInput` structure defining the partition to
  /// be created.
  Future<CreatePartitionResponse> createPartition(
      {String catalogId,
      @required String databaseName,
      @required String tableName,
      @required PartitionInput partitionInput}) async {
    return CreatePartitionResponse.fromJson({});
  }

  /// Transforms a directed acyclic graph (DAG) into code.
  ///
  /// [dagNodes]: A list of the nodes in the DAG.
  ///
  /// [dagEdges]: A list of the edges in the DAG.
  ///
  /// [language]: The programming language of the resulting code from the DAG.
  Future<CreateScriptResponse> createScript(
      {List<CodeGenNode> dagNodes,
      List<CodeGenEdge> dagEdges,
      String language}) async {
    return CreateScriptResponse.fromJson({});
  }

  /// Creates a new security configuration. A security configuration is a set of
  /// security properties that can be used by AWS Glue. You can use a security
  /// configuration to encrypt data at rest. For information about using
  /// security configurations in AWS Glue, see [Encrypting Data Written by
  /// Crawlers, Jobs, and Development
  /// Endpoints](https://docs.aws.amazon.com/glue/latest/dg/encryption-security-configuration.html).
  ///
  /// [name]: The name for the new security configuration.
  ///
  /// [encryptionConfiguration]: The encryption configuration for the new
  /// security configuration.
  Future<CreateSecurityConfigurationResponse> createSecurityConfiguration(
      {@required String name,
      @required EncryptionConfiguration encryptionConfiguration}) async {
    return CreateSecurityConfigurationResponse.fromJson({});
  }

  /// Creates a new table definition in the Data Catalog.
  ///
  /// [catalogId]: The ID of the Data Catalog in which to create the `Table`. If
  /// none is supplied, the AWS account ID is used by default.
  ///
  /// [databaseName]: The catalog database in which to create the new table. For
  /// Hive compatibility, this name is entirely lowercase.
  ///
  /// [tableInput]: The `TableInput` object that defines the metadata table to
  /// create in the catalog.
  Future<CreateTableResponse> createTable(
      {String catalogId,
      @required String databaseName,
      @required TableInput tableInput}) async {
    return CreateTableResponse.fromJson({});
  }

  /// Creates a new trigger.
  ///
  /// [name]: The name of the trigger.
  ///
  /// [workflowName]: The name of the workflow associated with the trigger.
  ///
  /// [type]: The type of the new trigger.
  ///
  /// [schedule]: A `cron` expression used to specify the schedule (see
  /// [Time-Based Schedules for Jobs and
  /// Crawlers](https://docs.aws.amazon.com/glue/latest/dg/monitor-data-warehouse-schedule.html).
  /// For example, to run something every day at 12:15 UTC, you would specify:
  /// `cron(15 12 * * ? *)`.
  ///
  /// This field is required when the trigger type is SCHEDULED.
  ///
  /// [predicate]: A predicate to specify when the new trigger should fire.
  ///
  /// This field is required when the trigger type is `CONDITIONAL`.
  ///
  /// [actions]: The actions initiated by this trigger when it fires.
  ///
  /// [description]: A description of the new trigger.
  ///
  /// [startOnCreation]: Set to `true` to start `SCHEDULED` and `CONDITIONAL`
  /// triggers when created. True is not supported for `ON_DEMAND` triggers.
  ///
  /// [tags]: The tags to use with this trigger. You may use tags to limit
  /// access to the trigger. For more information about tags in AWS Glue, see
  /// [AWS Tags in AWS
  /// Glue](https://docs.aws.amazon.com/glue/latest/dg/monitor-tags.html) in the
  /// developer guide.
  Future<CreateTriggerResponse> createTrigger(
      {@required String name,
      String workflowName,
      @required String type,
      String schedule,
      Predicate predicate,
      @required List<Action> actions,
      String description,
      bool startOnCreation,
      Map<String, String> tags}) async {
    return CreateTriggerResponse.fromJson({});
  }

  /// Creates a new function definition in the Data Catalog.
  ///
  /// [catalogId]: The ID of the Data Catalog in which to create the function.
  /// If none is provided, the AWS account ID is used by default.
  ///
  /// [databaseName]: The name of the catalog database in which to create the
  /// function.
  ///
  /// [functionInput]: A `FunctionInput` object that defines the function to
  /// create in the Data Catalog.
  Future<CreateUserDefinedFunctionResponse> createUserDefinedFunction(
      {String catalogId,
      @required String databaseName,
      @required UserDefinedFunctionInput functionInput}) async {
    return CreateUserDefinedFunctionResponse.fromJson({});
  }

  /// Creates a new workflow.
  ///
  /// [name]: The name to be assigned to the workflow. It should be unique
  /// within your account.
  ///
  /// [description]: A description of the workflow.
  ///
  /// [defaultRunProperties]: A collection of properties to be used as part of
  /// each execution of the workflow.
  ///
  /// [tags]: The tags to be used with this workflow.
  Future<CreateWorkflowResponse> createWorkflow(String name,
      {String description,
      Map<String, String> defaultRunProperties,
      Map<String, String> tags}) async {
    return CreateWorkflowResponse.fromJson({});
  }

  /// Removes a classifier from the Data Catalog.
  ///
  /// [name]: Name of the classifier to remove.
  Future<DeleteClassifierResponse> deleteClassifier(String name) async {
    return DeleteClassifierResponse.fromJson({});
  }

  /// Deletes a connection from the Data Catalog.
  ///
  /// [catalogId]: The ID of the Data Catalog in which the connection resides.
  /// If none is provided, the AWS account ID is used by default.
  ///
  /// [connectionName]: The name of the connection to delete.
  Future<DeleteConnectionResponse> deleteConnection(String connectionName,
      {String catalogId}) async {
    return DeleteConnectionResponse.fromJson({});
  }

  /// Removes a specified crawler from the AWS Glue Data Catalog, unless the
  /// crawler state is `RUNNING`.
  ///
  /// [name]: The name of the crawler to remove.
  Future<DeleteCrawlerResponse> deleteCrawler(String name) async {
    return DeleteCrawlerResponse.fromJson({});
  }

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
  ///
  /// [catalogId]: The ID of the Data Catalog in which the database resides. If
  /// none is provided, the AWS account ID is used by default.
  ///
  /// [name]: The name of the database to delete. For Hive compatibility, this
  /// must be all lowercase.
  Future<DeleteDatabaseResponse> deleteDatabase(String name,
      {String catalogId}) async {
    return DeleteDatabaseResponse.fromJson({});
  }

  /// Deletes a specified development endpoint.
  ///
  /// [endpointName]: The name of the `DevEndpoint`.
  Future<DeleteDevEndpointResponse> deleteDevEndpoint(
      String endpointName) async {
    return DeleteDevEndpointResponse.fromJson({});
  }

  /// Deletes a specified job definition. If the job definition is not found, no
  /// exception is thrown.
  ///
  /// [jobName]: The name of the job definition to delete.
  Future<DeleteJobResponse> deleteJob(String jobName) async {
    return DeleteJobResponse.fromJson({});
  }

  /// Deletes an AWS Glue machine learning transform. Machine learning
  /// transforms are a special type of transform that use machine learning to
  /// learn the details of the transformation to be performed by learning from
  /// examples provided by humans. These transformations are then saved by AWS
  /// Glue. If you no longer need a transform, you can delete it by calling
  /// `DeleteMLTransforms`. However, any AWS Glue jobs that still reference the
  /// deleted transform will no longer succeed.
  ///
  /// [transformId]: The unique identifier of the transform to delete.
  Future<DeleteMLTransformResponse> deleteMLTransform(
      String transformId) async {
    return DeleteMLTransformResponse.fromJson({});
  }

  /// Deletes a specified partition.
  ///
  /// [catalogId]: The ID of the Data Catalog where the partition to be deleted
  /// resides. If none is provided, the AWS account ID is used by default.
  ///
  /// [databaseName]: The name of the catalog database in which the table in
  /// question resides.
  ///
  /// [tableName]: The name of the table that contains the partition to be
  /// deleted.
  ///
  /// [partitionValues]: The values that define the partition.
  Future<DeletePartitionResponse> deletePartition(
      {String catalogId,
      @required String databaseName,
      @required String tableName,
      @required List<String> partitionValues}) async {
    return DeletePartitionResponse.fromJson({});
  }

  /// Deletes a specified policy.
  ///
  /// [policyHashCondition]: The hash value returned when this policy was set.
  Future<DeleteResourcePolicyResponse> deleteResourcePolicy(
      {String policyHashCondition}) async {
    return DeleteResourcePolicyResponse.fromJson({});
  }

  /// Deletes a specified security configuration.
  ///
  /// [name]: The name of the security configuration to delete.
  Future<DeleteSecurityConfigurationResponse> deleteSecurityConfiguration(
      String name) async {
    return DeleteSecurityConfigurationResponse.fromJson({});
  }

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
  ///
  /// [catalogId]: The ID of the Data Catalog where the table resides. If none
  /// is provided, the AWS account ID is used by default.
  ///
  /// [databaseName]: The name of the catalog database in which the table
  /// resides. For Hive compatibility, this name is entirely lowercase.
  ///
  /// [name]: The name of the table to be deleted. For Hive compatibility, this
  /// name is entirely lowercase.
  Future<DeleteTableResponse> deleteTable(
      {String catalogId,
      @required String databaseName,
      @required String name}) async {
    return DeleteTableResponse.fromJson({});
  }

  /// Deletes a specified version of a table.
  ///
  /// [catalogId]: The ID of the Data Catalog where the tables reside. If none
  /// is provided, the AWS account ID is used by default.
  ///
  /// [databaseName]: The database in the catalog in which the table resides.
  /// For Hive compatibility, this name is entirely lowercase.
  ///
  /// [tableName]: The name of the table. For Hive compatibility, this name is
  /// entirely lowercase.
  ///
  /// [versionId]: The ID of the table version to be deleted. A `VersionID` is a
  /// string representation of an integer. Each version is incremented by 1.
  Future<DeleteTableVersionResponse> deleteTableVersion(
      {String catalogId,
      @required String databaseName,
      @required String tableName,
      @required String versionId}) async {
    return DeleteTableVersionResponse.fromJson({});
  }

  /// Deletes a specified trigger. If the trigger is not found, no exception is
  /// thrown.
  ///
  /// [name]: The name of the trigger to delete.
  Future<DeleteTriggerResponse> deleteTrigger(String name) async {
    return DeleteTriggerResponse.fromJson({});
  }

  /// Deletes an existing function definition from the Data Catalog.
  ///
  /// [catalogId]: The ID of the Data Catalog where the function to be deleted
  /// is located. If none is supplied, the AWS account ID is used by default.
  ///
  /// [databaseName]: The name of the catalog database where the function is
  /// located.
  ///
  /// [functionName]: The name of the function definition to be deleted.
  Future<DeleteUserDefinedFunctionResponse> deleteUserDefinedFunction(
      {String catalogId,
      @required String databaseName,
      @required String functionName}) async {
    return DeleteUserDefinedFunctionResponse.fromJson({});
  }

  /// Deletes a workflow.
  ///
  /// [name]: Name of the workflow to be deleted.
  Future<DeleteWorkflowResponse> deleteWorkflow(String name) async {
    return DeleteWorkflowResponse.fromJson({});
  }

  /// Retrieves the status of a migration operation.
  ///
  /// [catalogId]: The ID of the catalog to migrate. Currently, this should be
  /// the AWS account ID.
  Future<GetCatalogImportStatusResponse> getCatalogImportStatus(
      {String catalogId}) async {
    return GetCatalogImportStatusResponse.fromJson({});
  }

  /// Retrieve a classifier by name.
  ///
  /// [name]: Name of the classifier to retrieve.
  Future<GetClassifierResponse> getClassifier(String name) async {
    return GetClassifierResponse.fromJson({});
  }

  /// Lists all classifier objects in the Data Catalog.
  ///
  /// [maxResults]: The size of the list to return (optional).
  ///
  /// [nextToken]: An optional continuation token.
  Future<GetClassifiersResponse> getClassifiers(
      {int maxResults, String nextToken}) async {
    return GetClassifiersResponse.fromJson({});
  }

  /// Retrieves a connection definition from the Data Catalog.
  ///
  /// [catalogId]: The ID of the Data Catalog in which the connection resides.
  /// If none is provided, the AWS account ID is used by default.
  ///
  /// [name]: The name of the connection definition to retrieve.
  ///
  /// [hidePassword]: Allows you to retrieve the connection metadata without
  /// returning the password. For instance, the AWS Glue console uses this flag
  /// to retrieve the connection, and does not display the password. Set this
  /// parameter when the caller might not have permission to use the AWS KMS key
  /// to decrypt the password, but it does have permission to access the rest of
  /// the connection properties.
  Future<GetConnectionResponse> getConnection(String name,
      {String catalogId, bool hidePassword}) async {
    return GetConnectionResponse.fromJson({});
  }

  /// Retrieves a list of connection definitions from the Data Catalog.
  ///
  /// [catalogId]: The ID of the Data Catalog in which the connections reside.
  /// If none is provided, the AWS account ID is used by default.
  ///
  /// [filter]: A filter that controls which connections are returned.
  ///
  /// [hidePassword]: Allows you to retrieve the connection metadata without
  /// returning the password. For instance, the AWS Glue console uses this flag
  /// to retrieve the connection, and does not display the password. Set this
  /// parameter when the caller might not have permission to use the AWS KMS key
  /// to decrypt the password, but it does have permission to access the rest of
  /// the connection properties.
  ///
  /// [nextToken]: A continuation token, if this is a continuation call.
  ///
  /// [maxResults]: The maximum number of connections to return in one response.
  Future<GetConnectionsResponse> getConnections(
      {String catalogId,
      GetConnectionsFilter filter,
      bool hidePassword,
      String nextToken,
      int maxResults}) async {
    return GetConnectionsResponse.fromJson({});
  }

  /// Retrieves metadata for a specified crawler.
  ///
  /// [name]: The name of the crawler to retrieve metadata for.
  Future<GetCrawlerResponse> getCrawler(String name) async {
    return GetCrawlerResponse.fromJson({});
  }

  /// Retrieves metrics about specified crawlers.
  ///
  /// [crawlerNameList]: A list of the names of crawlers about which to retrieve
  /// metrics.
  ///
  /// [maxResults]: The maximum size of a list to return.
  ///
  /// [nextToken]: A continuation token, if this is a continuation call.
  Future<GetCrawlerMetricsResponse> getCrawlerMetrics(
      {List<String> crawlerNameList, int maxResults, String nextToken}) async {
    return GetCrawlerMetricsResponse.fromJson({});
  }

  /// Retrieves metadata for all crawlers defined in the customer account.
  ///
  /// [maxResults]: The number of crawlers to return on each call.
  ///
  /// [nextToken]: A continuation token, if this is a continuation request.
  Future<GetCrawlersResponse> getCrawlers(
      {int maxResults, String nextToken}) async {
    return GetCrawlersResponse.fromJson({});
  }

  /// Retrieves the security configuration for a specified catalog.
  ///
  /// [catalogId]: The ID of the Data Catalog to retrieve the security
  /// configuration for. If none is provided, the AWS account ID is used by
  /// default.
  Future<GetDataCatalogEncryptionSettingsResponse>
      getDataCatalogEncryptionSettings({String catalogId}) async {
    return GetDataCatalogEncryptionSettingsResponse.fromJson({});
  }

  /// Retrieves the definition of a specified database.
  ///
  /// [catalogId]: The ID of the Data Catalog in which the database resides. If
  /// none is provided, the AWS account ID is used by default.
  ///
  /// [name]: The name of the database to retrieve. For Hive compatibility, this
  /// should be all lowercase.
  Future<GetDatabaseResponse> getDatabase(String name,
      {String catalogId}) async {
    return GetDatabaseResponse.fromJson({});
  }

  /// Retrieves all databases defined in a given Data Catalog.
  ///
  /// [catalogId]: The ID of the Data Catalog from which to retrieve
  /// `Databases`. If none is provided, the AWS account ID is used by default.
  ///
  /// [nextToken]: A continuation token, if this is a continuation call.
  ///
  /// [maxResults]: The maximum number of databases to return in one response.
  Future<GetDatabasesResponse> getDatabases(
      {String catalogId, String nextToken, int maxResults}) async {
    return GetDatabasesResponse.fromJson({});
  }

  /// Transforms a Python script into a directed acyclic graph (DAG).
  ///
  /// [pythonScript]: The Python script to transform.
  Future<GetDataflowGraphResponse> getDataflowGraph(
      {String pythonScript}) async {
    return GetDataflowGraphResponse.fromJson({});
  }

  /// Retrieves information about a specified development endpoint.
  ///
  ///
  ///
  /// When you create a development endpoint in a virtual private cloud (VPC),
  /// AWS Glue returns only a private IP address, and the public IP address
  /// field is not populated. When you create a non-VPC development endpoint,
  /// AWS Glue returns only a public IP address.
  ///
  /// [endpointName]: Name of the `DevEndpoint` to retrieve information for.
  Future<GetDevEndpointResponse> getDevEndpoint(String endpointName) async {
    return GetDevEndpointResponse.fromJson({});
  }

  /// Retrieves all the development endpoints in this AWS account.
  ///
  ///
  ///
  /// When you create a development endpoint in a virtual private cloud (VPC),
  /// AWS Glue returns only a private IP address and the public IP address field
  /// is not populated. When you create a non-VPC development endpoint, AWS Glue
  /// returns only a public IP address.
  ///
  /// [maxResults]: The maximum size of information to return.
  ///
  /// [nextToken]: A continuation token, if this is a continuation call.
  Future<GetDevEndpointsResponse> getDevEndpoints(
      {int maxResults, String nextToken}) async {
    return GetDevEndpointsResponse.fromJson({});
  }

  /// Retrieves an existing job definition.
  ///
  /// [jobName]: The name of the job definition to retrieve.
  Future<GetJobResponse> getJob(String jobName) async {
    return GetJobResponse.fromJson({});
  }

  /// Returns information on a job bookmark entry.
  ///
  /// [jobName]: The name of the job in question.
  ///
  /// [runId]: The unique run identifier associated with this job run.
  Future<GetJobBookmarkResponse> getJobBookmark(String jobName,
      {String runId}) async {
    return GetJobBookmarkResponse.fromJson({});
  }

  /// Retrieves the metadata for a given job run.
  ///
  /// [jobName]: Name of the job definition being run.
  ///
  /// [runId]: The ID of the job run.
  ///
  /// [predecessorsIncluded]: True if a list of predecessor runs should be
  /// returned.
  Future<GetJobRunResponse> getJobRun(
      {@required String jobName,
      @required String runId,
      bool predecessorsIncluded}) async {
    return GetJobRunResponse.fromJson({});
  }

  /// Retrieves metadata for all runs of a given job definition.
  ///
  /// [jobName]: The name of the job definition for which to retrieve all job
  /// runs.
  ///
  /// [nextToken]: A continuation token, if this is a continuation call.
  ///
  /// [maxResults]: The maximum size of the response.
  Future<GetJobRunsResponse> getJobRuns(String jobName,
      {String nextToken, int maxResults}) async {
    return GetJobRunsResponse.fromJson({});
  }

  /// Retrieves all current job definitions.
  ///
  /// [nextToken]: A continuation token, if this is a continuation call.
  ///
  /// [maxResults]: The maximum size of the response.
  Future<GetJobsResponse> getJobs({String nextToken, int maxResults}) async {
    return GetJobsResponse.fromJson({});
  }

  /// Gets details for a specific task run on a machine learning transform.
  /// Machine learning task runs are asynchronous tasks that AWS Glue runs on
  /// your behalf as part of various machine learning workflows. You can check
  /// the stats of any task run by calling `GetMLTaskRun` with the `TaskRunID`
  /// and its parent transform's `TransformID`.
  ///
  /// [transformId]: The unique identifier of the machine learning transform.
  ///
  /// [taskRunId]: The unique identifier of the task run.
  Future<GetMLTaskRunResponse> getMLTaskRun(
      {@required String transformId, @required String taskRunId}) async {
    return GetMLTaskRunResponse.fromJson({});
  }

  /// Gets a list of runs for a machine learning transform. Machine learning
  /// task runs are asynchronous tasks that AWS Glue runs on your behalf as part
  /// of various machine learning workflows. You can get a sortable, filterable
  /// list of machine learning task runs by calling `GetMLTaskRuns` with their
  /// parent transform's `TransformID` and other optional parameters as
  /// documented in this section.
  ///
  /// This operation returns a list of historic runs and must be paginated.
  ///
  /// [transformId]: The unique identifier of the machine learning transform.
  ///
  /// [nextToken]: A token for pagination of the results. The default is empty.
  ///
  /// [maxResults]: The maximum number of results to return.
  ///
  /// [filter]: The filter criteria, in the `TaskRunFilterCriteria` structure,
  /// for the task run.
  ///
  /// [sort]: The sorting criteria, in the `TaskRunSortCriteria` structure, for
  /// the task run.
  Future<GetMLTaskRunsResponse> getMLTaskRuns(String transformId,
      {String nextToken,
      int maxResults,
      TaskRunFilterCriteria filter,
      TaskRunSortCriteria sort}) async {
    return GetMLTaskRunsResponse.fromJson({});
  }

  /// Gets an AWS Glue machine learning transform artifact and all its
  /// corresponding metadata. Machine learning transforms are a special type of
  /// transform that use machine learning to learn the details of the
  /// transformation to be performed by learning from examples provided by
  /// humans. These transformations are then saved by AWS Glue. You can retrieve
  /// their metadata by calling `GetMLTransform`.
  ///
  /// [transformId]: The unique identifier of the transform, generated at the
  /// time that the transform was created.
  Future<GetMLTransformResponse> getMLTransform(String transformId) async {
    return GetMLTransformResponse.fromJson({});
  }

  /// Gets a sortable, filterable list of existing AWS Glue machine learning
  /// transforms. Machine learning transforms are a special type of transform
  /// that use machine learning to learn the details of the transformation to be
  /// performed by learning from examples provided by humans. These
  /// transformations are then saved by AWS Glue, and you can retrieve their
  /// metadata by calling `GetMLTransforms`.
  ///
  /// [nextToken]: A paginated token to offset the results.
  ///
  /// [maxResults]: The maximum number of results to return.
  ///
  /// [filter]: The filter transformation criteria.
  ///
  /// [sort]: The sorting criteria.
  Future<GetMLTransformsResponse> getMLTransforms(
      {String nextToken,
      int maxResults,
      TransformFilterCriteria filter,
      TransformSortCriteria sort}) async {
    return GetMLTransformsResponse.fromJson({});
  }

  /// Creates mappings.
  ///
  /// [source]: Specifies the source table.
  ///
  /// [sinks]: A list of target tables.
  ///
  /// [location]: Parameters for the mapping.
  Future<GetMappingResponse> getMapping(CatalogEntry source,
      {List<CatalogEntry> sinks, Location location}) async {
    return GetMappingResponse.fromJson({});
  }

  /// Retrieves information about a specified partition.
  ///
  /// [catalogId]: The ID of the Data Catalog where the partition in question
  /// resides. If none is provided, the AWS account ID is used by default.
  ///
  /// [databaseName]: The name of the catalog database where the partition
  /// resides.
  ///
  /// [tableName]: The name of the partition's table.
  ///
  /// [partitionValues]: The values that define the partition.
  Future<GetPartitionResponse> getPartition(
      {String catalogId,
      @required String databaseName,
      @required String tableName,
      @required List<String> partitionValues}) async {
    return GetPartitionResponse.fromJson({});
  }

  /// Retrieves information about the partitions in a table.
  ///
  /// [catalogId]: The ID of the Data Catalog where the partitions in question
  /// reside. If none is provided, the AWS account ID is used by default.
  ///
  /// [databaseName]: The name of the catalog database where the partitions
  /// reside.
  ///
  /// [tableName]: The name of the partitions' table.
  ///
  /// [expression]: An expression that filters the partitions to be returned.
  ///
  /// The expression uses SQL syntax similar to the SQL `WHERE` filter clause.
  /// The SQL statement parser
  /// [JSQLParser](http://jsqlparser.sourceforge.net/home.php) parses the
  /// expression.
  ///
  ///  _Operators_: The following are the operators that you can use in the
  /// `Expression` API call:
  ///
  /// =
  ///
  /// Checks whether the values of the two operands are equal; if yes, then the
  /// condition becomes true.
  ///
  /// Example: Assume 'variable a' holds 10 and 'variable b' holds 20.
  ///
  /// (a = b) is not true.
  ///
  /// < >
  ///
  /// Checks whether the values of two operands are equal; if the values are not
  /// equal, then the condition becomes true.
  ///
  /// Example: (a < > b) is true.
  ///
  /// >
  ///
  /// Checks whether the value of the left operand is greater than the value of
  /// the right operand; if yes, then the condition becomes true.
  ///
  /// Example: (a > b) is not true.
  ///
  /// <
  ///
  /// Checks whether the value of the left operand is less than the value of the
  /// right operand; if yes, then the condition becomes true.
  ///
  /// Example: (a < b) is true.
  ///
  /// >=
  ///
  /// Checks whether the value of the left operand is greater than or equal to
  /// the value of the right operand; if yes, then the condition becomes true.
  ///
  /// Example: (a >= b) is not true.
  ///
  /// <=
  ///
  /// Checks whether the value of the left operand is less than or equal to the
  /// value of the right operand; if yes, then the condition becomes true.
  ///
  /// Example: (a <= b) is true.
  ///
  /// AND, OR, IN, BETWEEN, LIKE, NOT, IS NULL
  ///
  /// Logical operators.
  ///
  ///  _Supported Partition Key Types_: The following are the supported
  /// partition keys.
  ///
  /// *    `string`
  ///
  /// *    `date`
  ///
  /// *    `timestamp`
  ///
  /// *    `int`
  ///
  /// *    `bigint`
  ///
  /// *    `long`
  ///
  /// *    `tinyint`
  ///
  /// *    `smallint`
  ///
  /// *    `decimal`
  ///
  ///
  /// If an invalid type is encountered, an exception is thrown.
  ///
  /// The following list shows the valid operators on each type. When you define
  /// a crawler, the `partitionKey` type is created as a `STRING`, to be
  /// compatible with the catalog partitions.
  ///
  ///  _Sample API Call_:
  ///
  /// [nextToken]: A continuation token, if this is not the first call to
  /// retrieve these partitions.
  ///
  /// [segment]: The segment of the table's partitions to scan in this request.
  ///
  /// [maxResults]: The maximum number of partitions to return in a single
  /// response.
  Future<GetPartitionsResponse> getPartitions(
      {String catalogId,
      @required String databaseName,
      @required String tableName,
      String expression,
      String nextToken,
      Segment segment,
      int maxResults}) async {
    return GetPartitionsResponse.fromJson({});
  }

  /// Gets code to perform a specified mapping.
  ///
  /// [mapping]: The list of mappings from a source table to target tables.
  ///
  /// [source]: The source table.
  ///
  /// [sinks]: The target tables.
  ///
  /// [location]: The parameters for the mapping.
  ///
  /// [language]: The programming language of the code to perform the mapping.
  Future<GetPlanResponse> getPlan(
      {@required List<MappingEntry> mapping,
      @required CatalogEntry source,
      List<CatalogEntry> sinks,
      Location location,
      String language}) async {
    return GetPlanResponse.fromJson({});
  }

  /// Retrieves a specified resource policy.
  Future<GetResourcePolicyResponse> getResourcePolicy() async {
    return GetResourcePolicyResponse.fromJson({});
  }

  /// Retrieves a specified security configuration.
  ///
  /// [name]: The name of the security configuration to retrieve.
  Future<GetSecurityConfigurationResponse> getSecurityConfiguration(
      String name) async {
    return GetSecurityConfigurationResponse.fromJson({});
  }

  /// Retrieves a list of all security configurations.
  ///
  /// [maxResults]: The maximum number of results to return.
  ///
  /// [nextToken]: A continuation token, if this is a continuation call.
  Future<GetSecurityConfigurationsResponse> getSecurityConfigurations(
      {int maxResults, String nextToken}) async {
    return GetSecurityConfigurationsResponse.fromJson({});
  }

  /// Retrieves the `Table` definition in a Data Catalog for a specified table.
  ///
  /// [catalogId]: The ID of the Data Catalog where the table resides. If none
  /// is provided, the AWS account ID is used by default.
  ///
  /// [databaseName]: The name of the database in the catalog in which the table
  /// resides. For Hive compatibility, this name is entirely lowercase.
  ///
  /// [name]: The name of the table for which to retrieve the definition. For
  /// Hive compatibility, this name is entirely lowercase.
  Future<GetTableResponse> getTable(
      {String catalogId,
      @required String databaseName,
      @required String name}) async {
    return GetTableResponse.fromJson({});
  }

  /// Retrieves a specified version of a table.
  ///
  /// [catalogId]: The ID of the Data Catalog where the tables reside. If none
  /// is provided, the AWS account ID is used by default.
  ///
  /// [databaseName]: The database in the catalog in which the table resides.
  /// For Hive compatibility, this name is entirely lowercase.
  ///
  /// [tableName]: The name of the table. For Hive compatibility, this name is
  /// entirely lowercase.
  ///
  /// [versionId]: The ID value of the table version to be retrieved. A
  /// `VersionID` is a string representation of an integer. Each version is
  /// incremented by 1.
  Future<GetTableVersionResponse> getTableVersion(
      {String catalogId,
      @required String databaseName,
      @required String tableName,
      String versionId}) async {
    return GetTableVersionResponse.fromJson({});
  }

  /// Retrieves a list of strings that identify available versions of a
  /// specified table.
  ///
  /// [catalogId]: The ID of the Data Catalog where the tables reside. If none
  /// is provided, the AWS account ID is used by default.
  ///
  /// [databaseName]: The database in the catalog in which the table resides.
  /// For Hive compatibility, this name is entirely lowercase.
  ///
  /// [tableName]: The name of the table. For Hive compatibility, this name is
  /// entirely lowercase.
  ///
  /// [nextToken]: A continuation token, if this is not the first call.
  ///
  /// [maxResults]: The maximum number of table versions to return in one
  /// response.
  Future<GetTableVersionsResponse> getTableVersions(
      {String catalogId,
      @required String databaseName,
      @required String tableName,
      String nextToken,
      int maxResults}) async {
    return GetTableVersionsResponse.fromJson({});
  }

  /// Retrieves the definitions of some or all of the tables in a given
  /// `Database`.
  ///
  /// [catalogId]: The ID of the Data Catalog where the tables reside. If none
  /// is provided, the AWS account ID is used by default.
  ///
  /// [databaseName]: The database in the catalog whose tables to list. For Hive
  /// compatibility, this name is entirely lowercase.
  ///
  /// [expression]: A regular expression pattern. If present, only those tables
  /// whose names match the pattern are returned.
  ///
  /// [nextToken]: A continuation token, included if this is a continuation
  /// call.
  ///
  /// [maxResults]: The maximum number of tables to return in a single response.
  Future<GetTablesResponse> getTables(String databaseName,
      {String catalogId,
      String expression,
      String nextToken,
      int maxResults}) async {
    return GetTablesResponse.fromJson({});
  }

  /// Retrieves a list of tags associated with a resource.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the resource for which to
  /// retrieve tags.
  Future<GetTagsResponse> getTags(String resourceArn) async {
    return GetTagsResponse.fromJson({});
  }

  /// Retrieves the definition of a trigger.
  ///
  /// [name]: The name of the trigger to retrieve.
  Future<GetTriggerResponse> getTrigger(String name) async {
    return GetTriggerResponse.fromJson({});
  }

  /// Gets all the triggers associated with a job.
  ///
  /// [nextToken]: A continuation token, if this is a continuation call.
  ///
  /// [dependentJobName]: The name of the job to retrieve triggers for. The
  /// trigger that can start this job is returned, and if there is no such
  /// trigger, all triggers are returned.
  ///
  /// [maxResults]: The maximum size of the response.
  Future<GetTriggersResponse> getTriggers(
      {String nextToken, String dependentJobName, int maxResults}) async {
    return GetTriggersResponse.fromJson({});
  }

  /// Retrieves a specified function definition from the Data Catalog.
  ///
  /// [catalogId]: The ID of the Data Catalog where the function to be retrieved
  /// is located. If none is provided, the AWS account ID is used by default.
  ///
  /// [databaseName]: The name of the catalog database where the function is
  /// located.
  ///
  /// [functionName]: The name of the function.
  Future<GetUserDefinedFunctionResponse> getUserDefinedFunction(
      {String catalogId,
      @required String databaseName,
      @required String functionName}) async {
    return GetUserDefinedFunctionResponse.fromJson({});
  }

  /// Retrieves multiple function definitions from the Data Catalog.
  ///
  /// [catalogId]: The ID of the Data Catalog where the functions to be
  /// retrieved are located. If none is provided, the AWS account ID is used by
  /// default.
  ///
  /// [databaseName]: The name of the catalog database where the functions are
  /// located.
  ///
  /// [pattern]: An optional function-name pattern string that filters the
  /// function definitions returned.
  ///
  /// [nextToken]: A continuation token, if this is a continuation call.
  ///
  /// [maxResults]: The maximum number of functions to return in one response.
  Future<GetUserDefinedFunctionsResponse> getUserDefinedFunctions(
      {String catalogId,
      @required String databaseName,
      @required String pattern,
      String nextToken,
      int maxResults}) async {
    return GetUserDefinedFunctionsResponse.fromJson({});
  }

  /// Retrieves resource metadata for a workflow.
  ///
  /// [name]: The name of the workflow to retrieve.
  ///
  /// [includeGraph]: Specifies whether to include a graph when returning the
  /// workflow resource metadata.
  Future<GetWorkflowResponse> getWorkflow(String name,
      {bool includeGraph}) async {
    return GetWorkflowResponse.fromJson({});
  }

  /// Retrieves the metadata for a given workflow run.
  ///
  /// [name]: Name of the workflow being run.
  ///
  /// [runId]: The ID of the workflow run.
  ///
  /// [includeGraph]: Specifies whether to include the workflow graph in
  /// response or not.
  Future<GetWorkflowRunResponse> getWorkflowRun(
      {@required String name,
      @required String runId,
      bool includeGraph}) async {
    return GetWorkflowRunResponse.fromJson({});
  }

  /// Retrieves the workflow run properties which were set during the run.
  ///
  /// [name]: Name of the workflow which was run.
  ///
  /// [runId]: The ID of the workflow run whose run properties should be
  /// returned.
  Future<GetWorkflowRunPropertiesResponse> getWorkflowRunProperties(
      {@required String name, @required String runId}) async {
    return GetWorkflowRunPropertiesResponse.fromJson({});
  }

  /// Retrieves metadata for all runs of a given workflow.
  ///
  /// [name]: Name of the workflow whose metadata of runs should be returned.
  ///
  /// [includeGraph]: Specifies whether to include the workflow graph in
  /// response or not.
  ///
  /// [nextToken]: The maximum size of the response.
  ///
  /// [maxResults]: The maximum number of workflow runs to be included in the
  /// response.
  Future<GetWorkflowRunsResponse> getWorkflowRuns(String name,
      {bool includeGraph, String nextToken, int maxResults}) async {
    return GetWorkflowRunsResponse.fromJson({});
  }

  /// Imports an existing Amazon Athena Data Catalog to AWS Glue
  ///
  /// [catalogId]: The ID of the catalog to import. Currently, this should be
  /// the AWS account ID.
  Future<ImportCatalogToGlueResponse> importCatalogToGlue(
      {String catalogId}) async {
    return ImportCatalogToGlueResponse.fromJson({});
  }

  /// Retrieves the names of all crawler resources in this AWS account, or the
  /// resources with the specified tag. This operation allows you to see which
  /// resources are available in your account, and their names.
  ///
  /// This operation takes the optional `Tags` field, which you can use as a
  /// filter on the response so that tagged resources can be retrieved as a
  /// group. If you choose to use tags filtering, only resources with the tag
  /// are retrieved.
  ///
  /// [maxResults]: The maximum size of a list to return.
  ///
  /// [nextToken]: A continuation token, if this is a continuation request.
  ///
  /// [tags]: Specifies to return only these tagged resources.
  Future<ListCrawlersResponse> listCrawlers(
      {int maxResults, String nextToken, Map<String, String> tags}) async {
    return ListCrawlersResponse.fromJson({});
  }

  /// Retrieves the names of all `DevEndpoint` resources in this AWS account, or
  /// the resources with the specified tag. This operation allows you to see
  /// which resources are available in your account, and their names.
  ///
  /// This operation takes the optional `Tags` field, which you can use as a
  /// filter on the response so that tagged resources can be retrieved as a
  /// group. If you choose to use tags filtering, only resources with the tag
  /// are retrieved.
  ///
  /// [nextToken]: A continuation token, if this is a continuation request.
  ///
  /// [maxResults]: The maximum size of a list to return.
  ///
  /// [tags]: Specifies to return only these tagged resources.
  Future<ListDevEndpointsResponse> listDevEndpoints(
      {String nextToken, int maxResults, Map<String, String> tags}) async {
    return ListDevEndpointsResponse.fromJson({});
  }

  /// Retrieves the names of all job resources in this AWS account, or the
  /// resources with the specified tag. This operation allows you to see which
  /// resources are available in your account, and their names.
  ///
  /// This operation takes the optional `Tags` field, which you can use as a
  /// filter on the response so that tagged resources can be retrieved as a
  /// group. If you choose to use tags filtering, only resources with the tag
  /// are retrieved.
  ///
  /// [nextToken]: A continuation token, if this is a continuation request.
  ///
  /// [maxResults]: The maximum size of a list to return.
  ///
  /// [tags]: Specifies to return only these tagged resources.
  Future<ListJobsResponse> listJobs(
      {String nextToken, int maxResults, Map<String, String> tags}) async {
    return ListJobsResponse.fromJson({});
  }

  /// Retrieves the names of all trigger resources in this AWS account, or the
  /// resources with the specified tag. This operation allows you to see which
  /// resources are available in your account, and their names.
  ///
  /// This operation takes the optional `Tags` field, which you can use as a
  /// filter on the response so that tagged resources can be retrieved as a
  /// group. If you choose to use tags filtering, only resources with the tag
  /// are retrieved.
  ///
  /// [nextToken]: A continuation token, if this is a continuation request.
  ///
  /// [dependentJobName]:  The name of the job for which to retrieve triggers.
  /// The trigger that can start this job is returned. If there is no such
  /// trigger, all triggers are returned.
  ///
  /// [maxResults]: The maximum size of a list to return.
  ///
  /// [tags]: Specifies to return only these tagged resources.
  Future<ListTriggersResponse> listTriggers(
      {String nextToken,
      String dependentJobName,
      int maxResults,
      Map<String, String> tags}) async {
    return ListTriggersResponse.fromJson({});
  }

  /// Lists names of workflows created in the account.
  ///
  /// [nextToken]: A continuation token, if this is a continuation request.
  ///
  /// [maxResults]: The maximum size of a list to return.
  Future<ListWorkflowsResponse> listWorkflows(
      {String nextToken, int maxResults}) async {
    return ListWorkflowsResponse.fromJson({});
  }

  /// Sets the security configuration for a specified catalog. After the
  /// configuration has been set, the specified encryption is applied to every
  /// catalog write thereafter.
  ///
  /// [catalogId]: The ID of the Data Catalog to set the security configuration
  /// for. If none is provided, the AWS account ID is used by default.
  ///
  /// [dataCatalogEncryptionSettings]: The security configuration to set.
  Future<PutDataCatalogEncryptionSettingsResponse>
      putDataCatalogEncryptionSettings(
          DataCatalogEncryptionSettings dataCatalogEncryptionSettings,
          {String catalogId}) async {
    return PutDataCatalogEncryptionSettingsResponse.fromJson({});
  }

  /// Sets the Data Catalog resource policy for access control.
  ///
  /// [policyInJson]: Contains the policy document to set, in JSON format.
  ///
  /// [policyHashCondition]: The hash value returned when the previous policy
  /// was set using `PutResourcePolicy`. Its purpose is to prevent concurrent
  /// modifications of a policy. Do not use this parameter if no previous policy
  /// has been set.
  ///
  /// [policyExistsCondition]: A value of `MUST_EXIST` is used to update a
  /// policy. A value of `NOT_EXIST` is used to create a new policy. If a value
  /// of `NONE` or a null value is used, the call will not depend on the
  /// existence of a policy.
  Future<PutResourcePolicyResponse> putResourcePolicy(String policyInJson,
      {String policyHashCondition, String policyExistsCondition}) async {
    return PutResourcePolicyResponse.fromJson({});
  }

  /// Puts the specified workflow run properties for the given workflow run. If
  /// a property already exists for the specified run, then it overrides the
  /// value otherwise adds the property to existing properties.
  ///
  /// [name]: Name of the workflow which was run.
  ///
  /// [runId]: The ID of the workflow run for which the run properties should be
  /// updated.
  ///
  /// [runProperties]: The properties to put for the specified run.
  Future<PutWorkflowRunPropertiesResponse> putWorkflowRunProperties(
      {@required String name,
      @required String runId,
      @required Map<String, String> runProperties}) async {
    return PutWorkflowRunPropertiesResponse.fromJson({});
  }

  /// Resets a bookmark entry.
  ///
  /// [jobName]: The name of the job in question.
  ///
  /// [runId]: The unique run identifier associated with this job run.
  Future<ResetJobBookmarkResponse> resetJobBookmark(String jobName,
      {String runId}) async {
    return ResetJobBookmarkResponse.fromJson({});
  }

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
  ///
  /// [catalogId]: A unique identifier, consisting of  `_account_id_/datalake`.
  ///
  /// [nextToken]: A continuation token, included if this is a continuation
  /// call.
  ///
  /// [filters]: A list of key-value pairs, and a comparator used to filter the
  /// search results. Returns all entities matching the predicate.
  ///
  /// [searchText]: A string used for a text search.
  ///
  /// Specifying a value in quotes filters based on an exact match to the value.
  ///
  /// [sortCriteria]: A list of criteria for sorting the results by a field
  /// name, in an ascending or descending order.
  ///
  /// [maxResults]: The maximum number of tables to return in a single response.
  Future<SearchTablesResponse> searchTables(
      {String catalogId,
      String nextToken,
      List<PropertyPredicate> filters,
      String searchText,
      List<SortCriterion> sortCriteria,
      int maxResults}) async {
    return SearchTablesResponse.fromJson({});
  }

  /// Starts a crawl using the specified crawler, regardless of what is
  /// scheduled. If the crawler is already running, returns a
  /// [CrawlerRunningException](https://docs.aws.amazon.com/glue/latest/dg/aws-glue-api-exceptions.html#aws-glue-api-exceptions-CrawlerRunningException).
  ///
  /// [name]: Name of the crawler to start.
  Future<StartCrawlerResponse> startCrawler(String name) async {
    return StartCrawlerResponse.fromJson({});
  }

  /// Changes the schedule state of the specified crawler to `SCHEDULED`, unless
  /// the crawler is already running or the schedule state is already
  /// `SCHEDULED`.
  ///
  /// [crawlerName]: Name of the crawler to schedule.
  Future<StartCrawlerScheduleResponse> startCrawlerSchedule(
      String crawlerName) async {
    return StartCrawlerScheduleResponse.fromJson({});
  }

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
  ///
  /// [transformId]: The unique identifier of the machine learning transform.
  ///
  /// [outputS3Path]: The Amazon S3 path where you export the labels.
  Future<StartExportLabelsTaskRunResponse> startExportLabelsTaskRun(
      {@required String transformId, @required String outputS3Path}) async {
    return StartExportLabelsTaskRunResponse.fromJson({});
  }

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
  ///
  /// [transformId]: The unique identifier of the machine learning transform.
  ///
  /// [inputS3Path]: The Amazon Simple Storage Service (Amazon S3) path from
  /// where you import the labels.
  ///
  /// [replaceAllLabels]: Indicates whether to overwrite your existing labels.
  Future<StartImportLabelsTaskRunResponse> startImportLabelsTaskRun(
      {@required String transformId,
      @required String inputS3Path,
      bool replaceAllLabels}) async {
    return StartImportLabelsTaskRunResponse.fromJson({});
  }

  /// Starts a job run using a job definition.
  ///
  /// [jobName]: The name of the job definition to use.
  ///
  /// [jobRunId]: The ID of a previous `JobRun` to retry.
  ///
  /// [arguments]: The job arguments specifically for this run. For this job
  /// run, they replace the default arguments set in the job definition itself.
  ///
  /// You can specify arguments here that your own job-execution script
  /// consumes, as well as arguments that AWS Glue itself consumes.
  ///
  /// For information about how to specify and consume your own Job arguments,
  /// see the [Calling AWS Glue APIs in
  /// Python](https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-python-calling.html)
  /// topic in the developer guide.
  ///
  /// For information about the key-value pairs that AWS Glue consumes to set up
  /// your job, see the [Special Parameters Used by AWS
  /// Glue](https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-etl-glue-arguments.html)
  /// topic in the developer guide.
  ///
  /// [allocatedCapacity]: This field is deprecated. Use `MaxCapacity` instead.
  ///
  /// The number of AWS Glue data processing units (DPUs) to allocate to this
  /// JobRun. From 2 to 100 DPUs can be allocated; the default is 10. A DPU is a
  /// relative measure of processing power that consists of 4 vCPUs of compute
  /// capacity and 16 GB of memory. For more information, see the [AWS Glue
  /// pricing
  /// page](https://docs.aws.amazon.com/https:/aws.amazon.com/glue/pricing/).
  ///
  /// [timeout]: The `JobRun` timeout in minutes. This is the maximum time that
  /// a job run can consume resources before it is terminated and enters
  /// `TIMEOUT` status. The default is 2,880 minutes (48 hours). This overrides
  /// the timeout value set in the parent job.
  ///
  /// [maxCapacity]: The number of AWS Glue data processing units (DPUs) that
  /// can be allocated when this job runs. A DPU is a relative measure of
  /// processing power that consists of 4 vCPUs of compute capacity and 16 GB of
  /// memory. For more information, see the [AWS Glue pricing
  /// page](https://docs.aws.amazon.com/https:/aws.amazon.com/glue/pricing/).
  ///
  /// Do not set `Max Capacity` if using `WorkerType` and `NumberOfWorkers`.
  ///
  /// The value that can be allocated for `MaxCapacity` depends on whether you
  /// are running a Python shell job, or an Apache Spark ETL job:
  ///
  /// *   When you specify a Python shell job (`JobCommand.Name`="pythonshell"),
  /// you can allocate either 0.0625 or 1 DPU. The default is 0.0625 DPU.
  ///
  /// *   When you specify an Apache Spark ETL job
  /// (`JobCommand.Name`="glueetl"), you can allocate from 2 to 100 DPUs. The
  /// default is 10 DPUs. This job type cannot have a fractional DPU allocation.
  ///
  /// [securityConfiguration]: The name of the `SecurityConfiguration` structure
  /// to be used with this job run.
  ///
  /// [notificationProperty]: Specifies configuration properties of a job run
  /// notification.
  ///
  /// [workerType]: The type of predefined worker that is allocated when a job
  /// runs. Accepts a value of Standard, G.1X, or G.2X.
  ///
  /// *   For the `Standard` worker type, each worker provides 4 vCPU, 16 GB of
  /// memory and a 50GB disk, and 2 executors per worker.
  ///
  /// *   For the `G.1X` worker type, each worker provides 4 vCPU, 16 GB of
  /// memory and a 64GB disk, and 1 executor per worker.
  ///
  /// *   For the `G.2X` worker type, each worker provides 8 vCPU, 32 GB of
  /// memory and a 128GB disk, and 1 executor per worker.
  ///
  /// [numberOfWorkers]: The number of workers of a defined `workerType` that
  /// are allocated when a job runs.
  ///
  /// The maximum number of workers you can define are 299 for `G.1X`, and 149
  /// for `G.2X`.
  Future<StartJobRunResponse> startJobRun(String jobName,
      {String jobRunId,
      Map<String, String> arguments,
      int allocatedCapacity,
      int timeout,
      double maxCapacity,
      String securityConfiguration,
      NotificationProperty notificationProperty,
      String workerType,
      int numberOfWorkers}) async {
    return StartJobRunResponse.fromJson({});
  }

  /// Starts a task to estimate the quality of the transform.
  ///
  /// When you provide label sets as examples of truth, AWS Glue machine
  /// learning uses some of those examples to learn from them. The rest of the
  /// labels are used as a test to estimate quality.
  ///
  /// Returns a unique identifier for the run. You can call `GetMLTaskRun` to
  /// get more information about the stats of the `EvaluationTaskRun`.
  ///
  /// [transformId]: The unique identifier of the machine learning transform.
  Future<StartMLEvaluationTaskRunResponse> startMLEvaluationTaskRun(
      String transformId) async {
    return StartMLEvaluationTaskRunResponse.fromJson({});
  }

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
  ///
  /// [transformId]: The unique identifier of the machine learning transform.
  ///
  /// [outputS3Path]: The Amazon Simple Storage Service (Amazon S3) path where
  /// you generate the labeling set.
  Future<StartMLLabelingSetGenerationTaskRunResponse>
      startMLLabelingSetGenerationTaskRun(
          {@required String transformId, @required String outputS3Path}) async {
    return StartMLLabelingSetGenerationTaskRunResponse.fromJson({});
  }

  /// Starts an existing trigger. See [Triggering
  /// Jobs](https://docs.aws.amazon.com/glue/latest/dg/trigger-job.html) for
  /// information about how different types of trigger are started.
  ///
  /// [name]: The name of the trigger to start.
  Future<StartTriggerResponse> startTrigger(String name) async {
    return StartTriggerResponse.fromJson({});
  }

  /// Starts a new run of the specified workflow.
  ///
  /// [name]: The name of the workflow to start.
  Future<StartWorkflowRunResponse> startWorkflowRun(String name) async {
    return StartWorkflowRunResponse.fromJson({});
  }

  /// If the specified crawler is running, stops the crawl.
  ///
  /// [name]: Name of the crawler to stop.
  Future<StopCrawlerResponse> stopCrawler(String name) async {
    return StopCrawlerResponse.fromJson({});
  }

  /// Sets the schedule state of the specified crawler to `NOT_SCHEDULED`, but
  /// does not stop the crawler if it is already running.
  ///
  /// [crawlerName]: Name of the crawler whose schedule state to set.
  Future<StopCrawlerScheduleResponse> stopCrawlerSchedule(
      String crawlerName) async {
    return StopCrawlerScheduleResponse.fromJson({});
  }

  /// Stops a specified trigger.
  ///
  /// [name]: The name of the trigger to stop.
  Future<StopTriggerResponse> stopTrigger(String name) async {
    return StopTriggerResponse.fromJson({});
  }

  /// Adds tags to a resource. A tag is a label you can assign to an AWS
  /// resource. In AWS Glue, you can tag only certain resources. For information
  /// about what resources you can tag, see [AWS Tags in AWS
  /// Glue](https://docs.aws.amazon.com/glue/latest/dg/monitor-tags.html).
  ///
  /// [resourceArn]: The ARN of the AWS Glue resource to which to add the tags.
  /// For more information about AWS Glue resource ARNs, see the [AWS Glue ARN
  /// string
  /// pattern](https://docs.aws.amazon.com/glue/latest/dg/aws-glue-api-common.html#aws-glue-api-regex-aws-glue-arn-id).
  ///
  /// [tagsToAdd]: Tags to add to this resource.
  Future<TagResourceResponse> tagResource(
      {@required String resourceArn,
      @required Map<String, String> tagsToAdd}) async {
    return TagResourceResponse.fromJson({});
  }

  /// Removes tags from a resource.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the resource from which
  /// to remove the tags.
  ///
  /// [tagsToRemove]: Tags to remove from this resource.
  Future<UntagResourceResponse> untagResource(
      {@required String resourceArn,
      @required List<String> tagsToRemove}) async {
    return UntagResourceResponse.fromJson({});
  }

  /// Modifies an existing classifier (a `GrokClassifier`, an `XMLClassifier`, a
  /// `JsonClassifier`, or a `CsvClassifier`, depending on which field is
  /// present).
  ///
  /// [grokClassifier]: A `GrokClassifier` object with updated fields.
  ///
  /// [xmlClassifier]: An `XMLClassifier` object with updated fields.
  ///
  /// [jsonClassifier]: A `JsonClassifier` object with updated fields.
  ///
  /// [csvClassifier]: A `CsvClassifier` object with updated fields.
  Future<UpdateClassifierResponse> updateClassifier(
      {UpdateGrokClassifierRequest grokClassifier,
      UpdateXmlClassifierRequest xmlClassifier,
      UpdateJsonClassifierRequest jsonClassifier,
      UpdateCsvClassifierRequest csvClassifier}) async {
    return UpdateClassifierResponse.fromJson({});
  }

  /// Updates a connection definition in the Data Catalog.
  ///
  /// [catalogId]: The ID of the Data Catalog in which the connection resides.
  /// If none is provided, the AWS account ID is used by default.
  ///
  /// [name]: The name of the connection definition to update.
  ///
  /// [connectionInput]: A `ConnectionInput` object that redefines the
  /// connection in question.
  Future<UpdateConnectionResponse> updateConnection(
      {String catalogId,
      @required String name,
      @required ConnectionInput connectionInput}) async {
    return UpdateConnectionResponse.fromJson({});
  }

  /// Updates a crawler. If a crawler is running, you must stop it using
  /// `StopCrawler` before updating it.
  ///
  /// [name]: Name of the new crawler.
  ///
  /// [role]: The IAM role or Amazon Resource Name (ARN) of an IAM role that is
  /// used by the new crawler to access customer resources.
  ///
  /// [databaseName]: The AWS Glue database where results are stored, such as:
  /// `arn:aws:daylight:us-east-1::database/sometable/*`.
  ///
  /// [description]: A description of the new crawler.
  ///
  /// [targets]: A list of targets to crawl.
  ///
  /// [schedule]: A `cron` expression used to specify the schedule. For more
  /// information, see [Time-Based Schedules for Jobs and
  /// Crawlers](http://docs.aws.amazon.com/glue/latest/dg/monitor-data-warehouse-schedule.html).
  /// For example, to run something every day at 12:15 UTC, specify `cron(15 12
  /// * * ? *)`.
  ///
  /// [classifiers]: A list of custom classifiers that the user has registered.
  /// By default, all built-in classifiers are included in a crawl, but these
  /// custom classifiers always override the default classifiers for a given
  /// classification.
  ///
  /// [tablePrefix]: The table prefix used for catalog tables that are created.
  ///
  /// [schemaChangePolicy]: The policy for the crawler's update and deletion
  /// behavior.
  ///
  /// [configuration]: The crawler configuration information. This versioned
  /// JSON string allows users to specify aspects of a crawler's behavior. For
  /// more information, see [Configuring a
  /// Crawler](http://docs.aws.amazon.com/glue/latest/dg/crawler-configuration.html).
  ///
  /// [crawlerSecurityConfiguration]: The name of the `SecurityConfiguration`
  /// structure to be used by this crawler.
  Future<UpdateCrawlerResponse> updateCrawler(String name,
      {String role,
      String databaseName,
      String description,
      CrawlerTargets targets,
      String schedule,
      List<String> classifiers,
      String tablePrefix,
      SchemaChangePolicy schemaChangePolicy,
      String configuration,
      String crawlerSecurityConfiguration}) async {
    return UpdateCrawlerResponse.fromJson({});
  }

  /// Updates the schedule of a crawler using a `cron` expression.
  ///
  /// [crawlerName]: The name of the crawler whose schedule to update.
  ///
  /// [schedule]: The updated `cron` expression used to specify the schedule.
  /// For more information, see [Time-Based Schedules for Jobs and
  /// Crawlers](http://docs.aws.amazon.com/glue/latest/dg/monitor-data-warehouse-schedule.html).
  /// For example, to run something every day at 12:15 UTC, specify `cron(15 12
  /// * * ? *)`.
  Future<UpdateCrawlerScheduleResponse> updateCrawlerSchedule(
      String crawlerName,
      {String schedule}) async {
    return UpdateCrawlerScheduleResponse.fromJson({});
  }

  /// Updates an existing database definition in a Data Catalog.
  ///
  /// [catalogId]: The ID of the Data Catalog in which the metadata database
  /// resides. If none is provided, the AWS account ID is used by default.
  ///
  /// [name]: The name of the database to update in the catalog. For Hive
  /// compatibility, this is folded to lowercase.
  ///
  /// [databaseInput]: A `DatabaseInput` object specifying the new definition of
  /// the metadata database in the catalog.
  Future<UpdateDatabaseResponse> updateDatabase(
      {String catalogId,
      @required String name,
      @required DatabaseInput databaseInput}) async {
    return UpdateDatabaseResponse.fromJson({});
  }

  /// Updates a specified development endpoint.
  ///
  /// [endpointName]: The name of the `DevEndpoint` to be updated.
  ///
  /// [publicKey]: The public key for the `DevEndpoint` to use.
  ///
  /// [addPublicKeys]: The list of public keys for the `DevEndpoint` to use.
  ///
  /// [deletePublicKeys]: The list of public keys to be deleted from the
  /// `DevEndpoint`.
  ///
  /// [customLibraries]: Custom Python or Java libraries to be loaded in the
  /// `DevEndpoint`.
  ///
  /// [updateEtlLibraries]:  `True` if the list of custom libraries to be loaded
  /// in the development endpoint needs to be updated, or `False` if otherwise.
  ///
  /// [deleteArguments]: The list of argument keys to be deleted from the map of
  /// arguments used to configure the `DevEndpoint`.
  ///
  /// [addArguments]: The map of arguments to add the map of arguments used to
  /// configure the `DevEndpoint`.
  Future<UpdateDevEndpointResponse> updateDevEndpoint(String endpointName,
      {String publicKey,
      List<String> addPublicKeys,
      List<String> deletePublicKeys,
      DevEndpointCustomLibraries customLibraries,
      bool updateEtlLibraries,
      List<String> deleteArguments,
      Map<String, String> addArguments}) async {
    return UpdateDevEndpointResponse.fromJson({});
  }

  /// Updates an existing job definition.
  ///
  /// [jobName]: The name of the job definition to update.
  ///
  /// [jobUpdate]: Specifies the values with which to update the job definition.
  Future<UpdateJobResponse> updateJob(
      {@required String jobName, @required JobUpdate jobUpdate}) async {
    return UpdateJobResponse.fromJson({});
  }

  /// Updates an existing machine learning transform. Call this operation to
  /// tune the algorithm parameters to achieve better results.
  ///
  /// After calling this operation, you can call the `StartMLEvaluationTaskRun`
  /// operation to assess how well your new parameters achieved your goals (such
  /// as improving the quality of your machine learning transform, or making it
  /// more cost-effective).
  ///
  /// [transformId]: A unique identifier that was generated when the transform
  /// was created.
  ///
  /// [name]: The unique name that you gave the transform when you created it.
  ///
  /// [description]: A description of the transform. The default is an empty
  /// string.
  ///
  /// [parameters]: The configuration parameters that are specific to the
  /// transform type (algorithm) used. Conditionally dependent on the transform
  /// type.
  ///
  /// [role]: The name or Amazon Resource Name (ARN) of the IAM role with the
  /// required permissions.
  ///
  /// [maxCapacity]: The number of AWS Glue data processing units (DPUs) that
  /// are allocated to task runs for this transform. You can allocate from 2 to
  /// 100 DPUs; the default is 10. A DPU is a relative measure of processing
  /// power that consists of 4 vCPUs of compute capacity and 16 GB of memory.
  /// For more information, see the [AWS Glue pricing
  /// page](https://aws.amazon.com/glue/pricing/).
  ///
  /// When the `WorkerType` field is set to a value other than `Standard`, the
  /// `MaxCapacity` field is set automatically and becomes read-only.
  ///
  /// [workerType]: The type of predefined worker that is allocated when this
  /// task runs. Accepts a value of Standard, G.1X, or G.2X.
  ///
  /// *   For the `Standard` worker type, each worker provides 4 vCPU, 16 GB of
  /// memory and a 50GB disk, and 2 executors per worker.
  ///
  /// *   For the `G.1X` worker type, each worker provides 4 vCPU, 16 GB of
  /// memory and a 64GB disk, and 1 executor per worker.
  ///
  /// *   For the `G.2X` worker type, each worker provides 8 vCPU, 32 GB of
  /// memory and a 128GB disk, and 1 executor per worker.
  ///
  /// [numberOfWorkers]: The number of workers of a defined `workerType` that
  /// are allocated when this task runs.
  ///
  /// [timeout]: The timeout for a task run for this transform in minutes. This
  /// is the maximum time that a task run for this transform can consume
  /// resources before it is terminated and enters `TIMEOUT` status. The default
  /// is 2,880 minutes (48 hours).
  ///
  /// [maxRetries]: The maximum number of times to retry a task for this
  /// transform after a task run fails.
  Future<UpdateMLTransformResponse> updateMLTransform(String transformId,
      {String name,
      String description,
      TransformParameters parameters,
      String role,
      double maxCapacity,
      String workerType,
      int numberOfWorkers,
      int timeout,
      int maxRetries}) async {
    return UpdateMLTransformResponse.fromJson({});
  }

  /// Updates a partition.
  ///
  /// [catalogId]: The ID of the Data Catalog where the partition to be updated
  /// resides. If none is provided, the AWS account ID is used by default.
  ///
  /// [databaseName]: The name of the catalog database in which the table in
  /// question resides.
  ///
  /// [tableName]: The name of the table in which the partition to be updated is
  /// located.
  ///
  /// [partitionValueList]: A list of the values defining the partition.
  ///
  /// [partitionInput]: The new partition object to update the partition to.
  Future<UpdatePartitionResponse> updatePartition(
      {String catalogId,
      @required String databaseName,
      @required String tableName,
      @required List<String> partitionValueList,
      @required PartitionInput partitionInput}) async {
    return UpdatePartitionResponse.fromJson({});
  }

  /// Updates a metadata table in the Data Catalog.
  ///
  /// [catalogId]: The ID of the Data Catalog where the table resides. If none
  /// is provided, the AWS account ID is used by default.
  ///
  /// [databaseName]: The name of the catalog database in which the table
  /// resides. For Hive compatibility, this name is entirely lowercase.
  ///
  /// [tableInput]: An updated `TableInput` object to define the metadata table
  /// in the catalog.
  ///
  /// [skipArchive]: By default, `UpdateTable` always creates an archived
  /// version of the table before updating it. However, if `skipArchive` is set
  /// to true, `UpdateTable` does not create the archived version.
  Future<UpdateTableResponse> updateTable(
      {String catalogId,
      @required String databaseName,
      @required TableInput tableInput,
      bool skipArchive}) async {
    return UpdateTableResponse.fromJson({});
  }

  /// Updates a trigger definition.
  ///
  /// [name]: The name of the trigger to update.
  ///
  /// [triggerUpdate]: The new values with which to update the trigger.
  Future<UpdateTriggerResponse> updateTrigger(
      {@required String name, @required TriggerUpdate triggerUpdate}) async {
    return UpdateTriggerResponse.fromJson({});
  }

  /// Updates an existing function definition in the Data Catalog.
  ///
  /// [catalogId]: The ID of the Data Catalog where the function to be updated
  /// is located. If none is provided, the AWS account ID is used by default.
  ///
  /// [databaseName]: The name of the catalog database where the function to be
  /// updated is located.
  ///
  /// [functionName]: The name of the function.
  ///
  /// [functionInput]: A `FunctionInput` object that redefines the function in
  /// the Data Catalog.
  Future<UpdateUserDefinedFunctionResponse> updateUserDefinedFunction(
      {String catalogId,
      @required String databaseName,
      @required String functionName,
      @required UserDefinedFunctionInput functionInput}) async {
    return UpdateUserDefinedFunctionResponse.fromJson({});
  }

  /// Updates an existing workflow.
  ///
  /// [name]: Name of the workflow to be updated.
  ///
  /// [description]: The description of the workflow.
  ///
  /// [defaultRunProperties]: A collection of properties to be used as part of
  /// each execution of the workflow.
  Future<UpdateWorkflowResponse> updateWorkflow(String name,
      {String description, Map<String, String> defaultRunProperties}) async {
    return UpdateWorkflowResponse.fromJson({});
  }
}

class Action {
  /// The name of a job to be executed.
  final String jobName;

  /// The job arguments used when this trigger fires. For this job run, they
  /// replace the default arguments set in the job definition itself.
  ///
  /// You can specify arguments here that your own job-execution script
  /// consumes, as well as arguments that AWS Glue itself consumes.
  ///
  /// For information about how to specify and consume your own Job arguments,
  /// see the [Calling AWS Glue APIs in
  /// Python](https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-python-calling.html)
  /// topic in the developer guide.
  ///
  /// For information about the key-value pairs that AWS Glue consumes to set up
  /// your job, see the [Special Parameters Used by AWS
  /// Glue](https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-etl-glue-arguments.html)
  /// topic in the developer guide.
  final Map<String, String> arguments;

  /// The `JobRun` timeout in minutes. This is the maximum time that a job run
  /// can consume resources before it is terminated and enters `TIMEOUT` status.
  /// The default is 2,880 minutes (48 hours). This overrides the timeout value
  /// set in the parent job.
  final int timeout;

  /// The name of the `SecurityConfiguration` structure to be used with this
  /// action.
  final String securityConfiguration;

  /// Specifies configuration properties of a job run notification.
  final NotificationProperty notificationProperty;

  /// The name of the crawler to be used with this action.
  final String crawlerName;

  Action({
    this.jobName,
    this.arguments,
    this.timeout,
    this.securityConfiguration,
    this.notificationProperty,
    this.crawlerName,
  });
  static Action fromJson(Map<String, dynamic> json) => Action();
}

class BatchCreatePartitionResponse {
  /// The errors encountered when trying to create the requested partitions.
  final List<PartitionError> errors;

  BatchCreatePartitionResponse({
    this.errors,
  });
  static BatchCreatePartitionResponse fromJson(Map<String, dynamic> json) =>
      BatchCreatePartitionResponse();
}

class BatchDeleteConnectionResponse {
  /// A list of names of the connection definitions that were successfully
  /// deleted.
  final List<String> succeeded;

  /// A map of the names of connections that were not successfully deleted to
  /// error details.
  final Map<String, ErrorDetail> errors;

  BatchDeleteConnectionResponse({
    this.succeeded,
    this.errors,
  });
  static BatchDeleteConnectionResponse fromJson(Map<String, dynamic> json) =>
      BatchDeleteConnectionResponse();
}

class BatchDeletePartitionResponse {
  /// The errors encountered when trying to delete the requested partitions.
  final List<PartitionError> errors;

  BatchDeletePartitionResponse({
    this.errors,
  });
  static BatchDeletePartitionResponse fromJson(Map<String, dynamic> json) =>
      BatchDeletePartitionResponse();
}

class BatchDeleteTableResponse {
  /// A list of errors encountered in attempting to delete the specified tables.
  final List<TableError> errors;

  BatchDeleteTableResponse({
    this.errors,
  });
  static BatchDeleteTableResponse fromJson(Map<String, dynamic> json) =>
      BatchDeleteTableResponse();
}

class BatchDeleteTableVersionResponse {
  /// A list of errors encountered while trying to delete the specified table
  /// versions.
  final List<TableVersionError> errors;

  BatchDeleteTableVersionResponse({
    this.errors,
  });
  static BatchDeleteTableVersionResponse fromJson(Map<String, dynamic> json) =>
      BatchDeleteTableVersionResponse();
}

class BatchGetCrawlersResponse {
  /// A list of crawler definitions.
  final List<Crawler> crawlers;

  /// A list of names of crawlers that were not found.
  final List<String> crawlersNotFound;

  BatchGetCrawlersResponse({
    this.crawlers,
    this.crawlersNotFound,
  });
  static BatchGetCrawlersResponse fromJson(Map<String, dynamic> json) =>
      BatchGetCrawlersResponse();
}

class BatchGetDevEndpointsResponse {
  /// A list of `DevEndpoint` definitions.
  final List<DevEndpoint> devEndpoints;

  /// A list of `DevEndpoints` not found.
  final List<String> devEndpointsNotFound;

  BatchGetDevEndpointsResponse({
    this.devEndpoints,
    this.devEndpointsNotFound,
  });
  static BatchGetDevEndpointsResponse fromJson(Map<String, dynamic> json) =>
      BatchGetDevEndpointsResponse();
}

class BatchGetJobsResponse {
  /// A list of job definitions.
  final List<Job> jobs;

  /// A list of names of jobs not found.
  final List<String> jobsNotFound;

  BatchGetJobsResponse({
    this.jobs,
    this.jobsNotFound,
  });
  static BatchGetJobsResponse fromJson(Map<String, dynamic> json) =>
      BatchGetJobsResponse();
}

class BatchGetPartitionResponse {
  /// A list of the requested partitions.
  final List<Partition> partitions;

  /// A list of the partition values in the request for which partitions were
  /// not returned.
  final List<PartitionValueList> unprocessedKeys;

  BatchGetPartitionResponse({
    this.partitions,
    this.unprocessedKeys,
  });
  static BatchGetPartitionResponse fromJson(Map<String, dynamic> json) =>
      BatchGetPartitionResponse();
}

class BatchGetTriggersResponse {
  /// A list of trigger definitions.
  final List<Trigger> triggers;

  /// A list of names of triggers not found.
  final List<String> triggersNotFound;

  BatchGetTriggersResponse({
    this.triggers,
    this.triggersNotFound,
  });
  static BatchGetTriggersResponse fromJson(Map<String, dynamic> json) =>
      BatchGetTriggersResponse();
}

class BatchGetWorkflowsResponse {
  /// A list of workflow resource metadata.
  final List<Workflow> workflows;

  /// A list of names of workflows not found.
  final List<String> missingWorkflows;

  BatchGetWorkflowsResponse({
    this.workflows,
    this.missingWorkflows,
  });
  static BatchGetWorkflowsResponse fromJson(Map<String, dynamic> json) =>
      BatchGetWorkflowsResponse();
}

class BatchStopJobRunError {
  /// The name of the job definition that is used in the job run in question.
  final String jobName;

  /// The `JobRunId` of the job run in question.
  final String jobRunId;

  /// Specifies details about the error that was encountered.
  final ErrorDetail errorDetail;

  BatchStopJobRunError({
    this.jobName,
    this.jobRunId,
    this.errorDetail,
  });
  static BatchStopJobRunError fromJson(Map<String, dynamic> json) =>
      BatchStopJobRunError();
}

class BatchStopJobRunResponse {
  /// A list of the JobRuns that were successfully submitted for stopping.
  final List<BatchStopJobRunSuccessfulSubmission> successfulSubmissions;

  /// A list of the errors that were encountered in trying to stop `JobRuns`,
  /// including the `JobRunId` for which each error was encountered and details
  /// about the error.
  final List<BatchStopJobRunError> errors;

  BatchStopJobRunResponse({
    this.successfulSubmissions,
    this.errors,
  });
  static BatchStopJobRunResponse fromJson(Map<String, dynamic> json) =>
      BatchStopJobRunResponse();
}

class BatchStopJobRunSuccessfulSubmission {
  /// The name of the job definition used in the job run that was stopped.
  final String jobName;

  /// The `JobRunId` of the job run that was stopped.
  final String jobRunId;

  BatchStopJobRunSuccessfulSubmission({
    this.jobName,
    this.jobRunId,
  });
  static BatchStopJobRunSuccessfulSubmission fromJson(
          Map<String, dynamic> json) =>
      BatchStopJobRunSuccessfulSubmission();
}

class CancelMLTaskRunResponse {
  /// The unique identifier of the machine learning transform.
  final String transformId;

  /// The unique identifier for the task run.
  final String taskRunId;

  /// The status for this run.
  final String status;

  CancelMLTaskRunResponse({
    this.transformId,
    this.taskRunId,
    this.status,
  });
  static CancelMLTaskRunResponse fromJson(Map<String, dynamic> json) =>
      CancelMLTaskRunResponse();
}

class CatalogEntry {
  /// The database in which the table metadata resides.
  final String databaseName;

  /// The name of the table in question.
  final String tableName;

  CatalogEntry({
    @required this.databaseName,
    @required this.tableName,
  });
}

class CatalogImportStatus {
  ///  `True` if the migration has completed, or `False` otherwise.
  final bool importCompleted;

  /// The time that the migration was started.
  final DateTime importTime;

  /// The name of the person who initiated the migration.
  final String importedBy;

  CatalogImportStatus({
    this.importCompleted,
    this.importTime,
    this.importedBy,
  });
  static CatalogImportStatus fromJson(Map<String, dynamic> json) =>
      CatalogImportStatus();
}

class CatalogTarget {
  /// The name of the database to be synchronized.
  final String databaseName;

  /// A list of the tables to be synchronized.
  final List<String> tables;

  CatalogTarget({
    @required this.databaseName,
    @required this.tables,
  });
  static CatalogTarget fromJson(Map<String, dynamic> json) => CatalogTarget();
}

class Classifier {
  /// A classifier that uses `grok`.
  final GrokClassifier grokClassifier;

  /// A classifier for XML content.
  final XmlClassifier xmlClassifier;

  /// A classifier for JSON content.
  final JsonClassifier jsonClassifier;

  /// A classifier for comma-separated values (CSV).
  final CsvClassifier csvClassifier;

  Classifier({
    this.grokClassifier,
    this.xmlClassifier,
    this.jsonClassifier,
    this.csvClassifier,
  });
  static Classifier fromJson(Map<String, dynamic> json) => Classifier();
}

class CloudWatchEncryption {
  /// The encryption mode to use for CloudWatch data.
  final String cloudWatchEncryptionMode;

  /// The Amazon Resource Name (ARN) of the KMS key to be used to encrypt the
  /// data.
  final String kmsKeyArn;

  CloudWatchEncryption({
    this.cloudWatchEncryptionMode,
    this.kmsKeyArn,
  });
  static CloudWatchEncryption fromJson(Map<String, dynamic> json) =>
      CloudWatchEncryption();
}

class CodeGenEdge {
  /// The ID of the node at which the edge starts.
  final String source;

  /// The ID of the node at which the edge ends.
  final String target;

  /// The target of the edge.
  final String targetParameter;

  CodeGenEdge({
    @required this.source,
    @required this.target,
    this.targetParameter,
  });
  static CodeGenEdge fromJson(Map<String, dynamic> json) => CodeGenEdge();
}

class CodeGenNode {
  /// A node identifier that is unique within the node's graph.
  final String id;

  /// The type of node that this is.
  final String nodeType;

  /// Properties of the node, in the form of name-value pairs.
  final List<CodeGenNodeArg> args;

  /// The line number of the node.
  final int lineNumber;

  CodeGenNode({
    @required this.id,
    @required this.nodeType,
    @required this.args,
    this.lineNumber,
  });
  static CodeGenNode fromJson(Map<String, dynamic> json) => CodeGenNode();
}

class CodeGenNodeArg {
  /// The name of the argument or property.
  final String name;

  /// The value of the argument or property.
  final String value;

  /// True if the value is used as a parameter.
  final bool param;

  CodeGenNodeArg({
    @required this.name,
    @required this.value,
    this.param,
  });
  static CodeGenNodeArg fromJson(Map<String, dynamic> json) => CodeGenNodeArg();
}

class Column {
  /// The name of the `Column`.
  final String name;

  /// The data type of the `Column`.
  final String type;

  /// A free-form text comment.
  final String comment;

  /// These key-value pairs define properties associated with the column.
  final Map<String, String> parameters;

  Column({
    @required this.name,
    this.type,
    this.comment,
    this.parameters,
  });
  static Column fromJson(Map<String, dynamic> json) => Column();
}

class Condition {
  /// A logical operator.
  final String logicalOperator;

  /// The name of the job whose `JobRuns` this condition applies to, and on
  /// which this trigger waits.
  final String jobName;

  /// The condition state. Currently, the values supported are `SUCCEEDED`,
  /// `STOPPED`, `TIMEOUT`, and `FAILED`.
  final String state;

  /// The name of the crawler to which this condition applies.
  final String crawlerName;

  /// The state of the crawler to which this condition applies.
  final String crawlState;

  Condition({
    this.logicalOperator,
    this.jobName,
    this.state,
    this.crawlerName,
    this.crawlState,
  });
  static Condition fromJson(Map<String, dynamic> json) => Condition();
}

class ConfusionMatrix {
  /// The number of matches in the data that the transform correctly found, in
  /// the confusion matrix for your transform.
  final BigInt numTruePositives;

  /// The number of nonmatches in the data that the transform incorrectly
  /// classified as a match, in the confusion matrix for your transform.
  final BigInt numFalsePositives;

  /// The number of nonmatches in the data that the transform correctly
  /// rejected, in the confusion matrix for your transform.
  final BigInt numTrueNegatives;

  /// The number of matches in the data that the transform didn't find, in the
  /// confusion matrix for your transform.
  final BigInt numFalseNegatives;

  ConfusionMatrix({
    this.numTruePositives,
    this.numFalsePositives,
    this.numTrueNegatives,
    this.numFalseNegatives,
  });
  static ConfusionMatrix fromJson(Map<String, dynamic> json) =>
      ConfusionMatrix();
}

class Connection {
  /// The name of the connection definition.
  final String name;

  /// The description of the connection.
  final String description;

  /// The type of the connection. Currently, only JDBC is supported; SFTP is not
  /// supported.
  final String connectionType;

  /// A list of criteria that can be used in selecting this connection.
  final List<String> matchCriteria;

  /// These key-value pairs define parameters for the connection:
  ///
  /// *    `HOST` \- The host URI: either the fully qualified domain name (FQDN)
  /// or the IPv4 address of the database host.
  ///
  /// *    `PORT` \- The port number, between 1024 and 65535, of the port on
  /// which the database host is listening for database connections.
  ///
  /// *    `USER_NAME` \- The name under which to log in to the database. The
  /// value string for `USER_NAME` is "`USERNAME`".
  ///
  /// *    `PASSWORD` \- A password, if one is used, for the user name.
  ///
  /// *    `ENCRYPTED_PASSWORD` \- When you enable connection password
  /// protection by setting `ConnectionPasswordEncryption` in the Data Catalog
  /// encryption settings, this field stores the encrypted password.
  ///
  /// *    `JDBC\_DRIVER\_JAR_URI` \- The Amazon Simple Storage Service (Amazon
  /// S3) path of the JAR file that contains the JDBC driver to use.
  ///
  /// *    `JDBC\_DRIVER\_CLASS_NAME` \- The class name of the JDBC driver to
  /// use.
  ///
  /// *    `JDBC_ENGINE` \- The name of the JDBC engine to use.
  ///
  /// *    `JDBC\_ENGINE\_VERSION` \- The version of the JDBC engine to use.
  ///
  /// *    `CONFIG_FILES` \- (Reserved for future use.)
  ///
  /// *    `INSTANCE_ID` \- The instance ID to use.
  ///
  /// *    `JDBC\_CONNECTION\_URL` \- The URL for the JDBC connection.
  ///
  /// *    `JDBC\_ENFORCE\_SSL` \- A Boolean string (true, false) specifying
  /// whether Secure Sockets Layer (SSL) with hostname matching is enforced for
  /// the JDBC connection on the client. The default is false.
  final Map<String, String> connectionProperties;

  /// A map of physical connection requirements, such as virtual private cloud
  /// (VPC) and `SecurityGroup`, that are needed to make this connection
  /// successfully.
  final PhysicalConnectionRequirements physicalConnectionRequirements;

  /// The time that this connection definition was created.
  final DateTime creationTime;

  /// The last time that this connection definition was updated.
  final DateTime lastUpdatedTime;

  /// The user, group, or role that last updated this connection definition.
  final String lastUpdatedBy;

  Connection({
    this.name,
    this.description,
    this.connectionType,
    this.matchCriteria,
    this.connectionProperties,
    this.physicalConnectionRequirements,
    this.creationTime,
    this.lastUpdatedTime,
    this.lastUpdatedBy,
  });
  static Connection fromJson(Map<String, dynamic> json) => Connection();
}

class ConnectionInput {
  /// The name of the connection.
  final String name;

  /// The description of the connection.
  final String description;

  /// The type of the connection. Currently, only JDBC is supported; SFTP is not
  /// supported.
  final String connectionType;

  /// A list of criteria that can be used in selecting this connection.
  final List<String> matchCriteria;

  /// These key-value pairs define parameters for the connection.
  final Map<String, String> connectionProperties;

  /// A map of physical connection requirements, such as virtual private cloud
  /// (VPC) and `SecurityGroup`, that are needed to successfully make this
  /// connection.
  final PhysicalConnectionRequirements physicalConnectionRequirements;

  ConnectionInput({
    @required this.name,
    this.description,
    @required this.connectionType,
    this.matchCriteria,
    @required this.connectionProperties,
    this.physicalConnectionRequirements,
  });
}

class ConnectionPasswordEncryption {
  /// When the `ReturnConnectionPasswordEncrypted` flag is set to "true",
  /// passwords remain encrypted in the responses of `GetConnection` and
  /// `GetConnections`. This encryption takes effect independently from catalog
  /// encryption.
  final bool returnConnectionPasswordEncrypted;

  /// An AWS KMS key that is used to encrypt the connection password.
  ///
  /// If connection password protection is enabled, the caller of
  /// `CreateConnection` and `UpdateConnection` needs at least `kms:Encrypt`
  /// permission on the specified AWS KMS key, to encrypt passwords before
  /// storing them in the Data Catalog.
  ///
  /// You can set the decrypt permission to enable or restrict access on the
  /// password key according to your security requirements.
  final String awsKmsKeyId;

  ConnectionPasswordEncryption({
    @required this.returnConnectionPasswordEncrypted,
    this.awsKmsKeyId,
  });
  static ConnectionPasswordEncryption fromJson(Map<String, dynamic> json) =>
      ConnectionPasswordEncryption();
}

class ConnectionsList {
  /// A list of connections used by the job.
  final List<String> connections;

  ConnectionsList({
    this.connections,
  });
  static ConnectionsList fromJson(Map<String, dynamic> json) =>
      ConnectionsList();
}

class Crawl {
  /// The state of the crawler.
  final String state;

  /// The date and time on which the crawl started.
  final DateTime startedOn;

  /// The date and time on which the crawl completed.
  final DateTime completedOn;

  /// The error message associated with the crawl.
  final String errorMessage;

  /// The log group associated with the crawl.
  final String logGroup;

  /// The log stream associated with the crawl.
  final String logStream;

  Crawl({
    this.state,
    this.startedOn,
    this.completedOn,
    this.errorMessage,
    this.logGroup,
    this.logStream,
  });
  static Crawl fromJson(Map<String, dynamic> json) => Crawl();
}

class Crawler {
  /// The name of the crawler.
  final String name;

  /// The Amazon Resource Name (ARN) of an IAM role that's used to access
  /// customer resources, such as Amazon Simple Storage Service (Amazon S3)
  /// data.
  final String role;

  /// A collection of targets to crawl.
  final CrawlerTargets targets;

  /// The name of the database in which the crawler's output is stored.
  final String databaseName;

  /// A description of the crawler.
  final String description;

  /// A list of UTF-8 strings that specify the custom classifiers that are
  /// associated with the crawler.
  final List<String> classifiers;

  /// The policy that specifies update and delete behaviors for the crawler.
  final SchemaChangePolicy schemaChangePolicy;

  /// Indicates whether the crawler is running, or whether a run is pending.
  final String state;

  /// The prefix added to the names of tables that are created.
  final String tablePrefix;

  /// For scheduled crawlers, the schedule when the crawler runs.
  final Schedule schedule;

  /// If the crawler is running, contains the total time elapsed since the last
  /// crawl began.
  final BigInt crawlElapsedTime;

  /// The time that the crawler was created.
  final DateTime creationTime;

  /// The time that the crawler was last updated.
  final DateTime lastUpdated;

  /// The status of the last crawl, and potentially error information if an
  /// error occurred.
  final LastCrawlInfo lastCrawl;

  /// The version of the crawler.
  final BigInt version;

  /// Crawler configuration information. This versioned JSON string allows users
  /// to specify aspects of a crawler's behavior. For more information, see
  /// [Configuring a
  /// Crawler](http://docs.aws.amazon.com/glue/latest/dg/crawler-configuration.html).
  final String configuration;

  /// The name of the `SecurityConfiguration` structure to be used by this
  /// crawler.
  final String crawlerSecurityConfiguration;

  Crawler({
    this.name,
    this.role,
    this.targets,
    this.databaseName,
    this.description,
    this.classifiers,
    this.schemaChangePolicy,
    this.state,
    this.tablePrefix,
    this.schedule,
    this.crawlElapsedTime,
    this.creationTime,
    this.lastUpdated,
    this.lastCrawl,
    this.version,
    this.configuration,
    this.crawlerSecurityConfiguration,
  });
  static Crawler fromJson(Map<String, dynamic> json) => Crawler();
}

class CrawlerMetrics {
  /// The name of the crawler.
  final String crawlerName;

  /// The estimated time left to complete a running crawl.
  final double timeLeftSeconds;

  /// True if the crawler is still estimating how long it will take to complete
  /// this run.
  final bool stillEstimating;

  /// The duration of the crawler's most recent run, in seconds.
  final double lastRuntimeSeconds;

  /// The median duration of this crawler's runs, in seconds.
  final double medianRuntimeSeconds;

  /// The number of tables created by this crawler.
  final int tablesCreated;

  /// The number of tables updated by this crawler.
  final int tablesUpdated;

  /// The number of tables deleted by this crawler.
  final int tablesDeleted;

  CrawlerMetrics({
    this.crawlerName,
    this.timeLeftSeconds,
    this.stillEstimating,
    this.lastRuntimeSeconds,
    this.medianRuntimeSeconds,
    this.tablesCreated,
    this.tablesUpdated,
    this.tablesDeleted,
  });
  static CrawlerMetrics fromJson(Map<String, dynamic> json) => CrawlerMetrics();
}

class CrawlerNodeDetails {
  /// A list of crawls represented by the crawl node.
  final List<Crawl> crawls;

  CrawlerNodeDetails({
    this.crawls,
  });
  static CrawlerNodeDetails fromJson(Map<String, dynamic> json) =>
      CrawlerNodeDetails();
}

class CrawlerTargets {
  /// Specifies Amazon Simple Storage Service (Amazon S3) targets.
  final List<S3Target> s3Targets;

  /// Specifies JDBC targets.
  final List<JdbcTarget> jdbcTargets;

  /// Specifies Amazon DynamoDB targets.
  final List<DynamoDBTarget> dynamoDBTargets;

  /// Specifies AWS Glue Data Catalog targets.
  final List<CatalogTarget> catalogTargets;

  CrawlerTargets({
    this.s3Targets,
    this.jdbcTargets,
    this.dynamoDBTargets,
    this.catalogTargets,
  });
  static CrawlerTargets fromJson(Map<String, dynamic> json) => CrawlerTargets();
}

class CreateClassifierResponse {
  CreateClassifierResponse();
  static CreateClassifierResponse fromJson(Map<String, dynamic> json) =>
      CreateClassifierResponse();
}

class CreateConnectionResponse {
  CreateConnectionResponse();
  static CreateConnectionResponse fromJson(Map<String, dynamic> json) =>
      CreateConnectionResponse();
}

class CreateCrawlerResponse {
  CreateCrawlerResponse();
  static CreateCrawlerResponse fromJson(Map<String, dynamic> json) =>
      CreateCrawlerResponse();
}

class CreateCsvClassifierRequest {
  /// The name of the classifier.
  final String name;

  /// A custom symbol to denote what separates each column entry in the row.
  final String delimiter;

  /// A custom symbol to denote what combines content into a single column
  /// value. Must be different from the column delimiter.
  final String quoteSymbol;

  /// Indicates whether the CSV file contains a header.
  final String containsHeader;

  /// A list of strings representing column names.
  final List<String> header;

  /// Specifies not to trim values before identifying the type of column values.
  /// The default value is true.
  final bool disableValueTrimming;

  /// Enables the processing of files that contain only one column.
  final bool allowSingleColumn;

  CreateCsvClassifierRequest({
    @required this.name,
    this.delimiter,
    this.quoteSymbol,
    this.containsHeader,
    this.header,
    this.disableValueTrimming,
    this.allowSingleColumn,
  });
}

class CreateDatabaseResponse {
  CreateDatabaseResponse();
  static CreateDatabaseResponse fromJson(Map<String, dynamic> json) =>
      CreateDatabaseResponse();
}

class CreateDevEndpointResponse {
  /// The name assigned to the new `DevEndpoint`.
  final String endpointName;

  /// The current status of the new `DevEndpoint`.
  final String status;

  /// The security groups assigned to the new `DevEndpoint`.
  final List<String> securityGroupIds;

  /// The subnet ID assigned to the new `DevEndpoint`.
  final String subnetId;

  /// The Amazon Resource Name (ARN) of the role assigned to the new
  /// `DevEndpoint`.
  final String roleArn;

  /// The address of the YARN endpoint used by this `DevEndpoint`.
  final String yarnEndpointAddress;

  /// The Apache Zeppelin port for the remote Apache Spark interpreter.
  final int zeppelinRemoteSparkInterpreterPort;

  /// The number of AWS Glue Data Processing Units (DPUs) allocated to this
  /// DevEndpoint.
  final int numberOfNodes;

  /// The type of predefined worker that is allocated to the development
  /// endpoint. May be a value of Standard, G.1X, or G.2X.
  final String workerType;

  /// The number of workers of a defined `workerType` that are allocated to the
  /// development endpoint.
  final int numberOfWorkers;

  /// The AWS Availability Zone where this `DevEndpoint` is located.
  final String availabilityZone;

  /// The ID of the virtual private cloud (VPC) used by this `DevEndpoint`.
  final String vpcId;

  /// The paths to one or more Python libraries in an S3 bucket that will be
  /// loaded in your `DevEndpoint`.
  final String extraPythonLibsS3Path;

  /// Path to one or more Java `.jar` files in an S3 bucket that will be loaded
  /// in your `DevEndpoint`.
  final String extraJarsS3Path;

  /// The reason for a current failure in this `DevEndpoint`.
  final String failureReason;

  /// The name of the `SecurityConfiguration` structure being used with this
  /// `DevEndpoint`.
  final String securityConfiguration;

  /// The point in time at which this `DevEndpoint` was created.
  final DateTime createdTimestamp;

  /// The map of arguments used to configure this `DevEndpoint`.
  final Map<String, String> arguments;

  CreateDevEndpointResponse({
    this.endpointName,
    this.status,
    this.securityGroupIds,
    this.subnetId,
    this.roleArn,
    this.yarnEndpointAddress,
    this.zeppelinRemoteSparkInterpreterPort,
    this.numberOfNodes,
    this.workerType,
    this.numberOfWorkers,
    this.availabilityZone,
    this.vpcId,
    this.extraPythonLibsS3Path,
    this.extraJarsS3Path,
    this.failureReason,
    this.securityConfiguration,
    this.createdTimestamp,
    this.arguments,
  });
  static CreateDevEndpointResponse fromJson(Map<String, dynamic> json) =>
      CreateDevEndpointResponse();
}

class CreateGrokClassifierRequest {
  /// An identifier of the data format that the classifier matches, such as
  /// Twitter, JSON, Omniture logs, Amazon CloudWatch Logs, and so on.
  final String classification;

  /// The name of the new classifier.
  final String name;

  /// The grok pattern used by this classifier.
  final String grokPattern;

  /// Optional custom grok patterns used by this classifier.
  final String customPatterns;

  CreateGrokClassifierRequest({
    @required this.classification,
    @required this.name,
    @required this.grokPattern,
    this.customPatterns,
  });
}

class CreateJobResponse {
  /// The unique name that was provided for this job definition.
  final String name;

  CreateJobResponse({
    this.name,
  });
  static CreateJobResponse fromJson(Map<String, dynamic> json) =>
      CreateJobResponse();
}

class CreateJsonClassifierRequest {
  /// The name of the classifier.
  final String name;

  /// A `JsonPath` string defining the JSON data for the classifier to classify.
  /// AWS Glue supports a subset of `JsonPath`, as described in [Writing
  /// JsonPath Custom
  /// Classifiers](https://docs.aws.amazon.com/glue/latest/dg/custom-classifier.html#custom-classifier-json).
  final String jsonPath;

  CreateJsonClassifierRequest({
    @required this.name,
    @required this.jsonPath,
  });
}

class CreateMLTransformResponse {
  /// A unique identifier that is generated for the transform.
  final String transformId;

  CreateMLTransformResponse({
    this.transformId,
  });
  static CreateMLTransformResponse fromJson(Map<String, dynamic> json) =>
      CreateMLTransformResponse();
}

class CreatePartitionResponse {
  CreatePartitionResponse();
  static CreatePartitionResponse fromJson(Map<String, dynamic> json) =>
      CreatePartitionResponse();
}

class CreateScriptResponse {
  /// The Python script generated from the DAG.
  final String pythonScript;

  /// The Scala code generated from the DAG.
  final String scalaCode;

  CreateScriptResponse({
    this.pythonScript,
    this.scalaCode,
  });
  static CreateScriptResponse fromJson(Map<String, dynamic> json) =>
      CreateScriptResponse();
}

class CreateSecurityConfigurationResponse {
  /// The name assigned to the new security configuration.
  final String name;

  /// The time at which the new security configuration was created.
  final DateTime createdTimestamp;

  CreateSecurityConfigurationResponse({
    this.name,
    this.createdTimestamp,
  });
  static CreateSecurityConfigurationResponse fromJson(
          Map<String, dynamic> json) =>
      CreateSecurityConfigurationResponse();
}

class CreateTableResponse {
  CreateTableResponse();
  static CreateTableResponse fromJson(Map<String, dynamic> json) =>
      CreateTableResponse();
}

class CreateTriggerResponse {
  /// The name of the trigger.
  final String name;

  CreateTriggerResponse({
    this.name,
  });
  static CreateTriggerResponse fromJson(Map<String, dynamic> json) =>
      CreateTriggerResponse();
}

class CreateUserDefinedFunctionResponse {
  CreateUserDefinedFunctionResponse();
  static CreateUserDefinedFunctionResponse fromJson(
          Map<String, dynamic> json) =>
      CreateUserDefinedFunctionResponse();
}

class CreateWorkflowResponse {
  /// The name of the workflow which was provided as part of the request.
  final String name;

  CreateWorkflowResponse({
    this.name,
  });
  static CreateWorkflowResponse fromJson(Map<String, dynamic> json) =>
      CreateWorkflowResponse();
}

class CreateXmlClassifierRequest {
  /// An identifier of the data format that the classifier matches.
  final String classification;

  /// The name of the classifier.
  final String name;

  /// The XML tag designating the element that contains each record in an XML
  /// document being parsed. This can't identify a self-closing element (closed
  /// by `/>`). An empty row element that contains only attributes can be parsed
  /// as long as it ends with a closing tag (for example, `<row item\_a="A"
  /// item\_b="B"></row>` is okay, but `<row item\_a="A" item\_b="B" />` is
  /// not).
  final String rowTag;

  CreateXmlClassifierRequest({
    @required this.classification,
    @required this.name,
    this.rowTag,
  });
}

class CsvClassifier {
  /// The name of the classifier.
  final String name;

  /// The time that this classifier was registered.
  final DateTime creationTime;

  /// The time that this classifier was last updated.
  final DateTime lastUpdated;

  /// The version of this classifier.
  final BigInt version;

  /// A custom symbol to denote what separates each column entry in the row.
  final String delimiter;

  /// A custom symbol to denote what combines content into a single column
  /// value. It must be different from the column delimiter.
  final String quoteSymbol;

  /// Indicates whether the CSV file contains a header.
  final String containsHeader;

  /// A list of strings representing column names.
  final List<String> header;

  /// Specifies not to trim values before identifying the type of column values.
  /// The default value is `true`.
  final bool disableValueTrimming;

  /// Enables the processing of files that contain only one column.
  final bool allowSingleColumn;

  CsvClassifier({
    @required this.name,
    this.creationTime,
    this.lastUpdated,
    this.version,
    this.delimiter,
    this.quoteSymbol,
    this.containsHeader,
    this.header,
    this.disableValueTrimming,
    this.allowSingleColumn,
  });
  static CsvClassifier fromJson(Map<String, dynamic> json) => CsvClassifier();
}

class DataCatalogEncryptionSettings {
  /// Specifies the encryption-at-rest configuration for the Data Catalog.
  final EncryptionAtRest encryptionAtRest;

  /// When connection password protection is enabled, the Data Catalog uses a
  /// customer-provided key to encrypt the password as part of
  /// `CreateConnection` or `UpdateConnection` and store it in the
  /// `ENCRYPTED_PASSWORD` field in the connection properties. You can enable
  /// catalog encryption or only password encryption.
  final ConnectionPasswordEncryption connectionPasswordEncryption;

  DataCatalogEncryptionSettings({
    this.encryptionAtRest,
    this.connectionPasswordEncryption,
  });
  static DataCatalogEncryptionSettings fromJson(Map<String, dynamic> json) =>
      DataCatalogEncryptionSettings();
}

class DataLakePrincipal {
  /// An identifier for the AWS Lake Formation principal.
  final String dataLakePrincipalIdentifier;

  DataLakePrincipal({
    this.dataLakePrincipalIdentifier,
  });
  static DataLakePrincipal fromJson(Map<String, dynamic> json) =>
      DataLakePrincipal();
}

class Database {
  /// The name of the database. For Hive compatibility, this is folded to
  /// lowercase when it is stored.
  final String name;

  /// A description of the database.
  final String description;

  /// The location of the database (for example, an HDFS path).
  final String locationUri;

  /// These key-value pairs define parameters and properties of the database.
  final Map<String, String> parameters;

  /// The time at which the metadata database was created in the catalog.
  final DateTime createTime;

  /// Creates a set of default permissions on the table for principals.
  final List<PrincipalPermissions> createTableDefaultPermissions;

  Database({
    @required this.name,
    this.description,
    this.locationUri,
    this.parameters,
    this.createTime,
    this.createTableDefaultPermissions,
  });
  static Database fromJson(Map<String, dynamic> json) => Database();
}

class DatabaseInput {
  /// The name of the database. For Hive compatibility, this is folded to
  /// lowercase when it is stored.
  final String name;

  /// A description of the database.
  final String description;

  /// The location of the database (for example, an HDFS path).
  final String locationUri;

  /// These key-value pairs define parameters and properties of the database.
  ///
  /// These key-value pairs define parameters and properties of the database.
  final Map<String, String> parameters;

  /// Creates a set of default permissions on the table for principals.
  final List<PrincipalPermissions> createTableDefaultPermissions;

  DatabaseInput({
    @required this.name,
    this.description,
    this.locationUri,
    this.parameters,
    this.createTableDefaultPermissions,
  });
}

class DeleteClassifierResponse {
  DeleteClassifierResponse();
  static DeleteClassifierResponse fromJson(Map<String, dynamic> json) =>
      DeleteClassifierResponse();
}

class DeleteConnectionResponse {
  DeleteConnectionResponse();
  static DeleteConnectionResponse fromJson(Map<String, dynamic> json) =>
      DeleteConnectionResponse();
}

class DeleteCrawlerResponse {
  DeleteCrawlerResponse();
  static DeleteCrawlerResponse fromJson(Map<String, dynamic> json) =>
      DeleteCrawlerResponse();
}

class DeleteDatabaseResponse {
  DeleteDatabaseResponse();
  static DeleteDatabaseResponse fromJson(Map<String, dynamic> json) =>
      DeleteDatabaseResponse();
}

class DeleteDevEndpointResponse {
  DeleteDevEndpointResponse();
  static DeleteDevEndpointResponse fromJson(Map<String, dynamic> json) =>
      DeleteDevEndpointResponse();
}

class DeleteJobResponse {
  /// The name of the job definition that was deleted.
  final String jobName;

  DeleteJobResponse({
    this.jobName,
  });
  static DeleteJobResponse fromJson(Map<String, dynamic> json) =>
      DeleteJobResponse();
}

class DeleteMLTransformResponse {
  /// The unique identifier of the transform that was deleted.
  final String transformId;

  DeleteMLTransformResponse({
    this.transformId,
  });
  static DeleteMLTransformResponse fromJson(Map<String, dynamic> json) =>
      DeleteMLTransformResponse();
}

class DeletePartitionResponse {
  DeletePartitionResponse();
  static DeletePartitionResponse fromJson(Map<String, dynamic> json) =>
      DeletePartitionResponse();
}

class DeleteResourcePolicyResponse {
  DeleteResourcePolicyResponse();
  static DeleteResourcePolicyResponse fromJson(Map<String, dynamic> json) =>
      DeleteResourcePolicyResponse();
}

class DeleteSecurityConfigurationResponse {
  DeleteSecurityConfigurationResponse();
  static DeleteSecurityConfigurationResponse fromJson(
          Map<String, dynamic> json) =>
      DeleteSecurityConfigurationResponse();
}

class DeleteTableResponse {
  DeleteTableResponse();
  static DeleteTableResponse fromJson(Map<String, dynamic> json) =>
      DeleteTableResponse();
}

class DeleteTableVersionResponse {
  DeleteTableVersionResponse();
  static DeleteTableVersionResponse fromJson(Map<String, dynamic> json) =>
      DeleteTableVersionResponse();
}

class DeleteTriggerResponse {
  /// The name of the trigger that was deleted.
  final String name;

  DeleteTriggerResponse({
    this.name,
  });
  static DeleteTriggerResponse fromJson(Map<String, dynamic> json) =>
      DeleteTriggerResponse();
}

class DeleteUserDefinedFunctionResponse {
  DeleteUserDefinedFunctionResponse();
  static DeleteUserDefinedFunctionResponse fromJson(
          Map<String, dynamic> json) =>
      DeleteUserDefinedFunctionResponse();
}

class DeleteWorkflowResponse {
  /// Name of the workflow specified in input.
  final String name;

  DeleteWorkflowResponse({
    this.name,
  });
  static DeleteWorkflowResponse fromJson(Map<String, dynamic> json) =>
      DeleteWorkflowResponse();
}

class DevEndpoint {
  /// The name of the `DevEndpoint`.
  final String endpointName;

  /// The Amazon Resource Name (ARN) of the IAM role used in this `DevEndpoint`.
  final String roleArn;

  /// A list of security group identifiers used in this `DevEndpoint`.
  final List<String> securityGroupIds;

  /// The subnet ID for this `DevEndpoint`.
  final String subnetId;

  /// The YARN endpoint address used by this `DevEndpoint`.
  final String yarnEndpointAddress;

  /// A private IP address to access the `DevEndpoint` within a VPC if the
  /// `DevEndpoint` is created within one. The `PrivateAddress` field is present
  /// only when you create the `DevEndpoint` within your VPC.
  final String privateAddress;

  /// The Apache Zeppelin port for the remote Apache Spark interpreter.
  final int zeppelinRemoteSparkInterpreterPort;

  /// The public IP address used by this `DevEndpoint`. The `PublicAddress`
  /// field is present only when you create a non-virtual private cloud (VPC)
  /// `DevEndpoint`.
  final String publicAddress;

  /// The current status of this `DevEndpoint`.
  final String status;

  /// The type of predefined worker that is allocated to the development
  /// endpoint. Accepts a value of Standard, G.1X, or G.2X.
  ///
  /// *   For the `Standard` worker type, each worker provides 4 vCPU, 16 GB of
  /// memory and a 50GB disk, and 2 executors per worker.
  ///
  /// *   For the `G.1X` worker type, each worker maps to 1 DPU (4 vCPU, 16 GB
  /// of memory, 64 GB disk), and provides 1 executor per worker. We recommend
  /// this worker type for memory-intensive jobs.
  ///
  /// *   For the `G.2X` worker type, each worker maps to 2 DPU (8 vCPU, 32 GB
  /// of memory, 128 GB disk), and provides 1 executor per worker. We recommend
  /// this worker type for memory-intensive jobs.
  ///
  ///
  /// Known issue: when a development endpoint is created with the `G.2X`
  /// `WorkerType` configuration, the Spark drivers for the development endpoint
  /// will run on 4 vCPU, 16 GB of memory, and a 64 GB disk.
  final String workerType;

  /// The number of workers of a defined `workerType` that are allocated to the
  /// development endpoint.
  ///
  /// The maximum number of workers you can define are 299 for `G.1X`, and 149
  /// for `G.2X`.
  final int numberOfWorkers;

  /// The number of AWS Glue Data Processing Units (DPUs) allocated to this
  /// `DevEndpoint`.
  final int numberOfNodes;

  /// The AWS Availability Zone where this `DevEndpoint` is located.
  final String availabilityZone;

  /// The ID of the virtual private cloud (VPC) used by this `DevEndpoint`.
  final String vpcId;

  /// The paths to one or more Python libraries in an Amazon S3 bucket that
  /// should be loaded in your `DevEndpoint`. Multiple values must be complete
  /// paths separated by a comma.
  ///
  ///
  ///
  /// You can only use pure Python libraries with a `DevEndpoint`. Libraries
  /// that rely on C extensions, such as the [pandas](http://pandas.pydata.org/)
  /// Python data analysis library, are not currently supported.
  final String extraPythonLibsS3Path;

  /// The path to one or more Java `.jar` files in an S3 bucket that should be
  /// loaded in your `DevEndpoint`.
  ///
  ///
  ///
  /// You can only use pure Java/Scala libraries with a `DevEndpoint`.
  final String extraJarsS3Path;

  /// The reason for a current failure in this `DevEndpoint`.
  final String failureReason;

  /// The status of the last update.
  final String lastUpdateStatus;

  /// The point in time at which this DevEndpoint was created.
  final DateTime createdTimestamp;

  /// The point in time at which this `DevEndpoint` was last modified.
  final DateTime lastModifiedTimestamp;

  /// The public key to be used by this `DevEndpoint` for authentication. This
  /// attribute is provided for backward compatibility because the recommended
  /// attribute to use is public keys.
  final String publicKey;

  /// A list of public keys to be used by the `DevEndpoints` for authentication.
  /// Using this attribute is preferred over a single public key because the
  /// public keys allow you to have a different private key per client.
  ///
  ///
  ///
  /// If you previously created an endpoint with a public key, you must remove
  /// that key to be able to set a list of public keys. Call the
  /// `UpdateDevEndpoint` API operation with the public key content in the
  /// `deletePublicKeys` attribute, and the list of new keys in the
  /// `addPublicKeys` attribute.
  final List<String> publicKeys;

  /// The name of the `SecurityConfiguration` structure to be used with this
  /// `DevEndpoint`.
  final String securityConfiguration;

  /// A map of arguments used to configure the `DevEndpoint`.
  ///
  /// Currently, only `"--enable-glue-datacatalog": ""` is supported as a valid
  /// argument.
  final Map<String, String> arguments;

  DevEndpoint({
    this.endpointName,
    this.roleArn,
    this.securityGroupIds,
    this.subnetId,
    this.yarnEndpointAddress,
    this.privateAddress,
    this.zeppelinRemoteSparkInterpreterPort,
    this.publicAddress,
    this.status,
    this.workerType,
    this.numberOfWorkers,
    this.numberOfNodes,
    this.availabilityZone,
    this.vpcId,
    this.extraPythonLibsS3Path,
    this.extraJarsS3Path,
    this.failureReason,
    this.lastUpdateStatus,
    this.createdTimestamp,
    this.lastModifiedTimestamp,
    this.publicKey,
    this.publicKeys,
    this.securityConfiguration,
    this.arguments,
  });
  static DevEndpoint fromJson(Map<String, dynamic> json) => DevEndpoint();
}

class DevEndpointCustomLibraries {
  /// The paths to one or more Python libraries in an Amazon Simple Storage
  /// Service (Amazon S3) bucket that should be loaded in your `DevEndpoint`.
  /// Multiple values must be complete paths separated by a comma.
  ///
  ///
  ///
  /// You can only use pure Python libraries with a `DevEndpoint`. Libraries
  /// that rely on C extensions, such as the [pandas](http://pandas.pydata.org/)
  /// Python data analysis library, are not currently supported.
  final String extraPythonLibsS3Path;

  /// The path to one or more Java `.jar` files in an S3 bucket that should be
  /// loaded in your `DevEndpoint`.
  ///
  ///
  ///
  /// You can only use pure Java/Scala libraries with a `DevEndpoint`.
  final String extraJarsS3Path;

  DevEndpointCustomLibraries({
    this.extraPythonLibsS3Path,
    this.extraJarsS3Path,
  });
}

class DynamoDBTarget {
  /// The name of the DynamoDB table to crawl.
  final String path;

  DynamoDBTarget({
    this.path,
  });
  static DynamoDBTarget fromJson(Map<String, dynamic> json) => DynamoDBTarget();
}

class Edge {
  /// The unique of the node within the workflow where the edge starts.
  final String sourceId;

  /// The unique of the node within the workflow where the edge ends.
  final String destinationId;

  Edge({
    this.sourceId,
    this.destinationId,
  });
  static Edge fromJson(Map<String, dynamic> json) => Edge();
}

class EncryptionAtRest {
  /// The encryption-at-rest mode for encrypting Data Catalog data.
  final String catalogEncryptionMode;

  /// The ID of the AWS KMS key to use for encryption at rest.
  final String sseAwsKmsKeyId;

  EncryptionAtRest({
    @required this.catalogEncryptionMode,
    this.sseAwsKmsKeyId,
  });
  static EncryptionAtRest fromJson(Map<String, dynamic> json) =>
      EncryptionAtRest();
}

class EncryptionConfiguration {
  /// The encryption configuration for Amazon Simple Storage Service (Amazon S3)
  /// data.
  final List<S3Encryption> s3Encryption;

  /// The encryption configuration for Amazon CloudWatch.
  final CloudWatchEncryption cloudWatchEncryption;

  /// The encryption configuration for job bookmarks.
  final JobBookmarksEncryption jobBookmarksEncryption;

  EncryptionConfiguration({
    this.s3Encryption,
    this.cloudWatchEncryption,
    this.jobBookmarksEncryption,
  });
  static EncryptionConfiguration fromJson(Map<String, dynamic> json) =>
      EncryptionConfiguration();
}

class ErrorDetail {
  /// The code associated with this error.
  final String errorCode;

  /// A message describing the error.
  final String errorMessage;

  ErrorDetail({
    this.errorCode,
    this.errorMessage,
  });
  static ErrorDetail fromJson(Map<String, dynamic> json) => ErrorDetail();
}

class EvaluationMetrics {
  /// The type of machine learning transform.
  final String transformType;

  /// The evaluation metrics for the find matches algorithm.
  final FindMatchesMetrics findMatchesMetrics;

  EvaluationMetrics({
    @required this.transformType,
    this.findMatchesMetrics,
  });
  static EvaluationMetrics fromJson(Map<String, dynamic> json) =>
      EvaluationMetrics();
}

class ExecutionProperty {
  /// The maximum number of concurrent runs allowed for the job. The default is
  /// 1. An error is returned when this threshold is reached. The maximum value
  /// you can specify is controlled by a service limit.
  final int maxConcurrentRuns;

  ExecutionProperty({
    this.maxConcurrentRuns,
  });
  static ExecutionProperty fromJson(Map<String, dynamic> json) =>
      ExecutionProperty();
}

class ExportLabelsTaskRunProperties {
  /// The Amazon Simple Storage Service (Amazon S3) path where you will export
  /// the labels.
  final String outputS3Path;

  ExportLabelsTaskRunProperties({
    this.outputS3Path,
  });
  static ExportLabelsTaskRunProperties fromJson(Map<String, dynamic> json) =>
      ExportLabelsTaskRunProperties();
}

class FindMatchesMetrics {
  /// The area under the precision/recall curve (AUPRC) is a single number
  /// measuring the overall quality of the transform, that is independent of the
  /// choice made for precision vs. recall. Higher values indicate that you have
  /// a more attractive precision vs. recall tradeoff.
  ///
  /// For more information, see [Precision and
  /// recall](https://en.wikipedia.org/wiki/Precision_and_recall) in Wikipedia.
  final double areaUnderPRCurve;

  /// The precision metric indicates when often your transform is correct when
  /// it predicts a match. Specifically, it measures how well the transform
  /// finds true positives from the total true positives possible.
  ///
  /// For more information, see [Precision and
  /// recall](https://en.wikipedia.org/wiki/Precision_and_recall) in Wikipedia.
  final double precision;

  /// The recall metric indicates that for an actual match, how often your
  /// transform predicts the match. Specifically, it measures how well the
  /// transform finds true positives from the total records in the source data.
  ///
  /// For more information, see [Precision and
  /// recall](https://en.wikipedia.org/wiki/Precision_and_recall) in Wikipedia.
  final double recall;

  /// The maximum F1 metric indicates the transform's accuracy between 0 and 1,
  /// where 1 is the best accuracy.
  ///
  /// For more information, see [F1
  /// score](https://en.wikipedia.org/wiki/F1_score) in Wikipedia.
  final double f1;

  /// The confusion matrix shows you what your transform is predicting
  /// accurately and what types of errors it is making.
  ///
  /// For more information, see [Confusion
  /// matrix](https://en.wikipedia.org/wiki/Confusion_matrix) in Wikipedia.
  final ConfusionMatrix confusionMatrix;

  FindMatchesMetrics({
    this.areaUnderPRCurve,
    this.precision,
    this.recall,
    this.f1,
    this.confusionMatrix,
  });
  static FindMatchesMetrics fromJson(Map<String, dynamic> json) =>
      FindMatchesMetrics();
}

class FindMatchesParameters {
  /// The name of a column that uniquely identifies rows in the source table.
  /// Used to help identify matching records.
  final String primaryKeyColumnName;

  /// The value selected when tuning your transform for a balance between
  /// precision and recall. A value of 0.5 means no preference; a value of 1.0
  /// means a bias purely for precision, and a value of 0.0 means a bias for
  /// recall. Because this is a tradeoff, choosing values close to 1.0 means
  /// very low recall, and choosing values close to 0.0 results in very low
  /// precision.
  ///
  /// The precision metric indicates how often your model is correct when it
  /// predicts a match.
  ///
  /// The recall metric indicates that for an actual match, how often your model
  /// predicts the match.
  final double precisionRecallTradeoff;

  /// The value that is selected when tuning your transform for a balance
  /// between accuracy and cost. A value of 0.5 means that the system balances
  /// accuracy and cost concerns. A value of 1.0 means a bias purely for
  /// accuracy, which typically results in a higher cost, sometimes
  /// substantially higher. A value of 0.0 means a bias purely for cost, which
  /// results in a less accurate `FindMatches` transform, sometimes with
  /// unacceptable accuracy.
  ///
  /// Accuracy measures how well the transform finds true positives and true
  /// negatives. Increasing accuracy requires more machine resources and cost.
  /// But it also results in increased recall.
  ///
  /// Cost measures how many compute resources, and thus money, are consumed to
  /// run the transform.
  final double accuracyCostTradeoff;

  /// The value to switch on or off to force the output to match the provided
  /// labels from users. If the value is `True`, the `find matches` transform
  /// forces the output to match the provided labels. The results override the
  /// normal conflation results. If the value is `False`, the `find matches`
  /// transform does not ensure all the labels provided are respected, and the
  /// results rely on the trained model.
  ///
  /// Note that setting this value to true may increase the conflation execution
  /// time.
  final bool enforceProvidedLabels;

  FindMatchesParameters({
    this.primaryKeyColumnName,
    this.precisionRecallTradeoff,
    this.accuracyCostTradeoff,
    this.enforceProvidedLabels,
  });
  static FindMatchesParameters fromJson(Map<String, dynamic> json) =>
      FindMatchesParameters();
}

class FindMatchesTaskRunProperties {
  /// The job ID for the Find Matches task run.
  final String jobId;

  /// The name assigned to the job for the Find Matches task run.
  final String jobName;

  /// The job run ID for the Find Matches task run.
  final String jobRunId;

  FindMatchesTaskRunProperties({
    this.jobId,
    this.jobName,
    this.jobRunId,
  });
  static FindMatchesTaskRunProperties fromJson(Map<String, dynamic> json) =>
      FindMatchesTaskRunProperties();
}

class GetCatalogImportStatusResponse {
  /// The status of the specified catalog migration.
  final CatalogImportStatus importStatus;

  GetCatalogImportStatusResponse({
    this.importStatus,
  });
  static GetCatalogImportStatusResponse fromJson(Map<String, dynamic> json) =>
      GetCatalogImportStatusResponse();
}

class GetClassifierResponse {
  /// The requested classifier.
  final Classifier classifier;

  GetClassifierResponse({
    this.classifier,
  });
  static GetClassifierResponse fromJson(Map<String, dynamic> json) =>
      GetClassifierResponse();
}

class GetClassifiersResponse {
  /// The requested list of classifier objects.
  final List<Classifier> classifiers;

  /// A continuation token.
  final String nextToken;

  GetClassifiersResponse({
    this.classifiers,
    this.nextToken,
  });
  static GetClassifiersResponse fromJson(Map<String, dynamic> json) =>
      GetClassifiersResponse();
}

class GetConnectionResponse {
  /// The requested connection definition.
  final Connection connection;

  GetConnectionResponse({
    this.connection,
  });
  static GetConnectionResponse fromJson(Map<String, dynamic> json) =>
      GetConnectionResponse();
}

class GetConnectionsFilter {
  /// A criteria string that must match the criteria recorded in the connection
  /// definition for that connection definition to be returned.
  final List<String> matchCriteria;

  /// The type of connections to return. Currently, only JDBC is supported; SFTP
  /// is not supported.
  final String connectionType;

  GetConnectionsFilter({
    this.matchCriteria,
    this.connectionType,
  });
}

class GetConnectionsResponse {
  /// A list of requested connection definitions.
  final List<Connection> connectionList;

  /// A continuation token, if the list of connections returned does not include
  /// the last of the filtered connections.
  final String nextToken;

  GetConnectionsResponse({
    this.connectionList,
    this.nextToken,
  });
  static GetConnectionsResponse fromJson(Map<String, dynamic> json) =>
      GetConnectionsResponse();
}

class GetCrawlerMetricsResponse {
  /// A list of metrics for the specified crawler.
  final List<CrawlerMetrics> crawlerMetricsList;

  /// A continuation token, if the returned list does not contain the last
  /// metric available.
  final String nextToken;

  GetCrawlerMetricsResponse({
    this.crawlerMetricsList,
    this.nextToken,
  });
  static GetCrawlerMetricsResponse fromJson(Map<String, dynamic> json) =>
      GetCrawlerMetricsResponse();
}

class GetCrawlerResponse {
  /// The metadata for the specified crawler.
  final Crawler crawler;

  GetCrawlerResponse({
    this.crawler,
  });
  static GetCrawlerResponse fromJson(Map<String, dynamic> json) =>
      GetCrawlerResponse();
}

class GetCrawlersResponse {
  /// A list of crawler metadata.
  final List<Crawler> crawlers;

  /// A continuation token, if the returned list has not reached the end of
  /// those defined in this customer account.
  final String nextToken;

  GetCrawlersResponse({
    this.crawlers,
    this.nextToken,
  });
  static GetCrawlersResponse fromJson(Map<String, dynamic> json) =>
      GetCrawlersResponse();
}

class GetDataCatalogEncryptionSettingsResponse {
  /// The requested security configuration.
  final DataCatalogEncryptionSettings dataCatalogEncryptionSettings;

  GetDataCatalogEncryptionSettingsResponse({
    this.dataCatalogEncryptionSettings,
  });
  static GetDataCatalogEncryptionSettingsResponse fromJson(
          Map<String, dynamic> json) =>
      GetDataCatalogEncryptionSettingsResponse();
}

class GetDatabaseResponse {
  /// The definition of the specified database in the Data Catalog.
  final Database database;

  GetDatabaseResponse({
    this.database,
  });
  static GetDatabaseResponse fromJson(Map<String, dynamic> json) =>
      GetDatabaseResponse();
}

class GetDatabasesResponse {
  /// A list of `Database` objects from the specified catalog.
  final List<Database> databaseList;

  /// A continuation token for paginating the returned list of tokens, returned
  /// if the current segment of the list is not the last.
  final String nextToken;

  GetDatabasesResponse({
    @required this.databaseList,
    this.nextToken,
  });
  static GetDatabasesResponse fromJson(Map<String, dynamic> json) =>
      GetDatabasesResponse();
}

class GetDataflowGraphResponse {
  /// A list of the nodes in the resulting DAG.
  final List<CodeGenNode> dagNodes;

  /// A list of the edges in the resulting DAG.
  final List<CodeGenEdge> dagEdges;

  GetDataflowGraphResponse({
    this.dagNodes,
    this.dagEdges,
  });
  static GetDataflowGraphResponse fromJson(Map<String, dynamic> json) =>
      GetDataflowGraphResponse();
}

class GetDevEndpointResponse {
  /// A `DevEndpoint` definition.
  final DevEndpoint devEndpoint;

  GetDevEndpointResponse({
    this.devEndpoint,
  });
  static GetDevEndpointResponse fromJson(Map<String, dynamic> json) =>
      GetDevEndpointResponse();
}

class GetDevEndpointsResponse {
  /// A list of `DevEndpoint` definitions.
  final List<DevEndpoint> devEndpoints;

  /// A continuation token, if not all `DevEndpoint` definitions have yet been
  /// returned.
  final String nextToken;

  GetDevEndpointsResponse({
    this.devEndpoints,
    this.nextToken,
  });
  static GetDevEndpointsResponse fromJson(Map<String, dynamic> json) =>
      GetDevEndpointsResponse();
}

class GetJobBookmarkResponse {
  /// A structure that defines a point that a job can resume processing.
  final JobBookmarkEntry jobBookmarkEntry;

  GetJobBookmarkResponse({
    this.jobBookmarkEntry,
  });
  static GetJobBookmarkResponse fromJson(Map<String, dynamic> json) =>
      GetJobBookmarkResponse();
}

class GetJobResponse {
  /// The requested job definition.
  final Job job;

  GetJobResponse({
    this.job,
  });
  static GetJobResponse fromJson(Map<String, dynamic> json) => GetJobResponse();
}

class GetJobRunResponse {
  /// The requested job-run metadata.
  final JobRun jobRun;

  GetJobRunResponse({
    this.jobRun,
  });
  static GetJobRunResponse fromJson(Map<String, dynamic> json) =>
      GetJobRunResponse();
}

class GetJobRunsResponse {
  /// A list of job-run metadata objects.
  final List<JobRun> jobRuns;

  /// A continuation token, if not all requested job runs have been returned.
  final String nextToken;

  GetJobRunsResponse({
    this.jobRuns,
    this.nextToken,
  });
  static GetJobRunsResponse fromJson(Map<String, dynamic> json) =>
      GetJobRunsResponse();
}

class GetJobsResponse {
  /// A list of job definitions.
  final List<Job> jobs;

  /// A continuation token, if not all job definitions have yet been returned.
  final String nextToken;

  GetJobsResponse({
    this.jobs,
    this.nextToken,
  });
  static GetJobsResponse fromJson(Map<String, dynamic> json) =>
      GetJobsResponse();
}

class GetMLTaskRunResponse {
  /// The unique identifier of the task run.
  final String transformId;

  /// The unique run identifier associated with this run.
  final String taskRunId;

  /// The status for this task run.
  final String status;

  /// The names of the log groups that are associated with the task run.
  final String logGroupName;

  /// The list of properties that are associated with the task run.
  final TaskRunProperties properties;

  /// The error strings that are associated with the task run.
  final String errorString;

  /// The date and time when this task run started.
  final DateTime startedOn;

  /// The date and time when this task run was last modified.
  final DateTime lastModifiedOn;

  /// The date and time when this task run was completed.
  final DateTime completedOn;

  /// The amount of time (in seconds) that the task run consumed resources.
  final int executionTime;

  GetMLTaskRunResponse({
    this.transformId,
    this.taskRunId,
    this.status,
    this.logGroupName,
    this.properties,
    this.errorString,
    this.startedOn,
    this.lastModifiedOn,
    this.completedOn,
    this.executionTime,
  });
  static GetMLTaskRunResponse fromJson(Map<String, dynamic> json) =>
      GetMLTaskRunResponse();
}

class GetMLTaskRunsResponse {
  /// A list of task runs that are associated with the transform.
  final List<TaskRun> taskRuns;

  /// A pagination token, if more results are available.
  final String nextToken;

  GetMLTaskRunsResponse({
    this.taskRuns,
    this.nextToken,
  });
  static GetMLTaskRunsResponse fromJson(Map<String, dynamic> json) =>
      GetMLTaskRunsResponse();
}

class GetMLTransformResponse {
  /// The unique identifier of the transform, generated at the time that the
  /// transform was created.
  final String transformId;

  /// The unique name given to the transform when it was created.
  final String name;

  /// A description of the transform.
  final String description;

  /// The last known status of the transform (to indicate whether it can be used
  /// or not). One of "NOT_READY", "READY", or "DELETING".
  final String status;

  /// The date and time when the transform was created.
  final DateTime createdOn;

  /// The date and time when the transform was last modified.
  final DateTime lastModifiedOn;

  /// A list of AWS Glue table definitions used by the transform.
  final List<GlueTable> inputRecordTables;

  /// The configuration parameters that are specific to the algorithm used.
  final TransformParameters parameters;

  /// The latest evaluation metrics.
  final EvaluationMetrics evaluationMetrics;

  /// The number of labels available for this transform.
  final int labelCount;

  /// The `Map<Column, Type>` object that represents the schema that this
  /// transform accepts. Has an upper bound of 100 columns.
  final List<SchemaColumn> schema;

  /// The name or Amazon Resource Name (ARN) of the IAM role with the required
  /// permissions.
  final String role;

  /// The number of AWS Glue data processing units (DPUs) that are allocated to
  /// task runs for this transform. You can allocate from 2 to 100 DPUs; the
  /// default is 10. A DPU is a relative measure of processing power that
  /// consists of 4 vCPUs of compute capacity and 16 GB of memory. For more
  /// information, see the [AWS Glue pricing
  /// page](https://aws.amazon.com/glue/pricing/).
  ///
  /// When the `WorkerType` field is set to a value other than `Standard`, the
  /// `MaxCapacity` field is set automatically and becomes read-only.
  final double maxCapacity;

  /// The type of predefined worker that is allocated when this task runs.
  /// Accepts a value of Standard, G.1X, or G.2X.
  ///
  /// *   For the `Standard` worker type, each worker provides 4 vCPU, 16 GB of
  /// memory and a 50GB disk, and 2 executors per worker.
  ///
  /// *   For the `G.1X` worker type, each worker provides 4 vCPU, 16 GB of
  /// memory and a 64GB disk, and 1 executor per worker.
  ///
  /// *   For the `G.2X` worker type, each worker provides 8 vCPU, 32 GB of
  /// memory and a 128GB disk, and 1 executor per worker.
  final String workerType;

  /// The number of workers of a defined `workerType` that are allocated when
  /// this task runs.
  final int numberOfWorkers;

  /// The timeout for a task run for this transform in minutes. This is the
  /// maximum time that a task run for this transform can consume resources
  /// before it is terminated and enters `TIMEOUT` status. The default is 2,880
  /// minutes (48 hours).
  final int timeout;

  /// The maximum number of times to retry a task for this transform after a
  /// task run fails.
  final int maxRetries;

  GetMLTransformResponse({
    this.transformId,
    this.name,
    this.description,
    this.status,
    this.createdOn,
    this.lastModifiedOn,
    this.inputRecordTables,
    this.parameters,
    this.evaluationMetrics,
    this.labelCount,
    this.schema,
    this.role,
    this.maxCapacity,
    this.workerType,
    this.numberOfWorkers,
    this.timeout,
    this.maxRetries,
  });
  static GetMLTransformResponse fromJson(Map<String, dynamic> json) =>
      GetMLTransformResponse();
}

class GetMLTransformsResponse {
  /// A list of machine learning transforms.
  final List<MLTransform> transforms;

  /// A pagination token, if more results are available.
  final String nextToken;

  GetMLTransformsResponse({
    @required this.transforms,
    this.nextToken,
  });
  static GetMLTransformsResponse fromJson(Map<String, dynamic> json) =>
      GetMLTransformsResponse();
}

class GetMappingResponse {
  /// A list of mappings to the specified targets.
  final List<MappingEntry> mapping;

  GetMappingResponse({
    @required this.mapping,
  });
  static GetMappingResponse fromJson(Map<String, dynamic> json) =>
      GetMappingResponse();
}

class GetPartitionResponse {
  /// The requested information, in the form of a `Partition` object.
  final Partition partition;

  GetPartitionResponse({
    this.partition,
  });
  static GetPartitionResponse fromJson(Map<String, dynamic> json) =>
      GetPartitionResponse();
}

class GetPartitionsResponse {
  /// A list of requested partitions.
  final List<Partition> partitions;

  /// A continuation token, if the returned list of partitions does not include
  /// the last one.
  final String nextToken;

  GetPartitionsResponse({
    this.partitions,
    this.nextToken,
  });
  static GetPartitionsResponse fromJson(Map<String, dynamic> json) =>
      GetPartitionsResponse();
}

class GetPlanResponse {
  /// A Python script to perform the mapping.
  final String pythonScript;

  /// The Scala code to perform the mapping.
  final String scalaCode;

  GetPlanResponse({
    this.pythonScript,
    this.scalaCode,
  });
  static GetPlanResponse fromJson(Map<String, dynamic> json) =>
      GetPlanResponse();
}

class GetResourcePolicyResponse {
  /// Contains the requested policy document, in JSON format.
  final String policyInJson;

  /// Contains the hash value associated with this policy.
  final String policyHash;

  /// The date and time at which the policy was created.
  final DateTime createTime;

  /// The date and time at which the policy was last updated.
  final DateTime updateTime;

  GetResourcePolicyResponse({
    this.policyInJson,
    this.policyHash,
    this.createTime,
    this.updateTime,
  });
  static GetResourcePolicyResponse fromJson(Map<String, dynamic> json) =>
      GetResourcePolicyResponse();
}

class GetSecurityConfigurationResponse {
  /// The requested security configuration.
  final SecurityConfiguration securityConfiguration;

  GetSecurityConfigurationResponse({
    this.securityConfiguration,
  });
  static GetSecurityConfigurationResponse fromJson(Map<String, dynamic> json) =>
      GetSecurityConfigurationResponse();
}

class GetSecurityConfigurationsResponse {
  /// A list of security configurations.
  final List<SecurityConfiguration> securityConfigurations;

  /// A continuation token, if there are more security configurations to return.
  final String nextToken;

  GetSecurityConfigurationsResponse({
    this.securityConfigurations,
    this.nextToken,
  });
  static GetSecurityConfigurationsResponse fromJson(
          Map<String, dynamic> json) =>
      GetSecurityConfigurationsResponse();
}

class GetTableResponse {
  /// The `Table` object that defines the specified table.
  final Table table;

  GetTableResponse({
    this.table,
  });
  static GetTableResponse fromJson(Map<String, dynamic> json) =>
      GetTableResponse();
}

class GetTableVersionResponse {
  /// The requested table version.
  final TableVersion tableVersion;

  GetTableVersionResponse({
    this.tableVersion,
  });
  static GetTableVersionResponse fromJson(Map<String, dynamic> json) =>
      GetTableVersionResponse();
}

class GetTableVersionsResponse {
  /// A list of strings identifying available versions of the specified table.
  final List<TableVersion> tableVersions;

  /// A continuation token, if the list of available versions does not include
  /// the last one.
  final String nextToken;

  GetTableVersionsResponse({
    this.tableVersions,
    this.nextToken,
  });
  static GetTableVersionsResponse fromJson(Map<String, dynamic> json) =>
      GetTableVersionsResponse();
}

class GetTablesResponse {
  /// A list of the requested `Table` objects.
  final List<Table> tableList;

  /// A continuation token, present if the current list segment is not the last.
  final String nextToken;

  GetTablesResponse({
    this.tableList,
    this.nextToken,
  });
  static GetTablesResponse fromJson(Map<String, dynamic> json) =>
      GetTablesResponse();
}

class GetTagsResponse {
  /// The requested tags.
  final Map<String, String> tags;

  GetTagsResponse({
    this.tags,
  });
  static GetTagsResponse fromJson(Map<String, dynamic> json) =>
      GetTagsResponse();
}

class GetTriggerResponse {
  /// The requested trigger definition.
  final Trigger trigger;

  GetTriggerResponse({
    this.trigger,
  });
  static GetTriggerResponse fromJson(Map<String, dynamic> json) =>
      GetTriggerResponse();
}

class GetTriggersResponse {
  /// A list of triggers for the specified job.
  final List<Trigger> triggers;

  /// A continuation token, if not all the requested triggers have yet been
  /// returned.
  final String nextToken;

  GetTriggersResponse({
    this.triggers,
    this.nextToken,
  });
  static GetTriggersResponse fromJson(Map<String, dynamic> json) =>
      GetTriggersResponse();
}

class GetUserDefinedFunctionResponse {
  /// The requested function definition.
  final UserDefinedFunction userDefinedFunction;

  GetUserDefinedFunctionResponse({
    this.userDefinedFunction,
  });
  static GetUserDefinedFunctionResponse fromJson(Map<String, dynamic> json) =>
      GetUserDefinedFunctionResponse();
}

class GetUserDefinedFunctionsResponse {
  /// A list of requested function definitions.
  final List<UserDefinedFunction> userDefinedFunctions;

  /// A continuation token, if the list of functions returned does not include
  /// the last requested function.
  final String nextToken;

  GetUserDefinedFunctionsResponse({
    this.userDefinedFunctions,
    this.nextToken,
  });
  static GetUserDefinedFunctionsResponse fromJson(Map<String, dynamic> json) =>
      GetUserDefinedFunctionsResponse();
}

class GetWorkflowResponse {
  /// The resource metadata for the workflow.
  final Workflow workflow;

  GetWorkflowResponse({
    this.workflow,
  });
  static GetWorkflowResponse fromJson(Map<String, dynamic> json) =>
      GetWorkflowResponse();
}

class GetWorkflowRunPropertiesResponse {
  /// The workflow run properties which were set during the specified run.
  final Map<String, String> runProperties;

  GetWorkflowRunPropertiesResponse({
    this.runProperties,
  });
  static GetWorkflowRunPropertiesResponse fromJson(Map<String, dynamic> json) =>
      GetWorkflowRunPropertiesResponse();
}

class GetWorkflowRunResponse {
  /// The requested workflow run metadata.
  final WorkflowRun run;

  GetWorkflowRunResponse({
    this.run,
  });
  static GetWorkflowRunResponse fromJson(Map<String, dynamic> json) =>
      GetWorkflowRunResponse();
}

class GetWorkflowRunsResponse {
  /// A list of workflow run metadata objects.
  final List<WorkflowRun> runs;

  /// A continuation token, if not all requested workflow runs have been
  /// returned.
  final String nextToken;

  GetWorkflowRunsResponse({
    this.runs,
    this.nextToken,
  });
  static GetWorkflowRunsResponse fromJson(Map<String, dynamic> json) =>
      GetWorkflowRunsResponse();
}

class GlueTable {
  /// A database name in the AWS Glue Data Catalog.
  final String databaseName;

  /// A table name in the AWS Glue Data Catalog.
  final String tableName;

  /// A unique identifier for the AWS Glue Data Catalog.
  final String catalogId;

  /// The name of the connection to the AWS Glue Data Catalog.
  final String connectionName;

  GlueTable({
    @required this.databaseName,
    @required this.tableName,
    this.catalogId,
    this.connectionName,
  });
  static GlueTable fromJson(Map<String, dynamic> json) => GlueTable();
}

class GrokClassifier {
  /// The name of the classifier.
  final String name;

  /// An identifier of the data format that the classifier matches, such as
  /// Twitter, JSON, Omniture logs, and so on.
  final String classification;

  /// The time that this classifier was registered.
  final DateTime creationTime;

  /// The time that this classifier was last updated.
  final DateTime lastUpdated;

  /// The version of this classifier.
  final BigInt version;

  /// The grok pattern applied to a data store by this classifier. For more
  /// information, see built-in patterns in [Writing Custom
  /// Classifiers](http://docs.aws.amazon.com/glue/latest/dg/custom-classifier.html).
  final String grokPattern;

  /// Optional custom grok patterns defined by this classifier. For more
  /// information, see custom patterns in [Writing Custom
  /// Classifiers](http://docs.aws.amazon.com/glue/latest/dg/custom-classifier.html).
  final String customPatterns;

  GrokClassifier({
    @required this.name,
    @required this.classification,
    this.creationTime,
    this.lastUpdated,
    this.version,
    @required this.grokPattern,
    this.customPatterns,
  });
  static GrokClassifier fromJson(Map<String, dynamic> json) => GrokClassifier();
}

class ImportCatalogToGlueResponse {
  ImportCatalogToGlueResponse();
  static ImportCatalogToGlueResponse fromJson(Map<String, dynamic> json) =>
      ImportCatalogToGlueResponse();
}

class ImportLabelsTaskRunProperties {
  /// The Amazon Simple Storage Service (Amazon S3) path from where you will
  /// import the labels.
  final String inputS3Path;

  /// Indicates whether to overwrite your existing labels.
  final bool replace;

  ImportLabelsTaskRunProperties({
    this.inputS3Path,
    this.replace,
  });
  static ImportLabelsTaskRunProperties fromJson(Map<String, dynamic> json) =>
      ImportLabelsTaskRunProperties();
}

class JdbcTarget {
  /// The name of the connection to use to connect to the JDBC target.
  final String connectionName;

  /// The path of the JDBC target.
  final String path;

  /// A list of glob patterns used to exclude from the crawl. For more
  /// information, see [Catalog Tables with a
  /// Crawler](http://docs.aws.amazon.com/glue/latest/dg/add-crawler.html).
  final List<String> exclusions;

  JdbcTarget({
    this.connectionName,
    this.path,
    this.exclusions,
  });
  static JdbcTarget fromJson(Map<String, dynamic> json) => JdbcTarget();
}

class Job {
  /// The name you assign to this job definition.
  final String name;

  /// A description of the job.
  final String description;

  /// This field is reserved for future use.
  final String logUri;

  /// The name or Amazon Resource Name (ARN) of the IAM role associated with
  /// this job.
  final String role;

  /// The time and date that this job definition was created.
  final DateTime createdOn;

  /// The last point in time when this job definition was modified.
  final DateTime lastModifiedOn;

  /// An `ExecutionProperty` specifying the maximum number of concurrent runs
  /// allowed for this job.
  final ExecutionProperty executionProperty;

  /// The `JobCommand` that executes this job.
  final JobCommand command;

  /// The default arguments for this job, specified as name-value pairs.
  ///
  /// You can specify arguments here that your own job-execution script
  /// consumes, as well as arguments that AWS Glue itself consumes.
  ///
  /// For information about how to specify and consume your own Job arguments,
  /// see the [Calling AWS Glue APIs in
  /// Python](https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-python-calling.html)
  /// topic in the developer guide.
  ///
  /// For information about the key-value pairs that AWS Glue consumes to set up
  /// your job, see the [Special Parameters Used by AWS
  /// Glue](https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-etl-glue-arguments.html)
  /// topic in the developer guide.
  final Map<String, String> defaultArguments;

  /// The connections used for this job.
  final ConnectionsList connections;

  /// The maximum number of times to retry this job after a JobRun fails.
  final int maxRetries;

  /// This field is deprecated. Use `MaxCapacity` instead.
  ///
  /// The number of AWS Glue data processing units (DPUs) allocated to runs of
  /// this job. You can allocate from 2 to 100 DPUs; the default is 10. A DPU is
  /// a relative measure of processing power that consists of 4 vCPUs of compute
  /// capacity and 16 GB of memory. For more information, see the [AWS Glue
  /// pricing page](https://aws.amazon.com/glue/pricing/).
  final int allocatedCapacity;

  /// The job timeout in minutes. This is the maximum time that a job run can
  /// consume resources before it is terminated and enters `TIMEOUT` status. The
  /// default is 2,880 minutes (48 hours).
  final int timeout;

  /// The number of AWS Glue data processing units (DPUs) that can be allocated
  /// when this job runs. A DPU is a relative measure of processing power that
  /// consists of 4 vCPUs of compute capacity and 16 GB of memory. For more
  /// information, see the [AWS Glue pricing
  /// page](https://aws.amazon.com/glue/pricing/).
  ///
  /// Do not set `Max Capacity` if using `WorkerType` and `NumberOfWorkers`.
  ///
  /// The value that can be allocated for `MaxCapacity` depends on whether you
  /// are running a Python shell job or an Apache Spark ETL job:
  ///
  /// *   When you specify a Python shell job (`JobCommand.Name`="pythonshell"),
  /// you can allocate either 0.0625 or 1 DPU. The default is 0.0625 DPU.
  ///
  /// *   When you specify an Apache Spark ETL job
  /// (`JobCommand.Name`="glueetl"), you can allocate from 2 to 100 DPUs. The
  /// default is 10 DPUs. This job type cannot have a fractional DPU allocation.
  final double maxCapacity;

  /// The type of predefined worker that is allocated when a job runs. Accepts a
  /// value of Standard, G.1X, or G.2X.
  ///
  /// *   For the `Standard` worker type, each worker provides 4 vCPU, 16 GB of
  /// memory and a 50GB disk, and 2 executors per worker.
  ///
  /// *   For the `G.1X` worker type, each worker maps to 1 DPU (4 vCPU, 16 GB
  /// of memory, 64 GB disk), and provides 1 executor per worker. We recommend
  /// this worker type for memory-intensive jobs.
  ///
  /// *   For the `G.2X` worker type, each worker maps to 2 DPU (8 vCPU, 32 GB
  /// of memory, 128 GB disk), and provides 1 executor per worker. We recommend
  /// this worker type for memory-intensive jobs.
  final String workerType;

  /// The number of workers of a defined `workerType` that are allocated when a
  /// job runs.
  ///
  /// The maximum number of workers you can define are 299 for `G.1X`, and 149
  /// for `G.2X`.
  final int numberOfWorkers;

  /// The name of the `SecurityConfiguration` structure to be used with this
  /// job.
  final String securityConfiguration;

  /// Specifies configuration properties of a job notification.
  final NotificationProperty notificationProperty;

  /// Glue version determines the versions of Apache Spark and Python that AWS
  /// Glue supports. The Python version indicates the version supported for jobs
  /// of type Spark.
  ///
  /// For more information about the available AWS Glue versions and
  /// corresponding Spark and Python versions, see [Glue
  /// version](https://docs.aws.amazon.com/glue/latest/dg/add-job.html) in the
  /// developer guide.
  ///
  /// Jobs that are created without specifying a Glue version default to Glue
  /// 0.9.
  final String glueVersion;

  Job({
    this.name,
    this.description,
    this.logUri,
    this.role,
    this.createdOn,
    this.lastModifiedOn,
    this.executionProperty,
    this.command,
    this.defaultArguments,
    this.connections,
    this.maxRetries,
    this.allocatedCapacity,
    this.timeout,
    this.maxCapacity,
    this.workerType,
    this.numberOfWorkers,
    this.securityConfiguration,
    this.notificationProperty,
    this.glueVersion,
  });
  static Job fromJson(Map<String, dynamic> json) => Job();
}

class JobBookmarkEntry {
  /// The name of the job in question.
  final String jobName;

  /// The version of the job.
  final int version;

  /// The run ID number.
  final int run;

  /// The attempt ID number.
  final int attempt;

  /// The unique run identifier associated with the previous job run.
  final String previousRunId;

  /// The run ID number.
  final String runId;

  /// The bookmark itself.
  final String jobBookmark;

  JobBookmarkEntry({
    this.jobName,
    this.version,
    this.run,
    this.attempt,
    this.previousRunId,
    this.runId,
    this.jobBookmark,
  });
  static JobBookmarkEntry fromJson(Map<String, dynamic> json) =>
      JobBookmarkEntry();
}

class JobBookmarksEncryption {
  /// The encryption mode to use for job bookmarks data.
  final String jobBookmarksEncryptionMode;

  /// The Amazon Resource Name (ARN) of the KMS key to be used to encrypt the
  /// data.
  final String kmsKeyArn;

  JobBookmarksEncryption({
    this.jobBookmarksEncryptionMode,
    this.kmsKeyArn,
  });
  static JobBookmarksEncryption fromJson(Map<String, dynamic> json) =>
      JobBookmarksEncryption();
}

class JobCommand {
  /// The name of the job command. For an Apache Spark ETL job, this must be
  /// `glueetl`. For a Python shell job, it must be `pythonshell`.
  final String name;

  /// Specifies the Amazon Simple Storage Service (Amazon S3) path to a script
  /// that executes a job.
  final String scriptLocation;

  /// The Python version being used to execute a Python shell job. Allowed
  /// values are 2 or 3.
  final String pythonVersion;

  JobCommand({
    this.name,
    this.scriptLocation,
    this.pythonVersion,
  });
  static JobCommand fromJson(Map<String, dynamic> json) => JobCommand();
}

class JobNodeDetails {
  /// The information for the job runs represented by the job node.
  final List<JobRun> jobRuns;

  JobNodeDetails({
    this.jobRuns,
  });
  static JobNodeDetails fromJson(Map<String, dynamic> json) => JobNodeDetails();
}

class JobRun {
  /// The ID of this job run.
  final String id;

  /// The number of the attempt to run this job.
  final int attempt;

  /// The ID of the previous run of this job. For example, the `JobRunId`
  /// specified in the `StartJobRun` action.
  final String previousRunId;

  /// The name of the trigger that started this job run.
  final String triggerName;

  /// The name of the job definition being used in this run.
  final String jobName;

  /// The date and time at which this job run was started.
  final DateTime startedOn;

  /// The last time that this job run was modified.
  final DateTime lastModifiedOn;

  /// The date and time that this job run completed.
  final DateTime completedOn;

  /// The current state of the job run.
  final String jobRunState;

  /// The job arguments associated with this run. For this job run, they replace
  /// the default arguments set in the job definition itself.
  ///
  /// You can specify arguments here that your own job-execution script
  /// consumes, as well as arguments that AWS Glue itself consumes.
  ///
  /// For information about how to specify and consume your own job arguments,
  /// see the [Calling AWS Glue APIs in
  /// Python](https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-python-calling.html)
  /// topic in the developer guide.
  ///
  /// For information about the key-value pairs that AWS Glue consumes to set up
  /// your job, see the [Special Parameters Used by AWS
  /// Glue](https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-etl-glue-arguments.html)
  /// topic in the developer guide.
  final Map<String, String> arguments;

  /// An error message associated with this job run.
  final String errorMessage;

  /// A list of predecessors to this job run.
  final List<Predecessor> predecessorRuns;

  /// This field is deprecated. Use `MaxCapacity` instead.
  ///
  /// The number of AWS Glue data processing units (DPUs) allocated to this
  /// JobRun. From 2 to 100 DPUs can be allocated; the default is 10. A DPU is a
  /// relative measure of processing power that consists of 4 vCPUs of compute
  /// capacity and 16 GB of memory. For more information, see the [AWS Glue
  /// pricing page](https://aws.amazon.com/glue/pricing/).
  final int allocatedCapacity;

  /// The amount of time (in seconds) that the job run consumed resources.
  final int executionTime;

  /// The `JobRun` timeout in minutes. This is the maximum time that a job run
  /// can consume resources before it is terminated and enters `TIMEOUT` status.
  /// The default is 2,880 minutes (48 hours). This overrides the timeout value
  /// set in the parent job.
  final int timeout;

  /// The number of AWS Glue data processing units (DPUs) that can be allocated
  /// when this job runs. A DPU is a relative measure of processing power that
  /// consists of 4 vCPUs of compute capacity and 16 GB of memory. For more
  /// information, see the [AWS Glue pricing
  /// page](https://docs.aws.amazon.com/https:/aws.amazon.com/glue/pricing/).
  ///
  /// Do not set `Max Capacity` if using `WorkerType` and `NumberOfWorkers`.
  ///
  /// The value that can be allocated for `MaxCapacity` depends on whether you
  /// are running a Python shell job or an Apache Spark ETL job:
  ///
  /// *   When you specify a Python shell job (`JobCommand.Name`="pythonshell"),
  /// you can allocate either 0.0625 or 1 DPU. The default is 0.0625 DPU.
  ///
  /// *   When you specify an Apache Spark ETL job
  /// (`JobCommand.Name`="glueetl"), you can allocate from 2 to 100 DPUs. The
  /// default is 10 DPUs. This job type cannot have a fractional DPU allocation.
  final double maxCapacity;

  /// The type of predefined worker that is allocated when a job runs. Accepts a
  /// value of Standard, G.1X, or G.2X.
  ///
  /// *   For the `Standard` worker type, each worker provides 4 vCPU, 16 GB of
  /// memory and a 50GB disk, and 2 executors per worker.
  ///
  /// *   For the `G.1X` worker type, each worker provides 4 vCPU, 16 GB of
  /// memory and a 64GB disk, and 1 executor per worker.
  ///
  /// *   For the `G.2X` worker type, each worker provides 8 vCPU, 32 GB of
  /// memory and a 128GB disk, and 1 executor per worker.
  final String workerType;

  /// The number of workers of a defined `workerType` that are allocated when a
  /// job runs.
  ///
  /// The maximum number of workers you can define are 299 for `G.1X`, and 149
  /// for `G.2X`.
  final int numberOfWorkers;

  /// The name of the `SecurityConfiguration` structure to be used with this job
  /// run.
  final String securityConfiguration;

  /// The name of the log group for secure logging that can be server-side
  /// encrypted in Amazon CloudWatch using AWS KMS. This name can be
  /// `/aws-glue/jobs/`, in which case the default encryption is `NONE`. If you
  /// add a role name and `SecurityConfiguration` name (in other words,
  /// `/aws-glue/jobs-yourRoleName-yourSecurityConfigurationName/`), then that
  /// security configuration is used to encrypt the log group.
  final String logGroupName;

  /// Specifies configuration properties of a job run notification.
  final NotificationProperty notificationProperty;

  /// Glue version determines the versions of Apache Spark and Python that AWS
  /// Glue supports. The Python version indicates the version supported for jobs
  /// of type Spark.
  ///
  /// For more information about the available AWS Glue versions and
  /// corresponding Spark and Python versions, see [Glue
  /// version](https://docs.aws.amazon.com/glue/latest/dg/add-job.html) in the
  /// developer guide.
  ///
  /// Jobs that are created without specifying a Glue version default to Glue
  /// 0.9.
  final String glueVersion;

  JobRun({
    this.id,
    this.attempt,
    this.previousRunId,
    this.triggerName,
    this.jobName,
    this.startedOn,
    this.lastModifiedOn,
    this.completedOn,
    this.jobRunState,
    this.arguments,
    this.errorMessage,
    this.predecessorRuns,
    this.allocatedCapacity,
    this.executionTime,
    this.timeout,
    this.maxCapacity,
    this.workerType,
    this.numberOfWorkers,
    this.securityConfiguration,
    this.logGroupName,
    this.notificationProperty,
    this.glueVersion,
  });
  static JobRun fromJson(Map<String, dynamic> json) => JobRun();
}

class JobUpdate {
  /// Description of the job being defined.
  final String description;

  /// This field is reserved for future use.
  final String logUri;

  /// The name or Amazon Resource Name (ARN) of the IAM role associated with
  /// this job (required).
  final String role;

  /// An `ExecutionProperty` specifying the maximum number of concurrent runs
  /// allowed for this job.
  final ExecutionProperty executionProperty;

  /// The `JobCommand` that executes this job (required).
  final JobCommand command;

  /// The default arguments for this job.
  ///
  /// You can specify arguments here that your own job-execution script
  /// consumes, as well as arguments that AWS Glue itself consumes.
  ///
  /// For information about how to specify and consume your own Job arguments,
  /// see the [Calling AWS Glue APIs in
  /// Python](https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-python-calling.html)
  /// topic in the developer guide.
  ///
  /// For information about the key-value pairs that AWS Glue consumes to set up
  /// your job, see the [Special Parameters Used by AWS
  /// Glue](https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-etl-glue-arguments.html)
  /// topic in the developer guide.
  final Map<String, String> defaultArguments;

  /// The connections used for this job.
  final ConnectionsList connections;

  /// The maximum number of times to retry this job if it fails.
  final int maxRetries;

  /// This field is deprecated. Use `MaxCapacity` instead.
  ///
  /// The number of AWS Glue data processing units (DPUs) to allocate to this
  /// job. You can allocate from 2 to 100 DPUs; the default is 10. A DPU is a
  /// relative measure of processing power that consists of 4 vCPUs of compute
  /// capacity and 16 GB of memory. For more information, see the [AWS Glue
  /// pricing page](https://aws.amazon.com/glue/pricing/).
  final int allocatedCapacity;

  /// The job timeout in minutes. This is the maximum time that a job run can
  /// consume resources before it is terminated and enters `TIMEOUT` status. The
  /// default is 2,880 minutes (48 hours).
  final int timeout;

  /// The number of AWS Glue data processing units (DPUs) that can be allocated
  /// when this job runs. A DPU is a relative measure of processing power that
  /// consists of 4 vCPUs of compute capacity and 16 GB of memory. For more
  /// information, see the [AWS Glue pricing
  /// page](https://aws.amazon.com/glue/pricing/).
  ///
  /// Do not set `Max Capacity` if using `WorkerType` and `NumberOfWorkers`.
  ///
  /// The value that can be allocated for `MaxCapacity` depends on whether you
  /// are running a Python shell job or an Apache Spark ETL job:
  ///
  /// *   When you specify a Python shell job (`JobCommand.Name`="pythonshell"),
  /// you can allocate either 0.0625 or 1 DPU. The default is 0.0625 DPU.
  ///
  /// *   When you specify an Apache Spark ETL job
  /// (`JobCommand.Name`="glueetl"), you can allocate from 2 to 100 DPUs. The
  /// default is 10 DPUs. This job type cannot have a fractional DPU allocation.
  final double maxCapacity;

  /// The type of predefined worker that is allocated when a job runs. Accepts a
  /// value of Standard, G.1X, or G.2X.
  ///
  /// *   For the `Standard` worker type, each worker provides 4 vCPU, 16 GB of
  /// memory and a 50GB disk, and 2 executors per worker.
  ///
  /// *   For the `G.1X` worker type, each worker maps to 1 DPU (4 vCPU, 16 GB
  /// of memory, 64 GB disk), and provides 1 executor per worker. We recommend
  /// this worker type for memory-intensive jobs.
  ///
  /// *   For the `G.2X` worker type, each worker maps to 2 DPU (8 vCPU, 32 GB
  /// of memory, 128 GB disk), and provides 1 executor per worker. We recommend
  /// this worker type for memory-intensive jobs.
  final String workerType;

  /// The number of workers of a defined `workerType` that are allocated when a
  /// job runs.
  ///
  /// The maximum number of workers you can define are 299 for `G.1X`, and 149
  /// for `G.2X`.
  final int numberOfWorkers;

  /// The name of the `SecurityConfiguration` structure to be used with this
  /// job.
  final String securityConfiguration;

  /// Specifies the configuration properties of a job notification.
  final NotificationProperty notificationProperty;

  /// Glue version determines the versions of Apache Spark and Python that AWS
  /// Glue supports. The Python version indicates the version supported for jobs
  /// of type Spark.
  ///
  /// For more information about the available AWS Glue versions and
  /// corresponding Spark and Python versions, see [Glue
  /// version](https://docs.aws.amazon.com/glue/latest/dg/add-job.html) in the
  /// developer guide.
  final String glueVersion;

  JobUpdate({
    this.description,
    this.logUri,
    this.role,
    this.executionProperty,
    this.command,
    this.defaultArguments,
    this.connections,
    this.maxRetries,
    this.allocatedCapacity,
    this.timeout,
    this.maxCapacity,
    this.workerType,
    this.numberOfWorkers,
    this.securityConfiguration,
    this.notificationProperty,
    this.glueVersion,
  });
}

class JsonClassifier {
  /// The name of the classifier.
  final String name;

  /// The time that this classifier was registered.
  final DateTime creationTime;

  /// The time that this classifier was last updated.
  final DateTime lastUpdated;

  /// The version of this classifier.
  final BigInt version;

  /// A `JsonPath` string defining the JSON data for the classifier to classify.
  /// AWS Glue supports a subset of `JsonPath`, as described in [Writing
  /// JsonPath Custom
  /// Classifiers](https://docs.aws.amazon.com/glue/latest/dg/custom-classifier.html#custom-classifier-json).
  final String jsonPath;

  JsonClassifier({
    @required this.name,
    this.creationTime,
    this.lastUpdated,
    this.version,
    @required this.jsonPath,
  });
  static JsonClassifier fromJson(Map<String, dynamic> json) => JsonClassifier();
}

class LabelingSetGenerationTaskRunProperties {
  /// The Amazon Simple Storage Service (Amazon S3) path where you will generate
  /// the labeling set.
  final String outputS3Path;

  LabelingSetGenerationTaskRunProperties({
    this.outputS3Path,
  });
  static LabelingSetGenerationTaskRunProperties fromJson(
          Map<String, dynamic> json) =>
      LabelingSetGenerationTaskRunProperties();
}

class LastCrawlInfo {
  /// Status of the last crawl.
  final String status;

  /// If an error occurred, the error information about the last crawl.
  final String errorMessage;

  /// The log group for the last crawl.
  final String logGroup;

  /// The log stream for the last crawl.
  final String logStream;

  /// The prefix for a message about this crawl.
  final String messagePrefix;

  /// The time at which the crawl started.
  final DateTime startTime;

  LastCrawlInfo({
    this.status,
    this.errorMessage,
    this.logGroup,
    this.logStream,
    this.messagePrefix,
    this.startTime,
  });
  static LastCrawlInfo fromJson(Map<String, dynamic> json) => LastCrawlInfo();
}

class ListCrawlersResponse {
  /// The names of all crawlers in the account, or the crawlers with the
  /// specified tags.
  final List<String> crawlerNames;

  /// A continuation token, if the returned list does not contain the last
  /// metric available.
  final String nextToken;

  ListCrawlersResponse({
    this.crawlerNames,
    this.nextToken,
  });
  static ListCrawlersResponse fromJson(Map<String, dynamic> json) =>
      ListCrawlersResponse();
}

class ListDevEndpointsResponse {
  /// The names of all the `DevEndpoint`s in the account, or the `DevEndpoint`s
  /// with the specified tags.
  final List<String> devEndpointNames;

  /// A continuation token, if the returned list does not contain the last
  /// metric available.
  final String nextToken;

  ListDevEndpointsResponse({
    this.devEndpointNames,
    this.nextToken,
  });
  static ListDevEndpointsResponse fromJson(Map<String, dynamic> json) =>
      ListDevEndpointsResponse();
}

class ListJobsResponse {
  /// The names of all jobs in the account, or the jobs with the specified tags.
  final List<String> jobNames;

  /// A continuation token, if the returned list does not contain the last
  /// metric available.
  final String nextToken;

  ListJobsResponse({
    this.jobNames,
    this.nextToken,
  });
  static ListJobsResponse fromJson(Map<String, dynamic> json) =>
      ListJobsResponse();
}

class ListTriggersResponse {
  /// The names of all triggers in the account, or the triggers with the
  /// specified tags.
  final List<String> triggerNames;

  /// A continuation token, if the returned list does not contain the last
  /// metric available.
  final String nextToken;

  ListTriggersResponse({
    this.triggerNames,
    this.nextToken,
  });
  static ListTriggersResponse fromJson(Map<String, dynamic> json) =>
      ListTriggersResponse();
}

class ListWorkflowsResponse {
  /// List of names of workflows in the account.
  final List<String> workflows;

  /// A continuation token, if not all workflow names have been returned.
  final String nextToken;

  ListWorkflowsResponse({
    this.workflows,
    this.nextToken,
  });
  static ListWorkflowsResponse fromJson(Map<String, dynamic> json) =>
      ListWorkflowsResponse();
}

class Location {
  /// A JDBC location.
  final List<CodeGenNodeArg> jdbc;

  /// An Amazon Simple Storage Service (Amazon S3) location.
  final List<CodeGenNodeArg> s3;

  /// An Amazon DynamoDB table location.
  final List<CodeGenNodeArg> dynamoDB;

  Location({
    this.jdbc,
    this.s3,
    this.dynamoDB,
  });
}

class MLTransform {
  /// The unique transform ID that is generated for the machine learning
  /// transform. The ID is guaranteed to be unique and does not change.
  final String transformId;

  /// A user-defined name for the machine learning transform. Names are not
  /// guaranteed unique and can be changed at any time.
  final String name;

  /// A user-defined, long-form description text for the machine learning
  /// transform. Descriptions are not guaranteed to be unique and can be changed
  /// at any time.
  final String description;

  /// The current status of the machine learning transform.
  final String status;

  /// A timestamp. The time and date that this machine learning transform was
  /// created.
  final DateTime createdOn;

  /// A timestamp. The last point in time when this machine learning transform
  /// was modified.
  final DateTime lastModifiedOn;

  /// A list of AWS Glue table definitions used by the transform.
  final List<GlueTable> inputRecordTables;

  /// A `TransformParameters` object. You can use parameters to tune (customize)
  /// the behavior of the machine learning transform by specifying what data it
  /// learns from and your preference on various tradeoffs (such as precious vs.
  /// recall, or accuracy vs. cost).
  final TransformParameters parameters;

  /// An `EvaluationMetrics` object. Evaluation metrics provide an estimate of
  /// the quality of your machine learning transform.
  final EvaluationMetrics evaluationMetrics;

  /// A count identifier for the labeling files generated by AWS Glue for this
  /// transform. As you create a better transform, you can iteratively download,
  /// label, and upload the labeling file.
  final int labelCount;

  /// A map of key-value pairs representing the columns and data types that this
  /// transform can run against. Has an upper bound of 100 columns.
  final List<SchemaColumn> schema;

  /// The name or Amazon Resource Name (ARN) of the IAM role with the required
  /// permissions. This role needs permission to your Amazon Simple Storage
  /// Service (Amazon S3) sources, targets, temporary directory, scripts, and
  /// any libraries used by the task run for this transform.
  final String role;

  /// The number of AWS Glue data processing units (DPUs) that are allocated to
  /// task runs for this transform. You can allocate from 2 to 100 DPUs; the
  /// default is 10. A DPU is a relative measure of processing power that
  /// consists of 4 vCPUs of compute capacity and 16 GB of memory. For more
  /// information, see the [AWS Glue pricing
  /// page](https://aws.amazon.com/glue/pricing/).
  ///
  /// When the `WorkerType` field is set to a value other than `Standard`, the
  /// `MaxCapacity` field is set automatically and becomes read-only.
  final double maxCapacity;

  /// The type of predefined worker that is allocated when a task of this
  /// transform runs. Accepts a value of Standard, G.1X, or G.2X.
  ///
  /// *   For the `Standard` worker type, each worker provides 4 vCPU, 16 GB of
  /// memory and a 50GB disk, and 2 executors per worker.
  ///
  /// *   For the `G.1X` worker type, each worker provides 4 vCPU, 16 GB of
  /// memory and a 64GB disk, and 1 executor per worker.
  ///
  /// *   For the `G.2X` worker type, each worker provides 8 vCPU, 32 GB of
  /// memory and a 128GB disk, and 1 executor per worker.
  final String workerType;

  /// The number of workers of a defined `workerType` that are allocated when a
  /// task of the transform runs.
  final int numberOfWorkers;

  /// The timeout in minutes of the machine learning transform.
  final int timeout;

  /// The maximum number of times to retry after an `MLTaskRun` of the machine
  /// learning transform fails.
  final int maxRetries;

  MLTransform({
    this.transformId,
    this.name,
    this.description,
    this.status,
    this.createdOn,
    this.lastModifiedOn,
    this.inputRecordTables,
    this.parameters,
    this.evaluationMetrics,
    this.labelCount,
    this.schema,
    this.role,
    this.maxCapacity,
    this.workerType,
    this.numberOfWorkers,
    this.timeout,
    this.maxRetries,
  });
  static MLTransform fromJson(Map<String, dynamic> json) => MLTransform();
}

class MappingEntry {
  /// The name of the source table.
  final String sourceTable;

  /// The source path.
  final String sourcePath;

  /// The source type.
  final String sourceType;

  /// The target table.
  final String targetTable;

  /// The target path.
  final String targetPath;

  /// The target type.
  final String targetType;

  MappingEntry({
    this.sourceTable,
    this.sourcePath,
    this.sourceType,
    this.targetTable,
    this.targetPath,
    this.targetType,
  });
  static MappingEntry fromJson(Map<String, dynamic> json) => MappingEntry();
}

class Node {
  /// The type of AWS Glue component represented by the node.
  final String type;

  /// The name of the AWS Glue component represented by the node.
  final String name;

  /// The unique Id assigned to the node within the workflow.
  final String uniqueId;

  /// Details of the Trigger when the node represents a Trigger.
  final TriggerNodeDetails triggerDetails;

  /// Details of the Job when the node represents a Job.
  final JobNodeDetails jobDetails;

  /// Details of the crawler when the node represents a crawler.
  final CrawlerNodeDetails crawlerDetails;

  Node({
    this.type,
    this.name,
    this.uniqueId,
    this.triggerDetails,
    this.jobDetails,
    this.crawlerDetails,
  });
  static Node fromJson(Map<String, dynamic> json) => Node();
}

class NotificationProperty {
  /// After a job run starts, the number of minutes to wait before sending a job
  /// run delay notification.
  final int notifyDelayAfter;

  NotificationProperty({
    this.notifyDelayAfter,
  });
  static NotificationProperty fromJson(Map<String, dynamic> json) =>
      NotificationProperty();
}

class Order {
  /// The name of the column.
  final String column;

  /// Indicates that the column is sorted in ascending order (`== 1`), or in
  /// descending order (`==0`).
  final int sortOrder;

  Order({
    @required this.column,
    @required this.sortOrder,
  });
  static Order fromJson(Map<String, dynamic> json) => Order();
}

class Partition {
  /// The values of the partition.
  final List<String> values;

  /// The name of the catalog database in which to create the partition.
  final String databaseName;

  /// The name of the database table in which to create the partition.
  final String tableName;

  /// The time at which the partition was created.
  final DateTime creationTime;

  /// The last time at which the partition was accessed.
  final DateTime lastAccessTime;

  /// Provides information about the physical location where the partition is
  /// stored.
  final StorageDescriptor storageDescriptor;

  /// These key-value pairs define partition parameters.
  final Map<String, String> parameters;

  /// The last time at which column statistics were computed for this partition.
  final DateTime lastAnalyzedTime;

  Partition({
    this.values,
    this.databaseName,
    this.tableName,
    this.creationTime,
    this.lastAccessTime,
    this.storageDescriptor,
    this.parameters,
    this.lastAnalyzedTime,
  });
  static Partition fromJson(Map<String, dynamic> json) => Partition();
}

class PartitionError {
  /// The values that define the partition.
  final List<String> partitionValues;

  /// The details about the partition error.
  final ErrorDetail errorDetail;

  PartitionError({
    this.partitionValues,
    this.errorDetail,
  });
  static PartitionError fromJson(Map<String, dynamic> json) => PartitionError();
}

class PartitionInput {
  /// The values of the partition. Although this parameter is not required by
  /// the SDK, you must specify this parameter for a valid input.
  final List<String> values;

  /// The last time at which the partition was accessed.
  final DateTime lastAccessTime;

  /// Provides information about the physical location where the partition is
  /// stored.
  final StorageDescriptor storageDescriptor;

  /// These key-value pairs define partition parameters.
  final Map<String, String> parameters;

  /// The last time at which column statistics were computed for this partition.
  final DateTime lastAnalyzedTime;

  PartitionInput({
    this.values,
    this.lastAccessTime,
    this.storageDescriptor,
    this.parameters,
    this.lastAnalyzedTime,
  });
}

class PartitionValueList {
  /// The list of values.
  final List<String> values;

  PartitionValueList({
    @required this.values,
  });
  static PartitionValueList fromJson(Map<String, dynamic> json) =>
      PartitionValueList();
}

class PhysicalConnectionRequirements {
  /// The subnet ID used by the connection.
  final String subnetId;

  /// The security group ID list used by the connection.
  final List<String> securityGroupIdList;

  /// The connection's Availability Zone. This field is redundant because the
  /// specified subnet implies the Availability Zone to be used. Currently the
  /// field must be populated, but it will be deprecated in the future.
  final String availabilityZone;

  PhysicalConnectionRequirements({
    this.subnetId,
    this.securityGroupIdList,
    this.availabilityZone,
  });
  static PhysicalConnectionRequirements fromJson(Map<String, dynamic> json) =>
      PhysicalConnectionRequirements();
}

class Predecessor {
  /// The name of the job definition used by the predecessor job run.
  final String jobName;

  /// The job-run ID of the predecessor job run.
  final String runId;

  Predecessor({
    this.jobName,
    this.runId,
  });
  static Predecessor fromJson(Map<String, dynamic> json) => Predecessor();
}

class Predicate {
  /// An optional field if only one condition is listed. If multiple conditions
  /// are listed, then this field is required.
  final String logical;

  /// A list of the conditions that determine when the trigger will fire.
  final List<Condition> conditions;

  Predicate({
    this.logical,
    this.conditions,
  });
  static Predicate fromJson(Map<String, dynamic> json) => Predicate();
}

class PrincipalPermissions {
  /// The principal who is granted permissions.
  final DataLakePrincipal principal;

  /// The permissions that are granted to the principal.
  final List<String> permissions;

  PrincipalPermissions({
    this.principal,
    this.permissions,
  });
  static PrincipalPermissions fromJson(Map<String, dynamic> json) =>
      PrincipalPermissions();
}

class PropertyPredicate {
  /// The key of the property.
  final String key;

  /// The value of the property.
  final String value;

  /// The comparator used to compare this property to others.
  final String comparator;

  PropertyPredicate({
    this.key,
    this.value,
    this.comparator,
  });
}

class PutDataCatalogEncryptionSettingsResponse {
  PutDataCatalogEncryptionSettingsResponse();
  static PutDataCatalogEncryptionSettingsResponse fromJson(
          Map<String, dynamic> json) =>
      PutDataCatalogEncryptionSettingsResponse();
}

class PutResourcePolicyResponse {
  /// A hash of the policy that has just been set. This must be included in a
  /// subsequent call that overwrites or updates this policy.
  final String policyHash;

  PutResourcePolicyResponse({
    this.policyHash,
  });
  static PutResourcePolicyResponse fromJson(Map<String, dynamic> json) =>
      PutResourcePolicyResponse();
}

class PutWorkflowRunPropertiesResponse {
  PutWorkflowRunPropertiesResponse();
  static PutWorkflowRunPropertiesResponse fromJson(Map<String, dynamic> json) =>
      PutWorkflowRunPropertiesResponse();
}

class ResetJobBookmarkResponse {
  /// The reset bookmark entry.
  final JobBookmarkEntry jobBookmarkEntry;

  ResetJobBookmarkResponse({
    this.jobBookmarkEntry,
  });
  static ResetJobBookmarkResponse fromJson(Map<String, dynamic> json) =>
      ResetJobBookmarkResponse();
}

class ResourceUri {
  /// The type of the resource.
  final String resourceType;

  /// The URI for accessing the resource.
  final String uri;

  ResourceUri({
    this.resourceType,
    this.uri,
  });
  static ResourceUri fromJson(Map<String, dynamic> json) => ResourceUri();
}

class S3Encryption {
  /// The encryption mode to use for Amazon S3 data.
  final String s3EncryptionMode;

  /// The Amazon Resource Name (ARN) of the KMS key to be used to encrypt the
  /// data.
  final String kmsKeyArn;

  S3Encryption({
    this.s3EncryptionMode,
    this.kmsKeyArn,
  });
  static S3Encryption fromJson(Map<String, dynamic> json) => S3Encryption();
}

class S3Target {
  /// The path to the Amazon S3 target.
  final String path;

  /// A list of glob patterns used to exclude from the crawl. For more
  /// information, see [Catalog Tables with a
  /// Crawler](http://docs.aws.amazon.com/glue/latest/dg/add-crawler.html).
  final List<String> exclusions;

  S3Target({
    this.path,
    this.exclusions,
  });
  static S3Target fromJson(Map<String, dynamic> json) => S3Target();
}

class Schedule {
  /// A `cron` expression used to specify the schedule. For more information,
  /// see [Time-Based Schedules for Jobs and
  /// Crawlers](http://docs.aws.amazon.com/glue/latest/dg/monitor-data-warehouse-schedule.html).
  /// For example, to run something every day at 12:15 UTC, specify `cron(15 12
  /// * * ? *)`.
  final String scheduleExpression;

  /// The state of the schedule.
  final String state;

  Schedule({
    this.scheduleExpression,
    this.state,
  });
  static Schedule fromJson(Map<String, dynamic> json) => Schedule();
}

class SchemaChangePolicy {
  /// The update behavior when the crawler finds a changed schema.
  final String updateBehavior;

  /// The deletion behavior when the crawler finds a deleted object.
  final String deleteBehavior;

  SchemaChangePolicy({
    this.updateBehavior,
    this.deleteBehavior,
  });
  static SchemaChangePolicy fromJson(Map<String, dynamic> json) =>
      SchemaChangePolicy();
}

class SchemaColumn {
  /// The name of the column.
  final String name;

  /// The type of data in the column.
  final String dataType;

  SchemaColumn({
    this.name,
    this.dataType,
  });
  static SchemaColumn fromJson(Map<String, dynamic> json) => SchemaColumn();
}

class SearchTablesResponse {
  /// A continuation token, present if the current list segment is not the last.
  final String nextToken;

  /// A list of the requested `Table` objects. The `SearchTables` response
  /// returns only the tables that you have access to.
  final List<Table> tableList;

  SearchTablesResponse({
    this.nextToken,
    this.tableList,
  });
  static SearchTablesResponse fromJson(Map<String, dynamic> json) =>
      SearchTablesResponse();
}

class SecurityConfiguration {
  /// The name of the security configuration.
  final String name;

  /// The time at which this security configuration was created.
  final DateTime createdTimeStamp;

  /// The encryption configuration associated with this security configuration.
  final EncryptionConfiguration encryptionConfiguration;

  SecurityConfiguration({
    this.name,
    this.createdTimeStamp,
    this.encryptionConfiguration,
  });
  static SecurityConfiguration fromJson(Map<String, dynamic> json) =>
      SecurityConfiguration();
}

class Segment {
  /// The zero-based index number of the segment. For example, if the total
  /// number of segments is 4, `SegmentNumber` values range from 0 through 3.
  final int segmentNumber;

  /// The total number of segments.
  final int totalSegments;

  Segment({
    @required this.segmentNumber,
    @required this.totalSegments,
  });
}

class SerDeInfo {
  /// Name of the SerDe.
  final String name;

  /// Usually the class that implements the SerDe. An example is
  /// `org.apache.hadoop.hive.serde2.columnar.ColumnarSerDe`.
  final String serializationLibrary;

  /// These key-value pairs define initialization parameters for the SerDe.
  final Map<String, String> parameters;

  SerDeInfo({
    this.name,
    this.serializationLibrary,
    this.parameters,
  });
  static SerDeInfo fromJson(Map<String, dynamic> json) => SerDeInfo();
}

class SkewedInfo {
  /// A list of names of columns that contain skewed values.
  final List<String> skewedColumnNames;

  /// A list of values that appear so frequently as to be considered skewed.
  final List<String> skewedColumnValues;

  /// A mapping of skewed values to the columns that contain them.
  final Map<String, String> skewedColumnValueLocationMaps;

  SkewedInfo({
    this.skewedColumnNames,
    this.skewedColumnValues,
    this.skewedColumnValueLocationMaps,
  });
  static SkewedInfo fromJson(Map<String, dynamic> json) => SkewedInfo();
}

class SortCriterion {
  final String fieldName;

  final String sort;

  SortCriterion({
    this.fieldName,
    this.sort,
  });
}

class StartCrawlerResponse {
  StartCrawlerResponse();
  static StartCrawlerResponse fromJson(Map<String, dynamic> json) =>
      StartCrawlerResponse();
}

class StartCrawlerScheduleResponse {
  StartCrawlerScheduleResponse();
  static StartCrawlerScheduleResponse fromJson(Map<String, dynamic> json) =>
      StartCrawlerScheduleResponse();
}

class StartExportLabelsTaskRunResponse {
  /// The unique identifier for the task run.
  final String taskRunId;

  StartExportLabelsTaskRunResponse({
    this.taskRunId,
  });
  static StartExportLabelsTaskRunResponse fromJson(Map<String, dynamic> json) =>
      StartExportLabelsTaskRunResponse();
}

class StartImportLabelsTaskRunResponse {
  /// The unique identifier for the task run.
  final String taskRunId;

  StartImportLabelsTaskRunResponse({
    this.taskRunId,
  });
  static StartImportLabelsTaskRunResponse fromJson(Map<String, dynamic> json) =>
      StartImportLabelsTaskRunResponse();
}

class StartJobRunResponse {
  /// The ID assigned to this job run.
  final String jobRunId;

  StartJobRunResponse({
    this.jobRunId,
  });
  static StartJobRunResponse fromJson(Map<String, dynamic> json) =>
      StartJobRunResponse();
}

class StartMLEvaluationTaskRunResponse {
  /// The unique identifier associated with this run.
  final String taskRunId;

  StartMLEvaluationTaskRunResponse({
    this.taskRunId,
  });
  static StartMLEvaluationTaskRunResponse fromJson(Map<String, dynamic> json) =>
      StartMLEvaluationTaskRunResponse();
}

class StartMLLabelingSetGenerationTaskRunResponse {
  /// The unique run identifier that is associated with this task run.
  final String taskRunId;

  StartMLLabelingSetGenerationTaskRunResponse({
    this.taskRunId,
  });
  static StartMLLabelingSetGenerationTaskRunResponse fromJson(
          Map<String, dynamic> json) =>
      StartMLLabelingSetGenerationTaskRunResponse();
}

class StartTriggerResponse {
  /// The name of the trigger that was started.
  final String name;

  StartTriggerResponse({
    this.name,
  });
  static StartTriggerResponse fromJson(Map<String, dynamic> json) =>
      StartTriggerResponse();
}

class StartWorkflowRunResponse {
  /// An Id for the new run.
  final String runId;

  StartWorkflowRunResponse({
    this.runId,
  });
  static StartWorkflowRunResponse fromJson(Map<String, dynamic> json) =>
      StartWorkflowRunResponse();
}

class StopCrawlerResponse {
  StopCrawlerResponse();
  static StopCrawlerResponse fromJson(Map<String, dynamic> json) =>
      StopCrawlerResponse();
}

class StopCrawlerScheduleResponse {
  StopCrawlerScheduleResponse();
  static StopCrawlerScheduleResponse fromJson(Map<String, dynamic> json) =>
      StopCrawlerScheduleResponse();
}

class StopTriggerResponse {
  /// The name of the trigger that was stopped.
  final String name;

  StopTriggerResponse({
    this.name,
  });
  static StopTriggerResponse fromJson(Map<String, dynamic> json) =>
      StopTriggerResponse();
}

class StorageDescriptor {
  /// A list of the `Columns` in the table.
  final List<Column> columns;

  /// The physical location of the table. By default, this takes the form of the
  /// warehouse location, followed by the database location in the warehouse,
  /// followed by the table name.
  final String location;

  /// The input format: `SequenceFileInputFormat` (binary), or
  /// `TextInputFormat`, or a custom format.
  final String inputFormat;

  /// The output format: `SequenceFileOutputFormat` (binary), or
  /// `IgnoreKeyTextOutputFormat`, or a custom format.
  final String outputFormat;

  ///  `True` if the data in the table is compressed, or `False` if not.
  final bool compressed;

  /// Must be specified if the table contains any dimension columns.
  final int numberOfBuckets;

  /// The serialization/deserialization (SerDe) information.
  final SerDeInfo serdeInfo;

  /// A list of reducer grouping columns, clustering columns, and bucketing
  /// columns in the table.
  final List<String> bucketColumns;

  /// A list specifying the sort order of each bucket in the table.
  final List<Order> sortColumns;

  /// The user-supplied properties in key-value form.
  final Map<String, String> parameters;

  /// The information about values that appear frequently in a column (skewed
  /// values).
  final SkewedInfo skewedInfo;

  ///  `True` if the table data is stored in subdirectories, or `False` if not.
  final bool storedAsSubDirectories;

  StorageDescriptor({
    this.columns,
    this.location,
    this.inputFormat,
    this.outputFormat,
    this.compressed,
    this.numberOfBuckets,
    this.serdeInfo,
    this.bucketColumns,
    this.sortColumns,
    this.parameters,
    this.skewedInfo,
    this.storedAsSubDirectories,
  });
  static StorageDescriptor fromJson(Map<String, dynamic> json) =>
      StorageDescriptor();
}

class Table {
  /// The table name. For Hive compatibility, this must be entirely lowercase.
  final String name;

  /// The name of the database where the table metadata resides. For Hive
  /// compatibility, this must be all lowercase.
  final String databaseName;

  /// A description of the table.
  final String description;

  /// The owner of the table.
  final String owner;

  /// The time when the table definition was created in the Data Catalog.
  final DateTime createTime;

  /// The last time that the table was updated.
  final DateTime updateTime;

  /// The last time that the table was accessed. This is usually taken from
  /// HDFS, and might not be reliable.
  final DateTime lastAccessTime;

  /// The last time that column statistics were computed for this table.
  final DateTime lastAnalyzedTime;

  /// The retention time for this table.
  final int retention;

  /// A storage descriptor containing information about the physical storage of
  /// this table.
  final StorageDescriptor storageDescriptor;

  /// A list of columns by which the table is partitioned. Only primitive types
  /// are supported as partition keys.
  ///
  /// When you create a table used by Amazon Athena, and you do not specify any
  /// `partitionKeys`, you must at least set the value of `partitionKeys` to an
  /// empty list. For example:
  ///
  ///  `"PartitionKeys": \[\]`
  final List<Column> partitionKeys;

  /// If the table is a view, the original text of the view; otherwise `null`.
  final String viewOriginalText;

  /// If the table is a view, the expanded text of the view; otherwise `null`.
  final String viewExpandedText;

  /// The type of this table (`EXTERNAL_TABLE`, `VIRTUAL_VIEW`, etc.).
  final String tableType;

  /// These key-value pairs define properties associated with the table.
  final Map<String, String> parameters;

  /// The person or entity who created the table.
  final String createdBy;

  /// Indicates whether the table has been registered with AWS Lake Formation.
  final bool isRegisteredWithLakeFormation;

  Table({
    @required this.name,
    this.databaseName,
    this.description,
    this.owner,
    this.createTime,
    this.updateTime,
    this.lastAccessTime,
    this.lastAnalyzedTime,
    this.retention,
    this.storageDescriptor,
    this.partitionKeys,
    this.viewOriginalText,
    this.viewExpandedText,
    this.tableType,
    this.parameters,
    this.createdBy,
    this.isRegisteredWithLakeFormation,
  });
  static Table fromJson(Map<String, dynamic> json) => Table();
}

class TableError {
  /// The name of the table. For Hive compatibility, this must be entirely
  /// lowercase.
  final String tableName;

  /// The details about the error.
  final ErrorDetail errorDetail;

  TableError({
    this.tableName,
    this.errorDetail,
  });
  static TableError fromJson(Map<String, dynamic> json) => TableError();
}

class TableInput {
  /// The table name. For Hive compatibility, this is folded to lowercase when
  /// it is stored.
  final String name;

  /// A description of the table.
  final String description;

  /// The table owner.
  final String owner;

  /// The last time that the table was accessed.
  final DateTime lastAccessTime;

  /// The last time that column statistics were computed for this table.
  final DateTime lastAnalyzedTime;

  /// The retention time for this table.
  final int retention;

  /// A storage descriptor containing information about the physical storage of
  /// this table.
  final StorageDescriptor storageDescriptor;

  /// A list of columns by which the table is partitioned. Only primitive types
  /// are supported as partition keys.
  ///
  /// When you create a table used by Amazon Athena, and you do not specify any
  /// `partitionKeys`, you must at least set the value of `partitionKeys` to an
  /// empty list. For example:
  ///
  ///  `"PartitionKeys": \[\]`
  final List<Column> partitionKeys;

  /// If the table is a view, the original text of the view; otherwise `null`.
  final String viewOriginalText;

  /// If the table is a view, the expanded text of the view; otherwise `null`.
  final String viewExpandedText;

  /// The type of this table (`EXTERNAL_TABLE`, `VIRTUAL_VIEW`, etc.).
  final String tableType;

  /// These key-value pairs define properties associated with the table.
  final Map<String, String> parameters;

  TableInput({
    @required this.name,
    this.description,
    this.owner,
    this.lastAccessTime,
    this.lastAnalyzedTime,
    this.retention,
    this.storageDescriptor,
    this.partitionKeys,
    this.viewOriginalText,
    this.viewExpandedText,
    this.tableType,
    this.parameters,
  });
}

class TableVersion {
  /// The table in question.
  final Table table;

  /// The ID value that identifies this table version. A `VersionId` is a string
  /// representation of an integer. Each version is incremented by 1.
  final String versionId;

  TableVersion({
    this.table,
    this.versionId,
  });
  static TableVersion fromJson(Map<String, dynamic> json) => TableVersion();
}

class TableVersionError {
  /// The name of the table in question.
  final String tableName;

  /// The ID value of the version in question. A `VersionID` is a string
  /// representation of an integer. Each version is incremented by 1.
  final String versionId;

  /// The details about the error.
  final ErrorDetail errorDetail;

  TableVersionError({
    this.tableName,
    this.versionId,
    this.errorDetail,
  });
  static TableVersionError fromJson(Map<String, dynamic> json) =>
      TableVersionError();
}

class TagResourceResponse {
  TagResourceResponse();
  static TagResourceResponse fromJson(Map<String, dynamic> json) =>
      TagResourceResponse();
}

class TaskRun {
  /// The unique identifier for the transform.
  final String transformId;

  /// The unique identifier for this task run.
  final String taskRunId;

  /// The current status of the requested task run.
  final String status;

  /// The names of the log group for secure logging, associated with this task
  /// run.
  final String logGroupName;

  /// Specifies configuration properties associated with this task run.
  final TaskRunProperties properties;

  /// The list of error strings associated with this task run.
  final String errorString;

  /// The date and time that this task run started.
  final DateTime startedOn;

  /// The last point in time that the requested task run was updated.
  final DateTime lastModifiedOn;

  /// The last point in time that the requested task run was completed.
  final DateTime completedOn;

  /// The amount of time (in seconds) that the task run consumed resources.
  final int executionTime;

  TaskRun({
    this.transformId,
    this.taskRunId,
    this.status,
    this.logGroupName,
    this.properties,
    this.errorString,
    this.startedOn,
    this.lastModifiedOn,
    this.completedOn,
    this.executionTime,
  });
  static TaskRun fromJson(Map<String, dynamic> json) => TaskRun();
}

class TaskRunFilterCriteria {
  /// The type of task run.
  final String taskRunType;

  /// The current status of the task run.
  final String status;

  /// Filter on task runs started before this date.
  final DateTime startedBefore;

  /// Filter on task runs started after this date.
  final DateTime startedAfter;

  TaskRunFilterCriteria({
    this.taskRunType,
    this.status,
    this.startedBefore,
    this.startedAfter,
  });
}

class TaskRunProperties {
  /// The type of task run.
  final String taskType;

  /// The configuration properties for an importing labels task run.
  final ImportLabelsTaskRunProperties importLabelsTaskRunProperties;

  /// The configuration properties for an exporting labels task run.
  final ExportLabelsTaskRunProperties exportLabelsTaskRunProperties;

  /// The configuration properties for a labeling set generation task run.
  final LabelingSetGenerationTaskRunProperties
      labelingSetGenerationTaskRunProperties;

  /// The configuration properties for a find matches task run.
  final FindMatchesTaskRunProperties findMatchesTaskRunProperties;

  TaskRunProperties({
    this.taskType,
    this.importLabelsTaskRunProperties,
    this.exportLabelsTaskRunProperties,
    this.labelingSetGenerationTaskRunProperties,
    this.findMatchesTaskRunProperties,
  });
  static TaskRunProperties fromJson(Map<String, dynamic> json) =>
      TaskRunProperties();
}

class TaskRunSortCriteria {
  /// The column to be used to sort the list of task runs for the machine
  /// learning transform.
  final String column;

  /// The sort direction to be used to sort the list of task runs for the
  /// machine learning transform.
  final String sortDirection;

  TaskRunSortCriteria({
    @required this.column,
    @required this.sortDirection,
  });
}

class TransformFilterCriteria {
  /// A unique transform name that is used to filter the machine learning
  /// transforms.
  final String name;

  /// The type of machine learning transform that is used to filter the machine
  /// learning transforms.
  final String transformType;

  /// Filters the list of machine learning transforms by the last known status
  /// of the transforms (to indicate whether a transform can be used or not).
  /// One of "NOT_READY", "READY", or "DELETING".
  final String status;

  /// The time and date before which the transforms were created.
  final DateTime createdBefore;

  /// The time and date after which the transforms were created.
  final DateTime createdAfter;

  /// Filter on transforms last modified before this date.
  final DateTime lastModifiedBefore;

  /// Filter on transforms last modified after this date.
  final DateTime lastModifiedAfter;

  /// Filters on datasets with a specific schema. The `Map<Column, Type>` object
  /// is an array of key-value pairs representing the schema this transform
  /// accepts, where `Column` is the name of a column, and `Type` is the type of
  /// the data such as an integer or string. Has an upper bound of 100 columns.
  final List<SchemaColumn> schema;

  TransformFilterCriteria({
    this.name,
    this.transformType,
    this.status,
    this.createdBefore,
    this.createdAfter,
    this.lastModifiedBefore,
    this.lastModifiedAfter,
    this.schema,
  });
}

class TransformParameters {
  /// The type of machine learning transform.
  ///
  /// For information about the types of machine learning transforms, see
  /// [Creating Machine Learning
  /// Transforms](http://docs.aws.amazon.com/glue/latest/dg/add-job-machine-learning-transform.html).
  final String transformType;

  /// The parameters for the find matches algorithm.
  final FindMatchesParameters findMatchesParameters;

  TransformParameters({
    @required this.transformType,
    this.findMatchesParameters,
  });
  static TransformParameters fromJson(Map<String, dynamic> json) =>
      TransformParameters();
}

class TransformSortCriteria {
  /// The column to be used in the sorting criteria that are associated with the
  /// machine learning transform.
  final String column;

  /// The sort direction to be used in the sorting criteria that are associated
  /// with the machine learning transform.
  final String sortDirection;

  TransformSortCriteria({
    @required this.column,
    @required this.sortDirection,
  });
}

class Trigger {
  /// The name of the trigger.
  final String name;

  /// The name of the workflow associated with the trigger.
  final String workflowName;

  /// Reserved for future use.
  final String id;

  /// The type of trigger that this is.
  final String type;

  /// The current state of the trigger.
  final String state;

  /// A description of this trigger.
  final String description;

  /// A `cron` expression used to specify the schedule (see [Time-Based
  /// Schedules for Jobs and
  /// Crawlers](https://docs.aws.amazon.com/glue/latest/dg/monitor-data-warehouse-schedule.html).
  /// For example, to run something every day at 12:15 UTC, you would specify:
  /// `cron(15 12 * * ? *)`.
  final String schedule;

  /// The actions initiated by this trigger.
  final List<Action> actions;

  /// The predicate of this trigger, which defines when it will fire.
  final Predicate predicate;

  Trigger({
    this.name,
    this.workflowName,
    this.id,
    this.type,
    this.state,
    this.description,
    this.schedule,
    this.actions,
    this.predicate,
  });
  static Trigger fromJson(Map<String, dynamic> json) => Trigger();
}

class TriggerNodeDetails {
  /// The information of the trigger represented by the trigger node.
  final Trigger trigger;

  TriggerNodeDetails({
    this.trigger,
  });
  static TriggerNodeDetails fromJson(Map<String, dynamic> json) =>
      TriggerNodeDetails();
}

class TriggerUpdate {
  /// Reserved for future use.
  final String name;

  /// A description of this trigger.
  final String description;

  /// A `cron` expression used to specify the schedule (see [Time-Based
  /// Schedules for Jobs and
  /// Crawlers](https://docs.aws.amazon.com/glue/latest/dg/monitor-data-warehouse-schedule.html).
  /// For example, to run something every day at 12:15 UTC, you would specify:
  /// `cron(15 12 * * ? *)`.
  final String schedule;

  /// The actions initiated by this trigger.
  final List<Action> actions;

  /// The predicate of this trigger, which defines when it will fire.
  final Predicate predicate;

  TriggerUpdate({
    this.name,
    this.description,
    this.schedule,
    this.actions,
    this.predicate,
  });
}

class UntagResourceResponse {
  UntagResourceResponse();
  static UntagResourceResponse fromJson(Map<String, dynamic> json) =>
      UntagResourceResponse();
}

class UpdateClassifierResponse {
  UpdateClassifierResponse();
  static UpdateClassifierResponse fromJson(Map<String, dynamic> json) =>
      UpdateClassifierResponse();
}

class UpdateConnectionResponse {
  UpdateConnectionResponse();
  static UpdateConnectionResponse fromJson(Map<String, dynamic> json) =>
      UpdateConnectionResponse();
}

class UpdateCrawlerResponse {
  UpdateCrawlerResponse();
  static UpdateCrawlerResponse fromJson(Map<String, dynamic> json) =>
      UpdateCrawlerResponse();
}

class UpdateCrawlerScheduleResponse {
  UpdateCrawlerScheduleResponse();
  static UpdateCrawlerScheduleResponse fromJson(Map<String, dynamic> json) =>
      UpdateCrawlerScheduleResponse();
}

class UpdateCsvClassifierRequest {
  /// The name of the classifier.
  final String name;

  /// A custom symbol to denote what separates each column entry in the row.
  final String delimiter;

  /// A custom symbol to denote what combines content into a single column
  /// value. It must be different from the column delimiter.
  final String quoteSymbol;

  /// Indicates whether the CSV file contains a header.
  final String containsHeader;

  /// A list of strings representing column names.
  final List<String> header;

  /// Specifies not to trim values before identifying the type of column values.
  /// The default value is true.
  final bool disableValueTrimming;

  /// Enables the processing of files that contain only one column.
  final bool allowSingleColumn;

  UpdateCsvClassifierRequest({
    @required this.name,
    this.delimiter,
    this.quoteSymbol,
    this.containsHeader,
    this.header,
    this.disableValueTrimming,
    this.allowSingleColumn,
  });
}

class UpdateDatabaseResponse {
  UpdateDatabaseResponse();
  static UpdateDatabaseResponse fromJson(Map<String, dynamic> json) =>
      UpdateDatabaseResponse();
}

class UpdateDevEndpointResponse {
  UpdateDevEndpointResponse();
  static UpdateDevEndpointResponse fromJson(Map<String, dynamic> json) =>
      UpdateDevEndpointResponse();
}

class UpdateGrokClassifierRequest {
  /// The name of the `GrokClassifier`.
  final String name;

  /// An identifier of the data format that the classifier matches, such as
  /// Twitter, JSON, Omniture logs, Amazon CloudWatch Logs, and so on.
  final String classification;

  /// The grok pattern used by this classifier.
  final String grokPattern;

  /// Optional custom grok patterns used by this classifier.
  final String customPatterns;

  UpdateGrokClassifierRequest({
    @required this.name,
    this.classification,
    this.grokPattern,
    this.customPatterns,
  });
}

class UpdateJobResponse {
  /// Returns the name of the updated job definition.
  final String jobName;

  UpdateJobResponse({
    this.jobName,
  });
  static UpdateJobResponse fromJson(Map<String, dynamic> json) =>
      UpdateJobResponse();
}

class UpdateJsonClassifierRequest {
  /// The name of the classifier.
  final String name;

  /// A `JsonPath` string defining the JSON data for the classifier to classify.
  /// AWS Glue supports a subset of `JsonPath`, as described in [Writing
  /// JsonPath Custom
  /// Classifiers](https://docs.aws.amazon.com/glue/latest/dg/custom-classifier.html#custom-classifier-json).
  final String jsonPath;

  UpdateJsonClassifierRequest({
    @required this.name,
    this.jsonPath,
  });
}

class UpdateMLTransformResponse {
  /// The unique identifier for the transform that was updated.
  final String transformId;

  UpdateMLTransformResponse({
    this.transformId,
  });
  static UpdateMLTransformResponse fromJson(Map<String, dynamic> json) =>
      UpdateMLTransformResponse();
}

class UpdatePartitionResponse {
  UpdatePartitionResponse();
  static UpdatePartitionResponse fromJson(Map<String, dynamic> json) =>
      UpdatePartitionResponse();
}

class UpdateTableResponse {
  UpdateTableResponse();
  static UpdateTableResponse fromJson(Map<String, dynamic> json) =>
      UpdateTableResponse();
}

class UpdateTriggerResponse {
  /// The resulting trigger definition.
  final Trigger trigger;

  UpdateTriggerResponse({
    this.trigger,
  });
  static UpdateTriggerResponse fromJson(Map<String, dynamic> json) =>
      UpdateTriggerResponse();
}

class UpdateUserDefinedFunctionResponse {
  UpdateUserDefinedFunctionResponse();
  static UpdateUserDefinedFunctionResponse fromJson(
          Map<String, dynamic> json) =>
      UpdateUserDefinedFunctionResponse();
}

class UpdateWorkflowResponse {
  /// The name of the workflow which was specified in input.
  final String name;

  UpdateWorkflowResponse({
    this.name,
  });
  static UpdateWorkflowResponse fromJson(Map<String, dynamic> json) =>
      UpdateWorkflowResponse();
}

class UpdateXmlClassifierRequest {
  /// The name of the classifier.
  final String name;

  /// An identifier of the data format that the classifier matches.
  final String classification;

  /// The XML tag designating the element that contains each record in an XML
  /// document being parsed. This cannot identify a self-closing element (closed
  /// by `/>`). An empty row element that contains only attributes can be parsed
  /// as long as it ends with a closing tag (for example, `<row item\_a="A"
  /// item\_b="B"></row>` is okay, but `<row item\_a="A" item\_b="B" />` is
  /// not).
  final String rowTag;

  UpdateXmlClassifierRequest({
    @required this.name,
    this.classification,
    this.rowTag,
  });
}

class UserDefinedFunction {
  /// The name of the function.
  final String functionName;

  /// The Java class that contains the function code.
  final String className;

  /// The owner of the function.
  final String ownerName;

  /// The owner type.
  final String ownerType;

  /// The time at which the function was created.
  final DateTime createTime;

  /// The resource URIs for the function.
  final List<ResourceUri> resourceUris;

  UserDefinedFunction({
    this.functionName,
    this.className,
    this.ownerName,
    this.ownerType,
    this.createTime,
    this.resourceUris,
  });
  static UserDefinedFunction fromJson(Map<String, dynamic> json) =>
      UserDefinedFunction();
}

class UserDefinedFunctionInput {
  /// The name of the function.
  final String functionName;

  /// The Java class that contains the function code.
  final String className;

  /// The owner of the function.
  final String ownerName;

  /// The owner type.
  final String ownerType;

  /// The resource URIs for the function.
  final List<ResourceUri> resourceUris;

  UserDefinedFunctionInput({
    this.functionName,
    this.className,
    this.ownerName,
    this.ownerType,
    this.resourceUris,
  });
}

class Workflow {
  /// The name of the workflow representing the flow.
  final String name;

  /// A description of the workflow.
  final String description;

  /// A collection of properties to be used as part of each execution of the
  /// workflow.
  final Map<String, String> defaultRunProperties;

  /// The date and time when the workflow was created.
  final DateTime createdOn;

  /// The date and time when the workflow was last modified.
  final DateTime lastModifiedOn;

  /// The information about the last execution of the workflow.
  final WorkflowRun lastRun;

  /// The graph representing all the AWS Glue components that belong to the
  /// workflow as nodes and directed connections between them as edges.
  final WorkflowGraph graph;

  Workflow({
    this.name,
    this.description,
    this.defaultRunProperties,
    this.createdOn,
    this.lastModifiedOn,
    this.lastRun,
    this.graph,
  });
  static Workflow fromJson(Map<String, dynamic> json) => Workflow();
}

class WorkflowGraph {
  /// A list of the the AWS Glue components belong to the workflow represented
  /// as nodes.
  final List<Node> nodes;

  /// A list of all the directed connections between the nodes belonging to the
  /// workflow.
  final List<Edge> edges;

  WorkflowGraph({
    this.nodes,
    this.edges,
  });
  static WorkflowGraph fromJson(Map<String, dynamic> json) => WorkflowGraph();
}

class WorkflowRun {
  /// Name of the workflow which was executed.
  final String name;

  /// The ID of this workflow run.
  final String workflowRunId;

  /// The workflow run properties which were set during the run.
  final Map<String, String> workflowRunProperties;

  /// The date and time when the workflow run was started.
  final DateTime startedOn;

  /// The date and time when the workflow run completed.
  final DateTime completedOn;

  /// The status of the workflow run.
  final String status;

  /// The statistics of the run.
  final WorkflowRunStatistics statistics;

  /// The graph representing all the AWS Glue components that belong to the
  /// workflow as nodes and directed connections between them as edges.
  final WorkflowGraph graph;

  WorkflowRun({
    this.name,
    this.workflowRunId,
    this.workflowRunProperties,
    this.startedOn,
    this.completedOn,
    this.status,
    this.statistics,
    this.graph,
  });
  static WorkflowRun fromJson(Map<String, dynamic> json) => WorkflowRun();
}

class WorkflowRunStatistics {
  /// Total number of Actions in the workflow run.
  final int totalActions;

  /// Total number of Actions which timed out.
  final int timeoutActions;

  /// Total number of Actions which have failed.
  final int failedActions;

  /// Total number of Actions which have stopped.
  final int stoppedActions;

  /// Total number of Actions which have succeeded.
  final int succeededActions;

  /// Total number Actions in running state.
  final int runningActions;

  WorkflowRunStatistics({
    this.totalActions,
    this.timeoutActions,
    this.failedActions,
    this.stoppedActions,
    this.succeededActions,
    this.runningActions,
  });
  static WorkflowRunStatistics fromJson(Map<String, dynamic> json) =>
      WorkflowRunStatistics();
}

class XmlClassifier {
  /// The name of the classifier.
  final String name;

  /// An identifier of the data format that the classifier matches.
  final String classification;

  /// The time that this classifier was registered.
  final DateTime creationTime;

  /// The time that this classifier was last updated.
  final DateTime lastUpdated;

  /// The version of this classifier.
  final BigInt version;

  /// The XML tag designating the element that contains each record in an XML
  /// document being parsed. This can't identify a self-closing element (closed
  /// by `/>`). An empty row element that contains only attributes can be parsed
  /// as long as it ends with a closing tag (for example, `<row item\_a="A"
  /// item\_b="B"></row>` is okay, but `<row item\_a="A" item\_b="B" />` is
  /// not).
  final String rowTag;

  XmlClassifier({
    @required this.name,
    @required this.classification,
    this.creationTime,
    this.lastUpdated,
    this.version,
    this.rowTag,
  });
  static XmlClassifier fromJson(Map<String, dynamic> json) => XmlClassifier();
}
