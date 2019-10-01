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
  Future<void> addInstanceFleet(
      {@required String clusterId,
      @required InstanceFleetConfig instanceFleet}) async {}

  /// Adds one or more instance groups to a running cluster.
  Future<void> addInstanceGroups(
      {@required List<InstanceGroupConfig> instanceGroups,
      @required String jobFlowId}) async {}

  /// AddJobFlowSteps adds new steps to a running cluster. A maximum of 256
  /// steps are allowed in each job flow.
  ///
  /// If your cluster is long-running (such as a Hive data warehouse) or
  /// complex, you may require more than 256 steps to process your data. You can
  /// bypass the 256-step limitation in various ways, including using SSH to
  /// connect to the master node and submitting queries directly to the software
  /// running on the master node, such as Hive and Hadoop. For more information
  /// on how to do this, see [Add More than 256 Steps to a
  /// Cluster](https://docs.aws.amazon.com/emr/latest/ManagementGuide/AddMoreThan256Steps.html)
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
  Future<void> addJobFlowSteps(
      {@required String jobFlowId, @required List<StepConfig> steps}) async {}

  /// Adds tags to an Amazon EMR resource. Tags make it easier to associate
  /// clusters in various ways, such as grouping clusters to track your Amazon
  /// EMR resource allocation costs. For more information, see [Tag
  /// Clusters](https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-plan-tags.html).
  Future<void> addTags(
      {@required String resourceId, @required List<Tag> tags}) async {}

  /// Cancels a pending step or steps in a running cluster. Available only in
  /// Amazon EMR versions 4.8.0 and later, excluding version 5.0.0. A maximum of
  /// 256 steps are allowed in each CancelSteps request. CancelSteps is
  /// idempotent but asynchronous; it does not guarantee a step will be
  /// canceled, even if the request is successfully submitted. You can only
  /// cancel steps that are in a `PENDING` state.
  Future<void> cancelSteps({String clusterId, List<String> stepIds}) async {}

  /// Creates a security configuration, which is stored in the service and can
  /// be specified when a cluster is created.
  Future<void> createSecurityConfiguration(
      {@required String name, @required String securityConfiguration}) async {}

  /// Deletes a security configuration.
  Future<void> deleteSecurityConfiguration(String name) async {}

  /// Provides cluster-level details including status, hardware and software
  /// configuration, VPC settings, and so on.
  Future<void> describeCluster(String clusterId) async {}

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
  Future<void> describeJobFlows(
      {DateTime createdAfter,
      DateTime createdBefore,
      List<String> jobFlowIds,
      List<String> jobFlowStates}) async {}

  /// Provides the details of a security configuration by returning the
  /// configuration JSON.
  Future<void> describeSecurityConfiguration(String name) async {}

  /// Provides more detail about the cluster step.
  Future<void> describeStep(
      {@required String clusterId, @required String stepId}) async {}

  /// Returns the Amazon EMR block public access configuration for your AWS
  /// account in the current Region. For more information see [Configure Block
  /// Public Access for Amazon
  /// EMR](https://docs.aws.amazon.com/emr/latest/ManagementGuide/configure-block-public-access.html)
  /// in the _Amazon EMR Management Guide_.
  Future<void> getBlockPublicAccessConfiguration() async {}

  /// Provides information about the bootstrap actions associated with a
  /// cluster.
  Future<void> listBootstrapActions(String clusterId, {String marker}) async {}

  /// Provides the status of all clusters visible to this AWS account. Allows
  /// you to filter the list of clusters based on certain criteria; for example,
  /// filtering by cluster creation date and time or by status. This call
  /// returns a maximum of 50 clusters per call, but returns a marker to track
  /// the paging of the cluster list across multiple ListClusters calls.
  Future<void> listClusters(
      {DateTime createdAfter,
      DateTime createdBefore,
      List<String> clusterStates,
      String marker}) async {}

  /// Lists all available details about the instance fleets in a cluster.
  ///
  ///
  ///
  /// The instance fleet configuration is available only in Amazon EMR versions
  /// 4.8.0 and later, excluding 5.0.x versions.
  Future<void> listInstanceFleets(String clusterId, {String marker}) async {}

  /// Provides all available details about the instance groups in a cluster.
  Future<void> listInstanceGroups(String clusterId, {String marker}) async {}

  /// Provides information for all active EC2 instances and EC2 instances
  /// terminated in the last 30 days, up to a maximum of 2,000. EC2 instances in
  /// any of the following states are considered active: AWAITING_FULFILLMENT,
  /// PROVISIONING, BOOTSTRAPPING, RUNNING.
  Future<void> listInstances(String clusterId,
      {String instanceGroupId,
      List<String> instanceGroupTypes,
      String instanceFleetId,
      String instanceFleetType,
      List<String> instanceStates,
      String marker}) async {}

  /// Lists all the security configurations visible to this account, providing
  /// their creation dates and times, and their names. This call returns a
  /// maximum of 50 clusters per call, but returns a marker to track the paging
  /// of the cluster list across multiple ListSecurityConfigurations calls.
  Future<void> listSecurityConfigurations({String marker}) async {}

  /// Provides a list of steps for the cluster in reverse order unless you
  /// specify stepIds with the request.
  Future<void> listSteps(String clusterId,
      {List<String> stepStates, List<String> stepIds, String marker}) async {}

  /// Modifies the target On-Demand and target Spot capacities for the instance
  /// fleet with the specified InstanceFleetID within the cluster specified
  /// using ClusterID. The call either succeeds or fails atomically.
  ///
  ///
  ///
  /// The instance fleet configuration is available only in Amazon EMR versions
  /// 4.8.0 and later, excluding 5.0.x versions.
  Future<void> modifyInstanceFleet(
      {@required String clusterId,
      @required InstanceFleetModifyConfig instanceFleet}) async {}

  /// ModifyInstanceGroups modifies the number of nodes and configuration
  /// settings of an instance group. The input parameters include the new target
  /// instance count for the group and the instance group ID. The call will
  /// either succeed or fail atomically.
  Future<void> modifyInstanceGroups(
      {String clusterId,
      List<InstanceGroupModifyConfig> instanceGroups}) async {}

  /// Creates or updates an automatic scaling policy for a core instance group
  /// or task instance group in an Amazon EMR cluster. The automatic scaling
  /// policy defines how an instance group dynamically adds and terminates EC2
  /// instances in response to the value of a CloudWatch metric.
  Future<void> putAutoScalingPolicy(
      {@required String clusterId,
      @required String instanceGroupId,
      @required AutoScalingPolicy autoScalingPolicy}) async {}

  /// Creates or updates an Amazon EMR block public access configuration for
  /// your AWS account in the current Region. For more information see
  /// [Configure Block Public Access for Amazon
  /// EMR](https://docs.aws.amazon.com/emr/latest/ManagementGuide/configure-block-public-access.html)
  /// in the _Amazon EMR Management Guide_.
  Future<void> putBlockPublicAccessConfiguration(
      BlockPublicAccessConfiguration blockPublicAccessConfiguration) async {}

  /// Removes an automatic scaling policy from a specified instance group within
  /// an EMR cluster.
  Future<void> removeAutoScalingPolicy(
      {@required String clusterId, @required String instanceGroupId}) async {}

  /// Removes tags from an Amazon EMR resource. Tags make it easier to associate
  /// clusters in various ways, such as grouping clusters to track your Amazon
  /// EMR resource allocation costs. For more information, see [Tag
  /// Clusters](https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-plan-tags.html).
  ///
  /// The following example removes the stack tag with value Prod from a
  /// cluster:
  Future<void> removeTags(
      {@required String resourceId, @required List<String> tagKeys}) async {}

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
  /// information on how to do this, see [Add More than 256 Steps to a
  /// Cluster](https://docs.aws.amazon.com/emr/latest/ManagementGuide/AddMoreThan256Steps.html)
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
  Future<void> runJobFlow(
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
      KerberosAttributes kerberosAttributes}) async {}

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
  ///  For more information, see[Managing Cluster
  /// Termination](https://docs.aws.amazon.com/emr/latest/ManagementGuide/UsingEMR_TerminationProtection.html)
  /// in the _Amazon EMR Management Guide_.
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
  Future<void> terminateJobFlows(List<String> jobFlowIds) async {}
}

