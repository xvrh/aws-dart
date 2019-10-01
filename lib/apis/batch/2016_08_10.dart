import 'package:meta/meta.dart';

/// AWS Batch enables you to run batch computing workloads on the AWS Cloud.
/// Batch computing is a common way for developers, scientists, and engineers to
/// access large amounts of compute resources, and AWS Batch removes the
/// undifferentiated heavy lifting of configuring and managing the required
/// infrastructure. AWS Batch will be familiar to users of traditional batch
/// computing software. This service can efficiently provision resources in
/// response to jobs submitted in order to eliminate capacity constraints,
/// reduce compute costs, and deliver results quickly.
///
/// As a fully managed service, AWS Batch enables developers, scientists, and
/// engineers to run batch computing workloads of any scale. AWS Batch
/// automatically provisions compute resources and optimizes the workload
/// distribution based on the quantity and scale of the workloads. With AWS
/// Batch, there is no need to install or manage batch computing software, which
/// allows you to focus on analyzing results and solving problems. AWS Batch
/// reduces operational complexities, saves time, and reduces costs, which makes
/// it easy for developers, scientists, and engineers to run their batch jobs in
/// the AWS Cloud.
class BatchApi {
  final _client;
  BatchApi(client)
      : _client = client.configured('Batch', serializer: 'rest-json');

  /// Cancels a job in an AWS Batch job queue. Jobs that are in the `SUBMITTED`,
  /// `PENDING`, or `RUNNABLE` state are cancelled. Jobs that have progressed to
  /// `STARTING` or `RUNNING` are not cancelled (but the API operation still
  /// succeeds, even if no job is cancelled); these jobs must be terminated with
  /// the TerminateJob operation.
  ///
  /// [jobId]: The AWS Batch job ID of the job to cancel.
  ///
  /// [reason]: A message to attach to the job that explains the reason for
  /// canceling it. This message is returned by future DescribeJobs operations
  /// on the job. This message is also recorded in the AWS Batch activity logs.
  Future<CancelJobResponse> cancelJob(
      {@required String jobId, @required String reason}) async {
    var response_ = await _client.send('CancelJob', {
      'jobId': jobId,
      'reason': reason,
    });
    return CancelJobResponse.fromJson(response_);
  }

  /// Creates an AWS Batch compute environment. You can create `MANAGED` or
  /// `UNMANAGED` compute environments.
  ///
  /// In a managed compute environment, AWS Batch manages the capacity and
  /// instance types of the compute resources within the environment. This is
  /// based on the compute resource specification that you define or the
  /// [launch template](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-launch-templates.html)
  /// that you specify when you create the compute environment. You can choose
  /// to use Amazon EC2 On-Demand Instances or Spot Instances in your managed
  /// compute environment. You can optionally set a maximum price so that Spot
  /// Instances only launch when the Spot Instance price is below a specified
  /// percentage of the On-Demand price.
  ///
  ///  Multi-node parallel jobs are not supported on Spot Instances.
  ///
  /// In an unmanaged compute environment, you can manage your own compute
  /// resources. This provides more compute resource configuration options, such
  /// as using a custom AMI, but you must ensure that your AMI meets the Amazon
  /// ECS container instance AMI specification. For more information, see
  /// [Container Instance AMIs](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/container_instance_AMIs.html)
  /// in the _Amazon Elastic Container Service Developer Guide_. After you have
  /// created your unmanaged compute environment, you can use the
  /// DescribeComputeEnvironments operation to find the Amazon ECS cluster that
  /// is associated with it. Then, manually launch your container instances into
  /// that Amazon ECS cluster. For more information, see
  /// [Launching an Amazon ECS Container Instance](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/launch_container_instance.html)
  /// in the _Amazon Elastic Container Service Developer Guide_.
  ///
  ///
  ///
  /// AWS Batch does not upgrade the AMIs in a compute environment after it is
  /// created (for example, when a newer version of the Amazon ECS-optimized AMI
  /// is available). You are responsible for the management of the guest
  /// operating system (including updates and security patches) and any
  /// additional application software or utilities that you install on the
  /// compute resources. To use a new AMI for your AWS Batch jobs:
  ///
  /// 1.  Create a new compute environment with the new AMI.
  ///
  /// 2.  Add the compute environment to an existing job queue.
  ///
  /// 3.  Remove the old compute environment from your job queue.
  ///
  /// 4.  Delete the old compute environment.
  ///
  /// [computeEnvironmentName]: The name for your compute environment. Up to 128
  /// letters (uppercase and lowercase), numbers, hyphens, and underscores are
  /// allowed.
  ///
  /// [type]: The type of the compute environment. For more information, see
  /// [Compute Environments](https://docs.aws.amazon.com/batch/latest/userguide/compute_environments.html)
  /// in the _AWS Batch User Guide_.
  ///
  /// [state]: The state of the compute environment. If the state is `ENABLED`,
  /// then the compute environment accepts jobs from a queue and can scale out
  /// automatically based on queues.
  ///
  /// [computeResources]: Details of the compute resources managed by the
  /// compute environment. This parameter is required for managed compute
  /// environments. For more information, see
  /// [Compute Environments](https://docs.aws.amazon.com/batch/latest/userguide/compute_environments.html)
  /// in the _AWS Batch User Guide_.
  ///
  /// [serviceRole]: The full Amazon Resource Name (ARN) of the IAM role that
  /// allows AWS Batch to make calls to other AWS services on your behalf.
  ///
  /// If your specified role has a path other than `/`, then you must either
  /// specify the full role ARN (this is recommended) or prefix the role name
  /// with the path.
  ///
  ///
  ///
  /// Depending on how you created your AWS Batch service role, its ARN may
  /// contain the `service-role` path prefix. When you only specify the name of
  /// the service role, AWS Batch assumes that your ARN does not use the
  /// `service-role` path prefix. Because of this, we recommend that you specify
  /// the full ARN of your service role when you create compute environments.
  Future<CreateComputeEnvironmentResponse> createComputeEnvironment(
      {@required String computeEnvironmentName,
      @required String type,
      String state,
      ComputeResource computeResources,
      @required String serviceRole}) async {
    var response_ = await _client.send('CreateComputeEnvironment', {
      'computeEnvironmentName': computeEnvironmentName,
      'type': type,
      if (state != null) 'state': state,
      if (computeResources != null) 'computeResources': computeResources,
      'serviceRole': serviceRole,
    });
    return CreateComputeEnvironmentResponse.fromJson(response_);
  }

  /// Creates an AWS Batch job queue. When you create a job queue, you associate
  /// one or more compute environments to the queue and assign an order of
  /// preference for the compute environments.
  ///
  /// You also set a priority to the job queue that determines the order in
  /// which the AWS Batch scheduler places jobs onto its associated compute
  /// environments. For example, if a compute environment is associated with
  /// more than one job queue, the job queue with a higher priority is given
  /// preference for scheduling jobs to that compute environment.
  ///
  /// [jobQueueName]: The name of the job queue.
  ///
  /// [state]: The state of the job queue. If the job queue state is `ENABLED`,
  /// it is able to accept jobs.
  ///
  /// [priority]: The priority of the job queue. Job queues with a higher
  /// priority (or a higher integer value for the `priority` parameter) are
  /// evaluated first when associated with the same compute environment.
  /// Priority is determined in descending order, for example, a job queue with
  /// a priority value of `10` is given scheduling preference over a job queue
  /// with a priority value of `1`.
  ///
  /// [computeEnvironmentOrder]: The set of compute environments mapped to a job
  /// queue and their order relative to each other. The job scheduler uses this
  /// parameter to determine which compute environment should execute a given
  /// job. Compute environments must be in the `VALID` state before you can
  /// associate them with a job queue. You can associate up to three compute
  /// environments with a job queue.
  Future<CreateJobQueueResponse> createJobQueue(
      {@required String jobQueueName,
      String state,
      @required int priority,
      @required List<ComputeEnvironmentOrder> computeEnvironmentOrder}) async {
    var response_ = await _client.send('CreateJobQueue', {
      'jobQueueName': jobQueueName,
      if (state != null) 'state': state,
      'priority': priority,
      'computeEnvironmentOrder': computeEnvironmentOrder,
    });
    return CreateJobQueueResponse.fromJson(response_);
  }

  /// Deletes an AWS Batch compute environment.
  ///
  /// Before you can delete a compute environment, you must set its state to
  /// `DISABLED` with the UpdateComputeEnvironment API operation and
  /// disassociate it from any job queues with the UpdateJobQueue API operation.
  ///
  /// [computeEnvironment]: The name or Amazon Resource Name (ARN) of the
  /// compute environment to delete.
  Future<DeleteComputeEnvironmentResponse> deleteComputeEnvironment(
      String computeEnvironment) async {
    var response_ = await _client.send('DeleteComputeEnvironment', {
      'computeEnvironment': computeEnvironment,
    });
    return DeleteComputeEnvironmentResponse.fromJson(response_);
  }

  /// Deletes the specified job queue. You must first disable submissions for a
  /// queue with the UpdateJobQueue operation. All jobs in the queue are
  /// terminated when you delete a job queue.
  ///
  /// It is not necessary to disassociate compute environments from a queue
  /// before submitting a `DeleteJobQueue` request.
  ///
  /// [jobQueue]: The short name or full Amazon Resource Name (ARN) of the queue
  /// to delete.
  Future<DeleteJobQueueResponse> deleteJobQueue(String jobQueue) async {
    var response_ = await _client.send('DeleteJobQueue', {
      'jobQueue': jobQueue,
    });
    return DeleteJobQueueResponse.fromJson(response_);
  }

  /// Deregisters an AWS Batch job definition.
  ///
  /// [jobDefinition]: The name and revision (`name:revision`) or full Amazon
  /// Resource Name (ARN) of the job definition to deregister.
  Future<DeregisterJobDefinitionResponse> deregisterJobDefinition(
      String jobDefinition) async {
    var response_ = await _client.send('DeregisterJobDefinition', {
      'jobDefinition': jobDefinition,
    });
    return DeregisterJobDefinitionResponse.fromJson(response_);
  }

  /// Describes one or more of your compute environments.
  ///
  /// If you are using an unmanaged compute environment, you can use the
  /// `DescribeComputeEnvironment` operation to determine the `ecsClusterArn`
  /// that you should launch your Amazon ECS container instances into.
  ///
  /// [computeEnvironments]: A list of up to 100 compute environment names or
  /// full Amazon Resource Name (ARN) entries.
  ///
  /// [maxResults]: The maximum number of cluster results returned by
  /// `DescribeComputeEnvironments` in paginated output. When this parameter is
  /// used, `DescribeComputeEnvironments` only returns `maxResults` results in a
  /// single page along with a `nextToken` response element. The remaining
  /// results of the initial request can be seen by sending another
  /// `DescribeComputeEnvironments` request with the returned `nextToken` value.
  /// This value can be between 1 and 100. If this parameter is not used, then
  /// `DescribeComputeEnvironments` returns up to 100 results and a `nextToken`
  /// value if applicable.
  ///
  /// [nextToken]: The `nextToken` value returned from a previous paginated
  /// `DescribeComputeEnvironments` request where `maxResults` was used and the
  /// results exceeded the value of that parameter. Pagination continues from
  /// the end of the previous results that returned the `nextToken` value. This
  /// value is `null` when there are no more results to return.
  ///
  ///
  ///
  /// This token should be treated as an opaque identifier that is only used to
  /// retrieve the next items in a list and not for other programmatic purposes.
  Future<DescribeComputeEnvironmentsResponse> describeComputeEnvironments(
      {List<String> computeEnvironments,
      int maxResults,
      String nextToken}) async {
    var response_ = await _client.send('DescribeComputeEnvironments', {
      if (computeEnvironments != null)
        'computeEnvironments': computeEnvironments,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    });
    return DescribeComputeEnvironmentsResponse.fromJson(response_);
  }

