import 'package:meta/meta.dart';

/// Amazon EMR is a web service that makes it easy to process large amounts of
/// data efficiently. Amazon EMR uses Hadoop processing combined with several
/// AWS products to do tasks such as web indexing, data mining, log file
/// analysis, machine learning, scientific simulation, and data warehousing.
class EmrApi {
  /// Adds an instance fleet to a running cluster.
  ///
  ///
  ///
  /// The instance fleet configuration is available only in Amazon EMR versions
  /// 4.8.0 and later, excluding 5.0.x.
  ///
  /// [clusterId]: The unique identifier of the cluster.
  ///
  /// [instanceFleet]: Specifies the configuration of the instance fleet.
  Future<AddInstanceFleetOutput> addInstanceFleet(
      {@required String clusterId,
      @required InstanceFleetConfig instanceFleet}) async {
    return AddInstanceFleetOutput.fromJson({});
  }

  /// Adds one or more instance groups to a running cluster.
  ///
  /// [instanceGroups]: Instance groups to add.
  ///
  /// [jobFlowId]: Job flow in which to add the instance groups.
  Future<AddInstanceGroupsOutput> addInstanceGroups(
      {@required List<InstanceGroupConfig> instanceGroups,
      @required String jobFlowId}) async {
    return AddInstanceGroupsOutput.fromJson({});
  }

  /// AddJobFlowSteps adds new steps to a running cluster. A maximum of 256
  /// steps are allowed in each job flow.
  ///
  /// If your cluster is long-running (such as a Hive data warehouse) or
  /// complex, you may require more than 256 steps to process your data. You can
  /// bypass the 256-step limitation in various ways, including using SSH to
  /// connect to the master node and submitting queries directly to the software
  /// running on the master node, such as Hive and Hadoop. For more information
  /// on how to do this, see
  /// [Add More than 256 Steps to a Cluster](https://docs.aws.amazon.com/emr/latest/ManagementGuide/AddMoreThan256Steps.html)
  /// in the _Amazon EMR Management Guide_.
  ///
  /// A step specifies the location of a JAR file stored either on the master
  /// node of the cluster or in Amazon S3. Each step is performed by the main
  /// function of the main class of the JAR file. The main class can be
  /// specified either in the manifest of the JAR or by using the MainFunction
  /// parameter of the step.
  ///
  /// Amazon EMR executes each step in the order listed. For a step to be
  /// considered complete, the main function must exit with a zero exit code and
  /// all Hadoop jobs started while the step was running must have completed and
  /// run successfully.
  ///
  /// You can only add steps to a cluster that is in one of the following
  /// states: STARTING, BOOTSTRAPPING, RUNNING, or WAITING.
  ///
  /// [jobFlowId]: A string that uniquely identifies the job flow. This
  /// identifier is returned by RunJobFlow and can also be obtained from
  /// ListClusters.
  ///
  /// [steps]:  A list of StepConfig to be executed by the job flow.
  Future<AddJobFlowStepsOutput> addJobFlowSteps(
      {@required String jobFlowId, @required List<StepConfig> steps}) async {
    return AddJobFlowStepsOutput.fromJson({});
  }

  /// Adds tags to an Amazon EMR resource. Tags make it easier to associate
  /// clusters in various ways, such as grouping clusters to track your Amazon
  /// EMR resource allocation costs. For more information, see
  /// [Tag Clusters](https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-plan-tags.html).
  ///
  /// [resourceId]: The Amazon EMR resource identifier to which tags will be
  /// added. This value must be a cluster identifier.
  ///
  /// [tags]: A list of tags to associate with a cluster and propagate to EC2
  /// instances. Tags are user-defined key/value pairs that consist of a
  /// required key string with a maximum of 128 characters, and an optional
  /// value string with a maximum of 256 characters.
  Future<AddTagsOutput> addTags(
      {@required String resourceId, @required List<Tag> tags}) async {
    return AddTagsOutput.fromJson({});
  }

  /// Cancels a pending step or steps in a running cluster. Available only in
  /// Amazon EMR versions 4.8.0 and later, excluding version 5.0.0. A maximum of
  /// 256 steps are allowed in each CancelSteps request. CancelSteps is
  /// idempotent but asynchronous; it does not guarantee a step will be
  /// canceled, even if the request is successfully submitted. You can only
  /// cancel steps that are in a `PENDING` state.
  ///
  /// [clusterId]: The `ClusterID` for which specified steps will be canceled.
  /// Use RunJobFlow and ListClusters to get ClusterIDs.
  ///
  /// [stepIds]: The list of `StepIDs` to cancel. Use ListSteps to get steps and
  /// their states for the specified cluster.
  Future<CancelStepsOutput> cancelSteps(
      {String clusterId, List<String> stepIds}) async {
    return CancelStepsOutput.fromJson({});
  }

  /// Creates a security configuration, which is stored in the service and can
  /// be specified when a cluster is created.
  ///
  /// [name]: The name of the security configuration.
  ///
  /// [securityConfiguration]: The security configuration details in JSON
  /// format. For JSON parameters and examples, see
  /// [Use Security Configurations to Set Up Cluster Security](https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-security-configurations.html)
  /// in the _Amazon EMR Management Guide_.
  Future<CreateSecurityConfigurationOutput> createSecurityConfiguration(
      {@required String name, @required String securityConfiguration}) async {
    return CreateSecurityConfigurationOutput.fromJson({});
  }

  /// Deletes a security configuration.
  ///
  /// [name]: The name of the security configuration.
  Future<DeleteSecurityConfigurationOutput> deleteSecurityConfiguration(
      String name) async {
    return DeleteSecurityConfigurationOutput.fromJson({});
  }

  /// Provides cluster-level details including status, hardware and software
  /// configuration, VPC settings, and so on.
  ///
  /// [clusterId]: The identifier of the cluster to describe.
  Future<DescribeClusterOutput> describeCluster(String clusterId) async {
    return DescribeClusterOutput.fromJson({});
  }

  /// This API is deprecated and will eventually be removed. We recommend you
  /// use ListClusters, DescribeCluster, ListSteps, ListInstanceGroups and
  /// ListBootstrapActions instead.
  ///
  /// DescribeJobFlows returns a list of job flows that match all of the
  /// supplied parameters. The parameters can include a list of job flow IDs,
  /// job flow states, and restrictions on job flow creation date and time.
  ///
  /// Regardless of supplied parameters, only job flows created within the last
  /// two months are returned.
  ///
  /// If no parameters are supplied, then job flows matching either of the
  /// following criteria are returned:
  ///
  /// *   Job flows created and completed in the last two weeks
  ///
  /// *    Job flows created within the last two months that are in one of the
  /// following states: `RUNNING`, `WAITING`, `SHUTTING_DOWN`, `STARTING`
  ///
  ///
  /// Amazon EMR can return a maximum of 512 job flow descriptions.
  ///
  /// [createdAfter]: Return only job flows created after this date and time.
  ///
  /// [createdBefore]: Return only job flows created before this date and time.
  ///
  /// [jobFlowIds]: Return only job flows whose job flow ID is contained in this
  /// list.
  ///
  /// [jobFlowStates]: Return only job flows whose state is contained in this
  /// list.
  Future<DescribeJobFlowsOutput> describeJobFlows(
      {DateTime createdAfter,
      DateTime createdBefore,
      List<String> jobFlowIds,
      List<String> jobFlowStates}) async {
    return DescribeJobFlowsOutput.fromJson({});
  }

  /// Provides the details of a security configuration by returning the
  /// configuration JSON.
  ///
  /// [name]: The name of the security configuration.
  Future<DescribeSecurityConfigurationOutput> describeSecurityConfiguration(
      String name) async {
    return DescribeSecurityConfigurationOutput.fromJson({});
  }

  /// Provides more detail about the cluster step.
  ///
  /// [clusterId]: The identifier of the cluster with steps to describe.
  ///
  /// [stepId]: The identifier of the step to describe.
  Future<DescribeStepOutput> describeStep(
      {@required String clusterId, @required String stepId}) async {
    return DescribeStepOutput.fromJson({});
  }

  /// Returns the Amazon EMR block public access configuration for your AWS
  /// account in the current Region. For more information see
  /// [Configure Block Public Access for Amazon EMR](https://docs.aws.amazon.com/emr/latest/ManagementGuide/configure-block-public-access.html)
  /// in the _Amazon EMR Management Guide_.
  Future<GetBlockPublicAccessConfigurationOutput>
      getBlockPublicAccessConfiguration() async {
    return GetBlockPublicAccessConfigurationOutput.fromJson({});
  }

  /// Provides information about the bootstrap actions associated with a
  /// cluster.
  ///
  /// [clusterId]: The cluster identifier for the bootstrap actions to list.
  ///
  /// [marker]: The pagination token that indicates the next set of results to
  /// retrieve.
  Future<ListBootstrapActionsOutput> listBootstrapActions(String clusterId,
      {String marker}) async {
    return ListBootstrapActionsOutput.fromJson({});
  }

  /// Provides the status of all clusters visible to this AWS account. Allows
  /// you to filter the list of clusters based on certain criteria; for example,
  /// filtering by cluster creation date and time or by status. This call
  /// returns a maximum of 50 clusters per call, but returns a marker to track
  /// the paging of the cluster list across multiple ListClusters calls.
  ///
  /// [createdAfter]: The creation date and time beginning value filter for
  /// listing clusters.
  ///
  /// [createdBefore]: The creation date and time end value filter for listing
  /// clusters.
  ///
  /// [clusterStates]: The cluster state filters to apply when listing clusters.
  ///
  /// [marker]: The pagination token that indicates the next set of results to
  /// retrieve.
  Future<ListClustersOutput> listClusters(
      {DateTime createdAfter,
      DateTime createdBefore,
      List<String> clusterStates,
      String marker}) async {
    return ListClustersOutput.fromJson({});
  }

  /// Lists all available details about the instance fleets in a cluster.
  ///
  ///
  ///
  /// The instance fleet configuration is available only in Amazon EMR versions
  /// 4.8.0 and later, excluding 5.0.x versions.
  ///
  /// [clusterId]: The unique identifier of the cluster.
  ///
  /// [marker]: The pagination token that indicates the next set of results to
  /// retrieve.
  Future<ListInstanceFleetsOutput> listInstanceFleets(String clusterId,
      {String marker}) async {
    return ListInstanceFleetsOutput.fromJson({});
  }

  /// Provides all available details about the instance groups in a cluster.
  ///
  /// [clusterId]: The identifier of the cluster for which to list the instance
  /// groups.
  ///
  /// [marker]: The pagination token that indicates the next set of results to
  /// retrieve.
  Future<ListInstanceGroupsOutput> listInstanceGroups(String clusterId,
      {String marker}) async {
    return ListInstanceGroupsOutput.fromJson({});
  }

  /// Provides information for all active EC2 instances and EC2 instances
  /// terminated in the last 30 days, up to a maximum of 2,000. EC2 instances in
  /// any of the following states are considered active: AWAITING_FULFILLMENT,
  /// PROVISIONING, BOOTSTRAPPING, RUNNING.
  ///
  /// [clusterId]: The identifier of the cluster for which to list the
  /// instances.
  ///
  /// [instanceGroupId]: The identifier of the instance group for which to list
  /// the instances.
  ///
  /// [instanceGroupTypes]: The type of instance group for which to list the
  /// instances.
  ///
  /// [instanceFleetId]: The unique identifier of the instance fleet.
  ///
  /// [instanceFleetType]: The node type of the instance fleet. For example
  /// MASTER, CORE, or TASK.
  ///
  /// [instanceStates]: A list of instance states that will filter the instances
  /// returned with this request.
  ///
  /// [marker]: The pagination token that indicates the next set of results to
  /// retrieve.
  Future<ListInstancesOutput> listInstances(String clusterId,
      {String instanceGroupId,
      List<String> instanceGroupTypes,
      String instanceFleetId,
      String instanceFleetType,
      List<String> instanceStates,
      String marker}) async {
    return ListInstancesOutput.fromJson({});
  }

  /// Lists all the security configurations visible to this account, providing
  /// their creation dates and times, and their names. This call returns a
  /// maximum of 50 clusters per call, but returns a marker to track the paging
  /// of the cluster list across multiple ListSecurityConfigurations calls.
  ///
  /// [marker]: The pagination token that indicates the set of results to
  /// retrieve.
  Future<ListSecurityConfigurationsOutput> listSecurityConfigurations(
      {String marker}) async {
    return ListSecurityConfigurationsOutput.fromJson({});
  }

  /// Provides a list of steps for the cluster in reverse order unless you
  /// specify stepIds with the request.
  ///
  /// [clusterId]: The identifier of the cluster for which to list the steps.
  ///
  /// [stepStates]: The filter to limit the step list based on certain states.
  ///
  /// [stepIds]: The filter to limit the step list based on the identifier of
  /// the steps.
  ///
  /// [marker]: The pagination token that indicates the next set of results to
  /// retrieve.
  Future<ListStepsOutput> listSteps(String clusterId,
      {List<String> stepStates, List<String> stepIds, String marker}) async {
    return ListStepsOutput.fromJson({});
  }

  /// Modifies the target On-Demand and target Spot capacities for the instance
  /// fleet with the specified InstanceFleetID within the cluster specified
  /// using ClusterID. The call either succeeds or fails atomically.
  ///
  ///
  ///
  /// The instance fleet configuration is available only in Amazon EMR versions
  /// 4.8.0 and later, excluding 5.0.x versions.
  ///
  /// [clusterId]: The unique identifier of the cluster.
  ///
  /// [instanceFleet]: The unique identifier of the instance fleet.
  Future<void> modifyInstanceFleet(
      {@required String clusterId,
      @required InstanceFleetModifyConfig instanceFleet}) async {}

  /// ModifyInstanceGroups modifies the number of nodes and configuration
  /// settings of an instance group. The input parameters include the new target
  /// instance count for the group and the instance group ID. The call will
  /// either succeed or fail atomically.
  ///
  /// [clusterId]: The ID of the cluster to which the instance group belongs.
  ///
  /// [instanceGroups]: Instance groups to change.
  Future<void> modifyInstanceGroups(
      {String clusterId,
      List<InstanceGroupModifyConfig> instanceGroups}) async {}

  /// Creates or updates an automatic scaling policy for a core instance group
  /// or task instance group in an Amazon EMR cluster. The automatic scaling
  /// policy defines how an instance group dynamically adds and terminates EC2
  /// instances in response to the value of a CloudWatch metric.
  ///
  /// [clusterId]: Specifies the ID of a cluster. The instance group to which
  /// the automatic scaling policy is applied is within this cluster.
  ///
  /// [instanceGroupId]: Specifies the ID of the instance group to which the
  /// automatic scaling policy is applied.
  ///
  /// [autoScalingPolicy]: Specifies the definition of the automatic scaling
  /// policy.
  Future<PutAutoScalingPolicyOutput> putAutoScalingPolicy(
      {@required String clusterId,
      @required String instanceGroupId,
      @required AutoScalingPolicy autoScalingPolicy}) async {
    return PutAutoScalingPolicyOutput.fromJson({});
  }

  /// Creates or updates an Amazon EMR block public access configuration for
  /// your AWS account in the current Region. For more information see
  /// [Configure Block Public Access for Amazon EMR](https://docs.aws.amazon.com/emr/latest/ManagementGuide/configure-block-public-access.html)
  /// in the _Amazon EMR Management Guide_.
  ///
  /// [blockPublicAccessConfiguration]: A configuration for Amazon EMR block
  /// public access. The configuration applies to all clusters created in your
  /// account for the current Region. The configuration specifies whether block
  /// public access is enabled. If block public access is enabled, security
  /// groups associated with the cluster cannot have rules that allow inbound
  /// traffic from 0.0.0.0/0 or ::/0 on a port, unless the port is specified as
  /// an exception using `PermittedPublicSecurityGroupRuleRanges` in the
  /// `BlockPublicAccessConfiguration`. By default, Port 22 (SSH) is an
  /// exception, and public access is allowed on this port. You can change this
  /// by updating `BlockPublicSecurityGroupRules` to remove the exception.
  Future<PutBlockPublicAccessConfigurationOutput>
      putBlockPublicAccessConfiguration(
          BlockPublicAccessConfiguration blockPublicAccessConfiguration) async {
    return PutBlockPublicAccessConfigurationOutput.fromJson({});
  }

