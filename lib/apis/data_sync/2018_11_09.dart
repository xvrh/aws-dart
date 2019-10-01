import 'package:meta/meta.dart';

/// AWS DataSync
///
/// AWS DataSync is a managed data transfer service that makes it simpler for
/// you to automate moving data between on-premises storage and Amazon Simple
/// Storage Service (Amazon S3) or Amazon Elastic File System (Amazon EFS).
///
/// This API interface reference for AWS DataSync contains documentation for a
/// programming interface that you can use to manage AWS DataSync.
class DataSyncApi {
  /// Cancels execution of a task.
  ///
  /// When you cancel a task execution, the transfer of some files are abruptly
  /// interrupted. The contents of files that are transferred to the destination
  /// might be incomplete or inconsistent with the source files. However, if you
  /// start a new task execution on the same task and you allow the task
  /// execution to complete, file content on the destination is complete and
  /// consistent. This applies to other unexpected failures that interrupt a
  /// task execution. In all of these cases, AWS DataSync successfully complete
  /// the transfer when you start the next task execution.
  Future<void> cancelTaskExecution(String taskExecutionArn) async {}

  /// Activates an AWS DataSync agent that you have deployed on your host. The
  /// activation process associates your agent with your account. In the
  /// activation process, you specify information such as the AWS Region that
  /// you want to activate the agent in. You activate the agent in the AWS
  /// Region where your target locations (in Amazon S3 or Amazon EFS) reside.
  /// Your tasks are created in this AWS Region.
  ///
  /// You can activate the agent in a VPC (Virtual private Cloud) or provide the
  /// agent access to a VPC endpoint so you can run tasks without going over the
  /// public Internet.
  ///
  /// You can use an agent for more than one location. If a task uses multiple
  /// agents, all of them need to have status AVAILABLE for the task to run. If
  /// you use multiple agents for a source location, the status of all the
  /// agents must be AVAILABLE for the task to run.
  ///
  /// Agents are automatically updated by AWS on a regular basis, using a
  /// mechanism that ensures minimal interruption to your tasks.
  Future<void> createAgent(String activationKey,
      {String agentName,
      List<TagListEntry> tags,
      String vpcEndpointId,
      List<String> subnetArns,
      List<String> securityGroupArns}) async {}

  /// Creates an endpoint for an Amazon EFS file system.
  Future<void> createLocationEfs(
      {String subdirectory,
      @required String efsFilesystemArn,
      @required Ec2Config ec2Config,
      List<TagListEntry> tags}) async {}

  /// Creates an endpoint for a Network File System (NFS) file system.
  Future<void> createLocationNfs(
      {@required String subdirectory,
      @required String serverHostname,
      @required OnPremConfig onPremConfig,
      NfsMountOptions mountOptions,
      List<TagListEntry> tags}) async {}

  /// Creates an endpoint for an Amazon S3 bucket.
  ///
  /// For AWS DataSync to access a destination S3 bucket, it needs an AWS
  /// Identity and Access Management (IAM) role that has the required
  /// permissions. You can set up the required permissions by creating an IAM
  /// policy that grants the required permissions and attaching the policy to
  /// the role. An example of such a policy is shown in the examples section.
  ///
  /// For more information, see Configuring Amazon S3 Location Settings in the
  /// _AWS DataSync User Guide._
  Future<void> createLocationS3(
      {String subdirectory,
      @required String s3BucketArn,
      @required S3Config s3Config,
      List<TagListEntry> tags}) async {}

  /// Creates an endpoint for a Server Message Block (SMB) file system.
  Future<void> createLocationSmb(
      {@required String subdirectory,
      @required String serverHostname,
      @required String user,
      String domain,
      @required String password,
      @required List<String> agentArns,
      SmbMountOptions mountOptions,
      List<TagListEntry> tags}) async {}

  /// Creates a task. A task is a set of two locations (source and destination)
  /// and a set of Options that you use to control the behavior of a task. If
  /// you don't specify Options when you create a task, AWS DataSync populates
  /// them with service defaults.
  ///
  /// When you create a task, it first enters the CREATING state. During
  /// CREATING AWS DataSync attempts to mount the on-premises Network File
  /// System (NFS) location. The task transitions to the AVAILABLE state without
  /// waiting for the AWS location to become mounted. If required, AWS DataSync
  /// mounts the AWS location before each task execution.
  ///
  /// If an agent that is associated with a source (NFS) location goes offline,
  /// the task transitions to the UNAVAILABLE status. If the status of the task
  /// remains in the CREATING status for more than a few minutes, it means that
  /// your agent might be having trouble mounting the source NFS file system.
  /// Check the task's ErrorCode and ErrorDetail. Mount issues are often caused
  /// by either a misconfigured firewall or a mistyped NFS server host name.
  Future<void> createTask(
      {@required String sourceLocationArn,
      @required String destinationLocationArn,
      String cloudWatchLogGroupArn,
      String name,
      Options options,
      List<FilterRule> excludes,
      List<TagListEntry> tags}) async {}

  /// Deletes an agent. To specify which agent to delete, use the Amazon
  /// Resource Name (ARN) of the agent in your request. The operation
  /// disassociates the agent from your AWS account. However, it doesn't delete
  /// the agent virtual machine (VM) from your on-premises environment.
  Future<void> deleteAgent(String agentArn) async {}