  /// Describes a list of job definitions. You can specify a `status` (such as
  /// `ACTIVE`) to only return job definitions that match that status.
  ///
  /// [jobDefinitions]: A list of up to 100 job definition names or full Amazon
  /// Resource Name (ARN) entries.
  ///
  /// [maxResults]: The maximum number of results returned by
  /// `DescribeJobDefinitions` in paginated output. When this parameter is used,
  /// `DescribeJobDefinitions` only returns `maxResults` results in a single
  /// page along with a `nextToken` response element. The remaining results of
  /// the initial request can be seen by sending another
  /// `DescribeJobDefinitions` request with the returned `nextToken` value. This
  /// value can be between 1 and 100. If this parameter is not used, then
  /// `DescribeJobDefinitions` returns up to 100 results and a `nextToken` value
  /// if applicable.
  ///
  /// [jobDefinitionName]: The name of the job definition to describe.
  ///
  /// [status]: The status with which to filter job definitions.
  ///
  /// [nextToken]: The `nextToken` value returned from a previous paginated
  /// `DescribeJobDefinitions` request where `maxResults` was used and the
  /// results exceeded the value of that parameter. Pagination continues from
  /// the end of the previous results that returned the `nextToken` value. This
  /// value is `null` when there are no more results to return.
  ///
  ///
  ///
  /// This token should be treated as an opaque identifier that is only used to
  /// retrieve the next items in a list and not for other programmatic purposes.
  Future<DescribeJobDefinitionsResponse> describeJobDefinitions(
      {List<String> jobDefinitions,
      int maxResults,
      String jobDefinitionName,
      String status,
      String nextToken}) async {
    var response_ = await _client.send('DescribeJobDefinitions', {
      if (jobDefinitions != null) 'jobDefinitions': jobDefinitions,
      if (maxResults != null) 'maxResults': maxResults,
      if (jobDefinitionName != null) 'jobDefinitionName': jobDefinitionName,
      if (status != null) 'status': status,
      if (nextToken != null) 'nextToken': nextToken,
    });
    return DescribeJobDefinitionsResponse.fromJson(response_);
  }

  /// Describes one or more of your job queues.
  ///
  /// [jobQueues]: A list of up to 100 queue names or full queue Amazon Resource
  /// Name (ARN) entries.
  ///
  /// [maxResults]: The maximum number of results returned by
  /// `DescribeJobQueues` in paginated output. When this parameter is used,
  /// `DescribeJobQueues` only returns `maxResults` results in a single page
  /// along with a `nextToken` response element. The remaining results of the
  /// initial request can be seen by sending another `DescribeJobQueues` request
  /// with the returned `nextToken` value. This value can be between 1 and 100.
  /// If this parameter is not used, then `DescribeJobQueues` returns up to 100
  /// results and a `nextToken` value if applicable.
  ///
  /// [nextToken]: The `nextToken` value returned from a previous paginated
  /// `DescribeJobQueues` request where `maxResults` was used and the results
  /// exceeded the value of that parameter. Pagination continues from the end of
  /// the previous results that returned the `nextToken` value. This value is
  /// `null` when there are no more results to return.
  ///
  ///
  ///
  /// This token should be treated as an opaque identifier that is only used to
  /// retrieve the next items in a list and not for other programmatic purposes.
  Future<DescribeJobQueuesResponse> describeJobQueues(
      {List<String> jobQueues, int maxResults, String nextToken}) async {
    var response_ = await _client.send('DescribeJobQueues', {
      if (jobQueues != null) 'jobQueues': jobQueues,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    });
    return DescribeJobQueuesResponse.fromJson(response_);
  }

  /// Describes a list of AWS Batch jobs.
  ///
  /// [jobs]: A list of up to 100 job IDs.
  Future<DescribeJobsResponse> describeJobs(List<String> jobs) async {
    var response_ = await _client.send('DescribeJobs', {
      'jobs': jobs,
    });
    return DescribeJobsResponse.fromJson(response_);
  }

  /// Returns a list of AWS Batch jobs.
  ///
  /// You must specify only one of the following:
  ///
  /// *   a job queue ID to return a list of jobs in that job queue
  ///
  /// *   a multi-node parallel job ID to return a list of that job's nodes
  ///
  /// *   an array job ID to return a list of that job's children
  ///
  ///
  /// You can filter the results by job status with the `jobStatus` parameter.
  /// If you do not specify a status, only `RUNNING` jobs are returned.
  ///
  /// [jobQueue]: The name or full Amazon Resource Name (ARN) of the job queue
  /// with which to list jobs.
  ///
  /// [arrayJobId]: The job ID for an array job. Specifying an array job ID with
  /// this parameter lists all child jobs from within the specified array.
  ///
  /// [multiNodeJobId]: The job ID for a multi-node parallel job. Specifying a
  /// multi-node parallel job ID with this parameter lists all nodes that are
  /// associated with the specified job.
  ///
  /// [jobStatus]: The job status with which to filter jobs in the specified
  /// queue. If you do not specify a status, only `RUNNING` jobs are returned.
  ///
  /// [maxResults]: The maximum number of results returned by `ListJobs` in
  /// paginated output. When this parameter is used, `ListJobs` only returns
  /// `maxResults` results in a single page along with a `nextToken` response
  /// element. The remaining results of the initial request can be seen by
  /// sending another `ListJobs` request with the returned `nextToken` value.
  /// This value can be between 1 and 100. If this parameter is not used, then
  /// `ListJobs` returns up to 100 results and a `nextToken` value if
  /// applicable.
  ///
  /// [nextToken]: The `nextToken` value returned from a previous paginated
  /// `ListJobs` request where `maxResults` was used and the results exceeded
  /// the value of that parameter. Pagination continues from the end of the
  /// previous results that returned the `nextToken` value. This value is `null`
  /// when there are no more results to return.
  ///
  ///
  ///
  /// This token should be treated as an opaque identifier that is only used to
  /// retrieve the next items in a list and not for other programmatic purposes.
  Future<ListJobsResponse> listJobs(
      {String jobQueue,
      String arrayJobId,
      String multiNodeJobId,
      String jobStatus,
      int maxResults,
      String nextToken}) async {
    var response_ = await _client.send('ListJobs', {
      if (jobQueue != null) 'jobQueue': jobQueue,
      if (arrayJobId != null) 'arrayJobId': arrayJobId,
      if (multiNodeJobId != null) 'multiNodeJobId': multiNodeJobId,
      if (jobStatus != null) 'jobStatus': jobStatus,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    });
    return ListJobsResponse.fromJson(response_);
  }

  /// Registers an AWS Batch job definition.
  ///
  /// [jobDefinitionName]: The name of the job definition to register. Up to 128
  /// letters (uppercase and lowercase), numbers, hyphens, and underscores are
  /// allowed.
  ///
  /// [type]: The type of job definition.
  ///
  /// [parameters]: Default parameter substitution placeholders to set in the
  /// job definition. Parameters are specified as a key-value pair mapping.
  /// Parameters in a `SubmitJob` request override any corresponding parameter
  /// defaults from the job definition.
  ///
  /// [containerProperties]: An object with various properties specific to
  /// single-node container-based jobs. If the job definition's `type` parameter
  /// is `container`, then you must specify either `containerProperties` or
  /// `nodeProperties`.
  ///
  /// [nodeProperties]: An object with various properties specific to multi-node
  /// parallel jobs. If you specify node properties for a job, it becomes a
  /// multi-node parallel job. For more information, see
  /// [Multi-node Parallel Jobs](https://docs.aws.amazon.com/batch/latest/userguide/multi-node-parallel-jobs.html)
  /// in the _AWS Batch User Guide_. If the job definition's `type` parameter is
  /// `container`, then you must specify either `containerProperties` or
  /// `nodeProperties`.
  ///
  /// [retryStrategy]: The retry strategy to use for failed jobs that are
  /// submitted with this job definition. Any retry strategy that is specified
  /// during a SubmitJob operation overrides the retry strategy defined here. If
  /// a job is terminated due to a timeout, it is not retried.
  ///
  /// [timeout]: The timeout configuration for jobs that are submitted with this
  /// job definition, after which AWS Batch terminates your jobs if they have
  /// not finished. If a job is terminated due to a timeout, it is not retried.
  /// The minimum value for the timeout is 60 seconds. Any timeout configuration
  /// that is specified during a SubmitJob operation overrides the timeout
  /// configuration defined here. For more information, see
  /// [Job Timeouts](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/job_timeouts.html)
  /// in the _Amazon Elastic Container Service Developer Guide_.
  Future<RegisterJobDefinitionResponse> registerJobDefinition(
      {@required String jobDefinitionName,
      @required String type,
      Map<String, String> parameters,
      ContainerProperties containerProperties,
      NodeProperties nodeProperties,
      RetryStrategy retryStrategy,
      JobTimeout timeout}) async {
    var response_ = await _client.send('RegisterJobDefinition', {
      'jobDefinitionName': jobDefinitionName,
      'type': type,
      if (parameters != null) 'parameters': parameters,
      if (containerProperties != null)
        'containerProperties': containerProperties,
      if (nodeProperties != null) 'nodeProperties': nodeProperties,
      if (retryStrategy != null) 'retryStrategy': retryStrategy,
      if (timeout != null) 'timeout': timeout,
    });
    return RegisterJobDefinitionResponse.fromJson(response_);
  }

  /// Submits an AWS Batch job from a job definition. Parameters specified
  /// during SubmitJob override parameters defined in the job definition.
  ///
  /// [jobName]: The name of the job. The first character must be alphanumeric,
  /// and up to 128 letters (uppercase and lowercase), numbers, hyphens, and
  /// underscores are allowed.
  ///
  /// [jobQueue]: The job queue into which the job is submitted. You can specify
  /// either the name or the Amazon Resource Name (ARN) of the queue.
  ///
  /// [arrayProperties]: The array properties for the submitted job, such as the
  /// size of the array. The array size can be between 2 and 10,000. If you
  /// specify array properties for a job, it becomes an array job. For more
  /// information, see
  /// [Array Jobs](https://docs.aws.amazon.com/batch/latest/userguide/array_jobs.html)
  /// in the _AWS Batch User Guide_.
  ///
  /// [dependsOn]: A list of dependencies for the job. A job can depend upon a
  /// maximum of 20 jobs. You can specify a `SEQUENTIAL` type dependency without
  /// specifying a job ID for array jobs so that each child array job completes
  /// sequentially, starting at index 0. You can also specify an `N_TO_N` type
  /// dependency with a job ID for array jobs. In that case, each index child of
  /// this job must wait for the corresponding index child of each dependency to
  /// complete before it can begin.
  ///
  /// [jobDefinition]: The job definition used by this job. This value can be
  /// either a `name:revision` or the Amazon Resource Name (ARN) for the job
  /// definition.
  ///
  /// [parameters]: Additional parameters passed to the job that replace
  /// parameter substitution placeholders that are set in the job definition.
  /// Parameters are specified as a key and value pair mapping. Parameters in a
  /// `SubmitJob` request override any corresponding parameter defaults from the
  /// job definition.
  ///
  /// [containerOverrides]: A list of container overrides in JSON format that
  /// specify the name of a container in the specified job definition and the
  /// overrides it should receive. You can override the default command for a
  /// container (that is specified in the job definition or the Docker image)
  /// with a `command` override. You can also override existing environment
  /// variables (that are specified in the job definition or Docker image) on a
  /// container or add new environment variables to it with an `environment`
  /// override.
  ///
  /// [nodeOverrides]: A list of node overrides in JSON format that specify the
  /// node range to target and the container overrides for that node range.
  ///
  /// [retryStrategy]: The retry strategy to use for failed jobs from this
  /// SubmitJob operation. When a retry strategy is specified here, it overrides
  /// the retry strategy defined in the job definition.
  ///
  /// [timeout]: The timeout configuration for this SubmitJob operation. You can
  /// specify a timeout duration after which AWS Batch terminates your jobs if
  /// they have not finished. If a job is terminated due to a timeout, it is not
  /// retried. The minimum value for the timeout is 60 seconds. This
  /// configuration overrides any timeout configuration specified in the job
  /// definition. For array jobs, child jobs have the same timeout configuration
  /// as the parent job. For more information, see
  /// [Job Timeouts](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/job_timeouts.html)
  /// in the _Amazon Elastic Container Service Developer Guide_.
  Future<SubmitJobResponse> submitJob(
      {@required String jobName,
      @required String jobQueue,
      ArrayProperties arrayProperties,
      List<JobDependency> dependsOn,
      @required String jobDefinition,
      Map<String, String> parameters,
      ContainerOverrides containerOverrides,
      NodeOverrides nodeOverrides,
      RetryStrategy retryStrategy,
      JobTimeout timeout}) async {
    var response_ = await _client.send('SubmitJob', {
      'jobName': jobName,
      'jobQueue': jobQueue,
      if (arrayProperties != null) 'arrayProperties': arrayProperties,
      if (dependsOn != null) 'dependsOn': dependsOn,
      'jobDefinition': jobDefinition,
      if (parameters != null) 'parameters': parameters,
      if (containerOverrides != null) 'containerOverrides': containerOverrides,
      if (nodeOverrides != null) 'nodeOverrides': nodeOverrides,
      if (retryStrategy != null) 'retryStrategy': retryStrategy,
      if (timeout != null) 'timeout': timeout,
    });
    return SubmitJobResponse.fromJson(response_);
  }