  /// Removes an automatic scaling policy from a specified instance group within
  /// an EMR cluster.
  ///
  /// [clusterId]: Specifies the ID of a cluster. The instance group to which
  /// the automatic scaling policy is applied is within this cluster.
  ///
  /// [instanceGroupId]: Specifies the ID of the instance group to which the
  /// scaling policy is applied.
  Future<RemoveAutoScalingPolicyOutput> removeAutoScalingPolicy(
      {@required String clusterId, @required String instanceGroupId}) async {
    return RemoveAutoScalingPolicyOutput.fromJson({});
  }

  /// Removes tags from an Amazon EMR resource. Tags make it easier to associate
  /// clusters in various ways, such as grouping clusters to track your Amazon
  /// EMR resource allocation costs. For more information, see
  /// [Tag Clusters](https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-plan-tags.html).
  ///
  /// The following example removes the stack tag with value Prod from a
  /// cluster:
  ///
  /// [resourceId]: The Amazon EMR resource identifier from which tags will be
  /// removed. This value must be a cluster identifier.
  ///
  /// [tagKeys]: A list of tag keys to remove from a resource.
  Future<RemoveTagsOutput> removeTags(
      {@required String resourceId, @required List<String> tagKeys}) async {
    return RemoveTagsOutput.fromJson({});
  }

  /// RunJobFlow creates and starts running a new cluster (job flow). The
  /// cluster runs the steps specified. After the steps complete, the cluster
  /// stops and the HDFS partition is lost. To prevent loss of data, configure
  /// the last step of the job flow to store results in Amazon S3. If the
  /// JobFlowInstancesConfig `KeepJobFlowAliveWhenNoSteps` parameter is set to
  /// `TRUE`, the cluster transitions to the WAITING state rather than shutting
  /// down after the steps have completed.
  ///
  /// For additional protection, you can set the JobFlowInstancesConfig
  /// `TerminationProtected` parameter to `TRUE` to lock the cluster and prevent
  /// it from being terminated by API call, user intervention, or in the event
  /// of a job flow error.
  ///
  /// A maximum of 256 steps are allowed in each job flow.
  ///
  /// If your cluster is long-running (such as a Hive data warehouse) or
  /// complex, you may require more than 256 steps to process your data. You can
  /// bypass the 256-step limitation in various ways, including using the SSH
  /// shell to connect to the master node and submitting queries directly to the
  /// software running on the master node, such as Hive and Hadoop. For more
  /// information on how to do this, see
  /// [Add More than 256 Steps to a Cluster](https://docs.aws.amazon.com/emr/latest/ManagementGuide/AddMoreThan256Steps.html)
  /// in the _Amazon EMR Management Guide_.
  ///
  /// For long running clusters, we recommend that you periodically store your
  /// results.
  ///
  ///
  ///
  /// The instance fleets configuration is available only in Amazon EMR versions
  /// 4.8.0 and later, excluding 5.0.x versions. The RunJobFlow request can
  /// contain InstanceFleets parameters or InstanceGroups parameters, but not
  /// both.
  ///
  /// [name]: The name of the job flow.
  ///
  /// [logUri]: The location in Amazon S3 to write the log files of the job
  /// flow. If a value is not provided, logs are not created.
  ///
  /// [additionalInfo]: A JSON string for selecting additional features.
  ///
  /// [amiVersion]: Applies only to Amazon EMR AMI versions 3.x and 2.x. For
  /// Amazon EMR releases 4.0 and later, `ReleaseLabel` is used. To specify a
  /// custom AMI, use `CustomAmiID`.
  ///
  /// [releaseLabel]: The Amazon EMR release label, which determines the version
  /// of open-source application packages installed on the cluster. Release
  /// labels are in the form `emr-x.x.x`, where x.x.x is an Amazon EMR release
  /// version such as `emr-5.14.0`. For more information about Amazon EMR
  /// release versions and included application versions and features, see
  /// [https://docs.aws.amazon.com/emr/latest/ReleaseGuide/](https://docs.aws.amazon.com/emr/latest/ReleaseGuide/).
  /// The release label applies only to Amazon EMR releases version 4.0 and
  /// later. Earlier versions use `AmiVersion`.
  ///
  /// [instances]: A specification of the number and type of Amazon EC2
  /// instances.
  ///
  /// [steps]: A list of steps to run.
  ///
  /// [bootstrapActions]: A list of bootstrap actions to run before Hadoop
  /// starts on the cluster nodes.
  ///
  /// [supportedProducts]: For Amazon EMR releases 3.x and 2.x. For Amazon EMR
  /// releases 4.x and later, use Applications.
  ///
  /// A list of strings that indicates third-party software to use. For more
  /// information, see the
  /// [Amazon EMR Developer Guide](https://docs.aws.amazon.com/emr/latest/DeveloperGuide/emr-dg.pdf).
  /// Currently supported values are:
  ///
  /// *   "mapr-m3" - launch the job flow using MapR M3 Edition.
  ///
  /// *   "mapr-m5" - launch the job flow using MapR M5 Edition.
  ///
  /// [newSupportedProducts]: For Amazon EMR releases 3.x and 2.x. For Amazon
  /// EMR releases 4.x and later, use Applications.
  ///
  /// A list of strings that indicates third-party software to use with the job
  /// flow that accepts a user argument list. EMR accepts and forwards the
  /// argument list to the corresponding installation script as bootstrap action
  /// arguments. For more information, see "Launch a Job Flow on the MapR
  /// Distribution for Hadoop" in the
  /// [Amazon EMR Developer Guide](https://docs.aws.amazon.com/emr/latest/DeveloperGuide/emr-dg.pdf).
  /// Supported values are:
  ///
  /// *   "mapr-m3" - launch the cluster using MapR M3 Edition.
  ///
  /// *   "mapr-m5" - launch the cluster using MapR M5 Edition.
  ///
  /// *   "mapr" with the user arguments specifying "--edition,m3" or
  /// "--edition,m5" - launch the job flow using MapR M3 or M5 Edition
  /// respectively.
  ///
  /// *   "mapr-m7" - launch the cluster using MapR M7 Edition.
  ///
  /// *   "hunk" - launch the cluster with the Hunk Big Data Analtics Platform.
  ///
  /// *   "hue"- launch the cluster with Hue installed.
  ///
  /// *   "spark" - launch the cluster with Apache Spark installed.
  ///
  /// *   "ganglia" - launch the cluster with the Ganglia Monitoring System
  /// installed.
  ///
  /// [applications]: Applies to Amazon EMR releases 4.0 and later. A
  /// case-insensitive list of applications for Amazon EMR to install and
  /// configure when launching the cluster. For a list of applications available
  /// for each Amazon EMR release version, see the
  /// [Amazon EMR Release Guide](https://docs.aws.amazon.com/emr/latest/ReleaseGuide/).
  ///
  /// [configurations]: For Amazon EMR releases 4.0 and later. The list of
  /// configurations supplied for the EMR cluster you are creating.
  ///
  /// [visibleToAllUsers]:  _This member will be deprecated._
  ///
  /// Whether the cluster is visible to all IAM users of the AWS account
  /// associated with the cluster. If this value is set to `true`, all IAM users
  /// of that AWS account can view and (if they have the proper policy
  /// permissions set) manage the cluster. If it is set to `false`, only the IAM
  /// user that created the cluster can view and manage it.
  ///
  /// [jobFlowRole]: Also called instance profile and EC2 role. An IAM role for
  /// an EMR cluster. The EC2 instances of the cluster assume this role. The
  /// default role is `EMR_EC2_DefaultRole`. In order to use the default role,
  /// you must have already created it using the CLI or console.
  ///
  /// [serviceRole]: The IAM role that will be assumed by the Amazon EMR service
  /// to access AWS resources on your behalf.
  ///
  /// [tags]: A list of tags to associate with a cluster and propagate to Amazon
  /// EC2 instances.
  ///
  /// [securityConfiguration]: The name of a security configuration to apply to
  /// the cluster.
  ///
  /// [autoScalingRole]: An IAM role for automatic scaling policies. The default
  /// role is `EMR_AutoScaling_DefaultRole`. The IAM role provides permissions
  /// that the automatic scaling feature requires to launch and terminate EC2
  /// instances in an instance group.
  ///
  /// [scaleDownBehavior]: Specifies the way that individual Amazon EC2
  /// instances terminate when an automatic scale-in activity occurs or an
  /// instance group is resized. `TERMINATE_AT_INSTANCE_HOUR` indicates that
  /// Amazon EMR terminates nodes at the instance-hour boundary, regardless of
  /// when the request to terminate the instance was submitted. This option is
  /// only available with Amazon EMR 5.1.0 and later and is the default for
  /// clusters created using that version. `TERMINATE_AT_TASK_COMPLETION`
  /// indicates that Amazon EMR blacklists and drains tasks from nodes before
  /// terminating the Amazon EC2 instances, regardless of the instance-hour
  /// boundary. With either behavior, Amazon EMR removes the least active nodes
  /// first and blocks instance termination if it could lead to HDFS corruption.
  /// `TERMINATE_AT_TASK_COMPLETION` available only in Amazon EMR version 4.1.0
  /// and later, and is the default for versions of Amazon EMR earlier than
  /// 5.1.0.
  ///
  /// [customAmiId]: Available only in Amazon EMR version 5.7.0 and later. The
  /// ID of a custom Amazon EBS-backed Linux AMI. If specified, Amazon EMR uses
  /// this AMI when it launches cluster EC2 instances. For more information
  /// about custom AMIs in Amazon EMR, see
  /// [Using a Custom AMI](https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-custom-ami.html)
  /// in the _Amazon EMR Management Guide_. If omitted, the cluster uses the
  /// base Linux AMI for the `ReleaseLabel` specified. For Amazon EMR versions
  /// 2.x and 3.x, use `AmiVersion` instead.
  ///
  /// For information about creating a custom AMI, see
  /// [Creating an Amazon EBS-Backed Linux AMI](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/creating-an-ami-ebs.html)
  /// in the _Amazon Elastic Compute Cloud User Guide for Linux Instances_. For
  /// information about finding an AMI ID, see
  /// [Finding a Linux AMI](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/finding-an-ami.html).
  ///
  /// [ebsRootVolumeSize]: The size, in GiB, of the EBS root device volume of
  /// the Linux AMI that is used for each EC2 instance. Available in Amazon EMR
  /// version 4.x and later.
  ///
  /// [repoUpgradeOnBoot]: Applies only when `CustomAmiID` is used. Specifies
  /// which updates from the Amazon Linux AMI package repositories to apply
  /// automatically when the instance boots using the AMI. If omitted, the
  /// default is `SECURITY`, which indicates that only security updates are
  /// applied. If `NONE` is specified, no updates are applied, and all updates
  /// must be applied manually.
  ///
  /// [kerberosAttributes]: Attributes for Kerberos configuration when Kerberos
  /// authentication is enabled using a security configuration. For more
  /// information see
  /// [Use Kerberos Authentication](https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-kerberos.html)
  /// in the _EMR Management Guide_.
  Future<RunJobFlowOutput> runJobFlow(
      {@required String name,
      String logUri,
      String additionalInfo,
      String amiVersion,
      String releaseLabel,
      @required JobFlowInstancesConfig instances,
      List<StepConfig> steps,
      List<BootstrapActionConfig> bootstrapActions,
      List<String> supportedProducts,
      List<SupportedProductConfig> newSupportedProducts,
      List<Application> applications,
      List<Configuration> configurations,
      bool visibleToAllUsers,
      String jobFlowRole,
      String serviceRole,
      List<Tag> tags,
      String securityConfiguration,
      String autoScalingRole,
      String scaleDownBehavior,
      String customAmiId,
      int ebsRootVolumeSize,
      String repoUpgradeOnBoot,
      KerberosAttributes kerberosAttributes}) async {
    return RunJobFlowOutput.fromJson({});
  }

  /// SetTerminationProtection locks a cluster (job flow) so the EC2 instances
  /// in the cluster cannot be terminated by user intervention, an API call, or
  /// in the event of a job-flow error. The cluster still terminates upon
  /// successful completion of the job flow. Calling `SetTerminationProtection`
  /// on a cluster is similar to calling the Amazon EC2 `DisableAPITermination`
  /// API on all EC2 instances in a cluster.
  ///
  ///  `SetTerminationProtection` is used to prevent accidental termination of a
  /// cluster and to ensure that in the event of an error, the instances persist
  /// so that you can recover any data stored in their ephemeral instance
  /// storage.
  ///
  ///  To terminate a cluster that has been locked by setting
  /// `SetTerminationProtection` to `true`, you must first unlock the job flow
  /// by a subsequent call to `SetTerminationProtection` in which you set the
  /// value to `false`.
  ///
  ///  For more information,
  /// see[Managing Cluster Termination](https://docs.aws.amazon.com/emr/latest/ManagementGuide/UsingEMR_TerminationProtection.html)
  /// in the _Amazon EMR Management Guide_.
  ///
  /// [jobFlowIds]:  A list of strings that uniquely identify the clusters to
  /// protect. This identifier is returned by RunJobFlow and can also be
  /// obtained from DescribeJobFlows .
  ///
  /// [terminationProtected]: A Boolean that indicates whether to protect the
  /// cluster and prevent the Amazon EC2 instances in the cluster from shutting
  /// down due to API calls, user intervention, or job-flow error.
  Future<void> setTerminationProtection(
      {@required List<String> jobFlowIds,
      @required bool terminationProtected}) async {}

  ///  _This member will be deprecated._
  ///
  /// Sets whether all AWS Identity and Access Management (IAM) users under your
  /// account can access the specified clusters (job flows). This action works
  /// on running clusters. You can also set the visibility of a cluster when you
  /// launch it using the `VisibleToAllUsers` parameter of RunJobFlow. The
  /// SetVisibleToAllUsers action can be called only by an IAM user who created
  /// the cluster or the AWS account that owns the cluster.
  ///
  /// [jobFlowIds]: Identifiers of the job flows to receive the new visibility
  /// setting.
  ///
  /// [visibleToAllUsers]:  _This member will be deprecated._
  ///
  /// Whether the specified clusters are visible to all IAM users of the AWS
  /// account associated with the cluster. If this value is set to True, all IAM
  /// users of that AWS account can view and, if they have the proper IAM policy
  /// permissions set, manage the clusters. If it is set to False, only the IAM
  /// user that created a cluster can view and manage it.
  Future<void> setVisibleToAllUsers(
      {@required List<String> jobFlowIds,
      @required bool visibleToAllUsers}) async {}

  /// TerminateJobFlows shuts a list of clusters (job flows) down. When a job
  /// flow is shut down, any step not yet completed is canceled and the EC2
  /// instances on which the cluster is running are stopped. Any log files not
  /// already saved are uploaded to Amazon S3 if a LogUri was specified when the
  /// cluster was created.
  ///
  /// The maximum number of clusters allowed is 10. The call to
  /// `TerminateJobFlows` is asynchronous. Depending on the configuration of the
  /// cluster, it may take up to 1-5 minutes for the cluster to completely
  /// terminate and release allocated resources, such as Amazon EC2 instances.
  ///
  /// [jobFlowIds]: A list of job flows to be shutdown.
  Future<void> terminateJobFlows(List<String> jobFlowIds) async {}
}

class AddInstanceFleetOutput {
  /// The unique identifier of the cluster.
  final String clusterId;

  /// The unique identifier of the instance fleet.
  final String instanceFleetId;

  AddInstanceFleetOutput({
    this.clusterId,
    this.instanceFleetId,
  });
  static AddInstanceFleetOutput fromJson(Map<String, dynamic> json) =>
      AddInstanceFleetOutput();
}