class AddInstanceFleetOutput {}

class AddInstanceGroupsOutput {}

class AddJobFlowStepsOutput {}

class AddTagsOutput {}

class Application {}

class AutoScalingPolicy {}

class AutoScalingPolicyDescription {}

class AutoScalingPolicyStateChangeReason {}

class AutoScalingPolicyStatus {}

class BlockPublicAccessConfiguration {}

class BlockPublicAccessConfigurationMetadata {}

class BootstrapActionConfig {}

class BootstrapActionDetail {}

class CancelStepsInfo {}

class CancelStepsOutput {}

class CloudWatchAlarmDefinition {}

class Cluster {}

class ClusterStateChangeReason {}

class ClusterStatus {}

class ClusterSummary {}

class ClusterTimeline {}

class Command {}

class Configuration {}

class CreateSecurityConfigurationOutput {}

class DeleteSecurityConfigurationOutput {}

class DescribeClusterOutput {}

class DescribeJobFlowsOutput {}

class DescribeSecurityConfigurationOutput {}

class DescribeStepOutput {}

class EbsBlockDevice {}

class EbsBlockDeviceConfig {}

class EbsConfiguration {}

class EbsVolume {}

class Ec2InstanceAttributes {}

class FailureDetails {}

class GetBlockPublicAccessConfigurationOutput {}