  /// Terminates a job in a job queue. Jobs that are in the `STARTING` or
  /// `RUNNING` state are terminated, which causes them to transition to
  /// `FAILED`. Jobs that have not progressed to the `STARTING` state are
  /// cancelled.
  ///
  /// [jobId]: The AWS Batch job ID of the job to terminate.
  ///
  /// [reason]: A message to attach to the job that explains the reason for
  /// canceling it. This message is returned by future DescribeJobs operations
  /// on the job. This message is also recorded in the AWS Batch activity logs.
  Future<TerminateJobResponse> terminateJob(
      {@required String jobId, @required String reason}) async {
    var response_ = await _client.send('TerminateJob', {
      'jobId': jobId,
      'reason': reason,
    });
    return TerminateJobResponse.fromJson(response_);
  }

  /// Updates an AWS Batch compute environment.
  ///
  /// [computeEnvironment]: The name or full Amazon Resource Name (ARN) of the
  /// compute environment to update.
  ///
  /// [state]: The state of the compute environment. Compute environments in the
  /// `ENABLED` state can accept jobs from a queue and scale in or out
  /// automatically based on the workload demand of its associated queues.
  ///
  /// [computeResources]: Details of the compute resources managed by the
  /// compute environment. Required for a managed compute environment.
  ///
  /// [serviceRole]: The full Amazon Resource Name (ARN) of the IAM role that
  /// allows AWS Batch to make calls to other AWS services on your behalf.
  ///
  /// If your specified role has a path other than `/`, then you must either
  /// specify the full role ARN (this is recommended) or prefix the role name
  /// with the path.
  ///
  ///
  ///
  /// Depending on how you created your AWS Batch service role, its ARN may
  /// contain the `service-role` path prefix. When you only specify the name of
  /// the service role, AWS Batch assumes that your ARN does not use the
  /// `service-role` path prefix. Because of this, we recommend that you specify
  /// the full ARN of your service role when you create compute environments.
  Future<UpdateComputeEnvironmentResponse> updateComputeEnvironment(
      String computeEnvironment,
      {String state,
      ComputeResourceUpdate computeResources,
      String serviceRole}) async {
    var response_ = await _client.send('UpdateComputeEnvironment', {
      'computeEnvironment': computeEnvironment,
      if (state != null) 'state': state,
      if (computeResources != null) 'computeResources': computeResources,
      if (serviceRole != null) 'serviceRole': serviceRole,
    });
    return UpdateComputeEnvironmentResponse.fromJson(response_);
  }

  /// Updates a job queue.
  ///
  /// [jobQueue]: The name or the Amazon Resource Name (ARN) of the job queue.
  ///
  /// [state]: Describes the queue's ability to accept new jobs.
  ///
  /// [priority]: The priority of the job queue. Job queues with a higher
  /// priority (or a higher integer value for the `priority` parameter) are
  /// evaluated first when associated with the same compute environment.
  /// Priority is determined in descending order, for example, a job queue with
  /// a priority value of `10` is given scheduling preference over a job queue
  /// with a priority value of `1`.
  ///
  /// [computeEnvironmentOrder]: Details the set of compute environments mapped
  /// to a job queue and their order relative to each other. This is one of the
  /// parameters used by the job scheduler to determine which compute
  /// environment should execute a given job.
  Future<UpdateJobQueueResponse> updateJobQueue(String jobQueue,
      {String state,
      int priority,
      List<ComputeEnvironmentOrder> computeEnvironmentOrder}) async {
    var response_ = await _client.send('UpdateJobQueue', {
      'jobQueue': jobQueue,
      if (state != null) 'state': state,
      if (priority != null) 'priority': priority,
      if (computeEnvironmentOrder != null)
        'computeEnvironmentOrder': computeEnvironmentOrder,
    });
    return UpdateJobQueueResponse.fromJson(response_);
  }
}

/// An object representing an AWS Batch array job.
class ArrayProperties {
  /// The size of the array job.
  final int size;