/// Output from an AddInstanceGroups call.
class AddInstanceGroupsOutput {
  /// The job flow ID in which the instance groups are added.
  final String jobFlowId;

  /// Instance group IDs of the newly created instance groups.
  final List<String> instanceGroupIds;

  AddInstanceGroupsOutput({
    this.jobFlowId,
    this.instanceGroupIds,
  });
  static AddInstanceGroupsOutput fromJson(Map<String, dynamic> json) =>
      AddInstanceGroupsOutput();
}

///  The output for the AddJobFlowSteps operation.
class AddJobFlowStepsOutput {
  /// The identifiers of the list of steps added to the job flow.
  final List<String> stepIds;

  AddJobFlowStepsOutput({
    this.stepIds,
  });
  static AddJobFlowStepsOutput fromJson(Map<String, dynamic> json) =>
      AddJobFlowStepsOutput();
}

/// This output indicates the result of adding tags to a resource.
class AddTagsOutput {
  AddTagsOutput();
  static AddTagsOutput fromJson(Map<String, dynamic> json) => AddTagsOutput();
}

/// With Amazon EMR release version 4.0 and later, the only accepted parameter
/// is the application name. To pass arguments to applications, you use
/// configuration classifications specified using configuration JSON objects.
/// For more information, see
/// [Configuring Applications](https://docs.aws.amazon.com/emr/latest/ReleaseGuide/emr-configure-apps.html).
///
/// With earlier Amazon EMR releases, the application is any Amazon or
/// third-party software that you can add to the cluster. This structure
/// contains a list of strings that indicates the software to use with the
/// cluster and accepts a user argument list. Amazon EMR accepts and forwards
/// the argument list to the corresponding installation script as bootstrap
/// action argument.
class Application {
  /// The name of the application.
  final String name;

  /// The version of the application.
  final String version;

  /// Arguments for Amazon EMR to pass to the application.
  final List<String> args;

  /// This option is for advanced users only. This is meta information about
  /// third-party applications that third-party vendors use for testing
  /// purposes.
  final Map<String, String> additionalInfo;

  Application({
    this.name,
    this.version,
    this.args,
    this.additionalInfo,
  });
  static Application fromJson(Map<String, dynamic> json) => Application();
}

/// An automatic scaling policy for a core instance group or task instance group
/// in an Amazon EMR cluster. An automatic scaling policy defines how an
/// instance group dynamically adds and terminates EC2 instances in response to
/// the value of a CloudWatch metric. See PutAutoScalingPolicy.
class AutoScalingPolicy {
  /// The upper and lower EC2 instance limits for an automatic scaling policy.
  /// Automatic scaling activity will not cause an instance group to grow above
  /// or below these limits.
  final ScalingConstraints constraints;

  /// The scale-in and scale-out rules that comprise the automatic scaling
  /// policy.
  final List<ScalingRule> rules;

  AutoScalingPolicy({
    @required this.constraints,
    @required this.rules,
  });
}

/// An automatic scaling policy for a core instance group or task instance group
/// in an Amazon EMR cluster. The automatic scaling policy defines how an
/// instance group dynamically adds and terminates EC2 instances in response to
/// the value of a CloudWatch metric. See PutAutoScalingPolicy.
class AutoScalingPolicyDescription {
  /// The status of an automatic scaling policy.
  final AutoScalingPolicyStatus status;

  /// The upper and lower EC2 instance limits for an automatic scaling policy.
  /// Automatic scaling activity will not cause an instance group to grow above
  /// or below these limits.
  final ScalingConstraints constraints;

  /// The scale-in and scale-out rules that comprise the automatic scaling
  /// policy.
  final List<ScalingRule> rules;

  AutoScalingPolicyDescription({
    this.status,
    this.constraints,
    this.rules,
  });
  static AutoScalingPolicyDescription fromJson(Map<String, dynamic> json) =>
      AutoScalingPolicyDescription();
}

/// The reason for an AutoScalingPolicyStatus change.
class AutoScalingPolicyStateChangeReason {
  /// The code indicating the reason for the change in status.`USER_REQUEST`
  /// indicates that the scaling policy status was changed by a user.
  /// `PROVISION_FAILURE` indicates that the status change was because the
  /// policy failed to provision. `CLEANUP_FAILURE` indicates an error.
  final String code;

  /// A friendly, more verbose message that accompanies an automatic scaling
  /// policy state change.
  final String message;

  AutoScalingPolicyStateChangeReason({
    this.code,
    this.message,
  });
  static AutoScalingPolicyStateChangeReason fromJson(
          Map<String, dynamic> json) =>
      AutoScalingPolicyStateChangeReason();
}

/// The status of an automatic scaling policy.
class AutoScalingPolicyStatus {
  /// Indicates the status of the automatic scaling policy.
  final String state;

  /// The reason for a change in status.
  final AutoScalingPolicyStateChangeReason stateChangeReason;

  AutoScalingPolicyStatus({
    this.state,
    this.stateChangeReason,
  });
  static AutoScalingPolicyStatus fromJson(Map<String, dynamic> json) =>
      AutoScalingPolicyStatus();
}

/// A configuration for Amazon EMR block public access. When
/// `BlockPublicSecurityGroupRules` is set to `true`, Amazon EMR prevents
/// cluster creation if one of the cluster's security groups has a rule that
/// allows inbound traffic from 0.0.0.0/0 or ::/0 on a port, unless the port is
/// specified as an exception using `PermittedPublicSecurityGroupRuleRanges`.
class BlockPublicAccessConfiguration {
  /// Indicates whether EMR block public access is enabled (`true`) or disabled
  /// (`false`). By default, the value is `false` for accounts that have created
  /// EMR clusters before July 2019. For accounts created after this, the
  /// default is `true`.
  final bool blockPublicSecurityGroupRules;

  /// Specifies ports and port ranges that are permitted to have security group
  /// rules that allow inbound traffic from all public sources. For example, if
  /// Port 23 (Telnet) is specified for
  /// `PermittedPublicSecurityGroupRuleRanges`, Amazon EMR allows cluster
  /// creation if a security group associated with the cluster has a rule that
  /// allows inbound traffic on Port 23 from IPv4 0.0.0.0/0 or IPv6 port ::/0 as
  /// the source.
  ///
  /// By default, Port 22, which is used for SSH access to the cluster EC2
  /// instances, is in the list of `PermittedPublicSecurityGroupRuleRanges`.
  final List<PortRange> permittedPublicSecurityGroupRuleRanges;

  BlockPublicAccessConfiguration({
    @required this.blockPublicSecurityGroupRules,
    this.permittedPublicSecurityGroupRuleRanges,
  });
  static BlockPublicAccessConfiguration fromJson(Map<String, dynamic> json) =>
      BlockPublicAccessConfiguration();
}

/// Properties that describe the AWS principal that created the
/// `BlockPublicAccessConfiguration` using the
/// `PutBlockPublicAccessConfiguration` action as well as the date and time that
/// the configuration was created. Each time a configuration for block public
/// access is updated, Amazon EMR updates this metadata.
class BlockPublicAccessConfigurationMetadata {
  /// The date and time that the configuration was created.
  final DateTime creationDateTime;

  /// The Amazon Resource Name that created or last modified the configuration.
  final String createdByArn;

  BlockPublicAccessConfigurationMetadata({
    @required this.creationDateTime,
    @required this.createdByArn,
  });
  static BlockPublicAccessConfigurationMetadata fromJson(
          Map<String, dynamic> json) =>
      BlockPublicAccessConfigurationMetadata();
}

/// Configuration of a bootstrap action.
class BootstrapActionConfig {
  /// The name of the bootstrap action.
  final String name;

  /// The script run by the bootstrap action.
  final ScriptBootstrapActionConfig scriptBootstrapAction;

  BootstrapActionConfig({
    @required this.name,
    @required this.scriptBootstrapAction,
  });
  static BootstrapActionConfig fromJson(Map<String, dynamic> json) =>
      BootstrapActionConfig();
}

/// Reports the configuration of a bootstrap action in a cluster (job flow).
class BootstrapActionDetail {
  /// A description of the bootstrap action.
  final BootstrapActionConfig bootstrapActionConfig;

  BootstrapActionDetail({
    this.bootstrapActionConfig,
  });
  static BootstrapActionDetail fromJson(Map<String, dynamic> json) =>
      BootstrapActionDetail();
}

/// Specification of the status of a CancelSteps request. Available only in
/// Amazon EMR version 4.8.0 and later, excluding version 5.0.0.
class CancelStepsInfo {
  /// The encrypted StepId of a step.
  final String stepId;

  /// The status of a CancelSteps Request. The value may be SUBMITTED or FAILED.
  final String status;

  /// The reason for the failure if the CancelSteps request fails.
  final String reason;

  CancelStepsInfo({
    this.stepId,
    this.status,
    this.reason,
  });
  static CancelStepsInfo fromJson(Map<String, dynamic> json) =>
      CancelStepsInfo();
}

///  The output for the CancelSteps operation.
class CancelStepsOutput {
  /// A list of CancelStepsInfo, which shows the status of specified cancel
  /// requests for each `StepID` specified.
  final List<CancelStepsInfo> cancelStepsInfoList;

  CancelStepsOutput({
    this.cancelStepsInfoList,
  });
  static CancelStepsOutput fromJson(Map<String, dynamic> json) =>
      CancelStepsOutput();
}

/// The definition of a CloudWatch metric alarm, which determines when an
/// automatic scaling activity is triggered. When the defined alarm conditions
/// are satisfied, scaling activity begins.
class CloudWatchAlarmDefinition {
  /// Determines how the metric specified by `MetricName` is compared to the
  /// value specified by `Threshold`.
  final String comparisonOperator;

  /// The number of periods, expressed in seconds using `Period`, during which
  /// the alarm condition must exist before the alarm triggers automatic scaling
  /// activity. The default value is `1`.
  final int evaluationPeriods;

  /// The name of the CloudWatch metric that is watched to determine an alarm
  /// condition.
  final String metricName;

  /// The namespace for the CloudWatch metric. The default is
  /// `AWS/ElasticMapReduce`.
  final String namespace;

  /// The period, in seconds, over which the statistic is applied. EMR
  /// CloudWatch metrics are emitted every five minutes (300 seconds), so if an
  /// EMR CloudWatch metric is specified, specify `300`.
  final int period;

  /// The statistic to apply to the metric associated with the alarm. The
  /// default is `AVERAGE`.
  final String statistic;

  /// The value against which the specified statistic is compared.
  final double threshold;

  /// The unit of measure associated with the CloudWatch metric being watched.
  /// The value specified for `Unit` must correspond to the units specified in
  /// the CloudWatch metric.
  final String unit;

  /// A CloudWatch metric dimension.
  final List<MetricDimension> dimensions;

  CloudWatchAlarmDefinition({
    @required this.comparisonOperator,
    this.evaluationPeriods,
    @required this.metricName,
    this.namespace,
    @required this.period,
    this.statistic,
    @required this.threshold,
    this.unit,
    this.dimensions,
  });
  static CloudWatchAlarmDefinition fromJson(Map<String, dynamic> json) =>
      CloudWatchAlarmDefinition();
}

/// The detailed description of the cluster.
class Cluster {
  /// The unique identifier for the cluster.
  final String id;

  /// The name of the cluster.
  final String name;

  /// The current status details about the cluster.
  final ClusterStatus status;

  /// Provides information about the EC2 instances in a cluster grouped by
  /// category. For example, key name, subnet ID, IAM instance profile, and so
  /// on.
  final Ec2InstanceAttributes ec2InstanceAttributes;

  /// The instance fleet configuration is available only in Amazon EMR versions
  /// 4.8.0 and later, excluding 5.0.x versions.
  ///
  /// The instance group configuration of the cluster. A value of
  /// `INSTANCE_GROUP` indicates a uniform instance group configuration. A value
  /// of `INSTANCE_FLEET` indicates an instance fleets configuration.
  final String instanceCollectionType;

  /// The path to the Amazon S3 location where logs for this cluster are stored.
  final String logUri;

  /// The AMI version requested for this cluster.
  final String requestedAmiVersion;

  /// The AMI version running on this cluster.
  final String runningAmiVersion;

  /// The Amazon EMR release label, which determines the version of open-source
  /// application packages installed on the cluster. Release labels are in the
  /// form `emr-x.x.x`, where x.x.x is an Amazon EMR release version such as
  /// `emr-5.14.0`. For more information about Amazon EMR release versions and
  /// included application versions and features, see
  /// [https://docs.aws.amazon.com/emr/latest/ReleaseGuide/](https://docs.aws.amazon.com/emr/latest/ReleaseGuide/).
  /// The release label applies only to Amazon EMR releases version 4.0 and
  /// later. Earlier versions use `AmiVersion`.
  final String releaseLabel;

  /// Specifies whether the cluster should terminate after completing all steps.
  final bool autoTerminate;

  /// Indicates whether Amazon EMR will lock the cluster to prevent the EC2
  /// instances from being terminated by an API call or user intervention, or in
  /// the event of a cluster error.
  final bool terminationProtected;

  ///  _This member will be deprecated._
  ///
  /// Indicates whether the cluster is visible to all IAM users of the AWS
  /// account associated with the cluster. If this value is set to `true`, all
  /// IAM users of that AWS account can view and manage the cluster if they have
  /// the proper policy permissions set. If this value is `false`, only the IAM
  /// user that created the cluster can view and manage it. This value can be
  /// changed using the SetVisibleToAllUsers action.
  final bool visibleToAllUsers;

  /// The applications installed on this cluster.
  final List<Application> applications;

  /// A list of tags associated with a cluster.
  final List<Tag> tags;

  /// The IAM role that will be assumed by the Amazon EMR service to access AWS
  /// resources on your behalf.
  final String serviceRole;

  /// An approximation of the cost of the cluster, represented in
  /// m1.small/hours. This value is incremented one time for every hour an
  /// m1.small instance runs. Larger instances are weighted more, so an EC2
  /// instance that is roughly four times more expensive would result in the
  /// normalized instance hours being incremented by four. This result is only
  /// an approximation and does not reflect the actual billing rate.
  final int normalizedInstanceHours;

  /// The DNS name of the master node. If the cluster is on a private subnet,
  /// this is the private DNS name. On a public subnet, this is the public DNS
  /// name.
  final String masterPublicDnsName;

  /// Applies only to Amazon EMR releases 4.x and later. The list of
  /// Configurations supplied to the EMR cluster.
  final List<Configuration> configurations;

  /// The name of the security configuration applied to the cluster.
  final String securityConfiguration;

  /// An IAM role for automatic scaling policies. The default role is
  /// `EMR_AutoScaling_DefaultRole`. The IAM role provides permissions that the
  /// automatic scaling feature requires to launch and terminate EC2 instances
  /// in an instance group.
  final String autoScalingRole;

  /// The way that individual Amazon EC2 instances terminate when an automatic
  /// scale-in activity occurs or an instance group is resized.
  /// `TERMINATE_AT_INSTANCE_HOUR` indicates that Amazon EMR terminates nodes at
  /// the instance-hour boundary, regardless of when the request to terminate
  /// the instance was submitted. This option is only available with Amazon EMR
  /// 5.1.0 and later and is the default for clusters created using that
  /// version. `TERMINATE_AT_TASK_COMPLETION` indicates that Amazon EMR
  /// blacklists and drains tasks from nodes before terminating the Amazon EC2
  /// instances, regardless of the instance-hour boundary. With either behavior,
  /// Amazon EMR removes the least active nodes first and blocks instance
  /// termination if it could lead to HDFS corruption.
  /// `TERMINATE_AT_TASK_COMPLETION` is available only in Amazon EMR version
  /// 4.1.0 and later, and is the default for versions of Amazon EMR earlier
  /// than 5.1.0.
  final String scaleDownBehavior;

  /// Available only in Amazon EMR version 5.7.0 and later. The ID of a custom
  /// Amazon EBS-backed Linux AMI if the cluster uses a custom AMI.
  final String customAmiId;