class HadoopJarStepConfig {}

class HadoopStepConfig {}

class Instance {}

class InstanceFleet {}

class InstanceFleetConfig {}

class InstanceFleetModifyConfig {}

class InstanceFleetProvisioningSpecifications {}

class InstanceFleetStateChangeReason {}

class InstanceFleetStatus {}

class InstanceFleetTimeline {}

class InstanceGroup {}

class InstanceGroupConfig {}

class InstanceGroupDetail {}

class InstanceGroupModifyConfig {}

class InstanceGroupStateChangeReason {}

class InstanceGroupStatus {}

class InstanceGroupTimeline {}

class InstanceResizePolicy {}

class InstanceStateChangeReason {}

class InstanceStatus {}

class InstanceTimeline {}

class InstanceTypeConfig {}

class InstanceTypeSpecification {}

class JobFlowDetail {}

class JobFlowExecutionStatusDetail {}

class JobFlowInstancesConfig {}

class JobFlowInstancesDetail {}

class KerberosAttributes {}

class KeyValue {}

class ListBootstrapActionsOutput {}

class ListClustersOutput {}

class ListInstanceFleetsOutput {}

class ListInstanceGroupsOutput {}

class ListInstancesOutput {}

class ListSecurityConfigurationsOutput {}

class ListStepsOutput {}

class MetricDimension {}

class PlacementType {}

class PortRange {}

class PutAutoScalingPolicyOutput {}

class PutBlockPublicAccessConfigurationOutput {}

class RemoveAutoScalingPolicyOutput {}

class RemoveTagsOutput {}

class RunJobFlowOutput {}

class ScalingAction {}

class ScalingConstraints {}

class ScalingRule {}

class ScalingTrigger {}

class ScriptBootstrapActionConfig {}

class SecurityConfigurationSummary {}

class ShrinkPolicy {}

class SimpleScalingPolicyConfiguration {}

class SpotProvisioningSpecification {}

class Step {}

class StepConfig {}

class StepDetail {}

class StepExecutionStatusDetail {}

class StepStateChangeReason {}

class StepStatus {}

class StepSummary {}

class StepTimeline {}

class SupportedProductConfig {}

class Tag {}

class VolumeSpecification {}