  ArrayProperties({
    this.size,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// An object representing the array properties of a job.
class ArrayPropertiesDetail {
  /// A summary of the number of array job children in each available job
  /// status. This parameter is returned for parent array jobs.
  final Map<String, int> statusSummary;

  /// The size of the array job. This parameter is returned for parent array
  /// jobs.
  final int size;

  /// The job index within the array that is associated with this job. This
  /// parameter is returned for array job children.
  final int index;

  ArrayPropertiesDetail({
    this.statusSummary,
    this.size,
    this.index,
  });
  static ArrayPropertiesDetail fromJson(Map<String, dynamic> json) =>
      ArrayPropertiesDetail(
        statusSummary: json.containsKey('statusSummary')
            ? (json['statusSummary'] as Map)
                .map((k, v) => MapEntry(k as String, v as int))
            : null,
        size: json.containsKey('size') ? json['size'] as int : null,
        index: json.containsKey('index') ? json['index'] as int : null,
      );
}

/// An object representing the array properties of a job.
class ArrayPropertiesSummary {
  /// The size of the array job. This parameter is returned for parent array
  /// jobs.
  final int size;

  /// The job index within the array that is associated with this job. This
  /// parameter is returned for children of array jobs.
  final int index;

  ArrayPropertiesSummary({
    this.size,
    this.index,
  });
  static ArrayPropertiesSummary fromJson(Map<String, dynamic> json) =>
      ArrayPropertiesSummary(
        size: json.containsKey('size') ? json['size'] as int : null,
        index: json.containsKey('index') ? json['index'] as int : null,
      );
}

/// An object representing the details of a container that is part of a job
/// attempt.
class AttemptContainerDetail {
  /// The Amazon Resource Name (ARN) of the Amazon ECS container instance that
  /// hosts the job attempt.
  final String containerInstanceArn;

  /// The Amazon Resource Name (ARN) of the Amazon ECS task that is associated
  /// with the job attempt. Each container attempt receives a task ARN when they
  /// reach the `STARTING` status.
  final String taskArn;

  /// The exit code for the job attempt. A non-zero exit code is considered a
  /// failure.
  final int exitCode;

  /// A short (255 max characters) human-readable string to provide additional
  /// details about a running or stopped container.
  final String reason;

  /// The name of the CloudWatch Logs log stream associated with the container.
  /// The log group for AWS Batch jobs is `/aws/batch/job`. Each container
  /// attempt receives a log stream name when they reach the `RUNNING` status.
  final String logStreamName;

  /// The network interfaces associated with the job attempt.
  final List<NetworkInterface> networkInterfaces;

  AttemptContainerDetail({
    this.containerInstanceArn,
    this.taskArn,
    this.exitCode,
    this.reason,
    this.logStreamName,
    this.networkInterfaces,
  });
  static AttemptContainerDetail fromJson(Map<String, dynamic> json) =>
      AttemptContainerDetail(
        containerInstanceArn: json.containsKey('containerInstanceArn')
            ? json['containerInstanceArn'] as String
            : null,
        taskArn: json.containsKey('taskArn') ? json['taskArn'] as String : null,
        exitCode: json.containsKey('exitCode') ? json['exitCode'] as int : null,
        reason: json.containsKey('reason') ? json['reason'] as String : null,
        logStreamName: json.containsKey('logStreamName')
            ? json['logStreamName'] as String
            : null,
        networkInterfaces: json.containsKey('networkInterfaces')
            ? (json['networkInterfaces'] as List)
                .map((e) => NetworkInterface.fromJson(e))
                .toList()
            : null,
      );
}

/// An object representing a job attempt.
class AttemptDetail {
  /// Details about the container in this job attempt.
  final AttemptContainerDetail container;

  /// The Unix timestamp (in seconds and milliseconds) for when the attempt was
  /// started (when the attempt transitioned from the `STARTING` state to the
  /// `RUNNING` state).
  final BigInt startedAt;

  /// The Unix timestamp (in seconds and milliseconds) for when the attempt was
  /// stopped (when the attempt transitioned from the `RUNNING` state to a
  /// terminal state, such as `SUCCEEDED` or `FAILED`).
  final BigInt stoppedAt;

  /// A short, human-readable string to provide additional details about the
  /// current status of the job attempt.
  final String statusReason;

  AttemptDetail({
    this.container,
    this.startedAt,
    this.stoppedAt,
    this.statusReason,
  });
  static AttemptDetail fromJson(Map<String, dynamic> json) => AttemptDetail(
        container: json.containsKey('container')
            ? AttemptContainerDetail.fromJson(json['container'])
            : null,
        startedAt: json.containsKey('startedAt')
            ? BigInt.from(json['startedAt'])
            : null,
        stoppedAt: json.containsKey('stoppedAt')
            ? BigInt.from(json['stoppedAt'])
            : null,
        statusReason: json.containsKey('statusReason')
            ? json['statusReason'] as String
            : null,
      );
}

class CancelJobResponse {
  CancelJobResponse();
  static CancelJobResponse fromJson(Map<String, dynamic> json) =>
      CancelJobResponse();
}

/// An object representing an AWS Batch compute environment.
class ComputeEnvironmentDetail {
  /// The name of the compute environment.
  final String computeEnvironmentName;

  /// The Amazon Resource Name (ARN) of the compute environment.
  final String computeEnvironmentArn;

  /// The Amazon Resource Name (ARN) of the underlying Amazon ECS cluster used
  /// by the compute environment.
  final String ecsClusterArn;

  /// The type of the compute environment.
  final String type;

  /// The state of the compute environment. The valid values are `ENABLED` or
  /// `DISABLED`.
  ///
  /// If the state is `ENABLED`, then the AWS Batch scheduler can attempt to
  /// place jobs from an associated job queue on the compute resources within
  /// the environment. If the compute environment is managed, then it can scale
  /// its instances out or in automatically, based on the job queue demand.
  ///
  /// If the state is `DISABLED`, then the AWS Batch scheduler does not attempt
  /// to place jobs within the environment. Jobs in a `STARTING` or `RUNNING`
  /// state continue to progress normally. Managed compute environments in the
  /// `DISABLED` state do not scale out. However, they scale in to `minvCpus`
  /// value after instances become idle.
  final String state;

  /// The current status of the compute environment (for example, `CREATING` or
  /// `VALID`).
  final String status;

  /// A short, human-readable string to provide additional details about the
  /// current status of the compute environment.
  final String statusReason;

  /// The compute resources defined for the compute environment.
  final ComputeResource computeResources;

  /// The service role associated with the compute environment that allows AWS
  /// Batch to make calls to AWS API operations on your behalf.
  final String serviceRole;

  ComputeEnvironmentDetail({
    @required this.computeEnvironmentName,
    @required this.computeEnvironmentArn,
    @required this.ecsClusterArn,
    this.type,
    this.state,
    this.status,
    this.statusReason,
    this.computeResources,
    this.serviceRole,
  });
  static ComputeEnvironmentDetail fromJson(Map<String, dynamic> json) =>
      ComputeEnvironmentDetail(
        computeEnvironmentName: json['computeEnvironmentName'] as String,
        computeEnvironmentArn: json['computeEnvironmentArn'] as String,
        ecsClusterArn: json['ecsClusterArn'] as String,
        type: json.containsKey('type') ? json['type'] as String : null,
        state: json.containsKey('state') ? json['state'] as String : null,
        status: json.containsKey('status') ? json['status'] as String : null,
        statusReason: json.containsKey('statusReason')
            ? json['statusReason'] as String
            : null,
        computeResources: json.containsKey('computeResources')
            ? ComputeResource.fromJson(json['computeResources'])
            : null,
        serviceRole: json.containsKey('serviceRole')
            ? json['serviceRole'] as String
            : null,
      );
}

/// The order in which compute environments are tried for job placement within a
/// queue. Compute environments are tried in ascending order. For example, if
/// two compute environments are associated with a job queue, the compute
/// environment with a lower order integer value is tried for job placement
/// first.
class ComputeEnvironmentOrder {
  /// The order of the compute environment.
  final int order;

  /// The Amazon Resource Name (ARN) of the compute environment.
  final String computeEnvironment;

  ComputeEnvironmentOrder({
    @required this.order,
    @required this.computeEnvironment,
  });
  static ComputeEnvironmentOrder fromJson(Map<String, dynamic> json) =>
      ComputeEnvironmentOrder(
        order: json['order'] as int,
        computeEnvironment: json['computeEnvironment'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// An object representing an AWS Batch compute resource.
class ComputeResource {
  /// The type of compute environment: EC2 or SPOT.
  final String type;

  /// The minimum number of EC2 vCPUs that an environment should maintain (even
  /// if the compute environment is `DISABLED`).
  final int minvCpus;

  /// The maximum number of EC2 vCPUs that an environment can reach.
  final int maxvCpus;

  /// The desired number of EC2 vCPUS in the compute environment.
  final int desiredvCpus;

  /// The instances types that may be launched. You can specify instance
  /// families to launch any instance type within those families (for example,
  /// `c4` or `p3`), or you can specify specific sizes within a family (such as
  /// `c4.8xlarge`). You can also choose `optimal` to pick instance types (from
  /// the C, M, and R instance families) on the fly that match the demand of
  /// your job queues.
  final List<String> instanceTypes;

  /// The Amazon Machine Image (AMI) ID used for instances launched in the
  /// compute environment.
  final String imageId;

  /// The VPC subnets into which the compute resources are launched. For more
  /// information, see
  /// [VPCs and Subnets](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html)
  /// in the _Amazon VPC User Guide_.
  final List<String> subnets;

  /// The EC2 security group that is associated with instances launched in the
  /// compute environment.
  final List<String> securityGroupIds;

  /// The EC2 key pair that is used for instances launched in the compute
  /// environment.
  final String ec2KeyPair;

  /// The Amazon ECS instance profile applied to Amazon EC2 instances in a
  /// compute environment. You can specify the short name or full Amazon
  /// Resource Name (ARN) of an instance profile. For example,
  /// `_ecsInstanceRole_`  or
  /// `arn:aws:iam::_<aws_account_id>_:instance-profile/_ecsInstanceRole_` . For
  /// more information, see
  /// [Amazon ECS Instance Role](https://docs.aws.amazon.com/batch/latest/userguide/instance_IAM_role.html)
  /// in the _AWS Batch User Guide_.
  final String instanceRole;

  /// Key-value pair tags to be applied to resources that are launched in the
  /// compute environment. For AWS Batch, these take the form of "String1":
  /// "String2", where String1 is the tag key and String2 is the tag value—for
  /// example, { "Name": "AWS Batch Instance - C4OnDemand" }.
  final Map<String, String> tags;

  /// The Amazon EC2 placement group to associate with your compute resources.
  /// If you intend to submit multi-node parallel jobs to your compute
  /// environment, you should consider creating a cluster placement group and
  /// associate it with your compute resources. This keeps your multi-node
  /// parallel job on a logical grouping of instances within a single
  /// Availability Zone with high network flow potential. For more information,
  /// see
  /// [Placement Groups](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/placement-groups.html)
  /// in the _Amazon EC2 User Guide for Linux Instances_.
  final String placementGroup;

  /// The maximum percentage that a Spot Instance price can be when compared
  /// with the On-Demand price for that instance type before instances are
  /// launched. For example, if your maximum percentage is 20%, then the Spot
  /// price must be below 20% of the current On-Demand price for that EC2
  /// instance. You always pay the lowest (market) price and never more than
  /// your maximum percentage. If you leave this field empty, the default value
  /// is 100% of the On-Demand price.
  final int bidPercentage;

  /// The Amazon Resource Name (ARN) of the Amazon EC2 Spot Fleet IAM role
  /// applied to a `SPOT` compute environment. For more information, see
  /// [Amazon EC2 Spot Fleet Role](https://docs.aws.amazon.com/batch/latest/userguide/spot_fleet_IAM_role.html)
  /// in the _AWS Batch User Guide_.
  final String spotIamFleetRole;

  /// The launch template to use for your compute resources. Any other compute
  /// resource parameters that you specify in a CreateComputeEnvironment API
  /// operation override the same parameters in the launch template. You must
  /// specify either the launch template ID or launch template name in the
  /// request, but not both. For more information, see
  /// [Launch Template Support](https://docs.aws.amazon.com/batch/latest/userguide/launch-templates.html)
  /// in the _AWS Batch User Guide_.
  final LaunchTemplateSpecification launchTemplate;

  ComputeResource({
    @required this.type,
    @required this.minvCpus,
    @required this.maxvCpus,
    this.desiredvCpus,
    @required this.instanceTypes,
    this.imageId,
    @required this.subnets,
    this.securityGroupIds,
    this.ec2KeyPair,
    @required this.instanceRole,
    this.tags,
    this.placementGroup,
    this.bidPercentage,
    this.spotIamFleetRole,
    this.launchTemplate,
  });
  static ComputeResource fromJson(Map<String, dynamic> json) => ComputeResource(
        type: json['type'] as String,
        minvCpus: json['minvCpus'] as int,
        maxvCpus: json['maxvCpus'] as int,
        desiredvCpus: json.containsKey('desiredvCpus')
            ? json['desiredvCpus'] as int
            : null,
        instanceTypes:
            (json['instanceTypes'] as List).map((e) => e as String).toList(),
        imageId: json.containsKey('imageId') ? json['imageId'] as String : null,
        subnets: (json['subnets'] as List).map((e) => e as String).toList(),
        securityGroupIds: json.containsKey('securityGroupIds')
            ? (json['securityGroupIds'] as List)
                .map((e) => e as String)
                .toList()
            : null,
        ec2KeyPair: json.containsKey('ec2KeyPair')
            ? json['ec2KeyPair'] as String
            : null,
        instanceRole: json['instanceRole'] as String,
        tags: json.containsKey('tags')
            ? (json['tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        placementGroup: json.containsKey('placementGroup')
            ? json['placementGroup'] as String
            : null,
        bidPercentage: json.containsKey('bidPercentage')
            ? json['bidPercentage'] as int
            : null,
        spotIamFleetRole: json.containsKey('spotIamFleetRole')
            ? json['spotIamFleetRole'] as String
            : null,
        launchTemplate: json.containsKey('launchTemplate')
            ? LaunchTemplateSpecification.fromJson(json['launchTemplate'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// An object representing the attributes of a compute environment that can be
/// updated.
class ComputeResourceUpdate {
  /// The minimum number of EC2 vCPUs that an environment should maintain.
  final int minvCpus;

  /// The maximum number of EC2 vCPUs that an environment can reach.
  final int maxvCpus;

  /// The desired number of EC2 vCPUS in the compute environment.
  final int desiredvCpus;

  ComputeResourceUpdate({
    this.minvCpus,
    this.maxvCpus,
    this.desiredvCpus,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// An object representing the details of a container that is part of a job.
class ContainerDetail {
  /// The image used to start the container.
  final String image;

  /// The number of VCPUs allocated for the job.
  final int vcpus;

  /// The number of MiB of memory reserved for the job.
  final int memory;

  /// The command that is passed to the container.
  final List<String> command;

  /// The Amazon Resource Name (ARN) associated with the job upon execution.
  final String jobRoleArn;

  /// A list of volumes associated with the job.
  final List<Volume> volumes;

  /// The environment variables to pass to a container.
  ///
  ///
  ///
  /// Environment variables must not start with `AWS_BATCH`; this naming
  /// convention is reserved for variables that are set by the AWS Batch
  /// service.
  final List<KeyValuePair> environment;

  /// The mount points for data volumes in your container.
  final List<MountPoint> mountPoints;

  /// When this parameter is true, the container is given read-only access to
  /// its root file system.
  final bool readonlyRootFilesystem;

  /// A list of `ulimit` values to set in the container.
  final List<Ulimit> ulimits;

  /// When this parameter is true, the container is given elevated privileges on
  /// the host container instance (similar to the `root` user).
  final bool privileged;

  /// The user name to use inside the container.
  final String user;

  /// The exit code to return upon completion.
  final int exitCode;

  /// A short (255 max characters) human-readable string to provide additional
  /// details about a running or stopped container.
  final String reason;

  /// The Amazon Resource Name (ARN) of the container instance on which the
  /// container is running.
  final String containerInstanceArn;

  /// The Amazon Resource Name (ARN) of the Amazon ECS task that is associated
  /// with the container job. Each container attempt receives a task ARN when
  /// they reach the `STARTING` status.
  final String taskArn;

  /// The name of the CloudWatch Logs log stream associated with the container.
  /// The log group for AWS Batch jobs is `/aws/batch/job`. Each container
  /// attempt receives a log stream name when they reach the `RUNNING` status.
  final String logStreamName;

  /// The instance type of the underlying host infrastructure of a multi-node
  /// parallel job.
  final String instanceType;

  /// The network interfaces associated with the job.
  final List<NetworkInterface> networkInterfaces;

  /// The type and amount of a resource to assign to a container. Currently, the
  /// only supported resource is `GPU`.
  final List<ResourceRequirement> resourceRequirements;

  /// Linux-specific modifications that are applied to the container, such as
  /// details for device mappings.
  final LinuxParameters linuxParameters;

  ContainerDetail({
    this.image,
    this.vcpus,
    this.memory,
    this.command,
    this.jobRoleArn,
    this.volumes,
    this.environment,
    this.mountPoints,
    this.readonlyRootFilesystem,
    this.ulimits,
    this.privileged,
    this.user,
    this.exitCode,
    this.reason,
    this.containerInstanceArn,
    this.taskArn,
    this.logStreamName,
    this.instanceType,
    this.networkInterfaces,
    this.resourceRequirements,
    this.linuxParameters,
  });
  static ContainerDetail fromJson(Map<String, dynamic> json) => ContainerDetail(
        image: json.containsKey('image') ? json['image'] as String : null,
        vcpus: json.containsKey('vcpus') ? json['vcpus'] as int : null,
        memory: json.containsKey('memory') ? json['memory'] as int : null,
        command: json.containsKey('command')
            ? (json['command'] as List).map((e) => e as String).toList()
            : null,
        jobRoleArn: json.containsKey('jobRoleArn')
            ? json['jobRoleArn'] as String
            : null,
        volumes: json.containsKey('volumes')
            ? (json['volumes'] as List).map((e) => Volume.fromJson(e)).toList()
            : null,
        environment: json.containsKey('environment')
            ? (json['environment'] as List)
                .map((e) => KeyValuePair.fromJson(e))
                .toList()
            : null,
        mountPoints: json.containsKey('mountPoints')
            ? (json['mountPoints'] as List)
                .map((e) => MountPoint.fromJson(e))
                .toList()
            : null,
        readonlyRootFilesystem: json.containsKey('readonlyRootFilesystem')
            ? json['readonlyRootFilesystem'] as bool
            : null,
        ulimits: json.containsKey('ulimits')
            ? (json['ulimits'] as List).map((e) => Ulimit.fromJson(e)).toList()
            : null,
        privileged:
            json.containsKey('privileged') ? json['privileged'] as bool : null,
        user: json.containsKey('user') ? json['user'] as String : null,
        exitCode: json.containsKey('exitCode') ? json['exitCode'] as int : null,
        reason: json.containsKey('reason') ? json['reason'] as String : null,
        containerInstanceArn: json.containsKey('containerInstanceArn')
            ? json['containerInstanceArn'] as String
            : null,
        taskArn: json.containsKey('taskArn') ? json['taskArn'] as String : null,
        logStreamName: json.containsKey('logStreamName')
            ? json['logStreamName'] as String
            : null,
        instanceType: json.containsKey('instanceType')
            ? json['instanceType'] as String
            : null,
        networkInterfaces: json.containsKey('networkInterfaces')
            ? (json['networkInterfaces'] as List)
                .map((e) => NetworkInterface.fromJson(e))
                .toList()
            : null,
        resourceRequirements: json.containsKey('resourceRequirements')
            ? (json['resourceRequirements'] as List)
                .map((e) => ResourceRequirement.fromJson(e))
                .toList()
            : null,
        linuxParameters: json.containsKey('linuxParameters')
            ? LinuxParameters.fromJson(json['linuxParameters'])
            : null,
      );
}

/// The overrides that should be sent to a container.
class ContainerOverrides {
  /// The number of vCPUs to reserve for the container. This value overrides the
  /// value set in the job definition.
  final int vcpus;

  /// The number of MiB of memory reserved for the job. This value overrides the
  /// value set in the job definition.
  final int memory;

  /// The command to send to the container that overrides the default command
  /// from the Docker image or the job definition.
  final List<String> command;

  /// The instance type to use for a multi-node parallel job. This parameter is
  /// not valid for single-node container jobs.
  final String instanceType;

  /// The environment variables to send to the container. You can add new
  /// environment variables, which are added to the container at launch, or you
  /// can override the existing environment variables from the Docker image or
  /// the job definition.
  ///
  ///
  ///
  /// Environment variables must not start with `AWS_BATCH`; this naming
  /// convention is reserved for variables that are set by the AWS Batch
  /// service.
  final List<KeyValuePair> environment;

  /// The type and amount of a resource to assign to a container. This value
  /// overrides the value set in the job definition. Currently, the only
  /// supported resource is `GPU`.
  final List<ResourceRequirement> resourceRequirements;

  ContainerOverrides({
    this.vcpus,
    this.memory,
    this.command,
    this.instanceType,
    this.environment,
    this.resourceRequirements,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Container properties are used in job definitions to describe the container
/// that is launched as part of a job.
class ContainerProperties {
  /// The image used to start a container. This string is passed directly to the
  /// Docker daemon. Images in the Docker Hub registry are available by default.
  /// Other repositories are specified with  `_repository-url_/_image_:_tag_` .
  /// Up to 255 letters (uppercase and lowercase), numbers, hyphens,
  /// underscores, colons, periods, forward slashes, and number signs are
  /// allowed. This parameter maps to `Image` in the
  /// [Create a container](https://docs.docker.com/engine/api/v1.23/#create-a-container)
  /// section of the
  /// [Docker Remote API](https://docs.docker.com/engine/api/v1.23/) and the
  /// `IMAGE` parameter of
  /// [docker run](https://docs.docker.com/engine/reference/run/).
  ///
  /// *   Images in Amazon ECR repositories use the full registry and repository
  /// URI (for example,
  /// `012345678910.dkr.ecr.<region-name>.amazonaws.com/<repository-name>`).
  ///
  /// *   Images in official repositories on Docker Hub use a single name (for
  /// example, `ubuntu` or `mongo`).
  ///
  /// *   Images in other repositories on Docker Hub are qualified with an
  /// organization name (for example, `amazon/amazon-ecs-agent`).
  ///
  /// *   Images in other online repositories are qualified further by a domain
  /// name (for example, `quay.io/assemblyline/ubuntu`).
  final String image;

  /// The number of vCPUs reserved for the container. This parameter maps to
  /// `CpuShares` in the
  /// [Create a container](https://docs.docker.com/engine/api/v1.23/#create-a-container)
  /// section of the
  /// [Docker Remote API](https://docs.docker.com/engine/api/v1.23/) and the
  /// `--cpu-shares` option to
  /// [docker run](https://docs.docker.com/engine/reference/run/). Each vCPU is
  /// equivalent to 1,024 CPU shares. You must specify at least one vCPU.
  final int vcpus;

  /// The hard limit (in MiB) of memory to present to the container. If your
  /// container attempts to exceed the memory specified here, the container is
  /// killed. This parameter maps to `Memory` in the
  /// [Create a container](https://docs.docker.com/engine/api/v1.23/#create-a-container)
  /// section of the
  /// [Docker Remote API](https://docs.docker.com/engine/api/v1.23/) and the
  /// `--memory` option to
  /// [docker run](https://docs.docker.com/engine/reference/run/). You must
  /// specify at least 4 MiB of memory for a job.
  ///
  ///
  ///
  /// If you are trying to maximize your resource utilization by providing your
  /// jobs as much memory as possible for a particular instance type, see
  /// [Memory Management](https://docs.aws.amazon.com/batch/latest/userguide/memory-management.html)
  /// in the _AWS Batch User Guide_.
  final int memory;

  /// The command that is passed to the container. This parameter maps to `Cmd`
  /// in the
  /// [Create a container](https://docs.docker.com/engine/api/v1.23/#create-a-container)
  /// section of the
  /// [Docker Remote API](https://docs.docker.com/engine/api/v1.23/) and the
  /// `COMMAND` parameter to
  /// [docker run](https://docs.docker.com/engine/reference/run/). For more
  /// information, see
  /// [https://docs.docker.com/engine/reference/builder/#cmd](https://docs.docker.com/engine/reference/builder/#cmd).
  final List<String> command;

  /// The Amazon Resource Name (ARN) of the IAM role that the container can
  /// assume for AWS permissions.
  final String jobRoleArn;

  /// A list of data volumes used in a job.
  final List<Volume> volumes;

  /// The environment variables to pass to a container. This parameter maps to
  /// `Env` in the
  /// [Create a container](https://docs.docker.com/engine/api/v1.23/#create-a-container)
  /// section of the
  /// [Docker Remote API](https://docs.docker.com/engine/api/v1.23/) and the
  /// `--env` option to
  /// [docker run](https://docs.docker.com/engine/reference/run/).
  ///
  ///  We do not recommend using plaintext environment variables for sensitive
  /// information, such as credential data.
  ///
  /// Environment variables must not start with `AWS_BATCH`; this naming
  /// convention is reserved for variables that are set by the AWS Batch
  /// service.
  final List<KeyValuePair> environment;

  /// The mount points for data volumes in your container. This parameter maps
  /// to `Volumes` in the
  /// [Create a container](https://docs.docker.com/engine/api/v1.23/#create-a-container)
  /// section of the
  /// [Docker Remote API](https://docs.docker.com/engine/api/v1.23/) and the
  /// `--volume` option to
  /// [docker run](https://docs.docker.com/engine/reference/run/).
  final List<MountPoint> mountPoints;

  /// When this parameter is true, the container is given read-only access to
  /// its root file system. This parameter maps to `ReadonlyRootfs` in the
  /// [Create a container](https://docs.docker.com/engine/api/v1.23/#create-a-container)
  /// section of the
  /// [Docker Remote API](https://docs.docker.com/engine/api/v1.23/) and the
  /// `--read-only` option to `docker run`.
  final bool readonlyRootFilesystem;

  /// When this parameter is true, the container is given elevated privileges on
  /// the host container instance (similar to the `root` user). This parameter
  /// maps to `Privileged` in the
  /// [Create a container](https://docs.docker.com/engine/api/v1.23/#create-a-container)
  /// section of the
  /// [Docker Remote API](https://docs.docker.com/engine/api/v1.23/) and the
  /// `--privileged` option to
  /// [docker run](https://docs.docker.com/engine/reference/run/).
  final bool privileged;

  /// A list of `ulimits` to set in the container. This parameter maps to
  /// `Ulimits` in the
  /// [Create a container](https://docs.docker.com/engine/api/v1.23/#create-a-container)
  /// section of the
  /// [Docker Remote API](https://docs.docker.com/engine/api/v1.23/) and the
  /// `--ulimit` option to
  /// [docker run](https://docs.docker.com/engine/reference/run/).
  final List<Ulimit> ulimits;

  /// The user name to use inside the container. This parameter maps to `User`
  /// in the
  /// [Create a container](https://docs.docker.com/engine/api/v1.23/#create-a-container)
  /// section of the
  /// [Docker Remote API](https://docs.docker.com/engine/api/v1.23/) and the
  /// `--user` option to
  /// [docker run](https://docs.docker.com/engine/reference/run/).
  final String user;

  /// The instance type to use for a multi-node parallel job. Currently all node
  /// groups in a multi-node parallel job must use the same instance type. This
  /// parameter is not valid for single-node container jobs.
  final String instanceType;

  /// The type and amount of a resource to assign to a container. Currently, the
  /// only supported resource is `GPU`.
  final List<ResourceRequirement> resourceRequirements;

  /// Linux-specific modifications that are applied to the container, such as
  /// details for device mappings.
  final LinuxParameters linuxParameters;

  ContainerProperties({
    this.image,
    this.vcpus,
    this.memory,
    this.command,
    this.jobRoleArn,
    this.volumes,
    this.environment,
    this.mountPoints,
    this.readonlyRootFilesystem,
    this.privileged,
    this.ulimits,
    this.user,
    this.instanceType,
    this.resourceRequirements,
    this.linuxParameters,
  });
  static ContainerProperties fromJson(Map<String, dynamic> json) =>
      ContainerProperties(
        image: json.containsKey('image') ? json['image'] as String : null,
        vcpus: json.containsKey('vcpus') ? json['vcpus'] as int : null,
        memory: json.containsKey('memory') ? json['memory'] as int : null,
        command: json.containsKey('command')
            ? (json['command'] as List).map((e) => e as String).toList()
            : null,
        jobRoleArn: json.containsKey('jobRoleArn')
            ? json['jobRoleArn'] as String
            : null,
        volumes: json.containsKey('volumes')
            ? (json['volumes'] as List).map((e) => Volume.fromJson(e)).toList()
            : null,
        environment: json.containsKey('environment')
            ? (json['environment'] as List)
                .map((e) => KeyValuePair.fromJson(e))
                .toList()
            : null,
        mountPoints: json.containsKey('mountPoints')
            ? (json['mountPoints'] as List)
                .map((e) => MountPoint.fromJson(e))
                .toList()
            : null,
        readonlyRootFilesystem: json.containsKey('readonlyRootFilesystem')
            ? json['readonlyRootFilesystem'] as bool
            : null,
        privileged:
            json.containsKey('privileged') ? json['privileged'] as bool : null,
        ulimits: json.containsKey('ulimits')
            ? (json['ulimits'] as List).map((e) => Ulimit.fromJson(e)).toList()
            : null,
        user: json.containsKey('user') ? json['user'] as String : null,
        instanceType: json.containsKey('instanceType')
            ? json['instanceType'] as String
            : null,
        resourceRequirements: json.containsKey('resourceRequirements')
            ? (json['resourceRequirements'] as List)
                .map((e) => ResourceRequirement.fromJson(e))
                .toList()
            : null,
        linuxParameters: json.containsKey('linuxParameters')
            ? LinuxParameters.fromJson(json['linuxParameters'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// An object representing summary details of a container within a job.
class ContainerSummary {
  /// The exit code to return upon completion.
  final int exitCode;

  /// A short (255 max characters) human-readable string to provide additional
  /// details about a running or stopped container.
  final String reason;

  ContainerSummary({
    this.exitCode,
    this.reason,
  });
  static ContainerSummary fromJson(Map<String, dynamic> json) =>
      ContainerSummary(
        exitCode: json.containsKey('exitCode') ? json['exitCode'] as int : null,
        reason: json.containsKey('reason') ? json['reason'] as String : null,
      );
}

class CreateComputeEnvironmentResponse {
  /// The name of the compute environment.
  final String computeEnvironmentName;

  /// The Amazon Resource Name (ARN) of the compute environment.
  final String computeEnvironmentArn;

  CreateComputeEnvironmentResponse({
    this.computeEnvironmentName,
    this.computeEnvironmentArn,
  });
  static CreateComputeEnvironmentResponse fromJson(Map<String, dynamic> json) =>
      CreateComputeEnvironmentResponse(
        computeEnvironmentName: json.containsKey('computeEnvironmentName')
            ? json['computeEnvironmentName'] as String
            : null,
        computeEnvironmentArn: json.containsKey('computeEnvironmentArn')
            ? json['computeEnvironmentArn'] as String
            : null,
      );
}

class CreateJobQueueResponse {
  /// The name of the job queue.
  final String jobQueueName;

  /// The Amazon Resource Name (ARN) of the job queue.
  final String jobQueueArn;

  CreateJobQueueResponse({
    @required this.jobQueueName,
    @required this.jobQueueArn,
  });
  static CreateJobQueueResponse fromJson(Map<String, dynamic> json) =>
      CreateJobQueueResponse(
        jobQueueName: json['jobQueueName'] as String,
        jobQueueArn: json['jobQueueArn'] as String,
      );
}

class DeleteComputeEnvironmentResponse {
  DeleteComputeEnvironmentResponse();
  static DeleteComputeEnvironmentResponse fromJson(Map<String, dynamic> json) =>
      DeleteComputeEnvironmentResponse();
}

class DeleteJobQueueResponse {
  DeleteJobQueueResponse();
  static DeleteJobQueueResponse fromJson(Map<String, dynamic> json) =>
      DeleteJobQueueResponse();
}

class DeregisterJobDefinitionResponse {
  DeregisterJobDefinitionResponse();
  static DeregisterJobDefinitionResponse fromJson(Map<String, dynamic> json) =>
      DeregisterJobDefinitionResponse();
}

class DescribeComputeEnvironmentsResponse {
  /// The list of compute environments.
  final List<ComputeEnvironmentDetail> computeEnvironments;

  /// The `nextToken` value to include in a future `DescribeComputeEnvironments`
  /// request. When the results of a `DescribeJobDefinitions` request exceed
  /// `maxResults`, this value can be used to retrieve the next page of results.
  /// This value is `null` when there are no more results to return.
  final String nextToken;

  DescribeComputeEnvironmentsResponse({
    this.computeEnvironments,
    this.nextToken,
  });
  static DescribeComputeEnvironmentsResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeComputeEnvironmentsResponse(
        computeEnvironments: json.containsKey('computeEnvironments')
            ? (json['computeEnvironments'] as List)
                .map((e) => ComputeEnvironmentDetail.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

class DescribeJobDefinitionsResponse {
  /// The list of job definitions.
  final List<JobDefinition> jobDefinitions;

  /// The `nextToken` value to include in a future `DescribeJobDefinitions`
  /// request. When the results of a `DescribeJobDefinitions` request exceed
  /// `maxResults`, this value can be used to retrieve the next page of results.
  /// This value is `null` when there are no more results to return.
  final String nextToken;

  DescribeJobDefinitionsResponse({
    this.jobDefinitions,
    this.nextToken,
  });
  static DescribeJobDefinitionsResponse fromJson(Map<String, dynamic> json) =>
      DescribeJobDefinitionsResponse(
        jobDefinitions: json.containsKey('jobDefinitions')
            ? (json['jobDefinitions'] as List)
                .map((e) => JobDefinition.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

class DescribeJobQueuesResponse {
  /// The list of job queues.
  final List<JobQueueDetail> jobQueues;

  /// The `nextToken` value to include in a future `DescribeJobQueues` request.
  /// When the results of a `DescribeJobQueues` request exceed `maxResults`,
  /// this value can be used to retrieve the next page of results. This value is
  /// `null` when there are no more results to return.
  final String nextToken;

  DescribeJobQueuesResponse({
    this.jobQueues,
    this.nextToken,
  });
  static DescribeJobQueuesResponse fromJson(Map<String, dynamic> json) =>
      DescribeJobQueuesResponse(
        jobQueues: json.containsKey('jobQueues')
            ? (json['jobQueues'] as List)
                .map((e) => JobQueueDetail.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

class DescribeJobsResponse {
  /// The list of jobs.
  final List<JobDetail> jobs;

  DescribeJobsResponse({
    this.jobs,
  });
  static DescribeJobsResponse fromJson(Map<String, dynamic> json) =>
      DescribeJobsResponse(
        jobs: json.containsKey('jobs')
            ? (json['jobs'] as List).map((e) => JobDetail.fromJson(e)).toList()
            : null,
      );
}

/// An object representing a container instance host device.
class Device {
  /// The path for the device on the host container instance.
  final String hostPath;

  /// The path inside the container at which to expose the host device. By
  /// default the `hostPath` value is used.
  final String containerPath;

  /// The explicit permissions to provide to the container for the device. By
  /// default, the container has permissions for `read`, `write`, and `mknod`
  /// for the device.
  final List<String> permissions;

  Device({
    @required this.hostPath,
    this.containerPath,
    this.permissions,
  });
  static Device fromJson(Map<String, dynamic> json) => Device(
        hostPath: json['hostPath'] as String,
        containerPath: json.containsKey('containerPath')
            ? json['containerPath'] as String
            : null,
        permissions: json.containsKey('permissions')
            ? (json['permissions'] as List).map((e) => e as String).toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Determine whether your data volume persists on the host container instance
/// and where it is stored. If this parameter is empty, then the Docker daemon
/// assigns a host path for your data volume, but the data is not guaranteed to
/// persist after the containers associated with it stop running.
class Host {
  /// The path on the host container instance that is presented to the
  /// container. If this parameter is empty, then the Docker daemon has assigned
  /// a host path for you. If this parameter contains a file location, then the
  /// data volume persists at the specified location on the host container
  /// instance until you delete it manually. If the source path location does
  /// not exist on the host container instance, the Docker daemon creates it. If
  /// the location does exist, the contents of the source path folder are
  /// exported.
  final String sourcePath;

  Host({
    this.sourcePath,
  });
  static Host fromJson(Map<String, dynamic> json) => Host(
        sourcePath: json.containsKey('sourcePath')
            ? json['sourcePath'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// An object representing an AWS Batch job definition.
class JobDefinition {
  /// The name of the job definition.
  final String jobDefinitionName;

  /// The Amazon Resource Name (ARN) for the job definition.
  final String jobDefinitionArn;

  /// The revision of the job definition.
  final int revision;

  /// The status of the job definition.
  final String status;

  /// The type of job definition.
  final String type;

  /// Default parameters or parameter substitution placeholders that are set in
  /// the job definition. Parameters are specified as a key-value pair mapping.
  /// Parameters in a `SubmitJob` request override any corresponding parameter
  /// defaults from the job definition. For more information about specifying
  /// parameters, see
  /// [Job Definition Parameters](https://docs.aws.amazon.com/batch/latest/userguide/job_definition_parameters.html)
  /// in the _AWS Batch User Guide_.
  final Map<String, String> parameters;

  /// The retry strategy to use for failed jobs that are submitted with this job
  /// definition.
  final RetryStrategy retryStrategy;

  /// An object with various properties specific to container-based jobs.
  final ContainerProperties containerProperties;

  /// The timeout configuration for jobs that are submitted with this job
  /// definition. You can specify a timeout duration after which AWS Batch
  /// terminates your jobs if they have not finished.
  final JobTimeout timeout;

  /// An object with various properties specific to multi-node parallel jobs.
  final NodeProperties nodeProperties;

  JobDefinition({
    @required this.jobDefinitionName,
    @required this.jobDefinitionArn,
    @required this.revision,
    this.status,
    @required this.type,
    this.parameters,
    this.retryStrategy,
    this.containerProperties,
    this.timeout,
    this.nodeProperties,
  });
  static JobDefinition fromJson(Map<String, dynamic> json) => JobDefinition(
        jobDefinitionName: json['jobDefinitionName'] as String,
        jobDefinitionArn: json['jobDefinitionArn'] as String,
        revision: json['revision'] as int,
        status: json.containsKey('status') ? json['status'] as String : null,
        type: json['type'] as String,
        parameters: json.containsKey('parameters')
            ? (json['parameters'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        retryStrategy: json.containsKey('retryStrategy')
            ? RetryStrategy.fromJson(json['retryStrategy'])
            : null,
        containerProperties: json.containsKey('containerProperties')
            ? ContainerProperties.fromJson(json['containerProperties'])
            : null,
        timeout: json.containsKey('timeout')
            ? JobTimeout.fromJson(json['timeout'])
            : null,
        nodeProperties: json.containsKey('nodeProperties')
            ? NodeProperties.fromJson(json['nodeProperties'])
            : null,
      );
}

/// An object representing an AWS Batch job dependency.
class JobDependency {
  /// The job ID of the AWS Batch job associated with this dependency.
  final String jobId;

  /// The type of the job dependency.
  final String type;

  JobDependency({
    this.jobId,
    this.type,
  });
  static JobDependency fromJson(Map<String, dynamic> json) => JobDependency(
        jobId: json.containsKey('jobId') ? json['jobId'] as String : null,
        type: json.containsKey('type') ? json['type'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// An object representing an AWS Batch job.
class JobDetail {
  /// The name of the job.
  final String jobName;

  /// The ID for the job.
  final String jobId;

  /// The Amazon Resource Name (ARN) of the job queue with which the job is
  /// associated.
  final String jobQueue;

  /// The current status for the job.
  ///
  ///
  ///
  /// If your jobs do not progress to `STARTING`, see
  /// [Jobs Stuck in RUNNABLE Status](https://docs.aws.amazon.com/batch/latest/userguide/troubleshooting.html#job_stuck_in_runnable)
  /// in the troubleshooting section of the _AWS Batch User Guide_.
  final String status;

  /// A list of job attempts associated with this job.
  final List<AttemptDetail> attempts;

  /// A short, human-readable string to provide additional details about the
  /// current status of the job.
  final String statusReason;

  /// The Unix timestamp (in seconds and milliseconds) for when the job was
  /// created. For non-array jobs and parent array jobs, this is when the job
  /// entered the `SUBMITTED` state (at the time SubmitJob was called). For
  /// array child jobs, this is when the child job was spawned by its parent and
  /// entered the `PENDING` state.
  final BigInt createdAt;

  /// The retry strategy to use for this job if an attempt fails.
  final RetryStrategy retryStrategy;

  /// The Unix timestamp (in seconds and milliseconds) for when the job was
  /// started (when the job transitioned from the `STARTING` state to the
  /// `RUNNING` state).
  final BigInt startedAt;

  /// The Unix timestamp (in seconds and milliseconds) for when the job was
  /// stopped (when the job transitioned from the `RUNNING` state to a terminal
  /// state, such as `SUCCEEDED` or `FAILED`).
  final BigInt stoppedAt;

  /// A list of job names or IDs on which this job depends.
  final List<JobDependency> dependsOn;

  /// The job definition that is used by this job.
  final String jobDefinition;

  /// Additional parameters passed to the job that replace parameter
  /// substitution placeholders or override any corresponding parameter defaults
  /// from the job definition.
  final Map<String, String> parameters;

  /// An object representing the details of the container that is associated
  /// with the job.
  final ContainerDetail container;

  /// An object representing the details of a node that is associated with a
  /// multi-node parallel job.
  final NodeDetails nodeDetails;

  /// An object representing the node properties of a multi-node parallel job.
  final NodeProperties nodeProperties;

  /// The array properties of the job, if it is an array job.
  final ArrayPropertiesDetail arrayProperties;

  /// The timeout configuration for the job.
  final JobTimeout timeout;

  JobDetail({
    @required this.jobName,
    @required this.jobId,
    @required this.jobQueue,
    @required this.status,
    this.attempts,
    this.statusReason,
    this.createdAt,
    this.retryStrategy,
    @required this.startedAt,
    this.stoppedAt,
    this.dependsOn,
    @required this.jobDefinition,
    this.parameters,
    this.container,
    this.nodeDetails,
    this.nodeProperties,
    this.arrayProperties,
    this.timeout,
  });
  static JobDetail fromJson(Map<String, dynamic> json) => JobDetail(
        jobName: json['jobName'] as String,
        jobId: json['jobId'] as String,
        jobQueue: json['jobQueue'] as String,
        status: json['status'] as String,
        attempts: json.containsKey('attempts')
            ? (json['attempts'] as List)
                .map((e) => AttemptDetail.fromJson(e))
                .toList()
            : null,
        statusReason: json.containsKey('statusReason')
            ? json['statusReason'] as String
            : null,
        createdAt: json.containsKey('createdAt')
            ? BigInt.from(json['createdAt'])
            : null,
        retryStrategy: json.containsKey('retryStrategy')
            ? RetryStrategy.fromJson(json['retryStrategy'])
            : null,
        startedAt: BigInt.from(json['startedAt']),
        stoppedAt: json.containsKey('stoppedAt')
            ? BigInt.from(json['stoppedAt'])
            : null,
        dependsOn: json.containsKey('dependsOn')
            ? (json['dependsOn'] as List)
                .map((e) => JobDependency.fromJson(e))
                .toList()
            : null,
        jobDefinition: json['jobDefinition'] as String,
        parameters: json.containsKey('parameters')
            ? (json['parameters'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        container: json.containsKey('container')
            ? ContainerDetail.fromJson(json['container'])
            : null,
        nodeDetails: json.containsKey('nodeDetails')
            ? NodeDetails.fromJson(json['nodeDetails'])
            : null,
        nodeProperties: json.containsKey('nodeProperties')
            ? NodeProperties.fromJson(json['nodeProperties'])
            : null,
        arrayProperties: json.containsKey('arrayProperties')
            ? ArrayPropertiesDetail.fromJson(json['arrayProperties'])
            : null,
        timeout: json.containsKey('timeout')
            ? JobTimeout.fromJson(json['timeout'])
            : null,
      );
}

/// An object representing the details of an AWS Batch job queue.
class JobQueueDetail {
  /// The name of the job queue.
  final String jobQueueName;

  /// The Amazon Resource Name (ARN) of the job queue.
  final String jobQueueArn;

  /// Describes the ability of the queue to accept new jobs.
  final String state;

  /// The status of the job queue (for example, `CREATING` or `VALID`).
  final String status;

  /// A short, human-readable string to provide additional details about the
  /// current status of the job queue.
  final String statusReason;

  /// The priority of the job queue.
  final int priority;

  /// The compute environments that are attached to the job queue and the order
  /// in which job placement is preferred. Compute environments are selected for
  /// job placement in ascending order.
  final List<ComputeEnvironmentOrder> computeEnvironmentOrder;

  JobQueueDetail({
    @required this.jobQueueName,
    @required this.jobQueueArn,
    @required this.state,
    this.status,
    this.statusReason,
    @required this.priority,
    @required this.computeEnvironmentOrder,
  });
  static JobQueueDetail fromJson(Map<String, dynamic> json) => JobQueueDetail(
        jobQueueName: json['jobQueueName'] as String,
        jobQueueArn: json['jobQueueArn'] as String,
        state: json['state'] as String,
        status: json.containsKey('status') ? json['status'] as String : null,
        statusReason: json.containsKey('statusReason')
            ? json['statusReason'] as String
            : null,
        priority: json['priority'] as int,
        computeEnvironmentOrder: (json['computeEnvironmentOrder'] as List)
            .map((e) => ComputeEnvironmentOrder.fromJson(e))
            .toList(),
      );
}

/// An object representing summary details of a job.
class JobSummary {
  /// The ID of the job.
  final String jobId;

  /// The name of the job.
  final String jobName;

  /// The Unix timestamp for when the job was created. For non-array jobs and
  /// parent array jobs, this is when the job entered the `SUBMITTED` state (at
  /// the time SubmitJob was called). For array child jobs, this is when the
  /// child job was spawned by its parent and entered the `PENDING` state.
  final BigInt createdAt;

  /// The current status for the job.
  final String status;

  /// A short, human-readable string to provide additional details about the
  /// current status of the job.
  final String statusReason;

  /// The Unix timestamp for when the job was started (when the job transitioned
  /// from the `STARTING` state to the `RUNNING` state).
  final BigInt startedAt;

  /// The Unix timestamp for when the job was stopped (when the job transitioned
  /// from the `RUNNING` state to a terminal state, such as `SUCCEEDED` or
  /// `FAILED`).
  final BigInt stoppedAt;

  /// An object representing the details of the container that is associated
  /// with the job.
  final ContainerSummary container;

  /// The array properties of the job, if it is an array job.
  final ArrayPropertiesSummary arrayProperties;

  /// The node properties for a single node in a job summary list.
  final NodePropertiesSummary nodeProperties;

  JobSummary({
    @required this.jobId,
    @required this.jobName,
    this.createdAt,
    this.status,
    this.statusReason,
    this.startedAt,
    this.stoppedAt,
    this.container,
    this.arrayProperties,
    this.nodeProperties,
  });
  static JobSummary fromJson(Map<String, dynamic> json) => JobSummary(
        jobId: json['jobId'] as String,
        jobName: json['jobName'] as String,
        createdAt: json.containsKey('createdAt')
            ? BigInt.from(json['createdAt'])
            : null,
        status: json.containsKey('status') ? json['status'] as String : null,
        statusReason: json.containsKey('statusReason')
            ? json['statusReason'] as String
            : null,
        startedAt: json.containsKey('startedAt')
            ? BigInt.from(json['startedAt'])
            : null,
        stoppedAt: json.containsKey('stoppedAt')
            ? BigInt.from(json['stoppedAt'])
            : null,
        container: json.containsKey('container')
            ? ContainerSummary.fromJson(json['container'])
            : null,
        arrayProperties: json.containsKey('arrayProperties')
            ? ArrayPropertiesSummary.fromJson(json['arrayProperties'])
            : null,
        nodeProperties: json.containsKey('nodeProperties')
            ? NodePropertiesSummary.fromJson(json['nodeProperties'])
            : null,
      );
}

/// An object representing a job timeout configuration.
class JobTimeout {
  /// The time duration in seconds (measured from the job attempt's `startedAt`
  /// timestamp) after which AWS Batch terminates your jobs if they have not
  /// finished.
  final int attemptDurationSeconds;

  JobTimeout({
    this.attemptDurationSeconds,
  });
  static JobTimeout fromJson(Map<String, dynamic> json) => JobTimeout(
        attemptDurationSeconds: json.containsKey('attemptDurationSeconds')
            ? json['attemptDurationSeconds'] as int
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A key-value pair object.
class KeyValuePair {
  /// The name of the key-value pair. For environment variables, this is the
  /// name of the environment variable.
  final String name;

  /// The value of the key-value pair. For environment variables, this is the
  /// value of the environment variable.
  final String value;

  KeyValuePair({
    this.name,
    this.value,
  });
  static KeyValuePair fromJson(Map<String, dynamic> json) => KeyValuePair(
        name: json.containsKey('name') ? json['name'] as String : null,
        value: json.containsKey('value') ? json['value'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// An object representing a launch template associated with a compute resource.
/// You must specify either the launch template ID or launch template name in
/// the request, but not both.
class LaunchTemplateSpecification {
  /// The ID of the launch template.
  final String launchTemplateId;

  /// The name of the launch template.
  final String launchTemplateName;

  /// The version number of the launch template.
  ///
  /// Default: The default version of the launch template.
  final String version;

  LaunchTemplateSpecification({
    this.launchTemplateId,
    this.launchTemplateName,
    this.version,
  });
  static LaunchTemplateSpecification fromJson(Map<String, dynamic> json) =>
      LaunchTemplateSpecification(
        launchTemplateId: json.containsKey('launchTemplateId')
            ? json['launchTemplateId'] as String
            : null,
        launchTemplateName: json.containsKey('launchTemplateName')
            ? json['launchTemplateName'] as String
            : null,
        version: json.containsKey('version') ? json['version'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Linux-specific modifications that are applied to the container, such as
/// details for device mappings.
class LinuxParameters {
  /// Any host devices to expose to the container. This parameter maps to
  /// `Devices` in the
  /// [Create a container](https://docs.docker.com/engine/api/v1.23/#create-a-container)
  /// section of the
  /// [Docker Remote API](https://docs.docker.com/engine/api/v1.23/) and the
  /// `--device` option to
  /// [docker run](https://docs.docker.com/engine/reference/run/).
  final List<Device> devices;

  LinuxParameters({
    this.devices,
  });
  static LinuxParameters fromJson(Map<String, dynamic> json) => LinuxParameters(
        devices: json.containsKey('devices')
            ? (json['devices'] as List).map((e) => Device.fromJson(e)).toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class ListJobsResponse {
  /// A list of job summaries that match the request.
  final List<JobSummary> jobSummaryList;

  /// The `nextToken` value to include in a future `ListJobs` request. When the
  /// results of a `ListJobs` request exceed `maxResults`, this value can be
  /// used to retrieve the next page of results. This value is `null` when there
  /// are no more results to return.
  final String nextToken;

  ListJobsResponse({
    @required this.jobSummaryList,
    this.nextToken,
  });
  static ListJobsResponse fromJson(Map<String, dynamic> json) =>
      ListJobsResponse(
        jobSummaryList: (json['jobSummaryList'] as List)
            .map((e) => JobSummary.fromJson(e))
            .toList(),
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

/// Details on a Docker volume mount point that is used in a job's container
/// properties. This parameter maps to `Volumes` in the
/// [Create a container](https://docs.docker.com/engine/reference/api/docker_remote_api_v1.19/#create-a-container)
/// section of the Docker Remote API and the `--volume` option to docker run.
class MountPoint {
  /// The path on the container at which to mount the host volume.
  final String containerPath;

  /// If this value is `true`, the container has read-only access to the volume;
  /// otherwise, the container can write to the volume. The default value is
  /// `false`.
  final bool readOnly;

  /// The name of the volume to mount.
  final String sourceVolume;

  MountPoint({
    this.containerPath,
    this.readOnly,
    this.sourceVolume,
  });
  static MountPoint fromJson(Map<String, dynamic> json) => MountPoint(
        containerPath: json.containsKey('containerPath')
            ? json['containerPath'] as String
            : null,
        readOnly:
            json.containsKey('readOnly') ? json['readOnly'] as bool : null,
        sourceVolume: json.containsKey('sourceVolume')
            ? json['sourceVolume'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// An object representing the elastic network interface for a multi-node
/// parallel job node.
class NetworkInterface {
  /// The attachment ID for the network interface.
  final String attachmentId;

  /// The private IPv6 address for the network interface.
  final String ipv6Address;

  /// The private IPv4 address for the network interface.
  final String privateIpv4Address;

  NetworkInterface({
    this.attachmentId,
    this.ipv6Address,
    this.privateIpv4Address,
  });
  static NetworkInterface fromJson(Map<String, dynamic> json) =>
      NetworkInterface(
        attachmentId: json.containsKey('attachmentId')
            ? json['attachmentId'] as String
            : null,
        ipv6Address: json.containsKey('ipv6Address')
            ? json['ipv6Address'] as String
            : null,
        privateIpv4Address: json.containsKey('privateIpv4Address')
            ? json['privateIpv4Address'] as String
            : null,
      );
}

/// An object representing the details of a multi-node parallel job node.
class NodeDetails {
  /// The node index for the node. Node index numbering begins at zero. This
  /// index is also available on the node with the `AWS_BATCH_JOB_NODE_INDEX`
  /// environment variable.
  final int nodeIndex;

  /// Specifies whether the current node is the main node for a multi-node
  /// parallel job.
  final bool isMainNode;

  NodeDetails({
    this.nodeIndex,
    this.isMainNode,
  });
  static NodeDetails fromJson(Map<String, dynamic> json) => NodeDetails(
        nodeIndex:
            json.containsKey('nodeIndex') ? json['nodeIndex'] as int : null,
        isMainNode:
            json.containsKey('isMainNode') ? json['isMainNode'] as bool : null,
      );
}

/// Object representing any node overrides to a job definition that is used in a
/// SubmitJob API operation.
class NodeOverrides {
  /// The number of nodes to use with a multi-node parallel job. This value
  /// overrides the number of nodes that are specified in the job definition. To
  /// use this override:
  ///
  /// *   There must be at least one node range in your job definition that has
  /// an open upper boundary (such as `:` or `n:`).
  ///
  /// *   The lower boundary of the node range specified in the job definition
  /// must be fewer than the number of nodes specified in the override.
  ///
  /// *   The main node index specified in the job definition must be fewer than
  /// the number of nodes specified in the override.
  final int numNodes;

  /// The node property overrides for the job.
  final List<NodePropertyOverride> nodePropertyOverrides;

  NodeOverrides({
    this.numNodes,
    this.nodePropertyOverrides,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// An object representing the node properties of a multi-node parallel job.
class NodeProperties {
  /// The number of nodes associated with a multi-node parallel job.
  final int numNodes;

  /// Specifies the node index for the main node of a multi-node parallel job.
  /// This node index value must be fewer than the number of nodes.
  final int mainNode;

  /// A list of node ranges and their properties associated with a multi-node
  /// parallel job.
  final List<NodeRangeProperty> nodeRangeProperties;

  NodeProperties({
    @required this.numNodes,
    @required this.mainNode,
    @required this.nodeRangeProperties,
  });
  static NodeProperties fromJson(Map<String, dynamic> json) => NodeProperties(
        numNodes: json['numNodes'] as int,
        mainNode: json['mainNode'] as int,
        nodeRangeProperties: (json['nodeRangeProperties'] as List)
            .map((e) => NodeRangeProperty.fromJson(e))
            .toList(),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// An object representing the properties of a node that is associated with a
/// multi-node parallel job.
class NodePropertiesSummary {
  /// Specifies whether the current node is the main node for a multi-node
  /// parallel job.
  final bool isMainNode;

  /// The number of nodes associated with a multi-node parallel job.
  final int numNodes;

  /// The node index for the node. Node index numbering begins at zero. This
  /// index is also available on the node with the `AWS_BATCH_JOB_NODE_INDEX`
  /// environment variable.
  final int nodeIndex;

  NodePropertiesSummary({
    this.isMainNode,
    this.numNodes,
    this.nodeIndex,
  });
  static NodePropertiesSummary fromJson(Map<String, dynamic> json) =>
      NodePropertiesSummary(
        isMainNode:
            json.containsKey('isMainNode') ? json['isMainNode'] as bool : null,
        numNodes: json.containsKey('numNodes') ? json['numNodes'] as int : null,
        nodeIndex:
            json.containsKey('nodeIndex') ? json['nodeIndex'] as int : null,
      );
}

/// Object representing any node overrides to a job definition that is used in a
/// SubmitJob API operation.
class NodePropertyOverride {
  /// The range of nodes, using node index values, with which to override. A
  /// range of `0:3` indicates nodes with index values of `0` through `3`. If
  /// the starting range value is omitted (`:n`), then `0` is used to start the
  /// range. If the ending range value is omitted (`n:`), then the highest
  /// possible node index is used to end the range.
  final String targetNodes;

  /// The overrides that should be sent to a node range.
  final ContainerOverrides containerOverrides;

  NodePropertyOverride({
    @required this.targetNodes,
    this.containerOverrides,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// An object representing the properties of the node range for a multi-node
/// parallel job.
class NodeRangeProperty {
  /// The range of nodes, using node index values. A range of `0:3` indicates
  /// nodes with index values of `0` through `3`. If the starting range value is
  /// omitted (`:n`), then `0` is used to start the range. If the ending range
  /// value is omitted (`n:`), then the highest possible node index is used to
  /// end the range. Your accumulative node ranges must account for all nodes
  /// (0:n). You may nest node ranges, for example 0:10 and 4:5, in which case
  /// the 4:5 range properties override the 0:10 properties.
  final String targetNodes;

  /// The container details for the node range.
  final ContainerProperties container;

  NodeRangeProperty({
    @required this.targetNodes,
    this.container,
  });
  static NodeRangeProperty fromJson(Map<String, dynamic> json) =>
      NodeRangeProperty(
        targetNodes: json['targetNodes'] as String,
        container: json.containsKey('container')
            ? ContainerProperties.fromJson(json['container'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class RegisterJobDefinitionResponse {
  /// The name of the job definition.
  final String jobDefinitionName;

  /// The Amazon Resource Name (ARN) of the job definition.
  final String jobDefinitionArn;

  /// The revision of the job definition.
  final int revision;

  RegisterJobDefinitionResponse({
    @required this.jobDefinitionName,
    @required this.jobDefinitionArn,
    @required this.revision,
  });
  static RegisterJobDefinitionResponse fromJson(Map<String, dynamic> json) =>
      RegisterJobDefinitionResponse(
        jobDefinitionName: json['jobDefinitionName'] as String,
        jobDefinitionArn: json['jobDefinitionArn'] as String,
        revision: json['revision'] as int,
      );
}

/// The type and amount of a resource to assign to a container. Currently, the
/// only supported resource type is `GPU`.
class ResourceRequirement {
  /// The number of physical GPUs to reserve for the container. The number of
  /// GPUs reserved for all containers in a job should not exceed the number of
  /// available GPUs on the compute resource that the job is launched on.
  final String value;

  /// The type of resource to assign to a container. Currently, the only
  /// supported resource type is `GPU`.
  final String type;

  ResourceRequirement({
    @required this.value,
    @required this.type,
  });
  static ResourceRequirement fromJson(Map<String, dynamic> json) =>
      ResourceRequirement(
        value: json['value'] as String,
        type: json['type'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The retry strategy associated with a job.
class RetryStrategy {
  /// The number of times to move a job to the `RUNNABLE` status. You may
  /// specify between 1 and 10 attempts. If the value of `attempts` is greater
  /// than one, the job is retried on failure the same number of attempts as the
  /// value.
  final int attempts;

  RetryStrategy({
    this.attempts,
  });
  static RetryStrategy fromJson(Map<String, dynamic> json) => RetryStrategy(
        attempts: json.containsKey('attempts') ? json['attempts'] as int : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class SubmitJobResponse {
  /// The name of the job.
  final String jobName;

  /// The unique identifier for the job.
  final String jobId;

  SubmitJobResponse({
    @required this.jobName,
    @required this.jobId,
  });
  static SubmitJobResponse fromJson(Map<String, dynamic> json) =>
      SubmitJobResponse(
        jobName: json['jobName'] as String,
        jobId: json['jobId'] as String,
      );
}

class TerminateJobResponse {
  TerminateJobResponse();
  static TerminateJobResponse fromJson(Map<String, dynamic> json) =>
      TerminateJobResponse();
}

/// The `ulimit` settings to pass to the container.
class Ulimit {
  /// The hard limit for the `ulimit` type.
  final int hardLimit;

  /// The `type` of the `ulimit`.
  final String name;

  /// The soft limit for the `ulimit` type.
  final int softLimit;

  Ulimit({
    @required this.hardLimit,
    @required this.name,
    @required this.softLimit,
  });
  static Ulimit fromJson(Map<String, dynamic> json) => Ulimit(
        hardLimit: json['hardLimit'] as int,
        name: json['name'] as String,
        softLimit: json['softLimit'] as int,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class UpdateComputeEnvironmentResponse {
  /// The name of the compute environment.
  final String computeEnvironmentName;

  /// The Amazon Resource Name (ARN) of the compute environment.
  final String computeEnvironmentArn;

  UpdateComputeEnvironmentResponse({
    this.computeEnvironmentName,
    this.computeEnvironmentArn,
  });
  static UpdateComputeEnvironmentResponse fromJson(Map<String, dynamic> json) =>
      UpdateComputeEnvironmentResponse(
        computeEnvironmentName: json.containsKey('computeEnvironmentName')
            ? json['computeEnvironmentName'] as String
            : null,
        computeEnvironmentArn: json.containsKey('computeEnvironmentArn')
            ? json['computeEnvironmentArn'] as String
            : null,
      );
}

class UpdateJobQueueResponse {
  /// The name of the job queue.
  final String jobQueueName;

  /// The Amazon Resource Name (ARN) of the job queue.
  final String jobQueueArn;

  UpdateJobQueueResponse({
    this.jobQueueName,
    this.jobQueueArn,
  });
  static UpdateJobQueueResponse fromJson(Map<String, dynamic> json) =>
      UpdateJobQueueResponse(
        jobQueueName: json.containsKey('jobQueueName')
            ? json['jobQueueName'] as String
            : null,
        jobQueueArn: json.containsKey('jobQueueArn')
            ? json['jobQueueArn'] as String
            : null,
      );
}

/// A data volume used in a job's container properties.
class Volume {
  /// The contents of the `host` parameter determine whether your data volume
  /// persists on the host container instance and where it is stored. If the
  /// host parameter is empty, then the Docker daemon assigns a host path for
  /// your data volume. However, the data is not guaranteed to persist after the
  /// containers associated with it stop running.
  final Host host;

  /// The name of the volume. Up to 255 letters (uppercase and lowercase),
  /// numbers, hyphens, and underscores are allowed. This name is referenced in
  /// the `sourceVolume` parameter of container definition `mountPoints`.
  final String name;

  Volume({
    this.host,
    this.name,
  });
  static Volume fromJson(Map<String, dynamic> json) => Volume(
        host: json.containsKey('host') ? Host.fromJson(json['host']) : null,
        name: json.containsKey('name') ? json['name'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}