  /// The size, in GiB, of the EBS root device volume of the Linux AMI that is
  /// used for each EC2 instance. Available in Amazon EMR version 4.x and later.
  final int ebsRootVolumeSize;

  /// Applies only when `CustomAmiID` is used. Specifies the type of updates
  /// that are applied from the Amazon Linux AMI package repositories when an
  /// instance boots using the AMI.
  final String repoUpgradeOnBoot;

  /// Attributes for Kerberos configuration when Kerberos authentication is
  /// enabled using a security configuration. For more information see
  /// [Use Kerberos Authentication](https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-kerberos.html)
  /// in the _EMR Management Guide_.
  final KerberosAttributes kerberosAttributes;

  Cluster({
    this.id,
    this.name,
    this.status,
    this.ec2InstanceAttributes,
    this.instanceCollectionType,
    this.logUri,
    this.requestedAmiVersion,
    this.runningAmiVersion,
    this.releaseLabel,
    this.autoTerminate,
    this.terminationProtected,
    this.visibleToAllUsers,
    this.applications,
    this.tags,
    this.serviceRole,
    this.normalizedInstanceHours,
    this.masterPublicDnsName,
    this.configurations,
    this.securityConfiguration,
    this.autoScalingRole,
    this.scaleDownBehavior,
    this.customAmiId,
    this.ebsRootVolumeSize,
    this.repoUpgradeOnBoot,
    this.kerberosAttributes,
  });
  static Cluster fromJson(Map<String, dynamic> json) => Cluster();
}

/// The reason that the cluster changed to its current state.
class ClusterStateChangeReason {
  /// The programmatic code for the state change reason.
  final String code;

  /// The descriptive message for the state change reason.
  final String message;

  ClusterStateChangeReason({
    this.code,
    this.message,
  });
  static ClusterStateChangeReason fromJson(Map<String, dynamic> json) =>
      ClusterStateChangeReason();
}

/// The detailed status of the cluster.
class ClusterStatus {
  /// The current state of the cluster.
  final String state;

  /// The reason for the cluster status change.
  final ClusterStateChangeReason stateChangeReason;

  /// A timeline that represents the status of a cluster over the lifetime of
  /// the cluster.
  final ClusterTimeline timeline;

  ClusterStatus({
    this.state,
    this.stateChangeReason,
    this.timeline,
  });
  static ClusterStatus fromJson(Map<String, dynamic> json) => ClusterStatus();
}

/// The summary description of the cluster.
class ClusterSummary {
  /// The unique identifier for the cluster.
  final String id;

  /// The name of the cluster.
  final String name;

  /// The details about the current status of the cluster.
  final ClusterStatus status;

  /// An approximation of the cost of the cluster, represented in
  /// m1.small/hours. This value is incremented one time for every hour an
  /// m1.small instance runs. Larger instances are weighted more, so an EC2
  /// instance that is roughly four times more expensive would result in the
  /// normalized instance hours being incremented by four. This result is only
  /// an approximation and does not reflect the actual billing rate.
  final int normalizedInstanceHours;

  ClusterSummary({
    this.id,
    this.name,
    this.status,
    this.normalizedInstanceHours,
  });
  static ClusterSummary fromJson(Map<String, dynamic> json) => ClusterSummary();
}

/// Represents the timeline of the cluster's lifecycle.
class ClusterTimeline {
  /// The creation date and time of the cluster.
  final DateTime creationDateTime;

  /// The date and time when the cluster was ready to execute steps.
  final DateTime readyDateTime;

  /// The date and time when the cluster was terminated.
  final DateTime endDateTime;

  ClusterTimeline({
    this.creationDateTime,
    this.readyDateTime,
    this.endDateTime,
  });
  static ClusterTimeline fromJson(Map<String, dynamic> json) =>
      ClusterTimeline();
}

/// An entity describing an executable that runs on a cluster.
class Command {
  /// The name of the command.
  final String name;

  /// The Amazon S3 location of the command script.
  final String scriptPath;

  /// Arguments for Amazon EMR to pass to the command for execution.
  final List<String> args;

  Command({
    this.name,
    this.scriptPath,
    this.args,
  });
  static Command fromJson(Map<String, dynamic> json) => Command();
}

/// Amazon EMR releases 4.x or later.
///
/// An optional configuration specification to be used when provisioning cluster
/// instances, which can include configurations for applications and software
/// bundled with Amazon EMR. A configuration consists of a classification,
/// properties, and optional nested configurations. A classification refers to
/// an application-specific configuration file. Properties are the settings you
/// want to change in that file. For more information, see
/// [Configuring Applications](https://docs.aws.amazon.com/emr/latest/ReleaseGuide/emr-configure-apps.html).
class Configuration {
  /// The classification within a configuration.
  final String classification;

  /// A list of additional configurations to apply within a configuration
  /// object.
  final List<Configuration> configurations;

  /// A set of properties specified within a configuration classification.
  final Map<String, String> properties;

  Configuration({
    this.classification,
    this.configurations,
    this.properties,
  });
  static Configuration fromJson(Map<String, dynamic> json) => Configuration();
}

class CreateSecurityConfigurationOutput {
  /// The name of the security configuration.
  final String name;

  /// The date and time the security configuration was created.
  final DateTime creationDateTime;

  CreateSecurityConfigurationOutput({
    @required this.name,
    @required this.creationDateTime,
  });
  static CreateSecurityConfigurationOutput fromJson(
          Map<String, dynamic> json) =>
      CreateSecurityConfigurationOutput();
}

class DeleteSecurityConfigurationOutput {
  DeleteSecurityConfigurationOutput();
  static DeleteSecurityConfigurationOutput fromJson(
          Map<String, dynamic> json) =>
      DeleteSecurityConfigurationOutput();
}

/// This output contains the description of the cluster.
class DescribeClusterOutput {
  /// This output contains the details for the requested cluster.
  final Cluster cluster;

  DescribeClusterOutput({
    this.cluster,
  });
  static DescribeClusterOutput fromJson(Map<String, dynamic> json) =>
      DescribeClusterOutput();
}

///  The output for the DescribeJobFlows operation.
class DescribeJobFlowsOutput {
  /// A list of job flows matching the parameters supplied.
  final List<JobFlowDetail> jobFlows;

  DescribeJobFlowsOutput({
    this.jobFlows,
  });
  static DescribeJobFlowsOutput fromJson(Map<String, dynamic> json) =>
      DescribeJobFlowsOutput();
}

class DescribeSecurityConfigurationOutput {
  /// The name of the security configuration.
  final String name;

  /// The security configuration details in JSON format.
  final String securityConfiguration;

  /// The date and time the security configuration was created
  final DateTime creationDateTime;

  DescribeSecurityConfigurationOutput({
    this.name,
    this.securityConfiguration,
    this.creationDateTime,
  });
  static DescribeSecurityConfigurationOutput fromJson(
          Map<String, dynamic> json) =>
      DescribeSecurityConfigurationOutput();
}

/// This output contains the description of the cluster step.
class DescribeStepOutput {
  /// The step details for the requested step identifier.
  final Step step;

  DescribeStepOutput({
    this.step,
  });
  static DescribeStepOutput fromJson(Map<String, dynamic> json) =>
      DescribeStepOutput();
}

/// Configuration of requested EBS block device associated with the instance
/// group.
class EbsBlockDevice {
  /// EBS volume specifications such as volume type, IOPS, and size (GiB) that
  /// will be requested for the EBS volume attached to an EC2 instance in the
  /// cluster.
  final VolumeSpecification volumeSpecification;

  /// The device name that is exposed to the instance, such as /dev/sdh.
  final String device;

  EbsBlockDevice({
    this.volumeSpecification,
    this.device,
  });
  static EbsBlockDevice fromJson(Map<String, dynamic> json) => EbsBlockDevice();
}

/// Configuration of requested EBS block device associated with the instance
/// group with count of volumes that will be associated to every instance.
class EbsBlockDeviceConfig {
  /// EBS volume specifications such as volume type, IOPS, and size (GiB) that
  /// will be requested for the EBS volume attached to an EC2 instance in the
  /// cluster.
  final VolumeSpecification volumeSpecification;

  /// Number of EBS volumes with a specific volume configuration that will be
  /// associated with every instance in the instance group
  final int volumesPerInstance;

  EbsBlockDeviceConfig({
    @required this.volumeSpecification,
    this.volumesPerInstance,
  });
}

/// The Amazon EBS configuration of a cluster instance.
class EbsConfiguration {
  /// An array of Amazon EBS volume specifications attached to a cluster
  /// instance.
  final List<EbsBlockDeviceConfig> ebsBlockDeviceConfigs;

  /// Indicates whether an Amazon EBS volume is EBS-optimized.
  final bool ebsOptimized;

  EbsConfiguration({
    this.ebsBlockDeviceConfigs,
    this.ebsOptimized,
  });
}

/// EBS block device that's attached to an EC2 instance.
class EbsVolume {
  /// The device name that is exposed to the instance, such as /dev/sdh.
  final String device;

  /// The volume identifier of the EBS volume.
  final String volumeId;

  EbsVolume({
    this.device,
    this.volumeId,
  });
  static EbsVolume fromJson(Map<String, dynamic> json) => EbsVolume();
}

/// Provides information about the EC2 instances in a cluster grouped by
/// category. For example, key name, subnet ID, IAM instance profile, and so on.
class Ec2InstanceAttributes {
  /// The name of the Amazon EC2 key pair to use when connecting with SSH into
  /// the master node as a user named "hadoop".
  final String ec2KeyName;

  /// Set this parameter to the identifier of the Amazon VPC subnet where you
  /// want the cluster to launch. If you do not specify this value, and your
  /// account supports EC2-Classic, the cluster launches in EC2-Classic.
  final String ec2SubnetId;

  /// Applies to clusters configured with the instance fleets option. Specifies
  /// the unique identifier of one or more Amazon EC2 subnets in which to launch
  /// EC2 cluster instances. Subnets must exist within the same VPC. Amazon EMR
  /// chooses the EC2 subnet with the best fit from among the list of
  /// `RequestedEc2SubnetIds`, and then launches all cluster instances within
  /// that Subnet. If this value is not specified, and the account and Region
  /// support EC2-Classic networks, the cluster launches instances in the
  /// EC2-Classic network and uses `RequestedEc2AvailabilityZones` instead of
  /// this setting. If EC2-Classic is not supported, and no Subnet is specified,
  /// Amazon EMR chooses the subnet for you. `RequestedEc2SubnetIDs` and
  /// `RequestedEc2AvailabilityZones` cannot be specified together.
  final List<String> requestedEc2SubnetIds;

  /// The Availability Zone in which the cluster will run.
  final String ec2AvailabilityZone;

  /// Applies to clusters configured with the instance fleets option. Specifies
  /// one or more Availability Zones in which to launch EC2 cluster instances
  /// when the EC2-Classic network configuration is supported. Amazon EMR
  /// chooses the Availability Zone with the best fit from among the list of
  /// `RequestedEc2AvailabilityZones`, and then launches all cluster instances
  /// within that Availability Zone. If you do not specify this value, Amazon
  /// EMR chooses the Availability Zone for you. `RequestedEc2SubnetIDs` and
  /// `RequestedEc2AvailabilityZones` cannot be specified together.
  final List<String> requestedEc2AvailabilityZones;

  /// The IAM role that was specified when the cluster was launched. The EC2
  /// instances of the cluster assume this role.
  final String iamInstanceProfile;

  /// The identifier of the Amazon EC2 security group for the master node.
  final String emrManagedMasterSecurityGroup;

  /// The identifier of the Amazon EC2 security group for the core and task
  /// nodes.
  final String emrManagedSlaveSecurityGroup;

  /// The identifier of the Amazon EC2 security group for the Amazon EMR service
  /// to access clusters in VPC private subnets.
  final String serviceAccessSecurityGroup;

  /// A list of additional Amazon EC2 security group IDs for the master node.
  final List<String> additionalMasterSecurityGroups;

  /// A list of additional Amazon EC2 security group IDs for the core and task
  /// nodes.
  final List<String> additionalSlaveSecurityGroups;

  Ec2InstanceAttributes({
    this.ec2KeyName,
    this.ec2SubnetId,
    this.requestedEc2SubnetIds,
    this.ec2AvailabilityZone,
    this.requestedEc2AvailabilityZones,
    this.iamInstanceProfile,
    this.emrManagedMasterSecurityGroup,
    this.emrManagedSlaveSecurityGroup,
    this.serviceAccessSecurityGroup,
    this.additionalMasterSecurityGroups,
    this.additionalSlaveSecurityGroups,
  });
  static Ec2InstanceAttributes fromJson(Map<String, dynamic> json) =>
      Ec2InstanceAttributes();
}

/// The details of the step failure. The service attempts to detect the root
/// cause for many common failures.
class FailureDetails {
  /// The reason for the step failure. In the case where the service cannot
  /// successfully determine the root cause of the failure, it returns "Unknown
  /// Error" as a reason.
  final String reason;

  /// The descriptive message including the error the EMR service has identified
  /// as the cause of step failure. This is text from an error log that
  /// describes the root cause of the failure.
  final String message;

  /// The path to the log file where the step failure root cause was originally
  /// recorded.
  final String logFile;

  FailureDetails({
    this.reason,
    this.message,
    this.logFile,
  });
  static FailureDetails fromJson(Map<String, dynamic> json) => FailureDetails();
}

class GetBlockPublicAccessConfigurationOutput {
  /// A configuration for Amazon EMR block public access. The configuration
  /// applies to all clusters created in your account for the current Region.
  /// The configuration specifies whether block public access is enabled. If
  /// block public access is enabled, security groups associated with the
  /// cluster cannot have rules that allow inbound traffic from 0.0.0.0/0 or
  /// ::/0 on a port, unless the port is specified as an exception using
  /// `PermittedPublicSecurityGroupRuleRanges` in the
  /// `BlockPublicAccessConfiguration`. By default, Port 22 (SSH) is an
  /// exception, and public access is allowed on this port. You can change this
  /// by updating the block public access configuration to remove the exception.
  final BlockPublicAccessConfiguration blockPublicAccessConfiguration;

  /// Properties that describe the AWS principal that created the
  /// `BlockPublicAccessConfiguration` using the
  /// `PutBlockPublicAccessConfiguration` action as well as the date and time
  /// that the configuration was created. Each time a configuration for block
  /// public access is updated, Amazon EMR updates this metadata.
  final BlockPublicAccessConfigurationMetadata
      blockPublicAccessConfigurationMetadata;

  GetBlockPublicAccessConfigurationOutput({
    @required this.blockPublicAccessConfiguration,
    @required this.blockPublicAccessConfigurationMetadata,
  });
  static GetBlockPublicAccessConfigurationOutput fromJson(
          Map<String, dynamic> json) =>
      GetBlockPublicAccessConfigurationOutput();
}

/// A job flow step consisting of a JAR file whose main function will be
/// executed. The main function submits a job for Hadoop to execute and waits
/// for the job to finish or fail.
class HadoopJarStepConfig {
  /// A list of Java properties that are set when the step runs. You can use
  /// these properties to pass key value pairs to your main function.
  final List<KeyValue> properties;

  /// A path to a JAR file run during the step.
  final String jar;

  /// The name of the main class in the specified Java file. If not specified,
  /// the JAR file should specify a Main-Class in its manifest file.
  final String mainClass;

  /// A list of command line arguments passed to the JAR file's main function
  /// when executed.
  final List<String> args;

  HadoopJarStepConfig({
    this.properties,
    @required this.jar,
    this.mainClass,
    this.args,
  });
  static HadoopJarStepConfig fromJson(Map<String, dynamic> json) =>
      HadoopJarStepConfig();
}

/// A cluster step consisting of a JAR file whose main function will be
/// executed. The main function submits a job for Hadoop to execute and waits
/// for the job to finish or fail.
class HadoopStepConfig {
  /// The path to the JAR file that runs during the step.
  final String jar;

  /// The list of Java properties that are set when the step runs. You can use
  /// these properties to pass key value pairs to your main function.
  final Map<String, String> properties;