  /// Deletes the configuration of a location used by AWS DataSync.
  Future<void> deleteLocation(String locationArn) async {}

  /// Deletes a task.
  Future<void> deleteTask(String taskArn) async {}

  /// Returns metadata such as the name, the network interfaces, and the status
  /// (that is, whether the agent is running or not) for an agent. To specify
  /// which agent to describe, use the Amazon Resource Name (ARN) of the agent
  /// in your request.
  Future<void> describeAgent(String agentArn) async {}

  /// Returns metadata, such as the path information about an Amazon EFS
  /// location.
  Future<void> describeLocationEfs(String locationArn) async {}

  /// Returns metadata, such as the path information, about a NFS location.
  Future<void> describeLocationNfs(String locationArn) async {}

  /// Returns metadata, such as bucket name, about an Amazon S3 bucket location.
  Future<void> describeLocationS3(String locationArn) async {}

  /// Returns metadata, such as the path and user information about a SMB
  /// location.
  Future<void> describeLocationSmb(String locationArn) async {}

  /// Returns metadata about a task.
  Future<void> describeTask(String taskArn) async {}

  /// Returns detailed metadata about a task that is being executed.
  Future<void> describeTaskExecution(String taskExecutionArn) async {}

  /// Returns a list of agents owned by an AWS account in the AWS Region
  /// specified in the request. The returned list is ordered by agent Amazon
  /// Resource Name (ARN).
  ///
  /// By default, this operation returns a maximum of 100 agents. This operation
  /// supports pagination that enables you to optionally reduce the number of
  /// agents returned in a response.
  ///
  /// If you have more agents than are returned in a response (that is, the
  /// response returns only a truncated list of your agents), the response
  /// contains a marker that you can specify in your next request to fetch the
  /// next page of agents.
  Future<void> listAgents({int maxResults, String nextToken}) async {}

  /// Returns a lists of source and destination locations.
  ///
  /// If you have more locations than are returned in a response (that is, the
  /// response returns only a truncated list of your agents), the response
  /// contains a token that you can specify in your next request to fetch the
  /// next page of locations.
  Future<void> listLocations({int maxResults, String nextToken}) async {}

  /// Returns all the tags associated with a specified resources.
  Future<void> listTagsForResource(String resourceArn,
      {int maxResults, String nextToken}) async {}

  /// Returns a list of executed tasks.
  Future<void> listTaskExecutions(
      {String taskArn, int maxResults, String nextToken}) async {}

  /// Returns a list of all the tasks.
  Future<void> listTasks({int maxResults, String nextToken}) async {}

  /// Starts a specific invocation of a task. A `TaskExecution` value represents
  /// an individual run of a task. Each task can have at most one
  /// `TaskExecution` at a time.
  ///
  ///  `TaskExecution` has the following transition phases: INITIALIZING |
  /// PREPARING | TRANSFERRING | VERIFYING | SUCCESS/FAILURE.
  ///
  /// For detailed information, see the Task Execution section in the Components
  /// and Terminology topic in the _AWS DataSync User Guide_.
  Future<void> startTaskExecution(String taskArn,
      {Options overrideOptions, List<FilterRule> includes}) async {}

  /// Applies a key-value pair to an AWS resource.
  Future<void> tagResource(
      {@required String resourceArn,
      @required List<TagListEntry> tags}) async {}

  /// Removes a tag from an AWS resource.
  Future<void> untagResource(
      {@required String resourceArn, @required List<String> keys}) async {}

  /// Updates the name of an agent.
  Future<void> updateAgent(String agentArn, {String name}) async {}

  /// Updates the metadata associated with a task.
  Future<void> updateTask(String taskArn,
      {Options options,
      List<FilterRule> excludes,
      String name,
      String cloudWatchLogGroupArn}) async {}
}

class AgentListEntry {}

class CancelTaskExecutionResponse {}

class CreateAgentResponse {}

class CreateLocationEfsResponse {}

class CreateLocationNfsResponse {}

class CreateLocationS3Response {}

class CreateLocationSmbResponse {}

class CreateTaskResponse {}

class DeleteAgentResponse {}

class DeleteLocationResponse {}

class DeleteTaskResponse {}

class DescribeAgentResponse {}

class DescribeLocationEfsResponse {}

class DescribeLocationNfsResponse {}

class DescribeLocationS3Response {}

class DescribeLocationSmbResponse {}

class DescribeTaskExecutionResponse {}

class DescribeTaskResponse {}

class Ec2Config {}

class FilterRule {}

class ListAgentsResponse {}

class ListLocationsResponse {}

class ListTagsForResourceResponse {}

class ListTaskExecutionsResponse {}

class ListTasksResponse {}

class LocationListEntry {}

class NfsMountOptions {}

class OnPremConfig {}

class Options {}

class PrivateLinkConfig {}

class S3Config {}

class SmbMountOptions {}

class StartTaskExecutionResponse {}

class TagListEntry {}

class TagResourceResponse {}

class TaskExecutionListEntry {}

class TaskExecutionResultDetail {}

class TaskListEntry {}

class UntagResourceResponse {}

class UpdateAgentResponse {}

class UpdateTaskResponse {}
