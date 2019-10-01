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
  /// Cancels a job in an AWS Batch job queue. Jobs that are in the `SUBMITTED`,
  /// `PENDING`, or `RUNNABLE` state are cancelled. Jobs that have progressed to
  /// `STARTING` or `RUNNING` are not cancelled (but the API operation still
  /// succeeds, even if no job is cancelled); these jobs must be terminated with
  /// the TerminateJob operation.
  Future<void> cancelJob(
      {@required String jobId, @required String reason}) async {}

  /// Creates an AWS Batch compute environment. You can create `MANAGED` or
  /// `UNMANAGED` compute environments.
  ///
  /// In a managed compute environment, AWS Batch manages the capacity and
  /// instance types of the compute resources within the environment. This is
  /// based on the compute resource specification that you define or the [launch
  /// template](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-launch-templates.html)
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
  /// [Container Instance
  /// AMIs](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/container_instance_AMIs.html)
  /// in the _Amazon Elastic Container Service Developer Guide_. After you have
  /// created your unmanaged compute environment, you can use the
  /// DescribeComputeEnvironments operation to find the Amazon ECS cluster that
  /// is associated with it. Then, manually launch your container instances into
  /// that Amazon ECS cluster. For more information, see [Launching an Amazon
  /// ECS Container
  /// Instance](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/launch_container_instance.html)
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
  Future<void> createComputeEnvironment(
      {@required String computeEnvironmentName,
      @required String type,
      String state,
      ComputeResource computeResources,
      @required String serviceRole}) async {}

  /// Creates an AWS Batch job queue. When you create a job queue, you associate
  /// one or more compute environments to the queue and assign an order of
  /// preference for the compute environments.
  ///
  /// You also set a priority to the job queue that determines the order in
  /// which the AWS Batch scheduler places jobs onto its associated compute
  /// environments. For example, if a compute environment is associated with
  /// more than one job queue, the job queue with a higher priority is given
  /// preference for scheduling jobs to that compute environment.
  Future<void> createJobQueue(
      {@required String jobQueueName,
      String state,
      @required int priority,
      @required List<ComputeEnvironmentOrder> computeEnvironmentOrder}) async {}

  /// Deletes an AWS Batch compute environment.
  ///
  /// Before you can delete a compute environment, you must set its state to
  /// `DISABLED` with the UpdateComputeEnvironment API operation and
  /// disassociate it from any job queues with the UpdateJobQueue API operation.
  Future<void> deleteComputeEnvironment(String computeEnvironment) async {}

  /// Deletes the specified job queue. You must first disable submissions for a
  /// queue with the UpdateJobQueue operation. All jobs in the queue are
  /// terminated when you delete a job queue.
  ///
  /// It is not necessary to disassociate compute environments from a queue
  /// before submitting a `DeleteJobQueue` request.
  Future<void> deleteJobQueue(String jobQueue) async {}

  /// Deregisters an AWS Batch job definition.
  Future<void> deregisterJobDefinition(String jobDefinition) async {}

  /// Describes one or more of your compute environments.
  ///
  /// If you are using an unmanaged compute environment, you can use the
  /// `DescribeComputeEnvironment` operation to determine the `ecsClusterArn`
  /// that you should launch your Amazon ECS container instances into.
  Future<void> describeComputeEnvironments(
      {List<String> computeEnvironments,
      int maxResults,
      String nextToken}) async {}

  /// Describes a list of job definitions. You can specify a `status` (such as
  /// `ACTIVE`) to only return job definitions that match that status.
  Future<void> describeJobDefinitions(
      {List<String> jobDefinitions,
      int maxResults,
      String jobDefinitionName,
      String status,
      String nextToken}) async {}

  /// Describes one or more of your job queues.
  Future<void> describeJobQueues(
      {List<String> jobQueues, int maxResults, String nextToken}) async {}

  /// Describes a list of AWS Batch jobs.
  Future<void> describeJobs(List<String> jobs) async {}

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
  Future<void> listJobs(
      {String jobQueue,
      String arrayJobId,
      String multiNodeJobId,
      String jobStatus,
      int maxResults,
      String nextToken}) async {}

  /// Registers an AWS Batch job definition.
  Future<void> registerJobDefinition(
      {@required String jobDefinitionName,
      @required String type,
      Map<String, String> parameters,
      ContainerProperties containerProperties,
      NodeProperties nodeProperties,
      RetryStrategy retryStrategy,
      JobTimeout timeout}) async {}

  /// Submits an AWS Batch job from a job definition. Parameters specified
  /// during SubmitJob override parameters defined in the job definition.
  Future<void> submitJob(
      {@required String jobName,
      @required String jobQueue,
      ArrayProperties arrayProperties,
      List<JobDependency> dependsOn,
      @required String jobDefinition,
      Map<String, String> parameters,
      ContainerOverrides containerOverrides,
      NodeOverrides nodeOverrides,
      RetryStrategy retryStrategy,
      JobTimeout timeout}) async {}

  /// Terminates a job in a job queue. Jobs that are in the `STARTING` or
  /// `RUNNING` state are terminated, which causes them to transition to
  /// `FAILED`. Jobs that have not progressed to the `STARTING` state are
  /// cancelled.
  Future<void> terminateJob(
      {@required String jobId, @required String reason}) async {}

  /// Updates an AWS Batch compute environment.
  Future<void> updateComputeEnvironment(String computeEnvironment,
      {String state,
      ComputeResourceUpdate computeResources,
      String serviceRole}) async {}

  /// Updates a job queue.
  Future<void> updateJobQueue(String jobQueue,
      {String state,
      int priority,
      List<ComputeEnvironmentOrder> computeEnvironmentOrder}) async {}
}

class ArrayProperties {}

class ArrayPropertiesDetail {}

class ArrayPropertiesSummary {}

class AttemptContainerDetail {}

class AttemptDetail {}

class CancelJobResponse {}

class ComputeEnvironmentDetail {}

class ComputeEnvironmentOrder {}

class ComputeResource {}

class ComputeResourceUpdate {}

class ContainerDetail {}

class ContainerOverrides {}

class ContainerProperties {}

class ContainerSummary {}

class CreateComputeEnvironmentResponse {}

class CreateJobQueueResponse {}

class DeleteComputeEnvironmentResponse {}

class DeleteJobQueueResponse {}

class DeregisterJobDefinitionResponse {}

class DescribeComputeEnvironmentsResponse {}

class DescribeJobDefinitionsResponse {}

class DescribeJobQueuesResponse {}

class DescribeJobsResponse {}

class Device {}

class Host {}

class JobDefinition {}

class JobDependency {}

class JobDetail {}

class JobQueueDetail {}

class JobSummary {}

class JobTimeout {}

class KeyValuePair {}

class LaunchTemplateSpecification {}

class LinuxParameters {}

class ListJobsResponse {}

class MountPoint {}

class NetworkInterface {}

class NodeDetails {}

class NodeOverrides {}

class NodeProperties {}

class NodePropertiesSummary {}

class NodePropertyOverride {}

class NodeRangeProperty {}

class RegisterJobDefinitionResponse {}

class ResourceRequirement {}

class RetryStrategy {}

class SubmitJobResponse {}

class TerminateJobResponse {}

class Ulimit {}

class UpdateComputeEnvironmentResponse {}

class UpdateJobQueueResponse {}

class Volume {}