  /// The name of the main class in the specified Java file. If not specified,
  /// the JAR file should specify a main class in its manifest file.
  final String mainClass;

  /// The list of command line arguments to pass to the JAR file's main function
  /// for execution.
  final List<String> args;

  HadoopStepConfig({
    this.jar,
    this.properties,
    this.mainClass,
    this.args,
  });
  static HadoopStepConfig fromJson(Map<String, dynamic> json) =>
      HadoopStepConfig();
}

/// Represents an EC2 instance provisioned as part of cluster.
class Instance {
  /// The unique identifier for the instance in Amazon EMR.
  final String id;

  /// The unique identifier of the instance in Amazon EC2.
  final String ec2InstanceId;

  /// The public DNS name of the instance.
  final String publicDnsName;

  /// The public IP address of the instance.
  final String publicIpAddress;

  /// The private DNS name of the instance.
  final String privateDnsName;

  /// The private IP address of the instance.
  final String privateIpAddress;

  /// The current status of the instance.
  final InstanceStatus status;

  /// The identifier of the instance group to which this instance belongs.
  final String instanceGroupId;

  /// The unique identifier of the instance fleet to which an EC2 instance
  /// belongs.
  final String instanceFleetId;

  /// The instance purchasing option. Valid values are `ON_DEMAND` or `SPOT`.
  final String market;

  /// The EC2 instance type, for example `m3.xlarge`.
  final String instanceType;

  /// The list of EBS volumes that are attached to this instance.
  final List<EbsVolume> ebsVolumes;

  Instance({
    this.id,
    this.ec2InstanceId,
    this.publicDnsName,
    this.publicIpAddress,
    this.privateDnsName,
    this.privateIpAddress,
    this.status,
    this.instanceGroupId,
    this.instanceFleetId,
    this.market,
    this.instanceType,
    this.ebsVolumes,
  });
  static Instance fromJson(Map<String, dynamic> json) => Instance();
}

/// Describes an instance fleet, which is a group of EC2 instances that host a
/// particular node type (master, core, or task) in an Amazon EMR cluster.
/// Instance fleets can consist of a mix of instance types and On-Demand and
/// Spot instances, which are provisioned to meet a defined target capacity.
///
///
///
/// The instance fleet configuration is available only in Amazon EMR versions
/// 4.8.0 and later, excluding 5.0.x versions.
class InstanceFleet {
  /// The unique identifier of the instance fleet.
  final String id;

  /// A friendly name for the instance fleet.
  final String name;

  /// The current status of the instance fleet.
  final InstanceFleetStatus status;

  /// The node type that the instance fleet hosts. Valid values are MASTER,
  /// CORE, or TASK.
  final String instanceFleetType;

  /// The target capacity of On-Demand units for the instance fleet, which
  /// determines how many On-Demand instances to provision. When the instance
  /// fleet launches, Amazon EMR tries to provision On-Demand instances as
  /// specified by InstanceTypeConfig. Each instance configuration has a
  /// specified `WeightedCapacity`. When an On-Demand instance is provisioned,
  /// the `WeightedCapacity` units count toward the target capacity. Amazon EMR
  /// provisions instances until the target capacity is totally fulfilled, even
  /// if this results in an overage. For example, if there are 2 units remaining
  /// to fulfill capacity, and Amazon EMR can only provision an instance with a
  /// `WeightedCapacity` of 5 units, the instance is provisioned, and the target
  /// capacity is exceeded by 3 units. You can use
  /// InstanceFleet$ProvisionedOnDemandCapacity to determine the Spot capacity
  /// units that have been provisioned for the instance fleet.
  ///
  ///
  ///
  /// If not specified or set to 0, only Spot instances are provisioned for the
  /// instance fleet using `TargetSpotCapacity`. At least one of
  /// `TargetSpotCapacity` and `TargetOnDemandCapacity` should be greater than
  /// 0. For a master instance fleet, only one of `TargetSpotCapacity` and
  /// `TargetOnDemandCapacity` can be specified, and its value must be 1.
  final int targetOnDemandCapacity;

  /// The target capacity of Spot units for the instance fleet, which determines
  /// how many Spot instances to provision. When the instance fleet launches,
  /// Amazon EMR tries to provision Spot instances as specified by
  /// InstanceTypeConfig. Each instance configuration has a specified
  /// `WeightedCapacity`. When a Spot instance is provisioned, the
  /// `WeightedCapacity` units count toward the target capacity. Amazon EMR
  /// provisions instances until the target capacity is totally fulfilled, even
  /// if this results in an overage. For example, if there are 2 units remaining
  /// to fulfill capacity, and Amazon EMR can only provision an instance with a
  /// `WeightedCapacity` of 5 units, the instance is provisioned, and the target
  /// capacity is exceeded by 3 units. You can use
  /// InstanceFleet$ProvisionedSpotCapacity to determine the Spot capacity units
  /// that have been provisioned for the instance fleet.
  ///
  ///
  ///
  /// If not specified or set to 0, only On-Demand instances are provisioned for
  /// the instance fleet. At least one of `TargetSpotCapacity` and
  /// `TargetOnDemandCapacity` should be greater than 0. For a master instance
  /// fleet, only one of `TargetSpotCapacity` and `TargetOnDemandCapacity` can
  /// be specified, and its value must be 1.
  final int targetSpotCapacity;

  /// The number of On-Demand units that have been provisioned for the instance
  /// fleet to fulfill `TargetOnDemandCapacity`. This provisioned capacity might
  /// be less than or greater than `TargetOnDemandCapacity`.
  final int provisionedOnDemandCapacity;

  /// The number of Spot units that have been provisioned for this instance
  /// fleet to fulfill `TargetSpotCapacity`. This provisioned capacity might be
  /// less than or greater than `TargetSpotCapacity`.
  final int provisionedSpotCapacity;

  /// The specification for the instance types that comprise an instance fleet.
  /// Up to five unique instance specifications may be defined for each instance
  /// fleet.
  final List<InstanceTypeSpecification> instanceTypeSpecifications;

  /// Describes the launch specification for an instance fleet.
  final InstanceFleetProvisioningSpecifications launchSpecifications;

  InstanceFleet({
    this.id,
    this.name,
    this.status,
    this.instanceFleetType,
    this.targetOnDemandCapacity,
    this.targetSpotCapacity,
    this.provisionedOnDemandCapacity,
    this.provisionedSpotCapacity,
    this.instanceTypeSpecifications,
    this.launchSpecifications,
  });
  static InstanceFleet fromJson(Map<String, dynamic> json) => InstanceFleet();
}

/// The configuration that defines an instance fleet.
///
///
///
/// The instance fleet configuration is available only in Amazon EMR versions
/// 4.8.0 and later, excluding 5.0.x versions.
class InstanceFleetConfig {
  /// The friendly name of the instance fleet.
  final String name;

  /// The node type that the instance fleet hosts. Valid values are
  /// MASTER,CORE,and TASK.
  final String instanceFleetType;

  /// The target capacity of On-Demand units for the instance fleet, which
  /// determines how many On-Demand instances to provision. When the instance
  /// fleet launches, Amazon EMR tries to provision On-Demand instances as
  /// specified by InstanceTypeConfig. Each instance configuration has a
  /// specified `WeightedCapacity`. When an On-Demand instance is provisioned,
  /// the `WeightedCapacity` units count toward the target capacity. Amazon EMR
  /// provisions instances until the target capacity is totally fulfilled, even
  /// if this results in an overage. For example, if there are 2 units remaining
  /// to fulfill capacity, and Amazon EMR can only provision an instance with a
  /// `WeightedCapacity` of 5 units, the instance is provisioned, and the target
  /// capacity is exceeded by 3 units.
  ///
  ///
  ///
  /// If not specified or set to 0, only Spot instances are provisioned for the
  /// instance fleet using `TargetSpotCapacity`. At least one of
  /// `TargetSpotCapacity` and `TargetOnDemandCapacity` should be greater than
  /// 0. For a master instance fleet, only one of `TargetSpotCapacity` and
  /// `TargetOnDemandCapacity` can be specified, and its value must be 1.
  final int targetOnDemandCapacity;

  /// The target capacity of Spot units for the instance fleet, which determines
  /// how many Spot instances to provision. When the instance fleet launches,
  /// Amazon EMR tries to provision Spot instances as specified by
  /// InstanceTypeConfig. Each instance configuration has a specified
  /// `WeightedCapacity`. When a Spot instance is provisioned, the
  /// `WeightedCapacity` units count toward the target capacity. Amazon EMR
  /// provisions instances until the target capacity is totally fulfilled, even
  /// if this results in an overage. For example, if there are 2 units remaining
  /// to fulfill capacity, and Amazon EMR can only provision an instance with a
  /// `WeightedCapacity` of 5 units, the instance is provisioned, and the target
  /// capacity is exceeded by 3 units.
  ///
  ///
  ///
  /// If not specified or set to 0, only On-Demand instances are provisioned for
  /// the instance fleet. At least one of `TargetSpotCapacity` and
  /// `TargetOnDemandCapacity` should be greater than 0. For a master instance
  /// fleet, only one of `TargetSpotCapacity` and `TargetOnDemandCapacity` can
  /// be specified, and its value must be 1.
  final int targetSpotCapacity;

  /// The instance type configurations that define the EC2 instances in the
  /// instance fleet.
  final List<InstanceTypeConfig> instanceTypeConfigs;

  /// The launch specification for the instance fleet.
  final InstanceFleetProvisioningSpecifications launchSpecifications;

  InstanceFleetConfig({
    this.name,
    @required this.instanceFleetType,
    this.targetOnDemandCapacity,
    this.targetSpotCapacity,
    this.instanceTypeConfigs,
    this.launchSpecifications,
  });
}

/// Configuration parameters for an instance fleet modification request.
///
///
///
/// The instance fleet configuration is available only in Amazon EMR versions
/// 4.8.0 and later, excluding 5.0.x versions.
class InstanceFleetModifyConfig {
  /// A unique identifier for the instance fleet.
  final String instanceFleetId;

  /// The target capacity of On-Demand units for the instance fleet. For more
  /// information see InstanceFleetConfig$TargetOnDemandCapacity.
  final int targetOnDemandCapacity;

  /// The target capacity of Spot units for the instance fleet. For more
  /// information, see InstanceFleetConfig$TargetSpotCapacity.
  final int targetSpotCapacity;

  InstanceFleetModifyConfig({
    @required this.instanceFleetId,
    this.targetOnDemandCapacity,
    this.targetSpotCapacity,
  });
}

/// The launch specification for Spot instances in the fleet, which determines
/// the defined duration and provisioning timeout behavior.
///
///
///
/// The instance fleet configuration is available only in Amazon EMR versions
/// 4.8.0 and later, excluding 5.0.x versions.
class InstanceFleetProvisioningSpecifications {
  /// The launch specification for Spot instances in the fleet, which determines
  /// the defined duration and provisioning timeout behavior.
  final SpotProvisioningSpecification spotSpecification;

  InstanceFleetProvisioningSpecifications({
    @required this.spotSpecification,
  });
  static InstanceFleetProvisioningSpecifications fromJson(
          Map<String, dynamic> json) =>
      InstanceFleetProvisioningSpecifications();
}

/// Provides status change reason details for the instance fleet.
///
///
///
/// The instance fleet configuration is available only in Amazon EMR versions
/// 4.8.0 and later, excluding 5.0.x versions.
class InstanceFleetStateChangeReason {
  /// A code corresponding to the reason the state change occurred.
  final String code;

  /// An explanatory message.
  final String message;

  InstanceFleetStateChangeReason({
    this.code,
    this.message,
  });
  static InstanceFleetStateChangeReason fromJson(Map<String, dynamic> json) =>
      InstanceFleetStateChangeReason();
}

/// The status of the instance fleet.
///
///
///
/// The instance fleet configuration is available only in Amazon EMR versions
/// 4.8.0 and later, excluding 5.0.x versions.
class InstanceFleetStatus {
  /// A code representing the instance fleet status.
  ///
  /// *    `PROVISIONING`—The instance fleet is provisioning EC2 resources and
  /// is not yet ready to run jobs.
  ///
  /// *    `BOOTSTRAPPING`—EC2 instances and other resources have been
  /// provisioned and the bootstrap actions specified for the instances are
  /// underway.
  ///
  /// *    `RUNNING`—EC2 instances and other resources are running. They are
  /// either executing jobs or waiting to execute jobs.
  ///
  /// *    `RESIZING`—A resize operation is underway. EC2 instances are either
  /// being added or removed.
  ///
  /// *    `SUSPENDED`—A resize operation could not complete. Existing EC2
  /// instances are running, but instances can't be added or removed.
  ///
  /// *    `TERMINATING`—The instance fleet is terminating EC2 instances.
  ///
  /// *    `TERMINATED`—The instance fleet is no longer active, and all EC2
  /// instances have been terminated.
  final String state;

  /// Provides status change reason details for the instance fleet.
  final InstanceFleetStateChangeReason stateChangeReason;

  /// Provides historical timestamps for the instance fleet, including the time
  /// of creation, the time it became ready to run jobs, and the time of
  /// termination.
  final InstanceFleetTimeline timeline;

  InstanceFleetStatus({
    this.state,
    this.stateChangeReason,
    this.timeline,
  });
  static InstanceFleetStatus fromJson(Map<String, dynamic> json) =>
      InstanceFleetStatus();
}

/// Provides historical timestamps for the instance fleet, including the time of
/// creation, the time it became ready to run jobs, and the time of termination.
///
///
///
/// The instance fleet configuration is available only in Amazon EMR versions
/// 4.8.0 and later, excluding 5.0.x versions.
class InstanceFleetTimeline {
  /// The time and date the instance fleet was created.
  final DateTime creationDateTime;

  /// The time and date the instance fleet was ready to run jobs.
  final DateTime readyDateTime;

  /// The time and date the instance fleet terminated.
  final DateTime endDateTime;

  InstanceFleetTimeline({
    this.creationDateTime,
    this.readyDateTime,
    this.endDateTime,
  });
  static InstanceFleetTimeline fromJson(Map<String, dynamic> json) =>
      InstanceFleetTimeline();
}

/// This entity represents an instance group, which is a group of instances that
/// have common purpose. For example, CORE instance group is used for HDFS.
class InstanceGroup {
  /// The identifier of the instance group.
  final String id;

  /// The name of the instance group.
  final String name;

  /// The marketplace to provision instances for this group. Valid values are
  /// ON_DEMAND or SPOT.
  final String market;

  /// The type of the instance group. Valid values are MASTER, CORE or TASK.
  final String instanceGroupType;

  /// The maximum Spot price your are willing to pay for EC2 instances.
  ///
  /// An optional, nullable field that applies if the `MarketType` for the
  /// instance group is specified as `SPOT`. Specify the maximum spot price in
  /// USD. If the value is NULL and `SPOT` is specified, the maximum Spot price
  /// is set equal to the On-Demand price.
  final String bidPrice;

  /// The EC2 instance type for all instances in the instance group.
  final String instanceType;

  /// The target number of instances for the instance group.
  final int requestedInstanceCount;

  /// The number of instances currently running in this instance group.
  final int runningInstanceCount;

  /// The current status of the instance group.
  final InstanceGroupStatus status;

  /// Amazon EMR releases 4.x or later.
  ///
  /// The list of configurations supplied for an EMR cluster instance group. You
  /// can specify a separate configuration for each instance group (master,
  /// core, and task).
  final List<Configuration> configurations;

  /// The version number of the requested configuration specification for this
  /// instance group.
  final BigInt configurationsVersion;

  /// A list of configurations that were successfully applied for an instance
  /// group last time.
  final List<Configuration> lastSuccessfullyAppliedConfigurations;

  /// The version number of a configuration specification that was successfully
  /// applied for an instance group last time.
  final BigInt lastSuccessfullyAppliedConfigurationsVersion;

  /// The EBS block devices that are mapped to this instance group.
  final List<EbsBlockDevice> ebsBlockDevices;

