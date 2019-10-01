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
  final _client;
  DataSyncApi(client)
      : _client = client.configured('DataSync', serializer: 'json');

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
  ///
  /// [taskExecutionArn]: The Amazon Resource Name (ARN) of the task execution
  /// to cancel.
  Future<CancelTaskExecutionResponse> cancelTaskExecution(
      String taskExecutionArn) async {
    var response_ = await _client.send('CancelTaskExecution', {
      'TaskExecutionArn': taskExecutionArn,
    });
    return CancelTaskExecutionResponse.fromJson(response_);
  }

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
  ///
  /// [activationKey]: Your agent activation key. You can get the activation key
  /// either by sending an HTTP GET request with redirects that enable you to
  /// get the agent IP address (port 80). Alternatively, you can get it from the
  /// AWS DataSync console.
  ///
  /// The redirect URL returned in the response provides you the activation key
  /// for your agent in the query string parameter `activationKey`. It might
  /// also include other activation-related parameters; however, these are
  /// merely defaults. The arguments you pass to this API call determine the
  /// actual configuration of your agent.
  ///
  /// For more information, see Activating an Agent in the _AWS DataSync User
  /// Guide._
  ///
  /// [agentName]: The name you configured for your agent. This value is a text
  /// reference that is used to identify the agent in the console.
  ///
  /// [tags]: The key-value pair that represents the tag that you want to
  /// associate with the agent. The value can be an empty string. This value
  /// helps you manage, filter, and search for your agents.
  ///
  ///
  ///
  /// Valid characters for key and value are letters, spaces, and numbers
  /// representable in UTF-8 format, and the following special characters: + - =
  /// . _ : / @.
  ///
  /// [vpcEndpointId]: The ID of the VPC (Virtual Private Cloud) endpoint that
  /// the agent has access to. This is the client-side VPC endpoint, also called
  /// a PrivateLink. If you don't have a PrivateLink VPC endpoint, see
  /// [Creating a VPC Endpoint Service Configuration](https://docs.aws.amazon.com/vpc/latest/userguide/endpoint-service.html#create-endpoint-service)
  /// in the AWS VPC User Guide.
  ///
  /// VPC endpoint ID looks like this: `vpce-01234d5aff67890e1`.
  ///
  /// [subnetArns]: The Amazon Resource Names (ARNs) of the subnets in which
  /// DataSync will create Elastic Network Interfaces (ENIs) for each data
  /// transfer task. The agent that runs a task must be private. When you start
  /// a task that is associated with an agent created in a VPC, or one that has
  /// access to an IP address in a VPC, then the task is also private. In this
  /// case, DataSync creates four ENIs for each task in your subnet. For a data
  /// transfer to work, the agent must be able to route to all these four ENIs.
  ///
  /// [securityGroupArns]: The ARNs of the security groups used to protect your
  /// data transfer task subnets. See CreateAgentRequest$SubnetArns.
  Future<CreateAgentResponse> createAgent(String activationKey,
      {String agentName,
      List<TagListEntry> tags,
      String vpcEndpointId,
      List<String> subnetArns,
      List<String> securityGroupArns}) async {
    var response_ = await _client.send('CreateAgent', {
      'ActivationKey': activationKey,
      if (agentName != null) 'AgentName': agentName,
      if (tags != null) 'Tags': tags,
      if (vpcEndpointId != null) 'VpcEndpointId': vpcEndpointId,
      if (subnetArns != null) 'SubnetArns': subnetArns,
      if (securityGroupArns != null) 'SecurityGroupArns': securityGroupArns,
    });
    return CreateAgentResponse.fromJson(response_);
  }

  /// Creates an endpoint for an Amazon EFS file system.
  ///
  /// [subdirectory]: A subdirectory in the location’s path. This subdirectory
  /// in the EFS file system is used to read data from the EFS source location
  /// or write data to the EFS destination. By default, AWS DataSync uses the
  /// root directory.
  ///
  /// [efsFilesystemArn]: The Amazon Resource Name (ARN) for the Amazon EFS file
  /// system.
  ///
  /// [ec2Config]: The subnet and security group that the Amazon EFS file system
  /// uses. The security group that you provide needs to be able to communicate
  /// with the security group on the mount target in the subnet specified.
  ///
  /// The exact relationship between security group M (of the mount target) and
  /// security group S (which you provide for DataSync to use at this stage) is
  /// as follows:
  ///
  /// *    Security group M (which you associate with the mount target) must
  /// allow inbound access for the Transmission Control Protocol (TCP) on the
  /// NFS port (2049) from security group S. You can enable inbound connections
  /// either by IP address (CIDR range) or security group.
  ///
  /// *   Security group S (provided to DataSync to access EFS) should have a
  /// rule that enables outbound connections to the NFS port on one of the file
  /// system’s mount targets. You can enable outbound connections either by IP
  /// address (CIDR range) or security group.
  ///
  ///     For information about security groups and mount targets, see Security
  /// Groups for Amazon EC2 Instances and Mount Targets in the _Amazon EFS User
  /// Guide._
  ///
  /// [tags]: The key-value pair that represents a tag that you want to add to
  /// the resource. The value can be an empty string. This value helps you
  /// manage, filter, and search for your resources. We recommend that you
  /// create a name tag for your location.
  Future<CreateLocationEfsResponse> createLocationEfs(
      {String subdirectory,
      @required String efsFilesystemArn,
      @required Ec2Config ec2Config,
      List<TagListEntry> tags}) async {
    var response_ = await _client.send('CreateLocationEfs', {
      if (subdirectory != null) 'Subdirectory': subdirectory,
      'EfsFilesystemArn': efsFilesystemArn,
      'Ec2Config': ec2Config,
      if (tags != null) 'Tags': tags,
    });
    return CreateLocationEfsResponse.fromJson(response_);
  }

  /// Creates an endpoint for a Network File System (NFS) file system.
  ///
  /// [subdirectory]: The subdirectory in the NFS file system that is used to
  /// read data from the NFS source location or write data to the NFS
  /// destination. The NFS path should be a path that's exported by the NFS
  /// server, or a subdirectory of that path. The path should be such that it
  /// can be mounted by other NFS clients in your network.
  ///
  /// To see all the paths exported by your NFS server. run "`showmount -e
  /// nfs-server-name`" from an NFS client that has access to your server. You
  /// can specify any directory that appears in the results, and any
  /// subdirectory of that directory. Ensure that the NFS export is accessible
  /// without Kerberos authentication.
  ///
  /// To transfer all the data in the folder you specified, DataSync needs to
  /// have permissions to read all the data. To ensure this, either configure
  /// the NFS export with `no_root_squash,` or ensure that the permissions for
  /// all of the files that you want DataSync allow read access for all users.
  /// Doing either enables the agent to read the files. For the agent to access
  /// directories, you must additionally enable all execute access.
  ///
  /// For information about NFS export configuration, see 18.7. The /etc/exports
  /// Configuration File in the Red Hat Enterprise Linux documentation.
  ///
  /// [serverHostname]: The name of the NFS server. This value is the IP address
  /// or Domain Name Service (DNS) name of the NFS server. An agent that is
  /// installed on-premises uses this host name to mount the NFS server in a
  /// network.
  ///
  ///
  ///
  /// This name must either be DNS-compliant or must be an IP version 4 (IPv4)
  /// address.
  ///
  /// [onPremConfig]: Contains a list of Amazon Resource Names (ARNs) of agents
  /// that are used to connect to an NFS server.
  ///
  /// [mountOptions]: The NFS mount options that DataSync can use to mount your
  /// NFS share.
  ///
  /// [tags]: The key-value pair that represents the tag that you want to add to
  /// the location. The value can be an empty string. We recommend using tags to
  /// name your resources.
  Future<CreateLocationNfsResponse> createLocationNfs(
      {@required String subdirectory,
      @required String serverHostname,
      @required OnPremConfig onPremConfig,
      NfsMountOptions mountOptions,
      List<TagListEntry> tags}) async {
    var response_ = await _client.send('CreateLocationNfs', {
      'Subdirectory': subdirectory,
      'ServerHostname': serverHostname,
      'OnPremConfig': onPremConfig,
      if (mountOptions != null) 'MountOptions': mountOptions,
      if (tags != null) 'Tags': tags,
    });
    return CreateLocationNfsResponse.fromJson(response_);
  }

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
  ///
  /// [subdirectory]: A subdirectory in the Amazon S3 bucket. This subdirectory
  /// in Amazon S3 is used to read data from the S3 source location or write
  /// data to the S3 destination.
  ///
  /// [s3BucketArn]: The Amazon Resource Name (ARN) of the Amazon S3 bucket.
  ///
  /// [tags]: The key-value pair that represents the tag that you want to add to
  /// the location. The value can be an empty string. We recommend using tags to
  /// name your resources.
  Future<CreateLocationS3Response> createLocationS3(
      {String subdirectory,
      @required String s3BucketArn,
      @required S3Config s3Config,
      List<TagListEntry> tags}) async {
    var response_ = await _client.send('CreateLocationS3', {
      if (subdirectory != null) 'Subdirectory': subdirectory,
      'S3BucketArn': s3BucketArn,
      'S3Config': s3Config,
      if (tags != null) 'Tags': tags,
    });
    return CreateLocationS3Response.fromJson(response_);
  }

  /// Creates an endpoint for a Server Message Block (SMB) file system.
  ///
  /// [subdirectory]: The subdirectory in the SMB file system that is used to
  /// read data from the SMB source location or write data to the SMB
  /// destination. The SMB path should be a path that's exported by the SMB
  /// server, or a subdirectory of that path. The path should be such that it
  /// can be mounted by other SMB clients in your network.
  ///
  /// To transfer all the data in the folder you specified, DataSync needs to
  /// have permissions to mount the SMB share, as well as to access all the data
  /// in that share. To ensure this, either ensure that the user/password
  /// specified belongs to the user who can mount the share, and who has the
  /// appropriate permissions for all of the files and directories that you want
  /// DataSync to access, or use credentials of a member of the Backup Operators
  /// group to mount the share. Doing either enables the agent to access the
  /// data. For the agent to access directories, you must additionally enable
  /// all execute access.
  ///
  /// [serverHostname]: The name of the SMB server. This value is the IP address
  /// or Domain Name Service (DNS) name of the SMB server. An agent that is
  /// installed on-premises uses this host name to mount the SMB server in a
  /// network.
  ///
  ///
  ///
  /// This name must either be DNS-compliant or must be an IP version 4 (IPv4)
  /// address.
  ///
  /// [user]: The user who can mount the share, has the permissions to access
  /// files and directories in the SMB share.
  ///
  /// [domain]: The name of the domain that the SMB server belongs to.
  ///
  /// [password]: The password of the user who has permission to access the SMB
  /// server.
  ///
  /// [agentArns]: The Amazon Resource Names (ARNs) of agents to use for a
  /// Simple Message Block (SMB) location.
  ///
  /// [mountOptions]: The mount options that are available for DataSync to use
  /// to access an SMB location.
  ///
  /// [tags]: The key-value pair that represents the tag that you want to add to
  /// the location. The value can be an empty string. We recommend using tags to
  /// name your resources.
  Future<CreateLocationSmbResponse> createLocationSmb(
      {@required String subdirectory,
      @required String serverHostname,
      @required String user,
      String domain,
      @required String password,
      @required List<String> agentArns,
      SmbMountOptions mountOptions,
      List<TagListEntry> tags}) async {
    var response_ = await _client.send('CreateLocationSmb', {
      'Subdirectory': subdirectory,
      'ServerHostname': serverHostname,
      'User': user,
      if (domain != null) 'Domain': domain,
      'Password': password,
      'AgentArns': agentArns,
      if (mountOptions != null) 'MountOptions': mountOptions,
      if (tags != null) 'Tags': tags,
    });
    return CreateLocationSmbResponse.fromJson(response_);
  }

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
  ///
  /// [sourceLocationArn]: The Amazon Resource Name (ARN) of the source location
  /// for the task.
  ///
  /// [destinationLocationArn]: The Amazon Resource Name (ARN) of an AWS storage
  /// resource's location.
  ///
  /// [cloudWatchLogGroupArn]: The Amazon Resource Name (ARN) of the Amazon
  /// CloudWatch log group that is used to monitor and log events in the task.
  ///
  /// For more information on these groups, see Working with Log Groups and Log
  /// Streams in the _Amazon CloudWatch User Guide._
  ///
  /// For more information about how to use CloudWatch Logs with DataSync, see
  /// Monitoring Your Task in the _AWS DataSync User Guide._
  ///
  /// [name]: The name of a task. This value is a text reference that is used to
  /// identify the task in the console.
  ///
  /// [options]: The set of configuration options that control the behavior of a
  /// single execution of the task that occurs when you call
  /// `StartTaskExecution`. You can configure these options to preserve metadata
  /// such as user ID (UID) and group ID (GID), file permissions, data integrity
  /// verification, and so on.
  ///
  /// For each individual task execution, you can override these options by
  /// specifying the `OverrideOptions` before starting a the task execution. For
  /// more information, see the operation.
  ///
  /// [excludes]: A list of filter rules that determines which files to exclude
  /// from a task. The list should contain a single filter string that consists
  /// of the patterns to exclude. The patterns are delimited by "|" (that is, a
  /// pipe), for example, `"/folder1|/folder2"`
  ///
  /// [tags]: The key-value pair that represents the tag that you want to add to
  /// the resource. The value can be an empty string.
  Future<CreateTaskResponse> createTask(
      {@required String sourceLocationArn,
      @required String destinationLocationArn,
      String cloudWatchLogGroupArn,
      String name,
      Options options,
      List<FilterRule> excludes,
      List<TagListEntry> tags}) async {
    var response_ = await _client.send('CreateTask', {
      'SourceLocationArn': sourceLocationArn,
      'DestinationLocationArn': destinationLocationArn,
      if (cloudWatchLogGroupArn != null)
        'CloudWatchLogGroupArn': cloudWatchLogGroupArn,
      if (name != null) 'Name': name,
      if (options != null) 'Options': options,
      if (excludes != null) 'Excludes': excludes,
      if (tags != null) 'Tags': tags,
    });
    return CreateTaskResponse.fromJson(response_);
  }

  /// Deletes an agent. To specify which agent to delete, use the Amazon
  /// Resource Name (ARN) of the agent in your request. The operation
  /// disassociates the agent from your AWS account. However, it doesn't delete
  /// the agent virtual machine (VM) from your on-premises environment.
  ///
  /// [agentArn]: The Amazon Resource Name (ARN) of the agent to delete. Use the
  /// `ListAgents` operation to return a list of agents for your account and AWS
  /// Region.
  Future<DeleteAgentResponse> deleteAgent(String agentArn) async {
    var response_ = await _client.send('DeleteAgent', {
      'AgentArn': agentArn,
    });
    return DeleteAgentResponse.fromJson(response_);
  }

  /// Deletes the configuration of a location used by AWS DataSync.
  ///
  /// [locationArn]: The Amazon Resource Name (ARN) of the location to delete.
  Future<DeleteLocationResponse> deleteLocation(String locationArn) async {
    var response_ = await _client.send('DeleteLocation', {
      'LocationArn': locationArn,
    });
    return DeleteLocationResponse.fromJson(response_);
  }

  /// Deletes a task.
  ///
  /// [taskArn]: The Amazon Resource Name (ARN) of the task to delete.
  Future<DeleteTaskResponse> deleteTask(String taskArn) async {
    var response_ = await _client.send('DeleteTask', {
      'TaskArn': taskArn,
    });
    return DeleteTaskResponse.fromJson(response_);
  }

  /// Returns metadata such as the name, the network interfaces, and the status
  /// (that is, whether the agent is running or not) for an agent. To specify
  /// which agent to describe, use the Amazon Resource Name (ARN) of the agent
  /// in your request.
  ///
  /// [agentArn]: The Amazon Resource Name (ARN) of the agent to describe.
  Future<DescribeAgentResponse> describeAgent(String agentArn) async {
    var response_ = await _client.send('DescribeAgent', {
      'AgentArn': agentArn,
    });
    return DescribeAgentResponse.fromJson(response_);
  }

  /// Returns metadata, such as the path information about an Amazon EFS
  /// location.
  ///
  /// [locationArn]: The Amazon Resource Name (ARN) of the EFS location to
  /// describe.
  Future<DescribeLocationEfsResponse> describeLocationEfs(
      String locationArn) async {
    var response_ = await _client.send('DescribeLocationEfs', {
      'LocationArn': locationArn,
    });
    return DescribeLocationEfsResponse.fromJson(response_);
  }

  /// Returns metadata, such as the path information, about a NFS location.
  ///
  /// [locationArn]: The Amazon resource Name (ARN) of the NFS location to
  /// describe.
  Future<DescribeLocationNfsResponse> describeLocationNfs(
      String locationArn) async {
    var response_ = await _client.send('DescribeLocationNfs', {
      'LocationArn': locationArn,
    });
    return DescribeLocationNfsResponse.fromJson(response_);
  }

  /// Returns metadata, such as bucket name, about an Amazon S3 bucket location.
  ///
  /// [locationArn]: The Amazon Resource Name (ARN) of the Amazon S3 bucket
  /// location to describe.
  Future<DescribeLocationS3Response> describeLocationS3(
      String locationArn) async {
    var response_ = await _client.send('DescribeLocationS3', {
      'LocationArn': locationArn,
    });
    return DescribeLocationS3Response.fromJson(response_);
  }

  /// Returns metadata, such as the path and user information about a SMB
  /// location.
  ///
  /// [locationArn]: The Amazon resource Name (ARN) of the SMB location to
  /// describe.
  Future<DescribeLocationSmbResponse> describeLocationSmb(
      String locationArn) async {
    var response_ = await _client.send('DescribeLocationSmb', {
      'LocationArn': locationArn,
    });
    return DescribeLocationSmbResponse.fromJson(response_);
  }

  /// Returns metadata about a task.
  ///
  /// [taskArn]: The Amazon Resource Name (ARN) of the task to describe.
  Future<DescribeTaskResponse> describeTask(String taskArn) async {
    var response_ = await _client.send('DescribeTask', {
      'TaskArn': taskArn,
    });
    return DescribeTaskResponse.fromJson(response_);
  }

  /// Returns detailed metadata about a task that is being executed.
  ///
  /// [taskExecutionArn]: The Amazon Resource Name (ARN) of the task that is
  /// being executed.
  Future<DescribeTaskExecutionResponse> describeTaskExecution(
      String taskExecutionArn) async {
    var response_ = await _client.send('DescribeTaskExecution', {
      'TaskExecutionArn': taskExecutionArn,
    });
    return DescribeTaskExecutionResponse.fromJson(response_);
  }

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
  ///
  /// [maxResults]: The maximum number of agents to list.
  ///
  /// [nextToken]: An opaque string that indicates the position at which to
  /// begin the next list of agents.
  Future<ListAgentsResponse> listAgents(
      {int maxResults, String nextToken}) async {
    var response_ = await _client.send('ListAgents', {
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListAgentsResponse.fromJson(response_);
  }

  /// Returns a lists of source and destination locations.
  ///
  /// If you have more locations than are returned in a response (that is, the
  /// response returns only a truncated list of your agents), the response
  /// contains a token that you can specify in your next request to fetch the
  /// next page of locations.
  ///
  /// [maxResults]: The maximum number of locations to return.
  ///
  /// [nextToken]: An opaque string that indicates the position at which to
  /// begin the next list of locations.
  Future<ListLocationsResponse> listLocations(
      {int maxResults, String nextToken}) async {
    var response_ = await _client.send('ListLocations', {
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListLocationsResponse.fromJson(response_);
  }

  /// Returns all the tags associated with a specified resources.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the resource whose tags
  /// to list.
  ///
  /// [maxResults]: The maximum number of locations to return.
  ///
  /// [nextToken]: An opaque string that indicates the position at which to
  /// begin the next list of locations.
  Future<ListTagsForResourceResponse> listTagsForResource(String resourceArn,
      {int maxResults, String nextToken}) async {
    var response_ = await _client.send('ListTagsForResource', {
      'ResourceArn': resourceArn,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListTagsForResourceResponse.fromJson(response_);
  }

  /// Returns a list of executed tasks.
  ///
  /// [taskArn]: The Amazon Resource Name (ARN) of the task whose tasks you want
  /// to list.
  ///
  /// [maxResults]: The maximum number of executed tasks to list.
  ///
  /// [nextToken]: An opaque string that indicates the position at which to
  /// begin the next list of the executed tasks.
  Future<ListTaskExecutionsResponse> listTaskExecutions(
      {String taskArn, int maxResults, String nextToken}) async {
    var response_ = await _client.send('ListTaskExecutions', {
      if (taskArn != null) 'TaskArn': taskArn,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListTaskExecutionsResponse.fromJson(response_);
  }

  /// Returns a list of all the tasks.
  ///
  /// [maxResults]: The maximum number of tasks to return.
  ///
  /// [nextToken]: An opaque string that indicates the position at which to
  /// begin the next list of tasks.
  Future<ListTasksResponse> listTasks(
      {int maxResults, String nextToken}) async {
    var response_ = await _client.send('ListTasks', {
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListTasksResponse.fromJson(response_);
  }

  /// Starts a specific invocation of a task. A `TaskExecution` value represents
  /// an individual run of a task. Each task can have at most one
  /// `TaskExecution` at a time.
  ///
  ///  `TaskExecution` has the following transition phases: INITIALIZING |
  /// PREPARING | TRANSFERRING | VERIFYING | SUCCESS/FAILURE.
  ///
  /// For detailed information, see the Task Execution section in the Components
  /// and Terminology topic in the _AWS DataSync User Guide_.
  ///
  /// [taskArn]: The Amazon Resource Name (ARN) of the task to start.
  ///
  /// [includes]: A list of filter rules that determines which files to include
  /// when running a task. The pattern should contain a single filter string
  /// that consists of the patterns to include. The patterns are delimited by
  /// "|" (that is, a pipe). For example: `"/folder1|/folder2"`
  Future<StartTaskExecutionResponse> startTaskExecution(String taskArn,
      {Options overrideOptions, List<FilterRule> includes}) async {
    var response_ = await _client.send('StartTaskExecution', {
      'TaskArn': taskArn,
      if (overrideOptions != null) 'OverrideOptions': overrideOptions,
      if (includes != null) 'Includes': includes,
    });
    return StartTaskExecutionResponse.fromJson(response_);
  }

  /// Applies a key-value pair to an AWS resource.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the resource to apply the
  /// tag to.
  ///
  /// [tags]: The tags to apply.
  Future<TagResourceResponse> tagResource(
      {@required String resourceArn, @required List<TagListEntry> tags}) async {
    var response_ = await _client.send('TagResource', {
      'ResourceArn': resourceArn,
      'Tags': tags,
    });
    return TagResourceResponse.fromJson(response_);
  }

  /// Removes a tag from an AWS resource.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the resource to remove
  /// the tag from.
  ///
  /// [keys]: The keys in the key-value pair in the tag to remove.
  Future<UntagResourceResponse> untagResource(
      {@required String resourceArn, @required List<String> keys}) async {
    var response_ = await _client.send('UntagResource', {
      'ResourceArn': resourceArn,
      'Keys': keys,
    });
    return UntagResourceResponse.fromJson(response_);
  }

  /// Updates the name of an agent.
  ///
  /// [agentArn]: The Amazon Resource Name (ARN) of the agent to update.
  ///
  /// [name]: The name that you want to use to configure the agent.
  Future<UpdateAgentResponse> updateAgent(String agentArn,
      {String name}) async {
    var response_ = await _client.send('UpdateAgent', {
      'AgentArn': agentArn,
      if (name != null) 'Name': name,
    });
    return UpdateAgentResponse.fromJson(response_);
  }

  /// Updates the metadata associated with a task.
  ///
  /// [taskArn]: The Amazon Resource Name (ARN) of the resource name of the task
  /// to update.
  ///
  /// [excludes]: A list of filter rules that determines which files to exclude
  /// from a task. The list should contain a single filter string that consists
  /// of the patterns to exclude. The patterns are delimited by "|" (that is, a
  /// pipe), for example: `"/folder1|/folder2"`
  ///
  /// [name]: The name of the task to update.
  ///
  /// [cloudWatchLogGroupArn]: The Amazon Resource Name (ARN) of the resource
  /// name of the CloudWatch LogGroup.
  Future<UpdateTaskResponse> updateTask(String taskArn,
      {Options options,
      List<FilterRule> excludes,
      String name,
      String cloudWatchLogGroupArn}) async {
    var response_ = await _client.send('UpdateTask', {
      'TaskArn': taskArn,
      if (options != null) 'Options': options,
      if (excludes != null) 'Excludes': excludes,
      if (name != null) 'Name': name,
      if (cloudWatchLogGroupArn != null)
        'CloudWatchLogGroupArn': cloudWatchLogGroupArn,
    });
    return UpdateTaskResponse.fromJson(response_);
  }
}

/// Represents a single entry in a list of agents. `AgentListEntry` returns an
/// array that contains a list of agents when the ListAgents operation is
/// called.
class AgentListEntry {
  /// The Amazon Resource Name (ARN) of the agent.
  final String agentArn;

  /// The name of the agent.
  final String name;

  /// The status of the agent.
  final String status;

  AgentListEntry({
    this.agentArn,
    this.name,
    this.status,
  });
  static AgentListEntry fromJson(Map<String, dynamic> json) => AgentListEntry(
        agentArn:
            json.containsKey('AgentArn') ? json['AgentArn'] as String : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
      );
}

class CancelTaskExecutionResponse {
  CancelTaskExecutionResponse();
  static CancelTaskExecutionResponse fromJson(Map<String, dynamic> json) =>
      CancelTaskExecutionResponse();
}

/// CreateAgentResponse
class CreateAgentResponse {
  /// The Amazon Resource Name (ARN) of the agent. Use the `ListAgents`
  /// operation to return a list of agents for your account and AWS Region.
  final String agentArn;

  CreateAgentResponse({
    this.agentArn,
  });
  static CreateAgentResponse fromJson(Map<String, dynamic> json) =>
      CreateAgentResponse(
        agentArn:
            json.containsKey('AgentArn') ? json['AgentArn'] as String : null,
      );
}

/// CreateLocationEfs
class CreateLocationEfsResponse {
  /// The Amazon Resource Name (ARN) of the Amazon EFS file system location that
  /// is created.
  final String locationArn;

  CreateLocationEfsResponse({
    this.locationArn,
  });
  static CreateLocationEfsResponse fromJson(Map<String, dynamic> json) =>
      CreateLocationEfsResponse(
        locationArn: json.containsKey('LocationArn')
            ? json['LocationArn'] as String
            : null,
      );
}

/// CreateLocationNfsResponse
class CreateLocationNfsResponse {
  /// The Amazon Resource Name (ARN) of the source NFS file system location that
  /// is created.
  final String locationArn;

  CreateLocationNfsResponse({
    this.locationArn,
  });
  static CreateLocationNfsResponse fromJson(Map<String, dynamic> json) =>
      CreateLocationNfsResponse(
        locationArn: json.containsKey('LocationArn')
            ? json['LocationArn'] as String
            : null,
      );
}

/// CreateLocationS3Response
class CreateLocationS3Response {
  /// The Amazon Resource Name (ARN) of the source Amazon S3 bucket location
  /// that is created.
  final String locationArn;

  CreateLocationS3Response({
    this.locationArn,
  });
  static CreateLocationS3Response fromJson(Map<String, dynamic> json) =>
      CreateLocationS3Response(
        locationArn: json.containsKey('LocationArn')
            ? json['LocationArn'] as String
            : null,
      );
}

/// CreateLocationSmbResponse
class CreateLocationSmbResponse {
  /// The Amazon Resource Name (ARN) of the source SMB file system location that
  /// is created.
  final String locationArn;

  CreateLocationSmbResponse({
    this.locationArn,
  });
  static CreateLocationSmbResponse fromJson(Map<String, dynamic> json) =>
      CreateLocationSmbResponse(
        locationArn: json.containsKey('LocationArn')
            ? json['LocationArn'] as String
            : null,
      );
}

/// CreateTaskResponse
class CreateTaskResponse {
  /// The Amazon Resource Name (ARN) of the task.
  final String taskArn;

  CreateTaskResponse({
    this.taskArn,
  });
  static CreateTaskResponse fromJson(Map<String, dynamic> json) =>
      CreateTaskResponse(
        taskArn: json.containsKey('TaskArn') ? json['TaskArn'] as String : null,
      );
}

class DeleteAgentResponse {
  DeleteAgentResponse();
  static DeleteAgentResponse fromJson(Map<String, dynamic> json) =>
      DeleteAgentResponse();
}

class DeleteLocationResponse {
  DeleteLocationResponse();
  static DeleteLocationResponse fromJson(Map<String, dynamic> json) =>
      DeleteLocationResponse();
}

class DeleteTaskResponse {
  DeleteTaskResponse();
  static DeleteTaskResponse fromJson(Map<String, dynamic> json) =>
      DeleteTaskResponse();
}

/// DescribeAgentResponse
class DescribeAgentResponse {
  /// The Amazon Resource Name (ARN) of the agent.
  final String agentArn;

  /// The name of the agent.
  final String name;

  /// The status of the agent. If the status is ONLINE, then the agent is
  /// configured properly and is available to use. The Running status is the
  /// normal running status for an agent. If the status is OFFLINE, the agent's
  /// VM is turned off or the agent is in an unhealthy state. When the issue
  /// that caused the unhealthy state is resolved, the agent returns to ONLINE
  /// status.
  final String status;

  /// The time that the agent last connected to DataSyc.
  final DateTime lastConnectionTime;

  /// The time that the agent was activated (that is, created in your account).
  final DateTime creationTime;

  /// The type of endpoint that your agent is connected to. If the endpoint is a
  /// VPC endpoint, the agent is not accessible over the public Internet.
  final String endpointType;

  final PrivateLinkConfig privateLinkConfig;

  DescribeAgentResponse({
    this.agentArn,
    this.name,
    this.status,
    this.lastConnectionTime,
    this.creationTime,
    this.endpointType,
    this.privateLinkConfig,
  });
  static DescribeAgentResponse fromJson(Map<String, dynamic> json) =>
      DescribeAgentResponse(
        agentArn:
            json.containsKey('AgentArn') ? json['AgentArn'] as String : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        lastConnectionTime: json.containsKey('LastConnectionTime')
            ? DateTime.parse(json['LastConnectionTime'])
            : null,
        creationTime: json.containsKey('CreationTime')
            ? DateTime.parse(json['CreationTime'])
            : null,
        endpointType: json.containsKey('EndpointType')
            ? json['EndpointType'] as String
            : null,
        privateLinkConfig: json.containsKey('PrivateLinkConfig')
            ? PrivateLinkConfig.fromJson(json['PrivateLinkConfig'])
            : null,
      );
}

/// DescribeLocationEfsResponse
class DescribeLocationEfsResponse {
  /// The Amazon resource Name (ARN) of the EFS location that was described.
  final String locationArn;

  /// The URL of the EFS location that was described.
  final String locationUri;

  final Ec2Config ec2Config;

  /// The time that the EFS location was created.
  final DateTime creationTime;

  DescribeLocationEfsResponse({
    this.locationArn,
    this.locationUri,
    this.ec2Config,
    this.creationTime,
  });
  static DescribeLocationEfsResponse fromJson(Map<String, dynamic> json) =>
      DescribeLocationEfsResponse(
        locationArn: json.containsKey('LocationArn')
            ? json['LocationArn'] as String
            : null,
        locationUri: json.containsKey('LocationUri')
            ? json['LocationUri'] as String
            : null,
        ec2Config: json.containsKey('Ec2Config')
            ? Ec2Config.fromJson(json['Ec2Config'])
            : null,
        creationTime: json.containsKey('CreationTime')
            ? DateTime.parse(json['CreationTime'])
            : null,
      );
}

/// DescribeLocationNfsResponse
class DescribeLocationNfsResponse {
  /// The Amazon resource Name (ARN) of the NFS location that was described.
  final String locationArn;

  /// The URL of the source NFS location that was described.
  final String locationUri;

  final OnPremConfig onPremConfig;

  /// The NFS mount options that DataSync used to mount your NFS share.
  final NfsMountOptions mountOptions;

  /// The time that the NFS location was created.
  final DateTime creationTime;

  DescribeLocationNfsResponse({
    this.locationArn,
    this.locationUri,
    this.onPremConfig,
    this.mountOptions,
    this.creationTime,
  });
  static DescribeLocationNfsResponse fromJson(Map<String, dynamic> json) =>
      DescribeLocationNfsResponse(
        locationArn: json.containsKey('LocationArn')
            ? json['LocationArn'] as String
            : null,
        locationUri: json.containsKey('LocationUri')
            ? json['LocationUri'] as String
            : null,
        onPremConfig: json.containsKey('OnPremConfig')
            ? OnPremConfig.fromJson(json['OnPremConfig'])
            : null,
        mountOptions: json.containsKey('MountOptions')
            ? NfsMountOptions.fromJson(json['MountOptions'])
            : null,
        creationTime: json.containsKey('CreationTime')
            ? DateTime.parse(json['CreationTime'])
            : null,
      );
}

/// DescribeLocationS3Response
class DescribeLocationS3Response {
  /// The Amazon Resource Name (ARN) of the Amazon S3 bucket location.
  final String locationArn;

  /// The URL of the Amazon S3 location that was described.
  final String locationUri;

  final S3Config s3Config;

  /// The time that the Amazon S3 bucket location was created.
  final DateTime creationTime;

  DescribeLocationS3Response({
    this.locationArn,
    this.locationUri,
    this.s3Config,
    this.creationTime,
  });
  static DescribeLocationS3Response fromJson(Map<String, dynamic> json) =>
      DescribeLocationS3Response(
        locationArn: json.containsKey('LocationArn')
            ? json['LocationArn'] as String
            : null,
        locationUri: json.containsKey('LocationUri')
            ? json['LocationUri'] as String
            : null,
        s3Config: json.containsKey('S3Config')
            ? S3Config.fromJson(json['S3Config'])
            : null,
        creationTime: json.containsKey('CreationTime')
            ? DateTime.parse(json['CreationTime'])
            : null,
      );
}

/// DescribeLocationSmbResponse
class DescribeLocationSmbResponse {
  /// The Amazon resource Name (ARN) of the SMB location that was described.
  final String locationArn;

  /// The URL of the source SBM location that was described.
  final String locationUri;

  /// The Amazon Resource Name (ARN) of the source SMB file system location that
  /// is created.
  final List<String> agentArns;

  /// The user who is logged on the SMB server.
  final String user;

  /// The name of the domain that the SMB server belongs to.
  final String domain;

  /// The mount options that are available for DataSync to use to access an SMB
  /// location.
  final SmbMountOptions mountOptions;

  /// The time that the SMB location was created.
  final DateTime creationTime;

  DescribeLocationSmbResponse({
    this.locationArn,
    this.locationUri,
    this.agentArns,
    this.user,
    this.domain,
    this.mountOptions,
    this.creationTime,
  });
  static DescribeLocationSmbResponse fromJson(Map<String, dynamic> json) =>
      DescribeLocationSmbResponse(
        locationArn: json.containsKey('LocationArn')
            ? json['LocationArn'] as String
            : null,
        locationUri: json.containsKey('LocationUri')
            ? json['LocationUri'] as String
            : null,
        agentArns: json.containsKey('AgentArns')
            ? (json['AgentArns'] as List).map((e) => e as String).toList()
            : null,
        user: json.containsKey('User') ? json['User'] as String : null,
        domain: json.containsKey('Domain') ? json['Domain'] as String : null,
        mountOptions: json.containsKey('MountOptions')
            ? SmbMountOptions.fromJson(json['MountOptions'])
            : null,
        creationTime: json.containsKey('CreationTime')
            ? DateTime.parse(json['CreationTime'])
            : null,
      );
}

/// DescribeTaskExecutionResponse
class DescribeTaskExecutionResponse {
  /// The Amazon Resource Name (ARN) of the task execution that was described.
  /// `TaskExecutionArn` is hierarchical and includes `TaskArn` for the task
  /// that was executed.
  ///
  /// For example, a `TaskExecution` value with the ARN
  /// `arn:aws:datasync:us-east-1:111222333444:task/task-0208075f79cedf4a2/execution/exec-08ef1e88ec491019b`
  /// executed the task with the ARN
  /// `arn:aws:datasync:us-east-1:111222333444:task/task-0208075f79cedf4a2`.
  final String taskExecutionArn;

  /// The status of the task execution.
  ///
  /// For detailed information about task execution statuses, see Understanding
  /// Task Statuses in the _AWS DataSync User Guide._
  final String status;

  final Options options;

  /// A list of filter rules that determines which files to exclude from a task.
  /// The list should contain a single filter string that consists of the
  /// patterns to exclude. The patterns are delimited by "|" (that is, a pipe),
  /// for example: `"/folder1|/folder2"`
  final List<FilterRule> excludes;

  /// A list of filter rules that determines which files to include when running
  /// a task. The list should contain a single filter string that consists of
  /// the patterns to include. The patterns are delimited by "|" (that is, a
  /// pipe), for example: `"/folder1|/folder2"`
  final List<FilterRule> includes;

  /// The time that the task execution was started.
  final DateTime startTime;

  /// The expected number of files that is to be transferred over the network.
  /// This value is calculated during the PREPARING phase, before the
  /// TRANSFERRING phase. This value is the expected number of files to be
  /// transferred. It's calculated based on comparing the content of the source
  /// and destination locations and finding the delta that needs to be
  /// transferred.
  final BigInt estimatedFilesToTransfer;

  /// The estimated physical number of bytes that is to be transferred over the
  /// network.
  final BigInt estimatedBytesToTransfer;

  /// The actual number of files that was transferred over the network. This
  /// value is calculated and updated on an ongoing basis during the
  /// TRANSFERRING phase. It's updated periodically when each file is read from
  /// the source and sent over the network.
  ///
  /// If failures occur during a transfer, this value can be less than
  /// `EstimatedFilesToTransfer`. This value can also be greater than
  /// `EstimatedFilesTransferred` in some cases. This element is
  /// implementation-specific for some location types, so don't use it as an
  /// indicator for a correct file number or to monitor your task execution.
  final BigInt filesTransferred;

  /// The number of logical bytes written to the destination AWS storage
  /// resource.
  final BigInt bytesWritten;

  /// The physical number of bytes transferred over the network.
  final BigInt bytesTransferred;

  /// The result of the task execution.
  final TaskExecutionResultDetail result;

  DescribeTaskExecutionResponse({
    this.taskExecutionArn,
    this.status,
    this.options,
    this.excludes,
    this.includes,
    this.startTime,
    this.estimatedFilesToTransfer,
    this.estimatedBytesToTransfer,
    this.filesTransferred,
    this.bytesWritten,
    this.bytesTransferred,
    this.result,
  });
  static DescribeTaskExecutionResponse fromJson(Map<String, dynamic> json) =>
      DescribeTaskExecutionResponse(
        taskExecutionArn: json.containsKey('TaskExecutionArn')
            ? json['TaskExecutionArn'] as String
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        options: json.containsKey('Options')
            ? Options.fromJson(json['Options'])
            : null,
        excludes: json.containsKey('Excludes')
            ? (json['Excludes'] as List)
                .map((e) => FilterRule.fromJson(e))
                .toList()
            : null,
        includes: json.containsKey('Includes')
            ? (json['Includes'] as List)
                .map((e) => FilterRule.fromJson(e))
                .toList()
            : null,
        startTime: json.containsKey('StartTime')
            ? DateTime.parse(json['StartTime'])
            : null,
        estimatedFilesToTransfer: json.containsKey('EstimatedFilesToTransfer')
            ? BigInt.from(json['EstimatedFilesToTransfer'])
            : null,
        estimatedBytesToTransfer: json.containsKey('EstimatedBytesToTransfer')
            ? BigInt.from(json['EstimatedBytesToTransfer'])
            : null,
        filesTransferred: json.containsKey('FilesTransferred')
            ? BigInt.from(json['FilesTransferred'])
            : null,
        bytesWritten: json.containsKey('BytesWritten')
            ? BigInt.from(json['BytesWritten'])
            : null,
        bytesTransferred: json.containsKey('BytesTransferred')
            ? BigInt.from(json['BytesTransferred'])
            : null,
        result: json.containsKey('Result')
            ? TaskExecutionResultDetail.fromJson(json['Result'])
            : null,
      );
}

/// DescribeTaskResponse
class DescribeTaskResponse {
  /// The Amazon Resource Name (ARN) of the task that was described.
  final String taskArn;

  /// The status of the task that was described.
  ///
  /// For detailed information about task execution statuses, see Understanding
  /// Task Statuses in the _AWS DataSync User Guide._
  final String status;

  /// The name of the task that was described.
  final String name;

  /// The Amazon Resource Name (ARN) of the task execution that is syncing
  /// files.
  final String currentTaskExecutionArn;

  /// The Amazon Resource Name (ARN) of the source file system's location.
  final String sourceLocationArn;

  /// The Amazon Resource Name (ARN) of the AWS storage resource's location.
  final String destinationLocationArn;

  /// The Amazon Resource Name (ARN) of the Amazon CloudWatch log group that was
  /// used to monitor and log events in the task.
  ///
  /// For more information on these groups, see Working with Log Groups and Log
  /// Streams in the _Amazon CloudWatch User Guide_.
  final String cloudWatchLogGroupArn;

  /// The Amazon Resource Name (ARN) of the source ENIs (Elastic Network
  /// Interface) that was created for your subnet.
  final List<String> sourceNetworkInterfaceArns;

  /// The Amazon Resource Name (ARN) of the destination ENIs (Elastic Network
  /// Interface) that was created for your subnet.
  final List<String> destinationNetworkInterfaceArns;

  /// The set of configuration options that control the behavior of a single
  /// execution of the task that occurs when you call `StartTaskExecution`. You
  /// can configure these options to preserve metadata such as user ID (UID) and
  /// group (GID), file permissions, data integrity verification, and so on.
  ///
  /// For each individual task execution, you can override these options by
  /// specifying the overriding `OverrideOptions` value to operation.
  final Options options;

  /// A list of filter rules that determines which files to exclude from a task.
  /// The list should contain a single filter string that consists of the
  /// patterns to exclude. The patterns are delimited by "|" (that is, a pipe),
  /// for example: `"/folder1|/folder2"`
  final List<FilterRule> excludes;

  /// Errors that AWS DataSync encountered during execution of the task. You can
  /// use this error code to help troubleshoot issues.
  final String errorCode;

  /// Detailed description of an error that was encountered during the task
  /// execution. You can use this information to help troubleshoot issues.
  final String errorDetail;

  /// The time that the task was created.
  final DateTime creationTime;

  DescribeTaskResponse({
    this.taskArn,
    this.status,
    this.name,
    this.currentTaskExecutionArn,
    this.sourceLocationArn,
    this.destinationLocationArn,
    this.cloudWatchLogGroupArn,
    this.sourceNetworkInterfaceArns,
    this.destinationNetworkInterfaceArns,
    this.options,
    this.excludes,
    this.errorCode,
    this.errorDetail,
    this.creationTime,
  });
  static DescribeTaskResponse fromJson(Map<String, dynamic> json) =>
      DescribeTaskResponse(
        taskArn: json.containsKey('TaskArn') ? json['TaskArn'] as String : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        currentTaskExecutionArn: json.containsKey('CurrentTaskExecutionArn')
            ? json['CurrentTaskExecutionArn'] as String
            : null,
        sourceLocationArn: json.containsKey('SourceLocationArn')
            ? json['SourceLocationArn'] as String
            : null,
        destinationLocationArn: json.containsKey('DestinationLocationArn')
            ? json['DestinationLocationArn'] as String
            : null,
        cloudWatchLogGroupArn: json.containsKey('CloudWatchLogGroupArn')
            ? json['CloudWatchLogGroupArn'] as String
            : null,
        sourceNetworkInterfaceArns:
            json.containsKey('SourceNetworkInterfaceArns')
                ? (json['SourceNetworkInterfaceArns'] as List)
                    .map((e) => e as String)
                    .toList()
                : null,
        destinationNetworkInterfaceArns:
            json.containsKey('DestinationNetworkInterfaceArns')
                ? (json['DestinationNetworkInterfaceArns'] as List)
                    .map((e) => e as String)
                    .toList()
                : null,
        options: json.containsKey('Options')
            ? Options.fromJson(json['Options'])
            : null,
        excludes: json.containsKey('Excludes')
            ? (json['Excludes'] as List)
                .map((e) => FilterRule.fromJson(e))
                .toList()
            : null,
        errorCode:
            json.containsKey('ErrorCode') ? json['ErrorCode'] as String : null,
        errorDetail: json.containsKey('ErrorDetail')
            ? json['ErrorDetail'] as String
            : null,
        creationTime: json.containsKey('CreationTime')
            ? DateTime.parse(json['CreationTime'])
            : null,
      );
}

/// The subnet and the security group that DataSync uses to access target EFS
/// file system. The subnet must have at least one mount target for that file
/// system. The security group that you provide needs to be able to communicate
/// with the security group on the mount target in the subnet specified.
class Ec2Config {
  /// The ARN of the subnet and the security group that DataSync uses to access
  /// the target EFS file system.
  final String subnetArn;

  /// The Amazon Resource Names (ARNs) of the security groups that are
  /// configured for the Amazon EC2 resource.
  final List<String> securityGroupArns;

  Ec2Config({
    @required this.subnetArn,
    @required this.securityGroupArns,
  });
  static Ec2Config fromJson(Map<String, dynamic> json) => Ec2Config(
        subnetArn: json['SubnetArn'] as String,
        securityGroupArns: (json['SecurityGroupArns'] as List)
            .map((e) => e as String)
            .toList(),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies which files, folders and objects to include or exclude when
/// transferring files from source to destination.
class FilterRule {
  /// The type of filter rule to apply. AWS DataSync only supports the
  /// SIMPLE_PATTERN rule type.
  final String filterType;

  /// A single filter string that consists of the patterns to include or
  /// exclude. The patterns are delimited by "|" (that is, a pipe), for example:
  /// `/folder1|/folder2`
  final String value;

  FilterRule({
    this.filterType,
    this.value,
  });
  static FilterRule fromJson(Map<String, dynamic> json) => FilterRule(
        filterType: json.containsKey('FilterType')
            ? json['FilterType'] as String
            : null,
        value: json.containsKey('Value') ? json['Value'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// ListAgentsResponse
class ListAgentsResponse {
  /// A list of agents in your account.
  final List<AgentListEntry> agents;

  /// An opaque string that indicates the position at which to begin returning
  /// the next list of agents.
  final String nextToken;

  ListAgentsResponse({
    this.agents,
    this.nextToken,
  });
  static ListAgentsResponse fromJson(Map<String, dynamic> json) =>
      ListAgentsResponse(
        agents: json.containsKey('Agents')
            ? (json['Agents'] as List)
                .map((e) => AgentListEntry.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// ListLocationsResponse
class ListLocationsResponse {
  /// An array that contains a list of locations.
  final List<LocationListEntry> locations;

  /// An opaque string that indicates the position at which to begin returning
  /// the next list of locations.
  final String nextToken;

  ListLocationsResponse({
    this.locations,
    this.nextToken,
  });
  static ListLocationsResponse fromJson(Map<String, dynamic> json) =>
      ListLocationsResponse(
        locations: json.containsKey('Locations')
            ? (json['Locations'] as List)
                .map((e) => LocationListEntry.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// ListTagsForResourceResponse
class ListTagsForResourceResponse {
  /// Array of resource tags.
  final List<TagListEntry> tags;

  /// An opaque string that indicates the position at which to begin returning
  /// the next list of resource tags.
  final String nextToken;

  ListTagsForResourceResponse({
    this.tags,
    this.nextToken,
  });
  static ListTagsForResourceResponse fromJson(Map<String, dynamic> json) =>
      ListTagsForResourceResponse(
        tags: json.containsKey('Tags')
            ? (json['Tags'] as List)
                .map((e) => TagListEntry.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// ListTaskExecutionsResponse
class ListTaskExecutionsResponse {
  /// A list of executed tasks.
  final List<TaskExecutionListEntry> taskExecutions;

  /// An opaque string that indicates the position at which to begin returning
  /// the next list of executed tasks.
  final String nextToken;

  ListTaskExecutionsResponse({
    this.taskExecutions,
    this.nextToken,
  });
  static ListTaskExecutionsResponse fromJson(Map<String, dynamic> json) =>
      ListTaskExecutionsResponse(
        taskExecutions: json.containsKey('TaskExecutions')
            ? (json['TaskExecutions'] as List)
                .map((e) => TaskExecutionListEntry.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// ListTasksResponse
class ListTasksResponse {
  /// A list of all the tasks that are returned.
  final List<TaskListEntry> tasks;

  /// An opaque string that indicates the position at which to begin returning
  /// the next list of tasks.
  final String nextToken;

  ListTasksResponse({
    this.tasks,
    this.nextToken,
  });
  static ListTasksResponse fromJson(Map<String, dynamic> json) =>
      ListTasksResponse(
        tasks: json.containsKey('Tasks')
            ? (json['Tasks'] as List)
                .map((e) => TaskListEntry.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// Represents a single entry in a list of locations. `LocationListEntry`
/// returns an array that contains a list of locations when the ListLocations
/// operation is called.
class LocationListEntry {
  /// The Amazon Resource Name (ARN) of the location. For Network File System
  /// (NFS) or Amazon EFS, the location is the export path. For Amazon S3, the
  /// location is the prefix path that you want to mount and use as the root of
  /// the location.
  final String locationArn;

  /// Represents a list of URLs of a location. `LocationUri` returns an array
  /// that contains a list of locations when the ListLocations operation is
  /// called.
  ///
  /// Format: `TYPE://GLOBAL_ID/SUBDIR`.
  ///
  /// TYPE designates the type of location. Valid values: NFS | EFS | S3.
  ///
  /// GLOBAL_ID is the globally unique identifier of the resource that backs the
  /// location. An example for EFS is `us-east-2.fs-abcd1234`. An example for
  /// Amazon S3 is the bucket name, such as `myBucket`. An example for NFS is a
  /// valid IPv4 address or a host name compliant with Domain Name Service
  /// (DNS).
  ///
  /// SUBDIR is a valid file system path, delimited by forward slashes as is the
  /// *nix convention. For NFS and Amazon EFS, it's the export path to mount the
  /// location. For Amazon S3, it's the prefix path that you mount to and treat
  /// as the root of the location.
  final String locationUri;

  LocationListEntry({
    this.locationArn,
    this.locationUri,
  });
  static LocationListEntry fromJson(Map<String, dynamic> json) =>
      LocationListEntry(
        locationArn: json.containsKey('LocationArn')
            ? json['LocationArn'] as String
            : null,
        locationUri: json.containsKey('LocationUri')
            ? json['LocationUri'] as String
            : null,
      );
}

/// Represents the mount options that are available for DataSync to access an
/// NFS location.
class NfsMountOptions {
  /// The specific NFS version that you want DataSync to use to mount your NFS
  /// share. If you don't specify a version, DataSync defaults to `AUTOMATIC`.
  /// That is, DataSync automatically selects a version based on negotiation
  /// with the NFS server.
  final String version;

  NfsMountOptions({
    this.version,
  });
  static NfsMountOptions fromJson(Map<String, dynamic> json) => NfsMountOptions(
        version: json.containsKey('Version') ? json['Version'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A list of Amazon Resource Names (ARNs) of agents to use for a Network File
/// System (NFS) location.
class OnPremConfig {
  /// ARNs)of the agents to use for an NFS location.
  final List<String> agentArns;

  OnPremConfig({
    @required this.agentArns,
  });
  static OnPremConfig fromJson(Map<String, dynamic> json) => OnPremConfig(
        agentArns: (json['AgentArns'] as List).map((e) => e as String).toList(),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Represents the options that are available to control the behavior of a
/// StartTaskExecution operation. Behavior includes preserving metadata such as
/// user ID (UID), group ID (GID), and file permissions, and also overwriting
/// files in the destination, data integrity verification, and so on.
///
/// A task has a set of default options associated with it. If you don't specify
/// an option in StartTaskExecution, the default value is used. You can override
/// the defaults options on each task execution by specifying an overriding
/// `Options` value to StartTaskExecution.
class Options {
  /// A value that determines whether a data integrity verification should be
  /// performed at the end of a task execution after all data and metadata have
  /// been transferred.
  ///
  /// Default value: POINT_IN_TIME_CONSISTENT.
  ///
  /// POINT_IN_TIME_CONSISTENT: Perform verification (recommended).
  ///
  /// NONE: Skip verification.
  final String verifyMode;

  /// A file metadata value that shows the last time a file was accessed (that
  /// is, when the file was read or written to). If you set `Atime` to
  /// BEST_EFFORT, DataSync attempts to preserve the original `Atime` attribute
  /// on all source files (that is, the version before the PREPARING phase).
  /// However, `Atime`'s behavior is not fully standard across platforms, so AWS
  /// DataSync can only do this on a best-effort basis.
  ///
  /// Default value: BEST_EFFORT.
  ///
  /// BEST_EFFORT: Attempt to preserve the per-file `Atime` value (recommended).
  ///
  /// NONE: Ignore `Atime`.
  ///
  ///
  ///
  /// If `Atime` is set to BEST_EFFORT, `Mtime` must be set to PRESERVE.
  ///
  /// If `Atime` is set to NONE, `Mtime` must also be NONE.
  final String atime;

  /// A value that indicates the last time that a file was modified (that is, a
  /// file was written to) before the PREPARING phase.
  ///
  /// Default value: PRESERVE.
  ///
  /// PRESERVE: Preserve original `Mtime` (recommended)
  ///
  ///  NONE: Ignore `Mtime`.
  ///
  ///
  ///
  /// If `Mtime` is set to PRESERVE, `Atime` must be set to BEST_EFFORT.
  ///
  /// If `Mtime` is set to NONE, `Atime` must also be set to NONE.
  final String mtime;

  /// The user ID (UID) of the file's owner.
  ///
  /// Default value: INT_VALUE. This preserves the integer value of the ID.
  ///
  /// INT_VALUE: Preserve the integer value of UID and group ID (GID)
  /// (recommended).
  ///
  /// NONE: Ignore UID and GID.
  final String uid;

  /// The group ID (GID) of the file's owners.
  ///
  /// Default value: INT_VALUE. This preserves the integer value of the ID.
  ///
  /// INT_VALUE: Preserve the integer value of user ID (UID) and GID
  /// (recommended).
  ///
  /// NONE: Ignore UID and GID.
  final String gid;

  /// A value that specifies whether files in the destination that don't exist
  /// in the source file system should be preserved.
  ///
  /// Default value: PRESERVE.
  ///
  /// PRESERVE: Ignore such destination files (recommended).
  ///
  /// REMOVE: Delete destination files that aren’t present in the source.
  final String preserveDeletedFiles;

  /// A value that determines whether AWS DataSync should preserve the metadata
  /// of block and character devices in the source file system, and recreate the
  /// files with that device name and metadata on the destination.
  ///
  ///  AWS DataSync can't sync the actual contents of such devices, because they
  /// are nonterminal and don't return an end-of-file (EOF) marker.
  ///
  /// Default value: NONE.
  ///
  /// NONE: Ignore special devices (recommended).
  ///
  /// PRESERVE: Preserve character and block device metadata. This option isn't
  /// currently supported for Amazon EFS.
  final String preserveDevices;

  /// A value that determines which users or groups can access a file for a
  /// specific purpose such as reading, writing, or execution of the file.
  ///
  /// Default value: PRESERVE.
  ///
  /// PRESERVE: Preserve POSIX-style permissions (recommended).
  ///
  /// NONE: Ignore permissions.
  ///
  ///
  ///
  /// AWS DataSync can preserve extant permissions of a source location.
  final String posixPermissions;

  /// A value that limits the bandwidth used by AWS DataSync. For example, if
  /// you want AWS DataSync to use a maximum of 1 MB, set this value to
  /// `1048576` (`=1024*1024`).
  final BigInt bytesPerSecond;

  Options({
    this.verifyMode,
    this.atime,
    this.mtime,
    this.uid,
    this.gid,
    this.preserveDeletedFiles,
    this.preserveDevices,
    this.posixPermissions,
    this.bytesPerSecond,
  });
  static Options fromJson(Map<String, dynamic> json) => Options(
        verifyMode: json.containsKey('VerifyMode')
            ? json['VerifyMode'] as String
            : null,
        atime: json.containsKey('Atime') ? json['Atime'] as String : null,
        mtime: json.containsKey('Mtime') ? json['Mtime'] as String : null,
        uid: json.containsKey('Uid') ? json['Uid'] as String : null,
        gid: json.containsKey('Gid') ? json['Gid'] as String : null,
        preserveDeletedFiles: json.containsKey('PreserveDeletedFiles')
            ? json['PreserveDeletedFiles'] as String
            : null,
        preserveDevices: json.containsKey('PreserveDevices')
            ? json['PreserveDevices'] as String
            : null,
        posixPermissions: json.containsKey('PosixPermissions')
            ? json['PosixPermissions'] as String
            : null,
        bytesPerSecond: json.containsKey('BytesPerSecond')
            ? BigInt.from(json['BytesPerSecond'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The VPC endpoint, subnet and security group that an agent uses to access IP
/// addresses in a VPC (Virtual Private Cloud).
class PrivateLinkConfig {
  /// The ID of the VPC endpoint that is configured for an agent. An agent that
  /// is configured with a VPC endpoint will not be accessible over the public
  /// Internet.
  final String vpcEndpointId;

  /// The private endpoint that is configured for an agent that has access to IP
  /// addresses in a
  /// [PrivateLink](https://docs.aws.amazon.com/vpc/latest/userguide/endpoint-service.html).
  /// An agent that is configured with this endpoint will not be accessible over
  /// the public Internet.
  final String privateLinkEndpoint;

  /// The Amazon Resource Names (ARNs) of the subnets that are configured for an
  /// agent activated in a VPC or an agent that has access to a VPC endpoint.
  final List<String> subnetArns;

  /// The Amazon Resource Names (ARNs) of the security groups that are
  /// configured for the EC2 resource that hosts an agent activated in a VPC or
  /// an agent that has access to a VPC endpoint.
  final List<String> securityGroupArns;

  PrivateLinkConfig({
    this.vpcEndpointId,
    this.privateLinkEndpoint,
    this.subnetArns,
    this.securityGroupArns,
  });
  static PrivateLinkConfig fromJson(Map<String, dynamic> json) =>
      PrivateLinkConfig(
        vpcEndpointId: json.containsKey('VpcEndpointId')
            ? json['VpcEndpointId'] as String
            : null,
        privateLinkEndpoint: json.containsKey('PrivateLinkEndpoint')
            ? json['PrivateLinkEndpoint'] as String
            : null,
        subnetArns: json.containsKey('SubnetArns')
            ? (json['SubnetArns'] as List).map((e) => e as String).toList()
            : null,
        securityGroupArns: json.containsKey('SecurityGroupArns')
            ? (json['SecurityGroupArns'] as List)
                .map((e) => e as String)
                .toList()
            : null,
      );
}

/// The Amazon Resource Name (ARN) of the AWS Identity and Access Management
/// (IAM) role that is used to access an Amazon S3 bucket.
///
/// For detailed information about using such a role, see Creating a Location
/// for Amazon S3 in the _AWS DataSync User Guide_.
class S3Config {
  /// The Amazon S3 bucket to access. This bucket is used as a parameter in the
  /// CreateLocationS3 operation.
  final String bucketAccessRoleArn;

  S3Config({
    @required this.bucketAccessRoleArn,
  });
  static S3Config fromJson(Map<String, dynamic> json) => S3Config(
        bucketAccessRoleArn: json['BucketAccessRoleArn'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Represents the mount options that are available for DataSync to access an
/// SMB location.
class SmbMountOptions {
  /// The specific SMB version that you want DataSync to use to mount your SMB
  /// share. If you don't specify a version, DataSync defaults to `AUTOMATIC`.
  /// That is, DataSync automatically selects a version based on negotiation
  /// with the SMB Server server.
  final String version;

  SmbMountOptions({
    this.version,
  });
  static SmbMountOptions fromJson(Map<String, dynamic> json) => SmbMountOptions(
        version: json.containsKey('Version') ? json['Version'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// StartTaskExecutionResponse
class StartTaskExecutionResponse {
  /// The Amazon Resource Name (ARN) of the specific task execution that was
  /// started.
  final String taskExecutionArn;

  StartTaskExecutionResponse({
    this.taskExecutionArn,
  });
  static StartTaskExecutionResponse fromJson(Map<String, dynamic> json) =>
      StartTaskExecutionResponse(
        taskExecutionArn: json.containsKey('TaskExecutionArn')
            ? json['TaskExecutionArn'] as String
            : null,
      );
}

/// Represents a single entry in a list of AWS resource tags. `TagListEntry`
/// returns an array that contains a list of tasks when the ListTagsForResource
/// operation is called.
class TagListEntry {
  /// The key for an AWS resource tag.
  final String key;

  /// The value for an AWS resource tag.
  final String value;

  TagListEntry({
    @required this.key,
    this.value,
  });
  static TagListEntry fromJson(Map<String, dynamic> json) => TagListEntry(
        key: json['Key'] as String,
        value: json.containsKey('Value') ? json['Value'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class TagResourceResponse {
  TagResourceResponse();
  static TagResourceResponse fromJson(Map<String, dynamic> json) =>
      TagResourceResponse();
}

/// Represents a single entry in a list of task executions.
/// `TaskExecutionListEntry` returns an array that contains a list of specific
/// invocations of a task when ListTaskExecutions operation is called.
class TaskExecutionListEntry {
  /// The Amazon Resource Name (ARN) of the task that was executed.
  final String taskExecutionArn;

  /// The status of a task execution.
  final String status;

  TaskExecutionListEntry({
    this.taskExecutionArn,
    this.status,
  });
  static TaskExecutionListEntry fromJson(Map<String, dynamic> json) =>
      TaskExecutionListEntry(
        taskExecutionArn: json.containsKey('TaskExecutionArn')
            ? json['TaskExecutionArn'] as String
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
      );
}

/// Describes the detailed result of a `TaskExecution` operation. This result
/// includes the time in milliseconds spent in each phase, the status of the
/// task execution, and the errors encountered.
class TaskExecutionResultDetail {
  /// The total time in milliseconds that AWS DataSync spent in the PREPARING
  /// phase.
  final BigInt prepareDuration;

  /// The status of the PREPARING phase.
  final String prepareStatus;

  /// The total time in milliseconds that AWS DataSync spent in the TRANSFERRING
  /// phase.
  final BigInt transferDuration;

  /// The status of the TRANSFERRING Phase.
  final String transferStatus;

  /// The total time in milliseconds that AWS DataSync spent in the VERIFYING
  /// phase.
  final BigInt verifyDuration;

  /// The status of the VERIFYING Phase.
  final String verifyStatus;

  /// Errors that AWS DataSync encountered during execution of the task. You can
  /// use this error code to help troubleshoot issues.
  final String errorCode;

  /// Detailed description of an error that was encountered during the task
  /// execution. You can use this information to help troubleshoot issues.
  final String errorDetail;

  TaskExecutionResultDetail({
    this.prepareDuration,
    this.prepareStatus,
    this.transferDuration,
    this.transferStatus,
    this.verifyDuration,
    this.verifyStatus,
    this.errorCode,
    this.errorDetail,
  });
  static TaskExecutionResultDetail fromJson(Map<String, dynamic> json) =>
      TaskExecutionResultDetail(
        prepareDuration: json.containsKey('PrepareDuration')
            ? BigInt.from(json['PrepareDuration'])
            : null,
        prepareStatus: json.containsKey('PrepareStatus')
            ? json['PrepareStatus'] as String
            : null,
        transferDuration: json.containsKey('TransferDuration')
            ? BigInt.from(json['TransferDuration'])
            : null,
        transferStatus: json.containsKey('TransferStatus')
            ? json['TransferStatus'] as String
            : null,
        verifyDuration: json.containsKey('VerifyDuration')
            ? BigInt.from(json['VerifyDuration'])
            : null,
        verifyStatus: json.containsKey('VerifyStatus')
            ? json['VerifyStatus'] as String
            : null,
        errorCode:
            json.containsKey('ErrorCode') ? json['ErrorCode'] as String : null,
        errorDetail: json.containsKey('ErrorDetail')
            ? json['ErrorDetail'] as String
            : null,
      );
}

/// Represents a single entry in a list of tasks. `TaskListEntry` returns an
/// array that contains a list of tasks when the ListTasks operation is called.
/// A task includes the source and destination file systems to sync and the
/// options to use for the tasks.
class TaskListEntry {
  /// The Amazon Resource Name (ARN) of the task.
  final String taskArn;

  /// The status of the task.
  final String status;

  /// The name of the task.
  final String name;

  TaskListEntry({
    this.taskArn,
    this.status,
    this.name,
  });
  static TaskListEntry fromJson(Map<String, dynamic> json) => TaskListEntry(
        taskArn: json.containsKey('TaskArn') ? json['TaskArn'] as String : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
      );
}

class UntagResourceResponse {
  UntagResourceResponse();
  static UntagResourceResponse fromJson(Map<String, dynamic> json) =>
      UntagResourceResponse();
}

class UpdateAgentResponse {
  UpdateAgentResponse();
  static UpdateAgentResponse fromJson(Map<String, dynamic> json) =>
      UpdateAgentResponse();
}

class UpdateTaskResponse {
  UpdateTaskResponse();
  static UpdateTaskResponse fromJson(Map<String, dynamic> json) =>
      UpdateTaskResponse();
}