  /// If the instance group is EBS-optimized. An Amazon EBS-optimized instance
  /// uses an optimized configuration stack and provides additional, dedicated
  /// capacity for Amazon EBS I/O.
  final bool ebsOptimized;

  /// Policy for customizing shrink operations.
  final ShrinkPolicy shrinkPolicy;

  /// An automatic scaling policy for a core instance group or task instance
  /// group in an Amazon EMR cluster. The automatic scaling policy defines how
  /// an instance group dynamically adds and terminates EC2 instances in
  /// response to the value of a CloudWatch metric. See PutAutoScalingPolicy.
  final AutoScalingPolicyDescription autoScalingPolicy;

  InstanceGroup({
    this.id,
    this.name,
    this.market,
    this.instanceGroupType,
    this.bidPrice,
    this.instanceType,
    this.requestedInstanceCount,
    this.runningInstanceCount,
    this.status,
    this.configurations,
    this.configurationsVersion,
    this.lastSuccessfullyAppliedConfigurations,
    this.lastSuccessfullyAppliedConfigurationsVersion,
    this.ebsBlockDevices,
    this.ebsOptimized,
    this.shrinkPolicy,
    this.autoScalingPolicy,
  });
  static InstanceGroup fromJson(Map<String, dynamic> json) => InstanceGroup();
}

/// Configuration defining a new instance group.
class InstanceGroupConfig {
  /// Friendly name given to the instance group.
  final String name;

  /// Market type of the EC2 instances used to create a cluster node.
  final String market;

  /// The role of the instance group in the cluster.
  final String instanceRole;

  /// The maximum Spot price your are willing to pay for EC2 instances.
  ///
  /// An optional, nullable field that applies if the `MarketType` for the
  /// instance group is specified as `SPOT`. Specify the maximum spot price in
  /// USD. If the value is NULL and `SPOT` is specified, the maximum Spot price
  /// is set equal to the On-Demand price.
  final String bidPrice;

  /// The EC2 instance type for all instances in the instance group.
  final String instanceType;

  /// Target number of instances for the instance group.
  final int instanceCount;

  /// Amazon EMR releases 4.x or later.
  ///
  /// The list of configurations supplied for an EMR cluster instance group. You
  /// can specify a separate configuration for each instance group (master,
  /// core, and task).
  final List<Configuration> configurations;

  /// EBS configurations that will be attached to each EC2 instance in the
  /// instance group.
  final EbsConfiguration ebsConfiguration;

  /// An automatic scaling policy for a core instance group or task instance
  /// group in an Amazon EMR cluster. The automatic scaling policy defines how
  /// an instance group dynamically adds and terminates EC2 instances in
  /// response to the value of a CloudWatch metric. See PutAutoScalingPolicy.
  final AutoScalingPolicy autoScalingPolicy;

  InstanceGroupConfig({
    this.name,
    this.market,
    @required this.instanceRole,
    this.bidPrice,
    @required this.instanceType,
    @required this.instanceCount,
    this.configurations,
    this.ebsConfiguration,
    this.autoScalingPolicy,
  });
}

/// Detailed information about an instance group.
class InstanceGroupDetail {
  /// Unique identifier for the instance group.
  final String instanceGroupId;

  /// Friendly name for the instance group.
  final String name;

  /// Market type of the EC2 instances used to create a cluster node.
  final String market;

  /// Instance group role in the cluster
  final String instanceRole;

  /// The maximum Spot price your are willing to pay for EC2 instances.
  ///
  /// An optional, nullable field that applies if the `MarketType` for the
  /// instance group is specified as `SPOT`. Specified in USD. If the value is
  /// NULL and `SPOT` is specified, the maximum Spot price is set equal to the
  /// On-Demand price.
  final String bidPrice;

  /// EC2 instance type.
  final String instanceType;

  /// Target number of instances to run in the instance group.
  final int instanceRequestCount;

  /// Actual count of running instances.
  final int instanceRunningCount;

  /// State of instance group. The following values are deprecated: STARTING,
  /// TERMINATED, and FAILED.
  final String state;

  /// Details regarding the state of the instance group.
  final String lastStateChangeReason;

  /// The date/time the instance group was created.
  final DateTime creationDateTime;

  /// The date/time the instance group was started.
  final DateTime startDateTime;

  /// The date/time the instance group was available to the cluster.
  final DateTime readyDateTime;

  /// The date/time the instance group was terminated.
  final DateTime endDateTime;

  InstanceGroupDetail({
    this.instanceGroupId,
    this.name,
    @required this.market,
    @required this.instanceRole,
    this.bidPrice,
    @required this.instanceType,
    @required this.instanceRequestCount,
    @required this.instanceRunningCount,
    @required this.state,
    this.lastStateChangeReason,
    @required this.creationDateTime,
    this.startDateTime,
    this.readyDateTime,
    this.endDateTime,
  });
  static InstanceGroupDetail fromJson(Map<String, dynamic> json) =>
      InstanceGroupDetail();
}

/// Modify the size or configurations of an instance group.
class InstanceGroupModifyConfig {
  /// Unique ID of the instance group to expand or shrink.
  final String instanceGroupId;

  /// Target size for the instance group.
  final int instanceCount;

  /// The EC2 InstanceIds to terminate. After you terminate the instances, the
  /// instance group will not return to its original requested size.
  final List<String> ec2InstanceIdsToTerminate;

  /// Policy for customizing shrink operations.
  final ShrinkPolicy shrinkPolicy;

  /// A list of new or modified configurations to apply for an instance group.
  final List<Configuration> configurations;

  InstanceGroupModifyConfig({
    @required this.instanceGroupId,
    this.instanceCount,
    this.ec2InstanceIdsToTerminate,
    this.shrinkPolicy,
    this.configurations,
  });
}

/// The status change reason details for the instance group.
class InstanceGroupStateChangeReason {
  /// The programmable code for the state change reason.
  final String code;

  /// The status change reason description.
  final String message;

  InstanceGroupStateChangeReason({
    this.code,
    this.message,
  });
  static InstanceGroupStateChangeReason fromJson(Map<String, dynamic> json) =>
      InstanceGroupStateChangeReason();
}

/// The details of the instance group status.
class InstanceGroupStatus {
  /// The current state of the instance group.
  final String state;

  /// The status change reason details for the instance group.
  final InstanceGroupStateChangeReason stateChangeReason;

  /// The timeline of the instance group status over time.
  final InstanceGroupTimeline timeline;

  InstanceGroupStatus({
    this.state,
    this.stateChangeReason,
    this.timeline,
  });
  static InstanceGroupStatus fromJson(Map<String, dynamic> json) =>
      InstanceGroupStatus();
}

/// The timeline of the instance group lifecycle.
class InstanceGroupTimeline {
  /// The creation date and time of the instance group.
  final DateTime creationDateTime;

  /// The date and time when the instance group became ready to perform tasks.
  final DateTime readyDateTime;

  /// The date and time when the instance group terminated.
  final DateTime endDateTime;

  InstanceGroupTimeline({
    this.creationDateTime,
    this.readyDateTime,
    this.endDateTime,
  });
  static InstanceGroupTimeline fromJson(Map<String, dynamic> json) =>
      InstanceGroupTimeline();
}

/// Custom policy for requesting termination protection or termination of
/// specific instances when shrinking an instance group.
class InstanceResizePolicy {
  /// Specific list of instances to be terminated when shrinking an instance
  /// group.
  final List<String> instancesToTerminate;

  /// Specific list of instances to be protected when shrinking an instance
  /// group.
  final List<String> instancesToProtect;

  /// Decommissioning timeout override for the specific list of instances to be
  /// terminated.
  final int instanceTerminationTimeout;

  InstanceResizePolicy({
    this.instancesToTerminate,
    this.instancesToProtect,
    this.instanceTerminationTimeout,
  });
  static InstanceResizePolicy fromJson(Map<String, dynamic> json) =>
      InstanceResizePolicy();
}

/// The details of the status change reason for the instance.
class InstanceStateChangeReason {
  /// The programmable code for the state change reason.
  final String code;

  /// The status change reason description.
  final String message;

  InstanceStateChangeReason({
    this.code,
    this.message,
  });
  static InstanceStateChangeReason fromJson(Map<String, dynamic> json) =>
      InstanceStateChangeReason();
}

/// The instance status details.
class InstanceStatus {
  /// The current state of the instance.
  final String state;

  /// The details of the status change reason for the instance.
  final InstanceStateChangeReason stateChangeReason;

  /// The timeline of the instance status over time.
  final InstanceTimeline timeline;

  InstanceStatus({
    this.state,
    this.stateChangeReason,
    this.timeline,
  });
  static InstanceStatus fromJson(Map<String, dynamic> json) => InstanceStatus();
}

/// The timeline of the instance lifecycle.
class InstanceTimeline {
  /// The creation date and time of the instance.
  final DateTime creationDateTime;

  /// The date and time when the instance was ready to perform tasks.
  final DateTime readyDateTime;

  /// The date and time when the instance was terminated.
  final DateTime endDateTime;

  InstanceTimeline({
    this.creationDateTime,
    this.readyDateTime,
    this.endDateTime,
  });
  static InstanceTimeline fromJson(Map<String, dynamic> json) =>
      InstanceTimeline();
}

/// An instance type configuration for each instance type in an instance fleet,
/// which determines the EC2 instances Amazon EMR attempts to provision to
/// fulfill On-Demand and Spot target capacities. There can be a maximum of 5
/// instance type configurations in a fleet.
///
///
///
/// The instance fleet configuration is available only in Amazon EMR versions
/// 4.8.0 and later, excluding 5.0.x versions.
class InstanceTypeConfig {
  /// An EC2 instance type, such as `m3.xlarge`.
  final String instanceType;

  /// The number of units that a provisioned instance of this type provides
  /// toward fulfilling the target capacities defined in InstanceFleetConfig.
  /// This value is 1 for a master instance fleet, and must be 1 or greater for
  /// core and task instance fleets. Defaults to 1 if not specified.
  final int weightedCapacity;

  /// The bid price for each EC2 Spot instance type as defined by
  /// `InstanceType`. Expressed in USD. If neither `BidPrice` nor
  /// `BidPriceAsPercentageOfOnDemandPrice` is provided,
  /// `BidPriceAsPercentageOfOnDemandPrice` defaults to 100%.
  final String bidPrice;

  /// The bid price, as a percentage of On-Demand price, for each EC2 Spot
  /// instance as defined by `InstanceType`. Expressed as a number (for example,
  /// 20 specifies 20%). If neither `BidPrice` nor
  /// `BidPriceAsPercentageOfOnDemandPrice` is provided,
  /// `BidPriceAsPercentageOfOnDemandPrice` defaults to 100%.
  final double bidPriceAsPercentageOfOnDemandPrice;

  /// The configuration of Amazon Elastic Block Storage (EBS) attached to each
  /// instance as defined by `InstanceType`.
  final EbsConfiguration ebsConfiguration;

  /// A configuration classification that applies when provisioning cluster
  /// instances, which can include configurations for applications and software
  /// that run on the cluster.
  final List<Configuration> configurations;

  InstanceTypeConfig({
    @required this.instanceType,
    this.weightedCapacity,
    this.bidPrice,
    this.bidPriceAsPercentageOfOnDemandPrice,
    this.ebsConfiguration,
    this.configurations,
  });
}

/// The configuration specification for each instance type in an instance fleet.
///
///
///
/// The instance fleet configuration is available only in Amazon EMR versions
/// 4.8.0 and later, excluding 5.0.x versions.
class InstanceTypeSpecification {
  /// The EC2 instance type, for example `m3.xlarge`.
  final String instanceType;

  /// The number of units that a provisioned instance of this type provides
  /// toward fulfilling the target capacities defined in InstanceFleetConfig.
  /// Capacity values represent performance characteristics such as vCPUs,
  /// memory, or I/O. If not specified, the default value is 1.
  final int weightedCapacity;

  /// The bid price for each EC2 Spot instance type as defined by
  /// `InstanceType`. Expressed in USD.
  final String bidPrice;

  /// The bid price, as a percentage of On-Demand price, for each EC2 Spot
  /// instance as defined by `InstanceType`. Expressed as a number (for example,
  /// 20 specifies 20%).
  final double bidPriceAsPercentageOfOnDemandPrice;

  /// A configuration classification that applies when provisioning cluster
  /// instances, which can include configurations for applications and software
  /// bundled with Amazon EMR.
  final List<Configuration> configurations;

  /// The configuration of Amazon Elastic Block Storage (EBS) attached to each
  /// instance as defined by `InstanceType`.
  final List<EbsBlockDevice> ebsBlockDevices;

  /// Evaluates to `TRUE` when the specified `InstanceType` is EBS-optimized.
  final bool ebsOptimized;

  InstanceTypeSpecification({
    this.instanceType,
    this.weightedCapacity,
    this.bidPrice,
    this.bidPriceAsPercentageOfOnDemandPrice,
    this.configurations,
    this.ebsBlockDevices,
    this.ebsOptimized,
  });
  static InstanceTypeSpecification fromJson(Map<String, dynamic> json) =>
      InstanceTypeSpecification();
}

/// A description of a cluster (job flow).
class JobFlowDetail {
  /// The job flow identifier.
  final String jobFlowId;

  /// The name of the job flow.
  final String name;

  /// The location in Amazon S3 where log files for the job are stored.
  final String logUri;

  /// Applies only to Amazon EMR AMI versions 3.x and 2.x. For Amazon EMR
  /// releases 4.0 and later, `ReleaseLabel` is used. To specify a custom AMI,
  /// use `CustomAmiID`.
  final String amiVersion;

  /// Describes the execution status of the job flow.
  final JobFlowExecutionStatusDetail executionStatusDetail;

  /// Describes the Amazon EC2 instances of the job flow.
  final JobFlowInstancesDetail instances;

  /// A list of steps run by the job flow.
  final List<StepDetail> steps;

  /// A list of the bootstrap actions run by the job flow.
  final List<BootstrapActionDetail> bootstrapActions;

  /// A list of strings set by third party software when the job flow is
  /// launched. If you are not using third party software to manage the job flow
  /// this value is empty.
  final List<String> supportedProducts;

  ///  _This member will be deprecated._
  ///
  /// Specifies whether the cluster is visible to all IAM users of the AWS
  /// account associated with the cluster. If this value is set to `true`, all
  /// IAM users of that AWS account can view and (if they have the proper policy
  /// permissions set) manage the cluster. If it is set to `false`, only the IAM
  /// user that created the cluster can view and manage it. This value can be
  /// changed using the SetVisibleToAllUsers action.
  final bool visibleToAllUsers;

  /// The IAM role that was specified when the job flow was launched. The EC2
  /// instances of the job flow assume this role.
  final String jobFlowRole;

  /// The IAM role that will be assumed by the Amazon EMR service to access AWS
  /// resources on your behalf.
  final String serviceRole;

  /// An IAM role for automatic scaling policies. The default role is
  /// `EMR_AutoScaling_DefaultRole`. The IAM role provides a way for the
  /// automatic scaling feature to get the required permissions it needs to
  /// launch and terminate EC2 instances in an instance group.
  final String autoScalingRole;

  /// The way that individual Amazon EC2 instances terminate when an automatic
  /// scale-in activity occurs or an instance group is resized.
  /// `TERMINATE_AT_INSTANCE_HOUR` indicates that Amazon EMR terminates nodes at
  /// the instance-hour boundary, regardless of when the request to terminate
  /// the instance was submitted. This option is only available with Amazon EMR
  /// 5.1.0 and later and is the default for clusters created using that
  /// version. `TERMINATE_AT_TASK_COMPLETION` indicates that Amazon EMR
  /// blacklists and drains tasks from nodes before terminating the Amazon EC2
  /// instances, regardless of the instance-hour boundary. With either behavior,
  /// Amazon EMR removes the least active nodes first and blocks instance
  /// termination if it could lead to HDFS corruption.
  /// `TERMINATE_AT_TASK_COMPLETION` available only in Amazon EMR version 4.1.0
  /// and later, and is the default for versions of Amazon EMR earlier than
  /// 5.1.0.
  final String scaleDownBehavior;

  JobFlowDetail({
    @required this.jobFlowId,
    @required this.name,
    this.logUri,
    this.amiVersion,
    @required this.executionStatusDetail,
    @required this.instances,
    this.steps,
    this.bootstrapActions,
    this.supportedProducts,
    this.visibleToAllUsers,
    this.jobFlowRole,
    this.serviceRole,
    this.autoScalingRole,
    this.scaleDownBehavior,
  });
  static JobFlowDetail fromJson(Map<String, dynamic> json) => JobFlowDetail();
}

/// Describes the status of the cluster (job flow).
class JobFlowExecutionStatusDetail {
  /// The state of the job flow.
  final String state;

  /// The creation date and time of the job flow.
  final DateTime creationDateTime;

  /// The start date and time of the job flow.
  final DateTime startDateTime;

  /// The date and time when the job flow was ready to start running bootstrap
  /// actions.
  final DateTime readyDateTime;

  /// The completion date and time of the job flow.
  final DateTime endDateTime;

  /// Description of the job flow last changed state.
  final String lastStateChangeReason;

  JobFlowExecutionStatusDetail({
    @required this.state,
    @required this.creationDateTime,
    this.startDateTime,
    this.readyDateTime,
    this.endDateTime,
    this.lastStateChangeReason,
  });
  static JobFlowExecutionStatusDetail fromJson(Map<String, dynamic> json) =>
      JobFlowExecutionStatusDetail();
}

/// A description of the Amazon EC2 instance on which the cluster (job flow)
/// runs. A valid JobFlowInstancesConfig must contain either InstanceGroups or
/// InstanceFleets, which is the recommended configuration. They cannot be used
/// together. You may also have MasterInstanceType, SlaveInstanceType, and
/// InstanceCount (all three must be present), but we don't recommend this
/// configuration.
class JobFlowInstancesConfig {
  /// The EC2 instance type of the master node.
  final String masterInstanceType;

  /// The EC2 instance type of the core and task nodes.
  final String slaveInstanceType;

  /// The number of EC2 instances in the cluster.
  final int instanceCount;

  /// Configuration for the instance groups in a cluster.
  final List<InstanceGroupConfig> instanceGroups;

  /// The instance fleet configuration is available only in Amazon EMR versions
  /// 4.8.0 and later, excluding 5.0.x versions.
  ///
  /// Describes the EC2 instances and instance configurations for clusters that
  /// use the instance fleet configuration.
  final List<InstanceFleetConfig> instanceFleets;

  /// The name of the EC2 key pair that can be used to ssh to the master node as
  /// the user called "hadoop."
  final String ec2KeyName;

  /// The Availability Zone in which the cluster runs.
  final PlacementType placement;

  /// Specifies whether the cluster should remain available after completing all
  /// steps.
  final bool keepJobFlowAliveWhenNoSteps;

  /// Specifies whether to lock the cluster to prevent the Amazon EC2 instances
  /// from being terminated by API call, user intervention, or in the event of a
  /// job-flow error.
  final bool terminationProtected;

  /// Applies only to Amazon EMR release versions earlier than 4.0. The Hadoop
  /// version for the cluster. Valid inputs are "0.18" (deprecated), "0.20"
  /// (deprecated), "0.20.205" (deprecated), "1.0.3", "2.2.0", or "2.4.0". If
  /// you do not set this value, the default of 0.18 is used, unless the
  /// `AmiVersion` parameter is set in the RunJobFlow call, in which case the
  /// default version of Hadoop for that AMI version is used.
  final String hadoopVersion;

  /// Applies to clusters that use the uniform instance group configuration. To
  /// launch the cluster in Amazon Virtual Private Cloud (Amazon VPC), set this
  /// parameter to the identifier of the Amazon VPC subnet where you want the
  /// cluster to launch. If you do not specify this value and your account
  /// supports EC2-Classic, the cluster launches in EC2-Classic.
  final String ec2SubnetId;

  /// Applies to clusters that use the instance fleet configuration. When
  /// multiple EC2 subnet IDs are specified, Amazon EMR evaluates them and
  /// launches instances in the optimal subnet.
  ///
  ///
  ///
  /// The instance fleet configuration is available only in Amazon EMR versions
  /// 4.8.0 and later, excluding 5.0.x versions.
  final List<String> ec2SubnetIds;

  /// The identifier of the Amazon EC2 security group for the master node.
  final String emrManagedMasterSecurityGroup;

  /// The identifier of the Amazon EC2 security group for the core and task
  /// nodes.
  final String emrManagedSlaveSecurityGroup;

  /// The identifier of the Amazon EC2 security group for the Amazon EMR service
  /// to access clusters in VPC private subnets.
  final String serviceAccessSecurityGroup;

  /// A list of additional Amazon EC2 security group IDs for the master node.
  final List<String> additionalMasterSecurityGroups;

  /// A list of additional Amazon EC2 security group IDs for the core and task
  /// nodes.
  final List<String> additionalSlaveSecurityGroups;

  JobFlowInstancesConfig({
    this.masterInstanceType,
    this.slaveInstanceType,
    this.instanceCount,
    this.instanceGroups,
    this.instanceFleets,
    this.ec2KeyName,
    this.placement,
    this.keepJobFlowAliveWhenNoSteps,
    this.terminationProtected,
    this.hadoopVersion,
    this.ec2SubnetId,
    this.ec2SubnetIds,
    this.emrManagedMasterSecurityGroup,
    this.emrManagedSlaveSecurityGroup,
    this.serviceAccessSecurityGroup,
    this.additionalMasterSecurityGroups,
    this.additionalSlaveSecurityGroups,
  });
}

/// Specify the type of Amazon EC2 instances that the cluster (job flow) runs
/// on.
class JobFlowInstancesDetail {
  /// The Amazon EC2 master node instance type.
  final String masterInstanceType;

  /// The DNS name of the master node. If the cluster is on a private subnet,
  /// this is the private DNS name. On a public subnet, this is the public DNS
  /// name.
  final String masterPublicDnsName;

  /// The Amazon EC2 instance identifier of the master node.
  final String masterInstanceId;

  /// The Amazon EC2 core and task node instance type.
  final String slaveInstanceType;

  /// The number of Amazon EC2 instances in the cluster. If the value is 1, the
  /// same instance serves as both the master and core and task node. If the
  /// value is greater than 1, one instance is the master node and all others
  /// are core and task nodes.
  final int instanceCount;

  /// Details about the instance groups in a cluster.
  final List<InstanceGroupDetail> instanceGroups;

  /// An approximation of the cost of the cluster, represented in
  /// m1.small/hours. This value is incremented one time for every hour that an
  /// m1.small runs. Larger instances are weighted more, so an Amazon EC2
  /// instance that is roughly four times more expensive would result in the
  /// normalized instance hours being incremented by four. This result is only
  /// an approximation and does not reflect the actual billing rate.
  final int normalizedInstanceHours;

  /// The name of an Amazon EC2 key pair that can be used to ssh to the master
  /// node.
  final String ec2KeyName;

  /// For clusters launched within Amazon Virtual Private Cloud, this is the
  /// identifier of the subnet where the cluster was launched.
  final String ec2SubnetId;

  /// The Amazon EC2 Availability Zone for the cluster.
  final PlacementType placement;

  /// Specifies whether the cluster should remain available after completing all
  /// steps.
  final bool keepJobFlowAliveWhenNoSteps;

  /// Specifies whether the Amazon EC2 instances in the cluster are protected
  /// from termination by API calls, user intervention, or in the event of a
  /// job-flow error.
  final bool terminationProtected;

  /// The Hadoop version for the cluster.
  final String hadoopVersion;

  JobFlowInstancesDetail({
    @required this.masterInstanceType,
    this.masterPublicDnsName,
    this.masterInstanceId,
    @required this.slaveInstanceType,
    @required this.instanceCount,
    this.instanceGroups,
    this.normalizedInstanceHours,
    this.ec2KeyName,
    this.ec2SubnetId,
    this.placement,
    this.keepJobFlowAliveWhenNoSteps,
    this.terminationProtected,
    this.hadoopVersion,
  });
  static JobFlowInstancesDetail fromJson(Map<String, dynamic> json) =>
      JobFlowInstancesDetail();
}

/// Attributes for Kerberos configuration when Kerberos authentication is
/// enabled using a security configuration. For more information see
/// [Use Kerberos Authentication](https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-kerberos.html)
/// in the _EMR Management Guide_.
class KerberosAttributes {
  /// The name of the Kerberos realm to which all nodes in a cluster belong. For
  /// example, `EC2.INTERNAL`.
  final String realm;

  /// The password used within the cluster for the kadmin service on the
  /// cluster-dedicated KDC, which maintains Kerberos principals, password
  /// policies, and keytabs for the cluster.
  final String kdcAdminPassword;

  /// Required only when establishing a cross-realm trust with a KDC in a
  /// different realm. The cross-realm principal password, which must be
  /// identical across realms.
  final String crossRealmTrustPrincipalPassword;

  /// Required only when establishing a cross-realm trust with an Active
  /// Directory domain. A user with sufficient privileges to join resources to
  /// the domain.
  final String adDomainJoinUser;

  /// The Active Directory password for `ADDomainJoinUser`.
  final String adDomainJoinPassword;

  KerberosAttributes({
    @required this.realm,
    @required this.kdcAdminPassword,
    this.crossRealmTrustPrincipalPassword,
    this.adDomainJoinUser,
    this.adDomainJoinPassword,
  });
  static KerberosAttributes fromJson(Map<String, dynamic> json) =>
      KerberosAttributes();
}

/// A key value pair.
class KeyValue {
  /// The unique identifier of a key value pair.
  final String key;

  /// The value part of the identified key.
  final String value;

  KeyValue({
    this.key,
    this.value,
  });
  static KeyValue fromJson(Map<String, dynamic> json) => KeyValue();
}

/// This output contains the bootstrap actions detail.
class ListBootstrapActionsOutput {
  /// The bootstrap actions associated with the cluster.
  final List<Command> bootstrapActions;

  /// The pagination token that indicates the next set of results to retrieve.
  final String marker;

  ListBootstrapActionsOutput({
    this.bootstrapActions,
    this.marker,
  });
  static ListBootstrapActionsOutput fromJson(Map<String, dynamic> json) =>
      ListBootstrapActionsOutput();
}

/// This contains a ClusterSummaryList with the cluster details; for example,
/// the cluster IDs, names, and status.
class ListClustersOutput {
  /// The list of clusters for the account based on the given filters.
  final List<ClusterSummary> clusters;

  /// The pagination token that indicates the next set of results to retrieve.
  final String marker;

  ListClustersOutput({
    this.clusters,
    this.marker,
  });
  static ListClustersOutput fromJson(Map<String, dynamic> json) =>
      ListClustersOutput();
}

class ListInstanceFleetsOutput {
  /// The list of instance fleets for the cluster and given filters.
  final List<InstanceFleet> instanceFleets;

  /// The pagination token that indicates the next set of results to retrieve.
  final String marker;

  ListInstanceFleetsOutput({
    this.instanceFleets,
    this.marker,
  });
  static ListInstanceFleetsOutput fromJson(Map<String, dynamic> json) =>
      ListInstanceFleetsOutput();
}

/// This input determines which instance groups to retrieve.
class ListInstanceGroupsOutput {
  /// The list of instance groups for the cluster and given filters.
  final List<InstanceGroup> instanceGroups;

  /// The pagination token that indicates the next set of results to retrieve.
  final String marker;

  ListInstanceGroupsOutput({
    this.instanceGroups,
    this.marker,
  });
  static ListInstanceGroupsOutput fromJson(Map<String, dynamic> json) =>
      ListInstanceGroupsOutput();
}

/// This output contains the list of instances.
class ListInstancesOutput {
  /// The list of instances for the cluster and given filters.
  final List<Instance> instances;

  /// The pagination token that indicates the next set of results to retrieve.
  final String marker;

  ListInstancesOutput({
    this.instances,
    this.marker,
  });
  static ListInstancesOutput fromJson(Map<String, dynamic> json) =>
      ListInstancesOutput();
}

class ListSecurityConfigurationsOutput {
  /// The creation date and time, and name, of each security configuration.
  final List<SecurityConfigurationSummary> securityConfigurations;

  /// A pagination token that indicates the next set of results to retrieve.
  /// Include the marker in the next ListSecurityConfiguration call to retrieve
  /// the next page of results, if required.
  final String marker;

  ListSecurityConfigurationsOutput({
    this.securityConfigurations,
    this.marker,
  });
  static ListSecurityConfigurationsOutput fromJson(Map<String, dynamic> json) =>
      ListSecurityConfigurationsOutput();
}

/// This output contains the list of steps returned in reverse order. This means
/// that the last step is the first element in the list.
class ListStepsOutput {
  /// The filtered list of steps for the cluster.
  final List<StepSummary> steps;

  /// The pagination token that indicates the next set of results to retrieve.
  final String marker;

  ListStepsOutput({
    this.steps,
    this.marker,
  });
  static ListStepsOutput fromJson(Map<String, dynamic> json) =>
      ListStepsOutput();
}

/// A CloudWatch dimension, which is specified using a `Key` (known as a `Name`
/// in CloudWatch), `Value` pair. By default, Amazon EMR uses one dimension
/// whose `Key` is `JobFlowID` and `Value` is a variable representing the
/// cluster ID, which is `${emr.clusterId}`. This enables the rule to bootstrap
/// when the cluster ID becomes available.
class MetricDimension {
  /// The dimension name.
  final String key;

  /// The dimension value.
  final String value;

  MetricDimension({
    this.key,
    this.value,
  });
  static MetricDimension fromJson(Map<String, dynamic> json) =>
      MetricDimension();
}

/// The Amazon EC2 Availability Zone configuration of the cluster (job flow).
class PlacementType {
  /// The Amazon EC2 Availability Zone for the cluster. `AvailabilityZone` is
  /// used for uniform instance groups, while `AvailabilityZones` (plural) is
  /// used for instance fleets.
  final String availabilityZone;

  /// When multiple Availability Zones are specified, Amazon EMR evaluates them
  /// and launches instances in the optimal Availability Zone.
  /// `AvailabilityZones` is used for instance fleets, while `AvailabilityZone`
  /// (singular) is used for uniform instance groups.
  ///
  ///
  ///
  /// The instance fleet configuration is available only in Amazon EMR versions
  /// 4.8.0 and later, excluding 5.0.x versions.
  final List<String> availabilityZones;

  PlacementType({
    this.availabilityZone,
    this.availabilityZones,
  });
  static PlacementType fromJson(Map<String, dynamic> json) => PlacementType();
}

/// A list of port ranges that are permitted to allow inbound traffic from all
/// public IP addresses. To specify a single port, use the same value for
/// `MinRange` and `MaxRange`.
class PortRange {
  /// The smallest port number in a specified range of port numbers.
  final int minRange;

  /// The smallest port number in a specified range of port numbers.
  final int maxRange;

  PortRange({
    @required this.minRange,
    this.maxRange,
  });
  static PortRange fromJson(Map<String, dynamic> json) => PortRange();
}

class PutAutoScalingPolicyOutput {
  /// Specifies the ID of a cluster. The instance group to which the automatic
  /// scaling policy is applied is within this cluster.
  final String clusterId;

  /// Specifies the ID of the instance group to which the scaling policy is
  /// applied.
  final String instanceGroupId;

  /// The automatic scaling policy definition.
  final AutoScalingPolicyDescription autoScalingPolicy;

  PutAutoScalingPolicyOutput({
    this.clusterId,
    this.instanceGroupId,
    this.autoScalingPolicy,
  });
  static PutAutoScalingPolicyOutput fromJson(Map<String, dynamic> json) =>
      PutAutoScalingPolicyOutput();
}

class PutBlockPublicAccessConfigurationOutput {
  PutBlockPublicAccessConfigurationOutput();
  static PutBlockPublicAccessConfigurationOutput fromJson(
          Map<String, dynamic> json) =>
      PutBlockPublicAccessConfigurationOutput();
}

class RemoveAutoScalingPolicyOutput {
  RemoveAutoScalingPolicyOutput();
  static RemoveAutoScalingPolicyOutput fromJson(Map<String, dynamic> json) =>
      RemoveAutoScalingPolicyOutput();
}

/// This output indicates the result of removing tags from a resource.
class RemoveTagsOutput {
  RemoveTagsOutput();
  static RemoveTagsOutput fromJson(Map<String, dynamic> json) =>
      RemoveTagsOutput();
}

///  The result of the RunJobFlow operation.
class RunJobFlowOutput {
  /// An unique identifier for the job flow.
  final String jobFlowId;

  RunJobFlowOutput({
    this.jobFlowId,
  });
  static RunJobFlowOutput fromJson(Map<String, dynamic> json) =>
      RunJobFlowOutput();
}

/// The type of adjustment the automatic scaling activity makes when triggered,
/// and the periodicity of the adjustment.
class ScalingAction {
  /// Not available for instance groups. Instance groups use the market type
  /// specified for the group.
  final String market;

  /// The type of adjustment the automatic scaling activity makes when
  /// triggered, and the periodicity of the adjustment.
  final SimpleScalingPolicyConfiguration simpleScalingPolicyConfiguration;

  ScalingAction({
    this.market,
    @required this.simpleScalingPolicyConfiguration,
  });
  static ScalingAction fromJson(Map<String, dynamic> json) => ScalingAction();
}

/// The upper and lower EC2 instance limits for an automatic scaling policy.
/// Automatic scaling activities triggered by automatic scaling rules will not
/// cause an instance group to grow above or below these limits.
class ScalingConstraints {
  /// The lower boundary of EC2 instances in an instance group below which
  /// scaling activities are not allowed to shrink. Scale-in activities will not
  /// terminate instances below this boundary.
  final int minCapacity;

  /// The upper boundary of EC2 instances in an instance group beyond which
  /// scaling activities are not allowed to grow. Scale-out activities will not
  /// add instances beyond this boundary.
  final int maxCapacity;

  ScalingConstraints({
    @required this.minCapacity,
    @required this.maxCapacity,
  });
  static ScalingConstraints fromJson(Map<String, dynamic> json) =>
      ScalingConstraints();
}

/// A scale-in or scale-out rule that defines scaling activity, including the
/// CloudWatch metric alarm that triggers activity, how EC2 instances are added
/// or removed, and the periodicity of adjustments. The automatic scaling policy
/// for an instance group can comprise one or more automatic scaling rules.
class ScalingRule {
  /// The name used to identify an automatic scaling rule. Rule names must be
  /// unique within a scaling policy.
  final String name;

  /// A friendly, more verbose description of the automatic scaling rule.
  final String description;

  /// The conditions that trigger an automatic scaling activity.
  final ScalingAction action;

  /// The CloudWatch alarm definition that determines when automatic scaling
  /// activity is triggered.
  final ScalingTrigger trigger;

  ScalingRule({
    @required this.name,
    this.description,
    @required this.action,
    @required this.trigger,
  });
  static ScalingRule fromJson(Map<String, dynamic> json) => ScalingRule();
}

/// The conditions that trigger an automatic scaling activity.
class ScalingTrigger {
  /// The definition of a CloudWatch metric alarm. When the defined alarm
  /// conditions are met along with other trigger parameters, scaling activity
  /// begins.
  final CloudWatchAlarmDefinition cloudWatchAlarmDefinition;

  ScalingTrigger({
    @required this.cloudWatchAlarmDefinition,
  });
  static ScalingTrigger fromJson(Map<String, dynamic> json) => ScalingTrigger();
}

/// Configuration of the script to run during a bootstrap action.
class ScriptBootstrapActionConfig {
  /// Location of the script to run during a bootstrap action. Can be either a
  /// location in Amazon S3 or on a local file system.
  final String path;

  /// A list of command line arguments to pass to the bootstrap action script.
  final List<String> args;

  ScriptBootstrapActionConfig({
    @required this.path,
    this.args,
  });
  static ScriptBootstrapActionConfig fromJson(Map<String, dynamic> json) =>
      ScriptBootstrapActionConfig();
}

/// The creation date and time, and name, of a security configuration.
class SecurityConfigurationSummary {
  /// The name of the security configuration.
  final String name;

  /// The date and time the security configuration was created.
  final DateTime creationDateTime;

  SecurityConfigurationSummary({
    this.name,
    this.creationDateTime,
  });
  static SecurityConfigurationSummary fromJson(Map<String, dynamic> json) =>
      SecurityConfigurationSummary();
}

/// Policy for customizing shrink operations. Allows configuration of
/// decommissioning timeout and targeted instance shrinking.
class ShrinkPolicy {
  /// The desired timeout for decommissioning an instance. Overrides the default
  /// YARN decommissioning timeout.
  final int decommissionTimeout;

  /// Custom policy for requesting termination protection or termination of
  /// specific instances when shrinking an instance group.
  final InstanceResizePolicy instanceResizePolicy;

  ShrinkPolicy({
    this.decommissionTimeout,
    this.instanceResizePolicy,
  });
  static ShrinkPolicy fromJson(Map<String, dynamic> json) => ShrinkPolicy();
}

/// An automatic scaling configuration, which describes how the policy adds or
/// removes instances, the cooldown period, and the number of EC2 instances that
/// will be added each time the CloudWatch metric alarm condition is satisfied.
class SimpleScalingPolicyConfiguration {
  /// The way in which EC2 instances are added (if `ScalingAdjustment` is a
  /// positive number) or terminated (if `ScalingAdjustment` is a negative
  /// number) each time the scaling activity is triggered. `CHANGE_IN_CAPACITY`
  /// is the default. `CHANGE_IN_CAPACITY` indicates that the EC2 instance count
  /// increments or decrements by `ScalingAdjustment`, which should be expressed
  /// as an integer. `PERCENT_CHANGE_IN_CAPACITY` indicates the instance count
  /// increments or decrements by the percentage specified by
  /// `ScalingAdjustment`, which should be expressed as an integer. For example,
  /// 20 indicates an increase in 20% increments of cluster capacity.
  /// `EXACT_CAPACITY` indicates the scaling activity results in an instance
  /// group with the number of EC2 instances specified by `ScalingAdjustment`,
  /// which should be expressed as a positive integer.
  final String adjustmentType;

  /// The amount by which to scale in or scale out, based on the specified
  /// `AdjustmentType`. A positive value adds to the instance group's EC2
  /// instance count while a negative number removes instances. If
  /// `AdjustmentType` is set to `EXACT_CAPACITY`, the number should only be a
  /// positive integer. If `AdjustmentType` is set to
  /// `PERCENT_CHANGE_IN_CAPACITY`, the value should express the percentage as
  /// an integer. For example, -20 indicates a decrease in 20% increments of
  /// cluster capacity.
  final int scalingAdjustment;

  /// The amount of time, in seconds, after a scaling activity completes before
  /// any further trigger-related scaling activities can start. The default
  /// value is 0.
  final int coolDown;

  SimpleScalingPolicyConfiguration({
    this.adjustmentType,
    @required this.scalingAdjustment,
    this.coolDown,
  });
  static SimpleScalingPolicyConfiguration fromJson(Map<String, dynamic> json) =>
      SimpleScalingPolicyConfiguration();
}

/// The launch specification for Spot instances in the instance fleet, which
/// determines the defined duration and provisioning timeout behavior.
///
///
///
/// The instance fleet configuration is available only in Amazon EMR versions
/// 4.8.0 and later, excluding 5.0.x versions.
class SpotProvisioningSpecification {
  /// The spot provisioning timeout period in minutes. If Spot instances are not
  /// provisioned within this time period, the `TimeOutAction` is taken. Minimum
  /// value is 5 and maximum value is 1440. The timeout applies only during
  /// initial provisioning, when the cluster is first created.
  final int timeoutDurationMinutes;

  /// The action to take when `TargetSpotCapacity` has not been fulfilled when
  /// the `TimeoutDurationMinutes` has expired; that is, when all Spot instances
  /// could not be provisioned within the Spot provisioning timeout. Valid
  /// values are `TERMINATE_CLUSTER` and `SWITCH_TO_ON_DEMAND`.
  /// SWITCH_TO_ON_DEMAND specifies that if no Spot instances are available,
  /// On-Demand Instances should be provisioned to fulfill any remaining Spot
  /// capacity.
  final String timeoutAction;

  /// The defined duration for Spot instances (also known as Spot blocks) in
  /// minutes. When specified, the Spot instance does not terminate before the
  /// defined duration expires, and defined duration pricing for Spot instances
  /// applies. Valid values are 60, 120, 180, 240, 300, or 360. The duration
  /// period starts as soon as a Spot instance receives its instance ID. At the
  /// end of the duration, Amazon EC2 marks the Spot instance for termination
  /// and provides a Spot instance termination notice, which gives the instance
  /// a two-minute warning before it terminates.
  final int blockDurationMinutes;

  SpotProvisioningSpecification({
    @required this.timeoutDurationMinutes,
    @required this.timeoutAction,
    this.blockDurationMinutes,
  });
  static SpotProvisioningSpecification fromJson(Map<String, dynamic> json) =>
      SpotProvisioningSpecification();
}

/// This represents a step in a cluster.
class Step {
  /// The identifier of the cluster step.
  final String id;

  /// The name of the cluster step.
  final String name;

  /// The Hadoop job configuration of the cluster step.
  final HadoopStepConfig config;

  /// The action to take when the cluster step fails. Possible values are
  /// TERMINATE_CLUSTER, CANCEL_AND_WAIT, and CONTINUE. TERMINATE_JOB_FLOW is
  /// provided for backward compatibility. We recommend using TERMINATE_CLUSTER
  /// instead.
  final String actionOnFailure;

  /// The current execution status details of the cluster step.
  final StepStatus status;

  Step({
    this.id,
    this.name,
    this.config,
    this.actionOnFailure,
    this.status,
  });
  static Step fromJson(Map<String, dynamic> json) => Step();
}

/// Specification of a cluster (job flow) step.
class StepConfig {
  /// The name of the step.
  final String name;

  /// The action to take when the cluster step fails. Possible values are
  /// TERMINATE_CLUSTER, CANCEL_AND_WAIT, and CONTINUE. TERMINATE_JOB_FLOW is
  /// provided for backward compatibility. We recommend using TERMINATE_CLUSTER
  /// instead.
  final String actionOnFailure;

  /// The JAR file used for the step.
  final HadoopJarStepConfig hadoopJarStep;

  StepConfig({
    @required this.name,
    this.actionOnFailure,
    @required this.hadoopJarStep,
  });
  static StepConfig fromJson(Map<String, dynamic> json) => StepConfig();
}

/// Combines the execution state and configuration of a step.
class StepDetail {
  /// The step configuration.
  final StepConfig stepConfig;

  /// The description of the step status.
  final StepExecutionStatusDetail executionStatusDetail;

  StepDetail({
    @required this.stepConfig,
    @required this.executionStatusDetail,
  });
  static StepDetail fromJson(Map<String, dynamic> json) => StepDetail();
}

/// The execution state of a step.
class StepExecutionStatusDetail {
  /// The state of the step.
  final String state;

  /// The creation date and time of the step.
  final DateTime creationDateTime;

  /// The start date and time of the step.
  final DateTime startDateTime;

  /// The completion date and time of the step.
  final DateTime endDateTime;

  /// A description of the step's current state.
  final String lastStateChangeReason;

  StepExecutionStatusDetail({
    @required this.state,
    @required this.creationDateTime,
    this.startDateTime,
    this.endDateTime,
    this.lastStateChangeReason,
  });
  static StepExecutionStatusDetail fromJson(Map<String, dynamic> json) =>
      StepExecutionStatusDetail();
}

/// The details of the step state change reason.
class StepStateChangeReason {
  /// The programmable code for the state change reason. Note: Currently, the
  /// service provides no code for the state change.
  final String code;

  /// The descriptive message for the state change reason.
  final String message;

  StepStateChangeReason({
    this.code,
    this.message,
  });
  static StepStateChangeReason fromJson(Map<String, dynamic> json) =>
      StepStateChangeReason();
}

/// The execution status details of the cluster step.
class StepStatus {
  /// The execution state of the cluster step.
  final String state;

  /// The reason for the step execution status change.
  final StepStateChangeReason stateChangeReason;

  /// The details for the step failure including reason, message, and log file
  /// path where the root cause was identified.
  final FailureDetails failureDetails;

  /// The timeline of the cluster step status over time.
  final StepTimeline timeline;

  StepStatus({
    this.state,
    this.stateChangeReason,
    this.failureDetails,
    this.timeline,
  });
  static StepStatus fromJson(Map<String, dynamic> json) => StepStatus();
}

/// The summary of the cluster step.
class StepSummary {
  /// The identifier of the cluster step.
  final String id;

  /// The name of the cluster step.
  final String name;

  /// The Hadoop job configuration of the cluster step.
  final HadoopStepConfig config;

  /// The action to take when the cluster step fails. Possible values are
  /// TERMINATE_CLUSTER, CANCEL_AND_WAIT, and CONTINUE. TERMINATE_JOB_FLOW is
  /// available for backward compatibility. We recommend using TERMINATE_CLUSTER
  /// instead.
  final String actionOnFailure;

  /// The current execution status details of the cluster step.
  final StepStatus status;

  StepSummary({
    this.id,
    this.name,
    this.config,
    this.actionOnFailure,
    this.status,
  });
  static StepSummary fromJson(Map<String, dynamic> json) => StepSummary();
}

/// The timeline of the cluster step lifecycle.
class StepTimeline {
  /// The date and time when the cluster step was created.
  final DateTime creationDateTime;

  /// The date and time when the cluster step execution started.
  final DateTime startDateTime;

  /// The date and time when the cluster step execution completed or failed.
  final DateTime endDateTime;

  StepTimeline({
    this.creationDateTime,
    this.startDateTime,
    this.endDateTime,
  });
  static StepTimeline fromJson(Map<String, dynamic> json) => StepTimeline();
}

/// The list of supported product configurations which allow user-supplied
/// arguments. EMR accepts these arguments and forwards them to the
/// corresponding installation script as bootstrap action arguments.
class SupportedProductConfig {
  /// The name of the product configuration.
  final String name;

  /// The list of user-supplied arguments.
  final List<String> args;

  SupportedProductConfig({
    this.name,
    this.args,
  });
}

/// A key/value pair containing user-defined metadata that you can associate
/// with an Amazon EMR resource. Tags make it easier to associate clusters in
/// various ways, such as grouping clusters to track your Amazon EMR resource
/// allocation costs. For more information, see
/// [Tag Clusters](https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-plan-tags.html).
class Tag {
  /// A user-defined key, which is the minimum required information for a valid
  /// tag. For more information, see
  /// [Tag](https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-plan-tags.html)
  /// .
  final String key;

  /// A user-defined value, which is optional in a tag. For more information,
  /// see
  /// [Tag Clusters](https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-plan-tags.html).
  final String value;

  Tag({
    this.key,
    this.value,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag();
}

/// EBS volume specifications such as volume type, IOPS, and size (GiB) that
/// will be requested for the EBS volume attached to an EC2 instance in the
/// cluster.
class VolumeSpecification {
  /// The volume type. Volume types supported are gp2, io1, standard.
  final String volumeType;

  /// The number of I/O operations per second (IOPS) that the volume supports.
  final int iops;

  /// The volume size, in gibibytes (GiB). This can be a number from 1 - 1024.
  /// If the volume type is EBS-optimized, the minimum value is 10.
  final int sizeInGB;

  VolumeSpecification({
    @required this.volumeType,
    this.iops,
    @required this.sizeInGB,
  });
  static VolumeSpecification fromJson(Map<String, dynamic> json) =>
      VolumeSpecification();
}
